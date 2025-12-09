#!/usr/bin/env python3
"""
Equipment System Manager - Manage equipment, slots, and stat bonuses.

Tools for defining equipment types, stat modifiers, requirements,
and special properties.

Usage:
	python equipment_system.py <equipment.json>
	python equipment_system.py --list
	python equipment_system.py --compare

Features:
	- Equipment slot management
	- Stat bonus tracking
	- Class/job restrictions
	- Special effect definitions
	- Upgrade paths
"""

import argparse
import json
import os
import sys
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Set, Tuple


class EquipSlot(Enum):
	"""Equipment slots."""
	WEAPON = auto()
	SHIELD = auto()
	HEAD = auto()
	BODY = auto()
	ARMS = auto()
	LEGS = auto()
	FEET = auto()
	ACCESSORY_1 = auto()
	ACCESSORY_2 = auto()
	RELIC = auto()


class WeaponType(Enum):
	"""Weapon categories."""
	SWORD = auto()
	GREATSWORD = auto()
	DAGGER = auto()
	AXE = auto()
	SPEAR = auto()
	BOW = auto()
	STAFF = auto()
	WAND = auto()
	MACE = auto()
	HAMMER = auto()
	WHIP = auto()
	CLAW = auto()
	KATANA = auto()
	FIST = auto()
	THROWN = auto()
	GUN = auto()


class ArmorType(Enum):
	"""Armor categories."""
	CLOTH = auto()
	LIGHT = auto()
	MEDIUM = auto()
	HEAVY = auto()
	ROBE = auto()
	SHIELD = auto()


class ElementType(Enum):
	"""Elemental types."""
	NONE = auto()
	FIRE = auto()
	ICE = auto()
	LIGHTNING = auto()
	EARTH = auto()
	WIND = auto()
	WATER = auto()
	HOLY = auto()
	DARK = auto()
	POISON = auto()


@dataclass
class StatModifier:
	"""Stat modification from equipment."""
	stat_name: str
	flat_bonus: int = 0
	percent_bonus: float = 0.0
	
	def apply(self, base_value: int) -> int:
		"""Apply modifier to base value."""
		modified = base_value + self.flat_bonus
		modified = int(modified * (1.0 + self.percent_bonus / 100.0))
		return modified
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {"stat": self.stat_name}
		if self.flat_bonus:
			result["flat"] = self.flat_bonus
		if self.percent_bonus:
			result["percent"] = self.percent_bonus
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "StatModifier":
		"""Create from dictionary."""
		return cls(
			stat_name=data["stat"],
			flat_bonus=data.get("flat", 0),
			percent_bonus=data.get("percent", 0.0)
		)


@dataclass
class SpecialEffect:
	"""Special equipment effect."""
	effect_id: str
	name: str
	description: str = ""
	trigger: str = "always"  # always, on_hit, on_damage, etc.
	chance: int = 100  # Percentage
	value: int = 0
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"id": self.effect_id,
			"name": self.name
		}
		if self.description:
			result["description"] = self.description
		if self.trigger != "always":
			result["trigger"] = self.trigger
		if self.chance < 100:
			result["chance"] = self.chance
		if self.value:
			result["value"] = self.value
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "SpecialEffect":
		"""Create from dictionary."""
		return cls(
			effect_id=data["id"],
			name=data["name"],
			description=data.get("description", ""),
			trigger=data.get("trigger", "always"),
			chance=data.get("chance", 100),
			value=data.get("value", 0)
		)


