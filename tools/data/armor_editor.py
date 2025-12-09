#!/usr/bin/env python3
"""
Armor Editor - Edit RPG armor and equipment data.

Comprehensive editor for armor stats, resistances, and properties
in retro RPG games.

Usage:
	python armor_editor.py armor.json --view
	python armor_editor.py armor.json --add "Dragon Mail"
	python armor_editor.py armor.json --edit 5 --defense 50

Features:
	- Defense values
	- Elemental resistances
	- Status immunities
	- Equipment restrictions
	- Special properties
"""

import argparse
import json
import os
from dataclasses import dataclass, field
from enum import Enum, Flag, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Set


class Element(Enum):
	"""Elemental types."""
	NONE = 0
	FIRE = 1
	ICE = 2
	LIGHTNING = 3
	WIND = 4
	EARTH = 5
	WATER = 6
	LIGHT = 7
	DARK = 8
	POISON = 9
	HOLY = 10


class ArmorType(Enum):
	"""Armor types."""
	BODY = 0      # Main armor
	HEAD = 1      # Helmet
	SHIELD = 2    # Shield
	ARMS = 3      # Gloves
	LEGS = 4      # Boots
	ACCESSORY = 5 # Ring/Amulet
	CLOAK = 6     # Cape/Cloak
	ROBE = 7      # Mage robe


class StatusEffect(Flag):
	"""Status effect immunities."""
	NONE = 0
	POISON = auto()
	SLEEP = auto()
	CONFUSE = auto()
	PARALYZE = auto()
	STONE = auto()
	BLIND = auto()
	SILENCE = auto()
	CURSE = auto()
	INSTANT_DEATH = auto()
	HP_DRAIN = auto()
	MP_DRAIN = auto()


class ArmorFlag(Flag):
	"""Special armor flags."""
	NONE = 0
	CURSED = auto()
	AUTO_REGEN = auto()        # HP regeneration
	MP_REGEN = auto()          # MP regeneration
	REFLECT_MAGIC = auto()     # Reflects spells
	HALVES_PHYS = auto()       # Halves physical damage
	HALVES_MAGIC = auto()      # Halves magic damage
	IMMUNE_CRITICAL = auto()   # Immune to critical hits
	FLOAT = auto()             # Floating status
	COUNTER = auto()           # Counter attack


class CharacterClass(Flag):
	"""Character classes for equipment restrictions."""
	NONE = 0
	WARRIOR = auto()
	MAGE = auto()
	CLERIC = auto()
	THIEF = auto()
	RANGER = auto()
	PALADIN = auto()
	MONK = auto()
	MERCHANT = auto()
	JESTER = auto()
	SAGE = auto()
	HERO = auto()
	ALL = 0xFFFF


@dataclass
class ElementalResistance:
	"""Elemental resistance values."""
	fire: int = 0       # Percentage (negative = weak, positive = resist)
	ice: int = 0
	lightning: int = 0
	wind: int = 0
	earth: int = 0
	water: int = 0
	light: int = 0
	dark: int = 0
	poison: int = 0
	holy: int = 0

	def to_dict(self) -> Dict[str, int]:
		"""Convert to dictionary."""
		result = {}
		if self.fire:
			result["fire"] = self.fire
		if self.ice:
			result["ice"] = self.ice
		if self.lightning:
			result["lightning"] = self.lightning
		if self.wind:
			result["wind"] = self.wind
		if self.earth:
			result["earth"] = self.earth
		if self.water:
			result["water"] = self.water
		if self.light:
			result["light"] = self.light
		if self.dark:
			result["dark"] = self.dark
		if self.poison:
			result["poison"] = self.poison
		if self.holy:
			result["holy"] = self.holy
		return result

	@classmethod
	def from_dict(cls, data: Dict[str, int]) -> "ElementalResistance":
		"""Create from dictionary."""
		return cls(
			fire=data.get("fire", 0),
			ice=data.get("ice", 0),
			lightning=data.get("lightning", 0),
			wind=data.get("wind", 0),
			earth=data.get("earth", 0),
			water=data.get("water", 0),
			light=data.get("light", 0),
			dark=data.get("dark", 0),
			poison=data.get("poison", 0),
			holy=data.get("holy", 0)
		)


