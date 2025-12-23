#!/usr/bin/env python3
"""
Robotrek Item Editor

Edit item data in Robotrek (SNES) ROM.

Usage:
    python robotrek_item_editor.py <rom_path> --export <output.json>
    python robotrek_item_editor.py <rom_path> --import <input.json>
"""

import argparse
import json
import struct
from pathlib import Path
from typing import Optional


# Item data location
ITEM_DATA_BANK = 0xD0
ITEM_DATA_START = 0x8000
ITEM_ENTRY_SIZE = 8
ITEM_COUNT = 150

# Item types
ITEM_TYPES = {
	0x00: "Consumable",
	0x01: "Weapon",
	0x02: "Armor",
	0x03: "Accessory",
	0x04: "Material",
	0x05: "Robot Part",
	0x06: "Key Item",
}

# Item flags
ITEM_FLAGS = {
	0x01: "Usable in battle",
	0x02: "Usable in field",
	0x04: "Consumable",
	0x08: "Equippable",
	0x10: "Robot only",
	0x20: "Quest item",
	0x40: "Rare",
	0x80: "Unique",
}


class RobotrekItemEditor:
	"""Editor for Robotrek item data."""

	def __init__(self, rom_path: str):
		self.rom_path = Path(rom_path)
		self.rom_data = bytearray(self._load_rom())
		self.has_header = self._detect_header()
		self.items = []
		self._load_items()

	def _load_rom(self) -> bytes:
		"""Load ROM file."""
		with open(self.rom_path, "rb") as f:
			return f.read()

	def _detect_header(self) -> bool:
		"""Detect SMC header."""
		return (len(self.rom_data) % 0x8000) == 0x200

	def hirom_to_file(self, bank: int, addr: int) -> int:
		"""Convert HiROM address to file offset."""
		offset = 0x200 if self.has_header else 0
		if bank >= 0xC0:
			file_addr = ((bank - 0xC0) * 0x10000) + (addr - 0x8000 if addr >= 0x8000 else addr)
		else:
			file_addr = (bank * 0x10000) + addr
		return offset + file_addr

	def _load_items(self) -> None:
		"""Load item data from ROM."""
		file_offset = self.hirom_to_file(ITEM_DATA_BANK, ITEM_DATA_START)

		for i in range(ITEM_COUNT):
			entry_offset = file_offset + (i * ITEM_ENTRY_SIZE)
			entry_data = self.rom_data[entry_offset:entry_offset + ITEM_ENTRY_SIZE]

			if len(entry_data) < ITEM_ENTRY_SIZE:
				break

			item = {
				"id": i,
				"item_id": entry_data[0],
				"item_type": entry_data[1],
				"primary_stat": entry_data[2],
				"secondary_stat": entry_data[3],
				"buy_price": entry_data[4] | (entry_data[5] << 8),
				"flags": entry_data[6] | (entry_data[7] << 8),
			}

			# Add human-readable type
			item["type_name"] = ITEM_TYPES.get(item["item_type"], f"Unknown (${item['item_type']:02X})")

			# Decode flags
			item["flag_names"] = []
			for bit, name in ITEM_FLAGS.items():
				if item["flags"] & bit:
					item["flag_names"].append(name)

			self.items.append(item)

	def get_item(self, item_id: int) -> Optional[dict]:
		"""Get item by ID."""
		for item in self.items:
			if item["id"] == item_id:
				return item
		return None

	def set_item(self, item_id: int, **kwargs) -> bool:
		"""
		Modify item properties.
		Valid kwargs: item_type, primary_stat, secondary_stat, buy_price, flags
		"""
		item = self.get_item(item_id)
		if not item:
			return False

		# Update item dict
		for key, value in kwargs.items():
			if key in item:
				item[key] = value

		# Update ROM data
		file_offset = self.hirom_to_file(ITEM_DATA_BANK, ITEM_DATA_START)
		entry_offset = file_offset + (item_id * ITEM_ENTRY_SIZE)

		self.rom_data[entry_offset] = item["item_id"]
		self.rom_data[entry_offset + 1] = item["item_type"]
		self.rom_data[entry_offset + 2] = item["primary_stat"]
		self.rom_data[entry_offset + 3] = item["secondary_stat"]
		self.rom_data[entry_offset + 4] = item["buy_price"] & 0xFF
		self.rom_data[entry_offset + 5] = (item["buy_price"] >> 8) & 0xFF
		self.rom_data[entry_offset + 6] = item["flags"] & 0xFF
		self.rom_data[entry_offset + 7] = (item["flags"] >> 8) & 0xFF

		return True

	def export_json(self, output_path: Path) -> None:
		"""Export items to JSON."""
		data = {
			"game": "Robotrek",
			"data_type": "items",
			"rom_location": {
				"bank": f"${ITEM_DATA_BANK:02X}",
				"start": f"${ITEM_DATA_START:04X}",
				"entry_size": ITEM_ENTRY_SIZE,
				"count": len(self.items)
			},
			"item_types": {f"${k:02X}": v for k, v in ITEM_TYPES.items()},
			"item_flags": {f"${k:02X}": v for k, v in ITEM_FLAGS.items()},
			"items": self.items
		}

		with open(output_path, "w") as f:
			json.dump(data, f, indent="\t")

		print(f"Exported {len(self.items)} items to {output_path}")

	def import_json(self, input_path: Path) -> int:
		"""Import items from JSON. Returns count of modified items."""
		with open(input_path, "r") as f:
			data = json.load(f)

		if "items" not in data:
			print("Invalid JSON: missing 'items' key")
			return 0

		modified = 0
		for item_data in data["items"]:
			item_id = item_data.get("id")
			if item_id is None:
				continue

			# Only update editable fields
			update_fields = {}
			for key in ["item_type", "primary_stat", "secondary_stat", "buy_price", "flags"]:
				if key in item_data:
					update_fields[key] = item_data[key]

			if update_fields and self.set_item(item_id, **update_fields):
				modified += 1

		print(f"Modified {modified} items")
		return modified

	def save_rom(self, output_path: Optional[Path] = None) -> None:
		"""Save modified ROM."""
		if output_path is None:
			output_path = self.rom_path

		with open(output_path, "wb") as f:
			f.write(self.rom_data)

		print(f"Saved ROM to {output_path}")

	def print_item(self, item: dict) -> None:
		"""Print item details."""
		print(f"Item #{item['id']:03d} (${item['item_id']:02X})")
		print(f"  Type: {item['type_name']}")
		print(f"  Primary Stat: {item['primary_stat']}")
		print(f"  Secondary Stat: {item['secondary_stat']}")
		print(f"  Buy Price: {item['buy_price']}")
		print(f"  Sell Price: {item['buy_price'] // 2}")
		print(f"  Flags: ${item['flags']:04X}")
		if item['flag_names']:
			print(f"    - {', '.join(item['flag_names'])}")


