# TAS Movie File Format Specifications

This document provides comprehensive specifications for all TAS (Tool-Assisted Speedrun) movie file formats supported by the GameInfo TAS converter.

## Format Support Matrix

| Format | Extension | Emulator | System | Read | Write |
|--------|-----------|----------|--------|------|-------|
| BK2 | `.bk2` | BizHawk | Multi | ✅ | ✅ |
| BKM | `.bkm` | BizHawk (legacy) | Multi | ✅ | ❌ |
| SMV | `.smv` | Snes9x | SNES | ✅ | ✅ |
| LSMV | `.lsmv` | lsnes | SNES | ✅ | ❌ |
| MMO | `.mmo` | Mesen2 | Multi | ❌ | ✅ |
| FM2 | `.fm2` | FCEUX | NES | ✅ | ✅ |
| FCM | `.fcm` | FCEU | NES | ✅ | ❌ |
| FMV | `.fmv` | Famtasia | NES | ✅ | ❌ |
| VBM | `.vbm` | VisualBoyAdvance | GB/GBA | ✅ | ✅ |
| GMV | `.gmv` | Gens | Genesis | ✅ | ✅ |
| MMV | `.mmv` | Dega | SMS/GG | ✅ | ✅ |
| DSM | `.dsm` | DeSmuME | NDS | ✅ | ❌ |
| MC2 | `.mc2` | PCEjin/Mednafen | PCE | ✅ | ❌ |
| PXM | `.pxm` | PCSX | PSX | ✅ | ❌ |
| PJM | `.pjm` | PSXjin | PSX | ✅ | ❌ |
| YMV | `.ymv` | Yabause | Saturn | ✅ | ❌ |
| LMP | `.lmp` | Doom | DOS | ✅ | ❌ |

---

## SNES Formats

### SMV (Snes9x)

**Type:** Binary  
**Emulator:** Snes9x  
**System:** SNES

#### Header Structure (Version 1.51+)

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0x00 | 4 | Signature | `SMV\x1a` |
| 0x04 | 4 | Version | Version number (1, 4, 5) |
| 0x08 | 4 | UID | Unique ID (usually timestamp) |
| 0x0C | 4 | RerecordCount | Number of rerecords |
| 0x10 | 4 | FrameCount | Total frames in movie |
| 0x14 | 1 | ControllerFlags | Which controllers connected |
| 0x15 | 1 | MovieFlags | Movie options |
| 0x16 | 1 | SyncFlags | Sync options |
| 0x17 | 1 | SyncFlags2 | Additional sync options |
| 0x18 | 4 | SavestateOffset | Offset to savestate (0 = power-on) |
| 0x1C | 4 | ControllerDataOffset | Offset to controller data |

#### Controller Data (per frame, per controller)

2 bytes per controller:
- **Low byte:** `BYsSUDLR` (B=0x80, Y=0x40, Select=0x20, Start=0x10, Up=0x08, Down=0x04, Left=0x02, Right=0x01)
- **High byte:** `AXLR----` (A=0x80, X=0x40, L=0x20, R=0x10)

### LSMV (lsnes)

**Type:** ZIP Archive  
**Emulator:** lsnes  
**System:** SNES

#### Archive Contents

| File | Description |
|------|-------------|
| `input` | Frame input data |
| `gametype` | System type (e.g., `snes_ntsc`) |
| `gamename` | ROM name |
| `authors` | Author information |
| `rerecords` | Rerecord count |
| `coreversion` | Core version |
| `projectid` | Project identifier |
| `rom.sha256` | ROM hash |

#### Input Format

Text-based, one line per frame:
```
F. 0 0|BYsSudlrAXLR....|...
```

Button positions (16 chars per controller):
`BYsSudlrAXLR----`

---

## NES Formats

### FM2 (FCEUX)

**Type:** Text  
**Emulator:** FCEUX  
**System:** NES

#### File Structure

```
version 3
emuVersion 20500
rerecordCount 1234
palFlag 0
romFilename Game.nes
romChecksum md5:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
guid XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
fourscore 0
microphone 0
port0 1
port1 1
port2 0
|0|RLDUTSBA|........|
```

