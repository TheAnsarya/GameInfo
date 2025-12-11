using System.Text;

namespace GameInfoTools.Analysis;

/// <summary>
/// Cross-reference database for code analysis.
/// </summary>
public class CrossReferenceDb {
	/// <summary>
	/// Reference type.
	/// </summary>
	public enum RefType {
		Jump,           // JMP instruction
		Call,           // JSR instruction
		Branch,         // Conditional branch
		DataRead,       // LDA, LDX, LDY from address
		DataWrite,      // STA, STX, STY to address
		Indirect,       // Indirect addressing
		Pointer,        // Pointer table reference
	}

	/// <summary>
	/// A single cross-reference.
	/// </summary>
	public record CrossRef(int SourceAddress, int TargetAddress, RefType Type, string? Comment = null);

	private readonly Dictionary<int, List<CrossRef>> _refsTo = new();    // Target -> Sources
	private readonly Dictionary<int, List<CrossRef>> _refsFrom = new();  // Source -> Targets
	private readonly Dictionary<int, string> _labels = new();
	private readonly Dictionary<int, string> _comments = new();

	/// <summary>
	/// Add a cross-reference.
	/// </summary>
	public void AddRef(int source, int target, RefType type, string? comment = null) {
		var xref = new CrossRef(source, target, type, comment);

		if (!_refsTo.TryGetValue(target, out var toList)) {
			toList = new List<CrossRef>();
			_refsTo[target] = toList;
		}

		toList.Add(xref);

		if (!_refsFrom.TryGetValue(source, out var fromList)) {
			fromList = new List<CrossRef>();
			_refsFrom[source] = fromList;
		}

		fromList.Add(xref);
	}

	/// <summary>
	/// Get all references TO an address.
	/// </summary>
	public IEnumerable<CrossRef> GetRefsTo(int address) {
		return _refsTo.TryGetValue(address, out var list) ? list : Enumerable.Empty<CrossRef>();
	}

	/// <summary>
	/// Get all references FROM an address.
	/// </summary>
	public IEnumerable<CrossRef> GetRefsFrom(int address) {
		return _refsFrom.TryGetValue(address, out var list) ? list : Enumerable.Empty<CrossRef>();
	}

	/// <summary>
	/// Get all addresses that reference a target.
	/// </summary>
	public IEnumerable<int> GetCallersOf(int address) {
		return GetRefsTo(address).Select(r => r.SourceAddress).Distinct();
	}

	/// <summary>
	/// Get all addresses referenced from a source.
	/// </summary>
	public IEnumerable<int> GetCalleesOf(int address) {
		return GetRefsFrom(address).Select(r => r.TargetAddress).Distinct();
	}

	/// <summary>
	/// Set label for an address.
	/// </summary>
	public void SetLabel(int address, string label) {
		_labels[address] = label;
	}

	/// <summary>
	/// Get label for an address.
	/// </summary>
	public string? GetLabel(int address) {
		return _labels.TryGetValue(address, out var label) ? label : null;
	}

	/// <summary>
	/// Set comment for an address.
	/// </summary>
	public void SetComment(int address, string comment) {
		_comments[address] = comment;
	}

	/// <summary>
	/// Get comment for an address.
	/// </summary>
	public string? GetComment(int address) {
		return _comments.TryGetValue(address, out var comment) ? comment : null;
	}

