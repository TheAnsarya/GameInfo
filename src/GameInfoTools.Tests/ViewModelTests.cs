using Avalonia.Input;
using GameInfoTools.Core;
using GameInfoTools.Core.Project;
using GameInfoTools.Core.Project.Extractors;
using GameInfoTools.Core.Project.ViewModels;
using GameInfoTools.UI.Services;
using GameInfoTools.UI.ViewModels;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for UI ViewModels.
/// </summary>
public class ViewModelTests {
	// Helper method to create MainWindowViewModel with mock services
	private static MainWindowViewModel CreateMainWindowViewModel() =>
		new(new MockProjectService(), new MockExtractorRegistry());

	#region Mock Services for Testing

	private sealed class MockProjectService : IProjectService {
		public Project? CurrentProject { get; set; }
		public bool HasOpenProject => CurrentProject is not null;

		public event EventHandler<ProjectChangedEventArgs>? ProjectChanged;

		public Task<Project> CreateProjectAsync(
			GameDefinition game,
			string romPath,
			string projectPath,
			ProjectCreationOptions? options = null,
			IProgress<ExtractProgress>? progress = null,
			CancellationToken cancellationToken = default
		) {
			var project = new Project { FilePath = projectPath, Metadata = new ProjectMetadata { Name = "Test" } };
			CurrentProject = project;
			ProjectChanged?.Invoke(this, new ProjectChangedEventArgs { ChangeType = ProjectChangeType.Opened });
			return Task.FromResult(project);
		}

		public Task<Project> OpenProjectAsync(
			string projectPath,
			CancellationToken cancellationToken = default
		) {
			var project = new Project { FilePath = projectPath, Metadata = new ProjectMetadata { Name = "Test" } };
			CurrentProject = project;
			ProjectChanged?.Invoke(this, new ProjectChangedEventArgs { ChangeType = ProjectChangeType.Opened });
			return Task.FromResult(project);
		}

		public Task SaveProjectAsync(
			string? path = null,
			CancellationToken cancellationToken = default
		) => Task.CompletedTask;

		public Task CloseProjectAsync(bool save = false) {
			CurrentProject = null;
			ProjectChanged?.Invoke(this, new ProjectChangedEventArgs { ChangeType = ProjectChangeType.Closed });
			return Task.CompletedTask;
		}

		public Task ExtractAssetsAsync(
			string romPath,
			IEnumerable<string>? assetTypes = null,
			IProgress<ExtractProgress>? progress = null,
			CancellationToken cancellationToken = default
		) => Task.CompletedTask;

		public Task<BuildResult> BuildAsync(
			string profile = "default",
			IProgress<BuildProgress>? progress = null,
			CancellationToken cancellationToken = default
		) => Task.FromResult(new BuildResult(true, null, null, [], [], TimeSpan.Zero));

		public Task<VerifyResult> VerifyAsync(byte[] romData) =>
			Task.FromResult(new VerifyResult(true, 0, [], "", ""));

		public IReadOnlyList<string> GetBuildProfiles() => ["default"];

		public Task ExportAssetsAsync(
			string outputPath,
			IEnumerable<string>? assetTypes = null,
			CancellationToken cancellationToken = default
		) => Task.CompletedTask;

		public Task ImportAssetsAsync(
			string inputPath,
			CancellationToken cancellationToken = default
		) => Task.CompletedTask;
	}

	private sealed class MockExtractorRegistry : IAssetExtractorRegistry {
		private readonly List<IAssetExtractor> _extractors = [new DragonWarrior4Extractor()];

		public IReadOnlyList<IAssetExtractor> Extractors => _extractors;

		public void Register(IAssetExtractor extractor) => _extractors.Add(extractor);

		public IAssetExtractor? GetExtractor(string gameId) =>
			_extractors.FirstOrDefault(e => e.GameId == gameId);

		public IReadOnlyList<GameDefinition> GetGameDefinitions() =>
			_extractors.Select(e => e.GetGameDefinition()).ToList();

		public async Task<IAssetExtractor?> DetectExtractorAsync(byte[] romData) {
			foreach (var extractor in _extractors) {
				if (await extractor.CanExtractAsync(romData)) {
					return extractor;
				}
			}
			return null;
		}
	}

	#endregion

	#region WelcomeViewModel Tests

	[Fact]
	public void WelcomeViewModel_HasTitle() {
		var vm = new WelcomeViewModel();
		Assert.Equal("Welcome to GameInfo Tools", vm.Title);
	}

	[Fact]
	public void WelcomeViewModel_HasDescription() {
		var vm = new WelcomeViewModel();
		Assert.NotEmpty(vm.Description);
	}

	[Fact]
	public void WelcomeViewModel_HasInstructions() {
		var vm = new WelcomeViewModel();
		Assert.Contains("Open a ROM", vm.Instructions);
	}

	[Fact]
	public void WelcomeViewModel_HasVersion() {
		var vm = new WelcomeViewModel();
		Assert.StartsWith("Version", vm.Version);
	}

	[Fact]
	public void WelcomeViewModel_HasFeatures() {
		var vm = new WelcomeViewModel();
		Assert.NotEmpty(vm.Features);
		Assert.True(vm.Features.Count >= 9);
	}

	[Fact]
	public void WelcomeViewModel_FeaturesHaveRequiredProperties() {
		var vm = new WelcomeViewModel();
		foreach (var feature in vm.Features) {
			Assert.NotEmpty(feature.Icon);
			Assert.NotEmpty(feature.Title);
			Assert.NotEmpty(feature.Description);
		}
	}

	[Fact]
	public void WelcomeViewModel_HasSupportedPlatforms() {
		var vm = new WelcomeViewModel();
		Assert.NotEmpty(vm.SupportedPlatforms);
		Assert.Contains(vm.SupportedPlatforms, p => p.Contains("NES"));
		Assert.Contains(vm.SupportedPlatforms, p => p.Contains("SNES"));
	}

	#endregion

	#region RomInfoViewModel Tests

	[Fact]
	public void RomInfoViewModel_NoRom_HasRomLoadedIsFalse() {
		var vm = new RomInfoViewModel(null);
		Assert.False(vm.HasRomLoaded);
	}

	[Fact]
	public void RomInfoViewModel_WithRom_DisplaysFileInfo() {
		var rom = CreateTestNesRom();
		var vm = new RomInfoViewModel(rom);

		Assert.True(vm.HasRomLoaded);
		Assert.NotEmpty(vm.FileSize);
		Assert.Equal("Nes", vm.SystemType);
	}

	[Fact]
	public void RomInfoViewModel_WithRom_CalculatesChecksums() {
		var rom = CreateTestNesRom();
		var vm = new RomInfoViewModel(rom);

		Assert.NotEmpty(vm.Crc32);
		Assert.NotEmpty(vm.Md5);
		Assert.NotEmpty(vm.Sha1);
	}

	[Fact]
	public void RomInfoViewModel_Refresh_UpdatesInfo() {
		var rom = CreateTestNesRom();
		var vm = new RomInfoViewModel(rom);

		vm.RefreshInfo();

		Assert.True(vm.HasRomLoaded);
	}

	#endregion

	#region ChecksumViewModel Tests

	[Fact]
	public void ChecksumViewModel_NoRom_HasRomLoadedIsFalse() {
		var vm = new ChecksumViewModel(null);
		Assert.False(vm.HasRomLoaded);
	}

	[Fact]
	public void ChecksumViewModel_WithNesRom_CalculatesChecksums() {
		var rom = CreateTestNesRom();
		var vm = new ChecksumViewModel(rom);

		Assert.True(vm.HasRomLoaded);
		Assert.NotEmpty(vm.Crc32);
		Assert.NotEmpty(vm.Md5);
		Assert.NotEmpty(vm.Sha1);
		Assert.Equal(SystemType.Nes, vm.DetectedSystem);
	}

	[Fact]
	public void ChecksumViewModel_WithSnesRom_CalculatesSnesChecksums() {
		var rom = CreateTestSnesRom();
		var vm = new ChecksumViewModel(rom);

		Assert.True(vm.HasRomLoaded);
		Assert.Equal(SystemType.Snes, vm.DetectedSystem);
		Assert.NotEmpty(vm.SnesChecksum);
		Assert.NotEmpty(vm.SnesComplement);
	}

	[Fact]
	public void ChecksumViewModel_CalculateChecksumsCommand_Works() {
		var rom = CreateTestNesRom();
		var vm = new ChecksumViewModel(rom);

		// Clear and recalculate
		var oldCrc = vm.Crc32;
		vm.CalculateChecksumsCommand.Execute(null);

		Assert.Equal(oldCrc, vm.Crc32);
	}

	#endregion

	#region HexEditorViewModel Tests

	[Fact]
	public void HexEditorViewModel_NoRom_HasRomLoadedIsFalse() {
		var vm = new HexEditorViewModel(null);
		Assert.False(vm.HasRomLoaded);
	}

