#!/usr/bin/env python3
"""
Memory Layout Editor - Define and edit memory layout configurations.

Tools for defining RAM, ROM, and I/O memory layouts for various
gaming platforms and custom memory maps.

Usage:
	python memory_layout.py <config.json>
	python memory_layout.py --platform nes
	python memory_layout.py --generate

Features:
	- Platform presets
	- Custom layouts
	- Bank switching support
	- Memory visualization
	- Export formats
"""

import argparse
import json
import os
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


class MemoryType(Enum):
	"""Types of memory regions."""
	ROM = auto()       # Read-only memory
	RAM = auto()       # Random access memory
	SRAM = auto()      # Save RAM
	VRAM = auto()      # Video RAM
	WRAM = auto()      # Work RAM
	HRAM = auto()      # High RAM (GB)
	OAM = auto()       # Object Attribute Memory
	IO = auto()        # I/O registers
	APU = auto()       # Audio registers
	PPU = auto()       # Picture processing
	CART = auto()      # Cartridge space
	MIRROR = auto()    # Mirrored region
	OPEN = auto()      # Open bus / unmapped


class AccessMode(Enum):
	"""Memory access modes."""
	READ = auto()
	WRITE = auto()
	READ_WRITE = auto()
	EXECUTE = auto()


@dataclass
class MemoryRegion:
	"""A memory region definition."""
	name: str
	start: int
	end: int
	type: MemoryType = MemoryType.RAM
	access: AccessMode = AccessMode.READ_WRITE
	bank: int = 0
	mirror_of: Optional[str] = None
	description: str = ""
	
	@property
	def size(self) -> int:
		"""Get region size."""
		return self.end - self.start + 1
	
	def contains(self, address: int) -> bool:
		"""Check if address is in region."""
		return self.start <= address <= self.end
	
	def offset(self, address: int) -> int:
		"""Get offset within region."""
		return address - self.start
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"name": self.name,
			"start": f"0x{self.start:X}",
			"end": f"0x{self.end:X}",
			"size": self.size,
			"type": self.type.name,
			"access": self.access.name,
			"bank": self.bank,
			"mirror_of": self.mirror_of,
			"description": self.description
		}
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "MemoryRegion":
		"""Create from dictionary."""
		start = data.get("start", 0)
		end = data.get("end", 0)
		
		if isinstance(start, str):
			start = int(start, 0)
		if isinstance(end, str):
			end = int(end, 0)
		
		return cls(
			name=data.get("name", ""),
			start=start,
			end=end,
			type=MemoryType[data.get("type", "RAM")],
			access=AccessMode[data.get("access", "READ_WRITE")],
			bank=data.get("bank", 0),
			mirror_of=data.get("mirror_of"),
			description=data.get("description", "")
		)


@dataclass
class BankConfig:
	"""Bank switching configuration."""
	name: str
	base_address: int
	bank_size: int
	num_banks: int
	register_address: int = 0
	bank_type: MemoryType = MemoryType.ROM
	
	def get_bank_range(self, bank: int) -> Tuple[int, int]:
		"""Get address range for bank."""
		start = self.base_address
		end = self.base_address + self.bank_size - 1
		return (start, end)
	
	def get_physical_address(self, address: int, bank: int) -> int:
		"""Convert banked address to physical ROM address."""
		offset = address - self.base_address
		return (bank * self.bank_size) + offset
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"name": self.name,
			"base_address": f"0x{self.base_address:X}",
			"bank_size": self.bank_size,
			"num_banks": self.num_banks,
			"register_address": f"0x{self.register_address:X}",
			"bank_type": self.bank_type.name
		}


