#!/usr/bin/env python3
"""
Collision Map Editor - Edit collision/walkability maps for games.

Supports:
- Tile-based collision maps
- Bitmask collision layers
- Slope and special collision types

Author: ROM Hacking Toolkit
"""

import argparse
import json
import os
import struct
import sys
from dataclasses import dataclass, field
from enum import IntEnum, IntFlag
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Any, Set

try:
	import tkinter as tk
	from tkinter import ttk, filedialog, messagebox
	HAS_TK = True
except ImportError:
	HAS_TK = False


class CollisionType(IntEnum):
	"""Standard collision types."""
	NONE = 0           # No collision (walkable)
	SOLID = 1          # Solid wall
	WATER = 2          # Water (swimmable)
	PIT = 3            # Pit/hole
	LADDER = 4         # Climbable ladder
	STAIRS_UP = 5      # Stairs going up
	STAIRS_DOWN = 6    # Stairs going down
	SLOPE_LEFT = 7     # Slope rising to left
	SLOPE_RIGHT = 8    # Slope rising to right
	DAMAGE = 9         # Damage floor (spikes, lava)
	ICE = 10           # Slippery ice
	CONVEYOR_UP = 11   # Conveyor belt up
	CONVEYOR_DOWN = 12 # Conveyor belt down
	CONVEYOR_LEFT = 13 # Conveyor belt left
	CONVEYOR_RIGHT = 14 # Conveyor belt right
	DOOR = 15          # Door/exit
	TRIGGER = 16       # Event trigger
	NPC_BLOCK = 17     # Blocks NPCs only
	ONE_WAY_UP = 18    # One-way platform (up)
	ONE_WAY_DOWN = 19  # One-way platform (down)
	SAVE_POINT = 20    # Save location
	CUSTOM = 255       # Custom/game-specific


@dataclass
class CollisionTile:
	"""Represents a collision tile."""
	collision_type: CollisionType
	height: int = 0           # Height level
	flags: int = 0            # Additional flags
	custom_data: int = 0      # Custom/game-specific data


