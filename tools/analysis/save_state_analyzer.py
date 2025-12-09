#!/usr/bin/env python3
"""
Save State Analyzer
Analyzes emulator save states to extract game data and RAM snapshots.

Supports:
- FCEUX (.fc0-fc9, .fcs)
- SNES9x (.000-.009)
- ZSNES (.zst, .zs1-zs9)
- Mesen (.mss)
- bsnes/higan (.bst)
- VisualBoyAdvance (.sgm)
- Generic RAM dumps
"""

import argparse
import gzip
import json
import os
import struct
import sys
import zlib
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Any, BinaryIO, Optional


class EmulatorType(Enum):
	"""Supported emulator save state formats."""
	FCEUX = "fceux"
	SNES9X = "snes9x"
	ZSNES = "zsnes"
	MESEN = "mesen"
	BSNES = "bsnes"
	VBA = "vba"
	GENERIC = "generic"
	UNKNOWN = "unknown"


@dataclass
class RAMRegion:
	"""Represents a region of RAM in the save state."""
	name: str
	start: int
	size: int
	data: bytes = b""
	description: str = ""


@dataclass
class SaveStateInfo:
	"""Information extracted from a save state."""
	emulator: EmulatorType
	version: str = ""
	console: str = ""
	rom_name: str = ""
	ram_size: int = 0
	vram_size: int = 0
	regions: list[RAMRegion] = field(default_factory=list)
	cpu_state: dict[str, Any] = field(default_factory=dict)
	ppu_state: dict[str, Any] = field(default_factory=dict)
	apu_state: dict[str, Any] = field(default_factory=dict)
	raw_data: bytes = b""
	metadata: dict[str, Any] = field(default_factory=dict)


