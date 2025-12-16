using GameInfoTools.Core.Symbols;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for SymbolManager and related types.
/// </summary>
public class SymbolManagerTests {
	#region Symbol Tests

	[Fact]
	public void Symbol_Constructor_SetsProperties() {
		var symbol = new Symbol {
			Name = "TestLabel",
			Address = 0x8000,
			Type = SymbolType.Code,
			Bank = 0
		};

		Assert.Equal("TestLabel", symbol.Name);
		Assert.Equal(0x8000, symbol.Address);
		Assert.Equal(SymbolType.Code, symbol.Type);
		Assert.Equal(0, symbol.Bank);
	}

	[Fact]
	public void Symbol_DefaultValues_AreCorrect() {
		var symbol = new Symbol { Name = "Test", Address = 0x1000 };

		Assert.Equal(SymbolType.Unknown, symbol.Type);
		Assert.Null(symbol.Bank);
		Assert.Null(symbol.Size);
		Assert.Null(symbol.Comment);
	}

	[Theory]
	[InlineData(SymbolType.Code)]
	[InlineData(SymbolType.Data)]
	[InlineData(SymbolType.Pointer)]
	[InlineData(SymbolType.String)]
	[InlineData(SymbolType.Graphics)]
	public void Symbol_AllTypes_CanBeAssigned(SymbolType type) {
		var symbol = new Symbol { Name = "Test", Address = 0x1000, Type = type };
		Assert.Equal(type, symbol.Type);
	}

	[Fact]
	public void Symbol_FullAddress_WithBank_IncludesBank() {
		var symbol = new Symbol { Name = "Test", Address = 0x8000, Bank = 2 };

		Assert.Equal(0x028000, symbol.FullAddress);
	}

	[Fact]
	public void Symbol_FullAddress_WithoutBank_IsJustAddress() {
		var symbol = new Symbol { Name = "Test", Address = 0x8000 };

		Assert.Equal(0x8000, symbol.FullAddress);
	}

	[Fact]
	public void Symbol_FormattedAddress_WithBank_ShowsBankColon() {
		var symbol = new Symbol { Name = "Test", Address = 0x8000, Bank = 2 };

		Assert.Contains(":", symbol.FormattedAddress);
	}

	#endregion

	#region SymbolManager Basic Tests

	[Fact]
	public void SymbolManager_AddSymbol_IncreasesCount() {
		var manager = new SymbolManager();

		manager.AddSymbol(new Symbol { Name = "Label1", Address = 0x8000 });

		Assert.Equal(1, manager.Count);
	}

	[Fact]
	public void SymbolManager_AddMultiple_AllAdded() {
		var manager = new SymbolManager();

		manager.AddSymbol(new Symbol { Name = "Label1", Address = 0x8000 });
		manager.AddSymbol(new Symbol { Name = "Label2", Address = 0x8010 });
		manager.AddSymbol(new Symbol { Name = "Label3", Address = 0x8020 });

		Assert.Equal(3, manager.Count);
	}

	[Fact]
	public void SymbolManager_AddSymbol_DuplicateName_ThrowsException() {
		var manager = new SymbolManager();
		manager.AddSymbol(new Symbol { Name = "Label1", Address = 0x8000 });

		Assert.Throws<ArgumentException>(() =>
			manager.AddSymbol(new Symbol { Name = "Label1", Address = 0x9000 }));
	}

	[Fact]
	public void SymbolManager_GetSymbolsAtAddress_FindsSymbol() {
		var manager = new SymbolManager();
		manager.AddSymbol(new Symbol { Name = "TestLabel", Address = 0x8000 });

		var found = manager.GetSymbolsAtAddress(0x8000);

		Assert.Single(found);
		Assert.Equal("TestLabel", found[0].Name);
	}

	[Fact]
	public void SymbolManager_GetSymbolsAtAddress_ReturnsEmptyIfNotFound() {
		var manager = new SymbolManager();
		manager.AddSymbol(new Symbol { Name = "TestLabel", Address = 0x8000 });

		var found = manager.GetSymbolsAtAddress(0x9000);

		Assert.Empty(found);
	}

	[Fact]
	public void SymbolManager_GetSymbol_FindsSymbol() {
		var manager = new SymbolManager();
		manager.AddSymbol(new Symbol { Name = "MyLabel", Address = 0x8000 });

		var found = manager.GetSymbol("MyLabel");

		Assert.NotNull(found);
		Assert.Equal(0x8000, found!.Address);
	}

	[Fact]
	public void SymbolManager_GetSymbol_IsCaseInsensitive() {
		var manager = new SymbolManager();
		manager.AddSymbol(new Symbol { Name = "MyLabel", Address = 0x8000 });

		var found = manager.GetSymbol("mylabel");

		Assert.NotNull(found);
	}

	[Fact]
	public void SymbolManager_RemoveSymbol_DecreasesCount() {
		var manager = new SymbolManager();
		var symbol = new Symbol { Name = "Label1", Address = 0x8000 };
		manager.AddSymbol(symbol);

		manager.RemoveSymbol(symbol);

		Assert.Equal(0, manager.Count);
	}

	[Fact]
	public void SymbolManager_RemoveSymbol_ByName_Works() {
		var manager = new SymbolManager();
		manager.AddSymbol(new Symbol { Name = "Label1", Address = 0x8000 });

		var result = manager.RemoveSymbol("Label1");

		Assert.True(result);
		Assert.Equal(0, manager.Count);
	}

