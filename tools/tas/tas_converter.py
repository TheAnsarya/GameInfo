#!/usr/bin/env python3
"""
Universal TAS Format Converter

Converts between all supported TAS (Tool-Assisted Speedrun) replay file formats
across multiple platforms and emulators.

Supported Formats:
  SNES:
    - SMV (Snes9x) - Read/Write
    - BK2 (BizHawk) - Read/Write
    - BKM (BizHawk legacy) - Read/Write
    - LSMV (lsnes) - Read-only
    - MMO (Mesen2) - Write-only

  NES:
    - FM2 (FCEUX) - Read/Write
    - FCM (FCEU) - Read-only
    - FMV (Famtasia) - Read-only

  Genesis/Mega Drive:
    - GMV (Gens) - Read/Write

  Game Boy/GBA:
    - VBM (Visual Boy Advance) - Read/Write

  Master System/Game Gear:
    - MMV (Dega) - Read/Write

  PlayStation:
    - PXM (PCSX) - Read-only
    - PJM (PSXjin) - Read-only

  Saturn:
    - YMV (Yabause) - Read-only

  PC Engine:
    - MC2 (PCEjin/Mednafen) - Read-only

  Nintendo DS:
    - DSM (DeSmuME) - Read-only

  DOS/PC:
    - LMP (Doom) - Read-only
    - LMP (Heretic) - Read-only
    - LMP (Hexen) - Read-only

Author: GameInfo Project
License: MIT
"""

import argparse
import sys
from pathlib import Path
from typing import Optional, Tuple

# Import existing SNES converter functionality
from convert_tas_to_mmo import (
	MovieInfo as SnesMovieInfo,
	parse_smv, parse_bkm, parse_bk2, parse_lsmv,
	create_mmo_file, create_bk2_file, create_bkm_file, create_smv_file,
	detect_format as detect_snes_format,
	extract_game_name, sanitize_filename,
)

# Import format-specific modules
from tas_formats import TASSystem, TAS_FORMATS

try:
	from nes_formats import (
		parse_fm2, parse_fcm, parse_fmv,
		create_fm2_file, detect_nes_format,
	)
	NES_AVAILABLE = True
except ImportError:
	NES_AVAILABLE = False

try:
	from genesis_formats import (
		parse_gmv, create_gmv_file,
	)
	GENESIS_AVAILABLE = True
except ImportError:
	GENESIS_AVAILABLE = False

try:
	from gb_formats import (
		parse_vbm, create_vbm_file, detect_gb_format,
	)
	GB_AVAILABLE = True
except ImportError:
	GB_AVAILABLE = False

try:
	from sms_formats import (
		parse_mmv, create_mmv_file, detect_sms_format,
	)
	SMS_AVAILABLE = True
except ImportError:
	SMS_AVAILABLE = False

try:
	from psx_formats import (
		parse_pxm, parse_pjm, detect_psx_format,
	)
	PSX_AVAILABLE = True
except ImportError:
	PSX_AVAILABLE = False

try:
	from misc_formats import (
		parse_ymv, parse_mc2, parse_dsm, detect_misc_format,
	)
	MISC_AVAILABLE = True
except ImportError:
	MISC_AVAILABLE = False

try:
	from doom_formats import (
		parse_lmp, parse_heretic_lmp, parse_hexen_lmp, detect_doom_format,
	)
	DOOM_AVAILABLE = True
except ImportError:
	DOOM_AVAILABLE = False


# Format capabilities registry
FORMAT_CAPABILITIES = {
	# SNES formats
	'smv': {'read': True, 'write': True, 'system': TASSystem.SNES},
	'bk2': {'read': True, 'write': True, 'system': 'multi'},
	'bkm': {'read': True, 'write': True, 'system': TASSystem.SNES},
	'lsmv': {'read': True, 'write': False, 'system': TASSystem.SNES},
	'mmo': {'read': False, 'write': True, 'system': TASSystem.SNES},

	# NES formats
	'fm2': {'read': NES_AVAILABLE, 'write': NES_AVAILABLE, 'system': TASSystem.NES},
	'fcm': {'read': NES_AVAILABLE, 'write': False, 'system': TASSystem.NES},
	'fmv': {'read': NES_AVAILABLE, 'write': False, 'system': TASSystem.NES},

	# Genesis formats
	'gmv': {'read': GENESIS_AVAILABLE, 'write': GENESIS_AVAILABLE, 'system': TASSystem.GENESIS},

	# Game Boy formats
	'vbm': {'read': GB_AVAILABLE, 'write': GB_AVAILABLE, 'system': TASSystem.GB},

	# SMS/GG formats
	'mmv': {'read': SMS_AVAILABLE, 'write': SMS_AVAILABLE, 'system': TASSystem.SMS},

	# PlayStation formats
	'pxm': {'read': PSX_AVAILABLE, 'write': False, 'system': TASSystem.PSX},
	'pjm': {'read': PSX_AVAILABLE, 'write': False, 'system': TASSystem.PSX},

	# Saturn formats
	'ymv': {'read': MISC_AVAILABLE, 'write': False, 'system': TASSystem.SATURN},

	# PC Engine formats
	'mc2': {'read': MISC_AVAILABLE, 'write': False, 'system': TASSystem.PCE},

	# NDS formats
	'dsm': {'read': MISC_AVAILABLE, 'write': False, 'system': TASSystem.NDS},

	# Doom formats
	'lmp': {'read': DOOM_AVAILABLE, 'write': False, 'system': TASSystem.DOS},
}


