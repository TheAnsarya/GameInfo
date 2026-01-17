; 🌺 Peony Disassembly
; ROM: Jr. Pac-Man (1984) (Atari) (PAL) [!].a26
; Platform: Atari 2600
; Size: 16384 bytes
; Mapper: F6

; === Block $f100-$f103 (Code) ===
loc_f100:
	nop                      ; $f100: ea
	nop                      ; $f101: ea
	nop                      ; $f102: ea

; === Block $f103-$f103 (Code) ===
reset:
	jmp $f367                ; $f103: 4c 67 f3

; === Block $f160-$f1aa (Code) ===
loc_f160:
	sta $2b                  ; $f160: 85 2b HMCLR
	lda #$ff                 ; $f162: a9 ff
	sta $c0                  ; $f164: 85 c0
	sta $c2                  ; $f166: 85 c2
	sta $c4                  ; $f168: 85 c4
	sta $c6                  ; $f16a: 85 c6
	sta $c8                  ; $f16c: 85 c8
	bit $f8                  ; $f16e: 24 f8
	bvc $f1b4                ; $f170: 50 42
loc_f172:
	sta $be                  ; $f172: 85 be
	ldx #$00                 ; $f174: a2 00 VSYNC
	txs                      ; $f176: 9a
	stx $1b                  ; $f177: 86 1b GRP0
	sty $02                  ; $f179: 84 02 WSYNC
	ldx #$01                 ; $f17b: a2 01 VBLANK
	lda #$03                 ; $f17d: a9 03 RSYNC
	sta $04                  ; $f17f: 85 04 NUSIZ0
	sta $05                  ; $f181: 85 05 NUSIZ1
	nop                      ; $f183: ea
	stx $25                  ; $f184: 86 25 VDELP0
	stx $26                  ; $f186: 86 26 VDELP1
	nop                      ; $f188: ea
	lda #$f0                 ; $f189: a9 f0
	sta $0120                ; $f18b: 8d 20 01 HMP0
	nop                      ; $f18e: ea
	nop                      ; $f18f: ea
	nop                      ; $f190: ea
	lda #$2c                 ; $f191: a9 2c CXCLR
	nop                      ; $f193: ea
	sta $10                  ; $f194: 85 10 RESP0
	sta $11                  ; $f196: 85 11 RESP1
	ldx $f0ff                ; $f198: ae ff f0
	bpl $f1a0                ; $f19b: 10 03
loc_f19d:
	lda $fc                  ; $f19d: a5 fc
	lsr                      ; $f19f: 4a
loc_f1a0:
	sta $06                  ; $f1a0: 85 06 COLUP0
	sta $07                  ; $f1a2: 85 07 COLUP1
	lda #$88                 ; $f1a4: a9 88
	sta $02                  ; $f1a6: 85 02 WSYNC
	sta $2a                  ; $f1a8: 85 2a HMOVE
	jmp $f2c8                ; $f1aa: 4c c8 f2

; === Block $f1b4-$f231 (Code) ===
loc_f1b4:
	lda $ff                  ; $f1b4: a5 ff
	and #$03                 ; $f1b6: 29 03 RSYNC
	tay                      ; $f1b8: a8
	lda $f1b0,y              ; $f1b9: b9 b0 f1
	sta $02                  ; $f1bc: 85 02 WSYNC
	sta $0104                ; $f1be: 8d 04 01 NUSIZ0
	lda $fd6e,y              ; $f1c1: b9 6e fd
	sta $06                  ; $f1c4: 85 06 COLUP0
	lda $ff                  ; $f1c6: a5 ff
	and #$30                 ; $f1c8: 29 30
	lsr                      ; $f1ca: 4a
	lsr                      ; $f1cb: 4a
	lsr                      ; $f1cc: 4a
	sta $10                  ; $f1cd: 85 10 RESP0
	lsr                      ; $f1cf: 4a
	tay                      ; $f1d0: a8
	lda $f1ad,y              ; $f1d1: b9 ad f1
	sta $05                  ; $f1d4: 85 05 NUSIZ1
	lda #$f1                 ; $f1d6: a9 f1
	sta $be                  ; $f1d8: 85 be
	ldx $f6                  ; $f1da: a6 f6
	cpy #$00                 ; $f1dc: c0 00 VSYNC
	beq $f1e5                ; $f1de: f0 05
loc_f1e0:
	ldx #$07                 ; $f1e0: a2 07 COLUP1
	nop                      ; $f1e2: ea
	bne $f1ef                ; $f1e3: d0 0a
loc_f1e5:
	bit $ff                  ; $f1e5: 24 ff
	bpl $f1ed                ; $f1e7: 10 04
loc_f1e9:
	ldx #$06                 ; $f1e9: a2 06 COLUP0
	bne $f1ef                ; $f1eb: d0 02
loc_f1ed:
	nop                      ; $f1ed: ea
	nop                      ; $f1ee: ea
loc_f1ef:
	ldy #$09                 ; $f1ef: a0 09 COLUBK
	sta $11                  ; $f1f1: 85 11 RESP1
	lda $f357,x              ; $f1f3: bd 57 f3
	sta $bd                  ; $f1f6: 85 bd
	lda $f35f,x              ; $f1f8: bd 5f f3
	sta $07                  ; $f1fb: 85 07 COLUP1
	bne $f201                ; $f1fd: d0 02
loc_f1ff:
	sta $02                  ; $f1ff: 85 02 WSYNC
loc_f201:
	lda $f106,y              ; $f201: b9 06 f1
	sta $1b                  ; $f204: 85 1b GRP0
	lda ($bd),y              ; $f206: b1 bd
	sta $1c                  ; $f208: 85 1c GRP1
	dey                      ; $f20a: 88
	cpy #$05                 ; $f20b: c0 05 NUSIZ1
	bne $f1ff                ; $f20d: d0 f0
loc_f20f:
	lda #$50                 ; $f20f: a9 50 RESP0
	sta $b2                  ; $f211: 85 b2
	ldx #$0a                 ; $f213: a2 0a CTRLPF
	sta $02                  ; $f215: 85 02 WSYNC
	lda $f106,y              ; $f217: b9 06 f1
	sta $1b                  ; $f21a: 85 1b GRP0
	lda ($bd),y              ; $f21c: b1 bd
	sta $1c                  ; $f21e: 85 1c GRP1
	sty $b3                  ; $f220: 84 b3
	tya                      ; $f222: 98
	lsr                      ; $f223: 4a
	tay                      ; $f224: a8
	lda $00f9,y              ; $f225: b9 f9 00
	and #$f0                 ; $f228: 29 f0
	lsr                      ; $f22a: 4a
	bne $f234                ; $f22b: d0 07
loc_f22d:
	ora $b2                  ; $f22d: 05 b2
	sta $bd,x                ; $f22f: 95 bd
	jmp $f23a                ; $f231: 4c 3a f2

; === Block $f234-$f25d (Code) ===
loc_f234:
	sta $bd,x                ; $f234: 95 bd
	lda #$00                 ; $f236: a9 00 VSYNC
	sta $b2                  ; $f238: 85 b2
loc_f23a:
	dex                      ; $f23a: ca
	dex                      ; $f23b: ca
	ldy $b3                  ; $f23c: a4 b3
	dey                      ; $f23e: 88
	sta $02                  ; $f23f: 85 02 WSYNC
	lda $f106,y              ; $f241: b9 06 f1
	sta $1b                  ; $f244: 85 1b GRP0
	lda ($bd),y              ; $f246: b1 bd
	sta $1c                  ; $f248: 85 1c GRP1
	sty $b3                  ; $f24a: 84 b3
	tya                      ; $f24c: 98
	lsr                      ; $f24d: 4a
	tay                      ; $f24e: a8
	lda $00f9,y              ; $f24f: b9 f9 00
	and #$0f                 ; $f252: 29 0f PF2
	asl                      ; $f254: 0a
	asl                      ; $f255: 0a
	asl                      ; $f256: 0a
	bne $f260                ; $f257: d0 07
loc_f259:
	ora $b2                  ; $f259: 05 b2
	sta $bd,x                ; $f25b: 95 bd
	jmp $f266                ; $f25d: 4c 66 f2

; === Block $f260-$f2b0 (Code) ===
loc_f260:
	sta $bd,x                ; $f260: 95 bd
	lda #$00                 ; $f262: a9 00 VSYNC
	sta $b2                  ; $f264: 85 b2
