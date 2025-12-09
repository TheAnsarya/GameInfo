#!/usr/bin/env python3
"""
Shop/Store Editor - Manage game shop inventories and prices.

Tools for editing shop data including inventory, prices,
availability conditions, and shop progression.

Usage:
	python shop_editor.py <shops.json>
	python shop_editor.py --compare
	python shop_editor.py --analyze

Features:
	- Edit shop inventories
	- Manage pricing
	- Track availability
	- Compare shops
	- Analyze economy
"""

import argparse
import json
import os
import sys
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Set, Tuple


class ShopType(Enum):
	"""Types of shops."""
	WEAPON = auto()
	ARMOR = auto()
	ITEM = auto()
	MAGIC = auto()
	INN = auto()
	MIXED = auto()
	SPECIAL = auto()


@dataclass
class ShopItem:
	"""An item sold in a shop."""
	item_id: int
	item_name: str
	price: int
	stock: int = -1  # -1 = unlimited
	conditions: List[str] = field(default_factory=list)
	available_after: str = ""  # Event/quest flag
	hidden: bool = False

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"id": self.item_id,
			"name": self.item_name,
			"price": self.price
		}

		if self.stock >= 0:
			result["stock"] = self.stock
		if self.conditions:
			result["conditions"] = self.conditions
		if self.available_after:
			result["available_after"] = self.available_after
		if self.hidden:
			result["hidden"] = True

		return result

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "ShopItem":
		"""Create from dictionary."""
		return cls(
			item_id=data["id"],
			item_name=data["name"],
			price=data["price"],
			stock=data.get("stock", -1),
			conditions=data.get("conditions", []),
			available_after=data.get("available_after", ""),
			hidden=data.get("hidden", False)
		)


@dataclass
class Shop:
	"""A game shop."""
	shop_id: int
	name: str
	shop_type: ShopType = ShopType.MIXED
	location: str = ""
	keeper_name: str = ""
	inventory: List[ShopItem] = field(default_factory=list)
	buy_rate: float = 1.0  # Price multiplier
	sell_rate: float = 0.5  # Sell price multiplier
	notes: str = ""

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"id": self.shop_id,
			"name": self.name,
			"type": self.shop_type.name
		}

		if self.location:
			result["location"] = self.location
		if self.keeper_name:
			result["keeper"] = self.keeper_name

		result["inventory"] = [item.to_dict() for item in self.inventory]

		if self.buy_rate != 1.0:
			result["buy_rate"] = self.buy_rate
		if self.sell_rate != 0.5:
			result["sell_rate"] = self.sell_rate
		if self.notes:
			result["notes"] = self.notes

		return result

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "Shop":
		"""Create from dictionary."""
		inventory = [ShopItem.from_dict(i) for i in data.get("inventory", [])]

		return cls(
			shop_id=data["id"],
			name=data["name"],
			shop_type=ShopType[data.get("type", "MIXED")],
			location=data.get("location", ""),
			keeper_name=data.get("keeper", ""),
			inventory=inventory,
			buy_rate=data.get("buy_rate", 1.0),
			sell_rate=data.get("sell_rate", 0.5),
			notes=data.get("notes", "")
		)

	def get_item_count(self) -> int:
		"""Get number of items in inventory."""
		return len(self.inventory)

	def get_total_value(self) -> int:
		"""Get total value of all inventory."""
		return sum(item.price for item in self.inventory)

	def get_price_range(self) -> Tuple[int, int]:
		"""Get price range of inventory."""
		if not self.inventory:
			return (0, 0)
		prices = [item.price for item in self.inventory]
		return (min(prices), max(prices))