	/// <summary>
	/// Build cross-references from ROM code.
	/// </summary>
	public void BuildFromRom(byte[] data, int offset, int length, int cpuBase = 0x8000) {
		int end = offset + length;

		for (int i = offset; i < end && i < data.Length; i++) {
			byte opcode = data[i];
			int cpuAddr = cpuBase + (i - offset);

			// JMP absolute
			if (opcode == 0x4c && i + 2 < end) {
				int target = data[i + 1] | (data[i + 2] << 8);
				AddRef(cpuAddr, target, RefType.Jump);
				i += 2;
			}
			// JSR absolute
			else if (opcode == 0x20 && i + 2 < end) {
				int target = data[i + 1] | (data[i + 2] << 8);
				AddRef(cpuAddr, target, RefType.Call);
				i += 2;
			}
			// Branch instructions
			else if ((opcode & 0x1f) == 0x10 && i + 1 < end) {
				sbyte offset2 = (sbyte)data[i + 1];
				int target = cpuAddr + 2 + offset2;
				AddRef(cpuAddr, target, RefType.Branch);
				i += 1;
			}
			// LDA absolute
			else if ((opcode == 0xad || opcode == 0xae || opcode == 0xac) && i + 2 < end) {
				int target = data[i + 1] | (data[i + 2] << 8);
				AddRef(cpuAddr, target, RefType.DataRead);
				i += 2;
			}
			// STA absolute
			else if ((opcode == 0x8d || opcode == 0x8e || opcode == 0x8c) && i + 2 < end) {
				int target = data[i + 1] | (data[i + 2] << 8);
				AddRef(cpuAddr, target, RefType.DataWrite);
				i += 2;
			}
			// JMP indirect
			else if (opcode == 0x6c && i + 2 < end) {
				int target = data[i + 1] | (data[i + 2] << 8);
				AddRef(cpuAddr, target, RefType.Indirect);
				i += 2;
			}
		}
	}

	/// <summary>
	/// Find all entry points (addresses with refs but no calls TO them).
	/// </summary>
	public IEnumerable<int> FindEntryPoints() {
		return _refsFrom.Keys
			.Where(addr => !_refsTo.ContainsKey(addr) || _refsTo[addr].Count == 0)
			.OrderBy(a => a);
	}

	/// <summary>
	/// Find orphaned code (no refs TO or FROM).
	/// </summary>
	public IEnumerable<int> FindOrphanedCode() {
		var allAddresses = _refsFrom.Keys.Union(_refsTo.Keys);
		return allAddresses.Where(addr =>
			(!_refsTo.ContainsKey(addr) || _refsTo[addr].Count == 0) &&
			(!_refsFrom.ContainsKey(addr) || _refsFrom[addr].Count == 0)
		).OrderBy(a => a);
	}

	/// <summary>
	/// Find subroutines (addresses with JSR calls to them).
	/// </summary>
	public IEnumerable<int> FindSubroutines() {
		return _refsTo.Where(kvp => kvp.Value.Any(r => r.Type == RefType.Call))
			.Select(kvp => kvp.Key)
			.OrderBy(a => a);
	}

	/// <summary>
	/// Generate a cross-reference report.
	/// </summary>
	public string GenerateReport() {
		var sb = new StringBuilder();
		sb.AppendLine("=== Cross-Reference Report ===");
		sb.AppendLine();

		// List all referenced addresses with callers
		var sortedTargets = _refsTo.Keys.OrderBy(a => a).ToList();

		foreach (var target in sortedTargets) {
			var refs = _refsTo[target];
			var label = GetLabel(target) ?? "";

			sb.Append($"${target:x4}");
			if (!string.IsNullOrEmpty(label)) {
				sb.Append($" ({label})");
			}

			sb.AppendLine(":");

			foreach (var refGroup in refs.GroupBy(r => r.Type)) {
				var sources = string.Join(", ", refGroup.Select(r => $"${r.SourceAddress:x4}"));
				sb.AppendLine($"  {refGroup.Key}: {sources}");
			}

			sb.AppendLine();
		}

		return sb.ToString();
	}

	/// <summary>
	/// Export to JSON format.
	/// </summary>
	public string ExportToJson() {
		var sb = new StringBuilder();
		sb.AppendLine("{");
		sb.AppendLine("  \"crossReferences\": [");

		var allRefs = _refsFrom.Values.SelectMany(l => l).ToList();
		for (int i = 0; i < allRefs.Count; i++) {
			var r = allRefs[i];
			sb.AppendLine("    {");
			sb.AppendLine($"      \"source\": \"0x{r.SourceAddress:x4}\",");
			sb.AppendLine($"      \"target\": \"0x{r.TargetAddress:x4}\",");
			sb.AppendLine($"      \"type\": \"{r.Type}\"");
			sb.Append("    }");
			sb.AppendLine(i < allRefs.Count - 1 ? "," : "");
		}

		sb.AppendLine("  ],");
		sb.AppendLine("  \"labels\": {");

		var labelList = _labels.ToList();
		for (int i = 0; i < labelList.Count; i++) {
			sb.Append($"    \"0x{labelList[i].Key:x4}\": \"{labelList[i].Value}\"");
			sb.AppendLine(i < labelList.Count - 1 ? "," : "");
		}

		sb.AppendLine("  }");
		sb.AppendLine("}");

		return sb.ToString();
	}

