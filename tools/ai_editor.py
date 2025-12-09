#!/usr/bin/env python3
"""
AI/Tactics Editor - Edit AI behavior and tactics settings.

Tools for working with monster and ally AI patterns in RPGs.

Usage:
	python ai_editor.py --analyze ai_table.bin
	python ai_editor.py --edit ai.json
	python ai_editor.py --create monster --output ai.json

Features:
	- AI behavior patterns
	- Action weights/priorities
	- Condition triggers
	- Target selection
	- Tactics presets
"""

import argparse
import json
import struct
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


class AIType(Enum):
	"""AI behavior types."""
	RANDOM = 0           # Random action selection
	WEIGHTED = 1         # Weighted probabilities
	SCRIPTED = 2         # Fixed action sequence
	REACTIVE = 3         # React to conditions
	TACTICAL = 4         # Tactical decision making


class ActionType(Enum):
	"""Action types."""
	ATTACK = 0
	SKILL = 1
	MAGIC = 2
	ITEM = 3
	DEFEND = 4
	FLEE = 5
	WAIT = 6
	SPECIAL = 7


class TargetType(Enum):
	"""Target selection types."""
	RANDOM = 0           # Random target
	LOWEST_HP = 1        # Target with lowest HP
	HIGHEST_HP = 2       # Target with highest HP
	LOWEST_DEF = 3       # Target with lowest defense
	MOST_THREAT = 4      # Highest damage dealer
	LEADER = 5           # Party leader
	SELF = 6             # Self
	ALL_ENEMIES = 7      # All enemies
	ALL_ALLIES = 8       # All allies
	WEAKEST = 9          # Lowest level


class ConditionType(Enum):
	"""AI condition triggers."""
	NONE = 0
	HP_BELOW = 1         # HP below threshold
	HP_ABOVE = 2         # HP above threshold
	ALLY_LOW = 3         # Ally HP low
	STATUS_SET = 4       # Has status effect
	STATUS_CLEAR = 5     # Doesn't have status
	TURN_NUM = 6         # Specific turn number
	ALONE = 7            # Only one remaining
	ENEMY_COUNT = 8      # Enemy count condition


@dataclass
class AICondition:
	"""A condition for AI decisions."""
	condition_type: ConditionType = ConditionType.NONE
	threshold: int = 0
	param: int = 0       # Additional parameter

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"type": self.condition_type.name,
			"threshold": self.threshold,
			"param": self.param
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "AICondition":
		"""Create from dictionary."""
		return cls(
			condition_type=ConditionType[data.get("type", "NONE")],
			threshold=data.get("threshold", 0),
			param=data.get("param", 0)
		)


@dataclass
class AIAction:
	"""An AI action entry."""
	action_id: int
	action_type: ActionType

	# What to use
	skill_id: int = 0    # Skill/spell/item ID
	name: str = ""       # Display name

	# Target selection
	target_type: TargetType = TargetType.RANDOM

	# Priority/weight
	weight: int = 100    # Selection weight (0-255)
	priority: int = 0    # Higher = checked first

	# Conditions
	condition: Optional[AICondition] = None

	# Usage limits
	max_uses: int = 0    # 0 = unlimited
	cooldown: int = 0    # Turns between uses

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"action_id": self.action_id,
			"action_type": self.action_type.name,
			"skill_id": self.skill_id,
			"name": self.name,
			"target_type": self.target_type.name,
			"weight": self.weight,
			"priority": self.priority,
			"max_uses": self.max_uses,
			"cooldown": self.cooldown
		}
		if self.condition:
			result["condition"] = self.condition.to_dict()
		return result

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "AIAction":
		"""Create from dictionary."""
		condition = None
		if "condition" in data:
			condition = AICondition.from_dict(data["condition"])

		return cls(
			action_id=data.get("action_id", 0),
			action_type=ActionType[data.get("action_type", "ATTACK")],
			skill_id=data.get("skill_id", 0),
			name=data.get("name", ""),
			target_type=TargetType[data.get("target_type", "RANDOM")],
			weight=data.get("weight", 100),
			priority=data.get("priority", 0),
			max_uses=data.get("max_uses", 0),
			cooldown=data.get("cooldown", 0),
			condition=condition
		)


