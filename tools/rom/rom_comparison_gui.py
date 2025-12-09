#!/usr/bin/env python3
"""
ROM Comparison GUI

Visual comparison tool for ROM files.
Shows differences between original and modified ROMs with hex highlighting.

Features:
- Side-by-side hex comparison
- Diff highlighting with colors
- Jump to differences
- Export diff reports
- IPS/BPS patch preview

Usage:
	python rom_comparison_gui.py [original.nes] [modified.nes]
"""

import argparse
import json
import struct
import sys
from pathlib import Path
from typing import List, Tuple, Optional

try:
	import tkinter as tk
	from tkinter import ttk, filedialog, messagebox, scrolledtext
	HAS_TK = True
except ImportError:
	HAS_TK = False


class ROMDiff:
	"""Calculate differences between two ROM files."""

	def __init__(self, original: bytes, modified: bytes):
		self.original = original
		self.modified = modified
		self.diffs: List[Tuple[int, int, bytes, bytes]] = []
		self._calculate_diffs()

	def _calculate_diffs(self):
		"""Find all differences between ROMs."""
		min_len = min(len(self.original), len(self.modified))
		max_len = max(len(self.original), len(self.modified))

		i = 0
		while i < min_len:
			if self.original[i] != self.modified[i]:
				# Found start of difference
				start = i

				# Find end of difference
				while i < min_len and self.original[i] != self.modified[i]:
					i += 1

				self.diffs.append((
					start,
					i - start,
					self.original[start:i],
					self.modified[start:i]
				))
			else:
				i += 1

		# Handle length differences
		if len(self.modified) > len(self.original):
			self.diffs.append((
				len(self.original),
				len(self.modified) - len(self.original),
				b'',
				self.modified[len(self.original):]
			))
		elif len(self.original) > len(self.modified):
			self.diffs.append((
				len(self.modified),
				len(self.original) - len(self.modified),
				self.original[len(self.modified):],
				b''
			))

	def get_diff_count(self) -> int:
		"""Get number of difference regions."""
		return len(self.diffs)

	def get_total_bytes_changed(self) -> int:
		"""Get total number of bytes that differ."""
		return sum(d[1] for d in self.diffs)

	def get_diff_at(self, index: int) -> Optional[Tuple[int, int, bytes, bytes]]:
		"""Get difference at index."""
		if 0 <= index < len(self.diffs):
			return self.diffs[index]
		return None

	def export_report(self) -> str:
		"""Export diff report as text."""
		lines = [
			"ROM Comparison Report",
			"=" * 60,
			f"Original size: {len(self.original):,} bytes",
			f"Modified size: {len(self.modified):,} bytes",
			f"Difference regions: {len(self.diffs)}",
			f"Total bytes changed: {self.get_total_bytes_changed():,}",
			"",
			"Differences:",
			"-" * 60,
		]

		for i, (offset, length, orig, mod) in enumerate(self.diffs):
			lines.append(f"\nDiff #{i + 1} at ${offset:06X} ({length} bytes):")

			# Show hex comparison
			for j in range(0, length, 16):
				chunk_orig = orig[j:j + 16] if j < len(orig) else b''
				chunk_mod = mod[j:j + 16] if j < len(mod) else b''

				orig_hex = ' '.join(f'{b:02X}' for b in chunk_orig) if chunk_orig else '(none)'
				mod_hex = ' '.join(f'{b:02X}' for b in chunk_mod) if chunk_mod else '(none)'

				lines.append(f"  ${offset + j:06X}: {orig_hex}")
				lines.append(f"       -> {mod_hex}")

		return '\n'.join(lines)


