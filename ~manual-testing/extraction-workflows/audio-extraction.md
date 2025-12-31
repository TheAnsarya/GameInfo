# Audio Extraction Workflow

How to extract music and sound effects from SNES ROMs.

## 🎯 Overview

SNES audio uses:
- **SPC700**: Dedicated audio processor
- **BRR**: Bit Rate Reduction sample format
- **Music Engine**: Game-specific sequencer format

## 📋 Prerequisites

- SPC player (SPC700 Player, foo_input_spc)
- SPCTool or similar ripper
- Emulator with APU debugging
- Audio hex analyzer

## 🔬 Extraction Methods

### Method 1: SPC Rip (Recommended)

1. Use SPCTool during emulation
2. Play music in-game
3. Extract `.spc` file (contains full audio state)

### Method 2: Manual Extraction

1. Trace APU communication
2. Find music data transfer
3. Extract raw sequence data
4. Identify BRR sample locations

## 📐 SPC700 Memory Map

```
$0000-$00EF: Direct page (often unused)
$00F0-$00FF: Hardware registers
$0100-$01FF: Stack
$0200+: Program RAM / Music data
```

### Important Registers

| Address | Register | Purpose |
|---------|----------|---------|
| $F0 | TEST | Testing register |
| $F1 | CONTROL | Timer/IPL control |
| $F2 | DSPADDR | DSP address select |
| $F3 | DSPDATA | DSP data read/write |
| $F4-$F7 | CPUIO | CPU communication |
| $FD-$FF | TIMER | Timer outputs |

## 🎵 BRR Sample Format

Each 9-byte BRR block:
```
Byte 0: Header
  Bits 7-4: Range
  Bits 3-2: Filter
  Bit 1: Loop flag
  Bit 0: End flag

Bytes 1-8: 16 samples (4 bits each)
```

## 🔊 Sound Effect Extraction

### Step 1: Identify Trigger

1. Set breakpoint on APU ports ($2140-$2143)
2. Trigger sound effect in-game
3. Note command sent to SPC700

### Step 2: Trace SPC Code

1. Find SPC music engine
2. Identify sound effect table
3. Map effect ID to sample/sequence

### Step 3: Extract

1. Locate BRR samples in SPC RAM
2. Export sample data
3. Document loop points

## 📝 Documentation Template

```markdown
## Audio Asset: [Name]

### Type
- [ ] Music Track
- [ ] Sound Effect
- [ ] Ambience

### Location
- SPC RAM Address: $____
- ROM Source: $______
- Transfer Routine: $______

### Format
- Sample Rate: _____ Hz
- Channels: ___
- Duration: ___s

### Notes
[Looping, special effects, etc.]
```

## 🔧 Tools

| Tool | Purpose |
|------|---------|
| SPCTool | Extract SPC files from gameplay |
| SPC700 Player | Play .spc files |
| BRR Decoder | Convert BRR to WAV |
| Split700 | Extract individual samples |

## 🔗 Related

- [DMA Tracing](../breakpoint-guides/dma-tracing.md) - Find audio data transfers
