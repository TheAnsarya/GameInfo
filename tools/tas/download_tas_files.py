#!/usr/bin/env python3
"""
TAS Test Files Downloader

Downloads TAS replay files from TASVideos.org based on the tas-info.json manifest.
These files are used for integration testing of the TAS Converter library.

Usage:
    python download_tas_files.py [--dry-run] [--force] [--format FMT] [--game GAME] [--system SYS]

Examples:
    python download_tas_files.py                    # Download all missing files
    python download_tas_files.py --dry-run          # Show what would be downloaded
    python download_tas_files.py --force            # Re-download all files
    python download_tas_files.py --format smv       # Download only SMV files
    python download_tas_files.py --game "Chrono"    # Download files for games matching "Chrono"
    python download_tas_files.py --system SNES      # Download only SNES files
    python download_tas_files.py --system NES --limit 50  # Download first 50 NES files

Files are organized into platform subfolders:
    ~tas-files/
        compressed/<platform>/<file>.zip
        uncompressed/<platform>/<file>.<ext>
"""

import argparse
import json
import os
import re
import sys
import time
import zipfile
from pathlib import Path
from urllib.request import urlopen, Request
from urllib.error import URLError, HTTPError


# Mapping of system names to folder names (normalize variations)
SYSTEM_FOLDER_MAP = {
	"snes": "SNES",
	"super nintendo entertainment system": "SNES",
	"super nintendo": "SNES",
	"nes": "NES",
	"nintendo entertainment system": "NES",
	"famicom": "NES",
	"famicom disk system": "FDS",
	"fds": "FDS",
	"genesis": "Genesis",
	"sega genesis": "Genesis",
	"mega drive": "Genesis",
	"sega mega drive": "Genesis",
	"n64": "N64",
	"nintendo 64": "N64",
	"gba": "GBA",
	"game boy advance": "GBA",
	"gb": "GB",
	"game boy": "GB",
	"gbc": "GBC",
	"game boy color": "GBC",
	"nds": "NDS",
	"nintendo ds": "NDS",
	"ds": "NDS",
	"3ds": "3DS",
	"nintendo 3ds": "3DS",
	"psx": "PSX",
	"playstation": "PSX",
	"sony playstation": "PSX",
	"ps1": "PSX",
	"ps2": "PS2",
	"playstation 2": "PS2",
	"gamecube": "GameCube",
	"nintendo gamecube": "GameCube",
	"gc": "GameCube",
	"ngc": "GameCube",
	"wii": "Wii",
	"saturn": "Saturn",
	"sega saturn": "Saturn",
	"sega cd": "SegaCD",
	"segacd": "SegaCD",
	"32x": "32X",
	"sega 32x": "32X",
	"sms": "SMS",
	"master system": "SMS",
	"sega master system": "SMS",
	"game gear": "GameGear",
	"gg": "GameGear",
	"arcade": "Arcade",
	"mame": "Arcade",
	"neo geo": "NeoGeo",
	"neogeo": "NeoGeo",
	"turbografx-16": "TG16",
	"tg16": "TG16",
	"pce": "TG16",
	"pc engine": "TG16",
	"turbografx-cd": "TGCD",
	"pce cd": "TGCD",
	"wonderswan": "WonderSwan",
	"ws": "WonderSwan",
	"virtual boy": "VirtualBoy",
	"vb": "VirtualBoy",
	"atari 2600": "Atari2600",
	"atari 7800": "Atari7800",
	"lynx": "Lynx",
	"atari lynx": "Lynx",
	"jaguar": "Jaguar",
	"atari jaguar": "Jaguar",
	"colecovision": "ColecoVision",
	"intellivision": "Intellivision",
	"msx": "MSX",
	"msx home computer system": "MSX",
	"c64": "C64",
	"commodore 64": "C64",
	"dos": "DOS",
	"windows": "Windows",
	"linux": "Linux",
	"flash": "Flash",
	"adobe flash": "Flash",
	"uzebox": "Uzebox",
	"vectrex": "Vectrex",
	"zx spectrum": "ZXSpectrum",
	"apple ii": "AppleII",
	"amiga": "Amiga",
	"doom": "Doom",
	"pico-8": "PICO8",
	"tic-80": "TIC80",
	"super game boy": "SGB",
	"sgb": "SGB",
}


def get_system_folder(system: str) -> str:
	"""Get the normalized folder name for a system."""
	if not system:
		return "Unknown"
	system_lower = system.lower().strip()
	return SYSTEM_FOLDER_MAP.get(system_lower, system.replace(" ", "").replace("-", ""))


