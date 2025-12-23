#!/usr/bin/env python3
"""
SPC Exporter - Generate playable SPC audio files from Soul Blazer ROM

This tool extracts the SPC700 audio driver and music data to create
standalone SPC files that can be played in SPC players.

SPC files are self-contained snapshots of the SNES audio subsystem
that include the SPC700 code, sample data, and register state.
"""

import struct
import json
from pathlib import Path
from dataclasses import dataclass, field
from typing import Optional
from enum import IntEnum


class SpcRegister(IntEnum):
	"""SPC700 DSP registers"""
	MVOLL = 0x0C  # Main volume left
	MVOLR = 0x1C  # Main volume right
	EVOLL = 0x2C  # Echo volume left
	EVOLR = 0x3C  # Echo volume right
	KON = 0x4C    # Key on
	KOFF = 0x5C   # Key off
	FLG = 0x6C    # Flags
	ENDX = 0x7C   # End of sample
	EFB = 0x0D    # Echo feedback
	PMON = 0x2D   # Pitch modulation
	NON = 0x3D    # Noise enable
	EON = 0x4D    # Echo enable
	DIR = 0x5D    # Sample directory
	ESA = 0x6D    # Echo buffer start
	EDL = 0x7D    # Echo delay


@dataclass
class SpcHeader:
	"""SPC file header (256 bytes)"""
	signature: bytes = b"SNES-SPC700 Sound File Data v0.30"
	tag26: int = 0x1A
	tag27: int = 0x1A
	has_id666: int = 1  # 26 = has ID666, 27 = no ID666
	version_minor: int = 30
	
	# SPC700 registers at transfer
	pc: int = 0x0400      # Program counter
	a: int = 0x00         # Accumulator
	x: int = 0x00         # X register
	y: int = 0x00         # Y register
	psw: int = 0x00       # Processor status word
	sp: int = 0xEF        # Stack pointer
	
	# ID666 tag fields
	song_title: str = "Unknown"
	game_title: str = "Soul Blazer"
	dumper: str = "GameInfo Tools"
	comments: str = "Extracted from Soul Blazer (U)"
	dump_date: str = ""
	seconds_to_play: int = 180
	fade_length: int = 5000
	artist: str = "Yukihide Takekawa"
	
	def to_bytes(self) -> bytes:
		"""Generate 256-byte SPC header"""
		data = bytearray(256)
		
		# Signature (33 bytes)
		data[0:33] = self.signature.ljust(33, b'\x00')
		data[0x21] = self.tag26
		data[0x22] = self.tag27
		data[0x23] = self.has_id666
		data[0x24] = self.version_minor
		
		# Registers (5 bytes starting at 0x25)
		data[0x25] = self.pc & 0xFF
		data[0x26] = (self.pc >> 8) & 0xFF
		data[0x27] = self.a
		data[0x28] = self.x
		data[0x29] = self.y
		data[0x2A] = self.psw
		data[0x2B] = self.sp
		
		# Reserved (2 bytes at 0x2C-0x2D)
		data[0x2C] = 0x00
		data[0x2D] = 0x00
		
		# ID666 text format (starting at 0x2E)
		def write_str(offset: int, value: str, length: int):
			encoded = value.encode('ascii', errors='replace')[:length]
			data[offset:offset+len(encoded)] = encoded
		
		write_str(0x2E, self.song_title, 32)      # Song title
		write_str(0x4E, self.game_title, 32)      # Game title
		write_str(0x6E, self.dumper, 16)          # Dumper name
		write_str(0x7E, self.comments, 32)        # Comments
		write_str(0x9E, self.dump_date, 11)       # Dump date (MM/DD/YYYY)
		
		# Seconds to play (3 bytes at 0xA9)
		seconds_str = str(self.seconds_to_play)[:3].ljust(3, '0')
		data[0xA9:0xAC] = seconds_str.encode('ascii')
		
		# Fade length (5 bytes at 0xAC)
		fade_str = str(self.fade_length)[:5].ljust(5, '0')
		data[0xAC:0xB1] = fade_str.encode('ascii')
		
		write_str(0xB1, self.artist, 32)          # Artist name
		
		# Default channel enables (1 byte at 0xD1)
		data[0xD1] = 0x00  # 0 = default channel enables
		
		# Emulator used (1 byte at 0xD2)
		data[0xD2] = 0x00  # Unknown/other
		
		return bytes(data)


