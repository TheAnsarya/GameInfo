#!/usr/bin/env python3
"""
Dialog Tree Editor - Create and edit branching dialog systems.

Tools for working with dialog trees and conversation systems.

Usage:
	python dialog_tree.py --edit dialog.json
	python dialog_tree.py --create 10 --output tree.json
	python dialog_tree.py --validate dialog.json

Features:
	- Branching conversations
	- Choice/response tracking
	- Condition checking
	- Variable setting
	- Tree visualization
"""

import argparse
import json
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Any, Dict, List, Optional, Set, Tuple


class NodeType(Enum):
	"""Dialog node types."""
	TEXT = 0           # Simple text display
	CHOICE = 1         # Player choice
	BRANCH = 2         # Conditional branch
	SET_FLAG = 3       # Set a flag/variable
	JUMP = 4           # Jump to another node
	END = 5            # End conversation
	SHOP = 6           # Open shop
	BATTLE = 7         # Start battle
	EVENT = 8          # Trigger event


class ConditionType(Enum):
	"""Condition types."""
	NONE = 0
	FLAG_SET = 1       # Flag is true
	FLAG_CLEAR = 2     # Flag is false
	ITEM_HAS = 3       # Has item
	ITEM_LACKS = 4     # Doesn't have item
	GOLD_GTE = 5       # Gold >= value
	GOLD_LT = 6        # Gold < value
	LEVEL_GTE = 7      # Level >= value
	RANDOM = 8         # Random chance


@dataclass
class Condition:
	"""A condition for dialog branching."""
	condition_type: ConditionType = ConditionType.NONE
	param_name: str = ""
	param_value: int = 0

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"type": self.condition_type.name,
			"param_name": self.param_name,
			"param_value": self.param_value
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "Condition":
		"""Create from dictionary."""
		return cls(
			condition_type=ConditionType[data.get("type", "NONE")],
			param_name=data.get("param_name", ""),
			param_value=data.get("param_value", 0)
		)


@dataclass
class DialogChoice:
	"""A choice option in dialog."""
	choice_id: int
	text: str
	next_node: int
	condition: Optional[Condition] = None

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"choice_id": self.choice_id,
			"text": self.text,
			"next_node": self.next_node
		}
		if self.condition:
			result["condition"] = self.condition.to_dict()
		return result

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "DialogChoice":
		"""Create from dictionary."""
		condition = None
		if "condition" in data:
			condition = Condition.from_dict(data["condition"])

		return cls(
			choice_id=data.get("choice_id", 0),
			text=data.get("text", ""),
			next_node=data.get("next_node", -1),
			condition=condition
		)


@dataclass
class DialogNode:
	"""A node in the dialog tree."""
	node_id: int
	node_type: NodeType = NodeType.TEXT

	# Text content
	speaker: str = ""
	text: str = ""

	# Navigation
	next_node: int = -1  # Next node ID, -1 = end

	# Choices (for CHOICE nodes)
	choices: List[DialogChoice] = field(default_factory=list)

	# Conditions (for BRANCH nodes)
	condition: Optional[Condition] = None
	branch_true: int = -1
	branch_false: int = -1

	# Actions
	flag_name: str = ""
	flag_value: int = 0
	event_id: int = 0

	# Display properties
	portrait_id: int = 0
	emotion: str = ""

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"node_id": self.node_id,
			"node_type": self.node_type.name,
			"speaker": self.speaker,
			"text": self.text,
			"next_node": self.next_node,
			"portrait_id": self.portrait_id,
			"emotion": self.emotion
		}

		if self.choices:
			result["choices"] = [c.to_dict() for c in self.choices]

		if self.condition:
			result["condition"] = self.condition.to_dict()
			result["branch_true"] = self.branch_true
			result["branch_false"] = self.branch_false

		if self.flag_name:
			result["flag_name"] = self.flag_name
			result["flag_value"] = self.flag_value

		if self.event_id:
			result["event_id"] = self.event_id

		return result

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "DialogNode":
		"""Create from dictionary."""
		node = cls(
			node_id=data.get("node_id", 0),
			node_type=NodeType[data.get("node_type", "TEXT")],
			speaker=data.get("speaker", ""),
			text=data.get("text", ""),
			next_node=data.get("next_node", -1),
			portrait_id=data.get("portrait_id", 0),
			emotion=data.get("emotion", ""),
			flag_name=data.get("flag_name", ""),
			flag_value=data.get("flag_value", 0),
			event_id=data.get("event_id", 0),
			branch_true=data.get("branch_true", -1),
			branch_false=data.get("branch_false", -1)
		)

		for choice_data in data.get("choices", []):
			node.choices.append(DialogChoice.from_dict(choice_data))

		if "condition" in data:
			node.condition = Condition.from_dict(data["condition"])

		return node


