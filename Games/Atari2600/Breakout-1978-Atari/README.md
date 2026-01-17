# Breakout (1978) (Atari)

Atari 2600 Disassembly

## Status

- [ ] Initial disassembly
- [ ] Labels identified
- [ ] RAM variables documented
- [ ] Subroutines documented
- [ ] Roundtrip verified
- [ ] Wiki page created

## ROM Information

| Property | Value |
|----------|-------|
| File | Breakout - Breakaway IV (1978) (Atari) (PAL) [!].a26 |
| Size | 0 bytes |
| Banking | unknown |

## Building

```bash
poppy build build.config.json
```

## Verification

```bash
peony verify --original original.a26 --built build/Breakout-1978-Atari.a26
```
