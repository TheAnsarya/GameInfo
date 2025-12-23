#!/usr/bin/env python3
"""
ROM Catalog Helper Module

Provides easy access to ROM catalog data for scripts and tools.
Allows looking up ROMs by hash, name, or other criteria and
resolving paths to actual ROM files.
"""

import json
from dataclasses import dataclass, field
from pathlib import Path
from typing import Optional


@dataclass
class RomInfo:
	"""ROM file information from the catalog."""
	filename: str
	relative_path: str
	size: int
	extension: str
	crc32: str
	md5: str
	sha1: str
	sha256: str
	sha512: str
	blake2b: str
	blake3: str
	description: str
	platform: str
	region: str
	revision: str
	is_verified: bool
	is_bad_dump: bool
	is_overdump: bool
	is_underdump: bool
	is_hack: bool
	is_translation: bool
	is_unlicensed: bool
	is_prototype: bool
	is_beta: bool
	snes_header: Optional[dict] = field(default=None)
	
	@classmethod
	def from_dict(cls, data: dict) -> "RomInfo":
		"""Create RomInfo from a catalog file entry dict."""
		return cls(
			filename=data.get("filename", ""),
			relative_path=data.get("relative_path", ""),
			size=data.get("size", 0),
			extension=data.get("extension", ""),
			crc32=data.get("crc32", ""),
			md5=data.get("md5", ""),
			sha1=data.get("sha1", ""),
			sha256=data.get("sha256", ""),
			sha512=data.get("sha512", ""),
			blake2b=data.get("blake2b", ""),
			blake3=data.get("blake3", ""),
			description=data.get("description", ""),
			platform=data.get("platform", ""),
			region=data.get("region", ""),
			revision=data.get("revision", ""),
			is_verified=data.get("is_verified", False),
			is_bad_dump=data.get("is_bad_dump", False),
			is_overdump=data.get("is_overdump", False),
			is_underdump=data.get("is_underdump", False),
			is_hack=data.get("is_hack", False),
			is_translation=data.get("is_translation", False),
			is_unlicensed=data.get("is_unlicensed", False),
			is_prototype=data.get("is_prototype", False),
			is_beta=data.get("is_beta", False),
			snes_header=data.get("snes_header"),
		)