@dataclass
class DialogTree:
	"""A complete dialog tree."""
	tree_id: int
	name: str = ""

	# Start node
	start_node: int = 0

	# All nodes
	nodes: Dict[int, DialogNode] = field(default_factory=dict)

	def get_node(self, node_id: int) -> Optional[DialogNode]:
		"""Get node by ID."""
		return self.nodes.get(node_id)

	def add_node(self, node: DialogNode):
		"""Add node to tree."""
		self.nodes[node.node_id] = node

	def get_all_paths(self) -> List[List[int]]:
		"""Get all possible paths through dialog."""
		paths = []

		def traverse(node_id: int, path: List[int], visited: Set[int]):
			if node_id < 0 or node_id in visited:
				if path:
					paths.append(path.copy())
				return

			visited.add(node_id)
			path.append(node_id)

			node = self.nodes.get(node_id)
			if not node:
				paths.append(path.copy())
				return

			if node.node_type == NodeType.END:
				paths.append(path.copy())
			elif node.node_type == NodeType.CHOICE:
				for choice in node.choices:
					traverse(choice.next_node, path.copy(), visited.copy())
			elif node.node_type == NodeType.BRANCH:
				traverse(node.branch_true, path.copy(), visited.copy())
				traverse(node.branch_false, path.copy(), visited.copy())
			else:
				traverse(node.next_node, path, visited)

		traverse(self.start_node, [], set())
		return paths

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"tree_id": self.tree_id,
			"name": self.name,
			"start_node": self.start_node,
			"nodes": [n.to_dict() for n in self.nodes.values()]
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "DialogTree":
		"""Create from dictionary."""
		tree = cls(
			tree_id=data.get("tree_id", 0),
			name=data.get("name", ""),
			start_node=data.get("start_node", 0)
		)

		for node_data in data.get("nodes", []):
			node = DialogNode.from_dict(node_data)
			tree.nodes[node.node_id] = node

		return tree