class SaveStateAnalyzer:
	"""Analyzes emulator save states."""

	def __init__(self):
		self.verbose = False

	def analyze(self, filepath: str | Path) -> SaveStateInfo:
		"""
		Analyze a save state file.

		Args:
			filepath: Path to save state file

		Returns:
			SaveStateInfo with extracted data
		"""
		filepath = Path(filepath)
		if not filepath.exists():
			raise FileNotFoundError(f"Save state not found: {filepath}")

		# Read file data
		with open(filepath, "rb") as f:
			data = f.read()

		# Try to decompress if needed
		try:
			decompressed = gzip.decompress(data)
			data = decompressed
		except:
			pass

		try:
			decompressed = zlib.decompress(data)
			data = decompressed
		except:
			pass

		# Detect emulator type
		emulator = self._detect_emulator(data, filepath)

		# Parse based on emulator
		if emulator == EmulatorType.FCEUX:
			return self._parse_fceux(data, filepath)
		elif emulator == EmulatorType.SNES9X:
			return self._parse_snes9x(data, filepath)
		elif emulator == EmulatorType.ZSNES:
			return self._parse_zsnes(data, filepath)
		elif emulator == EmulatorType.MESEN:
			return self._parse_mesen(data, filepath)
		elif emulator == EmulatorType.BSNES:
			return self._parse_bsnes(data, filepath)
		elif emulator == EmulatorType.VBA:
			return self._parse_vba(data, filepath)
		else:
			return self._parse_generic(data, filepath)

	def _detect_emulator(self, data: bytes, filepath: Path) -> EmulatorType:
		"""Detect which emulator created the save state."""
		ext = filepath.suffix.lower()

		# Check by extension
		if ext in [".fc0", ".fc1", ".fc2", ".fc3", ".fc4", ".fc5", ".fc6", ".fc7", ".fc8", ".fc9", ".fcs"]:
			return EmulatorType.FCEUX
		elif ext in [".zst", ".zs1", ".zs2", ".zs3", ".zs4", ".zs5", ".zs6", ".zs7", ".zs8", ".zs9"]:
			return EmulatorType.ZSNES
		elif ext == ".mss":
			return EmulatorType.MESEN
		elif ext == ".bst":
			return EmulatorType.BSNES
		elif ext == ".sgm":
			return EmulatorType.VBA

		# Check by magic bytes
		if data[:4] == b"FCSX":
			return EmulatorType.FCEUX
		elif data[:4] == b"#!s9":
			return EmulatorType.SNES9X
		elif data[:3] == b"ZST" or data[:4] == b"ZSNE":
			return EmulatorType.ZSNES
		elif data[:4] == b"MSS\x00":
			return EmulatorType.MESEN
		elif data[:4] == b"#!sb" or data[:4] == b"BST1":
			return EmulatorType.BSNES

		return EmulatorType.UNKNOWN

	def _parse_fceux(self, data: bytes, filepath: Path) -> SaveStateInfo:
		"""Parse FCEUX save state."""
		info = SaveStateInfo(
			emulator=EmulatorType.FCEUX,
			console="NES",
			raw_data=data
		)

		# FCEUX uses a chunked format
		# Header: "FCSX" + version
		if data[:4] == b"FCSX":
			offset = 4
			info.version = f"{data[offset]}.{data[offset+1]}.{data[offset+2]}"
			offset += 4

			# Parse chunks
			while offset < len(data) - 4:
				try:
					chunk_id = data[offset:offset+4].decode("ascii", errors="ignore")
					chunk_size = struct.unpack("<I", data[offset+4:offset+8])[0]
					chunk_data = data[offset+8:offset+8+chunk_size]
					offset += 8 + chunk_size

					if chunk_id == "WRAM":
						info.regions.append(RAMRegion(
							name="Work RAM",
							start=0x0000,
							size=len(chunk_data),
							data=chunk_data,
							description="NES main RAM ($0000-$07FF)"
						))
						info.ram_size = len(chunk_data)
					elif chunk_id == "VRAM":
						info.regions.append(RAMRegion(
							name="Video RAM",
							start=0x2000,
							size=len(chunk_data),
							data=chunk_data,
							description="PPU VRAM"
						))
						info.vram_size = len(chunk_data)
					elif chunk_id == "SRAM":
						info.regions.append(RAMRegion(
							name="Save RAM",
							start=0x6000,
							size=len(chunk_data),
							data=chunk_data,
							description="Cartridge SRAM ($6000-$7FFF)"
						))
					elif chunk_id == "CPU\x00":
						info.cpu_state = self._parse_nes_cpu(chunk_data)
					elif chunk_id == "PPU\x00":
						info.ppu_state = self._parse_nes_ppu(chunk_data)
					elif chunk_id == "APU\x00":
						info.apu_state = {"raw_size": len(chunk_data)}
					elif chunk_id == "INFO":
						# ROM info
						info.rom_name = chunk_data.rstrip(b"\x00").decode("ascii", errors="ignore")
				except:
					break
		else:
			# Older FCEUX format or raw
			info.regions.append(RAMRegion(
				name="Raw Data",
				start=0,
				size=len(data),
				data=data,
				description="Unparsed save state data"
			))

		return info

	def _parse_nes_cpu(self, data: bytes) -> dict:
		"""Parse NES CPU state from save state."""
		if len(data) < 10:
			return {}
		return {
			"A": data[0],
			"X": data[1],
			"Y": data[2],
			"P": data[3],
			"S": data[4],
			"PC": struct.unpack("<H", data[5:7])[0] if len(data) >= 7 else 0,
		}

	def _parse_nes_ppu(self, data: bytes) -> dict:
		"""Parse NES PPU state."""
		if len(data) < 16:
			return {}
		return {
			"control": data[0],
			"mask": data[1],
			"status": data[2],
			"oam_addr": data[3],
			"scroll_x": data[4],
			"scroll_y": data[5],
		}

	def _parse_snes9x(self, data: bytes, filepath: Path) -> SaveStateInfo:
		"""Parse SNES9x save state."""
		info = SaveStateInfo(
			emulator=EmulatorType.SNES9X,
			console="SNES",
			raw_data=data
		)

		# SNES9x format: "#!s9x" header
		if data[:4] == b"#!s9":
			info.version = data[4:8].decode("ascii", errors="ignore")

			# SNES main RAM is typically 128 KB
			# Look for RAM section
			ram_offset = data.find(b"RAM:")
			if ram_offset > 0:
				ram_size = 0x20000  # 128 KB
				ram_data = data[ram_offset+4:ram_offset+4+ram_size]
				info.regions.append(RAMRegion(
					name="Work RAM",
					start=0x7e0000,
					size=len(ram_data),
					data=ram_data,
					description="SNES WRAM ($7E0000-$7FFFFF)"
				))
				info.ram_size = len(ram_data)

			# VRAM
			vram_offset = data.find(b"VRAM")
			if vram_offset > 0:
				vram_size = 0x10000  # 64 KB
				vram_data = data[vram_offset+4:vram_offset+4+vram_size]
				info.regions.append(RAMRegion(
					name="Video RAM",
					start=0,
					size=len(vram_data),
					data=vram_data,
					description="SNES VRAM"
				))
				info.vram_size = len(vram_data)
		else:
			# Unknown format, try to find RAM patterns
			info.regions.append(RAMRegion(
				name="Raw Data",
				start=0,
				size=len(data),
				data=data
			))

		return info

	def _parse_zsnes(self, data: bytes, filepath: Path) -> SaveStateInfo:
		"""Parse ZSNES save state."""
		info = SaveStateInfo(
			emulator=EmulatorType.ZSNES,
			console="SNES",
			raw_data=data
		)

		# ZSNES has a fixed format with known offsets
		if len(data) >= 0x20000:
			# RAM starts at offset $1000 typically
			ram_offset = 0x1000
			ram_size = 0x20000

			if ram_offset + ram_size <= len(data):
				info.regions.append(RAMRegion(
					name="Work RAM",
					start=0x7e0000,
					size=ram_size,
					data=data[ram_offset:ram_offset+ram_size],
					description="SNES WRAM"
				))
				info.ram_size = ram_size

		return info

	def _parse_mesen(self, data: bytes, filepath: Path) -> SaveStateInfo:
		"""Parse Mesen save state."""
		info = SaveStateInfo(
			emulator=EmulatorType.MESEN,
			console="NES",  # Mesen is primarily NES
			raw_data=data
		)

		# Mesen uses its own format
		if data[:4] == b"MSS\x00":
			info.version = f"{data[4]}.{data[5]}"

		# Try to locate RAM sections
		for i in range(0, min(len(data) - 0x800, 0x10000), 0x100):
			# Look for RAM patterns
			if data[i:i+4] == b"RAM\x00":
				size = struct.unpack("<I", data[i+4:i+8])[0]
				ram_data = data[i+8:i+8+size]
				info.regions.append(RAMRegion(
					name="Work RAM",
					start=0,
					size=size,
					data=ram_data
				))
				info.ram_size = size
				break

		return info

	def _parse_bsnes(self, data: bytes, filepath: Path) -> SaveStateInfo:
		"""Parse bsnes/higan save state."""
		info = SaveStateInfo(
			emulator=EmulatorType.BSNES,
			console="SNES",
			raw_data=data
		)

		# bsnes uses serialized format
		# Look for WRAM section
		wram_marker = b"cpu.wram"
		wram_offset = data.find(wram_marker)
		if wram_offset > 0:
			# Size follows marker
			size_offset = wram_offset + len(wram_marker) + 1
			ram_size = 0x20000  # 128 KB
			ram_data = data[size_offset:size_offset+ram_size]
			info.regions.append(RAMRegion(
				name="Work RAM",
				start=0x7e0000,
				size=len(ram_data),
				data=ram_data,
				description="SNES WRAM"
			))
			info.ram_size = len(ram_data)

		return info

	def _parse_vba(self, data: bytes, filepath: Path) -> SaveStateInfo:
		"""Parse VisualBoyAdvance save state."""
		info = SaveStateInfo(
			emulator=EmulatorType.VBA,
			console="GBA",
			raw_data=data
		)

		# VBA save states have a header then RAM
		if len(data) > 0x40000:
			# IWRAM is 32 KB, EWRAM is 256 KB
			# Usually IWRAM at offset ~$20, EWRAM after
			iwram_size = 0x8000
			ewram_size = 0x40000

			# Try to find RAM patterns
			info.regions.append(RAMRegion(
				name="Internal WRAM",
				start=0x03000000,
				size=iwram_size,
				data=data[0x20:0x20+iwram_size] if len(data) > 0x20+iwram_size else b"",
				description="GBA IWRAM (32 KB)"
			))

			info.regions.append(RAMRegion(
				name="External WRAM",
				start=0x02000000,
				size=ewram_size,
				data=data[0x8020:0x8020+ewram_size] if len(data) > 0x8020+ewram_size else b"",
				description="GBA EWRAM (256 KB)"
			))

			info.ram_size = iwram_size + ewram_size

		return info

	def _parse_generic(self, data: bytes, filepath: Path) -> SaveStateInfo:
		"""Parse unknown/generic save state format."""
		info = SaveStateInfo(
			emulator=EmulatorType.UNKNOWN,
			console="Unknown",
			raw_data=data
		)

		info.regions.append(RAMRegion(
			name="Raw Data",
			start=0,
			size=len(data),
			data=data,
			description="Unrecognized format - raw data"
		))

		return info

	def extract_ram(self, info: SaveStateInfo, region_name: str = None) -> bytes:
		"""
		Extract RAM data from save state info.

		Args:
			info: Parsed save state info
			region_name: Specific region to extract, or None for main RAM

		Returns:
			RAM bytes
		"""
		if region_name:
			for region in info.regions:
				if region.name.lower() == region_name.lower():
					return region.data
			return b""
		else:
			# Return first/main RAM region
			for region in info.regions:
				if "work ram" in region.name.lower() or "wram" in region.name.lower():
					return region.data
			# Fallback to first region
			return info.regions[0].data if info.regions else b""

	def compare_states(self, state1: SaveStateInfo, state2: SaveStateInfo) -> dict:
		"""
		Compare two save states to find differences.

		Args:
			state1: First save state
			state2: Second save state

		Returns:
			Dictionary of differences
		"""
		differences = {
			"ram_changes": [],
			"cpu_changes": {},
			"summary": {}
		}

		# Compare RAM regions
		ram1 = self.extract_ram(state1)
		ram2 = self.extract_ram(state2)

		if len(ram1) != len(ram2):
			differences["summary"]["ram_size_mismatch"] = True
		else:
			changes = []
			for i in range(len(ram1)):
				if ram1[i] != ram2[i]:
					changes.append({
						"address": f"${i:04x}",
						"old": f"${ram1[i]:02x}",
						"new": f"${ram2[i]:02x}"
					})
			differences["ram_changes"] = changes[:1000]  # Limit
			differences["summary"]["total_ram_changes"] = len(changes)

		# Compare CPU state
		for key in set(state1.cpu_state.keys()) | set(state2.cpu_state.keys()):
			v1 = state1.cpu_state.get(key)
			v2 = state2.cpu_state.get(key)
			if v1 != v2:
				differences["cpu_changes"][key] = {"old": v1, "new": v2}

		return differences

	def dump_ram_to_file(self, info: SaveStateInfo, output_path: str | Path, region: str = None):
		"""
		Dump RAM from save state to file.

		Args:
			info: Parsed save state
			output_path: Output file path
			region: Region name or None for main RAM
		"""
		ram = self.extract_ram(info, region)
		with open(output_path, "wb") as f:
			f.write(ram)


