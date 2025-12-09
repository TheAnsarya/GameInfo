#!/usr/bin/env python3
"""
Party/Team Editor - Edit party configuration and team data.

Tools for modifying party members, formation, and team settings.

Usage:
	python party_editor.py --analyze party.bin
	python party_editor.py --edit party.json
	python party_editor.py --create 4 --output team.json

Features:
	- Party member slots
	- Formation positions
	- Active/reserve status
	- Party inventory
	- Team statistics
"""

import argparse
import json
import struct
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


class PartyPosition(Enum):
	"""Party formation positions."""
	FRONT_LEFT = 0
	FRONT_CENTER = 1
	FRONT_RIGHT = 2
	BACK_LEFT = 3
	BACK_CENTER = 4
	BACK_RIGHT = 5
	RESERVE = 6


class MemberStatus(Enum):
	"""Party member status."""
	ACTIVE = 0
	RESERVE = 1
	UNAVAILABLE = 2
	DEAD = 3
	GUEST = 4


@dataclass
class PartyMember:
	"""A party member."""
	slot: int
	char_id: int = 0
	name: str = ""

	# Status
	status: MemberStatus = MemberStatus.ACTIVE
	position: PartyPosition = PartyPosition.FRONT_CENTER

	# Stats snapshot (for quick reference)
	level: int = 1
	current_hp: int = 0
	max_hp: int = 0
	current_mp: int = 0
	max_mp: int = 0

	# Equipment slots
	weapon: int = 0
	armor: int = 0
	shield: int = 0
	helmet: int = 0
	accessory: int = 0

	# AI/Control
	is_ai_controlled: bool = False
	tactics: int = 0  # AI behavior preset

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"slot": self.slot,
			"char_id": self.char_id,
			"name": self.name,
			"status": self.status.name,
			"position": self.position.name,
			"level": self.level,
			"current_hp": self.current_hp,
			"max_hp": self.max_hp,
			"current_mp": self.current_mp,
			"max_mp": self.max_mp,
			"equipment": {
				"weapon": self.weapon,
				"armor": self.armor,
				"shield": self.shield,
				"helmet": self.helmet,
				"accessory": self.accessory
			},
			"is_ai_controlled": self.is_ai_controlled,
			"tactics": self.tactics
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "PartyMember":
		"""Create from dictionary."""
		equipment = data.get("equipment", {})
		return cls(
			slot=data.get("slot", 0),
			char_id=data.get("char_id", 0),
			name=data.get("name", ""),
			status=MemberStatus[data.get("status", "ACTIVE")],
			position=PartyPosition[data.get("position", "FRONT_CENTER")],
			level=data.get("level", 1),
			current_hp=data.get("current_hp", 0),
			max_hp=data.get("max_hp", 0),
			current_mp=data.get("current_mp", 0),
			max_mp=data.get("max_mp", 0),
			weapon=equipment.get("weapon", 0),
			armor=equipment.get("armor", 0),
			shield=equipment.get("shield", 0),
			helmet=equipment.get("helmet", 0),
			accessory=equipment.get("accessory", 0),
			is_ai_controlled=data.get("is_ai_controlled", False),
			tactics=data.get("tactics", 0)
		)


@dataclass
class PartyInventory:
	"""Party shared inventory."""
	gold: int = 0

	# Items: item_id -> quantity
	items: Dict[int, int] = field(default_factory=dict)

	# Key items (flags)
	key_items: List[int] = field(default_factory=list)

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"gold": self.gold,
			"items": self.items,
			"key_items": self.key_items
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "PartyInventory":
		"""Create from dictionary."""
		return cls(
			gold=data.get("gold", 0),
			items={int(k): v for k, v in data.get("items", {}).items()},
			key_items=data.get("key_items", [])
		)