loc_f266:
	dex                      ; $f266: ca
	dex                      ; $f267: ca
	ldy $b3                  ; $f268: a4 b3
	dey                      ; $f26a: 88
	bpl $f215                ; $f26b: 10 a8
loc_f26d:
	ldx #$00                 ; $f26d: a2 00 VSYNC
	stx $bd                  ; $f26f: 86 bd
	stx $1b                  ; $f271: 86 1b GRP0
	sta $02                  ; $f273: 85 02 WSYNC
	stx $1c                  ; $f275: 86 1c GRP1
	stx $1b                  ; $f277: 86 1b GRP0
	stx $bd                  ; $f279: 86 bd
	lda #$f0                 ; $f27b: a9 f0
	sta $20                  ; $f27d: 85 20 HMP0
	stx $21                  ; $f27f: 86 21 HMP1
	inx                      ; $f281: e8
	lda #$03                 ; $f282: a9 03 RSYNC
	sta $04                  ; $f284: 85 04 NUSIZ0
	sta $05                  ; $f286: 85 05 NUSIZ1
	ldy #$07                 ; $f288: a0 07 COLUP1
	stx $25                  ; $f28a: 86 25 VDELP0
	stx $0126                ; $f28c: 8e 26 01 VDELP1
	sta $10                  ; $f28f: 85 10 RESP0
	sta $11                  ; $f291: 85 11 RESP1
	sty $b4                  ; $f293: 84 b4
	lda #$ff                 ; $f295: a9 ff
	sta $be                  ; $f297: 85 be
	ldy $b4                  ; $f299: a4 b4
	ldx #$80                 ; $f29b: a2 80
	txs                      ; $f29d: 9a
	lda #$2c                 ; $f29e: a9 2c CXCLR
	ldx $f0ff                ; $f2a0: ae ff f0
	sta $02                  ; $f2a3: 85 02 WSYNC
	sta $2a                  ; $f2a5: 85 2a HMOVE
	bpl $f2ac                ; $f2a7: 10 03
loc_f2a9:
	lda $fc                  ; $f2a9: a5 fc
	lsr                      ; $f2ab: 4a
loc_f2ac:
	sta $06                  ; $f2ac: 85 06 COLUP0
	sta $07                  ; $f2ae: 85 07 COLUP1
	jmp $f31b                ; $f2b0: 4c 1b f3

; === Block $f2b3-$f2c8 (Code) ===
loc_f2b3:
	lda #$50                 ; $f2b3: a9 50 RESP0
	sta $b2                  ; $f2b5: 85 b2
	lda #$00                 ; $f2b7: a9 00 VSYNC
	sta $bd                  ; $f2b9: 85 bd
	ldx #$80                 ; $f2bb: a2 80
	txs                      ; $f2bd: 9a
	bit $ff                  ; $f2be: 24 ff
	bvc $f2e1                ; $f2c0: 50 1f
loc_f2c2:
	sta $02                  ; $f2c2: 85 02 WSYNC
	sta $02                  ; $f2c4: 85 02 WSYNC
	lda #$58                 ; $f2c6: a9 58 AUDF1

; === Block $f2c8-$f2f1 (Code) ===
loc_f2c8:
	sta $c7                  ; $f2c8: 85 c7
	clc                      ; $f2ca: 18
	adc #$08                 ; $f2cb: 69 08 COLUPF
	sta $c5                  ; $f2cd: 85 c5
	adc #$08                 ; $f2cf: 69 08 COLUPF
	sta $c3                  ; $f2d1: 85 c3
	adc #$08                 ; $f2d3: 69 08 COLUPF
	sta $c1                  ; $f2d5: 85 c1
	adc #$08                 ; $f2d7: 69 08 COLUPF
	sta $bf                  ; $f2d9: 85 bf
	adc #$08                 ; $f2db: 69 08 COLUPF
	sta $bd                  ; $f2dd: 85 bd
	bne $f31b                ; $f2df: d0 3a
loc_f2e1:
	ldy #$02                 ; $f2e1: a0 02 WSYNC
	ldx #$0a                 ; $f2e3: a2 0a CTRLPF
	lda $00f9,y              ; $f2e5: b9 f9 00
	and #$f0                 ; $f2e8: 29 f0
	lsr                      ; $f2ea: 4a
	bne $f2f4                ; $f2eb: d0 07
loc_f2ed:
	ora $b2                  ; $f2ed: 05 b2
	sta $bd,x                ; $f2ef: 95 bd
	jmp $f2fa                ; $f2f1: 4c fa f2

; === Block $f2f4-$f30d (Code) ===
loc_f2f4:
	sta $bd,x                ; $f2f4: 95 bd
	lda #$00                 ; $f2f6: a9 00 VSYNC
	sta $b2                  ; $f2f8: 85 b2
loc_f2fa:
	dex                      ; $f2fa: ca
	dex                      ; $f2fb: ca
	tya                      ; $f2fc: 98
	beq $f31b                ; $f2fd: f0 1c
loc_f2ff:
	lda $00f9,y              ; $f2ff: b9 f9 00
	and #$0f                 ; $f302: 29 0f PF2
	asl                      ; $f304: 0a
	asl                      ; $f305: 0a
	asl                      ; $f306: 0a
	bne $f310                ; $f307: d0 07
loc_f309:
	ora $b2                  ; $f309: 05 b2
	sta $bd,x                ; $f30b: 95 bd
	jmp $f316                ; $f30d: 4c 16 f3

; === Block $f310-$f31b (Code) ===
loc_f310:
	sta $bd,x                ; $f310: 95 bd
	lda #$00                 ; $f312: a9 00 VSYNC
	sta $b2                  ; $f314: 85 b2
loc_f316:
	dex                      ; $f316: ca
	dex                      ; $f317: ca
	dey                      ; $f318: 88
	bpl $f2e5                ; $f319: 10 ca

; === Block $f31b-$f351 (Code) ===
loc_f31b:
	ldy #$07                 ; $f31b: a0 07 COLUP1
	sty $b4                  ; $f31d: 84 b4
	lda ($c7),y              ; $f31f: b1 c7
	sta $1b                  ; $f321: 85 1b GRP0
	sta $02                  ; $f323: 85 02 WSYNC
	lda ($c5),y              ; $f325: b1 c5
	sta $1c                  ; $f327: 85 1c GRP1
	lda ($c3),y              ; $f329: b1 c3
	sta $1b                  ; $f32b: 85 1b GRP0
	lda ($c1),y              ; $f32d: b1 c1
	sta $b3                  ; $f32f: 85 b3
	lda ($bf),y              ; $f331: b1 bf
	tax                      ; $f333: aa
	lda ($bd),y              ; $f334: b1 bd
	tay                      ; $f336: a8
	lda $b3                  ; $f337: a5 b3
	sta $1c                  ; $f339: 85 1c GRP1
	stx $1b                  ; $f33b: 86 1b GRP0
	sty $1c                  ; $f33d: 84 1c GRP1
	sta $1b                  ; $f33f: 85 1b GRP0
	dec $b4                  ; $f341: c6 b4
	ldy $b4                  ; $f343: a4 b4
	bpl $f31f                ; $f345: 10 d8
loc_f347:
	iny                      ; $f347: c8
	sty $1b                  ; $f348: 84 1b GRP0
	sty $1c                  ; $f34a: 84 1c GRP1
	sty $1b                  ; $f34c: 84 1b GRP0
	tsx                      ; $f34e: ba
	bmi $f354                ; $f34f: 30 03
loc_f351:
	jmp $f2b3                ; $f351: 4c b3 f2

; === Block $f354-$f354 (Code) ===
loc_f354:
	jmp $ffed                ; $f354: 4c ed ff

; === Block $f367-$f4ba (Code) ===
loc_f367:
	sei                      ; $f367: 78
	cld                      ; $f368: d8
	ldy #$c0                 ; $f369: a0 c0
	lda #$40                 ; $f36b: a9 40 VSYNC
	sta $ff                  ; $f36d: 85 ff
	lda #$00                 ; $f36f: a9 00 VSYNC
	sta $a8                  ; $f371: 85 a8
	lda #$00                 ; $f373: a9 00 VSYNC
	sta $00                  ; $f375: 85 00 VSYNC
	ldx #$fb                 ; $f377: a2 fb
	cpx #$a5                 ; $f379: e0 a5
	beq $f37f                ; $f37b: f0 02