@dataclass
class Armor:
	"""Armor data."""
	id: int = 0
	name: str = ""
	description: str = ""

	# Type
	armor_type: ArmorType = ArmorType.BODY

	# Stats
	defense: int = 0
	magic_defense: int = 0
	evade: int = 0
	magic_evade: int = 0

	# Resistances
	resistances: ElementalResistance = field(default_factory=ElementalResistance)
	status_immunity: StatusEffect = StatusEffect.NONE

	# Properties
	flags: ArmorFlag = ArmorFlag.NONE
	equip_classes: CharacterClass = CharacterClass.ALL

	# Cost
	buy_price: int = 0
	sell_price: int = 0

	# Stat bonuses
	str_bonus: int = 0
	agi_bonus: int = 0
	int_bonus: int = 0
	vit_bonus: int = 0
	luk_bonus: int = 0
	hp_bonus: int = 0
	mp_bonus: int = 0

	# Visual
	icon_id: int = 0
	palette: int = 0

	# ROM data
	rom_address: int = 0
	data_size: int = 0

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"id": self.id,
			"name": self.name,
			"description": self.description,
			"armor_type": self.armor_type.name,
			"defense": self.defense,
			"magic_defense": self.magic_defense,
			"evade": self.evade,
			"magic_evade": self.magic_evade,
			"resistances": self.resistances.to_dict(),
			"status_immunity": self._immunity_to_list(),
			"flags": self._flags_to_list(),
			"equip_classes": self._classes_to_list(),
			"buy_price": self.buy_price,
			"sell_price": self.sell_price,
			"stat_bonuses": {
				"str": self.str_bonus,
				"agi": self.agi_bonus,
				"int": self.int_bonus,
				"vit": self.vit_bonus,
				"luk": self.luk_bonus,
				"hp": self.hp_bonus,
				"mp": self.mp_bonus
			},
			"icon_id": self.icon_id,
			"palette": self.palette,
			"rom_address": f"0x{self.rom_address:06X}" if self.rom_address else None,
			"data_size": self.data_size if self.data_size else None
		}

	def _immunity_to_list(self) -> List[str]:
		"""Convert immunity flags to list."""
		result = []
		for status in StatusEffect:
			if status != StatusEffect.NONE and (self.status_immunity & status):
				result.append(status.name)
		return result

	def _flags_to_list(self) -> List[str]:
		"""Convert armor flags to list."""
		result = []
		for flag in ArmorFlag:
			if flag != ArmorFlag.NONE and (self.flags & flag):
				result.append(flag.name)
		return result

	def _classes_to_list(self) -> List[str]:
		"""Convert class flags to list."""
		if self.equip_classes == CharacterClass.ALL:
			return ["ALL"]
		result = []
		for cls in CharacterClass:
			if cls not in [CharacterClass.NONE, CharacterClass.ALL]:
				if self.equip_classes & cls:
					result.append(cls.name)
		return result

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "Armor":
		"""Create from dictionary."""
		armor = cls()
		armor.id = data.get("id", 0)
		armor.name = data.get("name", "")
		armor.description = data.get("description", "")

		if "armor_type" in data:
			armor.armor_type = ArmorType[data["armor_type"]]

		armor.defense = data.get("defense", 0)
		armor.magic_defense = data.get("magic_defense", 0)
		armor.evade = data.get("evade", 0)
		armor.magic_evade = data.get("magic_evade", 0)

		if "resistances" in data:
			armor.resistances = ElementalResistance.from_dict(data["resistances"])

		# Status immunity
		if "status_immunity" in data:
			immunity = StatusEffect.NONE
			for name in data["status_immunity"]:
				immunity |= StatusEffect[name]
			armor.status_immunity = immunity

		# Flags
		if "flags" in data:
			flags = ArmorFlag.NONE
			for name in data["flags"]:
				flags |= ArmorFlag[name]
			armor.flags = flags

		# Classes
		if "equip_classes" in data:
			if data["equip_classes"] == ["ALL"]:
				armor.equip_classes = CharacterClass.ALL
			else:
				classes = CharacterClass.NONE
				for name in data["equip_classes"]:
					classes |= CharacterClass[name]
				armor.equip_classes = classes

		armor.buy_price = data.get("buy_price", 0)
		armor.sell_price = data.get("sell_price", 0)

		bonuses = data.get("stat_bonuses", {})
		armor.str_bonus = bonuses.get("str", 0)
		armor.agi_bonus = bonuses.get("agi", 0)
		armor.int_bonus = bonuses.get("int", 0)
		armor.vit_bonus = bonuses.get("vit", 0)
		armor.luk_bonus = bonuses.get("luk", 0)
		armor.hp_bonus = bonuses.get("hp", 0)
		armor.mp_bonus = bonuses.get("mp", 0)

		armor.icon_id = data.get("icon_id", 0)
		armor.palette = data.get("palette", 0)

		if data.get("rom_address"):
			armor.rom_address = int(data["rom_address"], 16)
		armor.data_size = data.get("data_size", 0)

		return armor


