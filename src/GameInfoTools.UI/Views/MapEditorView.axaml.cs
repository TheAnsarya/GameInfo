using Avalonia.Controls;
using GameInfoTools.UI.Controls;
using GameInfoTools.UI.ViewModels;

namespace GameInfoTools.UI.Views;

public partial class MapEditorView : UserControl {
	public MapEditorView() {
		InitializeComponent();

		// Wire up map canvas drawing events
		if (MapCanvasControl is MapCanvas canvas) {
			canvas.DrawStarted += OnDrawStarted;
			canvas.DrawContinued += OnDrawContinued;
			canvas.DrawEnded += OnDrawEnded;
		}
	}

	private void OnDrawStarted(object? sender, MapTileClickedEventArgs e) {
		if (DataContext is MapEditorViewModel vm) {
			vm.StartDraw(e.X, e.Y);
		}
	}

	private void OnDrawContinued(object? sender, MapTileClickedEventArgs e) {
		if (DataContext is MapEditorViewModel vm) {
			vm.ContinueDraw(e.X, e.Y);
		}
	}

	private void OnDrawEnded(object? sender, MapTileClickedEventArgs e) {
		if (DataContext is MapEditorViewModel vm) {
			vm.EndDraw(e.X, e.Y);
		}
	}
}
