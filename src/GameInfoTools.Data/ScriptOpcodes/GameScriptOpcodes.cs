namespace GameInfoTools.Data.ScriptOpcodes;

/// <summary>
/// Script opcode definitions for Dragon Warrior (NES) event scripts.
/// Based on research from the Dragon Warrior disassembly community.
/// </summary>
public static class DragonWarriorOpcodes {
	/// <summary>
	/// Dragon Warrior NES event script opcodes.
	/// </summary>
	public static readonly ScriptOpcodeDefinition[] EventOpcodes = [
		new(0x00, "END", 1, "End of script"),
		new(0x01, "TEXT", 2, "Display text message (id follows)"),
		new(0x02, "CHOICE", 3, "Yes/No choice (yes addr, no addr)"),
		new(0x03, "SHOP", 2, "Open shop menu (shop id)"),
		new(0x04, "INN", 2, "Inn dialog (price)"),
		new(0x05, "SAVE", 1, "Save game dialog"),
		new(0x06, "HEAL", 1, "Heal player"),
		new(0x07, "WARP", 3, "Warp to location (map, x, y)"),
		new(0x08, "GIVE_ITEM", 2, "Give item to player (item id)"),
		new(0x09, "TAKE_ITEM", 2, "Remove item from player (item id)"),
		new(0x0a, "CHECK_ITEM", 3, "Check if player has item (item id, fail addr)"),
		new(0x0b, "GIVE_GOLD", 3, "Give gold (amount low, high)"),
		new(0x0c, "TAKE_GOLD", 3, "Remove gold (amount low, high)"),
		new(0x0d, "SET_FLAG", 2, "Set game flag (flag id)"),
		new(0x0e, "CLEAR_FLAG", 2, "Clear game flag (flag id)"),
		new(0x0f, "CHECK_FLAG", 3, "Check flag (flag id, fail addr)"),
		new(0x10, "BATTLE", 2, "Start battle (enemy id)"),
		new(0x11, "LEARN_SPELL", 2, "Teach spell (spell id)"),
		new(0x12, "LEVEL_CHECK", 3, "Check player level (level, fail addr)"),
		new(0x13, "RAINBOW_DROP", 1, "Rainbow drop bridge event"),
		new(0x14, "PRINCESS_EVENT", 1, "Rescue princess event"),
		new(0x15, "DRAGONLORD", 1, "Final boss dialog"),
		new(0x16, "ENDING", 1, "Trigger ending sequence"),
	];

	/// <summary>
	/// Dragon Warrior text control codes within message text.
	/// </summary>
	public static readonly ScriptOpcodeDefinition[] TextControlCodes = [
		new(0x00, "[END]", 1, "End of text string"),
		new(0x01, "[LINE]", 1, "New line"),
		new(0x02, "[PAGE]", 1, "Wait and clear text box"),
		new(0x03, "[HERO]", 1, "Insert hero name"),
		new(0x04, "[ITEM]", 1, "Insert item name"),
		new(0x05, "[NUMBER]", 1, "Insert number value"),
		new(0x06, "[PAUSE]", 1, "Brief pause"),
	];
}

/// <summary>
/// Script opcode definitions for Dragon Warrior IV (NES).
/// </summary>
public static class DragonWarrior4Opcodes {
	/// <summary>
	/// Dragon Warrior IV event script opcodes (bank $19).
	/// </summary>
	public static readonly ScriptOpcodeDefinition[] EventOpcodes = [
		new(0x00, "END", 1, "End of script"),
		new(0x01, "GOTO", 3, "Jump to address"),
		new(0x02, "CALL", 3, "Call subroutine"),
		new(0x03, "RET", 1, "Return from subroutine"),
		new(0x04, "IF_FLAG", 4, "Branch if flag set"),
		new(0x05, "IF_NOT_FLAG", 4, "Branch if flag clear"),
		new(0x06, "SET_FLAG", 2, "Set story flag"),
		new(0x07, "CLEAR_FLAG", 2, "Clear story flag"),
		new(0x08, "TEXT", 3, "Display text (bank, ptr)"),
		new(0x09, "CHOICE", 5, "Yes/No (bank, ptr, fail)"),
		new(0x0a, "CHOICE3", 7, "Three choice menu"),
		new(0x0b, "GIVE_ITEM", 2, "Give item"),
		new(0x0c, "TAKE_ITEM", 2, "Take item"),
		new(0x0d, "CHECK_ITEM", 4, "Check item, branch if none"),
		new(0x0e, "GIVE_GOLD", 3, "Give gold (16-bit)"),
		new(0x0f, "TAKE_GOLD", 3, "Take gold (16-bit)"),
		new(0x10, "CHECK_GOLD", 5, "Check gold, branch if insufficient"),
		new(0x11, "HEAL_ALL", 1, "Heal entire party"),
		new(0x12, "WARP", 4, "Warp (map, x, y)"),
		new(0x13, "FACE", 2, "Face direction"),
		new(0x14, "MOVE", 3, "Move character (steps, direction)"),
		new(0x15, "WAIT", 2, "Wait frames"),
		new(0x16, "PLAY_MUSIC", 2, "Change music track"),
		new(0x17, "PLAY_SFX", 2, "Play sound effect"),
		new(0x18, "FADE_OUT", 1, "Fade screen to black"),
		new(0x19, "FADE_IN", 1, "Fade screen in"),
		new(0x1a, "BATTLE", 2, "Start battle (formation id)"),
		new(0x1b, "SHOP", 2, "Open shop (shop id)"),
		new(0x1c, "INN", 2, "Inn (price)"),
		new(0x1d, "CASINO", 1, "Open casino"),
		new(0x1e, "BANK", 1, "Open bank menu"),
		new(0x1f, "WAGON", 1, "Access wagon"),
		new(0x20, "PARTY_JOIN", 2, "Character joins party"),
		new(0x21, "PARTY_LEAVE", 2, "Character leaves party"),
		new(0x22, "CHAPTER", 2, "Set chapter number"),
	];
}

