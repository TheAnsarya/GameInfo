#!/usr/bin/env python3
"""
Cross-Reference Database Tool
Build and query a cross-reference database for ROM analysis.

Usage:
	python xref_database.py build rom.nes --output xref.db
	python xref_database.py query xref.db --address 0x8000
	python xref_database.py callers xref.db --function 0x8a3f
"""

import argparse
import json
import os
import sqlite3
import sys
from collections import defaultdict
from pathlib import Path
from typing import Optional

# 6502 branch/jump opcodes
BRANCH_OPCODES = {
	0x10: 'BPL', 0x30: 'BMI', 0x50: 'BVC', 0x70: 'BVS',
	0x90: 'BCC', 0xb0: 'BCS', 0xd0: 'BNE', 0xf0: 'BEQ'
}
JUMP_OPCODES = {
	0x20: ('JSR', 3), 0x4c: ('JMP', 3), 0x6c: ('JMP_IND', 3)
}
RETURN_OPCODES = {0x40: 'RTI', 0x60: 'RTS'}


class XRefDatabase:
	"""Cross-reference database for ROM analysis."""
	
	def __init__(self, db_path: str):
		"""Initialize database."""
		self.db_path = db_path
		self.conn = None
		
	def connect(self):
		"""Connect to database."""
		self.conn = sqlite3.connect(self.db_path)
		self.conn.row_factory = sqlite3.Row
		
	def close(self):
		"""Close database connection."""
		if self.conn:
			self.conn.close()
			
	def create_schema(self):
		"""Create database schema."""
		cursor = self.conn.cursor()
		
		# Addresses table
		cursor.execute('''
			CREATE TABLE IF NOT EXISTS addresses (
				id INTEGER PRIMARY KEY,
				address INTEGER UNIQUE,
				bank INTEGER,
				type TEXT,
				label TEXT,
				comment TEXT
			)
		''')
		
		# Cross-references table
		cursor.execute('''
			CREATE TABLE IF NOT EXISTS xrefs (
				id INTEGER PRIMARY KEY,
				from_addr INTEGER,
				to_addr INTEGER,
				type TEXT,
				opcode INTEGER,
				FOREIGN KEY (from_addr) REFERENCES addresses(address),
				FOREIGN KEY (to_addr) REFERENCES addresses(address)
			)
		''')
		
		# Data references table
		cursor.execute('''
			CREATE TABLE IF NOT EXISTS data_refs (
				id INTEGER PRIMARY KEY,
				from_addr INTEGER,
				to_addr INTEGER,
				access_type TEXT,
				size INTEGER
			)
		''')
		
		# Labels table
		cursor.execute('''
			CREATE TABLE IF NOT EXISTS labels (
				address INTEGER PRIMARY KEY,
				name TEXT UNIQUE,
				type TEXT,
				source TEXT
			)
		''')
		
		# Comments table
		cursor.execute('''
			CREATE TABLE IF NOT EXISTS comments (
				address INTEGER PRIMARY KEY,
				comment TEXT,
				author TEXT,
				timestamp TEXT
			)
		''')
		
		# Create indexes
		cursor.execute('CREATE INDEX IF NOT EXISTS idx_xref_from ON xrefs(from_addr)')
		cursor.execute('CREATE INDEX IF NOT EXISTS idx_xref_to ON xrefs(to_addr)')
		cursor.execute('CREATE INDEX IF NOT EXISTS idx_data_to ON data_refs(to_addr)')
		
		self.conn.commit()
		
	def add_address(self, address: int, bank: int = 0, 
					addr_type: str = 'unknown', label: str = None):
		"""Add an address entry."""
		cursor = self.conn.cursor()
		cursor.execute('''
			INSERT OR REPLACE INTO addresses (address, bank, type, label)
			VALUES (?, ?, ?, ?)
		''', (address, bank, addr_type, label))
		
	def add_xref(self, from_addr: int, to_addr: int, 
				 xref_type: str, opcode: int = None):
		"""Add a cross-reference."""
		cursor = self.conn.cursor()
		cursor.execute('''
			INSERT INTO xrefs (from_addr, to_addr, type, opcode)
			VALUES (?, ?, ?, ?)
		''', (from_addr, to_addr, xref_type, opcode))
		
	def add_data_ref(self, from_addr: int, to_addr: int,
					 access_type: str = 'read', size: int = 1):
		"""Add a data reference."""
		cursor = self.conn.cursor()
		cursor.execute('''
			INSERT INTO data_refs (from_addr, to_addr, access_type, size)
			VALUES (?, ?, ?, ?)
		''', (from_addr, to_addr, access_type, size))
		
	def set_label(self, address: int, name: str, 
				  label_type: str = 'code', source: str = 'auto'):
		"""Set a label for an address."""
		cursor = self.conn.cursor()
		cursor.execute('''
			INSERT OR REPLACE INTO labels (address, name, type, source)
			VALUES (?, ?, ?, ?)
		''', (address, name, label_type, source))
		
	def set_comment(self, address: int, comment: str,
					author: str = 'user'):
		"""Set a comment for an address."""
		cursor = self.conn.cursor()
		cursor.execute('''
			INSERT OR REPLACE INTO comments (address, comment, author, timestamp)
			VALUES (?, ?, ?, datetime('now'))
		''', (address, comment, author))
		
	def get_callers(self, address: int) -> list:
		"""Get all addresses that call/jump to this address."""
		cursor = self.conn.cursor()
		cursor.execute('''
			SELECT from_addr, type, opcode FROM xrefs
			WHERE to_addr = ?
			ORDER BY from_addr
		''', (address,))
		return [dict(row) for row in cursor.fetchall()]
		
	def get_callees(self, address: int) -> list:
		"""Get all addresses called/jumped to from this address."""
		cursor = self.conn.cursor()
		cursor.execute('''
			SELECT to_addr, type, opcode FROM xrefs
			WHERE from_addr = ?
			ORDER BY to_addr
		''', (address,))
		return [dict(row) for row in cursor.fetchall()]
		
	def get_data_references(self, address: int) -> list:
		"""Get all code that references this data address."""
		cursor = self.conn.cursor()
		cursor.execute('''
			SELECT from_addr, access_type, size FROM data_refs
			WHERE to_addr = ?
			ORDER BY from_addr
		''', (address,))
		return [dict(row) for row in cursor.fetchall()]
		
	def get_label(self, address: int) -> Optional[str]:
		"""Get label for an address."""
		cursor = self.conn.cursor()
		cursor.execute('SELECT name FROM labels WHERE address = ?', (address,))
		row = cursor.fetchone()
		return row['name'] if row else None
		
	def find_functions(self) -> list:
		"""Find all function entry points (JSR targets)."""
		cursor = self.conn.cursor()
		cursor.execute('''
			SELECT DISTINCT to_addr as address, COUNT(*) as call_count
			FROM xrefs
			WHERE type = 'call'
			GROUP BY to_addr
			ORDER BY call_count DESC
		''')
		return [dict(row) for row in cursor.fetchall()]
		
	def get_stats(self) -> dict:
		"""Get database statistics."""
		cursor = self.conn.cursor()
		
		cursor.execute('SELECT COUNT(*) FROM addresses')
		addr_count = cursor.fetchone()[0]
		
		cursor.execute('SELECT COUNT(*) FROM xrefs')
		xref_count = cursor.fetchone()[0]
		
		cursor.execute('SELECT COUNT(*) FROM data_refs')
		dref_count = cursor.fetchone()[0]
		
		cursor.execute('SELECT COUNT(*) FROM labels')
		label_count = cursor.fetchone()[0]
		
		cursor.execute('SELECT type, COUNT(*) FROM xrefs GROUP BY type')
		xref_types = dict(cursor.fetchall())
		
		return {
			'addresses': addr_count,
			'xrefs': xref_count,
			'data_refs': dref_count,
			'labels': label_count,
			'xref_types': xref_types
		}
		
	def commit(self):
		"""Commit changes."""
		self.conn.commit()


