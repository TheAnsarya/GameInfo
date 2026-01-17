; 🌺 Peony Disassembly
; ROM: Space Invaders (1978) (Atari) [!].a26
; Platform: Atari 2600
; Size: 4096 bytes

; === Block $f000-$f09f (Code) ===
loc_f000:
	sta $2b                  ; $f000: 85 2b HMCLR
	lda $84                  ; $f002: a5 84
	bmi $f006                ; $f004: 30 00
loc_f006:
	and #$0f                 ; $f006: 29 0f PF2
	tax                      ; $f008: aa
	dex                      ; $f009: ca
	bpl $f009                ; $f00a: 10 fd
loc_f00c:
	lda ($f8),y              ; $f00c: b1 f8
	tax                      ; $f00e: aa
	lda ($ee),y              ; $f00f: b1 ee
	sta $1b                  ; $f011: 85 1b GRP0
	lda ($f0),y              ; $f013: b1 f0
	sta $1c                  ; $f015: 85 1c GRP1
	lda ($f2),y              ; $f017: b1 f2
	sta $1b                  ; $f019: 85 1b GRP0
	lda ($f4),y              ; $f01b: b1 f4
	sta $1c                  ; $f01d: 85 1c GRP1
	lda ($f6),y              ; $f01f: b1 f6
	sta $1b                  ; $f021: 85 1b GRP0
	txa                      ; $f023: 8a
	sta $1c                  ; $f024: 85 1c GRP1
	sta $1b                  ; $f026: 85 1b GRP0
	dec $89                  ; $f028: c6 89
	dey                      ; $f02a: 88
	pha                      ; $f02b: 48
	pla                      ; $f02c: 68
	pha                      ; $f02d: 48
	pla                      ; $f02e: 68
	lda ($f8),y              ; $f02f: b1 f8
	tax                      ; $f031: aa
	lda ($ee),y              ; $f032: b1 ee
	sta $1b                  ; $f034: 85 1b GRP0
	lda ($f0),y              ; $f036: b1 f0
	sta $1c                  ; $f038: 85 1c GRP1
	lda ($f2),y              ; $f03a: b1 f2
	sta $1b                  ; $f03c: 85 1b GRP0
	lda ($f4),y              ; $f03e: b1 f4
	sta $1c                  ; $f040: 85 1c GRP1
	lda ($f6),y              ; $f042: b1 f6
	sta $1b                  ; $f044: 85 1b GRP0
	txa                      ; $f046: 8a
	sta $1c                  ; $f047: 85 1c GRP1
	sta $1b                  ; $f049: 85 1b GRP0
	lda $89                  ; $f04b: a5 89
	cmp #$04                 ; $f04d: c9 04 NUSIZ0
	bcc $f055                ; $f04f: 90 04
loc_f051:
	lda #$00                 ; $f051: a9 00 VSYNC
	bcs $f058                ; $f053: b0 03
loc_f055:
	nop                      ; $f055: ea
	lda #$02                 ; $f056: a9 02 WSYNC
loc_f058:
	sta $001f                ; $f058: 8d 1f 00 ENABL
	dey                      ; $f05b: 88
	bpl $f00c                ; $f05c: 10 ae
loc_f05e:
	iny                      ; $f05e: c8
	sty $1b                  ; $f05f: 84 1b GRP0
	sty $1c                  ; $f061: 84 1c GRP1
	sty $2b                  ; $f063: 84 2b HMCLR
	sty $1b                  ; $f065: 84 1b GRP0
	sty $1c                  ; $f067: 84 1c GRP1
	sta $02                  ; $f069: 85 02 WSYNC
	dec $89                  ; $f06b: c6 89
	lda $89                  ; $f06d: a5 89
	cmp #$04                 ; $f06f: c9 04 NUSIZ0
	bcc $f077                ; $f071: 90 04
loc_f073:
	lda #$00                 ; $f073: a9 00 VSYNC
	bcs $f07a                ; $f075: b0 03
loc_f077:
	nop                      ; $f077: ea
	lda #$02                 ; $f078: a9 02 WSYNC
loc_f07a:
	sta $1f                  ; $f07a: 85 1f ENABL
	ldy $80                  ; $f07c: a4 80
	lda $02                  ; $f07e: a5 02 WSYNC
	ora $03                  ; $f080: 05 03 RSYNC
	asl                      ; $f082: 0a
	bmi $f08b                ; $f083: 30 06
loc_f085:
	nop                      ; $f085: ea
	nop                      ; $f086: ea
	nop                      ; $f087: ea
	nop                      ; $f088: ea
	bpl $f092                ; $f089: 10 07
loc_f08b:
	lda $82                  ; $f08b: a5 82
	ora $fcdc,y              ; $f08d: 19 dc fc
	sta $82                  ; $f090: 85 82
loc_f092:
	sta $2c                  ; $f092: 85 2c CXCLR
	dey                      ; $f094: 88
	dec $8c                  ; $f095: c6 8c
	bpl $f0a2                ; $f097: 10 09
loc_f099:
	lda #$00                 ; $f099: a9 00 VSYNC
	sta $25                  ; $f09b: 85 25 VDELP0
	sta $26                  ; $f09d: 85 26 VDELP1
	jmp $f109                ; $f09f: 4c 09 f1

; === Block $f0a2-$f0a5 (Code) ===
loc_f0a2:
	jsr $fde9                ; $f0a2: 20 e9 fd

; === Block $f0a5-$f0f2 (Code) ===
loc_f0a5:
	sty $80                  ; $f0a5: 84 80
	lda $0092,y              ; $f0a7: b9 92 00
	sta $f8                  ; $f0aa: 85 f8
	ldx #$f4                 ; $f0ac: a2 f4
	lsr $f8                  ; $f0ae: 46 f8
	bcc $f0b9                ; $f0b0: 90 07
loc_f0b2:
	lda $fcd6,y              ; $f0b2: b9 d6 fc
	adc $8b                  ; $f0b5: 65 8b
	bne $f0bd                ; $f0b7: d0 04
loc_f0b9:
	pha                      ; $f0b9: 48
	pla                      ; $f0ba: 68
	lda #$00                 ; $f0bb: a9 00 VSYNC
loc_f0bd:
	sta $fa,x                ; $f0bd: 95 fa
	inx                      ; $f0bf: e8
	inx                      ; $f0c0: e8
	bmi $f0ae                ; $f0c1: 30 eb
loc_f0c3:
	dec $89                  ; $f0c3: c6 89
	lda $89                  ; $f0c5: a5 89
	cmp #$04                 ; $f0c7: c9 04 NUSIZ0
	bcc $f0cf                ; $f0c9: 90 04
loc_f0cb:
	lda #$00                 ; $f0cb: a9 00 VSYNC
	bcs $f0d2                ; $f0cd: b0 03
loc_f0cf:
	nop                      ; $f0cf: ea
	lda #$02                 ; $f0d0: a9 02 WSYNC
loc_f0d2:
	sta $1f                  ; $f0d2: 85 1f ENABL
	lda $c8                  ; $f0d4: a5 c8
	and #$38                 ; $f0d6: 29 38
	lsr                      ; $f0d8: 4a
	lsr                      ; $f0d9: 4a
	lsr                      ; $f0da: 4a
	cmp $80                  ; $f0db: c5 80
	bne $f0f5                ; $f0dd: d0 16
loc_f0df:
	lda $c8                  ; $f0df: a5 c8
	and #$07                 ; $f0e1: 29 07 COLUP1
	asl                      ; $f0e3: 0a
	tax                      ; $f0e4: aa
	lda $c8                  ; $f0e5: a5 c8
	rol                      ; $f0e7: 2a
	rol                      ; $f0e8: 2a
	rol                      ; $f0e9: 2a
	and #$03                 ; $f0ea: 29 03 RSYNC
	tay                      ; $f0ec: a8
	lda $fd1e,y              ; $f0ed: b9 1e fd
	sta $ee,x                ; $f0f0: 95 ee
	jmp $f0fa                ; $f0f2: 4c fa f0

; === Block $f0f5-$f106 (Code) ===
loc_f0f5:
	ldx #$05                 ; $f0f5: a2 05 NUSIZ1
	dex                      ; $f0f7: ca
	bpl $f0f7                ; $f0f8: 10 fd
loc_f0fa:
	sta $2b                  ; $f0fa: 85 2b HMCLR
	jsr $fdb2                ; $f0fc: 20 b2 fd
loc_f0ff:
	ldx #$06                 ; $f0ff: a2 06 COLUP0
	dex                      ; $f101: ca
	bpl $f101                ; $f102: 10 fd
loc_f104:
	ldy #$09                 ; $f104: a0 09 COLUBK
	jmp $f000                ; $f106: 4c 00 f0

; === Block $f109-$f110 (Code) ===
loc_f109:
	dec $8e                  ; $f109: c6 8e
	bmi $f113                ; $f10b: 30 06
loc_f10d:
	jsr $fdb2                ; $f10d: 20 b2 fd
loc_f110:
	jmp $f109                ; $f110: 4c 09 f1

; === Block $f113-$f117 (Code) ===
loc_f113:
	bit $98                  ; $f113: 24 98
	bvs $f11a                ; $f115: 70 03
loc_f117:
	jmp $f1b2                ; $f117: 4c b2 f1

; === Block $f11a-$f1af (Code) ===
loc_f11a:
	lda $dd                  ; $f11a: a5 dd
	sta $06                  ; $f11c: 85 06 COLUP0
	lda #$01                 ; $f11e: a9 01 VBLANK
	sta $8e                  ; $f120: 85 8e
	lda #$00                 ; $f122: a9 00 VSYNC
	sta $ef                  ; $f124: 85 ef
	sta $f1                  ; $f126: 85 f1
	sta $f3                  ; $f128: 85 f3
	lda #$ab                 ; $f12a: a9 ab
	sta $ee                  ; $f12c: 85 ee
	lda #$b4                 ; $f12e: a9 b4
	sta $f0                  ; $f130: 85 f0
	lda #$bd                 ; $f132: a9 bd
	sta $f2                  ; $f134: 85 f2
	lda #$11                 ; $f136: a9 11 RESP1
	sta $02                  ; $f138: 85 02 WSYNC
	sta $2b                  ; $f13a: 85 2b HMCLR
	sta $f4                  ; $f13c: 85 f4
	lda $85                  ; $f13e: a5 85
	sta $20                  ; $f140: 85 20 HMP0
	and #$0f                 ; $f142: 29 0f PF2
	tay                      ; $f144: a8
	dey                      ; $f145: 88
	bpl $f145                ; $f146: 10 fd
loc_f148:
	sta $10                  ; $f148: 85 10 RESP0
	dec $89                  ; $f14a: c6 89
	lda $89                  ; $f14c: a5 89
	cmp #$04                 ; $f14e: c9 04 NUSIZ0
	lda #$02                 ; $f150: a9 02 WSYNC
	bcc $f155                ; $f152: 90 01
loc_f154:
	lsr                      ; $f154: 4a
loc_f155:
	sta $1f                  ; $f155: 85 1f ENABL
	sta $02                  ; $f157: 85 02 WSYNC
	sta $2a                  ; $f159: 85 2a HMOVE
	ldy #$00                 ; $f15b: a0 00 VSYNC
	lda $85                  ; $f15d: a5 85
	bpl $f163                ; $f15f: 10 02
loc_f161:
	lda $85                  ; $f161: a5 85
loc_f163:
	and #$0f                 ; $f163: 29 0f PF2
	tax                      ; $f165: aa
	dex                      ; $f166: ca
	dex                      ; $f167: ca
	dex                      ; $f168: ca
	bpl $f168                ; $f169: 10 fd
loc_f16b:
	lda ($ee),y              ; $f16b: b1 ee
	sta $1b                  ; $f16d: 85 1b GRP0
	nop                      ; $f16f: ea
	lda ($f0),y              ; $f170: b1 f0
	sta $1b                  ; $f172: 85 1b GRP0
	lda ($f2),y              ; $f174: b1 f2
	sta $1b                  ; $f176: 85 1b GRP0
	dec $f4                  ; $f178: c6 f4
	bmi $f18e                ; $f17a: 30 12
loc_f17c:
	lda $f4                  ; $f17c: a5 f4
	lsr                      ; $f17e: 4a
	bcc $f189                ; $f17f: 90 08
loc_f181:
	iny                      ; $f181: c8
	lda #$20                 ; $f182: a9 20 HMP0
	lsr                      ; $f184: 4a
	bne $f184                ; $f185: d0 fd
loc_f187:
	beq $f16b                ; $f187: f0 e2
loc_f189:
	jsr $fde9                ; $f189: 20 e9 fd
loc_f18c:
	bpl $f16b                ; $f18c: 10 dd
loc_f18e:
	lda #$00                 ; $f18e: a9 00 VSYNC
	sta $1b                  ; $f190: 85 1b GRP0
	sta $02                  ; $f192: 85 02 WSYNC
	lda $02                  ; $f194: a5 02 WSYNC
	asl                      ; $f196: 0a
	and #$80                 ; $f197: 29 80
	ora $82                  ; $f199: 05 82
	sta $82                  ; $f19b: 85 82
	sta $2c                  ; $f19d: 85 2c CXCLR
	jsr $fde9                ; $f19f: 20 e9 fd
loc_f1a2:
	sta $2b                  ; $f1a2: 85 2b HMCLR
	sta $02                  ; $f1a4: 85 02 WSYNC
	sta $02                  ; $f1a6: 85 02 WSYNC
	dec $8e                  ; $f1a8: c6 8e
	bmi $f1b2                ; $f1aa: 30 06
loc_f1ac:
	jsr $fdb2                ; $f1ac: 20 b2 fd
loc_f1af:
	jmp $f1a8                ; $f1af: 4c a8 f1

; === Block $f1b2-$f1b6 (Code) ===
loc_f1b2:
	bit $98                  ; $f1b2: 24 98
	bpl $f1b9                ; $f1b4: 10 03