@dataclass
class AIPattern:
	"""Complete AI pattern for an entity."""
	pattern_id: int
	name: str = ""
	ai_type: AIType = AIType.WEIGHTED

	# Actions
	actions: List[AIAction] = field(default_factory=list)

	# Global settings
	aggression: int = 50     # 0-100, affects target selection
	defensiveness: int = 50  # 0-100, affects healing priority
	intelligence: int = 50   # 0-100, affects smart decisions

	# Phase changes (boss patterns)
	phases: Dict[int, List[int]] = field(default_factory=dict)  # HP% -> action IDs

	def get_available_actions(self, hp_percent: int = 100) -> List[AIAction]:
		"""Get actions available at current HP."""
		# Check for phase-specific actions
		available_ids = None
		for threshold, action_ids in sorted(self.phases.items(), reverse=True):
			if hp_percent <= threshold:
				available_ids = set(action_ids)
				break

		if available_ids is None:
			return self.actions

		return [a for a in self.actions if a.action_id in available_ids]

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"pattern_id": self.pattern_id,
			"name": self.name,
			"ai_type": self.ai_type.name,
			"actions": [a.to_dict() for a in self.actions],
			"aggression": self.aggression,
			"defensiveness": self.defensiveness,
			"intelligence": self.intelligence,
			"phases": self.phases
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "AIPattern":
		"""Create from dictionary."""
		pattern = cls(
			pattern_id=data.get("pattern_id", 0),
			name=data.get("name", ""),
			ai_type=AIType[data.get("ai_type", "WEIGHTED")],
			aggression=data.get("aggression", 50),
			defensiveness=data.get("defensiveness", 50),
			intelligence=data.get("intelligence", 50),
			phases={int(k): v for k, v in data.get("phases", {}).items()}
		)

		for action_data in data.get("actions", []):
			pattern.actions.append(AIAction.from_dict(action_data))

		return pattern


@dataclass
class TacticsPreset:
	"""Ally tactics preset."""
	preset_id: int
	name: str
	description: str = ""

	# Behavior weights
	attack_weight: int = 50
	magic_weight: int = 25
	heal_weight: int = 25
	defend_weight: int = 0

	# Thresholds
	heal_threshold: int = 50    # HP% to start healing
	mp_conserve: int = 25       # MP% to conserve

	# Target priority
	target_priority: TargetType = TargetType.RANDOM

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"preset_id": self.preset_id,
			"name": self.name,
			"description": self.description,
			"attack_weight": self.attack_weight,
			"magic_weight": self.magic_weight,
			"heal_weight": self.heal_weight,
			"defend_weight": self.defend_weight,
			"heal_threshold": self.heal_threshold,
			"mp_conserve": self.mp_conserve,
			"target_priority": self.target_priority.name
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "TacticsPreset":
		"""Create from dictionary."""
		return cls(
			preset_id=data.get("preset_id", 0),
			name=data.get("name", ""),
			description=data.get("description", ""),
			attack_weight=data.get("attack_weight", 50),
			magic_weight=data.get("magic_weight", 25),
			heal_weight=data.get("heal_weight", 25),
			defend_weight=data.get("defend_weight", 0),
			heal_threshold=data.get("heal_threshold", 50),
			mp_conserve=data.get("mp_conserve", 25),
			target_priority=TargetType[data.get("target_priority", "RANDOM")]
		)