class ShopManager:
	"""Manage game shops."""

	def __init__(self):
		self.shops: Dict[int, Shop] = {}
		self.item_prices: Dict[int, List[Tuple[int, int]]] = {}  # item_id -> [(shop_id, price)]
		self.metadata: Dict[str, Any] = {}

	def add_shop(self, shop: Shop) -> None:
		"""Add shop to manager."""
		self.shops[shop.shop_id] = shop

		# Index item prices
		for item in shop.inventory:
			if item.item_id not in self.item_prices:
				self.item_prices[item.item_id] = []
			self.item_prices[item.item_id].append((shop.shop_id, item.price))

	def get_shop(self, shop_id: int) -> Optional[Shop]:
		"""Get shop by ID."""
		return self.shops.get(shop_id)

	def get_by_name(self, name: str) -> Optional[Shop]:
		"""Get shop by name."""
		name_lower = name.lower()
		for shop in self.shops.values():
			if name_lower in shop.name.lower():
				return shop
		return None

	def get_by_location(self, location: str) -> List[Shop]:
		"""Get shops in a location."""
		location_lower = location.lower()
		return [shop for shop in self.shops.values()
				if location_lower in shop.location.lower()]

	def get_by_type(self, shop_type: ShopType) -> List[Shop]:
		"""Get shops of a type."""
		return [shop for shop in self.shops.values()
				if shop.shop_type == shop_type]

	def find_item(self, item_name: str) -> List[Tuple[Shop, ShopItem]]:
		"""Find which shops sell an item."""
		name_lower = item_name.lower()
		results = []

		for shop in self.shops.values():
			for item in shop.inventory:
				if name_lower in item.item_name.lower():
					results.append((shop, item))

		return results

	def compare_prices(self, item_id: int) -> Dict[str, Any]:
		"""Compare prices for an item across shops."""
		if item_id not in self.item_prices:
			return {"error": "Item not found"}

		prices = self.item_prices[item_id]

		result = {
			"item_id": item_id,
			"shops": []
		}

		for shop_id, price in sorted(prices, key=lambda x: x[1]):
			shop = self.shops[shop_id]
			result["shops"].append({
				"shop": shop.name,
				"location": shop.location,
				"price": price
			})

		if len(prices) > 1:
			min_price = min(p for _, p in prices)
			max_price = max(p for _, p in prices)
			result["price_range"] = f"{min_price} - {max_price}"
			result["best_deal"] = self.shops[prices[0][0]].name

		return result

	def analyze_economy(self) -> Dict[str, Any]:
		"""Analyze game economy through shops."""
		analysis = {
			"shop_count": len(self.shops),
			"total_unique_items": len(self.item_prices),
			"type_distribution": {},
			"price_analysis": {},
			"progression": []
		}

		# Shop type distribution
		for shop_type in ShopType:
			shops = self.get_by_type(shop_type)
			if shops:
				analysis["type_distribution"][shop_type.name] = len(shops)

		# Price analysis
		all_prices = []
		for shop in self.shops.values():
			for item in shop.inventory:
				all_prices.append(item.price)

		if all_prices:
			analysis["price_analysis"] = {
				"min": min(all_prices),
				"max": max(all_prices),
				"avg": sum(all_prices) / len(all_prices),
				"median": sorted(all_prices)[len(all_prices) // 2]
			}

		# Shop progression by average price
		shop_avgs = []
		for shop in self.shops.values():
			if shop.inventory:
				avg_price = sum(i.price for i in shop.inventory) / len(shop.inventory)
				shop_avgs.append((shop, avg_price))

		shop_avgs.sort(key=lambda x: x[1])

		for shop, avg in shop_avgs[:10]:
			analysis["progression"].append({
				"shop": shop.name,
				"location": shop.location,
				"avg_price": round(avg)
			})

		return analysis

	def find_duplicates(self) -> List[Dict[str, Any]]:
		"""Find items sold at multiple shops with different prices."""
		duplicates = []

		for item_id, prices in self.item_prices.items():
			if len(prices) > 1:
				unique_prices = set(p for _, p in prices)
				if len(unique_prices) > 1:
					# Get item name from first shop
					shop = self.shops[prices[0][0]]
					item_name = next(
						i.item_name for i in shop.inventory
						if i.item_id == item_id
					)

					duplicates.append({
						"item": item_name,
						"item_id": item_id,
						"prices": [
							{
								"shop": self.shops[shop_id].name,
								"price": price
							}
							for shop_id, price in prices
						]
					})

		return duplicates

	def load(self, filepath: str) -> None:
		"""Load from JSON file."""
		with open(filepath, "r", encoding="utf-8") as f:
			data = json.load(f)

		self.metadata = data.get("metadata", {})

		for shop_data in data.get("shops", []):
			shop = Shop.from_dict(shop_data)
			self.add_shop(shop)

	def save(self, filepath: str) -> None:
		"""Save to JSON file."""
		data = {
			"metadata": self.metadata,
			"shops": [shop.to_dict() for shop in self.shops.values()]
		}

		with open(filepath, "w", encoding="utf-8") as f:
			json.dump(data, f, indent="\t", ensure_ascii=False)

	def export_markdown(self, filepath: str) -> None:
		"""Export as Markdown document."""
		with open(filepath, "w", encoding="utf-8") as f:
			f.write("# Shop Guide\n\n")

			# Group by location
			locations: Dict[str, List[Shop]] = {}
			for shop in self.shops.values():
				loc = shop.location or "Unknown"
				if loc not in locations:
					locations[loc] = []
				locations[loc].append(shop)

			for location, shops in sorted(locations.items()):
				f.write(f"## {location}\n\n")

				for shop in sorted(shops, key=lambda x: x.name):
					f.write(f"### {shop.name}\n\n")

					if shop.keeper_name:
						f.write(f"*Shopkeeper: {shop.keeper_name}*\n\n")

					f.write("| Item | Price |\n")
					f.write("|:-----|------:|\n")

					for item in sorted(shop.inventory, key=lambda x: x.price):
						stock = f" (x{item.stock})" if item.stock >= 0 else ""
						f.write(f"| {item.item_name}{stock} | {item.price:,} G |\n")

					f.write("\n")


def create_example_database() -> ShopManager:
	"""Create example shop database."""
	manager = ShopManager()
	manager.metadata = {"game": "Example RPG", "version": "1.0"}

	# Starting town weapon shop
	weapon_shop = Shop(
		shop_id=1,
		name="Blade & Shield",
		shop_type=ShopType.WEAPON,
		location="Starting Town",
		keeper_name="Marcus"
	)
	weapon_shop.inventory = [
		ShopItem(1, "Wooden Sword", 10),
		ShopItem(2, "Iron Sword", 100),
		ShopItem(10, "Leather Shield", 50),
		ShopItem(11, "Iron Shield", 200)
	]
	manager.add_shop(weapon_shop)

	# Starting town armor shop
	armor_shop = Shop(
		shop_id=2,
		name="Armor Emporium",
		shop_type=ShopType.ARMOR,
		location="Starting Town",
		keeper_name="Helena"
	)
	armor_shop.inventory = [
		ShopItem(20, "Cloth Armor", 30),
		ShopItem(21, "Leather Armor", 80),
		ShopItem(30, "Cloth Helmet", 20),
		ShopItem(31, "Leather Cap", 50)
	]
	manager.add_shop(armor_shop)

	# Item shop
	item_shop = Shop(
		shop_id=3,
		name="General Store",
		shop_type=ShopType.ITEM,
		location="Starting Town",
		keeper_name="Bob"
	)
	item_shop.inventory = [
		ShopItem(100, "Healing Herb", 8),
		ShopItem(101, "Antidote", 10),
		ShopItem(102, "Torch", 5),
		ShopItem(103, "Rope", 15)
	]
	manager.add_shop(item_shop)

	# Mid-game town
	mid_weapon = Shop(
		shop_id=10,
		name="Steel Works",
		shop_type=ShopType.WEAPON,
		location="Port City"
	)
	mid_weapon.inventory = [
		ShopItem(2, "Iron Sword", 100),
		ShopItem(3, "Steel Sword", 500),
		ShopItem(4, "Silver Sword", 1200),
		ShopItem(11, "Iron Shield", 200),
		ShopItem(12, "Steel Shield", 600)
	]
	manager.add_shop(mid_weapon)

	# Magic shop
	magic_shop = Shop(
		shop_id=20,
		name="Mystic Scrolls",
		shop_type=ShopType.MAGIC,
		location="Port City"
	)
	magic_shop.inventory = [
		ShopItem(200, "Fire Scroll", 150),
		ShopItem(201, "Ice Scroll", 150),
		ShopItem(202, "Thunder Scroll", 200),
		ShopItem(210, "Magic Potion", 50)
	]
	manager.add_shop(magic_shop)

	# Inn
	inn = Shop(
		shop_id=30,
		name="Cozy Inn",
		shop_type=ShopType.INN,
		location="Starting Town",
		keeper_name="Innkeeper"
	)
	inn.inventory = [
		ShopItem(300, "Rest (Single)", 10),
		ShopItem(301, "Rest (Party)", 30)
	]
	manager.add_shop(inn)

	return manager


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Shop Editor")
	parser.add_argument("database", nargs="?", help="Shop JSON file")
	parser.add_argument("--shop", "-s", help="Show shop details")
	parser.add_argument("--location", "-l", help="List shops in location")
	parser.add_argument("--find", "-f", help="Find shops selling item")
	parser.add_argument("--compare", "-c", action="store_true",
						help="Find price differences")
	parser.add_argument("--analyze", "-a", action="store_true",
						help="Analyze economy")
	parser.add_argument("--export", "-e", help="Export to file")
	parser.add_argument("--create-example", action="store_true",
						help="Create example database")

	args = parser.parse_args()

	manager = ShopManager()

	if args.create_example:
		manager = create_example_database()
		output = args.database or "shops.json"
		manager.save(output)
		print(f"Created example database: {output}")
		print(f"Shops: {len(manager.shops)}")
		return

	if args.database:
		if os.path.exists(args.database):
			manager.load(args.database)
			print(f"Loaded: {args.database}")
			print(f"Shops: {len(manager.shops)}")
		else:
			print(f"Database not found: {args.database}")
			print("Use --create-example to create a new database")
			return
	else:
		# Demo mode
		manager = create_example_database()
		print("Shop Editor")
		print()
		print("Usage: python shop_editor.py <shops.json>")
		print()
		print("Demo mode - using example data:")

	print()

	# Show shop
	if args.shop:
		shop = manager.get_by_name(args.shop)
		if shop:
			print(f"Shop: {shop.name} ({shop.shop_type.name})")
			print(f"Location: {shop.location}")
			if shop.keeper_name:
				print(f"Keeper: {shop.keeper_name}")
			print()
			print("Inventory:")
			for item in shop.inventory:
				stock = f" (x{item.stock})" if item.stock >= 0 else ""
				print(f"  {item.item_name}{stock}: {item.price:,} G")
		else:
			print(f"Shop not found: {args.shop}")
		print()

	# List by location
	if args.location:
		shops = manager.get_by_location(args.location)
		print(f"Shops in '{args.location}' ({len(shops)}):")
		for shop in shops:
			print(f"  [{shop.shop_id}] {shop.name} ({shop.shop_type.name})")
		print()

	# Find item
	if args.find:
		results = manager.find_item(args.find)
		print(f"'{args.find}' sold at ({len(results)}):")
		for shop, item in sorted(results, key=lambda x: x[1].price):
			print(f"  {shop.name} ({shop.location}): {item.price:,} G")
		print()

	# Compare prices
	if args.compare:
		duplicates = manager.find_duplicates()
		if duplicates:
			print(f"Items with varying prices ({len(duplicates)}):")
			for dup in duplicates:
				print(f"\n  {dup['item']}:")
				for price_info in dup["prices"]:
					print(f"    {price_info['shop']}: {price_info['price']:,} G")
		else:
			print("No price differences found")
		print()

	# Analyze
	if args.analyze:
		analysis = manager.analyze_economy()

		print("Economy Analysis:")
		print()

		print(f"Total shops: {analysis['shop_count']}")
		print(f"Unique items: {analysis['total_unique_items']}")
		print()

		print("Shop types:")
		for stype, count in analysis.get("type_distribution", {}).items():
			print(f"  {stype}: {count}")
		print()

		if analysis.get("price_analysis"):
			pa = analysis["price_analysis"]
			print(f"Price range: {pa['min']:,} - {pa['max']:,} G")
			print(f"Average price: {pa['avg']:,.0f} G")
			print(f"Median price: {pa['median']:,} G")
		print()

		if analysis.get("progression"):
			print("Shop progression (by avg price):")
			for shop_info in analysis["progression"]:
				print(f"  {shop_info['shop']} ({shop_info['location']}): "
					  f"{shop_info['avg_price']:,} G avg")
		print()

	# Export
	if args.export:
		if args.export.endswith(".md"):
			manager.export_markdown(args.export)
		else:
			manager.save(args.export)
		print(f"Exported to: {args.export}")


if __name__ == "__main__":
	main()