class ArmorDatabase:
	"""Database of armor."""

	def __init__(self):
		self.armors: Dict[int, Armor] = {}
		self.next_id: int = 1

	def add(self, armor: Armor) -> int:
		"""Add armor to database."""
		if armor.id == 0:
			armor.id = self.next_id

		self.armors[armor.id] = armor
		self.next_id = max(self.next_id, armor.id + 1)
		return armor.id

	def get(self, armor_id: int) -> Optional[Armor]:
		"""Get armor by ID."""
		return self.armors.get(armor_id)

	def get_by_name(self, name: str) -> Optional[Armor]:
		"""Get armor by name."""
		name_lower = name.lower()
		for armor in self.armors.values():
			if armor.name.lower() == name_lower:
				return armor
		return None

	def delete(self, armor_id: int) -> bool:
		"""Delete armor."""
		if armor_id in self.armors:
			del self.armors[armor_id]
			return True
		return False

	def search(self, **criteria) -> List[Armor]:
		"""Search armor by criteria."""
		results = []

		for armor in self.armors.values():
			match = True

			if "name" in criteria:
				if criteria["name"].lower() not in armor.name.lower():
					match = False

			if "armor_type" in criteria:
				if armor.armor_type != criteria["armor_type"]:
					match = False

			if "min_defense" in criteria:
				if armor.defense < criteria["min_defense"]:
					match = False

			if "max_defense" in criteria:
				if armor.defense > criteria["max_defense"]:
					match = False

			if "equip_class" in criteria:
				if not (armor.equip_classes & criteria["equip_class"]):
					match = False

			if "has_flag" in criteria:
				if not (armor.flags & criteria["has_flag"]):
					match = False

			if match:
				results.append(armor)

		return results

	def get_by_type(self, armor_type: ArmorType) -> List[Armor]:
		"""Get all armor of a type."""
		return [a for a in self.armors.values() if a.armor_type == armor_type]

	def to_json(self) -> str:
		"""Export to JSON."""
		data = {
			"armors": [a.to_dict() for a in sorted(self.armors.values(), key=lambda x: x.id)]
		}
		return json.dumps(data, indent="\t")

	def save(self, filepath: str) -> bool:
		"""Save to file."""
		try:
			with open(filepath, "w", encoding="utf-8") as f:
				f.write(self.to_json())
			return True
		except Exception as e:
			print(f"Error saving: {e}")
			return False

	def load(self, filepath: str) -> bool:
		"""Load from file."""
		try:
			with open(filepath, "r", encoding="utf-8") as f:
				data = json.load(f)

			self.armors.clear()
			for armor_data in data.get("armors", []):
				armor = Armor.from_dict(armor_data)
				self.add(armor)

			return True
		except Exception as e:
			print(f"Error loading: {e}")
			return False

	def format_list(self) -> str:
		"""Format armor list."""
		lines = []
		lines.append(f"{'ID':>4} {'Name':<20} {'Type':<10} {'DEF':>4} {'MDEF':>4} {'Price':>6}")
		lines.append("-" * 56)

		for armor in sorted(self.armors.values(), key=lambda x: x.id):
			lines.append(
				f"{armor.id:>4} {armor.name:<20} {armor.armor_type.name:<10} "
				f"{armor.defense:>4} {armor.magic_defense:>4} {armor.buy_price:>6}"
			)

		return "\n".join(lines)

	def format_detail(self, armor_id: int) -> str:
		"""Format armor detail."""
		armor = self.get(armor_id)
		if not armor:
			return f"Armor {armor_id} not found"

		lines = []
		lines.append(f"=== {armor.name} (ID: {armor.id}) ===")
		lines.append(f"Type: {armor.armor_type.name}")
		lines.append(f"Description: {armor.description}")
		lines.append("")
		lines.append("Defense Stats:")
		lines.append(f"  Defense: {armor.defense}")
		lines.append(f"  Magic Defense: {armor.magic_defense}")
		lines.append(f"  Evade: {armor.evade}%")
		lines.append(f"  Magic Evade: {armor.magic_evade}%")
		lines.append("")

		# Resistances
		res = armor.resistances.to_dict()
		if res:
			lines.append("Elemental Resistances:")
			for elem, value in res.items():
				sign = "+" if value > 0 else ""
				lines.append(f"  {elem.title()}: {sign}{value}%")
			lines.append("")

		# Immunities
		immunities = armor._immunity_to_list()
		if immunities:
			lines.append(f"Status Immunities: {', '.join(immunities)}")

		# Flags
		flags = armor._flags_to_list()
		if flags:
			lines.append(f"Properties: {', '.join(flags)}")

		lines.append("")
		lines.append(f"Equip Classes: {', '.join(armor._classes_to_list())}")
		lines.append("")
		lines.append(f"Buy Price: {armor.buy_price} G")
		lines.append(f"Sell Price: {armor.sell_price} G")

		# Stat bonuses
		bonuses = []
		if armor.str_bonus:
			bonuses.append(f"STR {armor.str_bonus:+d}")
		if armor.agi_bonus:
			bonuses.append(f"AGI {armor.agi_bonus:+d}")
		if armor.int_bonus:
			bonuses.append(f"INT {armor.int_bonus:+d}")
		if armor.vit_bonus:
			bonuses.append(f"VIT {armor.vit_bonus:+d}")
		if armor.luk_bonus:
			bonuses.append(f"LUK {armor.luk_bonus:+d}")
		if armor.hp_bonus:
			bonuses.append(f"HP {armor.hp_bonus:+d}")
		if armor.mp_bonus:
			bonuses.append(f"MP {armor.mp_bonus:+d}")

		if bonuses:
			lines.append(f"Stat Bonuses: {', '.join(bonuses)}")

		return "\n".join(lines)


