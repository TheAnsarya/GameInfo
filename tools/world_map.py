#!/usr/bin/env python3
"""
World Map Editor - Edit overworld/world map data for RPG games.

Tools for visualizing and editing world map tiles, encounter zones,
location markers, and travel restrictions.

Usage:
	python world_map.py <worldmap.json>
	python world_map.py --visualize
	python world_map.py --encounters

Features:
	- World map tile editing
	- Encounter zone management
	- Location placement
	- Travel paths
	- Terrain analysis
"""

import argparse
import json
import os
import sys
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Set, Tuple


class TerrainType(Enum):
	"""Terrain types for world map."""
	GRASS = auto()
	FOREST = auto()
	MOUNTAIN = auto()
	WATER = auto()
	DESERT = auto()
	SNOW = auto()
	SWAMP = auto()
	BRIDGE = auto()
	ROAD = auto()
	TOWN = auto()
	CASTLE = auto()
	CAVE = auto()
	TOWER = auto()
	SHRINE = auto()
	BLOCKED = auto()


class TravelMode(Enum):
	"""Travel modes."""
	WALK = auto()
	SHIP = auto()
	AIRSHIP = auto()
	RAFT = auto()
	MAGIC = auto()


@dataclass
class EncounterZone:
	"""A zone with specific encounter rates."""
	zone_id: int
	name: str
	encounter_rate: int  # 0-255
	monster_group_ids: List[int] = field(default_factory=list)
	terrain_types: List[TerrainType] = field(default_factory=list)
	bounds: Tuple[int, int, int, int] = (0, 0, 0, 0)  # x1, y1, x2, y2
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"id": self.zone_id,
			"name": self.name,
			"encounter_rate": self.encounter_rate,
			"monster_groups": self.monster_group_ids,
			"terrain": [t.name for t in self.terrain_types],
			"bounds": list(self.bounds)
		}
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "EncounterZone":
		"""Create from dictionary."""
		return cls(
			zone_id=data["id"],
			name=data["name"],
			encounter_rate=data["encounter_rate"],
			monster_group_ids=data.get("monster_groups", []),
			terrain_types=[TerrainType[t] for t in data.get("terrain", [])],
			bounds=tuple(data.get("bounds", [0, 0, 0, 0]))
		)


@dataclass
class MapLocation:
	"""A location on the world map."""
	location_id: int
	name: str
	x: int
	y: int
	terrain: TerrainType = TerrainType.TOWN
	destination_map_id: int = 0
	visible: bool = True
	requires_item: str = ""
	notes: str = ""
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"id": self.location_id,
			"name": self.name,
			"x": self.x,
			"y": self.y,
			"terrain": self.terrain.name
		}
		
		if self.destination_map_id:
			result["destination"] = self.destination_map_id
		if not self.visible:
			result["visible"] = False
		if self.requires_item:
			result["requires"] = self.requires_item
		if self.notes:
			result["notes"] = self.notes
		
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "MapLocation":
		"""Create from dictionary."""
		return cls(
			location_id=data["id"],
			name=data["name"],
			x=data["x"],
			y=data["y"],
			terrain=TerrainType[data.get("terrain", "TOWN")],
			destination_map_id=data.get("destination", 0),
			visible=data.get("visible", True),
			requires_item=data.get("requires", ""),
			notes=data.get("notes", "")
		)


