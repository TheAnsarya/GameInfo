#!/usr/bin/env python3
"""
NSF Music Info Tool

Parse and display information about NSF (NES Sound Format) music files.
Extract track listings, analyze APU usage, and export metadata.
"""

import argparse
import json
import struct
from pathlib import Path
from typing import List, Optional, Dict


class NSFHeader:
	"""NSF file header parser."""

	def __init__(self, data: bytes):
		self.valid = False
		self.version = 0
		self.total_songs = 0
		self.starting_song = 0
		self.load_address = 0
		self.init_address = 0
		self.play_address = 0
		self.song_name = ""
		self.artist = ""
		self.copyright = ""
		self.ntsc_speed = 0
		self.bankswitch = []
		self.pal_speed = 0
		self.pal_ntsc_bits = 0
		self.extra_chips = 0
		self.expansion_audio = []
		self.nsf2_flags = 0
		self.program_length = 0
		self.is_nsf2 = False

		self._parse(data)

	def _parse(self, data: bytes):
		"""Parse NSF header."""
		if len(data) < 128:
			return

		# Check magic
		if data[:5] != b'NESM\x1a':
			return

		self.valid = True
		self.version = data[5]
		self.total_songs = data[6]
		self.starting_song = data[7]
		self.load_address = struct.unpack('<H', data[8:10])[0]
		self.init_address = struct.unpack('<H', data[10:12])[0]
		self.play_address = struct.unpack('<H', data[12:14])[0]

		# Strings (null-terminated, 32 bytes each)
		self.song_name = data[14:46].rstrip(b'\x00').decode('ascii', errors='replace')
		self.artist = data[46:78].rstrip(b'\x00').decode('ascii', errors='replace')
		self.copyright = data[78:110].rstrip(b'\x00').decode('ascii', errors='replace')

		# Timing
		self.ntsc_speed = struct.unpack('<H', data[110:112])[0]
		self.bankswitch = list(data[112:120])
		self.pal_speed = struct.unpack('<H', data[120:122])[0]
		self.pal_ntsc_bits = data[122]

		# Expansion audio
		self.extra_chips = data[123]
		self._parse_expansion_audio()

		# NSF2 extensions
		if self.version >= 2:
			self.is_nsf2 = True
			self.nsf2_flags = data[124]
			self.program_length = struct.unpack('<I', data[125:128] + b'\x00')[0]

	def _parse_expansion_audio(self):
		"""Parse expansion audio chip flags."""
		chips = []
		if self.extra_chips & 0x01:
			chips.append("VRC6")
		if self.extra_chips & 0x02:
			chips.append("VRC7")
		if self.extra_chips & 0x04:
			chips.append("FDS")
		if self.extra_chips & 0x08:
			chips.append("MMC5")
		if self.extra_chips & 0x10:
			chips.append("Namco 163")
		if self.extra_chips & 0x20:
			chips.append("Sunsoft 5B")
		if self.extra_chips & 0x40:
			chips.append("VT02+")
		self.expansion_audio = chips

	def get_region(self) -> str:
		"""Get region compatibility."""
		if self.pal_ntsc_bits == 0:
			return "NTSC"
		elif self.pal_ntsc_bits == 1:
			return "PAL"
		elif self.pal_ntsc_bits == 2:
			return "Dual (NTSC/PAL)"
		return "Unknown"

	def uses_bankswitch(self) -> bool:
		"""Check if NSF uses bankswitching."""
		return any(b != 0 for b in self.bankswitch)

	def get_ntsc_hz(self) -> float:
		"""Get NTSC playback rate in Hz."""
		if self.ntsc_speed > 0:
			return 1000000.0 / self.ntsc_speed
		return 60.0

	def get_pal_hz(self) -> float:
		"""Get PAL playback rate in Hz."""
		if self.pal_speed > 0:
			return 1000000.0 / self.pal_speed
		return 50.0

	def to_dict(self) -> dict:
		return {
			"version": self.version,
			"is_nsf2": self.is_nsf2,
			"total_songs": self.total_songs,
			"starting_song": self.starting_song,
			"song_name": self.song_name,
			"artist": self.artist,
			"copyright": self.copyright,
			"load_address": f"${self.load_address:04X}",
			"init_address": f"${self.init_address:04X}",
			"play_address": f"${self.play_address:04X}",
			"region": self.get_region(),
			"ntsc_speed_us": self.ntsc_speed,
			"ntsc_hz": round(self.get_ntsc_hz(), 2),
			"pal_speed_us": self.pal_speed,
			"pal_hz": round(self.get_pal_hz(), 2),
			"uses_bankswitch": self.uses_bankswitch(),
			"bankswitch_init": [f"${b:02X}" for b in self.bankswitch],
			"expansion_audio": self.expansion_audio,
		}