def main():
	parser = argparse.ArgumentParser(description="Edit Robotrek item data")
	parser.add_argument("rom", help="Path to Robotrek ROM file")
	parser.add_argument("--export", "-e", help="Export items to JSON")
	parser.add_argument("--import", "-i", dest="import_file", help="Import items from JSON")
	parser.add_argument("--output", "-o", help="Output ROM path (for imports)")
	parser.add_argument("--list", "-l", action="store_true", help="List all items")
	parser.add_argument("--item", type=int, help="Show specific item")

	args = parser.parse_args()

	editor = RobotrekItemEditor(args.rom)

	if args.export:
		editor.export_json(Path(args.export))

	elif args.import_file:
		editor.import_json(Path(args.import_file))
		output_path = Path(args.output) if args.output else None
		editor.save_rom(output_path)

	elif args.list:
		for item in editor.items:
			print(f"#{item['id']:03d}: Type={item['type_name']}, "
				  f"Stats={item['primary_stat']}/{item['secondary_stat']}, "
				  f"Price={item['buy_price']}")

	elif args.item is not None:
		item = editor.get_item(args.item)
		if item:
			editor.print_item(item)
		else:
			print(f"Item #{args.item} not found")

	else:
		# Print summary
		print(f"Robotrek Item Editor")
		print(f"ROM: {editor.rom_path}")
		print(f"Items loaded: {len(editor.items)}")
		print()
		print("Usage:")
		print("  --export <file.json>  Export items to JSON")
		print("  --import <file.json>  Import items from JSON")
		print("  --list                List all items")
		print("  --item <id>           Show specific item")


if __name__ == "__main__":
	main()
