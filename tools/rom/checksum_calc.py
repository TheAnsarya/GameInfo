#!/usr/bin/env python3
"""
Checksum Calculator - Calculate and verify ROM checksums.

Tools for computing various ROM checksums including CRC32, MD5,
SHA1, and platform-specific internal checksums.

Usage:
	python checksum_calc.py rom.nes --all
	python checksum_calc.py rom.sfc --fix
	python checksum_calc.py --compare rom1 rom2

Features:
	- CRC32/MD5/SHA1
	- Internal checksums
	- Checksum fixing
	- Batch processing
	- Database lookup
"""

import argparse
import hashlib
import json
import os
import struct
import zlib
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


class ROMType(Enum):
	"""ROM platform types."""
	NES = auto()
	SNES = auto()
	GB = auto()
	GBC = auto()
	GBA = auto()
	GENESIS = auto()
	N64 = auto()
	UNKNOWN = auto()


@dataclass
class ChecksumResult:
	"""Checksum calculation result."""
	algorithm: str
	value: str
	expected: str = ""
	valid: bool = True

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"algorithm": self.algorithm,
			"value": self.value,
			"expected": self.expected,
			"valid": self.valid
		}


class ChecksumCalculator:
	"""Calculate various checksums."""

	@staticmethod
	def crc32(data: bytes) -> str:
		"""Calculate CRC32."""
		return f"{zlib.crc32(data) & 0xFFFFFFFF:08X}"

	@staticmethod
	def md5(data: bytes) -> str:
		"""Calculate MD5."""
		return hashlib.md5(data).hexdigest().upper()

	@staticmethod
	def sha1(data: bytes) -> str:
		"""Calculate SHA1."""
		return hashlib.sha1(data).hexdigest().upper()

	@staticmethod
	def sha256(data: bytes) -> str:
		"""Calculate SHA256."""
		return hashlib.sha256(data).hexdigest().upper()

	@staticmethod
	def simple_sum(data: bytes) -> int:
		"""Calculate simple byte sum."""
		return sum(data) & 0xFFFF

	@staticmethod
	def complement_check(data: bytes) -> Tuple[int, int]:
		"""Calculate checksum and complement."""
		checksum = sum(data) & 0xFFFF
		complement = (~checksum) & 0xFFFF
		return checksum, complement


class NESChecksum:
	"""NES ROM checksum handling."""

	HEADER_SIZE = 16

	@staticmethod
	def detect(data: bytes) -> bool:
		"""Check if data is NES ROM."""
		return len(data) >= 16 and data[0:4] == b'NES\x1a'

	@staticmethod
	def get_prg_data(data: bytes) -> bytes:
		"""Get PRG ROM data without header."""
		if len(data) < 16:
			return b""

		prg_size = data[4] * 16384
		start = 16
		if data[6] & 0x04:  # Trainer
			start += 512

		return data[start:start + prg_size]

	@staticmethod
	def calculate_all(data: bytes) -> Dict[str, str]:
		"""Calculate all checksums for NES ROM."""
		results = {}

		# Full ROM
		results["full_crc32"] = ChecksumCalculator.crc32(data)
		results["full_md5"] = ChecksumCalculator.md5(data)
		results["full_sha1"] = ChecksumCalculator.sha1(data)

		# PRG only (common for databases)
		prg_data = NESChecksum.get_prg_data(data)
		if prg_data:
			results["prg_crc32"] = ChecksumCalculator.crc32(prg_data)

		# No header
		no_header = data[16:]
		if data[6] & 0x04:  # Has trainer
			no_header = data[16 + 512:]
		results["no_header_crc32"] = ChecksumCalculator.crc32(no_header)

		return results


