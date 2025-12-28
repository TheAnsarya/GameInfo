#!/usr/bin/env python3
"""
Soul Blazer (SNES) Sprite Viewer
Visual sprite viewer for game entities and characters.
"""

import json
import struct
import tkinter as tk
from tkinter import ttk, filedialog, messagebox
from pathlib import Path
from typing import Optional

try:
	from PIL import Image, ImageTk
except ImportError:
	print("PIL (Pillow) required: pip install Pillow")
	raise


# Paths
SCRIPT_DIR = Path(__file__).parent
ASSETS_DIR = SCRIPT_DIR.parent / "assets"
SPRITES_DIR = ASSETS_DIR / "sprites"
PALETTES_FILE = ASSETS_DIR / "palettes" / "palettes.json"
DEFAULT_ROM = Path(r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Soul Blazer (U) [!].sfc")


class SpriteDecoder:
	"""Decode SNES sprites from ROM data."""

	def __init__(self):
		self.palettes = []
		self._load_palettes()

	def _load_palettes(self):
		"""Load extracted palettes."""
		if not PALETTES_FILE.exists():
			self.palettes = [[(i * 17, i * 17, i * 17) for i in range(16)]] * 16
			return

		with open(PALETTES_FILE, 'r') as f:
			data = json.load(f)

		for pal_data in data.get('palettes', []):
			colors = pal_data.get('colors_rgb', [])
			palette = []
			for color in colors[:16]:
				if isinstance(color, list) and len(color) >= 3:
					palette.append((color[0], color[1], color[2]))
				else:
					palette.append((0, 0, 0))
			while len(palette) < 16:
				palette.append((0, 0, 0))
			self.palettes.append(palette)

	def get_palette(self, index: int) -> list[tuple[int, int, int]]:
		"""Get palette by index."""
		if 0 <= index < len(self.palettes):
			return self.palettes[index]
		return [(i * 17, i * 17, i * 17) for i in range(16)]

	def decode_4bpp_tile(self, data: bytes, offset: int = 0) -> list[list[int]]:
		"""Decode 8x8 4BPP tile."""
		tile = [[0] * 8 for _ in range(8)]

		for row in range(8):
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

	def render_tile(
		self,
		data: bytes,
		tile_num: int,
		palette: list[tuple[int, int, int]],
		flip_x: bool = False,
		flip_y: bool = False,
		scale: int = 1
	) -> Image.Image:
		"""Render a single tile to image."""
		offset = tile_num * 32
		tile_data = self.decode_4bpp_tile(data, offset)

		img = Image.new('RGBA', (8 * scale, 8 * scale))
		pixels = img.load()

		for y in range(8):
			for x in range(8):
				src_y = 7 - y if flip_y else y
				src_x = 7 - x if flip_x else x
				color_idx = tile_data[src_y][src_x]

				if color_idx == 0:
					color = (0, 0, 0, 0)
				else:
					r, g, b = palette[color_idx]
					color = (r, g, b, 255)

				for sy in range(scale):
					for sx in range(scale):
						pixels[x * scale + sx, y * scale + sy] = color

		return img

	def render_sprite_sheet(
		self,
		data: bytes,
		tiles_per_row: int = 16,
		palette: list[tuple[int, int, int]] = None,
		scale: int = 2
	) -> Image.Image:
		"""Render tileset as sprite sheet."""
		if palette is None:
			palette = self.get_palette(0)

		num_tiles = len(data) // 32
		rows = (num_tiles + tiles_per_row - 1) // tiles_per_row

		img = Image.new('RGBA', (tiles_per_row * 8 * scale, rows * 8 * scale), (40, 40, 40, 255))

		for i in range(num_tiles):
			tile = self.render_tile(data, i, palette, scale=scale)
			x = (i % tiles_per_row) * 8 * scale
			y = (i // tiles_per_row) * 8 * scale
			img.paste(tile, (x, y), tile)

		return img


class SpriteDatabase:
	"""Database of known Soul Blazer sprites."""

	# Character sprites
	CHARACTERS = {
		"Player (Walk Right)": {"bank": 0x15, "offset": 0x0000, "tiles": 4},
		"Player (Walk Left)": {"bank": 0x15, "offset": 0x0080, "tiles": 4},
		"Player (Walk Up)": {"bank": 0x15, "offset": 0x0100, "tiles": 4},
		"Player (Walk Down)": {"bank": 0x15, "offset": 0x0180, "tiles": 4},
		"Player (Attack)": {"bank": 0x15, "offset": 0x0200, "tiles": 8},
		"Player (Magic)": {"bank": 0x15, "offset": 0x0400, "tiles": 4},
	}

	# Enemy sprites by area
	ENEMIES = {
		"Golem": {"bank": 0x16, "offset": 0x0000, "tiles": 4},
		"Blue Metal": {"bank": 0x16, "offset": 0x0080, "tiles": 4},
		"Armored Knight": {"bank": 0x16, "offset": 0x0100, "tiles": 8},
		"Blue Slime": {"bank": 0x16, "offset": 0x0200, "tiles": 4},
		"Skeleton": {"bank": 0x16, "offset": 0x0280, "tiles": 4},
		"Ghost": {"bank": 0x16, "offset": 0x0300, "tiles": 4},
		"Fish": {"bank": 0x17, "offset": 0x0000, "tiles": 4},
		"Jellyfish": {"bank": 0x17, "offset": 0x0080, "tiles": 4},
		"Eagle": {"bank": 0x17, "offset": 0x0200, "tiles": 4},
	}

	# Boss sprites
	BOSSES = {
		"Metal Mantis": {"bank": 0x17, "offset": 0x1000, "tiles": 32},
		"Plantentacle": {"bank": 0x17, "offset": 0x1800, "tiles": 32},
		"Poseidon": {"bank": 0x18, "offset": 0x0000, "tiles": 48},
		"Stone Guardian": {"bank": 0x18, "offset": 0x0C00, "tiles": 32},
		"Tin Doll": {"bank": 0x18, "offset": 0x1400, "tiles": 32},
		"Deathtoll": {"bank": 0x19, "offset": 0x0000, "tiles": 64},
	}

	@classmethod
	def get_all_sprites(cls) -> dict:
		"""Get all sprite definitions."""
		return {
			**{"[Player] " + k: v for k, v in cls.CHARACTERS.items()},
			**{"[Enemy] " + k: v for k, v in cls.ENEMIES.items()},
			**{"[Boss] " + k: v for k, v in cls.BOSSES.items()},
		}


class SpriteViewer(tk.Tk):
	"""GUI for viewing Soul Blazer sprites."""

	def __init__(self):
		super().__init__()

		self.title("Soul Blazer Sprite Viewer")
		self.geometry("1000x700")

		self.rom_data: Optional[bytes] = None
		self.decoder = SpriteDecoder()
		self.current_image = None
		self.current_bank = 0x15
		self.scale = 2
		self.current_palette = 50  # Default sprite palette

		self._setup_ui()
		self._load_default_rom()

	def _setup_ui(self):
		"""Create the user interface."""
		# Menu bar
		menubar = tk.Menu(self)
		self.config(menu=menubar)

		file_menu = tk.Menu(menubar, tearoff=0)
		menubar.add_cascade(label="File", menu=file_menu)
		file_menu.add_command(label="Open ROM...", command=self._open_rom)
		file_menu.add_separator()
		file_menu.add_command(label="Export Current...", command=self._export_current)
		file_menu.add_command(label="Export All Sprites...", command=self._export_all)
		file_menu.add_separator()
		file_menu.add_command(label="Exit", command=self.quit)

		view_menu = tk.Menu(menubar, tearoff=0)
		menubar.add_cascade(label="View", menu=view_menu)
		view_menu.add_command(label="Zoom In", command=lambda: self._set_scale(self.scale + 1))
		view_menu.add_command(label="Zoom Out", command=lambda: self._set_scale(self.scale - 1))

		# Main layout
		main_pane = ttk.PanedWindow(self, orient=tk.HORIZONTAL)
		main_pane.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)

		# Left panel - sprite list
		left_frame = ttk.Frame(main_pane, width=250)
		main_pane.add(left_frame, weight=0)

		ttk.Label(left_frame, text="Sprites").pack(anchor=tk.W)

		self.sprite_list = tk.Listbox(left_frame, height=20)
		self.sprite_list.pack(fill=tk.BOTH, expand=True)
		self.sprite_list.bind('<<ListboxSelect>>', self._on_sprite_select)

		# Populate sprite list
		for name in SpriteDatabase.get_all_sprites().keys():
			self.sprite_list.insert(tk.END, name)

		# Bank selector
		ttk.Separator(left_frame, orient=tk.HORIZONTAL).pack(fill=tk.X, pady=5)
		ttk.Label(left_frame, text="Manual Bank View").pack(anchor=tk.W)

		bank_frame = ttk.Frame(left_frame)
		bank_frame.pack(fill=tk.X)

		ttk.Label(bank_frame, text="Bank:").pack(side=tk.LEFT)
		self.bank_var = tk.StringVar(value="15")
		bank_spin = ttk.Spinbox(bank_frame, from_=0, to=31, width=5, textvariable=self.bank_var)
		bank_spin.pack(side=tk.LEFT, padx=5)
		ttk.Button(bank_frame, text="View", command=self._view_bank).pack(side=tk.LEFT)

		# Palette selector
		ttk.Separator(left_frame, orient=tk.HORIZONTAL).pack(fill=tk.X, pady=5)
		ttk.Label(left_frame, text="Palette").pack(anchor=tk.W)

		palette_frame = ttk.Frame(left_frame)
		palette_frame.pack(fill=tk.X)

		self.palette_var = tk.StringVar(value="50")
		palette_spin = ttk.Spinbox(palette_frame, from_=0, to=169, width=5, textvariable=self.palette_var)
		palette_spin.pack(side=tk.LEFT, padx=5)
		ttk.Button(palette_frame, text="Apply", command=self._refresh_view).pack(side=tk.LEFT)

		# Right panel - sprite display
		right_frame = ttk.Frame(main_pane)
		main_pane.add(right_frame, weight=1)

		# Canvas with scrollbars
		canvas_frame = ttk.Frame(right_frame)
		canvas_frame.pack(fill=tk.BOTH, expand=True)

		self.canvas = tk.Canvas(canvas_frame, bg='#333')
		self.canvas.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)

		h_scroll = ttk.Scrollbar(canvas_frame, orient=tk.HORIZONTAL, command=self.canvas.xview)
		h_scroll.pack(side=tk.BOTTOM, fill=tk.X)
		v_scroll = ttk.Scrollbar(canvas_frame, orient=tk.VERTICAL, command=self.canvas.yview)
		v_scroll.pack(side=tk.RIGHT, fill=tk.Y)

		self.canvas.configure(xscrollcommand=h_scroll.set, yscrollcommand=v_scroll.set)

		# Status bar
		self.status_var = tk.StringVar(value="No ROM loaded")
		status = ttk.Label(self, textvariable=self.status_var, relief=tk.SUNKEN)
		status.pack(fill=tk.X, side=tk.BOTTOM)

	def _load_default_rom(self):
		"""Try to load default ROM."""
		if DEFAULT_ROM.exists():
			self._load_rom(str(DEFAULT_ROM))

	def _open_rom(self):
		"""Open ROM file dialog."""
		path = filedialog.askopenfilename(
			title="Open ROM",
			filetypes=[("SNES ROM", "*.sfc *.smc"), ("All files", "*.*")]
		)
		if path:
			self._load_rom(path)

	def _load_rom(self, path: str):
		"""Load ROM file."""
		try:
			with open(path, 'rb') as f:
				self.rom_data = f.read()
			self.status_var.set(f"Loaded: {Path(path).name} ({len(self.rom_data):,} bytes)")
			self._view_bank()
		except Exception as e:
			messagebox.showerror("Error", f"Failed to load ROM: {e}")

	def _view_bank(self):
		"""View sprites from selected bank."""
		if not self.rom_data:
			return

		try:
			bank = int(self.bank_var.get(), 16 if self.bank_var.get().startswith("0x") else 10)
		except ValueError:
			bank = 0x15

		self.current_bank = bank

		# Extract bank data (LoROM)
		start = bank * 0x8000
		end = start + 0x8000
		bank_data = self.rom_data[start:end]

		# Get palette
		try:
			palette_idx = int(self.palette_var.get())
		except ValueError:
			palette_idx = 50
		palette = self.decoder.get_palette(palette_idx)

		# Render sprite sheet
		img = self.decoder.render_sprite_sheet(bank_data, 16, palette, self.scale)

		self._display_image(img)
		self.status_var.set(f"Bank ${bank:02X}: {len(bank_data):,} bytes, {len(bank_data)//32} tiles")

	def _on_sprite_select(self, event):
		"""Handle sprite list selection."""
		selection = self.sprite_list.curselection()
		if not selection or not self.rom_data:
			return

		sprite_name = self.sprite_list.get(selection[0])
		sprites = SpriteDatabase.get_all_sprites()
		sprite_info = sprites.get(sprite_name)

		if not sprite_info:
			return

		bank = sprite_info["bank"]
		offset = sprite_info["offset"]
		tiles = sprite_info["tiles"]

		# Extract sprite data
		start = bank * 0x8000 + offset
		size = tiles * 32
		sprite_data = self.rom_data[start:start + size]

		# Get palette
		try:
			palette_idx = int(self.palette_var.get())
		except ValueError:
			palette_idx = 50
		palette = self.decoder.get_palette(palette_idx)

		# Render
		cols = min(tiles, 8)
		img = self.decoder.render_sprite_sheet(sprite_data, cols, palette, self.scale)

		self._display_image(img)
		self.status_var.set(f"{sprite_name}: Bank ${bank:02X}, Offset ${offset:04X}, {tiles} tiles")

	def _display_image(self, img: Image.Image):
		"""Display image on canvas."""
		self.current_image = ImageTk.PhotoImage(img)
		self.canvas.delete("all")
		self.canvas.create_image(0, 0, anchor=tk.NW, image=self.current_image)
		self.canvas.configure(scrollregion=self.canvas.bbox("all"))

	def _set_scale(self, scale: int):
		"""Set zoom scale."""
		self.scale = max(1, min(8, scale))
		self._refresh_view()

	def _refresh_view(self):
		"""Refresh current view with new settings."""
		selection = self.sprite_list.curselection()
		if selection:
			self._on_sprite_select(None)
		else:
			self._view_bank()

	def _export_current(self):
		"""Export current sprite to PNG."""
		if not self.current_image:
			return

		path = filedialog.asksaveasfilename(
			title="Export Sprite",
			defaultextension=".png",
			filetypes=[("PNG Image", "*.png")]
		)
		if path:
			# Get PIL image from current render
			self._refresh_view()
			# Would need to keep reference to PIL image, not just PhotoImage

	def _export_all(self):
		"""Export all known sprites to folder."""
		if not self.rom_data:
			messagebox.showwarning("Warning", "No ROM loaded")
			return

		folder = filedialog.askdirectory(title="Select Export Folder")
		if not folder:
			return

		output_dir = Path(folder)
		output_dir.mkdir(parents=True, exist_ok=True)

		try:
			palette_idx = int(self.palette_var.get())
		except ValueError:
			palette_idx = 50
		palette = self.decoder.get_palette(palette_idx)

		count = 0
		for name, info in SpriteDatabase.get_all_sprites().items():
			bank = info["bank"]
			offset = info["offset"]
			tiles = info["tiles"]

			start = bank * 0x8000 + offset
			size = tiles * 32
			sprite_data = self.rom_data[start:start + size]

			cols = min(tiles, 8)
			img = self.decoder.render_sprite_sheet(sprite_data, cols, palette, self.scale)

			# Sanitize filename
			filename = name.replace("[", "").replace("]", "").replace(" ", "_") + ".png"
			img.save(output_dir / filename)
			count += 1

		messagebox.showinfo("Export Complete", f"Exported {count} sprites to {folder}")


def main():
	"""Main entry point."""
	app = SpriteViewer()
	app.mainloop()


if __name__ == "__main__":
	main()
