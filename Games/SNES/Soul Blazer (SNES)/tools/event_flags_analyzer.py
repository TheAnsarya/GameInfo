#!/usr/bin/env python3
"""
Soul Blazer (SNES) Event Flags Analyzer
Analyzes game progression flags and event triggers.
"""

import json
from pathlib import Path
from dataclasses import dataclass, field
from typing import Optional
from enum import IntEnum, auto


# Paths
SCRIPT_DIR = Path(__file__).parent
ASSETS_DIR = SCRIPT_DIR.parent / "assets"
EVENT_DIR = ASSETS_DIR / "events"
DEFAULT_ROM = Path(r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Soul Blazer (U) [!].sfc")


class EventType(IntEnum):
	"""Event flag types."""
	LAIR_CLEARED = auto()
	SOUL_RELEASED = auto()
	BOSS_DEFEATED = auto()
	ITEM_OBTAINED = auto()
	EMBLEM_OBTAINED = auto()
	NPC_TALKED = auto()
	DOOR_OPENED = auto()
	WARP_UNLOCKED = auto()
	CUTSCENE_VIEWED = auto()
	CHAPTER_COMPLETE = auto()


class FlagCategory(IntEnum):
	"""Flag memory categories."""
	LAIR_FLAGS = 0x00       # $7E1800-$7E183F (64 bytes, 512 lairs)
	SOUL_FLAGS = 0x01       # $7E1840-$7E187F (64 bytes, 512 souls)
	ITEM_FLAGS = 0x02       # $7E1880-$7E189F (32 bytes, 256 items)
	EVENT_FLAGS = 0x03      # $7E18A0-$7E18FF (96 bytes, 768 events)
	BOSS_FLAGS = 0x04       # $7E1900-$7E190F (16 bytes, 128 bosses)
	EMBLEM_FLAGS = 0x05     # $7E1910-$7E191F (16 bytes)


@dataclass
class EventFlag:
	"""Single event flag definition."""
	flag_id: int
	name: str
	event_type: EventType
	category: FlagCategory
	byte_offset: int
	bit_mask: int
	description: str = ""
	area: str = ""
	trigger: str = ""
	result: str = ""
	prerequisites: list[int] = field(default_factory=list)


@dataclass
class ProgressionStep:
	"""Step in game progression."""
	order: int
	name: str
	area: str
	flags_required: list[int]
	flags_set: list[int]
	description: str = ""


class EventFlagAnalyzer:
	"""Analyze event flags and progression in Soul Blazer."""

	# RAM address ranges for flags
	FLAG_RANGES = {
		FlagCategory.LAIR_FLAGS: (0x1800, 0x1840),
		FlagCategory.SOUL_FLAGS: (0x1840, 0x1880),
		FlagCategory.ITEM_FLAGS: (0x1880, 0x18A0),
		FlagCategory.EVENT_FLAGS: (0x18A0, 0x1900),
		FlagCategory.BOSS_FLAGS: (0x1900, 0x1910),
		FlagCategory.EMBLEM_FLAGS: (0x1910, 0x1920),
	}

	# Known event flags (comprehensive list)
	KNOWN_FLAGS = [
		# Act 1 - Grass Valley
		EventFlag(0x001, "Grass Valley entrance opened", EventType.DOOR_OPENED,
				  FlagCategory.EVENT_FLAGS, 0x18A0, 0x01, area="Grass Valley"),
		EventFlag(0x002, "Underground Castle entrance", EventType.DOOR_OPENED,
				  FlagCategory.EVENT_FLAGS, 0x18A0, 0x02, area="Grass Valley"),
		EventFlag(0x003, "Lisa freed", EventType.SOUL_RELEASED,
				  FlagCategory.SOUL_FLAGS, 0x1840, 0x01, area="Underground Castle"),
		EventFlag(0x004, "Goat freed", EventType.SOUL_RELEASED,
				  FlagCategory.SOUL_FLAGS, 0x1840, 0x02, area="Underground Castle"),
		EventFlag(0x005, "Ivy rescued", EventType.SOUL_RELEASED,
				  FlagCategory.SOUL_FLAGS, 0x1840, 0x04, area="Underground Castle"),
		EventFlag(0x006, "Tool shop keeper freed", EventType.SOUL_RELEASED,
				  FlagCategory.SOUL_FLAGS, 0x1840, 0x08, area="Underground Castle"),
		EventFlag(0x007, "Metal Mantis defeated", EventType.BOSS_DEFEATED,
				  FlagCategory.BOSS_FLAGS, 0x1900, 0x01, area="Underground Castle"),
		EventFlag(0x008, "Dream Rod obtained", EventType.ITEM_OBTAINED,
				  FlagCategory.ITEM_FLAGS, 0x1880, 0x01, area="Underground Castle"),

		# Act 2 - GreenWood
		EventFlag(0x010, "GreenWood entrance opened", EventType.DOOR_OPENED,
				  FlagCategory.EVENT_FLAGS, 0x18A0, 0x10, area="GreenWood"),
		EventFlag(0x011, "Turbo freed", EventType.SOUL_RELEASED,
				  FlagCategory.SOUL_FLAGS, 0x1841, 0x01, area="GreenWood"),
		EventFlag(0x012, "Greenwood Guardian talked", EventType.NPC_TALKED,
				  FlagCategory.EVENT_FLAGS, 0x18A1, 0x01, area="GreenWood"),
		EventFlag(0x013, "Water Shrine entrance", EventType.DOOR_OPENED,
				  FlagCategory.EVENT_FLAGS, 0x18A1, 0x02, area="GreenWood"),
		EventFlag(0x014, "Fire Shrine entrance", EventType.DOOR_OPENED,
				  FlagCategory.EVENT_FLAGS, 0x18A1, 0x04, area="GreenWood"),
		EventFlag(0x015, "Light Shrine entrance", EventType.DOOR_OPENED,
				  FlagCategory.EVENT_FLAGS, 0x18A1, 0x08, area="GreenWood"),
		EventFlag(0x016, "Solid Arm defeated", EventType.BOSS_DEFEATED,
				  FlagCategory.BOSS_FLAGS, 0x1900, 0x02, area="GreenWood"),
		EventFlag(0x017, "Greenwood Leaf obtained", EventType.ITEM_OBTAINED,
				  FlagCategory.ITEM_FLAGS, 0x1880, 0x02, area="GreenWood"),

		# Act 3 - St. Elles
		EventFlag(0x020, "St. Elles entrance", EventType.DOOR_OPENED,
				  FlagCategory.EVENT_FLAGS, 0x18A2, 0x01, area="St. Elles"),
		EventFlag(0x021, "Mermaid Queen freed", EventType.SOUL_RELEASED,
				  FlagCategory.SOUL_FLAGS, 0x1842, 0x01, area="St. Elles"),
		EventFlag(0x022, "Lue the Dolphin freed", EventType.SOUL_RELEASED,
				  FlagCategory.SOUL_FLAGS, 0x1842, 0x02, area="St. Elles"),
		EventFlag(0x023, "Bubble Armor obtained", EventType.ITEM_OBTAINED,
				  FlagCategory.ITEM_FLAGS, 0x1880, 0x04, area="St. Elles"),
		EventFlag(0x024, "Great Carrot defeated", EventType.BOSS_DEFEATED,
				  FlagCategory.BOSS_FLAGS, 0x1900, 0x04, area="St. Elles"),
		EventFlag(0x025, "Mermaid's Tears obtained", EventType.ITEM_OBTAINED,
				  FlagCategory.ITEM_FLAGS, 0x1880, 0x08, area="St. Elles"),

		# Act 4 - Mountain of Souls
		EventFlag(0x030, "Mountain entrance", EventType.DOOR_OPENED,
				  FlagCategory.EVENT_FLAGS, 0x18A3, 0x01, area="Mountain of Souls"),
		EventFlag(0x031, "Nome freed", EventType.SOUL_RELEASED,
				  FlagCategory.SOUL_FLAGS, 0x1843, 0x01, area="Mountain of Souls"),
		EventFlag(0x032, "Mushroom freed", EventType.SOUL_RELEASED,
				  FlagCategory.SOUL_FLAGS, 0x1843, 0x02, area="Mountain of Souls"),
		EventFlag(0x033, "Dragon defeated", EventType.BOSS_DEFEATED,
				  FlagCategory.BOSS_FLAGS, 0x1900, 0x08, area="Mountain of Souls"),
		EventFlag(0x034, "Magic Bell obtained", EventType.ITEM_OBTAINED,
				  FlagCategory.ITEM_FLAGS, 0x1880, 0x10, area="Mountain of Souls"),

		# Act 5 - Leo's Lab
		EventFlag(0x040, "Leo's Lab entrance", EventType.DOOR_OPENED,
				  FlagCategory.EVENT_FLAGS, 0x18A4, 0x01, area="Leo's Lab"),
		EventFlag(0x041, "Model Town 1 complete", EventType.CUTSCENE_VIEWED,
				  FlagCategory.EVENT_FLAGS, 0x18A4, 0x02, area="Leo's Lab"),
		EventFlag(0x042, "Model Town 2 complete", EventType.CUTSCENE_VIEWED,
				  FlagCategory.EVENT_FLAGS, 0x18A4, 0x04, area="Leo's Lab"),
		EventFlag(0x043, "Tin Doll defeated", EventType.BOSS_DEFEATED,
				  FlagCategory.BOSS_FLAGS, 0x1900, 0x10, area="Leo's Lab"),
		EventFlag(0x044, "Leo's Brush obtained", EventType.ITEM_OBTAINED,
				  FlagCategory.ITEM_FLAGS, 0x1880, 0x20, area="Leo's Lab"),

		# Act 6 - Magridd Castle
		EventFlag(0x050, "Magridd entrance", EventType.DOOR_OPENED,
				  FlagCategory.EVENT_FLAGS, 0x18A5, 0x01, area="Magridd Castle"),
		EventFlag(0x051, "King Magridd freed", EventType.SOUL_RELEASED,
				  FlagCategory.SOUL_FLAGS, 0x1845, 0x01, area="Magridd Castle"),
		EventFlag(0x052, "Queen Magridd freed", EventType.SOUL_RELEASED,
				  FlagCategory.SOUL_FLAGS, 0x1845, 0x02, area="Magridd Castle"),
		EventFlag(0x053, "Demon Bird defeated", EventType.BOSS_DEFEATED,
				  FlagCategory.BOSS_FLAGS, 0x1900, 0x20, area="Magridd Castle"),
		EventFlag(0x054, "Soul Blade obtained", EventType.ITEM_OBTAINED,
				  FlagCategory.ITEM_FLAGS, 0x1880, 0x40, area="Magridd Castle"),

		# Act 7 - World of Evil
		EventFlag(0x060, "World of Evil entrance", EventType.DOOR_OPENED,
				  FlagCategory.EVENT_FLAGS, 0x18A6, 0x01, area="World of Evil"),
		EventFlag(0x061, "Deathtoll Phase 1", EventType.BOSS_DEFEATED,
				  FlagCategory.BOSS_FLAGS, 0x1900, 0x40, area="World of Evil"),
		EventFlag(0x062, "Deathtoll Phase 2", EventType.BOSS_DEFEATED,
				  FlagCategory.BOSS_FLAGS, 0x1900, 0x80, area="World of Evil"),
		EventFlag(0x063, "Game Complete", EventType.CHAPTER_COMPLETE,
				  FlagCategory.EVENT_FLAGS, 0x18A6, 0x80, area="World of Evil"),

		# Emblems
		EventFlag(0x070, "Emblem A obtained", EventType.EMBLEM_OBTAINED,
				  FlagCategory.EMBLEM_FLAGS, 0x1910, 0x01, area="Grass Valley"),
		EventFlag(0x071, "Emblem B obtained", EventType.EMBLEM_OBTAINED,
				  FlagCategory.EMBLEM_FLAGS, 0x1910, 0x02, area="GreenWood"),
		EventFlag(0x072, "Emblem C obtained", EventType.EMBLEM_OBTAINED,
				  FlagCategory.EMBLEM_FLAGS, 0x1910, 0x04, area="St. Elles"),
		EventFlag(0x073, "Emblem D obtained", EventType.EMBLEM_OBTAINED,
				  FlagCategory.EMBLEM_FLAGS, 0x1910, 0x08, area="Mountain of Souls"),
		EventFlag(0x074, "Emblem E obtained", EventType.EMBLEM_OBTAINED,
				  FlagCategory.EMBLEM_FLAGS, 0x1910, 0x10, area="Leo's Lab"),
		EventFlag(0x075, "Emblem F obtained", EventType.EMBLEM_OBTAINED,
				  FlagCategory.EMBLEM_FLAGS, 0x1910, 0x20, area="Magridd Castle"),
		EventFlag(0x076, "Emblem G obtained", EventType.EMBLEM_OBTAINED,
				  FlagCategory.EMBLEM_FLAGS, 0x1910, 0x40, area="World of Evil"),
		EventFlag(0x077, "Emblem H obtained", EventType.EMBLEM_OBTAINED,
				  FlagCategory.EMBLEM_FLAGS, 0x1910, 0x80, area="World of Evil"),
	]

	# Game progression order
	PROGRESSION = [
		ProgressionStep(1, "Start Game", "Grass Valley", [], [0x001],
					   "Begin adventure, enter Grass Valley"),
		ProgressionStep(2, "Underground Castle", "Underground Castle", [0x001], [0x002, 0x003, 0x004],
					   "Enter castle, free villagers"),
		ProgressionStep(3, "Defeat Metal Mantis", "Underground Castle", [0x002], [0x007, 0x008],
					   "Defeat boss, obtain Dream Rod"),
		ProgressionStep(4, "Enter GreenWood", "GreenWood", [0x007], [0x010, 0x011],
					   "Use Dream Rod to enter GreenWood"),
		ProgressionStep(5, "Complete Shrines", "GreenWood", [0x010], [0x013, 0x014, 0x015],
					   "Open all three shrines"),
		ProgressionStep(6, "Defeat Solid Arm", "GreenWood", [0x013, 0x014, 0x015], [0x016, 0x017],
					   "Defeat boss, obtain Greenwood Leaf"),
		ProgressionStep(7, "Enter St. Elles", "St. Elles", [0x016], [0x020, 0x021],
					   "Travel to underwater kingdom"),
		ProgressionStep(8, "Defeat Great Carrot", "St. Elles", [0x020], [0x024, 0x025],
					   "Defeat seabed boss"),
		ProgressionStep(9, "Enter Mountain", "Mountain of Souls", [0x024], [0x030],
					   "Climb the mountain"),
		ProgressionStep(10, "Defeat Dragon", "Mountain of Souls", [0x030], [0x033, 0x034],
					   "Defeat the dragon"),
		ProgressionStep(11, "Enter Leo's Lab", "Leo's Lab", [0x033], [0x040],
					   "Enter the laboratory"),
		ProgressionStep(12, "Complete Model Towns", "Leo's Lab", [0x040], [0x041, 0x042],
					   "Complete both model towns"),
		ProgressionStep(13, "Defeat Tin Doll", "Leo's Lab", [0x041, 0x042], [0x043, 0x044],
					   "Defeat the doll boss"),
		ProgressionStep(14, "Enter Magridd", "Magridd Castle", [0x043], [0x050],
					   "Enter the castle"),
		ProgressionStep(15, "Defeat Demon Bird", "Magridd Castle", [0x050], [0x053, 0x054],
					   "Defeat the demon"),
		ProgressionStep(16, "Enter World of Evil", "World of Evil", [0x053], [0x060],
					   "Enter final area"),
		ProgressionStep(17, "Defeat Deathtoll", "World of Evil", [0x060], [0x061, 0x062, 0x063],
					   "Defeat final boss, complete game"),
	]

	def __init__(self, rom_path: str = None):
		"""Initialize analyzer."""
		self.rom_data: Optional[bytes] = None
		self.flags = {f.flag_id: f for f in self.KNOWN_FLAGS}

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

	def get_flags_by_area(self, area: str) -> list[EventFlag]:
		"""Get all flags for a specific area."""
		return [f for f in self.KNOWN_FLAGS if f.area.lower() == area.lower()]

	def get_flags_by_type(self, event_type: EventType) -> list[EventFlag]:
		"""Get all flags of a specific type."""
		return [f for f in self.KNOWN_FLAGS if f.event_type == event_type]

	def get_progression_for_area(self, area: str) -> list[ProgressionStep]:
		"""Get progression steps for an area."""
		return [p for p in self.PROGRESSION if p.area.lower() == area.lower()]

	def analyze_flag_dependencies(self) -> dict:
		"""Analyze flag dependencies and prerequisites."""
		dependencies = {}

		for step in self.PROGRESSION:
			for flag_id in step.flags_set:
				if flag_id not in dependencies:
					dependencies[flag_id] = {
						"requires": [],
						"enables": [],
					}
				dependencies[flag_id]["requires"].extend(step.flags_required)

			for flag_id in step.flags_required:
				if flag_id not in dependencies:
					dependencies[flag_id] = {
						"requires": [],
						"enables": [],
					}
				dependencies[flag_id]["enables"].extend(step.flags_set)

		return dependencies

	def export_to_json(self, output_path: Path) -> None:
		"""Export flag data to JSON."""
		data = {
			"flag_count": len(self.KNOWN_FLAGS),
			"progression_steps": len(self.PROGRESSION),
			"categories": [c.name for c in FlagCategory],
			"event_types": [e.name for e in EventType],
			"flags": [
				{
					"id": f"${f.flag_id:03X}",
					"name": f.name,
					"type": f.event_type.name,
					"category": f.category.name,
					"address": f"$7E{f.byte_offset:04X}",
					"bit_mask": f"${f.bit_mask:02X}",
					"area": f.area,
					"description": f.description,
				}
				for f in self.KNOWN_FLAGS
			],
			"progression": [
				{
					"order": p.order,
					"name": p.name,
					"area": p.area,
					"requires": [f"${r:03X}" for r in p.flags_required],
					"sets": [f"${s:03X}" for s in p.flags_set],
					"description": p.description,
				}
				for p in self.PROGRESSION
			],
		}

		output_path.parent.mkdir(parents=True, exist_ok=True)
		with open(output_path, 'w') as f:
			json.dump(data, f, indent='\t')

	def generate_wikitext(self) -> str:
		"""Generate wikitext documentation."""
		lines = [
			"== Event Flags ==",
			"",
			"This page documents the event flags used for game progression.",
			"",
			"=== Flag Categories ===",
			"",
			"{| class=\"wikitable\"",
			"! Category !! Address Range !! Purpose",
		]

		for cat in FlagCategory:
			start, end = self.FLAG_RANGES[cat]
			lines.append("|-")
			lines.append(f"| {cat.name} || $7E{start:04X}-$7E{end:04X} || {cat.name.replace('_', ' ').title()}")

		lines.append("|}")
		lines.append("")

		# Flags by area
		areas = ["Grass Valley", "GreenWood", "St. Elles", "Mountain of Souls",
				 "Leo's Lab", "Magridd Castle", "World of Evil"]

		lines.append("=== Flags by Area ===")
		lines.append("")

		for area in areas:
			area_flags = self.get_flags_by_area(area)
			if not area_flags:
				continue

			lines.append(f"==== {area} ====")
			lines.append("")
			lines.append("{| class=\"wikitable sortable\"")
			lines.append("! ID !! Name !! Type !! Address")

			for f in area_flags:
				lines.append("|-")
				lines.append(f"| ${{{{hex|{f.flag_id:03X}}}}} || {f.name} || {f.event_type.name} || $7E{f.byte_offset:04X} bit {f.bit_mask:02X}")

			lines.append("|}")
			lines.append("")

		# Progression
		lines.append("=== Game Progression ===")
		lines.append("")
		lines.append("{| class=\"wikitable\"")
		lines.append("! # !! Step !! Area !! Description")

		for p in self.PROGRESSION:
			lines.append("|-")
			lines.append(f"| {p.order} || {p.name} || {p.area} || {p.description}")

		lines.append("|}")

		return "\n".join(lines)

	def print_summary(self) -> None:
		"""Print analysis summary."""
		print("=" * 60)
		print("SOUL BLAZER EVENT FLAGS ANALYSIS")
		print("=" * 60)

		print(f"\nTotal known flags: {len(self.KNOWN_FLAGS)}")
		print(f"Progression steps: {len(self.PROGRESSION)}")

		print("\n--- Flags by Category ---")
		for cat in FlagCategory:
			count = len([f for f in self.KNOWN_FLAGS if f.category == cat])
			print(f"  {cat.name}: {count}")

		print("\n--- Flags by Area ---")
		areas = set(f.area for f in self.KNOWN_FLAGS)
		for area in sorted(areas):
			count = len(self.get_flags_by_area(area))
			print(f"  {area}: {count}")

		print("\n--- Boss Flags ---")
		boss_flags = self.get_flags_by_type(EventType.BOSS_DEFEATED)
		for f in boss_flags:
			print(f"  ${f.flag_id:03X}: {f.name}")


def main():
	"""Main entry point."""
	import argparse

	parser = argparse.ArgumentParser(description="Soul Blazer Event Flags Analyzer")
	parser.add_argument("--rom", "-r", help="Path to ROM file", default=str(DEFAULT_ROM))
	parser.add_argument("--output", "-o", help="Output directory", default=str(EVENT_DIR))
	parser.add_argument("--wikitext", "-w", action="store_true", help="Generate wikitext output")
	parser.add_argument("--area", "-a", help="Show flags for specific area")

	args = parser.parse_args()

	analyzer = EventFlagAnalyzer(args.rom)

	if args.wikitext:
		print(analyzer.generate_wikitext())
	elif args.area:
		flags = analyzer.get_flags_by_area(args.area)
		print(f"\nFlags for {args.area}:")
		for f in flags:
			print(f"  ${f.flag_id:03X}: {f.name} ({f.event_type.name})")
	else:
		analyzer.print_summary()

		output_dir = Path(args.output)
		analyzer.export_to_json(output_dir / "event_flags.json")
		print(f"\nExported to: {output_dir}")


if __name__ == "__main__":
	main()
