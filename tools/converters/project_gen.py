#!/usr/bin/env python3
"""
Project Generator

Generate project scaffolding for different game modding/analysis projects.
Creates directory structure, config files, and starter scripts.

Project Types:
- nes: NES ROM hacking project
- snes: SNES ROM hacking project
- gb: Game Boy project
- translation: Translation project
- docs: Documentation project

Usage:
	python project_gen.py create <project_name> --type nes
	python project_gen.py create <project_name> --type translation --rom game.nes
	python project_gen.py list-types
	python project_gen.py add-component <project_path> --component tables
"""

import argparse
import json
import os
import sys
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional


PROJECT_TYPES = {
	'nes': {
		'name': 'NES ROM Hacking Project',
		'description': 'Project for hacking/modding NES ROMs',
		'directories': [
			'roms',
			'disasm',
			'assets/graphics',
			'assets/text',
			'assets/audio',
			'assets/maps',
			'data/tables',
			'data/json',
			'tools',
			'docs',
			'debug',
			'build',
		],
		'files': {
			'README.md': 'readme_template',
			'.gitignore': 'gitignore_template',
			'.editorconfig': 'editorconfig_template',
			'data/tables/char_table.tbl': 'tbl_template',
			'config.json': 'config_template',
		},
	},
	'snes': {
		'name': 'SNES ROM Hacking Project',
		'description': 'Project for hacking/modding SNES ROMs',
		'directories': [
			'roms',
			'disasm',
			'assets/graphics',
			'assets/text',
			'assets/audio',
			'assets/maps',
			'data/tables',
			'data/json',
			'tools',
			'docs',
			'debug',
			'build',
		],
		'files': {
			'README.md': 'readme_template',
			'.gitignore': 'gitignore_template',
			'.editorconfig': 'editorconfig_template',
			'data/tables/char_table.tbl': 'tbl_template',
			'config.json': 'config_template_snes',
		},
	},
	'gb': {
		'name': 'Game Boy Project',
		'description': 'Project for Game Boy/GBC ROMs',
		'directories': [
			'roms',
			'disasm',
			'assets/graphics',
			'assets/text',
			'data/tables',
			'tools',
			'docs',
			'build',
		],
		'files': {
			'README.md': 'readme_template',
			'.gitignore': 'gitignore_template',
			'.editorconfig': 'editorconfig_template',
			'data/tables/char_table.tbl': 'tbl_template',
			'config.json': 'config_template_gb',
		},
	},
	'translation': {
		'name': 'Translation Project',
		'description': 'Project focused on game translation',
		'directories': [
			'roms',
			'text/original',
			'text/translated',
			'text/scripts',
			'font/original',
			'font/modified',
			'graphics',
			'tables',
			'tools',
			'docs',
			'build',
			'patches',
		],
		'files': {
			'README.md': 'readme_translation',
			'.gitignore': 'gitignore_template',
			'.editorconfig': 'editorconfig_template',
			'tables/main.tbl': 'tbl_template',
			'translation_status.json': 'translation_status',
			'config.json': 'config_template',
		},
	},
	'docs': {
		'name': 'Documentation Project',
		'description': 'Project for game documentation/wiki',
		'directories': [
			'Wiki',
			'Wiki/Files',
			'Wiki/Images',
			'Debugging',
			'Notes',
		],
		'files': {
			'README.md': 'readme_docs',
			'.gitignore': 'gitignore_docs',
			'.editorconfig': 'editorconfig_template',
		},
	},
}


