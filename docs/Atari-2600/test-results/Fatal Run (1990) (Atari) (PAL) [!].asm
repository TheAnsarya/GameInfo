; 🌺 Peony Disassembly
; ROM: Fatal Run (1990) (Atari) (PAL) [!].a26
; Platform: Atari 2600
; Size: 32768 bytes
; Mapper: F4

; === Block $f100-$f103 (Code) ===
reset:
	lda $fff4                ; $f100: ad f4 ff BANK0
	jmp $f100                ; $f103: 4c 00 f1

