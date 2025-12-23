#!/usr/bin/env python3
"""
Soul Blazer (SNES) Audio Player
Plays and exports SPC audio data from the game.
"""

import json
import struct
import tkinter as tk
from tkinter import ttk, filedialog, messagebox
from pathlib import Path
from dataclasses import dataclass
from typing import Optional
from enum import IntEnum
import wave
import io


# Paths
SCRIPT_DIR = Path(__file__).parent
ASSETS_DIR = SCRIPT_DIR.parent / "assets"
AUDIO_DIR = ASSETS_DIR / "audio"
DEFAULT_ROM = Path(r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Soul Blazer (U) [!].sfc")


class SoundType(IntEnum):
	"""Sound type enumeration."""
	BGM = 0         # Background music
	SFX = 1         # Sound effects
	JINGLE = 2      # Short jingles


@dataclass
class SoundEntry:
	"""Sound entry from ROM."""
	sound_id: int
	sound_type: SoundType
	name: str
	bank: int
	offset: int
	size: int
	sample_rate: int = 32000
	channels: int = 2


@dataclass
class BRRSample:
	"""BRR (Bit Rate Reduction) audio sample."""
	sample_id: int
	offset: int
	loop_point: int
	length: int
	data: bytes


class AudioExtractor:
	"""Extract and decode audio data from Soul Blazer ROM."""

	# Soul Blazer audio data locations
	MUSIC_BANK = 0x0D      # Bank $0D - Music data
	SFX_BANK = 0x0E        # Bank $0E - Sound effects
	SAMPLE_BANK = 0x0F     # Bank $0F - BRR samples

	# Song pointer table
	SONG_TABLE = 0x068000  # Bank $0D offset $0000
	SFX_TABLE = 0x070000   # Bank $0E offset $0000

	# Known songs
	SONGS = [
		SoundEntry(0x00, SoundType.BGM, "Title Screen", 0x0D, 0x0100, 0x800),
		SoundEntry(0x01, SoundType.BGM, "Grass Valley", 0x0D, 0x0900, 0x1000),
		SoundEntry(0x02, SoundType.BGM, "Underground Castle", 0x0D, 0x1900, 0x0E00),
		SoundEntry(0x03, SoundType.BGM, "GreenWood", 0x0D, 0x2700, 0x0C00),
		SoundEntry(0x04, SoundType.BGM, "Water Shrine", 0x0D, 0x3300, 0x0A00),
		SoundEntry(0x05, SoundType.BGM, "St. Elles", 0x0D, 0x3D00, 0x0E00),
		SoundEntry(0x06, SoundType.BGM, "Seabed", 0x0D, 0x4B00, 0x0C00),
		SoundEntry(0x07, SoundType.BGM, "Mountain of Souls", 0x0D, 0x5700, 0x0B00),
		SoundEntry(0x08, SoundType.BGM, "Leo's Lab", 0x0D, 0x6200, 0x0D00),
		SoundEntry(0x09, SoundType.BGM, "Model Town", 0x0D, 0x6F00, 0x0A00),
		SoundEntry(0x0A, SoundType.BGM, "Magridd Castle", 0x0D, 0x7900, 0x0F00),
		SoundEntry(0x0B, SoundType.BGM, "Castle Dungeon", 0x0D, 0x8800, 0x0C00),
		SoundEntry(0x0C, SoundType.BGM, "World of Evil", 0x0D, 0x9400, 0x1100),
		SoundEntry(0x0D, SoundType.BGM, "Boss Battle", 0x0D, 0xA500, 0x0E00),
		SoundEntry(0x0E, SoundType.BGM, "Deathtoll Battle", 0x0D, 0xB300, 0x1200),
		SoundEntry(0x0F, SoundType.BGM, "Ending Theme", 0x0D, 0xC500, 0x1400),
		SoundEntry(0x10, SoundType.BGM, "Staff Roll", 0x0D, 0xD900, 0x1000),
		SoundEntry(0x11, SoundType.JINGLE, "Level Up", 0x0D, 0xE900, 0x0200),
		SoundEntry(0x12, SoundType.JINGLE, "Soul Released", 0x0D, 0xEB00, 0x0300),
		SoundEntry(0x13, SoundType.JINGLE, "Item Get", 0x0D, 0xEE00, 0x0180),
		SoundEntry(0x14, SoundType.JINGLE, "Boss Defeated", 0x0D, 0xEF80, 0x0400),
		SoundEntry(0x15, SoundType.JINGLE, "Game Over", 0x0D, 0xF380, 0x0380),
	]

	# Known sound effects
	SFX = [
		SoundEntry(0x00, SoundType.SFX, "Sword Slash", 0x0E, 0x0100, 0x0080),
		SoundEntry(0x01, SoundType.SFX, "Enemy Hit", 0x0E, 0x0180, 0x0060),
		SoundEntry(0x02, SoundType.SFX, "Player Hit", 0x0E, 0x01E0, 0x0080),
		SoundEntry(0x03, SoundType.SFX, "Enemy Death", 0x0E, 0x0260, 0x00A0),
		SoundEntry(0x04, SoundType.SFX, "Magic Cast", 0x0E, 0x0300, 0x00C0),
		SoundEntry(0x05, SoundType.SFX, "Menu Select", 0x0E, 0x03C0, 0x0040),
		SoundEntry(0x06, SoundType.SFX, "Menu Confirm", 0x0E, 0x0400, 0x0040),
		SoundEntry(0x07, SoundType.SFX, "Menu Cancel", 0x0E, 0x0440, 0x0040),
		SoundEntry(0x08, SoundType.SFX, "Chest Open", 0x0E, 0x0480, 0x0080),
		SoundEntry(0x09, SoundType.SFX, "Door Open", 0x0E, 0x0500, 0x0080),
		SoundEntry(0x0A, SoundType.SFX, "Warp", 0x0E, 0x0580, 0x0100),
		SoundEntry(0x0B, SoundType.SFX, "Soul Absorb", 0x0E, 0x0680, 0x00C0),
		SoundEntry(0x0C, SoundType.SFX, "Explosion", 0x0E, 0x0740, 0x0100),
		SoundEntry(0x0D, SoundType.SFX, "Fire Magic", 0x0E, 0x0840, 0x00E0),
		SoundEntry(0x0E, SoundType.SFX, "Ice Magic", 0x0E, 0x0920, 0x00E0),
		SoundEntry(0x0F, SoundType.SFX, "Light Magic", 0x0E, 0x0A00, 0x00D0),
	]

	def __init__(self, rom_path: str = None):
		"""Initialize extractor."""
		self.rom_data: Optional[bytes] = None
		self.samples: list[BRRSample] = []

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

	def snes_to_file(self, snes_addr: int) -> int:
		"""Convert SNES address to file offset (LoROM)."""
		bank = (snes_addr >> 16) & 0x7F
		offset = snes_addr & 0x7FFF
		return (bank * 0x8000) + offset

	def extract_song_data(self, song: SoundEntry) -> bytes:
		"""Extract raw song data from ROM."""
		if not self.rom_data:
			return b""

		file_offset = (song.bank * 0x8000) + song.offset
		return self.rom_data[file_offset:file_offset + song.size]

	def decode_brr_block(self, block: bytes) -> list[int]:
		"""Decode a single BRR block (9 bytes) to 16 samples."""
		if len(block) < 9:
			return [0] * 16

		header = block[0]
		shift = (header >> 4) & 0x0F
		filter_mode = (header >> 2) & 0x03

		samples = []
		prev1, prev2 = 0, 0

		for i in range(1, 9):
			byte = block[i]
			# Each byte contains 2 4-bit samples
			for nibble in [(byte >> 4) & 0x0F, byte & 0x0F]:
				# Sign extend 4-bit value
				if nibble >= 8:
					nibble -= 16

				# Apply shift
				sample = nibble << shift

				# Apply filter
				if filter_mode == 1:
					sample += prev1 + (-prev1 >> 4)
				elif filter_mode == 2:
					sample += (prev1 * 2) + ((-prev1 * 3) >> 5) - prev2 + (prev2 >> 4)
				elif filter_mode == 3:
					sample += (prev1 * 2) + ((-prev1 * 13) >> 6) - prev2 + ((prev2 * 3) >> 4)

				# Clamp to 16-bit range
				sample = max(-32768, min(32767, sample))

				samples.append(sample)
				prev2 = prev1
				prev1 = sample

		return samples

	def export_to_wav(self, sound: SoundEntry, output_path: Path) -> bool:
		"""Export sound to WAV file."""
		if not self.rom_data:
			return False

		try:
			data = self.extract_song_data(sound)
			if not data:
				return False

			# Decode BRR data
			samples = []
			for i in range(0, len(data) - 8, 9):
				block = data[i:i+9]
				samples.extend(self.decode_brr_block(block))

			if not samples:
				return False

			# Write WAV file
			output_path.parent.mkdir(parents=True, exist_ok=True)
			with wave.open(str(output_path), 'w') as wav:
				wav.setnchannels(1)  # Mono
				wav.setsampwidth(2)  # 16-bit
				wav.setframerate(sound.sample_rate)
				wav.writeframes(struct.pack(f"<{len(samples)}h", *samples))

			return True

		except Exception as e:
			print(f"Error exporting WAV: {e}")
			return False

	def export_to_json(self, output_path: Path) -> None:
		"""Export audio catalog to JSON."""
		data = {
			"songs": [
				{
					"id": f"${s.sound_id:02X}",
					"type": s.sound_type.name,
					"name": s.name,
					"bank": f"${s.bank:02X}",
					"offset": f"${s.offset:04X}",
					"size": f"${s.size:04X}",
				}
				for s in self.SONGS
			],
			"sfx": [
				{
					"id": f"${s.sound_id:02X}",
					"name": s.name,
					"bank": f"${s.bank:02X}",
					"offset": f"${s.offset:04X}",
					"size": f"${s.size:04X}",
				}
				for s in self.SFX
			],
		}

		output_path.parent.mkdir(parents=True, exist_ok=True)
		with open(output_path, 'w') as f:
			json.dump(data, f, indent='\t')


class AudioPlayer(tk.Tk):
	"""GUI audio player for Soul Blazer."""

	def __init__(self):
		super().__init__()

		self.title("Soul Blazer Audio Player")
		self.geometry("800x600")

		self.extractor = AudioExtractor()
		self.current_sound: Optional[SoundEntry] = None

		self.setup_ui()
		self.populate_lists()

	def setup_ui(self):
		"""Set up the user interface."""
		# Main paned window
		paned = ttk.PanedWindow(self, orient=tk.HORIZONTAL)
		paned.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)

		# Left panel - Sound lists
		left_frame = ttk.Frame(paned)
		paned.add(left_frame, weight=1)

		# Notebook for BGM/SFX
		self.notebook = ttk.Notebook(left_frame)
		self.notebook.pack(fill=tk.BOTH, expand=True)

		# BGM tab
		bgm_frame = ttk.Frame(self.notebook)
		self.notebook.add(bgm_frame, text="Music")

		self.bgm_list = ttk.Treeview(bgm_frame, columns=("id", "name", "type"), show="headings")
		self.bgm_list.heading("id", text="ID")
		self.bgm_list.heading("name", text="Name")
		self.bgm_list.heading("type", text="Type")
		self.bgm_list.column("id", width=50)
		self.bgm_list.column("name", width=200)
		self.bgm_list.column("type", width=80)
		self.bgm_list.pack(fill=tk.BOTH, expand=True)
		self.bgm_list.bind("<<TreeviewSelect>>", self.on_bgm_select)

		bgm_scroll = ttk.Scrollbar(bgm_frame, orient=tk.VERTICAL, command=self.bgm_list.yview)
		self.bgm_list.configure(yscrollcommand=bgm_scroll.set)

		# SFX tab
		sfx_frame = ttk.Frame(self.notebook)
		self.notebook.add(sfx_frame, text="Sound Effects")

		self.sfx_list = ttk.Treeview(sfx_frame, columns=("id", "name"), show="headings")
		self.sfx_list.heading("id", text="ID")
		self.sfx_list.heading("name", text="Name")
		self.sfx_list.column("id", width=50)
		self.sfx_list.column("name", width=200)
		self.sfx_list.pack(fill=tk.BOTH, expand=True)
		self.sfx_list.bind("<<TreeviewSelect>>", self.on_sfx_select)

		# Right panel - Details and controls
		right_frame = ttk.Frame(paned)
		paned.add(right_frame, weight=2)

		# Sound info
		info_frame = ttk.LabelFrame(right_frame, text="Sound Information")
		info_frame.pack(fill=tk.X, padx=5, pady=5)

		self.info_text = tk.Text(info_frame, height=8, wrap=tk.WORD)
		self.info_text.pack(fill=tk.X, padx=5, pady=5)

		# Playback controls
		control_frame = ttk.LabelFrame(right_frame, text="Playback Controls")
		control_frame.pack(fill=tk.X, padx=5, pady=5)

		btn_frame = ttk.Frame(control_frame)
		btn_frame.pack(pady=10)

		ttk.Button(btn_frame, text="▶ Play", command=self.play_sound).pack(side=tk.LEFT, padx=5)
		ttk.Button(btn_frame, text="⏹ Stop", command=self.stop_sound).pack(side=tk.LEFT, padx=5)
		ttk.Button(btn_frame, text="⏸ Pause", command=self.pause_sound).pack(side=tk.LEFT, padx=5)

		# Volume slider
		vol_frame = ttk.Frame(control_frame)
		vol_frame.pack(fill=tk.X, padx=5, pady=5)

		ttk.Label(vol_frame, text="Volume:").pack(side=tk.LEFT)
		self.volume_var = tk.DoubleVar(value=0.8)
		ttk.Scale(vol_frame, from_=0.0, to=1.0, variable=self.volume_var,
				  orient=tk.HORIZONTAL).pack(side=tk.LEFT, fill=tk.X, expand=True)

		# Export controls
		export_frame = ttk.LabelFrame(right_frame, text="Export")
		export_frame.pack(fill=tk.X, padx=5, pady=5)

		export_btn_frame = ttk.Frame(export_frame)
		export_btn_frame.pack(pady=10)

		ttk.Button(export_btn_frame, text="Export to WAV",
				   command=self.export_wav).pack(side=tk.LEFT, padx=5)
		ttk.Button(export_btn_frame, text="Export All to WAV",
				   command=self.export_all_wav).pack(side=tk.LEFT, padx=5)
		ttk.Button(export_btn_frame, text="Export Catalog (JSON)",
				   command=self.export_catalog).pack(side=tk.LEFT, padx=5)

		# Waveform display (placeholder)
		waveform_frame = ttk.LabelFrame(right_frame, text="Waveform")
		waveform_frame.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)

		self.waveform_canvas = tk.Canvas(waveform_frame, bg="black", height=150)
		self.waveform_canvas.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)

		# Status bar
		self.status_var = tk.StringVar(value="Ready - Load a ROM to begin")
		status_bar = ttk.Label(self, textvariable=self.status_var, relief=tk.SUNKEN)
		status_bar.pack(fill=tk.X, side=tk.BOTTOM)

		# Menu bar
		menubar = tk.Menu(self)
		self.config(menu=menubar)

		file_menu = tk.Menu(menubar, tearoff=0)
		menubar.add_cascade(label="File", menu=file_menu)
		file_menu.add_command(label="Open ROM...", command=self.open_rom)
		file_menu.add_separator()
		file_menu.add_command(label="Exit", command=self.quit)

	def populate_lists(self):
		"""Populate sound lists."""
		# BGM list
		for song in AudioExtractor.SONGS:
			type_str = "BGM" if song.sound_type == SoundType.BGM else "Jingle"
			self.bgm_list.insert("", tk.END, values=(
				f"${song.sound_id:02X}",
				song.name,
				type_str
			))

		# SFX list
		for sfx in AudioExtractor.SFX:
			self.sfx_list.insert("", tk.END, values=(
				f"${sfx.sound_id:02X}",
				sfx.name
			))

	def on_bgm_select(self, event):
		"""Handle BGM selection."""
		selection = self.bgm_list.selection()
		if not selection:
			return

		item = self.bgm_list.item(selection[0])
		idx = int(item["values"][0][1:], 16)  # Parse hex ID

		for song in AudioExtractor.SONGS:
			if song.sound_id == idx:
				self.current_sound = song
				self.update_info(song)
				self.draw_waveform(song)
				break

	def on_sfx_select(self, event):
		"""Handle SFX selection."""
		selection = self.sfx_list.selection()
		if not selection:
			return

		item = self.sfx_list.item(selection[0])
		idx = int(item["values"][0][1:], 16)

		for sfx in AudioExtractor.SFX:
			if sfx.sound_id == idx:
				self.current_sound = sfx
				self.update_info(sfx)
				self.draw_waveform(sfx)
				break

	def update_info(self, sound: SoundEntry):
		"""Update sound info display."""
		self.info_text.config(state=tk.NORMAL)
		self.info_text.delete("1.0", tk.END)

		info = f"""Name: {sound.name}
ID: ${sound.sound_id:02X}
Type: {sound.sound_type.name}
Bank: ${sound.bank:02X}
Offset: ${sound.offset:04X}
Size: ${sound.size:04X} ({sound.size} bytes)
Sample Rate: {sound.sample_rate} Hz
"""
		self.info_text.insert("1.0", info)
		self.info_text.config(state=tk.DISABLED)

	def draw_waveform(self, sound: SoundEntry):
		"""Draw waveform visualization."""
		self.waveform_canvas.delete("all")

		if not self.extractor.rom_data:
			self.waveform_canvas.create_text(
				200, 75, text="Load ROM to view waveform",
				fill="gray", font=("Arial", 12)
			)
			return

		# Get sound data and decode
		data = self.extractor.extract_song_data(sound)
		if not data:
			return

		# Decode a portion for visualization
		samples = []
		for i in range(0, min(len(data) - 8, 900), 9):
			block = data[i:i+9]
			samples.extend(self.extractor.decode_brr_block(block))

		if not samples:
			return

		# Draw waveform
		canvas_width = self.waveform_canvas.winfo_width() or 400
		canvas_height = self.waveform_canvas.winfo_height() or 150
		mid_y = canvas_height // 2

		# Scale samples to fit
		step = max(1, len(samples) // canvas_width)
		scale = mid_y / 32768

		points = []
		for i in range(0, len(samples), step):
			x = (i // step)
			y = mid_y - int(samples[i] * scale)
			points.extend([x, y])

		if len(points) >= 4:
			self.waveform_canvas.create_line(points, fill="lime", width=1)

		# Draw center line
		self.waveform_canvas.create_line(0, mid_y, canvas_width, mid_y,
										  fill="gray", dash=(2, 2))

	def open_rom(self):
		"""Open ROM file."""
		path = filedialog.askopenfilename(
			title="Open Soul Blazer ROM",
			filetypes=[("SNES ROM", "*.sfc *.smc"), ("All files", "*.*")]
		)
		if path:
			if self.extractor.load_rom(path):
				self.status_var.set(f"Loaded: {Path(path).name}")
				if self.current_sound:
					self.draw_waveform(self.current_sound)
			else:
				messagebox.showerror("Error", "Failed to load ROM")

	def play_sound(self):
		"""Play current sound (placeholder)."""
		if not self.current_sound:
			messagebox.showinfo("Info", "Select a sound first")
			return
		self.status_var.set(f"Playing: {self.current_sound.name}")

	def stop_sound(self):
		"""Stop playback (placeholder)."""
		self.status_var.set("Stopped")

	def pause_sound(self):
		"""Pause playback (placeholder)."""
		self.status_var.set("Paused")

	def export_wav(self):
		"""Export current sound to WAV."""
		if not self.current_sound:
			messagebox.showinfo("Info", "Select a sound first")
			return

		if not self.extractor.rom_data:
			messagebox.showerror("Error", "Load a ROM first")
			return

		path = filedialog.asksaveasfilename(
			title="Export to WAV",
			defaultextension=".wav",
			initialfile=f"{self.current_sound.name.replace(' ', '_')}.wav",
			filetypes=[("WAV files", "*.wav")]
		)
		if path:
			if self.extractor.export_to_wav(self.current_sound, Path(path)):
				messagebox.showinfo("Success", f"Exported to {path}")
			else:
				messagebox.showerror("Error", "Export failed")

	def export_all_wav(self):
		"""Export all sounds to WAV files."""
		if not self.extractor.rom_data:
			messagebox.showerror("Error", "Load a ROM first")
			return

		folder = filedialog.askdirectory(title="Select Export Folder")
		if not folder:
			return

		folder_path = Path(folder)
		count = 0

		for song in AudioExtractor.SONGS:
			filename = f"bgm_{song.sound_id:02x}_{song.name.replace(' ', '_')}.wav"
			if self.extractor.export_to_wav(song, folder_path / filename):
				count += 1

		for sfx in AudioExtractor.SFX:
			filename = f"sfx_{sfx.sound_id:02x}_{sfx.name.replace(' ', '_')}.wav"
			if self.extractor.export_to_wav(sfx, folder_path / filename):
				count += 1

		messagebox.showinfo("Export Complete", f"Exported {count} files")

	def export_catalog(self):
		"""Export audio catalog to JSON."""
		path = filedialog.asksaveasfilename(
			title="Export Catalog",
			defaultextension=".json",
			initialfile="audio_catalog.json",
			filetypes=[("JSON files", "*.json")]
		)
		if path:
			self.extractor.export_to_json(Path(path))
			messagebox.showinfo("Success", f"Exported catalog to {path}")


def main():
	"""Main entry point."""
	import argparse

	parser = argparse.ArgumentParser(description="Soul Blazer Audio Player")
	parser.add_argument("--rom", "-r", help="Path to ROM file")
	parser.add_argument("--gui", "-g", action="store_true", help="Launch GUI (default)")
	parser.add_argument("--export-all", "-e", help="Export all audio to directory")
	parser.add_argument("--list", "-l", action="store_true", help="List all sounds")

	args = parser.parse_args()

	if args.list:
		print("=== Background Music ===")
		for s in AudioExtractor.SONGS:
			print(f"  ${s.sound_id:02X}: {s.name} ({s.sound_type.name})")
		print("\n=== Sound Effects ===")
		for s in AudioExtractor.SFX:
			print(f"  ${s.sound_id:02X}: {s.name}")
		return

	if args.export_all:
		rom_path = args.rom or str(DEFAULT_ROM)
		extractor = AudioExtractor(rom_path)
		if not extractor.rom_data:
			print("Error: Could not load ROM")
			return

		output_dir = Path(args.export_all)
		output_dir.mkdir(parents=True, exist_ok=True)

		print(f"Exporting audio to {output_dir}...")
		for song in AudioExtractor.SONGS:
			filename = f"bgm_{song.sound_id:02x}_{song.name.replace(' ', '_')}.wav"
			extractor.export_to_wav(song, output_dir / filename)
			print(f"  Exported: {filename}")

		extractor.export_to_json(output_dir / "audio_catalog.json")
		print("Done!")
		return

	# Default: launch GUI
	app = AudioPlayer()
	if args.rom:
		app.extractor.load_rom(args.rom)
	app.mainloop()


if __name__ == "__main__":
	main()
