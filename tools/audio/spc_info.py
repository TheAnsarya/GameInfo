#!/usr/bin/env python3
"""
SPC Music Info Tool

Parse and display information about SPC (SNES Sound Format) music files.
Extract ID666 tags, DSP register values, and metadata.
"""

import argparse
import json
import struct
from pathlib import Path
from typing import Dict, List, Optional


class ID666Tag:
	"""ID666 tag parser for SPC files."""

	def __init__(self):
		self.song_title = ""
		self.game_title = ""
		self.dumper = ""
		self.comments = ""
		self.date = ""
		self.seconds_before_fadeout = 0
		self.fade_length = 0
		self.artist = ""
		self.default_channel_disables = 0
		self.emulator = 0
		self.is_text_format = True

	def parse_text(self, data: bytes):
		"""Parse text-format ID666 tag."""
		self.is_text_format = True

		# Text format offsets
		self.song_title = data[0x2E:0x4E].rstrip(b'\x00').decode('ascii', errors='replace')
		self.game_title = data[0x4E:0x6E].rstrip(b'\x00').decode('ascii', errors='replace')
		self.dumper = data[0x6E:0x7E].rstrip(b'\x00').decode('ascii', errors='replace')
		self.comments = data[0x7E:0x9E].rstrip(b'\x00').decode('ascii', errors='replace')
		self.date = data[0x9E:0xA9].rstrip(b'\x00').decode('ascii', errors='replace')

		# Parse time as text (seconds as string)
		seconds_str = data[0xA9:0xAC].rstrip(b'\x00').decode('ascii', errors='replace')
		try:
			self.seconds_before_fadeout = int(seconds_str) if seconds_str else 0
		except ValueError:
			self.seconds_before_fadeout = 0

		fade_str = data[0xAC:0xB1].rstrip(b'\x00').decode('ascii', errors='replace')
		try:
			self.fade_length = int(fade_str) if fade_str else 0
		except ValueError:
			self.fade_length = 0

		self.artist = data[0xB1:0xD1].rstrip(b'\x00').decode('ascii', errors='replace')
		self.default_channel_disables = data[0xD1]
		self.emulator = data[0xD2]

	def parse_binary(self, data: bytes):
		"""Parse binary-format ID666 tag."""
		self.is_text_format = False

		# Binary format has slightly different layout
		self.song_title = data[0x2E:0x4E].rstrip(b'\x00').decode('ascii', errors='replace')
		self.game_title = data[0x4E:0x6E].rstrip(b'\x00').decode('ascii', errors='replace')
		self.dumper = data[0x6E:0x7E].rstrip(b'\x00').decode('ascii', errors='replace')
		self.comments = data[0x7E:0x9E].rstrip(b'\x00').decode('ascii', errors='replace')

		# Binary date format
		date_bytes = data[0x9E:0xA2]
		if len(date_bytes) >= 4:
			day = date_bytes[0]
			month = date_bytes[1]
			year = struct.unpack('<H', date_bytes[2:4])[0]
			if year > 0:
				self.date = f"{month:02d}/{day:02d}/{year}"

		# Binary time values
		self.seconds_before_fadeout = struct.unpack('<I', data[0xA9:0xAD])[0] if len(data) > 0xAD else 0
		self.fade_length = struct.unpack('<I', data[0xAC:0xB0])[0] if len(data) > 0xB0 else 0

		self.artist = data[0xB1:0xD1].rstrip(b'\x00').decode('ascii', errors='replace')
		self.default_channel_disables = data[0xD1] if len(data) > 0xD1 else 0
		self.emulator = data[0xD2] if len(data) > 0xD2 else 0

	def get_emulator_name(self) -> str:
		"""Get emulator name from ID."""
		emulators = {
			0: "Unknown",
			1: "ZSNES",
			2: "Snes9x",
		}
		return emulators.get(self.emulator, f"Other ({self.emulator})")

	def get_duration_str(self) -> str:
		"""Get formatted duration string."""
		if self.seconds_before_fadeout == 0:
			return "--:--"
		minutes = self.seconds_before_fadeout // 60
		seconds = self.seconds_before_fadeout % 60
		return f"{minutes}:{seconds:02d}"

	def to_dict(self) -> dict:
		return {
			"song_title": self.song_title,
			"game_title": self.game_title,
			"artist": self.artist,
			"dumper": self.dumper,
			"comments": self.comments,
			"date": self.date,
			"duration_seconds": self.seconds_before_fadeout,
			"duration": self.get_duration_str(),
			"fade_ms": self.fade_length,
			"emulator": self.get_emulator_name(),
			"channel_disables": self.default_channel_disables,
			"is_text_format": self.is_text_format,
		}


