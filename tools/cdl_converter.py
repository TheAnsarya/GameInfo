#!/usr/bin/env python3
"""
CDL Format Converter

Converts CDL files between different emulator formats:
- FCEUX CDL format
- Mesen CDL format
- Bizhawk CDL format

Also supports:
- Batch conversion
- Format detection
- Validation

Usage:
    python cdl_converter.py <input> <output> [--from FORMAT] [--to FORMAT]
    python cdl_converter.py --detect <file>
    python cdl_converter.py --batch <input_dir> <output_dir> --to FORMAT
"""

import argparse
import os
import struct
import sys
from dataclasses import dataclass
from enum import Enum
from pathlib import Path
from typing import BinaryIO, Dict, List, Optional, Tuple


class CDLFormat(Enum):
    """Supported CDL formats"""
    FCEUX = "fceux"
    MESEN = "mesen"
    MESEN2 = "mesen2"
    BIZHAWK = "bizhawk"
    RAW = "raw"
    UNKNOWN = "unknown"


@dataclass
class CDLHeader:
    """CDL file header information"""
    format: CDLFormat
    version: int = 0
    prg_size: int = 0
    chr_size: int = 0
    header_size: int = 0
    extra_data: bytes = b''


class FCEUXFlags:
    """FCEUX CDL byte flags"""
    CODE = 0x01           # Executed as code (opcode or operand)
    DATA = 0x02           # Read as data
    RENDERED = 0x04       # Used as graphics/CHR data
    INDIRECT_DATA = 0x08  # Read through $2007 (PPU)
    PCM_AUDIO = 0x10      # PCM audio data
    INDIRECT_CODE = 0x20  # Jumped to via indirect addressing
    INDIRECT_ACCESS = 0x40 # Accessed via indirect addressing
    ROM_BANK = 0x80       # ROM bank marker


class MesenFlags:
    """Mesen CDL byte flags"""
    CODE = 0x01           # Executed as code
    DATA = 0x02           # Read as data
    JUMP_TARGET = 0x04    # Jump/branch target
    SUB_ENTRY = 0x08      # Subroutine entry point
    # Upper nibble contains bank info in some versions


class BizhawkFlags:
    """Bizhawk CDL byte flags (NES core)"""
    EXEC_FIRST = 0x01     # First byte of instruction
    EXEC_OPERAND = 0x02   # Operand byte of instruction
    DATA = 0x04           # Data access
    # Additional bits vary by core


