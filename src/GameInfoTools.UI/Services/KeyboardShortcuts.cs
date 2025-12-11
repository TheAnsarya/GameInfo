using Avalonia.Input;

namespace GameInfoTools.UI.Services;

/// <summary>
/// Keyboard shortcut definitions for the application.
/// </summary>
public static class KeyboardShortcuts {
	// === Common shortcuts ===

	/// <summary>Undo (Ctrl+Z)</summary>
	public static readonly KeyGesture Undo = new(Key.Z, KeyModifiers.Control);

	/// <summary>Redo (Ctrl+Y)</summary>
	public static readonly KeyGesture Redo = new(Key.Y, KeyModifiers.Control);

	/// <summary>Redo alternate (Ctrl+Shift+Z)</summary>
	public static readonly KeyGesture RedoAlt = new(Key.Z, KeyModifiers.Control | KeyModifiers.Shift);

	/// <summary>Save (Ctrl+S)</summary>
	public static readonly KeyGesture Save = new(Key.S, KeyModifiers.Control);

	/// <summary>Save As (Ctrl+Shift+S)</summary>
	public static readonly KeyGesture SaveAs = new(Key.S, KeyModifiers.Control | KeyModifiers.Shift);

	/// <summary>Open (Ctrl+O)</summary>
	public static readonly KeyGesture Open = new(Key.O, KeyModifiers.Control);

	/// <summary>Copy (Ctrl+C)</summary>
	public static readonly KeyGesture Copy = new(Key.C, KeyModifiers.Control);

	/// <summary>Paste (Ctrl+V)</summary>
	public static readonly KeyGesture Paste = new(Key.V, KeyModifiers.Control);

	/// <summary>Cut (Ctrl+X)</summary>
	public static readonly KeyGesture Cut = new(Key.X, KeyModifiers.Control);

	/// <summary>Select All (Ctrl+A)</summary>
	public static readonly KeyGesture SelectAll = new(Key.A, KeyModifiers.Control);

	/// <summary>Delete (Delete)</summary>
	public static readonly KeyGesture Delete = new(Key.Delete);

	/// <summary>Find (Ctrl+F)</summary>
	public static readonly KeyGesture Find = new(Key.F, KeyModifiers.Control);

	/// <summary>Find Next (F3)</summary>
	public static readonly KeyGesture FindNext = new(Key.F3);

	/// <summary>Find Previous (Shift+F3)</summary>
	public static readonly KeyGesture FindPrevious = new(Key.F3, KeyModifiers.Shift);

	/// <summary>Replace (Ctrl+H)</summary>
	public static readonly KeyGesture Replace = new(Key.H, KeyModifiers.Control);

	/// <summary>Go To (Ctrl+G)</summary>
	public static readonly KeyGesture GoTo = new(Key.G, KeyModifiers.Control);

	// === Navigation shortcuts ===

	/// <summary>Navigate Back (Alt+Left)</summary>
	public static readonly KeyGesture NavigateBack = new(Key.Left, KeyModifiers.Alt);

	/// <summary>Navigate Forward (Alt+Right)</summary>
	public static readonly KeyGesture NavigateForward = new(Key.Right, KeyModifiers.Alt);

	/// <summary>Go to Definition (F12)</summary>
	public static readonly KeyGesture GoToDefinition = new(Key.F12);

	/// <summary>Find References (Shift+F12)</summary>
	public static readonly KeyGesture FindReferences = new(Key.F12, KeyModifiers.Shift);

	// === Hex Editor shortcuts ===

	/// <summary>Go to Offset (Ctrl+G)</summary>
	public static readonly KeyGesture GoToOffset = GoTo;

	/// <summary>Fill Selection (Ctrl+F)</summary>
	public static readonly KeyGesture FillSelection = new(Key.L, KeyModifiers.Control);

	/// <summary>Toggle Compare Mode (Ctrl+D)</summary>
	public static readonly KeyGesture ToggleCompare = new(Key.D, KeyModifiers.Control);

	// === Disassembler shortcuts ===

	/// <summary>Follow Address (Enter)</summary>
	public static readonly KeyGesture FollowAddress = new(Key.Enter);

	/// <summary>Add Label (Ctrl+L)</summary>
	public static readonly KeyGesture AddLabel = new(Key.L, KeyModifiers.Control);

	/// <summary>Add Bookmark (Ctrl+B)</summary>
	public static readonly KeyGesture AddBookmark = new(Key.B, KeyModifiers.Control);

	/// <summary>Toggle Symbols Panel (Ctrl+Shift+S)</summary>
	public static readonly KeyGesture ToggleSymbols = new(Key.S, KeyModifiers.Control | KeyModifiers.Alt);

	/// <summary>Toggle Cross-References Panel (Ctrl+Shift+X)</summary>
	public static readonly KeyGesture ToggleCrossReferences = new(Key.X, KeyModifiers.Control | KeyModifiers.Alt);

	/// <summary>Disassemble (F5)</summary>
	public static readonly KeyGesture Disassemble = new(Key.F5);

	// === CHR Editor shortcuts ===

	/// <summary>Flip Horizontal (H)</summary>
	public static readonly KeyGesture FlipHorizontal = new(Key.H);

