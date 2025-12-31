#!/usr/bin/env python3
"""
TAS Manifest Builder

Fetches movie listings from TASVideos.org and builds/updates the tas-info.json manifest.
This script scrapes the TASVideos movie pages to gather information about available
TAS replay files for testing.

Usage:
    python build_tas_manifest.py [--systems SYSTEMS] [--limit N] [--dry-run]

Examples:
    python build_tas_manifest.py                           # Fetch all platforms
    python build_tas_manifest.py --systems SNES,NES,Genesis  # Specific platforms
    python build_tas_manifest.py --limit 100               # Limit per platform
    python build_tas_manifest.py --dry-run                 # Preview without saving

Supported platforms:
    SNES, NES, Genesis, N64, GBA, GB, GBC, NDS, PSX, GameCube, Wii,
    Saturn, SegaCD, 32X, SMS, GameGear, Arcade, TG16, and more.
"""

import argparse
import html
import json
import re
import sys
import time
from datetime import datetime
from pathlib import Path
from urllib.request import urlopen, Request
from urllib.error import URLError, HTTPError


# TASVideos system URL slugs
SYSTEM_SLUGS = {
	"SNES": "SNES",
	"NES": "NES",
	"Genesis": "Genesis",
	"N64": "N64",
	"GBA": "GBA",
	"GB": "GB",
	"GBC": "GBC",
	"NDS": "DS",
	"PSX": "PSX",
	"GameCube": "GC",
	"Wii": "Wii",
	"Saturn": "Saturn",
	"SegaCD": "SegaCD",
	"32X": "32X",
	"SMS": "SMS",
	"GameGear": "GG",
	"Arcade": "Arcade",
	"TG16": "PCE",
	"TGCD": "PCECD",
	"FDS": "FDS",
	"Lynx": "Lynx",
	"A2600": "A2600",
	"A7800": "A7800",
	"C64": "C64",
	"DOS": "DOS",
	"Windows": "Windows",
	"Linux": "Linux",
	"Flash": "Flash",
	"3DS": "3DS",
	"VirtualBoy": "VB",
	"WonderSwan": "WS",
	"NeoGeo": "NGP",
	"MSX": "MSX",
	"Intellivision": "INTV",
	"ColecoVision": "Coleco",
	"SGB": "SGB",
	"Vectrex": "Vectrex",
	"Doom": "Doom",
}

# TASVideos full system names (for display)
SYSTEM_NAMES = {
	"SNES": "Super Nintendo Entertainment System",
	"NES": "Nintendo Entertainment System",
	"Genesis": "Sega Genesis",
	"N64": "Nintendo 64",
	"GBA": "Game Boy Advance",
	"GB": "Game Boy",
	"GBC": "Game Boy Color",
	"NDS": "Nintendo DS",
	"PSX": "Sony PlayStation",
	"GameCube": "Nintendo GameCube",
	"Wii": "Wii",
	"Saturn": "Sega Saturn",
	"SegaCD": "Sega CD",
	"32X": "Sega 32X",
	"SMS": "Sega Master System",
	"GameGear": "Game Gear",
	"Arcade": "Arcade",
	"TG16": "TurboGrafx-16",
	"TGCD": "TurboGrafx-CD",
	"FDS": "Famicom Disk System",
	"Lynx": "Atari Lynx",
	"A2600": "Atari 2600",
	"A7800": "Atari 7800",
	"C64": "Commodore 64",
	"DOS": "DOS",
	"Windows": "Windows",
	"Linux": "Linux",
	"Flash": "Adobe Flash",
	"3DS": "Nintendo 3DS",
	"VirtualBoy": "Virtual Boy",
	"WonderSwan": "WonderSwan",
	"NeoGeo": "Neo Geo Pocket",
	"MSX": "MSX",
	"Intellivision": "Intellivision",
	"ColecoVision": "ColecoVision",
	"SGB": "Super Game Boy",
	"Vectrex": "Vectrex",
	"Doom": "Doom",
}

