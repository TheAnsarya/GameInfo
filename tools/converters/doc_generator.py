#!/usr/bin/env python3
"""
Auto Documentation Generator - Generate documentation from ROM analysis.

Features:
- Generate Markdown/HTML documentation
- Memory map documentation
- Function/routine documentation
- Data table documentation
- Cross-reference documentation

Author: ROM Hacking Toolkit
"""

import argparse
import json
import os
import re
import sys
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Any, Set


@dataclass
class MemoryEntry:
	"""Memory map entry."""
	address: int
	size: int
	name: str
	description: str = ""
	type_str: str = "byte"
	category: str = ""
	read_locations: List[int] = field(default_factory=list)
	write_locations: List[int] = field(default_factory=list)


@dataclass
class Routine:
	"""Code routine/function."""
	address: int
	name: str
	size: int = 0
	description: str = ""
	parameters: List[str] = field(default_factory=list)
	returns: str = ""
	callers: List[int] = field(default_factory=list)
	callees: List[int] = field(default_factory=list)
	category: str = ""


@dataclass
class DataTable:
	"""Data table definition."""
	address: int
	name: str
	entry_count: int
	entry_size: int
	description: str = ""
	fields: List[Dict[str, Any]] = field(default_factory=list)
	category: str = ""


@dataclass
class DocumentationProject:
	"""Complete documentation project."""
	name: str
	version: str = "1.0"
	platform: str = "NES"
	memory_entries: List[MemoryEntry] = field(default_factory=list)
	routines: List[Routine] = field(default_factory=list)
	data_tables: List[DataTable] = field(default_factory=list)
	notes: Dict[str, str] = field(default_factory=dict)


