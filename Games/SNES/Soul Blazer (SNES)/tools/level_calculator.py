#!/usr/bin/env python3
"""
Soul Blazer - Level and Experience Calculator
Calculates experience requirements, level stats, and grinding optimization.
"""

import argparse
import json
import math
from dataclasses import dataclass
from typing import List, Optional, Dict, Tuple
from enum import Enum


class EquipmentSlot(Enum):
	"""Equipment slot types."""
	SWORD = "sword"
	ARMOR = "armor"
	MAGIC = "magic"


@dataclass
class LevelData:
	"""Data for a single level."""
	level: int
	exp_required: int
	total_exp: int
	base_hp: int
	base_attack: int
	base_defense: int


@dataclass
class Equipment:
	"""Equipment item data."""
	id: int
	name: str
	slot: EquipmentSlot
	attack: int = 0
	defense: int = 0
	special: str = ""


@dataclass
class Enemy:
	"""Enemy data for grinding calculations."""
	id: int
	name: str
	hp: int
	attack: int
	defense: int
	exp: int
	gems: int
	area: str


class SoulBlazerCalculator:
	"""Calculator for Soul Blazer game mechanics."""

	# Experience table (level 1-50)
	# Based on formula: EXP = floor(level^2.4 * 8)
	EXP_TABLE = [
		0,      # Level 1 (starting)
		20,     # Level 2
		52,     # Level 3
		98,     # Level 4
		158,    # Level 5
		234,    # Level 6
		326,    # Level 7
		436,    # Level 8
		564,    # Level 9
		712,    # Level 10
		880,    # Level 11
		1068,   # Level 12
		1278,   # Level 13
		1510,   # Level 14
		1764,   # Level 15
		2042,   # Level 16
		2344,   # Level 17
		2670,   # Level 18
		3022,   # Level 19
		3400,   # Level 20
		3804,   # Level 21
		4236,   # Level 22
		4696,   # Level 23
		5184,   # Level 24
		5702,   # Level 25
		6250,   # Level 26
		6828,   # Level 27
		7438,   # Level 28
		8080,   # Level 29
		8754,   # Level 30
		9462,   # Level 31
		10204,  # Level 32
		10980,  # Level 33
		11792,  # Level 34
		12640,  # Level 35
		13524,  # Level 36
		14446,  # Level 37
		15406,  # Level 38
		16404,  # Level 39
		17442,  # Level 40
		18520,  # Level 41
		19638,  # Level 42
		20798,  # Level 43
		22000,  # Level 44
		23244,  # Level 45
		24532,  # Level 46
		25864,  # Level 47
		27240,  # Level 48
		28662,  # Level 49
		30130,  # Level 50
	]

	# HP per level (base + level bonus)
	BASE_HP = 20
	HP_PER_LEVEL = 4

	# Attack per level (base + level bonus)
	BASE_ATTACK = 2
	ATTACK_PER_2_LEVELS = 1

	# Defense per level (base + level bonus)
	BASE_DEFENSE = 1
	DEFENSE_PER_3_LEVELS = 1

	# Equipment data
	SWORDS = [
		Equipment(0, "Sword of Life", EquipmentSlot.SWORD, attack=4),
		Equipment(1, "Psycho Sword", EquipmentSlot.SWORD, attack=8, special="Soul attack"),
		Equipment(2, "Critical Sword", EquipmentSlot.SWORD, attack=12, special="Critical hits"),
		Equipment(3, "Lucky Blade", EquipmentSlot.SWORD, attack=10, special="+EXP/GEM drops"),
		Equipment(4, "Zantetsu Sword", EquipmentSlot.SWORD, attack=16, special="Metal enemies"),
		Equipment(5, "Spirit Sword", EquipmentSlot.SWORD, attack=20, special="Ghost enemies"),
		Equipment(6, "Recovery Sword", EquipmentSlot.SWORD, attack=14, special="HP drain"),
		Equipment(7, "Soul Blade", EquipmentSlot.SWORD, attack=24, special="Ultimate"),
	]

	ARMORS = [
		Equipment(0, "Iron Armor", EquipmentSlot.ARMOR, defense=4),
		Equipment(1, "Ice Armor", EquipmentSlot.ARMOR, defense=8, special="Fire resist"),
		Equipment(2, "Bubble Armor", EquipmentSlot.ARMOR, defense=6, special="Water breathing"),
		Equipment(3, "Magic Armor", EquipmentSlot.ARMOR, defense=12, special="Magic resist"),
		Equipment(4, "Mystic Armor", EquipmentSlot.ARMOR, defense=16, special="Halves damage"),
		Equipment(5, "Light Armor", EquipmentSlot.ARMOR, defense=10, special="Speed boost"),
		Equipment(6, "Elemental Armor", EquipmentSlot.ARMOR, defense=14, special="All elements"),
		Equipment(7, "Soul Armor", EquipmentSlot.ARMOR, defense=20, special="Ultimate"),
	]

	MAGICS = [
		Equipment(0, "Soul Blade", EquipmentSlot.MAGIC, attack=2, special="2 GEMs"),
		Equipment(1, "Flame Ball", EquipmentSlot.MAGIC, attack=6, special="4 GEMs"),
		Equipment(2, "Light Arrow", EquipmentSlot.MAGIC, attack=4, special="3 GEMs"),
		Equipment(3, "Magic Flare", EquipmentSlot.MAGIC, attack=10, special="8 GEMs"),
		Equipment(4, "Rotator", EquipmentSlot.MAGIC, attack=3, special="2 GEMs, orbits"),
		Equipment(5, "Spark Bomb", EquipmentSlot.MAGIC, attack=12, special="6 GEMs"),
		Equipment(6, "Flame Pillar", EquipmentSlot.MAGIC, attack=8, special="5 GEMs"),
		Equipment(7, "Tornado", EquipmentSlot.MAGIC, attack=14, special="10 GEMs"),
	]

	# Enemy data by area
	ENEMIES = [
		# Grass Valley / Underground Castle
		Enemy(0x01, "Plant", 4, 2, 1, 2, 1, "Grass Valley"),
		Enemy(0x02, "Slime", 6, 3, 1, 3, 2, "Grass Valley"),
		Enemy(0x03, "Bat", 5, 2, 0, 2, 1, "Underground Castle"),
		Enemy(0x04, "Skeleton", 10, 4, 2, 5, 3, "Underground Castle"),
		Enemy(0x05, "Ghost", 8, 3, 1, 4, 2, "Underground Castle"),
		Enemy(0x06, "Armor", 20, 6, 5, 10, 5, "Underground Castle"),

		# GreenWood
		Enemy(0x10, "Torch", 12, 5, 2, 8, 4, "GreenWood"),
		Enemy(0x11, "Ent", 18, 6, 3, 12, 6, "GreenWood"),
		Enemy(0x12, "Mushroom", 10, 4, 2, 6, 3, "GreenWood"),
		Enemy(0x13, "Fairy (hostile)", 8, 3, 1, 5, 2, "GreenWood"),
		Enemy(0x14, "Crystal", 25, 8, 6, 15, 8, "GreenWood Shrine"),

		# St. Elles / Seabed
		Enemy(0x20, "Fish", 14, 5, 2, 10, 5, "St. Elles"),
		Enemy(0x21, "Jellyfish", 12, 4, 1, 8, 4, "Seabed"),
		Enemy(0x22, "Crab", 20, 7, 5, 14, 7, "Seabed"),
		Enemy(0x23, "Merman", 25, 8, 4, 18, 9, "Seabed"),
		Enemy(0x24, "Ghost Sailor", 22, 6, 3, 16, 8, "Ghost Ship"),

		# Mountain of Souls
		Enemy(0x30, "Golem", 35, 10, 8, 25, 12, "Mountain Village"),
		Enemy(0x31, "Ice Wolf", 28, 8, 4, 20, 10, "Mountain"),
		Enemy(0x32, "Demon", 40, 12, 6, 30, 15, "Mountain"),
		Enemy(0x33, "Spirit", 20, 6, 2, 15, 8, "Laynole"),

		# Leo's Laboratory
		Enemy(0x40, "Toy Soldier", 30, 9, 5, 22, 11, "Model Town"),
		Enemy(0x41, "Doll", 25, 7, 4, 18, 9, "Model Town"),
		Enemy(0x42, "Painting Ghost", 35, 10, 5, 28, 14, "Painting World"),
		Enemy(0x43, "Metal Enemy", 50, 12, 10, 35, 18, "Leo's Lab"),

		# Magridd Castle / World of Evil
		Enemy(0x50, "Dark Knight", 45, 14, 8, 40, 20, "Magridd Castle"),
		Enemy(0x51, "Demon Lord", 60, 16, 10, 50, 25, "World of Evil"),
		Enemy(0x52, "Shadow", 40, 12, 6, 35, 18, "World of Evil"),
		Enemy(0x53, "Deathtoll Minion", 80, 18, 12, 60, 30, "Deathtoll's Room"),
	]

	# Bosses
	BOSSES = [
		Enemy(0xF0, "Metal Mantis", 100, 12, 6, 100, 0, "Underground Castle"),
		Enemy(0xF1, "Plantentacle", 150, 14, 5, 150, 0, "GreenWood"),
		Enemy(0xF2, "Poseidon", 200, 18, 8, 200, 0, "Seabed"),
		Enemy(0xF3, "Stone Guardian", 180, 16, 10, 250, 0, "Mountain"),
		Enemy(0xF4, "Tin Doll", 250, 20, 12, 300, 0, "Leo's Lab"),
		Enemy(0xF5, "Ghost Ship Captain", 200, 15, 8, 200, 0, "Ghost Ship"),
		Enemy(0xF6, "Demon Bird", 300, 22, 10, 400, 0, "Magridd Castle"),
		Enemy(0xF7, "Deathtoll", 900, 30, 15, 1000, 0, "Deathtoll's Room"),
	]

	def __init__(self):
		"""Initialize calculator with computed level data."""
		self.levels = self._compute_level_data()
		self.enemy_by_name = {e.name.lower(): e for e in self.ENEMIES + self.BOSSES}
		self.enemy_by_area = self._group_enemies_by_area()

	def _compute_level_data(self) -> List[LevelData]:
		"""Compute full level data table."""
		levels = []
		total_exp = 0

		for level in range(1, len(self.EXP_TABLE) + 1):
			exp_req = self.EXP_TABLE[level - 1] if level < len(self.EXP_TABLE) else 0
			hp = self.BASE_HP + (level - 1) * self.HP_PER_LEVEL
			attack = self.BASE_ATTACK + (level - 1) // 2
			defense = self.BASE_DEFENSE + (level - 1) // 3

			levels.append(LevelData(
				level=level,
				exp_required=exp_req,
				total_exp=total_exp,
				base_hp=hp,
				base_attack=attack,
				base_defense=defense
			))
			total_exp += exp_req

		return levels

	def _group_enemies_by_area(self) -> Dict[str, List[Enemy]]:
		"""Group enemies by area."""
		areas: Dict[str, List[Enemy]] = {}
		for enemy in self.ENEMIES:
			if enemy.area not in areas:
				areas[enemy.area] = []
			areas[enemy.area].append(enemy)
		return areas

	def get_level_data(self, level: int) -> Optional[LevelData]:
		"""Get data for a specific level."""
		if 1 <= level <= len(self.levels):
			return self.levels[level - 1]
		return None

	def exp_for_level(self, target_level: int) -> int:
		"""Calculate total EXP needed to reach a target level."""
		if target_level <= 1:
			return 0
		if target_level > len(self.levels):
			target_level = len(self.levels)
		return self.levels[target_level - 1].total_exp

	def exp_between_levels(self, from_level: int, to_level: int) -> int:
		"""Calculate EXP needed between two levels."""
		return self.exp_for_level(to_level) - self.exp_for_level(from_level)

	def level_from_exp(self, total_exp: int) -> int:
		"""Determine level from total EXP."""
		for level_data in reversed(self.levels):
			if total_exp >= level_data.total_exp:
				return level_data.level
		return 1

	def calculate_stats(self, level: int, sword_id: int = 0, armor_id: int = 0) -> Dict[str, int]:
		"""Calculate total stats for a level with equipment."""
		level_data = self.get_level_data(level)
		if not level_data:
			return {}

		sword = self.SWORDS[sword_id] if 0 <= sword_id < len(self.SWORDS) else self.SWORDS[0]
		armor = self.ARMORS[armor_id] if 0 <= armor_id < len(self.ARMORS) else self.ARMORS[0]

		return {
			"level": level,
			"hp": level_data.base_hp,
			"base_attack": level_data.base_attack,
			"sword_attack": sword.attack,
			"total_attack": level_data.base_attack + sword.attack,
			"base_defense": level_data.base_defense,
			"armor_defense": armor.defense,
			"total_defense": level_data.base_defense + armor.defense,
			"sword": sword.name,
			"armor": armor.name,
		}

	def damage_calculation(self, attacker_atk: int, defender_def: int) -> int:
		"""Calculate damage dealt."""
		# Soul Blazer damage formula: ATK - DEF/2, minimum 1
		damage = attacker_atk - (defender_def // 2)
		return max(1, damage)

	def kills_to_level(self, current_level: int, current_exp: int, target_level: int,
						enemy: Enemy) -> Tuple[int, int]:
		"""Calculate kills needed to reach target level."""
		exp_needed = self.exp_for_level(target_level) - current_exp
		if exp_needed <= 0:
			return 0, 0

		kills = math.ceil(exp_needed / enemy.exp)
		gems_earned = kills * enemy.gems
		return kills, gems_earned

	def optimal_grinding(self, current_level: int, target_level: int,
						 player_attack: int) -> List[Dict]:
		"""Find optimal enemies to grind for leveling."""
		exp_needed = self.exp_between_levels(current_level, target_level)
		results = []

		for enemy in self.ENEMIES:
			# Calculate if player can efficiently kill this enemy
			player_dmg = self.damage_calculation(player_attack, enemy.defense)
			enemy_dmg = self.damage_calculation(enemy.attack, 0)  # Assume base defense

			hits_to_kill = math.ceil(enemy.hp / player_dmg)
			kills_needed = math.ceil(exp_needed / enemy.exp)
			time_estimate = hits_to_kill * kills_needed  # Rough time in "actions"

			# Efficiency rating: EXP per action
			if hits_to_kill > 0:
				efficiency = enemy.exp / hits_to_kill
			else:
				efficiency = 0

			results.append({
				"enemy": enemy.name,
				"area": enemy.area,
				"exp": enemy.exp,
				"gems": enemy.gems,
				"hp": enemy.hp,
				"hits_to_kill": hits_to_kill,
				"kills_needed": kills_needed,
				"total_gems": kills_needed * enemy.gems,
				"efficiency": efficiency,
				"time_estimate": time_estimate,
			})

		# Sort by efficiency (highest first)
		results.sort(key=lambda x: x["efficiency"], reverse=True)
		return results

	def print_level_table(self, start: int = 1, end: int = 50):
		"""Print level progression table."""
		print("\nLevel Progression Table")
		print("=" * 70)
		print(f"{'Lvl':>3} {'EXP Req':>8} {'Total EXP':>10} {'HP':>4} {'ATK':>4} {'DEF':>4}")
		print("-" * 70)

		for level in range(start, min(end + 1, len(self.levels) + 1)):
			data = self.levels[level - 1]
			print(f"{data.level:>3} {data.exp_required:>8,} {data.total_exp:>10,} "
				  f"{data.base_hp:>4} {data.base_attack:>4} {data.base_defense:>4}")

	def print_equipment_table(self):
		"""Print equipment stats."""
		print("\nSwords")
		print("=" * 50)
		for sword in self.SWORDS:
			print(f"  {sword.name:<20} ATK+{sword.attack:<3} {sword.special}")

		print("\nArmors")
		print("=" * 50)
		for armor in self.ARMORS:
			print(f"  {armor.name:<20} DEF+{armor.defense:<3} {armor.special}")

		print("\nMagic")
		print("=" * 50)
		for magic in self.MAGICS:
			print(f"  {magic.name:<20} PWR+{magic.attack:<3} {magic.special}")

	def print_enemy_table(self, area: Optional[str] = None):
		"""Print enemy stats."""
		print("\nEnemy Data")
		print("=" * 80)
		print(f"{'Name':<20} {'HP':>4} {'ATK':>4} {'DEF':>4} {'EXP':>5} {'GEM':>4} {'Area':<20}")
		print("-" * 80)

		enemies = self.ENEMIES
		if area:
			enemies = [e for e in enemies if area.lower() in e.area.lower()]

		for enemy in enemies:
			print(f"{enemy.name:<20} {enemy.hp:>4} {enemy.attack:>4} {enemy.defense:>4} "
				  f"{enemy.exp:>5} {enemy.gems:>4} {enemy.area:<20}")

	def export_json(self, filepath: str):
		"""Export all data to JSON."""
		data = {
			"levels": [
				{
					"level": ld.level,
					"exp_required": ld.exp_required,
					"total_exp": ld.total_exp,
					"base_hp": ld.base_hp,
					"base_attack": ld.base_attack,
					"base_defense": ld.base_defense,
				}
				for ld in self.levels
			],
			"swords": [
				{"id": s.id, "name": s.name, "attack": s.attack, "special": s.special}
				for s in self.SWORDS
			],
			"armors": [
				{"id": a.id, "name": a.name, "defense": a.defense, "special": a.special}
				for a in self.ARMORS
			],
			"magics": [
				{"id": m.id, "name": m.name, "power": m.attack, "special": m.special}
				for m in self.MAGICS
			],
			"enemies": [
				{
					"id": e.id,
					"name": e.name,
					"hp": e.hp,
					"attack": e.attack,
					"defense": e.defense,
					"exp": e.exp,
					"gems": e.gems,
					"area": e.area,
				}
				for e in self.ENEMIES
			],
			"bosses": [
				{
					"id": b.id,
					"name": b.name,
					"hp": b.hp,
					"attack": b.attack,
					"defense": b.defense,
					"exp": b.exp,
					"area": b.area,
				}
				for b in self.BOSSES
			],
		}

		with open(filepath, "w", encoding="utf-8") as f:
			json.dump(data, f, indent="\t")
		print(f"Exported data to {filepath}")


def main():
	parser = argparse.ArgumentParser(
		description="Soul Blazer Level and Experience Calculator"
	)

	subparsers = parser.add_subparsers(dest="command", help="Command to run")

	# Level info command
	level_parser = subparsers.add_parser("level", help="Show level information")
	level_parser.add_argument("target", type=int, help="Target level")
	level_parser.add_argument("--from", dest="from_level", type=int, default=1,
							  help="Starting level")
	level_parser.add_argument("--exp", type=int, default=0,
							  help="Current EXP")

	# Stats command
	stats_parser = subparsers.add_parser("stats", help="Calculate player stats")
	stats_parser.add_argument("level", type=int, help="Player level")
	stats_parser.add_argument("--sword", type=int, default=0, help="Sword ID (0-7)")
	stats_parser.add_argument("--armor", type=int, default=0, help="Armor ID (0-7)")

	# Grinding command
	grind_parser = subparsers.add_parser("grind", help="Grinding optimization")
	grind_parser.add_argument("current", type=int, help="Current level")
	grind_parser.add_argument("target", type=int, help="Target level")
	grind_parser.add_argument("--attack", type=int, default=10,
							  help="Total attack power")
	grind_parser.add_argument("--top", type=int, default=5,
							  help="Show top N options")

	# Table command
	table_parser = subparsers.add_parser("table", help="Print data tables")
	table_parser.add_argument("type", choices=["levels", "equipment", "enemies", "all"],
							  help="Table type to print")
	table_parser.add_argument("--start", type=int, default=1, help="Start level")
	table_parser.add_argument("--end", type=int, default=50, help="End level")
	table_parser.add_argument("--area", type=str, help="Filter enemies by area")

	# Export command
	export_parser = subparsers.add_parser("export", help="Export data to JSON")
	export_parser.add_argument("output", help="Output file path")

	# Damage command
	damage_parser = subparsers.add_parser("damage", help="Calculate damage")
	damage_parser.add_argument("attack", type=int, help="Attacker's attack power")
	damage_parser.add_argument("defense", type=int, help="Defender's defense")

	args = parser.parse_args()
	calc = SoulBlazerCalculator()

	if args.command == "level":
		# Level information
		exp_needed = calc.exp_between_levels(args.from_level, args.target)
		level_data = calc.get_level_data(args.target)

		print(f"\nLevel {args.from_level} → Level {args.target}")
		print("=" * 40)
		print(f"EXP needed: {exp_needed:,}")
		if args.exp > 0:
			remaining = exp_needed - args.exp
			print(f"Current EXP: {args.exp:,}")
			print(f"Remaining: {max(0, remaining):,}")

		if level_data:
			print(f"\nAt Level {args.target}:")
			print(f"  HP: {level_data.base_hp}")
			print(f"  ATK: {level_data.base_attack}")
			print(f"  DEF: {level_data.base_defense}")

	elif args.command == "stats":
		stats = calc.calculate_stats(args.level, args.sword, args.armor)
		if stats:
			print(f"\nPlayer Stats (Level {args.level})")
			print("=" * 40)
			print(f"HP: {stats['hp']}")
			print(f"Attack: {stats['base_attack']} + {stats['sword_attack']} = {stats['total_attack']}")
			print(f"Defense: {stats['base_defense']} + {stats['armor_defense']} = {stats['total_defense']}")
			print(f"Sword: {stats['sword']}")
			print(f"Armor: {stats['armor']}")

	elif args.command == "grind":
		results = calc.optimal_grinding(args.current, args.target, args.attack)

		print(f"\nGrinding Analysis: Level {args.current} → {args.target}")
		print(f"Player Attack: {args.attack}")
		print("=" * 80)
		print(f"{'Enemy':<20} {'Area':<18} {'Kills':>6} {'GEMs':>7} {'Eff':>6}")
		print("-" * 80)

		for i, r in enumerate(results[:args.top]):
			print(f"{r['enemy']:<20} {r['area']:<18} {r['kills_needed']:>6,} "
				  f"{r['total_gems']:>7,} {r['efficiency']:>6.1f}")

		print("\n(Efficiency = EXP earned per hit required)")

	elif args.command == "table":
		if args.type == "levels" or args.type == "all":
			calc.print_level_table(args.start, args.end)
		if args.type == "equipment" or args.type == "all":
			calc.print_equipment_table()
		if args.type == "enemies" or args.type == "all":
			calc.print_enemy_table(args.area)

	elif args.command == "export":
		calc.export_json(args.output)

	elif args.command == "damage":
		damage = calc.damage_calculation(args.attack, args.defense)
		print(f"\nDamage Calculation")
		print("=" * 40)
		print(f"Attack: {args.attack}")
		print(f"Defense: {args.defense}")
		print(f"Damage: {damage}")
		print(f"Formula: ATK - DEF/2 = {args.attack} - {args.defense // 2} = {damage}")

	else:
		# Default: show summary
		print("Soul Blazer - Level and Experience Calculator")
		print("=" * 50)
		print("\nCommands:")
		print("  level <target>     - EXP requirements for level")
		print("  stats <level>      - Calculate stats with equipment")
		print("  grind <cur> <tgt>  - Optimal grinding spots")
		print("  table <type>       - Print data tables")
		print("  export <file>      - Export to JSON")
		print("  damage <atk> <def> - Calculate damage")
		print("\nExamples:")
		print("  python level_calculator.py level 20 --from 10")
		print("  python level_calculator.py stats 25 --sword 5 --armor 4")
		print("  python level_calculator.py grind 15 25 --attack 20")
		print("  python level_calculator.py table all")


if __name__ == "__main__":
	main()