class ROMAnalyzer:
	"""Analyze ROM and build cross-reference database."""
	
	def __init__(self, rom_path: str):
		"""Initialize with ROM path."""
		self.rom_path = Path(rom_path)
		self.rom_data = None
		self.header_size = 0
		
	def load_rom(self) -> bool:
		"""Load ROM file."""
		try:
			with open(self.rom_path, 'rb') as f:
				self.rom_data = f.read()
				
			# Detect header
			if self.rom_data[:4] == b'NES\x1a':
				self.header_size = 16
				
			return True
		except Exception as e:
			print(f"Error loading ROM: {e}")
			return False
			
	def build_xref_database(self, db: XRefDatabase, 
							bank_size: int = 0x4000):
		"""Build cross-reference database from ROM."""
		db.create_schema()
		
		data = self.rom_data[self.header_size:]
		num_banks = len(data) // bank_size
		
		for bank in range(num_banks):
			bank_offset = bank * bank_size
			bank_data = data[bank_offset:bank_offset + bank_size]
			
			self._analyze_bank(db, bank_data, bank, bank_offset)
			
		db.commit()
		
	def _analyze_bank(self, db: XRefDatabase, bank_data: bytes,
					  bank: int, file_offset: int):
		"""Analyze a single bank for cross-references."""
		i = 0
		base_addr = 0x8000  # NES PRG bank base
		
		while i < len(bank_data):
			opcode = bank_data[i]
			file_addr = file_offset + i + self.header_size
			cpu_addr = base_addr + i
			
			# Check for branch instructions
			if opcode in BRANCH_OPCODES and i + 1 < len(bank_data):
				offset = bank_data[i + 1]
				if offset >= 0x80:
					offset -= 0x100  # Sign extend
				target = cpu_addr + 2 + offset
				
				db.add_xref(cpu_addr, target, 'branch', opcode)
				i += 2
				
			# Check for JSR/JMP
			elif opcode in JUMP_OPCODES and i + 2 < len(bank_data):
				mnem, length = JUMP_OPCODES[opcode]
				target = bank_data[i + 1] | (bank_data[i + 2] << 8)
				
				xref_type = 'call' if opcode == 0x20 else 'jump'
				if opcode == 0x6c:
					xref_type = 'jump_indirect'
					
				db.add_xref(cpu_addr, target, xref_type, opcode)
				i += length
				
			# Check for absolute addressing (LDA, STA, etc)
			elif opcode in [0x0d, 0x0e, 0x2c, 0x2d, 0x2e, 0x4d, 0x4e,
						   0x6d, 0x6e, 0x8c, 0x8d, 0x8e, 0xac, 0xad,
						   0xae, 0xcc, 0xcd, 0xce, 0xec, 0xed, 0xee]:
				if i + 2 < len(bank_data):
					target = bank_data[i + 1] | (bank_data[i + 2] << 8)
					
					# Determine if read or write
					access = 'write' if opcode in [0x8c, 0x8d, 0x8e] else 'read'
					if opcode in [0x0e, 0x2e, 0x4e, 0x6e, 0xce, 0xee]:
						access = 'read_write'
						
					db.add_data_ref(cpu_addr, target, access, 1)
					
				i += 3
				
			else:
				# Unknown or other instruction
				i += 1
				

