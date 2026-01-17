; 🌺 Peony Disassembly
; ROM: Centipede (1982) (Atari) (PAL) [!].a26
; Platform: Atari 2600
; Size: 8192 bytes
; Mapper: F8

; === Block $f000-$f016 (Code) ===
reset:
	lda #$01                 ; $f000: a9 01 VBLANK
	nop                      ; $f002: ea
	sei                      ; $f003: 78
	cld                      ; $f004: d8
	ldx #$ff                 ; $f005: a2 ff
	lda #$00                 ; $f007: a9 00 VSYNC
	sta $02,x                ; $f009: 95 02 WSYNC
	dex                      ; $f00b: ca
	bne $f009                ; $f00c: d0 fb
loc_f00e:
	stx $ed                  ; $f00e: 86 ed
	lda #$e0                 ; $f010: a9 e0
	sta $f2                  ; $f012: 85 f2
	sta $f4                  ; $f014: 85 f4
	jmp $f116                ; $f016: 4c 16 f1

; === Block $f019-$f0d2 (Code) ===
loc_f019:
	lda #$00                 ; $f019: a9 00 VSYNC
	sta $a6                  ; $f01b: 85 a6
	lda #$30                 ; $f01d: a9 30
	sta $ed                  ; $f01f: 85 ed
	ldx #$26                 ; $f021: a2 26 VDELP1
	lda $fea8,x              ; $f023: bd a8 fe
	sta $ad,x                ; $f026: 95 ad
	dex                      ; $f028: ca
	bpl $f023                ; $f029: 10 f8
loc_f02b:
	stx $f7                  ; $f02b: 86 f7
	stx $f9                  ; $f02d: 86 f9
	inx                      ; $f02f: e8
	stx $f0                  ; $f030: 86 f0
	stx $19                  ; $f032: 86 19 AUDV0
	stx $f6                  ; $f034: 86 f6
	stx $f5                  ; $f036: 86 f5
	stx $f4                  ; $f038: 86 f4
	lda #$3c                 ; $f03a: a9 3c
	sta $ef                  ; $f03c: 85 ef
	lda #$38                 ; $f03e: a9 38
	sta $f1                  ; $f040: 85 f1
	ldx $f4                  ; $f042: a6 f4
	lda $ed                  ; $f044: a5 ed
	sec                      ; $f046: 38
	sbc #$01                 ; $f047: e9 01 VBLANK
	and #$0f                 ; $f049: 29 0f PF2
	cpx #$04                 ; $f04b: e0 04 NUSIZ0
	bmi $f051                ; $f04d: 30 02
loc_f04f:
	and #$0e                 ; $f04f: 29 0e PF1
loc_f051:
	sta $aa                  ; $f051: 85 aa
	lda $ed                  ; $f053: a5 ed
	and #$f0                 ; $f055: 29 f0
	ora $aa                  ; $f057: 05 aa
	sta $ed                  ; $f059: 85 ed
	ldx #$12                 ; $f05b: a2 12 RESM0
	lda #$16                 ; $f05d: a9 16 AUDC1
	sta $94,x                ; $f05f: 95 94
	dex                      ; $f061: ca
	bpl $f05f                ; $f062: 10 fb
loc_f064:
	stx $fc                  ; $f064: 86 fc
	inx                      ; $f066: e8
	stx $19                  ; $f067: 86 19 AUDV0
	stx $1a                  ; $f069: 86 1a AUDV1
	lda $a7                  ; $f06b: a5 a7
	and #$60                 ; $f06d: 29 60 HMP0
	ora #$16                 ; $f06f: 09 16 AUDC1
	sta $a7                  ; $f071: 85 a7
	lda $ed                  ; $f073: a5 ed
	cmp #$10                 ; $f075: c9 10 RESP0
	bcs $f081                ; $f077: b0 08
loc_f079:
	lda $a6                  ; $f079: a5 a6
	ora #$40                 ; $f07b: 09 40 VSYNC
	sta $a6                  ; $f07d: 85 a6
	bne $f08a                ; $f07f: d0 09
loc_f081:
	sec                      ; $f081: 38
	sbc #$10                 ; $f082: e9 10 RESP0
	sta $ed                  ; $f084: 85 ed
	lda #$00                 ; $f086: a9 00 VSYNC
	sta $fe                  ; $f088: 85 fe
loc_f08a:
	ldx #$08                 ; $f08a: a2 08 COLUPF
	stx $f2                  ; $f08c: 86 f2
	ldx $f4                  ; $f08e: a6 f4
	lda $ed                  ; $f090: a5 ed
	cpx #$04                 ; $f092: e0 04 NUSIZ0
	bmi $f098                ; $f094: 30 02
loc_f096:
	ora #$01                 ; $f096: 09 01 VBLANK
loc_f098:
	clc                      ; $f098: 18
	adc #$01                 ; $f099: 69 01 VBLANK
	and #$0f                 ; $f09b: 29 0f PF2
	sta $aa                  ; $f09d: 85 aa
	lda $ed                  ; $f09f: a5 ed
	and #$f0                 ; $f0a1: 29 f0
	ora $aa                  ; $f0a3: 05 aa
	sta $ed                  ; $f0a5: 85 ed
	lda #$0f                 ; $f0a7: a9 0f PF2
	bit $a7                  ; $f0a9: 24 a7
	bvs $f0b2                ; $f0ab: 70 05
loc_f0ad:
	sec                      ; $f0ad: 38
	sbc $ed                  ; $f0ae: e5 ed
	and #$0f                 ; $f0b0: 29 0f PF2
loc_f0b2:
	clc                      ; $f0b2: 18
	adc #$03                 ; $f0b3: 69 03 RSYNC
	lsr                      ; $f0b5: 4a
	sta $aa                  ; $f0b6: 85 aa
	lda #$3c                 ; $f0b8: a9 3c
	ldy #$b3                 ; $f0ba: a0 b3
	ldx #$00                 ; $f0bc: a2 00 VSYNC
	cpx $aa                  ; $f0be: e4 aa
	bmi $f0e7                ; $f0c0: 30 25
loc_f0c2:
	lda $f0d5,x              ; $f0c2: bd d5 f0
	sta $e4,x                ; $f0c5: 95 e4
	lda $f0de,x              ; $f0c7: bd de f0
	sta $db,x                ; $f0ca: 95 db
	lda $94,x                ; $f0cc: b5 94
	ora #$40                 ; $f0ce: 09 40 VSYNC
	sta $94,x                ; $f0d0: 95 94
	jmp $f102                ; $f0d2: 4c 02 f1

; === Block $f0e7-$f113 (Code) ===
loc_f0e7:
	clc                      ; $f0e7: 18
	adc #$04                 ; $f0e8: 69 04 NUSIZ0
	sta $e4,x                ; $f0ea: 95 e4
	sty $db,x                ; $f0ec: 94 db
	lda $ed                  ; $f0ee: a5 ed
	and #$01                 ; $f0f0: 29 01 VBLANK
	beq $f0fc                ; $f0f2: f0 08
loc_f0f4:
	lda $94,x                ; $f0f4: b5 94
	and #$9f                 ; $f0f6: 29 9f
	sta $94,x                ; $f0f8: 95 94
	bne $f102                ; $f0fa: d0 06
loc_f0fc:
	lda $94,x                ; $f0fc: b5 94
	ora #$40                 ; $f0fe: 09 40 VSYNC
	sta $94,x                ; $f100: 95 94
loc_f102:
	inx                      ; $f102: e8
	lda $e3,x                ; $f103: b5 e3
	cpx #$09                 ; $f105: e0 09 COLUBK
	bne $f0be                ; $f107: d0 b5
loc_f109:
	lda #$33                 ; $f109: a9 33
	sta $db                  ; $f10b: 85 db
	lda $9d                  ; $f10d: a5 9d
	and #$df                 ; $f10f: 29 df
	sta $9d                  ; $f111: 85 9d
	jmp $f8a9                ; $f113: 4c a9 f8

; === Block $f116-$f133 (Code) ===
loc_f116:
	ldx #$02                 ; $f116: a2 02 WSYNC
	stx $02                  ; $f118: 86 02 WSYNC
	stx $00                  ; $f11a: 86 00 VSYNC
	stx $01                  ; $f11c: 86 01 VBLANK
	stx $02                  ; $f11e: 86 02 WSYNC
	stx $02                  ; $f120: 86 02 WSYNC
	stx $02                  ; $f122: 86 02 WSYNC
	ldx #$00                 ; $f124: a2 00 VSYNC
	stx $00                  ; $f126: 86 00 VSYNC
	ldx #$4d                 ; $f128: a2 4d PF0
	stx $0296                ; $f12a: 8e 96 02 TIM64T
	lda $f4                  ; $f12d: a5 f4
	cmp #$e0                 ; $f12f: c9 e0
	bne $f136                ; $f131: d0 03
loc_f133:
	jmp $ffec                ; $f133: 4c ec ff

; === Block $f136-$f16b (Code) ===
loc_f136:
	inc $a9                  ; $f136: e6 a9
	bit $a6                  ; $f138: 24 a6
	bvc $f140                ; $f13a: 50 04
loc_f13c:
	bit $3c                  ; $f13c: 24 3c
	bpl $f16b                ; $f13e: 10 2b
loc_f140:
	lda $0282                ; $f140: ad 82 02 SWCHB
	lsr                      ; $f143: 4a
	bcc $f16b                ; $f144: 90 25
loc_f146:
	lsr                      ; $f146: 4a
	lda $ff                  ; $f147: a5 ff
	bne $f16e                ; $f149: d0 23
loc_f14b:
	bcs $f16e                ; $f14b: b0 21
loc_f14d:
	sta $f4                  ; $f14d: 85 f4
	sta $f5                  ; $f14f: 85 f5
	sta $f6                  ; $f151: 85 f6
	lda #$0f                 ; $f153: a9 0f PF2
	sta $ff                  ; $f155: 85 ff
	lda $a6                  ; $f157: a5 a6
	ora #$40                 ; $f159: 09 40 VSYNC
	sta $a6                  ; $f15b: 85 a6
	lda $a7                  ; $f15d: a5 a7
	eor #$40                 ; $f15f: 49 40 VSYNC
	sta $a7                  ; $f161: 85 a7
	lda $ed                  ; $f163: a5 ed
	and #$0f                 ; $f165: 29 0f PF2
	sta $ed                  ; $f167: 85 ed
	bpl $f16e                ; $f169: 10 03
loc_f16b:
	jmp $f019                ; $f16b: 4c 19 f0

; === Block $f16e-$f18b (Code) ===
loc_f16e:
	lda $ff                  ; $f16e: a5 ff
	beq $f174                ; $f170: f0 02
loc_f172:
	dec $ff                  ; $f172: c6 ff
loc_f174:
	lda $a3                  ; $f174: a5 a3
	and #$60                 ; $f176: 29 60 HMP0
	beq $f1a6                ; $f178: f0 2c
loc_f17a:
	cmp #$60                 ; $f17a: c9 60 HMP0
	beq $f18e                ; $f17c: f0 10
loc_f17e:
	lda $a9                  ; $f17e: a5 a9
	and #$1f                 ; $f180: 29 1f ENABL
	bne $f1a6                ; $f182: d0 22
loc_f184:
	lda #$20                 ; $f184: a9 20 HMP0
	clc                      ; $f186: 18
	adc $a3                  ; $f187: 65 a3
	sta $a3                  ; $f189: 85 a3
	jmp $f1a6                ; $f18b: 4c a6 f1

; === Block $f18e-$f1a6 (Code) ===
loc_f18e:
	lda $a3                  ; $f18e: a5 a3
	and #$9f                 ; $f190: 29 9f
	sta $a3                  ; $f192: 85 a3
	lda $a4                  ; $f194: a5 a4
	ora #$40                 ; $f196: 09 40 VSYNC
	sta $a4                  ; $f198: 85 a4
	lda #$fe                 ; $f19a: a9 fe
	sta $eb                  ; $f19c: 85 eb
	lda #$20                 ; $f19e: a9 20 HMP0
	sta $ec                  ; $f1a0: 85 ec
	lda #$00                 ; $f1a2: a9 00 VSYNC
	sta $e9                  ; $f1a4: 85 e9

; === Block $f1a6-$f1aa (Code) ===
loc_f1a6:
	bit $a4                  ; $f1a6: 24 a4
	bvs $f1ad                ; $f1a8: 70 03
loc_f1aa:
	jmp $f283                ; $f1aa: 4c 83 f2

; === Block $f1ad-$f1d7 (Code) ===
loc_f1ad:
	sta $f0                  ; $f1ad: 85 f0
	ldy #$32                 ; $f1af: a0 32
	sty $ea                  ; $f1b1: 84 ea
	ldy $eb                  ; $f1b3: a4 eb
	ldx $ec                  ; $f1b5: a6 ec
	lda $e9                  ; $f1b7: a5 e9
	and #$03                 ; $f1b9: 29 03 RSYNC
	bne $f1f4                ; $f1bb: d0 37
loc_f1bd:
	dec $ea                  ; $f1bd: c6 ea
	beq $f1e0                ; $f1bf: f0 1f
loc_f1c1:
	iny                      ; $f1c1: c8
	iny                      ; $f1c2: c8
	txa                      ; $f1c3: 8a
	eor #$20                 ; $f1c4: 49 20 HMP0
	tax                      ; $f1c6: aa
	cpy #$28                 ; $f1c7: c0 28 RESMP0
	bmi $f1e8                ; $f1c9: 30 1d
loc_f1cb:
	inx                      ; $f1cb: e8
	ldy #$00                 ; $f1cc: a0 00 VSYNC
	cpx #$10                 ; $f1ce: e0 10 RESP0
	bmi $f1d3                ; $f1d0: 30 01
loc_f1d2:
	iny                      ; $f1d2: c8
loc_f1d3:
	cpx #$20                 ; $f1d3: e0 20 HMP0
	bne $f1e8                ; $f1d5: d0 11