loc_f37d:
	sta $03,x                ; $f37d: 95 03 RSYNC
loc_f37f:
	dex                      ; $f37f: ca
	bne $f379                ; $f380: d0 f7
loc_f382:
	ldx #$fe                 ; $f382: a2 fe
	sta $f000,x              ; $f384: 9d 00 f0
	dex                      ; $f387: ca
	bne $f384                ; $f388: d0 fa
loc_f38a:
	lda $a8                  ; $f38a: a5 a8
	and #$07                 ; $f38c: 29 07 COLUP1
	sta $f6                  ; $f38e: 85 f6
	sty $f8                  ; $f390: 84 f8
	ldx #$cf                 ; $f392: a2 cf
	txs                      ; $f394: 9a
	sta $02                  ; $f395: 85 02 WSYNC
	sta $14                  ; $f397: 85 14 RESBL
	lda #$40                 ; $f399: a9 40 VSYNC
	sta $24                  ; $f39b: 85 24 HMBL
	lda #$21                 ; $f39d: a9 21 HMP1
	sta $0a                  ; $f39f: 85 0a CTRLPF
	sta $02                  ; $f3a1: 85 02 WSYNC
	sta $2a                  ; $f3a3: 85 2a HMOVE
	sta $02                  ; $f3a5: 85 02 WSYNC
	sta $2b                  ; $f3a7: 85 2b HMCLR
	lda $0284                ; $f3a9: ad 84 02 INTIM
	sta $fc                  ; $f3ac: 85 fc
	ldx #$11                 ; $f3ae: a2 11 RESP1
	lda #$ff                 ; $f3b0: a9 ff
	sta $f012,x              ; $f3b2: 9d 12 f0
	sta $f024,x              ; $f3b5: 9d 24 f0
	sta $f06c,x              ; $f3b8: 9d 6c f0
	and #$f0                 ; $f3bb: 29 f0
	sta $f000,x              ; $f3bd: 9d 00 f0
	lda #$00                 ; $f3c0: a9 00 VSYNC
	sta $f036,x              ; $f3c2: 9d 36 f0
	sta $f05a,x              ; $f3c5: 9d 5a f0
	sta $f048,x              ; $f3c8: 9d 48 f0
	dex                      ; $f3cb: ca
	bpl $f3b0                ; $f3cc: 10 e2
loc_f3ce:
	ldx #$11                 ; $f3ce: a2 11 RESP1
	lda $f0a4,x              ; $f3d0: bd a4 f0
	and #$7f                 ; $f3d3: 29 7f
	sta $f024,x              ; $f3d5: 9d 24 f0
	lda $f092,x              ; $f3d8: bd 92 f0
	and #$7f                 ; $f3db: 29 7f
	sta $f012,x              ; $f3dd: 9d 12 f0
	dex                      ; $f3e0: ca
	bpl $f3d0                ; $f3e1: 10 ed
loc_f3e3:
	ldy $f6                  ; $f3e3: a4 f6
	lda $f5ee,y              ; $f3e5: b9 ee f5
	jsr $f573                ; $f3e8: 20 73 f5
loc_f3eb:
	lda $f5f5,y              ; $f3eb: b9 f5 f5
	jsr $f573                ; $f3ee: 20 73 f5
loc_f3f1:
	lda $f0ac                ; $f3f1: ad ac f0
	and #$df                 ; $f3f4: 29 df
	sta $f02c                ; $f3f6: 8d 2c f0
	lda $f09a                ; $f3f9: ad 9a f0
	and #$df                 ; $f3fc: 29 df
	sta $f01a                ; $f3fe: 8d 1a f0
	lda $f0ab                ; $f401: ad ab f0
	and #$d7                 ; $f404: 29 d7
	sta $f02b                ; $f406: 8d 2b f0
	lda $f099                ; $f409: ad 99 f0
	and #$d7                 ; $f40c: 29 d7
	sta $f019                ; $f40e: 8d 19 f0
	lda #$00                 ; $f411: a9 00 VSYNC
	sta $f5                  ; $f413: 85 f5
	sta $f4                  ; $f415: 85 f4
	lda $ff                  ; $f417: a5 ff
	and #$f7                 ; $f419: 29 f7
	sta $ff                  ; $f41b: 85 ff
	ldx #$73                 ; $f41d: a2 73
	lda #$00                 ; $f41f: a9 00 VSYNC
	cpx #$28                 ; $f421: e0 28 RESMP0
	beq $f427                ; $f423: f0 02
loc_f425:
	sta $80,x                ; $f425: 95 80
loc_f427:
	dex                      ; $f427: ca
	bpl $f421                ; $f428: 10 f7
loc_f42a:
	sec                      ; $f42a: 38
	ror $b6                  ; $f42b: 66 b6
	jsr $f59e                ; $f42d: 20 9e f5
loc_f430:
	ldx #$11                 ; $f430: a2 11 RESP1
	lda $f0b6,x              ; $f432: bd b6 f0
	and #$f8                 ; $f435: 29 f8
	pha                      ; $f437: 48
	eor $f080,x              ; $f438: 5d 80 f0
	sta $f000,x              ; $f43b: 9d 00 f0
	lda $f0b6,x              ; $f43e: bd b6 f0
	and #$07                 ; $f441: 29 07 COLUP1
	sta $f036,x              ; $f443: 9d 36 f0
	pla                      ; $f446: 68
	jsr $f587                ; $f447: 20 87 f5
loc_f44a:
	lda $f0da,x              ; $f44a: bd da f0
	pha                      ; $f44d: 48
	eor $f0a4,x              ; $f44e: 5d a4 f0
	sta $f024,x              ; $f451: 9d 24 f0
	lda #$00                 ; $f454: a9 00 VSYNC
	sta $f05a,x              ; $f456: 9d 5a f0
	pla                      ; $f459: 68
	jsr $f587                ; $f45a: 20 87 f5
loc_f45d:
	lda $f0c8,x              ; $f45d: bd c8 f0
	pha                      ; $f460: 48
	eor $f092,x              ; $f461: 5d 92 f0
	sta $f012,x              ; $f464: 9d 12 f0
	lda #$00                 ; $f467: a9 00 VSYNC
	sta $f048,x              ; $f469: 9d 48 f0
	pla                      ; $f46c: 68
	jsr $f587                ; $f46d: 20 87 f5
loc_f470:
	lda $f080,x              ; $f470: bd 80 f0
	and #$07                 ; $f473: 29 07 COLUP1
	pha                      ; $f475: 48
	tay                      ; $f476: a8
	lda $f0ec,x              ; $f477: bd ec f0
	eor $f563,y              ; $f47a: 59 63 f5
	sta $f06c,x              ; $f47d: 9d 6c f0
	lda $f080,x              ; $f480: bd 80 f0
	and #$f8                 ; $f483: 29 f8
	sta $f000,x              ; $f485: 9d 00 f0
	pla                      ; $f488: 68
	jsr $f587                ; $f489: 20 87 f5
loc_f48c:
	lda $f0b6,x              ; $f48c: bd b6 f0
	and #$07                 ; $f48f: 29 07 COLUP1
	pha                      ; $f491: 48
	tay                      ; $f492: a8
	lda $f0ec,x              ; $f493: bd ec f0
	eor $f56b,y              ; $f496: 59 6b f5
	sta $f06c,x              ; $f499: 9d 6c f0
	lda $f0b6,x              ; $f49c: bd b6 f0
	and #$f8                 ; $f49f: 29 f8
	sta $f036,x              ; $f4a1: 9d 36 f0
	pla                      ; $f4a4: 68
	jsr $f587                ; $f4a5: 20 87 f5
loc_f4a8:
	dex                      ; $f4a8: ca
	bpl $f432                ; $f4a9: 10 87
loc_f4ab:
	ldy $f6                  ; $f4ab: a4 f6
	lda $f580,y              ; $f4ad: b9 80 f5
	cmp $f4                  ; $f4b0: c5 f4
	bne $f4bd                ; $f4b2: d0 09
loc_f4b4:
	lda $ff                  ; $f4b4: a5 ff
	and #$08                 ; $f4b6: 29 08 COLUPF
	beq $f4bd                ; $f4b8: f0 03
loc_f4ba:
	jmp $f741                ; $f4ba: 4c 41 f7

; === Block $f4bd-$f557 (Code) ===
loc_f4bd:
	lda #$00                 ; $f4bd: a9 00 VSYNC
	sta $b6                  ; $f4bf: 85 b6
	jsr $f59e                ; $f4c1: 20 9e f5
