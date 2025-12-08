#!/usr/bin/env python3
"""
Tilemap Editor - Edit game tilemaps and nametables.

Supports:
- NES nametables (32x30 tiles, with attribute tables)
- SNES tilemaps (variable size, with flip/palette data)
- Generic tile-based maps

Author: ROM Hacking Toolkit
"""

import argparse
import json
import os
import struct
import sys
from dataclasses import dataclass, field
from enum import IntFlag
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Any

try:
	import tkinter as tk
	from tkinter import ttk, filedialog, messagebox, colorchooser
	HAS_TK = True
except ImportError:
	HAS_TK = False


class TileFlags(IntFlag):
	"""Tile attribute flags."""
	NONE = 0
	FLIP_H = 1
	FLIP_V = 2
	PRIORITY = 4


@dataclass
class Tile:
	"""Represents a single tile in the map."""
	index: int
	palette: int = 0
	flags: TileFlags = TileFlags.NONE
	
	def to_nes_byte(self) -> int:
		"""Convert to NES nametable byte."""
		return self.index & 0xFF
	
	def to_snes_word(self) -> int:
		"""Convert to SNES tilemap word."""
		value = self.index & 0x3FF
		value |= (self.palette & 0x07) << 10
		if TileFlags.PRIORITY in self.flags:
			value |= 0x2000
		if TileFlags.FLIP_H in self.flags:
			value |= 0x4000
		if TileFlags.FLIP_V in self.flags:
			value |= 0x8000
		return value
	
	@classmethod
	def from_nes_byte(cls, byte: int) -> 'Tile':
		"""Create from NES nametable byte."""
		return cls(index=byte)
	
	@classmethod
	def from_snes_word(cls, word: int) -> 'Tile':
		"""Create from SNES tilemap word."""
		flags = TileFlags.NONE
		if word & 0x4000:
			flags |= TileFlags.FLIP_H
		if word & 0x8000:
			flags |= TileFlags.FLIP_V
		if word & 0x2000:
			flags |= TileFlags.PRIORITY
		
		return cls(
			index=word & 0x3FF,
			palette=(word >> 10) & 0x07,
			flags=flags
		)


