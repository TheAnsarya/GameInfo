#!/usr/bin/env python3
"""
Secret of Mana Audio Extractor
Extracts SPC music data and BRR samples from the ROM.
"""

import os
import sys
import argparse
import struct
import json
from pathlib import Path

# SPC audio data locations (file offsets)
SPC_MUSIC_POINTERS = 0x033d39  # Pointer table for music tracks
SPC_SAMPLE_INDEX = 0x033f22   # Sample index table

# Known music tracks (file offsets)
MUSIC_TRACKS = {
	"into_the_thick_of_it": {"offset": 0x04d33d, "name": "Into the Thick of It"},
	"flight_into_unknown": {"offset": 0x050f43, "name": "Flight into the Unknown"},
	"star_of_darkness": {"offset": 0x05963f, "name": "Star of Darkness"},
	"prophecy": {"offset": 0x05fc56, "name": "Prophecy"},
	"danger": {"offset": 0x04f078, "name": "Danger"},
	"far_thunder": {"offset": 0x04fde4, "name": "Far Thunder"},
	"wind_never_ceases": {"offset": 0x0506b8, "name": "The Wind Never Ceases"},
}

# BRR sample format constants
BRR_BLOCK_SIZE = 9  # 9 bytes per BRR block (1 header + 8 data)
BRR_SAMPLES_PER_BLOCK = 16  # 16 samples per block


def read_brr_sample(rom_data: bytes, offset: int, max_blocks: int = 1024) -> tuple:
	"""
	Read a BRR sample starting at offset.
	Returns (sample_data, block_count, end_flag_found).
	
	BRR format:
	- Each block is 9 bytes
	- Byte 0: Header (end flag, loop flag, filter, range)
	- Bytes 1-8: Compressed sample data (4 bits per sample, 16 samples)
	"""
	blocks = []
	end_found = False
	
	for i in range(max_blocks):
		block_offset = offset + i * BRR_BLOCK_SIZE
		if block_offset + BRR_BLOCK_SIZE > len(rom_data):
			break
		
		header = rom_data[block_offset]
		data = rom_data[block_offset + 1:block_offset + BRR_BLOCK_SIZE]
		
		blocks.append({
			"header": header,
			"end": bool(header & 0x01),
			"loop": bool(header & 0x02),
			"filter": (header >> 2) & 0x03,
			"range": (header >> 4) & 0x0f,
			"data": list(data)
		})
		
		# Check for end flag
		if header & 0x01:
			end_found = True
			break
	
	return blocks, len(blocks), end_found


def decode_brr_to_pcm(blocks: list) -> list:
	"""
	Decode BRR blocks to 16-bit PCM samples.
	This is a simplified decoder - actual SPC700 decoding is more complex.
	"""
	samples = []
	prev1 = 0
	prev2 = 0
	
	# Filter coefficients
	filters = [
		(0, 0),
		(15/16, 0),
		(61/32, -15/16),
		(115/64, -13/16)
	]
	
	for block in blocks:
		range_shift = block["range"]
		filter_idx = block["filter"]
		f0, f1 = filters[filter_idx]
		
		for byte in block["data"]:
			# Each byte has 2 samples (4 bits each)
			for nibble_idx in range(2):
				if nibble_idx == 0:
					nibble = (byte >> 4) & 0x0f
				else:
					nibble = byte & 0x0f
				
				# Sign extend
				if nibble >= 8:
					nibble -= 16
				
				# Apply range
				sample = nibble << range_shift
				
				# Apply filter
				sample = int(sample + f0 * prev1 + f1 * prev2)
				
				# Clamp to 16-bit
				sample = max(-32768, min(32767, sample))
				
				samples.append(sample)
				prev2 = prev1
				prev1 = sample
	
	return samples


def export_sample_to_wav(samples: list, output_path: str, sample_rate: int = 32000):
	"""Export PCM samples to WAV file."""
	import wave
	
	with wave.open(output_path, "wb") as wav:
		wav.setnchannels(1)
		wav.setsampwidth(2)
		wav.setframerate(sample_rate)
		
		# Convert to bytes
		data = b""
		for sample in samples:
			data += struct.pack("<h", sample)
		
		wav.writeframes(data)