class SPCHeader:
	"""SPC file header parser."""

	def __init__(self, data: bytes):
		self.valid = False
		self.version_minor = 0
		self.has_id666 = False

		# SPC700 registers
		self.pc = 0
		self.a = 0
		self.x = 0
		self.y = 0
		self.psw = 0
		self.sp = 0

		self._parse(data)

	def _parse(self, data: bytes):
		"""Parse SPC header."""
		if len(data) < 256:
			return

		# Check magic
		if data[:33] != b'SNES-SPC700 Sound File Data v0.30':
			# Try alternate magic
			if data[:27] != b'SNES-SPC700 Sound File Data':
				return

		self.valid = True
		self.version_minor = data[0x24] if len(data) > 0x24 else 0

		# Check for ID666 tag
		self.has_id666 = data[0x23] == 0x1A if len(data) > 0x23 else False

		# SPC700 registers at offset 0x25
		if len(data) >= 0x2D:
			self.pc = struct.unpack('<H', data[0x25:0x27])[0]
			self.a = data[0x27]
			self.x = data[0x28]
			self.y = data[0x29]
			self.psw = data[0x2A]
			self.sp = data[0x2B]

	def to_dict(self) -> dict:
		return {
			"version_minor": self.version_minor,
			"has_id666": self.has_id666,
			"registers": {
				"PC": f"${self.pc:04X}",
				"A": f"${self.a:02X}",
				"X": f"${self.x:02X}",
				"Y": f"${self.y:02X}",
				"PSW": f"${self.psw:02X}",
				"SP": f"${self.sp:02X}",
			}
		}


class DSPRegisters:
	"""DSP register parser."""

	REGISTER_NAMES = {
		0x0C: "MVOL_L",
		0x1C: "MVOL_R",
		0x2C: "EVOL_L",
		0x3C: "EVOL_R",
		0x4C: "KON",
		0x5C: "KOFF",
		0x6C: "FLG",
		0x7C: "ENDX",
		0x0D: "EFB",
		0x2D: "PMON",
		0x3D: "NON",
		0x4D: "EON",
		0x5D: "DIR",
		0x6D: "ESA",
		0x7D: "EDL",
	}

	def __init__(self, data: bytes):
		self.registers = list(data[:128]) if len(data) >= 128 else [0] * 128
		self.extra_ram = data[128:] if len(data) > 128 else b''

	def get_register(self, addr: int) -> int:
		"""Get register value."""
		if 0 <= addr < 128:
			return self.registers[addr]
		return 0

	def get_voice_registers(self, voice: int) -> dict:
		"""Get all registers for a voice (0-7)."""
		base = voice * 0x10
		return {
			"VOL_L": self.registers[base + 0],
			"VOL_R": self.registers[base + 1],
			"PITCH_L": self.registers[base + 2],
			"PITCH_H": self.registers[base + 3],
			"SRCN": self.registers[base + 4],
			"ADSR1": self.registers[base + 5],
			"ADSR2": self.registers[base + 6],
			"GAIN": self.registers[base + 7],
			"ENVX": self.registers[base + 8],
			"OUTX": self.registers[base + 9],
		}

	def get_global_registers(self) -> dict:
		"""Get global DSP registers."""
		result = {}
		for addr, name in self.REGISTER_NAMES.items():
			result[name] = f"${self.registers[addr]:02X}"
		return result

	def analyze_voices(self) -> List[dict]:
		"""Analyze active voices."""
		voices = []
		for i in range(8):
			regs = self.get_voice_registers(i)

			# Calculate pitch in Hz (approximate)
			pitch_raw = regs["PITCH_L"] | (regs["PITCH_H"] << 8)
			pitch_hz = (pitch_raw * 32000) / 4096 if pitch_raw > 0 else 0

			voices.append({
				"voice": i,
				"vol_l": regs["VOL_L"],
				"vol_r": regs["VOL_R"],
				"pitch_raw": pitch_raw,
				"pitch_hz": round(pitch_hz, 1),
				"source": regs["SRCN"],
				"adsr1": f"${regs['ADSR1']:02X}",
				"adsr2": f"${regs['ADSR2']:02X}",
				"gain": f"${regs['GAIN']:02X}",
			})

		return voices