	/// <summary>
	/// Number of references in the database.
	/// </summary>
	public int RefCount => _refsFrom.Values.Sum(l => l.Count);

	/// <summary>
	/// Number of unique target addresses.
	/// </summary>
	public int TargetCount => _refsTo.Count;

	/// <summary>
	/// Clear all data.
	/// </summary>
	public void Clear() {
		_refsTo.Clear();
		_refsFrom.Clear();
		_labels.Clear();
		_comments.Clear();
	}
}

/// <summary>
/// Builds cross-references by analyzing code.
/// </summary>
public class CrossReferenceBuilder {
	private readonly CrossReferenceDb _db = new();

	/// <summary>
	/// Reference record for external access.
	/// </summary>
	public record Reference(int Source, int Target, CrossReferenceDb.RefType Type);

	/// <summary>
	/// Process code and build cross-references.
	/// </summary>
	/// <param name="rom">ROM data to analyze.</param>
	/// <param name="baseAddress">Base address for the code.</param>
	/// <param name="startOffset">Starting offset in ROM (default 0).</param>
	/// <param name="length">Length to analyze (default: entire ROM).</param>
	public void ProcessCode(byte[] rom, int baseAddress, int startOffset = 0, int? length = null) {
		int endOffset = startOffset + (length ?? rom.Length - startOffset);

		int offset = startOffset;
		while (offset < endOffset && offset < rom.Length) {
			byte opcode = rom[offset];
			int instrLen = GetInstructionLength(opcode);

			if (instrLen <= 0 || offset + instrLen > endOffset) {
				offset++;
				continue;
			}

			int sourceAddr = baseAddress + offset;

			// Check for branch/jump/call instructions
			var refType = GetReferenceType(opcode);
			if (refType.HasValue && instrLen >= 2) {
				int targetAddr = CalculateTargetAddress(rom, offset, opcode, baseAddress);
				if (targetAddr >= 0) {
					_db.AddRef(sourceAddr, targetAddr, refType.Value);
				}
			}

			// Check for absolute addressing (data access)
			if (IsAbsoluteAddressing(opcode) && instrLen >= 3) {
				int addr = rom[offset + 1] | (rom[offset + 2] << 8);
				var dataType = IsLoadInstruction(opcode) ? CrossReferenceDb.RefType.DataRead : CrossReferenceDb.RefType.DataWrite;
				_db.AddRef(sourceAddr, addr, dataType);
			}

			offset += instrLen;
		}
	}

	/// <summary>
	/// Get all references from a source address.
	/// </summary>
	public IEnumerable<Reference> GetReferencesFrom(int address) {
		return _db.GetRefsFrom(address).Select(r => new Reference(r.SourceAddress, r.TargetAddress, r.Type));
	}

	/// <summary>
	/// Get all references to a target address.
	/// </summary>
	public IEnumerable<Reference> GetReferencesTo(int address) {
		return _db.GetRefsTo(address).Select(r => new Reference(r.SourceAddress, r.TargetAddress, r.Type));
	}

	/// <summary>
	/// Get the underlying database.
	/// </summary>
	public CrossReferenceDb Database => _db;