class CDLConverter:
    """Converts between CDL formats"""
    
    # Magic bytes for format detection
    MESEN_MAGIC = b'MCD\x00'  # Mesen CDL
    MESEN2_MAGIC = b'CDL\x1a'  # Mesen 2 CDL
    
    def __init__(self):
        self.verbose = True
    
    def log(self, message: str) -> None:
        """Log a message"""
        if self.verbose:
            print(f"[CDL Converter] {message}")
    
    def detect_format(self, filepath: str) -> Tuple[CDLFormat, CDLHeader]:
        """Detect the format of a CDL file"""
        
        with open(filepath, 'rb') as f:
            # Read first bytes to check for magic
            magic = f.read(4)
            f.seek(0)
            
            # Check for Mesen format
            if magic == self.MESEN_MAGIC:
                return CDLFormat.MESEN, self._parse_mesen_header(f)
            
            # Check for Mesen 2 format
            if magic == self.MESEN2_MAGIC:
                return CDLFormat.MESEN2, self._parse_mesen2_header(f)
            
            # Check for Bizhawk format (has specific header)
            if magic[:3] == b'CDL':
                return CDLFormat.BIZHAWK, self._parse_bizhawk_header(f)
            
            # Check file size - FCEUX CDL matches PRG size exactly
            f.seek(0, 2)  # Seek to end
            size = f.tell()
            
            # Common NES PRG ROM sizes
            common_sizes = [
                0x4000,   # 16KB (1 bank)
                0x8000,   # 32KB (2 banks)
                0x10000,  # 64KB (4 banks)
                0x20000,  # 128KB (8 banks)
                0x40000,  # 256KB (16 banks)
                0x80000,  # 512KB (32 banks)
            ]
            
            if size in common_sizes:
                return CDLFormat.FCEUX, CDLHeader(
                    format=CDLFormat.FCEUX,
                    prg_size=size,
                    header_size=0
                )
            
            # Default to raw
            return CDLFormat.RAW, CDLHeader(
                format=CDLFormat.RAW,
                prg_size=size,
                header_size=0
            )
    
    def _parse_mesen_header(self, f: BinaryIO) -> CDLHeader:
        """Parse Mesen CDL header"""
        magic = f.read(4)
        # Mesen header format varies by version
        # This is a simplified version
        f.seek(0, 2)
        total_size = f.tell()
        f.seek(4)
        
        return CDLHeader(
            format=CDLFormat.MESEN,
            header_size=4,
            prg_size=total_size - 4
        )
    
    def _parse_mesen2_header(self, f: BinaryIO) -> CDLHeader:
        """Parse Mesen 2 CDL header"""
        magic = f.read(4)
        # Read header length
        header_len = struct.unpack('<I', f.read(4))[0]
        
        f.seek(0, 2)
        total_size = f.tell()
        
        return CDLHeader(
            format=CDLFormat.MESEN2,
            header_size=header_len,
            prg_size=total_size - header_len
        )
    
    def _parse_bizhawk_header(self, f: BinaryIO) -> CDLHeader:
        """Parse Bizhawk CDL header"""
        # Bizhawk has a text-based header
        f.seek(0)
        header_data = b''
        
        while True:
            line = f.readline()
            header_data += line
            if line.startswith(b'['):
                break
            if len(header_data) > 1024:  # Safety limit
                break
        
        f.seek(0, 2)
        total_size = f.tell()
        
        return CDLHeader(
            format=CDLFormat.BIZHAWK,
            header_size=len(header_data),
            prg_size=total_size - len(header_data),
            extra_data=header_data
        )
    
    def load_cdl(self, filepath: str, source_format: Optional[CDLFormat] = None) -> Tuple[bytearray, CDLHeader]:
        """Load a CDL file, returning normalized data"""
        
        if source_format is None:
            source_format, header = self.detect_format(filepath)
        else:
            _, header = self.detect_format(filepath)
            header.format = source_format
        
        self.log(f"Loading {source_format.value} format CDL")
        
        with open(filepath, 'rb') as f:
            # Skip header
            f.seek(header.header_size)
            data = bytearray(f.read())
        
        return data, header
    
    def convert_byte_fceux_to_mesen(self, byte: int) -> int:
        """Convert a single byte from FCEUX to Mesen format"""
        result = 0
        
        if byte & FCEUXFlags.CODE:
            result |= MesenFlags.CODE
        if byte & FCEUXFlags.DATA:
            result |= MesenFlags.DATA
        if byte & FCEUXFlags.INDIRECT_CODE:
            result |= MesenFlags.JUMP_TARGET
        
        return result
    
    def convert_byte_mesen_to_fceux(self, byte: int) -> int:
        """Convert a single byte from Mesen to FCEUX format"""
        result = 0
        
        if byte & MesenFlags.CODE:
            result |= FCEUXFlags.CODE
        if byte & MesenFlags.DATA:
            result |= FCEUXFlags.DATA
        if byte & MesenFlags.JUMP_TARGET:
            result |= FCEUXFlags.INDIRECT_CODE
        if byte & MesenFlags.SUB_ENTRY:
            result |= FCEUXFlags.CODE
        
        return result
    
    def convert_byte_bizhawk_to_fceux(self, byte: int) -> int:
        """Convert a single byte from Bizhawk to FCEUX format"""
        result = 0
        
        if byte & BizhawkFlags.EXEC_FIRST:
            result |= FCEUXFlags.CODE
        if byte & BizhawkFlags.EXEC_OPERAND:
            result |= FCEUXFlags.CODE
        if byte & BizhawkFlags.DATA:
            result |= FCEUXFlags.DATA
        
        return result
    
    def convert_byte_fceux_to_bizhawk(self, byte: int) -> int:
        """Convert a single byte from FCEUX to Bizhawk format"""
        result = 0
        
        if byte & FCEUXFlags.CODE:
            result |= BizhawkFlags.EXEC_FIRST
        if byte & FCEUXFlags.DATA:
            result |= BizhawkFlags.DATA
        
        return result
    
    def convert(self, input_path: str, output_path: str,
                source_format: Optional[CDLFormat] = None,
                target_format: CDLFormat = CDLFormat.FCEUX) -> bool:
        """Convert a CDL file from one format to another"""
        
        try:
            # Load source data
            data, header = self.load_cdl(input_path, source_format)
            source = header.format
            
            self.log(f"Converting {source.value} -> {target_format.value}")
            self.log(f"Data size: {len(data)} bytes")
            
            # Convert each byte
            converted = bytearray(len(data))
            
            for i, byte in enumerate(data):
                if source == target_format:
                    converted[i] = byte
                elif source == CDLFormat.FCEUX and target_format == CDLFormat.MESEN:
                    converted[i] = self.convert_byte_fceux_to_mesen(byte)
                elif source == CDLFormat.MESEN and target_format == CDLFormat.FCEUX:
                    converted[i] = self.convert_byte_mesen_to_fceux(byte)
                elif source == CDLFormat.BIZHAWK and target_format == CDLFormat.FCEUX:
                    converted[i] = self.convert_byte_bizhawk_to_fceux(byte)
                elif source == CDLFormat.FCEUX and target_format == CDLFormat.BIZHAWK:
                    converted[i] = self.convert_byte_fceux_to_bizhawk(byte)
                elif source in (CDLFormat.RAW, CDLFormat.UNKNOWN):
                    converted[i] = byte  # Pass through
                else:
                    # Use FCEUX as intermediate format
                    if source == CDLFormat.MESEN:
                        intermediate = self.convert_byte_mesen_to_fceux(byte)
                    elif source == CDLFormat.BIZHAWK:
                        intermediate = self.convert_byte_bizhawk_to_fceux(byte)
                    else:
                        intermediate = byte
                    
                    if target_format == CDLFormat.MESEN:
                        converted[i] = self.convert_byte_fceux_to_mesen(intermediate)
                    elif target_format == CDLFormat.BIZHAWK:
                        converted[i] = self.convert_byte_fceux_to_bizhawk(intermediate)
                    else:
                        converted[i] = intermediate
            
            # Write output with appropriate header
            os.makedirs(os.path.dirname(output_path) or '.', exist_ok=True)
            
            with open(output_path, 'wb') as f:
                if target_format == CDLFormat.MESEN:
                    f.write(self.MESEN_MAGIC)
                elif target_format == CDLFormat.MESEN2:
                    f.write(self.MESEN2_MAGIC)
                    f.write(struct.pack('<I', 8))  # Header size
                # FCEUX and RAW have no header
                
                f.write(converted)
            
            self.log(f"Saved: {output_path}")
            return True
            
        except Exception as e:
            self.log(f"Error: {e}")
            return False
    
    def batch_convert(self, input_dir: str, output_dir: str,
                      target_format: CDLFormat = CDLFormat.FCEUX,
                      extension: str = '.cdl') -> Tuple[int, int]:
        """Convert all CDL files in a directory"""
        
        success = 0
        failed = 0
        
        input_path = Path(input_dir)
        output_path = Path(output_dir)
        
        for cdl_file in input_path.glob(f'**/*{extension}'):
            relative = cdl_file.relative_to(input_path)
            output_file = output_path / relative
            
            self.log(f"Converting: {relative}")
            
            if self.convert(str(cdl_file), str(output_file), target_format=target_format):
                success += 1
            else:
                failed += 1
        
        return success, failed
    
    def validate_conversion(self, original: str, converted: str) -> Dict:
        """Validate a conversion by comparing coverage"""
        
        orig_data, _ = self.load_cdl(original)
        conv_data, _ = self.load_cdl(converted)
        
        if len(orig_data) != len(conv_data):
            return {
                'valid': False,
                'error': f'Size mismatch: {len(orig_data)} vs {len(conv_data)}'
            }
        
        # Count logged bytes in each
        orig_logged = sum(1 for b in orig_data if b != 0)
        conv_logged = sum(1 for b in conv_data if b != 0)
        
        # Check that all originally logged bytes are still logged
        lost = 0
        gained = 0
        
        for i in range(len(orig_data)):
            if orig_data[i] != 0 and conv_data[i] == 0:
                lost += 1
            if orig_data[i] == 0 and conv_data[i] != 0:
                gained += 1
        
        return {
            'valid': True,
            'original_logged': orig_logged,
            'converted_logged': conv_logged,
            'lost_bytes': lost,
            'gained_bytes': gained,
            'coverage_preserved': lost == 0
        }


