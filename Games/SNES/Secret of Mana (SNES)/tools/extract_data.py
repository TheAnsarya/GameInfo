#!/usr/bin/env python3
"""
Secret of Mana Data Extractor
Extracts game data from Secret of Mana (SNES) ROM.

Usage:
    python extract_data.py <rom_path> [--output <dir>]
"""

import argparse
import json
import struct
from pathlib import Path
from typing import Any

# ROM constants
ROM_SIZE = 0x200000  # 2 MB
EXPECTED_SHA256 = "4c15013131351e694e05f22e38bb1b3e4031dedac77ec75abecebe8520d82d5f"

# Data addresses (file offsets)
# Enemy stats: 29 bytes per enemy at 0x102655
# Structure: HP (byte), MP (byte), various attributes, EXP/Gold in later bytes
ENEMY_STATS_OFFSET = 0x102655  # Confirmed via pattern analysis
ENEMY_COUNT = 83
ENEMY_ENTRY_SIZE = 29  # 29 bytes per enemy

# Known enemy names (from game guides, HP verified from extraction)
ENEMY_NAMES = [
    "Rabite",           # 0 - HP 20
    "Buzz Bee",         # 1 - HP 30
    "Mushboom",         # 2 - HP 32
    "Chobin Hood",      # 3 - HP 39
    "Werewolf",         # 4 - HP 64
    "Lullabud",         # 5 - HP 36
    "Kid Goblin",       # 6 - HP 45
    "Green Drop",       # 7 - HP 45
    "Crawler",          # 8 - HP 47
    "Eye Spy",          # 9 - HP 48
    "Blat",             # 10 - HP 27
    "Polter Chair",     # 11 - HP 54
    "Rabite (Blue)",    # 12 - HP 20
    "Zombie",           # 13 - HP 37
    "Chess Knight",     # 14 - HP 31
    "Spiky Tiger",      # 15 - HP 55
    "Goblin",           # 16 - HP 52
    "Specter",          # 17 - HP 28
    "Dark Funk",        # 18 - HP 62
    "Kimono Bird",      # 19 - HP 61
    # More names can be added as verified
]

CHARACTER_STATS_OFFSET = 0x104213
CHARACTER_LEVEL_ENTRY_SIZE = 40
MAX_LEVEL = 99

EXIT_DATA_OFFSET = 0x083000
EXIT_ENTRY_SIZE = 4

ITEM_PRICES_OFFSET = 0x18fb9c
ITEM_COUNT = 96

# Known item names from game
ITEM_NAMES = [
    "Candy", "Chocolate", "Royal Jam", "Faerie Walnut", "Medical Herb",
    "Cup of Wishes", "Magic Rope", "Flammie Drum", "Moogle Belt", "Midge Mallet",
    "Barrel", "", "", "", "", "", "", "", "", "",
    "", "", "", "", "", "", "", "", "", "",
    "", "", "", "", "", "", "", "", "", "",
    "", "", "", "", "", "", "", "", "", "",
    "", "", "", "", "", "", "", "", "", "",
    "", "", "", "", "", "", "", "", "", "",
    "", "", "", "", "", "", "", "", "", "",
    "", "", "", "", "", "", "", "", "", "",
    "", "", "", "", "", ""  # Fill to 96
]


def read_word(data: bytes, offset: int) -> int:
    """Read 16-bit little-endian word."""
    return struct.unpack_from("<H", data, offset)[0]


def read_byte(data: bytes, offset: int) -> int:
    """Read single byte."""
    return data[offset]


