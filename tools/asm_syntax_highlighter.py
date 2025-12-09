#!/usr/bin/env python3
"""
Assembly Syntax Highlighter and Parser
Parses and highlights 6502/65816 assembly code for documentation.
"""

import re
import json
import argparse
from pathlib import Path
from dataclasses import dataclass, field
from typing import Optional
from enum import Enum


class TokenType(Enum):
	"""Token types for assembly parsing."""
	LABEL = "label"
	INSTRUCTION = "instruction"
	DIRECTIVE = "directive"
	REGISTER = "register"
	NUMBER_HEX = "number_hex"
	NUMBER_DEC = "number_dec"
	NUMBER_BIN = "number_bin"
	STRING = "string"
	COMMENT = "comment"
	OPERATOR = "operator"
	SYMBOL = "symbol"
	WHITESPACE = "whitespace"
	NEWLINE = "newline"
	UNKNOWN = "unknown"


@dataclass
class Token:
	"""Represents a token in assembly code."""
	type: TokenType
	value: str
	line: int
	column: int
	length: int


@dataclass
class Instruction:
	"""Represents a parsed instruction."""
	mnemonic: str
	operand: Optional[str] = None
	addressing_mode: str = "implied"
	bytes_size: int = 1
	cycles: int = 2
	label: Optional[str] = None
	comment: Optional[str] = None
	line_number: int = 0


# 6502/65816 instruction set
INSTRUCTIONS_6502 = {
	# Load/Store
	"lda", "ldx", "ldy", "sta", "stx", "sty", "stz",
	# Transfer
	"tax", "tay", "txa", "tya", "tsx", "txs",
	# Stack
	"pha", "php", "pla", "plp", "phx", "phy", "plx", "ply",
	# Arithmetic
	"adc", "sbc", "inc", "inx", "iny", "dec", "dex", "dey",
	# Logic
	"and", "ora", "eor", "bit",
	# Shift/Rotate
	"asl", "lsr", "rol", "ror",
	# Compare
	"cmp", "cpx", "cpy",
	# Branch
	"bcc", "bcs", "beq", "bne", "bmi", "bpl", "bvc", "bvs", "bra",
	# Jump
	"jmp", "jsr", "rts", "rti",
	# Flags
	"clc", "sec", "cli", "sei", "cld", "sed", "clv",
	# NOP
	"nop",
	# Break
	"brk",
}

# 65816 additional instructions
INSTRUCTIONS_65816 = INSTRUCTIONS_6502 | {
	# 16-bit transfers
	"tcd", "tcs", "tdc", "tsc", "txy", "tyx",
	# Long addressing
	"jml", "jsl", "rtl",
	# Block moves
	"mvn", "mvp",
	# 16-bit stack
	"pea", "pei", "per", "phb", "phd", "phk", "plb", "pld",
	# Mode switches
	"rep", "sep", "xba", "xce",
	# Wait/Stop
	"wai", "stp", "wdm",
	# Long branches
	"brl",
	# 16-bit inc/dec
	"ina", "dea",
	# Test/Reset bits
	"trb", "tsb",
	# Cop
	"cop",
}

# Common assembler directives
DIRECTIVES = {
	".org", ".byte", ".word", ".dword", ".db", ".dw", ".dd",
	".text", ".ascii", ".asciiz", ".string",
	".include", ".incbin", ".binary",
	".define", ".equ", ".set", ".const",
	".macro", ".endm", ".endmacro",
	".if", ".ifdef", ".ifndef", ".else", ".endif", ".elseif",
	".repeat", ".endr", ".rept",
	".segment", ".bank", ".section",
	".proc", ".endproc", ".scope", ".endscope",
	".export", ".import", ".global",
	".res", ".ds", ".fill", ".align",
	".hibyte", ".lobyte", ".bankbyte",
	".assert", ".warning", ".error",
	# ca65 specific
	".a8", ".a16", ".i8", ".i16", ".smart",
	".p02", ".p816", ".pc02",
	# xkas specific
	"arch", "base", "incsrc", "incbin", "org",
}

# Registers
REGISTERS_6502 = {"a", "x", "y", "s", "p"}
REGISTERS_65816 = REGISTERS_6502 | {"b", "d", "k", "dbr", "pbr"}