loc_f1d7:
	jmp $f26f                ; $f1d7: 4c 6f f2

; === Block $f1da-$f1e0 (Code) ===
loc_f1da:
	lda #$00                 ; $f1da: a9 00 VSYNC
	sta $19                  ; $f1dc: 85 19 AUDV0
	sta $17                  ; $f1de: 85 17 AUDF0

; === Block $f1e0-$f1e4 (Code) ===
loc_f1e0:
	sty $eb                  ; $f1e0: 84 eb
	stx $ec                  ; $f1e2: 86 ec
	jmp $f8a9                ; $f1e4: 4c a9 f8

; === Block $f1e8-$f1f4 (Code) ===
loc_f1e8:
	lda $00ad,y              ; $f1e8: b9 ad 00
	and $fed0,x              ; $f1eb: 3d d0 fe
	beq $f1bd                ; $f1ee: f0 cd
loc_f1f0:
	sty $eb                  ; $f1f0: 84 eb
	stx $ec                  ; $f1f2: 86 ec

; === Block $f1f4-$f26c (Code) ===
loc_f1f4:
	lda $e9                  ; $f1f4: a5 e9
	inc $e9                  ; $f1f6: e6 e9
	and #$02                 ; $f1f8: 29 02 WSYNC
	bne $f1da                ; $f1fa: d0 de
loc_f1fc:
	tya                      ; $f1fc: 98
	lsr                      ; $f1fd: 4a
	eor #$ff                 ; $f1fe: 49 ff
	clc                      ; $f200: 18
	adc #$14                 ; $f201: 69 14 RESBL
	tay                      ; $f203: a8
	txa                      ; $f204: 8a
	and #$df                 ; $f205: 29 df
	asl                      ; $f207: 0a
	asl                      ; $f208: 0a
	beq $f20d                ; $f209: f0 02
loc_f20b:
	sbc #$01                 ; $f20b: e9 01 VBLANK
loc_f20d:
	tax                      ; $f20d: aa
	stx $80,y                ; $f20e: 96 80
	lda $e9                  ; $f210: a5 e9
	and #$03                 ; $f212: 29 03 RSYNC
	sta $aa                  ; $f214: 85 aa
	lda $0094,y              ; $f216: b9 94 00
	and #$e0                 ; $f219: 29 e0
	ora #$10                 ; $f21b: 09 10 RESP0
	ora $aa                  ; $f21d: 05 aa
	sta $0094,y              ; $f21f: 99 94 00
	bit $a6                  ; $f222: 24 a6
	bvs $f26c                ; $f224: 70 46
loc_f226:
	bit $a5                  ; $f226: 24 a5
	bvs $f236                ; $f228: 70 0c
loc_f22a:
	lda #$08                 ; $f22a: a9 08 COLUPF
	sta $15                  ; $f22c: 85 15 AUDC0
	lda #$0a                 ; $f22e: a9 0a CTRLPF
	sta $17                  ; $f230: 85 17 AUDF0
	lda #$ff                 ; $f232: a9 ff
	sta $19                  ; $f234: 85 19 AUDV0
loc_f236:
	lda $e9                  ; $f236: a5 e9
	and #$07                 ; $f238: 29 07 COLUP1
	cmp #$01                 ; $f23a: c9 01 VBLANK
	bne $f26c                ; $f23c: d0 2e
loc_f23e:
	sed                      ; $f23e: f8
	clc                      ; $f23f: 18
	lda #$05                 ; $f240: a9 05 NUSIZ1
	adc $f6                  ; $f242: 65 f6
	sta $f6                  ; $f244: 85 f6
	lda #$00                 ; $f246: a9 00 VSYNC
	adc $f5                  ; $f248: 65 f5
	sta $f5                  ; $f24a: 85 f5
	bcc $f26b                ; $f24c: 90 1d
loc_f24e:
	lda #$00                 ; $f24e: a9 00 VSYNC
	adc $f4                  ; $f250: 65 f4
	sta $f4                  ; $f252: 85 f4
	cld                      ; $f254: d8
	lda $ed                  ; $f255: a5 ed
	cmp #$70                 ; $f257: c9 70
	bpl $f26b                ; $f259: 10 10
loc_f25b:
	adc #$10                 ; $f25b: 69 10 RESP0
	sta $ed                  ; $f25d: 85 ed
	lda $a5                  ; $f25f: a5 a5
	ora #$20                 ; $f261: 09 20 HMP0
	sta $a5                  ; $f263: 85 a5
	lda $a9                  ; $f265: a5 a9
	and #$0f                 ; $f267: 29 0f PF2
	sta $a9                  ; $f269: 85 a9
loc_f26b:
	cld                      ; $f26b: d8
loc_f26c:
	jmp $f8a9                ; $f26c: 4c a9 f8

; === Block $f26f-$f27d (Code) ===
loc_f26f:
	lda $a4                  ; $f26f: a5 a4
	and #$bf                 ; $f271: 29 bf
	sta $a4                  ; $f273: 85 a4
	lda #$f0                 ; $f275: a9 f0
	sta $f2                  ; $f277: 85 f2
	bit $a6                  ; $f279: 24 a6
	bvs $f280                ; $f27b: 70 03
loc_f27d:
	jmp $f8a9                ; $f27d: 4c a9 f8

; === Block $f280-$f280 (Code) ===
loc_f280:
	jmp $ffec                ; $f280: 4c ec ff

; === Block $f283-$f291 (Code) ===
loc_f283:
	ldy #$00                 ; $f283: a0 00 VSYNC
	lda #$ff                 ; $f285: a9 ff
	sta $a8                  ; $f287: 85 a8
	lda $f2                  ; $f289: a5 f2
	bpl $f2a8                ; $f28b: 10 1b
loc_f28d:
	cmp #$f0                 ; $f28d: c9 f0
	bne $f294                ; $f28f: d0 03
loc_f291:
	jmp $f03a                ; $f291: 4c 3a f0

; === Block $f294-$f298 (Code) ===
loc_f294:
	cmp #$e0                 ; $f294: c9 e0
	bne $f29b                ; $f296: d0 03
loc_f298:
	jmp $f021                ; $f298: 4c 21 f0

; === Block $f29b-$f29b (Code) ===
loc_f29b:
	jmp $f08a                ; $f29b: 4c 8a f0

; === Block $f2a8-$f3f3 (Code) ===
loc_f2a8:
	bit $a6                  ; $f2a8: 24 a6
	bvs $f301                ; $f2aa: 70 55
loc_f2ac:
	bit $a5                  ; $f2ac: 24 a5
	bvs $f301                ; $f2ae: 70 51
loc_f2b0:
	lda $fd                  ; $f2b0: a5 fd
	and #$0c                 ; $f2b2: 29 0c REFP1
	beq $f2cf                ; $f2b4: f0 19
loc_f2b6:
	cmp #$0c                 ; $f2b6: c9 0c REFP1
	beq $f2c5                ; $f2b8: f0 0b
loc_f2ba:
	clc                      ; $f2ba: 18
	lda #$04                 ; $f2bb: a9 04 NUSIZ0
	adc $fd                  ; $f2bd: 65 fd
	sta $fd                  ; $f2bf: 85 fd
	lda #$08                 ; $f2c1: a9 08 COLUPF
	bne $f2d7                ; $f2c3: d0 12
loc_f2c5:
	lda #$f3                 ; $f2c5: a9 f3
	and $fd                  ; $f2c7: 25 fd
	sta $fd                  ; $f2c9: 85 fd
	lda #$08                 ; $f2cb: a9 08 COLUPF
	bne $f2d7                ; $f2cd: d0 08
loc_f2cf:
	lda $a9                  ; $f2cf: a5 a9
	and #$0f                 ; $f2d1: 29 0f PF2
	bne $f2e1                ; $f2d3: d0 0c
loc_f2d5:
	lda #$0f                 ; $f2d5: a9 0f PF2
loc_f2d7:
	sta $17                  ; $f2d7: 85 17 AUDF0
	sta $15                  ; $f2d9: 85 15 AUDC0
	lda #$0f                 ; $f2db: a9 0f PF2
	sta $19                  ; $f2dd: 85 19 AUDV0
	bne $f301                ; $f2df: d0 20
loc_f2e1:
	ldx $f1                  ; $f2e1: a6 f1
	lda $ff90,x              ; $f2e3: bd 90 ff
	clc                      ; $f2e6: 18
	adc #$03                 ; $f2e7: 69 03 RSYNC
	sbc $f0                  ; $f2e9: e5 f0
	tay                      ; $f2eb: a8
	ldx #$00                 ; $f2ec: a2 00 VSYNC
	cpy #$09                 ; $f2ee: c0 09 COLUBK
	beq $f2fb                ; $f2f0: f0 09
loc_f2f2:
	bpl $f2fd                ; $f2f2: 10 09
loc_f2f4:
	ldx #$ff                 ; $f2f4: a2 ff
	lda $f29e,y              ; $f2f6: b9 9e f2
	ldy #$08                 ; $f2f9: a0 08 COLUPF
loc_f2fb:
	sty $15                  ; $f2fb: 84 15 AUDC0
loc_f2fd:
	stx $19                  ; $f2fd: 86 19 AUDV0
	sta $17                  ; $f2ff: 85 17 AUDF0
loc_f301:
	lda $a3                  ; $f301: a5 a3
	and #$60                 ; $f303: 29 60 HMP0
	beq $f329                ; $f305: f0 22
loc_f307:
	lda #$ff                 ; $f307: a9 ff
	sta $fc                  ; $f309: 85 fc
	sta $f7                  ; $f30b: 85 f7
	sta $f9                  ; $f30d: 85 f9
	bit $a6                  ; $f30f: 24 a6
	bvs $f329                ; $f311: 70 16
loc_f313:
	bit $a5                  ; $f313: 24 a5
	bvs $f329                ; $f315: 70 12
loc_f317:
	sta $19                  ; $f317: 85 19 AUDV0
	lda #$08                 ; $f319: a9 08 COLUPF
	sta $15                  ; $f31b: 85 15 AUDC0
	lda $a9                  ; $f31d: a5 a9
	and #$01                 ; $f31f: 29 01 VBLANK
	bne $f325                ; $f321: d0 02
loc_f323:
	inc $fb                  ; $f323: e6 fb
loc_f325:
	lda $fb                  ; $f325: a5 fb
	sta $17                  ; $f327: 85 17 AUDF0
loc_f329:
	ldy #$00                 ; $f329: a0 00 VSYNC
	sty $ac                  ; $f32b: 84 ac
	sty $ab                  ; $f32d: 84 ab
	lda $db                  ; $f32f: a5 db
	and #$1f                 ; $f331: 29 1f ENABL
	sta $aa                  ; $f333: 85 aa
	ldx #$00                 ; $f335: a2 00 VSYNC
	sty $d3                  ; $f337: 84 d3
	cpy $f2                  ; $f339: c4 f2
	beq $f361                ; $f33b: f0 24
loc_f33d:
	iny                      ; $f33d: c8
	lda $00db,y              ; $f33e: b9 db 00
	and #$1f                 ; $f341: 29 1f ENABL
	cmp $aa                  ; $f343: c5 aa
	bne $f339                ; $f345: d0 f2
loc_f347:
	lda $00db,y              ; $f347: b9 db 00
	bpl $f355                ; $f34a: 10 09
loc_f34c:
	lda $00da,y              ; $f34c: b9 da 00
	and #$1f                 ; $f34f: 29 1f ENABL
	cmp $aa                  ; $f351: c5 aa
	beq $f339                ; $f353: f0 e4
loc_f355:
	lda $ac                  ; $f355: a5 ac
	ora $ffcf,y              ; $f357: 19 cf ff
	sta $ac                  ; $f35a: 85 ac
	inx                      ; $f35c: e8
	sty $d3,x                ; $f35d: 94 d3
	bne $f339                ; $f35f: d0 d8
loc_f361:
	cpx #$00                 ; $f361: e0 00 VSYNC
	beq $f38b                ; $f363: f0 26
loc_f365:
	lda $a9                  ; $f365: a5 a9
	cpx #$01                 ; $f367: e0 01 VBLANK
	beq $f37b                ; $f369: f0 10
loc_f36b:
	cpx #$02                 ; $f36b: e0 02 WSYNC
	beq $f380                ; $f36d: f0 11
loc_f36f:
	cpx #$03                 ; $f36f: e0 03 RSYNC
	beq $f388                ; $f371: f0 15
loc_f373:
	and #$3f                 ; $f373: 29 3f
	tay                      ; $f375: a8
	ldx $fe68,y              ; $f376: be 68 fe
	bpl $f38b                ; $f379: 10 10
loc_f37b:
	and #$01                 ; $f37b: 29 01 VBLANK
	tax                      ; $f37d: aa
	bpl $f38b                ; $f37e: 10 0b
loc_f380:
	and #$3f                 ; $f380: 29 3f
	tay                      ; $f382: a8
	ldx $fe28,y              ; $f383: be 28 fe
	bpl $f38b                ; $f386: 10 03
loc_f388:
	and #$03                 ; $f388: 29 03 RSYNC
	tax                      ; $f38a: aa
loc_f38b:
	ldy $d3,x                ; $f38b: b4 d3
	lda $00e4,y              ; $f38d: b9 e4 00
	ldx $aa                  ; $f390: a6 aa
	sta $80,x                ; $f392: 95 80
	inc $94,x                ; $f394: f6 94
	cpy $f2                  ; $f396: c4 f2
	beq $f3b6                ; $f398: f0 1c
loc_f39a:
	iny                      ; $f39a: c8
	lda $00db,y              ; $f39b: b9 db 00
	bpl $f3b6                ; $f39e: 10 16
loc_f3a0:
	lda $00db,y              ; $f3a0: b9 db 00
	and #$1f                 ; $f3a3: 29 1f ENABL
	cmp $aa                  ; $f3a5: c5 aa
	bne $f3b6                ; $f3a7: d0 0d
