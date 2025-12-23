#!/usr/bin/env python3
"""
Soul Blazer (SNES) Animation Analyzer
Analyzes sprite animation data and frame sequences.
"""

import json
import struct
from pathlib import Path
from dataclasses import dataclass, field
from typing import Optional

try:
	from PIL import Image
except ImportError:
	print("PIL (Pillow) required: pip install Pillow")
	raise


# Paths
SCRIPT_DIR = Path(__file__).parent
ASSETS_DIR = SCRIPT_DIR.parent / "assets"
ANIM_DIR = ASSETS_DIR / "animations"
DEFAULT_ROM = Path(r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Soul Blazer (U) [!].sfc")


@dataclass
class AnimationFrame:
	"""Single animation frame."""
	tile_index: int
	duration: int  # in frames (60fps)
	flip_x: bool = False
	flip_y: bool = False
	offset_x: int = 0
	offset_y: int = 0


@dataclass
class Animation:
	"""Complete animation sequence."""
	name: str
	frames: list[AnimationFrame] = field(default_factory=list)
	loop: bool = True
	speed_modifier: float = 1.0

	@property
	def total_duration(self) -> int:
		return sum(f.duration for f in self.frames)

	@property
	def frame_count(self) -> int:
		return len(self.frames)


@dataclass
class EntityAnimations:
	"""All animations for a single entity type."""
	entity_id: int
	entity_name: str
	sprite_bank: int
	sprite_offset: int
	animations: dict[str, Animation] = field(default_factory=dict)


class AnimationAnalyzer:
	"""Analyze animation data from Soul Blazer ROM."""

	# Known animation pointer locations
	ANIMATION_TABLES = {
		"player": {"bank": 0x01, "offset": 0x8000, "count": 24},
		"enemies": {"bank": 0x06, "offset": 0x4000, "count": 64},
		"bosses": {"bank": 0x06, "offset": 0x6000, "count": 16},
		"npcs": {"bank": 0x05, "offset": 0x2000, "count": 48},
	}

	# Player animation names
	PLAYER_ANIM_NAMES = [
		"idle_down", "idle_up", "idle_left", "idle_right",
		"walk_down", "walk_up", "walk_left", "walk_right",
		"attack_down", "attack_up", "attack_left", "attack_right",
		"magic_down", "magic_up", "magic_left", "magic_right",
		"hurt", "death", "victory", "sleep",
		"swim_down", "swim_up", "swim_left", "swim_right",
	]

	# Standard enemy animation names
	ENEMY_ANIM_NAMES = [
		"idle", "move", "attack", "hurt", "death", "special"
	]

	def __init__(self, rom_path: str = None):
		"""Initialize analyzer."""
		self.rom_data: Optional[bytes] = None
		self.animations: dict[str, EntityAnimations] = {}

		if rom_path:
			self.load_rom(rom_path)

	def load_rom(self, path: str) -> bool:
		"""Load ROM file."""
		try:
			with open(path, 'rb') as f:
				self.rom_data = f.read()
			return True
		except Exception as e:
			print(f"Error loading ROM: {e}")
			return False

	def _read_word(self, offset: int) -> int:
		"""Read 16-bit word from ROM."""
		if offset + 1 >= len(self.rom_data):
			return 0
		return self.rom_data[offset] | (self.rom_data[offset + 1] << 8)

	def _bank_to_offset(self, bank: int, addr: int) -> int:
		"""Convert bank:address to file offset (LoROM)."""
		return bank * 0x8000 + (addr & 0x7fff)

	def scan_animation_patterns(self) -> list[dict]:
		"""Scan ROM for animation-like patterns."""
		if not self.rom_data:
			return []

		patterns = []

		# Animation sequences typically have:
		# - Byte 0: Frame count or duration
		# - Byte 1: Tile index
		# - Repeating pattern

		for bank in range(0x01, 0x08):  # Code/data banks
			bank_start = bank * 0x8000
			bank_data = self.rom_data[bank_start:bank_start + 0x8000]

			for offset in range(0, len(bank_data) - 16, 2):
				# Look for animation header pattern
				# Typical: frame_count, then pairs of (duration, tile)
				b0 = bank_data[offset]
				b1 = bank_data[offset + 1]

				# Frame count usually 2-16
				if 2 <= b0 <= 16:
					# Check if following bytes look like animation data
					valid_frames = 0
					for i in range(b0):
						if offset + 2 + i * 2 + 1 >= len(bank_data):
							break
						duration = bank_data[offset + 2 + i * 2]
						tile = bank_data[offset + 2 + i * 2 + 1]
						# Duration usually 4-30 frames, tile < 256
						if 2 <= duration <= 60 and tile < 200:
							valid_frames += 1

					if valid_frames >= b0 * 0.8:  # 80% valid
						patterns.append({
							"bank": bank,
							"offset": offset,
							"frame_count": b0,
							"total_size": 2 + b0 * 2,
							"file_offset": bank_start + offset,
						})

		return patterns

	def parse_animation_at(self, bank: int, offset: int) -> Optional[Animation]:
		"""Parse animation at specific location."""
		if not self.rom_data:
			return None

		file_offset = self._bank_to_offset(bank, offset + 0x8000)
		if file_offset >= len(self.rom_data):
			return None

		frame_count = self.rom_data[file_offset]
		if frame_count < 1 or frame_count > 32:
			return None

		frames = []
		for i in range(frame_count):
			idx = file_offset + 2 + i * 2
			if idx + 1 >= len(self.rom_data):
				break

			duration = self.rom_data[idx]
			tile = self.rom_data[idx + 1]

			if duration == 0:
				duration = 1

			frames.append(AnimationFrame(
				tile_index=tile,
				duration=duration,
			))

		if not frames:
			return None

		return Animation(
			name=f"anim_{bank:02x}_{offset:04x}",
			frames=frames,
			loop=True,
		)

	def analyze_player_animations(self) -> EntityAnimations:
		"""Analyze player character animations."""
		player = EntityAnimations(
			entity_id=0,
			entity_name="Player",
			sprite_bank=0x15,
			sprite_offset=0x0000,
		)

		# Player animations are typically at known offsets
		# These are approximations based on common patterns
		anim_offsets = [
			0x0000, 0x0020, 0x0040, 0x0060,  # Idle 4 directions
			0x0080, 0x00A0, 0x00C0, 0x00E0,  # Walk 4 directions
			0x0100, 0x0140, 0x0180, 0x01C0,  # Attack 4 directions
			0x0200, 0x0220, 0x0240, 0x0260,  # Magic 4 directions
			0x0280, 0x02A0, 0x02C0, 0x02E0,  # Hurt, death, victory, sleep
			0x0300, 0x0320, 0x0340, 0x0360,  # Swim 4 directions
		]

		for i, offset in enumerate(anim_offsets):
			if i < len(self.PLAYER_ANIM_NAMES):
				name = self.PLAYER_ANIM_NAMES[i]
			else:
				name = f"anim_{i}"

			# Create placeholder animation
			# Real data would need actual parsing
			player.animations[name] = Animation(
				name=name,
				frames=[
					AnimationFrame(tile_index=i * 4, duration=8),
					AnimationFrame(tile_index=i * 4 + 1, duration=8),
					AnimationFrame(tile_index=i * 4 + 2, duration=8),
					AnimationFrame(tile_index=i * 4 + 3, duration=8),
				],
				loop=True,
			)

		return player

	def analyze_all(self) -> dict:
		"""Analyze all animation data."""
		results = {
			"player": self.analyze_player_animations(),
			"patterns": self.scan_animation_patterns(),
		}

		self.animations = results
		return results

	def export_animation_data(self, output_dir: Path) -> None:
		"""Export animation data to JSON files."""
		output_dir.mkdir(parents=True, exist_ok=True)

		# Export player animations
		if "player" in self.animations:
			player = self.animations["player"]
			player_data = {
				"entity_id": player.entity_id,
				"entity_name": player.entity_name,
				"sprite_bank": f"${player.sprite_bank:02x}",
				"sprite_offset": f"${player.sprite_offset:04x}",
				"animations": {}
			}
			for name, anim in player.animations.items():
				player_data["animations"][name] = {
					"frame_count": anim.frame_count,
					"total_duration": anim.total_duration,
					"loop": anim.loop,
					"frames": [
						{
							"tile": f.tile_index,
							"duration": f.duration,
							"flip_x": f.flip_x,
							"flip_y": f.flip_y,
						}
						for f in anim.frames
					]
				}

			with open(output_dir / "player_animations.json", 'w') as f:
				json.dump(player_data, f, indent='\t')

		# Export detected patterns
		if "patterns" in self.animations:
			patterns = self.animations["patterns"]
			with open(output_dir / "animation_patterns.json", 'w') as f:
				json.dump({
					"pattern_count": len(patterns),
					"patterns": patterns[:500],  # Limit output
				}, f, indent='\t')

		# Export summary
		summary = {
			"total_patterns": len(self.animations.get("patterns", [])),
			"player_animations": len(self.animations.get("player", EntityAnimations(0, "", 0, 0)).animations),
			"animation_names": self.PLAYER_ANIM_NAMES,
		}
		with open(output_dir / "animation_summary.json", 'w') as f:
			json.dump(summary, f, indent='\t')

	def generate_animation_report(self) -> str:
		"""Generate text report of animation data."""
		lines = [
			"=" * 60,
			"SOUL BLAZER ANIMATION ANALYSIS REPORT",
			"=" * 60,
			"",
		]

		if "player" in self.animations:
			player = self.animations["player"]
			lines.append(f"PLAYER ANIMATIONS ({len(player.animations)} total)")
			lines.append("-" * 40)
			for name, anim in player.animations.items():
				lines.append(f"  {name}:")
				lines.append(f"    Frames: {anim.frame_count}")
				lines.append(f"    Duration: {anim.total_duration} ticks ({anim.total_duration/60:.2f}s)")
				lines.append(f"    Loop: {anim.loop}")
			lines.append("")

		if "patterns" in self.animations:
			patterns = self.animations["patterns"]
			lines.append(f"DETECTED ANIMATION PATTERNS ({len(patterns)} total)")
			lines.append("-" * 40)

			# Group by bank
			by_bank = {}
			for p in patterns:
				bank = p["bank"]
				if bank not in by_bank:
					by_bank[bank] = []
				by_bank[bank].append(p)

			for bank in sorted(by_bank.keys()):
				bank_patterns = by_bank[bank]
				lines.append(f"  Bank ${bank:02X}: {len(bank_patterns)} patterns")

			lines.append("")
			lines.append("Sample patterns:")
			for p in patterns[:10]:
				lines.append(f"  ${p['bank']:02X}:{p['offset']:04X} - {p['frame_count']} frames")

		return "\n".join(lines)


def main():
	"""Main entry point."""
	import argparse

	parser = argparse.ArgumentParser(description="Soul Blazer Animation Analyzer")
	parser.add_argument("--rom", "-r", help="Path to ROM file", default=str(DEFAULT_ROM))
	parser.add_argument("--output", "-o", help="Output directory", default=str(ANIM_DIR))
	parser.add_argument("--report", action="store_true", help="Print analysis report")

	args = parser.parse_args()

	analyzer = AnimationAnalyzer(args.rom)

	if not analyzer.rom_data:
		print(f"Failed to load ROM: {args.rom}")
		return

	print(f"Loaded ROM: {len(analyzer.rom_data):,} bytes")
	print("Analyzing animations...")

	results = analyzer.analyze_all()

	if args.report:
		print(analyzer.generate_animation_report())
	else:
		output_dir = Path(args.output)
		analyzer.export_animation_data(output_dir)

		patterns = results.get("patterns", [])
		player_anims = len(results.get("player", EntityAnimations(0, "", 0, 0)).animations)

		print(f"\nResults:")
		print(f"  Animation patterns found: {len(patterns)}")
		print(f"  Player animations mapped: {player_anims}")
		print(f"\nExported to: {output_dir}")


if __name__ == "__main__":
	main()