class NSF2Metadata:
	"""NSF2 extended metadata parser."""

	def __init__(self, data: bytes, header: NSFHeader):
		self.track_names: List[str] = []
		self.track_times: List[int] = []  # in milliseconds
		self.track_fades: List[int] = []  # in milliseconds
		self.ripper = ""
		self.header = header

		if header.is_nsf2:
			self._parse_metadata(data)

	def _parse_metadata(self, data: bytes):
		"""Parse NSF2 metadata chunks."""
		# NSF2 can have metadata after the main data
		# This is a simplified parser - full NSF2 has complex chunk format
		pass

	def get_track_info(self, track: int) -> dict:
		"""Get info for a specific track."""
		info = {"track": track}

		if track - 1 < len(self.track_names):
			info["name"] = self.track_names[track - 1]

		if track - 1 < len(self.track_times):
			ms = self.track_times[track - 1]
			info["duration"] = f"{ms // 60000}:{(ms % 60000) // 1000:02d}"
			info["duration_ms"] = ms

		if track - 1 < len(self.track_fades):
			info["fade_ms"] = self.track_fades[track - 1]

		return info


class NSFFile:
	"""Full NSF file handler."""

	def __init__(self, path: str):
		self.path = Path(path)
		self.data = self.path.read_bytes()
		self.header = NSFHeader(self.data)
		self.metadata = NSF2Metadata(self.data, self.header)
		self.prg_data = self.data[128:] if len(self.data) > 128 else b''

	def is_valid(self) -> bool:
		return self.header.valid

	def get_info(self) -> dict:
		"""Get full NSF info."""
		info = self.header.to_dict()
		info["file_size"] = len(self.data)
		info["prg_size"] = len(self.prg_data)
		return info

	def analyze_prg(self) -> dict:
		"""Basic analysis of PRG data."""
		analysis = {
			"size": len(self.prg_data),
			"potential_opcodes": {},
		}

		# Count common opcodes
		opcode_names = {
			0x20: "JSR",
			0x60: "RTS",
			0x40: "RTI",
			0x4C: "JMP abs",
			0x6C: "JMP ind",
			0x8D: "STA abs",
			0xAD: "LDA abs",
			0xA9: "LDA imm",
			0xA2: "LDX imm",
			0xA0: "LDY imm",
		}

		counts = {}
		for byte in self.prg_data:
			if byte in opcode_names:
				name = opcode_names[byte]
				counts[name] = counts.get(name, 0) + 1

		analysis["potential_opcodes"] = counts
		return analysis

	def find_apu_writes(self) -> List[Dict]:
		"""Find potential APU register writes in code."""
		apu_regs = {
			0x4000: "SQ1_VOL",
			0x4001: "SQ1_SWEEP",
			0x4002: "SQ1_LO",
			0x4003: "SQ1_HI",
			0x4004: "SQ2_VOL",
			0x4005: "SQ2_SWEEP",
			0x4006: "SQ2_LO",
			0x4007: "SQ2_HI",
			0x4008: "TRI_LINEAR",
			0x400A: "TRI_LO",
			0x400B: "TRI_HI",
			0x400C: "NOISE_VOL",
			0x400E: "NOISE_LO",
			0x400F: "NOISE_HI",
			0x4010: "DMC_FREQ",
			0x4011: "DMC_RAW",
			0x4012: "DMC_START",
			0x4013: "DMC_LEN",
			0x4015: "APU_STATUS",
			0x4017: "APU_FRAME",
		}

		writes = []

		# Look for STA $40xx patterns
		for i in range(len(self.prg_data) - 2):
			if self.prg_data[i] == 0x8D:  # STA abs
				addr = struct.unpack('<H', self.prg_data[i + 1:i + 3])[0]
				if addr in apu_regs:
					writes.append({
						"offset": i,
						"address": f"${addr:04X}",
						"register": apu_regs[addr],
					})

		return writes

	def export_m3u(self, output_path: str, default_time: str = "3:00"):
		"""Export M3U playlist."""
		lines = [
			"#EXTM3U",
			f"# {self.header.song_name}",
			f"# {self.header.artist}",
			"",
		]

		filename = self.path.name

		for i in range(1, self.header.total_songs + 1):
			track_info = self.metadata.get_track_info(i)
			track_name = track_info.get("name", f"Track {i}")
			duration = track_info.get("duration", default_time)

			# M3U extended format for NSF: filename::NSF,track,time
			# Some players use: filename#track
			lines.append(f"#EXTINF:,{self.header.song_name} - {track_name}")
			lines.append(f"{filename}::NSF,{i},{duration}")
			lines.append("")

		Path(output_path).write_text('\n'.join(lines), encoding='utf-8')
		print(f"Exported M3U playlist to {output_path}")


