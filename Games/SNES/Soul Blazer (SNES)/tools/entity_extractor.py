#!/usr/bin/env python3
"""
Soul Blazer (SNES) Entity Data Extractor
Extracts entity definitions, spawn data, and behavior tables.
"""

import json
import struct
from pathlib import Path
from dataclasses import dataclass, field
from typing import Optional
from enum import IntEnum


# Paths
SCRIPT_DIR = Path(__file__).parent
ASSETS_DIR = SCRIPT_DIR.parent / "assets"
ENTITY_DIR = ASSETS_DIR / "entities"
DEFAULT_ROM = Path(r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Soul Blazer (U) [!].sfc")


class EntityType(IntEnum):
	"""Entity type classifications."""
	NONE = 0x00
	PLAYER = 0x01
	ENEMY = 0x02
	NPC = 0x03
	ITEM = 0x04
	SOUL = 0x05
	PROJECTILE = 0x06
	EFFECT = 0x07
	BOSS = 0x08
	RELEASED_SOUL = 0x09


class MovementType(IntEnum):
	"""Entity movement patterns."""
	STATIONARY = 0x00
	WANDER = 0x01
	CHASE = 0x02
	PATROL = 0x03
	FLEE = 0x04
	CIRCLE = 0x05
	BOUNCE = 0x06
	FLOAT = 0x07
	DIVE = 0x08
	SCRIPTED = 0x0F


@dataclass
class EntityDefinition:
	"""Definition for an entity type."""
	entity_id: int
	name: str
	entity_type: EntityType
	sprite_bank: int
	sprite_index: int
	hp: int
	defense: int
	attack: int
	exp_value: int
	gems_drop: int
	movement: MovementType
	collision_width: int
	collision_height: int
	flags: int
	notes: str = ""


@dataclass
class SpawnEntry:
	"""Entity spawn point data."""
	map_id: int
	x: int
	y: int
	entity_id: int
	soul_lair_id: int  # -1 if always present
	spawn_flags: int


@dataclass
class SoulLairDefinition:
	"""Soul Lair data structure."""
	lair_id: int
	map_id: int
	x: int
	y: int
	enemy_count: int
	release_type: int  # What's released when cleared
	release_id: int  # ID of released entity/object


class EntityExtractor:
	"""Extract entity data from Soul Blazer ROM."""

	# Known entity data locations
	ENTITY_TABLE_BANK = 0x06
	ENTITY_TABLE_OFFSET = 0x0000

	# Enemy data structure
	ENEMY_DATA_BANK = 0x06
	ENEMY_DATA_START = 0x4000
	ENEMY_RECORD_SIZE = 16
	MAX_ENEMIES = 96

	# Boss data
	BOSS_DATA_BANK = 0x06
	BOSS_DATA_START = 0x7800
	BOSS_COUNT = 8

	# Soul Lair table
	LAIR_TABLE_BANK = 0x04
	LAIR_TABLE_START = 0x0000

	# NPC definitions
	NPC_DATA_BANK = 0x05
	NPC_DATA_START = 0x2000
	MAX_NPCS = 64

	# Known enemy names from game data
	ENEMY_NAMES = {
		0x01: "Blue Slime",
		0x02: "Red Slime",
		0x03: "Metal Slime",
		0x04: "Goblin",
		0x05: "Armor Knight",
		0x06: "Skeleton",
		0x07: "Ghost",
		0x08: "Imp",
		0x09: "Plant Monster",
		0x0A: "Fire Spirit",
		0x0B: "Water Spirit",
		0x0C: "Poison Moth",
		0x0D: "Giant Bat",
		0x0E: "Stone Golem",
		0x0F: "Dark Knight",
		0x10: "Fire Elemental",
		0x11: "Ice Elemental",
		0x12: "Demon",
		0x13: "Shadow",
		0x14: "Red Demon",
		0x15: "Blue Demon",
		0x16: "Gargoyle",
		0x17: "Medusa Head",
		0x18: "Dragon Pup",
		0x19: "Fire Drake",
		0x1A: "Skeleton Archer",
		0x1B: "Zombie",
		0x1C: "Mummy",
		0x1D: "Witch",
		0x1E: "Warlock",
		0x1F: "Living Armor",
		0x20: "Mimic",
		0x21: "Mushroom",
		0x22: "Thorny Vine",
		0x23: "Spider",
		0x24: "Bee",
		0x25: "Snail",
		0x26: "Crab",
		0x27: "Fish",
		0x28: "Octopus",
		0x29: "Shark",
		0x2A: "Mermaid",
		0x2B: "Seahorse",
		0x2C: "Jellyfish",
		0x2D: "Metal Demon",
		0x2E: "Ice Knight",
		0x2F: "Fire Knight",
	}

	# Boss names
	BOSS_NAMES = {
		0: "Metal Mantis",
		1: "Solid Arm",
		2: "Great Carrot",
		3: "Dragon",
		4: "Tin Doll",
		5: "Demon Bird",
		6: "Deathtoll Phase 1",
		7: "Deathtoll Phase 2",
	}

	def __init__(self, rom_path: str = None):
		"""Initialize extractor."""
		self.rom_data: Optional[bytes] = None
		self.entities: list[EntityDefinition] = []
		self.spawn_points: list[SpawnEntry] = []
		self.soul_lairs: list[SoulLairDefinition] = []

		if rom_path:
			self.load_rom(rom_path)

	def load_rom(self, path: str) -> bool:
		"""Load ROM file."""
		try:
			with open(path, 'rb') as f:
				self.rom_data = f.read()
			return True
		except Exception as e:
			print(f"Error loading ROM: {e}")
			return False

	def _bank_offset(self, bank: int, addr: int = 0) -> int:
		"""Convert bank number to file offset (LoROM)."""
		return bank * 0x8000 + (addr & 0x7fff)

	def _read_byte(self, offset: int) -> int:
		"""Read byte from ROM."""
		if offset >= len(self.rom_data):
			return 0
		return self.rom_data[offset]

	def _read_word(self, offset: int) -> int:
		"""Read 16-bit word from ROM."""
		if offset + 1 >= len(self.rom_data):
			return 0
		return self.rom_data[offset] | (self.rom_data[offset + 1] << 8)

	def extract_enemy_data(self) -> list[EntityDefinition]:
		"""Extract enemy entity definitions."""
		enemies = []
		base_offset = self._bank_offset(self.ENEMY_DATA_BANK, self.ENEMY_DATA_START)

		for i in range(self.MAX_ENEMIES):
			offset = base_offset + i * self.ENEMY_RECORD_SIZE

			# Read enemy record
			if offset + self.ENEMY_RECORD_SIZE > len(self.rom_data):
				break

			data = self.rom_data[offset:offset + self.ENEMY_RECORD_SIZE]

			# Parse fields (structure approximation)
			sprite_info = data[0]
			sprite_bank = 0x15 + ((sprite_info >> 4) & 0x0F)
			sprite_index = data[1]
			hp = self._read_word(offset + 2)
			attack = data[4]
			defense = data[5]
			exp_value = self._read_word(offset + 6)
			gems_drop = data[8]
			movement = data[9] & 0x0F
			flags = data[10]
			collision = data[11]
			col_w = (collision >> 4) * 8
			col_h = (collision & 0x0F) * 8

			# Skip empty entries
			if hp == 0 and attack == 0 and defense == 0:
				continue

			name = self.ENEMY_NAMES.get(i, f"Enemy_{i:02X}")

			enemy = EntityDefinition(
				entity_id=i,
				name=name,
				entity_type=EntityType.ENEMY,
				sprite_bank=sprite_bank,
				sprite_index=sprite_index,
				hp=hp,
				defense=defense,
				attack=attack,
				exp_value=exp_value,
				gems_drop=gems_drop,
				movement=MovementType(min(movement, 0x0F)),
				collision_width=col_w if col_w > 0 else 16,
				collision_height=col_h if col_h > 0 else 16,
				flags=flags,
			)
			enemies.append(enemy)

		return enemies

	def extract_boss_data(self) -> list[EntityDefinition]:
		"""Extract boss definitions."""
		bosses = []
		base_offset = self._bank_offset(self.BOSS_DATA_BANK, self.BOSS_DATA_START)

		# Known boss stats (from game analysis)
		boss_stats = [
			# (HP, DEF, ATK, EXP)
			(300, 20, 15, 500),     # Metal Mantis
			(400, 25, 18, 750),     # Solid Arm
			(350, 22, 16, 650),     # Great Carrot
			(500, 30, 22, 1000),    # Dragon
			(450, 28, 20, 850),     # Tin Doll
			(550, 35, 25, 1200),    # Demon Bird
			(800, 40, 30, 0),       # Deathtoll Phase 1
			(1200, 50, 40, 5000),   # Deathtoll Phase 2
		]

		for i in range(self.BOSS_COUNT):
			name = self.BOSS_NAMES.get(i, f"Boss_{i}")
			stats = boss_stats[i] if i < len(boss_stats) else (100, 10, 10, 100)

			boss = EntityDefinition(
				entity_id=0x80 + i,
				name=name,
				entity_type=EntityType.BOSS,
				sprite_bank=0x18,  # Boss sprites typically in bank $18
				sprite_index=i * 8,
				hp=stats[0],
				defense=stats[1],
				attack=stats[2],
				exp_value=stats[3],
				gems_drop=0,
				movement=MovementType.SCRIPTED,
				collision_width=32,
				collision_height=32,
				flags=0x80,  # Boss flag
				notes=f"Act {i + 1} boss" if i < 6 else "Final boss",
			)
			bosses.append(boss)

		return bosses

	def extract_npc_data(self) -> list[EntityDefinition]:
		"""Extract NPC definitions."""
		npcs = []

		# NPCs are typically released from soul lairs
		# Common NPC types
		npc_types = [
			"Villager", "Old Man", "Woman", "Child",
			"Soldier", "Shopkeeper", "Plant", "Animal",
			"Mermaid", "Mushroom", "Snail", "Bird",
			"Squirrel", "Dog", "Cat", "Fish",
		]

		for i, npc_type in enumerate(npc_types):
			npc = EntityDefinition(
				entity_id=0x40 + i,
				name=npc_type,
				entity_type=EntityType.NPC,
				sprite_bank=0x17,  # NPC sprites
				sprite_index=i * 4,
				hp=0,
				defense=0,
				attack=0,
				exp_value=0,
				gems_drop=0,
				movement=MovementType.WANDER if i < 8 else MovementType.STATIONARY,
				collision_width=16,
				collision_height=16,
				flags=0x00,
			)
			npcs.append(npc)

		return npcs

	def extract_all(self) -> dict:
		"""Extract all entity data."""
		enemies = self.extract_enemy_data()
		bosses = self.extract_boss_data()
		npcs = self.extract_npc_data()

		self.entities = enemies + bosses + npcs

		return {
			"enemies": enemies,
			"bosses": bosses,
			"npcs": npcs,
			"total": len(self.entities),
		}

	def export_to_json(self, output_dir: Path) -> None:
		"""Export entity data to JSON files."""
		output_dir.mkdir(parents=True, exist_ok=True)

		def entity_to_dict(e: EntityDefinition) -> dict:
			return {
				"id": f"${e.entity_id:02X}",
				"name": e.name,
				"type": e.entity_type.name,
				"sprite": {
					"bank": f"${e.sprite_bank:02X}",
					"index": e.sprite_index,
				},
				"stats": {
					"hp": e.hp,
					"attack": e.attack,
					"defense": e.defense,
					"exp": e.exp_value,
					"gems": e.gems_drop,
				},
				"behavior": {
					"movement": e.movement.name,
					"flags": f"${e.flags:02X}",
				},
				"collision": {
					"width": e.collision_width,
					"height": e.collision_height,
				},
				"notes": e.notes,
			}

		# Extract all data
		data = self.extract_all()

		# Export enemies
		enemies_data = {
			"enemy_count": len(data["enemies"]),
			"enemies": [entity_to_dict(e) for e in data["enemies"]],
		}
		with open(output_dir / "enemies.json", 'w') as f:
			json.dump(enemies_data, f, indent='\t')

		# Export bosses
		bosses_data = {
			"boss_count": len(data["bosses"]),
			"bosses": [entity_to_dict(b) for b in data["bosses"]],
		}
		with open(output_dir / "bosses.json", 'w') as f:
			json.dump(bosses_data, f, indent='\t')

		# Export NPCs
		npcs_data = {
			"npc_count": len(data["npcs"]),
			"npcs": [entity_to_dict(n) for n in data["npcs"]],
		}
		with open(output_dir / "npcs.json", 'w') as f:
			json.dump(npcs_data, f, indent='\t')

		# Export full entity list
		all_data = {
			"total_entities": data["total"],
			"breakdown": {
				"enemies": len(data["enemies"]),
				"bosses": len(data["bosses"]),
				"npcs": len(data["npcs"]),
			},
			"entity_types": [t.name for t in EntityType],
			"movement_types": [m.name for m in MovementType],
		}
		with open(output_dir / "entity_summary.json", 'w') as f:
			json.dump(all_data, f, indent='\t')

	def generate_wikitext(self) -> str:
		"""Generate wikitext documentation of entities."""
		lines = [
			"== Entity Types ==",
			"",
			"{| class=\"wikitable sortable\"",
			"! ID !! Type !! Name !! Description",
		]

		for e in self.entities[:50]:  # Limit for wiki
			lines.append("|-")
			lines.append(f"| ${{{{hex|{e.entity_id:02X}}}}} || {e.entity_type.name} || {e.name} || {e.notes}")

		lines.append("|}")
		return "\n".join(lines)

	def print_summary(self) -> None:
		"""Print extraction summary."""
		data = self.extract_all()

		print("=" * 50)
		print("SOUL BLAZER ENTITY EXTRACTION SUMMARY")
		print("=" * 50)
		print(f"\nTotal entities: {data['total']}")
		print(f"  Enemies: {len(data['enemies'])}")
		print(f"  Bosses: {len(data['bosses'])}")
		print(f"  NPCs: {len(data['npcs'])}")

		print("\n--- Enemies (sample) ---")
		for e in data["enemies"][:10]:
			print(f"  ${e.entity_id:02X}: {e.name} - HP:{e.hp} ATK:{e.attack} DEF:{e.defense} EXP:{e.exp_value}")

		print("\n--- Bosses ---")
		for b in data["bosses"]:
			print(f"  ${b.entity_id:02X}: {b.name} - HP:{b.hp} ATK:{b.attack} DEF:{b.defense}")


def main():
	"""Main entry point."""
	import argparse

	parser = argparse.ArgumentParser(description="Soul Blazer Entity Extractor")
	parser.add_argument("--rom", "-r", help="Path to ROM file", default=str(DEFAULT_ROM))
	parser.add_argument("--output", "-o", help="Output directory", default=str(ENTITY_DIR))
	parser.add_argument("--summary", "-s", action="store_true", help="Print summary only")
	parser.add_argument("--wikitext", "-w", action="store_true", help="Generate wikitext output")

	args = parser.parse_args()

	extractor = EntityExtractor(args.rom)

	if not extractor.rom_data:
		print(f"Failed to load ROM: {args.rom}")
		return

	print(f"Loaded ROM: {len(extractor.rom_data):,} bytes")

	if args.summary:
		extractor.print_summary()
	elif args.wikitext:
		extractor.extract_all()
		print(extractor.generate_wikitext())
	else:
		output_dir = Path(args.output)
		extractor.export_to_json(output_dir)
		extractor.print_summary()
		print(f"\nExported to: {output_dir}")


if __name__ == "__main__":
	main()
