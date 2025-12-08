#!/usr/bin/env python3
"""
CDL (Code/Data Logger) Editor and Analyzer

A tool for viewing, editing, and analyzing CDL files from NES/SNES emulators.
Supports FCEUX and Mesen CDL formats.

Usage:
    python cdl_editor.py <cdl_file> [options]

Options:
    --info          Show CDL file information and statistics
    --export-csv    Export CDL data to CSV format
    --export-json   Export CDL data to JSON format
    --merge <file>  Merge another CDL file into this one
    --gui           Launch the graphical editor
    --bank <num>    Show statistics for specific bank
    --find-code     Find all code regions
    --find-data     Find all data regions
    --find-unused   Find all unused regions
"""

import argparse
import json
import os
import struct
import sys
from dataclasses import dataclass
from enum import Flag, auto
from pathlib import Path
from typing import BinaryIO, Dict, List, Optional, Tuple

try:
    import tkinter as tk
    from tkinter import ttk, filedialog, messagebox
    HAS_TK = True
except ImportError:
    HAS_TK = False


class FCEUXFlags(Flag):
    """FCEUX CDL byte flags"""
    NONE = 0
    CODE = auto()           # $01 - Executed as code
    DATA = auto()           # $02 - Read as data
    RENDERED = auto()       # $04 - Used as graphics
    INDIRECT_DATA = auto()  # $08 - Read through $2007
    PCM_AUDIO = auto()      # $10 - PCM audio data
    INDIRECT_CODE = auto()  # $20 - Jumped to indirectly
    INDIRECT_ACCESS = auto()# $40 - Accessed indirectly
    ROM_BANK = auto()       # $80 - ROM bank marker


class MesenFlags(Flag):
    """Mesen CDL byte flags"""
    NONE = 0
    CODE = auto()           # $01 - Code
    DATA = auto()           # $02 - Data
    JUMP_TARGET = auto()    # $04 - Jump target
    SUB_ENTRY = auto()      # $08 - Subroutine entry point
    # Bits 4-7 contain PRG bank number


@dataclass
class CDLRegion:
    """Represents a contiguous region in the CDL file"""
    start: int
    end: int
    flags: int
    region_type: str  # 'code', 'data', 'unused', 'mixed'
    
    @property
    def size(self) -> int:
        return self.end - self.start + 1


@dataclass
class CDLStats:
    """Statistics for a CDL file or region"""
    total_bytes: int
    code_bytes: int
    data_bytes: int
    rendered_bytes: int
    unused_bytes: int
    mixed_bytes: int  # Bytes marked as both code and data
    
    @property
    def code_percent(self) -> float:
        return (self.code_bytes / self.total_bytes * 100) if self.total_bytes > 0 else 0
    
    @property
    def data_percent(self) -> float:
        return (self.data_bytes / self.total_bytes * 100) if self.total_bytes > 0 else 0
    
    @property
    def rendered_percent(self) -> float:
        return (self.rendered_bytes / self.total_bytes * 100) if self.total_bytes > 0 else 0
    
    @property
    def unused_percent(self) -> float:
        return (self.unused_bytes / self.total_bytes * 100) if self.total_bytes > 0 else 0
    
    @property
    def coverage_percent(self) -> float:
        return 100 - self.unused_percent