loc_f1b6:
	jmp $f282                ; $f1b6: 4c 82 f2

; === Block $f1b9-$f373 (Code) ===
loc_f1b9:
	jsr $fde9                ; $f1b9: 20 e9 fd
loc_f1bc:
	sta $2b                  ; $f1bc: 85 2b HMCLR
	sta $02                  ; $f1be: 85 02 WSYNC
	lda $df                  ; $f1c0: a5 df
	sta $06                  ; $f1c2: 85 06 COLUP0
	lda $86                  ; $f1c4: a5 86
	sta $20                  ; $f1c6: 85 20 HMP0
	and #$0f                 ; $f1c8: 29 0f PF2
	tay                      ; $f1ca: a8
	dey                      ; $f1cb: 88
	bpl $f1cb                ; $f1cc: 10 fd
loc_f1ce:
	sta $10                  ; $f1ce: 85 10 RESP0
	sta $02                  ; $f1d0: 85 02 WSYNC
	lda $e0                  ; $f1d2: a5 e0
	sta $07                  ; $f1d4: 85 07 COLUP1
	lda $87                  ; $f1d6: a5 87
	sta $21                  ; $f1d8: 85 21 HMP1
	and #$0f                 ; $f1da: 29 0f PF2
	tay                      ; $f1dc: a8
	dey                      ; $f1dd: 88
	bpl $f1dd                ; $f1de: 10 fd
loc_f1e0:
	sta $11                  ; $f1e0: 85 11 RESP1
	sta $02                  ; $f1e2: 85 02 WSYNC
	sta $2a                  ; $f1e4: 85 2a HMOVE
	jsr $fde9                ; $f1e6: 20 e9 fd
loc_f1e9:
	lda #$00                 ; $f1e9: a9 00 VSYNC
	bit $0282                ; $f1eb: 2c 82 02 SWCHB
	bpl $f1f2                ; $f1ee: 10 02
loc_f1f0:
	lda #$05                 ; $f1f0: a9 05 NUSIZ1
loc_f1f2:
	sta $05                  ; $f1f2: 85 05 NUSIZ1
	lda #$00                 ; $f1f4: a9 00 VSYNC
	bvc $f1fa                ; $f1f6: 50 02
loc_f1f8:
	lda #$05                 ; $f1f8: a9 05 NUSIZ1
loc_f1fa:
	sta $04                  ; $f1fa: 85 04 NUSIZ0
	lda $98                  ; $f1fc: a5 98
	and #$10                 ; $f1fe: 29 10 RESP0
	beq $f204                ; $f200: f0 02
loc_f202:
	lda #$0a                 ; $f202: a9 0a CTRLPF
loc_f204:
	sta $f4                  ; $f204: 85 f4
	lda $98                  ; $f206: a5 98
	and #$20                 ; $f208: 29 20 HMP0
	beq $f20e                ; $f20a: f0 02
loc_f20c:
	lda #$0a                 ; $f20c: a9 0a CTRLPF
loc_f20e:
	sta $f6                  ; $f20e: 85 f6
	lda $aa                  ; $f210: a5 aa
	lsr                      ; $f212: 4a
	sta $02                  ; $f213: 85 02 WSYNC
	bcc $f22e                ; $f215: 90 17
loc_f217:
	ldx $c9                  ; $f217: a6 c9
	lda $fd16,x              ; $f219: bd 16 fd
	sta $f8                  ; $f21c: 85 f8
	lda #$ff                 ; $f21e: a9 ff
	sta $f9                  ; $f220: 85 f9
	lda $ca                  ; $f222: a5 ca
	and #$08                 ; $f224: 29 08 COLUPF
	bne $f22c                ; $f226: d0 04
loc_f228:
	sta $f4                  ; $f228: 85 f4
	sta $f6                  ; $f22a: 85 f6
loc_f22c:
	bpl $f253                ; $f22c: 10 25
loc_f22e:
	lda #$00                 ; $f22e: a9 00 VSYNC
	sta $f8                  ; $f230: 85 f8
	lda $ca                  ; $f232: a5 ca
	lsr                      ; $f234: 4a
	lsr                      ; $f235: 4a
	lsr                      ; $f236: 4a
	lda $aa                  ; $f237: a5 aa
	and #$04                 ; $f239: 29 04 NUSIZ0
	beq $f245                ; $f23b: f0 08
loc_f23d:
	lda #$1e                 ; $f23d: a9 1e ENAM1
	bcs $f243                ; $f23f: b0 02
loc_f241:
	lda #$14                 ; $f241: a9 14 RESBL
loc_f243:
	sta $f4                  ; $f243: 85 f4
loc_f245:
	lda $aa                  ; $f245: a5 aa
	and #$02                 ; $f247: 29 02 WSYNC
	beq $f253                ; $f249: f0 08
loc_f24b:
	lda #$14                 ; $f24b: a9 14 RESBL
	bcs $f251                ; $f24d: b0 02
loc_f24f:
	lda #$1e                 ; $f24f: a9 1e ENAM1
loc_f251:
	sta $f6                  ; $f251: 85 f6
loc_f253:
	ldx #$09                 ; $f253: a2 09 COLUBK
	ldy #$09                 ; $f255: a0 09 COLUBK
	sta $02                  ; $f257: 85 02 WSYNC
	lda #$00                 ; $f259: a9 00 VSYNC
	sta $0d                  ; $f25b: 85 0d PF0
	lda ($f4),y              ; $f25d: b1 f4
	sta $1b                  ; $f25f: 85 1b GRP0
	lda ($f6),y              ; $f261: b1 f6
	sta $1c                  ; $f263: 85 1c GRP1
	txa                      ; $f265: 8a
	lsr                      ; $f266: 4a
	tay                      ; $f267: a8
	lda ($f8),y              ; $f268: b1 f8
	sta $0d                  ; $f26a: 85 0d PF0
	txa                      ; $f26c: 8a
	lsr                      ; $f26d: 4a
	bcc $f27d                ; $f26e: 90 0d
loc_f270:
	dec $89                  ; $f270: c6 89
	lda $89                  ; $f272: a5 89
	cmp #$04                 ; $f274: c9 04 NUSIZ0
	lda #$02                 ; $f276: a9 02 WSYNC
	bcc $f27b                ; $f278: 90 01
loc_f27a:
	lsr                      ; $f27a: 4a
loc_f27b:
	sta $1f                  ; $f27b: 85 1f ENABL
loc_f27d:
	dex                      ; $f27d: ca
	txa                      ; $f27e: 8a
	tay                      ; $f27f: a8
	bpl $f257                ; $f280: 10 d5
loc_f282:
	sta $02                  ; $f282: 85 02 WSYNC
	lda #$00                 ; $f284: a9 00 VSYNC
	sta $04                  ; $f286: 85 04 NUSIZ0
	sta $05                  ; $f288: 85 05 NUSIZ1
	sta $0d                  ; $f28a: 85 0d PF0
	sta $1f                  ; $f28c: 85 1f ENABL
	sta $1b                  ; $f28e: 85 1b GRP0
	sta $1c                  ; $f290: 85 1c GRP1
	lda $e4                  ; $f292: a5 e4
	sta $09                  ; $f294: 85 09 COLUBK
	lda $81                  ; $f296: a5 81
	sta $10                  ; $f298: 85 10 RESP0
	ldx #$04                 ; $f29a: a2 04 NUSIZ0
	dex                      ; $f29c: ca
	bpl $f29c                ; $f29d: 10 fd
loc_f29f:
	sta $11                  ; $f29f: 85 11 RESP1
	sta $2b                  ; $f2a1: 85 2b HMCLR
	lda #$e0                 ; $f2a3: a9 e0
	sta $21                  ; $f2a5: 85 21 HMP1
	sta $02                  ; $f2a7: 85 02 WSYNC
	sta $2a                  ; $f2a9: 85 2a HMOVE
	lda #$c0                 ; $f2ab: a9 c0
	sta $1b                  ; $f2ad: 85 1b GRP0
	sta $1c                  ; $f2af: 85 1c GRP1
	ldx #$04                 ; $f2b1: a2 04 NUSIZ0
	lda #$00                 ; $f2b3: a9 00 VSYNC
	sta $f3,x                ; $f2b5: 95 f3
	dex                      ; $f2b7: ca
	bne $f2b5                ; $f2b8: d0 fb
loc_f2ba:
	jsr $fe08                ; $f2ba: 20 08 fe
loc_f2bd:
	inx                      ; $f2bd: e8
	jsr $fe08                ; $f2be: 20 08 fe
loc_f2c1:
	lda $aa                  ; $f2c1: a5 aa
	and #$81                 ; $f2c3: 29 81
	bne $f2f6                ; $f2c5: d0 2f
loc_f2c7:
	bit $02                  ; $f2c7: 24 02 WSYNC
	bvc $f2d1                ; $f2c9: 50 06
loc_f2cb:
	lda #$04                 ; $f2cb: a9 04 NUSIZ0
	bit $aa                  ; $f2cd: 24 aa
	beq $f2dc                ; $f2cf: f0 0b
loc_f2d1:
	dex                      ; $f2d1: ca
	bit $03                  ; $f2d2: 24 03 RSYNC
	bvc $f2f6                ; $f2d4: 50 20
loc_f2d6:
	lda #$02                 ; $f2d6: a9 02 WSYNC
	bit $aa                  ; $f2d8: 24 aa
	bne $f2f6                ; $f2da: d0 1a
loc_f2dc:
	ora $aa                  ; $f2dc: 05 aa
	sta $aa                  ; $f2de: 85 aa
	sta $c6                  ; $f2e0: 85 c6
	jsr $fe75                ; $f2e2: 20 75 fe
loc_f2e5:
	lda #$06                 ; $f2e5: a9 06 COLUP0
	jsr $fe7e                ; $f2e7: 20 7e fe
loc_f2ea:
	lda $c7                  ; $f2ea: a5 c7
	bne $f2f6                ; $f2ec: d0 08
loc_f2ee:
	bit $db                  ; $f2ee: 24 db
	bvc $f2f6                ; $f2f0: 50 04
loc_f2f2:
	lda #$02                 ; $f2f2: a9 02 WSYNC
	sta $f4,x                ; $f2f4: 95 f4
loc_f2f6:
	sta $02                  ; $f2f6: 85 02 WSYNC
	lda $0284                ; $f2f8: ad 84 02 INTIM
	bne $f2f8                ; $f2fb: d0 fb
loc_f2fd:
	sta $1b                  ; $f2fd: 85 1b GRP0
	sta $1c                  ; $f2ff: 85 1c GRP1
	lda #$c8                 ; $f301: a9 c8
	sta $0295                ; $f303: 8d 95 02 TIM8T
	lda #$00                 ; $f306: a9 00 VSYNC
	sta $f1                  ; $f308: 85 f1
	tax                      ; $f30a: aa
	lda $82                  ; $f30b: a5 82
	bpl $f36e                ; $f30d: 10 5f
loc_f30f:
	lda $ca                  ; $f30f: a5 ca
	lsr                      ; $f311: 4a
	bcc $f316                ; $f312: 90 02
loc_f314:
	ldx #$04                 ; $f314: a2 04 NUSIZ0
loc_f316:
	lda $d1,x                ; $f316: b5 d1
	cmp #$49                 ; $f318: c9 49 COLUBK
	bcc $f320                ; $f31a: 90 04
loc_f31c:
	cmp #$58                 ; $f31c: c9 58 AUDF1
	bcc $f321                ; $f31e: 90 01
loc_f320:
	inx                      ; $f320: e8
loc_f321:
	cpx #$03                 ; $f321: e0 03 RSYNC
	bcc $f331                ; $f323: 90 0c
loc_f325:
	lda #$09                 ; $f325: a9 09 COLUBK
	sta $ef                  ; $f327: 85 ef
	lda #$ff                 ; $f329: a9 ff
	sta $f2                  ; $f32b: 85 f2
	lda #$7f                 ; $f32d: a9 7f
	bne $f33b                ; $f32f: d0 0a
loc_f331:
	lda #$ff                 ; $f331: a9 ff
	sta $ef                  ; $f333: 85 ef
	lda #$01                 ; $f335: a9 01 VBLANK
	sta $f2                  ; $f337: 85 f2
	lda #$f6                 ; $f339: a9 f6
loc_f33b:
	sta $d1,x                ; $f33b: 95 d1
	lda $d3,x                ; $f33d: b5 d3
	ldy #$03                 ; $f33f: a0 03 RSYNC
	clc                      ; $f341: 18
	sbc $9b                  ; $f342: e5 9b
	dey                      ; $f344: 88
	clc                      ; $f345: 18
	adc #$e0                 ; $f346: 69 e0
	bpl $f344                ; $f348: 10 fa
loc_f34a:
	adc #$20                 ; $f34a: 69 20 HMP0
	tax                      ; $f34c: aa
	lda $fd13,y              ; $f34d: b9 13 fd
	sta $f0                  ; $f350: 85 f0
	ldy $ef                  ; $f352: a4 ef
	tya                      ; $f354: 98
	clc                      ; $f355: 18
	adc $f2                  ; $f356: 65 f2
	tay                      ; $f358: a8
	lda $ff4c,x              ; $f359: bd 4c ff
	eor #$ff                 ; $f35c: 49 ff
	and ($f0),y              ; $f35e: 31 f0
	beq $f354                ; $f360: f0 f2
loc_f362:
	jsr $fd8f                ; $f362: 20 8f fd
loc_f365:
	dey                      ; $f365: 88
	jsr $fd8b                ; $f366: 20 8b fd
loc_f369:
	iny                      ; $f369: c8
	iny                      ; $f36a: c8
	jsr $fd8b                ; $f36b: 20 8b fd
loc_f36e:
	lda $ca                  ; $f36e: a5 ca
	lsr                      ; $f370: 4a
	bcs $f376                ; $f371: b0 03
