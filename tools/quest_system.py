#!/usr/bin/env python3
"""
Quest System Manager - Manage quest and flag systems for RPG games.

Tools for creating, editing, and validating quest structures,
event flags, and progression tracking.

Usage:
	python quest_system.py <quests.json>
	python quest_system.py --validate
	python quest_system.py --flowchart

Features:
	- Quest tree management
	- Event flag tracking
	- Prerequisite validation
	- Progress visualization
	- Completion analysis
"""

import argparse
import json
import os
import sys
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Set, Tuple


class QuestStatus(Enum):
	"""Quest progress states."""
	NOT_STARTED = auto()
	AVAILABLE = auto()
	IN_PROGRESS = auto()
	COMPLETE = auto()
	FAILED = auto()
	HIDDEN = auto()


class QuestType(Enum):
	"""Types of quests."""
	MAIN = auto()
	SIDE = auto()
	FETCH = auto()
	HUNT = auto()
	ESCORT = auto()
	DELIVERY = auto()
	EXPLORATION = auto()
	COLLECTION = auto()


@dataclass
class QuestObjective:
	"""An objective within a quest."""
	objective_id: str
	description: str
	target_count: int = 1
	current_count: int = 0
	optional: bool = False
	hidden: bool = False
	
	def is_complete(self) -> bool:
		"""Check if objective is complete."""
		return self.current_count >= self.target_count
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"id": self.objective_id,
			"description": self.description
		}
		if self.target_count > 1:
			result["target"] = self.target_count
		if self.optional:
			result["optional"] = True
		if self.hidden:
			result["hidden"] = True
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "QuestObjective":
		"""Create from dictionary."""
		return cls(
			objective_id=data["id"],
			description=data["description"],
			target_count=data.get("target", 1),
			optional=data.get("optional", False),
			hidden=data.get("hidden", False)
		)


@dataclass
class QuestReward:
	"""Rewards for completing a quest."""
	exp: int = 0
	gold: int = 0
	items: List[Tuple[str, int]] = field(default_factory=list)  # (item_name, count)
	flags_set: List[str] = field(default_factory=list)
	unlocks: List[str] = field(default_factory=list)  # Quest IDs unlocked
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {}
		if self.exp:
			result["exp"] = self.exp
		if self.gold:
			result["gold"] = self.gold
		if self.items:
			result["items"] = [{"name": n, "count": c} for n, c in self.items]
		if self.flags_set:
			result["flags"] = self.flags_set
		if self.unlocks:
			result["unlocks"] = self.unlocks
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "QuestReward":
		"""Create from dictionary."""
		items = [(i["name"], i.get("count", 1)) for i in data.get("items", [])]
		return cls(
			exp=data.get("exp", 0),
			gold=data.get("gold", 0),
			items=items,
			flags_set=data.get("flags", []),
			unlocks=data.get("unlocks", [])
		)


@dataclass
class Quest:
	"""A game quest."""
	quest_id: str
	name: str
	quest_type: QuestType = QuestType.SIDE
	description: str = ""
	giver: str = ""
	location: str = ""
	objectives: List[QuestObjective] = field(default_factory=list)
	rewards: QuestReward = field(default_factory=QuestReward)
	prerequisites: List[str] = field(default_factory=list)  # Quest IDs
	required_flags: List[str] = field(default_factory=list)
	level_requirement: int = 0
	time_limit: int = 0  # 0 = no limit
	repeatable: bool = False
	status: QuestStatus = QuestStatus.NOT_STARTED
	
	def is_available(self, completed_quests: Set[str], 
					 active_flags: Set[str]) -> bool:
		"""Check if quest can be started."""
		if self.status != QuestStatus.NOT_STARTED:
			return False
		
		# Check prerequisites
		for prereq in self.prerequisites:
			if prereq not in completed_quests:
				return False
		
		# Check required flags
		for flag in self.required_flags:
			if flag not in active_flags:
				return False
		
		return True
	
	def get_progress(self) -> float:
		"""Get completion percentage."""
		required = [o for o in self.objectives if not o.optional]
		if not required:
			return 0.0
		
		completed = sum(1 for o in required if o.is_complete())
		return completed / len(required)
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"id": self.quest_id,
			"name": self.name,
			"type": self.quest_type.name
		}
		
		if self.description:
			result["description"] = self.description
		if self.giver:
			result["giver"] = self.giver
		if self.location:
			result["location"] = self.location
		if self.objectives:
			result["objectives"] = [o.to_dict() for o in self.objectives]
		
		rewards_dict = self.rewards.to_dict()
		if rewards_dict:
			result["rewards"] = rewards_dict
		
		if self.prerequisites:
			result["prerequisites"] = self.prerequisites
		if self.required_flags:
			result["required_flags"] = self.required_flags
		if self.level_requirement:
			result["level_req"] = self.level_requirement
		if self.time_limit:
			result["time_limit"] = self.time_limit
		if self.repeatable:
			result["repeatable"] = True
		
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "Quest":
		"""Create from dictionary."""
		objectives = [QuestObjective.from_dict(o) for o in data.get("objectives", [])]
		rewards = QuestReward.from_dict(data.get("rewards", {}))
		
		return cls(
			quest_id=data["id"],
			name=data["name"],
			quest_type=QuestType[data.get("type", "SIDE")],
			description=data.get("description", ""),
			giver=data.get("giver", ""),
			location=data.get("location", ""),
			objectives=objectives,
			rewards=rewards,
			prerequisites=data.get("prerequisites", []),
			required_flags=data.get("required_flags", []),
			level_requirement=data.get("level_req", 0),
			time_limit=data.get("time_limit", 0),
			repeatable=data.get("repeatable", False)
		)


