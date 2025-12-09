#!/usr/bin/env python3
"""
NPC Dialogue Manager - Manage NPC text and dialogue trees.

Tools for organizing, editing, and validating NPC dialogue
with support for branching conversations and variables.

Usage:
	python npc_dialogue.py <dialogue.json>
	python npc_dialogue.py --validate
	python npc_dialogue.py --export

Features:
	- Dialogue tree editing
	- Variable substitution
	- Condition handling
	- Text validation
	- Export to game format
"""

import argparse
import json
import os
import re
import sys
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Set, Tuple


class DialogueState(Enum):
	"""Dialogue progression states."""
	INITIAL = auto()
	IN_PROGRESS = auto()
	COMPLETE = auto()
	REPEATABLE = auto()


@dataclass
class DialogueChoice:
	"""A player choice in dialogue."""
	text: str
	target_id: str
	conditions: List[str] = field(default_factory=list)
	effects: List[str] = field(default_factory=list)

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"text": self.text,
			"target": self.target_id
		}
		if self.conditions:
			result["conditions"] = self.conditions
		if self.effects:
			result["effects"] = self.effects
		return result

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "DialogueChoice":
		"""Create from dictionary."""
		return cls(
			text=data["text"],
			target_id=data["target"],
			conditions=data.get("conditions", []),
			effects=data.get("effects", [])
		)


@dataclass
class DialogueNode:
	"""A node in a dialogue tree."""
	node_id: str
	text: str
	speaker: str = ""
	choices: List[DialogueChoice] = field(default_factory=list)
	next_id: str = ""
	conditions: List[str] = field(default_factory=list)
	effects: List[str] = field(default_factory=list)
	is_end: bool = False

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"id": self.node_id,
			"text": self.text
		}

		if self.speaker:
			result["speaker"] = self.speaker
		if self.choices:
			result["choices"] = [c.to_dict() for c in self.choices]
		if self.next_id:
			result["next"] = self.next_id
		if self.conditions:
			result["conditions"] = self.conditions
		if self.effects:
			result["effects"] = self.effects
		if self.is_end:
			result["end"] = True

		return result

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "DialogueNode":
		"""Create from dictionary."""
		choices = [DialogueChoice.from_dict(c) for c in data.get("choices", [])]

		return cls(
			node_id=data["id"],
			text=data["text"],
			speaker=data.get("speaker", ""),
			choices=choices,
			next_id=data.get("next", ""),
			conditions=data.get("conditions", []),
			effects=data.get("effects", []),
			is_end=data.get("end", False)
		)


@dataclass
class NPC:
	"""An NPC with dialogue."""
	npc_id: int
	name: str
	location: str = ""
	portrait_id: int = 0
	dialogues: Dict[str, List[DialogueNode]] = field(default_factory=dict)
	state: DialogueState = DialogueState.INITIAL

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"id": self.npc_id,
			"name": self.name
		}

		if self.location:
			result["location"] = self.location
		if self.portrait_id:
			result["portrait"] = self.portrait_id

		result["dialogues"] = {}
		for key, nodes in self.dialogues.items():
			result["dialogues"][key] = [n.to_dict() for n in nodes]

		if self.state != DialogueState.INITIAL:
			result["state"] = self.state.name

		return result

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "NPC":
		"""Create from dictionary."""
		dialogues = {}
		for key, nodes_data in data.get("dialogues", {}).items():
			dialogues[key] = [DialogueNode.from_dict(n) for n in nodes_data]

		return cls(
			npc_id=data["id"],
			name=data["name"],
			location=data.get("location", ""),
			portrait_id=data.get("portrait", 0),
			dialogues=dialogues,
			state=DialogueState[data.get("state", "INITIAL")]
		)

	def get_all_text(self) -> List[str]:
		"""Get all dialogue text for this NPC."""
		texts = []
		for nodes in self.dialogues.values():
			for node in nodes:
				texts.append(node.text)
				for choice in node.choices:
					texts.append(choice.text)
		return texts