class AssemblyLexer:
	"""Lexer for assembly code."""

	def __init__(self, is_65816: bool = False):
		self.is_65816 = is_65816
		self.instructions = INSTRUCTIONS_65816 if is_65816 else INSTRUCTIONS_6502
		self.registers = REGISTERS_65816 if is_65816 else REGISTERS_6502

	def tokenize(self, source: str) -> list[Token]:
		"""Tokenize assembly source code."""
		tokens = []
		lines = source.split('\n')

		for line_num, line in enumerate(lines, 1):
			tokens.extend(self._tokenize_line(line, line_num))
			tokens.append(Token(TokenType.NEWLINE, '\n', line_num, len(line), 1))

		return tokens

	def _tokenize_line(self, line: str, line_num: int) -> list[Token]:
		"""Tokenize a single line."""
		tokens = []
		col = 0

		while col < len(line):
			char = line[col]

			# Whitespace
			if char in ' \t':
				start = col
				while col < len(line) and line[col] in ' \t':
					col += 1
				tokens.append(Token(TokenType.WHITESPACE, line[start:col], line_num, start, col - start))
				continue

			# Comment
			if char == ';':
				tokens.append(Token(TokenType.COMMENT, line[col:], line_num, col, len(line) - col))
				break

			# String
			if char in '"\'':
				start = col
				quote = char
				col += 1
				while col < len(line) and line[col] != quote:
					if line[col] == '\\':
						col += 1
					col += 1
				if col < len(line):
					col += 1
				tokens.append(Token(TokenType.STRING, line[start:col], line_num, start, col - start))
				continue

			# Hex number
			if char == '$' or (char == '0' and col + 1 < len(line) and line[col + 1].lower() == 'x'):
				start = col
				if char == '$':
					col += 1
				else:
					col += 2
				while col < len(line) and line[col] in '0123456789abcdefABCDEF':
					col += 1
				tokens.append(Token(TokenType.NUMBER_HEX, line[start:col], line_num, start, col - start))
				continue

			# Binary number
			if char == '%':
				start = col
				col += 1
				while col < len(line) and line[col] in '01':
					col += 1
				tokens.append(Token(TokenType.NUMBER_BIN, line[start:col], line_num, start, col - start))
				continue

			# Decimal number
			if char.isdigit():
				start = col
				while col < len(line) and line[col].isdigit():
					col += 1
				tokens.append(Token(TokenType.NUMBER_DEC, line[start:col], line_num, start, col - start))
				continue

			# Operators
			if char in '+-*/<>=&|^~!(),[]#@':
				tokens.append(Token(TokenType.OPERATOR, char, line_num, col, 1))
				col += 1
				continue

			# Label or identifier
			if char.isalpha() or char in '_.' or (char == ':' and col > 0):
				start = col
				# Check for label definition (ends with :)
				while col < len(line) and (line[col].isalnum() or line[col] in '_.' or line[col] == ':'):
					col += 1

				word = line[start:col]

				# Determine token type
				if word.endswith(':'):
					tokens.append(Token(TokenType.LABEL, word, line_num, start, col - start))
				elif word.startswith('.') or word.lower() in DIRECTIVES:
					tokens.append(Token(TokenType.DIRECTIVE, word, line_num, start, col - start))
				elif word.lower() in self.instructions:
					tokens.append(Token(TokenType.INSTRUCTION, word, line_num, start, col - start))
				elif word.lower() in self.registers:
					tokens.append(Token(TokenType.REGISTER, word, line_num, start, col - start))
				else:
					tokens.append(Token(TokenType.SYMBOL, word, line_num, start, col - start))
				continue

			# Unknown
			tokens.append(Token(TokenType.UNKNOWN, char, line_num, col, 1))
			col += 1

		return tokens


