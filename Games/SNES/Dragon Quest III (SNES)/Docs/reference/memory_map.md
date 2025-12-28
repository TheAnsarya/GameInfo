# Dragon Quest III Memory Map Documentation
# Complete SNES memory layout and Dragon Quest III specific usage

## SNES Hardware Memory Layout

### System RAM (00:0000-00:1FFF)
```
$000000-$001FFF: System RAM (8KB)
  $000000-$0000FF: Direct Page (Zero Page) - CPU direct addressing
  $000100-$0001FF: Stack Page (6502 compatible stack)
  $000200-$001FFF: General Purpose RAM
```

### Hardware Registers (00:2000-00:7FFF)
```
$002000-$0020FF: Video/PPU registers
$002100-$002133: PPU registers (brightness, background, sprites)
$002134-$002136: PPU multiply/divide result registers
$002137-$00213F: PPU counters and status
$002140-$002143: APU communication registers
$002180-$002183: WRAM registers

$004000-$0041FF: Controller/Serial registers
$004200-$00421F: DMA, timers, and interrupt registers
$004300-$0043FF: DMA channel registers
```

### Cart RAM/ROM (00:6000-00:7FFF, 00:8000-00:FFFF)
```
$006000-$007FFF: Cartridge RAM (if present)
$008000-$00FFFF: ROM Bank 0 (32KB) - HiROM mapping
```

### Extended RAM (01:0000-01:FFFF)
```
$010000-$01FFFF: Extended System RAM (128KB total with bank 00)
```

### ROM Banks (C0:0000-FF:FFFF)
```
$C00000-$C07FFF: ROM Bank 00 (32KB) - Boot and vectors
$C08000-$C0FFFF: ROM Bank 01 (32KB) - Main engine
$C10000-$C17FFF: ROM Bank 02 (32KB) - Battle system
$C18000-$C1FFFF: ROM Bank 03 (32KB) - Menu system
...
$FF8000-$FFFFFF: ROM Bank 7F (32KB) - Headers and vectors
```

## Dragon Quest III Specific Memory Usage

### Game State RAM ($E000-$EFFF)
Based on boot code analysis showing hardware registers at $E0B2, $E0B4, $E0B6:

```
$00E000-$00E0FF: Core Game State
  $00E000: Current game mode (field/battle/menu/etc.)
  $00E001: Game flags and status
  $00E002: Random number seed
  $00E003: Frame counter (low byte)
  $00E004: Frame counter (high byte)
  $00E005-$00E00F: Reserved system variables

$00E010-$00E04F: Input and Control
  $00E010: Controller 1 current state
  $00E011: Controller 1 previous state
  $00E012: Controller 1 new button press
  $00E013: Controller 2 current state
  $00E014: Controller 2 previous state
  $00E015: Controller 2 new button press
  $00E016-$00E01F: Input timing and repeat
  $00E020-$00E04F: Menu cursor and navigation state

$00E050-$00E0AF: Graphics and Display
  $00E050: Screen fade level
  $00E051: Camera X position (low)
  $00E052: Camera X position (high)
  $00E053: Camera Y position (low)
  $00E054: Camera Y position (high)
  $00E055-$00E05F: Scroll and camera control
  $00E060-$00E07F: Sprite animation frames and timers
  $00E080-$00E09F: Background tile update queue
  $00E0A0-$00E0AF: Palette and color effects

$00E0B0-$00E0CF: Hardware Interface (from boot analysis)
  $00E0B0: Reserved
  $00E0B1: Reserved
  $00E0B2: Hardware register 1 (used in boot sequence)
  $00E0B3: Reserved
  $00E0B4: Hardware register 2 (used in boot sequence)
  $00E0B5: Reserved
  $00E0B6: Hardware register 3 (result storage in boot)
  $00E0B7-$00E0BF: Additional hardware interface
  $00E0C0-$00E0CF: System communication buffers

$00E0D0-$00E0FF: Audio and Sound
  $00E0D0: Music track number
  $00E0D1: Sound effect queue (8 slots)
  $00E0D9: Master volume
  $00E0DA-$00E0EF: Music state and channels
  $00E0F0-$00E0FF: Audio processing buffers
```