def format_info(nsf: NSFFile, verbose: bool = False) -> str:
	"""Format NSF info for display."""
	h = nsf.header
	lines = []

	lines.append(f"NSF Info: {nsf.path.name}")
	lines.append("=" * 50)
	lines.append(f"Title:     {h.song_name}")
	lines.append(f"Artist:    {h.artist}")
	lines.append(f"Copyright: {h.copyright}")
	lines.append("")
	lines.append(f"Tracks: {h.total_songs} (starts at #{h.starting_song})")
	lines.append(f"Region: {h.get_region()}")
	lines.append("")
	lines.append(f"Load Address: ${h.load_address:04X}")
	lines.append(f"Init Address: ${h.init_address:04X}")
	lines.append(f"Play Address: ${h.play_address:04X}")

	if h.ntsc_speed > 0:
		lines.append(f"\nNTSC: {h.ntsc_speed}µs ({h.get_ntsc_hz():.2f} Hz)")
	if h.pal_speed > 0:
		lines.append(f"PAL:  {h.pal_speed}µs ({h.get_pal_hz():.2f} Hz)")

	if h.uses_bankswitch():
		lines.append(f"\nBankswitch Init: {[f'${b:02X}' for b in h.bankswitch]}")

	if h.expansion_audio:
		lines.append(f"\nExpansion Audio: {', '.join(h.expansion_audio)}")

	if h.is_nsf2:
		lines.append(f"\nNSF2 Version: {h.version}")

	if verbose:
		lines.append("\n" + "=" * 50)
		lines.append("PRG Analysis:")
		analysis = nsf.analyze_prg()
		lines.append(f"  Size: {analysis['size']} bytes")
		lines.append("  Common opcodes:")
		for op, count in sorted(analysis['potential_opcodes'].items(),
								key=lambda x: -x[1]):
			lines.append(f"    {op}: {count}")

		apu_writes = nsf.find_apu_writes()
		if apu_writes:
			lines.append(f"\n  APU writes found: {len(apu_writes)}")
			# Show first few
			for w in apu_writes[:10]:
				lines.append(f"    +${w['offset']:04X}: {w['register']}")

	return '\n'.join(lines)


def main():
	parser = argparse.ArgumentParser(description="NSF Music Info Tool")
	parser.add_argument("input", help="NSF file to analyze")
	parser.add_argument("-o", "--output", help="Output file")
	parser.add_argument("-v", "--verbose", action="store_true",
		help="Show detailed analysis")
	parser.add_argument("--json", action="store_true",
		help="Output as JSON")
	parser.add_argument("--m3u", action="store_true",
		help="Export M3U playlist")
	parser.add_argument("--tracks", action="store_true",
		help="List all tracks")

	args = parser.parse_args()

	nsf = NSFFile(args.input)

	if not nsf.is_valid():
		print(f"Error: {args.input} is not a valid NSF file")
		return 1

	if args.m3u:
		output = args.output or Path(args.input).stem + ".m3u"
		nsf.export_m3u(output)
		return 0

	if args.tracks:
		print(f"Tracks in {Path(args.input).name}:")
		print(f"  Title: {nsf.header.song_name}")
		print(f"  Artist: {nsf.header.artist}")
		print()
		for i in range(1, nsf.header.total_songs + 1):
			track_info = nsf.metadata.get_track_info(i)
			name = track_info.get("name", f"Track {i}")
			duration = track_info.get("duration", "--:--")
			marker = " *" if i == nsf.header.starting_song else ""
			print(f"  {i:3d}. {name} [{duration}]{marker}")
		return 0

	if args.json:
		info = nsf.get_info()
		if args.verbose:
			info["analysis"] = nsf.analyze_prg()
			info["apu_writes_sample"] = nsf.find_apu_writes()[:20]

		output = json.dumps(info, indent='\t')

		if args.output:
			Path(args.output).write_text(output, encoding='utf-8')
			print(f"Saved JSON to {args.output}")
		else:
			print(output)
	else:
		output = format_info(nsf, args.verbose)

		if args.output:
			Path(args.output).write_text(output, encoding='utf-8')
			print(f"Saved info to {args.output}")
		else:
			print(output)

	return 0


if __name__ == "__main__":
	exit(main())
