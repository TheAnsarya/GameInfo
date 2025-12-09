#!/usr/bin/env python3
"""
Status Effect System - Define and edit game status effects.

Tools for managing status effects, ailments, buffs, and debuffs
in RPG games.

Usage:
	python status_effects.py game.json --view
	python status_effects.py --edit poison
	python status_effects.py --export

Features:
	- Effect definitions
	- Duration/stacking
	- Cure conditions
	- Visual/audio
	- Resistance
"""

import argparse
import json
import os
from dataclasses import dataclass, field
from enum import Enum, Flag, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Set


class EffectCategory(Enum):
	"""Categories of status effects."""
	BUFF = auto()          # Positive effect
	DEBUFF = auto()        # Negative effect
	AILMENT = auto()       # Status ailment
	TRANSFORMATION = auto() # Form change
	SPECIAL = auto()        # Special states


class EffectTarget(Enum):
	"""What the effect modifies."""
	HP = auto()
	MP = auto()
	ATTACK = auto()
	DEFENSE = auto()
	AGILITY = auto()
	MAGIC = auto()
	ACCURACY = auto()
	EVASION = auto()
	CRITICAL = auto()
	ALL_STATS = auto()


class DurationType(Enum):
	"""How duration is measured."""
	TURNS = auto()         # Battle turns
	STEPS = auto()         # Walking steps
	TIME = auto()          # Real time
	PERMANENT = auto()     # Until cured
	END_OF_BATTLE = auto() # Cleared after battle


class TriggerType(Enum):
	"""When effect triggers."""
	TURN_START = auto()
	TURN_END = auto()
	ON_HIT = auto()
	ON_ATTACK = auto()
	ON_DAMAGE = auto()
	ON_CURE = auto()
	CONTINUOUS = auto()


class CureMethod(Flag):
	"""Methods to cure the effect."""
	NONE = 0
	ITEM = auto()
	SPELL = auto()
	REST = auto()
	TIME = auto()
	DAMAGE = auto()
	DEATH = auto()
	BATTLE_END = auto()
	SPECIFIC = auto()


@dataclass
class StatModifier:
	"""Modification to a stat."""
	target: EffectTarget
	value: int
	is_percent: bool = False

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"target": self.target.name,
			"value": self.value,
			"is_percent": self.is_percent
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "StatModifier":
		"""Create from dictionary."""
		return cls(
			target=EffectTarget[data.get("target", "HP")],
			value=data.get("value", 0),
			is_percent=data.get("is_percent", False)
		)


@dataclass
class DamageOverTime:
	"""Damage or healing over time."""
	amount: int
	is_percent: bool = False   # Percent of max HP
	trigger: TriggerType = TriggerType.TURN_END
	can_kill: bool = True

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"amount": self.amount,
			"is_percent": self.is_percent,
			"trigger": self.trigger.name,
			"can_kill": self.can_kill
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "DamageOverTime":
		"""Create from dictionary."""
		return cls(
			amount=data.get("amount", 0),
			is_percent=data.get("is_percent", False),
			trigger=TriggerType[data.get("trigger", "TURN_END")],
			can_kill=data.get("can_kill", True)
		)


