"""
Dragon Quest III ROM Analysis - Performance Optimizer
Advanced caching, memory management, and optimization system

This module provides comprehensive performance optimizations for all ROM analysis
tools including intelligent caching, memory-mapped file access, lazy loading,
result memoization, and background processing for large datasets.

Features:
- Intelligent multi-level caching system
- Memory-mapped ROM access for large files
- Lazy loading of analysis components
- Result memoization with TTL expiration
- Background processing for expensive operations
- Memory usage profiling and optimization
- Configurable performance settings
- Progress tracking for long operations
"""

import os
import sys
import json
import time
import hashlib
import threading
import weakref
import mmap
import gc
import math
from pathlib import Path
from typing import Dict, List, Any, Optional, Callable, Union, Tuple
from dataclasses import dataclass, asdict
from functools import wraps, lru_cache
from concurrent.futures import ThreadPoolExecutor, as_completed
from collections import defaultdict, OrderedDict
import logging
import pickle
import sqlite3
from datetime import datetime, timedelta

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

@dataclass
class CacheEntry:
	"""Cache entry with metadata"""
	key: str
	value: Any
	timestamp: datetime
	access_count: int
	size_bytes: int
	ttl_seconds: Optional[int] = None

@dataclass
class PerformanceMetrics:
	"""Performance tracking metrics"""
	operation: str
	start_time: float
	end_time: float
	duration: float
	memory_usage_mb: float
	cache_hits: int
	cache_misses: int
	items_processed: int

class MemoryMappedROM:
	"""Memory-mapped ROM access for efficient large file handling"""

	def __init__(self, rom_path: str):
		self.rom_path = Path(rom_path)
		self._file = None
		self._mmap = None
		self.size = 0

		if self.rom_path.exists():
			self._file = open(self.rom_path, 'rb')
			self._mmap = mmap.mmap(self._file.fileno(), 0, access=mmap.ACCESS_READ)
			self.size = len(self._mmap)
			logger.info(f"Memory-mapped ROM: {self.size:,} bytes from {self.rom_path.name}")

	def read(self, offset: int, size: int) -> bytes:
		"""Read bytes from memory-mapped ROM"""
		if not self._mmap:
			raise RuntimeError("ROM not memory-mapped")

		if offset < 0 or offset + size > len(self._mmap):
			raise ValueError(f"Read out of bounds: offset={offset}, size={size}, rom_size={len(self._mmap)}")

		return self._mmap[offset:offset + size]

	def __getitem__(self, key):
		"""Support slice notation"""
		if not self._mmap:
			raise RuntimeError("ROM not memory-mapped")
		return self._mmap[key]

	def __len__(self):
		"""Get ROM size"""
		return self.size

	def close(self):
		"""Close memory-mapped file"""
		if self._mmap:
			self._mmap.close()
			self._mmap = None
		if self._file:
			self._file.close()
			self._file = None

	def __del__(self):
		"""Cleanup on deletion"""
		self.close()