#### Input Format

Per-frame format: `|flags|port0|port1|`

- **flags:** Reset/soft reset commands
- **port0/port1:** 8 characters each: `RLDUTSBA`
  - R=Right, L=Left, D=Down, U=Up, T=Start, S=Select, B=B, A=A

### FCM (FCEU)

**Type:** Binary  
**Emulator:** FCEU (legacy)  
**System:** NES

#### Header Structure

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0x00 | 4 | Signature | `FCM\x1a` |
| 0x04 | 4 | Version | Always 2 |
| 0x08 | 1 | Flags | Movie flags |
| 0x09 | 1 | Reserved | Reserved |
| 0x0A | 1 | Reserved | Reserved |
| 0x0B | 1 | Reserved | Reserved |
| 0x0C | 4 | FrameCount | Total frames |
| 0x10 | 4 | RerecordCount | Rerecords |
| 0x14 | 4 | MovieDataSize | Size of input data |
| 0x18 | 4 | SavestateOffset | Offset to savestate |
| 0x1C | 4 | MovieDataOffset | Offset to input data |
| 0x20 | 16 | MD5 | ROM MD5 hash |
| 0x30 | 4 | EmuVersion | Emulator version |

#### Controller Data

Delta-encoded button changes. Each update is 1-4 bytes depending on which controller and buttons changed.

### FMV (Famtasia)

**Type:** Binary  
**Emulator:** Famtasia  
**System:** NES

#### Header Structure

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0x00 | 4 | Signature | `FMV\x1a` |
| 0x04 | 1 | Flags | Movie flags |
| 0x05 | 8 | Reserved | Reserved |

#### Controller Data

1 byte per frame per active controller:
- Bits: `ABSTUDLR` (A=0x80, B=0x40, Select=0x20, Start=0x10, Up=0x08, Down=0x04, Left=0x02, Right=0x01)

---

## Game Boy / GBA Formats

### VBM (VisualBoyAdvance)

**Type:** Binary  
**Emulator:** VisualBoyAdvance / VBA-M  
**System:** GB, GBC, SGB, GBA

#### Header Structure

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0x00 | 4 | Signature | `VBM\x1a` |
| 0x04 | 4 | MajorVersion | Major version (1) |
| 0x08 | 4 | MovieUID | Unique ID |
| 0x0C | 4 | FrameCount | Total frames |
| 0x10 | 4 | RerecordCount | Rerecords |
| 0x14 | 1 | StartFlags | Start conditions |
| 0x15 | 1 | ControllerFlags | Controller config |
| 0x16 | 1 | SystemFlags | System type |
| 0x17 | 1 | Reserved | Reserved |
| 0x18 | 4 | WinSaveType | Save type |
| 0x1C | 4 | WinFlashSize | Flash size |
| 0x20 | 4 | GBEmulatorType | GB emulator type |
| 0x24 | 12 | ROMTitle | Internal ROM title |
| 0x30 | 1 | MinorVersion | Minor version |
| 0x31 | 1 | ROMGameCode | Game code |
| 0x32 | 2 | Reserved | Reserved |
| 0x34 | 4 | ROMCRC | ROM CRC |
| 0x38 | 2 | ROMChecksum | ROM checksum |

#### System Flags

- `0x01` = GBA
- `0x02` = GBC
- `0x04` = SGB

#### Controller Data

**GB/GBC:** 2 bytes per frame
- **Low byte:** `----DUTS` (Down=0x08, Up=0x04, Start=0x02, Select=0x01)
- **High byte (bit 0-3):** `RLBA` (Right=0x01, Left=0x02, B=0x04, A=0x08)

**GBA:** 2 bytes per frame
- Bits: `--LRSTUD RLBA----`
- L=0x0200, R=0x0100, Select=0x04, Start=0x08, Up=0x40, Down=0x80, Left=0x20, Right=0x10, A=0x01, B=0x02

---

## Sega Formats

### GMV (Gens)

**Type:** Binary  
**Emulator:** Gens  
**System:** Genesis/Mega Drive

