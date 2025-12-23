#!/usr/bin/env python3
"""
Search Robotrek ROM for enemy/weapon stat tables.

Strategy:
1. Look for tables with structured repeating patterns
2. Search for 16-bit LE values in valid HP ranges (1-9999)
3. Look for tables near known data (item names at $01F748, enemy names at $01FDB6)
4. Search compressed regions after decompression
5. Scan for pointer tables that may reference stat data
"""

import struct
import os

ROM_PATH = r"C:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Robotrek (U) [!].sfc"
OUTPUT_DIR = r"C:\Users\me\source\repos\GameInfo\Games\SNES\Robotrek (SNES)\extracted"

# Known enemy count
ENEMY_COUNT = 58

# Reasonable stat ranges for early enemies
# Early enemies should have low HP, Power, Guard, etc.
# Based on typical RPG design: first enemies ~10-50 HP


def analyze_region_as_table(rom: bytes, offset: int, record_size: int, record_count: int) -> dict:
	"""Analyze a region as potential stat table."""
	stats = {"record_size": record_size, "offset": offset, "records": []}
	
	for i in range(record_count):
		start = offset + i * record_size
		if start + record_size > len(rom):
			break
		record = rom[start:start + record_size]
		
		# Parse potential fields
		parsed = {
			"index": i,
			"raw": ' '.join(f'{b:02x}' for b in record[:min(16, len(record))])
		}
		
		# Try different field layouts
		if record_size >= 8:
			# Layout 1: 16-bit HP at offset 0
			hp1 = struct.unpack('<H', record[0:2])[0]
			parsed["hp_0_16le"] = hp1
			
			# Layout 2: 16-bit HP at offset 2
			hp2 = struct.unpack('<H', record[2:4])[0]
			parsed["hp_2_16le"] = hp2
		
		stats["records"].append(parsed)
	
	return stats


def find_structured_tables(rom: bytes, min_record_size: int = 6, max_record_size: int = 32):
	"""Find regions that look like structured tables."""
	candidates = []
	rom_size = len(rom)
	
	print("Scanning for structured tables...")
	
	# Scan regions likely to contain data tables
	# Banks: $01 (items), $02-$03, $06, $07
	scan_regions = [
		(0x010000, 0x020000, "Bank $01"),  # Continues from item data
		(0x020000, 0x030000, "Bank $02"),
		(0x030000, 0x040000, "Bank $03 (Actor data?)"),
		(0x060000, 0x070000, "Bank $06"),
		(0x070000, 0x080000, "Bank $07"),
		(0x0c0000, 0x0d0000, "Bank $0c"),
		(0x0d0000, 0x0e0000, "Bank $0d"),
	]
	
	for start, end, name in scan_regions:
		if start >= rom_size:
			continue
		end = min(end, rom_size)
		
		print(f"\n  Scanning {name} (${start:06x}-${end:06x})...")
		
		# Look for pointer tables (16-bit values that could be offsets)
		for offset in range(start, end - 256, 0x100):
			chunk = rom[offset:offset + 256]
			
			# Check if this looks like a pointer table
			# (consecutive 16-bit values with reasonable increments)
			ptrs = []
			valid = True
			for i in range(0, min(128, len(chunk)), 2):
				ptr = struct.unpack('<H', chunk[i:i+2])[0]
				ptrs.append(ptr)
				if i >= 2:
					# Check if increment is reasonable
					diff = ptrs[-1] - ptrs[-2]
					if diff < 0 or diff > 100:  # Allow some variation
						pass  # Don't break - might still be valid
			
			# Check for consistent record increments
			if len(ptrs) >= 20:
				increments = {}
				for i in range(1, len(ptrs)):
					inc = ptrs[i] - ptrs[i-1]
					if 6 <= inc <= 32:
						increments[inc] = increments.get(inc, 0) + 1
				
				if increments:
					most_common = max(increments.items(), key=lambda x: x[1])
					if most_common[1] >= 15:  # At least 15 records with same size
						candidates.append({
							"offset": offset,
							"bank": name,
							"record_size": most_common[0],
							"consistent_count": most_common[1],
							"ptrs": ptrs[:20]
						})
	
	return candidates