class RomCatalogHelper:
	"""
	Helper class for working with the ROM catalog.
	
	Provides methods to look up ROMs by various criteria and
	resolve paths to actual ROM files.
	
	Example usage:
		helper = RomCatalogHelper("data/rom_catalog.json")
		rom = helper.find_by_crc32("31b965db")
		if rom:
			path = helper.get_rom_path(rom)
			if path.exists():
				data = path.read_bytes()
	"""
	
	def __init__(self, catalog_path: str | Path, roms_root: Optional[str | Path] = None):
		"""
		Initialize the helper with a catalog file.
		
		Args:
			catalog_path: Path to the rom_catalog.json file
			roms_root: Optional override for the ROMs root folder.
			           If not specified, uses the catalog's root_path
			           resolved relative to the catalog file's parent.
		"""
		self.catalog_path = Path(catalog_path)
		
		with open(self.catalog_path, "r", encoding="utf-8") as f:
			self._catalog = json.load(f)
		
		# Build index of all files for fast lookup
		self._files: list[RomInfo] = [
			RomInfo.from_dict(f) for f in self._catalog.get("files", [])
		]
		
		# Build hash indexes for fast lookup
		self._by_crc32: dict[str, list[RomInfo]] = {}
		self._by_md5: dict[str, list[RomInfo]] = {}
		self._by_sha1: dict[str, list[RomInfo]] = {}
		self._by_sha256: dict[str, list[RomInfo]] = {}
		
		for rom in self._files:
			if rom.crc32:
				self._by_crc32.setdefault(rom.crc32.lower(), []).append(rom)
			if rom.md5:
				self._by_md5.setdefault(rom.md5.lower(), []).append(rom)
			if rom.sha1:
				self._by_sha1.setdefault(rom.sha1.lower(), []).append(rom)
			if rom.sha256:
				self._by_sha256.setdefault(rom.sha256.lower(), []).append(rom)
		
		# Determine ROMs root folder
		if roms_root:
			self._roms_root = Path(roms_root)
		else:
			root_path = self._catalog.get("root_path", "~roms")
			# Resolve relative to catalog parent directory
			self._roms_root = self.catalog_path.parent.parent / root_path
	
	@property
	def catalog(self) -> dict:
		"""Return the raw catalog dictionary."""
		return self._catalog
	
	@property
	def files(self) -> list[RomInfo]:
		"""Return list of all ROM files in the catalog."""
		return self._files
	
	@property
	def total_files(self) -> int:
		"""Return total number of files in the catalog."""
		return self._catalog.get("total_files", len(self._files))
	
	@property
	def total_size(self) -> int:
		"""Return total size of all files in bytes."""
		return self._catalog.get("total_size", 0)
	
	@property
	def platforms(self) -> dict[str, int]:
		"""Return platform counts."""
		return self._catalog.get("platforms", {})
	
	@property
	def roms_root(self) -> Path:
		"""Return the ROMs root folder path."""
		return self._roms_root
	
	def find_by_crc32(self, crc32: str) -> Optional[RomInfo]:
		"""
		Find a ROM by its CRC32 hash.
		
		Args:
			crc32: The CRC32 hash (8 hex chars)
			
		Returns:
			RomInfo if found, None otherwise.
			If multiple ROMs have the same CRC32, returns the first verified one,
			or the first one if none are verified.
		"""
		matches = self._by_crc32.get(crc32.lower(), [])
		if not matches:
			return None
		# Prefer verified dumps
		for rom in matches:
			if rom.is_verified:
				return rom
		return matches[0]
	
	def find_all_by_crc32(self, crc32: str) -> list[RomInfo]:
		"""Find all ROMs with a given CRC32 hash."""
		return self._by_crc32.get(crc32.lower(), [])
	
	def find_by_md5(self, md5: str) -> Optional[RomInfo]:
		"""Find a ROM by its MD5 hash."""
		matches = self._by_md5.get(md5.lower(), [])
		if not matches:
			return None
		for rom in matches:
			if rom.is_verified:
				return rom
		return matches[0]
	
	def find_by_sha1(self, sha1: str) -> Optional[RomInfo]:
		"""Find a ROM by its SHA1 hash."""
		matches = self._by_sha1.get(sha1.lower(), [])
		if not matches:
			return None
		for rom in matches:
			if rom.is_verified:
				return rom
		return matches[0]
	
	def find_by_sha256(self, sha256: str) -> Optional[RomInfo]:
		"""Find a ROM by its SHA256 hash."""
		matches = self._by_sha256.get(sha256.lower(), [])
		if not matches:
			return None
		for rom in matches:
			if rom.is_verified:
				return rom
		return matches[0]
	
	def find_by_hash(self, hash_value: str) -> Optional[RomInfo]:
		"""
		Find a ROM by any hash, auto-detecting the hash type by length.
		
		Args:
			hash_value: A hash string (CRC32, MD5, SHA1, or SHA256)
			
		Returns:
			RomInfo if found, None otherwise.
		"""
		hash_value = hash_value.lower().strip()
		length = len(hash_value)
		
		if length == 8:
			return self.find_by_crc32(hash_value)
		elif length == 32:
			return self.find_by_md5(hash_value)
		elif length == 40:
			return self.find_by_sha1(hash_value)
		elif length == 64:
			return self.find_by_sha256(hash_value)
		
		return None
	
	def find_by_name(
		self,
		name: str,
		*,
		region: Optional[str] = None,
		platform: Optional[str] = None,
		verified_only: bool = False,
		exact: bool = False,
	) -> Optional[RomInfo]:
		"""
		Find a ROM by name with optional filters.
		
		Args:
			name: The ROM name to search for (case-insensitive)
			region: Optional region filter (e.g., "USA", "Japan", "Europe")
			platform: Optional platform filter (e.g., "SNES", "NES")
			verified_only: If True, only return verified dumps
			exact: If True, require exact name match (description field)
			
		Returns:
			RomInfo if found, None otherwise.
		"""
		name_lower = name.lower()
		
		for rom in self._files:
			# Check filters
			if region and rom.region.lower() != region.lower():
				continue
			if platform and rom.platform.lower() != platform.lower():
				continue
			if verified_only and not rom.is_verified:
				continue
			
			# Check name
			if exact:
				if rom.description.lower() == name_lower:
					return rom
			else:
				if name_lower in rom.description.lower() or name_lower in rom.filename.lower():
					return rom
		
		return None
	
	def find_all_by_name(
		self,
		name: str,
		*,
		region: Optional[str] = None,
		platform: Optional[str] = None,
		verified_only: bool = False,
	) -> list[RomInfo]:
		"""Find all ROMs matching a name with optional filters."""
		name_lower = name.lower()
		results = []
		
		for rom in self._files:
			if region and rom.region.lower() != region.lower():
				continue
			if platform and rom.platform.lower() != platform.lower():
				continue
			if verified_only and not rom.is_verified:
				continue
			
			if name_lower in rom.description.lower() or name_lower in rom.filename.lower():
				results.append(rom)
		
		return results
	
	def find_by_platform(
		self,
		platform: str,
		*,
		region: Optional[str] = None,
		verified_only: bool = False,
	) -> list[RomInfo]:
		"""Find all ROMs for a given platform."""
		results = []
		
		for rom in self._files:
			if rom.platform.lower() != platform.lower():
				continue
			if region and rom.region.lower() != region.lower():
				continue
			if verified_only and not rom.is_verified:
				continue
			results.append(rom)
		
		return results
	
	def get_rom_path(self, rom: RomInfo) -> Path:
		"""
		Get the filesystem path for a ROM.
		
		Args:
			rom: The RomInfo object
			
		Returns:
			Path to the ROM file (may not exist if user hasn't added the ROM)
		"""
		return self._roms_root / rom.relative_path
	
	def rom_exists(self, rom: RomInfo) -> bool:
		"""Check if the ROM file actually exists on disk."""
		return self.get_rom_path(rom).exists()
	
	def read_rom(self, rom: RomInfo) -> Optional[bytes]:
		"""
		Read the ROM file contents.
		
		Args:
			rom: The RomInfo object
			
		Returns:
			ROM file contents as bytes, or None if file doesn't exist.
		"""
		path = self.get_rom_path(rom)
		if path.exists():
			return path.read_bytes()
		return None
	
	def get_verified_roms(self, platform: Optional[str] = None) -> list[RomInfo]:
		"""Get all verified ROM dumps, optionally filtered by platform."""
		results = []
		for rom in self._files:
			if not rom.is_verified:
				continue
			if platform and rom.platform.lower() != platform.lower():
				continue
			results.append(rom)
		return results
	
	def get_available_roms(self, platform: Optional[str] = None) -> list[RomInfo]:
		"""Get all ROMs that actually exist on disk."""
		results = []
		for rom in self._files:
			if platform and rom.platform.lower() != platform.lower():
				continue
			if self.rom_exists(rom):
				results.append(rom)
		return results
	
	def get_soul_blazer(self, region: str = "USA") -> Optional[RomInfo]:
		"""
		Convenience method to get Soul Blazer ROM.
		
		Args:
			region: Region to find (USA, Europe, France, Germany, Japan)
			
		Returns:
			RomInfo for Soul Blazer, or None if not found.
		"""
		# Map common region names
		region_map = {
			"us": "USA",
			"usa": "USA",
			"u": "USA",
			"eu": "Europe",
			"europe": "Europe",
			"e": "Europe",
			"jp": "Japan",
			"japan": "Japan",
			"j": "Japan",
			"fr": "France",
			"france": "France",
			"f": "France",
			"de": "Germany",
			"germany": "Germany",
			"g": "Germany",
		}
		region = region_map.get(region.lower(), region)
		
		# Handle Japan special case (Soul Blader)
		if region.lower() == "japan":
			return self.find_by_name("Soul Blader", region="Japan", platform="SNES")
		
		return self.find_by_name("Soul Blazer", region=region, platform="SNES")
	
	def get_ffmq(self, region: str = "USA", version: str = "") -> Optional[RomInfo]:
		"""
		Convenience method to get Final Fantasy Mystic Quest ROM.
		
		Args:
			region: Region to find (USA, Japan, Europe)
			version: Optional version (e.g., "V1.0", "V1.1")
			
		Returns:
			RomInfo for FFMQ, or None if not found.
		"""
		if region.lower() in ("jp", "japan", "j"):
			return self.find_by_name("Final Fantasy USA - Mystic Quest", region="Japan")
		elif region.lower() in ("eu", "europe", "e"):
			return self.find_by_name("Mystic Quest Legend", region="Europe")
		else:
			# USA version
			for rom in self._files:
				if "Final Fantasy - Mystic Quest" in rom.filename:
					if region.lower() in ("us", "usa", "u") and "U" in rom.filename:
						if not version or version.upper() in rom.filename:
							return rom
		return None


