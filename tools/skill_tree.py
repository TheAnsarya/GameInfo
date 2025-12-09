#!/usr/bin/env python3
"""
Skill Tree Manager - Design and manage character skill trees.

Tools for creating branching skill systems, prerequisites,
and unlock conditions.

Usage:
	python skill_tree.py <skills.json>
	python skill_tree.py --visualize
	python skill_tree.py --validate

Features:
	- Multi-branch skill trees
	- Prerequisite chains
	- Point allocation tracking
	- Passive/Active skill types
	- Tree visualization
"""

import argparse
import json
import os
import sys
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Set, Tuple


class SkillType(Enum):
	"""Types of skills."""
	PASSIVE = auto()     # Always active
	ACTIVE = auto()      # Must be used
	TOGGLE = auto()      # Toggle on/off
	TRIGGER = auto()     # Activates on condition
	STANCE = auto()      # Mutually exclusive mode
	SUMMON = auto()      # Summons entity
	ULTIMATE = auto()    # Powerful ability


class TargetType(Enum):
	"""Skill targeting."""
	SELF = auto()
	SINGLE_ALLY = auto()
	SINGLE_ENEMY = auto()
	ALL_ALLIES = auto()
	ALL_ENEMIES = auto()
	AREA = auto()
	CONE = auto()
	LINE = auto()


class DamageType(Enum):
	"""Damage categories."""
	NONE = auto()
	PHYSICAL = auto()
	MAGICAL = auto()
	TRUE = auto()  # Ignores defense


@dataclass
class SkillEffect:
	"""An effect produced by a skill."""
	effect_type: str  # damage, heal, buff, debuff, etc.
	value: int = 0
	percent: float = 0.0
	duration: int = 0  # turns/seconds
	stat_target: str = ""  # For buffs/debuffs
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {"type": self.effect_type}
		if self.value:
			result["value"] = self.value
		if self.percent:
			result["percent"] = self.percent
		if self.duration:
			result["duration"] = self.duration
		if self.stat_target:
			result["stat"] = self.stat_target
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "SkillEffect":
		"""Create from dictionary."""
		return cls(
			effect_type=data["type"],
			value=data.get("value", 0),
			percent=data.get("percent", 0.0),
			duration=data.get("duration", 0),
			stat_target=data.get("stat", "")
		)


