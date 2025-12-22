#!/usr/bin/env python3
"""
Soul Blazer Label Applier
Applies symbol labels to disassembly files by adding comments and cross-references.
"""

import os
import re
from pathlib import Path
from typing import Dict, Tuple


def load_symbols(sym_file: Path) -> Dict[int, Tuple[str, str]]:
	"""Load symbols from .sym file. Returns dict of addr -> (name, comment)."""
	symbols = {}
	with open(sym_file, 'r', encoding='utf-8') as f:
		for line in f:
			line = line.strip()
			if not line or line.startswith(';'):
				continue
			
			# Parse: $00:8000 Label  ; comment
			match = re.match(r'\$([0-9a-f]{2}):([0-9a-f]{4})\s+(\S+)(?:\s*;\s*(.*))?', line, re.I)
			if match:
				bank = int(match.group(1), 16)
				addr = int(match.group(2), 16)
				name = match.group(3)
				comment = match.group(4) or ""
				full_addr = (bank << 16) | addr
				symbols[full_addr] = (name, comment)
	
	return symbols


def apply_labels_to_file(asm_file: Path, symbols: Dict[int, Tuple[str, str]], output_dir: Path) -> int:
	"""Apply labels to a disassembly file. Returns count of labels applied."""
	with open(asm_file, 'r', encoding='utf-8') as f:
		lines = f.readlines()

	modified = []
	labels_applied = 0

	for line in lines:
		# Check if this line starts with an address
		match = re.match(r'^\$([0-9a-f]{2}):([0-9a-f]{4})\s', line, re.I)
		if match:
			bank = int(match.group(1), 16)
			addr = int(match.group(2), 16)
			full_addr = (bank << 16) | addr
			
			# Check if we have a label for this address
			if full_addr in symbols:
				name, comment = symbols[full_addr]
				# Check if label already exists
				if not any(l.strip() == f"{name}:" for l in modified[-5:] if l.strip()):
					label_line = f"{name}:\n"
					modified.append(label_line)
					labels_applied += 1
		
		# Also add cross-reference comments for JSL/JSR targets
		for pattern, prefix in [(r'jsl\s+\$([0-9a-f]{6})', ''), (r'jsr\s+\$([0-9a-f]{4})', '')]:
			match = re.search(pattern, line, re.I)
			if match:
				target_str = match.group(1)
				if len(target_str) == 6:
					target = int(target_str, 16)
				else:
					# JSR uses bank from current context
					bank_match = re.match(r'^\$([0-9a-f]{2}):', line, re.I)
					if bank_match:
						bank = int(bank_match.group(1), 16)
						target = (bank << 16) | int(target_str, 16)
					else:
						target = int(target_str, 16)
				
				if target in symbols:
					name, _ = symbols[target]
					# Add label reference as comment if not already there
					if f"; -> {name}" not in line and name not in line:
						line = line.rstrip() + f"  ; -> {name}\n"
				break
		
		modified.append(line)

	# Write modified file
	output_file = output_dir / asm_file.name
	with open(output_file, 'w', encoding='utf-8') as f:
		f.writelines(modified)

	return labels_applied


def main():
	import sys

	script_dir = Path(__file__).parent
	disasm_dir = script_dir.parent / "disasm"
	sym_file = disasm_dir / "soul_blazer.sym"
	output_dir = disasm_dir / "labeled"

	if len(sys.argv) > 1:
		disasm_dir = Path(sys.argv[1])
		sym_file = disasm_dir / "soul_blazer.sym"
		output_dir = disasm_dir / "labeled"

	if not sym_file.exists():
		print(f"Error: Symbol file not found: {sym_file}")
		sys.exit(1)

	output_dir.mkdir(exist_ok=True)

	print(f"Loading symbols from {sym_file}...")
	symbols = load_symbols(sym_file)
	print(f"Loaded {len(symbols)} symbols")

	total_labels = 0
	for asm_file in sorted(disasm_dir.glob('bank*.asm')):
		count = apply_labels_to_file(asm_file, symbols, output_dir)
		print(f"  {asm_file.name}: {count} labels applied")
		total_labels += count

	print(f"\nTotal labels applied: {total_labels}")
	print(f"Labeled files written to: {output_dir}")


if __name__ == "__main__":
	main()