@dataclass
class Tilemap:
	"""Represents a tilemap."""
	width: int
	height: int
	tiles: List[List[Tile]] = field(default_factory=list)
	attributes: Optional[bytes] = None  # NES attribute table
	
	def __post_init__(self):
		if not self.tiles:
			self.tiles = [
				[Tile(0) for _ in range(self.width)]
				for _ in range(self.height)
			]
	
	def get_tile(self, x: int, y: int) -> Optional[Tile]:
		"""Get tile at position."""
		if 0 <= x < self.width and 0 <= y < self.height:
			return self.tiles[y][x]
		return None
	
	def set_tile(self, x: int, y: int, tile: Tile) -> None:
		"""Set tile at position."""
		if 0 <= x < self.width and 0 <= y < self.height:
			self.tiles[y][x] = tile
	
	def fill(self, tile_index: int, palette: int = 0) -> None:
		"""Fill entire map with a tile."""
		for y in range(self.height):
			for x in range(self.width):
				self.tiles[y][x] = Tile(tile_index, palette)
	
	def clear(self) -> None:
		"""Clear the map."""
		self.fill(0)
	
	@classmethod
	def from_nes_nametable(cls, data: bytes, include_attributes: bool = True) -> 'Tilemap':
		"""Create from NES nametable data."""
		tilemap = cls(width=32, height=30)
		
		# Parse tiles
		for y in range(30):
			for x in range(32):
				idx = y * 32 + x
				if idx < len(data):
					tilemap.tiles[y][x] = Tile.from_nes_byte(data[idx])
		
		# Parse attributes (64 bytes after nametable)
		if include_attributes and len(data) >= 960 + 64:
			tilemap.attributes = data[960:1024]
			
			# Apply palettes from attributes
			for y in range(30):
				for x in range(32):
					attr_x = x // 4
					attr_y = y // 4
					attr_idx = attr_y * 8 + attr_x
					
					if attr_idx < 64:
						attr = tilemap.attributes[attr_idx]
						
						# Determine which quadrant
						quad_x = (x % 4) // 2
						quad_y = (y % 4) // 2
						shift = (quad_y * 2 + quad_x) * 2
						palette = (attr >> shift) & 0x03
						
						tilemap.tiles[y][x].palette = palette
		
		return tilemap
	
	def to_nes_nametable(self) -> bytes:
		"""Convert to NES nametable data."""
		# Nametable (960 bytes)
		nametable = bytearray(960)
		for y in range(30):
			for x in range(32):
				idx = y * 32 + x
				nametable[idx] = self.tiles[y][x].to_nes_byte()
		
		# Attribute table (64 bytes)
		attributes = bytearray(64)
		for attr_y in range(8):
			for attr_x in range(8):
				attr = 0
				for quad_y in range(2):
					for quad_x in range(2):
						tile_x = attr_x * 4 + quad_x * 2
						tile_y = attr_y * 4 + quad_y * 2
						
						if tile_y < 30 and tile_x < 32:
							palette = self.tiles[tile_y][tile_x].palette & 0x03
							shift = (quad_y * 2 + quad_x) * 2
							attr |= palette << shift
				
				attributes[attr_y * 8 + attr_x] = attr
		
		return bytes(nametable) + bytes(attributes)
	
	@classmethod
	def from_snes_tilemap(cls, data: bytes, width: int, height: int) -> 'Tilemap':
		"""Create from SNES tilemap data."""
		tilemap = cls(width=width, height=height)
		
		for y in range(height):
			for x in range(width):
				idx = (y * width + x) * 2
				if idx + 1 < len(data):
					word = data[idx] | (data[idx + 1] << 8)
					tilemap.tiles[y][x] = Tile.from_snes_word(word)
		
		return tilemap
	
	def to_snes_tilemap(self) -> bytes:
		"""Convert to SNES tilemap data."""
		output = bytearray()
		
		for y in range(self.height):
			for x in range(self.width):
				word = self.tiles[y][x].to_snes_word()
				output.append(word & 0xFF)
				output.append((word >> 8) & 0xFF)
		
		return bytes(output)
	
	def to_json(self) -> Dict[str, Any]:
		"""Convert to JSON-serializable dict."""
		return {
			"width": self.width,
			"height": self.height,
			"tiles": [
				[
					{
						"index": t.index,
						"palette": t.palette,
						"flags": int(t.flags)
					}
					for t in row
				]
				for row in self.tiles
			]
		}
	
	@classmethod
	def from_json(cls, data: Dict[str, Any]) -> 'Tilemap':
		"""Create from JSON data."""
		tilemap = cls(
			width=data["width"],
			height=data["height"]
		)
		
		for y, row in enumerate(data["tiles"]):
			for x, t in enumerate(row):
				tilemap.tiles[y][x] = Tile(
					index=t["index"],
					palette=t.get("palette", 0),
					flags=TileFlags(t.get("flags", 0))
				)
		
		return tilemap


class TilemapViewer:
	"""Text-based tilemap viewer."""
	
	def __init__(self, tilemap: Tilemap):
		"""Initialize viewer."""
		self.tilemap = tilemap
	
	def render_ascii(self) -> str:
		"""Render tilemap as ASCII art."""
		lines = []
		
		# Header
		header = "    " + "".join(f"{x:2X}" for x in range(min(self.tilemap.width, 32)))
		lines.append(header)
		lines.append("    " + "-" * (min(self.tilemap.width, 32) * 2))
		
		for y in range(self.tilemap.height):
			row = f"{y:02X}| "
			for x in range(self.tilemap.width):
				tile = self.tilemap.tiles[y][x]
				# Use printable character or hex
				if 0x20 <= tile.index < 0x7F:
					row += f"{chr(tile.index)} "
				else:
					row += f"{tile.index:02X}"[:2]
			lines.append(row)
		
		return "\n".join(lines)
	
	def render_indices(self) -> str:
		"""Render just tile indices."""
		lines = []
		
		for y in range(self.tilemap.height):
			row = []
			for x in range(self.tilemap.width):
				tile = self.tilemap.tiles[y][x]
				row.append(f"{tile.index:02X}")
			lines.append(" ".join(row))
		
		return "\n".join(lines)


