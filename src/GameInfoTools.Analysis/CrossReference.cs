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

/// <summary>
/// Call graph analysis and visualization.
/// </summary>
public class CallGraphAnalyzer {
	private readonly CrossReferenceDb _db;

	public CallGraphAnalyzer(CrossReferenceDb db) {
		_db = db;
	}

	/// <summary>
	/// Node in the call graph.
	/// </summary>
	public record CallGraphNode(int Address, string? Label, int InDegree, int OutDegree, bool IsEntryPoint, bool IsLeaf);

	/// <summary>
	/// Edge in the call graph.
	/// </summary>
	public record CallGraphEdge(int From, int To, CrossReferenceDb.RefType Type, int Weight);

	/// <summary>
	/// Build call graph from cross-references.
	/// </summary>
	public (List<CallGraphNode> Nodes, List<CallGraphEdge> Edges) BuildCallGraph() {
		var nodes = new Dictionary<int, CallGraphNode>();
		var edges = new List<CallGraphEdge>();
		var edgeCounts = new Dictionary<(int, int), int>();

		// First pass: collect all call/jump edges
		var subroutines = _db.FindSubroutines().ToHashSet();
		var entryPoints = _db.FindEntryPoints().ToHashSet();

		foreach (var target in subroutines.Union(entryPoints)) {
			var refsTo = _db.GetRefsTo(target).Where(r => r.Type is CrossReferenceDb.RefType.Call or CrossReferenceDb.RefType.Jump);
			var refsFrom = _db.GetRefsFrom(target).Where(r => r.Type is CrossReferenceDb.RefType.Call or CrossReferenceDb.RefType.Jump);

			int inDegree = refsTo.Count();
			int outDegree = refsFrom.Count();

			nodes[target] = new CallGraphNode(
				target,
				_db.GetLabel(target),
				inDegree,
				outDegree,
				entryPoints.Contains(target),
				outDegree == 0
			);

			// Build edges
			foreach (var r in refsTo) {
				var key = (r.SourceAddress, target);
				if (!edgeCounts.TryGetValue(key, out int count)) {
					count = 0;
				}

				edgeCounts[key] = count + 1;
			}
		}

		// Convert edge counts to edges
		foreach (var kvp in edgeCounts) {
			var (from, to) = kvp.Key;
			var refType = _db.GetRefsTo(to)
				.FirstOrDefault(r => r.SourceAddress == from)?.Type ?? CrossReferenceDb.RefType.Call;
			edges.Add(new CallGraphEdge(from, to, refType, kvp.Value));
		}

		return (nodes.Values.ToList(), edges);
	}

	/// <summary>
	/// Find all paths from source to destination.
	/// </summary>
	public List<List<int>> FindPaths(int source, int destination, int maxDepth = 10) {
		var paths = new List<List<int>>();
		var currentPath = new List<int> { source };
		var visited = new HashSet<int> { source };

		FindPathsDfs(source, destination, currentPath, visited, paths, maxDepth);

		return paths;
	}

	private void FindPathsDfs(int current, int destination, List<int> path, HashSet<int> visited,
		List<List<int>> paths, int maxDepth) {
		if (path.Count > maxDepth) {
			return;
		}

		if (current == destination && path.Count > 1) {
			paths.Add([.. path]);
			return;
		}

		foreach (var xref in _db.GetRefsFrom(current)) {
			if (xref.Type is not (CrossReferenceDb.RefType.Call or CrossReferenceDb.RefType.Jump)) {
				continue;
			}

			int next = xref.TargetAddress;
			if (visited.Contains(next)) {
				continue;
			}

			visited.Add(next);
			path.Add(next);
			FindPathsDfs(next, destination, path, visited, paths, maxDepth);
			path.RemoveAt(path.Count - 1);
			visited.Remove(next);
		}
	}