TEMPLATES = {
	'readme_template': """# {project_name}

## Overview

ROM hacking project for {game_name}.

## Project Structure

```
{project_name}/
├── roms/           # ROM files (not tracked)
├── disasm/         # Disassembly files
├── assets/         # Extracted assets
├── data/           # Game data and tables
├── tools/          # Custom tools
├── docs/           # Documentation
├── debug/          # Debug labels/symbols
└── build/          # Build output
```

## Getting Started

1. Place the original ROM in `roms/`
2. Run extraction tools
3. Begin analysis/modification

## Tools

See `tools/` directory for project-specific tools.

## Resources

- [Data Crystal](https://datacrystal.romhacking.net/)
- [RHDN](https://www.romhacking.net/)

## License

See LICENSE file for details.

---
Created: {date}
""",

	'readme_translation': """# {project_name} Translation

## Overview

Translation project for {game_name}.

## Project Structure

```
{project_name}/
├── roms/           # ROM files (not tracked)
├── text/
│   ├── original/   # Extracted original text
│   ├── translated/ # Translated text
│   └── scripts/    # Insertion scripts
├── font/           # Font modifications
├── graphics/       # Modified graphics
├── tables/         # Character tables
├── tools/          # Translation tools
├── patches/        # Distribution patches
└── build/          # Build output
```

## Translation Progress

See `translation_status.json` for current progress.

## Building

1. Place clean ROM in `roms/`
2. Run build script
3. Output patch in `patches/`

---
Created: {date}
""",

	'readme_docs': """# {project_name}

## Overview

Documentation and notes for {game_name}.

## Contents

- `Wiki/` - Wiki-format documentation
- `Debugging/` - Debug labels and symbols
- `Notes/` - Research notes

## Contributing

Follow the documentation format established in existing files.

---
Created: {date}
""",

	'gitignore_template': """# ROMs
*.nes
*.smc
*.sfc
*.gb
*.gbc
*.gba
*.bin
*.rom

# Build output
build/
*.o
*.lst

# Save states and saves
*.sav
*.srm
*.state
*.mss

# Editor files
*.swp
*~
.DS_Store
Thumbs.db

# IDE
.vscode/
.idea/
*.sublime-*

# Python
__pycache__/
*.pyc
*.pyo
.env
venv/

# Keep directories
!.gitkeep
""",

	'gitignore_docs': """# Generated files
*.tmp
*~

# OS files
.DS_Store
Thumbs.db

# Editor files
*.swp
.vscode/
.idea/
""",

	'editorconfig_template': """# EditorConfig
root = true

[*]
indent_style = tab
indent_size = 4
tab_width = 4
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true

[*.{yml,yaml}]
indent_style = space
indent_size = 2

[*.md]
trim_trailing_whitespace = false
""",

	'tbl_template': """# Character Table
# Format: HH=Character
# Comments start with #

00=0
01=1
02=2
03=3
04=4
05=5
06=6
07=7
08=8
09=9
0A=A
0B=B
0C=C
0D=D
0E=E
0F=F
10=G
11=H
12=I
13=J
14=K
15=L
16=M
17=N
18=O
19=P
1A=Q
1B=R
1C=S
1D=T
1E=U
1F=V
20=W
21=X
22=Y
23=Z
24=a
25=b
26=c
27=d
28=e
29=f
2A=g
2B=h
2C=i
2D=j
2E=k
2F=l
30=m
31=n
32=o
33=p
34=q
35=r
36=s
37=t
38=u
39=v
3A=w
3B=x
3C=y
3D=z
FF=[END]
""",

	'config_template': """{
	"project": {
		"name": "{project_name}",
		"game": "{game_name}",
		"platform": "nes",
		"created": "{date}"
	},
	"rom": {
		"filename": "",
		"sha256": "",
		"mapper": 0,
		"prg_size": 0,
		"chr_size": 0
	},
	"tables": {
		"main": "data/tables/char_table.tbl"
	},
	"paths": {
		"disasm": "disasm",
		"assets": "assets",
		"build": "build"
	}
}
""",

	'config_template_snes': """{
	"project": {
		"name": "{project_name}",
		"game": "{game_name}",
		"platform": "snes",
		"created": "{date}"
	},
	"rom": {
		"filename": "",
		"sha256": "",
		"mapping": "lorom",
		"rom_size": 0
	},
	"tables": {
		"main": "data/tables/char_table.tbl"
	},
	"paths": {
		"disasm": "disasm",
		"assets": "assets",
		"build": "build"
	}
}
""",

	'config_template_gb': """{
	"project": {
		"name": "{project_name}",
		"game": "{game_name}",
		"platform": "gb",
		"created": "{date}"
	},
	"rom": {
		"filename": "",
		"sha256": "",
		"mbc_type": 0,
		"rom_size": 0,
		"ram_size": 0
	},
	"tables": {
		"main": "data/tables/char_table.tbl"
	},
	"paths": {
		"disasm": "disasm",
		"assets": "assets",
		"build": "build"
	}
}
""",

	'translation_status': """{
	"project": "{project_name}",
	"game": "{game_name}",
	"target_language": "English",
	"created": "{date}",
	"status": {
		"extraction": "not_started",
		"translation": "not_started",
		"testing": "not_started",
		"release": "not_started"
	},
	"progress": {
		"total_strings": 0,
		"translated": 0,
		"reviewed": 0
	},
	"files": []
}
"""
}


