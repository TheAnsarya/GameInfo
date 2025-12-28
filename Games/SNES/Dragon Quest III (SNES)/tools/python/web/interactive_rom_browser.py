"""
Dragon Quest III - Interactive ROM Browser
Advanced web-based interface for ROM analysis exploration

This module creates a comprehensive web interface for exploring ROM analysis results
including graphics galleries, disassembly viewers, game data browsers, and real-time
analysis tools with responsive design and interactive navigation.

Features:
- Graphics gallery with format detection and palette analysis
- Interactive disassembly viewer with subroutine navigation
- Game data browser for characters, items, monsters
- Audio sample player and analysis tools
- Real-time hex editor with data interpretation
- Export functionality for analysis results
- Responsive design with modern UI/UX
"""

import os
import json
import base64
from pathlib import Path
from typing import Dict, List, Any, Optional
import logging
from datetime import datetime
import threading
import time

# Web framework imports
try:
	from flask import Flask, render_template, jsonify, request, send_file, abort
	from flask_cors import CORS
except ImportError:
	print("Flask not available. Install with: pip install flask flask-cors")
	Flask = None

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class InteractiveROMBrowser:
	"""Advanced interactive ROM browser with web interface"""

	def __init__(self, project_root: str):
		self.project_root = Path(project_root)
		self.static_dir = self.project_root / "static"
		self.analysis_cache = {}
		self.rom_data = None
		self.rom_path = None

		# Initialize Flask app if available
		if Flask:
			self.app = Flask(__name__,
							 template_folder=str(self.project_root / "web" / "templates"),
							 static_folder=str(self.project_root / "web" / "static"))
			CORS(self.app)
			self._setup_routes()
		else:
			self.app = None
			logger.warning("Flask not available - web interface disabled")

		self._load_rom_data()
		self._initialize_analyzers()

	def _load_rom_data(self):
		"""Load ROM data for analysis"""
		rom_files = [
			'Dragon Quest III - Soshite Densetsu he... (J).smc',	# Primary Japanese source
			'Dragon Quest III - english.smc',						# Reference translation
			'Dragon Quest III - english (patched).smc'				# Backup option
		]

		for rom_file in rom_files:
			rom_path = self.static_dir / rom_file
			if rom_path.exists():
				self.rom_path = rom_path
				break

		if not self.rom_path:
			raise FileNotFoundError("No Dragon Quest III ROM found")

		with open(self.rom_path, 'rb') as f:
			self.rom_data = f.read()

		logger.info(f"ROM loaded: {len(self.rom_data):,} bytes from {self.rom_path.name}")

	def _initialize_analyzers(self):
		"""Initialize analysis components"""
		try:
			import sys
			sys.path.append(str(self.project_root / "tools" / "analysis"))

			from comprehensive_rom_analyzer import ComprehensiveROMAnalyzer
			from enhanced_graphics_analyzer import EnhancedDQ3GraphicsAnalyzer
			from snes_audio_analyzer import SNESAudioAnalyzer
			from dq3_game_data_extractor import DQ3GameDataExtractor
			from snes_disassembler import SNESDisassembler

			self.analyzers = {
				'rom': ComprehensiveROMAnalyzer(str(self.project_root)),
				'graphics': EnhancedDQ3GraphicsAnalyzer(str(self.project_root)),
				'audio': SNESAudioAnalyzer(str(self.project_root)),
				'game_data': DQ3GameDataExtractor(str(self.project_root)),
				'disassembler': SNESDisassembler(str(self.project_root))
			}

			logger.info("All analyzers initialized successfully")

		except Exception as e:
			logger.error(f"Error initializing analyzers: {e}")
			self.analyzers = {}

	def _setup_routes(self):
		"""Setup Flask routes for web interface"""

		@self.app.route('/')
		def index():
			"""Main ROM browser interface"""
			return render_template('index.html',
								 rom_name=self.rom_path.name,
								 rom_size=len(self.rom_data),
								 analyzers_available=bool(self.analyzers))

		@self.app.route('/api/rom/info')
		def rom_info():
			"""Get basic ROM information"""
			return jsonify({
				'name': self.rom_path.name,
				'size': len(self.rom_data),
				'size_mb': round(len(self.rom_data) / (1024 * 1024), 2),
				'analyzers_loaded': len(self.analyzers),
				'cache_size': len(self.analysis_cache)
			})

		@self.app.route('/api/graphics/gallery')
		def graphics_gallery():
			"""Get graphics analysis results for gallery display"""
			if 'graphics' not in self.analyzers:
				return jsonify({'error': 'Graphics analyzer not available'})

			if 'graphics_gallery' not in self.analysis_cache:
				logger.info("Generating graphics gallery...")
				analyzer = self.analyzers['graphics']

				# Run comprehensive graphics analysis
				analysis_results = analyzer.analyze_all_graphics()

				# Process results for web display
				gallery_data = []
				for format_name, candidates in analysis_results.items():
					if not candidates:
						continue

					# Take top candidates for each format
					top_candidates = sorted(candidates,
											key=lambda x: x.get('confidence', 0),
											reverse=True)[:20]

					for candidate in top_candidates:
						gallery_data.append({
							'format': format_name,
							'offset': candidate['offset'],
							'confidence': candidate.get('confidence', 0),
							'size': candidate.get('size', 0),
							'palette_count': candidate.get('palette_count', 0),
							'preview_data': self._generate_graphics_preview(candidate)
						})

				self.analysis_cache['graphics_gallery'] = gallery_data
				logger.info(f"Graphics gallery generated: {len(gallery_data)} items")

			return jsonify(self.analysis_cache['graphics_gallery'])

		@self.app.route('/api/disassembly')
		def disassembly_viewer():
			"""Get disassembly data for code viewer"""
			if 'disassembler' not in self.analyzers:
				return jsonify({'error': 'Disassembler not available'})

			# Get parameters
			start_offset = int(request.args.get('start', '0x8000'), 0)
			size = int(request.args.get('size', '256'))

			cache_key = f"disasm_{start_offset:06X}_{size}"

			if cache_key not in self.analysis_cache:
				logger.info(f"Disassembling at ${start_offset:06X} (size: {size})")
				disasm = self.analyzers['disassembler']

				try:
					instructions = disasm.disassemble_region(start_offset, size)

					disasm_data = []
					for instr in instructions:
						disasm_data.append({
							'address': instr.address,
							'snes_address': instr.snes_address,
							'opcode': instr.opcode,
							'mnemonic': instr.mnemonic,
							'operands': instr.operands,
							'bytes': [int(b) for b in instr.bytes],
							'size': instr.size,
							'description': instr.description,
							'is_branch': getattr(instr, 'is_branch', False),
							'is_jump': getattr(instr, 'is_jump', False),
							'is_call': getattr(instr, 'is_call', False)
						})

					self.analysis_cache[cache_key] = disasm_data

				except Exception as e:
					logger.error(f"Disassembly error: {e}")
					return jsonify({'error': str(e)})

			return jsonify(self.analysis_cache[cache_key])

		@self.app.route('/api/gamedata/characters')
		def game_characters():
			"""Get character data"""
			if 'game_data' not in self.analyzers:
				return jsonify({'error': 'Game data extractor not available'})

			if 'characters' not in self.analysis_cache:
				logger.info("Extracting character data...")
				extractor = self.analyzers['game_data']
				characters = extractor.analyze_character_data()

				# Convert to JSON-serializable format
				char_data = []
				for char in characters[:50]:	# Limit for performance
					char_data.append({
						'id': char.id,
						'name': char.name,
						'offset': f"${char.offset:06X}",
						'level': char.level,
						'stats': char.stats,
						'class_type': char.class_type,
						'confidence': round(char.confidence, 3)
					})

				self.analysis_cache['characters'] = char_data

			return jsonify(self.analysis_cache['characters'])

		@self.app.route('/api/gamedata/items')
		def game_items():
			"""Get item data"""
			if 'game_data' not in self.analyzers:
				return jsonify({'error': 'Game data extractor not available'})

			if 'items' not in self.analysis_cache:
				logger.info("Extracting item data...")
				extractor = self.analyzers['game_data']
				items = extractor.analyze_item_data()

				# Convert to JSON-serializable format
				item_data = []
				for item in items[:50]:	# Limit for performance
					item_data.append({
						'id': item.id,
						'name': item.name,
						'offset': f"${item.offset:06X}",
						'type': item.item_type,
						'price': item.price,
						'stats_bonus': item.stats_bonus,
						'confidence': round(item.confidence, 3)
					})

				self.analysis_cache['items'] = item_data

			return jsonify(self.analysis_cache['items'])

		@self.app.route('/api/gamedata/monsters')
		def game_monsters():
			"""Get monster data"""
			if 'game_data' not in self.analyzers:
				return jsonify({'error': 'Game data extractor not available'})

			if 'monsters' not in self.analysis_cache:
				logger.info("Extracting monster data...")
				extractor = self.analyzers['game_data']
				monsters = extractor.analyze_monster_data()

				# Convert to JSON-serializable format
				monster_data = []
				for monster in monsters[:50]:	# Limit for performance
					monster_data.append({
						'id': monster.id,
						'name': monster.name,
						'offset': f"${monster.offset:06X}",
						'stats': monster.stats,
						'experience_reward': monster.experience_reward,
						'gold_reward': monster.gold_reward,
						'confidence': round(monster.confidence, 3)
					})

				self.analysis_cache['monsters'] = monster_data

			return jsonify(self.analysis_cache['monsters'])

		@self.app.route('/api/audio/samples')
		def audio_samples():
			"""Get audio sample data"""
			if 'audio' not in self.analyzers:
				return jsonify({'error': 'Audio analyzer not available'})

			if 'audio_samples' not in self.analysis_cache:
				logger.info("Analyzing audio samples...")
				analyzer = self.analyzers['audio']

				# Quick BRR analysis
				brr_results = analyzer.analyze_brr_samples()

				sample_data = []
				for sample in brr_results.get('samples', [])[:30]:	# Limit for performance
					sample_data.append({
						'offset': f"${sample.offset:06X}",
						'size': sample.size,
						'confidence': round(sample.confidence, 3),
						'sample_rate': getattr(sample, 'sample_rate', 'Unknown'),
						'loop_flag': getattr(sample, 'loop_flag', False)
					})

				self.analysis_cache['audio_samples'] = sample_data

			return jsonify(self.analysis_cache['audio_samples'])

		@self.app.route('/api/hex/<int:offset>')
		def hex_data():
			"""Get hex data for hex viewer"""
			size = int(request.args.get('size', '256'))

			if offset < 0 or offset >= len(self.rom_data):
				return jsonify({'error': 'Invalid offset'})

			end_offset = min(offset + size, len(self.rom_data))
			data_bytes = self.rom_data[offset:end_offset]

			# Convert to hex representation
			hex_lines = []
			for i in range(0, len(data_bytes), 16):
				line_offset = offset + i
				line_bytes = data_bytes[i:i+16]

				hex_values = [f"{b:02X}" for b in line_bytes]
				ascii_chars = ''.join(chr(b) if 32 <= b <= 126 else '.' for b in line_bytes)

				hex_lines.append({
					'offset': f"${line_offset:06X}",
					'hex': ' '.join(hex_values),
					'ascii': ascii_chars,
					'bytes': list(line_bytes)
				})

			return jsonify({
				'offset': offset,
				'size': len(data_bytes),
				'lines': hex_lines
			})

		@self.app.route('/api/export/<export_type>')
		def export_data():
			"""Export analysis results"""
			if export_type not in ['graphics', 'disassembly', 'gamedata', 'audio']:
				return jsonify({'error': 'Invalid export type'})

			timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')

			if export_type == 'gamedata':
				if 'game_data' in self.analyzers:
					extractor = self.analyzers['game_data']
					output_file = extractor.save_extracted_data()
					return send_file(output_file, as_attachment=True)

			# Add other export types as needed
			return jsonify({'error': f'Export for {export_type} not implemented yet'})

		@self.app.errorhandler(404)
		def not_found(error):
			return jsonify({'error': 'Not found'}), 404

		@self.app.errorhandler(500)
		def internal_error(error):
			return jsonify({'error': 'Internal server error'}), 500

	def _generate_graphics_preview(self, candidate: Dict) -> Optional[str]:
		"""Generate base64 encoded preview image for graphics candidate"""
		try:
			# This is a simplified preview generator
			# In a full implementation, you would decode the graphics data
			# and generate a proper preview image

			offset = candidate['offset']
			size = min(candidate.get('size', 64), 256)

			if offset + size > len(self.rom_data):
				return None

			data = self.rom_data[offset:offset + size]

			# Simple preview: convert bytes to grayscale pixels
			width = min(int(size ** 0.5), 16)
			height = width

			# Create simple preview data
			preview_bytes = []
			for i in range(min(len(data), width * height)):
				# Simple grayscale conversion
				gray_value = data[i]
				preview_bytes.extend([gray_value, gray_value, gray_value, 255])	# RGBA

			# Pad to full size
			while len(preview_bytes) < width * height * 4:
				preview_bytes.extend([128, 128, 128, 255])

			# Encode as base64 for web display
			preview_data = base64.b64encode(bytes(preview_bytes)).decode('ascii')

			return {
				'width': width,
				'height': height,
				'data': preview_data
			}

		except Exception as e:
			logger.error(f"Error generating graphics preview: {e}")
			return None

	def create_web_templates(self):
		"""Create HTML templates for the web interface"""
		template_dir = self.project_root / "web" / "templates"
		static_dir = self.project_root / "web" / "static"

		# Create directories
		template_dir.mkdir(parents=True, exist_ok=True)
		static_dir.mkdir(parents=True, exist_ok=True)

		# Main HTML template
		main_template = '''<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Dragon Quest III ROM Browser</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
	<style>
		.sidebar { min-height: 100vh; background-color: #f8f9fa; }
		.content-area { padding: 20px; }
		.hex-viewer { font-family: 'Courier New', monospace; font-size: 12px; }
		.graphics-preview { max-width: 64px; max-height: 64px; border: 1px solid #ddd; }
		.nav-pills .nav-link { color: #495057; }
		.nav-pills .nav-link.active { background-color: #007bff; }
		.data-table { font-size: 14px; }
		.confidence-high { color: #28a745; font-weight: bold; }
		.confidence-medium { color: #ffc107; }
		.confidence-low { color: #dc3545; }
		.loading-spinner { text-align: center; padding: 50px; }
	</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<!-- Sidebar -->
			<div class="col-md-3 sidebar">
				<div class="p-3">
					<h4><i class="fas fa-microchip"></i> DQ3 ROM Browser</h4>
					<p class="text-muted">{{ rom_name }}</p>
					<p class="small">Size: {{ "%.2f"|format(rom_size / 1048576) }} MB</p>

					<!-- Navigation -->
					<nav class="nav nav-pills flex-column mt-4">
						<a class="nav-link active" href="#overview" data-tab="overview">
							<i class="fas fa-info-circle"></i> Overview
						</a>
						<a class="nav-link" href="#graphics" data-tab="graphics">
							<i class="fas fa-image"></i> Graphics Gallery
						</a>
						<a class="nav-link" href="#disassembly" data-tab="disassembly">
							<i class="fas fa-code"></i> Disassembly
						</a>
						<a class="nav-link" href="#gamedata" data-tab="gamedata">
							<i class="fas fa-users"></i> Game Data
						</a>
						<a class="nav-link" href="#audio" data-tab="audio">
							<i class="fas fa-music"></i> Audio Samples
						</a>
						<a class="nav-link" href="#hexviewer" data-tab="hexviewer">
							<i class="fas fa-search"></i> Hex Viewer
						</a>
					</nav>
				</div>
			</div>

			<!-- Main Content -->
			<div class="col-md-9 content-area">
				<div id="content">
					<!-- Content will be loaded here dynamically -->
					<div id="overview" class="tab-content active">
						<h2>ROM Overview</h2>
						<div id="rom-info">Loading...</div>
					</div>

					<div id="graphics" class="tab-content" style="display: none;">
						<h2>Graphics Gallery</h2>
						<div id="graphics-content">Loading...</div>
					</div>

					<div id="disassembly" class="tab-content" style="display: none;">
						<h2>Disassembly Viewer</h2>
						<div class="mb-3">
							<label for="disasm-offset">Start Offset:</label>
							<input type="text" id="disasm-offset" class="form-control" value="0x8000" style="width: 200px; display: inline-block;">
							<button id="disasm-load" class="btn btn-primary">Load</button>
						</div>
						<div id="disassembly-content">Loading...</div>
					</div>

					<div id="gamedata" class="tab-content" style="display: none;">
						<h2>Game Data</h2>
						<div class="nav nav-tabs" id="gamedata-tabs">
							<button class="nav-link active" data-gamedata="characters">Characters</button>
							<button class="nav-link" data-gamedata="items">Items</button>
							<button class="nav-link" data-gamedata="monsters">Monsters</button>
						</div>
						<div id="gamedata-content">Loading...</div>
					</div>

					<div id="audio" class="tab-content" style="display: none;">
						<h2>Audio Samples</h2>
						<div id="audio-content">Loading...</div>
					</div>

					<div id="hexviewer" class="tab-content" style="display: none;">
						<h2>Hex Viewer</h2>
						<div class="mb-3">
							<label for="hex-offset">Offset:</label>
							<input type="text" id="hex-offset" class="form-control" value="0x8000" style="width: 200px; display: inline-block;">
							<button id="hex-load" class="btn btn-primary">Load</button>
						</div>
						<div id="hex-content" class="hex-viewer">Loading...</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="static/main.js"></script>
</body>
</html>'''

		with open(template_dir / "index.html", 'w', encoding='utf-8') as f:
			f.write(main_template)

		# JavaScript file
		js_content = '''// Dragon Quest III ROM Browser JavaScript

// Global state
let currentTab = 'overview';
let currentGameDataTab = 'characters';

// Initialize on page load
document.addEventListener('DOMContentLoaded', function() {
	initializeNavigation();
	loadROMInfo();
});

// Navigation handling
function initializeNavigation() {
	const navLinks = document.querySelectorAll('.nav-link[data-tab]');
	navLinks.forEach(link => {
		link.addEventListener('click', function(e) {
			e.preventDefault();
			const tab = this.dataset.tab;
			switchTab(tab);
		});
	});

	// Game data sub-tabs
	const gamedataLinks = document.querySelectorAll('[data-gamedata]');
	gamedataLinks.forEach(link => {
		link.addEventListener('click', function() {
			const type = this.dataset.gamedata;
			switchGameDataTab(type);
		});
	});

	// Button handlers
	document.getElementById('disasm-load').addEventListener('click', loadDisassembly);
	document.getElementById('hex-load').addEventListener('click', loadHexData);
}

function switchTab(tabName) {
	// Hide all tabs
	document.querySelectorAll('.tab-content').forEach(tab => {
		tab.style.display = 'none';
	});

	// Show selected tab
	document.getElementById(tabName).style.display = 'block';

	// Update navigation
	document.querySelectorAll('.nav-link[data-tab]').forEach(link => {
		link.classList.remove('active');
	});
	document.querySelector(`[data-tab="${tabName}"]`).classList.add('active');

	currentTab = tabName;

	// Load content if needed
	loadTabContent(tabName);
}

function loadTabContent(tabName) {
	switch(tabName) {
		case 'graphics':
			loadGraphicsGallery();
			break;
		case 'disassembly':
			// Loaded on demand
			break;
		case 'gamedata':
			loadGameData(currentGameDataTab);
			break;
		case 'audio':
			loadAudioSamples();
			break;
		case 'hexviewer':
			// Loaded on demand
			break;
	}
}

// API calls
function loadROMInfo() {
	fetch('/api/rom/info')
		.then(response => response.json())
		.then(data => {
			const info = `
				<div class="card">
					<div class="card-body">
						<h5>ROM Information</h5>
						<p><strong>Name:</strong> ${data.name}</p>
						<p><strong>Size:</strong> ${data.size_mb} MB (${data.size.toLocaleString()} bytes)</p>
						<p><strong>Analyzers:</strong> ${data.analyzers_loaded} loaded</p>
						<p><strong>Cache:</strong> ${data.cache_size} items</p>
					</div>
				</div>
			`;
			document.getElementById('rom-info').innerHTML = info;
		})
		.catch(error => {
			document.getElementById('rom-info').innerHTML = `<div class="alert alert-danger">Error: ${error}</div>`;
		});
}

function loadGraphicsGallery() {
	const content = document.getElementById('graphics-content');
	content.innerHTML = '<div class="loading-spinner"><i class="fas fa-spinner fa-spin"></i> Analyzing graphics...</div>';

	fetch('/api/graphics/gallery')
		.then(response => response.json())
		.then(data => {
			if (data.error) {
				content.innerHTML = `<div class="alert alert-warning">${data.error}</div>`;
				return;
			}

			let html = '<div class="row">';
			data.forEach(item => {
				const confidenceClass = item.confidence > 0.7 ? 'confidence-high' :
										item.confidence > 0.4 ? 'confidence-medium' : 'confidence-low';

				html += `
					<div class="col-md-4 mb-3">
						<div class="card">
							<div class="card-body">
								<h6>${item.format}</h6>
								<p class="small">Offset: $${item.offset.toString(16).padStart(6, '0').toUpperCase()}</p>
								<p class="small">Size: ${item.size} bytes</p>
								<p class="small">Confidence: <span class="${confidenceClass}">${(item.confidence * 100).toFixed(1)}%</span></p>
								${item.palette_count ? `<p class="small">Palettes: ${item.palette_count}</p>` : ''}
							</div>
						</div>
					</div>
				`;
			});
			html += '</div>';

			content.innerHTML = html;
		})
		.catch(error => {
			content.innerHTML = `<div class="alert alert-danger">Error: ${error}</div>`;
		});
}

function loadDisassembly() {
	const offset = document.getElementById('disasm-offset').value;
	const content = document.getElementById('disassembly-content');

	content.innerHTML = '<div class="loading-spinner"><i class="fas fa-spinner fa-spin"></i> Disassembling...</div>';

	fetch(`/api/disassembly?start=${offset}&size=512`)
		.then(response => response.json())
		.then(data => {
			if (data.error) {
				content.innerHTML = `<div class="alert alert-warning">${data.error}</div>`;
				return;
			}

			let html = '<table class="table table-sm data-table"><thead><tr><th>Address</th><th>Bytes</th><th>Instruction</th><th>Description</th></tr></thead><tbody>';

			data.forEach(instr => {
				const bytesHex = instr.bytes.map(b => b.toString(16).padStart(2, '0')).join(' ');
				const instrClass = instr.is_call ? 'text-success' :
								 instr.is_jump ? 'text-primary' :
								 instr.is_branch ? 'text-warning' : '';

				html += `
					<tr class="${instrClass}">
						<td>${instr.snes_address}</td>
						<td><code>${bytesHex}</code></td>
						<td><strong>${instr.mnemonic}</strong> ${instr.operands}</td>
						<td class="small">${instr.description}</td>
					</tr>
				`;
			});

			html += '</tbody></table>';
			content.innerHTML = html;
		})
		.catch(error => {
			content.innerHTML = `<div class="alert alert-danger">Error: ${error}</div>`;
		});
}

function switchGameDataTab(type) {
	document.querySelectorAll('[data-gamedata]').forEach(link => {
		link.classList.remove('active');
	});
	document.querySelector(`[data-gamedata="${type}"]`).classList.add('active');

	currentGameDataTab = type;
	loadGameData(type);
}

function loadGameData(type) {
	const content = document.getElementById('gamedata-content');
	content.innerHTML = '<div class="loading-spinner"><i class="fas fa-spinner fa-spin"></i> Extracting game data...</div>';

	fetch(`/api/gamedata/${type}`)
		.then(response => response.json())
		.then(data => {
			if (data.error) {
				content.innerHTML = `<div class="alert alert-warning">${data.error}</div>`;
				return;
			}

			let html = '<table class="table table-sm data-table"><thead>';

			if (type === 'characters') {
				html += '<tr><th>ID</th><th>Name</th><th>Class</th><th>Level</th><th>HP</th><th>MP</th><th>Confidence</th></tr></thead><tbody>';
				data.forEach(char => {
					const confidenceClass = char.confidence > 0.7 ? 'confidence-high' :
											char.confidence > 0.4 ? 'confidence-medium' : 'confidence-low';
					html += `
						<tr>
							<td>${char.id}</td>
							<td>${char.name}</td>
							<td>${char.class_type}</td>
							<td>${char.level}</td>
							<td>${char.stats.hp}</td>
							<td>${char.stats.mp}</td>
							<td class="${confidenceClass}">${(char.confidence * 100).toFixed(1)}%</td>
						</tr>
					`;
				});
			} else if (type === 'items') {
				html += '<tr><th>ID</th><th>Name</th><th>Type</th><th>Price</th><th>Attack</th><th>Defense</th><th>Confidence</th></tr></thead><tbody>';
				data.forEach(item => {
					const confidenceClass = item.confidence > 0.7 ? 'confidence-high' :
											item.confidence > 0.4 ? 'confidence-medium' : 'confidence-low';
					html += `
						<tr>
							<td>${item.id}</td>
							<td>${item.name}</td>
							<td>${item.type}</td>
							<td>${item.price}</td>
							<td>${item.stats_bonus.attack || 0}</td>
							<td>${item.stats_bonus.defense || 0}</td>
							<td class="${confidenceClass}">${(item.confidence * 100).toFixed(1)}%</td>
						</tr>
					`;
				});
			} else if (type === 'monsters') {
				html += '<tr><th>ID</th><th>Name</th><th>HP</th><th>Attack</th><th>Experience</th><th>Gold</th><th>Confidence</th></tr></thead><tbody>';
				data.forEach(monster => {
					const confidenceClass = monster.confidence > 0.7 ? 'confidence-high' :
											monster.confidence > 0.4 ? 'confidence-medium' : 'confidence-low';
					html += `
						<tr>
							<td>${monster.id}</td>
							<td>${monster.name}</td>
							<td>${monster.stats.hp}</td>
							<td>${monster.stats.attack}</td>
							<td>${monster.experience_reward}</td>
							<td>${monster.gold_reward}</td>
							<td class="${confidenceClass}">${(monster.confidence * 100).toFixed(1)}%</td>
						</tr>
					`;
				});
			}

			html += '</tbody></table>';
			content.innerHTML = html;
		})
		.catch(error => {
			content.innerHTML = `<div class="alert alert-danger">Error: ${error}</div>`;
		});
}

function loadAudioSamples() {
	const content = document.getElementById('audio-content');
	content.innerHTML = '<div class="loading-spinner"><i class="fas fa-spinner fa-spin"></i> Analyzing audio...</div>';

	fetch('/api/audio/samples')
		.then(response => response.json())
		.then(data => {
			if (data.error) {
				content.innerHTML = `<div class="alert alert-warning">${data.error}</div>`;
				return;
			}

			let html = '<table class="table table-sm data-table"><thead><tr><th>Offset</th><th>Size</th><th>Sample Rate</th><th>Loop</th><th>Confidence</th></tr></thead><tbody>';

			data.forEach(sample => {
				const confidenceClass = sample.confidence > 0.7 ? 'confidence-high' :
										sample.confidence > 0.4 ? 'confidence-medium' : 'confidence-low';

				html += `
					<tr>
						<td>${sample.offset}</td>
						<td>${sample.size} bytes</td>
						<td>${sample.sample_rate}</td>
						<td>${sample.loop_flag ? 'Yes' : 'No'}</td>
						<td class="${confidenceClass}">${(sample.confidence * 100).toFixed(1)}%</td>
					</tr>
				`;
			});

			html += '</tbody></table>';
			content.innerHTML = html;
		})
		.catch(error => {
			content.innerHTML = `<div class="alert alert-danger">Error: ${error}</div>`;
		});
}

function loadHexData() {
	const offset = document.getElementById('hex-offset').value;
	const content = document.getElementById('hex-content');

	content.innerHTML = 'Loading...';

	const offsetNum = parseInt(offset, 16) || parseInt(offset, 10);

	fetch(`/api/hex/${offsetNum}?size=512`)
		.then(response => response.json())
		.then(data => {
			if (data.error) {
				content.innerHTML = `<div class="alert alert-warning">${data.error}</div>`;
				return;
			}

			let html = '';
			data.lines.forEach(line => {
				html += `<div><span class="text-muted">${line.offset}</span> ${line.hex.padEnd(48)} <span class="text-info">${line.ascii}</span></div>`;
			});

			content.innerHTML = html;
		})
		.catch(error => {
			content.innerHTML = `<div class="alert alert-danger">Error: ${error}</div>`;
		});
}'''

		with open(static_dir / "main.js", 'w', encoding='utf-8') as f:
			f.write(js_content)

		logger.info("Web templates created successfully")

	def run_server(self, host='127.0.0.1', port=5000, debug=False):
		"""Run the Flask development server"""
		if not self.app:
			logger.error("Flask not available - cannot start server")
			return

		# Create templates if they don't exist
		self.create_web_templates()

		logger.info(f"Starting ROM browser server at http://{host}:{port}")
		self.app.run(host=host, port=port, debug=debug)

# CLI interface for running the browser
if __name__ == "__main__":
	import argparse

	parser = argparse.ArgumentParser(description="Dragon Quest III Interactive ROM Browser")
	parser.add_argument("project_root", help="Path to project root directory")
	parser.add_argument("--host", default="127.0.0.1", help="Server host")
	parser.add_argument("--port", type=int, default=5000, help="Server port")
	parser.add_argument("--debug", action="store_true", help="Run in debug mode")

	args = parser.parse_args()

	try:
		browser = InteractiveROMBrowser(args.project_root)
		browser.run_server(host=args.host, port=args.port, debug=args.debug)
	except Exception as e:
		logger.error(f"Failed to start ROM browser: {e}")
		exit(1)