class AssemblyParser:
	"""Parser for assembly code."""

	def __init__(self, is_65816: bool = False):
		self.is_65816 = is_65816
		self.lexer = AssemblyLexer(is_65816)

	def parse(self, source: str) -> list[Instruction]:
		"""Parse assembly source into instructions."""
		instructions = []
		lines = source.split('\n')

		for line_num, line in enumerate(lines, 1):
			instruction = self._parse_line(line, line_num)
			if instruction:
				instructions.append(instruction)

		return instructions

	def _parse_line(self, line: str, line_num: int) -> Optional[Instruction]:
		"""Parse a single line into an instruction."""
		# Remove comments
		if ';' in line:
			comment_start = line.index(';')
			comment = line[comment_start + 1:].strip()
			line = line[:comment_start]
		else:
			comment = None

		line = line.strip()
		if not line:
			return None

		# Check for label
		label = None
		if ':' in line:
			parts = line.split(':', 1)
			label = parts[0].strip()
			line = parts[1].strip() if len(parts) > 1 else ""

		if not line and label:
			# Label-only line
			return Instruction(
				mnemonic="",
				label=label,
				comment=comment,
				line_number=line_num
			)

		# Parse instruction
		parts = line.split(None, 1)
		if not parts:
			return None

		mnemonic = parts[0].lower()
		operand = parts[1].strip() if len(parts) > 1 else None

		# Determine addressing mode
		addressing_mode, bytes_size = self._determine_addressing_mode(operand)

		return Instruction(
			mnemonic=mnemonic,
			operand=operand,
			addressing_mode=addressing_mode,
			bytes_size=bytes_size,
			label=label,
			comment=comment,
			line_number=line_num
		)

	def _determine_addressing_mode(self, operand: Optional[str]) -> tuple[str, int]:
		"""Determine addressing mode from operand."""
		if not operand:
			return "implied", 1

		operand = operand.strip()

		# Immediate
		if operand.startswith('#'):
			if self.is_65816 and len(operand) > 5:  # 16-bit immediate
				return "immediate_16", 3
			return "immediate", 2

		# Indirect
		if operand.startswith('('):
			if operand.endswith(',x)'):
				return "indexed_indirect_x", 2
			elif operand.endswith('),y'):
				return "indirect_indexed_y", 2
			elif operand.endswith(')'):
				return "indirect", 3
			return "indirect", 3

		# Long
		if operand.startswith('['):
			return "indirect_long", 3

		# Indexed
		if ',x' in operand.lower():
			if self._is_zeropage(operand):
				return "zeropage_x", 2
			return "absolute_x", 3

		if ',y' in operand.lower():
			if self._is_zeropage(operand):
				return "zeropage_y", 2
			return "absolute_y", 3

		# Direct/Absolute
		if self._is_zeropage(operand):
			return "zeropage", 2

		return "absolute", 3

	def _is_zeropage(self, operand: str) -> bool:
		"""Check if operand is zero page address."""
		# Extract address part
		addr_match = re.search(r'\$([0-9a-fA-F]+)', operand)
		if addr_match:
			addr = int(addr_match.group(1), 16)
			return addr < 256
		return False


class SyntaxHighlighter:
	"""Generates highlighted HTML/ANSI output for assembly code."""

	# HTML color scheme
	HTML_COLORS = {
		TokenType.LABEL: "#569cd6",       # Blue
		TokenType.INSTRUCTION: "#c586c0", # Purple
		TokenType.DIRECTIVE: "#4ec9b0",   # Teal
		TokenType.REGISTER: "#9cdcfe",    # Light blue
		TokenType.NUMBER_HEX: "#b5cea8",  # Light green
		TokenType.NUMBER_DEC: "#b5cea8",
		TokenType.NUMBER_BIN: "#b5cea8",
		TokenType.STRING: "#ce9178",      # Orange
		TokenType.COMMENT: "#6a9955",     # Green
		TokenType.OPERATOR: "#d4d4d4",    # Light gray
		TokenType.SYMBOL: "#dcdcaa",      # Yellow
		TokenType.WHITESPACE: None,
		TokenType.NEWLINE: None,
		TokenType.UNKNOWN: "#ff0000",     # Red
	}

	# ANSI color codes
	ANSI_COLORS = {
		TokenType.LABEL: "\033[34m",       # Blue
		TokenType.INSTRUCTION: "\033[35m", # Magenta
		TokenType.DIRECTIVE: "\033[36m",   # Cyan
		TokenType.REGISTER: "\033[94m",    # Light blue
		TokenType.NUMBER_HEX: "\033[32m",  # Green
		TokenType.NUMBER_DEC: "\033[32m",
		TokenType.NUMBER_BIN: "\033[32m",
		TokenType.STRING: "\033[33m",      # Yellow
		TokenType.COMMENT: "\033[90m",     # Gray
		TokenType.OPERATOR: "\033[37m",    # White
		TokenType.SYMBOL: "\033[93m",      # Light yellow
		TokenType.WHITESPACE: "",
		TokenType.NEWLINE: "",
		TokenType.UNKNOWN: "\033[31m",     # Red
	}

	ANSI_RESET = "\033[0m"

	def __init__(self, is_65816: bool = False):
		self.lexer = AssemblyLexer(is_65816)

	def highlight_html(self, source: str) -> str:
		"""Generate HTML with syntax highlighting."""
		tokens = self.lexer.tokenize(source)

		html_parts = ['<pre class="asm-code"><code>']

		for token in tokens:
			if token.type == TokenType.NEWLINE:
				html_parts.append('\n')
			elif token.type == TokenType.WHITESPACE:
				html_parts.append(self._escape_html(token.value))
			else:
				color = self.HTML_COLORS.get(token.type)
				escaped = self._escape_html(token.value)
				if color:
					html_parts.append(f'<span style="color:{color}">{escaped}</span>')
				else:
					html_parts.append(escaped)

		html_parts.append('</code></pre>')
		return ''.join(html_parts)

	def highlight_ansi(self, source: str) -> str:
		"""Generate ANSI-colored output for terminal."""
		tokens = self.lexer.tokenize(source)

		parts = []

		for token in tokens:
			if token.type == TokenType.NEWLINE:
				parts.append('\n')
			elif token.type == TokenType.WHITESPACE:
				parts.append(token.value)
			else:
				color = self.ANSI_COLORS.get(token.type, "")
				parts.append(f'{color}{token.value}{self.ANSI_RESET}')

		return ''.join(parts)

	def _escape_html(self, text: str) -> str:
		"""Escape HTML special characters."""
		return (text
			.replace('&', '&amp;')
			.replace('<', '&lt;')
			.replace('>', '&gt;')
			.replace('"', '&quot;')
			.replace("'", '&#39;'))


