#!/usr/bin/env python3
"""
Item Database Manager - Manage game item databases with search and analysis.

Provides tools for creating, editing, and analyzing item databases
for RPG games with support for various item properties.

Usage:
	python item_database.py <database.json>
	python item_database.py --create <rom_file>
	python item_database.py --search "sword"

Features:
	- Search and filter items
	- Compare item stats
	- Track item locations
	- Generate item lists
	- Analyze balance
"""

import argparse
import json
import os
import re
import sys
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Set, Tuple


class ItemType(Enum):
	"""Item categories."""
	WEAPON = auto()
	ARMOR = auto()
	HELMET = auto()
	SHIELD = auto()
	ACCESSORY = auto()
	CONSUMABLE = auto()
	KEY_ITEM = auto()
	TOOL = auto()
	MATERIAL = auto()
	OTHER = auto()


class Element(Enum):
	"""Elemental affinities."""
	NONE = auto()
	FIRE = auto()
	ICE = auto()
	THUNDER = auto()
	WIND = auto()
	WATER = auto()
	EARTH = auto()
	LIGHT = auto()
	DARK = auto()


@dataclass
class ItemStats:
	"""Statistical modifiers for equipment."""
	attack: int = 0
	defense: int = 0
	magic_attack: int = 0
	magic_defense: int = 0
	speed: int = 0
	luck: int = 0
	hp_bonus: int = 0
	mp_bonus: int = 0
	hit_rate: int = 0
	evade_rate: int = 0
	crit_rate: int = 0
	
	def to_dict(self) -> Dict[str, int]:
		"""Convert to dictionary, omitting zeros."""
		result = {}
		for field_name in ["attack", "defense", "magic_attack", "magic_defense",
						   "speed", "luck", "hp_bonus", "mp_bonus",
						   "hit_rate", "evade_rate", "crit_rate"]:
			value = getattr(self, field_name)
			if value != 0:
				result[field_name] = value
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, int]) -> "ItemStats":
		"""Create from dictionary."""
		return cls(
			attack=data.get("attack", 0),
			defense=data.get("defense", 0),
			magic_attack=data.get("magic_attack", 0),
			magic_defense=data.get("magic_defense", 0),
			speed=data.get("speed", 0),
			luck=data.get("luck", 0),
			hp_bonus=data.get("hp_bonus", 0),
			mp_bonus=data.get("mp_bonus", 0),
			hit_rate=data.get("hit_rate", 0),
			evade_rate=data.get("evade_rate", 0),
			crit_rate=data.get("crit_rate", 0)
		)


@dataclass
class Item:
	"""A game item."""
	item_id: int
	name: str
	item_type: ItemType
	description: str = ""
	price: int = 0
	sell_price: int = 0
	stats: ItemStats = field(default_factory=ItemStats)
	element: Element = Element.NONE
	status_effects: List[str] = field(default_factory=list)
	status_resist: List[str] = field(default_factory=list)
	usable_by: List[str] = field(default_factory=list)
	locations: List[str] = field(default_factory=list)
	dropped_by: List[str] = field(default_factory=list)
	stolen_from: List[str] = field(default_factory=list)
	notes: str = ""
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"id": self.item_id,
			"name": self.name,
			"type": self.item_type.name,
		}
		
		if self.description:
			result["description"] = self.description
		if self.price:
			result["price"] = self.price
		if self.sell_price:
			result["sell_price"] = self.sell_price
		
		stats_dict = self.stats.to_dict()
		if stats_dict:
			result["stats"] = stats_dict
		
		if self.element != Element.NONE:
			result["element"] = self.element.name
		if self.status_effects:
			result["status_effects"] = self.status_effects
		if self.status_resist:
			result["status_resist"] = self.status_resist
		if self.usable_by:
			result["usable_by"] = self.usable_by
		if self.locations:
			result["locations"] = self.locations
		if self.dropped_by:
			result["dropped_by"] = self.dropped_by
		if self.stolen_from:
			result["stolen_from"] = self.stolen_from
		if self.notes:
			result["notes"] = self.notes
		
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "Item":
		"""Create from dictionary."""
		return cls(
			item_id=data["id"],
			name=data["name"],
			item_type=ItemType[data["type"]],
			description=data.get("description", ""),
			price=data.get("price", 0),
			sell_price=data.get("sell_price", 0),
			stats=ItemStats.from_dict(data.get("stats", {})),
			element=Element[data.get("element", "NONE")],
			status_effects=data.get("status_effects", []),
			status_resist=data.get("status_resist", []),
			usable_by=data.get("usable_by", []),
			locations=data.get("locations", []),
			dropped_by=data.get("dropped_by", []),
			stolen_from=data.get("stolen_from", []),
			notes=data.get("notes", "")
		)