/// <summary>
/// Script opcode definitions for Final Fantasy (NES).
/// </summary>
public static class FinalFantasyOpcodes {
	/// <summary>
	/// Final Fantasy NES event/dialog opcodes.
	/// </summary>
	public static readonly ScriptOpcodeDefinition[] EventOpcodes = [
		new(0x00, "END", 1, "End dialog/event"),
		new(0x01, "LINE", 1, "New line in text"),
		new(0x02, "WAIT", 1, "Wait for button press"),
		new(0x03, "NAME", 1, "Insert character name"),
		new(0x04, "ITEM", 2, "Give item (item id)"),
		new(0x05, "GOLD", 3, "Give gold (amount)"),
		new(0x06, "FLAG", 2, "Set game flag"),
		new(0x07, "BATTLE", 2, "Force encounter (enemy group)"),
		new(0x08, "TELEPORT", 3, "Teleport (map, x, y)"),
		new(0x09, "HEAL", 1, "Restore party HP/MP"),
		new(0x0a, "OPEN_SHOP", 2, "Open shop (shop id)"),
		new(0x0b, "OPEN_INN", 2, "Open inn (price)"),
		new(0x0c, "OPEN_CLINIC", 1, "Open clinic"),
		new(0x0d, "SAVE_POINT", 1, "Enable save prompt"),
		new(0x0e, "AIRSHIP", 1, "Unlock airship"),
		new(0x0f, "SHIP", 1, "Unlock ship"),
		new(0x10, "CANOE", 1, "Unlock canoe"),
		new(0x11, "BRIDGE", 1, "Build bridge to Elfland"),
		new(0x12, "CLASS_CHANGE", 1, "Trigger class change"),
	];

	/// <summary>
	/// Final Fantasy text control codes.
	/// </summary>
	public static readonly ScriptOpcodeDefinition[] TextControlCodes = [
		new(0x00, "[END]", 1, "End of text"),
		new(0x01, "[NL]", 1, "New line"),
		new(0x02, "[WAIT]", 1, "Wait for input"),
		new(0x03, "[CHAR1]", 1, "Character 1 name"),
		new(0x04, "[CHAR2]", 1, "Character 2 name"),
		new(0x05, "[CHAR3]", 1, "Character 3 name"),
		new(0x06, "[CHAR4]", 1, "Character 4 name"),
		new(0x07, "[NUM]", 1, "Number placeholder"),
		new(0x08, "[ITEM]", 1, "Item name placeholder"),
	];
}

/// <summary>
/// Script opcode definitions for Final Fantasy IV/II (SNES).
/// </summary>
public static class FinalFantasy4Opcodes {
	/// <summary>
	/// Final Fantasy IV SNES event opcodes.
	/// </summary>
	public static readonly ScriptOpcodeDefinition[] EventOpcodes = [
		new(0x00, "END", 1, "End event"),
		new(0x01, "RETURN", 1, "Return from event call"),
		new(0x02, "WAIT", 2, "Wait N frames"),
		new(0x03, "WAIT_VBL", 1, "Wait for V-blank"),
		new(0x04, "FADE_IN", 1, "Fade screen in"),
		new(0x05, "FADE_OUT", 1, "Fade screen out"),
		new(0x06, "LOAD_MAP", 3, "Load map (map id, entrance)"),
		new(0x07, "WARP", 4, "Set position (x, y, facing)"),
		new(0x08, "MOVE", 4, "Move character (who, path id)"),
		new(0x09, "FACE", 3, "Face direction (who, direction)"),
		new(0x0a, "SHOW", 2, "Show sprite (who)"),
		new(0x0b, "HIDE", 2, "Hide sprite (who)"),
		new(0x0c, "DIALOG", 3, "Show dialog (text bank, id)"),
		new(0x0d, "CHOICE", 4, "Yes/No choice"),
		new(0x0e, "SET_FLAG", 2, "Set event flag"),
		new(0x0f, "CLEAR_FLAG", 2, "Clear event flag"),
		new(0x10, "CHECK_FLAG", 4, "Branch on flag"),
		new(0x11, "BATTLE", 3, "Start battle (group, bg)"),
		new(0x12, "GIVE_ITEM", 2, "Add item to inventory"),
		new(0x13, "TAKE_ITEM", 2, "Remove item"),
		new(0x14, "GIVE_MEMBER", 2, "Add party member"),
		new(0x15, "REMOVE_MEMBER", 2, "Remove party member"),
		new(0x16, "PLAY_MUSIC", 2, "Change music"),
		new(0x17, "PLAY_SFX", 2, "Play sound effect"),
		new(0x18, "SCREEN_SHAKE", 2, "Shake screen"),
		new(0x19, "FLASH", 2, "Screen flash effect"),
		new(0x1a, "SET_COLOR", 4, "Change palette entry"),
		new(0x1b, "ANIMATE", 3, "Sprite animation"),
		new(0x1c, "AIRSHIP_SCENE", 2, "Airship cutscene"),
		new(0x1d, "WORLD_MAP", 1, "Exit to world map"),
	];
}

/// <summary>
/// Represents a script opcode definition.
/// </summary>
/// <param name="Code">The opcode byte value.</param>
/// <param name="Name">The mnemonic name.</param>
/// <param name="Length">Total instruction length in bytes.</param>
/// <param name="Description">Description of the opcode function.</param>
public record ScriptOpcodeDefinition(byte Code, string Name, int Length, string Description);
