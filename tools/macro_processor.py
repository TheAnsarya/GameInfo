#!/usr/bin/env python3
"""
Assembly Macro Processor - Process and expand assembly macros.

Provides macro processing for 6502/65816 assembly files including
macro definitions, expansions, conditional assembly, and include processing.

Usage:
	python macro_processor.py <input.asm> --output <output.asm>
	python macro_processor.py <input.asm> --define DEBUG=1

Features:
	- Define and expand macros
	- Nested macro support
	- Conditional assembly (.if, .ifdef, .ifndef, etc.)
	- Include file processing
	- Repeat blocks
	- Expression evaluation
	- Symbol table management
"""

import argparse
import json
import os
import re
import sys
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Callable, Dict, List, Optional, Set, Tuple, Union


class DirectiveType(Enum):
	"""Assembly directive types."""
	MACRO = auto()
	ENDMACRO = auto()
	IF = auto()
	IFDEF = auto()
	IFNDEF = auto()
	ELSE = auto()
	ELSEIF = auto()
	ENDIF = auto()
	INCLUDE = auto()
	INCBIN = auto()
	DEFINE = auto()
	UNDEF = auto()
	REPEAT = auto()
	ENDREP = auto()
	ERROR = auto()
	WARNING = auto()
	MESSAGE = auto()
	ASSERT = auto()
	SEGMENT = auto()
	BANK = auto()
	ORG = auto()
	ALIGN = auto()
	BYTE = auto()
	WORD = auto()
	LONG = auto()
	DB = auto()
	DW = auto()
	DL = auto()
	DS = auto()
	RES = auto()
	EQU = auto()
	ENUM = auto()
	ENDENUM = auto()


@dataclass
class Macro:
	"""Macro definition."""
	name: str
	params: List[str]
	body: List[str]
	file: str = ""
	line: int = 0
	local_count: int = 0

	def expand(self, args: List[str], local_prefix: str = "") -> List[str]:
		"""Expand macro with given arguments."""
		expanded = []

		# Create parameter mapping
		param_map = {}
		for i, param in enumerate(self.params):
			if i < len(args):
				param_map[param] = args[i]
			else:
				param_map[param] = ""

		# Also support \1, \2, etc. style parameters
		for i, arg in enumerate(args):
			param_map[f"\\{i+1}"] = arg

		# Number of arguments
		param_map["\\#"] = str(len(args))

		for line in self.body:
			expanded_line = line

			# Replace parameters
			for param, value in param_map.items():
				# Handle backslash-prefixed params
				if param.startswith("\\"):
					expanded_line = expanded_line.replace(param, value)
				else:
					# Replace param as whole word
					expanded_line = re.sub(
						rf'\b{re.escape(param)}\b',
						value,
						expanded_line
					)

			# Handle local labels (@ prefix)
			if local_prefix:
				expanded_line = re.sub(
					r'@(\w+)',
					f'_local_{local_prefix}_\\1',
					expanded_line
				)

			expanded.append(expanded_line)

		return expanded


@dataclass
class Symbol:
	"""Symbol definition."""
	name: str
	value: Union[int, str]
	type: str = "equ"  # equ, label, macro
	file: str = ""
	line: int = 0


@dataclass
class ProcessorState:
	"""Current processor state."""
	output: List[str] = field(default_factory=list)
	symbols: Dict[str, Symbol] = field(default_factory=dict)
	macros: Dict[str, Macro] = field(default_factory=dict)
	defines: Dict[str, str] = field(default_factory=dict)
	if_stack: List[bool] = field(default_factory=list)
	current_file: str = ""
	current_line: int = 0
	include_paths: List[str] = field(default_factory=list)
	included_files: Set[str] = field(default_factory=set)
	errors: List[str] = field(default_factory=list)
	warnings: List[str] = field(default_factory=list)
	macro_depth: int = 0
	max_macro_depth: int = 100
	local_counter: int = 0


