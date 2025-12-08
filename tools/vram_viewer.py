#!/usr/bin/env python3
"""
VRAM Viewer - Visualize and analyze video RAM from save states.

Features:
- Display tile data from VRAM
- Show nametables and pattern tables
- Support NES, SNES, GB PPU formats
- Export VRAM contents to images

Author: ROM Hacking Toolkit
"""

import argparse
import gzip
import json
import struct
import sys
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

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


class PPUFormat(Enum):
	"""PPU/video format types."""
	NES_2C02 = "nes"
	SNES_PPU = "snes"
	GB_PPU = "gb"
	GBC_PPU = "gbc"


@dataclass
class VRAMData:
	"""Video RAM data container."""
	pattern_tables: List[bytes] = field(default_factory=list)  # Tile data
	nametables: List[bytes] = field(default_factory=list)  # Screen layouts
	palettes: List[bytes] = field(default_factory=list)  # Color data
	oam: bytes = b''  # Sprite data
	ppu_format: PPUFormat = PPUFormat.NES_2C02


# NES palette (2C02)
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

# GB palette (4 shades)
GB_PALETTE = [
	(0xFF, 0xFF, 0xFF),  # White
	(0xAA, 0xAA, 0xAA),  # Light gray
	(0x55, 0x55, 0x55),  # Dark gray
	(0x00, 0x00, 0x00),  # Black
]


def decode_nes_tile(data: bytes, offset: int = 0) -> List[List[int]]:
	"""Decode NES 2BPP tile to pixel array."""
	pixels = [[0] * 8 for _ in range(8)]
	
	for y in range(8):
		if offset + y >= len(data) or offset + y + 8 >= len(data):
			continue
		
		low = data[offset + y]
		high = data[offset + y + 8]
		
		for x in range(8):
			bit = 7 - x
			pixel = ((low >> bit) & 1) | (((high >> bit) & 1) << 1)
			pixels[y][x] = pixel
	
	return pixels


def decode_gb_tile(data: bytes, offset: int = 0) -> List[List[int]]:
	"""Decode GB 2BPP tile to pixel array."""
	pixels = [[0] * 8 for _ in range(8)]
	
	for y in range(8):
		idx = offset + y * 2
		if idx + 1 >= len(data):
			continue
		
		low = data[idx]
		high = data[idx + 1]
		
		for x in range(8):
			bit = 7 - x
			pixel = ((low >> bit) & 1) | (((high >> bit) & 1) << 1)
			pixels[y][x] = pixel
	
	return pixels