loc_f4c4:
	ldx #$03                 ; $f4c4: a2 03 RSYNC
	cpx #$00                 ; $f4c6: e0 00 VSYNC
	beq $f4ce                ; $f4c8: f0 04
loc_f4ca:
	lda #$40                 ; $f4ca: a9 40 VSYNC
	sta $dd,x                ; $f4cc: 95 dd
loc_f4ce:
	lda #$13                 ; $f4ce: a9 13 RESM1
	sta $d7,x                ; $f4d0: 95 d7
	lda #$a0                 ; $f4d2: a9 a0
	sta $ea,x                ; $f4d4: 95 ea
	lsr                      ; $f4d6: 4a
	sta $e4,x                ; $f4d7: 95 e4
	dex                      ; $f4d9: ca
	bpl $f4c6                ; $f4da: 10 ea
loc_f4dc:
	sta $d0                  ; $f4dc: 85 d0
	lda #$8c                 ; $f4de: a9 8c
	sta $ea                  ; $f4e0: 85 ea
	lda #$4a                 ; $f4e2: a9 4a CTRLPF
	sta $e8                  ; $f4e4: 85 e8
	lda #$b4                 ; $f4e6: a9 b4
	ldy $f6                  ; $f4e8: a4 f6
	cpy #$03                 ; $f4ea: c0 03 RSYNC
	bne $f4f0                ; $f4ec: d0 02
loc_f4ee:
	lda #$c8                 ; $f4ee: a9 c8
loc_f4f0:
	sta $ee                  ; $f4f0: 85 ee
	lda #$0b                 ; $f4f2: a9 0b REFP0
	sta $db                  ; $f4f4: 85 db
	lda #$30                 ; $f4f6: a9 30
	sta $d1                  ; $f4f8: 85 d1
	lda #$16                 ; $f4fa: a9 16 AUDC1
	sta $d3                  ; $f4fc: 85 d3
	dec $f1                  ; $f4fe: c6 f1
	dec $f2                  ; $f500: c6 f2
	lda $a8                  ; $f502: a5 a8
	and #$07                 ; $f504: 29 07 COLUP1
	sta $a8                  ; $f506: 85 a8
	lda $ff                  ; $f508: a5 ff
	bpl $f510                ; $f50a: 10 04
loc_f50c:
	iny                      ; $f50c: c8
	iny                      ; $f50d: c8
	bne $f516                ; $f50e: d0 06
loc_f510:
	ldx #$00                 ; $f510: a2 00 VSYNC
	cpy $a8                  ; $f512: c4 a8
	beq $f51b                ; $f514: f0 05
loc_f516:
	ldx $f55a,y              ; $f516: be 5a f5
	bmi $f52f                ; $f519: 30 14
loc_f51b:
	lda $ff                  ; $f51b: a5 ff
	and #$08                 ; $f51d: 29 08 COLUPF
	ora $f4                  ; $f51f: 05 f4
	bne $f52f                ; $f521: d0 0c
loc_f523:
	bit $f8                  ; $f523: 24 f8
	bmi $f52f                ; $f525: 30 08
loc_f527:
	sta $f0                  ; $f527: 85 f0
	stx $ef                  ; $f529: 86 ef
	lda #$01                 ; $f52b: a9 01 VBLANK
	bpl $f531                ; $f52d: 10 02
loc_f52f:
	lda #$02                 ; $f52f: a9 02 WSYNC
loc_f531:
	ldx #$20                 ; $f531: a2 20 HMP0
	sta $f3                  ; $f533: 85 f3
	stx $d5                  ; $f535: 86 d5
	ldy #$10                 ; $f537: a0 10 RESP0
	lda #$02                 ; $f539: a9 02 WSYNC
	sta $02                  ; $f53b: 85 02 WSYNC
	sta $00                  ; $f53d: 85 00 VSYNC
	sta $01                  ; $f53f: 85 01 VBLANK
	sta $02                  ; $f541: 85 02 WSYNC
	sta $02                  ; $f543: 85 02 WSYNC
	lda #$00                 ; $f545: a9 00 VSYNC
	sta $02                  ; $f547: 85 02 WSYNC
	sta $00                  ; $f549: 85 00 VSYNC
	ldx #$9a                 ; $f54b: a2 9a
	sta $02                  ; $f54d: 85 02 WSYNC
	sta $02                  ; $f54f: 85 02 WSYNC
	dex                      ; $f551: ca
	bne $f54d                ; $f552: d0 f9
loc_f554:
	dey                      ; $f554: 88
	bne $f539                ; $f555: d0 e2
loc_f557:
	jmp $f5fc                ; $f557: 4c fc f5

; === Block $f573-$f57f (Code) ===
loc_f573:
	sec                      ; $f573: 38
	sbc #$12                 ; $f574: e9 12 RESM0
	tax                      ; $f576: aa
	lda $f092,x              ; $f577: bd 92 f0
	ora #$80                 ; $f57a: 09 80
	sta $f012,x              ; $f57c: 9d 12 f0
	rts                      ; $f57f: 60

; === Block $f587-$f59d (Code) ===
loc_f587:
	ldy #$08                 ; $f587: a0 08 COLUPF
	lsr                      ; $f589: 4a
	bcc $f59a                ; $f58a: 90 0e
loc_f58c:
	inc $f4                  ; $f58c: e6 f4
	bne $f59a                ; $f58e: d0 0a
loc_f590:
	sta $b2                  ; $f590: 85 b2
	lda $ff                  ; $f592: a5 ff
	ora #$08                 ; $f594: 09 08 COLUPF
	sta $ff                  ; $f596: 85 ff
	lda $b2                  ; $f598: a5 b2
loc_f59a:
	dey                      ; $f59a: 88
	bne $f589                ; $f59b: d0 ec
loc_f59d:
	rts                      ; $f59d: 60

; === Block $f59e-$f5de (Code) ===
loc_f59e:
	lda #$f0                 ; $f59e: a9 f0
	sta $b3                  ; $f5a0: 85 b3
	ldy #$03                 ; $f5a2: a0 03 RSYNC
	lda $f5ea,y              ; $f5a4: b9 ea f5
	sta $b2                  ; $f5a7: 85 b2
	ldx $f5e6,y              ; $f5a9: be e6 f5
	sty $b5                  ; $f5ac: 84 b5
	jsr $f5c5                ; $f5ae: 20 c5 f5
loc_f5b1:
	dey                      ; $f5b1: 88
	bpl $f5a4                ; $f5b2: 10 f0
loc_f5b4:
	ldx #$09                 ; $f5b4: a2 09 COLUBK
	ldy $f6                  ; $f5b6: a4 f6
	lda $f5ee,y              ; $f5b8: b9 ee f5
	sta $b2                  ; $f5bb: 85 b2
	jsr $f5c5                ; $f5bd: 20 c5 f5
loc_f5c0:
	lda $f5f5,y              ; $f5c0: b9 f5 f5
	sta $b2                  ; $f5c3: 85 b2
loc_f5c5:
	sty $b5                  ; $f5c5: 84 b5
	ldy #$80                 ; $f5c7: a0 80
	lda $ffc0,x              ; $f5c9: bd c0 ff
	and ($b2),y              ; $f5cc: 31 b2
	beq $f5dc                ; $f5ce: f0 0c
loc_f5d0:
	ldy #$b6                 ; $f5d0: a0 b6
	bit $b6                  ; $f5d2: 24 b6
	bmi $f5df                ; $f5d4: 30 09
loc_f5d6:
	ora ($b2),y              ; $f5d6: 11 b2
	ldy #$36                 ; $f5d8: a0 36
	sta ($b2),y              ; $f5da: 91 b2
loc_f5dc:
	ldy $b5                  ; $f5dc: a4 b5
	rts                      ; $f5de: 60

; === Block $f5df-$f5e3 (Code) ===
loc_f5df:
	eor #$ff                 ; $f5df: 49 ff
	and ($b2),y              ; $f5e1: 31 b2
	jmp $f5d8                ; $f5e3: 4c d8 f5

