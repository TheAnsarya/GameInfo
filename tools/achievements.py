#!/usr/bin/env python3
"""
Achievement System Manager - Design game achievements and trophies.

Tools for creating, tracking, and validating game achievements
with unlock conditions and rewards.

Usage:
	python achievements.py <achievements.json>
	python achievements.py --list
	python achievements.py --validate

Features:
	- Achievement definition
	- Progress tracking
	- Unlock condition logic
	- Rarity classification
	- Reward association
"""

import argparse
import json
import os
import sys
from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum, auto
from pathlib import Path
from typing import Any, Callable, Dict, List, Optional, Set, Tuple, Union


class AchievementRarity(Enum):
	"""Achievement rarity levels."""
	COMMON = auto()       # Easy to get
	UNCOMMON = auto()     # Moderate effort
	RARE = auto()         # Significant effort
	VERY_RARE = auto()    # Difficult
	ULTRA_RARE = auto()   # Very difficult
	LEGENDARY = auto()    # Extremely rare


class AchievementType(Enum):
	"""Types of achievements."""
	STORY = auto()        # Story progression
	COMBAT = auto()       # Battle-related
	COLLECTION = auto()   # Collecting items/etc
	EXPLORATION = auto()  # Finding locations
	MASTERY = auto()      # Skill demonstration
	SOCIAL = auto()       # Multiplayer/social
	CHALLENGE = auto()    # Special challenges
	SECRET = auto()       # Hidden achievements


class ConditionType(Enum):
	"""Types of unlock conditions."""
	FLAG = auto()         # Event flag set
	COUNTER = auto()      # Counter reaches value
	STAT = auto()         # Stat reaches value
	ITEM = auto()         # Item acquired
	COMPLETION = auto()   # Quest/area complete
	COMBO = auto()        # Multiple conditions


@dataclass
class UnlockCondition:
	"""Condition for unlocking an achievement."""
	condition_type: ConditionType
	target: str          # What to check
	value: Union[int, str, bool] = True  # Target value
	operator: str = ">=" # Comparison operator
	
	def check(self, current_value: Union[int, str, bool]) -> bool:
		"""Check if condition is met."""
		if self.condition_type == ConditionType.FLAG:
			return current_value == self.value
		
		if self.operator == ">=":
			return current_value >= self.value
		elif self.operator == ">":
			return current_value > self.value
		elif self.operator == "==":
			return current_value == self.value
		elif self.operator == "<=":
			return current_value <= self.value
		elif self.operator == "<":
			return current_value < self.value
		
		return False
	
	def get_progress(self, current_value: Union[int, str, bool]) -> Tuple[int, int]:
		"""Get progress toward condition."""
		if self.condition_type == ConditionType.FLAG:
			return (1 if current_value == self.value else 0, 1)
		
		if isinstance(self.value, (int, float)):
			current = min(int(current_value), int(self.value))
			return (current, int(self.value))
		
		return (1 if current_value == self.value else 0, 1)
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"type": self.condition_type.name,
			"target": self.target
		}
		if self.value != True:
			result["value"] = self.value
		if self.operator != ">=":
			result["operator"] = self.operator
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "UnlockCondition":
		"""Create from dictionary."""
		return cls(
			condition_type=ConditionType[data["type"]],
			target=data["target"],
			value=data.get("value", True),
			operator=data.get("operator", ">=")
		)


@dataclass
class AchievementReward:
	"""Reward for unlocking achievement."""
	reward_type: str  # title, item, skin, points, etc.
	value: Union[str, int] = ""
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"type": self.reward_type,
			"value": self.value
		}
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "AchievementReward":
		"""Create from dictionary."""
		return cls(
			reward_type=data["type"],
			value=data.get("value", "")
		)