class DialogueManager:
	"""Manage NPC dialogues."""

	def __init__(self):
		self.npcs: Dict[int, NPC] = {}
		self.variables: Dict[str, Any] = {}
		self.metadata: Dict[str, Any] = {}

	def add_npc(self, npc: NPC) -> None:
		"""Add NPC to manager."""
		self.npcs[npc.npc_id] = npc

	def get_npc(self, npc_id: int) -> Optional[NPC]:
		"""Get NPC by ID."""
		return self.npcs.get(npc_id)

	def get_by_name(self, name: str) -> Optional[NPC]:
		"""Get NPC by name (case-insensitive)."""
		name_lower = name.lower()
		for npc in self.npcs.values():
			if npc.name.lower() == name_lower:
				return npc
		return None

	def search_text(self, query: str) -> List[Tuple[NPC, DialogueNode]]:
		"""Search all dialogue text."""
		query_lower = query.lower()
		results = []

		for npc in self.npcs.values():
			for nodes in npc.dialogues.values():
				for node in nodes:
					if query_lower in node.text.lower():
						results.append((npc, node))

		return results

	def get_by_location(self, location: str) -> List[NPC]:
		"""Get NPCs in a location."""
		location_lower = location.lower()
		return [npc for npc in self.npcs.values()
				if location_lower in npc.location.lower()]

	def substitute_variables(self, text: str) -> str:
		"""Replace variable placeholders with values."""
		# Pattern: {variable_name}
		def replace(match):
			var_name = match.group(1)
			return str(self.variables.get(var_name, f"{{{var_name}}}"))

		return re.sub(r'\{(\w+)\}', replace, text)

	def validate(self) -> List[str]:
		"""Validate all dialogue data."""
		issues = []

		for npc in self.npcs.values():
			# Check for empty dialogues
			if not npc.dialogues:
				issues.append(f"NPC '{npc.name}' has no dialogues")

			for dialogue_key, nodes in npc.dialogues.items():
				if not nodes:
					issues.append(f"NPC '{npc.name}' dialogue '{dialogue_key}' is empty")
					continue

				node_ids = {n.node_id for n in nodes}

				for node in nodes:
					# Check for broken links
					if node.next_id and node.next_id not in node_ids:
						if not node.next_id.startswith("$"):  # Skip special refs
							issues.append(
								f"NPC '{npc.name}': Node '{node.node_id}' links to "
								f"nonexistent '{node.next_id}'"
							)

					for choice in node.choices:
						if choice.target_id not in node_ids:
							if not choice.target_id.startswith("$"):
								issues.append(
									f"NPC '{npc.name}': Choice in '{node.node_id}' links to "
									f"nonexistent '{choice.target_id}'"
								)

					# Check for dead ends
					if not node.is_end and not node.next_id and not node.choices:
						issues.append(
							f"NPC '{npc.name}': Node '{node.node_id}' is a dead end"
						)

					# Check text length
					if len(node.text) > 200:
						issues.append(
							f"NPC '{npc.name}': Node '{node.node_id}' text too long "
							f"({len(node.text)} chars)"
						)

		return issues

	def get_stats(self) -> Dict[str, Any]:
		"""Get database statistics."""
		total_nodes = 0
		total_choices = 0
		total_chars = 0

		for npc in self.npcs.values():
			for nodes in npc.dialogues.values():
				total_nodes += len(nodes)
				for node in nodes:
					total_chars += len(node.text)
					total_choices += len(node.choices)

		return {
			"npc_count": len(self.npcs),
			"total_nodes": total_nodes,
			"total_choices": total_choices,
			"total_characters": total_chars,
			"avg_text_length": total_chars / total_nodes if total_nodes else 0
		}

	def load(self, filepath: str) -> None:
		"""Load from JSON file."""
		with open(filepath, "r", encoding="utf-8") as f:
			data = json.load(f)

		self.metadata = data.get("metadata", {})
		self.variables = data.get("variables", {})

		for npc_data in data.get("npcs", []):
			npc = NPC.from_dict(npc_data)
			self.add_npc(npc)

	def save(self, filepath: str) -> None:
		"""Save to JSON file."""
		data = {
			"metadata": self.metadata,
			"variables": self.variables,
			"npcs": [npc.to_dict() for npc in self.npcs.values()]
		}

		with open(filepath, "w", encoding="utf-8") as f:
			json.dump(data, f, indent="\t", ensure_ascii=False)

	def export_script(self, filepath: str) -> None:
		"""Export as readable script."""
		with open(filepath, "w", encoding="utf-8") as f:
			for npc in sorted(self.npcs.values(), key=lambda x: x.npc_id):
				f.write(f"{'=' * 60}\n")
				f.write(f"NPC: {npc.name} (ID: {npc.npc_id})\n")
				if npc.location:
					f.write(f"Location: {npc.location}\n")
				f.write(f"{'=' * 60}\n\n")

				for dialogue_key, nodes in npc.dialogues.items():
					f.write(f"[{dialogue_key}]\n")
					f.write("-" * 40 + "\n")

					for node in nodes:
						speaker = node.speaker or npc.name
						f.write(f"{speaker}: {node.text}\n")

						if node.choices:
							for i, choice in enumerate(node.choices, 1):
								f.write(f"  > {i}. {choice.text}\n")

						if node.is_end:
							f.write("  [END]\n")

						f.write("\n")

					f.write("\n")

	def export_atlas(self, filepath: str) -> None:
		"""Export for Atlas insertion."""
		with open(filepath, "w", encoding="utf-8") as f:
			for npc in sorted(self.npcs.values(), key=lambda x: x.npc_id):
				f.write(f"; NPC: {npc.name}\n")

				for nodes in npc.dialogues.values():
					for node in nodes:
						# Would need actual ROM offsets in real use
						f.write(f"#${npc.npc_id:04X}{ord(node.node_id[0]):02X}\n")
						f.write(f"{node.text}\n")
						f.write("<END>\n\n")


