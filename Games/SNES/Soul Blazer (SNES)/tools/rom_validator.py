#!/usr/bin/env python3
"""
Soul Blazer - ROM Validator
Validates ROM integrity, checksums, and header information.
"""

import argparse
import hashlib
import os
import struct
from dataclasses import dataclass
from typing import Optional, Dict, List, Tuple
from enum import IntEnum


class ROMRegion(IntEnum):
	"""SNES ROM regions."""
	JAPAN = 0x00
	USA = 0x01
	EUROPE = 0x02
	SWEDEN = 0x03
	FINLAND = 0x04
	DENMARK = 0x05
	FRANCE = 0x06
	NETHERLANDS = 0x07
	SPAIN = 0x08
	GERMANY = 0x09
	ITALY = 0x0A
	CHINA = 0x0B
	KOREA = 0x0D
	CANADA = 0x0F


class MapMode(IntEnum):
	"""SNES ROM mapping modes."""
	LOROM = 0x20
	HIROM = 0x21
	LOROM_SA1 = 0x23
	HIROM_SA1 = 0x25
	EXLOROM = 0x30
	EXHIROM = 0x35


@dataclass
class SNESHeader:
	"""SNES ROM header information."""
	title: str
	map_mode: int
	rom_type: int
	rom_size: int
	sram_size: int
	region: int
	developer_id: int
	version: int
	checksum_complement: int
	checksum: int

	# Interrupt vectors
	cop_vector: int
	brk_vector: int
	abort_vector: int
	nmi_vector: int
	reset_vector: int
	irq_vector: int


@dataclass
class ValidationResult:
	"""Result of ROM validation."""
	valid: bool
	errors: List[str]
	warnings: List[str]
	info: Dict[str, str]


