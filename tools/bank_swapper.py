#!/usr/bin/env python3
"""
Bank Swapper - ROM Bank Management Tool

Swap, extract, insert, and analyze ROM banks for NES/SNES/GB ROMs.
Handles various mapper configurations and bank sizes.
"""

import argparse
import hashlib
import json
import sys
from pathlib import Path
from typing import Dict, List, Optional, Tuple


class BankInfo:
	"""Information about a ROM bank."""

	def __init__(
		self,
		index: int,
		offset: int,
		size: int,
		data: bytes,
	):
		self.index = index
		self.offset = offset
		self.size = size
		self.data = data
		self.checksum = hashlib.md5(data).hexdigest()[:8]

	@property
	def is_empty(self) -> bool:
		"""Check if bank is empty (all 0x00 or 0xFF)."""
		if all(b == 0x00 for b in self.data):
			return True
		if all(b == 0xFF for b in self.data):
			return True
		return False

	def get_statistics(self) -> Dict:
		"""Get bank statistics."""
		byte_counts = {}
		for b in self.data:
			byte_counts[b] = byte_counts.get(b, 0) + 1

		# Most common byte
		most_common = max(byte_counts.items(), key=lambda x: x[1])

		# Calculate entropy (simplified)
		total = len(self.data)
		entropy = 0
		for count in byte_counts.values():
			if count > 0:
				p = count / total
				entropy -= p * (p if p > 0 else 1)

		return {
			"size": self.size,
			"checksum": self.checksum,
			"is_empty": self.is_empty,
			"unique_bytes": len(byte_counts),
			"most_common_byte": f"${most_common[0]:02X}",
			"most_common_count": most_common[1],
			"fill_percentage": (most_common[1] / total) * 100,
		}