@dataclass
class MusicTrack:
	"""Music track metadata"""
	track_id: int
	name: str
	pointer_offset: int    # ROM offset to track pointer
	data_offset: int       # ROM offset to track data
	duration: int = 180    # Estimated duration in seconds


@dataclass
class SpcExporter:
	"""Exports SPC audio files from Soul Blazer ROM"""
	
	rom_path: Path
	output_dir: Path
	rom_data: bytes = field(default=b'', repr=False)
	
	# Soul Blazer audio constants
	AUDIO_DRIVER_BANK: int = 0x0F
	AUDIO_DRIVER_OFFSET: int = 0x078000  # LoROM: $0F:8000
	AUDIO_DRIVER_SIZE: int = 0x1000      # ~4KB driver
	
	SAMPLE_DIR_BANK: int = 0x0F
	SAMPLE_DIR_OFFSET: int = 0x079000    # Sample directory
	SAMPLE_DIR_SIZE: int = 0x0400        # Directory table
	
	BRR_SAMPLES_OFFSET: int = 0x07A000   # BRR sample data start
	BRR_SAMPLES_SIZE: int = 0x6000       # ~24KB samples
	
	MUSIC_POINTER_OFFSET: int = 0x0D8000  # Music pointer table
	
	# SPC700 memory layout
	SPC_DRIVER_ADDR: int = 0x0400        # Load driver at $0400
	SPC_DIR_ADDR: int = 0x1400           # Sample directory
	SPC_SAMPLES_ADDR: int = 0x2000       # BRR samples
	SPC_SONG_ADDR: int = 0x0200          # Song data location
	
	# Known music tracks
	TRACKS: list = field(default_factory=lambda: [
		MusicTrack(0x00, "Title Screen", 0x0D8000, 0x0D8100, 120),
		MusicTrack(0x01, "Grass Valley", 0x0D8002, 0x0D8200, 180),
		MusicTrack(0x02, "GreenWood", 0x0D8004, 0x0D8400, 180),
		MusicTrack(0x03, "Underground Castle", 0x0D8006, 0x0D8600, 150),
		MusicTrack(0x04, "Lost Side", 0x0D8008, 0x0D8800, 180),
		MusicTrack(0x05, "St Elle's Mountain", 0x0D800A, 0x0D8A00, 180),
		MusicTrack(0x06, "Dr Leo's Lab", 0x0D800C, 0x0D8C00, 180),
		MusicTrack(0x07, "Seabed Castle", 0x0D800E, 0x0D8E00, 180),
		MusicTrack(0x08, "Model Town", 0x0D8010, 0x0D9000, 150),
		MusicTrack(0x09, "The World of Evil", 0x0D8012, 0x0D9200, 180),
		MusicTrack(0x0A, "Boss Battle", 0x0D8014, 0x0D9400, 90),
		MusicTrack(0x0B, "Deathtoll Battle", 0x0D8016, 0x0D9600, 180),
		MusicTrack(0x0C, "Peaceful Village", 0x0D8018, 0x0D9800, 180),
		MusicTrack(0x0D, "Soul Shrine", 0x0D801A, 0x0D9A00, 120),
		MusicTrack(0x0E, "Ending Theme", 0x0D801C, 0x0D9C00, 300),
		MusicTrack(0x0F, "Staff Roll", 0x0D801E, 0x0D9E00, 240),
		MusicTrack(0x10, "Level Up", 0x0D8020, 0x0DA000, 5),
		MusicTrack(0x11, "Item Get", 0x0D8022, 0x0DA100, 3),
		MusicTrack(0x12, "Soul Released", 0x0D8024, 0x0DA200, 8),
		MusicTrack(0x13, "Lair Cleared", 0x0D8026, 0x0DA300, 5),
		MusicTrack(0x14, "Game Over", 0x0D8028, 0x0DA400, 15),
		MusicTrack(0x15, "Sword Magic", 0x0D802A, 0x0DA500, 2),
	])
	
	def __post_init__(self):
		if not self.rom_data:
			self.load_rom()
		self.output_dir.mkdir(parents=True, exist_ok=True)
	
	def load_rom(self):
		"""Load ROM file"""
		self.rom_data = self.rom_path.read_bytes()
		print(f"Loaded ROM: {len(self.rom_data):,} bytes")
	
	def extract_audio_driver(self) -> bytes:
		"""Extract the SPC700 audio driver code"""
		return self.rom_data[self.AUDIO_DRIVER_OFFSET:
			self.AUDIO_DRIVER_OFFSET + self.AUDIO_DRIVER_SIZE]
	
	def extract_sample_directory(self) -> bytes:
		"""Extract sample directory table"""
		return self.rom_data[self.SAMPLE_DIR_OFFSET:
			self.SAMPLE_DIR_OFFSET + self.SAMPLE_DIR_SIZE]
	
	def extract_brr_samples(self) -> bytes:
		"""Extract BRR sample data"""
		return self.rom_data[self.BRR_SAMPLES_OFFSET:
			self.BRR_SAMPLES_OFFSET + self.BRR_SAMPLES_SIZE]
	
	def extract_track_data(self, track: MusicTrack) -> bytes:
		"""Extract music track sequence data"""
		# Read pointer to get actual data location
		if track.data_offset < len(self.rom_data):
			# Read ~2KB of track data (variable length)
			end_offset = min(track.data_offset + 0x800, len(self.rom_data))
			return self.rom_data[track.data_offset:end_offset]
		return b'\x00' * 0x100
	
	def build_spc_ram(self, track: MusicTrack) -> bytes:
		"""Build 64KB SPC RAM image with driver, samples, and song data"""
		ram = bytearray(0x10000)  # 64KB
		
		# Zero-page and stack area ($0000-$00FF) - initialized to zero
		
		# Load audio driver at $0400
		driver = self.extract_audio_driver()
		driver_end = min(self.SPC_DRIVER_ADDR + len(driver), 0x10000)
		ram[self.SPC_DRIVER_ADDR:driver_end] = driver[:driver_end - self.SPC_DRIVER_ADDR]
		
		# Load sample directory at $1400
		sample_dir = self.extract_sample_directory()
		dir_end = min(self.SPC_DIR_ADDR + len(sample_dir), 0x10000)
		ram[self.SPC_DIR_ADDR:dir_end] = sample_dir[:dir_end - self.SPC_DIR_ADDR]
		
		# Load BRR samples at $2000
		samples = self.extract_brr_samples()
		samples_end = min(self.SPC_SAMPLES_ADDR + len(samples), 0x10000)
		ram[self.SPC_SAMPLES_ADDR:samples_end] = samples[:samples_end - self.SPC_SAMPLES_ADDR]
		
		# Load track data at $0200
		track_data = self.extract_track_data(track)
		track_end = min(self.SPC_SONG_ADDR + len(track_data), self.SPC_DRIVER_ADDR)
		ram[self.SPC_SONG_ADDR:track_end] = track_data[:track_end - self.SPC_SONG_ADDR]
		
		# Set up driver parameters
		ram[0x00] = track.track_id  # Current track ID
		ram[0x01] = 0x00            # Play mode (0 = start)
		ram[0x02] = 0x7F            # Master volume
		ram[0x03] = 0x00            # Tempo modifier
		
		return bytes(ram)
	
	def build_dsp_registers(self) -> bytes:
		"""Build 128-byte DSP register state"""
		dsp = bytearray(128)
		
		# Set up initial DSP state
		dsp[SpcRegister.MVOLL] = 0x7F  # Main volume left
		dsp[SpcRegister.MVOLR] = 0x7F  # Main volume right
		dsp[SpcRegister.EVOLL] = 0x20  # Echo volume left
		dsp[SpcRegister.EVOLR] = 0x20  # Echo volume right
		dsp[SpcRegister.FLG] = 0x60    # Flags (echo disabled, noise clock)
		dsp[SpcRegister.EFB] = 0x40    # Echo feedback
		dsp[SpcRegister.DIR] = self.SPC_DIR_ADDR >> 8  # Sample directory page
		dsp[SpcRegister.ESA] = 0xC0    # Echo buffer start
		dsp[SpcRegister.EDL] = 0x04    # Echo delay
		
		# Initialize all 8 voice registers
		for voice in range(8):
			base = voice * 0x10
			dsp[base + 0x00] = 0x7F  # VOL_L - Voice volume left
			dsp[base + 0x01] = 0x7F  # VOL_R - Voice volume right
			dsp[base + 0x02] = 0x00  # PITCH_L - Pitch low
			dsp[base + 0x03] = 0x10  # PITCH_H - Pitch high
			dsp[base + 0x04] = 0x00  # SRCN - Source number
			dsp[base + 0x05] = 0x7F  # ADSR1 - Attack/Decay
			dsp[base + 0x06] = 0xE0  # ADSR2 - Sustain/Release
			dsp[base + 0x07] = 0x00  # GAIN - Gain
		
		return bytes(dsp)
	
	def export_track(self, track: MusicTrack) -> Path:
		"""Export a single track as SPC file"""
		# Build header
		header = SpcHeader(
			song_title=track.name,
			seconds_to_play=track.duration,
			pc=self.SPC_DRIVER_ADDR
		)
		
		# Build SPC RAM
		ram = self.build_spc_ram(track)
		
		# Build DSP registers
		dsp = self.build_dsp_registers()
		
		# Extra RAM (64 bytes) - not used
		extra_ram = b'\x00' * 64
		
		# Combine all parts
		spc_data = header.to_bytes() + ram + dsp + extra_ram
		
		# Verify size (standard SPC is 66048 bytes without extended info)
		expected_size = 256 + 0x10000 + 128 + 64
		assert len(spc_data) == expected_size, f"SPC size mismatch: {len(spc_data)} != {expected_size}"
		
		# Write file
		safe_name = "".join(c if c.isalnum() or c in " -_" else "_" for c in track.name)
		output_path = self.output_dir / f"{track.track_id:02X} - {safe_name}.spc"
		output_path.write_bytes(spc_data)
		
		return output_path
	
	def export_all_tracks(self) -> list[Path]:
		"""Export all known tracks as SPC files"""
		exported = []
		
		print(f"\nExporting {len(self.TRACKS)} tracks to SPC format...")
		print(f"Output directory: {self.output_dir}")
		print("-" * 60)
		
		for track in self.TRACKS:
			try:
				output_path = self.export_track(track)
				print(f"  [{track.track_id:02X}] {track.name}: {output_path.name}")
				exported.append(output_path)
			except Exception as e:
				print(f"  [{track.track_id:02X}] {track.name}: FAILED - {e}")
		
		print("-" * 60)
		print(f"Exported {len(exported)}/{len(self.TRACKS)} tracks")
		
		return exported
	
	def export_catalog(self) -> Path:
		"""Export track catalog to JSON"""
		catalog = {
			"game": "Soul Blazer",
			"platform": "SNES",
			"composer": "Yukihide Takekawa",
			"total_tracks": len(self.TRACKS),
			"tracks": []
		}
		
		for track in self.TRACKS:
			catalog["tracks"].append({
				"id": f"0x{track.track_id:02X}",
				"name": track.name,
				"duration_seconds": track.duration,
				"pointer_offset": f"0x{track.pointer_offset:06X}",
				"data_offset": f"0x{track.data_offset:06X}"
			})
		
		output_path = self.output_dir / "spc_catalog.json"
		output_path.write_text(json.dumps(catalog, indent=2))
		print(f"\nTrack catalog: {output_path}")
		
		return output_path
	
	def analyze_audio_data(self):
		"""Analyze audio data in ROM and print summary"""
		print("\n" + "=" * 60)
		print("AUDIO DATA ANALYSIS")
		print("=" * 60)
		
		# Driver info
		driver = self.extract_audio_driver()
		print(f"\nAudio Driver:")
		print(f"  Location: ${self.AUDIO_DRIVER_OFFSET:06X}")
		print(f"  Size: {len(driver):,} bytes")
		print(f"  First bytes: {driver[:16].hex()}")
		
		# Sample directory
		sample_dir = self.extract_sample_directory()
		print(f"\nSample Directory:")
		print(f"  Location: ${self.SAMPLE_DIR_OFFSET:06X}")
		print(f"  Size: {len(sample_dir):,} bytes")
		
		# Count samples by looking for valid directory entries
		sample_count = 0
		for i in range(0, min(len(sample_dir), 256), 4):
			start = struct.unpack('<H', sample_dir[i:i+2])[0]
			loop = struct.unpack('<H', sample_dir[i+2:i+4])[0]
			if 0x2000 <= start < 0xFFFF and (loop == 0 or 0x2000 <= loop < 0xFFFF):
				sample_count += 1
		print(f"  Valid samples: ~{sample_count}")
		
		# BRR samples
		samples = self.extract_brr_samples()
		print(f"\nBRR Samples:")
		print(f"  Location: ${self.BRR_SAMPLES_OFFSET:06X}")
		print(f"  Size: {len(samples):,} bytes")
		
		# Track summary
		print(f"\nMusic Tracks: {len(self.TRACKS)}")
		print(f"  BGM tracks: {sum(1 for t in self.TRACKS if t.duration >= 30)}")
		print(f"  Jingles: {sum(1 for t in self.TRACKS if t.duration < 30)}")
		
		# Total audio footprint
		total = len(driver) + len(sample_dir) + len(samples)
		print(f"\nTotal Audio Data: {total:,} bytes ({total/1024:.1f} KB)")
		print(f"  Percentage of ROM: {100*total/len(self.rom_data):.1f}%")