class IntelligentCache:
	"""Multi-level intelligent caching system"""

	def __init__(self, max_memory_mb: int = 512, disk_cache_dir: Optional[str] = None):
		self.max_memory_bytes = max_memory_mb * 1024 * 1024
		self.memory_cache = OrderedDict()
		self.memory_usage = 0
		self.access_stats = defaultdict(int)
		self.lock = threading.RLock()

		# Disk cache
		if disk_cache_dir:
			self.disk_cache_dir = Path(disk_cache_dir)
			self.disk_cache_dir.mkdir(parents=True, exist_ok=True)
			self.disk_db_path = self.disk_cache_dir / "cache.db"
			self._init_disk_cache()
		else:
			self.disk_cache_dir = None
			self.disk_db_path = None

		logger.info(f"Intelligent cache initialized: {max_memory_mb}MB memory limit")

	def _init_disk_cache(self):
		"""Initialize SQLite disk cache"""
		if self.disk_db_path is None:
			return

		with sqlite3.connect(self.disk_db_path) as conn:
			conn.execute('''
				CREATE TABLE IF NOT EXISTS cache_entries (
					key TEXT PRIMARY KEY,
					value BLOB,
					timestamp TEXT,
					access_count INTEGER,
					size_bytes INTEGER,
					ttl_seconds INTEGER
				)
			''')
			conn.execute('CREATE INDEX IF NOT EXISTS idx_timestamp ON cache_entries(timestamp)')

	def _calculate_size(self, obj: Any) -> int:
		"""Estimate object size in bytes"""
		try:
			if isinstance(obj, (str, bytes)):
				return len(obj)
			elif isinstance(obj, dict):
				return sum(len(str(k)) + self._calculate_size(v) for k, v in obj.items())
			elif isinstance(obj, (list, tuple)):
				return sum(self._calculate_size(item) for item in obj)
			else:
				# Fallback: use pickle size estimation
				return len(pickle.dumps(obj, protocol=pickle.HIGHEST_PROTOCOL))
		except Exception:
			return 1024	# Default estimate

	def get(self, key: str) -> Optional[Any]:
		"""Get value from cache"""
		with self.lock:
			# Check memory cache first
			if key in self.memory_cache:
				entry = self.memory_cache[key]

				# Check TTL expiration
				if entry.ttl_seconds:
					age = (datetime.now() - entry.timestamp).total_seconds()
					if age > entry.ttl_seconds:
						del self.memory_cache[key]
						self.memory_usage -= entry.size_bytes
						return None

				# Move to end (LRU)
				self.memory_cache.move_to_end(key)
				entry.access_count += 1
				self.access_stats[key] += 1
				return entry.value

			# Check disk cache
			if self.disk_db_path:
				return self._get_from_disk(key)

			return None

	def put(self, key: str, value: Any, ttl_seconds: Optional[int] = None):
		"""Put value in cache"""
		with self.lock:
			size = self._calculate_size(value)

			# Remove existing entry if present
			if key in self.memory_cache:
				old_entry = self.memory_cache[key]
				self.memory_usage -= old_entry.size_bytes
				del self.memory_cache[key]

			# Create new entry
			entry = CacheEntry(
				key=key,
				value=value,
				timestamp=datetime.now(),
				access_count=1,
				size_bytes=size,
				ttl_seconds=ttl_seconds
			)

			# Evict if necessary
			while self.memory_usage + size > self.max_memory_bytes and self.memory_cache:
				self._evict_lru()

			# Add to memory cache if it fits
			if size <= self.max_memory_bytes:
				self.memory_cache[key] = entry
				self.memory_usage += size
			else:
				# Too large for memory cache, put directly to disk
				if self.disk_db_path:
					self._put_to_disk(key, entry)

	def _evict_lru(self):
		"""Evict least recently used entry"""
		if self.memory_cache:
			key, entry = self.memory_cache.popitem(last=False)
			self.memory_usage -= entry.size_bytes

			# Optionally move to disk cache
			if self.disk_db_path and entry.access_count > 1:
				self._put_to_disk(key, entry)

	def _get_from_disk(self, key: str) -> Optional[Any]:
		"""Get value from disk cache"""
		if self.disk_db_path is None:
			return None

		try:
			with sqlite3.connect(self.disk_db_path) as conn:
				cursor = conn.execute(
					'SELECT value, timestamp, access_count, ttl_seconds FROM cache_entries WHERE key = ?',
					(key,)
				)
				row = cursor.fetchone()

				if row:
					value_blob, timestamp_str, access_count, ttl_seconds = row
					timestamp = datetime.fromisoformat(timestamp_str)

					# Check TTL expiration
					if ttl_seconds:
						age = (datetime.now() - timestamp).total_seconds()
						if age > ttl_seconds:
							conn.execute('DELETE FROM cache_entries WHERE key = ?', (key,))
							return None

					# Update access count
					conn.execute(
						'UPDATE cache_entries SET access_count = access_count + 1 WHERE key = ?',
						(key,)
					)

					# Deserialize value
					value = pickle.loads(value_blob)
					self.access_stats[key] += 1
					return value
		except Exception as e:
			logger.error(f"Error reading from disk cache: {e}")

		return None

	def _put_to_disk(self, key: str, entry: CacheEntry):
		"""Put value to disk cache"""
		if self.disk_db_path is None:
			return

		try:
			with sqlite3.connect(self.disk_db_path) as conn:
				value_blob = pickle.dumps(entry.value, protocol=pickle.HIGHEST_PROTOCOL)
				conn.execute('''
					INSERT OR REPLACE INTO cache_entries
					(key, value, timestamp, access_count, size_bytes, ttl_seconds)
					VALUES (?, ?, ?, ?, ?, ?)
				''', (
					key,
					value_blob,
					entry.timestamp.isoformat(),
					entry.access_count,
					entry.size_bytes,
					entry.ttl_seconds
				))
		except Exception as e:
			logger.error(f"Error writing to disk cache: {e}")

	def clear(self):
		"""Clear all caches"""
		with self.lock:
			self.memory_cache.clear()
			self.memory_usage = 0
			self.access_stats.clear()

			if self.disk_db_path:
				try:
					with sqlite3.connect(self.disk_db_path) as conn:
						conn.execute('DELETE FROM cache_entries')
				except Exception as e:
					logger.error(f"Error clearing disk cache: {e}")

	def get_stats(self) -> Dict[str, Any]:
		"""Get cache statistics"""
		with self.lock:
			return {
				'memory_entries': len(self.memory_cache),
				'memory_usage_mb': self.memory_usage / (1024 * 1024),
				'memory_limit_mb': self.max_memory_bytes / (1024 * 1024),
				'access_stats': dict(self.access_stats),
				'total_accesses': sum(self.access_stats.values())
			}

