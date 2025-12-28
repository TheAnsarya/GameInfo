#!/usr/bin/env python3
"""
Soul Blazer (SNES) Map Viewer
Visual map viewer and editor using tkinter.
Integrates extracted map data, tilesets, pointer tables, and palettes.
"""

import json
import struct
import tkinter as tk
from tkinter import ttk, filedialog, messagebox
from pathlib import Path
from PIL import Image, ImageTk
import io
from typing import Optional

# Import palette manager
from palette_manager import PaletteManager, DEFAULT_PALETTES


# Base paths for Soul Blazer data
SCRIPT_DIR = Path(__file__).parent
ASSETS_DIR = SCRIPT_DIR.parent / "assets"
MAPS_DIR = ASSETS_DIR / "maps"
DATA_DIR = ASSETS_DIR / "data"
PALETTES_FILE = ASSETS_DIR / "palettes" / "palettes.json"
DEFAULT_ROM = Path(r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Soul Blazer (U) [!].sfc")


class TileRenderer:
	"""Render SNES 4BPP tiles to images."""

	# Default SNES palette (grayscale for debugging)
	DEFAULT_PALETTE = DEFAULT_PALETTES.get("grayscale", [(i * 17, i * 17, i * 17) for i in range(16)])

	# Soul Blazer-style palette (grassland theme)
	GRASSLAND_PALETTE = DEFAULT_PALETTES.get("grassland", [
		(0, 0, 0),        # 0 - transparent/black
		(40, 80, 40),     # 1 - dark grass
		(60, 120, 60),    # 2 - medium grass
		(100, 160, 80),   # 3 - light grass
		(140, 100, 60),   # 4 - dark dirt
		(180, 140, 100),  # 5 - light dirt
		(100, 100, 120),  # 6 - dark stone
		(160, 160, 180),  # 7 - light stone
		(60, 80, 140),    # 8 - dark water
		(100, 140, 200),  # 9 - light water
		(200, 160, 100),  # 10 - wood
		(240, 200, 160),  # 11 - light wood
		(255, 255, 200),  # 12 - highlight
		(180, 80, 80),    # 13 - red accent
		(80, 80, 180),    # 14 - blue accent
		(255, 255, 255),  # 15 - white
	])

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


class MapData:
	"""Manages map extraction data and pointer tables."""

	def __init__(self):
		self.pointer_tables: list[dict] = []
		self.map_headers: list[dict] = []
		self.tilesets: dict[int, bytes] = {}
		self.loaded = False

	def load_map_scan_results(self, path: Path) -> bool:
		"""Load map scan results JSON file."""
		try:
			with open(path, 'r') as f:
				data = json.load(f)
			self.pointer_tables = data.get('pointer_tables', [])
			self.map_headers = data.get('map_headers', [])
			self.loaded = True
			return True
		except Exception as e:
			print(f"Error loading map scan: {e}")
			return False

	def load_tileset(self, bank: int, path: Path) -> bool:
		"""Load tileset binary file."""
		try:
			with open(path, 'rb') as f:
				self.tilesets[bank] = f.read()
			return True
		except Exception as e:
			print(f"Error loading tileset {bank}: {e}")
			return False

	def get_pointer_table_info(self) -> list[str]:
		"""Get list of pointer table descriptions."""
		result = []
		for i, pt in enumerate(self.pointer_tables[:100]):  # Limit display
			bank = pt.get('bank', 0)
			offset = pt.get('offset', 0)
			count = pt.get('pointer_count', 0)
			result.append(f"Bank {bank:02X} @ ${offset:04X} ({count} ptrs)")
		return result


class MapViewer(tk.Tk):
	"""Main map viewer application."""

	# Area definitions with known map data locations
	AREA_DEFINITIONS = [
		{"name": "Grass Valley Underground", "tileset_bank": 10, "map_bank": 0},
		{"name": "Grass Valley Village", "tileset_bank": 10, "map_bank": 0},
		{"name": "Underground Castle B1", "tileset_bank": 10, "map_bank": 1},
		{"name": "Underground Castle B2", "tileset_bank": 10, "map_bank": 1},
		{"name": "Underground Castle B3", "tileset_bank": 10, "map_bank": 1},
		{"name": "Underground Castle B4", "tileset_bank": 10, "map_bank": 1},
		{"name": "GreenWood", "tileset_bank": 11, "map_bank": 2},
		{"name": "GreenWood Underground", "tileset_bank": 11, "map_bank": 2},
		{"name": "Water Shrine", "tileset_bank": 11, "map_bank": 2},
		{"name": "Fire Shrine", "tileset_bank": 11, "map_bank": 2},
		{"name": "Light Shrine", "tileset_bank": 11, "map_bank": 2},
		{"name": "Lost Marsh", "tileset_bank": 11, "map_bank": 2},
		{"name": "St. Elles Seabed", "tileset_bank": 12, "map_bank": 3},
		{"name": "St. Elles Underground", "tileset_bank": 12, "map_bank": 3},
		{"name": "Durean", "tileset_bank": 12, "map_bank": 3},
		{"name": "Ghost Ship", "tileset_bank": 12, "map_bank": 3},
		{"name": "Southerta", "tileset_bank": 12, "map_bank": 3},
		{"name": "Mermaid Palace", "tileset_bank": 12, "map_bank": 3},
		{"name": "Mountain of Souls", "tileset_bank": 13, "map_bank": 4},
		{"name": "Laynole", "tileset_bank": 13, "map_bank": 4},
		{"name": "Nome", "tileset_bank": 13, "map_bank": 4},
		{"name": "Lune", "tileset_bank": 13, "map_bank": 4},
		{"name": "Model Town 1", "tileset_bank": 14, "map_bank": 5},
		{"name": "Model Town 2", "tileset_bank": 14, "map_bank": 5},
		{"name": "Leo's Lab Basement", "tileset_bank": 14, "map_bank": 5},
		{"name": "Leo's Lab Attic", "tileset_bank": 14, "map_bank": 5},
		{"name": "Leo's Paintings", "tileset_bank": 14, "map_bank": 5},
		{"name": "Magridd Town", "tileset_bank": 14, "map_bank": 6},
		{"name": "Magridd Castle", "tileset_bank": 14, "map_bank": 6},
		{"name": "Castle Basement", "tileset_bank": 14, "map_bank": 6},
		{"name": "World of Evil", "tileset_bank": 14, "map_bank": 7},
		{"name": "Deathtoll's Lair", "tileset_bank": 14, "map_bank": 7},
	]

	def __init__(self):
		super().__init__()

		self.title("Soul Blazer Map Viewer")
		self.geometry("1200x800")

		self.rom_data: Optional[bytes] = None
		self.rom_path: Optional[str] = None
		self.current_map = None
		self.tile_renderer = TileRenderer()
		self.map_data = MapData()
		self.palette_manager = PaletteManager()
		self.current_palette_index = 0
		self.current_area_name = None
		self.tileset_image = None
		self.map_image = None
		self.bank_image = None
		self.zoom = 2
		self.current_tileset_bank = 10

		self.setup_ui()
		self.load_extracted_data()

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
		view_menu.add_separator()
		view_menu.add_command(label="Use Grayscale Palette", command=self.use_grayscale_palette)
		view_menu.add_command(label="Use Grassland Palette", command=self.use_grassland_palette)
		view_menu.add_separator()
		view_menu.add_command(label="Use Area Palette", command=self.use_area_palette)
		view_menu.add_command(label="Select Palette...", command=self.select_palette)

		data_menu = tk.Menu(menubar, tearoff=0)
		menubar.add_cascade(label="Data", menu=data_menu)
		data_menu.add_command(label="Reload Extracted Data", command=self.load_extracted_data)
		data_menu.add_command(label="Show Pointer Tables", command=self.show_pointer_tables)

		# Main paned window
		paned = ttk.PanedWindow(self, orient=tk.HORIZONTAL)
		paned.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)

		# Left panel - area list
		left_frame = ttk.Frame(paned, width=250)
		paned.add(left_frame, weight=0)

		ttk.Label(left_frame, text="Areas").pack(anchor=tk.W)

		self.area_list = tk.Listbox(left_frame, height=15)
		self.area_list.pack(fill=tk.BOTH, expand=True)
		self.area_list.bind('<<ListboxSelect>>', self.on_area_select)

		# Populate area list from definitions
		for area in self.AREA_DEFINITIONS:
			self.area_list.insert(tk.END, area["name"])

		# Tileset selection
		ttk.Separator(left_frame, orient=tk.HORIZONTAL).pack(fill=tk.X, pady=5)
		ttk.Label(left_frame, text="Tileset Bank").pack(anchor=tk.W)

		tileset_frame = ttk.Frame(left_frame)
		tileset_frame.pack(fill=tk.X)

		self.tileset_var = tk.StringVar(value="10")
		tileset_combo = ttk.Combobox(tileset_frame, textvariable=self.tileset_var, width=8,
									  values=["10", "11", "12", "13", "14"])
		tileset_combo.pack(side=tk.LEFT, padx=2)
		tileset_combo.bind('<<ComboboxSelected>>', self.on_tileset_select)

		ttk.Button(tileset_frame, text="Load", command=self.load_selected_tileset).pack(side=tk.LEFT)

		# Info panel
		ttk.Separator(left_frame, orient=tk.HORIZONTAL).pack(fill=tk.X, pady=5)
		ttk.Label(left_frame, text="Info").pack(anchor=tk.W)

		self.info_text = tk.Text(left_frame, height=8, width=30, state=tk.DISABLED)
		self.info_text.pack(fill=tk.X)

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
		ttk.Button(bank_controls, text="Export PNG", command=self.export_bank_png).pack(side=tk.LEFT, padx=5)

		self.bank_canvas = tk.Canvas(bank_frame, bg='#333')
		self.bank_canvas.pack(fill=tk.BOTH, expand=True)

		# Pointer tables tab
		ptr_frame = ttk.Frame(notebook)
		notebook.add(ptr_frame, text="Pointer Tables")

		self.ptr_list = tk.Listbox(ptr_frame, height=20)
		self.ptr_list.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)

		ptr_scroll = ttk.Scrollbar(ptr_frame, orient=tk.VERTICAL, command=self.ptr_list.yview)
		ptr_scroll.pack(side=tk.RIGHT, fill=tk.Y)
		self.ptr_list.configure(yscrollcommand=ptr_scroll.set)

		# Status bar
		self.status_var = tk.StringVar(value="No ROM loaded")
		status_bar = ttk.Label(self, textvariable=self.status_var, relief=tk.SUNKEN)
		status_bar.pack(fill=tk.X, side=tk.BOTTOM)

	def load_extracted_data(self):
		"""Load pre-extracted map data and tilesets."""
		# Load map scan results
		map_scan_path = MAPS_DIR / "map_scan_results.json"
		if map_scan_path.exists():
			if self.map_data.load_map_scan_results(map_scan_path):
				self.status_var.set(f"Loaded map scan: {len(self.map_data.pointer_tables)} pointer tables")
				self.populate_pointer_tables()

		# Load extracted tilesets
		for bank in [10, 11, 12, 13, 14]:
			tileset_path = MAPS_DIR / f"tileset_bank{bank}.bin"
			if tileset_path.exists():
				self.map_data.load_tileset(bank, tileset_path)

		self.update_info_panel()

	def populate_pointer_tables(self):
		"""Populate the pointer tables list."""
		self.ptr_list.delete(0, tk.END)
		for desc in self.map_data.get_pointer_table_info():
			self.ptr_list.insert(tk.END, desc)

	def update_info_panel(self):
		"""Update the info panel with current state."""
		self.info_text.config(state=tk.NORMAL)
		self.info_text.delete(1.0, tk.END)

		info_lines = []
		if self.rom_data:
			info_lines.append(f"ROM: {len(self.rom_data):,} bytes")
		else:
			info_lines.append("ROM: Not loaded")

		info_lines.append(f"Pointer Tables: {len(self.map_data.pointer_tables)}")
		info_lines.append(f"Tilesets: {len(self.map_data.tilesets)}")
		info_lines.append(f"Palettes: {self.palette_manager.palette_count}")
		info_lines.append(f"Zoom: {self.zoom}x")
		info_lines.append(f"Current Tileset: Bank {self.current_tileset_bank}")
		if self.current_area_name:
			info_lines.append(f"Area: {self.current_area_name}")
		if self.current_palette_index >= 0:
			info_lines.append(f"Palette: #{self.current_palette_index}")

		self.info_text.insert(tk.END, "\n".join(info_lines))
		self.info_text.config(state=tk.DISABLED)

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
		"""Load tileset from bank - uses extracted data if available, else ROM."""
		# Try extracted tileset first
		if bank in self.map_data.tilesets:
			tileset_data = self.map_data.tilesets[bank]
			self.status_var.set(f"Loaded extracted tileset bank {bank}")
		elif self.rom_data:
			# Fall back to ROM
			start = bank * 0x8000
			end = start + 0x4000  # 16KB of tile data
			tileset_data = self.rom_data[start:end]
			self.status_var.set(f"Loaded tileset from ROM bank {bank}")
		else:
			self.status_var.set("No tileset data available")
			return

		self.current_tileset_bank = bank

		# Render tileset
		img = self.tile_renderer.render_tileset(tileset_data, 16, self.zoom)
		self.tileset_image = ImageTk.PhotoImage(img)

		self.tileset_canvas.delete("all")
		self.tileset_canvas.create_image(0, 0, anchor=tk.NW, image=self.tileset_image)
		self.tileset_canvas.configure(scrollregion=self.tileset_canvas.bbox("all"))
		self.update_info_panel()

	def on_tileset_select(self, event=None):
		"""Handle tileset combobox selection."""
		try:
			bank = int(self.tileset_var.get())
			self.load_tileset(bank)
		except ValueError:
			pass

	def load_selected_tileset(self):
		"""Load the currently selected tileset."""
		self.on_tileset_select()

	def view_bank(self):
		"""View graphics from selected bank."""
		if not self.rom_data:
			# Check if we have extracted tilesets
			if self.map_data.tilesets:
				bank = int(self.bank_var.get())
				if bank in self.map_data.tilesets:
					data = self.map_data.tilesets[bank]
					img = self.tile_renderer.render_tileset(data, 16, self.zoom)
					self.bank_image_pil = img
					self.bank_image = ImageTk.PhotoImage(img)
					self.bank_canvas.delete("all")
					self.bank_canvas.create_image(0, 0, anchor=tk.NW, image=self.bank_image)
					self.bank_canvas.configure(scrollregion=self.bank_canvas.bbox("all"))
					self.status_var.set(f"Viewing extracted tileset bank {bank}")
					return
			return

		try:
			bank = int(self.bank_var.get())
			if 0 <= bank < 32:
				start = bank * 0x8000
				end = start + 0x8000
				data = self.rom_data[start:end]

				# Render as tileset
				img = self.tile_renderer.render_tileset(data, 16, self.zoom)
				self.bank_image_pil = img
				self.bank_image = ImageTk.PhotoImage(img)

				self.bank_canvas.delete("all")
				self.bank_canvas.create_image(0, 0, anchor=tk.NW, image=self.bank_image)
				self.bank_canvas.configure(scrollregion=self.bank_canvas.bbox("all"))

				self.status_var.set(f"Viewing ROM bank ${bank:02x}")
		except ValueError:
			pass

	def on_area_select(self, event):
		"""Handle area selection."""
		selection = self.area_list.curselection()
		if selection:
			area_idx = selection[0]
			area = self.AREA_DEFINITIONS[area_idx]
			area_name = area["name"]
			tileset_bank = area["tileset_bank"]

			self.current_area_name = area_name
			self.status_var.set(f"Selected: {area_name} (Tileset Bank {tileset_bank})")

			# Load the appropriate tileset for this area
			self.tileset_var.set(str(tileset_bank))
			self.load_tileset(tileset_bank)

			# Auto-apply area palette if available
			palettes = self.palette_manager.get_palettes_for_area(area_name)
			if palettes and len(palettes) > 0:
				self.tile_renderer.palette = palettes[0]
				self.status_var.set(f"Selected: {area_name} (Palette auto-applied)")
				self.refresh_views()

	def set_zoom(self, zoom: int):
		"""Set zoom level."""
		self.zoom = max(1, min(4, zoom))
		self.update_info_panel()
		# Refresh current view
		if self.rom_data or self.map_data.tilesets:
			self.load_tileset(self.current_tileset_bank)
		self.view_bank()

	def use_grayscale_palette(self):
		"""Switch to grayscale palette."""
		self.tile_renderer.palette = TileRenderer.DEFAULT_PALETTE
		self.current_palette_index = -1  # Indicate custom palette
		self.refresh_views()

	def use_grassland_palette(self):
		"""Switch to grassland palette."""
		self.tile_renderer.palette = TileRenderer.GRASSLAND_PALETTE
		self.current_palette_index = -2  # Indicate custom palette
		self.refresh_views()

	def use_area_palette(self):
		"""Use palette associated with current area from extracted data."""
		if not self.current_area_name:
			messagebox.showinfo("Info", "Select an area first")
			return

		palettes = self.palette_manager.get_palettes_for_area(self.current_area_name)
		if palettes:
			self.tile_renderer.palette = palettes[0]
			self.status_var.set(f"Applied palette for {self.current_area_name}")
			self.refresh_views()
		else:
			messagebox.showinfo("Info", f"No palette mapping for {self.current_area_name}")

	def select_palette(self):
		"""Open palette selection dialog."""
		if self.palette_manager.palette_count == 0:
			messagebox.showinfo("Info", "No palettes loaded")
			return

		# Create palette selection dialog
		dialog = tk.Toplevel(self)
		dialog.title("Select Palette")
		dialog.geometry("400x500")
		dialog.transient(self)

		ttk.Label(dialog, text="Available Palettes:").pack(anchor=tk.W, padx=5, pady=5)

		# Listbox with palettes
		listbox_frame = ttk.Frame(dialog)
		listbox_frame.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)

		listbox = tk.Listbox(listbox_frame, height=20)
		listbox.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)

		scrollbar = ttk.Scrollbar(listbox_frame, orient=tk.VERTICAL, command=listbox.yview)
		scrollbar.pack(side=tk.RIGHT, fill=tk.Y)
		listbox.configure(yscrollcommand=scrollbar.set)

		# Populate with palette info
		for i in range(self.palette_manager.palette_count):
			info = self.palette_manager.get_palette_info(i)
			name = info.get('name', f'Palette {i}')
			offset = info.get('rom_offset', 0)
			listbox.insert(tk.END, f"{i}: {name} (${offset:06x})")

		# Preview canvas
		preview_canvas = tk.Canvas(dialog, height=32, bg='#333')
		preview_canvas.pack(fill=tk.X, padx=5, pady=5)

		def update_preview(event=None):
			selection = listbox.curselection()
			if not selection:
				return
			idx = selection[0]
			palette = self.palette_manager.get_palette(idx)

			preview_canvas.delete("all")
			for i, color in enumerate(palette[:16]):
				x = i * 24
				# Convert to hex color string
				hex_color = f"#{color[0]:02x}{color[1]:02x}{color[2]:02x}"
				preview_canvas.create_rectangle(x, 0, x + 24, 32, fill=hex_color, outline="white")

		listbox.bind('<<ListboxSelect>>', update_preview)

		def apply_palette():
			selection = listbox.curselection()
			if not selection:
				return
			idx = selection[0]
			palette = self.palette_manager.get_palette(idx)
			self.tile_renderer.palette = palette
			self.current_palette_index = idx
			self.status_var.set(f"Applied palette {idx}")
			self.refresh_views()
			dialog.destroy()

		button_frame = ttk.Frame(dialog)
		button_frame.pack(fill=tk.X, padx=5, pady=5)

		ttk.Button(button_frame, text="Apply", command=apply_palette).pack(side=tk.LEFT, padx=5)
		ttk.Button(button_frame, text="Cancel", command=dialog.destroy).pack(side=tk.RIGHT, padx=5)

	def refresh_views(self):
		"""Refresh all views with current palette."""
		if self.rom_data or self.map_data.tilesets:
			self.load_tileset(self.current_tileset_bank)
		if self.rom_data:
			self.view_bank()

	def show_pointer_tables(self):
		"""Show pointer table information dialog."""
		if not self.map_data.pointer_tables:
			messagebox.showinfo("Info", "No pointer table data loaded")
			return

		# Create popup window
		popup = tk.Toplevel(self)
		popup.title("Pointer Table Details")
		popup.geometry("600x400")

		text = tk.Text(popup, wrap=tk.NONE)
		text.pack(fill=tk.BOTH, expand=True)

		h_scroll = ttk.Scrollbar(popup, orient=tk.HORIZONTAL, command=text.xview)
		h_scroll.pack(fill=tk.X, side=tk.BOTTOM)
		v_scroll = ttk.Scrollbar(popup, orient=tk.VERTICAL, command=text.yview)
		v_scroll.pack(fill=tk.Y, side=tk.RIGHT)
		text.configure(xscrollcommand=h_scroll.set, yscrollcommand=v_scroll.set)

		# Show first 50 pointer tables
		text.insert(tk.END, f"Total Pointer Tables: {len(self.map_data.pointer_tables)}\n\n")
		text.insert(tk.END, f"{'Bank':<6}{'Offset':<10}{'FileOff':<10}{'Count':<8}{'FirstPtr':<12}{'Range':<10}\n")
		text.insert(tk.END, "-" * 56 + "\n")

		for pt in self.map_data.pointer_tables[:50]:
			text.insert(tk.END, f"{pt.get('bank', 0):<6}")
			text.insert(tk.END, f"${pt.get('offset', 0):04X}    ")
			text.insert(tk.END, f"${pt.get('file_offset', 0):05X}   ")
			text.insert(tk.END, f"{pt.get('pointer_count', 0):<8}")
			text.insert(tk.END, f"${pt.get('first_ptr', 0):04X}      ")
			text.insert(tk.END, f"{pt.get('ptr_range', 0):<10}\n")

	def export_bank_png(self):
		"""Export current bank view as PNG."""
		if not hasattr(self, 'bank_image_pil') or not self.bank_image_pil:
			messagebox.showwarning("Warning", "No bank loaded to export")
			return

		bank = int(self.bank_var.get())
		path = filedialog.asksaveasfilename(
			title="Export Bank Graphics",
			defaultextension=".png",
			initialfile=f"bank{bank:02d}_graphics.png",
			filetypes=[("PNG Image", "*.png"), ("All files", "*.*")]
		)
		if path:
			self.bank_image_pil.save(path)
			self.status_var.set(f"Exported: {Path(path).name}")

	def export_map(self):
		"""Export current tileset as image."""
		# Get the current tileset image if available
		if hasattr(self, 'tileset_image_pil') and self.tileset_image_pil:
			img = self.tileset_image_pil
		elif self.map_data.tilesets and self.current_tileset_bank in self.map_data.tilesets:
			data = self.map_data.tilesets[self.current_tileset_bank]
			img = self.tile_renderer.render_tileset(data, 16, self.zoom)
		else:
			messagebox.showwarning("Warning", "No tileset to export")
			return

		path = filedialog.asksaveasfilename(
			title="Export Tileset",
			defaultextension=".png",
			initialfile=f"tileset_bank{self.current_tileset_bank:02d}.png",
			filetypes=[("PNG Image", "*.png"), ("All files", "*.*")]
		)
		if path:
			img.save(path)
			self.status_var.set(f"Exported: {Path(path).name}")


def main():
	app = MapViewer()

	# Try to load default ROM if it exists
	if DEFAULT_ROM.exists():
		app.load_rom(str(DEFAULT_ROM))
	else:
		# Still usable with extracted data only
		app.status_var.set("No ROM loaded - using extracted data")

	# Load first tileset if available
	if app.map_data.tilesets:
		app.load_tileset(10)

	app.mainloop()


if __name__ == '__main__':
	main()