class BankManager:
	"""Manages ROM banks for various console types."""

	# Common bank sizes
	BANK_SIZES = {
		"nes_prg_16k": 0x4000,  # 16KB PRG banks
		"nes_prg_8k": 0x2000,   # 8KB PRG banks
		"nes_chr_8k": 0x2000,   # 8KB CHR banks
		"nes_chr_4k": 0x1000,   # 4KB CHR banks
		"snes_32k": 0x8000,     # 32KB banks
		"snes_64k": 0x10000,    # 64KB banks
		"gb_16k": 0x4000,       # 16KB banks
		"gba_32k": 0x8000,      # 32KB banks
	}

	def __init__(self, rom_path: Path):
		self.rom_path = rom_path
		self.rom_data = rom_path.read_bytes()
		self.header_size = 0
		self.bank_size = 0x4000  # Default 16KB
		self.banks: List[BankInfo] = []

		self._detect_format()

	def _detect_format(self):
		"""Detect ROM format and configure accordingly."""
		# Check for iNES header
		if self.rom_data[:4] == b'NES\x1a':
			self.format = "nes"
			self.header_size = 16
			prg_banks = self.rom_data[4]
			chr_banks = self.rom_data[5]
			self.prg_size = prg_banks * 0x4000
			self.chr_size = chr_banks * 0x2000
			self.bank_size = 0x4000
			print(f"Detected: NES iNES format ({prg_banks} PRG banks, {chr_banks} CHR banks)")

		# Check for SNES header
		elif self._check_snes():
			self.format = "snes"
			self.header_size = 0x200 if (len(self.rom_data) % 0x8000) == 0x200 else 0
			self.bank_size = 0x8000
			print(f"Detected: SNES format (header: {self.header_size} bytes)")

		# Check for GB header
		elif len(self.rom_data) >= 0x150 and self.rom_data[0x104:0x134]:
			self.format = "gb"
			self.header_size = 0
			self.bank_size = 0x4000
			print("Detected: Game Boy format")

		else:
			self.format = "raw"
			self.header_size = 0
			self.bank_size = 0x4000
			print("Detected: Raw/unknown format")

		self._split_banks()

	def _check_snes(self) -> bool:
		"""Check if ROM is SNES format."""
		# Check for SMC header
		if (len(self.rom_data) % 0x8000) == 0x200:
			# Has SMC header, check internal header
			header_offset = 0x200 + 0x7FC0
		else:
			header_offset = 0x7FC0

		if header_offset + 0x40 <= len(self.rom_data):
			# Check for valid internal header
			title = self.rom_data[header_offset:header_offset + 21]
			if all(0x20 <= b < 0x7F or b == 0x00 for b in title):
				return True

		return False

	def _split_banks(self):
		"""Split ROM into banks."""
		self.banks = []
		rom_only = self.rom_data[self.header_size:]
		num_banks = len(rom_only) // self.bank_size

		for i in range(num_banks):
			offset = i * self.bank_size
			data = rom_only[offset:offset + self.bank_size]
			bank = BankInfo(i, self.header_size + offset, self.bank_size, data)
			self.banks.append(bank)

		# Handle remaining bytes
		remaining = len(rom_only) % self.bank_size
		if remaining > 0:
			offset = num_banks * self.bank_size
			data = rom_only[offset:]
			bank = BankInfo(num_banks, self.header_size + offset, remaining, data)
			self.banks.append(bank)

	def get_bank(self, index: int) -> Optional[BankInfo]:
		"""Get bank by index."""
		if 0 <= index < len(self.banks):
			return self.banks[index]
		return None

	def set_bank(self, index: int, data: bytes):
		"""Set bank data."""
		if 0 <= index < len(self.banks):
			if len(data) != self.banks[index].size:
				raise ValueError(f"Bank size mismatch: expected {self.banks[index].size}, got {len(data)}")
			self.banks[index] = BankInfo(index, self.banks[index].offset, len(data), data)

	def swap_banks(self, index1: int, index2: int):
		"""Swap two banks."""
		if not (0 <= index1 < len(self.banks) and 0 <= index2 < len(self.banks)):
			raise ValueError(f"Invalid bank indices: {index1}, {index2}")

		# Swap data
		data1 = self.banks[index1].data
		data2 = self.banks[index2].data

		self.banks[index1] = BankInfo(index1, self.banks[index1].offset, len(data2), data2)
		self.banks[index2] = BankInfo(index2, self.banks[index2].offset, len(data1), data1)

	def duplicate_bank(self, source: int, dest: int):
		"""Copy one bank to another."""
		if not (0 <= source < len(self.banks) and 0 <= dest < len(self.banks)):
			raise ValueError(f"Invalid bank indices: {source}, {dest}")

		data = self.banks[source].data
		self.banks[dest] = BankInfo(dest, self.banks[dest].offset, len(data), data)

	def fill_bank(self, index: int, value: int = 0xFF):
		"""Fill bank with a single byte value."""
		if not (0 <= index < len(self.banks)):
			raise ValueError(f"Invalid bank index: {index}")

		data = bytes([value] * self.banks[index].size)
		self.banks[index] = BankInfo(index, self.banks[index].offset, len(data), data)

	def extract_bank(self, index: int, output_path: Path):
		"""Extract a bank to a file."""
		if not (0 <= index < len(self.banks)):
			raise ValueError(f"Invalid bank index: {index}")

		output_path.write_bytes(self.banks[index].data)

	def insert_bank(self, index: int, input_path: Path):
		"""Insert a bank from a file."""
		if not (0 <= index < len(self.banks)):
			raise ValueError(f"Invalid bank index: {index}")

		data = input_path.read_bytes()
		self.set_bank(index, data)

	def rebuild_rom(self) -> bytes:
		"""Rebuild ROM from banks."""
		# Start with header
		result = bytearray(self.rom_data[:self.header_size])

		# Add all banks
		for bank in self.banks:
			result.extend(bank.data)

		return bytes(result)

	def save_rom(self, output_path: Path):
		"""Save modified ROM."""
		rom_data = self.rebuild_rom()
		output_path.write_bytes(rom_data)

	def find_duplicate_banks(self) -> List[Tuple[int, int]]:
		"""Find banks with identical content."""
		duplicates = []
		checksums = {}

		for i, bank in enumerate(self.banks):
			if bank.checksum in checksums:
				duplicates.append((checksums[bank.checksum], i))
			else:
				checksums[bank.checksum] = i

		return duplicates

	def find_empty_banks(self) -> List[int]:
		"""Find empty banks."""
		return [i for i, bank in enumerate(self.banks) if bank.is_empty]

	def compare_banks(self, index1: int, index2: int) -> Dict:
		"""Compare two banks."""
		if not (0 <= index1 < len(self.banks) and 0 <= index2 < len(self.banks)):
			raise ValueError(f"Invalid bank indices: {index1}, {index2}")

		bank1 = self.banks[index1]
		bank2 = self.banks[index2]

		# Find differences
		differences = []
		for i in range(min(len(bank1.data), len(bank2.data))):
			if bank1.data[i] != bank2.data[i]:
				differences.append({
					"offset": i,
					"bank1": f"${bank1.data[i]:02X}",
					"bank2": f"${bank2.data[i]:02X}",
				})

		return {
			"bank1_size": bank1.size,
			"bank2_size": bank2.size,
			"identical": bank1.checksum == bank2.checksum,
			"difference_count": len(differences),
			"differences": differences[:100],  # Limit output
		}

	def get_summary(self) -> Dict:
		"""Get ROM summary."""
		return {
			"format": self.format,
			"total_size": len(self.rom_data),
			"header_size": self.header_size,
			"bank_size": self.bank_size,
			"bank_count": len(self.banks),
			"empty_banks": len(self.find_empty_banks()),
			"duplicate_pairs": len(self.find_duplicate_banks()),
			"banks": [
				{
					"index": bank.index,
					"offset": f"${bank.offset:06X}",
					"size": f"${bank.size:04X}",
					"checksum": bank.checksum,
					"empty": bank.is_empty,
				}
				for bank in self.banks
			],
		}


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description="Bank Swapper - ROM Bank Management Tool",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
	# List all banks
	python bank_swapper.py list rom.nes

	# Show bank info
	python bank_swapper.py info rom.nes --bank 5

	# Swap two banks
	python bank_swapper.py swap rom.nes 3 7 -o modified.nes

	# Extract a bank
	python bank_swapper.py extract rom.nes --bank 5 -o bank5.bin

	# Insert a bank
	python bank_swapper.py insert rom.nes --bank 5 --file bank5.bin -o modified.nes

	# Find duplicates
	python bank_swapper.py duplicates rom.nes

	# Compare banks
	python bank_swapper.py compare rom.nes 3 7
		""",
	)

	subparsers = parser.add_subparsers(dest="command", help="Command")

	# List command
	list_parser = subparsers.add_parser("list", help="List all banks")
	list_parser.add_argument("rom", help="Input ROM file")
	list_parser.add_argument("--json", action="store_true", help="Output as JSON")

	# Info command
	info_parser = subparsers.add_parser("info", help="Show bank info")
	info_parser.add_argument("rom", help="Input ROM file")
	info_parser.add_argument("--bank", "-b", type=int, required=True, help="Bank index")

	# Swap command
	swap_parser = subparsers.add_parser("swap", help="Swap two banks")
	swap_parser.add_argument("rom", help="Input ROM file")
	swap_parser.add_argument("bank1", type=int, help="First bank index")
	swap_parser.add_argument("bank2", type=int, help="Second bank index")
	swap_parser.add_argument("-o", "--output", required=True, help="Output ROM file")

	# Extract command
	extract_parser = subparsers.add_parser("extract", help="Extract a bank")
	extract_parser.add_argument("rom", help="Input ROM file")
	extract_parser.add_argument("--bank", "-b", type=int, required=True, help="Bank index")
	extract_parser.add_argument("-o", "--output", required=True, help="Output file")

	# Insert command
	insert_parser = subparsers.add_parser("insert", help="Insert a bank")
	insert_parser.add_argument("rom", help="Input ROM file")
	insert_parser.add_argument("--bank", "-b", type=int, required=True, help="Bank index")
	insert_parser.add_argument("--file", "-f", required=True, help="Input bank file")
	insert_parser.add_argument("-o", "--output", required=True, help="Output ROM file")

	# Duplicate command
	dup_parser = subparsers.add_parser("duplicate", help="Copy bank to another")
	dup_parser.add_argument("rom", help="Input ROM file")
	dup_parser.add_argument("source", type=int, help="Source bank index")
	dup_parser.add_argument("dest", type=int, help="Destination bank index")
	dup_parser.add_argument("-o", "--output", required=True, help="Output ROM file")

	# Fill command
	fill_parser = subparsers.add_parser("fill", help="Fill bank with value")
	fill_parser.add_argument("rom", help="Input ROM file")
	fill_parser.add_argument("--bank", "-b", type=int, required=True, help="Bank index")
	fill_parser.add_argument("--value", "-v", default="FF", help="Fill value (hex)")
	fill_parser.add_argument("-o", "--output", required=True, help="Output ROM file")

	# Duplicates command
	dups_parser = subparsers.add_parser("duplicates", help="Find duplicate banks")
	dups_parser.add_argument("rom", help="Input ROM file")

	# Empty command
	empty_parser = subparsers.add_parser("empty", help="Find empty banks")
	empty_parser.add_argument("rom", help="Input ROM file")

	# Compare command
	compare_parser = subparsers.add_parser("compare", help="Compare two banks")
	compare_parser.add_argument("rom", help="Input ROM file")
	compare_parser.add_argument("bank1", type=int, help="First bank index")
	compare_parser.add_argument("bank2", type=int, help="Second bank index")

	args = parser.parse_args()

	if not args.command:
		parser.print_help()
		return 1

	rom_path = Path(args.rom)
	if not rom_path.exists():
		print(f"Error: ROM file not found: {rom_path}", file=sys.stderr)
		return 1

	try:
		manager = BankManager(rom_path)

		if args.command == "list":
			summary = manager.get_summary()
			if args.json:
				print(json.dumps(summary, indent="\t"))
			else:
				print(f"\nROM: {rom_path.name}")
				print(f"Format: {summary['format']}")
				print(f"Size: {summary['total_size']:,} bytes")
				print(f"Header: {summary['header_size']} bytes")
				print(f"Banks: {summary['bank_count']} × ${summary['bank_size']:04X}")
				print(f"Empty: {summary['empty_banks']}, Duplicates: {summary['duplicate_pairs']}")
				print()
				print("Bank  Offset      Size    Checksum  Empty")
				print("-" * 50)
				for bank in summary['banks']:
					empty = "Yes" if bank['empty'] else "No"
					print(f"{bank['index']:4d}  {bank['offset']}  {bank['size']}  {bank['checksum']}    {empty}")

		elif args.command == "info":
			bank = manager.get_bank(args.bank)
			if not bank:
				print(f"Error: Bank {args.bank} not found", file=sys.stderr)
				return 1

			stats = bank.get_statistics()
			print(f"\nBank {args.bank} Information:")
			print(f"  Offset: ${bank.offset:06X}")
			print(f"  Size: ${bank.size:04X} ({bank.size:,} bytes)")
			print(f"  Checksum: {bank.checksum}")
			print(f"  Empty: {'Yes' if stats['is_empty'] else 'No'}")
			print(f"  Unique bytes: {stats['unique_bytes']}")
			print(f"  Most common: {stats['most_common_byte']} ({stats['most_common_count']} times, {stats['fill_percentage']:.1f}%)")

		elif args.command == "swap":
			manager.swap_banks(args.bank1, args.bank2)
			manager.save_rom(Path(args.output))
			print(f"Swapped banks {args.bank1} and {args.bank2}")
			print(f"Saved: {args.output}")

		elif args.command == "extract":
			manager.extract_bank(args.bank, Path(args.output))
			bank = manager.get_bank(args.bank)
			print(f"Extracted bank {args.bank} ({bank.size:,} bytes)")
			print(f"Saved: {args.output}")

		elif args.command == "insert":
			manager.insert_bank(args.bank, Path(args.file))
			manager.save_rom(Path(args.output))
			print(f"Inserted bank {args.bank} from {args.file}")
			print(f"Saved: {args.output}")

		elif args.command == "duplicate":
			manager.duplicate_bank(args.source, args.dest)
			manager.save_rom(Path(args.output))
			print(f"Copied bank {args.source} to {args.dest}")
			print(f"Saved: {args.output}")

		elif args.command == "fill":
			value = int(args.value, 16)
			manager.fill_bank(args.bank, value)
			manager.save_rom(Path(args.output))
			print(f"Filled bank {args.bank} with ${value:02X}")
			print(f"Saved: {args.output}")

		elif args.command == "duplicates":
			duplicates = manager.find_duplicate_banks()
			if duplicates:
				print(f"\nFound {len(duplicates)} duplicate bank pairs:")
				for bank1, bank2 in duplicates:
					print(f"  Bank {bank1} == Bank {bank2}")
			else:
				print("No duplicate banks found")

		elif args.command == "empty":
			empty = manager.find_empty_banks()
			if empty:
				print(f"\nFound {len(empty)} empty banks:")
				print(f"  {', '.join(str(i) for i in empty)}")
			else:
				print("No empty banks found")

		elif args.command == "compare":
			comparison = manager.compare_banks(args.bank1, args.bank2)
			print(f"\nComparing Bank {args.bank1} and Bank {args.bank2}:")
			print(f"  Bank {args.bank1} size: {comparison['bank1_size']:,} bytes")
			print(f"  Bank {args.bank2} size: {comparison['bank2_size']:,} bytes")
			print(f"  Identical: {'Yes' if comparison['identical'] else 'No'}")
			print(f"  Differences: {comparison['difference_count']}")

			if comparison['differences'] and not comparison['identical']:
				print("\n  First 20 differences:")
				for diff in comparison['differences'][:20]:
					print(f"    ${diff['offset']:04X}: {diff['bank1']} -> {diff['bank2']}")

	except Exception as e:
		print(f"Error: {e}", file=sys.stderr)
		return 1

	return 0


if __name__ == "__main__":
	sys.exit(main())