loc_f373:
	jmp $f429                ; $f373: 4c 29 f4

; === Block $f376-$f3a8 (Code) ===
loc_f376:
	bit $82                  ; $f376: 24 82
	bvc $f3a0                ; $f378: 50 26
loc_f37a:
	lda $c8                  ; $f37a: a5 c8
	and #$39                 ; $f37c: 29 39
	cmp #$39                 ; $f37e: c9 39
	beq $f3a0                ; $f380: f0 1e
loc_f382:
	lda #$39                 ; $f382: a9 39
	sta $c8                  ; $f384: 85 c8
	ldx #$01                 ; $f386: a2 01 VBLANK
	lda $98                  ; $f388: a5 98
	and #$04                 ; $f38a: 29 04 NUSIZ0
	bne $f38f                ; $f38c: d0 01
loc_f38e:
	dex                      ; $f38e: ca
loc_f38f:
	lda #$04                 ; $f38f: a9 04 NUSIZ0
	sta $c6                  ; $f391: 85 c6
	lsr                      ; $f393: 4a
	bit $db                  ; $f394: 24 db
	bvc $f399                ; $f396: 50 01
loc_f398:
	lsr                      ; $f398: 4a
loc_f399:
	sta $f4,x                ; $f399: 95 f4
	lda #$05                 ; $f39b: a9 05 NUSIZ1
	jsr $fe8b                ; $f39d: 20 8b fe
loc_f3a0:
	lda #$06                 ; $f3a0: a9 06 COLUP0
	sta $f0                  ; $f3a2: 85 f0
	dec $f0                  ; $f3a4: c6 f0
	bpl $f3ab                ; $f3a6: 10 03
loc_f3a8:
	jmp $f4cf                ; $f3a8: 4c cf f4

; === Block $f3ab-$f426 (Code) ===
loc_f3ab:
	ldx $f0                  ; $f3ab: a6 f0
	lda $82                  ; $f3ad: a5 82
	and $fcdc,x              ; $f3af: 3d dc fc
	beq $f3a4                ; $f3b2: f0 f0
loc_f3b4:
	ldy #$01                 ; $f3b4: a0 01 VBLANK
	lda #$35                 ; $f3b6: a9 35
	sec                      ; $f3b8: 38
	sbc $fd31,x              ; $f3b9: fd 31 fd
	clc                      ; $f3bc: 18
	adc $90                  ; $f3bd: 65 90
	cmp #$52                 ; $f3bf: c9 52 RESM0
	bcs $f426                ; $f3c1: b0 63
loc_f3c3:
	cmp $d5                  ; $f3c3: c5 d5
	bcs $f3ce                ; $f3c5: b0 07
loc_f3c7:
	adc #$0d                 ; $f3c7: 69 0d PF0
	cmp $d5                  ; $f3c9: c5 d5
	bcc $f3ce                ; $f3cb: 90 01
loc_f3cd:
	dey                      ; $f3cd: 88
loc_f3ce:
	sty $ee                  ; $f3ce: 84 ee
	ldx $ee                  ; $f3d0: a6 ee
	ldy #$ff                 ; $f3d2: a0 ff
	lda $9a                  ; $f3d4: a5 9a
	clc                      ; $f3d6: 18
	adc #$fd                 ; $f3d7: 69 fd
	iny                      ; $f3d9: c8
	adc #$10                 ; $f3da: 69 10 RESP0
	cmp $d7,x                ; $f3dc: d5 d7
	bcc $f3d9                ; $f3de: 90 f9
loc_f3e0:
	sty $ef                  ; $f3e0: 84 ef
	ldx $f0                  ; $f3e2: a6 f0
	lda $fcdc,y              ; $f3e4: b9 dc fc
	and $92,x                ; $f3e7: 35 92
	beq $f426                ; $f3e9: f0 3b
loc_f3eb:
	eor $92,x                ; $f3eb: 55 92
	sta $92,x                ; $f3ed: 95 92
	ldy $ee                  ; $f3ef: a4 ee
	lda $fcde,y              ; $f3f1: b9 de fc
	ldy #$01                 ; $f3f4: a0 01 VBLANK
	and $98                  ; $f3f6: 25 98
	bne $f3fb                ; $f3f8: d0 01
loc_f3fa:
	dey                      ; $f3fa: 88
loc_f3fb:
	lda $fd2b,x              ; $f3fb: bd 2b fd
	sta $00f6,y              ; $f3fe: 99 f6 00
	lda #$02                 ; $f401: a9 02 WSYNC
	jsr $fe7e                ; $f403: 20 7e fe
loc_f406:
	dec $91                  ; $f406: c6 91
	bne $f414                ; $f408: d0 0a
loc_f40a:
	lda $aa                  ; $f40a: a5 aa
	ora #$08                 ; $f40c: 09 08 COLUPF
	sta $aa                  ; $f40e: 85 aa
	lda #$61                 ; $f410: a9 61 HMP1
	sta $ca                  ; $f412: 85 ca
loc_f414:
	jsr $fbed                ; $f414: 20 ed fb
loc_f417:
	txa                      ; $f417: 8a
	asl                      ; $f418: 0a
	asl                      ; $f419: 0a
	asl                      ; $f41a: 0a
	ora $ef                  ; $f41b: 05 ef
	sta $c8                  ; $f41d: 85 c8
	lda #$f6                 ; $f41f: a9 f6
	ldy $ee                  ; $f421: a4 ee
	sta $00d5,y              ; $f423: 99 d5 00
loc_f426:
	jmp $f3a4                ; $f426: 4c a4 f3

; === Block $f429-$f4d4 (Code) ===
loc_f429:
	lsr                      ; $f429: 4a
	bcs $f459                ; $f42a: b0 2d
loc_f42c:
	lda $c8                  ; $f42c: a5 c8
	and #$39                 ; $f42e: 29 39
	cmp #$39                 ; $f430: c9 39
	beq $f459                ; $f432: f0 25
loc_f434:
	lda $9e                  ; $f434: a5 9e
	cmp #$b4                 ; $f436: c9 b4
	beq $f459                ; $f438: f0 1f
loc_f43a:
	lda $98                  ; $f43a: a5 98
	lsr                      ; $f43c: 4a
	bcs $f445                ; $f43d: b0 06
loc_f43f:
	dec $9e                  ; $f43f: c6 9e
	bne $f459                ; $f441: d0 16
loc_f443:
	beq $f44d                ; $f443: f0 08
loc_f445:
	inc $9e                  ; $f445: e6 9e
	lda $9e                  ; $f447: a5 9e
	cmp #$98                 ; $f449: c9 98
	bcc $f459                ; $f44b: 90 0c
loc_f44d:
	lda #$b4                 ; $f44d: a9 b4
	sta $9e                  ; $f44f: 85 9e
	lda #$00                 ; $f451: a9 00 VSYNC
	sta $cc                  ; $f453: 85 cc
	lda #$04                 ; $f455: a9 04 NUSIZ0
	sta $c6                  ; $f457: 85 c6
loc_f459:
	lda $0280                ; $f459: ad 80 02 SWCHA
	tay                      ; $f45c: a8
	asl                      ; $f45d: 0a
	asl                      ; $f45e: 0a
	asl                      ; $f45f: 0a
	asl                      ; $f460: 0a
	sta $ee                  ; $f461: 85 ee
	and #$80                 ; $f463: 29 80
	sta $81                  ; $f465: 85 81
	lda $db                  ; $f467: a5 db
	cmp #$90                 ; $f469: c9 90
	bne $f475                ; $f46b: d0 08
loc_f46d:
	bit $aa                  ; $f46d: 24 aa
	bvc $f47f                ; $f46f: 50 0e
loc_f471:
	ldy $ee                  ; $f471: a4 ee
	bvs $f47f                ; $f473: 70 0a
loc_f475:
	and #$02                 ; $f475: 29 02 WSYNC
	beq $f47f                ; $f477: f0 06
loc_f479:
	tya                      ; $f479: 98
	and #$40                 ; $f47a: 29 40 VSYNC
	ora $81                  ; $f47c: 05 81
	tay                      ; $f47e: a8
loc_f47f:
	ldx #$01                 ; $f47f: a2 01 VBLANK
	lda $aa                  ; $f481: a5 aa
	and $fd60,x              ; $f483: 3d 60 fd
	bne $f4a0                ; $f486: d0 18
loc_f488:
	bit $ee                  ; $f488: 24 ee
	bmi $f48e                ; $f48a: 30 02
loc_f48c:
	inc $9c,x                ; $f48c: f6 9c
loc_f48e:
	bvs $f492                ; $f48e: 70 02
loc_f490:
	dec $9c,x                ; $f490: d6 9c
loc_f492:
	lda $9c,x                ; $f492: b5 9c
	cmp #$76                 ; $f494: c9 76
	bcc $f49a                ; $f496: 90 02
loc_f498:
	dec $9c,x                ; $f498: d6 9c
loc_f49a:
	cmp #$23                 ; $f49a: c9 23 HMM1
	bcs $f4a0                ; $f49c: b0 02
loc_f49e:
	inc $9c,x                ; $f49e: f6 9c
loc_f4a0:
	sty $ee                  ; $f4a0: 84 ee
	dex                      ; $f4a2: ca
	bpl $f481                ; $f4a3: 10 dc
loc_f4a5:
	lda $ca                  ; $f4a5: a5 ca
	lsr                      ; $f4a7: 4a
	lsr                      ; $f4a8: 4a
	lsr                      ; $f4a9: 4a
	bcs $f4cf                ; $f4aa: b0 23
loc_f4ac:
	lda $dc                  ; $f4ac: a5 dc
	lsr                      ; $f4ae: 4a
	bcc $f4cf                ; $f4af: 90 1e
loc_f4b1:
	lda $aa                  ; $f4b1: a5 aa
	and #$10                 ; $f4b3: 29 10 RESP0
	beq $f4c1                ; $f4b5: f0 0a
loc_f4b7:
	inc $9b                  ; $f4b7: e6 9b
	lda $9b                  ; $f4b9: a5 9b
	cmp #$35                 ; $f4bb: c9 35
	bcc $f4cf                ; $f4bd: 90 10
loc_f4bf:
	bcs $f4c9                ; $f4bf: b0 08
loc_f4c1:
	dec $9b                  ; $f4c1: c6 9b
	lda $9b                  ; $f4c3: a5 9b
	cmp #$21                 ; $f4c5: c9 21 HMP1
	bcs $f4cf                ; $f4c7: b0 06
loc_f4c9:
	lda $aa                  ; $f4c9: a5 aa
	eor #$10                 ; $f4cb: 49 10 RESP0
	sta $aa                  ; $f4cd: 85 aa
loc_f4cf:
	lda $0284                ; $f4cf: ad 84 02 INTIM
	bne $f4cf                ; $f4d2: d0 fb

; === Block $f4d4-$f5a6 (Code) ===
loc_f4d4:
	lda #$02                 ; $f4d4: a9 02 WSYNC
	sta $01                  ; $f4d6: 85 01 VBLANK
	sta $02                  ; $f4d8: 85 02 WSYNC
	bit $aa                  ; $f4da: 24 aa
	bmi $f4f1                ; $f4dc: 30 13
loc_f4de:
	sed                      ; $f4de: f8
	ldx #$01                 ; $f4df: a2 01 VBLANK
	lda $e8,x                ; $f4e1: b5 e8
	clc                      ; $f4e3: 18
	adc $f6,x                ; $f4e4: 75 f6
	sta $e8,x                ; $f4e6: 95 e8
	lda $e6,x                ; $f4e8: b5 e6
	adc $f4,x                ; $f4ea: 75 f4
	sta $e6,x                ; $f4ec: 95 e6
	dex                      ; $f4ee: ca
	bpl $f4e1                ; $f4ef: 10 f0
loc_f4f1:
	cld                      ; $f4f1: d8
	sta $02                  ; $f4f2: 85 02 WSYNC
	lda $ca                  ; $f4f4: a5 ca
	and #$07                 ; $f4f6: 29 07 COLUP1
	bne $f50c                ; $f4f8: d0 12
loc_f4fa:
	lda $c8                  ; $f4fa: a5 c8
	clc                      ; $f4fc: 18
	adc #$40                 ; $f4fd: 69 40 VSYNC
	sta $c8                  ; $f4ff: 85 c8
	cmp #$40                 ; $f501: c9 40 VSYNC
	bcs $f50c                ; $f503: b0 07
loc_f505:
	jsr $fbf1                ; $f505: 20 f1 fb
loc_f508:
	lda #$30                 ; $f508: a9 30
	sta $c8                  ; $f50a: 85 c8
loc_f50c:
	lda #$02                 ; $f50c: a9 02 WSYNC
	sta $02                  ; $f50e: 85 02 WSYNC
	sta $00                  ; $f510: 85 00 VSYNC
	sta $02                  ; $f512: 85 02 WSYNC
	sta $02                  ; $f514: 85 02 WSYNC
	lda #$30                 ; $f516: a9 30
	sta $0296                ; $f518: 8d 96 02 TIM64T
	lda #$00                 ; $f51b: a9 00 VSYNC
	sta $02                  ; $f51d: 85 02 WSYNC
	sta $00                  ; $f51f: 85 00 VSYNC
	lda $ca                  ; $f521: a5 ca
	lsr                      ; $f523: 4a
	bcc $f549                ; $f524: 90 23
loc_f526:
	ldx #$01                 ; $f526: a2 01 VBLANK
	lda $d5,x                ; $f528: b5 d5
	cmp #$79                 ; $f52a: c9 79
	bne $f532                ; $f52c: d0 04
loc_f52e:
	lda #$f6                 ; $f52e: a9 f6
	sta $d5,x                ; $f530: 95 d5
loc_f532:
	lda $d5,x                ; $f532: b5 d5
	cmp #$ec                 ; $f534: c9 ec
	bcs $f544                ; $f536: b0 0c
