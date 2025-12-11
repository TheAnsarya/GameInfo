using Avalonia.Controls;
using Avalonia.Input;
using GameInfoTools.UI.Services;
using GameInfoTools.UI.ViewModels;

namespace GameInfoTools.UI.Views;

public partial class ScriptEditorView : UserControl {
	public ScriptEditorView() {
		InitializeComponent();
		KeyDown += OnKeyDown;
		Focusable = true;
	}

	private void OnKeyDown(object? sender, KeyEventArgs e) {
		if (DataContext is IKeyboardShortcutHandler handler) {
			handler.HandleKeyDown(e);
		}
	}
}
