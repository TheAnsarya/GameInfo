#!/usr/bin/env python3
"""
Robotrek Invention Editor

Edit invention recipes in Robotrek (SNES) ROM.

Usage:
    python robotrek_invention_editor.py <rom_path> --export <output.json>
    python robotrek_invention_editor.py <rom_path> --import <input.json>
"""

import argparse
import json
from pathlib import Path
from typing import Optional


# Invention data location
INVENTION_DATA_BANK = 0xD2
INVENTION_DATA_START = 0x8000
INVENTION_ENTRY_SIZE = 8
INVENTION_COUNT = 100

# Material names (for display)
MATERIALS = {
	0x00: "None",
	0x40: "Scrap1",
	0x41: "Scrap2",
	0x42: "Scrap3",
	0x43: "Celtis",
	0x44: "Graphite",
	0x45: "Spring",
	0x46: "Gear",
	0x47: "Motor",
	0x48: "Lens",
	0x49: "Crystal",
	0x4A: "Battery",
	0x4B: "Chip",
	0x4C: "Wire",
}


class RobotrekInventionEditor:
	"""Editor for Robotrek invention recipes."""

	def __init__(self, rom_path: str):
		self.rom_path = Path(rom_path)
		self.rom_data = bytearray(self._load_rom())
		self.has_header = self._detect_header()
		self.inventions = []
		self._load_inventions()

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

	def _load_inventions(self) -> None:
		"""Load invention data from ROM."""
		file_offset = self.hirom_to_file(INVENTION_DATA_BANK, INVENTION_DATA_START)

		for i in range(INVENTION_COUNT):
			entry_offset = file_offset + (i * INVENTION_ENTRY_SIZE)
			data = self.rom_data[entry_offset:entry_offset + INVENTION_ENTRY_SIZE]

			if len(data) < INVENTION_ENTRY_SIZE:
				break

			invention = {
				"id": i,
				"result_item": data[0],
				"material1_id": data[1],
				"material1_qty": data[2],
				"material2_id": data[3],
				"material2_qty": data[4],
				"material3_id": data[5],
				"material3_qty": data[6],
				"required_level": data[7] & 0x3F,
				"flags": (data[7] >> 6) & 0x03,
			}

			# Add material names
			invention["material1_name"] = MATERIALS.get(invention["material1_id"],
				f"Item ${invention['material1_id']:02X}")
			invention["material2_name"] = MATERIALS.get(invention["material2_id"],
				f"Item ${invention['material2_id']:02X}") if invention["material2_id"] else "None"
			invention["material3_name"] = MATERIALS.get(invention["material3_id"],
				f"Item ${invention['material3_id']:02X}") if invention["material3_id"] else "None"

			self.inventions.append(invention)

	def get_invention(self, recipe_id: int) -> Optional[dict]:
		"""Get invention by ID."""
		for inv in self.inventions:
			if inv["id"] == recipe_id:
				return inv
		return None

	def set_invention(self, recipe_id: int, **kwargs) -> bool:
		"""Modify invention properties."""
		inv = self.get_invention(recipe_id)
		if not inv:
			return False

		# Update invention dict
		for key, value in kwargs.items():
			if key in inv:
				inv[key] = value

		# Update ROM data
		file_offset = self.hirom_to_file(INVENTION_DATA_BANK, INVENTION_DATA_START)
		entry_offset = file_offset + (recipe_id * INVENTION_ENTRY_SIZE)

		self.rom_data[entry_offset] = inv["result_item"]
		self.rom_data[entry_offset + 1] = inv["material1_id"]
		self.rom_data[entry_offset + 2] = inv["material1_qty"]
		self.rom_data[entry_offset + 3] = inv["material2_id"]
		self.rom_data[entry_offset + 4] = inv["material2_qty"]
		self.rom_data[entry_offset + 5] = inv["material3_id"]
		self.rom_data[entry_offset + 6] = inv["material3_qty"]
		self.rom_data[entry_offset + 7] = (inv["required_level"] & 0x3F) | ((inv["flags"] & 0x03) << 6)

		return True

	def export_json(self, output_path: Path) -> None:
		"""Export inventions to JSON."""
		data = {
			"game": "Robotrek",
			"data_type": "inventions",
			"rom_location": {
				"bank": f"${INVENTION_DATA_BANK:02X}",
				"start": f"${INVENTION_DATA_START:04X}",
				"entry_size": INVENTION_ENTRY_SIZE,
				"count": len(self.inventions)
			},
			"materials": {f"${k:02X}": v for k, v in MATERIALS.items()},
			"inventions": self.inventions
		}

		with open(output_path, "w") as f:
			json.dump(data, f, indent="\t")

		print(f"Exported {len(self.inventions)} inventions to {output_path}")

	def import_json(self, input_path: Path) -> int:
		"""Import inventions from JSON."""
		with open(input_path, "r") as f:
			data = json.load(f)

		if "inventions" not in data:
			print("Invalid JSON: missing 'inventions' key")
			return 0

		modified = 0
		for inv_data in data["inventions"]:
			recipe_id = inv_data.get("id")
			if recipe_id is None:
				continue

			update_fields = {}
			editable = ["result_item", "material1_id", "material1_qty",
						"material2_id", "material2_qty", "material3_id",
						"material3_qty", "required_level", "flags"]
			for key in editable:
				if key in inv_data:
					update_fields[key] = inv_data[key]

			if update_fields and self.set_invention(recipe_id, **update_fields):
				modified += 1

		print(f"Modified {modified} inventions")
		return modified

	def save_rom(self, output_path: Optional[Path] = None) -> None:
		"""Save modified ROM."""
		if output_path is None:
			output_path = self.rom_path

		with open(output_path, "wb") as f:
			f.write(self.rom_data)

		print(f"Saved ROM to {output_path}")

	def print_invention(self, inv: dict) -> None:
		"""Print invention details."""
		print(f"Invention #{inv['id']:03d}")
		print(f"  Result: Item ${inv['result_item']:02X}")
		print(f"  Material 1: {inv['material1_name']} x{inv['material1_qty']}")
		if inv['material2_id']:
			print(f"  Material 2: {inv['material2_name']} x{inv['material2_qty']}")
		if inv['material3_id']:
			print(f"  Material 3: {inv['material3_name']} x{inv['material3_qty']}")
		print(f"  Required Level: {inv['required_level']}")
		print(f"  Flags: ${inv['flags']:02X}")

	def find_by_material(self, material_id: int) -> list[dict]:
		"""Find inventions using a specific material."""
		return [inv for inv in self.inventions
				if inv["material1_id"] == material_id
				or inv["material2_id"] == material_id
				or inv["material3_id"] == material_id]

	def find_by_result(self, item_id: int) -> Optional[dict]:
		"""Find invention that creates a specific item."""
		for inv in self.inventions:
			if inv["result_item"] == item_id:
				return inv
		return None


