#!/usr/bin/env python3
"""
Battle System Editor - Edit battle mechanics for RPG games.

Tools for defining battle formulas, damage calculations,
status effects, and combat flow.

Usage:
	python battle_system.py <config.json>
	python battle_system.py --formula damage
	python battle_system.py --simulate

Features:
	- Formula definitions
	- Damage calculations
	- Status effects
	- Element system
	- Battle flow scripting
"""

import argparse
import json
import math
import os
import random
from dataclasses import dataclass, field
from enum import Enum, Flag, auto
from pathlib import Path
from typing import Any, Callable, Dict, List, Optional, Tuple


class Element(Flag):
	"""Elemental types."""
	NONE = 0
	FIRE = auto()
	ICE = auto()
	THUNDER = auto()
	WIND = auto()
	EARTH = auto()
	WATER = auto()
	LIGHT = auto()
	DARK = auto()
	PHYSICAL = auto()
	MAGIC = auto()


class StatusEffect(Enum):
	"""Battle status effects."""
	NONE = 0
	POISON = auto()
	SLEEP = auto()
	PARALYSIS = auto()
	CONFUSION = auto()
	BLIND = auto()
	SILENCE = auto()
	BERSERK = auto()
	CHARM = auto()
	PETRIFY = auto()
	DEATH = auto()
	REGEN = auto()
	PROTECT = auto()
	SHELL = auto()
	HASTE = auto()
	SLOW = auto()
	STOP = auto()
	REFLECT = auto()
	BARRIER = auto()


class TargetType(Enum):
	"""Action target types."""
	SINGLE_ENEMY = auto()
	ALL_ENEMIES = auto()
	RANDOM_ENEMY = auto()
	SINGLE_ALLY = auto()
	ALL_ALLIES = auto()
	SELF = auto()
	ALL = auto()


class DamageType(Enum):
	"""Types of damage."""
	PHYSICAL = auto()
	MAGICAL = auto()
	FIXED = auto()
	PERCENT = auto()
	CURRENT_HP = auto()
	MAX_HP = auto()
	DRAIN = auto()


@dataclass
class StatusConfig:
	"""Status effect configuration."""
	effect: StatusEffect
	duration: int = 3  # Turns
	damage_per_turn: int = 0
	heal_per_turn: int = 0
	stat_modifier: float = 1.0
	cure_chance: float = 0.0  # Per turn
	inflict_chance: float = 1.0
	blocks_action: bool = False
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"effect": self.effect.name,
			"duration": self.duration,
			"damage_per_turn": self.damage_per_turn,
			"heal_per_turn": self.heal_per_turn,
			"stat_modifier": self.stat_modifier,
			"cure_chance": self.cure_chance,
			"inflict_chance": self.inflict_chance,
			"blocks_action": self.blocks_action
		}


@dataclass
class Formula:
	"""Damage or effect formula."""
	name: str
	expression: str
	description: str = ""
	
	# Variables available in formula
	# a = attacker, d = defender
	# a_atk, a_str, a_mag, a_lvl, etc.
	# d_def, d_mdef, d_lvl, etc.
	
	def evaluate(self, variables: Dict[str, float]) -> float:
		"""Evaluate formula with given variables."""
		# Safe evaluation
		allowed_names = {
			"abs": abs,
			"min": min,
			"max": max,
			"pow": pow,
			"sqrt": math.sqrt,
			"floor": math.floor,
			"ceil": math.ceil,
			"random": random.random
		}
		
		# Add variables
		allowed_names.update(variables)
		
		try:
			result = eval(self.expression, {"__builtins__": {}}, allowed_names)
			return float(result)
		except Exception as e:
			print(f"Formula error: {e}")
			return 0
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"name": self.name,
			"expression": self.expression,
			"description": self.description
		}


@dataclass
class Action:
	"""A battle action (attack, spell, ability)."""
	id: str
	name: str
	damage_type: DamageType = DamageType.PHYSICAL
	target_type: TargetType = TargetType.SINGLE_ENEMY
	element: Element = Element.NONE
	power: int = 100  # Base power
	accuracy: int = 100  # Hit rate %
	critical_rate: int = 5  # Crit chance %
	mp_cost: int = 0
	tp_cost: int = 0
	cooldown: int = 0  # Turns
	
	# Effects
	status_effects: List[StatusConfig] = field(default_factory=list)
	heal: bool = False
	drain: float = 0.0  # Fraction of damage to heal
	
	# Animation
	animation_id: int = 0
	sound_id: int = 0
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"id": self.id,
			"name": self.name,
			"damage_type": self.damage_type.name,
			"target_type": self.target_type.name,
			"element": self.element.value,
			"power": self.power,
			"accuracy": self.accuracy,
			"critical_rate": self.critical_rate,
			"mp_cost": self.mp_cost,
			"tp_cost": self.tp_cost,
			"cooldown": self.cooldown,
			"status_effects": [s.to_dict() for s in self.status_effects],
			"heal": self.heal,
			"drain": self.drain,
			"animation_id": self.animation_id,
			"sound_id": self.sound_id
		}