class MarkdownGenerator:
	"""Generate Markdown documentation."""

	def __init__(self, project: DocumentationProject):
		"""Initialize generator."""
		self.project = project

	def generate_index(self) -> str:
		"""Generate index page."""
		lines = [
			f"# {self.project.name} Documentation",
			"",
			f"**Platform:** {self.project.platform}  ",
			f"**Version:** {self.project.version}  ",
			f"**Generated:** {datetime.now().strftime('%Y-%m-%d %H:%M')}",
			"",
			"## Contents",
			"",
			"- [Memory Map](memory_map.md)",
			"- [Routines](routines.md)",
			"- [Data Tables](data_tables.md)",
			"",
		]

		# Add statistics
		lines.extend([
			"## Statistics",
			"",
			f"- Memory entries: {len(self.project.memory_entries)}",
			f"- Routines: {len(self.project.routines)}",
			f"- Data tables: {len(self.project.data_tables)}",
			"",
		])

		# Add notes
		if self.project.notes:
			lines.extend([
				"## Notes",
				"",
			])
			for title, content in self.project.notes.items():
				lines.append(f"### {title}")
				lines.append("")
				lines.append(content)
				lines.append("")

		return '\n'.join(lines)

	def generate_memory_map(self) -> str:
		"""Generate memory map documentation."""
		lines = [
			f"# {self.project.name} - Memory Map",
			"",
			"[← Back to Index](index.md)",
			"",
		]

		# Group by category
		categories: Dict[str, List[MemoryEntry]] = {}
		for entry in sorted(self.project.memory_entries, key=lambda e: e.address):
			cat = entry.category or "Uncategorized"
			if cat not in categories:
				categories[cat] = []
			categories[cat].append(entry)

		# Generate TOC
		lines.append("## Contents")
		lines.append("")
		for cat in sorted(categories.keys()):
			anchor = cat.lower().replace(' ', '-')
			lines.append(f"- [{cat}](#{anchor})")
		lines.append("")

		# Generate sections
		for cat in sorted(categories.keys()):
			lines.append(f"## {cat}")
			lines.append("")
			lines.append("| Address | Size | Name | Description |")
			lines.append("|---------|------|------|-------------|")

			for entry in categories[cat]:
				addr_str = f"`${entry.address:04X}`"
				size_str = f"{entry.size}" if entry.size > 1 else "1"
				name_str = f"`{entry.name}`"
				desc = entry.description or "-"
				lines.append(f"| {addr_str} | {size_str} | {name_str} | {desc} |")

			lines.append("")

		return '\n'.join(lines)

	def generate_routines(self) -> str:
		"""Generate routines documentation."""
		lines = [
			f"# {self.project.name} - Routines",
			"",
			"[← Back to Index](index.md)",
			"",
		]

		# Group by category
		categories: Dict[str, List[Routine]] = {}
		for routine in sorted(self.project.routines, key=lambda r: r.address):
			cat = routine.category or "Uncategorized"
			if cat not in categories:
				categories[cat] = []
			categories[cat].append(routine)

		# Generate TOC
		lines.append("## Contents")
		lines.append("")
		for cat in sorted(categories.keys()):
			anchor = cat.lower().replace(' ', '-')
			lines.append(f"- [{cat}](#{anchor})")
		lines.append("")

		# Generate sections
		for cat in sorted(categories.keys()):
			lines.append(f"## {cat}")
			lines.append("")

			for routine in categories[cat]:
				lines.append(f"### {routine.name}")
				lines.append("")
				lines.append(f"**Address:** `${routine.address:04X}`  ")
				if routine.size:
					lines.append(f"**Size:** {routine.size} bytes  ")
				lines.append("")

				if routine.description:
					lines.append(routine.description)
					lines.append("")

				if routine.parameters:
					lines.append("**Parameters:**")
					for param in routine.parameters:
						lines.append(f"- {param}")
					lines.append("")

				if routine.returns:
					lines.append(f"**Returns:** {routine.returns}")
					lines.append("")

				if routine.callers:
					lines.append("**Called from:**")
					for caller in routine.callers[:10]:
						lines.append(f"- `${caller:04X}`")
					if len(routine.callers) > 10:
						lines.append(f"- ... and {len(routine.callers) - 10} more")
					lines.append("")

				lines.append("---")
				lines.append("")

		return '\n'.join(lines)

	def generate_data_tables(self) -> str:
		"""Generate data tables documentation."""
		lines = [
			f"# {self.project.name} - Data Tables",
			"",
			"[← Back to Index](index.md)",
			"",
		]

		# Group by category
		categories: Dict[str, List[DataTable]] = {}
		for table in sorted(self.project.data_tables, key=lambda t: t.address):
			cat = table.category or "Uncategorized"
			if cat not in categories:
				categories[cat] = []
			categories[cat].append(table)

		# Generate sections
		for cat in sorted(categories.keys()):
			lines.append(f"## {cat}")
			lines.append("")

			for table in categories[cat]:
				lines.append(f"### {table.name}")
				lines.append("")
				lines.append(f"**Address:** `${table.address:04X}`  ")
				lines.append(f"**Entries:** {table.entry_count}  ")
				lines.append(f"**Entry Size:** {table.entry_size} bytes  ")
				total_size = table.entry_count * table.entry_size
				lines.append(f"**Total Size:** {total_size} bytes  ")
				lines.append("")

				if table.description:
					lines.append(table.description)
					lines.append("")

				if table.fields:
					lines.append("**Structure:**")
					lines.append("")
					lines.append("| Offset | Size | Name | Description |")
					lines.append("|--------|------|------|-------------|")

					for field in table.fields:
						offset = f"`+${field.get('offset', 0):02X}`"
						size = field.get('size', 1)
						name = f"`{field.get('name', '?')}`"
						desc = field.get('description', '-')
						lines.append(f"| {offset} | {size} | {name} | {desc} |")

					lines.append("")

				lines.append("---")
				lines.append("")

		return '\n'.join(lines)

	def generate_all(self, output_dir: str) -> None:
		"""Generate all documentation files."""
		output = Path(output_dir)
		output.mkdir(parents=True, exist_ok=True)

		# Generate files
		(output / "index.md").write_text(self.generate_index(), encoding='utf-8')
		(output / "memory_map.md").write_text(self.generate_memory_map(), encoding='utf-8')
		(output / "routines.md").write_text(self.generate_routines(), encoding='utf-8')
		(output / "data_tables.md").write_text(self.generate_data_tables(), encoding='utf-8')