def print_format_info(filepath: str):
    """Print format information about a CDL file"""
    converter = CDLConverter()
    converter.verbose = False
    
    fmt, header = converter.detect_format(filepath)
    
    print(f"\nFile: {filepath}")
    print(f"Format: {fmt.value}")
    print(f"Header Size: {header.header_size} bytes")
    print(f"Data Size: {header.prg_size} bytes ({header.prg_size // 1024} KB)")
    
    # Load and analyze
    data, _ = converter.load_cdl(filepath)
    
    code = data_bytes = rendered = unused = 0
    for byte in data:
        if byte == 0:
            unused += 1
        elif byte & 0x01:
            code += 1
        elif byte & 0x02:
            data_bytes += 1
        elif byte & 0x04:
            rendered += 1
    
    total = len(data)
    coverage = (total - unused) / total * 100 if total > 0 else 0
    
    print(f"\nStatistics:")
    print(f"  Code:     {code:>8,} bytes ({code/total*100:.1f}%)")
    print(f"  Data:     {data_bytes:>8,} bytes ({data_bytes/total*100:.1f}%)")
    print(f"  Rendered: {rendered:>8,} bytes ({rendered/total*100:.1f}%)")
    print(f"  Unused:   {unused:>8,} bytes ({unused/total*100:.1f}%)")
    print(f"  Coverage: {coverage:.1f}%")