@dataclass
class Equipment:
	"""A piece of equipment."""
	equip_id: str
	name: str
	slot: EquipSlot
	description: str = ""
	
	# Combat stats
	attack: int = 0
	defense: int = 0
	magic_attack: int = 0
	magic_defense: int = 0
	accuracy: int = 0
	evasion: int = 0
	speed: int = 0
	critical: int = 0
	
	# Type info
	weapon_type: Optional[WeaponType] = None
	armor_type: Optional[ArmorType] = None
	
	# Elemental
	element: ElementType = ElementType.NONE
	element_resist: Dict[ElementType, int] = field(default_factory=dict)
	
	# Requirements
	required_level: int = 0
	required_classes: List[str] = field(default_factory=list)
	required_stats: Dict[str, int] = field(default_factory=dict)
	
	# Additional modifiers
	stat_modifiers: List[StatModifier] = field(default_factory=list)
	special_effects: List[SpecialEffect] = field(default_factory=list)
	
	# Meta
	price: int = 0
	sell_price: int = 0
	rarity: int = 1  # 1-5
	two_handed: bool = False
	cursed: bool = False
	unique: bool = False
	
	def get_total_stat_bonus(self, stat: str, base_value: int = 0) -> int:
		"""Get total bonus for a stat."""
		total = 0
		
		# Direct stats
		direct_stats = {
			"attack": self.attack,
			"defense": self.defense,
			"magic_attack": self.magic_attack,
			"magic_defense": self.magic_defense,
			"accuracy": self.accuracy,
			"evasion": self.evasion,
			"speed": self.speed,
			"critical": self.critical
		}
		
		if stat in direct_stats:
			total += direct_stats[stat]
		
		# Modifiers
		for mod in self.stat_modifiers:
			if mod.stat_name == stat:
				total += mod.flat_bonus
				if base_value > 0:
					total += int(base_value * mod.percent_bonus / 100)
		
		return total
	
	def can_equip(self, level: int, character_class: str,
				  stats: Dict[str, int]) -> Tuple[bool, str]:
		"""Check if character can equip. Returns (can_equip, reason)."""
		if level < self.required_level:
			return False, f"Requires level {self.required_level}"
		
		if self.required_classes and character_class not in self.required_classes:
			return False, f"Cannot be equipped by {character_class}"
		
		for stat, req in self.required_stats.items():
			if stats.get(stat, 0) < req:
				return False, f"Requires {stat} {req}"
		
		return True, ""
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"id": self.equip_id,
			"name": self.name,
			"slot": self.slot.name
		}
		
		if self.description:
			result["description"] = self.description
		
		# Combat stats
		if self.attack:
			result["attack"] = self.attack
		if self.defense:
			result["defense"] = self.defense
		if self.magic_attack:
			result["magic_attack"] = self.magic_attack
		if self.magic_defense:
			result["magic_defense"] = self.magic_defense
		if self.accuracy:
			result["accuracy"] = self.accuracy
		if self.evasion:
			result["evasion"] = self.evasion
		if self.speed:
			result["speed"] = self.speed
		if self.critical:
			result["critical"] = self.critical
		
		# Types
		if self.weapon_type:
			result["weapon_type"] = self.weapon_type.name
		if self.armor_type:
			result["armor_type"] = self.armor_type.name
		
		# Elements
		if self.element != ElementType.NONE:
			result["element"] = self.element.name
		if self.element_resist:
			result["element_resist"] = {e.name: v for e, v in self.element_resist.items()}
		
		# Requirements
		if self.required_level:
			result["req_level"] = self.required_level
		if self.required_classes:
			result["req_classes"] = self.required_classes
		if self.required_stats:
			result["req_stats"] = self.required_stats
		
		# Additional
		if self.stat_modifiers:
			result["modifiers"] = [m.to_dict() for m in self.stat_modifiers]
		if self.special_effects:
			result["effects"] = [e.to_dict() for e in self.special_effects]
		
		# Meta
		if self.price:
			result["price"] = self.price
		if self.sell_price:
			result["sell"] = self.sell_price
		if self.rarity > 1:
			result["rarity"] = self.rarity
		if self.two_handed:
			result["two_handed"] = True
		if self.cursed:
			result["cursed"] = True
		if self.unique:
			result["unique"] = True
		
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "Equipment":
		"""Create from dictionary."""
		# Parse element resist
		element_resist = {}
		for elem_name, value in data.get("element_resist", {}).items():
			element_resist[ElementType[elem_name]] = value
		
		# Parse modifiers
		modifiers = [StatModifier.from_dict(m) for m in data.get("modifiers", [])]
		
		# Parse effects
		effects = [SpecialEffect.from_dict(e) for e in data.get("effects", [])]
		
		return cls(
			equip_id=data["id"],
			name=data["name"],
			slot=EquipSlot[data["slot"]],
			description=data.get("description", ""),
			attack=data.get("attack", 0),
			defense=data.get("defense", 0),
			magic_attack=data.get("magic_attack", 0),
			magic_defense=data.get("magic_defense", 0),
			accuracy=data.get("accuracy", 0),
			evasion=data.get("evasion", 0),
			speed=data.get("speed", 0),
			critical=data.get("critical", 0),
			weapon_type=WeaponType[data["weapon_type"]] if "weapon_type" in data else None,
			armor_type=ArmorType[data["armor_type"]] if "armor_type" in data else None,
			element=ElementType[data["element"]] if "element" in data else ElementType.NONE,
			element_resist=element_resist,
			required_level=data.get("req_level", 0),
			required_classes=data.get("req_classes", []),
			required_stats=data.get("req_stats", {}),
			stat_modifiers=modifiers,
			special_effects=effects,
			price=data.get("price", 0),
			sell_price=data.get("sell", 0),
			rarity=data.get("rarity", 1),
			two_handed=data.get("two_handed", False),
			cursed=data.get("cursed", False),
			unique=data.get("unique", False)
		)