@dataclass
class StatusEffect:
	"""Complete status effect definition."""
	id: int
	name: str
	internal_name: str = ""
	description: str = ""
	category: EffectCategory = EffectCategory.DEBUFF

	# Duration
	duration_type: DurationType = DurationType.TURNS
	base_duration: int = 3
	max_duration: int = 99

	# Stacking
	can_stack: bool = False
	max_stacks: int = 1
	stack_refresh: bool = True  # Refresh duration on reapply

	# Effects
	stat_mods: List[StatModifier] = field(default_factory=list)
	damage_over_time: Optional[DamageOverTime] = None

	# Behavior
	prevents_action: bool = False
	prevents_movement: bool = False
	prevents_magic: bool = False
	auto_attack_ally: bool = False  # Confusion
	reverses_healing: bool = False  # Zombie

	# Cure
	cure_methods: CureMethod = CureMethod.ITEM | CureMethod.SPELL
	cure_items: List[int] = field(default_factory=list)
	cure_spells: List[int] = field(default_factory=list)
	cure_chance: int = 100  # Success rate

	# Visual/Audio
	animation_id: int = 0
	icon_id: int = 0
	color_tint: Tuple[int, int, int] = (255, 255, 255)
	sound_id: int = 0

	# Priority (for conflicting effects)
	priority: int = 0

	# Exclusivity
	exclusive_with: List[int] = field(default_factory=list)  # Effect IDs
	replaces: List[int] = field(default_factory=list)

	def is_beneficial(self) -> bool:
		"""Check if effect is beneficial."""
		return self.category == EffectCategory.BUFF

	def is_harmful(self) -> bool:
		"""Check if effect is harmful."""
		return self.category in [EffectCategory.DEBUFF, EffectCategory.AILMENT]

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"id": self.id,
			"name": self.name,
			"internal_name": self.internal_name,
			"description": self.description,
			"category": self.category.name,
			"duration_type": self.duration_type.name,
			"base_duration": self.base_duration,
			"max_duration": self.max_duration,
			"can_stack": self.can_stack,
			"max_stacks": self.max_stacks,
			"stack_refresh": self.stack_refresh,
			"stat_mods": [m.to_dict() for m in self.stat_mods],
			"damage_over_time": self.damage_over_time.to_dict() if self.damage_over_time else None,
			"prevents_action": self.prevents_action,
			"prevents_movement": self.prevents_movement,
			"prevents_magic": self.prevents_magic,
			"auto_attack_ally": self.auto_attack_ally,
			"reverses_healing": self.reverses_healing,
			"cure_methods": self.cure_methods.value,
			"cure_items": self.cure_items,
			"cure_spells": self.cure_spells,
			"cure_chance": self.cure_chance,
			"animation_id": self.animation_id,
			"icon_id": self.icon_id,
			"color_tint": list(self.color_tint),
			"sound_id": self.sound_id,
			"priority": self.priority,
			"exclusive_with": self.exclusive_with,
			"replaces": self.replaces
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "StatusEffect":
		"""Create from dictionary."""
		stat_mods = [StatModifier.from_dict(m) for m in data.get("stat_mods", [])]
		dot_data = data.get("damage_over_time")
		dot = DamageOverTime.from_dict(dot_data) if dot_data else None

		return cls(
			id=data.get("id", 0),
			name=data.get("name", ""),
			internal_name=data.get("internal_name", ""),
			description=data.get("description", ""),
			category=EffectCategory[data.get("category", "DEBUFF")],
			duration_type=DurationType[data.get("duration_type", "TURNS")],
			base_duration=data.get("base_duration", 3),
			max_duration=data.get("max_duration", 99),
			can_stack=data.get("can_stack", False),
			max_stacks=data.get("max_stacks", 1),
			stack_refresh=data.get("stack_refresh", True),
			stat_mods=stat_mods,
			damage_over_time=dot,
			prevents_action=data.get("prevents_action", False),
			prevents_movement=data.get("prevents_movement", False),
			prevents_magic=data.get("prevents_magic", False),
			auto_attack_ally=data.get("auto_attack_ally", False),
			reverses_healing=data.get("reverses_healing", False),
			cure_methods=CureMethod(data.get("cure_methods", CureMethod.ITEM.value | CureMethod.SPELL.value)),
			cure_items=data.get("cure_items", []),
			cure_spells=data.get("cure_spells", []),
			cure_chance=data.get("cure_chance", 100),
			animation_id=data.get("animation_id", 0),
			icon_id=data.get("icon_id", 0),
			color_tint=tuple(data.get("color_tint", [255, 255, 255])),
			sound_id=data.get("sound_id", 0),
			priority=data.get("priority", 0),
			exclusive_with=data.get("exclusive_with", []),
			replaces=data.get("replaces", [])
		)


@dataclass
class ResistanceEntry:
	"""Resistance to a status effect."""
	effect_id: int
	resist_chance: int = 0      # Percent chance to resist
	immunity: bool = False
	vulnerability: int = 0       # Extra chance to be inflicted

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"effect_id": self.effect_id,
			"resist_chance": self.resist_chance,
			"immunity": self.immunity,
			"vulnerability": self.vulnerability
		}


