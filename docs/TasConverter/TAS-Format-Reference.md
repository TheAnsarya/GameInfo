# TAS File Format Reference

This document provides detailed specifications for all supported TAS (Tool-Assisted Speedrun) movie file formats.

## Table of Contents

- [SNES Formats](#snes-formats)
  - [SMV (Snes9x)](#smv-snes9x)
  - [LSMV (lsnes)](#lsmv-lsnes)
- [NES Formats](#nes-formats)
  - [FM2 (FCEUX)](#fm2-fceux)
- [Game Boy Formats](#game-boy-formats)
  - [VBM (VBA-RR)](#vbm-vba-rr)
- [Multi-System Formats](#multi-system-formats)
  - [BK2 (BizHawk)](#bk2-bizhawk)

---

## SNES Formats

### SMV (Snes9x)

**Extension:** `.smv`
**Type:** Binary
**Emulator:** Snes9x 1.43 - 1.52

#### Header Structure (v1.43 - 32 bytes)

| Offset | Size | Type | Description |
|--------|------|------|-------------|
| 0x00 | 4 | char[4] | Signature: `SMV\x1A` (53 4D 56 1A) |
| 0x04 | 4 | uint32 | Version number (1=1.43, 4=1.51, 5=1.52) |
| 0x08 | 4 | uint32 | Movie UID / Unix timestamp |
| 0x0C | 4 | uint32 | Rerecord count |
| 0x10 | 4 | uint32 | Frame count |
| 0x14 | 1 | uint8 | Controller mask (bit 0-4 = controllers 1-5) |
| 0x15 | 1 | uint8 | Movie options flags |
| 0x16 | 1 | uint8 | Sync options 1 |
| 0x17 | 1 | uint8 | Sync options 2 |
| 0x18 | 4 | uint32 | Savestate offset |
| 0x1C | 4 | uint32 | Controller data offset |

#### Movie Options (byte 0x15)

| Bit | Name | Description |
|-----|------|-------------|
| 0 | Start Type | 0=savestate, 1=SRAM (reset) |
| 1 | PAL | 0=NTSC (60fps), 1=PAL (50fps) |
| 2-7 | Reserved | Set to 0 |

#### Sync Options 2 (byte 0x17)

| Bit | Name | Description |
|-----|------|-------------|
| 0 | DATA_EXISTS | All sync flags are valid |
| 1 | WIP1TIMING | WIP1 timing mode |
| 2 | LEFTRIGHT | Allow L+R simultaneously |
| 3 | VOLUMEENVX | Volume envelope fix |
| 4 | FAKEMUTE | Fake mute desync fix |
| 5 | SYNCSOUND | Sound synchronization |
| 6 | HASROMINFO | ROM info block present |
| 7 | Reserved | Set to 0 |

#### Extended Header (v1.51 - additional 32 bytes at 0x20)

| Offset | Size | Type | Description |
|--------|------|------|-------------|
| 0x20 | 4 | uint32 | Input sample count |
| 0x24 | 1 | uint8 | Port 1 device type |
| 0x25 | 1 | uint8 | Port 2 device type |
| 0x26 | 4 | int8[4] | Port 1 controller IDs (-1=unplugged) |
| 0x2A | 4 | int8[4] | Port 2 controller IDs |
| 0x2E | 18 | - | Reserved |

#### Device Types

| Value | Device |
|-------|--------|
| 0 | None |
| 1 | Joypad |
| 2 | Mouse |
| 3 | Super Scope |
| 4 | Justifier |
| 5 | Multitap |

#### Controller Input (2 bytes per controller)

```
Byte 0 (high byte):
  Bit 7: A
  Bit 6: X
  Bit 5: L
  Bit 4: R
  Bits 0-3: Reserved

Byte 1 (low byte):
  Bit 7: B
  Bit 6: Y
  Bit 5: Select
  Bit 4: Start
  Bit 3: Up
  Bit 2: Down
  Bit 1: Left
  Bit 0: Right
```

#### Special Values

- `0xFFFF` for all controllers = Console reset

---

### LSMV (lsnes)

**Extension:** `.lsmv`
**Type:** ZIP Archive
**Emulator:** lsnes/bsnes

#### Archive Structure

LSMV files are ZIP archives containing multiple files:

| File | Required | Description |
|------|----------|-------------|
| `systemid` | Yes | Must contain `lsnes-rr1` |
| `controlsversion` | Yes | Must contain `0` |
| `gametype` | Yes | System/region code |
| `coreversion` | Yes | bsnes core version |
| `projectid` | Yes | Unique movie identifier |
| `input` | Yes | Frame input data |
| `rom.sha256` | No | ROM hash |
| `authors` | No | Author list |
| `gamename` | No | Game name |
| `rerecords` | No | Rerecord count |
| `savestate` | No | bsnes savestate (if starts from state) |
| `savestate.anchor` | No | Anchor savestate |
| `moviesram.*` | No | Initial SRAM data |
| `subtitles` | No | Subtitle data |

#### Game Types

| Code | System |
|------|--------|
| `snes_ntsc` | NTSC SNES |
| `snes_pal` | PAL SNES |
| `sgb_ntsc` | NTSC Super Game Boy |
| `sgb_pal` | PAL Super Game Boy |
| `gdmg` | Game Boy (DMG) |
| `ggbc` | Game Boy Color |
| `ggbca` | Game Boy Color (GBA mode) |
| `bsx` | BS-X |
| `bsxslotted` | BS-X Slotted |
| `sufamiturbo` | Sufami Turbo |

#### Input Format

Each line in the `input` file represents one frame:

```
F.|BYsSudlrAXLR
```

| Position | Button |
|----------|--------|
| 0 | Frame marker (F=frame, .=subframe) |
| 1 | Separator (.) |
| 2 | Separator (|) |
| 3 | B |
| 4 | Y |
| 5 | s (Select) |
| 6 | S (Start, lowercase = select) |
| 7 | u (Up) |
| 8 | d (Down) |
| 9 | l (Left) |
| 10 | r (Right) |
| 11 | A |
| 12 | X |
| 13 | L |
| 14 | R |

#### Authors Format

One author per line in `authors` file:
```
Real Name|Nickname
```

---

## NES Formats

### FM2 (FCEUX)

**Extension:** `.fm2`
**Type:** Text
**Emulator:** FCEUX

#### Structure

FM2 files consist of:
1. Header (key-value pairs)
2. Input log (pipe-delimited lines)

#### Header Keys

| Key | Type | Required | Description |
|-----|------|----------|-------------|
| `version` | int | Yes | Format version (always 3) |
| `emuVersion` | int | Yes | FCEUX version |
| `rerecordCount` | int | No | Rerecord count |
| `palFlag` | bool | No | 1=PAL, 0=NTSC |
| `NewPPU` | bool | No | New PPU enabled |
| `FDS` | bool | No | Famicom Disk System |
| `fourscore` | bool | No | Four Score adapter |
| `port0` | int | No | Port 0 device type |
| `port1` | int | No | Port 1 device type |
| `port2` | int | No | Expansion port device |
| `binary` | bool | No | Binary input log |
| `length` | int | No | Frame count |
| `romFilename` | string | Yes | ROM filename |
| `romChecksum` | string | Yes | ROM MD5 hash (base64) |
| `guid` | string | Yes | Movie GUID |
| `comment` | string | No | Comment (multiple allowed) |
| `subtitle` | string | No | Subtitle entry |
| `savestate` | blob | No | FCS savestate (base64) |

#### Device Types

| Value | Device |
|-------|--------|
| 0 | SI_NONE |
| 1 | SI_GAMEPAD |
| 2 | SI_ZAPPER |

#### Input Log Format

Standard format (no fourscore):
```
|commands|port0|port1|port2|
```

Fourscore format:
```
|commands|p1|p2|p3|p4|port2|
```

#### Commands Field

Decimal integer, bit field:
| Bit | Command |
|-----|---------|
| 0 | Soft Reset |
| 1 | Hard Reset (Power) |
| 2 | FDS Disk Insert |
| 3 | FDS Disk Select |
| 4 | VS Insert Coin |

#### Gamepad Input

8 characters representing button states:
```
RLDUTSBA
```

| Position | Button |
|----------|--------|
| 0 | Right |
| 1 | Left |
| 2 | Down |
| 3 | Up |
| 4 | Start (T) |
| 5 | Select (S) |
| 6 | B |
| 7 | A |

Space or `.` = not pressed, any other character = pressed.

#### Zapper Input

```
XXX YYY B Q Z
```

| Field | Description |
|-------|-------------|
| XXX | X position (%03d) |
| YYY | Y position (%03d) |
| B | Button pressed (0/1) |
| Q | Internal value |
| Z | Internal value |

#### Example

```
version 3
emuVersion 20500
rerecordCount 1234
palFlag 0
romFilename Super Mario Bros. (W) [!].nes
romChecksum base64:mDRFnA1WNUA6O6LwH1r4RA==
guid 452DE2C3-EF43-2FA9-77AC-0677FC51543B
fourscore 0
port0 1
port1 1
port2 0
|0|........|........||
|0|...U....|........||
|0|...U..B.|........||
|0|...UT.BA|........||
```

---

## Game Boy Formats

### VBM (VBA-RR)

**Extension:** `.vbm`
**Type:** Binary
**Emulator:** VisualBoyAdvance Re-recording

#### Header (64 bytes)

| Offset | Size | Type | Description |
|--------|------|------|-------------|
| 0x00 | 4 | char[4] | Signature: `VBM\x1A` |
| 0x04 | 4 | uint32 | Major version (1) |
| 0x08 | 4 | int32 | Movie UID / Unix timestamp |
| 0x0C | 4 | uint32 | Frame count |
| 0x10 | 4 | uint32 | Rerecord count |
| 0x14 | 1 | uint8 | Start flags |
| 0x15 | 1 | uint8 | Controller flags |
| 0x16 | 1 | uint8 | System flags |
| 0x17 | 1 | uint8 | Emulator options |
| 0x18 | 4 | uint32 | winSaveType |
| 0x1C | 4 | uint32 | winFlashSize |
| 0x20 | 4 | uint32 | gbEmulatorType |
| 0x24 | 12 | char[12] | Internal ROM title |
| 0x30 | 1 | uint8 | Minor version |
| 0x31 | 1 | uint8 | Internal CRC |
| 0x32 | 2 | uint16 | ROM checksum / BIOS CRC16 |
| 0x34 | 4 | uint32 | Game code / Unit code |
| 0x38 | 4 | uint32 | Savestate offset |
| 0x3C | 4 | uint32 | Controller data offset |

#### Start Flags (byte 0x14)

| Bit | Description |
|-----|-------------|
| 0 | Starts from savestate |
| 1 | Starts from SRAM |

#### Controller Flags (byte 0x15)

| Bit | Description |
|-----|-------------|
| 0 | Controller 1 in use |
| 1 | Controller 2 in use (SGB) |
| 2 | Controller 3 in use (SGB) |
| 3 | Controller 4 in use (SGB) |

#### System Flags (byte 0x16)

| Bit | Description |
|-----|-------------|
| 0 | GBA |
| 1 | GBC |
| 2 | SGB |

#### Info Section (192 bytes at offset 0x40)

| Offset | Size | Description |
|--------|------|-------------|
| 0x40 | 64 | Author name(s), null-terminated |
| 0x80 | 128 | Description, null-terminated |

#### Controller Input (2 bytes per controller)

```
Byte 0:
  Bit 0: A
  Bit 1: B
  Bit 2: Select
  Bit 3: Start
  Bit 4: Right
  Bit 5: Left
  Bit 6: Up
  Bit 7: Down

Byte 1:
  Bit 0: R
  Bit 1: L
  Bit 2: Reset (old timing)
  Bit 3: Reset (new timing, v1.1+)
  Bits 4-7: Motion sensor (deprecated)
```

---

## Multi-System Formats

### BK2 (BizHawk)

**Extension:** `.bk2`
**Type:** ZIP Archive
**Emulator:** BizHawk

#### Archive Structure

| File | Required | Description |
|------|----------|-------------|
| `Header.txt` | Yes | Key-value metadata |
| `Input Log.txt` | Yes | Frame input data |
| `SyncSettings.json` | No | Emulator sync settings |
| `CoreFrameBuffer` | No | Screenshot |
| `Subtitles.txt` | No | Subtitle data |
| `Comments.txt` | No | User comments |
| `SaveRam` | No | SRAM data |
| `Greenzone/` | No | Savestate data |

#### Header.txt Format

Key-value pairs, one per line:
```
Key Value
```

Common keys:
| Key | Description |
|-----|-------------|
| `MovieVersion` | BK2 format version |
| `Author` | Movie author |
| `EmulatorVersion` | BizHawk version |
| `Platform` | System (NES, SNES, GB, etc.) |
| `GameName` | ROM filename |
| `SHA1` | ROM SHA1 hash |
| `Core` | Emulator core name |
| `rerecordCount` | Rerecord count |
| `StartsFromSavestate` | True/False |
| `StartsFromSaveram` | True/False |

#### Input Log Format

First line declares controller configuration:
```
[Input Log.txt]
```

Controller declaration line:
```
#Frame|Button1 Button2 ...|
```

Input lines:
```
|inputs for port1|inputs for port2|
```

#### SNES Input Mnemonics

```
UDLRsSYBAXlr
```

| Character | Button |
|-----------|--------|
| U | Up |
| D | Down |
| L | Left |
| R | Right |
| s | Select |
| S | Start |
| Y | Y |
| B | B |
| A | A |
| X | X |
| l | L shoulder |
| r | R shoulder |

#### NES Input Mnemonics

```
UDLRSsBA
```

| Character | Button |
|-----------|--------|
| U | Up |
| D | Down |
| L | Left |
| R | Right |
| S | Start |
| s | Select |
| B | B |
| A | A |

---

## Conversion Notes

### Lossless Conversions

The following conversions preserve all input data:
- SMV ↔ LSMV (same system, compatible buttons)
- SMV ↔ BK2 (SNES)
- LSMV ↔ BK2 (SNES)
- FM2 ↔ BK2 (NES)
- VBM ↔ BK2 (GB/GBC/GBA)

### Metadata Loss

Some metadata may be lost during conversion:
- Emulator-specific settings
- Savestate data (may not be portable)
- Timing-sensitive sync options
- Lua scripting data

### Timing Differences

Different emulators may have slightly different timing:
- NTSC: ~60.099 fps (varies by emulator)
- PAL: ~50.007 fps
- Game Boy: ~59.73 fps

Movies may desync when converted between emulators even with identical input.
