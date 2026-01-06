# Testing Procedures Guide

This guide documents testing procedures for GameInfo tools and ROM hacking projects.

## Overview

Testing is essential for ensuring:
- ROM hacks produce valid, playable ROMs
- Tools work correctly across different inputs
- Disassemblies can rebuild original ROMs
- Data conversions are lossless

## Test Categories

### 1. ROM Verification Tests

#### Byte-Perfect ROM Comparison

Compare a built ROM against the original to verify byte-perfect rebuilds:

```bash
# Using Python
python tools/verify_rom.py --original game.nes --built build/game.nes

# Using PowerShell
Compare-Object (Get-Content original.nes -AsByteStream) (Get-Content built.nes -AsByteStream)

# Using fcmp (fast compare)
fc /b original.nes built.nes
```

Expected output for a matching ROM:
```
✓ ROMs match exactly (524288 bytes)
Checksum: CRC32=ABCD1234
```

#### Checksum Verification

```python
import hashlib

def verify_checksums(rom_path, expected_crc, expected_sha1):
    """Verify ROM checksums match expected values."""
    with open(rom_path, 'rb') as f:
        data = f.read()

    import zlib
    actual_crc = format(zlib.crc32(data) & 0xffffffff, '08x')
    actual_sha1 = hashlib.sha1(data).hexdigest()

    assert actual_crc.lower() == expected_crc.lower(), f"CRC mismatch: {actual_crc}"
    assert actual_sha1.lower() == expected_sha1.lower(), f"SHA1 mismatch: {actual_sha1}"
    print("✓ Checksums verified")
```

#### Header Validation

For NES ROMs (iNES/NES 2.0):

```python
def validate_nes_header(rom_path):
    """Validate NES ROM header."""
    with open(rom_path, 'rb') as f:
        header = f.read(16)

    assert header[0:4] == b'NES\x1a', "Invalid NES magic number"
    prg_banks = header[4]
    chr_banks = header[5]
    mapper = ((header[6] >> 4) | (header[7] & 0xf0))

    print(f"✓ Valid NES ROM: {prg_banks} PRG banks, {chr_banks} CHR banks, Mapper {mapper}")
    return True
```

### 2. Tool Unit Tests

#### Test File Structure

```
tests/
├── __init__.py
├── conftest.py          # pytest fixtures
├── test_cdl_tools.py
├── test_label_tools.py
├── test_graphics.py
├── test_text.py
├── test_disassembly.py
├── fixtures/
│   ├── sample.cdl
│   ├── sample.mlb
│   ├── sample.chr
│   └── sample.tbl
└── expected/
    ├── cdl_output.txt
    └── graphics_output.png
```

#### Running Tests

```bash
# Run all tests
pytest tests/

# Run with coverage
pytest tests/ --cov=tools --cov-report=html

# Run specific test file
pytest tests/test_cdl_tools.py -v

# Run tests matching pattern
pytest tests/ -k "test_convert"
```

#### Sample Test Cases

```python
# tests/test_cdl_tools.py
import pytest
from tools.analyze_cdl import CDLAnalyzer

class TestCDLAnalyzer:
    @pytest.fixture
    def sample_cdl(self, tmp_path):
        """Create a sample CDL file for testing."""
        cdl_file = tmp_path / "test.cdl"
        # CDL header + some test data
        cdl_file.write_bytes(b'CDL\x01' + bytes([0x01] * 1000))
        return cdl_file

    def test_load_cdl(self, sample_cdl):
        """Test CDL file loading."""
        analyzer = CDLAnalyzer()
        analyzer.load(sample_cdl)
        assert analyzer.size > 0

    def test_coverage_calculation(self, sample_cdl):
        """Test coverage percentage calculation."""
        analyzer = CDLAnalyzer()
        analyzer.load(sample_cdl)
        coverage = analyzer.calculate_coverage()
        assert 0 <= coverage <= 100

    def test_invalid_cdl_raises(self, tmp_path):
        """Test that invalid CDL files raise appropriate errors."""
        invalid = tmp_path / "invalid.cdl"
        invalid.write_bytes(b'NOTCDL')
        analyzer = CDLAnalyzer()
        with pytest.raises(ValueError):
            analyzer.load(invalid)
```

### 3. Integration Tests

#### Build System Test

```python
# tests/test_build.py
import subprocess
import pytest
from pathlib import Path

class TestBuildSystem:
    @pytest.fixture
    def project_dir(self):
        return Path("c:/Users/me/source/repos/dragon-warrior-4-info")

    def test_clean_build(self, project_dir):
        """Test clean build produces valid ROM."""
        # Run clean build
        result = subprocess.run(
            ["powershell", "-File", "build.ps1", "-Clean"],
            cwd=project_dir,
            capture_output=True,
            text=True
        )
        assert result.returncode == 0, f"Build failed: {result.stderr}"

    def test_incremental_build(self, project_dir):
        """Test incremental build works correctly."""
        # First build
        subprocess.run(["powershell", "-File", "build.ps1"], cwd=project_dir)

        # Touch a file
        (project_dir / "src" / "main.asm").touch()

        # Incremental build
        result = subprocess.run(
            ["powershell", "-File", "build.ps1"],
            cwd=project_dir,
            capture_output=True
        )
        assert result.returncode == 0

    def test_rom_matches_original(self, project_dir):
        """Test built ROM matches original byte-for-byte."""
        original = project_dir / "roms" / "original.nes"
        built = project_dir / "build" / "output.nes"

        with open(original, 'rb') as f1, open(built, 'rb') as f2:
            assert f1.read() == f2.read()
```

