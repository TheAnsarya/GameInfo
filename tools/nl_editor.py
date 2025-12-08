#!/usr/bin/env python3
"""
NL (FCEUX Name List) Editor

A tool for viewing, editing, and managing FCEUX Name List files.

Features:
- View and edit labels
- Manage multiple bank files
- Import from MLB (Mesen) format
- Export to various formats
- GUI and CLI interfaces
- Label validation
- Batch operations

Usage:
    python nl_editor.py <nl_file> [options]
    python nl_editor.py --gui
    python nl_editor.py --import-mlb <mlb_file> --output-dir <dir>
"""

import argparse
import json
import os
import re
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Tuple

try:
    import tkinter as tk
    from tkinter import ttk, filedialog, messagebox, simpledialog
    HAS_TK = True
except ImportError:
    HAS_TK = False


@dataclass
class NLLabel:
    """A single NL label entry"""
    address: int
    name: str
    comment: str = ""
    
    @property
    def address_hex(self) -> str:
        """Get address as hex string"""
        return f"${self.address:04X}"
    
    def to_nl_line(self) -> str:
        """Convert to NL file format line"""
        if self.comment:
            return f"${self.address:04X}#{self.name}#{self.comment}"
        return f"${self.address:04X}#{self.name}#"
    
    @classmethod
    def from_nl_line(cls, line: str) -> Optional['NLLabel']:
        """Parse an NL file line"""
        line = line.strip()
        if not line or line.startswith(';'):
            return None
        
        # Parse format: $XXXX#name#comment
        match = re.match(r'\$([0-9A-Fa-f]+)#([^#]+)(?:#(.*))?', line)
        if match:
            address = int(match.group(1), 16)
            name = match.group(2)
            comment = match.group(3) or ""
            return cls(address=address, name=name, comment=comment)
        
        return None


class NLFile:
    """Represents a single NL file"""
    
    def __init__(self, filepath: Optional[str] = None):
        self.filepath = filepath
        self.labels: Dict[int, NLLabel] = {}  # Key: address
        self.header_comments: List[str] = []
        self.bank: int = -1  # Bank number for ROM files
        self.is_ram: bool = False
        
        if filepath:
            self.load(filepath)
    
    def _parse_filename(self, filepath: str) -> None:
        """Parse filename to determine bank/type"""
        basename = os.path.basename(filepath)
        
        # Check for RAM file: name.nes.ram.nl
        if '.ram.nl' in basename:
            self.is_ram = True
            self.bank = -1
        else:
            # ROM file: name.nes.X.nl where X is bank number
            match = re.search(r'\.(\d+)\.nl$', basename, re.IGNORECASE)
            if match:
                self.bank = int(match.group(1))
    
    def load(self, filepath: str) -> None:
        """Load an NL file"""
        self.filepath = filepath
        self.labels.clear()
        self.header_comments.clear()
        self._parse_filename(filepath)
        
        with open(filepath, 'r', encoding='utf-8') as f:
            header_done = False
            for line in f:
                line = line.rstrip('\n\r')
                
                if line.startswith(';'):
                    if not header_done:
                        self.header_comments.append(line)
                    continue
                
                if not line.strip():
                    continue
                
                header_done = True
                label = NLLabel.from_nl_line(line)
                if label:
                    self.labels[label.address] = label
    
    def save(self, filepath: Optional[str] = None) -> None:
        """Save the NL file"""
        filepath = filepath or self.filepath
        if not filepath:
            raise ValueError("No filepath specified")
        
        lines = []
        
        # Add header comments
        for comment in self.header_comments:
            lines.append(comment)
        
        if self.header_comments:
            lines.append("")
        
        # Sort labels by address
        for address in sorted(self.labels.keys()):
            lines.append(self.labels[address].to_nl_line())
        
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write('\n'.join(lines) + '\n')
    
    def add_label(self, label: NLLabel) -> None:
        """Add or update a label"""
        self.labels[label.address] = label
    
    def remove_label(self, address: int) -> bool:
        """Remove a label"""
        if address in self.labels:
            del self.labels[address]
            return True
        return False
    
    def get_label(self, address: int) -> Optional[NLLabel]:
        """Get a label by address"""
        return self.labels.get(address)
    
    def find_labels(self, pattern: str) -> List[NLLabel]:
        """Find labels matching a pattern"""
        regex = re.compile(pattern, re.IGNORECASE)
        return [l for l in self.labels.values() 
                if regex.search(l.name) or regex.search(l.comment)]
    
    def merge(self, other: 'NLFile', overwrite: bool = False) -> int:
        """Merge another NL file into this one"""
        merged = 0
        for label in other.labels.values():
            if label.address not in self.labels or overwrite:
                self.labels[label.address] = label
                merged += 1
        return merged