class CDLFile:
    """Represents a CDL file with methods for reading, editing, and analyzing"""
    
    FCEUX_MAGIC = b'CDL\x00'
    MESEN_MAGIC = b'CDL '
    
    def __init__(self, filepath: Optional[str] = None):
        self.filepath = filepath
        self.data: bytearray = bytearray()
        self.format: str = 'unknown'  # 'fceux', 'mesen', or 'raw'
        self.header: bytes = b''
        self.prg_size: int = 0
        self.chr_size: int = 0
        
        if filepath:
            self.load(filepath)
    
    def load(self, filepath: str) -> None:
        """Load a CDL file from disk"""
        self.filepath = filepath
        
        with open(filepath, 'rb') as f:
            # Try to detect format
            magic = f.read(4)
            f.seek(0)
            
            if magic.startswith(b'CDL'):
                # Has a header - likely Mesen or FCEUX with header
                self._load_with_header(f)
            else:
                # Raw CDL data (FCEUX default)
                self._load_raw(f)
    
    def _load_with_header(self, f: BinaryIO) -> None:
        """Load CDL file with header"""
        magic = f.read(4)
        
        if magic == self.MESEN_MAGIC:
            self.format = 'mesen'
            # Mesen format has additional header data
            header_size = struct.unpack('<I', f.read(4))[0]
            f.seek(0)
            self.header = f.read(header_size)
            self.data = bytearray(f.read())
        else:
            # Generic header format
            self.format = 'fceux'
            f.seek(0)
            self.data = bytearray(f.read())
    
    def _load_raw(self, f: BinaryIO) -> None:
        """Load raw CDL data (no header)"""
        self.format = 'raw'
        self.data = bytearray(f.read())
        self.prg_size = len(self.data)
    
    def save(self, filepath: Optional[str] = None) -> None:
        """Save the CDL file to disk"""
        filepath = filepath or self.filepath
        if not filepath:
            raise ValueError("No filepath specified")
        
        with open(filepath, 'wb') as f:
            if self.header:
                f.write(self.header)
            f.write(self.data)
    
    def get_byte(self, offset: int) -> int:
        """Get the CDL byte at the given offset"""
        if 0 <= offset < len(self.data):
            return self.data[offset]
        raise IndexError(f"Offset {offset} out of range")
    
    def set_byte(self, offset: int, value: int) -> None:
        """Set the CDL byte at the given offset"""
        if 0 <= offset < len(self.data):
            self.data[offset] = value & 0xFF
        else:
            raise IndexError(f"Offset {offset} out of range")
    
    def set_flag(self, offset: int, flag: int) -> None:
        """Set a flag bit at the given offset"""
        if 0 <= offset < len(self.data):
            self.data[offset] |= flag
        else:
            raise IndexError(f"Offset {offset} out of range")
    
    def clear_flag(self, offset: int, flag: int) -> None:
        """Clear a flag bit at the given offset"""
        if 0 <= offset < len(self.data):
            self.data[offset] &= ~flag
        else:
            raise IndexError(f"Offset {offset} out of range")
    
    def mark_code(self, start: int, end: int) -> None:
        """Mark a range as code"""
        for offset in range(start, end + 1):
            self.set_flag(offset, 0x01)
    
    def mark_data(self, start: int, end: int) -> None:
        """Mark a range as data"""
        for offset in range(start, end + 1):
            self.set_flag(offset, 0x02)
    
    def clear_range(self, start: int, end: int) -> None:
        """Clear all flags in a range"""
        for offset in range(start, end + 1):
            self.set_byte(offset, 0x00)
    
    def get_stats(self, start: int = 0, end: Optional[int] = None) -> CDLStats:
        """Get statistics for the CDL file or a range"""
        if end is None:
            end = len(self.data) - 1
        
        total = end - start + 1
        code = data = rendered = unused = mixed = 0
        
        for offset in range(start, end + 1):
            byte = self.data[offset]
            is_code = bool(byte & 0x01)
            is_data = bool(byte & 0x02)
            is_rendered = bool(byte & 0x04)
            
            if byte == 0:
                unused += 1
            elif is_code and is_data:
                mixed += 1
            elif is_code:
                code += 1
            elif is_data:
                data += 1
            elif is_rendered:
                rendered += 1
            else:
                # Has other flags but not code/data/rendered
                data += 1  # Count as data
        
        return CDLStats(
            total_bytes=total,
            code_bytes=code,
            data_bytes=data,
            rendered_bytes=rendered,
            unused_bytes=unused,
            mixed_bytes=mixed
        )
    
    def get_bank_stats(self, bank_size: int = 0x4000) -> Dict[int, CDLStats]:
        """Get statistics per bank"""
        stats = {}
        num_banks = (len(self.data) + bank_size - 1) // bank_size
        
        for bank in range(num_banks):
            start = bank * bank_size
            end = min(start + bank_size - 1, len(self.data) - 1)
            stats[bank] = self.get_stats(start, end)
        
        return stats
    
    def find_regions(self, region_type: str = 'all') -> List[CDLRegion]:
        """Find contiguous regions of a specific type"""
        regions = []
        current_start = None
        current_type = None
        
        for offset in range(len(self.data)):
            byte = self.data[offset]
            
            # Determine byte type
            if byte == 0:
                byte_type = 'unused'
            elif (byte & 0x01) and (byte & 0x02):
                byte_type = 'mixed'
            elif byte & 0x01:
                byte_type = 'code'
            elif byte & 0x02:
                byte_type = 'data'
            elif byte & 0x04:
                byte_type = 'rendered'
            else:
                byte_type = 'other'
            
            # Check if we should include this type
            if region_type != 'all' and byte_type != region_type:
                if current_start is not None:
                    regions.append(CDLRegion(
                        start=current_start,
                        end=offset - 1,
                        flags=self.data[current_start],
                        region_type=current_type
                    ))
                    current_start = None
                    current_type = None
                continue
            
            # Start or continue region
            if current_type == byte_type:
                continue  # Continue current region
            else:
                if current_start is not None:
                    regions.append(CDLRegion(
                        start=current_start,
                        end=offset - 1,
                        flags=self.data[current_start],
                        region_type=current_type
                    ))
                current_start = offset
                current_type = byte_type
        
        # Don't forget the last region
        if current_start is not None:
            regions.append(CDLRegion(
                start=current_start,
                end=len(self.data) - 1,
                flags=self.data[current_start],
                region_type=current_type
            ))
        
        return regions
    
    def merge(self, other: 'CDLFile') -> None:
        """Merge another CDL file into this one (OR operation)"""
        if len(self.data) != len(other.data):
            raise ValueError(
                f"CDL files have different sizes: {len(self.data)} vs {len(other.data)}"
            )
        
        for i in range(len(self.data)):
            self.data[i] |= other.data[i]
    
    def export_csv(self, filepath: str, include_header: bool = True) -> None:
        """Export CDL data to CSV format"""
        with open(filepath, 'w') as f:
            if include_header:
                f.write("Offset,Hex,Code,Data,Rendered,Indirect,PCM,IndCode,IndAccess,Bank\n")
            
            for offset, byte in enumerate(self.data):
                hex_val = f"${offset:06X}"
                code = 1 if byte & 0x01 else 0
                data = 1 if byte & 0x02 else 0
                rendered = 1 if byte & 0x04 else 0
                indirect = 1 if byte & 0x08 else 0
                pcm = 1 if byte & 0x10 else 0
                ind_code = 1 if byte & 0x20 else 0
                ind_access = 1 if byte & 0x40 else 0
                bank = 1 if byte & 0x80 else 0
                
                f.write(f"{offset},{hex_val},{code},{data},{rendered},"
                       f"{indirect},{pcm},{ind_code},{ind_access},{bank}\n")
    
    def export_json(self, filepath: str) -> None:
        """Export CDL data and statistics to JSON format"""
        stats = self.get_stats()
        bank_stats = self.get_bank_stats()
        
        data = {
            'filepath': str(self.filepath),
            'format': self.format,
            'size': len(self.data),
            'statistics': {
                'total_bytes': stats.total_bytes,
                'code_bytes': stats.code_bytes,
                'code_percent': round(stats.code_percent, 2),
                'data_bytes': stats.data_bytes,
                'data_percent': round(stats.data_percent, 2),
                'rendered_bytes': stats.rendered_bytes,
                'rendered_percent': round(stats.rendered_percent, 2),
                'unused_bytes': stats.unused_bytes,
                'unused_percent': round(stats.unused_percent, 2),
                'coverage_percent': round(stats.coverage_percent, 2),
                'mixed_bytes': stats.mixed_bytes
            },
            'bank_statistics': {
                str(bank): {
                    'code_percent': round(s.code_percent, 2),
                    'data_percent': round(s.data_percent, 2),
                    'coverage_percent': round(s.coverage_percent, 2)
                }
                for bank, s in bank_stats.items()
            }
        }
        
        with open(filepath, 'w') as f:
            json.dump(data, f, indent=2)
    
    def __len__(self) -> int:
        return len(self.data)