class ItemDatabase:
	"""Database of game items."""
	
	def __init__(self):
		self.items: Dict[int, Item] = {}
		self.metadata: Dict[str, Any] = {}
	
	def add_item(self, item: Item) -> None:
		"""Add item to database."""
		self.items[item.item_id] = item
	
	def get_item(self, item_id: int) -> Optional[Item]:
		"""Get item by ID."""
		return self.items.get(item_id)
	
	def get_by_name(self, name: str) -> Optional[Item]:
		"""Get item by name (case-insensitive)."""
		name_lower = name.lower()
		for item in self.items.values():
			if item.name.lower() == name_lower:
				return item
		return None
	
	def search(self, query: str) -> List[Item]:
		"""Search items by name or description."""
		query_lower = query.lower()
		results = []
		
		for item in self.items.values():
			if query_lower in item.name.lower():
				results.append(item)
			elif query_lower in item.description.lower():
				results.append(item)
		
		return results
	
	def filter_by_type(self, item_type: ItemType) -> List[Item]:
		"""Get all items of a type."""
		return [item for item in self.items.values()
				if item.item_type == item_type]
	
	def filter_by_element(self, element: Element) -> List[Item]:
		"""Get all items with an element."""
		return [item for item in self.items.values()
				if item.element == element]
	
	def filter_by_usable(self, character: str) -> List[Item]:
		"""Get items usable by a character."""
		results = []
		char_lower = character.lower()
		
		for item in self.items.values():
			if not item.usable_by:  # Empty = anyone
				results.append(item)
			elif any(char_lower in u.lower() for u in item.usable_by):
				results.append(item)
		
		return results
	
	def get_strongest(self, item_type: ItemType, stat: str = "attack",
					  count: int = 10) -> List[Item]:
		"""Get strongest items of a type by stat."""
		items = self.filter_by_type(item_type)
		
		def get_stat(item: Item) -> int:
			return getattr(item.stats, stat, 0)
		
		items.sort(key=get_stat, reverse=True)
		return items[:count]
	
	def compare_items(self, item1_id: int, item2_id: int) -> Dict[str, Any]:
		"""Compare two items."""
		item1 = self.get_item(item1_id)
		item2 = self.get_item(item2_id)
		
		if not item1 or not item2:
			return {"error": "Item not found"}
		
		comparison = {
			"item1": item1.name,
			"item2": item2.name,
			"differences": {}
		}
		
		# Compare stats
		for stat_name in ["attack", "defense", "magic_attack", "magic_defense",
						  "speed", "luck", "hp_bonus", "mp_bonus"]:
			val1 = getattr(item1.stats, stat_name, 0)
			val2 = getattr(item2.stats, stat_name, 0)
			
			if val1 != val2:
				diff = val1 - val2
				comparison["differences"][stat_name] = {
					item1.name: val1,
					item2.name: val2,
					"difference": f"{'+' if diff > 0 else ''}{diff}"
				}
		
		# Compare price
		if item1.price != item2.price:
			comparison["differences"]["price"] = {
				item1.name: item1.price,
				item2.name: item2.price
			}
		
		return comparison
	
	def analyze_balance(self) -> Dict[str, Any]:
		"""Analyze item balance."""
		analysis = {
			"type_counts": {},
			"price_ranges": {},
			"stat_ranges": {},
			"issues": []
		}
		
		# Count by type
		for item_type in ItemType:
			items = self.filter_by_type(item_type)
			analysis["type_counts"][item_type.name] = len(items)
		
		# Analyze weapons
		weapons = self.filter_by_type(ItemType.WEAPON)
		if weapons:
			attacks = [w.stats.attack for w in weapons]
			prices = [w.price for w in weapons if w.price > 0]
			
			analysis["stat_ranges"]["weapon_attack"] = {
				"min": min(attacks),
				"max": max(attacks),
				"avg": sum(attacks) / len(attacks)
			}
			
			if prices:
				analysis["price_ranges"]["weapon"] = {
					"min": min(prices),
					"max": max(prices),
					"avg": sum(prices) / len(prices)
				}
		
		# Analyze armor
		armors = self.filter_by_type(ItemType.ARMOR)
		if armors:
			defenses = [a.stats.defense for a in armors]
			
			analysis["stat_ranges"]["armor_defense"] = {
				"min": min(defenses),
				"max": max(defenses),
				"avg": sum(defenses) / len(defenses)
			}
		
		# Find issues
		for item in self.items.values():
			# Items with 0 price but not key items
			if item.price == 0 and item.item_type not in [ItemType.KEY_ITEM, ItemType.OTHER]:
				if item.stats.attack > 0 or item.stats.defense > 0:
					analysis["issues"].append(
						f"{item.name}: Equipment with 0 price"
					)
			
			# Sell price higher than buy price
			if item.sell_price > item.price > 0:
				analysis["issues"].append(
					f"{item.name}: Sell price ({item.sell_price}) > buy price ({item.price})"
				)
		
		return analysis
	
	def load(self, filepath: str) -> None:
		"""Load database from JSON file."""
		with open(filepath, "r", encoding="utf-8") as f:
			data = json.load(f)
		
		self.metadata = data.get("metadata", {})
		
		for item_data in data.get("items", []):
			item = Item.from_dict(item_data)
			self.add_item(item)
	
	def save(self, filepath: str) -> None:
		"""Save database to JSON file."""
		data = {
			"metadata": self.metadata,
			"items": [item.to_dict() for item in self.items.values()]
		}
		
		with open(filepath, "w", encoding="utf-8") as f:
			json.dump(data, f, indent="\t", ensure_ascii=False)
	
	def export_markdown(self, filepath: str) -> None:
		"""Export as Markdown document."""
		with open(filepath, "w", encoding="utf-8") as f:
			f.write("# Item Database\n\n")
			
			for item_type in ItemType:
				items = self.filter_by_type(item_type)
				if not items:
					continue
				
				f.write(f"## {item_type.name.title()}s\n\n")
				
				# Table header
				if item_type in [ItemType.WEAPON, ItemType.ARMOR, ItemType.HELMET, ItemType.SHIELD]:
					f.write("| ID | Name | ATK | DEF | Price | Element |\n")
					f.write("|:---|:-----|----:|----:|------:|:--------|\n")
					
					for item in sorted(items, key=lambda x: x.stats.attack + x.stats.defense, reverse=True):
						elem = item.element.name if item.element != Element.NONE else "-"
						f.write(f"| {item.item_id} | {item.name} | {item.stats.attack} | "
							   f"{item.stats.defense} | {item.price} | {elem} |\n")
				else:
					f.write("| ID | Name | Price | Description |\n")
					f.write("|:---|:-----|------:|:------------|\n")
					
					for item in sorted(items, key=lambda x: x.item_id):
						desc = item.description[:40] + "..." if len(item.description) > 40 else item.description
						f.write(f"| {item.item_id} | {item.name} | {item.price} | {desc} |\n")
				
				f.write("\n")
	
	def export_csv(self, filepath: str) -> None:
		"""Export as CSV file."""
		with open(filepath, "w", encoding="utf-8") as f:
			# Header
			f.write("id,name,type,price,attack,defense,element,description\n")
			
			for item in self.items.values():
				desc = item.description.replace('"', '""')
				elem = item.element.name if item.element != Element.NONE else ""
				f.write(f'{item.item_id},"{item.name}",{item.item_type.name},'
					   f'{item.price},{item.stats.attack},{item.stats.defense},'
					   f'{elem},"{desc}"\n')