@dataclass
class CombatStats:
	"""Combat statistics for a battler."""
	hp: int = 100
	max_hp: int = 100
	mp: int = 50
	max_mp: int = 50
	attack: int = 10
	defense: int = 10
	magic: int = 10
	magic_defense: int = 10
	speed: int = 10
	luck: int = 10
	level: int = 1
	
	# Resistances
	element_resist: Dict[Element, float] = field(default_factory=dict)
	status_resist: Dict[StatusEffect, float] = field(default_factory=dict)
	
	# Active effects
	active_status: Dict[StatusEffect, int] = field(default_factory=dict)
	
	def get_effective_stat(self, stat_name: str) -> float:
		"""Get stat with modifiers applied."""
		base = getattr(self, stat_name, 0)
		modifier = 1.0
		
		# Apply status modifiers
		if StatusEffect.PROTECT in self.active_status and stat_name == "defense":
			modifier *= 1.5
		if StatusEffect.SHELL in self.active_status and stat_name == "magic_defense":
			modifier *= 1.5
		if StatusEffect.HASTE in self.active_status and stat_name == "speed":
			modifier *= 1.5
		if StatusEffect.SLOW in self.active_status and stat_name == "speed":
			modifier *= 0.5
		
		return base * modifier


@dataclass
class Battler:
	"""A participant in battle."""
	id: str
	name: str
	stats: CombatStats = field(default_factory=CombatStats)
	actions: List[Action] = field(default_factory=list)
	is_enemy: bool = False
	position: int = 0
	
	def is_alive(self) -> bool:
		"""Check if battler is alive."""
		return self.stats.hp > 0
	
	def can_act(self) -> bool:
		"""Check if battler can take action."""
		if not self.is_alive():
			return False
		
		blocking = [
			StatusEffect.SLEEP,
			StatusEffect.PARALYSIS,
			StatusEffect.PETRIFY,
			StatusEffect.STOP
		]
		
		for status in blocking:
			if status in self.stats.active_status:
				return False
		
		return True


