#!/usr/bin/env python3
"""
Sprite Animator - Create and preview sprite animations from ROM data.

Features:
- Load sprite sheets from ROM or image files
- Define animation frames and timing
- Preview animations in real-time
- Export to GIF or sprite sheets
- Support for NES, SNES, GB sprite formats

Author: ROM Hacking Toolkit
"""

import argparse
import json
import struct
import sys
import time
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Any, Callable, Dict, List, Optional, Tuple

try:
	from PIL import Image
	HAS_PIL = True
except ImportError:
	HAS_PIL = False

try:
	import tkinter as tk
	from tkinter import ttk, filedialog, messagebox
	HAS_TK = True
except ImportError:
	HAS_TK = False


class SpriteFormat(Enum):
	"""Supported sprite data formats."""
	NES_8X8 = "nes_8x8"
	NES_8X16 = "nes_8x16"
	SNES_4BPP = "snes_4bpp"
	SNES_8BPP = "snes_8bpp"
	GB_2BPP = "gb_2bpp"
	GBA_4BPP = "gba_4bpp"
	LINEAR_8BPP = "linear_8bpp"


@dataclass
class SpriteFrame:
	"""Single frame of animation."""
	tile_indices: List[int]  # Tile IDs to display
	duration: int  # Duration in frames (60fps for NES)
	x_offset: int = 0
	y_offset: int = 0
	flip_h: bool = False
	flip_v: bool = False
	palette: int = 0


@dataclass
class Animation:
	"""Animation sequence."""
	name: str
	frames: List[SpriteFrame]
	loop: bool = True
	width: int = 8
	height: int = 8


@dataclass
class SpriteSheet:
	"""Collection of sprite tiles."""
	tiles: List[bytes]  # Raw tile data
	tile_width: int = 8
	tile_height: int = 8
	format_type: SpriteFormat = SpriteFormat.NES_8X8


@dataclass
class Palette:
	"""Color palette."""
	colors: List[Tuple[int, int, int]]  # RGB tuples
	name: str = ""


# NES system palette (simplified)
NES_PALETTE = [
	(0x7C, 0x7C, 0x7C), (0x00, 0x00, 0xFC), (0x00, 0x00, 0xBC), (0x44, 0x28, 0xBC),
	(0x94, 0x00, 0x84), (0xA8, 0x00, 0x20), (0xA8, 0x10, 0x00), (0x88, 0x14, 0x00),
	(0x50, 0x30, 0x00), (0x00, 0x78, 0x00), (0x00, 0x68, 0x00), (0x00, 0x58, 0x00),
	(0x00, 0x40, 0x58), (0x00, 0x00, 0x00), (0x00, 0x00, 0x00), (0x00, 0x00, 0x00),
	(0xBC, 0xBC, 0xBC), (0x00, 0x78, 0xF8), (0x00, 0x58, 0xF8), (0x68, 0x44, 0xFC),
	(0xD8, 0x00, 0xCC), (0xE4, 0x00, 0x58), (0xF8, 0x38, 0x00), (0xE4, 0x5C, 0x10),
	(0xAC, 0x7C, 0x00), (0x00, 0xB8, 0x00), (0x00, 0xA8, 0x00), (0x00, 0xA8, 0x44),
	(0x00, 0x88, 0x88), (0x00, 0x00, 0x00), (0x00, 0x00, 0x00), (0x00, 0x00, 0x00),
	(0xF8, 0xF8, 0xF8), (0x3C, 0xBC, 0xFC), (0x68, 0x88, 0xFC), (0x98, 0x78, 0xF8),
	(0xF8, 0x78, 0xF8), (0xF8, 0x58, 0x98), (0xF8, 0x78, 0x58), (0xFC, 0xA0, 0x44),
	(0xF8, 0xB8, 0x00), (0xB8, 0xF8, 0x18), (0x58, 0xD8, 0x54), (0x58, 0xF8, 0x98),
	(0x00, 0xE8, 0xD8), (0x78, 0x78, 0x78), (0x00, 0x00, 0x00), (0x00, 0x00, 0x00),
	(0xFC, 0xFC, 0xFC), (0xA4, 0xE4, 0xFC), (0xB8, 0xB8, 0xF8), (0xD8, 0xB8, 0xF8),
	(0xF8, 0xB8, 0xF8), (0xF8, 0xA4, 0xC0), (0xF0, 0xD0, 0xB0), (0xFC, 0xE0, 0xA8),
	(0xF8, 0xD8, 0x78), (0xD8, 0xF8, 0x78), (0xB8, 0xF8, 0xB8), (0xB8, 0xF8, 0xD8),
	(0x00, 0xFC, 0xFC), (0xF8, 0xD8, 0xF8), (0x00, 0x00, 0x00), (0x00, 0x00, 0x00),
]