@dataclass
class WorldMap:
	"""World map data."""
	width: int
	height: int
	tiles: List[List[int]] = field(default_factory=list)
	terrain_mapping: Dict[int, TerrainType] = field(default_factory=dict)
	locations: List[MapLocation] = field(default_factory=list)
	encounter_zones: List[EncounterZone] = field(default_factory=list)
	travel_restrictions: Dict[TravelMode, Set[TerrainType]] = field(default_factory=dict)
	
	def get_terrain_at(self, x: int, y: int) -> Optional[TerrainType]:
		"""Get terrain type at coordinates."""
		if 0 <= x < self.width and 0 <= y < self.height:
			tile = self.tiles[y][x]
			return self.terrain_mapping.get(tile, TerrainType.GRASS)
		return None
	
	def can_travel(self, x: int, y: int, mode: TravelMode) -> bool:
		"""Check if travel is possible at coordinates."""
		terrain = self.get_terrain_at(x, y)
		if terrain is None:
			return False
		
		if mode not in self.travel_restrictions:
			return terrain != TerrainType.BLOCKED
		
		allowed = self.travel_restrictions[mode]
		return terrain in allowed
	
	def find_path(self, start: Tuple[int, int], end: Tuple[int, int],
				  mode: TravelMode = TravelMode.WALK) -> Optional[List[Tuple[int, int]]]:
		"""Find path between two points using A*."""
		from heapq import heappush, heappop
		
		def heuristic(a: Tuple[int, int], b: Tuple[int, int]) -> int:
			return abs(a[0] - b[0]) + abs(a[1] - b[1])
		
		open_set = [(0, start)]
		came_from: Dict[Tuple[int, int], Tuple[int, int]] = {}
		g_score = {start: 0}
		
		while open_set:
			_, current = heappop(open_set)
			
			if current == end:
				path = [current]
				while current in came_from:
					current = came_from[current]
					path.append(current)
				return list(reversed(path))
			
			for dx, dy in [(0, 1), (0, -1), (1, 0), (-1, 0)]:
				neighbor = (current[0] + dx, current[1] + dy)
				
				if not self.can_travel(neighbor[0], neighbor[1], mode):
					continue
				
				tentative_g = g_score[current] + 1
				
				if neighbor not in g_score or tentative_g < g_score[neighbor]:
					came_from[neighbor] = current
					g_score[neighbor] = tentative_g
					f_score = tentative_g + heuristic(neighbor, end)
					heappush(open_set, (f_score, neighbor))
		
		return None
	
	def get_encounter_zone(self, x: int, y: int) -> Optional[EncounterZone]:
		"""Get encounter zone at coordinates."""
		terrain = self.get_terrain_at(x, y)
		
		for zone in self.encounter_zones:
			# Check bounds
			if zone.bounds != (0, 0, 0, 0):
				x1, y1, x2, y2 = zone.bounds
				if not (x1 <= x <= x2 and y1 <= y <= y2):
					continue
			
			# Check terrain
			if zone.terrain_types and terrain not in zone.terrain_types:
				continue
			
			return zone
		
		return None
	
	def get_nearby_locations(self, x: int, y: int, radius: int = 5) -> List[MapLocation]:
		"""Find locations near coordinates."""
		nearby = []
		for loc in self.locations:
			dist = abs(loc.x - x) + abs(loc.y - y)
			if dist <= radius:
				nearby.append(loc)
		return sorted(nearby, key=lambda l: abs(l.x - x) + abs(l.y - y))
	
	def analyze_terrain(self) -> Dict[str, Any]:
		"""Analyze terrain distribution."""
		counts: Dict[TerrainType, int] = {}
		
		for row in self.tiles:
			for tile in row:
				terrain = self.terrain_mapping.get(tile, TerrainType.GRASS)
				counts[terrain] = counts.get(terrain, 0) + 1
		
		total = self.width * self.height
		
		return {
			"dimensions": f"{self.width}x{self.height}",
			"total_tiles": total,
			"terrain_counts": {t.name: c for t, c in counts.items()},
			"terrain_percentages": {
				t.name: f"{c / total:.1%}"
				for t, c in counts.items()
			}
		}
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"width": self.width,
			"height": self.height,
			"tiles": self.tiles,
			"terrain_mapping": {str(k): v.name for k, v in self.terrain_mapping.items()},
			"locations": [loc.to_dict() for loc in self.locations],
			"encounter_zones": [zone.to_dict() for zone in self.encounter_zones],
			"travel_restrictions": {
				mode.name: [t.name for t in terrains]
				for mode, terrains in self.travel_restrictions.items()
			}
		}
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "WorldMap":
		"""Create from dictionary."""
		terrain_mapping = {
			int(k): TerrainType[v]
			for k, v in data.get("terrain_mapping", {}).items()
		}
		
		locations = [MapLocation.from_dict(l) for l in data.get("locations", [])]
		zones = [EncounterZone.from_dict(z) for z in data.get("encounter_zones", [])]
		
		travel_restrictions = {}
		for mode_name, terrains in data.get("travel_restrictions", {}).items():
			mode = TravelMode[mode_name]
			travel_restrictions[mode] = {TerrainType[t] for t in terrains}
		
		return cls(
			width=data["width"],
			height=data["height"],
			tiles=data.get("tiles", []),
			terrain_mapping=terrain_mapping,
			locations=locations,
			encounter_zones=zones,
			travel_restrictions=travel_restrictions
		)


