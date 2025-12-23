#!/usr/bin/env python3
"""
Soul Blazer Palette Viewer/Editor

View and edit SNES palettes from Soul Blazer ROM.
Supports 15-bit BGR palette format used by SNES.
"""

import os
import sys
import struct
import tkinter as tk
from tkinter import ttk, filedialog, messagebox, colorchooser
from typing import List, Tuple, Optional
from pathlib import Path

try:
	from PIL import Image, ImageTk
	HAS_PIL = True
except ImportError:
	HAS_PIL = False


def snes_to_rgb(snes_color: int) -> Tuple[int, int, int]:
	"""
	Convert SNES 15-bit BGR to RGB tuple.
	
	SNES format: 0BBBBBGG GGGRRRRR
	- Bits 0-4: Red (0-31)
	- Bits 5-9: Green (0-31)
	- Bits 10-14: Blue (0-31)
	"""
	r = (snes_color & 0x001F) << 3
	g = ((snes_color & 0x03E0) >> 5) << 3
	b = ((snes_color & 0x7C00) >> 10) << 3
	# Fill lower bits for proper 8-bit range
	r |= r >> 5
	g |= g >> 5
	b |= b >> 5
	return (r, g, b)


def rgb_to_snes(r: int, g: int, b: int) -> int:
	"""
	Convert RGB to SNES 15-bit BGR.
	"""
	r5 = (r >> 3) & 0x1F
	g5 = (g >> 3) & 0x1F
	b5 = (b >> 3) & 0x1F
	return r5 | (g5 << 5) | (b5 << 10)


def rgb_to_hex(r: int, g: int, b: int) -> str:
	"""Convert RGB to hex string."""
	return f"#{r:02X}{g:02X}{b:02X}"


def hex_to_rgb(hex_color: str) -> Tuple[int, int, int]:
	"""Convert hex string to RGB tuple."""
	hex_color = hex_color.lstrip('#')
	return tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))