def get_default_catalog_path() -> Path:
	"""Get the default path to the ROM catalog file."""
	# Try to find relative to this script
	script_dir = Path(__file__).parent
	catalog_path = script_dir.parent / "data" / "rom_catalog.json"
	if catalog_path.exists():
		return catalog_path
	
	# Try common locations
	common_paths = [
		Path("data/rom_catalog.json"),
		Path("../data/rom_catalog.json"),
		Path("../../data/rom_catalog.json"),
	]
	for path in common_paths:
		if path.exists():
			return path.resolve()
	
	raise FileNotFoundError("Could not find rom_catalog.json")


def get_helper(catalog_path: Optional[str | Path] = None) -> RomCatalogHelper:
	"""
	Get a RomCatalogHelper instance.
	
	Args:
		catalog_path: Optional path to catalog. If not provided,
		              uses default location.
	
	Returns:
		RomCatalogHelper instance.
	"""
	if catalog_path is None:
		catalog_path = get_default_catalog_path()
	return RomCatalogHelper(catalog_path)


# Quick access functions for common use cases
def find_rom(query: str, catalog_path: Optional[str | Path] = None) -> Optional[RomInfo]:
	"""
	Quick lookup function - finds ROM by hash or name.
	
	Args:
		query: Hash value or ROM name
		catalog_path: Optional path to catalog
		
	Returns:
		RomInfo if found, None otherwise.
	"""
	helper = get_helper(catalog_path)
	
	# Try as hash first
	result = helper.find_by_hash(query)
	if result:
		return result
	
	# Try as name
	return helper.find_by_name(query)