@dataclass
class Party:
	"""A complete party."""
	party_id: int = 0
	name: str = "Party"

	# Members
	members: List[PartyMember] = field(default_factory=list)
	max_active: int = 4
	max_reserve: int = 4

	# Shared resources
	inventory: PartyInventory = field(default_factory=PartyInventory)

	# Progress
	play_time: int = 0  # In seconds
	steps: int = 0
	battles: int = 0

	def get_active_members(self) -> List[PartyMember]:
		"""Get active party members."""
		return [m for m in self.members if m.status == MemberStatus.ACTIVE]

	def get_reserve_members(self) -> List[PartyMember]:
		"""Get reserve party members."""
		return [m for m in self.members if m.status == MemberStatus.RESERVE]

	def get_member_by_slot(self, slot: int) -> Optional[PartyMember]:
		"""Get member by slot."""
		for member in self.members:
			if member.slot == slot:
				return member
		return None

	def get_total_level(self) -> int:
		"""Get sum of all levels."""
		return sum(m.level for m in self.members)

	def get_average_level(self) -> float:
		"""Get average level."""
		if not self.members:
			return 0
		return self.get_total_level() / len(self.members)

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"party_id": self.party_id,
			"name": self.name,
			"members": [m.to_dict() for m in self.members],
			"max_active": self.max_active,
			"max_reserve": self.max_reserve,
			"inventory": self.inventory.to_dict(),
			"play_time": self.play_time,
			"steps": self.steps,
			"battles": self.battles
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "Party":
		"""Create from dictionary."""
		party = cls(
			party_id=data.get("party_id", 0),
			name=data.get("name", "Party"),
			max_active=data.get("max_active", 4),
			max_reserve=data.get("max_reserve", 4),
			play_time=data.get("play_time", 0),
			steps=data.get("steps", 0),
			battles=data.get("battles", 0)
		)

		for member_data in data.get("members", []):
			party.members.append(PartyMember.from_dict(member_data))

		party.inventory = PartyInventory.from_dict(data.get("inventory", {}))

		return party