loc_f3a9:
	inc $94,x                ; $f3a9: f6 94
	lda $00e4,y              ; $f3ab: b9 e4 00
	cmp $80,x                ; $f3ae: d5 80
	bcs $f396                ; $f3b0: b0 e4
loc_f3b2:
	sta $80,x                ; $f3b2: 95 80
	bcc $f396                ; $f3b4: 90 e0
loc_f3b6:
	lda $94,x                ; $f3b6: b5 94
	and #$1f                 ; $f3b8: 29 1f ENABL
	cmp #$1a                 ; $f3ba: c9 1a AUDV1
	bmi $f3cb                ; $f3bc: 30 0d
loc_f3be:
	and #$01                 ; $f3be: 29 01 VBLANK
	beq $f3cb                ; $f3c0: f0 09
loc_f3c2:
	stx $a8                  ; $f3c2: 86 a8
	lda $80,x                ; $f3c4: b5 80
	clc                      ; $f3c6: 18
	adc #$04                 ; $f3c7: 69 04 NUSIZ0
	sta $80,x                ; $f3c9: 95 80
loc_f3cb:
	ldy $ab                  ; $f3cb: a4 ab
	cpy $f2                  ; $f3cd: c4 f2
	beq $f426                ; $f3cf: f0 55
loc_f3d1:
	iny                      ; $f3d1: c8
	sty $ab                  ; $f3d2: 84 ab
	lda $ac                  ; $f3d4: a5 ac
	and $ffcf,y              ; $f3d6: 39 cf ff
	bne $f3cb                ; $f3d9: d0 f0
loc_f3db:
	lda $00db,y              ; $f3db: b9 db 00
	bpl $f3f0                ; $f3de: 10 10
loc_f3e0:
	lda $00db,y              ; $f3e0: b9 db 00
	and #$1f                 ; $f3e3: 29 1f ENABL
	sta $aa                  ; $f3e5: 85 aa
	lda $00da,y              ; $f3e7: b9 da 00
	and #$1f                 ; $f3ea: 29 1f ENABL
	cmp $aa                  ; $f3ec: c5 aa
	beq $f3cb                ; $f3ee: f0 db
loc_f3f0:
	lda $00db,y              ; $f3f0: b9 db 00
	jmp $f331                ; $f3f3: 4c 31 f3

; === Block $f3f6-$f3fa (Code) ===
loc_f3f6:
	lda #$ff                 ; $f3f6: a9 ff
	sta $fc                  ; $f3f8: 85 fc
	jmp $f570                ; $f3fa: 4c 70 f5

; === Block $f3fd-$f416 (Code) ===
loc_f3fd:
	lda $fc                  ; $f3fd: a5 fc
	eor #$40                 ; $f3ff: 49 40 VSYNC
loc_f401:
	sta $fc                  ; $f401: 85 fc
	lda $fd                  ; $f403: a5 fd
	and #$fd                 ; $f405: 29 fd
	sta $fd                  ; $f407: 85 fd
	adc $e4                  ; $f409: 65 e4
	adc $dc                  ; $f40b: 65 dc
	adc $0284                ; $f40d: 6d 84 02 INTIM
	and #$02                 ; $f410: 29 02 WSYNC
	ora $fd                  ; $f412: 05 fd
	sta $fd                  ; $f414: 85 fd
	jmp $f4d1                ; $f416: 4c d1 f4

; === Block $f419-$f41d (Code) ===
loc_f419:
	lda $fc                  ; $f419: a5 fc
	and #$bf                 ; $f41b: 29 bf
	jmp $f401                ; $f41d: 4c 01 f4

; === Block $f420-$f426 (Code) ===
loc_f420:
	lda $fc                  ; $f420: a5 fc
	ora #$40                 ; $f422: 09 40 VSYNC
	bne $f401                ; $f424: d0 db

; === Block $f426-$f462 (Code) ===
loc_f426:
	lda #$00                 ; $f426: a9 00 VSYNC
	sta $d3                  ; $f428: 85 d3
	sta $d4                  ; $f42a: 85 d4
	lda $fc                  ; $f42c: a5 fc
	cmp #$ff                 ; $f42e: c9 ff
	beq $f494                ; $f430: f0 62
loc_f432:
	bit $fd                  ; $f432: 24 fd
	bvs $f48e                ; $f434: 70 58
loc_f436:
	bmi $f48e                ; $f436: 30 56
loc_f438:
	lda $a9                  ; $f438: a5 a9
	and #$07                 ; $f43a: 29 07 COLUP1
	cmp #$02                 ; $f43c: c9 02 WSYNC
	beq $f491                ; $f43e: f0 51
loc_f440:
	cmp #$04                 ; $f440: c9 04 NUSIZ0
	beq $f491                ; $f442: f0 4d
loc_f444:
	lda $fb                  ; $f444: a5 fb
	cmp #$79                 ; $f446: c9 79
	beq $f3f6                ; $f448: f0 ac
loc_f44a:
	cmp #$00                 ; $f44a: c9 00 VSYNC
	beq $f3f6                ; $f44c: f0 a8
loc_f44e:
	lda $fd                  ; $f44e: a5 fd
	and #$02                 ; $f450: 29 02 WSYNC
	beq $f467                ; $f452: f0 13
loc_f454:
	lda $fd                  ; $f454: a5 fd
	and #$01                 ; $f456: 29 01 VBLANK
	and $a9                  ; $f458: 25 a9
	bne $f467                ; $f45a: d0 0b
loc_f45c:
	bit $fc                  ; $f45c: 24 fc
	bmi $f465                ; $f45e: 30 05
loc_f460:
	dec $fb                  ; $f460: c6 fb
	jmp $f467                ; $f462: 4c 67 f4

; === Block $f465-$f467 (Code) ===
loc_f465:
	inc $fb                  ; $f465: e6 fb

; === Block $f467-$f48b (Code) ===
loc_f467:
	lda $a9                  ; $f467: a5 a9
	and #$03                 ; $f469: 29 03 RSYNC
	bne $f491                ; $f46b: d0 24
loc_f46d:
	lda $fd                  ; $f46d: a5 fd
	and #$01                 ; $f46f: 29 01 VBLANK
	beq $f479                ; $f471: f0 06
loc_f473:
	lda $a9                  ; $f473: a5 a9
	and #$04                 ; $f475: 29 04 NUSIZ0
	bne $f491                ; $f477: d0 18
loc_f479:
	lda $fc                  ; $f479: a5 fc
	and #$1f                 ; $f47b: 29 1f ENABL
	beq $f419                ; $f47d: f0 9a
loc_f47f:
	cmp #$07                 ; $f47f: c9 07 COLUP1
	beq $f420                ; $f481: f0 9d
loc_f483:
	adc $e5                  ; $f483: 65 e5
	adc $f0                  ; $f485: 65 f0
	and #$ab                 ; $f487: 29 ab
	bne $f4d1                ; $f489: d0 46
loc_f48b:
	jmp $f3fd                ; $f48b: 4c fd f3

; === Block $f48e-$f48e (Code) ===
loc_f48e:
	jmp $f4df                ; $f48e: 4c df f4

; === Block $f491-$f491 (Code) ===
loc_f491:
	jmp $f536                ; $f491: 4c 36 f5

; === Block $f494-$f4c3 (Code) ===
loc_f494:
	lda $a9                  ; $f494: a5 a9
	cmp #$37                 ; $f496: c9 37
	bne $f4c3                ; $f498: d0 29
loc_f49a:
	lda $a3                  ; $f49a: a5 a3
	and #$60                 ; $f49c: 29 60 HMP0
	bne $f4c3                ; $f49e: d0 23
loc_f4a0:
	ldx #$00                 ; $f4a0: a2 00 VSYNC
	lda $f4                  ; $f4a2: a5 f4
	bne $f4ad                ; $f4a4: d0 07
loc_f4a6:
	lda $f5                  ; $f4a6: a5 f5
	cmp #$50                 ; $f4a8: c9 50 RESP0
	bpl $f4ad                ; $f4aa: 10 01
loc_f4ac:
	inx                      ; $f4ac: e8
loc_f4ad:
	txa                      ; $f4ad: 8a
	ora #$02                 ; $f4ae: 09 02 WSYNC
	sta $fd                  ; $f4b0: 85 fd
	lda $0284                ; $f4b2: ad 84 02 INTIM
	adc $ef                  ; $f4b5: 65 ef
	and #$04                 ; $f4b7: 29 04 NUSIZ0
	beq $f4c6                ; $f4b9: f0 0b
loc_f4bb:
	lda #$01                 ; $f4bb: a9 01 VBLANK
	sta $fb                  ; $f4bd: 85 fb
	lda #$e6                 ; $f4bf: a9 e6
	sta $fc                  ; $f4c1: 85 fc
loc_f4c3:
	jmp $f570                ; $f4c3: 4c 70 f5

; === Block $f4c6-$f4ce (Code) ===
loc_f4c6:
	lda #$78                 ; $f4c6: a9 78
	sta $fb                  ; $f4c8: 85 fb
	lda #$46                 ; $f4ca: a9 46 COLUP0
	sta $fc                  ; $f4cc: 85 fc
	jmp $f570                ; $f4ce: 4c 70 f5

; === Block $f4d1-$f4d7 (Code) ===
loc_f4d1:
	bit $fc                  ; $f4d1: 24 fc
	bvc $f4da                ; $f4d3: 50 05
loc_f4d5:
	dec $fc                  ; $f4d5: c6 fc
	jmp $f536                ; $f4d7: 4c 36 f5

; === Block $f4da-$f4dc (Code) ===
loc_f4da:
	inc $fc                  ; $f4da: e6 fc
	jmp $f536                ; $f4dc: 4c 36 f5

; === Block $f4df-$f529 (Code) ===
loc_f4df:
	lda $fc                  ; $f4df: a5 fc
	and #$1f                 ; $f4e1: 29 1f ENABL
	tay                      ; $f4e3: a8
	lda $0094,y              ; $f4e4: b9 94 00
	and #$1f                 ; $f4e7: 29 1f ENABL
	cmp #$16                 ; $f4e9: c9 16 AUDC1
	beq $f4f2                ; $f4eb: f0 05
loc_f4ed:
	lda $a9                  ; $f4ed: a5 a9
	lsr                      ; $f4ef: 4a
	bcs $f570                ; $f4f0: b0 7e
loc_f4f2:
	lda $fd                  ; $f4f2: a5 fd
	and #$c0                 ; $f4f4: 29 c0
	clc                      ; $f4f6: 18
	rol                      ; $f4f7: 2a
	rol                      ; $f4f8: 2a
	rol                      ; $f4f9: 2a
	adc #$05                 ; $f4fa: 69 05 NUSIZ1
	sta $aa                  ; $f4fc: 85 aa
	lda $0094,y              ; $f4fe: b9 94 00
	and #$e0                 ; $f501: 29 e0
	ora $aa                  ; $f503: 05 aa
	sta $0094,y              ; $f505: 99 94 00
	ldx $fb                  ; $f508: a6 fb
	stx $80,y                ; $f50a: 96 80
	lda $a9                  ; $f50c: a5 a9
	and #$0f                 ; $f50e: 29 0f PF2
	bne $f570                ; $f510: d0 5e
loc_f512:
	lda $fd                  ; $f512: a5 fd
	adc #$10                 ; $f514: 69 10 RESP0
	sta $fd                  ; $f516: 85 fd
	and #$30                 ; $f518: 29 30
	bne $f570                ; $f51a: d0 54
loc_f51c:
	lda #$ff                 ; $f51c: a9 ff
	sta $fc                  ; $f51e: 85 fc
	lda #$00                 ; $f520: a9 00 VSYNC
	sta $fd                  ; $f522: 85 fd
	beq $f570                ; $f524: f0 4a
loc_f526:
	asl $121b,x              ; $f526: 1e 1b 12
	brk                      ; $f529: 00

; === Block $f536-$f570 (Code) ===
loc_f536:
	lda $fc                  ; $f536: a5 fc
	and #$1f                 ; $f538: 29 1f ENABL
	tay                      ; $f53a: a8
	lda $a9                  ; $f53b: a5 a9
	and #$18                 ; $f53d: 29 18 AUDF1
	lsr                      ; $f53f: 4a
	lsr                      ; $f540: 4a
	lsr                      ; $f541: 4a
	adc #$02                 ; $f542: 69 02 WSYNC
	sta $aa                  ; $f544: 85 aa
	lda $0094,y              ; $f546: b9 94 00
	and #$e0                 ; $f549: 29 e0
	ora $aa                  ; $f54b: 05 aa
	sta $0094,y              ; $f54d: 99 94 00
	ldx $fb                  ; $f550: a6 fb
	stx $80,y                ; $f552: 96 80
	bit $a6                  ; $f554: 24 a6
	bvs $f570                ; $f556: 70 18
loc_f558:
	bit $a5                  ; $f558: 24 a5
	bvs $f570                ; $f55a: 70 14
loc_f55c:
	lda #$04                 ; $f55c: a9 04 NUSIZ0
	sta $16                  ; $f55e: 85 16 AUDC1
	lda $a9                  ; $f560: a5 a9
	and #$3f                 ; $f562: 29 3f
	lsr                      ; $f564: 4a
	lsr                      ; $f565: 4a
	tay                      ; $f566: a8
	lda $f526,y              ; $f567: b9 26 f5
	sta $18                  ; $f56a: 85 18 AUDF1
	lda #$07                 ; $f56c: a9 07 COLUP1
	bpl $f572                ; $f56e: 10 02

; === Block $f570-$f578 (Code) ===
loc_f570:
	lda #$00                 ; $f570: a9 00 VSYNC
	sta $1a                  ; $f572: 85 1a AUDV1
	lda $f7                  ; $f574: a5 f7
	bpl $f57b                ; $f576: 10 03
loc_f578:
	jmp $f615                ; $f578: 4c 15 f6

