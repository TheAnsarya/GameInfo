#!/usr/bin/env python3
"""
Robotrek Actor/Entity Data Analyzer

Analyzes the actor/entity tables at $038000 to understand:
- Actor pointer table structure
- Individual actor data format
- Sprite/animation references
"""

import struct
import json
import os

ROM_PATH = r"C:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Robotrek (U) [!].sfc"
OUTPUT_DIR = r"C:\Users\me\source\repos\GameInfo\Games\SNES\Robotrek (SNES)\extracted"

# Actor table locations
ACTOR_PTR_TABLE = 0x038000
ACTOR_PTR_COUNT = 192  # 0x180 bytes / 2 = 192 entries
ACTOR_DATA_BASE = 0x038000  # Base for pointer calculation


def analyze_actor_pointers(rom: bytes) -> list:
	"""Read and analyze the actor pointer table."""
	pointers = []
	
	for i in range(ACTOR_PTR_COUNT):
		ptr_addr = ACTOR_PTR_TABLE + i * 2
		ptr = struct.unpack('<H', rom[ptr_addr:ptr_addr + 2])[0]
		
		# Convert bank-relative pointer to file offset
		file_offset = 0x030000 + ptr
		
		pointers.append({
			"index": i,
			"hex_index": f"${i:02x}",
			"pointer_address": f"${ptr_addr:06x}",
			"pointer_value": f"${ptr:04x}",
			"file_offset": f"${file_offset:06x}"
		})
	
	return pointers


def analyze_actor_data(rom: bytes, pointers: list, count: int = 64) -> list:
	"""Analyze individual actor data entries."""
	actors = []
	
	for i in range(min(count, len(pointers))):
		ptr = pointers[i]
		offset = int(ptr["file_offset"][1:], 16)
		
		# Read 32 bytes of actor data
		data = rom[offset:offset + 32]
		
		if len(data) < 22:
			continue
		
		# Actor 0 has a different format
		if i == 0:
			actor = {
				"index": i,
				"hex_index": f"${i:02x}",
				"offset": ptr["file_offset"],
				"type": "player",
				"raw_hex": ' '.join(f'{b:02x}' for b in data[:22]),
				"notes": "Main player/robot - different format"
			}
		else:
			# Standard actor format: 3x (fe GG GG 83 AA AA 83) + ff
			# GG GG = graphics pointer, AA AA = animation pointer
			frames = []
			pos = 0
			
			for frame_num in range(3):
				if pos + 7 <= len(data) and data[pos] == 0xfe:
					gfx_ptr = struct.unpack('<H', data[pos + 1:pos + 3])[0]
					anim_ptr = struct.unpack('<H', data[pos + 4:pos + 6])[0]
					
					frames.append({
						"frame": frame_num,
						"marker": f"${data[pos]:02x}",
						"graphics_ptr": f"${gfx_ptr:04x}",
						"graphics_offset": f"${0x030000 + gfx_ptr:06x}",
						"bank_byte1": f"${data[pos + 3]:02x}",
						"animation_ptr": f"${anim_ptr:04x}",
						"animation_offset": f"${0x030000 + anim_ptr:06x}",
						"bank_byte2": f"${data[pos + 6]:02x}",
					})
					pos += 7
				else:
					break
			
			# Check for terminator
			terminator = data[pos] if pos < len(data) else 0
			
			actor = {
				"index": i,
				"hex_index": f"${i:02x}",
				"offset": ptr["file_offset"],
				"type": "standard",
				"raw_hex": ' '.join(f'{b:02x}' for b in data[:22]),
				"frames": frames,
				"terminator": f"${terminator:02x}",
				"frame_count": len(frames)
			}
		
		actors.append(actor)
	
	return actors


