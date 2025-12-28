"""
Dragon Quest III Game Data Extractor
Advanced ROM analysis for extracting characters, items, monsters, and other game data

Integrates with existing ROM analysis pipeline for comprehensive game data extraction
"""

import os
import struct
import json
from typing import Dict, List, Tuple, Optional, Any
from dataclasses import dataclass, asdict
from pathlib import Path
import logging

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

@dataclass
class Character:
	"""Dragon Quest III character data structure"""
	id: int
	name: str
	offset: int
	level: int
	stats: Dict[str, int]
	equipment: List[int]
	spells: List[int]
	class_type: str
	experience: int
	gold: int
	confidence: float

@dataclass
class Item:
	"""Dragon Quest III item data structure"""
	id: int
	name: str
	offset: int
	item_type: str
	price: int
	stats_bonus: Dict[str, int]
	usable_by: List[str]
	description: str
	confidence: float

@dataclass
class Monster:
	"""Dragon Quest III monster data structure"""
	id: int
	name: str
	offset: int
	stats: Dict[str, int]
	spells: List[str]
	resistances: Dict[str, int]
	drop_items: List[int]
	experience_reward: int
	gold_reward: int
	confidence: float

@dataclass
class Spell:
	"""Dragon Quest III spell data structure"""
	id: int
	name: str
	offset: int
	spell_type: str
	mp_cost: int
	target: str
	effect: str
	learnable_by: List[str]
	confidence: float

@dataclass
class GameLocation:
	"""Dragon Quest III location/map data"""
	id: int
	name: str
	offset: int
	map_data_offset: int
	width: int
	height: int
	tileset: int
	npc_data: List[Dict]
	treasure_chests: List[Dict]
	confidence: float