class ExpressionEvaluator:
	"""Evaluate assembly expressions."""

	def __init__(self, symbols: Dict[str, Symbol], defines: Dict[str, str]):
		self.symbols = symbols
		self.defines = defines

	def evaluate(self, expr: str) -> Union[int, str, bool]:
		"""Evaluate an expression."""
		expr = expr.strip()

		# Handle defined() check
		defined_match = re.match(r'defined\s*\(\s*(\w+)\s*\)', expr, re.IGNORECASE)
		if defined_match:
			name = defined_match.group(1)
			return name in self.defines or name in self.symbols

		# Replace symbols and defines
		def replace_symbol(match):
			name = match.group(0)
			if name in self.defines:
				return str(self.defines[name])
			if name in self.symbols:
				sym = self.symbols[name]
				if isinstance(sym.value, int):
					return str(sym.value)
				return str(sym.value)
			return name

		# Replace symbols in expression
		expr = re.sub(r'\b[A-Za-z_][A-Za-z0-9_]*\b', replace_symbol, expr)

		# Handle string comparisons
		if '==' in expr or '!=' in expr:
			return self._eval_comparison(expr)

		# Try numeric evaluation
		try:
			# Handle different number formats
			expr = self._normalize_numbers(expr)

			# Safe evaluation
			result = self._safe_eval(expr)
			return result
		except Exception:
			return expr

	def _normalize_numbers(self, expr: str) -> str:
		"""Convert various number formats to Python format."""
		# $hex -> 0xhex
		expr = re.sub(r'\$([0-9A-Fa-f]+)', r'0x\1', expr)
		# %binary -> 0bbinary
		expr = re.sub(r'%([01]+)', r'0b\1', expr)
		# Handle character constants 'x'
		expr = re.sub(r"'(.)'", lambda m: str(ord(m.group(1))), expr)
		return expr

	def _safe_eval(self, expr: str) -> int:
		"""Safely evaluate numeric expression."""
		# Only allow safe operations
		allowed_chars = set("0123456789+-*/()&|^~<> xXabcdefABCDEF")
		if not all(c in allowed_chars for c in expr.replace("0b", "").replace("0x", "")):
			raise ValueError("Invalid expression")

		# Handle shift operators
		expr = expr.replace("<<", " << ").replace(">>", " >> ")

		# Evaluate
		return int(eval(expr, {"__builtins__": {}}, {}))

	def _eval_comparison(self, expr: str) -> bool:
		"""Evaluate comparison expression."""
		if "==" in expr:
			left, right = expr.split("==", 1)
			return left.strip() == right.strip()
		elif "!=" in expr:
			left, right = expr.split("!=", 1)
			return left.strip() != right.strip()
		return False


