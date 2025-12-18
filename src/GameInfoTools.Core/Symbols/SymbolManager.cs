namespace GameInfoTools.Core.Symbols;

// C# equivalent of:
// - tools/assembly/symbol_manager.py
// - tools/assembly/symbol_table.py
// - tools/debug/debug_symbols.py
// - tools/debug/mlb_editor.py
// - tools/debug/nl_editor.py

/// <summary>
/// Represents a debug symbol or label in a ROM
/// </summary>
public class Symbol {
	/// <summary>
	/// The name/identifier of the symbol
	/// </summary>
	public required string Name { get; set; }

	/// <summary>
	/// The address this symbol refers to
	/// </summary>
	public int Address { get; set; }

	/// <summary>
	/// Bank number (for banked ROMs)
	/// </summary>
	public int? Bank { get; set; }

	/// <summary>
	/// Type of symbol (Code, Data, Ram, etc.)
	/// </summary>
	public SymbolType Type { get; set; } = SymbolType.Unknown;

	/// <summary>
	/// Optional comment/description
	/// </summary>
	public string? Comment { get; set; }

	/// <summary>
	/// Size of the data this symbol represents (if known)
	/// </summary>
	public int? Size { get; set; }

	/// <summary>
	/// Source file that defined this symbol
	/// </summary>
	public string? SourceFile { get; set; }

	/// <summary>
	/// Get the full address including bank
	/// </summary>
	public int FullAddress => Bank.HasValue ? (Bank.Value << 16) | Address : Address;

	/// <summary>
	/// Format the address as a string
	/// </summary>
	public string FormattedAddress => Bank.HasValue
		? $"${Bank.Value:x2}:{Address:x4}"
		: $"${Address:x4}";

	public override string ToString() => $"{Name} = {FormattedAddress}";
}

/// <summary>
/// Type classification for symbols
/// </summary>
public enum SymbolType {
	Unknown,
	Code,
	Data,
	Ram,
	Rom,
	Subroutine,
	Label,
	Variable,
	Constant,
	Pointer,
	Table,
	String,
	Graphics,
	Audio
}

/// <summary>
/// Manages symbols/labels for ROM hacking projects
/// </summary>
public class SymbolManager {
	private readonly Dictionary<string, Symbol> _symbolsByName = new(StringComparer.OrdinalIgnoreCase);
	private readonly Dictionary<int, List<Symbol>> _symbolsByAddress = [];
	private readonly List<Symbol> _allSymbols = [];

	/// <summary>
	/// All symbols in the manager
	/// </summary>
	public IReadOnlyList<Symbol> Symbols => _allSymbols;

	/// <summary>
	/// Number of symbols
	/// </summary>
	public int Count => _allSymbols.Count;

	/// <summary>
	/// Add a symbol to the manager
	/// </summary>
	public void AddSymbol(Symbol symbol) {
		ArgumentNullException.ThrowIfNull(symbol);

		if (_symbolsByName.ContainsKey(symbol.Name)) {
			throw new ArgumentException($"Symbol '{symbol.Name}' already exists", nameof(symbol));
		}

		_symbolsByName[symbol.Name] = symbol;
		_allSymbols.Add(symbol);

		if (!_symbolsByAddress.TryGetValue(symbol.FullAddress, out var addressList)) {
			addressList = [];
			_symbolsByAddress[symbol.FullAddress] = addressList;
		}
		addressList.Add(symbol);
	}

	/// <summary>
	/// Add or update a symbol
	/// </summary>
	public void SetSymbol(Symbol symbol) {
		ArgumentNullException.ThrowIfNull(symbol);

		if (_symbolsByName.TryGetValue(symbol.Name, out var existing)) {
			RemoveSymbol(existing);
		}

		AddSymbol(symbol);
	}

	/// <summary>
	/// Remove a symbol
	/// </summary>
	public bool RemoveSymbol(Symbol symbol) {
		if (!_symbolsByName.Remove(symbol.Name)) {
			return false;
		}

		_allSymbols.Remove(symbol);

		if (_symbolsByAddress.TryGetValue(symbol.FullAddress, out var addressList)) {
			addressList.Remove(symbol);
			if (addressList.Count == 0) {
				_symbolsByAddress.Remove(symbol.FullAddress);
			}
		}

		return true;
	}

	/// <summary>
	/// Remove a symbol by name
	/// </summary>
	public bool RemoveSymbol(string name) {
		if (_symbolsByName.TryGetValue(name, out var symbol)) {
			return RemoveSymbol(symbol);
		}
		return false;
	}

	/// <summary>
	/// Get a symbol by name
	/// </summary>
	public Symbol? GetSymbol(string name) {
		return _symbolsByName.GetValueOrDefault(name);
	}