def find_entry_size(pointers: list) -> dict:
	"""Determine the entry size by analyzing pointer differences."""
	differences = []
	
	for i in range(len(pointers) - 1):
		offset1 = int(pointers[i]["file_offset"][1:], 16)
		offset2 = int(pointers[i + 1]["file_offset"][1:], 16)
		diff = offset2 - offset1
		differences.append(diff)
	
	# Count frequency of each difference
	freq = {}
	for d in differences:
		freq[d] = freq.get(d, 0) + 1
	
	return {
		"differences": differences[:50],  # First 50 differences
		"frequency": dict(sorted(freq.items(), key=lambda x: -x[1])[:10]),  # Top 10
		"most_common": max(freq.keys(), key=lambda k: freq[k]) if freq else 0
	}


def main():
	print("Robotrek Actor/Entity Data Analyzer")
	print("=" * 60)
	
	# Load ROM
	with open(ROM_PATH, 'rb') as f:
		rom = f.read()
	
	print(f"ROM size: {len(rom):,} bytes")
	print()
	
	# Analyze pointers
	print("Analyzing actor pointer table...")
	pointers = analyze_actor_pointers(rom)
	print(f"  Found {len(pointers)} pointers")
	
	# Analyze entry size
	print("\nAnalyzing entry sizes...")
	size_info = find_entry_size(pointers)
	print(f"  Most common entry size: {size_info['most_common']} bytes")
	print(f"  Frequency distribution: {size_info['frequency']}")
	
	# Analyze first few actors
	print("\nAnalyzing actor data entries...")
	actors = analyze_actor_data(rom, pointers, count=30)
	print(f"  Analyzed {len(actors)} actors")
	
	# Print sample actor data
	print("\n" + "=" * 60)
	print("Sample Actor Data:")
	print("-" * 60)
	
	for actor in actors[:15]:
		print(f"Actor {actor['index']:3d} (${actor['index']:02x}) at {actor['offset']}:")
		print(f"  Type: {actor['type']}")
		print(f"  Raw: {actor['raw_hex']}")
		
		if actor['type'] == 'standard' and 'frames' in actor:
			for frame in actor['frames']:
				print(f"  Frame {frame['frame']}: gfx={frame['graphics_ptr']} "
					  f"({frame['graphics_offset']}) anim={frame['animation_ptr']} "
					  f"({frame['animation_offset']})")
			print(f"  Terminator: {actor['terminator']}")
		print()
	
	# Save results
	output = {
		"analysis_type": "Actor/Entity Data",
		"pointer_table_address": f"${ACTOR_PTR_TABLE:06x}",
		"pointer_count": len(pointers),
		"entry_size_analysis": size_info,
		"format_description": {
			"standard_actor": "22 bytes: 3x (fe GG GG 83 AA AA 83) + ff terminator",
			"frame_format": "fe [gfx_ptr_lo] [gfx_ptr_hi] 83 [anim_ptr_lo] [anim_ptr_hi] 83",
			"notes": [
				"GG GG = 16-bit pointer to graphics data in bank $03",
				"AA AA = 16-bit pointer to animation data in bank $03",
				"Actor 0 has different format (player character)"
			]
		},
		"pointers": pointers[:50],  # First 50
		"actors": actors
	}
	
	output_path = os.path.join(OUTPUT_DIR, "actor_data_analysis.json")
	with open(output_path, 'w') as f:
		json.dump(output, f, indent='\t')
	
	print(f"\nSaved analysis to: {output_path}")
	
	# Look for unique graphics/animation pointers
	print("\n" + "=" * 60)
	print("Unique Graphics Pointers:")
	print("-" * 60)
	
	gfx_ptrs = set()
	anim_ptrs = set()
	for actor in actors:
		if actor['type'] == 'standard' and 'frames' in actor:
			for frame in actor['frames']:
				gfx_ptrs.add(frame['graphics_ptr'])
				anim_ptrs.add(frame['animation_ptr'])
	
	print(f"Unique graphics pointers: {len(gfx_ptrs)}")
	for ptr in sorted(gfx_ptrs)[:10]:
		print(f"  {ptr}")
	
	print(f"\nUnique animation pointers: {len(anim_ptrs)}")
	for ptr in sorted(anim_ptrs)[:10]:
		print(f"  {ptr}")


if __name__ == "__main__":
	main()