class MacroProcessor:
	"""Main macro processor class."""

	# Directive patterns
	DIRECTIVE_PATTERN = re.compile(r'^\s*\.(\w+)\s*(.*)?$', re.IGNORECASE)
	LABEL_PATTERN = re.compile(r'^(\w+):?\s*(.*)$')
	MACRO_CALL_PATTERN = re.compile(r'^\s*(\w+)\s+(.*)$')

	def __init__(self):
		self.state = ProcessorState()
		self.evaluator = ExpressionEvaluator(self.state.symbols, self.state.defines)

		# Directive handlers
		self.directive_handlers: Dict[str, Callable] = {
			"macro": self._handle_macro,
			"endmacro": self._handle_endmacro,
			"endm": self._handle_endmacro,
			"if": self._handle_if,
			"ifdef": self._handle_ifdef,
			"ifndef": self._handle_ifndef,
			"else": self._handle_else,
			"elseif": self._handle_elseif,
			"elif": self._handle_elseif,
			"endif": self._handle_endif,
			"include": self._handle_include,
			"incbin": self._handle_incbin,
			"define": self._handle_define,
			"undef": self._handle_undef,
			"repeat": self._handle_repeat,
			"rept": self._handle_repeat,
			"endrep": self._handle_endrep,
			"endr": self._handle_endrep,
			"error": self._handle_error,
			"warning": self._handle_warning,
			"message": self._handle_message,
			"equ": self._handle_equ,
			"=": self._handle_equ,
			"db": self._handle_data,
			"byte": self._handle_data,
			"dw": self._handle_data,
			"word": self._handle_data,
			"dl": self._handle_data,
			"long": self._handle_data,
			"ds": self._handle_reserve,
			"res": self._handle_reserve,
		}

		# State for macro collection
		self.collecting_macro = False
		self.current_macro_name = ""
		self.current_macro_params: List[str] = []
		self.current_macro_body: List[str] = []

		# State for repeat blocks
		self.collecting_repeat = False
		self.repeat_count = 0
		self.repeat_body: List[str] = []
		self.repeat_depth = 0

	def process_file(self, filepath: str) -> str:
		"""Process an assembly file."""
		self.state.current_file = filepath
		self.state.include_paths.append(os.path.dirname(os.path.abspath(filepath)))

		with open(filepath, "r", encoding="utf-8") as f:
			content = f.read()

		lines = content.split("\n")
		self._process_lines(lines, filepath)

		return "\n".join(self.state.output)

	def process_string(self, content: str) -> str:
		"""Process assembly content from string."""
		lines = content.split("\n")
		self._process_lines(lines, "<string>")
		return "\n".join(self.state.output)

	def _process_lines(self, lines: List[str], filename: str) -> None:
		"""Process list of lines."""
		for i, line in enumerate(lines):
			self.state.current_file = filename
			self.state.current_line = i + 1
			self._process_line(line)

	def _process_line(self, line: str) -> None:
		"""Process a single line."""
		# Handle macro collection
		if self.collecting_macro:
			self._collect_macro_line(line)
			return

		# Handle repeat collection
		if self.collecting_repeat:
			self._collect_repeat_line(line)
			return

		# Skip if in false conditional
		if self.state.if_stack and not self.state.if_stack[-1]:
			# Still need to track if/endif
			match = self.DIRECTIVE_PATTERN.match(line)
			if match:
				directive = match.group(1).lower()
				if directive in ("if", "ifdef", "ifndef"):
					self.state.if_stack.append(False)
				elif directive == "endif":
					self.state.if_stack.pop()
				elif directive in ("else", "elseif", "elif"):
					self._handle_conditional_directive(directive, match.group(2) or "")
			return

		# Check for directive
		match = self.DIRECTIVE_PATTERN.match(line)
		if match:
			directive = match.group(1).lower()
			args = match.group(2) or ""

			if directive in self.directive_handlers:
				self.directive_handlers[directive](args)
				return

		# Check for macro call
		if self._try_macro_expansion(line):
			return

		# Apply defines to line
		line = self._apply_defines(line)

		# Output line
		self.state.output.append(line)

	def _collect_macro_line(self, line: str) -> None:
		"""Collect line during macro definition."""
		match = self.DIRECTIVE_PATTERN.match(line)
		if match:
			directive = match.group(1).lower()
			if directive in ("endmacro", "endm"):
				# End macro definition
				macro = Macro(
					name=self.current_macro_name,
					params=self.current_macro_params,
					body=self.current_macro_body,
					file=self.state.current_file,
					line=self.state.current_line
				)
				self.state.macros[self.current_macro_name.lower()] = macro
				self.collecting_macro = False
				return

		self.current_macro_body.append(line)

	def _collect_repeat_line(self, line: str) -> None:
		"""Collect line during repeat block."""
		match = self.DIRECTIVE_PATTERN.match(line)
		if match:
			directive = match.group(1).lower()
			if directive in ("repeat", "rept"):
				self.repeat_depth += 1
			elif directive in ("endrep", "endr"):
				if self.repeat_depth > 0:
					self.repeat_depth -= 1
				else:
					# End repeat block
					self._expand_repeat()
					return

		self.repeat_body.append(line)

	def _expand_repeat(self) -> None:
		"""Expand collected repeat block."""
		for i in range(self.repeat_count):
			for line in self.repeat_body:
				# Replace counter variable
				expanded = line.replace("\\#", str(i))
				self._process_line(expanded)

		self.collecting_repeat = False
		self.repeat_body = []

	def _try_macro_expansion(self, line: str) -> bool:
		"""Try to expand a macro call."""
		# Check line for macro name
		stripped = line.strip()
		if not stripped or stripped.startswith(";") or stripped.startswith("//"):
			return False

		# Get first word
		parts = stripped.split(None, 1)
		if not parts:
			return False

		name = parts[0].lower()

		# Check if it's a macro
		if name not in self.state.macros:
			return False

		macro = self.state.macros[name]

		# Parse arguments
		args = []
		if len(parts) > 1:
			args = self._parse_macro_args(parts[1])

		# Check recursion depth
		if self.state.macro_depth >= self.state.max_macro_depth:
			self._error(f"Macro recursion depth exceeded")
			return True

		# Expand macro
		self.state.macro_depth += 1
		self.state.local_counter += 1
		local_prefix = f"{self.state.local_counter}"

		expanded_lines = macro.expand(args, local_prefix)

		for exp_line in expanded_lines:
			self._process_line(exp_line)

		self.state.macro_depth -= 1

		return True

	def _parse_macro_args(self, arg_string: str) -> List[str]:
		"""Parse macro arguments, handling quoted strings and nested parens."""
		args = []
		current = ""
		in_string = False
		string_char = None
		paren_depth = 0

		for char in arg_string:
			if in_string:
				current += char
				if char == string_char:
					in_string = False
			elif char in ('"', "'"):
				in_string = True
				string_char = char
				current += char
			elif char == '(':
				paren_depth += 1
				current += char
			elif char == ')':
				paren_depth -= 1
				current += char
			elif char == ',' and paren_depth == 0:
				args.append(current.strip())
				current = ""
			else:
				current += char

		if current.strip():
			args.append(current.strip())

		return args

	def _apply_defines(self, line: str) -> str:
		"""Apply defines to a line."""
		for name, value in self.state.defines.items():
			# Replace as whole word
			line = re.sub(rf'\b{re.escape(name)}\b', str(value), line)
		return line

	def _handle_conditional_directive(self, directive: str, args: str) -> None:
		"""Handle conditional directive in false block."""
		if directive == "else":
			# Toggle current condition
			if self.state.if_stack:
				self.state.if_stack[-1] = not self.state.if_stack[-1]
		elif directive in ("elseif", "elif"):
			# Check new condition
			if self.state.if_stack:
				result = self.evaluator.evaluate(args)
				self.state.if_stack[-1] = bool(result)

	# Directive handlers
	def _handle_macro(self, args: str) -> None:
		"""Handle .macro directive."""
		parts = args.split(None, 1)
		if not parts:
			self._error(".macro requires a name")
			return

		self.current_macro_name = parts[0]
		self.current_macro_params = []

		if len(parts) > 1:
			# Parse parameters
			param_str = parts[1]
			self.current_macro_params = [p.strip() for p in param_str.split(",")]

		self.current_macro_body = []
		self.collecting_macro = True

	def _handle_endmacro(self, args: str) -> None:
		"""Handle .endmacro directive."""
		if not self.collecting_macro:
			self._error(".endmacro without .macro")

	def _handle_if(self, args: str) -> None:
		"""Handle .if directive."""
		result = self.evaluator.evaluate(args)
		self.state.if_stack.append(bool(result))

	def _handle_ifdef(self, args: str) -> None:
		"""Handle .ifdef directive."""
		name = args.strip()
		defined = name in self.state.defines or name in self.state.symbols
		self.state.if_stack.append(defined)

	def _handle_ifndef(self, args: str) -> None:
		"""Handle .ifndef directive."""
		name = args.strip()
		defined = name in self.state.defines or name in self.state.symbols
		self.state.if_stack.append(not defined)

	def _handle_else(self, args: str) -> None:
		"""Handle .else directive."""
		if not self.state.if_stack:
			self._error(".else without .if")
			return
		self.state.if_stack[-1] = not self.state.if_stack[-1]

	def _handle_elseif(self, args: str) -> None:
		"""Handle .elseif directive."""
		if not self.state.if_stack:
			self._error(".elseif without .if")
			return

		# If previous condition was true, this should be false
		if self.state.if_stack[-1]:
			self.state.if_stack[-1] = False
		else:
			result = self.evaluator.evaluate(args)
			self.state.if_stack[-1] = bool(result)

	def _handle_endif(self, args: str) -> None:
		"""Handle .endif directive."""
		if not self.state.if_stack:
			self._error(".endif without .if")
			return
		self.state.if_stack.pop()

	def _handle_include(self, args: str) -> None:
		"""Handle .include directive."""
		# Extract filename
		filename = args.strip().strip('"').strip("'").strip("<").strip(">")

		# Find file
		filepath = self._find_include(filename)
		if not filepath:
			self._error(f"Include file not found: {filename}")
			return

		# Check for circular include
		abs_path = os.path.abspath(filepath)
		if abs_path in self.state.included_files:
			self._warning(f"Skipping already included file: {filename}")
			return

		self.state.included_files.add(abs_path)

		# Process included file
		try:
			with open(filepath, "r", encoding="utf-8") as f:
				content = f.read()

			lines = content.split("\n")
			old_file = self.state.current_file
			old_line = self.state.current_line

			self._process_lines(lines, filepath)

			self.state.current_file = old_file
			self.state.current_line = old_line

		except Exception as e:
			self._error(f"Error including file {filename}: {e}")

	def _handle_incbin(self, args: str) -> None:
		"""Handle .incbin directive."""
		# Extract filename and optional offset/length
		parts = [p.strip() for p in args.split(",")]
		filename = parts[0].strip('"').strip("'")

		filepath = self._find_include(filename)
		if not filepath:
			self._error(f"Binary file not found: {filename}")
			return

		offset = 0
		length = None

		if len(parts) > 1:
			offset = int(self.evaluator.evaluate(parts[1]))
		if len(parts) > 2:
			length = int(self.evaluator.evaluate(parts[2]))

		# Read and include as bytes
		try:
			with open(filepath, "rb") as f:
				f.seek(offset)
				if length:
					data = f.read(length)
				else:
					data = f.read()

			# Output as .byte directives
			for i in range(0, len(data), 16):
				chunk = data[i:i+16]
				byte_str = ", ".join(f"${b:02X}" for b in chunk)
				self.state.output.append(f"\t.byte {byte_str}")

		except Exception as e:
			self._error(f"Error reading binary file {filename}: {e}")

	def _handle_define(self, args: str) -> None:
		"""Handle .define directive."""
		parts = args.split(None, 1)
		if not parts:
			self._error(".define requires a name")
			return

		name = parts[0]
		value = parts[1] if len(parts) > 1 else "1"

		self.state.defines[name] = value

	def _handle_undef(self, args: str) -> None:
		"""Handle .undef directive."""
		name = args.strip()
		if name in self.state.defines:
			del self.state.defines[name]

	def _handle_repeat(self, args: str) -> None:
		"""Handle .repeat directive."""
		count = int(self.evaluator.evaluate(args))
		self.repeat_count = count
		self.repeat_body = []
		self.repeat_depth = 0
		self.collecting_repeat = True

	def _handle_endrep(self, args: str) -> None:
		"""Handle .endrep directive."""
		if not self.collecting_repeat:
			self._error(".endrep without .repeat")

	def _handle_error(self, args: str) -> None:
		"""Handle .error directive."""
		self._error(args.strip('"').strip("'"))

	def _handle_warning(self, args: str) -> None:
		"""Handle .warning directive."""
		self._warning(args.strip('"').strip("'"))

	def _handle_message(self, args: str) -> None:
		"""Handle .message directive."""
		print(f"Message: {args.strip('"').strip("'")}")

	def _handle_equ(self, args: str) -> None:
		"""Handle .equ directive (in label context)."""
		# Handled via label pattern
		pass

	def _handle_data(self, args: str) -> None:
		"""Handle .db/.dw/.dl directives."""
		# Apply defines and pass through
		line = f"\t.byte {self._apply_defines(args)}"
		self.state.output.append(line)

	def _handle_reserve(self, args: str) -> None:
		"""Handle .ds/.res directives."""
		line = f"\t.ds {self._apply_defines(args)}"
		self.state.output.append(line)

	def _find_include(self, filename: str) -> Optional[str]:
		"""Find an include file."""
		# Try current directory first
		if os.path.exists(filename):
			return filename

		# Try include paths
		for path in self.state.include_paths:
			filepath = os.path.join(path, filename)
			if os.path.exists(filepath):
				return filepath

		return None

	def _error(self, message: str) -> None:
		"""Record an error."""
		error = f"{self.state.current_file}:{self.state.current_line}: Error: {message}"
		self.state.errors.append(error)
		print(error, file=sys.stderr)

	def _warning(self, message: str) -> None:
		"""Record a warning."""
		warning = f"{self.state.current_file}:{self.state.current_line}: Warning: {message}"
		self.state.warnings.append(warning)
		print(warning, file=sys.stderr)

	def add_define(self, name: str, value: str) -> None:
		"""Add a define from command line."""
		self.state.defines[name] = value

	def add_include_path(self, path: str) -> None:
		"""Add an include path."""
		self.state.include_paths.append(path)

	def get_errors(self) -> List[str]:
		"""Get list of errors."""
		return self.state.errors

	def get_warnings(self) -> List[str]:
		"""Get list of warnings."""
		return self.state.warnings


