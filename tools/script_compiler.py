#!/usr/bin/env python3
"""
Script Compiler - Compile text scripts to game-specific bytecode.

Supports:
- Custom scripting language for game text
- Compile to binary format
- Control codes and variables
- Multiple game format targets

Author: ROM Hacking Toolkit
"""

import argparse
import json
import os
import re
import struct
import sys
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Any, Callable, Dict, List, Optional, Tuple, Union


class TokenType(Enum):
	"""Token types for script parsing."""
	TEXT = "text"
	CONTROL = "control"
	VARIABLE = "variable"
	NEWLINE = "newline"
	END = "end"
	COMMENT = "comment"
	LABEL = "label"
	DIRECTIVE = "directive"


@dataclass
class Token:
	"""Script token."""
	type: TokenType
	value: Any
	line: int = 0
	column: int = 0


@dataclass
class ControlCode:
	"""Control code definition."""
	name: str
	byte_value: int
	args: List[str] = field(default_factory=list)
	description: str = ""


@dataclass
class ScriptConfig:
	"""Script compilation configuration."""
	name: str
	encoding: str = "utf-8"
	table_file: Optional[str] = None
	control_codes: Dict[str, ControlCode] = field(default_factory=dict)
	line_ending: bytes = b'\xFE'
	message_end: bytes = b'\xFF'
	max_line_length: int = 0
	pointer_size: int = 2
	base_address: int = 0


class TableEncoder:
	"""Encode text using a table file."""
	
	def __init__(self, table_path: str):
		"""Load table file."""
		self.char_to_byte: Dict[str, bytes] = {}
		self.byte_to_char: Dict[int, str] = {}
		
		with open(table_path, 'r', encoding='utf-8') as f:
			for line in f:
				line = line.rstrip('\n\r')
				if not line or line.startswith(';') or line.startswith('#'):
					continue
				
				if '=' in line:
					hex_part, char = line.split('=', 1)
					try:
						byte_val = int(hex_part, 16)
						self.char_to_byte[char] = bytes([byte_val])
						self.byte_to_char[byte_val] = char
					except ValueError:
						continue
	
	def encode(self, text: str) -> bytes:
		"""Encode text to bytes."""
		result = bytearray()
		i = 0
		
		while i < len(text):
			# Try to match longest sequence first
			matched = False
			for length in range(min(4, len(text) - i), 0, -1):
				seq = text[i:i+length]
				if seq in self.char_to_byte:
					result.extend(self.char_to_byte[seq])
					i += length
					matched = True
					break
			
			if not matched:
				# Default to ASCII or skip
				if text[i].isascii() and ord(text[i]) >= 32:
					result.append(ord(text[i]))
				i += 1
		
		return bytes(result)
	
	def decode(self, data: bytes) -> str:
		"""Decode bytes to text."""
		result = []
		for b in data:
			if b in self.byte_to_char:
				result.append(self.byte_to_char[b])
			elif 32 <= b < 127:
				result.append(chr(b))
			else:
				result.append(f'[${b:02X}]')
		return ''.join(result)


