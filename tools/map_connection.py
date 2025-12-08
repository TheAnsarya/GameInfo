#!/usr/bin/env python3
"""
Map Connection Editor - Edit map/area connections in RPG games.

Provides tools for visualizing and editing how game maps connect,
including warps, exits, and world map connections.

Usage:
	python map_connection.py <json_file>
	python map_connection.py --scan <rom_file>

Features:
	- Visualize map connections as graph
	- Edit warp points and destinations
	- Validate connection integrity
	- Find unreachable areas
	- Export connection diagrams
"""

import argparse
import json
import os
import sys
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Set, Tuple


class ConnectionType(Enum):
	"""Types of map connections."""
	WALK = auto()       # Normal walking transition
	WARP = auto()       # Warp/teleport point
	DOOR = auto()       # Door/entrance
	STAIRS = auto()     # Stairs up/down
	LADDER = auto()     # Ladder
	WORLD = auto()      # World map exit
	EVENT = auto()      # Event-triggered
	FALL = auto()       # Fall/pit
	ONE_WAY = auto()    # One-way connection


@dataclass
class MapConnection:
	"""A connection between two map areas."""
	source_map: int
	source_x: int
	source_y: int
	dest_map: int
	dest_x: int
	dest_y: int
	conn_type: ConnectionType = ConnectionType.WALK
	bidirectional: bool = True
	conditions: List[str] = field(default_factory=list)
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"source": {
				"map": self.source_map,
				"x": self.source_x,
				"y": self.source_y
			},
			"destination": {
				"map": self.dest_map,
				"x": self.dest_x,
				"y": self.dest_y
			},
			"type": self.conn_type.name,
			"bidirectional": self.bidirectional,
			"conditions": self.conditions
		}
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "MapConnection":
		"""Create from dictionary."""
		return cls(
			source_map=data["source"]["map"],
			source_x=data["source"]["x"],
			source_y=data["source"]["y"],
			dest_map=data["destination"]["map"],
			dest_x=data["destination"]["x"],
			dest_y=data["destination"]["y"],
			conn_type=ConnectionType[data.get("type", "WALK")],
			bidirectional=data.get("bidirectional", True),
			conditions=data.get("conditions", [])
		)


@dataclass
class MapArea:
	"""A map area with connections."""
	map_id: int
	name: str = ""
	width: int = 0
	height: int = 0
	connections: List[MapConnection] = field(default_factory=list)
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"id": self.map_id,
			"name": self.name,
			"width": self.width,
			"height": self.height,
			"connections": [c.to_dict() for c in self.connections]
		}


