#!/usr/bin/env python3
"""
Soul Blazer ROM Labeler Tool

Generates and applies labels to ROM disassembly files.
Creates symbol files for various emulators and debuggers.
"""

import os
import sys
import json
import struct
import argparse
from pathlib import Path
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Tuple, Set
from enum import Enum, auto

# SNES LoROM address conversion
def pc_to_snes(pc_addr: int) -> int:
	"""Convert PC file address to SNES LoROM address."""
	bank = (pc_addr >> 15) + 0x80
	offset = (pc_addr & 0x7FFF) + 0x8000
	return (bank << 16) | offset

def snes_to_pc(snes_addr: int) -> int:
	"""Convert SNES LoROM address to PC file address."""
	bank = (snes_addr >> 16) & 0xFF
	offset = snes_addr & 0xFFFF
	if bank >= 0x80:
		bank -= 0x80
	return (bank << 15) | (offset & 0x7FFF)

class LabelType(Enum):
	"""Types of labels that can be identified."""
	CODE = auto()           # Subroutine/function
	DATA = auto()           # Data block
	POINTER = auto()        # Pointer table
	TEXT = auto()           # Text/string
	GRAPHICS = auto()       # Graphics data
	AUDIO = auto()          # Audio/music data
	RAM = auto()            # RAM variable
	HARDWARE = auto()       # Hardware register
	UNKNOWN = auto()        # Unknown/auto-generated

@dataclass
class Label:
	"""Represents a ROM/RAM label."""
	address: int            # SNES address
	name: str               # Label name
	label_type: LabelType   # Type of label
	size: int = 0           # Size in bytes (0 = unknown)
	comment: str = ""       # Optional comment
	bank: int = 0           # Bank number

	def __post_init__(self):
		if self.bank == 0 and self.address >= 0x800000:
			self.bank = (self.address >> 16) & 0x7F

@dataclass
class LabelDatabase:
	"""Database of all known labels."""
	labels: Dict[int, Label] = field(default_factory=dict)
	ram_labels: Dict[int, Label] = field(default_factory=dict)

	def add_label(self, label: Label):
		"""Add a label to the appropriate dictionary."""
		if label.address >= 0x7E0000 and label.address < 0x800000:
			self.ram_labels[label.address] = label
		else:
			self.labels[label.address] = label

	def get_label(self, address: int) -> Optional[Label]:
		"""Get label by address."""
		if address >= 0x7E0000 and address < 0x800000:
			return self.ram_labels.get(address)
		return self.labels.get(address)

	def has_label(self, address: int) -> bool:
		"""Check if address has a label."""
		return self.get_label(address) is not None