	/// <summary>
	/// Export call graph to DOT format for Graphviz.
	/// </summary>
	public string ExportToDot(string graphName = "CallGraph") {
		var (nodes, edges) = BuildCallGraph();
		var sb = new StringBuilder();

		sb.AppendLine($"digraph {graphName} {{");
		sb.AppendLine("  rankdir=TB;");
		sb.AppendLine("  node [shape=box, fontname=\"Consolas\"];");
		sb.AppendLine();

		// Entry points with special style
		sb.AppendLine("  // Entry Points");
		foreach (var node in nodes.Where(n => n.IsEntryPoint)) {
			string label = node.Label ?? $"${node.Address:x4}";
			sb.AppendLine($"  \"${node.Address:x4}\" [label=\"{label}\", style=bold, color=green];");
		}

		// Leaf nodes
		sb.AppendLine();
		sb.AppendLine("  // Leaf Functions");
		foreach (var node in nodes.Where(n => n.IsLeaf && !n.IsEntryPoint)) {
			string label = node.Label ?? $"${node.Address:x4}";
			sb.AppendLine($"  \"${node.Address:x4}\" [label=\"{label}\", style=filled, fillcolor=lightgray];");
		}

		// Regular nodes
		sb.AppendLine();
		sb.AppendLine("  // Regular Functions");
		foreach (var node in nodes.Where(n => !n.IsEntryPoint && !n.IsLeaf)) {
			string label = node.Label ?? $"${node.Address:x4}";
			sb.AppendLine($"  \"${node.Address:x4}\" [label=\"{label}\"];");
		}

		// Edges
		sb.AppendLine();
		sb.AppendLine("  // Edges");
		foreach (var edge in edges) {
			string style = edge.Type == CrossReferenceDb.RefType.Jump ? "dashed" : "solid";
			string color = edge.Type == CrossReferenceDb.RefType.Jump ? "blue" : "black";
			sb.AppendLine($"  \"${edge.From:x4}\" -> \"${edge.To:x4}\" [style={style}, color={color}];");
		}

		sb.AppendLine("}");
		return sb.ToString();
	}

	/// <summary>
	/// Get statistics about the call graph.
	/// </summary>
	public CallGraphStats GetStatistics() {
		var (nodes, edges) = BuildCallGraph();

		return new CallGraphStats {
			TotalNodes = nodes.Count,
			TotalEdges = edges.Count,
			EntryPoints = nodes.Count(n => n.IsEntryPoint),
			LeafFunctions = nodes.Count(n => n.IsLeaf),
			MaxInDegree = nodes.Count > 0 ? nodes.Max(n => n.InDegree) : 0,
			MaxOutDegree = nodes.Count > 0 ? nodes.Max(n => n.OutDegree) : 0,
			AverageInDegree = nodes.Count > 0 ? nodes.Average(n => n.InDegree) : 0,
			AverageOutDegree = nodes.Count > 0 ? nodes.Average(n => n.OutDegree) : 0,
			CallEdges = edges.Count(e => e.Type == CrossReferenceDb.RefType.Call),
			JumpEdges = edges.Count(e => e.Type == CrossReferenceDb.RefType.Jump)
		};
	}

	/// <summary>
	/// Statistics about the call graph.
	/// </summary>
	public record CallGraphStats {
		public int TotalNodes { get; init; }
		public int TotalEdges { get; init; }
		public int EntryPoints { get; init; }
		public int LeafFunctions { get; init; }
		public int MaxInDegree { get; init; }
		public int MaxOutDegree { get; init; }
		public double AverageInDegree { get; init; }
		public double AverageOutDegree { get; init; }
		public int CallEdges { get; init; }
		public int JumpEdges { get; init; }
	}
}

/// <summary>
/// Jump table detection and analysis.
/// </summary>
public class JumpTableDetector {
	/// <summary>
	/// Detected jump table.
	/// </summary>
	public record JumpTable(int Address, int EntryCount, int EntrySize, List<int> Targets, JumpTableType Type);

	/// <summary>
	/// Type of jump table.
	/// </summary>
	public enum JumpTableType {
		Absolute,       // Direct 16-bit addresses
		Relative,       // 8-bit offsets from base
		Split,          // Low/high byte tables
		Indexed,        // Indexed with multiplier
	}