; === Block $f5fc-$f626 (Code) ===
loc_f5fc:
	lda #$02                 ; $f5fc: a9 02 WSYNC
	sta $02                  ; $f5fe: 85 02 WSYNC
	sta $00                  ; $f600: 85 00 VSYNC
	sta $01                  ; $f602: 85 01 VBLANK
	inc $fc                  ; $f604: e6 fc
	lda $fc                  ; $f606: a5 fc
	adc $fd                  ; $f608: 65 fd
	adc $fe                  ; $f60a: 65 fe
	ldy $fd                  ; $f60c: a4 fd
	sty $fe                  ; $f60e: 84 fe
	sta $fd                  ; $f610: 85 fd
	lda #$56                 ; $f612: a9 56 AUDC1
	sta $0296                ; $f614: 8d 96 02 TIM64T
	lda $0282                ; $f617: ad 82 02 SWCHB
	lsr                      ; $f61a: 4a
	bcc $f655                ; $f61b: 90 38
loc_f61d:
	lsr                      ; $f61d: 4a
	bcc $f629                ; $f61e: 90 09
loc_f620:
	lda $f8                  ; $f620: a5 f8
	and #$e0                 ; $f622: 29 e0
	sta $f8                  ; $f624: 85 f8
	jmp $f662                ; $f626: 4c 62 f6

; === Block $f629-$f631 (Code) ===
loc_f629:
	lda $f8                  ; $f629: a5 f8
	and #$1f                 ; $f62b: 29 1f ENABL
	beq $f634                ; $f62d: f0 05
loc_f62f:
	dec $f8                  ; $f62f: c6 f8
	jmp $f662                ; $f631: 4c 62 f6

; === Block $f634-$f655 (Code) ===
loc_f634:
	lda $ff                  ; $f634: a5 ff
	and #$3c                 ; $f636: 29 3c
	sec                      ; $f638: 38
	sbc #$10                 ; $f639: e9 10 RESP0
	and #$3c                 ; $f63b: 29 3c
	sta $ff                  ; $f63d: 85 ff
	and #$30                 ; $f63f: 29 30
	bne $f651                ; $f641: d0 0e
loc_f643:
	inc $a8                  ; $f643: e6 a8
	lda $a8                  ; $f645: a5 a8
	and #$07                 ; $f647: 29 07 COLUP1
	cmp #$07                 ; $f649: c9 07 COLUP1
	bne $f64f                ; $f64b: d0 02
loc_f64d:
	lda #$00                 ; $f64d: a9 00 VSYNC
loc_f64f:
	sta $a8                  ; $f64f: 85 a8
loc_f651:
	ldy #$9f                 ; $f651: a0 9f
	bne $f65f                ; $f653: d0 0a

; === Block $f655-$f65f (Code) ===
loc_f655:
	lda $ff                  ; $f655: a5 ff
	and #$30                 ; $f657: 29 30
	ora #$02                 ; $f659: 09 02 WSYNC
	sta $ff                  ; $f65b: 85 ff
	ldy #$00                 ; $f65d: a0 00 VSYNC
	jmp $f373                ; $f65f: 4c 73 f3

; === Block $f662-$f680 (Code) ===
loc_f662:
	bit $f8                  ; $f662: 24 f8
	bmi $f668                ; $f664: 30 02
loc_f666:
	bvc $f66c                ; $f666: 50 04
loc_f668:
	bit $3c                  ; $f668: 24 3c
	bpl $f655                ; $f66a: 10 e9
loc_f66c:
	sta $02                  ; $f66c: 85 02 WSYNC
	lda $e3                  ; $f66e: a5 e3
	cmp #$e0                 ; $f670: c9 e0
	bcs $f685                ; $f672: b0 11
loc_f674:
	and #$08                 ; $f674: 29 08 COLUPF
	beq $f685                ; $f676: f0 0d
loc_f678:
	lda $dc                  ; $f678: a5 dc
	and #$01                 ; $f67a: 29 01 VBLANK
	bne $f683                ; $f67c: d0 05
loc_f67e:
	inc $e9                  ; $f67e: e6 e9
	jmp $f685                ; $f680: 4c 85 f6

; === Block $f683-$f685 (Code) ===
loc_f683:
	inc $ef                  ; $f683: e6 ef

; === Block $f685-$f69c (Code) ===
loc_f685:
	lda $f3                  ; $f685: a5 f3
	cmp #$03                 ; $f687: c9 03 RSYNC
	bne $f69f                ; $f689: d0 14
loc_f68b:
	lda $d5                  ; $f68b: a5 d5
	lsr                      ; $f68d: 4a
	lsr                      ; $f68e: 4a
	lsr                      ; $f68f: 4a
	and #$0f                 ; $f690: 29 0f PF2
	tay                      ; $f692: a8
	lda $e1                  ; $f693: a5 e1
	and #$c0                 ; $f695: 29 c0
	ora $ffb8,y              ; $f697: 19 b8 ff
	sta $e1                  ; $f69a: 85 e1
	jmp $f6b5                ; $f69c: 4c b5 f6

; === Block $f69f-$f6e1 (Code) ===
loc_f69f:
	lda $db                  ; $f69f: a5 db
	and #$03                 ; $f6a1: 29 03 RSYNC
	tax                      ; $f6a3: aa
	lda $fc                  ; $f6a4: a5 fc
	and #$06                 ; $f6a6: 29 06 COLUP0
	lsr                      ; $f6a8: 4a
	tay                      ; $f6a9: a8
	lda $e1                  ; $f6aa: a5 e1
	and #$c0                 ; $f6ac: 29 c0
	clc                      ; $f6ae: 18
	adc $f8de,x              ; $f6af: 7d de f8
	adc $f8da,y              ; $f6b2: 79 da f8
loc_f6b5:
	sta $e1                  ; $f6b5: 85 e1
	ldy $d6                  ; $f6b7: a4 d6
	sta $02                  ; $f6b9: 85 02 WSYNC
	bmi $f6e4                ; $f6bb: 30 27
loc_f6bd:
	beq $f70c                ; $f6bd: f0 4d
loc_f6bf:
	lda $ee                  ; $f6bf: a5 ee
	sec                      ; $f6c1: 38
	sbc $d0                  ; $f6c2: e5 d0
	tax                      ; $f6c4: aa
	lda $db                  ; $f6c5: a5 db
	php                      ; $f6c7: 08
	rol                      ; $f6c8: 2a
	rol                      ; $f6c9: 2a
	and #$01                 ; $f6ca: 29 01 VBLANK
	plp                      ; $f6cc: 28
	sbc #$00                 ; $f6cd: e9 00 VSYNC
	bne $f70c                ; $f6cf: d0 3b
loc_f6d1:
	txa                      ; $f6d1: 8a
	cmp #$3c                 ; $f6d2: c9 3c
	bcs $f70c                ; $f6d4: b0 36
loc_f6d6:
	ldx $d0                  ; $f6d6: a6 d0
	beq $f70c                ; $f6d8: f0 32
loc_f6da:
	dex                      ; $f6da: ca
	beq $f70a                ; $f6db: f0 2d
loc_f6dd:
	dey                      ; $f6dd: 88
	beq $f70a                ; $f6de: f0 2a
loc_f6e0:
	dex                      ; $f6e0: ca
	jmp $f70a                ; $f6e1: 4c 0a f7

; === Block $f6e4-$f726 (Code) ===
loc_f6e4:
	lda $ee                  ; $f6e4: a5 ee
	sec                      ; $f6e6: 38
	sbc $d0                  ; $f6e7: e5 d0
	tax                      ; $f6e9: aa
	lda $db                  ; $f6ea: a5 db
	php                      ; $f6ec: 08
	rol                      ; $f6ed: 2a
	rol                      ; $f6ee: 2a
	and #$01                 ; $f6ef: 29 01 VBLANK
	plp                      ; $f6f1: 28
	sbc #$00                 ; $f6f2: e9 00 VSYNC
	bne $f6fb                ; $f6f4: d0 05
loc_f6f6:
	txa                      ; $f6f6: 8a
	cmp #$4c                 ; $f6f7: c9 4c REFP1
	bcc $f70c                ; $f6f9: 90 11
loc_f6fb:
	ldx $d0                  ; $f6fb: a6 d0
	cpx #$dc                 ; $f6fd: e0 dc
	beq $f70c                ; $f6ff: f0 0b
loc_f701:
	inx                      ; $f701: e8
	dey                      ; $f702: 88
	beq $f70a                ; $f703: f0 05
loc_f705:
	cpx #$dc                 ; $f705: e0 dc
	beq $f70a                ; $f707: f0 01
loc_f709:
	inx                      ; $f709: e8
loc_f70a:
	stx $d0                  ; $f70a: 86 d0