class WorldMapEditor:
	"""Edit world map data."""
	
	def __init__(self):
		self.world_map: Optional[WorldMap] = None
		self.metadata: Dict[str, Any] = {}
	
	def create_empty(self, width: int, height: int) -> None:
		"""Create empty world map."""
		self.world_map = WorldMap(
			width=width,
			height=height,
			tiles=[[0] * width for _ in range(height)],
			terrain_mapping={0: TerrainType.GRASS}
		)
	
	def load(self, filepath: str) -> None:
		"""Load from JSON file."""
		with open(filepath, "r", encoding="utf-8") as f:
			data = json.load(f)
		
		self.metadata = data.get("metadata", {})
		self.world_map = WorldMap.from_dict(data.get("world_map", data))
	
	def save(self, filepath: str) -> None:
		"""Save to JSON file."""
		if not self.world_map:
			return
		
		data = {
			"metadata": self.metadata,
			"world_map": self.world_map.to_dict()
		}
		
		with open(filepath, "w", encoding="utf-8") as f:
			json.dump(data, f, indent="\t")
	
	def export_ascii(self, filepath: str) -> None:
		"""Export as ASCII representation."""
		if not self.world_map:
			return
		
		# Terrain to character mapping
		char_map = {
			TerrainType.GRASS: ".",
			TerrainType.FOREST: "T",
			TerrainType.MOUNTAIN: "M",
			TerrainType.WATER: "~",
			TerrainType.DESERT: ":",
			TerrainType.SNOW: "*",
			TerrainType.SWAMP: "%",
			TerrainType.BRIDGE: "=",
			TerrainType.ROAD: "#",
			TerrainType.TOWN: "O",
			TerrainType.CASTLE: "C",
			TerrainType.CAVE: "V",
			TerrainType.TOWER: "I",
			TerrainType.SHRINE: "+",
			TerrainType.BLOCKED: "X"
		}
		
		with open(filepath, "w", encoding="utf-8") as f:
			f.write(f"World Map ({self.world_map.width}x{self.world_map.height})\n")
			f.write("=" * 60 + "\n")
			
			# Legend
			f.write("Legend: ")
			for terrain, char in char_map.items():
				f.write(f"{char}={terrain.name} ")
			f.write("\n\n")
			
			# Map
			for y, row in enumerate(self.world_map.tiles):
				line = ""
				for x, tile in enumerate(row):
					terrain = self.world_map.terrain_mapping.get(tile, TerrainType.GRASS)
					
					# Check for location
					loc = next((l for l in self.world_map.locations
							   if l.x == x and l.y == y), None)
					if loc:
						line += "O"  # Location marker
					else:
						line += char_map.get(terrain, "?")
				f.write(line + "\n")
	
	def visualize(self) -> str:
		"""Create text visualization."""
		if not self.world_map:
			return "No map loaded"
		
		# Terrain to character
		char_map = {
			TerrainType.GRASS: ".",
			TerrainType.FOREST: "♣",
			TerrainType.MOUNTAIN: "▲",
			TerrainType.WATER: "≈",
			TerrainType.DESERT: "░",
			TerrainType.SNOW: "❄",
			TerrainType.SWAMP: "▓",
			TerrainType.TOWN: "●",
			TerrainType.CASTLE: "♜",
			TerrainType.CAVE: "○",
		}
		
		lines = []
		
		# Show smaller area or whole map if small
		max_display = 40
		
		for y in range(min(self.world_map.height, max_display)):
			line = ""
			for x in range(min(self.world_map.width, max_display)):
				tile = self.world_map.tiles[y][x]
				terrain = self.world_map.terrain_mapping.get(tile, TerrainType.GRASS)
				line += char_map.get(terrain, "?")
			lines.append(line)
		
		return "\n".join(lines)