class EquipmentManager:
	"""Manage equipment database."""
	
	def __init__(self):
		self.equipment: Dict[str, Equipment] = {}
		self.metadata: Dict[str, Any] = {}
	
	def add(self, equip: Equipment) -> None:
		"""Add equipment."""
		self.equipment[equip.equip_id] = equip
	
	def get(self, equip_id: str) -> Optional[Equipment]:
		"""Get equipment by ID."""
		return self.equipment.get(equip_id)
	
	def get_by_slot(self, slot: EquipSlot) -> List[Equipment]:
		"""Get all equipment for a slot."""
		return [e for e in self.equipment.values() if e.slot == slot]
	
	def get_by_type(self, weapon_type: Optional[WeaponType] = None,
					armor_type: Optional[ArmorType] = None) -> List[Equipment]:
		"""Get equipment by type."""
		result = []
		for equip in self.equipment.values():
			if weapon_type and equip.weapon_type == weapon_type:
				result.append(equip)
			if armor_type and equip.armor_type == armor_type:
				result.append(equip)
		return result
	
	def get_equipable(self, level: int, character_class: str,
					  stats: Dict[str, int]) -> List[Equipment]:
		"""Get equipment a character can use."""
		return [e for e in self.equipment.values()
				if e.can_equip(level, character_class, stats)[0]]
	
	def compare(self, equip1_id: str, equip2_id: str) -> Dict[str, Tuple[int, int]]:
		"""Compare two pieces of equipment."""
		e1 = self.get(equip1_id)
		e2 = self.get(equip2_id)
		
		if not e1 or not e2:
			return {}
		
		comparison = {}
		stats = ["attack", "defense", "magic_attack", "magic_defense",
				 "accuracy", "evasion", "speed", "critical"]
		
		for stat in stats:
			v1 = e1.get_total_stat_bonus(stat)
			v2 = e2.get_total_stat_bonus(stat)
			if v1 != 0 or v2 != 0:
				comparison[stat] = (v1, v2)
		
		return comparison
	
	def find_best(self, slot: EquipSlot, stat: str,
				  level: int = 99, character_class: str = "",
				  stats: Dict[str, int] = None) -> List[Equipment]:
		"""Find best equipment for a slot/stat."""
		stats = stats or {}
		candidates = self.get_by_slot(slot)
		
		# Filter by equipability if class specified
		if character_class:
			candidates = [e for e in candidates
						 if e.can_equip(level, character_class, stats)[0]]
		
		# Sort by stat
		candidates.sort(key=lambda e: e.get_total_stat_bonus(stat), reverse=True)
		return candidates
	
	def load(self, filepath: str) -> None:
		"""Load from JSON."""
		with open(filepath, "r", encoding="utf-8") as f:
			data = json.load(f)
		
		self.metadata = data.get("metadata", {})
		
		for equip_data in data.get("equipment", []):
			equip = Equipment.from_dict(equip_data)
			self.add(equip)
	
	def save(self, filepath: str) -> None:
		"""Save to JSON."""
		data = {
			"metadata": self.metadata,
			"equipment": [e.to_dict() for e in self.equipment.values()]
		}
		
		with open(filepath, "w", encoding="utf-8") as f:
			json.dump(data, f, indent="\t", ensure_ascii=False)