class DQ3GameDataExtractor:
	"""Advanced Dragon Quest III game data extraction system"""

	def __init__(self, project_root: str):
		self.project_root = Path(project_root)
		self.rom_path = None
		self.rom_data = None
		self.smc_header_size = 0

		# Dragon Quest III specific offsets and patterns (SNES version)
		self.CHARACTER_DATA_BANKS = [0x1E, 0x1F, 0x20]	# Typical character data banks
		self.ITEM_DATA_BANKS = [0x1C, 0x1D]	# Item data banks
		self.MONSTER_DATA_BANKS = [0x18, 0x19, 0x1A]	# Monster data banks
		self.SPELL_DATA_BANKS = [0x1B]	# Spell data banks
		self.TEXT_BANKS = [0x10, 0x11, 0x12, 0x13]	# Text data banks

		# Known patterns for data identification
		self.CHARACTER_PATTERNS = [
			b'\x01\x00\x00\x00',	# Character start marker
			b'\xFF\xFF\xFF\xFF',	# Character end marker
		]

		self.ITEM_PATTERNS = [
			b'\x00\x00\x00\x01',	# Item type marker
			b'\x01\x00\x00\x00',	# Equipment marker
		]

		self.MONSTER_PATTERNS = [
			b'\x00\x01\x00\x00',	# Monster start
			b'\xFF\x00\x00\x00',	# Monster separator
		]

		# Text encoding table for Dragon Quest III
		self.TEXT_TABLE = self._build_text_table()

		self._load_rom()

	def _load_rom(self):
		"""Load ROM data with SMC header detection"""
		rom_files = [
			'Dragon Quest III - Soshite Densetsu he... (J).smc',	# Primary Japanese source
			'Dragon Quest III - english.smc',						# Reference translation
			'Dragon Quest III - english (patched).smc'				# Backup option
		]

		for rom_file in rom_files:
			rom_path = self.project_root / 'static' / rom_file
			if rom_path.exists():
				self.rom_path = rom_path
				break

		if not self.rom_path:
			raise FileNotFoundError("No Dragon Quest III ROM found")

		with open(self.rom_path, 'rb') as f:
			self.rom_data = f.read()

		# Detect SMC header
		if len(self.rom_data) % 1024 == 512:
			self.smc_header_size = 512
			logger.info("SMC header detected (512 bytes)")
		else:
			self.smc_header_size = 0
			logger.info("No SMC header detected")

		logger.info(f"ROM loaded: {len(self.rom_data):,} bytes from {self.rom_path.name}")

	def _build_text_table(self) -> Dict[int, str]:
		"""Build text encoding table for Dragon Quest III"""
		# Basic ASCII-like mapping (to be expanded based on ROM analysis)
		text_table = {}

		# Standard ASCII range
		for i in range(32, 127):
			text_table[i] = chr(i)

		# Dragon Quest III specific characters
		special_chars = {
			0x00: '[END]',
			0x01: '[HERO]',
			0x02: '[ITEM]',
			0x03: '[GOLD]',
			0x04: '[NEWLINE]',
			0x05: '[WAIT]',
			0xFE: '[SPACE]',
			0xFF: '[NULL]'
		}

		text_table.update(special_chars)
		return text_table

	def hirom_to_pc_address(self, snes_address: int) -> int:
		"""Convert HiROM SNES address to PC ROM offset"""
		bank = (snes_address >> 16) & 0xFF
		offset = snes_address & 0xFFFF

		if bank < 0x40:
			# Banks 00-3F map directly
			pc_address = (bank << 16) + offset
		elif bank < 0x80:
			# Banks 40-7F map to same as 00-3F
			pc_address = ((bank - 0x40) << 16) + offset
		else:
			# Banks 80-FF
			if offset < 0x8000:
				# WRAM/IO - invalid for ROM
				return -1
			else:
				# ROM area
				pc_address = ((bank - 0x80) << 16) + (offset - 0x8000)

		return pc_address + self.smc_header_size

	def pc_to_hirom_address(self, pc_address: int) -> int:
		"""Convert PC ROM offset to HiROM SNES address"""
		pc_address -= self.smc_header_size

		if pc_address < 0:
			return -1

		bank = (pc_address >> 16) & 0x7F
		offset = pc_address & 0xFFFF

		if offset < 0x8000:
			# First half of bank
			return (bank << 16) + offset
		else:
			# Second half of bank
			return ((bank + 0x80) << 16) + (offset + 0x8000)

	def extract_text(self, offset: int, max_length: int = 256) -> str:
		"""Extract text string from ROM using text table"""
		if offset < 0 or offset >= len(self.rom_data):
			return ""

		text = ""
		pos = offset

		for _ in range(max_length):
			if pos >= len(self.rom_data):
				break

			byte = self.rom_data[pos]

			# Check for string terminators
			if byte == 0x00 or byte == 0xFF:
				break

			char = self.TEXT_TABLE.get(byte, f'[{byte:02X}]')
			text += char
			pos += 1

		return text.strip()

	def scan_for_patterns(self, patterns: List[bytes], banks: List[int]) -> List[Tuple[int, bytes]]:
		"""Scan specific banks for data patterns"""
		matches = []

		for bank in banks:
			bank_start = self.hirom_to_pc_address(bank << 16)
			bank_end = min(bank_start + 0x10000, len(self.rom_data))

			if bank_start < 0 or bank_start >= len(self.rom_data):
				continue

			for pattern in patterns:
				pos = bank_start
				while pos < bank_end - len(pattern):
					if self.rom_data[pos:pos + len(pattern)] == pattern:
						matches.append((pos, pattern))
						pos += len(pattern)
					else:
						pos += 1

		return matches

	def analyze_character_data(self) -> List[Character]:
		"""Extract character data from ROM"""
		logger.info("Analyzing character data...")
		characters = []

		# Scan for character patterns
		char_patterns = self.scan_for_patterns(self.CHARACTER_PATTERNS, self.CHARACTER_DATA_BANKS)

		for offset, pattern in char_patterns:
			try:
				# Read potential character data structure
				if offset + 64 >= len(self.rom_data):
					continue

				char_data = self.rom_data[offset:offset + 64]

				# Parse character structure (estimated format)
				char_id = char_data[0]
				level = char_data[4] if char_data[4] > 0 else 1

				# Extract stats (HP, MP, STR, AGI, etc.)
				stats = {
					'hp': struct.unpack('<H', char_data[8:10])[0] if char_data[8:10] != b'\x00\x00' else 0,
					'mp': struct.unpack('<H', char_data[10:12])[0] if char_data[10:12] != b'\x00\x00' else 0,
					'strength': char_data[12] if char_data[12] > 0 else 1,
					'agility': char_data[13] if char_data[13] > 0 else 1,
					'resilience': char_data[14] if char_data[14] > 0 else 1,
					'wisdom': char_data[15] if char_data[15] > 0 else 1,
				}

				# Extract equipment slots
				equipment = [char_data[i] for i in range(16, 24)]

				# Extract spell list
				spells = [char_data[i] for i in range(24, 32) if char_data[i] > 0]

				# Determine class type
				class_type = self._determine_class_type(char_data[2])

				# Extract experience and gold
				experience = struct.unpack('<I', char_data[32:36])[0]
				gold = struct.unpack('<I', char_data[36:40])[0]

				# Extract character name
				name_offset = offset + 40
				name = self.extract_text(name_offset, 16)

				# Calculate confidence based on data validity
				confidence = self._calculate_character_confidence(stats, level, equipment)

				if confidence > 0.3:	# Only include plausible characters
					character = Character(
						id=char_id,
						name=name if name else f"Character_{char_id:02X}",
						offset=offset,
						level=level,
						stats=stats,
						equipment=equipment,
						spells=spells,
						class_type=class_type,
						experience=experience,
						gold=gold,
						confidence=confidence
					)
					characters.append(character)

			except (struct.error, IndexError) as e:
				logger.debug(f"Error parsing character at {offset:06X}: {e}")
				continue

		logger.info(f"Found {len(characters)} potential characters")
		return sorted(characters, key=lambda c: c.confidence, reverse=True)

	def analyze_item_data(self) -> List[Item]:
		"""Extract item data from ROM"""
		logger.info("Analyzing item data...")
		items = []

		# Scan for item patterns
		item_patterns = self.scan_for_patterns(self.ITEM_PATTERNS, self.ITEM_DATA_BANKS)

		for offset, pattern in item_patterns:
			try:
				if offset + 32 >= len(self.rom_data):
					continue

				item_data = self.rom_data[offset:offset + 32]

				# Parse item structure
				item_id = item_data[0]
				item_type = self._determine_item_type(item_data[1])

				# Extract price
				price = struct.unpack('<H', item_data[4:6])[0]

				# Extract stat bonuses
				stats_bonus = {
					'attack': struct.unpack('<h', item_data[8:10])[0],
					'defense': struct.unpack('<h', item_data[10:12])[0],
					'agility': item_data[12],
				}

				# Extract usability flags
				usable_by = self._decode_usability_flags(item_data[16])

				# Extract item name
				name_offset = offset + 20
				name = self.extract_text(name_offset, 16)

				# Extract description (if available)
				description = self.extract_text(name_offset + 16, 32)

				# Calculate confidence
				confidence = self._calculate_item_confidence(price, stats_bonus, name)

				if confidence > 0.2:
					item = Item(
						id=item_id,
						name=name if name else f"Item_{item_id:02X}",
						offset=offset,
						item_type=item_type,
						price=price,
						stats_bonus=stats_bonus,
						usable_by=usable_by,
						description=description,
						confidence=confidence
					)
					items.append(item)

			except (struct.error, IndexError) as e:
				logger.debug(f"Error parsing item at {offset:06X}: {e}")
				continue

		logger.info(f"Found {len(items)} potential items")
		return sorted(items, key=lambda i: i.confidence, reverse=True)

	def analyze_monster_data(self) -> List[Monster]:
		"""Extract monster data from ROM"""
		logger.info("Analyzing monster data...")
		monsters = []

		# Scan for monster patterns
		monster_patterns = self.scan_for_patterns(self.MONSTER_PATTERNS, self.MONSTER_DATA_BANKS)

		for offset, pattern in monster_patterns:
			try:
				if offset + 48 >= len(self.rom_data):
					continue

				monster_data = self.rom_data[offset:offset + 48]

				# Parse monster structure
				monster_id = monster_data[0]

				# Extract stats
				stats = {
					'hp': struct.unpack('<H', monster_data[4:6])[0],
					'mp': struct.unpack('<H', monster_data[6:8])[0],
					'attack': monster_data[8],
					'defense': monster_data[9],
					'agility': monster_data[10],
					'wisdom': monster_data[11],
				}

				# Extract spells
				spells = []
				for i in range(16, 24):
					if monster_data[i] > 0:
						spell_name = self._get_spell_name(monster_data[i])
						if spell_name:
							spells.append(spell_name)

				# Extract resistances
				resistances = {
					'fire': monster_data[24],
					'ice': monster_data[25],
					'lightning': monster_data[26],
					'sleep': monster_data[27],
					'stopspell': monster_data[28],
					'poison': monster_data[29],
				}

				# Extract drop items and rewards
				drop_items = [monster_data[i] for i in range(32, 36) if monster_data[i] > 0]
				experience_reward = struct.unpack('<H', monster_data[36:38])[0]
				gold_reward = struct.unpack('<H', monster_data[38:40])[0]

				# Extract monster name
				name_offset = offset + 40
				name = self.extract_text(name_offset, 16)

				# Calculate confidence
				confidence = self._calculate_monster_confidence(stats, experience_reward, gold_reward)

				if confidence > 0.2:
					monster = Monster(
						id=monster_id,
						name=name if name else f"Monster_{monster_id:02X}",
						offset=offset,
						stats=stats,
						spells=spells,
						resistances=resistances,
						drop_items=drop_items,
						experience_reward=experience_reward,
						gold_reward=gold_reward,
						confidence=confidence
					)
					monsters.append(monster)

			except (struct.error, IndexError) as e:
				logger.debug(f"Error parsing monster at {offset:06X}: {e}")
				continue

		logger.info(f"Found {len(monsters)} potential monsters")
		return sorted(monsters, key=lambda m: m.confidence, reverse=True)

	def _determine_class_type(self, class_byte: int) -> str:
		"""Determine character class from byte value"""
		class_map = {
			0x00: "Hero",
			0x01: "Soldier",
			0x02: "Fighter",
			0x03: "Pilgrim",
			0x04: "Mage",
			0x05: "Thief",
			0x06: "Merchant",
			0x07: "Goof-off",
			0x08: "Sage",
		}
		return class_map.get(class_byte, f"Unknown_{class_byte:02X}")

	def _determine_item_type(self, type_byte: int) -> str:
		"""Determine item type from byte value"""
		type_map = {
			0x00: "Weapon",
			0x01: "Armor",
			0x02: "Shield",
			0x03: "Helmet",
			0x04: "Tool",
			0x05: "Important",
		}
		return type_map.get(type_byte, f"Unknown_{type_byte:02X}")

	def _decode_usability_flags(self, flags_byte: int) -> List[str]:
		"""Decode item usability flags"""
		classes = ["Hero", "Soldier", "Fighter", "Pilgrim", "Mage", "Thief", "Merchant", "Goof-off"]
		usable = []

		for i, class_name in enumerate(classes):
			if flags_byte & (1 << i):
				usable.append(class_name)

		return usable

	def _get_spell_name(self, spell_id: int) -> str:
		"""Get spell name from ID"""
		spell_map = {
			0x01: "Heal",
			0x02: "Hurt",
			0x03: "Sleep",
			0x04: "Radiant",
			0x05: "Stopspell",
			0x06: "Outside",
			0x07: "Return",
			# Add more spell mappings...
		}
		return spell_map.get(spell_id, f"Spell_{spell_id:02X}")

	def _calculate_character_confidence(self, stats: Dict[str, int], level: int, equipment: List[int]) -> float:
		"""Calculate confidence score for character data"""
		confidence = 0.0

		# Check if stats are reasonable
		if 1 <= level <= 50:
			confidence += 0.3

		if 0 < stats['hp'] < 999:
			confidence += 0.2

		if stats['strength'] > 0:
			confidence += 0.1

		# Check equipment slots for non-zero values
		valid_equipment = sum(1 for eq in equipment if 0 < eq < 255)
		confidence += min(valid_equipment / 8, 0.4)

		return min(confidence, 1.0)

	def _calculate_item_confidence(self, price: int, stats_bonus: Dict[str, int], name: str) -> float:
		"""Calculate confidence score for item data"""
		confidence = 0.0

		# Check price reasonableness
		if 0 < price < 100000:
			confidence += 0.3

		# Check stat bonuses
		total_bonus = sum(abs(v) for v in stats_bonus.values())
		if 0 < total_bonus < 255:
			confidence += 0.2

		# Check name validity
		if name and len(name) > 1 and not name.startswith('['):
			confidence += 0.5

		return min(confidence, 1.0)

	def _calculate_monster_confidence(self, stats: Dict[str, int], exp: int, gold: int) -> float:
		"""Calculate confidence score for monster data"""
		confidence = 0.0

		# Check HP reasonableness
		if 0 < stats['hp'] < 10000:
			confidence += 0.3

		# Check experience reward
		if 0 < exp < 50000:
			confidence += 0.3

		# Check gold reward
		if 0 < gold < 10000:
			confidence += 0.2

		# Check other stats
		if all(stat > 0 for stat in stats.values()):
			confidence += 0.2

		return min(confidence, 1.0)

	def extract_all_game_data(self) -> Dict[str, Any]:
		"""Extract all game data types"""
		logger.info("Starting comprehensive game data extraction...")

		results = {
			'characters': [asdict(char) for char in self.analyze_character_data()],
			'items': [asdict(item) for item in self.analyze_item_data()],
			'monsters': [asdict(monster) for monster in self.analyze_monster_data()],
			'rom_info': {
				'path': str(self.rom_path),
				'size': len(self.rom_data),
				'smc_header': self.smc_header_size > 0,
				'header_size': self.smc_header_size
			}
		}

		# Calculate summary statistics
		results['summary'] = {
			'total_characters': len(results['characters']),
			'total_items': len(results['items']),
			'total_monsters': len(results['monsters']),
			'high_confidence_characters': sum(1 for c in results['characters'] if c['confidence'] > 0.7),
			'high_confidence_items': sum(1 for i in results['items'] if i['confidence'] > 0.7),
			'high_confidence_monsters': sum(1 for m in results['monsters'] if m['confidence'] > 0.7),
		}

		logger.info("Game data extraction complete!")
		logger.info(f"Summary: {results['summary']}")

		return results

	def save_extracted_data(self, output_dir: str = None) -> str:
		"""Save extracted data to JSON file"""
		if output_dir is None:
			output_dir = self.project_root / 'extracted_data'

		output_dir = Path(output_dir)
		output_dir.mkdir(exist_ok=True)

		data = self.extract_all_game_data()
		output_file = output_dir / f"dq3_game_data_{self.rom_path.stem}.json"

		with open(output_file, 'w', encoding='utf-8') as f:
			json.dump(data, f, indent=2, ensure_ascii=False)

		logger.info(f"Game data saved to: {output_file}")
		return str(output_file)

# Usage example and testing
if __name__ == "__main__":
	# Example usage
	project_root = r"c:\Users\me\source\repos\dq3r-info"
	extractor = DQ3GameDataExtractor(project_root)

	# Extract all data and save
	output_file = extractor.save_extracted_data()
	print(f"Data extraction complete! Results saved to: {output_file}")