	/// <summary>
	/// Get symbols at a specific address
	/// </summary>
	public IReadOnlyList<Symbol> GetSymbolsAtAddress(int address) {
		return _symbolsByAddress.GetValueOrDefault(address) ?? [];
	}

	/// <summary>
	/// Get symbols at a specific bank:address
	/// </summary>
	public IReadOnlyList<Symbol> GetSymbolsAtAddress(int bank, int address) {
		var fullAddress = (bank << 16) | address;
		return GetSymbolsAtAddress(fullAddress);
	}

	/// <summary>
	/// Find symbols by name pattern (supports * wildcard)
	/// </summary>
	public IEnumerable<Symbol> FindSymbols(string pattern) {
		if (string.IsNullOrEmpty(pattern)) {
			return [];
		}

		if (pattern.Contains('*')) {
			var regex = new System.Text.RegularExpressions.Regex(
				"^" + System.Text.RegularExpressions.Regex.Escape(pattern).Replace("\\*", ".*") + "$",
				System.Text.RegularExpressions.RegexOptions.IgnoreCase);

			return _allSymbols.Where(s => regex.IsMatch(s.Name));
		}

		return _symbolsByName.TryGetValue(pattern, out var symbol) ? [symbol] : [];
	}

	/// <summary>
	/// Find symbols by type
	/// </summary>
	public IEnumerable<Symbol> FindByType(SymbolType type) {
		return _allSymbols.Where(s => s.Type == type);
	}

	/// <summary>
	/// Find symbols in address range
	/// </summary>
	public IEnumerable<Symbol> FindInRange(int startAddress, int endAddress) {
		return _allSymbols.Where(s => s.FullAddress >= startAddress && s.FullAddress <= endAddress)
			.OrderBy(s => s.FullAddress);
	}

	/// <summary>
	/// Clear all symbols
	/// </summary>
	public void Clear() {
		_symbolsByName.Clear();
		_symbolsByAddress.Clear();
		_allSymbols.Clear();
	}

	/// <summary>
	/// Load symbols from a Mesen label file (.mlb)
	/// </summary>
	public void LoadMesenLabels(string filePath) {
		var lines = File.ReadAllLines(filePath);

		foreach (var line in lines) {
			if (string.IsNullOrWhiteSpace(line) || line.StartsWith('#')) {
				continue;
			}

			// Mesen format: TYPE:ADDR:NAME
			// e.g., P:8000:Reset or R:0000:CurrentHP
			var parts = line.Split(':');
			if (parts.Length < 3) continue;

			var typeChar = parts[0];
			var addressStr = parts[1];
			var name = parts[2];
			var comment = parts.Length > 3 ? string.Join(":", parts.Skip(3)) : null;

			if (!int.TryParse(addressStr, System.Globalization.NumberStyles.HexNumber, null, out var address)) {
				continue;
			}

			var type = typeChar switch {
				"P" or "G" => SymbolType.Code,
				"R" => SymbolType.Ram,
				"W" => SymbolType.Ram,
				"S" => SymbolType.Subroutine,
				_ => SymbolType.Unknown
			};

			var symbol = new Symbol {
				Name = name,
				Address = address & 0xFFFF,
				Bank = address > 0xFFFF ? address >> 16 : null,
				Type = type,
				Comment = comment,
				SourceFile = filePath
			};

			SetSymbol(symbol);
		}
	}

	/// <summary>
	/// Load symbols from a generic label file (ADDR=NAME format)
	/// </summary>
	public void LoadGenericLabels(string filePath) {
		var lines = File.ReadAllLines(filePath);

		foreach (var line in lines) {
			if (string.IsNullOrWhiteSpace(line) || line.StartsWith('#') || line.StartsWith(';')) {
				continue;
			}

			// Format: ADDR=NAME or $ADDR=NAME or BANK:ADDR=NAME
			var equalsIndex = line.IndexOf('=');
			if (equalsIndex < 0) continue;

			var addressPart = line[..equalsIndex].Trim().TrimStart('$');
			var namePart = line[(equalsIndex + 1)..].Trim();

			// Check for comment
			string? comment = null;
			var commentIndex = namePart.IndexOf(';');
			if (commentIndex >= 0) {
				comment = namePart[(commentIndex + 1)..].Trim();
				namePart = namePart[..commentIndex].Trim();
			}

			int? bank = null;
			int address;

			// Check for bank:addr format
			var colonIndex = addressPart.IndexOf(':');
			if (colonIndex >= 0) {
				if (!int.TryParse(addressPart[..colonIndex], System.Globalization.NumberStyles.HexNumber, null, out var bankValue)) {
					continue;
				}
				bank = bankValue;
				addressPart = addressPart[(colonIndex + 1)..];
			}

			if (!int.TryParse(addressPart, System.Globalization.NumberStyles.HexNumber, null, out address)) {
				continue;
			}

			var symbol = new Symbol {
				Name = namePart,
				Address = address,
				Bank = bank,
				Type = SymbolType.Unknown,
				Comment = comment,
				SourceFile = filePath
			};

			SetSymbol(symbol);
		}
	}