def main():
	parser = argparse.ArgumentParser(
		description="Analyze emulator save states",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
  %(prog)s game.fc0                    # Analyze FCEUX save state
  %(prog)s game.zst --dump ram.bin     # Extract RAM to file
  %(prog)s state1.fc0 state2.fc0       # Compare two states
  %(prog)s game.sgm --format json      # Output as JSON
		"""
	)

	parser.add_argument("input", nargs="+", help="Save state file(s) to analyze")
	parser.add_argument("--dump", "-d", metavar="FILE", help="Dump RAM to file")
	parser.add_argument("--region", "-r", help="RAM region to extract")
	parser.add_argument("--format", "-f", choices=["text", "json"], default="text",
	                    help="Output format")
	parser.add_argument("--verbose", "-v", action="store_true", help="Verbose output")

	args = parser.parse_args()

	analyzer = SaveStateAnalyzer()
	analyzer.verbose = args.verbose

	if len(args.input) == 2 and not args.dump:
		# Compare mode
		state1 = analyzer.analyze(args.input[0])
		state2 = analyzer.analyze(args.input[1])
		diff = analyzer.compare_states(state1, state2)

		if args.format == "json":
			print(json.dumps(diff, indent=2))
		else:
			print(f"Comparing: {args.input[0]} vs {args.input[1]}")
			print(f"Total RAM changes: {diff['summary'].get('total_ram_changes', 0)}")
			print()
			if diff["ram_changes"]:
				print("RAM Changes (first 50):")
				for change in diff["ram_changes"][:50]:
					print(f"  {change['address']}: {change['old']} -> {change['new']}")
			if diff["cpu_changes"]:
				print("\nCPU Changes:")
				for reg, vals in diff["cpu_changes"].items():
					print(f"  {reg}: {vals['old']} -> {vals['new']}")

	else:
		# Analyze mode
		for filepath in args.input:
			info = analyzer.analyze(filepath)

			if args.dump:
				analyzer.dump_ram_to_file(info, args.dump, args.region)
				print(f"Dumped RAM to {args.dump}")
				continue

			if args.format == "json":
				output = {
					"file": str(filepath),
					"emulator": info.emulator.value,
					"version": info.version,
					"console": info.console,
					"rom_name": info.rom_name,
					"ram_size": info.ram_size,
					"vram_size": info.vram_size,
					"regions": [
						{
							"name": r.name,
							"start": f"${r.start:x}",
							"size": r.size,
							"description": r.description
						}
						for r in info.regions
					],
					"cpu_state": info.cpu_state,
				}
				print(json.dumps(output, indent=2))
			else:
				print(f"File: {filepath}")
				print(f"Emulator: {info.emulator.value}")
				if info.version:
					print(f"Version: {info.version}")
				print(f"Console: {info.console}")
				if info.rom_name:
					print(f"ROM: {info.rom_name}")
				print(f"RAM Size: {info.ram_size} bytes (${info.ram_size:x})")
				if info.vram_size:
					print(f"VRAM Size: {info.vram_size} bytes")
				print()
				print("Regions:")
				for region in info.regions:
					print(f"  {region.name}:")
					print(f"    Start: ${region.start:06x}")
					print(f"    Size:  ${region.size:x} ({region.size} bytes)")
					if region.description:
						print(f"    Desc:  {region.description}")
				if info.cpu_state:
					print()
					print("CPU State:")
					for key, value in info.cpu_state.items():
						if isinstance(value, int):
							print(f"  {key}: ${value:04x}" if value > 0xff else f"  {key}: ${value:02x}")
						else:
							print(f"  {key}: {value}")
				print()


if __name__ == "__main__":
	main()
