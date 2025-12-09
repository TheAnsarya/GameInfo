#!/usr/bin/env python3
"""
Debug Logger - Logging system for ROM debugging and analysis.

Tools for creating, managing, and analyzing debug logs during
ROM hacking and reverse engineering sessions.

Usage:
	python debug_logger.py <session.log>
	python debug_logger.py --analyze
	python debug_logger.py --export

Features:
	- Session logging
	- Memory snapshots
	- Execution traces
	- Breakpoint management
	- Log analysis
"""

import argparse
import datetime
import json
import os
import re
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


class LogLevel(Enum):
	"""Log severity levels."""
	DEBUG = 10
	INFO = 20
	WARNING = 30
	ERROR = 40
	CRITICAL = 50


class EventType(Enum):
	"""Types of logged events."""
	MEMORY_READ = auto()
	MEMORY_WRITE = auto()
	REGISTER_CHANGE = auto()
	BREAKPOINT_HIT = auto()
	INSTRUCTION = auto()
	INTERRUPT = auto()
	SUBROUTINE_CALL = auto()
	SUBROUTINE_RETURN = auto()
	STATE_SAVE = auto()
	STATE_LOAD = auto()
	INPUT = auto()
	FRAME = auto()
	CUSTOM = auto()


@dataclass
class LogEntry:
	"""A single log entry."""
	timestamp: datetime.datetime
	level: LogLevel
	event_type: EventType
	message: str
	address: Optional[int] = None
	value: Optional[int] = None
	old_value: Optional[int] = None
	pc: Optional[int] = None  # Program counter
	frame: int = 0
	cycle: int = 0
	metadata: Dict[str, Any] = field(default_factory=dict)
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"timestamp": self.timestamp.isoformat(),
			"level": self.level.name,
			"event_type": self.event_type.name,
			"message": self.message,
			"address": f"0x{self.address:X}" if self.address is not None else None,
			"value": self.value,
			"old_value": self.old_value,
			"pc": f"0x{self.pc:X}" if self.pc is not None else None,
			"frame": self.frame,
			"cycle": self.cycle,
			"metadata": self.metadata
		}
	
	def to_string(self, format: str = "full") -> str:
		"""Format as string."""
		if format == "compact":
			addr_str = f"${self.address:04X}" if self.address is not None else ""
			return f"[{self.level.name[0]}] {addr_str} {self.message}"
		
		elif format == "trace":
			pc_str = f"${self.pc:04X}" if self.pc is not None else "----"
			return f"F{self.frame:05d} {pc_str}: {self.message}"
		
		else:  # full
			time_str = self.timestamp.strftime("%H:%M:%S.%f")[:-3]
			addr_str = f" @${self.address:04X}" if self.address is not None else ""
			val_str = f" = ${self.value:02X}" if self.value is not None else ""
			return f"[{time_str}] {self.level.name:8} {self.event_type.name:16}{addr_str}{val_str} {self.message}"
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "LogEntry":
		"""Create from dictionary."""
		addr = data.get("address")
		if isinstance(addr, str):
			addr = int(addr, 0)
		
		pc = data.get("pc")
		if isinstance(pc, str):
			pc = int(pc, 0)
		
		return cls(
			timestamp=datetime.datetime.fromisoformat(data.get("timestamp", datetime.datetime.now().isoformat())),
			level=LogLevel[data.get("level", "INFO")],
			event_type=EventType[data.get("event_type", "CUSTOM")],
			message=data.get("message", ""),
			address=addr,
			value=data.get("value"),
			old_value=data.get("old_value"),
			pc=pc,
			frame=data.get("frame", 0),
			cycle=data.get("cycle", 0),
			metadata=data.get("metadata", {})
		)


@dataclass
class MemorySnapshot:
	"""Snapshot of memory state."""
	timestamp: datetime.datetime
	frame: int
	regions: Dict[str, bytes]  # name -> data
	description: str = ""
	
	def compare(self, other: "MemorySnapshot") -> List[Tuple[str, int, int, int]]:
		"""Compare with another snapshot.
		
		Returns list of (region, offset, old_value, new_value)
		"""
		changes = []
		
		for name, data in self.regions.items():
			if name not in other.regions:
				continue
			
			other_data = other.regions[name]
			for i in range(min(len(data), len(other_data))):
				if data[i] != other_data[i]:
					changes.append((name, i, data[i], other_data[i]))
		
		return changes
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"timestamp": self.timestamp.isoformat(),
			"frame": self.frame,
			"regions": {k: v.hex() for k, v in self.regions.items()},
			"description": self.description
		}


