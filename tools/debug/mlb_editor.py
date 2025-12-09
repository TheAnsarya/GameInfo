#!/usr/bin/env python3
"""
MLB (Mesen Label) Editor

A tool for viewing, editing, and managing Mesen label files.

Features:
- View and edit labels
- Import from NL (FCEUX) format
- Import from CDL analysis
- Export to various formats
- GUI and CLI interfaces
- Label validation
- Batch operations

Usage:
	python mlb_editor.py <mlb_file> [options]
	python mlb_editor.py --gui
	python mlb_editor.py --import-nl <nl_file> --output <mlb_file>
"""

import argparse
import json
import os
import re
import sys
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Dict, List, Optional, Tuple

try:
	import tkinter as tk
	from tkinter import ttk, filedialog, messagebox, simpledialog
	HAS_TK = True
except ImportError:
	HAS_TK = False


class AddressType(Enum):
	"""Types of memory addresses"""
	PRG_ROM = "P"
	CHR_ROM = "C"
	WORK_RAM = "R"
	SAVE_RAM = "S"
	REGISTER = "G"
	INTERNAL_RAM = "I"


@dataclass
class MLBLabel:
	"""A single label entry"""
	address: int
	name: str
	address_type: AddressType = AddressType.PRG_ROM
	bank: int = -1
	comment: str = ""
	flags: str = ""

	@property
	def full_address(self) -> str:
		"""Get full address string"""
		if self.bank >= 0:
			return f"${self.bank:02X}:{self.address:04X}"
		return f"${self.address:04X}"

	def to_mlb_line(self) -> str:
		"""Convert to MLB file format line"""
		parts = [self.address_type.value]
		if self.bank >= 0:
			parts.append(f"{self.bank:02X}")
		parts.append(f"{self.address:04X}")
		parts.append(self.name)
		parts.append(self.comment)
		return ':'.join(parts)

	@classmethod
	def from_mlb_line(cls, line: str) -> Optional['MLBLabel']:
		"""Parse an MLB file line"""
		line = line.strip()
		if not line or line.startswith(';'):
			return None

		parts = line.split(':')
		if len(parts) < 3:
			return None

		try:
			addr_type = AddressType(parts[0])

			# Check if bank is specified
			if len(parts) >= 5:
				bank = int(parts[1], 16)
				address = int(parts[2], 16)
				name = parts[3]
				comment = parts[4] if len(parts) > 4 else ""
			else:
				bank = -1
				address = int(parts[1], 16)
				name = parts[2]
				comment = parts[3] if len(parts) > 3 else ""

			return cls(
				address=address,
				name=name,
				address_type=addr_type,
				bank=bank,
				comment=comment
			)
		except (ValueError, KeyError):
			return None