loc_f70c:
	sta $02                  ; $f70c: 85 02 WSYNC
	lda #$00                 ; $f70e: a9 00 VSYNC
	sta $00                  ; $f710: 85 00 VSYNC
	sta $d6                  ; $f712: 85 d6
	ldx $f3                  ; $f714: a6 f3
	beq $f789                ; $f716: f0 71
loc_f718:
	lda $d5                  ; $f718: a5 d5
	bne $f789                ; $f71a: d0 6d
loc_f71c:
	lda $f778,x              ; $f71c: bd 78 f7
	sta $b4                  ; $f71f: 85 b4
	lda $f77e,x              ; $f721: bd 7e f7
	sta $b5                  ; $f724: 85 b5
	jmp ($00b4)              ; $f726: 6c b4 00

; === Block $f741-$f764 (Code) ===
loc_f741:
	inc $f6                  ; $f741: e6 f6
	lda $f6                  ; $f743: a5 f6
	cmp #$07                 ; $f745: c9 07 COLUP1
	bne $f752                ; $f747: d0 09
loc_f749:
	lda #$03                 ; $f749: a9 03 RSYNC
	sta $f6                  ; $f74b: 85 f6
	asl $ff                  ; $f74d: 06 ff
	sec                      ; $f74f: 38
	ror $ff                  ; $f750: 66 ff
loc_f752:
	lda #$00                 ; $f752: a9 00 VSYNC
	sta $e3                  ; $f754: 85 e3
	beq $f776                ; $f756: f0 1e
loc_f758:
	bit $f8                  ; $f758: 24 f8
	bmi $f767                ; $f75a: 30 0b
loc_f75c:
	lda $ff                  ; $f75c: a5 ff
	and #$03                 ; $f75e: 29 03 RSYNC
	beq $f767                ; $f760: f0 05
loc_f762:
	dec $ff                  ; $f762: c6 ff
	jmp $f41d                ; $f764: 4c 1d f4

; === Block $f767-$f776 (Code) ===
loc_f767:
	ldy #$c0                 ; $f767: a0 c0
	sty $f8                  ; $f769: 84 f8
	ldx $f6                  ; $f76b: a6 f6
	inx                      ; $f76d: e8
	cpx #$07                 ; $f76e: e0 07 COLUP1
	bcc $f774                ; $f770: 90 02
loc_f772:
	ldx #$00                 ; $f772: a2 00 VSYNC
loc_f774:
	stx $f6                  ; $f774: 86 f6

; === Block $f776-$f776 (Code) ===
loc_f776:
	jmp $f3ae                ; $f776: 4c ae f3

; === Block $f789-$f7b1 (Code) ===
loc_f789:
	jsr $fa33                ; $f789: 20 33 fa
loc_f78c:
	lda $f0fe                ; $f78c: ad fe f0
	sta $b4                  ; $f78f: 85 b4
	lda #$00                 ; $f791: a9 00 VSYNC
	sta $f07e                ; $f793: 8d 7e f0
	sta $b6                  ; $f796: 85 b6
	lda $f3                  ; $f798: a5 f3
	cmp #$03                 ; $f79a: c9 03 RSYNC
	beq $f7a8                ; $f79c: f0 0a
loc_f79e:
	cmp #$06                 ; $f79e: c9 06 COLUP0
	bne $f7b4                ; $f7a0: d0 12
loc_f7a2:
	lda $d5                  ; $f7a2: a5 d5
	cmp #$70                 ; $f7a4: c9 70
	bcs $f7b4                ; $f7a6: b0 0c
loc_f7a8:
	ldx #$ff                 ; $f7a8: a2 ff
	stx $c1                  ; $f7aa: 86 c1
	stx $c2                  ; $f7ac: 86 c2
	inx                      ; $f7ae: e8
	stx $e3                  ; $f7af: 86 e3
	jmp $f862                ; $f7b1: 4c 62 f8

; === Block $f7b4-$f8d7 (Code) ===
loc_f7b4:
	lda $ff                  ; $f7b4: a5 ff
	and #$30                 ; $f7b6: 29 30
	lsr                      ; $f7b8: 4a
	lsr                      ; $f7b9: 4a
	lsr                      ; $f7ba: 4a
	lsr                      ; $f7bb: 4a
	sta $c1                  ; $f7bc: 85 c1
	ldx #$03                 ; $f7be: a2 03 RSYNC
	cpx $c1                  ; $f7c0: e4 c1
	bcc $f7d2                ; $f7c2: 90 0e
loc_f7c4:
	lda $d7,x                ; $f7c4: b5 d7
	rol                      ; $f7c6: 2a
	lda $ea,x                ; $f7c7: b5 ea
	ror                      ; $f7c9: 6a
	lsr                      ; $f7ca: 4a
	sta $bd,x                ; $f7cb: 95 bd
	jsr $f8e6                ; $f7cd: 20 e6 f8
loc_f7d0:
	bcc $f7f2                ; $f7d0: 90 20
loc_f7d2:
	lda #$ff                 ; $f7d2: a9 ff
	sta $bd,x                ; $f7d4: 95 bd
	lda $f8e2,x              ; $f7d6: bd e2 f8
	ora $f0fe                ; $f7d9: 0d fe f0
	sta $f07e                ; $f7dc: 8d 7e f0
	lda $f8e2,x              ; $f7df: bd e2 f8
	bit $b4                  ; $f7e2: 24 b4
	bne $f7f2                ; $f7e4: d0 0c
loc_f7e6:
	lda $dd,x                ; $f7e6: b5 dd
	and #$c0                 ; $f7e8: 29 c0
	bne $f7f2                ; $f7ea: d0 06
loc_f7ec:
	lda $d7,x                ; $f7ec: b5 d7
	ora #$20                 ; $f7ee: 09 20 HMP0
	sta $d7,x                ; $f7f0: 95 d7
loc_f7f2:
	dex                      ; $f7f2: ca
	bpl $f7c0                ; $f7f3: 10 cb
loc_f7f5:
	lda $fc                  ; $f7f5: a5 fc
	and #$03                 ; $f7f7: 29 03 RSYNC
	asl                      ; $f7f9: 0a
	asl                      ; $f7fa: 0a
	sta $b3                  ; $f7fb: 85 b3
	lda $fd                  ; $f7fd: a5 fd
	and #$03                 ; $f7ff: 29 03 RSYNC
	ora $b3                  ; $f801: 05 b3
	asl                      ; $f803: 0a
	asl                      ; $f804: 0a
	tay                      ; $f805: a8
	lda $f911,y              ; $f806: b9 11 f9
	and #$03                 ; $f809: 29 03 RSYNC
	tax                      ; $f80b: aa
	lda $bd,x                ; $f80c: b5 bd
	sta $c1                  ; $f80e: 85 c1
	stx $c6                  ; $f810: 86 c6
	lda #$ff                 ; $f812: a9 ff
	sta $c2                  ; $f814: 85 c2
	iny                      ; $f816: c8
	ldx $f911,y              ; $f817: be 11 f9
	sty $b2                  ; $f81a: 84 b2
	ldy #$00                 ; $f81c: a0 00 VSYNC
	lda $bd,x                ; $f81e: b5 bd
	bmi $f859                ; $f820: 30 37
loc_f822:
	lda $00c1,y              ; $f822: b9 c1 00
	bmi $f837                ; $f825: 30 10
loc_f827:
	sec                      ; $f827: 38
	sbc $bd,x                ; $f828: f5 bd
	bcs $f830                ; $f82a: b0 04
loc_f82c:
	eor #$ff                 ; $f82c: 49 ff
	adc #$01                 ; $f82e: 69 01 VBLANK
loc_f830:
	cmp #$09                 ; $f830: c9 09 COLUBK
	bcc $f859                ; $f832: 90 25
loc_f834:
	iny                      ; $f834: c8
	bne $f81e                ; $f835: d0 e7
loc_f837:
	sta $00c2,y              ; $f837: 99 c2 00
	tya                      ; $f83a: 98
	sty $b6                  ; $f83b: 84 b6
	beq $f852                ; $f83d: f0 13
loc_f83f:
	lda $00c0,y              ; $f83f: b9 c0 00
	cmp $bd,x                ; $f842: d5 bd
	bcs $f852                ; $f844: b0 0c