class PerformanceProfiler:
	"""Performance profiling and monitoring"""

	def __init__(self):
		self.metrics = []
		self.active_operations = {}
		self.lock = threading.RLock()

	def start_operation(self, operation: str) -> str:
		"""Start tracking an operation"""
		with self.lock:
			operation_id = f"{operation}_{time.time()}"
			self.active_operations[operation_id] = {
				'operation': operation,
				'start_time': time.time(),
				'memory_start': self._get_memory_usage()
			}
			return operation_id

	def end_operation(self, operation_id: str, items_processed: int = 0,
					 cache_hits: int = 0, cache_misses: int = 0):
		"""End tracking an operation"""
		with self.lock:
			if operation_id in self.active_operations:
				start_data = self.active_operations.pop(operation_id)
				end_time = time.time()

				metrics = PerformanceMetrics(
					operation=start_data['operation'],
					start_time=start_data['start_time'],
					end_time=end_time,
					duration=end_time - start_data['start_time'],
					memory_usage_mb=self._get_memory_usage(),
					cache_hits=cache_hits,
					cache_misses=cache_misses,
					items_processed=items_processed
				)

				self.metrics.append(metrics)
				return metrics

	def _get_memory_usage(self) -> float:
		"""Get current memory usage in MB"""
		try:
			# Try to import psutil, fallback to basic method
			import psutil
			process = psutil.Process()
			return process.memory_info().rss / (1024 * 1024)
		except (ImportError, Exception):
			# Fallback: use gc statistics as approximation
			return 0.0

	def get_summary(self) -> Dict[str, Any]:
		"""Get performance summary"""
		with self.lock:
			if not self.metrics:
				return {'message': 'No metrics collected'}

			operations = defaultdict(list)
			for metric in self.metrics:
				operations[metric.operation].append(metric)

			summary = {}
			for operation, metrics_list in operations.items():
				durations = [m.duration for m in metrics_list]
				summary[operation] = {
					'count': len(metrics_list),
					'total_duration': sum(durations),
					'average_duration': sum(durations) / len(durations),
					'min_duration': min(durations),
					'max_duration': max(durations),
					'total_items_processed': sum(m.items_processed for m in metrics_list),
					'total_cache_hits': sum(m.cache_hits for m in metrics_list),
					'total_cache_misses': sum(m.cache_misses for m in metrics_list)
				}

			return summary

def memoize_with_ttl(ttl_seconds: int = 3600):
	"""Decorator for memoizing function results with TTL"""
	def decorator(func):
		cache = {}
		lock = threading.RLock()

		@wraps(func)
		def wrapper(*args, **kwargs):
			# Create cache key
			key = str(hash((args, tuple(sorted(kwargs.items())))))

			with lock:
				if key in cache:
					value, timestamp = cache[key]
					if time.time() - timestamp < ttl_seconds:
						return value
					else:
						del cache[key]

				# Compute and cache result
				result = func(*args, **kwargs)
				cache[key] = (result, time.time())

				# Cleanup old entries occasionally
				if len(cache) % 100 == 0:
					current_time = time.time()
					expired_keys = [
						k for k, (_, ts) in cache.items()
						if current_time - ts >= ttl_seconds
					]
					for k in expired_keys:
						del cache[k]

				return result

		return wrapper
	return decorator

