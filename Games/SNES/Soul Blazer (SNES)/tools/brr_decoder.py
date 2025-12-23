#!/usr/bin/env python3
"""
Soul Blazer - BRR Sample Decoder
Decodes SNES BRR (Bit Rate Reduction) audio samples to WAV format.
"""

import argparse
import struct
import wave
import os
from dataclasses import dataclass
from typing import List, Optional, Tuple, BinaryIO
from enum import IntEnum


class BRRFilter(IntEnum):
	"""BRR filter modes for sample prediction."""
	DIRECT = 0       # No filtering
	SHIFT_15_16 = 1  # prev * 15/16
	SHIFT_61_32 = 2  # prev * 61/32 - prev2 * 15/16
	SHIFT_115_64 = 3 # prev * 115/64 - prev2 * 13/16


@dataclass
class BRRBlock:
	"""A single 9-byte BRR block."""
	shift: int          # Range/shift amount (0-12)
	filter_mode: int    # Filter type (0-3)
	loop_flag: bool     # Loop point marker
	end_flag: bool      # End of sample
	samples: List[int]  # 16 decoded samples


@dataclass
class BRRSample:
	"""A complete BRR sample."""
	name: str
	offset: int
	size: int
	loop_point: int     # Offset of loop start (-1 if no loop)
	sample_rate: int    # Estimated sample rate
	blocks: List[BRRBlock]
	pcm_data: List[int] # Decoded 16-bit PCM samples


@dataclass
class SampleEntry:
	"""Sample directory entry."""
	id: int
	name: str
	offset: int
	loop_offset: int
	adsr: int
	description: str


