#!/usr/bin/env python3
"""
Robotrek Asset Extractor

Main pipeline script to extract all assets from Robotrek ROM.

Usage:
    python extract_assets.py <rom_path> --output <output_dir>
"""

import argparse
import json
import os
import sys
from pathlib import Path

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent))

from robotrek_analyzer import RobotrekAnalyzer
from robotrek_text_extractor import RobotrekTextExtractor
from robotrek_sprite_extractor import RobotrekSpriteExtractor
from robotrek_item_editor import RobotrekItemEditor
from robotrek_enemy_editor import RobotrekEnemyEditor
from robotrek_invention_editor import RobotrekInventionEditor


def extract_all(rom_path: str, output_dir: Path) -> None:
	"""Extract all assets from ROM."""
	output_dir.mkdir(parents=True, exist_ok=True)

	print("=" * 60)
	print("Robotrek Asset Extractor")
	print("=" * 60)
	print(f"ROM: {rom_path}")
	print(f"Output: {output_dir}")
	print()

	# 1. ROM Analysis
	print("[1/6] Analyzing ROM...")
	analysis_dir = output_dir / "analysis"
	analysis_dir.mkdir(exist_ok=True)

	analyzer = RobotrekAnalyzer(rom_path)
	report = analyzer.generate_report()

	with open(analysis_dir / "rom_analysis.json", "w") as f:
		json.dump(report, f, indent="\t")
	print(f"  → {analysis_dir / 'rom_analysis.json'}")

	# 2. Text Extraction
	print("[2/6] Extracting text...")
	text_dir = output_dir / "text"
	text_dir.mkdir(exist_ok=True)

	text_extractor = RobotrekTextExtractor(rom_path)
	all_text = text_extractor.extract_all_text()

	with open(text_dir / "all_text.json", "w", encoding="utf-8") as f:
		json.dump(all_text, f, indent="\t", ensure_ascii=False)
	print(f"  → {text_dir / 'all_text.json'}")

	text_extractor.export_tbl(text_dir / "robotrek.tbl")

	# 3. Sprite Extraction
	print("[3/6] Extracting sprites...")
	sprite_dir = output_dir / "sprites"
	sprite_dir.mkdir(exist_ok=True)

	try:
		sprite_extractor = RobotrekSpriteExtractor(rom_path)
		sprite_extractor.extract_all(sprite_dir)
	except Exception as e:
		print(f"  Warning: Sprite extraction failed: {e}")
		print("  (Install Pillow for sprite export: pip install pillow)")

	# 4. Item Data
	print("[4/6] Extracting item data...")
	data_dir = output_dir / "data"
	data_dir.mkdir(exist_ok=True)

	item_editor = RobotrekItemEditor(rom_path)
	item_editor.export_json(data_dir / "items.json")

	# 5. Enemy Data
	print("[5/6] Extracting enemy data...")
	enemy_editor = RobotrekEnemyEditor(rom_path)
	enemy_editor.export_json(data_dir / "enemies.json")

	# 6. Invention Data
	print("[6/6] Extracting invention data...")
	invention_editor = RobotrekInventionEditor(rom_path)
	invention_editor.export_json(data_dir / "inventions.json")

	# Summary
	print()
	print("=" * 60)
	print("Extraction Complete!")
	print("=" * 60)
	print()
	print("Output structure:")
	print(f"  {output_dir}/")
	print(f"    analysis/")
	print(f"      rom_analysis.json")
	print(f"    text/")
	print(f"      all_text.json")
	print(f"      robotrek.tbl")
	print(f"    sprites/")
	print(f"      player.png, robot1.png, etc.")
	print(f"    data/")
	print(f"      items.json")
	print(f"      enemies.json")
	print(f"      inventions.json")


def main():
	parser = argparse.ArgumentParser(description="Extract all Robotrek assets")
	parser.add_argument("rom", help="Path to Robotrek ROM file")
	parser.add_argument("--output", "-o", required=True, help="Output directory")

	args = parser.parse_args()

	if not Path(args.rom).exists():
		print(f"Error: ROM not found: {args.rom}")
		sys.exit(1)

	extract_all(args.rom, Path(args.output))


if __name__ == "__main__":
	main()
