#!/usr/bin/env python3
"""
Palette Analyzer - Analyze and manage color palettes from ROMs.

Tools for extracting, analyzing, and editing NES, SNES, and
Genesis color palettes.

Usage:
	python palette_analyzer.py <rom>
	python palette_analyzer.py <palette.pal> --visualize
	python palette_analyzer.py --extract-all

Features:
	- Multi-system palette support
	- Palette extraction
	- Color ramp analysis
	- Palette visualization
	- Export/import formats
"""

import argparse
import json
import os
import struct
import sys
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


class PaletteSystem(Enum):
	"""Supported systems."""
	NES = auto()
	SNES = auto()
	GENESIS = auto()
	GB = auto()
	GBC = auto()
	GBA = auto()
	CUSTOM = auto()


@dataclass
class Color:
	"""RGB color."""
	r: int
	g: int
	b: int
	
	@property
	def hex(self) -> str:
		"""Get hex string."""
		return f"#{self.r:02X}{self.g:02X}{self.b:02X}"
	
	@property
	def luminance(self) -> float:
		"""Get perceived luminance."""
		return 0.299 * self.r + 0.587 * self.g + 0.114 * self.b
	
	def distance(self, other: "Color") -> float:
		"""Calculate color distance."""
		return ((self.r - other.r) ** 2 +
				(self.g - other.g) ** 2 +
				(self.b - other.b) ** 2) ** 0.5
	
	@classmethod
	def from_hex(cls, hex_str: str) -> "Color":
		"""Create from hex string."""
		hex_str = hex_str.lstrip("#")
		return cls(
			r=int(hex_str[0:2], 16),
			g=int(hex_str[2:4], 16),
			b=int(hex_str[4:6], 16)
		)
	
	@classmethod
	def from_nes(cls, nes_color: int) -> "Color":
		"""Create from NES palette index."""
		# Standard NES palette
		NES_PALETTE = [
			(84, 84, 84), (0, 30, 116), (8, 16, 144), (48, 0, 136),
			(68, 0, 100), (92, 0, 48), (84, 4, 0), (60, 24, 0),
			(32, 42, 0), (8, 58, 0), (0, 64, 0), (0, 60, 0),
			(0, 50, 60), (0, 0, 0), (0, 0, 0), (0, 0, 0),
			(152, 150, 152), (8, 76, 196), (48, 50, 236), (92, 30, 228),
			(136, 20, 176), (160, 20, 100), (152, 34, 32), (120, 60, 0),
			(84, 90, 0), (40, 114, 0), (8, 124, 0), (0, 118, 40),
			(0, 102, 120), (0, 0, 0), (0, 0, 0), (0, 0, 0),
			(236, 238, 236), (76, 154, 236), (120, 124, 236), (176, 98, 236),
			(228, 84, 236), (236, 88, 180), (236, 106, 100), (212, 136, 32),
			(160, 170, 0), (116, 196, 0), (76, 208, 32), (56, 204, 108),
			(56, 180, 204), (60, 60, 60), (0, 0, 0), (0, 0, 0),
			(236, 238, 236), (168, 204, 236), (188, 188, 236), (212, 178, 236),
			(236, 174, 236), (236, 174, 212), (236, 180, 176), (228, 196, 144),
			(204, 210, 120), (180, 222, 120), (168, 226, 144), (152, 226, 180),
			(160, 214, 228), (160, 162, 160), (0, 0, 0), (0, 0, 0)
		]
		
		if 0 <= nes_color < len(NES_PALETTE):
			r, g, b = NES_PALETTE[nes_color]
			return cls(r, g, b)
		return cls(0, 0, 0)
	
	@classmethod
	def from_snes(cls, snes_color: int) -> "Color":
		"""Create from 15-bit SNES color."""
		r = (snes_color & 0x1F) << 3
		g = ((snes_color >> 5) & 0x1F) << 3
		b = ((snes_color >> 10) & 0x1F) << 3
		return cls(r, g, b)
	
	@classmethod
	def from_genesis(cls, genesis_color: int) -> "Color":
		"""Create from 9-bit Genesis color."""
		r = ((genesis_color >> 1) & 0x07) << 5
		g = ((genesis_color >> 5) & 0x07) << 5
		b = ((genesis_color >> 9) & 0x07) << 5
		return cls(r, g, b)
	
	@classmethod
	def from_gba(cls, gba_color: int) -> "Color":
		"""Create from 15-bit GBA color."""
		# Same as SNES but with different byte order
		return cls.from_snes(gba_color)
	
	def to_snes(self) -> int:
		"""Convert to SNES format."""
		r = (self.r >> 3) & 0x1F
		g = (self.g >> 3) & 0x1F
		b = (self.b >> 3) & 0x1F
		return r | (g << 5) | (b << 10)
	
	def to_genesis(self) -> int:
		"""Convert to Genesis format."""
		r = (self.r >> 5) & 0x07
		g = (self.g >> 5) & 0x07
		b = (self.b >> 5) & 0x07
		return (b << 9) | (g << 5) | (r << 1)