class QuestManager:
	"""Manage quest system."""
	
	def __init__(self):
		self.quests: Dict[str, Quest] = {}
		self.flags: Set[str] = set()
		self.completed_quests: Set[str] = set()
		self.metadata: Dict[str, Any] = {}
	
	def add_quest(self, quest: Quest) -> None:
		"""Add quest to system."""
		self.quests[quest.quest_id] = quest
	
	def get_quest(self, quest_id: str) -> Optional[Quest]:
		"""Get quest by ID."""
		return self.quests.get(quest_id)
	
	def get_by_type(self, quest_type: QuestType) -> List[Quest]:
		"""Get quests by type."""
		return [q for q in self.quests.values() if q.quest_type == quest_type]
	
	def get_available(self) -> List[Quest]:
		"""Get currently available quests."""
		return [q for q in self.quests.values()
				if q.is_available(self.completed_quests, self.flags)]
	
	def get_in_progress(self) -> List[Quest]:
		"""Get quests in progress."""
		return [q for q in self.quests.values()
				if q.status == QuestStatus.IN_PROGRESS]
	
	def validate(self) -> List[str]:
		"""Validate quest system for issues."""
		issues = []
		
		all_ids = set(self.quests.keys())
		
		for quest in self.quests.values():
			# Check for missing prerequisites
			for prereq in quest.prerequisites:
				if prereq not in all_ids:
					issues.append(
						f"Quest '{quest.name}': Missing prerequisite '{prereq}'"
					)
			
			# Check for empty objectives in non-trivial quests
			if not quest.objectives and quest.quest_type not in [QuestType.MAIN]:
				issues.append(
					f"Quest '{quest.name}': No objectives defined"
				)
			
			# Check for orphaned quests (not accessible)
			if quest.prerequisites:
				accessible = False
				for prereq in quest.prerequisites:
					if prereq in all_ids:
						prereq_quest = self.quests[prereq]
						# Check if prereq unlocks this quest
						if quest.quest_id in prereq_quest.rewards.unlocks:
							accessible = True
							break
				
				if not accessible:
					# Check if any reward unlocks this
					unlocked_by_any = False
					for other in self.quests.values():
						if quest.quest_id in other.rewards.unlocks:
							unlocked_by_any = True
							break
					
					if not unlocked_by_any and quest.prerequisites:
						issues.append(
							f"Quest '{quest.name}': Has prerequisites but not unlocked by any quest"
						)
		
		# Check for circular dependencies
		for quest in self.quests.values():
			visited = set()
			stack = [quest.quest_id]
			
			while stack:
				current = stack.pop()
				if current in visited:
					issues.append(
						f"Quest '{quest.name}': Circular dependency detected"
					)
					break
				visited.add(current)
				
				if current in all_ids:
					for prereq in self.quests[current].prerequisites:
						if prereq not in visited:
							stack.append(prereq)
		
		return issues
	
	def get_flowchart(self) -> str:
		"""Generate Mermaid flowchart of quest dependencies."""
		lines = ["flowchart TD"]
		
		for quest in self.quests.values():
			# Node definition
			node_id = quest.quest_id.replace("-", "_")
			label = quest.name
			if quest.quest_type == QuestType.MAIN:
				lines.append(f"    {node_id}[[\"{label}\"]]")
			else:
				lines.append(f"    {node_id}[\"{label}\"]")
			
			# Prerequisites
			for prereq in quest.prerequisites:
				prereq_id = prereq.replace("-", "_")
				lines.append(f"    {prereq_id} --> {node_id}")
			
			# Unlocks
			for unlock in quest.rewards.unlocks:
				unlock_id = unlock.replace("-", "_")
				lines.append(f"    {node_id} -.-> {unlock_id}")
		
		return "\n".join(lines)
	
	def get_statistics(self) -> Dict[str, Any]:
		"""Get quest system statistics."""
		stats = {
			"total_quests": len(self.quests),
			"by_type": {},
			"total_exp_rewards": 0,
			"total_gold_rewards": 0,
			"avg_objectives": 0
		}
		
		obj_count = 0
		
		for quest_type in QuestType:
			quests = self.get_by_type(quest_type)
			if quests:
				stats["by_type"][quest_type.name] = len(quests)
		
		for quest in self.quests.values():
			stats["total_exp_rewards"] += quest.rewards.exp
			stats["total_gold_rewards"] += quest.rewards.gold
			obj_count += len(quest.objectives)
		
		if self.quests:
			stats["avg_objectives"] = obj_count / len(self.quests)
		
		return stats
	
	def load(self, filepath: str) -> None:
		"""Load from JSON file."""
		with open(filepath, "r", encoding="utf-8") as f:
			data = json.load(f)
		
		self.metadata = data.get("metadata", {})
		
		for quest_data in data.get("quests", []):
			quest = Quest.from_dict(quest_data)
			self.add_quest(quest)
	
	def save(self, filepath: str) -> None:
		"""Save to JSON file."""
		data = {
			"metadata": self.metadata,
			"quests": [q.to_dict() for q in self.quests.values()]
		}
		
		with open(filepath, "w", encoding="utf-8") as f:
			json.dump(data, f, indent="\t", ensure_ascii=False)
	
	def export_markdown(self, filepath: str) -> None:
		"""Export as Markdown document."""
		with open(filepath, "w", encoding="utf-8") as f:
			f.write("# Quest Guide\n\n")
			
			# Main quests
			main_quests = self.get_by_type(QuestType.MAIN)
			if main_quests:
				f.write("## Main Story\n\n")
				for quest in main_quests:
					self._write_quest_md(f, quest)
			
			# Side quests by type
			for quest_type in QuestType:
				if quest_type == QuestType.MAIN:
					continue
				quests = self.get_by_type(quest_type)
				if quests:
					f.write(f"## {quest_type.name.title()} Quests\n\n")
					for quest in quests:
						self._write_quest_md(f, quest)
	
	def _write_quest_md(self, f, quest: Quest) -> None:
		"""Write quest as Markdown."""
		f.write(f"### {quest.name}\n\n")
		
		if quest.giver:
			f.write(f"**Giver:** {quest.giver}")
			if quest.location:
				f.write(f" ({quest.location})")
			f.write("\n\n")
		
		if quest.description:
			f.write(f"{quest.description}\n\n")
		
		if quest.prerequisites:
			prereq_names = [self.quests[p].name for p in quest.prerequisites
						   if p in self.quests]
			if prereq_names:
				f.write(f"**Prerequisites:** {', '.join(prereq_names)}\n\n")
		
		if quest.objectives:
			f.write("**Objectives:**\n")
			for obj in quest.objectives:
				opt = " (Optional)" if obj.optional else ""
				f.write(f"- {obj.description}{opt}\n")
			f.write("\n")
		
		if quest.rewards.exp or quest.rewards.gold or quest.rewards.items:
			f.write("**Rewards:**\n")
			if quest.rewards.exp:
				f.write(f"- {quest.rewards.exp} EXP\n")
			if quest.rewards.gold:
				f.write(f"- {quest.rewards.gold} Gold\n")
			for item, count in quest.rewards.items:
				f.write(f"- {item}" + (f" x{count}" if count > 1 else "") + "\n")
			f.write("\n")