class BattleCalculator:
	"""Calculate battle damage and effects."""
	
	def __init__(self):
		# Default formulas
		self.formulas: Dict[str, Formula] = {
			"physical_damage": Formula(
				name="Physical Damage",
				expression="max(1, (a_atk * power / 100) - d_def)",
				description="Standard physical damage formula"
			),
			"magic_damage": Formula(
				name="Magic Damage",
				expression="max(1, (a_mag * power / 100) - d_mdef)",
				description="Standard magic damage formula"
			),
			"heal": Formula(
				name="Healing",
				expression="a_mag * power / 100",
				description="Healing amount formula"
			),
			"hit_rate": Formula(
				name="Hit Rate",
				expression="min(100, accuracy + a_luck - d_luck / 2)",
				description="Hit rate calculation"
			),
			"critical_rate": Formula(
				name="Critical Rate",
				expression="crit_rate + a_luck / 10",
				description="Critical hit chance"
			),
			"escape_rate": Formula(
				name="Escape Rate",
				expression="50 + (a_speed - d_speed) * 2",
				description="Escape success rate"
			)
		}
	
	def calculate_damage(self, attacker: Battler, defender: Battler,
						 action: Action) -> Tuple[int, bool, bool]:
		"""Calculate damage from action.
		
		Returns: (damage, hit, critical)
		"""
		# Build variable dictionary
		variables = {
			"a_atk": attacker.stats.get_effective_stat("attack"),
			"a_str": attacker.stats.get_effective_stat("attack"),
			"a_mag": attacker.stats.get_effective_stat("magic"),
			"a_def": attacker.stats.get_effective_stat("defense"),
			"a_mdef": attacker.stats.get_effective_stat("magic_defense"),
			"a_speed": attacker.stats.get_effective_stat("speed"),
			"a_luck": attacker.stats.get_effective_stat("luck"),
			"a_lvl": attacker.stats.level,
			"d_atk": defender.stats.get_effective_stat("attack"),
			"d_def": defender.stats.get_effective_stat("defense"),
			"d_mdef": defender.stats.get_effective_stat("magic_defense"),
			"d_speed": defender.stats.get_effective_stat("speed"),
			"d_luck": defender.stats.get_effective_stat("luck"),
			"d_lvl": defender.stats.level,
			"power": action.power,
			"accuracy": action.accuracy,
			"crit_rate": action.critical_rate
		}
		
		# Check hit
		hit_formula = self.formulas.get("hit_rate")
		hit_chance = hit_formula.evaluate(variables) if hit_formula else action.accuracy
		hit = random.random() * 100 < hit_chance
		
		if not hit:
			return (0, False, False)
		
		# Calculate base damage
		if action.damage_type == DamageType.PHYSICAL:
			formula = self.formulas.get("physical_damage")
		elif action.damage_type == DamageType.MAGICAL:
			formula = self.formulas.get("magic_damage")
		elif action.damage_type == DamageType.FIXED:
			return (action.power, True, False)
		elif action.damage_type == DamageType.PERCENT:
			return (int(defender.stats.hp * action.power / 100), True, False)
		else:
			formula = self.formulas.get("physical_damage")
		
		damage = formula.evaluate(variables) if formula else action.power
		
		# Check critical
		crit_formula = self.formulas.get("critical_rate")
		crit_chance = crit_formula.evaluate(variables) if crit_formula else action.critical_rate
		critical = random.random() * 100 < crit_chance
		
		if critical:
			damage *= 1.5
		
		# Apply element resistance
		if action.element in defender.stats.element_resist:
			resist = defender.stats.element_resist[action.element]
			damage *= resist
		
		# Variance (±10%)
		damage *= 0.9 + random.random() * 0.2
		
		return (max(1, int(damage)), True, critical)
	
	def apply_action(self, attacker: Battler, defender: Battler,
					 action: Action) -> Dict[str, Any]:
		"""Apply action and return result."""
		result = {
			"action": action.name,
			"attacker": attacker.name,
			"defender": defender.name,
			"hit": False,
			"critical": False,
			"damage": 0,
			"healing": 0,
			"status_applied": [],
			"status_removed": []
		}
		
		if action.heal:
			# Healing action
			variables = {
				"a_mag": attacker.stats.get_effective_stat("magic"),
				"power": action.power
			}
			heal_formula = self.formulas.get("heal")
			healing = heal_formula.evaluate(variables) if heal_formula else action.power
			
			defender.stats.hp = min(
				defender.stats.max_hp,
				defender.stats.hp + int(healing)
			)
			result["hit"] = True
			result["healing"] = int(healing)
		else:
			# Damage action
			damage, hit, critical = self.calculate_damage(attacker, defender, action)
			result["hit"] = hit
			result["critical"] = critical
			result["damage"] = damage
			
			if hit:
				defender.stats.hp = max(0, defender.stats.hp - damage)
				
				# Drain
				if action.drain > 0:
					drain_amount = int(damage * action.drain)
					attacker.stats.hp = min(
						attacker.stats.max_hp,
						attacker.stats.hp + drain_amount
					)
					result["drain"] = drain_amount
		
		# Apply status effects
		for status_config in action.status_effects:
			# Check resist
			resist = defender.stats.status_resist.get(status_config.effect, 0)
			chance = status_config.inflict_chance * (1 - resist)
			
			if random.random() < chance:
				defender.stats.active_status[status_config.effect] = status_config.duration
				result["status_applied"].append(status_config.effect.name)
		
		return result


