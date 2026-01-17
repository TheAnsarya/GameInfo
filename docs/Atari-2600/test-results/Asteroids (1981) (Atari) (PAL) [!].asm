; 🌺 Peony Disassembly
; ROM: Asteroids (1981) (Atari) (PAL) [!].a26
; Platform: Atari 2600
; Size: 8192 bytes
; Mapper: F8

; === Block $f9da-$fa00 (Code) ===
reset:
	sei                      ; $f9da: 78
	cld                      ; $f9db: d8
	ldx #$ff                 ; $f9dc: a2 ff
	txs                      ; $f9de: 9a
	inx                      ; $f9df: e8
	txa                      ; $f9e0: 8a
	sta $00,x                ; $f9e1: 95 00 VSYNC
	inx                      ; $f9e3: e8
	bne $f9e1                ; $f9e4: d0 fb
loc_f9e6:
	lda #$e0                 ; $f9e6: a9 e0
	sta $ca                  ; $f9e8: 85 ca
	lda #$34                 ; $f9ea: a9 34
	sta $82                  ; $f9ec: 85 82
	sta $81                  ; $f9ee: 85 81
	lda #$40                 ; $f9f0: a9 40 VSYNC
	sta $c7                  ; $f9f2: 85 c7
	lda #$01                 ; $f9f4: a9 01 VBLANK
	sta $c8                  ; $f9f6: 85 c8
	lda #$00                 ; $f9f8: a9 00 VSYNC
	sta $f7                  ; $f9fa: 85 f7
	lda #$db                 ; $f9fc: a9 db
	sta $f8                  ; $f9fe: 85 f8
	jmp $fff0                ; $fa00: 4c f0 ff

; === Block $fff0-$fff3 (Code) ===
loc_fff0:
	sta $fff8                ; $fff0: 8d f8 ff BANK0
	jmp ($00f7)              ; $fff3: 6c f7 00