def search_for_value_sequences(rom: bytes, sequences: list, label: str):
	"""Search for specific byte sequences."""
	print(f"\nSearching for {label}...")
	
	for seq_name, seq_bytes in sequences:
		pos = 0
		found = []
		while pos < len(rom):
			idx = rom.find(seq_bytes, pos)
			if idx == -1:
				break
			found.append(idx)
			pos = idx + 1
		
		if found:
			print(f"  {seq_name}: Found at {', '.join(f'${x:06x}' for x in found[:5])}")
			if len(found) > 5:
				print(f"    ... and {len(found) - 5} more locations")


def analyze_near_known_tables(rom: bytes):
	"""Analyze data near known tables (item names, enemy names)."""
	
	print("\n" + "="*60)
	print("Analyzing regions near known data tables")
	print("="*60)
	
	# Item name pointer table at $01F748
	# Let's look at what's BEFORE and AFTER
	item_ptr_table = 0x01f748
	
	print(f"\n--- Near Item Pointer Table ($01f748) ---")
	
	# Check $01F000 to $01F748 for potential item stat tables
	region_start = 0x01f000
	print(f"\nData before item pointers (${region_start:06x}-${item_ptr_table:06x}):")
	
	# Dump in chunks to look for patterns
	for offset in range(region_start, item_ptr_table, 0x40):
		chunk = rom[offset:offset + 0x40]
		# Show as hex
		hex_str = ' '.join(f'{b:02x}' for b in chunk[:32])
		print(f"  ${offset:06x}: {hex_str}")
	
	# Enemy name table at $01FDB6
	# What's before it?
	enemy_name_start = 0x01fdb6
	
	print(f"\n--- Near Enemy Name Table ($01fdb6) ---")
	
	# Check what's between item name end and enemy name start
	# Item names end around $01FAD6, so check $01FAD6 to $01FDB6
	print(f"\nData between item and enemy names ($01fad6-$01fdb6):")
	
	for offset in range(0x01fad6, 0x01fdb6, 0x20):
		chunk = rom[offset:min(offset + 0x20, 0x01fdb6)]
		hex_str = ' '.join(f'{b:02x}' for b in chunk)
		print(f"  ${offset:06x}: {hex_str}")


def find_pointer_to_stat_tables(rom: bytes):
	"""Search for pointers that might reference stat table data."""
	
	print("\n" + "="*60)
	print("Searching for pointer tables to potential stat data")
	print("="*60)
	
	# Look for regions with consecutive 16-bit pointers
	# that point within the same bank
	
	candidates = []
	
	for bank in range(0x00, 0x18):  # Banks 0-23
		bank_start = bank * 0x10000
		
		# Scan for pointer table signatures
		for offset in range(bank_start, min(bank_start + 0x10000, len(rom)) - 256, 0x10):
			chunk = rom[offset:offset + 128]
			
			# Read as 16-bit LE pointers
			ptrs = [struct.unpack('<H', chunk[i:i+2])[0] for i in range(0, 128, 2)]
			
			# Check if they look like valid bank-local pointers
			# (values between $8000 and $FFFF for LoROM, or reasonable for HiROM)
			valid_count = 0
			increments = []
			
			for i in range(len(ptrs) - 1):
				diff = ptrs[i + 1] - ptrs[i]
				if 4 <= diff <= 32:  # Reasonable record size
					valid_count += 1
					increments.append(diff)
			
			if valid_count >= 30:  # At least 30 valid increments
				# Find most common increment
				inc_counts = {}
				for inc in increments:
					inc_counts[inc] = inc_counts.get(inc, 0) + 1
				
				if inc_counts:
					best_inc = max(inc_counts.items(), key=lambda x: x[1])
					if best_inc[1] >= 30:  # Very consistent
						candidates.append({
							"offset": offset,
							"bank": bank,
							"record_size": best_inc[0],
							"count": best_inc[1],
							"first_ptrs": ptrs[:10]
						})
	
	print(f"\nFound {len(candidates)} potential pointer tables:")
	for c in candidates[:10]:
		print(f"  ${c['offset']:06x} (Bank ${c['bank']:02x}): "
			  f"record_size={c['record_size']}, count={c['count']}")
		print(f"    First ptrs: {', '.join(f'${p:04x}' for p in c['first_ptrs'][:5])}")
	
	return candidates