class HexView(tk.Frame):
	"""Hex view widget."""

	def __init__(self, parent, **kwargs):
		super().__init__(parent, **kwargs)

		self.data = b''
		self.offset = 0
		self.bytes_per_row = 16
		self.highlighted_ranges: List[Tuple[int, int, str]] = []

		self._create_widgets()

	def _create_widgets(self):
		"""Create hex view widgets."""
		# Address column
		self.addr_text = tk.Text(
			self, width=10, height=20,
			font=('Consolas', 10),
			state='disabled',
			bg='#f0f0f0'
		)
		self.addr_text.pack(side='left', fill='y')

		# Hex view
		self.hex_text = tk.Text(
			self, width=48, height=20,
			font=('Consolas', 10)
		)
		self.hex_text.pack(side='left', fill='both', expand=True)

		# ASCII view
		self.ascii_text = tk.Text(
			self, width=16, height=20,
			font=('Consolas', 10),
			state='disabled',
			bg='#f8f8f8'
		)
		self.ascii_text.pack(side='left', fill='y')

		# Scrollbar
		scrollbar = ttk.Scrollbar(self, command=self._on_scroll)
		scrollbar.pack(side='right', fill='y')

		self.hex_text.config(yscrollcommand=scrollbar.set)

		# Configure tags for highlighting
		self.hex_text.tag_configure('diff', background='#ffcccc')
		self.hex_text.tag_configure('selected', background='#cceeff')

	def _on_scroll(self, *args):
		"""Handle scroll events."""
		self.hex_text.yview(*args)
		self.addr_text.yview(*args)
		self.ascii_text.yview(*args)

	def set_data(self, data: bytes, offset: int = 0):
		"""Set data to display."""
		self.data = data
		self.offset = offset
		self._update_view()

	def _update_view(self):
		"""Update the hex view."""
		# Clear existing content
		self.hex_text.config(state='normal')
		self.hex_text.delete('1.0', 'end')

		self.addr_text.config(state='normal')
		self.addr_text.delete('1.0', 'end')

		self.ascii_text.config(state='normal')
		self.ascii_text.delete('1.0', 'end')

		# Display data
		for i in range(0, len(self.data), self.bytes_per_row):
			addr = self.offset + i
			row_data = self.data[i:i + self.bytes_per_row]

			# Address
			self.addr_text.insert('end', f'{addr:08X}\n')

			# Hex
			hex_str = ' '.join(f'{b:02X}' for b in row_data)
			hex_str = hex_str.ljust(self.bytes_per_row * 3 - 1)
			self.hex_text.insert('end', hex_str + '\n')

			# ASCII
			ascii_str = ''.join(
				chr(b) if 32 <= b < 127 else '.'
				for b in row_data
			)
			self.ascii_text.insert('end', ascii_str + '\n')

		# Apply highlights
		self._apply_highlights()

		self.hex_text.config(state='disabled')
		self.addr_text.config(state='disabled')
		self.ascii_text.config(state='disabled')

	def highlight_range(self, start: int, end: int, tag: str = 'diff'):
		"""Highlight a range of bytes."""
		self.highlighted_ranges.append((start, end, tag))
		self._apply_highlights()

	def _apply_highlights(self):
		"""Apply all highlights."""
		self.hex_text.config(state='normal')

		for start, end, tag in self.highlighted_ranges:
			# Convert byte offset to text position
			rel_start = start - self.offset
			rel_end = end - self.offset

			if rel_start < 0:
				rel_start = 0
			if rel_end > len(self.data):
				rel_end = len(self.data)

			for i in range(rel_start, rel_end):
				row = i // self.bytes_per_row + 1
				col = (i % self.bytes_per_row) * 3

				start_idx = f'{row}.{col}'
				end_idx = f'{row}.{col + 2}'

				self.hex_text.tag_add(tag, start_idx, end_idx)

		self.hex_text.config(state='disabled')