@dataclass
class Breakpoint:
	"""Debug breakpoint."""
	id: int
	address: int
	enabled: bool = True
	condition: str = ""  # Expression
	hit_count: int = 0
	break_on_execute: bool = True
	break_on_read: bool = False
	break_on_write: bool = False
	log_message: str = ""
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"id": self.id,
			"address": f"0x{self.address:X}",
			"enabled": self.enabled,
			"condition": self.condition,
			"hit_count": self.hit_count,
			"break_on_execute": self.break_on_execute,
			"break_on_read": self.break_on_read,
			"break_on_write": self.break_on_write,
			"log_message": self.log_message
		}


@dataclass
class WatchPoint:
	"""Memory watch point."""
	id: int
	address: int
	size: int = 1
	name: str = ""
	format: str = "hex"  # hex, dec, bin, char
	enabled: bool = True
	
	def format_value(self, data: bytes) -> str:
		"""Format watched value."""
		if len(data) == 0:
			return "???"
		
		if self.format == "hex":
			return " ".join(f"{b:02X}" for b in data)
		elif self.format == "dec":
			if len(data) == 1:
				return str(data[0])
			elif len(data) == 2:
				return str(data[0] | (data[1] << 8))
			else:
				return " ".join(str(b) for b in data)
		elif self.format == "bin":
			return " ".join(f"{b:08b}" for b in data)
		elif self.format == "char":
			return "".join(chr(b) if 32 <= b < 127 else "." for b in data)
		
		return data.hex()