@dataclass
class MemoryLayout:
	"""Complete memory layout definition."""
	name: str
	platform: str
	address_bits: int = 16
	regions: List[MemoryRegion] = field(default_factory=list)
	banks: List[BankConfig] = field(default_factory=list)
	description: str = ""
	
	def add_region(self, region: MemoryRegion) -> None:
		"""Add memory region."""
		self.regions.append(region)
	
	def get_region(self, address: int, bank: int = 0) -> Optional[MemoryRegion]:
		"""Get region containing address."""
		for region in self.regions:
			if region.contains(address) and region.bank == bank:
				return region
		# Check bank 0 as fallback
		for region in self.regions:
			if region.contains(address) and region.bank == 0:
				return region
		return None
	
	def get_regions_by_type(self, mem_type: MemoryType) -> List[MemoryRegion]:
		"""Get all regions of given type."""
		return [r for r in self.regions if r.type == mem_type]
	
	def total_ram(self) -> int:
		"""Calculate total RAM size."""
		return sum(r.size for r in self.regions if r.type == MemoryType.RAM)
	
	def total_rom(self) -> int:
		"""Calculate total ROM size."""
		return sum(r.size for r in self.regions if r.type == MemoryType.ROM)
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"name": self.name,
			"platform": self.platform,
			"address_bits": self.address_bits,
			"regions": [r.to_dict() for r in self.regions],
			"banks": [b.to_dict() for b in self.banks],
			"description": self.description
		}
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "MemoryLayout":
		"""Create from dictionary."""
		regions = [MemoryRegion.from_dict(r) for r in data.get("regions", [])]
		banks = []
		for b in data.get("banks", []):
			base = b.get("base_address", 0)
			reg = b.get("register_address", 0)
			if isinstance(base, str):
				base = int(base, 0)
			if isinstance(reg, str):
				reg = int(reg, 0)
			banks.append(BankConfig(
				name=b.get("name", ""),
				base_address=base,
				bank_size=b.get("bank_size", 0x4000),
				num_banks=b.get("num_banks", 1),
				register_address=reg,
				bank_type=MemoryType[b.get("bank_type", "ROM")]
			))
		
		return cls(
			name=data.get("name", ""),
			platform=data.get("platform", ""),
			address_bits=data.get("address_bits", 16),
			regions=regions,
			banks=banks,
			description=data.get("description", "")
		)


