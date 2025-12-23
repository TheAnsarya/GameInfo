#!/usr/bin/env python3
"""
Robotrek Build Pipeline

Converts extracted/modified assets back into ROM format.

Usage:
    python build_rom.py --input <assets_dir> --rom <original_rom> --output <output_rom>
"""

import argparse
import json
import shutil
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))

from robotrek_item_editor import RobotrekItemEditor
from robotrek_enemy_editor import RobotrekEnemyEditor
from robotrek_invention_editor import RobotrekInventionEditor


def build_rom(assets_dir: Path, original_rom: str, output_rom: str) -> bool:
	"""Build modified ROM from assets."""
	print("=" * 60)
	print("Robotrek ROM Builder")
	print("=" * 60)
	print(f"Assets: {assets_dir}")
	print(f"Original ROM: {original_rom}")
	print(f"Output ROM: {output_rom}")
	print()

	# Copy original ROM to output
	print("[1/4] Creating ROM copy...")
	shutil.copy(original_rom, output_rom)
	print(f"  → Copied to {output_rom}")

	data_dir = assets_dir / "data"
	modified = False

	# Apply item modifications
	items_json = data_dir / "items.json"
	if items_json.exists():
		print("[2/4] Applying item modifications...")
		editor = RobotrekItemEditor(output_rom)
		count = editor.import_json(items_json)
		if count > 0:
			editor.save_rom()
			modified = True
		print(f"  → Modified {count} items")
	else:
		print("[2/4] No item modifications found")

	# Apply enemy modifications
	enemies_json = data_dir / "enemies.json"
	if enemies_json.exists():
		print("[3/4] Applying enemy modifications...")
		editor = RobotrekEnemyEditor(output_rom)
		count = editor.import_json(enemies_json)
		if count > 0:
			editor.save_rom()
			modified = True
		print(f"  → Modified {count} enemies")
	else:
		print("[3/4] No enemy modifications found")

	# Apply invention modifications
	inventions_json = data_dir / "inventions.json"
	if inventions_json.exists():
		print("[4/4] Applying invention modifications...")
		editor = RobotrekInventionEditor(output_rom)
		count = editor.import_json(inventions_json)
		if count > 0:
			editor.save_rom()
			modified = True
		print(f"  → Modified {count} inventions")
	else:
		print("[4/4] No invention modifications found")

	print()
	print("=" * 60)
	if modified:
		print("Build Complete!")
		print(f"Output: {output_rom}")
	else:
		print("No modifications applied.")
		print("ROM is identical to original.")
	print("=" * 60)

	return modified


def verify_rom(original_rom: str, built_rom: str) -> dict:
	"""Compare original and built ROMs."""
	with open(original_rom, "rb") as f:
		original_data = f.read()

	with open(built_rom, "rb") as f:
		built_data = f.read()

	differences = []
	for i in range(min(len(original_data), len(built_data))):
		if original_data[i] != built_data[i]:
			differences.append({
				"offset": f"0x{i:06X}",
				"original": f"${original_data[i]:02X}",
				"modified": f"${built_data[i]:02X}"
			})

	return {
		"original_size": len(original_data),
		"built_size": len(built_data),
		"size_match": len(original_data) == len(built_data),
		"difference_count": len(differences),
		"differences": differences[:100]  # Limit output
	}


def main():
	parser = argparse.ArgumentParser(description="Build Robotrek ROM from assets")
	parser.add_argument("--input", "-i", required=True, help="Assets directory")
	parser.add_argument("--rom", "-r", required=True, help="Original ROM file")
	parser.add_argument("--output", "-o", required=True, help="Output ROM file")
	parser.add_argument("--verify", "-v", action="store_true", help="Verify build")

	args = parser.parse_args()

	assets_dir = Path(args.input)
	if not assets_dir.exists():
		print(f"Error: Assets directory not found: {assets_dir}")
		sys.exit(1)

	if not Path(args.rom).exists():
		print(f"Error: Original ROM not found: {args.rom}")
		sys.exit(1)

	build_rom(assets_dir, args.rom, args.output)

	if args.verify:
		print()
		print("Verification:")
		result = verify_rom(args.rom, args.output)
		print(f"  Size match: {result['size_match']}")
		print(f"  Differences: {result['difference_count']} bytes")
		if result['differences']:
			print("  First differences:")
			for diff in result['differences'][:10]:
				print(f"    {diff['offset']}: {diff['original']} → {diff['modified']}")


if __name__ == "__main__":
	main()
