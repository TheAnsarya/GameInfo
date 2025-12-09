using System;
using System.Diagnostics.CodeAnalysis;
using Avalonia.Controls;
using Avalonia.Controls.Templates;
using GameInfoTools.UI.ViewModels;
using GameInfoTools.UI.Views;

namespace GameInfoTools.UI;

/// <summary>
/// Given a view model, returns the corresponding view if possible.
/// Maps ViewModels in the ViewModels namespace to Views in the Views namespace.
/// </summary>
[RequiresUnreferencedCode(
	"Default implementation of ViewLocator involves reflection which may be trimmed away.",
	Url = "https://docs.avaloniaui.net/docs/concepts/view-locator")]
public class ViewLocator : IDataTemplate {
	// Explicit mapping of ViewModels to Views for AOT compatibility
	private static readonly Dictionary<Type, Type> ViewModelToViewMap = new() {
		{ typeof(WelcomeViewModel), typeof(WelcomeView) },
		{ typeof(RomInfoViewModel), typeof(RomInfoView) },
		{ typeof(ChecksumViewModel), typeof(ChecksumView) },
		{ typeof(HexEditorViewModel), typeof(HexEditorView) },
		{ typeof(DisassemblerViewModel), typeof(DisassemblerView) },
		{ typeof(ChrEditorViewModel), typeof(ChrEditorView) },
		{ typeof(DataTableViewModel), typeof(DataTableView) },
		{ typeof(PointerScannerViewModel), typeof(PointerScannerView) },
		{ typeof(BankViewViewModel), typeof(BankViewView) },
		{ typeof(TextExtractorViewModel), typeof(TextExtractorView) },
		{ typeof(MapEditorViewModel), typeof(MapEditorView) },
		{ typeof(ScriptEditorViewModel), typeof(ScriptEditorView) },
	};

	public Control? Build(object? param) {
		if (param is null)
			return null;

		var vmType = param.GetType();

		// First try explicit mapping (AOT compatible)
		if (ViewModelToViewMap.TryGetValue(vmType, out var viewType)) {
			return (Control)Activator.CreateInstance(viewType)!;
		}

		// Fallback to reflection-based resolution
		var name = vmType.FullName!
			.Replace("ViewModels", "Views", StringComparison.Ordinal)
			.Replace("ViewModel", "View", StringComparison.Ordinal);
		var type = Type.GetType(name);

		if (type != null) {
			return (Control)Activator.CreateInstance(type)!;
		}

		return new TextBlock { Text = "Not Found: " + name };
	}

	public bool Match(object? data) {
		return data is ViewModelBase;
	}
}
