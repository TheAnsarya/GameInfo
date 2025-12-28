namespace DQ3Lib.Text.Atlas;

// Reference: https://github.com/ButThouMust/dq6-sfc/blob/main/DragonQuest3ScriptDumper.java
internal class Writer {
	private const string CommentLine = "// -----------------------------------------------------------------------------\n";

	// New lines at end of strings can probably be removed since it is a string[] not writing to a file
	public static string[] CreateHeader(string tableFileName, int PTR_TABLE_OFFSET) {
		string[] lines =
		[
			"#VAR(Table, TABLE)",
			Environment.NewLine,
			$"#ADDTBL(\"{tableFileName}\", Table)\n",
			"#ACTIVETBL(Table)\n\n",
			"#VAR(Ptr, CUSTOMPOINTER)\n",
			"#CREATEPTR(Ptr, \"LINEAR\", $400000, 24)\n\n",
			"#VAR(PtrTbl, POINTERTABLE)\n",
			$"#PTRTBL(PtrTbl, ${PTR_TABLE_OFFSET:x6}, 3, Ptr)\n\n",
			CommentLine,
			CommentLine,
			Environment.NewLine,
			"// Insert uncompressed script in 5th MB, after end of ROM\n",
			"#JMP($400000)\n\n",
		];

		return lines;
	}
}