# Format extensions mapped to emulator
FORMAT_INFO = {
	"smv": {"emulator": "Snes9x", "systems": ["SNES"]},
	"lsmv": {"emulator": "lsnes", "systems": ["SNES"]},
	"bk2": {"emulator": "BizHawk", "systems": ["*"]},  # Multi-system
	"fm2": {"emulator": "FCEUX", "systems": ["NES", "FDS"]},
	"fm3": {"emulator": "FCEUX 2.x", "systems": ["NES", "FDS"]},
	"fcm": {"emulator": "FCE Ultra", "systems": ["NES"]},
	"vbm": {"emulator": "VisualBoyAdvance", "systems": ["GBA", "GB", "GBC", "SGB"]},
	"gmv": {"emulator": "Gens", "systems": ["Genesis", "32X", "SegaCD"]},
	"m64": {"emulator": "Mupen64", "systems": ["N64"]},
	"dtm": {"emulator": "Dolphin", "systems": ["GameCube", "Wii"]},
	"bsv": {"emulator": "RetroArch", "systems": ["*"]},
	"mcm": {"emulator": "Mednafen", "systems": ["*"]},
	"pjm": {"emulator": "PCSX-RR", "systems": ["PSX"]},
	"pxm": {"emulator": "PCSX2", "systems": ["PS2", "PSX"]},
	"dsm": {"emulator": "DeSmuME", "systems": ["NDS"]},
	"bkm": {"emulator": "BizHawk (old)", "systems": ["*"]},
	"ltm": {"emulator": "libTAS", "systems": ["Linux"]},
	"fbm": {"emulator": "FinalBurn", "systems": ["Arcade"]},
	"jrsr": {"emulator": "JPC-RR", "systems": ["DOS"]},
}


def get_script_dir() -> Path:
	"""Get the directory containing this script."""
	return Path(__file__).parent.resolve()


def find_tas_files_dir() -> Path:
	"""Find the ~tas-files directory relative to this script or repo root."""
	script_dir = get_script_dir()

	for parent in [script_dir, script_dir.parent, script_dir.parent.parent]:
		tas_dir = parent / "~tas-files"
		if tas_dir.exists():
			return tas_dir

	repo_root = script_dir
	while repo_root.parent != repo_root:
		if (repo_root / ".git").exists():
			break
		repo_root = repo_root.parent

	return repo_root / "~tas-files"


def fetch_url(url: str) -> str | None:
	"""Fetch content from a URL."""
	try:
		req = Request(url, headers={
			"User-Agent": "GameInfo-TAS-Builder/1.0 (https://github.com/TheAnsarya/GameInfo)"
		})
		with urlopen(req, timeout=60) as response:
			return response.read().decode("utf-8")
	except (HTTPError, URLError) as e:
		print(f"  Error fetching {url}: {e}")
		return None
	except Exception as e:
		print(f"  Unexpected error: {e}")
		return None


def parse_movie_page(html_content: str, system: str) -> list[dict]:
	"""Parse a TASVideos movie listing page and extract movie info."""
	movies = []

	# Pattern for the movie card headers which look like:
	# <a class="..." href="/3562M"><span class="...">SNES Game Name by Author in 00:00.00</span></a>
	# The key pattern is: <h4> followed by <a href="/XXXXM"> containing text
	card_header_pattern = re.compile(
		r'<h4>\s*<a[^>]*href="/(\d+M)"[^>]*>(?:<[^>]*>)*([^<]+)(?:</[^>]*>)*</a>\s*</h4>',
		re.IGNORECASE | re.DOTALL
	)

	# Also match simpler patterns where text is right after href
	simple_href_pattern = re.compile(
		r'href="/(\d+M)"[^>]*>(?:<span[^>]*>)?([^<]+)(?:</span>)?</a>',
		re.IGNORECASE
	)

	# Find all movie links
	found_ids = set()

	# Try card header pattern first (most specific)
	for match in card_header_pattern.finditer(html_content):
		movie_id = match.group(1)
		if movie_id in found_ids:
			continue
		found_ids.add(movie_id)

		title = match.group(2).strip()

		# Parse title: "SNES Game Name by Author in 00:00.00"
		# Split by " by " to separate game name from author
		parts = title.split(" by ")
		if parts:
			game_part = parts[0].strip()
			# Remove system prefix if present (e.g., "SNES " at the start)
			if game_part.startswith(system + " "):
				game_part = game_part[len(system) + 1:]
			# Remove category in quotes if present
			game_name = re.sub(r'\s*"[^"]+"\s*$', '', game_part).strip()
		else:
			game_name = title

		if not game_name or game_name.lower() in ["any%", "100%", "all", "standard"]:
			continue

		movies.append({
			"movieId": movie_id,
			"game": html.unescape(game_name),
			"system": system,
		})

	# Fall back to simple pattern for any missed entries
	for match in simple_href_pattern.finditer(html_content):
		movie_id = match.group(1)
		if movie_id in found_ids:
			continue
		found_ids.add(movie_id)

		title = match.group(2).strip()

		# Parse title like before
		parts = title.split(" by ")
		if parts:
			game_part = parts[0].strip()
			if game_part.startswith(system + " "):
				game_part = game_part[len(system) + 1:]
			game_name = re.sub(r'\s*"[^"]+"\s*$', '', game_part).strip()
		else:
			game_name = title

		if not game_name or game_name.lower() in ["any%", "100%", "all", "standard"]:
			continue

		movies.append({
			"movieId": movie_id,
			"game": html.unescape(game_name),
			"system": system,
		})

	return movies