@dataclass
class Achievement:
	"""A game achievement."""
	achievement_id: str
	name: str
	description: str = ""
	achievement_type: AchievementType = AchievementType.STORY
	rarity: AchievementRarity = AchievementRarity.COMMON
	
	# Unlock conditions
	conditions: List[UnlockCondition] = field(default_factory=list)
	conditions_require_all: bool = True  # AND vs OR
	
	# Display
	icon: str = ""
	secret: bool = False  # Hidden until unlocked
	points: int = 10  # Gamerscore/points
	
	# Rewards
	rewards: List[AchievementReward] = field(default_factory=list)
	
	# Prerequisites
	prerequisites: List[str] = field(default_factory=list)
	
	# Progress tracking
	show_progress: bool = True
	progress_format: str = "{current}/{target}"
	
	def check_unlock(self, game_state: Dict[str, Any]) -> bool:
		"""Check if achievement should unlock."""
		if not self.conditions:
			return False
		
		results = []
		for condition in self.conditions:
			current = game_state.get(condition.target, 0)
			results.append(condition.check(current))
		
		if self.conditions_require_all:
			return all(results)
		else:
			return any(results)
	
	def get_progress(self, game_state: Dict[str, Any]) -> Tuple[int, int]:
		"""Get overall progress."""
		if not self.conditions:
			return (0, 1)
		
		total_current = 0
		total_target = 0
		
		for condition in self.conditions:
			current = game_state.get(condition.target, 0)
			curr, target = condition.get_progress(current)
			total_current += curr
			total_target += target
		
		return (total_current, total_target)
	
	def format_progress(self, game_state: Dict[str, Any]) -> str:
		"""Get formatted progress string."""
		current, target = self.get_progress(game_state)
		return self.progress_format.format(current=current, target=target)
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"id": self.achievement_id,
			"name": self.name
		}
		
		if self.description:
			result["description"] = self.description
		result["type"] = self.achievement_type.name
		result["rarity"] = self.rarity.name
		
		if self.conditions:
			result["conditions"] = [c.to_dict() for c in self.conditions]
		if not self.conditions_require_all:
			result["require_any"] = True
		
		if self.icon:
			result["icon"] = self.icon
		if self.secret:
			result["secret"] = True
		if self.points != 10:
			result["points"] = self.points
		
		if self.rewards:
			result["rewards"] = [r.to_dict() for r in self.rewards]
		if self.prerequisites:
			result["prerequisites"] = self.prerequisites
		
		if not self.show_progress:
			result["show_progress"] = False
		if self.progress_format != "{current}/{target}":
			result["progress_format"] = self.progress_format
		
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "Achievement":
		"""Create from dictionary."""
		conditions = [UnlockCondition.from_dict(c) for c in data.get("conditions", [])]
		rewards = [AchievementReward.from_dict(r) for r in data.get("rewards", [])]
		
		return cls(
			achievement_id=data["id"],
			name=data["name"],
			description=data.get("description", ""),
			achievement_type=AchievementType[data.get("type", "STORY")],
			rarity=AchievementRarity[data.get("rarity", "COMMON")],
			conditions=conditions,
			conditions_require_all=not data.get("require_any", False),
			icon=data.get("icon", ""),
			secret=data.get("secret", False),
			points=data.get("points", 10),
			rewards=rewards,
			prerequisites=data.get("prerequisites", []),
			show_progress=data.get("show_progress", True),
			progress_format=data.get("progress_format", "{current}/{target}")
		)