class RomLabeler:
	"""
	ROM labeling and symbol generation tool.

	Features:
	- Auto-detect subroutines from JSR/JSL instructions
	- Identify pointer tables
	- Generate labels from known patterns
	- Export to various formats (MESEN, BSNES, CA65, WLA)
	"""

	# Known Soul Blazer labels
	KNOWN_LABELS = {
		# System
		0x808000: ("Reset", LabelType.CODE, "Reset vector handler"),
		0x808004: ("NMI", LabelType.CODE, "NMI/VBlank handler"),
		0x808008: ("IRQ", LabelType.CODE, "IRQ handler"),

		# Main code
		0x80803C: ("Main", LabelType.CODE, "Main entry point"),
		0x808100: ("MainLoop", LabelType.CODE, "Main game loop"),
		0x8081E0: ("UpdateObjects", LabelType.CODE, "Entity update loop"),
		0x808240: ("ProcessInput", LabelType.CODE, "Controller input handler"),
		0x808300: ("UpdateScreen", LabelType.CODE, "Screen/DMA updates"),

		# Player code
		0x818000: ("PlayerUpdate", LabelType.CODE, "Player state machine"),
		0x818100: ("PlayerMove", LabelType.CODE, "Player movement"),
		0x818200: ("PlayerAttack", LabelType.CODE, "Player attack handler"),
		0x818300: ("PlayerMagic", LabelType.CODE, "Magic casting"),
		0x818400: ("PlayerDamage", LabelType.CODE, "Player damage handler"),

		# Enemy code
		0x828000: ("EnemyUpdate", LabelType.CODE, "Enemy AI update"),
		0x828100: ("EnemyMove", LabelType.CODE, "Enemy movement"),
		0x828200: ("EnemyAttack", LabelType.CODE, "Enemy attack patterns"),
		0x828300: ("SpawnEnemy", LabelType.CODE, "Enemy spawn routine"),

		# Graphics
		0x838000: ("LoadGraphics", LabelType.CODE, "Graphics loading"),
		0x838100: ("DecompressTiles", LabelType.CODE, "Tile decompression"),
		0x838200: ("LoadPalette", LabelType.CODE, "Palette loading"),
		0x838300: ("UpdateSprites", LabelType.CODE, "Sprite OAM update"),

		# Audio
		0x078000: ("AudioDriver", LabelType.AUDIO, "SPC audio driver"),
		0x07A000: ("SampleDirectory", LabelType.AUDIO, "BRR sample directory"),
		0x0D8000: ("MusicData", LabelType.AUDIO, "Music sequence data"),

		# Data tables
		0x858000: ("EnemyDataTable", LabelType.DATA, "Enemy statistics table"),
		0x858400: ("ItemDataTable", LabelType.DATA, "Item/equipment table"),
		0x858800: ("MagicDataTable", LabelType.DATA, "Magic spell data"),
		0x858C00: ("MapPointerTable", LabelType.POINTER, "Map data pointers"),

		# Text
		0x868000: ("TextBank", LabelType.TEXT, "Text data bank"),
		0x869000: ("DialoguePointers", LabelType.POINTER, "Dialogue pointer table"),

		# Entity data
		0x878000: ("EntityTemplates", LabelType.DATA, "Entity template data"),
		0x879000: ("SoulLairData", LabelType.DATA, "Soul lair definitions"),

		# Map data
		0x888000: ("MapTilesets", LabelType.GRAPHICS, "Map tileset data"),
		0x898000: ("MapLayouts", LabelType.DATA, "Map layout data"),
		0x8A8000: ("CollisionData", LabelType.DATA, "Collision map data"),
	}

	# Known RAM locations
	KNOWN_RAM = {
		# Player data
		0x7E0100: ("PlayerHP", LabelType.RAM, "Current HP (16-bit)"),
		0x7E0102: ("PlayerMaxHP", LabelType.RAM, "Maximum HP (16-bit)"),
		0x7E0104: ("PlayerLevel", LabelType.RAM, "Current level"),
		0x7E0106: ("PlayerEXP", LabelType.RAM, "Experience (32-bit)"),
		0x7E010A: ("PlayerEXPNext", LabelType.RAM, "EXP to next level"),
		0x7E010E: ("PlayerSTR", LabelType.RAM, "Strength stat"),
		0x7E010F: ("PlayerDEF", LabelType.RAM, "Defense stat"),
		0x7E0110: ("PlayerLCK", LabelType.RAM, "Luck stat"),
		0x7E0112: ("PlayerGEMs", LabelType.RAM, "Currency (16-bit)"),
		0x7E0114: ("EquipSword", LabelType.RAM, "Equipped sword ID"),
		0x7E0115: ("EquipArmor", LabelType.RAM, "Equipped armor ID"),
		0x7E0116: ("EquipMagic", LabelType.RAM, "Equipped magic ID"),

		# Entity system
		0x7E0200: ("EntitySlots", LabelType.RAM, "Entity slot array (32x32)"),
		0x7E0600: ("ActiveEntities", LabelType.RAM, "Active entity count"),

		# Game state
		0x7E0010: ("GameMode", LabelType.RAM, "Current game mode"),
		0x7E0011: ("GameSubMode", LabelType.RAM, "Game sub-mode"),
		0x7E0012: ("CurrentMap", LabelType.RAM, "Current map ID"),
		0x7E0014: ("PlayerX", LabelType.RAM, "Player X position (16-bit)"),
		0x7E0016: ("PlayerY", LabelType.RAM, "Player Y position (16-bit)"),

		# Input
		0x7E0020: ("JoypadHeld", LabelType.RAM, "Buttons held"),
		0x7E0022: ("JoypadNew", LabelType.RAM, "Newly pressed buttons"),

		# Progress
		0x7E1800: ("SoulFlags", LabelType.RAM, "Soul release flags (32 bytes)"),
		0x7E1820: ("ChestFlags", LabelType.RAM, "Chest opened flags"),
		0x7E1840: ("EventFlags", LabelType.RAM, "Event completion flags"),

		# Screen
		0x7E1000: ("ScrollX", LabelType.RAM, "BG scroll X"),
		0x7E1002: ("ScrollY", LabelType.RAM, "BG scroll Y"),
		0x7E1004: ("ScreenMode", LabelType.RAM, "Screen display mode"),

		# Battle
		0x7E1100: ("BattleState", LabelType.RAM, "Battle state machine"),
		0x7E1102: ("CurrentEnemy", LabelType.RAM, "Current enemy slot"),
		0x7E1104: ("DamageDealt", LabelType.RAM, "Damage value"),
	}

	# Hardware registers
	HARDWARE_REGS = {
		0x2100: ("INIDISP", LabelType.HARDWARE, "Display control"),
		0x2101: ("OBSEL", LabelType.HARDWARE, "OAM size/address"),
		0x2102: ("OAMADDL", LabelType.HARDWARE, "OAM address low"),
		0x2103: ("OAMADDH", LabelType.HARDWARE, "OAM address high"),
		0x2104: ("OAMDATA", LabelType.HARDWARE, "OAM data write"),
		0x2105: ("BGMODE", LabelType.HARDWARE, "BG mode"),
		0x210D: ("BG1HOFS", LabelType.HARDWARE, "BG1 horizontal scroll"),
		0x210E: ("BG1VOFS", LabelType.HARDWARE, "BG1 vertical scroll"),
		0x2115: ("VMAIN", LabelType.HARDWARE, "VRAM address increment"),
		0x2116: ("VMADDL", LabelType.HARDWARE, "VRAM address low"),
		0x2117: ("VMADDH", LabelType.HARDWARE, "VRAM address high"),
		0x2118: ("VMDATAL", LabelType.HARDWARE, "VRAM data low"),
		0x2119: ("VMDATAH", LabelType.HARDWARE, "VRAM data high"),
		0x2121: ("CGADD", LabelType.HARDWARE, "CGRAM address"),
		0x2122: ("CGDATA", LabelType.HARDWARE, "CGRAM data"),
		0x2140: ("APUIO0", LabelType.HARDWARE, "APU I/O port 0"),
		0x2141: ("APUIO1", LabelType.HARDWARE, "APU I/O port 1"),
		0x2142: ("APUIO2", LabelType.HARDWARE, "APU I/O port 2"),
		0x2143: ("APUIO3", LabelType.HARDWARE, "APU I/O port 3"),
		0x4200: ("NMITIMEN", LabelType.HARDWARE, "Interrupt enable"),
		0x4210: ("RDNMI", LabelType.HARDWARE, "NMI flag"),
		0x4212: ("HVBJOY", LabelType.HARDWARE, "H/V blank status"),
		0x4016: ("JOYSER0", LabelType.HARDWARE, "Joypad serial 0"),
		0x4218: ("JOY1L", LabelType.HARDWARE, "Joypad 1 low"),
		0x4219: ("JOY1H", LabelType.HARDWARE, "Joypad 1 high"),
	}

	def __init__(self, rom_path: str = None):
		"""Initialize the ROM labeler."""
		self.rom_path = rom_path
		self.rom_data = None
		self.db = LabelDatabase()

		# Load ROM if provided
		if rom_path and os.path.exists(rom_path):
			with open(rom_path, 'rb') as f:
				self.rom_data = f.read()

		# Initialize with known labels
		self._init_known_labels()

	def _init_known_labels(self):
		"""Initialize database with known labels."""
		for addr, (name, ltype, comment) in self.KNOWN_LABELS.items():
			self.db.add_label(Label(addr, name, ltype, 0, comment))

		for addr, (name, ltype, comment) in self.KNOWN_RAM.items():
			self.db.add_label(Label(addr, name, ltype, 0, comment))

		# Hardware registers (in bank 00)
		for addr, (name, ltype, comment) in self.HARDWARE_REGS.items():
			full_addr = 0x000000 | addr
			self.db.add_label(Label(full_addr, name, ltype, 0, comment))

	def scan_for_subroutines(self) -> List[Label]:
		"""Scan ROM for JSR/JSL targets to auto-label subroutines."""
		if not self.rom_data:
			return []

		subroutines = set()

		# Scan each bank
		for bank in range(32):
			bank_offset = bank * 0x8000

			for i in range(0x8000 - 3):
				pc = bank_offset + i

				if pc >= len(self.rom_data):
					break

				opcode = self.rom_data[pc]

				# JSR abs ($20)
				if opcode == 0x20 and pc + 2 < len(self.rom_data):
					target = struct.unpack('<H', self.rom_data[pc+1:pc+3])[0]
					if target >= 0x8000:  # Must be in ROM range
						snes_bank = bank + 0x80 if bank < 0x40 else bank
						full_addr = (snes_bank << 16) | target
						subroutines.add(full_addr)

				# JSL long ($22)
				if opcode == 0x22 and pc + 3 < len(self.rom_data):
					target = struct.unpack('<I', self.rom_data[pc+1:pc+4] + b'\x00')[0] & 0xFFFFFF
					if (target & 0xFFFF) >= 0x8000:
						subroutines.add(target)

		# Create labels for discovered subroutines
		new_labels = []
		for addr in sorted(subroutines):
			if not self.db.has_label(addr):
				bank = (addr >> 16) & 0x7F
				offset = addr & 0xFFFF
				name = f"sub_{bank:02X}_{offset:04X}"
				label = Label(addr, name, LabelType.CODE, 0, "Auto-detected subroutine")
				self.db.add_label(label)
				new_labels.append(label)

		return new_labels

	def scan_for_pointers(self, min_count: int = 4) -> List[Tuple[int, int]]:
		"""Scan for potential pointer tables."""
		if not self.rom_data:
			return []

		pointer_tables = []

		for bank in range(32):
			bank_offset = bank * 0x8000

			for i in range(0, 0x8000 - 2, 2):
				pc = bank_offset + i
				if pc + min_count * 2 >= len(self.rom_data):
					break

				# Check for consecutive valid pointers
				valid = True
				for j in range(min_count):
					ptr = struct.unpack('<H', self.rom_data[pc + j*2:pc + j*2 + 2])[0]
					if ptr < 0x8000 or ptr > 0xFFFF:
						valid = False
						break

				if valid:
					# Count how many valid pointers
					count = 0
					for j in range(256):
						if pc + j*2 + 2 > len(self.rom_data):
							break
						ptr = struct.unpack('<H', self.rom_data[pc + j*2:pc + j*2 + 2])[0]
						if ptr < 0x8000 or ptr > 0xFFFF:
							break
						count += 1

					if count >= min_count:
						snes_addr = pc_to_snes(pc)
						pointer_tables.append((snes_addr, count))

		return pointer_tables

	def export_mesen(self, output_path: str):
		"""Export labels in Mesen format (.mlb)."""
		lines = []

		# RAM labels
		for addr, label in sorted(self.ram_labels.items()):
			# Mesen uses G: prefix for work RAM
			lines.append(f"G:{addr & 0xFFFF:04X}:{label.name}")

		# ROM labels
		for addr, label in sorted(self.db.labels.items()):
			# Convert to PC address for Mesen
			if addr >= 0x800000:
				pc = snes_to_pc(addr)
				lines.append(f"P:{pc:06X}:{label.name}")

		with open(output_path, 'w') as f:
			f.write('\n'.join(lines))

		print(f"Exported {len(lines)} labels to {output_path} (Mesen format)")

	@property
	def ram_labels(self) -> Dict[int, Label]:
		"""Get RAM labels dictionary."""
		return self.db.ram_labels

	def export_bsnes(self, output_path: str):
		"""Export labels in bsnes/higan format (.sym)."""
		lines = ['[labels]']

		# ROM labels
		for addr, label in sorted(self.db.labels.items()):
			bank = (addr >> 16) & 0xFF
			offset = addr & 0xFFFF
			lines.append(f"{bank:02X}:{offset:04X} {label.name}")

		# RAM labels
		lines.append('')
		lines.append('[ram]')
		for addr, label in sorted(self.ram_labels.items()):
			bank = (addr >> 16) & 0xFF
			offset = addr & 0xFFFF
			lines.append(f"{bank:02X}:{offset:04X} {label.name}")

		with open(output_path, 'w') as f:
			f.write('\n'.join(lines))

		print(f"Exported labels to {output_path} (bsnes/higan format)")

	def export_ca65(self, output_path: str):
		"""Export labels for ca65 assembler (.inc)."""
		lines = [
			"; Soul Blazer Labels",
			"; Generated by rom_labeler.py",
			"; CA65 assembler format",
			"",
			"; === ROM Labels ===",
		]

		current_bank = -1
		for addr, label in sorted(self.db.labels.items()):
			bank = (addr >> 16) & 0x7F
			if bank != current_bank:
				lines.append(f"\n; Bank ${bank:02X}")
				current_bank = bank

			offset = addr & 0xFFFF
			lines.append(f"{label.name} = ${addr:06X}")

		lines.append("")
		lines.append("; === RAM Labels ===")
		for addr, label in sorted(self.ram_labels.items()):
			lines.append(f"{label.name} = ${addr:06X}")

		lines.append("")
		lines.append("; === Hardware Registers ===")
		for addr, (name, _, comment) in sorted(self.HARDWARE_REGS.items()):
			lines.append(f"{name} = ${addr:04X}  ; {comment}")

		with open(output_path, 'w') as f:
			f.write('\n'.join(lines))

		print(f"Exported labels to {output_path} (CA65 format)")

	def export_wla(self, output_path: str):
		"""Export labels for WLA-DX assembler (.sym)."""
		lines = [
			"; Soul Blazer Labels",
			"; WLA-DX format",
			"",
			".DEFINE"
		]

		for addr, label in sorted(self.db.labels.items()):
			lines.append(f".def {label.name} ${addr:06X}")

		for addr, label in sorted(self.ram_labels.items()):
			lines.append(f".def {label.name} ${addr:06X}")

		with open(output_path, 'w') as f:
			f.write('\n'.join(lines))

		print(f"Exported labels to {output_path} (WLA-DX format)")

	def export_json(self, output_path: str):
		"""Export all labels to JSON."""
		data = {
			"rom_labels": {},
			"ram_labels": {},
			"hardware_regs": {}
		}

		for addr, label in self.db.labels.items():
			data["rom_labels"][f"0x{addr:06X}"] = {
				"name": label.name,
				"type": label.label_type.name,
				"comment": label.comment
			}

		for addr, label in self.ram_labels.items():
			data["ram_labels"][f"0x{addr:06X}"] = {
				"name": label.name,
				"type": label.label_type.name,
				"comment": label.comment
			}

		for addr, (name, ltype, comment) in self.HARDWARE_REGS.items():
			data["hardware_regs"][f"0x{addr:04X}"] = {
				"name": name,
				"comment": comment
			}

		with open(output_path, 'w') as f:
			json.dump(data, f, indent='\t')

		print(f"Exported labels to {output_path} (JSON format)")

	def import_labels(self, label_file: str):
		"""Import labels from a text file."""
		if not os.path.exists(label_file):
			return

		with open(label_file, 'r') as f:
			for line in f:
				line = line.strip()
				if not line or line.startswith(';') or line.startswith('#'):
					continue

				# Parse format: ADDRESS NAME [COMMENT]
				parts = line.split(maxsplit=2)
				if len(parts) >= 2:
					try:
						addr_str = parts[0].replace('$', '').replace('0x', '')
						addr = int(addr_str, 16)
						name = parts[1]
						comment = parts[2] if len(parts) > 2 else ""

						label = Label(addr, name, LabelType.UNKNOWN, 0, comment)
						self.db.add_label(label)
					except ValueError:
						continue

	def get_stats(self) -> dict:
		"""Get label statistics."""
		type_counts = {}
		for label in self.db.labels.values():
			type_name = label.label_type.name
			type_counts[type_name] = type_counts.get(type_name, 0) + 1

		return {
			"total_rom_labels": len(self.db.labels),
			"total_ram_labels": len(self.ram_labels),
			"by_type": type_counts
		}

	def print_summary(self):
		"""Print label summary."""
		stats = self.get_stats()
		print("\n=== Label Database Summary ===")
		print(f"ROM Labels: {stats['total_rom_labels']}")
		print(f"RAM Labels: {stats['total_ram_labels']}")
		print("\nBy Type:")
		for ltype, count in sorted(stats['by_type'].items()):
			print(f"  {ltype}: {count}")


