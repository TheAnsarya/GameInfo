# Atari 2600 Bank Switching Schemes

Complete reference for all Atari 2600 bank switching schemes, detection methods, and implementation details.

## Overview

Bank switching allows games to exceed the 4KB direct addressable ROM space of the Atari 2600. Different manufacturers developed proprietary schemes.

## Scheme Comparison Table

| Scheme | Size | Banks | Hotspot Range | Method | Manufacturer |
|--------|------|-------|---------------|--------|--------------|
| **2K** | 2048 | 1 | N/A | None | Atari |
| **4K** | 4096 | 1 | N/A | None | Atari |
| **F8** | 8192 | 2 | $1ff8-$1ff9 | Read | Atari |
| **F6** | 16384 | 4 | $1ff6-$1ff9 | Read | Atari |
| **F4** | 32768 | 8 | $1ff4-$1ffb | Read | Atari |
| **FE** | 8192 | 2 | $01fe-$01ff | Read | Activision |
| **E0** | 8192 | 4×2KB | $1fe0-$1fef | Read | Parker Bros |
| **E7** | 12K-16K | Variable | $1fe0-$1fe7 | Read | M-Network |
| **3F** | 8K-512K | Variable | $003f | Write | Tigervision |
| **3E** | 32K-512K | Variable | $003f, $003e | Write | Tigervision |
| **DPC** | 10K | 2+chip | $0050-$007f | Special | Activision |
| **AR** | 6K | Variable | N/A | ARM | Starpath |

## No Banking (2K/4K)

### Memory Map
```
$0000-$007f: TIA registers
$0080-$00ff: RAM (128 bytes)
$0280-$0297: RIOT registers  
$f000-$ffff: ROM (2K/4K)
```

### Detection
- ROM size exactly 2048 or 4096 bytes
- Reset vector points to $fxxx

### Games
- 2K: **Combat**, **Air-Sea Battle**, **Canyon Bomber**
- 4K: **Adventure**, **Pitfall!**, **River Raid II**, **Asteroids**

## F8 Banking (8K, 2 banks)

### Memory Map
```
$0000-$007f: TIA registers
$0080-$00ff: RAM
$0280-$0297: RIOT registers
$f000-$ffff: Banked ROM (4K window)
  Access $1ff8 → Bank 0
  Access $1ff9 → Bank 1
```

### Hotspots
- **$1ff8**: Switch to bank 0 (maps ROM $0000-$0fff)
- **$1ff9**: Switch to bank 1 (maps ROM $1000-$1fff)

### Code Example
```asm
; Switch to bank 0
	lda $1ff8        ; Read from hotspot

; Switch to bank 1  
	lda $1ff9        ; Read from hotspot

; Common pattern: subroutine in different bank
	lda #<return_addr
	pha
	lda #>return_addr
	pha
	lda $1ff9        ; Switch to bank 1
	jmp target       ; Call routine
return_addr:
	lda $1ff8        ; Restore bank 0
```

### Detection
- ROM size = 8192 bytes
- Contains reads from $1ff8 or $1ff9
- Reset vector in upper bank

### Games
- **Ms. Pac-Man**
- **Space Invaders**
- **Demon Attack**
- **Centipede**
- **Kaboom!**

## F6 Banking (16K, 4 banks)

### Memory Map
```
$f000-$ffff: Banked ROM (4K window)
  $1ff6 → Bank 0 (ROM $0000-$0fff)
  $1ff7 → Bank 1 (ROM $1000-$1fff)
  $1ff8 → Bank 2 (ROM $2000-$2fff)
  $1ff9 → Bank 3 (ROM $3000-$3fff)
```

### Hotspots
- **$1ff6-$1ff9**: Bank select (read)

### Code Example
```asm
; Bank switching table
bank_table:
	.byte $f6, $f7, $f8, $f9  ; Hotspot offsets

; Switch to bank N (0-3)
switch_bank:
	tax
	lda bank_table,x
	sta $1ff0,x      ; Actually reads from $1ff6-$1ff9
	rts
```

### Detection
- ROM size = 16384 bytes
- Multiple hotspot reads ($1ff6-$1ff9)
- Last bank contains reset vector