class BackgroundProcessor:
	"""Background processing for expensive operations"""

	def __init__(self, max_workers: int = 4):
		self.executor = ThreadPoolExecutor(max_workers=max_workers)
		self.futures = {}
		self.results = {}
		self.lock = threading.RLock()

	def submit(self, task_id: str, func: Callable, *args, **kwargs) -> str:
		"""Submit a task for background processing"""
		with self.lock:
			if task_id in self.futures:
				return task_id	# Already submitted

			future = self.executor.submit(func, *args, **kwargs)
			self.futures[task_id] = future
			return task_id

	def is_complete(self, task_id: str) -> bool:
		"""Check if task is complete"""
		with self.lock:
			if task_id in self.results:
				return True
			if task_id in self.futures:
				future = self.futures[task_id]
				if future.done():
					try:
						result = future.result()
						self.results[task_id] = {'success': True, 'result': result}
					except Exception as e:
						self.results[task_id] = {'success': False, 'error': str(e)}
					del self.futures[task_id]
					return True
			return False

	def get_result(self, task_id: str) -> Optional[Dict[str, Any]]:
		"""Get task result"""
		with self.lock:
			if task_id in self.results:
				return self.results.pop(task_id)
			return None

	def get_progress(self) -> Dict[str, Any]:
		"""Get processing progress"""
		with self.lock:
			return {
				'active_tasks': len(self.futures),
				'completed_tasks': len(self.results),
				'task_ids': list(self.futures.keys()) + list(self.results.keys())
			}