; === Block $f57b-$f612 (Code) ===
loc_f57b:
	lda $a9                  ; $f57b: a5 a9
	and #$0f                 ; $f57d: 29 0f PF2
	beq $f597                ; $f57f: f0 16
loc_f581:
	cmp #$05                 ; $f581: c9 05 NUSIZ1
	beq $f597                ; $f583: f0 12
loc_f585:
	cmp #$0a                 ; $f585: c9 0a CTRLPF
	beq $f597                ; $f587: f0 0e
loc_f589:
	and #$03                 ; $f589: 29 03 RSYNC
	bne $f5de                ; $f58b: d0 51
loc_f58d:
	lda $f4                  ; $f58d: a5 f4
	cmp #$06                 ; $f58f: c9 06 COLUP0
	bpl $f597                ; $f591: 10 04
loc_f593:
	bit $f8                  ; $f593: 24 f8
	bvc $f5de                ; $f595: 50 47
loc_f597:
	dec $f8                  ; $f597: c6 f8
	lda $f8                  ; $f599: a5 f8
	and #$1e                 ; $f59b: 29 1e ENAM1
	cmp #$1e                 ; $f59d: c9 1e ENAM1
	bne $f5aa                ; $f59f: d0 09
loc_f5a1:
	ldx #$ff                 ; $f5a1: a2 ff
	stx $f7                  ; $f5a3: 86 f7
	inx                      ; $f5a5: e8
	stx $f8                  ; $f5a6: 86 f8
	beq $f612                ; $f5a8: f0 68
loc_f5aa:
	adc $ad                  ; $f5aa: 65 ad
	adc $ba                  ; $f5ac: 65 ba
	adc $b5                  ; $f5ae: 65 b5
	adc $f8                  ; $f5b0: 65 f8
	tay                      ; $f5b2: a8
	lda $f570,y              ; $f5b3: b9 70 f5
	bmi $f5de                ; $f5b6: 30 26
loc_f5b8:
	lda $f7                  ; $f5b8: a5 f7
	lsr                      ; $f5ba: 4a
	lsr                      ; $f5bb: 4a
	tay                      ; $f5bc: a8
	lda $f8                  ; $f5bd: a5 f8
	lsr                      ; $f5bf: 4a
	tya                      ; $f5c0: 98
	bcs $f5c5                ; $f5c1: b0 02
loc_f5c3:
	adc #$20                 ; $f5c3: 69 20 HMP0
loc_f5c5:
	tax                      ; $f5c5: aa
	lda #$13                 ; $f5c6: a9 13 RESM1
	sec                      ; $f5c8: 38
	sbc $f8                  ; $f5c9: e5 f8
	and #$1f                 ; $f5cb: 29 1f ENABL
	asl                      ; $f5cd: 0a
	tay                      ; $f5ce: a8
	txa                      ; $f5cf: 8a
	and #$10                 ; $f5d0: 29 10 RESP0
	beq $f5d5                ; $f5d2: f0 01
loc_f5d4:
	iny                      ; $f5d4: c8
loc_f5d5:
	lda $00ad,y              ; $f5d5: b9 ad 00
	ora $fed0,x              ; $f5d8: 1d d0 fe
	sta $00ad,y              ; $f5db: 99 ad 00
loc_f5de:
	lda $f8                  ; $f5de: a5 f8
	and #$1f                 ; $f5e0: 29 1f ENABL
	tay                      ; $f5e2: a8
	lda $0094,y              ; $f5e3: b9 94 00
	and #$e0                 ; $f5e6: 29 e0
	tax                      ; $f5e8: aa
	lda $a9                  ; $f5e9: a5 a9
	and #$02                 ; $f5eb: 29 02 WSYNC
	bne $f5f0                ; $f5ed: d0 01
loc_f5ef:
	inx                      ; $f5ef: e8
loc_f5f0:
	stx $94,y                ; $f5f0: 96 94
	ldx $f7                  ; $f5f2: a6 f7
	stx $80,y                ; $f5f4: 96 80
	lda $a9                  ; $f5f6: a5 a9
	and #$01                 ; $f5f8: 29 01 VBLANK
	beq $f612                ; $f5fa: f0 16
loc_f5fc:
	bit $a6                  ; $f5fc: 24 a6
	bvs $f612                ; $f5fe: 70 12
loc_f600:
	bit $a5                  ; $f600: 24 a5
	bvs $f612                ; $f602: 70 0e
loc_f604:
	lda $f8                  ; $f604: a5 f8
	eor #$ff                 ; $f606: 49 ff
	sta $18                  ; $f608: 85 18 AUDF1
	lda #$0f                 ; $f60a: a9 0f PF2
	sta $1a                  ; $f60c: 85 1a AUDV1
	lda #$0d                 ; $f60e: a9 0d PF0
	sta $16                  ; $f610: 85 16 AUDC1
loc_f612:
	jmp $f766                ; $f612: 4c 66 f7

; === Block $f615-$f65a (Code) ===
loc_f615:
	bit $f8                  ; $f615: 24 f8
	bmi $f61f                ; $f617: 30 06
loc_f619:
	lda $a9                  ; $f619: a5 a9
	cmp #$29                 ; $f61b: c9 29 RESMP1
	bne $f672                ; $f61d: d0 53
loc_f61f:
	lda $0284                ; $f61f: ad 84 02 INTIM
	cmp #$13                 ; $f622: c9 13 RESM1
	bmi $f65a                ; $f624: 30 34
loc_f626:
	lda $f9                  ; $f626: a5 f9
	cmp #$ff                 ; $f628: c9 ff
	bne $f672                ; $f62a: d0 46
loc_f62c:
	lda $ed                  ; $f62c: a5 ed
	and #$0f                 ; $f62e: 29 0f PF2
	beq $f672                ; $f630: f0 40
loc_f632:
	ldx #$0f                 ; $f632: a2 0f PF2
	lda #$00                 ; $f634: a9 00 VSYNC
	sta $f9                  ; $f636: 85 f9
	lda $c3,x                ; $f638: b5 c3
	lsr                      ; $f63a: 4a
	tay                      ; $f63b: a8
	lda $ff10,y              ; $f63c: b9 10 ff
	adc $f9                  ; $f63f: 65 f9
	sta $f9                  ; $f641: 85 f9
	dex                      ; $f643: ca
	bpl $f638                ; $f644: 10 f2
loc_f646:
	stx $f9                  ; $f646: 86 f9
	cmp #$05                 ; $f648: c9 05 NUSIZ1
	bmi $f65d                ; $f64a: 30 11
loc_f64c:
	cmp #$0a                 ; $f64c: c9 0a CTRLPF
	bpl $f656                ; $f64e: 10 06
loc_f650:
	lda $f4                  ; $f650: a5 f4
	cmp #$12                 ; $f652: c9 12 RESM0
	bpl $f65d                ; $f654: 10 07
loc_f656:
	lda #$7f                 ; $f656: a9 7f
	sta $f8                  ; $f658: 85 f8
loc_f65a:
	jmp $f766                ; $f65a: 4c 66 f7

; === Block $f65d-$f66f (Code) ===
loc_f65d:
	adc $ef                  ; $f65d: 65 ef
	adc $b4                  ; $f65f: 65 b4
	adc $db                  ; $f661: 65 db
	adc $fc                  ; $f663: 65 fc
	and #$1f                 ; $f665: 29 1f ENABL
	asl                      ; $f667: 0a
	asl                      ; $f668: 0a
	sta $f7                  ; $f669: 85 f7
	lda #$13                 ; $f66b: a9 13 RESM1
	sta $f8                  ; $f66d: 85 f8
	jmp $f766                ; $f66f: 4c 66 f7

; === Block $f672-$f678 (Code) ===
loc_f672:
	lda $f9                  ; $f672: a5 f9
	cmp #$ff                 ; $f674: c9 ff
	bne $f67b                ; $f676: d0 03
loc_f678:
	jmp $f703                ; $f678: 4c 03 f7

; === Block $f67b-$f6a9 (Code) ===
loc_f67b:
	bit $fa                  ; $f67b: 24 fa
	bpl $f6ac                ; $f67d: 10 2d
loc_f67f:
	bvc $f683                ; $f67f: 50 02
loc_f681:
	dec $f9                  ; $f681: c6 f9
loc_f683:
	dec $f9                  ; $f683: c6 f9
	bpl $f6b6                ; $f685: 10 2f
loc_f687:
	lda #$ff                 ; $f687: a9 ff
	sta $f9                  ; $f689: 85 f9
	lda #$13                 ; $f68b: a9 13 RESM1
	sec                      ; $f68d: 38
	sbc $fa                  ; $f68e: e5 fa
	and #$1f                 ; $f690: 29 1f ENABL
	asl                      ; $f692: 0a
	tay                      ; $f693: a8
	lda $00ad,y              ; $f694: b9 ad 00
	bne $f69e                ; $f697: d0 05
loc_f699:
	lda $00ae,y              ; $f699: b9 ae 00
	beq $f6a9                ; $f69c: f0 0b
loc_f69e:
	lda $fa                  ; $f69e: a5 fa
	and #$1f                 ; $f6a0: 29 1f ENABL
	tax                      ; $f6a2: aa
	lda $94,x                ; $f6a3: b5 94
	ora #$80                 ; $f6a5: 09 80
	sta $94,x                ; $f6a7: 95 94
loc_f6a9:
	jmp $f766                ; $f6a9: 4c 66 f7

; === Block $f6ac-$f6f8 (Code) ===
loc_f6ac:
	bvc $f6b0                ; $f6ac: 50 02
loc_f6ae:
	inc $f9                  ; $f6ae: e6 f9
loc_f6b0:
	inc $f9                  ; $f6b0: e6 f9
	cmp #$77                 ; $f6b2: c9 77
	bpl $f687                ; $f6b4: 10 d1
loc_f6b6:
	ldx #$0a                 ; $f6b6: a2 0a CTRLPF
	lda $fa                  ; $f6b8: a5 fa
	bpl $f6bd                ; $f6ba: 10 01
loc_f6bc:
	inx                      ; $f6bc: e8
loc_f6bd:
	and #$1f                 ; $f6bd: 29 1f ENABL
	tay                      ; $f6bf: a8
	lda $a9                  ; $f6c0: a5 a9
	and #$08                 ; $f6c2: 29 08 COLUPF
	beq $f6c8                ; $f6c4: f0 02
loc_f6c6:
	inx                      ; $f6c6: e8
	inx                      ; $f6c7: e8
loc_f6c8:
	lda $0094,y              ; $f6c8: b9 94 00
	and #$e0                 ; $f6cb: 29 e0
	sta $0094,y              ; $f6cd: 99 94 00
	txa                      ; $f6d0: 8a
	ora $0094,y              ; $f6d1: 19 94 00
	sta $0094,y              ; $f6d4: 99 94 00
	ldx $f9                  ; $f6d7: a6 f9
	stx $80,y                ; $f6d9: 96 80
	bit $a6                  ; $f6db: 24 a6
	bvs $f6f8                ; $f6dd: 70 19
loc_f6df:
	bit $a6                  ; $f6df: 24 a6
	bvs $f6f8                ; $f6e1: 70 15
loc_f6e3:
	lda $a9                  ; $f6e3: a5 a9
	lsr                      ; $f6e5: 4a
	bcc $f6f8                ; $f6e6: 90 10
loc_f6e8:
	and #$07                 ; $f6e8: 29 07 COLUP1
	tay                      ; $f6ea: a8
	lda $f6fb,y              ; $f6eb: b9 fb f6
	sta $18                  ; $f6ee: 85 18 AUDF1
	lda #$0d                 ; $f6f0: a9 0d PF0
	sta $16                  ; $f6f2: 85 16 AUDC1
	lda #$0f                 ; $f6f4: a9 0f PF2
	sta $1a                  ; $f6f6: 85 1a AUDV1
loc_f6f8:
	jmp $f766                ; $f6f8: 4c 66 f7

; === Block $f6e9-$f6eb (Code) ===
loc_f6e9:
	*slo $a8                 ; $f6e9: 07 a8

; === Block $f703-$f766 (Code) ===
loc_f703:
	lda $a9                  ; $f703: a5 a9
	cmp #$93                 ; $f705: c9 93
	bne $f766                ; $f707: d0 5d
loc_f709:
	lda $ed                  ; $f709: a5 ed
	and #$0f                 ; $f70b: 29 0f PF2
	cmp #$03                 ; $f70d: c9 03 RSYNC
	bmi $f766                ; $f70f: 30 55
loc_f711:
	lda $b1                  ; $f711: a5 b1
	adc $db                  ; $f713: 65 db
	adc $e4                  ; $f715: 65 e4
	adc $fb                  ; $f717: 65 fb
	and #$03                 ; $f719: 29 03 RSYNC
	bne $f766                ; $f71b: d0 49
loc_f71d:
	lda $e5                  ; $f71d: a5 e5
	adc $dd                  ; $f71f: 65 dd
	adc $f6                  ; $f721: 65 f6
	adc $b3                  ; $f723: 65 b3
	and #$1f                 ; $f725: 29 1f ENABL
	tay                      ; $f727: a8
	lda $f4                  ; $f728: a5 f4
	cmp #$02                 ; $f72a: c9 02 WSYNC
	bmi $f735                ; $f72c: 30 07
loc_f72e:
	tya                      ; $f72e: 98
	and #$03                 ; $f72f: 29 03 RSYNC
	beq $f735                ; $f731: f0 02
loc_f733:
	lda #$40                 ; $f733: a9 40 VSYNC
loc_f735:
	ora $f742,y              ; $f735: 19 42 f7
	sta $fa                  ; $f738: 85 fa
	bmi $f762                ; $f73a: 30 26
loc_f73c:
	lda #$00                 ; $f73c: a9 00 VSYNC
	sta $f9                  ; $f73e: 85 f9
	beq $f766                ; $f740: f0 24