@dataclass
class Skill:
	"""A skill in the tree."""
	skill_id: str
	name: str
	skill_type: SkillType = SkillType.ACTIVE
	description: str = ""
	
	# Position in tree
	branch: str = "main"
	tier: int = 1  # Depth in tree
	position: int = 0  # Horizontal position
	
	# Requirements
	prerequisites: List[str] = field(default_factory=list)  # Skill IDs
	required_level: int = 1
	required_points: int = 0  # Total points spent in tree
	
	# Skill details
	max_rank: int = 1
	point_cost: int = 1
	mp_cost: int = 0
	hp_cost: int = 0
	cooldown: int = 0
	cast_time: float = 0.0
	
	# Combat
	target: TargetType = TargetType.SINGLE_ENEMY
	damage_type: DamageType = DamageType.NONE
	base_damage: int = 0
	damage_scaling: float = 1.0  # Multiplier per rank
	
	# Effects
	effects: List[SkillEffect] = field(default_factory=list)
	effects_per_rank: List[SkillEffect] = field(default_factory=list)  # Additional per rank
	
	def get_damage(self, rank: int = 1) -> int:
		"""Calculate damage at rank."""
		return int(self.base_damage * (self.damage_scaling ** (rank - 1)))
	
	def get_cost(self, rank: int = 1) -> int:
		"""Get point cost for rank."""
		return self.point_cost * rank
	
	def get_total_cost(self, rank: int) -> int:
		"""Get total points to max rank."""
		return sum(self.get_cost(r) for r in range(1, rank + 1))
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"id": self.skill_id,
			"name": self.name,
			"type": self.skill_type.name
		}
		
		if self.description:
			result["description"] = self.description
		
		# Position
		if self.branch != "main":
			result["branch"] = self.branch
		result["tier"] = self.tier
		if self.position:
			result["position"] = self.position
		
		# Requirements
		if self.prerequisites:
			result["prerequisites"] = self.prerequisites
		if self.required_level > 1:
			result["req_level"] = self.required_level
		if self.required_points:
			result["req_points"] = self.required_points
		
		# Details
		if self.max_rank > 1:
			result["max_rank"] = self.max_rank
		if self.point_cost != 1:
			result["point_cost"] = self.point_cost
		if self.mp_cost:
			result["mp_cost"] = self.mp_cost
		if self.hp_cost:
			result["hp_cost"] = self.hp_cost
		if self.cooldown:
			result["cooldown"] = self.cooldown
		if self.cast_time:
			result["cast_time"] = self.cast_time
		
		# Combat
		if self.target != TargetType.SINGLE_ENEMY:
			result["target"] = self.target.name
		if self.damage_type != DamageType.NONE:
			result["damage_type"] = self.damage_type.name
		if self.base_damage:
			result["base_damage"] = self.base_damage
		if self.damage_scaling != 1.0:
			result["damage_scaling"] = self.damage_scaling
		
		# Effects
		if self.effects:
			result["effects"] = [e.to_dict() for e in self.effects]
		if self.effects_per_rank:
			result["effects_per_rank"] = [e.to_dict() for e in self.effects_per_rank]
		
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "Skill":
		"""Create from dictionary."""
		effects = [SkillEffect.from_dict(e) for e in data.get("effects", [])]
		effects_per_rank = [SkillEffect.from_dict(e) for e in data.get("effects_per_rank", [])]
		
		return cls(
			skill_id=data["id"],
			name=data["name"],
			skill_type=SkillType[data.get("type", "ACTIVE")],
			description=data.get("description", ""),
			branch=data.get("branch", "main"),
			tier=data.get("tier", 1),
			position=data.get("position", 0),
			prerequisites=data.get("prerequisites", []),
			required_level=data.get("req_level", 1),
			required_points=data.get("req_points", 0),
			max_rank=data.get("max_rank", 1),
			point_cost=data.get("point_cost", 1),
			mp_cost=data.get("mp_cost", 0),
			hp_cost=data.get("hp_cost", 0),
			cooldown=data.get("cooldown", 0),
			cast_time=data.get("cast_time", 0.0),
			target=TargetType[data["target"]] if "target" in data else TargetType.SINGLE_ENEMY,
			damage_type=DamageType[data["damage_type"]] if "damage_type" in data else DamageType.NONE,
			base_damage=data.get("base_damage", 0),
			damage_scaling=data.get("damage_scaling", 1.0),
			effects=effects,
			effects_per_rank=effects_per_rank
		)


@dataclass
class SkillBranch:
	"""A branch of the skill tree."""
	branch_id: str
	name: str
	description: str = ""
	color: str = "#808080"
	required_level: int = 1


