#!/usr/bin/env python3
"""
Dragon Quest III Progress Visualization & Asset Extraction
Creates comprehensive progress tables and extracts game assets
"""

import json
import sys
from pathlib import Path
from typing import Dict, List, Any, Optional, Tuple
import struct
from dataclasses import dataclass, asdict
from enum import Enum
import re


class AssetType(Enum):
	"""Types of assets that can be extracted"""

	GRAPHICS_TILES = "graphics_tiles"
	GRAPHICS_SPRITES = "graphics_sprites"
	GRAPHICS_BACKGROUNDS = "graphics_backgrounds"
	AUDIO_INSTRUMENTS = "audio_instruments"
	AUDIO_MUSIC = "audio_music"
	AUDIO_SFX = "audio_sfx"
	TEXT_DIALOG = "text_dialog"
	TEXT_MENUS = "text_menus"
	DATA_ITEMS = "data_items"
	DATA_MONSTERS = "data_monsters"
	DATA_SPELLS = "data_spells"
	DATA_MAPS = "data_maps"


@dataclass
class AssetInfo:
	"""Information about an extracted asset"""

	asset_type: AssetType
	name: str
	address: int
	size: int
	bank: int
	format_info: str = ""
	extracted: bool = False
	extraction_notes: str = ""


@dataclass
class ProgressVisualization:
	"""Progress tracking with visual elements"""

	category: str
	total_items: int
	completed_items: int
	in_progress_items: int
	percentage: float
	status_bar: str = ""
	details: List[str] = None

	def __post_init__(self):
		if self.details is None:
			self.details = []
		self.update_status_bar()

	def update_status_bar(self):
		"""Create ASCII progress bar"""
		bar_length = 40
		filled_length = int(bar_length * self.percentage / 100)
		in_progress_length = int(bar_length * self.in_progress_items / max(self.total_items, 1))

		# Create bar with completed (█), in-progress (▓), and remaining (░) sections
		bar = ""
		for i in range(bar_length):
			if i < filled_length:
				bar += "█"
			elif i < filled_length + in_progress_length:
				bar += "▓"
			else:
				bar += "░"

		self.status_bar = f"[{bar}] {self.percentage:.1f}%"