class SPCFile:
	"""Full SPC file handler."""

	def __init__(self, path: str):
		self.path = Path(path)
		self.data = self.path.read_bytes()
		self.header = SPCHeader(self.data)
		self.id666 = ID666Tag()
		self.dsp = None
		self.ram = b''

		if self.header.valid:
			self._parse_sections()

	def _parse_sections(self):
		"""Parse file sections."""
		# ID666 tag
		if self.header.has_id666:
			# Determine text vs binary format
			# Usually text format if byte at 0xD2 is text character
			if len(self.data) > 0xD2:
				if self.data[0xD2] < 0x30:
					self.id666.parse_binary(self.data)
				else:
					self.id666.parse_text(self.data)

		# RAM (64KB at offset 0x100)
		if len(self.data) >= 0x10100:
			self.ram = self.data[0x100:0x10100]

		# DSP registers (128 bytes at offset 0x10100)
		if len(self.data) >= 0x10180:
			self.dsp = DSPRegisters(self.data[0x10100:0x10180])

	def is_valid(self) -> bool:
		return self.header.valid

	def get_info(self) -> dict:
		"""Get full SPC info."""
		info = {
			"file": str(self.path),
			"file_size": len(self.data),
			"header": self.header.to_dict(),
		}

		if self.header.has_id666:
			info["id666"] = self.id666.to_dict()

		return info

	def get_detailed_info(self) -> dict:
		"""Get detailed SPC info including DSP analysis."""
		info = self.get_info()

		if self.dsp:
			info["dsp"] = {
				"global": self.dsp.get_global_registers(),
				"voices": self.dsp.analyze_voices(),
			}

		return info

	def find_brr_samples(self) -> List[dict]:
		"""Find BRR samples in RAM."""
		if not self.ram:
			return []

		samples = []

		# BRR samples are 9 bytes per block
		# First byte is header, next 8 are compressed data
		# Header format: ERFF SSSS
		#   E = end flag, R = loop flag, FF = filter, SSSS = shift

		# Look for DIR table (sample directory)
		if self.dsp:
			dir_page = self.dsp.get_register(0x5D) * 0x100

			for i in range(256):  # Max 256 samples
				entry_addr = dir_page + i * 4
				if entry_addr + 4 > len(self.ram):
					break

				start = struct.unpack('<H', self.ram[entry_addr:entry_addr + 2])[0]
				loop = struct.unpack('<H', self.ram[entry_addr + 2:entry_addr + 4])[0]

				if start == 0 and loop == 0:
					continue

				# Find sample end
				end = start
				block_count = 0
				while end < len(self.ram):
					header = self.ram[end]
					end += 9
					block_count += 1
					if header & 0x01:  # End flag
						break
					if block_count > 1000:  # Safety limit
						break

				samples.append({
					"index": i,
					"start": f"${start:04X}",
					"loop": f"${loop:04X}",
					"end": f"${end:04X}",
					"size": end - start,
					"blocks": block_count,
				})

		return samples