def detect_format_universal(filepath: Path) -> Tuple[str, str]:
	"""
	Detect the TAS format and system from a file.

	Returns:
		Tuple of (format_name, system_name)
	"""
	ext = filepath.suffix.lower().lstrip('.')

	# First check by extension for common formats
	if ext in ['smv', 'bkm', 'bk2', 'lsmv', 'mmo']:
		return ext, TASSystem.SNES

	if ext == 'fm2':
		return 'fm2', TASSystem.NES
	if ext == 'fcm':
		return 'fcm', TASSystem.NES
	if ext == 'fmv':
		return 'fmv', TASSystem.NES

	if ext == 'gmv':
		return 'gmv', TASSystem.GENESIS

	if ext == 'vbm':
		return 'vbm', TASSystem.GB

	if ext == 'mmv':
		return 'mmv', TASSystem.SMS

	if ext == 'pxm':
		return 'pxm', TASSystem.PSX
	if ext == 'pjm':
		return 'pjm', TASSystem.PSX

	if ext == 'ymv':
		return 'ymv', TASSystem.SATURN

	if ext == 'mc2':
		return 'mc2', TASSystem.PCE

	if ext == 'dsm':
		return 'dsm', TASSystem.NDS

	if ext == 'lmp':
		# Try to determine Doom variant
		if DOOM_AVAILABLE:
			doom_format = detect_doom_format(filepath)
			if doom_format:
				return doom_format.lower(), TASSystem.DOS
		return 'lmp', TASSystem.DOS

	# Unknown format - try detection methods
	return 'unknown', 'unknown'


def parse_file(filepath: Path) -> Optional[object]:
	"""
	Parse any supported TAS file and return its movie info.

	Returns:
		MovieInfo object for the appropriate system, or None if unsupported.
	"""
	fmt, system = detect_format_universal(filepath)

	if fmt == 'unknown':
		print(f"Warning: Unknown format for {filepath.name}")
		return None

	try:
		# SNES formats
		if fmt == 'smv':
			return parse_smv(filepath)
		elif fmt == 'bkm':
			return parse_bkm(filepath)
		elif fmt == 'bk2':
			return parse_bk2(filepath)
		elif fmt == 'lsmv':
			return parse_lsmv(filepath)

		# NES formats
		elif fmt == 'fm2' and NES_AVAILABLE:
			return parse_fm2(filepath)
		elif fmt == 'fcm' and NES_AVAILABLE:
			return parse_fcm(filepath)
		elif fmt == 'fmv' and NES_AVAILABLE:
			return parse_fmv(filepath)

		# Genesis formats
		elif fmt == 'gmv' and GENESIS_AVAILABLE:
			return parse_gmv(filepath)

		# Game Boy formats
		elif fmt == 'vbm' and GB_AVAILABLE:
			return parse_vbm(filepath)

		# SMS formats
		elif fmt == 'mmv' and SMS_AVAILABLE:
			return parse_mmv(filepath)

		# PlayStation formats
		elif fmt == 'pxm' and PSX_AVAILABLE:
			return parse_pxm(filepath)
		elif fmt == 'pjm' and PSX_AVAILABLE:
			return parse_pjm(filepath)

		# Misc formats
		elif fmt == 'ymv' and MISC_AVAILABLE:
			return parse_ymv(filepath)
		elif fmt == 'mc2' and MISC_AVAILABLE:
			return parse_mc2(filepath)
		elif fmt == 'dsm' and MISC_AVAILABLE:
			return parse_dsm(filepath)

		# Doom formats
		elif fmt == 'doom_lmp' and DOOM_AVAILABLE:
			return parse_lmp(filepath, 'doom')
		elif fmt == 'heretic_lmp' and DOOM_AVAILABLE:
			return parse_heretic_lmp(filepath)
		elif fmt == 'hexen_lmp' and DOOM_AVAILABLE:
			return parse_hexen_lmp(filepath)
		elif fmt == 'lmp' and DOOM_AVAILABLE:
			return parse_lmp(filepath)

		else:
			print(f"Format '{fmt}' not available or supported")
			return None

	except Exception as e:
		print(f"Error parsing {filepath.name}: {e}")
		return None