loc_f742:
	ora #$8a                 ; $f742: 09 8a
	*anc #$8c                ; $f744: 0b 8c
	ora $0f8e                ; $f746: 0d 8e 0f
	bcc $f75c                ; $f749: 90 11
loc_f74b:
	*jam                     ; $f74b: 92
	*slo ($89),y             ; $f74c: 13 89
	asl                      ; $f74e: 0a
	*xaa #$0c                ; $f74f: 8b 0c REFP1
	ora $0a8e                ; $f751: 0d 8e 0a
	*nop #$0f                ; $f754: 89 0f PF2
	bcc $f6e9                ; $f756: 90 91
loc_f758:
	*jam                     ; $f758: 92
	*sha ($13),y             ; $f759: 93 13 RESM1
	*jam                     ; $f75b: 12
loc_f75c:
	sta ($90),y              ; $f75c: 91 90
	ora #$08                 ; $f75e: 09 08 COLUPF
	txa                      ; $f760: 8a
	*jam                     ; $f761: 12
loc_f762:
	lda #$77                 ; $f762: a9 77
	sta $f9                  ; $f764: 85 f9

; === Block $f766-$f795 (Code) ===
loc_f766:
	lda $a3                  ; $f766: a5 a3
	and #$60                 ; $f768: 29 60 HMP0
	beq $f798                ; $f76a: f0 2c
loc_f76c:
	ldy $f1                  ; $f76c: a4 f1
	lda $ff90,y              ; $f76e: b9 90 ff
	eor #$ff                 ; $f771: 49 ff
	clc                      ; $f773: 18
	adc #$13                 ; $f774: 69 13 RESM1
	tay                      ; $f776: a8
	lda $a9                  ; $f777: a5 a9
	lsr                      ; $f779: 4a
	lsr                      ; $f77a: 4a
	and #$03                 ; $f77b: 29 03 RSYNC
	clc                      ; $f77d: 18
	adc #$10                 ; $f77e: 69 10 RESP0
	sta $0094,y              ; $f780: 99 94 00
	lda $ef                  ; $f783: a5 ef
	sec                      ; $f785: 38
	sbc #$04                 ; $f786: e9 04 NUSIZ0
	bpl $f78c                ; $f788: 10 02
loc_f78a:
	lda #$00                 ; $f78a: a9 00 VSYNC
loc_f78c:
	sta $0080,y              ; $f78c: 99 80 00
	lda #$61                 ; $f78f: a9 61 HMP1
	sta $d9                  ; $f791: 85 d9
	sta $da                  ; $f793: 85 da
	jmp $fff2                ; $f795: 4c f2 ff

; === Block $f798-$f79c (Code) ===
loc_f798:
	bit $a6                  ; $f798: 24 a6
	bvc $f79f                ; $f79a: 50 03
loc_f79c:
	jmp $f837                ; $f79c: 4c 37 f8

; === Block $f79f-$f801 (Code) ===
loc_f79f:
	lda $0280                ; $f79f: ad 80 02 SWCHA
	asl                      ; $f7a2: 0a
	asl                      ; $f7a3: 0a
	bpl $f7b5                ; $f7a4: 10 0f
loc_f7a6:
	asl                      ; $f7a6: 0a
	bmi $f7bf                ; $f7a7: 30 16
loc_f7a9:
	dec $f1                  ; $f7a9: c6 f1
	lda $f1                  ; $f7ab: a5 f1
	cmp #$2d                 ; $f7ad: c9 2d
	bne $f7bf                ; $f7af: d0 0e
loc_f7b1:
	inc $f1                  ; $f7b1: e6 f1
	bne $f7bf                ; $f7b3: d0 0a
loc_f7b5:
	inc $f1                  ; $f7b5: e6 f1
	lda $f1                  ; $f7b7: a5 f1
	cmp #$39                 ; $f7b9: c9 39
	bne $f7bf                ; $f7bb: d0 02
loc_f7bd:
	dec $f1                  ; $f7bd: c6 f1
loc_f7bf:
	lda $0280                ; $f7bf: ad 80 02 SWCHA
	bpl $f804                ; $f7c2: 10 40
loc_f7c4:
	asl                      ; $f7c4: 0a
	bpl $f7dd                ; $f7c5: 10 16
loc_f7c7:
	lda $ef                  ; $f7c7: a5 ef
	and #$03                 ; $f7c9: 29 03 RSYNC
	beq $f7d7                ; $f7cb: f0 0a
loc_f7cd:
	lda $fe                  ; $f7cd: a5 fe
	and #$c0                 ; $f7cf: 29 c0
	sta $fe                  ; $f7d1: 85 fe
	bmi $f7f1                ; $f7d3: 30 1c
loc_f7d5:
	bpl $f81a                ; $f7d5: 10 43
loc_f7d7:
	lda #$00                 ; $f7d7: a9 00 VSYNC
	sta $fe                  ; $f7d9: 85 fe
	beq $f825                ; $f7db: f0 48
loc_f7dd:
	lda $a9                  ; $f7dd: a5 a9
	and #$07                 ; $f7df: 29 07 COLUP1
	bne $f7f3                ; $f7e1: d0 10
loc_f7e3:
	lda $fe                  ; $f7e3: a5 fe
	bmi $f7eb                ; $f7e5: 30 04
loc_f7e7:
	lda #$80                 ; $f7e7: a9 80
	sta $fe                  ; $f7e9: 85 fe
loc_f7eb:
	and #$3f                 ; $f7eb: 29 3f
	cmp #$03                 ; $f7ed: c9 03 RSYNC
	beq $f7f3                ; $f7ef: f0 02
loc_f7f1:
	inc $fe                  ; $f7f1: e6 fe
loc_f7f3:
	lda $fe                  ; $f7f3: a5 fe
	and #$3f                 ; $f7f5: 29 3f
	eor #$ff                 ; $f7f7: 49 ff
	clc                      ; $f7f9: 18
	adc #$01                 ; $f7fa: 69 01 VBLANK
	clc                      ; $f7fc: 18
	adc $ef                  ; $f7fd: 65 ef
	sta $ef                  ; $f7ff: 85 ef
	jmp $f825                ; $f801: 4c 25 f8

; === Block $f804-$f837 (Code) ===
loc_f804:
	lda $a9                  ; $f804: a5 a9
	and #$07                 ; $f806: 29 07 COLUP1
	bne $f81c                ; $f808: d0 12
loc_f80a:
	lda $fe                  ; $f80a: a5 fe
	bit $fe                  ; $f80c: 24 fe
	bvs $f814                ; $f80e: 70 04
loc_f810:
	lda #$40                 ; $f810: a9 40 VSYNC
	sta $fe                  ; $f812: 85 fe
loc_f814:
	and #$3f                 ; $f814: 29 3f
	cmp #$03                 ; $f816: c9 03 RSYNC
	beq $f81c                ; $f818: f0 02
loc_f81a:
	inc $fe                  ; $f81a: e6 fe
loc_f81c:
	lda $fe                  ; $f81c: a5 fe
	and #$3f                 ; $f81e: 29 3f
	clc                      ; $f820: 18
	adc $ef                  ; $f821: 65 ef
	sta $ef                  ; $f823: 85 ef
loc_f825:
	lda $ef                  ; $f825: a5 ef
	bpl $f82d                ; $f827: 10 04
loc_f829:
	lda #$00                 ; $f829: a9 00 VSYNC
	sta $ef                  ; $f82b: 85 ef
loc_f82d:
	cmp #$7d                 ; $f82d: c9 7d
	bmi $f890                ; $f82f: 30 5f
loc_f831:
	lda #$7c                 ; $f831: a9 7c
	sta $ef                  ; $f833: 85 ef
	bne $f890                ; $f835: d0 59

; === Block $f837-$f873 (Code) ===
loc_f837:
	lda $a9                  ; $f837: a5 a9
	bpl $f88a                ; $f839: 10 4f
loc_f83b:
	and #$01                 ; $f83b: 29 01 VBLANK
	bne $f865                ; $f83d: d0 26
loc_f83f:
	bit $fe                  ; $f83f: 24 fe
	bpl $f855                ; $f841: 10 12
loc_f843:
	lda $f1                  ; $f843: a5 f1
	cmp #$38                 ; $f845: c9 38
	bne $f851                ; $f847: d0 08
loc_f849:
	lda $fe                  ; $f849: a5 fe
	eor #$80                 ; $f84b: 49 80
	sta $fe                  ; $f84d: 85 fe
	bpl $f865                ; $f84f: 10 14
loc_f851:
	inc $f1                  ; $f851: e6 f1
	bne $f865                ; $f853: d0 10
loc_f855:
	lda $f1                  ; $f855: a5 f1
	cmp #$2c                 ; $f857: c9 2c CXCLR
	bne $f863                ; $f859: d0 08
loc_f85b:
	lda $fe                  ; $f85b: a5 fe
	eor #$80                 ; $f85d: 49 80
	sta $fe                  ; $f85f: 85 fe
	bmi $f865                ; $f861: 30 02
loc_f863:
	dec $f1                  ; $f863: c6 f1
loc_f865:
	bit $fe                  ; $f865: 24 fe
	bvc $f87a                ; $f867: 50 11
loc_f869:
	lda $ef                  ; $f869: a5 ef
	bne $f876                ; $f86b: d0 09
loc_f86d:
	lda $fe                  ; $f86d: a5 fe
	eor #$40                 ; $f86f: 49 40 VSYNC
	sta $fe                  ; $f871: 85 fe
	jmp $f88a                ; $f873: 4c 8a f8

; === Block $f876-$f87a (Code) ===
loc_f876:
	dec $ef                  ; $f876: c6 ef
	bpl $f88a                ; $f878: 10 10

; === Block $f87a-$f88a (Code) ===
loc_f87a:
	lda $ef                  ; $f87a: a5 ef
	cmp #$7c                 ; $f87c: c9 7c
	bne $f888                ; $f87e: d0 08
loc_f880:
	lda $fe                  ; $f880: a5 fe
	eor #$40                 ; $f882: 49 40 VSYNC
	sta $fe                  ; $f884: 85 fe
	bne $f88a                ; $f886: d0 02
loc_f888:
	inc $ef                  ; $f888: e6 ef

; === Block $f88a-$f8a9 (Code) ===
loc_f88a:
	lda $f0                  ; $f88a: a5 f0
	bne $f8a7                ; $f88c: d0 19
loc_f88e:
	beq $f898                ; $f88e: f0 08
loc_f890:
	lda $f0                  ; $f890: a5 f0
	bne $f8a7                ; $f892: d0 13
loc_f894:
	lda $3c                  ; $f894: a5 3c
	bmi $f8a9                ; $f896: 30 11
loc_f898:
	ldx $ef                  ; $f898: a6 ef
	inx                      ; $f89a: e8
	stx $ee                  ; $f89b: 86 ee
	ldx $f1                  ; $f89d: a6 f1
	lda $ff90,x              ; $f89f: bd 90 ff
	clc                      ; $f8a2: 18
	adc #$02                 ; $f8a3: 69 02 WSYNC
	sta $f0                  ; $f8a5: 85 f0
loc_f8a7:
	dec $f0                  ; $f8a7: c6 f0

; === Block $f8a9-$f8c4 (Code) ===
loc_f8a9:
	lda $f0                  ; $f8a9: a5 f0
	beq $f8b3                ; $f8ab: f0 06
loc_f8ad:
	asl                      ; $f8ad: 0a
	adc $f0                  ; $f8ae: 65 f0
	sec                      ; $f8b0: 38
	sbc #$02                 ; $f8b1: e9 02 WSYNC
loc_f8b3:
	sta $d9                  ; $f8b3: 85 d9
	lda $f1                  ; $f8b5: a5 f1
	sec                      ; $f8b7: 38
	sbc $d9                  ; $f8b8: e5 d9
	sta $da                  ; $f8ba: 85 da
	lda $d9                  ; $f8bc: a5 d9
	bne $f8c4                ; $f8be: d0 04
loc_f8c0:
	dec $d9                  ; $f8c0: c6 d9
	inc $da                  ; $f8c2: e6 da
loc_f8c4:
	jmp $fff2                ; $f8c4: 4c f2 ff

; === Block $f8c7-$f8d0 (Code) ===
loc_f8c7:
	ldx #$3c                 ; $f8c7: a2 3c
	stx $0296                ; $f8c9: 8e 96 02 TIM64T
	bit $a4                  ; $f8cc: 24 a4
	bvc $f8d3                ; $f8ce: 50 03
loc_f8d0:
	jmp $fe1f                ; $f8d0: 4c 1f fe

; === Block $f8d3-$f921 (Code) ===
loc_f8d3:
	lda $9d                  ; $f8d3: a5 9d
	and #$20                 ; $f8d5: 29 20 HMP0
	beq $f91b                ; $f8d7: f0 42
loc_f8d9:
	lda $a9                  ; $f8d9: a5 a9
	ldx $f4                  ; $f8db: a6 f4
	cpx #$10                 ; $f8dd: e0 10 RESP0
	bmi $f8e5                ; $f8df: 30 04
loc_f8e1:
	and #$3f                 ; $f8e1: 29 3f
	bpl $f8ed                ; $f8e3: 10 08
loc_f8e5:
	cpx #$04                 ; $f8e5: e0 04 NUSIZ0
	bmi $f8ed                ; $f8e7: 30 04
loc_f8e9:
	and #$7f                 ; $f8e9: 29 7f
	bpl $f8ed                ; $f8eb: 10 00
loc_f8ed:
	cmp #$0d                 ; $f8ed: c9 0d PF0
	bne $f91b                ; $f8ef: d0 2a
loc_f8f1:
	ldx $f2                  ; $f8f1: a6 f2
	cpx #$08                 ; $f8f3: e0 08 COLUPF
	beq $f91b                ; $f8f5: f0 24
loc_f8f7:
	inx                      ; $f8f7: e8
	stx $f2                  ; $f8f8: 86 f2
	lda $ef                  ; $f8fa: a5 ef
	adc $fb                  ; $f8fc: 65 fb
	lsr                      ; $f8fe: 4a
	bcc $f90b                ; $f8ff: 90 0a