#### Header Structure

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0x00 | 16 | Signature | `Gens Movie TEST9` |
| 0x10 | 4 | RerecordCount | Rerecords |
| 0x14 | 2 | ControllerConfig | Controller setup |
| 0x16 | 2 | Flags | Movie flags |
| 0x18 | 40 | ROMName | Game name |
| 0x40 | - | FrameData | Controller data |

#### Controller Data

3 bytes per frame (3-button) or 4 bytes per frame (6-button):
- **3-button:** `SACBRLDU` (Start=0x80, A=0x40, C=0x20, B=0x10, Right=0x08, Left=0x04, Down=0x02, Up=0x01)
- **6-button:** Adds Mode, X, Y, Z buttons

### MMV (Dega)

**Type:** Binary  
**Emulator:** Dega  
**System:** Sega Master System / Game Gear

#### Header Structure

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0x00 | 4 | Signature | `MMV\0` |
| 0x04 | 4 | Version | Version (0 or 1) |
| 0x08 | 4 | FrameCount | Total frames |
| 0x0C | 4 | RerecordCount | Rerecords |
| 0x10 | 4 | FPS | Frames per second |
| 0x14 | 4 | Reserved | Reserved |
| 0x18 | 32 | Author | Author name |
| 0x38 | 64 | ROMName | ROM filename |

#### Controller Data

2 bytes per frame (one per port):
- SMS: `--21RLDU` (Button2=0x20, Button1=0x10, Right=0x08, Left=0x04, Down=0x02, Up=0x01)
- GG: Same format plus Start button

### YMV (Yabause)

**Type:** Binary  
**Emulator:** Yabause  
**System:** Sega Saturn

#### Header Structure

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0x00 | 4 | Signature | `YMV\0` |
| 0x04 | 4 | Version | Version number |
| 0x08 | 4 | FrameCount | Total frames |
| 0x0C | 4 | RerecordCount | Rerecords |

#### Controller Data

4 bytes per frame per controller:
Saturn controller has many buttons: Up, Down, Left, Right, A, B, C, X, Y, Z, L, R, Start

---

## PlayStation Formats

### PXM (PCSX)

**Type:** Binary  
**Emulator:** PCSX  
**System:** PlayStation

#### Header Structure

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0x00 | 4 | Signature | `PXM ` |
| 0x04 | 4 | Version | Version |
| 0x08 | 4 | Flags | Movie flags |
| 0x0C | 4 | Reserved | Reserved |
| 0x10 | 4 | FrameCount | Total frames |
| 0x14 | 4 | RerecordCount | Rerecords |

#### Controller Data

2 bytes per controller per frame:
PSX buttons: Select, L3, R3, Start, Up, Right, Down, Left, L2, R2, L1, R1, Triangle, Circle, Cross, Square

### PJM (PSXjin)

**Type:** Binary  
**Emulator:** PSXjin  
**System:** PlayStation

Similar to PXM format with minor header differences.

---

## Other Formats

### DSM (DeSmuME)

**Type:** Text  
**Emulator:** DeSmuME  
**System:** Nintendo DS

#### File Structure

```
version 1
emuVersion 9.7.0
romFilename Game.nds
romSerial XXX
romChecksum XXXXXXXXXXXXXXXX
rerecordCount 1234
|0|0|TSBARLDU|
```

#### Input Format

`|touch|mic|buttons|`
- Touch: X,Y coordinates or 0
- Mic: Microphone state
- Buttons: `TSBARLDU` plus X, Y, L, R, Start, Select, Debug, Lid

### MC2 (PCEjin/Mednafen)

**Type:** Binary  
**Emulator:** PCEjin / Mednafen  
**System:** PC Engine / TurboGrafx-16

#### Header Structure

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0x00 | 4 | Signature | `MC2 ` or `MCNX` |
| 0x04 | 4 | Version | Version |
| 0x08 | 4 | FrameCount | Total frames |
| 0x0C | 4 | RerecordCount | Rerecords |

#### Controller Data

2 bytes per controller:
PCE buttons: I, II, Select, Run, Up, Down, Left, Right

### LMP (Doom/Heretic/Hexen)

**Type:** Binary  
**Emulator:** Doom/Heretic/Hexen  
**System:** DOS

#### Header Structure