def extract_enemy(data: bytes, index: int) -> dict[str, Any]:
    """Extract enemy data at given index.
    
    Enemy data structure (29 bytes):
    - Byte 0-1: HP (byte repeated)
    - Bytes 2-7: Unknown (flags, type data)
    - Bytes 8-9: Combat attributes
    - Bytes 10-11: Attack/Defense modifiers
    - Bytes 12-13: Additional combat values
    - Bytes 14-17: Reserved (0xfc 0x7f 0x00 0x00)
    - Bytes 18-19: Unknown
    - Bytes 20-21: Experience (little-endian, needs decoding)
    - Bytes 22-28: Gold and other values
    """
    offset = ENEMY_STATS_OFFSET + (index * ENEMY_ENTRY_SIZE)
    entry = data[offset:offset + ENEMY_ENTRY_SIZE]
    
    hp = entry[0]
    name = ENEMY_NAMES[index] if index < len(ENEMY_NAMES) else f"Enemy_{index:02d}"
    
    # Experience appears to be encoded differently
    # Looking at byte 20-21 as potential EXP values
    exp_raw = read_word(data, offset + 20)
    
    return {
        "id": index,
        "name": name,
        "hp": hp,
        "hp_byte1": entry[1],
        "unknown_2": entry[2],
        "unknown_3": entry[3],
        "unknown_4": entry[4],
        "unknown_5": entry[5],
        "unknown_6": entry[6],
        "unknown_7": entry[7],
        "attribute_8": entry[8],
        "attribute_9": entry[9],
        "attack_mod": entry[10],
        "defense_mod": entry[11],
        "combat_val_12": entry[12],
        "combat_val_13": entry[13],
        "exp_raw": exp_raw,
        "raw_bytes": entry.hex()
    }


def extract_all_enemies(data: bytes) -> list[dict[str, Any]]:
    """Extract all enemy data."""
    enemies = []
    for i in range(ENEMY_COUNT):
        enemies.append(extract_enemy(data, i))
    return enemies


def extract_item(data: bytes, index: int) -> dict[str, Any]:
    """Extract item data at given index."""
    price = read_word(data, ITEM_PRICES_OFFSET + index * 2)
    name = ITEM_NAMES[index] if index < len(ITEM_NAMES) else ""
    
    return {
        "id": index,
        "name": name,
        "price": price,
        "buyable": price != 0xffff
    }


def extract_all_items(data: bytes) -> list[dict[str, Any]]:
    """Extract all item data."""
    items = []
    for i in range(ITEM_COUNT):
        items.append(extract_item(data, i))
    return items


def extract_exit(data: bytes, index: int) -> dict[str, Any]:
    """Extract exit data at given index."""
    offset = EXIT_DATA_OFFSET + (index * EXIT_ENTRY_SIZE)
    
    return {
        "id": index,
        "destination_map": read_byte(data, offset),
        "destination_x": read_byte(data, offset + 1),
        "destination_y": read_byte(data, offset + 2),
        "flags": read_byte(data, offset + 3)
    }


def extract_exits(data: bytes, count: int = 256) -> list[dict[str, Any]]:
    """Extract exit data."""
    exits = []
    for i in range(count):
        exit_data = extract_exit(data, i)
        # Stop if we hit empty entries
        if exit_data["destination_map"] == 0 and exit_data["flags"] == 0:
            # Check if next few are also empty
            if all(extract_exit(data, i + j)["destination_map"] == 0 
                   for j in range(1, min(5, count - i))):
                break
        exits.append(exit_data)
    return exits


def file_offset_to_snes(offset: int) -> str:
    """Convert file offset to SNES HiROM address string."""
    bank = 0xc0 + (offset >> 16)
    addr = offset & 0xffff
    return f"${bank:02x}:{addr:04x}"


def analyze_rom_header(data: bytes) -> dict[str, Any]:
    """Analyze SNES ROM header."""
    # HiROM header is at $ffc0
    header_offset = 0x00ffc0
    
    # Read header fields
    title = data[header_offset:header_offset + 21].decode('ascii', errors='replace').strip()
    rom_makeup = data[header_offset + 0x15]
    rom_type = data[header_offset + 0x16]
    rom_size = data[header_offset + 0x17]
    sram_size = data[header_offset + 0x18]
    
    checksum_complement = read_word(data, header_offset + 0x1c)
    checksum = read_word(data, header_offset + 0x1e)
    
    # Interrupt vectors
    reset_vector = read_word(data, 0x00fffc)
    nmi_vector = read_word(data, 0x00ffea)
    irq_vector = read_word(data, 0x00ffee)
    
    return {
        "title": title,
        "rom_makeup": f"0x{rom_makeup:02x}",
        "rom_type": f"0x{rom_type:02x}",
        "rom_size_code": rom_size,
        "rom_size_kb": (1 << rom_size),
        "sram_size_code": sram_size,
        "sram_size_kb": (1 << sram_size) if sram_size > 0 else 0,
        "checksum": f"0x{checksum:04x}",
        "checksum_complement": f"0x{checksum_complement:04x}",
        "checksum_valid": (checksum ^ checksum_complement) == 0xffff,
        "reset_vector": f"${reset_vector:04x}",
        "nmi_vector": f"${nmi_vector:04x}",
        "irq_vector": f"${irq_vector:04x}",
        "mapping": "HiROM" if (rom_makeup & 0x01) else "LoROM"
    }