class AIEditor:
	"""Editor for AI patterns and tactics."""

	def __init__(self):
		self.patterns: Dict[int, AIPattern] = {}
		self.tactics: Dict[int, TacticsPreset] = {}

	def create_pattern(self, pattern_id: int, name: str = "",
					  ai_type: AIType = AIType.WEIGHTED) -> AIPattern:
		"""Create a new AI pattern."""
		pattern = AIPattern(
			pattern_id=pattern_id,
			name=name or f"Pattern_{pattern_id}",
			ai_type=ai_type
		)
		self.patterns[pattern_id] = pattern
		return pattern

	def add_action(self, pattern_id: int, action: AIAction) -> bool:
		"""Add action to pattern."""
		if pattern_id in self.patterns:
			self.patterns[pattern_id].actions.append(action)
			return True
		return False

	def create_tactics(self, preset_id: int, name: str,
					  description: str = "") -> TacticsPreset:
		"""Create a new tactics preset."""
		preset = TacticsPreset(
			preset_id=preset_id,
			name=name,
			description=description
		)
		self.tactics[preset_id] = preset
		return preset

	def load_binary(self, path: Path, format_spec: Dict) -> List[AIPattern]:
		"""Load AI data from binary."""
		data = path.read_bytes()
		patterns = []

		offset = format_spec.get("offset", 0)
		entry_size = format_spec.get("entry_size", 8)
		entry_count = format_spec.get("entry_count", 1)
		actions_per_entry = format_spec.get("actions_per_entry", 4)

		for i in range(entry_count):
			entry_offset = offset + i * entry_size

			if entry_offset + entry_size <= len(data):
				pattern = AIPattern(pattern_id=i, name=f"Monster_{i}")

				# Simple format: action_id, weight pairs
				for j in range(actions_per_entry):
					action_offset = entry_offset + j * 2
					if action_offset + 2 <= len(data):
						action_id = data[action_offset]
						weight = data[action_offset + 1]

						if action_id > 0 or weight > 0:
							action = AIAction(
								action_id=j,
								action_type=ActionType.SKILL if action_id > 0 else ActionType.ATTACK,
								skill_id=action_id,
								weight=weight
							)
							pattern.actions.append(action)

				patterns.append(pattern)
				self.patterns[i] = pattern

		return patterns

	def save_binary(self, path: Path, format_spec: Dict):
		"""Save AI data to binary."""
		entry_size = format_spec.get("entry_size", 8)
		actions_per_entry = format_spec.get("actions_per_entry", 4)

		data = bytearray()

		for pattern in self.patterns.values():
			entry_data = bytearray(entry_size)

			for i, action in enumerate(pattern.actions[:actions_per_entry]):
				offset = i * 2
				entry_data[offset] = action.skill_id & 0xFF
				entry_data[offset + 1] = action.weight & 0xFF

			data.extend(entry_data)

		path.write_bytes(data)

	def load_json(self, path: Path):
		"""Load from JSON."""
		with open(path) as f:
			data = json.load(f)

		for pattern_data in data.get("patterns", []):
			pattern = AIPattern.from_dict(pattern_data)
			self.patterns[pattern.pattern_id] = pattern

		for preset_data in data.get("tactics", []):
			preset = TacticsPreset.from_dict(preset_data)
			self.tactics[preset.preset_id] = preset

	def save_json(self, path: Path):
		"""Save to JSON."""
		data = {
			"patterns": [p.to_dict() for p in self.patterns.values()],
			"tactics": [t.to_dict() for t in self.tactics.values()]
		}

		with open(path, "w") as f:
			json.dump(data, f, indent="\t")

	def format_pattern(self, pattern: AIPattern) -> str:
		"""Format AI pattern for display."""
		lines = []
		lines.append(f"AI Pattern: {pattern.name} (ID: {pattern.pattern_id})")
		lines.append("=" * 60)
		lines.append(f"Type: {pattern.ai_type.name}")
		lines.append(f"Aggression: {pattern.aggression}")
		lines.append(f"Defensiveness: {pattern.defensiveness}")
		lines.append(f"Intelligence: {pattern.intelligence}")
		lines.append("")
		lines.append("Actions:")
		lines.append("-" * 60)
		lines.append(f"{'ID':>4} {'Type':<10} {'Skill':>5} {'Weight':>6} {'Target':<12} {'Condition':<15}")
		lines.append("-" * 60)

		for action in pattern.actions:
			cond_str = ""
			if action.condition:
				cond_str = f"{action.condition.condition_type.name}"

			lines.append(
				f"{action.action_id:>4} {action.action_type.name:<10} "
				f"{action.skill_id:>5} {action.weight:>6} "
				f"{action.target_type.name:<12} {cond_str:<15}"
			)

		if pattern.phases:
			lines.append("")
			lines.append("Phases:")
			for hp_threshold, action_ids in sorted(pattern.phases.items(), reverse=True):
				lines.append(f"  HP <= {hp_threshold}%: Actions {action_ids}")

		return "\n".join(lines)

	def format_tactics(self, preset: TacticsPreset) -> str:
		"""Format tactics preset for display."""
		lines = []
		lines.append(f"Tactics Preset: {preset.name} (ID: {preset.preset_id})")
		lines.append("=" * 50)
		if preset.description:
			lines.append(f"Description: {preset.description}")
		lines.append("")
		lines.append("Weights:")
		lines.append(f"  Attack: {preset.attack_weight}")
		lines.append(f"  Magic: {preset.magic_weight}")
		lines.append(f"  Heal: {preset.heal_weight}")
		lines.append(f"  Defend: {preset.defend_weight}")
		lines.append("")
		lines.append("Thresholds:")
		lines.append(f"  Heal at: {preset.heal_threshold}% HP")
		lines.append(f"  Conserve MP at: {preset.mp_conserve}%")
		lines.append(f"  Target Priority: {preset.target_priority.name}")

		return "\n".join(lines)

	def analyze_pattern(self, pattern: AIPattern) -> Dict[str, Any]:
		"""Analyze AI pattern."""
		total_weight = sum(a.weight for a in pattern.actions)

		action_types = {}
		for action in pattern.actions:
			type_name = action.action_type.name
			action_types[type_name] = action_types.get(type_name, 0) + 1

		conditional_count = sum(1 for a in pattern.actions if a.condition)

		return {
			"name": pattern.name,
			"ai_type": pattern.ai_type.name,
			"action_count": len(pattern.actions),
			"total_weight": total_weight,
			"action_types": action_types,
			"conditional_actions": conditional_count,
			"phase_count": len(pattern.phases),
			"aggression": pattern.aggression,
			"defensiveness": pattern.defensiveness,
			"intelligence": pattern.intelligence
		}


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="AI/Tactics Editor")
	parser.add_argument("--analyze", "-a", type=Path,
						help="Analyze AI file")
	parser.add_argument("--create", "-c", type=str,
						choices=["monster", "ally", "boss"],
						help="Create sample AI")
	parser.add_argument("--input", "-i", type=Path,
						help="Input JSON file")
	parser.add_argument("--output", "-o", type=Path,
						help="Output file")
	parser.add_argument("--tactics", "-t", action="store_true",
						help="Show tactics presets")

	args = parser.parse_args()
	editor = AIEditor()

	if args.input:
		editor.load_json(args.input)

		if args.tactics:
			for preset in editor.tactics.values():
				print(editor.format_tactics(preset))
				print()
		else:
			for pattern in editor.patterns.values():
				print(editor.format_pattern(pattern))
				print()
		return

	if args.create:
		if args.create == "monster":
			pattern = editor.create_pattern(0, "Slime", AIType.WEIGHTED)
			pattern.aggression = 60
			pattern.defensiveness = 20
			pattern.intelligence = 30

			pattern.actions = [
				AIAction(0, ActionType.ATTACK, name="Attack", weight=80),
				AIAction(1, ActionType.SKILL, skill_id=1, name="Tackle", weight=20)
			]

		elif args.create == "ally":
			pattern = editor.create_pattern(0, "Healer", AIType.REACTIVE)
			pattern.aggression = 20
			pattern.defensiveness = 80
			pattern.intelligence = 70

			pattern.actions = [
				AIAction(0, ActionType.ATTACK, name="Attack", weight=30),
				AIAction(1, ActionType.MAGIC, skill_id=5, name="Heal", weight=50,
						condition=AICondition(ConditionType.ALLY_LOW, 50)),
				AIAction(2, ActionType.MAGIC, skill_id=10, name="Fire", weight=40)
			]

			# Create tactics presets
			editor.create_tactics(0, "Fight Wisely",
				"Balance between attack and support")
			editor.create_tactics(1, "Show No Mercy",
				"Focus on attacking enemies")
			editor.tactics[1].attack_weight = 80
			editor.tactics[1].heal_weight = 10
			editor.create_tactics(2, "Don't Use MP",
				"Conserve magical power")
			editor.tactics[2].magic_weight = 0
			editor.tactics[2].mp_conserve = 100

		elif args.create == "boss":
			pattern = editor.create_pattern(0, "Dragon Boss", AIType.TACTICAL)
			pattern.aggression = 80
			pattern.defensiveness = 40
			pattern.intelligence = 90

			pattern.actions = [
				AIAction(0, ActionType.ATTACK, name="Claw", weight=40),
				AIAction(1, ActionType.SKILL, skill_id=20, name="Fire Breath",
						weight=30, target_type=TargetType.ALL_ENEMIES),
				AIAction(2, ActionType.SKILL, skill_id=21, name="Tail Swipe",
						weight=20, target_type=TargetType.ALL_ENEMIES),
				AIAction(3, ActionType.MAGIC, skill_id=30, name="Heal",
						weight=10, target_type=TargetType.SELF,
						condition=AICondition(ConditionType.HP_BELOW, 30)),
				AIAction(4, ActionType.SKILL, skill_id=25, name="Rampage",
						weight=50)
			]

			# Boss phases
			pattern.phases = {
				75: [0, 1, 2],      # Above 75%: normal attacks
				50: [0, 1, 2, 3],   # 50-75%: add heal
				25: [1, 2, 3, 4]    # Below 25%: desperate attacks
			}

		for pattern in editor.patterns.values():
			print(editor.format_pattern(pattern))
			print()

			analysis = editor.analyze_pattern(pattern)
			print("Analysis:")
			for k, v in analysis.items():
				print(f"  {k}: {v}")

		if editor.tactics:
			print()
			for preset in editor.tactics.values():
				print(editor.format_tactics(preset))
				print()

		if args.output:
			editor.save_json(args.output)
			print(f"\nSaved to: {args.output}")
		return

	# Default: show help
	print("AI/Tactics Editor")
	print()
	print("Usage:")
	print("  --create TYPE            Create sample AI (monster, ally, boss)")
	print("  --input FILE             Load from JSON")
	print("  --tactics                Show tactics presets")
	print("  --output FILE            Save to file")


if __name__ == "__main__":
	main()