def decode_nes_tile(data: bytes) -> List[List[int]]:
	"""Decode NES 2BPP tile to pixel array."""
	pixels = [[0] * 8 for _ in range(8)]

	for y in range(8):
		low = data[y] if y < len(data) else 0
		high = data[y + 8] if y + 8 < len(data) else 0

		for x in range(8):
			bit = 7 - x
			pixel = ((low >> bit) & 1) | (((high >> bit) & 1) << 1)
			pixels[y][x] = pixel

	return pixels


def decode_snes_tile_4bpp(data: bytes) -> List[List[int]]:
	"""Decode SNES 4BPP tile to pixel array."""
	pixels = [[0] * 8 for _ in range(8)]

	for y in range(8):
		# 4BPP: 2 bytes per row, interleaved
		bp0 = data[y * 2] if y * 2 < len(data) else 0
		bp1 = data[y * 2 + 1] if y * 2 + 1 < len(data) else 0
		bp2 = data[y * 2 + 16] if y * 2 + 16 < len(data) else 0
		bp3 = data[y * 2 + 17] if y * 2 + 17 < len(data) else 0

		for x in range(8):
			bit = 7 - x
			pixel = (
				((bp0 >> bit) & 1) |
				(((bp1 >> bit) & 1) << 1) |
				(((bp2 >> bit) & 1) << 2) |
				(((bp3 >> bit) & 1) << 3)
			)
			pixels[y][x] = pixel

	return pixels


def decode_gb_tile(data: bytes) -> List[List[int]]:
	"""Decode Game Boy 2BPP tile."""
	pixels = [[0] * 8 for _ in range(8)]

	for y in range(8):
		low = data[y * 2] if y * 2 < len(data) else 0
		high = data[y * 2 + 1] if y * 2 + 1 < len(data) else 0

		for x in range(8):
			bit = 7 - x
			pixel = ((low >> bit) & 1) | (((high >> bit) & 1) << 1)
			pixels[y][x] = pixel

	return pixels


def load_sprite_sheet(
	path: str,
	format_type: SpriteFormat,
	offset: int = 0,
	count: int = -1
) -> SpriteSheet:
	"""Load sprite tiles from ROM."""
	data = Path(path).read_bytes()

	sheet = SpriteSheet(tiles=[], format_type=format_type)

	# Determine tile size in bytes
	if format_type in [SpriteFormat.NES_8X8, SpriteFormat.GB_2BPP]:
		tile_size = 16
		sheet.tile_width = 8
		sheet.tile_height = 8
	elif format_type == SpriteFormat.NES_8X16:
		tile_size = 32
		sheet.tile_width = 8
		sheet.tile_height = 16
	elif format_type == SpriteFormat.SNES_4BPP:
		tile_size = 32
		sheet.tile_width = 8
		sheet.tile_height = 8
	elif format_type == SpriteFormat.SNES_8BPP:
		tile_size = 64
		sheet.tile_width = 8
		sheet.tile_height = 8
	elif format_type == SpriteFormat.GBA_4BPP:
		tile_size = 32
		sheet.tile_width = 8
		sheet.tile_height = 8
	else:
		tile_size = 64
		sheet.tile_width = 8
		sheet.tile_height = 8

	# Calculate tile count
	available = len(data) - offset
	max_tiles = available // tile_size

	if count < 0:
		count = max_tiles
	else:
		count = min(count, max_tiles)

	# Extract tiles
	for i in range(count):
		tile_offset = offset + i * tile_size
		tile_data = data[tile_offset:tile_offset + tile_size]
		sheet.tiles.append(tile_data)

	return sheet