loc_f538:
	lda $d5,x                ; $f538: b5 d5
	adc #$fe                 ; $f53a: 69 fe
	cmp #$03                 ; $f53c: c9 03 RSYNC
	bcs $f542                ; $f53e: b0 02
loc_f540:
	lda #$f6                 ; $f540: a9 f6
loc_f542:
	sta $d5,x                ; $f542: 95 d5
loc_f544:
	dex                      ; $f544: ca
	bpl $f528                ; $f545: 10 e1
loc_f547:
	bmi $f5a2                ; $f547: 30 59
loc_f549:
	lda $ca                  ; $f549: a5 ca
	and #$0f                 ; $f54b: 29 0f PF2
	cmp #$0f                 ; $f54d: c9 0f PF2
	beq $f556                ; $f54f: f0 05
loc_f551:
	jsr $fdfb                ; $f551: 20 fb fd
loc_f554:
	sta $da                  ; $f554: 85 da
loc_f556:
	lda $dc                  ; $f556: a5 dc
	and #$04                 ; $f558: 29 04 NUSIZ0
	lsr                      ; $f55a: 4a
	lsr                      ; $f55b: 4a
	lsr                      ; $f55c: 4a
	lda #$01                 ; $f55d: a9 01 VBLANK
	tax                      ; $f55f: aa
	bcc $f563                ; $f560: 90 01
loc_f562:
	asl                      ; $f562: 0a
loc_f563:
	sta $81                  ; $f563: 85 81
	lda $d1,x                ; $f565: b5 d1
	cmp #$ec                 ; $f567: c9 ec
	bcs $f59f                ; $f569: b0 34
loc_f56b:
	lda $dc                  ; $f56b: a5 dc
	and #$02                 ; $f56d: 29 02 WSYNC
	beq $f590                ; $f56f: f0 1f
loc_f571:
	lda $da                  ; $f571: a5 da
	cpx #$00                 ; $f573: e0 00 VSYNC
	beq $f579                ; $f575: f0 02
loc_f577:
	asl                      ; $f577: 0a
	asl                      ; $f578: 0a
loc_f579:
	asl                      ; $f579: 0a
	bcc $f590                ; $f57a: 90 14
loc_f57c:
	bpl $f588                ; $f57c: 10 0a
loc_f57e:
	lda $d3,x                ; $f57e: b5 d3
	cmp #$81                 ; $f580: c9 81
	bcs $f590                ; $f582: b0 0c
loc_f584:
	inc $d3,x                ; $f584: f6 d3
	bne $f590                ; $f586: d0 08
loc_f588:
	lda $d3,x                ; $f588: b5 d3
	cmp #$17                 ; $f58a: c9 17 AUDF0
	bcc $f590                ; $f58c: 90 02
loc_f58e:
	dec $d3,x                ; $f58e: d6 d3
loc_f590:
	lda $d1,x                ; $f590: b5 d1
	clc                      ; $f592: 18
	adc $81                  ; $f593: 65 81
	sta $d1,x                ; $f595: 95 d1
	cmp #$6c                 ; $f597: c9 6c CXCLR
	bcc $f59f                ; $f599: 90 04
loc_f59b:
	lda #$f6                 ; $f59b: a9 f6
	sta $d1,x                ; $f59d: 95 d1
loc_f59f:
	dex                      ; $f59f: ca
	bpl $f565                ; $f5a0: 10 c3
loc_f5a2:
	dec $ca                  ; $f5a2: c6 ca
	beq $f5a9                ; $f5a4: f0 03
loc_f5a6:
	jmp $f68c                ; $f5a6: 4c 8c f6

; === Block $f5a9-$f61f (Code) ===
loc_f5a9:
	lda $c7                  ; $f5a9: a5 c7
	beq $f5b1                ; $f5ab: f0 04
loc_f5ad:
	inc $c7                  ; $f5ad: e6 c7
	inc $c7                  ; $f5af: e6 c7
loc_f5b1:
	bit $e5                  ; $f5b1: 24 e5
	bmi $f622                ; $f5b3: 30 6d
loc_f5b5:
	lda $aa                  ; $f5b5: a5 aa
	and #$08                 ; $f5b7: 29 08 COLUPF
	beq $f5e5                ; $f5b9: f0 2a
loc_f5bb:
	eor $aa                  ; $f5bb: 45 aa
	sta $aa                  ; $f5bd: 85 aa
	ldx $99                  ; $f5bf: a6 99
	lda $fd0f,x              ; $f5c1: bd 0f fd
	sta $90                  ; $f5c4: 85 90
	cpx #$03                 ; $f5c6: e0 03 RSYNC
	bcs $f5cc                ; $f5c8: b0 02
loc_f5ca:
	inc $99                  ; $f5ca: e6 99
loc_f5cc:
	bit $98                  ; $f5cc: 24 98
	bmi $f5df                ; $f5ce: 30 0f
loc_f5d0:
	jsr $fefa                ; $f5d0: 20 fa fe
loc_f5d3:
	lda $aa                  ; $f5d3: a5 aa
	and #$06                 ; $f5d5: 29 06 COLUP0
	bne $f5e5                ; $f5d7: d0 0c
loc_f5d9:
	lda $aa                  ; $f5d9: a5 aa
	ora #$01                 ; $f5db: 09 01 VBLANK
	sta $aa                  ; $f5dd: 85 aa
loc_f5df:
	lda #$40                 ; $f5df: a9 40 VSYNC
	sta $ca                  ; $f5e1: 85 ca
	bne $f61f                ; $f5e3: d0 3a
loc_f5e5:
	bit $98                  ; $f5e5: 24 98
	bpl $f5f7                ; $f5e7: 10 0e
loc_f5e9:
	bit $a7                  ; $f5e9: 24 a7
	bmi $f60f                ; $f5eb: 30 22
loc_f5ed:
	lda $db                  ; $f5ed: a5 db
	cmp #$10                 ; $f5ef: c9 10 RESP0
	bne $f60f                ; $f5f1: d0 1c
loc_f5f3:
	lda #$00                 ; $f5f3: a9 00 VSYNC
	beq $f628                ; $f5f5: f0 31
loc_f5f7:
	lda $aa                  ; $f5f7: a5 aa
	and #$01                 ; $f5f9: 29 01 VBLANK
	beq $f622                ; $f5fb: f0 25
loc_f5fd:
	eor $aa                  ; $f5fd: 45 aa
	sta $aa                  ; $f5ff: 85 aa
	lda #$50                 ; $f601: a9 50 RESP0
	sta $d9                  ; $f603: 85 d9
	lda #$05                 ; $f605: a9 05 NUSIZ1
	sta $c6                  ; $f607: 85 c6
	lda $c9                  ; $f609: a5 c9
	bne $f65c                ; $f60b: d0 4f
loc_f60d:
	inc $c9                  ; $f60d: e6 c9
loc_f60f:
	lda $e5                  ; $f60f: a5 e5
	ora #$80                 ; $f611: 09 80
	sta $e5                  ; $f613: 85 e5
	lda $c7                  ; $f615: a5 c7
	bne $f622                ; $f617: d0 09
loc_f619:
	lda #$bf                 ; $f619: a9 bf
	sta $c7                  ; $f61b: 85 c7
	bpl $f622                ; $f61d: 10 03
loc_f61f:
	jmp $f689                ; $f61f: 4c 89 f6

; === Block $f622-$f689 (Code) ===
loc_f622:
	lda $aa                  ; $f622: a5 aa
	and #$06                 ; $f624: 29 06 COLUP0
	beq $f668                ; $f626: f0 40
loc_f628:
	ora #$01                 ; $f628: 09 01 VBLANK
	eor $aa                  ; $f62a: 45 aa
	sta $aa                  ; $f62c: 85 aa
	lda #$23                 ; $f62e: a9 23 HMM1
	sta $9c                  ; $f630: 85 9c
	lda #$75                 ; $f632: a9 75
	sta $9d                  ; $f634: 85 9d
	lda $db                  ; $f636: a5 db
	cmp #$10                 ; $f638: c9 10 RESP0
	bne $f65a                ; $f63a: d0 1e
loc_f63c:
	bit $a7                  ; $f63c: 24 a7
	bmi $f65a                ; $f63e: 30 1a
loc_f640:
	ldx #$0a                 ; $f640: a2 0a CTRLPF
	ldy $90,x                ; $f642: b4 90
	lda $9f,x                ; $f644: b5 9f
	sta $90,x                ; $f646: 95 90
	sty $9f,x                ; $f648: 94 9f
	dex                      ; $f64a: ca
	bpl $f642                ; $f64b: 10 f5
loc_f64d:
	jsr $ff3a                ; $f64d: 20 3a ff
loc_f650:
	lda $aa                  ; $f650: a5 aa
	eor #$40                 ; $f652: 49 40 VSYNC
	sta $aa                  ; $f654: 85 aa
	and #$40                 ; $f656: 29 40 VSYNC
	bne $f65c                ; $f658: d0 02
loc_f65a:
	dec $c9                  ; $f65a: c6 c9
loc_f65c:
	lda #$40                 ; $f65c: a9 40 VSYNC
	sta $ca                  ; $f65e: 85 ca
	lda #$b4                 ; $f660: a9 b4
	sta $9e                  ; $f662: 85 9e
	lda #$00                 ; $f664: a9 00 VSYNC
	sta $cc                  ; $f666: 85 cc
loc_f668:
	dec $c6                  ; $f668: c6 c6
	bne $f689                ; $f66a: d0 1d
loc_f66c:
	lda $91                  ; $f66c: a5 91
	cmp #$07                 ; $f66e: c9 07 COLUP1
	bcc $f689                ; $f670: 90 17
loc_f672:
	jsr $fdfb                ; $f672: 20 fb fd
loc_f675:
	and #$01                 ; $f675: 29 01 VBLANK
	eor $98                  ; $f677: 45 98
	sta $98                  ; $f679: 85 98
	lsr                      ; $f67b: 4a
	lda #$98                 ; $f67c: a9 98
	bcc $f682                ; $f67e: 90 02
loc_f680:
	lda #$00                 ; $f680: a9 00 VSYNC
loc_f682:
	sta $9e                  ; $f682: 85 9e
	lda #$04                 ; $f684: a9 04 NUSIZ0
	jsr $fe8b                ; $f686: 20 8b fe
loc_f689:
	jmp $f875                ; $f689: 4c 75 f8

; === Block $f68c-$f691 (Code) ===
loc_f68c:
	lda $ca                  ; $f68c: a5 ca
	lsr                      ; $f68e: 4a
	bcs $f694                ; $f68f: b0 03
loc_f691:
	jmp $f7db                ; $f691: 4c db f7

; === Block $f694-$f6a0 (Code) ===
loc_f694:
	lda $0282                ; $f694: ad 82 02 SWCHB
	and #$03                 ; $f697: 29 03 RSYNC
	cmp #$02                 ; $f699: c9 02 WSYNC
	bne $f6a3                ; $f69b: d0 06
loc_f69d:
	jsr $feb2                ; $f69d: 20 b2 fe
loc_f6a0:
	jmp $f744                ; $f6a0: 4c 44 f7

; === Block $f6a3-$f6b0 (Code) ===
loc_f6a3:
	lda $0282                ; $f6a3: ad 82 02 SWCHB
	and #$02                 ; $f6a6: 29 02 WSYNC
	beq $f6b3                ; $f6a8: f0 09
loc_f6aa:
	lda $aa                  ; $f6aa: a5 aa
	sta $ed                  ; $f6ac: 85 ed
	bmi $f6ee                ; $f6ae: 30 3e
loc_f6b0:
	jmp $f747                ; $f6b0: 4c 47 f7

; === Block $f6b3-$f6c6 (Code) ===
loc_f6b3:
	lda #$b1                 ; $f6b3: a9 b1
	sta $c7                  ; $f6b5: 85 c7
	bit $aa                  ; $f6b7: 24 aa
	bmi $f6c9                ; $f6b9: 30 0e
loc_f6bb:
	lda $aa                  ; $f6bb: a5 aa
	and #$b0                 ; $f6bd: 29 b0
	ora #$80                 ; $f6bf: 09 80
	sta $ed                  ; $f6c1: 85 ed
	jsr $fec0                ; $f6c3: 20 c0 fe
loc_f6c6:
	jmp $f744                ; $f6c6: 4c 44 f7

; === Block $f6c9-$f6ee (Code) ===
loc_f6c9:
	inc $ed                  ; $f6c9: e6 ed
	lda $ed                  ; $f6cb: a5 ed
	cmp #$0f                 ; $f6cd: c9 0f PF2
	bcc $f6ee                ; $f6cf: 90 1d
loc_f6d1:
	lda $0282                ; $f6d1: ad 82 02 SWCHB
	lsr                      ; $f6d4: 4a
	lda #$0d                 ; $f6d5: a9 0d PF0
	bcc $f6db                ; $f6d7: 90 02
loc_f6d9:
	lda #$02                 ; $f6d9: a9 02 WSYNC
loc_f6db:
	sta $ed                  ; $f6db: 85 ed
	lda $98                  ; $f6dd: a5 98
	and #$f3                 ; $f6df: 29 f3
	sta $98                  ; $f6e1: 85 98
	lda $dc                  ; $f6e3: a5 dc
	clc                      ; $f6e5: 18
	adc #$91                 ; $f6e6: 69 91
	beq $f6ec                ; $f6e8: f0 02
loc_f6ea:
	adc #$70                 ; $f6ea: 69 70
loc_f6ec:
	sta $dc                  ; $f6ec: 85 dc

