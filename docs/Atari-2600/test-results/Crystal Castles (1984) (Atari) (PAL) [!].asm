; 🌺 Peony Disassembly
; ROM: Crystal Castles (1984) (Atari) (PAL) [!].a26
; Platform: Atari 2600
; Size: 16384 bytes
; Mapper: F6

; === Block $ffde-$ffe1 (Code) ===
reset:
	lda $dff8                ; $ffde: ad f8 df
	jmp $d100                ; $ffe1: 4c 00 d1