loc_f901:
	lda #$00                 ; $f901: a9 00 VSYNC
	sta $e4,x                ; $f903: 95 e4
	lda #$26                 ; $f905: a9 26 VDELP1
	sta $db,x                ; $f907: 95 db
	bne $f913                ; $f909: d0 08
loc_f90b:
	lda #$7c                 ; $f90b: a9 7c
	sta $e4,x                ; $f90d: 95 e4
	lda #$06                 ; $f90f: a9 06 COLUP0
	sta $db,x                ; $f911: 95 db
loc_f913:
	lda $94,x                ; $f913: b5 94
	and #$df                 ; $f915: 29 df
	ora #$40                 ; $f917: 09 40 VSYNC
	sta $94,x                ; $f919: 95 94
loc_f91b:
	ldx #$00                 ; $f91b: a2 00 VSYNC
	lda $f0                  ; $f91d: a5 f0
	bne $f924                ; $f91f: d0 03
loc_f921:
	jmp $fc10                ; $f921: 4c 10 fc

; === Block $f924-$f940 (Code) ===
loc_f924:
	lda #$ff                 ; $f924: a9 ff
	sta $d6                  ; $f926: 85 d6
	lda #$14                 ; $f928: a9 14 RESBL
	sec                      ; $f92a: 38
	sbc $f0                  ; $f92b: e5 f0
	sta $ac                  ; $f92d: 85 ac
	lda $ee                  ; $f92f: a5 ee
	sec                      ; $f931: 38
	sbc $e4,x                ; $f932: f5 e4
	cmp #$04                 ; $f934: c9 04 NUSIZ0
	bcs $f93c                ; $f936: b0 04
loc_f938:
	cmp #$00                 ; $f938: c9 00 VSYNC
	bcs $f946                ; $f93a: b0 0a
loc_f93c:
	cpx $f2                  ; $f93c: e4 f2
	bne $f943                ; $f93e: d0 03
loc_f940:
	jmp $f9df                ; $f940: 4c df f9

; === Block $f943-$f946 (Code) ===
loc_f943:
	inx                      ; $f943: e8
	bpl $f92f                ; $f944: 10 e9

; === Block $f946-$f9dc (Code) ===
loc_f946:
	lda $db,x                ; $f946: b5 db
	and #$1f                 ; $f948: 29 1f ENABL
	cmp $ac                  ; $f94a: c5 ac
	bne $f93c                ; $f94c: d0 ee
loc_f94e:
	dec $f2                  ; $f94e: c6 f2
	ldy $e4,x                ; $f950: b4 e4
	lda $db,x                ; $f952: b5 db
	sta $ab                  ; $f954: 85 ab
	stx $d6                  ; $f956: 86 d6
	cpx $f2                  ; $f958: e4 f2
	bmi $f95e                ; $f95a: 30 02
loc_f95c:
	bne $f993                ; $f95c: d0 35
loc_f95e:
	lda $dc,x                ; $f95e: b5 dc
	and #$7f                 ; $f960: 29 7f
	sta $db,x                ; $f962: 95 db
	lda $e5,x                ; $f964: b5 e5
	sta $e4,x                ; $f966: 95 e4
	lda $95,x                ; $f968: b5 95
	and #$60                 ; $f96a: 29 60 HMP0
	sta $d3                  ; $f96c: 85 d3
	lda $94,x                ; $f96e: b5 94
	and #$9f                 ; $f970: 29 9f
	ora $d3                  ; $f972: 05 d3
	sta $94,x                ; $f974: 95 94
	cpx $f2                  ; $f976: e4 f2
	beq $f993                ; $f978: f0 19
loc_f97a:
	inx                      ; $f97a: e8
	lda $dc,x                ; $f97b: b5 dc
	sta $db,x                ; $f97d: 95 db
	lda $e5,x                ; $f97f: b5 e5
	sta $e4,x                ; $f981: 95 e4
	lda $95,x                ; $f983: b5 95
	and #$60                 ; $f985: 29 60 HMP0
	sta $d3                  ; $f987: 85 d3
	lda $94,x                ; $f989: b5 94
	and #$9f                 ; $f98b: 29 9f
	ora $d3                  ; $f98d: 05 d3
	sta $94,x                ; $f98f: 95 94
	bpl $f976                ; $f991: 10 e3
loc_f993:
	bit $a6                  ; $f993: 24 a6
	bvs $f9d4                ; $f995: 70 3d
loc_f997:
	bit $ab                  ; $f997: 24 ab
	sed                      ; $f999: f8
	clc                      ; $f99a: 18
	bmi $f9c4                ; $f99b: 30 27
loc_f99d:
	lda #$01                 ; $f99d: a9 01 VBLANK
	adc $f5                  ; $f99f: 65 f5
	sta $f5                  ; $f9a1: 85 f5
	bcc $f9ce                ; $f9a3: 90 29
loc_f9a5:
	lda #$00                 ; $f9a5: a9 00 VSYNC
	adc $f4                  ; $f9a7: 65 f4
	sta $f4                  ; $f9a9: 85 f4
	cld                      ; $f9ab: d8
	lda $ed                  ; $f9ac: a5 ed
	cmp #$70                 ; $f9ae: c9 70
	bpl $f9ce                ; $f9b0: 10 1c
loc_f9b2:
	adc #$10                 ; $f9b2: 69 10 RESP0
	sta $ed                  ; $f9b4: 85 ed
	lda $a5                  ; $f9b6: a5 a5
	ora #$20                 ; $f9b8: 09 20 HMP0
	sta $a5                  ; $f9ba: 85 a5
	lda $a9                  ; $f9bc: a5 a9
	and #$0f                 ; $f9be: 29 0f PF2
	sta $a9                  ; $f9c0: 85 a9
	bpl $f9ce                ; $f9c2: 10 0a
loc_f9c4:
	lda #$0a                 ; $f9c4: a9 0a CTRLPF
	adc $f6                  ; $f9c6: 65 f6
	sta $f6                  ; $f9c8: 85 f6
	lda #$00                 ; $f9ca: a9 00 VSYNC
	beq $f99f                ; $f9cc: f0 d1
loc_f9ce:
	lda $fd                  ; $f9ce: a5 fd
	ora #$04                 ; $f9d0: 09 04 NUSIZ0
	sta $fd                  ; $f9d2: 85 fd
loc_f9d4:
	cld                      ; $f9d4: d8
	ldx $d6                  ; $f9d5: a6 d6
	dex                      ; $f9d7: ca
	cpx $f2                  ; $f9d8: e4 f2
	bpl $f9e3                ; $f9da: 10 07
loc_f9dc:
	jmp $f943                ; $f9dc: 4c 43 f9

; === Block $f9df-$fa20 (Code) ===
loc_f9df:
	ldx $d6                  ; $f9df: a6 d6
	bmi $fa26                ; $f9e1: 30 43
loc_f9e3:
	lda $f0                  ; $f9e3: a5 f0
	lsr                      ; $f9e5: 4a
	tya                      ; $f9e6: 98
	bcc $f9eb                ; $f9e7: 90 02
loc_f9e9:
	sbc #$04                 ; $f9e9: e9 04 NUSIZ0
loc_f9eb:
	tay                      ; $f9eb: a8
	lda $ab                  ; $f9ec: a5 ab
	and #$20                 ; $f9ee: 29 20 HMP0
	bne $f9f7                ; $f9f0: d0 05
loc_f9f2:
	tya                      ; $f9f2: 98
	clc                      ; $f9f3: 18
	adc #$07                 ; $f9f4: 69 07 COLUP1
	tay                      ; $f9f6: a8
loc_f9f7:
	tya                      ; $f9f7: 98
	lsr                      ; $f9f8: 4a
	lsr                      ; $f9f9: 4a
	lsr                      ; $f9fa: 4a
	asl                      ; $f9fb: 0a
	tay                      ; $f9fc: a8
	lda $f0                  ; $f9fd: a5 f0
	lsr                      ; $f9ff: 4a
	tya                      ; $fa00: 98
	bcs $fa05                ; $fa01: b0 02
loc_fa03:
	adc #$1f                 ; $fa03: 69 1f ENABL
loc_fa05:
	tax                      ; $fa05: aa
	inx                      ; $fa06: e8
	cmp #$3f                 ; $fa07: c9 3f
	bmi $fa0d                ; $fa09: 30 02
loc_fa0b:
	ldx #$3f                 ; $fa0b: a2 3f
loc_fa0d:
	lda $f0                  ; $fa0d: a5 f0
	sec                      ; $fa0f: 38
	sbc #$01                 ; $fa10: e9 01 VBLANK
	asl                      ; $fa12: 0a
	tay                      ; $fa13: a8
	txa                      ; $fa14: 8a
	and #$10                 ; $fa15: 29 10 RESP0
	beq $fa1a                ; $fa17: f0 01
loc_fa19:
	iny                      ; $fa19: c8
loc_fa1a:
	lda $00ad,y              ; $fa1a: b9 ad 00
	ora $fed0,x              ; $fa1d: 1d d0 fe
	jmp $fbe8                ; $fa20: 4c e8 fb

; === Block $fa23-$fa23 (Code) ===
loc_fa23:
	jmp $fac0                ; $fa23: 4c c0 fa

; === Block $fa26-$fa3b (Code) ===
loc_fa26:
	bit $fd                  ; $fa26: 24 fd
	bvs $fa23                ; $fa28: 70 f9
loc_fa2a:
	bmi $fa23                ; $fa2a: 30 f7
loc_fa2c:
	lda $fc                  ; $fa2c: a5 fc
	cmp #$ff                 ; $fa2e: c9 ff
	beq $fa23                ; $fa30: f0 f1
loc_fa32:
	lda $ee                  ; $fa32: a5 ee
	sec                      ; $fa34: 38
	sbc $fb                  ; $fa35: e5 fb
	cmp #$09                 ; $fa37: c9 09 COLUBK
	bcc $fa3e                ; $fa39: 90 03
loc_fa3b:
	jmp $fac0                ; $fa3b: 4c c0 fa

; === Block $fa3e-$fa9d (Code) ===
loc_fa3e:
	cmp #$ff                 ; $fa3e: c9 ff
	bmi $fac0                ; $fa40: 30 7e
loc_fa42:
	lda $fc                  ; $fa42: a5 fc
	and #$1f                 ; $fa44: 29 1f ENABL
	cmp $ac                  ; $fa46: c5 ac
	beq $fa51                ; $fa48: f0 07
loc_fa4a:
	sec                      ; $fa4a: 38
	sbc #$01                 ; $fa4b: e9 01 VBLANK
	cmp $ac                  ; $fa4d: c5 ac
	bne $fac0                ; $fa4f: d0 6f
loc_fa51:
	lda #$13                 ; $fa51: a9 13 RESM1
	sec                      ; $fa53: 38
	sbc $fc                  ; $fa54: e5 fc
	and #$1f                 ; $fa56: 29 1f ENABL
	sta $ac                  ; $fa58: 85 ac
	asl                      ; $fa5a: 0a
	clc                      ; $fa5b: 18
	adc $ac                  ; $fa5c: 65 ac
	sec                      ; $fa5e: 38
	sbc $f1                  ; $fa5f: e5 f1
	bpl $fa65                ; $fa61: 10 02
loc_fa63:
	eor #$ff                 ; $fa63: 49 ff
loc_fa65:
	tax                      ; $fa65: aa
	lda $faa0,x              ; $fa66: bd a0 fa
	tay                      ; $fa69: a8
	bit $a6                  ; $fa6a: 24 a6
	bvs $fa93                ; $fa6c: 70 25
loc_fa6e:
	sed                      ; $fa6e: f8
	clc                      ; $fa6f: 18
	adc $f5                  ; $fa70: 65 f5
	sta $f5                  ; $fa72: 85 f5
	bcc $fa93                ; $fa74: 90 1d
loc_fa76:
	lda #$00                 ; $fa76: a9 00 VSYNC
	adc $f4                  ; $fa78: 65 f4
	sta $f4                  ; $fa7a: 85 f4
	cld                      ; $fa7c: d8
	lda $ed                  ; $fa7d: a5 ed
	cmp #$70                 ; $fa7f: c9 70
	bpl $fa93                ; $fa81: 10 10
loc_fa83:
	adc #$10                 ; $fa83: 69 10 RESP0
	sta $ed                  ; $fa85: 85 ed
	lda $a5                  ; $fa87: a5 a5
	ora #$20                 ; $fa89: 09 20 HMP0
	sta $a5                  ; $fa8b: 85 a5
	lda $a9                  ; $fa8d: a5 a9
	and #$0f                 ; $fa8f: 29 0f PF2
	sta $a9                  ; $fa91: 85 a9
loc_fa93:
	cld                      ; $fa93: d8
	tya                      ; $fa94: 98
	lsr                      ; $fa95: 4a
	lsr                      ; $fa96: 4a
	tay                      ; $fa97: a8
	lda $fabd,y              ; $fa98: b9 bd fa
	sta $fd                  ; $fa9b: 85 fd
	jmp $fc0a                ; $fa9d: 4c 0a fc

; === Block $fac0-$fb1e (Code) ===
loc_fac0:
	lda $f7                  ; $fac0: a5 f7
	bmi $fb21                ; $fac2: 30 5d
loc_fac4:
	lda $ee                  ; $fac4: a5 ee
	sec                      ; $fac6: 38
	sbc $f7                  ; $fac7: e5 f7
	cmp #$04                 ; $fac9: c9 04 NUSIZ0
	bcs $fb21                ; $facb: b0 54
loc_facd:
	cmp #$00                 ; $facd: c9 00 VSYNC
	bcc $fb21                ; $facf: 90 50
loc_fad1:
	lda $f8                  ; $fad1: a5 f8
	and #$1f                 ; $fad3: 29 1f ENABL
	cmp $ac                  ; $fad5: c5 ac
	beq $fae0                ; $fad7: f0 07