; === Block $f6ee-$f720 (Code) ===
loc_f6ee:
	lda $aa                  ; $f6ee: a5 aa
	ora #$80                 ; $f6f0: 09 80
	sta $aa                  ; $f6f2: 85 aa
	lda $dc                  ; $f6f4: a5 dc
	lsr                      ; $f6f6: 4a
	lsr                      ; $f6f7: 4a
	lsr                      ; $f6f8: 4a
	lsr                      ; $f6f9: 4a
	sta $ec                  ; $f6fa: 85 ec
	tay                      ; $f6fc: a8
	lda $fd4b,y              ; $f6fd: b9 4b fd
	sta $db                  ; $f700: 85 db
	lda $98                  ; $f702: a5 98
	and #$cf                 ; $f704: 29 cf
	ora $fd52,y              ; $f706: 19 52 fd
	sta $98                  ; $f709: 85 98
	lda #$aa                 ; $f70b: a9 aa
	sta $e7                  ; $f70d: 85 e7
	lda #$a2                 ; $f70f: a9 a2
	sta $e9                  ; $f711: 85 e9
	ldy #$00                 ; $f713: a0 00 VSYNC
	tya                      ; $f715: 98
	sec                      ; $f716: 38
	adc $dc                  ; $f717: 65 dc
	cmp #$0a                 ; $f719: c9 0a CTRLPF
	bcc $f723                ; $f71b: 90 06
loc_f71d:
	iny                      ; $f71d: c8
	sbc #$0a                 ; $f71e: e9 0a CTRLPF
	jmp $f719                ; $f720: 4c 19 f7

; === Block $f723-$f744 (Code) ===
loc_f723:
	adc $fd39,y              ; $f723: 79 39 fd
	sta $e8                  ; $f726: 85 e8
	lda $dc                  ; $f728: a5 dc
	cmp #$63                 ; $f72a: c9 63 HMM1
	lda #$aa                 ; $f72c: a9 aa
	bcc $f732                ; $f72e: 90 02
loc_f730:
	lda #$a1                 ; $f730: a9 a1
loc_f732:
	sta $e6                  ; $f732: 85 e6
	lda $dc                  ; $f734: a5 dc
	cmp #$10                 ; $f736: c9 10 RESP0
	bcs $f73c                ; $f738: b0 02
loc_f73a:
	dec $e9                  ; $f73a: c6 e9
loc_f73c:
	cmp #$09                 ; $f73c: c9 09 COLUBK
	bcs $f744                ; $f73e: b0 04
loc_f740:
	adc #$a1                 ; $f740: 69 a1
	sta $e8                  ; $f742: 85 e8

; === Block $f744-$f744 (Code) ===
loc_f744:
	jmp $f875                ; $f744: 4c 75 f8

; === Block $f747-$f74c (Code) ===
loc_f747:
	lda $ca                  ; $f747: a5 ca
	lsr                      ; $f749: 4a
	bcs $f74f                ; $f74a: b0 03
loc_f74c:
	jmp $f7db                ; $f74c: 4c db f7

; === Block $f74f-$f769 (Code) ===
loc_f74f:
	lda $c7                  ; $f74f: a5 c7
	bne $f74c                ; $f751: d0 f9
loc_f753:
	bit $98                  ; $f753: 24 98
	bmi $f769                ; $f755: 30 12
loc_f757:
	lda $aa                  ; $f757: a5 aa
	and #$07                 ; $f759: 29 07 COLUP1
	bne $f769                ; $f75b: d0 0c
loc_f75d:
	lda $db                  ; $f75d: a5 db
	and #$10                 ; $f75f: 29 10 RESP0
	beq $f7bb                ; $f761: f0 58
loc_f763:
	lda $d5                  ; $f763: a5 d5
	cmp #$ec                 ; $f765: c9 ec
	bcs $f76c                ; $f767: b0 03
loc_f769:
	jmp $f7d8                ; $f769: 4c d8 f7

; === Block $f76c-$f77c (Code) ===
loc_f76c:
	lda $db                  ; $f76c: a5 db
	cmp #$14                 ; $f76e: c9 14 RESBL
	beq $f77a                ; $f770: f0 08
loc_f772:
	cmp #$90                 ; $f772: c9 90
	bne $f77f                ; $f774: d0 09
loc_f776:
	bit $aa                  ; $f776: 24 aa
	bvc $f79b                ; $f778: 50 21
loc_f77a:
	bit $0d                  ; $f77a: 24 0d PF0
	jmp $f79d                ; $f77c: 4c 9d f7

; === Block $f77f-$f7b8 (Code) ===
loc_f77f:
	lda $db                  ; $f77f: a5 db
	bpl $f78d                ; $f781: 10 0a
loc_f783:
	dec $d9                  ; $f783: c6 d9
	bne $f78d                ; $f785: d0 06
loc_f787:
	bit $aa                  ; $f787: 24 aa
	bvc $f79f                ; $f789: 50 14
loc_f78b:
	bvs $f7ab                ; $f78b: 70 1e
loc_f78d:
	bit $aa                  ; $f78d: 24 aa
	bvs $f7a7                ; $f78f: 70 16
loc_f791:
	lda $db                  ; $f791: a5 db
	and #$20                 ; $f793: 29 20 HMP0
	beq $f79b                ; $f795: f0 04
loc_f797:
	bit $0d                  ; $f797: 24 0d PF0
	bpl $f79f                ; $f799: 10 04
loc_f79b:
	bit $0c                  ; $f79b: 24 0c REFP1
loc_f79d:
	bmi $f7d8                ; $f79d: 30 39
loc_f79f:
	lda $98                  ; $f79f: a5 98
	and #$fb                 ; $f7a1: 29 fb
	ldx #$00                 ; $f7a3: a2 00 VSYNC
	bpl $f7b1                ; $f7a5: 10 0a
loc_f7a7:
	bit $0d                  ; $f7a7: 24 0d PF0
	bmi $f7d8                ; $f7a9: 30 2d
loc_f7ab:
	ldx #$01                 ; $f7ab: a2 01 VBLANK
	lda $98                  ; $f7ad: a5 98
	ora #$04                 ; $f7af: 09 04 NUSIZ0
loc_f7b1:
	sta $98                  ; $f7b1: 85 98
	ldy #$00                 ; $f7b3: a0 00 VSYNC
	jsr $fbaf                ; $f7b5: 20 af fb
loc_f7b8:
	jmp $f7d8                ; $f7b8: 4c d8 f7

; === Block $f7bb-$f7d8 (Code) ===
loc_f7bb:
	ldy #$01                 ; $f7bb: a0 01 VBLANK
	ldx #$01                 ; $f7bd: a2 01 VBLANK
	lda $98                  ; $f7bf: a5 98
	and $fcde,y              ; $f7c1: 39 de fc
	bne $f7c7                ; $f7c4: d0 01
loc_f7c6:
	dex                      ; $f7c6: ca
loc_f7c7:
	lda $00d5,y              ; $f7c7: b9 d5 00
	cmp #$ec                 ; $f7ca: c9 ec
	bcc $f7d5                ; $f7cc: 90 07
loc_f7ce:
	lda $0c,x                ; $f7ce: b5 0c REFP1
	bmi $f7d5                ; $f7d0: 30 03
loc_f7d2:
	jsr $fbaf                ; $f7d2: 20 af fb
loc_f7d5:
	dey                      ; $f7d5: 88
	bpl $f7bd                ; $f7d6: 10 e5

; === Block $f7d8-$f7d8 (Code) ===
loc_f7d8:
	jmp $f875                ; $f7d8: 4c 75 f8

; === Block $f7db-$f8ac (Code) ===
loc_f7db:
	lda $aa                  ; $f7db: a5 aa
	and #$07                 ; $f7dd: 29 07 COLUP1
	bne $f7d8                ; $f7df: d0 f7
loc_f7e1:
	tay                      ; $f7e1: a8
	lda $91                  ; $f7e2: a5 91
	beq $f7d8                ; $f7e4: f0 f2
loc_f7e6:
	lda #$eb                 ; $f7e6: a9 eb
	sta $ee                  ; $f7e8: 85 ee
	cmp $d2                  ; $f7ea: c5 d2
	bcs $f7d8                ; $f7ec: b0 ea
loc_f7ee:
	jsr $fdfb                ; $f7ee: 20 fb fd
loc_f7f1:
	bpl $f80d                ; $f7f1: 10 1a
loc_f7f3:
	and #$03                 ; $f7f3: 29 03 RSYNC
	asl                      ; $f7f5: 0a
	sta $ee                  ; $f7f6: 85 ee
	lda $ea                  ; $f7f8: a5 ea
	lsr                      ; $f7fa: 4a
	lsr                      ; $f7fb: 4a
	tax                      ; $f7fc: aa
	txa                      ; $f7fd: 8a
	sec                      ; $f7fe: 38
	adc $ee                  ; $f7ff: 65 ee
	and #$07                 ; $f801: 29 07 COLUP1
	tax                      ; $f803: aa
	lda $fcdc,x              ; $f804: bd dc fc
	and $eb                  ; $f807: 25 eb
	beq $f7fd                ; $f809: f0 f2
loc_f80b:
	bne $f83c                ; $f80b: d0 2f
loc_f80d:
	lda $98                  ; $f80d: a5 98
	and #$04                 ; $f80f: 29 04 NUSIZ0
	beq $f814                ; $f811: f0 01
loc_f813:
	iny                      ; $f813: c8
loc_f814:
	ldx #$05                 ; $f814: a2 05 NUSIZ1
	lda $fcdc,x              ; $f816: bd dc fc
	and $eb                  ; $f819: 25 eb
	beq $f82d                ; $f81b: f0 10
loc_f81d:
	lda $9a                  ; $f81d: a5 9a
	clc                      ; $f81f: 18
	adc #$fd                 ; $f820: 69 fd
	clc                      ; $f822: 18
	adc $fd39,x              ; $f823: 7d 39 fd
	cmp $009c,y              ; $f826: d9 9c 00
	bcc $f831                ; $f829: 90 06
loc_f82b:
	stx $ee                  ; $f82b: 86 ee
loc_f82d:
	dex                      ; $f82d: ca
	bpl $f816                ; $f82e: 10 e6
loc_f830:
	inx                      ; $f830: e8
loc_f831:
	lda $ea                  ; $f831: a5 ea
	and #$10                 ; $f833: 29 10 RESP0
	bne $f83c                ; $f835: d0 05
loc_f837:
	lda $ee                  ; $f837: a5 ee
	bmi $f83c                ; $f839: 30 01
loc_f83b:
	tax                      ; $f83b: aa
loc_f83c:
	stx $ef                  ; $f83c: 86 ef
	lda $fcdc,x              ; $f83e: bd dc fc
	sta $f0                  ; $f841: 85 f0
	ldx #$ff                 ; $f843: a2 ff
	inx                      ; $f845: e8
	cpx #$06                 ; $f846: e0 06 COLUP0
	bcs $f875                ; $f848: b0 2b
loc_f84a:
	lda $92,x                ; $f84a: b5 92
	and $f0                  ; $f84c: 25 f0
	beq $f845                ; $f84e: f0 f5
loc_f850:
	lda #$3c                 ; $f850: a9 3c
	adc $90                  ; $f852: 65 90
	sbc $fd31,x              ; $f854: fd 31 fd
	sta $d2                  ; $f857: 85 d2
	sec                      ; $f859: 38
	sbc $d1                  ; $f85a: e5 d1
	cmp #$10                 ; $f85c: c9 10 RESP0
	bcc $f871                ; $f85e: 90 11
loc_f860:
	cmp #$f1                 ; $f860: c9 f1
	bcs $f871                ; $f862: b0 0d
loc_f864:
	ldy $ef                  ; $f864: a4 ef
	lda $9a                  ; $f866: a5 9a
	adc $fd39,y              ; $f868: 79 39 fd
	adc #$04                 ; $f86b: 69 04 NUSIZ0
	sta $d4                  ; $f86d: 85 d4
	bne $f875                ; $f86f: d0 04
loc_f871:
	lda #$f6                 ; $f871: a9 f6
	sta $d2                  ; $f873: 85 d2
loc_f875:
	lda $aa                  ; $f875: a5 aa
	and #$07                 ; $f877: 29 07 COLUP1
	bne $f8f5                ; $f879: d0 7a
loc_f87b:
	bit $98                  ; $f87b: 24 98
	bmi $f8f5                ; $f87d: 30 76
loc_f87f:
	ldy #$ff                 ; $f87f: a0 ff
	lda $91                  ; $f881: a5 91
	beq $f8f5                ; $f883: f0 70
loc_f885:
	iny                      ; $f885: c8
	cmp $fce4,y              ; $f886: d9 e4 fc
	bcc $f885                ; $f889: 90 fa
loc_f88b:
	lda $fcf6,y              ; $f88b: b9 f6 fc
	sta $ee                  ; $f88e: 85 ee
	lda $fced,y              ; $f890: b9 ed fc
	sta $ef                  ; $f893: 85 ef
	lda $ca                  ; $f895: a5 ca
	and #$3f                 ; $f897: 29 3f
	sta $f0                  ; $f899: 85 f0
	clc                      ; $f89b: 18
	adc $ef                  ; $f89c: 65 ef
	cmp #$41                 ; $f89e: c9 41 VBLANK
	bcs $f8f5                ; $f8a0: b0 53
loc_f8a2:
	lda $f0                  ; $f8a2: a5 f0
	beq $f8af                ; $f8a4: f0 09
loc_f8a6:
	cmp $ef                  ; $f8a6: c5 ef
	bcc $f8f5                ; $f8a8: 90 4b
loc_f8aa:
	sbc $ef                  ; $f8aa: e5 ef
	jmp $f8a4                ; $f8ac: 4c a4 f8

; === Block $f8af-$f8f5 (Code) ===
loc_f8af:
	bit $8b                  ; $f8af: 24 8b
	lda #$09                 ; $f8b1: a9 09 COLUBK
	bvs $f8b7                ; $f8b3: 70 02
loc_f8b5:
	lda #$ff                 ; $f8b5: a9 ff
loc_f8b7:
	sta $8b                  ; $f8b7: 85 8b
	lda #$01                 ; $f8b9: a9 01 VBLANK
	jsr $fe7e                ; $f8bb: 20 7e fe
