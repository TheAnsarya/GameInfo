using Avalonia.Controls;
using Avalonia.Input;
using GameInfoTools.UI.Controls;
using GameInfoTools.UI.ViewModels;

namespace GameInfoTools.UI.Views;

public partial class ChrEditorView : UserControl {
	public ChrEditorView() {
		InitializeComponent();

		// Register keyboard shortcuts
		KeyDown += OnKeyDown;
		Focusable = true;

		// Wire up pixel editor events after template is applied
		AttachedToVisualTree += (s, e) => {
			var pixelEditor = this.FindControl<EditableTileCanvas>("PixelEditor");
			if (pixelEditor is not null) {
				pixelEditor.PixelChanged += OnPixelChanged;
				pixelEditor.ColorPicked += OnColorPicked;
				pixelEditor.SelectionChanged += OnSelectionChanged;
			}

			var tileGrid = this.FindControl<TileGridCanvas>("TileGrid");
			if (tileGrid is not null) {
				tileGrid.MultiSelectChanged += OnMultiSelectChanged;
			}

			var paletteEditor = this.FindControl<PaletteEditor>("PaletteEditorControl");
			if (paletteEditor is not null) {
				paletteEditor.ColorEditRequested += OnColorEditRequested;
			}
		};
	}

	protected override void OnAttachedToVisualTree(Avalonia.VisualTreeAttachmentEventArgs e) {
		base.OnAttachedToVisualTree(e);
		Focus();
	}

	private void OnPixelChanged(object? sender, PixelChangedEventArgs e) {
		if (DataContext is ChrEditorViewModel vm) {
			vm.OnPixelChanged(e.X, e.Y, e.OldValue, e.NewValue);
		}
	}

	private void OnColorPicked(object? sender, ColorPickedEventArgs e) {
		if (DataContext is ChrEditorViewModel vm) {
			vm.OnColorPicked(e.ColorIndex);
		}
	}

	private void OnSelectionChanged(object? sender, PixelSelectionChangedEventArgs e) {
		if (DataContext is ChrEditorViewModel vm) {
			vm.SetPixelSelection(e.Selection);
		}
	}

	private void OnMultiSelectChanged(object? sender, MultiSelectChangedEventArgs e) {
		if (DataContext is ChrEditorViewModel vm) {
			vm.OnMultiSelectChanged(e.SelectedIndices);
		}
	}

	private void OnColorEditRequested(object? sender, ColorEditRequestedEventArgs e) {
		if (DataContext is ChrEditorViewModel vm) {
			vm.EditPaletteColorCommand.Execute(e.ColorIndex);
		}
	}

	private void OnKeyDown(object? sender, KeyEventArgs e) {
		if (DataContext is not ChrEditorViewModel vm) return;

		// Check for modifier keys
		bool ctrl = e.KeyModifiers.HasFlag(KeyModifiers.Control);
		bool shift = e.KeyModifiers.HasFlag(KeyModifiers.Shift);

		if (ctrl) {
			switch (e.Key) {
				case Key.C:
					// Ctrl+C: Copy
					vm.CopyTileCommand.Execute(null);
					e.Handled = true;
					break;

				case Key.V:
					// Ctrl+V: Paste
					if (vm.HasClipboard) {
						vm.PasteTileCommand.Execute(null);
					}
					e.Handled = true;
					break;

				case Key.Z:
					if (shift) {
						// Ctrl+Shift+Z: Redo
						if (vm.CanRedo) {
							vm.RedoCommand.Execute(null);
						}
					} else {
						// Ctrl+Z: Undo
						if (vm.CanUndo) {
							vm.UndoCommand.Execute(null);
						}
					}
					e.Handled = true;
					break;

				case Key.Y:
					// Ctrl+Y: Redo
					if (vm.CanRedo) {
						vm.RedoCommand.Execute(null);
					}
					e.Handled = true;
					break;

				case Key.X:
					// Ctrl+X: Cut (copy and clear)
					vm.CopyTileCommand.Execute(null);
					vm.ClearTileCommand.Execute(null);
					e.Handled = true;
					break;

				case Key.A:
					// Ctrl+A: Select all (not applicable, but prevent default)
					e.Handled = true;
					break;
			}
		} else {
			// Non-modifier keys
			switch (e.Key) {
				case Key.Delete:
					// Delete: Clear tile
					vm.ClearTileCommand.Execute(null);
					e.Handled = true;
					break;

				case Key.H:
					// H: Flip horizontal
					vm.ApplyFlipHorizontalCommand.Execute(null);
					e.Handled = true;
					break;

				case Key.V:
					// V: Flip vertical
					vm.ApplyFlipVerticalCommand.Execute(null);
					e.Handled = true;
					break;

				case Key.R:
					// R: Rotate 90°
					vm.ApplyRotate90Command.Execute(null);
					e.Handled = true;
					break;

				case Key.G:
					// G: Toggle grid
					vm.ShowGrid = !vm.ShowGrid;
					e.Handled = true;
					break;

				case Key.OemPlus:
				case Key.Add:
					// +: Zoom in
					vm.ZoomInCommand.Execute(null);
					e.Handled = true;
					break;

				case Key.OemMinus:
				case Key.Subtract:
					// -: Zoom out
					vm.ZoomOutCommand.Execute(null);
					e.Handled = true;
					break;

				case Key.PageUp:
					// Page Up: Previous bank
					vm.PreviousBankCommand.Execute(null);
					e.Handled = true;
					break;

				case Key.PageDown:
					// Page Down: Next bank
					vm.NextBankCommand.Execute(null);
					e.Handled = true;
					break;

				case Key.D1:
				case Key.NumPad1:
					vm.SelectedColorIndex = 0;
					e.Handled = true;
					break;

				case Key.D2:
				case Key.NumPad2:
					vm.SelectedColorIndex = 1;
					e.Handled = true;
					break;

				case Key.D3:
				case Key.NumPad3:
					vm.SelectedColorIndex = 2;
					e.Handled = true;
					break;

				case Key.D4:
				case Key.NumPad4:
					vm.SelectedColorIndex = 3;
					e.Handled = true;
					break;
			}
		}
	}

	private void PaletteComboBox_SelectionChanged(object? sender, SelectionChangedEventArgs e) {
		if (sender is ComboBox comboBox && comboBox.SelectedItem is PalettePreset preset) {
			if (DataContext is ChrEditorViewModel vm) {
				vm.SelectPaletteCommand.Execute(preset);
			}
		}
	}
}
