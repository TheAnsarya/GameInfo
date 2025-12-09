#!/usr/bin/env python3
"""
Tile Collision Editor - Edit collision data for tile maps.

Tools for managing tile collision properties in game maps.

Usage:
	python tile_collision.py --analyze rom.nes --tileset 0
	python tile_collision.py --edit collision.json
	python tile_collision.py --visualize map.tmx

Features:
	- Collision type assignment
	- Per-tile properties
	- Visual editor
	- Map overlay generation
"""

import argparse
import json
from dataclasses import dataclass, field
from enum import Flag, auto, IntEnum
from pathlib import Path
from typing import Dict, List, Optional, Set, Tuple

try:
	import tkinter as tk
	from tkinter import ttk, filedialog, messagebox
	HAS_TK = True
except ImportError:
	HAS_TK = False


class CollisionType(IntEnum):
	"""Basic collision types."""
	NONE = 0           # No collision
	SOLID = 1          # Full solid block
	PLATFORM = 2       # Can stand on top, pass through
	SLOPE_L = 3        # Left-facing slope
	SLOPE_R = 4        # Right-facing slope
	LADDER = 5         # Climbable
	WATER = 6          # Swimmable
	DAMAGE = 7         # Causes damage
	TRIGGER = 8        # Event trigger
	WARP = 9           # Map transition
	ICE = 10           # Slippery surface
	CONVEYOR_L = 11    # Moves left
	CONVEYOR_R = 12    # Moves right
	BREAKABLE = 13     # Can be destroyed
	PUSHABLE = 14      # Can be pushed
	CUSTOM = 15        # Custom behavior


class CollisionFlags(Flag):
	"""Additional collision flags."""
	NONE = 0
	BLOCK_TOP = auto()
	BLOCK_BOTTOM = auto()
	BLOCK_LEFT = auto()
	BLOCK_RIGHT = auto()
	BLOCK_ALL = BLOCK_TOP | BLOCK_BOTTOM | BLOCK_LEFT | BLOCK_RIGHT

	PLAYER_ONLY = auto()
	NPC_ONLY = auto()
	PROJECTILE_PASS = auto()
	JUMP_THROUGH = auto()

	HIDDEN = auto()
	TRANSPARENT = auto()


@dataclass
class TileCollision:
	"""Collision data for a single tile."""
	tile_id: int
	type: CollisionType = CollisionType.NONE
	flags: int = 0           # CollisionFlags bitmask

	# Shape data (0-255 per corner for slopes)
	height_left: int = 0
	height_right: int = 0

	# Additional properties
	damage: int = 0          # Damage amount
	trigger_id: int = 0      # Event trigger ID
	sound_id: int = 0        # Footstep sound

	def to_dict(self) -> Dict:
		"""Convert to dictionary."""
		return {
			"tile_id": self.tile_id,
			"type": self.type.name,
			"flags": self.flags,
			"height_left": self.height_left,
			"height_right": self.height_right,
			"damage": self.damage,
			"trigger_id": self.trigger_id,
			"sound_id": self.sound_id
		}

	@classmethod
	def from_dict(cls, data: Dict) -> "TileCollision":
		"""Create from dictionary."""
		return cls(
			tile_id=data.get("tile_id", 0),
			type=CollisionType[data.get("type", "NONE")],
			flags=data.get("flags", 0),
			height_left=data.get("height_left", 0),
			height_right=data.get("height_right", 0),
			damage=data.get("damage", 0),
			trigger_id=data.get("trigger_id", 0),
			sound_id=data.get("sound_id", 0)
		)

	def to_byte(self) -> int:
		"""Convert to single byte (simple format)."""
		return self.type.value

	def to_bytes_extended(self) -> bytes:
		"""Convert to extended format (4 bytes)."""
		return bytes([
			self.type.value,
			self.flags & 0xFF,
			self.height_left,
			self.height_right
		])


