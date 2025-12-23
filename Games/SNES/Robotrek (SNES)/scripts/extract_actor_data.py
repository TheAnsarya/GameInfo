#!/usr/bin/env python3
"""Extract actor/enemy data from Robotrek ROM."""

import struct
import json
import os

# ROM path
ROM_PATH = r"C:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Robotrek (U) [!].sfc"
OUTPUT_DIR = r"C:\Users\me\source\repos\GameInfo\Games\SNES\Robotrek (SNES)\extracted"

# Actor pointer table location (file offset)
ACTOR_PTR_TABLE = 0x038000
ACTOR_COUNT = 128
ACTOR_RECORD_SIZE = 22

# Enemy name table location (file offset)
ENEMY_NAME_START = 0x01fdb6  # First enemy name "Mine"
ENEMY_NAME_END = 0x01ff72    # After "Big Fan"

def hirom_to_file(addr):
	"""Convert HiROM address to file offset."""
	bank = (addr >> 16) & 0xff
	offset = addr & 0xffff
	if bank >= 0xc0:
		return ((bank - 0xc0) * 0x10000) + offset
	elif bank >= 0x80:
		return ((bank - 0x80) * 0x10000) + (offset & 0x7fff)
	else:
		return (bank * 0x10000) + (offset & 0x7fff)

def file_to_hirom(offset):
	"""Convert file offset to HiROM address."""
	bank = offset // 0x8000
	addr = 0x8000 + (offset % 0x8000)
	return (0xc0 + bank) << 16 | addr

def main():
	with open(ROM_PATH, 'rb') as f:
		# First, extract enemy names
		print("Extracting enemy names...")
		print("="*60)
		
		f.seek(ENEMY_NAME_START)
		name_data = f.read(ENEMY_NAME_END - ENEMY_NAME_START)
		
		# Parse null-terminated strings
		enemy_names = []
		current_name = ""
		current_addr = ENEMY_NAME_START
		name_start = ENEMY_NAME_START
		
		for i, byte in enumerate(name_data):
			if byte == 0:  # Null terminator
				if current_name:
					enemy_names.append({
						"index": len(enemy_names),
						"name": current_name,
						"file_offset": f"${name_start:06x}",
						"snes_addr": f"${file_to_hirom(name_start):06x}"
					})
					print(f"Enemy {len(enemy_names)-1:3d}: {current_name} @ ${name_start:06x}")
				current_name = ""
				name_start = ENEMY_NAME_START + i + 1
			elif 32 <= byte < 127:
				current_name += chr(byte)
		
		print(f"\nTotal enemies found: {len(enemy_names)}")
		
		# Save enemy names to JSON
		os.makedirs(OUTPUT_DIR, exist_ok=True)
		output_path = os.path.join(OUTPUT_DIR, "enemy_names.json")
		with open(output_path, 'w') as out:
			json.dump({
				"name_table_start": f"${ENEMY_NAME_START:06x}",
				"name_table_end": f"${ENEMY_NAME_END:06x}",
				"enemy_count": len(enemy_names),
				"enemies": enemy_names
			}, out, indent='\t')
		print(f"\nSaved to: {output_path}")
		
		# Now read pointer table
		print("\n" + "="*60)
		print("Actor Pointer Table Analysis")
		print("="*60)
		
		f.seek(ACTOR_PTR_TABLE)
		ptr_data = f.read(ACTOR_COUNT * 2)
		
		pointers = []
		for i in range(ACTOR_COUNT):
			ptr = struct.unpack('<H', ptr_data[i*2:i*2+2])[0]
			pointers.append(ptr)
		
		# Analyze pointer increments
		increments = {}
		for i in range(len(pointers) - 1):
			diff = pointers[i+1] - pointers[i]
			increments[diff] = increments.get(diff, 0) + 1
		
		print("Pointer increment distribution:")
		for diff, count in sorted(increments.items()):
			print(f"  {diff} bytes: {count} occurrences")
		
		# Most common increment is likely the record size
		common_size = max(increments, key=increments.get)
		print(f"\nMost common record size: {common_size} bytes")
		
		# Read a sample of records with the common size
		print(f"\nSample records (22-byte entries):")
		print("-"*60)
		
		actor_data = []
		for i in range(min(16, ACTOR_COUNT)):
			ptr = pointers[i]
			file_offset = 0x030000 + (ptr & 0x7fff)
			f.seek(file_offset)
			record = f.read(22)
			
			actor_data.append({
				"index": i,
				"pointer": f"${ptr:04x}",
				"file_offset": f"${file_offset:06x}",
				"raw_hex": ' '.join(f'{b:02x}' for b in record)
			})
			
			if i < 8:
				print(f"Actor {i:3d} @ ${file_offset:06x}: {' '.join(f'{b:02x}' for b in record[:16])}...")

if __name__ == "__main__":
	main()
