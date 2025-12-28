# Dragon Quest III - Graphics Engine Analysis

## Analysis Summary
- **ROM:** Dragon Quest III - english (patched).smc
- **Graphics Functions:** 16
- **PPU Accesses:** 149
- **Sprite Data Structures:** 0
- **Palette Data:** 0

## Graphics Functions

### gfx_func_84be
- **Address:** $84be
- **Purpose:** Display control
- **Size:** 162 bytes
- **PPU Registers:** INIDISP
- **Complexity:** 23

### gfx_func_86b7
- **Address:** $86b7
- **Purpose:** General graphics operation
- **Size:** 530 bytes
- **PPU Registers:** 
- **Complexity:** 10

### gfx_func_88f0
- **Address:** $88f0
- **Purpose:** VRAM data transfer
- **Size:** 403 bytes
- **PPU Registers:** VMADD
- **Complexity:** 62

### gfx_func_8c98
- **Address:** $8c98
- **Purpose:** General graphics operation
- **Size:** 121 bytes
- **PPU Registers:** 
- **Complexity:** 4

### gfx_func_a4ab
- **Address:** $a4ab
- **Purpose:** General graphics operation
- **Size:** 560 bytes
- **PPU Registers:** 
- **Complexity:** 1

### gfx_func_84ad
- **Address:** $84ad
- **Purpose:** General graphics operation
- **Size:** 480 bytes
- **PPU Registers:** M7SEL, M7A
- **Complexity:** 80

### gfx_func_850d
- **Address:** $850d
- **Purpose:** General graphics operation
- **Size:** 384 bytes
- **PPU Registers:** M7SEL, M7A
- **Complexity:** 66

### gfx_func_8589
- **Address:** $8589
- **Purpose:** General graphics operation
- **Size:** 260 bytes
- **PPU Registers:** M7SEL, M7A
- **Complexity:** 51

### gfx_func_8605
- **Address:** $8605
- **Purpose:** General graphics operation
- **Size:** 136 bytes
- **PPU Registers:** M7SEL, M7A
- **Complexity:** 36

### gfx_func_8e53
- **Address:** $8e53
- **Purpose:** General graphics operation
- **Size:** 149 bytes
- **PPU Registers:** M7SEL, M7A
- **Complexity:** 34

### gfx_func_dc6d
- **Address:** $dc6d
- **Purpose:** Display control
- **Size:** 48 bytes
- **PPU Registers:** INIDISP
- **Complexity:** 12

### gfx_func_f55c
- **Address:** $f55c
- **Purpose:** General graphics operation
- **Size:** 259 bytes
- **PPU Registers:** BG3VOFS
- **Complexity:** 14

### gfx_func_868f
- **Address:** $868f
- **Purpose:** General graphics operation
- **Size:** 418 bytes
- **PPU Registers:** 
- **Complexity:** 9

### gfx_func_9ef2
- **Address:** $9ef2
- **Purpose:** General graphics operation
- **Size:** 65 bytes
- **PPU Registers:** BG4HOFS
- **Complexity:** 13

### gfx_func_f215
- **Address:** $f215
- **Purpose:** General graphics operation
- **Size:** 590 bytes
- **PPU Registers:** WH2
- **Complexity:** 26

### gfx_func_a008
- **Address:** $a008
- **Purpose:** Sprite/OAM management
- **Size:** 412 bytes
- **PPU Registers:** M7D, WBGLOG, TMW, BG3SC, WOBJSEL, BG3VOFS, BG4SC, BG1VOFS, BGMODE, CGWSEL, BG3HOFS, WH2, W12SEL, M7Y, WH1, BG12NBA, VMDATAH, M7SEL, WOBJLOG, CGADSUB, BG34NBA, BG2SC, OBSEL, BG2HOFS, M7C, CGDATA, MOSAIC, TS, BG1SC, TM, INIDISP, M7X, BG4VOFS, VMADD, TSW, M7A, WH3, OAMADDH, COLDATA, BG1HOFS, W34SEL, OAMADDL, BG2VOFS, VMAIN, M7B, WH0, BG4HOFS
- **Complexity:** 594

## PPU Register Usage

| Register | Usage Count | Purpose |
|----------|-------------|----------|
| M7SEL | 36 | Unknown purpose |
| VMADD | 21 | Unknown purpose |
| M7A | 19 | Unknown purpose |
| INIDISP | 5 | Unknown purpose |
| VMAIN | 3 | Unknown purpose |
| BG3VOFS | 3 | Unknown purpose |
| BG4HOFS | 3 | Unknown purpose |
| OAMADDH | 2 | Unknown purpose |
| OAMADDL | 2 | Unknown purpose |
| WH2 | 2 | Unknown purpose |
| BGMODE | 2 | Unknown purpose |
| BG1SC | 2 | Unknown purpose |
| BG12NBA | 2 | Unknown purpose |
| BG1HOFS | 2 | Unknown purpose |
| BG1VOFS | 2 | Unknown purpose |
| BG2HOFS | 2 | Unknown purpose |
| BG2VOFS | 2 | Unknown purpose |
| BG3HOFS | 2 | Unknown purpose |
| BG4VOFS | 2 | Unknown purpose |
| M7B | 2 | Unknown purpose |
| M7C | 2 | Unknown purpose |
| M7D | 2 | Unknown purpose |
| M7X | 2 | Unknown purpose |
| M7Y | 2 | Unknown purpose |
| WOBJLOG | 2 | Unknown purpose |
| CGADD | 1 | Unknown purpose |
| OBSEL | 1 | Unknown purpose |
| MOSAIC | 1 | Unknown purpose |
| BG2SC | 1 | Unknown purpose |
| BG3SC | 1 | Unknown purpose |
| BG4SC | 1 | Unknown purpose |
| BG34NBA | 1 | Unknown purpose |
| VMDATAH | 1 | Unknown purpose |
| CGDATA | 1 | Unknown purpose |
| W12SEL | 1 | Unknown purpose |
| W34SEL | 1 | Unknown purpose |
| WOBJSEL | 1 | Unknown purpose |
| WH0 | 1 | Unknown purpose |
| WH1 | 1 | Unknown purpose |
| WH3 | 1 | Unknown purpose |
| WBGLOG | 1 | Unknown purpose |
| TM | 1 | Unknown purpose |
| TS | 1 | Unknown purpose |
| TMW | 1 | Unknown purpose |
| TSW | 1 | Unknown purpose |
| CGWSEL | 1 | Unknown purpose |
| CGADSUB | 1 | Unknown purpose |
| COLDATA | 1 | Unknown purpose |
