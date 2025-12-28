# Dragon Quest III - SPC-700 Driver Analysis

## Driver Functions

### audio_func_d8aa
- **Address:** $d8aa
- **Size:** 40 bytes
- **Purpose:** SPC driver upload

## DSP Register Usage

| Register | Usage Count | Purpose |
|----------|-------------|----------|
| Volume L | 2 | Audio processing |

## SPC-700 Memory Layout

- **Driver Location:** $0200 - $1200
- **Sample Area:** $1200 - $7200
- **Stack Pointer:** $01ff
- **I/O Ports:** $00f4
