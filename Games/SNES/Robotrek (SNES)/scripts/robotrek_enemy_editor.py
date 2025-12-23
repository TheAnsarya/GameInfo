#!/usr/bin/env python3
"""
Robotrek Enemy Editor

Edit enemy data in Robotrek (SNES) ROM.

Usage:
    python robotrek_enemy_editor.py <rom_path> --export <output.json>
    python robotrek_enemy_editor.py <rom_path> --import <input.json>
"""

import argparse
import json
from pathlib import Path
from typing import Optional


# Enemy data location
ENEMY_DATA_BANK = 0xD1
ENEMY_DATA_START = 0x8000
ENEMY_ENTRY_SIZE = 16
ENEMY_COUNT = 80

# AI patterns
AI_PATTERNS = {
	0x00: "Aggressive",
	0x01: "Defensive",
	0x02: "Support",
	0x03: "Ranged",
	0x04: "Hit and Run",
	0x05: "Boss Phase 1",
	0x06: "Boss Phase 2",
	0x07: "Boss Special",
}


class RobotrekEnemyEditor:
	"""Editor for Robotrek enemy data."""

	def __init__(self, rom_path: str):
		self.rom_path = Path(rom_path)
		self.rom_data = bytearray(self._load_rom())
		self.has_header = self._detect_header()
		self.enemies = []
		self._load_enemies()

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

	def _load_enemies(self) -> None:
		"""Load enemy data from ROM."""
		file_offset = self.hirom_to_file(ENEMY_DATA_BANK, ENEMY_DATA_START)

		for i in range(ENEMY_COUNT):
			entry_offset = file_offset + (i * ENEMY_ENTRY_SIZE)
			data = self.rom_data[entry_offset:entry_offset + ENEMY_ENTRY_SIZE]

			if len(data) < ENEMY_ENTRY_SIZE:
				break

			enemy = {
				"id": i,
				"enemy_id": data[0],
				"sprite_index": data[1],
				"hp": data[2] | (data[3] << 8),
				"power": data[4],
				"guard": data[5],
				"speed": data[6],
				"ai_pattern": data[7],
				"exp": data[8] | (data[9] << 8),
				"gold": data[10] | (data[11] << 8),
				"drop1_id": data[12],
				"drop1_rate": data[13],
				"drop2_id": data[14],
				"drop2_rate": data[15],
			}

			# Add human-readable AI pattern
			enemy["ai_name"] = AI_PATTERNS.get(enemy["ai_pattern"], f"Unknown (${enemy['ai_pattern']:02X})")

			self.enemies.append(enemy)

	def get_enemy(self, enemy_id: int) -> Optional[dict]:
		"""Get enemy by ID."""
		for enemy in self.enemies:
			if enemy["id"] == enemy_id:
				return enemy
		return None

	def set_enemy(self, enemy_id: int, **kwargs) -> bool:
		"""Modify enemy properties."""
		enemy = self.get_enemy(enemy_id)
		if not enemy:
			return False

		# Update enemy dict
		for key, value in kwargs.items():
			if key in enemy:
				enemy[key] = value

		# Update ROM data
		file_offset = self.hirom_to_file(ENEMY_DATA_BANK, ENEMY_DATA_START)
		entry_offset = file_offset + (enemy_id * ENEMY_ENTRY_SIZE)

		self.rom_data[entry_offset] = enemy["enemy_id"]
		self.rom_data[entry_offset + 1] = enemy["sprite_index"]
		self.rom_data[entry_offset + 2] = enemy["hp"] & 0xFF
		self.rom_data[entry_offset + 3] = (enemy["hp"] >> 8) & 0xFF
		self.rom_data[entry_offset + 4] = enemy["power"]
		self.rom_data[entry_offset + 5] = enemy["guard"]
		self.rom_data[entry_offset + 6] = enemy["speed"]
		self.rom_data[entry_offset + 7] = enemy["ai_pattern"]
		self.rom_data[entry_offset + 8] = enemy["exp"] & 0xFF
		self.rom_data[entry_offset + 9] = (enemy["exp"] >> 8) & 0xFF
		self.rom_data[entry_offset + 10] = enemy["gold"] & 0xFF
		self.rom_data[entry_offset + 11] = (enemy["gold"] >> 8) & 0xFF
		self.rom_data[entry_offset + 12] = enemy["drop1_id"]
		self.rom_data[entry_offset + 13] = enemy["drop1_rate"]
		self.rom_data[entry_offset + 14] = enemy["drop2_id"]
		self.rom_data[entry_offset + 15] = enemy["drop2_rate"]

		return True

	def export_json(self, output_path: Path) -> None:
		"""Export enemies to JSON."""
		data = {
			"game": "Robotrek",
			"data_type": "enemies",
			"rom_location": {
				"bank": f"${ENEMY_DATA_BANK:02X}",
				"start": f"${ENEMY_DATA_START:04X}",
				"entry_size": ENEMY_ENTRY_SIZE,
				"count": len(self.enemies)
			},
			"ai_patterns": {f"${k:02X}": v for k, v in AI_PATTERNS.items()},
			"enemies": self.enemies
		}

		with open(output_path, "w") as f:
			json.dump(data, f, indent="\t")

		print(f"Exported {len(self.enemies)} enemies to {output_path}")

	def import_json(self, input_path: Path) -> int:
		"""Import enemies from JSON. Returns count of modified enemies."""
		with open(input_path, "r") as f:
			data = json.load(f)

		if "enemies" not in data:
			print("Invalid JSON: missing 'enemies' key")
			return 0

		modified = 0
		for enemy_data in data["enemies"]:
			enemy_id = enemy_data.get("id")
			if enemy_id is None:
				continue

			# Only update editable fields
			update_fields = {}
			editable = ["hp", "power", "guard", "speed", "ai_pattern",
						"exp", "gold", "drop1_id", "drop1_rate", "drop2_id", "drop2_rate"]
			for key in editable:
				if key in enemy_data:
					update_fields[key] = enemy_data[key]

			if update_fields and self.set_enemy(enemy_id, **update_fields):
				modified += 1

		print(f"Modified {modified} enemies")
		return modified

	def save_rom(self, output_path: Optional[Path] = None) -> None:
		"""Save modified ROM."""
		if output_path is None:
			output_path = self.rom_path

		with open(output_path, "wb") as f:
			f.write(self.rom_data)

		print(f"Saved ROM to {output_path}")

	def print_enemy(self, enemy: dict) -> None:
		"""Print enemy details."""
		print(f"Enemy #{enemy['id']:03d} (${enemy['enemy_id']:02X})")
		print(f"  Sprite: ${enemy['sprite_index']:02X}")
		print(f"  HP: {enemy['hp']}")
		print(f"  Power: {enemy['power']}")
		print(f"  Guard: {enemy['guard']}")
		print(f"  Speed: {enemy['speed']}")
		print(f"  AI: {enemy['ai_name']}")
		print(f"  EXP: {enemy['exp']}")
		print(f"  Gold: {enemy['gold']}")
		print(f"  Drop 1: Item ${enemy['drop1_id']:02X} @ {enemy['drop1_rate']}%")
		print(f"  Drop 2: Item ${enemy['drop2_id']:02X} @ {enemy['drop2_rate']}%")