def create_example_equipment() -> EquipmentManager:
	"""Create example equipment database."""
	manager = EquipmentManager()
	manager.metadata = {"game": "Example RPG", "version": "1.0"}
	
	# Weapons
	manager.add(Equipment(
		equip_id="sword-01",
		name="Iron Sword",
		slot=EquipSlot.WEAPON,
		description="A standard iron sword.",
		attack=15,
		weapon_type=WeaponType.SWORD,
		price=100
	))
	
	manager.add(Equipment(
		equip_id="sword-02",
		name="Steel Sword",
		slot=EquipSlot.WEAPON,
		description="A well-crafted steel sword.",
		attack=28,
		accuracy=5,
		weapon_type=WeaponType.SWORD,
		required_level=10,
		price=500
	))
	
	manager.add(Equipment(
		equip_id="sword-03",
		name="Flame Sword",
		slot=EquipSlot.WEAPON,
		description="A sword imbued with fire magic.",
		attack=42,
		magic_attack=15,
		weapon_type=WeaponType.SWORD,
		element=ElementType.FIRE,
		required_level=20,
		price=2500,
		rarity=3
	))
	
	manager.add(Equipment(
		equip_id="staff-01",
		name="Oak Staff",
		slot=EquipSlot.WEAPON,
		description="A basic magical staff.",
		attack=5,
		magic_attack=20,
		weapon_type=WeaponType.STAFF,
		required_classes=["Mage", "Healer"],
		price=150
	))
	
	# Shields
	manager.add(Equipment(
		equip_id="shield-01",
		name="Wooden Shield",
		slot=EquipSlot.SHIELD,
		description="A simple wooden shield.",
		defense=5,
		armor_type=ArmorType.SHIELD,
		price=50
	))
	
	manager.add(Equipment(
		equip_id="shield-02",
		name="Iron Shield",
		slot=EquipSlot.SHIELD,
		description="A sturdy iron shield.",
		defense=12,
		armor_type=ArmorType.SHIELD,
		required_level=8,
		price=300
	))
	
	# Armor
	manager.add(Equipment(
		equip_id="armor-01",
		name="Leather Armor",
		slot=EquipSlot.BODY,
		description="Basic leather protection.",
		defense=10,
		armor_type=ArmorType.LIGHT,
		price=80
	))
	
	manager.add(Equipment(
		equip_id="armor-02",
		name="Chain Mail",
		slot=EquipSlot.BODY,
		description="Interlocking metal rings.",
		defense=25,
		armor_type=ArmorType.MEDIUM,
		speed=-2,
		required_level=12,
		required_classes=["Warrior", "Knight"],
		price=800
	))
	
	manager.add(Equipment(
		equip_id="robe-01",
		name="Wizard's Robe",
		slot=EquipSlot.BODY,
		description="A robe enchanted to boost magic.",
		defense=8,
		magic_defense=20,
		armor_type=ArmorType.ROBE,
		stat_modifiers=[
			StatModifier("mp", 20),
			StatModifier("intelligence", percent_bonus=10)
		],
		required_classes=["Mage", "Healer"],
		price=600
	))
	
	# Helmets
	manager.add(Equipment(
		equip_id="helm-01",
		name="Iron Helm",
		slot=EquipSlot.HEAD,
		description="A protective iron helmet.",
		defense=8,
		armor_type=ArmorType.HEAVY,
		required_level=5,
		price=200
	))
	
	# Accessories
	manager.add(Equipment(
		equip_id="ring-01",
		name="Ring of Strength",
		slot=EquipSlot.ACCESSORY_1,
		description="Increases physical power.",
		stat_modifiers=[StatModifier("strength", 5)],
		price=1000,
		rarity=2
	))
	
	manager.add(Equipment(
		equip_id="ring-02",
		name="Ring of Fire Resist",
		slot=EquipSlot.ACCESSORY_1,
		description="Protects against fire.",
		element_resist={ElementType.FIRE: 50},
		price=1500,
		rarity=2
	))
	
	# Unique/Cursed
	manager.add(Equipment(
		equip_id="sword-cursed",
		name="Demon Blade",
		slot=EquipSlot.WEAPON,
		description="A blade with dark power. Cursed.",
		attack=65,
		critical=15,
		weapon_type=WeaponType.SWORD,
		element=ElementType.DARK,
		cursed=True,
		unique=True,
		special_effects=[
			SpecialEffect("drain-hp", "Life Drain",
						  description="Drains HP on hit",
						  trigger="on_hit", chance=25, value=10)
		],
		rarity=5,
		price=0  # Can't be bought
	))
	
	return manager


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Equipment System Manager")
	parser.add_argument("equipfile", nargs="?", help="Equipment JSON file")
	parser.add_argument("--list", "-l", action="store_true",
						help="List all equipment")
	parser.add_argument("--slot", "-s", choices=[s.name for s in EquipSlot],
						help="Filter by slot")
	parser.add_argument("--compare", "-c", nargs=2, metavar=("ID1", "ID2"),
						help="Compare two items")
	parser.add_argument("--best", "-b", help="Find best equipment for stat")
	parser.add_argument("--create-example", action="store_true",
						help="Create example database")
	parser.add_argument("--export", "-e", help="Export to file")
	
	args = parser.parse_args()
	
	manager = EquipmentManager()
	
	if args.create_example:
		manager = create_example_equipment()
		output = args.equipfile or "equipment.json"
		manager.save(output)
		print(f"Created example database: {output}")
		print(f"Equipment: {len(manager.equipment)}")
		return
	
	if args.equipfile and os.path.exists(args.equipfile):
		manager.load(args.equipfile)
		print(f"Loaded: {args.equipfile}")
	else:
		manager = create_example_equipment()
		print("Equipment System Manager - Demo Mode")
		print()
	
	# List equipment
	if args.list:
		print("\nAll Equipment:")
		for equip in manager.equipment.values():
			slot = equip.slot.name
			stats = []
			if equip.attack:
				stats.append(f"ATK {equip.attack}")
			if equip.defense:
				stats.append(f"DEF {equip.defense}")
			if equip.magic_attack:
				stats.append(f"MAG {equip.magic_attack}")
			stat_str = ", ".join(stats) if stats else "-"
			print(f"  [{equip.equip_id}] {equip.name} ({slot}): {stat_str}")
		print()
	
	# Filter by slot
	if args.slot:
		slot = EquipSlot[args.slot]
		items = manager.get_by_slot(slot)
		print(f"\n{args.slot} Equipment ({len(items)}):")
		for equip in items:
			print(f"  {equip.name}")
			print(f"    ATK: {equip.attack}  DEF: {equip.defense}  "
				  f"MAG: {equip.magic_attack}  MDEF: {equip.magic_defense}")
		print()
	
	# Compare
	if args.compare:
		id1, id2 = args.compare
		comparison = manager.compare(id1, id2)
		e1 = manager.get(id1)
		e2 = manager.get(id2)
		
		if e1 and e2:
			print(f"\nComparing: {e1.name} vs {e2.name}")
			print("-" * 40)
			for stat, (v1, v2) in comparison.items():
				diff = v2 - v1
				diff_str = f"+{diff}" if diff > 0 else str(diff)
				print(f"  {stat:15} {v1:5} vs {v2:5}  ({diff_str})")
		else:
			print("Equipment not found")
		print()
	
	# Find best
	if args.best:
		for slot in EquipSlot:
			best = manager.find_best(slot, args.best)
			if best:
				top = best[0]
				value = top.get_total_stat_bonus(args.best)
				if value > 0:
					print(f"  {slot.name:12} {top.name} ({args.best}: {value})")
		print()
	
	# Export
	if args.export:
		manager.save(args.export)
		print(f"Exported to: {args.export}")


if __name__ == "__main__":
	main()