def create_example_map() -> WorldMapEditor:
	"""Create example world map."""
	editor = WorldMapEditor()
	editor.metadata = {"game": "Example RPG", "version": "1.0"}
	editor.create_empty(32, 32)
	
	wm = editor.world_map
	
	# Set up terrain mapping
	wm.terrain_mapping = {
		0: TerrainType.GRASS,
		1: TerrainType.WATER,
		2: TerrainType.FOREST,
		3: TerrainType.MOUNTAIN,
		4: TerrainType.DESERT,
		5: TerrainType.TOWN,
		6: TerrainType.CASTLE,
		7: TerrainType.ROAD
	}
	
	# Create simple map
	for y in range(32):
		for x in range(32):
			# Water on edges
			if x < 2 or x > 29 or y < 2 or y > 29:
				wm.tiles[y][x] = 1
			# Mountains in top-right
			elif x > 20 and y < 10:
				wm.tiles[y][x] = 3
			# Forest in left area
			elif x < 10 and 5 < y < 25:
				wm.tiles[y][x] = 2
			# Desert in bottom-right
			elif x > 20 and y > 22:
				wm.tiles[y][x] = 4
			# Road from town to castle
			elif y == 16 and 5 <= x <= 25:
				wm.tiles[y][x] = 7
	
	# Add locations
	wm.locations = [
		MapLocation(1, "Starting Town", 5, 16, TerrainType.TOWN, destination_map_id=100),
		MapLocation(2, "Castle", 25, 16, TerrainType.CASTLE, destination_map_id=200),
		MapLocation(3, "Forest Village", 7, 10, TerrainType.TOWN, destination_map_id=101),
		MapLocation(4, "Mountain Cave", 24, 6, TerrainType.CAVE, destination_map_id=300)
	]
	
	# Set up travel restrictions
	wm.travel_restrictions = {
		TravelMode.WALK: {
			TerrainType.GRASS, TerrainType.FOREST, TerrainType.DESERT,
			TerrainType.ROAD, TerrainType.BRIDGE, TerrainType.TOWN,
			TerrainType.CASTLE, TerrainType.CAVE, TerrainType.TOWER,
			TerrainType.SHRINE
		},
		TravelMode.SHIP: {
			TerrainType.WATER
		},
		TravelMode.AIRSHIP: {t for t in TerrainType}  # Can go anywhere
	}
	
	# Add encounter zones
	wm.encounter_zones = [
		EncounterZone(1, "Plains", 32, [1, 2, 3],
					  [TerrainType.GRASS]),
		EncounterZone(2, "Forest", 48, [4, 5, 6],
					  [TerrainType.FOREST]),
		EncounterZone(3, "Mountains", 64, [7, 8, 9],
					  [TerrainType.MOUNTAIN]),
		EncounterZone(4, "Desert", 48, [10, 11],
					  [TerrainType.DESERT])
	]
	
	return editor


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="World Map Editor")
	parser.add_argument("mapfile", nargs="?", help="World map JSON file")
	parser.add_argument("--visualize", "-v", action="store_true",
						help="Show map visualization")
	parser.add_argument("--locations", "-l", action="store_true",
						help="List all locations")
	parser.add_argument("--encounters", "-e", action="store_true",
						help="Show encounter zones")
	parser.add_argument("--analyze", "-a", action="store_true",
						help="Analyze terrain")
	parser.add_argument("--path", nargs=4, type=int,
						metavar=("X1", "Y1", "X2", "Y2"),
						help="Find path between points")
	parser.add_argument("--export", help="Export to file")
	parser.add_argument("--create-example", action="store_true",
						help="Create example map")
	
	args = parser.parse_args()
	
	editor = WorldMapEditor()
	
	if args.create_example:
		editor = create_example_map()
		output = args.mapfile or "worldmap.json"
		editor.save(output)
		print(f"Created example map: {output}")
		return
	
	if args.mapfile:
		if os.path.exists(args.mapfile):
			editor.load(args.mapfile)
			print(f"Loaded: {args.mapfile}")
		else:
			print(f"File not found: {args.mapfile}")
			print("Use --create-example to create a new map")
			return
	else:
		# Demo mode
		editor = create_example_map()
		print("World Map Editor")
		print()
		print("Usage: python world_map.py <worldmap.json>")
		print()
		print("Demo mode - using example map:")
	
	if not editor.world_map:
		return
	
	wm = editor.world_map
	print(f"Map size: {wm.width}x{wm.height}")
	print(f"Locations: {len(wm.locations)}")
	print(f"Encounter zones: {len(wm.encounter_zones)}")
	print()
	
	# Visualize
	if args.visualize:
		print("Map visualization:")
		print(editor.visualize())
		print()
	
	# List locations
	if args.locations:
		print("Locations:")
		for loc in wm.locations:
			print(f"  [{loc.location_id}] {loc.name} at ({loc.x}, {loc.y})")
		print()
	
	# Show encounters
	if args.encounters:
		print("Encounter Zones:")
		for zone in wm.encounter_zones:
			terrains = ", ".join(t.name for t in zone.terrain_types)
			print(f"  {zone.name}: rate {zone.encounter_rate}, "
				  f"groups {zone.monster_group_ids}, terrain: {terrains}")
		print()
	
	# Analyze
	if args.analyze:
		analysis = wm.analyze_terrain()
		print("Terrain Analysis:")
		print(f"  Dimensions: {analysis['dimensions']}")
		print(f"  Total tiles: {analysis['total_tiles']}")
		print("  Distribution:")
		for terrain, pct in analysis["terrain_percentages"].items():
			print(f"    {terrain}: {pct}")
		print()
	
	# Find path
	if args.path:
		start = (args.path[0], args.path[1])
		end = (args.path[2], args.path[3])
		path = wm.find_path(start, end)
		
		if path:
			print(f"Path from {start} to {end} ({len(path)} steps):")
			print(f"  {' -> '.join(str(p) for p in path[:10])}")
			if len(path) > 10:
				print(f"  ... ({len(path) - 10} more steps)")
		else:
			print(f"No path found from {start} to {end}")
		print()
	
	# Export
	if args.export:
		if args.export.endswith(".txt"):
			editor.export_ascii(args.export)
		else:
			editor.save(args.export)
		print(f"Exported to: {args.export}")


if __name__ == "__main__":
	main()