class CDLEditorGUI:
    """Graphical editor for CDL files"""
    
    def __init__(self, cdl_file: Optional[CDLFile] = None):
        if not HAS_TK:
            raise RuntimeError("tkinter is not available")
        
        self.cdl = cdl_file
        self.root = tk.Tk()
        self.root.title("CDL Editor")
        self.root.geometry("1000x700")
        
        self._create_menu()
        self._create_main_layout()
        self._create_status_bar()
        
        if self.cdl:
            self._update_display()
    
    def _create_menu(self):
        """Create the menu bar"""
        menubar = tk.Menu(self.root)
        
        # File menu
        file_menu = tk.Menu(menubar, tearoff=0)
        file_menu.add_command(label="Open...", command=self._open_file, accelerator="Ctrl+O")
        file_menu.add_command(label="Save", command=self._save_file, accelerator="Ctrl+S")
        file_menu.add_command(label="Save As...", command=self._save_file_as)
        file_menu.add_separator()
        file_menu.add_command(label="Export CSV...", command=self._export_csv)
        file_menu.add_command(label="Export JSON...", command=self._export_json)
        file_menu.add_separator()
        file_menu.add_command(label="Merge CDL...", command=self._merge_file)
        file_menu.add_separator()
        file_menu.add_command(label="Exit", command=self.root.quit)
        menubar.add_cascade(label="File", menu=file_menu)
        
        # Edit menu
        edit_menu = tk.Menu(menubar, tearoff=0)
        edit_menu.add_command(label="Mark as Code", command=lambda: self._mark_selection('code'))
        edit_menu.add_command(label="Mark as Data", command=lambda: self._mark_selection('data'))
        edit_menu.add_command(label="Clear Selection", command=lambda: self._mark_selection('clear'))
        menubar.add_cascade(label="Edit", menu=edit_menu)
        
        # View menu
        view_menu = tk.Menu(menubar, tearoff=0)
        view_menu.add_command(label="Statistics", command=self._show_stats)
        view_menu.add_command(label="Bank Statistics", command=self._show_bank_stats)
        view_menu.add_separator()
        view_menu.add_command(label="Find Unused Regions", command=self._find_unused)
        menubar.add_cascade(label="View", menu=view_menu)
        
        self.root.config(menu=menubar)
        
        # Keyboard shortcuts
        self.root.bind('<Control-o>', lambda e: self._open_file())
        self.root.bind('<Control-s>', lambda e: self._save_file())
    
    def _create_main_layout(self):
        """Create the main application layout"""
        # Main paned window
        paned = ttk.PanedWindow(self.root, orient=tk.HORIZONTAL)
        paned.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)
        
        # Left panel - Hex view
        left_frame = ttk.Frame(paned)
        paned.add(left_frame, weight=3)
        
        ttk.Label(left_frame, text="CDL Data (Hex View)").pack(anchor=tk.W)
        
        # Hex view with scrollbar
        hex_frame = ttk.Frame(left_frame)
        hex_frame.pack(fill=tk.BOTH, expand=True)
        
        self.hex_view = tk.Text(hex_frame, font=('Consolas', 10), wrap=tk.NONE)
        hex_scroll_y = ttk.Scrollbar(hex_frame, orient=tk.VERTICAL, command=self.hex_view.yview)
        hex_scroll_x = ttk.Scrollbar(hex_frame, orient=tk.HORIZONTAL, command=self.hex_view.xview)
        self.hex_view.configure(yscrollcommand=hex_scroll_y.set, xscrollcommand=hex_scroll_x.set)
        
        hex_scroll_y.pack(side=tk.RIGHT, fill=tk.Y)
        hex_scroll_x.pack(side=tk.BOTTOM, fill=tk.X)
        self.hex_view.pack(fill=tk.BOTH, expand=True)
        
        # Configure tags for syntax highlighting
        self.hex_view.tag_configure('code', foreground='blue')
        self.hex_view.tag_configure('data', foreground='green')
        self.hex_view.tag_configure('rendered', foreground='purple')
        self.hex_view.tag_configure('unused', foreground='gray')
        self.hex_view.tag_configure('mixed', foreground='red')
        
        # Right panel - Statistics
        right_frame = ttk.Frame(paned)
        paned.add(right_frame, weight=1)
        
        ttk.Label(right_frame, text="Statistics").pack(anchor=tk.W)
        
        self.stats_tree = ttk.Treeview(right_frame, columns=('Value',), show='tree headings')
        self.stats_tree.heading('#0', text='Statistic')
        self.stats_tree.heading('Value', text='Value')
        self.stats_tree.column('#0', width=150)
        self.stats_tree.column('Value', width=100)
        self.stats_tree.pack(fill=tk.BOTH, expand=True)
        
        # Navigation controls
        nav_frame = ttk.Frame(left_frame)
        nav_frame.pack(fill=tk.X, pady=5)
        
        ttk.Label(nav_frame, text="Go to offset:").pack(side=tk.LEFT)
        self.offset_entry = ttk.Entry(nav_frame, width=10)
        self.offset_entry.pack(side=tk.LEFT, padx=5)
        ttk.Button(nav_frame, text="Go", command=self._goto_offset).pack(side=tk.LEFT)
        
        ttk.Label(nav_frame, text="Bank:").pack(side=tk.LEFT, padx=(20, 5))
        self.bank_combo = ttk.Combobox(nav_frame, width=5, state='readonly')
        self.bank_combo.pack(side=tk.LEFT)
        self.bank_combo.bind('<<ComboboxSelected>>', self._on_bank_select)
    
    def _create_status_bar(self):
        """Create the status bar"""
        self.status_var = tk.StringVar(value="Ready")
        status_bar = ttk.Label(self.root, textvariable=self.status_var, relief=tk.SUNKEN)
        status_bar.pack(fill=tk.X, side=tk.BOTTOM)
    
    def _update_display(self):
        """Update the display with current CDL data"""
        if not self.cdl:
            return
        
        # Update hex view (show first 0x1000 bytes)
        self.hex_view.delete('1.0', tk.END)
        
        lines = []
        for offset in range(0, min(len(self.cdl), 0x10000), 16):
            hex_str = f"${offset:06X}: "
            for i in range(16):
                if offset + i < len(self.cdl):
                    byte = self.cdl.data[offset + i]
                    hex_str += f"{byte:02X} "
                else:
                    hex_str += "   "
            lines.append(hex_str)
        
        self.hex_view.insert('1.0', '\n'.join(lines))
        
        # Apply syntax highlighting
        for line_num, offset in enumerate(range(0, min(len(self.cdl), 0x10000), 16)):
            for i in range(16):
                if offset + i < len(self.cdl):
                    byte = self.cdl.data[offset + i]
                    col_start = 10 + i * 3
                    col_end = col_start + 2
                    
                    start_idx = f"{line_num + 1}.{col_start}"
                    end_idx = f"{line_num + 1}.{col_end}"
                    
                    if byte == 0:
                        tag = 'unused'
                    elif (byte & 0x01) and (byte & 0x02):
                        tag = 'mixed'
                    elif byte & 0x01:
                        tag = 'code'
                    elif byte & 0x02:
                        tag = 'data'
                    elif byte & 0x04:
                        tag = 'rendered'
                    else:
                        tag = 'unused'
                    
                    self.hex_view.tag_add(tag, start_idx, end_idx)
        
        # Update statistics
        self._update_stats()
        
        # Update bank combo
        num_banks = (len(self.cdl) + 0x3FFF) // 0x4000
        self.bank_combo['values'] = list(range(num_banks))
        if num_banks > 0:
            self.bank_combo.current(0)
        
        # Update status
        self.status_var.set(f"Loaded: {self.cdl.filepath} ({len(self.cdl):,} bytes)")
    
    def _update_stats(self):
        """Update the statistics display"""
        if not self.cdl:
            return
        
        # Clear existing
        for item in self.stats_tree.get_children():
            self.stats_tree.delete(item)
        
        stats = self.cdl.get_stats()
        
        self.stats_tree.insert('', 'end', text='Total Bytes', values=(f"{stats.total_bytes:,}",))
        self.stats_tree.insert('', 'end', text='Code Bytes', values=(f"{stats.code_bytes:,} ({stats.code_percent:.1f}%)",))
        self.stats_tree.insert('', 'end', text='Data Bytes', values=(f"{stats.data_bytes:,} ({stats.data_percent:.1f}%)",))
        self.stats_tree.insert('', 'end', text='Rendered', values=(f"{stats.rendered_bytes:,} ({stats.rendered_percent:.1f}%)",))
        self.stats_tree.insert('', 'end', text='Unused', values=(f"{stats.unused_bytes:,} ({stats.unused_percent:.1f}%)",))
        self.stats_tree.insert('', 'end', text='Mixed', values=(f"{stats.mixed_bytes:,}",))
        self.stats_tree.insert('', 'end', text='Coverage', values=(f"{stats.coverage_percent:.1f}%",))
    
    def _open_file(self):
        """Open a CDL file"""
        filepath = filedialog.askopenfilename(
            filetypes=[("CDL Files", "*.cdl"), ("All Files", "*.*")]
        )
        if filepath:
            try:
                self.cdl = CDLFile(filepath)
                self._update_display()
            except Exception as e:
                messagebox.showerror("Error", f"Failed to open file: {e}")
    
    def _save_file(self):
        """Save the current CDL file"""
        if self.cdl and self.cdl.filepath:
            try:
                self.cdl.save()
                self.status_var.set(f"Saved: {self.cdl.filepath}")
            except Exception as e:
                messagebox.showerror("Error", f"Failed to save file: {e}")
    
    def _save_file_as(self):
        """Save the CDL file with a new name"""
        if not self.cdl:
            return
        
        filepath = filedialog.asksaveasfilename(
            defaultextension=".cdl",
            filetypes=[("CDL Files", "*.cdl"), ("All Files", "*.*")]
        )
        if filepath:
            try:
                self.cdl.save(filepath)
                self.status_var.set(f"Saved: {filepath}")
            except Exception as e:
                messagebox.showerror("Error", f"Failed to save file: {e}")
    
    def _export_csv(self):
        """Export to CSV"""
        if not self.cdl:
            return
        
        filepath = filedialog.asksaveasfilename(
            defaultextension=".csv",
            filetypes=[("CSV Files", "*.csv")]
        )
        if filepath:
            try:
                self.cdl.export_csv(filepath)
                self.status_var.set(f"Exported to: {filepath}")
            except Exception as e:
                messagebox.showerror("Error", f"Failed to export: {e}")
    
    def _export_json(self):
        """Export to JSON"""
        if not self.cdl:
            return
        
        filepath = filedialog.asksaveasfilename(
            defaultextension=".json",
            filetypes=[("JSON Files", "*.json")]
        )
        if filepath:
            try:
                self.cdl.export_json(filepath)
                self.status_var.set(f"Exported to: {filepath}")
            except Exception as e:
                messagebox.showerror("Error", f"Failed to export: {e}")
    
    def _merge_file(self):
        """Merge another CDL file"""
        if not self.cdl:
            messagebox.showwarning("Warning", "Please open a CDL file first")
            return
        
        filepath = filedialog.askopenfilename(
            filetypes=[("CDL Files", "*.cdl"), ("All Files", "*.*")]
        )
        if filepath:
            try:
                other = CDLFile(filepath)
                self.cdl.merge(other)
                self._update_display()
                self.status_var.set(f"Merged: {filepath}")
            except Exception as e:
                messagebox.showerror("Error", f"Failed to merge: {e}")
    
    def _mark_selection(self, mark_type: str):
        """Mark selected region"""
        # Placeholder for selection marking
        messagebox.showinfo("Info", f"Mark as {mark_type} - Selection support coming soon")
    
    def _show_stats(self):
        """Show detailed statistics"""
        if not self.cdl:
            return
        
        stats = self.cdl.get_stats()
        msg = f"""CDL Statistics
        
Total Size: {stats.total_bytes:,} bytes
Code: {stats.code_bytes:,} bytes ({stats.code_percent:.2f}%)
Data: {stats.data_bytes:,} bytes ({stats.data_percent:.2f}%)
Rendered: {stats.rendered_bytes:,} bytes ({stats.rendered_percent:.2f}%)
Unused: {stats.unused_bytes:,} bytes ({stats.unused_percent:.2f}%)
Mixed (Code+Data): {stats.mixed_bytes:,} bytes

Overall Coverage: {stats.coverage_percent:.2f}%"""
        
        messagebox.showinfo("Statistics", msg)
    
    def _show_bank_stats(self):
        """Show per-bank statistics"""
        if not self.cdl:
            return
        
        bank_stats = self.cdl.get_bank_stats()
        
        lines = ["Bank Statistics (16KB banks)\n"]
        lines.append("Bank    Code      Data      Coverage")
        lines.append("-" * 45)
        
        for bank, stats in bank_stats.items():
            lines.append(f"{bank:3d}    {stats.code_percent:5.1f}%    {stats.data_percent:5.1f}%    {stats.coverage_percent:5.1f}%")
        
        # Create a new window for this
        stats_window = tk.Toplevel(self.root)
        stats_window.title("Bank Statistics")
        stats_window.geometry("400x500")
        
        text = tk.Text(stats_window, font=('Consolas', 10))
        text.pack(fill=tk.BOTH, expand=True)
        text.insert('1.0', '\n'.join(lines))
        text.config(state=tk.DISABLED)
    
    def _find_unused(self):
        """Find and display unused regions"""
        if not self.cdl:
            return
        
        regions = self.cdl.find_regions('unused')
        
        # Filter to significant regions (> 16 bytes)
        significant = [r for r in regions if r.size >= 16]
        
        lines = [f"Found {len(significant)} unused regions (>= 16 bytes)\n"]
        for region in significant[:50]:  # Show first 50
            lines.append(f"${region.start:06X} - ${region.end:06X} ({region.size:,} bytes)")
        
        if len(significant) > 50:
            lines.append(f"\n... and {len(significant) - 50} more regions")
        
        # Create window
        unused_window = tk.Toplevel(self.root)
        unused_window.title("Unused Regions")
        unused_window.geometry("400x500")
        
        text = tk.Text(unused_window, font=('Consolas', 10))
        text.pack(fill=tk.BOTH, expand=True)
        text.insert('1.0', '\n'.join(lines))
        text.config(state=tk.DISABLED)
    
    def _goto_offset(self):
        """Go to a specific offset"""
        offset_str = self.offset_entry.get().strip()
        try:
            if offset_str.startswith('$') or offset_str.startswith('0x'):
                offset = int(offset_str.replace('$', ''), 16)
            else:
                offset = int(offset_str)
            
            line = offset // 16 + 1
            self.hex_view.see(f"{line}.0")
        except ValueError:
            messagebox.showerror("Error", "Invalid offset format")
    
    def _on_bank_select(self, event):
        """Handle bank selection"""
        try:
            bank = int(self.bank_combo.get())
            offset = bank * 0x4000
            line = offset // 16 + 1
            self.hex_view.see(f"{line}.0")
        except (ValueError, tk.TclError):
            pass
    
    def run(self):
        """Run the GUI application"""
        self.root.mainloop()