class MLBFile:
	"""Represents an MLB label file"""

	def __init__(self, filepath: Optional[str] = None):
		self.filepath = filepath
		self.labels: Dict[str, MLBLabel] = {}  # Key: "type:bank:address"
		self.comments: List[str] = []  # Header comments

		if filepath:
			self.load(filepath)

	def _make_key(self, label: MLBLabel) -> str:
		"""Create a unique key for a label"""
		if label.bank >= 0:
			return f"{label.address_type.value}:{label.bank:02X}:{label.address:04X}"
		return f"{label.address_type.value}:{label.address:04X}"

	def load(self, filepath: str) -> None:
		"""Load an MLB file"""
		self.filepath = filepath
		self.labels.clear()
		self.comments.clear()

		with open(filepath, 'r', encoding='utf-8') as f:
			header_done = False
			for line in f:
				line = line.rstrip('\n\r')

				if line.startswith(';'):
					if not header_done:
						self.comments.append(line)
					continue

				if not line.strip():
					continue

				header_done = True
				label = MLBLabel.from_mlb_line(line)
				if label:
					key = self._make_key(label)
					self.labels[key] = label

	def save(self, filepath: Optional[str] = None) -> None:
		"""Save the MLB file"""
		filepath = filepath or self.filepath
		if not filepath:
			raise ValueError("No filepath specified")

		lines = []

		# Add header comments
		for comment in self.comments:
			lines.append(comment)

		if self.comments:
			lines.append("")

		# Group labels by type
		by_type: Dict[AddressType, List[MLBLabel]] = {}
		for label in self.labels.values():
			if label.address_type not in by_type:
				by_type[label.address_type] = []
			by_type[label.address_type].append(label)

		# Output in order
		type_order = [
			AddressType.REGISTER,
			AddressType.INTERNAL_RAM,
			AddressType.WORK_RAM,
			AddressType.SAVE_RAM,
			AddressType.PRG_ROM,
			AddressType.CHR_ROM,
		]

		for addr_type in type_order:
			if addr_type not in by_type:
				continue

			labels = sorted(by_type[addr_type], key=lambda l: (l.bank, l.address))

			lines.append(f"; {addr_type.name.replace('_', ' ')}")
			for label in labels:
				lines.append(label.to_mlb_line())
			lines.append("")

		with open(filepath, 'w', encoding='utf-8') as f:
			f.write('\n'.join(lines))

	def add_label(self, label: MLBLabel) -> None:
		"""Add or update a label"""
		key = self._make_key(label)
		self.labels[key] = label

	def remove_label(self, address_type: AddressType, address: int, bank: int = -1) -> bool:
		"""Remove a label"""
		if bank >= 0:
			key = f"{address_type.value}:{bank:02X}:{address:04X}"
		else:
			key = f"{address_type.value}:{address:04X}"

		if key in self.labels:
			del self.labels[key]
			return True
		return False

	def get_label(self, address_type: AddressType, address: int, bank: int = -1) -> Optional[MLBLabel]:
		"""Get a label by address"""
		if bank >= 0:
			key = f"{address_type.value}:{bank:02X}:{address:04X}"
		else:
			key = f"{address_type.value}:{address:04X}"
		return self.labels.get(key)

	def find_labels(self, pattern: str) -> List[MLBLabel]:
		"""Find labels matching a pattern"""
		regex = re.compile(pattern, re.IGNORECASE)
		return [l for l in self.labels.values() 
				if regex.search(l.name) or regex.search(l.comment)]

	def get_stats(self) -> Dict[str, int]:
		"""Get label statistics"""
		stats = {
			'total': len(self.labels),
			'prg_rom': 0,
			'chr_rom': 0,
			'ram': 0,
			'registers': 0,
			'with_comments': 0,
		}

		for label in self.labels.values():
			if label.address_type == AddressType.PRG_ROM:
				stats['prg_rom'] += 1
			elif label.address_type == AddressType.CHR_ROM:
				stats['chr_rom'] += 1
			elif label.address_type in (AddressType.WORK_RAM, AddressType.SAVE_RAM, AddressType.INTERNAL_RAM):
				stats['ram'] += 1
			elif label.address_type == AddressType.REGISTER:
				stats['registers'] += 1

			if label.comment:
				stats['with_comments'] += 1

		return stats

	def import_nl(self, nl_path: str, bank: int = 0) -> int:
		"""Import labels from FCEUX NL file"""
		imported = 0

		# Determine type from filename
		if '.ram.nl' in nl_path:
			addr_type = AddressType.WORK_RAM
		else:
			addr_type = AddressType.PRG_ROM

		with open(nl_path, 'r', encoding='utf-8') as f:
			for line in f:
				line = line.strip()
				if not line or line.startswith(';'):
					continue

				# Parse NL format: $XXXX#name#comment
				match = re.match(r'\$([0-9A-Fa-f]+)#([^#]+)(?:#(.*))?', line)
				if match:
					address = int(match.group(1), 16)
					name = match.group(2)
					comment = match.group(3) or ""

					label = MLBLabel(
						address=address,
						name=name,
						address_type=addr_type,
						bank=bank if addr_type == AddressType.PRG_ROM else -1,
						comment=comment
					)
					self.add_label(label)
					imported += 1

		return imported

	def export_nl(self, output_dir: str, rom_name: str) -> Dict[str, int]:
		"""Export to FCEUX NL format"""
		exported = {'ram': 0, 'rom': 0}

		# RAM labels
		ram_labels = [l for l in self.labels.values() 
					  if l.address_type in (AddressType.WORK_RAM, AddressType.INTERNAL_RAM)]

		if ram_labels:
			ram_path = os.path.join(output_dir, f"{rom_name}.nes.ram.nl")
			with open(ram_path, 'w', encoding='utf-8') as f:
				f.write("; RAM Labels\n")
				for label in sorted(ram_labels, key=lambda l: l.address):
					f.write(f"${label.address:04X}#{label.name}#{label.comment}\n")
			exported['ram'] = len(ram_labels)

		# ROM labels by bank
		rom_labels = [l for l in self.labels.values() 
					  if l.address_type == AddressType.PRG_ROM]

		by_bank: Dict[int, List[MLBLabel]] = {}
		for label in rom_labels:
			bank = max(0, label.bank)
			if bank not in by_bank:
				by_bank[bank] = []
			by_bank[bank].append(label)

		for bank, labels in by_bank.items():
			rom_path = os.path.join(output_dir, f"{rom_name}.nes.{bank}.nl")
			with open(rom_path, 'w', encoding='utf-8') as f:
				f.write(f"; ROM Labels (Bank {bank})\n")
				for label in sorted(labels, key=lambda l: l.address):
					f.write(f"${label.address:04X}#{label.name}#{label.comment}\n")
			exported['rom'] += len(labels)

		return exported

	def validate(self) -> List[str]:
		"""Validate labels and return warnings"""
		warnings = []

		names_seen: Dict[str, MLBLabel] = {}

		for label in self.labels.values():
			# Check for duplicate names
			if label.name in names_seen:
				other = names_seen[label.name]
				warnings.append(
					f"Duplicate name '{label.name}' at {label.full_address} "
					f"and {other.full_address}"
				)
			else:
				names_seen[label.name] = label

			# Check name format
			if not re.match(r'^[A-Za-z_][A-Za-z0-9_]*$', label.name):
				warnings.append(
					f"Invalid label name '{label.name}' at {label.full_address}"
				)

			# Check address range
			if label.address_type == AddressType.PRG_ROM:
				if not (0x8000 <= label.address <= 0xFFFF):
					warnings.append(
						f"PRG ROM label '{label.name}' has unusual address {label.full_address}"
					)
			elif label.address_type == AddressType.WORK_RAM:
				if not (0x0000 <= label.address <= 0x07FF):
					warnings.append(
						f"Work RAM label '{label.name}' has unusual address {label.full_address}"
					)

		return warnings

	def merge(self, other: 'MLBFile', overwrite: bool = False) -> int:
		"""Merge another MLB file into this one"""
		merged = 0

		for label in other.labels.values():
			key = self._make_key(label)
			if key not in self.labels or overwrite:
				self.labels[key] = label
				merged += 1

		return merged


