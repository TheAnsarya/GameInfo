#!/usr/bin/env python3
"""
Soul Blazer (SNES) Map Viewer
Visual map viewer and editor using tkinter.
"""

import json
import struct
import tkinter as tk
from tkinter import ttk, filedialog, messagebox
from pathlib import Path
from PIL import Image, ImageTk
import io


class TileRenderer:
	"""Render SNES 4BPP tiles to images."""

	# Default SNES palette (grayscale for debugging)
	DEFAULT_PALETTE = [
		(i * 17, i * 17, i * 17) for i in range(16)
	]

	def __init__(self):
		self.palette = self.DEFAULT_PALETTE

	def set_palette(self, palette: list[tuple[int, int, int]]):
		"""Set color palette (16 colors)."""
		self.palette = palette[:16]
		while len(self.palette) < 16:
			self.palette.append((0, 0, 0))

	def decode_4bpp_tile(self, data: bytes, offset: int = 0) -> list[list[int]]:
		"""Decode a single 8x8 4BPP tile."""
		tile = [[0] * 8 for _ in range(8)]

		for row in range(8):
			# 4BPP tiles: 2 bytes per row for low bits, then 2 bytes for high bits
			bp0 = data[offset + row * 2] if offset + row * 2 < len(data) else 0
			bp1 = data[offset + row * 2 + 1] if offset + row * 2 + 1 < len(data) else 0
			bp2 = data[offset + 16 + row * 2] if offset + 16 + row * 2 < len(data) else 0
			bp3 = data[offset + 16 + row * 2 + 1] if offset + 16 + row * 2 + 1 < len(data) else 0

			for col in range(8):
				bit = 7 - col
				pixel = ((bp0 >> bit) & 1)
				pixel |= ((bp1 >> bit) & 1) << 1
				pixel |= ((bp2 >> bit) & 1) << 2
				pixel |= ((bp3 >> bit) & 1) << 3
				tile[row][col] = pixel

		return tile

	def tile_to_image(self, tile_data: list[list[int]], scale: int = 1) -> Image.Image:
		"""Convert decoded tile to PIL Image."""
		img = Image.new('RGB', (8 * scale, 8 * scale))
		pixels = img.load()

		for y in range(8):
			for x in range(8):
				color = self.palette[tile_data[y][x] % 16]
				for sy in range(scale):
					for sx in range(scale):
						pixels[x * scale + sx, y * scale + sy] = color

		return img

	def render_tileset(self, data: bytes, tiles_per_row: int = 16, scale: int = 2) -> Image.Image:
		"""Render entire tileset as image grid."""
		num_tiles = len(data) // 32  # 32 bytes per 4BPP tile
		rows = (num_tiles + tiles_per_row - 1) // tiles_per_row

		img = Image.new('RGB', (tiles_per_row * 8 * scale, rows * 8 * scale))

		for i in range(num_tiles):
			tile = self.decode_4bpp_tile(data, i * 32)
			tile_img = self.tile_to_image(tile, scale)

			x = (i % tiles_per_row) * 8 * scale
			y = (i // tiles_per_row) * 8 * scale
			img.paste(tile_img, (x, y))

		return img


class MapViewer(tk.Tk):
	"""Main map viewer application."""

	def __init__(self):
		super().__init__()

		self.title("Soul Blazer Map Viewer")
		self.geometry("1200x800")

		self.rom_data = None
		self.rom_path = None
		self.current_map = None
		self.tile_renderer = TileRenderer()
		self.tileset_image = None
		self.map_image = None
		self.zoom = 2

		self.setup_ui()

	def setup_ui(self):
		"""Create the user interface."""
		# Menu bar
		menubar = tk.Menu(self)
		self.config(menu=menubar)

		file_menu = tk.Menu(menubar, tearoff=0)
		menubar.add_cascade(label="File", menu=file_menu)
		file_menu.add_command(label="Open ROM...", command=self.open_rom)
		file_menu.add_separator()
		file_menu.add_command(label="Export Map Image...", command=self.export_map)
		file_menu.add_separator()
		file_menu.add_command(label="Exit", command=self.quit)

		view_menu = tk.Menu(menubar, tearoff=0)
		menubar.add_cascade(label="View", menu=view_menu)
		view_menu.add_command(label="Zoom In", command=lambda: self.set_zoom(self.zoom + 1))
		view_menu.add_command(label="Zoom Out", command=lambda: self.set_zoom(self.zoom - 1))

		# Main paned window
		paned = ttk.PanedWindow(self, orient=tk.HORIZONTAL)
		paned.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)

		# Left panel - area list
		left_frame = ttk.Frame(paned, width=250)
		paned.add(left_frame, weight=0)

		ttk.Label(left_frame, text="Areas").pack(anchor=tk.W)

		self.area_list = tk.Listbox(left_frame, height=20)
		self.area_list.pack(fill=tk.BOTH, expand=True)
		self.area_list.bind('<<ListboxSelect>>', self.on_area_select)

		# Area names
		area_names = [
			"Grass Valley Underground",
			"Grass Valley Village",
			"Underground Castle B1",
			"Underground Castle B2",
			"Underground Castle B3",
			"Underground Castle B4",
			"GreenWood",
			"GreenWood Underground",
			"Water Shrine",
			"Fire Shrine",
			"Light Shrine",
			"Lost Marsh",
			"St. Elles Seabed",
			"St. Elles Underground",
			"Durean",
			"Ghost Ship",
			"Southerta",
			"Mermaid Palace",
			"Mountain of Souls",
			"Laynole",
			"Nome",
			"Lune",
			"Model Town 1",
			"Model Town 2",
			"Leo's Lab Basement",
			"Leo's Lab Attic",
			"Leo's Paintings",
			"Magridd Town",
			"Magridd Castle",
			"Castle Basement",
			"World of Evil",
			"Deathtoll's Lair",
		]
		for name in area_names:
			self.area_list.insert(tk.END, name)

		# Right panel - map display
		right_frame = ttk.Frame(paned)
		paned.add(right_frame, weight=1)

		# Notebook for tabs
		notebook = ttk.Notebook(right_frame)
		notebook.pack(fill=tk.BOTH, expand=True)

		# Map tab
		map_frame = ttk.Frame(notebook)
		notebook.add(map_frame, text="Map")

		self.map_canvas = tk.Canvas(map_frame, bg='#333')
		self.map_canvas.pack(fill=tk.BOTH, expand=True)

		h_scroll = ttk.Scrollbar(map_frame, orient=tk.HORIZONTAL, command=self.map_canvas.xview)
		h_scroll.pack(fill=tk.X, side=tk.BOTTOM)
		v_scroll = ttk.Scrollbar(map_frame, orient=tk.VERTICAL, command=self.map_canvas.yview)
		v_scroll.pack(fill=tk.Y, side=tk.RIGHT)

		self.map_canvas.configure(xscrollcommand=h_scroll.set, yscrollcommand=v_scroll.set)

		# Tileset tab
		tileset_frame = ttk.Frame(notebook)
		notebook.add(tileset_frame, text="Tileset")

		self.tileset_canvas = tk.Canvas(tileset_frame, bg='#333')
		self.tileset_canvas.pack(fill=tk.BOTH, expand=True)

		# Bank viewer tab
		bank_frame = ttk.Frame(notebook)
		notebook.add(bank_frame, text="Bank Viewer")

		bank_controls = ttk.Frame(bank_frame)
		bank_controls.pack(fill=tk.X)

		ttk.Label(bank_controls, text="Bank:").pack(side=tk.LEFT, padx=5)
		self.bank_var = tk.StringVar(value="00")
		bank_spin = ttk.Spinbox(bank_controls, from_=0, to=31, width=5, textvariable=self.bank_var)
		bank_spin.pack(side=tk.LEFT)

		ttk.Button(bank_controls, text="View", command=self.view_bank).pack(side=tk.LEFT, padx=5)

		self.bank_canvas = tk.Canvas(bank_frame, bg='#333')
		self.bank_canvas.pack(fill=tk.BOTH, expand=True)

		# Status bar
		self.status_var = tk.StringVar(value="No ROM loaded")
		status_bar = ttk.Label(self, textvariable=self.status_var, relief=tk.SUNKEN)
		status_bar.pack(fill=tk.X, side=tk.BOTTOM)

	def open_rom(self):
		"""Open a ROM file."""
		path = filedialog.askopenfilename(
			title="Open ROM",
			filetypes=[("SNES ROM", "*.sfc *.smc"), ("All files", "*.*")]
		)
		if path:
			self.load_rom(path)

	def load_rom(self, path: str):
		"""Load ROM data."""
		try:
			with open(path, 'rb') as f:
				self.rom_data = f.read()
			self.rom_path = path
			self.status_var.set(f"Loaded: {Path(path).name} ({len(self.rom_data):,} bytes)")

			# Load first tileset
			self.load_tileset(0)

		except Exception as e:
			messagebox.showerror("Error", f"Failed to load ROM: {e}")

	def load_tileset(self, bank: int):
		"""Load tileset from bank."""
		if not self.rom_data:
			return

		start = bank * 0x8000
		end = start + 0x4000  # 16KB of tile data
		tileset_data = self.rom_data[start:end]

		# Render tileset
		img = self.tile_renderer.render_tileset(tileset_data, 16, self.zoom)
		self.tileset_image = ImageTk.PhotoImage(img)

		self.tileset_canvas.delete("all")
		self.tileset_canvas.create_image(0, 0, anchor=tk.NW, image=self.tileset_image)

	def view_bank(self):
		"""View graphics from selected bank."""
		if not self.rom_data:
			messagebox.showwarning("Warning", "No ROM loaded")
			return

		try:
			bank = int(self.bank_var.get())
			if 0 <= bank < 32:
				start = bank * 0x8000
				end = start + 0x8000
				data = self.rom_data[start:end]

				# Render as tileset
				img = self.tile_renderer.render_tileset(data, 16, self.zoom)
				self.bank_image = ImageTk.PhotoImage(img)

				self.bank_canvas.delete("all")
				self.bank_canvas.create_image(0, 0, anchor=tk.NW, image=self.bank_image)

				self.status_var.set(f"Viewing bank ${bank:02x}")
		except ValueError:
			pass

	def on_area_select(self, event):
		"""Handle area selection."""
		selection = self.area_list.curselection()
		if selection:
			area_idx = selection[0]
			area_name = self.area_list.get(area_idx)
			self.status_var.set(f"Selected: {area_name}")

			# TODO: Load actual map data for this area
			if self.rom_data:
				# For now, show graphics from a bank related to area index
				self.load_tileset(area_idx % 32)

	def set_zoom(self, zoom: int):
		"""Set zoom level."""
		self.zoom = max(1, min(4, zoom))
		if self.rom_data:
			self.view_bank()

	def export_map(self):
		"""Export current map as image."""
		if not self.tileset_image:
			messagebox.showwarning("Warning", "No map to export")
			return

		path = filedialog.asksaveasfilename(
			title="Export Map",
			defaultextension=".png",
			filetypes=[("PNG Image", "*.png"), ("All files", "*.*")]
		)
		if path:
			# TODO: Export actual map image
			messagebox.showinfo("Info", "Map export not yet implemented")


def main():
	app = MapViewer()

	# Try to load default ROM
	default_rom = r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Soul Blazer (U) [!].sfc"
	if Path(default_rom).exists():
		app.load_rom(default_rom)

	app.mainloop()


if __name__ == '__main__':
	main()
