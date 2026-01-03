// C# Script to merge all DW4 CDL files using GameInfoTools.Analysis.CdlMerger
#r "C:\Users\me\source\repos\GameInfo\src\GameInfoTools.Analysis\bin\Release\net10.0\GameInfoTools.Analysis.dll"
#r "C:\Users\me\source\repos\GameInfo\src\GameInfoTools.Core\bin\Release\net10.0\GameInfoTools.Core.dll"

using GameInfoTools.Analysis;

var cdlDir = @"C:\Users\me\source\repos\GameInfo\Games\NES\Dragon Warrior 4 (NES)\Debugging\cdls";
var outputPath = @"C:\Users\me\source\repos\GameInfo\Games\NES\Dragon Warrior 4 (NES)\Debugging\Dragon Warrior IV (1992-10)(Enix)(US).cdl";

// Get all CDL files (excluding already merged files to avoid circular merge)
var cdlFiles = Directory.GetFiles(cdlDir, "*.cdl")
	.Where(f => !Path.GetFileName(f).Contains("-merged"))
	.OrderBy(f => f)
	.ToList();

Console.WriteLine($"Found {cdlFiles.Count} CDL files to merge:");
foreach (var f in cdlFiles)
{
	Console.WriteLine($"  - {Path.GetFileName(f)}");
}

// Configure merger for union of all flags
var config = new CdlMerger.MergeConfig
{
	Priority = CdlMerger.MergePriority.Union,
	TrackConflicts = true
};
var merger = new CdlMerger(config);

// Merge all files
Console.WriteLine("\nMerging...");
var result = merger.MergeFiles(cdlFiles, outputPath);

if (result.Success)
{
	Console.WriteLine($"✓ Merge successful!");
	Console.WriteLine($"  Bytes modified: {result.BytesModified}");
	Console.WriteLine($"  Conflicts: {result.ConflictCount}");
	Console.WriteLine($"  Coverage: {result.PostMergeCoverage:P2}");
	Console.WriteLine($"  Output: {Path.GetFileName(outputPath)}");
}
else
{
	Console.WriteLine("✗ Merge failed:");
	foreach (var error in result.Errors)
	{
		Console.WriteLine($"  {error}");
	}
}
