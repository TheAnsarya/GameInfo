# Convert spaces to tabs in all .asm files
# Uses 4-space tab width: 8 spaces -> 2 tabs, 4 spaces -> 1 tab

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$files = Get-ChildItem -Path $scriptDir -Filter "*.asm" -Recurse -File

foreach ($file in $files) {
	Write-Host "Processing: $($file.FullName)"
	$content = Get-Content -Path $file.FullName -Raw -Encoding UTF8

	# Convert 8 spaces to 2 tabs
	$content = $content.Replace("        ", "`t`t")

	# Convert 4 spaces to 1 tab
	$content = $content.Replace("    ", "`t")

	# Write back
	Set-Content -Path $file.FullName -Value $content -NoNewline -Encoding UTF8
	Write-Host "  Done: $($file.Name)"
}

Write-Host "`nConversion complete!"