class ScriptLexer:
	"""Tokenize script files."""
	
	def __init__(self, config: ScriptConfig):
		"""Initialize lexer."""
		self.config = config
	
	def tokenize(self, source: str) -> List[Token]:
		"""Tokenize source code."""
		tokens = []
		lines = source.split('\n')
		
		for line_num, line in enumerate(lines, 1):
			# Skip empty lines and comments
			stripped = line.strip()
			if not stripped:
				tokens.append(Token(TokenType.NEWLINE, '\n', line_num, 0))
				continue
			
			if stripped.startswith('//') or stripped.startswith(';'):
				tokens.append(Token(TokenType.COMMENT, stripped, line_num, 0))
				continue
			
			# Parse labels
			if stripped.startswith('@'):
				tokens.append(Token(TokenType.LABEL, stripped[1:], line_num, 0))
				continue
			
			# Parse directives
			if stripped.startswith('#') or stripped.startswith('.'):
				tokens.append(Token(TokenType.DIRECTIVE, stripped, line_num, 0))
				continue
			
			# Parse line content
			self._tokenize_line(stripped, line_num, tokens)
		
		tokens.append(Token(TokenType.END, None, len(lines), 0))
		return tokens
	
	def _tokenize_line(self, line: str, line_num: int, tokens: List[Token]) -> None:
		"""Tokenize a single line."""
		i = 0
		text_buffer = []
		
		while i < len(line):
			# Control codes: [CODE] or [CODE:arg1,arg2]
			if line[i] == '[':
				# Flush text buffer
				if text_buffer:
					tokens.append(Token(TokenType.TEXT, ''.join(text_buffer), line_num, i))
					text_buffer = []
				
				# Find closing bracket
				end = line.find(']', i)
				if end == -1:
					end = len(line)
				
				control = line[i+1:end]
				tokens.append(Token(TokenType.CONTROL, control, line_num, i))
				i = end + 1
			
			# Variables: {VAR} or {VAR:format}
			elif line[i] == '{':
				if text_buffer:
					tokens.append(Token(TokenType.TEXT, ''.join(text_buffer), line_num, i))
					text_buffer = []
				
				end = line.find('}', i)
				if end == -1:
					end = len(line)
				
				variable = line[i+1:end]
				tokens.append(Token(TokenType.VARIABLE, variable, line_num, i))
				i = end + 1
			
			# Escape sequences
			elif line[i] == '\\' and i + 1 < len(line):
				next_char = line[i + 1]
				if next_char == 'n':
					tokens.append(Token(TokenType.CONTROL, 'NEWLINE', line_num, i))
				elif next_char == '[':
					text_buffer.append('[')
				elif next_char == '{':
					text_buffer.append('{')
				elif next_char == '\\':
					text_buffer.append('\\')
				else:
					text_buffer.append(line[i:i+2])
				i += 2
			
			else:
				text_buffer.append(line[i])
				i += 1
		
		# Flush remaining text
		if text_buffer:
			tokens.append(Token(TokenType.TEXT, ''.join(text_buffer), line_num, len(line)))