def tile_to_image(
	tile_data: bytes,
	format_type: SpriteFormat,
	palette: Palette
) -> 'Image.Image':
	"""Convert tile to PIL Image."""
	if not HAS_PIL:
		raise ImportError("PIL/Pillow required for image operations")

	# Decode tile
	if format_type in [SpriteFormat.NES_8X8, SpriteFormat.NES_8X16]:
		pixels = decode_nes_tile(tile_data)
	elif format_type == SpriteFormat.SNES_4BPP:
		pixels = decode_snes_tile_4bpp(tile_data)
	elif format_type == SpriteFormat.GB_2BPP:
		pixels = decode_gb_tile(tile_data)
	else:
		pixels = decode_nes_tile(tile_data)  # Default

	# Create image
	height = len(pixels)
	width = len(pixels[0]) if pixels else 8

	img = Image.new('RGBA', (width, height))

	for y, row in enumerate(pixels):
		for x, pixel_idx in enumerate(row):
			if pixel_idx == 0:
				# Transparent
				img.putpixel((x, y), (0, 0, 0, 0))
			elif pixel_idx < len(palette.colors):
				r, g, b = palette.colors[pixel_idx]
				img.putpixel((x, y), (r, g, b, 255))
			else:
				img.putpixel((x, y), (255, 0, 255, 255))  # Magenta for invalid

	return img


def render_animation_frame(
	sheet: SpriteSheet,
	frame: SpriteFrame,
	palette: Palette,
	scale: int = 2
) -> 'Image.Image':
	"""Render a single animation frame."""
	if not HAS_PIL:
		raise ImportError("PIL/Pillow required")

	# Calculate canvas size based on tiles used
	tiles_wide = max(1, len(frame.tile_indices))
	canvas_w = tiles_wide * sheet.tile_width * scale
	canvas_h = sheet.tile_height * scale

	canvas = Image.new('RGBA', (canvas_w, canvas_h), (0, 0, 0, 0))

	for i, tile_idx in enumerate(frame.tile_indices):
		if tile_idx < len(sheet.tiles):
			tile_img = tile_to_image(
				sheet.tiles[tile_idx],
				sheet.format_type,
				palette
			)

			# Apply flips
			if frame.flip_h:
				tile_img = tile_img.transpose(Image.FLIP_LEFT_RIGHT)
			if frame.flip_v:
				tile_img = tile_img.transpose(Image.FLIP_TOP_BOTTOM)

			# Scale
			if scale != 1:
				tile_img = tile_img.resize(
					(tile_img.width * scale, tile_img.height * scale),
					Image.NEAREST
				)

			# Paste
			x = i * sheet.tile_width * scale + frame.x_offset * scale
			canvas.paste(tile_img, (x, frame.y_offset * scale), tile_img)

	return canvas


def export_animation_gif(
	sheet: SpriteSheet,
	animation: Animation,
	palette: Palette,
	output_path: str,
	scale: int = 4
):
	"""Export animation as GIF."""
	if not HAS_PIL:
		raise ImportError("PIL/Pillow required for GIF export")

	frames = []
	durations = []

	for frame in animation.frames:
		img = render_animation_frame(sheet, frame, palette, scale)

		# Convert to palette mode for GIF
		rgb_img = Image.new('RGB', img.size, (0, 0, 0))
		rgb_img.paste(img, mask=img.split()[3] if img.mode == 'RGBA' else None)
		frames.append(rgb_img)

		# Convert frame duration (60fps game frames to ms)
		ms = int(frame.duration * (1000 / 60))
		durations.append(max(20, ms))  # Minimum 20ms for GIF

	if frames:
		frames[0].save(
			output_path,
			save_all=True,
			append_images=frames[1:],
			duration=durations,
			loop=0 if animation.loop else 1
		)