def print_stats(cdl: CDLFile) -> None:
    """Print CDL statistics to console"""
    stats = cdl.get_stats()
    
    print(f"\n{'='*50}")
    print(f"CDL File: {cdl.filepath}")
    print(f"Format: {cdl.format}")
    print(f"{'='*50}")
    print(f"Total Size:     {stats.total_bytes:>10,} bytes")
    print(f"Code:           {stats.code_bytes:>10,} bytes ({stats.code_percent:5.2f}%)")
    print(f"Data:           {stats.data_bytes:>10,} bytes ({stats.data_percent:5.2f}%)")
    print(f"Rendered:       {stats.rendered_bytes:>10,} bytes ({stats.rendered_percent:5.2f}%)")
    print(f"Unused:         {stats.unused_bytes:>10,} bytes ({stats.unused_percent:5.2f}%)")
    print(f"Mixed:          {stats.mixed_bytes:>10,} bytes")
    print(f"{'='*50}")
    print(f"Coverage:       {stats.coverage_percent:5.2f}%")
    print(f"{'='*50}\n")


def print_bank_stats(cdl: CDLFile) -> None:
    """Print per-bank statistics"""
    bank_stats = cdl.get_bank_stats()
    
    print(f"\nBank Statistics (16KB banks):")
    print(f"{'Bank':>5} {'Code':>10} {'Data':>10} {'Coverage':>10}")
    print("-" * 40)
    
    for bank, stats in bank_stats.items():
        print(f"{bank:>5} {stats.code_percent:>9.1f}% {stats.data_percent:>9.1f}% {stats.coverage_percent:>9.1f}%")