class ScriptCompiler:
	"""Compile script tokens to bytecode."""
	
	def __init__(self, config: ScriptConfig):
		"""Initialize compiler."""
		self.config = config
		self.encoder: Optional[TableEncoder] = None
		self.labels: Dict[str, int] = {}
		self.output: bytearray = bytearray()
		self.pointers: List[Tuple[int, str]] = []  # (offset, label)
		self.errors: List[str] = []
		self.warnings: List[str] = []
		
		if config.table_file and os.path.exists(config.table_file):
			self.encoder = TableEncoder(config.table_file)
	
	def compile(self, tokens: List[Token]) -> bytes:
		"""Compile tokens to bytecode."""
		self.output = bytearray()
		self.labels = {}
		self.pointers = []
		self.errors = []
		
		# First pass: collect labels
		self._collect_labels(tokens)
		
		# Second pass: generate code
		self._generate_code(tokens)
		
		# Third pass: resolve pointers
		self._resolve_pointers()
		
		return bytes(self.output)
	
	def _collect_labels(self, tokens: List[Token]) -> None:
		"""First pass: collect label positions."""
		position = 0
		
		for token in tokens:
			if token.type == TokenType.LABEL:
				self.labels[token.value] = position
			elif token.type == TokenType.TEXT:
				if self.encoder:
					position += len(self.encoder.encode(token.value))
				else:
					position += len(token.value.encode(self.config.encoding))
			elif token.type == TokenType.CONTROL:
				position += self._control_size(token.value)
	
	def _generate_code(self, tokens: List[Token]) -> None:
		"""Second pass: generate bytecode."""
		for token in tokens:
			if token.type == TokenType.TEXT:
				self._emit_text(token.value)
			elif token.type == TokenType.CONTROL:
				self._emit_control(token.value, token.line)
			elif token.type == TokenType.VARIABLE:
				self._emit_variable(token.value)
			elif token.type == TokenType.LABEL:
				# Labels don't emit code, just mark positions
				pass
			elif token.type == TokenType.DIRECTIVE:
				self._process_directive(token.value)
	
	def _resolve_pointers(self) -> None:
		"""Third pass: resolve label references."""
		for offset, label in self.pointers:
			if label in self.labels:
				address = self.labels[label] + self.config.base_address
				if self.config.pointer_size == 2:
					self.output[offset:offset+2] = struct.pack('<H', address)
				elif self.config.pointer_size == 3:
					self.output[offset:offset+3] = struct.pack('<I', address)[:3]
				elif self.config.pointer_size == 4:
					self.output[offset:offset+4] = struct.pack('<I', address)
			else:
				self.errors.append(f"Undefined label: {label}")
	
	def _emit_text(self, text: str) -> None:
		"""Emit text bytes."""
		if self.encoder:
			self.output.extend(self.encoder.encode(text))
		else:
			self.output.extend(text.encode(self.config.encoding))
	
	def _emit_control(self, control: str, line: int) -> None:
		"""Emit control code bytes."""
		# Parse control: NAME or NAME:arg1,arg2
		if ':' in control:
			name, args_str = control.split(':', 1)
			args = [a.strip() for a in args_str.split(',')]
		else:
			name = control
			args = []
		
		name = name.upper()
		
		# Built-in controls
		if name == 'NEWLINE' or name == 'NL':
			self.output.extend(self.config.line_ending)
		elif name == 'END' or name == 'MSGEND':
			self.output.extend(self.config.message_end)
		elif name == 'WAIT':
			# Generic wait control
			self.output.extend(b'\xFC')
		elif name == 'CLEAR' or name == 'CLS':
			self.output.extend(b'\xFD')
		elif name == 'PAUSE':
			frames = int(args[0]) if args else 30
			self.output.extend(b'\xFB')
			self.output.append(frames & 0xFF)
		elif name == 'COLOR':
			color = int(args[0]) if args else 0
			self.output.extend(b'\xFA')
			self.output.append(color & 0xFF)
		elif name == 'SPEED':
			speed = int(args[0]) if args else 1
			self.output.extend(b'\xF9')
			self.output.append(speed & 0xFF)
		elif name == 'GOTO':
			label = args[0] if args else ''
			self.output.extend(b'\xF8')
			self.pointers.append((len(self.output), label))
			self.output.extend(b'\x00\x00')  # Placeholder
		elif name == 'RAW' or name == 'BYTE':
			# Emit raw bytes: [RAW:$FA,$FB] or [BYTE:0x00]
			for arg in args:
				if arg.startswith('$'):
					self.output.append(int(arg[1:], 16))
				elif arg.startswith('0x'):
					self.output.append(int(arg, 16))
				else:
					self.output.append(int(arg))
		elif name in self.config.control_codes:
			# Custom control code
			cc = self.config.control_codes[name]
			self.output.append(cc.byte_value)
			
			# Emit arguments
			for i, arg_type in enumerate(cc.args):
				if i < len(args):
					value = int(args[i], 16) if args[i].startswith('$') else int(args[i])
					if arg_type == 'byte':
						self.output.append(value & 0xFF)
					elif arg_type == 'word':
						self.output.extend(struct.pack('<H', value))
				else:
					self.output.append(0)  # Default
		else:
			# Unknown control - try to emit as hex
			if name.startswith('$'):
				try:
					self.output.append(int(name[1:], 16))
				except ValueError:
					self.errors.append(f"Line {line}: Unknown control code: {name}")
			else:
				self.errors.append(f"Line {line}: Unknown control code: {name}")
	
	def _emit_variable(self, variable: str) -> None:
		"""Emit variable placeholder."""
		# Variables are typically replaced at runtime
		# Emit a placeholder control code
		name = variable.upper()
		
		if name == 'HERO' or name == 'PLAYER':
			self.output.extend(b'\xE0')
		elif name == 'ITEM':
			self.output.extend(b'\xE1')
		elif name == 'NUM' or name == 'NUMBER':
			self.output.extend(b'\xE2')
		elif name == 'GOLD' or name == 'MONEY':
			self.output.extend(b'\xE3')
		else:
			# Generic variable
			self.output.extend(b'\xE0')
	
	def _process_directive(self, directive: str) -> None:
		"""Process compiler directive."""
		parts = directive.split(None, 1)
		cmd = parts[0].lower()
		arg = parts[1] if len(parts) > 1 else ""
		
		if cmd in ['#base', '.base', '.org']:
			self.config.base_address = int(arg, 16) if arg.startswith('$') or arg.startswith('0x') else int(arg)
		elif cmd in ['#table', '.table']:
			if os.path.exists(arg):
				self.encoder = TableEncoder(arg)
		elif cmd in ['#include', '.include']:
			# Would load external file
			pass
	
	def _control_size(self, control: str) -> int:
		"""Estimate size of control code."""
		if ':' in control:
			name, args_str = control.split(':', 1)
			args = args_str.split(',')
		else:
			name = control
			args = []
		
		name = name.upper()
		
		# Built-in sizes
		sizes = {
			'NEWLINE': len(self.config.line_ending),
			'NL': len(self.config.line_ending),
			'END': len(self.config.message_end),
			'MSGEND': len(self.config.message_end),
			'WAIT': 1,
			'CLEAR': 1,
			'CLS': 1,
			'PAUSE': 2,
			'COLOR': 2,
			'SPEED': 2,
			'GOTO': 3,
		}
		
		if name in sizes:
			return sizes[name]
		elif name == 'RAW' or name == 'BYTE':
			return len(args)
		elif name in self.config.control_codes:
			return 1 + len(self.config.control_codes[name].args)
		elif name.startswith('$'):
			return 1
		return 1