class DialogTreeEditor:
	"""Editor for dialog trees."""

	def __init__(self):
		self.trees: Dict[int, DialogTree] = {}

	def create_tree(self, tree_id: int, name: str = "") -> DialogTree:
		"""Create a new dialog tree."""
		tree = DialogTree(tree_id=tree_id, name=name or f"Dialog_{tree_id}")
		self.trees[tree_id] = tree
		return tree

	def add_text_node(self, tree_id: int, node_id: int, speaker: str,
					 text: str, next_node: int = -1) -> Optional[DialogNode]:
		"""Add a text node."""
		if tree_id not in self.trees:
			return None

		node = DialogNode(
			node_id=node_id,
			node_type=NodeType.TEXT,
			speaker=speaker,
			text=text,
			next_node=next_node
		)
		self.trees[tree_id].add_node(node)
		return node

	def add_choice_node(self, tree_id: int, node_id: int, speaker: str,
					   text: str, choices: List[Tuple[str, int]]) -> Optional[DialogNode]:
		"""Add a choice node."""
		if tree_id not in self.trees:
			return None

		node = DialogNode(
			node_id=node_id,
			node_type=NodeType.CHOICE,
			speaker=speaker,
			text=text
		)

		for i, (choice_text, next_id) in enumerate(choices):
			node.choices.append(DialogChoice(
				choice_id=i,
				text=choice_text,
				next_node=next_id
			))

		self.trees[tree_id].add_node(node)
		return node

	def add_branch_node(self, tree_id: int, node_id: int, condition: Condition,
					   true_node: int, false_node: int) -> Optional[DialogNode]:
		"""Add a conditional branch node."""
		if tree_id not in self.trees:
			return None

		node = DialogNode(
			node_id=node_id,
			node_type=NodeType.BRANCH,
			condition=condition,
			branch_true=true_node,
			branch_false=false_node
		)
		self.trees[tree_id].add_node(node)
		return node

	def validate_tree(self, tree: DialogTree) -> List[str]:
		"""Validate dialog tree."""
		errors = []

		# Check start node exists
		if tree.start_node not in tree.nodes:
			errors.append(f"Start node {tree.start_node} does not exist")

		# Check all referenced nodes exist
		for node in tree.nodes.values():
			if node.next_node >= 0 and node.next_node not in tree.nodes:
				errors.append(f"Node {node.node_id}: next_node {node.next_node} doesn't exist")

			for choice in node.choices:
				if choice.next_node >= 0 and choice.next_node not in tree.nodes:
					errors.append(
						f"Node {node.node_id}, choice {choice.choice_id}: "
						f"next_node {choice.next_node} doesn't exist"
					)

			if node.node_type == NodeType.BRANCH:
				if node.branch_true >= 0 and node.branch_true not in tree.nodes:
					errors.append(
						f"Node {node.node_id}: branch_true {node.branch_true} doesn't exist"
					)
				if node.branch_false >= 0 and node.branch_false not in tree.nodes:
					errors.append(
						f"Node {node.node_id}: branch_false {node.branch_false} doesn't exist"
					)

		# Check for unreachable nodes
		reachable = set()

		def mark_reachable(node_id: int):
			if node_id < 0 or node_id in reachable:
				return
			reachable.add(node_id)
			node = tree.nodes.get(node_id)
			if not node:
				return
			mark_reachable(node.next_node)
			for choice in node.choices:
				mark_reachable(choice.next_node)
			if node.node_type == NodeType.BRANCH:
				mark_reachable(node.branch_true)
				mark_reachable(node.branch_false)

		mark_reachable(tree.start_node)

		for node_id in tree.nodes:
			if node_id not in reachable:
				errors.append(f"Node {node_id} is unreachable")

		# Check for missing ends
		for node in tree.nodes.values():
			if node.node_type == NodeType.TEXT and node.next_node < 0:
				# This is okay, it's an implicit end
				pass
			elif node.node_type == NodeType.CHOICE and not node.choices:
				errors.append(f"Choice node {node.node_id} has no choices")

		return errors

	def load_json(self, path: Path):
		"""Load from JSON."""
		with open(path) as f:
			data = json.load(f)

		for tree_data in data.get("trees", []):
			tree = DialogTree.from_dict(tree_data)
			self.trees[tree.tree_id] = tree

	def save_json(self, path: Path):
		"""Save to JSON."""
		data = {
			"trees": [t.to_dict() for t in self.trees.values()]
		}

		with open(path, "w") as f:
			json.dump(data, f, indent="\t")

	def format_tree(self, tree: DialogTree) -> str:
		"""Format tree for display."""
		lines = []
		lines.append(f"Dialog Tree: {tree.name} (ID: {tree.tree_id})")
		lines.append("=" * 60)
		lines.append(f"Start Node: {tree.start_node}")
		lines.append(f"Total Nodes: {len(tree.nodes)}")
		lines.append("")

		# Count node types
		type_counts = {}
		for node in tree.nodes.values():
			type_name = node.node_type.name
			type_counts[type_name] = type_counts.get(type_name, 0) + 1

		lines.append("Node Types:")
		for type_name, count in sorted(type_counts.items()):
			lines.append(f"  {type_name}: {count}")

		# Get paths
		paths = tree.get_all_paths()
		lines.append("")
		lines.append(f"Possible Paths: {len(paths)}")

		if paths:
			avg_len = sum(len(p) for p in paths) / len(paths)
			lines.append(f"Average Path Length: {avg_len:.1f}")
			lines.append(f"Shortest Path: {min(len(p) for p in paths)}")
			lines.append(f"Longest Path: {max(len(p) for p in paths)}")

		return "\n".join(lines)

	def format_node(self, node: DialogNode) -> str:
		"""Format node for display."""
		lines = []
		lines.append(f"Node {node.node_id} ({node.node_type.name})")
		lines.append("-" * 40)

		if node.speaker:
			lines.append(f"Speaker: {node.speaker}")
		if node.text:
			lines.append(f"Text: {node.text[:60]}...")

		if node.node_type == NodeType.TEXT:
			lines.append(f"Next: {node.next_node}")

		elif node.node_type == NodeType.CHOICE:
			lines.append("Choices:")
			for choice in node.choices:
				lines.append(f"  [{choice.choice_id}] {choice.text} -> {choice.next_node}")

		elif node.node_type == NodeType.BRANCH:
			if node.condition:
				lines.append(f"Condition: {node.condition.condition_type.name}")
				lines.append(f"  Param: {node.condition.param_name} = {node.condition.param_value}")
			lines.append(f"True -> {node.branch_true}")
			lines.append(f"False -> {node.branch_false}")

		return "\n".join(lines)

	def visualize_tree(self, tree: DialogTree, max_depth: int = 10) -> str:
		"""Create ASCII visualization of tree."""
		lines = []
		visited = set()

		def draw_node(node_id: int, indent: int, prefix: str = ""):
			if node_id < 0:
				lines.append(f"{' ' * indent}{prefix}[END]")
				return
			if node_id in visited or indent > max_depth * 2:
				lines.append(f"{' ' * indent}{prefix}[{node_id}]...")
				return

			visited.add(node_id)
			node = tree.nodes.get(node_id)
			if not node:
				lines.append(f"{' ' * indent}{prefix}[{node_id}] ???")
				return

			# Node header
			type_abbrev = node.node_type.name[:3]
			text_preview = node.text[:20] if node.text else ""
			lines.append(f"{' ' * indent}{prefix}[{node_id}] {type_abbrev}: {text_preview}")

			# Children
			if node.node_type == NodeType.CHOICE:
				for i, choice in enumerate(node.choices):
					choice_prefix = f"  {i+1}. "
					draw_node(choice.next_node, indent + 4, choice_prefix)
			elif node.node_type == NodeType.BRANCH:
				draw_node(node.branch_true, indent + 4, "Y: ")
				draw_node(node.branch_false, indent + 4, "N: ")
			else:
				if node.next_node >= 0:
					draw_node(node.next_node, indent + 2, "-> ")

		lines.append(f"Tree: {tree.name}")
		lines.append("=" * 40)
		draw_node(tree.start_node, 0)

		return "\n".join(lines)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Dialog Tree Editor")
	parser.add_argument("--create", "-c", type=int,
						help="Create tree with N sample nodes")
	parser.add_argument("--input", "-i", type=Path,
						help="Input JSON file")
	parser.add_argument("--output", "-o", type=Path,
						help="Output file")
	parser.add_argument("--validate", "-v", action="store_true",
						help="Validate dialog tree")
	parser.add_argument("--visualize", action="store_true",
						help="Show tree visualization")
	parser.add_argument("--tree-id", type=int, default=0,
						help="Tree ID to display")

	args = parser.parse_args()
	editor = DialogTreeEditor()

	if args.input:
		editor.load_json(args.input)

		tree = editor.trees.get(args.tree_id)
		if not tree:
			tree = list(editor.trees.values())[0] if editor.trees else None

		if tree:
			print(editor.format_tree(tree))

			if args.validate:
				print()
				errors = editor.validate_tree(tree)
				if errors:
					print("Validation Errors:")
					for e in errors:
						print(f"  - {e}")
				else:
					print("Validation: OK")

			if args.visualize:
				print()
				print(editor.visualize_tree(tree))
		return

	if args.create:
		tree = editor.create_tree(0, "Sample Dialog")

		# Create sample dialog
		editor.add_text_node(0, 0, "NPC", "Hello, traveler! How can I help you?", 1)

		editor.add_choice_node(0, 1, "NPC", "What would you like to know?", [
			("Tell me about this town", 2),
			("I need supplies", 3),
			("Nothing, goodbye", 4)
		])

		editor.add_text_node(0, 2, "NPC",
			"This is a peaceful village. We've had some trouble with monsters lately...", 5)

		editor.add_text_node(0, 3, "NPC",
			"The shop is just down the street.", -1)

		editor.add_text_node(0, 4, "NPC",
			"Safe travels!", -1)

		editor.add_choice_node(0, 5, "NPC", "Would you help us?", [
			("Of course!", 6),
			("Sorry, I'm busy", 4)
		])

		editor.add_text_node(0, 6, "NPC",
			"Thank you! Please speak to the mayor.", -1)

		print(editor.format_tree(tree))
		print()
		print(editor.visualize_tree(tree))

		if args.output:
			editor.save_json(args.output)
			print(f"\nSaved to: {args.output}")
		return

	# Default: show help
	print("Dialog Tree Editor")
	print()
	print("Usage:")
	print("  --create N               Create sample tree")
	print("  --input FILE             Load from JSON")
	print("  --validate               Validate tree")
	print("  --visualize              Show tree structure")
	print("  --output FILE            Save to file")


if __name__ == "__main__":
	main()
