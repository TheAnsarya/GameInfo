; Dragon Quest III - System Initialization
; Generated from ROM analysis
; Reset vector: $486d

.include "snes_header.inc"

.segment "RESET"

; Reset handler entry point
reset_handler:
	jmp $5050		; Jump to $5050

; Continue to main initialization
	jmp	main_init

.segment "VECTORS"
; SNES interrupt vector table
	.word	cop_native_handler	; $0a00
	.word	brk_native_handler	; $466d
	.word	abort_native_handler	; $8dfc
	.word	nmi_native_handler	; $fc46
	.word	unused_native_handler	; $7222
	.word	irq_native_handler	; $c905
	.word	unused1_handler	; $0900
	.word	unused2_handler	; $d800
	.word	cop_emulation_handler	; $c541
	.word	unused3_handler	; $0003
	.word	abort_emulation_handler	; $00ff
	.word	nmi_emulation_handler	; $0a00
	.word	reset_handler	; $486d
	.word	irq_emulation_handler	; $8dfc
