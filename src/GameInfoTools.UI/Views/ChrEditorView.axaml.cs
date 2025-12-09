using Avalonia.Controls;
using GameInfoTools.UI.ViewModels;

namespace GameInfoTools.UI.Views;

public partial class ChrEditorView : UserControl {
	public ChrEditorView() {
		InitializeComponent();
	}

	private void PaletteComboBox_SelectionChanged(object? sender, SelectionChangedEventArgs e) {
		if (sender is ComboBox comboBox && comboBox.SelectedItem is PalettePreset preset) {
			if (DataContext is ChrEditorViewModel vm) {
				vm.SelectPaletteCommand.Execute(preset);
			}
		}
	}
}
