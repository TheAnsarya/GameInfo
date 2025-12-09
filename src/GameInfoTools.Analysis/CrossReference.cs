using System.Text;

namespace GameInfoTools.Analysis;

/// <summary>
/// Cross-reference database for code analysis.
/// </summary>
public class CrossReferenceDb
{
	/// <summary>
	/// Reference type.
	/// </summary>
	public enum RefType
	{
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
	public void AddRef(int source, int target, RefType type, string? comment = null)
	{
		var xref = new CrossRef(source, target, type, comment);

		if (!_refsTo.TryGetValue(target, out var toList))
		{
			toList = new List<CrossRef>();
			_refsTo[target] = toList;
		}
		toList.Add(xref);

		if (!_refsFrom.TryGetValue(source, out var fromList))
		{
			fromList = new List<CrossRef>();
			_refsFrom[source] = fromList;
		}
		fromList.Add(xref);
	}

	/// <summary>
	/// Get all references TO an address.
	/// </summary>
	public IEnumerable<CrossRef> GetRefsTo(int address)
	{
		return _refsTo.TryGetValue(address, out var list) ? list : Enumerable.Empty<CrossRef>();
	}

	/// <summary>
	/// Get all references FROM an address.
	/// </summary>
	public IEnumerable<CrossRef> GetRefsFrom(int address)
	{
		return _refsFrom.TryGetValue(address, out var list) ? list : Enumerable.Empty<CrossRef>();
	}

	/// <summary>
	/// Get all addresses that reference a target.
	/// </summary>
	public IEnumerable<int> GetCallersOf(int address)
	{
		return GetRefsTo(address).Select(r => r.SourceAddress).Distinct();
	}

	/// <summary>
	/// Get all addresses referenced from a source.
	/// </summary>
	public IEnumerable<int> GetCalleesOf(int address)
	{
		return GetRefsFrom(address).Select(r => r.TargetAddress).Distinct();
	}

	/// <summary>
	/// Set label for an address.
	/// </summary>
	public void SetLabel(int address, string label)
	{
		_labels[address] = label;
	}

	/// <summary>
	/// Get label for an address.
	/// </summary>
	public string? GetLabel(int address)
	{
		return _labels.TryGetValue(address, out var label) ? label : null;
	}

	/// <summary>
	/// Set comment for an address.
	/// </summary>
	public void SetComment(int address, string comment)
	{
		_comments[address] = comment;
	}

	/// <summary>
	/// Get comment for an address.
	/// </summary>
	public string? GetComment(int address)
	{
		return _comments.TryGetValue(address, out var comment) ? comment : null;
	}

	/// <summary>
	/// Build cross-references from ROM code.
	/// </summary>
	public void BuildFromRom(byte[] data, int offset, int length, int cpuBase = 0x8000)
	{
		int end = offset + length;

		for (int i = offset; i < end && i < data.Length; i++)
		{
			byte opcode = data[i];
			int cpuAddr = cpuBase + (i - offset);

			// JMP absolute
			if (opcode == 0x4c && i + 2 < end)
			{
				int target = data[i + 1] | (data[i + 2] << 8);
				AddRef(cpuAddr, target, RefType.Jump);
				i += 2;
			}
			// JSR absolute
			else if (opcode == 0x20 && i + 2 < end)
			{
				int target = data[i + 1] | (data[i + 2] << 8);
				AddRef(cpuAddr, target, RefType.Call);
				i += 2;
			}
			// Branch instructions
			else if ((opcode & 0x1f) == 0x10 && i + 1 < end)
			{
				sbyte offset2 = (sbyte)data[i + 1];
				int target = cpuAddr + 2 + offset2;
				AddRef(cpuAddr, target, RefType.Branch);
				i += 1;
			}
			// LDA absolute
			else if ((opcode == 0xad || opcode == 0xae || opcode == 0xac) && i + 2 < end)
			{
				int target = data[i + 1] | (data[i + 2] << 8);
				AddRef(cpuAddr, target, RefType.DataRead);
				i += 2;
			}
			// STA absolute
			else if ((opcode == 0x8d || opcode == 0x8e || opcode == 0x8c) && i + 2 < end)
			{
				int target = data[i + 1] | (data[i + 2] << 8);
				AddRef(cpuAddr, target, RefType.DataWrite);
				i += 2;
			}
			// JMP indirect
			else if (opcode == 0x6c && i + 2 < end)
			{
				int target = data[i + 1] | (data[i + 2] << 8);
				AddRef(cpuAddr, target, RefType.Indirect);
				i += 2;
			}
		}
	}

	/// <summary>
	/// Find all entry points (addresses with refs but no calls TO them).
	/// </summary>
	public IEnumerable<int> FindEntryPoints()
	{
		return _refsFrom.Keys
			.Where(addr => !_refsTo.ContainsKey(addr) || _refsTo[addr].Count == 0)
			.OrderBy(a => a);
	}

	/// <summary>
	/// Find orphaned code (no refs TO or FROM).
	/// </summary>
	public IEnumerable<int> FindOrphanedCode()
	{
		var allAddresses = _refsFrom.Keys.Union(_refsTo.Keys);
		return allAddresses.Where(addr =>
			(!_refsTo.ContainsKey(addr) || _refsTo[addr].Count == 0) &&
			(!_refsFrom.ContainsKey(addr) || _refsFrom[addr].Count == 0)
		).OrderBy(a => a);
	}

	/// <summary>
	/// Find subroutines (addresses with JSR calls to them).
	/// </summary>
	public IEnumerable<int> FindSubroutines()
	{
		return _refsTo.Where(kvp => kvp.Value.Any(r => r.Type == RefType.Call))
			.Select(kvp => kvp.Key)
			.OrderBy(a => a);
	}

	/// <summary>
	/// Generate a cross-reference report.
	/// </summary>
	public string GenerateReport()
	{
		var sb = new StringBuilder();
		sb.AppendLine("=== Cross-Reference Report ===");
		sb.AppendLine();

		// List all referenced addresses with callers
		var sortedTargets = _refsTo.Keys.OrderBy(a => a).ToList();

		foreach (var target in sortedTargets)
		{
			var refs = _refsTo[target];
			var label = GetLabel(target) ?? "";

			sb.Append($"${target:x4}");
			if (!string.IsNullOrEmpty(label))
			{
				sb.Append($" ({label})");
			}
			sb.AppendLine(":");

			foreach (var refGroup in refs.GroupBy(r => r.Type))
			{
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
	public string ExportToJson()
	{
		var sb = new StringBuilder();
		sb.AppendLine("{");
		sb.AppendLine("  \"crossReferences\": [");

		var allRefs = _refsFrom.Values.SelectMany(l => l).ToList();
		for (int i = 0; i < allRefs.Count; i++)
		{
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
		for (int i = 0; i < labelList.Count; i++)
		{
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
	public void Clear()
	{
		_refsTo.Clear();
		_refsFrom.Clear();
		_labels.Clear();
		_comments.Clear();
	}
}