def export_brr_raw(blocks: list, output_path: str):
	"""Export raw BRR data."""
	with open(output_path, "wb") as f:
		for block in blocks:
			f.write(bytes([block["header"]]))
			f.write(bytes(block["data"]))


def analyze_spc_sequence(rom_data: bytes, offset: int, max_bytes: int = 1024) -> list:
	"""
	Analyze SPC music sequence data.
	Returns list of parsed commands.
	"""
	commands = []
	pos = 0
	
	while pos < max_bytes:
		if offset + pos >= len(rom_data):
			break
		
		cmd = rom_data[offset + pos]
		
		# Note commands (0x00-0xbf)
		if cmd < 0xc0:
			if cmd <= 0x0d:
				commands.append({"pos": pos, "type": "note", "note": "C", "value": cmd})
			elif cmd <= 0x1b:
				commands.append({"pos": pos, "type": "note", "note": "C#", "value": cmd})
			elif cmd <= 0x29:
				commands.append({"pos": pos, "type": "note", "note": "D", "value": cmd})
			elif cmd <= 0xbf:
				commands.append({"pos": pos, "type": "note", "value": cmd})
			pos += 1
		# Rest commands (0xc0-0xce)
		elif 0xc0 <= cmd <= 0xce:
			commands.append({"pos": pos, "type": "rest", "value": cmd})
			pos += 1
		# Control commands
		elif cmd == 0xd2:  # Volume
			if offset + pos + 1 < len(rom_data):
				param = rom_data[offset + pos + 1]
				commands.append({"pos": pos, "type": "volume", "value": param})
				pos += 2
			else:
				break
		elif cmd == 0xd4:  # Pan
			if offset + pos + 1 < len(rom_data):
				param = rom_data[offset + pos + 1]
				commands.append({"pos": pos, "type": "pan", "value": param})
				pos += 2
			else:
				break
		elif cmd == 0xd7:  # Vibrato
			if offset + pos + 3 < len(rom_data):
				commands.append({
					"pos": pos, 
					"type": "vibrato",
					"speed": rom_data[offset + pos + 1],
					"time": rom_data[offset + pos + 2],
					"depth": rom_data[offset + pos + 3]
				})
				pos += 4
			else:
				break
		elif cmd == 0xe0:  # Vibrato off
			commands.append({"pos": pos, "type": "vibrato_off"})
			pos += 1
		elif cmd == 0xe4:  # Pitch
			if offset + pos + 1 < len(rom_data):
				commands.append({"pos": pos, "type": "pitch", "value": rom_data[offset + pos + 1]})
				pos += 2
			else:
				break
		elif cmd == 0xe5:  # Note length
			if offset + pos + 1 < len(rom_data):
				commands.append({"pos": pos, "type": "length", "value": rom_data[offset + pos + 1]})
				pos += 2
			else:
				break
		elif cmd == 0xea:  # Instrument
			if offset + pos + 1 < len(rom_data):
				commands.append({"pos": pos, "type": "instrument", "value": rom_data[offset + pos + 1]})
				pos += 2
			else:
				break
		elif cmd == 0xf2:  # End channel
			commands.append({"pos": pos, "type": "end_channel"})
			pos += 1
			break
		elif cmd == 0xf3:  # Tempo
			if offset + pos + 1 < len(rom_data):
				commands.append({"pos": pos, "type": "tempo", "value": rom_data[offset + pos + 1]})
				pos += 2
			else:
				break
		elif cmd == 0xf5:  # Reverb
			if offset + pos + 1 < len(rom_data):
				commands.append({"pos": pos, "type": "reverb", "value": rom_data[offset + pos + 1]})
				pos += 2
			else:
				break
		elif cmd == 0xf8:  # Global volume
			if offset + pos + 1 < len(rom_data):
				commands.append({"pos": pos, "type": "global_volume", "value": rom_data[offset + pos + 1]})
				pos += 2
			else:
				break
		elif cmd == 0xff:  # End sequence
			commands.append({"pos": pos, "type": "end_sequence"})
			pos += 1
			break
		else:
			# Unknown command
			commands.append({"pos": pos, "type": "unknown", "value": cmd})
			pos += 1
	
	return commands