def get_compatible_output_formats(input_format: str, input_system: str) -> list:
	"""
	Get list of formats that are compatible for conversion from the input format.

	Cross-system conversion is generally not possible (different button sets),
	but same-system formats can be converted.
	"""
	compatible = []

	input_caps = FORMAT_CAPABILITIES.get(input_format, {})
	input_sys = input_caps.get('system', input_system)

	for fmt, caps in FORMAT_CAPABILITIES.items():
		if not caps.get('write'):
			continue

		fmt_sys = caps.get('system')

		# Multi-system formats (like BK2) can accept any system
		if fmt_sys == 'multi':
			compatible.append(fmt)
			continue

		# Same system formats are compatible
		if fmt_sys == input_sys:
			compatible.append(fmt)

	return compatible


def print_format_info():
	"""Print information about all supported formats."""
	print("\n=== Supported TAS Formats ===\n")

	systems = {}
	for fmt, caps in FORMAT_CAPABILITIES.items():
		sys = caps.get('system', 'unknown')
		if sys not in systems:
			systems[sys] = []
		systems[sys].append((fmt, caps))

	for system in sorted(systems.keys()):
		if system == 'multi':
			print(f"Multi-System:")
		else:
			print(f"{system}:")

		for fmt, caps in sorted(systems[system]):
			read = '✓' if caps.get('read') else '✗'
			write = '✓' if caps.get('write') else '✗'
			fmt_info = TAS_FORMATS.get(fmt.upper(), {})
			desc = fmt_info.description if hasattr(fmt_info, 'description') else ''
			print(f"  {fmt.upper():6s} - Read: {read}  Write: {write}  {desc}")

		print()


def convert_file_universal(
	input_path: Path,
	output_dir: Path,
	output_format: str,
	rom_path: Optional[Path] = None,
	organize_by_game: bool = True
) -> bool:
	"""
	Convert a TAS file to the specified output format.

	Args:
		input_path: Path to input TAS file
		output_dir: Output directory
		output_format: Target format (e.g., 'bk2', 'smv', 'fm2')
		rom_path: Optional ROM file for metadata
		organize_by_game: If True, organize by game name subdirectories

	Returns:
		True if successful, False otherwise
	"""
	try:
		# Detect input format
		input_fmt, input_sys = detect_format_universal(input_path)
		print(f"\nConverting: {input_path.name}")
		print(f"  Input: {input_fmt.upper()} ({input_sys})")
		print(f"  Output: {output_format.upper()}")

		# Check if conversion is supported
		out_caps = FORMAT_CAPABILITIES.get(output_format.lower(), {})
		if not out_caps.get('write'):
			print(f"  Error: Output format '{output_format}' not writable")
			return False

		# Check system compatibility
		out_sys = out_caps.get('system')
		if out_sys != 'multi' and out_sys != input_sys:
			print(f"  Error: Cannot convert {input_sys} to {out_sys} format")
			print(f"  (Cross-system conversion not supported)")
			return False

		# Parse input file
		movie = parse_file(input_path)
		if movie is None:
			print(f"  Error: Could not parse input file")
			return False

		# Determine output path
		if organize_by_game:
			game_name = extract_game_name(input_path, movie)
			out_dir = output_dir / game_name
		else:
			out_dir = output_dir
		out_dir.mkdir(parents=True, exist_ok=True)

		output_name = input_path.stem + f".{output_format.lower()}"
		output_path = out_dir / output_name

		# Create output file
		output_format_lower = output_format.lower()

		# SNES output formats
		if output_format_lower == 'mmo':
			create_mmo_file(movie, output_path, rom_path)
		elif output_format_lower == 'bk2':
			create_bk2_file(movie, output_path, rom_path)
		elif output_format_lower == 'bkm':
			create_bkm_file(movie, output_path, rom_path)
		elif output_format_lower == 'smv':
			create_smv_file(movie, output_path)

		# NES output formats
		elif output_format_lower == 'fm2' and NES_AVAILABLE:
			create_fm2_file(movie, output_path)

		# Genesis output formats
		elif output_format_lower == 'gmv' and GENESIS_AVAILABLE:
			create_gmv_file(movie, output_path)

		# Game Boy output formats
		elif output_format_lower == 'vbm' and GB_AVAILABLE:
			create_vbm_file(movie, output_path)

		# SMS output formats
		elif output_format_lower == 'mmv' and SMS_AVAILABLE:
			create_mmv_file(movie, output_path)

		else:
			print(f"  Error: Output format '{output_format}' not implemented")
			return False

		print(f"  Success: {output_path}")
		return True

	except Exception as e:
		print(f"  Error: {e}")
		import traceback
		traceback.print_exc()
		return False


