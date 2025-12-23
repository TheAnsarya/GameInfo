#!/usr/bin/env python3
"""
Robotrek ROM Analyzer

Analyzes the Robotrek (SNES) ROM to extract game data and structure information.

Usage:
    python robotrek_analyzer.py <rom_path> [--output <output_dir>]
"""

import argparse
import json
import struct
from pathlib import Path
from typing import Any


# ROM Constants
HEADER_SIZE = 0x200  # SMC header if present
LOROM_HEADER = 0x7FC0
HIROM_HEADER = 0xFFC0

# Known data locations (HiROM addresses)
DATA_LOCATIONS = {
	"item_data": {
		"bank": 0xD0,
		"start": 0x8000,
		"entry_size": 8,
		"description": "Item definitions"
	},
	"enemy_data": {
		"bank": 0xD1,
		"start": 0x8000,
		"entry_size": 16,
		"description": "Enemy statistics"
	},
	"invention_recipes": {
		"bank": 0xD2,
		"start": 0x8000,
		"entry_size": 8,
		"description": "Invention recipes"
	},
	"item_names": {
		"bank": 0xD0,
		"start": 0x8000,
		"description": "Item name strings"
	},
	"enemy_names": {
		"bank": 0xD1,
		"start": 0x8000,
		"description": "Enemy name strings"
	},
	"dialog": {
		"bank": 0xE0,
		"start": 0x8000,
		"description": "Main dialog text"
	},
	"map_data": {
		"bank": 0xE8,
		"start": 0x8000,
		"description": "Map tile data"
	},
	"sprite_data": {
		"bank": 0xC0,
		"start": 0x8000,
		"description": "Sprite graphics"
	}
}


