#!/usr/bin/env python3
"""
Weapon Editor - Edit RPG weapon data.

Comprehensive editor for weapon stats, effects, and properties
in retro RPG games.

Usage:
	python weapon_editor.py weapons.json --view
	python weapon_editor.py weapons.json --add "Fire Sword"
	python weapon_editor.py weapons.json --edit 5 --attack 50

Features:
	- Attack/damage values
	- Element types
	- Status effects
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


class WeaponType(Enum):
	"""Weapon types."""
	SWORD = 0
	AXE = 1
	SPEAR = 2
	BOW = 3
	STAFF = 4
	WAND = 5
	DAGGER = 6
	HAMMER = 7
	WHIP = 8
	CLAW = 9
	FAN = 10
	BOOMERANG = 11
	GUN = 12
	FIST = 13
	THROWN = 14


class StatusEffect(Flag):
	"""Status effects that can be inflicted."""
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


class WeaponFlag(Flag):
	"""Special weapon flags."""
	NONE = 0
	TWO_HANDED = auto()
	THROWABLE = auto()
	CURSED = auto()
	UNBREAKABLE = auto()
	METAL = auto()
	STRIKING = auto()       # Always hits
	CRITICAL_UP = auto()    # Higher crit rate
	MULTI_HIT = auto()      # Hits multiple times
	BOSS_KILLER = auto()    # Extra damage to bosses
	DRAGON_KILLER = auto()  # Extra damage to dragons
	UNDEAD_KILLER = auto()  # Extra damage to undead


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
class Weapon:
	"""Weapon data."""
	id: int = 0
	name: str = ""
	description: str = ""

	# Type
	weapon_type: WeaponType = WeaponType.SWORD

	# Stats
	attack: int = 0
	hit_rate: int = 100
	critical_rate: int = 5
	speed_mod: int = 0

	# Elemental
	element: Element = Element.NONE

	# Status
	inflict_status: StatusEffect = StatusEffect.NONE
	inflict_chance: int = 0  # Percentage

	# Properties
	flags: WeaponFlag = WeaponFlag.NONE
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
			"weapon_type": self.weapon_type.name,
			"attack": self.attack,
			"hit_rate": self.hit_rate,
			"critical_rate": self.critical_rate,
			"speed_mod": self.speed_mod,
			"element": self.element.name,
			"inflict_status": self._status_to_list(),
			"inflict_chance": self.inflict_chance,
			"flags": self._flags_to_list(),
			"equip_classes": self._classes_to_list(),
			"buy_price": self.buy_price,
			"sell_price": self.sell_price,
			"stat_bonuses": {
				"str": self.str_bonus,
				"agi": self.agi_bonus,
				"int": self.int_bonus,
				"vit": self.vit_bonus,
				"luk": self.luk_bonus
			},
			"icon_id": self.icon_id,
			"palette": self.palette,
			"rom_address": f"0x{self.rom_address:06X}" if self.rom_address else None,
			"data_size": self.data_size if self.data_size else None
		}

	def _status_to_list(self) -> List[str]:
		"""Convert status flags to list."""
		result = []
		for status in StatusEffect:
			if status != StatusEffect.NONE and (self.inflict_status & status):
				result.append(status.name)
		return result

	def _flags_to_list(self) -> List[str]:
		"""Convert weapon flags to list."""
		result = []
		for flag in WeaponFlag:
			if flag != WeaponFlag.NONE and (self.flags & flag):
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
	def from_dict(cls, data: Dict[str, Any]) -> "Weapon":
		"""Create from dictionary."""
		weapon = cls()
		weapon.id = data.get("id", 0)
		weapon.name = data.get("name", "")
		weapon.description = data.get("description", "")

		if "weapon_type" in data:
			weapon.weapon_type = WeaponType[data["weapon_type"]]

		weapon.attack = data.get("attack", 0)
		weapon.hit_rate = data.get("hit_rate", 100)
		weapon.critical_rate = data.get("critical_rate", 5)
		weapon.speed_mod = data.get("speed_mod", 0)

		if "element" in data:
			weapon.element = Element[data["element"]]

		# Status effects
		if "inflict_status" in data:
			status = StatusEffect.NONE
			for name in data["inflict_status"]:
				status |= StatusEffect[name]
			weapon.inflict_status = status
		weapon.inflict_chance = data.get("inflict_chance", 0)

		# Flags
		if "flags" in data:
			flags = WeaponFlag.NONE
			for name in data["flags"]:
				flags |= WeaponFlag[name]
			weapon.flags = flags

		# Classes
		if "equip_classes" in data:
			if data["equip_classes"] == ["ALL"]:
				weapon.equip_classes = CharacterClass.ALL
			else:
				classes = CharacterClass.NONE
				for name in data["equip_classes"]:
					classes |= CharacterClass[name]
				weapon.equip_classes = classes

		weapon.buy_price = data.get("buy_price", 0)
		weapon.sell_price = data.get("sell_price", 0)

		bonuses = data.get("stat_bonuses", {})
		weapon.str_bonus = bonuses.get("str", 0)
		weapon.agi_bonus = bonuses.get("agi", 0)
		weapon.int_bonus = bonuses.get("int", 0)
		weapon.vit_bonus = bonuses.get("vit", 0)
		weapon.luk_bonus = bonuses.get("luk", 0)

		weapon.icon_id = data.get("icon_id", 0)
		weapon.palette = data.get("palette", 0)

		if data.get("rom_address"):
			weapon.rom_address = int(data["rom_address"], 16)
		weapon.data_size = data.get("data_size", 0)

		return weapon


class WeaponDatabase:
	"""Database of weapons."""

	def __init__(self):
		self.weapons: Dict[int, Weapon] = {}
		self.next_id: int = 1

	def add(self, weapon: Weapon) -> int:
		"""Add weapon to database."""
		if weapon.id == 0:
			weapon.id = self.next_id

		self.weapons[weapon.id] = weapon
		self.next_id = max(self.next_id, weapon.id + 1)
		return weapon.id

	def get(self, weapon_id: int) -> Optional[Weapon]:
		"""Get weapon by ID."""
		return self.weapons.get(weapon_id)

	def get_by_name(self, name: str) -> Optional[Weapon]:
		"""Get weapon by name."""
		name_lower = name.lower()
		for weapon in self.weapons.values():
			if weapon.name.lower() == name_lower:
				return weapon
		return None

	def delete(self, weapon_id: int) -> bool:
		"""Delete weapon."""
		if weapon_id in self.weapons:
			del self.weapons[weapon_id]
			return True
		return False

	def search(self, **criteria) -> List[Weapon]:
		"""Search weapons by criteria."""
		results = []

		for weapon in self.weapons.values():
			match = True

			if "name" in criteria:
				if criteria["name"].lower() not in weapon.name.lower():
					match = False

			if "weapon_type" in criteria:
				if weapon.weapon_type != criteria["weapon_type"]:
					match = False

			if "element" in criteria:
				if weapon.element != criteria["element"]:
					match = False

			if "min_attack" in criteria:
				if weapon.attack < criteria["min_attack"]:
					match = False

			if "max_attack" in criteria:
				if weapon.attack > criteria["max_attack"]:
					match = False

			if "equip_class" in criteria:
				if not (weapon.equip_classes & criteria["equip_class"]):
					match = False

			if "has_flag" in criteria:
				if not (weapon.flags & criteria["has_flag"]):
					match = False

			if match:
				results.append(weapon)

		return results

	def get_by_type(self, weapon_type: WeaponType) -> List[Weapon]:
		"""Get all weapons of a type."""
		return [w for w in self.weapons.values() if w.weapon_type == weapon_type]

	def get_elemental(self, element: Element) -> List[Weapon]:
		"""Get all weapons with an element."""
		return [w for w in self.weapons.values() if w.element == element]

	def to_json(self) -> str:
		"""Export to JSON."""
		data = {
			"weapons": [w.to_dict() for w in sorted(self.weapons.values(), key=lambda x: x.id)]
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

			self.weapons.clear()
			for weapon_data in data.get("weapons", []):
				weapon = Weapon.from_dict(weapon_data)
				self.add(weapon)

			return True
		except Exception as e:
			print(f"Error loading: {e}")
			return False

	def format_list(self) -> str:
		"""Format weapon list."""
		lines = []
		lines.append(f"{'ID':>4} {'Name':<20} {'Type':<10} {'ATK':>4} {'Element':<10} {'Price':>6}")
		lines.append("-" * 60)

		for weapon in sorted(self.weapons.values(), key=lambda x: x.id):
			lines.append(
				f"{weapon.id:>4} {weapon.name:<20} {weapon.weapon_type.name:<10} "
				f"{weapon.attack:>4} {weapon.element.name:<10} {weapon.buy_price:>6}"
			)

		return "\n".join(lines)

	def format_detail(self, weapon_id: int) -> str:
		"""Format weapon detail."""
		weapon = self.get(weapon_id)
		if not weapon:
			return f"Weapon {weapon_id} not found"

		lines = []
		lines.append(f"=== {weapon.name} (ID: {weapon.id}) ===")
		lines.append(f"Type: {weapon.weapon_type.name}")
		lines.append(f"Description: {weapon.description}")
		lines.append("")
		lines.append("Combat Stats:")
		lines.append(f"  Attack: {weapon.attack}")
		lines.append(f"  Hit Rate: {weapon.hit_rate}%")
		lines.append(f"  Critical Rate: {weapon.critical_rate}%")
		lines.append(f"  Speed Mod: {weapon.speed_mod:+d}")
		lines.append("")

		if weapon.element != Element.NONE:
			lines.append(f"Element: {weapon.element.name}")

		if weapon.inflict_status != StatusEffect.NONE:
			lines.append(f"Inflicts: {weapon._status_to_list()} ({weapon.inflict_chance}%)")

		flags = weapon._flags_to_list()
		if flags:
			lines.append(f"Properties: {', '.join(flags)}")

		lines.append("")
		lines.append(f"Equip Classes: {', '.join(weapon._classes_to_list())}")
		lines.append("")
		lines.append(f"Buy Price: {weapon.buy_price} G")
		lines.append(f"Sell Price: {weapon.sell_price} G")

		# Stat bonuses
		bonuses = []
		if weapon.str_bonus:
			bonuses.append(f"STR {weapon.str_bonus:+d}")
		if weapon.agi_bonus:
			bonuses.append(f"AGI {weapon.agi_bonus:+d}")
		if weapon.int_bonus:
			bonuses.append(f"INT {weapon.int_bonus:+d}")
		if weapon.vit_bonus:
			bonuses.append(f"VIT {weapon.vit_bonus:+d}")
		if weapon.luk_bonus:
			bonuses.append(f"LUK {weapon.luk_bonus:+d}")

		if bonuses:
			lines.append(f"Stat Bonuses: {', '.join(bonuses)}")

		return "\n".join(lines)


def create_sample_database() -> WeaponDatabase:
	"""Create sample weapon database."""
	db = WeaponDatabase()

	# Basic weapons
	copper_sword = Weapon(
		id=1, name="Copper Sword",
		description="A basic copper sword",
		weapon_type=WeaponType.SWORD,
		attack=10, hit_rate=100, critical_rate=5,
		buy_price=100, sell_price=50,
		equip_classes=CharacterClass.WARRIOR | CharacterClass.HERO
	)
	db.add(copper_sword)

	iron_sword = Weapon(
		id=2, name="Iron Sword",
		description="A sturdy iron sword",
		weapon_type=WeaponType.SWORD,
		attack=25, hit_rate=100, critical_rate=5,
		buy_price=500, sell_price=250,
		equip_classes=CharacterClass.WARRIOR | CharacterClass.HERO | CharacterClass.PALADIN
	)
	db.add(iron_sword)

	flame_blade = Weapon(
		id=3, name="Flame Blade",
		description="A sword engulfed in flames",
		weapon_type=WeaponType.SWORD,
		attack=45, hit_rate=100, critical_rate=8,
		element=Element.FIRE,
		buy_price=3000, sell_price=1500,
		equip_classes=CharacterClass.WARRIOR | CharacterClass.HERO
	)
	db.add(flame_blade)

	poison_dagger = Weapon(
		id=4, name="Poison Dagger",
		description="A dagger coated in venom",
		weapon_type=WeaponType.DAGGER,
		attack=15, hit_rate=95, critical_rate=12,
		element=Element.POISON,
		inflict_status=StatusEffect.POISON,
		inflict_chance=25,
		buy_price=800, sell_price=400,
		equip_classes=CharacterClass.THIEF | CharacterClass.RANGER,
		agi_bonus=5
	)
	db.add(poison_dagger)

	thunder_staff = Weapon(
		id=5, name="Thunder Staff",
		description="A staff crackling with lightning",
		weapon_type=WeaponType.STAFF,
		attack=20, hit_rate=100, critical_rate=3,
		element=Element.LIGHTNING,
		buy_price=2000, sell_price=1000,
		equip_classes=CharacterClass.MAGE | CharacterClass.SAGE,
		int_bonus=10
	)
	db.add(thunder_staff)

	dragon_slayer = Weapon(
		id=6, name="Dragon Slayer",
		description="A legendary blade that slays dragons",
		weapon_type=WeaponType.SWORD,
		attack=80, hit_rate=100, critical_rate=10,
		flags=WeaponFlag.DRAGON_KILLER | WeaponFlag.TWO_HANDED,
		buy_price=0, sell_price=0,  # Not for sale
		equip_classes=CharacterClass.HERO,
		str_bonus=15
	)
	db.add(dragon_slayer)

	cursed_axe = Weapon(
		id=7, name="Cursed Axe",
		description="A powerful axe bearing a dark curse",
		weapon_type=WeaponType.AXE,
		attack=95, hit_rate=85, critical_rate=15,
		element=Element.DARK,
		flags=WeaponFlag.CURSED | WeaponFlag.TWO_HANDED,
		inflict_status=StatusEffect.CURSE,
		inflict_chance=10,
		buy_price=0, sell_price=5000,
		equip_classes=CharacterClass.WARRIOR,
		str_bonus=20, luk_bonus=-10
	)
	db.add(cursed_axe)

	return db


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Weapon Editor")
	parser.add_argument("input", nargs="?", help="Weapon database file")
	parser.add_argument("--view", "-v", action="store_true",
						help="View all weapons")
	parser.add_argument("--detail", "-d", type=int,
						help="View weapon details by ID")
	parser.add_argument("--add", help="Add new weapon with name")
	parser.add_argument("--edit", "-e", type=int,
						help="Edit weapon by ID")
	parser.add_argument("--delete", type=int,
						help="Delete weapon by ID")
	parser.add_argument("--search", "-s",
						help="Search by name")
	parser.add_argument("--type", "-t",
						help="Filter by weapon type")
	parser.add_argument("--element",
						help="Filter by element")
	parser.add_argument("--sample", action="store_true",
						help="Create sample database")
	parser.add_argument("--output", "-o",
						help="Output file")

	# Edit options
	parser.add_argument("--attack", type=int,
						help="Set attack value")
	parser.add_argument("--price", type=int,
						help="Set buy price")
	parser.add_argument("--description",
						help="Set description")

	args = parser.parse_args()

	if not args.input and not args.sample:
		print("Weapon Editor")
		print()
		print("Usage: python weapon_editor.py <database.json> [options]")
		print()
		print("Options:")
		print("  --view, -v          View all weapons")
		print("  --detail, -d ID     View weapon details")
		print("  --add NAME          Add new weapon")
		print("  --edit, -e ID       Edit weapon")
		print("  --delete ID         Delete weapon")
		print("  --search, -s NAME   Search by name")
		print("  --type, -t TYPE     Filter by type")
		print("  --element ELEM      Filter by element")
		print("  --sample            Create sample database")
		print("  --output, -o FILE   Output file")
		print()
		print("Weapon Types: SWORD, AXE, SPEAR, BOW, STAFF, WAND, DAGGER, HAMMER")
		print("Elements: NONE, FIRE, ICE, LIGHTNING, WIND, EARTH, WATER, LIGHT, DARK")
		return

	# Create sample
	if args.sample:
		db = create_sample_database()
		out_file = args.output or "weapons_sample.json"
		if db.save(out_file):
			print(f"Created sample database: {out_file}")
		return

	# Load database
	db = WeaponDatabase()
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
			for weapon in results:
				print(f"{weapon.id}: {weapon.name} ({weapon.weapon_type.name}, ATK: {weapon.attack})")
		else:
			print("No weapons found")
		return

	# Type filter
	if args.type:
		try:
			wtype = WeaponType[args.type.upper()]
			weapons = db.get_by_type(wtype)
			for weapon in weapons:
				print(f"{weapon.id}: {weapon.name} (ATK: {weapon.attack})")
		except KeyError:
			print(f"Unknown weapon type: {args.type}")
		return

	# Element filter
	if args.element:
		try:
			elem = Element[args.element.upper()]
			weapons = db.get_elemental(elem)
			for weapon in weapons:
				print(f"{weapon.id}: {weapon.name} (ATK: {weapon.attack})")
		except KeyError:
			print(f"Unknown element: {args.element}")
		return

	# Add
	if args.add:
		weapon = Weapon(name=args.add)
		if args.attack:
			weapon.attack = args.attack
		if args.price:
			weapon.buy_price = args.price
			weapon.sell_price = args.price // 2
		if args.description:
			weapon.description = args.description

		wid = db.add(weapon)
		print(f"Added weapon: {weapon.name} (ID: {wid})")

	# Edit
	if args.edit:
		weapon = db.get(args.edit)
		if weapon:
			if args.attack is not None:
				weapon.attack = args.attack
			if args.price is not None:
				weapon.buy_price = args.price
				weapon.sell_price = args.price // 2
			if args.description:
				weapon.description = args.description
			print(f"Updated weapon: {weapon.name}")
		else:
			print(f"Weapon {args.edit} not found")
			return

	# Delete
	if args.delete:
		if db.delete(args.delete):
			print(f"Deleted weapon {args.delete}")
		else:
			print(f"Weapon {args.delete} not found")
			return

	# Save
	out_file = args.output or args.input
	if db.save(out_file):
		print(f"Saved: {out_file}")


if __name__ == "__main__":
	main()