loc_f8be:
	lda $98                  ; $f8be: a5 98
	and #$02                 ; $f8c0: 29 02 WSYNC
	beq $f8d3                ; $f8c2: f0 0f
loc_f8c4:
	lda $9a                  ; $f8c4: a5 9a
	clc                      ; $f8c6: 18
	adc $ee                  ; $f8c7: 65 ee
	sta $9a                  ; $f8c9: 85 9a
	cmp $8d                  ; $f8cb: c5 8d
	bcc $f8f5                ; $f8cd: 90 26
loc_f8cf:
	lda $8d                  ; $f8cf: a5 8d
	bne $f8e0                ; $f8d1: d0 0d
loc_f8d3:
	lda $9a                  ; $f8d3: a5 9a
	sec                      ; $f8d5: 38
	sbc $ee                  ; $f8d6: e5 ee
	sta $9a                  ; $f8d8: 85 9a
	cmp #$17                 ; $f8da: c9 17 AUDF0
	bcs $f8f5                ; $f8dc: b0 17
loc_f8de:
	lda #$17                 ; $f8de: a9 17 AUDF0
loc_f8e0:
	sta $9a                  ; $f8e0: 85 9a
	lda $98                  ; $f8e2: a5 98
	eor #$02                 ; $f8e4: 49 02 WSYNC
	sta $98                  ; $f8e6: 85 98
	bmi $f8f5                ; $f8e8: 30 0b
loc_f8ea:
	bit $aa                  ; $f8ea: 24 aa
	bmi $f8f5                ; $f8ec: 30 07
loc_f8ee:
	lda $90                  ; $f8ee: a5 90
	clc                      ; $f8f0: 18
	adc #$05                 ; $f8f1: 69 05 NUSIZ1
	sta $90                  ; $f8f3: 85 90

; === Block $f8f5-$fa61 (Code) ===
loc_f8f5:
	lda #$05                 ; $f8f5: a9 05 NUSIZ1
	sta $8c                  ; $f8f7: 85 8c
	lda #$0b                 ; $f8f9: a9 0b REFP0
	sec                      ; $f8fb: 38
	sbc $90                  ; $f8fc: e5 90
	sta $8e                  ; $f8fe: 85 8e
	bit $98                  ; $f900: 24 98
	bvs $f90b                ; $f902: 70 07
loc_f904:
	lda $8e                  ; $f904: a5 8e
	clc                      ; $f906: 18
	adc #$0c                 ; $f907: 69 0c REFP1
	sta $8e                  ; $f909: 85 8e
loc_f90b:
	ldx #$fb                 ; $f90b: a2 fb
	lda $97,x                ; $f90d: b5 97
	bne $f91d                ; $f90f: d0 0c
loc_f911:
	dec $8c                  ; $f911: c6 8c
	lda $8e                  ; $f913: a5 8e
	clc                      ; $f915: 18
	adc #$09                 ; $f916: 69 09 COLUBK
	sta $8e                  ; $f918: 85 8e
	inx                      ; $f91a: e8
	bne $f90d                ; $f91b: d0 f0
loc_f91d:
	lda $8e                  ; $f91d: a5 8e
	bpl $f952                ; $f91f: 10 31
loc_f921:
	lda $98                  ; $f921: a5 98
	and #$40                 ; $f923: 29 40 VSYNC
	beq $f934                ; $f925: f0 0d
loc_f927:
	eor $98                  ; $f927: 45 98
	sta $98                  ; $f929: 85 98
	lda $8e                  ; $f92b: a5 8e
	clc                      ; $f92d: 18
	adc #$0c                 ; $f92e: 69 0c REFP1
	sta $8e                  ; $f930: 85 8e
	bpl $f952                ; $f932: 10 1e
loc_f934:
	lda #$00                 ; $f934: a9 00 VSYNC
	sta $8e                  ; $f936: 85 8e
	lda $98                  ; $f938: a5 98
	bmi $f952                ; $f93a: 30 16
loc_f93c:
	ora #$80                 ; $f93c: 09 80
	sta $98                  ; $f93e: 85 98
	ldy $8c                  ; $f940: a4 8c
	lda $90                  ; $f942: a5 90
	clc                      ; $f944: 18
	adc $fff2,y              ; $f945: 79 f2 ff
	sta $90                  ; $f948: 85 90
	jsr $fe75                ; $f94a: 20 75 fe
loc_f94d:
	lda #$06                 ; $f94d: a9 06 COLUP0
	jsr $fe7e                ; $f94f: 20 7e fe
loc_f952:
	ldx #$05                 ; $f952: a2 05 NUSIZ1
	lda #$00                 ; $f954: a9 00 VSYNC
	ora $92,x                ; $f956: 15 92
	dex                      ; $f958: ca
	bpl $f956                ; $f959: 10 fb
loc_f95b:
	sta $eb                  ; $f95b: 85 eb
	lda $eb                  ; $f95d: a5 eb
	beq $f98e                ; $f95f: f0 2d
loc_f961:
	lsr                      ; $f961: 4a
	bcs $f97c                ; $f962: b0 18
loc_f964:
	jsr $fbed                ; $f964: 20 ed fb
loc_f967:
	lda #$3a                 ; $f967: a9 3a
	sta $c8                  ; $f969: 85 c8
	ldx #$05                 ; $f96b: a2 05 NUSIZ1
	lsr $92,x                ; $f96d: 56 92
	dex                      ; $f96f: ca
	bpl $f96d                ; $f970: 10 fb
loc_f972:
	lda $9a                  ; $f972: a5 9a
	adc #$10                 ; $f974: 69 10 RESP0
	sta $9a                  ; $f976: 85 9a
	lsr $eb                  ; $f978: 46 eb
	bne $f95d                ; $f97a: d0 e1
loc_f97c:
	ldx #$06                 ; $f97c: a2 06 COLUP0
	dex                      ; $f97e: ca
	lda $fcdc,x              ; $f97f: bd dc fc
	and $eb                  ; $f982: 25 eb
	beq $f97e                ; $f984: f0 f8
loc_f986:
	lda #$82                 ; $f986: a9 82
	sec                      ; $f988: 38
	sbc $fd39,x              ; $f989: fd 39 fd
	sta $8d                  ; $f98c: 85 8d
loc_f98e:
	lda $90                  ; $f98e: a5 90
	sta $8f                  ; $f990: 85 8f
	ldx #$04                 ; $f992: a2 04 NUSIZ0
	lda $99,x                ; $f994: b5 99
	jsr $fd67                ; $f996: 20 67 fd
loc_f999:
	dex                      ; $f999: ca
	bne $f994                ; $f99a: d0 f8
loc_f99c:
	lda $0282                ; $f99c: ad 82 02 SWCHB
	and #$08                 ; $f99f: 29 08 COLUPF
	tay                      ; $f9a1: a8
	beq $f9a6                ; $f9a2: f0 02
loc_f9a4:
	lda #$f7                 ; $f9a4: a9 f7
loc_f9a6:
	ora #$07                 ; $f9a6: 09 07 COLUP1
	sta $ee                  ; $f9a8: 85 ee
	ldx #$f8                 ; $f9aa: a2 f8
	lda $fcff,y              ; $f9ac: b9 ff fc
	eor $c7                  ; $f9af: 45 c7
	and $ee                  ; $f9b1: 25 ee
	sta $e5,x                ; $f9b3: 95 e5
	iny                      ; $f9b5: c8
	inx                      ; $f9b6: e8
	bmi $f9ac                ; $f9b7: 30 f3
loc_f9b9:
	bit $aa                  ; $f9b9: 24 aa
	bmi $f9c1                ; $f9bb: 30 04
loc_f9bd:
	lda $c7                  ; $f9bd: a5 c7
	bne $f9d3                ; $f9bf: d0 12
loc_f9c1:
	lda $c8                  ; $f9c1: a5 c8
	and #$38                 ; $f9c3: 29 38
	cmp #$30                 ; $f9c5: c9 30
	bne $f9d3                ; $f9c7: d0 0a
loc_f9c9:
	lda $dc                  ; $f9c9: a5 dc
	and #$08                 ; $f9cb: 29 08 COLUPF
	beq $f9d3                ; $f9cd: f0 04
loc_f9cf:
	lda $e3                  ; $f9cf: a5 e3
	sta $e1                  ; $f9d1: 85 e1
loc_f9d3:
	lda $de                  ; $f9d3: a5 de
	sta $06                  ; $f9d5: 85 06 COLUP0
	lda $e3                  ; $f9d7: a5 e3
	sta $09                  ; $f9d9: 85 09 COLUBK
	lda $e2                  ; $f9db: a5 e2
	sta $08                  ; $f9dd: 85 08 COLUPF
	lda $ca                  ; $f9df: a5 ca
	lsr                      ; $f9e1: 4a
	ldx #$04                 ; $f9e2: a2 04 NUSIZ0
	bcs $f9e8                ; $f9e4: b0 02
loc_f9e6:
	ldx #$00                 ; $f9e6: a2 00 VSYNC
loc_f9e8:
	stx $ef                  ; $f9e8: 86 ef
	lda $d1,x                ; $f9ea: b5 d1
	cmp $d2,x                ; $f9ec: d5 d2
	bcc $fa1b                ; $f9ee: 90 2b
loc_f9f0:
	sta $81                  ; $f9f0: 85 81
	lda $d2,x                ; $f9f2: b5 d2
	sta $d1,x                ; $f9f4: 95 d1
	lda $81                  ; $f9f6: a5 81
	sta $d2,x                ; $f9f8: 95 d2
	lda $d3,x                ; $f9fa: b5 d3
	sta $81                  ; $f9fc: 85 81
	lda $d4,x                ; $f9fe: b5 d4
	sta $d3,x                ; $fa00: 95 d3
	lda $81                  ; $fa02: a5 81
	sta $d4,x                ; $fa04: 95 d4
	lda $ca                  ; $fa06: a5 ca
	lsr                      ; $fa08: 4a
	bcc $fa1b                ; $fa09: 90 10
loc_fa0b:
	lda $98                  ; $fa0b: a5 98
	and #$0c                 ; $fa0d: 29 0c REFP1
	lsr                      ; $fa0f: 4a
	lsr                      ; $fa10: 4a
	tay                      ; $fa11: a8
	lda $98                  ; $fa12: a5 98
	and #$f3                 ; $fa14: 29 f3
	ora $fd1a,y              ; $fa16: 19 1a fd
	sta $98                  ; $fa19: 85 98
loc_fa1b:
	lda $d4,x                ; $fa1b: b5 d4
	ldx #$05                 ; $fa1d: a2 05 NUSIZ1
	jsr $fd67                ; $fa1f: 20 67 fd
loc_fa22:
	ldx $ef                  ; $fa22: a6 ef
	lda $d1,x                ; $fa24: b5 d1
	sta $89                  ; $fa26: 85 89
	lda $d2,x                ; $fa28: b5 d2
	cmp #$ec                 ; $fa2a: c9 ec
	bcs $fa31                ; $fa2c: b0 03
loc_fa2e:
	sec                      ; $fa2e: 38
	sbc $d1,x                ; $fa2f: f5 d1
loc_fa31:
	sta $8a                  ; $fa31: 85 8a
	lda $d3,x                ; $fa33: b5 d3
	ldx #$00                 ; $fa35: a2 00 VSYNC
	jsr $fd67                ; $fa37: 20 67 fd
loc_fa3a:
	ldx #$04                 ; $fa3a: a2 04 NUSIZ0
	jsr $fd7e                ; $fa3c: 20 7e fd
loc_fa3f:
	sta $02                  ; $fa3f: 85 02 WSYNC
	sta $2a                  ; $fa41: 85 2a HMOVE
	lda $0284                ; $fa43: ad 84 02 INTIM
	bne $fa43                ; $fa46: d0 fb
loc_fa48:
	sta $01                  ; $fa48: 85 01 VBLANK
	sta $2c                  ; $fa4a: 85 2c CXCLR
	ldx #$00                 ; $fa4c: a2 00 VSYNC
	lda #$ea                 ; $fa4e: a9 ea
	sta $02                  ; $fa50: 85 02 WSYNC
	sta $0296                ; $fa52: 8d 96 02 TIM64T
	sta $2b                  ; $fa55: 85 2b HMCLR
	bit $aa                  ; $fa57: 24 aa
	bmi $fa64                ; $fa59: 30 09
loc_fa5b:
	lda $9e                  ; $fa5b: a5 9e
	cmp #$b4                 ; $fa5d: c9 b4
	beq $fa64                ; $fa5f: f0 03
loc_fa61:
	jmp $fb0d                ; $fa61: 4c 0d fb

; === Block $fa64-$fba6 (Code) ===
loc_fa64:
	ldx #$07                 ; $fa64: a2 07 COLUP1
	ldy #$03                 ; $fa66: a0 03 RSYNC
	lda $00e6,y              ; $fa68: b9 e6 00
	and #$0f                 ; $fa6b: 29 0f PF2
	sta $f0                  ; $fa6d: 85 f0
	asl                      ; $fa6f: 0a
	asl                      ; $fa70: 0a
	adc $f0                  ; $fa71: 65 f0
	adc #$54                 ; $fa73: 69 54 RESBL
	sta $f0,x                ; $fa75: 95 f0
	dex                      ; $fa77: ca
	lda $00e6,y              ; $fa78: b9 e6 00
	lsr                      ; $fa7b: 4a
	lsr                      ; $fa7c: 4a
	lsr                      ; $fa7d: 4a
	lsr                      ; $fa7e: 4a
	sta $f0                  ; $fa7f: 85 f0
	asl                      ; $fa81: 0a
	asl                      ; $fa82: 0a
	adc $f0                  ; $fa83: 65 f0
	adc #$54                 ; $fa85: 69 54 RESBL
	sta $f0,x                ; $fa87: 95 f0
	dex                      ; $fa89: ca
	dey                      ; $fa8a: 88
	bpl $fa68                ; $fa8b: 10 db