loc_fad9:
	sec                      ; $fad9: 38
	sbc #$01                 ; $fada: e9 01 VBLANK
	cmp $ac                  ; $fadc: c5 ac
	bne $fb21                ; $fade: d0 41
loc_fae0:
	bit $f8                  ; $fae0: 24 f8
	bvs $faec                ; $fae2: 70 08
loc_fae4:
	lda $f8                  ; $fae4: a5 f8
	ora #$40                 ; $fae6: 09 40 VSYNC
	sta $f8                  ; $fae8: 85 f8
	bne $fb21                ; $faea: d0 35
loc_faec:
	bit $a6                  ; $faec: 24 a6
	bvs $fb17                ; $faee: 70 27
loc_faf0:
	lda #$02                 ; $faf0: a9 02 WSYNC
	clc                      ; $faf2: 18
	sed                      ; $faf3: f8
	adc $f5                  ; $faf4: 65 f5
	sta $f5                  ; $faf6: 85 f5
	bcc $fb17                ; $faf8: 90 1d
loc_fafa:
	lda #$00                 ; $fafa: a9 00 VSYNC
	adc $f4                  ; $fafc: 65 f4
	sta $f4                  ; $fafe: 85 f4
	cld                      ; $fb00: d8
	lda $ed                  ; $fb01: a5 ed
	cmp #$70                 ; $fb03: c9 70
	bpl $fb17                ; $fb05: 10 10
loc_fb07:
	adc #$10                 ; $fb07: 69 10 RESP0
	sta $ed                  ; $fb09: 85 ed
	lda $a5                  ; $fb0b: a5 a5
	ora #$20                 ; $fb0d: 09 20 HMP0
	sta $a5                  ; $fb0f: 85 a5
	lda $a9                  ; $fb11: a5 a9
	and #$0f                 ; $fb13: 29 0f PF2
	sta $a9                  ; $fb15: 85 a9
loc_fb17:
	cld                      ; $fb17: d8
	ldy #$ff                 ; $fb18: a0 ff
	sty $f7                  ; $fb1a: 84 f7
	sty $f8                  ; $fb1c: 84 f8
	jmp $fc10                ; $fb1e: 4c 10 fc

; === Block $fb21-$fb70 (Code) ===
loc_fb21:
	bit $f9                  ; $fb21: 24 f9
	bmi $fb73                ; $fb23: 30 4e
loc_fb25:
	lda $ee                  ; $fb25: a5 ee
	sec                      ; $fb27: 38
	sbc $f9                  ; $fb28: e5 f9
	cmp #$08                 ; $fb2a: c9 08 COLUPF
	bcs $fb73                ; $fb2c: b0 45
loc_fb2e:
	cmp #$00                 ; $fb2e: c9 00 VSYNC
	bcc $fb73                ; $fb30: 90 41
loc_fb32:
	lda $fa                  ; $fb32: a5 fa
	and #$1f                 ; $fb34: 29 1f ENABL
	cmp $ac                  ; $fb36: c5 ac
	bne $fb73                ; $fb38: d0 39
loc_fb3a:
	bit $a6                  ; $fb3a: 24 a6
	bvs $fb6b                ; $fb3c: 70 2d
loc_fb3e:
	lda #$0a                 ; $fb3e: a9 0a CTRLPF
	clc                      ; $fb40: 18
	sed                      ; $fb41: f8
	adc $f5                  ; $fb42: 65 f5
	sta $f5                  ; $fb44: 85 f5
	bcc $fb65                ; $fb46: 90 1d
loc_fb48:
	lda #$00                 ; $fb48: a9 00 VSYNC
	adc $f4                  ; $fb4a: 65 f4
	sta $f4                  ; $fb4c: 85 f4
	cld                      ; $fb4e: d8
	lda $ed                  ; $fb4f: a5 ed
	cmp #$70                 ; $fb51: c9 70
	bpl $fb65                ; $fb53: 10 10
loc_fb55:
	adc #$10                 ; $fb55: 69 10 RESP0
	sta $ed                  ; $fb57: 85 ed
	lda $a5                  ; $fb59: a5 a5
	ora #$20                 ; $fb5b: 09 20 HMP0
	sta $a5                  ; $fb5d: 85 a5
	lda $a9                  ; $fb5f: a5 a9
	and #$0f                 ; $fb61: 29 0f PF2
	sta $a9                  ; $fb63: 85 a9
loc_fb65:
	lda $fd                  ; $fb65: a5 fd
	ora #$04                 ; $fb67: 09 04 NUSIZ0
	sta $fd                  ; $fb69: 85 fd
loc_fb6b:
	cld                      ; $fb6b: d8
	ldy #$ff                 ; $fb6c: a0 ff
	sty $f9                  ; $fb6e: 84 f9
	jmp $fc0a                ; $fb70: 4c 0a fc

; === Block $fb73-$fbe8 (Code) ===
loc_fb73:
	lda $ee                  ; $fb73: a5 ee
	lsr                      ; $fb75: 4a
	lsr                      ; $fb76: 4a
	tay                      ; $fb77: a8
	lda $f0                  ; $fb78: a5 f0
	lsr                      ; $fb7a: 4a
	tya                      ; $fb7b: 98
	bcs $fb80                ; $fb7c: b0 02
loc_fb7e:
	adc #$20                 ; $fb7e: 69 20 HMP0
loc_fb80:
	tax                      ; $fb80: aa
	lda $f0                  ; $fb81: a5 f0
	sec                      ; $fb83: 38
	sbc #$01                 ; $fb84: e9 01 VBLANK
	asl                      ; $fb86: 0a
	tay                      ; $fb87: a8
	txa                      ; $fb88: 8a
	and #$10                 ; $fb89: 29 10 RESP0
	beq $fb8e                ; $fb8b: f0 01
loc_fb8d:
	iny                      ; $fb8d: c8
loc_fb8e:
	lda $00ad,y              ; $fb8e: b9 ad 00
	and $fed0,x              ; $fb91: 3d d0 fe
	beq $fc10                ; $fb94: f0 7a
loc_fb96:
	cpx $f3                  ; $fb96: e4 f3
	beq $fba5                ; $fb98: f0 0b
loc_fb9a:
	txa                      ; $fb9a: 8a
	ora #$80                 ; $fb9b: 09 80
	cmp $f3                  ; $fb9d: c5 f3
	beq $fbac                ; $fb9f: f0 0b
loc_fba1:
	stx $f3                  ; $fba1: 86 f3
	bne $fc0a                ; $fba3: d0 65
loc_fba5:
	txa                      ; $fba5: 8a
	ora #$80                 ; $fba6: 09 80
	sta $f3                  ; $fba8: 85 f3
	bne $fc0a                ; $fbaa: d0 5e
loc_fbac:
	lda #$ff                 ; $fbac: a9 ff
	sta $f3                  ; $fbae: 85 f3
	bit $a6                  ; $fbb0: 24 a6
	bvs $fbe1                ; $fbb2: 70 2d
loc_fbb4:
	sed                      ; $fbb4: f8
	lda #$01                 ; $fbb5: a9 01 VBLANK
	clc                      ; $fbb7: 18
	adc $f6                  ; $fbb8: 65 f6
	sta $f6                  ; $fbba: 85 f6
	lda #$00                 ; $fbbc: a9 00 VSYNC
	adc $f5                  ; $fbbe: 65 f5
	sta $f5                  ; $fbc0: 85 f5
	bcc $fbe1                ; $fbc2: 90 1d
loc_fbc4:
	lda #$00                 ; $fbc4: a9 00 VSYNC
	adc $f4                  ; $fbc6: 65 f4
	sta $f4                  ; $fbc8: 85 f4
	cld                      ; $fbca: d8
	lda $ed                  ; $fbcb: a5 ed
	cmp #$70                 ; $fbcd: c9 70
	bpl $fbe1                ; $fbcf: 10 10
loc_fbd1:
	adc #$10                 ; $fbd1: 69 10 RESP0
	sta $ed                  ; $fbd3: 85 ed
	lda $a5                  ; $fbd5: a5 a5
	ora #$20                 ; $fbd7: 09 20 HMP0
	sta $a5                  ; $fbd9: 85 a5
	lda $a9                  ; $fbdb: a5 a9
	and #$0f                 ; $fbdd: 29 0f PF2
	sta $a9                  ; $fbdf: 85 a9
loc_fbe1:
	cld                      ; $fbe1: d8
	lda $00ad,y              ; $fbe2: b9 ad 00
	eor $fed0,x              ; $fbe5: 5d d0 fe

; === Block $fbe8-$fc10 (Code) ===
loc_fbe8:
	sta $00ad,y              ; $fbe8: 99 ad 00
	bne $fc0a                ; $fbeb: d0 1d
loc_fbed:
	tya                      ; $fbed: 98
	lsr                      ; $fbee: 4a
	bcc $fc07                ; $fbef: 90 16
loc_fbf1:
	dey                      ; $fbf1: 88
	ldx $ad,y                ; $fbf2: b6 ad
	bne $fc0a                ; $fbf4: d0 14
loc_fbf6:
	sec                      ; $fbf6: 38
	sbc #$13                 ; $fbf7: e9 13 RESM1
	eor #$ff                 ; $fbf9: 49 ff
	clc                      ; $fbfb: 18
	adc #$01                 ; $fbfc: 69 01 VBLANK
	tax                      ; $fbfe: aa
	lda $94,x                ; $fbff: b5 94
	and #$7f                 ; $fc01: 29 7f
	sta $94,x                ; $fc03: 95 94
	bpl $fc0a                ; $fc05: 10 03
loc_fc07:
	iny                      ; $fc07: c8
	bcc $fbf2                ; $fc08: 90 e8
loc_fc0a:
	lda #$00                 ; $fc0a: a9 00 VSYNC
	sta $19                  ; $fc0c: 85 19 AUDV0
	sta $f0                  ; $fc0e: 85 f0

; === Block $fc10-$fc14 (Code) ===
loc_fc10:
	lda $f2                  ; $fc10: a5 f2
	bpl $fc17                ; $fc12: 10 03
loc_fc14:
	jmp $fe1f                ; $fc14: 4c 1f fe

; === Block $fc17-$fc50 (Code) ===
loc_fc17:
	ldx #$00                 ; $fc17: a2 00 VSYNC
	lda #$3a                 ; $fc19: a9 3a
	sec                      ; $fc1b: 38
	sbc $f1                  ; $fc1c: e5 f1
	tay                      ; $fc1e: a8
	lda $ff90,y              ; $fc1f: b9 90 ff
	sta $ac                  ; $fc22: 85 ac
	lda $a3                  ; $fc24: a5 a3
	and #$60                 ; $fc26: 29 60 HMP0
	bne $fc53                ; $fc28: d0 29
loc_fc2a:
	lda $ef                  ; $fc2a: a5 ef
	sec                      ; $fc2c: 38
	sbc $e4,x                ; $fc2d: f5 e4
	cmp #$04                 ; $fc2f: c9 04 NUSIZ0
	bcs $fc37                ; $fc31: b0 04
loc_fc33:
	cmp #$fd                 ; $fc33: c9 fd
	bpl $fc3e                ; $fc35: 10 07
loc_fc37:
	cpx $f2                  ; $fc37: e4 f2
	beq $fc53                ; $fc39: f0 18
loc_fc3b:
	inx                      ; $fc3b: e8
	bne $fc24                ; $fc3c: d0 e6
loc_fc3e:
	lda $db,x                ; $fc3e: b5 db
	and #$1f                 ; $fc40: 29 1f ENABL
	cmp $ac                  ; $fc42: c5 ac
	bne $fc37                ; $fc44: d0 f1
loc_fc46:
	lda #$20                 ; $fc46: a9 20 HMP0
	ora $a3                  ; $fc48: 05 a3
	sta $a3                  ; $fc4a: 85 a3
	lda #$00                 ; $fc4c: a9 00 VSYNC
	sta $fb                  ; $fc4e: 85 fb
	jmp $fe1f                ; $fc50: 4c 1f fe

; === Block $fc53-$fc57 (Code) ===
loc_fc53:
	bit $a7                  ; $fc53: 24 a7
	bvc $fc5a                ; $fc55: 50 03
loc_fc57:
	jmp $fcac                ; $fc57: 4c ac fc

; === Block $fc5a-$fc7f (Code) ===
loc_fc5a:
	bit $fd                  ; $fc5a: 24 fd
	bmi $fc82                ; $fc5c: 30 24
loc_fc5e:
	bvs $fc82                ; $fc5e: 70 22
loc_fc60:
	lda $ef                  ; $fc60: a5 ef
	sec                      ; $fc62: 38
	sbc $fb                  ; $fc63: e5 fb
	cmp #$08                 ; $fc65: c9 08 COLUPF
	bcs $fc82                ; $fc67: b0 19
loc_fc69:
	cmp #$fd                 ; $fc69: c9 fd
	bmi $fc82                ; $fc6b: 30 15
loc_fc6d:
	lda $fc                  ; $fc6d: a5 fc
	and #$1f                 ; $fc6f: 29 1f ENABL
	cmp $ac                  ; $fc71: c5 ac
	bne $fc82                ; $fc73: d0 0d
loc_fc75:
	lda #$20                 ; $fc75: a9 20 HMP0
	ora $a3                  ; $fc77: 05 a3
	sta $a3                  ; $fc79: 85 a3
	lda #$00                 ; $fc7b: a9 00 VSYNC
	sta $fb                  ; $fc7d: 85 fb
	jmp $fe1f                ; $fc7f: 4c 1f fe

; === Block $fc82-$fca9 (Code) ===
loc_fc82:
	lda $f7                  ; $fc82: a5 f7
	bmi $fcac                ; $fc84: 30 26
loc_fc86:
	lda $ef                  ; $fc86: a5 ef
	sec                      ; $fc88: 38
	sbc $f7                  ; $fc89: e5 f7
	cmp #$04                 ; $fc8b: c9 04 NUSIZ0
	bcs $fcac                ; $fc8d: b0 1d
