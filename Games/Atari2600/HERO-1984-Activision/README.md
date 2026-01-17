# H.E.R.O. (1984) (Activision)

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
| File | H.E.R.O. (1984) (Activision) (PAL) [!].a26 |
| Size | 0 bytes |
| Banking | unknown |

## Building

```bash
poppy build build.config.json
```

## Verification

```bash
peony verify --original original.a26 --built build/HERO-1984-Activision.a26
```