class HTMLGenerator:
	"""Generate HTML documentation."""

	def __init__(self, project: DocumentationProject):
		"""Initialize generator."""
		self.project = project

	def _header(self, title: str) -> str:
		"""Generate HTML header."""
		return f'''<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>{title}</title>
	<style>
		body {{ font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; margin: 40px; background: #1a1a2e; color: #eee; }}
		h1, h2, h3 {{ color: #00d4ff; }}
		a {{ color: #00d4ff; text-decoration: none; }}
		a:hover {{ text-decoration: underline; }}
		code {{ background: #16213e; padding: 2px 6px; border-radius: 3px; font-family: "Consolas", monospace; color: #00ff88; }}
		table {{ border-collapse: collapse; margin: 20px 0; width: 100%; }}
		th, td {{ border: 1px solid #333; padding: 8px 12px; text-align: left; }}
		th {{ background: #16213e; color: #00d4ff; }}
		tr:nth-child(even) {{ background: rgba(255,255,255,0.05); }}
		.nav {{ margin-bottom: 20px; padding: 10px; background: #16213e; border-radius: 5px; }}
		.section {{ margin: 30px 0; padding: 20px; background: #16213e; border-radius: 5px; }}
		hr {{ border: none; border-top: 1px solid #333; margin: 30px 0; }}
	</style>
</head>
<body>
'''

	def _footer(self) -> str:
		"""Generate HTML footer."""
		return '''
</body>
</html>
'''

	def generate_index(self) -> str:
		"""Generate index page."""
		html = self._header(f"{self.project.name} Documentation")

		html += f'''
<h1>{self.project.name} Documentation</h1>
<p><strong>Platform:</strong> {self.project.platform}<br>
<strong>Version:</strong> {self.project.version}<br>
<strong>Generated:</strong> {datetime.now().strftime('%Y-%m-%d %H:%M')}</p>

<div class="section">
<h2>Contents</h2>
<ul>
	<li><a href="memory_map.html">Memory Map</a></li>
	<li><a href="routines.html">Routines</a></li>
	<li><a href="data_tables.html">Data Tables</a></li>
</ul>
</div>

<div class="section">
<h2>Statistics</h2>
<ul>
	<li>Memory entries: {len(self.project.memory_entries)}</li>
	<li>Routines: {len(self.project.routines)}</li>
	<li>Data tables: {len(self.project.data_tables)}</li>
</ul>
</div>
'''

		html += self._footer()
		return html

	def generate_memory_map(self) -> str:
		"""Generate memory map page."""
		html = self._header(f"{self.project.name} - Memory Map")

		html += f'''
<div class="nav"><a href="index.html">← Back to Index</a></div>
<h1>Memory Map</h1>
'''

		# Group by category
		categories: Dict[str, List[MemoryEntry]] = {}
		for entry in sorted(self.project.memory_entries, key=lambda e: e.address):
			cat = entry.category or "Uncategorized"
			if cat not in categories:
				categories[cat] = []
			categories[cat].append(entry)

		for cat in sorted(categories.keys()):
			html += f'''
<div class="section">
<h2>{cat}</h2>
<table>
	<tr><th>Address</th><th>Size</th><th>Name</th><th>Description</th></tr>
'''
			for entry in categories[cat]:
				desc = entry.description or "-"
				html += f'	<tr><td><code>${entry.address:04X}</code></td><td>{entry.size}</td><td><code>{entry.name}</code></td><td>{desc}</td></tr>\n'

			html += '</table>\n</div>\n'

		html += self._footer()
		return html

	def generate_routines(self) -> str:
		"""Generate routines page."""
		html = self._header(f"{self.project.name} - Routines")

		html += f'''
<div class="nav"><a href="index.html">← Back to Index</a></div>
<h1>Routines</h1>
'''

		# Group by category
		categories: Dict[str, List[Routine]] = {}
		for routine in sorted(self.project.routines, key=lambda r: r.address):
			cat = routine.category or "Uncategorized"
			if cat not in categories:
				categories[cat] = []
			categories[cat].append(routine)

		for cat in sorted(categories.keys()):
			html += f'<div class="section">\n<h2>{cat}</h2>\n'

			for routine in categories[cat]:
				html += f'''
<h3>{routine.name}</h3>
<p><strong>Address:</strong> <code>${routine.address:04X}</code></p>
'''
				if routine.description:
					html += f'<p>{routine.description}</p>\n'

				if routine.parameters:
					html += '<p><strong>Parameters:</strong></p><ul>\n'
					for param in routine.parameters:
						html += f'<li>{param}</li>\n'
					html += '</ul>\n'

				html += '<hr>\n'

			html += '</div>\n'

		html += self._footer()
		return html

	def generate_data_tables(self) -> str:
		"""Generate data tables page."""
		html = self._header(f"{self.project.name} - Data Tables")

		html += f'''
<div class="nav"><a href="index.html">← Back to Index</a></div>
<h1>Data Tables</h1>
'''

		for table in sorted(self.project.data_tables, key=lambda t: t.address):
			total_size = table.entry_count * table.entry_size
			html += f'''
<div class="section">
<h2>{table.name}</h2>
<p>
<strong>Address:</strong> <code>${table.address:04X}</code><br>
<strong>Entries:</strong> {table.entry_count}<br>
<strong>Entry Size:</strong> {table.entry_size} bytes<br>
<strong>Total Size:</strong> {total_size} bytes
</p>
'''
			if table.description:
				html += f'<p>{table.description}</p>\n'

			if table.fields:
				html += '''
<table>
	<tr><th>Offset</th><th>Size</th><th>Name</th><th>Description</th></tr>
'''
				for field in table.fields:
					offset = field.get('offset', 0)
					size = field.get('size', 1)
					name = field.get('name', '?')
					desc = field.get('description', '-')
					html += f'	<tr><td><code>+${offset:02X}</code></td><td>{size}</td><td><code>{name}</code></td><td>{desc}</td></tr>\n'
				html += '</table>\n'

			html += '</div>\n'

		html += self._footer()
		return html

	def generate_all(self, output_dir: str) -> None:
		"""Generate all documentation files."""
		output = Path(output_dir)
		output.mkdir(parents=True, exist_ok=True)

		(output / "index.html").write_text(self.generate_index(), encoding='utf-8')
		(output / "memory_map.html").write_text(self.generate_memory_map(), encoding='utf-8')
		(output / "routines.html").write_text(self.generate_routines(), encoding='utf-8')
		(output / "data_tables.html").write_text(self.generate_data_tables(), encoding='utf-8')