class SoulBlazerValidator:
	"""Validates Soul Blazer ROM files."""

	# Known good hashes for US version
	KNOWN_HASHES = {
		"sha256": "8438da09de8ce9aded3bb08644543f7b60fb60cffc68ce2d67d6a0643f2ecfc2",
		"sha1": "f2832eb02547c39cae3bdaab5c2a53e4f8b31810",
		"md5": "83cf41d53a1b94aeea1a645037a24004",
		"crc32": "31b965db",
	}

	# Expected header values
	EXPECTED_TITLE = "SOULBLAZER - 1 USA"
	EXPECTED_SIZE = 1048576  # 1 MB
	EXPECTED_MAP_MODE = MapMode.LOROM
	EXPECTED_REGION = ROMRegion.USA

	# Header offset for LoROM
	LOROM_HEADER_OFFSET = 0x7FC0
	HIROM_HEADER_OFFSET = 0xFFC0

	def __init__(self):
		"""Initialize validator."""
		self.rom_data: Optional[bytes] = None
		self.header: Optional[SNESHeader] = None
		self.has_copier_header = False

	def load_rom(self, rom_path: str) -> bool:
		"""
		Load and validate ROM file.

		Args:
			rom_path: Path to ROM file

		Returns:
			True if loaded successfully
		"""
		if not os.path.exists(rom_path):
			print(f"Error: File not found: {rom_path}")
			return False

		with open(rom_path, "rb") as f:
			self.rom_data = f.read()

		file_size = len(self.rom_data)
		print(f"Loaded: {rom_path}")
		print(f"File size: {file_size:,} bytes ({file_size / 1024:.1f} KB)")

		# Check for copier header (512 bytes)
		if file_size % 1024 == 512:
			print("Detected: 512-byte copier header")
			self.has_copier_header = True
			self.rom_data = self.rom_data[512:]
			print(f"ROM size (without header): {len(self.rom_data):,} bytes")

		return True

	def read_header(self) -> Optional[SNESHeader]:
		"""
		Read SNES header from ROM.

		Returns:
			SNESHeader or None if invalid
		"""
		if not self.rom_data:
			return None

		# Try LoROM offset first
		offset = self.LOROM_HEADER_OFFSET

		if len(self.rom_data) < offset + 64:
			print("Error: ROM too small for header")
			return None

		# Read header bytes
		header_data = self.rom_data[offset:offset + 64]

		# Parse header
		title_bytes = header_data[0:21]
		title = title_bytes.decode("ascii", errors="replace").rstrip("\x00 ")

		map_mode = header_data[21]
		rom_type = header_data[22]
		rom_size = header_data[23]
		sram_size = header_data[24]
		region = header_data[25]
		developer_id = header_data[26]
		version = header_data[27]
		checksum_complement = struct.unpack("<H", header_data[28:30])[0]
		checksum = struct.unpack("<H", header_data[30:32])[0]

		# Read vectors (at offset + 32)
		vectors = self.rom_data[offset + 32:offset + 64]
		cop_vector = struct.unpack("<H", vectors[4:6])[0]
		brk_vector = struct.unpack("<H", vectors[6:8])[0]
		abort_vector = struct.unpack("<H", vectors[8:10])[0]
		nmi_vector = struct.unpack("<H", vectors[10:12])[0]
		reset_vector = struct.unpack("<H", vectors[14:16])[0]
		irq_vector = struct.unpack("<H", vectors[22:24])[0]

		self.header = SNESHeader(
			title=title,
			map_mode=map_mode,
			rom_type=rom_type,
			rom_size=rom_size,
			sram_size=sram_size,
			region=region,
			developer_id=developer_id,
			version=version,
			checksum_complement=checksum_complement,
			checksum=checksum,
			cop_vector=cop_vector,
			brk_vector=brk_vector,
			abort_vector=abort_vector,
			nmi_vector=nmi_vector,
			reset_vector=reset_vector,
			irq_vector=irq_vector,
		)

		return self.header

	def calculate_checksum(self) -> int:
		"""
		Calculate ROM checksum.

		Returns:
			16-bit checksum
		"""
		if not self.rom_data:
			return 0

		# Simple sum of all bytes, mod 65536
		checksum = sum(self.rom_data) & 0xFFFF
		return checksum

	def calculate_hashes(self) -> Dict[str, str]:
		"""
		Calculate all hash values for ROM.

		Returns:
			Dictionary of hash type to hash value
		"""
		if not self.rom_data:
			return {}

		return {
			"sha256": hashlib.sha256(self.rom_data).hexdigest(),
			"sha1": hashlib.sha1(self.rom_data).hexdigest(),
			"md5": hashlib.md5(self.rom_data).hexdigest(),
			"crc32": f"{self._crc32(self.rom_data):08x}",
		}

	def _crc32(self, data: bytes) -> int:
		"""Calculate CRC32."""
		import binascii
		return binascii.crc32(data) & 0xFFFFFFFF

	def validate_soul_blazer(self) -> ValidationResult:
		"""
		Perform full validation for Soul Blazer ROM.

		Returns:
			ValidationResult with all findings
		"""
		errors = []
		warnings = []
		info = {}

		if not self.rom_data:
			return ValidationResult(False, ["No ROM loaded"], [], {})

		# Calculate hashes
		hashes = self.calculate_hashes()
		info["SHA256"] = hashes["sha256"]
		info["SHA1"] = hashes["sha1"]
		info["MD5"] = hashes["md5"]
		info["CRC32"] = hashes["crc32"]

		# Read header
		header = self.read_header()
		if not header:
			errors.append("Failed to read ROM header")
			return ValidationResult(False, errors, warnings, info)

		info["Title"] = header.title
		info["Region"] = self._region_name(header.region)
		info["Map Mode"] = self._map_mode_name(header.map_mode)
		info["ROM Size"] = f"{len(self.rom_data):,} bytes"
		info["SRAM Size"] = f"{1024 << header.sram_size} bytes" if header.sram_size else "None"
		info["Version"] = f"1.{header.version}"

		# Validate file size
		if len(self.rom_data) != self.EXPECTED_SIZE:
			warnings.append(f"Unexpected size: {len(self.rom_data):,} (expected {self.EXPECTED_SIZE:,})")

		# Validate title
		if self.EXPECTED_TITLE not in header.title:
			if "SOUL" in header.title.upper():
				warnings.append(f"Title variation: '{header.title}'")
			else:
				errors.append(f"Wrong game: '{header.title}'")

		# Validate map mode
		if header.map_mode != self.EXPECTED_MAP_MODE:
			warnings.append(f"Unexpected map mode: 0x{header.map_mode:02X}")

		# Validate checksum
		calculated = self.calculate_checksum()
		# Mask out the header checksum bytes for comparison
		# (they're included in the checksum but should add to 0xFFFF)
		expected = header.checksum
		info["Header Checksum"] = f"0x{expected:04X}"
		info["Calculated Checksum"] = f"0x{calculated:04X}"

		if (calculated + header.checksum_complement) & 0xFFFF != 0xFFFF:
			warnings.append("Checksum validation failed (may be modified ROM)")

		# Check against known hashes
		if hashes["sha256"] == self.KNOWN_HASHES["sha256"]:
			info["Match"] = "Known good US ROM"
		else:
			warnings.append("SHA256 does not match known good ROM")
			info["Match"] = "Unknown or modified ROM"

		# Check interrupt vectors
		if header.reset_vector < 0x8000:
			errors.append(f"Invalid reset vector: 0x{header.reset_vector:04X}")

		if header.nmi_vector < 0x8000:
			warnings.append(f"Unusual NMI vector: 0x{header.nmi_vector:04X}")

		# Copier header warning
		if self.has_copier_header:
			warnings.append("ROM had copier header (was removed for validation)")

		valid = len(errors) == 0
		return ValidationResult(valid, errors, warnings, info)

	def _region_name(self, region: int) -> str:
		"""Get region name from code."""
		names = {
			0x00: "Japan",
			0x01: "USA",
			0x02: "Europe",
			0x03: "Sweden",
			0x04: "Finland",
			0x05: "Denmark",
			0x06: "France",
			0x07: "Netherlands",
			0x08: "Spain",
			0x09: "Germany",
			0x0A: "Italy",
			0x0B: "China",
			0x0D: "Korea",
			0x0F: "Canada",
		}
		return names.get(region, f"Unknown (0x{region:02X})")

	def _map_mode_name(self, mode: int) -> str:
		"""Get map mode name from code."""
		names = {
			0x20: "LoROM",
			0x21: "HiROM",
			0x23: "LoROM + SA-1",
			0x25: "HiROM + SA-1",
			0x30: "ExLoROM",
			0x35: "ExHiROM",
		}
		return names.get(mode, f"Unknown (0x{mode:02X})")

	def print_header(self):
		"""Print header information."""
		if not self.header:
			print("No header loaded")
			return

		print("\nSNES Header Information")
		print("=" * 50)
		print(f"Title:           {self.header.title}")
		print(f"Map Mode:        {self._map_mode_name(self.header.map_mode)}")
		print(f"ROM Type:        0x{self.header.rom_type:02X}")
		print(f"ROM Size:        {1024 << self.header.rom_size} KB")
		print(f"SRAM Size:       {1024 << self.header.sram_size if self.header.sram_size else 0} bytes")
		print(f"Region:          {self._region_name(self.header.region)}")
		print(f"Developer ID:    0x{self.header.developer_id:02X}")
		print(f"Version:         1.{self.header.version}")
		print(f"Checksum:        0x{self.header.checksum:04X}")
		print(f"Complement:      0x{self.header.checksum_complement:04X}")

		print("\nInterrupt Vectors")
		print("-" * 30)
		print(f"RESET:   ${self.header.reset_vector:04X}")
		print(f"NMI:     ${self.header.nmi_vector:04X}")
		print(f"IRQ:     ${self.header.irq_vector:04X}")
		print(f"COP:     ${self.header.cop_vector:04X}")
		print(f"BRK:     ${self.header.brk_vector:04X}")
		print(f"ABORT:   ${self.header.abort_vector:04X}")

	def print_validation(self, result: ValidationResult):
		"""Print validation results."""
		print("\nValidation Results")
		print("=" * 50)

		if result.valid:
			print("✓ ROM is VALID")
		else:
			print("✗ ROM is INVALID")

		if result.errors:
			print("\nErrors:")
			for error in result.errors:
				print(f"  ✗ {error}")

		if result.warnings:
			print("\nWarnings:")
			for warning in result.warnings:
				print(f"  ⚠ {warning}")

		print("\nInformation:")
		for key, value in result.info.items():
			print(f"  {key}: {value}")

	def compare_roms(self, other_path: str) -> List[Tuple[int, int, int]]:
		"""
		Compare current ROM with another.

		Args:
			other_path: Path to other ROM

		Returns:
			List of (offset, byte1, byte2) differences
		"""
		if not self.rom_data:
			return []

		with open(other_path, "rb") as f:
			other_data = f.read()

		# Handle copier headers
		if len(other_data) % 1024 == 512:
			other_data = other_data[512:]

		differences = []
		min_len = min(len(self.rom_data), len(other_data))

		for i in range(min_len):
			if self.rom_data[i] != other_data[i]:
				differences.append((i, self.rom_data[i], other_data[i]))

		# Report size differences
		if len(self.rom_data) != len(other_data):
			print(f"Size difference: {len(self.rom_data)} vs {len(other_data)}")

		return differences

	def export_info(self, filepath: str):
		"""Export validation info to JSON."""
		import json

		result = self.validate_soul_blazer()
		hashes = self.calculate_hashes()

		data = {
			"validation": {
				"valid": result.valid,
				"errors": result.errors,
				"warnings": result.warnings,
			},
			"header": {
				"title": self.header.title if self.header else None,
				"map_mode": self._map_mode_name(self.header.map_mode) if self.header else None,
				"region": self._region_name(self.header.region) if self.header else None,
				"rom_size": len(self.rom_data) if self.rom_data else 0,
				"version": f"1.{self.header.version}" if self.header else None,
			},
			"hashes": hashes,
			"vectors": {
				"reset": f"${self.header.reset_vector:04X}" if self.header else None,
				"nmi": f"${self.header.nmi_vector:04X}" if self.header else None,
				"irq": f"${self.header.irq_vector:04X}" if self.header else None,
			},
		}

		with open(filepath, "w", encoding="utf-8") as f:
			json.dump(data, f, indent="\t")

		print(f"Exported to: {filepath}")