@dataclass
class CollisionMap:
	"""Collision map data."""
	width: int
	height: int
	tiles: List[List[CollisionTile]] = field(default_factory=list)
	tile_width: int = 16      # Pixels per collision tile
	tile_height: int = 16
	type_names: Dict[int, str] = field(default_factory=dict)

	def __post_init__(self):
		if not self.tiles:
			self.tiles = [
				[CollisionTile(CollisionType.NONE) for _ in range(self.width)]
				for _ in range(self.height)
			]

		if not self.type_names:
			self.type_names = {t.value: t.name for t in CollisionType}

	def get_tile(self, x: int, y: int) -> Optional[CollisionTile]:
		"""Get collision at position."""
		if 0 <= x < self.width and 0 <= y < self.height:
			return self.tiles[y][x]
		return None

	def set_tile(self, x: int, y: int, tile: CollisionTile) -> None:
		"""Set collision at position."""
		if 0 <= x < self.width and 0 <= y < self.height:
			self.tiles[y][x] = tile

	def get_collision_at_pixel(self, px: int, py: int) -> Optional[CollisionTile]:
		"""Get collision at pixel position."""
		x = px // self.tile_width
		y = py // self.tile_height
		return self.get_tile(x, y)

	def fill(self, collision_type: CollisionType) -> None:
		"""Fill map with collision type."""
		for y in range(self.height):
			for x in range(self.width):
				self.tiles[y][x] = CollisionTile(collision_type)

	def fill_rect(self, x1: int, y1: int, x2: int, y2: int,
				collision_type: CollisionType) -> None:
		"""Fill rectangle with collision type."""
		for y in range(max(0, y1), min(self.height, y2 + 1)):
			for x in range(max(0, x1), min(self.width, x2 + 1)):
				self.tiles[y][x] = CollisionTile(collision_type)

	def draw_rect(self, x1: int, y1: int, x2: int, y2: int,
				collision_type: CollisionType) -> None:
		"""Draw rectangle outline with collision type."""
		# Top and bottom
		for x in range(max(0, x1), min(self.width, x2 + 1)):
			if 0 <= y1 < self.height:
				self.tiles[y1][x] = CollisionTile(collision_type)
			if 0 <= y2 < self.height:
				self.tiles[y2][x] = CollisionTile(collision_type)

		# Left and right
		for y in range(max(0, y1), min(self.height, y2 + 1)):
			if 0 <= x1 < self.width:
				self.tiles[y][x1] = CollisionTile(collision_type)
			if 0 <= x2 < self.width:
				self.tiles[y][x2] = CollisionTile(collision_type)

	def flood_fill(self, start_x: int, start_y: int,
				collision_type: CollisionType) -> int:
		"""Flood fill from position. Returns tiles filled."""
		if not (0 <= start_x < self.width and 0 <= start_y < self.height):
			return 0

		original = self.tiles[start_y][start_x].collision_type
		if original == collision_type:
			return 0

		count = 0
		stack = [(start_x, start_y)]
		visited: Set[Tuple[int, int]] = set()

		while stack:
			x, y = stack.pop()
			if (x, y) in visited:
				continue
			if not (0 <= x < self.width and 0 <= y < self.height):
				continue
			if self.tiles[y][x].collision_type != original:
				continue

			visited.add((x, y))
			self.tiles[y][x] = CollisionTile(collision_type)
			count += 1

			stack.extend([(x+1, y), (x-1, y), (x, y+1), (x, y-1)])

		return count

	@classmethod
	def from_bytes(cls, data: bytes, width: int, height: int,
				bytes_per_tile: int = 1) -> 'CollisionMap':
		"""Create from raw bytes."""
		collision_map = cls(width=width, height=height)

		idx = 0
		for y in range(height):
			for x in range(width):
				if idx < len(data):
					if bytes_per_tile == 1:
						col_type = data[idx]
						collision_map.tiles[y][x] = CollisionTile(
							CollisionType(col_type) if col_type < 256 else CollisionType.CUSTOM
						)
					elif bytes_per_tile == 2:
						col_type = data[idx]
						flags = data[idx + 1] if idx + 1 < len(data) else 0
						collision_map.tiles[y][x] = CollisionTile(
							CollisionType(col_type) if col_type < 256 else CollisionType.CUSTOM,
							flags=flags
						)
					idx += bytes_per_tile

		return collision_map

	def to_bytes(self, bytes_per_tile: int = 1) -> bytes:
		"""Convert to raw bytes."""
		output = bytearray()

		for y in range(self.height):
			for x in range(self.width):
				tile = self.tiles[y][x]
				output.append(tile.collision_type.value & 0xFF)

				if bytes_per_tile >= 2:
					output.append(tile.flags & 0xFF)
				if bytes_per_tile >= 3:
					output.append(tile.height & 0xFF)
				if bytes_per_tile >= 4:
					output.append(tile.custom_data & 0xFF)

		return bytes(output)

	@classmethod
	def from_bitmask(cls, data: bytes, width: int, height: int) -> 'CollisionMap':
		"""Create from bitmask data (1 bit per tile)."""
		collision_map = cls(width=width, height=height)

		bit_idx = 0
		for y in range(height):
			for x in range(width):
				byte_idx = bit_idx // 8
				bit_pos = bit_idx % 8

				if byte_idx < len(data):
					is_solid = (data[byte_idx] >> bit_pos) & 1
					collision_map.tiles[y][x] = CollisionTile(
						CollisionType.SOLID if is_solid else CollisionType.NONE
					)

				bit_idx += 1

		return collision_map

	def to_bitmask(self) -> bytes:
		"""Convert to bitmask (1 bit per tile)."""
		total_bits = self.width * self.height
		total_bytes = (total_bits + 7) // 8
		output = bytearray(total_bytes)

		bit_idx = 0
		for y in range(self.height):
			for x in range(self.width):
				if self.tiles[y][x].collision_type != CollisionType.NONE:
					byte_idx = bit_idx // 8
					bit_pos = bit_idx % 8
					output[byte_idx] |= (1 << bit_pos)
				bit_idx += 1

		return bytes(output)

	def to_json(self) -> Dict[str, Any]:
		"""Convert to JSON-serializable dict."""
		return {
			"width": self.width,
			"height": self.height,
			"tile_width": self.tile_width,
			"tile_height": self.tile_height,
			"type_names": self.type_names,
			"tiles": [
				[
					{
						"type": t.collision_type.value,
						"height": t.height,
						"flags": t.flags,
						"custom": t.custom_data
					}
					for t in row
				]
				for row in self.tiles
			]
		}

	@classmethod
	def from_json(cls, data: Dict[str, Any]) -> 'CollisionMap':
		"""Create from JSON data."""
		collision_map = cls(
			width=data["width"],
			height=data["height"],
			tile_width=data.get("tile_width", 16),
			tile_height=data.get("tile_height", 16),
			type_names=data.get("type_names", {})
		)

		for y, row in enumerate(data["tiles"]):
			for x, t in enumerate(row):
				col_type = t["type"]
				try:
					collision_type = CollisionType(col_type)
				except ValueError:
					collision_type = CollisionType.CUSTOM

				collision_map.tiles[y][x] = CollisionTile(
					collision_type=collision_type,
					height=t.get("height", 0),
					flags=t.get("flags", 0),
					custom_data=t.get("custom", 0)
				)

		return collision_map