def create_example_database() -> ItemDatabase:
	"""Create example database."""
	db = ItemDatabase()
	db.metadata = {"game": "Example RPG", "version": "1.0"}
	
	# Weapons
	db.add_item(Item(
		item_id=1, name="Wooden Sword", item_type=ItemType.WEAPON,
		description="A basic wooden training sword",
		price=10, sell_price=5,
		stats=ItemStats(attack=5),
		usable_by=["Hero", "Warrior"]
	))
	db.add_item(Item(
		item_id=2, name="Iron Sword", item_type=ItemType.WEAPON,
		description="A sturdy iron blade",
		price=100, sell_price=50,
		stats=ItemStats(attack=15),
		usable_by=["Hero", "Warrior"]
	))
	db.add_item(Item(
		item_id=3, name="Fire Blade", item_type=ItemType.WEAPON,
		description="A sword imbued with flames",
		price=500, sell_price=250,
		stats=ItemStats(attack=30, magic_attack=10),
		element=Element.FIRE,
		usable_by=["Hero"]
	))
	
	# Armor
	db.add_item(Item(
		item_id=10, name="Leather Armor", item_type=ItemType.ARMOR,
		price=50, sell_price=25,
		stats=ItemStats(defense=5),
		usable_by=["Hero", "Warrior", "Thief"]
	))
	db.add_item(Item(
		item_id=11, name="Chain Mail", item_type=ItemType.ARMOR,
		price=200, sell_price=100,
		stats=ItemStats(defense=15, speed=-2),
		usable_by=["Hero", "Warrior"]
	))
	
	# Consumables
	db.add_item(Item(
		item_id=50, name="Healing Herb", item_type=ItemType.CONSUMABLE,
		description="Restores 30 HP",
		price=8, sell_price=4,
		locations=["Starting Town Shop", "Wilderness"]
	))
	db.add_item(Item(
		item_id=51, name="Antidote", item_type=ItemType.CONSUMABLE,
		description="Cures poison",
		price=10, sell_price=5,
		status_resist=["Poison"]
	))
	
	# Key items
	db.add_item(Item(
		item_id=100, name="Magic Key", item_type=ItemType.KEY_ITEM,
		description="Opens magically sealed doors",
		locations=["Castle Treasury"]
	))
	
	return db


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Item Database Manager")
	parser.add_argument("database", nargs="?", help="Database JSON file")
	parser.add_argument("--search", "-s", help="Search for items")
	parser.add_argument("--type", "-t", choices=[t.name for t in ItemType],
						help="Filter by type")
	parser.add_argument("--compare", nargs=2, type=int,
						metavar=("ID1", "ID2"),
						help="Compare two items")
	parser.add_argument("--strongest", type=int, metavar="COUNT",
						help="Show strongest weapons")
	parser.add_argument("--analyze", "-a", action="store_true",
						help="Analyze balance")
	parser.add_argument("--export", "-e", help="Export to file")
	parser.add_argument("--create-example", action="store_true",
						help="Create example database")
	
	args = parser.parse_args()
	
	db = ItemDatabase()
	
	if args.create_example:
		db = create_example_database()
		output = args.database or "items.json"
		db.save(output)
		print(f"Created example database: {output}")
		print(f"Items: {len(db.items)}")
		return
	
	if args.database:
		if os.path.exists(args.database):
			db.load(args.database)
			print(f"Loaded: {args.database}")
			print(f"Items: {len(db.items)}")
		else:
			print(f"Database not found: {args.database}")
			print("Use --create-example to create a new database")
			return
	else:
		# Demo mode
		db = create_example_database()
		print("Item Database Manager")
		print()
		print("Usage: python item_database.py <database.json>")
		print()
		print("Demo mode - using example data:")
	
	print()
	
	# Search
	if args.search:
		results = db.search(args.search)
		print(f"Search results for '{args.search}':")
		for item in results:
			print(f"  [{item.item_id}] {item.name} ({item.item_type.name})")
		print()
	
	# Filter by type
	if args.type:
		item_type = ItemType[args.type]
		items = db.filter_by_type(item_type)
		print(f"{item_type.name} items ({len(items)}):")
		for item in items:
			stats = []
			if item.stats.attack:
				stats.append(f"ATK:{item.stats.attack}")
			if item.stats.defense:
				stats.append(f"DEF:{item.stats.defense}")
			stat_str = " ".join(stats) if stats else ""
			print(f"  [{item.item_id}] {item.name} {stat_str}")
		print()
	
	# Compare
	if args.compare:
		comparison = db.compare_items(args.compare[0], args.compare[1])
		if "error" in comparison:
			print(comparison["error"])
		else:
			print(f"Comparing: {comparison['item1']} vs {comparison['item2']}")
			for stat, diff in comparison["differences"].items():
				if "difference" in diff:
					print(f"  {stat}: {diff['difference']}")
				else:
					print(f"  {stat}: {diff}")
		print()
	
	# Strongest
	if args.strongest:
		weapons = db.get_strongest(ItemType.WEAPON, "attack", args.strongest)
		print(f"Top {args.strongest} weapons by attack:")
		for i, item in enumerate(weapons, 1):
			print(f"  {i}. {item.name} (ATK: {item.stats.attack})")
		print()
	
	# Analyze
	if args.analyze:
		analysis = db.analyze_balance()
		
		print("Balance Analysis:")
		print()
		
		print("Item counts by type:")
		for item_type, count in analysis["type_counts"].items():
			if count > 0:
				print(f"  {item_type}: {count}")
		print()
		
		if analysis["stat_ranges"]:
			print("Stat ranges:")
			for stat, ranges in analysis["stat_ranges"].items():
				print(f"  {stat}: {ranges['min']}-{ranges['max']} (avg: {ranges['avg']:.1f})")
		print()
		
		if analysis["issues"]:
			print(f"Issues found ({len(analysis['issues'])}):")
			for issue in analysis["issues"]:
				print(f"  - {issue}")
		else:
			print("No balance issues detected")
		print()
	
	# Export
	if args.export:
		if args.export.endswith(".md"):
			db.export_markdown(args.export)
		elif args.export.endswith(".csv"):
			db.export_csv(args.export)
		else:
			db.save(args.export)
		print(f"Exported to: {args.export}")


if __name__ == "__main__":
	main()
