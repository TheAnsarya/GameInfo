# Dragon Quest III - Professional Build Script
Write-Host 'Building Dragon Quest III ROM from source...' -ForegroundColor Green

# Create build directory
if (!(Test-Path 'build')) {
    New-Item -ItemType Directory -Name 'build'
}

# Build ROM
make all

if ($LASTEXITCODE -eq 0) {
    Write-Host 'Build successful!' -ForegroundColor Green
    Write-Host 'Running verification...' -ForegroundColor Yellow
    make verify
} else {
    Write-Host 'Build failed!' -ForegroundColor Red
    exit 1
}