@dataclass
class CollisionTable:
	"""Table of collision data for all tiles."""
	tiles: Dict[int, TileCollision] = field(default_factory=dict)
	tileset_name: str = ""
	tile_count: int = 256

	def get(self, tile_id: int) -> TileCollision:
		"""Get collision for a tile."""
		if tile_id in self.tiles:
			return self.tiles[tile_id]
		return TileCollision(tile_id=tile_id)

	def set(self, collision: TileCollision):
		"""Set collision for a tile."""
		self.tiles[collision.tile_id] = collision

	def get_tiles_by_type(self, col_type: CollisionType) -> List[int]:
		"""Get all tiles with a specific type."""
		return [t.tile_id for t in self.tiles.values()
				if t.type == col_type]

	def to_dict(self) -> Dict:
		"""Convert to dictionary."""
		return {
			"tileset_name": self.tileset_name,
			"tile_count": self.tile_count,
			"tiles": {str(k): v.to_dict() for k, v in self.tiles.items()}
		}

	@classmethod
	def from_dict(cls, data: Dict) -> "CollisionTable":
		"""Create from dictionary."""
		table = cls(
			tileset_name=data.get("tileset_name", ""),
			tile_count=data.get("tile_count", 256)
		)
		for key, tile_data in data.get("tiles", {}).items():
			table.tiles[int(key)] = TileCollision.from_dict(tile_data)
		return table

	def to_bytes(self, extended: bool = False) -> bytes:
		"""Export as binary data."""
		result = bytearray()

		for i in range(self.tile_count):
			collision = self.get(i)
			if extended:
				result.extend(collision.to_bytes_extended())
			else:
				result.append(collision.to_byte())

		return bytes(result)

	@classmethod
	def from_bytes(cls, data: bytes, extended: bool = False) -> "CollisionTable":
		"""Import from binary data."""
		table = cls()
		stride = 4 if extended else 1

		for i in range(len(data) // stride):
			if extended:
				offset = i * 4
				if offset + 4 <= len(data):
					collision = TileCollision(
						tile_id=i,
						type=CollisionType(data[offset] & 0x0F),
						flags=data[offset + 1],
						height_left=data[offset + 2],
						height_right=data[offset + 3]
					)
					table.tiles[i] = collision
			else:
				collision = TileCollision(
					tile_id=i,
					type=CollisionType(data[i] & 0x0F)
				)
				if data[i] != 0:
					table.tiles[i] = collision

		table.tile_count = len(data) // stride
		return table


class CollisionRenderer:
	"""Render collision data as images/overlays."""

	TYPE_COLORS = {
		CollisionType.NONE: (0, 0, 0, 0),
		CollisionType.SOLID: (255, 0, 0, 128),
		CollisionType.PLATFORM: (0, 255, 0, 128),
		CollisionType.SLOPE_L: (255, 255, 0, 128),
		CollisionType.SLOPE_R: (255, 192, 0, 128),
		CollisionType.LADDER: (0, 0, 255, 128),
		CollisionType.WATER: (0, 128, 255, 128),
		CollisionType.DAMAGE: (255, 0, 255, 128),
		CollisionType.TRIGGER: (128, 0, 255, 128),
		CollisionType.WARP: (255, 255, 255, 128),
		CollisionType.ICE: (128, 255, 255, 128),
	}

	@classmethod
	def render_tile(cls, collision: TileCollision, size: int = 8) -> bytes:
		"""Render single tile as RGBA."""
		color = cls.TYPE_COLORS.get(collision.type, (128, 128, 128, 128))
		return bytes(color) * (size * size)

	@classmethod
	def render_grid(cls, table: CollisionTable, cols: int = 16,
				   tile_size: int = 8) -> Optional[bytes]:
		"""Render collision table as grid."""
		try:
			from PIL import Image
		except ImportError:
			return None

		rows = (table.tile_count + cols - 1) // cols
		width = cols * tile_size
		height = rows * tile_size

		img = Image.new('RGBA', (width, height), (0, 0, 0, 0))

		for i in range(table.tile_count):
			collision = table.get(i)
			color = cls.TYPE_COLORS.get(collision.type, (0, 0, 0, 0))

			x = (i % cols) * tile_size
			y = (i // cols) * tile_size

			for py in range(tile_size):
				for px in range(tile_size):
					img.putpixel((x + px, y + py), color)

		return img.tobytes()


class CollisionEditor:
	"""GUI editor for collision data."""

	def __init__(self, master=None):
		if not HAS_TK:
			raise ImportError("tkinter required for GUI")

		self.table = CollisionTable()
		self.selected_tile = 0
		self.current_type = CollisionType.SOLID

		self.root = master or tk.Tk()
		self.root.title("Tile Collision Editor")
		self._build_ui()

	def _build_ui(self):
		"""Build the UI."""
		# Main paned window
		paned = ttk.PanedWindow(self.root, orient=tk.HORIZONTAL)
		paned.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)

		# Left panel - tile grid
		left_frame = ttk.Frame(paned)
		paned.add(left_frame, weight=2)

		ttk.Label(left_frame, text="Tiles").pack()

		# Tile canvas
		self.canvas = tk.Canvas(left_frame, width=256, height=256, bg='black')
		self.canvas.pack(padx=5, pady=5)
		self.canvas.bind('<Button-1>', self._on_tile_click)
		self.canvas.bind('<B1-Motion>', self._on_tile_drag)

		# Right panel - properties
		right_frame = ttk.Frame(paned)
		paned.add(right_frame, weight=1)

		ttk.Label(right_frame, text="Collision Type").pack(pady=5)

		self.type_var = tk.StringVar(value=CollisionType.NONE.name)
		type_combo = ttk.Combobox(right_frame, textvariable=self.type_var,
								 values=[t.name for t in CollisionType])
		type_combo.pack(fill=tk.X, padx=5)
		type_combo.bind('<<ComboboxSelected>>', self._on_type_change)

		# Flags
		ttk.Label(right_frame, text="Flags").pack(pady=(10, 5))

		self.flag_vars = {}
		for flag in [f for f in CollisionFlags if f.value > 0 and f.value.bit_count() == 1]:
			var = tk.BooleanVar()
			self.flag_vars[flag] = var
			ttk.Checkbutton(right_frame, text=flag.name, variable=var,
						   command=self._on_flag_change).pack(anchor=tk.W, padx=10)

		# Properties
		ttk.Label(right_frame, text="Properties").pack(pady=(10, 5))

		props_frame = ttk.Frame(right_frame)
		props_frame.pack(fill=tk.X, padx=5)

		ttk.Label(props_frame, text="Damage:").grid(row=0, column=0, sticky=tk.W)
		self.damage_var = tk.StringVar(value="0")
		ttk.Entry(props_frame, textvariable=self.damage_var, width=8).grid(row=0, column=1)

		ttk.Label(props_frame, text="Trigger:").grid(row=1, column=0, sticky=tk.W)
		self.trigger_var = tk.StringVar(value="0")
		ttk.Entry(props_frame, textvariable=self.trigger_var, width=8).grid(row=1, column=1)

		# Buttons
		btn_frame = ttk.Frame(right_frame)
		btn_frame.pack(fill=tk.X, padx=5, pady=10)

		ttk.Button(btn_frame, text="Apply", command=self._apply_changes).pack(side=tk.LEFT)
		ttk.Button(btn_frame, text="Fill All", command=self._fill_all).pack(side=tk.LEFT, padx=5)
		ttk.Button(btn_frame, text="Clear All", command=self._clear_all).pack(side=tk.LEFT)

		# Menu
		self._build_menu()

		# Initial draw
		self._draw_grid()

	def _build_menu(self):
		"""Build menu bar."""
		menubar = tk.Menu(self.root)
		self.root.config(menu=menubar)

		file_menu = tk.Menu(menubar, tearoff=0)
		menubar.add_cascade(label="File", menu=file_menu)
		file_menu.add_command(label="Load JSON...", command=self._load_json)
		file_menu.add_command(label="Save JSON...", command=self._save_json)
		file_menu.add_separator()
		file_menu.add_command(label="Import Binary...", command=self._import_binary)
		file_menu.add_command(label="Export Binary...", command=self._export_binary)
		file_menu.add_separator()
		file_menu.add_command(label="Exit", command=self.root.quit)

	def _draw_grid(self):
		"""Draw the tile grid."""
		self.canvas.delete('all')

		tile_size = 16
		cols = 16

		colors = {
			CollisionType.NONE: '#000000',
			CollisionType.SOLID: '#FF0000',
			CollisionType.PLATFORM: '#00FF00',
			CollisionType.SLOPE_L: '#FFFF00',
			CollisionType.SLOPE_R: '#FFC000',
			CollisionType.LADDER: '#0000FF',
			CollisionType.WATER: '#0080FF',
			CollisionType.DAMAGE: '#FF00FF',
			CollisionType.TRIGGER: '#8000FF',
			CollisionType.WARP: '#FFFFFF',
		}

		for i in range(256):
			x = (i % cols) * tile_size
			y = (i // cols) * tile_size

			collision = self.table.get(i)
			color = colors.get(collision.type, '#404040')

			self.canvas.create_rectangle(
				x, y, x + tile_size, y + tile_size,
				fill=color, outline='#333333'
			)

		# Highlight selected
		x = (self.selected_tile % cols) * tile_size
		y = (self.selected_tile // cols) * tile_size
		self.canvas.create_rectangle(
			x, y, x + tile_size, y + tile_size,
			outline='#00FFFF', width=2
		)

	def _on_tile_click(self, event):
		"""Handle tile click."""
		tile_size = 16
		cols = 16

		col = event.x // tile_size
		row = event.y // tile_size

		if 0 <= col < cols and 0 <= row < 16:
			self.selected_tile = row * cols + col
			self._update_properties()
			self._draw_grid()

	def _on_tile_drag(self, event):
		"""Handle tile drag (paint mode)."""
		tile_size = 16
		cols = 16

		col = event.x // tile_size
		row = event.y // tile_size

		if 0 <= col < cols and 0 <= row < 16:
			tile_id = row * cols + col
			collision = self.table.get(tile_id)
			collision.type = self.current_type
			self.table.set(collision)
			self._draw_grid()

	def _on_type_change(self, event=None):
		"""Handle collision type change."""
		self.current_type = CollisionType[self.type_var.get()]

	def _on_flag_change(self):
		"""Handle flag checkbox change."""
		pass  # Applied on button click

	def _update_properties(self):
		"""Update property panel from selected tile."""
		collision = self.table.get(self.selected_tile)

		self.type_var.set(collision.type.name)
		self.current_type = collision.type

		for flag, var in self.flag_vars.items():
			var.set(bool(collision.flags & flag.value))

		self.damage_var.set(str(collision.damage))
		self.trigger_var.set(str(collision.trigger_id))

	def _apply_changes(self):
		"""Apply changes to selected tile."""
		collision = TileCollision(tile_id=self.selected_tile)
		collision.type = CollisionType[self.type_var.get()]

		flags = 0
		for flag, var in self.flag_vars.items():
			if var.get():
				flags |= flag.value
		collision.flags = flags

		try:
			collision.damage = int(self.damage_var.get())
		except ValueError:
			collision.damage = 0

		try:
			collision.trigger_id = int(self.trigger_var.get())
		except ValueError:
			collision.trigger_id = 0

		self.table.set(collision)
		self._draw_grid()

	def _fill_all(self):
		"""Fill all tiles with current type."""
		for i in range(256):
			collision = TileCollision(tile_id=i, type=self.current_type)
			self.table.set(collision)
		self._draw_grid()

	def _clear_all(self):
		"""Clear all collision data."""
		self.table = CollisionTable()
		self._draw_grid()

	def _load_json(self):
		"""Load from JSON file."""
		path = filedialog.askopenfilename(
			filetypes=[("JSON files", "*.json"), ("All files", "*.*")]
		)
		if path:
			with open(path) as f:
				data = json.load(f)
			self.table = CollisionTable.from_dict(data)
			self._draw_grid()

	def _save_json(self):
		"""Save to JSON file."""
		path = filedialog.asksaveasfilename(
			defaultextension=".json",
			filetypes=[("JSON files", "*.json"), ("All files", "*.*")]
		)
		if path:
			with open(path, 'w') as f:
				json.dump(self.table.to_dict(), f, indent='\t')

	def _import_binary(self):
		"""Import from binary file."""
		path = filedialog.askopenfilename(
			filetypes=[("Binary files", "*.bin"), ("All files", "*.*")]
		)
		if path:
			data = Path(path).read_bytes()
			self.table = CollisionTable.from_bytes(data)
			self._draw_grid()

	def _export_binary(self):
		"""Export to binary file."""
		path = filedialog.asksaveasfilename(
			defaultextension=".bin",
			filetypes=[("Binary files", "*.bin"), ("All files", "*.*")]
		)
		if path:
			data = self.table.to_bytes()
			Path(path).write_bytes(data)

	def run(self):
		"""Run the editor."""
		self.root.mainloop()


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Tile Collision Editor")
	parser.add_argument("--gui", "-g", action="store_true",
						help="Launch GUI editor")
	parser.add_argument("--input", "-i", type=Path,
						help="Input collision file")
	parser.add_argument("--output", "-o", type=Path,
						help="Output file")
	parser.add_argument("--binary", "-b", action="store_true",
						help="Binary format")
	parser.add_argument("--extended", "-e", action="store_true",
						help="Extended binary format")
	parser.add_argument("--list-types", action="store_true",
						help="List collision types")

	args = parser.parse_args()

	if args.list_types:
		print("Collision Types:")
		for t in CollisionType:
			print(f"  {t.value:2d}: {t.name}")
		return

	if args.gui:
		if HAS_TK:
			editor = CollisionEditor()
			if args.input:
				if args.binary:
					data = args.input.read_bytes()
					editor.table = CollisionTable.from_bytes(data, args.extended)
				else:
					with open(args.input) as f:
						editor.table = CollisionTable.from_dict(json.load(f))
				editor._draw_grid()
			editor.run()
		else:
			print("GUI requires tkinter")
		return

	if args.input:
		if args.binary:
			data = args.input.read_bytes()
			table = CollisionTable.from_bytes(data, args.extended)
		else:
			with open(args.input) as f:
				table = CollisionTable.from_dict(json.load(f))

		if args.output:
			if args.binary:
				data = table.to_bytes(args.extended)
				args.output.write_bytes(data)
			else:
				with open(args.output, 'w') as f:
					json.dump(table.to_dict(), f, indent='\t')
			print(f"Saved to {args.output}")
		else:
			# Print summary
			types = {}
			for t in table.tiles.values():
				types[t.type.name] = types.get(t.type.name, 0) + 1

			print(f"Collision Table: {table.tile_count} tiles")
			for name, count in sorted(types.items()):
				print(f"  {name}: {count}")

	else:
		print("Tile Collision Editor")
		print()
		print("Usage:")
		print("  tile_collision.py --gui              Launch GUI editor")
		print("  tile_collision.py -i FILE            Load and analyze")
		print("  tile_collision.py -i FILE -o OUT     Convert file")
		print("  tile_collision.py --list-types       Show collision types")


if __name__ == "__main__":
	main()