def generate_instruction_reference(is_65816: bool = False) -> str:
	"""Generate instruction reference documentation."""
	instructions = INSTRUCTIONS_65816 if is_65816 else INSTRUCTIONS_6502
	cpu = "65816" if is_65816 else "6502"

	doc = [f"# {cpu} Instruction Reference\n"]

	# Group by category
	categories = {
		"Load/Store": ["lda", "ldx", "ldy", "sta", "stx", "sty", "stz"],
		"Transfer": ["tax", "tay", "txa", "tya", "tsx", "txs", "tcd", "tcs", "tdc", "tsc", "txy", "tyx", "xba"],
		"Stack": ["pha", "php", "pla", "plp", "phx", "phy", "plx", "ply", "pea", "pei", "per", "phb", "phd", "phk", "plb", "pld"],
		"Arithmetic": ["adc", "sbc", "inc", "inx", "iny", "dec", "dex", "dey", "ina", "dea"],
		"Logic": ["and", "ora", "eor", "bit", "trb", "tsb"],
		"Shift/Rotate": ["asl", "lsr", "rol", "ror"],
		"Compare": ["cmp", "cpx", "cpy"],
		"Branch": ["bcc", "bcs", "beq", "bne", "bmi", "bpl", "bvc", "bvs", "bra", "brl"],
		"Jump": ["jmp", "jsr", "rts", "rti", "jml", "jsl", "rtl"],
		"Flags": ["clc", "sec", "cli", "sei", "cld", "sed", "clv", "rep", "sep", "xce"],
		"Other": ["nop", "brk", "wai", "stp", "wdm", "mvn", "mvp", "cop"],
	}

	for category, mnemonics in categories.items():
		available = [m for m in mnemonics if m in instructions]
		if available:
			doc.append(f"\n## {category}\n")
			doc.append("| Mnemonic | Description |")
			doc.append("|----------|-------------|")
			for mnemonic in sorted(available):
				doc.append(f"| `{mnemonic.upper()}` | {_get_instruction_description(mnemonic)} |")

	return '\n'.join(doc)


