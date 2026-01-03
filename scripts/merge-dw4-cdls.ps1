$cdlDir = 'C:\Users\me\source\repos\GameInfo\Games\NES\Dragon Warrior 4 (NES)\Debugging\cdls'
$outputPath = 'C:\Users\me\source\repos\GameInfo\Games\NES\Dragon Warrior 4 (NES)\Debugging\Dragon Warrior IV (1992-10)(Enix)(US).cdl'

# Get all CDL files except the merged ones
$cdlFiles = Get-ChildItem -Path $cdlDir -Filter "*.cdl" | Where-Object { $_.Name -notlike "*-merged*" -and $_.Name -notlike "*~*" }

Write-Host "Merging $($cdlFiles.Count) CDL files..."

# Read first file to get the base
$mergedData = [System.IO.File]::ReadAllBytes($cdlFiles[0].FullName)
Write-Host "Base file: $($cdlFiles[0].Name) ($($mergedData.Length) bytes)"

# OR each subsequent file
for ($i = 1; $i -lt $cdlFiles.Count; $i++) {
	$fileData = [System.IO.File]::ReadAllBytes($cdlFiles[$i].FullName)
	Write-Host "Merging: $($cdlFiles[$i].Name)"
	
	if ($fileData.Length -ne $mergedData.Length) {
		Write-Host "  WARNING: Size mismatch ($($fileData.Length) vs $($mergedData.Length))"
		continue
	}
	
	for ($j = 0; $j -lt $mergedData.Length; $j++) {
		$mergedData[$j] = $mergedData[$j] -bor $fileData[$j]
	}
}

# Calculate coverage stats
$codeBytes = 0; $dataBytes = 0; $unloggedBytes = 0
foreach ($b in $mergedData) {
	if (($b -band 0x01) -ne 0) { $codeBytes++ }
	if (($b -band 0x02) -ne 0) { $dataBytes++ }
	if ($b -eq 0) { $unloggedBytes++ }
}
$totalBytes = $mergedData.Length
$coveredBytes = $totalBytes - $unloggedBytes
$coveragePercent = [math]::Round(($coveredBytes / $totalBytes) * 100, 2)

Write-Host "`nCoverage Statistics:"
Write-Host "  Total bytes:    $totalBytes"
Write-Host "  Code bytes:     $codeBytes"
Write-Host "  Data bytes:     $dataBytes"
Write-Host "  Covered bytes:  $coveredBytes"
Write-Host "  Unlogged bytes: $unloggedBytes"
Write-Host "  Coverage:       $coveragePercent%"

# Write output
[System.IO.File]::WriteAllBytes($outputPath, $mergedData)
Write-Host "`nMerged CDL written to: $outputPath"