class ROMComparisonGUI:
	"""GUI for ROM comparison."""

	def __init__(self, root: tk.Tk):
		self.root = root
		self.root.title("ROM Comparison Tool")
		self.root.geometry("1200x700")

		self.original_path: Optional[Path] = None
		self.modified_path: Optional[Path] = None
		self.original_data: bytes = b''
		self.modified_data: bytes = b''
		self.diff: Optional[ROMDiff] = None
		self.current_diff_index = 0

		self._create_menu()
		self._create_widgets()

	def _create_menu(self):
		"""Create menu bar."""
		menubar = tk.Menu(self.root)

		file_menu = tk.Menu(menubar, tearoff=0)
		file_menu.add_command(label="Open Original...", command=self._open_original)
		file_menu.add_command(label="Open Modified...", command=self._open_modified)
		file_menu.add_separator()
		file_menu.add_command(label="Export Report...", command=self._export_report)
		file_menu.add_separator()
		file_menu.add_command(label="Exit", command=self.root.quit)
		menubar.add_cascade(label="File", menu=file_menu)

		view_menu = tk.Menu(menubar, tearoff=0)
		view_menu.add_command(label="Previous Diff", command=self._prev_diff)
		view_menu.add_command(label="Next Diff", command=self._next_diff)
		view_menu.add_separator()
		view_menu.add_command(label="Go to Address...", command=self._goto_address)
		menubar.add_cascade(label="View", menu=view_menu)

		self.root.config(menu=menubar)

	def _create_widgets(self):
		"""Create main widgets."""
		# Top frame for file info
		info_frame = ttk.Frame(self.root)
		info_frame.pack(fill='x', padx=5, pady=5)

		self.original_label = ttk.Label(info_frame, text="Original: (none)")
		self.original_label.pack(side='left')

		self.modified_label = ttk.Label(info_frame, text="Modified: (none)")
		self.modified_label.pack(side='right')

		# Navigation frame
		nav_frame = ttk.Frame(self.root)
		nav_frame.pack(fill='x', padx=5)

		ttk.Button(nav_frame, text="<< Prev", command=self._prev_diff).pack(side='left')
		self.diff_label = ttk.Label(nav_frame, text="Diff: 0/0")
		self.diff_label.pack(side='left', padx=10)
		ttk.Button(nav_frame, text="Next >>", command=self._next_diff).pack(side='left')

		self.offset_label = ttk.Label(nav_frame, text="Offset: $000000")
		self.offset_label.pack(side='right')

		# Main comparison pane
		paned = ttk.PanedWindow(self.root, orient='horizontal')
		paned.pack(fill='both', expand=True, padx=5, pady=5)

		# Left frame (original)
		left_frame = ttk.LabelFrame(paned, text="Original")
		self.original_view = HexView(left_frame)
		self.original_view.pack(fill='both', expand=True)
		paned.add(left_frame, weight=1)

		# Right frame (modified)
		right_frame = ttk.LabelFrame(paned, text="Modified")
		self.modified_view = HexView(right_frame)
		self.modified_view.pack(fill='both', expand=True)
		paned.add(right_frame, weight=1)

		# Status bar
		status_frame = ttk.Frame(self.root)
		status_frame.pack(fill='x', padx=5, pady=2)

		self.status_label = ttk.Label(status_frame, text="Ready")
		self.status_label.pack(side='left')

		self.diff_summary = ttk.Label(status_frame, text="")
		self.diff_summary.pack(side='right')

	def _open_original(self):
		"""Open original ROM file."""
		path = filedialog.askopenfilename(
			title="Open Original ROM",
			filetypes=[
				("ROM files", "*.nes *.smc *.sfc *.gb *.gbc *.gba"),
				("All files", "*.*")
			]
		)
		if path:
			self.original_path = Path(path)
			self.original_data = self.original_path.read_bytes()
			self.original_label.config(
				text=f"Original: {self.original_path.name} ({len(self.original_data):,} bytes)"
			)
			self._update_comparison()

	def _open_modified(self):
		"""Open modified ROM file."""
		path = filedialog.askopenfilename(
			title="Open Modified ROM",
			filetypes=[
				("ROM files", "*.nes *.smc *.sfc *.gb *.gbc *.gba"),
				("All files", "*.*")
			]
		)
		if path:
			self.modified_path = Path(path)
			self.modified_data = self.modified_path.read_bytes()
			self.modified_label.config(
				text=f"Modified: {self.modified_path.name} ({len(self.modified_data):,} bytes)"
			)
			self._update_comparison()

	def _update_comparison(self):
		"""Update comparison view."""
		if self.original_data and self.modified_data:
			self.diff = ROMDiff(self.original_data, self.modified_data)
			self.current_diff_index = 0

			self.diff_summary.config(
				text=f"{self.diff.get_diff_count()} regions, "
				f"{self.diff.get_total_bytes_changed():,} bytes changed"
			)

			self._show_current_diff()
		elif self.original_data:
			self.original_view.set_data(self.original_data[:4096])
		elif self.modified_data:
			self.modified_view.set_data(self.modified_data[:4096])

	def _show_current_diff(self):
		"""Show current difference."""
		if not self.diff or self.diff.get_diff_count() == 0:
			return

		diff_data = self.diff.get_diff_at(self.current_diff_index)
		if not diff_data:
			return

		offset, length, orig, mod = diff_data

		# Calculate view range (show context around diff)
		context = 128
		start = max(0, offset - context)
		end = min(max(len(self.original_data), len(self.modified_data)), offset + length + context)

		# Update views
		orig_chunk = self.original_data[start:end] if start < len(self.original_data) else b''
		mod_chunk = self.modified_data[start:end] if start < len(self.modified_data) else b''

		self.original_view.set_data(orig_chunk, start)
		self.modified_view.set_data(mod_chunk, start)

		# Highlight diff
		self.original_view.highlight_range(offset, offset + length)
		self.modified_view.highlight_range(offset, offset + length)

		# Update labels
		self.diff_label.config(
			text=f"Diff: {self.current_diff_index + 1}/{self.diff.get_diff_count()}"
		)
		self.offset_label.config(text=f"Offset: ${offset:06X}")

	def _prev_diff(self):
		"""Go to previous difference."""
		if self.diff and self.current_diff_index > 0:
			self.current_diff_index -= 1
			self._show_current_diff()

	def _next_diff(self):
		"""Go to next difference."""
		if self.diff and self.current_diff_index < self.diff.get_diff_count() - 1:
			self.current_diff_index += 1
			self._show_current_diff()

	def _goto_address(self):
		"""Go to specific address."""
		dialog = tk.Toplevel(self.root)
		dialog.title("Go to Address")
		dialog.geometry("300x100")
		dialog.transient(self.root)

		ttk.Label(dialog, text="Address (hex):").pack(pady=5)

		entry = ttk.Entry(dialog)
		entry.pack(pady=5)
		entry.insert(0, "0x")
		entry.focus()

		def go():
			try:
				addr = int(entry.get(), 16)
				self._goto_offset(addr)
				dialog.destroy()
			except ValueError:
				messagebox.showerror("Error", "Invalid address format")

		ttk.Button(dialog, text="Go", command=go).pack(pady=5)

	def _goto_offset(self, offset: int):
		"""Go to specific offset."""
		if self.original_data:
			chunk = self.original_data[offset:offset + 4096]
			self.original_view.set_data(chunk, offset)

		if self.modified_data:
			chunk = self.modified_data[offset:offset + 4096]
			self.modified_view.set_data(chunk, offset)

		self.offset_label.config(text=f"Offset: ${offset:06X}")

	def _export_report(self):
		"""Export comparison report."""
		if not self.diff:
			messagebox.showwarning("Warning", "No comparison data to export")
			return

		path = filedialog.asksaveasfilename(
			title="Export Report",
			defaultextension=".txt",
			filetypes=[("Text files", "*.txt"), ("All files", "*.*")]
		)

		if path:
			report = self.diff.export_report()
			Path(path).write_text(report, encoding='utf-8')
			messagebox.showinfo("Success", f"Report exported to {path}")


