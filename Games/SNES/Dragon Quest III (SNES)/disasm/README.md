# Dragon Quest III (SNES) - Disassembly

Complete bank-by-bank disassembly of Dragon Quest III (SNES).

## File Organization

The `reconstructed/` folder contains 192 source files - one per ROM bank:

```
reconstructed/
├── bank_00.s          # Bank $00 - Boot code, vectors
├── bank_01.s          # Bank $01 - Main engine
├── bank_02.s          # Bank $02 - Battle system
├── ...                # (192 bank files total)
├── bank_bf.s          # Bank $BF
├── dq3_master.s       # Main source file (includes all banks)
├── Makefile           # Build configuration
├── build.ps1          # PowerShell build script
└── RECONSTRUCTION_SUMMARY.md  # Build statistics
```

## Coverage Statistics

| Metric | Value |
|--------|-------|
| Total ROM Size | 6,291,456 bytes |
| Coverage | 96.48% |
| Source Files | 192 |
| Bank Range | $00 - $BF |

## Building

The source files can reassemble into a byte-perfect ROM:

```powershell
cd reconstructed
./build.ps1
```

Or using Make:

```bash
cd reconstructed
make
```

## Source

Files migrated from:
- `dq3r-info/src/reconstructed/`