loc_f846:
	sta $00c1,y              ; $f846: 99 c1 00
	lda $00c5,y              ; $f849: b9 c5 00
	sta $00c6,y              ; $f84c: 99 c6 00
	dey                      ; $f84f: 88
	bne $f83f                ; $f850: d0 ed
loc_f852:
	lda $bd,x                ; $f852: b5 bd
	sta $00c1,y              ; $f854: 99 c1 00
	stx $c6,y                ; $f857: 96 c6
loc_f859:
	inc $b2                  ; $f859: e6 b2
	ldy $b2                  ; $f85b: a4 b2
	ldx $f911,y              ; $f85d: be 11 f9
	bpl $f81c                ; $f860: 10 ba
loc_f862:
	ldx #$ff                 ; $f862: a2 ff
	stx $bf                  ; $f864: 86 bf
	inx                      ; $f866: e8
	lda $db,x                ; $f867: b5 db
	rol                      ; $f869: 2a
	lda $ee,x                ; $f86a: b5 ee
	ror                      ; $f86c: 6a
	lsr                      ; $f86d: 4a
	sta $bd,x                ; $f86e: 95 bd
	inx                      ; $f870: e8
	cpx #$01                 ; $f871: e0 01 VBLANK
	beq $f867                ; $f873: f0 f2
loc_f875:
	lda $e1                  ; $f875: a5 e1
	and #$bf                 ; $f877: 29 bf
	sta $e1                  ; $f879: 85 e1
	ldx #$05                 ; $f87b: a2 05 NUSIZ1
	jsr $f8e6                ; $f87d: 20 e6 f8
loc_f880:
	bcc $f88c                ; $f880: 90 0a
loc_f882:
	lda #$ff                 ; $f882: a9 ff
	sta $be                  ; $f884: 85 be
	lda $e1                  ; $f886: a5 e1
	ora #$40                 ; $f888: 09 40 VSYNC
	sta $e1                  ; $f88a: 85 e1
loc_f88c:
	bit $e3                  ; $f88c: 24 e3
	bmi $f894                ; $f88e: 30 04
loc_f890:
	lda #$ff                 ; $f890: a9 ff
	sta $be                  ; $f892: 85 be
loc_f894:
	lda $bd                  ; $f894: a5 bd
	sec                      ; $f896: 38
	sbc $be                  ; $f897: e5 be
	bcs $f89f                ; $f899: b0 04
loc_f89b:
	eor #$ff                 ; $f89b: 49 ff
	adc #$01                 ; $f89d: 69 01 VBLANK
loc_f89f:
	cmp #$09                 ; $f89f: c9 09 COLUBK
	bcs $f8ac                ; $f8a1: b0 09
loc_f8a3:
	lda $fc                  ; $f8a3: a5 fc
	and #$01                 ; $f8a5: 29 01 VBLANK
	tax                      ; $f8a7: aa
	lda #$ff                 ; $f8a8: a9 ff
	sta $bd,x                ; $f8aa: 95 bd
loc_f8ac:
	lda $be                  ; $f8ac: a5 be
	cmp $bd                  ; $f8ae: c5 bd
	ror $bf                  ; $f8b0: 66 bf
	lda $fc                  ; $f8b2: a5 fc
	and #$03                 ; $f8b4: 29 03 RSYNC
	tax                      ; $f8b6: aa
	lda $fc                  ; $f8b7: a5 fc
	and #$04                 ; $f8b9: 29 04 NUSIZ0
	lsr                      ; $f8bb: 4a
	lsr                      ; $f8bc: 4a
	sta $b2                  ; $f8bd: 85 b2
	lda $dd,x                ; $f8bf: b5 dd
	bmi $f8cf                ; $f8c1: 30 0c
loc_f8c3:
	lda $d7,x                ; $f8c3: b5 d7
	asl                      ; $f8c5: 0a
	bmi $f8d3                ; $f8c6: 30 0b
loc_f8c8:
	lda $d7,x                ; $f8c8: b5 d7
	and #$03                 ; $f8ca: 29 03 RSYNC
	asl                      ; $f8cc: 0a
	bcc $f8d5                ; $f8cd: 90 06
loc_f8cf:
	lda #$08                 ; $f8cf: a9 08 COLUPF
	bne $f8d5                ; $f8d1: d0 02
loc_f8d3:
	lda #$0a                 ; $f8d3: a9 0a CTRLPF
loc_f8d5:
	ora $b2                  ; $f8d5: 05 b2
	jmp $fff0                ; $f8d7: 4c f0 ff

; === Block $f8e6-$f908 (Code) ===
loc_f8e6:
	lda $d7,x                ; $f8e6: b5 d7
	rol                      ; $f8e8: 2a
	rol                      ; $f8e9: 2a
	and #$01                 ; $f8ea: 29 01 VBLANK
	sta $b3                  ; $f8ec: 85 b3
	lda $d0                  ; $f8ee: a5 d0
	sec                      ; $f8f0: 38
	sbc $ea,x                ; $f8f1: f5 ea
	sta $b2                  ; $f8f3: 85 b2
	lda #$00                 ; $f8f5: a9 00 VSYNC
	sbc $b3                  ; $f8f7: e5 b3
	sta $b3                  ; $f8f9: 85 b3
	bpl $f909                ; $f8fb: 10 0c
loc_f8fd:
	cmp #$ff                 ; $f8fd: c9 ff
	bne $f90f                ; $f8ff: d0 0e
loc_f901:
	lda $b2                  ; $f901: a5 b2
	cmp #$75                 ; $f903: c9 75
	bcc $f90f                ; $f905: 90 08
loc_f907:
	clc                      ; $f907: 18
	rts                      ; $f908: 60

; === Block $f909-$f910 (Code) ===
loc_f909:
	lda $b2                  ; $f909: a5 b2
	cmp #$13                 ; $f90b: c9 13 RESM1
	bcc $f908                ; $f90d: 90 f9
loc_f90f:
	sec                      ; $f90f: 38
	rts                      ; $f910: 60

; === Block $f966-$f975 (Code) ===
loc_f966:
	lda #$08                 ; $f966: a9 08 COLUPF
	sta $19                  ; $f968: 85 19 AUDV0
loc_f96a:
	lda #$0d                 ; $f96a: a9 0d PF0
	bpl $f9c8                ; $f96c: 10 5a
loc_f96e:
	lda #$04                 ; $f96e: a9 04 NUSIZ0
	sta $15                  ; $f970: 85 15 AUDC0
	lsr                      ; $f972: 4a
	bpl $f9cd                ; $f973: 10 58

; === Block $f975-$fa28 (Code) ===
loc_f975:
	ldx $ef                  ; $f975: a6 ef
	lda $f956,x              ; $f977: bd 56 f9
	sta $d5                  ; $f97a: 85 d5
	sta $aa                  ; $f97c: 85 aa
	lda $f952,x              ; $f97e: bd 52 f9
	sta $a9                  ; $f981: 85 a9
	dec $f0                  ; $f983: c6 f0
	bpl $fa02                ; $f985: 10 7b
loc_f987:
	dec $f4                  ; $f987: c6 f4
	bpl $f9ca                ; $f989: 10 3f
loc_f98b:
	bit $e9                  ; $f98b: 24 e9
	bpl $f999                ; $f98d: 10 0a
loc_f98f:
	lda #$00                 ; $f98f: a9 00 VSYNC
	sta $e9                  ; $f991: 85 e9
	sta $19                  ; $f993: 85 19 AUDV0
	sta $f4                  ; $f995: 85 f4
	bpl $f9ca                ; $f997: 10 31
loc_f999:
	inc $f1                  ; $f999: e6 f1
	ldy $f1                  ; $f99b: a4 f1
	jsr $ffde                ; $f99d: 20 de ff
loc_f9a0:
	cmp #$ff                 ; $f9a0: c9 ff
	beq $fa09                ; $f9a2: f0 65
loc_f9a4:
	sta $e9                  ; $f9a4: 85 e9
	sta $17                  ; $f9a6: 85 17 AUDF0
	and #$60                 ; $f9a8: 29 60 HMP0
	asl                      ; $f9aa: 0a
	rol                      ; $f9ab: 2a
	rol                      ; $f9ac: 2a
	rol                      ; $f9ad: 2a
	sta $f4                  ; $f9ae: 85 f4
	lda $e9                  ; $f9b0: a5 e9
	cmp #$cb                 ; $f9b2: c9 cb
	beq $f966                ; $f9b4: f0 b0
loc_f9b6:
	cmp #$9f                 ; $f9b6: c9 9f
	beq $f96e                ; $f9b8: f0 b4