	/// <summary>
	/// Get instruction length for 6502 opcode.
	/// </summary>
	private static int GetInstructionLength(byte opcode) {
		// Simplified 6502 instruction lengths
		return opcode switch {
			// Implied (1 byte)
			0x00 or 0x08 or 0x18 or 0x28 or 0x38 or 0x48 or 0x58 or 0x68 or 0x78
			or 0x88 or 0x98 or 0xa8 or 0xb8 or 0xc8 or 0xca or 0xd8 or 0xe8 or 0xea
			or 0x0a or 0x2a or 0x4a or 0x6a or 0x40 or 0x60 => 1,

			// Immediate, Zero Page, Zero Page X/Y, Indirect X/Y, Relative (2 bytes)
			0x09 or 0x29 or 0x49 or 0x69 or 0xa0 or 0xa2 or 0xa9 or 0xc0 or 0xc9 or 0xe0 or 0xe9 // Immediate
			or 0x05 or 0x06 or 0x24 or 0x25 or 0x26 or 0x45 or 0x46 or 0x65 or 0x66 or 0x84 or 0x85 or 0x86
			or 0xa4 or 0xa5 or 0xa6 or 0xc4 or 0xc5 or 0xc6 or 0xe4 or 0xe5 or 0xe6 // Zero Page
			or 0x10 or 0x30 or 0x50 or 0x70 or 0x90 or 0xb0 or 0xd0 or 0xf0 // Relative branches
			or 0x15 or 0x16 or 0x35 or 0x36 or 0x55 or 0x56 or 0x75 or 0x76 or 0x94 or 0x95 or 0x96
			or 0xb4 or 0xb5 or 0xb6 or 0xd5 or 0xd6 or 0xf5 or 0xf6 // Zero Page,X/Y
			or 0x01 or 0x11 or 0x21 or 0x31 or 0x41 or 0x51 or 0x61 or 0x71 or 0x81 or 0x91
			or 0xa1 or 0xb1 or 0xc1 or 0xd1 or 0xe1 or 0xf1 => 2, // Indirect

			// Absolute, Absolute X/Y, Indirect (3 bytes)
			0x0d or 0x0e or 0x2c or 0x2d or 0x2e or 0x4c or 0x4d or 0x4e or 0x6c or 0x6d or 0x6e
			or 0x8c or 0x8d or 0x8e or 0xac or 0xad or 0xae or 0xcc or 0xcd or 0xce or 0xec or 0xed or 0xee
			or 0x20 // JSR
			or 0x19 or 0x1d or 0x1e or 0x39 or 0x3d or 0x3e or 0x59 or 0x5d or 0x5e or 0x79 or 0x7d or 0x7e
			or 0x99 or 0x9d or 0xb9 or 0xbc or 0xbd or 0xbe or 0xd9 or 0xdd or 0xde or 0xf9 or 0xfd or 0xfe => 3,

			_ => 1, // Default to 1 for unknown
		};
	}

	/// <summary>
	/// Get reference type for instruction.
	/// </summary>
	private static CrossReferenceDb.RefType? GetReferenceType(byte opcode) {
		return opcode switch {
			0x4c => CrossReferenceDb.RefType.Jump,      // JMP absolute
			0x6c => CrossReferenceDb.RefType.Indirect,  // JMP indirect
			0x20 => CrossReferenceDb.RefType.Call,      // JSR
			0x10 or 0x30 or 0x50 or 0x70 or 0x90 or 0xb0 or 0xd0 or 0xf0 => CrossReferenceDb.RefType.Branch,
			_ => null
		};
	}

	/// <summary>
	/// Calculate target address for branch/jump.
	/// </summary>
	private static int CalculateTargetAddress(byte[] rom, int offset, byte opcode, int baseAddress) {
		// Relative branch
		if (opcode is 0x10 or 0x30 or 0x50 or 0x70 or 0x90 or 0xb0 or 0xd0 or 0xf0) {
			sbyte rel = (sbyte)rom[offset + 1];
			return baseAddress + offset + 2 + rel;
		}

		// Absolute
		if (offset + 2 < rom.Length) {
			return rom[offset + 1] | (rom[offset + 2] << 8);
		}

		return -1;
	}

	/// <summary>
	/// Check if opcode uses absolute addressing.
	/// </summary>
	private static bool IsAbsoluteAddressing(byte opcode) {
		return opcode is 0x0d or 0x0e or 0x2c or 0x2d or 0x2e or 0x4d or 0x4e or 0x6d or 0x6e
			or 0x8c or 0x8d or 0x8e or 0xac or 0xad or 0xae or 0xcc or 0xcd or 0xce or 0xec or 0xed or 0xee
			or 0x19 or 0x1d or 0x1e or 0x39 or 0x3d or 0x3e or 0x59 or 0x5d or 0x5e or 0x79 or 0x7d or 0x7e
			or 0x99 or 0x9d or 0xb9 or 0xbc or 0xbd or 0xbe or 0xd9 or 0xdd or 0xde or 0xf9 or 0xfd or 0xfe;
	}

	/// <summary>
	/// Check if opcode is a load instruction.
	/// </summary>
	private static bool IsLoadInstruction(byte opcode) {
		return opcode is 0xad or 0xae or 0xac or 0xbd or 0xbe or 0xbc or 0xb9;
	}
}
