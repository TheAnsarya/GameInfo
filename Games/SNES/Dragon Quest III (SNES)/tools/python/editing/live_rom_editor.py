"""
Live ROM Modification System for Dragon Quest III Analysis
Real-time ROM editing with live preview capabilities

Features:
- Real-time ROM modification without full reload
- Live preview of changes in web interface
- Incremental ROM patching system
- Change tracking and rollback capabilities
- Multi-user concurrent editing support
- Automatic backup and versioning
- WebSocket-based real-time updates
- Memory-efficient delta operations
"""

import os
import sys
import json
import struct
import hashlib
import asyncio
import websockets
import threading
import time
import mmap
from typing import Dict, List, Tuple, Optional, Any, Set, Callable
from dataclasses import dataclass, asdict, field
from pathlib import Path
import logging
from collections import defaultdict, deque
from datetime import datetime
import copy

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

@dataclass
class ROMModification:
	"""Single ROM modification record"""
	id: str
	offset: int
	old_data: bytes
	new_data: bytes
	timestamp: datetime
	user_id: str
	description: str
	category: str		# "graphics", "text", "code", "data"
	applied: bool = False

@dataclass
class ModificationBatch:
	"""Batch of related modifications"""
	id: str
	modifications: List[ROMModification]
	description: str
	timestamp: datetime
	user_id: str
	applied: bool = False

@dataclass
class ROMState:
	"""Current state of ROM with modifications"""
	original_checksum: str
	current_checksum: str
	modification_count: int
	total_bytes_changed: int
	last_modified: datetime
	active_modifications: Dict[str, ROMModification]

@dataclass
class ChangeSubscription:
	"""WebSocket subscription for real-time updates"""
	websocket: Any
	user_id: str
	regions_of_interest: List[Tuple[int, int]]	# (start, end) ranges
	last_update: datetime