def deep_scan_for_stat_patterns(rom: bytes):
	"""Deep scan looking for specific stat-like patterns."""
	
	print("\n" + "="*60)
	print("Deep scan for stat-like data patterns")
	print("="*60)
	
	# Pattern: Early enemies should have:
	# - Low HP (10-100)
	# - Low Power/Guard (1-20)
	# - Low EXP (1-50)
	# - Low Gold (10-500)
	
	# Look for sequences of bytes that could be:
	# HP (8-bit): 10-100 range
	# Power: 1-20 range
	# Guard: 1-20 range
	
	# Try finding a sequence like:
	# [HP][PWR][GRD][SPD][EXP][GOLD] repeated
	
	# Let's scan for regions where:
	# - First few bytes are in reasonable stat ranges
	# - Pattern repeats every N bytes
	
	candidates = []
	
	for record_size in [8, 10, 12, 14, 16, 18, 20]:
		for offset in range(0x010000, min(0x0c0000, len(rom)), 0x100):
			chunk = rom[offset:offset + record_size * 30]
			if len(chunk) < record_size * 30:
				continue
			
			# Analyze first 20 "records"
			valid_records = 0
			for i in range(20):
				rec_start = i * record_size
				record = chunk[rec_start:rec_start + record_size]
				
				# Check if first bytes look like stats
				# Byte 0 or 1: HP in range 5-255
				# Byte 2 or 3: Power/Guard in range 1-50
				
				b0, b1 = record[0], record[1]
				b2, b3 = record[2], record[3]
				
				# Check for reasonable stat-like values
				if (5 <= b0 <= 200 or 5 <= b1 <= 200) and \
				   (1 <= b2 <= 80 or 1 <= b3 <= 80):
					valid_records += 1
			
			if valid_records >= 15:
				candidates.append({
					"offset": offset,
					"record_size": record_size,
					"valid_count": valid_records
				})
	
	print(f"\nFound {len(candidates)} potential stat table regions:")
	
	# Show top candidates
	candidates.sort(key=lambda x: x["valid_count"], reverse=True)
	for c in candidates[:15]:
		offset = c["offset"]
		size = c["record_size"]
		print(f"\n  ${offset:06x} (size={size}, valid={c['valid_count']}):")
		
		# Show first 5 records
		for i in range(5):
			rec = rom[offset + i * size:offset + (i + 1) * size]
			hex_str = ' '.join(f'{b:02x}' for b in rec)
			print(f"    Record {i}: {hex_str}")
	
	return candidates


def main():
	print("Robotrek Stat Table Search")
	print("="*60)
	print(f"ROM: {ROM_PATH}")
	print()
	
	# Load ROM
	if not os.path.exists(ROM_PATH):
		print(f"Error: ROM not found at {ROM_PATH}")
		return
	
	with open(ROM_PATH, 'rb') as f:
		rom = f.read()
	
	print(f"ROM size: {len(rom):,} bytes ({len(rom) // 1024} KB)")
	print()
	
	# Analyze near known tables
	analyze_near_known_tables(rom)
	
	# Find pointer tables
	ptr_candidates = find_pointer_to_stat_tables(rom)
	
	# Deep scan for stat patterns
	stat_candidates = deep_scan_for_stat_patterns(rom)
	
	print("\n" + "="*60)
	print("Summary")
	print("="*60)
	print(f"Found {len(ptr_candidates)} potential pointer tables")
	print(f"Found {len(stat_candidates)} potential stat table regions")
	print()
	print("Next steps:")
	print("1. Manually examine top candidates in hex editor")
	print("2. Cross-reference with enemy IDs from name table")
	print("3. Trace game code to find stat loading routines")


if __name__ == "__main__":
	main()