class RobotrekAnalyzer:
	"""Analyzer for Robotrek SNES ROM."""

	def __init__(self, rom_path: str):
		self.rom_path = Path(rom_path)
		self.rom_data = self._load_rom()
		self.has_header = self._detect_header()
		self.is_hirom = self._detect_mapper()

	def _load_rom(self) -> bytes:
		"""Load ROM file into memory."""
		with open(self.rom_path, "rb") as f:
			return f.read()

	def _detect_header(self) -> bool:
		"""Detect if ROM has SMC header."""
		# ROM sizes are typically power of 2
		# SMC header adds 512 bytes
		size = len(self.rom_data)
		return (size % 0x8000) == 0x200

	def _detect_mapper(self) -> bool:
		"""Detect if ROM is HiROM or LoROM."""
		offset = HEADER_SIZE if self.has_header else 0

		# Check HiROM header location
		hirom_check = offset + HIROM_HEADER
		if hirom_check + 32 <= len(self.rom_data):
			title = self.rom_data[hirom_check:hirom_check + 21]
			if self._is_valid_title(title):
				return True

		# Check LoROM header location
		lorom_check = offset + LOROM_HEADER
		if lorom_check + 32 <= len(self.rom_data):
			title = self.rom_data[lorom_check:lorom_check + 21]
			if self._is_valid_title(title):
				return False

		# Default to HiROM for Robotrek
		return True

	def _is_valid_title(self, title: bytes) -> bool:
		"""Check if title bytes look valid."""
		# Valid ASCII range for game titles
		return all(0x20 <= b <= 0x7E or b == 0x00 for b in title)

	def get_header_info(self) -> dict:
		"""Extract ROM header information."""
		offset = HEADER_SIZE if self.has_header else 0
		header_offset = offset + (HIROM_HEADER if self.is_hirom else LOROM_HEADER)

		title = self.rom_data[header_offset:header_offset + 21]
		title = title.rstrip(b'\x00').decode('ascii', errors='replace')

		map_mode = self.rom_data[header_offset + 21]
		rom_type = self.rom_data[header_offset + 22]
		rom_size = self.rom_data[header_offset + 23]
		sram_size = self.rom_data[header_offset + 24]
		country = self.rom_data[header_offset + 25]
		dev_id = self.rom_data[header_offset + 26]
		version = self.rom_data[header_offset + 27]

		checksum_complement = struct.unpack('<H', self.rom_data[header_offset + 28:header_offset + 30])[0]
		checksum = struct.unpack('<H', self.rom_data[header_offset + 30:header_offset + 32])[0]

		return {
			"title": title,
			"map_mode": f"${map_mode:02x}",
			"mapper": "HiROM" if self.is_hirom else "LoROM",
			"rom_type": f"${rom_type:02x}",
			"rom_size": f"{1 << rom_size} KB",
			"sram_size": f"{1 << sram_size} KB" if sram_size > 0 else "None",
			"country": self._get_country(country),
			"developer_id": f"${dev_id:02x}",
			"version": f"1.{version}",
			"checksum": f"${checksum:04x}",
			"checksum_complement": f"${checksum_complement:04x}"
		}

	def _get_country(self, code: int) -> str:
		"""Get country name from code."""
		countries = {
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
			0x0C: "Indonesia",
			0x0D: "Korea"
		}
		return countries.get(code, f"Unknown (${code:02x})")

	def hirom_to_file(self, bank: int, addr: int) -> int:
		"""Convert HiROM address to file offset."""
		offset = HEADER_SIZE if self.has_header else 0
		# HiROM mapping: banks $C0-$FF map to ROM
		if bank >= 0xC0:
			file_addr = ((bank - 0xC0) * 0x10000) + (addr - 0x8000 if addr >= 0x8000 else addr)
		else:
			file_addr = (bank * 0x10000) + addr
		return offset + file_addr

	def read_bytes(self, bank: int, addr: int, length: int) -> bytes:
		"""Read bytes from ROM at HiROM address."""
		file_offset = self.hirom_to_file(bank, addr)
		return self.rom_data[file_offset:file_offset + length]

	def analyze_data_region(self, region_name: str) -> dict:
		"""Analyze a known data region."""
		if region_name not in DATA_LOCATIONS:
			return {"error": f"Unknown region: {region_name}"}

		region = DATA_LOCATIONS[region_name]
		bank = region["bank"]
		start = region["start"]

		result = {
			"name": region_name,
			"description": region["description"],
			"bank": f"${bank:02X}",
			"start": f"${start:04X}",
			"file_offset": f"0x{self.hirom_to_file(bank, start):06X}"
		}

		# If entry size known, try to read some entries
		if "entry_size" in region:
			entry_size = region["entry_size"]
			sample_data = self.read_bytes(bank, start, entry_size * 10)
			result["entry_size"] = entry_size
			result["sample_entries"] = []

			for i in range(min(5, len(sample_data) // entry_size)):
				entry = sample_data[i * entry_size:(i + 1) * entry_size]
				result["sample_entries"].append(entry.hex())

		return result

	def find_text_strings(self, bank: int, min_length: int = 5) -> list:
		"""Find potential text strings in a bank."""
		strings = []
		file_offset = self.hirom_to_file(bank, 0x8000)
		bank_size = 0x8000  # 32KB per bank

		if file_offset + bank_size > len(self.rom_data):
			bank_size = len(self.rom_data) - file_offset

		data = self.rom_data[file_offset:file_offset + bank_size]

		current_string = []
		start_pos = 0

		for i, byte in enumerate(data):
			# ASCII printable range
			if 0x20 <= byte <= 0x7E:
				if not current_string:
					start_pos = i
				current_string.append(chr(byte))
			elif byte == 0x00 and current_string:
				# End of string
				if len(current_string) >= min_length:
					strings.append({
						"offset": f"${0x8000 + start_pos:04X}",
						"text": ''.join(current_string)
					})
				current_string = []
			else:
				current_string = []

		return strings[:50]  # Limit output

	def generate_report(self) -> dict:
		"""Generate full analysis report."""
		report = {
			"file": str(self.rom_path),
			"file_size": len(self.rom_data),
			"has_header": self.has_header,
			"mapper": "HiROM" if self.is_hirom else "LoROM",
			"header_info": self.get_header_info(),
			"data_regions": {}
		}

		for region_name in DATA_LOCATIONS:
			report["data_regions"][region_name] = self.analyze_data_region(region_name)

		return report

	def export_data(self, output_dir: Path) -> None:
		"""Export analyzed data to files."""
		output_dir.mkdir(parents=True, exist_ok=True)

		# Export report
		report = self.generate_report()
		report_path = output_dir / "analysis_report.json"
		with open(report_path, "w") as f:
			json.dump(report, f, indent="\t")
		print(f"Exported: {report_path}")

		# Export raw data regions
		for region_name, region in DATA_LOCATIONS.items():
			if "entry_size" in region:
				bank = region["bank"]
				start = region["start"]
				entry_size = region["entry_size"]

				# Read up to 256 entries
				data = self.read_bytes(bank, start, entry_size * 256)
				data_path = output_dir / f"{region_name}.bin"
				with open(data_path, "wb") as f:
					f.write(data)
				print(f"Exported: {data_path}")


def main():
	parser = argparse.ArgumentParser(description="Analyze Robotrek SNES ROM")
	parser.add_argument("rom", help="Path to Robotrek ROM file")
	parser.add_argument("--output", "-o", help="Output directory for exports")
	parser.add_argument("--json", action="store_true", help="Output JSON report to stdout")

	args = parser.parse_args()

	analyzer = RobotrekAnalyzer(args.rom)

	if args.json:
		report = analyzer.generate_report()
		print(json.dumps(report, indent="\t"))
	elif args.output:
		analyzer.export_data(Path(args.output))
	else:
		# Print summary
		print(f"Robotrek ROM Analysis")
		print(f"=" * 50)

		header = analyzer.get_header_info()
		print(f"Title: {header['title']}")
		print(f"Mapper: {header['mapper']}")
		print(f"ROM Size: {header['rom_size']}")
		print(f"SRAM: {header['sram_size']}")
		print(f"Country: {header['country']}")
		print(f"Version: {header['version']}")
		print(f"Checksum: {header['checksum']}")

		print(f"\nData Regions:")
		for name, region in DATA_LOCATIONS.items():
			file_offset = analyzer.hirom_to_file(region["bank"], region["start"])
			print(f"  {name}: Bank ${region['bank']:02X}:{region['start']:04X} (file: 0x{file_offset:06X})")


if __name__ == "__main__":
	main()