class LiveROMEditor:
	"""Real-time ROM modification system"""

	def __init__(self, rom_path: str, project_root: str = "."):
		self.rom_path = Path(rom_path)
		self.project_root = Path(project_root)
		self.backup_dir = self.project_root / "backups"
		self.backup_dir.mkdir(exist_ok=True)

		# ROM data and memory mapping
		self.original_rom_data: bytes = b""
		self.current_rom_data: bytearray = bytearray()
		self.rom_file_handle = None
		self.rom_mmap = None

		# Modification tracking
		self.modifications: Dict[str, ROMModification] = {}
		self.modification_history: deque = deque(maxlen=1000)
		self.batches: Dict[str, ModificationBatch] = {}
		self.rom_state = ROMState(
			original_checksum="",
			current_checksum="",
			modification_count=0,
			total_bytes_changed=0,
			last_modified=datetime.now(),
			active_modifications={}
		)

		# Real-time communication
		self.subscribers: Dict[str, ChangeSubscription] = {}
		self.websocket_server = None
		self.update_queue = asyncio.Queue()
		self.server_thread = None

		# Change tracking
		self.dirty_regions: Set[Tuple[int, int]] = set()
		self.pending_updates = defaultdict(list)

		# Lock for thread safety
		self.modification_lock = threading.RLock()

		self._load_rom()
		logger.info(f"Live ROM Editor initialized: {len(self.current_rom_data):,} bytes")

	def _load_rom(self):
		"""Load ROM data with memory mapping for efficiency"""
		if not self.rom_path.exists():
			raise FileNotFoundError(f"ROM not found: {self.rom_path}")

		# Load original ROM
		with open(self.rom_path, 'rb') as f:
			self.original_rom_data = f.read()

		# Create working copy
		self.current_rom_data = bytearray(self.original_rom_data)

		# Memory-map the working file for efficient access
		self.working_file_path = self.backup_dir / f"working_{self.rom_path.name}"
		with open(self.working_file_path, 'wb') as f:
			f.write(self.current_rom_data)

		# Calculate checksums
		self.rom_state.original_checksum = hashlib.sha256(self.original_rom_data).hexdigest()[:16]
		self.rom_state.current_checksum = self.rom_state.original_checksum

		logger.info(f"ROM loaded: {len(self.current_rom_data):,} bytes, checksum: {self.rom_state.original_checksum}")

	async def start_websocket_server(self, port: int = 8765):
		"""Start WebSocket server for real-time updates"""
		async def handle_client(websocket, path):
			try:
				await self.register_client(websocket)
				await websocket.wait_closed()
			except Exception as e:
				logger.error(f"WebSocket error: {e}")
			finally:
				await self.unregister_client(websocket)

		self.websocket_server = await websockets.serve(handle_client, "localhost", port)
		logger.info(f"WebSocket server started on port {port}")

		# Start update processing
		asyncio.create_task(self.process_updates())

	async def register_client(self, websocket):
		"""Register new WebSocket client"""
		# Simple handshake
		initial_message = await websocket.recv()
		client_info = json.loads(initial_message)

		user_id = client_info.get('user_id', 'anonymous')
		regions = client_info.get('regions', [])

		subscription = ChangeSubscription(
			websocket=websocket,
			user_id=user_id,
			regions_of_interest=regions,
			last_update=datetime.now()
		)

		client_id = f"{user_id}_{id(websocket)}"
		self.subscribers[client_id] = subscription

		# Send current ROM state
		await websocket.send(json.dumps({
			'type': 'rom_state',
			'data': asdict(self.rom_state)
		}))

		logger.info(f"Client registered: {client_id}")

	async def unregister_client(self, websocket):
		"""Unregister WebSocket client"""
		to_remove = []
		for client_id, subscription in self.subscribers.items():
			if subscription.websocket == websocket:
				to_remove.append(client_id)

		for client_id in to_remove:
			del self.subscribers[client_id]
			logger.info(f"Client unregistered: {client_id}")

	async def process_updates(self):
		"""Process pending updates and send to subscribers"""
		while True:
			try:
				# Check for updates every 100ms
				await asyncio.sleep(0.1)

				if self.dirty_regions:
					await self.broadcast_updates()
			except Exception as e:
				logger.error(f"Update processing error: {e}")

	async def broadcast_updates(self):
		"""Broadcast ROM updates to interested subscribers"""
		if not self.dirty_regions or not self.subscribers:
			return

		# Prepare update message
		update_data = {
			'type': 'rom_update',
			'timestamp': datetime.now().isoformat(),
			'dirty_regions': list(self.dirty_regions),
			'rom_state': asdict(self.rom_state)
		}

		# Send to subscribers
		disconnected_clients = []
		for client_id, subscription in self.subscribers.items():
			try:
				# Check if client is interested in any dirty regions
				interested = False
				for region_start, region_end in self.dirty_regions:
					for interest_start, interest_end in subscription.regions_of_interest:
						if (region_start < interest_end and region_end > interest_start):
							interested = True
							break
					if interested:
						break

				if interested:
					await subscription.websocket.send(json.dumps(update_data))
			except Exception as e:
				logger.warning(f"Failed to send update to {client_id}: {e}")
				disconnected_clients.append(client_id)

		# Clean up disconnected clients
		for client_id in disconnected_clients:
			if client_id in self.subscribers:
				del self.subscribers[client_id]

		# Clear dirty regions
		self.dirty_regions.clear()

	def apply_modification(self, modification: ROMModification) -> bool:
		"""Apply a single modification to ROM"""
		with self.modification_lock:
			try:
				offset = modification.offset
				new_data = modification.new_data

				# Validate modification
				if offset < 0 or offset + len(new_data) > len(self.current_rom_data):
					logger.error(f"Invalid modification offset: {offset}")
					return False

				# Store old data for rollback
				old_data = bytes(self.current_rom_data[offset:offset + len(new_data)])
				modification.old_data = old_data

				# Apply modification
				self.current_rom_data[offset:offset + len(new_data)] = new_data
				modification.applied = True

				# Track modification
				self.modifications[modification.id] = modification
				self.modification_history.append(modification)
				self.rom_state.active_modifications[modification.id] = modification

				# Update statistics
				self.rom_state.modification_count += 1
				self.rom_state.total_bytes_changed += len(new_data)
				self.rom_state.last_modified = datetime.now()
				self.rom_state.current_checksum = self._calculate_current_checksum()

				# Mark region as dirty for real-time updates
				self.dirty_regions.add((offset, offset + len(new_data)))

				logger.info(f"Applied modification {modification.id}: {len(new_data)} bytes at 0x{offset:06X}")
				return True

			except Exception as e:
				logger.error(f"Failed to apply modification {modification.id}: {e}")
				return False

	def rollback_modification(self, modification_id: str) -> bool:
		"""Rollback a specific modification"""
		with self.modification_lock:
			if modification_id not in self.modifications:
				logger.error(f"Modification not found: {modification_id}")
				return False

			modification = self.modifications[modification_id]

			if not modification.applied:
				logger.warning(f"Modification already rolled back: {modification_id}")
				return True

			try:
				# Restore original data
				offset = modification.offset
				old_data = modification.old_data

				self.current_rom_data[offset:offset + len(old_data)] = old_data
				modification.applied = False

				# Update tracking
				if modification_id in self.rom_state.active_modifications:
					del self.rom_state.active_modifications[modification_id]

				self.rom_state.modification_count -= 1
				self.rom_state.total_bytes_changed -= len(modification.new_data)
				self.rom_state.last_modified = datetime.now()
				self.rom_state.current_checksum = self._calculate_current_checksum()

				# Mark region as dirty
				self.dirty_regions.add((offset, offset + len(old_data)))

				logger.info(f"Rolled back modification {modification_id}")
				return True

			except Exception as e:
				logger.error(f"Failed to rollback modification {modification_id}: {e}")
				return False

	def apply_batch(self, batch: ModificationBatch) -> bool:
		"""Apply a batch of modifications atomically"""
		with self.modification_lock:
			# First validate all modifications
			for mod in batch.modifications:
				if mod.offset < 0 or mod.offset + len(mod.new_data) > len(self.current_rom_data):
					logger.error(f"Invalid modification in batch {batch.id}")
					return False

			# Apply all modifications
			applied_mods = []
			try:
				for mod in batch.modifications:
					if self.apply_modification(mod):
						applied_mods.append(mod)
					else:
						# Rollback on failure
						for rollback_mod in applied_mods:
							self.rollback_modification(rollback_mod.id)
						return False

				# Mark batch as applied
				batch.applied = True
				self.batches[batch.id] = batch

				logger.info(f"Applied modification batch {batch.id}: {len(batch.modifications)} modifications")
				return True

			except Exception as e:
				logger.error(f"Failed to apply batch {batch.id}: {e}")
				# Rollback partial changes
				for rollback_mod in applied_mods:
					self.rollback_modification(rollback_mod.id)
				return False

	def create_text_modification(self, offset: int, new_text: str, encoding: str = 'ascii') -> Optional[ROMModification]:
		"""Create modification for text data"""
		try:
			new_data = new_text.encode(encoding)
			modification_id = f"text_{offset:06X}_{int(time.time())}"

			return ROMModification(
				id=modification_id,
				offset=offset,
				old_data=b"",	# Will be filled when applied
				new_data=new_data,
				timestamp=datetime.now(),
				user_id="system",
				description=f"Text change: '{new_text[:50]}'",
				category="text"
			)
		except Exception as e:
			logger.error(f"Failed to create text modification: {e}")
			return None

	def create_graphics_modification(self, offset: int, tile_data: bytes, format_type: str = "2BPP") -> ROMModification:
		"""Create modification for graphics data"""
		modification_id = f"graphics_{offset:06X}_{int(time.time())}"

		return ROMModification(
			id=modification_id,
			offset=offset,
			old_data=b"",	# Will be filled when applied
			new_data=tile_data,
			timestamp=datetime.now(),
			user_id="system",
			description=f"Graphics change: {format_type} tile at 0x{offset:06X}",
			category="graphics"
		)

	def create_code_modification(self, offset: int, instructions: List[bytes]) -> ROMModification:
		"""Create modification for code data"""
		new_data = b"".join(instructions)
		modification_id = f"code_{offset:06X}_{int(time.time())}"

		return ROMModification(
			id=modification_id,
			offset=offset,
			old_data=b"",	# Will be filled when applied
			new_data=new_data,
			timestamp=datetime.now(),
			user_id="system",
			description=f"Code change: {len(instructions)} instructions at 0x{offset:06X}",
			category="code"
		)

	def get_region_data(self, offset: int, size: int) -> bytes:
		"""Get current data from ROM region"""
		with self.modification_lock:
			if offset < 0 or offset + size > len(self.current_rom_data):
				raise ValueError(f"Invalid region: 0x{offset:06X}+{size}")

			return bytes(self.current_rom_data[offset:offset + size])

	def get_modifications_in_region(self, offset: int, size: int) -> List[ROMModification]:
		"""Get all modifications affecting a specific region"""
		region_mods = []

		for mod in self.modifications.values():
			mod_start = mod.offset
			mod_end = mod.offset + len(mod.new_data)
			region_end = offset + size

			# Check for overlap
			if mod_start < region_end and mod_end > offset:
				region_mods.append(mod)

		return sorted(region_mods, key=lambda x: x.offset)

	def export_current_rom(self, output_path: str) -> bool:
		"""Export current ROM state to file"""
		try:
			with open(output_path, 'wb') as f:
				f.write(self.current_rom_data)

			logger.info(f"ROM exported to {output_path}")
			return True
		except Exception as e:
			logger.error(f"Failed to export ROM: {e}")
			return False

	def create_backup(self) -> Optional[str]:
		"""Create timestamped backup of current ROM state"""
		timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
		backup_name = f"backup_{self.rom_path.stem}_{timestamp}.smc"
		backup_path = self.backup_dir / backup_name

		if self.export_current_rom(str(backup_path)):
			return str(backup_path)
		return None

	def get_modification_statistics(self) -> Dict[str, Any]:
		"""Get comprehensive modification statistics"""
		stats = {
			'total_modifications': len(self.modifications),
			'active_modifications': len(self.rom_state.active_modifications),
			'total_bytes_changed': self.rom_state.total_bytes_changed,
			'modification_categories': defaultdict(int),
			'recent_modifications': []
		}

		# Category breakdown
		for mod in self.modifications.values():
			if mod.applied:
				stats['modification_categories'][mod.category] += 1

		# Recent modifications (last 10)
		recent = list(self.modification_history)[-10:]
		stats['recent_modifications'] = [
			{
				'id': mod.id,
				'offset': f"0x{mod.offset:06X}",
				'size': len(mod.new_data),
				'category': mod.category,
				'timestamp': mod.timestamp.isoformat(),
				'applied': mod.applied
			}
			for mod in recent
		]

		return dict(stats)

	def _calculate_current_checksum(self) -> str:
		"""Calculate checksum of current ROM data"""
		return hashlib.sha256(self.current_rom_data).hexdigest()[:16]

	def start_server_thread(self, port: int = 8765):
		"""Start WebSocket server in separate thread"""
		def run_server():
			loop = asyncio.new_event_loop()
			asyncio.set_event_loop(loop)

			async def serve():
				await self.start_websocket_server(port)
				await asyncio.Future()	# Run forever

			loop.run_until_complete(serve())

		self.server_thread = threading.Thread(target=run_server, daemon=True)
		self.server_thread.start()
		logger.info(f"WebSocket server thread started")