### Party and Character Data ($E100-$E3FF)
```
$00E100-$00E1FF: Hero/Main Character Data
  $00E100: Character level
  $00E101: Experience points (3 bytes)
  $00E104: Hit points current (2 bytes)
  $00E106: Hit points maximum (2 bytes)
  $00E108: Magic points current (2 bytes)
  $00E10A: Magic points maximum (2 bytes)
  $00E10C: Strength
  $00E10D: Agility
  $00E10E: Wisdom
  $00E10F: Vitality
  $00E110-$00E11F: Equipment (weapon, armor, accessories)
  $00E120-$00E13F: Spell list and magic learned
  $00E140-$00E15F: Status effects and conditions
  $00E160-$00E1FF: Character name and additional stats

$00E200-$00E2FF: Party Member 2 Data (same structure as hero)
$00E300-$00E3FF: Party Member 3 Data (same structure as hero)
$00E400-$00E4FF: Party Member 4 Data (same structure as hero)
```

### Inventory and Items ($E500-$E7FF)
```
$00E500-$00E5FF: Inventory Items
  $00E500-$00E53F: Item types (64 item slots)
  $00E540-$00E57F: Item quantities (64 quantities)
  $00E580-$00E59F: Gold amount (4 bytes) and item flags
  $00E5A0-$00E5FF: Special items and key items

$00E600-$00E6FF: Equipment Database
  $00E600-$00E63F: Weapon definitions
  $00E640-$00E67F: Armor definitions
  $00E680-$00E6BF: Accessory definitions
  $00E6C0-$00E6FF: Equipment stats lookup

$00E700-$00E7FF: Shop and Transaction Data
  $00E700-$00E73F: Current shop inventory
  $00E740-$00E77F: Shop prices and availability
  $00E780-$00E7BF: Transaction history
  $00E7C0-$00E7FF: Inn and service costs
```

### World and Map Data ($E800-$EAFF)
```
$00E800-$00E8FF: Current Map State
  $00E800: Current map ID
  $00E801: Map type (overworld/town/dungeon)
  $00E802: Hero X position on map
  $00E803: Hero Y position on map
  $00E804: Hero facing direction
  $00E805-$00E80F: Map scroll and camera position
  $00E810-$00E83F: NPC positions and states
  $00E840-$00E87F: Map objects and events
  $00E880-$00E8BF: Door and entrance states
  $00E8C0-$00E8FF: Map-specific variables and flags

$00E900-$00E9FF: World State and Progress
  $00E900-$00E93F: Story flags and progress markers
  $00E940-$00E97F: Town and NPC dialogue states
  $00E980-$00E9BF: Dungeon completion and key items
  $00E9C0-$00E9FF: Special events and triggers

$00EA00-$00EAFF: Battle and Encounter Data
  $00EA00: Random encounter rate
  $00EA01: Current battle background
  $00EA02-$00EA0F: Enemy formation data
  $00EA10-$00EA4F: Battle participant data (enemies)
  $00EA50-$00EA8F: Battle AI and behavior
  $00EA90-$00EAFF: Combat calculations and buffers
```

### Menu and Interface ($EB00-$ECFF)
```
$00EB00-$00EBFF: Menu System State
  $00EB00: Current menu type
  $00EB01: Menu cursor position X
  $00EB02: Menu cursor position Y
  $00EB03: Menu scroll offset
  $00EB04-$00EB0F: Menu navigation stack
  $00EB10-$00EB3F: Text rendering state
  $00EB40-$00EB7F: Window and dialog box state
  $00EB80-$00EBBF: Menu animation and effects
  $00EBC0-$00EBFF: User interface buffers

$00EC00-$00ECFF: Text and Dialog System
  $00EC00: Current text speed setting
  $00EC01: Dialog box position and size
  $00EC02-$00EC0F: Character printing state
  $00EC10-$00EC4F: Text buffer (current dialog)
  $00EC50-$00EC8F: Name entry and input
  $00EC90-$00ECCF: Text compression and lookup
  $00ECD0-$00ECFF: Font and character rendering
```