if HAS_TK:
	class TilemapEditorGUI:
		"""GUI tilemap editor."""
		
		def __init__(self, tilemap: Optional[Tilemap] = None):
			"""Initialize GUI."""
			self.tilemap = tilemap or Tilemap(32, 30)
			self.current_tile = 0
			self.current_palette = 0
			self.zoom = 2
			self.tile_size = 8
			self.grid_visible = True
			
			self.root = tk.Tk()
			self.root.title("Tilemap Editor")
			self._create_widgets()
		
		def _create_widgets(self):
			"""Create GUI widgets."""
			# Main frame
			main_frame = ttk.Frame(self.root)
			main_frame.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)
			
			# Toolbar
			toolbar = ttk.Frame(main_frame)
			toolbar.pack(fill=tk.X)
			
			ttk.Button(toolbar, text="New", command=self._new_tilemap).pack(side=tk.LEFT)
			ttk.Button(toolbar, text="Open", command=self._open_file).pack(side=tk.LEFT)
			ttk.Button(toolbar, text="Save", command=self._save_file).pack(side=tk.LEFT)
			
			ttk.Separator(toolbar, orient=tk.VERTICAL).pack(side=tk.LEFT, fill=tk.Y, padx=5)
			
			ttk.Label(toolbar, text="Tile:").pack(side=tk.LEFT)
			self.tile_var = tk.StringVar(value="00")
			tile_entry = ttk.Entry(toolbar, textvariable=self.tile_var, width=4)
			tile_entry.pack(side=tk.LEFT)
			tile_entry.bind("<Return>", self._update_tile)
			
			ttk.Label(toolbar, text="Palette:").pack(side=tk.LEFT, padx=(10, 0))
			self.palette_var = tk.StringVar(value="0")
			palette_combo = ttk.Combobox(toolbar, textvariable=self.palette_var,
				values=["0", "1", "2", "3"], width=3, state="readonly")
			palette_combo.pack(side=tk.LEFT)
			palette_combo.bind("<<ComboboxSelected>>", self._update_palette)
			
			# Grid toggle
			self.grid_var = tk.BooleanVar(value=True)
			ttk.Checkbutton(toolbar, text="Grid", variable=self.grid_var,
				command=self._toggle_grid).pack(side=tk.LEFT, padx=(10, 0))
			
			# Canvas frame with scrollbars
			canvas_frame = ttk.Frame(main_frame)
			canvas_frame.pack(fill=tk.BOTH, expand=True, pady=5)
			
			# Scrollbars
			h_scroll = ttk.Scrollbar(canvas_frame, orient=tk.HORIZONTAL)
			v_scroll = ttk.Scrollbar(canvas_frame, orient=tk.VERTICAL)
			
			# Canvas
			canvas_width = self.tilemap.width * self.tile_size * self.zoom
			canvas_height = self.tilemap.height * self.tile_size * self.zoom
			
			self.canvas = tk.Canvas(
				canvas_frame,
				width=min(canvas_width, 800),
				height=min(canvas_height, 600),
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
			self.canvas.bind("<Button-3>", self._on_right_click)
			
			# Status bar
			self.status_var = tk.StringVar(value="Ready")
			status_bar = ttk.Label(main_frame, textvariable=self.status_var, relief=tk.SUNKEN)
			status_bar.pack(fill=tk.X)
			
			# Initial render
			self._render()
		
		def _render(self):
			"""Render tilemap to canvas."""
			self.canvas.delete("all")
			
			# Palette colors (placeholder)
			palette_colors = [
				["#000000", "#0000AA", "#00AA00", "#00AAAA"],  # Palette 0
				["#AA0000", "#AA00AA", "#AA5500", "#AAAAAA"],  # Palette 1
				["#555555", "#5555FF", "#55FF55", "#55FFFF"],  # Palette 2
				["#FF5555", "#FF55FF", "#FFFF55", "#FFFFFF"],  # Palette 3
			]
			
			tile_px = self.tile_size * self.zoom
			
			for y in range(self.tilemap.height):
				for x in range(self.tilemap.width):
					tile = self.tilemap.tiles[y][x]
					
					x1 = x * tile_px
					y1 = y * tile_px
					x2 = x1 + tile_px
					y2 = y1 + tile_px
					
					# Color based on palette
					color = palette_colors[tile.palette % 4][tile.index % 4]
					
					self.canvas.create_rectangle(x1, y1, x2, y2, fill=color, outline="")
					
					# Draw tile index
					if self.zoom >= 2:
						text_color = "#FFFFFF" if tile.palette < 2 else "#000000"
						self.canvas.create_text(
							x1 + tile_px // 2,
							y1 + tile_px // 2,
							text=f"{tile.index:02X}",
							fill=text_color,
							font=("Courier", max(6, tile_px // 3))
						)
			
			# Draw grid
			if self.grid_visible:
				for x in range(self.tilemap.width + 1):
					x_pos = x * tile_px
					self.canvas.create_line(x_pos, 0, x_pos, self.tilemap.height * tile_px,
						fill="#333333")
				
				for y in range(self.tilemap.height + 1):
					y_pos = y * tile_px
					self.canvas.create_line(0, y_pos, self.tilemap.width * tile_px, y_pos,
						fill="#333333")
		
		def _on_click(self, event):
			"""Handle canvas click."""
			x = int(self.canvas.canvasx(event.x) // (self.tile_size * self.zoom))
			y = int(self.canvas.canvasy(event.y) // (self.tile_size * self.zoom))
			
			if 0 <= x < self.tilemap.width and 0 <= y < self.tilemap.height:
				self.tilemap.tiles[y][x] = Tile(
					self.current_tile,
					self.current_palette
				)
				self._render()
				self.status_var.set(f"Set tile ({x}, {y}) to {self.current_tile:02X}")
		
		def _on_drag(self, event):
			"""Handle canvas drag."""
			self._on_click(event)
		
		def _on_right_click(self, event):
			"""Handle right click (pick tile)."""
			x = int(self.canvas.canvasx(event.x) // (self.tile_size * self.zoom))
			y = int(self.canvas.canvasy(event.y) // (self.tile_size * self.zoom))
			
			if 0 <= x < self.tilemap.width and 0 <= y < self.tilemap.height:
				tile = self.tilemap.tiles[y][x]
				self.current_tile = tile.index
				self.current_palette = tile.palette
				self.tile_var.set(f"{tile.index:02X}")
				self.palette_var.set(str(tile.palette))
				self.status_var.set(f"Picked tile {tile.index:02X} palette {tile.palette}")
		
		def _update_tile(self, event=None):
			"""Update current tile from entry."""
			try:
				self.current_tile = int(self.tile_var.get(), 16)
				self.status_var.set(f"Current tile: {self.current_tile:02X}")
			except ValueError:
				self.status_var.set("Invalid tile index")
		
		def _update_palette(self, event=None):
			"""Update current palette."""
			self.current_palette = int(self.palette_var.get())
			self.status_var.set(f"Current palette: {self.current_palette}")
		
		def _toggle_grid(self):
			"""Toggle grid visibility."""
			self.grid_visible = self.grid_var.get()
			self._render()
		
		def _new_tilemap(self):
			"""Create new tilemap."""
			dialog = tk.Toplevel(self.root)
			dialog.title("New Tilemap")
			dialog.transient(self.root)
			dialog.grab_set()
			
			ttk.Label(dialog, text="Width:").grid(row=0, column=0, padx=5, pady=5)
			width_var = tk.StringVar(value="32")
			ttk.Entry(dialog, textvariable=width_var, width=10).grid(row=0, column=1)
			
			ttk.Label(dialog, text="Height:").grid(row=1, column=0, padx=5, pady=5)
			height_var = tk.StringVar(value="30")
			ttk.Entry(dialog, textvariable=height_var, width=10).grid(row=1, column=1)
			
			def create():
				try:
					w = int(width_var.get())
					h = int(height_var.get())
					self.tilemap = Tilemap(w, h)
					self._render()
					dialog.destroy()
				except ValueError:
					messagebox.showerror("Error", "Invalid dimensions")
			
			ttk.Button(dialog, text="Create", command=create).grid(row=2, column=0, columnspan=2, pady=10)
		
		def _open_file(self):
			"""Open tilemap file."""
			filetypes = [
				("JSON files", "*.json"),
				("Binary files", "*.bin *.nam"),
				("All files", "*.*")
			]
			
			path = filedialog.askopenfilename(filetypes=filetypes)
			if not path:
				return
			
			try:
				if path.endswith('.json'):
					with open(path, 'r') as f:
						data = json.load(f)
					self.tilemap = Tilemap.from_json(data)
				else:
					# Assume NES nametable
					with open(path, 'rb') as f:
						data = f.read()
					self.tilemap = Tilemap.from_nes_nametable(data)
				
				self._render()
				self.status_var.set(f"Loaded: {path}")
			
			except Exception as e:
				messagebox.showerror("Error", f"Failed to load: {e}")
		
		def _save_file(self):
			"""Save tilemap file."""
			filetypes = [
				("JSON files", "*.json"),
				("NES nametable", "*.nam"),
				("Binary files", "*.bin"),
				("All files", "*.*")
			]
			
			path = filedialog.asksaveasfilename(filetypes=filetypes, defaultextension=".json")
			if not path:
				return
			
			try:
				if path.endswith('.json'):
					with open(path, 'w') as f:
						json.dump(self.tilemap.to_json(), f, indent='\t')
				else:
					with open(path, 'wb') as f:
						f.write(self.tilemap.to_nes_nametable())
				
				self.status_var.set(f"Saved: {path}")
			
			except Exception as e:
				messagebox.showerror("Error", f"Failed to save: {e}")
		
		def run(self):
			"""Run the application."""
			self.root.mainloop()


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description="Edit game tilemaps",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
  %(prog)s edit                              # Launch GUI editor
  %(prog)s view nametable.bin                # View tilemap
  %(prog)s convert nametable.bin -o map.json # Convert to JSON
  %(prog)s convert map.json -o nametable.bin # Convert to binary
		"""
	)
	
	subparsers = parser.add_subparsers(dest="command", help="Command to execute")
	
	# Edit command
	edit_parser = subparsers.add_parser("edit", help="Launch GUI editor")
	edit_parser.add_argument("file", nargs="?", help="File to open")
	
	# View command
	view_parser = subparsers.add_parser("view", help="View tilemap")
	view_parser.add_argument("file", help="Tilemap file")
	view_parser.add_argument("--format", choices=["nes", "snes", "json"], default="nes")
	view_parser.add_argument("--width", type=int, default=32, help="Width for SNES format")
	view_parser.add_argument("--height", type=int, default=32, help="Height for SNES format")
	
	# Convert command
	convert_parser = subparsers.add_parser("convert", help="Convert tilemap format")
	convert_parser.add_argument("input", help="Input file")
	convert_parser.add_argument("-o", "--output", required=True, help="Output file")
	convert_parser.add_argument("--in-format", choices=["nes", "snes", "json"], default="nes")
	convert_parser.add_argument("--out-format", choices=["nes", "snes", "json"])
	convert_parser.add_argument("--width", type=int, default=32)
	convert_parser.add_argument("--height", type=int, default=32)
	
	# Create command
	create_parser = subparsers.add_parser("create", help="Create empty tilemap")
	create_parser.add_argument("-o", "--output", required=True, help="Output file")
	create_parser.add_argument("--width", type=int, default=32)
	create_parser.add_argument("--height", type=int, default=30)
	create_parser.add_argument("--fill", type=lambda x: int(x, 0), default=0)
	
	args = parser.parse_args()
	
	if not args.command:
		if HAS_TK:
			# Default to GUI
			app = TilemapEditorGUI()
			app.run()
		else:
			parser.print_help()
		return 0
	
	try:
		if args.command == "edit":
			if not HAS_TK:
				print("Error: GUI requires tkinter")
				return 1
			
			tilemap = None
			if args.file:
				path = Path(args.file)
				if path.suffix == '.json':
					tilemap = Tilemap.from_json(json.loads(path.read_text()))
				else:
					tilemap = Tilemap.from_nes_nametable(path.read_bytes())
			
			app = TilemapEditorGUI(tilemap)
			app.run()
		
		elif args.command == "view":
			path = Path(args.file)
			
			if args.format == "json":
				tilemap = Tilemap.from_json(json.loads(path.read_text()))
			elif args.format == "snes":
				tilemap = Tilemap.from_snes_tilemap(path.read_bytes(), args.width, args.height)
			else:
				tilemap = Tilemap.from_nes_nametable(path.read_bytes())
			
			viewer = TilemapViewer(tilemap)
			print(f"Tilemap: {tilemap.width}x{tilemap.height}")
			print()
			print(viewer.render_ascii())
		
		elif args.command == "convert":
			input_path = Path(args.input)
			output_path = Path(args.output)
			
			# Determine output format
			out_format = args.out_format
			if not out_format:
				if output_path.suffix == '.json':
					out_format = 'json'
				elif output_path.suffix == '.nam':
					out_format = 'nes'
				else:
					out_format = 'nes'
			
			# Load
			if args.in_format == "json":
				tilemap = Tilemap.from_json(json.loads(input_path.read_text()))
			elif args.in_format == "snes":
				tilemap = Tilemap.from_snes_tilemap(input_path.read_bytes(), args.width, args.height)
			else:
				tilemap = Tilemap.from_nes_nametable(input_path.read_bytes())
			
			# Save
			if out_format == "json":
				output_path.write_text(json.dumps(tilemap.to_json(), indent='\t'))
			elif out_format == "snes":
				output_path.write_bytes(tilemap.to_snes_tilemap())
			else:
				output_path.write_bytes(tilemap.to_nes_nametable())
			
			print(f"Converted: {input_path} -> {output_path}")
		
		elif args.command == "create":
			tilemap = Tilemap(args.width, args.height)
			tilemap.fill(args.fill)
			
			output_path = Path(args.output)
			if output_path.suffix == '.json':
				output_path.write_text(json.dumps(tilemap.to_json(), indent='\t'))
			else:
				output_path.write_bytes(tilemap.to_nes_nametable())
			
			print(f"Created: {output_path} ({args.width}x{args.height})")
	
	except FileNotFoundError as e:
		print(f"Error: File not found: {e.filename}")
		return 1
	except Exception as e:
		print(f"Error: {e}")
		return 1
	
	return 0


if __name__ == "__main__":
	sys.exit(main())