@dataclass
class Palette:
	"""A color palette."""
	name: str
	colors: List[Color] = field(default_factory=list)
	system: PaletteSystem = PaletteSystem.CUSTOM
	address: int = 0  # ROM address where found
	
	def __len__(self) -> int:
		return len(self.colors)
	
	def get_color(self, index: int) -> Optional[Color]:
		"""Get color by index."""
		if 0 <= index < len(self.colors):
			return self.colors[index]
		return None
	
	def set_color(self, index: int, color: Color) -> None:
		"""Set color at index."""
		if 0 <= index < len(self.colors):
			self.colors[index] = color
	
	def analyze(self) -> Dict[str, Any]:
		"""Analyze palette characteristics."""
		if not self.colors:
			return {}
		
		# Luminance analysis
		lums = [c.luminance for c in self.colors]
		
		# Color variety
		unique = len(set(c.hex for c in self.colors))
		
		# Find color ramps (gradients)
		ramps = self._find_ramps()
		
		# Dominant colors
		dominant = sorted(self.colors, key=lambda c: c.luminance, reverse=True)[:4]
		
		return {
			"count": len(self.colors),
			"unique_colors": unique,
			"avg_luminance": sum(lums) / len(lums),
			"min_luminance": min(lums),
			"max_luminance": max(lums),
			"ramps": len(ramps),
			"ramp_details": ramps,
			"brightest": dominant[0].hex if dominant else None,
			"has_black": any(c.r < 16 and c.g < 16 and c.b < 16 for c in self.colors),
			"has_white": any(c.r > 240 and c.g > 240 and c.b > 240 for c in self.colors)
		}
	
	def _find_ramps(self) -> List[List[int]]:
		"""Find color ramps (gradients) in palette."""
		ramps = []
		
		# Check for luminance-based ramps
		for start in range(0, len(self.colors) - 2, 4):
			group = self.colors[start:start + 4]
			if len(group) < 4:
				continue
			
			lums = [c.luminance for c in group]
			
			# Check if monotonically changing
			increasing = all(lums[i] <= lums[i + 1] for i in range(len(lums) - 1))
			decreasing = all(lums[i] >= lums[i + 1] for i in range(len(lums) - 1))
			
			if increasing or decreasing:
				ramps.append(list(range(start, start + 4)))
		
		return ramps
	
	def to_ascii_art(self, width: int = 16) -> str:
		"""Generate ASCII representation."""
		lines = []
		
		# Color blocks using Unicode
		for i, color in enumerate(self.colors):
			if i % width == 0:
				if i > 0:
					lines.append("")
			
			# Use shade based on luminance
			lum = color.luminance / 255
			if lum < 0.2:
				char = "█"
			elif lum < 0.4:
				char = "▓"
			elif lum < 0.6:
				char = "▒"
			elif lum < 0.8:
				char = "░"
			else:
				char = " "
			
			lines[-1] if lines else lines.append("")
			if lines:
				lines[-1] += char + char
			else:
				lines.append(char + char)
		
		return "\n".join(lines)
	
	def to_html(self) -> str:
		"""Generate HTML visualization."""
		html = ['<div style="display: flex; flex-wrap: wrap;">']
		
		for i, color in enumerate(self.colors):
			html.append(
				f'<div style="width: 32px; height: 32px; background: {color.hex}; '
				f'border: 1px solid #000;" title="{i}: {color.hex}"></div>'
			)
		
		html.append('</div>')
		return "\n".join(html)
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"name": self.name,
			"system": self.system.name,
			"address": self.address,
			"colors": [c.hex for c in self.colors]
		}
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "Palette":
		"""Create from dictionary."""
		colors = [Color.from_hex(h) for h in data.get("colors", [])]
		return cls(
			name=data.get("name", ""),
			colors=colors,
			system=PaletteSystem[data.get("system", "CUSTOM")],
			address=data.get("address", 0)
		)
	
	def export_pal(self) -> bytes:
		"""Export as JASC PAL format."""
		lines = ["JASC-PAL", "0100", str(len(self.colors))]
		for color in self.colors:
			lines.append(f"{color.r} {color.g} {color.b}")
		return "\r\n".join(lines).encode("ascii")
	
	def export_act(self) -> bytes:
		"""Export as Adobe ACT format."""
		data = bytearray()
		for color in self.colors:
			data.extend([color.r, color.g, color.b])
		# Pad to 256 colors
		while len(data) < 768:
			data.extend([0, 0, 0])
		return bytes(data)
	
	@classmethod
	def import_pal(cls, data: bytes, name: str = "") -> "Palette":
		"""Import from JASC PAL format."""
		lines = data.decode("ascii").strip().split("\n")
		colors = []
		
		for line in lines[3:]:  # Skip header
			parts = line.strip().split()
			if len(parts) >= 3:
				r, g, b = int(parts[0]), int(parts[1]), int(parts[2])
				colors.append(Color(r, g, b))
		
		return cls(name=name, colors=colors)