def main():
	"""Main entry point"""
	import argparse
	
	parser = argparse.ArgumentParser(description="Soul Blazer SPC Exporter")
	parser.add_argument("--rom", type=Path, help="ROM file path")
	parser.add_argument("--output", type=Path, default=Path("../assets/audio/spc"),
		help="Output directory for SPC files")
	parser.add_argument("--track", type=lambda x: int(x, 0),
		help="Export specific track (hex ID, e.g., 0x00)")
	parser.add_argument("--list", action="store_true",
		help="List all known tracks")
	parser.add_argument("--analyze", action="store_true",
		help="Analyze audio data in ROM")
	parser.add_argument("--catalog", action="store_true",
		help="Export track catalog to JSON")
	
	args = parser.parse_args()
	
	# Default ROM path
	rom_path = args.rom or Path(__file__).parent.parent.parent.parent.parent / \
		"~roms/SNES/GoodSNES/Soul Blazer (U) [!].sfc"
	
	if not rom_path.exists():
		print(f"Error: ROM file not found: {rom_path}")
		print("Please specify ROM path with --rom")
		return 1
	
	# Resolve output path
	output_dir = args.output
	if not output_dir.is_absolute():
		output_dir = Path(__file__).parent / output_dir
	
	exporter = SpcExporter(rom_path=rom_path, output_dir=output_dir)
	
	if args.list:
		print("\nKnown Music Tracks:")
		print("-" * 50)
		for track in exporter.TRACKS:
			print(f"  [{track.track_id:02X}] {track.name} ({track.duration}s)")
		return 0
	
	if args.analyze:
		exporter.analyze_audio_data()
		return 0
	
	if args.catalog:
		exporter.export_catalog()
		return 0
	
	if args.track is not None:
		# Export specific track
		track = next((t for t in exporter.TRACKS if t.track_id == args.track), None)
		if track:
			path = exporter.export_track(track)
			print(f"Exported: {path}")
		else:
			print(f"Error: Track 0x{args.track:02X} not found")
			return 1
	else:
		# Export all tracks
		exporter.export_all_tracks()
		exporter.export_catalog()
	
	return 0


if __name__ == "__main__":
	exit(main())