def create_sample_database() -> ArmorDatabase:
	"""Create sample armor database."""
	db = ArmorDatabase()

	# Body armor
	leather_armor = Armor(
		id=1, name="Leather Armor",
		description="Basic leather armor",
		armor_type=ArmorType.BODY,
		defense=5, magic_defense=2,
		buy_price=100, sell_price=50,
		equip_classes=CharacterClass.ALL
	)
	db.add(leather_armor)

	chain_mail = Armor(
		id=2, name="Chain Mail",
		description="Interlocking metal rings",
		armor_type=ArmorType.BODY,
		defense=15, magic_defense=5,
		buy_price=500, sell_price=250,
		equip_classes=CharacterClass.WARRIOR | CharacterClass.PALADIN | CharacterClass.HERO
	)
	db.add(chain_mail)

	dragon_mail = Armor(
		id=3, name="Dragon Mail",
		description="Armor forged from dragon scales",
		armor_type=ArmorType.BODY,
		defense=45, magic_defense=30,
		buy_price=15000, sell_price=7500,
		resistances=ElementalResistance(fire=50),
		equip_classes=CharacterClass.WARRIOR | CharacterClass.HERO
	)
	db.add(dragon_mail)

	# Shield
	wooden_shield = Armor(
		id=4, name="Wooden Shield",
		description="A simple wooden shield",
		armor_type=ArmorType.SHIELD,
		defense=3, evade=5,
		buy_price=50, sell_price=25,
		equip_classes=CharacterClass.ALL
	)
	db.add(wooden_shield)

	mirror_shield = Armor(
		id=5, name="Mirror Shield",
		description="A polished shield that reflects magic",
		armor_type=ArmorType.SHIELD,
		defense=20, magic_defense=25, evade=10, magic_evade=15,
		flags=ArmorFlag.REFLECT_MAGIC,
		buy_price=8000, sell_price=4000,
		equip_classes=CharacterClass.WARRIOR | CharacterClass.PALADIN | CharacterClass.HERO
	)
	db.add(mirror_shield)

	# Helmet
	iron_helm = Armor(
		id=6, name="Iron Helm",
		description="A sturdy iron helmet",
		armor_type=ArmorType.HEAD,
		defense=8, magic_defense=3,
		buy_price=300, sell_price=150,
		equip_classes=CharacterClass.WARRIOR | CharacterClass.PALADIN
	)
	db.add(iron_helm)

	# Accessory
	poison_guard = Armor(
		id=7, name="Poison Guard Ring",
		description="A ring that protects against poison",
		armor_type=ArmorType.ACCESSORY,
		defense=0, magic_defense=0,
		status_immunity=StatusEffect.POISON,
		resistances=ElementalResistance(poison=100),
		buy_price=1000, sell_price=500,
		equip_classes=CharacterClass.ALL
	)
	db.add(poison_guard)

	regen_ring = Armor(
		id=8, name="Regen Ring",
		description="Slowly restores HP over time",
		armor_type=ArmorType.ACCESSORY,
		defense=0, magic_defense=0,
		flags=ArmorFlag.AUTO_REGEN,
		buy_price=5000, sell_price=2500,
		equip_classes=CharacterClass.ALL,
		hp_bonus=20
	)
	db.add(regen_ring)

	# Robe
	sage_robe = Armor(
		id=9, name="Sage's Robe",
		description="Robes worn by powerful sages",
		armor_type=ArmorType.ROBE,
		defense=15, magic_defense=40,
		buy_price=6000, sell_price=3000,
		equip_classes=CharacterClass.MAGE | CharacterClass.SAGE,
		int_bonus=15, mp_bonus=30
	)
	db.add(sage_robe)

	# Cursed armor
	cursed_armor = Armor(
		id=10, name="Cursed Armor",
		description="Powerful armor bearing a terrible curse",
		armor_type=ArmorType.BODY,
		defense=80, magic_defense=50,
		flags=ArmorFlag.CURSED,
		status_immunity=StatusEffect.INSTANT_DEATH,
		buy_price=0, sell_price=10000,
		equip_classes=CharacterClass.WARRIOR,
		str_bonus=20, agi_bonus=-20
	)
	db.add(cursed_armor)

	return db


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Armor Editor")
	parser.add_argument("input", nargs="?", help="Armor database file")
	parser.add_argument("--view", "-v", action="store_true",
						help="View all armor")
	parser.add_argument("--detail", "-d", type=int,
						help="View armor details by ID")
	parser.add_argument("--add", help="Add new armor with name")
	parser.add_argument("--edit", "-e", type=int,
						help="Edit armor by ID")
	parser.add_argument("--delete", type=int,
						help="Delete armor by ID")
	parser.add_argument("--search", "-s",
						help="Search by name")
	parser.add_argument("--type", "-t",
						help="Filter by armor type")
	parser.add_argument("--sample", action="store_true",
						help="Create sample database")
	parser.add_argument("--output", "-o",
						help="Output file")

	# Edit options
	parser.add_argument("--defense", type=int,
						help="Set defense value")
	parser.add_argument("--magic-defense", type=int,
						help="Set magic defense value")
	parser.add_argument("--price", type=int,
						help="Set buy price")
	parser.add_argument("--description",
						help="Set description")

	args = parser.parse_args()

	if not args.input and not args.sample:
		print("Armor Editor")
		print()
		print("Usage: python armor_editor.py <database.json> [options]")
		print()
		print("Options:")
		print("  --view, -v          View all armor")
		print("  --detail, -d ID     View armor details")
		print("  --add NAME          Add new armor")
		print("  --edit, -e ID       Edit armor")
		print("  --delete ID         Delete armor")
		print("  --search, -s NAME   Search by name")
		print("  --type, -t TYPE     Filter by type")
		print("  --sample            Create sample database")
		print("  --output, -o FILE   Output file")
		print()
		print("Armor Types: BODY, HEAD, SHIELD, ARMS, LEGS, ACCESSORY, CLOAK, ROBE")
		return

	# Create sample
	if args.sample:
		db = create_sample_database()
		out_file = args.output or "armor_sample.json"
		if db.save(out_file):
			print(f"Created sample database: {out_file}")
		return

	# Load database
	db = ArmorDatabase()
	if os.path.exists(args.input):
		db.load(args.input)

	# View
	if args.view:
		print(db.format_list())
		return

	# Detail
	if args.detail:
		print(db.format_detail(args.detail))
		return

	# Search
	if args.search:
		results = db.search(name=args.search)
		if results:
			for armor in results:
				print(f"{armor.id}: {armor.name} ({armor.armor_type.name}, DEF: {armor.defense})")
		else:
			print("No armor found")
		return

	# Type filter
	if args.type:
		try:
			atype = ArmorType[args.type.upper()]
			armors = db.get_by_type(atype)
			for armor in armors:
				print(f"{armor.id}: {armor.name} (DEF: {armor.defense})")
		except KeyError:
			print(f"Unknown armor type: {args.type}")
		return

	# Add
	if args.add:
		armor = Armor(name=args.add)
		if args.defense:
			armor.defense = args.defense
		if args.magic_defense:
			armor.magic_defense = args.magic_defense
		if args.price:
			armor.buy_price = args.price
			armor.sell_price = args.price // 2
		if args.description:
			armor.description = args.description

		aid = db.add(armor)
		print(f"Added armor: {armor.name} (ID: {aid})")

	# Edit
	if args.edit:
		armor = db.get(args.edit)
		if armor:
			if args.defense is not None:
				armor.defense = args.defense
			if args.magic_defense is not None:
				armor.magic_defense = args.magic_defense
			if args.price is not None:
				armor.buy_price = args.price
				armor.sell_price = args.price // 2
			if args.description:
				armor.description = args.description
			print(f"Updated armor: {armor.name}")
		else:
			print(f"Armor {args.edit} not found")
			return

	# Delete
	if args.delete:
		if db.delete(args.delete):
			print(f"Deleted armor {args.delete}")
		else:
			print(f"Armor {args.delete} not found")
			return

	# Save
	out_file = args.output or args.input
	if db.save(out_file):
		print(f"Saved: {out_file}")


if __name__ == "__main__":
	main()