class PaletteAnalyzer:
	"""Analyze palettes in ROMs."""
	
	def __init__(self):
		self.data: bytes = b""
		self.system: PaletteSystem = PaletteSystem.CUSTOM
		self.palettes: List[Palette] = []
	
	def load_rom(self, filepath: str) -> bool:
		"""Load ROM file."""
		with open(filepath, "rb") as f:
			self.data = f.read()
		
		# Detect system
		if self.data[:4] == b"NES\x1a":
			self.system = PaletteSystem.NES
		elif len(self.data) >= 0x8000:
			# Check SNES header
			if self._check_snes_header(0x7FB0) or self._check_snes_header(0xFFB0):
				self.system = PaletteSystem.SNES
		elif len(self.data) >= 0x200 and b"SEGA" in self.data[0x100:0x110]:
			self.system = PaletteSystem.GENESIS
		
		return True
	
	def _check_snes_header(self, offset: int) -> bool:
		"""Check for valid SNES header."""
		if len(self.data) < offset + 0x30:
			return False
		checksum = struct.unpack("<H", self.data[offset + 0x1E:offset + 0x20])[0]
		complement = struct.unpack("<H", self.data[offset + 0x1C:offset + 0x1E])[0]
		return (checksum ^ complement) == 0xFFFF
	
	def extract_nes_palettes(self) -> List[Palette]:
		"""Extract NES palette data."""
		palettes = []
		
		# NES uses indexed palette values (0x00-0x3F)
		# Look for palette tables (groups of 4 or 16 bytes)
		
		# Skip header
		start = 16 if self.data[:4] == b"NES\x1a" else 0
		
		for offset in range(start, len(self.data) - 15):
			# Check for potential palette (4 colors)
			chunk = self.data[offset:offset + 4]
			
			# Palettes typically start with background color
			# and contain valid NES color indices
			if all(b < 0x40 for b in chunk):
				# Check if it looks like a palette
				unique = len(set(chunk))
				if unique >= 2:  # At least 2 different colors
					colors = [Color.from_nes(b) for b in chunk]
					pal = Palette(
						name=f"NES_${offset:06X}",
						colors=colors,
						system=PaletteSystem.NES,
						address=offset
					)
					palettes.append(pal)
		
		# Deduplicate
		seen = set()
		unique_pals = []
		for pal in palettes:
			key = tuple(c.hex for c in pal.colors)
			if key not in seen:
				seen.add(key)
				unique_pals.append(pal)
		
		self.palettes = unique_pals
		return unique_pals
	
	def extract_snes_palettes(self, colors_per_palette: int = 16) -> List[Palette]:
		"""Extract SNES palette data."""
		palettes = []
		
		# SNES uses 15-bit color (2 bytes per color)
		bytes_per_pal = colors_per_palette * 2
		
		for offset in range(0, len(self.data) - bytes_per_pal, 2):
			colors = []
			valid = True
			
			for i in range(colors_per_palette):
				color_offset = offset + (i * 2)
				if color_offset + 1 >= len(self.data):
					valid = False
					break
				
				word = struct.unpack("<H", self.data[color_offset:color_offset + 2])[0]
				colors.append(Color.from_snes(word))
			
			if valid and len(colors) == colors_per_palette:
				# Quick heuristic: palettes usually have some color variety
				unique = len(set(c.hex for c in colors))
				if unique >= colors_per_palette // 4:
					pal = Palette(
						name=f"SNES_${offset:06X}",
						colors=colors,
						system=PaletteSystem.SNES,
						address=offset
					)
					palettes.append(pal)
		
		# Only keep unique palettes
		seen = set()
		unique_pals = []
		for pal in palettes[:100]:  # Limit results
			key = tuple(c.hex for c in pal.colors)
			if key not in seen:
				seen.add(key)
				unique_pals.append(pal)
		
		self.palettes = unique_pals
		return unique_pals
	
	def extract_at_address(self, address: int, count: int,
						   system: PaletteSystem = None) -> Optional[Palette]:
		"""Extract palette at specific address."""
		system = system or self.system
		
		if system == PaletteSystem.NES:
			if address + count > len(self.data):
				return None
			colors = [Color.from_nes(self.data[address + i]) for i in range(count)]
		
		elif system == PaletteSystem.SNES:
			if address + count * 2 > len(self.data):
				return None
			colors = []
			for i in range(count):
				word = struct.unpack("<H", self.data[address + i * 2:address + i * 2 + 2])[0]
				colors.append(Color.from_snes(word))
		
		elif system == PaletteSystem.GENESIS:
			if address + count * 2 > len(self.data):
				return None
			colors = []
			for i in range(count):
				word = struct.unpack(">H", self.data[address + i * 2:address + i * 2 + 2])[0]
				colors.append(Color.from_genesis(word))
		
		else:
			return None
		
		return Palette(
			name=f"Palette_${address:06X}",
			colors=colors,
			system=system,
			address=address
		)
	
	def find_similar_palettes(self, target: Palette, 
							  threshold: float = 100.0) -> List[Tuple[Palette, float]]:
		"""Find palettes similar to target."""
		results = []
		
		for pal in self.palettes:
			if len(pal) != len(target):
				continue
			
			# Calculate total color distance
			total_dist = 0
			for c1, c2 in zip(pal.colors, target.colors):
				total_dist += c1.distance(c2)
			
			avg_dist = total_dist / len(pal)
			if avg_dist <= threshold:
				results.append((pal, avg_dist))
		
		results.sort(key=lambda x: x[1])
		return results


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Palette Analyzer")
	parser.add_argument("file", nargs="?", help="ROM or palette file")
	parser.add_argument("--address", "-a", type=lambda x: int(x, 0),
						help="Extract at address")
	parser.add_argument("--count", "-c", type=int, default=16,
						help="Colors to extract")
	parser.add_argument("--system", "-s",
						choices=["NES", "SNES", "GENESIS", "GB", "GBA"],
						help="System type")
	parser.add_argument("--extract-all", action="store_true",
						help="Extract all palettes")
	parser.add_argument("--visualize", "-v", action="store_true",
						help="Visualize palette")
	parser.add_argument("--analyze", action="store_true",
						help="Analyze palette")
	parser.add_argument("--export", "-e", choices=["pal", "act", "json"],
						help="Export format")
	parser.add_argument("--output", "-o", help="Output file")
	
	args = parser.parse_args()
	
	analyzer = PaletteAnalyzer()
	
	if not args.file:
		print("Palette Analyzer")
		print()
		print("Usage: python palette_analyzer.py <rom> [options]")
		print()
		print("Options:")
		print("  --address ADDR    Extract at address")
		print("  --count N         Colors to extract")
		print("  --system TYPE     System (NES/SNES/GENESIS)")
		print("  --extract-all     Extract all palettes")
		print("  --visualize       Show palette")
		print("  --analyze         Analyze palette")
		print("  --export FORMAT   Export (pal/act/json)")
		return
	
	if not os.path.exists(args.file):
		print(f"File not found: {args.file}")
		return
	
	# Load file
	analyzer.load_rom(args.file)
	print(f"Loaded: {args.file}")
	print(f"System: {analyzer.system.name}")
	print(f"Size: {len(analyzer.data)} bytes")
	print()
	
	# Override system
	if args.system:
		analyzer.system = PaletteSystem[args.system]
	
	# Extract at address
	if args.address is not None:
		pal = analyzer.extract_at_address(args.address, args.count)
		if pal:
			print(f"Palette at ${args.address:06X}:")
			for i, color in enumerate(pal.colors):
				print(f"  {i:2}: {color.hex}")
			
			if args.visualize:
				print()
				print(pal.to_ascii_art(args.count))
			
			if args.analyze:
				print()
				analysis = pal.analyze()
				for key, value in analysis.items():
					print(f"  {key}: {value}")
			
			if args.export:
				output = args.output or f"palette_{args.address:06X}"
				if args.export == "pal":
					with open(output + ".pal", "wb") as f:
						f.write(pal.export_pal())
					print(f"\nExported: {output}.pal")
				elif args.export == "act":
					with open(output + ".act", "wb") as f:
						f.write(pal.export_act())
					print(f"\nExported: {output}.act")
				elif args.export == "json":
					with open(output + ".json", "w") as f:
						json.dump(pal.to_dict(), f, indent="\t")
					print(f"\nExported: {output}.json")
		else:
			print("Failed to extract palette")
		return
	
	# Extract all
	if args.extract_all:
		if analyzer.system == PaletteSystem.NES:
			palettes = analyzer.extract_nes_palettes()
		elif analyzer.system == PaletteSystem.SNES:
			palettes = analyzer.extract_snes_palettes()
		else:
			print("Extraction not implemented for this system")
			return
		
		print(f"Found {len(palettes)} unique palettes:")
		for pal in palettes[:20]:
			colors_str = " ".join(c.hex for c in pal.colors[:4])
			print(f"  ${pal.address:06X}: {colors_str}...")
		if len(palettes) > 20:
			print(f"  ... and {len(palettes) - 20} more")


if __name__ == "__main__":
	main()