def load_project_from_json(path: str) -> DocumentationProject:
	"""Load project from JSON file."""
	with open(path, 'r', encoding='utf-8') as f:
		data = json.load(f)

	project = DocumentationProject(
		name=data.get("name", "Unknown"),
		version=data.get("version", "1.0"),
		platform=data.get("platform", "Unknown"),
		notes=data.get("notes", {})
	)

	for entry in data.get("memory_entries", []):
		addr = entry["address"]
		if isinstance(addr, str):
			addr = int(addr, 16)

		project.memory_entries.append(MemoryEntry(
			address=addr,
			size=entry.get("size", 1),
			name=entry.get("name", ""),
			description=entry.get("description", ""),
			type_str=entry.get("type", "byte"),
			category=entry.get("category", "")
		))

	for routine in data.get("routines", []):
		addr = routine["address"]
		if isinstance(addr, str):
			addr = int(addr, 16)

		project.routines.append(Routine(
			address=addr,
			name=routine.get("name", ""),
			size=routine.get("size", 0),
			description=routine.get("description", ""),
			parameters=routine.get("parameters", []),
			returns=routine.get("returns", ""),
			category=routine.get("category", "")
		))

	for table in data.get("data_tables", []):
		addr = table["address"]
		if isinstance(addr, str):
			addr = int(addr, 16)

		project.data_tables.append(DataTable(
			address=addr,
			name=table.get("name", ""),
			entry_count=table.get("entry_count", 0),
			entry_size=table.get("entry_size", 1),
			description=table.get("description", ""),
			fields=table.get("fields", []),
			category=table.get("category", "")
		))

	return project