class MLBEditorGUI:
	"""GUI editor for MLB files"""

	def __init__(self, mlb_file: Optional[MLBFile] = None):
		if not HAS_TK:
			raise RuntimeError("tkinter is not available")

		self.mlb = mlb_file or MLBFile()
		self.root = tk.Tk()
		self.root.title("MLB Label Editor")
		self.root.geometry("1000x700")

		self._create_menu()
		self._create_toolbar()
		self._create_main_layout()
		self._create_status_bar()

		self._refresh_list()

	def _create_menu(self):
		"""Create menu bar"""
		menubar = tk.Menu(self.root)

		# File menu
		file_menu = tk.Menu(menubar, tearoff=0)
		file_menu.add_command(label="New", command=self._new_file, accelerator="Ctrl+N")
		file_menu.add_command(label="Open...", command=self._open_file, accelerator="Ctrl+O")
		file_menu.add_command(label="Save", command=self._save_file, accelerator="Ctrl+S")
		file_menu.add_command(label="Save As...", command=self._save_file_as)
		file_menu.add_separator()
		file_menu.add_command(label="Import NL...", command=self._import_nl)
		file_menu.add_command(label="Export NL...", command=self._export_nl)
		file_menu.add_separator()
		file_menu.add_command(label="Exit", command=self.root.quit)
		menubar.add_cascade(label="File", menu=file_menu)

		# Edit menu
		edit_menu = tk.Menu(menubar, tearoff=0)
		edit_menu.add_command(label="Add Label...", command=self._add_label, accelerator="Ctrl+A")
		edit_menu.add_command(label="Edit Label...", command=self._edit_label, accelerator="Enter")
		edit_menu.add_command(label="Delete Label", command=self._delete_label, accelerator="Delete")
		edit_menu.add_separator()
		edit_menu.add_command(label="Find...", command=self._find_labels, accelerator="Ctrl+F")
		menubar.add_cascade(label="Edit", menu=edit_menu)

		# Tools menu
		tools_menu = tk.Menu(menubar, tearoff=0)
		tools_menu.add_command(label="Validate Labels", command=self._validate)
		tools_menu.add_command(label="Statistics", command=self._show_stats)
		tools_menu.add_separator()
		tools_menu.add_command(label="Merge MLB...", command=self._merge_mlb)
		menubar.add_cascade(label="Tools", menu=tools_menu)

		self.root.config(menu=menubar)

		# Keyboard shortcuts
		self.root.bind('<Control-n>', lambda e: self._new_file())
		self.root.bind('<Control-o>', lambda e: self._open_file())
		self.root.bind('<Control-s>', lambda e: self._save_file())
		self.root.bind('<Control-a>', lambda e: self._add_label())
		self.root.bind('<Control-f>', lambda e: self._find_labels())
		self.root.bind('<Delete>', lambda e: self._delete_label())
		self.root.bind('<Return>', lambda e: self._edit_label())

	def _create_toolbar(self):
		"""Create toolbar"""
		toolbar = ttk.Frame(self.root)
		toolbar.pack(fill=tk.X, padx=5, pady=5)

		ttk.Button(toolbar, text="Add", command=self._add_label).pack(side=tk.LEFT, padx=2)
		ttk.Button(toolbar, text="Edit", command=self._edit_label).pack(side=tk.LEFT, padx=2)
		ttk.Button(toolbar, text="Delete", command=self._delete_label).pack(side=tk.LEFT, padx=2)

		ttk.Separator(toolbar, orient=tk.VERTICAL).pack(side=tk.LEFT, fill=tk.Y, padx=10)

		ttk.Label(toolbar, text="Filter:").pack(side=tk.LEFT, padx=2)
		self.filter_var = tk.StringVar()
		self.filter_var.trace('w', lambda *args: self._refresh_list())
		ttk.Entry(toolbar, textvariable=self.filter_var, width=20).pack(side=tk.LEFT, padx=2)

		ttk.Label(toolbar, text="Type:").pack(side=tk.LEFT, padx=(10, 2))
		self.type_filter = ttk.Combobox(toolbar, width=12, state='readonly')
		self.type_filter['values'] = ['All', 'PRG ROM', 'RAM', 'Registers']
		self.type_filter.current(0)
		self.type_filter.bind('<<ComboboxSelected>>', lambda e: self._refresh_list())
		self.type_filter.pack(side=tk.LEFT, padx=2)

	def _create_main_layout(self):
		"""Create main layout"""
		main_frame = ttk.Frame(self.root)
		main_frame.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)

		# Label list
		columns = ('address', 'name', 'type', 'comment')
		self.tree = ttk.Treeview(main_frame, columns=columns, show='headings')

		self.tree.heading('address', text='Address')
		self.tree.heading('name', text='Name')
		self.tree.heading('type', text='Type')
		self.tree.heading('comment', text='Comment')

		self.tree.column('address', width=120)
		self.tree.column('name', width=200)
		self.tree.column('type', width=100)
		self.tree.column('comment', width=400)

		# Scrollbars
		vsb = ttk.Scrollbar(main_frame, orient=tk.VERTICAL, command=self.tree.yview)
		hsb = ttk.Scrollbar(main_frame, orient=tk.HORIZONTAL, command=self.tree.xview)
		self.tree.configure(yscrollcommand=vsb.set, xscrollcommand=hsb.set)

		self.tree.grid(row=0, column=0, sticky='nsew')
		vsb.grid(row=0, column=1, sticky='ns')
		hsb.grid(row=1, column=0, sticky='ew')

		main_frame.rowconfigure(0, weight=1)
		main_frame.columnconfigure(0, weight=1)

		# Double-click to edit
		self.tree.bind('<Double-1>', lambda e: self._edit_label())

	def _create_status_bar(self):
		"""Create status bar"""
		self.status_var = tk.StringVar(value="Ready")
		status_bar = ttk.Label(self.root, textvariable=self.status_var, relief=tk.SUNKEN)
		status_bar.pack(fill=tk.X, side=tk.BOTTOM)

	def _refresh_list(self):
		"""Refresh the label list"""
		# Clear existing
		for item in self.tree.get_children():
			self.tree.delete(item)

		filter_text = self.filter_var.get().lower()
		type_filter = self.type_filter.get()

		for key, label in sorted(self.mlb.labels.items(), key=lambda x: (x[1].address_type.value, x[1].bank, x[1].address)):
			# Apply type filter
			if type_filter == 'PRG ROM' and label.address_type != AddressType.PRG_ROM:
				continue
			if type_filter == 'RAM' and label.address_type not in (AddressType.WORK_RAM, AddressType.SAVE_RAM, AddressType.INTERNAL_RAM):
				continue
			if type_filter == 'Registers' and label.address_type != AddressType.REGISTER:
				continue

			# Apply text filter
			if filter_text:
				if filter_text not in label.name.lower() and filter_text not in label.comment.lower():
					continue

			self.tree.insert('', 'end', iid=key, values=(
				label.full_address,
				label.name,
				label.address_type.name,
				label.comment
			))

		self.status_var.set(f"{len(self.mlb.labels)} labels")

	def _new_file(self):
		"""Create new file"""
		self.mlb = MLBFile()
		self._refresh_list()
		self.status_var.set("New file")

	def _open_file(self):
		"""Open MLB file"""
		filepath = filedialog.askopenfilename(
			filetypes=[("MLB Files", "*.mlb"), ("All Files", "*.*")]
		)
		if filepath:
			try:
				self.mlb = MLBFile(filepath)
				self._refresh_list()
				self.status_var.set(f"Opened: {filepath}")
			except Exception as e:
				messagebox.showerror("Error", f"Failed to open file: {e}")

	def _save_file(self):
		"""Save MLB file"""
		if self.mlb.filepath:
			try:
				self.mlb.save()
				self.status_var.set(f"Saved: {self.mlb.filepath}")
			except Exception as e:
				messagebox.showerror("Error", f"Failed to save: {e}")
		else:
			self._save_file_as()

	def _save_file_as(self):
		"""Save MLB file with new name"""
		filepath = filedialog.asksaveasfilename(
			defaultextension=".mlb",
			filetypes=[("MLB Files", "*.mlb"), ("All Files", "*.*")]
		)
		if filepath:
			try:
				self.mlb.save(filepath)
				self.status_var.set(f"Saved: {filepath}")
			except Exception as e:
				messagebox.showerror("Error", f"Failed to save: {e}")

	def _add_label(self):
		"""Add new label"""
		dialog = LabelDialog(self.root, "Add Label")
		if dialog.result:
			self.mlb.add_label(dialog.result)
			self._refresh_list()

	def _edit_label(self):
		"""Edit selected label"""
		selection = self.tree.selection()
		if not selection:
			return

		key = selection[0]
		label = self.mlb.labels.get(key)
		if not label:
			return

		dialog = LabelDialog(self.root, "Edit Label", label)
		if dialog.result:
			# Remove old, add new (in case address changed)
			del self.mlb.labels[key]
			self.mlb.add_label(dialog.result)
			self._refresh_list()

	def _delete_label(self):
		"""Delete selected label"""
		selection = self.tree.selection()
		if not selection:
			return

		if messagebox.askyesno("Confirm", f"Delete {len(selection)} label(s)?"):
			for key in selection:
				if key in self.mlb.labels:
					del self.mlb.labels[key]
			self._refresh_list()

	def _find_labels(self):
		"""Find labels"""
		pattern = simpledialog.askstring("Find", "Enter search pattern:")
		if pattern:
			self.filter_var.set(pattern)

	def _import_nl(self):
		"""Import from NL file"""
		filepath = filedialog.askopenfilename(
			filetypes=[("NL Files", "*.nl"), ("All Files", "*.*")]
		)
		if filepath:
			try:
				count = self.mlb.import_nl(filepath)
				self._refresh_list()
				messagebox.showinfo("Import", f"Imported {count} labels")
			except Exception as e:
				messagebox.showerror("Error", f"Failed to import: {e}")

	def _export_nl(self):
		"""Export to NL format"""
		directory = filedialog.askdirectory()
		if directory:
			rom_name = simpledialog.askstring("Export", "Enter ROM name (without extension):")
			if rom_name:
				try:
					result = self.mlb.export_nl(directory, rom_name)
					messagebox.showinfo("Export", 
						f"Exported {result['ram']} RAM labels and {result['rom']} ROM labels")
				except Exception as e:
					messagebox.showerror("Error", f"Failed to export: {e}")

	def _merge_mlb(self):
		"""Merge another MLB file"""
		filepath = filedialog.askopenfilename(
			filetypes=[("MLB Files", "*.mlb"), ("All Files", "*.*")]
		)
		if filepath:
			try:
				other = MLBFile(filepath)
				count = self.mlb.merge(other)
				self._refresh_list()
				messagebox.showinfo("Merge", f"Merged {count} labels")
			except Exception as e:
				messagebox.showerror("Error", f"Failed to merge: {e}")

	def _validate(self):
		"""Validate labels"""
		warnings = self.mlb.validate()
		if warnings:
			msg = "Validation warnings:\n\n" + "\n".join(warnings[:20])
			if len(warnings) > 20:
				msg += f"\n\n... and {len(warnings) - 20} more"
			messagebox.showwarning("Validation", msg)
		else:
			messagebox.showinfo("Validation", "All labels are valid!")

	def _show_stats(self):
		"""Show statistics"""
		stats = self.mlb.get_stats()
		msg = f"""Label Statistics:

Total Labels: {stats['total']}
PRG ROM: {stats['prg_rom']}
CHR ROM: {stats['chr_rom']}
RAM: {stats['ram']}
Registers: {stats['registers']}
With Comments: {stats['with_comments']}"""
		messagebox.showinfo("Statistics", msg)

	def run(self):
		"""Run the GUI"""
		self.root.mainloop()