class DQ3ProgressTracker:
	"""Comprehensive progress tracking and visualization for Dragon Quest III"""

	def __init__(self, analysis_dir: str):
		self.analysis_dir = Path(analysis_dir)

		# Load analysis data
		self.analysis_data = self._load_analysis_data()

		# Initialize progress categories
		self.progress_categories: Dict[str, ProgressVisualization] = {}
		self.asset_inventory: Dict[AssetType, List[AssetInfo]] = {}

		# Initialize tracking
		self._initialize_progress_tracking()
		self._initialize_asset_inventory()

	def _load_analysis_data(self) -> Dict[str, Any]:
		"""Load all analysis JSON files"""
		data = {}

		json_files = [
			"dq3_progress.json",
			"dq3_banking.json",
			"dq3_vectors.json",
			"dq3_systems.json",
			"dq3_memory_map.json",
		]

		for filename in json_files:
			file_path = self.analysis_dir / filename
			if file_path.exists():
				with open(file_path, "r") as f:
					data[filename[:-5]] = json.load(f)	# Remove .json extension

		return data

	def _initialize_progress_tracking(self):
		"""Initialize progress tracking categories"""
		progress_data = self.analysis_data.get("dq3_progress", {})
		banking_data = self.analysis_data.get("dq3_banking", {})

		# Disassembly progress
		total_bytes = progress_data.get("overview", {}).get("total_bytes", 0)
		analyzed_bytes = progress_data.get("overview", {}).get("analyzed_bytes", 0)

		self.progress_categories["disassembly"] = ProgressVisualization(
			category="Code Disassembly",
			total_items=total_bytes,
			completed_items=analyzed_bytes,
			in_progress_items=0,
			percentage=(analyzed_bytes / max(total_bytes, 1)) * 100,
			details=[
				f"Total ROM size: {total_bytes:,} bytes",
				f"Disassembled: {analyzed_bytes:,} bytes",
				f"Remaining: {total_bytes - analyzed_bytes:,} bytes",
			],
		)

		# Function analysis progress
		functions_data = progress_data.get("overview", {}).get("functions", {})
		functions_found = functions_data.get("found", 0)
		functions_analyzed = functions_data.get("percentage", 0) * functions_found / 100

		self.progress_categories["functions"] = ProgressVisualization(
			category="Function Analysis",
			total_items=functions_found,
			completed_items=int(functions_analyzed),
			in_progress_items=0,
			percentage=functions_data.get("percentage", 0),
			details=[
				f"Functions discovered: {functions_found}",
				f"Functions analyzed: {int(functions_analyzed)}",
				f"Analysis completion: {functions_data.get('percentage', 0):.1f}%",
			],
		)

		# Banking system progress
		total_banks = banking_data.get("total_banks", 0)
		analyzed_banks = 0

		# Count banks with meaningful analysis
		banks_info = banking_data.get("banks", {})
		for bank_id, bank_info in banks_info.items():
			content = bank_info.get("content_analysis", {})
			if content.get("functions_detected", 0) > 0 or content.get("code_density", 0) > 0.3:
				analyzed_banks += 1

		self.progress_categories["banking"] = ProgressVisualization(
			category="Banking System",
			total_items=total_banks,
			completed_items=analyzed_banks,
			in_progress_items=0,
			percentage=(analyzed_banks / max(total_banks, 1)) * 100,
			details=[
				f"Total banks: {total_banks}",
				f"Analyzed banks: {analyzed_banks}",
				f"ROM type: {banking_data.get('rom_type', 'Unknown')}",
			],
		)

		# Game systems progress
		systems_data = progress_data.get("systems", {})
		total_systems = len(systems_data)
		analyzed_systems = sum(1 for system in systems_data.values() if system.get("completion", 0) > 0)

		self.progress_categories["systems"] = ProgressVisualization(
			category="Game Systems",
			total_items=total_systems,
			completed_items=analyzed_systems,
			in_progress_items=0,
			percentage=(analyzed_systems / max(total_systems, 1)) * 100,
			details=[f"{name}: {info.get('completion', 0):.1f}%" for name, info in systems_data.items()],
		)

	def _initialize_asset_inventory(self):
		"""Initialize asset tracking inventory"""
		# Graphics assets estimation based on ROM analysis
		self.asset_inventory[AssetType.GRAPHICS_TILES] = [
			AssetInfo(AssetType.GRAPHICS_TILES, "Character Tiles", 0x200000, 0x10000, 32, "4bpp SNES format"),
			AssetInfo(AssetType.GRAPHICS_TILES, "Monster Tiles", 0x220000, 0x20000, 34, "4bpp SNES format"),
			AssetInfo(AssetType.GRAPHICS_TILES, "World Map Tiles", 0x180000, 0x8000, 24, "2bpp SNES format"),
			AssetInfo(AssetType.GRAPHICS_TILES, "UI Tiles", 0x1a0000, 0x4000, 26, "2bpp SNES format"),
		]

		self.asset_inventory[AssetType.GRAPHICS_SPRITES] = [
			AssetInfo(AssetType.GRAPHICS_SPRITES, "Player Character Sprites", 0x240000, 0x8000, 36, "16x16 4bpp"),
			AssetInfo(AssetType.GRAPHICS_SPRITES, "NPC Sprites", 0x250000, 0xc000, 37, "16x16 4bpp"),
			AssetInfo(AssetType.GRAPHICS_SPRITES, "Battle Effects", 0x260000, 0x6000, 38, "Variable size 4bpp"),
		]

		self.asset_inventory[AssetType.AUDIO_MUSIC] = [
			AssetInfo(AssetType.AUDIO_MUSIC, "Overture", 0x300000, 0x2000, 48, "SNES SPC format"),
			AssetInfo(AssetType.AUDIO_MUSIC, "Adventure", 0x302000, 0x1800, 48, "SNES SPC format"),
			AssetInfo(AssetType.AUDIO_MUSIC, "Battle Theme", 0x304000, 0x1600, 48, "SNES SPC format"),
			AssetInfo(AssetType.AUDIO_MUSIC, "Boss Battle", 0x306000, 0x1800, 48, "SNES SPC format"),
			AssetInfo(AssetType.AUDIO_MUSIC, "Town Theme", 0x308000, 0x1400, 48, "SNES SPC format"),
		]

		self.asset_inventory[AssetType.AUDIO_INSTRUMENTS] = [
			AssetInfo(AssetType.AUDIO_INSTRUMENTS, "Instrument Samples", 0x320000, 0x8000, 50, "BRR samples"),
			AssetInfo(AssetType.AUDIO_INSTRUMENTS, "Drum Kit", 0x328000, 0x2000, 50, "BRR samples"),
		]

		self.asset_inventory[AssetType.TEXT_DIALOG] = [
			AssetInfo(AssetType.TEXT_DIALOG, "Main Story Text", 0x400000, 0x20000, 64, "Compressed Shift-JIS"),
			AssetInfo(AssetType.TEXT_DIALOG, "NPC Dialog", 0x420000, 0x15000, 66, "Compressed Shift-JIS"),
			AssetInfo(AssetType.TEXT_DIALOG, "Item Descriptions", 0x440000, 0x8000, 68, "Compressed Shift-JIS"),
		]

		self.asset_inventory[AssetType.DATA_ITEMS] = [
			AssetInfo(AssetType.DATA_ITEMS, "Weapon Data", 0x500000, 0x800, 80, "16-byte records"),
			AssetInfo(AssetType.DATA_ITEMS, "Armor Data", 0x500800, 0x600, 80, "12-byte records"),
			AssetInfo(AssetType.DATA_ITEMS, "Item Data", 0x501000, 0x1000, 80, "Variable records"),
		]

		self.asset_inventory[AssetType.DATA_MONSTERS] = [
			AssetInfo(AssetType.DATA_MONSTERS, "Monster Stats", 0x510000, 0x2000, 81, "32-byte records"),
			AssetInfo(AssetType.DATA_MONSTERS, "Monster AI", 0x512000, 0x3000, 81, "Variable AI scripts"),
			AssetInfo(AssetType.DATA_MONSTERS, "Drop Tables", 0x515000, 0x1000, 81, "Drop probability tables"),
		]

		self.asset_inventory[AssetType.DATA_SPELLS] = [
			AssetInfo(AssetType.DATA_SPELLS, "Spell Data", 0x520000, 0x800, 82, "16-byte records"),
			AssetInfo(AssetType.DATA_SPELLS, "Spell Effects", 0x520800, 0x1000, 82, "Effect script data"),
		]

		self.asset_inventory[AssetType.DATA_MAPS] = [
			AssetInfo(AssetType.DATA_MAPS, "World Map Data", 0x600000, 0x4000, 96, "Compressed tilemap"),
			AssetInfo(AssetType.DATA_MAPS, "Town Maps", 0x604000, 0x8000, 96, "Compressed tilemaps"),
			AssetInfo(AssetType.DATA_MAPS, "Dungeon Maps", 0x60c000, 0xa000, 96, "Compressed tilemaps"),
		]

	def generate_progress_table(self) -> str:
		"""Generate comprehensive ASCII progress table"""
		lines = []

		# Header
		lines.extend(
			[
				"",
				"🐉 DRAGON QUEST III - COMPREHENSIVE PROGRESS TRACKER",
				"=" * 80,
				f"Analysis Directory: {self.analysis_dir}",
				f"Generated: {__import__('datetime').datetime.now().strftime('%Y-%m-%d %H:%M:%S')}",
				"=" * 80,
				"",
			]
		)

		# Main progress categories
		lines.extend(["📊 MAIN PROGRESS CATEGORIES", "-" * 80])

		for category_key, progress in self.progress_categories.items():
			lines.extend(
				[
					f"",
					f"🎯 {progress.category}",
					f"	 {progress.status_bar}",
					f"	 {progress.completed_items:,} / {progress.total_items:,} completed",
					"",
				]
			)

			# Add details
			for detail in progress.details[:3]:	# Show first 3 details
				lines.append(f"	 • {detail}")

		lines.append("")

		# Asset extraction progress
		lines.extend(["🎨 ASSET EXTRACTION PROGRESS", "-" * 80])

		for asset_type, assets in self.asset_inventory.items():
			extracted = sum(1 for asset in assets if asset.extracted)
			total = len(assets)
			percentage = (extracted / max(total, 1)) * 100

			# Create mini progress bar
			bar_length = 20
			filled = int(bar_length * percentage / 100)
			bar = "█" * filled + "░" * (bar_length - filled)

			lines.extend(
				[
					f"",
					f"📦 {asset_type.value.replace('_', ' ').title()}",
					f"	 [{bar}] {percentage:.1f}% ({extracted}/{total})",
					"",
				]
			)

			# Show asset details
			for asset in assets:
				status = "✅" if asset.extracted else "⏳"
				lines.append(f"	 {status} {asset.name:<25} ${asset.address:06X} ({asset.size:,} bytes)")

		# Detailed breakdown
		lines.extend(["", "", "📋 DETAILED BREAKDOWN", "-" * 80])

		# System-by-system analysis
		systems_data = self.analysis_data.get("dq3_progress", {}).get("systems", {})

		for system_name, system_info in systems_data.items():
			completion = system_info.get("completion", 0)
			functions = system_info.get("functions", 0)
			banks = len(system_info.get("banks", []))

			status_icon = "✅" if completion > 80 else "🔄" if completion > 20 else "⏸️"

			lines.extend(
				[
					f"",
					f"{status_icon} {system_name}",
					f"	 Progress: {completion:.1f}%",
					f"	 Functions: {functions}",
					f"	 Banks: {banks}",
					"",
				]
			)

		# Banking details
		lines.extend(["", "🏦 BANKING SYSTEM ANALYSIS", "-" * 80])

		banking_data = self.analysis_data.get("dq3_banking", {})
		banks_info = banking_data.get("banks", {})

		# Show first 16 banks (most important)
		for i in range(16):
			bank_id = f"${i:02X}"
			if bank_id in banks_info:
				bank = banks_info[bank_id]
				content = bank.get("content_analysis", {})
				code_density = content.get("code_density", 0)
				functions = content.get("functions_detected", 0)

				# Determine bank status
				if code_density > 0.5:
					status = "🔥 High Activity"
				elif code_density > 0.2:
					status = "📊 Medium Activity"
				elif functions > 0:
					status = "🔍 Low Activity"
				else:
					status = "💤 Data/Empty"

				lines.append(f"	 Bank {bank_id}: {status:<15} {bank.get('description', 'Unknown')}")

		# Summary statistics
		lines.extend(["", "", "📈 SUMMARY STATISTICS", "-" * 80])

		total_progress = sum(p.percentage for p in self.progress_categories.values()) / len(self.progress_categories)
		total_assets = sum(len(assets) for assets in self.asset_inventory.values())
		extracted_assets = sum(
			sum(1 for asset in assets if asset.extracted) for assets in self.asset_inventory.values()
		)

		lines.extend(
			[
				f"Overall Progress:	 {total_progress:.1f}%",
				f"Total Assets Found:	 {total_assets}",
				f"Assets Extracted:	 {extracted_assets} ({(extracted_assets/max(total_assets,1)*100):.1f}%)",
				f"Functions Analyzed:	 {self.progress_categories['functions'].completed_items}",
				f"Banks Processed:		{self.progress_categories['banking'].completed_items}",
				"",
			]
		)

		return "\n".join(lines)

	def generate_html_dashboard(self) -> str:
		"""Generate interactive HTML dashboard"""
		# Generate stats cards
		total_progress = sum(p.percentage for p in self.progress_categories.values()) / len(self.progress_categories)
		stats_cards = f"""
			<div class="stat-card">
				<h3>{total_progress:.1f}%</h3>
				<p>Overall Progress</p>
			</div>
			<div class="stat-card">
				<h3>{self.progress_categories['functions'].completed_items}</h3>
				<p>Functions Analyzed</p>
			</div>
			<div class="stat-card">
				<h3>{sum(len(assets) for assets in self.asset_inventory.values())}</h3>
				<p>Assets Catalogued</p>
			</div>
			<div class="stat-card">
				<h3>{self.progress_categories['banking'].completed_items}</h3>
				<p>Banks Analyzed</p>
			</div>
		"""

		# Generate progress sections
		progress_sections = ""
		for progress in self.progress_categories.values():
			progress_sections += f"""
			<div style="margin: 15px 0;">
				<h3>{progress.category}</h3>
				<div class="progress-bar">
					<div class="progress-fill" style="width: {progress.percentage}%"></div>
				</div>
				<p>{progress.completed_items:,} / {progress.total_items:,} ({progress.percentage:.1f}%)</p>
			</div>
			"""

		# Generate bank grid
		bank_grid = ""
		banking_data = self.analysis_data.get("dq3_banking", {})
		banks_info = banking_data.get("banks", {})

		for i in range(64):	# Show all 64 banks
			bank_id = f"${i:02X}"
			if bank_id in banks_info:
				content = banks_info[bank_id].get("content_analysis", {})
				code_density = content.get("code_density", 0)

				if code_density > 0.5:
					bank_class = "bank-high"
				elif code_density > 0.2:
					bank_class = "bank-medium"
				elif content.get("functions_detected", 0) > 0:
					bank_class = "bank-low"
				else:
					bank_class = "bank-data"

				bank_grid += f'<div class="bank-cell {bank_class}">{bank_id}</div>'
			else:
				bank_grid += f'<div class="bank-cell">--</div>'

		# Generate asset cards
		asset_cards = ""
		for asset_type, assets in self.asset_inventory.items():
			extracted = sum(1 for asset in assets if asset.extracted)
			total = len(assets)
			percentage = (extracted / max(total, 1)) * 100

			asset_cards += f"""
			<div class="asset-card">
				<h4>{asset_type.value.replace('_', ' ').title()}</h4>
				<div class="progress-bar">
					<div class="progress-fill" style="width: {percentage}%"></div>
				</div>
				<p>{extracted}/{total} extracted ({percentage:.1f}%)</p>
				<ul>
			"""

			for asset in assets[:3]:	# Show first 3 assets
				status = "✅" if asset.extracted else "⏳"
				asset_cards += f"<li>{status} {asset.name}</li>"

			asset_cards += "</ul></div>"

		# HTML template with escaped braces
		html_content = f"""<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Dragon Quest III - Analysis Dashboard</title>
	<style>
		body {{ font-family: 'Courier New', monospace; background: #1a1a1a; color: #00ff00; margin: 20px; }}
		.container {{ max-width: 1200px; margin: 0 auto; }}
		.header {{ text-align: center; border-bottom: 2px solid #00ff00; padding-bottom: 20px; margin-bottom: 30px; }}
		.section {{ margin-bottom: 30px; border: 1px solid #333; padding: 20px; background: #2a2a2a; }}
		.progress-bar {{ width: 100%; height: 20px; background: #333; border: 1px solid #555; margin: 10px 0; }}
		.progress-fill {{ height: 100%; background: linear-gradient(90deg, #00ff00, #ffff00); transition: width 0.3s; }}
		.asset-grid {{ display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 15px; }}
		.asset-card {{ border: 1px solid #444; padding: 15px; background: #333; }}
		.status-icon {{ font-size: 1.2em; }}
		.bank-grid {{ display: grid; grid-template-columns: repeat(8, 1fr); gap: 5px; }}
		.bank-cell {{ padding: 10px; text-align: center; border: 1px solid #555; font-size: 0.8em; }}
		.bank-high {{ background: #ff4444; }}
		.bank-medium {{ background: #ffaa00; }}
		.bank-low {{ background: #00aa00; }}
		.bank-data {{ background: #4444ff; }}
		.stats-grid {{ display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; }}
		.stat-card {{ text-align: center; padding: 20px; border: 1px solid #555; }}
	</style>
</head>
<body>
	<div class="container">
		<div class="header">
			<h1>🐉 Dragon Quest III Analysis Dashboard</h1>
			<p>Real-time progress tracking and asset extraction status</p>
		</div>

		<div class="section">
			<h2>📊 Overall Progress</h2>
			<div class="stats-grid">
				{stats_cards}
			</div>
		</div>

		<div class="section">
			<h2>🎯 Main Categories</h2>
			{progress_sections}
		</div>

		<div class="section">
			<h2>🏦 Banking System Overview</h2>
			<div class="bank-grid">
				{bank_grid}
			</div>
		</div>

		<div class="section">
			<h2>🎨 Asset Extraction Status</h2>
			<div class="asset-grid">
				{asset_cards}
			</div>
		</div>
	</div>

	<script>
		// Auto-refresh every 30 seconds
		setTimeout(() => location.reload(), 30000);

		// Add click handlers for interactive elements
		document.querySelectorAll('.bank-cell').forEach(cell => {{
			cell.addEventListener('click', () => {{
				alert('Bank details: ' + cell.textContent);
			}});
		}});
	</script>
</body>
</html>"""

		return html_content

	def export_progress_reports(self, output_dir: str):
		"""Export all progress reports"""
		output_path = Path(output_dir)
		output_path.mkdir(parents=True, exist_ok=True)

		print(f"📊 Exporting progress reports to {output_path}")

		# ASCII progress table
		progress_table = self.generate_progress_table()
		with open(output_path / "dq3_progress_table.txt", "w", encoding="utf-8") as f:
			f.write(progress_table)

		# HTML dashboard
		html_dashboard = self.generate_html_dashboard()
		with open(output_path / "dq3_dashboard.html", "w", encoding="utf-8") as f:
			f.write(html_dashboard)

		# JSON data export for external tools
		def asset_to_dict(asset: AssetInfo) -> Dict[str, Any]:
			data = asdict(asset)
			data["asset_type"] = asset.asset_type.value	# Convert enum to string
			return data

		export_data = {
			"progress_categories": {k: asdict(v) for k, v in self.progress_categories.items()},
			"asset_inventory": {
				k.value: [asset_to_dict(asset) for asset in v] for k, v in self.asset_inventory.items()
			},
			"analysis_data": self.analysis_data,
		}

		with open(output_path / "dq3_progress_data.json", "w") as f:
			json.dump(export_data, f, indent="\t")

		print("✅ Progress reports exported successfully")
		print(f"	 📄 ASCII Table: {output_path}/dq3_progress_table.txt")
		print(f"	 🌐 HTML Dashboard: {output_path}/dq3_dashboard.html")
		print(f"	 📊 JSON Data: {output_path}/dq3_progress_data.json")


def main():
	"""Main entry point for progress tracking"""
	import argparse

	parser = argparse.ArgumentParser(description="Dragon Quest III Progress Tracker & Visualizer")
	parser.add_argument("analysis_dir", help="Directory containing analysis JSON files")
	parser.add_argument("--output", "-o", default="progress", help="Output directory for reports")

	args = parser.parse_args()

	print("📊 Dragon Quest III - Progress Visualization System")
	print("=" * 60)

	# Create progress tracker
	tracker = DQ3ProgressTracker(args.analysis_dir)

	# Generate and export reports
	tracker.export_progress_reports(args.output)

	print(f"\n🎯 Progress tracking complete!")
	print(f"	 Open {args.output}/dq3_dashboard.html in a web browser for interactive view")


if __name__ == "__main__":
	main()
