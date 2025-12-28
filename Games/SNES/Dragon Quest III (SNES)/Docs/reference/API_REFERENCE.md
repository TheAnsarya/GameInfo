# Dragon Quest III ROM Analysis Toolkit - API Reference

## Module Index

- [comprehensive_rom_analyzer](#comprehensive_rom_analyzer)
- [enhanced_graphics_analyzer](#enhanced_graphics_analyzer)
- [snes_disassembler](#snes_disassembler)
- [snes_audio_analyzer](#snes_audio_analyzer)
- [dq3_game_data_extractor](#dq3_game_data_extractor)
- [interactive_rom_browser](#interactive_rom_browser)
- [advanced_rom_editor](#advanced_rom_editor)
- [performance_optimizer](#performance_optimizer)

---

## comprehensive_rom_analyzer

### `class ComprehensiveROMAnalyzer`

Main ROM analysis engine for comprehensive ROM structure analysis.

#### `__init__(self, rom_path: str)`
Initialize analyzer with ROM file path.

**Parameters:**
- `rom_path`: Path to ROM file

**Raises:**
- `FileNotFoundError`: If ROM file doesn't exist

#### `load_rom_data(self) -> bytes`
Load ROM data from file.

**Returns:**
- `bytes`: Complete ROM data

#### `hirom_to_pc_address(self, hirom_address: int) -> int`
Convert HiROM address to PC file offset.

**Parameters:**
- `hirom_address`: SNES HiROM address ($C00000-$FFFFFF)

**Returns:**
- `int`: PC file offset

#### `pc_to_hirom_address(self, pc_offset: int) -> int`
Convert PC file offset to HiROM address.

**Parameters:**
- `pc_offset`: File offset

**Returns:**
- `int`: SNES HiROM address

#### `read_bank(self, bank: int) -> bytes`
Read entire bank data.

**Parameters:**
- `bank`: Bank number (0-63)

**Returns:**
- `bytes`: Bank data (65536 bytes)

#### `analyze_hirom_banks(self) -> List[Dict[str, Any]]`
Analyze all HiROM banks for content types.

**Returns:**
- `List[Dict]`: Bank analysis results containing:
  - `bank`: Bank number
  - `entropy`: Data entropy (0.0-1.0)
  - `data_type`: Detected data type
  - `confidence`: Detection confidence
  - `size`: Bank size in bytes

#### `find_graphics_data(self, bank: Optional[int] = None) -> Dict[str, Any]`
Find graphics data in ROM.

**Parameters:**
- `bank`: Optional bank to search in

**Returns:**
- `Dict`: Graphics analysis containing:
  - `candidates`: List of graphics candidates
  - `confidence`: Overall confidence score
  - `total_found`: Number of candidates found

#### `get_entropy_analysis(self, offset: int, size: int) -> Dict[str, float]`
Calculate entropy metrics for data region.

**Parameters:**
- `offset`: Start offset
- `size`: Data size

**Returns:**
- `Dict`: Entropy metrics:
  - `entropy`: Shannon entropy
  - `max_entropy`: Maximum possible entropy
  - `normalized`: Normalized entropy (0.0-1.0)

#### `detect_code_regions(self) -> List[Dict[str, Any]]`
Detect regions containing 65816 code.

**Returns:**
- `List[Dict]`: Code region information:
  - `offset`: Region start offset
  - `size`: Region size
  - `confidence`: Code detection confidence
  - `instructions`: Sample instruction count

---

## enhanced_graphics_analyzer

### `class EnhancedGraphicsAnalyzer`

Advanced graphics data detection and analysis.

#### `__init__(self, rom_path: str)`
Initialize graphics analyzer.

**Parameters:**
- `rom_path`: Path to ROM file

#### `find_graphics_candidates(self) -> List[Dict[str, Any]]`
Find potential graphics data throughout ROM.

**Returns:**
- `List[Dict]`: Graphics candidates:
  - `offset`: Data offset
  - `format`: Detected format (2BPP/4BPP/8BPP)
  - `width`: Estimated width
  - `height`: Estimated height
  - `confidence`: Detection confidence
  - `colors`: Estimated color count

#### `analyze_palette_data(self, offset: int) -> Dict[str, Any]`
Analyze palette data at offset.

**Parameters:**
- `offset`: Palette data offset

**Returns:**
- `Dict`: Palette analysis:
  - `colors`: Number of colors
  - `format`: Color format (RGB555/etc)
  - `unique_colors`: Count of unique colors
  - `brightness`: Average brightness

#### `detect_tile_format(self, data: bytes) -> Dict[str, Any]`
Detect tile format from raw data.

**Parameters:**
- `data`: Raw tile data

**Returns:**
- `Dict`: Format detection:
  - `format`: Detected format
  - `bpp`: Bits per pixel
  - `tile_size`: Tile dimensions
  - `confidence`: Detection confidence

#### `extract_sprite_data(self, offset: int, width: int, height: int) -> bytes`
Extract sprite data in standard format.

**Parameters:**
- `offset`: Sprite data offset
- `width`: Sprite width in pixels
- `height`: Sprite height in pixels

**Returns:**
- `bytes`: Extracted sprite data

---

## snes_disassembler

### `class SNESDisassembler`

65816 processor disassembler with full instruction set support.

#### `__init__(self)`
Initialize disassembler with complete instruction tables.

#### `disassemble_range(self, rom_data: bytes, start_offset: int, size: int) -> List[Dict[str, Any]]`
Disassemble code in specified range.

**Parameters:**
- `rom_data`: ROM data
- `start_offset`: Start offset
- `size`: Number of bytes to disassemble

**Returns:**
- `List[Dict]`: Disassembled instructions:
  - `address`: Instruction address
  - `opcode`: Raw opcode byte
  - `mnemonic`: Instruction name
  - `operand`: Operand string
  - `bytes`: Instruction bytes
  - `size`: Instruction size

#### `analyze_code_flow(self, instructions: List[Dict]) -> Dict[str, Any]`
Analyze code flow and control structures.

**Parameters:**
- `instructions`: Disassembled instructions

**Returns:**
- `Dict`: Flow analysis:
  - `entry_points`: Code entry points
  - `subroutines`: Detected subroutines
  - `jump_targets`: Jump/branch targets
  - `data_references`: Data access points

#### `find_subroutines(self, instructions: List[Dict]) -> List[Dict[str, Any]]`
Find subroutine boundaries.

**Parameters:**
- `instructions`: Disassembled instructions

**Returns:**
- `List[Dict]`: Subroutine information:
  - `start`: Subroutine start address
  - `end`: Subroutine end address
  - `size`: Size in bytes
  - `calls`: Number of calls to this routine

#### `get_instruction_info(self, opcode: int) -> Dict[str, Any]`
Get detailed instruction information.

**Parameters:**
- `opcode`: 65816 opcode (0-255)

**Returns:**
- `Dict`: Instruction details:
  - `mnemonic`: Instruction name
  - `addressing_mode`: Addressing mode
  - `size`: Instruction size
  - `cycles`: Clock cycles
  - `flags`: Affected processor flags

---

## snes_audio_analyzer

### `class SNESAudioAnalyzer`

SNES APU audio system analysis and BRR sample detection.

#### `__init__(self, rom_path: str)`
Initialize audio analyzer.

**Parameters:**
- `rom_path`: Path to ROM file

#### `find_brr_samples(self) -> List[Dict[str, Any]]`
Find BRR audio samples in ROM.

**Returns:**
- `List[Dict]`: BRR sample information:
  - `offset`: Sample offset in ROM
  - `size`: Sample size in bytes
  - `loop_start`: Loop start block
  - `has_loop`: Whether sample loops
  - `confidence`: Detection confidence

#### `analyze_brr_sample(self, offset: int, size: int) -> Dict[str, Any]`
Analyze individual BRR sample.

**Parameters:**
- `offset`: Sample offset
- `size`: Sample size

**Returns:**
- `Dict`: Sample analysis:
  - `blocks`: Number of BRR blocks
  - `duration_ms`: Estimated duration
  - `loop_type`: Loop type (none/forward/bidirectional)
  - `quality_score`: Audio quality estimate

#### `analyze_music_sequences(self) -> List[Dict[str, Any]]`
Find and analyze music sequence data.

**Returns:**
- `List[Dict]`: Music sequence information:
  - `offset`: Sequence offset
  - `channels`: Number of channels
  - `length`: Sequence length
  - `tempo`: Estimated tempo

#### `detect_audio_driver(self) -> Dict[str, Any]`
Detect audio driver type and version.

**Returns:**
- `Dict`: Audio driver information:
  - `type`: Driver type
  - `version`: Driver version
  - `features`: Supported features
  - `offset`: Driver code offset

#### `extract_sample_data(self, offset: int, size: int) -> bytes`
Extract raw BRR sample data.

**Parameters:**
- `offset`: Sample offset
- `size`: Sample size

**Returns:**
- `bytes`: Raw BRR data

---

## dq3_game_data_extractor

### `class DQ3GameDataExtractor`

Dragon Quest III specific game data extraction.

#### `__init__(self, rom_data: Union[str, bytes])`
Initialize extractor with ROM data.

**Parameters:**
- `rom_data`: ROM file path or raw data

### Data Classes

#### `@dataclass Character`
Character data structure.

**Fields:**
- `offset: int` - Data offset in ROM
- `character_id: int` - Character ID
- `hp: int` - Hit points
- `mp: int` - Magic points
- `level: int` - Character level
- `strength: int` - Strength stat
- `agility: int` - Agility stat
- `resilience: int` - Resilience stat
- `wisdom: int` - Wisdom stat
- `confidence: float` - Data confidence

#### `@dataclass Item`
Item data structure.

**Fields:**
- `offset: int` - Data offset in ROM
- `item_id: int` - Item ID
- `type: str` - Item type
- `buy_price: int` - Purchase price
- `sell_price: int` - Sale price
- `attack_power: int` - Attack bonus
- `defense_power: int` - Defense bonus
- `confidence: float` - Data confidence

#### `@dataclass Monster`
Monster data structure.

**Fields:**
- `offset: int` - Data offset in ROM
- `monster_id: int` - Monster ID
- `hp: int` - Hit points
- `attack: int` - Attack power
- `defense: int` - Defense power
- `agility: int` - Agility stat
- `exp_reward: int` - Experience points
- `gold_reward: int` - Gold reward
- `confidence: float` - Data confidence

### Methods

#### `find_character_data(self, start_bank: int = 8) -> List[Character]`
Extract character data from ROM.

**Parameters:**
- `start_bank`: Bank to start searching from

**Returns:**
- `List[Character]`: Found character data

#### `find_item_data(self, start_bank: int = 16) -> List[Item]`
Extract item data from ROM.

**Parameters:**
- `start_bank`: Bank to start searching from

**Returns:**
- `List[Item]`: Found item data

#### `find_monster_data(self, start_bank: int = 24) -> List[Monster]`
Extract monster data from ROM.

**Parameters:**
- `start_bank`: Bank to start searching from

**Returns:**
- `List[Monster]`: Found monster data

#### `find_spell_data(self) -> List[Dict[str, Any]]`
Extract spell/magic data.

**Returns:**
- `List[Dict]`: Spell information

#### `find_location_data(self) -> List[Dict[str, Any]]`
Extract location/map data.

**Returns:**
- `List[Dict]`: Location information

---

## interactive_rom_browser

### `class InteractiveROMBrowser`

Flask-based web interface for ROM exploration.

#### `__init__(self, rom_path: str, host: str = '127.0.0.1', port: int = 5000)`
Initialize web browser interface.

**Parameters:**
- `rom_path`: Path to ROM file
- `host`: Web server host
- `port`: Web server port

#### `run(self, debug: bool = False)`
Start web server.

**Parameters:**
- `debug`: Enable Flask debug mode

### Web API Endpoints

#### `GET /api/rom/info`
Get ROM file information.

**Response:**
```json
{
    "filename": "rom.smc",
    "size": 6291456,
    "checksum": "ABC123...",
    "header": {
        "title": "DRAGON QUEST III",
        "region": "Japan",
        "version": "1.0"
    }
}
```

#### `GET /api/graphics/gallery`
Get graphics gallery data.

**Parameters:**
- `page` (query): Page number
- `limit` (query): Items per page

**Response:**
```json
{
    "graphics": [
        {
            "offset": "0x80000",
            "format": "4BPP",
            "width": 16,
            "height": 16,
            "preview": "data:image/png;base64,..."
        }
    ],
    "total": 150,
    "page": 1
}
```

#### `GET /api/disassembly`
Get disassembly data.

**Parameters:**
- `offset` (query): Start offset
- `size` (query): Number of bytes

**Response:**
```json
{
    "instructions": [
        {
            "address": "0x8000",
            "opcode": "A9",
            "mnemonic": "LDA",
            "operand": "#$00",
            "bytes": "A9 00"
        }
    ]
}
```

#### `GET /api/gamedata/characters`
Get character data.

**Response:**
```json
{
    "characters": [
        {
            "id": 0,
            "hp": 50,
            "mp": 20,
            "level": 1,
            "stats": {...}
        }
    ]
}
```

#### `GET /api/gamedata/items`
Get item data.

**Response:**
```json
{
    "items": [
        {
            "id": 1,
            "type": "weapon",
            "buy_price": 100,
            "attack": 5
        }
    ]
}
```

#### `GET /api/gamedata/monsters`
Get monster data.

**Response:**
```json
{
    "monsters": [
        {
            "id": 1,
            "hp": 15,
            "attack": 8,
            "exp": 5,
            "gold": 3
        }
    ]
}
```

#### `GET /api/audio/samples`
Get audio sample data.

**Response:**
```json
{
    "samples": [
        {
            "offset": "0x100000",
            "size": 144,
            "loop": true,
            "duration": 2.5
        }
    ]
}
```

#### `GET /api/hex/<offset>`
Get hex dump at offset.

**Parameters:**
- `offset` (path): Hex offset (e.g., "8000")
- `size` (query): Number of bytes (default: 256)

**Response:**
```json
{
    "offset": "0x8000",
    "size": 256,
    "hex_data": "00 01 02 03...",
    "ascii": "................"
}
```

---

## advanced_rom_editor

### `class AdvancedROMEditor`

Safe ROM editing with change tracking and validation.

#### `__init__(self, rom_path: str, project_root: str)`
Initialize ROM editor.

**Parameters:**
- `rom_path`: Path to ROM file
- `project_root`: Project directory for backups

### Edit Operations

#### `edit_data(self, offset: int, new_data: bytes, description: str = "") -> str`
Edit ROM data with change tracking.

**Parameters:**
- `offset`: Offset to edit
- `new_data`: New data bytes
- `description`: Change description

**Returns:**
- `str`: Changeset ID

**Raises:**
- `ValueError`: If edit is out of bounds

#### `undo(self) -> bool`
Undo last change.

**Returns:**
- `bool`: Success status

#### `redo(self) -> bool`
Redo next change.

**Returns:**
- `bool`: Success status

#### `save_rom(self, output_path: Optional[str] = None, create_backup: bool = True) -> str`
Save current ROM state.

**Parameters:**
- `output_path`: Output file path
- `create_backup`: Create backup before save

**Returns:**
- `str`: Output file path

### Backup Management

#### `class BackupManager`
Manages ROM backups and versioning.

#### `create_backup(self, backup_type: str = "automatic", description: str = "") -> str`
Create ROM backup.

**Parameters:**
- `backup_type`: Backup type (automatic/manual/checkpoint)
- `description`: Backup description

**Returns:**
- `str`: Backup ID

#### `restore_backup(self, backup_id: str, target_path: Optional[str] = None) -> str`
Restore from backup.

**Parameters:**
- `backup_id`: Backup ID to restore
- `target_path`: Target file path

**Returns:**
- `str`: Restored file path

#### `list_backups(self) -> List[Dict[str, Any]]`
List all available backups.

**Returns:**
- `List[Dict]`: Backup information

### Validation

#### `class ValidationEngine`
ROM integrity validation.

#### `validate_rom(self, rom_data: bytes, rules: Optional[List[str]] = None) -> Dict[str, Any]`
Validate ROM data integrity.

**Parameters:**
- `rom_data`: ROM data to validate
- `rules`: Validation rules to apply

**Returns:**
- `Dict`: Validation results:
  - `overall_valid`: Overall validation status
  - `critical_errors`: Critical validation errors
  - `warnings`: Non-critical warnings
  - `validation_results`: Detailed results per rule

### Patch Export

#### `export_patch(self, patch_format: str = "ips", output_path: Optional[str] = None) -> str`
Export changes as patch file.

**Parameters:**
- `patch_format`: Patch format (ips/bps/json)
- `output_path`: Output file path

**Returns:**
- `str`: Patch file path

**Supported Formats:**
- **IPS**: International Patching System
- **BPS**: Binary Patch System
- **JSON**: Human-readable change format

---

## performance_optimizer

### `class OptimizedROMAnalyzer`

Performance-optimized ROM analysis with caching.

#### `__init__(self, project_root: str, cache_size_mb: int = 256)`
Initialize optimized analyzer.

**Parameters:**
- `project_root`: Project root directory
- `cache_size_mb`: Memory cache size limit

### Caching System

#### `class IntelligentCache`
Multi-level caching system.

#### `get(self, key: str) -> Optional[Any]`
Get cached value.

**Parameters:**
- `key`: Cache key

**Returns:**
- `Any`: Cached value or None

#### `put(self, key: str, value: Any, ttl_seconds: Optional[int] = None)`
Cache a value.

**Parameters:**
- `key`: Cache key
- `value`: Value to cache
- `ttl_seconds`: Time-to-live in seconds

#### `get_stats(self) -> Dict[str, Any]`
Get cache statistics.

**Returns:**
- `Dict`: Cache statistics:
  - `memory_entries`: Memory cache entries
  - `memory_usage_mb`: Memory usage in MB
  - `access_stats`: Access statistics per key

### Performance Monitoring

#### `class PerformanceProfiler`
Performance monitoring and profiling.

#### `start_operation(self, operation: str) -> str`
Start timing an operation.

**Parameters:**
- `operation`: Operation name

**Returns:**
- `str`: Operation ID

#### `end_operation(self, operation_id: str, items_processed: int = 0) -> PerformanceMetrics`
End timing an operation.

**Parameters:**
- `operation_id`: Operation ID from start_operation
- `items_processed`: Number of items processed

**Returns:**
- `PerformanceMetrics`: Performance metrics

#### `get_summary(self) -> Dict[str, Any]`
Get performance summary.

**Returns:**
- `Dict`: Performance summary with timing statistics

### Memory-Mapped Access

#### `class MemoryMappedROM`
Memory-mapped file access for large ROMs.

#### `__init__(self, rom_path: str)`
Initialize memory-mapped ROM access.

**Parameters:**
- `rom_path`: Path to ROM file

#### `read(self, offset: int, size: int) -> bytes`
Read data from ROM.

**Parameters:**
- `offset`: Read offset
- `size`: Number of bytes to read

**Returns:**
- `bytes`: ROM data

#### `close(self)`
Close memory-mapped file.

### Background Processing

#### `class BackgroundProcessor`
Background task processing.

#### `submit(self, task_id: str, func: Callable, *args, **kwargs) -> str`
Submit background task.

**Parameters:**
- `task_id`: Task identifier
- `func`: Function to execute
- `*args, **kwargs`: Function arguments

**Returns:**
- `str`: Task ID

#### `is_complete(self, task_id: str) -> bool`
Check if task is complete.

**Parameters:**
- `task_id`: Task identifier

**Returns:**
- `bool`: Completion status

#### `get_result(self, task_id: str) -> Optional[Dict[str, Any]]`
Get task result.

**Parameters:**
- `task_id`: Task identifier

**Returns:**
- `Dict`: Task result or None if not complete

---

## Error Handling

### Common Exceptions

#### `FileNotFoundError`
Raised when ROM file is not found.

#### `ValueError`
Raised for invalid parameters or data.

#### `RuntimeError`
Raised for runtime errors during analysis.

### Error Response Format

API endpoints return errors in this format:

```json
{
    "error": "Error message",
    "details": "Additional error details",
    "code": "ERROR_CODE"
}
```

### Logging

All modules use Python's `logging` module. Set logging level:

```python
import logging
logging.basicConfig(level=logging.INFO)
```

---

## Performance Guidelines

### Memory Usage
- Use memory-mapped files for ROMs > 1MB
- Enable caching for repeated operations
- Monitor memory usage with profiler

### Optimization Tips
- Batch operations when possible
- Use background processing for UI
- Cache expensive calculations
- Profile code for bottlenecks

### Recommended Settings
- Cache size: 256MB for analysis
- Background threads: 4-8
- TTL for cache: 30 minutes
- Memory map threshold: 1MB

---

*Dragon Quest III ROM Analysis Toolkit API Reference v1.0*