class StatusEffectManager:
	"""Manage status effects."""

	def __init__(self):
		self.effects: Dict[int, StatusEffect] = {}
		self.by_name: Dict[str, int] = {}

	def add_effect(self, effect: StatusEffect) -> None:
		"""Add status effect."""
		self.effects[effect.id] = effect
		self.by_name[effect.name.lower()] = effect.id
		if effect.internal_name:
			self.by_name[effect.internal_name.lower()] = effect.id

	def get_effect(self, effect_id: int) -> Optional[StatusEffect]:
		"""Get effect by ID."""
		return self.effects.get(effect_id)

	def get_by_name(self, name: str) -> Optional[StatusEffect]:
		"""Get effect by name."""
		effect_id = self.by_name.get(name.lower())
		if effect_id is not None:
			return self.effects.get(effect_id)
		return None

	def get_buffs(self) -> List[StatusEffect]:
		"""Get all buff effects."""
		return [e for e in self.effects.values()
				if e.category == EffectCategory.BUFF]

	def get_debuffs(self) -> List[StatusEffect]:
		"""Get all debuff effects."""
		return [e for e in self.effects.values()
				if e.category == EffectCategory.DEBUFF]

	def get_ailments(self) -> List[StatusEffect]:
		"""Get all ailment effects."""
		return [e for e in self.effects.values()
				if e.category == EffectCategory.AILMENT]

	def get_disabling(self) -> List[StatusEffect]:
		"""Get effects that disable actions."""
		return [e for e in self.effects.values()
				if e.prevents_action or e.prevents_movement]

	def format_effect(self, effect_id: int) -> str:
		"""Format effect for display."""
		effect = self.effects.get(effect_id)
		if not effect:
			return f"Effect {effect_id}: Not found"

		lines = [
			f"{effect.name} ({effect.internal_name})",
			f"  Category: {effect.category.name}",
			f"  Duration: {effect.base_duration} {effect.duration_type.name.lower()}"
		]

		if effect.stat_mods:
			lines.append("  Stat Modifiers:")
			for mod in effect.stat_mods:
				sign = "+" if mod.value > 0 else ""
				suffix = "%" if mod.is_percent else ""
				lines.append(f"    {mod.target.name}: {sign}{mod.value}{suffix}")

		if effect.damage_over_time:
			dot = effect.damage_over_time
			suffix = "% max HP" if dot.is_percent else " HP"
			lines.append(f"  DoT: {dot.amount}{suffix} per {dot.trigger.name.lower()}")

		flags = []
		if effect.prevents_action:
			flags.append("No Action")
		if effect.prevents_movement:
			flags.append("No Movement")
		if effect.prevents_magic:
			flags.append("No Magic")
		if effect.auto_attack_ally:
			flags.append("Attacks Allies")

		if flags:
			lines.append(f"  Flags: {', '.join(flags)}")

		if effect.description:
			lines.append(f"  Description: {effect.description}")

		return "\n".join(lines)

	def create_standard_effects(self) -> None:
		"""Create standard RPG status effects."""
		# Poison
		self.add_effect(StatusEffect(
			id=1, name="Poison", internal_name="PSN",
			description="Take damage each turn",
			category=EffectCategory.AILMENT,
			duration_type=DurationType.PERMANENT,
			damage_over_time=DamageOverTime(amount=5, is_percent=True, can_kill=False),
			icon_id=1, color_tint=(128, 255, 128)
		))

		# Sleep
		self.add_effect(StatusEffect(
			id=2, name="Sleep", internal_name="SLP",
			description="Cannot act until woken",
			category=EffectCategory.AILMENT,
			duration_type=DurationType.TURNS,
			base_duration=3,
			prevents_action=True,
			cure_methods=CureMethod.ITEM | CureMethod.SPELL | CureMethod.DAMAGE,
			icon_id=2, color_tint=(128, 128, 255)
		))

		# Paralysis
		self.add_effect(StatusEffect(
			id=3, name="Paralysis", internal_name="PAR",
			description="Cannot move or act",
			category=EffectCategory.AILMENT,
			duration_type=DurationType.TURNS,
			base_duration=5,
			prevents_action=True,
			prevents_movement=True,
			icon_id=3, color_tint=(255, 255, 128)
		))

		# Confusion
		self.add_effect(StatusEffect(
			id=4, name="Confusion", internal_name="CNF",
			description="May attack allies",
			category=EffectCategory.AILMENT,
			duration_type=DurationType.TURNS,
			base_duration=3,
			auto_attack_ally=True,
			icon_id=4, color_tint=(255, 128, 255)
		))

		# Silence
		self.add_effect(StatusEffect(
			id=5, name="Silence", internal_name="SIL",
			description="Cannot cast spells",
			category=EffectCategory.AILMENT,
			duration_type=DurationType.PERMANENT,
			prevents_magic=True,
			icon_id=5, color_tint=(128, 128, 128)
		))

		# Attack Up
		self.add_effect(StatusEffect(
			id=10, name="Attack Up", internal_name="ATK+",
			description="Attack power increased",
			category=EffectCategory.BUFF,
			duration_type=DurationType.END_OF_BATTLE,
			stat_mods=[StatModifier(EffectTarget.ATTACK, 25, True)],
			icon_id=10, color_tint=(255, 128, 128)
		))

		# Defense Up
		self.add_effect(StatusEffect(
			id=11, name="Defense Up", internal_name="DEF+",
			description="Defense power increased",
			category=EffectCategory.BUFF,
			duration_type=DurationType.END_OF_BATTLE,
			stat_mods=[StatModifier(EffectTarget.DEFENSE, 25, True)],
			icon_id=11, color_tint=(128, 128, 255)
		))

		# Haste
		self.add_effect(StatusEffect(
			id=12, name="Haste", internal_name="HST",
			description="Agility increased",
			category=EffectCategory.BUFF,
			duration_type=DurationType.END_OF_BATTLE,
			stat_mods=[StatModifier(EffectTarget.AGILITY, 50, True)],
			icon_id=12, color_tint=(255, 255, 128)
		))

		# Regeneration
		self.add_effect(StatusEffect(
			id=13, name="Regeneration", internal_name="RGN",
			description="Recover HP each turn",
			category=EffectCategory.BUFF,
			duration_type=DurationType.END_OF_BATTLE,
			damage_over_time=DamageOverTime(amount=-5, is_percent=True),
			icon_id=13, color_tint=(128, 255, 128)
		))

	def save(self, filepath: str) -> None:
		"""Save effects to file."""
		data = {
			"effects": [e.to_dict() for e in self.effects.values()]
		}

		with open(filepath, "w") as f:
			json.dump(data, f, indent="\t")

	def load(self, filepath: str) -> None:
		"""Load effects from file."""
		with open(filepath, "r") as f:
			data = json.load(f)

		self.effects = {}
		self.by_name = {}

		for e_data in data.get("effects", []):
			effect = StatusEffect.from_dict(e_data)
			self.add_effect(effect)