	/// <summary>
	/// Detect jump tables in ROM data.
	/// </summary>
	public List<JumpTable> DetectJumpTables(byte[] data, int startOffset, int length, int cpuBase = 0x8000) {
		var tables = new List<JumpTable>();
		int end = Math.Min(startOffset + length, data.Length);

		// Look for patterns of consecutive addresses
		for (int i = startOffset; i < end - 4; i++) {
			// Try absolute 16-bit address table
			var absTable = TryDetectAbsoluteTable(data, i, end, cpuBase);
			if (absTable != null && absTable.EntryCount >= 3) {
				tables.Add(absTable);
				i += absTable.EntryCount * 2 - 1; // Skip detected table
				continue;
			}

			// Try split low/high byte table
			var splitTable = TryDetectSplitTable(data, i, end, cpuBase);
			if (splitTable != null && splitTable.EntryCount >= 3) {
				tables.Add(splitTable);
				i += splitTable.EntryCount - 1;
			}
		}

		return tables;
	}

	private JumpTable? TryDetectAbsoluteTable(byte[] data, int offset, int end, int cpuBase) {
		var targets = new List<int>();
		int i = offset;

		while (i + 1 < end && targets.Count < 64) {
			int addr = data[i] | (data[i + 1] << 8);

			// Check if it looks like a valid code address
			if (addr < cpuBase || addr > cpuBase + 0x7fff) {
				break;
			}

			// Check for reasonable address distribution
			if (targets.Count > 0) {
				int diff = Math.Abs(addr - targets[^1]);
				if (diff > 0x2000) {
					// Addresses too spread out, probably not a table
					break;
				}
			}

			targets.Add(addr);
			i += 2;
		}

		if (targets.Count < 3) {
			return null;
		}

		return new JumpTable(offset, targets.Count, 2, targets, JumpTableType.Absolute);
	}

	private JumpTable? TryDetectSplitTable(byte[] data, int offset, int end, int cpuBase) {
		// Look for low byte table followed by high byte table
		// Common pattern: consecutive low bytes, then consecutive high bytes

		var lowBytes = new List<byte>();
		var highBytes = new List<byte>();

		// Collect potential low bytes
		int i = offset;
		while (i < end && lowBytes.Count < 32) {
			byte b = data[i];
			if (lowBytes.Count > 0 && Math.Abs(b - lowBytes[^1]) > 0x40) {
				break;
			}

			lowBytes.Add(b);
			i++;
		}

		if (lowBytes.Count < 3) {
			return null;
		}

		// Check for matching high bytes after low bytes
		int highStart = offset + lowBytes.Count;
		if (highStart >= end) {
			return null;
		}

		while (i < end && highBytes.Count < lowBytes.Count) {
			byte b = data[i];
			// High bytes should be in code range
			if (b < (cpuBase >> 8) || b > ((cpuBase + 0x7fff) >> 8)) {
				break;
			}

			highBytes.Add(b);
			i++;
		}

		if (highBytes.Count != lowBytes.Count) {
			return null;
		}

		// Reconstruct addresses
		var targets = new List<int>();
		for (int j = 0; j < lowBytes.Count; j++) {
			targets.Add(lowBytes[j] | (highBytes[j] << 8));
		}

		return new JumpTable(offset, targets.Count, 1, targets, JumpTableType.Split);
	}

	/// <summary>
	/// Find JMP indirect instructions that might use jump tables.
	/// </summary>
	public List<(int InstructionAddr, int TableAddr)> FindJumpIndirectUsers(byte[] data, int startOffset, int length, int cpuBase = 0x8000) {
		var results = new List<(int, int)>();
		int end = Math.Min(startOffset + length, data.Length);

		for (int i = startOffset; i < end - 2; i++) {
			// JMP ($nnnn) = 0x6C
			if (data[i] == 0x6c) {
				int tableAddr = data[i + 1] | (data[i + 2] << 8);
				results.Add((cpuBase + (i - startOffset), tableAddr));
			}
		}

		return results;
	}
}