### Games
- **Crystal Castles**
- **Millipede**
- **Jr. Pac-Man**
- **Dig Dug**

## F4 Banking (32K, 8 banks)

### Memory Map
```
$f000-$ffff: Banked ROM (4K window)
  $1ff4-$1ffb → Banks 0-7
```

### Hotspots
- **$1ff4**: Bank 0 (ROM $0000-$0fff)
- **$1ff5**: Bank 1 (ROM $1000-$1fff)
- **$1ff6**: Bank 2 (ROM $2000-$2fff)
- **$1ff7**: Bank 3 (ROM $3000-$3fff)
- **$1ff8**: Bank 4 (ROM $4000-$4fff)
- **$1ff9**: Bank 5 (ROM $5000-$5fff)
- **$1ffa**: Bank 6 (ROM $6000-$6fff)
- **$1ffb**: Bank 7 (ROM $7000-$7fff)

### Detection
- ROM size = 32768 bytes
- Hotspot reads from $1ff4-$1ffb

### Games
- **Fatal Run**
- **Quadrun**

## FE Banking (8K Activision, 2 banks)

### Memory Map
```
$f000-$ffff: Banked ROM
  Read $01fe when D7=0 → Bank 0
  Read $01fe when D7=1 → Bank 1
```

### Unique Mechanism
Activision's FE scheme uses **data bus state** during reads:
```asm
; Switch to bank 0
	lda #$00
	sta $fe          ; D7=0, triggers bank 0

; Switch to bank 1
	lda #$80
	sta $fe          ; D7=1, triggers bank 1
```

### Detection
- ROM size = 8192 bytes
- Contains writes/reads to $00fe/$01fe
- No F8 hotspot pattern

### Games
- **Decathlon**
- **Robot Tank** (prototype)

## E0 Banking (8K Parker Bros, 4×2KB slices)

### Memory Map
Complex 4-slice system with independent bank control:
```
$f000-$f7ff: Slice 0 (2KB, fixed to bank 0)
$f800-$f9ff: Slice 1 (2KB, switchable)
$fa00-$fbff: Slice 2 (2KB, switchable)
$fc00-$ffff: Slice 3 (2KB, fixed to bank 3)
```

### Hotspots
- **$1fe0-$1fe7**: Select bank for slice 1 (8 possible banks)
- **$1fe8-$1fef**: Select bank for slice 2 (8 possible banks)

### Detection
- ROM size = 8192 bytes
- Hotspot access $1fe0-$1fef
- Complex slice management

### Games
- **Montezuma's Revenge**
- **Gyruss**
- **Popeye**
- **Q*bert's Qubes**

## 3F Banking (Tigervision, write-based)

### Memory Map
```
$f000-$ffff: Banked ROM (4K window)
  Write value N to $003f → Switch to bank N
```

### Mechanism
Unlike read-based schemes, 3F uses **writes** to select banks:
```asm
; Switch to bank 2
	lda #$02
	sta $3f          ; Write bank number
```

### Variable Banking
Supports 8KB to 512KB:
- 8KB = 2 banks
- 16KB = 4 banks
- 32KB = 8 banks
- etc.

### Detection
- Writes to $003f
- Variable ROM size (multiple of 4K)
- No standard hotspot reads

### Games
- **Espial**
- **Polaris**
- **Threshold**
- **Miner 2049er**

## DPC (Pitfall II, Display Processor Chip)

### Memory Map
```
$f000-$ffff: Banked ROM (2 banks, F8-style)
$0050-$007f: DPC registers
```

### DPC Registers ($50-$7f)
- **$50-$57**: Data Fetcher addresses (8 channels)
- **$58-$5f**: Display Fetcher control
- **$60-$67**: Music Fetcher control
- **$68-$6f**: Random number generator
- **$70-$77**: Graphics patterns
- **$78-$7f**: Audio waveforms

### Special Features
- 8 independent data fetch channels
- Hardware music/sound generation
- Graphics decompression
- Pseudo-random number generation

### Detection
- ROM size ≈ 10KB (10240-10495 bytes)
- F8 bank switching + DPC registers
- Unique entry points ($60xx, $80xx ranges)

### Games
- **Pitfall II: Lost Caverns** (only commercial game)

## Starpath Supercharger (AR)