	/// <summary>Flip Vertical (V)</summary>
	public static readonly KeyGesture FlipVertical = new(Key.V);

	/// <summary>Rotate 90° (R)</summary>
	public static readonly KeyGesture Rotate90 = new(Key.R);

	/// <summary>Toggle Multi-Select (M)</summary>
	public static readonly KeyGesture ToggleMultiSelect = new(Key.M);

	/// <summary>Previous Tile (,)</summary>
	public static readonly KeyGesture PreviousTile = new(Key.OemComma);

	/// <summary>Next Tile (.)</summary>
	public static readonly KeyGesture NextTile = new(Key.OemPeriod);

	/// <summary>Previous Bank ([)</summary>
	public static readonly KeyGesture PreviousBank = new(Key.OemOpenBrackets);

	/// <summary>Next Bank (])</summary>
	public static readonly KeyGesture NextBank = new(Key.OemCloseBrackets);

	// === Map Editor shortcuts ===

	/// <summary>Pencil Tool (P)</summary>
	public static readonly KeyGesture PencilTool = new(Key.P);

	/// <summary>Fill Tool (F)</summary>
	public static readonly KeyGesture FillTool = new(Key.F);

	/// <summary>Rectangle Tool (R)</summary>
	public static readonly KeyGesture RectangleTool = new(Key.R);

	/// <summary>Line Tool (L)</summary>
	public static readonly KeyGesture LineTool = new(Key.L);

	/// <summary>Selection Tool (S)</summary>
	public static readonly KeyGesture SelectionTool = new(Key.S);

	/// <summary>Eyedropper Tool (E)</summary>
	public static readonly KeyGesture EyedropperTool = new(Key.E);

	/// <summary>Toggle Grid (G)</summary>
	public static readonly KeyGesture ToggleGrid = new(Key.G);

	/// <summary>Zoom In (Ctrl+=)</summary>
	public static readonly KeyGesture ZoomIn = new(Key.OemPlus, KeyModifiers.Control);

	/// <summary>Zoom Out (Ctrl+-)</summary>
	public static readonly KeyGesture ZoomOut = new(Key.OemMinus, KeyModifiers.Control);

	/// <summary>Reset Zoom (Ctrl+0)</summary>
	public static readonly KeyGesture ResetZoom = new(Key.D0, KeyModifiers.Control);

	// === Script Editor shortcuts ===

	/// <summary>Build Control Flow Graph (Ctrl+Shift+G)</summary>
	public static readonly KeyGesture BuildCFG = new(Key.G, KeyModifiers.Control | KeyModifiers.Shift);

	/// <summary>Validate Script (F5)</summary>
	public static readonly KeyGesture ValidateScript = new(Key.F5);

	/// <summary>Load Script (Ctrl+Enter)</summary>
	public static readonly KeyGesture LoadScript = new(Key.Enter, KeyModifiers.Control);

	// === View shortcuts ===

	/// <summary>Toggle Full Screen (F11)</summary>
	public static readonly KeyGesture ToggleFullScreen = new(Key.F11);

	/// <summary>Refresh (F5)</summary>
	public static readonly KeyGesture Refresh = new(Key.F5);

	/// <summary>
	/// Check if a key event matches a shortcut.
	/// </summary>
	public static bool Matches(KeyEventArgs e, KeyGesture gesture) {
		return e.Key == gesture.Key && e.KeyModifiers == gesture.KeyModifiers;
	}

	/// <summary>
	/// Get shortcut display string.
	/// </summary>
	public static string GetDisplayString(KeyGesture gesture) {
		var parts = new List<string>();

		if (gesture.KeyModifiers.HasFlag(KeyModifiers.Control)) {
			parts.Add("Ctrl");
		}

		if (gesture.KeyModifiers.HasFlag(KeyModifiers.Alt)) {
			parts.Add("Alt");
		}

		if (gesture.KeyModifiers.HasFlag(KeyModifiers.Shift)) {
			parts.Add("Shift");
		}

		parts.Add(GetKeyDisplayName(gesture.Key));

		return string.Join("+", parts);
	}

	private static string GetKeyDisplayName(Key key) {
		return key switch {
			Key.OemComma => ",",
			Key.OemPeriod => ".",
			Key.OemOpenBrackets => "[",
			Key.OemCloseBrackets => "]",
			Key.OemPlus => "+",
			Key.OemMinus => "-",
			Key.D0 => "0",
			Key.D1 => "1",
			Key.D2 => "2",
			Key.D3 => "3",
			Key.D4 => "4",
			Key.D5 => "5",
			Key.D6 => "6",
			Key.D7 => "7",
			Key.D8 => "8",
			Key.D9 => "9",
			_ => key.ToString()
		};
	}
}

/// <summary>
/// Keyboard shortcut handler interface.
/// </summary>
public interface IKeyboardShortcutHandler {
	/// <summary>
	/// Handle a keyboard event.
	/// </summary>
	/// <param name="e">The key event args.</param>
	/// <returns>True if the event was handled.</returns>
	bool HandleKeyDown(KeyEventArgs e);
}