/// <summary>
/// Unused code detection.
/// </summary>
public class UnusedCodeDetector {
	private readonly CrossReferenceDb _db;

	public UnusedCodeDetector(CrossReferenceDb db) {
		_db = db;
	}

	/// <summary>
	/// Code region that appears unused.
	/// </summary>
	public record UnusedRegion(int StartAddress, int EndAddress, int Size, UnusedReason Reason);

	/// <summary>
	/// Reason code appears unused.
	/// </summary>
	public enum UnusedReason {
		NoReferences,       // No references to this address
		DeadCode,           // Code after unconditional jump/return
		UnreachableCode,    // Not reachable from any entry point
	}

	/// <summary>
	/// Find functions that are never called.
	/// </summary>
	public List<int> FindUnusedFunctions() {
		// Get all functions (addresses that have outgoing calls but no incoming calls)
		var allTargets = new HashSet<int>();
		var allSources = new HashSet<int>();

		foreach (var target in GetAllReferencedTargets()) {
			var refsTo = _db.GetRefsTo(target);
			if (refsTo.Any(r => r.Type == CrossReferenceDb.RefType.Call)) {
				allTargets.Add(target);
			}
		}

		foreach (var source in GetAllReferenceSources()) {
			var refsFrom = _db.GetRefsFrom(source);
			if (refsFrom.Any(r => r.Type == CrossReferenceDb.RefType.Call)) {
				allSources.Add(source);
			}
		}

		// Functions that appear to have code but are never called
		return allSources.Except(allTargets).OrderBy(a => a).ToList();
	}

	/// <summary>
	/// Find potential dead code after unconditional jumps.
	/// </summary>
	public List<UnusedRegion> FindDeadCodeRegions(byte[] data, int startOffset, int length, int cpuBase = 0x8000) {
		var regions = new List<UnusedRegion>();
		int end = Math.Min(startOffset + length, data.Length);

		for (int i = startOffset; i < end; i++) {
			byte opcode = data[i];

			// Check for unconditional control transfer
			bool isUnconditional = opcode switch {
				0x4c => true,  // JMP absolute
				0x6c => true,  // JMP indirect
				0x60 => true,  // RTS
				0x40 => true,  // RTI
				_ => false
			};

			if (!isUnconditional) {
				continue;
			}

			int instrLen = opcode switch {
				0x4c => 3,
				0x6c => 3,
				0x60 => 1,
				0x40 => 1,
				_ => 1
			};

			int nextAddr = cpuBase + (i - startOffset) + instrLen;

			// Check if there are any references to the next address
			if (!_db.GetRefsTo(nextAddr).Any()) {
				// This could be dead code - scan until we find referenced code
				int deadStart = nextAddr;
				int scanPos = i + instrLen;

				while (scanPos < end) {
					int scanAddr = cpuBase + (scanPos - startOffset);
					if (_db.GetRefsTo(scanAddr).Any()) {
						break;
					}

					// Check for another entry point marker (label)
					if (_db.GetLabel(scanAddr) != null) {
						break;
					}

					scanPos++;
				}

				int deadEnd = cpuBase + (scanPos - startOffset);
				if (deadEnd > deadStart + 2) {
					regions.Add(new UnusedRegion(deadStart, deadEnd, deadEnd - deadStart, UnusedReason.DeadCode));
				}
			}

			// Skip the instruction we just processed
			i += instrLen - 1;
		}

		return regions;
	}

	/// <summary>
	/// Calculate reference counts for all addresses.
	/// </summary>
	public Dictionary<int, int> GetReferenceCounts() {
		var counts = new Dictionary<int, int>();

		foreach (var target in GetAllReferencedTargets()) {
			counts[target] = _db.GetRefsTo(target).Count();
		}

		return counts;
	}