def create_example_quests() -> QuestManager:
	"""Create example quest database."""
	manager = QuestManager()
	manager.metadata = {"game": "Example RPG", "version": "1.0"}
	
	# Main story quests
	manager.add_quest(Quest(
		quest_id="main-1",
		name="The Beginning",
		quest_type=QuestType.MAIN,
		description="Start your adventure in the village.",
		giver="Village Elder",
		location="Starting Village",
		objectives=[
			QuestObjective("talk-elder", "Talk to the Elder"),
			QuestObjective("get-sword", "Obtain a sword"),
			QuestObjective("leave-village", "Leave the village")
		],
		rewards=QuestReward(
			exp=100,
			gold=50,
			items=[("Leather Armor", 1)],
			unlocks=["main-2", "side-1"]
		)
	))
	
	manager.add_quest(Quest(
		quest_id="main-2",
		name="Road to the Castle",
		quest_type=QuestType.MAIN,
		description="Travel to the castle and meet the king.",
		giver="Village Elder",
		location="Starting Village",
		objectives=[
			QuestObjective("reach-castle", "Reach the Castle"),
			QuestObjective("meet-king", "Speak with the King")
		],
		prerequisites=["main-1"],
		rewards=QuestReward(
			exp=500,
			gold=200,
			unlocks=["main-3", "side-3"]
		)
	))
	
	# Side quests
	manager.add_quest(Quest(
		quest_id="side-1",
		name="Pest Control",
		quest_type=QuestType.HUNT,
		description="The fields are overrun with slimes!",
		giver="Farmer Bob",
		location="Village Farm",
		objectives=[
			QuestObjective("kill-slimes", "Defeat Slimes", target_count=10)
		],
		prerequisites=["main-1"],
		rewards=QuestReward(
			exp=50,
			gold=100,
			items=[("Healing Herb", 5)]
		)
	))
	
	manager.add_quest(Quest(
		quest_id="side-2",
		name="Lost Pendant",
		quest_type=QuestType.FETCH,
		description="Find the innkeeper's lost pendant.",
		giver="Innkeeper",
		location="Village Inn",
		objectives=[
			QuestObjective("find-pendant", "Find the Silver Pendant")
		],
		rewards=QuestReward(
			exp=75,
			gold=150
		)
	))
	
	manager.add_quest(Quest(
		quest_id="side-3",
		name="Herb Collection",
		quest_type=QuestType.COLLECTION,
		description="The healer needs herbs for medicine.",
		giver="Healer",
		location="Castle Town",
		objectives=[
			QuestObjective("collect-herbs", "Collect Medicinal Herbs", target_count=5)
		],
		prerequisites=["main-2"],
		rewards=QuestReward(
			exp=100,
			gold=75,
			items=[("Antidote", 3), ("Healing Potion", 2)]
		)
	))
	
	return manager


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Quest System Manager")
	parser.add_argument("questfile", nargs="?", help="Quest JSON file")
	parser.add_argument("--list", "-l", action="store_true",
						help="List all quests")
	parser.add_argument("--type", "-t", choices=[t.name for t in QuestType],
						help="Filter by type")
	parser.add_argument("--validate", "-v", action="store_true",
						help="Validate quest system")
	parser.add_argument("--flowchart", "-f", action="store_true",
						help="Generate Mermaid flowchart")
	parser.add_argument("--stats", "-s", action="store_true",
						help="Show statistics")
	parser.add_argument("--export", "-e", help="Export to file")
	parser.add_argument("--create-example", action="store_true",
						help="Create example database")
	
	args = parser.parse_args()
	
	manager = QuestManager()
	
	if args.create_example:
		manager = create_example_quests()
		output = args.questfile or "quests.json"
		manager.save(output)
		print(f"Created example database: {output}")
		print(f"Quests: {len(manager.quests)}")
		return
	
	if args.questfile:
		if os.path.exists(args.questfile):
			manager.load(args.questfile)
			print(f"Loaded: {args.questfile}")
			print(f"Quests: {len(manager.quests)}")
		else:
			print(f"File not found: {args.questfile}")
			print("Use --create-example to create a new database")
			return
	else:
		# Demo mode
		manager = create_example_quests()
		print("Quest System Manager")
		print()
		print("Usage: python quest_system.py <quests.json>")
		print()
		print("Demo mode - using example data:")
	
	print()
	
	# List quests
	if args.list:
		print("All Quests:")
		for quest in manager.quests.values():
			prereqs = f" (Requires: {', '.join(quest.prerequisites)})" if quest.prerequisites else ""
			print(f"  [{quest.quest_id}] {quest.name} ({quest.quest_type.name}){prereqs}")
		print()
	
	# Filter by type
	if args.type:
		quest_type = QuestType[args.type]
		quests = manager.get_by_type(quest_type)
		print(f"{quest_type.name} Quests ({len(quests)}):")
		for quest in quests:
			print(f"  {quest.name}")
			if quest.objectives:
				for obj in quest.objectives:
					print(f"    - {obj.description}")
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
	
	# Flowchart
	if args.flowchart:
		print("Quest Flowchart (Mermaid):")
		print(manager.get_flowchart())
		print()
	
	# Statistics
	if args.stats:
		stats = manager.get_statistics()
		print("Quest Statistics:")
		print(f"  Total quests: {stats['total_quests']}")
		print(f"  Total EXP rewards: {stats['total_exp_rewards']:,}")
		print(f"  Total Gold rewards: {stats['total_gold_rewards']:,}")
		print(f"  Avg objectives per quest: {stats['avg_objectives']:.1f}")
		print("  By type:")
		for qtype, count in stats["by_type"].items():
			print(f"    {qtype}: {count}")
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