def main():
    parser = argparse.ArgumentParser(description='CDL Editor and Analyzer')
    parser.add_argument('cdl_file', nargs='?', help='CDL file to open')
    parser.add_argument('--info', action='store_true', help='Show CDL file info and statistics')
    parser.add_argument('--export-csv', metavar='FILE', help='Export to CSV format')
    parser.add_argument('--export-json', metavar='FILE', help='Export to JSON format')
    parser.add_argument('--merge', metavar='FILE', help='Merge another CDL file')
    parser.add_argument('--gui', action='store_true', help='Launch graphical editor')
    parser.add_argument('--bank-stats', action='store_true', help='Show per-bank statistics')
    parser.add_argument('--find-unused', action='store_true', help='Find unused regions')
    parser.add_argument('--find-code', action='store_true', help='Find code regions')
    
    args = parser.parse_args()
    
    # GUI mode
    if args.gui or (not args.cdl_file and not sys.stdin.isatty()):
        if not HAS_TK:
            print("Error: tkinter is not available. Install it to use the GUI.")
            sys.exit(1)
        
        cdl = CDLFile(args.cdl_file) if args.cdl_file else None
        editor = CDLEditorGUI(cdl)
        editor.run()
        return
    
    # Command-line mode
    if not args.cdl_file:
        parser.print_help()
        sys.exit(1)
    
    cdl = CDLFile(args.cdl_file)
    
    if args.info:
        print_stats(cdl)
    
    if args.bank_stats:
        print_bank_stats(cdl)
    
    if args.find_unused:
        regions = cdl.find_regions('unused')
        significant = [r for r in regions if r.size >= 16]
        print(f"\nUnused regions (>= 16 bytes): {len(significant)}")
        for region in significant[:20]:
            print(f"  ${region.start:06X} - ${region.end:06X} ({region.size:,} bytes)")
        if len(significant) > 20:
            print(f"  ... and {len(significant) - 20} more")
    
    if args.find_code:
        regions = cdl.find_regions('code')
        print(f"\nCode regions: {len(regions)}")
        for region in regions[:20]:
            print(f"  ${region.start:06X} - ${region.end:06X} ({region.size:,} bytes)")
        if len(regions) > 20:
            print(f"  ... and {len(regions) - 20} more")
    
    if args.merge:
        other = CDLFile(args.merge)
        cdl.merge(other)
        cdl.save()
        print(f"Merged {args.merge} into {args.cdl_file}")
    
    if args.export_csv:
        cdl.export_csv(args.export_csv)
        print(f"Exported to {args.export_csv}")
    
    if args.export_json:
        cdl.export_json(args.export_json)
        print(f"Exported to {args.export_json}")
    
    # Default action if no specific flags
    if not any([args.info, args.bank_stats, args.find_unused, args.find_code,
                args.merge, args.export_csv, args.export_json]):
        print_stats(cdl)


if __name__ == '__main__':
    main()
