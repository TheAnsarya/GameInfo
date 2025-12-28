# Dragon Quest III Technical Research Documentation

# # Overview
This document compiles comprehensive technical research about Dragon Quest III: Soshite Densetsu e... for the Super Nintendo Entertainment System. The information is gathered from multiple authoritative sources including DataCrystal, the GameInfo repository, and community reverse engineering efforts.

# # ROM Information

# ## Basic ROM Details
- **Title**: Dragon Quest III: Soshite Densetsu e...
- **System**: Super Nintendo Entertainment System (SNES)
- **Developer**: Heartbeat
- **Publisher**: Enix
- **Release Date**: December 6, 1996 (Japan)
- **ROM Size**: 4 MiB (4,194,304 bytes)
- **SRAM**: 8 KiB battery-backed save RAM
- **Memory Layout**: HiROM mapping
- **Speed**: FastROM (120ns)
- **Region**: Japan (NTSC)

# ## Known ROM Dumps
- **Primary CRC32**: `13836bd2` (verified good dump)
- **Internal Title**: `DRAGONQUEST3`
- **Revision**: 1.0
- **Header**: No copier header (512-byte header not present)

# # Memory Structure

# ## ROM Layout (HiROM Mapping)
The ROM uses HiROM memory mapping starting at `$c00000` in the SNES address space.

# ### Key ROM Sections
- **Character Classes**: `$c4179e - $c424a8` (3,339 bytes)
  - 9 character classes, 371 bytes each
  - Includes stat progressions, spells, equipment restrictions
- **Monster Data**: `$3ed964 - $3ee0db` (1,896 bytes)
  - 155 monsters with complete stat and behavior data
- **Dialog Font**: `$c151aa - $c152a3` (250 bytes)
  - 50 font structures, 5 bytes each
  - Includes width, height, and graphics pointers

# ## RAM Structure ($7e Bank)

# ### Party Member Data
Starting at `$7e3925`, each party member uses `$3c` (60) bytes:
- **Hero**: `$7e3925 - $7e3960`
- **Party Member 2**: `$7e3961 - $7e399c`
- **Party Member 3**: `$7e399d - $7e39d8`
- **Party Member 4**: `$7e39d9 - $7e3a14`
- Additional slots continue up to 18 total party members

# ### Player Data Structure (per member)
| Offset | Size | Description |
|--------|------|-------------|
| $00-$01 | word | Current HP |
| $02-$03 | word | Maximum HP |
| $04-$05 | word | Current MP |
| $06-$07 | word | Maximum MP |
| $08 | byte | Attack Power |
| $09 | byte | Defense Power |
| $0a | byte | Agility |
| $0b | byte | Wisdom |
| $0c | byte | Luck |
| $0d | byte | Level |
| $0e-$10 | 3 bytes | Experience Points |
| $11-$15 | 5 bytes | Stat carryover values |
| $16-$1a | 5 bytes | Character name (4 chars + $ac terminator) |
| $1b-$20 | 6 bytes | Unknown/padding |
| $21 | byte | Character class |
| $22 | byte | Menu cursor position |
| $23 | byte | Battle cursor position |
| $24-$2d | 10 bytes | Spell list |
| $2e | byte | Bag item count |
| $2f-$3b | 13 bytes | Additional data |

# ### Game State Data
- **Gold**: `$7e3696` (long, 4 bytes)
- **Item Bag**: `$7e3725 - $7e3824` (256 bytes for item IDs)
- **Item Quantities**: `$7e3825 - $7e3924` (256 bytes for quantities)

# # Text and Graphics Systems

# ## Text Encoding
The game uses a custom text encoding system with the following characteristics:
- **String Terminator**: `$ac` marks end of text strings
- **Character Width**: Variable width font system
- **Compression**: Text uses dictionary-based compression

# ### Character Set Mapping (Sample)
| Hex | Character | Hex | Character | Hex | Character |
|-----|-----------|-----|-----------|-----|-----------|
| $01 | A | $1b | a | $87 | 0 |
| $02 | B | $1c | b | $88 | 1 |
| $03 | C | $1d | c | $89 | 2 |
| ... | ... | ... | ... | ... | ... |

# ## Font System
Dialog fonts are stored as compressed graphics with associated metadata:
- **Group Size**: 12-bit value indicating number of characters
- **Width**: 4-bit character width in pixels
- **Height**: 4-bit character height in pixels
- **Graphics Offset**: 16-bit pointer to compressed graphics data