loc_fc8f:
	cmp #$fd                 ; $fc8f: c9 fd
	bmi $fcac                ; $fc91: 30 19
loc_fc93:
	lda $f8                  ; $fc93: a5 f8
	and #$1f                 ; $fc95: 29 1f ENABL
	cmp $ac                  ; $fc97: c5 ac
	bne $fcac                ; $fc99: d0 11
loc_fc9b:
	lda #$20                 ; $fc9b: a9 20 HMP0
	ora $a3                  ; $fc9d: 05 a3
	sta $a3                  ; $fc9f: 85 a3
	lda #$00                 ; $fca1: a9 00 VSYNC
	sta $fb                  ; $fca3: 85 fb
	lda #$f0                 ; $fca5: a9 f0
	sta $f7                  ; $fca7: 85 f7
	jmp $fe1f                ; $fca9: 4c 1f fe

; === Block $fcac-$fd0b (Code) ===
loc_fcac:
	bit $fd                  ; $fcac: 24 fd
	bvs $fce1                ; $fcae: 70 31
loc_fcb0:
	bmi $fce1                ; $fcb0: 30 2f
loc_fcb2:
	lda $fb                  ; $fcb2: a5 fb
	clc                      ; $fcb4: 18
	adc #$03                 ; $fcb5: 69 03 RSYNC
	lsr                      ; $fcb7: 4a
	lsr                      ; $fcb8: 4a
	tay                      ; $fcb9: a8
	lda $fc                  ; $fcba: a5 fc
	cmp #$ff                 ; $fcbc: c9 ff
	beq $fce1                ; $fcbe: f0 21
loc_fcc0:
	lsr                      ; $fcc0: 4a
	tya                      ; $fcc1: 98
	bcs $fcc6                ; $fcc2: b0 02
loc_fcc4:
	adc #$20                 ; $fcc4: 69 20 HMP0
loc_fcc6:
	tax                      ; $fcc6: aa
	lda #$13                 ; $fcc7: a9 13 RESM1
	sec                      ; $fcc9: 38
	sbc $fc                  ; $fcca: e5 fc
	and #$1f                 ; $fccc: 29 1f ENABL
	asl                      ; $fcce: 0a
	tay                      ; $fccf: a8
	txa                      ; $fcd0: 8a
	and #$10                 ; $fcd1: 29 10 RESP0
	beq $fcd6                ; $fcd3: f0 01
loc_fcd5:
	iny                      ; $fcd5: c8
loc_fcd6:
	lda $fed0,x              ; $fcd6: bd d0 fe
	eor #$ff                 ; $fcd9: 49 ff
	and $00ad,y              ; $fcdb: 39 ad 00
	sta $00ad,y              ; $fcde: 99 ad 00
loc_fce1:
	lda $a9                  ; $fce1: a5 a9
	and #$00                 ; $fce3: 29 00 VSYNC
	bne $fd0b                ; $fce5: d0 24
loc_fce7:
	bit $a4                  ; $fce7: 24 a4
	bvs $fd0b                ; $fce9: 70 20
loc_fceb:
	ldx #$00                 ; $fceb: a2 00 VSYNC
	stx $d7                  ; $fced: 86 d7
	ldx $f2                  ; $fcef: a6 f2
	lda $a3                  ; $fcf1: a5 a3
	and #$60                 ; $fcf3: 29 60 HMP0
	bne $fd0b                ; $fcf5: d0 14
loc_fcf7:
	lda $a9                  ; $fcf7: a5 a9
	and #$07                 ; $fcf9: 29 07 COLUP1
	cmp #$03                 ; $fcfb: c9 03 RSYNC
	beq $fd0b                ; $fcfd: f0 0c
loc_fcff:
	lda $94,x                ; $fcff: b5 94
	and #$40                 ; $fd01: 29 40 VSYNC
	bne $fd0e                ; $fd03: d0 09
loc_fd05:
	lda $a9                  ; $fd05: a5 a9
	and #$01                 ; $fd07: 29 01 VBLANK
	beq $fd0e                ; $fd09: f0 03
loc_fd0b:
	jmp $fe1f                ; $fd0b: 4c 1f fe

; === Block $fd0e-$fd1f (Code) ===
loc_fd0e:
	lda $db,x                ; $fd0e: b5 db
	sta $ac                  ; $fd10: 85 ac
	bpl $fd40                ; $fd12: 10 2c
loc_fd14:
	lda $d7                  ; $fd14: a5 d7
	bne $fd24                ; $fd16: d0 0c
loc_fd18:
	lda $0284                ; $fd18: ad 84 02 INTIM
	cmp #$06                 ; $fd1b: c9 06 COLUP0
	bpl $fd22                ; $fd1d: 10 03
loc_fd1f:
	jmp $fe1f                ; $fd1f: 4c 1f fe

; === Block $fd22-$fd24 (Code) ===
loc_fd22:
	stx $d7                  ; $fd22: 86 d7

; === Block $fd24-$fd40 (Code) ===
loc_fd24:
	lda $da,x                ; $fd24: b5 da
	and #$1f                 ; $fd26: 29 1f ENABL
	sta $aa                  ; $fd28: 85 aa
	lda $ac                  ; $fd2a: a5 ac
	and #$1f                 ; $fd2c: 29 1f ENABL
	cmp $aa                  ; $fd2e: c5 aa
	beq $fd6c                ; $fd30: f0 3a
loc_fd32:
	lda $e4,x                ; $fd32: b5 e4
	and #$03                 ; $fd34: 29 03 RSYNC
	bne $fd6c                ; $fd36: d0 34
loc_fd38:
	lda $da,x                ; $fd38: b5 da
	ora #$80                 ; $fd3a: 09 80
	sta $db,x                ; $fd3c: 95 db
	bne $fd78                ; $fd3e: d0 38

; === Block $fd40-$fd4b (Code) ===
loc_fd40:
	lda $dc,x                ; $fd40: b5 dc
	bmi $fd4e                ; $fd42: 30 0a
loc_fd44:
	lda $0284                ; $fd44: ad 84 02 INTIM
	cmp #$06                 ; $fd47: c9 06 COLUP0
	bpl $fd4e                ; $fd49: 10 03
loc_fd4b:
	jmp $fe1f                ; $fd4b: 4c 1f fe

; === Block $fd4e-$fd83 (Code) ===
loc_fd4e:
	lda $ac                  ; $fd4e: a5 ac
	and #$20                 ; $fd50: 29 20 HMP0
	bne $fd5c                ; $fd52: d0 08
loc_fd54:
	lda $e4,x                ; $fd54: b5 e4
	cmp #$7c                 ; $fd56: c9 7c
	beq $fdd7                ; $fd58: f0 7d
loc_fd5a:
	bne $fd64                ; $fd5a: d0 08
loc_fd5c:
	lda $e4,x                ; $fd5c: b5 e4
	beq $fdd7                ; $fd5e: f0 77
loc_fd60:
	cmp #$7c                 ; $fd60: c9 7c
	beq $fd6c                ; $fd62: f0 08
loc_fd64:
	cmp #$00                 ; $fd64: c9 00 VSYNC
	beq $fd6c                ; $fd66: f0 04
loc_fd68:
	and #$03                 ; $fd68: 29 03 RSYNC
	beq $fd86                ; $fd6a: f0 1a
loc_fd6c:
	lda $ac                  ; $fd6c: a5 ac
	and #$20                 ; $fd6e: 29 20 HMP0
	bne $fd76                ; $fd70: d0 04
loc_fd72:
	inc $e4,x                ; $fd72: f6 e4
	bne $fd78                ; $fd74: d0 02
loc_fd76:
	dec $e4,x                ; $fd76: d6 e4
loc_fd78:
	bit $ac                  ; $fd78: 24 ac
	bmi $fd80                ; $fd7a: 30 04
loc_fd7c:
	lda #$00                 ; $fd7c: a9 00 VSYNC
	sta $d7                  ; $fd7e: 85 d7
loc_fd80:
	dex                      ; $fd80: ca
	bmi $fd0b                ; $fd81: 30 88
loc_fd83:
	jmp $fcff                ; $fd83: 4c ff fc

; === Block $fd86-$fdd7 (Code) ===
loc_fd86:
	lda $e4,x                ; $fd86: b5 e4
	lsr                      ; $fd88: 4a
	lsr                      ; $fd89: 4a
	tay                      ; $fd8a: a8
	lda $ac                  ; $fd8b: a5 ac
	lsr                      ; $fd8d: 4a
	and #$10                 ; $fd8e: 29 10 RESP0
	bne $fd94                ; $fd90: d0 02
loc_fd92:
	iny                      ; $fd92: c8
	iny                      ; $fd93: c8
loc_fd94:
	dey                      ; $fd94: 88
	bmi $fd6c                ; $fd95: 30 d5
loc_fd97:
	tya                      ; $fd97: 98
	bcs $fd9c                ; $fd98: b0 02
loc_fd9a:
	adc #$20                 ; $fd9a: 69 20 HMP0
loc_fd9c:
	sta $d5                  ; $fd9c: 85 d5
	tay                      ; $fd9e: a8
	lda $94,x                ; $fd9f: b5 94
	and #$20                 ; $fda1: 29 20 HMP0
	beq $fdac                ; $fda3: f0 07
loc_fda5:
	lda $fed0,y              ; $fda5: b9 d0 fe
	bne $fdd7                ; $fda8: d0 2d
loc_fdaa:
	beq $fd6c                ; $fdaa: f0 c0
loc_fdac:
	lda $ac                  ; $fdac: a5 ac
	and #$1f                 ; $fdae: 29 1f ENABL
	sta $ab                  ; $fdb0: 85 ab
	lda #$13                 ; $fdb2: a9 13 RESM1
	sec                      ; $fdb4: 38
	sbc $ab                  ; $fdb5: e5 ab
	asl                      ; $fdb7: 0a
	tay                      ; $fdb8: a8
	lda $d5                  ; $fdb9: a5 d5
	and #$10                 ; $fdbb: 29 10 RESP0
	beq $fdc0                ; $fdbd: f0 01
loc_fdbf:
	iny                      ; $fdbf: c8
loc_fdc0:
	lda $00ad,y              ; $fdc0: b9 ad 00
	ldy $d5                  ; $fdc3: a4 d5
	and $fed0,y              ; $fdc5: 39 d0 fe
	beq $fd6c                ; $fdc8: f0 a2
loc_fdca:
	ldy $ab                  ; $fdca: a4 ab
	lda $0094,y              ; $fdcc: b9 94 00
	bpl $fdd7                ; $fdcf: 10 06
loc_fdd1:
	lda $94,x                ; $fdd1: b5 94
	ora #$20                 ; $fdd3: 09 20 HMP0
	sta $94,x                ; $fdd5: 95 94

; === Block $fdd7-$fdf4 (Code) ===
loc_fdd7:
	lda $ac                  ; $fdd7: a5 ac
	tay                      ; $fdd9: a8
	and #$1f                 ; $fdda: 29 1f ENABL
	beq $fde8                ; $fddc: f0 0a
loc_fdde:
	cmp #$05                 ; $fdde: c9 05 NUSIZ1
	bne $fe0f                ; $fde0: d0 2d
loc_fde2:
	bit $ac                  ; $fde2: 24 ac
	bvc $fe16                ; $fde4: 50 30
loc_fde6:
	bvs $fe0a                ; $fde6: 70 22
loc_fde8:
	lda $94,x                ; $fde8: b5 94
	and #$20                 ; $fdea: 29 20 HMP0
	beq $fdf7                ; $fdec: f0 09
loc_fdee:
	lda $94,x                ; $fdee: b5 94
	and #$df                 ; $fdf0: 29 df
	sta $94,x                ; $fdf2: 95 94
	jmp $fe0a                ; $fdf4: 4c 0a fe

; === Block $fdf7-$fe0a (Code) ===
loc_fdf7:
	lda $9d                  ; $fdf7: a5 9d
	ora #$20                 ; $fdf9: 09 20 HMP0
	sta $9d                  ; $fdfb: 85 9d
	lda $d7                  ; $fdfd: a5 d7
	beq $fe0a                ; $fdff: f0 09
loc_fe01:
	tay                      ; $fe01: a8
	lda $00db,y              ; $fe02: b9 db 00
	eor #$a0                 ; $fe05: 49 a0
	sta $00db,y              ; $fe07: 99 db 00

; === Block $fe0a-$fe0f (Code) ===
loc_fe0a:
	lda $ac                  ; $fe0a: a5 ac
	eor #$40                 ; $fe0c: 49 40 VSYNC
	tay                      ; $fe0e: a8

; === Block $fe0f-$fe1c (Code) ===
loc_fe0f:
	tya                      ; $fe0f: 98
	and #$40                 ; $fe10: 29 40 VSYNC
	beq $fe16                ; $fe12: f0 02
loc_fe14:
	iny                      ; $fe14: c8
	iny                      ; $fe15: c8
loc_fe16:
	dey                      ; $fe16: 88
	tya                      ; $fe17: 98
	eor #$20                 ; $fe18: 49 20 HMP0
	sta $db,x                ; $fe1a: 95 db
	jmp $fd78                ; $fe1c: 4c 78 fd

; === Block $fe1f-$fe24 (Code) ===
loc_fe1f:
	ldx $0284                ; $fe1f: ae 84 02 INTIM
	bne $fe1f                ; $fe22: d0 fb
loc_fe24:
	jmp $f116                ; $fe24: 4c 16 f1

; === Block $ffec-$ffef (Code) ===
loc_ffec:
	sta $fff8                ; $ffec: 8d f8 ff BANK0
	jmp $f8c7                ; $ffef: 4c c7 f8

; === Block $fff2-$fff5 (Code) ===
loc_fff2:
	sta $fff8                ; $fff2: 8d f8 ff BANK0
	jmp $f8c7                ; $fff5: 4c c7 f8