class AchievementManager:
	"""Manage achievement system."""
	
	def __init__(self):
		self.achievements: Dict[str, Achievement] = {}
		self.unlocked: Set[str] = set()
		self.unlock_times: Dict[str, datetime] = {}
		self.metadata: Dict[str, Any] = {}
	
	def add(self, achievement: Achievement) -> None:
		"""Add achievement."""
		self.achievements[achievement.achievement_id] = achievement
	
	def get(self, achievement_id: str) -> Optional[Achievement]:
		"""Get achievement by ID."""
		return self.achievements.get(achievement_id)
	
	def get_by_type(self, ach_type: AchievementType) -> List[Achievement]:
		"""Get achievements by type."""
		return [a for a in self.achievements.values() 
				if a.achievement_type == ach_type]
	
	def get_by_rarity(self, rarity: AchievementRarity) -> List[Achievement]:
		"""Get achievements by rarity."""
		return [a for a in self.achievements.values() if a.rarity == rarity]
	
	def unlock(self, achievement_id: str) -> bool:
		"""Manually unlock achievement."""
		if achievement_id not in self.achievements:
			return False
		if achievement_id in self.unlocked:
			return False
		
		ach = self.achievements[achievement_id]
		
		# Check prerequisites
		for prereq in ach.prerequisites:
			if prereq not in self.unlocked:
				return False
		
		self.unlocked.add(achievement_id)
		self.unlock_times[achievement_id] = datetime.now()
		return True
	
	def check_all(self, game_state: Dict[str, Any]) -> List[Achievement]:
		"""Check all achievements, return newly unlocked."""
		newly_unlocked = []
		
		for achievement in self.achievements.values():
			if achievement.achievement_id in self.unlocked:
				continue
			
			# Check prerequisites
			prereqs_met = all(p in self.unlocked for p in achievement.prerequisites)
			if not prereqs_met:
				continue
			
			if achievement.check_unlock(game_state):
				self.unlock(achievement.achievement_id)
				newly_unlocked.append(achievement)
		
		return newly_unlocked
	
	def get_completion(self) -> Tuple[int, int]:
		"""Get completion (unlocked, total)."""
		return len(self.unlocked), len(self.achievements)
	
	def get_total_points(self) -> Tuple[int, int]:
		"""Get points (earned, total)."""
		earned = sum(a.points for a in self.achievements.values() 
					 if a.achievement_id in self.unlocked)
		total = sum(a.points for a in self.achievements.values())
		return earned, total
	
	def get_statistics(self) -> Dict[str, Any]:
		"""Get achievement statistics."""
		unlocked_count, total_count = self.get_completion()
		earned_points, total_points = self.get_total_points()
		
		stats = {
			"total_achievements": total_count,
			"unlocked": unlocked_count,
			"completion_percent": unlocked_count / total_count * 100 if total_count else 0,
			"points_earned": earned_points,
			"points_total": total_points,
			"by_type": {},
			"by_rarity": {}
		}
		
		for ach_type in AchievementType:
			achs = self.get_by_type(ach_type)
			if achs:
				unlocked = sum(1 for a in achs if a.achievement_id in self.unlocked)
				stats["by_type"][ach_type.name] = {
					"total": len(achs),
					"unlocked": unlocked
				}
		
		for rarity in AchievementRarity:
			achs = self.get_by_rarity(rarity)
			if achs:
				unlocked = sum(1 for a in achs if a.achievement_id in self.unlocked)
				stats["by_rarity"][rarity.name] = {
					"total": len(achs),
					"unlocked": unlocked
				}
		
		return stats
	
	def validate(self) -> List[str]:
		"""Validate achievement definitions."""
		issues = []
		
		all_ids = set(self.achievements.keys())
		
		for ach in self.achievements.values():
			# Check prerequisites exist
			for prereq in ach.prerequisites:
				if prereq not in all_ids:
					issues.append(
						f"Achievement '{ach.name}': Unknown prerequisite '{prereq}'"
					)
			
			# Check for circular dependencies
			visited = set()
			stack = [ach.achievement_id]
			while stack:
				current = stack.pop()
				if current in visited:
					issues.append(
						f"Achievement '{ach.name}': Circular prerequisite dependency"
					)
					break
				visited.add(current)
				if current in self.achievements:
					stack.extend(self.achievements[current].prerequisites)
			
			# Check conditions
			if not ach.conditions and ach.achievement_type != AchievementType.SECRET:
				issues.append(
					f"Achievement '{ach.name}': No unlock conditions defined"
				)
		
		return issues
	
	def load(self, filepath: str) -> None:
		"""Load from JSON."""
		with open(filepath, "r", encoding="utf-8") as f:
			data = json.load(f)
		
		self.metadata = data.get("metadata", {})
		
		for ach_data in data.get("achievements", []):
			achievement = Achievement.from_dict(ach_data)
			self.add(achievement)
		
		self.unlocked = set(data.get("unlocked", []))
	
	def save(self, filepath: str) -> None:
		"""Save to JSON."""
		data = {
			"metadata": self.metadata,
			"achievements": [a.to_dict() for a in self.achievements.values()],
			"unlocked": list(self.unlocked)
		}
		
		with open(filepath, "w", encoding="utf-8") as f:
			json.dump(data, f, indent="\t", ensure_ascii=False)


