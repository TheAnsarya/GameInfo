using System;
using System.ComponentModel;
using System.Diagnostics.CodeAnalysis;
using Avalonia.Controls;
using Avalonia.Controls.Templates;
using GameInfoTools.Core.Project.ViewModels;
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
		{ typeof(CdlViewerViewModel), typeof(CdlViewerView) },
		{ typeof(TasConverterViewModel), typeof(TasConverterView) },
		{ typeof(ProjectExplorerViewModel), typeof(ProjectExplorerView) },
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
		// Match both ViewModelBase (UI project) and INotifyPropertyChanged (Core project ViewModels)
		return data is ViewModelBase or INotifyPropertyChanged;
	}
}
