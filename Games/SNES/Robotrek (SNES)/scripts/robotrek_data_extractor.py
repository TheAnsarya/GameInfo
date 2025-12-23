#!/usr/bin/env python3
"""
Robotrek Data Extractor - Verified Addresses

Extracts game data from Robotrek (US) ROM using verified addresses.
Outputs JSON and wikitext format for documentation.

Usage:
	python robotrek_data_extractor.py <rom_path> [--output <dir>]
"""

import argparse
import json
from pathlib import Path


# Verified ROM data locations
ROM_INFO = {
	"title": "ROBOTREK 1 USA",
	"crc32": "7ad4aadc",
	"sha1": "e315830e71cc6da91234813f70835d26802c0ea1",
	"size": 1572864,
	"mapper": "HiROM",
}

# Verified data addresses (file offsets, no header)
DATA_ADDRESSES = {
	# Item name list (CC-separated strings)
	"item_names_script": 0x01E413,  # CC-separated for dialog
	"item_names_menu": 0x01F8A0,    # Null-separated, 8-byte aligned for menus

	# Enemy name pointer table and strings
	"enemy_name_pointers": 0x01FD00,  # Pointer table (2 bytes each)
	"enemy_names_start": 0x01FDBE,    # First enemy name "Mine"

	# Invention/Recipe names (part of item list)
	# Inventions use same item names

	# Text encoding uses standard ASCII with some control codes
}


def extract_item_names(rom: bytes) -> list:
	"""Extract item names from ROM."""
	items = []

	# Extract from CC-separated list at 0x01E413
	start = DATA_ADDRESSES["item_names_script"]
	data = rom[start:start + 0x1000]

	# Split by 0xCC separator
	raw_items = data.split(bytes([0xCC]))

	for i, item in enumerate(raw_items):
		try:
			name = item.decode('ascii').strip()
			if name and len(name) < 25:
				items.append({
					"id": i,
					"name": name,
					"address": hex(start + sum(len(raw_items[j]) + 1 for j in range(i)))
				})
			else:
				break
		except:
			break

	return items


def extract_enemy_names(rom: bytes) -> list:
	"""Extract enemy names from ROM."""
	enemies = []

	start = DATA_ADDRESSES["enemy_names_start"]
	pos = start

	while pos < start + 0x300:
		# Find null terminator
		null_pos = rom.find(bytes([0]), pos)
		if null_pos < 0 or null_pos - pos > 20:
			break

		name = rom[pos:null_pos]
		try:
			n = name.decode('ascii')
			if n and len(n) > 0:
				enemies.append({
					"id": len(enemies),
					"name": n,
					"address": hex(pos)
				})
		except:
			break

		pos = null_pos + 1
		# Stop if we hit non-name data
		if pos < len(rom) and rom[pos] > 0x7E:
			break

	return enemies


def generate_item_wikitext(items: list) -> str:
	"""Generate wikitext table for items."""
	lines = [
		"== Item List ==",
		"",
		"Complete list of items in Robotrek (US).",
		"",
		'{| class="wikitable sortable"',
		"! ID !! Hex !! Name !! Type",
		"|-",
	]

	# Categorize items
	weapons = ["Sword", "Axe", "Blade", "Hammer", "Celtis", "Punch", "Blow", "Shot", "Laser"]
	armor = ["Shield", "Pack", "Boots"]

	for item in items:
		item_type = "Item"
		for w in weapons:
			if item["name"].startswith(w):
				item_type = "Weapon"
				break
		for a in armor:
			if a in item["name"]:
				item_type = "Armor"
				break
		if "Scrap" in item["name"]:
			item_type = "Material"
		if item["name"] in ["Smoke", "Cure", "Clean", "Repair", "Big Bomb", "Weather"]:
			item_type = "Program"

		lines.append(f"| {item['id']} || 0x{item['id']:02X} || {item['name']} || {item_type}")
		lines.append("|-")

	lines.append("|}")
	return "\n".join(lines)


def generate_enemy_wikitext(enemies: list) -> str:
	"""Generate wikitext table for enemies."""
	lines = [
		"== Enemy List ==",
		"",
		"Complete list of enemies in Robotrek (US).",
		"",
		'{| class="wikitable sortable"',
		"! ID !! Hex !! Name !! ROM Address",
		"|-",
	]

	for enemy in enemies:
		lines.append(f"| {enemy['id']} || 0x{enemy['id']:02X} || {enemy['name']} || {enemy['address']}")
		lines.append("|-")

	lines.append("|}")
	return "\n".join(lines)


def main():
	parser = argparse.ArgumentParser(description="Extract Robotrek game data")
	parser.add_argument("rom", help="Path to Robotrek ROM file")
	parser.add_argument("--output", "-o", default=".", help="Output directory")
	parser.add_argument("--format", "-f", choices=["json", "wiki", "both"], default="both")

	args = parser.parse_args()

	# Load ROM
	with open(args.rom, "rb") as f:
		rom = f.read()

	print(f"Loaded ROM: {len(rom):,} bytes")

	# Extract data
	items = extract_item_names(rom)
	enemies = extract_enemy_names(rom)

	print(f"Extracted {len(items)} items")
	print(f"Extracted {len(enemies)} enemies")

	output_dir = Path(args.output)
	output_dir.mkdir(parents=True, exist_ok=True)

	# Output JSON
	if args.format in ["json", "both"]:
		data = {
			"rom_info": ROM_INFO,
			"items": items,
			"enemies": enemies,
		}
		json_path = output_dir / "robotrek_data.json"
		with open(json_path, "w") as f:
			json.dump(data, f, indent="\t")
		print(f"Wrote: {json_path}")

	# Output wikitext
	if args.format in ["wiki", "both"]:
		items_wiki = generate_item_wikitext(items)
		items_path = output_dir / "robotrek_items.wikitext"
		with open(items_path, "w") as f:
			f.write(items_wiki)
		print(f"Wrote: {items_path}")

		enemies_wiki = generate_enemy_wikitext(enemies)
		enemies_path = output_dir / "robotrek_enemies.wikitext"
		with open(enemies_path, "w") as f:
			f.write(enemies_wiki)
		print(f"Wrote: {enemies_path}")


if __name__ == "__main__":
	main()
