using Avalonia.Controls;
using GameInfoTools.UI.ViewModels;

namespace GameInfoTools.UI.Views;

/// <summary>
/// View for the Wiki Editor tool.
/// Provides a UI for creating and editing MediaWiki wikitext files.
/// </summary>
public partial class WikiEditorView : UserControl {
	public WikiEditorView() {
		InitializeComponent();
		DataContext = new WikiEditorViewModel();
	}
}