class OptimizedROMAnalyzer:
	"""Optimized ROM analyzer with caching and performance monitoring"""

	def __init__(self, project_root: str, cache_size_mb: int = 256):
		self.project_root = Path(project_root)
		self.cache = IntelligentCache(
			max_memory_mb=cache_size_mb,
			disk_cache_dir=str(self.project_root / "cache")
		)
		self.profiler = PerformanceProfiler()
		self.background_processor = BackgroundProcessor()

		# Memory-mapped ROM access
		rom_files = [
			'Dragon Quest III - Soshite Densetsu he... (J).smc',	# Primary Japanese source
			'Dragon Quest III - english.smc',						# Reference translation
			'Dragon Quest III - english (patched).smc'				# Backup option
		]

		self.rom = None
		for rom_file in rom_files:
			rom_path = self.project_root / "static" / rom_file
			if rom_path.exists():
				self.rom = MemoryMappedROM(str(rom_path))
				break

		if not self.rom:
			raise FileNotFoundError("No ROM file found for optimization")

		logger.info("Optimized ROM analyzer initialized")

	@memoize_with_ttl(ttl_seconds=1800)	# 30 minute TTL
	def analyze_region_cached(self, offset: int, size: int, analysis_type: str) -> Dict[str, Any]:
		"""Cached region analysis"""
		cache_key = f"region_{analysis_type}_{offset:06X}_{size}"

		# Check cache first
		cached_result = self.cache.get(cache_key)
		if cached_result:
			return cached_result

		# Perform analysis
		operation_id = self.profiler.start_operation(f"analyze_region_{analysis_type}")

		if not self.rom:
			return {"error": "No ROM loaded"}

		try:
			data = self.rom.read(offset, size)			# Simple analysis based on type
			if analysis_type == "entropy":
				result = self._calculate_entropy(data)
			elif analysis_type == "patterns":
				result = self._find_patterns(data)
			elif analysis_type == "statistics":
				result = self._calculate_statistics(data)
			else:
				result = {"error": f"Unknown analysis type: {analysis_type}"}

			# Cache result
			self.cache.put(cache_key, result, ttl_seconds=1800)

			self.profiler.end_operation(operation_id, items_processed=size, cache_misses=1)
			return result

		except Exception as e:
			self.profiler.end_operation(operation_id, cache_misses=1)
			return {"error": str(e)}

	def _calculate_entropy(self, data: bytes) -> Dict[str, float]:
		"""Calculate data entropy"""
		if not data:
			return {"entropy": 0.0}

		byte_counts = defaultdict(int)
		for byte in data:
			byte_counts[byte] += 1

		entropy = 0.0
		data_len = len(data)

		for count in byte_counts.values():
			if count > 0:
				probability = count / data_len
				entropy -= probability * math.log2(probability)

		return {
			"entropy": entropy,
			"max_entropy": 8.0,
			"normalized_entropy": entropy / 8.0,
			"unique_bytes": len(byte_counts),
			"data_size": data_len
		}

	def _find_patterns(self, data: bytes) -> Dict[str, Any]:
		"""Find patterns in data"""
		patterns = {}

		# Find repeated byte sequences
		for pattern_len in [2, 3, 4]:
			pattern_counts = defaultdict(int)

			for i in range(len(data) - pattern_len + 1):
				pattern = data[i:i + pattern_len]
				pattern_counts[pattern] += 1

			# Get most common patterns
			common_patterns = sorted(
				pattern_counts.items(),
				key=lambda x: x[1],
				reverse=True
			)[:5]

			patterns[f"length_{pattern_len}"] = [
				{
					"pattern": pattern.hex().upper(),
					"count": count,
					"percentage": (count * 100.0) / max(1, len(data) - pattern_len + 1)
				}
				for pattern, count in common_patterns
				if count > 1
			]

		return patterns

	def _calculate_statistics(self, data: bytes) -> Dict[str, Any]:
		"""Calculate data statistics"""
		if not data:
			return {}

		byte_values = list(data)

		return {
			"size": len(data),
			"min_value": min(byte_values),
			"max_value": max(byte_values),
			"mean_value": sum(byte_values) / len(byte_values),
			"zero_bytes": byte_values.count(0),
			"ff_bytes": byte_values.count(0xFF),
			"null_percentage": (byte_values.count(0) * 100.0) / len(byte_values)
		}

	def batch_analyze(self, regions: List[Tuple[int, int]], analysis_type: str) -> Dict[int, Any]:
		"""Batch analyze multiple regions with background processing"""
		results = {}
		task_ids = []

		# Submit background tasks
		for i, (offset, size) in enumerate(regions):
			task_id = f"batch_{analysis_type}_{i}"
			self.background_processor.submit(
				task_id,
				self.analyze_region_cached,
				offset, size, analysis_type
			)
			task_ids.append((task_id, offset))

		# Wait for completion and collect results
		while task_ids:
			completed_tasks = []

			for task_id, offset in task_ids:
				if self.background_processor.is_complete(task_id):
					result = self.background_processor.get_result(task_id)
					if result and result['success']:
						results[offset] = result['result']
					else:
						results[offset] = {"error": result.get('error', 'Unknown error') if result else 'Task failed'}
					completed_tasks.append((task_id, offset))

			# Remove completed tasks
			for task in completed_tasks:
				task_ids.remove(task)

			if task_ids:
				time.sleep(0.1)	# Brief pause before checking again

		return results

	def get_performance_report(self) -> Dict[str, Any]:
		"""Get comprehensive performance report"""
		return {
			'cache_stats': self.cache.get_stats(),
			'profiler_summary': self.profiler.get_summary(),
			'background_progress': self.background_processor.get_progress(),
			'memory_mapped_rom_size': len(self.rom) if self.rom else 0
		}

	def cleanup(self):
		"""Cleanup resources"""
		if self.rom:
			self.rom.close()
		self.background_processor.executor.shutdown(wait=True)

# Usage example and testing
if __name__ == "__main__":
	# Example usage of optimized analyzer
	project_root = r"c:\Users\me\source\repos\dq3r-info"

	try:
		analyzer = OptimizedROMAnalyzer(project_root, cache_size_mb=128)

		print("Testing optimized ROM analysis...")

		# Test single region analysis
		result = analyzer.analyze_region_cached(0x8000, 1024, "entropy")
		print(f"Entropy analysis: {result}")

		# Test batch analysis
		regions = [(0x8000 + i * 1024, 512) for i in range(10)]
		batch_results = analyzer.batch_analyze(regions, "patterns")
		print(f"Batch analysis completed: {len(batch_results)} results")

		# Get performance report
		report = analyzer.get_performance_report()
		print(f"Performance report: {report}")

		analyzer.cleanup()

	except Exception as e:
		print(f"Error: {e}")