class NLProject:
    """Manages a collection of NL files for a ROM"""
    
    def __init__(self, rom_name: str = "", base_dir: str = "."):
        self.rom_name = rom_name
        self.base_dir = base_dir
        self.ram_file: Optional[NLFile] = None
        self.bank_files: Dict[int, NLFile] = {}
    
    def load_all(self, pattern: str) -> int:
        """Load all NL files matching a pattern"""
        count = 0
        base_dir = os.path.dirname(pattern) or "."
        
        for filepath in Path(base_dir).glob("*.nl"):
            filepath_str = str(filepath)
            nl_file = NLFile(filepath_str)
            
            if nl_file.is_ram:
                self.ram_file = nl_file
            else:
                self.bank_files[nl_file.bank] = nl_file
            
            count += 1
        
        return count
    
    def load_rom_files(self, rom_path: str) -> int:
        """Load all NL files for a specific ROM"""
        rom_name = os.path.splitext(os.path.basename(rom_path))[0]
        base_dir = os.path.dirname(rom_path) or "."
        
        self.rom_name = rom_name
        self.base_dir = base_dir
        
        count = 0
        
        # Try to load RAM file
        ram_path = os.path.join(base_dir, f"{rom_name}.nes.ram.nl")
        if os.path.exists(ram_path):
            self.ram_file = NLFile(ram_path)
            count += 1
        
        # Load bank files
        for i in range(256):  # Max 256 banks
            bank_path = os.path.join(base_dir, f"{rom_name}.nes.{i}.nl")
            if os.path.exists(bank_path):
                self.bank_files[i] = NLFile(bank_path)
                count += 1
        
        return count
    
    def save_all(self) -> None:
        """Save all files"""
        if self.ram_file:
            self.ram_file.save()
        
        for nl_file in self.bank_files.values():
            nl_file.save()
    
    def get_all_labels(self) -> List[Tuple[str, NLLabel]]:
        """Get all labels with their source"""
        labels = []
        
        if self.ram_file:
            for label in self.ram_file.labels.values():
                labels.append(("RAM", label))
        
        for bank, nl_file in sorted(self.bank_files.items()):
            for label in nl_file.labels.values():
                labels.append((f"Bank {bank}", label))
        
        return labels
    
    def get_stats(self) -> Dict[str, int]:
        """Get statistics"""
        stats = {
            'total_labels': 0,
            'ram_labels': 0,
            'rom_labels': 0,
            'banks': len(self.bank_files),
            'with_comments': 0,
        }
        
        if self.ram_file:
            stats['ram_labels'] = len(self.ram_file.labels)
            for label in self.ram_file.labels.values():
                if label.comment:
                    stats['with_comments'] += 1
        
        for nl_file in self.bank_files.values():
            stats['rom_labels'] += len(nl_file.labels)
            for label in nl_file.labels.values():
                if label.comment:
                    stats['with_comments'] += 1
        
        stats['total_labels'] = stats['ram_labels'] + stats['rom_labels']
        return stats
    
    def export_mlb(self, output_path: str) -> int:
        """Export to MLB format"""
        lines = ["; Mesen Label File", "; Exported from NL files", ""]
        count = 0
        
        # RAM labels
        if self.ram_file:
            lines.append("; RAM Labels")
            for label in sorted(self.ram_file.labels.values(), key=lambda l: l.address):
                lines.append(f"R:{label.address:04X}:{label.name}:{label.comment}")
                count += 1
            lines.append("")
        
        # ROM labels by bank
        for bank in sorted(self.bank_files.keys()):
            nl_file = self.bank_files[bank]
            lines.append(f"; Bank {bank} Labels")
            for label in sorted(nl_file.labels.values(), key=lambda l: l.address):
                lines.append(f"P:{bank:02X}:{label.address:04X}:{label.name}:{label.comment}")
                count += 1
            lines.append("")
        
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write('\n'.join(lines))
        
        return count
    
    def import_mlb(self, mlb_path: str) -> int:
        """Import from MLB format"""
        imported = 0
        
        with open(mlb_path, 'r', encoding='utf-8') as f:
            for line in f:
                line = line.strip()
                if not line or line.startswith(';'):
                    continue
                
                parts = line.split(':')
                if len(parts) < 3:
                    continue
                
                addr_type = parts[0]
                
                try:
                    if addr_type == 'R':  # RAM
                        # R:XXXX:name:comment
                        address = int(parts[1], 16)
                        name = parts[2]
                        comment = parts[3] if len(parts) > 3 else ""
                        
                        if not self.ram_file:
                            ram_path = os.path.join(self.base_dir, f"{self.rom_name}.nes.ram.nl")
                            self.ram_file = NLFile()
                            self.ram_file.filepath = ram_path
                            self.ram_file.is_ram = True
                        
                        self.ram_file.add_label(NLLabel(address=address, name=name, comment=comment))
                        imported += 1
                    
                    elif addr_type == 'P':  # PRG ROM
                        # P:BB:XXXX:name:comment
                        if len(parts) >= 4:
                            bank = int(parts[1], 16)
                            address = int(parts[2], 16)
                            name = parts[3]
                            comment = parts[4] if len(parts) > 4 else ""
                        else:
                            # P:XXXX:name:comment (no bank)
                            bank = 0
                            address = int(parts[1], 16)
                            name = parts[2]
                            comment = parts[3] if len(parts) > 3 else ""
                        
                        if bank not in self.bank_files:
                            bank_path = os.path.join(self.base_dir, f"{self.rom_name}.nes.{bank}.nl")
                            self.bank_files[bank] = NLFile()
                            self.bank_files[bank].filepath = bank_path
                            self.bank_files[bank].bank = bank
                        
                        self.bank_files[bank].add_label(NLLabel(address=address, name=name, comment=comment))
                        imported += 1
                
                except (ValueError, IndexError):
                    continue
        
        return imported


