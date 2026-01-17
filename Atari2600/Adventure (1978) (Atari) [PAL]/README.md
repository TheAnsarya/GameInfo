# Adventure (1978) (Atari) [PAL]

Atari 2600 adventure game - PAL version.

## ROM Information

- **Platform**: Atari 2600
- **Size**: 4KB (4096 bytes)
- **Mapper**: None (2KB standard)
- **Region**: PAL
- **Release**: 1978
- **Publisher**: Atari
- **Entry Point**: `$f000`

## Disassembly

- **Source**: [`source/adventure.pasm`](source/adventure.pasm) - 1758 lines, 88 code blocks
- **Format**: Poppy assembly (`.pasm`)
- **Disassembler**: Peony v0.3.0
- **System Directive**: `.system:Atari 2600`

## Build Pipeline

```bash
# Build ROM from source (future)
poppy build source/adventure.pasm -o builds/adventure.a26

# Verify roundtrip
peony verify builds/adventure.a26
```

## Documentation

- General Atari 2600 documentation: [`../../docs/Atari-2600/`](../../docs/Atari-2600/)
- ROM Analysis: [`../../docs/Atari-2600/ROM-Analysis.md`](../../docs/Atari-2600/ROM-Analysis.md)
- Bank Switching: [`../../docs/Atari-2600/Bank-Switching.md`](../../docs/Atari-2600/Bank-Switching.md)

## Status

- ✅ Disassembly complete (88 blocks)
- ⏸️ Poppy assembly support (in development)
- ❌ Roundtrip verification (pending Poppy Atari2600 support)
- ❌ Asset extraction (not started)

## Notes

- PAL version uses different timing than NTSC
- Standard 4KB ROM layout (single bank)
- Entry vector at `$f000` jumps to `$f2ef`
- No special mapper chips