def main():
	parser = argparse.ArgumentParser(
		description="Soul Blazer ROM Validator"
	)

	parser.add_argument("rom", nargs="?", help="ROM file to validate")
	parser.add_argument("--header", action="store_true",
						help="Show detailed header info")
	parser.add_argument("--hashes", action="store_true",
						help="Show all hash values")
	parser.add_argument("--compare", type=str, metavar="ROM2",
						help="Compare with another ROM")
	parser.add_argument("--export", type=str, metavar="FILE",
						help="Export info to JSON file")
	parser.add_argument("--quiet", "-q", action="store_true",
						help="Only show errors")

	args = parser.parse_args()

	if not args.rom:
		parser.print_help()
		print("\nExamples:")
		print("  python rom_validator.py game.sfc")
		print("  python rom_validator.py game.sfc --header")
		print("  python rom_validator.py game.sfc --compare other.sfc")
		print("  python rom_validator.py game.sfc --export info.json")
		return

	validator = SoulBlazerValidator()

	if not validator.load_rom(args.rom):
		return

	if args.header:
		validator.read_header()
		validator.print_header()

	if args.hashes:
		hashes = validator.calculate_hashes()
		print("\nFile Hashes")
		print("=" * 70)
		for name, value in hashes.items():
			print(f"{name.upper()}: {value}")

	if args.compare:
		print(f"\nComparing with: {args.compare}")
		print("=" * 50)
		diffs = validator.compare_roms(args.compare)

		if not diffs:
			print("Files are identical")
		else:
			print(f"Found {len(diffs)} differences:")
			for i, (offset, b1, b2) in enumerate(diffs[:20]):
				print(f"  0x{offset:06X}: 0x{b1:02X} → 0x{b2:02X}")
			if len(diffs) > 20:
				print(f"  ... and {len(diffs) - 20} more")

	if args.export:
		validator.export_info(args.export)

	if not args.header and not args.compare:
		result = validator.validate_soul_blazer()
		if not args.quiet or not result.valid:
			validator.print_validation(result)


if __name__ == "__main__":
	main()
