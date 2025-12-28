# Dark Repos Editor - API Reference

## Overview

The Dark Repos Editor exposes a REST API for programmatic access to editor functionality. This API is used internally by the Blazor frontend and can also be used by external tools.

**Base URL:** `http://localhost:5280/api` (local) or `https://editor.darkrepos.com/api` (hosted)

---

## Authentication

### Local Mode
No authentication required when running locally.

### Hosted Mode
API key authentication via header:
```http
Authorization: Bearer <api-key>
```

---

## ROM Management API

### List ROMs
```http
GET /api/roms
```

**Response:**
```json
{
	"items": [
		{
			"id": "guid",
			"name": "Dragon Warrior IV (USA)",
			"platform": "NES",
			"size": 524288,
			"sha256": "abc123...",
			"addedAt": "2025-12-27T10:00:00Z"
		}
	],
	"totalCount": 1
}
```

### Upload ROM
```http
POST /api/roms
Content-Type: multipart/form-data

file: <binary>
```

**Response:**
```json
{
	"id": "guid",
	"name": "Dragon Warrior IV (USA)",
	"platform": "NES",
	"size": 524288,
	"sha256": "abc123..."
}
```

### Get ROM Info
```http
GET /api/roms/{id}
```

**Response:**
```json
{
	"id": "guid",
	"name": "Dragon Warrior IV (USA)",
	"platform": "NES",
	"mapper": 4,
	"prgSize": 524288,
	"chrSize": 131072,
	"header": {
		"format": "iNES",
		"version": 1,
		"mirroring": "Vertical",
		"battery": true
	},
	"checksums": {
		"crc32": "12345678",
		"md5": "abc123...",
		"sha1": "def456...",
		"sha256": "ghi789..."
	}
}
```

### Download ROM
```http
GET /api/roms/{id}/download
```

**Response:** Binary file download

### Delete ROM
```http
DELETE /api/roms/{id}
```

---

## Hex Editor API

### Read Bytes
```http
GET /api/roms/{id}/hex?offset=0&length=256
```

**Response:**
```json
{
	"offset": 0,
	"length": 256,
	"data": "4E45531A...",
	"ascii": "NES..."
}
```

### Write Bytes
```http
PATCH /api/roms/{id}/hex
Content-Type: application/json

{
	"offset": 16,
	"data": "FF00FF00"
}
```

### Search Pattern
```http
POST /api/roms/{id}/hex/search
Content-Type: application/json

{
	"pattern": "4C ?? 80",
	"startOffset": 0,
	"maxResults": 100
}
```

**Response:**
```json
{
	"results": [
		{ "offset": 32768, "match": "4C0080" },
		{ "offset": 49152, "match": "4CFF80" }
	],
	"totalFound": 2
}
```

---

## Disassembler API

### Disassemble Range
```http
POST /api/roms/{id}/disassemble
Content-Type: application/json

{
	"startAddress": "0x8000",
	"endAddress": "0x8100",
	"architecture": "6502",
	"format": "ca65"
}
```

**Response:**
```json
{
	"assembly": ".org $8000\nLDA #$00\nSTA $0200\n...",
	"instructions": [
		{
			"address": "8000",
			"bytes": "A900",
			"mnemonic": "LDA",
			"operand": "#$00",
			"size": 2
		}
	]
}
```

### Get Bank
```http
GET /api/roms/{id}/banks/{bankNumber}
```

**Response:**
```json
{
	"bankNumber": 0,
	"offset": 16,
	"size": 16384,
	"type": "PRG",
	"analysis": {
		"codePercentage": 65.4,
		"dataPercentage": 34.6,
		"entryPoints": ["8000", "FFFA"]
	}
}
```

---

## CHR/Graphics API

### Get CHR Data
```http
GET /api/roms/{id}/chr?offset=0&tileCount=256
```

**Response:**
```json
{
	"offset": 0,
	"tileCount": 256,
	"format": "NES_2BPP",
	"tiles": [
		{
			"index": 0,
			"data": "00000000..."
		}
	]
}
```

### Export CHR as PNG
```http
GET /api/roms/{id}/chr/export?offset=0&tileCount=256&palette=0
Accept: image/png
```

**Response:** PNG image

### Import CHR from PNG
```http
POST /api/roms/{id}/chr/import
Content-Type: multipart/form-data

file: <png>
offset: 0
format: NES_2BPP
```

---

## Palette API

### Get Palettes
```http
GET /api/roms/{id}/palettes?offset=0&count=8
```