def render_pattern_table(
	data: bytes,
	ppu_format: PPUFormat,
	palette: List[Tuple[int, int, int]] = None,
	scale: int = 2
) -> 'Image.Image':
	"""Render pattern table to image."""
	if not HAS_PIL:
		raise ImportError("PIL required for rendering")
	
	if palette is None:
		palette = GB_PALETTE if ppu_format in [PPUFormat.GB_PPU, PPUFormat.GBC_PPU] else NES_PALETTE[:4]
	
	# NES pattern table: 256 tiles, 16x16 arrangement
	# Each tile is 16 bytes (8 bytes low plane + 8 bytes high plane)
	tiles_per_row = 16
	tile_count = min(256, len(data) // 16)
	rows = (tile_count + tiles_per_row - 1) // tiles_per_row
	
	img_w = tiles_per_row * 8 * scale
	img_h = rows * 8 * scale
	
	img = Image.new('RGB', (img_w, img_h), (0, 0, 0))
	
	for tile_idx in range(tile_count):
		offset = tile_idx * 16
		
		if ppu_format in [PPUFormat.GB_PPU, PPUFormat.GBC_PPU]:
			pixels = decode_gb_tile(data, offset)
		else:
			pixels = decode_nes_tile(data, offset)
		
		tile_x = (tile_idx % tiles_per_row) * 8
		tile_y = (tile_idx // tiles_per_row) * 8
		
		for py, row in enumerate(pixels):
			for px, color_idx in enumerate(row):
				if color_idx < len(palette):
					color = palette[color_idx]
				else:
					color = (255, 0, 255)
				
				# Scale pixels
				for sy in range(scale):
					for sx in range(scale):
						img.putpixel(
							((tile_x + px) * scale + sx, (tile_y + py) * scale + sy),
							color
						)
	
	return img


def render_nametable(
	nametable: bytes,
	pattern_data: bytes,
	ppu_format: PPUFormat,
	palette: List[Tuple[int, int, int]] = None,
	scale: int = 2
) -> 'Image.Image':
	"""Render nametable to image."""
	if not HAS_PIL:
		raise ImportError("PIL required for rendering")
	
	if palette is None:
		palette = GB_PALETTE if ppu_format in [PPUFormat.GB_PPU, PPUFormat.GBC_PPU] else NES_PALETTE[:4]
	
	# NES nametable: 32x30 tiles
	width_tiles = 32
	height_tiles = 30
	
	img_w = width_tiles * 8 * scale
	img_h = height_tiles * 8 * scale
	
	img = Image.new('RGB', (img_w, img_h), (0, 0, 0))
	
	for ty in range(height_tiles):
		for tx in range(width_tiles):
			nt_idx = ty * width_tiles + tx
			if nt_idx >= len(nametable):
				continue
			
			tile_idx = nametable[nt_idx]
			offset = tile_idx * 16
			
			if offset + 16 > len(pattern_data):
				continue
			
			if ppu_format in [PPUFormat.GB_PPU, PPUFormat.GBC_PPU]:
				pixels = decode_gb_tile(pattern_data, offset)
			else:
				pixels = decode_nes_tile(pattern_data, offset)
			
			for py, row in enumerate(pixels):
				for px, color_idx in enumerate(row):
					if color_idx < len(palette):
						color = palette[color_idx]
					else:
						color = (255, 0, 255)
					
					for sy in range(scale):
						for sx in range(scale):
							img.putpixel(
								((tx * 8 + px) * scale + sx, (ty * 8 + py) * scale + sy),
								color
							)
	
	return img


def extract_vram_from_savestate(path: str, ppu_format: PPUFormat) -> VRAMData:
	"""Extract VRAM data from emulator save state."""
	data = Path(path).read_bytes()
	
	# Decompress if needed
	if data[:2] == b'\x1f\x8b':
		data = gzip.decompress(data)
	
	vram = VRAMData(ppu_format=ppu_format)
	
	if ppu_format == PPUFormat.NES_2C02:
		# Search for PPU section markers or use known offsets
		# FCEUX stores CHR/pattern data in specific sections
		
		# Try to find pattern table data (typically 8KB)
		# This is a simplified heuristic
		if b'CHRR' in data:
			idx = data.index(b'CHRR')
			# Skip section header
			offset = idx + 8
			size = 0x2000  # 8KB CHR
			if offset + size <= len(data):
				vram.pattern_tables.append(data[offset:offset + size])
		
		# Try to find nametable (2KB x 2)
		if b'NTAR' in data:
			idx = data.index(b'NTAR')
			offset = idx + 8
			size = 0x800  # 2KB nametable
			if offset + size <= len(data):
				vram.nametables.append(data[offset:offset + size])
		
		# Palette (32 bytes)
		if b'PRAM' in data:
			idx = data.index(b'PRAM')
			offset = idx + 8
			if offset + 32 <= len(data):
				vram.palettes.append(data[offset:offset + 32])
		
		# OAM (256 bytes)
		if b'SPRA' in data:
			idx = data.index(b'SPRA')
			offset = idx + 8
			if offset + 256 <= len(data):
				vram.oam = data[offset:offset + 256]
	
	elif ppu_format in [PPUFormat.GB_PPU, PPUFormat.GBC_PPU]:
		# GB VRAM is typically at fixed offsets in BGB states
		# Tile data: 0x8000-0x97FF (6KB)
		# This is a simplified approach
		pass
	
	return vram


def load_raw_vram(
	path: str,
	offset: int = 0,
	pattern_size: int = 0x2000,
	nametable_size: int = 0x800,
	ppu_format: PPUFormat = PPUFormat.NES_2C02
) -> VRAMData:
	"""Load VRAM data from raw binary file."""
	data = Path(path).read_bytes()
	
	vram = VRAMData(ppu_format=ppu_format)
	
	# Pattern table
	if offset + pattern_size <= len(data):
		vram.pattern_tables.append(data[offset:offset + pattern_size])
	
	# Nametable (if present after pattern data)
	nt_offset = offset + pattern_size
	if nt_offset + nametable_size <= len(data):
		vram.nametables.append(data[nt_offset:nt_offset + nametable_size])
	
	return vram


def format_vram_info(vram: VRAMData) -> str:
	"""Format VRAM information for display."""
	lines = [
		f"PPU Format: {vram.ppu_format.value}",
		f"Pattern Tables: {len(vram.pattern_tables)}"
	]
	
	for i, pt in enumerate(vram.pattern_tables):
		lines.append(f"  Table {i}: {len(pt):,} bytes ({len(pt) // 16} tiles)")
	
	lines.append(f"Nametables: {len(vram.nametables)}")
	for i, nt in enumerate(vram.nametables):
		lines.append(f"  Nametable {i}: {len(nt):,} bytes")
	
	lines.append(f"Palettes: {len(vram.palettes)}")
	for i, pal in enumerate(vram.palettes):
		lines.append(f"  Palette {i}: {len(pal)} bytes")
		if len(pal) >= 4:
			hex_str = ' '.join(f'{b:02X}' for b in pal[:16])
			lines.append(f"    {hex_str}")
	
	if vram.oam:
		lines.append(f"OAM: {len(vram.oam)} bytes ({len(vram.oam) // 4} sprites)")
	
	return '\n'.join(lines)


class VRAMViewerGUI:
	"""GUI for viewing VRAM contents."""
	
	def __init__(self, master: tk.Tk):
		"""Initialize GUI."""
		self.master = master
		self.master.title("VRAM Viewer")
		self.master.geometry("900x700")
		
		self.vram: Optional[VRAMData] = None
		self.scale = 2
		
		self._create_widgets()
		self._create_menu()
	
	def _create_menu(self) -> None:
		"""Create menu bar."""
		menubar = tk.Menu(self.master)
		self.master.config(menu=menubar)
		
		file_menu = tk.Menu(menubar, tearoff=0)
		file_menu.add_command(label="Open Save State...", command=self._open_savestate)
		file_menu.add_command(label="Open Raw VRAM...", command=self._open_raw)
		file_menu.add_separator()
		file_menu.add_command(label="Export Pattern Table...", command=self._export_pattern)
		file_menu.add_command(label="Export Nametable...", command=self._export_nametable)
		file_menu.add_separator()
		file_menu.add_command(label="Exit", command=self.master.quit)
		menubar.add_cascade(label="File", menu=file_menu)
		
		view_menu = tk.Menu(menubar, tearoff=0)
		view_menu.add_command(label="Pattern Table 0", command=lambda: self._show_pattern(0))
		view_menu.add_command(label="Pattern Table 1", command=lambda: self._show_pattern(1))
		view_menu.add_separator()
		view_menu.add_command(label="Nametable 0", command=lambda: self._show_nametable(0))
		view_menu.add_command(label="Nametable 1", command=lambda: self._show_nametable(1))
		menubar.add_cascade(label="View", menu=view_menu)
	
	def _create_widgets(self) -> None:
		"""Create GUI widgets."""
		# Main paned window
		paned = ttk.PanedWindow(self.master, orient=tk.HORIZONTAL)
		paned.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)
		
		# Left panel - info
		left_frame = ttk.Frame(paned)
		paned.add(left_frame, weight=1)
		
		# Format selector
		format_frame = ttk.LabelFrame(left_frame, text="PPU Format")
		format_frame.pack(fill=tk.X, padx=5, pady=5)
		
		self.format_var = tk.StringVar(value="nes")
		for fmt in PPUFormat:
			ttk.Radiobutton(format_frame, text=fmt.value.upper(),
				variable=self.format_var, value=fmt.value).pack(side=tk.LEFT, padx=5)
		
		# Scale selector
		scale_frame = ttk.LabelFrame(left_frame, text="Scale")
		scale_frame.pack(fill=tk.X, padx=5, pady=5)
		
		self.scale_var = tk.IntVar(value=2)
		for s in [1, 2, 3, 4]:
			ttk.Radiobutton(scale_frame, text=f"{s}x",
				variable=self.scale_var, value=s,
				command=self._update_display).pack(side=tk.LEFT, padx=5)
		
		# Info text
		info_frame = ttk.LabelFrame(left_frame, text="VRAM Info")
		info_frame.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)
		
		self.info_text = tk.Text(info_frame, font=('Consolas', 9), width=30, height=20)
		self.info_text.pack(fill=tk.BOTH, expand=True)
		
		# Right panel - canvas
		right_frame = ttk.Frame(paned)
		paned.add(right_frame, weight=3)
		
		# Tab control for different views
		self.tabs = ttk.Notebook(right_frame)
		self.tabs.pack(fill=tk.BOTH, expand=True)
		
		# Pattern table tab
		pt_frame = ttk.Frame(self.tabs)
		self.tabs.add(pt_frame, text="Pattern Tables")
		
		self.pt_canvas = tk.Canvas(pt_frame, bg='black')
		self.pt_canvas.pack(fill=tk.BOTH, expand=True)
		
		# Nametable tab
		nt_frame = ttk.Frame(self.tabs)
		self.tabs.add(nt_frame, text="Nametables")
		
		self.nt_canvas = tk.Canvas(nt_frame, bg='black')
		self.nt_canvas.pack(fill=tk.BOTH, expand=True)
		
		# Palette tab
		pal_frame = ttk.Frame(self.tabs)
		self.tabs.add(pal_frame, text="Palettes")
		
		self.pal_canvas = tk.Canvas(pal_frame, bg='gray')
		self.pal_canvas.pack(fill=tk.BOTH, expand=True)
		
		# Status bar
		self.status_var = tk.StringVar(value="Ready")
		status_bar = ttk.Label(self.master, textvariable=self.status_var, relief=tk.SUNKEN)
		status_bar.pack(fill=tk.X, side=tk.BOTTOM)
	
	def _open_savestate(self) -> None:
		"""Open emulator save state."""
		path = filedialog.askopenfilename(
			title="Open Save State",
			filetypes=[
				("Save states", "*.fcs *.fc0 *.sn0 *.sna *.000 *.zs0"),
				("All files", "*.*")
			]
		)
		
		if path:
			try:
				ppu_format = PPUFormat(self.format_var.get())
				self.vram = extract_vram_from_savestate(path, ppu_format)
				self._update_info()
				self._update_display()
			except Exception as e:
				messagebox.showerror("Error", str(e))
	
	def _open_raw(self) -> None:
		"""Open raw VRAM dump."""
		path = filedialog.askopenfilename(
			title="Open Raw VRAM",
			filetypes=[("All files", "*.*")]
		)
		
		if path:
			try:
				ppu_format = PPUFormat(self.format_var.get())
				self.vram = load_raw_vram(path, 0, 0x2000, 0x800, ppu_format)
				self._update_info()
				self._update_display()
			except Exception as e:
				messagebox.showerror("Error", str(e))
	
	def _update_info(self) -> None:
		"""Update info display."""
		if self.vram:
			info = format_vram_info(self.vram)
			self.info_text.delete('1.0', tk.END)
			self.info_text.insert('1.0', info)
	
	def _update_display(self) -> None:
		"""Update canvas displays."""
		if not self.vram or not HAS_PIL:
			return
		
		self.scale = self.scale_var.get()
		
		# Update pattern table display
		self._show_pattern(0)
		
		# Update nametable display
		if self.vram.nametables and self.vram.pattern_tables:
			self._show_nametable(0)
		
		# Update palette display
		self._show_palettes()
	
	def _show_pattern(self, index: int) -> None:
		"""Show pattern table."""
		if not self.vram or index >= len(self.vram.pattern_tables):
			return
		
		if not HAS_PIL:
			return
		
		img = render_pattern_table(
			self.vram.pattern_tables[index],
			self.vram.ppu_format,
			scale=self.scale
		)
		
		self._pt_photo = self._pil_to_tk(img)
		
		self.pt_canvas.delete('all')
		self.pt_canvas.create_image(0, 0, anchor='nw', image=self._pt_photo)
		self.pt_canvas.config(scrollregion=(0, 0, img.width, img.height))
	
	def _show_nametable(self, index: int) -> None:
		"""Show nametable."""
		if not self.vram:
			return
		if index >= len(self.vram.nametables):
			return
		if not self.vram.pattern_tables:
			return
		
		if not HAS_PIL:
			return
		
		img = render_nametable(
			self.vram.nametables[index],
			self.vram.pattern_tables[0],
			self.vram.ppu_format,
			scale=self.scale
		)
		
		self._nt_photo = self._pil_to_tk(img)
		
		self.nt_canvas.delete('all')
		self.nt_canvas.create_image(0, 0, anchor='nw', image=self._nt_photo)
		self.nt_canvas.config(scrollregion=(0, 0, img.width, img.height))
	
	def _show_palettes(self) -> None:
		"""Show palette colors."""
		self.pal_canvas.delete('all')
		
		if not self.vram or not self.vram.palettes:
			# Show default palette
			pal = NES_PALETTE if self.vram and self.vram.ppu_format == PPUFormat.NES_2C02 else GB_PALETTE
		else:
			# Decode palette data to colors
			pal_data = self.vram.palettes[0]
			pal = []
			for b in pal_data:
				if b < len(NES_PALETTE):
					pal.append(NES_PALETTE[b])
				else:
					pal.append((0, 0, 0))
		
		# Draw palette swatches
		size = 32
		for i, color in enumerate(pal[:64]):
			x = (i % 16) * size
			y = (i // 16) * size
			hex_color = f'#{color[0]:02X}{color[1]:02X}{color[2]:02X}'
			self.pal_canvas.create_rectangle(x, y, x + size, y + size, fill=hex_color, outline='white')
			
			# Add index label
			self.pal_canvas.create_text(x + size // 2, y + size // 2, 
				text=f'{i:02X}', fill='white' if sum(color) < 384 else 'black',
				font=('Consolas', 8))
	
	def _pil_to_tk(self, img: 'Image.Image') -> 'tk.PhotoImage':
		"""Convert PIL image to Tk PhotoImage."""
		from PIL import ImageTk
		return ImageTk.PhotoImage(img)
	
	def _export_pattern(self) -> None:
		"""Export pattern table to image."""
		if not self.vram or not self.vram.pattern_tables:
			messagebox.showwarning("Warning", "No pattern table data")
			return
		
		path = filedialog.asksaveasfilename(
			title="Export Pattern Table",
			defaultextension=".png",
			filetypes=[("PNG files", "*.png")]
		)
		
		if path:
			try:
				img = render_pattern_table(
					self.vram.pattern_tables[0],
					self.vram.ppu_format,
					scale=self.scale
				)
				img.save(path)
				self.status_var.set(f"Exported: {path}")
			except Exception as e:
				messagebox.showerror("Error", str(e))
	
	def _export_nametable(self) -> None:
		"""Export nametable to image."""
		if not self.vram or not self.vram.nametables:
			messagebox.showwarning("Warning", "No nametable data")
			return
		
		path = filedialog.asksaveasfilename(
			title="Export Nametable",
			defaultextension=".png",
			filetypes=[("PNG files", "*.png")]
		)
		
		if path:
			try:
				img = render_nametable(
					self.vram.nametables[0],
					self.vram.pattern_tables[0] if self.vram.pattern_tables else b'',
					self.vram.ppu_format,
					scale=self.scale
				)
				img.save(path)
				self.status_var.set(f"Exported: {path}")
			except Exception as e:
				messagebox.showerror("Error", str(e))


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description="View and analyze video RAM from save states",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
  %(prog)s gui                                    # Launch GUI
  %(prog)s export state.fcs -o pattern.png        # Export pattern table
  %(prog)s info state.fcs                         # Show VRAM info
  %(prog)s render vram.bin -o screen.png --format nes
		"""
	)
	
	subparsers = parser.add_subparsers(dest="command", help="Command to execute")
	
	# GUI command
	gui_parser = subparsers.add_parser("gui", help="Launch GUI viewer")
	
	# Export command
	export_parser = subparsers.add_parser("export", help="Export VRAM to image")
	export_parser.add_argument("input", help="Save state or raw VRAM file")
	export_parser.add_argument("-o", "--output", required=True, help="Output image file")
	export_parser.add_argument("-f", "--format", choices=["nes", "snes", "gb", "gbc"], default="nes")
	export_parser.add_argument("-t", "--type", choices=["pattern", "nametable"], default="pattern")
	export_parser.add_argument("-s", "--scale", type=int, default=2)
	
	# Info command
	info_parser = subparsers.add_parser("info", help="Show VRAM information")
	info_parser.add_argument("input", help="Save state file")
	info_parser.add_argument("-f", "--format", choices=["nes", "snes", "gb", "gbc"], default="nes")
	
	# Render command
	render_parser = subparsers.add_parser("render", help="Render raw VRAM data")
	render_parser.add_argument("input", help="Raw VRAM file")
	render_parser.add_argument("-o", "--output", required=True, help="Output image")
	render_parser.add_argument("-f", "--format", choices=["nes", "snes", "gb", "gbc"], default="nes")
	render_parser.add_argument("--offset", type=lambda x: int(x, 16), default=0)
	render_parser.add_argument("-s", "--scale", type=int, default=2)
	
	args = parser.parse_args()
	
	if not args.command or args.command == "gui":
		if not HAS_TK:
			print("Error: tkinter not available for GUI")
			return 1
		if not HAS_PIL:
			print("Warning: PIL not available, image features disabled")
		
		root = tk.Tk()
		app = VRAMViewerGUI(root)
		root.mainloop()
		return 0
	
	try:
		ppu_format = PPUFormat(args.format)
		
		if args.command == "export":
			if not HAS_PIL:
				print("Error: PIL required for export")
				return 1
			
			vram = extract_vram_from_savestate(args.input, ppu_format)
			
			if args.type == "pattern" and vram.pattern_tables:
				img = render_pattern_table(vram.pattern_tables[0], ppu_format, scale=args.scale)
			elif args.type == "nametable" and vram.nametables and vram.pattern_tables:
				img = render_nametable(vram.nametables[0], vram.pattern_tables[0], ppu_format, scale=args.scale)
			else:
				print(f"No {args.type} data found")
				return 1
			
			img.save(args.output)
			print(f"Exported: {args.output}")
		
		elif args.command == "info":
			vram = extract_vram_from_savestate(args.input, ppu_format)
			print(format_vram_info(vram))
		
		elif args.command == "render":
			if not HAS_PIL:
				print("Error: PIL required for render")
				return 1
			
			vram = load_raw_vram(args.input, args.offset, 0x2000, 0x800, ppu_format)
			
			if vram.pattern_tables:
				img = render_pattern_table(vram.pattern_tables[0], ppu_format, scale=args.scale)
				img.save(args.output)
				print(f"Rendered: {args.output}")
			else:
				print("No pattern data found")
				return 1
	
	except FileNotFoundError as e:
		print(f"Error: File not found: {e.filename}")
		return 1
	except Exception as e:
		print(f"Error: {e}")
		return 1
	
	return 0


if __name__ == "__main__":
	sys.exit(main())