def create_example_database() -> DialogueManager:
	"""Create example dialogue database."""
	manager = DialogueManager()
	manager.metadata = {"game": "Example RPG", "version": "1.0"}
	manager.variables = {
		"player_name": "Hero",
		"town_name": "Riverdale"
	}

	# Innkeeper
	innkeeper = NPC(
		npc_id=1,
		name="Innkeeper",
		location="Town Inn"
	)
	innkeeper.dialogues["main"] = [
		DialogueNode(
			node_id="start",
			text="Welcome to the {town_name} Inn! Would you like to rest?",
			speaker="Innkeeper",
			choices=[
				DialogueChoice("Yes, please.", "rest"),
				DialogueChoice("No, thanks.", "decline"),
				DialogueChoice("How much?", "price")
			]
		),
		DialogueNode(
			node_id="rest",
			text="That'll be 10 gold. Have a good night!",
			speaker="Innkeeper",
			effects=["heal_party", "deduct_gold:10"],
			is_end=True
		),
		DialogueNode(
			node_id="decline",
			text="Come back whenever you need a rest.",
			speaker="Innkeeper",
			is_end=True
		),
		DialogueNode(
			node_id="price",
			text="It's 10 gold per night.",
			speaker="Innkeeper",
			next_id="start"
		)
	]
	manager.add_npc(innkeeper)

	# Shopkeeper
	shopkeeper = NPC(
		npc_id=2,
		name="Merchant",
		location="Town Shop"
	)
	shopkeeper.dialogues["main"] = [
		DialogueNode(
			node_id="start",
			text="Welcome, {player_name}! Browse my wares!",
			speaker="Merchant",
			choices=[
				DialogueChoice("Buy items", "$shop"),
				DialogueChoice("Sell items", "$sell"),
				DialogueChoice("Just looking", "browse")
			]
		),
		DialogueNode(
			node_id="browse",
			text="Take your time!",
			speaker="Merchant",
			is_end=True
		)
	]
	manager.add_npc(shopkeeper)

	# Quest NPC
	quest_npc = NPC(
		npc_id=3,
		name="Elder Thomas",
		location="Town Hall"
	)
	quest_npc.dialogues["initial"] = [
		DialogueNode(
			node_id="start",
			text="Oh, a traveler! Please, we need your help!",
			speaker="Elder",
			next_id="explain"
		),
		DialogueNode(
			node_id="explain",
			text="Monsters have been attacking from the nearby cave. Can you clear them out?",
			speaker="Elder",
			choices=[
				DialogueChoice("I'll help!", "accept"),
				DialogueChoice("Not right now.", "decline")
			]
		),
		DialogueNode(
			node_id="accept",
			text="Thank you! The cave is to the east of town.",
			speaker="Elder",
			effects=["start_quest:cave_monsters"],
			is_end=True
		),
		DialogueNode(
			node_id="decline",
			text="I understand. Please reconsider when you're ready.",
			speaker="Elder",
			is_end=True
		)
	]
	quest_npc.dialogues["complete"] = [
		DialogueNode(
			node_id="start",
			text="You've saved our town! Please accept this reward.",
			speaker="Elder",
			effects=["give_gold:500", "give_item:Magic Sword"],
			is_end=True
		)
	]
	manager.add_npc(quest_npc)

	return manager


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="NPC Dialogue Manager")
	parser.add_argument("database", nargs="?", help="Dialogue JSON file")
	parser.add_argument("--search", "-s", help="Search dialogue text")
	parser.add_argument("--npc", "-n", help="Show dialogue for NPC")
	parser.add_argument("--location", "-l", help="List NPCs in location")
	parser.add_argument("--validate", "-v", action="store_true",
						help="Validate dialogues")
	parser.add_argument("--export", "-e", help="Export to file")
	parser.add_argument("--create-example", action="store_true",
						help="Create example database")

	args = parser.parse_args()

	manager = DialogueManager()

	if args.create_example:
		manager = create_example_database()
		output = args.database or "dialogue.json"
		manager.save(output)
		print(f"Created example database: {output}")
		print(f"NPCs: {len(manager.npcs)}")
		return

	if args.database:
		if os.path.exists(args.database):
			manager.load(args.database)
			print(f"Loaded: {args.database}")
			print(f"NPCs: {len(manager.npcs)}")
		else:
			print(f"Database not found: {args.database}")
			print("Use --create-example to create a new database")
			return
	else:
		# Demo mode
		manager = create_example_database()
		print("NPC Dialogue Manager")
		print()
		print("Usage: python npc_dialogue.py <dialogue.json>")
		print()
		print("Demo mode - using example data:")

	print()

	# Show stats
	stats = manager.get_stats()
	print(f"NPCs: {stats['npc_count']}")
	print(f"Total dialogue nodes: {stats['total_nodes']}")
	print(f"Total choices: {stats['total_choices']}")
	print(f"Total text: {stats['total_characters']} characters")
	print()

	# Search
	if args.search:
		results = manager.search_text(args.search)
		print(f"Search results for '{args.search}' ({len(results)}):")
		for npc, node in results:
			preview = node.text[:50] + "..." if len(node.text) > 50 else node.text
			print(f"  {npc.name}: {preview}")
		print()

	# Show NPC
	if args.npc:
		npc = manager.get_by_name(args.npc)
		if npc:
			print(f"NPC: {npc.name} (ID: {npc.npc_id})")
			if npc.location:
				print(f"Location: {npc.location}")
			print()

			for key, nodes in npc.dialogues.items():
				print(f"[{key}]")
				for node in nodes:
					text = manager.substitute_variables(node.text)
					print(f"  {node.node_id}: {text[:60]}...")
				print()
		else:
			print(f"NPC not found: {args.npc}")
		print()

	# List by location
	if args.location:
		npcs = manager.get_by_location(args.location)
		print(f"NPCs in '{args.location}' ({len(npcs)}):")
		for npc in npcs:
			print(f"  [{npc.npc_id}] {npc.name}")
		print()

	# Validate
	if args.validate:
		issues = manager.validate()
		if issues:
			print(f"Validation issues ({len(issues)}):")
			for issue in issues:
				print(f"  - {issue}")
		else:
			print("No validation issues found")
		print()

	# Export
	if args.export:
		if args.export.endswith(".txt"):
			manager.export_script(args.export)
		elif args.export.endswith(".atlas"):
			manager.export_atlas(args.export)
		else:
			manager.save(args.export)
		print(f"Exported to: {args.export}")


if __name__ == "__main__":
	main()