class ScriptDecompiler:
	"""Decompile bytecode to script."""
	
	def __init__(self, config: ScriptConfig):
		"""Initialize decompiler."""
		self.config = config
		self.encoder: Optional[TableEncoder] = None
		
		if config.table_file and os.path.exists(config.table_file):
			self.encoder = TableEncoder(config.table_file)
	
	def decompile(self, data: bytes, start: int = 0, end: int = -1) -> str:
		"""Decompile bytecode to script."""
		if end < 0:
			end = len(data)
		
		lines = []
		current_line = []
		i = start
		
		# Create reverse lookup for control codes
		byte_to_control = {}
		for name, cc in self.config.control_codes.items():
			byte_to_control[cc.byte_value] = cc
		
		while i < end:
			b = data[i]
			
			# Check for line ending
			if data[i:i+len(self.config.line_ending)] == self.config.line_ending:
				current_line.append('[NL]')
				if current_line:
					lines.append(''.join(current_line))
					current_line = []
				i += len(self.config.line_ending)
				continue
			
			# Check for message end
			if data[i:i+len(self.config.message_end)] == self.config.message_end:
				current_line.append('[END]')
				if current_line:
					lines.append(''.join(current_line))
					current_line = []
				lines.append('')  # Blank line between messages
				i += len(self.config.message_end)
				continue
			
			# Check for known control codes
			if b in byte_to_control:
				cc = byte_to_control[b]
				if cc.args:
					args = []
					for j, arg_type in enumerate(cc.args):
						if arg_type == 'byte' and i + 1 + j < end:
							args.append(f'${data[i + 1 + j]:02X}')
						elif arg_type == 'word' and i + 1 + j * 2 + 1 < end:
							word = struct.unpack('<H', data[i + 1 + j * 2:i + 3 + j * 2])[0]
							args.append(f'${word:04X}')
					current_line.append(f'[{cc.name}:{",".join(args)}]')
					i += 1 + len(cc.args)
				else:
					current_line.append(f'[{cc.name}]')
					i += 1
				continue
			
			# Built-in control codes
			if b >= 0xF0:
				if b == 0xFC:
					current_line.append('[WAIT]')
				elif b == 0xFD:
					current_line.append('[CLEAR]')
				elif b == 0xFB and i + 1 < end:
					current_line.append(f'[PAUSE:{data[i+1]}]')
					i += 1
				elif b == 0xFA and i + 1 < end:
					current_line.append(f'[COLOR:{data[i+1]}]')
					i += 1
				elif b == 0xF9 and i + 1 < end:
					current_line.append(f'[SPEED:{data[i+1]}]')
					i += 1
				else:
					current_line.append(f'[${b:02X}]')
				i += 1
				continue
			
			# Variable placeholders
			if 0xE0 <= b < 0xF0:
				vars_map = {
					0xE0: 'HERO', 0xE1: 'ITEM',
					0xE2: 'NUM', 0xE3: 'GOLD'
				}
				var_name = vars_map.get(b, f'VAR{b - 0xE0}')
				current_line.append(f'{{{var_name}}}')
				i += 1
				continue
			
			# Regular text
			if self.encoder and b in self.encoder.byte_to_char:
				current_line.append(self.encoder.byte_to_char[b])
			elif 32 <= b < 127:
				current_line.append(chr(b))
			else:
				current_line.append(f'[${b:02X}]')
			i += 1
		
		if current_line:
			lines.append(''.join(current_line))
		
		return '\n'.join(lines)


