#!/usr/bin/env python3
"""Investigate weapon data structure in Secret of Mana ROM."""

import sys
import os
sys.path.insert(0, 'tools')

script_dir = os.path.dirname(os.path.abspath(__file__))
rom_path = os.path.join(script_dir, '..', '..', '..', '..', '~roms', 'SNES', 'GoodSNES', 'Secret of Mana (U) [!].sfc')
with open(rom_path, 'rb') as f:
    data = f.read()

# Search for weapon power data
# Secret of Mana has 9 weapon types x 9 levels = 81 weapons
# Attack values for swords: 1, 2, 3, 4, 5, 6, 7, 8, 9 (roughly)

print("Searching for weapon data patterns...")
print()

# Search for sequential attack values
for i in range(0x100000, 0x110000):
    if data[i:i+5] == bytes([1, 2, 3, 4, 5]):
        context = data[i-4:i+20]
        hex_str = " ".join(f"{b:02x}" for b in context)
        print(f"Found at 0x{i:06x}: {hex_str}")

print()
print("Checking specific documented offsets...")

# Weapon entry: each weapon has attack power and other attributes
# 9 types * 9 levels = 81 total weapons
# Entry size likely 4-8 bytes each

for offset in [0x101000, 0x101100, 0x101200, 0x101300, 0x101400]:
    print(f"\nOffset 0x{offset:06x}:")
    for i in range(9):
        base = offset + (i * 9)  # Maybe 9 bytes per type (1 per level)?
        entry = data[base:base+9]
        hex_str = " ".join(f"{b:02x}" for b in entry)
        print(f"  {i}: {hex_str}")
