namespace GameInfoTools.Data.SecretOfMana;

/// <summary>
/// Known ROM and RAM addresses for Secret of Mana.
/// </summary>
/// <remarks>
/// All addresses in lowercase per project conventions.
/// Sources: Data Crystal, existing editors, community research.
/// </remarks>
public static class SecretOfManaData {
	#region ROM Information

	/// <summary>
	/// Expected SHA256 hash of the US ROM.
	/// </summary>
	public const string ExpectedSha256 = "4c15013131351e694e05f22e38bb1b3e4031dedac77ec75abecebe8520d82d5f";

	/// <summary>
	/// ROM size in bytes.
	/// </summary>
	public const int RomSize = 0x200000;

	/// <summary>
	/// Internal ROM checksum.
	/// </summary>
	public const int InternalChecksum = 0x51fc;

	#endregion

	#region Enemy Data Addresses

	/// <summary>
	/// Enemy stats table (file offset). Rabite is first entry.
	/// Confirmed via pattern analysis - HP values match expected game data.
	/// </summary>
	public const int EnemyStatsOffset = 0x102655;

	/// <summary>
	/// Enemy movement and AI data (file offset).
	/// </summary>
	public const int EnemyAiOffset = 0x105116;

	/// <summary>
	/// Drop percentage tables (file offset). Rabite first.
	/// </summary>
	public const int DropTablesOffset = 0x103a50;

	/// <summary>
	/// Size of each enemy stats entry in bytes.
	/// 29-byte structure with HP at byte 0.
	/// </summary>
	public const int EnemyStatsEntrySize = 29;

	/// <summary>
	/// Number of enemy types.
	/// </summary>
	public const int EnemyCount = 83;

	#endregion

	#region Character Data Addresses

	/// <summary>
	/// Character level stats table (file offset).
	/// Main character level 1 starts here.
	/// </summary>
	public const int CharacterStatsOffset = 0x104213;

	/// <summary>
	/// Size of each level entry per character.
	/// </summary>
	public const int CharacterLevelEntrySize = 40;

	/// <summary>
	/// Maximum character level.
	/// </summary>
	public const int MaxLevel = 99;

	/// <summary>
	/// Number of playable characters.
	/// </summary>
	public const int CharacterCount = 3;

	#endregion

	#region Item Data Addresses

	/// <summary>
	/// Item prices in stores (file offset).
	/// </summary>
	public const int ItemPricesOffset = 0x18fb9c;

	/// <summary>
	/// Size of item entry.
	/// </summary>
	public const int ItemEntrySize = 8;

	/// <summary>
	/// Number of items.
	/// </summary>
	public const int ItemCount = 96;

	#endregion

	#region Map/Exit Data Addresses

	/// <summary>
	/// Exit data table (file offset). 4 bytes per entry.
	/// </summary>
	public const int ExitDataOffset = 0x083000;

	/// <summary>
	/// Size of each exit entry.
	/// </summary>
	public const int ExitEntrySize = 4;

	#endregion

	#region Audio Data Addresses

	/// <summary>
	/// SPC music pointers (file offset).
	/// </summary>
	public const int SpcPointersOffset = 0x033d39;

	/// <summary>
	/// Sample indexes (file offset).
	/// </summary>
	public const int SampleIndexesOffset = 0x033f22;

	/// <summary>
	/// BRR sample data start (file offset).
	/// </summary>
	public const int BrrSamplesOffset = 0x0347c3;

	/// <summary>
	/// SPC sequence data start (file offset).
	/// </summary>
	public const int SpcSequencesOffset = 0x04d33d;

	/// <summary>
	/// Number of music tracks.
	/// </summary>
	public const int MusicTrackCount = 60;

	#endregion

	#region RAM Addresses

	/// <summary>
	/// Character 1 (Hero) data in RAM.
	/// </summary>
	public const int RamCharacter1 = 0x7ee000;

	/// <summary>
	/// Character 2 (Girl) data in RAM.
	/// </summary>
	public const int RamCharacter2 = 0x7ee200;

	/// <summary>
	/// Character 3 (Sprite) data in RAM.
	/// </summary>
	public const int RamCharacter3 = 0x7ee400;

	/// <summary>
	/// Enemy 1 data in RAM.
	/// </summary>
	public const int RamEnemy1 = 0x7ee600;

	/// <summary>
	/// Enemy 2 data in RAM.
	/// </summary>
	public const int RamEnemy2 = 0x7ee800;

	/// <summary>
	/// Enemy 3 data in RAM.
	/// </summary>
	public const int RamEnemy3 = 0x7eea00;

	/// <summary>
	/// NPC/Entity table in RAM.
	/// </summary>
	public const int RamNpcTable = 0x7ec800;

	/// <summary>
	/// Exit destination RAM address.
	/// </summary>
	public const int RamExitDestination = 0x7e00dc;

	/// <summary>
	/// Exit X coordinate.
	/// </summary>
	public const int RamExitX = 0x7e00de;

	/// <summary>
	/// Exit Y coordinate.
	/// </summary>
	public const int RamExitY = 0x7e00df;

	/// <summary>
	/// Layer 2 transparency flag.
	/// </summary>
	public const int RamLayer2Transparency = 0x7e0030;

	#endregion
}