	/// <summary>
	/// Get most-referenced addresses (hot spots).
	/// </summary>
	public List<(int Address, int Count, string? Label)> GetHotSpots(int topN = 20) {
		var counts = GetReferenceCounts();

		return counts
			.OrderByDescending(kvp => kvp.Value)
			.Take(topN)
			.Select(kvp => (kvp.Key, kvp.Value, _db.GetLabel(kvp.Key)))
			.ToList();
	}

	private IEnumerable<int> GetAllReferencedTargets() {
		// This is a bit of a hack since we don't have direct access to _refsTo keys
		// We'll use the public methods to infer them
		var targets = new HashSet<int>();
		for (int addr = 0; addr < 0x10000; addr++) {
			if (_db.GetRefsTo(addr).Any()) {
				targets.Add(addr);
			}
		}

		return targets;
	}

	private IEnumerable<int> GetAllReferenceSources() {
		var sources = new HashSet<int>();
		for (int addr = 0; addr < 0x10000; addr++) {
			if (_db.GetRefsFrom(addr).Any()) {
				sources.Add(addr);
			}
		}

		return sources;
	}
}

/// <summary>
/// Data reference tracking and analysis.
/// </summary>
public class DataReferenceTracker {
	private readonly CrossReferenceDb _db;

	public DataReferenceTracker(CrossReferenceDb db) {
		_db = db;
	}

	/// <summary>
	/// Data access pattern.
	/// </summary>
	public record DataAccess(int Address, bool IsRead, bool IsWrite, int AccessCount, List<int> Accessors);

	/// <summary>
	/// Analyze data access patterns.
	/// </summary>
	public List<DataAccess> AnalyzeDataAccess() {
		var dataAddrs = new Dictionary<int, (bool Read, bool Write, List<int> Readers, List<int> Writers)>();

		for (int addr = 0; addr < 0x10000; addr++) {
			var refs = _db.GetRefsTo(addr).ToList();
			if (refs.Count == 0) {
				continue;
			}

			var reads = refs.Where(r => r.Type == CrossReferenceDb.RefType.DataRead).Select(r => r.SourceAddress).ToList();
			var writes = refs.Where(r => r.Type == CrossReferenceDb.RefType.DataWrite).Select(r => r.SourceAddress).ToList();

			if (reads.Count > 0 || writes.Count > 0) {
				dataAddrs[addr] = (reads.Count > 0, writes.Count > 0, reads, writes);
			}
		}

		return dataAddrs.Select(kvp => new DataAccess(
			kvp.Key,
			kvp.Value.Read,
			kvp.Value.Write,
			kvp.Value.Readers.Count + kvp.Value.Writers.Count,
			kvp.Value.Readers.Concat(kvp.Value.Writers).Distinct().ToList()
		)).OrderBy(d => d.Address).ToList();
	}

	/// <summary>
	/// Find read-only data (no writes).
	/// </summary>
	public List<int> FindReadOnlyData() {
		var access = AnalyzeDataAccess();
		return access.Where(d => d.IsRead && !d.IsWrite).Select(d => d.Address).ToList();
	}

	/// <summary>
	/// Find write-only data (no reads).
	/// </summary>
	public List<int> FindWriteOnlyData() {
		var access = AnalyzeDataAccess();
		return access.Where(d => d.IsWrite && !d.IsRead).Select(d => d.Address).ToList();
	}

	/// <summary>
	/// Categorize addresses by type.
	/// </summary>
	public Dictionary<string, List<int>> CategorizeAddresses() {
		var categories = new Dictionary<string, List<int>> {
			["RAM"] = [],
			["PPU"] = [],
			["APU"] = [],
			["PRG ROM"] = [],
			["SRAM"] = [],
			["Other"] = []
		};

		var access = AnalyzeDataAccess();
		foreach (var d in access) {
			string category = d.Address switch {
				< 0x0800 => "RAM",
				< 0x2000 => "RAM",  // Mirrors
				< 0x4000 => "PPU",
				< 0x4020 => "APU",
				>= 0x6000 and < 0x8000 => "SRAM",
				>= 0x8000 => "PRG ROM",
				_ => "Other"
			};

			categories[category].Add(d.Address);
		}

		return categories;
	}
}