def render_template(template_name: str, variables: Dict[str, str]) -> str:
	"""Render a template with variables"""
	template = TEMPLATES.get(template_name, '')
	for key, value in variables.items():
		template = template.replace(f'{{{key}}}', value)
	return template


def create_project(project_name: str, project_type: str, game_name: Optional[str] = None, output_dir: Optional[str] = None) -> str:
	"""Create a new project"""
	if project_type not in PROJECT_TYPES:
		raise ValueError(f"Unknown project type: {project_type}")

	config = PROJECT_TYPES[project_type]

	# Set up paths
	if output_dir:
		project_path = Path(output_dir) / project_name
	else:
		project_path = Path(project_name)

	if project_path.exists():
		raise ValueError(f"Directory already exists: {project_path}")

	# Template variables
	game_name = game_name or project_name.replace('-', ' ').replace('_', ' ').title()
	variables = {
		'project_name': project_name,
		'game_name': game_name,
		'date': datetime.now().strftime('%Y-%m-%d'),
	}

	# Create directories
	for directory in config['directories']:
		dir_path = project_path / directory
		dir_path.mkdir(parents=True, exist_ok=True)
		# Add .gitkeep to empty dirs
		gitkeep = dir_path / '.gitkeep'
		gitkeep.touch()

	# Create files
	for filepath, template_name in config['files'].items():
		file_path = project_path / filepath
		file_path.parent.mkdir(parents=True, exist_ok=True)
		content = render_template(template_name, variables)
		with open(file_path, 'w', encoding='utf-8', newline='\n') as f:
			f.write(content)

	return str(project_path)


def add_component(project_path: str, component: str):
	"""Add a component to existing project"""
	components = {
		'tables': {
			'directories': ['data/tables'],
			'files': {'data/tables/char_table.tbl': 'tbl_template'},
		},
		'debug': {
			'directories': ['debug'],
			'files': {},
		},
		'tools': {
			'directories': ['tools'],
			'files': {},
		},
		'patches': {
			'directories': ['patches'],
			'files': {},
		},
	}

	if component not in components:
		raise ValueError(f"Unknown component: {component}")

	project_path = Path(project_path)
	if not project_path.exists():
		raise ValueError(f"Project not found: {project_path}")

	comp = components[component]

	# Create directories
	for directory in comp['directories']:
		dir_path = project_path / directory
		dir_path.mkdir(parents=True, exist_ok=True)

	# Create files
	variables = {'project_name': project_path.name, 'game_name': '', 'date': datetime.now().strftime('%Y-%m-%d')}
	for filepath, template_name in comp['files'].items():
		file_path = project_path / filepath
		if not file_path.exists():
			content = render_template(template_name, variables)
			with open(file_path, 'w', encoding='utf-8', newline='\n') as f:
				f.write(content)


def main():
	parser = argparse.ArgumentParser(
		description='Project Generator',
		formatter_class=argparse.RawDescriptionHelpFormatter
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Create command
	create_parser = subparsers.add_parser('create', help='Create new project')
	create_parser.add_argument('name', help='Project name')
	create_parser.add_argument('--type', '-t', required=True, choices=PROJECT_TYPES.keys(), help='Project type')
	create_parser.add_argument('--game', '-g', help='Game name')
	create_parser.add_argument('--output', '-o', help='Output directory')

	# List types command
	list_parser = subparsers.add_parser('list-types', help='List project types')

	# Add component command
	add_parser = subparsers.add_parser('add-component', help='Add component to project')
	add_parser.add_argument('path', help='Project path')
	add_parser.add_argument('--component', '-c', required=True,
						   choices=['tables', 'debug', 'tools', 'patches'],
						   help='Component to add')

	args = parser.parse_args()

	if args.command == 'create':
		try:
			project_path = create_project(args.name, args.type, args.game, args.output)
			print(f"Created project: {project_path}")
			print(f"Type: {PROJECT_TYPES[args.type]['name']}")
		except ValueError as e:
			print(f"Error: {e}")
			sys.exit(1)

	elif args.command == 'list-types':
		print("Available Project Types:")
		print("=" * 40)
		for type_id, config in PROJECT_TYPES.items():
			print(f"\n{type_id}:")
			print(f"  Name: {config['name']}")
			print(f"  Description: {config['description']}")

	elif args.command == 'add-component':
		try:
			add_component(args.path, args.component)
			print(f"Added component '{args.component}' to project")
		except ValueError as e:
			print(f"Error: {e}")
			sys.exit(1)

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