class MapConnectionManager:
	"""Manage map connections."""
	
	def __init__(self):
		self.maps: Dict[int, MapArea] = {}
		self.connections: List[MapConnection] = []
	
	def add_map(self, map_id: int, name: str = "",
				width: int = 0, height: int = 0) -> MapArea:
		"""Add a new map."""
		if map_id not in self.maps:
			self.maps[map_id] = MapArea(map_id, name, width, height)
		return self.maps[map_id]
	
	def add_connection(self, conn: MapConnection) -> None:
		"""Add a connection."""
		self.connections.append(conn)
		
		# Ensure source map exists
		if conn.source_map not in self.maps:
			self.add_map(conn.source_map)
		self.maps[conn.source_map].connections.append(conn)
		
		# For bidirectional, add reverse
		if conn.bidirectional:
			reverse = MapConnection(
				source_map=conn.dest_map,
				source_x=conn.dest_x,
				source_y=conn.dest_y,
				dest_map=conn.source_map,
				dest_x=conn.source_x,
				dest_y=conn.source_y,
				conn_type=conn.conn_type,
				bidirectional=False,  # Avoid infinite loop
				conditions=conn.conditions
			)
			if conn.dest_map not in self.maps:
				self.add_map(conn.dest_map)
			self.maps[conn.dest_map].connections.append(reverse)
	
	def get_connected_maps(self, map_id: int) -> Set[int]:
		"""Get all maps directly connected to a map."""
		connected = set()
		if map_id in self.maps:
			for conn in self.maps[map_id].connections:
				connected.add(conn.dest_map)
		return connected
	
	def find_path(self, start_map: int, end_map: int) -> Optional[List[int]]:
		"""Find path between two maps using BFS."""
		if start_map == end_map:
			return [start_map]
		
		visited = {start_map}
		queue = [[start_map]]
		
		while queue:
			path = queue.pop(0)
			current = path[-1]
			
			for next_map in self.get_connected_maps(current):
				if next_map == end_map:
					return path + [next_map]
				
				if next_map not in visited:
					visited.add(next_map)
					queue.append(path + [next_map])
		
		return None  # No path found
	
	def find_unreachable(self, start_map: int = 0) -> Set[int]:
		"""Find maps unreachable from starting point."""
		reachable = set()
		queue = [start_map]
		
		while queue:
			current = queue.pop(0)
			if current in reachable:
				continue
			reachable.add(current)
			queue.extend(self.get_connected_maps(current))
		
		all_maps = set(self.maps.keys())
		return all_maps - reachable
	
	def find_dead_ends(self) -> List[int]:
		"""Find maps with only one connection (dead ends)."""
		dead_ends = []
		for map_id, map_area in self.maps.items():
			outgoing = len(set(c.dest_map for c in map_area.connections))
			if outgoing <= 1:
				dead_ends.append(map_id)
		return dead_ends
	
	def validate_connections(self) -> List[str]:
		"""Validate connection integrity."""
		issues = []
		
		for conn in self.connections:
			# Check destination exists
			if conn.dest_map not in self.maps:
				issues.append(
					f"Connection to nonexistent map {conn.dest_map} "
					f"from map {conn.source_map}"
				)
			
			# Check for duplicate connections
			source_conns = self.maps.get(conn.source_map, MapArea(0)).connections
			duplicates = [c for c in source_conns
						  if c.dest_map == conn.dest_map
						  and c.source_x == conn.source_x
						  and c.source_y == conn.source_y
						  and c is not conn]
			if duplicates:
				issues.append(
					f"Duplicate connection from map {conn.source_map} "
					f"({conn.source_x}, {conn.source_y}) to map {conn.dest_map}"
				)
		
		return issues
	
	def export_graphviz(self, filepath: str) -> None:
		"""Export as Graphviz DOT file."""
		with open(filepath, "w", encoding="utf-8") as f:
			f.write("digraph MapConnections {\n")
			f.write("\trankdir=LR;\n")
			f.write("\tnode [shape=box];\n")
			f.write("\n")
			
			# Nodes
			for map_id, map_area in self.maps.items():
				label = map_area.name or f"Map {map_id}"
				f.write(f'\tmap_{map_id} [label="{label}"];\n')
			
			f.write("\n")
			
			# Edges
			drawn = set()
			for conn in self.connections:
				key = (min(conn.source_map, conn.dest_map),
					   max(conn.source_map, conn.dest_map))
				if key in drawn:
					continue
				
				style = ""
				if conn.conn_type == ConnectionType.WARP:
					style = ' [style=dashed, color=blue]'
				elif conn.conn_type == ConnectionType.ONE_WAY:
					style = ' [color=red]'
				elif conn.conn_type == ConnectionType.EVENT:
					style = ' [style=dotted, color=green]'
				
				if conn.bidirectional:
					f.write(f"\tmap_{conn.source_map} -> map_{conn.dest_map} "
						   f"[dir=both{style}];\n")
				else:
					f.write(f"\tmap_{conn.source_map} -> map_{conn.dest_map}{style};\n")
				
				drawn.add(key)
			
			f.write("}\n")
	
	def export_mermaid(self, filepath: str) -> None:
		"""Export as Mermaid diagram."""
		with open(filepath, "w", encoding="utf-8") as f:
			f.write("```mermaid\n")
			f.write("graph LR\n")
			
			drawn = set()
			for conn in self.connections:
				key = (min(conn.source_map, conn.dest_map),
					   max(conn.source_map, conn.dest_map))
				if key in drawn:
					continue
				
				src_name = self.maps.get(conn.source_map, MapArea(0)).name or f"Map{conn.source_map}"
				dst_name = self.maps.get(conn.dest_map, MapArea(0)).name or f"Map{conn.dest_map}"
				
				src_name = src_name.replace(" ", "_")
				dst_name = dst_name.replace(" ", "_")
				
				if conn.bidirectional:
					f.write(f"\t{src_name} <--> {dst_name}\n")
				else:
					f.write(f"\t{src_name} --> {dst_name}\n")
				
				drawn.add(key)
			
			f.write("```\n")
	
	def load_json(self, filepath: str) -> None:
		"""Load connections from JSON file."""
		with open(filepath, "r", encoding="utf-8") as f:
			data = json.load(f)
		
		# Load maps
		for map_data in data.get("maps", []):
			self.add_map(
				map_data["id"],
				map_data.get("name", ""),
				map_data.get("width", 0),
				map_data.get("height", 0)
			)
		
		# Load connections
		for conn_data in data.get("connections", []):
			conn = MapConnection.from_dict(conn_data)
			self.add_connection(conn)
	
	def save_json(self, filepath: str) -> None:
		"""Save connections to JSON file."""
		data = {
			"maps": [m.to_dict() for m in self.maps.values()],
			"connections": [c.to_dict() for c in self.connections]
		}
		
		with open(filepath, "w", encoding="utf-8") as f:
			json.dump(data, f, indent="\t", ensure_ascii=False)
	
	def generate_report(self) -> str:
		"""Generate connection analysis report."""
		lines = []
		lines.append("=" * 60)
		lines.append("Map Connection Report")
		lines.append("=" * 60)
		lines.append("")
		
		lines.append(f"Total maps: {len(self.maps)}")
		lines.append(f"Total connections: {len(self.connections)}")
		lines.append("")
		
		# Connection types
		type_counts: Dict[ConnectionType, int] = {}
		for conn in self.connections:
			type_counts[conn.conn_type] = type_counts.get(conn.conn_type, 0) + 1
		
		lines.append("Connection types:")
		for conn_type, count in sorted(type_counts.items(), key=lambda x: -x[1]):
			lines.append(f"  {conn_type.name}: {count}")
		lines.append("")
		
		# Hub maps (most connections)
		map_conn_counts = [(m, len(m.connections)) for m in self.maps.values()]
		map_conn_counts.sort(key=lambda x: -x[1])
		
		lines.append("Hub maps (most connections):")
		for map_area, count in map_conn_counts[:10]:
			name = map_area.name or f"Map {map_area.map_id}"
			lines.append(f"  {name}: {count} connections")
		lines.append("")
		
		# Dead ends
		dead_ends = self.find_dead_ends()
		if dead_ends:
			lines.append(f"Dead ends ({len(dead_ends)} maps):")
			for map_id in dead_ends[:10]:
				name = self.maps[map_id].name or f"Map {map_id}"
				lines.append(f"  {name}")
			if len(dead_ends) > 10:
				lines.append(f"  ... and {len(dead_ends) - 10} more")
		lines.append("")
		
		# Validation
		issues = self.validate_connections()
		if issues:
			lines.append(f"Issues found ({len(issues)}):")
			for issue in issues[:10]:
				lines.append(f"  - {issue}")
		else:
			lines.append("No issues found")
		
		return "\n".join(lines)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Map Connection Editor")
	parser.add_argument("input", nargs="?", help="JSON file or ROM to analyze")
	parser.add_argument("--output", "-o", help="Output file")
	parser.add_argument("--format", "-f",
						choices=["json", "dot", "mermaid", "report"],
						default="report", help="Output format")
	parser.add_argument("--path", nargs=2, type=int,
						metavar=("FROM", "TO"),
						help="Find path between maps")
	parser.add_argument("--unreachable", type=int, default=None,
						metavar="START",
						help="Find unreachable maps from starting map")
	parser.add_argument("--validate", "-v", action="store_true",
						help="Validate connections")
	
	args = parser.parse_args()
	
	manager = MapConnectionManager()
	
	if args.input:
		if args.input.endswith(".json"):
			manager.load_json(args.input)
			print(f"Loaded: {args.input}")
			print(f"Maps: {len(manager.maps)}")
			print(f"Connections: {len(manager.connections)}")
		else:
			print("Note: ROM scanning not yet implemented")
			print("Create a JSON file with map connection data")
			print()
			# Create example
			manager.add_map(0, "Town")
			manager.add_map(1, "Inn")
			manager.add_map(2, "Shop")
			manager.add_map(3, "World Map")
			manager.add_map(4, "Dungeon")
			
			manager.add_connection(MapConnection(0, 10, 5, 1, 8, 12, ConnectionType.DOOR))
			manager.add_connection(MapConnection(0, 5, 10, 2, 8, 12, ConnectionType.DOOR))
			manager.add_connection(MapConnection(0, 0, 8, 3, 100, 50, ConnectionType.WORLD))
			manager.add_connection(MapConnection(3, 150, 80, 4, 16, 30, ConnectionType.WALK))
			
			print("Created example connection data")
	else:
		# Demo mode
		print("Map Connection Editor")
		print()
		print("Usage: python map_connection.py <connections.json>")
		print()
		print("JSON format example:")
		print("""{
	"maps": [
		{"id": 0, "name": "Town"},
		{"id": 1, "name": "Inn"}
	],
	"connections": [
		{
			"source": {"map": 0, "x": 10, "y": 5},
			"destination": {"map": 1, "x": 8, "y": 12},
			"type": "DOOR",
			"bidirectional": true
		}
	]
}""")
		return
	
	# Path finding
	if args.path:
		path = manager.find_path(args.path[0], args.path[1])
		if path:
			names = []
			for map_id in path:
				name = manager.maps.get(map_id, MapArea(map_id)).name or f"Map {map_id}"
				names.append(name)
			print(f"\nPath: {' -> '.join(names)}")
		else:
			print(f"\nNo path found from {args.path[0]} to {args.path[1]}")
	
	# Unreachable
	if args.unreachable is not None:
		unreachable = manager.find_unreachable(args.unreachable)
		if unreachable:
			print(f"\nUnreachable from map {args.unreachable}:")
			for map_id in sorted(unreachable):
				name = manager.maps.get(map_id, MapArea(map_id)).name or f"Map {map_id}"
				print(f"  {name}")
		else:
			print(f"\nAll maps reachable from map {args.unreachable}")
	
	# Validate
	if args.validate:
		issues = manager.validate_connections()
		if issues:
			print(f"\nValidation issues ({len(issues)}):")
			for issue in issues:
				print(f"  - {issue}")
		else:
			print("\nNo validation issues found")
	
	# Output
	if args.output:
		if args.format == "json":
			manager.save_json(args.output)
		elif args.format == "dot":
			manager.export_graphviz(args.output)
		elif args.format == "mermaid":
			manager.export_mermaid(args.output)
		else:
			with open(args.output, "w", encoding="utf-8") as f:
				f.write(manager.generate_report())
		print(f"\nExported to: {args.output}")
	else:
		print()
		print(manager.generate_report())


if __name__ == "__main__":
	main()
