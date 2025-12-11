using Avalonia.Controls;
using Avalonia.Input;
using Avalonia.Interactivity;
using GameInfoTools.UI.Services;
using GameInfoTools.UI.ViewModels;

namespace GameInfoTools.UI.Views;

public partial class DisassemblerView : UserControl {
	public DisassemblerView() {
		InitializeComponent();
		KeyDown += OnKeyDown;
		Focusable = true;
	}

	private void OnKeyDown(object? sender, KeyEventArgs e) {
		if (DataContext is IKeyboardShortcutHandler handler) {
			handler.HandleKeyDown(e);
		}
	}

	/// <summary>
	/// Handle double-click on bookmark to navigate to that address.
	/// </summary>
	private void BookmarkList_DoubleTapped(object? sender, TappedEventArgs e) {
		if (DataContext is DisassemblerViewModel vm && sender is ListBox listBox) {
			if (listBox.SelectedItem is Bookmark bookmark) {
				vm.GoToBookmarkCommand.Execute(bookmark);
			}
		}
	}
}