def load_config(path: str) -> ScriptConfig:
	"""Load compiler configuration from JSON."""
	with open(path, 'r', encoding='utf-8') as f:
		data = json.load(f)
	
	config = ScriptConfig(name=data.get('name', 'default'))
	
	if 'encoding' in data:
		config.encoding = data['encoding']
	if 'table_file' in data:
		config.table_file = data['table_file']
	if 'line_ending' in data:
		config.line_ending = bytes.fromhex(data['line_ending'])
	if 'message_end' in data:
		config.message_end = bytes.fromhex(data['message_end'])
	if 'max_line_length' in data:
		config.max_line_length = data['max_line_length']
	if 'pointer_size' in data:
		config.pointer_size = data['pointer_size']
	if 'base_address' in data:
		config.base_address = data['base_address']
	
	# Load control codes
	for name, cc_data in data.get('control_codes', {}).items():
		config.control_codes[name.upper()] = ControlCode(
			name=name.upper(),
			byte_value=cc_data.get('byte', 0),
			args=cc_data.get('args', []),
			description=cc_data.get('description', '')
		)
	
	return config


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description="Compile text scripts to game bytecode",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Script Syntax:
  Text         - Plain text is encoded directly
  [CODE]       - Control code (e.g., [NL], [END], [WAIT])
  [CODE:args]  - Control with arguments (e.g., [PAUSE:30])
  {VAR}        - Variable placeholder (e.g., {HERO}, {ITEM})
  @label       - Label for jumps
  // comment   - Line comment
  #directive   - Compiler directive

Examples:
  %(prog)s compile script.txt -o output.bin
  %(prog)s compile script.txt -o output.bin --config dw4.json
  %(prog)s decompile input.bin -o script.txt --table dw4.tbl
		"""
	)
	
	subparsers = parser.add_subparsers(dest="command", help="Command to execute")
	
	# Compile command
	compile_parser = subparsers.add_parser("compile", help="Compile script to binary")
	compile_parser.add_argument("input", help="Input script file")
	compile_parser.add_argument("-o", "--output", required=True, help="Output binary file")
	compile_parser.add_argument("-c", "--config", help="Configuration JSON file")
	compile_parser.add_argument("-t", "--table", help="Table file for encoding")
	
	# Decompile command
	decompile_parser = subparsers.add_parser("decompile", help="Decompile binary to script")
	decompile_parser.add_argument("input", help="Input binary file")
	decompile_parser.add_argument("-o", "--output", required=True, help="Output script file")
	decompile_parser.add_argument("-c", "--config", help="Configuration JSON file")
	decompile_parser.add_argument("-t", "--table", help="Table file for decoding")
	decompile_parser.add_argument("-s", "--start", type=lambda x: int(x, 16), default=0)
	decompile_parser.add_argument("-e", "--end", type=lambda x: int(x, 16), default=-1)
	
	# Verify command
	verify_parser = subparsers.add_parser("verify", help="Verify script syntax")
	verify_parser.add_argument("input", help="Script file to verify")
	verify_parser.add_argument("-c", "--config", help="Configuration JSON file")
	
	args = parser.parse_args()
	
	if not args.command:
		parser.print_help()
		return 1
	
	try:
		# Load config
		if hasattr(args, 'config') and args.config:
			config = load_config(args.config)
		else:
			config = ScriptConfig(name="default")
		
		# Override table if specified
		if hasattr(args, 'table') and args.table:
			config.table_file = args.table
		
		if args.command == "compile":
			source = Path(args.input).read_text(encoding='utf-8')
			
			lexer = ScriptLexer(config)
			tokens = lexer.tokenize(source)
			
			compiler = ScriptCompiler(config)
			bytecode = compiler.compile(tokens)
			
			if compiler.errors:
				for error in compiler.errors:
					print(f"Error: {error}", file=sys.stderr)
				return 1
			
			Path(args.output).write_bytes(bytecode)
			print(f"Compiled: {args.output}")
			print(f"Output size: {len(bytecode)} bytes")
			
			if compiler.warnings:
				for warning in compiler.warnings:
					print(f"Warning: {warning}")
		
		elif args.command == "decompile":
			data = Path(args.input).read_bytes()
			
			decompiler = ScriptDecompiler(config)
			script = decompiler.decompile(data, args.start, args.end)
			
			Path(args.output).write_text(script, encoding='utf-8')
			print(f"Decompiled: {args.output}")
		
		elif args.command == "verify":
			source = Path(args.input).read_text(encoding='utf-8')
			
			lexer = ScriptLexer(config)
			tokens = lexer.tokenize(source)
			
			compiler = ScriptCompiler(config)
			compiler.compile(tokens)
			
			if compiler.errors:
				print("Errors found:")
				for error in compiler.errors:
					print(f"  {error}")
				return 1
			else:
				print("No errors found")
			
			if compiler.warnings:
				print("Warnings:")
				for warning in compiler.warnings:
					print(f"  {warning}")
	
	except FileNotFoundError as e:
		print(f"Error: File not found: {e.filename}")
		return 1
	except Exception as e:
		print(f"Error: {e}")
		return 1
	
	return 0


if __name__ == "__main__":
	sys.exit(main())