def _get_instruction_description(mnemonic: str) -> str:
	"""Get description for instruction."""
	descriptions = {
		# Load/Store
		"lda": "Load Accumulator",
		"ldx": "Load X Register",
		"ldy": "Load Y Register",
		"sta": "Store Accumulator",
		"stx": "Store X Register",
		"sty": "Store Y Register",
		"stz": "Store Zero",
		# Transfer
		"tax": "Transfer A to X",
		"tay": "Transfer A to Y",
		"txa": "Transfer X to A",
		"tya": "Transfer Y to A",
		"tsx": "Transfer Stack Pointer to X",
		"txs": "Transfer X to Stack Pointer",
		"tcd": "Transfer A to Direct Page",
		"tcs": "Transfer A to Stack Pointer",
		"tdc": "Transfer Direct Page to A",
		"tsc": "Transfer Stack Pointer to A",
		"txy": "Transfer X to Y",
		"tyx": "Transfer Y to X",
		"xba": "Exchange B and A",
		# Stack
		"pha": "Push Accumulator",
		"php": "Push Processor Status",
		"pla": "Pull Accumulator",
		"plp": "Pull Processor Status",
		"phx": "Push X Register",
		"phy": "Push Y Register",
		"plx": "Pull X Register",
		"ply": "Pull Y Register",
		"pea": "Push Effective Address",
		"pei": "Push Effective Indirect Address",
		"per": "Push Effective PC Relative Address",
		"phb": "Push Data Bank Register",
		"phd": "Push Direct Page Register",
		"phk": "Push Program Bank Register",
		"plb": "Pull Data Bank Register",
		"pld": "Pull Direct Page Register",
		# Arithmetic
		"adc": "Add with Carry",
		"sbc": "Subtract with Carry",
		"inc": "Increment Memory",
		"inx": "Increment X",
		"iny": "Increment Y",
		"dec": "Decrement Memory",
		"dex": "Decrement X",
		"dey": "Decrement Y",
		"ina": "Increment Accumulator",
		"dea": "Decrement Accumulator",
		# Logic
		"and": "Logical AND",
		"ora": "Logical OR",
		"eor": "Exclusive OR",
		"bit": "Bit Test",
		"trb": "Test and Reset Bits",
		"tsb": "Test and Set Bits",
		# Shift/Rotate
		"asl": "Arithmetic Shift Left",
		"lsr": "Logical Shift Right",
		"rol": "Rotate Left",
		"ror": "Rotate Right",
		# Compare
		"cmp": "Compare Accumulator",
		"cpx": "Compare X Register",
		"cpy": "Compare Y Register",
		# Branch
		"bcc": "Branch if Carry Clear",
		"bcs": "Branch if Carry Set",
		"beq": "Branch if Equal",
		"bne": "Branch if Not Equal",
		"bmi": "Branch if Minus",
		"bpl": "Branch if Plus",
		"bvc": "Branch if Overflow Clear",
		"bvs": "Branch if Overflow Set",
		"bra": "Branch Always",
		"brl": "Branch Always Long",
		# Jump
		"jmp": "Jump",
		"jsr": "Jump to Subroutine",
		"rts": "Return from Subroutine",
		"rti": "Return from Interrupt",
		"jml": "Jump Long",
		"jsl": "Jump to Subroutine Long",
		"rtl": "Return from Subroutine Long",
		# Flags
		"clc": "Clear Carry Flag",
		"sec": "Set Carry Flag",
		"cli": "Clear Interrupt Disable",
		"sei": "Set Interrupt Disable",
		"cld": "Clear Decimal Mode",
		"sed": "Set Decimal Mode",
		"clv": "Clear Overflow Flag",
		"rep": "Reset Processor Status Bits",
		"sep": "Set Processor Status Bits",
		"xce": "Exchange Carry and Emulation Flags",
		# Other
		"nop": "No Operation",
		"brk": "Break",
		"wai": "Wait for Interrupt",
		"stp": "Stop Processor",
		"wdm": "Reserved for Future Expansion",
		"mvn": "Block Move Negative",
		"mvp": "Block Move Positive",
		"cop": "Co-processor Enable",
	}
	return descriptions.get(mnemonic, "Unknown")


def main():
	parser = argparse.ArgumentParser(description="Assembly Syntax Highlighter and Parser")
	parser.add_argument("input", nargs="?", help="Input assembly file")
	parser.add_argument("--output", "-o", help="Output file")
	parser.add_argument("--format", "-f", choices=["html", "ansi", "json", "reference"],
		default="ansi", help="Output format")
	parser.add_argument("--65816", dest="is_65816", action="store_true",
		help="Use 65816 instruction set (default: 6502)")
	parser.add_argument("--parse", "-p", action="store_true",
		help="Parse and output instruction analysis")

	args = parser.parse_args()

	if args.format == "reference":
		output = generate_instruction_reference(args.is_65816)
	elif not args.input:
		parser.error("Input file required (unless --format=reference)")
	else:
		input_path = Path(args.input)
		source = input_path.read_text(encoding='utf-8')

		if args.parse:
			asm_parser = AssemblyParser(args.is_65816)
			instructions = asm_parser.parse(source)
			output = json.dumps([{
				"mnemonic": i.mnemonic,
				"operand": i.operand,
				"addressing_mode": i.addressing_mode,
				"bytes_size": i.bytes_size,
				"label": i.label,
				"comment": i.comment,
				"line": i.line_number
			} for i in instructions], indent=2)
		else:
			highlighter = SyntaxHighlighter(args.is_65816)

			if args.format == "html":
				output = highlighter.highlight_html(source)
			elif args.format == "json":
				tokens = highlighter.lexer.tokenize(source)
				output = json.dumps([{
					"type": t.type.value,
					"value": t.value,
					"line": t.line,
					"column": t.column
				} for t in tokens], indent=2)
			else:
				output = highlighter.highlight_ansi(source)

	if args.output:
		Path(args.output).write_text(output, encoding='utf-8')
		print(f"Output written to {args.output}")
	else:
		print(output)


if __name__ == "__main__":
	main()