def main():
	parser = argparse.ArgumentParser(description="Secret of Mana Audio Extractor")
	parser.add_argument("--rom", required=True, help="Path to ROM file")
	parser.add_argument("--output", required=True, help="Output directory")
	parser.add_argument("--track", help="Specific track to analyze")
	parser.add_argument("--sample-offset", type=lambda x: int(x, 0), help="BRR sample offset")
	parser.add_argument("--export-wav", action="store_true", help="Export BRR as WAV")
	
	args = parser.parse_args()
	
	# Read ROM
	with open(args.rom, "rb") as f:
		rom_data = f.read()
	
	print(f"Loaded ROM: {len(rom_data)} bytes")
	
	# Create output directories
	output_path = Path(args.output)
	(output_path / "music").mkdir(parents=True, exist_ok=True)
	(output_path / "samples").mkdir(parents=True, exist_ok=True)
	
	if args.sample_offset:
		# Extract specific BRR sample
		print(f"\nExtracting BRR sample at 0x{args.sample_offset:06x}...")
		blocks, count, end_found = read_brr_sample(rom_data, args.sample_offset)
		print(f"  Blocks: {count}, End flag: {end_found}")
		
		# Export raw BRR
		brr_file = output_path / "samples" / f"sample_{args.sample_offset:06x}.brr"
		export_brr_raw(blocks, str(brr_file))
		print(f"  Saved: {brr_file}")
		
		if args.export_wav:
			# Decode and export as WAV
			samples = decode_brr_to_pcm(blocks)
			wav_file = output_path / "samples" / f"sample_{args.sample_offset:06x}.wav"
			export_sample_to_wav(samples, str(wav_file))
			print(f"  Saved: {wav_file}")
	
	elif args.track:
		# Analyze specific track
		if args.track in MUSIC_TRACKS:
			track = MUSIC_TRACKS[args.track]
			print(f"\nAnalyzing track: {track['name']}")
			print(f"  Offset: 0x{track['offset']:06x}")
			
			commands = analyze_spc_sequence(rom_data, track["offset"])
			print(f"  Commands found: {len(commands)}")
			
			# Save analysis
			out_file = output_path / "music" / f"{args.track}.json"
			with open(out_file, "w") as f:
				json.dump({
					"name": track["name"],
					"offset": f"0x{track['offset']:06x}",
					"commands": commands
				}, f, indent="\t")
			print(f"  Saved: {out_file}")
			
			# Show sample commands
			print("\n  First 20 commands:")
			for cmd in commands[:20]:
				print(f"    {cmd}")
		else:
			print(f"Unknown track: {args.track}")
			print(f"Available: {', '.join(MUSIC_TRACKS.keys())}")
	
	else:
		# Analyze all known tracks
		print("\nAnalyzing all known music tracks...")
		
		track_info = []
		for track_id, track in MUSIC_TRACKS.items():
			print(f"  {track_id}: {track['name']}...")
			commands = analyze_spc_sequence(rom_data, track["offset"])
			
			out_file = output_path / "music" / f"{track_id}.json"
			with open(out_file, "w") as f:
				json.dump({
					"name": track["name"],
					"offset": f"0x{track['offset']:06x}",
					"command_count": len(commands),
					"commands": commands
				}, f, indent="\t")
			
			track_info.append({
				"id": track_id,
				"name": track["name"],
				"offset": f"0x{track['offset']:06x}",
				"command_count": len(commands)
			})
		
		# Save track index
		index_file = output_path / "music" / "index.json"
		with open(index_file, "w") as f:
			json.dump(track_info, f, indent="\t")
		print(f"\nSaved track index: {index_file}")
	
	print("\nDone!")


if __name__ == "__main__":
	main()