class SNESChecksum:
	"""SNES ROM checksum handling."""

	LOROM_HEADER = 0x7FB0
	HIROM_HEADER = 0xFFB0

	@staticmethod
	def detect(data: bytes) -> bool:
		"""Check if data is SNES ROM."""
		# Check for valid SNES header at LoROM or HiROM location
		for offset in [0x7FB0, 0xFFB0, 0x7FB0 + 512, 0xFFB0 + 512]:
			if offset + 64 <= len(data):
				# Check for valid checksum complement
				checksum = data[offset + 0x2C] | (data[offset + 0x2D] << 8)
				complement = data[offset + 0x2E] | (data[offset + 0x2F] << 8)
				if (checksum ^ complement) == 0xFFFF:
					return True
		return False

	@staticmethod
	def get_header_offset(data: bytes) -> int:
		"""Find internal header offset."""
		# Check LoROM first
		for offset in [0x7FB0, 0x7FB0 + 512]:
			if offset + 64 <= len(data):
				checksum = data[offset + 0x2C] | (data[offset + 0x2D] << 8)
				complement = data[offset + 0x2E] | (data[offset + 0x2F] << 8)
				if (checksum ^ complement) == 0xFFFF:
					return offset

		# Check HiROM
		for offset in [0xFFB0, 0xFFB0 + 512]:
			if offset + 64 <= len(data):
				checksum = data[offset + 0x2C] | (data[offset + 0x2D] << 8)
				complement = data[offset + 0x2E] | (data[offset + 0x2F] << 8)
				if (checksum ^ complement) == 0xFFFF:
					return offset

		return -1

	@staticmethod
	def read_internal_checksum(data: bytes) -> Tuple[int, int]:
		"""Read internal checksum and complement."""
		offset = SNESChecksum.get_header_offset(data)
		if offset < 0:
			return 0, 0

		complement = data[offset + 0x2C] | (data[offset + 0x2D] << 8)
		checksum = data[offset + 0x2E] | (data[offset + 0x2F] << 8)
		return checksum, complement

	@staticmethod
	def calculate_internal(data: bytes) -> int:
		"""Calculate internal SNES checksum."""
		# Remove header if present
		rom_data = data
		if len(data) % 1024 == 512:
			rom_data = data[512:]

		# Calculate sum of all bytes
		return sum(rom_data) & 0xFFFF

	@staticmethod
	def fix_checksum(data: bytearray) -> bool:
		"""Fix internal SNES checksum."""
		offset = SNESChecksum.get_header_offset(bytes(data))
		if offset < 0:
			return False

		# Zero out checksum fields first
		data[offset + 0x2C] = 0
		data[offset + 0x2D] = 0
		data[offset + 0x2E] = 0
		data[offset + 0x2F] = 0

		# Calculate new checksum
		rom_data = bytes(data)
		if len(data) % 1024 == 512:
			rom_data = bytes(data[512:])

		checksum = sum(rom_data) & 0xFFFF
		complement = (~checksum) & 0xFFFF

		# Write new values
		data[offset + 0x2C] = complement & 0xFF
		data[offset + 0x2D] = (complement >> 8) & 0xFF
		data[offset + 0x2E] = checksum & 0xFF
		data[offset + 0x2F] = (checksum >> 8) & 0xFF

		return True

	@staticmethod
	def calculate_all(data: bytes) -> Dict[str, str]:
		"""Calculate all checksums for SNES ROM."""
		results = {}

		# Full ROM
		results["full_crc32"] = ChecksumCalculator.crc32(data)
		results["full_md5"] = ChecksumCalculator.md5(data)
		results["full_sha1"] = ChecksumCalculator.sha1(data)

		# No header
		if len(data) % 1024 == 512:
			no_header = data[512:]
			results["no_header_crc32"] = ChecksumCalculator.crc32(no_header)

		# Internal checksum
		checksum, complement = SNESChecksum.read_internal_checksum(data)
		results["internal_checksum"] = f"{checksum:04X}"
		results["internal_complement"] = f"{complement:04X}"

		# Calculated
		calc = SNESChecksum.calculate_internal(data)
		results["calculated_checksum"] = f"{calc:04X}"
		results["checksum_valid"] = str(checksum == calc)

		return results


class GBChecksum:
	"""Game Boy ROM checksum handling."""

	HEADER_CHECKSUM_ADDR = 0x014D
	GLOBAL_CHECKSUM_ADDR = 0x014E

	@staticmethod
	def detect(data: bytes) -> bool:
		"""Check if data is GB/GBC ROM."""
		if len(data) < 0x150:
			return False

		# Check Nintendo logo
		logo = bytes([
			0xCE, 0xED, 0x66, 0x66, 0xCC, 0x0D, 0x00, 0x0B,
			0x03, 0x73, 0x00, 0x83, 0x00, 0x0C, 0x00, 0x0D
		])
		return data[0x0104:0x0114] == logo

	@staticmethod
	def calculate_header_checksum(data: bytes) -> int:
		"""Calculate header checksum (0x0134-0x014C)."""
		checksum = 0
		for i in range(0x0134, 0x014D):
			checksum = (checksum - data[i] - 1) & 0xFF
		return checksum

	@staticmethod
	def calculate_global_checksum(data: bytes) -> int:
		"""Calculate global checksum (all bytes except checksum itself)."""
		checksum = 0
		for i in range(len(data)):
			if i not in [0x014E, 0x014F]:
				checksum = (checksum + data[i]) & 0xFFFF
		return checksum

	@staticmethod
	def read_checksums(data: bytes) -> Tuple[int, int]:
		"""Read stored checksums."""
		header = data[0x014D]
		global_cs = (data[0x014E] << 8) | data[0x014F]
		return header, global_cs

	@staticmethod
	def fix_checksums(data: bytearray) -> bool:
		"""Fix Game Boy checksums."""
		if len(data) < 0x150:
			return False

		# Fix header checksum
		header_cs = GBChecksum.calculate_header_checksum(bytes(data))
		data[0x014D] = header_cs

		# Fix global checksum
		global_cs = GBChecksum.calculate_global_checksum(bytes(data))
		data[0x014E] = (global_cs >> 8) & 0xFF
		data[0x014F] = global_cs & 0xFF

		return True

	@staticmethod
	def calculate_all(data: bytes) -> Dict[str, str]:
		"""Calculate all checksums for GB ROM."""
		results = {}

		# Full ROM
		results["full_crc32"] = ChecksumCalculator.crc32(data)
		results["full_md5"] = ChecksumCalculator.md5(data)
		results["full_sha1"] = ChecksumCalculator.sha1(data)

		# Internal checksums
		stored_header, stored_global = GBChecksum.read_checksums(data)
		calc_header = GBChecksum.calculate_header_checksum(data)
		calc_global = GBChecksum.calculate_global_checksum(data)

		results["header_checksum"] = f"{stored_header:02X}"
		results["header_calculated"] = f"{calc_header:02X}"
		results["header_valid"] = str(stored_header == calc_header)

		results["global_checksum"] = f"{stored_global:04X}"
		results["global_calculated"] = f"{calc_global:04X}"
		results["global_valid"] = str(stored_global == calc_global)

		return results


