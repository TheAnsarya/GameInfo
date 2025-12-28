#!/usr/bin/env python3
"""
Soul Blazer (SNES) Dialog Editor
GUI editor for game text and dialogue strings.
"""

import json
import re
from pathlib import Path
from dataclasses import dataclass, field
from typing import Optional
from enum import IntEnum

try:
	import tkinter as tk
	from tkinter import ttk, filedialog, messagebox, scrolledtext
	HAS_TK = True
except ImportError:
	HAS_TK = False


# Paths
SCRIPT_DIR = Path(__file__).parent
ASSETS_DIR = SCRIPT_DIR.parent / "assets"
TEXT_DIR = ASSETS_DIR / "text"
DEFAULT_ROM = Path(r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Soul Blazer (U) [!].sfc")


class ControlCode(IntEnum):
	"""Text control codes."""
	END = 0x00
	NEWLINE = 0x01
	PAUSE = 0x02
	CLEAR = 0x03
	PLAYER_NAME = 0x04
	ITEM_NAME = 0x05
	NUMBER = 0x06
	WAIT_INPUT = 0x07
	SPEED_SLOW = 0x08
	SPEED_NORMAL = 0x09
	SPEED_FAST = 0x0A
	COLOR_WHITE = 0x0B
	COLOR_YELLOW = 0x0C
	COLOR_RED = 0x0D
	SOUND_EFFECT = 0x0E
	DELAY = 0x0F


@dataclass
class DialogEntry:
	"""Single dialog text entry."""
	id: int
	offset: int
	raw_bytes: bytes
	text: str
	speaker: str = ""
	location: str = ""
	notes: str = ""
	modified: bool = False


@dataclass
class DialogBlock:
	"""Collection of related dialog entries."""
	block_id: int
	name: str
	entries: list[DialogEntry] = field(default_factory=list)
	category: str = "General"


class TextCodec:
	"""Encode/decode Soul Blazer text."""

	# Character table (simplified - actual game uses custom encoding)
	DECODE_TABLE = {
		0x00: "[END]",
		0x01: "\n",
		0x02: "[PAUSE]",
		0x03: "[CLEAR]",
		0x04: "[HERO]",
		0x05: "[ITEM]",
		0x06: "[NUM]",
		0x07: "[WAIT]",
		0x08: "[SLOW]",
		0x09: "[NORM]",
		0x0A: "[FAST]",
		0x0B: "[WHITE]",
		0x0C: "[YELLOW]",
		0x0D: "[RED]",
		0x0E: "[SFX]",
		0x0F: "[DELAY]",
		# Space and punctuation
		0x10: " ",
		0x11: "!",
		0x12: "?",
		0x13: ".",
		0x14: ",",
		0x15: "'",
		0x16: '"',
		0x17: ":",
		0x18: ";",
		0x19: "-",
		0x1A: "(",
		0x1B: ")",
		0x1C: "/",
		0x1D: "&",
		0x1E: "%",
		0x1F: "#",
		# Numbers
		0x20: "0", 0x21: "1", 0x22: "2", 0x23: "3", 0x24: "4",
		0x25: "5", 0x26: "6", 0x27: "7", 0x28: "8", 0x29: "9",
		# Uppercase letters
		0x30: "A", 0x31: "B", 0x32: "C", 0x33: "D", 0x34: "E",
		0x35: "F", 0x36: "G", 0x37: "H", 0x38: "I", 0x39: "J",
		0x3A: "K", 0x3B: "L", 0x3C: "M", 0x3D: "N", 0x3E: "O",
		0x3F: "P", 0x40: "Q", 0x41: "R", 0x42: "S", 0x43: "T",
		0x44: "U", 0x45: "V", 0x46: "W", 0x47: "X", 0x48: "Y",
		0x49: "Z",
		# Lowercase letters
		0x50: "a", 0x51: "b", 0x52: "c", 0x53: "d", 0x54: "e",
		0x55: "f", 0x56: "g", 0x57: "h", 0x58: "i", 0x59: "j",
		0x5A: "k", 0x5B: "l", 0x5C: "m", 0x5D: "n", 0x5E: "o",
		0x5F: "p", 0x60: "q", 0x61: "r", 0x62: "s", 0x63: "t",
		0x64: "u", 0x65: "v", 0x66: "w", 0x67: "x", 0x68: "y",
		0x69: "z",
	}

	# Reverse table for encoding
	ENCODE_TABLE = {}

	@classmethod
	def _build_encode_table(cls):
		"""Build encoding table from decode table."""
		if not cls.ENCODE_TABLE:
			for code, char in cls.DECODE_TABLE.items():
				if not char.startswith("["):
					cls.ENCODE_TABLE[char] = code
			# Control codes
			cls.ENCODE_TABLE["[END]"] = 0x00
			cls.ENCODE_TABLE["\n"] = 0x01
			cls.ENCODE_TABLE["[PAUSE]"] = 0x02
			cls.ENCODE_TABLE["[CLEAR]"] = 0x03
			cls.ENCODE_TABLE["[HERO]"] = 0x04
			cls.ENCODE_TABLE["[ITEM]"] = 0x05
			cls.ENCODE_TABLE["[NUM]"] = 0x06
			cls.ENCODE_TABLE["[WAIT]"] = 0x07

	@classmethod
	def decode(cls, data: bytes) -> str:
		"""Decode bytes to text string."""
		result = []
		for byte in data:
			if byte in cls.DECODE_TABLE:
				result.append(cls.DECODE_TABLE[byte])
			else:
				result.append(f"[${byte:02X}]")
		return "".join(result)

	@classmethod
	def encode(cls, text: str) -> bytes:
		"""Encode text string to bytes."""
		cls._build_encode_table()
		result = bytearray()

		i = 0
		while i < len(text):
			# Check for control codes [XXX]
			if text[i] == "[":
				end = text.find("]", i)
				if end != -1:
					code = text[i:end + 1]
					if code in cls.ENCODE_TABLE:
						result.append(cls.ENCODE_TABLE[code])
					elif code.startswith("[$") and code.endswith("]"):
						# Raw hex code
						try:
							result.append(int(code[2:-1], 16))
						except ValueError:
							result.append(0x10)  # Space as fallback
					i = end + 1
					continue

			# Regular character
			char = text[i]
			if char in cls.ENCODE_TABLE:
				result.append(cls.ENCODE_TABLE[char])
			else:
				result.append(0x10)  # Space for unknown
			i += 1

		return bytes(result)


class DialogExtractor:
	"""Extract dialog from ROM."""

	# Text bank locations
	TEXT_BANKS = [
		(0x02, 0x0000, 0x8000, "Main dialogue"),
		(0x03, 0x0000, 0x8000, "NPC dialogue"),
		(0x04, 0x0000, 0x4000, "System text"),
	]

	# Pointer table locations
	POINTER_TABLES = [
		(0x02, 0x0000, 256, "Dialogue pointers"),
		(0x03, 0x0000, 128, "NPC text pointers"),
	]

	def __init__(self, rom_path: str = None):
		"""Initialize extractor."""
		self.rom_data: Optional[bytes] = None
		self.blocks: list[DialogBlock] = []
		self.codec = TextCodec()

		if rom_path:
			self.load_rom(rom_path)

	def load_rom(self, path: str) -> bool:
		"""Load ROM file."""
		try:
			with open(path, 'rb') as f:
				self.rom_data = f.read()
			return True
		except Exception as e:
			print(f"Error loading ROM: {e}")
			return False

	def _bank_offset(self, bank: int, addr: int = 0) -> int:
		"""Convert bank:address to file offset."""
		return bank * 0x8000 + (addr & 0x7fff)

	def _read_word(self, offset: int) -> int:
		"""Read 16-bit word from ROM."""
		if offset + 1 >= len(self.rom_data):
			return 0
		return self.rom_data[offset] | (self.rom_data[offset + 1] << 8)

	def extract_string_at(self, offset: int, max_len: int = 256) -> tuple[bytes, str]:
		"""Extract text string at offset."""
		data = bytearray()
		for i in range(max_len):
			if offset + i >= len(self.rom_data):
				break
			byte = self.rom_data[offset + i]
			data.append(byte)
			if byte == 0x00:  # End marker
				break

		return bytes(data), self.codec.decode(data)

	def extract_all_dialog(self) -> list[DialogBlock]:
		"""Extract all dialog from ROM."""
		self.blocks = []
		entry_id = 0

		for bank, start, length, name in self.TEXT_BANKS:
			block = DialogBlock(
				block_id=bank,
				name=name,
				category="Dialogue" if "dialogue" in name.lower() else "System",
			)

			base_offset = self._bank_offset(bank, start)

			# Scan for text strings
			offset = base_offset
			end_offset = base_offset + length

			while offset < end_offset:
				# Look for start of text (non-zero byte that could be text)
				if self.rom_data[offset] == 0x00:
					offset += 1
					continue

				# Try to extract text
				raw_bytes, text = self.extract_string_at(offset)

				if len(raw_bytes) > 2 and text.strip():
					entry = DialogEntry(
						id=entry_id,
						offset=offset,
						raw_bytes=raw_bytes,
						text=text,
					)
					block.entries.append(entry)
					entry_id += 1
					offset += len(raw_bytes)
				else:
					offset += 1

			if block.entries:
				self.blocks.append(block)

		return self.blocks

	def export_to_json(self, output_path: Path) -> None:
		"""Export dialog to JSON file."""
		data = {
			"block_count": len(self.blocks),
			"total_entries": sum(len(b.entries) for b in self.blocks),
			"blocks": []
		}

		for block in self.blocks:
			block_data = {
				"block_id": block.block_id,
				"name": block.name,
				"category": block.category,
				"entry_count": len(block.entries),
				"entries": [
					{
						"id": e.id,
						"offset": f"${e.offset:05X}",
						"text": e.text,
						"speaker": e.speaker,
						"location": e.location,
						"notes": e.notes,
						"raw_hex": e.raw_bytes.hex(),
					}
					for e in block.entries
				]
			}
			data["blocks"].append(block_data)

		output_path.parent.mkdir(parents=True, exist_ok=True)
		with open(output_path, 'w', encoding='utf-8') as f:
			json.dump(data, f, indent='\t', ensure_ascii=False)

	def import_from_json(self, input_path: Path) -> bool:
		"""Import dialog from JSON file."""
		try:
			with open(input_path, 'r', encoding='utf-8') as f:
				data = json.load(f)

			self.blocks = []
			for block_data in data.get("blocks", []):
				block = DialogBlock(
					block_id=block_data.get("block_id", 0),
					name=block_data.get("name", ""),
					category=block_data.get("category", "General"),
				)

				for entry_data in block_data.get("entries", []):
					offset_str = entry_data.get("offset", "$00000")
					offset = int(offset_str.replace("$", ""), 16)

					entry = DialogEntry(
						id=entry_data.get("id", 0),
						offset=offset,
						raw_bytes=bytes.fromhex(entry_data.get("raw_hex", "")),
						text=entry_data.get("text", ""),
						speaker=entry_data.get("speaker", ""),
						location=entry_data.get("location", ""),
						notes=entry_data.get("notes", ""),
					)
					block.entries.append(entry)

				self.blocks.append(block)

			return True
		except Exception as e:
			print(f"Error importing: {e}")
			return False


class DialogEditor:
	"""GUI editor for dialog text."""

	def __init__(self, extractor: DialogExtractor):
		"""Initialize editor."""
		if not HAS_TK:
			raise RuntimeError("tkinter not available")

		self.extractor = extractor
		self.current_entry: Optional[DialogEntry] = None
		self.modified = False

		self._setup_gui()

	def _setup_gui(self):
		"""Set up GUI window."""
		self.root = tk.Tk()
		self.root.title("Soul Blazer Dialog Editor")
		self.root.geometry("1100x750")

		# Menu bar
		menubar = tk.Menu(self.root)
		self.root.config(menu=menubar)

		file_menu = tk.Menu(menubar, tearoff=0)
		menubar.add_cascade(label="File", menu=file_menu)
		file_menu.add_command(label="Open ROM...", command=self._open_rom)
		file_menu.add_command(label="Import JSON...", command=self._import_json)
		file_menu.add_command(label="Export JSON...", command=self._export_json)
		file_menu.add_separator()
		file_menu.add_command(label="Save Changes", command=self._save_changes)
		file_menu.add_separator()
		file_menu.add_command(label="Exit", command=self._on_close)

		edit_menu = tk.Menu(menubar, tearoff=0)
		menubar.add_cascade(label="Edit", menu=edit_menu)
		edit_menu.add_command(label="Find...", command=self._show_find)
		edit_menu.add_command(label="Find Next", command=self._find_next)
		edit_menu.add_separator()
		edit_menu.add_command(label="Insert Control Code", command=self._insert_code)

		tools_menu = tk.Menu(menubar, tearoff=0)
		menubar.add_cascade(label="Tools", menu=tools_menu)
		tools_menu.add_command(label="Validate All", command=self._validate_all)
		tools_menu.add_command(label="Statistics", command=self._show_stats)

		# Main layout
		main_pane = ttk.PanedWindow(self.root, orient=tk.HORIZONTAL)
		main_pane.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)

		# Left panel - entry list
		left_frame = ttk.Frame(main_pane, width=350)
		main_pane.add(left_frame, weight=1)

		# Block selector
		ttk.Label(left_frame, text="Text Block:").pack(anchor=tk.W)
		self.block_combo = ttk.Combobox(left_frame, state="readonly")
		self.block_combo.pack(fill=tk.X, pady=(0, 5))
		self.block_combo.bind('<<ComboboxSelected>>', self._on_block_select)

		# Entry list with scrollbar
		list_frame = ttk.Frame(left_frame)
		list_frame.pack(fill=tk.BOTH, expand=True)

		self.entry_list = tk.Listbox(list_frame, font=("Consolas", 9))
		list_scroll = ttk.Scrollbar(list_frame, orient=tk.VERTICAL, command=self.entry_list.yview)
		self.entry_list.configure(yscrollcommand=list_scroll.set)

		list_scroll.pack(side=tk.RIGHT, fill=tk.Y)
		self.entry_list.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)
		self.entry_list.bind('<<ListboxSelect>>', self._on_entry_select)

		# Filter
		filter_frame = ttk.Frame(left_frame)
		filter_frame.pack(fill=tk.X, pady=5)
		ttk.Label(filter_frame, text="Filter:").pack(side=tk.LEFT)
		self.filter_var = tk.StringVar()
		self.filter_var.trace('w', self._on_filter_change)
		ttk.Entry(filter_frame, textvariable=self.filter_var).pack(side=tk.LEFT, fill=tk.X, expand=True)

		# Right panel - editor
		right_frame = ttk.Frame(main_pane)
		main_pane.add(right_frame, weight=2)

		# Entry info
		info_frame = ttk.LabelFrame(right_frame, text="Entry Info", padding=5)
		info_frame.pack(fill=tk.X, pady=(0, 5))

		info_grid = ttk.Frame(info_frame)
		info_grid.pack(fill=tk.X)

		ttk.Label(info_grid, text="ID:").grid(row=0, column=0, sticky=tk.W)
		self.id_label = ttk.Label(info_grid, text="-")
		self.id_label.grid(row=0, column=1, sticky=tk.W, padx=(5, 20))

		ttk.Label(info_grid, text="Offset:").grid(row=0, column=2, sticky=tk.W)
		self.offset_label = ttk.Label(info_grid, text="-")
		self.offset_label.grid(row=0, column=3, sticky=tk.W, padx=(5, 20))

		ttk.Label(info_grid, text="Size:").grid(row=0, column=4, sticky=tk.W)
		self.size_label = ttk.Label(info_grid, text="-")
		self.size_label.grid(row=0, column=5, sticky=tk.W)

		# Speaker and location
		meta_frame = ttk.Frame(info_frame)
		meta_frame.pack(fill=tk.X, pady=(5, 0))

		ttk.Label(meta_frame, text="Speaker:").pack(side=tk.LEFT)
		self.speaker_var = tk.StringVar()
		ttk.Entry(meta_frame, textvariable=self.speaker_var, width=20).pack(side=tk.LEFT, padx=5)

		ttk.Label(meta_frame, text="Location:").pack(side=tk.LEFT, padx=(10, 0))
		self.location_var = tk.StringVar()
		ttk.Entry(meta_frame, textvariable=self.location_var, width=20).pack(side=tk.LEFT, padx=5)

		# Text editor
		text_frame = ttk.LabelFrame(right_frame, text="Dialog Text", padding=5)
		text_frame.pack(fill=tk.BOTH, expand=True)

		self.text_editor = scrolledtext.ScrolledText(
			text_frame,
			font=("Consolas", 11),
			wrap=tk.WORD,
			height=12
		)
		self.text_editor.pack(fill=tk.BOTH, expand=True)
		self.text_editor.bind('<KeyRelease>', self._on_text_change)

		# Control codes toolbar
		codes_frame = ttk.Frame(text_frame)
		codes_frame.pack(fill=tk.X, pady=(5, 0))

		codes = [
			("[HERO]", "Player name"),
			("[ITEM]", "Item name"),
			("[NUM]", "Number"),
			("[PAUSE]", "Pause"),
			("[WAIT]", "Wait for input"),
			("[CLEAR]", "Clear screen"),
		]

		for code, tip in codes:
			btn = ttk.Button(codes_frame, text=code, width=8,
							command=lambda c=code: self._insert_text(c))
			btn.pack(side=tk.LEFT, padx=2)

		# Raw hex view
		hex_frame = ttk.LabelFrame(right_frame, text="Raw Hex", padding=5)
		hex_frame.pack(fill=tk.X, pady=(5, 0))

		self.hex_view = tk.Text(hex_frame, font=("Consolas", 9), height=3, state=tk.DISABLED)
		self.hex_view.pack(fill=tk.X)

		# Notes
		notes_frame = ttk.LabelFrame(right_frame, text="Notes", padding=5)
		notes_frame.pack(fill=tk.X, pady=(5, 0))

		self.notes_text = tk.Text(notes_frame, font=("Consolas", 9), height=3)
		self.notes_text.pack(fill=tk.X)

		# Status bar
		self.status_var = tk.StringVar(value="Ready")
		ttk.Label(self.root, textvariable=self.status_var, relief=tk.SUNKEN).pack(
			side=tk.BOTTOM, fill=tk.X)

		# Bind close
		self.root.protocol("WM_DELETE_WINDOW", self._on_close)

		# Initialize
		self._refresh_block_list()

	def _refresh_block_list(self):
		"""Refresh block dropdown."""
		blocks = [f"{b.name} ({len(b.entries)} entries)" for b in self.extractor.blocks]
		self.block_combo['values'] = blocks
		if blocks:
			self.block_combo.current(0)
			self._on_block_select(None)

	def _on_block_select(self, event):
		"""Handle block selection."""
		idx = self.block_combo.current()
		if idx < 0 or idx >= len(self.extractor.blocks):
			return

		block = self.extractor.blocks[idx]
		self._populate_entry_list(block.entries)

	def _populate_entry_list(self, entries: list[DialogEntry], filter_text: str = ""):
		"""Populate entry list."""
		self.entry_list.delete(0, tk.END)

		filter_lower = filter_text.lower()
		for entry in entries:
			if filter_lower and filter_lower not in entry.text.lower():
				continue

			# Show preview (first 40 chars)
			preview = entry.text.replace("\n", " ")[:40]
			if len(entry.text) > 40:
				preview += "..."

			marker = "*" if entry.modified else " "
			self.entry_list.insert(tk.END, f"{marker}{entry.id:04d}: {preview}")

	def _on_entry_select(self, event):
		"""Handle entry selection."""
		selection = self.entry_list.curselection()
		if not selection:
			return

		# Save current entry if modified
		if self.current_entry:
			self._save_current_entry()

		# Get selected entry
		idx = self.block_combo.current()
		if idx < 0:
			return

		block = self.extractor.blocks[idx]

		# Find entry by ID in list text
		list_text = self.entry_list.get(selection[0])
		try:
			entry_id = int(list_text[1:5])
			for entry in block.entries:
				if entry.id == entry_id:
					self._load_entry(entry)
					break
		except ValueError:
			pass

	def _load_entry(self, entry: DialogEntry):
		"""Load entry into editor."""
		self.current_entry = entry

		# Update info labels
		self.id_label.config(text=str(entry.id))
		self.offset_label.config(text=f"${entry.offset:05X}")
		self.size_label.config(text=f"{len(entry.raw_bytes)} bytes")

		# Update metadata
		self.speaker_var.set(entry.speaker)
		self.location_var.set(entry.location)

		# Update text
		self.text_editor.delete("1.0", tk.END)
		self.text_editor.insert("1.0", entry.text)

		# Update hex view
		self.hex_view.config(state=tk.NORMAL)
		self.hex_view.delete("1.0", tk.END)
		hex_str = " ".join(f"{b:02X}" for b in entry.raw_bytes)
		self.hex_view.insert("1.0", hex_str)
		self.hex_view.config(state=tk.DISABLED)

		# Update notes
		self.notes_text.delete("1.0", tk.END)
		self.notes_text.insert("1.0", entry.notes)

		self.status_var.set(f"Loaded entry {entry.id}")

	def _save_current_entry(self):
		"""Save current entry changes."""
		if not self.current_entry:
			return

		new_text = self.text_editor.get("1.0", tk.END).rstrip()
		new_speaker = self.speaker_var.get()
		new_location = self.location_var.get()
		new_notes = self.notes_text.get("1.0", tk.END).rstrip()

		if (new_text != self.current_entry.text or
			new_speaker != self.current_entry.speaker or
			new_location != self.current_entry.location or
			new_notes != self.current_entry.notes):

			self.current_entry.text = new_text
			self.current_entry.speaker = new_speaker
			self.current_entry.location = new_location
			self.current_entry.notes = new_notes
			self.current_entry.modified = True
			self.modified = True

	def _on_text_change(self, event):
		"""Handle text changes."""
		self.modified = True

	def _on_filter_change(self, *args):
		"""Handle filter change."""
		idx = self.block_combo.current()
		if idx < 0:
			return

		block = self.extractor.blocks[idx]
		self._populate_entry_list(block.entries, self.filter_var.get())

	def _insert_text(self, text: str):
		"""Insert text at cursor."""
		self.text_editor.insert(tk.INSERT, text)

	def _open_rom(self):
		"""Open ROM file."""
		path = filedialog.askopenfilename(
			filetypes=[("SNES ROMs", "*.sfc *.smc"), ("All files", "*.*")]
		)
		if path:
			if self.extractor.load_rom(path):
				self.extractor.extract_all_dialog()
				self._refresh_block_list()
				self.status_var.set(f"Loaded ROM: {path}")

	def _import_json(self):
		"""Import dialog from JSON."""
		path = filedialog.askopenfilename(
			filetypes=[("JSON files", "*.json"), ("All files", "*.*")]
		)
		if path:
			if self.extractor.import_from_json(Path(path)):
				self._refresh_block_list()
				self.status_var.set(f"Imported: {path}")

	def _export_json(self):
		"""Export dialog to JSON."""
		path = filedialog.asksaveasfilename(
			defaultextension=".json",
			filetypes=[("JSON files", "*.json")],
			initialfile="dialog_export.json"
		)
		if path:
			self._save_current_entry()
			self.extractor.export_to_json(Path(path))
			self.status_var.set(f"Exported: {path}")

	def _save_changes(self):
		"""Save all changes."""
		self._save_current_entry()
		messagebox.showinfo("Saved", "Changes saved to memory.\nUse Export JSON to save to file.")

	def _show_find(self):
		"""Show find dialog."""
		dialog = tk.Toplevel(self.root)
		dialog.title("Find Text")
		dialog.geometry("300x100")
		dialog.transient(self.root)

		ttk.Label(dialog, text="Search for:").pack(anchor=tk.W, padx=10, pady=5)

		self.find_var = tk.StringVar()
		entry = ttk.Entry(dialog, textvariable=self.find_var, width=40)
		entry.pack(padx=10)
		entry.focus()

		btn_frame = ttk.Frame(dialog)
		btn_frame.pack(pady=10)
		ttk.Button(btn_frame, text="Find Next", command=self._find_next).pack(side=tk.LEFT, padx=5)
		ttk.Button(btn_frame, text="Close", command=dialog.destroy).pack(side=tk.LEFT)

	def _find_next(self):
		"""Find next occurrence."""
		if not hasattr(self, 'find_var'):
			self._show_find()
			return

		search_text = self.find_var.get().lower()
		if not search_text:
			return

		# Search in current block
		idx = self.block_combo.current()
		if idx < 0:
			return

		block = self.extractor.blocks[idx]
		current_id = self.current_entry.id if self.current_entry else -1

		# Find next match
		for entry in block.entries:
			if entry.id > current_id and search_text in entry.text.lower():
				self._load_entry(entry)
				# Select in list
				for i in range(self.entry_list.size()):
					if f"{entry.id:04d}:" in self.entry_list.get(i):
						self.entry_list.selection_clear(0, tk.END)
						self.entry_list.selection_set(i)
						self.entry_list.see(i)
						break
				return

		messagebox.showinfo("Find", "No more matches found")

	def _insert_code(self):
		"""Show control code insert dialog."""
		dialog = tk.Toplevel(self.root)
		dialog.title("Insert Control Code")
		dialog.geometry("250x300")
		dialog.transient(self.root)

		codes = [
			("[END]", "End of text"),
			("[HERO]", "Player name"),
			("[ITEM]", "Item name"),
			("[NUM]", "Number value"),
			("[PAUSE]", "Brief pause"),
			("[WAIT]", "Wait for button"),
			("[CLEAR]", "Clear text box"),
			("[SLOW]", "Slow text speed"),
			("[NORM]", "Normal text speed"),
			("[FAST]", "Fast text speed"),
			("[WHITE]", "White text"),
			("[YELLOW]", "Yellow text"),
			("[RED]", "Red text"),
		]

		listbox = tk.Listbox(dialog, font=("Consolas", 10))
		for code, desc in codes:
			listbox.insert(tk.END, f"{code} - {desc}")
		listbox.pack(fill=tk.BOTH, expand=True, padx=10, pady=10)

		def insert_selected():
			sel = listbox.curselection()
			if sel:
				code = codes[sel[0]][0]
				self._insert_text(code)
			dialog.destroy()

		ttk.Button(dialog, text="Insert", command=insert_selected).pack(pady=5)

	def _validate_all(self):
		"""Validate all entries."""
		issues = []
		for block in self.extractor.blocks:
			for entry in block.entries:
				# Check for common issues
				if not entry.text.strip():
					issues.append(f"Entry {entry.id}: Empty text")
				if "[END]" not in entry.text and entry.text.strip():
					issues.append(f"Entry {entry.id}: Missing [END]")

		if issues:
			msg = f"Found {len(issues)} issues:\n\n" + "\n".join(issues[:10])
			if len(issues) > 10:
				msg += f"\n... and {len(issues) - 10} more"
			messagebox.showwarning("Validation", msg)
		else:
			messagebox.showinfo("Validation", "No issues found!")

	def _show_stats(self):
		"""Show dialog statistics."""
		total_entries = sum(len(b.entries) for b in self.extractor.blocks)
		total_chars = sum(len(e.text) for b in self.extractor.blocks for e in b.entries)
		modified = sum(1 for b in self.extractor.blocks for e in b.entries if e.modified)

		msg = f"Statistics:\n\n"
		msg += f"Blocks: {len(self.extractor.blocks)}\n"
		msg += f"Total entries: {total_entries}\n"
		msg += f"Total characters: {total_chars:,}\n"
		msg += f"Modified entries: {modified}\n"

		messagebox.showinfo("Statistics", msg)

	def _on_close(self):
		"""Handle window close."""
		if self.modified:
			if not messagebox.askyesno("Unsaved Changes",
									   "You have unsaved changes. Exit anyway?"):
				return
		self.root.destroy()

	def run(self):
		"""Run the editor."""
		self.root.mainloop()


def main():
	"""Main entry point."""
	import argparse

	parser = argparse.ArgumentParser(description="Soul Blazer Dialog Editor")
	parser.add_argument("--rom", "-r", help="Path to ROM file", default=str(DEFAULT_ROM))
	parser.add_argument("--export", "-e", help="Export to JSON file")
	parser.add_argument("--import", "-i", dest="import_file", help="Import from JSON file")

	args = parser.parse_args()

	extractor = DialogExtractor(args.rom)

	if extractor.rom_data:
		print(f"Loaded ROM: {len(extractor.rom_data):,} bytes")
		extractor.extract_all_dialog()
		print(f"Found {len(extractor.blocks)} text blocks")
		print(f"Total entries: {sum(len(b.entries) for b in extractor.blocks)}")

	if args.export:
		extractor.export_to_json(Path(args.export))
		print(f"Exported to: {args.export}")
	elif args.import_file:
		extractor.import_from_json(Path(args.import_file))
		print(f"Imported from: {args.import_file}")
	elif HAS_TK:
		editor = DialogEditor(extractor)
		editor.run()
	else:
		print("No GUI available. Use --export or --import options.")


if __name__ == "__main__":
	main()