def export_sprite_sheet(
	sheet: SpriteSheet,
	palette: Palette,
	output_path: str,
	tiles_per_row: int = 16,
	scale: int = 2
):
	"""Export all tiles as a sprite sheet image."""
	if not HAS_PIL:
		raise ImportError("PIL/Pillow required")

	tile_w = sheet.tile_width * scale
	tile_h = sheet.tile_height * scale

	rows = (len(sheet.tiles) + tiles_per_row - 1) // tiles_per_row

	img = Image.new('RGBA', (tiles_per_row * tile_w, rows * tile_h), (0, 0, 0, 255))

	for i, tile_data in enumerate(sheet.tiles):
		tile_img = tile_to_image(tile_data, sheet.format_type, palette)

		if scale != 1:
			tile_img = tile_img.resize((tile_w, tile_h), Image.NEAREST)

		x = (i % tiles_per_row) * tile_w
		y = (i // tiles_per_row) * tile_h

		img.paste(tile_img, (x, y), tile_img)

	img.save(output_path)


def load_animation_json(path: str) -> Tuple[Animation, List[int]]:
	"""Load animation definition from JSON."""
	with open(path, 'r') as f:
		data = json.load(f)

	frames = []
	for frame_data in data.get('frames', []):
		frames.append(SpriteFrame(
			tile_indices=frame_data.get('tiles', [0]),
			duration=frame_data.get('duration', 10),
			x_offset=frame_data.get('x_offset', 0),
			y_offset=frame_data.get('y_offset', 0),
			flip_h=frame_data.get('flip_h', False),
			flip_v=frame_data.get('flip_v', False),
			palette=frame_data.get('palette', 0)
		))

	animation = Animation(
		name=data.get('name', 'animation'),
		frames=frames,
		loop=data.get('loop', True),
		width=data.get('width', 8),
		height=data.get('height', 8)
	)

	palette_indices = data.get('palette', [0x0F, 0x00, 0x10, 0x30])

	return animation, palette_indices


def create_default_palette(indices: List[int] = None) -> Palette:
	"""Create palette from NES palette indices."""
	if indices is None:
		indices = [0x0F, 0x00, 0x10, 0x30]  # Default grayscale-ish

	colors = []
	for idx in indices:
		if 0 <= idx < len(NES_PALETTE):
			colors.append(NES_PALETTE[idx])
		else:
			colors.append((255, 0, 255))

	return Palette(colors=colors, name="default")


class SpriteAnimatorGUI:
	"""GUI for sprite animation preview."""

	def __init__(self, master: tk.Tk):
		"""Initialize GUI."""
		self.master = master
		self.master.title("Sprite Animator")
		self.master.geometry("800x600")

		self.sheet: Optional[SpriteSheet] = None
		self.animation: Optional[Animation] = None
		self.palette = create_default_palette()
		self.current_frame = 0
		self.playing = False
		self.scale = 4

		self._create_widgets()

	def _create_widgets(self) -> None:
		"""Create GUI widgets."""
		# Menu bar
		menubar = tk.Menu(self.master)
		self.master.config(menu=menubar)

		file_menu = tk.Menu(menubar, tearoff=0)
		file_menu.add_command(label="Load ROM...", command=self._load_rom)
		file_menu.add_command(label="Load Animation...", command=self._load_animation)
		file_menu.add_separator()
		file_menu.add_command(label="Export GIF...", command=self._export_gif)
		file_menu.add_command(label="Export Sheet...", command=self._export_sheet)
		file_menu.add_separator()
		file_menu.add_command(label="Exit", command=self.master.quit)
		menubar.add_cascade(label="File", menu=file_menu)

		# Main frame
		main_frame = ttk.Frame(self.master)
		main_frame.pack(fill=tk.BOTH, expand=True, padx=10, pady=10)

		# Canvas for preview
		self.canvas = tk.Canvas(main_frame, bg='black', width=256, height=256)
		self.canvas.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)

		# Controls frame
		ctrl_frame = ttk.Frame(main_frame)
		ctrl_frame.pack(side=tk.RIGHT, fill=tk.Y, padx=10)

		# Playback controls
		ttk.Label(ctrl_frame, text="Playback").pack(pady=5)

		btn_frame = ttk.Frame(ctrl_frame)
		btn_frame.pack()

		self.play_btn = ttk.Button(btn_frame, text="▶ Play", command=self._toggle_play)
		self.play_btn.pack(side=tk.LEFT, padx=2)

		ttk.Button(btn_frame, text="◀", command=self._prev_frame).pack(side=tk.LEFT, padx=2)
		ttk.Button(btn_frame, text="▶", command=self._next_frame).pack(side=tk.LEFT, padx=2)

		# Frame info
		self.frame_label = ttk.Label(ctrl_frame, text="Frame: 0 / 0")
		self.frame_label.pack(pady=10)

		# Scale control
		ttk.Label(ctrl_frame, text="Scale").pack(pady=5)
		self.scale_var = tk.IntVar(value=4)
		scale_spin = ttk.Spinbox(ctrl_frame, from_=1, to=8, textvariable=self.scale_var,
			width=5, command=self._update_scale)
		scale_spin.pack()

		# Tile list
		ttk.Label(ctrl_frame, text="Tiles").pack(pady=10)
		self.tile_list = tk.Listbox(ctrl_frame, height=10, width=20)
		self.tile_list.pack(fill=tk.X)
		self.tile_list.bind('<<ListboxSelect>>', self._on_tile_select)

	def _load_rom(self) -> None:
		"""Load ROM file."""
		path = filedialog.askopenfilename(
			title="Load ROM",
			filetypes=[
				("ROM files", "*.nes *.sfc *.smc *.gb *.gbc *.gba"),
				("All files", "*.*")
			]
		)

		if path:
			try:
				# Auto-detect format from extension
				ext = Path(path).suffix.lower()
				if ext == '.nes':
					format_type = SpriteFormat.NES_8X8
					offset = 16  # Skip header
				elif ext in ['.sfc', '.smc']:
					format_type = SpriteFormat.SNES_4BPP
					offset = 0
				elif ext in ['.gb', '.gbc']:
					format_type = SpriteFormat.GB_2BPP
					offset = 0
				else:
					format_type = SpriteFormat.NES_8X8
					offset = 0

				self.sheet = load_sprite_sheet(path, format_type, offset)
				self._update_tile_list()
				messagebox.showinfo("Loaded", f"Loaded {len(self.sheet.tiles)} tiles")
			except Exception as e:
				messagebox.showerror("Error", str(e))

	def _load_animation(self) -> None:
		"""Load animation definition."""
		path = filedialog.askopenfilename(
			title="Load Animation",
			filetypes=[("JSON files", "*.json"), ("All files", "*.*")]
		)

		if path:
			try:
				self.animation, pal_indices = load_animation_json(path)
				self.palette = create_default_palette(pal_indices)
				self.current_frame = 0
				self._update_display()
			except Exception as e:
				messagebox.showerror("Error", str(e))

	def _export_gif(self) -> None:
		"""Export animation as GIF."""
		if not self.sheet or not self.animation:
			messagebox.showwarning("Warning", "Load sprite sheet and animation first")
			return

		path = filedialog.asksaveasfilename(
			title="Export GIF",
			defaultextension=".gif",
			filetypes=[("GIF files", "*.gif")]
		)

		if path:
			try:
				export_animation_gif(
					self.sheet, self.animation, self.palette, path, self.scale
				)
				messagebox.showinfo("Exported", f"Saved to {path}")
			except Exception as e:
				messagebox.showerror("Error", str(e))

	def _export_sheet(self) -> None:
		"""Export sprite sheet."""
		if not self.sheet:
			messagebox.showwarning("Warning", "Load sprite sheet first")
			return

		path = filedialog.asksaveasfilename(
			title="Export Sprite Sheet",
			defaultextension=".png",
			filetypes=[("PNG files", "*.png")]
		)

		if path:
			try:
				export_sprite_sheet(self.sheet, self.palette, path, 16, self.scale)
				messagebox.showinfo("Exported", f"Saved to {path}")
			except Exception as e:
				messagebox.showerror("Error", str(e))

	def _toggle_play(self) -> None:
		"""Toggle animation playback."""
		self.playing = not self.playing
		self.play_btn.config(text="⏸ Pause" if self.playing else "▶ Play")
		if self.playing:
			self._animate()

	def _animate(self) -> None:
		"""Animation loop."""
		if not self.playing or not self.animation:
			return

		self._next_frame()

		# Get frame duration
		if self.animation.frames:
			frame = self.animation.frames[self.current_frame]
			delay = int(frame.duration * (1000 / 60))
		else:
			delay = 100

		self.master.after(max(20, delay), self._animate)

	def _prev_frame(self) -> None:
		"""Go to previous frame."""
		if self.animation and self.animation.frames:
			self.current_frame = (self.current_frame - 1) % len(self.animation.frames)
			self._update_display()

	def _next_frame(self) -> None:
		"""Go to next frame."""
		if self.animation and self.animation.frames:
			self.current_frame = (self.current_frame + 1) % len(self.animation.frames)
			self._update_display()

	def _update_scale(self) -> None:
		"""Update display scale."""
		self.scale = self.scale_var.get()
		self._update_display()

	def _update_display(self) -> None:
		"""Update canvas display."""
		if not HAS_PIL:
			return

		self.canvas.delete('all')

		if self.sheet and self.animation and self.animation.frames:
			frame = self.animation.frames[self.current_frame]
			img = render_animation_frame(self.sheet, frame, self.palette, self.scale)

			# Convert for Tk
			self._photo = self._pil_to_tk(img)

			# Center on canvas
			cx = self.canvas.winfo_width() // 2
			cy = self.canvas.winfo_height() // 2
			self.canvas.create_image(cx, cy, image=self._photo)

			# Update label
			total = len(self.animation.frames)
			self.frame_label.config(text=f"Frame: {self.current_frame + 1} / {total}")

	def _pil_to_tk(self, img: 'Image.Image') -> 'tk.PhotoImage':
		"""Convert PIL image to Tk PhotoImage."""
		from PIL import ImageTk
		return ImageTk.PhotoImage(img)

	def _update_tile_list(self) -> None:
		"""Update tile listbox."""
		self.tile_list.delete(0, tk.END)
		if self.sheet:
			for i in range(len(self.sheet.tiles)):
				self.tile_list.insert(tk.END, f"Tile ${i:02X}")

	def _on_tile_select(self, event) -> None:
		"""Handle tile selection."""
		selection = self.tile_list.curselection()
		if selection and self.sheet:
			idx = selection[0]
			# Could preview single tile here


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description="Create and preview sprite animations",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
  %(prog)s gui                                    # Launch GUI
  %(prog)s export game.nes -o anim.gif -a walk.json
  %(prog)s sheet game.nes -o sprites.png --offset 0x8010
  %(prog)s info game.nes --offset 0x8010 --count 64
		"""
	)

	subparsers = parser.add_subparsers(dest="command", help="Command to execute")

	# GUI command
	gui_parser = subparsers.add_parser("gui", help="Launch GUI")

	# Export command
	export_parser = subparsers.add_parser("export", help="Export animation")
	export_parser.add_argument("rom", help="ROM file")
	export_parser.add_argument("-o", "--output", required=True, help="Output GIF")
	export_parser.add_argument("-a", "--animation", required=True, help="Animation JSON")
	export_parser.add_argument("--offset", type=lambda x: int(x, 16), default=0)
	export_parser.add_argument("--scale", type=int, default=4)
	export_parser.add_argument("-f", "--format", choices=["nes", "snes", "gb"], default="nes")

	# Sheet command
	sheet_parser = subparsers.add_parser("sheet", help="Export sprite sheet")
	sheet_parser.add_argument("rom", help="ROM file")
	sheet_parser.add_argument("-o", "--output", required=True, help="Output PNG")
	sheet_parser.add_argument("--offset", type=lambda x: int(x, 16), default=0)
	sheet_parser.add_argument("--count", type=int, default=-1)
	sheet_parser.add_argument("--scale", type=int, default=2)
	sheet_parser.add_argument("-f", "--format", choices=["nes", "snes", "gb"], default="nes")
	sheet_parser.add_argument("--tiles-per-row", type=int, default=16)

	# Info command
	info_parser = subparsers.add_parser("info", help="Show sprite info")
	info_parser.add_argument("rom", help="ROM file")
	info_parser.add_argument("--offset", type=lambda x: int(x, 16), default=0)
	info_parser.add_argument("--count", type=int, default=64)
	info_parser.add_argument("-f", "--format", choices=["nes", "snes", "gb"], default="nes")

	args = parser.parse_args()

	if not args.command or args.command == "gui":
		if not HAS_TK:
			print("Error: tkinter not available for GUI")
			return 1
		if not HAS_PIL:
			print("Warning: PIL not available, image features disabled")

		root = tk.Tk()
		app = SpriteAnimatorGUI(root)
		root.mainloop()
		return 0

	# Determine format
	format_map = {
		"nes": SpriteFormat.NES_8X8,
		"snes": SpriteFormat.SNES_4BPP,
		"gb": SpriteFormat.GB_2BPP
	}

	try:
		if args.command == "export":
			if not HAS_PIL:
				print("Error: PIL required for export")
				return 1

			format_type = format_map.get(args.format, SpriteFormat.NES_8X8)
			sheet = load_sprite_sheet(args.rom, format_type, args.offset)
			animation, pal_indices = load_animation_json(args.animation)
			palette = create_default_palette(pal_indices)

			export_animation_gif(sheet, animation, palette, args.output, args.scale)
			print(f"Exported: {args.output}")

		elif args.command == "sheet":
			if not HAS_PIL:
				print("Error: PIL required for export")
				return 1

			format_type = format_map.get(args.format, SpriteFormat.NES_8X8)
			sheet = load_sprite_sheet(args.rom, format_type, args.offset, args.count)
			palette = create_default_palette()

			export_sprite_sheet(
				sheet, palette, args.output,
				args.tiles_per_row, args.scale
			)
			print(f"Exported {len(sheet.tiles)} tiles to: {args.output}")

		elif args.command == "info":
			format_type = format_map.get(args.format, SpriteFormat.NES_8X8)
			sheet = load_sprite_sheet(args.rom, format_type, args.offset, args.count)

			print(f"Sprite sheet info:")
			print(f"  Format: {format_type.value}")
			print(f"  Tiles: {len(sheet.tiles)}")
			print(f"  Tile size: {sheet.tile_width}x{sheet.tile_height}")
			print(f"  Offset: ${args.offset:06X}")

	except FileNotFoundError as e:
		print(f"Error: File not found: {e.filename}")
		return 1
	except Exception as e:
		print(f"Error: {e}")
		return 1

	return 0


if __name__ == "__main__":
	sys.exit(main())