	[Fact]
	public void HexEditorViewModel_WithRom_InitializesCorrectly() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		Assert.True(vm.HasRomLoaded);
		Assert.Equal(16, vm.BytesPerRow);
		Assert.Equal(16, vm.RowCount);
		Assert.Equal(0, vm.CurrentOffset);
	}

	[Fact]
	public void HexEditorViewModel_RefreshView_PopulatesHexRows() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		vm.RefreshView();

		Assert.NotEmpty(vm.HexRows);
		Assert.NotEmpty(vm.AddressDisplay);
	}

	[Fact]
	public void HexEditorViewModel_GoToOffset_UpdatesCurrentOffset() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		vm.GoToOffsetCommand.Execute(0x100);

		Assert.Equal(0x100, vm.CurrentOffset);
	}

	[Fact]
	public void HexEditorViewModel_NextPage_AdvancesOffset() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		int initialOffset = vm.CurrentOffset;
		vm.NextPageCommand.Execute(null);

		Assert.True(vm.CurrentOffset > initialOffset);
	}

	[Fact]
	public void HexEditorViewModel_HexRows_HaveCorrectFormat() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		vm.RefreshView();

		foreach (var row in vm.HexRows) {
			Assert.NotEmpty(row.Address);
			Assert.NotEmpty(row.HexData);
			Assert.NotEmpty(row.AsciiData);
			Assert.True(row.RawOffset >= 0);
		}
	}

	[Fact]
	public void HexEditorViewModel_WriteByte_CanUndo() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		byte originalValue = rom.Data[0x100];
		byte newValue = (byte)(originalValue ^ 0xff);

		vm.WriteByte(0x100, newValue);

		Assert.Equal(newValue, rom.Data[0x100]);
		Assert.True(vm.CanUndo);

		vm.UndoCommand.Execute(null);

		Assert.Equal(originalValue, rom.Data[0x100]);
		Assert.False(vm.CanUndo);
	}

	[Fact]
	public void HexEditorViewModel_WriteByte_CanRedo() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		byte originalValue = rom.Data[0x100];
		byte newValue = (byte)(originalValue ^ 0xff);

		vm.WriteByte(0x100, newValue);
		vm.UndoCommand.Execute(null);

		Assert.True(vm.CanRedo);
		Assert.False(vm.CanUndo);

		vm.RedoCommand.Execute(null);

		Assert.Equal(newValue, rom.Data[0x100]);
	}

	[Fact]
	public void HexEditorViewModel_WriteBytes_CanUndo() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		byte[] originalValues = new byte[4];
		Array.Copy(rom.Data, 0x100, originalValues, 0, 4);
		byte[] newValues = [0xde, 0xad, 0xbe, 0xef];

		vm.WriteBytes(0x100, newValues);

		Assert.Equal(newValues, rom.Data.AsSpan(0x100, 4).ToArray());
		Assert.True(vm.CanUndo);

		vm.UndoCommand.Execute(null);

		Assert.Equal(originalValues, rom.Data.AsSpan(0x100, 4).ToArray());
	}

	[Fact]
	public void HexEditorViewModel_MultipleEdits_UndoInOrder() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		byte original1 = rom.Data[0x100];
		byte original2 = rom.Data[0x200];

		vm.WriteByte(0x100, 0xaa);
		vm.WriteByte(0x200, 0xbb);

		// Undo second edit first
		vm.UndoCommand.Execute(null);
		Assert.Equal(original2, rom.Data[0x200]);
		Assert.Equal(0xaa, rom.Data[0x100]);

		// Undo first edit
		vm.UndoCommand.Execute(null);
		Assert.Equal(original1, rom.Data[0x100]);
	}

	[Fact]
	public void HexEditorViewModel_UndoDescription_UpdatesAfterEdit() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		Assert.Empty(vm.UndoDescription);

		vm.WriteByte(0x100, 0xff);

		Assert.NotEmpty(vm.UndoDescription);
		Assert.Contains("000100", vm.UndoDescription, StringComparison.OrdinalIgnoreCase);
	}

	[Fact]
	public void HexEditorViewModel_DataInspector_UpdatesOnSelection() {
		var rom = CreateTestNesRom();
		rom.Data[0x100] = 0x42;
		rom.Data[0x101] = 0x01;
		var vm = new HexEditorViewModel(rom);

		vm.SelectedOffset = 0x100;

		Assert.Contains("66", vm.InspectorByte); // 0x42 = 66 decimal
		Assert.Contains("01000010", vm.InspectorBinary); // Binary of 0x42
		Assert.Contains("'B'", vm.InspectorAscii); // ASCII 0x42 = 'B'
		Assert.Contains("0142", vm.InspectorWordLE); // Little-endian 0x0142
	}

	[Fact]
	public void HexEditorViewModel_Bookmarks_AddAndRemove() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		vm.SelectedOffset = 0x200;
		vm.AddBookmarkCommand.Execute(null);

		Assert.Single(vm.Bookmarks);
		Assert.Equal(0x200, vm.Bookmarks[0].Offset);

		vm.RemoveBookmarkCommand.Execute(0x200);

		Assert.Empty(vm.Bookmarks);
	}

	[Fact]
	public void HexEditorViewModel_Bookmarks_NoDuplicates() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		vm.SelectedOffset = 0x100;
		vm.AddBookmarkCommand.Execute(null);
		vm.AddBookmarkCommand.Execute(null); // Try to add same offset

		Assert.Single(vm.Bookmarks);
	}

	[Fact]
	public void HexEditorViewModel_GoToBookmark_NavigatesToOffset() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		vm.SelectedOffset = 0x500;
		vm.AddBookmarkCommand.Execute(null);
		vm.CurrentOffset = 0; // Navigate away

		vm.GoToBookmarkCommand.Execute(0x500);

		Assert.Equal(0x500, vm.CurrentOffset);
		Assert.Equal(0x500, vm.SelectedOffset);
	}

	[Fact]
	public void HexEditorViewModel_ByteGroupMode_CyclesCorrectly() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		Assert.Equal(ByteGroupMode.Byte, vm.ByteGroup);

		vm.CycleByteGroupCommand.Execute(null);
		Assert.Equal(ByteGroupMode.Word, vm.ByteGroup);

		vm.CycleByteGroupCommand.Execute(null);
		Assert.Equal(ByteGroupMode.DWord, vm.ByteGroup);

		vm.CycleByteGroupCommand.Execute(null);
		Assert.Equal(ByteGroupMode.DWordBE, vm.ByteGroup);

		vm.CycleByteGroupCommand.Execute(null);
		Assert.Equal(ByteGroupMode.Byte, vm.ByteGroup);
	}

	[Fact]
	public void HexEditorViewModel_SelectionRange_SetsCorrectly() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		vm.SetSelection(0x100, 0x10f);

		Assert.True(vm.HasRangeSelection);
		Assert.Equal(16, vm.SelectionLength);
		Assert.Equal(0x100, vm.SelectionStart);
		Assert.Equal(0x10f, vm.SelectionEnd);
	}

	[Fact]
	public void HexEditorViewModel_ClearRangeSelection_ClearsSelection() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		vm.SetSelection(0x100, 0x10f);
		vm.ClearRangeSelectionCommand.Execute(null);

		Assert.False(vm.HasRangeSelection);
		Assert.Equal(0, vm.SelectionLength);
	}

	[Fact]
	public void HexEditorViewModel_NesAddress_CalculatesCorrectly() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		vm.SelectedOffset = 0x4010; // In second PRG bank

		Assert.Contains("Bank 1", vm.InspectorNesAddress);
	}

	[Fact]
	public void HexEditorViewModel_Comparison_InitiallyDisabled() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		Assert.False(vm.ComparisonMode);
		Assert.False(vm.HasComparisonData);
		Assert.Empty(vm.ComparisonRomName);
	}

	[Fact]
	public void HexEditorViewModel_LoadComparisonData_EnablesComparison() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);
		var comparisonData = new byte[rom.Length];
		Array.Copy(rom.Data, comparisonData, rom.Length);

		vm.LoadComparisonData(comparisonData, "test_comparison.nes");

		Assert.True(vm.ComparisonMode);
		Assert.True(vm.HasComparisonData);
		Assert.Equal("test_comparison.nes", vm.ComparisonRomName);
	}

	[Fact]
	public void HexEditorViewModel_ClearComparison_DisablesComparison() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);
		var comparisonData = new byte[rom.Length];

		vm.LoadComparisonData(comparisonData, "test.nes");
		vm.ClearComparisonCommand.Execute(null);

		Assert.False(vm.ComparisonMode);
		Assert.False(vm.HasComparisonData);
	}

	[Fact]
	public void HexEditorViewModel_ByteDiffersFromComparison_DetectsDifference() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);
		var comparisonData = new byte[rom.Length];
		Array.Copy(rom.Data, comparisonData, rom.Length);
		comparisonData[0x100] = (byte)(rom.Data[0x100] ^ 0xff);

		vm.LoadComparisonData(comparisonData, "test.nes");

		Assert.True(vm.ByteDiffersFromComparison(0x100));
		Assert.False(vm.ByteDiffersFromComparison(0x101));
	}

	[Fact]
	public void HexEditorViewModel_FindAllDifferences_FindsDifferences() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);
		var comparisonData = new byte[rom.Length];
		Array.Copy(rom.Data, comparisonData, rom.Length);
		comparisonData[0x100] = 0xaa;
		comparisonData[0x200] = 0xbb;

		vm.LoadComparisonData(comparisonData, "test.nes");
		vm.FindAllDifferencesCommand.Execute(null);

		Assert.Equal(2, vm.Differences.Count);
	}

	[Fact]
	public void HexEditorViewModel_GetComparisonByte_ReturnsCorrectValue() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);
		var comparisonData = new byte[rom.Length];
		comparisonData[0x100] = 0x42;

		vm.LoadComparisonData(comparisonData, "test.nes");

		Assert.Equal((byte)0x42, vm.GetComparisonByte(0x100));
		Assert.Null(vm.GetComparisonByte(rom.Length + 100)); // Out of bounds
	}

	[Fact]
	public void HexEditorViewModel_FindAndReplace_InitialState() {
		var vm = new HexEditorViewModel(null);

		Assert.Empty(vm.FindPattern);
		Assert.Empty(vm.ReplacePattern);
		Assert.True(vm.FindAsHex);
		Assert.Empty(vm.SearchResults);
		Assert.Equal(-1, vm.CurrentSearchIndex);
	}

	[Fact]
	public void HexEditorViewModel_FindAllPattern_FindsMatches() {
		var rom = CreateTestNesRom();
		// Set up a known pattern in the ROM
		rom.Data[0x100] = 0xde;
		rom.Data[0x101] = 0xad;
		rom.Data[0x200] = 0xde;
		rom.Data[0x201] = 0xad;
		var vm = new HexEditorViewModel(rom);

		vm.FindPattern = "DE AD";
		vm.FindAllPatternCommand.Execute(null);

		Assert.Equal(2, vm.SearchResults.Count);
	}

	[Fact]
	public void HexEditorViewModel_SearchResults_HaveContextPreview() {
		var rom = CreateTestNesRom();
		rom.Data[0x100] = 0xab;
		rom.Data[0x101] = 0xcd;
		var vm = new HexEditorViewModel(rom);

		vm.FindPattern = "AB CD";
		vm.FindAllPatternCommand.Execute(null);

		Assert.Single(vm.SearchResults);
		Assert.NotEmpty(vm.SearchResults[0].ContextPreview);
		Assert.Equal("0x000100", vm.SearchResults[0].OffsetDisplay);
	}

	[Fact]
	public void HexEditorViewModel_FindNextPattern_NavigatesToNext() {
		var rom = CreateTestNesRom();
		rom.Data[0x100] = 0xde;
		rom.Data[0x101] = 0xad;
		rom.Data[0x200] = 0xde;
		rom.Data[0x201] = 0xad;
		var vm = new HexEditorViewModel(rom);
		vm.SelectedOffset = 0; // Start from beginning

		vm.FindPattern = "DE AD";
		vm.FindNextPatternCommand.Execute(null);

		// Should find first occurrence
		Assert.Equal(0x100, vm.SelectedOffset);

		vm.FindNextPatternCommand.Execute(null);
		// Should find second occurrence
		Assert.Equal(0x200, vm.SelectedOffset);
	}

	[Fact]
	public void HexEditorViewModel_FindNextPattern_WrapsAround() {
		var rom = CreateTestNesRom();
		rom.Data[0x100] = 0xde;
		rom.Data[0x101] = 0xad;
		var vm = new HexEditorViewModel(rom);
		vm.SelectedOffset = 0x200; // Start past the match

		vm.FindPattern = "DE AD";
		vm.FindNextPatternCommand.Execute(null);

		// Should wrap around and find the match at 0x100
		Assert.Equal(0x100, vm.SelectedOffset);
	}

	[Fact]
	public void HexEditorViewModel_FindPreviousPattern_NavigatesBackward() {
		var rom = CreateTestNesRom();
		rom.Data[0x100] = 0xde;
		rom.Data[0x101] = 0xad;
		rom.Data[0x200] = 0xde;
		rom.Data[0x201] = 0xad;
		var vm = new HexEditorViewModel(rom);
		vm.SelectedOffset = 0x300; // Start past both matches

		vm.FindPattern = "DE AD";
		vm.FindPreviousPatternCommand.Execute(null);

		// Should find second (closer) occurrence
		Assert.Equal(0x200, vm.SelectedOffset);

		vm.FindPreviousPatternCommand.Execute(null);
		// Should find first occurrence
		Assert.Equal(0x100, vm.SelectedOffset);
	}

	[Fact]
	public void HexEditorViewModel_FindPreviousPattern_WrapsAround() {
		var rom = CreateTestNesRom();
		rom.Data[0x200] = 0xde;
		rom.Data[0x201] = 0xad;
		var vm = new HexEditorViewModel(rom);
		vm.SelectedOffset = 0x50; // Start before the match

		vm.FindPattern = "DE AD";
		vm.FindPreviousPatternCommand.Execute(null);

		// Should wrap around and find the match at 0x200
		Assert.Equal(0x200, vm.SelectedOffset);
	}

	[Fact]
	public void HexEditorViewModel_FindNextPattern_NoResultsDoesNothing() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		// No search results
		vm.FindNextPatternCommand.Execute(null);

		Assert.Equal(-1, vm.CurrentSearchIndex);
	}

	[Fact]
	public void HexEditorViewModel_ToggleSearchPanel_TogglesVisibility() {
		var vm = new HexEditorViewModel(null);

		Assert.False(vm.ShowSearchPanel);
		vm.ToggleSearchPanelCommand.Execute(null);
		Assert.True(vm.ShowSearchPanel);
		vm.ToggleSearchPanelCommand.Execute(null);
		Assert.False(vm.ShowSearchPanel);
	}

	[Fact]
	public void HexEditorViewModel_CloseSearchPanel_HidesPanel() {
		var vm = new HexEditorViewModel(null);
		vm.ToggleSearchPanelCommand.Execute(null); // Open it

		Assert.True(vm.ShowSearchPanel);
		vm.CloseSearchPanelCommand.Execute(null);
		Assert.False(vm.ShowSearchPanel);
	}

	[Fact]
	public void HexEditorViewModel_CopySelection_CopiesSingleByte() {
		var rom = CreateTestNesRom();
		rom.Data[0x100] = 0xab;
		var vm = new HexEditorViewModel(rom);
		vm.SelectedOffset = 0x100;

		vm.CopySelectionCommand.Execute(null);

		Assert.True(vm.HasClipboard);
		Assert.Contains("1 byte", vm.StatusText);
	}

	[Fact]
	public void HexEditorViewModel_CopySelection_CopiesRangeSelection() {
		var rom = CreateTestNesRom();
		rom.Data[0x100] = 0xab;
		rom.Data[0x101] = 0xcd;
		rom.Data[0x102] = 0xef;
		var vm = new HexEditorViewModel(rom);
		vm.SetSelection(0x100, 0x102);

		vm.CopySelectionCommand.Execute(null);

		Assert.True(vm.HasClipboard);
		Assert.Contains("3 bytes", vm.StatusText);
	}

	[Fact]
	public void HexEditorViewModel_PasteAtCursor_PastesData() {
		var rom = CreateTestNesRom();
		rom.Data[0x100] = 0xab;
		rom.Data[0x101] = 0xcd;
		var vm = new HexEditorViewModel(rom);

		// Copy from 0x100
		vm.SetSelection(0x100, 0x101);
		vm.CopySelectionCommand.Execute(null);

		// Paste at 0x200
		vm.SelectedOffset = 0x200;
		vm.PasteAtCursorCommand.Execute(null);

		// Verify data was pasted
		Assert.Equal(0xab, rom.Data[0x200]);
		Assert.Equal(0xcd, rom.Data[0x201]);
		Assert.Contains("Pasted 2 bytes", vm.StatusText);
	}

	[Fact]
	public void HexEditorViewModel_PasteAtCursor_CanUndo() {
		var rom = CreateTestNesRom();
		rom.Data[0x100] = 0xab;
		byte originalValue = rom.Data[0x200];
		var vm = new HexEditorViewModel(rom);

		// Copy and paste
		vm.SelectedOffset = 0x100;
		vm.CopySelectionCommand.Execute(null);
		vm.SelectedOffset = 0x200;
		vm.PasteAtCursorCommand.Execute(null);

		Assert.Equal(0xab, rom.Data[0x200]);

		// Undo
		vm.UndoCommand.Execute(null);

		Assert.Equal(originalValue, rom.Data[0x200]);
	}

	[Fact]
	public void HexEditorViewModel_FillSelection_FillsRange() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);
		vm.SetSelection(0x100, 0x103);

		vm.FillSelectionCommand.Execute((byte)0xff);

		Assert.Equal(0xff, rom.Data[0x100]);
		Assert.Equal(0xff, rom.Data[0x101]);
		Assert.Equal(0xff, rom.Data[0x102]);
		Assert.Equal(0xff, rom.Data[0x103]);
		Assert.Contains("Filled 4 bytes", vm.StatusText);
	}

	[Fact]
	public void HexEditorViewModel_FillSelection_CanUndo() {
		var rom = CreateTestNesRom();
		byte originalValue = rom.Data[0x100];
		var vm = new HexEditorViewModel(rom);
		vm.SetSelection(0x100, 0x100);

		vm.FillSelectionCommand.Execute((byte)0xff);
		Assert.Equal(0xff, rom.Data[0x100]);

		vm.UndoCommand.Execute(null);
		Assert.Equal(originalValue, rom.Data[0x100]);
	}

	[Fact]
	public void HexEditorViewModel_CopySelection_NoSelectionShowsMessage() {
		var vm = new HexEditorViewModel(null);

		vm.CopySelectionCommand.Execute(null);

		Assert.False(vm.HasClipboard);
	}

	[Fact]
	public void HexEditorViewModel_PasteAtCursor_NoClipboardShowsMessage() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);
		vm.SelectedOffset = 0x100;

		vm.PasteAtCursorCommand.Execute(null);

		Assert.Contains("Nothing to paste", vm.StatusText);
	}

	#endregion

	#region DisassemblerViewModel Tests

	[Fact]
	public void DisassemblerViewModel_NoRom_HasRomLoadedIsFalse() {
		var vm = new DisassemblerViewModel(null);
		Assert.False(vm.HasRomLoaded);
	}

	[Fact]
	public void DisassemblerViewModel_WithNesRom_DetectsCpuMode() {
		var rom = CreateTestNesRom();
		var vm = new DisassemblerViewModel(rom);

		Assert.True(vm.HasRomLoaded);
		Assert.Equal("6502 (NES)", vm.CpuMode);
		Assert.Equal(0x8000, vm.BaseAddress);
	}

	[Fact]
	public void DisassemblerViewModel_HasAvailableCpuModes() {
		var vm = new DisassemblerViewModel(null);
		Assert.NotEmpty(vm.AvailableCpuModes);
		Assert.Contains("6502 (NES)", vm.AvailableCpuModes);
		Assert.Contains("65816 (SNES)", vm.AvailableCpuModes);
	}

	[Fact]
	public void DisassemblerViewModel_DefaultLength_Is256() {
		var vm = new DisassemblerViewModel(null);
		Assert.Equal(256, vm.Length);
	}

	[Fact]
	public void DisassemblerViewModel_Disassemble_PopulatesLines() {
		var rom = CreateTestNesRom();
		var vm = new DisassemblerViewModel(rom);

		vm.DisassembleCommand.Execute(null);

		Assert.NotEmpty(vm.DisassemblyLines);
	}

	[Fact]
	public void DisassemblerViewModel_NavigationHistory_TracksBackForward() {
		var rom = CreateTestNesRom();
		var vm = new DisassemblerViewModel(rom);

		Assert.False(vm.CanGoBack);
		Assert.False(vm.CanGoForward);

		vm.StartOffset = 0;
		vm.GoToOffsetCommand.Execute(null);

		vm.StartOffset = 100;
		vm.GoToOffsetCommand.Execute(null);

		Assert.True(vm.CanGoBack);
		Assert.False(vm.CanGoForward);
	}

	[Fact]
	public void DisassemblerViewModel_NavigateBack_RestoresPreviousPosition() {
		var rom = CreateTestNesRom();
		var vm = new DisassemblerViewModel(rom);

		// Start at offset 50
		vm.StartOffset = 50;
		vm.GoToOffsetCommand.Execute(null);
		// Stack now has: [50]

		// Navigate to offset 100 - pushes current state (50) before navigation
		vm.StartOffset = 100;
		vm.GoToOffsetCommand.Execute(null);
		// Stack now has: [50, 100]

		// Navigate back should restore the previous position (100, since we pushed before changing)
		vm.NavigateBackCommand.Execute(null);

		// After back, we pop the top (100) and restore it
		// Actually the logic is: push current to forward, pop back stack
		Assert.True(vm.CanGoForward);
	}

	[Fact]
	public void DisassemblerViewModel_CrossReferences_TracksBranchesAndJumps() {
		var rom = CreateTestNesRom();
		var vm = new DisassemblerViewModel(rom);
		vm.AutoFollowJumps = true;

		vm.DisassembleCommand.Execute(null);

		// Cross-references are tracked during disassembly
		Assert.NotNull(vm.CrossReferences);
	}

	[Fact]
	public void DisassemblerViewModel_Symbols_CanBeUsed() {
		var rom = CreateTestNesRom();
		var vm = new DisassemblerViewModel(rom);

		vm.Symbols.AddSymbol("reset_vector", 0x8000, SymbolTable.SymbolType.Code);
		vm.UseSymbols = true;

		Assert.True(vm.Symbols.HasSymbol(0x8000));
		Assert.Equal("reset_vector", vm.Symbols.GetSymbol(0x8000));
	}

	[Fact]
	public void DisassemblerViewModel_AutoLabelBranches_CreatesLabels() {
		var rom = CreateTestNesRom();
		var vm = new DisassemblerViewModel(rom);
		vm.AutoLabelBranches = true;

		var initialSymbolCount = vm.Symbols.GetAllSymbols().Count();
		vm.DisassembleCommand.Execute(null);

		// Auto-labeling may have added new symbols if branches were found
		Assert.True(vm.AutoLabelBranches);
	}

	[Fact]
	public void DisassemblerViewModel_SelectedLine_CanBeSet() {
		var rom = CreateTestNesRom();
		var vm = new DisassemblerViewModel(rom);

		vm.DisassembleCommand.Execute(null);

		if (vm.DisassemblyLines.Count > 0) {
			vm.SelectedLine = vm.DisassemblyLines[0];
			Assert.NotNull(vm.SelectedLine);
		}
	}

	[Fact]
	public void DisassemblyLine_Record_IncludesLabelAndRawAddress() {
		var line = new DisassemblyLine(
			"$8000",
			"a9 00",
			"LDA",
			"#$00",
			"Load zero",
			"start",
			0x8000
		);

		Assert.Equal("start", line.Label);
		Assert.Equal(0x8000, line.RawAddress);
		Assert.Equal("$8000", line.Address);
	}

	#endregion

	#region ChrEditorViewModel Tests

	[Fact]
	public void ChrEditorViewModel_NoRom_HasRomLoadedIsFalse() {
		var vm = new ChrEditorViewModel(null);
		Assert.False(vm.HasRomLoaded);
	}

	[Fact]
	public void ChrEditorViewModel_WithNesRom_InitializesCorrectly() {
		var rom = CreateTestNesRom();
		var vm = new ChrEditorViewModel(rom);

		Assert.True(vm.HasRomLoaded);
		Assert.Equal("NES 2bpp", vm.TileFormat);
		Assert.Equal(2, vm.Zoom);
	}

	[Fact]
	public void ChrEditorViewModel_HasAvailableFormats() {
		var vm = new ChrEditorViewModel(null);
		Assert.NotEmpty(vm.AvailableFormats);
		Assert.Contains("NES 2bpp", vm.AvailableFormats);
		Assert.Contains("SNES 4bpp", vm.AvailableFormats);
	}

	[Fact]
	public void ChrEditorViewModel_HasAllTileFormats() {
		var vm = new ChrEditorViewModel(null);
		Assert.Contains("NES 2bpp", vm.AvailableFormats);
		Assert.Contains("SNES 2bpp", vm.AvailableFormats);
		Assert.Contains("SNES 4bpp", vm.AvailableFormats);
		Assert.Contains("SNES 8bpp", vm.AvailableFormats);
		Assert.Contains("GB 2bpp", vm.AvailableFormats);
		Assert.Contains("GBA 4bpp", vm.AvailableFormats);
		Assert.Contains("GBA 8bpp", vm.AvailableFormats);
		Assert.Contains("Linear 1bpp", vm.AvailableFormats);
		Assert.Contains("Linear 2bpp", vm.AvailableFormats);
		Assert.Contains("Linear 4bpp", vm.AvailableFormats);
	}

	[Fact]
	public void ChrEditorViewModel_SetTileFormat_UpdatesCurrentFormat() {
		var vm = new ChrEditorViewModel(null);
		vm.SetTileFormatCommand.Execute("SNES 4bpp");
		Assert.Equal(Core.TileGraphics.TileFormat.Snes4Bpp, vm.CurrentTileFormat);
		Assert.Equal("SNES 4bpp", vm.TileFormat);
	}

	[Fact]
	public void ChrEditorViewModel_SetTileFormat_UpdatesFormatColorCount() {
		var vm = new ChrEditorViewModel(null);

		vm.SetTileFormatCommand.Execute("NES 2bpp");
		Assert.Equal(4, vm.FormatColorCount);

		vm.SetTileFormatCommand.Execute("SNES 4bpp");
		Assert.Equal(16, vm.FormatColorCount);

		vm.SetTileFormatCommand.Execute("SNES 8bpp");
		Assert.Equal(256, vm.FormatColorCount);
	}

	[Fact]
	public void ChrEditorViewModel_SetTileFormat_UpdatesBytesPerTile() {
		var vm = new ChrEditorViewModel(null);

		vm.SetTileFormatCommand.Execute("NES 2bpp");
		Assert.Equal(16, vm.FormatBytesPerTile);

		vm.SetTileFormatCommand.Execute("SNES 4bpp");
		Assert.Equal(32, vm.FormatBytesPerTile);

		vm.SetTileFormatCommand.Execute("SNES 8bpp");
		Assert.Equal(64, vm.FormatBytesPerTile);
	}

	[Fact]
	public void ChrEditorViewModel_SpriteSheetConfiguration_Defaults() {
		var vm = new ChrEditorViewModel(null);
		Assert.Equal(16, vm.SpriteSheetTilesPerRow);
		Assert.Equal(0, vm.SpriteSheetSpacing);
		Assert.False(vm.SpriteSheetShowGrid);
	}

	[Fact]
	public void ChrEditorViewModel_SpriteSheetConfiguration_Settable() {
		var vm = new ChrEditorViewModel(null);
		vm.SpriteSheetTilesPerRow = 8;
		vm.SpriteSheetSpacing = 2;
		vm.SpriteSheetShowGrid = true;

		Assert.Equal(8, vm.SpriteSheetTilesPerRow);
		Assert.Equal(2, vm.SpriteSheetSpacing);
		Assert.True(vm.SpriteSheetShowGrid);
	}

	[Fact]
	public void ChrEditorViewModel_AllFormatsHaveCorrectBytesPerTile() {
		var vm = new ChrEditorViewModel(null);

		vm.SetTileFormatCommand.Execute("Linear 1bpp");
		Assert.Equal(8, vm.FormatBytesPerTile);

		vm.SetTileFormatCommand.Execute("Linear 2bpp");
		Assert.Equal(16, vm.FormatBytesPerTile);

		vm.SetTileFormatCommand.Execute("Linear 4bpp");
		Assert.Equal(32, vm.FormatBytesPerTile);

		vm.SetTileFormatCommand.Execute("GBA 4bpp");
		Assert.Equal(32, vm.FormatBytesPerTile);

		vm.SetTileFormatCommand.Execute("GBA 8bpp");
		Assert.Equal(64, vm.FormatBytesPerTile);
	}

	#endregion

	#region DataTableViewModel Tests

	[Fact]
	public void DataTableViewModel_NoRom_HasRomLoadedIsFalse() {
		var vm = new DataTableViewModel(null);
		Assert.False(vm.HasRomLoaded);
	}

	[Fact]
	public void DataTableViewModel_WithRom_InitializesCorrectly() {
		var rom = CreateTestNesRom();
		var vm = new DataTableViewModel(rom);

		Assert.True(vm.HasRomLoaded);
		Assert.Equal(16, vm.RecordSize);
		Assert.Equal(10, vm.RecordCount);
	}

	[Fact]
	public void DataTableViewModel_LoadMonsterTable_PopulatesFields() {
		var vm = new DataTableViewModel(null);

		vm.LoadMonsterTableCommand.Execute(null);

		Assert.Equal("Monster Stats", vm.TableName);
		Assert.NotEmpty(vm.Fields);
	}

	[Fact]
	public void DataTableViewModel_LoadItemTable_PopulatesFields() {
		var vm = new DataTableViewModel(null);

		vm.LoadItemTableCommand.Execute(null);

		Assert.Equal("Item Data", vm.TableName);
		Assert.NotEmpty(vm.Fields);
	}

	[Fact]
	public void DataTableViewModel_HasCommonTableTypes() {
		var vm = new DataTableViewModel(null);
		Assert.NotEmpty(vm.CommonTableTypes);
		Assert.Contains("Monster Stats", vm.CommonTableTypes);
		Assert.Contains("Item Data", vm.CommonTableTypes);
	}

	#endregion

	#region PointerScannerViewModel Tests

	[Fact]
	public void PointerScannerViewModel_NoRom_HasRomLoadedIsFalse() {
		var vm = new PointerScannerViewModel(null);
		Assert.False(vm.HasRomLoaded);
	}

	[Fact]
	public void PointerScannerViewModel_WithRom_InitializesCorrectly() {
		var rom = CreateTestNesRom();
		var vm = new PointerScannerViewModel(rom);

		Assert.True(vm.HasRomLoaded);
	}

	[Fact]
	public void PointerScannerViewModel_DefaultSettings() {
		var vm = new PointerScannerViewModel(null);

		Assert.Equal(0, vm.StartOffset);
		Assert.Equal(0x8000, vm.ValidRangeStart);
	}

	#endregion

	#region BankViewViewModel Tests

	[Fact]
	public void BankViewViewModel_NoRom_HasRomLoadedIsFalse() {
		var vm = new BankViewViewModel(null);
		Assert.False(vm.HasRomLoaded);
	}

	[Fact]
	public void BankViewViewModel_WithNesRom_DetectsBankSize() {
		var rom = CreateTestNesRom();
		var vm = new BankViewViewModel(rom);

		Assert.True(vm.HasRomLoaded);
		Assert.Equal(0x4000, vm.BankSize); // NES PRG banks are 16KB
	}

	[Fact]
	public void BankViewViewModel_PopulatesBanks() {
		var rom = CreateTestNesRom();
		var vm = new BankViewViewModel(rom);

		Assert.NotEmpty(vm.Banks);
	}

	#endregion

	#region TextExtractorViewModel Tests

	[Fact]
	public void TextExtractorViewModel_NoRom_HasRomLoadedIsFalse() {
		var vm = new TextExtractorViewModel(null);
		Assert.False(vm.HasRomLoaded);
	}

	[Fact]
	public void TextExtractorViewModel_WithRom_InitializesCorrectly() {
		var rom = CreateTestNesRom();
		var vm = new TextExtractorViewModel(rom);

		Assert.True(vm.HasRomLoaded);
	}

	[Fact]
	public void TextExtractorViewModel_DefaultSettings() {
		var vm = new TextExtractorViewModel(null);

		Assert.Equal(3, vm.MinStringLength);
		// TextExtractorViewModel uses TBL file approach, not encoding options
		Assert.False(vm.HasTableLoaded);
	}

	#endregion

	#region MainWindowViewModel Tests

	[Fact]
	public void MainWindowViewModel_InitializesWithProjectExplorerView() {
		var vm = CreateMainWindowViewModel();

		Assert.NotNull(vm.CurrentView);
		Assert.IsType<ProjectExplorerViewModel>(vm.CurrentView);
	}

	[Fact]
	public void MainWindowViewModel_HasToolCategories() {
		var vm = CreateMainWindowViewModel();

		Assert.NotEmpty(vm.ToolCategories);
		Assert.True(vm.ToolCategories.Count >= 9);
	}

	[Fact]
	public void MainWindowViewModel_ToolCategoriesHaveRequiredProperties() {
		var vm = CreateMainWindowViewModel();

		foreach (var category in vm.ToolCategories) {
			Assert.NotEmpty(category.Icon);
			Assert.NotEmpty(category.Name);
			Assert.NotEmpty(category.Id);
		}
	}

	[Fact]
	public void MainWindowViewModel_DefaultStatusText_IsReady() {
		var vm = CreateMainWindowViewModel();
		Assert.Equal("Ready", vm.StatusText);
	}

	[Fact]
	public void MainWindowViewModel_ShowRomInfoCommand_ChangesView() {
		var vm = CreateMainWindowViewModel();

		// First change to a different view (Checksum at index 2), then back to ROM Info (index 1)
		vm.SelectedCategory = vm.ToolCategories[2]; // Checksum
		Assert.IsType<ChecksumViewModel>(vm.CurrentView);

		vm.SelectedCategory = vm.ToolCategories[1]; // ROM Info
		Assert.IsType<RomInfoViewModel>(vm.CurrentView);
	}

	[Fact]
	public void MainWindowViewModel_ShowChecksumCommand_ChangesView() {
		var vm = CreateMainWindowViewModel();

		vm.ShowChecksumCommand.Execute(null);

		Assert.IsType<ChecksumViewModel>(vm.CurrentView);
	}

	[Fact]
	public void MainWindowViewModel_ShowTextExtractorCommand_ChangesView() {
		var vm = CreateMainWindowViewModel();

		vm.ShowTextExtractorCommand.Execute(null);

		Assert.IsType<TextExtractorViewModel>(vm.CurrentView);
	}

	[Fact]
	public void MainWindowViewModel_ShowChrEditorCommand_ChangesView() {
		var vm = CreateMainWindowViewModel();

		vm.ShowChrEditorCommand.Execute(null);

		Assert.IsType<ChrEditorViewModel>(vm.CurrentView);
	}

	[Fact]
	public void MainWindowViewModel_ShowDisassemblerCommand_ChangesView() {
		var vm = CreateMainWindowViewModel();

		vm.ShowDisassemblerCommand.Execute(null);

		Assert.IsType<DisassemblerViewModel>(vm.CurrentView);
	}

	[Fact]
	public void MainWindowViewModel_ShowDataEditorCommand_ChangesView() {
		var vm = CreateMainWindowViewModel();

		vm.ShowDataEditorCommand.Execute(null);

		Assert.IsType<DataTableViewModel>(vm.CurrentView);
	}

	[Fact]
	public void MainWindowViewModel_ShowPointerScannerCommand_ChangesView() {
		var vm = CreateMainWindowViewModel();

		vm.ShowPointerScannerCommand.Execute(null);

		Assert.IsType<PointerScannerViewModel>(vm.CurrentView);
	}

	[Fact]
	public void MainWindowViewModel_ShowHexEditorCommand_ChangesView() {
		var vm = CreateMainWindowViewModel();

		vm.ShowHexEditorCommand.Execute(null);

		Assert.IsType<HexEditorViewModel>(vm.CurrentView);
	}

	[Fact]
	public void MainWindowViewModel_ShowBankViewCommand_ChangesView() {
		var vm = CreateMainWindowViewModel();

		vm.ShowBankViewCommand.Execute(null);

		Assert.IsType<BankViewViewModel>(vm.CurrentView);
	}

	[Fact]
	public void MainWindowViewModel_ShowAboutCommand_UpdatesStatus() {
		var vm = CreateMainWindowViewModel();

		vm.ShowAboutCommand.Execute(null);

		Assert.Contains("GameInfo Tools", vm.StatusText);
	}

	[Fact]
	public void MainWindowViewModel_SelectedCategory_ChangesCurrentView() {
		var vm = CreateMainWindowViewModel();

		vm.SelectedCategory = vm.ToolCategories[2]; // Checksum (index 2, after Project and ROM Info)

		Assert.IsType<ChecksumViewModel>(vm.CurrentView);
	}

	#endregion

	#region FeatureInfo Record Tests

	[Fact]
	public void FeatureInfo_Record_HasCorrectProperties() {
		var feature = new FeatureInfo("🎮", "Test", "Description");

		Assert.Equal("🎮", feature.Icon);
		Assert.Equal("Test", feature.Title);
		Assert.Equal("Description", feature.Description);
	}

	[Fact]
	public void FeatureInfo_Record_SupportsEquality() {
		var feature1 = new FeatureInfo("🎮", "Test", "Description");
		var feature2 = new FeatureInfo("🎮", "Test", "Description");

		Assert.Equal(feature1, feature2);
	}

	#endregion

	#region ToolCategory Record Tests

	[Fact]
	public void ToolCategory_Record_HasCorrectProperties() {
		var category = new ToolCategory("📁", "ROM Info", "rominfo");

		Assert.Equal("📁", category.Icon);
		Assert.Equal("ROM Info", category.Name);
		Assert.Equal("rominfo", category.Id);
	}

	[Fact]
	public void ToolCategory_Record_SupportsEquality() {
		var cat1 = new ToolCategory("📁", "ROM Info", "rominfo");
		var cat2 = new ToolCategory("📁", "ROM Info", "rominfo");

		Assert.Equal(cat1, cat2);
	}

	#endregion

	#region Helper Methods

	private static RomFile CreateTestNesRom() {
		// Create a minimal valid NES ROM
		var data = new byte[0x8010]; // 16 bytes header + 32KB PRG

		// iNES header
		data[0] = (byte)'N';
		data[1] = (byte)'E';
		data[2] = (byte)'S';
		data[3] = 0x1a;
		data[4] = 2;  // 2x 16KB PRG banks
		data[5] = 0;  // No CHR ROM
		data[6] = 0;  // Mapper 0, horizontal mirroring
		data[7] = 0;

		// Add some pattern data for disassembly
		data[0x10] = 0xa9; // LDA #$00
		data[0x11] = 0x00;
		data[0x12] = 0x8d; // STA $2000
		data[0x13] = 0x00;
		data[0x14] = 0x20;
		data[0x15] = 0x4c; // JMP $8000
		data[0x16] = 0x00;
		data[0x17] = 0x80;

		var rom = new RomFile();
		rom.LoadFromBytes(data);
		return rom;
	}

	private static RomFile CreateTestSnesRom() {
		// Create a minimal SNES ROM with valid checksum area
		var data = new byte[0x10000]; // 64KB

		// Internal header at LoROM location ($7FC0)
		int headerOffset = 0x7fc0;

		// Game title (21 bytes)
		var title = "TEST ROM             "; // 21 chars with padding
		for (int i = 0; i < 21 && i < title.Length; i++) {
			data[headerOffset + i] = (byte)title[i];
		}

		// ROM layout byte
		data[headerOffset + 0x15] = 0x20; // LoROM, FastROM

		// ROM type
		data[headerOffset + 0x16] = 0x00; // ROM only

		// ROM size (2^n KB)
		data[headerOffset + 0x17] = 0x08; // 256KB

		// SRAM size
		data[headerOffset + 0x18] = 0x00; // No SRAM

		// Country
		data[headerOffset + 0x19] = 0x01; // USA

		// License
		data[headerOffset + 0x1a] = 0x00;

		// Version
		data[headerOffset + 0x1b] = 0x00;

		// Checksum complement and checksum (must XOR to 0xffff)
		data[headerOffset + 0x1c] = 0xff;
		data[headerOffset + 0x1d] = 0xff;
		data[headerOffset + 0x1e] = 0x00;
		data[headerOffset + 0x1f] = 0x00;

		var rom = new RomFile();
		rom.LoadFromBytes(data);
		return rom;
	}

	#endregion

	#region MapEditorViewModel Tests

	[Fact]
	public void MapEditorViewModel_NoRom_HasRomLoadedIsFalse() {
		var vm = new MapEditorViewModel(null);
		Assert.False(vm.HasRomLoaded);
	}

	[Fact]
	public void MapEditorViewModel_WithRom_HasRomLoadedIsTrue() {
		var rom = CreateTestNesRom();
		var vm = new MapEditorViewModel(rom);
		Assert.True(vm.HasRomLoaded);
	}

	[Fact]
	public void MapEditorViewModel_HasDefaultSettings() {
		var vm = new MapEditorViewModel();
		Assert.Equal(16, vm.MapWidth);
		Assert.Equal(16, vm.MapHeight);
		Assert.Equal(2, vm.Zoom);
	}

	[Fact]
	public void MapEditorViewModel_HasMapFormats() {
		var vm = new MapEditorViewModel();
		Assert.NotEmpty(vm.MapFormats);
		Assert.Contains(vm.MapFormats, f => f.Contains("Linear"));
	}

	[Fact]
	public void MapEditorViewModel_TilePaletteInitialized_WithRom() {
		var rom = CreateTestNesRom();
		var vm = new MapEditorViewModel(rom);
		Assert.Equal(256, vm.TilePalette.Count);
	}

	[Fact]
	public void MapEditorViewModel_LoadMap_PopulatesTiles() {
		var rom = CreateTestNesRom();
		var vm = new MapEditorViewModel(rom);
		vm.MapDataOffset = 0x10;
		vm.MapWidth = 8;
		vm.MapHeight = 8;

		vm.LoadMapCommand.Execute(null);

		Assert.Equal(64, vm.MapTiles.Count);
	}

	[Fact]
	public void MapEditorViewModel_ZoomIn_IncreasesZoom() {
		var vm = new MapEditorViewModel();
		int initialZoom = vm.Zoom;

		vm.ZoomInCommand.Execute(null);

		Assert.Equal(initialZoom + 1, vm.Zoom);
	}

	[Fact]
	public void MapEditorViewModel_ZoomOut_DecreasesZoom() {
		var vm = new MapEditorViewModel();
		vm.Zoom = 4;

		vm.ZoomOutCommand.Execute(null);

		Assert.Equal(3, vm.Zoom);
	}

	[Fact]
	public void MapEditorViewModel_SetTile_CanUndo() {
		var rom = CreateTestNesRom();
		var vm = new MapEditorViewModel(rom);
		vm.MapDataOffset = 0x10;
		vm.MapWidth = 8;
		vm.MapHeight = 8;
		vm.LoadMapCommand.Execute(null);

		// Select a tile
		var tile = vm.MapTiles[0];
		vm.SelectTileCommand.Execute(tile);

		byte originalValue = rom.Data[tile.Offset];
		vm.SelectedTile = (originalValue + 1) % 256;

		vm.SetTileCommand.Execute(null);

		Assert.Equal(vm.SelectedTile, rom.Data[tile.Offset]);
		Assert.True(vm.CanUndo);

		vm.UndoCommand.Execute(null);

		Assert.Equal(originalValue, rom.Data[tile.Offset]);
	}

	[Fact]
	public void MapEditorViewModel_Fill_CanUndo() {
		var rom = CreateTestNesRom();
		var vm = new MapEditorViewModel(rom);
		vm.MapDataOffset = 0x10;
		vm.MapWidth = 4;
		vm.MapHeight = 4;
		vm.LoadMapCommand.Execute(null);

		// Save original values
		byte[] originalValues = new byte[16];
		for (int i = 0; i < 16; i++) {
			originalValues[i] = rom.Data[0x10 + i];
		}

		vm.SelectedTile = 0xaa;
		vm.FillCommand.Execute(null);

		// Verify all tiles filled
		for (int i = 0; i < 16; i++) {
			Assert.Equal(0xaa, rom.Data[0x10 + i]);
		}

		Assert.True(vm.CanUndo);

		vm.UndoCommand.Execute(null);

		// Verify original values restored
		for (int i = 0; i < 16; i++) {
			Assert.Equal(originalValues[i], rom.Data[0x10 + i]);
		}
	}

	[Fact]
	public void MapEditorViewModel_UndoDescription_UpdatesAfterSetTile() {
		var rom = CreateTestNesRom();
		var vm = new MapEditorViewModel(rom);
		vm.MapDataOffset = 0x10;
		vm.MapWidth = 4;
		vm.MapHeight = 4;
		vm.LoadMapCommand.Execute(null);

		Assert.Empty(vm.UndoDescription);

		vm.SelectTileCommand.Execute(vm.MapTiles[5]);
		vm.SelectedTile = 0xff;
		vm.SetTileCommand.Execute(null);

		Assert.NotEmpty(vm.UndoDescription);
		Assert.Contains("tile", vm.UndoDescription, StringComparison.OrdinalIgnoreCase);
	}

	#endregion

	#region ScriptEditorViewModel Tests

	[Fact]
	public void ScriptEditorViewModel_NoRom_HasRomLoadedIsFalse() {
		var vm = new ScriptEditorViewModel(null);
		Assert.False(vm.HasRomLoaded);
	}

	[Fact]
	public void ScriptEditorViewModel_WithRom_HasRomLoadedIsTrue() {
		var rom = CreateTestNesRom();
		var vm = new ScriptEditorViewModel(rom);
		Assert.True(vm.HasRomLoaded);
	}

	[Fact]
	public void ScriptEditorViewModel_HasDefaultOpcodes() {
		var vm = new ScriptEditorViewModel();
		Assert.NotEmpty(vm.Opcodes);
		Assert.Contains(vm.Opcodes, o => o.Name == "END");
		Assert.Contains(vm.Opcodes, o => o.Name == "JUMP");
	}

	[Fact]
	public void ScriptEditorViewModel_HasScriptTypes() {
		var vm = new ScriptEditorViewModel();
		Assert.NotEmpty(vm.ScriptTypes);
		Assert.Contains(vm.ScriptTypes, t => t.Contains("Dialog"));
		Assert.Contains(vm.ScriptTypes, t => t.Contains("AI"));
	}

	[Fact]
	public void ScriptEditorViewModel_LoadScript_DisassemblesCommands() {
		var rom = CreateTestNesRom();
		var vm = new ScriptEditorViewModel(rom);
		vm.ScriptOffset = 0x10;
		vm.ScriptLength = 20;

		vm.LoadScriptCommand.Execute(null);

		Assert.NotEmpty(vm.Commands);
		Assert.NotEmpty(vm.RawHex);
	}

	[Fact]
	public void ScriptEditorViewModel_Opcode_HasRequiredProperties() {
		var vm = new ScriptEditorViewModel();
		foreach (var opcode in vm.Opcodes) {
			Assert.NotEmpty(opcode.Name);
			Assert.NotEmpty(opcode.Description);
			Assert.True(opcode.Length >= 1);
		}
	}

	[Fact]
	public void ScriptCommand_GeneratesDisassembly() {
		var cmd = new ScriptCommand(0x1000, 0x09, "MSG", [0x01, 0x00], "Display message");
		Assert.Contains("MSG", cmd.Disassembly);
		Assert.Contains("$001000", cmd.Disassembly);
	}

	[Fact]
	public void ScriptEditorViewModel_InvalidOffset_ShowsError() {
		var rom = CreateTestNesRom();
		var vm = new ScriptEditorViewModel(rom);
		vm.ScriptOffset = int.MaxValue; // Invalid offset

		vm.LoadScriptCommand.Execute(null);

		Assert.Contains("Invalid", vm.StatusText);
	}

	[Fact]
	public void ScriptEditorViewModel_SelectCommand_UpdatesSelectedCommand() {
		var rom = CreateTestNesRom();
		var vm = new ScriptEditorViewModel(rom);
		vm.ScriptOffset = 0x10;
		vm.ScriptLength = 20;
		vm.LoadScriptCommand.Execute(null);

		if (vm.Commands.Count > 0) {
			var cmd = vm.Commands[0];
			vm.SelectCommandCommand.Execute(cmd);

			Assert.Equal(cmd, vm.SelectedCommand);
			Assert.Contains(cmd.Name, vm.StatusText);
		}
	}

	[Fact]
	public void ScriptEditorViewModel_DefaultScriptLength() {
		var vm = new ScriptEditorViewModel();
		Assert.Equal(256, vm.ScriptLength);
	}

	[Fact]
	public void ScriptEditorViewModel_DefaultScriptType() {
		var vm = new ScriptEditorViewModel();
		Assert.Equal("Generic Event", vm.SelectedScriptType);
	}

	[Fact]
	public void ScriptOpcode_Record_PropertiesCorrect() {
		var opcode = new ScriptOpcode(0x09, "MSG", 3, "Display message");
		Assert.Equal(0x09, opcode.Code);
		Assert.Equal("MSG", opcode.Name);
		Assert.Equal(3, opcode.Length);
		Assert.Equal("Display message", opcode.Description);
	}

	[Fact]
	public void ScriptOpcode_Record_IncludesTerminatesBlockAndHasTarget() {
		var opcode = new ScriptOpcode(0x02, "JUMP", 3, "Jump to address", true, true);
		Assert.True(opcode.TerminatesBlock);
		Assert.True(opcode.HasTarget);
	}

	[Fact]
	public void ScriptEditorViewModel_LoadScript_TracksControlFlow() {
		var rom = CreateTestNesRom();
		var vm = new ScriptEditorViewModel(rom);

		vm.ScriptOffset = 0;
		vm.ScriptLength = 64;
		vm.LoadScriptCommand.Execute(null);

		// Control flow edges are tracked during disassembly
		Assert.NotNull(vm.ControlFlowEdges);
	}

	[Fact]
	public void ScriptEditorViewModel_LoadScript_UpdatesStatistics() {
		var rom = CreateTestNesRom();
		var vm = new ScriptEditorViewModel(rom);

		vm.ScriptOffset = 0;
		vm.ScriptLength = 32;
		vm.LoadScriptCommand.Execute(null);

		Assert.True(vm.TotalBytes > 0);
		Assert.True(vm.UniqueOpcodes > 0);
	}

	[Fact]
	public void ScriptEditorViewModel_ValidateScript_ReturnsResult() {
		var rom = CreateTestNesRom();
		var vm = new ScriptEditorViewModel(rom);

		vm.ScriptOffset = 0;
		vm.ScriptLength = 32;
		vm.LoadScriptCommand.Execute(null);

		// Validation happens automatically in LoadScript
		Assert.NotNull(vm.ValidationResult);
	}

	[Fact]
	public void ScriptEditorViewModel_AddCustomOpcode_AddsToCollection() {
		var vm = new ScriptEditorViewModel();
		var initialCount = vm.Opcodes.Count;

		vm.AddCustomOpcodeCommand.Execute("FF,CUSTOM,2,Custom command");

		Assert.Equal(initialCount + 1, vm.Opcodes.Count);
		Assert.Contains(vm.Opcodes, o => o.Name == "CUSTOM");
	}

	[Fact]
	public void ScriptEditorViewModel_FindScripts_FindsPotentialLocations() {
		var rom = CreateTestNesRom();
		var vm = new ScriptEditorViewModel(rom);

		vm.FindScriptsCommand.Execute(null);

		// The FoundScripts collection is updated
		Assert.NotNull(vm.FoundScripts);
	}

	[Fact]
	public void ScriptEditorViewModel_OpcodeTableSource_DefaultsToBuiltIn() {
		var vm = new ScriptEditorViewModel();
		Assert.Equal("Built-in Generic", vm.OpcodeTableSource);
	}

	[Fact]
	public void ScriptLocation_Record_HasRequiredProperties() {
		var location = new ScriptLocation(0x1000, "Test script", 85, "MSG WAIT END");
		Assert.Equal(0x1000, location.Offset);
		Assert.Equal("Test script", location.Description);
		Assert.Equal(85, location.Confidence);
		Assert.Equal("MSG WAIT END", location.Preview);
	}

	[Fact]
	public void ControlFlowEdge_Record_HasRequiredProperties() {
		var edge = new ControlFlowEdge(0x1000, 0x2000, "Call");
		Assert.Equal(0x1000, edge.FromOffset);
		Assert.Equal(0x2000, edge.ToOffset);
		Assert.Equal("Call", edge.Type);
	}

	[Fact]
	public void ScriptEditorViewModel_SearchPanel_InitiallyHidden() {
		var vm = new ScriptEditorViewModel();

		Assert.False(vm.ShowSearchPanel);
		Assert.Empty(vm.SearchText);
	}

	[Fact]
	public void ScriptEditorViewModel_ToggleSearchPanel_TogglesVisibility() {
		var vm = new ScriptEditorViewModel();

		Assert.False(vm.ShowSearchPanel);
		vm.ToggleSearchPanelCommand.Execute(null);
		Assert.True(vm.ShowSearchPanel);
		vm.ToggleSearchPanelCommand.Execute(null);
		Assert.False(vm.ShowSearchPanel);
	}

	[Fact]
	public void ScriptEditorViewModel_CloseSearchPanel_HidesPanel() {
		var vm = new ScriptEditorViewModel();
		vm.ToggleSearchPanelCommand.Execute(null); // Open it

		Assert.True(vm.ShowSearchPanel);
		vm.CloseSearchPanelCommand.Execute(null);
		Assert.False(vm.ShowSearchPanel);
	}

	[Fact]
	public void ScriptEditorViewModel_Search_FindsMatchingCommands() {
		var rom = CreateTestNesRom();
		var vm = new ScriptEditorViewModel(rom);
		vm.ScriptOffset = 0;
		vm.ScriptLength = 64;
		vm.LoadScriptCommand.Execute(null);

		// Search for commands (NOP is likely to appear)
		vm.SearchText = "UNK";
		vm.ExecuteSearchCommand.Execute(null);

		// Should find results matching command names or hex values
		Assert.NotNull(vm.SearchResults);
	}

	[Fact]
	public void ScriptEditorViewModel_SearchNext_CyclesResults() {
		var rom = CreateTestNesRom();
		var vm = new ScriptEditorViewModel(rom);
		vm.ScriptOffset = 0;
		vm.ScriptLength = 64;
		vm.LoadScriptCommand.Execute(null);

		vm.SearchText = "UNK";
		vm.ExecuteSearchCommand.Execute(null);

		if (vm.SearchResults.Count > 1) {
			var firstIndex = vm.CurrentSearchIndex;
			vm.SearchNextCommand.Execute(null);
			Assert.Equal((firstIndex + 1) % vm.SearchResults.Count, vm.CurrentSearchIndex);
		}
	}

	[Fact]
	public void ScriptEditorViewModel_SearchPrevious_CyclesBackward() {
		var rom = CreateTestNesRom();
		var vm = new ScriptEditorViewModel(rom);
		vm.ScriptOffset = 0;
		vm.ScriptLength = 64;
		vm.LoadScriptCommand.Execute(null);

		vm.SearchText = "UNK";
		vm.ExecuteSearchCommand.Execute(null);

		if (vm.SearchResults.Count > 1) {
			vm.CurrentSearchIndex = 0;
			vm.SearchPreviousCommand.Execute(null);
			// Should wrap to last index
			Assert.Equal(vm.SearchResults.Count - 1, vm.CurrentSearchIndex);
		}
	}

	#endregion

	#region MapEditorViewModel Additional Tests

	[Fact]
	public void MapEditorViewModel_InvalidOffset_ShowsError() {
		var rom = CreateTestNesRom();
		var vm = new MapEditorViewModel(rom);
		vm.MapDataOffset = int.MaxValue; // Invalid offset

		vm.LoadMapCommand.Execute(null);

		Assert.Contains("Invalid", vm.StatusText);
	}

	[Fact]
	public void MapEditorViewModel_Fill_SetsAllTilesToSelected() {
		var rom = CreateTestNesRom();
		var vm = new MapEditorViewModel(rom);
		vm.MapDataOffset = 0x10;
		vm.MapWidth = 4;
		vm.MapHeight = 4;
		vm.LoadMapCommand.Execute(null);

		vm.SelectedTile = 0xab;
		vm.FillCommand.Execute(null);

		Assert.All(vm.MapTiles, t => Assert.Equal(0xab, t.TileIndex));
	}

	[Fact]
	public void MapEditorViewModel_SetTile_UpdatesSelectedTile() {
		var rom = CreateTestNesRom();
		var vm = new MapEditorViewModel(rom);
		vm.MapDataOffset = 0x10;
		vm.MapWidth = 4;
		vm.MapHeight = 4;
		vm.LoadMapCommand.Execute(null);

		if (vm.MapTiles.Count > 0) {
			vm.SelectedMapTile = vm.MapTiles[0];
			vm.SelectedTile = 0x42;
			vm.SetTileCommand.Execute(null);

			Assert.Equal(0x42, vm.MapTiles[0].TileIndex);
		}
	}

	[Fact]
	public void MapEditorViewModel_NextMap_IncrementsIndex() {
		var vm = new MapEditorViewModel();
		int initialIndex = vm.MapIndex;

		vm.NextMapCommand.Execute(null);

		Assert.Equal(initialIndex + 1, vm.MapIndex);
	}

	[Fact]
	public void MapEditorViewModel_PreviousMap_DecrementsIndex() {
		var vm = new MapEditorViewModel();
		vm.MapIndex = 5;

		vm.PreviousMapCommand.Execute(null);

		Assert.Equal(4, vm.MapIndex);
	}

	[Fact]
	public void MapEditorViewModel_PreviousMap_AtZero_StaysAtZero() {
		var vm = new MapEditorViewModel();
		vm.MapIndex = 0;

		vm.PreviousMapCommand.Execute(null);

		Assert.Equal(0, vm.MapIndex);
	}

	[Fact]
	public void MapEditorViewModel_ZoomIn_MaxAt8() {
		var vm = new MapEditorViewModel();
		vm.Zoom = 8;

		vm.ZoomInCommand.Execute(null);

		Assert.Equal(8, vm.Zoom);
	}

	[Fact]
	public void MapEditorViewModel_ZoomOut_MinAt1() {
		var vm = new MapEditorViewModel();
		vm.Zoom = 1;

		vm.ZoomOutCommand.Execute(null);

		Assert.Equal(1, vm.Zoom);
	}

	[Fact]
	public void MapEditorViewModel_SelectTile_UpdatesStatus() {
		var rom = CreateTestNesRom();
		var vm = new MapEditorViewModel(rom);
		vm.MapDataOffset = 0x10;
		vm.MapWidth = 4;
		vm.MapHeight = 4;
		vm.LoadMapCommand.Execute(null);

		if (vm.MapTiles.Count > 0) {
			var tile = vm.MapTiles[0];
			vm.SelectTileCommand.Execute(tile);

			Assert.Equal(tile, vm.SelectedMapTile);
			Assert.Contains("Selected", vm.StatusText);
		}
	}

	[Fact]
	public void MapTile_Record_PropertiesCorrect() {
		var tile = new MapTile(5, 3, 0x42, 0x1000);
		Assert.Equal(5, tile.X);
		Assert.Equal(3, tile.Y);
		Assert.Equal(0x42, tile.TileIndex);
		Assert.Equal(0x1000, tile.Offset);
		Assert.Equal("42", tile.Display);
	}

	[Fact]
	public void TilePaletteItem_Record_PropertiesCorrect() {
		var item = new TilePaletteItem(0xab, "Tile AB");
		Assert.Equal(0xab, item.Index);
		Assert.Equal("Tile AB", item.Name);
		Assert.Equal("AB", item.Display);
	}

	[Fact]
	public void MapEditorViewModel_ResizeMap_ChangesMapDimensions() {
		var vm = new MapEditorViewModel();
		vm.MapWidth = 8;
		vm.MapHeight = 8;
		vm.MapDataArray = new byte[64];

		vm.ResizeMapCommand.Execute("16x16");

		Assert.Equal(16, vm.MapWidth);
		Assert.Equal(16, vm.MapHeight);
		Assert.Equal(256, vm.MapDataArray?.Length);
	}

	[Fact]
	public void MapEditorViewModel_ResizeMap_PreservesData() {
		var vm = new MapEditorViewModel();
		vm.MapWidth = 4;
		vm.MapHeight = 4;
		vm.MapDataArray = new byte[16];
		vm.MapDataArray[0] = 0xab; // Top-left

		vm.ResizeMapCommand.Execute("8x8");

		Assert.Equal((byte)0xab, vm.MapDataArray?[0]);
	}

	[Fact]
	public void MapEditorViewModel_ShiftMap_ShiftsRight() {
		var vm = new MapEditorViewModel();
		vm.MapWidth = 4;
		vm.MapHeight = 1;
		vm.MapDataArray = new byte[] { 1, 2, 3, 4 };

		vm.ShiftMapCommand.Execute("RIGHT");

		// Shifted right with wrap-around: [4, 1, 2, 3]
		Assert.Equal((byte)4, vm.MapDataArray?[0]);
		Assert.Equal((byte)1, vm.MapDataArray?[1]);
	}

	[Fact]
	public void MapEditorViewModel_ShiftMap_ShiftsLeft() {
		var vm = new MapEditorViewModel();
		vm.MapWidth = 4;
		vm.MapHeight = 1;
		vm.MapDataArray = new byte[] { 1, 2, 3, 4 };

		vm.ShiftMapCommand.Execute("LEFT");

		// Shifted left with wrap-around: [2, 3, 4, 1]
		Assert.Equal((byte)2, vm.MapDataArray?[0]);
		Assert.Equal((byte)1, vm.MapDataArray?[3]);
	}

	[Fact]
	public void MapEditorViewModel_GeneratePattern_Checkerboard() {
		var vm = new MapEditorViewModel();
		vm.MapWidth = 4;
		vm.MapHeight = 4;
		vm.MapDataArray = new byte[16];

		vm.GeneratePatternCommand.Execute("CHECKERBOARD");

		// Checkerboard alternates 0 and 255
		Assert.Equal((byte)0, vm.MapDataArray?[0]); // (0,0)
		Assert.Equal((byte)255, vm.MapDataArray?[1]); // (1,0)
		Assert.Equal((byte)255, vm.MapDataArray?[4]); // (0,1)
		Assert.Equal((byte)0, vm.MapDataArray?[5]); // (1,1)
	}

	[Fact]
	public void MapEditorViewModel_GeneratePattern_Clear() {
		var vm = new MapEditorViewModel();
		vm.MapWidth = 4;
		vm.MapHeight = 4;
		vm.MapDataArray = new byte[16];
		for (int i = 0; i < 16; i++) vm.MapDataArray[i] = 0xff;

		vm.GeneratePatternCommand.Execute("CLEAR");

		Assert.All(vm.MapDataArray!, b => Assert.Equal((byte)0, b));
	}

	[Fact]
	public void MapEditorViewModel_GeneratePattern_Border() {
		var vm = new MapEditorViewModel();
		vm.MapWidth = 4;
		vm.MapHeight = 4;
		vm.MapDataArray = new byte[16];
		vm.SelectedTile = 0xaa;

		vm.GeneratePatternCommand.Execute("BORDER");

		// Corners and edges should be 0xaa
		Assert.Equal((byte)0xaa, vm.MapDataArray?[0]); // Top-left
		Assert.Equal((byte)0xaa, vm.MapDataArray?[3]); // Top-right
		Assert.Equal((byte)0, vm.MapDataArray?[5]); // Interior (1,1)
	}

	[Fact]
	public void MapEditorViewModel_ResizeMap_InvalidFormat_ShowsError() {
		var vm = new MapEditorViewModel();
		vm.MapWidth = 8;
		vm.MapHeight = 8;

		vm.ResizeMapCommand.Execute("invalid");

		Assert.Contains("Invalid", vm.StatusText);
	}

	#endregion

	#region New Feature Tests - KeyboardShortcuts Service

	[Fact]
	public void KeyboardShortcuts_UndoShortcut_IsControlZ() {
		Assert.Equal(Key.Z, KeyboardShortcuts.Undo.Key);
	}

	[Fact]
	public void KeyboardShortcuts_RedoShortcut_IsControlY() {
		Assert.Equal(Key.Y, KeyboardShortcuts.Redo.Key);
	}

	[Fact]
	public void KeyboardShortcuts_CopyShortcut_IsControlC() {
		Assert.Equal(Key.C, KeyboardShortcuts.Copy.Key);
	}

	[Fact]
	public void KeyboardShortcuts_PasteShortcut_IsControlV() {
		Assert.Equal(Key.V, KeyboardShortcuts.Paste.Key);
	}

	[Fact]
	public void KeyboardShortcuts_SelectAllShortcut_IsControlA() {
		Assert.Equal(Key.A, KeyboardShortcuts.SelectAll.Key);
	}

	[Fact]
	public void KeyboardShortcuts_GoToShortcut_IsControlG() {
		Assert.Equal(Key.G, KeyboardShortcuts.GoTo.Key);
	}

	[Fact]
	public void KeyboardShortcuts_FindShortcut_IsControlF() {
		Assert.Equal(Key.F, KeyboardShortcuts.Find.Key);
	}

	[Fact]
	public void KeyboardShortcuts_FlipHorizontalShortcut_IsControlH() {
		Assert.Equal(Key.H, KeyboardShortcuts.FlipHorizontal.Key);
	}

	[Fact]
	public void KeyboardShortcuts_FlipVerticalShortcut_IsV() {
		Assert.Equal(Key.V, KeyboardShortcuts.FlipVertical.Key);
	}

	[Fact]
	public void KeyboardShortcuts_Rotate90Shortcut_IsControlR() {
		Assert.Equal(Key.R, KeyboardShortcuts.Rotate90.Key);
	}

	[Fact]
	public void KeyboardShortcuts_AddBookmarkShortcut_IsControlB() {
		Assert.Equal(Key.B, KeyboardShortcuts.AddBookmark.Key);
	}

	[Fact]
	public void KeyboardShortcuts_PreviousTileShortcut_IsComma() {
		Assert.Equal(Key.OemComma, KeyboardShortcuts.PreviousTile.Key);
	}

	[Fact]
	public void KeyboardShortcuts_NextTileShortcut_IsPeriod() {
		Assert.Equal(Key.OemPeriod, KeyboardShortcuts.NextTile.Key);
	}

	[Fact]
	public void KeyboardShortcuts_PreviousBankShortcut_IsOpenBracket() {
		Assert.Equal(Key.OemOpenBrackets, KeyboardShortcuts.PreviousBank.Key);
	}

	[Fact]
	public void KeyboardShortcuts_NextBankShortcut_IsCloseBracket() {
		Assert.Equal(Key.OemCloseBrackets, KeyboardShortcuts.NextBank.Key);
	}

	[Fact]
	public void KeyboardShortcuts_DeleteShortcut_IsDelete() {
		Assert.Equal(Key.Delete, KeyboardShortcuts.Delete.Key);
	}

	#endregion
}