class PlatformPresets:
	"""Platform memory layout presets."""
	
	@staticmethod
	def nes() -> MemoryLayout:
		"""NES memory layout."""
		layout = MemoryLayout(
			name="NES",
			platform="NES",
			address_bits=16,
			description="Nintendo Entertainment System memory map"
		)
		
		# Internal RAM
		layout.add_region(MemoryRegion(
			name="Internal RAM",
			start=0x0000, end=0x07FF,
			type=MemoryType.RAM,
			description="2KB internal RAM"
		))
		
		# RAM mirrors
		layout.add_region(MemoryRegion(
			name="RAM Mirror 1",
			start=0x0800, end=0x0FFF,
			type=MemoryType.MIRROR,
			mirror_of="Internal RAM"
		))
		layout.add_region(MemoryRegion(
			name="RAM Mirror 2",
			start=0x1000, end=0x17FF,
			type=MemoryType.MIRROR,
			mirror_of="Internal RAM"
		))
		layout.add_region(MemoryRegion(
			name="RAM Mirror 3",
			start=0x1800, end=0x1FFF,
			type=MemoryType.MIRROR,
			mirror_of="Internal RAM"
		))
		
		# PPU Registers
		layout.add_region(MemoryRegion(
			name="PPU Registers",
			start=0x2000, end=0x2007,
			type=MemoryType.PPU,
			access=AccessMode.READ_WRITE,
			description="PPU control registers"
		))
		
		# APU and I/O
		layout.add_region(MemoryRegion(
			name="APU I/O",
			start=0x4000, end=0x401F,
			type=MemoryType.APU,
			description="APU and I/O registers"
		))
		
		# Cartridge space
		layout.add_region(MemoryRegion(
			name="Expansion ROM",
			start=0x4020, end=0x5FFF,
			type=MemoryType.CART,
			description="Expansion ROM / mapper registers"
		))
		
		# Save RAM
		layout.add_region(MemoryRegion(
			name="Save RAM",
			start=0x6000, end=0x7FFF,
			type=MemoryType.SRAM,
			description="Battery-backed SRAM"
		))
		
		# PRG ROM
		layout.add_region(MemoryRegion(
			name="PRG ROM Low",
			start=0x8000, end=0xBFFF,
			type=MemoryType.ROM,
			access=AccessMode.READ,
			description="PRG ROM lower bank"
		))
		layout.add_region(MemoryRegion(
			name="PRG ROM High",
			start=0xC000, end=0xFFFF,
			type=MemoryType.ROM,
			access=AccessMode.READ,
			description="PRG ROM upper bank"
		))
		
		# Bank config
		layout.banks.append(BankConfig(
			name="PRG Bank",
			base_address=0x8000,
			bank_size=0x4000,
			num_banks=32
		))
		
		return layout
	
	@staticmethod
	def snes() -> MemoryLayout:
		"""SNES memory layout (LoROM)."""
		layout = MemoryLayout(
			name="SNES LoROM",
			platform="SNES",
			address_bits=24,
			description="Super Nintendo LoROM memory map"
		)
		
		# Work RAM
		layout.add_region(MemoryRegion(
			name="Work RAM",
			start=0x7E0000, end=0x7FFFFF,
			type=MemoryType.WRAM,
			description="128KB Work RAM"
		))
		
		# First 8KB mirror
		layout.add_region(MemoryRegion(
			name="WRAM Mirror",
			start=0x0000, end=0x1FFF,
			type=MemoryType.MIRROR,
			mirror_of="Work RAM"
		))
		
		# PPU Registers
		layout.add_region(MemoryRegion(
			name="PPU Registers",
			start=0x2100, end=0x213F,
			type=MemoryType.PPU,
			description="PPU I/O registers"
		))
		
		# APU Registers
		layout.add_region(MemoryRegion(
			name="APU Registers",
			start=0x2140, end=0x217F,
			type=MemoryType.APU,
			description="APU communication ports"
		))
		
		# SRAM
		layout.add_region(MemoryRegion(
			name="Save RAM",
			start=0x700000, end=0x7DFFFF,
			type=MemoryType.SRAM,
			description="Save RAM (varies by cart)"
		))
		
		return layout
	
	@staticmethod
	def gameboy() -> MemoryLayout:
		"""Game Boy memory layout."""
		layout = MemoryLayout(
			name="Game Boy",
			platform="GB",
			address_bits=16,
			description="Game Boy memory map"
		)
		
		# ROM Bank 0
		layout.add_region(MemoryRegion(
			name="ROM Bank 0",
			start=0x0000, end=0x3FFF,
			type=MemoryType.ROM,
			access=AccessMode.READ,
			description="Fixed ROM bank"
		))
		
		# Switchable ROM
		layout.add_region(MemoryRegion(
			name="ROM Bank N",
			start=0x4000, end=0x7FFF,
			type=MemoryType.ROM,
			access=AccessMode.READ,
			description="Switchable ROM bank"
		))
		
		# VRAM
		layout.add_region(MemoryRegion(
			name="Video RAM",
			start=0x8000, end=0x9FFF,
			type=MemoryType.VRAM,
			description="8KB Video RAM"
		))
		
		# External RAM
		layout.add_region(MemoryRegion(
			name="External RAM",
			start=0xA000, end=0xBFFF,
			type=MemoryType.SRAM,
			description="8KB External RAM (cartridge)"
		))
		
		# Work RAM
		layout.add_region(MemoryRegion(
			name="Work RAM",
			start=0xC000, end=0xDFFF,
			type=MemoryType.WRAM,
			description="8KB Work RAM"
		))
		
		# Echo RAM
		layout.add_region(MemoryRegion(
			name="Echo RAM",
			start=0xE000, end=0xFDFF,
			type=MemoryType.MIRROR,
			mirror_of="Work RAM"
		))
		
		# OAM
		layout.add_region(MemoryRegion(
			name="OAM",
			start=0xFE00, end=0xFE9F,
			type=MemoryType.OAM,
			description="Sprite attribute table"
		))
		
		# I/O Registers
		layout.add_region(MemoryRegion(
			name="I/O Registers",
			start=0xFF00, end=0xFF7F,
			type=MemoryType.IO,
			description="Hardware I/O registers"
		))
		
		# High RAM
		layout.add_region(MemoryRegion(
			name="High RAM",
			start=0xFF80, end=0xFFFE,
			type=MemoryType.HRAM,
			description="127 bytes High RAM"
		))
		
		# IE Register
		layout.add_region(MemoryRegion(
			name="IE Register",
			start=0xFFFF, end=0xFFFF,
			type=MemoryType.IO,
			description="Interrupt Enable register"
		))
		
		# Bank config
		layout.banks.append(BankConfig(
			name="ROM Bank",
			base_address=0x4000,
			bank_size=0x4000,
			num_banks=256
		))
		
		return layout
	
	@staticmethod
	def gba() -> MemoryLayout:
		"""Game Boy Advance memory layout."""
		layout = MemoryLayout(
			name="GBA",
			platform="GBA",
			address_bits=32,
			description="Game Boy Advance memory map"
		)
		
		# BIOS
		layout.add_region(MemoryRegion(
			name="System ROM",
			start=0x00000000, end=0x00003FFF,
			type=MemoryType.ROM,
			access=AccessMode.READ,
			description="16KB BIOS ROM"
		))
		
		# External WRAM
		layout.add_region(MemoryRegion(
			name="External WRAM",
			start=0x02000000, end=0x0203FFFF,
			type=MemoryType.WRAM,
			description="256KB External Work RAM"
		))
		
		# Internal WRAM
		layout.add_region(MemoryRegion(
			name="Internal WRAM",
			start=0x03000000, end=0x03007FFF,
			type=MemoryType.WRAM,
			description="32KB Internal Work RAM"
		))
		
		# I/O Registers
		layout.add_region(MemoryRegion(
			name="I/O Registers",
			start=0x04000000, end=0x040003FF,
			type=MemoryType.IO,
			description="Hardware I/O registers"
		))
		
		# Palette RAM
		layout.add_region(MemoryRegion(
			name="Palette RAM",
			start=0x05000000, end=0x050003FF,
			type=MemoryType.VRAM,
			description="1KB Palette RAM"
		))
		
		# VRAM
		layout.add_region(MemoryRegion(
			name="VRAM",
			start=0x06000000, end=0x06017FFF,
			type=MemoryType.VRAM,
			description="96KB Video RAM"
		))
		
		# OAM
		layout.add_region(MemoryRegion(
			name="OAM",
			start=0x07000000, end=0x070003FF,
			type=MemoryType.OAM,
			description="1KB Object Attribute Memory"
		))
		
		# Game Pak ROM
		layout.add_region(MemoryRegion(
			name="ROM",
			start=0x08000000, end=0x09FFFFFF,
			type=MemoryType.ROM,
			access=AccessMode.READ,
			description="32MB Game Pak ROM"
		))
		
		# Game Pak SRAM
		layout.add_region(MemoryRegion(
			name="SRAM",
			start=0x0E000000, end=0x0E00FFFF,
			type=MemoryType.SRAM,
			description="64KB Game Pak SRAM"
		))
		
		return layout
	
	@staticmethod
	def genesis() -> MemoryLayout:
		"""Sega Genesis memory layout."""
		layout = MemoryLayout(
			name="Genesis",
			platform="Genesis",
			address_bits=24,
			description="Sega Genesis/Mega Drive memory map"
		)
		
		# ROM
		layout.add_region(MemoryRegion(
			name="ROM",
			start=0x000000, end=0x3FFFFF,
			type=MemoryType.ROM,
			access=AccessMode.READ,
			description="4MB cartridge ROM"
		))
		
		# SRAM
		layout.add_region(MemoryRegion(
			name="SRAM",
			start=0x200000, end=0x20FFFF,
			type=MemoryType.SRAM,
			description="Save RAM (if present)"
		))
		
		# VDP Ports
		layout.add_region(MemoryRegion(
			name="VDP",
			start=0xC00000, end=0xC0001F,
			type=MemoryType.PPU,
			description="VDP ports"
		))
		
		# PSG
		layout.add_region(MemoryRegion(
			name="PSG",
			start=0xC00011, end=0xC00011,
			type=MemoryType.APU,
			description="PSG port"
		))
		
		# I/O Area
		layout.add_region(MemoryRegion(
			name="I/O",
			start=0xA10000, end=0xA1001F,
			type=MemoryType.IO,
			description="I/O registers"
		))
		
		# Z80 RAM
		layout.add_region(MemoryRegion(
			name="Z80 RAM",
			start=0xA00000, end=0xA0FFFF,
			type=MemoryType.RAM,
			description="Z80 address space"
		))
		
		# Work RAM
		layout.add_region(MemoryRegion(
			name="Work RAM",
			start=0xFF0000, end=0xFFFFFF,
			type=MemoryType.WRAM,
			description="64KB Work RAM"
		))
		
		return layout