	[Fact]
	public void SymbolManager_Clear_RemovesAll() {
		var manager = new SymbolManager();
		manager.AddSymbol(new Symbol { Name = "Label1", Address = 0x8000 });
		manager.AddSymbol(new Symbol { Name = "Label2", Address = 0x8010 });

		manager.Clear();

		Assert.Equal(0, manager.Count);
	}

	#endregion

	#region SymbolManager Filter Tests

	[Fact]
	public void SymbolManager_FindByType_FiltersCorrectly() {
		var manager = new SymbolManager();
		manager.AddSymbol(new Symbol { Name = "Code1", Address = 0x8000, Type = SymbolType.Code });
		manager.AddSymbol(new Symbol { Name = "Data1", Address = 0x8010, Type = SymbolType.Data });
		manager.AddSymbol(new Symbol { Name = "Code2", Address = 0x8020, Type = SymbolType.Code });

		var codeSymbols = manager.FindByType(SymbolType.Code).ToList();

		Assert.Equal(2, codeSymbols.Count);
		Assert.All(codeSymbols, s => Assert.Equal(SymbolType.Code, s.Type));
	}

	[Fact]
	public void SymbolManager_FindInRange_FiltersCorrectly() {
		var manager = new SymbolManager();
		manager.AddSymbol(new Symbol { Name = "Before", Address = 0x7fff });
		manager.AddSymbol(new Symbol { Name = "InRange1", Address = 0x8000 });
		manager.AddSymbol(new Symbol { Name = "InRange2", Address = 0x8500 });
		manager.AddSymbol(new Symbol { Name = "After", Address = 0x9000 });

		var rangeSymbols = manager.FindInRange(0x8000, 0x8fff).ToList();

		Assert.Equal(2, rangeSymbols.Count);
	}

	[Fact]
	public void SymbolManager_FindSymbols_WithWildcard_Works() {
		var manager = new SymbolManager();
		manager.AddSymbol(new Symbol { Name = "Player_X", Address = 0x8000 });
		manager.AddSymbol(new Symbol { Name = "Player_Y", Address = 0x8001 });
		manager.AddSymbol(new Symbol { Name = "Enemy_X", Address = 0x8010 });

		var playerSymbols = manager.FindSymbols("Player_*").ToList();

		Assert.Equal(2, playerSymbols.Count);
	}

	#endregion

	#region SetSymbol Tests

	[Fact]
	public void SymbolManager_SetSymbol_AddsNewSymbol() {
		var manager = new SymbolManager();

		manager.SetSymbol(new Symbol { Name = "Label1", Address = 0x8000 });

		Assert.Equal(1, manager.Count);
	}

	[Fact]
	public void SymbolManager_SetSymbol_UpdatesExisting() {
		var manager = new SymbolManager();
		manager.AddSymbol(new Symbol { Name = "Label1", Address = 0x8000 });

		manager.SetSymbol(new Symbol { Name = "Label1", Address = 0x9000 });

		Assert.Equal(1, manager.Count);
		Assert.Equal(0x9000, manager.GetSymbol("Label1")!.Address);
	}

	#endregion

	#region Statistics Tests

	[Fact]
	public void SymbolManager_GetStatistics_ReturnsCorrectCounts() {
		var manager = new SymbolManager();
		manager.AddSymbol(new Symbol { Name = "Code1", Address = 0x8000, Type = SymbolType.Code });
		manager.AddSymbol(new Symbol { Name = "Code2", Address = 0x8010, Type = SymbolType.Code });
		manager.AddSymbol(new Symbol { Name = "Data1", Address = 0x8020, Type = SymbolType.Data });

		var stats = manager.GetStatistics();

		Assert.Equal(3, stats.TotalCount);
		Assert.Equal(2, stats.CodeCount);
		Assert.Equal(1, stats.DataCount);
	}

	#endregion

	#region JSON Export/Import Tests

	[Fact]
	public void SymbolManager_ExportToJson_ProducesValidJson() {
		var manager = new SymbolManager();
		manager.AddSymbol(new Symbol { Name = "Reset", Address = 0x8000, Type = SymbolType.Code });

		var json = manager.ExportToJson();

		Assert.Contains("Reset", json);
		Assert.Contains("8000", json);
	}

	[Fact]
	public void SymbolManager_ImportFromJson_LoadsSymbols() {
		var manager = new SymbolManager();
		manager.AddSymbol(new Symbol { Name = "Reset", Address = 0x8000 });

		var json = manager.ExportToJson();

		var newManager = new SymbolManager();
		newManager.ImportFromJson(json);

		Assert.Equal(1, newManager.Count);
		Assert.NotNull(newManager.GetSymbol("Reset"));
	}

	#endregion

	#region Merge Tests

	[Fact]
	public void SymbolManager_Merge_AddsNewSymbols() {
		var manager1 = new SymbolManager();
		manager1.AddSymbol(new Symbol { Name = "Label1", Address = 0x8000 });

		var manager2 = new SymbolManager();
		manager2.AddSymbol(new Symbol { Name = "Label2", Address = 0x9000 });

		manager1.Merge(manager2);

		Assert.Equal(2, manager1.Count);
	}

	[Fact]
	public void SymbolManager_Merge_WithOverwrite_UpdatesExisting() {
		var manager1 = new SymbolManager();
		manager1.AddSymbol(new Symbol { Name = "Label1", Address = 0x8000 });

		var manager2 = new SymbolManager();
		manager2.AddSymbol(new Symbol { Name = "Label1", Address = 0x9000 });

		manager1.Merge(manager2, overwrite: true);

		Assert.Equal(1, manager1.Count);
		Assert.Equal(0x9000, manager1.GetSymbol("Label1")!.Address);
	}

	#endregion
}
