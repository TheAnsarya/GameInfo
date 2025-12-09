#!/usr/bin/env python3
"""
Font Editor - Edit bitmap fonts from retro games.

Supports:
- NES 1bpp and 2bpp fonts
- SNES 2bpp and 4bpp fonts
- Variable-width fonts
- Font metrics editing

Author: ROM Hacking Toolkit
"""

import argparse
import json
import os
import struct
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Any

try:
	import tkinter as tk
	from tkinter import ttk, filedialog, messagebox
	HAS_TK = True
except ImportError:
	HAS_TK = False

try:
	from PIL import Image
	HAS_PIL = True
except ImportError:
	HAS_PIL = False


@dataclass
class Glyph:
	"""Represents a single character glyph."""
	char_code: int
	width: int
	height: int
	pixels: List[List[int]] = field(default_factory=list)  # 2D array of color indices
	advance: int = 0  # Horizontal advance (for VWF)
	offset_x: int = 0  # Horizontal offset
	offset_y: int = 0  # Vertical offset

	def __post_init__(self):
		if not self.pixels:
			self.pixels = [[0] * self.width for _ in range(self.height)]
		if self.advance == 0:
			self.advance = self.width

	def get_pixel(self, x: int, y: int) -> int:
		"""Get pixel at position."""
		if 0 <= x < self.width and 0 <= y < self.height:
			return self.pixels[y][x]
		return 0

	def set_pixel(self, x: int, y: int, color: int) -> None:
		"""Set pixel at position."""
		if 0 <= x < self.width and 0 <= y < self.height:
			self.pixels[y][x] = color

	def clear(self) -> None:
		"""Clear glyph."""
		self.pixels = [[0] * self.width for _ in range(self.height)]

	def to_1bpp(self) -> bytes:
		"""Convert to 1bpp format (NES style)."""
		output = bytearray()

		for y in range(self.height):
			byte = 0
			for x in range(min(8, self.width)):
				if self.pixels[y][x]:
					byte |= (0x80 >> x)
			output.append(byte)

		return bytes(output)

	def to_2bpp_nes(self) -> bytes:
		"""Convert to 2bpp NES format (planar)."""
		output = bytearray()

		# Plane 0
		for y in range(self.height):
			byte = 0
			for x in range(min(8, self.width)):
				if self.pixels[y][x] & 1:
					byte |= (0x80 >> x)
			output.append(byte)

		# Plane 1
		for y in range(self.height):
			byte = 0
			for x in range(min(8, self.width)):
				if self.pixels[y][x] & 2:
					byte |= (0x80 >> x)
			output.append(byte)

		return bytes(output)

	def to_2bpp_snes(self) -> bytes:
		"""Convert to 2bpp SNES format (interleaved)."""
		output = bytearray()

		for y in range(self.height):
			# Plane 0
			byte0 = 0
			for x in range(min(8, self.width)):
				if self.pixels[y][x] & 1:
					byte0 |= (0x80 >> x)

			# Plane 1
			byte1 = 0
			for x in range(min(8, self.width)):
				if self.pixels[y][x] & 2:
					byte1 |= (0x80 >> x)

			output.append(byte0)
			output.append(byte1)

		return bytes(output)

	@classmethod
	def from_1bpp(cls, data: bytes, char_code: int, width: int = 8, height: int = 8) -> 'Glyph':
		"""Create from 1bpp data."""
		glyph = cls(char_code=char_code, width=width, height=height)

		for y in range(min(height, len(data))):
			byte = data[y]
			for x in range(min(8, width)):
				if byte & (0x80 >> x):
					glyph.pixels[y][x] = 1

		return glyph

	@classmethod
	def from_2bpp_nes(cls, data: bytes, char_code: int, width: int = 8, height: int = 8) -> 'Glyph':
		"""Create from 2bpp NES data."""
		glyph = cls(char_code=char_code, width=width, height=height)

		for y in range(min(height, len(data) // 2)):
			byte0 = data[y]
			byte1 = data[y + height] if y + height < len(data) else 0

			for x in range(min(8, width)):
				bit0 = (byte0 >> (7 - x)) & 1
				bit1 = (byte1 >> (7 - x)) & 1
				glyph.pixels[y][x] = bit0 | (bit1 << 1)

		return glyph

	@classmethod
	def from_2bpp_snes(cls, data: bytes, char_code: int, width: int = 8, height: int = 8) -> 'Glyph':
		"""Create from 2bpp SNES data."""
		glyph = cls(char_code=char_code, width=width, height=height)

		for y in range(min(height, len(data) // 2)):
			byte0 = data[y * 2]
			byte1 = data[y * 2 + 1] if y * 2 + 1 < len(data) else 0

			for x in range(min(8, width)):
				bit0 = (byte0 >> (7 - x)) & 1
				bit1 = (byte1 >> (7 - x)) & 1
				glyph.pixels[y][x] = bit0 | (bit1 << 1)

		return glyph


@dataclass
class BitmapFont:
	"""Collection of glyphs forming a font."""
	name: str
	glyph_width: int
	glyph_height: int
	glyphs: Dict[int, Glyph] = field(default_factory=dict)
	first_char: int = 0
	encoding: str = "ascii"
	bpp: int = 1  # Bits per pixel
	variable_width: bool = False
	widths: Dict[int, int] = field(default_factory=dict)

	def get_glyph(self, char_code: int) -> Optional[Glyph]:
		"""Get glyph by character code."""
		return self.glyphs.get(char_code)

	def set_glyph(self, char_code: int, glyph: Glyph) -> None:
		"""Set glyph for character code."""
		self.glyphs[char_code] = glyph

	def add_empty_glyph(self, char_code: int) -> Glyph:
		"""Add empty glyph for character code."""
		glyph = Glyph(char_code, self.glyph_width, self.glyph_height)
		self.glyphs[char_code] = glyph
		return glyph

	def render_text(self, text: str) -> List[List[int]]:
		"""Render text to pixel array."""
		if not text:
			return [[]]

		# Calculate total width
		total_width = 0
		for char in text:
			code = ord(char)
			if self.variable_width:
				total_width += self.widths.get(code, self.glyph_width)
			else:
				total_width += self.glyph_width

		# Create output array
		output = [[0] * total_width for _ in range(self.glyph_height)]

		# Render each character
		x_pos = 0
		for char in text:
			code = ord(char)
			glyph = self.get_glyph(code)

			if glyph:
				for y in range(self.glyph_height):
					for x in range(glyph.width):
						if x_pos + x < total_width:
							output[y][x_pos + x] = glyph.pixels[y][x]

			if self.variable_width:
				x_pos += self.widths.get(code, self.glyph_width)
			else:
				x_pos += self.glyph_width

		return output

	@classmethod
	def from_rom_data(cls, data: bytes, format_type: str = "1bpp",
					glyph_width: int = 8, glyph_height: int = 8,
					num_glyphs: int = 256, first_char: int = 0) -> 'BitmapFont':
		"""Create font from ROM data."""
		font = cls(
			name="ROM Font",
			glyph_width=glyph_width,
			glyph_height=glyph_height,
			first_char=first_char
		)

		if format_type == "1bpp":
			font.bpp = 1
			bytes_per_glyph = glyph_height
		elif format_type == "2bpp_nes":
			font.bpp = 2
			bytes_per_glyph = glyph_height * 2
		elif format_type == "2bpp_snes":
			font.bpp = 2
			bytes_per_glyph = glyph_height * 2
		else:
			bytes_per_glyph = glyph_height

		for i in range(num_glyphs):
			offset = i * bytes_per_glyph
			if offset + bytes_per_glyph > len(data):
				break

			glyph_data = data[offset:offset + bytes_per_glyph]
			char_code = first_char + i

			if format_type == "1bpp":
				glyph = Glyph.from_1bpp(glyph_data, char_code, glyph_width, glyph_height)
			elif format_type == "2bpp_nes":
				glyph = Glyph.from_2bpp_nes(glyph_data, char_code, glyph_width, glyph_height)
			elif format_type == "2bpp_snes":
				glyph = Glyph.from_2bpp_snes(glyph_data, char_code, glyph_width, glyph_height)
			else:
				glyph = Glyph.from_1bpp(glyph_data, char_code, glyph_width, glyph_height)

			font.glyphs[char_code] = glyph

		return font

	def to_rom_data(self, format_type: str = "1bpp") -> bytes:
		"""Convert font to ROM data."""
		output = bytearray()

		for char_code in sorted(self.glyphs.keys()):
			glyph = self.glyphs[char_code]

			if format_type == "1bpp":
				output.extend(glyph.to_1bpp())
			elif format_type == "2bpp_nes":
				output.extend(glyph.to_2bpp_nes())
			elif format_type == "2bpp_snes":
				output.extend(glyph.to_2bpp_snes())

		return bytes(output)

	def to_json(self) -> Dict[str, Any]:
		"""Convert to JSON-serializable dict."""
		return {
			"name": self.name,
			"glyph_width": self.glyph_width,
			"glyph_height": self.glyph_height,
			"first_char": self.first_char,
			"encoding": self.encoding,
			"bpp": self.bpp,
			"variable_width": self.variable_width,
			"widths": {str(k): v for k, v in self.widths.items()},
			"glyphs": {
				str(code): {
					"width": g.width,
					"height": g.height,
					"advance": g.advance,
					"offset_x": g.offset_x,
					"offset_y": g.offset_y,
					"pixels": g.pixels
				}
				for code, g in self.glyphs.items()
			}
		}

	@classmethod
	def from_json(cls, data: Dict[str, Any]) -> 'BitmapFont':
		"""Create from JSON data."""
		font = cls(
			name=data.get("name", "Font"),
			glyph_width=data["glyph_width"],
			glyph_height=data["glyph_height"],
			first_char=data.get("first_char", 0),
			encoding=data.get("encoding", "ascii"),
			bpp=data.get("bpp", 1),
			variable_width=data.get("variable_width", False),
			widths={int(k): v for k, v in data.get("widths", {}).items()}
		)

		for code_str, glyph_data in data.get("glyphs", {}).items():
			code = int(code_str)
			glyph = Glyph(
				char_code=code,
				width=glyph_data.get("width", font.glyph_width),
				height=glyph_data.get("height", font.glyph_height),
				pixels=glyph_data.get("pixels", []),
				advance=glyph_data.get("advance", 0),
				offset_x=glyph_data.get("offset_x", 0),
				offset_y=glyph_data.get("offset_y", 0)
			)
			font.glyphs[code] = glyph

		return font


class FontRenderer:
	"""Render fonts as text or images."""

	def __init__(self, font: BitmapFont):
		"""Initialize renderer."""
		self.font = font

	def render_glyph_ascii(self, glyph: Glyph, chars: str = " ░▒█") -> str:
		"""Render single glyph as ASCII art."""
		lines = []

		for y in range(glyph.height):
			row = ""
			for x in range(glyph.width):
				pixel = glyph.pixels[y][x]
				if pixel < len(chars):
					row += chars[pixel]
				else:
					row += chars[-1]
			lines.append(row)

		return "\n".join(lines)

	def render_charset_ascii(self, chars_per_row: int = 16) -> str:
		"""Render entire charset as ASCII art."""
		lines = []

		sorted_codes = sorted(self.font.glyphs.keys())

		for row_start in range(0, len(sorted_codes), chars_per_row):
			row_codes = sorted_codes[row_start:row_start + chars_per_row]

			# Render each row of pixels
			for y in range(self.font.glyph_height):
				row_text = ""
				for code in row_codes:
					glyph = self.font.glyphs[code]
					for x in range(glyph.width):
						pixel = glyph.pixels[y][x]
						row_text += "█" if pixel else " "
					row_text += " "  # Gap between glyphs
				lines.append(row_text)

			# Character codes row
			code_line = ""
			for code in row_codes:
				code_line += f"{code:02X}".center(self.font.glyph_width + 1)
			lines.append(code_line)
			lines.append("")

		return "\n".join(lines)

	def to_png(self, output_path: str, chars_per_row: int = 16,
			scale: int = 2, colors: List[Tuple[int, int, int]] = None) -> None:
		"""Export charset as PNG image."""
		if not HAS_PIL:
			raise ImportError("PIL/Pillow required for PNG export")

		if colors is None:
			colors = [
				(0, 0, 0),       # Transparent/black
				(85, 85, 85),    # Dark gray
				(170, 170, 170), # Light gray
				(255, 255, 255)  # White
			]

		sorted_codes = sorted(self.font.glyphs.keys())
		num_rows = (len(sorted_codes) + chars_per_row - 1) // chars_per_row

		img_width = chars_per_row * (self.font.glyph_width + 1) - 1
		img_height = num_rows * (self.font.glyph_height + 1) - 1

		img = Image.new('RGB', (img_width * scale, img_height * scale), colors[0])

		for idx, code in enumerate(sorted_codes):
			glyph = self.font.glyphs[code]
			col = idx % chars_per_row
			row = idx // chars_per_row

			base_x = col * (self.font.glyph_width + 1)
			base_y = row * (self.font.glyph_height + 1)

			for y in range(glyph.height):
				for x in range(glyph.width):
					pixel = glyph.pixels[y][x]
					color = colors[pixel % len(colors)]

					for sy in range(scale):
						for sx in range(scale):
							px = (base_x + x) * scale + sx
							py = (base_y + y) * scale + sy
							img.putpixel((px, py), color)

		img.save(output_path)


if HAS_TK:
	class FontEditorGUI:
		"""GUI font editor."""

		def __init__(self, font: Optional[BitmapFont] = None):
			"""Initialize GUI."""
			self.font = font or BitmapFont("New Font", 8, 8)
			self.current_glyph = None
			self.current_color = 1
			self.zoom = 16
			self.grid_visible = True

			self.root = tk.Tk()
			self.root.title("Font Editor")
			self._create_widgets()
			self._select_glyph(0)

		def _create_widgets(self):
			"""Create GUI widgets."""
			# Main frame
			main_frame = ttk.Frame(self.root)
			main_frame.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)

			# Toolbar
			toolbar = ttk.Frame(main_frame)
			toolbar.pack(fill=tk.X)

			ttk.Button(toolbar, text="New", command=self._new_font).pack(side=tk.LEFT)
			ttk.Button(toolbar, text="Open", command=self._open_file).pack(side=tk.LEFT)
			ttk.Button(toolbar, text="Save", command=self._save_file).pack(side=tk.LEFT)
			ttk.Button(toolbar, text="Export PNG", command=self._export_png).pack(side=tk.LEFT)

			ttk.Separator(toolbar, orient=tk.VERTICAL).pack(side=tk.LEFT, fill=tk.Y, padx=5)

			ttk.Label(toolbar, text="Color:").pack(side=tk.LEFT)
			self.color_var = tk.StringVar(value="1")
			color_combo = ttk.Combobox(toolbar, textvariable=self.color_var,
				values=["0", "1", "2", "3"], width=3, state="readonly")
			color_combo.pack(side=tk.LEFT)
			color_combo.bind("<<ComboboxSelected>>", self._update_color)

			# Grid toggle
			self.grid_var = tk.BooleanVar(value=True)
			ttk.Checkbutton(toolbar, text="Grid", variable=self.grid_var,
				command=self._toggle_grid).pack(side=tk.LEFT, padx=(10, 0))

			# Content frame
			content = ttk.Frame(main_frame)
			content.pack(fill=tk.BOTH, expand=True, pady=5)

			# Glyph list
			list_frame = ttk.LabelFrame(content, text="Glyphs")
			list_frame.pack(side=tk.LEFT, fill=tk.Y)

			list_scroll = ttk.Scrollbar(list_frame)
			list_scroll.pack(side=tk.RIGHT, fill=tk.Y)

			self.glyph_list = tk.Listbox(list_frame, width=8, height=20,
				yscrollcommand=list_scroll.set)
			self.glyph_list.pack(side=tk.LEFT, fill=tk.Y)
			list_scroll.config(command=self.glyph_list.yview)

			self.glyph_list.bind("<<ListboxSelect>>", self._on_glyph_select)
			self._populate_glyph_list()

			# Editor canvas
			editor_frame = ttk.LabelFrame(content, text="Editor")
			editor_frame.pack(side=tk.LEFT, fill=tk.BOTH, expand=True, padx=5)

			self.canvas = tk.Canvas(
				editor_frame,
				width=self.font.glyph_width * self.zoom,
				height=self.font.glyph_height * self.zoom,
				bg="black"
			)
			self.canvas.pack(padx=5, pady=5)

			self.canvas.bind("<Button-1>", self._on_click)
			self.canvas.bind("<B1-Motion>", self._on_drag)
			self.canvas.bind("<Button-3>", self._on_right_click)

			# Glyph info
			info_frame = ttk.Frame(editor_frame)
			info_frame.pack(fill=tk.X, padx=5)

			ttk.Label(info_frame, text="Char:").grid(row=0, column=0)
			self.char_label = ttk.Label(info_frame, text="--")
			self.char_label.grid(row=0, column=1)

			ttk.Label(info_frame, text="Code:").grid(row=0, column=2, padx=(10, 0))
			self.code_label = ttk.Label(info_frame, text="--")
			self.code_label.grid(row=0, column=3)

			# VWF width
			ttk.Label(info_frame, text="Width:").grid(row=1, column=0)
			self.width_var = tk.StringVar(value="8")
			width_spin = ttk.Spinbox(info_frame, textvariable=self.width_var,
				from_=1, to=16, width=4)
			width_spin.grid(row=1, column=1)
			width_spin.bind("<Return>", self._update_width)

			# Preview
			preview_frame = ttk.LabelFrame(content, text="Preview")
			preview_frame.pack(side=tk.LEFT, fill=tk.Y, padx=(0, 5))

			self.preview_canvas = tk.Canvas(preview_frame, width=200, height=100, bg="black")
			self.preview_canvas.pack(padx=5, pady=5)

			ttk.Label(preview_frame, text="Text:").pack()
			self.preview_text = tk.StringVar(value="Hello")
			preview_entry = ttk.Entry(preview_frame, textvariable=self.preview_text)
			preview_entry.pack(padx=5, pady=5)
			preview_entry.bind("<Return>", self._update_preview)

			# Status bar
			self.status_var = tk.StringVar(value="Ready")
			status_bar = ttk.Label(main_frame, textvariable=self.status_var, relief=tk.SUNKEN)
			status_bar.pack(fill=tk.X)

		def _populate_glyph_list(self):
			"""Populate glyph list."""
			self.glyph_list.delete(0, tk.END)

			for i in range(256):
				char = chr(i) if 32 <= i < 127 else " "
				self.glyph_list.insert(tk.END, f"{i:02X} {char}")

		def _select_glyph(self, code: int):
			"""Select glyph by code."""
			self.current_glyph = self.font.get_glyph(code)
			if not self.current_glyph:
				self.current_glyph = self.font.add_empty_glyph(code)

			# Update labels
			char = chr(code) if 32 <= code < 127 else " "
			self.char_label.config(text=char)
			self.code_label.config(text=f"0x{code:02X}")
			self.width_var.set(str(self.current_glyph.advance or self.font.glyph_width))

			self._render_glyph()
			self._update_preview()

		def _render_glyph(self):
			"""Render current glyph to canvas."""
			self.canvas.delete("all")

			if not self.current_glyph:
				return

			colors = ["#000000", "#555555", "#AAAAAA", "#FFFFFF"]

			for y in range(self.current_glyph.height):
				for x in range(self.current_glyph.width):
					pixel = self.current_glyph.pixels[y][x]
					color = colors[pixel % len(colors)]

					x1 = x * self.zoom
					y1 = y * self.zoom
					x2 = x1 + self.zoom
					y2 = y1 + self.zoom

					self.canvas.create_rectangle(x1, y1, x2, y2, fill=color, outline="")

			# Draw grid
			if self.grid_visible:
				for x in range(self.current_glyph.width + 1):
					self.canvas.create_line(x * self.zoom, 0, x * self.zoom,
						self.current_glyph.height * self.zoom, fill="#333333")

				for y in range(self.current_glyph.height + 1):
					self.canvas.create_line(0, y * self.zoom,
						self.current_glyph.width * self.zoom, y * self.zoom, fill="#333333")

		def _update_preview(self, event=None):
			"""Update text preview."""
			self.preview_canvas.delete("all")

			text = self.preview_text.get()
			if not text:
				return

			pixels = self.font.render_text(text)
			if not pixels or not pixels[0]:
				return

			colors = ["#000000", "#555555", "#AAAAAA", "#FFFFFF"]
			scale = 2

			for y, row in enumerate(pixels):
				for x, pixel in enumerate(row):
					if x * scale < 200 and y * scale < 100:
						color = colors[pixel % len(colors)]
						self.preview_canvas.create_rectangle(
							x * scale, y * scale,
							(x + 1) * scale, (y + 1) * scale,
							fill=color, outline=""
						)

		def _on_glyph_select(self, event):
			"""Handle glyph list selection."""
			selection = self.glyph_list.curselection()
			if selection:
				self._select_glyph(selection[0])

		def _on_click(self, event):
			"""Handle canvas click."""
			self._draw_pixel(event)

		def _on_drag(self, event):
			"""Handle canvas drag."""
			self._draw_pixel(event)

		def _on_right_click(self, event):
			"""Handle right click (erase)."""
			self._draw_pixel(event, erase=True)

		def _draw_pixel(self, event, erase: bool = False):
			"""Draw pixel at event position."""
			if not self.current_glyph:
				return

			x = event.x // self.zoom
			y = event.y // self.zoom

			if 0 <= x < self.current_glyph.width and 0 <= y < self.current_glyph.height:
				color = 0 if erase else self.current_color
				self.current_glyph.pixels[y][x] = color
				self._render_glyph()
				self._update_preview()

		def _update_color(self, event=None):
			"""Update current color."""
			self.current_color = int(self.color_var.get())

		def _update_width(self, event=None):
			"""Update glyph width."""
			if self.current_glyph:
				try:
					width = int(self.width_var.get())
					self.current_glyph.advance = width
					self.font.widths[self.current_glyph.char_code] = width
					self._update_preview()
				except ValueError:
					pass

		def _toggle_grid(self):
			"""Toggle grid visibility."""
			self.grid_visible = self.grid_var.get()
			self._render_glyph()

		def _new_font(self):
			"""Create new font."""
			self.font = BitmapFont("New Font", 8, 8)
			self._populate_glyph_list()
			self._select_glyph(0)

		def _open_file(self):
			"""Open font file."""
			filetypes = [
				("JSON files", "*.json"),
				("Binary files", "*.bin *.fnt"),
				("All files", "*.*")
			]

			path = filedialog.askopenfilename(filetypes=filetypes)
			if not path:
				return

			try:
				if path.endswith('.json'):
					with open(path, 'r') as f:
						data = json.load(f)
					self.font = BitmapFont.from_json(data)
				else:
					with open(path, 'rb') as f:
						data = f.read()
					self.font = BitmapFont.from_rom_data(data)

				self._populate_glyph_list()
				self._select_glyph(0)
				self.status_var.set(f"Loaded: {path}")

			except Exception as e:
				messagebox.showerror("Error", f"Failed to load: {e}")

		def _save_file(self):
			"""Save font file."""
			filetypes = [
				("JSON files", "*.json"),
				("Binary files", "*.bin"),
				("All files", "*.*")
			]

			path = filedialog.asksaveasfilename(filetypes=filetypes, defaultextension=".json")
			if not path:
				return

			try:
				if path.endswith('.json'):
					with open(path, 'w') as f:
						json.dump(self.font.to_json(), f, indent='\t')
				else:
					with open(path, 'wb') as f:
						f.write(self.font.to_rom_data())

				self.status_var.set(f"Saved: {path}")

			except Exception as e:
				messagebox.showerror("Error", f"Failed to save: {e}")

		def _export_png(self):
			"""Export as PNG."""
			if not HAS_PIL:
				messagebox.showerror("Error", "PIL/Pillow required for PNG export")
				return

			path = filedialog.asksaveasfilename(
				filetypes=[("PNG files", "*.png")],
				defaultextension=".png"
			)
			if not path:
				return

			try:
				renderer = FontRenderer(self.font)
				renderer.to_png(path, scale=4)
				self.status_var.set(f"Exported: {path}")
			except Exception as e:
				messagebox.showerror("Error", f"Failed to export: {e}")

		def run(self):
			"""Run the application."""
			self.root.mainloop()


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description="Edit bitmap fonts from retro games",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
  %(prog)s edit                           # Launch GUI editor
  %(prog)s view font.bin                  # View font
  %(prog)s export font.bin -o font.png    # Export as PNG
  %(prog)s convert font.bin -o font.json  # Convert to JSON
		"""
	)

	subparsers = parser.add_subparsers(dest="command", help="Command to execute")

	# Edit command
	edit_parser = subparsers.add_parser("edit", help="Launch GUI editor")
	edit_parser.add_argument("file", nargs="?", help="File to open")

	# View command
	view_parser = subparsers.add_parser("view", help="View font")
	view_parser.add_argument("file", help="Font file")
	view_parser.add_argument("-f", "--format", choices=["1bpp", "2bpp_nes", "2bpp_snes"],
		default="1bpp")
	view_parser.add_argument("-w", "--width", type=int, default=8)
	view_parser.add_argument("--height", type=int, default=8)

	# Export command
	export_parser = subparsers.add_parser("export", help="Export as PNG")
	export_parser.add_argument("file", help="Font file")
	export_parser.add_argument("-o", "--output", required=True, help="Output PNG")
	export_parser.add_argument("-f", "--format", choices=["1bpp", "2bpp_nes", "2bpp_snes"],
		default="1bpp")
	export_parser.add_argument("-s", "--scale", type=int, default=4)

	# Convert command
	convert_parser = subparsers.add_parser("convert", help="Convert format")
	convert_parser.add_argument("input", help="Input file")
	convert_parser.add_argument("-o", "--output", required=True, help="Output file")
	convert_parser.add_argument("-f", "--format", choices=["1bpp", "2bpp_nes", "2bpp_snes"])

	args = parser.parse_args()

	if not args.command:
		if HAS_TK:
			app = FontEditorGUI()
			app.run()
		else:
			parser.print_help()
		return 0

	try:
		if args.command == "edit":
			if not HAS_TK:
				print("Error: GUI requires tkinter")
				return 1

			font = None
			if args.file:
				path = Path(args.file)
				if path.suffix == '.json':
					font = BitmapFont.from_json(json.loads(path.read_text()))
				else:
					font = BitmapFont.from_rom_data(path.read_bytes())

			app = FontEditorGUI(font)
			app.run()

		elif args.command == "view":
			path = Path(args.file)

			if path.suffix == '.json':
				font = BitmapFont.from_json(json.loads(path.read_text()))
			else:
				font = BitmapFont.from_rom_data(
					path.read_bytes(),
					format_type=args.format,
					glyph_width=args.width,
					glyph_height=args.height
				)

			renderer = FontRenderer(font)
			print(f"Font: {len(font.glyphs)} glyphs, {font.glyph_width}x{font.glyph_height}")
			print()
			print(renderer.render_charset_ascii())

		elif args.command == "export":
			if not HAS_PIL:
				print("Error: PIL/Pillow required for PNG export")
				return 1

			path = Path(args.file)

			if path.suffix == '.json':
				font = BitmapFont.from_json(json.loads(path.read_text()))
			else:
				font = BitmapFont.from_rom_data(path.read_bytes(), format_type=args.format)

			renderer = FontRenderer(font)
			renderer.to_png(args.output, scale=args.scale)
			print(f"Exported: {args.output}")

		elif args.command == "convert":
			input_path = Path(args.input)
			output_path = Path(args.output)

			# Load
			if input_path.suffix == '.json':
				font = BitmapFont.from_json(json.loads(input_path.read_text()))
			else:
				fmt = args.format or "1bpp"
				font = BitmapFont.from_rom_data(input_path.read_bytes(), format_type=fmt)

			# Save
			if output_path.suffix == '.json':
				output_path.write_text(json.dumps(font.to_json(), indent='\t'))
			else:
				fmt = args.format or "1bpp"
				output_path.write_bytes(font.to_rom_data(fmt))

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