class BattleSystem:
	"""Complete battle system."""
	
	def __init__(self):
		self.calculator = BattleCalculator()
		self.parties: List[List[Battler]] = [[], []]  # Allies, Enemies
		self.turn_order: List[Battler] = []
		self.turn_count: int = 0
		self.battle_log: List[Dict[str, Any]] = []
	
	def add_ally(self, battler: Battler) -> None:
		"""Add ally to battle."""
		battler.is_enemy = False
		battler.position = len(self.parties[0])
		self.parties[0].append(battler)
	
	def add_enemy(self, battler: Battler) -> None:
		"""Add enemy to battle."""
		battler.is_enemy = True
		battler.position = len(self.parties[1])
		self.parties[1].append(battler)
	
	def calculate_turn_order(self) -> List[Battler]:
		"""Calculate turn order based on speed."""
		all_battlers = self.parties[0] + self.parties[1]
		active = [b for b in all_battlers if b.is_alive()]
		
		# Sort by speed
		self.turn_order = sorted(
			active,
			key=lambda b: b.stats.get_effective_stat("speed"),
			reverse=True
		)
		
		return self.turn_order
	
	def process_turn_start(self, battler: Battler) -> List[Dict[str, Any]]:
		"""Process effects at start of turn."""
		events = []
		
		# Process status effects
		for status, duration in list(battler.stats.active_status.items()):
			# Poison damage
			if status == StatusEffect.POISON:
				damage = battler.stats.max_hp // 10
				battler.stats.hp = max(0, battler.stats.hp - damage)
				events.append({
					"type": "status_damage",
					"status": status.name,
					"damage": damage
				})
			
			# Regen healing
			elif status == StatusEffect.REGEN:
				heal = battler.stats.max_hp // 10
				battler.stats.hp = min(battler.stats.max_hp, battler.stats.hp + heal)
				events.append({
					"type": "status_heal",
					"status": status.name,
					"heal": heal
				})
			
			# Reduce duration
			battler.stats.active_status[status] = duration - 1
			if duration <= 1:
				del battler.stats.active_status[status]
				events.append({
					"type": "status_expired",
					"status": status.name
				})
		
		return events
	
	def check_battle_end(self) -> Optional[int]:
		"""Check if battle has ended. Returns winning side or None."""
		allies_alive = any(b.is_alive() for b in self.parties[0])
		enemies_alive = any(b.is_alive() for b in self.parties[1])
		
		if not allies_alive:
			return 1  # Enemies win
		elif not enemies_alive:
			return 0  # Allies win
		return None
	
	def get_valid_targets(self, battler: Battler, 
						  target_type: TargetType) -> List[Battler]:
		"""Get valid targets for action."""
		allies = self.parties[0 if not battler.is_enemy else 1]
		enemies = self.parties[1 if not battler.is_enemy else 0]
		
		if target_type == TargetType.SINGLE_ENEMY:
			return [e for e in enemies if e.is_alive()]
		elif target_type == TargetType.ALL_ENEMIES:
			return [e for e in enemies if e.is_alive()]
		elif target_type == TargetType.SINGLE_ALLY:
			return [a for a in allies if a.is_alive()]
		elif target_type == TargetType.ALL_ALLIES:
			return [a for a in allies if a.is_alive()]
		elif target_type == TargetType.SELF:
			return [battler]
		elif target_type == TargetType.ALL:
			return [b for b in allies + enemies if b.is_alive()]
		
		return []
	
	def to_dict(self) -> Dict[str, Any]:
		"""Export battle system config."""
		return {
			"formulas": {k: v.to_dict() for k, v in self.calculator.formulas.items()},
			"turn_count": self.turn_count,
			"battle_log": self.battle_log
		}


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Battle System Editor")
	parser.add_argument("file", nargs="?", help="Config file")
	parser.add_argument("--formula", "-f", help="View formula")
	parser.add_argument("--simulate", "-s", action="store_true",
						help="Run simulation")
	parser.add_argument("--test", "-t", action="store_true",
						help="Run damage tests")
	parser.add_argument("--output", "-o", help="Output file")
	
	args = parser.parse_args()
	
	system = BattleSystem()
	
	if args.file and os.path.exists(args.file):
		with open(args.file, "r") as f:
			data = json.load(f)
		
		# Load formulas
		for name, formula_data in data.get("formulas", {}).items():
			system.calculator.formulas[name] = Formula(
				name=formula_data.get("name", name),
				expression=formula_data.get("expression", "0"),
				description=formula_data.get("description", "")
			)
		
		print(f"Loaded: {args.file}")
	
	# Show formula
	if args.formula:
		formula = system.calculator.formulas.get(args.formula)
		if formula:
			print(f"Formula: {formula.name}")
			print(f"Expression: {formula.expression}")
			print(f"Description: {formula.description}")
		else:
			print(f"Formula not found: {args.formula}")
			print("Available formulas:")
			for name in system.calculator.formulas:
				print(f"  - {name}")
		return
	
	# Run damage test
	if args.test:
		print("Damage Calculation Test")
		print("=" * 40)
		
		# Create test battlers
		attacker = Battler(
			id="test_attacker",
			name="Hero",
			stats=CombatStats(
				attack=50,
				magic=40,
				speed=30,
				luck=20,
				level=10
			)
		)
		
		defender = Battler(
			id="test_defender",
			name="Enemy",
			stats=CombatStats(
				hp=200,
				max_hp=200,
				defense=25,
				magic_defense=20,
				speed=20,
				luck=10,
				level=8
			),
			is_enemy=True
		)
		
		# Test physical attack
		attack = Action(
			id="attack",
			name="Attack",
			damage_type=DamageType.PHYSICAL,
			power=100,
			accuracy=95,
			critical_rate=5
		)
		
		print("\nPhysical Attack (Power: 100)")
		damages = []
		crits = 0
		misses = 0
		for _ in range(100):
			dmg, hit, crit = system.calculator.calculate_damage(
				attacker, defender, attack
			)
			if hit:
				damages.append(dmg)
				if crit:
					crits += 1
			else:
				misses += 1
		
		if damages:
			print(f"  Avg Damage: {sum(damages) / len(damages):.1f}")
			print(f"  Min/Max: {min(damages)}/{max(damages)}")
			print(f"  Crits: {crits}%")
			print(f"  Misses: {misses}%")
		
		# Test magic attack
		fire = Action(
			id="fire",
			name="Fire",
			damage_type=DamageType.MAGICAL,
			element=Element.FIRE,
			power=150,
			accuracy=100,
			critical_rate=3,
			mp_cost=5
		)
		
		print("\nMagic Attack (Power: 150, Fire)")
		damages = []
		for _ in range(100):
			dmg, hit, crit = system.calculator.calculate_damage(
				attacker, defender, fire
			)
			if hit:
				damages.append(dmg)
		
		if damages:
			print(f"  Avg Damage: {sum(damages) / len(damages):.1f}")
			print(f"  Min/Max: {min(damages)}/{max(damages)}")
		
		return
	
	# Run simulation
	if args.simulate:
		print("Battle Simulation")
		print("=" * 40)
		
		# Create parties
		hero = Battler(
			id="hero",
			name="Hero",
			stats=CombatStats(
				hp=150, max_hp=150,
				mp=30, max_mp=30,
				attack=40, defense=25,
				magic=35, magic_defense=20,
				speed=25, luck=15,
				level=10
			),
			actions=[
				Action(id="attack", name="Attack", power=100),
				Action(id="heal", name="Heal", heal=True, power=80,
					   target_type=TargetType.SINGLE_ALLY, mp_cost=5)
			]
		)
		
		slime = Battler(
			id="slime",
			name="Slime",
			stats=CombatStats(
				hp=30, max_hp=30,
				attack=15, defense=10,
				speed=12, luck=5,
				level=3
			),
			actions=[
				Action(id="attack", name="Attack", power=100)
			],
			is_enemy=True
		)
		
		system.add_ally(hero)
		system.add_enemy(slime)
		
		print(f"\n{hero.name} vs {slime.name}")
		print(f"{hero.name}: {hero.stats.hp}/{hero.stats.max_hp} HP")
		print(f"{slime.name}: {slime.stats.hp}/{slime.stats.max_hp} HP")
		
		# Simple simulation
		max_turns = 20
		for turn in range(1, max_turns + 1):
			system.turn_count = turn
			print(f"\n--- Turn {turn} ---")
			
			order = system.calculate_turn_order()
			
			for battler in order:
				if not battler.can_act():
					continue
				
				# Simple AI: attack
				action = battler.actions[0]
				targets = system.get_valid_targets(battler, action.target_type)
				
				if not targets:
					continue
				
				target = random.choice(targets)
				result = system.calculator.apply_action(battler, target, action)
				
				if result["hit"]:
					crit_str = " CRITICAL!" if result["critical"] else ""
					print(f"{battler.name} attacks {target.name} for {result['damage']} damage{crit_str}")
					print(f"  {target.name}: {target.stats.hp}/{target.stats.max_hp} HP")
				else:
					print(f"{battler.name} misses {target.name}")
			
			# Check end
			winner = system.check_battle_end()
			if winner is not None:
				winner_name = "Allies" if winner == 0 else "Enemies"
				print(f"\n{winner_name} win!")
				break
		
		return
	
	# Default: show info
	print("Battle System Editor")
	print()
	print("Usage: python battle_system.py [options]")
	print()
	print("Options:")
	print("  --formula NAME    View formula details")
	print("  --test            Run damage tests")
	print("  --simulate        Run battle simulation")
	print()
	print("Available formulas:")
	for name, formula in system.calculator.formulas.items():
		print(f"  {name}: {formula.description}")


if __name__ == "__main__":
	main()
