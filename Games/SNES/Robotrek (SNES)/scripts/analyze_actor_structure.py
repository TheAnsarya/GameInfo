#!/usr/bin/env python3
"""Deep analysis of Robotrek actor data structure."""

import struct
import json

ROM_PATH = r"C:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Robotrek (U) [!].sfc"
OUTPUT_DIR = r"C:\Users\me\source\repos\GameInfo\Games\SNES\Robotrek (SNES)\extracted"

# Known actor table location
ACTOR_PTR_TABLE = 0x038000
ACTOR_COUNT = 128

def main():
	with open(ROM_PATH, 'rb') as f:
		rom = f.read()
	
	# Read all pointers
	pointers = []
	for i in range(ACTOR_COUNT):
		ptr = struct.unpack('<H', rom[ACTOR_PTR_TABLE + i*2:ACTOR_PTR_TABLE + i*2 + 2])[0]
		pointers.append(ptr)
	
	# The pointer table points to data in the same bank (bank $07, $038000-$03ffff)
	# Pointer values are bank-relative ($8000-$ffff range)
	# File offset = $030000 + (ptr & $7fff)
	
	print("Actor Data Structure Analysis")
	print("=" * 70)
	
	# Read all actor records
	actor_records = []
	for i in range(ACTOR_COUNT):
		ptr = pointers[i]
		file_offset = 0x030000 + (ptr & 0x7fff)
		
		# Determine record size from next pointer (or use 22 for last)
		if i < ACTOR_COUNT - 1:
			next_ptr = pointers[i + 1]
			record_size = next_ptr - ptr
		else:
			record_size = 22  # Assume standard size for last
		
		record = rom[file_offset:file_offset + record_size]
		actor_records.append({
			"index": i,
			"pointer": ptr,
			"file_offset": file_offset,
			"size": record_size,
			"data": record
		})
	
	# Analyze record sizes
	sizes = [r["size"] for r in actor_records[:-1]]
	size_counts = {}
	for s in sizes:
		size_counts[s] = size_counts.get(s, 0) + 1
	
	print("\nRecord size distribution:")
	for size, count in sorted(size_counts.items()):
		print(f"  {size:3d} bytes: {count} actors")
	
	# The first record is 109 bytes - likely special header
	# Rest are 22 bytes - standard enemy records
	
	# Focus on 22-byte records
	print("\n" + "=" * 70)
	print("22-byte Record Analysis")
	print("=" * 70)
	
	# Collect all 22-byte records
	standard_records = [r for r in actor_records if r["size"] == 22]
	print(f"\nFound {len(standard_records)} standard 22-byte records")
	
	# Analyze byte-by-byte patterns
	print("\nByte position analysis (min/max/avg across all 22-byte records):")
	print("-" * 70)
	
	for byte_pos in range(22):
		values = [r["data"][byte_pos] for r in standard_records if len(r["data"]) > byte_pos]
		if values:
			min_val = min(values)
			max_val = max(values)
			avg_val = sum(values) / len(values)
			unique = len(set(values))
			
			# Interpretation guess
			if min_val == max_val:
				interp = f"CONSTANT: ${min_val:02x}"
			elif unique <= 5:
				interp = f"TYPE/FLAG ({unique} values)"
			elif max_val < 64:
				interp = "Small value (stat?)"
			elif 128 <= min_val <= 255 and max_val <= 255:
				interp = "High byte range"
			else:
				interp = ""
			
			print(f"  Byte {byte_pos:2d}: min=${min_val:02x} max=${max_val:02x} avg={avg_val:5.1f} unique={unique:3d}  {interp}")
	
	# Check if any byte positions might be HP (would be 16-bit LE)
	print("\n" + "=" * 70)
	print("16-bit Value Analysis (possible HP, EXP, Gold at various offsets)")
	print("=" * 70)
	
	for byte_pos in range(0, 20, 2):  # Check even offsets
		values_16 = []
		for r in standard_records:
			if len(r["data"]) >= byte_pos + 2:
				val = struct.unpack('<H', r["data"][byte_pos:byte_pos+2])[0]
				values_16.append(val)
		
		if values_16:
			min_val = min(values_16)
			max_val = max(values_16)
			avg_val = sum(values_16) / len(values_16)
			
			# Check if plausible for HP (10-5000), EXP (1-10000), Gold (1-5000)
			hp_plausible = 10 <= avg_val <= 5000 and max_val < 10000
			
			status = "HP/EXP candidate" if hp_plausible else ""
			print(f"  Bytes {byte_pos:2d}-{byte_pos+1:2d}: min={min_val:5d} max={max_val:5d} avg={avg_val:7.1f}  {status}")
	
	# Print first 10 records with all bytes
	print("\n" + "=" * 70)
	print("First 10 Records (22 bytes each)")
	print("=" * 70)
	
	for r in standard_records[:10]:
		idx = r["index"]
		data = r["data"]
		hex_str = ' '.join(f'{b:02x}' for b in data)
		print(f"\nActor {idx:3d} @ ${r['file_offset']:06x}:")
		print(f"  {hex_str}")
		
		# Try to decode as: [2B flags] [2B HP?] [1B ATK?] [1B DEF?] [2B EXP?] [2B Gold?] [rest unknown]
		if len(data) >= 10:
			flags = struct.unpack('<H', data[0:2])[0]
			val1 = struct.unpack('<H', data[2:4])[0]
			val2 = struct.unpack('<H', data[4:6])[0]
			val3 = struct.unpack('<H', data[6:8])[0]
			val4 = struct.unpack('<H', data[8:10])[0]
			print(f"  16-bit: [0]=${flags:04x} [2]={val1} [4]={val2} [6]={val3} [8]={val4}")

if __name__ == "__main__":
	main()