if __name__ == "__main__":
	import sys
	
	# Demo/test mode
	try:
		helper = get_helper()
		print(f"Loaded catalog with {helper.total_files} ROMs")
		print(f"Total size: {helper.total_size / 1024 / 1024:.2f} MB")
		print(f"Platforms: {helper.platforms}")
		print()
		
		# Show Soul Blazer info
		soul_blazer = helper.get_soul_blazer("USA")
		if soul_blazer:
			print("Soul Blazer (U):")
			print(f"  CRC32: {soul_blazer.crc32}")
			print(f"  SHA1: {soul_blazer.sha1}")
			print(f"  Size: {soul_blazer.size:,} bytes")
			print(f"  Verified: {soul_blazer.is_verified}")
			if soul_blazer.snes_header:
				print(f"  Title: {soul_blazer.snes_header.get('title', 'N/A')}")
				print(f"  Mapper: {soul_blazer.snes_header.get('mapper', 'N/A')}")
			path = helper.get_rom_path(soul_blazer)
			print(f"  Path: {path}")
			print(f"  Exists: {path.exists()}")
		
		# Command line lookup
		if len(sys.argv) > 1:
			query = " ".join(sys.argv[1:])
			print(f"\nSearching for: {query}")
			result = find_rom(query)
			if result:
				print(f"  Found: {result.filename}")
				print(f"  CRC32: {result.crc32}")
				print(f"  Region: {result.region}")
			else:
				print("  Not found")
	
	except FileNotFoundError as e:
		print(f"Error: {e}", file=sys.stderr)
		sys.exit(1)