class PartyEditor:
	"""Editor for party data."""

	def __init__(self):
		self.parties: Dict[int, Party] = {}

	def create_party(self, party_id: int = 0, name: str = "",
					max_members: int = 4) -> Party:
		"""Create a new party."""
		party = Party(party_id=party_id, name=name or f"Party_{party_id}")
		party.max_active = max_members
		self.parties[party_id] = party
		return party

	def add_member(self, party_id: int, member: PartyMember) -> bool:
		"""Add member to party."""
		if party_id in self.parties:
			party = self.parties[party_id]
			active_count = len(party.get_active_members())

			if member.status == MemberStatus.ACTIVE:
				if active_count >= party.max_active:
					member.status = MemberStatus.RESERVE

			party.members.append(member)
			return True
		return False

	def swap_members(self, party_id: int, slot1: int, slot2: int) -> bool:
		"""Swap two party members."""
		if party_id not in self.parties:
			return False

		party = self.parties[party_id]
		member1 = party.get_member_by_slot(slot1)
		member2 = party.get_member_by_slot(slot2)

		if member1 and member2:
			member1.slot, member2.slot = member2.slot, member1.slot
			member1.status, member2.status = member2.status, member1.status
			member1.position, member2.position = member2.position, member1.position
			return True

		return False

	def load_binary(self, path: Path, format_spec: Dict) -> Party:
		"""Load party from binary."""
		data = path.read_bytes()

		party = Party()
		offset = format_spec.get("offset", 0)
		member_size = format_spec.get("member_size", 32)
		member_count = format_spec.get("member_count", 4)

		# Read members
		for i in range(member_count):
			member_offset = offset + i * member_size

			if member_offset + member_size <= len(data):
				member_data = data[member_offset:member_offset + member_size]

				member = PartyMember(
					slot=i,
					char_id=member_data[0],
					level=member_data[1],
					current_hp=struct.unpack("<H", member_data[2:4])[0],
					max_hp=struct.unpack("<H", member_data[4:6])[0],
					current_mp=struct.unpack("<H", member_data[6:8])[0],
					max_mp=struct.unpack("<H", member_data[8:10])[0],
					status=MemberStatus(member_data[10] if member_data[10] < 5 else 0),
					weapon=member_data[11],
					armor=member_data[12],
					shield=member_data[13],
					helmet=member_data[14],
					accessory=member_data[15]
				)

				party.members.append(member)

		# Read gold
		gold_offset = format_spec.get("gold_offset", 0)
		if gold_offset and gold_offset + 4 <= len(data):
			party.inventory.gold = struct.unpack("<I", data[gold_offset:gold_offset + 4])[0]

		self.parties[0] = party
		return party

	def save_binary(self, path: Path, party: Party, format_spec: Dict):
		"""Save party to binary."""
		member_size = format_spec.get("member_size", 32)

		data = bytearray()

		for member in party.members:
			member_data = bytearray(member_size)
			member_data[0] = member.char_id & 0xFF
			member_data[1] = member.level & 0xFF
			struct.pack_into("<H", member_data, 2, member.current_hp)
			struct.pack_into("<H", member_data, 4, member.max_hp)
			struct.pack_into("<H", member_data, 6, member.current_mp)
			struct.pack_into("<H", member_data, 8, member.max_mp)
			member_data[10] = member.status.value
			member_data[11] = member.weapon & 0xFF
			member_data[12] = member.armor & 0xFF
			member_data[13] = member.shield & 0xFF
			member_data[14] = member.helmet & 0xFF
			member_data[15] = member.accessory & 0xFF
			data.extend(member_data)

		path.write_bytes(data)

	def load_json(self, path: Path):
		"""Load from JSON."""
		with open(path) as f:
			data = json.load(f)

		for party_data in data.get("parties", []):
			party = Party.from_dict(party_data)
			self.parties[party.party_id] = party

	def save_json(self, path: Path):
		"""Save to JSON."""
		data = {
			"parties": [p.to_dict() for p in self.parties.values()]
		}

		with open(path, "w") as f:
			json.dump(data, f, indent="\t")

	def format_party(self, party: Party) -> str:
		"""Format party for display."""
		lines = []
		lines.append(f"Party: {party.name}")
		lines.append("=" * 60)

		# Stats
		lines.append(f"Gold: {party.inventory.gold:,}")
		lines.append(f"Play Time: {party.play_time // 3600}h {(party.play_time % 3600) // 60}m")
		lines.append(f"Steps: {party.steps:,}")
		lines.append(f"Battles: {party.battles:,}")
		lines.append(f"Average Level: {party.get_average_level():.1f}")
		lines.append("")

		# Active members
		active = party.get_active_members()
		lines.append(f"Active Members ({len(active)}/{party.max_active}):")
		lines.append("-" * 60)
		lines.append(f"{'Slot':>4} {'Name':<15} {'Lv':>3} {'HP':>10} {'MP':>10} {'Pos':<12}")
		lines.append("-" * 60)

		for member in active:
			hp_str = f"{member.current_hp}/{member.max_hp}"
			mp_str = f"{member.current_mp}/{member.max_mp}"
			lines.append(
				f"{member.slot:>4} {member.name:<15} {member.level:>3} "
				f"{hp_str:>10} {mp_str:>10} {member.position.name:<12}"
			)

		# Reserve members
		reserve = party.get_reserve_members()
		if reserve:
			lines.append("")
			lines.append(f"Reserve Members ({len(reserve)}):")
			lines.append("-" * 60)
			for member in reserve:
				hp_str = f"{member.current_hp}/{member.max_hp}"
				lines.append(
					f"{member.slot:>4} {member.name:<15} {member.level:>3} {hp_str:>10}"
				)

		return "\n".join(lines)

	def format_member(self, member: PartyMember) -> str:
		"""Format member details."""
		lines = []
		lines.append(f"Member: {member.name}")
		lines.append("=" * 40)
		lines.append(f"Slot: {member.slot}")
		lines.append(f"Character ID: {member.char_id}")
		lines.append(f"Status: {member.status.name}")
		lines.append(f"Position: {member.position.name}")
		lines.append(f"Level: {member.level}")
		lines.append(f"HP: {member.current_hp}/{member.max_hp}")
		lines.append(f"MP: {member.current_mp}/{member.max_mp}")
		lines.append("")
		lines.append("Equipment:")
		lines.append(f"  Weapon: {member.weapon}")
		lines.append(f"  Armor: {member.armor}")
		lines.append(f"  Shield: {member.shield}")
		lines.append(f"  Helmet: {member.helmet}")
		lines.append(f"  Accessory: {member.accessory}")
		lines.append("")
		lines.append(f"AI Controlled: {member.is_ai_controlled}")
		lines.append(f"Tactics: {member.tactics}")

		return "\n".join(lines)

	def analyze_party(self, party: Party) -> Dict[str, Any]:
		"""Analyze party composition."""
		active = party.get_active_members()
		reserve = party.get_reserve_members()

		levels = [m.level for m in party.members]
		hp_totals = [m.max_hp for m in party.members]

		return {
			"total_members": len(party.members),
			"active_count": len(active),
			"reserve_count": len(reserve),
			"total_level": sum(levels),
			"average_level": sum(levels) / len(levels) if levels else 0,
			"min_level": min(levels) if levels else 0,
			"max_level": max(levels) if levels else 0,
			"level_spread": max(levels) - min(levels) if levels else 0,
			"total_max_hp": sum(hp_totals),
			"average_max_hp": sum(hp_totals) / len(hp_totals) if hp_totals else 0,
			"gold": party.inventory.gold,
			"unique_items": len(party.inventory.items),
			"key_items": len(party.inventory.key_items)
		}


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Party/Team Editor")
	parser.add_argument("--analyze", "-a", type=Path,
						help="Analyze party file")
	parser.add_argument("--create", "-c", type=int,
						help="Create party with N members")
	parser.add_argument("--input", "-i", type=Path,
						help="Input JSON file")
	parser.add_argument("--output", "-o", type=Path,
						help="Output file")
	parser.add_argument("--format", "-f", type=str,
						choices=["json", "binary"],
						default="json",
						help="Output format")
	parser.add_argument("--member-size", type=int, default=32,
						help="Member data size for binary")

	args = parser.parse_args()
	editor = PartyEditor()

	if args.input:
		editor.load_json(args.input)

		for party in editor.parties.values():
			print(editor.format_party(party))
			print()

			analysis = editor.analyze_party(party)
			print("Analysis:")
			for k, v in analysis.items():
				if isinstance(v, float):
					print(f"  {k}: {v:.1f}")
				else:
					print(f"  {k}: {v}")
		return

	if args.create:
		party = editor.create_party(0, "New Party", args.create)

		# Create sample members
		names = ["Hero", "Warrior", "Mage", "Healer", "Thief", "Ranger"]
		positions = list(PartyPosition)

		for i in range(args.create):
			member = PartyMember(
				slot=i,
				char_id=i,
				name=names[i] if i < len(names) else f"Member_{i}",
				status=MemberStatus.ACTIVE if i < party.max_active else MemberStatus.RESERVE,
				position=positions[i] if i < len(positions) else PartyPosition.RESERVE,
				level=1,
				current_hp=50 + i * 10,
				max_hp=50 + i * 10,
				current_mp=20 + i * 5,
				max_mp=20 + i * 5
			)
			party.members.append(member)

		print(editor.format_party(party))

		if args.output:
			if args.format == "json":
				editor.save_json(args.output)
			else:
				editor.save_binary(args.output, party, {
					"member_size": args.member_size
				})
			print(f"\nSaved to: {args.output}")
		return

	if args.analyze:
		# Try JSON first
		try:
			editor.load_json(args.analyze)
		except (json.JSONDecodeError, UnicodeDecodeError):
			# Try binary
			editor.load_binary(args.analyze, {
				"member_size": args.member_size,
				"member_count": 4
			})

		for party in editor.parties.values():
			print(editor.format_party(party))
		return

	# Default: show help
	print("Party/Team Editor")
	print()
	print("Usage:")
	print("  --create N               Create party with N members")
	print("  --input FILE             Load from JSON")
	print("  --analyze FILE           Analyze party file")
	print("  --output FILE            Save to file")


if __name__ == "__main__":
	main()