def main():
	parser = argparse.ArgumentParser(
		description="Universal TAS Format Converter - Convert between all TAS replay formats",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
  # Convert SMV to BK2
  %(prog)s --input movie.smv --output ./converted/ --format bk2

  # Convert FM2 to FM2 (re-encode)
  %(prog)s --input movie.fm2 --output ./converted/ --format fm2

  # List all supported formats
  %(prog)s --list-formats

  # Batch convert all TAS files in a directory
  %(prog)s --input-dir ./tas-files/ --output ./converted/ --format bk2 --recursive
		"""
	)

	parser.add_argument('-i', '--input', type=Path,
						help='Input TAS file to convert')
	parser.add_argument('-d', '--input-dir', type=Path,
						help='Input directory containing TAS files')
	parser.add_argument('-o', '--output', type=Path,
						help='Output directory for converted files')
	parser.add_argument('-f', '--format', type=str,
						help='Output format (e.g., bk2, smv, fm2, mmo)')
	parser.add_argument('-r', '--recursive', action='store_true',
						help='Recursively process subdirectories')
	parser.add_argument('--rom', type=Path,
						help='Optional ROM file for SHA1 calculation')
	parser.add_argument('--no-organize', action='store_true',
						help='Do not organize output into game-name subdirectories')
	parser.add_argument('--list-formats', action='store_true',
						help='List all supported formats and exit')
	parser.add_argument('--info', type=Path,
						help='Show information about a TAS file')
	parser.add_argument('-v', '--verbose', action='store_true',
						help='Verbose output')

	args = parser.parse_args()

	# List formats
	if args.list_formats:
		print_format_info()
		return 0

	# Show file info
	if args.info:
		movie = parse_file(args.info)
		if movie:
			print(f"\n=== TAS File Info ===")
			print(f"File: {args.info.name}")
			print(f"Frames: {movie.frame_count}")
			print(f"Rerecords: {movie.rerecord_count}")
			print(f"Controllers: {movie.controllers}")
			if hasattr(movie, 'rom_name') and movie.rom_name:
				print(f"ROM: {movie.rom_name}")
			if hasattr(movie, 'author') and movie.author:
				print(f"Author: {movie.author}")
			if hasattr(movie, 'system') and movie.system:
				print(f"System: {movie.system}")
		return 0

	# Conversion mode
	if not args.output or not args.format:
		parser.error("--output and --format are required for conversion")

	if not args.input and not args.input_dir:
		parser.error("Either --input or --input-dir must be specified")

	args.output.mkdir(parents=True, exist_ok=True)
	organize = not args.no_organize

	if args.input:
		# Single file
		success = convert_file_universal(
			args.input, args.output, args.format, args.rom, organize
		)
		return 0 if success else 1
	else:
		# Directory batch conversion
		patterns = ['*.smv', '*.bkm', '*.bk2', '*.lsmv', '*.fm2', '*.fcm', '*.fmv',
					'*.gmv', '*.vbm', '*.mmv', '*.pxm', '*.pjm', '*.ymv', '*.mc2',
					'*.dsm', '*.lmp']

		files = []
		for pattern in patterns:
			if args.recursive:
				files.extend(args.input_dir.rglob(pattern))
			else:
				files.extend(args.input_dir.glob(pattern))

		print(f"Found {len(files)} TAS files")

		success = 0
		failed = 0
		for filepath in sorted(files):
			if convert_file_universal(filepath, args.output, args.format, args.rom, organize):
				success += 1
			else:
				failed += 1

		print(f"\n=== Conversion Complete ===")
		print(f"Success: {success}")
		print(f"Failed: {failed}")
		return 0 if failed == 0 else 1


if __name__ == '__main__':
	sys.exit(main())