class NLEditorGUI:
    """GUI editor for NL files"""
    
    def __init__(self, nl_file: Optional[NLFile] = None):
        if not HAS_TK:
            raise RuntimeError("tkinter is not available")
        
        self.project = NLProject()
        if nl_file:
            if nl_file.is_ram:
                self.project.ram_file = nl_file
            else:
                self.project.bank_files[nl_file.bank] = nl_file
        
        self.current_file: Optional[NLFile] = nl_file
        
        self.root = tk.Tk()
        self.root.title("NL Label Editor")
        self.root.geometry("1100x700")
        
        self._create_menu()
        self._create_toolbar()
        self._create_main_layout()
        self._create_status_bar()
        
        self._refresh_file_list()
        self._refresh_label_list()
    
    def _create_menu(self):
        """Create menu bar"""
        menubar = tk.Menu(self.root)
        
        # File menu
        file_menu = tk.Menu(menubar, tearoff=0)
        file_menu.add_command(label="New File", command=self._new_file, accelerator="Ctrl+N")
        file_menu.add_command(label="Open File...", command=self._open_file, accelerator="Ctrl+O")
        file_menu.add_command(label="Open ROM Files...", command=self._open_rom_files)
        file_menu.add_command(label="Save", command=self._save_file, accelerator="Ctrl+S")
        file_menu.add_command(label="Save All", command=self._save_all)
        file_menu.add_separator()
        file_menu.add_command(label="Import MLB...", command=self._import_mlb)
        file_menu.add_command(label="Export MLB...", command=self._export_mlb)
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
        tools_menu.add_command(label="Add Bank...", command=self._add_bank)
        tools_menu.add_command(label="Statistics", command=self._show_stats)
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
        self.filter_var.trace('w', lambda *args: self._refresh_label_list())
        ttk.Entry(toolbar, textvariable=self.filter_var, width=20).pack(side=tk.LEFT, padx=2)
    
    def _create_main_layout(self):
        """Create main layout with file list and label list"""
        main_frame = ttk.Frame(self.root)
        main_frame.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)
        
        # Paned window
        paned = ttk.PanedWindow(main_frame, orient=tk.HORIZONTAL)
        paned.pack(fill=tk.BOTH, expand=True)
        
        # Left panel - file list
        left_frame = ttk.LabelFrame(paned, text="Files", width=200)
        paned.add(left_frame)
        
        self.file_tree = ttk.Treeview(left_frame, show='tree')
        file_vsb = ttk.Scrollbar(left_frame, orient=tk.VERTICAL, command=self.file_tree.yview)
        self.file_tree.configure(yscrollcommand=file_vsb.set)
        
        self.file_tree.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)
        file_vsb.pack(side=tk.RIGHT, fill=tk.Y)
        
        self.file_tree.bind('<<TreeviewSelect>>', self._on_file_select)
        
        # Right panel - label list
        right_frame = ttk.Frame(paned)
        paned.add(right_frame)
        
        columns = ('address', 'name', 'comment')
        self.label_tree = ttk.Treeview(right_frame, columns=columns, show='headings')
        
        self.label_tree.heading('address', text='Address')
        self.label_tree.heading('name', text='Name')
        self.label_tree.heading('comment', text='Comment')
        
        self.label_tree.column('address', width=100)
        self.label_tree.column('name', width=200)
        self.label_tree.column('comment', width=400)
        
        # Scrollbars
        label_vsb = ttk.Scrollbar(right_frame, orient=tk.VERTICAL, command=self.label_tree.yview)
        label_hsb = ttk.Scrollbar(right_frame, orient=tk.HORIZONTAL, command=self.label_tree.xview)
        self.label_tree.configure(yscrollcommand=label_vsb.set, xscrollcommand=label_hsb.set)
        
        self.label_tree.grid(row=0, column=0, sticky='nsew')
        label_vsb.grid(row=0, column=1, sticky='ns')
        label_hsb.grid(row=1, column=0, sticky='ew')
        
        right_frame.rowconfigure(0, weight=1)
        right_frame.columnconfigure(0, weight=1)
        
        # Double-click to edit
        self.label_tree.bind('<Double-1>', lambda e: self._edit_label())
    
    def _create_status_bar(self):
        """Create status bar"""
        self.status_var = tk.StringVar(value="Ready")
        status_bar = ttk.Label(self.root, textvariable=self.status_var, relief=tk.SUNKEN)
        status_bar.pack(fill=tk.X, side=tk.BOTTOM)
    
    def _refresh_file_list(self):
        """Refresh the file list"""
        for item in self.file_tree.get_children():
            self.file_tree.delete(item)
        
        if self.project.ram_file:
            self.file_tree.insert('', 'end', iid='ram', text='RAM')
        
        for bank in sorted(self.project.bank_files.keys()):
            self.file_tree.insert('', 'end', iid=f'bank_{bank}', text=f'Bank {bank}')
    
    def _refresh_label_list(self):
        """Refresh the label list"""
        for item in self.label_tree.get_children():
            self.label_tree.delete(item)
        
        if not self.current_file:
            return
        
        filter_text = self.filter_var.get().lower()
        
        for address in sorted(self.current_file.labels.keys()):
            label = self.current_file.labels[address]
            
            # Apply text filter
            if filter_text:
                if filter_text not in label.name.lower() and filter_text not in label.comment.lower():
                    continue
            
            self.label_tree.insert('', 'end', iid=str(address), values=(
                label.address_hex,
                label.name,
                label.comment
            ))
        
        label_count = len(self.current_file.labels)
        self.status_var.set(f"{label_count} labels")
    
    def _on_file_select(self, event):
        """Handle file selection"""
        selection = self.file_tree.selection()
        if not selection:
            return
        
        item_id = selection[0]
        
        if item_id == 'ram':
            self.current_file = self.project.ram_file
        elif item_id.startswith('bank_'):
            bank = int(item_id.split('_')[1])
            self.current_file = self.project.bank_files.get(bank)
        
        self._refresh_label_list()
    
    def _new_file(self):
        """Create new file"""
        self.project = NLProject()
        self.current_file = None
        self._refresh_file_list()
        self._refresh_label_list()
    
    def _open_file(self):
        """Open NL file"""
        filepath = filedialog.askopenfilename(
            filetypes=[("NL Files", "*.nl"), ("All Files", "*.*")]
        )
        if filepath:
            try:
                nl_file = NLFile(filepath)
                if nl_file.is_ram:
                    self.project.ram_file = nl_file
                else:
                    self.project.bank_files[nl_file.bank] = nl_file
                
                self.current_file = nl_file
                self._refresh_file_list()
                self._refresh_label_list()
                self.status_var.set(f"Opened: {filepath}")
            except Exception as e:
                messagebox.showerror("Error", f"Failed to open file: {e}")
    
    def _open_rom_files(self):
        """Open all NL files for a ROM"""
        filepath = filedialog.askopenfilename(
            filetypes=[("NES ROM", "*.nes"), ("All Files", "*.*")]
        )
        if filepath:
            try:
                count = self.project.load_rom_files(filepath)
                self._refresh_file_list()
                
                if self.project.ram_file:
                    self.current_file = self.project.ram_file
                elif self.project.bank_files:
                    first_bank = min(self.project.bank_files.keys())
                    self.current_file = self.project.bank_files[first_bank]
                
                self._refresh_label_list()
                self.status_var.set(f"Loaded {count} NL files")
            except Exception as e:
                messagebox.showerror("Error", f"Failed to load files: {e}")
    
    def _save_file(self):
        """Save current file"""
        if not self.current_file:
            return
        
        if self.current_file.filepath:
            try:
                self.current_file.save()
                self.status_var.set(f"Saved: {self.current_file.filepath}")
            except Exception as e:
                messagebox.showerror("Error", f"Failed to save: {e}")
        else:
            self._save_file_as()
    
    def _save_file_as(self):
        """Save file with new name"""
        if not self.current_file:
            return
        
        filepath = filedialog.asksaveasfilename(
            defaultextension=".nl",
            filetypes=[("NL Files", "*.nl"), ("All Files", "*.*")]
        )
        if filepath:
            try:
                self.current_file.save(filepath)
                self.status_var.set(f"Saved: {filepath}")
            except Exception as e:
                messagebox.showerror("Error", f"Failed to save: {e}")
    
    def _save_all(self):
        """Save all files"""
        try:
            self.project.save_all()
            self.status_var.set("All files saved")
        except Exception as e:
            messagebox.showerror("Error", f"Failed to save: {e}")
    
    def _add_label(self):
        """Add new label"""
        if not self.current_file:
            messagebox.showwarning("Warning", "No file selected")
            return
        
        dialog = NLLabelDialog(self.root, "Add Label")
        if dialog.result:
            self.current_file.add_label(dialog.result)
            self._refresh_label_list()
    
    def _edit_label(self):
        """Edit selected label"""
        if not self.current_file:
            return
        
        selection = self.label_tree.selection()
        if not selection:
            return
        
        address = int(selection[0])
        label = self.current_file.get_label(address)
        if not label:
            return
        
        dialog = NLLabelDialog(self.root, "Edit Label", label)
        if dialog.result:
            # Remove old, add new (in case address changed)
            del self.current_file.labels[address]
            self.current_file.add_label(dialog.result)
            self._refresh_label_list()
    
    def _delete_label(self):
        """Delete selected label"""
        if not self.current_file:
            return
        
        selection = self.label_tree.selection()
        if not selection:
            return
        
        if messagebox.askyesno("Confirm", f"Delete {len(selection)} label(s)?"):
            for item in selection:
                address = int(item)
                self.current_file.remove_label(address)
            self._refresh_label_list()
    
    def _find_labels(self):
        """Find labels"""
        pattern = simpledialog.askstring("Find", "Enter search pattern:")
        if pattern:
            self.filter_var.set(pattern)
    
    def _add_bank(self):
        """Add a new bank file"""
        bank_str = simpledialog.askstring("Add Bank", "Enter bank number:")
        if bank_str:
            try:
                bank = int(bank_str)
                if bank in self.project.bank_files:
                    messagebox.showwarning("Warning", f"Bank {bank} already exists")
                    return
                
                nl_file = NLFile()
                nl_file.bank = bank
                nl_file.filepath = os.path.join(
                    self.project.base_dir, 
                    f"{self.project.rom_name}.nes.{bank}.nl"
                )
                
                self.project.bank_files[bank] = nl_file
                self.current_file = nl_file
                self._refresh_file_list()
                self._refresh_label_list()
            except ValueError:
                messagebox.showerror("Error", "Invalid bank number")
    
    def _import_mlb(self):
        """Import from MLB file"""
        filepath = filedialog.askopenfilename(
            filetypes=[("MLB Files", "*.mlb"), ("All Files", "*.*")]
        )
        if filepath:
            try:
                count = self.project.import_mlb(filepath)
                self._refresh_file_list()
                self._refresh_label_list()
                messagebox.showinfo("Import", f"Imported {count} labels")
            except Exception as e:
                messagebox.showerror("Error", f"Failed to import: {e}")
    
    def _export_mlb(self):
        """Export to MLB format"""
        filepath = filedialog.asksaveasfilename(
            defaultextension=".mlb",
            filetypes=[("MLB Files", "*.mlb"), ("All Files", "*.*")]
        )
        if filepath:
            try:
                count = self.project.export_mlb(filepath)
                messagebox.showinfo("Export", f"Exported {count} labels")
            except Exception as e:
                messagebox.showerror("Error", f"Failed to export: {e}")
    
    def _show_stats(self):
        """Show statistics"""
        stats = self.project.get_stats()
        msg = f"""Label Statistics:

Total Labels: {stats['total_labels']}
RAM Labels: {stats['ram_labels']}
ROM Labels: {stats['rom_labels']}
Banks: {stats['banks']}
With Comments: {stats['with_comments']}"""
        messagebox.showinfo("Statistics", msg)
    
    def run(self):
        """Run the GUI"""
        self.root.mainloop()