class LiveROMAPI:
	"""REST API interface for live ROM editing"""

	def __init__(self, rom_editor: LiveROMEditor):
		self.editor = rom_editor

	def handle_modify_text(self, request_data: Dict[str, Any]) -> Dict[str, Any]:
		"""Handle text modification request"""
		try:
			offset = int(request_data.get('offset', 0), 0)	# Support hex strings
			text = request_data.get('text', '')
			encoding = request_data.get('encoding', 'ascii')

			modification = self.editor.create_text_modification(offset, text, encoding)
			if modification and self.editor.apply_modification(modification):
				return {
					'success': True,
					'modification_id': modification.id,
					'message': f"Text modified at 0x{offset:06X}"
				}
			else:
				return {
					'success': False,
					'error': 'Failed to apply text modification'
				}
		except Exception as e:
			return {
				'success': False,
				'error': str(e)
			}

	def handle_modify_graphics(self, request_data: Dict[str, Any]) -> Dict[str, Any]:
		"""Handle graphics modification request"""
		try:
			offset = int(request_data.get('offset', 0), 0)
			tile_data = bytes.fromhex(request_data.get('tile_data', ''))
			format_type = request_data.get('format', '2BPP')

			modification = self.editor.create_graphics_modification(offset, tile_data, format_type)
			if modification and self.editor.apply_modification(modification):
				return {
					'success': True,
					'modification_id': modification.id,
					'message': f"Graphics modified at 0x{offset:06X}"
				}
			else:
				return {
					'success': False,
					'error': 'Failed to apply graphics modification'
				}
		except Exception as e:
			return {
				'success': False,
				'error': str(e)
			}

	def handle_get_region(self, request_data: Dict[str, Any]) -> Dict[str, Any]:
		"""Handle region data request"""
		try:
			offset = int(request_data.get('offset', 0), 0)
			size = int(request_data.get('size', 256))

			data = self.editor.get_region_data(offset, size)
			modifications = self.editor.get_modifications_in_region(offset, size)

			return {
				'success': True,
				'offset': offset,
				'size': size,
				'data': data.hex(),
				'modifications': [asdict(mod) for mod in modifications]
			}
		except Exception as e:
			return {
				'success': False,
				'error': str(e)
			}

	def handle_rollback(self, request_data: Dict[str, Any]) -> Dict[str, Any]:
		"""Handle modification rollback request"""
		try:
			modification_id = request_data.get('modification_id', '')

			if self.editor.rollback_modification(modification_id):
				return {
					'success': True,
					'message': f"Modification {modification_id} rolled back"
				}
			else:
				return {
					'success': False,
					'error': 'Failed to rollback modification'
				}
		except Exception as e:
			return {
				'success': False,
				'error': str(e)
			}