def save_project_to_json(project: DocumentationProject, path: str) -> None:
	"""Save project to JSON file."""
	data = {
		"name": project.name,
		"version": project.version,
		"platform": project.platform,
		"notes": project.notes,
		"memory_entries": [
			{
				"address": f"0x{e.address:04X}",
				"size": e.size,
				"name": e.name,
				"description": e.description,
				"type": e.type_str,
				"category": e.category
			}
			for e in project.memory_entries
		],
		"routines": [
			{
				"address": f"0x{r.address:04X}",
				"name": r.name,
				"size": r.size,
				"description": r.description,
				"parameters": r.parameters,
				"returns": r.returns,
				"category": r.category
			}
			for r in project.routines
		],
		"data_tables": [
			{
				"address": f"0x{t.address:04X}",
				"name": t.name,
				"entry_count": t.entry_count,
				"entry_size": t.entry_size,
				"description": t.description,
				"fields": t.fields,
				"category": t.category
			}
			for t in project.data_tables
		]
	}

	with open(path, 'w', encoding='utf-8') as f:
		json.dump(data, f, indent='\t')


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description="Generate documentation from ROM analysis",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
  %(prog)s generate project.json -o docs/ --format markdown
  %(prog)s generate project.json -o docs/ --format html
  %(prog)s template -o project.json --name "My Game"
		"""
	)

	subparsers = parser.add_subparsers(dest="command", help="Command to execute")

	# Generate command
	gen_parser = subparsers.add_parser("generate", help="Generate documentation")
	gen_parser.add_argument("project", help="Project JSON file")
	gen_parser.add_argument("-o", "--output", required=True, help="Output directory")
	gen_parser.add_argument("-f", "--format", choices=["markdown", "html", "both"],
		default="markdown", help="Output format")

	# Template command
	template_parser = subparsers.add_parser("template", help="Create project template")
	template_parser.add_argument("-o", "--output", required=True, help="Output JSON file")
	template_parser.add_argument("-n", "--name", default="Game Name", help="Project name")
	template_parser.add_argument("-p", "--platform", default="NES", help="Platform")

	args = parser.parse_args()

	if not args.command:
		parser.print_help()
		return 1

	try:
		if args.command == "generate":
			project = load_project_from_json(args.project)

			if args.format in ("markdown", "both"):
				md_gen = MarkdownGenerator(project)
				md_out = Path(args.output) / "markdown" if args.format == "both" else args.output
				md_gen.generate_all(str(md_out))
				print(f"Generated Markdown docs: {md_out}")

			if args.format in ("html", "both"):
				html_gen = HTMLGenerator(project)
				html_out = Path(args.output) / "html" if args.format == "both" else args.output
				html_gen.generate_all(str(html_out))
				print(f"Generated HTML docs: {html_out}")

		elif args.command == "template":
			project = DocumentationProject(
				name=args.name,
				platform=args.platform,
				memory_entries=[
					MemoryEntry(address=0x0000, size=1, name="example_var",
						description="Example memory variable", category="Variables"),
				],
				routines=[
					Routine(address=0x8000, name="Reset",
						description="Main reset vector", category="System"),
				],
				data_tables=[
					DataTable(address=0x8100, name="ExampleTable",
						entry_count=16, entry_size=4,
						description="Example data table", category="Data"),
				],
				notes={
					"Overview": "Add game overview here.",
					"Credits": "Documentation by..."
				}
			)

			save_project_to_json(project, args.output)
			print(f"Created template: {args.output}")

	except FileNotFoundError as e:
		print(f"Error: File not found: {e.filename}")
		return 1
	except Exception as e:
		print(f"Error: {e}")
		return 1

	return 0


if __name__ == "__main__":
	sys.exit(main())