class MacroLibrary:
	"""Library of common assembly macros."""

	@staticmethod
	def get_common_macros() -> str:
		"""Return common macro definitions."""
		return '''
; Common NES/SNES macros

.macro push_all
	pha
	phx
	phy
.endmacro

.macro pop_all
	ply
	plx
	pla
.endmacro

.macro set_a8
	sep #$20
.endmacro

.macro set_a16
	rep #$20
.endmacro

.macro set_xy8
	sep #$10
.endmacro

.macro set_xy16
	rep #$10
.endmacro

.macro set_ax8
	sep #$30
.endmacro

.macro set_ax16
	rep #$30
.endmacro

.macro mov dest, src
	lda src
	sta dest
.endmacro

.macro mov16 dest, src
	lda src
	sta dest
	lda src+1
	sta dest+1
.endmacro

.macro add16 dest, val
	clc
	lda dest
	adc #<val
	sta dest
	lda dest+1
	adc #>val
	sta dest+1
.endmacro

.macro sub16 dest, val
	sec
	lda dest
	sbc #<val
	sta dest
	lda dest+1
	sbc #>val
	sta dest+1
.endmacro

.macro fill_bytes addr, count, value
	ldx #count-1
@loop:
	lda #value
	sta addr,x
	dex
	bpl @loop
.endmacro

.macro copy_bytes src, dest, count
	ldx #count-1
@loop:
	lda src,x
	sta dest,x
	dex
	bpl @loop
.endmacro
'''


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Assembly Macro Processor")
	parser.add_argument("input", help="Input assembly file")
	parser.add_argument("--output", "-o", help="Output file")
	parser.add_argument("--define", "-D", action="append", default=[],
						help="Define symbol (NAME or NAME=VALUE)")
	parser.add_argument("--include", "-I", action="append", default=[],
						help="Add include path")
	parser.add_argument("--stdlib", action="store_true",
						help="Include standard macro library")
	parser.add_argument("--verbose", "-v", action="store_true",
						help="Verbose output")

	args = parser.parse_args()

	if not os.path.exists(args.input):
		print(f"Error: Input file not found: {args.input}")
		sys.exit(1)

	processor = MacroProcessor()

	# Add command-line defines
	for define in args.define:
		if "=" in define:
			name, value = define.split("=", 1)
		else:
			name = define
			value = "1"
		processor.add_define(name, value)

	# Add include paths
	for path in args.include:
		processor.add_include_path(path)

	# Process stdlib if requested
	if args.stdlib:
		stdlib = MacroLibrary.get_common_macros()
		processor.process_string(stdlib)
		# Clear output (stdlib was just for macro definitions)
		processor.state.output.clear()

	# Process input file
	try:
		output = processor.process_file(args.input)
	except Exception as e:
		print(f"Error: {e}")
		sys.exit(1)

	# Check for errors
	errors = processor.get_errors()
	if errors:
		print(f"\n{len(errors)} error(s) occurred")
		sys.exit(1)

	# Write output
	if args.output:
		with open(args.output, "w", encoding="utf-8") as f:
			f.write(output)
		print(f"Output written to: {args.output}")
	else:
		print(output)

	# Print warnings summary
	warnings = processor.get_warnings()
	if warnings and args.verbose:
		print(f"\n{len(warnings)} warning(s)")


if __name__ == "__main__":
	main()
