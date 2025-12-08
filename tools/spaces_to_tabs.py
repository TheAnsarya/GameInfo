#!/usr/bin/env python3
"""
Convert indentation from spaces to tabs in source files.
Respects .editorconfig settings.
"""

import os
import re
import sys
from pathlib import Path


def convert_spaces_to_tabs(content: str, spaces_per_tab: int = 4) -> str:
	"""Convert leading spaces to tabs."""
	lines = content.split('\n')
	result = []

	for line in lines:
		if not line.strip():
			# Empty or whitespace-only line
			result.append('')
			continue

		# Count leading spaces
		stripped = line.lstrip(' ')
		leading_spaces = len(line) - len(stripped)

		if leading_spaces > 0:
			# Convert to tabs
			tabs = leading_spaces // spaces_per_tab
			remaining_spaces = leading_spaces % spaces_per_tab
			new_line = '\t' * tabs + ' ' * remaining_spaces + stripped
			result.append(new_line)
		else:
			result.append(line)

	return '\n'.join(result)


def process_file(filepath: str, dry_run: bool = False) -> bool:
	"""Process a single file. Returns True if changes were made."""
	try:
		with open(filepath, 'r', encoding='utf-8') as f:
			content = f.read()
	except (UnicodeDecodeError, IOError):
		return False

	# Check if file has space indentation
	if not re.search(r'^[ ]{2,}', content, re.MULTILINE):
		return False

	new_content = convert_spaces_to_tabs(content)

	if new_content == content:
		return False

	if not dry_run:
		with open(filepath, 'w', encoding='utf-8', newline='\n') as f:
			f.write(new_content)

	return True


def main():
	if len(sys.argv) < 2:
		print("Usage: python spaces_to_tabs.py <directory> [--dry-run]")
		sys.exit(1)

	directory = sys.argv[1]
	dry_run = '--dry-run' in sys.argv

	extensions = {'.py', '.json'}
	changed_files = []

	for root, dirs, files in os.walk(directory):
		# Skip hidden directories and common non-source directories
		dirs[:] = [d for d in dirs if not d.startswith('.') and d not in {'__pycache__', 'node_modules', 'venv', '.git'}]

		for filename in files:
			ext = os.path.splitext(filename)[1].lower()
			if ext in extensions:
				filepath = os.path.join(root, filename)
				if process_file(filepath, dry_run):
					changed_files.append(filepath)
					print(f"{'Would convert' if dry_run else 'Converted'}: {filepath}")

	print(f"\n{'Would convert' if dry_run else 'Converted'} {len(changed_files)} files")


if __name__ == '__main__':
	main()