class BRRDecoder:
	"""Decodes SNES BRR audio samples."""

	# Known Soul Blazer sample directory
	SAMPLE_DIRECTORY: List[SampleEntry] = [
		SampleEntry(0x00, "Strings", 0x0F8000, -1, 0xA0F0, "Sustained strings"),
		SampleEntry(0x01, "Flute", 0x0F8240, -1, 0x80E8, "Woodwind flute"),
		SampleEntry(0x02, "Brass", 0x0F83F0, -1, 0xB0F0, "Brass section"),
		SampleEntry(0x03, "Piano", 0x0F8510, -1, 0x90D8, "Grand piano"),
		SampleEntry(0x04, "Organ", 0x0F8870, -1, 0xA0E8, "Pipe organ"),
		SampleEntry(0x05, "Choir", 0x0F8B40, -1, 0x80E0, "Vocal choir"),
		SampleEntry(0x06, "Bell", 0x0F8D80, -1, 0x60C8, "Bell tone"),
		SampleEntry(0x07, "Harp", 0x0F8EE8, -1, 0x70D0, "Harp pluck"),
		SampleEntry(0x08, "Guitar", 0x0F9098, -1, 0x90E0, "Acoustic guitar"),
		SampleEntry(0x09, "Bass", 0x0F9518, -1, 0xB0F8, "Bass guitar"),
		SampleEntry(0x0A, "Synth Lead", 0x0F9638, -1, 0x80E8, "Synth lead"),
		SampleEntry(0x0B, "Synth Pad", 0x0F9908, -1, 0xA0F0, "Synth pad"),
		SampleEntry(0x0C, "Kick", 0x0F9B48, -1, 0xF0FF, "Kick drum"),
		SampleEntry(0x0D, "Snare", 0x0F9C20, -1, 0xF0FF, "Snare drum"),
		SampleEntry(0x0E, "HiHat Closed", 0x0F9CB0, -1, 0xF0FF, "Closed hi-hat"),
		SampleEntry(0x0F, "HiHat Open", 0x0F9D40, -1, 0xE0F0, "Open hi-hat"),
		SampleEntry(0x10, "Tom", 0x0F9DF4, -1, 0xF0FF, "Tom drum"),
		SampleEntry(0x11, "Cymbal", 0x0F9F14, -1, 0xD0E8, "Crash cymbal"),
		SampleEntry(0x12, "Timpani", 0x0F9FA4, -1, 0xB0F0, "Timpani"),
		SampleEntry(0x13, "Triangle", 0x0FA154, -1, 0x60B0, "Triangle"),
		SampleEntry(0x14, "Sword SFX", 0x0FA22C, -1, 0xF0FF, "Sword slash"),
		SampleEntry(0x15, "Hit SFX", 0x0FA46C, -1, 0xF0FF, "Hit impact"),
		SampleEntry(0x16, "Magic SFX", 0x0FA5D4, -1, 0xE0F8, "Magic cast"),
		SampleEntry(0x17, "Explosion", 0x0FA784, -1, 0xF0FF, "Explosion"),
		SampleEntry(0x18, "Whoosh", 0x0FAA0C, -1, 0xD0E8, "Whoosh sound"),
		SampleEntry(0x19, "Pickup", 0x0FAAE4, -1, 0xE0F0, "Item pickup"),
		SampleEntry(0x1A, "Fanfare", 0x0FAD24, -1, 0x90E0, "Victory fanfare"),
		SampleEntry(0x1B, "Choir Hit", 0x0FAED4, -1, 0xA0E8, "Choir hit"),
		SampleEntry(0x1C, "Alert", 0x0FB000, -1, 0xE0F8, "Alert sound"),
		SampleEntry(0x1D, "Wind", 0x0FB15C, -1, 0x80D0, "Wind ambient"),
		SampleEntry(0x1E, "Water", 0x0FB39C, -1, 0x70C8, "Water ambient"),
		SampleEntry(0x1F, "Ghost", 0x0FB5DC, -1, 0x90E0, "Ghost sound"),
	]

	# Default output sample rate
	DEFAULT_SAMPLE_RATE = 32000

	def __init__(self, rom_path: Optional[str] = None):
		"""Initialize decoder with optional ROM file."""
		self.rom_data: Optional[bytes] = None
		if rom_path:
			self.load_rom(rom_path)

	def load_rom(self, rom_path: str):
		"""Load ROM file into memory."""
		with open(rom_path, "rb") as f:
			self.rom_data = f.read()
		print(f"Loaded ROM: {rom_path} ({len(self.rom_data):,} bytes)")

	def decode_block(self, data: bytes, prev1: int = 0, prev2: int = 0) -> Tuple[BRRBlock, int, int]:
		"""
		Decode a single 9-byte BRR block.

		Args:
			data: 9 bytes of BRR data
			prev1: Previous sample value (for filtering)
			prev2: Sample before previous (for filtering)

		Returns:
			Tuple of (BRRBlock, new_prev1, new_prev2)
		"""
		if len(data) < 9:
			raise ValueError(f"BRR block requires 9 bytes, got {len(data)}")

		# Parse header byte
		header = data[0]
		shift = (header >> 4) & 0x0F  # Bits 7-4
		filter_mode = (header >> 2) & 0x03  # Bits 3-2
		loop_flag = bool(header & 0x02)  # Bit 1
		end_flag = bool(header & 0x01)  # Bit 0

		# Clamp shift to valid range
		if shift > 12:
			shift = 12

		# Decode 16 samples from 8 bytes (4 bits each)
		samples = []
		for i in range(8):
			byte = data[1 + i]
			# High nibble first, then low nibble
			for nibble_idx in [4, 0]:
				nibble = (byte >> nibble_idx) & 0x0F
				# Sign extend from 4 bits
				if nibble >= 8:
					nibble -= 16

				# Apply shift
				sample = nibble << shift

				# Apply filter
				if filter_mode == BRRFilter.DIRECT:
					# No filtering
					pass
				elif filter_mode == BRRFilter.SHIFT_15_16:
					# prev * 15/16
					sample += prev1 - (prev1 >> 4)
				elif filter_mode == BRRFilter.SHIFT_61_32:
					# prev * 61/32 - prev2 * 15/16
					sample += (prev1 << 1) - (prev1 >> 5) - prev2 + (prev2 >> 4)
				elif filter_mode == BRRFilter.SHIFT_115_64:
					# prev * 115/64 - prev2 * 13/16
					sample += (prev1 << 1) - (prev1 >> 6) - prev2 + (prev2 >> 4) - (prev2 >> 6)

				# Clamp to 16-bit signed range
				sample = max(-32768, min(32767, sample))

				samples.append(sample)
				prev2 = prev1
				prev1 = sample

		block = BRRBlock(
			shift=shift,
			filter_mode=filter_mode,
			loop_flag=loop_flag,
			end_flag=end_flag,
			samples=samples
		)

		return block, prev1, prev2

	def decode_sample(self, data: bytes, name: str = "sample",
					  offset: int = 0, max_blocks: int = 1000) -> BRRSample:
		"""
		Decode a complete BRR sample from raw data.

		Args:
			data: Raw BRR data bytes
			name: Sample name
			offset: File offset (for reference)
			max_blocks: Maximum blocks to decode (safety limit)

		Returns:
			BRRSample with decoded PCM data
		"""
		blocks = []
		pcm_data = []
		prev1, prev2 = 0, 0
		loop_point = -1
		pos = 0

		while pos + 9 <= len(data) and len(blocks) < max_blocks:
			block_data = data[pos:pos + 9]
			block, prev1, prev2 = self.decode_block(block_data, prev1, prev2)
			blocks.append(block)
			pcm_data.extend(block.samples)

			if block.loop_flag and loop_point < 0:
				loop_point = pos

			pos += 9

			if block.end_flag:
				break

		return BRRSample(
			name=name,
			offset=offset,
			size=pos,
			loop_point=loop_point,
			sample_rate=self.DEFAULT_SAMPLE_RATE,
			blocks=blocks,
			pcm_data=pcm_data
		)

	def decode_from_rom(self, offset: int, name: str = "sample",
						max_size: int = 0x10000) -> Optional[BRRSample]:
		"""
		Decode a BRR sample from the loaded ROM.

		Args:
			offset: File offset in ROM
			name: Sample name
			max_size: Maximum bytes to read

		Returns:
			BRRSample or None if ROM not loaded
		"""
		if not self.rom_data:
			print("Error: No ROM loaded")
			return None

		if offset >= len(self.rom_data):
			print(f"Error: Offset 0x{offset:06X} beyond ROM size")
			return None

		end = min(offset + max_size, len(self.rom_data))
		data = self.rom_data[offset:end]

		return self.decode_sample(data, name, offset)

	def decode_all_samples(self) -> List[BRRSample]:
		"""Decode all known samples from the loaded ROM."""
		samples = []

		for entry in self.SAMPLE_DIRECTORY:
			sample = self.decode_from_rom(entry.offset, entry.name)
			if sample:
				samples.append(sample)
				print(f"  Decoded: {entry.name} - {len(sample.pcm_data)} samples "
					  f"({len(sample.blocks)} blocks)")

		return samples

	def save_wav(self, sample: BRRSample, filepath: str,
				 sample_rate: Optional[int] = None):
		"""
		Save decoded sample to WAV file.

		Args:
			sample: Decoded BRR sample
			filepath: Output WAV file path
			sample_rate: Override sample rate (default: 32000)
		"""
		rate = sample_rate or sample.sample_rate

		with wave.open(filepath, "wb") as wav:
			wav.setnchannels(1)  # Mono
			wav.setsampwidth(2)  # 16-bit
			wav.setframerate(rate)

			# Pack samples as 16-bit signed integers
			pcm_bytes = struct.pack(f"<{len(sample.pcm_data)}h", *sample.pcm_data)
			wav.writeframes(pcm_bytes)

		print(f"Saved: {filepath} ({len(sample.pcm_data)} samples @ {rate} Hz)")

	def export_all(self, output_dir: str, sample_rate: Optional[int] = None):
		"""
		Export all known samples to WAV files.

		Args:
			output_dir: Output directory
			sample_rate: Override sample rate
		"""
		os.makedirs(output_dir, exist_ok=True)

		samples = self.decode_all_samples()
		for sample in samples:
			safe_name = sample.name.replace(" ", "_").replace("/", "_")
			filepath = os.path.join(output_dir, f"{safe_name}.wav")
			self.save_wav(sample, filepath, sample_rate)

	def analyze_sample(self, sample: BRRSample) -> dict:
		"""
		Analyze a decoded sample and return statistics.

		Args:
			sample: Decoded BRR sample

		Returns:
			Dictionary with analysis results
		"""
		if not sample.pcm_data:
			return {"error": "No sample data"}

		# Basic statistics
		min_val = min(sample.pcm_data)
		max_val = max(sample.pcm_data)
		avg_val = sum(sample.pcm_data) / len(sample.pcm_data)

		# RMS (root mean square) for loudness
		rms = (sum(s * s for s in sample.pcm_data) / len(sample.pcm_data)) ** 0.5

		# Count filter usage
		filter_counts = [0, 0, 0, 0]
		for block in sample.blocks:
			filter_counts[block.filter_mode] += 1

		# Duration
		duration_ms = (len(sample.pcm_data) / sample.sample_rate) * 1000

		return {
			"name": sample.name,
			"offset": f"0x{sample.offset:06X}",
			"size_bytes": sample.size,
			"num_blocks": len(sample.blocks),
			"num_samples": len(sample.pcm_data),
			"duration_ms": round(duration_ms, 2),
			"sample_rate": sample.sample_rate,
			"min_amplitude": min_val,
			"max_amplitude": max_val,
			"avg_amplitude": round(avg_val, 2),
			"rms": round(rms, 2),
			"has_loop": sample.loop_point >= 0,
			"loop_offset": sample.loop_point if sample.loop_point >= 0 else None,
			"filter_usage": {
				"direct": filter_counts[0],
				"shift_15_16": filter_counts[1],
				"shift_61_32": filter_counts[2],
				"shift_115_64": filter_counts[3],
			}
		}

	def print_sample_info(self, sample: BRRSample):
		"""Print detailed sample information."""
		info = self.analyze_sample(sample)

		print(f"\n{info['name']}")
		print("=" * 40)
		print(f"Offset: {info['offset']}")
		print(f"Size: {info['size_bytes']} bytes ({info['num_blocks']} blocks)")
		print(f"Samples: {info['num_samples']} ({info['duration_ms']} ms)")
		print(f"Sample Rate: {info['sample_rate']} Hz")
		print(f"Amplitude: {info['min_amplitude']} to {info['max_amplitude']}")
		print(f"RMS: {info['rms']}")
		print(f"Has Loop: {info['has_loop']}")
		if info['has_loop']:
			print(f"Loop Offset: 0x{info['loop_offset']:04X}")
		print(f"Filter Usage:")
		for name, count in info['filter_usage'].items():
			if count > 0:
				print(f"  {name}: {count} blocks")

	def list_samples(self):
		"""Print list of known samples."""
		print("\nKnown Soul Blazer Samples")
		print("=" * 70)
		print(f"{'ID':>4} {'Name':<20} {'Offset':>10} {'ADSR':>6} {'Description':<25}")
		print("-" * 70)

		for entry in self.SAMPLE_DIRECTORY:
			print(f"0x{entry.id:02X} {entry.name:<20} 0x{entry.offset:06X} "
				  f"0x{entry.adsr:04X} {entry.description:<25}")