loc_fa8d:
	sta $02                  ; $fa8d: 85 02 WSYNC
	lda $df                  ; $fa8f: a5 df
	sta $06                  ; $fa91: 85 06 COLUP0
	lda #$02                 ; $fa93: a9 02 WSYNC
	sta $0a                  ; $fa95: 85 0a CTRLPF
	lda $e0                  ; $fa97: a5 e0
	sta $07                  ; $fa99: 85 07 COLUP1
	lda #$04                 ; $fa9b: a9 04 NUSIZ0
	sta $ee                  ; $fa9d: 85 ee
	lda #$ff                 ; $fa9f: a9 ff
	sta $ef                  ; $faa1: 85 ef
	nop                      ; $faa3: ea
	nop                      ; $faa4: ea
	ldx #$05                 ; $faa5: a2 05 NUSIZ1
	dex                      ; $faa7: ca
	bpl $faa7                ; $faa8: 10 fd
loc_faaa:
	ldy $f0                  ; $faaa: a4 f0
	lda ($ee),y              ; $faac: b1 ee
	sta $0d                  ; $faae: 85 0d PF0
	lda #$00                 ; $fab0: a9 00 VSYNC
	sta $0e                  ; $fab2: 85 0e PF1
	ldy $f5                  ; $fab4: a4 f5
	lda ($ee),y              ; $fab6: b1 ee
	lsr                      ; $fab8: 4a
	lsr                      ; $fab9: 4a
	lsr                      ; $faba: 4a
	lsr                      ; $fabb: 4a
	sta $0f                  ; $fabc: 85 0f PF2
	ldy $f2                  ; $fabe: a4 f2
	lda ($ee),y              ; $fac0: b1 ee
	sta $0d                  ; $fac2: 85 0d PF0
	ldy $f7                  ; $fac4: a4 f7
	lda ($ee),y              ; $fac6: b1 ee
	lsr                      ; $fac8: 4a
	lsr                      ; $fac9: 4a
	lsr                      ; $faca: 4a
	lsr                      ; $facb: 4a
	sta $0f                  ; $facc: 85 0f PF2
	ldy $f4                  ; $face: a4 f4
	lda ($ee),y              ; $fad0: b1 ee
	and #$0f                 ; $fad2: 29 0f PF2
	sta $81                  ; $fad4: 85 81
	ldy $f1                  ; $fad6: a4 f1
	lda ($ee),y              ; $fad8: b1 ee
	asl                      ; $fada: 0a
	asl                      ; $fadb: 0a
	asl                      ; $fadc: 0a
	asl                      ; $fadd: 0a
	ora $81                  ; $fade: 05 81
	sta $0e                  ; $fae0: 85 0e PF1
	lda #$00                 ; $fae2: a9 00 VSYNC
	sta $0d                  ; $fae4: 85 0d PF0
	sta $0f                  ; $fae6: 85 0f PF2
	ldy $f6                  ; $fae8: a4 f6
	lda ($ee),y              ; $faea: b1 ee
	and #$0f                 ; $faec: 29 0f PF2
	sta $81                  ; $faee: 85 81
	ldy $f3                  ; $faf0: a4 f3
	lda ($ee),y              ; $faf2: b1 ee
	asl                      ; $faf4: 0a
	asl                      ; $faf5: 0a
	asl                      ; $faf6: 0a
	asl                      ; $faf7: 0a
	ora $81                  ; $faf8: 05 81
	sta $0e                  ; $fafa: 85 0e PF1
	dec $ee                  ; $fafc: c6 ee
	bpl $faaa                ; $fafe: 10 aa
loc_fb00:
	lda $89                  ; $fb00: a5 89
	clc                      ; $fb02: 18
	adc #$f9                 ; $fb03: 69 f9
	sta $89                  ; $fb05: 85 89
	lda #$00                 ; $fb07: a9 00 VSYNC
	sta $0e                  ; $fb09: 85 0e PF1
	beq $fb55                ; $fb0b: f0 48
loc_fb0d:
	jsr $fd67                ; $fb0d: 20 67 fd
loc_fb10:
	jsr $fd7e                ; $fb10: 20 7e fd
loc_fb13:
	jsr $fde9                ; $fb13: 20 e9 fd
loc_fb16:
	lda #$a0                 ; $fb16: a9 a0
	sta $ee                  ; $fb18: 85 ee
	lda #$fc                 ; $fb1a: a9 fc
	sta $ef                  ; $fb1c: 85 ef
	lda #$00                 ; $fb1e: a9 00 VSYNC
	sta $04                  ; $fb20: 85 04 NUSIZ0
	sta $02                  ; $fb22: 85 02 WSYNC
	sta $2a                  ; $fb24: 85 2a HMOVE
	lda $c8                  ; $fb26: a5 c8
	and #$39                 ; $fb28: 29 39
	cmp #$39                 ; $fb2a: c9 39
	bne $fb3c                ; $fb2c: d0 0e
loc_fb2e:
	lda $c8                  ; $fb2e: a5 c8
	rol                      ; $fb30: 2a
	rol                      ; $fb31: 2a
	rol                      ; $fb32: 2a
	rol                      ; $fb33: 2a
	and #$03                 ; $fb34: 29 03 RSYNC
	tay                      ; $fb36: a8
	lda $fd1e,y              ; $fb37: b9 1e fd
	sta $ee                  ; $fb3a: 85 ee
loc_fb3c:
	sta $02                  ; $fb3c: 85 02 WSYNC
	sta $2b                  ; $fb3e: 85 2b HMCLR
	jsr $fde9                ; $fb40: 20 e9 fd
loc_fb43:
	ldy #$09                 ; $fb43: a0 09 COLUBK
	sta $02                  ; $fb45: 85 02 WSYNC
	lda ($ee),y              ; $fb47: b1 ee
	sta $1b                  ; $fb49: 85 1b GRP0
	tya                      ; $fb4b: 98
	lsr                      ; $fb4c: 4a
	bcs $fb52                ; $fb4d: b0 03
loc_fb4f:
	jsr $fde9                ; $fb4f: 20 e9 fd
loc_fb52:
	dey                      ; $fb52: 88
	bpl $fb45                ; $fb53: 10 f0
loc_fb55:
	lda #$00                 ; $fb55: a9 00 VSYNC
	sta $02                  ; $fb57: 85 02 WSYNC
	sta $1b                  ; $fb59: 85 1b GRP0
	lda $84                  ; $fb5b: a5 84
	sta $21                  ; $fb5d: 85 21 HMP1
	sta $20                  ; $fb5f: 85 20 HMP0
	and #$0f                 ; $fb61: 29 0f PF2
	tay                      ; $fb63: a8
	dey                      ; $fb64: 88
	bpl $fb64                ; $fb65: 10 fd
loc_fb67:
	sta $10                  ; $fb67: 85 10 RESP0
	lda #$06                 ; $fb69: a9 06 COLUP0
	sta $11                  ; $fb6b: 85 11 RESP1
	sta $02                  ; $fb6d: 85 02 WSYNC
	sta $2a                  ; $fb6f: 85 2a HMOVE
	sta $04                  ; $fb71: 85 04 NUSIZ0
	sta $05                  ; $fb73: 85 05 NUSIZ1
	ldx #$0a                 ; $fb75: a2 0a CTRLPF
	lda #$fc                 ; $fb77: a9 fc
	sta $ef,x                ; $fb79: 95 ef
	dex                      ; $fb7b: ca
	dex                      ; $fb7c: ca
	bpl $fb79                ; $fb7d: 10 fa
loc_fb7f:
	jsr $fde9                ; $fb7f: 20 e9 fd
loc_fb82:
	lda $02                  ; $fb82: a5 02 WSYNC
	and #$40                 ; $fb84: 29 40 VSYNC
	sta $82                  ; $fb86: 85 82
	sta $2c                  ; $fb88: 85 2c CXCLR
	sta $2b                  ; $fb8a: 85 2b HMCLR
	lda #$f0                 ; $fb8c: a9 f0
	sta $21                  ; $fb8e: 85 21 HMP1
	sta $02                  ; $fb90: 85 02 WSYNC
	sta $2a                  ; $fb92: 85 2a HMOVE
	lda $e1                  ; $fb94: a5 e1
	sta $06                  ; $fb96: 85 06 COLUP0
	sta $07                  ; $fb98: 85 07 COLUP1
	dec $8f                  ; $fb9a: c6 8f
	bpl $fba9                ; $fb9c: 10 0b
loc_fb9e:
	ldy #$05                 ; $fb9e: a0 05 NUSIZ1
	lda #$01                 ; $fba0: a9 01 VBLANK
	sta $25                  ; $fba2: 85 25 VDELP0
	sta $26                  ; $fba4: 85 26 VDELP1
	jmp $f0a5                ; $fba6: 4c a5 f0

; === Block $fba9-$fbac (Code) ===
loc_fba9:
	jsr $fdb2                ; $fba9: 20 b2 fd
loc_fbac:
	jmp $fb9a                ; $fbac: 4c 9a fb

; === Block $fbaf-$fbec (Code) ===
loc_fbaf:
	stx $f2                  ; $fbaf: 86 f2
	ldx $fd38,y              ; $fbb1: be 38 fd
	lda $d5,x                ; $fbb4: b5 d5
	cmp #$56                 ; $fbb6: c9 56 AUDC1
	bcs $fbbe                ; $fbb8: b0 04
loc_fbba:
	cmp #$45                 ; $fbba: c9 45 NUSIZ1
	bcs $fbec                ; $fbbc: b0 2e
loc_fbbe:
	ldx $f2                  ; $fbbe: a6 f2
	lda #$55                 ; $fbc0: a9 55 AUDC0
	sta $00d5,y              ; $fbc2: 99 d5 00
	lda $fce2,x              ; $fbc5: bd e2 fc
	and $0282                ; $fbc8: 2d 82 02 SWCHB
	clc                      ; $fbcb: 18
	beq $fbd0                ; $fbcc: f0 02
loc_fbce:
	lda #$04                 ; $fbce: a9 04 NUSIZ0
loc_fbd0:
	adc #$05                 ; $fbd0: 69 05 NUSIZ1
	adc $9c,x                ; $fbd2: 75 9c
	sta $00d7,y              ; $fbd4: 99 d7 00
	lda #$03                 ; $fbd7: a9 03 RSYNC
	jsr $fe8b                ; $fbd9: 20 8b fe
loc_fbdc:
	lda $db                  ; $fbdc: a5 db
	and #$80                 ; $fbde: 29 80
	beq $fbec                ; $fbe0: f0 0a
loc_fbe2:
	lda $aa                  ; $fbe2: a5 aa
	eor #$40                 ; $fbe4: 49 40 VSYNC
	sta $aa                  ; $fbe6: 85 aa
	lda #$50                 ; $fbe8: a9 50 RESP0
	sta $d9                  ; $fbea: 85 d9
loc_fbec:
	rts                      ; $fbec: 60

; === Block $fbed-$fbf1 (Code) ===
loc_fbed:
	lda $c8                  ; $fbed: a5 c8
	and #$39                 ; $fbef: 29 39

; === Block $fbf1-$fbfd (Code) ===
loc_fbf1:
	cmp #$39                 ; $fbf1: c9 39
	bne $fbfd                ; $fbf3: d0 08
loc_fbf5:
	lda #$b4                 ; $fbf5: a9 b4
	sta $9e                  ; $fbf7: 85 9e
	lda #$00                 ; $fbf9: a9 00 VSYNC
	sta $cc                  ; $fbfb: 85 cc
loc_fbfd:
	rts                      ; $fbfd: 60

; === Block $fd67-$fd7d (Code) ===
loc_fd67:
	ldy #$ff                 ; $fd67: a0 ff
	sec                      ; $fd69: 38
	iny                      ; $fd6a: c8
	sbc #$0f                 ; $fd6b: e9 0f PF2
	bcs $fd6a                ; $fd6d: b0 fb
loc_fd6f:
	eor #$ff                 ; $fd6f: 49 ff
	sbc #$06                 ; $fd71: e9 06 COLUP0
	asl                      ; $fd73: 0a
	asl                      ; $fd74: 0a
	asl                      ; $fd75: 0a
	asl                      ; $fd76: 0a
	sty $83,x                ; $fd77: 94 83
	ora $83,x                ; $fd79: 15 83
	sta $83,x                ; $fd7b: 95 83
	rts                      ; $fd7d: 60

; === Block $fd7e-$fd8a (Code) ===
loc_fd7e:
	sta $02                  ; $fd7e: 85 02 WSYNC
	nop                      ; $fd80: ea
	iny                      ; $fd81: c8
	sta $20,x                ; $fd82: 95 20 HMP0
	nop                      ; $fd84: ea
	dey                      ; $fd85: 88
	bpl $fd85                ; $fd86: 10 fd
loc_fd88:
	sta $10,x                ; $fd88: 95 10 RESP0
	rts                      ; $fd8a: 60

; === Block $fd8b-$fd8f (Code) ===
loc_fd8b:
	cpy #$09                 ; $fd8b: c0 09 COLUBK
	bcs $fdb1                ; $fd8d: b0 22

; === Block $fd8f-$fdb1 (Code) ===
loc_fd8f:
	stx $ee                  ; $fd8f: 86 ee
	inx                      ; $fd91: e8
	jsr $fdfb                ; $fd92: 20 fb fd
loc_fd95:
	and #$20                 ; $fd95: 29 20 HMP0
	bne $fd9b                ; $fd97: d0 02
loc_fd99:
	dex                      ; $fd99: ca
	dex                      ; $fd9a: ca
loc_fd9b:
	cpx #$08                 ; $fd9b: e0 08 COLUPF
	bcs $fda8                ; $fd9d: b0 09
