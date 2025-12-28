namespace DQ3Lib.Text.Font.ScriptFont;

// Using file addresses, not ROM addresses ($00, not $c0)
internal class Configuration {
	public int GroupTableAddress = 0x151aa;

	public int BankAddress = 0x1bbd5;

	public int GroupStructureSize = 5;

	public int Groups = 50;

	public int MaxWidth = 16;

	public int MaxHeight = 16;
}
