#!/usr/bin/env python3
"""
Secret of Mana Map Data Extractor
Extracts map-related data from Secret of Mana (SNES) ROM.

Usage:
    python extract_maps.py <rom_path> [--output <dir>]
"""

import argparse
import json
import os
from pathlib import Path
from typing import Any

# Map data offsets (HiROM: file_offset = rom_address - 0xc00000)
# Based on research - these are approximate and need verification

# Map header pointers table
MAP_HEADER_POINTERS_OFFSET = 0x0d0000  # Bank $8D
MAP_HEADER_COUNT = 256

# Exit/warp data
EXIT_DATA_OFFSET = 0x083000
EXIT_ENTRY_SIZE = 4
EXIT_COUNT = 256

# Map tileset pointers
TILESET_POINTERS_OFFSET = 0x0e0000  # Bank $8E

# Event/trigger data
EVENT_TRIGGER_OFFSET = 0x090000  # Bank $89

# NPC placement data
NPC_DATA_OFFSET = 0x098000


def read_rom(rom_path: str) -> bytes:
	"""Read ROM file into memory."""
	with open(rom_path, 'rb') as f:
		return f.read()


def extract_exits(rom_data: bytes) -> list[dict]:
	"""Extract exit/warp data from ROM."""
	exits = []

	for i in range(EXIT_COUNT):
		offset = EXIT_DATA_OFFSET + (i * EXIT_ENTRY_SIZE)
		if offset + EXIT_ENTRY_SIZE > len(rom_data):
			break

		entry = rom_data[offset:offset + EXIT_ENTRY_SIZE]
		if len(entry) < 4:
			break

		exit_data = {
			"index": i,
			"offset": f"0x{offset:06x}",
			"target_map": entry[0],
			"target_x": entry[1],
			"target_y": entry[2],
			"flags": entry[3],
			"raw": " ".join(f"{b:02x}" for b in entry)
		}

		# Skip empty entries
		if entry[0] == 0 and entry[1] == 0 and entry[2] == 0 and entry[3] == 0:
			continue

		exits.append(exit_data)

	return exits


def extract_map_headers(rom_data: bytes) -> list[dict]:
	"""Extract map header data from ROM."""
	headers = []

	# Read pointer table first
	for i in range(MAP_HEADER_COUNT):
		ptr_offset = MAP_HEADER_POINTERS_OFFSET + (i * 3)  # 24-bit pointers
		if ptr_offset + 3 > len(rom_data):
			break

		# Read 24-bit pointer (little endian)
		ptr_lo = rom_data[ptr_offset]
		ptr_mid = rom_data[ptr_offset + 1]
		ptr_hi = rom_data[ptr_offset + 2]
		pointer = ptr_lo | (ptr_mid << 8) | (ptr_hi << 16)

		# Convert to file offset (HiROM)
		file_offset = pointer & 0x3fffff

		if file_offset == 0 or file_offset >= len(rom_data):
			continue

		# Read header data (size varies, read first 16 bytes)
		header_data = rom_data[file_offset:file_offset + 16]

		header = {
			"index": i,
			"pointer": f"0x{pointer:06x}",
			"file_offset": f"0x{file_offset:06x}",
			"raw": " ".join(f"{b:02x}" for b in header_data[:16])
		}

		# Parse common header fields
		if len(header_data) >= 4:
			header["tileset"] = header_data[0]
			header["palette"] = header_data[1]
			header["width"] = header_data[2]
			header["height"] = header_data[3]

		headers.append(header)

	return headers