def create_example_achievements() -> AchievementManager:
	"""Create example achievement data."""
	manager = AchievementManager()
	manager.metadata = {"game": "Example RPG", "version": "1.0"}
	
	# Story achievements
	manager.add(Achievement(
		achievement_id="story_ch1",
		name="The Journey Begins",
		description="Complete Chapter 1.",
		achievement_type=AchievementType.STORY,
		rarity=AchievementRarity.COMMON,
		points=10,
		conditions=[
			UnlockCondition(ConditionType.FLAG, "chapter1_complete", True, "==")
		]
	))
	
	manager.add(Achievement(
		achievement_id="story_ch2",
		name="Rising Hero",
		description="Complete Chapter 2.",
		achievement_type=AchievementType.STORY,
		rarity=AchievementRarity.COMMON,
		points=20,
		prerequisites=["story_ch1"],
		conditions=[
			UnlockCondition(ConditionType.FLAG, "chapter2_complete", True, "==")
		]
	))
	
	manager.add(Achievement(
		achievement_id="story_end",
		name="The End",
		description="Complete the main story.",
		achievement_type=AchievementType.STORY,
		rarity=AchievementRarity.UNCOMMON,
		points=50,
		prerequisites=["story_ch2"],
		conditions=[
			UnlockCondition(ConditionType.FLAG, "game_complete", True, "==")
		],
		rewards=[
			AchievementReward("title", "Hero of the Realm")
		]
	))
	
	# Combat achievements
	manager.add(Achievement(
		achievement_id="combat_first",
		name="First Blood",
		description="Win your first battle.",
		achievement_type=AchievementType.COMBAT,
		rarity=AchievementRarity.COMMON,
		points=5,
		conditions=[
			UnlockCondition(ConditionType.COUNTER, "battles_won", 1, ">=")
		]
	))
	
	manager.add(Achievement(
		achievement_id="combat_100",
		name="Battle Hardened",
		description="Win 100 battles.",
		achievement_type=AchievementType.COMBAT,
		rarity=AchievementRarity.UNCOMMON,
		points=25,
		conditions=[
			UnlockCondition(ConditionType.COUNTER, "battles_won", 100, ">=")
		]
	))
	
	manager.add(Achievement(
		achievement_id="combat_boss",
		name="Dragon Slayer",
		description="Defeat the Ancient Dragon.",
		achievement_type=AchievementType.COMBAT,
		rarity=AchievementRarity.RARE,
		points=40,
		conditions=[
			UnlockCondition(ConditionType.FLAG, "dragon_defeated", True, "==")
		],
		rewards=[
			AchievementReward("item", "Dragon Scale Armor")
		]
	))
	
	# Collection achievements
	manager.add(Achievement(
		achievement_id="collect_items",
		name="Collector",
		description="Collect 50 different items.",
		achievement_type=AchievementType.COLLECTION,
		rarity=AchievementRarity.UNCOMMON,
		points=20,
		conditions=[
			UnlockCondition(ConditionType.COUNTER, "unique_items", 50, ">=")
		]
	))
	
	manager.add(Achievement(
		achievement_id="collect_all",
		name="Completionist",
		description="Collect every item in the game.",
		achievement_type=AchievementType.COLLECTION,
		rarity=AchievementRarity.ULTRA_RARE,
		points=100,
		conditions=[
			UnlockCondition(ConditionType.COUNTER, "unique_items", 200, ">=")
		],
		rewards=[
			AchievementReward("title", "Master Collector"),
			AchievementReward("points", 500)
		]
	))
	
	# Secret achievements
	manager.add(Achievement(
		achievement_id="secret_dev",
		name="???",
		description="Find the developer's secret room.",
		achievement_type=AchievementType.SECRET,
		rarity=AchievementRarity.VERY_RARE,
		secret=True,
		points=50,
		conditions=[
			UnlockCondition(ConditionType.FLAG, "found_dev_room", True, "==")
		]
	))
	
	# Challenge achievements
	manager.add(Achievement(
		achievement_id="challenge_nodeath",
		name="Immortal",
		description="Complete the game without dying.",
		achievement_type=AchievementType.CHALLENGE,
		rarity=AchievementRarity.LEGENDARY,
		points=200,
		conditions=[
			UnlockCondition(ConditionType.FLAG, "game_complete", True, "=="),
			UnlockCondition(ConditionType.COUNTER, "deaths", 0, "==")
		],
		rewards=[
			AchievementReward("title", "The Undying")
		]
	))
	
	return manager


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Achievement System Manager")
	parser.add_argument("datafile", nargs="?", help="Achievement JSON file")
	parser.add_argument("--list", "-l", action="store_true",
						help="List all achievements")
	parser.add_argument("--type", "-t", choices=[t.name for t in AchievementType],
						help="Filter by type")
	parser.add_argument("--rarity", "-r", choices=[r.name for r in AchievementRarity],
						help="Filter by rarity")
	parser.add_argument("--stats", "-s", action="store_true",
						help="Show statistics")
	parser.add_argument("--validate", "-v", action="store_true",
						help="Validate achievements")
	parser.add_argument("--create-example", action="store_true",
						help="Create example data")
	parser.add_argument("--export", "-e", help="Export to file")
	
	args = parser.parse_args()
	
	manager = AchievementManager()
	
	if args.create_example:
		manager = create_example_achievements()
		output = args.datafile or "achievements.json"
		manager.save(output)
		print(f"Created example data: {output}")
		return
	
	if args.datafile and os.path.exists(args.datafile):
		manager.load(args.datafile)
		print(f"Loaded: {args.datafile}")
	else:
		manager = create_example_achievements()
		print("Achievement Manager - Demo Mode")
	
	print(f"Achievements: {len(manager.achievements)}")
	print()
	
	# List
	if args.list:
		print("All Achievements:")
		for ach in manager.achievements.values():
			secret = " [SECRET]" if ach.secret else ""
			status = " ✓" if ach.achievement_id in manager.unlocked else ""
			print(f"  [{ach.achievement_id}] {ach.name} ({ach.rarity.name}){secret}{status}")
			if ach.description and not ach.secret:
				print(f"    {ach.description}")
			print(f"    Points: {ach.points}")
		print()
	
	# Filter by type
	if args.type:
		ach_type = AchievementType[args.type]
		achs = manager.get_by_type(ach_type)
		print(f"{args.type} Achievements ({len(achs)}):")
		for ach in achs:
			print(f"  {ach.name} - {ach.rarity.name}")
		print()
	
	# Filter by rarity
	if args.rarity:
		rarity = AchievementRarity[args.rarity]
		achs = manager.get_by_rarity(rarity)
		print(f"{args.rarity} Achievements ({len(achs)}):")
		for ach in achs:
			print(f"  {ach.name} - {ach.points} pts")
		print()
	
	# Statistics
	if args.stats:
		stats = manager.get_statistics()
		unlocked, total = stats["unlocked"], stats["total_achievements"]
		pct = stats["completion_percent"]
		
		print("Statistics:")
		print(f"  Progress: {unlocked}/{total} ({pct:.1f}%)")
		print(f"  Points: {stats['points_earned']}/{stats['points_total']}")
		
		print("\n  By Type:")
		for type_name, data in stats["by_type"].items():
			print(f"    {type_name}: {data['unlocked']}/{data['total']}")
		
		print("\n  By Rarity:")
		for rarity_name, data in stats["by_rarity"].items():
			print(f"    {rarity_name}: {data['unlocked']}/{data['total']}")
		print()
	
	# Validate
	if args.validate:
		issues = manager.validate()
		if issues:
			print(f"Validation Issues ({len(issues)}):")
			for issue in issues:
				print(f"  - {issue}")
		else:
			print("No validation issues found")
		print()
	
	# Export
	if args.export:
		manager.save(args.export)
		print(f"Exported to: {args.export}")


if __name__ == "__main__":
	main()