# # Game Data Structures

# ## Character Classes
The game supports 9 character classes, each with detailed progression data:

| ID | Class | Description |
|----|-------|-------------|
| $00 | Warrior | Physical combat specialist |
| $01 | Fighter | Balanced combat character |
| $02 | Mage | Magic user, offensive spells |
| $03 | Cleric | Healing and support magic |
| $04 | Dealer | Item and money specialist |
| $05 | Jester | Unpredictable abilities |
| $06 | Thief | Stealth and utility skills |
| $07 | Sage | Advanced magic user |
| $08 | Hero | Protagonist with unique abilities |

# ## Monster Data
155 monsters are defined with comprehensive battle data:
- **Basic Stats**: HP, MP, Attack, Defense, Agility, Wisdom, Luck
- **Resistances**: 14 different resistance types (2 bits each)
- **Special Flags**: Metal monster designation, behavior flags
- **Name Data**: Variable-length Japanese names with $ac terminator

# ## Items System
The game supports 228 different items ($01-$e4):
- **Weapons**: Swords, clubs, boomerangs, whips, etc.
- **Armor**: Shields, helmets, clothing, accessories
- **Tools**: Consumables, quest items, special items
- **Books**: Spell books and reference materials

# # Compression and Graphics

# ## Graphics Compression
The game uses multiple compression schemes:
- **Font Graphics**: Custom compression for dialog fonts
- **Tilemap Data**: Run-length and dictionary compression
- **Sprite Graphics**: Planar graphics with palette mapping

# ## Audio System
- **Sound Engine**: Custom audio driver
- **Music Format**: Compressed sequence data
- **Sample Data**: PCM samples for sound effects

# # Hardware Interface

# ## Graphics Registers
The game directly manipulates SNES PPU registers for:
- **Background Layers**: Mode 1 with 3 background layers
- **Sprites**: 128 sprite limit, multiple sizes
- **Palettes**: 256 colors across multiple palettes
- **HDMA**: Horizontal blanking effects

# ## Input Handling
- **Controller 1**: Primary player input
- **Controller 2**: Optional second player (limited)
- **Special Input**: Hold button combinations for debug features

# # Debugging and Development

# ## Mesen-S Integration
The project includes symbol files for the Mesen-S debugger:
- **Memory Labels**: Named addresses for important RAM locations
- **Breakpoint Sets**: Pre-configured debugging breakpoints
- **Watch Lists**: Important variables for monitoring

# ## Debug Features
Several debug features are present in the ROM:
- **Debug Menus**: Accessible through button combinations
- **Memory Viewers**: Built-in RAM inspection tools
- **Event Flags**: Debugging flags for story progression

# # Research Sources

# ## Primary Sources
1. **DataCrystal Wiki**: [Dragon Quest III SNES](https://datacrystal.romhacking.net/wiki/Dragon_Quest_III:_Soshite_Densetsu_e...)
   - ROM structure documentation
   - Memory mapping details
   - Compression analysis

2. **GameInfo Repository**: [TheAnsarya/GameInfo](https://github.com/TheAnsarya/GameInfo/tree/main/Dragon%20Quest%20III%20(SNES))
   - Comprehensive RAM maps
   - Character class data
   - Monster databases
   - Text encoding tables
   - Debugger symbol files

3. **Community Research**:
   - ROM hacking community contributions
   - Disassembly projects
   - Translation tools and documentation

# ## Tools and Utilities
- **Dragon Quest III Tools**: Font dumpers and analyzers
- **Asar Assembler**: For rebuilding modified ROMs
- **Hex Editors**: For direct ROM examination
- **Debuggers**: Mesen-S, bsnes-plus for runtime analysis

# # Research Notes

# ## Open Questions
1. **Compression Algorithm**: Exact details of graphics compression
2. **Audio Format**: Complete specification of music/SFX format
3. **Story Scripting**: Event system and script format
4. **Save Data**: Complete save file structure
5. **Unused Content**: Cut content and debug features

# ## Future Research Directions
1. **Complete Disassembly**: Full assembly source reconstruction
2. **Tool Development**: Better analysis and modification tools
3. **Translation Support**: Enhanced localization capabilities
4. **Emulation Accuracy**: Perfect cycle-accurate emulation
5. **Documentation**: Complete technical specifications

---

*This document is continuously updated as new research findings are discovered. Last updated: December 2024*