### Memory Map
```
$f000-$ffff: Write-protected RAM (loaded from tape)
Contains ARM coprocessor code
```

### Loading Process
1. Boot loader in ROM
2. Game loads from cassette tape
3. Decompresses into RAM
4. Complex multi-load system

### Detection
- Special AR BIOS signature
- Cassette-based distribution
- Requires Supercharger hardware

### Games
- **Escape from the Mindmaster**
- **Dragonstomper**
- **Suicide Mission**
- **Phaser Patrol**

## Detection Algorithm

### Step 1: Check Size
```python
if size == 2048:
	return "2K"
elif size == 4096:
	return "4K"
elif size == 8192:
	return detect_8k_scheme()
elif size == 16384:
	return "F6"
elif size == 32768:
	return "F4"
elif size >= 10240 and size <= 10495:
	return "DPC"
else:
	return "Unknown"
```

### Step 2: Analyze 8K ROMs
```python
def detect_8k_scheme():
	if contains_hotspot_reads("$1ff8", "$1ff9"):
		return "F8"
	elif contains_writes("$003f"):
		return "3F"
	elif contains_access("$00fe", "$01fe"):
		return "FE"
	elif contains_hotspot_reads("$1fe0-$1fef"):
		return "E0"
	else:
		return "F8"  # Default assumption
```

### Step 3: Verify Entry Points
```python
reset_vector = read_word(rom_size - 4)
if reset_vector in valid_range:
	# Validate by checking instructions
	if is_valid_6502_code(reset_vector):
		return True
```

## Cross-Bank Call Patterns

### Subroutine in Different Bank
```asm
; In bank 0
call_other_bank:
	lda #<return_here
	pha
	lda #>return_here
	pha
	lda $1ff9        ; Switch to bank 1
	jmp subroutine
return_here:
	lda $1ff8        ; Restore bank 0
	; Continue...
```

### Jump Table Method
```asm
; Bank 0: Jump table
vectors:
	.word func1-1    ; -1 for RTS trick
	.word func2-1
	.word func3-1

call_vector:
	; X = vector index
	lda vectors+1,x
	pha
	lda vectors,x
	pha
	lda $1ff9        ; Switch to target bank
	rts              ; "Return" to target

; Bank 1: Actual functions
func1:
	; ... code ...
	lda $1ff8        ; Restore bank 0
	rts
```

## Peony Bank Switching Support

### Command Options
```bash
# Disassemble all banks
peony disasm rom.a26 --all-banks -o output.asm

# Specify mapper override
peony disasm rom.a26 --platform atari2600 --mapper F6

# Export per-bank symbols
peony export rom.a26 -o symbols/ --split-banks
```

### Output Format
```asm
; Bank 0 ($0000-$0fff)
.bank 0
.org $f000

bank0_start:
	; ... code ...

; Bank 1 ($1000-$1fff)
.bank 1
.org $f000

bank1_start:
	; ... code ...

; Vectors (in last bank)
.bank 1
.org $fffc
	.word reset      ; RESET vector
	.word irq        ; IRQ vector
```

## Testing Bank Switching

### Unit Tests
```csharp
[Fact]
public void F8_DetectsCorrectly()
{
	var rom = LoadRom("mspacman.a26");
	var analyzer = new Atari2600Analyzer();
	var info = analyzer.Analyze(rom);
	
	Assert.Equal("F8", info.Mapper);
	Assert.Equal(2, info.BankCount);
	Assert.Contains(0x1ff8, info.Hotspots);
	Assert.Contains(0x1ff9, info.Hotspots);
}
```

### Manual Verification
```bash
# Check for bank switching reads
strings rom.bin | grep -E "\xf[896]"

# Analyze hotspot usage
hexdump -C rom.bin | grep "ff [f89]"
```

## References

- [AtariAge Bank Switching Guide](https://atariage.com/2600/archives/bankswitching_methods.html)
- [Stella Cartridge Types](https://stella-emu.github.io/docs/index.html#Cartridges)
- [Kevin Horton's Bankswitch Document](http://blog.kevtris.org/blogfiles/Atari%202600%20Mappers.txt)
- [Atari 2600 Specifications](https://problemkaputt.de/2k6specs.htm)