class SkillTree:
	"""A complete skill tree."""
	
	def __init__(self, name: str = ""):
		self.name = name
		self.skills: Dict[str, Skill] = {}
		self.branches: Dict[str, SkillBranch] = {}
		self.metadata: Dict[str, Any] = {}
		self.allocated: Dict[str, int] = {}  # skill_id -> rank
	
	def add_skill(self, skill: Skill) -> None:
		"""Add skill to tree."""
		self.skills[skill.skill_id] = skill
	
	def add_branch(self, branch: SkillBranch) -> None:
		"""Add branch definition."""
		self.branches[branch.branch_id] = branch
	
	def get_skill(self, skill_id: str) -> Optional[Skill]:
		"""Get skill by ID."""
		return self.skills.get(skill_id)
	
	def get_by_branch(self, branch: str) -> List[Skill]:
		"""Get skills in a branch."""
		return [s for s in self.skills.values() if s.branch == branch]
	
	def get_by_tier(self, tier: int) -> List[Skill]:
		"""Get skills at a tier."""
		return [s for s in self.skills.values() if s.tier == tier]
	
	def get_max_tier(self) -> int:
		"""Get maximum tier depth."""
		if not self.skills:
			return 0
		return max(s.tier for s in self.skills.values())
	
	def get_available(self, level: int = 99) -> List[Skill]:
		"""Get skills available for allocation."""
		available = []
		spent = self.get_points_spent()
		
		for skill in self.skills.values():
			# Check level
			if skill.required_level > level:
				continue
			
			# Check points
			if skill.required_points > spent:
				continue
			
			# Check prerequisites
			prereqs_met = True
			for prereq_id in skill.prerequisites:
				if self.allocated.get(prereq_id, 0) < 1:
					prereqs_met = False
					break
			
			if not prereqs_met:
				continue
			
			# Check if can still allocate
			current = self.allocated.get(skill.skill_id, 0)
			if current < skill.max_rank:
				available.append(skill)
		
		return available
	
	def allocate(self, skill_id: str) -> bool:
		"""Allocate a point to skill."""
		skill = self.get_skill(skill_id)
		if not skill:
			return False
		
		current = self.allocated.get(skill_id, 0)
		if current >= skill.max_rank:
			return False
		
		self.allocated[skill_id] = current + 1
		return True
	
	def deallocate(self, skill_id: str) -> bool:
		"""Remove a point from skill."""
		current = self.allocated.get(skill_id, 0)
		if current <= 0:
			return False
		
		# Check if other skills depend on this
		for skill in self.skills.values():
			if skill_id in skill.prerequisites:
				if self.allocated.get(skill.skill_id, 0) > 0:
					return False  # Can't remove, dependency exists
		
		self.allocated[skill_id] = current - 1
		return True
	
	def reset(self) -> None:
		"""Reset all allocations."""
		self.allocated.clear()
	
	def get_points_spent(self) -> int:
		"""Get total points spent."""
		total = 0
		for skill_id, rank in self.allocated.items():
			skill = self.get_skill(skill_id)
			if skill:
				total += skill.get_total_cost(rank)
		return total
	
	def validate(self) -> List[str]:
		"""Validate tree structure."""
		issues = []
		
		all_ids = set(self.skills.keys())
		
		for skill in self.skills.values():
			# Check prerequisites exist
			for prereq in skill.prerequisites:
				if prereq not in all_ids:
					issues.append(
						f"Skill '{skill.name}': Missing prerequisite '{prereq}'"
					)
			
			# Check tier ordering
			for prereq in skill.prerequisites:
				prereq_skill = self.skills.get(prereq)
				if prereq_skill and prereq_skill.tier >= skill.tier:
					issues.append(
						f"Skill '{skill.name}': Prerequisite '{prereq}' at same or higher tier"
					)
			
			# Check branch exists
			if self.branches and skill.branch not in self.branches:
				issues.append(
					f"Skill '{skill.name}': Unknown branch '{skill.branch}'"
				)
		
		# Check for circular dependencies
		for skill in self.skills.values():
			visited = set()
			stack = [skill.skill_id]
			
			while stack:
				current = stack.pop()
				if current in visited:
					issues.append(
						f"Skill '{skill.name}': Circular dependency detected"
					)
					break
				visited.add(current)
				
				if current in all_ids:
					for prereq in self.skills[current].prerequisites:
						if prereq not in visited:
							stack.append(prereq)
		
		return issues
	
	def generate_ascii_tree(self) -> str:
		"""Generate ASCII representation of tree."""
		lines = []
		max_tier = self.get_max_tier()
		
		for tier in range(1, max_tier + 1):
			skills = sorted(self.get_by_tier(tier), key=lambda s: (s.branch, s.position))
			
			if tier > 1:
				# Draw connections
				conn_line = "    "
				for skill in skills:
					if skill.prerequisites:
						conn_line += " |   "
					else:
						conn_line += "     "
				lines.append(conn_line)
			
			# Draw skill nodes
			skill_line = f"T{tier}: "
			for skill in skills:
				rank = self.allocated.get(skill.skill_id, 0)
				if rank > 0:
					skill_line += f"[{skill.name[:6]}({rank}/{skill.max_rank})] "
				else:
					skill_line += f"({skill.name[:8]}) "
			
			lines.append(skill_line)
		
		return "\n".join(lines)
	
	def generate_mermaid(self) -> str:
		"""Generate Mermaid diagram."""
		lines = ["flowchart TD"]
		
		for skill in self.skills.values():
			node_id = skill.skill_id.replace("-", "_")
			label = skill.name
			
			# Node shape based on type
			if skill.skill_type == SkillType.PASSIVE:
				lines.append(f"    {node_id}([{label}])")
			elif skill.skill_type == SkillType.ULTIMATE:
				lines.append(f"    {node_id}[[\"{label}\"]]")
			else:
				lines.append(f"    {node_id}[{label}]")
			
			# Connections
			for prereq in skill.prerequisites:
				prereq_id = prereq.replace("-", "_")
				lines.append(f"    {prereq_id} --> {node_id}")
		
		return "\n".join(lines)
	
	def load(self, filepath: str) -> None:
		"""Load from JSON."""
		with open(filepath, "r", encoding="utf-8") as f:
			data = json.load(f)
		
		self.name = data.get("name", "")
		self.metadata = data.get("metadata", {})
		
		for branch_data in data.get("branches", []):
			branch = SkillBranch(
				branch_id=branch_data["id"],
				name=branch_data["name"],
				description=branch_data.get("description", ""),
				color=branch_data.get("color", "#808080"),
				required_level=branch_data.get("req_level", 1)
			)
			self.add_branch(branch)
		
		for skill_data in data.get("skills", []):
			skill = Skill.from_dict(skill_data)
			self.add_skill(skill)
	
	def save(self, filepath: str) -> None:
		"""Save to JSON."""
		data = {
			"name": self.name,
			"metadata": self.metadata,
			"branches": [
				{
					"id": b.branch_id,
					"name": b.name,
					"description": b.description,
					"color": b.color,
					"req_level": b.required_level
				}
				for b in self.branches.values()
			],
			"skills": [s.to_dict() for s in self.skills.values()]
		}
		
		with open(filepath, "w", encoding="utf-8") as f:
			json.dump(data, f, indent="\t", ensure_ascii=False)