Doom demo format varies by version. Common format:

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0x00 | 1 | Version | Demo version |
| 0x01 | 1 | Skill | Skill level |
| 0x02 | 1 | Episode | Episode number |
| 0x03 | 1 | Map | Map number |

#### Input Format

4 bytes per tic:
- Forward/backward movement (signed byte)
- Strafe movement (signed byte)
- Turn angle (signed byte)
- Button bits (weapon change, use, fire)

---

## BizHawk Formats

### BK2 (BizHawk Current)

**Type:** ZIP Archive  
**Emulator:** BizHawk  
**System:** Multi-system

#### Archive Contents

| File | Required | Description |
|------|----------|-------------|
| `Header.txt` | Yes | Key-value metadata |
| `Input Log.txt` | Yes | Frame input data |
| `SyncSettings.json` | Yes | Emulator sync settings |
| `Comments.txt` | No | Author comments |
| `Subtitles.txt` | No | Subtitles |
| `*.bin` | No | Savestate data |

#### Header.txt Format

```
MovieVersion BizHawk v2.0.0
Author AuthorName
rerecordCount 1234
emuVersion Version 2.9.1
Platform SNES
GameName Game Title
SHA1 HASH
Core BSNES
```

#### Input Log.txt Format

```
[Input]
LogKey:#Reset|Power|#P1 Up|P1 Down|...
|..|UDLRsSYBXAlr|
|..|UDLRsSYBXAlr|
```

Button characters vary by system:
- **SNES:** `UDLRsSYBXAlr` (12 chars) - lowercase s=Select, l=L, r=R
- **NES:** `RLDUTSBA` (8 chars)
- **Genesis:** `UDLRSACBXYZm` (varies)
- **GB:** `UDLRsSBA` (8 chars)
- **GBA:** `UDLRsSBAlr` (10 chars)

### BKM (BizHawk Legacy)

**Type:** Text  
**Emulator:** BizHawk (old versions)  
**System:** Multi-system

#### File Structure

```
[Input]
|.|UDLR|...|
```

Similar to BK2 but plain text file, not zipped.

---

## Cross-System Conversion

### Compatible Conversions

Since different systems have different button sets, conversions are only fully compatible within the same system:

| Source System | Target Formats |
|---------------|----------------|
| SNES | SMV, LSMV, BK2, BKM, MMO |
| NES | FM2, FCM, FMV, BK2, BKM, MMO |
| GB/GBA | VBM, BK2, BKM, MMO |
| Genesis | GMV, BK2, BKM, MMO |
| SMS/GG | MMV, BK2, BKM |
| PSX | PXM, PJM, BK2, BKM |
| Saturn | YMV, BK2 |
| PCE | MC2, BK2 |
| NDS | DSM, BK2 |

### Button Mapping Tables

#### SNES Buttons
| Internal | SMV | BK2 | LSMV |
|----------|-----|-----|------|
| Up | 0x0008 | U | u |
| Down | 0x0004 | D | d |
| Left | 0x0002 | L | l |
| Right | 0x0001 | R | r |
| A | 0x8000 | A | A |
| B | 0x0080 | B | B |
| X | 0x4000 | X | X |
| Y | 0x0040 | Y | Y |
| L | 0x2000 | l | L |
| R | 0x1000 | r | R |
| Start | 0x0010 | S | S |
| Select | 0x0020 | s | s |

#### NES Buttons
| Internal | FM2 | FCM | VBM |
|----------|-----|-----|-----|
| Up | U | 0x10 | 0x04 |
| Down | D | 0x20 | 0x08 |
| Left | L | 0x40 | - |
| Right | R | 0x80 | - |
| A | A | 0x01 | 0x08 |
| B | B | 0x02 | 0x04 |
| Start | T | 0x08 | 0x02 |
| Select | S | 0x04 | 0x01 |

---

## References

- [TASVideos Format Documentation](https://tasvideos.org/EmulatorResources)
- [BizHawk Source Code](https://github.com/TASEmulators/BizHawk)
- [FCEUX Documentation](https://fceux.com/web/FM2.html)
- [Snes9x Source Code](https://github.com/snes9xgit/snes9x)