def scan_for_brr(data: bytes, min_blocks: int = 4) -> List[Tuple[int, int]]:
	"""
	Scan binary data for potential BRR samples.

	Args:
		data: Binary data to scan
		min_blocks: Minimum blocks to consider valid

	Returns:
		List of (offset, size) tuples for potential samples
	"""
	candidates = []
	pos = 0

	while pos + 9 <= len(data):
		# Check if this could be a valid BRR header
		header = data[pos]
		shift = (header >> 4) & 0x0F
		filter_mode = (header >> 2) & 0x03

		# Shift should be 0-12, filter 0-3
		if shift <= 12:
			# Try to decode forward
			block_count = 0
			scan_pos = pos
			valid = True

			while scan_pos + 9 <= len(data) and block_count < 1000:
				block_header = data[scan_pos]
				block_shift = (block_header >> 4) & 0x0F

				if block_shift > 12:
					valid = False
					break

				block_count += 1
				end_flag = block_header & 0x01

				if end_flag:
					break

				scan_pos += 9

			if valid and block_count >= min_blocks:
				sample_size = (block_count * 9)
				candidates.append((pos, sample_size))
				pos = scan_pos + 9
				continue

		pos += 1

	return candidates


def main():
	parser = argparse.ArgumentParser(
		description="Soul Blazer BRR Sample Decoder"
	)

	parser.add_argument("rom", nargs="?", help="ROM file to process")
	parser.add_argument("--list", action="store_true",
						help="List known samples")
	parser.add_argument("--decode", type=str, metavar="ID",
						help="Decode specific sample (hex ID or name)")
	parser.add_argument("--decode-all", action="store_true",
						help="Decode all known samples")
	parser.add_argument("--offset", type=str,
						help="Decode from specific ROM offset (hex)")
	parser.add_argument("--output", "-o", type=str, default=".",
						help="Output directory for WAV files")
	parser.add_argument("--rate", type=int, default=32000,
						help="Sample rate for output (default: 32000)")
	parser.add_argument("--analyze", action="store_true",
						help="Analyze samples without saving")
	parser.add_argument("--scan", action="store_true",
						help="Scan ROM for BRR samples")
	parser.add_argument("--scan-start", type=str, default="0",
						help="Scan start offset (hex)")
	parser.add_argument("--scan-end", type=str,
						help="Scan end offset (hex)")

	args = parser.parse_args()
	decoder = BRRDecoder()

	if args.list:
		decoder.list_samples()
		return

	if not args.rom:
		parser.print_help()
		print("\nExamples:")
		print("  python brr_decoder.py --list")
		print("  python brr_decoder.py game.sfc --decode-all -o samples/")
		print("  python brr_decoder.py game.sfc --decode 0x00")
		print("  python brr_decoder.py game.sfc --offset 0x0F8000 -o sample.wav")
		print("  python brr_decoder.py game.sfc --scan")
		return

	# Load ROM
	decoder.load_rom(args.rom)

	if args.scan:
		# Scan for BRR samples
		start = int(args.scan_start, 16) if args.scan_start else 0
		end = int(args.scan_end, 16) if args.scan_end else len(decoder.rom_data)

		print(f"\nScanning for BRR samples: 0x{start:06X} - 0x{end:06X}")
		print("=" * 50)

		data = decoder.rom_data[start:end]
		candidates = scan_for_brr(data)

		print(f"Found {len(candidates)} potential samples:")
		for offset, size in candidates[:50]:  # Limit output
			real_offset = start + offset
			blocks = size // 9
			print(f"  0x{real_offset:06X} - {size} bytes ({blocks} blocks)")

		if len(candidates) > 50:
			print(f"  ... and {len(candidates) - 50} more")

	elif args.decode_all:
		print("\nDecoding all known samples...")
		decoder.export_all(args.output, args.rate)

	elif args.decode:
		# Find sample by ID or name
		sample_id = args.decode.lower()
		entry = None

		for e in decoder.SAMPLE_DIRECTORY:
			if sample_id == f"0x{e.id:02x}" or sample_id == str(e.id) or \
			   sample_id == e.name.lower():
				entry = e
				break

		if not entry:
			print(f"Sample not found: {args.decode}")
			print("Use --list to see available samples")
			return

		sample = decoder.decode_from_rom(entry.offset, entry.name)
		if sample:
			if args.analyze:
				decoder.print_sample_info(sample)
			else:
				os.makedirs(args.output, exist_ok=True)
				safe_name = entry.name.replace(" ", "_")
				filepath = os.path.join(args.output, f"{safe_name}.wav")
				decoder.save_wav(sample, filepath, args.rate)

	elif args.offset:
		# Decode from specific offset
		offset = int(args.offset, 16)
		sample = decoder.decode_from_rom(offset, f"sample_{offset:06X}")

		if sample:
			if args.analyze:
				decoder.print_sample_info(sample)
			else:
				os.makedirs(args.output, exist_ok=True)
				filepath = os.path.join(args.output, f"sample_{offset:06X}.wav")
				decoder.save_wav(sample, filepath, args.rate)

	else:
		# Default: analyze all known samples
		print("\nAnalyzing known samples...")
		samples = decoder.decode_all_samples()
		for sample in samples:
			decoder.print_sample_info(sample)


if __name__ == "__main__":
	main()