def main():
    parser = argparse.ArgumentParser(description='CDL Format Converter')
    subparsers = parser.add_subparsers(dest='command', help='Command')
    
    # Convert command
    convert_parser = subparsers.add_parser('convert', help='Convert CDL file')
    convert_parser.add_argument('input', help='Input CDL file')
    convert_parser.add_argument('output', help='Output CDL file')
    convert_parser.add_argument('--from', dest='source_format', 
                                choices=['fceux', 'mesen', 'mesen2', 'bizhawk', 'raw'],
                                help='Source format (auto-detected if not specified)')
    convert_parser.add_argument('--to', dest='target_format', default='fceux',
                                choices=['fceux', 'mesen', 'mesen2', 'bizhawk', 'raw'],
                                help='Target format')
    
    # Detect command
    detect_parser = subparsers.add_parser('detect', help='Detect CDL format')
    detect_parser.add_argument('file', help='CDL file to analyze')
    
    # Batch command
    batch_parser = subparsers.add_parser('batch', help='Batch convert directory')
    batch_parser.add_argument('input_dir', help='Input directory')
    batch_parser.add_argument('output_dir', help='Output directory')
    batch_parser.add_argument('--to', dest='target_format', default='fceux',
                              choices=['fceux', 'mesen', 'mesen2', 'bizhawk'],
                              help='Target format')
    
    # Validate command
    validate_parser = subparsers.add_parser('validate', help='Validate conversion')
    validate_parser.add_argument('original', help='Original CDL file')
    validate_parser.add_argument('converted', help='Converted CDL file')
    
    args = parser.parse_args()
    
    converter = CDLConverter()
    
    if args.command == 'convert':
        source_fmt = CDLFormat(args.source_format) if args.source_format else None
        target_fmt = CDLFormat(args.target_format)
        
        if converter.convert(args.input, args.output, source_fmt, target_fmt):
            print(f"Successfully converted to {args.output}")
        else:
            print("Conversion failed")
            sys.exit(1)
    
    elif args.command == 'detect':
        print_format_info(args.file)
    
    elif args.command == 'batch':
        target_fmt = CDLFormat(args.target_format)
        success, failed = converter.batch_convert(args.input_dir, args.output_dir, target_fmt)
        print(f"\nBatch conversion complete:")
        print(f"  Successful: {success}")
        print(f"  Failed: {failed}")
    
    elif args.command == 'validate':
        result = converter.validate_conversion(args.original, args.converted)
        if result['valid']:
            print(f"Original logged bytes: {result['original_logged']:,}")
            print(f"Converted logged bytes: {result['converted_logged']:,}")
            print(f"Lost bytes: {result['lost_bytes']:,}")
            print(f"Gained bytes: {result['gained_bytes']:,}")
            print(f"Coverage preserved: {'Yes' if result['coverage_preserved'] else 'No'}")
        else:
            print(f"Validation failed: {result['error']}")
            sys.exit(1)
    
    else:
        parser.print_help()


if __name__ == '__main__':
    main()