class NLLabelDialog:
    """Dialog for adding/editing labels"""
    
    def __init__(self, parent, title: str, label: Optional[NLLabel] = None):
        self.result: Optional[NLLabel] = None
        
        self.dialog = tk.Toplevel(parent)
        self.dialog.title(title)
        self.dialog.geometry("400x200")
        self.dialog.transient(parent)
        self.dialog.grab_set()
        
        # Form
        frame = ttk.Frame(self.dialog, padding=10)
        frame.pack(fill=tk.BOTH, expand=True)
        
        # Address
        ttk.Label(frame, text="Address (hex):").grid(row=0, column=0, sticky='w', pady=5)
        self.addr_var = tk.StringVar(value=f"{label.address:04X}" if label else '')
        ttk.Entry(frame, textvariable=self.addr_var, width=10).grid(row=0, column=1, sticky='w', pady=5)
        
        # Name
        ttk.Label(frame, text="Name:").grid(row=1, column=0, sticky='w', pady=5)
        self.name_var = tk.StringVar(value=label.name if label else '')
        ttk.Entry(frame, textvariable=self.name_var, width=30).grid(row=1, column=1, sticky='w', pady=5)
        
        # Comment
        ttk.Label(frame, text="Comment:").grid(row=2, column=0, sticky='w', pady=5)
        self.comment_var = tk.StringVar(value=label.comment if label else '')
        ttk.Entry(frame, textvariable=self.comment_var, width=40).grid(row=2, column=1, sticky='w', pady=5)
        
        # Buttons
        btn_frame = ttk.Frame(frame)
        btn_frame.grid(row=3, column=0, columnspan=2, pady=20)
        
        ttk.Button(btn_frame, text="OK", command=self._ok).pack(side=tk.LEFT, padx=5)
        ttk.Button(btn_frame, text="Cancel", command=self._cancel).pack(side=tk.LEFT, padx=5)
        
        self.dialog.wait_window()
    
    def _ok(self):
        """Handle OK"""
        try:
            address = int(self.addr_var.get(), 16)
            
            self.result = NLLabel(
                address=address,
                name=self.name_var.get(),
                comment=self.comment_var.get()
            )
            self.dialog.destroy()
        except ValueError as e:
            messagebox.showerror("Error", f"Invalid input: {e}")
    
    def _cancel(self):
        """Handle Cancel"""
        self.dialog.destroy()