def cli_compare(original_path: str, modified_path: str, output: Optional[str] = None):
	"""Command-line comparison."""
	original = Path(original_path).read_bytes()
	modified = Path(modified_path).read_bytes()

	diff = ROMDiff(original, modified)
	report = diff.export_report()

	if output:
		Path(output).write_text(report, encoding='utf-8')
		print(f"Report saved to: {output}")
	else:
		print(report)


def main():
	parser = argparse.ArgumentParser(description="ROM Comparison Tool")
	parser.add_argument("original", nargs='?', help="Original ROM file")
	parser.add_argument("modified", nargs='?', help="Modified ROM file")
	parser.add_argument("-o", "--output", help="Output report file (CLI mode)")
	parser.add_argument("--cli", action="store_true", help="Run in CLI mode")

	args = parser.parse_args()

	if args.cli or (args.original and args.modified and args.output):
		if not args.original or not args.modified:
			print("Error: Both original and modified files required for CLI mode")
			sys.exit(1)
		cli_compare(args.original, args.modified, args.output)
	else:
		if not HAS_TK:
			print("Error: tkinter required for GUI mode")
			print("Use --cli flag for command-line mode")
			sys.exit(1)

		root = tk.Tk()
		app = ROMComparisonGUI(root)

		if args.original:
			app.original_path = Path(args.original)
			app.original_data = app.original_path.read_bytes()
			app.original_label.config(
				text=f"Original: {app.original_path.name} ({len(app.original_data):,} bytes)"
			)

		if args.modified:
			app.modified_path = Path(args.modified)
			app.modified_data = app.modified_path.read_bytes()
			app.modified_label.config(
				text=f"Modified: {app.modified_path.name} ({len(app.modified_data):,} bytes)"
			)

		if args.original and args.modified:
			app._update_comparison()

		root.mainloop()


if __name__ == "__main__":
	main()