def main():
	parser = argparse.ArgumentParser(description="Soul Blazer ROM Labeler")
	parser.add_argument('--rom', '-r', help='Path to Soul Blazer ROM')
	parser.add_argument('--import', '-i', dest='import_file', help='Import labels from file')
	parser.add_argument('--scan', '-s', action='store_true', help='Scan ROM for subroutines')
	parser.add_argument('--format', '-f', choices=['mesen', 'bsnes', 'ca65', 'wla', 'json', 'all'],
						default='all', help='Export format')
	parser.add_argument('--output', '-o', default='soul_blazer', help='Output base filename')

	args = parser.parse_args()

	# Initialize labeler
	labeler = RomLabeler(args.rom)

	# Import additional labels
	if args.import_file:
		labeler.import_labels(args.import_file)
		print(f"Imported labels from {args.import_file}")

	# Scan ROM
	if args.scan and labeler.rom_data:
		print("Scanning ROM for subroutines...")
		new_labels = labeler.scan_for_subroutines()
		print(f"Found {len(new_labels)} new subroutines")

	# Export
	output_base = args.output

	if args.format in ('mesen', 'all'):
		labeler.export_mesen(f"{output_base}.mlb")

	if args.format in ('bsnes', 'all'):
		labeler.export_bsnes(f"{output_base}.sym")

	if args.format in ('ca65', 'all'):
		labeler.export_ca65(f"{output_base}.inc")

	if args.format in ('wla', 'all'):
		labeler.export_wla(f"{output_base}_wla.sym")

	if args.format in ('json', 'all'):
		labeler.export_json(f"{output_base}_labels.json")

	# Summary
	labeler.print_summary()


if __name__ == "__main__":
	main()