def get_script_dir() -> Path:
	"""Get the directory containing this script."""
	return Path(__file__).parent.resolve()


def find_tas_files_dir() -> Path:
	"""Find the ~tas-files directory relative to this script or repo root."""
	# Try relative to script location
	script_dir = get_script_dir()

	# If in tools/ directory, go up to find ~tas-files
	for parent in [script_dir, script_dir.parent, script_dir.parent.parent]:
		tas_dir = parent / "~tas-files"
		if tas_dir.exists():
			return tas_dir

	# Fallback: create in repo root
	repo_root = script_dir
	while repo_root.parent != repo_root:
		if (repo_root / ".git").exists():
			break
		repo_root = repo_root.parent

	return repo_root / "~tas-files"


def load_tas_info(tas_dir: Path) -> dict:
	"""Load the tas-info.json manifest file."""
	info_path = tas_dir / "tas-info.json"
	if not info_path.exists():
		print(f"Error: {info_path} not found")
		sys.exit(1)

	with open(info_path, "r", encoding="utf-8") as f:
		return json.load(f)


def download_file(url: str, dest_path: Path, dry_run: bool = False) -> bool:
	"""
	Download a file from a URL to a destination path.
	Returns True if successful, False otherwise.
	"""
	if dry_run:
		print(f"  [DRY RUN] Would download: {url}")
		return True

	max_retries = 3
	for attempt in range(max_retries):
		try:
			# TASVideos requires a User-Agent header
			req = Request(url, headers={
				"User-Agent": "GameInfo-TAS-Downloader/1.0 (https://github.com/TheAnsarya/GameInfo)"
			})

			with urlopen(req, timeout=60) as response:
				data = response.read()

			dest_path.parent.mkdir(parents=True, exist_ok=True)
			with open(dest_path, "wb") as f:
				f.write(data)

			return True

		except HTTPError as e:
			print(f"  HTTP Error {e.code}: {e.reason}")
			return False
		except URLError as e:
			if attempt < max_retries - 1:
				print(f"  URL Error (attempt {attempt + 1}/{max_retries}): {e.reason}, retrying...")
				import time
				time.sleep(2)
				continue
			print(f"  URL Error: {e.reason}")
			return False
		except Exception as e:
			if attempt < max_retries - 1:
				print(f"  Error (attempt {attempt + 1}/{max_retries}): {e}, retrying...")
				import time
				time.sleep(2)
				continue
			print(f"  Error: {e}")
			return False
	return False


def extract_zip(zip_path: Path, dest_dir: Path) -> list[str]:
	"""
	Extract a ZIP file to a destination directory.
	Returns list of extracted file names.
	"""
	extracted = []
	try:
		with zipfile.ZipFile(zip_path, "r") as zf:
			for member in zf.namelist():
				# Skip directories and hidden files
				if member.endswith("/") or member.startswith("."):
					continue

				# Extract to flat directory (no subdirs)
				filename = os.path.basename(member)
				if filename:
					dest_path = dest_dir / filename
					with zf.open(member) as src, open(dest_path, "wb") as dst:
						dst.write(src.read())
					extracted.append(filename)

	except zipfile.BadZipFile:
		print(f"  Warning: {zip_path.name} is not a valid ZIP file")
	except Exception as e:
		print(f"  Error extracting {zip_path.name}: {e}")

	return extracted