# Need this import for type hint
from typing import Tuple


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Status Effect System")
	parser.add_argument("input", nargs="?", help="Input file")
	parser.add_argument("--view", "-v", action="store_true",
						help="View all effects")
	parser.add_argument("--effect", "-e", help="View specific effect (ID or name)")
	parser.add_argument("--buffs", action="store_true",
						help="List buff effects")
	parser.add_argument("--debuffs", action="store_true",
						help="List debuff effects")
	parser.add_argument("--ailments", action="store_true",
						help="List ailment effects")
	parser.add_argument("--create-standard", action="store_true",
						help="Create standard RPG effects")
	parser.add_argument("--output", "-o", help="Output file")

	args = parser.parse_args()

	manager = StatusEffectManager()

	# Load existing
	if args.input and os.path.exists(args.input):
		manager.load(args.input)
		print(f"Loaded {len(manager.effects)} effects")

	# Create standard effects
	if args.create_standard:
		manager.create_standard_effects()
		print("Created standard effects")

	# View specific effect
	if args.effect:
		try:
			effect_id = int(args.effect)
			print(manager.format_effect(effect_id))
		except ValueError:
			effect = manager.get_by_name(args.effect)
			if effect:
				print(manager.format_effect(effect.id))
			else:
				print(f"Effect not found: {args.effect}")
		return

	# List buffs
	if args.buffs:
		print("Buff Effects:")
		for e in manager.get_buffs():
			mods = ", ".join(f"{m.target.name} {'+' if m.value > 0 else ''}{m.value}{'%' if m.is_percent else ''}"
							 for m in e.stat_mods)
			print(f"  {e.id:3}: {e.name:<15} - {mods}")
		return

	# List debuffs
	if args.debuffs:
		print("Debuff Effects:")
		for e in manager.get_debuffs():
			print(f"  {e.id:3}: {e.name:<15} - {e.description}")
		return

	# List ailments
	if args.ailments:
		print("Ailment Effects:")
		for e in manager.get_ailments():
			flags = []
			if e.prevents_action:
				flags.append("No Act")
			if e.prevents_magic:
				flags.append("No Magic")
			if e.damage_over_time:
				flags.append("DoT")
			print(f"  {e.id:3}: {e.name:<15} [{', '.join(flags)}]")
		return

	# View all
	if args.view:
		print("Status Effects:")
		for effect_id in sorted(manager.effects.keys()):
			e = manager.effects[effect_id]
			print(f"  {e.id:3}: {e.name:<15} ({e.category.name})")
		return

	# Save
	if args.output:
		manager.save(args.output)
		print(f"Saved to {args.output}")
		return

	if not args.input and not args.create_standard:
		print("Status Effect System")
		print()
		print("Usage: python status_effects.py <input> [options]")
		print()
		print("Options:")
		print("  --view, -v           View all effects")
		print("  --effect, -e ID      View specific effect")
		print("  --buffs              List buff effects")
		print("  --debuffs            List debuff effects")
		print("  --ailments           List ailment effects")
		print("  --create-standard    Create standard effects")
		print("  --output, -o FILE    Output file")
		print()
		print("Examples:")
		print("  Create standard effects:")
		print("    python status_effects.py --create-standard -o effects.json")
		print()
		print("  View poison effect:")
		print("    python status_effects.py effects.json -e poison")


if __name__ == "__main__":
	main()