class Palette:
	"""Represents a 16-color SNES palette."""
	
	def __init__(self, name: str = "Untitled"):
		"""Initialize palette with default colors."""
		self.name = name
		self.colors: List[int] = [0] * 16  # SNES format colors
		self.address = 0
	
	@classmethod
	def from_bytes(cls, data: bytes, name: str = "Palette", address: int = 0) -> 'Palette':
		"""Create palette from raw bytes."""
		pal = cls(name)
		pal.address = address
		for i in range(min(16, len(data) // 2)):
			pal.colors[i] = struct.unpack('<H', data[i*2:i*2+2])[0]
		return pal
	
	def to_bytes(self) -> bytes:
		"""Convert palette to bytes."""
		return b''.join(struct.pack('<H', c) for c in self.colors)
	
	def get_rgb(self, index: int) -> Tuple[int, int, int]:
		"""Get RGB color at index."""
		return snes_to_rgb(self.colors[index])
	
	def set_rgb(self, index: int, r: int, g: int, b: int):
		"""Set RGB color at index."""
		self.colors[index] = rgb_to_snes(r, g, b)
	
	def get_hex(self, index: int) -> str:
		"""Get hex color at index."""
		return rgb_to_hex(*self.get_rgb(index))


class PaletteBank:
	"""Collection of palettes."""
	
	# Known Soul Blazer palette locations (ROM offsets)
	KNOWN_PALETTES = {
		"Player Sprites": 0x048000,
		"Enemy Bank 1": 0x058000,
		"Enemy Bank 2": 0x058200,
		"Grass Valley BG": 0x068000,
		"GreenWood BG": 0x068200,
		"St. Elle's BG": 0x068400,
		"Mountain BG": 0x068600,
		"Leo's Lab BG": 0x068800,
		"Magridd Castle BG": 0x068A00,
		"World of Evil BG": 0x068C00,
		"UI/Text": 0x078000,
		"Title Screen": 0x078200,
		"Ending": 0x078400,
		"Bosses": 0x088000,
	}
	
	def __init__(self):
		"""Initialize palette bank."""
		self.palettes: List[Palette] = []
		self.rom_data = None
	
	def load_rom(self, file_path: str) -> bool:
		"""Load ROM file."""
		try:
			with open(file_path, 'rb') as f:
				self.rom_data = f.read()
			self._extract_known_palettes()
			return True
		except Exception as e:
			print(f"Error loading ROM: {e}")
			return False
	
	def _extract_known_palettes(self):
		"""Extract known palettes from ROM."""
		self.palettes.clear()
		
		for name, offset in self.KNOWN_PALETTES.items():
			if offset + 32 <= len(self.rom_data):
				pal = Palette.from_bytes(
					self.rom_data[offset:offset+32],
					name,
					offset
				)
				self.palettes.append(pal)
	
	def scan_for_palettes(self, start: int = 0, end: int = None) -> List[Palette]:
		"""Scan ROM for potential palettes."""
		if not self.rom_data:
			return []
		
		if end is None:
			end = len(self.rom_data)
		
		found = []
		for offset in range(start, min(end, len(self.rom_data) - 32), 32):
			# Check if looks like a palette (color 0 often black/transparent)
			first_color = struct.unpack('<H', self.rom_data[offset:offset+2])[0]
			
			# Heuristic: first color is often black or near-black
			if first_color == 0 or (first_color & 0x7FFF) < 0x0400:
				# Check for reasonable color values
				valid = True
				for i in range(16):
					color = struct.unpack('<H', self.rom_data[offset+i*2:offset+i*2+2])[0]
					if color > 0x7FFF:  # Invalid SNES color
						valid = False
						break
				
				if valid:
					pal = Palette.from_bytes(
						self.rom_data[offset:offset+32],
						f"Found_{offset:06X}",
						offset
					)
					found.append(pal)
		
		return found
	
	def save_rom(self, file_path: str) -> bool:
		"""Save modified ROM."""
		if not self.rom_data:
			return False
		
		try:
			# Update ROM with modified palettes
			data = bytearray(self.rom_data)
			for pal in self.palettes:
				if pal.address and pal.address + 32 <= len(data):
					data[pal.address:pal.address+32] = pal.to_bytes()
			
			with open(file_path, 'wb') as f:
				f.write(data)
			return True
		except Exception as e:
			print(f"Error saving ROM: {e}")
			return False
	
	def export_pal(self, palette: Palette, file_path: str):
		"""Export palette to .pal file (JASC format)."""
		lines = [
			"JASC-PAL",
			"0100",
			"16"
		]
		for i in range(16):
			r, g, b = palette.get_rgb(i)
			lines.append(f"{r} {g} {b}")
		
		with open(file_path, 'w') as f:
			f.write('\n'.join(lines))
	
	def import_pal(self, file_path: str) -> Optional[Palette]:
		"""Import palette from .pal file."""
		try:
			with open(file_path, 'r') as f:
				lines = f.readlines()
			
			if lines[0].strip() != "JASC-PAL":
				return None
			
			pal = Palette(Path(file_path).stem)
			for i, line in enumerate(lines[3:19]):
				parts = line.strip().split()
				if len(parts) >= 3:
					r, g, b = int(parts[0]), int(parts[1]), int(parts[2])
					pal.set_rgb(i, r, g, b)
			
			return pal
		except Exception as e:
			print(f"Error importing palette: {e}")
			return None


class PaletteViewerGUI:
	"""GUI for viewing and editing palettes."""
	
	SWATCH_SIZE = 40
	SWATCHES_PER_ROW = 8
	
	def __init__(self):
		"""Initialize the GUI."""
		self.bank = PaletteBank()
		self.current_palette: Optional[Palette] = None
		self.selected_color = 0
		
		self.root = tk.Tk()
		self.root.title("Soul Blazer Palette Viewer")
		self.root.geometry("800x600")
		
		self._create_menu()
		self._create_widgets()
	
	def _create_menu(self):
		"""Create menu bar."""
		menubar = tk.Menu(self.root)
		self.root.config(menu=menubar)
		
		# File menu
		file_menu = tk.Menu(menubar, tearoff=0)
		menubar.add_cascade(label="File", menu=file_menu)
		file_menu.add_command(label="Open ROM...", command=self._open_rom)
		file_menu.add_command(label="Save ROM...", command=self._save_rom)
		file_menu.add_separator()
		file_menu.add_command(label="Import Palette...", command=self._import_palette)
		file_menu.add_command(label="Export Palette...", command=self._export_palette)
		file_menu.add_separator()
		file_menu.add_command(label="Export Image...", command=self._export_image)
		file_menu.add_separator()
		file_menu.add_command(label="Exit", command=self.root.quit)
		
		# Palette menu
		pal_menu = tk.Menu(menubar, tearoff=0)
		menubar.add_cascade(label="Palette", menu=pal_menu)
		pal_menu.add_command(label="Grayscale", command=self._make_grayscale)
		pal_menu.add_command(label="Invert", command=self._invert_colors)
		pal_menu.add_command(label="Brighten", command=self._brighten)
		pal_menu.add_command(label="Darken", command=self._darken)
		pal_menu.add_separator()
		pal_menu.add_command(label="Rotate Left", command=self._rotate_left)
		pal_menu.add_command(label="Rotate Right", command=self._rotate_right)
	
	def _create_widgets(self):
		"""Create main widgets."""
		# Left panel - palette list
		left_frame = ttk.Frame(self.root, width=200)
		left_frame.pack(side='left', fill='y', padx=5, pady=5)
		
		ttk.Label(left_frame, text="Palettes:").pack()
		
		self.palette_list = tk.Listbox(left_frame, width=30)
		self.palette_list.pack(fill='both', expand=True)
		self.palette_list.bind('<<ListboxSelect>>', self._on_palette_select)
		
		# Scan button
		ttk.Button(left_frame, text="Scan ROM", command=self._scan_rom).pack(pady=5)
		
		# Right panel - palette view and editor
		right_frame = ttk.Frame(self.root)
		right_frame.pack(side='right', fill='both', expand=True, padx=5, pady=5)
		
		# Palette name
		name_frame = ttk.Frame(right_frame)
		name_frame.pack(fill='x')
		
		ttk.Label(name_frame, text="Name:").pack(side='left')
		self.name_var = tk.StringVar()
		ttk.Entry(name_frame, textvariable=self.name_var, width=30).pack(side='left', padx=5)
		
		ttk.Label(name_frame, text="Address:").pack(side='left', padx=(20,0))
		self.addr_var = tk.StringVar()
		ttk.Entry(name_frame, textvariable=self.addr_var, width=12, state='readonly').pack(side='left', padx=5)
		
		# Palette swatches
		swatch_frame = ttk.LabelFrame(right_frame, text="Colors")
		swatch_frame.pack(fill='x', pady=10)
		
		self.swatch_canvas = tk.Canvas(swatch_frame, width=self.SWATCH_SIZE * self.SWATCHES_PER_ROW + 10,
									   height=self.SWATCH_SIZE * 2 + 10)
		self.swatch_canvas.pack(padx=5, pady=5)
		self.swatch_canvas.bind('<Button-1>', self._on_swatch_click)
		self.swatch_canvas.bind('<Double-Button-1>', self._on_swatch_double_click)
		
		# Color info
		info_frame = ttk.LabelFrame(right_frame, text="Selected Color")
		info_frame.pack(fill='x')
		
		# Color preview
		preview_frame = ttk.Frame(info_frame)
		preview_frame.pack(fill='x', padx=5, pady=5)
		
		self.preview_canvas = tk.Canvas(preview_frame, width=80, height=80)
		self.preview_canvas.pack(side='left')
		
		# Color values
		values_frame = ttk.Frame(preview_frame)
		values_frame.pack(side='left', padx=20)
		
		ttk.Label(values_frame, text="Index:").grid(row=0, column=0, sticky='w')
		self.index_var = tk.StringVar()
		ttk.Label(values_frame, textvariable=self.index_var).grid(row=0, column=1, sticky='w', padx=5)
		
		ttk.Label(values_frame, text="SNES:").grid(row=1, column=0, sticky='w')
		self.snes_var = tk.StringVar()
		ttk.Entry(values_frame, textvariable=self.snes_var, width=10).grid(row=1, column=1, sticky='w', padx=5)
		
		ttk.Label(values_frame, text="RGB:").grid(row=2, column=0, sticky='w')
		self.rgb_var = tk.StringVar()
		ttk.Label(values_frame, textvariable=self.rgb_var).grid(row=2, column=1, sticky='w', padx=5)
		
		ttk.Label(values_frame, text="Hex:").grid(row=3, column=0, sticky='w')
		self.hex_var = tk.StringVar()
		ttk.Entry(values_frame, textvariable=self.hex_var, width=10).grid(row=3, column=1, sticky='w', padx=5)
		
		# RGB sliders
		slider_frame = ttk.Frame(info_frame)
		slider_frame.pack(fill='x', padx=5, pady=5)
		
		ttk.Label(slider_frame, text="R:").grid(row=0, column=0)
		self.r_var = tk.IntVar()
		self.r_slider = ttk.Scale(slider_frame, from_=0, to=248, variable=self.r_var,
								  command=lambda _: self._on_slider_change())
		self.r_slider.grid(row=0, column=1, sticky='ew')
		self.r_label = ttk.Label(slider_frame, width=4)
		self.r_label.grid(row=0, column=2)
		
		ttk.Label(slider_frame, text="G:").grid(row=1, column=0)
		self.g_var = tk.IntVar()
		self.g_slider = ttk.Scale(slider_frame, from_=0, to=248, variable=self.g_var,
								  command=lambda _: self._on_slider_change())
		self.g_slider.grid(row=1, column=1, sticky='ew')
		self.g_label = ttk.Label(slider_frame, width=4)
		self.g_label.grid(row=1, column=2)
		
		ttk.Label(slider_frame, text="B:").grid(row=2, column=0)
		self.b_var = tk.IntVar()
		self.b_slider = ttk.Scale(slider_frame, from_=0, to=248, variable=self.b_var,
								  command=lambda _: self._on_slider_change())
		self.b_slider.grid(row=2, column=1, sticky='ew')
		self.b_label = ttk.Label(slider_frame, width=4)
		self.b_label.grid(row=2, column=2)
		
		slider_frame.columnconfigure(1, weight=1)
		
		# Buttons
		btn_frame = ttk.Frame(info_frame)
		btn_frame.pack(fill='x', padx=5, pady=5)
		
		ttk.Button(btn_frame, text="Pick Color...", command=self._pick_color).pack(side='left', padx=2)
		ttk.Button(btn_frame, text="Apply", command=self._apply_color).pack(side='left', padx=2)
		ttk.Button(btn_frame, text="Copy", command=self._copy_color).pack(side='left', padx=2)
		ttk.Button(btn_frame, text="Paste", command=self._paste_color).pack(side='left', padx=2)
		
		self.clipboard_color = None
	
	def _update_palette_list(self):
		"""Update the palette list."""
		self.palette_list.delete(0, tk.END)
		for pal in self.bank.palettes:
			self.palette_list.insert(tk.END, f"{pal.name} (${pal.address:06X})")
	
	def _on_palette_select(self, event):
		"""Handle palette selection."""
		selection = self.palette_list.curselection()
		if selection:
			idx = selection[0]
			self.current_palette = self.bank.palettes[idx]
			self.name_var.set(self.current_palette.name)
			self.addr_var.set(f"${self.current_palette.address:06X}")
			self._draw_swatches()
			self._update_color_info()
	
	def _draw_swatches(self):
		"""Draw palette color swatches."""
		self.swatch_canvas.delete('all')
		if not self.current_palette:
			return
		
		for i in range(16):
			row = i // self.SWATCHES_PER_ROW
			col = i % self.SWATCHES_PER_ROW
			x = col * self.SWATCH_SIZE + 5
			y = row * self.SWATCH_SIZE + 5
			
			color = self.current_palette.get_hex(i)
			
			# Draw swatch
			self.swatch_canvas.create_rectangle(
				x, y, x + self.SWATCH_SIZE - 2, y + self.SWATCH_SIZE - 2,
				fill=color, outline='black' if i != self.selected_color else 'red',
				width=1 if i != self.selected_color else 3,
				tags=f"swatch_{i}"
			)
			
			# Draw index
			self.swatch_canvas.create_text(
				x + self.SWATCH_SIZE // 2, y + self.SWATCH_SIZE // 2,
				text=str(i), fill='white' if self._is_dark(color) else 'black',
				font=('Arial', 8)
			)
	
	def _is_dark(self, hex_color: str) -> bool:
		"""Check if color is dark."""
		r, g, b = hex_to_rgb(hex_color)
		return (r + g + b) / 3 < 128
	
	def _on_swatch_click(self, event):
		"""Handle swatch click."""
		if not self.current_palette:
			return
		
		# Calculate which swatch was clicked
		col = (event.x - 5) // self.SWATCH_SIZE
		row = (event.y - 5) // self.SWATCH_SIZE
		idx = row * self.SWATCHES_PER_ROW + col
		
		if 0 <= idx < 16:
			self.selected_color = idx
			self._draw_swatches()
			self._update_color_info()
	
	def _on_swatch_double_click(self, event):
		"""Handle double-click to pick color."""
		self._pick_color()
	
	def _update_color_info(self):
		"""Update color info display."""
		if not self.current_palette:
			return
		
		color = self.current_palette.colors[self.selected_color]
		r, g, b = snes_to_rgb(color)
		
		self.index_var.set(f"{self.selected_color} (${self.selected_color:X})")
		self.snes_var.set(f"${color:04X}")
		self.rgb_var.set(f"({r}, {g}, {b})")
		self.hex_var.set(rgb_to_hex(r, g, b))
		
		# Update sliders
		self.r_var.set(r)
		self.g_var.set(g)
		self.b_var.set(b)
		self.r_label.config(text=str(r))
		self.g_label.config(text=str(g))
		self.b_label.config(text=str(b))
		
		# Update preview
		self.preview_canvas.delete('all')
		self.preview_canvas.create_rectangle(0, 0, 80, 80, fill=rgb_to_hex(r, g, b))
	
	def _on_slider_change(self):
		"""Handle slider change."""
		r = int(self.r_var.get()) & 0xF8  # Round to SNES precision
		g = int(self.g_var.get()) & 0xF8
		b = int(self.b_var.get()) & 0xF8
		
		self.r_label.config(text=str(r))
		self.g_label.config(text=str(g))
		self.b_label.config(text=str(b))
		
		# Update preview
		self.preview_canvas.delete('all')
		self.preview_canvas.create_rectangle(0, 0, 80, 80, fill=rgb_to_hex(r, g, b))
	
	def _apply_color(self):
		"""Apply slider color to current swatch."""
		if not self.current_palette:
			return
		
		r = int(self.r_var.get()) & 0xF8
		g = int(self.g_var.get()) & 0xF8
		b = int(self.b_var.get()) & 0xF8
		
		self.current_palette.set_rgb(self.selected_color, r, g, b)
		self._draw_swatches()
		self._update_color_info()
	
	def _pick_color(self):
		"""Open color picker dialog."""
		if not self.current_palette:
			return
		
		current = self.current_palette.get_hex(self.selected_color)
		color = colorchooser.askcolor(color=current, title="Pick Color")
		
		if color[0]:
			r, g, b = [int(c) for c in color[0]]
			self.current_palette.set_rgb(self.selected_color, r, g, b)
			self._draw_swatches()
			self._update_color_info()
	
	def _copy_color(self):
		"""Copy current color to clipboard."""
		if self.current_palette:
			self.clipboard_color = self.current_palette.colors[self.selected_color]
	
	def _paste_color(self):
		"""Paste color from clipboard."""
		if self.current_palette and self.clipboard_color is not None:
			self.current_palette.colors[self.selected_color] = self.clipboard_color
			self._draw_swatches()
			self._update_color_info()
	
	def _make_grayscale(self):
		"""Convert palette to grayscale."""
		if not self.current_palette:
			return
		
		for i in range(16):
			r, g, b = self.current_palette.get_rgb(i)
			gray = int(0.299 * r + 0.587 * g + 0.114 * b)
			self.current_palette.set_rgb(i, gray, gray, gray)
		
		self._draw_swatches()
		self._update_color_info()
	
	def _invert_colors(self):
		"""Invert all colors."""
		if not self.current_palette:
			return
		
		for i in range(16):
			r, g, b = self.current_palette.get_rgb(i)
			self.current_palette.set_rgb(i, 255 - r, 255 - g, 255 - b)
		
		self._draw_swatches()
		self._update_color_info()
	
	def _brighten(self):
		"""Brighten all colors."""
		if not self.current_palette:
			return
		
		for i in range(16):
			r, g, b = self.current_palette.get_rgb(i)
			self.current_palette.set_rgb(i, min(255, r + 16), min(255, g + 16), min(255, b + 16))
		
		self._draw_swatches()
		self._update_color_info()
	
	def _darken(self):
		"""Darken all colors."""
		if not self.current_palette:
			return
		
		for i in range(16):
			r, g, b = self.current_palette.get_rgb(i)
			self.current_palette.set_rgb(i, max(0, r - 16), max(0, g - 16), max(0, b - 16))
		
		self._draw_swatches()
		self._update_color_info()
	
	def _rotate_left(self):
		"""Rotate colors left (skip color 0)."""
		if not self.current_palette:
			return
		
		first = self.current_palette.colors[1]
		for i in range(1, 15):
			self.current_palette.colors[i] = self.current_palette.colors[i + 1]
		self.current_palette.colors[15] = first
		
		self._draw_swatches()
	
	def _rotate_right(self):
		"""Rotate colors right (skip color 0)."""
		if not self.current_palette:
			return
		
		last = self.current_palette.colors[15]
		for i in range(15, 1, -1):
			self.current_palette.colors[i] = self.current_palette.colors[i - 1]
		self.current_palette.colors[1] = last
		
		self._draw_swatches()
	
	def _open_rom(self):
		"""Open ROM file."""
		file_path = filedialog.askopenfilename(
			title="Open ROM",
			filetypes=[("SNES ROM", "*.sfc *.smc"), ("All files", "*.*")]
		)
		if file_path and self.bank.load_rom(file_path):
			self.root.title(f"Soul Blazer Palette Viewer - {Path(file_path).name}")
			self._update_palette_list()
	
	def _save_rom(self):
		"""Save ROM file."""
		file_path = filedialog.asksaveasfilename(
			title="Save ROM",
			defaultextension=".sfc",
			filetypes=[("SNES ROM", "*.sfc *.smc"), ("All files", "*.*")]
		)
		if file_path and self.bank.save_rom(file_path):
			messagebox.showinfo("Saved", "ROM saved successfully!")
	
	def _import_palette(self):
		"""Import palette from file."""
		file_path = filedialog.askopenfilename(
			title="Import Palette",
			filetypes=[("JASC Palette", "*.pal"), ("All files", "*.*")]
		)
		if file_path:
			pal = self.bank.import_pal(file_path)
			if pal:
				self.bank.palettes.append(pal)
				self._update_palette_list()
	
	def _export_palette(self):
		"""Export palette to file."""
		if not self.current_palette:
			return
		
		file_path = filedialog.asksaveasfilename(
			title="Export Palette",
			defaultextension=".pal",
			filetypes=[("JASC Palette", "*.pal"), ("All files", "*.*")]
		)
		if file_path:
			self.bank.export_pal(self.current_palette, file_path)
			messagebox.showinfo("Exported", f"Palette exported to {file_path}")
	
	def _export_image(self):
		"""Export palette as image."""
		if not self.current_palette or not HAS_PIL:
			if not HAS_PIL:
				messagebox.showerror("Error", "PIL/Pillow required for image export")
			return
		
		file_path = filedialog.asksaveasfilename(
			title="Export Image",
			defaultextension=".png",
			filetypes=[("PNG Image", "*.png"), ("All files", "*.*")]
		)
		if file_path:
			img = Image.new('RGB', (128, 32))
			for i in range(16):
				r, g, b = self.current_palette.get_rgb(i)
				col = i % 8
				row = i // 8
				for y in range(16):
					for x in range(16):
						img.putpixel((col * 16 + x, row * 16 + y), (r, g, b))
			img.save(file_path)
			messagebox.showinfo("Exported", f"Image exported to {file_path}")
	
	def _scan_rom(self):
		"""Scan ROM for palettes."""
		if not self.bank.rom_data:
			messagebox.showwarning("Warning", "Load a ROM first")
			return
		
		found = self.bank.scan_for_palettes()
		if found:
			for pal in found[:50]:  # Limit to first 50
				self.bank.palettes.append(pal)
			self._update_palette_list()
			messagebox.showinfo("Scan Complete", f"Found {len(found)} potential palettes")
		else:
			messagebox.showinfo("Scan Complete", "No palettes found")
	
	def run(self):
		"""Run the GUI."""
		self.root.mainloop()


def main():
	import argparse
	
	parser = argparse.ArgumentParser(description="Soul Blazer Palette Viewer")
	parser.add_argument('rom', nargs='?', help='ROM file to open')
	parser.add_argument('--export', help='Export all palettes to directory')
	parser.add_argument('--cli', action='store_true', help='Command line mode')
	
	args = parser.parse_args()
	
	if args.cli:
		bank = PaletteBank()
		if args.rom:
			bank.load_rom(args.rom)
			
			for pal in bank.palettes:
				print(f"\n{pal.name} (${pal.address:06X}):")
				for i in range(16):
					r, g, b = pal.get_rgb(i)
					print(f"  {i:2d}: ${pal.colors[i]:04X} = RGB({r:3d},{g:3d},{b:3d})")
			
			if args.export:
				os.makedirs(args.export, exist_ok=True)
				for pal in bank.palettes:
					safe_name = pal.name.replace(' ', '_').replace('/', '_')
					bank.export_pal(pal, os.path.join(args.export, f"{safe_name}.pal"))
				print(f"\nExported {len(bank.palettes)} palettes to {args.export}")
	else:
		gui = PaletteViewerGUI()
		if args.rom:
			gui.bank.load_rom(args.rom)
			gui._update_palette_list()
		gui.run()


if __name__ == "__main__":
	main()
