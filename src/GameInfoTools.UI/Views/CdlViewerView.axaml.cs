using Avalonia.Controls;
using Avalonia.Input;
using GameInfoTools.UI.Services;

namespace GameInfoTools.UI.Views;

public partial class CdlViewerView : UserControl {
	public CdlViewerView() {
		InitializeComponent();

		// Register keyboard shortcuts
		KeyDown += OnKeyDown;
		Focusable = true;
	}

	private void OnKeyDown(object? sender, KeyEventArgs e) {
		if (DataContext is IKeyboardShortcutHandler handler) {
			handler.HandleKeyDown(e);
		}
	}
}