def main():
    parser = argparse.ArgumentParser(description='NL Label Editor')
    parser.add_argument('nl_file', nargs='?', help='NL file to open')
    parser.add_argument('--gui', action='store_true', help='Launch GUI')
    parser.add_argument('--rom', help='Load all NL files for a ROM')
    parser.add_argument('--import-mlb', metavar='FILE', help='Import from MLB file')
    parser.add_argument('--export-mlb', metavar='FILE', help='Export to MLB format')
    parser.add_argument('--output-dir', '-o', help='Output directory')
    parser.add_argument('--stats', action='store_true', help='Show statistics')
    
    args = parser.parse_args()
    
    # GUI mode
    if args.gui or (not args.nl_file and not args.rom and not args.import_mlb):
        if not HAS_TK:
            print("Error: tkinter is required for GUI mode")
            sys.exit(1)
        
        nl_file = NLFile(args.nl_file) if args.nl_file else None
        editor = NLEditorGUI(nl_file)
        editor.run()
        return
    
    # CLI mode
    project = NLProject()
    
    if args.rom:
        project.load_rom_files(args.rom)
    elif args.nl_file:
        nl_file = NLFile(args.nl_file)
        if nl_file.is_ram:
            project.ram_file = nl_file
        else:
            project.bank_files[nl_file.bank] = nl_file
    
    if args.import_mlb:
        count = project.import_mlb(args.import_mlb)
        print(f"Imported {count} labels")
    
    if args.stats:
        stats = project.get_stats()
        print(f"Total: {stats['total_labels']}")
        print(f"RAM: {stats['ram_labels']}")
        print(f"ROM: {stats['rom_labels']}")
        print(f"Banks: {stats['banks']}")
        print(f"With comments: {stats['with_comments']}")
    
    if args.export_mlb:
        count = project.export_mlb(args.export_mlb)
        print(f"Exported {count} labels to {args.export_mlb}")
    
    if args.output_dir:
        project.base_dir = args.output_dir
        project.save_all()
        print(f"Saved to {args.output_dir}")


if __name__ == '__main__':
    main()