def extract_event_triggers(rom_data: bytes) -> list[dict]:
	"""Extract event trigger data from ROM."""
	triggers = []

	# Each trigger entry is typically 8 bytes
	trigger_entry_size = 8
	max_triggers = 256

	for i in range(max_triggers):
		offset = EVENT_TRIGGER_OFFSET + (i * trigger_entry_size)
		if offset + trigger_entry_size > len(rom_data):
			break

		entry = rom_data[offset:offset + trigger_entry_size]

		# Skip empty entries
		if all(b == 0 for b in entry) or all(b == 0xff for b in entry):
			continue

		trigger = {
			"index": i,
			"offset": f"0x{offset:06x}",
			"raw": " ".join(f"{b:02x}" for b in entry)
		}

		# Parse trigger data
		if len(entry) >= 8:
			trigger["x"] = entry[0]
			trigger["y"] = entry[1]
			trigger["event_id"] = entry[2] | (entry[3] << 8)
			trigger["flags"] = entry[4]

		triggers.append(trigger)

	return triggers


def analyze_map_areas(exits: list[dict]) -> dict:
	"""Analyze exit data to identify map areas."""
	areas = {}

	for exit_data in exits:
		target = exit_data["target_map"]
		if target not in areas:
			areas[target] = {
				"id": target,
				"exit_count": 0,
				"exits_from": []
			}
		areas[target]["exit_count"] += 1
		areas[target]["exits_from"].append(exit_data["index"])

	return areas


def main():
	parser = argparse.ArgumentParser(description='Extract map data from Secret of Mana ROM')
	parser.add_argument('rom', help='Path to ROM file')
	parser.add_argument('--output', '-o', default='assets/maps',
						help='Output directory for JSON files')
	args = parser.parse_args()

	rom_path = Path(args.rom)
	if not rom_path.exists():
		print(f"Error: ROM file not found: {rom_path}")
		return 1

	output_dir = Path(args.output)
	output_dir.mkdir(parents=True, exist_ok=True)

	print(f"Reading ROM: {rom_path}")
	rom_data = read_rom(str(rom_path))
	print(f"ROM size: {len(rom_data):,} bytes")

	# Extract exits
	print("\nExtracting exit/warp data...")
	exits = extract_exits(rom_data)
	print(f"  Found {len(exits)} exits")

	exits_file = output_dir / "exits.json"
	with open(exits_file, 'w') as f:
		json.dump(exits, f, indent='\t')
	print(f"  Saved to {exits_file}")

	# Extract map headers
	print("\nExtracting map header data...")
	headers = extract_map_headers(rom_data)
	print(f"  Found {len(headers)} map headers")

	headers_file = output_dir / "map_headers.json"
	with open(headers_file, 'w') as f:
		json.dump(headers, f, indent='\t')
	print(f"  Saved to {headers_file}")

	# Extract event triggers
	print("\nExtracting event triggers...")
	triggers = extract_event_triggers(rom_data)
	print(f"  Found {len(triggers)} triggers")

	triggers_file = output_dir / "event_triggers.json"
	with open(triggers_file, 'w') as f:
		json.dump(triggers, f, indent='\t')
	print(f"  Saved to {triggers_file}")

	# Analyze areas
	print("\nAnalyzing map areas...")
	areas = analyze_map_areas(exits)
	print(f"  Found {len(areas)} unique map areas")

	areas_file = output_dir / "map_areas.json"
	with open(areas_file, 'w') as f:
		json.dump(areas, f, indent='\t')
	print(f"  Saved to {areas_file}")

	# Summary
	summary = {
		"rom_file": str(rom_path),
		"rom_size": len(rom_data),
		"extraction_summary": {
			"exits": len(exits),
			"map_headers": len(headers),
			"event_triggers": len(triggers),
			"unique_areas": len(areas)
		},
		"offsets_used": {
			"exit_data": f"0x{EXIT_DATA_OFFSET:06x}",
			"map_header_pointers": f"0x{MAP_HEADER_POINTERS_OFFSET:06x}",
			"event_triggers": f"0x{EVENT_TRIGGER_OFFSET:06x}"
		}
	}

	summary_file = output_dir / "extraction_summary.json"
	with open(summary_file, 'w') as f:
		json.dump(summary, f, indent='\t')
	print(f"\nSummary saved to {summary_file}")

	print("\n✅ Map data extraction complete!")
	return 0


if __name__ == "__main__":
	exit(main())