	/// <summary>
	/// Save symbols to Mesen label file format
	/// </summary>
	public void SaveMesenLabels(string filePath) {
		using var writer = new StreamWriter(filePath);

		writer.WriteLine("# Mesen Label File");
		writer.WriteLine($"# Generated: {DateTime.Now:yyyy-MM-dd HH:mm:ss}");
		writer.WriteLine($"# Symbol Count: {Count}");
		writer.WriteLine();

		foreach (var symbol in _allSymbols.OrderBy(s => s.FullAddress)) {
			var typeChar = symbol.Type switch {
				SymbolType.Code or SymbolType.Subroutine => "P",
				SymbolType.Ram or SymbolType.Variable => "R",
				_ => "G"
			};

			var address = symbol.Bank.HasValue
				? $"{symbol.Bank.Value:X2}{symbol.Address:X4}"
				: $"{symbol.Address:X4}";

			var line = $"{typeChar}:{address}:{symbol.Name}";

			if (!string.IsNullOrEmpty(symbol.Comment)) {
				line += $":{symbol.Comment}";
			}

			writer.WriteLine(line);
		}
	}

	/// <summary>
	/// Save symbols to generic label file format
	/// </summary>
	public void SaveGenericLabels(string filePath) {
		using var writer = new StreamWriter(filePath);

		writer.WriteLine("; Symbol File");
		writer.WriteLine($"; Generated: {DateTime.Now:yyyy-MM-dd HH:mm:ss}");
		writer.WriteLine($"; Symbol Count: {Count}");
		writer.WriteLine();

		foreach (var symbol in _allSymbols.OrderBy(s => s.FullAddress)) {
			var address = symbol.Bank.HasValue
				? $"${symbol.Bank.Value:x2}:{symbol.Address:x4}"
				: $"${symbol.Address:x4}";

			var line = $"{address}={symbol.Name}";

			if (!string.IsNullOrEmpty(symbol.Comment)) {
				line += $" ; {symbol.Comment}";
			}

			writer.WriteLine(line);
		}
	}

	/// <summary>
	/// Export symbols to JSON
	/// </summary>
	public string ExportToJson() {
		return System.Text.Json.JsonSerializer.Serialize(_allSymbols, new System.Text.Json.JsonSerializerOptions {
			WriteIndented = true
		});
	}

	/// <summary>
	/// Import symbols from JSON
	/// </summary>
	public void ImportFromJson(string json) {
		var symbols = System.Text.Json.JsonSerializer.Deserialize<List<Symbol>>(json);
		if (symbols != null) {
			foreach (var symbol in symbols) {
				SetSymbol(symbol);
			}
		}
	}

	/// <summary>
	/// Merge symbols from another manager
	/// </summary>
	public void Merge(SymbolManager other, bool overwrite = false) {
		foreach (var symbol in other.Symbols) {
			if (overwrite || !_symbolsByName.ContainsKey(symbol.Name)) {
				SetSymbol(symbol);
			}
		}
	}

	/// <summary>
	/// Get statistics about the symbols
	/// </summary>
	public SymbolStatistics GetStatistics() {
		return new SymbolStatistics {
			TotalCount = Count,
			CodeCount = _allSymbols.Count(s => s.Type == SymbolType.Code),
			DataCount = _allSymbols.Count(s => s.Type == SymbolType.Data),
			RamCount = _allSymbols.Count(s => s.Type == SymbolType.Ram),
			SubroutineCount = _allSymbols.Count(s => s.Type == SymbolType.Subroutine),
			UnknownCount = _allSymbols.Count(s => s.Type == SymbolType.Unknown),
			BankCount = _allSymbols.Select(s => s.Bank ?? 0).Distinct().Count(),
			MinAddress = _allSymbols.Count > 0 ? _allSymbols.Min(s => s.FullAddress) : 0,
			MaxAddress = _allSymbols.Count > 0 ? _allSymbols.Max(s => s.FullAddress) : 0
		};
	}
}

/// <summary>
/// Statistics about symbols in a SymbolManager
/// </summary>
public record SymbolStatistics {
	public int TotalCount { get; init; }
	public int CodeCount { get; init; }
	public int DataCount { get; init; }
	public int RamCount { get; init; }
	public int SubroutineCount { get; init; }
	public int UnknownCount { get; init; }
	public int BankCount { get; init; }
	public int MinAddress { get; init; }
	public int MaxAddress { get; init; }
}