#### Disassembly Roundtrip Test

```python
def test_disassembly_roundtrip(rom_path, disasm_dir, build_script):
    """
    Test that disassembly can rebuild original ROM.

    Steps:
    1. Load original ROM
    2. Build from disassembly
    3. Compare byte-for-byte
    """
    original_data = Path(rom_path).read_bytes()

    # Build from disassembly
    subprocess.run(build_script, cwd=disasm_dir, check=True)

    built_rom = disasm_dir / "build" / "output.nes"
    built_data = built_rom.read_bytes()

    assert original_data == built_data, "Roundtrip failed: ROMs don't match"
```

### 4. Data Conversion Tests

#### Binary ↔ JSON Roundtrip

```python
def test_bin_to_json_roundtrip(sample_binary):
    """Test binary to JSON conversion is lossless."""
    # Convert to JSON
    json_data = bin_to_json(sample_binary)

    # Convert back to binary
    rebuilt_binary = json_to_bin(json_data)

    assert sample_binary == rebuilt_binary, "Roundtrip conversion failed"
```

#### Table File Validation

```python
def test_tbl_encoding(tbl_file, test_strings):
    """Test text encoding with TBL file."""
    tbl = load_tbl(tbl_file)

    for original in test_strings:
        # Encode string
        encoded = tbl.encode(original)

        # Decode back
        decoded = tbl.decode(encoded)

        assert original == decoded, f"TBL roundtrip failed: {original} != {decoded}"
```

### 5. Emulator Tests

#### Save State Comparison

```python
def test_savestate_compatibility():
    """Test that save states load correctly after ROM changes."""
    # This requires emulator scripting support
    pass
```

#### Gameplay Regression Tests

```python
def test_intro_sequence(emulator, rom_path):
    """Test intro sequence plays correctly."""
    emu = emulator.load(rom_path)

    # Run for 60 frames (1 second at 60fps)
    for _ in range(60):
        emu.frame_advance()

    # Check we're on title screen
    assert emu.read_ram(0x00FF) == 0x01, "Not on title screen"
```

### 6. Graphics Tests

#### CHR Extraction Validation

```python
def test_chr_extraction(rom_path, expected_tiles):
    """Test CHR tile extraction produces expected output."""
    tiles = extract_chr(rom_path)

    assert len(tiles) == expected_tiles
    assert all(len(t) == 64 for t in tiles)  # 8x8 = 64 pixels each
```

#### Palette Validation

```python
def test_palette_values(rom_path):
    """Test palette values are valid NES colors."""
    palettes = extract_palettes(rom_path)

    for pal in palettes:
        for color in pal:
            assert 0x00 <= color <= 0x3F, f"Invalid NES color: {color:02x}"
```

## Continuous Integration

### GitHub Actions Workflow

```yaml
# .github/workflows/test.yml
name: Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: '3.11'

      - name: Install dependencies
        run: |
          pip install -r requirements.txt
          pip install pytest pytest-cov

      - name: Run tests
        run: pytest tests/ --cov=tools --cov-report=xml

      - name: Upload coverage
        uses: codecov/codecov-action@v3
```

### Pre-commit Hooks

```yaml
# .pre-commit-config.yaml
repos:
  - repo: local
    hooks:
      - id: pytest
        name: Run Tests
        entry: pytest tests/ -x
        language: system
        pass_filenames: false
```

## Test Data Management

### Fixtures Directory Structure

```
fixtures/
├── roms/
│   └── .gitkeep           # Don't commit actual ROMs
├── cdl/
│   ├── sample_fceux.cdl
│   └── sample_mesen.cdl
├── labels/
│   ├── sample.mlb
│   └── sample.nl
├── graphics/
│   ├── sample.chr
│   └── expected_output.png
└── text/
    ├── sample.tbl
    └── sample_text.bin
```

### Test ROM Generation

For tests that need ROM data, generate synthetic test ROMs:

```python
def generate_test_rom(size=0x4000):
    """Generate a minimal valid NES ROM for testing."""
    header = bytes([
        0x4E, 0x45, 0x53, 0x1A,  # NES\x1a
        0x01,  # 1 PRG bank (16KB)
        0x01,  # 1 CHR bank (8KB)
        0x00,  # Mapper 0, horizontal mirroring
        0x00,  # Mapper 0 continued
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    ])

    prg = bytes([0x00] * 0x4000)  # 16KB PRG
    chr_data = bytes([0x00] * 0x2000)  # 8KB CHR

    return header + prg + chr_data
```

## Debugging Failed Tests

### Verbose Output

```bash
pytest tests/ -v --tb=long
```

### Binary Diff for ROM Mismatches

```python
def show_binary_diff(file1, file2, context=16):
    """Show differences between two binary files."""
    data1 = Path(file1).read_bytes()
    data2 = Path(file2).read_bytes()

    for i, (b1, b2) in enumerate(zip(data1, data2)):
        if b1 != b2:
            start = max(0, i - context)
            end = min(len(data1), i + context)
            print(f"First difference at offset ${i:06X}")
            print(f"  Original: {data1[start:end].hex()}")
            print(f"  Built:    {data2[start:end].hex()}")
            break
```

## See Also

- [CLI Reference](cli-reference.md) - Command-line tool usage
- [Disassembly Guide](disassembly-guide.md) - Creating testable disassemblies
- [Build Pipeline](../Build-Pipeline/) - Build system documentation