class DebugSession:
	"""Debug logging session."""
	
	def __init__(self, name: str = ""):
		self.name = name or f"Session_{datetime.datetime.now():%Y%m%d_%H%M%S}"
		self.start_time = datetime.datetime.now()
		self.entries: List[LogEntry] = []
		self.snapshots: List[MemorySnapshot] = []
		self.breakpoints: Dict[int, Breakpoint] = {}
		self.watchpoints: Dict[int, WatchPoint] = {}
		self.next_bp_id = 1
		self.next_wp_id = 1
		
		# Current state
		self.frame = 0
		self.cycle = 0
		self.pc = 0
		
		# Filtering
		self.min_level = LogLevel.DEBUG
		self.enabled_events: set = set(EventType)
	
	def log(self, message: str, level: LogLevel = LogLevel.INFO,
			event_type: EventType = EventType.CUSTOM,
			address: int = None, value: int = None,
			**metadata) -> LogEntry:
		"""Add log entry."""
		entry = LogEntry(
			timestamp=datetime.datetime.now(),
			level=level,
			event_type=event_type,
			message=message,
			address=address,
			value=value,
			pc=self.pc,
			frame=self.frame,
			cycle=self.cycle,
			metadata=metadata
		)
		
		self.entries.append(entry)
		return entry
	
	def debug(self, message: str, **kwargs) -> LogEntry:
		"""Log debug message."""
		return self.log(message, LogLevel.DEBUG, **kwargs)
	
	def info(self, message: str, **kwargs) -> LogEntry:
		"""Log info message."""
		return self.log(message, LogLevel.INFO, **kwargs)
	
	def warning(self, message: str, **kwargs) -> LogEntry:
		"""Log warning message."""
		return self.log(message, LogLevel.WARNING, **kwargs)
	
	def error(self, message: str, **kwargs) -> LogEntry:
		"""Log error message."""
		return self.log(message, LogLevel.ERROR, **kwargs)
	
	def log_memory_read(self, address: int, value: int, 
						message: str = "") -> LogEntry:
		"""Log memory read."""
		msg = message or f"Read ${value:02X} from ${address:04X}"
		return self.log(msg, LogLevel.DEBUG, EventType.MEMORY_READ,
						address=address, value=value)
	
	def log_memory_write(self, address: int, value: int,
						 old_value: int = None, message: str = "") -> LogEntry:
		"""Log memory write."""
		if old_value is not None:
			msg = message or f"Write ${value:02X} to ${address:04X} (was ${old_value:02X})"
		else:
			msg = message or f"Write ${value:02X} to ${address:04X}"
		
		entry = self.log(msg, LogLevel.DEBUG, EventType.MEMORY_WRITE,
						 address=address, value=value)
		entry.old_value = old_value
		return entry
	
	def log_instruction(self, address: int, opcode: str,
						operand: str = "") -> LogEntry:
		"""Log instruction execution."""
		msg = f"{opcode} {operand}".strip()
		return self.log(msg, LogLevel.DEBUG, EventType.INSTRUCTION,
						address=address)
	
	def add_breakpoint(self, address: int, **kwargs) -> Breakpoint:
		"""Add breakpoint."""
		bp = Breakpoint(
			id=self.next_bp_id,
			address=address,
			**kwargs
		)
		self.breakpoints[bp.id] = bp
		self.next_bp_id += 1
		
		self.info(f"Breakpoint {bp.id} set at ${address:04X}")
		return bp
	
	def remove_breakpoint(self, bp_id: int) -> bool:
		"""Remove breakpoint."""
		if bp_id in self.breakpoints:
			bp = self.breakpoints[bp_id]
			del self.breakpoints[bp_id]
			self.info(f"Breakpoint {bp_id} removed from ${bp.address:04X}")
			return True
		return False
	
	def add_watchpoint(self, address: int, size: int = 1,
					   name: str = "", format: str = "hex") -> WatchPoint:
		"""Add memory watch."""
		wp = WatchPoint(
			id=self.next_wp_id,
			address=address,
			size=size,
			name=name or f"Watch_{address:04X}",
			format=format
		)
		self.watchpoints[wp.id] = wp
		self.next_wp_id += 1
		return wp
	
	def take_snapshot(self, regions: Dict[str, bytes],
					  description: str = "") -> MemorySnapshot:
		"""Take memory snapshot."""
		snapshot = MemorySnapshot(
			timestamp=datetime.datetime.now(),
			frame=self.frame,
			regions=regions,
			description=description
		)
		self.snapshots.append(snapshot)
		self.info(f"Snapshot taken: {description or f'Snapshot {len(self.snapshots)}'}")
		return snapshot
	
	def get_filtered_entries(self) -> List[LogEntry]:
		"""Get entries matching current filters."""
		return [
			e for e in self.entries
			if e.level.value >= self.min_level.value
			and e.event_type in self.enabled_events
		]
	
	def search(self, query: str) -> List[LogEntry]:
		"""Search log entries."""
		results = []
		pattern = re.compile(query, re.IGNORECASE)
		
		for entry in self.entries:
			if pattern.search(entry.message):
				results.append(entry)
		
		return results
	
	def analyze_memory_accesses(self) -> Dict[int, Dict[str, int]]:
		"""Analyze memory access patterns."""
		accesses: Dict[int, Dict[str, int]] = {}
		
		for entry in self.entries:
			if entry.address is None:
				continue
			
			if entry.address not in accesses:
				accesses[entry.address] = {"reads": 0, "writes": 0}
			
			if entry.event_type == EventType.MEMORY_READ:
				accesses[entry.address]["reads"] += 1
			elif entry.event_type == EventType.MEMORY_WRITE:
				accesses[entry.address]["writes"] += 1
		
		return accesses
	
	def find_value_changes(self, address: int) -> List[LogEntry]:
		"""Find all value changes at address."""
		return [
			e for e in self.entries
			if e.address == address and e.event_type == EventType.MEMORY_WRITE
		]
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert session to dictionary."""
		return {
			"name": self.name,
			"start_time": self.start_time.isoformat(),
			"frame": self.frame,
			"cycle": self.cycle,
			"entries": [e.to_dict() for e in self.entries],
			"snapshots": [s.to_dict() for s in self.snapshots],
			"breakpoints": [bp.to_dict() for bp in self.breakpoints.values()],
			"watchpoints": [wp.__dict__ for wp in self.watchpoints.values()]
		}
	
	def save(self, filepath: str) -> None:
		"""Save session to file."""
		with open(filepath, "w") as f:
			json.dump(self.to_dict(), f, indent="\t")
	
	def export_text(self, filepath: str, format: str = "full") -> None:
		"""Export log as text file."""
		with open(filepath, "w") as f:
			f.write(f"Debug Session: {self.name}\n")
			f.write(f"Started: {self.start_time}\n")
			f.write(f"Entries: {len(self.entries)}\n")
			f.write("=" * 60 + "\n\n")
			
			for entry in self.entries:
				f.write(entry.to_string(format) + "\n")
	
	@classmethod
	def load(cls, filepath: str) -> "DebugSession":
		"""Load session from file."""
		with open(filepath, "r") as f:
			data = json.load(f)
		
		session = cls(data.get("name", ""))
		session.start_time = datetime.datetime.fromisoformat(
			data.get("start_time", datetime.datetime.now().isoformat())
		)
		session.frame = data.get("frame", 0)
		session.cycle = data.get("cycle", 0)
		
		for entry_data in data.get("entries", []):
			session.entries.append(LogEntry.from_dict(entry_data))
		
		return session


class LogAnalyzer:
	"""Analyze debug logs."""
	
	def __init__(self, session: DebugSession):
		self.session = session
	
	def get_statistics(self) -> Dict[str, Any]:
		"""Get session statistics."""
		entries = self.session.entries
		
		level_counts = {}
		event_counts = {}
		
		for entry in entries:
			level_counts[entry.level.name] = level_counts.get(entry.level.name, 0) + 1
			event_counts[entry.event_type.name] = event_counts.get(entry.event_type.name, 0) + 1
		
		return {
			"total_entries": len(entries),
			"duration": str(datetime.datetime.now() - self.session.start_time),
			"frames": self.session.frame,
			"by_level": level_counts,
			"by_event": event_counts,
			"breakpoints": len(self.session.breakpoints),
			"watchpoints": len(self.session.watchpoints),
			"snapshots": len(self.session.snapshots)
		}
	
	def get_hot_addresses(self, top_n: int = 20) -> List[Tuple[int, int]]:
		"""Get most frequently accessed addresses."""
		accesses = self.session.analyze_memory_accesses()
		
		# Sort by total accesses
		sorted_addrs = sorted(
			accesses.items(),
			key=lambda x: x[1]["reads"] + x[1]["writes"],
			reverse=True
		)
		
		return [(addr, data["reads"] + data["writes"]) 
				for addr, data in sorted_addrs[:top_n]]
	
	def find_patterns(self) -> List[Dict[str, Any]]:
		"""Find interesting patterns in log."""
		patterns = []
		
		# Find repeated sequences
		# Find error clusters
		# Find unusual memory access patterns
		
		# Example: Find addresses written multiple times in sequence
		last_addr = None
		repeat_count = 0
		
		for entry in self.session.entries:
			if entry.event_type == EventType.MEMORY_WRITE:
				if entry.address == last_addr:
					repeat_count += 1
				else:
					if repeat_count >= 3:
						patterns.append({
							"type": "repeated_write",
							"address": last_addr,
							"count": repeat_count
						})
					last_addr = entry.address
					repeat_count = 1
		
		return patterns


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Debug Logger")
	parser.add_argument("file", nargs="?", help="Session file")
	parser.add_argument("--new", "-n", action="store_true",
						help="Create new session")
	parser.add_argument("--analyze", "-a", action="store_true",
						help="Analyze session")
	parser.add_argument("--export", "-e", help="Export to text file")
	parser.add_argument("--search", "-s", help="Search entries")
	parser.add_argument("--stats", action="store_true",
						help="Show statistics")
	parser.add_argument("--hot", type=int, default=0,
						help="Show N hot addresses")
	parser.add_argument("--format", "-f",
						choices=["full", "compact", "trace"],
						default="full", help="Output format")
	
	args = parser.parse_args()
	
	session = DebugSession()
	
	# Load existing session
	if args.file and os.path.exists(args.file):
		session = DebugSession.load(args.file)
		print(f"Loaded session: {session.name}")
		print(f"Entries: {len(session.entries)}")
	
	# Create new session
	elif args.new:
		session = DebugSession()
		print(f"Created new session: {session.name}")
		
		# Demo entries
		session.info("Session started")
		session.log_memory_write(0x0010, 0x42, 0x00)
		session.log_memory_read(0x0010, 0x42)
		session.log_instruction(0x8000, "LDA", "#$42")
		session.warning("Test warning")
		
		if args.file:
			session.save(args.file)
			print(f"Saved: {args.file}")
		return
	
	# Analyze
	if args.analyze or args.stats:
		analyzer = LogAnalyzer(session)
		stats = analyzer.get_statistics()
		
		print(f"\nSession Statistics:")
		print(f"  Total entries: {stats['total_entries']}")
		print(f"  Duration: {stats['duration']}")
		print(f"  Frames: {stats['frames']}")
		print(f"\nBy Level:")
		for level, count in stats['by_level'].items():
			print(f"  {level}: {count}")
		print(f"\nBy Event:")
		for event, count in sorted(stats['by_event'].items(), 
								   key=lambda x: -x[1]):
			print(f"  {event}: {count}")
		return
	
	# Hot addresses
	if args.hot > 0:
		analyzer = LogAnalyzer(session)
		hot = analyzer.get_hot_addresses(args.hot)
		
		print(f"\nTop {args.hot} Accessed Addresses:")
		for addr, count in hot:
			print(f"  ${addr:04X}: {count} accesses")
		return
	
	# Search
	if args.search:
		results = session.search(args.search)
		print(f"\nFound {len(results)} matches for '{args.search}':")
		for entry in results[:50]:
			print(entry.to_string(args.format))
		return
	
	# Export
	if args.export:
		session.export_text(args.export, args.format)
		print(f"Exported: {args.export}")
		return
	
	# Default: show recent entries
	if session.entries:
		print(f"\nRecent entries:")
		for entry in session.entries[-20:]:
			print(entry.to_string(args.format))
	else:
		print("Debug Logger")
		print()
		print("Usage: python debug_logger.py [options]")
		print()
		print("Options:")
		print("  --new             Create new session")
		print("  --analyze         Analyze session")
		print("  --stats           Show statistics")
		print("  --hot N           Show N hot addresses")
		print("  --search QUERY    Search entries")
		print("  --export FILE     Export to text")


if __name__ == "__main__":
	main()
