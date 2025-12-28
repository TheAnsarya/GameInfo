using DQ3Lib.Common.Rom;

namespace DQ3Lib.Text.Font.ScriptFont;

internal class GroupTable {
	public Group[] Groups { get; init; }

	public GroupTable(Rom rom, Configuration configuration) {
		var groupData = rom.Data.AsSpan(configuration.GroupTableAddress, configuration.GroupStructureSize * configuration.Groups);

		Groups = new Group[configuration.Groups];
		for (int i = 0; i < Groups.Length; i++) {
			Groups[i] = new Group(groupData.Slice(configuration.GroupStructureSize * i, configuration.GroupStructureSize));
		}
	}
}