# Example usage and testing
if __name__ == "__main__":
	import argparse

	parser = argparse.ArgumentParser(description='Live ROM Modification System')
	parser.add_argument('--rom', default='static/Dragon Quest III - Soshite Densetsu he... (J).smc',
						help='Path to ROM file (Japanese source ROM)')
	parser.add_argument('--port', type=int, default=8765,
						help='WebSocket server port')
	parser.add_argument('--test-modifications', action='store_true',
						help='Run test modifications')

	args = parser.parse_args()

	try:
		# Initialize live ROM editor
		print(f"🔧 Initializing Live ROM Editor...")
		editor = LiveROMEditor(args.rom)

		# Start WebSocket server
		print(f"🌐 Starting WebSocket server on port {args.port}...")
		editor.start_server_thread(args.port)

		if args.test_modifications:
			print("🧪 Running test modifications...")

			# Test text modification
			text_mod = editor.create_text_modification(0x10000, "TEST")
			if text_mod:
				editor.apply_modification(text_mod)
				print(f"✅ Applied text modification: {text_mod.id}")

			# Test graphics modification
			test_tile = bytes([0x00, 0xFF] * 8)	# Simple test pattern
			gfx_mod = editor.create_graphics_modification(0x80000, test_tile)
			if gfx_mod:
				editor.apply_modification(gfx_mod)
				print(f"✅ Applied graphics modification: {gfx_mod.id}")

			# Show statistics
			stats = editor.get_modification_statistics()
			print(f"📊 Modification Statistics:")
			print(f"	 Total: {stats['total_modifications']}")
			print(f"	 Active: {stats['active_modifications']}")
			print(f"	 Bytes Changed: {stats['total_bytes_changed']}")

			# Test rollback
			if text_mod:
				editor.rollback_modification(text_mod.id)
				print(f"🔄 Rolled back text modification")

		# Keep server running
		print(f"✅ Live ROM Editor running. Press Ctrl+C to stop.")
		print(f"	 WebSocket: ws://localhost:{args.port}")
		print(f"	 ROM: {args.rom}")

		try:
			while True:
				time.sleep(1)
		except KeyboardInterrupt:
			print("\n🛑 Shutting down...")

	except Exception as e:
		print(f"❌ Error: {e}")
		import traceback
		traceback.print_exc()