**Response:**
```json
{
	"palettes": [
		{
			"index": 0,
			"colors": ["#000000", "#7C7C7C", "#BCBCBC", "#FCFCFC"]
		}
	]
}
```

### Update Palette
```http
PUT /api/roms/{id}/palettes/{index}
Content-Type: application/json

{
	"colors": ["#000000", "#FF0000", "#00FF00", "#0000FF"]
}
```

---

## Text Editor API

### Extract Text
```http
POST /api/roms/{id}/text/extract
Content-Type: application/json

{
	"tableFile": "dw4.tbl",
	"pointerTableOffset": "0x8000",
	"pointerCount": 100,
	"encoding": "DTE"
}
```

**Response:**
```json
{
	"strings": [
		{
			"index": 0,
			"offset": "0x10000",
			"text": "Hero approaches the castle.",
			"length": 27
		}
	]
}
```

### Insert Text
```http
POST /api/roms/{id}/text/insert
Content-Type: application/json

{
	"strings": [
		{
			"index": 0,
			"text": "Hero approaches the castle."
		}
	],
	"tableFile": "dw4.tbl",
	"pointerTableOffset": "0x8000"
}
```

---

## Data Table API

### Get Table Schema
```http
GET /api/schemas/monster-stats
```

**Response:**
```json
{
	"name": "Monster Stats",
	"fields": [
		{ "name": "hp", "type": "uint16", "offset": 0 },
		{ "name": "attack", "type": "uint8", "offset": 2 },
		{ "name": "defense", "type": "uint8", "offset": 3 }
	],
	"recordSize": 16
}
```

### Read Table Data
```http
POST /api/roms/{id}/tables/read
Content-Type: application/json

{
	"schemaName": "monster-stats",
	"offset": "0x10000",
	"count": 100
}
```

**Response:**
```json
{
	"records": [
		{
			"index": 0,
			"fields": {
				"hp": 10,
				"attack": 5,
				"defense": 3
			}
		}
	]
}
```

### Write Table Data
```http
POST /api/roms/{id}/tables/write
Content-Type: application/json

{
	"schemaName": "monster-stats",
	"offset": "0x10000",
	"records": [
		{
			"index": 0,
			"fields": {
				"hp": 15,
				"attack": 7,
				"defense": 5
			}
		}
	]
}
```

---

## Map Editor API

### Get Map Data
```http
GET /api/roms/{id}/maps/{mapId}
```

**Response:**
```json
{
	"id": 0,
	"width": 32,
	"height": 32,
	"tilesetId": 0,
	"tiles": [[0, 1, 2, ...], ...],
	"events": [
		{
			"type": "warp",
			"x": 10,
			"y": 15,
			"targetMap": 5,
			"targetX": 8,
			"targetY": 8
		}
	]
}
```

### Update Map
```http
PUT /api/roms/{id}/maps/{mapId}
Content-Type: application/json

{
	"tiles": [[0, 1, 2, ...], ...],
	"events": [...]
}
```

### Export Map as PNG
```http
GET /api/roms/{id}/maps/{mapId}/export
Accept: image/png
```

---

## Script Editor API

### Decompile Script
```http
POST /api/roms/{id}/scripts/decompile
Content-Type: application/json

{
	"offset": "0x10000",
	"length": 1024,
	"scriptType": "event"
}
```

**Response:**
```json
{
	"script": "DIALOG 0\nWAIT 30\nMOVE_ACTOR 1 LEFT 2\n...",
	"opcodes": [
		{
			"offset": "0x10000",
			"opcode": "01",
			"name": "DIALOG",
			"params": [0]
		}
	]
}
```

### Compile Script
```http
POST /api/roms/{id}/scripts/compile
Content-Type: application/json

{
	"script": "DIALOG 0\nWAIT 30\n...",
	"scriptType": "event"
}
```

**Response:**
```json
{
	"bytes": "010000011E...",
	"size": 128,
	"errors": []
}
```

---

## Patch API

### Create IPS Patch
```http
POST /api/roms/{id}/patches/create
Content-Type: application/json

{
	"format": "IPS",
	"originalRomId": "guid"
}
```

**Response:** Binary IPS file

### Apply Patch
```http
POST /api/roms/{id}/patches/apply
Content-Type: multipart/form-data

file: <patch file>
format: IPS
```

---

## Project API

### Create Project
```http
POST /api/projects
Content-Type: application/json

{
	"name": "DW4 Translation",
	"romId": "guid",
	"description": "Dragon Warrior IV fan translation project"
}
```