loc_f9ba:
	cmp #$0a                 ; $f9ba: c9 0a CTRLPF
	beq $f96a                ; $f9bc: f0 ac
loc_f9be:
	and #$1f                 ; $f9be: 29 1f ENABL
	beq $f9c4                ; $f9c0: f0 02
loc_f9c2:
	lda #$08                 ; $f9c2: a9 08 COLUPF
loc_f9c4:
	sta $19                  ; $f9c4: 85 19 AUDV0
	lda #$04                 ; $f9c6: a9 04 NUSIZ0
	sta $15                  ; $f9c8: 85 15 AUDC0
loc_f9ca:
	lda $f962,x              ; $f9ca: bd 62 f9
	sta $f0                  ; $f9cd: 85 f0
	lda $f95e,x              ; $f9cf: bd 5e f9
	sta $aa                  ; $f9d2: 85 aa
	lda $f95a,x              ; $f9d4: bd 5a f9
	sta $a9                  ; $f9d7: 85 a9
	dec $f5                  ; $f9d9: c6 f5
	bpl $fa02                ; $f9db: 10 25
loc_f9dd:
	bit $d4                  ; $f9dd: 24 d4
	bmi $fa29                ; $f9df: 30 48
loc_f9e1:
	inc $f2                  ; $f9e1: e6 f2
	ldy $f2                  ; $f9e3: a4 f2
	jsr $ffde                ; $f9e5: 20 de ff
loc_f9e8:
	sta $d4                  ; $f9e8: 85 d4
	sta $18                  ; $f9ea: 85 18 AUDF1
	and #$60                 ; $f9ec: 29 60 HMP0
	asl                      ; $f9ee: 0a
	rol                      ; $f9ef: 2a
	rol                      ; $f9f0: 2a
	rol                      ; $f9f1: 2a
	sta $f5                  ; $f9f2: 85 f5
	lda $d4                  ; $f9f4: a5 d4
	and #$1f                 ; $f9f6: 29 1f ENABL
	beq $f9fc                ; $f9f8: f0 02
loc_f9fa:
	lda #$06                 ; $f9fa: a9 06 COLUP0
loc_f9fc:
	sta $1a                  ; $f9fc: 85 1a AUDV1
	lda #$0d                 ; $f9fe: a9 0d PF0
	sta $16                  ; $fa00: 85 16 AUDC1
loc_fa02:
	txa                      ; $fa02: 8a
	beq $fa28                ; $fa03: f0 23
loc_fa05:
	lda $3c                  ; $fa05: a5 3c
	bmi $fa28                ; $fa07: 30 1f
loc_fa09:
	ldx #$00                 ; $fa09: a2 00 VSYNC
	stx $19                  ; $fa0b: 86 19 AUDV0
	stx $1a                  ; $fa0d: 86 1a AUDV1
	stx $d5                  ; $fa0f: 86 d5
	stx $d4                  ; $fa11: 86 d4
	stx $f4                  ; $fa13: 86 f4
	stx $f5                  ; $fa15: 86 f5
	stx $f0                  ; $fa17: 86 f0
	stx $f2                  ; $fa19: 86 f2
	dex                      ; $fa1b: ca
	stx $f1                  ; $fa1c: 86 f1
	lda $f8                  ; $fa1e: a5 f8
	bpl $fa28                ; $fa20: 10 06
loc_fa22:
	ora #$40                 ; $fa22: 09 40 VSYNC
	sta $f8                  ; $fa24: 85 f8
	stx $f2                  ; $fa26: 86 f2
loc_fa28:
	rts                      ; $fa28: 60

; === Block $fa29-$fa33 (Code) ===
loc_fa29:
	lda #$00                 ; $fa29: a9 00 VSYNC
	sta $d4                  ; $fa2b: 85 d4
	sta $f5                  ; $fa2d: 85 f5
	sta $1a                  ; $fa2f: 85 1a AUDV1
	beq $fa02                ; $fa31: f0 cf

; === Block $fa33-$fa38 (Code) ===
loc_fa33:
	ldx $f3                  ; $fa33: a6 f3
	dex                      ; $fa35: ca
	bne $fa3b                ; $fa36: d0 03
loc_fa38:
	jmp $f975                ; $fa38: 4c 75 f9

; === Block $fa3b-$fa45 (Code) ===
loc_fa3b:
	lda $f8                  ; $fa3b: a5 f8
	bpl $fa46                ; $fa3d: 10 07
loc_fa3f:
	lda #$00                 ; $fa3f: a9 00 VSYNC
	sta $19                  ; $fa41: 85 19 AUDV0
	sta $1a                  ; $fa43: 85 1a AUDV1
	rts                      ; $fa45: 60

; === Block $fa46-$fa8f (Code) ===
loc_fa46:
	ldx $f1                  ; $fa46: a6 f1
	cpx #$ff                 ; $fa48: e0 ff
	beq $fa67                ; $fa4a: f0 1b
loc_fa4c:
	lda $fbcf,x              ; $fa4c: bd cf fb
	bmi $fa63                ; $fa4f: 30 12
loc_fa51:
	sta $17                  ; $fa51: 85 17 AUDF0
	lda $faa1,x              ; $fa53: bd a1 fa
	sta $15                  ; $fa56: 85 15 AUDC0
	lsr                      ; $fa58: 4a
	lsr                      ; $fa59: 4a
	lsr                      ; $fa5a: 4a
	lsr                      ; $fa5b: 4a
	sta $19                  ; $fa5c: 85 19 AUDV0
	inx                      ; $fa5e: e8
	stx $f1                  ; $fa5f: 86 f1
	bne $fa6a                ; $fa61: d0 07
loc_fa63:
	ldx #$ff                 ; $fa63: a2 ff
	stx $f1                  ; $fa65: 86 f1
loc_fa67:
	inx                      ; $fa67: e8
	stx $19                  ; $fa68: 86 19 AUDV0
loc_fa6a:
	lda $f3                  ; $fa6a: a5 f3
	cmp #$04                 ; $fa6c: c9 04 NUSIZ0
	bne $fa74                ; $fa6e: d0 04
loc_fa70:
	lda #$00                 ; $fa70: a9 00 VSYNC
	beq $fa43                ; $fa72: f0 cf
loc_fa74:
	ldx $f2                  ; $fa74: a6 f2
	cpx #$ff                 ; $fa76: e0 ff
	beq $fa9d                ; $fa78: f0 23
loc_fa7a:
	lda $fc34,x              ; $fa7a: bd 34 fc
	bmi $fa90                ; $fa7d: 30 11
loc_fa7f:
	sta $18                  ; $fa7f: 85 18 AUDF1
	lda $fb05,x              ; $fa81: bd 05 fb
	sta $16                  ; $fa84: 85 16 AUDC1
	lsr                      ; $fa86: 4a
	lsr                      ; $fa87: 4a
	lsr                      ; $fa88: 4a
	lsr                      ; $fa89: 4a
	sta $1a                  ; $fa8a: 85 1a AUDV1
	inx                      ; $fa8c: e8
	stx $f2                  ; $fa8d: 86 f2
	rts                      ; $fa8f: 60

; === Block $fa90-$fa9d (Code) ===
loc_fa90:
	cmp #$ff                 ; $fa90: c9 ff
	beq $fa99                ; $fa92: f0 05
loc_fa94:
	and #$7f                 ; $fa94: 29 7f
	tax                      ; $fa96: aa
	bpl $fa7a                ; $fa97: 10 e1
loc_fa99:
	ldx #$ff                 ; $fa99: a2 ff
	stx $f2                  ; $fa9b: 86 f2

; === Block $fa9d-$faa0 (Code) ===
loc_fa9d:
	inx                      ; $fa9d: e8
	stx $1a                  ; $fa9e: 86 1a AUDV1
	rts                      ; $faa0: 60

; === Block $ffde-$ffe1 (Code) ===
loc_ffde:
	sta $fff7                ; $ffde: 8d f7 ff BANK1
	jmp $f100                ; $ffe1: 4c 00 f1

; === Block $ffed-$fff0 (Code) ===
loc_ffed:
	sta $fff6                ; $ffed: 8d f6 ff BANK0

; === Block $fff0-$fff3 (Code) ===
loc_fff0:
	sta $fff8                ; $fff0: 8d f8 ff BANK2
	jmp $f160                ; $fff3: 4c 60 f1