def main():
	parser = argparse.ArgumentParser(
		description="Download TAS test files from TASVideos.org"
	)
	parser.add_argument(
		"--dry-run", "-n",
		action="store_true",
		help="Show what would be downloaded without actually downloading"
	)
	parser.add_argument(
		"--force", "-f",
		action="store_true",
		help="Re-download files even if they already exist"
	)
	parser.add_argument(
		"--format",
		type=str,
		help="Only download files of this format (smv, bk2, lsmv, fm2, vbm)"
	)
	parser.add_argument(
		"--game",
		type=str,
		help="Only download files for games matching this string (case-insensitive)"
	)
	parser.add_argument(
		"--system",
		type=str,
		help="Only download files for this system/platform (SNES, NES, Genesis, etc.)"
	)
	parser.add_argument(
		"--limit",
		type=int,
		default=0,
		help="Limit number of files to download (0 = no limit)"
	)
	parser.add_argument(
		"--no-extract",
		action="store_true",
		help="Don't extract ZIP files after downloading"
	)
	parser.add_argument(
		"--flat",
		action="store_true",
		help="Use flat directory structure instead of platform subfolders"
	)

	args = parser.parse_args()

	# Find directories
	tas_dir = find_tas_files_dir()
	compressed_base = tas_dir / "compressed"
	uncompressed_base = tas_dir / "uncompressed"

	# Create base directories if needed
	if not args.dry_run:
		compressed_base.mkdir(parents=True, exist_ok=True)
		uncompressed_base.mkdir(parents=True, exist_ok=True)

	# Load manifest
	tas_info = load_tas_info(tas_dir)
	files = tas_info.get("files", [])

	print(f"TAS Files Directory: {tas_dir}")
	print(f"Total files in manifest: {len(files)}")
	print()

	# Filter files
	if args.format:
		format_lower = args.format.lower()
		files = [f for f in files if f.get("format", "").lower() == format_lower]
		print(f"Filtered to {len(files)} {args.format.upper()} files")

	if args.game:
		game_lower = args.game.lower()
		files = [f for f in files if game_lower in f.get("game", "").lower()]
		print(f"Filtered to {len(files)} files matching '{args.game}'")

	if args.system:
		system_folder = get_system_folder(args.system)
		files = [f for f in files if get_system_folder(f.get("system", "")) == system_folder]
		print(f"Filtered to {len(files)} files for {system_folder}")

	if args.limit > 0:
		files = files[:args.limit]
		print(f"Limited to {len(files)} files")

	if not files:
		print("No files to download.")
		return 0

	print()

	# Download files
	downloaded = 0
	skipped = 0
	failed = 0
	extracted_count = 0

	for i, file_info in enumerate(files, 1):
		game = file_info.get("game", "Unknown")
		filename = file_info.get("file", "")
		movie_id = file_info.get("movieId", "")
		fmt = file_info.get("format", "")
		system = file_info.get("system", "Unknown")

		if not filename or not movie_id:
			print(f"[{i}/{len(files)}] Skipping {game}: missing filename or movieId")
			skipped += 1
			continue

		# Determine platform subfolder
		if args.flat:
			compressed_dir = compressed_base
			uncompressed_dir = uncompressed_base
		else:
			platform_folder = get_system_folder(system)
			compressed_dir = compressed_base / platform_folder
			uncompressed_dir = uncompressed_base / platform_folder

		# Construct download URL (ZIP archive)
		# Format: https://tasvideos.org/1327M?handler=Download
		download_url = f"https://tasvideos.org/{movie_id}?handler=Download"
		zip_filename = f"{filename.rsplit('.', 1)[0]}.zip"
		zip_path = compressed_dir / zip_filename
		uncompressed_path = uncompressed_dir / filename

		print(f"[{i}/{len(files)}] [{system}] {game} ({fmt.upper()})")

		# Check if already exists
		if not args.force:
			if uncompressed_path.exists():
				print(f"  Skipped: {filename} already exists")
				skipped += 1
				continue
			if zip_path.exists() and not args.no_extract:
				print(f"  ZIP exists, extracting...")
				if not args.dry_run:
					uncompressed_dir.mkdir(parents=True, exist_ok=True)
				extracted = extract_zip(zip_path, uncompressed_dir)
				if extracted:
					extracted_count += len(extracted)
					print(f"  Extracted: {', '.join(extracted)}")
				skipped += 1
				continue

		# Download
		print(f"  Downloading from {download_url}")
		if not args.dry_run:
			compressed_dir.mkdir(parents=True, exist_ok=True)
		if download_file(download_url, zip_path, args.dry_run):
			downloaded += 1

			# Extract if not dry-run and not --no-extract
			if not args.dry_run and not args.no_extract and zip_path.exists():
				uncompressed_dir.mkdir(parents=True, exist_ok=True)
				extracted = extract_zip(zip_path, uncompressed_dir)
				if extracted:
					extracted_count += len(extracted)
					print(f"  Extracted: {', '.join(extracted)}")
		else:
			failed += 1

		# Rate limiting - be nice to TASVideos servers
		if not args.dry_run and i < len(files):
			time.sleep(0.5)

	# Summary
	print()
	print("=" * 60)
	print("Summary:")
	print(f"  Downloaded: {downloaded}")
	print(f"  Extracted:  {extracted_count}")
	print(f"  Skipped:    {skipped}")
	print(f"  Failed:     {failed}")

	if failed > 0:
		return 1
	return 0


if __name__ == "__main__":
	sys.exit(main())