### Get Project
```http
GET /api/projects/{id}
```

**Response:**
```json
{
	"id": "guid",
	"name": "DW4 Translation",
	"romId": "guid",
	"createdAt": "2025-12-27T10:00:00Z",
	"modifiedAt": "2025-12-27T12:00:00Z",
	"edits": [
		{
			"id": "guid",
			"type": "hex",
			"offset": 16,
			"originalData": "FF",
			"newData": "00",
			"timestamp": "2025-12-27T11:00:00Z"
		}
	]
}
```

### Export Project
```http
GET /api/projects/{id}/export
Accept: application/zip
```

---

## CDL (Code Data Logger) API

### Upload CDL
```http
POST /api/roms/{id}/cdl
Content-Type: multipart/form-data

file: <cdl file>
format: FCEUX
```

### Get CDL Coverage
```http
GET /api/roms/{id}/cdl/coverage
```

**Response:**
```json
{
	"totalBytes": 524288,
	"loggedBytes": 342156,
	"coverage": 65.27,
	"breakdown": {
		"code": 198543,
		"data": 143613,
		"unlogged": 182132
	}
}
```

### Export CDL Heatmap
```http
GET /api/roms/{id}/cdl/heatmap
Accept: image/png
```

---

## Label/Symbol API

### Upload Labels
```http
POST /api/roms/{id}/labels
Content-Type: multipart/form-data

file: <mlb or nl file>
format: MLB
```

### Get Labels
```http
GET /api/roms/{id}/labels
```

**Response:**
```json
{
	"labels": [
		{
			"address": "8000",
			"name": "Reset",
			"type": "code",
			"comment": "Main entry point"
		}
	]
}
```

### Add Label
```http
POST /api/roms/{id}/labels
Content-Type: application/json

{
	"address": "8100",
	"name": "LoadLevel",
	"type": "code",
	"comment": "Loads a level by ID"
}
```

---

## WebSocket API

### Real-time Updates
```javascript
const ws = new WebSocket('ws://localhost:5280/ws');

ws.onmessage = (event) => {
	const message = JSON.parse(event.data);
	// Handle update
};

// Subscribe to ROM changes
ws.send(JSON.stringify({
	type: 'subscribe',
	romId: 'guid'
}));
```

**Message Types:**
- `rom.modified` - ROM data changed
- `project.saved` - Project saved
- `analysis.complete` - Background analysis finished

---

## Error Responses

All errors follow this format:
```json
{
	"error": {
		"code": "ROM_NOT_FOUND",
		"message": "The specified ROM was not found",
		"details": {
			"romId": "invalid-guid"
		}
	}
}
```

### Error Codes

| Code | HTTP Status | Description |
|------|-------------|-------------|
| `ROM_NOT_FOUND` | 404 | ROM with given ID not found |
| `INVALID_OFFSET` | 400 | Offset out of bounds |
| `INVALID_FORMAT` | 400 | Unsupported file format |
| `VALIDATION_ERROR` | 400 | Request validation failed |
| `INTERNAL_ERROR` | 500 | Internal server error |

---

## Rate Limiting

| Endpoint | Limit |
|----------|-------|
| Read operations | 1000/minute |
| Write operations | 100/minute |
| File uploads | 10/minute |

---

## SDK Examples

### C# SDK
```csharp
var client = new DarkReposEditorClient("http://localhost:5280");

// Load ROM
var rom = await client.Roms.GetAsync(romId);

// Read hex data
var hexData = await client.Hex.ReadAsync(romId, offset: 0, length: 256);

// Search pattern
var results = await client.Hex.SearchAsync(romId, "4C ?? 80");
```

### JavaScript SDK
```javascript
import { DarkRepos Editor } from '@darkrepos/editor-sdk';

const editor = new DarkRepos Editor('http://localhost:5280');

// Load ROM
const rom = await editor.roms.get(romId);

// Read hex data
const hexData = await editor.hex.read(romId, { offset: 0, length: 256 });

// Search pattern
const results = await editor.hex.search(romId, '4C ?? 80');
```

### Python SDK
```python
from darkrepos_editor import DarkRepos Editor

editor = DarkRepos Editor('http://localhost:5280')

# Load ROM
rom = editor.roms.get(rom_id)

# Read hex data
hex_data = editor.hex.read(rom_id, offset=0, length=256)

# Search pattern
results = editor.hex.search(rom_id, '4C ?? 80')
```