def main():
    parser = argparse.ArgumentParser(description="Extract data from Secret of Mana ROM")
    parser.add_argument("rom_path", help="Path to ROM file")
    parser.add_argument("--output", "-o", default=".", help="Output directory")
    parser.add_argument("--enemies", action="store_true", help="Extract enemy data")
    parser.add_argument("--items", action="store_true", help="Extract item data")
    parser.add_argument("--exits", action="store_true", help="Extract exit data")
    parser.add_argument("--header", action="store_true", help="Analyze ROM header")
    parser.add_argument("--all", action="store_true", help="Extract all data")
    args = parser.parse_args()
    
    # Default to all if nothing specified
    if not any([args.enemies, args.items, args.exits, args.header, args.all]):
        args.all = True
    
    # Read ROM
    rom_path = Path(args.rom_path)
    if not rom_path.exists():
        print(f"Error: ROM file not found: {rom_path}")
        return 1
    
    with open(rom_path, "rb") as f:
        data = f.read()
    
    if len(data) != ROM_SIZE:
        print(f"Warning: ROM size is {len(data)} bytes, expected {ROM_SIZE}")
    
    # Create output directory
    output_dir = Path(args.output)
    output_dir.mkdir(parents=True, exist_ok=True)
    
    # Extract data
    if args.header or args.all:
        print("Analyzing ROM header...")
        header_info = analyze_rom_header(data)
        
        with open(output_dir / "rom_header.json", "w") as f:
            json.dump(header_info, f, indent=2)
        
        print(f"  Title: {header_info['title']}")
        print(f"  Mapping: {header_info['mapping']}")
        print(f"  ROM Size: {header_info['rom_size_kb']} KB")
        print(f"  SRAM Size: {header_info['sram_size_kb']} KB")
        print(f"  Checksum: {header_info['checksum']} (valid: {header_info['checksum_valid']})")
        print(f"  Reset Vector: {header_info['reset_vector']}")
    
    if args.enemies or args.all:
        print(f"Extracting {ENEMY_COUNT} enemies...")
        enemies = extract_all_enemies(data)
        
        with open(output_dir / "enemies.json", "w") as f:
            json.dump(enemies, f, indent=2)
        
        print(f"  Saved to enemies.json")
        print(f"  First enemy (Rabite): HP={enemies[0]['hp']}")
        print(f"  Enemy 1 (Buzz Bee): HP={enemies[1]['hp']}")
        print(f"  Enemy 15 (Lullabud): HP={enemies[15]['hp']}")
    
    if args.items or args.all:
        print(f"Extracting {ITEM_COUNT} items...")
        items = extract_all_items(data)
        
        with open(output_dir / "items.json", "w") as f:
            json.dump(items, f, indent=2)
        
        print(f"  Saved to items.json")
        buyable = [i for i in items if i["buyable"]]
        print(f"  Buyable items: {len(buyable)}")
        print(f"  First item: {items[0]['name']} = {items[0]['price']} GP")
    
    if args.exits or args.all:
        print("Extracting exit data...")
        exits = extract_exits(data)
        
        with open(output_dir / "exits.json", "w") as f:
            json.dump(exits, f, indent=2)
        
        print(f"  Saved {len(exits)} exits to exits.json")
    
    print("\nExtraction complete!")
    return 0


if __name__ == "__main__":
    exit(main())