class ROMAnalyzer:
	"""Analyze ROM files."""

	@staticmethod
	def detect_type(data: bytes) -> ROMType:
		"""Detect ROM type."""
		if NESChecksum.detect(data):
			return ROMType.NES
		if SNESChecksum.detect(data):
			return ROMType.SNES
		if GBChecksum.detect(data):
			# Check for GBC
			if len(data) > 0x143 and data[0x143] in [0x80, 0xC0]:
				return ROMType.GBC
			return ROMType.GB

		# Check file size for Genesis
		if len(data) >= 512 and data[0x100:0x104] == b'SEGA':
			return ROMType.GENESIS

		return ROMType.UNKNOWN

	@staticmethod
	def calculate_all(filepath: str) -> Dict[str, Any]:
		"""Calculate all checksums for a ROM."""
		with open(filepath, "rb") as f:
			data = f.read()

		rom_type = ROMAnalyzer.detect_type(data)

		result = {
			"file": filepath,
			"size": len(data),
			"type": rom_type.name
		}

		if rom_type == ROMType.NES:
			result["checksums"] = NESChecksum.calculate_all(data)
		elif rom_type == ROMType.SNES:
			result["checksums"] = SNESChecksum.calculate_all(data)
		elif rom_type in [ROMType.GB, ROMType.GBC]:
			result["checksums"] = GBChecksum.calculate_all(data)
		else:
			# Generic checksums
			result["checksums"] = {
				"crc32": ChecksumCalculator.crc32(data),
				"md5": ChecksumCalculator.md5(data),
				"sha1": ChecksumCalculator.sha1(data)
			}

		return result


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Checksum Calculator")
	parser.add_argument("files", nargs="*", help="ROM file(s)")
	parser.add_argument("--all", "-a", action="store_true",
						help="Calculate all checksums")
	parser.add_argument("--crc32", "-c", action="store_true",
						help="Calculate CRC32 only")
	parser.add_argument("--md5", "-m", action="store_true",
						help="Calculate MD5 only")
	parser.add_argument("--sha1", "-s", action="store_true",
						help="Calculate SHA1 only")
	parser.add_argument("--fix", "-f", action="store_true",
						help="Fix internal checksum")
	parser.add_argument("--verify", "-v", action="store_true",
						help="Verify internal checksum")
	parser.add_argument("--compare", action="store_true",
						help="Compare two ROMs")
	parser.add_argument("--output", "-o", help="Output file")
	parser.add_argument("--json", "-j", action="store_true",
						help="Output as JSON")

	args = parser.parse_args()

	if not args.files:
		print("Checksum Calculator")
		print()
		print("Usage: python checksum_calc.py <files> [options]")
		print()
		print("Options:")
		print("  --all, -a      Calculate all checksums")
		print("  --crc32, -c    CRC32 only")
		print("  --md5, -m      MD5 only")
		print("  --sha1, -s     SHA1 only")
		print("  --fix, -f      Fix internal checksum")
		print("  --verify, -v   Verify internal checksum")
		print("  --compare      Compare two ROMs")
		print("  --json, -j     Output as JSON")
		print()
		print("Examples:")
		print("  Calculate all checksums:")
		print("    python checksum_calc.py game.nes --all")
		print()
		print("  Fix SNES checksum:")
		print("    python checksum_calc.py game.sfc --fix")
		print()
		print("  Compare two ROMs:")
		print("    python checksum_calc.py rom1.nes rom2.nes --compare")
		return

	# Compare mode
	if args.compare and len(args.files) >= 2:
		with open(args.files[0], "rb") as f:
			data1 = f.read()
		with open(args.files[1], "rb") as f:
			data2 = f.read()

		print(f"Comparing {args.files[0]} vs {args.files[1]}")
		print()

		crc1 = ChecksumCalculator.crc32(data1)
		crc2 = ChecksumCalculator.crc32(data2)
		md5_1 = ChecksumCalculator.md5(data1)
		md5_2 = ChecksumCalculator.md5(data2)

		print(f"Size: {len(data1)} vs {len(data2)} - {'MATCH' if len(data1) == len(data2) else 'DIFFERENT'}")
		print(f"CRC32: {crc1} vs {crc2} - {'MATCH' if crc1 == crc2 else 'DIFFERENT'}")
		print(f"MD5: {md5_1[:16]}... vs {md5_2[:16]}... - {'MATCH' if md5_1 == md5_2 else 'DIFFERENT'}")

		if len(data1) == len(data2):
			diffs = sum(1 for a, b in zip(data1, data2) if a != b)
			print(f"Byte differences: {diffs}")
		return

	# Fix checksum
	if args.fix:
		for filepath in args.files:
			with open(filepath, "rb") as f:
				data = bytearray(f.read())

			rom_type = ROMAnalyzer.detect_type(bytes(data))

			if rom_type == ROMType.SNES:
				if SNESChecksum.fix_checksum(data):
					out_file = args.output or filepath
					with open(out_file, "wb") as f:
						f.write(data)
					print(f"Fixed SNES checksum: {out_file}")
				else:
					print(f"Failed to fix: {filepath}")

			elif rom_type in [ROMType.GB, ROMType.GBC]:
				if GBChecksum.fix_checksums(data):
					out_file = args.output or filepath
					with open(out_file, "wb") as f:
						f.write(data)
					print(f"Fixed GB checksum: {out_file}")
				else:
					print(f"Failed to fix: {filepath}")

			else:
				print(f"Cannot fix checksums for {rom_type.name}: {filepath}")
		return

	# Calculate checksums
	results = []

	for filepath in args.files:
		if not os.path.exists(filepath):
			print(f"File not found: {filepath}")
			continue

		with open(filepath, "rb") as f:
			data = f.read()

		if args.all:
			result = ROMAnalyzer.calculate_all(filepath)
			results.append(result)

			if not args.json:
				print(f"\n{filepath}")
				print(f"  Type: {result['type']}")
				print(f"  Size: {result['size']} bytes")
				for key, value in result['checksums'].items():
					print(f"  {key}: {value}")

		elif args.crc32:
			crc = ChecksumCalculator.crc32(data)
			results.append({"file": filepath, "crc32": crc})
			if not args.json:
				print(f"{crc}  {filepath}")

		elif args.md5:
			md5 = ChecksumCalculator.md5(data)
			results.append({"file": filepath, "md5": md5})
			if not args.json:
				print(f"{md5}  {filepath}")

		elif args.sha1:
			sha1 = ChecksumCalculator.sha1(data)
			results.append({"file": filepath, "sha1": sha1})
			if not args.json:
				print(f"{sha1}  {filepath}")

		elif args.verify:
			rom_type = ROMAnalyzer.detect_type(data)

			if rom_type == ROMType.SNES:
				stored, _ = SNESChecksum.read_internal_checksum(data)
				calc = SNESChecksum.calculate_internal(data)
				valid = stored == calc
				print(f"{filepath}: {'VALID' if valid else 'INVALID'} (stored: {stored:04X}, calc: {calc:04X})")

			elif rom_type in [ROMType.GB, ROMType.GBC]:
				stored_h, stored_g = GBChecksum.read_checksums(data)
				calc_h = GBChecksum.calculate_header_checksum(data)
				calc_g = GBChecksum.calculate_global_checksum(data)
				valid = stored_h == calc_h and stored_g == calc_g
				print(f"{filepath}: {'VALID' if valid else 'INVALID'}")

			else:
				print(f"{filepath}: No internal checksum for {rom_type.name}")

		else:
			# Default: show common checksums
			crc = ChecksumCalculator.crc32(data)
			md5 = ChecksumCalculator.md5(data)
			results.append({"file": filepath, "crc32": crc, "md5": md5})
			if not args.json:
				print(f"{filepath}")
				print(f"  CRC32: {crc}")
				print(f"  MD5:   {md5}")

	if args.json:
		output = json.dumps(results, indent="\t")
		if args.output:
			with open(args.output, "w") as f:
				f.write(output)
			print(f"Saved to {args.output}")
		else:
			print(output)


if __name__ == "__main__":
	main()