def main():
	parser = argparse.ArgumentParser(description="Edit Robotrek invention recipes")
	parser.add_argument("rom", help="Path to Robotrek ROM file")
	parser.add_argument("--export", "-e", help="Export inventions to JSON")
	parser.add_argument("--import", "-i", dest="import_file", help="Import inventions from JSON")
	parser.add_argument("--output", "-o", help="Output ROM path (for imports)")
	parser.add_argument("--list", "-l", action="store_true", help="List all inventions")
	parser.add_argument("--recipe", type=int, help="Show specific recipe")
	parser.add_argument("--material", type=lambda x: int(x, 0), help="Find recipes using material (hex)")

	args = parser.parse_args()

	editor = RobotrekInventionEditor(args.rom)

	if args.export:
		editor.export_json(Path(args.export))

	elif args.import_file:
		editor.import_json(Path(args.import_file))
		output_path = Path(args.output) if args.output else None
		editor.save_rom(output_path)

	elif args.list:
		for inv in editor.inventions:
			mats = [f"{inv['material1_name']}x{inv['material1_qty']}"]
			if inv['material2_id']:
				mats.append(f"{inv['material2_name']}x{inv['material2_qty']}")
			if inv['material3_id']:
				mats.append(f"{inv['material3_name']}x{inv['material3_qty']}")
			print(f"#{inv['id']:03d}: Item ${inv['result_item']:02X} = {' + '.join(mats)} (Lv{inv['required_level']})")

	elif args.recipe is not None:
		inv = editor.get_invention(args.recipe)
		if inv:
			editor.print_invention(inv)
		else:
			print(f"Recipe #{args.recipe} not found")

	elif args.material is not None:
		mat_name = MATERIALS.get(args.material, f"${args.material:02X}")
		recipes = editor.find_by_material(args.material)
		print(f"Recipes using {mat_name}:")
		for inv in recipes:
			print(f"  #{inv['id']:03d}: Item ${inv['result_item']:02X}")

	else:
		print(f"Robotrek Invention Editor")
		print(f"ROM: {editor.rom_path}")
		print(f"Inventions loaded: {len(editor.inventions)}")
		print()
		print("Usage:")
		print("  --export <file.json>   Export inventions to JSON")
		print("  --import <file.json>   Import inventions from JSON")
		print("  --list                 List all inventions")
		print("  --recipe <id>          Show specific recipe")
		print("  --material <hex>       Find recipes using material")


if __name__ == "__main__":
	main()