class CollisionMapRenderer:
	"""Render collision maps as text."""

	# ASCII characters for collision types
	CHARS = {
		CollisionType.NONE: '.',
		CollisionType.SOLID: '#',
		CollisionType.WATER: '~',
		CollisionType.PIT: 'O',
		CollisionType.LADDER: 'H',
		CollisionType.STAIRS_UP: '/',
		CollisionType.STAIRS_DOWN: '\\',
		CollisionType.SLOPE_LEFT: '<',
		CollisionType.SLOPE_RIGHT: '>',
		CollisionType.DAMAGE: '*',
		CollisionType.ICE: '^',
		CollisionType.CONVEYOR_UP: 'U',
		CollisionType.CONVEYOR_DOWN: 'D',
		CollisionType.CONVEYOR_LEFT: 'L',
		CollisionType.CONVEYOR_RIGHT: 'R',
		CollisionType.DOOR: 'X',
		CollisionType.TRIGGER: '!',
		CollisionType.NPC_BLOCK: 'N',
		CollisionType.ONE_WAY_UP: '-',
		CollisionType.ONE_WAY_DOWN: '_',
		CollisionType.SAVE_POINT: 'S',
		CollisionType.CUSTOM: '?',
	}

	def __init__(self, collision_map: CollisionMap):
		"""Initialize renderer."""
		self.collision_map = collision_map

	def render_ascii(self) -> str:
		"""Render as ASCII art."""
		lines = []

		# Header
		header = "    " + "".join(f"{x % 10}" for x in range(self.collision_map.width))
		lines.append(header)

		for y in range(self.collision_map.height):
			row = f"{y:3d} "
			for x in range(self.collision_map.width):
				tile = self.collision_map.tiles[y][x]
				char = self.CHARS.get(tile.collision_type, '?')
				row += char
			lines.append(row)

		return "\n".join(lines)

	def render_legend(self) -> str:
		"""Render collision type legend."""
		lines = ["Legend:"]
		for col_type, char in self.CHARS.items():
			lines.append(f"  {char} = {col_type.name}")
		return "\n".join(lines)