def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description='Cross-reference database tool'
	)
	subparsers = parser.add_subparsers(dest='command', help='Commands')
	
	# Build command
	build_parser = subparsers.add_parser('build', help='Build xref database')
	build_parser.add_argument('rom', help='ROM file to analyze')
	build_parser.add_argument('--output', '-o', default='xref.db',
							  help='Output database file')
	build_parser.add_argument('--bank-size', type=lambda x: int(x, 0),
							  default=0x4000, help='Bank size')
							  
	# Query command
	query_parser = subparsers.add_parser('query', help='Query database')
	query_parser.add_argument('database', help='Database file')
	query_parser.add_argument('--address', '-a', type=lambda x: int(x, 0),
							  help='Address to query')
	query_parser.add_argument('--label', '-l', help='Label to query')
	
	# Callers command
	callers_parser = subparsers.add_parser('callers', help='Find callers')
	callers_parser.add_argument('database', help='Database file')
	callers_parser.add_argument('--function', '-f', type=lambda x: int(x, 0),
							   required=True, help='Function address')
							   
	# Functions command
	funcs_parser = subparsers.add_parser('functions', help='List functions')
	funcs_parser.add_argument('database', help='Database file')
	funcs_parser.add_argument('--min-calls', type=int, default=1,
							  help='Minimum call count')
							  
	# Stats command
	stats_parser = subparsers.add_parser('stats', help='Database statistics')
	stats_parser.add_argument('database', help='Database file')
	
	# Label command
	label_parser = subparsers.add_parser('label', help='Set label')
	label_parser.add_argument('database', help='Database file')
	label_parser.add_argument('--address', '-a', type=lambda x: int(x, 0),
							  required=True, help='Address')
	label_parser.add_argument('--name', '-n', required=True, help='Label name')
	
	# Export command
	export_parser = subparsers.add_parser('export', help='Export data')
	export_parser.add_argument('database', help='Database file')
	export_parser.add_argument('--output', '-o', help='Output file')
	export_parser.add_argument('--format', choices=['json', 'csv', 'mlb'],
							   default='json', help='Export format')
	
	args = parser.parse_args()
	
	if args.command == 'build':
		analyzer = ROMAnalyzer(args.rom)
		if not analyzer.load_rom():
			sys.exit(1)
			
		db = XRefDatabase(args.output)
		db.connect()
		analyzer.build_xref_database(db, args.bank_size)
		
		stats = db.get_stats()
		print(f"Database built: {args.output}")
		print(f"  Cross-references: {stats['xrefs']}")
		print(f"  Data references: {stats['data_refs']}")
		db.close()
		
	elif args.command == 'query':
		db = XRefDatabase(args.database)
		db.connect()
		
		if args.address:
			callers = db.get_callers(args.address)
			callees = db.get_callees(args.address)
			data_refs = db.get_data_references(args.address)
			label = db.get_label(args.address)
			
			print(f"Address: ${args.address:04x}")
			if label:
				print(f"Label: {label}")
			print(f"\nCallers ({len(callers)}):")
			for c in callers[:20]:
				print(f"  ${c['from_addr']:04x} [{c['type']}]")
			print(f"\nCallees ({len(callees)}):")
			for c in callees[:20]:
				print(f"  ${c['to_addr']:04x} [{c['type']}]")
			print(f"\nData references ({len(data_refs)}):")
			for r in data_refs[:20]:
				print(f"  ${r['from_addr']:04x} [{r['access_type']}]")
				
		db.close()
		
	elif args.command == 'callers':
		db = XRefDatabase(args.database)
		db.connect()
		
		callers = db.get_callers(args.function)
		label = db.get_label(args.function)
		
		print(f"Callers of ${args.function:04x}" + 
			  (f" ({label})" if label else ""))
		for c in callers:
			caller_label = db.get_label(c['from_addr'])
			print(f"  ${c['from_addr']:04x} [{c['type']}]" +
				  (f" ({caller_label})" if caller_label else ""))
				  
		db.close()
		
	elif args.command == 'functions':
		db = XRefDatabase(args.database)
		db.connect()
		
		functions = db.find_functions()
		print(f"Functions (called >= {args.min_calls} times):")
		for f in functions:
			if f['call_count'] >= args.min_calls:
				label = db.get_label(f['address'])
				print(f"  ${f['address']:04x}: {f['call_count']} calls" +
					  (f" ({label})" if label else ""))
					  
		db.close()
		
	elif args.command == 'stats':
		db = XRefDatabase(args.database)
		db.connect()
		
		stats = db.get_stats()
		print("Database Statistics:")
		print(f"  Addresses: {stats['addresses']}")
		print(f"  Cross-references: {stats['xrefs']}")
		print(f"  Data references: {stats['data_refs']}")
		print(f"  Labels: {stats['labels']}")
		print("\nCross-reference types:")
		for xtype, count in stats['xref_types'].items():
			print(f"  {xtype}: {count}")
			
		db.close()
		
	elif args.command == 'label':
		db = XRefDatabase(args.database)
		db.connect()
		db.set_label(args.address, args.name)
		db.commit()
		print(f"Label set: ${args.address:04x} = {args.name}")
		db.close()
		
	elif args.command == 'export':
		db = XRefDatabase(args.database)
		db.connect()
		
		if args.format == 'json':
			functions = db.find_functions()
			stats = db.get_stats()
			
			data = {
				'stats': stats,
				'functions': functions
			}
			
			output = json.dumps(data, indent='\t')
			
		elif args.format == 'mlb':
			# Export as Mesen label file
			cursor = db.conn.cursor()
			cursor.execute('SELECT address, name, type FROM labels')
			
			lines = []
			for row in cursor.fetchall():
				mlb_type = 'P' if row['type'] == 'code' else 'G'
				lines.append(f"{mlb_type}:{row['address']:x}:{row['name']}")
				
			output = '\n'.join(lines)
			
		else:
			output = "Format not implemented"
			
		if args.output:
			with open(args.output, 'w') as f:
				f.write(output)
			print(f"Exported to {args.output}")
		else:
			print(output)
			
		db.close()
		
	else:
		parser.print_help()


if __name__ == '__main__':
	main()