def format_info(spc: SPCFile, verbose: bool = False) -> str:
	"""Format SPC info for display."""
	lines = []

	lines.append(f"SPC Info: {spc.path.name}")
	lines.append("=" * 50)

	if spc.header.has_id666:
		tag = spc.id666
		lines.append(f"Title:    {tag.song_title}")
		lines.append(f"Game:     {tag.game_title}")
		lines.append(f"Artist:   {tag.artist}")
		if tag.dumper:
			lines.append(f"Dumper:   {tag.dumper}")
		if tag.date:
			lines.append(f"Date:     {tag.date}")
		lines.append(f"Duration: {tag.get_duration_str()}")
		if tag.fade_length > 0:
			lines.append(f"Fade:     {tag.fade_length}ms")
		if tag.comments:
			lines.append(f"Comments: {tag.comments}")
		lines.append(f"Emulator: {tag.get_emulator_name()}")
	else:
		lines.append("No ID666 tag present")

	lines.append("")
	lines.append("SPC700 Registers:")
	h = spc.header
	lines.append(f"  PC=${h.pc:04X} A=${h.a:02X} X=${h.x:02X} Y=${h.y:02X} PSW=${h.psw:02X} SP=${h.sp:02X}")

	if verbose and spc.dsp:
		lines.append("\n" + "=" * 50)
		lines.append("DSP Analysis:")

		global_regs = spc.dsp.get_global_registers()
		lines.append(f"\nGlobal: MVOL={global_regs['MVOL_L']}/{global_regs['MVOL_R']} "
					f"EVOL={global_regs['EVOL_L']}/{global_regs['EVOL_R']}")

		lines.append("\nVoices:")
		lines.append(f"  {'#':>2} {'Vol L':>6} {'Vol R':>6} {'Pitch':>8} {'Src':>4}")
		lines.append("  " + "-" * 35)

		for voice in spc.dsp.analyze_voices():
			v = voice['voice']
			vol_l = voice['vol_l']
			vol_r = voice['vol_r']
			pitch = voice['pitch_hz']
			src = voice['source']
			lines.append(f"  {v:2d} {vol_l:6d} {vol_r:6d} {pitch:8.1f} {src:4d}")

		# Sample info
		samples = spc.find_brr_samples()
		if samples:
			lines.append(f"\nBRR Samples Found: {len(samples)}")
			for s in samples[:10]:  # First 10
				lines.append(f"  #{s['index']:3d}: {s['start']}-{s['end']} "
							f"({s['blocks']} blocks, {s['size']} bytes)")
			if len(samples) > 10:
				lines.append(f"  ... and {len(samples) - 10} more")

	return '\n'.join(lines)


def main():
	parser = argparse.ArgumentParser(description="SPC Music Info Tool")
	parser.add_argument("input", help="SPC file to analyze")
	parser.add_argument("-o", "--output", help="Output file")
	parser.add_argument("-v", "--verbose", action="store_true",
		help="Show detailed DSP analysis")
	parser.add_argument("--json", action="store_true",
		help="Output as JSON")
	parser.add_argument("--samples", action="store_true",
		help="List BRR samples")

	args = parser.parse_args()

	spc = SPCFile(args.input)

	if not spc.is_valid():
		print(f"Error: {args.input} is not a valid SPC file")
		return 1

	if args.samples:
		samples = spc.find_brr_samples()
		print(f"BRR Samples in {Path(args.input).name}:")
		print(f"  {'#':>3} {'Start':>8} {'Loop':>8} {'End':>8} {'Size':>8} {'Blocks':>7}")
		print("  " + "-" * 50)
		for s in samples:
			print(f"  {s['index']:3d} {s['start']:>8} {s['loop']:>8} "
				  f"{s['end']:>8} {s['size']:>8} {s['blocks']:>7}")
		return 0

	if args.json:
		if args.verbose:
			info = spc.get_detailed_info()
			info["samples"] = spc.find_brr_samples()
		else:
			info = spc.get_info()

		output = json.dumps(info, indent='\t')

		if args.output:
			Path(args.output).write_text(output, encoding='utf-8')
			print(f"Saved JSON to {args.output}")
		else:
			print(output)
	else:
		output = format_info(spc, args.verbose)

		if args.output:
			Path(args.output).write_text(output, encoding='utf-8')
			print(f"Saved info to {args.output}")
		else:
			print(output)

	return 0


if __name__ == "__main__":
	exit(main())