def fetch_movie_details(movie_id: str) -> dict | None:
	"""Fetch detailed info for a specific movie."""
	url = f"https://tasvideos.org/{movie_id}"
	content = fetch_url(url)
	if not content:
		return None

	details = {}

	# Extract author
	author_match = re.search(r'by\s+<[^>]+>([^<]+)</a>', content)
	if author_match:
		details["author"] = html.unescape(author_match.group(1).strip())

	# Extract duration
	duration_match = re.search(r'(?:Time|Duration)[:\s]*([0-9:]+(?:\.[0-9]+)?)', content)
	if duration_match:
		details["duration"] = duration_match.group(1)

	# Extract movie filename from download link
	# Looking for patterns like: filename.smv, filename.bk2, etc.
	file_match = re.search(r'([a-zA-Z0-9_\-\[\],]+\.(?:smv|lsmv|bk2|fm2|fm3|fcm|vbm|gmv|m64|dtm|bsv|mcm|pjm|pxm|dsm|bkm|ltm|fbm|jrsr))', content, re.IGNORECASE)
	if file_match:
		details["file"] = file_match.group(1)
		ext = file_match.group(1).rsplit(".", 1)[-1].lower()
		details["format"] = ext

	# Extract category/goal
	category_match = re.search(r'(?:Category|Goal)[:\s]*([^<\n]+)', content)
	if category_match:
		cat = category_match.group(1).strip()
		if cat and cat.lower() not in ["any%", "any"]:
			details["category"] = cat

	return details


def fetch_movies_for_system(system: str, limit: int = 0, all_pages: bool = True) -> list[dict]:
	"""Fetch all movies for a given system.

	Args:
		system: The system to fetch movies for
		limit: Maximum number of movies to return (0 for no limit)
		all_pages: If True, fetch all pagination pages; if False, only fetch first page
	"""
	slug = SYSTEM_SLUGS.get(system)
	if not slug:
		print(f"Unknown system: {system}")
		return []

	base_url = f"https://tasvideos.org/Movies-{slug}"
	all_movies = []
	page = 1

	while True:
		url = f"{base_url}?CurrentPage={page}" if page > 1 else base_url
		print(f"Fetching {system} movies page {page} from {url}...")

		content = fetch_url(url)
		if not content:
			break

		# Check for pagination info - look for "Showing items [X - Y] of Z"
		pagination_match = re.search(r'Showing items \[(\d+)\s*-\s*(\d+)\] of (\d+)', content)

		movies = parse_movie_page(content, system)
		print(f"  Found {len(movies)} movies on page {page}")

		if not movies:
			break

		all_movies.extend(movies)

		# Check if there are more pages
		if pagination_match:
			end_item = int(pagination_match.group(2))
			total_items = int(pagination_match.group(3))
			if end_item >= total_items or not all_pages:
				break
		else:
			# No pagination info means single page or end of pages
			break

		# Check limit before fetching next page
		if limit > 0 and len(all_movies) >= limit:
			all_movies = all_movies[:limit]
			print(f"  Limited to {limit} movies")
			return all_movies

		page += 1
		time.sleep(0.5)  # Rate limiting between page requests

	print(f"  Total: {len(all_movies)} movies for {system}")

	if limit > 0 and len(all_movies) > limit:
		all_movies = all_movies[:limit]
		print(f"  Limited to {limit} movies")

	return all_movies


def load_existing_manifest(tas_dir: Path) -> dict:
	"""Load existing tas-info.json if it exists."""
	info_path = tas_dir / "tas-info.json"
	if info_path.exists():
		with open(info_path, "r", encoding="utf-8") as f:
			return json.load(f)
	return {
		"description": "TAS replay files downloaded from TASVideos.org for testing the TAS Converter library",
		"downloadDate": datetime.now().strftime("%Y-%m-%d"),
		"source": "https://tasvideos.org/",
		"totalFiles": 0,
		"formats": {
			"smv": "Snes9x movie format",
			"lsmv": "lsnes movie format",
			"bk2": "BizHawk movie format (ZIP archive)",
			"fm2": "FCEUX movie format (NES)",
			"fm3": "FCEUX 2.x movie format (NES)",
			"fcm": "FCE Ultra movie format (NES)",
			"vbm": "VisualBoyAdvance movie format (Game Boy)",
			"gmv": "Gens movie format (Genesis)",
			"m64": "Mupen64 movie format (N64)",
			"dtm": "Dolphin movie format (GameCube/Wii)",
			"bsv": "RetroArch movie format",
			"mcm": "Mednafen movie format",
			"pjm": "PCSX-RR movie format (PlayStation)",
			"pxm": "PCSX2 movie format (PlayStation 2)",
			"dsm": "DeSmuME movie format (Nintendo DS)",
			"bkm": "BizHawk legacy movie format",
			"ltm": "libTAS movie format (Linux)",
			"fbm": "FinalBurn movie format (Arcade)",
			"jrsr": "JPC-RR movie format (DOS)",
		},
		"files": []
	}