loc_fd9f:
	lda $ea                  ; $fd9f: a5 ea
	cmp #$c0                 ; $fda1: c9 c0
	bcc $fda8                ; $fda3: 90 03
loc_fda5:
	jsr $fdaa                ; $fda5: 20 aa fd
loc_fda8:
	ldx $ee                  ; $fda8: a6 ee
loc_fdaa:
	lda ($f0),y              ; $fdaa: b1 f0
	and $ff4c,x              ; $fdac: 3d 4c ff
	sta ($f0),y              ; $fdaf: 91 f0
	rts                      ; $fdb1: 60

; === Block $fdb2-$fde8 (Code) ===
loc_fdb2:
	dec $89                  ; $fdb2: c6 89
	lda $89                  ; $fdb4: a5 89
	bmi $fdc7                ; $fdb6: 30 0f
loc_fdb8:
	cmp #$04                 ; $fdb8: c9 04 NUSIZ0
	lda #$02                 ; $fdba: a9 02 WSYNC
	bcc $fdbf                ; $fdbc: 90 01
loc_fdbe:
	lsr                      ; $fdbe: 4a
loc_fdbf:
	sta $1f                  ; $fdbf: 85 1f ENABL
	sta $02                  ; $fdc1: 85 02 WSYNC
	sta $2b                  ; $fdc3: 85 2b HMCLR
	bpl $fde4                ; $fdc5: 10 1d
loc_fdc7:
	clc                      ; $fdc7: 18
	adc $8a                  ; $fdc8: 65 8a
	sta $89                  ; $fdca: 85 89
	lda #$00                 ; $fdcc: a9 00 VSYNC
	sta $02                  ; $fdce: 85 02 WSYNC
	sta $2b                  ; $fdd0: 85 2b HMCLR
	sta $1f                  ; $fdd2: 85 1f ENABL
	lda $88                  ; $fdd4: a5 88
	sta $24                  ; $fdd6: 85 24 HMBL
	and #$0f                 ; $fdd8: 29 0f PF2
	tay                      ; $fdda: a8
	dey                      ; $fddb: 88
	bpl $fddb                ; $fddc: 10 fd
loc_fdde:
	sta $14                  ; $fdde: 85 14 RESBL
	lda #$7c                 ; $fde0: a9 7c
	sta $8a                  ; $fde2: 85 8a
loc_fde4:
	sta $02                  ; $fde4: 85 02 WSYNC
	sta $2a                  ; $fde6: 85 2a HMOVE
	rts                      ; $fde8: 60

; === Block $fde9-$fdfa (Code) ===
loc_fde9:
	dec $89                  ; $fde9: c6 89
	lda $89                  ; $fdeb: a5 89
	cmp #$04                 ; $fded: c9 04 NUSIZ0
	bcc $fdf5                ; $fdef: 90 04
loc_fdf1:
	lda #$00                 ; $fdf1: a9 00 VSYNC
	bcs $fdf8                ; $fdf3: b0 03
loc_fdf5:
	nop                      ; $fdf5: ea
	lda #$02                 ; $fdf6: a9 02 WSYNC
loc_fdf8:
	sta $1f                  ; $fdf8: 85 1f ENABL
	rts                      ; $fdfa: 60

; === Block $fdfb-$fe07 (Code) ===
loc_fdfb:
	lda $ea                  ; $fdfb: a5 ea
	asl                      ; $fdfd: 0a
	asl                      ; $fdfe: 0a
	clc                      ; $fdff: 18
	adc $ea                  ; $fe00: 65 ea
	clc                      ; $fe02: 18
	adc #$59                 ; $fe03: 69 59 AUDV0
	sta $ea                  ; $fe05: 85 ea
	rts                      ; $fe07: 60

; === Block $fe08-$fe3d (Code) ===
loc_fe08:
	lda $c7                  ; $fe08: a5 c7
	bne $fe68                ; $fe0a: d0 5c
loc_fe0c:
	inc $cd,x                ; $fe0c: f6 cd
	ldy $cb,x                ; $fe0e: b4 cb
	beq $fe68                ; $fe10: f0 56
loc_fe12:
	cpy #$05                 ; $fe12: c0 05 NUSIZ1
	beq $fe1a                ; $fe14: f0 04
loc_fe16:
	cpy #$02                 ; $fe16: c0 02 WSYNC
	bne $fe3e                ; $fe18: d0 24
loc_fe1a:
	ldy $cd,x                ; $fe1a: b4 cd
	cpy #$08                 ; $fe1c: c0 08 COLUPF
	bne $fe28                ; $fe1e: d0 08
loc_fe20:
	lda $cb,x                ; $fe20: b5 cb
	cmp #$05                 ; $fe22: c9 05 NUSIZ1
	beq $fe6c                ; $fe24: f0 46
loc_fe26:
	bne $fe68                ; $fe26: d0 40
loc_fe28:
	lda $ffea,y              ; $fe28: b9 ea ff
	sta $17,x                ; $fe2b: 95 17 AUDF0
	lda #$0c                 ; $fe2d: a9 0c REFP1
	sta $15,x                ; $fe2f: 95 15 AUDC0
	lda #$cb                 ; $fe31: a9 cb
	cmp #$05                 ; $fe33: c9 05 NUSIZ1
	lda #$04                 ; $fe35: a9 04 NUSIZ0
	bcc $fe3b                ; $fe37: 90 02
loc_fe39:
	lda #$08                 ; $fe39: a9 08 COLUPF
loc_fe3b:
	sta $19,x                ; $fe3b: 95 19 AUDV0
	rts                      ; $fe3d: 60

; === Block $fe3e-$fe67 (Code) ===
loc_fe3e:
	lda $fd44,y              ; $fe3e: b9 44 fd
	sta $ee                  ; $fe41: 85 ee
	lda #$ff                 ; $fe43: a9 ff
	sta $ef                  ; $fe45: 85 ef
	ldy $cf,x                ; $fe47: b4 cf
	lda ($ee),y              ; $fe49: b1 ee
	cmp $cd,x                ; $fe4b: d5 cd
	bne $fe67                ; $fe4d: d0 18
loc_fe4f:
	iny                      ; $fe4f: c8
	lda ($ee),y              ; $fe50: b1 ee
	bmi $fe68                ; $fe52: 30 14
loc_fe54:
	cmp #$3f                 ; $fe54: c9 3f
	beq $fe6c                ; $fe56: f0 14
loc_fe58:
	sta $17,x                ; $fe58: 95 17 AUDF0
	iny                      ; $fe5a: c8
	lda ($ee),y              ; $fe5b: b1 ee
	sta $15,x                ; $fe5d: 95 15 AUDC0
	iny                      ; $fe5f: c8
	lda ($ee),y              ; $fe60: b1 ee
	iny                      ; $fe62: c8
	sty $cf,x                ; $fe63: 94 cf
	sta $19,x                ; $fe65: 95 19 AUDV0
loc_fe67:
	rts                      ; $fe67: 60

; === Block $fe68-$fe74 (Code) ===
loc_fe68:
	lda #$00                 ; $fe68: a9 00 VSYNC
	sta $cb,x                ; $fe6a: 95 cb
loc_fe6c:
	lda #$00                 ; $fe6c: a9 00 VSYNC
	sta $19,x                ; $fe6e: 95 19 AUDV0
	sta $cd,x                ; $fe70: 95 cd
	sta $cf,x                ; $fe72: 95 cf
	rts                      ; $fe74: 60

; === Block $fe75-$fe7d (Code) ===
loc_fe75:
	lda $ca                  ; $fe75: a5 ca
	and #$01                 ; $fe77: 29 01 VBLANK
	ora #$80                 ; $fe79: 09 80
	sta $ca                  ; $fe7b: 85 ca
	rts                      ; $fe7d: 60

; === Block $fe7e-$fe8a (Code) ===
loc_fe7e:
	cmp $cb                  ; $fe7e: c5 cb
	bcc $fe8a                ; $fe80: 90 08
loc_fe82:
	sta $cb                  ; $fe82: 85 cb
	lda #$00                 ; $fe84: a9 00 VSYNC
	sta $cd                  ; $fe86: 85 cd
	sta $cf                  ; $fe88: 85 cf
loc_fe8a:
	rts                      ; $fe8a: 60

; === Block $fe8b-$fe97 (Code) ===
loc_fe8b:
	cmp $cc                  ; $fe8b: c5 cc
	bcc $fe97                ; $fe8d: 90 08
loc_fe8f:
	sta $cc                  ; $fe8f: 85 cc
	lda #$00                 ; $fe91: a9 00 VSYNC
	sta $ce                  ; $fe93: 85 ce
	sta $d0                  ; $fe95: 85 d0
loc_fe97:
	rts                      ; $fe97: 60

; === Block $fe98-$feaf (Code) ===
reset:
	cld                      ; $fe98: d8
	sei                      ; $fe99: 78
	ldx #$00                 ; $fe9a: a2 00 VSYNC
	txa                      ; $fe9c: 8a
	sta $00,x                ; $fe9d: 95 00 VSYNC
	inx                      ; $fe9f: e8
	bne $fe9d                ; $fea0: d0 fb
loc_fea2:
	dex                      ; $fea2: ca
	txs                      ; $fea3: 9a
	jsr $feb2                ; $fea4: 20 b2 fe
loc_fea7:
	lda #$c5                 ; $fea7: a9 c5
	sta $c7                  ; $fea9: 85 c7
	lda #$80                 ; $feab: a9 80
	sta $aa                  ; $fead: 85 aa
	jmp $f4d4                ; $feaf: 4c d4 f4

; === Block $feb2-$fef9 (Code) ===
loc_feb2:
	lda #$00                 ; $feb2: a9 00 VSYNC
	sta $e6                  ; $feb4: 85 e6
	sta $e8                  ; $feb6: 85 e8
	sta $e7                  ; $feb8: 85 e7
	sta $e9                  ; $feba: 85 e9
	sta $c7                  ; $febc: 85 c7
	lda #$01                 ; $febe: a9 01 VBLANK
	sta $aa                  ; $fec0: 85 aa
	lda #$00                 ; $fec2: a9 00 VSYNC
	sta $90                  ; $fec4: 85 90
	sta $99                  ; $fec6: 85 99
	sta $c6                  ; $fec8: 85 c6
	jsr $fe75                ; $feca: 20 75 fe
loc_fecd:
	lda #$03                 ; $fecd: a9 03 RSYNC
	sta $c9                  ; $fecf: 85 c9
	lda #$ff                 ; $fed1: a9 ff
	sta $8b                  ; $fed3: 85 8b
	lda $98                  ; $fed5: a5 98
	and #$53                 ; $fed7: 29 53 RESM1
	ldy $ec                  ; $fed9: a4 ec
	ora $fd52,y              ; $fedb: 19 52 fd
	ora $fd59,y              ; $fede: 19 59 fd
	sta $98                  ; $fee1: 85 98
	lda $e5                  ; $fee3: a5 e5
	and #$7f                 ; $fee5: 29 7f
	sta $e5                  ; $fee7: 85 e5
	jsr $fefa                ; $fee9: 20 fa fe
loc_feec:
	ldx #$0a                 ; $feec: a2 0a CTRLPF
	lda $90,x                ; $feee: b5 90
	sta $9f,x                ; $fef0: 95 9f
	dex                      ; $fef2: ca
	bpl $feee                ; $fef3: 10 f9
loc_fef5:
	lda #$6e                 ; $fef5: a9 6e
	sta $a7                  ; $fef7: 85 a7
	rts                      ; $fef9: 60

; === Block $fefa-$ff4b (Code) ===
loc_fefa:
	ldx #$05                 ; $fefa: a2 05 NUSIZ1
	lda #$3f                 ; $fefc: a9 3f
	sta $92,x                ; $fefe: 95 92
	dex                      ; $ff00: ca
	bpl $fefe                ; $ff01: 10 fb
loc_ff03:
	sta $eb                  ; $ff03: 85 eb
	sta $d7                  ; $ff05: 85 d7
	sta $d8                  ; $ff07: 85 d8
	sta $d3                  ; $ff09: 85 d3
	sta $d4                  ; $ff0b: 85 d4
	lda #$f6                 ; $ff0d: a9 f6
	sta $d5                  ; $ff0f: 85 d5
	sta $d6                  ; $ff11: 85 d6
	sta $d1                  ; $ff13: 85 d1
	sta $d2                  ; $ff15: 85 d2
	ldx #$05                 ; $ff17: a2 05 NUSIZ1
	lda $fd61,x              ; $ff19: bd 61 fd
	sta $99,x                ; $ff1c: 95 99
	dex                      ; $ff1e: ca
	bne $ff19                ; $ff1f: d0 f8
loc_ff21:
	txa                      ; $ff21: 8a
	sta $cb                  ; $ff22: 85 cb
	sta $cc                  ; $ff24: 85 cc
	lda #$24                 ; $ff26: a9 24 HMBL
	sta $91                  ; $ff28: 85 91
	lda #$42                 ; $ff2a: a9 42 WSYNC
	ora $98                  ; $ff2c: 05 98
	sta $98                  ; $ff2e: 85 98
	lda #$30                 ; $ff30: a9 30
	sta $c8                  ; $ff32: 85 c8
	lda $aa                  ; $ff34: a5 aa
	and #$f7                 ; $ff36: 29 f7
	sta $aa                  ; $ff38: 85 aa
	ldx #$1a                 ; $ff3a: a2 1a AUDV1
	ldy #$08                 ; $ff3c: a0 08 COLUPF
	lda $fd22,y              ; $ff3e: b9 22 fd
	sta $ab,x                ; $ff41: 95 ab
	dey                      ; $ff43: 88
	bpl $ff48                ; $ff44: 10 02
loc_ff46:
	ldy #$08                 ; $ff46: a0 08 COLUPF
loc_ff48:
	dex                      ; $ff48: ca
	bpl $ff3e                ; $ff49: 10 f3
loc_ff4b:
	rts                      ; $ff4b: 60