if HAS_TK:
	class CollisionEditorGUI:
		"""GUI collision map editor."""

		# Colors for collision types
		COLORS = {
			CollisionType.NONE: "#202020",
			CollisionType.SOLID: "#FFFFFF",
			CollisionType.WATER: "#0000FF",
			CollisionType.PIT: "#000000",
			CollisionType.LADDER: "#8B4513",
			CollisionType.STAIRS_UP: "#808080",
			CollisionType.STAIRS_DOWN: "#606060",
			CollisionType.SLOPE_LEFT: "#A0A0A0",
			CollisionType.SLOPE_RIGHT: "#A0A0A0",
			CollisionType.DAMAGE: "#FF0000",
			CollisionType.ICE: "#00FFFF",
			CollisionType.CONVEYOR_UP: "#FF00FF",
			CollisionType.CONVEYOR_DOWN: "#FF00FF",
			CollisionType.CONVEYOR_LEFT: "#FF00FF",
			CollisionType.CONVEYOR_RIGHT: "#FF00FF",
			CollisionType.DOOR: "#FFFF00",
			CollisionType.TRIGGER: "#00FF00",
			CollisionType.NPC_BLOCK: "#808000",
			CollisionType.ONE_WAY_UP: "#404040",
			CollisionType.ONE_WAY_DOWN: "#404040",
			CollisionType.SAVE_POINT: "#FFD700",
			CollisionType.CUSTOM: "#FF8000",
		}

		def __init__(self, collision_map: Optional[CollisionMap] = None):
			"""Initialize GUI."""
			self.collision_map = collision_map or CollisionMap(32, 32)
			self.current_type = CollisionType.SOLID
			self.zoom = 4
			self.tile_size = 8
			self.grid_visible = True
			self.tool = "draw"  # draw, fill, rect
			self.rect_start: Optional[Tuple[int, int]] = None

			self.root = tk.Tk()
			self.root.title("Collision Map Editor")
			self._create_widgets()

		def _create_widgets(self):
			"""Create GUI widgets."""
			# Main frame
			main_frame = ttk.Frame(self.root)
			main_frame.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)

			# Toolbar
			toolbar = ttk.Frame(main_frame)
			toolbar.pack(fill=tk.X)

			ttk.Button(toolbar, text="New", command=self._new_map).pack(side=tk.LEFT)
			ttk.Button(toolbar, text="Open", command=self._open_file).pack(side=tk.LEFT)
			ttk.Button(toolbar, text="Save", command=self._save_file).pack(side=tk.LEFT)

			ttk.Separator(toolbar, orient=tk.VERTICAL).pack(side=tk.LEFT, fill=tk.Y, padx=5)

			# Tool selection
			ttk.Label(toolbar, text="Tool:").pack(side=tk.LEFT)
			self.tool_var = tk.StringVar(value="draw")
			tool_combo = ttk.Combobox(toolbar, textvariable=self.tool_var,
				values=["draw", "fill", "rect"], width=6, state="readonly")
			tool_combo.pack(side=tk.LEFT)
			tool_combo.bind("<<ComboboxSelected>>", self._update_tool)

			# Collision type selection
			ttk.Label(toolbar, text="Type:").pack(side=tk.LEFT, padx=(10, 0))
			self.type_var = tk.StringVar(value="SOLID")
			type_values = [t.name for t in CollisionType if t != CollisionType.CUSTOM]
			type_combo = ttk.Combobox(toolbar, textvariable=self.type_var,
				values=type_values, width=15, state="readonly")
			type_combo.pack(side=tk.LEFT)
			type_combo.bind("<<ComboboxSelected>>", self._update_type)

			# Grid toggle
			self.grid_var = tk.BooleanVar(value=True)
			ttk.Checkbutton(toolbar, text="Grid", variable=self.grid_var,
				command=self._toggle_grid).pack(side=tk.LEFT, padx=(10, 0))

			# Content frame
			content = ttk.Frame(main_frame)
			content.pack(fill=tk.BOTH, expand=True, pady=5)

			# Canvas with scrollbars
			canvas_frame = ttk.Frame(content)
			canvas_frame.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)

			h_scroll = ttk.Scrollbar(canvas_frame, orient=tk.HORIZONTAL)
			v_scroll = ttk.Scrollbar(canvas_frame, orient=tk.VERTICAL)

			canvas_width = self.collision_map.width * self.tile_size * self.zoom
			canvas_height = self.collision_map.height * self.tile_size * self.zoom

			self.canvas = tk.Canvas(
				canvas_frame,
				width=min(canvas_width, 600),
				height=min(canvas_height, 500),
				bg="black",
				xscrollcommand=h_scroll.set,
				yscrollcommand=v_scroll.set,
				scrollregion=(0, 0, canvas_width, canvas_height)
			)

			h_scroll.config(command=self.canvas.xview)
			v_scroll.config(command=self.canvas.yview)

			self.canvas.grid(row=0, column=0, sticky="nsew")
			v_scroll.grid(row=0, column=1, sticky="ns")
			h_scroll.grid(row=1, column=0, sticky="ew")

			canvas_frame.grid_rowconfigure(0, weight=1)
			canvas_frame.grid_columnconfigure(0, weight=1)

			# Bind events
			self.canvas.bind("<Button-1>", self._on_click)
			self.canvas.bind("<B1-Motion>", self._on_drag)
			self.canvas.bind("<ButtonRelease-1>", self._on_release)
			self.canvas.bind("<Button-3>", self._on_right_click)

			# Legend panel
			legend_frame = ttk.LabelFrame(content, text="Legend")
			legend_frame.pack(side=tk.RIGHT, fill=tk.Y, padx=(5, 0))

			for col_type in CollisionType:
				if col_type == CollisionType.CUSTOM:
					continue

				item_frame = ttk.Frame(legend_frame)
				item_frame.pack(fill=tk.X, pady=1)

				color = self.COLORS.get(col_type, "#808080")
				color_label = tk.Label(item_frame, bg=color, width=2, height=1)
				color_label.pack(side=tk.LEFT, padx=2)

				ttk.Label(item_frame, text=col_type.name, font=("TkDefaultFont", 8)).pack(side=tk.LEFT)

			# Status bar
			self.status_var = tk.StringVar(value="Ready")
			status_bar = ttk.Label(main_frame, textvariable=self.status_var, relief=tk.SUNKEN)
			status_bar.pack(fill=tk.X)

			# Initial render
			self._render()

		def _render(self):
			"""Render collision map to canvas."""
			self.canvas.delete("all")

			tile_px = self.tile_size * self.zoom

			for y in range(self.collision_map.height):
				for x in range(self.collision_map.width):
					tile = self.collision_map.tiles[y][x]

					x1 = x * tile_px
					y1 = y * tile_px
					x2 = x1 + tile_px
					y2 = y1 + tile_px

					color = self.COLORS.get(tile.collision_type, "#808080")
					self.canvas.create_rectangle(x1, y1, x2, y2, fill=color, outline="")

			# Draw grid
			if self.grid_visible:
				for x in range(self.collision_map.width + 1):
					x_pos = x * tile_px
					self.canvas.create_line(x_pos, 0, x_pos, self.collision_map.height * tile_px,
						fill="#404040")

				for y in range(self.collision_map.height + 1):
					y_pos = y * tile_px
					self.canvas.create_line(0, y_pos, self.collision_map.width * tile_px, y_pos,
						fill="#404040")

		def _get_tile_pos(self, event) -> Tuple[int, int]:
			"""Get tile position from event."""
			x = int(self.canvas.canvasx(event.x) // (self.tile_size * self.zoom))
			y = int(self.canvas.canvasy(event.y) // (self.tile_size * self.zoom))
			return x, y

		def _on_click(self, event):
			"""Handle canvas click."""
			x, y = self._get_tile_pos(event)

			if self.tool == "draw":
				self._draw_tile(x, y)
			elif self.tool == "fill":
				count = self.collision_map.flood_fill(x, y, self.current_type)
				self._render()
				self.status_var.set(f"Filled {count} tiles")
			elif self.tool == "rect":
				self.rect_start = (x, y)

		def _on_drag(self, event):
			"""Handle canvas drag."""
			x, y = self._get_tile_pos(event)

			if self.tool == "draw":
				self._draw_tile(x, y)

		def _on_release(self, event):
			"""Handle button release."""
			if self.tool == "rect" and self.rect_start:
				x, y = self._get_tile_pos(event)
				x1, y1 = self.rect_start
				x2, y2 = x, y

				# Normalize
				if x1 > x2:
					x1, x2 = x2, x1
				if y1 > y2:
					y1, y2 = y2, y1

				self.collision_map.fill_rect(x1, y1, x2, y2, self.current_type)
				self._render()
				self.status_var.set(f"Filled rect ({x1},{y1}) to ({x2},{y2})")
				self.rect_start = None

		def _on_right_click(self, event):
			"""Handle right click (pick type)."""
			x, y = self._get_tile_pos(event)

			if 0 <= x < self.collision_map.width and 0 <= y < self.collision_map.height:
				tile = self.collision_map.tiles[y][x]
				self.current_type = tile.collision_type
				self.type_var.set(tile.collision_type.name)
				self.status_var.set(f"Picked {tile.collision_type.name}")

		def _draw_tile(self, x: int, y: int):
			"""Draw tile at position."""
			if 0 <= x < self.collision_map.width and 0 <= y < self.collision_map.height:
				self.collision_map.tiles[y][x] = CollisionTile(self.current_type)
				self._render()
				self.status_var.set(f"Set ({x}, {y}) to {self.current_type.name}")

		def _update_tool(self, event=None):
			"""Update current tool."""
			self.tool = self.tool_var.get()

		def _update_type(self, event=None):
			"""Update current collision type."""
			type_name = self.type_var.get()
			self.current_type = CollisionType[type_name]

		def _toggle_grid(self):
			"""Toggle grid visibility."""
			self.grid_visible = self.grid_var.get()
			self._render()

		def _new_map(self):
			"""Create new collision map."""
			dialog = tk.Toplevel(self.root)
			dialog.title("New Collision Map")
			dialog.transient(self.root)
			dialog.grab_set()

			ttk.Label(dialog, text="Width:").grid(row=0, column=0, padx=5, pady=5)
			width_var = tk.StringVar(value="32")
			ttk.Entry(dialog, textvariable=width_var, width=10).grid(row=0, column=1)

			ttk.Label(dialog, text="Height:").grid(row=1, column=0, padx=5, pady=5)
			height_var = tk.StringVar(value="32")
			ttk.Entry(dialog, textvariable=height_var, width=10).grid(row=1, column=1)

			def create():
				try:
					w = int(width_var.get())
					h = int(height_var.get())
					self.collision_map = CollisionMap(w, h)
					self._render()
					dialog.destroy()
				except ValueError:
					messagebox.showerror("Error", "Invalid dimensions")

			ttk.Button(dialog, text="Create", command=create).grid(row=2, column=0, columnspan=2, pady=10)

		def _open_file(self):
			"""Open collision map file."""
			filetypes = [
				("JSON files", "*.json"),
				("Binary files", "*.bin *.col"),
				("All files", "*.*")
			]

			path = filedialog.askopenfilename(filetypes=filetypes)
			if not path:
				return

			try:
				if path.endswith('.json'):
					with open(path, 'r') as f:
						data = json.load(f)
					self.collision_map = CollisionMap.from_json(data)
				else:
					# Ask for dimensions
					dim_dialog = tk.Toplevel(self.root)
					dim_dialog.title("Binary Dimensions")
					dim_dialog.transient(self.root)
					dim_dialog.grab_set()

					ttk.Label(dim_dialog, text="Width:").grid(row=0, column=0, padx=5, pady=5)
					width_var = tk.StringVar(value="32")
					ttk.Entry(dim_dialog, textvariable=width_var, width=10).grid(row=0, column=1)

					ttk.Label(dim_dialog, text="Height:").grid(row=1, column=0, padx=5, pady=5)
					height_var = tk.StringVar(value="32")
					ttk.Entry(dim_dialog, textvariable=height_var, width=10).grid(row=1, column=1)

					def load():
						try:
							w = int(width_var.get())
							h = int(height_var.get())
							with open(path, 'rb') as f:
								data = f.read()
							self.collision_map = CollisionMap.from_bytes(data, w, h)
							self._render()
							dim_dialog.destroy()
						except Exception as e:
							messagebox.showerror("Error", str(e))

					ttk.Button(dim_dialog, text="Load", command=load).grid(row=2, column=0, columnspan=2, pady=10)
					return

				self._render()
				self.status_var.set(f"Loaded: {path}")

			except Exception as e:
				messagebox.showerror("Error", f"Failed to load: {e}")

		def _save_file(self):
			"""Save collision map file."""
			filetypes = [
				("JSON files", "*.json"),
				("Binary files", "*.bin"),
				("Bitmask files", "*.col"),
				("All files", "*.*")
			]

			path = filedialog.asksaveasfilename(filetypes=filetypes, defaultextension=".json")
			if not path:
				return

			try:
				if path.endswith('.json'):
					with open(path, 'w') as f:
						json.dump(self.collision_map.to_json(), f, indent='\t')
				elif path.endswith('.col'):
					with open(path, 'wb') as f:
						f.write(self.collision_map.to_bitmask())
				else:
					with open(path, 'wb') as f:
						f.write(self.collision_map.to_bytes())

				self.status_var.set(f"Saved: {path}")

			except Exception as e:
				messagebox.showerror("Error", f"Failed to save: {e}")

		def run(self):
			"""Run the application."""
			self.root.mainloop()


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description="Edit collision/walkability maps",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
  %(prog)s edit                           # Launch GUI editor
  %(prog)s view collision.bin -w 64 -h 32 # View collision map
  %(prog)s convert col.bin -o col.json    # Convert to JSON
		"""
	)

	subparsers = parser.add_subparsers(dest="command", help="Command to execute")

	# Edit command
	edit_parser = subparsers.add_parser("edit", help="Launch GUI editor")
	edit_parser.add_argument("file", nargs="?", help="File to open")

	# View command
	view_parser = subparsers.add_parser("view", help="View collision map")
	view_parser.add_argument("file", help="Collision file")
	view_parser.add_argument("-w", "--width", type=int, default=32)
	view_parser.add_argument("-h", "--height", type=int, default=32)
	view_parser.add_argument("--bitmask", action="store_true", help="Load as bitmask")

	# Convert command
	convert_parser = subparsers.add_parser("convert", help="Convert format")
	convert_parser.add_argument("input", help="Input file")
	convert_parser.add_argument("-o", "--output", required=True, help="Output file")
	convert_parser.add_argument("-w", "--width", type=int, default=32)
	convert_parser.add_argument("-h", "--height", type=int, default=32)

	args = parser.parse_args()

	if not args.command:
		if HAS_TK:
			app = CollisionEditorGUI()
			app.run()
		else:
			parser.print_help()
		return 0

	try:
		if args.command == "edit":
			if not HAS_TK:
				print("Error: GUI requires tkinter")
				return 1

			collision_map = None
			if args.file:
				path = Path(args.file)
				if path.suffix == '.json':
					collision_map = CollisionMap.from_json(json.loads(path.read_text()))
				else:
					collision_map = CollisionMap.from_bytes(path.read_bytes(), 32, 32)

			app = CollisionEditorGUI(collision_map)
			app.run()

		elif args.command == "view":
			path = Path(args.file)

			if path.suffix == '.json':
				collision_map = CollisionMap.from_json(json.loads(path.read_text()))
			elif args.bitmask:
				collision_map = CollisionMap.from_bitmask(path.read_bytes(), args.width, args.height)
			else:
				collision_map = CollisionMap.from_bytes(path.read_bytes(), args.width, args.height)

			renderer = CollisionMapRenderer(collision_map)
			print(f"Collision Map: {collision_map.width}x{collision_map.height}")
			print()
			print(renderer.render_ascii())
			print()
			print(renderer.render_legend())

		elif args.command == "convert":
			input_path = Path(args.input)
			output_path = Path(args.output)

			# Load
			if input_path.suffix == '.json':
				collision_map = CollisionMap.from_json(json.loads(input_path.read_text()))
			else:
				collision_map = CollisionMap.from_bytes(input_path.read_bytes(), args.width, args.height)

			# Save
			if output_path.suffix == '.json':
				output_path.write_text(json.dumps(collision_map.to_json(), indent='\t'))
			elif output_path.suffix == '.col':
				output_path.write_bytes(collision_map.to_bitmask())
			else:
				output_path.write_bytes(collision_map.to_bytes())

			print(f"Converted: {input_path} -> {output_path}")

	except FileNotFoundError as e:
		print(f"Error: File not found: {e.filename}")
		return 1
	except Exception as e:
		print(f"Error: {e}")
		return 1

	return 0


if __name__ == "__main__":
	sys.exit(main())