### Save Data and Persistence ($ED00-$EFFF)
```
$00ED00-$00EDFF: Save Game Buffer
  $00ED00-$00ED7F: Compressed party data for saving
  $00ED80-$00EDFF: Compressed world state for saving

$00EE00-$00EEFF: Checksum and Validation
  $00EE00-$00EE03: Save data checksum
  $00EE04-$00EE07: Data validation signature
  $00EE08-$00EE0F: Save slot information
  $00EE10-$00EEFF: Backup and recovery data

$00EF00-$00EFFF: System Configuration
  $00EF00: Music on/off setting
  $00EF01: Sound effects on/off setting
  $00EF02: Text speed setting
  $00EF03: Battle animation setting
  $00EF04-$00EF0F: User preferences
  $00EF10-$00EFFF: System variables and debug info
```

## ROM Bank Organization

### Boot and System (Banks 00-0F)
```
Bank 00 ($C00000-$C07FFF): Boot code and initialization
  $C00000-$C001FF: Reset and interrupt handlers
  $C00200-$C00FFF: System initialization routines
  $C01000-$C01FFF: Hardware setup and configuration
  $C02000-$C03FFF: Memory management and DMA
  $C04000-$C05FFF: Input handling and controllers
  $C06000-$C06FFF: Save/load system
  $C07000-$C07FFF: Debug and development tools

Bank 01-03 ($C08000-$C1FFFF): Main engine code
Bank 04-07 ($C20000-$C37FFF): Menu and interface systems
Bank 08-0B ($C38000-$C57FFF): Field and overworld logic
Bank 0C-0F ($C58000-$C77FFF): Battle system and AI
```

### Data Banks (Banks 10-3F)
```
Bank 10-1F ($C80000-$CFFFFF): Graphics and sprite data
Bank 20-2F ($D00000-$D7FFFF): Background and tile data
Bank 30-37 ($D80000-$DBFFFF): Audio data and music
Bank 38-3F ($DC0000-$DFFFFF): Text, dialog, and string data
```

### Extended Content (Banks 40-7F)
```
Bank 40-5F ($E00000-$EFFFFF): Additional graphics and animations
Bank 60-6F ($F00000-$F7FFFF): Map data and world layouts
Bank 70-7E ($F80000-$FF7FFF): Additional game content
Bank 7F ($FF8000-$FFFFFF): ROM header and interrupt vectors
```

## Hardware Register Usage

### PPU Registers Used by DQ3
```
$2100 INIDISP: Screen brightness control
$2101 OBSEL:   Sprite size and VRAM location
$2105 BGMODE:  Background mode (typically mode 1)
$2107-210A:   Background tilemap locations
$210B-210C:   Background character locations
$210D-2114:   Background scroll registers
$2115-2119:   VRAM access and data
$2121-2122:   Color palette access and data
```

### DMA Registers Used by DQ3
```
$4300-430A: DMA Channel 0 (graphics transfers)
$4310-431A: DMA Channel 1 (audio data)
$4320-432A: DMA Channel 2 (tilemap updates)
$420B MDMAEN: DMA enable register
```

### Audio Registers Used by DQ3
```
$2140-2143: APU communication ports
$2140: Music command register
$2141: Music parameter register
$2142: Sound effect trigger
$2143: Audio status register
```

This memory map provides the foundation for understanding Dragon Quest III's system organization and will be refined as we analyze more of the ROM code.
