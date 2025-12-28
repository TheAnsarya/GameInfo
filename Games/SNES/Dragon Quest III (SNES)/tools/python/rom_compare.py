#!/usr/bin/env python3
"""
ROM Comparison Tool for Dragon Quest III
Compares assembled ROM with original to verify accuracy
"""

import sys
import hashlib

def compare_roms(original_path, assembled_path):
    """Compare two ROM files and report differences."""
    try:
        with open(original_path, 'rb') as f:
            original_data = f.read()
    except FileNotFoundError:
        print(f"Error: Original ROM '{original_path}' not found")
        return False

    try:
        with open(assembled_path, 'rb') as f:
            assembled_data = f.read()
    except FileNotFoundError:
        print(f"Error: Assembled ROM '{assembled_path}' not found")
        return False

    print(f"Original ROM:  {len(original_data):,} bytes")
    print(f"Assembled ROM: {len(assembled_data):,} bytes")

    # Calculate checksums
    orig_sha256 = hashlib.sha256(original_data).hexdigest()
    asm_sha256 = hashlib.sha256(assembled_data).hexdigest()

    print(f"Original SHA256:  {orig_sha256}")
    print(f"Assembled SHA256: {asm_sha256}")

    if original_data == assembled_data:
        print("✓ ROMs are identical!")
        return True

    print("✗ ROMs differ")

    # Find first difference
    min_len = min(len(original_data), len(assembled_data))
    first_diff = None

    for i in range(min_len):
        if original_data[i] != assembled_data[i]:
            first_diff = i
            break

    if first_diff is not None:
        print(f"First difference at offset 0x{first_diff:06X}")
        print(f"  Original: 0x{original_data[first_diff]:02X}")
        print(f"  Assembled: 0x{assembled_data[first_diff]:02X}")

        # Show context around difference
        start = max(0, first_diff - 16)
        end = min(min_len, first_diff + 16)

        print(f"\nContext around 0x{first_diff:06X}:")
        print("Offset     Original   Assembled")
        for i in range(start, end):
            marker = ">" if i == first_diff else " "
            if i < len(assembled_data):
                print(f"{marker}0x{i:06X}: 0x{original_data[i]:02X}      0x{assembled_data[i]:02X}")
            else:
                print(f"{marker}0x{i:06X}: 0x{original_data[i]:02X}      --")

    if len(original_data) != len(assembled_data):
        print(f"Size difference: {len(assembled_data) - len(original_data):+d} bytes")

    return False

def main():
    if len(sys.argv) != 3:
        print("Usage: python rom_compare.py <original_rom> <assembled_rom>")
        sys.exit(1)

    original_rom = sys.argv[1]
    assembled_rom = sys.argv[2]

    success = compare_roms(original_rom, assembled_rom)
    sys.exit(0 if success else 1)

if __name__ == '__main__':
    main()