class MemoryVisualizer:
	"""Visualize memory layouts."""
	
	def __init__(self, layout: MemoryLayout):
		self.layout = layout
	
	def text_map(self, width: int = 80) -> str:
		"""Generate text memory map."""
		lines = []
		lines.append(f"Memory Layout: {self.layout.name}")
		lines.append(f"Platform: {self.layout.platform}")
		lines.append(f"Address Space: {self.layout.address_bits} bits")
		lines.append("=" * width)
		lines.append("")
		
		# Sort regions by start address
		regions = sorted(self.layout.regions, key=lambda r: r.start)
		
		# Column headers
		header = f"{'Start':>10} - {'End':>10} {'Size':>10}  {'Type':<8} {'Name'}"
		lines.append(header)
		lines.append("-" * width)
		
		for region in regions:
			size_str = self._format_size(region.size)
			start = f"${region.start:0{self.layout.address_bits // 4}X}"
			end = f"${region.end:0{self.layout.address_bits // 4}X}"
			
			line = f"{start:>10} - {end:>10} {size_str:>10}  {region.type.name:<8} {region.name}"
			lines.append(line)
			
			if region.description:
				lines.append(f"{'':>36}  {region.description}")
		
		return "\n".join(lines)
	
	def _format_size(self, size: int) -> str:
		"""Format size with units."""
		if size >= 1024 * 1024:
			return f"{size // (1024 * 1024)}MB"
		elif size >= 1024:
			return f"{size // 1024}KB"
		else:
			return f"{size}B"
	
	def ascii_bar(self, chars: int = 64) -> str:
		"""Generate ASCII memory bar."""
		max_addr = 2 ** self.layout.address_bits
		
		# Create bar
		bar = ["."] * chars
		
		# Fill in regions
		type_chars = {
			MemoryType.ROM: "R",
			MemoryType.RAM: "W",
			MemoryType.SRAM: "S",
			MemoryType.VRAM: "V",
			MemoryType.WRAM: "W",
			MemoryType.IO: "I",
			MemoryType.APU: "A",
			MemoryType.PPU: "P",
			MemoryType.OAM: "O",
			MemoryType.MIRROR: "m",
			MemoryType.OPEN: "."
		}
		
		for region in self.layout.regions:
			start_char = int(region.start / max_addr * chars)
			end_char = int(region.end / max_addr * chars)
			
			char = type_chars.get(region.type, "?")
			for i in range(start_char, min(end_char + 1, chars)):
				bar[i] = char
		
		# Build output
		lines = []
		lines.append("Memory Map:")
		lines.append("[" + "".join(bar) + "]")
		lines.append("")
		lines.append("Legend:")
		for mem_type, char in type_chars.items():
			if char != ".":
				lines.append(f"  {char} = {mem_type.name}")
		
		return "\n".join(lines)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Memory Layout Editor")
	parser.add_argument("file", nargs="?", help="Layout JSON file")
	parser.add_argument("--platform", "-p",
						choices=["nes", "snes", "gb", "gba", "genesis"],
						help="Use platform preset")
	parser.add_argument("--generate", "-g", action="store_true",
						help="Generate template")
	parser.add_argument("--visualize", "-v", action="store_true",
						help="Visualize layout")
	parser.add_argument("--output", "-o", help="Output file")
	parser.add_argument("--format", "-f", choices=["json", "c", "asm"],
						default="json", help="Output format")
	
	args = parser.parse_args()
	
	layout = None
	
	if args.platform:
		presets = {
			"nes": PlatformPresets.nes,
			"snes": PlatformPresets.snes,
			"gb": PlatformPresets.gameboy,
			"gba": PlatformPresets.gba,
			"genesis": PlatformPresets.genesis
		}
		layout = presets[args.platform]()
		print(f"Loaded {layout.name} preset")
	
	elif args.file:
		if not os.path.exists(args.file):
			print(f"File not found: {args.file}")
			return
		
		with open(args.file, "r") as f:
			data = json.load(f)
		layout = MemoryLayout.from_dict(data)
		print(f"Loaded: {args.file}")
	
	elif args.generate:
		# Generate empty template
		layout = MemoryLayout(
			name="Custom",
			platform="Custom",
			address_bits=16
		)
		layout.add_region(MemoryRegion(
			name="RAM",
			start=0x0000,
			end=0x1FFF,
			type=MemoryType.RAM
		))
		layout.add_region(MemoryRegion(
			name="ROM",
			start=0x8000,
			end=0xFFFF,
			type=MemoryType.ROM
		))
		print("Generated template layout")
	
	else:
		print("Memory Layout Editor")
		print()
		print("Usage: python memory_layout.py [options]")
		print()
		print("Options:")
		print("  --platform TYPE   Use preset (nes/snes/gb/gba/genesis)")
		print("  --generate        Generate template")
		print("  --visualize       Show memory map")
		print("  --output FILE     Output file")
		return
	
	if layout is None:
		return
	
	# Visualize
	if args.visualize:
		viz = MemoryVisualizer(layout)
		print()
		print(viz.text_map())
		print()
		print(viz.ascii_bar())
		return
	
	# Output
	if args.output:
		if args.format == "json":
			with open(args.output, "w") as f:
				json.dump(layout.to_dict(), f, indent="\t")
			print(f"Saved: {args.output}")
		elif args.format == "c":
			# Generate C header
			lines = [f"// Memory layout: {layout.name}"]
			lines.append(f"// Platform: {layout.platform}")
			lines.append("")
			for region in layout.regions:
				name = region.name.upper().replace(" ", "_")
				lines.append(f"#define {name}_START 0x{region.start:X}")
				lines.append(f"#define {name}_END   0x{region.end:X}")
				lines.append(f"#define {name}_SIZE  0x{region.size:X}")
				lines.append("")
			with open(args.output, "w") as f:
				f.write("\n".join(lines))
			print(f"Saved: {args.output}")
	else:
		# Print summary
		viz = MemoryVisualizer(layout)
		print()
		print(viz.text_map())


if __name__ == "__main__":
	main()