def main():
	parser = argparse.ArgumentParser(description="Edit Robotrek enemy data")
	parser.add_argument("rom", help="Path to Robotrek ROM file")
	parser.add_argument("--export", "-e", help="Export enemies to JSON")
	parser.add_argument("--import", "-i", dest="import_file", help="Import enemies from JSON")
	parser.add_argument("--output", "-o", help="Output ROM path (for imports)")
	parser.add_argument("--list", "-l", action="store_true", help="List all enemies")
	parser.add_argument("--enemy", type=int, help="Show specific enemy")

	args = parser.parse_args()

	editor = RobotrekEnemyEditor(args.rom)

	if args.export:
		editor.export_json(Path(args.export))

	elif args.import_file:
		editor.import_json(Path(args.import_file))
		output_path = Path(args.output) if args.output else None
		editor.save_rom(output_path)

	elif args.list:
		for enemy in editor.enemies:
			print(f"#{enemy['id']:03d}: HP={enemy['hp']:4d}, "
				  f"Pow={enemy['power']:3d}, Grd={enemy['guard']:3d}, Spd={enemy['speed']:3d}, "
				  f"EXP={enemy['exp']:4d}, Gold={enemy['gold']:4d}")

	elif args.enemy is not None:
		enemy = editor.get_enemy(args.enemy)
		if enemy:
			editor.print_enemy(enemy)
		else:
			print(f"Enemy #{args.enemy} not found")

	else:
		# Print summary
		print(f"Robotrek Enemy Editor")
		print(f"ROM: {editor.rom_path}")
		print(f"Enemies loaded: {len(editor.enemies)}")
		print()
		print("Usage:")
		print("  --export <file.json>  Export enemies to JSON")
		print("  --import <file.json>  Import enemies from JSON")
		print("  --list                List all enemies")
		print("  --enemy <id>          Show specific enemy")


if __name__ == "__main__":
	main()