def create_example_tree() -> SkillTree:
	"""Create example skill tree."""
	tree = SkillTree("Warrior")
	tree.metadata = {"game": "Example RPG", "version": "1.0"}
	
	# Branches
	tree.add_branch(SkillBranch("offense", "Offense", "Damage dealing skills", "#FF6B6B"))
	tree.add_branch(SkillBranch("defense", "Defense", "Protective skills", "#4ECDC4"))
	tree.add_branch(SkillBranch("utility", "Utility", "Support skills", "#45B7D1"))
	
	# Tier 1 - Base skills
	tree.add_skill(Skill(
		skill_id="power-strike",
		name="Power Strike",
		description="A powerful melee attack.",
		branch="offense",
		tier=1,
		base_damage=50,
		damage_type=DamageType.PHYSICAL,
		mp_cost=5,
		max_rank=5,
		damage_scaling=1.2
	))
	
	tree.add_skill(Skill(
		skill_id="shield-bash",
		name="Shield Bash",
		description="Strike with your shield, stunning the target.",
		branch="defense",
		tier=1,
		position=1,
		base_damage=20,
		damage_type=DamageType.PHYSICAL,
		mp_cost=8,
		max_rank=3,
		cooldown=10,
		effects=[SkillEffect("stun", duration=1)]
	))
	
	tree.add_skill(Skill(
		skill_id="battle-cry",
		name="Battle Cry",
		skill_type=SkillType.ACTIVE,
		description="Boost party attack power.",
		branch="utility",
		tier=1,
		position=2,
		target=TargetType.ALL_ALLIES,
		mp_cost=15,
		max_rank=3,
		cooldown=30,
		effects=[SkillEffect("buff", percent=10, duration=5, stat_target="attack")]
	))
	
	# Tier 2
	tree.add_skill(Skill(
		skill_id="double-strike",
		name="Double Strike",
		description="Attack twice in quick succession.",
		branch="offense",
		tier=2,
		prerequisites=["power-strike"],
		required_level=5,
		base_damage=35,
		damage_type=DamageType.PHYSICAL,
		mp_cost=10,
		max_rank=5,
		damage_scaling=1.15,
		effects=[SkillEffect("multi-hit", value=2)]
	))
	
	tree.add_skill(Skill(
		skill_id="armor-mastery",
		name="Armor Mastery",
		skill_type=SkillType.PASSIVE,
		description="Increase defense while wearing heavy armor.",
		branch="defense",
		tier=2,
		position=1,
		prerequisites=["shield-bash"],
		required_level=5,
		max_rank=5,
		effects=[SkillEffect("buff", percent=5, stat_target="defense")]
	))
	
	tree.add_skill(Skill(
		skill_id="taunt",
		name="Taunt",
		description="Force enemies to attack you.",
		branch="utility",
		tier=2,
		position=2,
		prerequisites=["battle-cry"],
		required_level=5,
		target=TargetType.ALL_ENEMIES,
		mp_cost=10,
		max_rank=3,
		cooldown=15,
		effects=[SkillEffect("taunt", duration=3)]
	))
	
	# Tier 3
	tree.add_skill(Skill(
		skill_id="whirlwind",
		name="Whirlwind",
		description="Spin and hit all nearby enemies.",
		branch="offense",
		tier=3,
		prerequisites=["double-strike"],
		required_level=15,
		required_points=10,
		target=TargetType.AREA,
		base_damage=80,
		damage_type=DamageType.PHYSICAL,
		mp_cost=25,
		max_rank=5,
		cooldown=20
	))
	
	tree.add_skill(Skill(
		skill_id="iron-skin",
		name="Iron Skin",
		skill_type=SkillType.TOGGLE,
		description="Greatly increase defense but reduce speed.",
		branch="defense",
		tier=3,
		position=1,
		prerequisites=["armor-mastery"],
		required_level=15,
		required_points=10,
		target=TargetType.SELF,
		mp_cost=5,  # Per turn
		max_rank=3,
		effects=[
			SkillEffect("buff", percent=30, stat_target="defense"),
			SkillEffect("debuff", percent=-20, stat_target="speed")
		]
	))
	
	# Tier 4 - Ultimate
	tree.add_skill(Skill(
		skill_id="blade-storm",
		name="Blade Storm",
		skill_type=SkillType.ULTIMATE,
		description="Unleash a devastating flurry of attacks.",
		branch="offense",
		tier=4,
		prerequisites=["whirlwind"],
		required_level=30,
		required_points=25,
		target=TargetType.ALL_ENEMIES,
		base_damage=200,
		damage_type=DamageType.PHYSICAL,
		mp_cost=50,
		max_rank=1,
		cooldown=60,
		effects=[SkillEffect("multi-hit", value=5)]
	))
	
	return tree


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Skill Tree Manager")
	parser.add_argument("treefile", nargs="?", help="Skill tree JSON file")
	parser.add_argument("--list", "-l", action="store_true",
						help="List all skills")
	parser.add_argument("--validate", "-v", action="store_true",
						help="Validate tree structure")
	parser.add_argument("--visualize", action="store_true",
						help="Show ASCII tree")
	parser.add_argument("--mermaid", "-m", action="store_true",
						help="Generate Mermaid diagram")
	parser.add_argument("--branch", "-b", help="Filter by branch")
	parser.add_argument("--tier", "-t", type=int, help="Filter by tier")
	parser.add_argument("--create-example", action="store_true",
						help="Create example tree")
	parser.add_argument("--export", "-e", help="Export to file")
	
	args = parser.parse_args()
	
	tree = SkillTree()
	
	if args.create_example:
		tree = create_example_tree()
		output = args.treefile or "skill_tree.json"
		tree.save(output)
		print(f"Created example tree: {output}")
		print(f"Skills: {len(tree.skills)}")
		return
	
	if args.treefile and os.path.exists(args.treefile):
		tree.load(args.treefile)
		print(f"Loaded: {args.treefile}")
	else:
		tree = create_example_tree()
		print("Skill Tree Manager - Demo Mode")
		print(f"Tree: {tree.name}")
	
	print(f"Skills: {len(tree.skills)}")
	print(f"Tiers: {tree.get_max_tier()}")
	print()
	
	# List skills
	if args.list:
		print("All Skills:")
		for tier in range(1, tree.get_max_tier() + 1):
			skills = tree.get_by_tier(tier)
			print(f"\n  Tier {tier}:")
			for skill in skills:
				prereqs = f" <- {', '.join(skill.prerequisites)}" if skill.prerequisites else ""
				print(f"    [{skill.skill_id}] {skill.name} ({skill.skill_type.name}){prereqs}")
				if skill.base_damage:
					print(f"      Damage: {skill.base_damage} ({skill.damage_type.name})")
				if skill.mp_cost:
					print(f"      MP: {skill.mp_cost}")
		print()
	
	# Filter by branch
	if args.branch:
		skills = tree.get_by_branch(args.branch)
		print(f"{args.branch.title()} Branch ({len(skills)} skills):")
		for skill in skills:
			print(f"  T{skill.tier}: {skill.name}")
		print()
	
	# Filter by tier
	if args.tier:
		skills = tree.get_by_tier(args.tier)
		print(f"Tier {args.tier} Skills ({len(skills)}):")
		for skill in skills:
			print(f"  [{skill.branch}] {skill.name}")
		print()
	
	# Validate
	if args.validate:
		issues = tree.validate()
		if issues:
			print(f"Validation Issues ({len(issues)}):")
			for issue in issues:
				print(f"  - {issue}")
		else:
			print("No validation issues found")
		print()
	
	# Visualize
	if args.visualize:
		print("Skill Tree:")
		print(tree.generate_ascii_tree())
		print()
	
	# Mermaid
	if args.mermaid:
		print("Mermaid Diagram:")
		print(tree.generate_mermaid())
		print()
	
	# Export
	if args.export:
		tree.save(args.export)
		print(f"Exported to: {args.export}")


if __name__ == "__main__":
	main()