def save_manifest(tas_dir: Path, manifest: dict, dry_run: bool = False):
	"""Save the manifest to tas-info.json."""
	info_path = tas_dir / "tas-info.json"

	# Sort files by system, then game
	manifest["files"].sort(key=lambda x: (x.get("system", ""), x.get("game", "")))
	manifest["totalFiles"] = len(manifest["files"])
	manifest["downloadDate"] = datetime.now().strftime("%Y-%m-%d")

	if dry_run:
		print(f"\n[DRY RUN] Would save {len(manifest['files'])} entries to {info_path}")
		return

	with open(info_path, "w", encoding="utf-8") as f:
		json.dump(manifest, f, indent="\t", ensure_ascii=False)

	print(f"\nSaved {len(manifest['files'])} entries to {info_path}")


def generate_filename(movie_id: str, game: str, author: str = "", category: str = "") -> str:
	"""Generate a standardized filename for a movie."""
	# Sanitize game name
	safe_game = re.sub(r'[^\w\s\-]', '', game).lower()
	safe_game = re.sub(r'\s+', '-', safe_game).strip('-')

	# Sanitize author
	safe_author = ""
	if author:
		safe_author = re.sub(r'[^\w\s\-]', '', author).lower()
		safe_author = re.sub(r'\s+', '-', safe_author).strip('-')
		safe_author = safe_author[:20]  # Limit length

	# Build filename
	parts = []
	if safe_author:
		parts.append(safe_author)
	parts.append(safe_game[:40])  # Limit game name length
	if category:
		safe_cat = re.sub(r'[^\w\s\-]', '', category).lower()
		safe_cat = re.sub(r'\s+', '-', safe_cat).strip('-')
		parts.append(safe_cat[:15])

	return "-".join(parts)


def main():
	parser = argparse.ArgumentParser(
		description="Build/update TAS manifest from TASVideos.org"
	)
	parser.add_argument(
		"--systems",
		type=str,
		default="SNES,NES,Genesis,N64,GBA,GB,GBC,PSX,GameCube",
		help="Comma-separated list of systems to fetch (default: major systems)"
	)
	parser.add_argument(
		"--limit",
		type=int,
		default=0,
		help="Limit number of movies per system (0 = no limit)"
	)
	parser.add_argument(
		"--fetch-details",
		action="store_true",
		help="Fetch detailed info for each movie (slower but more complete)"
	)
	parser.add_argument(
		"--dry-run", "-n",
		action="store_true",
		help="Preview changes without saving"
	)
	parser.add_argument(
		"--merge",
		action="store_true",
		help="Merge with existing manifest instead of replacing"
	)

	args = parser.parse_args()

	# Parse systems
	systems = [s.strip() for s in args.systems.split(",")]

	# Find TAS files directory
	tas_dir = find_tas_files_dir()
	print(f"TAS Files Directory: {tas_dir}")

	# Load or create manifest
	if args.merge:
		manifest = load_existing_manifest(tas_dir)
		existing_ids = {f["movieId"] for f in manifest.get("files", [])}
		print(f"Loaded existing manifest with {len(existing_ids)} entries")
	else:
		manifest = load_existing_manifest(tas_dir)
		manifest["files"] = []
		existing_ids = set()

	# Fetch movies for each system
	total_new = 0
	for system in systems:
		movies = fetch_movies_for_system(system, args.limit)

		for movie in movies:
			if movie["movieId"] in existing_ids:
				continue

			# Fetch details if requested
			if args.fetch_details:
				print(f"  Fetching details for {movie['movieId']}...")
				details = fetch_movie_details(movie["movieId"])
				if details:
					movie.update(details)
				time.sleep(0.3)  # Rate limiting

			# Generate filename if not found
			if "file" not in movie:
				base_name = generate_filename(
					movie["movieId"],
					movie["game"],
					movie.get("author", ""),
					movie.get("category", "")
				)
				movie["file"] = f"{base_name}.bk2"  # Default to bk2
				movie["format"] = "bk2"

			# Add link
			movie["link"] = f"https://tasvideos.org/{movie['movieId']}"

			manifest["files"].append(movie)
			existing_ids.add(movie["movieId"])
			total_new += 1

		# Rate limiting between systems
		time.sleep(1.0)

	print(f"\nAdded {total_new} new entries")

	# Save manifest
	save_manifest(tas_dir, manifest, args.dry_run)

	# Print summary by system
	print("\nSummary by system:")
	system_counts = {}
	for f in manifest["files"]:
		sys = f.get("system", "Unknown")
		system_counts[sys] = system_counts.get(sys, 0) + 1

	for sys, count in sorted(system_counts.items()):
		print(f"  {sys}: {count}")

	return 0


if __name__ == "__main__":
	sys.exit(main())