class LabelDialog:
	"""Dialog for adding/editing labels"""

	def __init__(self, parent, title: str, label: Optional[MLBLabel] = None):
		self.result: Optional[MLBLabel] = None

		self.dialog = tk.Toplevel(parent)
		self.dialog.title(title)
		self.dialog.geometry("400x300")
		self.dialog.transient(parent)
		self.dialog.grab_set()

		# Form
		frame = ttk.Frame(self.dialog, padding=10)
		frame.pack(fill=tk.BOTH, expand=True)

		# Address type
		ttk.Label(frame, text="Type:").grid(row=0, column=0, sticky='w', pady=5)
		self.type_var = tk.StringVar(value=label.address_type.value if label else 'P')
		type_combo = ttk.Combobox(frame, textvariable=self.type_var, state='readonly', width=20)
		type_combo['values'] = [t.value for t in AddressType]
		type_combo.grid(row=0, column=1, sticky='w', pady=5)

		# Bank
		ttk.Label(frame, text="Bank:").grid(row=1, column=0, sticky='w', pady=5)
		self.bank_var = tk.StringVar(value=str(label.bank) if label and label.bank >= 0 else '-1')
		ttk.Entry(frame, textvariable=self.bank_var, width=10).grid(row=1, column=1, sticky='w', pady=5)

		# Address
		ttk.Label(frame, text="Address (hex):").grid(row=2, column=0, sticky='w', pady=5)
		self.addr_var = tk.StringVar(value=f"{label.address:04X}" if label else '')
		ttk.Entry(frame, textvariable=self.addr_var, width=10).grid(row=2, column=1, sticky='w', pady=5)

		# Name
		ttk.Label(frame, text="Name:").grid(row=3, column=0, sticky='w', pady=5)
		self.name_var = tk.StringVar(value=label.name if label else '')
		ttk.Entry(frame, textvariable=self.name_var, width=30).grid(row=3, column=1, sticky='w', pady=5)

		# Comment
		ttk.Label(frame, text="Comment:").grid(row=4, column=0, sticky='w', pady=5)
		self.comment_var = tk.StringVar(value=label.comment if label else '')
		ttk.Entry(frame, textvariable=self.comment_var, width=40).grid(row=4, column=1, sticky='w', pady=5)

		# Buttons
		btn_frame = ttk.Frame(frame)
		btn_frame.grid(row=5, column=0, columnspan=2, pady=20)

		ttk.Button(btn_frame, text="OK", command=self._ok).pack(side=tk.LEFT, padx=5)
		ttk.Button(btn_frame, text="Cancel", command=self._cancel).pack(side=tk.LEFT, padx=5)

		self.dialog.wait_window()

	def _ok(self):
		"""Handle OK"""
		try:
			address = int(self.addr_var.get(), 16)
			bank = int(self.bank_var.get())

			self.result = MLBLabel(
				address=address,
				name=self.name_var.get(),
				address_type=AddressType(self.type_var.get()),
				bank=bank if bank >= 0 else -1,
				comment=self.comment_var.get()
			)
			self.dialog.destroy()
		except ValueError as e:
			messagebox.showerror("Error", f"Invalid input: {e}")

	def _cancel(self):
		"""Handle Cancel"""
		self.dialog.destroy()


def main():
	parser = argparse.ArgumentParser(description='MLB Label Editor')
	parser.add_argument('mlb_file', nargs='?', help='MLB file to open')
	parser.add_argument('--gui', action='store_true', help='Launch GUI')
	parser.add_argument('--import-nl', metavar='FILE', help='Import from NL file')
	parser.add_argument('--export-nl', metavar='DIR', help='Export to NL format')
	parser.add_argument('--output', '-o', help='Output file')
	parser.add_argument('--validate', action='store_true', help='Validate labels')
	parser.add_argument('--stats', action='store_true', help='Show statistics')

	args = parser.parse_args()

	# GUI mode
	if args.gui or (not args.mlb_file and not args.import_nl):
		if not HAS_TK:
			print("Error: tkinter is required for GUI mode")
			sys.exit(1)

		mlb = MLBFile(args.mlb_file) if args.mlb_file else None
		editor = MLBEditorGUI(mlb)
		editor.run()
		return

	# CLI mode
	if args.mlb_file:
		mlb = MLBFile(args.mlb_file)
	else:
		mlb = MLBFile()

	if args.import_nl:
		count = mlb.import_nl(args.import_nl)
		print(f"Imported {count} labels from {args.import_nl}")

	if args.validate:
		warnings = mlb.validate()
		if warnings:
			print("Validation warnings:")
			for w in warnings:
				print(f"  - {w}")
		else:
			print("All labels valid")

	if args.stats:
		stats = mlb.get_stats()
		print(f"Total: {stats['total']}")
		print(f"PRG ROM: {stats['prg_rom']}")
		print(f"RAM: {stats['ram']}")
		print(f"With comments: {stats['with_comments']}")

	if args.export_nl:
		rom_name = os.path.splitext(os.path.basename(args.mlb_file or 'labels'))[0]
		result = mlb.export_nl(args.export_nl, rom_name)
		print(f"Exported {result['ram']} RAM, {result['rom']} ROM labels")

	if args.output:
		mlb.save(args.output)
		print(f"Saved to {args.output}")


if __name__ == '__main__':
	main()
