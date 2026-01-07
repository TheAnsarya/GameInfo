; Soul Blazer (SNES) - Bank $09
; Disassembled from ROM
; File offset: $048000-$04ffff
; CPU address: $09:$8000-$09:$ffff
;===========================================================

.bank $09
.org $8000

$09:8000  ff 00 ff 00   sbc $00ff00,x
$09:8004  ff 00 ff 00   sbc $00ff00,x
$09:8008  ff 00 ff 00   sbc $00ff00,x
$09:800c  ff 00 ff 00   sbc $00ff00,x
$09:8010  ff 00 ff 00   sbc $00ff00,x
$09:8014  ff 00 e7 00   sbc $00e700,x
$09:8018  e7 00		 sbc [$00]
$09:801a  ff 00 ff 00   sbc $00ff00,x
$09:801e  ff 00 ff 00   sbc $00ff00,x
$09:8022  ff 00 f7 00   sbc $00f700,x
$09:8026  e7 00		 sbc [$00]
$09:8028  e7 00		 sbc [$00]
$09:802a  ef 00 ff 00   sbc $00ff00
$09:802e  ff 00 ff 00   sbc $00ff00,x
$09:8032  ff 00 e7 00   sbc $00e700,x
$09:8036  e7 00		 sbc [$00]
$09:8038  e7 00		 sbc [$00]
$09:803a  e7 00		 sbc [$00]
$09:803c  ff 00 ff 00   sbc $00ff00,x
$09:8040  ff 00 ff 00   sbc $00ff00,x
$09:8044  c7 00		 cmp [$00]
$09:8046  e7 00		 sbc [$00]
$09:8048  e7 00		 sbc [$00]
$09:804a  e3 00		 sbc $00,s
$09:804c  ff 00 ff 00   sbc $00ff00,x
$09:8050  ff 00 ff 00   sbc $00ff00,x
$09:8054  c7 00		 cmp [$00]
$09:8056  c7 00		 cmp [$00]
$09:8058  e3 00		 sbc $00,s
$09:805a  e3 00		 sbc $00,s
$09:805c  ff 00 ff 00   sbc $00ff00,x
$09:8060  ff 00 ff 00   sbc $00ff00,x
$09:8064  c7 00		 cmp [$00]
$09:8066  c3 00		 cmp $00,s
$09:8068  c3 00		 cmp $00,s
$09:806a  e3 00		 sbc $00,s
$09:806c  ff 00 ff 00   sbc $00ff00,x
$09:8070  ff 00 ff 00   sbc $00ff00,x
$09:8074  c3 00		 cmp $00,s
$09:8076  c3 00		 cmp $00,s
$09:8078  c3 00		 cmp $00,s
$09:807a  c3 00		 cmp $00,s
$09:807c  ff 00 ff 00   sbc $00ff00,x
$09:8080  ff 00 fb 00   sbc $00fb00,x
$09:8084  c3 00		 cmp $00,s
$09:8086  c3 00		 cmp $00,s
$09:8088  c3 00		 cmp $00,s
$09:808a  c3 00		 cmp $00,s
$09:808c  df 00 ff 00   cmp $00ff00,x
$09:8090  ff 00 f3 00   sbc $00f300,x
$09:8094  c3 00		 cmp $00,s
$09:8096  c3 00		 cmp $00,s
$09:8098  c3 00		 cmp $00,s
$09:809a  c3 00		 cmp $00,s
$09:809c  cf 00 ff 00   cmp $00ff00
$09:80a0  ff 00 e3 00   sbc $00e300,x
$09:80a4  c3 00		 cmp $00,s
$09:80a6  c3 00		 cmp $00,s
$09:80a8  c3 00		 cmp $00,s
$09:80aa  c3 00		 cmp $00,s
$09:80ac  c7 00		 cmp [$00]
$09:80ae  ff 00 ff 00   sbc $00ff00,x
$09:80b2  c3 00		 cmp $00,s
$09:80b4  c3 00		 cmp $00,s
$09:80b6  c3 00		 cmp $00,s
$09:80b8  c3 00		 cmp $00,s
$09:80ba  c3 00		 cmp $00,s
$09:80bc  c3 00		 cmp $00,s
$09:80be  ff 00 ff 00   sbc $00ff00,x
$09:80c2  83 00		 sta $00,s
$09:80c4  c3 00		 cmp $00,s
$09:80c6  c3 00		 cmp $00,s
$09:80c8  c3 00		 cmp $00,s
$09:80ca  c3 00		 cmp $00,s
$09:80cc  c1 00		 cmp ($00,x)
$09:80ce  ff 00 ff 00   sbc $00ff00,x
$09:80d2  83 00		 sta $00,s
$09:80d4  83 00		 sta $00,s
$09:80d6  c3 00		 cmp $00,s
$09:80d8  c3 00		 cmp $00,s
$09:80da  c1 00		 cmp ($00,x)
$09:80dc  c1 00		 cmp ($00,x)
$09:80de  ff 00 ff 00   sbc $00ff00,x
$09:80e2  83 00		 sta $00,s
$09:80e4  83 00		 sta $00,s
$09:80e6  83 00		 sta $00,s
$09:80e8  c1 00		 cmp ($00,x)
$09:80ea  c1 00		 cmp ($00,x)
$09:80ec  c1 00		 cmp ($00,x)
$09:80ee  ff 00 ff 00   sbc $00ff00,x
$09:80f2  83 00		 sta $00,s
$09:80f4  83 00		 sta $00,s
$09:80f6  81 00		 sta ($00,x)
$09:80f8  81 00		 sta ($00,x)
$09:80fa  c1 00		 cmp ($00,x)
$09:80fc  c1 00		 cmp ($00,x)
$09:80fe  ff 00 ff 00   sbc $00ff00,x
$09:8102  83 00		 sta $00,s
$09:8104  81 00		 sta ($00,x)
$09:8106  81 00		 sta ($00,x)
$09:8108  81 00		 sta ($00,x)
$09:810a  81 00		 sta ($00,x)
$09:810c  c1 00		 cmp ($00,x)
$09:810e  ff 00 ff 00   sbc $00ff00,x
$09:8112  81 00		 sta ($00,x)
$09:8114  81 00		 sta ($00,x)
$09:8116  81 00		 sta ($00,x)
$09:8118  81 00		 sta ($00,x)
$09:811a  81 00		 sta ($00,x)
$09:811c  81 00		 sta ($00,x)
$09:811e  ff 00 fd 00   sbc $00fd00,x
$09:8122  81 00		 sta ($00,x)
$09:8124  81 00		 sta ($00,x)
$09:8126  81 00		 sta ($00,x)
$09:8128  81 00		 sta ($00,x)
$09:812a  81 00		 sta ($00,x)
$09:812c  81 00		 sta ($00,x)
$09:812e  bf 00 f9 00   lda $00f900,x
$09:8132  81 00		 sta ($00,x)
$09:8134  81 00		 sta ($00,x)
$09:8136  81 00		 sta ($00,x)
$09:8138  81 00		 sta ($00,x)
$09:813a  81 00		 sta ($00,x)
$09:813c  81 00		 sta ($00,x)
$09:813e  9f 00 f1 00   sta $00f100,x
$09:8142  81 00		 sta ($00,x)
$09:8144  81 00		 sta ($00,x)
$09:8146  81 00		 sta ($00,x)
$09:8148  81 00		 sta ($00,x)
$09:814a  81 00		 sta ($00,x)
$09:814c  81 00		 sta ($00,x)
$09:814e  8f 00 e1 00   sta $00e100
$09:8152  81 00		 sta ($00,x)
$09:8154  81 00		 sta ($00,x)
$09:8156  81 00		 sta ($00,x)
$09:8158  81 00		 sta ($00,x)
$09:815a  81 00		 sta ($00,x)
$09:815c  81 00		 sta ($00,x)
$09:815e  87 00		 sta [$00]
$09:8160  c1 00		 cmp ($00,x)
$09:8162  81 00		 sta ($00,x)
$09:8164  81 00		 sta ($00,x)
$09:8166  81 00		 sta ($00,x)
$09:8168  81 00		 sta ($00,x)
$09:816a  81 00		 sta ($00,x)
$09:816c  81 00		 sta ($00,x)
$09:816e  83 00		 sta $00,s
$09:8170  81 00		 sta ($00,x)
$09:8172  81 00		 sta ($00,x)
$09:8174  81 00		 sta ($00,x)
$09:8176  81 00		 sta ($00,x)
$09:8178  81 00		 sta ($00,x)
$09:817a  81 00		 sta ($00,x)
$09:817c  81 00		 sta ($00,x)
$09:817e  81 00		 sta ($00,x)
$09:8180  01 00		 ora ($00,x)
$09:8182  81 00		 sta ($00,x)
$09:8184  81 00		 sta ($00,x)
$09:8186  81 00		 sta ($00,x)
$09:8188  81 00		 sta ($00,x)
$09:818a  81 00		 sta ($00,x)
$09:818c  81 00		 sta ($00,x)
$09:818e  80 00		 bra $8190
$09:8190  01 00		 ora ($00,x)
$09:8192  01 00		 ora ($00,x)
$09:8194  81 00		 sta ($00,x)
$09:8196  81 00		 sta ($00,x)
$09:8198  81 00		 sta ($00,x)
$09:819a  81 00		 sta ($00,x)
$09:819c  80 00		 bra $819e
$09:819e  80 00		 bra $81a0
$09:81a0  01 00		 ora ($00,x)
$09:81a2  01 00		 ora ($00,x)
$09:81a4  01 00		 ora ($00,x)
$09:81a6  81 00		 sta ($00,x)
$09:81a8  81 00		 sta ($00,x)
$09:81aa  80 00		 bra $81ac
$09:81ac  80 00		 bra $81ae
$09:81ae  80 00		 bra $81b0
$09:81b0  01 00		 ora ($00,x)
$09:81b2  01 00		 ora ($00,x)
$09:81b4  01 00		 ora ($00,x)
$09:81b6  01 00		 ora ($00,x)
$09:81b8  80 00		 bra $81ba
$09:81ba  80 00		 bra $81bc
$09:81bc  80 00		 bra $81be
$09:81be  80 00		 bra $81c0
$09:81c0  01 00		 ora ($00,x)
$09:81c2  01 00		 ora ($00,x)
$09:81c4  01 00		 ora ($00,x)
$09:81c6  00 00		 brk #$00
$09:81c8  00 00		 brk #$00
$09:81ca  80 00		 bra $81cc
$09:81cc  80 00		 bra $81ce
$09:81ce  80 00		 bra $81d0
$09:81d0  01 00		 ora ($00,x)
$09:81d2  01 00		 ora ($00,x)
$09:81d4  00 00		 brk #$00
$09:81d6  00 00		 brk #$00
$09:81d8  00 00		 brk #$00
$09:81da  00 00		 brk #$00
$09:81dc  80 00		 bra $81de
$09:81de  80 00		 bra $81e0
$09:81e0  01 00		 ora ($00,x)
$09:81e2  00 00		 brk #$00
$09:81e4  00 00		 brk #$00
$09:81e6  00 00		 brk #$00
$09:81e8  00 00		 brk #$00
$09:81ea  00 00		 brk #$00
$09:81ec  00 00		 brk #$00
$09:81ee  80 00		 bra $81f0
$09:81f0  00 00		 brk #$00
$09:81f2  00 00		 brk #$00
$09:81f4  00 00		 brk #$00
$09:81f6  00 00		 brk #$00
$09:81f8  00 00		 brk #$00
$09:81fa  00 00		 brk #$00
$09:81fc  00 00		 brk #$00
$09:81fe  00 00		 brk #$00
$09:8200  00 08		 brk #$08
$09:8202  81 40		 sta ($40,x)
$09:8204  1d e9 16	  ora $16e9,x
$09:8207  b0 d5		 bcs $81de
$09:8209  ac 2f 51	  ldy $512f
$09:820c  b1 bd		 lda ($bd),y
$09:820e  ca			dex
$09:820f  ad 63 7a	  lda $7a63
$09:8212  8e 32 2d	  stx $2d32
$09:8215  2d 8b 5b	  and $5b8b
$09:8218  22 d6 d8 b4   jsl $b4d8d6
$09:821c  b2 2d		 lda ($2d)
$09:821e  8f 8b 4f 22   sta $224f8b
$09:8222  d6 f8		 dec $f8,x
$09:8224  b4 2a		 ldy $2a,x
$09:8226  2d 0d 8b	  and $8b0d
$09:8229  4a			lsr a
$09:822a  a2 d0		 ldx #$d0
$09:822c  b8			clv
$09:822d  b4 30		 ldy $30,x
$09:822f  32 31		 and ($31)
$09:8231  c8			iny
$09:8232  b4 74		 ldy $74,x
$09:8234  3e 30 f8	  rol $f830,x
$09:8237  b4 3a		 ldy $3a,x
$09:8239  2d 2f c8	  and $c82f
$09:823c  69 63		 adc #$63
$09:823e  17 28		 ora [$28],y
$09:8240  80 c0		 bra $8202
$09:8242  46 20		 lsr $20
$09:8244  2f 41 79 ec   and $ec7941
$09:8248  2a			rol a
$09:8249  1b			tcs
$09:824a  08			php
$09:824b  b5 f2		 lda $f2,x
$09:824d  2d 7d 8b	  and $8b7d
$09:8250  4b			phk
$09:8251  a2 d8		 ldx #$d8
$09:8253  d8			cld
$09:8254  b5 fa		 lda $fa,x
$09:8256  2d 1b 8b	  and $8b1b
$09:8259  63 a2		 adc $a2,s
$09:825b  d2 b8		 cmp ($b8)
$09:825d  b4 68		 ldy $68,x
$09:825f  a2 21		 ldx #$21
$09:8261  c0 95		 cpy #$95
$09:8263  cd a0 93	  cmp $93a0
$09:8266  68			pla
$09:8267  2c da 29	  bit $29da
$09:826a  36 8a		 rol $8a,x
$09:826c  c5 a3		 cmp $a3
$09:826e  d1 68		 cmp ($68),y
$09:8270  f9 2c 45	  sbc $452c,y
$09:8273  c1 95		 cmp ($95,x)
$09:8275  1b			tcs
$09:8276  8e 14 6a	  stx $6a14
$09:8279  67 05		 adc [$05]
$09:827b  17 81		 ora [$81],y
$09:827d  0c f3 91	  tsb $91f3
$09:8280  6c ec 5b	  jmp ($5bec)
$09:8283  59 16 d6	  eor $d616,y
$09:8286  c5 b3		 cmp $b3
$09:8288  d1 6c		 cmp ($6c),y
$09:828a  f8			sed
$09:828b  8c 75 e5	  sty $e575
$09:828e  71 9d		 adc ($9d),y
$09:8290  c5 a9		 cmp $a9
$09:8292  51 6a		 eor ($6a),y
$09:8294  58			cli
$09:8295  3c 41 40	  bit $4041,x
$09:8298  14 09		 trb $09
$09:829a  ec 5a 7c	  cpx $7c5a
$09:829d  69 1a		 adc #$1a
$09:829f  74 5a		 stz $5a,x
$09:82a1  9f 18 83 46   sta $468318,x
$09:82a5  20 f1 88	  jsr $88f1
$09:82a8  b4 62		 ldy $62,x
$09:82aa  2e af 18	  rol $18af
$09:82ad  4a			lsr a
$09:82ae  cc 63 2b	  cpy $2b63
$09:82b1  75 81		 adc $81,x
$09:82b3  c5 36		 cmp $36
$09:82b5  15 4d		 ora $4d,x
$09:82b7  83 1c		 sta $1c,s
$09:82b9  95 eb		 sta $eb,x
$09:82bb  02 8b		 cop #$8b
$09:82bd  56 a2		 lsr $a2,x
$09:82bf  d4 d8		 pei ($d8)
$09:82c1  b5 6e		 lda $6e,x
$09:82c3  2d 5d 8b	  and $8b5d
$09:82c6  53 1b		 eor ($1b,s),y
$09:82c8  23 5c		 and $5c,s
$09:82ca  6e 9d 7d	  ror $7d9d
$09:82cd  c6 35		 dec $35
$09:82cf  e5 79		 sbc $79
$09:82d1  bc c1 7c	  ldy $7cc1,x
$09:82d4  8f 44 79 14   sta $147944
$09:82d8  4d 5e ab	  eor $ab5e
$09:82db  e2 89		 sep #$89
$09:82dd  2c ca 35	  bit $35ca
$09:82e0  24 8d		 bit $8d
$09:82e2  49 63		 eor #$63
$09:82e4  53 48		 eor ($48,s),y
$09:82e6  d4 d6		 pei ($d6)
$09:82e8  35 44		 and $44,x
$09:82ea  8d 51 63	  sta $6351
$09:82ed  55 48		 eor $48,x
$09:82ef  d5 56		 cmp $56,x
$09:82f1  2d 66 8b	  and $8b66
$09:82f4  59 e2 d7	  eor $d7e2,y
$09:82f7  68			pla
$09:82f8  b5 dd		 lda $dd,x
$09:82fa  5e 31 05	  lsr $0531,x
$09:82fd  98			tya
$09:82fe  c0 63		 cpy #$63
$09:8300  52 68		 eor ($68)
$09:8302  d4 9e		 pei ($9e)
$09:8304  35 36		 and $36,x
$09:8306  8d 4d e3	  sta $e34d
$09:8309  52 88		 eor ($88)
$09:830b  d4 a6		 pei ($a6)
$09:830d  35 38		 and $38,x
$09:830f  8d 4e 55	  sta $554e
$09:8312  e7 a9		 sbc [$a9]
$09:8314  8c 6a a2	  sty $a26a
$09:8317  93 28		 sta ($28,s),y
$09:8319  a5 04		 lda $04
$09:831b  a2 25		 ldx #$25
$09:831d  00 a1		 brk #$a1
$09:831f  45 26		 eor $26
$09:8321  25 91		 and $91
$09:8323  a1 45		 lda ($45,x)
$09:8325  a4 51		 ldy $51
$09:8327  6e 4c 5b	  ror $5b4c
$09:832a  50 61		 bvc $838d
$09:832c  1e 54 5a	  asl $5a54,x
$09:832f  42 67		 wdm #$67
$09:8331  1d 5a bc	  ora $bc5a,x
$09:8334  62 21 33	  per $b658
$09:8337  a3 46		 lda $46,s
$09:8339  a8			tay
$09:833a  f1 aa		 sbc ($aa),y
$09:833c  b4 6a		 ldy $6a,x
$09:833e  af 1a a4 46   lda $46a41a
$09:8342  a9 31		 lda #$31
$09:8344  aa			tax
$09:8345  c4 6a		 cpy $6a
$09:8347  b3 10		 lda ($10,s),y
$09:8349  eb			xba
$09:834a  54 3a d9	  mvn $d9,$3a
$09:834d  0e b7 43	  asl $43b7
$09:8350  ac 57 1a	  ldy $1a57
$09:8353  92 44		 sta ($44)
$09:8355  64 71		 stz $71
$09:8357  4a			lsr a
$09:8358  89 44		 bit #$44
$09:835a  64 09		 stz $09
$09:835c  70 31		 bvs $838f
$09:835e  99 91 35	  sta $3591,y
$09:8361  66 b2		 ror $b2
$09:8363  43 84		 eor $84,s
$09:8365  43 af		 eor $af,s
$09:8367  10 f3		 bpl $835c
$09:8369  44 3c eb	  mvp $eb,$3c
$09:836c  11 59		 ora ($59),y
$09:836e  02 d8		 cop #$d8
$09:8370  3c f5 0e	  bit $0ef5,x
$09:8373  ba			tsx
$09:8374  24 2a		 bit $2a
$09:8376  0b			phd
$09:8377  e0 f3		 cpx #$f3
$09:8379  45 ac		 eor $ac
$09:837b  15 6b		 ora $6b,x
$09:837d  74 5a		 stz $5a,x
$09:837f  c3 56		 cmp $56,s
$09:8381  bf c0 20 11   lda $1120c0,x
$09:8385  49 83		 eor #$83
$09:8387  44 4b 01	  mvp $01,$4b
$09:838a  33 67		 and ($67,s),y
$09:838c  89 48		 bit #$48
$09:838e  26 71		 rol $71
$09:8390  63 21		 adc $21,s
$09:8392  6e 22 db	  ror $db22
$09:8395  98			tya
$09:8396  b2 a0		 lda ($a0)
$09:8398  b7 51		 lda [$51],y
$09:839a  6d da cc	  adc $ccda
$09:839d  d6 84		 dec $84,x
$09:839f  f6 76		 inc $76,x
$09:83a1  28			plp
$09:83a2  3f ca ad 93   and $93adca,x
$09:83a6  ab			plb
$09:83a7  64 aa		 stz $aa
$09:83a9  da			phx
$09:83aa  3a			dec a
$09:83ab  b6 89		 ldx $89,y
$09:83ad  2e 75 04	  rol $0475
$09:83b0  b8			clv
$09:83b1  a4 12		 ldy $12
$09:83b3  a6 df		 ldx $df
$09:83b5  3e 43 84	  rol $8443,x
$09:83b8  55 09		 eor $09,x
$09:83ba  cb			wai
$09:83bb  c8			iny
$09:83bc  79 98 60	  adc $6098,y
$09:83bf  8b			phb
$09:83c0  0c 83 00	  tsb $0083
$09:83c3  17 c0		 ora [$c0],y
$09:83c5  32 0e		 and ($0e)
$09:83c7  b8			clv
$09:83c8  d4 ba		 pei ($ba)
$09:83ca  1e 6e 87	  asl $876e,x
$09:83cd  5d 1a 11	  eor $111a,x
$09:83d0  6c 94 5b	  jmp ($5b94)
$09:83d3  27 16		 and [$16]
$09:83d5  d1 45		 cmp ($45),y
$09:83d7  b4 6d		 ldy $6d,x
$09:83d9  f1 a0		 sbc ($a0),y
$09:83db  38			sec
$09:83dc  ce 86 e9	  dec $e986
$09:83df  48			pha
$09:83e0  b7 62		 lda [$62],y
$09:83e2  2d d9 8b	  and $8bd9
$09:83e5  7a			ply
$09:83e6  22 de a8 b7   jsl $b7a8de
$09:83ea  6a			ror a
$09:83eb  2d db 32	  and $32db
$09:83ee  8f af 2c 6f   sta $6f2caf
$09:83f2  0c be 5b	  tsb $5bbe
$09:83f5  0d 96 c3	  ora $c396
$09:83f8  e5 b3		 sbc $b3
$09:83fa  19 6c ce	  ora $ce6c,y
$09:83fd  5b			tcd
$09:83fe  11 96		 ora ($96),y
$09:8400  c4 d5		 cpy $d5
$09:8402  ad 75 6b	  lda $6b75
$09:8405  54 5a f7	  mvn $f7,$5a
$09:8408  56 bd		 lsr $bd,x
$09:840a  45 90		 eor $90
$09:840c  41 6b		 eor ($6b,x)
$09:840e  8b			phb
$09:840f  21 82		 and ($82,x)
$09:8411  f7 16		 sbc [$16],y
$09:8413  b4 45		 ldy $45,x
$09:8415  ad 31 6b	  lda $6b31
$09:8418  c4 5a		 cpy $5a
$09:841a  f3 16		 sbc ($16,s),y
$09:841c  d2 c5		 cmp ($c5)
$09:841e  b2 a9		 lda ($a9)
$09:8420  92 cb		 sta ($cb)
$09:8422  69 72		 adc #$72
$09:8424  c9 e0		 cmp #$e0
$09:8426  4f 06 16 2c   eor $2c1606
$09:842a  20 21 00	  jsr $0021
$09:842d  7c 22 d8	  jmp ($d822,x)
$09:8430  68			pla
$09:8431  b6 1e		 ldx $1e,y
$09:8433  2d 96 8b	  and $8b96
$09:8436  65 e2		 adc $e2
$09:8438  d8			cld
$09:8439  88			dey
$09:843a  b6 26		 ldx $26,y
$09:843c  2d 98 8b	  and $8b98
$09:843f  66 62		 ror $62
$09:8441  d8			cld
$09:8442  ba			tsx
$09:8443  b6 2a		 ldx $2a,y
$09:8445  2d 9b ab	  and $ab9b
$09:8448  66 a2		 ror $a2
$09:844a  cc 20 c5	  cpy $c520
$09:844d  c5 98		 cmp $98
$09:844f  c0 c4		 cpy #$c4
$09:8451  0b			phd
$09:8452  4d 5a d1	  eor $d15a
$09:8455  56 bc		 lsr $bc,x
$09:8457  d5 af		 cmp $af,x
$09:8459  19 6b ae	  ora $ae6b,y
$09:845c  5a			phy
$09:845d  ca			dex
$09:845e  d9 3c 2b	  cmp $2b3c,y
$09:8461  5c 6e b0 28   jml $28b06e
$09:8465  02 9c		 cop #$9c
$09:8467  7e 51 62	  ror $6251,x
$09:846a  a0 70		 ldy #$70
$09:846c  9c a0 e5	  stz $e5a0
$09:846f  06 f8		 asl $f8
$09:8471  e1 62		 sbc ($62,x)
$09:8473  99 18 c4	  sta $c418,y
$09:8476  ea			nop
$09:8477  29 a1		 and #$a1
$09:8479  7c 83 c4	  jmp ($c483,x)
$09:847c  1f e5 16 d2   ora $d216e5,x
$09:8480  80 67		 bra $84e9
$09:8482  16 03		 asl $03,x
$09:8484  1c d8 45	  trb $45d8
$09:8487  00 60		 brk #$60
$09:8489  9f 37 00 26   sta $260037,x
$09:848d  83 95		 sta $95,s
$09:848f  16 2d		 asl $2d,x
$09:8491  07 c4		 ora [$c4]
$09:8493  52 2c		 eor ($2c)
$09:8495  00 84		 brk #$84
$09:8497  05 46		 ora $46
$09:8499  cb			wai
$09:849a  16 19		 asl $19,x
$09:849c  03 28		 ora $28,s
$09:849e  06 c0		 asl $c0
$09:84a0  1c 10 29	  trb $2910
$09:84a3  01 40		 ora ($40,x)
$09:84a5  82 80 30	  brl $b528
$09:84a8  18			clc
$09:84a9  88			dey
$09:84aa  c8			iny
$09:84ab  06 c0		 asl $c0
$09:84ad  36 0b		 rol $0b,x
$09:84af  75 5a		 adc $5a,x
$09:84b1  dd 16 bf	  cmp $bf16,x
$09:84b4  d5 af		 cmp $af,x
$09:84b6  ed 71 c2	  sbc $c271
$09:84b9  87 46		 sta [$46]
$09:84bb  eb			xba
$09:84bc  16 f9		 asl $f9,x
$09:84be  8a			txa
$09:84bf  47 a5		 eor [$a5]
$09:84c1  16 dd		 asl $dd,x
$09:84c3  80 c9		 bra $848e
$09:84c5  e6 40		 inc $40
$09:84c7  52 79		 eor ($79)
$09:84c9  94 73		 sty $73,x
$09:84cb  c2 7f		 rep #$7f
$09:84cd  1f 4c 73 c1   ora $c1734c,x
$09:84d1  9c f4 e7	  stz $e7f4
$09:84d4  3c 07 f2	  bit $f207,x
$09:84d7  ae 23 8b	  ldx $8b23
$09:84da  c1 5c		 cmp ($5c,x)
$09:84dc  f4 f7 3c	  pea $3cf7
$09:84df  1d cf 4a	  ora $4acf,x
$09:84e2  3c ba 1d	  bit $1dba,x
$09:84e5  68			pla
$09:84e6  87 9d		 sta [$9d]
$09:84e8  42 11		 wdm #$11
$09:84ea  49 fa 84	  eor #$84fa
$09:84ed  32 1d		 and ($1d)
$09:84ef  6a			ror a
$09:84f0  a2 98 63	  ldx #$6398
$09:84f3  17 25		 ora [$25],y
$09:84f5  79 45 28	  adc $2845,y
$09:84f8  4b			phk
$09:84f9  13 a0		 ora ($a0,s),y
$09:84fb  ad 59 5e	  lda $5e59
$09:84fe  1d 6d f8	  ora $f86d,x
$09:8501  0c 74 d1	  tsb $d174
$09:8504  6d 38 74	  adc $7438
$09:8507  77 ec		 adc [$ec],y
$09:8509  b2 8b		 lda ($8b)
$09:850b  58			cli
$09:850c  6a			ror a
$09:850d  d6 11		 dec $11,x
$09:850f  18			clc
$09:8510  e1 54		 sbc ($54,x)
$09:8512  a0 a5 0c	  ldy #$0ca5
$09:8515  a3 88		 lda $88,s
$09:8517  55 60		 eor $60,x
$09:8519  ab			plb
$09:851a  0e a3 a8	  asl $a8a3
$09:851d  58			cli
$09:851e  28			plp
$09:851f  bd 07 a8	  lda $a807,x
$09:8522  af 01 78 2b   lda $2b7801
$09:8526  d2 61		 cmp ($61)
$09:8528  95 5a		 sta $5a,x
$09:852a  c6 d1		 dec $d1
$09:852c  0a			asl a
$09:852d  b5 cc		 lda $cc,x
$09:852f  de 25 a0	  dec $a025,x
$09:8532  c1 16		 cmp ($16,x)
$09:8534  c2 2d		 rep #$2d
$09:8536  83 63		 sta $63,s
$09:8538  91 d4		 sta ($d4),y
$09:853a  0e a0 a1	  asl $a1a0
$09:853d  07 18		 ora [$18]
$09:853f  54 14 02	  mvn $02,$14
$09:8542  eb			xba
$09:8543  05 09		 ora $09
$09:8545  44 3a cc	  mvp $cc,$3a
$09:8548  14 79		 trb $79
$09:854a  98			tya
$09:854b  c9 55 e8	  cmp #$e855
$09:854e  c7 3d		 cmp [$3d]
$09:8550  29 bc 13	  and #$13bc
$09:8553  e4 23		 cpx $23
$09:8555  25 39		 and $39
$09:8557  0a			asl a
$09:8558  c8			iny
$09:8559  1a			inc a
$09:855a  36 30		 rol $30,x
$09:855c  68			pla
$09:855d  dc c0 e1	  jml [$e1c0]
$09:8560  42 80		 wdm #$80
$09:8562  02 c0		 cop #$c0
$09:8564  d2 11		 cmp ($11)
$09:8566  0d 85 43	  ora $4385
$09:8569  60			rts
$09:856a  af 40 28 1b   lda $1b2840
$09:856e  c8			iny
$09:856f  1a			inc a
$09:8570  36 00		 rol $00,x
$09:8572  68			pla
$09:8573  b6 01		 ldx $01,y
$09:8575  04 2d		 tsb $2d
$09:8577  90 06		 bcc $857f
$09:8579  87 72		 sta [$72]
$09:857b  c5 9c		 cmp $9c
$09:857d  f0 f7		 beq $8576
$09:857f  3c 49 10	  bit $1049,x
$09:8582  4a			lsr a
$09:8583  8a			txa
$09:8584  40			rti
$09:8585  73 9e		 adc ($9e,s),y
$09:8587  20 38 18	  jsr $1838
$09:858a  42 2d		 wdm #$2d
$09:858c  65 51		 adc $51
$09:858e  82 7c 81	  brl $070d
$09:8591  60			rts
$09:8592  65 06		 adc $06
$09:8594  b9 b4 83	  lda $83b4,y
$09:8597  24 d7		 bit $d7
$09:8599  2a			rol a
$09:859a  b6 48		 ldx $48,y
$09:859c  8e 18 20	  stx $2018
$09:859f  d0 2f		 bne $85d0
$09:85a1  85 7e		 sta $7e
$09:85a3  04 70		 tsb $70
$09:85a5  e1 40		 sbc ($40,x)
$09:85a7  19 24 81	  ora $8124,y
$09:85aa  04 38		 tsb $38
$09:85ac  2d c9 02	  and $02c9
$09:85af  11 60		 ora ($60),y
$09:85b1  90 35		 bcc $85e8
$09:85b3  83 06		 sta $06,s
$09:85b5  5f 20 e8 07   eor $07e820,x
$09:85b9  40			rti
$09:85ba  ce 4e 32	  dec $324e
$09:85bd  8b			phb
$09:85be  69 09 65	  adc #$6509
$09:85c1  16 05		 asl $05,x
$09:85c3  06 96		 asl $96
$09:85c5  ad a4 ab	  lda $aba4
$09:85c8  12 06		 ora ($06)
$09:85ca  31 ae		 and ($ae),y
$09:85cc  7f a9 d1 6b   adc $6bd1a9,x
$09:85d0  9e 28 e7	  stz $e728,x
$09:85d3  86 b9		 stx $b9
$09:85d5  62 08 80	  per $05e0
$09:85d8  54 42 03	  mvn $03,$42
$09:85db  1c b1 45	  trb $45b1
$09:85de  32 11		 and ($11)
$09:85e0  4c 8c 53	  jmp $538c
$09:85e3  41 14		 eor ($14,x)
$09:85e5  d0 88		 bne $856f
$09:85e7  44 40 02	  mvp $02,$40
$09:85ea  60			rts
$09:85eb  12 05		 ora ($05)
$09:85ed  c2 29		 rep #$29
$09:85ef  71 8a		 adc ($8a),y
$09:85f1  60			rts
$09:85f2  22 98 18 c1   jsl $c11898
$09:85f6  c8			iny
$09:85f7  3e c3 73	  rol $73c3,x
$09:85fa  b9 45 28	  lda $2845,y
$09:85fd  24 11		 bit $11
$09:85ff  a1 0e		 lda ($0e,x)
$09:8601  44 90 64	  mvp $64,$90
$09:8604  50 20		 bvc $8626
$09:8606  80 fc		 bra $8604
$09:8608  48			pha
$09:8609  c5 b1		 cmp $b1
$09:860b  2b			pld
$09:860c  94 53		 sty $53,x
$09:860e  5c 5f 52 a0   jml $a0525f
$09:8612  1a			inc a
$09:8613  0c 7e 51	  tsb $517e
$09:8616  89 d1 cc	  bit #$ccd1
$09:8619  09 e6 74	  ora #$74e6
$09:861c  30 38		 bmi $8656
$09:861e  9d 04 0e	  sta $0e04,x
$09:8621  68			pla
$09:8622  43 10		 eor $10,s
$09:8624  81 4c		 sta ($4c,x)
$09:8626  74 20		 stz $20,x
$09:8628  74 4a		 stz $4a,x
$09:862a  a0 8c 90	  ldy #$908c
$09:862d  24 23		 bit $23
$09:862f  03 a8		 ora $a8,s
$09:8631  ec 22 85	  cpx $8522
$09:8634  e0 58 16	  cpx #$1658
$09:8637  41 52		 eor ($52,x)
$09:8639  ab			plb
$09:863a  80 51		 bra $868d
$09:863c  0a			asl a
$09:863d  3e 97 f2	  rol $f297,x
$09:8640  74 21		 stz $21,x
$09:8642  00 b6		 brk #$b6
$09:8644  d1 06		 cmp ($06),y
$09:8646  73 aa		 adc ($aa,s),y
$09:8648  b5 82		 lda $82,x
$09:864a  ad be ab	  lda $abbe
$09:864d  58			cli
$09:864e  6a			ror a
$09:864f  dc e8 a6	  jml [$a6e8]
$09:8652  f2 29		 sbc ($29)
$09:8654  bd 8a 73	  lda $738a,x
$09:8657  22 9c d8 b6   jsl $b6d89c
$09:865b  fa			plx
$09:865c  2d 60 8b	  and $8b60
$09:865f  73 a2		 adc ($a2,s),y
$09:8661  d6 18		 dec $18,x
$09:8663  a7 72		 lda [$72]
$09:8665  29 dd 8a	  and #$8add
$09:8668  7b			tdc
$09:8669  22 9e d8 14   jsl $14d89e
$09:866d  00 1e		 brk #$1e
$09:866f  51 6d		 eor ($6d),y
$09:8671  fc 53 bd	  jsr ($bd53,x)
$09:8674  14 ef		 trb $ef
$09:8676  c5 3d		 cmp $3d
$09:8678  d1 4f		 cmp ($4f),y
$09:867a  78			sei
$09:867b  44 f9 e0	  mvp $e0,$f9
$09:867e  f0 eb		 beq $866b
$09:8680  6f e8 50 0a   adc $0a50e8
$09:8684  b0 a0		 bcs $8626
$09:8686  6b			rtl
$09:8687  9f 58 e7 86   sta $86e758,x
$09:868b  b9 e2 18	  lda $18e2,y
$09:868e  80 d4		 bra $8664
$09:8690  46 03		 lsr $03
$09:8692  1c f1 04	  trb $04f1
$09:8695  4f 4d 16 d3   eor $d3164d
$09:8699  c5 ac		 cmp $ac
$09:869b  91 6b		 sta ($6b),y
$09:869d  2c 5a e9	  bit $e95a
$09:86a0  16 ba		 asl $ba,x
$09:86a2  d5 ac		 cmp $ac,x
$09:86a4  b5 6b		 lda $6b,x
$09:86a6  25 58		 and $58
$09:86a8  9c 17 4a	  stz $4a17
$09:86ab  b5 ae		 lda $ae,x
$09:86ad  2c 58 0b	  bit $0b58
$09:86b0  d9 6c 2a	  cmp $2a6c,y
$09:86b3  d6 88		 dec $88,x
$09:86b5  b5 a2		 lda $a2,x
$09:86b7  ad 78 8b	  lda $8b78
$09:86ba  5e 04 21	  lsr $2104,x
$09:86bd  96 df		 stx $df,y
$09:86bf  84 cb		 sty $cb
$09:86c1  b9 e2 ce	  lda $cee2,y
$09:86c4  78			sei
$09:86c5  7b			tdc
$09:86c6  9f 53 88 1d   sta $1d8853,x
$09:86ca  44 e0 39	  mvp $39,$e0
$09:86cd  cf ac 5b 6d   cmp $6d5bac
$09:86d1  16 db		 asl $db,x
$09:86d3  c5 b8		 cmp $b8
$09:86d5  d1 6e		 cmp ($6e),y
$09:86d7  3c 5b 09	  bit $095b,x
$09:86da  16 c2		 asl $c2,x
$09:86dc  c5 b2		 cmp $b2
$09:86de  91 6c		 sta ($6c),y
$09:86e0  ad 5b 0b	  lda $0b5b
$09:86e3  56 c2		 lsr $c2,x
$09:86e5  55 91		 eor $91,x
$09:86e7  c0 8c 0c	  cpy #$0c8c
$09:86ea  5a			phy
$09:86eb  5c 73 69 b1   jml $b16973
$09:86ef  7a			ply
$09:86f0  05 84		 ora $84
$09:86f2  ce 06 70	  dec $7006
$09:86f5  13 81		 ora ($81,s),y
$09:86f7  a4 05		 ldy $05
$09:86f9  60			rts
$09:86fa  67 01		 adc [$01]
$09:86fc  a9 f8 23	  lda #$23f8
$09:86ff  9f 4c e7 83   sta $83e74c,x
$09:8703  39 f4 1a	  and $1af4,y
$09:8706  90 9c		 bcc $86a4
$09:8708  0c e0 23	  tsb $23e0
$09:870b  28			plp
$09:870c  b6 92		 ldx $92,y
$09:870e  2d a5 51	  and $51a5
$09:8711  95 5b		 sta $5b,x
$09:8713  4b			phk
$09:8714  56 d2		 lsr $d2,x
$09:8716  28			plp
$09:8717  c9 96 66	  cmp #$6696
$09:871a  a1 53		 lda ($53,x)
$09:871c  92 8d		 sta ($8d)
$09:871e  98			tya
$09:871f  23 bf		 and $bf,s
$09:8721  8e 6c e3	  stx $e36c
$09:8724  9d 38 e7	  sta $e738,x
$09:8727  0e 39 e3	  asl $e339
$09:872a  ae 74 eb	  ldx $eb74
$09:872d  9b			txy
$09:872e  3a			dec a
$09:872f  e3 d8		 sbc $d8,s
$09:8731  38			sec
$09:8732  75 c1		 adc $c1,x
$09:8734  90 0c		 bcc $8742
$09:8736  83 e9		 sta $e9,s
$09:8738  5c f0 4d 25   jml $254df0
$09:873c  93 49		 sta ($49,s),y
$09:873e  6c d3 81	  jmp ($81d3)
$09:8741  34 e8		 bit $e8,x
$09:8743  01 cf		 ora ($cf,x)
$09:8745  a3 74		 lda $74,s
$09:8747  e0 4d a5	  cpx #$a54d
$09:874a  93 69		 sta ($69,s),y
$09:874c  6c db 83	  jmp ($83db)
$09:874f  36 d9		 rol $d9,x
$09:8751  77 3e		 adc [$3e],y
$09:8753  9d cf 03	  sta $03cf,x
$09:8756  fc 82 e7	  jsr ($e782,x)
$09:8759  b2 bb		 lda ($bb)
$09:875b  70 63		 bvs $87c0
$09:875d  17 21		 ora [$21],y
$09:875f  78			sei
$09:8760  c5 a3		 cmp $a3
$09:8762  11 71		 ora ($71),y
$09:8764  78			sei
$09:8765  ce 86 63	  dec $6386
$09:8768  19 86 6d	  ora $6d86,y
$09:876b  21 9b		 and ($9b,x)
$09:876d  58			cli
$09:876e  67 12		 adc [$12]
$09:8770  19 e5 86	  ora $86e5,y
$09:8773  75 21		 adc $21,x
$09:8775  9d 52 19	  sta $1952,x
$09:8778  90 13		 bcc $878d
$09:877a  8a			txa
$09:877b  41 1f		 eor ($1f,x)
$09:877d  21 54		 and ($54,x)
$09:877f  7c b9 ce	  jmp ($ceb9,x)
$09:8782  1e 73 c7	  asl $c773,x
$09:8785  9c d9 e7	  stz $e7d9
$09:8788  3a			dec a
$09:8789  7d cf 1f	  adc $1fcf,x
$09:878c  73 87		 adc ($87,s),y
$09:878e  dc 33 03	  jml [$0333]
$09:8791  e8			inx
$09:8792  3c 4a f0	  bit $f04a,x
$09:8795  37 92		 and [$92],y
$09:8797  bc 4e 85	  ldy $854e,x
$09:879a  e2 ee		 sep #$ee
$09:879c  78			sei
$09:879d  b3 9e		 lda ($9e,s),y
$09:879f  13 f9		 ora ($f9,s),y
$09:87a1  21 45		 and ($45,x)
$09:87a3  08			php
$09:87a4  47 44		 eor [$44]
$09:87a6  5a			phy
$09:87a7  02 e0		 cop #$e0
$09:87a9  12 c2		 ora ($c2)
$09:87ab  af 27 f9 88   lda $88f927
$09:87af  83 c0		 sta $c0,s
$09:87b1  21 01		 and ($01,x)
$09:87b3  0a			asl a
$09:87b4  41 3f		 eor ($3f,x)
$09:87b6  b4 4f		 ldy $4f,x
$09:87b8  ee 13 fb	  inc $fb13
$09:87bb  c4 fe		 cpy $fe
$09:87bd  c4 3f		 cpy $3f
$09:87bf  d5 0f		 cmp $0f,x
$09:87c1  f6 43		 inc $43,x
$09:87c3  fd d0 ff	  sbc $ffd0,x
$09:87c6  44 ac d1	  mvp $d1,$ac
$09:87c9  2b			pld
$09:87ca  3c 4a ed	  bit $ed4a,x
$09:87cd  12 bb		 ora ($bb)
$09:87cf  c1 be		 cmp ($be,x)
$09:87d1  f4 6f bc	  pea $bc6f
$09:87d4  1b			tcs
$09:87d5  f1 46		 sbc ($46),y
$09:87d7  fc 41 bf	  jsr ($bf41,x)
$09:87da  34 6f		 bit $6f,x
$09:87dc  cc 1b f5	  cpy $f51b
$09:87df  46 fd		 lsr $fd
$09:87e1  41 3f		 eor ($3f,x)
$09:87e3  f4 4f fe	  pea $fe4f
$09:87e6  13 ff		 ora ($ff,s),y
$09:87e8  c4 ff		 cpy $ff
$09:87ea  c1 3f		 cmp ($3f,x)
$09:87ec  94 4f		 sty $4f,x
$09:87ee  e6 13		 inc $13
$09:87f0  f9 c4 fe	  sbc $fec4,y
$09:87f3  41 3f		 eor ($3f,x)
$09:87f5  74 4f		 stz $4f,x
$09:87f7  de 13 f7	  dec $f713,x
$09:87fa  c4 fd		 cpy $fd
$09:87fc  80 68		 bra $8866
$09:87fe  cf dd 00 00   cmp $0000dd
$09:8802  01 00		 ora ($00,x)
$09:8804  10 00		 bpl $8806
$09:8806  11 00		 ora ($00),y
$09:8808  02 18		 cop #$18
$09:880a  03 18		 ora $18,s
$09:880c  12 18		 ora ($18)
$09:880e  13 18		 ora ($18,s),y
$09:8810  04 14		 tsb $14
$09:8812  05 14		 ora $14
$09:8814  14 14		 trb $14
$09:8816  15 14		 ora $14,x
$09:8818  06 18		 asl $18
$09:881a  07 18		 ora [$18]
$09:881c  16 18		 asl $18,x
$09:881e  17 18		 ora [$18],y
$09:8820  08			php
$09:8821  18			clc
$09:8822  09 18		 ora #$18
$09:8824  18			clc
$09:8825  18			clc
$09:8826  19 18 0a	  ora $0a18,y
$09:8829  18			clc
$09:882a  0b			phd
$09:882b  18			clc
$09:882c  1a			inc a
$09:882d  18			clc
$09:882e  1b			tcs
$09:882f  18			clc
$09:8830  0c 18 0d	  tsb $0d18
$09:8833  18			clc
$09:8834  1c 18 1d	  trb $1d18
$09:8837  18			clc
$09:8838  0e 18 0f	  asl $0f18
$09:883b  18			clc
$09:883c  1e 18 1f	  asl $1f18,x
$09:883f  18			clc
$09:8840  20 14 21	  jsr $2114
$09:8843  14 30		 trb $30
$09:8845  14 31		 trb $31
$09:8847  14 22		 trb $22
$09:8849  10 23		 bpl $886e
$09:884b  10 32		 bpl $887f
$09:884d  10 33		 bpl $8882
$09:884f  10 24		 bpl $8875
$09:8851  0c 25 0c	  tsb $0c25
$09:8854  34 0c		 bit $0c,x
$09:8856  35 0c		 and $0c,x
$09:8858  26 04		 rol $04
$09:885a  27 04		 and [$04]
$09:885c  36 04		 rol $04,x
$09:885e  37 04		 and [$04],y
$09:8860  28			plp
$09:8861  14 29		 trb $29
$09:8863  14 38		 trb $38
$09:8865  14 39		 trb $39
$09:8867  14 2a		 trb $2a
$09:8869  14 2b		 trb $2b
$09:886b  14 3a		 trb $3a
$09:886d  14 3b		 trb $3b
$09:886f  14 2c		 trb $2c
$09:8871  14 2d		 trb $2d
$09:8873  14 3c		 trb $3c
$09:8875  14 3d		 trb $3d
$09:8877  14 2e		 trb $2e
$09:8879  14 2f		 trb $2f
$09:887b  14 3e		 trb $3e
$09:887d  14 3f		 trb $3f
$09:887f  14 40		 trb $40
$09:8881  0c 41 0c	  tsb $0c41
$09:8884  50 0c		 bvc $8892
$09:8886  51 0c		 eor ($0c),y
$09:8888  42 04		 wdm #$04
$09:888a  43 04		 eor $04,s
$09:888c  52 04		 eor ($04)
$09:888e  53 04		 eor ($04,s),y
$09:8890  44 04 45	  mvp $45,$04
$09:8893  04 54		 tsb $54
$09:8895  04 55		 tsb $55
$09:8897  04 46		 tsb $46
$09:8899  08			php
$09:889a  47 08		 eor [$08]
$09:889c  56 08		 lsr $08,x
$09:889e  57 08		 eor [$08],y
$09:88a0  48			pha
$09:88a1  04 49		 tsb $49
$09:88a3  04 58		 tsb $58
$09:88a5  04 59		 tsb $59
$09:88a7  04 4a		 tsb $4a
$09:88a9  04 4b		 tsb $4b
$09:88ab  04 5a		 tsb $5a
$09:88ad  04 5b		 tsb $5b
$09:88af  04 4c		 tsb $4c
$09:88b1  08			php
$09:88b2  4d 08 5c	  eor $5c08
$09:88b5  08			php
$09:88b6  5d 08 4e	  eor $4e08,x
$09:88b9  04 4f		 tsb $4f
$09:88bb  04 5e		 tsb $5e
$09:88bd  04 5f		 tsb $5f
$09:88bf  04 60		 tsb $60
$09:88c1  04 61		 tsb $61
$09:88c3  04 70		 tsb $70
$09:88c5  04 71		 tsb $71
$09:88c7  04 62		 tsb $62
$09:88c9  08			php
$09:88ca  63 08		 adc $08,s
$09:88cc  72 08		 adc ($08)
$09:88ce  73 08		 adc ($08,s),y
$09:88d0  64 18		 stz $18
$09:88d2  65 18		 adc $18
$09:88d4  74 18		 stz $18,x
$09:88d6  75 18		 adc $18,x
$09:88d8  66 18		 ror $18
$09:88da  67 18		 adc [$18]
$09:88dc  76 18		 ror $18,x
$09:88de  77 18		 adc [$18],y
$09:88e0  68			pla
$09:88e1  10 69		 bpl $894c
$09:88e3  10 78		 bpl $895d
$09:88e5  10 79		 bpl $8960
$09:88e7  10 6a		 bpl $8953
$09:88e9  08			php
$09:88ea  6b			rtl
$09:88eb  08			php
$09:88ec  7a			ply
$09:88ed  08			php
$09:88ee  7b			tdc
$09:88ef  08			php
$09:88f0  6c 08 6d	  jmp ($6d08)
$09:88f3  08			php
$09:88f4  7c 08 7d	  jmp ($7d08,x)
$09:88f7  08			php
$09:88f8  6e 18 6f	  ror $6f18
$09:88fb  18			clc
$09:88fc  7e 18 7f	  ror $7f18,x
$09:88ff  18			clc
$09:8900  80 0c		 bra $890e
$09:8902  81 0c		 sta ($0c,x)
$09:8904  90 0c		 bcc $8912
$09:8906  91 0c		 sta ($0c),y
$09:8908  82 14 83	  brl $0c1f
$09:890b  14 92		 trb $92
$09:890d  14 93		 trb $93
$09:890f  14 84		 trb $84
$09:8911  18			clc
$09:8912  85 18		 sta $18
$09:8914  94 18		 sty $18,x
$09:8916  95 18		 sta $18,x
$09:8918  86 10		 stx $10
$09:891a  87 10		 sta [$10]
$09:891c  96 10		 stx $10,y
$09:891e  97 10		 sta [$10],y
$09:8920  88			dey
$09:8921  10 89		 bpl $88ac
$09:8923  10 98		 bpl $88bd
$09:8925  10 99		 bpl $88c0
$09:8927  10 8a		 bpl $88b3
$09:8929  08			php
$09:892a  8b			phb
$09:892b  08			php
$09:892c  9a			txs
$09:892d  08			php
$09:892e  9b			txy
$09:892f  08			php
$09:8930  8c 08 8d	  sty $8d08
$09:8933  08			php
$09:8934  9c 08 9d	  stz $9d08
$09:8937  08			php
$09:8938  8e 10 8f	  stx $8f10
$09:893b  10 9e		 bpl $88db
$09:893d  10 9f		 bpl $88de
$09:893f  10 a0		 bpl $88e1
$09:8941  10 a1		 bpl $88e4
$09:8943  10 b0		 bpl $88f5
$09:8945  10 b1		 bpl $88f8
$09:8947  10 a2		 bpl $88eb
$09:8949  10 a3		 bpl $88ee
$09:894b  10 b2		 bpl $88ff
$09:894d  10 b3		 bpl $8902
$09:894f  10 a4		 bpl $88f5
$09:8951  04 a5		 tsb $a5
$09:8953  04 b4		 tsb $b4
$09:8955  04 b5		 tsb $b5
$09:8957  04 a6		 tsb $a6
$09:8959  10 a7		 bpl $8902
$09:895b  10 b6		 bpl $8913
$09:895d  10 b7		 bpl $8916
$09:895f  10 a8		 bpl $8909
$09:8961  08			php
$09:8962  a9 08		 lda #$08
$09:8964  b8			clv
$09:8965  08			php
$09:8966  b9 08 aa	  lda $aa08,y
$09:8969  0c ab 0c	  tsb $0cab
$09:896c  ba			tsx
$09:896d  0c bb 0c	  tsb $0cbb
$09:8970  ac 18 ad	  ldy $ad18
$09:8973  18			clc
$09:8974  bc 18 bd	  ldy $bd18,x
$09:8977  18			clc
$09:8978  ae 10 af	  ldx $af10
$09:897b  10 be		 bpl $893b
$09:897d  10 bf		 bpl $893e
$09:897f  10 c0		 bpl $8941
$09:8981  0c c1 0c	  tsb $0cc1
$09:8984  d0 0c		 bne $8992
$09:8986  d1 0c		 cmp ($0c),y
$09:8988  c2 14		 rep #$14
$09:898a  c3 14		 cmp $14,s
$09:898c  d2 14		 cmp ($14)
$09:898e  d3 14		 cmp ($14,s),y
$09:8990  c4 04		 cpy $04
$09:8992  c5 04		 cmp $04
$09:8994  d4 04		 pei ($04)
$09:8996  d5 04		 cmp $04,x
$09:8998  c6 04		 dec $04
$09:899a  c7 04		 cmp [$04]
$09:899c  d6 04		 dec $04,x
$09:899e  d7 04		 cmp [$04],y
$09:89a0  c8			iny
$09:89a1  04 c9		 tsb $c9
$09:89a3  04 d8		 tsb $d8
$09:89a5  04 d9		 tsb $d9
$09:89a7  04 ca		 tsb $ca
$09:89a9  10 cb		 bpl $8976
$09:89ab  10 da		 bpl $8987
$09:89ad  10 db		 bpl $898a
$09:89af  10 ca		 bpl $897b
$09:89b1  0c cb 0c	  tsb $0ccb
$09:89b4  da			phx
$09:89b5  0c db 0c	  tsb $0cdb
$09:89b8  ca			dex
$09:89b9  14 cb		 trb $cb
$09:89bb  14 da		 trb $da
$09:89bd  14 db		 trb $db
$09:89bf  14 e2		 trb $e2
$09:89c1  08			php
$09:89c2  e3 08		 sbc $08,s
$09:89c4  f2 08		 sbc ($08)
$09:89c6  f3 08		 sbc ($08,s),y
$09:89c8  cc 10 cd	  cpy $cd10
$09:89cb  10 dc		 bpl $89a9
$09:89cd  10 dd		 bpl $89ac
$09:89cf  10 e0		 bpl $89b1
$09:89d1  04 e1		 tsb $e1
$09:89d3  04 f0		 tsb $f0
$09:89d5  04 f1		 tsb $f1
$09:89d7  04 e0		 tsb $e0
$09:89d9  08			php
$09:89da  e1 08		 sbc ($08,x)
$09:89dc  f0 08		 beq $89e6
$09:89de  f1 08		 sbc ($08),y
$09:89e0  e0 0c e1	  cpx #$e10c
$09:89e3  0c f0 0c	  tsb $0cf0
$09:89e6  f1 0c		 sbc ($0c),y
$09:89e8  e0 10 e1	  cpx #$e110
$09:89eb  10 f0		 bpl $89dd
$09:89ed  10 f1		 bpl $89e0
$09:89ef  10 e0		 bpl $89d1
$09:89f1  14 e1		 trb $e1
$09:89f3  14 f0		 trb $f0
$09:89f5  14 f1		 trb $f1
$09:89f7  14 e0		 trb $e0
$09:89f9  18			clc
$09:89fa  e1 18		 sbc ($18,x)
$09:89fc  f0 18		 beq $8a16
$09:89fe  f1 18		 sbc ($18),y
$09:8a00  ce 10 cf	  dec $cf10
$09:8a03  10 de		 bpl $89e3
$09:8a05  10 df		 bpl $89e6
$09:8a07  10 eb		 bpl $89f4
$09:8a09  5c ee 1c fb   jml $fb1cee
$09:8a0d  5c fe 1c ef   jml $ef1cfe
$09:8a11  1c eb 1c	  trb $1ceb
$09:8a14  ff 1c fb 1c   sbc $1cfb1c,x
$09:8a18  ed 1c eb	  sbc $eb1c
$09:8a1b  1c fd 1c	  trb $1cfd
$09:8a1e  fb			xce
$09:8a1f  1c eb 5c	  trb $5ceb
$09:8a22  ed 5c fb	  sbc $fb5c
$09:8a25  5c fd 5c ed   jml $ed5cfd
$09:8a29  1c ed 1c	  trb $1ced
$09:8a2c  fd 1c fd	  sbc $fd1c,x
$09:8a2f  1c ed 5c	  trb $5ced
$09:8a32  ed 5c fd	  sbc $fd5c
$09:8a35  5c fd 5c e8   jml $e85cfd
$09:8a39  5c ed 1c f8   jml $f81ced
$09:8a3d  5c fd 1c ed   jml $ed1cfd
$09:8a41  5c e8 1c fd   jml $fd1ce8
$09:8a45  5c f8 1c e9   jml $e91cf8
$09:8a49  1c ea 1c	  trb $1cea
$09:8a4c  f9 1c fa	  sbc $fa1c,y
$09:8a4f  1c ea 5c	  trb $5cea
$09:8a52  e9 5c		 sbc #$5c
$09:8a54  fa			plx
$09:8a55  5c f9 5c f9   jml $f95cf9
$09:8a59  9c fa 9c	  stz $9cfa
$09:8a5c  e9 9c		 sbc #$9c
$09:8a5e  ea			nop
$09:8a5f  9c fa dc	  stz $dcfa
$09:8a62  f9 dc ea	  sbc $eadc,y
$09:8a65  dc e9 dc	  jml [$dce9]
$09:8a68  e7 1c		 sbc [$1c]
$09:8a6a  ec 1c f7	  cpx $f71c
$09:8a6d  1c fc 1c	  trb $1cfc
$09:8a70  ec 1c e5	  cpx $e51c
$09:8a73  5c fc 1c f5   jml $f51cfc
$09:8a77  5c e5 1c ec   jml $ec1ce5
$09:8a7b  1c f5 1c	  trb $1cf5
$09:8a7e  fc 1c ec	  jsr ($ec1c,x)
$09:8a81  1c f5 dc	  trb $dcf5
$09:8a84  fc 1c e5	  jsr ($e51c,x)
$09:8a87  dc f5 9c	  jml [$9cf5]
$09:8a8a  ec 1c e5	  cpx $e51c
$09:8a8d  9c fc 1c	  stz $1cfc
$09:8a90  e4 1c		 cpx $1c
$09:8a92  e4 1c		 cpx $1c
$09:8a94  e4 1c		 cpx $1c
$09:8a96  e4 1c		 cpx $1c
$09:8a98  ec 1c e6	  cpx $e61c
$09:8a9b  1c fc 1c	  trb $1cfc
$09:8a9e  f6 1c		 inc $1c,x
$09:8aa0  00 00		 brk #$00
$09:8aa2  00 00		 brk #$00
$09:8aa4  00 00		 brk #$00
$09:8aa6  00 00		 brk #$00
$09:8aa8  00 00		 brk #$00
$09:8aaa  00 00		 brk #$00
$09:8aac  00 00		 brk #$00
$09:8aae  00 00		 brk #$00
$09:8ab0  00 00		 brk #$00
$09:8ab2  00 00		 brk #$00
$09:8ab4  00 00		 brk #$00
$09:8ab6  00 00		 brk #$00
$09:8ab8  00 00		 brk #$00
$09:8aba  00 00		 brk #$00
$09:8abc  00 00		 brk #$00
$09:8abe  00 00		 brk #$00
$09:8ac0  00 00		 brk #$00
$09:8ac2  00 00		 brk #$00
$09:8ac4  00 00		 brk #$00
$09:8ac6  00 00		 brk #$00
$09:8ac8  00 00		 brk #$00
$09:8aca  00 00		 brk #$00
$09:8acc  00 00		 brk #$00
$09:8ace  00 00		 brk #$00
$09:8ad0  00 00		 brk #$00
$09:8ad2  00 00		 brk #$00
$09:8ad4  00 00		 brk #$00
$09:8ad6  00 00		 brk #$00
$09:8ad8  00 00		 brk #$00
$09:8ada  00 00		 brk #$00
$09:8adc  00 00		 brk #$00
$09:8ade  00 00		 brk #$00
$09:8ae0  00 00		 brk #$00
$09:8ae2  00 00		 brk #$00
$09:8ae4  00 00		 brk #$00
$09:8ae6  00 00		 brk #$00
$09:8ae8  00 00		 brk #$00
$09:8aea  00 00		 brk #$00
$09:8aec  00 00		 brk #$00
$09:8aee  00 00		 brk #$00
$09:8af0  00 00		 brk #$00
$09:8af2  00 00		 brk #$00
$09:8af4  00 00		 brk #$00
$09:8af6  00 00		 brk #$00
$09:8af8  00 00		 brk #$00
$09:8afa  00 00		 brk #$00
$09:8afc  00 00		 brk #$00
$09:8afe  00 00		 brk #$00
$09:8b00  00 00		 brk #$00
$09:8b02  00 00		 brk #$00
$09:8b04  00 00		 brk #$00
$09:8b06  00 00		 brk #$00
$09:8b08  00 00		 brk #$00
$09:8b0a  00 00		 brk #$00
$09:8b0c  00 00		 brk #$00
$09:8b0e  00 00		 brk #$00
$09:8b10  00 00		 brk #$00
$09:8b12  00 00		 brk #$00
$09:8b14  00 00		 brk #$00
$09:8b16  00 00		 brk #$00
$09:8b18  00 00		 brk #$00
$09:8b1a  00 00		 brk #$00
$09:8b1c  00 00		 brk #$00
$09:8b1e  00 00		 brk #$00
$09:8b20  00 00		 brk #$00
$09:8b22  00 00		 brk #$00
$09:8b24  00 00		 brk #$00
$09:8b26  00 00		 brk #$00
$09:8b28  00 00		 brk #$00
$09:8b2a  00 00		 brk #$00
$09:8b2c  00 00		 brk #$00
$09:8b2e  00 00		 brk #$00
$09:8b30  00 00		 brk #$00
$09:8b32  00 00		 brk #$00
$09:8b34  00 00		 brk #$00
$09:8b36  00 00		 brk #$00
$09:8b38  00 00		 brk #$00
$09:8b3a  00 00		 brk #$00
$09:8b3c  00 00		 brk #$00
$09:8b3e  00 00		 brk #$00
$09:8b40  00 00		 brk #$00
$09:8b42  00 00		 brk #$00
$09:8b44  00 00		 brk #$00
$09:8b46  00 00		 brk #$00
$09:8b48  00 00		 brk #$00
$09:8b4a  00 00		 brk #$00
$09:8b4c  00 00		 brk #$00
$09:8b4e  00 00		 brk #$00
$09:8b50  00 00		 brk #$00
$09:8b52  00 00		 brk #$00
$09:8b54  00 00		 brk #$00
$09:8b56  00 00		 brk #$00
$09:8b58  00 00		 brk #$00
$09:8b5a  00 00		 brk #$00
$09:8b5c  00 00		 brk #$00
$09:8b5e  00 00		 brk #$00
$09:8b60  00 00		 brk #$00
$09:8b62  00 00		 brk #$00
$09:8b64  00 00		 brk #$00
$09:8b66  00 00		 brk #$00
$09:8b68  00 00		 brk #$00
$09:8b6a  00 00		 brk #$00
$09:8b6c  00 00		 brk #$00
$09:8b6e  00 00		 brk #$00
$09:8b70  00 00		 brk #$00
$09:8b72  00 00		 brk #$00
$09:8b74  00 00		 brk #$00
$09:8b76  00 00		 brk #$00
$09:8b78  00 00		 brk #$00
$09:8b7a  00 00		 brk #$00
$09:8b7c  00 00		 brk #$00
$09:8b7e  00 00		 brk #$00
$09:8b80  00 00		 brk #$00
$09:8b82  00 00		 brk #$00
$09:8b84  00 00		 brk #$00
$09:8b86  00 00		 brk #$00
$09:8b88  00 00		 brk #$00
$09:8b8a  00 00		 brk #$00
$09:8b8c  00 00		 brk #$00
$09:8b8e  00 00		 brk #$00
$09:8b90  00 00		 brk #$00
$09:8b92  00 00		 brk #$00
$09:8b94  00 00		 brk #$00
$09:8b96  00 00		 brk #$00
$09:8b98  00 00		 brk #$00
$09:8b9a  00 00		 brk #$00
$09:8b9c  00 00		 brk #$00
$09:8b9e  00 00		 brk #$00
$09:8ba0  00 00		 brk #$00
$09:8ba2  00 00		 brk #$00
$09:8ba4  00 00		 brk #$00
$09:8ba6  00 00		 brk #$00
$09:8ba8  00 00		 brk #$00
$09:8baa  00 00		 brk #$00
$09:8bac  00 00		 brk #$00
$09:8bae  00 00		 brk #$00
$09:8bb0  00 00		 brk #$00
$09:8bb2  00 00		 brk #$00
$09:8bb4  00 00		 brk #$00
$09:8bb6  00 00		 brk #$00
$09:8bb8  00 00		 brk #$00
$09:8bba  00 00		 brk #$00
$09:8bbc  00 00		 brk #$00
$09:8bbe  00 00		 brk #$00
$09:8bc0  00 00		 brk #$00
$09:8bc2  00 00		 brk #$00
$09:8bc4  00 00		 brk #$00
$09:8bc6  00 00		 brk #$00
$09:8bc8  00 00		 brk #$00
$09:8bca  00 00		 brk #$00
$09:8bcc  00 00		 brk #$00
$09:8bce  00 00		 brk #$00
$09:8bd0  00 00		 brk #$00
$09:8bd2  00 00		 brk #$00
$09:8bd4  00 00		 brk #$00
$09:8bd6  00 00		 brk #$00
$09:8bd8  00 00		 brk #$00
$09:8bda  00 00		 brk #$00
$09:8bdc  00 00		 brk #$00
$09:8bde  00 00		 brk #$00
$09:8be0  00 00		 brk #$00
$09:8be2  00 00		 brk #$00
$09:8be4  00 00		 brk #$00
$09:8be6  00 00		 brk #$00
$09:8be8  00 00		 brk #$00
$09:8bea  00 00		 brk #$00
$09:8bec  00 00		 brk #$00
$09:8bee  00 00		 brk #$00
$09:8bf0  00 00		 brk #$00
$09:8bf2  00 00		 brk #$00
$09:8bf4  00 00		 brk #$00
$09:8bf6  00 00		 brk #$00
$09:8bf8  00 00		 brk #$00
$09:8bfa  00 00		 brk #$00
$09:8bfc  00 00		 brk #$00
$09:8bfe  00 00		 brk #$00
$09:8c00  00 00		 brk #$00
$09:8c02  00 00		 brk #$00
$09:8c04  00 00		 brk #$00
$09:8c06  00 00		 brk #$00
$09:8c08  00 00		 brk #$00
$09:8c0a  00 00		 brk #$00
$09:8c0c  00 00		 brk #$00
$09:8c0e  00 00		 brk #$00
$09:8c10  00 00		 brk #$00
$09:8c12  00 00		 brk #$00
$09:8c14  00 00		 brk #$00
$09:8c16  00 00		 brk #$00
$09:8c18  00 00		 brk #$00
$09:8c1a  00 00		 brk #$00
$09:8c1c  00 00		 brk #$00
$09:8c1e  00 00		 brk #$00
$09:8c20  00 ff		 brk #$ff
$09:8c22  00 ff		 brk #$ff
$09:8c24  00 00		 brk #$00
$09:8c26  fa			plx
$09:8c27  ff 00 00 ce   sbc $ce0000,x
$09:8c2b  30 3b		 bmi $8c68
$09:8c2d  f7 d6		 sbc [$d6],y
$09:8c2f  21 00		 and ($00,x)
$09:8c31  00 00		 brk #$00
$09:8c33  00 00		 brk #$00
$09:8c35  ff 00 ff 00   sbc $00ff00,x
$09:8c39  ff ff 00 ff   sbc $ff00ff,x
$09:8c3d  00 ff		 brk #$ff
$09:8c3f  00 00		 brk #$00
$09:8c41  ff 00 ff 00   sbc $00ff00,x
$09:8c45  00 ff		 brk #$ff
$09:8c47  ff 00 00 f4   sbc $f40000,x
$09:8c4b  00 ff		 brk #$ff
$09:8c4d  ff 17 e8 00   sbc $00e817,x
$09:8c51  00 00		 brk #$00
$09:8c53  00 00		 brk #$00
$09:8c55  ff 00 ff 00   sbc $00ff00,x
$09:8c59  ff ff 00 ff   sbc $ff00ff,x
$09:8c5d  00 ff		 brk #$ff
$09:8c5f  00 40		 brk #$40
$09:8c61  00 00		 brk #$00
$09:8c63  00 08		 brk #$08
$09:8c65  00 00		 brk #$00
$09:8c67  00 00		 brk #$00
$09:8c69  00 00		 brk #$00
$09:8c6b  00 22		 brk #$22
$09:8c6d  00 00		 brk #$00
$09:8c6f  00 00		 brk #$00
$09:8c71  ff 00 ff 00   sbc $00ff00,x
$09:8c75  ff 00 ff 00   sbc $00ff00,x
$09:8c79  ff 00 ff 00   sbc $00ff00,x
$09:8c7d  ff 00 ff 58   sbc $58ff00,x
$09:8c81  c3 3b		 cmp $3b,s
$09:8c83  12 9a		 ora ($9a)
$09:8c85  53 13		 eor ($13,s),y
$09:8c87  22 52 06 a6   jsl $a60652
$09:8c8b  4f 4e 1f b5   eor $b51f4e
$09:8c8f  de 23 fc	  dec $fc23,x
$09:8c92  c3 fc		 cmp $fc,s
$09:8c94  23 fc		 and $fc,s
$09:8c96  c7 f8		 cmp [$f8]
$09:8c98  0f f0 0f f0   ora $f00ff0
$09:8c9c  1f e0 ff 00   ora $00ffe0,x
$09:8ca0  63 92		 adc $92,s
$09:8ca2  13 82		 ora ($82,s),y
$09:8ca4  72 e3		 adc ($e3)
$09:8ca6  15 82		 ora $82,x
$09:8ca8  16 e3		 asl $e3,x
$09:8caa  67 82		 adc [$82]
$09:8cac  04 82		 tsb $82
$09:8cae  01 92		 ora ($92,x)
$09:8cb0  07 78		 ora [$78]
$09:8cb2  67 78		 adc [$78]
$09:8cb4  07 78		 ora [$78]
$09:8cb6  67 78		 adc [$78]
$09:8cb8  07 78		 ora [$78]
$09:8cba  07 78		 ora [$78]
$09:8cbc  07 78		 ora [$78]
$09:8cbe  07 78		 ora [$78]
$09:8cc0  00 da		 brk #$da
$09:8cc2  3a			dec a
$09:8cc3  c5 d6		 cmp $d6
$09:8cc5  36 23		 rol $23,x
$09:8cc7  fc 16 eb	  jsr ($eb16,x)
$09:8cca  5c ff d8 27   jml $27d8ff
$09:8cce  dd dd 00	  cmp $00dd,x
$09:8cd1  25 00		 and $00
$09:8cd3  ff 09 ff 00   sbc $00ff09,x
$09:8cd7  ff 00 ff 00   sbc $00ff00,x
$09:8cdb  ff 00 ff 22   sbc $22ff00,x
$09:8cdf  ff 00 69 d6   sbc $d66900,x
$09:8ce3  21 27		 and ($27,x)
$09:8ce5  99 19 fe	  sta $fe19,y
$09:8ce8  c0 ff d7	  cpy #$d7ff
$09:8ceb  38			sec
$09:8cec  2c df a7	  bit $a7df
$09:8cef  a7 00		 lda [$00]
$09:8cf1  96 00		 stx $00,y
$09:8cf3  ff 00 ff 00   sbc $00ff00,x
$09:8cf7  ff 00 ff 00   sbc $00ff00,x
$09:8cfb  ff 00 ff 58   sbc $58ff00,x
$09:8cff  ff 00 da c5   sbc $c5da00,x
$09:8d03  00 29		 brk #$29
$09:8d05  1f dc 20 e9   ora $e920dc,x
$09:8d09  02 a3		 cop #$a3
$09:8d0b  5c 27 00 22   jml $220027
$09:8d0f  ff 00 25 00   sbc $002500,x
$09:8d13  ff 00 ff 00   sbc $00ff00,x
$09:8d17  ff 00 ff 00   sbc $00ff00,x
$09:8d1b  ff 00 ff 00   sbc $00ff00,x
$09:8d1f  ff 00 69 21   sbc $216900,x
$09:8d23  00 9b		 brk #$9b
$09:8d25  06 ea		 asl $ea
$09:8d27  1c 3f c0	  trb $c03f
$09:8d2a  28			plp
$09:8d2b  10 d3		 bpl $8d00
$09:8d2d  0c 58 ff	  tsb $ff58
$09:8d30  00 96		 brk #$96
$09:8d32  00 ff		 brk #$ff
$09:8d34  00 ff		 brk #$ff
$09:8d36  00 ff		 brk #$ff
$09:8d38  00 ff		 brk #$ff
$09:8d3a  00 ff		 brk #$ff
$09:8d3c  00 ff		 brk #$ff
$09:8d3e  00 ff		 brk #$ff
$09:8d40  00 00		 brk #$00
$09:8d42  be 41 4f	  ldx $4f41,y
$09:8d45  f0 f7		 beq $8d3e
$09:8d47  18			clc
$09:8d48  f8			sed
$09:8d49  07 2f		 ora [$2f]
$09:8d4b  f0 e4		 beq $8d31
$09:8d4d  1f ff 00 00   ora $0000ff,x
$09:8d51  ff 00 ff 00   sbc $00ff00,x
$09:8d55  ff 00 ff 00   sbc $00ff00,x
$09:8d59  ff 00 ff 00   sbc $00ff00,x
$09:8d5d  ff 00 ff 7e   sbc $7eff00,x
$09:8d61  a9 fd		 lda #$fd
$09:8d63  56 fe		 lsr $fe,x
$09:8d65  af ab 54 ff   lda $ff54ab
$09:8d69  aa			tax
$09:8d6a  a8			tay
$09:8d6b  75 fe		 adc $fe,x
$09:8d6d  89 ef		 bit #$ef
$09:8d6f  5c 28 01 04   jml $040128
$09:8d73  01 8e		 ora ($8e,x)
$09:8d75  01 00		 ora ($00,x)
$09:8d77  01 22		 ora ($22,x)
$09:8d79  01 20		 ora ($20,x)
$09:8d7b  03 08		 ora $08,s
$09:8d7d  03 4c		 ora $4c,s
$09:8d7f  03 14		 ora $14,s
$09:8d81  cb			wai
$09:8d82  c2 07		 rep #$07
$09:8d84  22 57 a8 30   jsl $30a857
$09:8d88  5b			tcd
$09:8d89  97 ef		 sta [$ef],y
$09:8d8b  b0 68		 bcs $8df5
$09:8d8d  30 b8		 bmi $8d47
$09:8d8f  e0 07 30	  cpx #$3007
$09:8d92  0f f0 87 f8   ora $f887f0
$09:8d96  40			rti
$09:8d97  ff 20 ff 00   sbc $00ff20,x
$09:8d9b  ff 80 ff 00   sbc $00ff80,x
$09:8d9f  ff 58 c0 38   sbc $38c058,x
$09:8da3  10 9b		 bpl $8d40
$09:8da5  57 17		 eor [$17],y
$09:8da7  20 50 00	  jsr $0050
$09:8daa  82 41 9e	  brl $2bee
$09:8dad  47 55		 eor [$55]
$09:8daf  2e 20 ff	  rol $ff20
$09:8db2  c0 ff 20	  cpy #$20ff
$09:8db5  ff c0 ff 00   sbc $00ffc0,x
$09:8db9  ff 07 f8 0f   sbc $0ff807,x
$09:8dbd  b0 ff		 bcs $8dbe
$09:8dbf  00 58		 brk #$58
$09:8dc1  c0 38 10	  cpy #$1038
$09:8dc4  9b			txy
$09:8dc5  53 13		 eor ($13,s),y
$09:8dc7  20 54 00	  jsr $0054
$09:8dca  82 41 92	  brl $200e
$09:8dcd  47 05		 eor [$05]
$09:8dcf  d2 20		 cmp ($20)
$09:8dd1  ff c0 ff 20   sbc $20ffc0,x
$09:8dd5  ff c0 ff 00   sbc $00ffc0,x
$09:8dd9  ff 07 f8 07   sbc $07f807,x
$09:8ddd  b8			clv
$09:8dde  07 38		 ora [$38]
$09:8de0  ab			plb
$09:8de1  14 3f		 trb $3f
$09:8de3  ff 18 18 18   sbc $181818,x
$09:8de7  18			clc
$09:8de8  18			clc
$09:8de9  a5 3c		 lda $3c
$09:8deb  42 56		 wdm #$56
$09:8ded  80 00		 bra $8def
$09:8def  80 ff		 bra $8df0
$09:8df1  00 ff		 brk #$ff
$09:8df3  00 e7		 brk #$e7
$09:8df5  3c 24 ff	  bit $ff24,x
$09:8df8  00 ff		 brk #$ff
$09:8dfa  00 ff		 brk #$ff
$09:8dfc  00 7f		 brk #$7f
$09:8dfe  00 7f		 brk #$7f
$09:8e00  80 ff		 bra $8e01
$09:8e02  04 fb		 tsb $fb
$09:8e04  24 df		 bit $df
$09:8e06  20 ff 02	  jsr $02ff
$09:8e09  ff 80 7f 48   sbc $487f80,x
$09:8e0d  f7 04		 sbc [$04],y
$09:8e0f  ff ff 00 ff   sbc $ff00ff,x
$09:8e13  00 ff		 brk #$ff
$09:8e15  00 ff		 brk #$ff
$09:8e17  00 ff		 brk #$ff
$09:8e19  00 ff		 brk #$ff
$09:8e1b  00 ff		 brk #$ff
$09:8e1d  00 ff		 brk #$ff
$09:8e1f  00 08		 brk #$08
$09:8e21  ff 04 db 44   sbc $44db04,x
$09:8e25  ff 40 bf 02   sbc $02bf40,x
$09:8e29  fd 90 ff	  sbc $ff90,x
$09:8e2c  40			rti
$09:8e2d  bf 12 ef ff   lda $ffef12,x
$09:8e31  00 ff		 brk #$ff
$09:8e33  00 ff		 brk #$ff
$09:8e35  00 ff		 brk #$ff
$09:8e37  00 ff		 brk #$ff
$09:8e39  00 ff		 brk #$ff
$09:8e3b  00 ff		 brk #$ff
$09:8e3d  00 ff		 brk #$ff
$09:8e3f  00 48		 brk #$48
$09:8e41  af 56 e7 14   lda $14e756
$09:8e45  f3 68		 sbc ($68,s),y
$09:8e47  d7 4c		 cmp [$4c],y
$09:8e49  ff 92 ef 22   sbc $22ef92,x
$09:8e4d  fd 48 f7	  sbc $f748,x
$09:8e50  ff 00 ff 00   sbc $00ff00,x
$09:8e54  ff 00 ff 00   sbc $00ff00,x
$09:8e58  ff 00 ff 00   sbc $00ff00,x
$09:8e5c  ff 00 ff 00   sbc $00ff00,x
$09:8e60  ff 00 cd ff   sbc $ffcd00,x
$09:8e64  fe 00 00	  inc $0000,x
$09:8e67  00 fe		 brk #$fe
$09:8e69  00 fe		 brk #$fe
$09:8e6b  00 02		 brk #$02
$09:8e6d  fc 02 f8	  jsr ($f802,x)
$09:8e70  00 ff		 brk #$ff
$09:8e72  00 ff		 brk #$ff
$09:8e74  00 ff		 brk #$ff
$09:8e76  00 ff		 brk #$ff
$09:8e78  00 ff		 brk #$ff
$09:8e7a  00 ff		 brk #$ff
$09:8e7c  00 03		 brk #$03
$09:8e7e  00 07		 brk #$07
$09:8e80  02 fc		 cop #$fc
$09:8e82  42 fe		 wdm #$fe
$09:8e84  11 fe		 ora ($fe),y
$09:8e86  02 fc		 cop #$fc
$09:8e88  0d fe 02	  ora $02fe
$09:8e8b  fc 25 fa	  jsr ($fa25,x)
$09:8e8e  02 fc		 cop #$fc
$09:8e90  ff 00 ff 00   sbc $00ff00,x
$09:8e94  ff 00 ff 00   sbc $00ff00,x
$09:8e98  ff 00 ff 00   sbc $00ff00,x
$09:8e9c  ff 00 ff 00   sbc $00ff00,x
$09:8ea0  02 d3		 cop #$d3
$09:8ea2  17 d2		 ora [$d2],y
$09:8ea4  05 d2		 ora $d2
$09:8ea6  16 d0		 asl $d0,x
$09:8ea8  13 d6		 ora ($d6,s),y
$09:8eaa  12 d7		 ora ($d7)
$09:8eac  15 d2		 ora $d2,x
$09:8eae  15 d2		 ora $d2,x
$09:8eb0  07 38		 ora [$38]
$09:8eb2  07 38		 ora [$38]
$09:8eb4  07 38		 ora [$38]
$09:8eb6  07 38		 ora [$38]
$09:8eb8  07 38		 ora [$38]
$09:8eba  07 38		 ora [$38]
$09:8ebc  07 38		 ora [$38]
$09:8ebe  07 38		 ora [$38]
$09:8ec0  00 da		 brk #$da
$09:8ec2  6b			rtl
$09:8ec3  9a			txs
$09:8ec4  5e a1 5a	  lsr $5aa1,x
$09:8ec7  bf 6d b3 5f   lda $5fb36d,x
$09:8ecb  b8			clv
$09:8ecc  56 af		 lsr $af,x
$09:8ece  3c fc 00	  bit $00fc,x
$09:8ed1  25 04		 and $04
$09:8ed3  7f 00 7f 00   adc $007f00,x
$09:8ed7  7f 00 7f 00   adc $007f00,x
$09:8edb  7f 00 7f 03   adc $037f00,x
$09:8edf  7f 00 69 5f   adc $5f6900,x
$09:8ee3  a2 ae d3	  ldx #$d3ae
$09:8ee6  65 e4		 adc $e4
$09:8ee8  e2 1f		 sep #$1f
$09:8eea  b4 cd		 ldy $cd,x
$09:8eec  6a			ror a
$09:8eed  97 3c		 sta [$3c],y
$09:8eef  3d 00 96	  and $9600,x
$09:8ef2  00 ff		 brk #$ff
$09:8ef4  00 fe		 brk #$fe
$09:8ef6  1a			inc a
$09:8ef7  ff 00 fe 02   sbc $02fe00,x
$09:8efb  fe 00 fe	  inc $fe00,x
$09:8efe  c2 fe		 rep #$fe
$09:8f00  00 da		 brk #$da
$09:8f02  6b			rtl
$09:8f03  9a			txs
$09:8f04  5e a1 5a	  lsr $5aa1,x
$09:8f07  bf 6d b3 7f   lda $7fb36d,x
$09:8f0b  98			tya
$09:8f0c  56 af		 lsr $af,x
$09:8f0e  3c fc 00	  bit $00fc,x
$09:8f11  25 04		 and $04
$09:8f13  7f 00 7f 00   adc $007f00,x
$09:8f17  7f 00 7f 00   adc $007f00,x
$09:8f1b  7f 00 7f 03   adc $037f00,x
$09:8f1f  7f 00 69 a0   adc $a06900,x
$09:8f23  02 50		 cop #$50
$09:8f25  83 9a		 sta $9a,s
$09:8f27  7e 1c 03	  ror $031c,x
$09:8f2a  4a			lsr a
$09:8f2b  87 94		 sta [$94]
$09:8f2d  03 c2		 ora $c2,s
$09:8f2f  ff 00 96 00   sbc $009600,x
$09:8f33  ff 00 fe 00   sbc $00fe00,x
$09:8f37  ff 00 fe 00   sbc $00fe00,x
$09:8f3b  fe 00 fe	  inc $fe00,x
$09:8f3e  00 fe		 brk #$fe
$09:8f40  f8			sed
$09:8f41  07 eb		 ora [$eb]
$09:8f43  1c 2d f3	  trb $f32d
$09:8f46  e9 1e fb	  sbc #$fb1e
$09:8f49  04 91		 tsb $91
$09:8f4b  7e 6a f9	  ror $f96a,x
$09:8f4e  00 7f		 brk #$7f
$09:8f50  00 ff		 brk #$ff
$09:8f52  00 ff		 brk #$ff
$09:8f54  00 ff		 brk #$ff
$09:8f56  00 ff		 brk #$ff
$09:8f58  00 ff		 brk #$ff
$09:8f5a  00 ff		 brk #$ff
$09:8f5c  04 ff		 tsb $ff
$09:8f5e  00 80		 brk #$80
$09:8f60  7a			ply
$09:8f61  b7 f5		 lda [$f5],y
$09:8f63  6b			rtl
$09:8f64  fa			plx
$09:8f65  af ce 73 7b   lda $7b73ce
$09:8f69  9d 4e bf	  sta $bf4e,x
$09:8f6c  20 01 e9	  jsr $e901
$09:8f6f  7e 30 0e	  ror $0e30,x
$09:8f72  60			rts
$09:8f73  1e a8 16	  asl $16a8,x
$09:8f76  40			rti
$09:8f77  be 00 fe	  ldx $fe00,y
$09:8f7a  00 fe		 brk #$fe
$09:8f7c  00 fe		 brk #$fe
$09:8f7e  00 7f		 brk #$7f
$09:8f80  2b			pld
$09:8f81  8c 27 b7	  sty $b727
$09:8f84  16 39		 asl $39,x
$09:8f86  29 99 1a	  and #$1a99
$09:8f89  40			rti
$09:8f8a  64 82		 stz $82
$09:8f8c  aa			tax
$09:8f8d  c1 c0		 cmp ($c0,x)
$09:8f8f  eb			xba
$09:8f90  10 7f		 bpl $9011
$09:8f92  08			php
$09:8f93  7f 00 ff 06   adc $06ff00,x
$09:8f97  ff 00 bf c0   sbc $c0bf00,x
$09:8f9b  3f e0 1f e0   and $e01fe0,x
$09:8f9f  1c 58 c3	  trb $c358
$09:8fa2  3b			tsc
$09:8fa3  12 9a		 ora ($9a)
$09:8fa5  53 13		 eor ($13,s),y
$09:8fa7  22 56 02 82   jsl $820256
$09:8fab  43 92		 eor $92,s
$09:8fad  47 05		 eor [$05]
$09:8faf  d2 23		 cmp ($23)
$09:8fb1  fc c3 fc	  jsr ($fcc3,x)
$09:8fb4  23 fc		 and $fc,s
$09:8fb6  c3 fc		 cmp $fc,s
$09:8fb8  03 fc		 ora $fc,s
$09:8fba  07 f8		 ora [$f8]
$09:8fbc  07 b8		 ora [$b8]
$09:8fbe  07 38		 ora [$38]
$09:8fc0  30 cf		 bmi $8f91
$09:8fc2  fb			xce
$09:8fc3  06 74		 asl $74
$09:8fc5  8f b3 7c 1f   sta $1f7cb3
$09:8fc9  e0 eb 1c	  cpx #$1ceb
$09:8fcc  fa			plx
$09:8fcd  07 00		 ora [$00]
$09:8fcf  00 00		 brk #$00
$09:8fd1  ff 00 ff 00   sbc $00ff00,x
$09:8fd5  ff 00 ff 00   sbc $00ff00,x
$09:8fd9  ff 00 ff 00   sbc $00ff00,x
$09:8fdd  ff 00 ff 00   sbc $00ff00,x
$09:8fe1  00 3f		 brk #$3f
$09:8fe3  c0 d3 3c	  cpy #$3cd3
$09:8fe6  fa			plx
$09:8fe7  07 2a		 ora [$2a]
$09:8fe9  fd f7 0c	  sbc $0cf7,x
$09:8fec  ca			dex
$09:8fed  f7 cb		 sbc [$cb],y
$09:8fef  3c 00 ff	  bit $ff00,x
$09:8ff2  00 ff		 brk #$ff
$09:8ff4  00 ff		 brk #$ff
$09:8ff6  00 ff		 brk #$ff
$09:8ff8  00 ff		 brk #$ff
$09:8ffa  00 ff		 brk #$ff
$09:8ffc  00 ff		 brk #$ff
$09:8ffe  00 ff		 brk #$ff
$09:9000  10 ef		 bpl $8ff1
$09:9002  22 ff 01 fe   jsl $fe01ff
$09:9006  44 bf 41	  mvp $41,$bf
$09:9009  ff 02 fd 28   sbc $28fd02,x
$09:900d  df 08 f7 ff   cmp $fff708,x
$09:9011  00 ff		 brk #$ff
$09:9013  00 ff		 brk #$ff
$09:9015  00 ff		 brk #$ff
$09:9017  00 ff		 brk #$ff
$09:9019  00 ff		 brk #$ff
$09:901b  00 ff		 brk #$ff
$09:901d  00 ff		 brk #$ff
$09:901f  00 00		 brk #$00
$09:9021  ff 08 f7 02   sbc $02f708,x
$09:9025  ff 08 ff 48   sbc $48ff08,x
$09:9029  bf 41 fa 10   lda $10fa41,x
$09:902d  ef 08 ff ff   sbc $ffff08
$09:9031  00 ff		 brk #$ff
$09:9033  00 ff		 brk #$ff
$09:9035  00 ff		 brk #$ff
$09:9037  00 ff		 brk #$ff
$09:9039  00 ff		 brk #$ff
$09:903b  00 ff		 brk #$ff
$09:903d  00 ff		 brk #$ff
$09:903f  00 16		 brk #$16
$09:9041  d3 16		 cmp ($16,s),y
$09:9043  d3 16		 cmp ($16,s),y
$09:9045  d3 17		 cmp ($17,s),y
$09:9047  d2 16		 cmp ($16)
$09:9049  d3 17		 cmp ($17,s),y
$09:904b  d2 17		 cmp ($17)
$09:904d  d2 17		 cmp ($17)
$09:904f  d2 07		 cmp ($07)
$09:9051  38			sec
$09:9052  07 38		 ora [$38]
$09:9054  07 38		 ora [$38]
$09:9056  07 38		 ora [$38]
$09:9058  07 38		 ora [$38]
$09:905a  07 38		 ora [$38]
$09:905c  07 38		 ora [$38]
$09:905e  07 38		 ora [$38]
$09:9060  01 07		 ora ($07,x)
$09:9062  f3 08		 sbc ($08,s),y
$09:9064  f0 04		 beq $906a
$09:9066  72 f0		 adc ($f0)
$09:9068  ba			tsx
$09:9069  f8			sed
$09:906a  fe 00 fe	  inc $fe00,x
$09:906d  00 00		 brk #$00
$09:906f  00 00		 brk #$00
$09:9071  ff 00 f7 00   sbc $00f700,x
$09:9075  fb			xce
$09:9076  00 ff		 brk #$ff
$09:9078  00 ff		 brk #$ff
$09:907a  00 ff		 brk #$ff
$09:907c  00 ff		 brk #$ff
$09:907e  00 ff		 brk #$ff
$09:9080  02 fc		 cop #$fc
$09:9082  46 b8		 lsr $b8
$09:9084  46 f0		 lsr $f0
$09:9086  1a			inc a
$09:9087  e4 1b		 cpx $1b
$09:9089  fc 02 fc	  jsr ($fc02,x)
$09:908c  0b			phd
$09:908d  f4 46 b0	  pea $b046
$09:9090  ff 00 ff 00   sbc $00ff00,x
$09:9094  ff 00 ff 00   sbc $00ff00,x
$09:9098  ff 00 ff 00   sbc $00ff00,x
$09:909c  ff 00 ff 00   sbc $00ff00,x
$09:90a0  18			clc
$09:90a1  db			stp
$09:90a2  18			clc
$09:90a3  db			stp
$09:90a4  24 42		 bit $42
$09:90a6  2e ff 14	  rol $14ff
$09:90a9  00 4a		 brk #$4a
$09:90ab  32 ff		 and ($ff)
$09:90ad  ff ab 14 24   sbc $2414ab,x
$09:90b1  3c 24 3c	  bit $3c24,x
$09:90b4  00 ff		 brk #$ff
$09:90b6  00 ff		 brk #$ff
$09:90b8  00 ff		 brk #$ff
$09:90ba  fd 00 ff	  sbc $ff00,x
$09:90bd  00 ff		 brk #$ff
$09:90bf  00 00		 brk #$00
$09:90c1  ff ae 51 5b   sbc $5b51ae,x
$09:90c5  2c ad 15	  bit $15ad
$09:90c8  04 ab		 tsb $ab
$09:90ca  cb			wai
$09:90cb  a4 55		 ldy $55
$09:90cd  aa			tax
$09:90ce  3c eb 00	  bit $00eb,x
$09:90d1  00 00		 brk #$00
$09:90d3  bf 00 df 02   lda $02df00,x
$09:90d7  ef 00 f7 00   sbc $00f700
$09:90db  fb			xce
$09:90dc  00 fd		 brk #$fd
$09:90de  00 fe		 brk #$fe
$09:90e0  29 87 12	  and #$1287
$09:90e3  c0 44 a9	  cpy #$a944
$09:90e6  23 96		 and $96,s
$09:90e8  52 a9		 eor ($a9)
$09:90ea  2a			rol a
$09:90eb  c4 65		 cpy $65
$09:90ed  ca			dex
$09:90ee  3c e3 00	  bit $00e3,x
$09:90f1  7f 00 3f 00   adc $003f00,x
$09:90f5  5f 00 6f 00   eor $006f00,x
$09:90f9  77 00		 adc [$00],y
$09:90fb  7b			tdc
$09:90fc  00 7d		 brk #$7d
$09:90fe  00 7e		 brk #$7e
$09:9100  c0 80 84	  cpy #$8480
$09:9103  84 a8		 sty $a8
$09:9105  a0 c0 c0	  ldy #$c0c0
$09:9108  c8			iny
$09:9109  c8			iny
$09:910a  c0 c0 e2	  cpy #$e2c0
$09:910d  c0 00 00	  cpy #$0000
$09:9110  80 ff		 bra $9111
$09:9112  84 7b		 sty $7b
$09:9114  a0 5f c0	  ldy #$c05f
$09:9117  3f c8 b7 c0   and $c0b7c8,x
$09:911b  bf c0 3f 80   lda $803fc0,x
$09:911f  ff 01 fe 3c   sbc $3cfe01,x
$09:9123  01 cf		 ora ($cf,x)
$09:9125  00 f8		 brk #$f8
$09:9127  05 bf		 ora $bf
$09:9129  00 70		 brk #$70
$09:912b  09 e7 00	  ora #$00e7
$09:912e  9f 00 00 01   sta $010000,x
$09:9132  00 fe		 brk #$fe
$09:9134  00 ff		 brk #$ff
$09:9136  00 fe		 brk #$fe
$09:9138  00 ff		 brk #$ff
$09:913a  00 fe		 brk #$fe
$09:913c  00 ff		 brk #$ff
$09:913e  00 ff		 brk #$ff
$09:9140  24 db		 bit $db
$09:9142  0a			asl a
$09:9143  ff 28 f0 47   sbc $47f028,x
$09:9147  a0 70 c0	  ldy #$c070
$09:914a  6f 80 1f 80   adc $801f80
$09:914e  bf 00 ff 00   lda $00ff00,x
$09:9152  ff 00 ff 00   sbc $00ff00,x
$09:9156  ff 07 f0 1f   sbc $1ff007,x
$09:915a  e0 30 c0	  cpx #$c030
$09:915d  20 e0 20	  jsr $20e0
$09:9160  04 fb		 tsb $fb
$09:9162  b2 cf		 lda ($cf)
$09:9164  a8			tay
$09:9165  37 e0		 and [$e0],y
$09:9167  07 09		 ora [$09]
$09:9169  03 f6		 ora $f6,s
$09:916b  01 f8		 ora ($f8,x)
$09:916d  01 fc		 ora ($fc,x)
$09:916f  00 ff		 brk #$ff
$09:9171  00 ff		 brk #$ff
$09:9173  00 ff		 brk #$ff
$09:9175  00 ff		 brk #$ff
$09:9177  e0 0f f8	  cpx #$f80f
$09:917a  07 0c		 ora [$0c]
$09:917c  03 04		 ora $04,s
$09:917e  05 06		 ora $06
$09:9180  40			rti
$09:9181  c9 4d c6	  cmp #$c64d
$09:9184  55 c6		 eor $c6,x
$09:9186  54 c6 98	  mvn $98,$c6
$09:9189  8e a8 8e	  stx $8ea8
$09:918c  a2 8e b1	  ldx #$b18e
$09:918f  9f 3f 00 39   sta $39003f,x
$09:9193  00 39		 brk #$39
$09:9195  00 39		 brk #$39
$09:9197  00 71		 brk #$71
$09:9199  00 71		 brk #$71
$09:919b  00 71		 brk #$71
$09:919d  00 60		 brk #$60
$09:919f  00 80		 brk #$80
$09:91a1  d4 36		 pei ($36)
$09:91a3  e2 30		 sep #$30
$09:91a5  e2 44		 sep #$44
$09:91a7  a6 d1		 ldx $d1
$09:91a9  36 9b		 rol $9b,x
$09:91ab  3e 03 3e	  rol $3e03,x
$09:91ae  02 3e		 cop #$3e
$09:91b0  ff 00 dd 00   sbc $00dd00,x
$09:91b4  dd 00 d9	  cmp $d900,x
$09:91b7  00 c9		 brk #$c9
$09:91b9  00 c1		 brk #$c1
$09:91bb  00 c1		 brk #$c1
$09:91bd  00 81		 brk #$81
$09:91bf  40			rti
$09:91c0  00 00		 brk #$00
$09:91c2  ff 00 ff 00   sbc $00ff00,x
$09:91c6  c9 36		 cmp #$36
$09:91c8  a4 ff		 ldy $ff
$09:91ca  24 92		 bit $92
$09:91cc  7f 7f 7f 80   adc $807f7f,x
$09:91d0  00 ff		 brk #$ff
$09:91d2  00 ff		 brk #$ff
$09:91d4  ff ff 6d 80   sbc $806dff,x
$09:91d8  6d 80 6d	  adc $6d80
$09:91db  92 80		 sta ($80)
$09:91dd  ff 00 ff 00   sbc $00ff00,x
$09:91e1  00 ff		 brk #$ff
$09:91e3  00 ff		 brk #$ff
$09:91e5  00 25		 brk #$25
$09:91e7  da			phx
$09:91e8  93 ff		 sta ($ff,s),y
$09:91ea  93 49		 sta ($49,s),y
$09:91ec  fe fe fe	  inc $fefe,x
$09:91ef  01 00		 ora ($00,x)
$09:91f1  ff 00 ff ff   sbc $ffff00,x
$09:91f5  ff b6 01 b6   sbc $b601b6,x
$09:91f9  01 b6		 ora ($b6,x)
$09:91fb  49 01		 eor #$01
$09:91fd  ff 00 ff ff   sbc $ffff00,x
$09:9201  00 9a		 brk #$9a
$09:9203  ff 64 9b 00   sbc $009b64,x
$09:9207  ff 00 ff ff   sbc $ffff00,x
$09:920b  00 26		 brk #$26
$09:920d  ff 00 ff ff   sbc $ffff00,x
$09:9211  ff ff ff ff   sbc $ffffff,x
$09:9215  ff ff ff ff   sbc $ffffff,x
$09:9219  ff ff ff ff   sbc $ffffff,x
$09:921d  ff 00 00 ff   sbc $ff0000,x
$09:9221  00 2f		 brk #$2f
$09:9223  ff ff 00 00   sbc $0000ff,x
$09:9227  00 ff		 brk #$ff
$09:9229  00 ff		 brk #$ff
$09:922b  00 c0		 brk #$c0
$09:922d  3f c0 1f 00   and $001fc0,x
$09:9231  ff 00 ff 00   sbc $00ff00,x
$09:9235  ff 00 ff 00   sbc $00ff00,x
$09:9239  ff 00 ff 00   sbc $00ff00,x
$09:923d  c0 00		 cpy #$00
$09:923f  e0 ff		 cpx #$ff
$09:9241  00 cd		 brk #$cd
$09:9243  ff ff 00 00   sbc $0000ff,x
$09:9247  00 ff		 brk #$ff
$09:9249  00 ff		 brk #$ff
$09:924b  00 03		 brk #$03
$09:924d  fc 03 f8	  jsr ($f803,x)
$09:9250  00 ff		 brk #$ff
$09:9252  00 ff		 brk #$ff
$09:9254  00 ff		 brk #$ff
$09:9256  00 ff		 brk #$ff
$09:9258  00 ff		 brk #$ff
$09:925a  00 ff		 brk #$ff
$09:925c  00 03		 brk #$03
$09:925e  00 07		 brk #$07
$09:9260  ab			plb
$09:9261  8c a7 b7	  sty $b7a7
$09:9264  96 39		 stx $39,y
$09:9266  a9 19		 lda #$19
$09:9268  1a			inc a
$09:9269  c0 85		 cpy #$85
$09:926b  90 e9		 bcc $9256
$09:926d  c2 e1		 rep #$e1
$09:926f  f3 90		 sbc ($90,s),y
$09:9271  7f 88 7f 80   adc $807f88,x
$09:9275  7f 86 7f 80   adc $807f86,x
$09:9279  3f c0 3f e0   and $e03fc0,x
$09:927d  1f ff 00 a0   ora $a000ff,x
$09:9281  43 df		 eor $df,s
$09:9283  80 a4		 bra $9229
$09:9285  14 05		 trb $05
$09:9287  2a			rol a
$09:9288  23 93		 and $93,s
$09:928a  2e 09 35	  rol $3509
$09:928d  9e 0c a4	  stz $a40c,x
$09:9290  e0 1c		 cpx #$1c
$09:9292  c0 3f		 cpy #$3f
$09:9294  8b			phb
$09:9295  7f 10 ff 0c   adc $0cff10,x
$09:9299  ff 10 ff 00   sbc $00ff10,x
$09:929d  7f 13 7f 0d   adc $0d7f13,x
$09:92a1  e2 c2		 sep #$c2
$09:92a3  03 26		 ora $26,s
$09:92a5  53 ab		 eor ($ab,s),y
$09:92a7  32 5a		 and ($5a)
$09:92a9  93 eb		 sta ($eb,s),y
$09:92ab  b2 6b		 lda ($6b)
$09:92ad  32 ba		 and ($ba)
$09:92af  e3 07		 sbc $07,s
$09:92b1  18			clc
$09:92b2  07 f8		 ora [$f8]
$09:92b4  83 fc		 sta $fc,s
$09:92b6  43 fc		 eor $fc,s
$09:92b8  23 fc		 and $fc,s
$09:92ba  03 fc		 ora $fc,s
$09:92bc  83 fc		 sta $fc,s
$09:92be  03 fc		 ora $fc,s
$09:92c0  f6 ab		 inc $ab,x
$09:92c2  54 83 aa	  mvn $aa,$83
$09:92c5  7d e8 5b	  adc $5be8,x
$09:92c8  6e 95 fa	  ror $fa95
$09:92cb  97 cc		 sta [$cc],y
$09:92cd  a1 4a		 lda ($4a,x)
$09:92cf  37 00		 and [$00],y
$09:92d1  fe 28 fe	  inc $fe28,x
$09:92d4  00 fe		 brk #$fe
$09:92d6  04 fe		 tsb $fe
$09:92d8  00 fe		 brk #$fe
$09:92da  00 fe		 brk #$fe
$09:92dc  12 fe		 ora ($fe)
$09:92de  80 fe		 bra $92de
$09:92e0  08			php
$09:92e1  a3 aa		 lda $aa,s
$09:92e3  29 54 29	  and #$2954
$09:92e6  14 4f		 trb $4f
$09:92e8  90 05		 bcc $92ef
$09:92ea  04 93		 tsb $93
$09:92ec  32 93		 and ($93)
$09:92ee  b4 83		 ldy $83,x
$09:92f0  00 fe		 brk #$fe
$09:92f2  00 fe		 brk #$fe
$09:92f4  00 fe		 brk #$fe
$09:92f6  00 fc		 brk #$fc
$09:92f8  00 fe		 brk #$fe
$09:92fa  00 fe		 brk #$fe
$09:92fc  00 fe		 brk #$fe
$09:92fe  00 fe		 brk #$fe
$09:9300  c0 80		 cpy #$80
$09:9302  c0 c0		 cpy #$c0
$09:9304  88			dey
$09:9305  80 c0		 bra $92c7
$09:9307  c0 c2		 cpy #$c2
$09:9309  c2 90		 rep #$90
$09:930b  90 a2		 bcc $92af
$09:930d  80 80		 bra $928f
$09:930f  80 80		 bra $9291
$09:9311  7f c0 3f 80   adc $803fc0,x
$09:9315  7f c0 bf c2   adc $c2bfc0,x
$09:9319  3d 90 6f	  and $6f90,x
$09:931c  80 7f		 bra $939d
$09:931e  80 7f		 bra $939f
$09:9320  ff 00 ff 00   sbc $00ff00,x
$09:9324  fc 03 21	  jsr ($2103,x)
$09:9327  00 c8		 brk #$c8
$09:9329  01 ff		 ora ($ff,x)
$09:932b  00 65		 brk #$65
$09:932d  9a			txs
$09:932e  00 ff		 brk #$ff
$09:9330  00 ff		 brk #$ff
$09:9332  00 ff		 brk #$ff
$09:9334  00 fe		 brk #$fe
$09:9336  00 ff		 brk #$ff
$09:9338  00 fe		 brk #$fe
$09:933a  00 ff		 brk #$ff
$09:933c  00 ff		 brk #$ff
$09:933e  00 00		 brk #$00
$09:9340  80 7f		 bra $93c1
$09:9342  a0 df 08	  ldy #$08df
$09:9345  ff 82 f3 a8   sbc $a8f382,x
$09:9349  d8			cld
$09:934a  a2 54 91	  ldx #$9154
$09:934d  e0 1f ff	  cpx #$ff1f
$09:9350  80 a0		 bra $92f2
$09:9352  80 a0		 bra $92f4
$09:9354  80 a0		 bra $92f6
$09:9356  8c a0 87	  sty $87a0
$09:9359  a0 8f a0	  ldy #$a08f
$09:935c  9f 80 00 00   sta $000080,x
$09:9360  04 fb		 tsb $fb
$09:9362  05 fa		 ora $fa
$09:9364  05 fa		 ora $fa
$09:9366  01 fe		 ora ($fe,x)
$09:9368  85 fa		 sta $fa
$09:936a  25 3a		 and $3a
$09:936c  48			pha
$09:936d  0f fc ff 00   ora $00fffc
$09:9371  04 01		 tsb $01
$09:9373  05 01		 ora $01
$09:9375  05 01		 ora $01
$09:9377  05 01		 ora $01
$09:9379  05 c1		 ora $c1
$09:937b  05 f1		 ora $f1
$09:937d  01 00		 ora ($00,x)
$09:937f  00 64		 brk #$64
$09:9381  fb			xce
$09:9382  08			php
$09:9383  e3 80		 sbc $80,s
$09:9385  5d 2a dd	  eor $dd2a,x
$09:9388  94 c9		 sty $c9,x
$09:938a  40			rti
$09:938b  bf aa 37 22   lda $2237aa,x
$09:938f  95 00		 sta $00,x
$09:9391  0c 00 1c	  tsb $1c00
$09:9394  00 a2		 brk #$a2
$09:9396  00 be		 brk #$be
$09:9398  00 be		 brk #$be
$09:939a  00 c0		 brk #$c0
$09:939c  00 fe		 brk #$fe
$09:939e  00 fe		 brk #$fe
$09:93a0  08			php
$09:93a1  e3 aa		 sbc $aa,s
$09:93a3  29 54 29	  and #$2954
$09:93a6  14 4f		 trb $4f
$09:93a8  90 05		 bcc $93af
$09:93aa  04 93		 tsb $93
$09:93ac  32 93		 and ($93)
$09:93ae  b4 83		 ldy $83,x
$09:93b0  00 3c		 brk #$3c
$09:93b2  00 fe		 brk #$fe
$09:93b4  00 fe		 brk #$fe
$09:93b6  00 fc		 brk #$fc
$09:93b8  00 fe		 brk #$fe
$09:93ba  00 fe		 brk #$fe
$09:93bc  00 fe		 brk #$fe
$09:93be  00 fe		 brk #$fe
$09:93c0  a8			tay
$09:93c1  43 df		 eor $df,s
$09:93c3  80 a4		 bra $9369
$09:93c5  94 85		 sty $85,x
$09:93c7  aa			tax
$09:93c8  23 93		 and $93,s
$09:93ca  ae 89 35	  ldx $3589
$09:93cd  9e 0c a4	  stz $a40c,x
$09:93d0  e0 1c c0	  cpx #$c01c
$09:93d3  3f 8b 7f 90   and $907f8b,x
$09:93d7  7f 8c 7f 90   adc $907f8c,x
$09:93db  7f 80 7f 93   adc $937f80,x
$09:93df  7f 93 48 25   adc $254893,x
$09:93e3  da			phx
$09:93e4  b7 da		 lda [$da],y
$09:93e6  ff 92 b7 da   sbc $dab792,x
$09:93ea  db			stp
$09:93eb  48			pha
$09:93ec  17 16		 ora [$16],y
$09:93ee  ff 00 b6 01   sbc $01b600,x
$09:93f2  b6 01		 ldx $01,y
$09:93f4  b6 01		 ldx $01,y
$09:93f6  b6 49		 ldx $49,y
$09:93f8  b6 49		 ldx $49,y
$09:93fa  b6 49		 ldx $49,y
$09:93fc  e8			inx
$09:93fd  ff 00 ff ff   sbc $ffff00,x
$09:9401  00 f3		 brk #$f3
$09:9403  ff 30 cf 48   sbc $48cf30,x
$09:9407  b7 e2		 lda [$e2],y
$09:9409  1d ff 00	  ora $00ff,x
$09:940c  ff ff 00 ff   sbc $ff00ff,x
$09:9410  ff ff ff ff   sbc $ffffff,x
$09:9414  ff ff ff ff   sbc $ffffff,x
$09:9418  ff ff ff ff   sbc $ffffff,x
$09:941c  ff ff 00 00   sbc $0000ff,x
$09:9420  40			rti
$09:9421  e0 cf 10	  cpx #$10cf
$09:9424  0f 20 c0 0f   ora $0fc020
$09:9428  c0 1f ff	  cpy #$ff1f
$09:942b  00 ff		 brk #$ff
$09:942d  00 00		 brk #$00
$09:942f  00 00		 brk #$00
$09:9431  ff 00 ef 00   sbc $00ef00,x
$09:9435  df 00 ff 00   cmp $00ff00,x
$09:9439  ff 00 ff 00   sbc $00ff00,x
$09:943d  ff 00 ff 00   sbc $00ff00,x
$09:9441  07 f3		 ora [$f3]
$09:9443  08			php
$09:9444  f0 04		 beq $944a
$09:9446  b3 f0		 lda ($f0,s),y
$09:9448  5b			tcd
$09:9449  f8			sed
$09:944a  ff 00 ff 00   sbc $00ff00,x
$09:944e  00 00		 brk #$00
$09:9450  00 ff		 brk #$ff
$09:9452  00 f7		 brk #$f7
$09:9454  00 fb		 brk #$fb
$09:9456  00 ff		 brk #$ff
$09:9458  00 ff		 brk #$ff
$09:945a  00 ff		 brk #$ff
$09:945c  00 ff		 brk #$ff
$09:945e  00 ff		 brk #$ff
$09:9460  2b			pld
$09:9461  8c 27 b7	  sty $b727
$09:9464  16 39		 asl $39,x
$09:9466  29 99 1a	  and #$1a99
$09:9469  40			rti
$09:946a  a4 00		 ldy $00
$09:946c  f2 e0		 sbc ($e0)
$09:946e  f9 fe 10	  sbc $10fe,y
$09:9471  7f 08 7f 00   adc $007f08,x
$09:9475  ff 06 ff 00   sbc $00ff06,x
$09:9479  bf e0 1f f8   lda $f81fe0,x
$09:947d  07 ff		 ora [$ff]
$09:947f  00 5e		 brk #$5e
$09:9481  b7 ae		 lda [$ae],y
$09:9483  c5 92		 cmp $92
$09:9485  7f 68 bd ec   adc $ecbd68,x
$09:9489  ad 34 75	  lda $7534
$09:948c  f6 bf		 inc $bf,x
$09:948e  58			cli
$09:948f  cd 00 fe	  cmp $fe00
$09:9492  10 fe		 bpl $9492
$09:9494  00 fe		 brk #$fe
$09:9496  02 fe		 cop #$fe
$09:9498  12 fe		 ora ($fe)
$09:949a  8a			txa
$09:949b  fe 00 fe	  inc $fe00,x
$09:949e  22 fe a0 17   jsl $17a0fe
$09:94a2  50 95		 bvc $9439
$09:94a4  6c 13 96	  jmp ($9613)
$09:94a7  2b			pld
$09:94a8  12 bf		 ora ($bf)
$09:94aa  ca			dex
$09:94ab  bf 08 b7 a6   lda $a6b708,x
$09:94af  6b			rtl
$09:94b0  00 fe		 brk #$fe
$09:94b2  00 fe		 brk #$fe
$09:94b4  00 fe		 brk #$fe
$09:94b6  00 fe		 brk #$fe
$09:94b8  00 fe		 brk #$fe
$09:94ba  00 fe		 brk #$fe
$09:94bc  00 fe		 brk #$fe
$09:94be  00 fe		 brk #$fe
$09:94c0  da			phx
$09:94c1  a7 2c		 lda [$2c]
$09:94c3  f9 5e eb	  sbc $eb5e,y
$09:94c6  90 a5		 bcc $946d
$09:94c8  64 d9		 stz $d9
$09:94ca  7a			ply
$09:94cb  df a4 6d 00   cmp $006da4,x
$09:94cf  d3 00		 cmp ($00,s),y
$09:94d1  fe 02 fe	  inc $fe02,x
$09:94d4  00 fe		 brk #$fe
$09:94d6  4a			lsr a
$09:94d7  fe 02 fe	  inc $fe02,x
$09:94da  00 fe		 brk #$fe
$09:94dc  12 fe		 ora ($fe)
$09:94de  00 2c		 brk #$2c
$09:94e0  24 83		 bit $83
$09:94e2  d2 2b		 cmp ($2b)
$09:94e4  a0 4b 6e	  ldy #$6e4b
$09:94e7  cb			wai
$09:94e8  9a			txs
$09:94e9  43 84		 eor $84,s
$09:94eb  5b			tcd
$09:94ec  5a			phy
$09:94ed  37 00		 and [$00],y
$09:94ef  ff 00 fe 00   sbc $00fe00,x
$09:94f3  fe 00 fe	  inc $fe00,x
$09:94f6  00 fe		 brk #$fe
$09:94f8  00 fe		 brk #$fe
$09:94fa  00 fe		 brk #$fe
$09:94fc  00 fe		 brk #$fe
$09:94fe  00 00		 brk #$00
$09:9500  00 00		 brk #$00
$09:9502  00 00		 brk #$00
$09:9504  13 00		 ora ($00,s),y
$09:9506  04 03		 tsb $03
$09:9508  08			php
$09:9509  07 08		 ora [$08]
$09:950b  07 28		 ora [$28]
$09:950d  07 0c		 ora [$0c]
$09:950f  03 00		 ora $00,s
$09:9511  ff 00 ff 03   sbc $03ff00,x
$09:9515  fc 07 f8	  jsr ($f807,x)
$09:9518  0f f0 0f f0   ora $f00ff0
$09:951c  0f f0 0f f0   ora $f00ff0
$09:9520  00 00		 brk #$00
$09:9522  00 00		 brk #$00
$09:9524  00 00		 brk #$00
$09:9526  c0 00 20	  cpy #$2000
$09:9529  c0 10 e0	  cpy #$e010
$09:952c  08			php
$09:952d  f0 08		 beq $9537
$09:952f  f0 00		 beq $9531
$09:9531  ff 00 ff 00   sbc $00ff00,x
$09:9535  ff c0 3f e0   sbc $e03fc0,x
$09:9539  1f f0 0f f8   ora $f80ff0,x
$09:953d  07 f8		 ora [$f8]
$09:953f  07 e4		 ora [$e4]
$09:9541  1b			tcs
$09:9542  10 ef		 bpl $9533
$09:9544  08			php
$09:9545  f7 08		 sbc [$08],y
$09:9547  f7 00		 sbc [$00],y
$09:9549  ff 00 ff 0c   sbc $0cff00,x
$09:954d  f3 12		 sbc ($12,s),y
$09:954f  ed ff 00	  sbc $00ff
$09:9552  ff 00 ff 00   sbc $00ff00,x
$09:9556  ff 00 ff 00   sbc $00ff00,x
$09:955a  ff 00 ff 00   sbc $00ff00,x
$09:955e  ff 00 84 00   sbc $008400,x
$09:9562  40			rti
$09:9563  80 40		 bra $95a5
$09:9565  80 40		 bra $95a7
$09:9567  80 28		 bra $9591
$09:9569  c0 22 c0	  cpy #$c022
$09:956c  20 c0 10	  jsr $10c0
$09:956f  e0 80 7f	  cpx #$7f80
$09:9572  c0 3f c0	  cpy #$c03f
$09:9575  3f c0 3f e0   and $e03fc0,x
$09:9579  1f e0 1f e0   ora $e01fe0,x
$09:957d  1f f0 0f 00   ora $000ff0,x
$09:9581  ff 6d e1 4e   sbc $4ee16d,x
$09:9585  df 7f df 7f   cmp $7fdf7f,x
$09:9589  df 7f df 7f   cmp $7fdf7f,x
$09:958d  df 4f df 00   cmp $00df4f,x
$09:9591  00 1e		 brk #$1e
$09:9593  00 3f		 brk #$3f
$09:9595  00 3f		 brk #$3f
$09:9597  00 3f		 brk #$3f
$09:9599  00 3f		 brk #$3f
$09:959b  00 3f		 brk #$3f
$09:959d  00 3f		 brk #$3f
$09:959f  00 00		 brk #$00
$09:95a1  ff b6 87 72   sbc $7287b6,x
$09:95a5  fb			xce
$09:95a6  fe fb fe	  inc $fefb,x
$09:95a9  fb			xce
$09:95aa  fe fb fe	  inc $fefb,x
$09:95ad  fb			xce
$09:95ae  f2 fb		 sbc ($fb)
$09:95b0  00 00		 brk #$00
$09:95b2  78			sei
$09:95b3  00 fc		 brk #$fc
$09:95b5  00 fc		 brk #$fc
$09:95b7  00 fc		 brk #$fc
$09:95b9  00 fc		 brk #$fc
$09:95bb  00 fc		 brk #$fc
$09:95bd  00 fc		 brk #$fc
$09:95bf  00 e6		 brk #$e6
$09:95c1  19 cb 3c	  ora $3ccb,y
$09:95c4  d7 7e		 cmp [$7e],y
$09:95c6  fe 3d de	  inc $de3d,x
$09:95c9  19 c5 0a	  ora $0ac5,y
$09:95cc  62 8d 34	  per $ca5c
$09:95cf  cb			wai
$09:95d0  ff e7 7f c3   sbc $c37fe7,x
$09:95d4  7f 81 ff 81   adc $81ff81,x
$09:95d8  7f 81 ff 81   adc $81ff81,x
$09:95dc  ff c3 ff e7   sbc $e7ffc3,x
$09:95e0  00 00		 brk #$00
$09:95e2  c3 00		 cmp $00,s
$09:95e4  81 00		 sta ($00,x)
$09:95e6  10 08		 bpl $95f0
$09:95e8  08			php
$09:95e9  00 00		 brk #$00
$09:95eb  81 42		 sta ($42,x)
$09:95ed  42 18		 wdm #$18
$09:95ef  5a			phy
$09:95f0  00 ff		 brk #$ff
$09:95f2  3c ff c3	  bit $c3ff,x
$09:95f5  ff 99 e7 99   sbc $99e799,x
$09:95f9  e7 5a		 sbc [$5a]
$09:95fb  e7 3c		 sbc [$3c]
$09:95fd  ff 24 ff 6e   sbc $6eff24,x
$09:9601  e3 2c		 sbc $2c,s
$09:9603  e1 e4		 sbc ($e4,x)
$09:9605  e1 fa		 sbc ($fa,x)
$09:9607  93 72		 sta ($72,s),y
$09:9609  13 2c		 ora ($2c,s),y
$09:960b  1f 50 1f b2   ora $b21f50,x
$09:960f  b3 1c		 lda ($1c,s),y
$09:9611  00 1e		 brk #$1e
$09:9613  00 1e		 brk #$1e
$09:9615  00 6c		 brk #$6c
$09:9617  00 ec		 brk #$ec
$09:9619  00 e0		 brk #$e0
$09:961b  00 e0		 brk #$e0
$09:961d  00 4c		 brk #$4c
$09:961f  00 77		 brk #$77
$09:9621  88			dey
$09:9622  ab			plb
$09:9623  40			rti
$09:9624  5d 80 eb	  eor $eb80,x
$09:9627  1c d5 88	  trb $88d5
$09:962a  ff c0 44 80   sbc $8044c0,x
$09:962e  99 00 00	  sta $0000,y
$09:9631  ec 00 dc	  cpx $dc00
$09:9634  00 a2		 brk #$a2
$09:9636  00 be		 brk #$be
$09:9638  00 be		 brk #$be
$09:963a  01 c0		 ora ($c0,x)
$09:963c  3f 80 7f 00   and $007f80,x
$09:9640  00 00		 brk #$00
$09:9642  00 00		 brk #$00
$09:9644  00 00		 brk #$00
$09:9646  00 00		 brk #$00
$09:9648  00 00		 brk #$00
$09:964a  00 00		 brk #$00
$09:964c  00 00		 brk #$00
$09:964e  00 00		 brk #$00
$09:9650  00 00		 brk #$00
$09:9652  00 00		 brk #$00
$09:9654  00 00		 brk #$00
$09:9656  00 00		 brk #$00
$09:9658  00 00		 brk #$00
$09:965a  00 00		 brk #$00
$09:965c  00 00		 brk #$00
$09:965e  00 00		 brk #$00
$09:9660  07 00		 ora [$00]
$09:9662  0c 03 10	  tsb $1003
$09:9665  0f 10 0f 10   ora $100f10
$09:9669  0f 10 0f 28   ora $280f10
$09:966d  07 0c		 ora [$0c]
$09:966f  03 07		 ora $07,s
$09:9671  f8			sed
$09:9672  0f f0 1f e0   ora $e01ff0
$09:9676  1f e0 1f e0   ora $e01fe0,x
$09:967a  1f e0 0f f0   ora $f00fe0,x
$09:967e  0f f0 10 e0   ora $e010f0
$09:9682  10 e0		 bpl $9664
$09:9684  20 c0 c0	  jsr $c0c0
$09:9687  00 00		 brk #$00
$09:9689  00 02		 brk #$02
$09:968b  00 20		 brk #$20
$09:968d  00 00		 brk #$00
$09:968f  00 f0		 brk #$f0
$09:9691  0f f0 0f e0   ora $e00ff0
$09:9695  1f c0 3f 00   ora $003fc0,x
$09:9699  ff 00 ff 00   sbc $00ff00,x
$09:969d  ff 00 ff 07   sbc $07ff00,x
$09:96a1  00 0c		 brk #$0c
$09:96a3  03 12		 ora $12,s
$09:96a5  0d 12 0d	  ora $0d12
$09:96a8  24 1b		 bit $1b
$09:96aa  20 1f 20	  jsr $201f
$09:96ad  1f 10 0f 07   ora $070f10,x
$09:96b1  f8			sed
$09:96b2  0f f0 1f e0   ora $e01ff0
$09:96b6  1f e0 3f c0   ora $c03fe0,x
$09:96ba  3f c0 3f c0   and $c03fc0,x
$09:96be  1f e0 00 00   ora $0000e0,x
$09:96c2  00 00		 brk #$00
$09:96c4  00 00		 brk #$00
$09:96c6  70 00		 bvs $96c8
$09:96c8  98			tya
$09:96c9  60			rts
$09:96ca  84 78		 sty $78
$09:96cc  42 bc		 wdm #$bc
$09:96ce  01 fe		 ora ($fe,x)
$09:96d0  00 ff		 brk #$ff
$09:96d2  00 ff		 brk #$ff
$09:96d4  00 ff		 brk #$ff
$09:96d6  70 8f		 bvs $9667
$09:96d8  f8			sed
$09:96d9  07 fc		 ora [$fc]
$09:96db  03 fe		 ora $fe,s
$09:96dd  01 ff		 ora ($ff,x)
$09:96df  00 bf		 brk #$bf
$09:96e1  b7 7f		 lda [$7f],y
$09:96e3  7b			tdc
$09:96e4  bb			tyx
$09:96e5  bf 7b 77 fd   lda $fd777b,x
$09:96e9  e3 3d		 sbc $3d,s
$09:96eb  3b			tsc
$09:96ec  1e 1d 07	  asl $071d,x
$09:96ef  06 bf		 asl $bf
$09:96f1  47 7f		 eor [$7f]
$09:96f3  83 bf		 sta $bf,s
$09:96f5  43 7f		 eor $7f,s
$09:96f7  83 ff		 sta $ff,s
$09:96f9  01 3f		 ora ($3f,x)
$09:96fb  c1 1f		 cmp ($1f,x)
$09:96fd  e0 07 f8	  cpx #$f807
$09:9700  22 dd 24 db   jsl $db24dd
$09:9704  20 df d0	  jsr $d0df
$09:9707  0f 0f 00 40   ora $40000f
$09:970b  00 42		 brk #$42
$09:970d  00 10		 brk #$10
$09:970f  00 ff		 brk #$ff
$09:9711  00 ff		 brk #$ff
$09:9713  00 ff		 brk #$ff
$09:9715  00 df		 brk #$df
$09:9717  20 0f f0	  jsr $f00f
$09:971a  00 ff		 brk #$ff
$09:971c  00 ff		 brk #$ff
$09:971e  00 ff		 brk #$ff
$09:9720  30 0f		 bmi $9731
$09:9722  43 3c		 eor $3c,s
$09:9724  44 3b 44	  mvp $44,$3b
$09:9727  3b			tsc
$09:9728  23 1c		 and $1c,s
$09:972a  11 0e		 ora ($0e),y
$09:972c  0e 00 00	  asl $0000
$09:972f  00 3f		 brk #$3f
$09:9731  c0 7f 80	  cpy #$807f
$09:9734  7f 80 7f 80   adc $807f80,x
$09:9738  3f c0 1f e0   and $e01fc0,x
$09:973c  0e f1 00	  asl $00f1
$09:973f  ff 03 00 04   sbc $040003,x
$09:9743  03 18		 ora $18,s
$09:9745  07 20		 ora [$20]
$09:9747  1f c4 3b 42   ora $423bc4,x
$09:974b  bd 22 dd	  lda $dd22,x
$09:974e  1c e3 03	  trb $03e3
$09:9751  fc 07 f8	  jsr ($f807,x)
$09:9754  1f e0 3f c0   ora $c03fe0,x
$09:9758  ff 00 ff 00   sbc $00ff00,x
$09:975c  ff 00 ff 00   sbc $00ff00,x
$09:9760  c4 38		 cpy $38
$09:9762  24 d8		 bit $d8
$09:9764  24 d8		 bit $d8
$09:9766  44 b8 08	  mvp $08,$b8
$09:9769  f0 30		 beq $979b
$09:976b  c0 42 80	  cpy #$8042
$09:976e  80 00		 bra $9770
$09:9770  fc 03 fc	  jsr ($fc03,x)
$09:9773  03 fc		 ora $fc,s
$09:9775  03 fc		 ora $fc,s
$09:9777  03 f8		 ora $f8,s
$09:9779  07 f0		 ora [$f0]
$09:977b  0f c0 3f 80   ora $803fc0
$09:977f  7f 4f df 6f   adc $6fdf4f,x
$09:9783  df 7f df 7f   cmp $7fdf7f,x
$09:9787  df 4f df 4f   cmp $4fdf4f,x
$09:978b  df 7f df 4f   cmp $4fdf7f,x
$09:978f  df 3f 00 3f   cmp $3f003f,x
$09:9793  00 3f		 brk #$3f
$09:9795  00 3f		 brk #$3f
$09:9797  00 3f		 brk #$3f
$09:9799  00 3f		 brk #$3f
$09:979b  00 3f		 brk #$3f
$09:979d  00 3f		 brk #$3f
$09:979f  00 f6		 brk #$f6
$09:97a1  fb			xce
$09:97a2  f6 fb		 inc $fb,x
$09:97a4  fe fb fe	  inc $fefb,x
$09:97a7  fb			xce
$09:97a8  f6 fb		 inc $fb,x
$09:97aa  f6 fb		 inc $fb,x
$09:97ac  fe fb f6	  inc $f6fb,x
$09:97af  fb			xce
$09:97b0  fc 00 fc	  jsr ($fc00,x)
$09:97b3  00 fc		 brk #$fc
$09:97b5  00 fc		 brk #$fc
$09:97b7  00 fc		 brk #$fc
$09:97b9  00 fc		 brk #$fc
$09:97bb  00 fc		 brk #$fc
$09:97bd  00 fc		 brk #$fc
$09:97bf  00 be		 brk #$be
$09:97c1  1d 7f 22	  ora $227f,x
$09:97c4  63 5d		 adc $5d,s
$09:97c6  4f 71 f9 41   eor $41f971
$09:97ca  f3 22		 sbc ($22,s),y
$09:97cc  67 9c		 adc [$9c]
$09:97ce  24 c1		 bit $c1
$09:97d0  bf c1 7f 80   lda $807fc1,x
$09:97d4  7f 80 7f 80   adc $807f80,x
$09:97d8  ff 80 ff 80   sbc $80ff80,x
$09:97dc  ff c1 e5 ff   sbc $ffe5c1,x
$09:97e0  24 66		 bit $66
$09:97e2  24 24		 bit $24
$09:97e4  00 5a		 brk #$5a
$09:97e6  18			clc
$09:97e7  5a			phy
$09:97e8  24 66		 bit $66
$09:97ea  18			clc
$09:97eb  99 00 c3	  sta $c300,y
$09:97ee  00 ff		 brk #$ff
$09:97f0  00 ff		 brk #$ff
$09:97f2  00 ff		 brk #$ff
$09:97f4  00 ff		 brk #$ff
$09:97f6  24 ff		 bit $ff
$09:97f8  00 ff		 brk #$ff
$09:97fa  a5 ff		 lda $ff
$09:97fc  c3 ff		 cmp $ff,s
$09:97fe  ff ff 6c e1   sbc $e16cff,x
$09:9802  2c e1 36	  bit $36e1
$09:9805  f3 00		 sbc ($00,s),y
$09:9807  ff 5a c3 3c   sbc $3cc35a,x
$09:980b  81 2c		 sta ($2c,x)
$09:980d  81 56		 sta ($56,x)
$09:980f  c3 1e		 cmp $1e,s
$09:9811  00 1e		 brk #$1e
$09:9813  00 0c		 brk #$0c
$09:9815  00 00		 brk #$00
$09:9817  00 3c		 brk #$3c
$09:9819  00 7e		 brk #$7e
$09:981b  00 7e		 brk #$7e
$09:981d  00 3c		 brk #$3c
$09:981f  00 81		 brk #$81
$09:9821  82 10 38	  brl $d034
$09:9824  08			php
$09:9825  c8			iny
$09:9826  40			rti
$09:9827  cf 0f f0 79   cmp $79f00f
$09:982b  86 71		 stx $71
$09:982d  82 7f 80	  brl $18af
$09:9830  00 7f		 brk #$7f
$09:9832  07 ff		 ora [$ff]
$09:9834  37 7f		 and [$7f],y
$09:9836  30 7f		 bmi $98b7
$09:9838  00 7f		 brk #$7f
$09:983a  00 79		 brk #$79
$09:983c  00 7f		 brk #$7f
$09:983e  00 7f		 brk #$7f
$09:9840  70 8f		 bvs $97d1
$09:9842  0b			phd
$09:9843  f0 46		 beq $988b
$09:9845  b1 34		 lda ($34),y
$09:9847  eb			xba
$09:9848  24 fb		 bit $fb
$09:984a  24 fb		 bit $fb
$09:984c  0a			asl a
$09:984d  f3 41		 sbc ($41,s),y
$09:984f  bc 00 70	  ldy $7000,x
$09:9852  0f 00 6f 60   ora $606f00
$09:9856  77 70		 adc [$70],y
$09:9858  77 70		 adc [$70],y
$09:985a  77 70		 adc [$70],y
$09:985c  6c 60 43	  jmp ($4360)
$09:985f  40			rti
$09:9860  66 18		 ror $18
$09:9862  7e ff ff	  ror $ffff,x
$09:9865  ff ff ff ff   sbc $ffffff,x
$09:9869  ff 7e ff 00   sbc $00ff7e,x
$09:986d  ff 07 f8 ff   sbc $fff807,x
$09:9871  00 ff		 brk #$ff
$09:9873  00 ff		 brk #$ff
$09:9875  00 ff		 brk #$ff
$09:9877  00 ff		 brk #$ff
$09:9879  00 ff		 brk #$ff
$09:987b  00 00		 brk #$00
$09:987d  00 ff		 brk #$ff
$09:987f  00 81		 brk #$81
$09:9881  81 00		 sta ($00,x)
$09:9883  00 00		 brk #$00
$09:9885  ff ff 00 00   sbc $0000ff,x
$09:9889  7e 81 5a	  ror $5a81,x
$09:988c  e7 18		 sbc [$18]
$09:988e  00 ff		 brk #$ff
$09:9890  7e ff ff	  ror $ffff,x
$09:9893  ff 00 ff 00   sbc $00ff00,x
$09:9897  ff 00 81 00   sbc $008100,x
$09:989b  e7 00		 sbc [$00]
$09:989d  ff 00 00 5b   sbc $5b0000,x
$09:98a1  bc d6 ef	  ldy $efd6,x
$09:98a4  75 fb		 adc $fb,x
$09:98a6  da			phx
$09:98a7  3d da 3d	  and $3dda,x
$09:98aa  75 fb		 adc $fb,x
$09:98ac  d6 ef		 dec $ef,x
$09:98ae  5b			tcd
$09:98af  bc 00 00	  ldy $0000,x
$09:98b2  00 00		 brk #$00
$09:98b4  00 00		 brk #$00
$09:98b6  00 00		 brk #$00
$09:98b8  00 00		 brk #$00
$09:98ba  00 00		 brk #$00
$09:98bc  00 00		 brk #$00
$09:98be  00 00		 brk #$00
$09:98c0  e7 5b		 sbc [$5b]
$09:98c2  39 d6 8e	  and $8ed6,y
$09:98c5  75 e7		 adc $e7,x
$09:98c7  da			phx
$09:98c8  e7 da		 sbc [$da]
$09:98ca  8e 75 39	  stx $3975
$09:98cd  d6 e7		 dec $e7,x
$09:98cf  5b			tcd
$09:98d0  43 43		 eor $43,s
$09:98d2  10 10		 bpl $98e4
$09:98d4  04 04		 tsb $04
$09:98d6  c2 c2		 rep #$c2
$09:98d8  c2 c2		 rep #$c2
$09:98da  04 04		 tsb $04
$09:98dc  10 10		 bpl $98ee
$09:98de  43 43		 eor $43,s
$09:98e0  7f 10 4d 12   adc $124d10,x
$09:98e4  67 08		 adc [$08]
$09:98e6  7f 08 7f 08   adc $087f08,x
$09:98ea  67 08		 adc [$08]
$09:98ec  4b			phk
$09:98ed  14 7f		 trb $7f
$09:98ef  10 cf		 bpl $98c0
$09:98f1  ff cf ff e7   sbc $e7ffcf,x
$09:98f5  ff e7 ff e7   sbc $e7ffe7,x
$09:98f9  ff e7 ff cf   sbc $cfffe7,x
$09:98fd  ff cf ff 7f   sbc $7fffcf,x
$09:9901  10 4e		 bpl $9951
$09:9903  11 6b		 ora ($6b),y
$09:9905  04 5f		 tsb $5f
$09:9907  38			sec
$09:9908  79 0b 55	  adc $550b,y
$09:990b  28			plp
$09:990c  7f 00 00 00   adc $000000,x
$09:9910  cf ff cf ff   cmp $ffcfff
$09:9914  e3 ff		 sbc $ff,s
$09:9916  c3 ff		 cmp $ff,s
$09:9918  d0 ff		 bne $9919
$09:991a  c4 ff		 cpy $ff
$09:991c  ff ff ff ff   sbc $ffffff,x
$09:9920  ff 00 df 20   sbc $20df00,x
$09:9924  fb			xce
$09:9925  04 ff		 tsb $ff
$09:9927  00 ff		 brk #$ff
$09:9929  00 7f		 brk #$7f
$09:992b  80 fd		 bra $992a
$09:992d  02 ff		 cop #$ff
$09:992f  00 ff		 brk #$ff
$09:9931  ff ff ff ff   sbc $ffffff,x
$09:9935  ff ff ff ff   sbc $ffffff,x
$09:9939  ff ff ff ff   sbc $ffffff,x
$09:993d  ff ff ff ff   sbc $ffffff,x
$09:9941  00 bf		 brk #$bf
$09:9943  40			rti
$09:9944  fd 02 db	  sbc $db02,x
$09:9947  3c 99 c3	  bit $c399,x
$09:994a  bd 00 ff	  lda $ff00,x
$09:994d  00 00		 brk #$00
$09:994f  00 ff		 brk #$ff
$09:9951  ff ff ff ff   sbc $ffffff,x
$09:9955  ff c3 ff 00   sbc $00ffc3,x
$09:9959  ff 3c ff ff   sbc $ffff3c,x
$09:995d  ff ff ff 1f   sbc $1fffff,x
$09:9961  3f 00 40 40   and $404000,x
$09:9965  40			rti
$09:9966  40			rti
$09:9967  40			rti
$09:9968  40			rti
$09:9969  40			rti
$09:996a  40			rti
$09:996b  40			rti
$09:996c  40			rti
$09:996d  40			rti
$09:996e  40			rti
$09:996f  40			rti
$09:9970  00 ff		 brk #$ff
$09:9972  3f ff 3f ff   and $ff3fff,x
$09:9976  3f ff 3f ff   and $ff3fff,x
$09:997a  3f ff 3f ff   and $ff3fff,x
$09:997e  3f ff ad 96   and $96adff,x
$09:9982  5e 29 4f	  lsr $4f29,x
$09:9985  35 27		 and $27,x
$09:9987  1a			inc a
$09:9988  73 2d		 adc ($2d,s),y
$09:998a  59 36 2d	  eor $2d36,y
$09:998d  1a			inc a
$09:998e  53 2c		 eor ($2c,s),y
$09:9990  3f ff ff ff   and $ffffff,x
$09:9994  ff ff bf ff   sbc $ffbfff,x
$09:9998  ff ff ff ff   sbc $ffffff,x
$09:999c  bf ff ff fe   lda $feffff,x
$09:99a0  00 00		 brk #$00
$09:99a2  00 00		 brk #$00
$09:99a4  00 00		 brk #$00
$09:99a6  00 00		 brk #$00
$09:99a8  00 00		 brk #$00
$09:99aa  00 00		 brk #$00
$09:99ac  00 00		 brk #$00
$09:99ae  00 00		 brk #$00
$09:99b0  00 00		 brk #$00
$09:99b2  00 00		 brk #$00
$09:99b4  00 00		 brk #$00
$09:99b6  00 00		 brk #$00
$09:99b8  00 00		 brk #$00
$09:99ba  00 00		 brk #$00
$09:99bc  00 00		 brk #$00
$09:99be  00 00		 brk #$00
$09:99c0  a4 12		 ldy $12
$09:99c2  c9 36 ed	  cmp #$ed36
$09:99c5  36 ff		 rol $ff,x
$09:99c7  24 ed		 bit $ed
$09:99c9  36 b6		 rol $b6,x
$09:99cb  12 c5		 ora ($c5)
$09:99cd  45 ff		 eor $ff
$09:99cf  00 6d		 brk #$6d
$09:99d1  80 6d		 bra $9a40
$09:99d3  80 6d		 bra $9a42
$09:99d5  80 6d		 bra $9a44
$09:99d7  92 6d		 sta ($6d)
$09:99d9  92 6d		 sta ($6d)
$09:99db  92 3a		 sta ($3a)
$09:99dd  ff 00 ff ff   sbc $ffff00,x
$09:99e1  00 ff		 brk #$ff
$09:99e3  00 ff		 brk #$ff
$09:99e5  00 ff		 brk #$ff
$09:99e7  00 ff		 brk #$ff
$09:99e9  00 ff		 brk #$ff
$09:99eb  00 ff		 brk #$ff
$09:99ed  00 ff		 brk #$ff
$09:99ef  00 00		 brk #$00
$09:99f1  00 00		 brk #$00
$09:99f3  00 00		 brk #$00
$09:99f5  00 00		 brk #$00
$09:99f7  00 00		 brk #$00
$09:99f9  00 00		 brk #$00
$09:99fb  00 00		 brk #$00
$09:99fd  00 00		 brk #$00
$09:99ff  00 66		 brk #$66
$09:9a01  00 50		 brk #$50
$09:9a03  0d 12 3a	  ora $3a12
$09:9a06  19 02 1b	  ora $1b02,y
$09:9a09  79 16 72	  adc $7216,y
$09:9a0c  09 63 12	  ora #$1263
$09:9a0f  49 04 fb	  eor #$fb04
$09:9a12  1d e2 38	  ora $38e2,x
$09:9a15  c7 00		 cmp [$00]
$09:9a17  e7 60		 sbc [$60]
$09:9a19  e7 61		 sbc [$61]
$09:9a1b  ef 60 ff 40   sbc $40ff60
$09:9a1f  ff 40 bf a0   sbc $a0bf40,x
$09:9a23  60			rts
$09:9a24  40			rti
$09:9a25  ff 1f e0 3f   sbc $3fe01f,x
$09:9a29  c0 3f c0	  cpy #$c03f
$09:9a2c  71 84		 adc ($84),y
$09:9a2e  00 db		 brk #$db
$09:9a30  00 80		 brk #$80
$09:9a32  1f bf 00 7f   ora $7f00bf,x
$09:9a36  00 7f		 brk #$7f
$09:9a38  00 7f		 brk #$7f
$09:9a3a  00 7f		 brk #$7f
$09:9a3c  00 7b		 brk #$7b
$09:9a3e  00 2f		 brk #$2f
$09:9a40  82 f4 09	  brl $a437
$09:9a43  e9 04 e4	  sbc #$e404
$09:9a46  01 e8		 ora ($e8,x)
$09:9a48  82 70 0f	  brl $a9bb
$09:9a4b  ed 54 d9	  sbc $d954
$09:9a4e  0b			phd
$09:9a4f  b2 f6		 lda ($f6)
$09:9a51  09 e0 1f	  ora #$1fe0
$09:9a54  e9 1f e4	  sbc #$e41f
$09:9a57  1f f4 0f e0   ora $e00ff4,x
$09:9a5b  1f c0 3f 80   ora $803fc0,x
$09:9a5f  7f 5e a1 3e   adc $3ea15e,x
$09:9a63  c1 4c		 cmp ($4c,x)
$09:9a65  ff 00 ff fa   sbc $faff00,x
$09:9a69  ff ed ff d2   sbc $d2ffed,x
$09:9a6d  ff 01 ff ff   sbc $ffff01,x
$09:9a71  00 ff		 brk #$ff
$09:9a73  00 ff		 brk #$ff
$09:9a75  00 00		 brk #$00
$09:9a77  00 ff		 brk #$ff
$09:9a79  ff ff ff ff   sbc $ffffff,x
$09:9a7d  ff ff ff ee   sbc $eeffff,x
$09:9a81  81 bd		 sta ($bd,x)
$09:9a83  c0 9a e5	  cpy #$e59a
$09:9a86  ad f2 f4	  lda $f4f2
$09:9a89  8f c2 fd a9   sta $a9fdc2
$09:9a8d  80 56		 bra $9ae5
$09:9a8f  fe 80 7f	  inc $7f80,x
$09:9a92  80 7f		 bra $9b13
$09:9a94  80 7f		 bra $9b15
$09:9a96  80 7f		 bra $9b17
$09:9a98  80 7f		 bra $9b19
$09:9a9a  80 7f		 bra $9b1b
$09:9a9c  80 7f		 bra $9b1d
$09:9a9e  00 ff		 brk #$ff
$09:9aa0  00 ff		 brk #$ff
$09:9aa2  5a			phy
$09:9aa3  a5 3f		 lda $3f
$09:9aa5  ff 6d a0 79   sbc $79a06d,x
$09:9aa9  a2 3f e0	  ldx #$e03f
$09:9aac  6d b0 3f	  adc $3fb0
$09:9aaf  e0 00 00	  cpx #$0000
$09:9ab2  7f 00 7f 00   adc $007f00,x
$09:9ab6  7f 00 7f 00   adc $007f00,x
$09:9aba  7f 00 7f 00   adc $007f00,x
$09:9abe  7f 00 00 ff   adc $ff0000,x
$09:9ac2  00 ff		 brk #$ff
$09:9ac4  ff ff f3 08   sbc $08f3ff,x
$09:9ac8  bf 00 bb 40   lda $40bb00,x
$09:9acc  fb			xce
$09:9acd  04 ff		 tsb $ff
$09:9acf  00 00		 brk #$00
$09:9ad1  00 ff		 brk #$ff
$09:9ad3  00 ff		 brk #$ff
$09:9ad5  00 ff		 brk #$ff
$09:9ad7  00 ff		 brk #$ff
$09:9ad9  00 ff		 brk #$ff
$09:9adb  00 ff		 brk #$ff
$09:9add  00 ff		 brk #$ff
$09:9adf  00 00		 brk #$00
$09:9ae1  ff 02 fd fc   sbc $fcfd02,x
$09:9ae5  ff b4 07 a6   sbc $a607b4,x
$09:9ae9  45 cc		 eor $cc
$09:9aeb  0f 9c 1f 3c   ora $3c1f9c
$09:9aef  3f 00 00 fe   and $fe0000,x
$09:9af3  00 fe		 brk #$fe
$09:9af5  00 fe		 brk #$fe
$09:9af7  00 fe		 brk #$fe
$09:9af9  00 f6		 brk #$f6
$09:9afb  00 e6		 brk #$e6
$09:9afd  00 c6		 brk #$c6
$09:9aff  00 f7		 brk #$f7
$09:9b01  0f ff 00 9f   ora $9f00ff
$09:9b05  40			rti
$09:9b06  e1 1e		 sbc ($1e,x)
$09:9b08  bf 00 80 00   lda $008000,x
$09:9b0c  c0 00 ff	  cpy #$ff00
$09:9b0f  00 1f		 brk #$1f
$09:9b11  7f 0f 7f 00   adc $007f0f,x
$09:9b15  7f 00 3f 00   adc $003f00,x
$09:9b19  40			rti
$09:9b1a  00 7f		 brk #$7f
$09:9b1c  00 3f		 brk #$3f
$09:9b1e  00 00		 brk #$00
$09:9b20  00 fe		 brk #$fe
$09:9b22  00 ff		 brk #$ff
$09:9b24  00 ff		 brk #$ff
$09:9b26  60			rts
$09:9b27  ff 5f bf 5f   sbc $5fbf5f,x
$09:9b2b  80 1f		 bra $9b4c
$09:9b2d  e0 00 ff	  cpx #$ff00
$09:9b30  00 01		 brk #$01
$09:9b32  00 7f		 brk #$7f
$09:9b34  00 7f		 brk #$7f
$09:9b36  00 7f		 brk #$7f
$09:9b38  00 5f		 brk #$5f
$09:9b3a  00 7f		 brk #$7f
$09:9b3c  00 1f		 brk #$1f
$09:9b3e  00 00		 brk #$00
$09:9b40  00 00		 brk #$00
$09:9b42  7f 80 7f 80   adc $807f80,x
$09:9b46  7c 83 80	  jmp ($8083,x)
$09:9b49  fc 80 00	  jsr ($0080,x)
$09:9b4c  00 03		 brk #$03
$09:9b4e  00 ff		 brk #$ff
$09:9b50  00 ff		 brk #$ff
$09:9b52  00 ff		 brk #$ff
$09:9b54  00 ff		 brk #$ff
$09:9b56  00 ff		 brk #$ff
$09:9b58  00 ff		 brk #$ff
$09:9b5a  00 ff		 brk #$ff
$09:9b5c  00 fc		 brk #$fc
$09:9b5e  00 00		 brk #$00
$09:9b60  40			rti
$09:9b61  40			rti
$09:9b62  40			rti
$09:9b63  40			rti
$09:9b64  40			rti
$09:9b65  40			rti
$09:9b66  40			rti
$09:9b67  40			rti
$09:9b68  40			rti
$09:9b69  40			rti
$09:9b6a  40			rti
$09:9b6b  40			rti
$09:9b6c  41 41		 eor ($41,x)
$09:9b6e  23 62		 and $62,s
$09:9b70  3f ff 3f ff   and $ff3fff,x
$09:9b74  3f ff 3f ff   and $ff3fff,x
$09:9b78  3f ff 3f ff   and $ff3fff,x
$09:9b7c  3e ff 1c	  rol $1cff,x
$09:9b7f  ff 6d 33 55   sbc $55336d,x
$09:9b83  2e 56 39	  rol $3956
$09:9b86  7b			tdc
$09:9b87  27 68		 and [$68]
$09:9b89  18			clc
$09:9b8a  80 80		 bra $9b0c
$09:9b8c  ff 00 00 00   sbc $000000,x
$09:9b90  ff f8 ff e1   sbc $e1fff8,x
$09:9b94  fe 87 f8	  inc $f887,x
$09:9b97  9f e7 ff 7f   sta $7fffe7,x
$09:9b9b  ff 00 ff 00   sbc $00ff00,x
$09:9b9f  ff 6c 9b 26   sbc $269b6c,x
$09:9ba3  d1 da		 cmp ($da),y
$09:9ba5  2d ae d5	  and $d5ae
$09:9ba8  c4 0b		 cpy $0b
$09:9baa  8a			txa
$09:9bab  f5 64		 sbc $64,x
$09:9bad  83 2a		 sta $2a,s
$09:9baf  f1 00		 sbc ($00),y
$09:9bb1  7e 08 be	  ror $be08,x
$09:9bb4  00 de		 brk #$de
$09:9bb6  00 ee		 brk #$ee
$09:9bb8  00 f6		 brk #$f6
$09:9bba  00 fa		 brk #$fa
$09:9bbc  00 fc		 brk #$fc
$09:9bbe  00 fe		 brk #$fe
$09:9bc0  00 1f		 brk #$1f
$09:9bc2  03 1c		 ora $1c,s
$09:9bc4  0e 13 67	  asl $6713
$09:9bc7  18			clc
$09:9bc8  02 7d		 cop #$7d
$09:9bca  65 1a		 adc $1a
$09:9bcc  4d 12 33	  eor $3312
$09:9bcf  0d 00 e0	  ora $e000
$09:9bd2  00 e1		 brk #$e1
$09:9bd4  00 e7		 brk #$e7
$09:9bd6  00 81		 brk #$81
$09:9bd8  60			rts
$09:9bd9  e1 60		 sbc ($60,x)
$09:9bdb  e3 40		 sbc $40,s
$09:9bdd  e4 20		 cpx $20
$09:9bdf  e1 00		 sbc ($00,x)
$09:9be1  80 60		 bra $9c43
$09:9be3  80 68		 bra $9c4d
$09:9be5  88			dey
$09:9be6  00 ef		 brk #$ef
$09:9be8  27 d8		 and [$d8]
$09:9bea  70 a7		 bvs $9b93
$09:9bec  55 ab		 eor $ab,x
$09:9bee  00 8f		 brk #$8f
$09:9bf0  6f 7f 0f 7f   adc $7f0f7f
$09:9bf4  07 7f		 ora [$7f]
$09:9bf6  00 1f		 brk #$1f
$09:9bf8  00 37		 brk #$37
$09:9bfa  00 78		 brk #$78
$09:9bfc  00 77		 brk #$77
$09:9bfe  00 70		 brk #$70
$09:9c00  52 49		 eor ($49)
$09:9c02  1d 48 53	  ora $5348,x
$09:9c05  4c 6a 66	  jmp $666a
$09:9c08  73 70		 adc ($70,s),y
$09:9c0a  64 7c		 stz $7c
$09:9c0c  60			rts
$09:9c0d  7f 7f 1f 40   adc $401f7f,x
$09:9c11  ff 40 ff 40   sbc $40ff40,x
$09:9c15  ff 61 ff 60   sbc $60ff61,x
$09:9c19  ef 60 e3 60   sbc $60e360
$09:9c1d  e0 60 e0	  cpx #$e060
$09:9c20  7c aa 68	  jmp ($68aa,x)
$09:9c23  aa			tax
$09:9c24  00 ea		 brk #$ea
$09:9c26  4a			lsr a
$09:9c27  81 08		 sta ($08,x)
$09:9c29  e5 25		 sbc $25
$09:9c2b  e5 68		 sbc $68
$09:9c2d  e8			inx
$09:9c2e  00 80		 brk #$80
$09:9c30  00 7f		 brk #$7f
$09:9c32  00 7f		 brk #$7f
$09:9c34  01 3f		 ora ($3f,x)
$09:9c36  00 7f		 brk #$7f
$09:9c38  00 7f		 brk #$7f
$09:9c3a  00 7f		 brk #$7f
$09:9c3c  07 7f		 ora [$7f]
$09:9c3e  6f 7f 00 ff   adc $ff007f
$09:9c42  bd 81 3a	  lda $3a81,x
$09:9c45  ff ff ff ff   sbc $ffffff,x
$09:9c49  ff ff ff ff   sbc $ffffff,x
$09:9c4d  ff ff ff 00   sbc $00ffff,x
$09:9c51  00 7e		 brk #$7e
$09:9c53  00 ff		 brk #$ff
$09:9c55  00 ff		 brk #$ff
$09:9c57  00 ff		 brk #$ff
$09:9c59  00 ff		 brk #$ff
$09:9c5b  00 ff		 brk #$ff
$09:9c5d  00 ff		 brk #$ff
$09:9c5f  00 6f		 brk #$6f
$09:9c61  8f bb 57 af   sta $af57bb
$09:9c65  7f 7d df 5b   adc $5bdf7d,x
$09:9c69  ff d8 7f dc   sbc $dc7fd8,x
$09:9c6d  7f 6f df 0f   adc $0fdf6f,x
$09:9c71  f0 1f		 beq $9c92
$09:9c73  ef 3f df 7f   sbc $7fdf3f
$09:9c77  bf 7f bf 7f   lda $7fbf7f,x
$09:9c7b  bf 7f bf 7f   lda $7fbf7f,x
$09:9c7f  bf db 27 a7   lda $a727db,x
$09:9c83  5f 4b b7 07   eor $07b74b,x
$09:9c87  fb			xce
$09:9c88  7b			tdc
$09:9c89  df 4f bf 21   cmp $21bf4f,x
$09:9c8d  01 e9		 ora ($e9,x)
$09:9c8f  7e 00 fe	  ror $fe00,x
$09:9c92  00 fe		 brk #$fe
$09:9c94  00 fe		 brk #$fe
$09:9c96  00 fe		 brk #$fe
$09:9c98  00 fe		 brk #$fe
$09:9c9a  00 fe		 brk #$fe
$09:9c9c  00 fe		 brk #$fe
$09:9c9e  00 7f		 brk #$7f
$09:9ca0  30 e0		 bmi $9c82
$09:9ca2  2f e0 6d a2   and $a26de0
$09:9ca6  2f e0 61 a8   and $a861e0
$09:9caa  69 a6 3f	  adc #$3fa6
$09:9cad  ff 4b f7 7f   sbc $7ff74b,x
$09:9cb1  00 7f		 brk #$7f
$09:9cb3  00 7f		 brk #$7f
$09:9cb5  00 7f		 brk #$7f
$09:9cb7  00 7f		 brk #$7f
$09:9cb9  00 79		 brk #$79
$09:9cbb  00 7f		 brk #$7f
$09:9cbd  00 7f		 brk #$7f
$09:9cbf  00 00		 brk #$00
$09:9cc1  00 ef		 brk #$ef
$09:9cc3  10 fd		 bpl $9cc2
$09:9cc5  02 bf		 cop #$bf
$09:9cc7  40			rti
$09:9cc8  fb			xce
$09:9cc9  04 ff		 tsb $ff
$09:9ccb  00 ff		 brk #$ff
$09:9ccd  ff bb 47 ff   sbc $ff47bb,x
$09:9cd1  00 ff		 brk #$ff
$09:9cd3  00 ff		 brk #$ff
$09:9cd5  00 ff		 brk #$ff
$09:9cd7  00 ff		 brk #$ff
$09:9cd9  00 ff		 brk #$ff
$09:9cdb  00 ff		 brk #$ff
$09:9cdd  00 ff		 brk #$ff
$09:9cdf  00 44		 brk #$44
$09:9ce1  7f 86 fd 84   adc $84fd86,x
$09:9ce5  ff 86 fd 86   sbc $86fd86,x
$09:9ce9  fd 84 ff	  sbc $ff84,x
$09:9cec  58			cli
$09:9ced  bf ea f7 86   lda $86f7ea,x
$09:9cf1  00 06		 brk #$06
$09:9cf3  00 06		 brk #$06
$09:9cf5  00 06		 brk #$06
$09:9cf7  00 06		 brk #$06
$09:9cf9  00 06		 brk #$06
$09:9cfb  00 fe		 brk #$fe
$09:9cfd  00 fe		 brk #$fe
$09:9cff  00 f0		 brk #$f0
$09:9d01  0f f8 0f f4   ora $f40ff8
$09:9d05  0b			phd
$09:9d06  b0 0f		 bcs $9d17
$09:9d08  b0 0f		 bcs $9d19
$09:9d0a  fa			plx
$09:9d0b  07 f0		 ora [$f0]
$09:9d0d  0f b9 0e 1f   ora $1f0eb9
$09:9d11  7f 1f 7f 1f   adc $1f7f1f,x
$09:9d15  7f 1f 7f 1f   adc $1f7f1f,x
$09:9d19  7f 1f 7f 1f   adc $1f7f1f,x
$09:9d1d  7f 1f 7f 93   adc $937f1f,x
$09:9d21  00 aa		 brk #$aa
$09:9d23  10 ba		 bpl $9cdf
$09:9d25  10 be		 bpl $9ce5
$09:9d27  11 ec		 ora ($ec),y
$09:9d29  10 8f		 bpl $9cba
$09:9d2b  00 a4		 brk #$a4
$09:9d2d  10 48		 bpl $9d77
$09:9d2f  00 00		 brk #$00
$09:9d31  7c 00 7d	  jmp ($7d00,x)
$09:9d34  00 7d		 brk #$7d
$09:9d36  00 7b		 brk #$7b
$09:9d38  00 3b		 brk #$3b
$09:9d3a  00 70		 brk #$70
$09:9d3c  00 7b		 brk #$7b
$09:9d3e  00 b7		 brk #$b7
$09:9d40  ff 00 00 00   sbc $000000,x
$09:9d44  00 00		 brk #$00
$09:9d46  40			rti
$09:9d47  bf bf 00 ff   lda $ff00bf,x
$09:9d4b  00 00		 brk #$00
$09:9d4d  00 00		 brk #$00
$09:9d4f  00 00		 brk #$00
$09:9d51  00 00		 brk #$00
$09:9d53  ff 00 ff 00   sbc $00ff00,x
$09:9d57  ff 00 ff 00   sbc $00ff00,x
$09:9d5b  00 00		 brk #$00
$09:9d5d  ff 00 ff 7e   sbc $7eff00,x
$09:9d61  00 c1		 brk #$c1
$09:9d63  c0 ab 90	  cpy #$90ab
$09:9d66  ba			tsx
$09:9d67  90 b9		 bcc $9d22
$09:9d69  90 45		 bcc $9db0
$09:9d6b  01 ab		 ora ($ab,x)
$09:9d6d  93 c7		 sta ($c7,s),y
$09:9d6f  45 00		 eor $00
$09:9d71  ff c0 ff 80   sbc $80ffc0,x
$09:9d75  ff 80 ff 80   sbc $80ff80,x
$09:9d79  ff 01 ff 83   sbc $83ff01,x
$09:9d7d  ff 45 ff 7f   sbc $7fff45,x
$09:9d81  00 ef		 brk #$ef
$09:9d83  0f ff 60 ff   ora $ff60ff
$09:9d87  80 00		 bra $9d89
$09:9d89  ff ff 00 80   sbc $8000ff,x
$09:9d8d  80 ff		 bra $9d8e
$09:9d8f  ff 00 ff 0f   sbc $0fff00,x
$09:9d93  ff 60 ff 80   sbc $80ff60,x
$09:9d97  ff 00 ff 00   sbc $00ff00,x
$09:9d9b  ff 80 ff ff   sbc $ffff80,x
$09:9d9f  ff ff 00 ff   sbc $ff00ff,x
$09:9da3  ff ff 00 ff   sbc $ff00ff,x
$09:9da7  00 00		 brk #$00
$09:9da9  ff ff 00 00   sbc $0000ff,x
$09:9dad  00 ff		 brk #$ff
$09:9daf  ff 00 ff ff   sbc $ffff00,x
$09:9db3  ff 00 ff 00   sbc $00ff00,x
$09:9db7  ff 00 ff 00   sbc $00ff00,x
$09:9dbb  ff 00 ff ff   sbc $ffff00,x
$09:9dbf  ff 5a 05 24   sbc $24055a,x
$09:9dc3  1b			tcs
$09:9dc4  1a			inc a
$09:9dc5  15 0b		 ora $0b,x
$09:9dc7  14 6e		 trb $6e
$09:9dc9  05 01		 ora $01
$09:9dcb  07 7a		 ora [$7a]
$09:9dcd  01 00		 ora ($00,x)
$09:9dcf  00 50		 brk #$50
$09:9dd1  f1 20		 sbc ($20),y
$09:9dd3  f0 08		 beq $9ddd
$09:9dd5  f8			sed
$09:9dd6  02 fe		 cop #$fe
$09:9dd8  60			rts
$09:9dd9  f7 00		 sbc [$00],y
$09:9ddb  fd 78 fd	  sbc $fd78,x
$09:9dde  00 ff		 brk #$ff
$09:9de0  67 9f		 adc [$9f]
$09:9de2  53 af		 eor ($af,s),y
$09:9de4  65 9f		 adc $9f
$09:9de6  5a			phy
$09:9de7  a7 74		 lda [$74]
$09:9de9  8b			phb
$09:9dea  7a			ply
$09:9deb  85 47		 sta $47
$09:9ded  c8			iny
$09:9dee  45 cb		 eor $cb
$09:9df0  7f 7f 7f 7f   adc $7f7f7f,x
$09:9df4  7f 7f 7f 7f   adc $7f7f7f,x
$09:9df8  7f 7f 7f 7f   adc $7f7f7f,x
$09:9dfc  37 77		 and [$77],y
$09:9dfe  34 75		 bit $75,x
$09:9e00  de 00 da	  dec $da00,x
$09:9e03  20 fa 04	  jsr $04fa
$09:9e06  fc 00 bc	  jsr ($bc00,x)
$09:9e09  00 fa		 brk #$fa
$09:9e0b  00 bd		 brk #$bd
$09:9e0d  42 ea		 wdm #$ea
$09:9e0f  00 ff		 brk #$ff
$09:9e11  00 ff		 brk #$ff
$09:9e13  00 ff		 brk #$ff
$09:9e15  00 ff		 brk #$ff
$09:9e17  00 ff		 brk #$ff
$09:9e19  00 ff		 brk #$ff
$09:9e1b  00 ff		 brk #$ff
$09:9e1d  00 ff		 brk #$ff
$09:9e1f  00 ff		 brk #$ff
$09:9e21  ff ff ff ff   sbc $ffffff,x
$09:9e25  ff ff ff ff   sbc $ffffff,x
$09:9e29  ff ff ff ff   sbc $ffffff,x
$09:9e2d  ff ff ff ff   sbc $ffffff,x
$09:9e31  00 ff		 brk #$ff
$09:9e33  00 ff		 brk #$ff
$09:9e35  00 ff		 brk #$ff
$09:9e37  00 ff		 brk #$ff
$09:9e39  00 ff		 brk #$ff
$09:9e3b  00 ff		 brk #$ff
$09:9e3d  00 ff		 brk #$ff
$09:9e3f  00 ff		 brk #$ff
$09:9e41  ff ff ff ff   sbc $ffffff,x
$09:9e45  ff ff ff ff   sbc $ffffff,x
$09:9e49  ff 7b ff c6   sbc $c6ff7b,x
$09:9e4d  ff b6 d8 ff   sbc $ffd8b6,x
$09:9e51  00 ff		 brk #$ff
$09:9e53  00 ff		 brk #$ff
$09:9e55  00 ff		 brk #$ff
$09:9e57  00 ff		 brk #$ff
$09:9e59  00 ff		 brk #$ff
$09:9e5b  00 ff		 brk #$ff
$09:9e5d  00 ff		 brk #$ff
$09:9e5f  00 f3		 brk #$f3
$09:9e61  4f bc 63 7f   eor $7f63bc
$09:9e65  b0 37		 bcs $9e9e
$09:9e67  ef 6c ff 66   sbc $66ff6c
$09:9e6b  a6 3f		 ldx $3f
$09:9e6d  3f e6 7f 7f   and $7f7fe6,x
$09:9e71  bf 3f df 3f   lda $3fdf3f,x
$09:9e75  cf 27 c0 24   cmp $24c027
$09:9e79  c0 3d c0	  cpy #$c03d
$09:9e7c  27 c0		 and [$c0]
$09:9e7e  24 43		 bit $43
$09:9e80  24 c3		 bit $c3
$09:9e82  d2 2b		 cmp ($2b)
$09:9e84  a0 4b 6e	  ldy #$6e4b
$09:9e87  cb			wai
$09:9e88  9a			txs
$09:9e89  43 84		 eor $84,s
$09:9e8b  5b			tcd
$09:9e8c  5a			phy
$09:9e8d  37 00		 and [$00],y
$09:9e8f  ff 00 3c 00   sbc $003c00,x
$09:9e93  fe 00 fe	  inc $fe00,x
$09:9e96  00 fe		 brk #$fe
$09:9e98  00 fe		 brk #$fe
$09:9e9a  00 fe		 brk #$fe
$09:9e9c  00 fe		 brk #$fe
$09:9e9e  00 00		 brk #$00
$09:9ea0  00 80		 brk #$80
$09:9ea2  40			rti
$09:9ea3  b1 71		 lda ($71),y
$09:9ea5  88			dey
$09:9ea6  5b			tcd
$09:9ea7  a0 56 a9	  ldy #$a956
$09:9eaa  33 8c		 and ($8c,s),y
$09:9eac  0c 80 4c	  tsb $4c80
$09:9eaf  ff 7f 00 7f   sbc $7f007f,x
$09:9eb3  00 7f		 brk #$7f
$09:9eb5  00 7f		 brk #$7f
$09:9eb7  00 7f		 brk #$7f
$09:9eb9  00 7f		 brk #$7f
$09:9ebb  00 7f		 brk #$7f
$09:9ebd  00 00		 brk #$00
$09:9ebf  00 00		 brk #$00
$09:9ec1  00 00		 brk #$00
$09:9ec3  01 41		 ora ($41,x)
$09:9ec5  20 a3 44	  jsr $44a3
$09:9ec8  ed 12 e7	  sbc $e712
$09:9ecb  10 0b		 bpl $9ed8
$09:9ecd  03 5c		 ora $5c,s
$09:9ecf  ff ff 00 ff   sbc $ff00ff,x
$09:9ed3  00 ff		 brk #$ff
$09:9ed5  00 ff		 brk #$ff
$09:9ed7  00 ff		 brk #$ff
$09:9ed9  00 ff		 brk #$ff
$09:9edb  00 fc		 brk #$fc
$09:9edd  00 00		 brk #$00
$09:9edf  00 00		 brk #$00
$09:9ee1  01 00		 ora ($00,x)
$09:9ee3  a3 a2		 lda $a2,s
$09:9ee5  41 e2		 eor ($e2,x)
$09:9ee7  11 b2		 ora ($b2),y
$09:9ee9  01 b6		 ora ($b6,x)
$09:9eeb  4b			phk
$09:9eec  68			pla
$09:9eed  21 da		 and ($da,x)
$09:9eef  ff fe 00 fe   sbc $fe00fe,x
$09:9ef3  00 fe		 brk #$fe
$09:9ef5  00 fe		 brk #$fe
$09:9ef7  00 fe		 brk #$fe
$09:9ef9  00 fc		 brk #$fc
$09:9efb  00 de		 brk #$de
$09:9efd  00 00		 brk #$00
$09:9eff  00 d0		 brk #$d0
$09:9f01  80 bf		 bra $9ec2
$09:9f03  00 ff		 brk #$ff
$09:9f05  00 78		 brk #$78
$09:9f07  07 f0		 ora [$f0]
$09:9f09  0f 71 0e 76   ora $760e71
$09:9f0d  0b			phd
$09:9f0e  f0 0f		 beq $9f1f
$09:9f10  00 2f		 brk #$2f
$09:9f12  00 7f		 brk #$7f
$09:9f14  07 7f		 ora [$7f]
$09:9f16  0f ff 1f 7f   ora $7f1fff
$09:9f1a  1f ff 1f ff   ora $ff1fff,x
$09:9f1e  1f 7f 00 00   ora $00007f,x
$09:9f22  ff 00 ff 00   sbc $00ff00,x
$09:9f26  02 ff		 cop #$ff
$09:9f28  20 df 00	  jsr $00df
$09:9f2b  ff 22 fd 00   sbc $00fd22,x
$09:9f2f  ff 00 ff 00   sbc $00ff00,x
$09:9f33  ff ff ff ff   sbc $ffffff,x
$09:9f37  ff ff ff ff   sbc $ffffff,x
$09:9f3b  ff ff ff ff   sbc $ffffff,x
$09:9f3f  ff 40 ff 00   sbc $00ff40,x
$09:9f43  ff 80 7f 04   sbc $047f80,x
$09:9f47  ff 22 fd 00   sbc $00fd22,x
$09:9f4b  ff 12 ef 00   sbc $00ef12,x
$09:9f4f  ff ff ff ff   sbc $ffffff,x
$09:9f53  ff ff ff ff   sbc $ffffff,x
$09:9f57  ff ff ff ff   sbc $ffffff,x
$09:9f5b  ff ff ff ff   sbc $ffffff,x
$09:9f5f  ff ff ff ff   sbc $ffffff,x
$09:9f63  00 ff		 brk #$ff
$09:9f65  00 00		 brk #$00
$09:9f67  ff ff 00 00   sbc $0000ff,x
$09:9f6b  00 00		 brk #$00
$09:9f6d  00 ff		 brk #$ff
$09:9f6f  00 ff		 brk #$ff
$09:9f71  ff ff ff 00   sbc $00ffff,x
$09:9f75  ff 00 ff 00   sbc $00ff00,x
$09:9f79  00 00		 brk #$00
$09:9f7b  ff 00 ff 00   sbc $00ff00,x
$09:9f7f  00 08		 brk #$08
$09:9f81  a4 08		 ldy $08
$09:9f83  e4 0d		 cpx $0d
$09:9f85  c0 02 b4	  cpy #$b402
$09:9f88  06 f0		 asl $f0
$09:9f8a  35 c8		 and $c8,x
$09:9f8c  10 ca		 bpl $9f58
$09:9f8e  14 c0		 trb $c0
$09:9f90  00 5f		 brk #$5f
$09:9f92  00 1f		 brk #$1f
$09:9f94  00 3f		 brk #$3f
$09:9f96  00 4f		 brk #$4f
$09:9f98  00 0f		 brk #$0f
$09:9f9a  00 37		 brk #$37
$09:9f9c  00 35		 brk #$35
$09:9f9e  00 3f		 brk #$3f
$09:9fa0  a8			tay
$09:9fa1  89 26 bd	  bit #$bd26
$09:9fa4  82 3d 8e	  brl $2de4
$09:9fa7  35 a2		 and $a2,x
$09:9fa9  0d 96 ad	  ora $ad96
$09:9fac  16 ad		 asl $ad,x
$09:9fae  c0 15 04	  cpy #$0415
$09:9fb1  fe 00 ee	  inc $ee00,x
$09:9fb4  00 ee		 brk #$ee
$09:9fb6  00 ee		 brk #$ee
$09:9fb8  00 fe		 brk #$fe
$09:9fba  00 de		 brk #$de
$09:9fbc  00 de		 brk #$de
$09:9fbe  00 fe		 brk #$fe
$09:9fc0  00 70		 brk #$70
$09:9fc2  37 8f		 and [$8f],y
$09:9fc4  5b			tcd
$09:9fc5  bc 2c e4	  ldy $e42c,x
$09:9fc8  58			cli
$09:9fc9  4b			phk
$09:9fca  52 76		 eor ($76)
$09:9fcc  26 0b		 rol $0b
$09:9fce  2c 04 00	  bit $0004
$09:9fd1  8f 00 7f 00   sta $007f00
$09:9fd5  7f 13 7f 24   adc $247f13,x
$09:9fd9  ff 09 ff 50   sbc $50ff09,x
$09:9fdd  ff 53 ff 00   sbc $00ff53,x
$09:9fe1  0e c8 f1	  asl $f1c8
$09:9fe4  4e a9 02	  lsr $02a9
$09:9fe7  15 6e		 ora $6e,x
$09:9fe9  ed d0 bb	  sbc $bbd0
$09:9fec  86 37		 stx $37
$09:9fee  82 d7 00	  brl $a0c8
$09:9ff1  f1 00		 sbc ($00),y
$09:9ff3  fe 10 fe	  inc $fe10,x
$09:9ff6  e8			inx
$09:9ff7  fe 10 fe	  inc $fe10,x
$09:9ffa  04 fe		 tsb $fe
$09:9ffc  48			pha
$09:9ffd  fe 28 fe	  inc $fe28,x
$09:a000  7f 7a fb da   adc $dafb7a,x
$09:a004  df de ff fe   cmp $feffde,x
$09:a008  ff b6 f7 f4   sbc $f4f7b6,x
$09:a00c  bf be fd dc   lda $dcfdbe,x
$09:a010  7a			ply
$09:a011  80 da		 bra $9fed
$09:a013  04 de		 tsb $de
$09:a015  20 fe 00	  jsr $00fe
$09:a018  b6 00		 ldx $00,y
$09:a01a  f4 08 be	  pea $be08
$09:a01d  40			rti
$09:a01e  dc 02 ff	  jml [$ff02]
$09:a021  ff 64 9b df   sbc $df9b64,x
$09:a025  24 fb		 bit $fb
$09:a027  04 ff		 tsb $ff
$09:a029  00 ed		 brk #$ed
$09:a02b  ff 9b 64 00   sbc $00649b,x
$09:a02f  ff 00 00 ff   sbc $ff0000,x
$09:a033  ff fb fb ff   sbc $fffbfb,x
$09:a037  ff ff ff 00   sbc $00ffff,x
$09:a03b  00 ff		 brk #$ff
$09:a03d  ff 00 00 11   sbc $110000,x
$09:a041  ef 42 fd 65   sbc $65fd42
$09:a045  ff 52 df 0b   sbc $0bdf52,x
$09:a049  fb			xce
$09:a04a  3d bf d6	  and $d6bf,x
$09:a04d  a9 51 d1	  lda #$d151
$09:a050  00 7f		 brk #$7f
$09:a052  00 7f		 brk #$7f
$09:a054  00 7f		 brk #$7f
$09:a056  20 7f 04	  jsr $047f
$09:a059  7f 40 7f 00   adc $007f40,x
$09:a05d  7f 2e fe 24   adc $24fe2e,x
$09:a061  fc 58 f8	  jsr ($f858,x)
$09:a064  b4 fc		 ldy $fc,x
$09:a066  f8			sed
$09:a067  fc 84 a4	  jsr ($a484,x)
$09:a06a  b0 f0		 bcs $a05c
$09:a06c  de 20 16	  dec $1620,x
$09:a06f  97 03		 sta [$03],y
$09:a071  fe 07 fe	  inc $fe07,x
$09:a074  03 fe		 ora $fe,s
$09:a076  03 fe		 ora $fe,s
$09:a078  5b			tcd
$09:a079  fe 0f fe	  inc $fe0f,x
$09:a07c  01 fe		 ora ($fe,x)
$09:a07e  68			pla
$09:a07f  7f c4 4c b8   adc $b84cc4,x
$09:a083  78			sei
$09:a084  54 2c 48	  mvn $48,$2c
$09:a087  1c 44 04	  trb $0444
$09:a08a  10 50		 bpl $a0dc
$09:a08c  56 00		 lsr $00,x
$09:a08e  16 17		 asl $17,x
$09:a090  33 fe		 and ($fe,s),y
$09:a092  07 fe		 ora [$fe]
$09:a094  03 fe		 ora $fe,s
$09:a096  03 fe		 ora $fe,s
$09:a098  3b			tsc
$09:a099  fe 2f fe	  inc $fe2f,x
$09:a09c  01 fe		 ora ($fe,x)
$09:a09e  68			pla
$09:a09f  ff 12 ea 48   sbc $48ea12,x
$09:a0a3  fa			plx
$09:a0a4  76 e8		 ror $e8,x
$09:a0a6  5a			phy
$09:a0a7  d4 0a		 pei ($0a)
$09:a0a9  fa			plx
$09:a0aa  34 b2		 bit $b2,x
$09:a0ac  d6 a8		 dec $a8,x
$09:a0ae  a8			tay
$09:a0af  a8			tay
$09:a0b0  04 7f		 tsb $7f
$09:a0b2  04 7f		 tsb $7f
$09:a0b4  00 7f		 brk #$7f
$09:a0b6  20 7f 04	  jsr $047f
$09:a0b9  7f 48 7f 00   adc $007f48,x
$09:a0bd  7f 56 ff f5   adc $f5ff56,x
$09:a0c1  2a			rol a
$09:a0c2  bf 55 7d 2a   lda $2a7d55,x
$09:a0c6  2f 55 7d 2a   and $2a7d55
$09:a0ca  bf f5 5d 0a   lda $0a5df5,x
$09:a0ce  7f 55 20 80   adc $802055,x
$09:a0d2  04 80		 tsb $80
$09:a0d4  08			php
$09:a0d5  80 04		 bra $a0db
$09:a0d7  80 20		 bra $a0f9
$09:a0d9  c0 b1 40	  cpy #$40b1
$09:a0dc  00 e0		 brk #$e0
$09:a0de  14 e0		 trb $e0
$09:a0e0  66 19		 ror $19
$09:a0e2  ff 7f b0 60   sbc $60b07f,x
$09:a0e6  40			rti
$09:a0e7  20 c5 6b	  jsr $6bc5
$09:a0ea  49 ec ae	  eor #$aeec
$09:a0ed  48			pha
$09:a0ee  a8			tay
$09:a0ef  4a			lsr a
$09:a0f0  ff 00 ff 00   sbc $00ff00,x
$09:a0f4  ff 00 e0 1f   sbc $1fe000,x
$09:a0f8  e0 1f e0	  cpx #$e01f
$09:a0fb  1f e0 1f e0   ora $e01fe0,x
$09:a0ff  1d ca 34	  ora $34ca,x
$09:a102  ff fa 0d 06   sbc $060dfa,x
$09:a106  06 00		 asl $00
$09:a108  a3 d6		 lda $d6,s
$09:a10a  92 37		 sta ($37)
$09:a10c  75 12		 adc $12,x
$09:a10e  15 52		 ora $52,x
$09:a110  ff 00 ff 00   sbc $00ff00,x
$09:a114  ff 00 07 f8   sbc $f80700,x
$09:a118  07 f8		 ora [$f8]
$09:a11a  07 f8		 ora [$f8]
$09:a11c  07 f8		 ora [$f8]
$09:a11e  07 b8		 ora [$b8]
$09:a120  e7 5b		 sbc [$5b]
$09:a122  39 e6 bf	  and $bfe6,y
$09:a125  49 f7 db	  eor #$dbf7
$09:a128  7f 52 3c 34   adc $343c52,x
$09:a12c  18			clc
$09:a12d  18			clc
$09:a12e  00 00		 brk #$00
$09:a130  43 43		 eor $43,s
$09:a132  20 20 09	  jsr $0920
$09:a135  09 d3 d3	  ora #$d3d3
$09:a138  52 52		 eor ($52)
$09:a13a  34 34		 bit $34,x
$09:a13c  18			clc
$09:a13d  18			clc
$09:a13e  00 00		 brk #$00
$09:a140  ff 00 80 00   sbc $008000,x
$09:a144  c4 3b		 cpy $3b
$09:a146  fa			plx
$09:a147  3f b2 12 c0   and $c012b2,x
$09:a14b  00 ff		 brk #$ff
$09:a14d  00 98		 brk #$98
$09:a14f  00 00		 brk #$00
$09:a151  00 00		 brk #$00
$09:a153  7f 00 7f 00   adc $007f00,x
$09:a157  7f 0d 7f 00   adc $007f0d,x
$09:a15b  3f 00 00 00   and $000000,x
$09:a15f  67 ff		 adc [$ff]
$09:a161  00 0b		 brk #$0b
$09:a163  00 b9		 brk #$b9
$09:a165  40			rti
$09:a166  69 80 91	  adc #$9180
$09:a169  e0 03 00	  cpx #$0003
$09:a16c  ff 00 d7 00   sbc $00d700,x
$09:a170  00 00		 brk #$00
$09:a172  00 f4		 brk #$f4
$09:a174  00 fe		 brk #$fe
$09:a176  00 fe		 brk #$fe
$09:a178  00 fe		 brk #$fe
$09:a17a  00 fc		 brk #$fc
$09:a17c  00 00		 brk #$00
$09:a17e  00 28		 brk #$28
$09:a180  14 8a		 trb $8a
$09:a182  14 c2		 trb $c2
$09:a184  1c 80 18	  trb $1880
$09:a187  c2 18		 rep #$18
$09:a189  e2 08		 sep #$08
$09:a18b  a2 09 44	  ldx #$4409
$09:a18e  80 36		 bra $a1c6
$09:a190  00 75		 brk #$75
$09:a192  00 3d		 brk #$3d
$09:a194  00 7f		 brk #$7f
$09:a196  00 3d		 brk #$3d
$09:a198  00 1d		 brk #$1d
$09:a19a  00 5d		 brk #$5d
$09:a19c  00 bb		 brk #$bb
$09:a19e  00 c9		 brk #$c9
$09:a1a0  4a			lsr a
$09:a1a1  95 d0		 sta $d0,x
$09:a1a3  2d 58 8d	  and $8d58
$09:a1a6  40			rti
$09:a1a7  9f c0 1d c8   sta $c81dc0,x
$09:a1ab  17 84		 ora [$84],y
$09:a1ad  2a			rol a
$09:a1ae  2a			rol a
$09:a1af  44 00 fe	  mvp $fe,$00
$09:a1b2  00 de		 brk #$de
$09:a1b4  00 fe		 brk #$fe
$09:a1b6  00 fc		 brk #$fc
$09:a1b8  00 fe		 brk #$fe
$09:a1ba  00 fc		 brk #$fc
$09:a1bc  00 fd		 brk #$fd
$09:a1be  00 bb		 brk #$bb
$09:a1c0  27 0f		 and [$0f]
$09:a1c2  13 34		 ora ($34,s),y
$09:a1c4  0c 14 5b	  tsb $5b14
$09:a1c7  5c 64 2c 3a   jml $3a2c64
$09:a1cb  9d 35 8f	  sta $8f35,x
$09:a1ce  05 d2		 ora $d2
$09:a1d0  50 ff		 bvc $a1d1
$09:a1d2  48			pha
$09:a1d3  ff 63 ff 20   sbc $20ff63,x
$09:a1d7  ff 13 ff 00   sbc $00ff13,x
$09:a1db  7f 00 7f 00   adc $007f00,x
$09:a1df  2d d6 83	  and $83d6
$09:a1e2  26 b3		 rol $b3
$09:a1e4  6a			ror a
$09:a1e5  47 10		 eor [$10]
$09:a1e7  db			stp
$09:a1e8  64 55		 stz $55
$09:a1ea  ea			nop
$09:a1eb  2d 54 6d	  and $6d54
$09:a1ee  58			cli
$09:a1ef  89 28 fe	  bit #$fe28
$09:a1f2  48			pha
$09:a1f3  fe 90 fe	  inc $fe90,x
$09:a1f6  24 fe		 bit $fe
$09:a1f8  88			dey
$09:a1f9  fe 10 fe	  inc $fe10,x
$09:a1fc  80 fe		 bra $a1fc
$09:a1fe  04 fe		 tsb $fe
$09:a200  00 00		 brk #$00
$09:a202  32 cd		 and ($cd)
$09:a204  00 01		 brk #$01
$09:a206  00 ff		 brk #$ff
$09:a208  00 01		 brk #$01
$09:a20a  00 01		 brk #$01
$09:a20c  00 fd		 brk #$fd
$09:a20e  00 fd		 brk #$fd
$09:a210  00 ff		 brk #$ff
$09:a212  00 ff		 brk #$ff
$09:a214  00 fe		 brk #$fe
$09:a216  00 00		 brk #$00
$09:a218  00 fe		 brk #$fe
$09:a21a  00 fe		 brk #$fe
$09:a21c  00 02		 brk #$02
$09:a21e  00 02		 brk #$02
$09:a220  00 ff		 brk #$ff
$09:a222  29 ab 10	  and #$10ab
$09:a225  93 50		 sta ($50,s),y
$09:a227  7d fe 01	  adc $01fe,x
$09:a22a  00 ad		 brk #$ad
$09:a22c  00 fb		 brk #$fb
$09:a22e  00 dd		 brk #$dd
$09:a230  00 00		 brk #$00
$09:a232  54 7d 6c	  mvn $6c,$7d
$09:a235  fe 82 fe	  inc $fe82,x
$09:a238  00 fe		 brk #$fe
$09:a23a  00 52		 brk #$52
$09:a23c  00 04		 brk #$04
$09:a23e  00 22		 brk #$22
$09:a240  00 ff		 brk #$ff
$09:a242  75 8f		 adc $8f,x
$09:a244  99 98 8a	  sta $8a98,y
$09:a247  00 54		 brk #$54
$09:a249  00 00		 brk #$00
$09:a24b  7b			tdc
$09:a24c  00 ee		 brk #$ee
$09:a24e  00 bb		 brk #$bb
$09:a250  00 00		 brk #$00
$09:a252  00 ff		 brk #$ff
$09:a254  66 ff		 ror $ff
$09:a256  00 ff		 brk #$ff
$09:a258  00 ff		 brk #$ff
$09:a25a  00 84		 brk #$84
$09:a25c  00 11		 brk #$11
$09:a25e  00 44		 brk #$44
$09:a260  54 a9 22	  mvn $22,$a9
$09:a263  d9 04 fb	  cmp $fb04,y
$09:a266  62 9f 62	  per $0508
$09:a269  fd 30 ff	  sbc $ff30,x
$09:a26c  42 bf		 wdm #$bf
$09:a26e  32 cf		 and ($cf)
$09:a270  70 06		 bvs $a278
$09:a272  30 06		 bmi $a27a
$09:a274  00 06		 brk #$06
$09:a276  60			rts
$09:a277  06 70		 asl $70
$09:a279  06 70		 asl $70
$09:a27b  06 70		 asl $70
$09:a27d  06 30		 asl $30
$09:a27f  06 60		 asl $60
$09:a281  9f 40 bf 03   sta $03bf40,x
$09:a285  fc 46 f9	  jsr ($f946,x)
$09:a288  45 bb		 eor $bb
$09:a28a  06 fb		 asl $fb
$09:a28c  44 fb 47	  mvp $47,$fb
$09:a28f  f8			sed
$09:a290  00 60		 brk #$60
$09:a292  00 60		 brk #$60
$09:a294  03 60		 ora $60,s
$09:a296  07 60		 ora [$60]
$09:a298  07 60		 ora [$60]
$09:a29a  07 60		 ora [$60]
$09:a29c  07 60		 ora [$60]
$09:a29e  07 60		 ora [$60]
$09:a2a0  00 fe		 brk #$fe
$09:a2a2  40			rti
$09:a2a3  bf 62 bd 72   lda $72bd62,x
$09:a2a7  ad 44 a1	  lda $a144
$09:a2aa  20 df a4	  jsr $a4df
$09:a2ad  27 ac		 and [$ac]
$09:a2af  01 01		 ora ($01,x)
$09:a2b1  00 00		 brk #$00
$09:a2b3  60			rts
$09:a2b4  0e 60 1e	  asl $1e60
$09:a2b7  60			rts
$09:a2b8  1e 60 00	  asl $0060,x
$09:a2bb  20 58 fe	  jsr $fe58
$09:a2be  00 fe		 brk #$fe
$09:a2c0  a3 00		 lda $00,s
$09:a2c2  90 40		 bcc $a304
$09:a2c4  cd a0 66	  cmp $66a0
$09:a2c7  90 81		 bcc $a24a
$09:a2c9  78			sei
$09:a2ca  db			stp
$09:a2cb  e4 e8		 cpx $e8
$09:a2cd  9e ab 74	  stz $74ab,x
$09:a2d0  7f 00 3f 80   adc $803f00,x
$09:a2d4  1f c0 0f e0   ora $e00fc0,x
$09:a2d8  07 f0		 ora [$f0]
$09:a2da  03 f8		 ora $f8,s
$09:a2dc  01 fc		 ora ($fc,x)
$09:a2de  00 fe		 brk #$fe
$09:a2e0  95 00		 sta $00,x
$09:a2e2  c0 03 1f	  cpy #$1f03
$09:a2e5  01 e6		 ora ($e6,x)
$09:a2e7  0b			phd
$09:a2e8  8d 56 6e	  sta $6e56
$09:a2eb  91 b3		 sta ($b3),y
$09:a2ed  4f cc 33 fe   eor $fe33cc
$09:a2f1  00 fc		 brk #$fc
$09:a2f3  01 f8		 ora ($f8,x)
$09:a2f5  03 f0		 ora $f0,s
$09:a2f7  07 e0		 ora [$e0]
$09:a2f9  0f c0 1f 80   ora $801fc0
$09:a2fd  3f 00 7f 5f   and $5f7f00,x
$09:a301  ab			plb
$09:a302  d7 fd		 cmp [$fd],y
$09:a304  77 fa		 adc [$fa],y
$09:a306  db			stp
$09:a307  3d db 3d	  and $3ddb,x
$09:a30a  77 ea		 adc [$ea],y
$09:a30c  df f3 5b ad   cmp $ad5bf3,x
$09:a310  0b			phd
$09:a311  0b			phd
$09:a312  11 11		 ora ($11),y
$09:a314  02 02		 cop #$02
$09:a316  01 01		 ora ($01,x)
$09:a318  01 01		 ora ($01,x)
$09:a31a  00 00		 brk #$00
$09:a31c  13 13		 ora ($13,s),y
$09:a31e  09 09 7f	  ora #$7f09
$09:a321  f4 d6 ef	  pea $efd6
$09:a324  35 eb		 and $eb,x
$09:a326  da			phx
$09:a327  bd da 2d	  lda $2dda,x
$09:a32a  b5 fb		 lda $fb,x
$09:a32c  e6 df		 inc $df
$09:a32e  5b			tcd
$09:a32f  bc 74 74	  ldy $7474,x
$09:a332  80 80		 bra $a2b4
$09:a334  00 00		 brk #$00
$09:a336  80 80		 bra $a2b8
$09:a338  00 00		 brk #$00
$09:a33a  80 80		 bra $a2bc
$09:a33c  c0 c0 10	  cpy #$10c0
$09:a33f  10 00		 bpl $a341
$09:a341  ff d0 d3 d0   sbc $d0d3d0,x
$09:a345  d3 00		 cmp ($00,s),y
$09:a347  01 fe		 ora ($fe,x)
$09:a349  01 00		 ora ($00,x)
$09:a34b  f3 00		 sbc ($00,s),y
$09:a34d  ff fe 01 00   sbc $0001fe,x
$09:a351  00 2c		 brk #$2c
$09:a353  fe 2c fe	  inc $fe2c,x
$09:a356  00 fe		 brk #$fe
$09:a358  00 fe		 brk #$fe
$09:a35a  00 0c		 brk #$0c
$09:a35c  00 00		 brk #$00
$09:a35e  00 fe		 brk #$fe
$09:a360  0e c1 38	  asl $38c1
$09:a363  87 2d		 sta [$2d]
$09:a365  83 18		 sta $18,s
$09:a367  85 02		 sta $02
$09:a369  9d 27 df	  sta $df27,x
$09:a36c  57 af		 eor [$af],y
$09:a36e  63 9f		 adc $9f,s
$09:a370  3f 00 7f 00   and $007f00,x
$09:a374  7f 00 7e 00   adc $007e00,x
$09:a378  63 03		 adc $03,s
$09:a37a  3f 3f 7f 7f   and $7f7f3f,x
$09:a37e  7f 7f 00 c7   adc $c7007f,x
$09:a382  44 29 a8	  mvp $a8,$29
$09:a385  13 4a		 ora ($4a,s),y
$09:a387  a7 ac		 lda [$ac]
$09:a389  fd 34 75	  sbc $7534,x
$09:a38c  f6 bf		 inc $bf,x
$09:a38e  58			cli
$09:a38f  cd 00 00	  cmp $0000
$09:a392  00 c6		 brk #$c6
$09:a394  00 ee		 brk #$ee
$09:a396  00 fe		 brk #$fe
$09:a398  02 fe		 cop #$fe
$09:a39a  8a			txa
$09:a39b  fe 00 fe	  inc $fe00,x
$09:a39e  22 fe 11 6f   jsl $6f11fe
$09:a3a2  42 7d		 wdm #$7d
$09:a3a4  65 7f		 adc $7f
$09:a3a6  52 5f		 eor ($5f)
$09:a3a8  0b			phd
$09:a3a9  7b			tdc
$09:a3aa  3d 3f 56	  and $563f,x
$09:a3ad  29 a9 a8	  and #$a8a9
$09:a3b0  00 ff		 brk #$ff
$09:a3b2  00 ff		 brk #$ff
$09:a3b4  00 ff		 brk #$ff
$09:a3b6  20 ff 04	  jsr $04ff
$09:a3b9  ff 40 ff 00   sbc $00ff40,x
$09:a3bd  ff 56 ff 00   sbc $00ff56,x
$09:a3c1  4e 4a 91	  lsr $914a
$09:a3c4  5e ab 90	  lsr $90ab,x
$09:a3c7  a5 64		 lda $64
$09:a3c9  d9 7a df	  cmp $df7a,y
$09:a3cc  a4 6d		 ldy $6d
$09:a3ce  00 d3		 brk #$d3
$09:a3d0  00 30		 brk #$30
$09:a3d2  00 7e		 brk #$7e
$09:a3d4  00 fe		 brk #$fe
$09:a3d6  4a			lsr a
$09:a3d7  fe 02 fe	  inc $fe02,x
$09:a3da  00 fe		 brk #$fe
$09:a3dc  12 fe		 ora ($fe)
$09:a3de  00 2c		 brk #$2c
$09:a3e0  00 3d		 brk #$3d
$09:a3e2  18			clc
$09:a3e3  c3 54		 cmp $54,s
$09:a3e5  29 14 4f	  and #$4f14
$09:a3e8  90 05		 bcc $a3ef
$09:a3ea  04 93		 tsb $93
$09:a3ec  32 93		 and ($93)
$09:a3ee  b4 83		 ldy $83,x
$09:a3f0  00 00		 brk #$00
$09:a3f2  00 3c		 brk #$3c
$09:a3f4  00 fe		 brk #$fe
$09:a3f6  00 fc		 brk #$fc
$09:a3f8  00 fe		 brk #$fe
$09:a3fa  00 fe		 brk #$fe
$09:a3fc  00 fe		 brk #$fe
$09:a3fe  00 fe		 brk #$fe
$09:a400  06 f9		 asl $f9
$09:a402  00 0c		 brk #$0c
$09:a404  00 0f		 brk #$0f
$09:a406  80 7d		 bra $a485
$09:a408  40			rti
$09:a409  bd 00 01	  lda $0100,x
$09:a40c  00 01		 brk #$01
$09:a40e  00 ff		 brk #$ff
$09:a410  00 07		 brk #$07
$09:a412  00 f3		 brk #$f3
$09:a414  00 f0		 brk #$f0
$09:a416  00 f2		 brk #$f2
$09:a418  00 fa		 brk #$fa
$09:a41a  00 fe		 brk #$fe
$09:a41c  00 fe		 brk #$fe
$09:a41e  00 00		 brk #$00
$09:a420  c0 3e 20	  cpy #$203e
$09:a423  df a2 5d d2   cmp $d25da2,x
$09:a427  2d 84 21	  and $2184
$09:a42a  00 ff		 brk #$ff
$09:a42c  a4 a7		 ldy $a7
$09:a42e  ac 01 c1	  ldy $c101
$09:a431  00 e0		 brk #$e0
$09:a433  00 ee		 brk #$ee
$09:a435  00 de		 brk #$de
$09:a437  00 de		 brk #$de
$09:a439  00 00		 brk #$00
$09:a43b  00 58		 brk #$58
$09:a43d  fe 00 fe	  inc $fe00,x
$09:a440  53 ac		 eor ($ac,s),y
$09:a442  84 7b		 sty $7b
$09:a444  c6 39		 dec $39
$09:a446  6a			ror a
$09:a447  04 83		 tsb $83
$09:a449  7c 28 ab	  jmp ($ab28,x)
$09:a44c  10 93		 bpl $a3e1
$09:a44e  50 7d		 bvc $a4cd
$09:a450  73 00		 adc ($00,s),y
$09:a452  f7 00		 sbc [$00],y
$09:a454  f7 00		 sbc [$00],y
$09:a456  fb			xce
$09:a457  00 83		 brk #$83
$09:a459  00 54		 brk #$54
$09:a45b  7c 6c fe	  jmp ($fe6c,x)
$09:a45e  82 fe 63	  brl $085f
$09:a461  9c 10 8f	  stz $8f10
$09:a464  33 ac		 and ($ac,s),y
$09:a466  52 ef		 eor ($ef)
$09:a468  37 af		 and [$af],y
$09:a46a  13 8f		 ora ($8f,s),y
$09:a46c  14 eb		 trb $eb
$09:a46e  50 ef		 bvc $a45f
$09:a470  03 60		 ora $60,s
$09:a472  60			rts
$09:a473  70 43		 bvs $a4b8
$09:a475  70 07		 bvs $a47e
$09:a477  70 47		 bvs $a4c0
$09:a479  70 67		 bvs $a4e2
$09:a47b  70 07		 bvs $a484
$09:a47d  70 00		 bvs $a47f
$09:a47f  70 00		 bvs $a481
$09:a481  ff 0e f1 8b   sbc $8bf10e,x
$09:a485  76 59		 ror $59,x
$09:a487  a6 ee		 ldx $ee
$09:a489  d1 e4		 cmp ($e4),y
$09:a48b  db			stp
$09:a48c  a2 5f 84	  ldx #$845f
$09:a48f  7b			tdc
$09:a490  00 00		 brk #$00
$09:a492  0e 00 9f	  asl $9f00
$09:a495  00 df		 brk #$df
$09:a497  00 ee		 brk #$ee
$09:a499  00 e4		 brk #$e4
$09:a49b  00 e0		 brk #$e0
$09:a49d  06 80		 asl $80
$09:a49f  06 52		 asl $52
$09:a4a1  af 84 7b c0   lda $c07b84
$09:a4a5  3d 66 0b	  and $0b66,x
$09:a4a8  80 7f		 bra $a529
$09:a4aa  28			plp
$09:a4ab  ab			plb
$09:a4ac  10 93		 bpl $a441
$09:a4ae  50 7d		 bvc $a52d
$09:a4b0  70 06		 bvs $a4b8
$09:a4b2  f0 06		 beq $a4ba
$09:a4b4  f2 06		 sbc ($06)
$09:a4b6  f0 06		 beq $a4be
$09:a4b8  80 02		 bra $a4bc
$09:a4ba  54 7c 6c	  mvn $6c,$7c
$09:a4bd  fe 82 fe	  inc $fe82,x
$09:a4c0  11 ef		 ora ($ef),y
$09:a4c2  42 fd		 wdm #$fd
$09:a4c4  a5 3f		 lda $3f
$09:a4c6  52 df		 eor ($df)
$09:a4c8  8b			phb
$09:a4c9  7b			tdc
$09:a4ca  1d 1f 56	  ora $561f,x
$09:a4cd  29 a5 00	  and #$00a5
$09:a4d0  00 7f		 brk #$7f
$09:a4d2  00 7f		 brk #$7f
$09:a4d4  40			rti
$09:a4d5  7f 20 7f 04   adc $047f20,x
$09:a4d9  7f 60 ff 00   adc $00ff60,x
$09:a4dd  ff 00 7f 24   sbc $247f00,x
$09:a4e1  fd 58 f9	  sbc $f958,x
$09:a4e4  a5 ed		 lda $ed
$09:a4e6  f9 fc 84	  sbc $84fc,y
$09:a4e9  a5 b1		 lda $b1
$09:a4eb  f0 d6		 beq $a4c3
$09:a4ed  20 21 00	  jsr $0021
$09:a4f0  02 fe		 cop #$fe
$09:a4f2  06 fe		 asl $fe
$09:a4f4  12 fe		 ora ($fe)
$09:a4f6  02 fe		 cop #$fe
$09:a4f8  5a			phy
$09:a4f9  fe 0e fe	  inc $fe0e,x
$09:a4fc  00 ff		 brk #$ff
$09:a4fe  00 fe		 brk #$fe
$09:a500  b7 02		 lda [$02],y
$09:a502  8f 40 97 52   sta $529740
$09:a506  f6 90		 inc $90,x
$09:a508  b0 e9		 bcs $a4f3
$09:a50a  a6 fb		 ldx $fb
$09:a50c  ad f8 af	  lda $aff8
$09:a50f  f0 01		 beq $a512
$09:a511  59 23 7b	  eor $7b23,y
$09:a514  21 79		 and ($79,x)
$09:a516  62 7b 70	  per $1594
$09:a519  7f 70 7b 70   adc $707b70,x
$09:a51d  72 78		 adc ($78)
$09:a51f  7a			ply
$09:a520  f7 02		 sbc [$02],y
$09:a522  3f c0 3f 42   and $423fc0,x
$09:a526  be c0 7c	  ldx $7cc0,y
$09:a529  c1 3e		 cmp ($3e,x)
$09:a52b  03 3c		 ora $3c,s
$09:a52d  40			rti
$09:a52e  7f c0 01 39   adc $3901c0,x
$09:a532  03 9b		 ora $9b,s
$09:a534  81 d9		 sta ($d9,x)
$09:a536  02 db		 cop #$db
$09:a538  00 db		 brk #$db
$09:a53a  c0 db 80	  cpy #$80db
$09:a53d  db			stp
$09:a53e  00 db		 brk #$db
$09:a540  fd 02 a3	  sbc $a302,x
$09:a543  5e 43 be	  lsr $be43,x
$09:a546  ff 00 d1 d2   sbc $d2d100,x
$09:a54a  d1 d2		 cmp ($d2),y
$09:a54c  01 00		 ora ($00,x)
$09:a54e  ff 00 fe fe   sbc $fefe00,x
$09:a552  fe fe fe	  inc $fefe,x
$09:a555  fe 00 00	  inc $0000,x
$09:a558  2c fe 2c	  bit $2cfe
$09:a55b  fe 00 fe	  inc $fe00,x
$09:a55e  00 fe		 brk #$fe
$09:a560  46 bf		 lsr $bf
$09:a562  61 9f		 adc ($9f,x)
$09:a564  43 bf		 eor $bf,s
$09:a566  61 9f		 adc ($9f,x)
$09:a568  43 bf		 eor $bf,s
$09:a56a  65 9f		 adc $9f
$09:a56c  43 bf		 eor $bf,s
$09:a56e  67 9f		 adc [$9f]
$09:a570  7f 7f 7f 7f   adc $7f7f7f,x
$09:a574  7f 7f 7f 7f   adc $7f7f7f,x
$09:a578  7f 7f 7f 7f   adc $7f7f7f,x
$09:a57c  7f 7f 7f 7f   adc $7f7f7f,x
$09:a580  5e b7 ae	  lsr $aeb7,x
$09:a583  c5 d2		 cmp $d2
$09:a585  7f 68 df 6e   adc $6edf68,x
$09:a589  25 a8		 and $a8
$09:a58b  15 54		 ora $54,x
$09:a58d  83 00		 sta $00,s
$09:a58f  ff 00 fe 10   sbc $10fe00,x
$09:a593  fe 00 fe	  inc $fe00,x
$09:a596  00 fe		 brk #$fe
$09:a598  10 fe		 bpl $a598
$09:a59a  00 fe		 brk #$fe
$09:a59c  00 7c		 brk #$7c
$09:a59e  00 00		 brk #$00
$09:a5a0  24 fc		 bit $fc
$09:a5a2  58			cli
$09:a5a3  f8			sed
$09:a5a4  b4 fc		 ldy $fc,x
$09:a5a6  f8			sed
$09:a5a7  fc 84 a4	  jsr ($a484,x)
$09:a5aa  b0 f0		 bcs $a59c
$09:a5ac  de 20 16	  dec $1620,x
$09:a5af  97 02		 sta [$02],y
$09:a5b1  ff 06 ff 02   sbc $02ff06,x
$09:a5b5  ff 02 ff 5a   sbc $5aff02,x
$09:a5b9  ff 0e ff 00   sbc $00ff0e,x
$09:a5bd  ff 68 7f f6   sbc $f67f68,x
$09:a5c1  ab			plb
$09:a5c2  54 83 aa	  mvn $aa,$83
$09:a5c5  7d 68 5b	  adc $5b68,x
$09:a5c8  6e 95 28	  ror $2895
$09:a5cb  47 44		 eor [$44]
$09:a5cd  91 00		 sta ($00),y
$09:a5cf  cf 00 fe 28   cmp $28fe00
$09:a5d3  fe 00 fe	  inc $fe00,x
$09:a5d6  04 fe		 tsb $fe
$09:a5d8  00 7e		 brk #$7e
$09:a5da  00 be		 brk #$be
$09:a5dc  00 6e		 brk #$6e
$09:a5de  00 30		 brk #$30
$09:a5e0  08			php
$09:a5e1  a3 aa		 lda $aa,s
$09:a5e3  29 54 29	  and #$2954
$09:a5e6  14 4f		 trb $4f
$09:a5e8  10 85		 bpl $a56f
$09:a5ea  04 93		 tsb $93
$09:a5ec  00 b3		 brk #$b3
$09:a5ee  00 ff		 brk #$ff
$09:a5f0  00 fe		 brk #$fe
$09:a5f2  00 fe		 brk #$fe
$09:a5f4  00 fe		 brk #$fe
$09:a5f6  00 fc		 brk #$fc
$09:a5f8  00 7e		 brk #$7e
$09:a5fa  00 6e		 brk #$6e
$09:a5fc  00 4c		 brk #$4c
$09:a5fe  00 00		 brk #$00
$09:a600  00 ff		 brk #$ff
$09:a602  36 c9		 rol $c9,x
$09:a604  3e c1 14	  rol $14c1,x
$09:a607  eb			xba
$09:a608  08			php
$09:a609  f7 22		 sbc [$22],y
$09:a60b  dd 6b 94	  cmp $946b,x
$09:a60e  55 aa		 eor $aa,x
$09:a610  ff 00 ff 36   sbc $36ff00,x
$09:a614  ff 3e ff 1c   sbc $1cff3e,x
$09:a618  ff 08 ff 22   sbc $22ff08,x
$09:a61c  ff 6b ff 5d   sbc $5dff6b,x
$09:a620  22 dd 22 dd   jsl $dd22dd
$09:a624  22 dd 22 dd   jsl $dd22dd
$09:a628  22 dd 22 dd   jsl $dd22dd
$09:a62c  22 dd 22 dd   jsl $dd22dd
$09:a630  ff 36 ff 36   sbc $36ff36,x
$09:a634  ff 36 ff 36   sbc $36ff36,x
$09:a638  ff 36 ff 36   sbc $36ff36,x
$09:a63c  ff 36 ff 36   sbc $36ff36,x
$09:a640  94 00		 sty $00,x
$09:a642  94 00		 sty $00,x
$09:a644  94 00		 sty $00,x
$09:a646  94 00		 sty $00,x
$09:a648  94 00		 sty $00,x
$09:a64a  94 00		 sty $00,x
$09:a64c  94 00		 sty $00,x
$09:a64e  94 00		 sty $00,x
$09:a650  dd 36 dd	  cmp $dd36,x
$09:a653  36 dd		 rol $dd,x
$09:a655  36 dd		 rol $dd,x
$09:a657  36 dd		 rol $dd,x
$09:a659  36 dd		 rol $dd,x
$09:a65b  36 dd		 rol $dd,x
$09:a65d  36 dd		 rol $dd,x
$09:a65f  36 13		 rol $13,x
$09:a661  ff 00 00 00   sbc $000000,x
$09:a665  00 ff		 brk #$ff
$09:a667  00 02		 brk #$02
$09:a669  fd aa ff	  sbc $ffaa,x
$09:a66c  ff ff ff ff   sbc $ffffff,x
$09:a670  00 00		 brk #$00
$09:a672  ff 00 ff 00   sbc $00ff00,x
$09:a676  ff 00 ff 00   sbc $00ff00,x
$09:a67a  ff 00 ff 00   sbc $00ff00,x
$09:a67e  ff 00 6c ff   sbc $ff6c00,x
$09:a682  10 10		 bpl $a694
$09:a684  00 10		 brk #$10
$09:a686  a7 10		 lda [$10]
$09:a688  18			clc
$09:a689  f7 a5		 sbc [$a5],y
$09:a68b  ff ff ff ff   sbc $ffffff,x
$09:a68f  ff 00 00 ef   sbc $ef0000,x
$09:a693  00 ef		 brk #$ef
$09:a695  00 ef		 brk #$ef
$09:a697  00 ef		 brk #$ef
$09:a699  00 ef		 brk #$ef
$09:a69b  00 ef		 brk #$ef
$09:a69d  00 ef		 brk #$ef
$09:a69f  00 00		 brk #$00
$09:a6a1  80 00		 bra $a6a3
$09:a6a3  80 00		 bra $a6a5
$09:a6a5  80 00		 bra $a6a7
$09:a6a7  80 00		 bra $a6a9
$09:a6a9  80 00		 bra $a6ab
$09:a6ab  80 00		 bra $a6ad
$09:a6ad  80 00		 bra $a6af
$09:a6af  80 00		 bra $a6b1
$09:a6b1  00 00		 brk #$00
$09:a6b3  00 00		 brk #$00
$09:a6b5  00 00		 brk #$00
$09:a6b7  00 00		 brk #$00
$09:a6b9  00 00		 brk #$00
$09:a6bb  00 00		 brk #$00
$09:a6bd  00 00		 brk #$00
$09:a6bf  00 eb		 brk #$eb
$09:a6c1  00 c2		 brk #$c2
$09:a6c3  3d a4 27	  and $27a4,x
$09:a6c6  c0 00 ff	  cpy #$ff00
$09:a6c9  00 b4		 brk #$b4
$09:a6cb  00 95		 brk #$95
$09:a6cd  3a			dec a
$09:a6ce  de 00 00	  dec $0000,x
$09:a6d1  7f 00 7f 18   adc $187f00,x
$09:a6d5  7f 00 3f 00   adc $003f00,x
$09:a6d9  00 00		 brk #$00
$09:a6db  7f 00 7f 00   adc $007f00,x
$09:a6df  3f 51 00 69   and $690051,x
$09:a6e3  80 b3		 bra $a698
$09:a6e5  00 3f		 brk #$3f
$09:a6e7  00 ff		 brk #$ff
$09:a6e9  00 2f		 brk #$2f
$09:a6eb  00 5f		 brk #$5f
$09:a6ed  00 bf		 brk #$bf
$09:a6ef  00 00		 brk #$00
$09:a6f1  fe 00 fe	  inc $fe00,x
$09:a6f4  00 fc		 brk #$fc
$09:a6f6  00 c0		 brk #$c0
$09:a6f8  00 00		 brk #$00
$09:a6fa  00 d0		 brk #$d0
$09:a6fc  00 e0		 brk #$e0
$09:a6fe  00 c0		 brk #$c0
$09:a700  87 18		 sta [$18]
$09:a702  80 40		 bra $a744
$09:a704  91 56		 sta ($56),y
$09:a706  e6 80		 inc $80
$09:a708  b1 e8		 lda ($e8),y
$09:a70a  a6 f9		 ldx $f9
$09:a70c  ae f8 ad	  ldx $adf8
$09:a70f  f2 1f		 sbc ($1f)
$09:a711  60			rts
$09:a712  2f 70 27 78   and $782770
$09:a716  77 78		 adc [$78],y
$09:a718  73 7c		 adc ($7c,s),y
$09:a71a  73 78		 adc ($78,s),y
$09:a71c  71 70		 adc ($70),y
$09:a71e  78			sei
$09:a71f  7a			ply
$09:a720  bf c0 60 c0   lda $c060c0,x
$09:a724  a0 80 3f	  ldy #$3f80
$09:a727  83 4f		 sta $4f,s
$09:a729  30 f6		 bmi $a721
$09:a72b  21 b7		 and ($b7,x)
$09:a72d  60			rts
$09:a72e  9c 0c 00	  stz $000c
$09:a731  c0 00 df	  cpy #$df00
$09:a734  40			rti
$09:a735  df 00 c0 80   cmp $80c000,x
$09:a739  b8			clv
$09:a73a  00 7b		 brk #$7b
$09:a73c  00 78		 brk #$78
$09:a73e  03 60		 ora $60,s
$09:a740  00 ff		 brk #$ff
$09:a742  00 01		 brk #$01
$09:a744  00 01		 brk #$01
$09:a746  fe e1 08	  inc $08e1,x
$09:a749  f7 a6		 sbc [$a6],y
$09:a74b  d5 e4		 cmp $e4,x
$09:a74d  17 10		 ora [$10],y
$09:a74f  19 00 00	  ora $0000,y
$09:a752  00 fe		 brk #$fe
$09:a754  00 fe		 brk #$fe
$09:a756  00 00		 brk #$00
$09:a758  00 0c		 brk #$0c
$09:a75a  00 ee		 brk #$ee
$09:a75c  00 0e		 brk #$0e
$09:a75e  e0 06 0b	  cpx #$0b06
$09:a761  ff 05 ff 9b   sbc $9bff05,x
$09:a765  ff 6f ff bf   sbc $bfff6f,x
$09:a769  ff ff ff ff   sbc $ffffff,x
$09:a76d  ff ff ff ff   sbc $ffffff,x
$09:a771  ff ff ff ff   sbc $ffffff,x
$09:a775  ff ff ff ff   sbc $ffffff,x
$09:a779  ff ff ff ff   sbc $ffffff,x
$09:a77d  ff ff ff f4   sbc $f4ffff,x
$09:a781  ab			plb
$09:a782  f7 a8		 sbc [$a8],y
$09:a784  f7 af		 sbc [$af],y
$09:a786  f4 ab f6	  pea $f6ab
$09:a789  a9 f4 ab	  lda #$abf4
$09:a78c  f4 ab f7	  pea $f7ab
$09:a78f  a8			tay
$09:a790  8f 83 88 80   sta $808883
$09:a794  8f 80 8f 83   sta $838f80
$09:a798  8f 83 8f 80   sta $808f83
$09:a79c  8f 83 8f 83   sta $838f83
$09:a7a0  18			clc
$09:a7a1  e7 ff		 sbc [$ff]
$09:a7a3  18			clc
$09:a7a4  ff ff 00 ff   sbc $ff00ff,x
$09:a7a8  50 8f		 bvc $a739
$09:a7aa  45 b8		 eor $b8
$09:a7ac  04 fb		 tsb $fb
$09:a7ae  ff 00 e7 e7   sbc $e7e700,x
$09:a7b2  18			clc
$09:a7b3  00 ff		 brk #$ff
$09:a7b5  00 ff		 brk #$ff
$09:a7b7  ff ff df ff   sbc $ffdfff,x
$09:a7bb  cd ff fc	  cmp $fcff
$09:a7be  ff ff ff c0   sbc $c0ffff,x
$09:a7c2  cf bf f8 b7   cmp $b7f8bf
$09:a7c6  f4 bb f6	  pea $f6bb
$09:a7c9  a8			tay
$09:a7ca  f6 a9		 inc $a9,x
$09:a7cc  f7 a8		 sbc [$a8],y
$09:a7ce  f6 a9		 inc $a9,x
$09:a7d0  c0 c0 80	  cpy #$80c0
$09:a7d3  80 8f		 bra $a764
$09:a7d5  80 8f		 bra $a766
$09:a7d7  80 8f		 bra $a768
$09:a7d9  82 8f 82	  brl $2a6b
$09:a7dc  8f 82 8f 83   sta $838f82
$09:a7e0  ff 00 ff ff   sbc $ffff00,x
$09:a7e4  00 ff		 brk #$ff
$09:a7e6  00 ff		 brk #$ff
$09:a7e8  5b			tcd
$09:a7e9  24 1f		 bit $1f
$09:a7eb  f8			sed
$09:a7ec  3d 18 1c	  and $1c18,x
$09:a7ef  fb			xce
$09:a7f0  00 00		 brk #$00
$09:a7f2  00 00		 brk #$00
$09:a7f4  ff 00 ff 00   sbc $00ff00,x
$09:a7f8  e7 67		 sbc [$67]
$09:a7fa  ff 60 ff 05   sbc $05ff60,x
$09:a7fe  ff 24 00 33   sbc $330024,x
$09:a802  34 0e		 bit $0e,x
$09:a804  41 00		 eor ($00,x)
$09:a806  25 9a		 and $9a
$09:a808  12 21		 ora ($21)
$09:a80a  00 58		 brk #$58
$09:a80c  29 06 0b	  and #$0b06
$09:a80f  5f 00 cc 00   eor $00cc00,x
$09:a813  ff 00 ff 00   sbc $00ff00,x
$09:a817  7f 00 7f 00   adc $007f00,x
$09:a81b  3f 00 7f 00   and $007f00,x
$09:a81f  3f 00 bc 54   and $54bc00,x
$09:a823  20 90 78	  jsr $7890
$09:a826  68			pla
$09:a827  f0 90		 beq $a7b9
$09:a829  f0 ac		 beq $a7d7
$09:a82b  78			sei
$09:a82c  24 1c		 bit $1c
$09:a82e  40			rti
$09:a82f  e0 00 43	  cpx #$4300
$09:a832  00 ff		 brk #$ff
$09:a834  00 fe		 brk #$fe
$09:a836  00 fc		 brk #$fc
$09:a838  00 fc		 brk #$fc
$09:a83a  00 fe		 brk #$fe
$09:a83c  00 fe		 brk #$fe
$09:a83e  00 ff		 brk #$ff
$09:a840  00 d8		 brk #$d8
$09:a842  42 85		 wdm #$85
$09:a844  b8			clv
$09:a845  43 e0		 eor $e0,s
$09:a847  32 48		 and ($48)
$09:a849  c2 b0		 rep #$b0
$09:a84b  14 48		 trb $48
$09:a84d  02 20		 cop #$20
$09:a84f  e6 00		 inc $00
$09:a851  27 00		 and [$00]
$09:a853  fa			plx
$09:a854  00 fc		 brk #$fc
$09:a856  00 fc		 brk #$fc
$09:a858  00 fc		 brk #$fc
$09:a85a  00 f8		 brk #$f8
$09:a85c  00 fc		 brk #$fc
$09:a85e  00 f8		 brk #$f8
$09:a860  18			clc
$09:a861  ff 0b f4 78   sbc $78f40b,x
$09:a865  07 18		 ora [$18]
$09:a867  ff fd 18 1c   sbc $1c18fd,x
$09:a86b  fb			xce
$09:a86c  fb			xce
$09:a86d  1c e7 18	  trb $18e7
$09:a870  ff 87 ff e0   sbc $e0ff87,x
$09:a874  e7 67		 sbc [$67]
$09:a876  ff 27 ff e5   sbc $e5ff27,x
$09:a87a  ff 24 ff e4   sbc $e4ff24,x
$09:a87e  ff 00 2b d5   sbc $d52b00,x
$09:a882  6b			rtl
$09:a883  15 6b		 ora $6b,x
$09:a885  95 ab		 sta $ab,x
$09:a887  55 ab		 eor $ab,x
$09:a889  55 ab		 eor $ab,x
$09:a88b  55 af		 eor $af,x
$09:a88d  55 eb		 eor $eb,x
$09:a88f  15 f1		 ora $f1,x
$09:a891  c1 f1		 cmp ($f1,x)
$09:a893  41 f1		 eor ($f1,x)
$09:a895  41 f1		 eor ($f1,x)
$09:a897  41 f1		 eor ($f1,x)
$09:a899  41 f1		 eor ($f1,x)
$09:a89b  41 f1		 eor ($f1,x)
$09:a89d  41 f1		 eor ($f1,x)
$09:a89f  01 32		 ora ($32,x)
$09:a8a1  01 88		 ora ($88,x)
$09:a8a3  05 00		 ora $00
$09:a8a5  ff 00 00 00   sbc $000000,x
$09:a8a9  00 00		 brk #$00
$09:a8ab  00 00		 brk #$00
$09:a8ad  00 00		 brk #$00
$09:a8af  00 00		 brk #$00
$09:a8b1  fe 00 fa	  inc $fa00,x
$09:a8b4  00 00		 brk #$00
$09:a8b6  00 00		 brk #$00
$09:a8b8  00 00		 brk #$00
$09:a8ba  00 00		 brk #$00
$09:a8bc  00 00		 brk #$00
$09:a8be  00 00		 brk #$00
$09:a8c0  1f 6a 5f 65   ora $655f6a,x
$09:a8c4  af fa 58 47   lda $4758fa
$09:a8c8  0b			phd
$09:a8c9  7b			tdc
$09:a8ca  bd bf 7f	  lda $7fbf,x
$09:a8cd  00 69		 brk #$69
$09:a8cf  e8			inx
$09:a8d0  0a			asl a
$09:a8d1  f0 05		 beq $a8d8
$09:a8d3  f8			sed
$09:a8d4  8a			txa
$09:a8d5  75 20		 adc $20,x
$09:a8d7  ff 04 ff c0   sbc $c0ff04,x
$09:a8db  7f 00 ff 16   adc $16ff00,x
$09:a8df  ff 1f e0 08   sbc $08e01f,x
$09:a8e3  f7 19		 sbc [$19],y
$09:a8e5  e6 59		 inc $59
$09:a8e7  9e df 38	  stz $38df,x
$09:a8ea  fd 18 1c	  sbc $1c18,x
$09:a8ed  fb			xce
$09:a8ee  c8			iny
$09:a8ef  37 e7		 and [$e7],y
$09:a8f1  a7 ff		 lda [$ff]
$09:a8f3  e7 e7		 sbc [$e7]
$09:a8f5  e7 ff		 sbc [$ff]
$09:a8f7  c7 ff		 cmp [$ff]
$09:a8f9  40			rti
$09:a8fa  ff 05 ff e4   sbc $e4ff05,x
$09:a8fe  ff e7 ac f3   sbc $f3ace7,x
$09:a902  ae f3 ec	  ldx $ecf3
$09:a905  91 9c		 sta ($9c),y
$09:a907  40			rti
$09:a908  8f 48 d7 18   sta $18d748
$09:a90c  e7 08		 sbc [$08]
$09:a90e  f5 00		 sbc $00,x
$09:a910  78			sei
$09:a911  78			sei
$09:a912  78			sei
$09:a913  7b			tdc
$09:a914  78			sei
$09:a915  7b			tdc
$09:a916  38			sec
$09:a917  7b			tdc
$09:a918  30 71		 bmi $a98b
$09:a91a  00 3a		 brk #$3a
$09:a91c  00 78		 brk #$78
$09:a91e  00 7b		 brk #$7b
$09:a920  04 fd		 tsb $fd
$09:a922  71 8e		 adc ($8e),y
$09:a924  76 88		 ror $88,x
$09:a926  74 8b		 stz $8b,x
$09:a928  74 8b		 stz $8b,x
$09:a92a  75 88		 adc $88,x
$09:a92c  73 88		 adc ($88,s),y
$09:a92e  00 ff		 brk #$ff
$09:a930  02 77		 cop #$77
$09:a932  00 77		 brk #$77
$09:a934  00 77		 brk #$77
$09:a936  00 74		 brk #$74
$09:a938  00 75		 brk #$75
$09:a93a  00 77		 brk #$77
$09:a93c  00 77		 brk #$77
$09:a93e  00 00		 brk #$00
$09:a940  7e 81 ff	  ror $ff81,x
$09:a943  00 18		 brk #$18
$09:a945  e7 00		 sbc [$00]
$09:a947  db			stp
$09:a948  c3 18		 cmp $18,s
$09:a94a  e7 18		 sbc [$18]
$09:a94c  ff 00 00 ff   sbc $ff0000,x
$09:a950  00 ff		 brk #$ff
$09:a952  00 ff		 brk #$ff
$09:a954  00 18		 brk #$18
$09:a956  00 e7		 brk #$e7
$09:a958  00 e7		 brk #$e7
$09:a95a  00 e7		 brk #$e7
$09:a95c  00 ff		 brk #$ff
$09:a95e  00 00		 brk #$00
$09:a960  ff ff ff ff   sbc $ffffff,x
$09:a964  ff ff ac ff   sbc $ffacff,x
$09:a968  00 ff		 brk #$ff
$09:a96a  c3 3c		 cmp $3c,s
$09:a96c  42 c3		 wdm #$c3
$09:a96e  00 7e		 brk #$7e
$09:a970  ff ff ff ff   sbc $ffffff,x
$09:a974  ff ff ff ff   sbc $ffffff,x
$09:a978  ff ff ff ff   sbc $ffffff,x
$09:a97c  3c 7e 81	  bit $817e,x
$09:a97f  ff d7 a8 df   sbc $dfa8d7,x
$09:a983  a0 ff b0	  ldy #$b0ff
$09:a986  ff bf c0 bf   sbc $bfc0bf,x
$09:a98a  ff c0 ff ff   sbc $ffffc0,x
$09:a98e  ff ff 8f 80   sbc $808fff,x
$09:a992  8f 80 80 80   sta $808080
$09:a996  80 80		 bra $a918
$09:a998  80 80		 bra $a91a
$09:a99a  c0 c0 ff	  cpy #$ffc0
$09:a99d  ff ff ff ff   sbc $ffffff,x
$09:a9a1  00 ff		 brk #$ff
$09:a9a3  00 ff		 brk #$ff
$09:a9a5  00 ff		 brk #$ff
$09:a9a7  ff 00 ff ff   sbc $ffff00,x
$09:a9ab  00 ff		 brk #$ff
$09:a9ad  ff ff ff ff   sbc $ffffff,x
$09:a9b1  00 ff		 brk #$ff
$09:a9b3  00 00		 brk #$00
$09:a9b5  00 00		 brk #$00
$09:a9b7  00 00		 brk #$00
$09:a9b9  00 00		 brk #$00
$09:a9bb  00 ff		 brk #$ff
$09:a9bd  ff ff ff d4   sbc $d4ffff,x
$09:a9c1  ab			plb
$09:a9c2  f5 a8		 sbc $a8,x
$09:a9c4  d5 aa		 cmp $aa,x
$09:a9c6  d7 a8		 cmp [$a8],y
$09:a9c8  d4 ab		 pei ($ab)
$09:a9ca  d4 ab		 pei ($ab)
$09:a9cc  d4 ab		 pei ($ab)
$09:a9ce  d7 a8		 cmp [$a8],y
$09:a9d0  8f 83 8f 81   sta $818f83
$09:a9d4  8f 81 8f 80   sta $808f81
$09:a9d8  8f 83 8f 83   sta $838f83
$09:a9dc  8f 83 8f 80   sta $808f83
$09:a9e0  1b			tcs
$09:a9e1  fc 0b 74	  jsr ($740b,x)
$09:a9e4  19 e6 f9	  ora $f9e6,y
$09:a9e7  1e 19 fe	  asl $fe19,x
$09:a9ea  ff 18 99 7e   sbc $7e9918,x
$09:a9ee  e7 18		 sbc [$18]
$09:a9f0  ff e4 ff 60   sbc $60ffe4,x
$09:a9f4  e7 27		 sbc [$27]
$09:a9f6  ff 07 ff e7   sbc $e7ff07,x
$09:a9fa  ff e7 ff a1   sbc $a1ffe7,x
$09:a9fe  ff 00 8b fa   sbc $fa8b00,x
$09:aa02  4a			lsr a
$09:aa03  cc a5 b8	  cpy $b8a5
$09:aa06  1b			tcs
$09:aa07  f0 54		 beq $aa5d
$09:aa09  41 28		 eor ($28,x)
$09:aa0b  07 c4		 ora [$c4]
$09:aa0d  80 98		 bra $a9a7
$09:aa0f  07 04		 ora [$04]
$09:aa11  fe 31 fc	  inc $fc31,x
$09:aa14  43 f8		 eor $f8,s
$09:aa16  07 f0		 ora [$f0]
$09:aa18  af e0 df c0   lda $c0dfe0
$09:aa1c  3f 80 7f 00   and $007f80,x
$09:aa20  c4 44		 cpy $44
$09:aa22  5a			phy
$09:aa23  3f 64 9f 19   and $199f64,x
$09:aa27  09 6a 86	  ora #$866a
$09:aa2a  94 03		 sty $03,x
$09:aa2c  4b			phk
$09:aa2d  31 8d		 and ($8d),y
$09:aa2f  00 3b		 brk #$3b
$09:aa31  7f 80 3f c0   adc $c03f80,x
$09:aa35  1f e6 0f f1   ora $f10fe6,x
$09:aa39  07 f8		 ora [$f8]
$09:aa3b  03 fc		 ora $fc,s
$09:aa3d  01 fe		 ora ($fe,x)
$09:aa3f  00 a7		 brk #$a7
$09:aa41  18			clc
$09:aa42  70 80		 bvs $a9c4
$09:aa44  29 46 96	  and #$9646
$09:aa47  e0 79 f0	  cpx #$f079
$09:aa4a  26 39		 rol $39
$09:aa4c  16 74		 asl $74,x
$09:aa4e  55 de		 eor $de,x
$09:aa50  7f 00 3f 80   adc $803f00,x
$09:aa54  9f c0 0f e0   sta $e00fc0,x
$09:aa58  07 f0		 ora [$f0]
$09:aa5a  c3 f8		 cmp $f8,s
$09:aa5c  89 fc 20	  bit #$20fc
$09:aa5f  fe 33 c4	  inc $c433,x
$09:aa62  c7 39		 cmp [$39]
$09:aa64  2e 12 c9	  rol $c912
$09:aa67  25 d2		 and $d2
$09:aa69  4b			phk
$09:aa6a  f1 9f		 sbc ($9f),y
$09:aa6c  cc 3c b3	  cpy $b33c
$09:aa6f  7f fe 00 fc   adc $fc00fe,x
$09:aa73  01 f9		 ora ($f9,x)
$09:aa75  03 f2		 ora $f2,s
$09:aa77  07 e4		 ora [$e4]
$09:aa79  0f c0 1f 83   ora $831fc0
$09:aa7d  3f 00 7f 74   and $747f00,x
$09:aa81  8f b4 7a 58   sta $587ab4
$09:aa85  e4 e3		 cpx $e3
$09:aa87  18			clc
$09:aa88  a4 f0		 ldy $f0
$09:aa8a  cb			wai
$09:aa8b  e0 44 80	  cpx #$8044
$09:aa8e  99 00 00	  sta $0000,y
$09:aa91  fe 01 fc	  inc $fc01,x
$09:aa94  03 f8		 ora $f8,s
$09:aa96  07 f0		 ora [$f0]
$09:aa98  0f e0 1f c0   ora $c01fe0
$09:aa9c  3f 80 7f 00   and $007f80,x
$09:aaa0  bb			tyx
$09:aaa1  7f 25 5a db   adc $db5a25,x
$09:aaa5  24 06		 bit $06
$09:aaa7  1f e5 0b 93   ora $930be5,x
$09:aaab  04 60		 tsb $60
$09:aaad  03 8c		 ora $8c,s
$09:aaaf  01 00		 ora ($00,x)
$09:aab1  7f 80 3f c0   adc $c03f80,x
$09:aab5  1f e0 0f f0   ora $f00fe0,x
$09:aab9  07 f8		 ora [$f8]
$09:aabb  03 fc		 ora $fc,s
$09:aabd  01 fe		 ora ($fe,x)
$09:aabf  00 a4		 brk #$a4
$09:aac1  18			clc
$09:aac2  5a			phy
$09:aac3  dc 00 20	  jml [$2000]
$09:aac6  b4 e4		 ldy $e4,x
$09:aac8  b4 12		 ldy $12,x
$09:aaca  ca			dex
$09:aacb  b8			clv
$09:aacc  94 02		 sty $02,x
$09:aace  56 d7		 lsr $d7,x
$09:aad0  01 fe		 ora ($fe,x)
$09:aad2  21 fe		 and ($fe,x)
$09:aad4  19 fe 03	  ora $03fe,y
$09:aad7  fe 49 fe	  inc $fe49,x
$09:aada  05 fe		 ora $fe
$09:aadc  01 fe		 ora ($fe,x)
$09:aade  28			plp
$09:aadf  7f ff 00 c0   adc $c000ff,x
$09:aae3  3f b7 77 c1   and $c177b7,x
$09:aae7  7f 9e 3e 9e   adc $9e3e9e,x
$09:aaeb  3e 80 3e	  rol $3e80,x
$09:aaee  c1 7f		 cmp ($7f,x)
$09:aaf0  7f 7f c0 ff   adc $ffc07f,x
$09:aaf4  88			dey
$09:aaf5  ff be ff ff   sbc $ffffbe,x
$09:aaf9  ff ff ff ff   sbc $ffffff,x
$09:aafd  ff be ff c0   sbc $c0ffbe,x
$09:ab01  7f e5 65 fc   adc $fc65e5,x
$09:ab05  02 b9		 cop #$b9
$09:ab07  3b			tsc
$09:ab08  c2 7f		 rep #$7f
$09:ab0a  c0 7f 92	  cpy #$927f
$09:ab0d  7f ff 00 80   adc $8000ff,x
$09:ab11  ff 9a ff fd   sbc $fdff9a,x
$09:ab15  ff c4 ff bc   sbc $bcffc4,x
$09:ab19  ff bf ff 80   sbc $80ffbf,x
$09:ab1d  ff 7f 7f ff   sbc $ff7f7f,x
$09:ab21  00 80		 brk #$80
$09:ab23  7f dd 7f 81   adc $817fdd,x
$09:ab27  01 bc		 ora ($bc,x)
$09:ab29  42 d7		 wdm #$d7
$09:ab2b  28			plp
$09:ab2c  bf 40 bf 40   lda $40bf40,x
$09:ab30  7f 7f be ff   adc $ffbe7f,x
$09:ab34  be ff fe	  ldx $feff,y
$09:ab37  ff bd ff d7   sbc $d7ffbd,x
$09:ab3b  ff bf ff bf   sbc $bfffbf,x
$09:ab3f  ff fb 44 f4   sbc $f444fb,x
$09:ab43  4b			phk
$09:ab44  e0 5f a9	  cpx #$a95f
$09:ab47  2b			pld
$09:ab48  ca			dex
$09:ab49  7e c0 7f	  ror $7fc0,x
$09:ab4c  92 7f		 sta ($7f)
$09:ab4e  ff 00 bf ff   sbc $ffbf00,x
$09:ab52  bf ff bf ff   lda $ffbfff,x
$09:ab56  d4 ff		 pei ($ff)
$09:ab58  bd ff bf	  lda $bfff,x
$09:ab5b  ff 80 ff 7f   sbc $7fff80,x
$09:ab5f  7f 7e 81 c1   adc $c1817e,x
$09:ab63  7e 92 73	  ror $7392,x
$09:ab66  a1 7f		 lda ($7f,x)
$09:ab68  8d 53 8c	  sta $8c53
$09:ab6b  52 a1		 eor ($a1)
$09:ab6d  7f 5a ba 7e   adc $7eba5a,x
$09:ab71  ff 81 ff 8c   sbc $8cff81,x
$09:ab75  ff 80 ff ac   sbc $acff80,x
$09:ab79  ff ad ff 80   sbc $80ffad,x
$09:ab7d  ff 45 ff 6f   sbc $6fff45,x
$09:ab81  b0 b3		 bcs $ab36
$09:ab83  4e cc bd	  lsr $bdcc
$09:ab86  53 b2		 eor ($b2,s),y
$09:ab88  a9 6f a6	  lda #$a66f
$09:ab8b  6e d5 5c	  ror $5cd5
$09:ab8e  db			stp
$09:ab8f  28			plp
$09:ab90  4f ff b1 ff   eor $ffb1ff
$09:ab94  42 ff		 wdm #$ff
$09:ab96  4d ff 91	  eor $91ff
$09:ab99  fe 96 f9	  inc $f996,x
$09:ab9c  a4 fb		 ldy $fb
$09:ab9e  d8			cld
$09:ab9f  f7 81		 sbc [$81],y
$09:aba1  7e 53 f3	  ror $f353,x
$09:aba4  1c e2 6e	  trb $6ee2
$09:aba7  df 39 99 32   cmp $329939,x
$09:abab  96 55		 stx $55,y
$09:abad  f5 ca		 sbc $ca,x
$09:abaf  5b			tcd
$09:abb0  c3 ff		 cmp $ff,s
$09:abb2  8c ff 3f	  sty $3fff
$09:abb5  ff 20 ff 66   sbc $66ff20,x
$09:abb9  ff 69 ff aa   sbc $aaff69,x
$09:abbd  ff a4 ff ff   sbc $ffffa4,x
$09:abc1  04 fb		 tsb $fb
$09:abc3  31 e6		 and ($e6),y
$09:abc5  52 ec		 eor ($ec)
$09:abc7  65 d9		 adc $d9
$09:abc9  8b			phb
$09:abca  b3 96		 lda ($96,s),y
$09:abcc  e6 2c		 inc $2c
$09:abce  cc 59 04	  cpy $0459
$09:abd1  00 31		 brk #$31
$09:abd3  4c 42 39	  jmp $3942
$09:abd6  44 33 88	  mvp $88,$33
$09:abd9  67 90		 adc [$90]
$09:abdb  4f 20 1f 40   eor $401f20
$09:abdf  3f ad d3 55   and $55d3ad,x
$09:abe3  ec aa 59	  cpx $59aa
$09:abe6  55 ac		 eor $ac,x
$09:abe8  a9 77 d6	  lda #$d677
$09:abeb  59 26 89	  eor $8926,y
$09:abee  d9 ae 28	  cmp $28ae,y
$09:abf1  f8			sed
$09:abf2  03 e0		 ora $e0,s
$09:abf4  87 c0		 sta [$c0]
$09:abf6  03 80		 ora $80,s
$09:abf8  80 80		 bra $ab7a
$09:abfa  20 00 71	  jsr $7100
$09:abfd  00 73		 brk #$73
$09:abff  00 00		 brk #$00
$09:ac01  08			php
$09:ac02  80 3b		 bra $ac3f
$09:ac04  fd e8 50	  sbc $50e8,x
$09:ac07  c8			iny
$09:ac08  43 d3		 eor $d3,s
$09:ac0a  c2 db		 rep #$db
$09:ac0c  04 9f		 tsb $9f
$09:ac0e  89 d0 2c	  bit #$2cd0
$09:ac11  d1 48		 cmp ($48),y
$09:ac13  3c 52 03	  bit $0352,x
$09:ac16  14 88		 trb $88
$09:ac18  45 22		 eor $22
$09:ac1a  31 48		 and ($48),y
$09:ac1c  14 52		 trb $52
$09:ac1e  07 14		 ora [$14]
$09:ac20  89 45 22	  bit #$2245
$09:ac23  71 48		 adc ($48),y
$09:ac25  24 52		 bit $52
$09:ac27  0b			phd
$09:ac28  14 25		 trb $25
$09:ac2a  84 56		 sty $56
$09:ac2c  29 06 1a	  and #$1a06
$09:ac2f  8c 5a 29	  sty $295a
$09:ac32  17 19		 ora [$19],y
$09:ac34  9c 60 3b	  stz $3b60
$09:ac37  33 b3		 and ($b3,s),y
$09:ac39  38			sec
$09:ac3a  cf 0d 60 2f   cmp $2f600d
$09:ac3e  79 04 52	  adc $5204,y
$09:ac41  43 14		 eor $14,s
$09:ac43  98			tya
$09:ac44  45 26		 eor $26
$09:ac46  31 49		 and ($49),y
$09:ac48  14 52		 trb $52
$09:ac4a  47 14		 eor [$14]
$09:ac4c  99 46 26	  sta $2646,y
$09:ac4f  71 49		 adc ($49),y
$09:ac51  24 52		 bit $52
$09:ac53  4b			phk
$09:ac54  14 9a		 trb $9a
$09:ac56  45 26		 eor $26
$09:ac58  b1 49		 lda ($49),y
$09:ac5a  34 52		 bit $52,x
$09:ac5c  4f 14 9b 45   eor $459b14
$09:ac60  26 f1		 rol $f1
$09:ac62  49 40 d4	  eor #$d440
$09:ac65  67 01		 adc [$01]
$09:ac67  d9 9e a9	  cmp $a99e,y
$09:ac6a  c6 7c		 dec $7c
$09:ac6c  ab			plb
$09:ac6d  01 7b		 ora ($7b,x)
$09:ac6f  d0 22		 bne $ac93
$09:ac71  94 11		 sty $11,x
$09:ac73  a8			tay
$09:ac74  d4 63		 pei ($63)
$09:ac76  14 28		 trb $28
$09:ac78  c5 0c		 cmp $0c
$09:ac7a  2c 51 8a	  bit $8a51
$09:ac7d  24 62		 bit $62
$09:ac7f  8a			txa
$09:ac80  c3 3a		 cmp $3a,s
$09:ac82  34 52		 bit $52,x
$09:ac84  8f 18 ab 45   sta $45ab18
$09:ac88  2a			rol a
$09:ac89  f1 4a		 sbc ($4a),y
$09:ac8b  40			rti
$09:ac8c  d4 6b		 pei ($6b)
$09:ac8e  01 d9		 ora ($d9,x)
$09:ac90  a8			tay
$09:ac91  39 c6 c0	  and $c0c6,y
$09:ac94  eb			xba
$09:ac95  00 b4		 brk #$b4
$09:ac97  45 2c		 eor $2c
$09:ac99  23 51		 and $51,s
$09:ac9b  b8			clv
$09:ac9c  85 8a		 sta $8a
$09:ac9e  21 55		 and ($55,x)
$09:aca0  8e 64 d8	  stx $d864
$09:aca3  67 74		 adc [$74]
$09:aca5  8c 5d 63	  sty $635d
$09:aca8  16 68		 asl $68,x
$09:acaa  a5 9e		 lda $9e
$09:acac  29 76 8a	  and #$8a76
$09:acaf  5d e2 96	  eor $96e2,x
$09:acb2  81 a8		 sta ($a8,x)
$09:acb4  de 22 97	  dec $9722,x
$09:acb7  96 fb		 stx $fb,y
$09:acb9  dc 04 e3	  jml [$e304]
$09:acbc  80 15		 bra $acd3
$09:acbe  83 be		 sta $be,s
$09:acc0  70 25		 bvs $ace7
$09:acc2  11 c8		 ora ($c8),y
$09:acc4  c7 2f		 cmp [$2f]
$09:acc6  8d d0 8e	  sta $8ed0
$09:acc9  64 98		 stz $98
$09:accb  a3 84		 lda $84,s
$09:accd  8c 61 62	  sty $6261
$09:acd0  19 48 86	  ora $8648,y
$09:acd3  56 29		 lsr $29,x
$09:acd5  86 8a		 stx $8a
$09:acd7  61 e2		 adc ($e2,x)
$09:acd9  99 68 a6	  sta $a668,y
$09:acdc  5e 29 88	  lsr $8829,x
$09:acdf  8a			txa
$09:ace0  62 62 99	  per $4645
$09:ace3  88			dey
$09:ace4  a6 65		 ldx $65
$09:ace6  be f9 03	  ldx $03f9,y
$09:ace9  38			sec
$09:acea  e8			inx
$09:aceb  0d 60 2f	  ora $2f60
$09:acee  9d 0a 64	  sta $640a,x
$09:acf1  76 31		 ror $31,x
$09:acf3  4d 14 53	  eor $5314
$09:acf6  47 14		 eor [$14]
$09:acf8  d9 45 36	  cmp $3645,y
$09:acfb  71 0d		 adc ($0d),y
$09:acfd  24 53		 bit $53
$09:acff  4b			phk
$09:ad00  14 da		 trb $da
$09:ad02  45 36		 eor $36
$09:ad04  b0 cd		 bcs $acd3
$09:ad06  34 53		 bit $53,x
$09:ad08  4f 0c db 43   eor $43db0c
$09:ad0c  36 f1		 rol $f1,x
$09:ad0e  4d 44 53	  eor $5344
$09:ad11  53 14		 eor ($14,s),y
$09:ad13  dc 45 37	  jml [$3745]
$09:ad16  31 4d		 and ($4d),y
$09:ad18  52 d4		 eor ($d4)
$09:ad1a  77 51		 adc [$51],y
$09:ad1c  4a			lsr a
$09:ad1d  54 13 60	  mvn $60,$13
$09:ad20  a7 46		 lda [$46]
$09:ad22  eb			xba
$09:ad23  43 38		 eor $38,s
$09:ad25  10 ce		 bpl $acf5
$09:ad27  0c 33 a1	  tsb $a133
$09:ad2a  0c e8 c3	  tsb $c3e8
$09:ad2d  38			sec
$09:ad2e  51 4e		 eor ($4e),y
$09:ad30  1c 33 a5	  trb $a533
$09:ad33  0c e9 c5	  tsb $c5e9
$09:ad36  38			sec
$09:ad37  90 ce		 bcc $ad07
$09:ad39  2c 33 a9	  bit $a933
$09:ad3c  0c ea c3	  tsb $c3ea
$09:ad3f  38			sec
$09:ad40  d0 ce		 bne $ad10
$09:ad42  3c 33 ad	  bit $ad33,x
$09:ad45  0c eb c3	  tsb $c3eb
$09:ad48  39 10 ce	  and $ce10,y
$09:ad4b  4c 33 b1	  jmp $b133
$09:ad4e  0c ec c3	  tsb $c3ec
$09:ad51  39 51 4a	  and $4a51,y
$09:ad54  d4 33		 pei ($33)
$09:ad56  b5 14		 lda $14,x
$09:ad58  b5 1b		 lda $1b,x
$09:ad5a  e2 19		 sep #$19
$09:ad5c  6f 5a 8d fe   adc $fe8d5a
$09:ad60  19 e0 86	  ora $86e0,y
$09:ad63  78			sei
$09:ad64  61 9f		 adc ($9f,x)
$09:ad66  08			php
$09:ad67  67 c6		 adc [$c6]
$09:ad69  19 e2 86	  ora $86e2,y
$09:ad6c  78			sei
$09:ad6d  e1 9f		 sbc ($9f,x)
$09:ad6f  28			plp
$09:ad70  67 ce		 adc [$ce]
$09:ad72  19 e4 86	  ora $86e4,y
$09:ad75  79 61 9f	  adc $9f61,y
$09:ad78  48			pha
$09:ad79  67 d6		 adc [$d6]
$09:ad7b  19 e6 86	  ora $86e6,y
$09:ad7e  79 e1 9f	  adc $9fe1,y
$09:ad81  68			pla
$09:ad82  67 de		 adc [$de]
$09:ad84  19 e8 86	  ora $86e8,y
$09:ad87  7a			ply
$09:ad88  61 9f		 adc ($9f,x)
$09:ad8a  88			dey
$09:ad8b  67 e6		 adc [$e6]
$09:ad8d  19 ea 8a	  ora $8aea,y
$09:ad90  5e a1 9f	  lsr $9fa1,x
$09:ad93  a3 7c		 lda $7c,s
$09:ad95  2d 46 12	  and $1246
$09:ad98  b5 18		 lda $18,x
$09:ad9a  cc 32 15	  cpy $1532
$09:ad9d  0c 85 c2	  tsb $c285
$09:ada0  23 50		 and $50,s
$09:ada2  88			dey
$09:ada3  dc 30 7e	  jml [$7e30]
$09:ada6  10 d8		 bpl $ad80
$09:ada8  44 72 11	  mvp $11,$72
$09:adab  1d 86 43	  ora $4386,x
$09:adae  a1 90		 lda ($90,x)
$09:adb0  f8			sed
$09:adb1  44 7a 11	  mvp $11,$7a
$09:adb4  1f 86 52 e1   ora $e15286,x
$09:adb8  94 c8		 sty $c8,x
$09:adba  45 6e		 eor $6e
$09:adbc  19 5c 86	  ora $865c,y
$09:adbf  53 61		 eor ($61,s),y
$09:adc1  94 e8		 sty $e8,x
$09:adc3  65 76		 adc $76
$09:adc5  19 5e 86	  ora $865e,y
$09:adc8  53 d6		 eor ($d6,s),y
$09:adca  a3 5f		 lda $5f,s
$09:adcc  12 dc		 ora ($dc)
$09:adce  a5 6a		 lda $6a
$09:add0  33 98		 and ($98,s),y
$09:add2  44 aa 11	  mvp $11,$aa
$09:add5  2b			pld
$09:add6  84 4e		 sty $4e
$09:add8  a1 13		 lda ($13,x)
$09:adda  f8			sed
$09:addb  44 b2 11	  mvp $11,$b2
$09:adde  2d 3e 89	  and $893e
$09:ade1  f8			sed
$09:ade2  25 d0		 and $d0
$09:ade4  89 7a 0c	  bit #$0c7a
$09:ade7  ed 70 cb	  sbc $cb70
$09:adea  64 22		 stz $22
$09:adec  f6 55		 inc $55,x
$09:adee  1b			tcs
$09:adef  6c 32 dd	  jmp ($dd32)
$09:adf2  0c be c3	  tsb $c3be
$09:adf5  2f c2 5a 73   and $735ac2
$09:adf9  95 13		 sta $13,x
$09:adfb  9b			txy
$09:adfc  44 e6 2b	  mvp $2b,$e6
$09:adff  c7 9f		 cmp [$9f]
$09:ae01  44 e5 ad	  mvp $ad,$e5
$09:ae04  42 08		 wdm #$08
$09:ae06  ba			tsx
$09:ae07  0e 5c 12	  asl $125c
$09:ae0a  b2 b9		 lda ($b9)
$09:ae0c  1e 64 13	  asl $1364,x
$09:ae0f  9b			txy
$09:ae10  04 c5		 tsb $c5
$09:ae12  c1 31		 cmp ($31,x)
$09:ae14  90 4c		 bcc $ae62
$09:ae16  dc 13 39	  jml [$3913]
$09:ae19  04 c6		 tsb $c6
$09:ae1b  c1 31		 cmp ($31,x)
$09:ae1d  d0 4c		 bne $ae6b
$09:ae1f  ec 13 3d	  cpx $3d13
$09:ae22  04 c7		 tsb $c7
$09:ae24  c1 35		 cmp ($35,x)
$09:ae26  70 4c		 bvs $ae74
$09:ae28  fc 13 77	  jsr ($7713,x)
$09:ae2b  04 d6		 tsb $d6
$09:ae2d  41 35		 eor ($35,x)
$09:ae2f  b0 4d		 bcs $ae7e
$09:ae31  e4 13		 cpx $13
$09:ae33  7b			tdc
$09:ae34  04 d7		 tsb $d7
$09:ae36  41 35		 eor ($35,x)
$09:ae38  f0 4d		 beq $ae87
$09:ae3a  f4 13 7e	  pea $7e13
$09:ae3d  9f e5 3b e3   sta $e33be5,x
$09:ae41  e8			inx
$09:ae42  9a			txs
$09:ae43  ea			nop
$09:ae44  26 7e		 rol $7e
$09:ae46  88			dey
$09:ae47  ec 0a 48	  cpx $480a
$09:ae4a  3c 79 cb	  bit $cb79,x
$09:ae4d  f0 07		 beq $ae56
$09:ae4f  9d a5 7a	  sta $7aa5,x
$09:ae52  21 02		 and ($02,x)
$09:ae54  62 10 41	  per $ef67
$09:ae57  17 40		 ora [$40],y
$09:ae59  ea			nop
$09:ae5a  07 10		 ora [$10]
$09:ae5c  6f e0 8e 60   adc $608ee0
$09:ae60  64 33		 stz $33
$09:ae62  88			dey
$09:ae63  1d 00 e6	  ora $e600,x
$09:ae66  07 60		 ora [$60]
$09:ae68  62 c1 20	  per $cf2c
$09:ae6b  3b			tsc
$09:ae6c  00 68		 brk #$68
$09:ae6e  e3 e8		 sbc $e8,s
$09:ae70  8e a0 06	  stx $06a0
$09:ae73  00 d0		 brk #$d0
$09:ae75  31 e3		 and ($e3),y
$09:ae77  11 6e		 ora ($6e),y
$09:ae79  03 98		 ora $98,s
$09:ae7b  68			pla
$09:ae7c  8e 20 df	  stx $df20
$09:ae7f  51 1c		 eor ($1c),y
$09:ae81  c0 ca		 cpy #$ca
$09:ae83  06 d0		 asl $d0
$09:ae85  33 81		 and ($81,s),y
$09:ae87  bc 1b 03	  ldy $031b,x
$09:ae8a  78			sei
$09:ae8b  f6 e0		 inc $e0,x
$09:ae8d  9d c8 27	  sta $27c8,x
$09:ae90  7a			ply
$09:ae91  09 df 82	  ora #$82df
$09:ae94  77 60		 adc [$60],y
$09:ae96  99 a8 27	  sta $27a8,y
$09:ae99  ae 09 ec	  ldx $ec09
$09:ae9c  82 7e e0	  brl $8f1d
$09:ae9f  9f c8 27 b6   sta $b627c8,x
$09:aea3  09 ee 82	  ora #$82ee
$09:aea6  7f 60 9f e8   adc $e89f60,x
$09:aeaa  27 be		 and [$be]
$09:aeac  88			dey
$09:aead  7c 0f f9	  jmp ($f90f,x)
$09:aeb0  bc 28 9d	  ldy $9d28,x
$09:aeb3  ca			dex
$09:aeb4  21 d0		 and ($d0,x)
$09:aeb6  12 c0		 ora ($c0)
$09:aeb8  94 03		 sty $03,x
$09:aeba  d0 7a		 bne $af36
$09:aebc  e8			inx
$09:aebd  9f ea 22 30   sta $3022ea,x
$09:aec1  3d 94 4e	  and $4e94,x
$09:aec4  fd 13 f7	  sbc $f713,x
$09:aec7  44 3f 01	  mvp $01,$3f
$09:aeca  e0 68		 cpx #$68
$09:aecc  87 00		 sta [$00]
$09:aece  cd 51 15	  cmp $1551
$09:aed1  00 80		 brk #$80
$09:aed3  04 20		 tsb $20
$09:aed5  7f 55 22 78   adc $782255,x
$09:aed9  04 70		 tsb $70
$09:aedb  7f d8 22 70   adc $7022d8,x
$09:aedf  26 52		 rol $52
$09:aee1  1f 01 94 69   ora $699401,x
$09:aee5  10 4b		 bpl $af32
$09:aee7  83 5c		 sta $5c,s
$09:aee9  d3 45		 cmp ($45,s),y
$09:aeeb  73 4a		 adc ($4a,s),y
$09:aeed  8e 0e 89	  stx $890e
$09:aef0  82 38 99	  brl $482b
$09:aef3  c0 8e		 cpy #$8e
$09:aef5  c0 d4		 cpy #$d4
$09:aef7  6f 7a 6c a8   adc $a86c7a
$09:aefb  9e ea 27	  stz $27ea,x
$09:aefe  b5 46		 lda $46,x
$09:af00  4b			phk
$09:af01  72 a2		 adc ($a2)
$09:af03  7f 15 62 c0   adc $c06215,x
$09:af07  15 68		 ora $68,x
$09:af09  b2 95		 lda ($95)
$09:af0b  22 2d 82 4c   jsl $4c822d
$09:af0f  18			clc
$09:af10  74 dd		 stz $dd,x
$09:af12  00 ee		 brk #$ee
$09:af14  04 00		 tsb $00
$09:af16  62 87 62	  per $11a0
$09:af19  82 04 40	  brl $ef20
$09:af1c  0f 05 da 64   ora $64da05
$09:af20  60			rts
$09:af21  b9 d1 08	  lda $08d1,y
$09:af24  c0 46		 cpy #$46
$09:af26  0b			phd
$09:af27  25 12		 and $12
$09:af29  c6 ed		 dec $ed
$09:af2b  2a			rol a
$09:af2c  25 4a		 and $4a
$09:af2e  89 72 80	  bit #$8072
$09:af31  17 f4		 ora [$f4],y
$09:af33  6e 2e c0	  ror $c02e
$09:af36  b2 94		 lda ($94)
$09:af38  c0 86		 cpy #$86
$09:af3a  76 38		 ror $38,x
$09:af3c  21 f0		 and ($f0,x)
$09:af3e  0f 09 62 1d   ora $1d6209
$09:af42  99 f0 0a	  sta $0af0,y
$09:af45  80 e8		 bra $af2f
$09:af47  18			clc
$09:af48  25 94		 and $94
$09:af4a  92 43		 sta ($43)
$09:af4c  b1 0a		 lda ($0a),y
$09:af4e  01 d8		 ora ($d8,x)
$09:af50  4b			phk
$09:af51  60			rts
$09:af52  3b			tsc
$09:af53  37 70		 and [$70],y
$09:af55  10 8e		 bpl $aee5
$09:af57  09 53 82	  ora #$8253
$09:af5a  55 20		 eor $20,x
$09:af5c  8a			txa
$09:af5d  21 27		 and ($27,x)
$09:af5f  9a			txs
$09:af60  30 53		 bmi $afb5
$09:af62  e4 bb		 cpx $bb
$09:af64  22 e8 41 00   jsl $0041e8
$09:af68  40			rti
$09:af69  94 21		 sty $21,x
$09:af6b  11 55		 ora ($55),y
$09:af6d  28			plp
$09:af6e  8b			phb
$09:af6f  00 18		 brk #$18
$09:af71  26 0a		 rol $0a
$09:af73  88			dey
$09:af74  d2 06		 cmp ($06)
$09:af76  90 37		 bcc $afaf
$09:af78  82 a6 b7	  brl $6721
$09:af7b  52 b0		 eor ($b0)
$09:af7d  38			sec
$09:af7e  05 5e		 ora $5e
$09:af80  54 46 50	  mvn $50,$46
$09:af83  04 81		 tsb $81
$09:af85  64 07		 stz $07
$09:af87  20 65 05	  jsr $0565
$09:af8a  c9 be 29	  cmp #$29be
$09:af8d  40			rti
$09:af8e  2e 01 48	  rol $4801
$09:af91  c7 e2		 cmp [$e2]
$09:af93  b2 01		 lda ($01)
$09:af95  e1 32		 sbc ($32,x)
$09:af97  00 78		 brk #$78
$09:af99  4a			lsr a
$09:af9a  e3 39		 sbc $39,s
$09:af9c  9b			txy
$09:af9d  20 18 46	  jsr $4618
$09:afa0  43 33		 eor $33,s
$09:afa2  a3 d1		 lda $d1,s
$09:afa4  10 c8		 bpl $af6e
$09:afa6  86 03		 stx $03
$09:afa8  f1 af		 sbc ($af),y
$09:afaa  46 ca		 lsr $ca
$09:afac  60			rts
$09:afad  d2 ef		 cmp ($ef)
$09:afaf  9b			txy
$09:afb0  bc ff e9	  ldy $e9ff,x
$09:afb3  0f 50 fa cb   ora $cbfa50
$09:afb7  d8			cld
$09:afb8  7e d4 f7	  ror $f7d4,x
$09:afbb  2f bd bc 0f   and $0fbcbd
$09:afbf  e1 8f		 sbc ($8f,x)
$09:afc1  14 f8		 trb $f8
$09:afc3  eb			xba
$09:afc4  c9 7e 5c	  cmp #$5c7e
$09:afc7  f3 6f		 sbc ($6f,s),y
$09:afc9  9f bd 1f ea   sta $ea1fbd,x
$09:afcd  0f 58 fb 0b   ora $0bfb58
$09:afd1  da			phx
$09:afd2  7e e4 f7	  ror $f7e4,x
$09:afd5  af 81 bc 2f   lda $2fbc81
$09:afd9  e2 8f		 sep #$8f
$09:afdb  1c f9 2b	  trb $2bf9
$09:afde  cb			wai
$09:afdf  7e 6c f3	  ror $f36c,x
$09:afe2  ef a3 bd 3f   sbc $3fbda3
$09:afe6  eb			xba
$09:afe7  0f 60 fb 4b   ora $4bfb60
$09:afeb  dc 72 00	  jml [$0072]
$09:afee  f1 10		 sbc ($10),y
$09:aff0  11 00		 ora ($00),y
$09:aff2  01 00		 ora ($00,x)
$09:aff4  01 0f		 ora ($0f,x)
$09:aff6  01 f0		 ora ($f0,x)
$09:aff8  0f 00 01 0f   ora $0f0100
$09:affc  01 00		 ora ($00,x)
$09:affe  00 00		 brk #$00
$09:b000  ff 00 ff 00   sbc $00ff00,x
$09:b004  ff 00 ff 00   sbc $00ff00,x
$09:b008  ff 00 ff 00   sbc $00ff00,x
$09:b00c  ff 00 ff 00   sbc $00ff00,x
$09:b010  00 00		 brk #$00
$09:b012  00 00		 brk #$00
$09:b014  00 00		 brk #$00
$09:b016  00 00		 brk #$00
$09:b018  00 00		 brk #$00
$09:b01a  00 00		 brk #$00
$09:b01c  00 00		 brk #$00
$09:b01e  00 00		 brk #$00
$09:b020  ff 00 ff 00   sbc $00ff00,x
$09:b024  ff 00 ff 00   sbc $00ff00,x
$09:b028  ff 00 ff 00   sbc $00ff00,x
$09:b02c  ff 00 ff 00   sbc $00ff00,x
$09:b030  00 00		 brk #$00
$09:b032  00 00		 brk #$00
$09:b034  00 00		 brk #$00
$09:b036  00 00		 brk #$00
$09:b038  00 00		 brk #$00
$09:b03a  00 00		 brk #$00
$09:b03c  00 00		 brk #$00
$09:b03e  00 00		 brk #$00
$09:b040  00 ff		 brk #$ff
$09:b042  00 ff		 brk #$ff
$09:b044  10 ff		 bpl $b045
$09:b046  1c ef 0e	  trb $0eef
$09:b049  f7 07		 sbc [$07],y
$09:b04b  fb			xce
$09:b04c  03 fd		 ora $fd,s
$09:b04e  01 fe		 ora ($fe,x)
$09:b050  ff ff ff ff   sbc $ffffff,x
$09:b054  cf cf c3 c3   cmp $c3c3cf
$09:b058  e1 e1		 sbc ($e1,x)
$09:b05a  e0 e0		 cpx #$e0
$09:b05c  f0 f0		 beq $b04e
$09:b05e  f8			sed
$09:b05f  f8			sed
$09:b060  00 ff		 brk #$ff
$09:b062  00 ff		 brk #$ff
$09:b064  00 ff		 brk #$ff
$09:b066  00 ff		 brk #$ff
$09:b068  00 ff		 brk #$ff
$09:b06a  00 ff		 brk #$ff
$09:b06c  80 ff		 bra $b06d
$09:b06e  c0 ff		 cpy #$ff
$09:b070  ff ff ff ff   sbc $ffffff,x
$09:b074  ff ff ff ff   sbc $ffffff,x
$09:b078  ff ff ff ff   sbc $ffffff,x
$09:b07c  7f 7f 3f 3f   adc $3f3f7f,x
$09:b080  00 ff		 brk #$ff
$09:b082  60			rts
$09:b083  ff 30 ff 38   sbc $38ff30,x
$09:b087  df 1c ef 0e   cmp $0eef1c,x
$09:b08b  f7 07		 sbc [$07],y
$09:b08d  fb			xce
$09:b08e  03 fd		 ora $fd,s
$09:b090  ff ff 9f 9f   sbc $9f9fff,x
$09:b094  8f 8f 87 87   sta $87878f
$09:b098  c3 c3		 cmp $c3,s
$09:b09a  e1 e1		 sbc ($e1,x)
$09:b09c  f0 f0		 beq $b08e
$09:b09e  f8			sed
$09:b09f  f8			sed
$09:b0a0  00 ff		 brk #$ff
$09:b0a2  00 ff		 brk #$ff
$09:b0a4  00 ff		 brk #$ff
$09:b0a6  00 ff		 brk #$ff
$09:b0a8  00 ff		 brk #$ff
$09:b0aa  00 ff		 brk #$ff
$09:b0ac  00 ff		 brk #$ff
$09:b0ae  80 ff		 bra $b0af
$09:b0b0  ff ff ff ff   sbc $ffffff,x
$09:b0b4  ff ff ff ff   sbc $ffffff,x
$09:b0b8  ff ff ff ff   sbc $ffffff,x
$09:b0bc  ff ff 7f 7f   sbc $7f7fff,x
$09:b0c0  00 ff		 brk #$ff
$09:b0c2  70 ff		 bvs $b0c3
$09:b0c4  78			sei
$09:b0c5  df 6c cf 24   cmp $24cf6c,x
$09:b0c9  c7 06		 cmp [$06]
$09:b0cb  e3 07		 sbc $07,s
$09:b0cd  f9 02 fc	  sbc $fc02,y
$09:b0d0  ff ff 8f 8f   sbc $8f8fff,x
$09:b0d4  a7 a7		 lda [$a7]
$09:b0d6  b3 b3		 lda ($b3,s),y
$09:b0d8  fb			xce
$09:b0d9  fb			xce
$09:b0da  fd fd fe	  sbc $fefd,x
$09:b0dd  fe ff ff	  inc $ffff,x
$09:b0e0  00 ff		 brk #$ff
$09:b0e2  00 ff		 brk #$ff
$09:b0e4  00 ff		 brk #$ff
$09:b0e6  00 ff		 brk #$ff
$09:b0e8  00 ff		 brk #$ff
$09:b0ea  00 ff		 brk #$ff
$09:b0ec  10 ff		 bpl $b0ed
$09:b0ee  92 fd		 sta ($fd)
$09:b0f0  ff ff ff ff   sbc $ffffff,x
$09:b0f4  ff ff ff ff   sbc $ffffff,x
$09:b0f8  ff ff ff ff   sbc $ffffff,x
$09:b0fc  ef ef 6f 6f   sbc $6f6fef
$09:b100  00 ff		 brk #$ff
$09:b102  30 ff		 bmi $b103
$09:b104  0c cf 30	  tsb $30cf
$09:b107  f7 3a		 sbc [$3a],y
$09:b109  db			stp
$09:b10a  1d ed 0c	  ora $0ced,x
$09:b10d  f6 06		 inc $06,x
$09:b10f  fb			xce
$09:b110  ff ff 8f 8f   sbc $8f8fff,x
$09:b114  83 b3		 sta $b3,s
$09:b116  a3 9b		 lda $9b,s
$09:b118  d1 cd		 cmp ($cd),y
$09:b11a  c8			iny
$09:b11b  c6 f4		 dec $f4
$09:b11d  f3 fa		 sbc ($fa,s),y
$09:b11f  f9 00 ff	  sbc $ff00,y
$09:b122  00 ff		 brk #$ff
$09:b124  00 ff		 brk #$ff
$09:b126  00 ff		 brk #$ff
$09:b128  00 ff		 brk #$ff
$09:b12a  00 ff		 brk #$ff
$09:b12c  80 ff		 bra $b12d
$09:b12e  40			rti
$09:b12f  73 ff		 adc ($ff,s),y
$09:b131  ff ff ff ff   sbc $ffffff,x
$09:b135  ff ff ff ff   sbc $ffffff,x
$09:b139  ff ff ff 7f   sbc $7fffff,x
$09:b13d  7f 33 bf 00   adc $00bf33,x
$09:b141  ff 71 ff 74   sbc $74ff71,x
$09:b145  bc 22 d5	  ldy $d522,x
$09:b148  04 ff		 tsb $ff
$09:b14a  1d ee 0e	  ora $0eee,x
$09:b14d  f7 07		 sbc [$07],y
$09:b14f  fb			xce
$09:b150  ff ff 8f 8f   sbc $8f8fff,x
$09:b154  8f 8f 9f 9f   sta $9f9f8f
$09:b158  9b			txy
$09:b159  9b			txy
$09:b15a  c3 c3		 cmp $c3,s
$09:b15c  e1 e1		 sbc ($e1,x)
$09:b15e  f0 f0		 beq $b150
$09:b160  00 ff		 brk #$ff
$09:b162  c4 ff		 cpy $ff
$09:b164  10 ff		 bpl $b165
$09:b166  00 bf		 brk #$bf
$09:b168  80 7f		 bra $b1e9
$09:b16a  00 ff		 brk #$ff
$09:b16c  00 ff		 brk #$ff
$09:b16e  00 ff		 brk #$ff
$09:b170  ff ff ff ff   sbc $ffffff,x
$09:b174  ff ff ff ff   sbc $ffffff,x
$09:b178  ff ff ff ff   sbc $ffffff,x
$09:b17c  ff ff ff ff   sbc $ffffff,x
$09:b180  00 ff		 brk #$ff
$09:b182  64 c7		 stz $c7
$09:b184  78			sei
$09:b185  aa			tax
$09:b186  3a			dec a
$09:b187  92 1d		 sta ($1d)
$09:b189  c9 2f e5	  cmp #$e52f
$09:b18c  17 f2		 ora [$f2],y
$09:b18e  03 f9		 ora $f9,s
$09:b190  ff ff bf bf   sbc $bfbfff,x
$09:b194  df df ef ef   cmp $efefdf,x
$09:b198  f7 f7		 sbc [$f7],y
$09:b19a  fb			xce
$09:b19b  fb			xce
$09:b19c  fd fd fe	  sbc $fefd,x
$09:b19f  fe 00 ff	  inc $ff00,x
$09:b1a2  40			rti
$09:b1a3  7f 80 bf 10   adc $10bf80,x
$09:b1a7  bf 00 af 10   lda $10af00,x
$09:b1ab  bf 40 2f d0   lda $d02f40,x
$09:b1af  1f ff ff ff   ora $ffffff,x
$09:b1b3  ff ff ff ff   sbc $ffffff,x
$09:b1b7  ff ff ff ff   sbc $ffffff,x
$09:b1bb  ff ff ff ff   sbc $ffffff,x
$09:b1bf  ff 00 ff 24   sbc $24ff00,x
$09:b1c3  f7 39		 sbc [$39],y
$09:b1c5  fd 1c ee	  sbc $ee1c,x
$09:b1c8  2e b7 57	  rol $57b7
$09:b1cb  db			stp
$09:b1cc  23 fd		 and $fd,s
$09:b1ce  05 e6		 ora $e6
$09:b1d0  ff ff 87 fb   sbc $fb87ff,x
$09:b1d4  81 ce		 sta ($ce,x)
$09:b1d6  80 c7		 bra $b19f
$09:b1d8  80 e3		 bra $b1bd
$09:b1da  c0 b1		 cpy #$b1
$09:b1dc  e0 d8		 cpx #$d8
$09:b1de  e0 fc		 cpx #$fc
$09:b1e0  00 ff		 brk #$ff
$09:b1e2  80 ff		 bra $b1e3
$09:b1e4  00 7f		 brk #$7f
$09:b1e6  00 ff		 brk #$ff
$09:b1e8  d0 ff		 bne $b1e9
$09:b1ea  80 af		 bra $b19b
$09:b1ec  a8			tay
$09:b1ed  ef c0 d7 ff   sbc $ffd7c0
$09:b1f1  ff ff 7f 7f   sbc $7f7fff,x
$09:b1f5  ff 7f ff 7f   sbc $7fff7f,x
$09:b1f9  af 2f 7f 2f   lda $2f7f2f
$09:b1fd  d7 07		 cmp [$07],y
$09:b1ff  7f ff 00 ff   adc $ff00ff,x
$09:b203  00 ff		 brk #$ff
$09:b205  00 ff		 brk #$ff
$09:b207  00 ff		 brk #$ff
$09:b209  00 ff		 brk #$ff
$09:b20b  00 ff		 brk #$ff
$09:b20d  00 ff		 brk #$ff
$09:b20f  00 00		 brk #$00
$09:b211  00 00		 brk #$00
$09:b213  00 00		 brk #$00
$09:b215  00 00		 brk #$00
$09:b217  00 00		 brk #$00
$09:b219  00 00		 brk #$00
$09:b21b  00 00		 brk #$00
$09:b21d  00 00		 brk #$00
$09:b21f  00 ff		 brk #$ff
$09:b221  00 ff		 brk #$ff
$09:b223  00 ff		 brk #$ff
$09:b225  00 ff		 brk #$ff
$09:b227  00 ff		 brk #$ff
$09:b229  00 ff		 brk #$ff
$09:b22b  00 ff		 brk #$ff
$09:b22d  00 ff		 brk #$ff
$09:b22f  00 00		 brk #$00
$09:b231  00 00		 brk #$00
$09:b233  00 00		 brk #$00
$09:b235  00 00		 brk #$00
$09:b237  00 00		 brk #$00
$09:b239  00 00		 brk #$00
$09:b23b  00 00		 brk #$00
$09:b23d  00 00		 brk #$00
$09:b23f  00 00		 brk #$00
$09:b241  ff 00 ff 00   sbc $00ff00,x
$09:b245  ff 00 ff 00   sbc $00ff00,x
$09:b249  ff 00 ff 00   sbc $00ff00,x
$09:b24d  ff 00 ff fc   sbc $fcff00,x
$09:b251  fc fe fe	  jsr ($fefe,x)
$09:b254  ff ff ff ff   sbc $ffffff,x
$09:b258  ff ff ff ff   sbc $ffffff,x
$09:b25c  ff ff ff ff   sbc $ffffff,x
$09:b260  e0 7f		 cpx #$7f
$09:b262  68			pla
$09:b263  b7 10		 lda [$10],y
$09:b265  e7 20		 sbc [$20]
$09:b267  cf d0 0f 0e   cmp $0e0fd0
$09:b26b  e7 02		 sbc [$02]
$09:b26d  ff 00 ff 1f   sbc $1fff00,x
$09:b271  17 1f		 ora [$1f],y
$09:b273  07 3f		 ora [$3f]
$09:b275  07 ff		 ora [$ff]
$09:b277  87 ff		 sta [$ff]
$09:b279  03 f9		 ora $f9,s
$09:b27b  e5 f9		 sbc $f9
$09:b27d  ff ff ff 01   sbc $01ffff,x
$09:b281  fe 00 ff	  inc $ff00,x
$09:b284  00 ff		 brk #$ff
$09:b286  00 ff		 brk #$ff
$09:b288  00 ff		 brk #$ff
$09:b28a  00 ff		 brk #$ff
$09:b28c  00 ff		 brk #$ff
$09:b28e  00 ff		 brk #$ff
$09:b290  fc fc fe	  jsr ($fefc,x)
$09:b293  fe ff ff	  inc $ffff,x
$09:b296  ff ff ff ff   sbc $ffffff,x
$09:b29a  ff ff ff ff   sbc $ffffff,x
$09:b29e  ff ff cc fb   sbc $fbccff,x
$09:b2a2  e8			inx
$09:b2a3  77 70		 adc [$70],y
$09:b2a5  af 28 df d4   lda $d4df28
$09:b2a9  37 9a		 and [$9a],y
$09:b2ab  7b			tdc
$09:b2ac  0c fd 00	  tsb $00fd
$09:b2af  ff 31 37 17   sbc $173731,x
$09:b2b3  1f 07 1f 8f   ora $8f1f07,x
$09:b2b7  bf 1f ff 7f   lda $7fff1f,x
$09:b2bb  ff 7f ff ff   sbc $ffff7f,x
$09:b2bf  ff 00 fe 00   sbc $00fe00,x
$09:b2c3  ff 00 ff 03   sbc $03ff00,x
$09:b2c7  ff 00 ff 00   sbc $00ff00,x
$09:b2cb  ff 01 fe 00   sbc $00fe01,x
$09:b2cf  ff ff ff ff   sbc $ffffff,x
$09:b2d3  ff ff ff fc   sbc $fcffff,x
$09:b2d7  fc ff ff	  jsr ($ffff,x)
$09:b2da  ff ff ff ff   sbc $ffffff,x
$09:b2de  ff ff dc 6b   sbc $6bdcff,x
$09:b2e2  ac 2b 38	  ldy $382b
$09:b2e5  97 a0		 sta [$a0],y
$09:b2e7  07 e8		 ora [$e8]
$09:b2e9  c7 84		 cmp [$84]
$09:b2eb  33 02		 and ($02,s),y
$09:b2ed  f9 00 ff	  sbc $ff00,y
$09:b2f0  b7 b7		 lda [$b7],y
$09:b2f2  d7 d7		 cmp [$d7],y
$09:b2f4  ef ef ff e7   sbc $e7ffef
$09:b2f8  3f 23 ff f1   and $f1ff23,x
$09:b2fc  ff f9 ff ff   sbc $fffff9,x
$09:b300  03 fd		 ora $fd,s
$09:b302  01 fe		 ora ($fe,x)
$09:b304  00 ff		 brk #$ff
$09:b306  00 ff		 brk #$ff
$09:b308  01 ff		 ora ($ff,x)
$09:b30a  01 ff		 ora ($ff,x)
$09:b30c  00 ff		 brk #$ff
$09:b30e  00 ff		 brk #$ff
$09:b310  fd fc fe	  sbc $fefc,x
$09:b313  fe ff ff	  inc $ffff,x
$09:b316  ff ff ff fe   sbc $feffff,x
$09:b31a  ff fe ff ff   sbc $fffffe,x
$09:b31e  ff ff 20 b7   sbc $b720ff,x
$09:b322  88			dey
$09:b323  cf 58 df 20   cmp $20df58
$09:b327  af 50 77 0a   lda $0a7750
$09:b32b  fb			xce
$09:b32c  04 fb		 tsb $fb
$09:b32e  00 ff		 brk #$ff
$09:b330  17 df		 ora [$df],y
$09:b332  8f 77 5f 27   sta $275f77
$09:b336  a7 df		 lda [$df]
$09:b338  73 af		 adc ($af,s),y
$09:b33a  f9 f7 f9	  sbc $f9f7,y
$09:b33d  ff ff ff 03   sbc $03ffff,x
$09:b341  fd 01 fe	  sbc $fe01,x
$09:b344  00 ff		 brk #$ff
$09:b346  00 ff		 brk #$ff
$09:b348  00 ff		 brk #$ff
$09:b34a  00 ff		 brk #$ff
$09:b34c  00 ff		 brk #$ff
$09:b34e  00 ff		 brk #$ff
$09:b350  f8			sed
$09:b351  f8			sed
$09:b352  fc fc fe	  jsr ($fefc,x)
$09:b355  fe ff ff	  inc $ffff,x
$09:b358  ff ff ff ff   sbc $ffffff,x
$09:b35c  ff ff ff ff   sbc $ffffff,x
$09:b360  80 ff		 bra $b361
$09:b362  c0 ff		 cpy #$ff
$09:b364  e8			inx
$09:b365  77 50		 adc [$50],y
$09:b367  a7 28		 lda [$28]
$09:b369  cf 94 2f 08   cmp $082f94
$09:b36d  f7 00		 sbc [$00],y
$09:b36f  ff 7f 7f 37   sbc $377f7f,x
$09:b373  3f 07 1f 0f   and $0f1f07,x
$09:b377  37 97		 and [$97],y
$09:b379  ef 63 bf f3   sbc $f3bf63
$09:b37d  ff ff ff 05   sbc $05ffff,x
$09:b381  fc 00 fe	  jsr ($fe00,x)
$09:b384  01 ff		 ora ($ff,x)
$09:b386  00 ff		 brk #$ff
$09:b388  00 ff		 brk #$ff
$09:b38a  00 ff		 brk #$ff
$09:b38c  00 ff		 brk #$ff
$09:b38e  00 ff		 brk #$ff
$09:b390  ff ff ff ff   sbc $ffffff,x
$09:b394  ff ff ff ff   sbc $ffffff,x
$09:b398  ff ff ff ff   sbc $ffffff,x
$09:b39c  ff ff ff ff   sbc $ffffff,x
$09:b3a0  c0 9f		 cpy #$9f
$09:b3a2  ec 5f 70	  cpx $705f
$09:b3a5  3f a0 a7 48   and $48a7a0,x
$09:b3a9  e7 06		 sbc [$06]
$09:b3ab  f3 02		 sbc ($02,s),y
$09:b3ad  ff 00 ff 7f   sbc $7fff00,x
$09:b3b1  7f b3 bf c7   adc $c7bfb3,x
$09:b3b5  df df e7 9f   cmp $9fe7df,x
$09:b3b9  e3 bd		 sbc $bd,s
$09:b3bb  f3 f9		 sbc ($f9,s),y
$09:b3bd  ff ff ff 18   sbc $18ffff,x
$09:b3c1  fb			xce
$09:b3c2  05 fd		 ora $fd
$09:b3c4  02 fe		 cop #$fe
$09:b3c6  02 fe		 cop #$fe
$09:b3c8  00 ff		 brk #$ff
$09:b3ca  00 ff		 brk #$ff
$09:b3cc  00 ff		 brk #$ff
$09:b3ce  00 ff		 brk #$ff
$09:b3d0  f8			sed
$09:b3d1  e6 fc		 inc $fc
$09:b3d3  fb			xce
$09:b3d4  fe fd fe	  inc $fefd,x
$09:b3d7  fd ff ff	  sbc $ffff,x
$09:b3da  ff ff ff ff   sbc $ffffff,x
$09:b3de  ff ff f4 7f   sbc $7ff4ff,x
$09:b3e2  72 bb		 adc ($bb)
$09:b3e4  b6 d5		 ldx $d5,y
$09:b3e6  1c eb 98	  trb $98eb
$09:b3e9  b7 34		 lda [$34],y
$09:b3eb  e3 62		 sbc $62,s
$09:b3ed  d9 00 ff	  cmp $ff00,y
$09:b3f0  07 2b		 ora [$2b]
$09:b3f2  01 1f		 ora ($1f,x)
$09:b3f4  03 8d		 ora $8d,s
$09:b3f6  07 cb		 ora [$cb]
$09:b3f8  8f 73 df e1   sta $e1df73
$09:b3fc  bf d9 ff ff   lda $ffffd9,x
$09:b400  00 ff		 brk #$ff
$09:b402  23 ff		 and $ff,s
$09:b404  3b			tsc
$09:b405  df 1c ef 0e   cmp $0eef1c,x
$09:b409  f7 07		 sbc [$07],y
$09:b40b  fb			xce
$09:b40c  63 fd		 adc $fd,s
$09:b40e  61 fe		 adc ($fe,x)
$09:b410  ff ff 9c 9f   sbc $9f9cff,x
$09:b414  84 84		 sty $84
$09:b416  c3 c3		 cmp $c3,s
$09:b418  c1 c1		 cmp ($c1,x)
$09:b41a  e0 e0		 cpx #$e0
$09:b41c  90 d0		 bcc $b3ee
$09:b41e  98			tya
$09:b41f  d8			cld
$09:b420  00 ff		 brk #$ff
$09:b422  c0 ff		 cpy #$ff
$09:b424  e0 ff		 cpx #$ff
$09:b426  f0 ff		 beq $b427
$09:b428  70 ff		 bvs $b429
$09:b42a  70 ff		 bvs $b42b
$09:b42c  80 ff		 bra $b42d
$09:b42e  c8			iny
$09:b42f  f7 ff		 sbc [$ff],y
$09:b431  ff 7f ff 3f   sbc $3fff7f,x
$09:b435  7f 1f 3f 9f   adc $9f3f1f,x
$09:b439  bf 9f bf 7f   lda $7fbf9f,x
$09:b43d  7f 27 3f 00   adc $003f27,x
$09:b441  ff 1e ef 29   sbc $29ef1e,x
$09:b445  d3 24		 cmp ($24,s),y
$09:b447  df 34 cd 23   cmp $23cd34,x
$09:b44b  df 0c f4 03   cmp $03f40c,x
$09:b44f  ff ff ff e7   sbc $e7ffff,x
$09:b453  e1 c3		 sbc ($c3,x)
$09:b455  c6 cf		 dec $cf
$09:b457  cb			wai
$09:b458  cd cb d8	  cmp $d8cb
$09:b45b  d8			cld
$09:b45c  f3 f3		 sbc ($f3,s),y
$09:b45e  f0 f0		 beq $b450
$09:b460  00 ff		 brk #$ff
$09:b462  28			plp
$09:b463  eb			xba
$09:b464  dc e5 02	  jml [$02e5]
$09:b467  ef 14 db a2   sbc $a2db14
$09:b46b  bd 98 97	  lda $9798,x
$09:b46e  48			pha
$09:b46f  cf ff ff e7   cmp $e7ffff
$09:b473  d7 e3		 cmp [$e3],y
$09:b475  33 e9		 and ($e9,s),y
$09:b477  f9 d9 e9	  sbc $e9d9,y
$09:b47a  4d 4d 67	  eor $674d
$09:b47d  47 37		 eor [$37]
$09:b47f  37 00		 and [$00],y
$09:b481  ff 02 dc 00   sbc $00dc02,x
$09:b485  bb			tyx
$09:b486  00 bf		 brk #$bf
$09:b488  40			rti
$09:b489  bf 60 9b 32   lda $329b60,x
$09:b48d  c5 04		 cmp $04
$09:b48f  fb			xce
$09:b490  ff ff de ff   sbc $ffdeff,x
$09:b494  9b			txy
$09:b495  df 87 d7 83   cmp $83d787,x
$09:b499  cb			wai
$09:b49a  83 c7		 sta $c7,s
$09:b49c  c4 fc		 cpy $fc
$09:b49e  f8			sed
$09:b49f  f8			sed
$09:b4a0  00 ff		 brk #$ff
$09:b4a2  c0 3b		 cpy #$3b
$09:b4a4  00 dd		 brk #$dd
$09:b4a6  02 fd		 cop #$fd
$09:b4a8  20 dd 24	  jsr $24dd
$09:b4ab  d9 1c e3	  cmp $e31c,y
$09:b4ae  00 ff		 brk #$ff
$09:b4b0  ff ff 3b ff   sbc $ff3bff,x
$09:b4b4  d9 fb e3	  cmp $e3fb,y
$09:b4b7  ef c1 c3 c1   sbc $c1c3c1
$09:b4bb  e3 23		 sbc $23,s
$09:b4bd  ff 1f 5f 00   sbc $005f1f,x
$09:b4c1  ff 04 fc 4d   sbc $4dfc04,x
$09:b4c5  d9 24 93	  cmp $9324,y
$09:b4c8  48			pha
$09:b4c9  db			stp
$09:b4ca  02 e9		 cop #$e9
$09:b4cc  28			plp
$09:b4cd  e5 2e		 sbc $2e
$09:b4cf  e1 ff		 sbc ($ff,x)
$09:b4d1  ff fc fb d9   sbc $d9fbfc,x
$09:b4d5  a6 93		 ldx $93
$09:b4d7  ed db a5	  sbc $a5db
$09:b4da  e9 d7 e5	  sbc #$e5d7
$09:b4dd  da			phx
$09:b4de  e5 da		 sbc $da
$09:b4e0  00 ff		 brk #$ff
$09:b4e2  a0 3f		 ldy #$3f
$09:b4e4  b2 9b		 lda ($9b)
$09:b4e6  24 c9		 bit $c9
$09:b4e8  14 dd		 trb $dd
$09:b4ea  40			rti
$09:b4eb  97 14		 sta [$14],y
$09:b4ed  a7 3c		 lda [$3c]
$09:b4ef  87 ff		 sta [$ff]
$09:b4f1  ff 3f df bb   sbc $bbdf3f,x
$09:b4f5  45 c9		 eor $c9
$09:b4f7  b7 dd		 lda [$dd],y
$09:b4f9  a3 97		 lda $97,s
$09:b4fb  eb			xba
$09:b4fc  a7 5b		 lda [$5b]
$09:b4fe  97 6b		 sta [$6b],y
$09:b500  00 ff		 brk #$ff
$09:b502  00 ff		 brk #$ff
$09:b504  27 da		 and [$da]
$09:b506  4c b3 70	  jmp $70b3
$09:b509  8f 38 e7 74   sta $74e738
$09:b50d  8b			phb
$09:b50e  6d 92 ff	  adc $ff92
$09:b511  ff bf ff 83   sbc $83ffbf,x
$09:b515  c2 87		 rep #$87
$09:b517  83 cb		 sta $cb,s
$09:b519  cf fd ff e8   cmp $e8fffd
$09:b51d  e9 d9 d9	  sbc #$d9d9
$09:b520  00 ff		 brk #$ff
$09:b522  02 fd		 cop #$fd
$09:b524  ec 5b 12	  cpx $125b
$09:b527  ed 3e d1	  sbc $d13e
$09:b52a  58			cli
$09:b52b  af da 75 be   lda $be75da
$09:b52f  49 ff ff	  eor #$ffff
$09:b532  fd ff c1	  sbc $c1ff,x
$09:b535  43 e1		 eor $e1,s
$09:b537  e1 d3		 sbc ($d3,x)
$09:b539  f3 bf		 sbc ($bf,s),y
$09:b53b  ff 11 91 9b   sbc $9b9111,x
$09:b53f  9b			txy
$09:b540  00 ff		 brk #$ff
$09:b542  43 bc		 eor $bc,s
$09:b544  20 ff 30	  jsr $30ff
$09:b547  af 40 ff 06   lda $06ff40
$09:b54b  ff 48 ba 0d   sbc $0dba48,x
$09:b54f  fd ff ff	  sbc $ffff,x
$09:b552  bf fc ab ff   lda $ffabfc,x
$09:b556  eb			xba
$09:b557  ff ed ff de   sbc $deffed,x
$09:b55b  ff fd bd ff   sbc $ffbdfd,x
$09:b55f  ff 00 ff c2   sbc $c2ff00,x
$09:b563  3d 28 d7	  and $d728,x
$09:b566  28			plp
$09:b567  f3 64		 sbc ($64,s),y
$09:b569  ad c2 5f	  lda $5fc2
$09:b56c  8a			txa
$09:b56d  ad c8 cf	  lda $cfc8
$09:b570  ff ff fd 3f   sbc $3ffdff,x
$09:b574  d1 fb		 cmp ($fb),y
$09:b576  d5 dd		 cmp $dd,x
$09:b578  b7 ff		 lda [$ff],y
$09:b57a  6b			rtl
$09:b57b  ef df dd ff   sbc $ffdddf
$09:b57f  ff 00 ff 20   sbc $20ff00,x
$09:b583  df 18 e7 3c   cmp $3ce718,x
$09:b587  db			stp
$09:b588  3e cd 0e	  rol $0ecd,x
$09:b58b  f5 07		 sbc $07,x
$09:b58d  fb			xce
$09:b58e  07 f9		 ora [$f9]
$09:b590  ff ff df ff   sbc $ffdfff,x
$09:b594  82 ff 81	  brl $3796
$09:b597  e7 81		 sbc [$81]
$09:b599  f3 c0		 sbc ($c0,s),y
$09:b59b  fb			xce
$09:b59c  f0 fc		 beq $b59a
$09:b59e  f0 fe		 beq $b59e
$09:b5a0  00 ff		 brk #$ff
$09:b5a2  04 fb		 tsb $fb
$09:b5a4  1a			inc a
$09:b5a5  e5 3c		 sbc $3c
$09:b5a7  db			stp
$09:b5a8  7c b3 70	  jmp ($70b3,x)
$09:b5ab  af e0 df e0   lda $e0dfe0
$09:b5af  9f ff ff fb   sta $fbffff,x
$09:b5b3  ff 41 ff 81   sbc $81ff41,x
$09:b5b7  e7 81		 sbc [$81]
$09:b5b9  cf 03 df 0f   cmp $0fdf03
$09:b5bd  3f 0f 7f 00   and $007f0f,x
$09:b5c1  ff 40 bf 09   sbc $09bf40,x
$09:b5c5  f4 18 e7	  pea $e718
$09:b5c8  10 eb		 bpl $b5b5
$09:b5ca  40			rti
$09:b5cb  b1 22		 lda ($22),y
$09:b5cd  d9 00 fd	  cmp $fd00,y
$09:b5d0  ff ff bf ff   sbc $ffbfff,x
$09:b5d4  83 fc		 sta $fc,s
$09:b5d6  c3 ff		 cmp $ff,s
$09:b5d8  85 fb		 sta $fb
$09:b5da  ce b1 fe	  dec $feb1
$09:b5dd  d9 f6 fd	  cmp $fdf6,y
$09:b5e0  00 ff		 brk #$ff
$09:b5e2  02 fd		 cop #$fd
$09:b5e4  9c 2b 18	  stz $182b
$09:b5e7  e7 4c		 sbc [$4c]
$09:b5e9  93 c4		 sta ($c4,s),y
$09:b5eb  2b			pld
$09:b5ec  e0 0f		 cpx #$0f
$09:b5ee  90 0f		 bcc $b5ff
$09:b5f0  ff ff fd ff   sbc $fffdff,x
$09:b5f4  c1 37		 cmp ($37,x)
$09:b5f6  c3 ff		 cmp $ff,s
$09:b5f8  a1 df		 lda ($df,x)
$09:b5fa  71 8f		 adc ($8f),y
$09:b5fc  7b			tdc
$09:b5fd  8f 6f 9f 70   sta $709f6f
$09:b601  ff 7c ff 3c   sbc $3cff7c,x
$09:b605  ff 1d fe 00   sbc $00fe1d,x
$09:b609  ff 00 ff 00   sbc $00ff00,x
$09:b60d  ff 00 ff 8c   sbc $8cff00,x
$09:b611  cc c2 e2	  cpy $e2c2
$09:b614  e3 ff		 sbc $ff,s
$09:b616  fe ff fe	  inc $feff,x
$09:b619  ff ff ff ff   sbc $ffffff,x
$09:b61d  ff ff ff ee   sbc $eeffff,x
$09:b621  75 60		 adc $60,x
$09:b623  bf 10 ff 78   lda $78ff10,x
$09:b627  b7 88		 lda [$88],y
$09:b629  73 0e		 adc ($0e,s),y
$09:b62b  fb			xce
$09:b62c  82 7d 00	  brl $b6ac
$09:b62f  ff 11 1b 03   sbc $031b11,x
$09:b633  0f 27 2f 9f   ora $9f2f27
$09:b637  bf 1f ff 3d   lda $3dff1f,x
$09:b63b  fd 79 ff	  sbc $ff79,x
$09:b63e  ff ff 10 ef   sbc $ef10ff,x
$09:b642  19 e6 0e	  ora $0ee6,y
$09:b645  f1 01		 sbc ($01),y
$09:b647  fe 03 fc	  inc $fc03,x
$09:b64a  03 fc		 ora $fc,s
$09:b64c  01 fe		 ora ($fe,x)
$09:b64e  00 ff		 brk #$ff
$09:b650  e0 e0		 cpx #$e0
$09:b652  e0 e0		 cpx #$e0
$09:b654  f1 f1		 sbc ($f1),y
$09:b656  fe fe fc	  inc $fcfe,x
$09:b659  fc fc fc	  jsr ($fcfc,x)
$09:b65c  fe fe ff	  inc $fffe,x
$09:b65f  ff 3c fb c4   sbc $c4fb3c,x
$09:b663  3b			tsc
$09:b664  28			plp
$09:b665  d7 00		 cmp [$00],y
$09:b667  bf 60 df 20   lda $20df60,x
$09:b66b  df c0 3f 00   cmp $003fc0,x
$09:b66f  ff 03 03 03   sbc $030303,x
$09:b673  03 c7		 ora $c7,s
$09:b675  c7 7f		 cmp [$7f]
$09:b677  7f 1f 1f 1f   adc $1f1f1f,x
$09:b67b  1f 3f 3f ff   ora $ff3f3f,x
$09:b67f  ff 0d f2 06   sbc $06f20d,x
$09:b683  f9 0d f2	  sbc $f20d,y
$09:b686  13 ec		 ora ($ec,s),y
$09:b688  03 f4		 ora $f4,s
$09:b68a  22 cd 21 de   jsl $de21cd
$09:b68e  00 ff		 brk #$ff
$09:b690  f0 f0		 beq $b682
$09:b692  f9 f9 f2	  sbc $f2f9,y
$09:b695  f3 e4		 sbc ($e4,s),y
$09:b697  e5 e4		 sbc $e4
$09:b699  ed cc dc	  sbc $dccc
$09:b69c  de fe ff	  dec $fffe,x
$09:b69f  ff 90 6f 60   sbc $606f90,x
$09:b6a3  9f a0 5f 00   sta $005fa0,x
$09:b6a7  7f 90 6f 00   adc $006f90,x
$09:b6ab  f7 84		 sbc [$84],y
$09:b6ad  7b			tdc
$09:b6ae  00 ff		 brk #$ff
$09:b6b0  0f 0f 9f 9f   ora $9f9f0f
$09:b6b4  cf cf 27 ff   cmp $ff27cf
$09:b6b8  37 f7		 and [$f7],y
$09:b6ba  33 3b		 and ($3b,s),y
$09:b6bc  7b			tdc
$09:b6bd  7f ff ff 14   adc $14ffff,x
$09:b6c1  f1 08		 sbc ($08),y
$09:b6c3  fb			xce
$09:b6c4  06 f9		 asl $f9
$09:b6c6  06 fe		 asl $fe
$09:b6c8  03 fb		 ora $fb,s
$09:b6ca  04 fc		 tsb $fc
$09:b6cc  03 ff		 ora $ff,s
$09:b6ce  00 ff		 brk #$ff
$09:b6d0  f1 ce		 sbc ($ce),y
$09:b6d2  fb			xce
$09:b6d3  e4 f8		 cpx $f8
$09:b6d5  f0 fe		 beq $b6d5
$09:b6d7  f1 fb		 sbc ($fb),y
$09:b6d9  f4 fc f3	  pea $f3fc
$09:b6dc  ff f4 ff ff   sbc $fffff4,x
$09:b6e0  50 c7		 bvc $b6a9
$09:b6e2  28			plp
$09:b6e3  ef 60 9f e0   sbc $e09f60
$09:b6e7  3f e0 df e0   and $e0dfe0,x
$09:b6eb  3f c0 ff 00   and $00ffc0,x
$09:b6ef  ff c7 3b ef   sbc $ef3bc7,x
$09:b6f3  17 1f		 ora [$1f],y
$09:b6f5  0f 3f cf df   ora $dfcf3f
$09:b6f9  2f 3f cf ff   and $ffcf3f
$09:b6fd  2f ff ff 0e   and $0effff
$09:b701  f9 05 ff	  sbc $ff05,y
$09:b704  1d e7 36	  ora $36e7,x
$09:b707  c9 36 dd	  cmp #$dd36
$09:b70a  23 dc		 and $dc,s
$09:b70c  23 fe		 and $fe,s
$09:b70e  00 ff		 brk #$ff
$09:b710  ff ff ff fe   sbc $feffff,x
$09:b714  ef ee dd dd   sbc $ddddee
$09:b718  dc dc fe	  jml [$fedc]
$09:b71b  fe ff ff	  inc $ffff,x
$09:b71e  ff ff 70 8f   sbc $8f70ff,x
$09:b722  20 5f b0	  jsr $b05f
$09:b725  ef 2c d3 4c   sbc $4cd32c
$09:b729  bb			tyx
$09:b72a  c4 3b		 cpy $3b
$09:b72c  84 7f		 sty $7f
$09:b72e  00 ff		 brk #$ff
$09:b730  bf bf 7f ff   lda $ff7fbf,x
$09:b734  e7 67		 sbc [$67]
$09:b736  9b			txy
$09:b737  9b			txy
$09:b738  3b			tsc
$09:b739  3b			tsc
$09:b73a  7f 7f ff ff   adc $ffff7f,x
$09:b73e  ff ff 06 ff   sbc $ff06ff,x
$09:b742  05 fa		 ora $fa
$09:b744  09 e6 13	  ora #$13e6
$09:b747  dd 21 ff	  cmp $ff21,x
$09:b74a  00 ff		 brk #$ff
$09:b74c  20 df 00	  jsr $00df
$09:b74f  ff ff ff fc   sbc $fcffff,x
$09:b753  fb			xce
$09:b754  fe f7 f7	  inc $f7f7,x
$09:b757  fd f5 ff	  sbc $fff5,x
$09:b75a  ed ff fe	  sbc $feff
$09:b75d  df ff ff 30   cmp $30ffff,x
$09:b761  ff c0 bf d0   sbc $d0bfc0,x
$09:b765  27 58		 and [$58]
$09:b767  2b			pld
$09:b768  4c 3f 80	  jmp $803f
$09:b76b  ff 00 ff 00   sbc $00ff00,x
$09:b76f  ff ff ff 1f   sbc $1fffff,x
$09:b773  7f 7f af af   adc $afaf7f,x
$09:b777  ff af ff b7   sbc $b7ffaf,x
$09:b77b  ff 7b ff ff   sbc $ffff7b,x
$09:b77f  ff 03 fc 04   sbc $04fc03,x
$09:b783  fb			xce
$09:b784  0b			phd
$09:b785  f5 13		 sbc $13,x
$09:b787  ed 23 dd	  sbc $dd23
$09:b78a  01 fe		 ora ($fe,x)
$09:b78c  00 ff		 brk #$ff
$09:b78e  00 ff		 brk #$ff
$09:b790  f8			sed
$09:b791  ff f0 ff e0   sbc $e0fff0,x
$09:b795  fe e8 fe	  inc $fee8,x
$09:b798  cc fe dc	  cpy $dcfe
$09:b79b  ff fe ff ff   sbc $fffffe,x
$09:b79f  ff c0 3f 20   sbc $203fc0,x
$09:b7a3  df d0 af c8   cmp $c8afd0,x
$09:b7a7  b7 c4		 lda [$c4],y
$09:b7a9  bb			tyx
$09:b7aa  80 7f		 bra $b82b
$09:b7ac  00 ff		 brk #$ff
$09:b7ae  00 ff		 brk #$ff
$09:b7b0  1f ff 0f ff   ora $ff0fff,x
$09:b7b4  07 7f		 ora [$7f]
$09:b7b6  17 7f		 ora [$7f],y
$09:b7b8  33 7f		 and ($7f,s),y
$09:b7ba  3b			tsc
$09:b7bb  ff 7f ff ff   sbc $ffff7f,x
$09:b7bf  ff 02 fd 11   sbc $11fd02,x
$09:b7c3  e2 00		 sep #$00
$09:b7c5  ff 23 c5 09   sbc $09c523,x
$09:b7c9  f7 01		 sbc [$01],y
$09:b7cb  cf 00 ff 00   cmp $00ff00
$09:b7cf  ff f8 ff fc   sbc $fcfff8,x
$09:b7d3  e3 f6		 sbc $f6,s
$09:b7d5  ff ff c4 ed   sbc $edc4ff,x
$09:b7d9  f6 fd		 inc $fd,x
$09:b7db  ce fe ff	  dec $fffe
$09:b7de  ff ff e0 5f   sbc $5fe0ff,x
$09:b7e2  d8			cld
$09:b7e3  07 08		 ora [$08]
$09:b7e5  d7 4c		 cmp [$4c],y
$09:b7e7  23 4c		 and $4c,s
$09:b7e9  73 c4		 adc ($c4,s),y
$09:b7eb  b3 80		 lda ($80,s),y
$09:b7ed  7f 00 ff 1f   adc $1fff00,x
$09:b7f1  bf 37 cf 6f   lda $6fcf37,x
$09:b7f5  d7 3b		 cmp [$3b],y
$09:b7f7  e7 27		 sbc [$27]
$09:b7f9  bb			tyx
$09:b7fa  bf 73 7f ff   lda $ff7f73,x
$09:b7fe  ff ff 00 ff   sbc $ff00ff,x
$09:b802  08			php
$09:b803  f6 04		 inc $04,x
$09:b805  f1 78		 sbc ($78),y
$09:b807  bb			tyx
$09:b808  3c bb 1c	  bit $1cbb,x
$09:b80b  cd 2e f3	  cmp $f32e
$09:b80e  3f df ff ff   and $ffffdf,x
$09:b812  fe ff f5	  inc $f5ff,x
$09:b815  ff 83 c7 93   sbc $93c783,x
$09:b819  d7 dd		 cmp [$dd],y
$09:b81b  ff fd dd ff   sbc $ffddfd,x
$09:b81f  c1 00		 cmp ($00,x)
$09:b821  ff 90 6f 40   sbc $406f90,x
$09:b825  8f 38 d9 3e   sta $3ed938
$09:b829  dd 7c b3	  cmp $b37c,x
$09:b82c  5c cf 6c 7f   jml $7f6ccf
$09:b830  ff ff 7f ff   sbc $ff7fff,x
$09:b834  af df f7 fd   lda $fdf7df
$09:b838  f7 ff		 sbc [$ff],y
$09:b83a  ef ff 9f b3   sbc $b39fff
$09:b83e  ff c3 00 ff   sbc $ff00c3,x
$09:b842  00 ff		 brk #$ff
$09:b844  01 fe		 ora ($fe,x)
$09:b846  06 f9		 asl $f9
$09:b848  1b			tcs
$09:b849  e7 28		 sbc [$28]
$09:b84b  d8			cld
$09:b84c  56 b0		 lsr $b0,x
$09:b84e  6f a0 ff ff   adc $ffffa0
$09:b852  ff ff fe fe   sbc $fefeff,x
$09:b856  f8			sed
$09:b857  f8			sed
$09:b858  e0 e0		 cpx #$e0
$09:b85a  c7 c0		 cmp [$c0]
$09:b85c  8f 80 9f 80   sta $809f80
$09:b860  00 ff		 brk #$ff
$09:b862  32 cd		 and ($cd)
$09:b864  88			dey
$09:b865  77 b4		 adc [$b4],y
$09:b867  db			stp
$09:b868  2a			rol a
$09:b869  f5 a4		 sbc $a4,x
$09:b86b  bb			tyx
$09:b86c  14 2b		 trb $2b
$09:b86e  54 7b ff	  mvn $ff,$7b
$09:b871  ff cd cd 13   sbc $13cdcd,x
$09:b875  13 03		 ora ($03,s),y
$09:b877  03 05		 ora $05,s
$09:b879  05 4b		 ora $4b
$09:b87b  0b			phd
$09:b87c  c3 03		 cmp $03,s
$09:b87e  83 03		 sta $03,s
$09:b880  00 ff		 brk #$ff
$09:b882  78			sei
$09:b883  83 7f		 sta $7f,s
$09:b885  80 7d		 bra $b904
$09:b887  81 7f		 sta ($7f,x)
$09:b889  80 3f		 bra $b8ca
$09:b88b  80 2f		 bra $b8bc
$09:b88d  c0 3f		 cpy #$3f
$09:b88f  d0 ff		 bne $b890
$09:b891  ff f3 8d fe   sbc $fe8df3,x
$09:b895  81 f9		 sta ($f9,x)
$09:b897  86 bf		 stx $bf
$09:b899  c0 ae		 cpy #$ae
$09:b89b  d1 ef		 cmp ($ef),y
$09:b89d  90 db		 bcc $b87a
$09:b89f  e4 00		 cpx $00
$09:b8a1  ff 00 ff 00   sbc $00ff00,x
$09:b8a5  77 08		 adc [$08],y
$09:b8a7  e3 80		 sbc $80,s
$09:b8a9  37 80		 and [$80],y
$09:b8ab  ff 80 7f c0   sbc $c07f80,x
$09:b8af  3f ff ff ff   and $ffffff,x
$09:b8b3  f7 77		 sbc [$77],y
$09:b8b5  bf eb d5 37   lda $37d5eb,x
$09:b8b9  df ff 77 7f   cmp $7f77ff,x
$09:b8bd  ff 3f ff 00   sbc $00ff3f,x
$09:b8c1  ff 03 fc 0c   sbc $0cfc03,x
$09:b8c5  f2 13		 sbc ($13)
$09:b8c7  ec 24 d3	  cpx $d324
$09:b8ca  28			plp
$09:b8cb  d7 50		 cmp [$50],y
$09:b8cd  af 50 8f ff   lda $ff8f50
$09:b8d1  ff ff fc ff   sbc $fffcff,x
$09:b8d5  f0 ff		 beq $b8d6
$09:b8d7  e0 ff		 cpx #$ff
$09:b8d9  c3 ff		 cmp $ff,s
$09:b8db  c7 ff		 cmp [$ff]
$09:b8dd  8f ff 8f 00   sta $008fff
$09:b8e1  ff c0 3f 30   sbc $303fc0,x
$09:b8e5  4f c8 37 24   eor $2437c8
$09:b8e9  cb			wai
$09:b8ea  14 eb		 trb $eb
$09:b8ec  0a			asl a
$09:b8ed  f5 0a		 sbc $0a,x
$09:b8ef  f1 ff		 sbc ($ff),y
$09:b8f1  ff ff 3f ff   sbc $ff3fff,x
$09:b8f5  0f ff 07 ff   ora $ff07ff
$09:b8f9  c3 ff		 cmp $ff,s
$09:b8fb  e3 ff		 sbc $ff,s
$09:b8fd  f1 ff		 sbc ($ff),y
$09:b8ff  f1 00		 sbc ($00),y
$09:b901  ff 08 ff 14   sbc $14ff08,x
$09:b905  f7 2a		 sbc [$2a],y
$09:b907  e3 5d		 sbc $5d,s
$09:b909  c1 5d		 cmp ($5d,x)
$09:b90b  c1 2a		 cmp ($2a,x)
$09:b90d  e3 14		 sbc $14,s
$09:b90f  f7 ff		 sbc [$ff],y
$09:b911  ff e3 ff c9   sbc $c9ffe3,x
$09:b915  f7 9c		 sbc [$9c],y
$09:b917  eb			xba
$09:b918  be d5 be	  ldx $bed5,y
$09:b91b  d5 9c		 cmp $9c,x
$09:b91d  eb			xba
$09:b91e  c9 f7 00	  cmp #$00f7
$09:b921  ff 00 ff 00   sbc $00ff00,x
$09:b925  ff 20 ff 50   sbc $50ff20,x
$09:b929  df a8 8f a8   cmp $a88fa8,x
$09:b92d  8f 50 df ff   sta $ffdf50
$09:b931  ff ff ff ff   sbc $ffffff,x
$09:b935  ff 8f ff 27   sbc $27ff8f,x
$09:b939  df 77 af 77   cmp $77af77,x
$09:b93d  af 27 df 00   lda $00df27
$09:b941  ff 00 ff 00   sbc $00ff00,x
$09:b945  ff 00 ff 00   sbc $00ff00,x
$09:b949  df 2f ef 10   cmp $10ef2f,x
$09:b94d  f0 29		 beq $b978
$09:b94f  f8			sed
$09:b950  ff ff ff ff   sbc $ffffff,x
$09:b954  ff ff ff ff   sbc $ffffff,x
$09:b958  ff df df cf   sbc $cfdfdf,x
$09:b95c  ef e7 e5 f6   sbc $f6e5e7
$09:b960  00 ff		 brk #$ff
$09:b962  00 ff		 brk #$ff
$09:b964  30 ff		 bmi $b965
$09:b966  0c 8f 48	  tsb $488f
$09:b969  cf 30 ff 80   cmp $80ff30
$09:b96d  ff 40 7f ff   sbc $ff7f40,x
$09:b971  ff ff ff ff   sbc $ffffff,x
$09:b975  ff eb bb ff   sbc $ffbbeb,x
$09:b979  ff ff ff ef   sbc $efffff,x
$09:b97d  ff ff ff 00   sbc $00ffff,x
$09:b981  ff 08 f7 04   sbc $04f708,x
$09:b985  fb			xce
$09:b986  14 eb		 trb $eb
$09:b988  1a			inc a
$09:b989  ed 0a fd	  sbc $fd0a
$09:b98c  2a			rol a
$09:b98d  dd 2c df	  cmp $df2c,x
$09:b990  ff ff f7 f7   sbc $f7f7ff,x
$09:b994  f3 f3		 sbc ($f3,s),y
$09:b996  e3 e3		 sbc $e3,s
$09:b998  e1 e1		 sbc ($e1,x)
$09:b99a  e1 e1		 sbc ($e1,x)
$09:b99c  c1 c1		 cmp ($c1,x)
$09:b99e  c1 c1		 cmp ($c1,x)
$09:b9a0  00 ff		 brk #$ff
$09:b9a2  00 ff		 brk #$ff
$09:b9a4  00 ff		 brk #$ff
$09:b9a6  40			rti
$09:b9a7  bf 00 ff a0   lda $a0ff00,x
$09:b9ab  5f a8 57 c4   eor $c457a8,x
$09:b9af  7b			tdc
$09:b9b0  ff ff ff ff   sbc $ffffff,x
$09:b9b4  ff ff bf bf   sbc $bfbfff,x
$09:b9b8  bf bf 1f 1f   lda $1f1fbf,x
$09:b9bc  17 17		 ora [$17],y
$09:b9be  13 13		 ora ($13,s),y
$09:b9c0  00 ff		 brk #$ff
$09:b9c2  00 ff		 brk #$ff
$09:b9c4  03 ff		 ora $ff,s
$09:b9c6  00 fb		 brk #$fb
$09:b9c8  00 f7		 brk #$f7
$09:b9ca  10 ef		 bpl $b9bb
$09:b9cc  10 ef		 bpl $b9bd
$09:b9ce  20 df ff	  jsr $ffdf
$09:b9d1  ff ff ff ff   sbc $ffffff,x
$09:b9d5  fc fb ff	  jsr ($fffb,x)
$09:b9d8  f7 fc		 sbc [$fc],y
$09:b9da  ef f8 ef f9   sbc $f9eff8
$09:b9de  ff d3 00 ff   sbc $ff00d3,x
$09:b9e2  e0 07		 cpx #$07
$09:b9e4  00 f3		 brk #$f3
$09:b9e6  0c ff 0c	  tsb $0cff
$09:b9e9  f7 18		 sbc [$18],y
$09:b9eb  e7 3c		 sbc [$3c]
$09:b9ed  c7 74		 cmp [$74]
$09:b9ef  83 ff		 sta $ff,s
$09:b9f1  ff 87 7f f3   sbc $f37f87,x
$09:b9f5  ff ff 03 ff   sbc $ff03ff,x
$09:b9f9  03 ff		 ora $ff,s
$09:b9fb  e3 f7		 sbc $f7,s
$09:b9fd  8b			phb
$09:b9fe  87 7b		 sta [$7b]
$09:ba00  3f f5 3f eb   and $eb3ff5,x
$09:ba04  38			sec
$09:ba05  df 3d f3 77   cmp $77f33d,x
$09:ba09  ed 69 95	  sbc $9569
$09:ba0c  70 9e		 bvs $b9ac
$09:ba0e  00 ff		 brk #$ff
$09:ba10  ff c1 fe c0   sbc $c0fec1,x
$09:ba14  ff c3 ff c3   sbc $c3ffc3,x
$09:ba18  fd 83 fd	  sbc $fd83,x
$09:ba1b  87 fe		 sta [$fe]
$09:ba1d  8f ff ff f4   sta $f4ffff
$09:ba21  cf e8 f7 14   cmp $14f7e8
$09:ba25  cb			wai
$09:ba26  d6 ab		 dec $ab,x
$09:ba28  9a			txs
$09:ba29  a5 cc		 lda $cc
$09:ba2b  b3 06		 lda ($06,s),y
$09:ba2d  79 00 ff	  adc $ff00,y
$09:ba30  7f c3 bf 83   adc $83bfc3,x
$09:ba34  df e3 7f e1   cmp $e17fe3,x
$09:ba38  7f a1 ff f1   adc $f1ffa1,x
$09:ba3c  7f f9 ff ff   adc $fffff9,x
$09:ba40  2f e0 26 e0   and $e026e0
$09:ba44  20 e0 30	  jsr $30e0
$09:ba47  f0 5f		 beq $baa8
$09:ba49  bf 0e ff 10   lda $10ff0e,x
$09:ba4d  ef 00 ff 9f   sbc $9fff00
$09:ba51  80 9f		 bra $b9f2
$09:ba53  80 9f		 bra $b9f4
$09:ba55  80 8f		 bra $b9e6
$09:ba57  80 80		 bra $b9d9
$09:ba59  80 c0		 bra $ba1b
$09:ba5b  c0 e0		 cpy #$e0
$09:ba5d  e0 ff		 cpx #$ff
$09:ba5f  ff 28 37 28   sbc $283728,x
$09:ba63  37 50		 and [$50],y
$09:ba65  6f d0 ef a0   adc $a0efd0
$09:ba69  df 20 df 80   cmp $80df20,x
$09:ba6d  7f 00 ff c7   adc $c7ff00,x
$09:ba71  07 c7		 ora [$c7]
$09:ba73  07 8f		 ora [$8f]
$09:ba75  0f 0f 0f 1f   ora $1f0f0f
$09:ba79  1f 1f 1f 7f   ora $7f1f1f,x
$09:ba7d  7f ff ff 0f   adc $0fffff,x
$09:ba81  d4 00		 pei ($00)
$09:ba83  f6 00		 inc $00,x
$09:ba85  ff 02 ff 00   sbc $00ff02,x
$09:ba89  ff 04 ff 01   sbc $01ff04,x
$09:ba8d  ff 00 ff d4   sbc $d4ff00,x
$09:ba91  fb			xce
$09:ba92  f6 df		 inc $df,x
$09:ba94  ff f5 ff d8   sbc $d8fff5,x
$09:ba98  ff ed ff f3   sbc $f3ffed,x
$09:ba9c  ff fc ff ff   sbc $fffffc,x
$09:baa0  e4 1f		 cpx $1f
$09:baa2  ee 0b 34	  inc $340b
$09:baa5  8f 10 c7 20   sta $20c710
$09:baa9  e7 60		 sbc [$60]
$09:baab  ef 00 1f 00   sbc $001f00
$09:baaf  ff 9f 7b 0b   sbc $0b7b9f,x
$09:bab3  f5 8f		 sbc $8f,x
$09:bab5  7b			tdc
$09:bab6  c7 bf		 cmp [$bf]
$09:bab8  e7 9f		 sbc [$9f]
$09:baba  ef 1f 1f ff   sbc $ff1f1f
$09:babe  ff ff 50 8f   sbc $8f50ff,x
$09:bac2  50 af		 bvc $ba73
$09:bac4  28			plp
$09:bac5  d7 24		 cmp [$24],y
$09:bac7  d3 13		 cmp ($13,s),y
$09:bac9  ec 0c f2	  cpx $f20c
$09:bacc  03 fc		 ora $fc,s
$09:bace  00 ff		 brk #$ff
$09:bad0  ff 8f ff 8f   sbc $8fff8f,x
$09:bad4  ff c7 ff c3   sbc $c3ffc7,x
$09:bad8  ff e0 ff f0   sbc $f0ffe0,x
$09:badc  ff fc ff ff   sbc $fffffc,x
$09:bae0  0a			asl a
$09:bae1  f1 0a		 sbc ($0a),y
$09:bae3  f5 14		 sbc $14,x
$09:bae5  eb			xba
$09:bae6  24 cb		 bit $cb
$09:bae8  c8			iny
$09:bae9  37 30		 and [$30],y
$09:baeb  4f c0 3f 00   eor $003fc0
$09:baef  ff ff f1 ff   sbc $fff1ff,x
$09:baf3  f1 ff		 sbc ($ff),y
$09:baf5  e3 ff		 sbc $ff,s
$09:baf7  c3 ff		 cmp $ff,s
$09:baf9  07 ff		 ora [$ff]
$09:bafb  0f ff 3f ff   ora $ff3fff
$09:baff  ff 08 ff 00   sbc $00ff08,x
$09:bb03  ff 00 ff 00   sbc $00ff00,x
$09:bb07  ff 00 ff 00   sbc $00ff00,x
$09:bb0b  ff 00 ff 00   sbc $00ff00,x
$09:bb0f  ff e3 ff ff   sbc $ffffe3,x
$09:bb13  ff ff ff ff   sbc $ffffff,x
$09:bb17  ff ff ff ff   sbc $ffffff,x
$09:bb1b  ff ff ff ff   sbc $ffffff,x
$09:bb1f  ff 20 ff 18   sbc $18ff20,x
$09:bb23  ff 2c e7 04   sbc $04e72c,x
$09:bb27  e7 08		 sbc [$08]
$09:bb29  ff 80 bf 40   sbc $40bf80,x
$09:bb2d  ff 00 ff 8f   sbc $8fff00,x
$09:bb31  ff e7 ff db   sbc $dbffe7,x
$09:bb35  ef db e7 e7   sbc $e7e7db
$09:bb39  ff 7f bf 3f   sbc $3fbf7f,x
$09:bb3d  ff ff ff 30   sbc $30ffff,x
$09:bb41  f0 38		 beq $bb7b
$09:bb43  f8			sed
$09:bb44  1f ff 0f ff   ora $ff0fff,x
$09:bb48  00 ff		 brk #$ff
$09:bb4a  08			php
$09:bb4b  ff 00 ff 00   sbc $00ff00,x
$09:bb4f  ff fc ff ff   sbc $fffffc,x
$09:bb53  ff ff ff ff   sbc $ffffff,x
$09:bb57  ff f3 ff f7   sbc $f7fff3,x
$09:bb5b  f7 ff		 sbc [$ff],y
$09:bb5d  ff ff ff 40   sbc $40ffff,x
$09:bb61  7f e0 ef 80   adc $80efe0,x
$09:bb65  ff 00 ff 00   sbc $00ff00,x
$09:bb69  ff 00 ff 00   sbc $00ff00,x
$09:bb6d  ff 00 ff ff   sbc $ffff00,x
$09:bb71  ff df cf bf   sbc $bfcfdf,x
$09:bb75  ff ff ff ff   sbc $ffffff,x
$09:bb79  ff ff ff ff   sbc $ffffff,x
$09:bb7d  ff ff ff 3d   sbc $3dffff,x
$09:bb81  de 54 b7	  dec $b754,x
$09:bb84  54 b7 52	  mvn $52,$b7
$09:bb87  b3 52		 lda ($52,s),y
$09:bb89  b3 2d		 lda ($2d,s),y
$09:bb8b  de 12 ed	  dec $ed12,x
$09:bb8e  00 ff		 brk #$ff
$09:bb90  c0 c0		 cpy #$c0
$09:bb92  88			dey
$09:bb93  80 88		 bra $bb1d
$09:bb95  80 8c		 bra $bb23
$09:bb97  80 8c		 bra $bb25
$09:bb99  80 c0		 bra $bb5b
$09:bb9b  c0 e1		 cpy #$e1
$09:bb9d  e1 ff		 sbc ($ff,x)
$09:bb9f  ff 74 cb d6   sbc $d6cb74,x
$09:bba3  69 0a bd	  adc #$bd0a
$09:bba6  3a			dec a
$09:bba7  ad d4 6b	  lda $6bd4
$09:bbaa  a0 5f		 ldy #$5f
$09:bbac  00 ff		 brk #$ff
$09:bbae  00 ff		 brk #$ff
$09:bbb0  03 03		 ora $03,s
$09:bbb2  01 01		 ora ($01,x)
$09:bbb4  41 01		 eor ($01,x)
$09:bbb6  41 01		 eor ($01,x)
$09:bbb8  03 03		 ora $03,s
$09:bbba  1f 1f ff ff   ora $ffff1f,x
$09:bbbe  ff ff 21 de   sbc $de21ff,x
$09:bbc2  38			sec
$09:bbc3  d8			cld
$09:bbc4  0d fd 00	  ora $00fd
$09:bbc7  ff 30 ff 39   sbc $39ff30,x
$09:bbcb  ff 08 ff 00   sbc $00ff08,x
$09:bbcf  ff fe d3 f8   sbc $f8d3fe,x
$09:bbd3  c7 fd		 cmp [$fd]
$09:bbd5  e2 ff		 sep #$ff
$09:bbd7  ff cf ff 84   sbc $84ffcf,x
$09:bbdb  ff 80 ff ff   sbc $ffff80,x
$09:bbdf  ff dc 13 58   sbc $5813dc,x
$09:bbe3  63 04		 adc $04,s
$09:bbe5  c7 e8		 cmp [$e8]
$09:bbe7  fb			xce
$09:bbe8  14 f7		 trb $f7
$09:bbea  08			php
$09:bbeb  ff 90 ff 00   sbc $00ff90,x
$09:bbef  ff 1b e7 63   sbc $63e71b,x
$09:bbf3  9f c7 3b fb   sta $fb3bc7,x
$09:bbf7  07 f7		 ora [$f7]
$09:bbf9  eb			xba
$09:bbfa  ff e7 3f cf   sbc $cf3fe7,x
$09:bbfe  ff ff 00 ff   sbc $ff00ff,x
$09:bc02  60			rts
$09:bc03  9e 74 87	  stz $8774,x
$09:bc06  39 cf 1a	  and $1acf,y
$09:bc09  d2 27		 cmp ($27)
$09:bc0b  f0 0f		 beq $bc1c
$09:bc0d  f8			sed
$09:bc0e  17 b0		 ora [$b0],y
$09:bc10  ff ff ff be   sbc $beffff,x
$09:bc14  fb			xce
$09:bc15  d3 f6		 cmp ($f6,s),y
$09:bc17  f6 ed		 inc $ed,x
$09:bc19  c8			iny
$09:bc1a  df d3 f7 f4   cmp $f4f7d3,x
$09:bc1e  ef a4 00 ff   sbc $ff00a4
$09:bc22  d0 1f		 bne $bc43
$09:bc24  e8			inx
$09:bc25  0f f4 07 d2   ora $d207f4
$09:bc29  1f 54 6b aa   ora $aa6b54,x
$09:bc2d  35 20		 and $20,x
$09:bc2f  5f ff ff ef   eor $efffff,x
$09:bc33  cf f3 23 f9   cmp $f923f3
$09:bc37  91 e1		 sta ($e1),y
$09:bc39  41 89		 eor ($89,x)
$09:bc3b  09 c5		 ora #$c5
$09:bc3d  85 9f		 sta $9f
$09:bc3f  1f ff 00 f3   ora $f300ff,x
$09:bc43  08			php
$09:bc44  e7 10		 sbc [$10]
$09:bc46  ef 00 ff 18   sbc $18ff00
$09:bc4a  e6 18		 inc $18
$09:bc4c  e9 00		 sbc #$00
$09:bc4e  ff 2f 00 00   sbc $00002f,x
$09:bc52  07 00		 ora [$00]
$09:bc54  0f 00 1c 03   ora $031c00
$09:bc58  00 07		 brk #$07
$09:bc5a  00 07		 brk #$07
$09:bc5c  19 06 1f	  ora $1f06,y
$09:bc5f  0f ff 00 f3   ora $f300ff
$09:bc63  04 dd		 tsb $dd
$09:bc65  1a			inc a
$09:bc66  e7 0a		 sbc [$0a]
$09:bc68  fd f6 07	  sbc $07f6,x
$09:bc6b  fc e3 0c	  jsr ($0ce3,x)
$09:bc6e  eb			xba
$09:bc6f  cc 00 00	  cpy $0000
$09:bc72  f8			sed
$09:bc73  00 e0		 brk #$e0
$09:bc75  00 f0		 brk #$f0
$09:bc77  00 00		 brk #$00
$09:bc79  00 00		 brk #$00
$09:bc7b  00 f0		 brk #$f0
$09:bc7d  00 f0		 brk #$f0
$09:bc7f  c0 ff		 cpy #$ff
$09:bc81  00 fd		 brk #$fd
$09:bc83  00 f3		 brk #$f3
$09:bc85  01 e2		 ora ($e2,x)
$09:bc87  02 ec		 cop #$ec
$09:bc89  0c e5 05	  tsb $05e5
$09:bc8c  ee 0e e5	  inc $e50e
$09:bc8f  06 00		 asl $00
$09:bc91  00 02		 brk #$02
$09:bc93  03 09		 ora $09,s
$09:bc95  0e 16 1d	  asl $1d16
$09:bc98  05 1b		 ora $1b
$09:bc9a  0b			phd
$09:bc9b  1e 07 19	  asl $1907,x
$09:bc9e  08			php
$09:bc9f  1e ff 00	  asl $00ff,x
$09:bca2  df 00 e7 c0   cmp $c0e700,x
$09:bca6  23 20		 and $20,s
$09:bca8  1b			tcs
$09:bca9  18			clc
$09:bcaa  d3 d0		 cmp ($d0,s),y
$09:bcac  bb			tyx
$09:bcad  b8			clv
$09:bcae  d3 30		 cmp ($30,s),y
$09:bcb0  00 00		 brk #$00
$09:bcb2  20 e0 c8	  jsr $c8e0
$09:bcb5  38			sec
$09:bcb6  34 dc		 bit $dc,x
$09:bcb8  d0 ec		 bne $bca6
$09:bcba  e8			inx
$09:bcbb  3c 70 cc	  bit $cc70,x
$09:bcbe  08			php
$09:bcbf  3c ff 00	  bit $00ff,x
$09:bcc2  ff 00 f0 10   sbc $10f000,x
$09:bcc6  f7 07		 sbc [$07],y
$09:bcc8  f5 00		 sbc $00,x
$09:bcca  f0 00		 beq $bccc
$09:bccc  ff 00 ff 00   sbc $00ff00,x
$09:bcd0  00 00		 brk #$00
$09:bcd2  00 1f		 brk #$1f
$09:bcd4  10 0f		 bpl $bce5
$09:bcd6  07 08		 ora [$08]
$09:bcd8  02 0a		 cop #$0a
$09:bcda  00 0f		 brk #$0f
$09:bcdc  00 0a		 brk #$0a
$09:bcde  00 0f		 brk #$0f
$09:bce0  ff 00 ff 08   sbc $08ff00,x
$09:bce4  03 00		 ora $00,s
$09:bce6  ff fc 4b 00   sbc $004bfc,x
$09:bcea  03 00		 ora $00,s
$09:bcec  73 00		 adc ($00,s),y
$09:bcee  fb			xce
$09:bcef  00 00		 brk #$00
$09:bcf1  00 08		 brk #$08
$09:bcf3  f0 04		 beq $bcf9
$09:bcf5  fc fc 00	  jsr ($00fc,x)
$09:bcf8  20 b4 00	  jsr $00b4
$09:bcfb  fc 80 ac	  jsr ($ac80,x)
$09:bcfe  00 fc		 brk #$fc
$09:bd00  ff 00 ff 00   sbc $00ff00,x
$09:bd04  ff 00 ff 38   sbc $38ff00,x
$09:bd08  de 0d fe	  dec $fe0d,x
$09:bd0b  1c ef 06	  trb $06ef
$09:bd0e  fe 00 00	  inc $0000,x
$09:bd11  00 00		 brk #$00
$09:bd13  00 00		 brk #$00
$09:bd15  00 7c		 brk #$7c
$09:bd17  7c 3c 3c	  jmp ($3c3c,x)
$09:bd1a  3d 3c 1e	  and $1e3c,x
$09:bd1d  1e 00 01	  asl $0100,x
$09:bd20  ff 00 9d 24   sbc $249d00,x
$09:bd24  f7 56		 sbc [$56],y
$09:bd26  1f c8 3b 98   ora $983bc8,x
$09:bd2a  6d 66 eb	  adc $eb66
$09:bd2d  2a			rol a
$09:bd2e  9f 10 00 00   sta $000010,x
$09:bd32  42 00		 wdm #$00
$09:bd34  2c 04 3c	  bit $3c04
$09:bd37  08			php
$09:bd38  7c 18 9c	  jmp ($9c18,x)
$09:bd3b  04 14		 tsb $14
$09:bd3d  00 20		 brk #$20
$09:bd3f  c0 ff		 cpy #$ff
$09:bd41  00 ff		 brk #$ff
$09:bd43  00 ff		 brk #$ff
$09:bd45  00 fd		 brk #$fd
$09:bd47  03 fa		 ora $fa,s
$09:bd49  04 f0		 tsb $f0
$09:bd4b  0d fd 16	  ora $16fd
$09:bd4e  df 18 00 00   cmp $000018,x
$09:bd52  00 00		 brk #$00
$09:bd54  00 00		 brk #$00
$09:bd56  00 00		 brk #$00
$09:bd58  03 00		 ora $00,s
$09:bd5a  0a			asl a
$09:bd5b  00 14		 brk #$14
$09:bd5d  00 38		 brk #$38
$09:bd5f  30 ff		 bmi $bd60
$09:bd61  00 b9		 brk #$b9
$09:bd63  64 b3		 stz $b3
$09:bd65  8a			txa
$09:bd66  27 54		 and [$54]
$09:bd68  6f 88 c7 08   adc $08c788
$09:bd6c  af 10 7f 20   lda $207f10
$09:bd70  00 00		 brk #$00
$09:bd72  02 00		 cop #$00
$09:bd74  44 00 88	  mvp $88,$00
$09:bd77  00 10		 brk #$10
$09:bd79  00 30		 brk #$30
$09:bd7b  00 60		 brk #$60
$09:bd7d  00 c0		 brk #$c0
$09:bd7f  00 ff		 brk #$ff
$09:bd81  00 ff		 brk #$ff
$09:bd83  00 ff		 brk #$ff
$09:bd85  00 ff		 brk #$ff
$09:bd87  00 f3		 brk #$f3
$09:bd89  01 f1		 ora ($f1,x)
$09:bd8b  08			php
$09:bd8c  ea			nop
$09:bd8d  1e d7 47	  asl $47d7,x
$09:bd90  00 00		 brk #$00
$09:bd92  00 00		 brk #$00
$09:bd94  00 00		 brk #$00
$09:bd96  00 00		 brk #$00
$09:bd98  0e 0f 07	  asl $070f
$09:bd9b  0f 01 1f 38   ora $381f01
$09:bd9f  7f ff 00 f3   adc $f300ff,x
$09:bda3  00 f7		 brk #$f7
$09:bda5  04 ef		 tsb $ef
$09:bda7  08			php
$09:bda8  6f b0 5f 60   adc $605fb0
$09:bdac  af d0 27 88   lda $8827d0
$09:bdb0  00 00		 brk #$00
$09:bdb2  0c 0c 08	  tsb $080c
$09:bdb5  0c 10 18	  tsb $1810
$09:bdb8  00 b0		 brk #$b0
$09:bdba  80 e0		 bra $bd9c
$09:bdbc  20 f0 70	  jsr $70f0
$09:bdbf  f8			sed
$09:bdc0  ff 00 ff 00   sbc $00ff00,x
$09:bdc4  f3 14		 sbc ($14,s),y
$09:bdc6  e9 22		 sbc #$22
$09:bdc8  eb			xba
$09:bdc9  2a			rol a
$09:bdca  ff 22 ec 33   sbc $33ec22,x
$09:bdce  f7 19		 sbc [$19],y
$09:bdd0  00 00		 brk #$00
$09:bdd2  00 00		 brk #$00
$09:bdd4  08			php
$09:bdd5  00 1c		 brk #$1c
$09:bdd7  00 14		 brk #$14
$09:bdd9  00 00		 brk #$00
$09:bddb  00 00		 brk #$00
$09:bddd  00 00		 brk #$00
$09:bddf  00 ff		 brk #$ff
$09:bde1  00 ff		 brk #$ff
$09:bde3  00 d7		 brk #$d7
$09:bde5  30 ab		 bmi $bd92
$09:bde7  60			rts
$09:bde8  ab			plb
$09:bde9  68			pla
$09:bdea  9b			txy
$09:bdeb  60			rts
$09:bdec  37 4c		 and [$4c],y
$09:bdee  ef 18 00 00   sbc $000018
$09:bdf2  00 00		 brk #$00
$09:bdf4  08			php
$09:bdf5  00 1c		 brk #$1c
$09:bdf7  00 14		 brk #$14
$09:bdf9  00 04		 brk #$04
$09:bdfb  00 80		 brk #$80
$09:bdfd  00 80		 brk #$80
$09:bdff  00 7a		 brk #$7a
$09:be01  80 3c		 bra $be3f
$09:be03  85 33		 sta $33
$09:be05  86 5c		 stx $5c
$09:be07  cb			wai
$09:be08  22 ed 14 fb   jsl $fb14ed
$09:be0c  0a			asl a
$09:be0d  fd 00 ff	  sbc $ff00,x
$09:be10  ff c2 fa 88   sbc $88fac2,x
$09:be14  f8			sed
$09:be15  a0 b1		 ldy #$b1
$09:be17  91 d5		 sta ($d5),y
$09:be19  c5 c3		 cmp $c3
$09:be1b  c3 e1		 cmp $e1,s
$09:be1d  e1 ff		 sbc ($ff,x)
$09:be1f  ff 60 5f d0   sbc $d05f60,x
$09:be23  ef a0 7f 48   sbc $487fa0
$09:be27  b7 14		 lda [$14],y
$09:be29  eb			xba
$09:be2a  0c f3 02	  tsb $02f3
$09:be2d  fd 00 ff	  sbc $ff00,x
$09:be30  9f 1f 0f 0f   sta $0f0f1f,x
$09:be34  0f 0f 87 87   ora $87870f
$09:be38  e3 e3		 sbc $e3,s
$09:be3a  f3 f3		 sbc ($f3,s),y
$09:be3c  fd fd ff	  sbc $fffd,x
$09:be3f  ff df 09 ff   sbc $ff09df,x
$09:be43  5f bf 10 bf   eor $bf10bf,x
$09:be47  1f df 54 af   ora $af54df,x
$09:be4b  6f df 3f ff   adc $ff3fdf
$09:be4f  00 39		 brk #$39
$09:be51  09 3f		 ora #$3f
$09:be53  1f 70 10 7f   ora $7f1070,x
$09:be57  1f 34 00 1f   ora $1f0034,x
$09:be5b  00 00		 brk #$00
$09:be5d  00 00		 brk #$00
$09:be5f  00 f5		 brk #$f5
$09:be61  5e f5 9e	  lsr $9ef5,x
$09:be64  d3 9e		 cmp ($9e,s),y
$09:be66  e3 be		 sbc $be,s
$09:be68  a3 be		 lda $be,s
$09:be6a  a1 be		 lda ($be,x)
$09:be6c  f3 fc		 sbc ($fc,s),y
$09:be6e  ff 00 60 40   sbc $406000,x
$09:be72  e0 80		 cpx #$80
$09:be74  e0 80		 cpx #$80
$09:be76  c0 80		 cpy #$80
$09:be78  c0 00		 cpy #$00
$09:be7a  c0 00		 cpy #$00
$09:be7c  00 00		 brk #$00
$09:be7e  00 00		 brk #$00
$09:be80  eb			xba
$09:be81  04 e5		 tsb $e5
$09:be83  00 eb		 brk #$eb
$09:be85  02 f5		 cop #$f5
$09:be87  01 bb		 ora ($bb,x)
$09:be89  02 de		 cop #$de
$09:be8b  10 f7		 bpl $be84
$09:be8d  10 ff		 bpl $be8e
$09:be8f  00 10		 brk #$10
$09:be91  1c 08 1e	  trb $1e08
$09:be94  16 1d		 asl $1d,x
$09:be96  09 0e		 ora #$0e
$09:be98  06 45		 asl $45
$09:be9a  11 21		 ora ($21),y
$09:be9c  10 0f		 bpl $bead
$09:be9e  00 00		 brk #$00
$09:bea0  e3 10		 sbc $10,s
$09:bea2  d3 00		 cmp ($00,s),y
$09:bea4  e3 20		 sbc $20,s
$09:bea6  d7 c4		 cmp [$c4],y
$09:bea8  e3 20		 sbc $20,s
$09:beaa  77 40		 adc [$40],y
$09:beac  ff 20 ff 00   sbc $00ff20,x
$09:beb0  04 1c		 tsb $1c
$09:beb2  08			php
$09:beb3  3c 34 dc	  bit $dc34,x
$09:beb6  cc 38 34	  cpy $3438
$09:beb9  dc c8 b8	  jml [$b8c8]
$09:bebc  20 c0 00	  jsr $00c0
$09:bebf  00 eb		 brk #$eb
$09:bec1  00 e7		 brk #$e7
$09:bec3  00 dd		 brk #$dd
$09:bec5  01 9f		 ora ($9f,x)
$09:bec7  03 fc		 ora $fc,s
$09:bec9  01 ff		 ora ($ff,x)
$09:becb  01 ff		 ora ($ff,x)
$09:becd  03 ff		 ora $ff,s
$09:becf  00 14		 brk #$14
$09:bed1  1c 00 1f	  trb $1f00
$09:bed4  20 32 42	  jsr $4232
$09:bed7  7c 00 7e	  jmp ($7e00,x)
$09:beda  00 00		 brk #$00
$09:bedc  00 00		 brk #$00
$09:bede  00 00		 brk #$00
$09:bee0  ff 84 d3 c0   sbc $c0d384,x
$09:bee4  27 e0		 and [$e0]
$09:bee6  27 e0		 and [$e0]
$09:bee8  cf e0 3f c0   cmp $c03fe0
$09:beec  ff 40 ff 00   sbc $00ff40,x
$09:bef0  84 28		 sty $28
$09:bef2  24 3c		 bit $3c
$09:bef4  d0 18		 bne $bf0e
$09:bef6  d8			cld
$09:bef7  18			clc
$09:bef8  10 10		 bpl $bf0a
$09:befa  00 00		 brk #$00
$09:befc  00 00		 brk #$00
$09:befe  00 00		 brk #$00
$09:bf00  fe 02 fa	  inc $fa02,x
$09:bf03  00 f9		 brk #$f9
$09:bf05  0a			asl a
$09:bf06  eb			xba
$09:bf07  00 e7		 brk #$e7
$09:bf09  28			plp
$09:bf0a  af 00 9f 20   lda $209f00
$09:bf0e  ff 00 01 00   sbc $000100,x
$09:bf12  00 07		 brk #$07
$09:bf14  04 00		 tsb $00
$09:bf16  00 1c		 brk #$1c
$09:bf18  10 00		 bpl $bf1a
$09:bf1a  00 70		 brk #$70
$09:bf1c  40			rti
$09:bf1d  00 00		 brk #$00
$09:bf1f  00 5f		 brk #$5f
$09:bf21  80 ff		 bra $bf22
$09:bf23  40			rti
$09:bf24  ff 70 ff 38   sbc $38ff70,x
$09:bf28  bf 28 ef 08   lda $08ef28,x
$09:bf2c  ff 00 ff 00   sbc $00ff00,x
$09:bf30  20 00 40	  jsr $4000
$09:bf33  40			rti
$09:bf34  78			sei
$09:bf35  78			sei
$09:bf36  78			sei
$09:bf37  78			sei
$09:bf38  78			sei
$09:bf39  78			sei
$09:bf3a  38			sec
$09:bf3b  38			sec
$09:bf3c  08			php
$09:bf3d  08			php
$09:bf3e  00 00		 brk #$00
$09:bf40  ff 11 fc 03   sbc $03fc11,x
$09:bf44  ff 06 ff 0e   sbc $0eff06,x
$09:bf48  ff 04 f7 00   sbc $00f704,x
$09:bf4c  ff 00 ff 00   sbc $00ff00,x
$09:bf50  21 30		 and ($30,x)
$09:bf52  03 00		 ora $00,s
$09:bf54  06 06		 asl $06
$09:bf56  0e 06 04	  asl $0406
$09:bf59  18			clc
$09:bf5a  00 38		 brk #$38
$09:bf5c  00 00		 brk #$00
$09:bf5e  00 00		 brk #$00
$09:bf60  5f e0 bf c0   eor $c0bfe0,x
$09:bf64  7f 80 ff 00   adc $00ff80,x
$09:bf68  ff 00 ff 00   sbc $00ff00,x
$09:bf6c  ff 00 ff 00   sbc $00ff00,x
$09:bf70  00 00		 brk #$00
$09:bf72  80 00		 bra $bf74
$09:bf74  80 00		 bra $bf76
$09:bf76  00 00		 brk #$00
$09:bf78  00 00		 brk #$00
$09:bf7a  00 00		 brk #$00
$09:bf7c  00 00		 brk #$00
$09:bf7e  00 00		 brk #$00
$09:bf80  a4 61		 ldy $61
$09:bf82  da			phx
$09:bf83  3a			dec a
$09:bf84  b6 06		 ldx $06,y
$09:bf86  cb			wai
$09:bf87  49 fa		 eor #$fa
$09:bf89  10 f7		 bpl $bf82
$09:bf8b  24 ff		 bit $ff
$09:bf8d  08			php
$09:bf8e  ff 00 1e 7f   sbc $7f1e00,x
$09:bf92  05 3f		 ora $3f
$09:bf94  79 7f 36	  adc $367f,y
$09:bf97  7f 0f 1f 1b   adc $1b1f0f,x
$09:bf9b  3f 31 39 00   and $003931,x
$09:bf9f  00 df		 brk #$df
$09:bfa1  c8			iny
$09:bfa2  bf 20 ef 30   lda $30ef20,x
$09:bfa6  5f 10 3f 90   eor $903f10,x
$09:bfaa  df 00 ff 00   cmp $00ff00,x
$09:bfae  ff 00 30 f8   sbc $f83000,x
$09:bfb2  d8			cld
$09:bfb3  f8			sed
$09:bfb4  c8			iny
$09:bfb5  f8			sed
$09:bfb6  e0 f0		 cpx #$f0
$09:bfb8  60			rts
$09:bfb9  f0 20		 beq $bfdb
$09:bfbb  20 00 00	  jsr $0000
$09:bfbe  00 00		 brk #$00
$09:bfc0  f4 0f ce	  pea $ce0f
$09:bfc3  31 bd		 and ($bd),y
$09:bfc5  7e ff 18	  ror $18ff,x
$09:bfc8  ff 10 ef 10   sbc $10ef10,x
$09:bfcc  ff 00 ff 00   sbc $00ff00,x
$09:bfd0  00 00		 brk #$00
$09:bfd2  00 00		 brk #$00
$09:bfd4  00 00		 brk #$00
$09:bfd6  00 00		 brk #$00
$09:bfd8  00 00		 brk #$00
$09:bfda  00 00		 brk #$00
$09:bfdc  00 00		 brk #$00
$09:bfde  00 00		 brk #$00
$09:bfe0  cf b0 73 84   cmp $8473b0
$09:bfe4  a5 66		 lda $66
$09:bfe6  ef 08 ff 08   sbc $08ff08
$09:bfea  f7 08		 sbc [$08],y
$09:bfec  ff 00 ff 00   sbc $00ff00,x
$09:bff0  00 00		 brk #$00
$09:bff2  08			php
$09:bff3  00 18		 brk #$18
$09:bff5  00 10		 brk #$10
$09:bff7  00 00		 brk #$00
$09:bff9  00 00		 brk #$00
$09:bffb  00 00		 brk #$00
$09:bffd  00 00		 brk #$00
$09:bfff  00 ff		 brk #$ff
$09:c001  00 ff		 brk #$ff
$09:c003  00 fe		 brk #$fe
$09:c005  01 ff		 ora ($ff,x)
$09:c007  00 f7		 brk #$f7
$09:c009  0f f3 10 e4   ora $e410f3
$09:c00d  23 8b		 and $8b,s
$09:c00f  47 00		 eor [$00]
$09:c011  00 00		 brk #$00
$09:c013  00 01		 brk #$01
$09:c015  01 00		 ora ($00,x)
$09:c017  00 00		 brk #$00
$09:c019  00 0f		 brk #$0f
$09:c01b  00 1f		 brk #$1f
$09:c01d  00 3f		 brk #$3f
$09:c01f  03 ff		 ora $ff,s
$09:c021  00 77		 brk #$77
$09:c023  88			dey
$09:c024  bf c8 7f 88   lda $887fc8,x
$09:c028  5d be 7f	  eor $7fbe,x
$09:c02b  48			pha
$09:c02c  bf 28 47 98   lda $984728,x
$09:c030  00 00		 brk #$00
$09:c032  88			dey
$09:c033  88			dey
$09:c034  c8			iny
$09:c035  c8			iny
$09:c036  9c 9c 3e	  stz $3e9c
$09:c039  3e 9c 1c	  rol $1c9c,x
$09:c03c  c8			iny
$09:c03d  08			php
$09:c03e  e8			inx
$09:c03f  08			php
$09:c040  ff 00 fe 01   sbc $01fe00,x
$09:c044  ff 01 fc 02   sbc $02fc01,x
$09:c048  ff 02 f8 05   sbc $05f802,x
$09:c04c  fc 05 f6	  jsr ($f605,x)
$09:c04f  0d 00 00	  ora $0000
$09:c052  00 00		 brk #$00
$09:c054  00 00		 brk #$00
$09:c056  01 00		 ora ($00,x)
$09:c058  01 00		 ora ($00,x)
$09:c05a  03 00		 ora $00,s
$09:c05c  03 00		 ora $00,s
$09:c05e  03 00		 ora $00,s
$09:c060  ff 00 ff 00   sbc $00ff00,x
$09:c064  ff 00 7f 80   sbc $807f00,x
$09:c068  7f 00 b7 48   adc $48b700,x
$09:c06c  ab			plb
$09:c06d  1c 17 a8	  trb $a817
$09:c070  00 00		 brk #$00
$09:c072  00 00		 brk #$00
$09:c074  00 00		 brk #$00
$09:c076  00 00		 brk #$00
$09:c078  88			dey
$09:c079  00 88		 brk #$88
$09:c07b  00 dc		 brk #$dc
$09:c07d  08			php
$09:c07e  c8			iny
$09:c07f  00 ff		 brk #$ff
$09:c081  00 ff		 brk #$ff
$09:c083  00 ff		 brk #$ff
$09:c085  00 f0		 brk #$f0
$09:c087  00 f6		 brk #$f6
$09:c089  06 fa		 asl $fa
$09:c08b  18			clc
$09:c08c  f6 10		 inc $10,x
$09:c08e  c3 1d		 cmp $1d,s
$09:c090  00 00		 brk #$00
$09:c092  00 00		 brk #$00
$09:c094  00 00		 brk #$00
$09:c096  09 0f		 ora #$0f
$09:c098  06 09		 asl $09
$09:c09a  1c 05 18	  trb $1805
$09:c09d  09 21		 ora #$21
$09:c09f  20 ff 00	  jsr $00ff
$09:c0a2  ff 00 ff 00   sbc $00ff00,x
$09:c0a6  87 00		 sta [$00]
$09:c0a8  b3 30		 lda ($30,s),y
$09:c0aa  a7 04		 lda [$04]
$09:c0ac  b7 04		 lda [$04],y
$09:c0ae  e3 5c		 sbc $5c,s
$09:c0b0  00 00		 brk #$00
$09:c0b2  00 00		 brk #$00
$09:c0b4  00 00		 brk #$00
$09:c0b6  48			pha
$09:c0b7  78			sei
$09:c0b8  34 4c		 bit $4c,x
$09:c0ba  1c 58 0c	  trb $0c58
$09:c0bd  48			pha
$09:c0be  40			rti
$09:c0bf  00 ff		 brk #$ff
$09:c0c1  00 ff		 brk #$ff
$09:c0c3  00 ff		 brk #$ff
$09:c0c5  00 ff		 brk #$ff
$09:c0c7  00 fe		 brk #$fe
$09:c0c9  00 ff		 brk #$ff
$09:c0cb  01 fe		 ora ($fe,x)
$09:c0cd  02 fc		 cop #$fc
$09:c0cf  05 00		 ora $00
$09:c0d1  00 00		 brk #$00
$09:c0d3  00 01		 brk #$01
$09:c0d5  00 01		 brk #$01
$09:c0d7  00 01		 brk #$01
$09:c0d9  00 00		 brk #$00
$09:c0db  00 01		 brk #$01
$09:c0dd  03 02		 ora $02,s
$09:c0df  03 ff		 ora $ff,s
$09:c0e1  00 ef		 brk #$ef
$09:c0e3  30 67		 bmi $c14c
$09:c0e5  14 73		 trb $73
$09:c0e7  82 f1 3e	  brl $ffdb
$09:c0ea  7f 32 ff 80   adc $80ff32,x
$09:c0ee  5d 40 00	  eor $0040,x
$09:c0f1  00 a8		 brk #$a8
$09:c0f3  60			rts
$09:c0f4  88			dey
$09:c0f5  60			rts
$09:c0f6  0c 00 30	  tsb $3000
$09:c0f9  10 b2		 bpl $c0ad
$09:c0fb  06 00		 asl $00
$09:c0fd  06 a6		 asl $a6
$09:c0ff  80 ff		 bra $c100
$09:c101  00 ff		 brk #$ff
$09:c103  00 ff		 brk #$ff
$09:c105  00 f9		 brk #$f9
$09:c107  04 f7		 tsb $f7
$09:c109  01 f3		 ora ($f3,x)
$09:c10b  0c e9 18	  tsb $18e9
$09:c10e  f1 11		 sbc ($11),y
$09:c110  00 00		 brk #$00
$09:c112  00 00		 brk #$00
$09:c114  00 00		 brk #$00
$09:c116  03 00		 ora $00,s
$09:c118  0f 01 03 00   ora $000301
$09:c11c  07 18		 ora [$18]
$09:c11e  0e 10 ff	  asl $ff10
$09:c121  00 e7		 brk #$e7
$09:c123  20 e7 88	  jsr $88e7
$09:c126  2f 10 97 20   and $209710
$09:c12a  cb			wai
$09:c12b  88			dey
$09:c12c  a7 3a		 lda [$3a]
$09:c12e  2f cc 00 00   and $0000cc
$09:c132  18			clc
$09:c133  00 70		 brk #$70
$09:c135  00 e0		 brk #$e0
$09:c137  00 c8		 brk #$c8
$09:c139  08			php
$09:c13a  f4 8c c4	  pea $c48c
$09:c13d  0e 1a 16	  asl $161a
$09:c140  ff 00 fe 02   sbc $02fe00,x
$09:c144  fc 03 f5	  jsr ($f503,x)
$09:c147  0f eb 1c b5   ora $b51ceb
$09:c14b  13 ee		 ora ($ee,s),y
$09:c14d  2a			rol a
$09:c14e  e2 2e		 sep #$2e
$09:c150  00 00		 brk #$00
$09:c152  01 03		 ora ($03,x)
$09:c154  00 03		 brk #$03
$09:c156  10 1b		 bpl $c173
$09:c158  20 38 68	  jsr $6838
$09:c15b  78			sei
$09:c15c  51 78		 eor ($78),y
$09:c15e  51 78		 eor ($78),y
$09:c160  ff 00 ff 20   sbc $20ff00,x
$09:c164  bf 90 6f 00   lda $006f90,x
$09:c168  ff 00 bf c0   sbc $c0bf00,x
$09:c16c  2f 30 ef 48   and $48ef30
$09:c170  00 00		 brk #$00
$09:c172  c0 e0		 cpy #$e0
$09:c174  60			rts
$09:c175  f0 f0		 beq $c167
$09:c177  f0 00		 beq $c179
$09:c179  00 00		 brk #$00
$09:c17b  00 c0		 brk #$c0
$09:c17d  00 f0		 brk #$f0
$09:c17f  40			rti
$09:c180  ff 00 fe 00   sbc $00fe00,x
$09:c184  fc 07 f2	  jsr ($f207,x)
$09:c187  00 ff		 brk #$ff
$09:c189  00 ff		 brk #$ff
$09:c18b  00 ef		 brk #$ef
$09:c18d  00 d3		 brk #$d3
$09:c18f  18			clc
$09:c190  00 00		 brk #$00
$09:c192  07 07		 ora [$07]
$09:c194  08			php
$09:c195  0f 0f 0f 00   ora $000f0f
$09:c199  00 00		 brk #$00
$09:c19b  00 18		 brk #$18
$09:c19d  18			clc
$09:c19e  24 3c		 bit $3c
$09:c1a0  ff 00 bf 00   sbc $00bf00,x
$09:c1a4  bf a0 5b c0   lda $c05ba0,x
$09:c1a8  d7 04		 cmp [$04],y
$09:c1aa  ef 08 ff 30   sbc $30ff08
$09:c1ae  ff 20 00 00   sbc $000020,x
$09:c1b2  40			rti
$09:c1b3  00 40		 brk #$40
$09:c1b5  80 2c		 bra $c1e3
$09:c1b7  80 38		 bra $c1f1
$09:c1b9  00 30		 brk #$30
$09:c1bb  00 40		 brk #$40
$09:c1bd  00 c0		 brk #$c0
$09:c1bf  00 ff		 brk #$ff
$09:c1c1  00 ff		 brk #$ff
$09:c1c3  00 f8		 brk #$f8
$09:c1c5  03 f8		 ora $f8,s
$09:c1c7  04 fc		 tsb $fc
$09:c1c9  03 fe		 ora $fe,s
$09:c1cb  01 ff		 ora ($ff,x)
$09:c1cd  01 ff		 ora ($ff,x)
$09:c1cf  02 00		 cop #$00
$09:c1d1  00 00		 brk #$00
$09:c1d3  00 07		 brk #$07
$09:c1d5  07 03		 ora [$03]
$09:c1d7  07 00		 ora [$00]
$09:c1d9  03 00		 ora $00,s
$09:c1db  01 00		 ora ($00,x)
$09:c1dd  01 01		 ora ($01,x)
$09:c1df  03 ff		 ora $ff,s
$09:c1e1  00 0b		 brk #$0b
$09:c1e3  dc 17 b4	  jml [$b417]
$09:c1e6  2b			pld
$09:c1e7  1c 37 e8	  trb $e837
$09:c1ea  03 80		 ora $80,s
$09:c1ec  83 b4		 sta $b4,s
$09:c1ee  9b			txy
$09:c1ef  e4 00		 cpx $00
$09:c1f1  00 7c		 brk #$7c
$09:c1f3  e0 dc		 cpx #$dc
$09:c1f5  e0 dc		 cpx #$dc
$09:c1f7  c0 44		 cpy #$44
$09:c1f9  ec fc fc	  cpx $fcfc
$09:c1fc  58			cli
$09:c1fd  fc 18 fc	  jsr ($fc18,x)
$09:c200  cb			wai
$09:c201  47 c4		 eor [$c4]
$09:c203  43 e3		 eor $e3,s
$09:c205  60			rts
$09:c206  98			tya
$09:c207  58			cli
$09:c208  ef 2f f0 10   sbc $10f02f
$09:c20c  f7 0f		 sbc [$0f],y
$09:c20e  ff 00 3f 03   sbc $033f00,x
$09:c212  3f 00 1f 00   and $001f00,x
$09:c216  27 00		 and [$00]
$09:c218  10 00		 bpl $c21a
$09:c21a  0f 00 00 00   ora $000000
$09:c21e  00 00		 brk #$00
$09:c220  5f 90 9f 10   eor $109f90,x
$09:c224  3f 30 cf d0   and $d0cf30,x
$09:c228  bf a0 7f 40   lda $407fa0,x
$09:c22c  7f 80 ff 00   adc $00ff80,x
$09:c230  e0 00		 cpx #$00
$09:c232  e0 00		 cpx #$00
$09:c234  c0 00		 cpy #$00
$09:c236  20 00 40	  jsr $4000
$09:c239  00 80		 brk #$80
$09:c23b  00 00		 brk #$00
$09:c23d  00 00		 brk #$00
$09:c23f  00 fa		 brk #$fa
$09:c241  09 ea		 ora #$ea
$09:c243  19 eb 19	  ora $19eb,y
$09:c246  ea			nop
$09:c247  19 ed 1c	  ora $1ced,y
$09:c24a  f6 0e		 inc $0e,x
$09:c24c  fb			xce
$09:c24d  07 ff		 ora [$ff]
$09:c24f  00 07		 brk #$07
$09:c251  00 07		 brk #$07
$09:c253  00 07		 brk #$07
$09:c255  01 07		 ora ($07,x)
$09:c257  00 03		 brk #$03
$09:c259  00 01		 brk #$01
$09:c25b  00 00		 brk #$00
$09:c25d  00 00		 brk #$00
$09:c25f  00 5f		 brk #$5f
$09:c261  80 af		 bra $c212
$09:c263  d0 ff		 bne $c264
$09:c265  d0 bf		 bne $c226
$09:c267  d0 cf		 bne $c238
$09:c269  10 5f		 bpl $c2ca
$09:c26b  60			rts
$09:c26c  bf c0 ff 00   lda $00ffc0,x
$09:c270  e8			inx
$09:c271  00 e0		 brk #$e0
$09:c273  80 e0		 bra $c255
$09:c275  c0 e0		 cpy #$e0
$09:c277  80 e0		 bra $c259
$09:c279  00 80		 brk #$80
$09:c27b  00 00		 brk #$00
$09:c27d  00 00		 brk #$00
$09:c27f  00 fc		 brk #$fc
$09:c281  18			clc
$09:c282  9a			txs
$09:c283  19 fe 7f	  ora $7ffe,y
$09:c286  d6 47		 dec $47,x
$09:c288  bd 46 95	  lda $9546,x
$09:c28b  46 db		 lsr $db
$09:c28d  3c ff 00	  bit $00ff,x
$09:c290  27 01		 and [$01]
$09:c292  66 00		 ror $00
$09:c294  00 00		 brk #$00
$09:c296  38			sec
$09:c297  00 38		 brk #$38
$09:c299  00 38		 brk #$38
$09:c29b  00 00		 brk #$00
$09:c29d  00 00		 brk #$00
$09:c29f  00 9d		 brk #$9d
$09:c2a1  1e af 0e	  asl $0eaf,x
$09:c2a4  db			stp
$09:c2a5  58			cli
$09:c2a6  ff 78 ab 08   sbc $08ab78,x
$09:c2aa  bd 4e cb	  lda $cb4e,x
$09:c2ad  2c ff 00	  bit $00ff
$09:c2b0  60			rts
$09:c2b1  40			rti
$09:c2b2  70 00		 bvs $c2b4
$09:c2b4  26 00		 rol $00
$09:c2b6  06 00		 asl $00
$09:c2b8  76 00		 ror $00,x
$09:c2ba  30 00		 bmi $c2bc
$09:c2bc  10 00		 bpl $c2be
$09:c2be  00 00		 brk #$00
$09:c2c0  f9 0b f2	  sbc $f20b,y
$09:c2c3  16 e4		 asl $e4,x
$09:c2c5  2d cb 58	  and $58cb
$09:c2c8  93 30		 sta ($30,s),y
$09:c2ca  a1 6e		 lda ($6e,x)
$09:c2cc  9f 00 ff 00   sta $00ff00,x
$09:c2d0  04 01		 tsb $01
$09:c2d2  09 18		 ora #$18
$09:c2d4  12 1c		 ora ($1c)
$09:c2d6  26 0e		 rol $0e
$09:c2d8  4e 06 10	  lsr $1006
$09:c2db  02 70		 cop #$70
$09:c2dd  00 00		 brk #$00
$09:c2df  00 a9		 brk #$a9
$09:c2e1  62 e3 1c	  per $dfc7
$09:c2e4  7f 80 ff 00   adc $00ff80,x
$09:c2e8  ff 00 ff 00   sbc $00ff00,x
$09:c2ec  ff 00 ff 00   sbc $00ff00,x
$09:c2f0  9c c0 80	  stz $80c0
$09:c2f3  80 00		 bra $c2f5
$09:c2f5  00 00		 brk #$00
$09:c2f7  00 00		 brk #$00
$09:c2f9  00 00		 brk #$00
$09:c2fb  00 00		 brk #$00
$09:c2fd  00 00		 brk #$00
$09:c2ff  00 e5		 brk #$e5
$09:c301  06 f7		 asl $f7
$09:c303  18			clc
$09:c304  f7 08		 sbc [$08],y
$09:c306  e7 08		 sbc [$08]
$09:c308  eb			xba
$09:c309  1c f5 06	  trb $06f5
$09:c30c  fb			xce
$09:c30d  07 ff		 ora [$ff]
$09:c30f  00 18		 brk #$18
$09:c311  00 00		 brk #$00
$09:c313  00 10		 brk #$10
$09:c315  18			clc
$09:c316  10 18		 bpl $c330
$09:c318  00 1c		 brk #$1c
$09:c31a  08			php
$09:c31b  0e 00 07	  asl $0700
$09:c31e  00 00		 brk #$00
$09:c320  fb			xce
$09:c321  24 fd		 bit $fd
$09:c323  1c f1 0c	  trb $0cf1
$09:c326  ef 16 f1 16   sbc $16f116
$09:c32a  c3 2c		 cmp $2c,s
$09:c32c  8f 10 ff 00   sta $00ff10
$09:c330  1a			inc a
$09:c331  3e 0e 1a	  rol $1a0e,x
$09:c334  0a			asl a
$09:c335  0e 0c 1a	  asl $1a0c
$09:c338  08			php
$09:c339  1e 10 3c	  asl $3c10,x
$09:c33c  60			rts
$09:c33d  70 00		 bvs $c33f
$09:c33f  00 da		 brk #$da
$09:c341  16 bb		 asl $bb,x
$09:c343  27 fb		 and [$fb]
$09:c345  47 ff		 eor [$ff]
$09:c347  03 fd		 ora $fd,s
$09:c349  03 fe		 ora $fe,s
$09:c34b  01 ff		 ora ($ff,x)
$09:c34d  00 ff		 brk #$ff
$09:c34f  00 61		 brk #$61
$09:c351  70 40		 bvs $c393
$09:c353  60			rts
$09:c354  00 40		 brk #$40
$09:c356  00 00		 brk #$00
$09:c358  00 00		 brk #$00
$09:c35a  00 00		 brk #$00
$09:c35c  00 00		 brk #$00
$09:c35e  00 00		 brk #$00
$09:c360  33 24		 and ($24,s),y
$09:c362  17 04		 ora [$04],y
$09:c364  8f 84 0b 80   sta $800b84
$09:c368  83 c0		 sta $c0,s
$09:c36a  d7 f4		 cmp [$f4],y
$09:c36c  27 fc		 and [$fc]
$09:c36e  ff 00 f8 20   sbc $20f800,x
$09:c372  f8			sed
$09:c373  00 78		 brk #$78
$09:c375  00 7c		 brk #$7c
$09:c377  00 3c		 brk #$3c
$09:c379  00 08		 brk #$08
$09:c37b  00 00		 brk #$00
$09:c37d  00 00		 brk #$00
$09:c37f  00 e3		 brk #$e3
$09:c381  04 fe		 tsb $fe
$09:c383  00 f9		 brk #$f9
$09:c385  01 fb		 ora ($fb,x)
$09:c387  02 e7		 cop #$e7
$09:c389  04 df		 tsb $df
$09:c38b  18			clc
$09:c38c  ff 10 ff 00   sbc $00ff10,x
$09:c390  19 1c 03	  ora $031c,y
$09:c393  00 06		 brk #$06
$09:c395  00 0c		 brk #$0c
$09:c397  00 18		 brk #$18
$09:c399  00 20		 brk #$20
$09:c39b  00 00		 brk #$00
$09:c39d  00 00		 brk #$00
$09:c39f  00 7f		 brk #$7f
$09:c3a1  40			rti
$09:c3a2  b3 80		 lda ($80,s),y
$09:c3a4  7f 88 e3 08   adc $08e388,x
$09:c3a8  f7 08		 sbc [$08],y
$09:c3aa  ef 08 f7 00   sbc $00f708
$09:c3ae  ff 00 80 00   sbc $008000,x
$09:c3b2  7c 00 00	  jmp ($0000,x)
$09:c3b5  08			php
$09:c3b6  14 1c		 trb $1c
$09:c3b8  14 1c		 trb $1c
$09:c3ba  14 1c		 trb $1c
$09:c3bc  08			php
$09:c3bd  08			php
$09:c3be  00 00		 brk #$00
$09:c3c0  fe 05 fd	  inc $fd05,x
$09:c3c3  0a			asl a
$09:c3c4  f0 15		 beq $c3db
$09:c3c6  e3 2e		 sbc $2e,s
$09:c3c8  8c 53 87	  sty $8753
$09:c3cb  60			rts
$09:c3cc  e3 14		 sbc $14,s
$09:c3ce  ff 00 02 07   sbc $070200,x
$09:c3d2  04 0e		 tsb $0e
$09:c3d4  0a			asl a
$09:c3d5  1f 11 3f 28   ora $283f11,x
$09:c3d9  7b			tdc
$09:c3da  1c 7c 08	  trb $087c
$09:c3dd  1c 00 00	  trb $0000
$09:c3e0  d7 20		 cmp [$20],y
$09:c3e2  e7 10		 sbc [$10]
$09:c3e4  ff 00 ff 00   sbc $00ff00,x
$09:c3e8  ff 00 ff 00   sbc $00ff00,x
$09:c3ec  ff 00 ff 00   sbc $00ff00,x
$09:c3f0  18			clc
$09:c3f1  38			sec
$09:c3f2  08			php
$09:c3f3  18			clc
$09:c3f4  00 00		 brk #$00
$09:c3f6  00 00		 brk #$00
$09:c3f8  00 00		 brk #$00
$09:c3fa  00 00		 brk #$00
$09:c3fc  00 00		 brk #$00
$09:c3fe  00 00		 brk #$00
$09:c400  ff 00 ff 00   sbc $00ff00,x
$09:c404  ff 00 ff 00   sbc $00ff00,x
$09:c408  fe 03 f8	  inc $f803,x
$09:c40b  0b			phd
$09:c40c  e0 23		 cpx #$23
$09:c40e  86 01		 stx $01
$09:c410  00 00		 brk #$00
$09:c412  00 00		 brk #$00
$09:c414  00 00		 brk #$00
$09:c416  00 00		 brk #$00
$09:c418  01 03		 ora ($03,x)
$09:c41a  07 0f		 ora [$0f]
$09:c41c  1f 3f 79 79   ora $79793f,x
$09:c420  ff 00 ff 00   sbc $00ff00,x
$09:c424  ef 20 8f c8   sbc $c88f20
$09:c428  07 40		 ora [$40]
$09:c42a  07 44		 ora [$44]
$09:c42c  03 44		 ora $44,s
$09:c42e  0f 4e 00 00   ora $00004e
$09:c432  00 00		 brk #$00
$09:c434  10 30		 bpl $c466
$09:c436  70 f8		 bvs $c430
$09:c438  f8			sed
$09:c439  f8			sed
$09:c43a  f8			sed
$09:c43b  fc fc fc	  jsr ($fcfc,x)
$09:c43e  fc f2 ff	  jsr ($fff2,x)
$09:c441  00 ff		 brk #$ff
$09:c443  00 ff		 brk #$ff
$09:c445  00 ff		 brk #$ff
$09:c447  00 ff		 brk #$ff
$09:c449  03 ff		 ora $ff,s
$09:c44b  0f e7 24 87   ora $8724e7
$09:c44f  04 00		 tsb $00
$09:c451  00 00		 brk #$00
$09:c453  00 00		 brk #$00
$09:c455  00 00		 brk #$00
$09:c457  00 01		 brk #$01
$09:c459  01 07		 ora ($07,x)
$09:c45b  07 1c		 ora [$1c]
$09:c45d  07 7c		 ora [$7c]
$09:c45f  07 ff		 ora [$ff]
$09:c461  00 ff		 brk #$ff
$09:c463  00 ef		 brk #$ef
$09:c465  20 cf c8	  jsr $c8cf
$09:c468  77 40		 adc [$40],y
$09:c46a  47 04		 eor [$04]
$09:c46c  5b			tcd
$09:c46d  40			rti
$09:c46e  63 42		 adc $42,s
$09:c470  00 00		 brk #$00
$09:c472  00 00		 brk #$00
$09:c474  10 00		 bpl $c476
$09:c476  70 40		 bvs $c4b8
$09:c478  c8			iny
$09:c479  40			rti
$09:c47a  b8			clv
$09:c47b  00 e4		 brk #$e4
$09:c47d  40			rti
$09:c47e  dc 40 ff	  jml [$ff40]
$09:c481  00 ff		 brk #$ff
$09:c483  02 fa		 cop #$fa
$09:c485  0c ff 10	  tsb $10ff
$09:c488  f1 20		 sbc ($20),y
$09:c48a  fb			xce
$09:c48b  20 e5 40	  jsr $40e5
$09:c48e  f7 48		 sbc [$48],y
$09:c490  00 00		 brk #$00
$09:c492  01 03		 ora ($03,x)
$09:c494  07 0f		 ora [$0f]
$09:c496  0f 1f 1e 3e   ora $3e1e1f
$09:c49a  1d 3d 3b	  ora $3b3d,x
$09:c49d  7b			tdc
$09:c49e  3b			tsc
$09:c49f  7b			tdc
$09:c4a0  ff 00 7f a0   sbc $a07f00,x
$09:c4a4  4f 38 77 0c   eor $0c7738
$09:c4a8  d3 04		 cmp ($04,s),y
$09:c4aa  2f c2 df 20   and $20dfc2
$09:c4ae  d5 22		 cmp $22,x
$09:c4b0  00 00		 brk #$00
$09:c4b2  c0 e0		 cpy #$e0
$09:c4b4  f0 f8		 beq $c4ae
$09:c4b6  f8			sed
$09:c4b7  fc 3c 3c	  jsr ($3c3c,x)
$09:c4ba  dc de ee	  jml [$eede]
$09:c4bd  ee 6e 6e	  inc $6e6e
$09:c4c0  ff 00 fc 02   sbc $02fc00,x
$09:c4c4  f1 09		 sbc ($09),y
$09:c4c6  e3 10		 sbc $10,s
$09:c4c8  ca			dex
$09:c4c9  28			plp
$09:c4ca  c3 22		 cmp $22,s
$09:c4cc  9b			txy
$09:c4cd  59 83 41	  eor $4183,y
$09:c4d0  00 00		 brk #$00
$09:c4d2  01 00		 ora ($00,x)
$09:c4d4  06 00		 asl $00
$09:c4d6  0c 00 15	  tsb $1500
$09:c4d9  00 1c		 brk #$1c
$09:c4db  00 24		 brk #$24
$09:c4dd  00 3c		 brk #$3c
$09:c4df  00 ff		 brk #$ff
$09:c4e1  00 9f		 brk #$9f
$09:c4e3  20 77 48	  jsr $4877
$09:c4e6  6b			rtl
$09:c4e7  04 37		 tsb $37
$09:c4e9  10 e1		 bpl $c4cc
$09:c4eb  22 bd 1c 63   jsl $631cbd
$09:c4ef  40			rti
$09:c4f0  00 00		 brk #$00
$09:c4f2  c0 00		 cpy #$00
$09:c4f4  b0 00		 bcs $c4f6
$09:c4f6  98			tya
$09:c4f7  00 cc		 brk #$cc
$09:c4f9  00 1c		 brk #$1c
$09:c4fb  00 c2		 brk #$c2
$09:c4fd  00 9e		 brk #$9e
$09:c4ff  00 ff		 brk #$ff
$09:c501  00 fc		 brk #$fc
$09:c503  02 f0		 cop #$f0
$09:c505  08			php
$09:c506  e3 12		 sbc $12,s
$09:c508  db			stp
$09:c509  39 c2 20	  and $20c2,y
$09:c50c  8f 4d 83 40   sta $40834d
$09:c510  00 00		 brk #$00
$09:c512  01 00		 ora ($00,x)
$09:c514  07 00		 ora [$00]
$09:c516  0c 00 04	  tsb $0400
$09:c519  00 1d		 brk #$1d
$09:c51b  00 30		 brk #$30
$09:c51d  00 3e		 brk #$3e
$09:c51f  00 ff		 brk #$ff
$09:c521  00 9f		 brk #$9f
$09:c523  20 37 08	  jsr $0837
$09:c526  eb			xba
$09:c527  24 f7		 bit $f7
$09:c529  50 61		 bvc $c58c
$09:c52b  02 6d		 cop #$6d
$09:c52d  4c e3 20	  jmp $20e3
$09:c530  00 00		 brk #$00
$09:c532  c0 00		 cpy #$00
$09:c534  f0 00		 beq $c536
$09:c536  18			clc
$09:c537  00 8c		 brk #$8c
$09:c539  00 dc		 brk #$dc
$09:c53b  00 92		 brk #$92
$09:c53d  00 1e		 brk #$1e
$09:c53f  00 ff		 brk #$ff
$09:c541  00 fc		 brk #$fc
$09:c543  02 f3		 cop #$f3
$09:c545  0b			phd
$09:c546  e0 10		 cpx #$10
$09:c548  d6 36		 dec $36,x
$09:c54a  c0 20		 cpy #$20
$09:c54c  bb			tyx
$09:c54d  7b			tdc
$09:c54e  87 44		 sta [$44]
$09:c550  00 00		 brk #$00
$09:c552  01 00		 ora ($00,x)
$09:c554  04 00		 tsb $00
$09:c556  0f 00 09 00   ora $000900
$09:c55a  1f 00 04 00   ora $000400,x
$09:c55e  38			sec
$09:c55f  00 ff		 brk #$ff
$09:c561  00 9f		 brk #$9f
$09:c563  20 37 08	  jsr $0837
$09:c566  0b			phd
$09:c567  04 ff		 tsb $ff
$09:c569  08			php
$09:c56a  d1 22		 cmp ($22),y
$09:c56c  75 24		 adc $24,x
$09:c56e  d3 40		 cmp ($40,s),y
$09:c570  00 00		 brk #$00
$09:c572  c0 00		 cpy #$00
$09:c574  f0 00		 beq $c576
$09:c576  f8			sed
$09:c577  00 04		 brk #$04
$09:c579  00 cc		 brk #$cc
$09:c57b  00 8a		 brk #$8a
$09:c57d  00 2e		 brk #$2e
$09:c57f  00 ff		 brk #$ff
$09:c581  00 ff		 brk #$ff
$09:c583  02 fd		 cop #$fd
$09:c585  08			php
$09:c586  ff 10 f9 20   sbc $20f910,x
$09:c58a  fd 20 c7	  sbc $c720,x
$09:c58d  42 ff		 wdm #$ff
$09:c58f  41 00		 eor ($00,x)
$09:c591  00 01		 brk #$01
$09:c593  03 07		 ora $07,s
$09:c595  0f 0e 1e 1e   ora $1e1e0e
$09:c599  3e 1e 3e	  rol $3e1e,x
$09:c59c  3c 7e 3c	  bit $3c7e,x
$09:c59f  7d ff 00	  adc $00ff,x
$09:c5a2  7f a0 4f 38   adc $384fa0,x
$09:c5a6  f7 0c		 sbc [$0c],y
$09:c5a8  eb			xba
$09:c5a9  04 ff		 tsb $ff
$09:c5ab  02 cb		 cop #$cb
$09:c5ad  00 fd		 brk #$fd
$09:c5af  02 00		 cop #$00
$09:c5b1  00 c0		 brk #$c0
$09:c5b3  e0 f0		 cpx #$f0
$09:c5b5  f8			sed
$09:c5b6  b8			clv
$09:c5b7  bc bc bc	  ldy $bcbc,x
$09:c5ba  bc be be	  ldy $bebe,x
$09:c5bd  be be be	  ldx $bebe,y
$09:c5c0  ff 00 ff 02   sbc $02ff00,x
$09:c5c4  fe 08 ff	  inc $ff08,x
$09:c5c7  10 f3		 bpl $c5bc
$09:c5c9  24 fd		 bit $fd
$09:c5cb  22 f1 42 ff   jsl $ff42f1
$09:c5cf  40			rti
$09:c5d0  00 00		 brk #$00
$09:c5d2  01 03		 ora ($03,x)
$09:c5d4  07 0f		 ora [$0f]
$09:c5d6  0e 1e 1c	  asl $1c1e
$09:c5d9  3c 1e 3e	  bit $3e1e,x
$09:c5dc  3e 7e 3e	  rol $3e7e,x
$09:c5df  7e ff 00	  ror $00ff,x
$09:c5e2  7f a0 4f 38   adc $384fa0,x
$09:c5e6  f7 0c		 sbc [$0c],y
$09:c5e8  e3 04		 sbc $04,s
$09:c5ea  7f 02 cb 00   adc $00cb02,x
$09:c5ee  7d c2 00	  adc $00c2,x
$09:c5f1  00 c0		 brk #$c0
$09:c5f3  e0 f0		 cpx #$f0
$09:c5f5  f8			sed
$09:c5f6  f8			sed
$09:c5f7  fc 3c 3c	  jsr ($3c3c,x)
$09:c5fa  fc fe 3e	  jsr ($3efe,x)
$09:c5fd  3e 9e de	  rol $de9e,x
$09:c600  d8			cld
$09:c601  43 c0		 eor $c0,s
$09:c603  03 e3		 ora $e3,s
$09:c605  23 ee		 and $ee,s
$09:c607  0f e9 1b f7   ora $f71be9
$09:c60b  04 ff		 tsb $ff
$09:c60d  00 ff		 brk #$ff
$09:c60f  00 27		 brk #$27
$09:c611  67 3f		 adc [$3f]
$09:c613  3f 1f 3c 1f   and $1f3c1f,x
$09:c617  11 1e		 ora ($1e),y
$09:c619  07 08		 ora [$08]
$09:c61b  0c 00 00	  tsb $0000
$09:c61e  00 00		 brk #$00
$09:c620  39 7c e7	  and $e77c,y
$09:c623  e4 9f		 cpx $9f
$09:c625  d0 7f		 bne $c6a6
$09:c627  40			rti
$09:c628  ff 00 ff 00   sbc $00ff00,x
$09:c62c  ff 00 ff 00   sbc $00ff00,x
$09:c630  fe c6 f8	  inc $f8c6,x
$09:c633  1c e0 70	  trb $70e0
$09:c636  80 c0		 bra $c5f8
$09:c638  00 00		 brk #$00
$09:c63a  00 00		 brk #$00
$09:c63c  00 00		 brk #$00
$09:c63e  00 00		 brk #$00
$09:c640  ff 44 cf 00   sbc $00cf44,x
$09:c644  e7 20		 sbc [$20]
$09:c646  e7 04		 sbc [$04]
$09:c648  f7 17		 sbc [$17],y
$09:c64a  f7 04		 sbc [$04],y
$09:c64c  ff 00 ff 00   sbc $00ff00,x
$09:c650  04 3f		 tsb $3f
$09:c652  30 0f		 bmi $c663
$09:c654  18			clc
$09:c655  07 1c		 ora [$1c]
$09:c657  07 0e		 ora [$0e]
$09:c659  06 08		 asl $08
$09:c65b  00 00		 brk #$00
$09:c65d  00 00		 brk #$00
$09:c65f  00 41		 brk #$41
$09:c661  40			rti
$09:c662  47 44		 eor [$44]
$09:c664  5f 50 7f 40   eor $407f50,x
$09:c668  ff 00 ff 00   sbc $00ff00,x
$09:c66c  ff 00 ff 00   sbc $00ff00,x
$09:c670  fe 40 f8	  inc $f840,x
$09:c673  40			rti
$09:c674  e0 40		 cpx #$40
$09:c676  80 00		 bra $c678
$09:c678  00 00		 brk #$00
$09:c67a  00 00		 brk #$00
$09:c67c  00 00		 brk #$00
$09:c67e  00 00		 brk #$00
$09:c680  ed 40 f3	  sbc $f340
$09:c683  68			pla
$09:c684  e1 24		 sbc ($24,x)
$09:c686  fd 32 fc	  sbc $fc32,x
$09:c689  18			clc
$09:c68a  ff 0e ff 03   sbc $03ff0e,x
$09:c68e  ff 00 3b 7b   sbc $7b3b00,x
$09:c692  1d 7d 1e	  ora $1e7d,x
$09:c695  3e 0f 3f	  rol $3f0f,x
$09:c698  07 1f		 ora [$1f]
$09:c69a  01 0f		 ora ($0f,x)
$09:c69c  00 03		 brk #$03
$09:c69e  00 00		 brk #$00
$09:c6a0  79 80 af	  adc $af80,y
$09:c6a3  02 d3		 cop #$d3
$09:c6a5  00 7f		 brk #$7f
$09:c6a7  84 bf		 sty $bf
$09:c6a9  08			php
$09:c6aa  ff 30 ff c0   sbc $c0ff30,x
$09:c6ae  ff 00 ee ee   sbc $eeee00,x
$09:c6b2  dc de 3c	  jml [$3cde]
$09:c6b5  3c f8 fc	  bit $fcf8,x
$09:c6b8  f0 f8		 beq $c6b2
$09:c6ba  c0 f0		 cpy #$f0
$09:c6bc  00 c0		 brk #$c0
$09:c6be  00 00		 brk #$00
$09:c6c0  b7 74		 lda [$74],y
$09:c6c2  81 60		 sta ($60,x)
$09:c6c4  d7 30		 cmp [$30],y
$09:c6c6  c3 30		 cmp $30,s
$09:c6c8  e4 1c		 cpx $1c
$09:c6ca  f0 0e		 beq $c6da
$09:c6cc  fc 03 ff	  jsr ($ff03,x)
$09:c6cf  00 0a		 brk #$0a
$09:c6d1  00 1f		 brk #$1f
$09:c6d3  00 0c		 brk #$0c
$09:c6d5  00 0f		 brk #$0f
$09:c6d7  00 03		 brk #$03
$09:c6d9  00 01		 brk #$01
$09:c6db  00 00		 brk #$00
$09:c6dd  00 00		 brk #$00
$09:c6df  00 cd		 brk #$cd
$09:c6e1  0c a1 22	  tsb $22a1
$09:c6e4  eb			xba
$09:c6e5  08			php
$09:c6e6  a3 04		 lda $04,s
$09:c6e8  c7 48		 cmp [$48]
$09:c6ea  0f 30 3f c0   ora $c03f30
$09:c6ee  ff 00 32 00   sbc $003200,x
$09:c6f2  5c 00 14 00   jml $001400
$09:c6f6  78			sei
$09:c6f7  00 b0		 brk #$b0
$09:c6f9  00 c0		 brk #$c0
$09:c6fb  00 00		 brk #$00
$09:c6fd  00 00		 brk #$00
$09:c6ff  00 b5		 brk #$b5
$09:c701  74 87		 stz $87,x
$09:c703  60			rts
$09:c704  cf 2c c0 30   cmp $30c02c
$09:c708  e3 1b		 sbc $1b,s
$09:c70a  f1 0f		 sbc ($0f),y
$09:c70c  fc 03 ff	  jsr ($ff03,x)
$09:c70f  00 0b		 brk #$0b
$09:c711  00 1c		 brk #$1c
$09:c713  00 13		 brk #$13
$09:c715  00 0f		 brk #$0f
$09:c717  00 04		 brk #$04
$09:c719  00 00		 brk #$00
$09:c71b  00 00		 brk #$00
$09:c71d  00 00		 brk #$00
$09:c71f  00 d9		 brk #$d9
$09:c721  58			cli
$09:c722  e1 02		 sbc ($02,x)
$09:c724  af 0c 83 04   lda $04830c
$09:c728  87 08		 sta [$08]
$09:c72a  0f 30 3f c0   ora $c03f30
$09:c72e  ff 00 26 00   sbc $002600,x
$09:c732  1c 00 70	  trb $7000
$09:c735  00 78		 brk #$78
$09:c737  00 f0		 brk #$f0
$09:c739  00 c0		 brk #$c0
$09:c73b  00 00		 brk #$00
$09:c73d  00 00		 brk #$00
$09:c73f  00 9d		 brk #$9d
$09:c741  58			cli
$09:c742  86 62		 stx $62
$09:c744  c7 20		 cmp [$20]
$09:c746  c3 30		 cmp $30,s
$09:c748  e5 1d		 sbc $1d
$09:c74a  f0 0e		 beq $c75a
$09:c74c  fc 03 ff	  jsr ($ff03,x)
$09:c74f  00 23		 brk #$23
$09:c751  00 19		 brk #$19
$09:c753  00 1c		 brk #$1c
$09:c755  00 0f		 brk #$0f
$09:c757  00 02		 brk #$02
$09:c759  00 01		 brk #$01
$09:c75b  00 00		 brk #$00
$09:c75d  00 00		 brk #$00
$09:c75f  00 b9		 brk #$b9
$09:c761  28			plp
$09:c762  81 02		 sta ($02,x)
$09:c764  b7 b4		 lda [$b4],y
$09:c766  03 04		 ora $04,s
$09:c768  67 68		 adc [$68]
$09:c76a  8f b0 3f c0   sta $c03fb0
$09:c76e  ff 00 56 00   sbc $005600,x
$09:c772  7c 00 48	  jmp ($4800,x)
$09:c775  00 f8		 brk #$f8
$09:c777  00 90		 brk #$90
$09:c779  00 40		 brk #$40
$09:c77b  00 00		 brk #$00
$09:c77d  00 00		 brk #$00
$09:c77f  00 cf		 brk #$cf
$09:c781  44 fa 65	  mvp $65,$fa
$09:c784  ea			nop
$09:c785  20 ff 30	  jsr $30ff
$09:c788  fa			plx
$09:c789  18			clc
$09:c78a  ff 0e ff 03   sbc $03ff0e,x
$09:c78e  ff 00 38 7c   sbc $7c3800,x
$09:c792  1f 7f 1f 3f   ora $3f1f7f,x
$09:c796  0f 3f 07 1f   ora $1f073f
$09:c79a  01 0f		 ora ($0f,x)
$09:c79c  00 03		 brk #$03
$09:c79e  00 00		 brk #$00
$09:c7a0  fb			xce
$09:c7a1  00 5f		 brk #$5f
$09:c7a3  a2 67		 ldx #$67
$09:c7a5  00 ff		 brk #$ff
$09:c7a7  04 3f		 tsb $3f
$09:c7a9  48			pha
$09:c7aa  ff 30 ff c0   sbc $c0ff30,x
$09:c7ae  ff 00 0e 0e   sbc $0e0e00,x
$09:c7b2  bc be bc	  ldy $bcbe,x
$09:c7b5  bc b8 bc	  ldy $bcb8,x
$09:c7b8  f0 f8		 beq $c7b2
$09:c7ba  c0 f0		 cpy #$f0
$09:c7bc  00 c0		 brk #$c0
$09:c7be  00 00		 brk #$00
$09:c7c0  e5 42		 sbc $42
$09:c7c2  ff 60 e9 20   sbc $20e960,x
$09:c7c6  fe 31 f8	  inc $f831,x
$09:c7c9  18			clc
$09:c7ca  ff 0e ff 03   sbc $03ff0e,x
$09:c7ce  ff 00 3e 7e   sbc $7e3e00,x
$09:c7d2  1e 7e 1e	  asl $1e7e,x
$09:c7d5  3e 0f 3f	  rol $3f0f,x
$09:c7d8  07 1f		 ora [$1f]
$09:c7da  01 0f		 ora ($0f,x)
$09:c7dc  00 03		 brk #$03
$09:c7de  00 00		 brk #$00
$09:c7e0  33 40		 and ($40,s),y
$09:c7e2  bf 02 d7 00   lda $00d702,x
$09:c7e6  ff 04 bf 48   sbc $48bf04,x
$09:c7ea  ff 30 ff c0   sbc $c0ff30,x
$09:c7ee  ff 00 de de   sbc $dede00,x
$09:c7f2  dc de bc	  jml [$bcde]
$09:c7f5  bc b8 bc	  ldy $bcb8,x
$09:c7f8  f0 f8		 beq $c7f2
$09:c7fa  c0 f0		 cpy #$f0
$09:c7fc  00 c0		 brk #$c0
$09:c7fe  00 00		 brk #$00
$09:c800  ff 00 ff 02   sbc $02ff00,x
$09:c804  ff 08 fb 14   sbc $14fb08,x
$09:c808  fb			xce
$09:c809  20 f7 28	  jsr $28f7
$09:c80c  ed 40 f3	  sbc $f340
$09:c80f  48			pha
$09:c810  00 00		 brk #$00
$09:c812  01 03		 ora ($03,x)
$09:c814  07 0f		 ora [$0f]
$09:c816  0d 1d 1d	  ora $1d1d
$09:c819  3d 1b 3b	  and $3b1b,x
$09:c81c  3b			tsc
$09:c81d  7b			tdc
$09:c81e  3c 7c ff	  bit $ff7c,x
$09:c821  00 7f		 brk #$7f
$09:c823  a0 0f		 ldy #$0f
$09:c825  38			sec
$09:c826  f7 0c		 sbc [$0c],y
$09:c828  eb			xba
$09:c829  04 ff		 tsb $ff
$09:c82b  02 db		 cop #$db
$09:c82d  00 ed		 brk #$ed
$09:c82f  02 00		 cop #$00
$09:c831  00 c0		 brk #$c0
$09:c833  e0 f0		 cpx #$f0
$09:c835  f8			sed
$09:c836  58			cli
$09:c837  5c 5c 5c 6c   jml $6c5c5c
$09:c83b  6e 6e 6e	  ror $6e6e
$09:c83e  1e 1e ff	  asl $ff1e,x
$09:c841  00 fc		 brk #$fc
$09:c843  02 f3		 cop #$f3
$09:c845  0b			phd
$09:c846  e7 10		 sbc [$10]
$09:c848  ce 28 c7	  dec $c728
$09:c84b  20 b7 74	  jsr $74b7
$09:c84e  81 40		 sta ($40,x)
$09:c850  00 00		 brk #$00
$09:c852  01 00		 ora ($00,x)
$09:c854  04 00		 tsb $00
$09:c856  0d 00 15	  ora $1500
$09:c859  00 1c		 brk #$1c
$09:c85b  00 0b		 brk #$0b
$09:c85d  00 3e		 brk #$3e
$09:c85f  00 ff		 brk #$ff
$09:c861  00 9f		 brk #$9f
$09:c863  20 37 08	  jsr $0837
$09:c866  eb			xba
$09:c867  04 ef		 tsb $ef
$09:c869  48			pha
$09:c86a  e1 02		 sbc ($02,x)
$09:c86c  f9 58 c3	  sbc $c358,y
$09:c86f  00 00		 brk #$00
$09:c871  00 c0		 brk #$c0
$09:c873  00 f0		 brk #$f0
$09:c875  00 58		 brk #$58
$09:c877  00 14		 brk #$14
$09:c879  00 1c		 brk #$1c
$09:c87b  00 26		 brk #$26
$09:c87d  00 3e		 brk #$3e
$09:c87f  00 ff		 brk #$ff
$09:c881  00 ee		 brk #$ee
$09:c883  00 cd		 brk #$cd
$09:c885  10 c3		 bpl $c84a
$09:c887  17 f7		 ora [$f7],y
$09:c889  0e bf 0d	  asl $0dbf
$09:c88c  9f 4b bf 4e   sta $4ebf4b,x
$09:c890  00 00		 brk #$00
$09:c892  11 00		 ora ($00),y
$09:c894  3b			tsc
$09:c895  00 38		 brk #$38
$09:c897  07 12		 ora [$12]
$09:c899  0d 55 0b	  ora $0b55
$09:c89c  73 0f		 adc ($0f,s),y
$09:c89e  76 0f		 ror $0f,x
$09:c8a0  ff 00 db 00   sbc $00db00,x
$09:c8a4  47 f8		 eor [$f8]
$09:c8a6  cf e0 e5 f8   cmp $f8e5e0
$09:c8aa  f1 ba		 sbc ($ba),y
$09:c8ac  b5 1a		 lda $1a,x
$09:c8ae  7f 32 00 00   adc $000032,x
$09:c8b2  e6 00		 inc $00
$09:c8b4  fc 40 18	  jsr ($1840,x)
$09:c8b7  e0 ca		 cpx #$ca
$09:c8b9  b0 ae		 bcs $c869
$09:c8bb  d0 0e		 bne $c8cb
$09:c8bd  f0 2e		 beq $c8ed
$09:c8bf  f2 ff		 sbc ($ff)
$09:c8c1  00 ff		 brk #$ff
$09:c8c3  00 fb		 brk #$fb
$09:c8c5  00 e9		 brk #$e9
$09:c8c7  07 d0		 ora [$d0]
$09:c8c9  0b			phd
$09:c8ca  a7 1f		 lda [$1f]
$09:c8cc  cc 3c c9	  cpy $c93c
$09:c8cf  18			clc
$09:c8d0  00 00		 brk #$00
$09:c8d2  00 00		 brk #$00
$09:c8d4  07 00		 ora [$00]
$09:c8d6  1f 01 3c 00   ora $003c01,x
$09:c8da  70 00		 bvs $c8dc
$09:c8dc  63 00		 adc $00,s
$09:c8de  67 00		 adc [$00]
$09:c8e0  ff 00 ff 00   sbc $00ff00,x
$09:c8e4  bb			tyx
$09:c8e5  00 85		 brk #$85
$09:c8e7  c2 17		 rep #$17
$09:c8e9  6c 9b fc	  jmp ($fc9b)
$09:c8ec  49 7c		 eor #$7c
$09:c8ee  21 2c		 and ($2c,x)
$09:c8f0  00 00		 brk #$00
$09:c8f2  02 00		 cop #$00
$09:c8f4  c6 00		 dec $00
$09:c8f6  fe 80 fe	  inc $fe80,x
$09:c8f9  04 3e		 tsb $3e
$09:c8fb  18			clc
$09:c8fc  9e 08 de	  stz $de08,x
$09:c8ff  00 ff		 brk #$ff
$09:c901  00 ff		 brk #$ff
$09:c903  00 fb		 brk #$fb
$09:c905  00 fd		 brk #$fd
$09:c907  00 fb		 brk #$fb
$09:c909  04 fa		 tsb $fa
$09:c90b  02 fc		 cop #$fc
$09:c90d  03 fa		 ora $fa,s
$09:c90f  05 00		 ora $00
$09:c911  00 00		 brk #$00
$09:c913  00 04		 brk #$04
$09:c915  00 06		 brk #$06
$09:c917  00 06		 brk #$06
$09:c919  00 07		 brk #$07
$09:c91b  02 06		 cop #$06
$09:c91d  01 06		 ora ($06,x)
$09:c91f  01 ff		 ora ($ff,x)
$09:c921  00 83		 brk #$83
$09:c923  18			clc
$09:c924  41 3e		 eor ($3e,x)
$09:c926  99 7e 19	  sta $197e,y
$09:c929  fe 01 fc	  inc $fc01,x
$09:c92c  a3 bc		 lda $bc,s
$09:c92e  59 7c 00	  eor $007c,y
$09:c931  00 66		 brk #$66
$09:c933  18			clc
$09:c934  c2 24		 rep #$24
$09:c936  88			dey
$09:c937  4a			lsr a
$09:c938  80 42		 bra $c97c
$09:c93a  02 e4		 cop #$e4
$09:c93c  46 f8		 lsr $f8
$09:c93e  9e f8 ff	  stz $fff8,x
$09:c941  00 fb		 brk #$fb
$09:c943  09 ec 02	  ora #$02ec
$09:c946  f9 1c fc	  sbc $fc1c,y
$09:c949  7b			tdc
$09:c94a  bf 1c de 2e   lda $2ede1c,x
$09:c94e  97 2d		 sta [$2d],y
$09:c950  00 00		 brk #$00
$09:c952  06 00		 asl $00
$09:c954  1c 01 30	  trb $3001
$09:c957  13 2c		 ora ($2c,s),y
$09:c959  28			plp
$09:c95a  7b			tdc
$09:c95b  18			clc
$09:c95c  57 06		 eor [$06],y
$09:c95e  56 04		 lsr $04,x
$09:c960  ff 00 ff 00   sbc $00ff00,x
$09:c964  bf 80 ff 20   lda $20ff80,x
$09:c968  0f e0 97 00   ora $0097e0
$09:c96c  f3 88		 sbc ($88,s),y
$09:c96e  eb			xba
$09:c96f  16 00		 asl $00,x
$09:c971  00 00		 brk #$00
$09:c973  00 80		 brk #$80
$09:c975  c0 00 c0	  cpy #$c000
$09:c978  10 00		 bpl $c97a
$09:c97a  f8			sed
$09:c97b  00 04		 brk #$04
$09:c97d  00 00		 brk #$00
$09:c97f  00 ff		 brk #$ff
$09:c981  00 f2		 brk #$f2
$09:c983  0e fe 06	  asl $06fe
$09:c986  fe 02 f5	  inc $f502,x
$09:c989  0c eb 18	  tsb $18eb
$09:c98c  db			stp
$09:c98d  38			sec
$09:c98e  f3 30		 sbc ($30,s),y
$09:c990  00 00		 brk #$00
$09:c992  01 00		 ora ($00,x)
$09:c994  01 07		 ora ($07,x)
$09:c996  01 03		 ora ($03,x)
$09:c998  03 0f		 ora $0f,s
$09:c99a  07 1f		 ora [$1f]
$09:c99c  07 3f		 ora [$3f]
$09:c99e  0f 3f ff 00   ora $00ff3f
$09:c9a2  af 30 3f 20   lda $203f30
$09:c9a6  bf 00 cf 10   lda $10cf00,x
$09:c9aa  27 c8		 and [$c8]
$09:c9ac  53 e4		 eor ($e4,s),y
$09:c9ae  0b			phd
$09:c9af  f0 00		 beq $c9b1
$09:c9b1  00 c0		 brk #$c0
$09:c9b3  00 c0		 brk #$c0
$09:c9b5  e0 c0 c0	  cpx #$c0c0
$09:c9b8  e0 f0 f0	  cpx #$f0f0
$09:c9bb  f8			sed
$09:c9bc  f8			sed
$09:c9bd  fc fc fc	  jsr ($fcfc,x)
$09:c9c0  ff 00 ff 00   sbc $00ff00,x
$09:c9c4  ff 00 fd 03   sbc $03fd00,x
$09:c9c8  fb			xce
$09:c9c9  07 fe		 ora [$fe]
$09:c9cb  06 f0		 asl $f0
$09:c9cd  0f ec 1c 00   ora $001cec
$09:c9d1  00 00		 brk #$00
$09:c9d3  00 00		 brk #$00
$09:c9d5  00 00		 brk #$00
$09:c9d7  00 00		 brk #$00
$09:c9d9  00 01		 brk #$01
$09:c9db  00 00		 brk #$00
$09:c9dd  00 03		 brk #$03
$09:c9df  00 ff		 brk #$ff
$09:c9e1  00 9f		 brk #$9f
$09:c9e3  50 6f		 bvc $ca54
$09:c9e5  c0 97 98	  cpy #$9897
$09:c9e8  67 08		 adc [$08]
$09:c9ea  ff 28 77 e0   sbc $e07728,x
$09:c9ee  77 60		 adc [$60],y
$09:c9f0  00 00		 brk #$00
$09:c9f2  20 00 10	  jsr $1000
$09:c9f5  00 60		 brk #$60
$09:c9f7  00 f0		 brk #$f0
$09:c9f9  00 f0		 brk #$f0
$09:c9fb  20 78 60	  jsr $6078
$09:c9fe  98			tya
$09:c9ff  00 c8		 brk #$c8
$09:ca01  47 ff		 eor [$ff]
$09:ca03  60			rts
$09:ca04  f4 23 ff	  pea $ff23
$09:ca07  30 fc		 bmi $ca05
$09:ca09  18			clc
$09:ca0a  ff 0e ff 03   sbc $03ff0e,x
$09:ca0e  ff 00 3f 7f   sbc $7f3f00,x
$09:ca12  1c 7c 1f	  trb $1f7c
$09:ca15  3f 0f 3f 07   and $073f0f,x
$09:ca19  1f 01 0f 00   ora $000f01,x
$09:ca1d  03 00		 ora $00,s
$09:ca1f  00 f3		 brk #$f3
$09:ca21  00 ff		 brk #$ff
$09:ca23  02 a7		 cop #$a7
$09:ca25  40			rti
$09:ca26  ff 04 2f 88   sbc $882f04,x
$09:ca2a  ff 30 ff c0   sbc $c0ff30,x
$09:ca2e  ff 00 7e 7e   sbc $7e7e00,x
$09:ca32  1c 1e 7c	  trb $7c1e
$09:ca35  7c 78 7c	  jmp ($7c78,x)
$09:ca38  f0 f8		 beq $ca32
$09:ca3a  c0 f0 00	  cpy #$00f0
$09:ca3d  c0 00 00	  cpy #$0000
$09:ca40  9f 59 86 60   sta $608659,x
$09:ca44  d7 31		 cmp [$31],y
$09:ca46  c3 30		 cmp $30,s
$09:ca48  e3 1a		 sbc $1a,s
$09:ca4a  f0 0e		 beq $ca5a
$09:ca4c  fc 03 ff	  jsr ($ff03,x)
$09:ca4f  00 24		 brk #$24
$09:ca51  00 1d		 brk #$1d
$09:ca53  00 0c		 brk #$0c
$09:ca55  00 0e		 brk #$0e
$09:ca57  00 05		 brk #$05
$09:ca59  00 01		 brk #$01
$09:ca5b  00 00		 brk #$00
$09:ca5d  00 00		 brk #$00
$09:ca5f  00 eb		 brk #$eb
$09:ca61  4a			lsr a
$09:ca62  61 02		 adc ($02,x)
$09:ca64  7b			tdc
$09:ca65  58			cli
$09:ca66  c3 04		 cmp $04,s
$09:ca68  f7 38		 sbc [$38],y
$09:ca6a  0f 30 3f c0   ora $c03f30
$09:ca6e  ff 00 94 00   sbc $009400,x
$09:ca72  dc 00 84	  jml [$8400]
$09:ca75  00 38		 brk #$38
$09:ca77  00 c0		 brk #$c0
$09:ca79  00 c0		 brk #$c0
$09:ca7b  00 00		 brk #$00
$09:ca7d  00 00		 brk #$00
$09:ca7f  00 ee		 brk #$ee
$09:ca81  5c 8d 78 eb   jml $eb788d
$09:ca85  39 ff 3e	  and $3eff,y
$09:ca88  96 3e		 stx $3e,y
$09:ca8a  e3 17		 sbc $17,s
$09:ca8c  ec 03 ff	  cpx $ff03
$09:ca8f  00 74		 brk #$74
$09:ca91  4f 70 0f 71   eor $710f70
$09:ca95  2f 76 3b 72   and $723b76
$09:ca99  1d 38 07	  ora $0738,x
$09:ca9c  1f 00 00 00   ora $000000,x
$09:caa0  f9 56 d7	  sbc $d756,y
$09:caa3  9c 91 1c	  stz $1c91
$09:caa6  35 38		 and $38,x
$09:caa8  63 78		 adc $78,s
$09:caaa  cf e0 2f c0   cmp $c02fe0
$09:caae  ff 00 4e f0   sbc $f04e00,x
$09:cab2  8e f4 0e	  stx $0ef4
$09:cab5  f0 2e		 beq $cae5
$09:cab7  d0 4c		 bne $cb05
$09:cab9  b0 18		 bcs $cad3
$09:cabb  e0 f0 00	  cpx #$00f0
$09:cabe  00 00		 brk #$00
$09:cac0  8b			phb
$09:cac1  79 89 78	  adc $7889,y
$09:cac4  c4 1c		 cpy $1c
$09:cac6  c1 3f		 cmp ($3f,x)
$09:cac8  e0 1f f0	  cpx #$f01f
$09:cacb  0b			phd
$09:cacc  fc 03 ff	  jsr ($ff03,x)
$09:cacf  00 47		 brk #$47
$09:cad1  01 47		 ora ($47,x)
$09:cad3  00 63		 brk #$63
$09:cad5  00 20		 brk #$20
$09:cad7  00 30		 brk #$30
$09:cad9  00 1c		 brk #$1c
$09:cadb  00 07		 brk #$07
$09:cadd  00 00		 brk #$00
$09:cadf  00 a7		 brk #$a7
$09:cae1  38			sec
$09:cae2  23 38		 and $38,s
$09:cae4  47 68		 eor [$68]
$09:cae6  1b			tcs
$09:cae7  fc 2f f0	  jsr ($f02f,x)
$09:caea  2f 40 bf 00   and $00bf40
$09:caee  ff 00 cc 00   sbc $00cc00,x
$09:caf2  cc 00 9e	  cpy $9e00
$09:caf5  00 1c		 brk #$1c
$09:caf7  18			clc
$09:caf8  38			sec
$09:caf9  20 f0 00	  jsr $00f0
$09:cafc  c0 00 00	  cpy #$0000
$09:caff  00 f1		 brk #$f1
$09:cb01  07 fb		 ora [$fb]
$09:cb03  07 e5		 ora [$e5]
$09:cb05  0e c8 1e	  asl $1ec8
$09:cb08  d1 3c		 cmp ($3c),y
$09:cb0a  a7 70		 lda [$70]
$09:cb0c  8f 60 ff 00   sta $00ff60
$09:cb10  0c 03 08	  tsb $0803
$09:cb13  07 11		 ora [$11]
$09:cb15  0e 23 1c	  asl $1c23
$09:cb18  06 38		 asl $38
$09:cb1a  08			php
$09:cb1b  70 10		 bvs $cb2d
$09:cb1d  60			rts
$09:cb1e  00 00		 brk #$00
$09:cb20  8b			phb
$09:cb21  f0 39		 beq $cb5c
$09:cb23  e4 47		 cpx $47
$09:cb25  b8			clv
$09:cb26  d7 00		 cmp [$00],y
$09:cb28  ff 00 ff 00   sbc $00ff00,x
$09:cb2c  ff 00 ff 00   sbc $00ff00,x
$09:cb30  3c c0 7e	  bit $7ec0,x
$09:cb33  a0 fc 00	  ldy #$00fc
$09:cb36  38			sec
$09:cb37  00 00		 brk #$00
$09:cb39  00 00		 brk #$00
$09:cb3b  00 00		 brk #$00
$09:cb3d  00 00		 brk #$00
$09:cb3f  00 87		 brk #$87
$09:cb41  18			clc
$09:cb42  c7 52		 cmp [$52]
$09:cb44  a1 72		 lda ($72,x)
$09:cb46  d3 3a		 cmp ($3a,s),y
$09:cb48  e4 1d		 cpx $1d
$09:cb4a  f9 07 fe	  sbc $fe07,y
$09:cb4d  01 ff		 ora ($ff,x)
$09:cb4f  00 66		 brk #$66
$09:cb51  00 2c		 brk #$2c
$09:cb53  00 0c		 brk #$0c
$09:cb55  00 04		 brk #$04
$09:cb57  00 02		 brk #$02
$09:cb59  00 00		 brk #$00
$09:cb5b  00 00		 brk #$00
$09:cb5d  00 00		 brk #$00
$09:cb5f  00 e5		 brk #$e5
$09:cb61  18			clc
$09:cb62  e5 18		 sbc $18
$09:cb64  c3 3e		 cmp $3e,s
$09:cb66  85 7e		 sta $7e
$09:cb68  03 f8		 ora $f8,s
$09:cb6a  0b			phd
$09:cb6b  fc 97 98	  jsr ($9897,x)
$09:cb6e  ff 00 02 00   sbc $000200,x
$09:cb72  02 00		 cop #$00
$09:cb74  00 00		 brk #$00
$09:cb76  00 00		 brk #$00
$09:cb78  04 00		 tsb $00
$09:cb7a  00 00		 brk #$00
$09:cb7c  60			rts
$09:cb7d  00 00		 brk #$00
$09:cb7f  00 f3		 brk #$f3
$09:cb81  30 fc		 bmi $cb7f
$09:cb83  3c de 3e	  bit $3ede,x
$09:cb86  de 3e ef	  dec $ef3e,x
$09:cb89  1f f7 0f fb   ora $fb0ff7,x
$09:cb8d  07 ff		 ora [$ff]
$09:cb8f  00 0f		 brk #$0f
$09:cb91  2d 03 12	  and $1203
$09:cb94  01 3f		 ora ($3f,x)
$09:cb96  01 3f		 ora ($3f,x)
$09:cb98  00 1f		 brk #$1f
$09:cb9a  00 0f		 brk #$0f
$09:cb9c  00 07		 brk #$07
$09:cb9e  00 00		 brk #$00
$09:cba0  fb			xce
$09:cba1  00 07		 brk #$07
$09:cba3  04 03		 tsb $03
$09:cba5  04 0f		 tsb $0f
$09:cba7  08			php
$09:cba8  1f 10 3f 20   ora $203f10,x
$09:cbac  ff c0 ff 00   sbc $00ffc0,x
$09:cbb0  fc d8 f8	  jsr ($f8d8,x)
$09:cbb3  24 f8		 bit $f8
$09:cbb5  fc f0 f8	  jsr ($f8f0,x)
$09:cbb8  e0 f0 c0	  cpx #$c0f0
$09:cbbb  e0 00 c0	  cpx #$c000
$09:cbbe  00 00		 brk #$00
$09:cbc0  f9 18 ee	  sbc $ee18,y
$09:cbc3  31 fe		 and ($fe),y
$09:cbc5  21 ee		 and ($ee,x)
$09:cbc7  32 f3		 and ($f3)
$09:cbc9  1d fc 0f	  ora $0ffc,x
$09:cbcc  fd 03 ff	  sbc $ff03,x
$09:cbcf  00 07		 brk #$07
$09:cbd1  00 00		 brk #$00
$09:cbd3  00 00		 brk #$00
$09:cbd5  00 01		 brk #$01
$09:cbd7  00 00		 brk #$00
$09:cbd9  00 00		 brk #$00
$09:cbdb  00 00		 brk #$00
$09:cbdd  00 00		 brk #$00
$09:cbdf  00 ff		 brk #$ff
$09:cbe1  58			cli
$09:cbe2  e7 c8		 sbc [$c8]
$09:cbe4  8f 48 ef 88   sta $88ef48
$09:cbe8  7f 88 e7 18   adc $18e788,x
$09:cbec  ef f0 ff 00   sbc $00fff0
$09:cbf0  e0 40 f0	  cpx #$f040
$09:cbf3  c0 30 00	  cpy #$0030
$09:cbf6  10 00		 bpl $cbf8
$09:cbf8  00 00		 brk #$00
$09:cbfa  00 00		 brk #$00
$09:cbfc  00 00		 brk #$00
$09:cbfe  00 00		 brk #$00
$09:cc00  ff 00 f6 01   sbc $01f600,x
$09:cc04  e3 00		 sbc $00,s
$09:cc06  d3 08		 cmp ($08,s),y
$09:cc08  f9 44 df	  sbc $df44,y
$09:cc0b  40			rti
$09:cc0c  d5 72		 cmp $72,x
$09:cc0e  80 78		 bra $cc88
$09:cc10  00 00		 brk #$00
$09:cc12  0f 0f 1f 1f   ora $1f1f0f
$09:cc16  3f 3f 3f 7f   and $7f3f3f,x
$09:cc1a  3f 7f 0f 7f   and $7f0f7f,x
$09:cc1e  07 7f		 ora [$7f]
$09:cc20  ff 00 3f c0   sbc $c03f00,x
$09:cc24  bf 60 df 30   lda $30df60,x
$09:cc28  fb			xce
$09:cc29  18			clc
$09:cc2a  cf 30 29 ca   cmp $ca2930
$09:cc2e  5f 1e 00 00   eor $00001e,x
$09:cc32  e0 e0 f0	  cpx #$f0e0
$09:cc35  f0 f8		 beq $cc2f
$09:cc37  f8			sed
$09:cc38  fc fc fc	  jsr ($fcfc,x)
$09:cc3b  fc f4 fe	  jsr ($fef4,x)
$09:cc3e  e0 fe ff	  cpx #$fffe
$09:cc41  00 fb		 brk #$fb
$09:cc43  10 dd		 bpl $cc22
$09:cc45  00 a9		 brk #$a9
$09:cc47  0e ff 01	  asl $01ff
$09:cc4a  ea			nop
$09:cc4b  01 ef		 ora ($ef,x)
$09:cc4d  1e db 30	  asl $30db,x
$09:cc50  00 00		 brk #$00
$09:cc52  0c 1c 3e	  tsb $3e1c
$09:cc55  3e 70 7e	  rol $7e70,x
$09:cc58  00 01		 brk #$01
$09:cc5a  1c 1d 30	  trb $301d
$09:cc5d  3e 6c 7c	  rol $7c6c,x
$09:cc60  ff 00 b3 00   sbc $00b300,x
$09:cc64  57 18		 eor [$18],y
$09:cc66  7f 80 d7 00   adc $00d780,x
$09:cc6a  a7 38		 lda [$38]
$09:cc6c  2b			pld
$09:cc6d  8c db 80	  sty $80db
$09:cc70  00 00		 brk #$00
$09:cc72  7c 7c e0	  jmp ($e07c,x)
$09:cc75  f8			sed
$09:cc76  00 80		 brk #$80
$09:cc78  38			sec
$09:cc79  38			sec
$09:cc7a  4c 7c 76	  jmp $767c
$09:cc7d  fe 3e be	  inc $be3e,x
$09:cc80  3e 7e 55	  rol $557e,x
$09:cc83  3b			tsc
$09:cc84  41 3f		 eor ($3f,x)
$09:cc86  63 1f		 adc $1f,s
$09:cc88  45 3b		 eor $3b
$09:cc8a  51 2f		 eor ($2f),y
$09:cc8c  7f 00 00 00   adc $000000,x
$09:cc90  01 ff		 ora ($ff,x)
$09:cc92  00 ff		 brk #$ff
$09:cc94  00 ff		 brk #$ff
$09:cc96  00 ff		 brk #$ff
$09:cc98  00 ff		 brk #$ff
$09:cc9a  00 ff		 brk #$ff
$09:cc9c  00 ff		 brk #$ff
$09:cc9e  00 ff		 brk #$ff
$09:cca0  73 70		 adc ($70,s),y
$09:cca2  8c e6 d2	  sty $d2e6
$09:cca5  a2 6b 53	  ldx #$536b
$09:cca8  bf 2d e5 c3   lda $c3e52d,x
$09:ccac  59 97 71	  eor $7197,y
$09:ccaf  e7 8f		 sbc [$8f]
$09:ccb1  ff 19 ff 05   sbc $05ff19,x
$09:ccb5  ff 84 ff c0   sbc $c0ff84,x
$09:ccb9  ff 00 ff e0   sbc $e0ff00,x
$09:ccbd  ff 00 ff ea   sbc $eaff00,x
$09:ccc1  fa			plx
$09:ccc2  6e 7e d7	  ror $d77e
$09:ccc5  ff e9 71 dc   sbc $dc71e9,x
$09:ccc9  ae eb ff	  ldx $ffeb
$09:cccc  5e fe df	  lsr $dffe,x
$09:cccf  7f e6 1d 22   adc $221de6,x
$09:ccd3  dd 47 b8	  cmp $b847,x
$09:ccd6  07 fe		 ora [$fe]
$09:ccd8  81 7f		 sta ($7f,x)
$09:ccda  e2 1d		 sep #$1d
$09:ccdc  45 bb		 eor $bb
$09:ccde  47 b8		 eor [$b8]
$09:cce0  f7 57		 sbc [$57],y
$09:cce2  75 54		 adc $54,x
$09:cce4  ea			nop
$09:cce5  fa			plx
$09:cce6  d6 ce		 dec $ce,x
$09:cce8  6b			rtl
$09:cce9  e7 f7		 sbc [$f7]
$09:cceb  57 3b		 eor [$3b],y
$09:cced  6a			ror a
$09:ccee  fb			xce
$09:ccef  ea			nop
$09:ccf0  4f b8 4f bb   eor $bb4fb8
$09:ccf4  e7 1d		 sbc [$1d]
$09:ccf6  a1 7f		 lda ($7f,x)
$09:ccf8  11 fe		 ora ($fe),y
$09:ccfa  4f b8 26 dd   eor $dd26b8
$09:ccfe  e6 1d		 inc $1d
$09:cd00  26 d8		 rol $d8
$09:cd02  65 01		 adc $01
$09:cd04  35 ef		 and $ef,x
$09:cd06  aa			tax
$09:cd07  03 05		 ora $05,s
$09:cd09  fe b6 4b	  inc $4bb6,x
$09:cd0c  ca			dex
$09:cd0d  03 25		 ora $25,s
$09:cd0f  3e ff ff	  rol $ffff,x
$09:cd12  fe ff 01	  inc $01ff,x
$09:cd15  fe 1c ff	  inc $ff1c,x
$09:cd18  00 ff		 brk #$ff
$09:cd1a  dc ff fc	  jml [$fcff]
$09:cd1d  ff c0 ff 9c   sbc $9cffc0,x
$09:cd21  7c 39 07	  jmp ($0739,x)
$09:cd24  ce 3e 86	  dec $863e
$09:cd27  7e 9e 6e	  ror $6e9e,x
$09:cd2a  8b			phb
$09:cd2b  7f ce 3e c6   adc $c63ece,x
$09:cd2f  3e 03 ff	  rol $ff03,x
$09:cd32  00 ff		 brk #$ff
$09:cd34  01 ff		 ora ($ff,x)
$09:cd36  01 ff		 ora ($ff,x)
$09:cd38  01 ff		 ora ($ff,x)
$09:cd3a  00 ff		 brk #$ff
$09:cd3c  01 ff		 ora ($ff,x)
$09:cd3e  01 ff		 ora ($ff,x)
$09:cd40  b4 0b		 ldy $0b,x
$09:cd42  e8			inx
$09:cd43  e8			inx
$09:cd44  17 00		 ora [$00],y
$09:cd46  3f 20 1f 00   and $001f20,x
$09:cd4a  0f 00 1f 00   ora $001f00
$09:cd4e  9b			txy
$09:cd4f  80 ff		 bra $cd50
$09:cd51  ff 17 ff ff   sbc $ffff17,x
$09:cd55  ff df ff ff   sbc $ffffdf,x
$09:cd59  ff ff ff ff   sbc $ffffff,x
$09:cd5d  ff 7f ff 25   sbc $25ff7f,x
$09:cd61  da			phx
$09:cd62  64 00		 stz $00
$09:cd64  0b			phd
$09:cd65  f0 25		 beq $cd8c
$09:cd67  03 d0		 ora $d0,s
$09:cd69  45 fe		 eor $fe
$09:cd6b  35 a5		 and $a5,x
$09:cd6d  34 c3		 bit $c3,x
$09:cd6f  e7 ff		 sbc [$ff]
$09:cd71  ff ff ff 00   sbc $00ffff,x
$09:cd75  ff 60 ff 33   sbc $33ff60,x
$09:cd79  ff 03 ff c3   sbc $c3ff03,x
$09:cd7d  ff 00 ff aa   sbc $aaff00,x
$09:cd81  4b			phk
$09:cd82  aa			tax
$09:cd83  4b			phk
$09:cd84  aa			tax
$09:cd85  4b			phk
$09:cd86  aa			tax
$09:cd87  4b			phk
$09:cd88  aa			tax
$09:cd89  4b			phk
$09:cd8a  aa			tax
$09:cd8b  4b			phk
$09:cd8c  aa			tax
$09:cd8d  4b			phk
$09:cd8e  aa			tax
$09:cd8f  4b			phk
$09:cd90  14 ff		 trb $ff
$09:cd92  14 ff		 trb $ff
$09:cd94  14 ff		 trb $ff
$09:cd96  14 ff		 trb $ff
$09:cd98  14 ff		 trb $ff
$09:cd9a  14 ff		 trb $ff
$09:cd9c  14 ff		 trb $ff
$09:cd9e  14 ff		 trb $ff
$09:cda0  24 db		 bit $db
$09:cda2  26 00		 rol $00
$09:cda4  44 ff ad	  mvp $ad,$ff
$09:cda7  20 52 b1	  jsr $b152
$09:cdaa  2d dc 47	  and $47dc
$09:cdad  2f b7 c5 ff   and $ffc5b7
$09:cdb1  ff ff ff 00   sbc $00ffff,x
$09:cdb5  ff 18 ff 0e   sbc $0eff18,x
$09:cdb9  ff 03 ff 80   sbc $80ff03,x
$09:cdbd  ff 18 ff 8a   sbc $8aff18,x
$09:cdc1  69 b7 34	  adc #$34b7
$09:cdc4  2b			pld
$09:cdc5  e8			inx
$09:cdc6  74 14		 stz $14,x
$09:cdc8  d7 48		 cmp [$48],y
$09:cdca  0b			phd
$09:cdcb  bb			tyx
$09:cdcc  f4 9b ef	  pea $ef9b
$09:cdcf  90 f7		 bcc $cdc8
$09:cdd1  ff c8 ff 13   sbc $13ffc8,x
$09:cdd5  ff 20 ff 20   sbc $20ff20,x
$09:cdd9  ff 40 ff 43   sbc $43ff40,x
$09:cddd  ff 44 ff 56   sbc $56ff44,x
$09:cde1  99 e9 28	  sta $28e9,y
$09:cde4  76 97		 ror $97,x
$09:cde6  bd 48 91	  lda $9148,x
$09:cde9  2a			rol a
$09:cdea  e4 45		 cpx $45
$09:cdec  fb			xce
$09:cded  15 6f		 ora $6f,x
$09:cdef  31 ef		 and ($ef),y
$09:cdf1  ff 17 ff 88   sbc $88ff17,x
$09:cdf5  ff c4 ff d4   sbc $d4ffc4,x
$09:cdf9  ff 92 ff a2   sbc $a2ff92,x
$09:cdfd  ff c2 ff 84   sbc $84ffc2,x
$09:ce01  7c 80 7c	  jmp ($7c80,x)
$09:ce04  82 7e c0	  brl $8e85
$09:ce07  3e e1 1f	  rol $1fe1,x
$09:ce0a  f0 0f		 beq $ce1b
$09:ce0c  fc 03 ff	  jsr ($ff03,x)
$09:ce0f  00 03		 brk #$03
$09:ce11  7f 03 7f 01   adc $017f03,x
$09:ce15  7f 01 3f 00   adc $003f01,x
$09:ce19  1f 00 0f 00   ora $000f00,x
$09:ce1d  03 00		 ora $00,s
$09:ce1f  00 7f		 brk #$7f
$09:ce21  3e e7 6e	  rol $6ee7,x
$09:ce24  71 76		 adc ($76),y
$09:ce26  fb			xce
$09:ce27  fc f7 f8	  jsr ($f8f7,x)
$09:ce2a  df e0 bf c0   cmp $c0bfe0,x
$09:ce2e  ff 00 c0 fe   sbc $fec000,x
$09:ce32  90 fe		 bcc $ce32
$09:ce34  88			dey
$09:ce35  fe 00 fc	  inc $fc00,x
$09:ce38  00 f8		 brk #$f8
$09:ce3a  00 e0		 brk #$e0
$09:ce3c  00 c0		 brk #$c0
$09:ce3e  00 00		 brk #$00
$09:ce40  f7 02		 sbc [$02],y
$09:ce42  fd 06 fa	  sbc $fa06,x
$09:ce45  06 f8		 asl $f8
$09:ce47  07 f9		 ora [$f9]
$09:ce49  02 fa		 cop #$fa
$09:ce4b  09 f2 14	  ora #$14f2
$09:ce4e  ff 00 78 7a   sbc $7a7800,x
$09:ce52  00 02		 brk #$02
$09:ce54  01 00		 ora ($00,x)
$09:ce56  00 04		 brk #$04
$09:ce58  04 06		 tsb $06
$09:ce5a  04 0d		 tsb $0d
$09:ce5c  09 1d 00	  ora #$001d
$09:ce5f  00 57		 brk #$57
$09:ce61  20 df b0	  jsr $b0df
$09:ce64  2f 30 17 f8   and $f81730
$09:ce68  ff a8 cf 90   sbc $90cfa8,x
$09:ce6c  6f a0 ff 00   adc $00ffa0
$09:ce70  8e ae 00	  stx $00ae
$09:ce73  a0 c0		 ldy #$c0
$09:ce75  00 00		 brk #$00
$09:ce77  18			clc
$09:ce78  00 a8		 brk #$a8
$09:ce7a  20 b0 10	  jsr $10b0
$09:ce7d  b0 00		 bcs $ce7f
$09:ce7f  00 7e		 brk #$7e
$09:ce81  81 7c		 sta ($7c,x)
$09:ce83  82 78 84	  brl $52fe
$09:ce86  70 88		 bvs $ce10
$09:ce88  60			rts
$09:ce89  90 40		 bcc $cecb
$09:ce8b  a0 00		 ldy #$00
$09:ce8d  c0 00		 cpy #$00
$09:ce8f  ff ff 80 ff   sbc $ff80ff,x
$09:ce93  80 ff		 bra $ce94
$09:ce95  80 ff		 bra $ce96
$09:ce97  80 ff		 bra $ce98
$09:ce99  80 ff		 bra $ce9a
$09:ce9b  80 ff		 bra $ce9c
$09:ce9d  c0 ff		 cpy #$ff
$09:ce9f  ff 53 90 ea   sbc $ea9053,x
$09:cea3  26 b4		 rol $b4
$09:cea5  92 39		 sta ($39)
$09:cea7  6f 03 89 75   adc $758903
$09:ceab  37 24		 and [$24],y
$09:cead  81 6c		 sta ($6c,x)
$09:ceaf  49 6f ff	  eor #$ff6f
$09:ceb2  11 ff		 ora ($ff),y
$09:ceb4  89 7f 00	  bit #$007f
$09:ceb7  ff 64 ff d0   sbc $d0ff64,x
$09:cebb  ef d2 ff 92   sbc $92ffd2
$09:cebf  ff f7 57 75   sbc $7557f7,x
$09:cec3  54 ea fa	  mvn $fa,$ea
$09:cec6  d6 ce		 dec $ce,x
$09:cec8  6b			rtl
$09:cec9  e7 f7		 sbc [$f7]
$09:cecb  57 3b		 eor [$3b],y
$09:cecd  6a			ror a
$09:cece  fb			xce
$09:cecf  ea			nop
$09:ced0  4f b8 4f bb   eor $bb4fb8
$09:ced4  e7 1d		 sbc [$1d]
$09:ced6  a1 7f		 lda ($7f,x)
$09:ced8  11 fe		 ora ($fe),y
$09:ceda  4f b8 26 dd   eor $dd26b8
$09:cede  e6 1d		 inc $1d
$09:cee0  ea			nop
$09:cee1  fa			plx
$09:cee2  6e 7e df	  ror $df7e
$09:cee5  ff f9 71 dc   sbc $dc71f9,x
$09:cee9  ae eb ff	  ldx $ffeb
$09:ceec  76 de		 ror $de,x
$09:ceee  f7 5f		 sbc [$5f],y
$09:cef0  e6 1d		 inc $1d
$09:cef2  22 dd 47 b8   jsl $b847dd
$09:cef6  07 fe		 ora [$fe]
$09:cef8  81 7f		 sta ($7f,x)
$09:cefa  e2 1d		 sep #$1d
$09:cefc  45 bb		 eor $bb
$09:cefe  47 b8		 eor [$b8]
$09:cf00  f6 cb		 inc $cb,x
$09:cf02  aa			tax
$09:cf03  03 ba		 ora $ba,s
$09:cf05  53 45		 eor ($45,s),y
$09:cf07  1f 5b 01 4d   ora $4d015b,x
$09:cf0b  ff ab 54 00   sbc $0054ab,x
$09:cf0f  00 1c		 brk #$1c
$09:cf11  ff 1c ff 8c   sbc $8cff1c,x
$09:cf15  ff 81 fe fe   sbc $fefe81,x
$09:cf19  ff 00 ff 00   sbc $00ff00,x
$09:cf1d  ff 00 ff f9   sbc $f9ff00,x
$09:cf21  07 9c		 ora [$9c]
$09:cf23  03 52		 ora $52,s
$09:cf25  2f af 5f de   and $de5faf
$09:cf29  2e c7 3f	  rol $3fc7
$09:cf2c  6a			ror a
$09:cf2d  1e 15 0b	  asl $0b15,x
$09:cf30  00 ff		 brk #$ff
$09:cf32  00 ff		 brk #$ff
$09:cf34  00 ff		 brk #$ff
$09:cf36  00 ff		 brk #$ff
$09:cf38  01 ff		 ora ($ff,x)
$09:cf3a  00 ff		 brk #$ff
$09:cf3c  01 ff		 ora ($ff,x)
$09:cf3e  00 ff		 brk #$ff
$09:cf40  e0 e0		 cpx #$e0
$09:cf42  3a			dec a
$09:cf43  fa			plx
$09:cf44  8f 80 1e 01   sta $011e80
$09:cf48  18			clc
$09:cf49  07 1c		 ora [$1c]
$09:cf4b  03 8f		 ora $8f,s
$09:cf4d  80 50		 bra $cf9f
$09:cf4f  d0 1f		 bne $cf70
$09:cf51  ff 05 ff 7f   sbc $7fff05,x
$09:cf55  ff ff ff ff   sbc $ffffff,x
$09:cf59  ff ff ff 7f   sbc $7fffff,x
$09:cf5d  ff 2f ff 89   sbc $89ff2f,x
$09:cf61  03 24		 ora $24,s
$09:cf63  08			php
$09:cf64  e1 e6		 sbc ($e6,x)
$09:cf66  f1 33		 sbc ($33),y
$09:cf68  5a			phy
$09:cf69  00 5d		 brk #$5d
$09:cf6b  ff ab 54 00   sbc $0054ab,x
$09:cf6f  00 00		 brk #$00
$09:cf71  ff e0 ff 10   sbc $10ffe0,x
$09:cf75  ff 00 ff ff   sbc $ffff00,x
$09:cf79  ff 00 ff 00   sbc $00ff00,x
$09:cf7d  ff 00 ff aa   sbc $aaff00,x
$09:cf81  4b			phk
$09:cf82  95 8e		 sta $8e,x
$09:cf84  d5 61		 cmp $61,x
$09:cf86  aa			tax
$09:cf87  4b			phk
$09:cf88  aa			tax
$09:cf89  4b			phk
$09:cf8a  aa			tax
$09:cf8b  4b			phk
$09:cf8c  aa			tax
$09:cf8d  4b			phk
$09:cf8e  aa			tax
$09:cf8f  4b			phk
$09:cf90  14 ff		 trb $ff
$09:cf92  80 7f		 bra $d013
$09:cf94  1e ff 14	  asl $14ff,x
$09:cf97  ff 14 ff 14   sbc $14ff14,x
$09:cf9b  ff 14 ff 14   sbc $14ff14,x
$09:cf9f  ff 4a 8d b5   sbc $b58d4a,x
$09:cfa3  38			sec
$09:cfa4  6d 72 b2	  adc $b272
$09:cfa7  cc 5a 00	  cpy $005a
$09:cfaa  b2 ff		 lda ($ff)
$09:cfac  d5 2a		 cmp $2a,x
$09:cfae  00 00		 brk #$00
$09:cfb0  70 ff		 bvs $cfb1
$09:cfb2  c0 ff		 cpy #$ff
$09:cfb4  81 ff		 sta ($ff,x)
$09:cfb6  01 ff		 ora ($ff,x)
$09:cfb8  ff ff 00 ff   sbc $ff00ff,x
$09:cfbc  00 ff		 brk #$ff
$09:cfbe  00 ff		 brk #$ff
$09:cfc0  e7 81		 sbc [$81]
$09:cfc2  1c a8 cf	  trb $cfa8
$09:cfc5  54 35 68	  mvn $68,$35
$09:cfc8  ee 46 d5	  inc $d546
$09:cfcb  8b			phb
$09:cfcc  20 c0 00	  jsr $00c0
$09:cfcf  00 48		 brk #$48
$09:cfd1  ff 47 ff 20   sbc $20ff47,x
$09:cfd5  ff 93 ff b9   sbc $b9ff93,x
$09:cfd9  ff 28 ff 08   sbc $08ff28,x
$09:cfdd  ff 00 ff b9   sbc $b9ff00,x
$09:cfe1  c9 c4 e9	  cmp #$e9c4
$09:cfe4  3a			dec a
$09:cfe5  f7 1e		 sbc [$1e],y
$09:cfe7  a4 e2		 ldy $e2
$09:cfe9  44 a1 f3	  mvp $f3,$a1
$09:cfec  21 0e		 and ($0e,x)
$09:cfee  00 00		 brk #$00
$09:cff0  02 ff		 cop #$ff
$09:cff2  12 ff		 ora ($ff)
$09:cff4  00 ff		 brk #$ff
$09:cff6  c9 ff 9d	  cmp #$9dff
$09:cff9  ff 14 ff 10   sbc $10ff14,x
$09:cffd  ff 00 ff 00   sbc $00ff00,x
$09:d001  20 80 3b	  jsr $3b80
$09:d004  d6 07		 dec $07,x
$09:d006  00 87		 brk #$87
$09:d008  be 06 3e	  ldx $3e06,y
$09:d00b  ef 67 a9 43   sbc $43a967
$09:d00f  60			rts
$09:d010  10 88		 bpl $cf9a
$09:d012  04 71		 tsb $71
$09:d014  de d8 08	  dec $08d8,x
$09:d017  06 82		 asl $82
$09:d019  81 c0		 sta ($c0,x)
$09:d01b  90 74		 bcc $d091
$09:d01d  1d ce 16	  ora $16ce,x
$09:d020  1f 00 a4 6e   ora $6ea400,x
$09:d024  0f 16 83 40   ora $408316
$09:d028  e3 f0		 sbc $f0,s
$09:d02a  81 c8		 sta ($c8,x)
$09:d02c  c1 1e		 cmp ($1e,x)
$09:d02e  2c 3e 08	  bit $083e
$09:d031  a1 20		 lda ($20,x)
$09:d033  24 11		 bit $11
$09:d035  8b			phb
$09:d036  00 45		 brk #$45
$09:d038  b8			clv
$09:d039  18			clc
$09:d03a  0f 84 80 b2   ora $b28084
$09:d03e  34 00		 bit $00,x
$09:d040  8b			phb
$09:d041  17 82		 ora [$82],y
$09:d043  a0 68		 ldy #$68
$09:d045  08			php
$09:d046  44 c2 18	  mvp $18,$c2
$09:d049  ef 08 3b e0   sbc $e03b08
$09:d04d  60			rts
$09:d04e  f0 83		 beq $cfd3
$09:d050  b0 42		 bcs $d094
$09:d052  e1 47		 sbc ($47,x)
$09:d054  90 82		 bcc $cfd8
$09:d056  c1 9d		 cmp ($9d,x)
$09:d058  ec 71 01	  cpx $0171
$09:d05b  f0 0f		 beq $d06c
$09:d05d  93 80		 sta ($80,s),y
$09:d05f  29 10 d8	  and #$d810
$09:d062  3b			tsc
$09:d063  43 40		 eor $40,s
$09:d065  99 10 d0	  sta $d010,y
$09:d068  3b			tsc
$09:d069  d9 22 05	  cmp $0522,y
$09:d06c  e0 2f		 cpx #$2f
$09:d06e  14 66		 trb $66
$09:d070  1f 33 8a 50   ora $508a33,x
$09:d074  e3 7a		 sbc $7a,s
$09:d076  59 b7 4e	  eor $4eb7,y
$09:d079  c9 fe aa	  cmp #$aafe
$09:d07c  ea			nop
$09:d07d  a9 9a 6b	  lda #$6b9a
$09:d080  db			stp
$09:d081  e0 21		 cpx #$21
$09:d083  11 c9		 ora ($c9),y
$09:d085  24 fe		 bit $fe
$09:d087  91 7e		 sta ($7e),y
$09:d089  84 5b		 sty $5b
$09:d08b  21 15		 and ($15,x)
$09:d08d  d8			cld
$09:d08e  bd 7e 09	  lda $097e,x
$09:d091  7f ac 70 30   adc $3070ac,x
$09:d095  96 09		 stx $09,y
$09:d097  74 63		 stz $63,x
$09:d099  67 60		 adc [$60]
$09:d09b  b2 fb		 lda ($fb)
$09:d09d  39 3d cb	  and $cb3d,y
$09:d0a0  bc b3 57	  ldy $57b3,x
$09:d0a3  a4 98		 ldy $98
$09:d0a5  7c 23 17	  jmp ($1723,x)
$09:d0a8  8f 27 f2 3d   sta $3df227
$09:d0ac  7e 89 7f	  ror $7f89,x
$09:d0af  a6 5f		 ldx $5f
$09:d0b1  ef d7 fa fd   sbc $fdfad7
$09:d0b5  fe 81 c0	  inc $c081,x
$09:d0b8  e1 67		 sbc ($67,x)
$09:d0ba  60			rts
$09:d0bb  83 c5		 sta $c5,s
$09:d0bd  e1 f6		 sbc ($f6,x)
$09:d0bf  fa			plx
$09:d0c0  fc 7e 7f	  jsr ($7f7e,x)
$09:d0c3  df df be c0   cmp $c0bedf,x
$09:d0c7  68			pla
$09:d0c8  10 78		 bpl $d142
$09:d0ca  7c 7d f2	  jmp ($f27d,x)
$09:d0cd  00 50		 brk #$50
$09:d0cf  bf 82 07 fe   lda $fe0782,x
$09:d0d3  0b			phd
$09:d0d4  0c 06 03	  tsb $0306
$09:d0d7  40			rti
$09:d0d8  97 0e		 sta [$0e],y
$09:d0da  07 43		 ora [$43]
$09:d0dc  c1 ec		 cmp ($ec,x)
$09:d0de  fa			plx
$09:d0df  7c 3f 1f	  jmp ($1f3f,x)
$09:d0e2  6f d0 6c 0c   adc $0c6cd0
$09:d0e6  81 c0		 sta ($c0,x)
$09:d0e8  f0 7c		 beq $d166
$09:d0ea  03 20		 ora $20,s
$09:d0ec  25 0f		 and $0f
$09:d0ee  e0 a0		 cpx #$a0
$09:d0f0  7f c2 b0 4f   adc $4fb0c2,x
$09:d0f4  b2 20		 lda ($20)
$09:d0f6  07 01		 ora [$01]
$09:d0f8  0e 8f 8e	  asl $8e8f
$09:d0fb  00 61		 brk #$61
$09:d0fd  30 40		 bmi $d13f
$09:d0ff  18			clc
$09:d100  0f 61 3e aa   ora $aa3e61
$09:d104  b2 29		 lda ($29)
$09:d106  d1 79		 cmp ($79),y
$09:d108  22 07 40 9c   jsl $9c4007
$09:d10c  5f 0e 80 73   eor $73800e,x
$09:d110  04 fa		 tsb $fa
$09:d112  1d 06 21	  ora $2106,x
$09:d115  7c 3c 09	  jmp ($093c,x)
$09:d118  e4 51		 cpx $51
$09:d11a  be 9e f5	  ldx $f59e,y
$09:d11d  7f b0 3d a3   adc $a33db0,x
$09:d121  e4 fa		 cpx $fa
$09:d123  8b			phb
$09:d124  c2 23		 rep #$23
$09:d126  d0 18		 bne $d140
$09:d128  ec 0a 15	  cpx $150a
$09:d12b  17 83		 ora [$83],y
$09:d12d  c3 61		 cmp $61,s
$09:d12f  d0 58		 bne $d189
$09:d131  1c 1e 01	  trb $011e
$09:d134  03 80		 ora $80,s
$09:d136  47 e0		 eor [$e0]
$09:d138  10 b8		 bpl $d0f2
$09:d13a  14 4e		 trb $4e
$09:d13c  2f 17 86 c3   and $c38617
$09:d140  c0 e1		 cpy #$e1
$09:d142  07 83		 ora [$83]
$09:d144  c0 e0		 cpy #$e0
$09:d146  79 0a 04	  adc $040a,y
$09:d149  42 41		 wdm #$41
$09:d14b  30 e0		 bmi $d12d
$09:d14d  78			sei
$09:d14e  22 18 0b 07   jsl $070b18
$09:d152  82 81 80	  brl $51d6
$09:d155  e0 40		 cpx #$40
$09:d157  30 12		 bmi $d16b
$09:d159  0f 87 03 e1   ora $e10387
$09:d15d  00 f8		 brk #$f8
$09:d15f  64 3e		 stz $3e
$09:d161  01 80		 ora ($80,x)
$09:d163  0c 07 03	  tsb $0307
$09:d166  81 80		 sta ($80,x)
$09:d168  c0 00		 cpy #$00
$09:d16a  02 05		 cop #$05
$09:d16c  02 91		 cop #$91
$09:d16e  44 a2 f2	  mvp $f2,$a2
$09:d171  04 5b		 tsb $5b
$09:d173  47 2c		 eor [$2c]
$09:d175  11 e9		 ora ($e9),y
$09:d177  0c ba 43	  tsb $43ba
$09:d17a  30 98		 bmi $d114
$09:d17c  22 d8 44 02   jsl $0244d8
$09:d180  d0 c4		 bne $d146
$09:d182  64 3a		 stz $3a
$09:d184  10 84		 bpl $d10a
$09:d186  5b			tcd
$09:d187  5c 21 9f 08   jml $089f21
$09:d18b  47 a2		 eor [$a2]
$09:d18d  11 18		 ora ($18),y
$09:d18f  8c 22 da	  sty $da22
$09:d192  3b			tsc
$09:d193  06 9a		 asl $9a
$09:d195  c3 a7		 cmp $a7,s
$09:d197  f0 c9		 beq $d162
$09:d199  dc 30 00	  jml [$0030]
$09:d19c  0f c0 73 1c   ora $1c73c0
$09:d1a0  1a			inc a
$09:d1a1  1d 00 86	  ora $8600,x
$09:d1a4  20 85 cc	  jsr $cc85
$09:d1a7  d7 0e		 cmp [$0e],y
$09:d1a9  05 63		 ora $63
$09:d1ab  c1 f8		 cmp ($f8,x)
$09:d1ad  b0 6e		 bcs $d21d
$09:d1af  2c 02 20	  bit $2002
$09:d1b2  0e 03 98	  asl $9803
$09:d1b5  c2 81		 rep #$81
$09:d1b7  00 b0		 brk #$b0
$09:d1b9  28			plp
$09:d1ba  85 cc		 sta $cc
$09:d1bc  d9 99 57	  cmp $5799,y
$09:d1bf  3e a9 62	  rol $62a9,x
$09:d1c2  92 dc		 sta ($dc)
$09:d1c4  62 17 b3	  per $84de
$09:d1c7  a0 41		 ldy #$41
$09:d1c9  23 8f		 and $8f,s
$09:d1cb  b1 a2		 lda ($a2),y
$09:d1cd  5b			tcd
$09:d1ce  a5 17		 lda $17
$09:d1d0  c8			iny
$09:d1d1  c4 f6		 cpy $f6
$09:d1d3  1e 00 04	  asl $0400,x
$09:d1d6  18			clc
$09:d1d7  41 1f		 eor ($1f,x)
$09:d1d9  a3 00		 lda $00,s
$09:d1db  db			stp
$09:d1dc  d4 ab		 pei ($ab)
$09:d1de  bd 4e d7	  lda $d74e,x
$09:d1e1  a2 ed		 ldx #$ed
$09:d1e3  30 9f		 bmi $d184
$09:d1e5  74 2f		 stz $2f,x
$09:d1e7  9a			txs
$09:d1e8  0f c2 80 67   ora $6780c2
$09:d1ec  d7 e9		 cmp [$e9],y
$09:d1ee  f7 fa		 sbc [$fa],y
$09:d1f0  39 fc fc	  and $fcfc,y
$09:d1f3  7e 20 1d	  ror $1d20,x
$09:d1f6  08			php
$09:d1f7  06 81		 asl $81
$09:d1f9  30 5d		 bmi $d258
$09:d1fb  fd fc 7e	  sbc $7efc,x
$09:d1fe  7f 6f af c5   adc $c5af6f,x
$09:d202  e1 f0		 sbc ($f0,x)
$09:d204  88			dey
$09:d205  3c 2e 10	  bit $102e,x
$09:d208  0d 05 30	  ora $3005
$09:d20b  5f ff f7 fb   eor $fbf7ff,x
$09:d20f  fc fc 04	  jsr ($04fc,x)
$09:d212  13 f8		 ora ($f8,s),y
$09:d214  fc 7e 0f	  jsr ($0f7e,x)
$09:d217  0f 65 97 db   ora $db9765
$09:d21b  f5 f0		 sbc $f0,x
$09:d21d  fc 7b 3e	  jsr ($3e7b,x)
$09:d220  9d 0f 04	  sta $040f,x
$09:d223  83 81		 sta $81,s
$09:d225  a0 90		 ldy #$90
$09:d227  0b			phd
$09:d228  41 4c		 eor ($4c,x)
$09:d22a  1f cf f7 f1   ora $f1f7cf,x
$09:d22e  c8			iny
$09:d22f  0e 41 f8	  asl $f841
$09:d232  7c 14 02	  jmp ($0214,x)
$09:d235  1c 16 48	  trb $4816
$09:d238  c0 20		 cpy #$20
$09:d23a  2c c1 53	  bit $53c1
$09:d23d  34 10		 bit $10,x
$09:d23f  60			rts
$09:d240  2f b2 53 35   and $3553b2
$09:d244  00 9e		 brk #$9e
$09:d246  1e 00 88	  asl $8800,x
$09:d249  14 40		 trb $40
$09:d24b  9e 04 e0	  stz $e004,x
$09:d24e  25 a7		 and $a7
$09:d250  81 24		 sta ($24,x)
$09:d252  1f 83 08 13   ora $130883,x
$09:d256  c4 b4		 cpy $b4
$09:d258  66 ef		 ror $ef
$09:d25a  3f fc 02 20   and $2002fc,x
$09:d25e  92 19		 sta ($19)
$09:d260  c5 f3		 cmp $f3
$09:d262  fc 95 04	  jsr ($0495,x)
$09:d265  90 24		 bcc $d28b
$09:d267  41 20		 eor ($20,x)
$09:d269  b3 8f		 lda ($8f,s),y
$09:d26b  f7 f9		 sbc [$f9],y
$09:d26d  4a			lsr a
$09:d26e  09 22 23	  ora #$2322
$09:d271  3a			dec a
$09:d272  df d9 1e d9   cmp $d91ed9,x
$09:d276  f2 33		 sbc ($33)
$09:d278  6f f0 12 09   adc $0912f0
$09:d27c  03 8a		 ora $8a,s
$09:d27e  af f0 08 fb   lda $fb08f0
$09:d282  8a			txa
$09:d283  ff 30 18 2c   sbc $2c1830,x
$09:d287  16 03		 asl $03,x
$09:d289  01 23		 ora ($23,x)
$09:d28b  34 0a		 bit $0a,x
$09:d28d  05 fe		 ora $fe
$09:d28f  81 fe		 sta ($fe,x)
$09:d291  a0 70		 ldy #$70
$09:d293  22 24 8b 64   jsl $648b24
$09:d297  30 e4		 bmi $d27d
$09:d299  4c 8c 46	  jmp $468c
$09:d29c  26 09		 rol $09
$09:d29e  a0 a8		 ldy #$a8
$09:d2a0  50 3c		 bvc $d2de
$09:d2a2  18			clc
$09:d2a3  0e 01 3d	  asl $3d01
$09:d2a6  ab			plb
$09:d2a7  17 89		 ora [$89],y
$09:d2a9  04 c1		 tsb $c1
$09:d2ab  5b			tcd
$09:d2ac  05 50		 ora $50
$09:d2ae  88			dey
$09:d2af  46 09		 lsr $09
$09:d2b1  38			sec
$09:d2b2  55 01		 eor $01,x
$09:d2b4  aa			tax
$09:d2b5  c8			iny
$09:d2b6  06 a3		 asl $a3
$09:d2b8  08			php
$09:d2b9  82 41 20	  brl $f2fd
$09:d2bc  10 41		 bpl $d2ff
$09:d2be  08			php
$09:d2bf  08			php
$09:d2c0  01 36		 ora ($36,x)
$09:d2c2  22 fe 80 88   jsl $8880fe
$09:d2c6  41 2a		 eor ($2a,x)
$09:d2c8  10 c8		 bpl $d292
$09:d2ca  61 4c		 adc ($4c,x)
$09:d2cc  86 a1		 stx $a1
$09:d2ce  30 48		 bmi $d318
$09:d2d0  10 d4		 bpl $d2a6
$09:d2d2  e1 03		 sbc ($03,x)
$09:d2d4  51 36		 eor ($36),y
$09:d2d6  01 b0		 ora ($b0,x)
$09:d2d8  f0 10		 beq $d2ea
$09:d2da  0a			asl a
$09:d2db  02 3c		 cop #$3c
$09:d2dd  4d 80 c7	  eor $c780
$09:d2e0  04 b0		 tsb $b0
$09:d2e2  27 bd		 and [$bd]
$09:d2e4  dd ef ff	  cmp $ffef,x
$09:d2e7  69 11 ac	  adc #$ac11
$09:d2ea  25 12		 and $12
$09:d2ec  88			dey
$09:d2ed  a4 52		 ldy $52
$09:d2ef  19 0e 81	  ora $810e,y
$09:d2f2  41 c6		 eor ($c6,x)
$09:d2f4  a0 5e		 ldy #$5e
$09:d2f6  0f 04 02 c0   ora $c00204
$09:d2fa  d7 31		 cmp [$31],y
$09:d2fc  57 8e		 eor [$8e],y
$09:d2fe  fc 0f 07	  jsr ($070f,x)
$09:d301  70 43		 bvs $d346
$09:d303  ba			tsx
$09:d304  03 8e		 ora $8e,s
$09:d306  3e 82 f4	  rol $f482,x
$09:d309  9f a8 2b e1   sta $e12ba8,x
$09:d30d  00 87		 brk #$87
$09:d30f  a8			tay
$09:d310  24 42		 bit $42
$09:d312  1f c8 04 7e   ora $7e04c8,x
$09:d316  01 01		 ora ($01,x)
$09:d318  50 68		 bvc $d382
$09:d31a  84 04		 sty $04
$09:d31c  e3 08		 sbc $08,s
$09:d31e  81 40		 sta ($40,x)
$09:d320  a0 2c		 ldy #$2c
$09:d322  53 08		 eor ($08,s),y
$09:d324  80 8c		 bra $d2b2
$09:d326  26 10		 rol $10
$09:d328  08			php
$09:d329  22 83 df 5e   jsl $5edf83
$09:d32d  5e 99 84	  lsr $8499,x
$09:d330  e2 20		 sep #$20
$09:d332  d7 0b		 cmp [$0b],y
$09:d334  02 f8		 cop #$f8
$09:d336  4c 4b 58	  jmp $584b
$09:d339  bc 48 26	  ldy $2648,x
$09:d33c  01 91		 ora ($91,x)
$09:d33e  80 40		 bra $d380
$09:d340  e0 70		 cpx #$70
$09:d342  58			cli
$09:d343  2c 2a 15	  bit $152a
$09:d346  14 8a		 trb $8a
$09:d348  36 42		 rol $42,x
$09:d34a  40			rti
$09:d34b  be 10 f1	  ldx $f110,y
$09:d34e  40			rti
$09:d34f  9d 03 08	  sta $0803,x
$09:d352  73 0d		 adc ($0d,s),y
$09:d354  c1 c8		 cmp ($c8,x)
$09:d356  21 e1		 and ($e1,x)
$09:d358  71 81		 adc ($81),y
$09:d35a  47 cc		 eor [$cc]
$09:d35c  19 06 83	  ora $8306,y
$09:d35f  02 82		 cop #$82
$09:d361  08			php
$09:d362  e9 01		 sbc #$01
$09:d364  60			rts
$09:d365  86 42		 stx $42
$09:d367  41 20		 eor ($20,x)
$09:d369  20 81 cc	  jsr $cc81
$09:d36c  48			pha
$09:d36d  82 45 06	  brl $d9b5
$09:d370  b8			clv
$09:d371  0e 42 80	  asl $8042
$09:d374  0a			asl a
$09:d375  06 e8		 asl $e8
$09:d377  24 04		 bit $04
$09:d379  14 90		 trb $90
$09:d37b  18			clc
$09:d37c  18			clc
$09:d37d  29 98		 and #$98
$09:d37f  a0 a5		 ldy #$a5
$09:d381  21 f9		 and ($f9,x)
$09:d383  06 42		 asl $42
$09:d385  c1 40		 cmp ($40,x)
$09:d387  45 97		 eor $97
$09:d389  83 40		 sta $40,s
$09:d38b  8d 04 68	  sta $6804
$09:d38e  0e c0 72	  asl $72c0
$09:d391  03 90		 ora $90,s
$09:d393  0e 00 70	  asl $7000
$09:d396  17 64		 ora [$64],y
$09:d398  3b			tsc
$09:d399  34 a2		 bit $a2,x
$09:d39b  b5 bc		 lda $bc,x
$09:d39d  15 05		 ora $05,x
$09:d39f  00 a0		 brk #$a0
$09:d3a1  06 40		 asl $40
$09:d3a3  2e 01 50	  rol $5001
$09:d3a6  33 31		 and ($31,s),y
$09:d3a8  ec 66 02	  cpx $0266
$09:d3ab  70 7c		 bvs $d429
$09:d3ad  a2 6c		 ldx #$6c
$09:d3af  5a			phy
$09:d3b0  1e e5 cc	  asl $cce5,x
$09:d3b3  07 02		 ora [$02]
$09:d3b5  81 e0		 sta ($e0,x)
$09:d3b7  88			dey
$09:d3b8  54 1e fe	  mvn $fe,$1e
$09:d3bb  08			php
$09:d3bc  55 11		 eor $11,x
$09:d3be  9c c6 11	  stz $11c6
$09:d3c1  18			clc
$09:d3c2  90 30		 bcc $d3f4
$09:d3c4  c0 b7		 cpy #$b7
$09:d3c6  e6 cf		 inc $cf
$09:d3c8  3e fa 3b	  rol $3bfa,x
$09:d3cb  d3 fe		 cmp ($fe,s),y
$09:d3cd  ad b0 96	  lda $96b0
$09:d3d0  c1 20		 cmp ($20,x)
$09:d3d2  90 08		 bcc $d3dc
$09:d3d4  11 54		 ora ($54),y
$09:d3d6  20 10 80	  jsr $8010
$09:d3d9  10 40		 bpl $d41b
$09:d3db  24 0f		 bit $0f
$09:d3dd  30 80		 bmi $d35f
$09:d3df  70 1e		 bvs $d3ff
$09:d3e1  22 df e2 90   jsl $90e2df
$09:d3e5  04 01		 tsb $01
$09:d3e7  a5 0d		 lda $0d
$09:d3e9  ef 17 83 ff   sbc $ff8317
$09:d3ed  c4 3e		 cpy $3e
$09:d3ef  c1 8b		 cmp ($8b,x)
$09:d3f1  f8			sed
$09:d3f2  c3 47		 cmp $47,s
$09:d3f4  b1 01		 lda ($01),y
$09:d3f6  80 d9		 bra $d3d1
$09:d3f8  ec 17 87	  cpx $8717
$09:d3fb  ed c7 e0	  sbc $e0c7
$09:d3fe  1f f8 07 80   ora $8007f8,x
$09:d402  59 e7 ef	  eor $efe7,y
$09:d405  60			rts
$09:d406  83 40		 sta $40,s
$09:d408  19 83 08	  ora $0883,y
$09:d40b  6a			ror a
$09:d40c  03 54		 ora $54,s
$09:d40e  1a			inc a
$09:d40f  c0 81		 cpy #$81
$09:d411  d6 c0		 dec $c0,x
$09:d413  37 01		 and [$01],y
$09:d415  b8			clv
$09:d416  0d a0 7e	  ora $7ea0
$09:d419  08			php
$09:d41a  40			rti
$09:d41b  68			pla
$09:d41c  0b			phd
$09:d41d  b1 57		 lda ($57),y
$09:d41f  92 bd		 sta ($bd)
$09:d421  90 c5		 bcc $d3e8
$09:d423  30 88		 bmi $d3ad
$09:d425  3e 81 0c	  rol $0c81,x
$09:d428  11 84		 ora ($84),y
$09:d42a  c0 a5		 cpy #$a5
$09:d42c  42 05		 wdm #$05
$09:d42e  02 2b		 cop #$2b
$09:d430  85 81		 sta $81
$09:d432  9c 0e 01	  stz $010e
$09:d435  7c 04 62	  jmp ($6204,x)
$09:d438  00 98		 brk #$98
$09:d43a  08			php
$09:d43b  22 44 9d fe   jsl $fe9d44
$09:d43f  fe c5 b8	  inc $b8c5,x
$09:d442  2e c2 41	  rol $41c2
$09:d445  20 4b 90	  jsr $904b
$09:d448  1d d6 82	  ora $82d6,x
$09:d44b  e1 08		 sbc ($08,x)
$09:d44d  71 58		 adc ($58),y
$09:d44f  0a			asl a
$09:d450  4a			lsr a
$09:d451  86 08		 stx $08
$09:d453  34 0a		 bit $0a,x
$09:d455  1d 0a 86	  ora $860a,x
$09:d458  26 06		 rol $06
$09:d45a  19 04 8e	  ora $8e04,y
$09:d45d  45 21		 eor $21
$09:d45f  d0 f8		 bne $d459
$09:d461  3c 0d d6	  bit $d60d,x
$09:d464  04 32		 tsb $32
$09:d466  86 3a		 stx $3a
$09:d468  05 30		 ora $30
$09:d46a  17 48		 ora [$48],y
$09:d46c  64 72		 stz $72
$09:d46e  38			sec
$09:d46f  86 ab		 stx $ab
$09:d471  e4 32		 cpx $32
$09:d473  d8			cld
$09:d474  49 04		 eor #$04
$09:d476  3d 91 ca	  and $ca91,x
$09:d479  31 18		 and ($18),y
$09:d47b  88			dey
$09:d47c  39 c1 1a	  and $1ac1,y
$09:d47f  b0 61		 bcs $d4e2
$09:d481  30 c7		 bmi $d44a
$09:d483  0e a0 78	  asl $78a0
$09:d486  50 13		 bvc $d49b
$09:d488  b9 42 84	  lda $8442,y
$09:d48b  e8			inx
$09:d48c  10 13		 bpl $d4a1
$09:d48e  f8			sed
$09:d48f  20 13 c8	  jsr $c813
$09:d492  04 1c		 tsb $1c
$09:d494  04 30		 tsb $30
$09:d496  48			pha
$09:d497  6c 38 4e	  jmp ($4e38)
$09:d49a  00 29		 brk #$29
$09:d49c  58			cli
$09:d49d  84 36		 sty $36
$09:d49f  1e 02 a8	  asl $a802,x
$09:d4a2  24 31		 bit $31
$09:d4a4  a0 00		 ldy #$00
$09:d4a6  2a			rol a
$09:d4a7  68			pla
$09:d4a8  09 8a		 ora #$8a
$09:d4aa  c1 e5		 cmp ($e5,x)
$09:d4ac  10 88		 bpl $d436
$09:d4ae  0e 02 06	  asl $0602
$09:d4b1  8b			phb
$09:d4b2  99 01 20	  sta $2001,y
$09:d4b5  55 60		 eor $60,x
$09:d4b7  29 44		 and #$44
$09:d4b9  5c 7c 20 0c   jml $0c207c
$09:d4bd  2a			rol a
$09:d4be  c0 40		 cpy #$40
$09:d4c0  3f 10 09 fb   and $fb0910,x
$09:d4c4  da			phx
$09:d4c5  d1 61		 cmp ($61),y
$09:d4c7  ff 2f 00 bb   sbc $bb002f,x
$09:d4cb  47 60		 eor [$60]
$09:d4cd  65 98		 adc $98
$09:d4cf  17 e1		 ora [$e1],y
$09:d4d1  11 aa		 ora ($aa),y
$09:d4d3  70 13		 bvs $d4e8
$09:d4d5  82 2c 20	  brl $f504
$09:d4d8  30 18		 bmi $d4f2
$09:d4da  34 12		 bit $12,x
$09:d4dc  39 10 f8	  and $f810,y
$09:d4df  3b			tsc
$09:d4e0  c1 16		 cmp ($16,x)
$09:d4e2  ef 70 59 05   sbc $055970
$09:d4e6  e1 4c		 sbc ($4c,x)
$09:d4e8  28			plp
$09:d4e9  af 05 0d 00   lda $000d05
$09:d4ed  d8			cld
$09:d4ee  61 da		 adc ($da,x)
$09:d4f0  57 97		 eor [$97],y
$09:d4f2  01 10		 ora ($10,x)
$09:d4f4  12 04		 ora ($04)
$09:d4f6  f8			sed
$09:d4f7  2e 49 6a	  rol $6a49
$09:d4fa  0b			phd
$09:d4fb  f6 44		 inc $44,x
$09:d4fd  85 81		 sta $81
$09:d4ff  94 2c		 sty $2c,x
$09:d501  ee 04 f1	  inc $f104
$09:d504  e0 28		 cpx #$28
$09:d506  14 09		 trb $09
$09:d508  04 82		 tsb $82
$09:d50a  21 18		 and ($18,x)
$09:d50c  82 41 1b	  brl $f050
$09:d50f  cc 6d 05	  cpy $056d
$09:d512  e8			inx
$09:d513  48			pha
$09:d514  20 10 87	  jsr $8710
$09:d517  06 a7		 asl $a7
$09:d519  46 81		 lsr $81
$09:d51b  27 93		 and [$93]
$09:d51d  a8			tay
$09:d51e  f0 b8		 beq $d4d8
$09:d520  40			rti
$09:d521  72 88		 adc ($88)
$09:d523  0a			asl a
$09:d524  82 10 33	  brl $0837
$09:d527  00 28		 brk #$28
$09:d529  0e 48 b8	  asl $b848
$09:d52c  03 f2		 ora $f2,s
$09:d52e  98			tya
$09:d52f  11 14		 ora ($14),y
$09:d531  0a			asl a
$09:d532  0e 06 7a	  asl $7a06
$09:d535  81 60		 sta ($60,x)
$09:d537  1f 00 f8 07   ora $07f800,x
$09:d53b  03 16		 ora $16,s
$09:d53d  06 31		 asl $31
$09:d53f  0c 80 1a	  tsb $1a80
$09:d542  c0 64		 cpy #$64
$09:d544  32 87		 and ($87)
$09:d546  00 c5		 brk #$c5
$09:d548  1c 03 0a	  trb $0a03
$09:d54b  2e 10 14	  rol $1410
$09:d54e  06 62		 asl $62
$09:d550  06 13		 asl $13
$09:d552  58			cli
$09:d553  3e 02 04	  rol $0402,x
$09:d556  8a			txa
$09:d557  1a			inc a
$09:d558  02 dc		 cop #$dc
$09:d55a  2e 11 89	  rol $8911
$09:d55d  c4 52		 cpy $52
$09:d55f  29 0a		 and #$0a
$09:d561  85 41		 sta $41
$09:d563  60			rts
$09:d564  b0 24		 bcs $d58a
$09:d566  58			cli
$09:d567  38			sec
$09:d568  14 0e		 trb $0e
$09:d56a  08			php
$09:d56b  92 6f		 sta ($6f)
$09:d56d  f4 06 03	  pea $0306
$09:d570  02 81		 cop #$81
$09:d572  b8			clv
$09:d573  31 ee		 and ($ee),y
$09:d575  10 64		 bpl $d5db
$09:d577  50 8c		 bvc $d505
$09:d579  46 20		 lsr $20
$09:d57b  f3 0e		 sbc ($0e,s),y
$09:d57d  07 02		 ora [$02]
$09:d57f  81 c0		 sta ($c0,x)
$09:d581  77 83		 adc [$83],y
$09:d583  3c 21 d0	  bit $d021,x
$09:d586  08			php
$09:d587  e1 c4		 sbc ($c4,x)
$09:d589  6a			ror a
$09:d58a  04 c7		 tsb $c7
$09:d58c  bf 40 28 4f   lda $4f2840,x
$09:d590  25 78		 and $78
$09:d592  83 f3		 sta $f3,s
$09:d594  dd de 1e	  cmp $1ede,x
$09:d597  f0 87		 beq $d520
$09:d599  88			dey
$09:d59a  7c 65 e4	  jmp ($e465,x)
$09:d59d  3f 2a 79 97   and $97792a,x
$09:d5a1  ce de 87	  dec $87de
$09:d5a4  f4 c7 aa	  pea $aac7
$09:d5a7  7d 75 ec	  adc $ec75,x
$09:d5aa  bf 70 7b b7   lda $b77b70,x
$09:d5ae  c3 be		 cmp $be,s
$09:d5b0  0f f1 ff 8c   ora $8cfff1
$09:d5b4  7c 85 e5	  jmp ($e585,x)
$09:d5b7  3f 32 79 d7   and $d77932,x
$09:d5bb  d0 de		 bne $d59b
$09:d5bd  97 f5		 sta [$f5],y
$09:d5bf  47 ae		 eor [$ae]
$09:d5c1  7d 95 ed	  adc $ed95,x
$09:d5c4  bf 76 78 73   lda $737876,x
$09:d5c8  c1 de		 cmp ($de,x)
$09:d5ca  3e f1 87	  rol $87f1,x
$09:d5cd  90 7c		 bcc $d64b
$09:d5cf  a5 e6		 lda $e6
$09:d5d1  3f 3a 7a 17   and $177a3a,x
$09:d5d5  d2 de		 cmp ($de)
$09:d5d7  a7 f5		 lda [$f5]
$09:d5d9  c7 b2		 cmp [$b2]
$09:d5db  7d b5 ee	  adc $eeb5,x
$09:d5de  bf 00 78 37   lda $377800,x
$09:d5e2  c7 be		 cmp [$be]
$09:d5e4  2f f2 ff 94   and $94fff2
$09:d5e8  7c c5 e7	  jmp ($e7c5,x)
$09:d5eb  3f 42 7a 57   and $577a42,x
$09:d5ef  d4 de		 pei ($de)
$09:d5f1  b7 f6		 lda [$f6],y
$09:d5f3  47 b6		 eor [$b6]
$09:d5f5  7d d5 ef	  adc $efd5,x
$09:d5f8  bf 06 78 f3   lda $f37806,x
$09:d5fc  c5 de		 cmp $de
$09:d5fe  5e f2 87	  lsr $87f2,x
$09:d601  98			tya
$09:d602  7c e5 e8	  jmp ($e8e5,x)
$09:d605  3f 4a 7a 97   and $977a4a,x
$09:d609  d6 de		 dec $de,x
$09:d60b  c7 f6		 cmp [$f6]
$09:d60d  c7 ba		 cmp [$ba]
$09:d60f  7d f5 e0	  adc $e0f5,x
$09:d612  bf 10 78 b7   lda $b77810,x
$09:d616  cb			wai
$09:d617  be 4f f3	  ldx $f34f,y
$09:d61a  ff 9c 7d 05   sbc $057d9c,x
$09:d61e  e9 3f		 sbc #$3f
$09:d620  52 7a		 eor ($7a)
$09:d622  d7 d8		 cmp [$d8],y
$09:d624  de d7 f7	  dec $f7d7,x
$09:d627  47 be		 eor [$be]
$09:d629  7c 15 e1	  jmp ($e115,x)
$09:d62c  bf 16 79 73   lda $737916,x
$09:d630  c9 de		 cmp #$de
$09:d632  7e f3 87	  ror $87f3,x
$09:d635  a0 7d		 ldy #$7d
$09:d637  25 ea		 and $ea
$09:d639  3f 5a 7b 17   and $177b5a,x
$09:d63d  da			phx
$09:d63e  de e7 f7	  dec $f7e7,x
$09:d641  c7 82		 cmp [$82]
$09:d643  7c 35 e2	  jmp ($e235,x)
$09:d646  bf 20 79 37   lda $377920,x
$09:d64a  cf be 6f f4   cmp $f46fbe
$09:d64e  ff a4 7d 45   sbc $457da4,x
$09:d652  eb			xba
$09:d653  3f 71 fb 04   and $04fb71,x
$09:d657  a4 0f		 ldy $0f
$09:d659  81 b0		 sta ($b0,x)
$09:d65b  3b			tsc
$09:d65c  7e 0b 02	  ror $020b,x
$09:d65f  07 94		 ora [$94]
$09:d661  22 0a 15 18   jsl $18150a
$09:d665  24 62		 bit $62
$09:d667  09 10		 ora #$10
$09:d669  84 40		 sty $40
$09:d66b  20 e1 f3	  jsr $f3e1
$09:d66e  87 89		 sta [$89]
$09:d670  4e 3e 2b	  lsr $2b3e
$09:d673  16 08		 asl $08,x
$09:d675  d0 20		 bne $d697
$09:d677  1a			inc a
$09:d678  0a			asl a
$09:d679  04 83		 tsb $83
$09:d67b  81 20		 sta ($20,x)
$09:d67d  a0 44		 ldy #$44
$09:d67f  2c 11 07	  bit $0711
$09:d682  c8			iny
$09:d683  0b			phd
$09:d684  d3 c0		 cmp ($c0,s),y
$09:d686  45 3f		 eor $3f
$09:d688  81 2c		 sta ($2c,x)
$09:d68a  5f 0b 50 7c   eor $7c500b,x
$09:d68e  85 40		 sta $40
$09:d690  38			sec
$09:d691  12 c7		 ora ($c7)
$09:d693  ac 5c 0a	  ldy $0a5c
$09:d696  c1 00		 cmp ($00,x)
$09:d698  8a			txa
$09:d699  40			rti
$09:d69a  25 90		 and $90
$09:d69c  28			plp
$09:d69d  00 3c		 brk #$3c
$09:d69f  20 90 38	  jsr $3890
$09:d6a2  21 c8		 and ($c8,x)
$09:d6a4  02 81		 cop #$81
$09:d6a6  04 0c		 tsb $0c
$09:d6a8  80 74		 bra $d71e
$09:d6aa  4d e0 20	  eor $20e0
$09:d6ad  41 22		 eor ($22,x)
$09:d6af  47 f8		 eor [$f8]
$09:d6b1  03 20		 ora $20,s
$09:d6b3  c0 0e		 cpy #$0e
$09:d6b5  41 26		 eor ($26,x)
$09:d6b7  53 01		 eor ($01,s),y
$09:d6b9  d2 23		 cmp ($23)
$09:d6bb  c1 1e		 cmp ($1e,x)
$09:d6bd  04 68		 tsb $68
$09:d6bf  f8			sed
$09:d6c0  4c 21 12	  jmp $1221
$09:d6c3  01 e8		 ora ($e8,x)
$09:d6c5  2c 84 3a	  bit $3a84
$09:d6c8  11 08		 ora ($08),y
$09:d6ca  64 32		 stz $32
$09:d6cc  07 03		 ora [$03]
$09:d6ce  74 84		 stz $84,x
$09:d6d0  fd 7e a2	  sbc $a27e,x
$09:d6d3  c2 13		 rep #$13
$09:d6d5  04 0e		 tsb $0e
$09:d6d7  31 00		 and ($00),y
$09:d6d9  9e 46 27	  stz $2746,x
$09:d6dc  92 86		 sta ($86)
$09:d6de  98			tya
$09:d6df  ce 27 90	  dec $9027
$09:d6e2  89 c4		 bit #$c4
$09:d6e4  c2 60		 rep #$60
$09:d6e6  fe 18 c4	  inc $c418,x
$09:d6e9  62 50 e3	  per $ba3c
$09:d6ec  19 c4 e2	  ora $e2c4,y
$09:d6ef  11 08		 ora ($08),y
$09:d6f1  6e 18 05	  ror $0518
$09:d6f4  57 81		 eor [$81],y
$09:d6f6  04 83		 tsb $83
$09:d6f8  c0 df 40	  cpy #$40df
$09:d6fb  26 07		 rol $07
$09:d6fd  83 08		 sta $08,s
$09:d6ff  55 dc		 eor $dc,x
$09:d701  dc 0f 07	  jml [$070f]
$09:d704  83 e1		 sta $e1,s
$09:d706  d0 f8		 bne $d700
$09:d708  06 41		 asl $41
$09:d70a  dc ca 85	  jml [$85ca]
$09:d70d  77 04		 adc [$04],y
$09:d70f  3e 13 19	  rol $1913,x
$09:d712  8a			txa
$09:d713  4d e4 53	  eor $53e4
$09:d716  f8			sed
$09:d717  c4 fe		 cpy $fe
$09:d719  73 7f		 adc ($7f,s),y
$09:d71b  91 db		 sta ($db),y
$09:d71d  e6 57		 inc $57
$09:d71f  e6 60		 inc $60
$09:d721  46 60		 lsr $60
$09:d723  d3 78		 cmp ($78,s),y
$09:d725  43 00		 eor $00,s
$09:d727  af f0 0b 7c   lda $7c0bf0
$09:d72b  42 fd		 wdm #$fd
$09:d72d  01 80		 ora ($80,x)
$09:d72f  67 20		 adc [$20]
$09:d731  9f e9 c7 fa   sta $fac7e9,x
$09:d735  19 fe fa	  ora $fafe,y
$09:d738  7f a3 d1 f9   adc $f9d1a3,x
$09:d73c  54 ae 79	  mvn $79,$ae
$09:d73f  3f ce 40 3f   and $3f40ce,x
$09:d743  c6 05		 dec $05
$09:d745  8f f8 25 7d   sta $7d25f8
$09:d749  49 ff 02	  eor #$02ff
$09:d74c  6b			rtl
$09:d74d  f7 af		 sbc [$af],y
$09:d74f  ff e0 b7 d8   sbc $d8b7e0,x
$09:d753  7c 7e 09	  jmp ($097e,x)
$09:d756  3f 8b 5f e1   and $e15f8b,x
$09:d75a  73 b8		 adc ($b8,s),y
$09:d75c  dc ef ef	  jml [$efef]
$09:d75f  08			php
$09:d760  ff c0 2f b0   sbc $b02fc0,x
$09:d764  26 50		 rol $50
$09:d766  11 ca		 ora ($ca),y
$09:d768  77 04		 adc [$04],y
$09:d76a  45 83		 eor $83
$09:d76c  70 37		 bvs $d7a5
$09:d76e  1b			tcs
$09:d76f  8a			txa
$09:d770  c7 62		 cmp [$62]
$09:d772  e9 f4 94	  sbc #$94f4
$09:d775  fe 71 9f	  inc $9f71,x
$09:d778  c8			iny
$09:d779  2f ff c1 ff   and $ffc1ff
$09:d77d  98			tya
$09:d77e  73 f7		 adc ($f7,s),y
$09:d780  14 7e		 trb $7e
$09:d782  c4 9f		 cpy $9f
$09:d784  e9 0b fc	  sbc #$fc0b
$09:d787  c1 bf		 cmp ($bf,x)
$09:d789  90 34		 bcc $d7bf
$09:d78b  08			php
$09:d78c  20 42 01	  jsr $0142
$09:d78f  c1 57		 cmp ($57,x)
$09:d791  8d 22 01	  sta $0122
$09:d794  28			plp
$09:d795  80 43		 bra $d7da
$09:d797  1c 00 b9	  trb $b900
$09:d79a  18			clc
$09:d79b  e2 c3		 sep #$c3
$09:d79d  42 a3		 wdm #$a3
$09:d79f  00 c0		 brk #$c0
$09:d7a1  34 45		 bit $45,x
$09:d7a3  a0 16 08	  ldy #$0816
$09:d7a6  05 02		 ora $02
$09:d7a8  01 08		 ora ($08,x)
$09:d7aa  04 03		 tsb $03
$09:d7ac  43 60		 eor $60,s
$09:d7ae  12 06		 ora ($06)
$09:d7b0  b8			clv
$09:d7b1  ad 01 70	  lda $7001
$09:d7b4  11 46		 ora ($46),y
$09:d7b6  e0 3d c5	  cpx #$c53d
$09:d7b9  b8			clv
$09:d7ba  0e e7 66	  asl $66e7
$09:d7bd  84 51		 sty $51
$09:d7bf  b6 2f		 ldx $2f,y
$09:d7c1  d1 27		 cmp ($27),y
$09:d7c3  04 0a		 tsb $0a
$09:d7c5  03 04		 ora $04,s
$09:d7c7  81 45		 sta ($45,x)
$09:d7c9  20 51 84	  jsr $8451
$09:d7cc  70 43		 bvs $d811
$09:d7ce  26 0f		 rol $0f
$09:d7d0  d1 08		 cmp ($08),y
$09:d7d2  0c 0d d8	  tsb $d80d
$09:d7d5  31 73		 and ($73),y
$09:d7d7  40			rti
$09:d7d8  11 84		 ora ($84),y
$09:d7da  da			phx
$09:d7db  0c f1 6d	  tsb $6df1
$09:d7de  04 82		 tsb $82
$09:d7e0  80 35		 bra $d817
$09:d7e2  09 85 02	  ora #$0285
$09:d7e5  21 60		 and ($60,x)
$09:d7e7  88			dey
$09:d7e8  00 00		 brk #$00
$09:d7ea  5e 4d 00	  lsr $004d,x
$09:d7ed  f0 11		 beq $d800
$09:d7ef  47 e0		 eor [$e0]
$09:d7f1  49 27 c0	  eor #$c027
$09:d7f4  2f 00 3c 41   and $413c00
$09:d7f8  e2 2c		 sep #$2c
$09:d7fa  19 3f 60	  ora $603f,y
$09:d7fd  86 e1		 stx $e1
$09:d7ff  85 41		 sta $41
$09:d801  21 70		 and ($70,x)
$09:d803  48			pha
$09:d804  44 1e 11	  mvp $11,$1e
$09:d807  06 0c		 asl $0c
$09:d809  84 41		 sty $41
$09:d80b  f0 06		 beq $d813
$09:d80d  f2 87		 sbc ($87)
$09:d80f  40			rti
$09:d810  21 e8		 and ($e8,x)
$09:d812  53 15		 eor ($15,s),y
$09:d814  00 a8		 brk #$a8
$09:d816  1a			inc a
$09:d817  2b			pld
$09:d818  40			rti
$09:d819  c0 48 38	  cpy #$3848
$09:d81c  03 70		 ora $70,s
$09:d81e  1d 80 7c	  ora $7c80,x
$09:d821  5a			phy
$09:d822  48			pha
$09:d823  44 66 50	  mvp $50,$66
$09:d826  4f 27 96 ea   eor $ea9627
$09:d82a  55 da		 eor $da,x
$09:d82c  85 7e		 sta $7e
$09:d82e  9e 5f ab	  stz $ab5f,x
$09:d831  4b			phk
$09:d832  20 2c 1c	  jsr $1c2c
$09:d835  62 10 57	  per $2f48
$09:d838  73 08		 adc ($08,s),y
$09:d83a  cf 16 21 28   cmp $282116
$09:d83e  69 a4		 adc #$a4
$09:d840  e2 61		 sep #$61
$09:d842  30 60		 bmi $d8a4
$09:d844  14 62		 trb $62
$09:d846  50 e3		 bvc $d82b
$09:d848  56 e1		 lsr $e1,x
$09:d84a  40			rti
$09:d84b  e1 f0		 sbc ($f0,x)
$09:d84d  48			pha
$09:d84e  7c 0c 4c	  jmp ($4c0c,x)
$09:d851  02 40		 cop #$40
$09:d853  2c 2a 18	  bit $182a
$09:d856  9e 93 00	  stz $0093,x
$09:d859  d0 7c		 bne $d8d7
$09:d85b  2c 1f 0e	  bit $0e1f
$09:d85e  01 28		 ora ($28,x)
$09:d860  09 00		 ora #$00
$09:d862  06 52		 asl $52
$09:d864  51 85		 eor ($85),y
$09:d866  62 01 13	  per $eb6a
$09:d869  bf ce 7f f6   lda $f67fce,x
$09:d86d  cf 7c 97 cf   cmp $cf977c
$09:d871  7e ff c5	  ror $c5ff,x
$09:d874  eb			xba
$09:d875  f0 39		 beq $d8b0
$09:d877  f8			sed
$09:d878  08			php
$09:d879  2f f0 0f fc   and $fc0ff0
$09:d87d  03 df		 ora $df,s
$09:d87f  10 f3		 bpl $d874
$09:d881  c6 08		 dec $08
$09:d883  21 5f		 and ($5f,x)
$09:d885  90 0f		 bcc $d896
$09:d887  04 c6		 tsb $c6
$09:d889  10 ec		 bpl $d877
$09:d88b  d6 7f		 dec $7f,x
$09:d88d  e9 ff		 sbc #$ff
$09:d88f  9f 7f fe 9f   sta $9ffe7f,x
$09:d893  7c 66 3a	  jmp ($3a66,x)
$09:d896  d1 fc		 cmp ($fc),y
$09:d898  88			dey
$09:d899  7e 21 df	  ror $df21,x
$09:d89c  0c fd 80	  tsb $80fd
$09:d89f  82 04 10	  brl $e8a6
$09:d8a2  fb			xce
$09:d8a3  c2 31		 rep #$31
$09:d8a5  d7 0f		 cmp [$0f],y
$09:d8a7  e4 03		 cpx $03
$09:d8a9  f1 00		 sbc ($00),y
$09:d8ab  84 ce		 sty $ce
$09:d8ad  61 f1		 adc ($f1,x)
$09:d8af  f8			sed
$09:d8b0  2d 3e 01	  and $013e
$09:d8b3  02 80		 cop #$80
$09:d8b5  41 00		 eor ($00,x)
$09:d8b7  c9 39 83	  cmp #$8339
$09:d8ba  47 e0		 eor [$e0]
$09:d8bc  07 49		 ora [$49]
$09:d8be  80 5c		 bra $d91c
$09:d8c0  2f fa cf 7c   and $7ccffa
$09:d8c4  9b			txy
$09:d8c5  cf 1c bf c0   cmp $c0bf1c
$09:d8c9  65 f0		 adc $f0
$09:d8cb  6b			rtl
$09:d8cc  f4 0f 1f	  pea $1f0f
$09:d8cf  00 85		 brk #$85
$09:d8d1  df f0 04 32   cmp $3204f0,x
$09:d8d5  1f 84 be 01   ora $01be84,x
$09:d8d9  7e 80 a7	  ror $a780,x
$09:d8dc  05 1a		 ora $1a
$09:d8de  10 c7		 bpl $d8a7
$09:d8e0  f0 9d		 beq $d87f
$09:d8e2  81 6a		 sta ($6a,x)
$09:d8e4  eb			xba
$09:d8e5  0d 46 85	  ora $8546
$09:d8e8  0e 00 ec	  asl $ec00
$09:d8eb  15 a8		 ora $a8,x
$09:d8ed  c8			iny
$09:d8ee  20 11 d0	  jsr $d011
$09:d8f1  10 b3		 bpl $d8a6
$09:d8f3  f9 6a b0	  sbc $b06a,y
$09:d8f6  18			clc
$09:d8f7  0c 16 09	  tsb $0916
$09:d8fa  0d 84 c0	  ora $c084
$09:d8fd  e0 71 f8	  cpx #$f871
$09:d900  bb			tyx
$09:d901  bd 60 10	  lda $1060,x
$09:d904  58			cli
$09:d905  14 3e		 trb $3e
$09:d907  03 07		 ora $07,s
$09:d909  85 c7		 sta $c7
$09:d90b  dd 6b 80	  cmp $806b,x
$09:d90e  c0 68 24	  cpy #$2468
$09:d911  1b			tcs
$09:d912  0c 87 03	  tsb $0387
$09:d915  81 f8		 sta ($f8,x)
$09:d917  f4 03 d6	  pea $d603
$09:d91a  01 a0		 ora ($a0,x)
$09:d91c  a0 7c 30	  ldy #$307c
$09:d91f  1e 0e 87	  asl $870e,x
$09:d922  e3 c0		 sbc $c0,s
$09:d924  fb			xce
$09:d925  08			php
$09:d926  64 32		 stz $32
$09:d928  27 10		 and [$10]
$09:d92a  96 48		 stx $48,y
$09:d92c  2a			rol a
$09:d92d  54 2a bd	  mvn $bd,$2a
$09:d930  1f 57 83 da   ora $da8357,x
$09:d934  e1 60		 sbc ($60,x)
$09:d936  6a			ror a
$09:d937  f0 81		 beq $d8ba
$09:d939  c4 e1		 cpy $e1
$09:d93b  92 f8		 sta ($f8)
$09:d93d  85 7e		 sta $7e
$09:d93f  45 5f		 eor $5f
$09:d941  93 eb		 sta ($eb,s),y
$09:d943  ea			nop
$09:d944  7b			tdc
$09:d945  fa			plx
$09:d946  28			plp
$09:d947  6c 26 13	  jmp ($1326)
$09:d94a  08			php
$09:d94b  44 23 69	  mvp $69,$23
$09:d94e  04 a5		 tsb $a5
$09:d950  40			rti
$09:d951  b7 53		 lda [$53],y
$09:d953  2f 6f 87 f3   and $f3876f
$09:d957  e1 e0		 sbc ($e0,x)
$09:d959  34 43		 bit $43,x
$09:d95b  81 08		 sta ($08,x)
$09:d95d  f8			sed
$09:d95e  6d 29 17	  adc $1729
$09:d961  ac 27 ea	  ldy $ea27
$09:d964  69 fd f1	  adc #$f1fd
$09:d967  7e 7c d9	  ror $d97c,x
$09:d96a  5c 8e 5b 21   jml $215b8e
$09:d96e  0b			phd
$09:d96f  84 42		 sty $42
$09:d971  4e 83 45	  lsr $4583
$09:d974  a2 1e 82	  ldx #$821e
$09:d977  45 22		 eor $22
$09:d979  cb			wai
$09:d97a  c2 72		 rep #$72
$09:d97c  f0 88		 beq $d906
$09:d97e  5c 12 13 06   jml $061312
$09:d982  42 85		 wdm #$85
$09:d984  16 05		 asl $05,x
$09:d986  44 81 c8	  mvp $c8,$81
$09:d989  a0 3a fc	  ldy #$fc3a
$09:d98c  7c 7e 3f	  jmp ($3f7e,x)
$09:d98f  bf 9f c1 e0   lda $e0c19f,x
$09:d993  f3 68		 sbc ($68,s),y
$09:d995  37 d6		 and [$d6],y
$09:d997  08			php
$09:d998  d8			cld
$09:d999  09 2c 07	  ora #$072c
$09:d99c  ff 8f ff c7   sbc $c7ff8f,x
$09:d9a0  ff f3 ff fc   sbc $fcfff3,x
$09:d9a4  1f ff 06 ff   ora $ff06ff,x
$09:d9a8  c1 27		 cmp ($27,x)
$09:d9aa  fc 09 ff	  jsr ($ff09,x)
$09:d9ad  06 80		 asl $80
$09:d9af  af 39 02 d4   lda $d40239
$09:d9b3  e2 0b		 sep #$0b
$09:d9b5  b1 5a		 lda ($5a),y
$09:d9b7  02 fc		 cop #$fc
$09:d9b9  97 40		 sta [$40],y
$09:d9bb  c5 28		 cmp $28
$09:d9bd  84 21		 sty $21
$09:d9bf  96 01		 stx $01,y
$09:d9c1  50 0a		 bvc $d9cd
$09:d9c3  83 b0		 sta $b0,s
$09:d9c5  97 24		 sta [$24],y
$09:d9c7  f3 08		 sbc ($08,s),y
$09:d9c9  1c 0c 4a	  trb $4a0c
$09:d9cc  0d 23 6b	  ora $6b23
$09:d9cf  04 01		 tsb $01
$09:d9d1  b4 2d		 ldy $2d,x
$09:d9d3  c0 80 46	  cpy #$4680
$09:d9d6  20 13 88	  jsr $8813
$09:d9d9  84 e2		 sty $e2
$09:d9db  60			rts
$09:d9dc  f1 17		 sbc ($17),y
$09:d9de  b2 08		 lda ($08)
$09:d9e0  85 76		 sta $76
$09:d9e2  05 10		 ora $10
$09:d9e4  5d 92 ec	  eor $ec92,x
$09:d9e7  84 40		 sty $40
$09:d9e9  fd 09 e4	  sbc $e409,x
$09:d9ec  e2 79		 sep #$79
$09:d9ee  28			plp
$09:d9ef  9e 42 1e	  stz $1e42,x
$09:d9f2  21 3c		 and ($3c,x)
$09:d9f4  90 04		 bcc $d9fa
$09:d9f6  45 a8		 eor $a8
$09:d9f8  33 89		 and ($89,s),y
$09:d9fa  c4 a2		 cpy $a2
$09:d9fc  50 53		 bvc $da51
$09:d9fe  05 d8		 ora $d8
$09:da00  48			pha
$09:da01  24 02		 bit $02
$09:da03  10 71		 bpl $da76
$09:da05  1b			tcs
$09:da06  50 60		 bvc $da68
$09:da08  30 78		 bmi $da82
$09:da0a  2c 3e 13	  bit $133e
$09:da0d  1e 80 c7	  asl $c780,x
$09:da10  a2 31		 ldx #$31
$09:da12  f1 6b		 sbc ($6b),y
$09:da14  0c c4 90	  tsb $90c4
$09:da17  22 d6 c0 78   jsl $78c0d6
$09:da1b  3c 13 0f	  bit $0f13,x
$09:da1e  87 62		 sta [$62]
$09:da20  c1 58		 cmp ($58,x)
$09:da22  f4 0b 1f	  pea $1f0b
$09:da25  81 00		 sta ($00,x)
$09:da27  f0 70		 beq $da99
$09:da29  3c 14 03	  bit $0314,x
$09:da2c  38			sec
$09:da2d  40			rti
$09:da2e  e0 f0		 cpx #$f0
$09:da30  d8			cld
$09:da31  fc 4e 7d	  jsr ($7d4e,x)
$09:da34  23 3a		 and $3a,s
$09:da36  05 fa		 ora $fa
$09:da38  83 7f		 sta $7f,s
$09:da3a  a0 5f		 ldy #$5f
$09:da3c  ec 17 f2	  cpx $f217
$09:da3f  2b			pld
$09:da40  12 d8		 ora ($d8)
$09:da42  d4 1f		 pei ($1f)
$09:da44  08			php
$09:da45  c5 62		 cmp $62
$09:da47  99 fc f6	  sta $f6fc,y
$09:da4a  57 29		 eor [$29],y
$09:da4c  df 28 f7 8b   cmp $8bf728,x
$09:da50  fd 06 ff	  sbc $ff06,x
$09:da53  35 03		 and $03,x
$09:da55  c1 00		 cmp ($00,x)
$09:da57  f8			sed
$09:da58  50 3e		 bvc $da98
$09:da5a  09 00		 ora #$00
$09:da5c  a0 28		 ldy #$28
$09:da5e  41 a6		 eor ($a6,x)
$09:da60  41 d0		 eor ($d0,x)
$09:da62  08			php
$09:da63  8c 80 22	  sty $2280
$09:da66  30 80		 bmi $d9e8
$09:da68  a8			tay
$09:da69  80 c0		 bra $da2b
$09:da6b  3c 6d 70	  bit $706d,x
$09:da6e  10 80		 bpl $d9f0
$09:da70  94 04		 sty $04,x
$09:da72  a0 bc		 ldy #$bc
$09:da74  28			plp
$09:da75  e0 40		 cpx #$40
$09:da77  23 01		 and $01,s
$09:da79  93 0a		 sta ($0a,s),y
$09:da7b  04 a1		 tsb $a1
$09:da7d  76 91		 ror $91,x
$09:da7f  88			dey
$09:da80  c0 a4		 cpy #$a4
$09:da82  84 60		 sty $60
$09:da84  23 05		 and $05,s
$09:da86  e1 47		 sbc ($47,x)
$09:da88  e2 f0		 sep #$f0
$09:da8a  38			sec
$09:da8b  1c 36 13	  trb $1336
$09:da8e  05 82		 ora $82
$09:da90  40			rti
$09:da91  49 6b		 eor #$6b
$09:da93  1f 83 c1 e1   ora $e1c183,x
$09:da97  70 f8		 bvs $da91
$09:da99  0c 16 04	  tsb $0416
$09:da9c  4b			phk
$09:da9d  6f c7 a3 81   adc $81a3c7
$09:daa1  c0 d8		 cpy #$d8
$09:daa3  64 34		 stz $34
$09:daa5  12 0c		 ora ($0c)
$09:daa7  06 00		 asl $00
$09:daa9  12 a5		 ora ($a5)
$09:daab  60			rts
$09:daac  e8			inx
$09:daad  7c 30 1a	  jmp ($1a30,x)
$09:dab0  0a			asl a
$09:dab1  00 61		 brk #$61
$09:dab3  60			rts
$09:dab4  1a			inc a
$09:dab5  fc 7e ef	  jsr ($ef7e,x)
$09:dab8  07 4b		 ora [$4b]
$09:daba  a1 d1		 lda ($d1,x)
$09:dabc  68			pla
$09:dabd  b2 c9		 lda ($c9)
$09:dabf  04 4e		 tsb $4e
$09:dac1  21 0c		 and ($0c,x)
$09:dac3  86 3c		 stx $3c
$09:dac5  43 7f		 eor $7f,s
$09:dac7  4f dd d1 e9   eor $e9d1dd
$09:dacb  f3 3a		 sbc ($3a,s),y
$09:dacd  7c d6 5f	  jmp ($5fd6,x)
$09:dad0  10 89		 bpl $da5b
$09:dad2  8e ca 01	  stx $01ca
$09:dad5  e5 f0		 sbc $f0
$09:dad7  f5 78		 sbc $78,x
$09:dad9  3a			dec a
$09:dada  a8			tay
$09:dadb  15 4a		 ora $4a,x
$09:dadd  85 b4		 sta $b4
$09:dadf  82 52 19	  brl $f434
$09:dae2  42 11		 wdm #$11
$09:dae4  0f ef 8b fb   ora $fb8bef
$09:dae8  c2 f5		 rep #$f5
$09:daea  45 3e		 eor $3e
$09:daec  54 cf a4	  mvn $a4,$cf
$09:daef  22 91 b0 2e   jsl $2eb091
$09:daf3  0c 02 63	  tsb $6302
$09:daf6  31 55		 and ($55),y
$09:daf8  84 42		 sty $42
$09:dafa  20 c8 08	  jsr $08c8
$09:dafd  2c 15 ee	  bit $ee15
$09:db00  87 05		 sta [$05]
$09:db02  82 01 5a	  brl $3506
$09:db05  7b			tdc
$09:db06  01 c3		 ora ($c3,x)
$09:db08  60			rts
$09:db09  2c 76 08	  bit $0876
$09:db0c  e4 71		 cpx $71
$09:db0e  e2 01		 sep #$01
$09:db10  70 b0		 bvs $dac2
$09:db12  58			cli
$09:db13  1e 21 3f	  asl $3f21,x
$09:db16  e0 e1 ef	  cpx #$efe1
$09:db19  16 34		 asl $34,x
$09:db1b  a9 40 03	  lda #$0340
$09:db1e  01 60		 ora ($60,x)
$09:db20  80 13		 bra $db35
$09:db22  41 08		 eor ($08,x)
$09:db24  30 48		 bmi $db6e
$09:db26  10 18		 bpl $db40
$09:db28  00 ec		 brk #$ec
$09:db2a  ae 05 88	  ldx $8805
$09:db2d  40			rti
$09:db2e  16 92		 asl $92,x
$09:db30  c6 73		 dec $73
$09:db32  60			rts
$09:db33  4e 27 00	  lsr $0027
$09:db36  00 67		 brk #$67
$09:db38  7c 02 71	  jmp ($7102,x)
$09:db3b  00 9e		 brk #$9e
$09:db3d  4e 27 90	  lsr $9027
$09:db40  89 c4 c1	  bit #$c1c4
$09:db43  e6 0f		 inc $0f
$09:db45  32 98		 and ($98)
$09:db47  3b			tsc
$09:db48  0a			asl a
$09:db49  70 75		 bvs $dbc0
$09:db4b  02 d8		 cop #$d8
$09:db4d  1d 40 06	  ora $0640,x
$09:db50  47 b0		 eor [$b0]
$09:db52  9e 3c 02	  stz $023c,x
$09:db55  50 11		 bvc $db68
$09:db57  37 90		 and [$90],y
$09:db59  c7 03		 cmp [$03]
$09:db5b  40			rti
$09:db5c  7b			tdc
$09:db5d  19 40 84	  ora $8440,y
$09:db60  c0 24 75	  cpy #$7524
$09:db63  03 88		 ora $88,s
$09:db65  c7 e1		 cmp [$e1]
$09:db67  11 f8		 ora ($f8),y
$09:db69  74 6e		 stz $6e,x
$09:db6b  2f 0c 8c c1   and $c18c0c
$09:db6f  e1 ea		 sbc ($ea,x)
$09:db71  c1 5c		 cmp ($5c,x)
$09:db73  a3 04		 lda $04,s
$09:db75  07 6c		 ora [$6c]
$09:db77  bd 1f c4	  lda $c41f,x
$09:db7a  43 f1		 eor $f1,s
$09:db7c  70 ec		 bvs $db6a
$09:db7e  7a			ply
$09:db7f  26 19		 rol $19
$09:db81  8f 07 c1 ca   sta $cac107
$09:db85  0d f5 90	  ora $90f5
$09:db88  16 9c		 asl $9c,x
$09:db8a  be 17 8b	  ldx $8b17,y
$09:db8d  fc fe ef	  jsr ($effe,x)
$09:db90  2f 9c 54 e7   and $e7549c
$09:db94  d6 c8		 dec $c8,x
$09:db96  fc ee 0f	  jsr ($0fee,x)
$09:db99  1f 80 37 08   ora $083780,x
$09:db9d  58			cli
$09:db9e  0d c0 62	  ora $62c0
$09:dba1  c4 7b		 cpy $7b
$09:dba3  fd fc f7	  sbc $f7fc,x
$09:dba6  7d 23 9c	  adc $9c23,x
$09:dba9  ab			plb
$09:dbaa  e4 db		 cpx $db
$09:dbac  f1 dc		 sbc ($dc),y
$09:dbae  f0 7e		 beq $dc2e
$09:dbb0  20 1e 02	  jsr $021e
$09:dbb3  f8			sed
$09:dbb4  c4 13		 cpy $13
$09:dbb6  83 80		 sta $80,s
$09:dbb8  63 38		 adc $38,s
$09:dbba  3c 5e 40	  bit $405e,x
$09:dbbd  16 08		 asl $08,x
$09:dbbf  44 62 20	  mvp $20,$62
$09:dbc2  b7 37		 lda [$37],y
$09:dbc4  f1 88		 sbc ($88),y
$09:dbc6  40			rti
$09:dbc7  56 11		 lsr $11,x
$09:dbc9  06 39		 asl $39
$09:dbcb  97 c1		 sta [$c1],y
$09:dbcd  7a			ply
$09:dbce  13 c8		 ora ($c8,s),y
$09:dbd0  c0 44 5e	  cpy #$5e44
$09:dbd3  c0 d2 20	  cpy #$20d2
$09:dbd6  08			php
$09:dbd7  17 c6		 ora [$c6],y
$09:dbd9  31 18		 and ($18),y
$09:dbdb  10 83		 bpl $db60
$09:dbdd  f0 1c		 beq $dbfb
$09:dbdf  24 dc		 bit $dc
$09:dbe1  28			plp
$09:dbe2  44 12 23	  mvp $23,$12
$09:dbe5  08			php
$09:dbe6  78			sei
$09:dbe7  84 02		 sty $02
$09:dbe9  1d 08 83	  ora $8308,x
$09:dbec  bd c2 15	  lda $15c2,x
$09:dbef  05 8d		 ora $8d
$09:dbf1  41 61		 eor ($61,x)
$09:dbf3  90 c8		 bcc $dbbd
$09:dbf5  e8			inx
$09:dbf6  04 61		 tsb $61
$09:dbf8  e0 51 8f	  cpx #$8f51
$09:dbfb  82 4c 92	  brl $6e4a
$09:dbfe  8a			txa
$09:dbff  50 2d		 bvc $dc2e
$09:dc01  85 83		 sta $83
$09:dc03  01 20		 ora ($20,x)
$09:dc05  e0 4c 0b	  cpx #$0b4c
$09:dc08  6b			rtl
$09:dc09  80 c0		 bra $dbcb
$09:dc0b  70 38		 bvs $dc45
$09:dc0d  1e 02 c0	  asl $c002,x
$09:dc10  0a			asl a
$09:dc11  c4 be		 cpy $be
$09:dc13  30 18		 bmi $dc2d
$09:dc15  0c 19 08	  tsb $0819
$09:dc18  30 34		 bmi $dc4e
$09:dc1a  23 40		 and $40,s
$09:dc1c  e0 60 50	  cpx #$5060
$09:dc1f  18			clc
$09:dc20  81 04		 sta ($04,x)
$09:dc22  08			php
$09:dc23  20 5f 29	  jsr $295f
$09:dc26  65 ee		 adc $ee
$09:dc28  97 98		 sta [$98],y
$09:dc2a  8a			txa
$09:dc2b  7b			tdc
$09:dc2c  2d 78 ba	  and $ba78
$09:dc2f  a6 43		 ldx $43
$09:dc31  37 14		 and [$14],y
$09:dc33  85 c1		 sta $c1
$09:dc35  23 11		 and $11,s
$09:dc37  7e 3f ff	  ror $ff3f,x
$09:dc3a  cf ff 89 ff   cmp $ff89ff
$09:dc3e  ec 9e fe	  cpx $fe9e
$09:dc41  7f 7f 1f 9f   adc $9f1f7f,x
$09:dc45  04 80		 tsb $80
$09:dc47  20 06 40	  jsr $4006
$09:dc4a  32 09		 and ($09)
$09:dc4c  04 81		 tsb $81
$09:dc4e  96 48		 stx $48,y
$09:dc50  b2 13		 lda ($13)
$09:dc52  81 bf		 sta ($bf,x)
$09:dc54  87 a4		 sta [$a4]
$09:dc56  c5 21		 cmp $21
$09:dc58  db			stp
$09:dc59  23 fe		 and $fe,s
$09:dc5b  05 02		 ora $02
$09:dc5d  83 40		 sta $40,s
$09:dc5f  60			rts
$09:dc60  b0 58		 bcs $dcba
$09:dc62  7c 92 5f	  jmp ($5f92,x)
$09:dc65  06 87		 asl $87
$09:dc67  c2 a7		 rep #$a7
$09:dc69  72 db		 adc ($db)
$09:dc6b  fc 0a 00	  jsr ($000a,x)
$09:dc6e  34 08		 bit $08,x
$09:dc70  2c 08 88	  bit $8808
$09:dc73  12 f8		 ora ($f8)
$09:dc75  01 10		 ora ($10,x)
$09:dc77  27 70		 and [$70]
$09:dc79  4b			phk
$09:dc7a  f8			sed
$09:dc7b  f4 20 90	  pea $9020
$09:dc7e  4d 64 a3	  eor $a364
$09:dc81  79 90 fb	  adc $fb90,y
$09:dc84  48			pha
$09:dc85  bc d4 af	  ldy $afd4,x
$09:dc88  fc 5b ff	  jsr ($ff5b,x)
$09:dc8b  1a			inc a
$09:dc8c  fd c1 20	  sbc $20c1,x
$09:dc8f  1a			inc a
$09:dc90  c8			iny
$09:dc91  06 f2		 asl $f2
$09:dc93  01 f6		 ora ($f6,x)
$09:dc95  84 79		 sty $79
$09:dc97  a3 1f		 lda $1f,s
$09:dc99  f8			sed
$09:dc9a  03 a4		 ora $a4,s
$09:dc9c  1b			tcs
$09:dc9d  c2 af		 rep #$af
$09:dc9f  09 54 a2	  ora #$a254
$09:dca2  71 18		 adc ($18),y
$09:dca4  9e 42 23	  stz $2342,x
$09:dca7  d1 28		 cmp ($28),y
$09:dca9  fc 6e 7f	  jsr ($7f6e,x)
$09:dcac  31 b3		 and ($b3),y
$09:dcae  8f 42 55 00   sta $005542
$09:dcb2  9c 40 27	  stz $2740
$09:dcb5  90 08		 bcc $dcbf
$09:dcb7  f4 02 3f	  pea $3f02
$09:dcba  00 9f		 brk #$9f
$09:dcbc  c0 2e f0	  cpy #$f02e
$09:dcbf  88			dey
$09:dcc0  04 82		 tsb $82
$09:dcc2  00 a5		 brk #$a5
$09:dcc4  09 c4 a2	  ora #$a2c4
$09:dcc7  51 24		 eor ($24),y
$09:dcc9  df 65 3f d2   cmp $d23f65,x
$09:dccd  8f 66 a3 d8   sta $d8a366
$09:dcd1  10 10		 bpl $dce3
$09:dcd3  10 ca		 bpl $dc9f
$09:dcd5  22 1b e8 07   jsl $07e81b
$09:dcd9  fa			plx
$09:dcda  01 ec		 ora ($ec,x)
$09:dcdc  88			dey
$09:dcdd  0a			asl a
$09:dcde  c1 4e		 cmp ($4e,x)
$09:dce0  8c f1 87	  sty $87f1
$09:dce3  41 21		 eor ($21,x)
$09:dce5  f0 98		 beq $dc7f
$09:dce7  5c 42 26 30   jml $302642
$09:dceb  58			cli
$09:dcec  04 39		 tsb $39
$09:dcee  90 30		 bcc $dd20
$09:dcf0  b8			clv
$09:dcf1  24 4e		 bit $4e
$09:dcf3  18			clc
$09:dcf4  a9 2a 05	  lda #$052a
$09:dcf7  01 24		 ora ($24,x)
$09:dcf9  14 0f		 trb $0f
$09:dcfb  87 43		 sta [$43]
$09:dcfd  f1 18		 sbc ($18),y
$09:dcff  fe 6a 3f	  inc $3f6a,x
$09:dd02  84 f3		 sty $f3
$09:dd04  49 04 03	  eor #$0304
$09:dd07  e1 00		 sbc ($00,x)
$09:dd09  fc 40 0b	  jsr ($0b40,x)
$09:dd0c  c0 5e 35	  cpy #$355e
$09:dd0f  48			pha
$09:dd10  c0 a0 70	  cpy #$70a0
$09:dd13  13 b1		 ora ($b1,s),y
$09:dd15  0f 02 2e a7   ora $a72e02
$09:dd19  54 21 c2	  mvn $c2,$21
$09:dd1c  e0 07 e5	  cpx #$e507
$09:dd1f  c0 60 38	  cpy #$3860
$09:dd22  1c 0f 07	  trb $070f
$09:dd25  23 d1		 and $d1,s
$09:dd27  00 d0		 brk #$d0
$09:dd29  60			rts
$09:dd2a  34 09		 bit $09,x
$09:dd2c  03 80		 ora $80,s
$09:dd2e  70 20		 bvs $dd50
$09:dd30  1e 08 02	  asl $0208,x
$09:dd33  68			pla
$09:dd34  68			pla
$09:dd35  0a			asl a
$09:dd36  b0 3a		 bcs $dd72
$09:dd38  a2 04 20	  ldx #$2004
$09:dd3b  30 13		 bmi $dd50
$09:dd3d  f9 ac c5	  sbc $c5ac,y
$09:dd40  0a			asl a
$09:dd41  4b			phk
$09:dd42  67 48		 adc [$48]
$09:dd44  23 48		 and $48,s
$09:dd46  51 ec		 eor ($ec),y
$09:dd48  a1 27		 lda ($27,x)
$09:dd4a  09 27 da	  ora #$da27
$09:dd4d  2b			pld
$09:dd4e  02 c8		 cop #$c8
$09:dd50  c0 28 98	  cpy #$9828
$09:dd53  29 17 17	  and #$1717
$09:dd56  37 6c		 and [$6c],y
$09:dd58  9c 48 ef	  stz $ef48
$09:dd5b  b4 09		 ldy $09,x
$09:dd5d  7c 62 3f	  jmp ($3f62,x)
$09:dd60  1f cf e7 fb   ora $fbe7cf,x
$09:dd64  fd ff 6f	  sbc $6fff,x
$09:dd67  bf cb ff 83   lda $83ffcb,x
$09:dd6b  cf e6 77 fb   cmp $fb77e6
$09:dd6f  a5 ff		 lda $ff
$09:dd71  a3 00		 lda $00,s
$09:dd73  89 40 68	  bit #$6840
$09:dd76  98			tya
$09:dd77  3c 45 1f	  bit $1f45,x
$09:dd7a  64 f8		 stz $f8
$09:dd7c  0c 45 f2	  tsb $f245
$09:dd7f  09 e8 98	  ora #$98e8
$09:dd82  7c 7e 3f	  jmp ($3f7e,x)
$09:dd85  3f 9f df ef   and $efdf9f,x
$09:dd89  6f f7 d3 bf   adc $bfd3f7
$09:dd8d  dc 0f c6	  jml [$c60f]
$09:dd90  63 f9		 adc $f9,s
$09:dd92  5c fe 40 a1   jml $a140fe
$09:dd96  90 18		 bcc $ddb0
$09:dd98  f1 20		 sbc ($20),y
$09:dd9a  21 10		 and ($10,x)
$09:dd9c  78			sei
$09:dd9d  12 e1		 ora ($e1)
$09:dd9f  20 11 e8	  jsr $e811
$09:dda2  f4 7c 82	  pea $827c
$09:dda5  30 f8		 bmi $dd9f
$09:dda7  7c 0d 68	  jmp ($680d,x)
$09:ddaa  28			plp
$09:ddab  12 8e		 ora ($8e)
$09:ddad  44 e1 f0	  mvp $f0,$e1
$09:ddb0  09 3c a2	  ora #$a23c
$09:ddb3  37 04		 and [$04],y
$09:ddb5  8c 41 e1	  sty $e141
$09:ddb8  84 73		 sty $73
$09:ddba  87 90		 sta [$90]
$09:ddbc  4a			lsr a
$09:ddbd  7e 64 22	  ror $2264,x
$09:ddc0  1d 44 22	  ora $2244,x
$09:ddc3  12 09		 ora ($09)
$09:ddc5  02 dc		 cop #$dc
$09:ddc7  16 ea		 asl $ea,x
$09:ddc9  72 f4		 adc ($f4)
$09:ddcb  19 42 21	  ora $2142,y
$09:ddce  08			php
$09:ddcf  d6 48		 dec $48,x
$09:ddd1  e4 56		 cpx $56
$09:ddd3  af 66 f3 54   lda $54f366
$09:ddd7  f8			sed
$09:ddd8  56 1e		 lsr $1e,x
$09:ddda  04 73		 tsb $73
$09:dddc  01 2b		 ora ($2b,x)
$09:ddde  b1 c3		 lda ($c3),y
$09:dde0  27 e3		 and [$e3]
$09:dde2  30 ab		 bmi $dd8f
$09:dde4  ca			dex
$09:dde5  3c d1 9e	  bit $9ed1,x
$09:dde8  9c b3 f3	  stz $f3b3
$09:ddeb  06 ce		 asl $ce
$09:dded  58			cli
$09:ddee  ed 71 45	  sbc $4571
$09:ddf1  e0 c0 26	  cpx #$26c0
$09:ddf4  9f 6c 87 4a   sta $4a876c,x
$09:ddf8  55 63		 eor $63,x
$09:ddfa  83 58		 sta $58,s
$09:ddfc  f7 5f		 sbc [$5f],y
$09:ddfe  3c 67 fa	  bit $fa67,x
$09:de01  01 9c		 ora ($9c,x)
$09:de03  1e 87 da	  asl $da87,x
$09:de06  11 d2		 ora ($d2),y
$09:de08  96 5a		 stx $5a,y
$09:de0a  f2 96		 sbc ($96)
$09:de0c  fc 87 ee	  jsr ($ee87,x)
$09:de0f  08			php
$09:de10  da			phx
$09:de11  38			sec
$09:de12  04 b6		 tsb $b6
$09:de14  df 19 be c1   cmp $c1be19,x
$09:de18  a7 d0		 lda [$d0]
$09:de1a  b9 c4 52	  lda $52c4,y
$09:de1d  61 13		 adc ($13,x)
$09:de1f  99 43 63	  sta $6343,y
$09:de22  a3 30		 lda $30,s
$09:de24  b7 c4		 lda [$c4],y
$09:de26  2f b0 29 f4   and $f429b0
$09:de2a  06 77		 asl $77
$09:de2c  04 9a		 tsb $9a
$09:de2e  c2 a6		 rep #$a6
$09:de30  70 c8		 bvs $ddfa
$09:de32  ec 08 a2	  cpx $a208
$09:de35  1e 4f 35	  asl $354f,x
$09:de38  62 e5 a2	  per $8120
$09:de3b  99 6a a7	  sta $a76a,y
$09:de3e  5a			phy
$09:de3f  49 f4 82	  eor #$82f4
$09:de42  79 40 b8	  adc $b840,y
$09:de45  40			rti
$09:de46  30 1e		 bmi $de66
$09:de48  68			pla
$09:de49  c5 eb		 cmp $eb
$09:de4b  09 b2 a6	  ora #$a6b2
$09:de4e  6e a8 9b	  ror $9ba8
$09:de51  ea			nop
$09:de52  04 f3		 tsb $f3
$09:de54  81 70		 sta ($70,x)
$09:de56  c0 60 20	  cpy #$2060
$09:de59  11 b9		 ora ($b9),y
$09:de5b  9c 52 6b	  stz $6b52
$09:de5e  17 9b		 ora [$9b],y
$09:de60  c3 67		 cmp $67,s
$09:de62  f0 28		 beq $de8c
$09:de64  f4 0a 0d	  pea $0d0a
$09:de67  00 2d		 brk #$2d
$09:de69  88			dey
$09:de6a  14 a6		 trb $a6
$09:de6c  f0 85		 beq $ddf3
$09:de6e  e0 47 a0	  cpx #$a047
$09:de71  30 68		 bmi $dedb
$09:de73  09 b8 ac	  ora #$acb8
$09:de76  9f ed a6 fb   sta $fba6ed,x
$09:de7a  09 9e 98	  ora #$989e
$09:de7d  47 3a		 eor [$3a]
$09:de7f  15 8d		 ora $8d,x
$09:de81  04 e3		 tsb $e3
$09:de83  81 f0		 sta ($f0,x)
$09:de85  56 83		 lsr $83,x
$09:de87  68			pla
$09:de88  04 e1		 tsb $e1
$09:de8a  9e b0 0a	  stz $0ab0,x
$09:de8d  43 b1		 eor $b1,s
$09:de8f  20 dc 50	  jsr $50dc
$09:de92  0b			phd
$09:de93  83 00		 sta $00,s
$09:de95  8b			phb
$09:de96  c7 e1		 cmp [$e1]
$09:de98  91 c8		 sta ($c8),y
$09:de9a  44 61 f6	  mvp $f6,$61
$09:de9d  10 66		 bpl $df05
$09:de9f  68			pla
$09:dea0  41 d5		 eor ($d5,x)
$09:dea2  45 1f		 eor $1f
$09:dea4  80 47		 bra $deed
$09:dea6  20 71 88	  jsr $8871
$09:dea9  38			sec
$09:deaa  2c 8f 47	  bit $478f
$09:dead  00 b0		 brk #$b0
$09:deaf  5c 2a 17 8e   jml $8e172a
$09:deb3  87 63		 sta [$63]
$09:deb5  21 98		 and ($98,x)
$09:deb7  35 0d		 and $0d,x
$09:deb9  81 14		 sta ($14,x)
$09:debb  42 b0		 wdm #$b0
$09:debd  bc 60 0c	  ldy $0c60,x
$09:dec0  e1 98		 sbc ($98,x)
$09:dec2  b0 26		 bcs $deea
$09:dec4  16 01		 asl $01,x
$09:dec6  01 82		 ora ($82,x)
$09:dec8  c1 a1		 cmp ($a1,x)
$09:deca  d0 13		 bne $dedf
$09:decc  d0 12		 bne $dee0
$09:dece  c9 14 70	  cmp #$7014
$09:ded1  58			cli
$09:ded2  02 ca		 cop #$ca
$09:ded4  e0 14 0a	  cpx #$0a14
$09:ded7  02 38		 cop #$38
$09:ded9  30 1e		 bmi $def9
$09:dedb  00 e8		 brk #$e8
$09:dedd  31 df		 and ($df),y
$09:dedf  00 d2		 brk #$d2
$09:dee1  b8			clv
$09:dee2  00 04		 brk #$04
$09:dee4  10 00		 bpl $dee6
$09:dee6  40			rti
$09:dee7  a1 bb		 lda ($bb,x)
$09:dee9  fa			plx
$09:deea  99 4f 00	  sta $004f,y
$09:deed  db			stp
$09:deee  bc 29 35	  ldy $3529,x
$09:def1  70 95		 bvs $de88
$09:def3  50 e8		 bvc $dedd
$09:def5  94 5f		 sty $5f,x
$09:def7  07 a2		 ora [$a2]
$09:def9  4e 24 80	  lsr $8024
$09:defc  f8			sed
$09:defd  fa			plx
$09:defe  3c 12 71	  bit $7112,x
$09:df01  10 0d		 bpl $df10
$09:df03  54 5c 42	  mvn $42,$5c
$09:df06  21 11		 and ($11,x)
$09:df08  91 15		 sta ($15),y
$09:df0a  05 ea		 ora $ea
$09:df0c  54 71 fb	  mvn $fb,$71
$09:df0f  18			clc
$09:df10  d8			cld
$09:df11  9f e2 03 1d   sta $1d03e2,x
$09:df15  90 cc		 bcc $dee3
$09:df17  06 c2		 asl $c2
$09:df19  2e 51 21	  rol $2151
$09:df1c  24 d0		 bit $d0
$09:df1e  3e 6a 29	  rol $296a,x
$09:df21  0f 8d c6 b8   ora $b8c68d
$09:df25  b3 1b		 lda ($1b,s),y
$09:df27  80 c8		 bra $def1
$09:df29  16 46		 asl $46,x
$09:df2b  1f 1b 5d 91   ora $915d1b,x
$09:df2f  86 36		 stx $36
$09:df31  a1 10		 lda ($10,x)
$09:df33  30 8c		 bmi $dec1
$09:df35  3e 35 e8	  rol $e835,x
$09:df38  03 4c		 ora $4c,s
$09:df3a  6b			rtl
$09:df3b  a3 20		 lda $20,s
$09:df3d  69 1b 3d	  adc #$3d1b
$09:df40  c4 40		 cpy $40
$09:df42  da			phx
$09:df43  47 7e		 eor [$7e]
$09:df45  d3 df		 cmp ($df,s),y
$09:df47  fb			xce
$09:df48  57 07		 eor [$07],y
$09:df4a  ea			nop
$09:df4b  e1 56		 sbc ($56,x)
$09:df4d  c0 93 44	  cpy #$4493
$09:df50  20 b0 8d	  jsr $8db0
$09:df53  8c 06 91	  sty $9106
$09:df56  52 13		 eor ($13)
$09:df58  61 5c		 adc ($5c,x)
$09:df5a  c2 84		 rep #$84
$09:df5c  14 50		 trb $50
$09:df5e  ba			tsx
$09:df5f  15 ac		 ora $ac,x
$09:df61  28			plp
$09:df62  a1 93		 lda ($93,x)
$09:df64  f9 33 23	  sbc $2333,y
$09:df67  fc f4 e6	  jsr ($e6f4,x)
$09:df6a  c9 f9 e1	  cmp #$e1f9
$09:df6d  ce 8f fc	  dec $fc8f
$09:df70  a1 02		 lda ($02,x)
$09:df72  c3 3f		 cmp $3f,s
$09:df74  c0 e8 fc	  cpy #$fce8
$09:df77  02 30		 cop #$30
$09:df79  b1 20		 lda ($20),y
$09:df7b  8e c2 22	  stx $22c2
$09:df7e  4f 40 c8 10   eor $10c840
$09:df82  46 63		 lsr $63
$09:df84  01 92		 ora ($92,x)
$09:df86  78			sei
$09:df87  18			clc
$09:df88  2a			rol a
$09:df89  c1 52		 cmp ($52,x)
$09:df8b  b8			clv
$09:df8c  33 f7		 and ($f7,s),y
$09:df8e  c1 43		 cmp ($43,x)
$09:df90  77 ed		 adc [$ed],y
$09:df92  3d ff b5	  and $b5ff,x
$09:df95  70 7e		 bvs $e015
$09:df97  a6 49		 ldx $49
$09:df99  32 1e		 and ($1e)
$09:df9b  8b			phb
$09:df9c  8a			txa
$09:df9d  e1 51		 sbc ($51,x)
$09:df9f  c2 8e		 rep #$8e
$09:dfa1  14 48		 trb $48
$09:dfa3  5a			phy
$09:dfa4  d9 0a 9e	  cmp $9e0a,y
$09:dfa7  12 c9		 ora ($c9)
$09:dfa9  24 1f		 bit $1f
$09:dfab  c1 9a		 cmp ($9a,x)
$09:dfad  19 88 cc	  ora $cc88,y
$09:dfb0  54 2f 9c	  mvn $9c,$2f
$09:dfb3  20 6e 79	  jsr $796e
$09:dfb6  16 25		 asl $25,x
$09:dfb8  3a			dec a
$09:dfb9  1f f0 c8 44   ora $44c8f0,x
$09:dfbd  42 75		 wdm #$75
$09:dfbf  a4 f9		 ldy $f9
$09:dfc1  a1 a0		 lda ($a0,x)
$09:dfc3  4c 96 22	  jmp $2296
$09:dfc6  b9 d8 44	  lda $44d8,y
$09:dfc9  e1 e8		 sbc ($e8,x)
$09:dfcb  1b			tcs
$09:dfcc  23 99		 and $99,s
$09:dfce  46 e0		 lsr $e0
$09:dfd0  55 56		 eor $56,x
$09:dfd2  8b			phb
$09:dfd3  99 55 a2	  sta $a255,y
$09:dfd6  f4 37 7e	  pea $7e37
$09:dfd9  d3 df		 cmp ($df,s),y
$09:dfdb  f6 fc		 inc $fc,x
$09:dfdd  0a			asl a
$09:dfde  b8			clv
$09:dfdf  3e a9 54	  rol $54a9,x
$09:dfe2  da			phx
$09:dfe3  1a			inc a
$09:dfe4  44 83 eb	  mvp $eb,$83
$09:dfe7  e0 f4 d1	  cpx #$d1f4
$09:dfea  a8			tay
$09:dfeb  e1 e0		 sbc ($e0,x)
$09:dfed  4f a9 48 7d   eor $7d48a9
$09:dff1  1e 11 61	  asl $6111,x
$09:dff4  20 c1 26	  jsr $26c1
$09:dff7  24 13		 bit $13
$09:dff9  15 29		 ora $29,x
$09:dffb  3e 07 6a	  rol $6a07,x
$09:dffe  60			rts
$09:dfff  72 5f		 adc ($5f)
$09:e001  8f 0d 5a 06   sta $065a0d
$09:e005  72 40		 adc ($40)
$09:e007  90 ac		 bcc $dfb5
$09:e009  c4 c4		 cpy $c4
$09:e00b  38			sec
$09:e00c  04 81		 tsb $81
$09:e00e  8e c8 60	  stx $60c8
$09:e011  e8			inx
$09:e012  01 15		 ora ($15,x)
$09:e014  95 71		 sta $71,x
$09:e016  5e 17 04	  lsr $0417,x
$09:e019  00 5c		 brk #$5c
$09:e01b  55 e2		 eor $e2,x
$09:e01d  b0 11		 bcs $e030
$09:e01f  60			rts
$09:e020  d9 17 e1	  cmp $e117,y
$09:e023  6a			ror a
$09:e024  1b			tcs
$09:e025  05 ad		 ora $ad
$09:e027  7e 2c 01	  ror $012c,x
$09:e02a  16 0b		 asl $0b,x
$09:e02c  ac 6b a8	  ldy $a86b
$09:e02f  00 af		 brk #$af
$09:e031  3a			dec a
$09:e032  8e ba cc	  stx $ccba
$09:e035  51 b0		 eor ($b0),y
$09:e037  35 62		 and $62,x
$09:e039  87 44		 sta [$44]
$09:e03b  a2 b5 4d	  ldx #$4db5
$09:e03e  c4 ce		 cpy $ce
$09:e040  f1 b4		 sbc ($b4),y
$09:e042  d7 eb		 cmp [$eb],y
$09:e044  4d 90 b0	  eor $b090
$09:e047  ab			plb
$09:e048  c2 c4		 rep #$c4
$09:e04a  fb			xce
$09:e04b  5f 07 82 ce   eor $ce8207,x
$09:e04f  d6 15		 dec $15,x
$09:e051  f8			sed
$09:e052  35 8d		 and $8d,x
$09:e054  de 3e 9f	  dec $9f3e,x
$09:e057  db			stp
$09:e058  55 03		 eor $03,x
$09:e05a  4c 12 01	  jmp $0112
$09:e05d  26 7a		 rol $7a
$09:e05f  1a			inc a
$09:e060  8a			txa
$09:e061  3a			dec a
$09:e062  f1 5f		 sbc ($5f),y
$09:e064  93 3c		 sta ($3c,s),y
$09:e066  bb			tyx
$09:e067  e6 ec		 inc $ec
$09:e069  ac d7 eb	  ldy $ebd7
$09:e06c  ee f1 5a	  inc $5af1
$09:e06f  80 28		 bra $e099
$09:e071  da			phx
$09:e072  c3 66		 cmp $66,s
$09:e074  7c 03 bc	  jmp ($bc03,x)
$09:e077  58			cli
$09:e078  a0 75 66	  ldy #$6675
$09:e07b  90 bb		 bcc $e038
$09:e07d  d9 6e 8a	  cmp $8a6e,y
$09:e080  d3 61		 cmp ($61,s),y
$09:e082  4a			lsr a
$09:e083  f7 fc		 sbc [$fc],y
$09:e085  07 58		 ora [$58]
$09:e087  64 22		 stz $22
$09:e089  5d 80 a9	  eor $a980,x
$09:e08c  68			pla
$09:e08d  77 25		 adc [$25],y
$09:e08f  99 ba 01	  sta $01ba,y
$09:e092  56 63		 lsr $63,x
$09:e094  b0 59		 bcs $e0ef
$09:e096  9a			txs
$09:e097  e7 61		 sbc [$61]
$09:e099  ae 0d 56	  ldx $560d
$09:e09c  e0 fe 48	  cpx #$48fe
$09:e09f  05 90		 ora $90
$09:e0a1  8a			txa
$09:e0a2  b6 a7		 ldx $a7,y
$09:e0a4  77 93		 adc [$93],y
$09:e0a6  f4 9d 00	  pea $009d
$09:e0a9  43 b4		 eor $b4,s
$09:e0ab  17 a2		 ora [$a2],y
$09:e0ad  cd 27 44	  cmp $4427
$09:e0b0  97 82		 sta [$82],y
$09:e0b2  b4 f5		 ldy $f5,x
$09:e0b4  79 38 58	  adc $5838,y
$09:e0b7  a4 f6		 ldy $f6
$09:e0b9  74 84		 stz $84,x
$09:e0bb  05 4d		 ora $4d
$09:e0bd  84 e9		 sty $e9
$09:e0bf  83 f2		 sta $f2,s
$09:e0c1  41 95		 eor ($95,x)
$09:e0c3  f2 15		 sbc ($15)
$09:e0c5  1f 76 a9 5f   ora $5fa976,x
$09:e0c9  09 d0 f0	  ora #$f0d0
$09:e0cc  7b			tdc
$09:e0cd  20 d1 d5	  jsr $d5d1
$09:e0d0  7c 7a 13	  jmp ($137a,x)
$09:e0d3  21 e1		 and ($e1,x)
$09:e0d5  83 49		 sta $49,s
$09:e0d7  55 d0		 eor $d0,x
$09:e0d9  3f 4f 45 a4   and $a4454f,x
$09:e0dd  f2 47		 sbc ($47)
$09:e0df  92 47		 sta ($47)
$09:e0e1  a0 99 fd	  ldy #$fd99
$09:e0e4  09 f4 08	  ora #$08f4
$09:e0e7  3a			dec a
$09:e0e8  b9 7c 17	  lda $177c,y
$09:e0eb  1a			inc a
$09:e0ec  e0 c5 6c	  cpx #$6cc5
$09:e0ef  4f a4 b5 d9   eor $d9b5a4
$09:e0f3  08			php
$09:e0f4  2a			rol a
$09:e0f5  b2 47		 lda ($47)
$09:e0f7  7f bc 37 c0   adc $c037bc,x
$09:e0fb  00 34		 brk #$34
$09:e0fd  7b			tdc
$09:e0fe  bf 82 4e 80   lda $804e82,x
$09:e102  24 fb		 bit $fb
$09:e104  c0 17 24	  cpy #$2417
$09:e107  d9 05 7b	  cmp $7b05,y
$09:e10a  d6 42		 dec $42,x
$09:e10c  06 94		 asl $94
$09:e10e  8b			phb
$09:e10f  34 19		 bit $19,x
$09:e111  21 95		 and ($95,x)
$09:e113  dd 52 83	  cmp $8352,x
$09:e116  2b			pld
$09:e117  b1 e8		 lda ($e8),y
$09:e119  32 88		 and ($88)
$09:e11b  4b			phk
$09:e11c  f1 5d		 sbc ($5d),y
$09:e11e  93 2b		 sta ($2b,s),y
$09:e120  c6 4e		 dec $4e
$09:e122  4f 8a ea ec   eor $ecea8a
$09:e126  94 40		 sty $40,x
$09:e128  b5 4a		 lda $4a,x
$09:e12a  ed 1a 8f	  sbc $8f1a
$09:e12d  43 5c		 eor $5c,s
$09:e12f  0d 84 6e	  ora $6e84
$09:e132  cf b5 80 11   cmp $1180b5
$09:e136  d8			cld
$09:e137  16 cb		 asl $cb,x
$09:e139  67 0e		 adc [$0e]
$09:e13b  78			sei
$09:e13c  b7 c7		 lda [$c7],y
$09:e13e  de 4f f3	  dec $f34f,x
$09:e141  07 9c		 ora [$9c]
$09:e143  72 bf		 adc ($bf)
$09:e145  5f ad 1c ad   eor $ad1cad,x
$09:e149  82 16 73	  brl $5462
$09:e14c  95 bc		 sta $bc,x
$09:e14e  d9 2f 0b	  cmp $0b2f,y
$09:e151  1c 57 fb	  trb $fb57
$09:e154  03 68		 ora $68,s
$09:e156  74 4a		 stz $4a,x
$09:e158  2b			pld
$09:e159  86 59		 stx $59
$09:e15b  e0 ef bb	  cpx #$bbef
$09:e15e  0d 72 b8	  ora $b872
$09:e161  ef b8 05 92   sbc $9205b8
$09:e165  c8			iny
$09:e166  0f c4 48 07   ora $0748c4
$09:e16a  fc 61 ef	  jsr ($ef61,x)
$09:e16d  14 ac		 trb $ac
$09:e16f  a3 c1		 lda $c1,s
$09:e171  20 6e f1	  jsr $f16e
$09:e174  b4 a3		 ldy $a3,x
$09:e176  ca			dex
$09:e177  cc cf 05	  cpy $05cf
$09:e17a  01 bb		 ora ($bb,x)
$09:e17c  c5 3e		 cmp $3e
$09:e17e  1e 85 08	  asl $0885,x
$09:e181  57 60		 eor [$60],y
$09:e183  b3 f8		 lda ($f8,s),y
$09:e185  2b			pld
$09:e186  84 8b		 sty $8b
$09:e188  e2 68		 sep #$68
$09:e18a  17 08		 ora [$08],y
$09:e18c  57 61		 eor [$61],y
$09:e18e  7e 98 59	  ror $5998,x
$09:e191  ed 4e 42	  sbc $424e
$09:e194  85 18		 sta $18
$09:e196  47 9a		 eor [$9a]
$09:e198  10 7b		 bpl $e215
$09:e19a  a0 60 d7	  ldy #$d760
$09:e19d  2c 48 c9	  bit $c948
$09:e1a0  0e 0d 90	  asl $900d
$09:e1a3  76 a8		 ror $a8,x
$09:e1a5  23 1b		 and $1b,s
$09:e1a7  ca			dex
$09:e1a8  c9 07		 cmp #$07
$09:e1aa  10 fd		 bpl $e1a9
$09:e1ac  0b			phd
$09:e1ad  8a			txa
$09:e1ae  ac 89 28	  ldy $2889
$09:e1b1  c5 7a		 cmp $7a
$09:e1b3  ec 9c d2	  cpx $d29c
$09:e1b6  1e 98 37	  asl $3798,x
$09:e1b9  a1 ca		 lda ($ca,x)
$09:e1bb  ef 80 34 07   sbc $073480
$09:e1bf  9b			txy
$09:e1c0  55 e0		 eor $e0,x
$09:e1c2  22 bb e0 8e   jsl $8ee0bb
$09:e1c6  42 0f		 wdm #$0f
$09:e1c8  90 d9		 bcc $e1a3
$09:e1ca  49 c1		 eor #$c1
$09:e1cc  f2 39		 sbc ($39)
$09:e1ce  20 f4 fa	  jsr $faf4
$09:e1d1  2e 2a 80	  rol $802a
$09:e1d4  b8			clv
$09:e1d5  03 82		 ora $82,s
$09:e1d7  b2 63		 lda ($63)
$09:e1d9  27 a9		 and [$a9]
$09:e1db  78			sei
$09:e1dc  2d 6b 80	  and $806b
$09:e1df  b5 07		 lda $07,x
$09:e1e1  82 cc a3	  brl $85b0
$09:e1e4  03 a8		 ora $a8,s
$09:e1e6  11 4d		 ora ($4d),y
$09:e1e8  8a			txa
$09:e1e9  25 80		 and $80
$09:e1eb  2b			pld
$09:e1ec  8b			phb
$09:e1ed  51 0b		 eor ($0b),y
$09:e1ef  00 6a		 brk #$6a
$09:e1f1  20 f0 12	  jsr $12f0
$09:e1f4  01 88		 ora ($88,x)
$09:e1f6  88			dey
$09:e1f7  00 35		 brk #$35
$09:e1f9  22 9c 5c a6   jsl $a65c9c
$09:e1fd  78			sei
$09:e1fe  65 b8		 adc $b8
$09:e200  b2 4d		 lda ($4d)
$09:e202  20 09 31	  jsr $3109
$09:e205  48			pha
$09:e206  03 19		 ora $19,s
$09:e208  d4 00		 pei ($00)
$09:e20a  b5 76		 lda $76,x
$09:e20c  17 b4		 ora [$b4],y
$09:e20e  fd 5f 1e	  sbc $1e5f,x
$09:e211  18			clc
$09:e212  30 a8		 bmi $e1bc
$09:e214  64 e8		 stz $e8
$09:e216  33 52		 and ($52,s),y
$09:e218  1f bb 54 2b   ora $2b54bb,x
$09:e21c  27 ab		 and [$ab]
$09:e21e  c0 05 44	  cpy #$4405
$09:e221  f3 98		 sbc ($98,s),y
$09:e223  04 9c		 tsb $9c
$09:e225  1e 40 4a	  asl $4a40,x
$09:e228  93 8c		 sta ($8c,s),y
$09:e22a  08			php
$09:e22b  0b			phd
$09:e22c  1e 8b 8a	  asl $8a8b,x
$09:e22f  44 2e 08	  mvp $08,$2e
$09:e232  24 05		 bit $05
$09:e234  25 ad		 and $ad
$09:e236  42 16		 wdm #$16
$09:e238  a3 92		 lda $92,s
$09:e23a  56 6b		 lsr $6b,x
$09:e23c  f5 fa		 sbc $fa,x
$09:e23e  d0 f8		 bne $e238
$09:e240  11 46		 ora ($46),y
$09:e242  83 3b		 sta $3b,s
$09:e244  32 04		 and ($04)
$09:e246  2c e0 e0	  bit $e0e0
$09:e249  4d 19 54	  eor $5419
$09:e24c  d3 00		 cmp ($00,s),y
$09:e24e  74 12		 stz $12,x
$09:e250  fc 9c c0	  jsr ($c09c,x)
$09:e253  c8			iny
$09:e254  26 f9		 rol $f9
$09:e256  56 85		 lsr $85,x
$09:e258  72 c5		 adc ($c5)
$09:e25a  00 4e		 brk #$4e
$09:e25c  0a			asl a
$09:e25d  64 54		 stz $54
$09:e25f  02 bb		 cop #$bb
$09:e261  25 f0		 and $f0
$09:e263  ab			plb
$09:e264  05 5a		 ora $5a
$09:e266  ab			plb
$09:e267  8f 64 fb 6b   sta $6bfb64
$09:e26b  d2 e2		 cmp ($e2)
$09:e26d  9b			txy
$09:e26e  20 b3 57	  jsr $57b3
$09:e271  68			pla
$09:e272  d4 7a		 pei ($7a)
$09:e274  1a			inc a
$09:e275  ac 9e 74	  ldy $749e
$09:e278  de a0 5f	  dec $5fa0,x
$09:e27b  87 3c		 sta [$3c]
$09:e27d  5b			tcd
$09:e27e  e3 e2		 sbc $e2,s
$09:e280  ac d7 ca	  ldy $cad7
$09:e283  61 5a		 adc ($5a,x)
$09:e285  1b			tcs
$09:e286  cd 98 f6	  cmp $f698
$09:e289  1e 0b 39	  asl $390b,x
$09:e28c  44 ad 03	  mvp $03,$ad
$09:e28f  c4 ae		 cpy $ae
$09:e291  c1 67		 cmp ($67,x)
$09:e293  f0 54		 beq $e2e9
$09:e295  a8			tay
$09:e296  18			clc
$09:e297  87 c2		 sta [$c2]
$09:e299  6c 58 5f	  jmp ($5f58)
$09:e29c  a6 16		 ldx $16
$09:e29e  76 0a		 ror $0a,x
$09:e2a0  e9 90		 sbc #$90
$09:e2a2  3d 26 c5	  and $c526,x
$09:e2a5  84 79		 sty $79
$09:e2a7  a1 08		 lda ($08,x)
$09:e2a9  61 3c		 adc ($3c,x)
$09:e2ab  bd 85 de	  lda $de85,x
$09:e2ae  0f 01 44 44   ora $444401
$09:e2b2  01 fe		 ora ($fe,x)
$09:e2b4  00 01		 brk #$01
$09:e2b6  4c 43 d5	  jmp $d543
$09:e2b9  55 30		 eor $30,x
$09:e2bb  f6 45		 inc $45,x
$09:e2bd  ce d8 6e	  dec $6ed8
$09:e2c0  08			php
$09:e2c1  a3 a1		 lda $a1,s
$09:e2c3  d1 28		 cmp ($28),y
$09:e2c5  a6 40		 ldx $40
$09:e2c7  b5 90		 lda $90,x
$09:e2c9  61 de		 adc ($de,x)
$09:e2cb  37 15		 and [$15],y
$09:e2cd  28			plp
$09:e2ce  bd aa d6	  lda $d6aa,x
$09:e2d1  b5 17		 lda $17,x
$09:e2d3  b5 1d		 lda $1d,x
$09:e2d5  80 29		 bra $e300
$09:e2d7  e2 5f		 sep #$5f
$09:e2d9  1b			tcs
$09:e2da  79 1f cf	  adc $cf1f,y
$09:e2dd  e1 59		 sbc ($59,x)
$09:e2df  af d7 eb 44   lda $44ebd7
$09:e2e3  ea			nop
$09:e2e4  b3 36		 lda ($36,s),y
$09:e2e6  42 ce		 wdm #$ce
$09:e2e8  4e a5 40	  lsr $40a5
$09:e2eb  9c 80 9f	  stz $9f80
$09:e2ee  36 1a		 rol $1a,x
$09:e2f0  e0 0c		 cpx #$0c
$09:e2f2  49 f5		 eor #$f5
$09:e2f4  64 09		 stz $09
$09:e2f6  8b			phb
$09:e2f7  bc 6d 26	  ldy $266d,x
$09:e2fa  b0 59		 bcs $e355
$09:e2fc  c3 bc		 cmp $bc,s
$09:e2fe  2a			rol a
$09:e2ff  34 e6		 bit $e6,x
$09:e301  15 3b		 ora $3b,x
$09:e303  82 ac d1	  brl $b4b2
$09:e306  b6 78		 ldx $78,y
$09:e308  37 f0		 and [$f0],y
$09:e30a  a7 4f		 lda [$4f]
$09:e30c  af 05 f8 73   lda $73f805
$09:e310  c5 be		 cmp $be
$09:e312  3e f2 7f	  rol $7ff2,x
$09:e315  98			tya
$09:e316  3c e3 e8	  bit $e8e3,x
$09:e319  2f 49 fa 7a   and $7afa49
$09:e31d  2b			pld
$09:e31e  ea			nop
$09:e31f  fd a7 2f	  sbc $2fa7,x
$09:e322  f6 ac		 inc $ac,x
$09:e324  cf da 1b 7f   cmp $7f1bda
$09:e328  53 de		 eor ($de,s),y
$09:e32a  ff f0 87 88   sbc $8887f0,x
$09:e32e  7c 65 e4	  jmp ($e465,x)
$09:e331  3f 2a 79 97   and $97792a,x
$09:e335  ce de 87	  dec $87de
$09:e338  f4 c7 a7	  pea $a7c7
$09:e33b  8e be af	  stx $afbe
$09:e33e  da			phx
$09:e33f  72 ff		 adc ($ff)
$09:e341  6a			ror a
$09:e342  cc fd a1	  cpy $a1fd
$09:e345  b7 f5		 lda [$f5],y
$09:e347  3d 16 af	  and $af16,x
$09:e34a  47 86		 eor [$86]
$09:e34c  8d 47 77	  sta $7747
$09:e34f  4d 86 b9	  eor $b986
$09:e352  70 7e		 bvs $e3d2
$09:e354  5c 02 c9 6a   jml $6ac902
$09:e358  06 64		 asl $64
$09:e35a  02 ba		 cop #$ba
$09:e35c  1c f1 6f	  trb $6ff1
$09:e35f  8f bd 3c 15   sta $153cbd
$09:e363  95 78		 sta $78,x
$09:e365  56 88		 lsr $88,x
$09:e367  b5 66		 lda $66,x
$09:e369  f4 78 2c	  pea $2c78
$09:e36c  e4 5a		 cpx $5a
$09:e36e  ae f8 3d	  ldx $3df8
$09:e371  15 e2		 ora $e2,x
$09:e373  2d 02 42	  and $4202
$09:e376  b9 62 22	  lda $2262,y
$09:e379  dd 92 c8	  cmp $c892,x
$09:e37c  54 93 10	  mvn $10,$93
$09:e37f  2b			pld
$09:e380  e2 d0		 sep #$d0
$09:e382  fc 1a 72	  jsr ($721a,x)
$09:e385  fe aa 54	  inc $54aa,x
$09:e388  ca			dex
$09:e389  1d 59 9f	  ora $9f59,x
$09:e38c  74 36		 stz $36,x
$09:e38e  ef 93 c9 c7   sbc $c7c993
$09:e392  d4 f0		 pei ($f0)
$09:e394  1c 93 ca	  trb $ca93
$09:e397  af 06 0a 41   lda $410a06
$09:e39b  3c bd 30	  bit $30bd,x
$09:e39e  6d 50 95	  adc $9550
$09:e3a1  75 01		 adc $01,x
$09:e3a3  e3 f0		 sbc $f0,s
$09:e3a5  c1 90		 cmp ($90,x)
$09:e3a7  40			rti
$09:e3a8  35 41		 and $41,x
$09:e3aa  98			tya
$09:e3ab  07 d0		 ora [$d0]
$09:e3ad  6c be 01	  jmp ($01be)
$09:e3b0  18			clc
$09:e3b1  0b			phd
$09:e3b2  fc 81 e5	  jsr ($e581,x)
$09:e3b5  1f 11 08 50   ora $500811,x
$09:e3b9  90 68		 bcc $e423
$09:e3bb  1f 2f 30 94   ora $94302f,x
$09:e3bf  d2 68		 cmp ($68)
$09:e3c1  1f 25 17 ac   ora $ac1725,x
$09:e3c5  fd 89 ed	  sbc $ed89,x
$09:e3c8  5f 73 7d 0d   eor $0d7d73,x
$09:e3cc  f0 8e		 beq $e35c
$09:e3ce  77 a7		 adc [$a7],y
$09:e3d0  82 11 ce	  brl $b1e4
$09:e3d3  f5 74		 sbc $74,x
$09:e3d5  51 a3		 eor ($a3),y
$09:e3d7  8d ce 67	  sta $67ce
$09:e3da  30 4d		 bmi $e429
$09:e3dc  61 8c		 adc ($8c,x)
$09:e3de  a4 fe		 ldy $fe
$09:e3e0  08			php
$09:e3e1  38			sec
$09:e3e2  7e 47 60	  ror $6047,x
$09:e3e5  4b			phk
$09:e3e6  01 f4		 ora ($f4,x)
$09:e3e8  0e 3c 92	  asl $923c
$09:e3eb  1e 89 3f	  asl $3f89,x
$09:e3ee  a0 9d		 ldy #$9d
$09:e3f0  87 a1		 sta [$a1]
$09:e3f2  0f c8 6c 0b   ora $0b6cc8
$09:e3f6  00 1e		 brk #$1e
$09:e3f8  8f 70 a8 7c   sta $7ca870
$09:e3fc  c2 d9		 rep #$d9
$09:e3fe  53 fa		 eor ($fa,s),y
$09:e400  e3 d9		 sbc $d9,s
$09:e402  3e da f2	  rol $f2da,x
$09:e405  20 d0 dd	  jsr $ddd0
$09:e408  e8			inx
$09:e409  e7 7a		 sbc [$7a]
$09:e40b  7b			tdc
$09:e40c  fd 1b cd	  sbc $cd1b,x
$09:e40f  4f 44 8a 24   eor $248a44
$09:e413  6a			ror a
$09:e414  ed e6 ab	  sbc $abe6
$09:e417  a6 47		 ldx $47
$09:e419  55 a8		 eor $a8,x
$09:e41b  2c 81 01	  bit $0181
$09:e41e  e0 e6 b1	  cpx #$b1e6
$09:e421  24 09		 bit $09
$09:e423  41 e0		 eor ($e0,x)
$09:e425  f2 72		 sbc ($72)
$09:e427  00 16		 brk #$16
$09:e429  04 4d		 tsb $4d
$09:e42b  e3 77		 sbc $77,s
$09:e42d  f0 49		 beq $e478
$09:e42f  fc 04 3a	  jsr ($3a04,x)
$09:e432  f0 7a		 beq $e4ae
$09:e434  0d e0 33	  ora $33e0
$09:e437  a0 78 1f	  ldy #$1f78
$09:e43a  84 89		 sty $89
$09:e43c  21 f0		 and ($f0,x)
$09:e43e  f3 07		 sbc ($07,s),y
$09:e440  c4 6a		 cpy $6a
$09:e442  fe e6 f7	  inc $f7e6,x
$09:e445  ab			plb
$09:e446  fd 81 ed	  sbc $ed81,x
$09:e449  1f 6f 55 0d   ora $0d556f,x
$09:e44d  df 01 83 a7   cmp $a78301,x
$09:e451  bf e1 d2 68   lda $68d2e1,x
$09:e455  21 07		 and ($07,x)
$09:e457  b0 29		 bcs $e482
$09:e459  12 42		 ora ($42)
$09:e45b  20 3d 40	  jsr $403d
$09:e45e  65 4e		 adc $4e
$09:e460  02 31		 cop #$31
$09:e462  32 98		 and ($98)
$09:e464  02 90		 cop #$90
$09:e466  62 be 83	  per $6827
$09:e469  18			clc
$09:e46a  0a			asl a
$09:e46b  bc 77 e4	  ldy $e477,x
$09:e46e  cf 06 a9 60   cmp $60a906
$09:e472  02 ce		 cop #$ce
$09:e474  20 3f 70	  jsr $703f
$09:e477  80 db		 bra $e454
$09:e479  de aa f5	  dec $f5aa,x
$09:e47c  df b3 3d bb   cmp $bb3db3,x
$09:e480  ee ef 7f	  inc $7fef
$09:e483  f8			sed
$09:e484  43 c4		 eor $c4,s
$09:e486  3e 32 f2	  rol $f232,x
$09:e489  1f 95 3c cb   ora $cb3c95,x
$09:e48d  e7 6f		 sbc [$6f]
$09:e48f  43 fa		 eor $fa,s
$09:e491  63 d5		 adc $d5,s
$09:e493  3e ba f6	  rol $f6ba,x
$09:e496  5f b7 3d db   eor $db3db7,x
$09:e49a  ef ef 07 f8   sbc $f807ef
$09:e49e  83 c6		 sta $c6,s
$09:e4a0  3e 42 f2	  rol $f242,x
$09:e4a3  9f 99 3c eb   sta $eb3c99,x
$09:e4a7  e8			inx
$09:e4a8  6f 4b fa a3   adc $a3fa4b
$09:e4ac  d7 3e		 cmp [$3e],y
$09:e4ae  ca			dex
$09:e4af  f6 df		 inc $df,x
$09:e4b1  bb			tyx
$09:e4b2  3d fb e0	  and $e0fb,x
$09:e4b5  ef 0f f8 c3   sbc $c3f80f
$09:e4b9  c8			iny
$09:e4ba  3e 52 f3	  rol $f352,x
$09:e4bd  1f 9d 3d 0b   ora $0b3d9d,x
$09:e4c1  e9 6f		 sbc #$6f
$09:e4c3  53 fa		 eor ($fa,s),y
$09:e4c5  e3 d9		 sbc $d9,s
$09:e4c7  3e da f7	  rol $f7da,x
$09:e4ca  5f bf 3c 1b   eor $1b3cbf,x
$09:e4ce  e1 ef		 sbc ($ef,x)
$09:e4d0  17 f9		 ora [$f9],y
$09:e4d2  03 ca		 ora $ca,s
$09:e4d4  3e 62 f3	  rol $f362,x
$09:e4d7  9f a1 3d 2b   sta $2b3da1,x
$09:e4db  ea			nop
$09:e4dc  6f 5b fb 23   adc $23fb5b
$09:e4e0  db			stp
$09:e4e1  3e ea f7	  rol $f7ea,x
$09:e4e4  df 83 3c 3b   cmp $3b3c83,x
$09:e4e8  e2 ef		 sep #$ef
$09:e4ea  1f f9 43 cc   ora $cc43f9,x
$09:e4ee  3e 72 f4	  rol $f472,x
$09:e4f1  1f a3 1a b3   ora $b31aa3,x
$09:e4f5  5f 46 65 9b   eor $9b6546,x
$09:e4f9  c8			iny
$09:e4fa  8c ca ef	  sty $efca
$09:e4fd  a5 5f		 lda $5f
$09:e4ff  be 15 7f	  ldx $7f15,y
$09:e502  b0 3d		 bcs $e541
$09:e504  e1 e0		 sbc ($e0,x)
$09:e506  1f 09 78 8f   ora $8f7809,x
$09:e50a  c6 9e		 dec $9e
$09:e50c  45 f2		 eor $f2
$09:e50e  b7 b5		 lda [$b5],y
$09:e510  5f c1 e8 af   eor $afe8c1,x
$09:e514  1b			tcs
$09:e515  10 e6		 bpl $e4fd
$09:e517  35 df		 and $df,x
$09:e519  41 f0		 eor ($f0,x)
$09:e51b  4f 24 7b 23   eor $237b24
$09:e51f  d1 78		 cmp ($78),y
$09:e521  2b			pld
$09:e522  f6 83		 inc $83,x
$09:e524  88			dey
$09:e525  5a			phy
$09:e526  6b			rtl
$09:e527  e9 41		 sbc #$41
$09:e529  48			pha
$09:e52a  02 4c		 cop #$4c
$09:e52c  6d 1e 8f	  adc $8f1e
$09:e52f  6f 95 3f 97   adc $973f95
$09:e533  8b			phb
$09:e534  ce 7f d5	  dec $d57f
$09:e537  9f bd 2d 07   sta $072dbd,x
$09:e53b  3f e2 59 9d   and $9d59e2,x
$09:e53f  f2 cb		 sbc ($cb)
$09:e541  65 f1		 adc $f1
$09:e543  30 01		 bmi $e546
$09:e545  86 5e		 stx $5e
$09:e547  a6 19		 ldx $19
$09:e549  af c2 0d ea   lda $ea0dc2
$09:e54d  82 c1 60	  brl $4611
$09:e550  4d 41 f1	  eor $f141
$09:e553  35 05		 and $05,x
$09:e555  a8			tay
$09:e556  0b			phd
$09:e557  f0 6c		 beq $e5c5
$09:e559  04 2e		 tsb $2e
$09:e55b  17 ae		 ora [$ae],y
$09:e55d  72 0f		 adc ($0f)
$09:e55f  a9 c8		 lda #$c8
$09:e561  2e 40 2f	  rol $2f40
$09:e564  fb			xce
$09:e565  ff c2 1e 21   sbc $211ec2,x
$09:e569  f1 97		 sbc ($97),y
$09:e56b  90 fc		 bcc $e569
$09:e56d  a9 e5		 lda #$e5
$09:e56f  e7 f0		 sbc [$f0]
$09:e571  22 89 12 48   jsl $481289
$09:e575  b2 3a		 lda ($3a)
$09:e577  09 d0		 ora #$d0
$09:e579  8f 40 75 4f   sta $4f7540
$09:e57d  42 10		 wdm #$10
$09:e57f  7c 16 9a	  jmp ($9a16,x)
$09:e582  fd 7e d1	  sbc $d17e,x
$09:e585  e8			inx
$09:e586  48			pha
$09:e587  0a			asl a
$09:e588  44 4f 60	  mvp $60,$4f
$09:e58b  90 0f		 bcc $e59c
$09:e58d  6f 95 3f 97   adc $973f95
$09:e591  a5 78		 lda $78
$09:e593  e7 fd		 sbc [$fd]
$09:e595  59 f5 79	  eor $79f5,y
$09:e598  f8			sed
$09:e599  b3 f7		 lda ($f7,s),y
$09:e59b  db			stp
$09:e59c  f5 95		 sbc $95,x
$09:e59e  7e 5e 25	  ror $255e,x
$09:e5a1  f9 d9 7d	  sbc $7dd9,y
$09:e5a4  4b			phk
$09:e5a5  f0 bf		 beq $e566
$09:e5a7  c0 a0 b0	  cpy #$b0a0
$09:e5aa  56 78		 lsr $78,x
$09:e5ac  7a			ply
$09:e5ad  9a			txs
$09:e5ae  22 cf 1f 14   jsl $141fcf
$09:e5b2  1a			inc a
$09:e5b3  cb			wai
$09:e5b4  7f d7 42 e1   adc $e142d7,x
$09:e5b8  6d f0 f1	  adc $f1f0
$09:e5bb  38			sec
$09:e5bc  45 be		 eor $be
$09:e5be  2d 40 6e	  and $6e40
$09:e5c1  81 7b		 sta ($7b,x)
$09:e5c3  df fe 10 f1   cmp $f110fe,x
$09:e5c7  0f 8c bc 87   ora $87bc8c
$09:e5cb  e5 4f		 sbc $4f
$09:e5cd  32 f9		 and ($f9)
$09:e5cf  db			stp
$09:e5d0  cf cb 5f af   cmp $af5fcb
$09:e5d4  d6 8f		 dec $8f,x
$09:e5d6  d7 e8		 cmp [$e8],y
$09:e5d8  f0 59		 beq $e633
$09:e5da  cf d7 e0 f4   cmp $f4e0d7
$09:e5de  57 92		 eor [$92],y
$09:e5e0  5a			phy
$09:e5e1  b1 c5		 lda ($c5),y
$09:e5e3  7f b0 35 d9   adc $d935b0,x
$09:e5e7  95 df		 sta $df,x
$09:e5e9  4b			phk
$09:e5ea  bf 7c 2e ff   lda $ff2e7c,x
$09:e5ee  08			php
$09:e5ef  64 18		 stz $18
$09:e5f1  1f bb 47 ff   ora $ff47bb,x
$09:e5f5  84 3d		 sty $3d
$09:e5f7  d9 56 82	  cmp $8256,y
$09:e5fa  76 f8		 ror $f8,x
$09:e5fc  32 2e		 and ($2e)
$09:e5fe  cc f4 64	  cpy $64f4
$09:e601  9d 99 70	  sta $7099,x
$09:e604  7f 6d a8 9d   adc $9da86d,x
$09:e608  de b7 66	  dec $66b7,x
$09:e60b  53 b1		 eor ($b1,s),y
$09:e60d  ee cc a2	  inc $a2cc
$09:e610  51 59		 eor ($59),y
$09:e612  fd 7c b2	  sbc $b27c,x
$09:e615  c2 fd		 rep #$fd
$09:e617  5b			tcd
$09:e618  4d a7 89	  eor $89a7
$09:e61b  e8			inx
$09:e61c  bb			tyx
$09:e61d  4f 53 bc 20   eor $20bc53
$09:e621  be 2f 50	  ldx $502f,y
$09:e624  0a			asl a
$09:e625  5d e4 02	  eor $02e4,x
$09:e628  a7 ff		 lda [$ff]
$09:e62a  84 3c		 sty $3c
$09:e62c  43 96		 eor $96,s
$09:e62e  51 86		 eor ($86),y
$09:e630  93 c1		 sta ($c1,s),y
$09:e632  e8			inx
$09:e633  02 3a		 cop #$3a
$09:e635  ca			dex
$09:e636  88			dey
$09:e637  00 65		 brk #$65
$09:e639  79 67 80	  adc $8067,y
$09:e63c  08			php
$09:e63d  b4 e3		 ldy $e3,x
$09:e63f  88			dey
$09:e640  f0 40		 beq $e682
$09:e642  f4 18 65	  pea $6518
$09:e645  ac 0c c2	  ldy $c20c
$09:e648  e1 9a		 sbc ($9a,x)
$09:e64a  19 82 c1	  ora $c182,y
$09:e64d  b8			clv
$09:e64e  33 c5		 and ($c5,s),y
$09:e650  b4 da		 ldy $da,x
$09:e652  7a			ply
$09:e653  9e 2a 61	  stz $612a,x
$09:e656  08			php
$09:e657  5d 96 fe	  eor $fe96,x
$09:e65a  32 b8		 and ($b8)
$09:e65c  2b			pld
$09:e65d  f4 04 56	  pea $5604
$09:e660  fc f0 6f	  jsr ($6ff0,x)
$09:e663  87 bc		 sta [$bc]
$09:e665  5f b6 51 fd   eor $fd51b6,x
$09:e669  ed 18 00	  sbc $0018
$09:e66c  a2 b2 60	  ldx #$60b2
$09:e66f  66 07		 ror $07
$09:e671  f6 5c		 inc $5c,x
$09:e673  0c b9 bf	  tsb $bfb9
$09:e676  47 d8		 eor [$d8]
$09:e678  8c 01 76	  sty $7601
$09:e67b  41 95		 eor ($95,x)
$09:e67d  a0 5d 05	  ldy #$055d
$09:e680  fd df f0	  sbc $f0df,x
$09:e683  cc fc c3	  cpy $c3fc
$09:e686  e0 db f9	  cpx #$f9db
$09:e689  84 f0		 sty $f0
$09:e68b  7a			ply
$09:e68c  2b			pld
$09:e68d  d0 07		 bne $e696
$09:e68f  95 7a		 sta $7a,x
$09:e691  3c 0f 1c	  bit $1c0f,x
$09:e694  77 f8		 adc [$f8],y
$09:e696  03 c2		 ora $c2,s
$09:e698  3e 22 f1	  rol $f122,x
$09:e69b  9e 5a 46	  stz $465a,x
$09:e69e  57 93		 eor [$93],y
$09:e6a0  1f 80 ca f2   ora $f2ca80,x
$09:e6a4  84 f0		 sty $f0
$09:e6a6  21 6d		 and ($6d,x)
$09:e6a8  c4 65		 cpy $65
$09:e6aa  b6 b1		 ldx $b1,y
$09:e6ac  95 f9		 sta $f9,x
$09:e6ae  7d a3 1c	  adc $1ca3,x
$09:e6b1  c7 53		 cmp [$53]
$09:e6b3  a9 c9 2b	  lda #$2bc9
$09:e6b6  a3 51		 lda $51,s
$09:e6b8  ea			nop
$09:e6b9  cc 2d a1	  cpy $a12d
$09:e6bc  a4 ad		 ldy $ad
$09:e6be  24 54		 bit $54
$09:e6c0  38			sec
$09:e6c1  2c 09 e8	  bit $e809
$09:e6c4  e9 22 a7	  sbc #$a722
$09:e6c7  cd 34 d0	  cmp $d034
$09:e6ca  10 2a		 bpl $e6f6
$09:e6cc  cd 12 45	  cmp $4512
$09:e6cf  57 82		 eor [$82],y
$09:e6d1  e9 e1 3a	  sbc #$3ae1
$09:e6d4  70 a0		 bvs $e676
$09:e6d6  05 0d		 ora $0d
$09:e6d8  24 5e		 bit $5e
$09:e6da  99 a6 aa	  sta $aaa6,y
$09:e6dd  11 a8		 ora ($a8),y
$09:e6df  80 89		 bra $e66a
$09:e6e1  c0 4a 20	  cpy #$204a
$09:e6e4  e3 f0		 sbc $f0,s
$09:e6e6  c1 7c		 cmp ($7c,x)
$09:e6e8  1e 8f 0c	  asl $0c8f,x
$09:e6eb  24 6e		 bit $6e
$09:e6ed  03 51		 ora $51,s
$09:e6ef  0f 24 16 0d   ora $0d1624
$09:e6f3  90 f7		 bcc $e6ec
$09:e6f5  42 08		 wdm #$08
$09:e6f7  e1 e9		 sbc ($e9,x)
$09:e6f9  c8			iny
$09:e6fa  10 c0		 bpl $e6bc
$09:e6fc  5e 73 4d	  lsr $4d73,x
$09:e6ff  46 40		 lsr $40
$09:e701  6a			ror a
$09:e702  03 51		 ora $51,s
$09:e704  c8			iny
$09:e705  14 c0		 trb $c0
$09:e707  7e 8f 52	  ror $528f,x
$09:e70a  f4 3e 9f	  pea $9f3e
$09:e70d  c3 01		 cmp $01,s
$09:e70f  a0 1d 04	  ldy #$041d
$09:e712  e6 81		 inc $81
$09:e714  f3 84		 sbc ($84,s),y
$09:e716  d2 10		 cmp ($10)
$09:e718  83 10		 sta $10,s
$09:e71a  42 1a		 wdm #$1a
$09:e71c  88			dey
$09:e71d  bc d0 88	  ldy $88d0,x
$09:e720  7a			ply
$09:e721  50 52		 bvc $e775
$09:e723  68			pla
$09:e724  e2 f5		 sep #$f5
$09:e726  7f b0 3d a3   adc $a33db0,x
$09:e72a  ee 2f 0f	  inc $0f2f
$09:e72d  95 0c		 sta $0c,x
$09:e72f  d4 06		 pei ($06)
$09:e731  b0 7e		 bcs $e7b1
$09:e733  03 9d		 ora $9d,s
$09:e735  e9 f0		 sbc #$f0
$09:e737  5d 5c b6	  eor $b65c,x
$09:e73a  03 02		 ora $02,s
$09:e73c  80 b9		 bra $e6f7
$09:e73e  de af 34	  dec $34af,x
$09:e741  d5 cb		 cmp $cb,x
$09:e743  a1 32		 lda ($32,x)
$09:e745  d8			cld
$09:e746  13 9d		 ora ($9d,s),y
$09:e748  c7 a1		 cmp [$a1]
$09:e74a  aa			tax
$09:e74b  87 c2		 sta [$c2]
$09:e74d  a5 da		 lda $da
$09:e74f  f7 3b		 sbc [$3b],y
$09:e751  fa			plx
$09:e752  66 9e		 ror $9e
$09:e754  8f 04 4f 5d   sta $5d4f04
$09:e758  a9 0f		 lda #$0f
$09:e75a  cf 82 4e 4b   cmp $4b4e82
$09:e75e  0d 90 be	  ora $be90
$09:e761  e4 fe		 cpx $fe
$09:e763  08			php
$09:e764  38			sec
$09:e765  7e 5f 61	  ror $615f,x
$09:e768  27 7e		 and [$7e]
$09:e76a  cf a6 03 03   cmp $0303a6
$09:e76e  80 f8		 bra $e768
$09:e770  60			rts
$09:e771  20 e8 f0	  jsr $f0e8
$09:e774  c2 60		 rep #$60
$09:e776  90 98		 bcc $e710
$09:e778  94 26		 sty $26,x
$09:e77a  12 e7		 ora ($e7)
$09:e77c  7f 74 22 1f   adc $1f2274,x
$09:e780  08			php
$09:e781  f3 42		 sbc ($42,s),y
$09:e783  21 0e		 and ($0e,x)
$09:e785  7f 57 fb 03   adc $03fb57,x
$09:e789  da			phx
$09:e78a  3e de a3	  rol $a3de,x
$09:e78d  68			pla
$09:e78e  1a			inc a
$09:e78f  40			rti
$09:e790  d4 14		 pei ($14)
$09:e792  36 f3		 rol $f3,x
$09:e794  50 e0		 bvc $e776
$09:e796  30 28		 bmi $e7c0
$09:e798  0c b7 57	  tsb $57b7
$09:e79b  05 a7		 ora $a7
$09:e79d  b7 9a		 lda [$9a],y
$09:e79f  9f 02 96 c2   sta $c29602,x
$09:e7a3  65 da		 adc $da
$09:e7a5  b9 a5 5d	  lda $5da5,y
$09:e7a8  bc d5 7d	  ldy $7dd5,x
$09:e7ab  84 b9		 sty $b9
$09:e7ad  32 1a		 and ($1a)
$09:e7af  88			dey
$09:e7b0  2f a0 80 fb   and $fb80a0
$09:e7b4  1d 74 1f	  ora $1f74,x
$09:e7b7  d1 e1		 cmp ($e1),y
$09:e7b9  9a			txs
$09:e7ba  78			sei
$09:e7bb  0e 0f b3	  asl $b30f
$09:e7be  93 90		 sta ($90,s),y
$09:e7c0  03 d2		 ora $d2,s
$09:e7c2  24 91		 bit $91
$09:e7c4  88			dey
$09:e7c5  49 c6 56	  eor #$56c6
$09:e7c8  ef 09 3b c4   sbc $c43b09
$09:e7cc  08			php
$09:e7cd  93 01		 sta ($01,s),y
$09:e7cf  80 9b		 bra $e76c
$09:e7d1  82 51 01	  brl $e925
$09:e7d4  1a			inc a
$09:e7d5  c4 26		 cpy $26
$09:e7d7  13 12		 ora ($12,s),y
$09:e7d9  84 ca		 sty $ca
$09:e7db  61 22		 adc ($22,x)
$09:e7dd  58			cli
$09:e7de  84 42		 sty $42
$09:e7e0  3c c2 10	  bit $10c2,x
$09:e7e3  84 0d		 sty $0d
$09:e7e5  5f dc de f5   eor $f5dedc,x
$09:e7e9  7f b0 3d a3   adc $a33db0,x
$09:e7ed  ed ea 31	  sbc $31ea
$09:e7f0  03 c1		 ora $c1,s
$09:e7f2  a0 ad		 ldy #$ad
$09:e7f4  e3 9a		 sbc $9a,s
$09:e7f6  6a			ror a
$09:e7f7  c0 07		 cpy #$07
$09:e7f9  06 83		 asl $83
$09:e7fb  6a			ror a
$09:e7fc  e6 8e		 inc $8e
$09:e7fe  a4 00		 ldy $00
$09:e800  24 8e		 bit $8e
$09:e802  49 ab 7c	  eor #$7cab
$09:e805  a4 17		 ldy $17
$09:e807  50 06		 bvc $e80f
$09:e809  00 30		 brk #$30
$09:e80b  6a			ror a
$09:e80c  02 c1		 cop #$c1
$09:e80e  a8			tay
$09:e80f  7c ae 42	  jmp ($42ae,x)
$09:e812  0d aa 10	  ora $10aa
$09:e815  07 87		 ora [$87]
$09:e817  59 ad f4	  eor $f4ad,y
$09:e81a  82 57 21	  brl $0974
$09:e81d  aa			tax
$09:e81e  f0 7b		 beq $e89b
$09:e820  b5 5e		 lda $5e,x
$09:e822  8f 07 a3 c2   sta $c2a307
$09:e826  f9 58 89	  sbc $8958,y
$09:e829  18			clc
$09:e82a  0a			asl a
$09:e82b  26 38		 rol $38
$09:e82d  67 c0		 adc [$c0]
$09:e82f  3e 03 c0	  rol $c003,x
$09:e832  5f 36 f1 c0   eor $c0f136,x
$09:e836  68			pla
$09:e837  06 f1		 asl $f1
$09:e839  f4 9b cd	  pea $cd9b
$09:e83c  bc 70 9a	  ldy $9a70,x
$09:e83f  41 fc		 eor ($fc,x)
$09:e841  62 07 f3	  per $db4b
$09:e844  6f 1c 22 1e   adc $1e221c
$09:e848  8f 1f 72 3c   sta $3c721f
$09:e84c  db			stp
$09:e84d  de aa f5	  dec $f5aa,x
$09:e850  df b3 3d bb   cmp $bb3db3,x
$09:e854  ee ef 7f	  inc $7fef
$09:e857  f8			sed
$09:e858  43 c4		 eor $c4,s
$09:e85a  3e 32 f2	  rol $f232,x
$09:e85d  1f 95 3c cb   ora $cb3c95,x
$09:e861  e7 6f		 sbc [$6f]
$09:e863  43 fa		 eor $fa,s
$09:e865  63 d5		 adc $d5,s
$09:e867  3e ba f6	  rol $f6ba,x
$09:e86a  5f b7 3d db   eor $db3db7,x
$09:e86e  ef ef 07 f8   sbc $f807ef
$09:e872  83 c6		 sta $c6,s
$09:e874  3e 42 f2	  rol $f242,x
$09:e877  9f 99 3c eb   sta $eb3c99,x
$09:e87b  e8			inx
$09:e87c  6f 4b fa a3   adc $a3fa4b
$09:e880  d7 3e		 cmp [$3e],y
$09:e882  ca			dex
$09:e883  f6 df		 inc $df,x
$09:e885  bb			tyx
$09:e886  3d fb e0	  and $e0fb,x
$09:e889  ef 0f f8 c3   sbc $c3f80f
$09:e88d  c8			iny
$09:e88e  3e 52 f3	  rol $f352,x
$09:e891  1f 9d 3d 0b   ora $0b3d9d,x
$09:e895  e9 6f 53	  sbc #$536f
$09:e898  fa			plx
$09:e899  e3 d9		 sbc $d9,s
$09:e89b  3e da f7	  rol $f7da,x
$09:e89e  5f bf 3c 1b   eor $1b3cbf,x
$09:e8a2  e1 ef		 sbc ($ef,x)
$09:e8a4  17 f9		 ora [$f9],y
$09:e8a6  03 ca		 ora $ca,s
$09:e8a8  3e 62 f3	  rol $f362,x
$09:e8ab  9f a1 3d 2b   sta $2b3da1,x
$09:e8af  ea			nop
$09:e8b0  6f 5b fb 23   adc $23fb5b
$09:e8b4  db			stp
$09:e8b5  3e ea f7	  rol $f7ea,x
$09:e8b8  df 83 3c 3b   cmp $3b3c83,x
$09:e8bc  e2 ef		 sep #$ef
$09:e8be  1f f9 43 cc   ora $cc43f9,x
$09:e8c2  3e 72 f4	  rol $f472,x
$09:e8c5  1f a3 1a b3   ora $b31aa3,x
$09:e8c9  5f 46 65 9b   eor $9b6546,x
$09:e8cd  c8			iny
$09:e8ce  8c ca ef	  sty $efca
$09:e8d1  a5 5f		 lda $5f
$09:e8d3  be 15 7f	  ldx $7f15,y
$09:e8d6  b0 3d		 bcs $e915
$09:e8d8  e1 e0		 sbc ($e0,x)
$09:e8da  1f 09 78 8f   ora $8f7809,x
$09:e8de  c6 9e		 dec $9e
$09:e8e0  45 f2		 eor $f2
$09:e8e2  b7 b5		 lda [$b5],y
$09:e8e4  5f c1 e8 af   eor $afe8c1,x
$09:e8e8  1b			tcs
$09:e8e9  10 e6		 bpl $e8d1
$09:e8eb  35 df		 and $df,x
$09:e8ed  41 f0		 eor ($f0,x)
$09:e8ef  4f 24 7b 23   eor $237b24
$09:e8f3  d1 78		 cmp ($78),y
$09:e8f5  2b			pld
$09:e8f6  f6 83		 inc $83,x
$09:e8f8  88			dey
$09:e8f9  5a			phy
$09:e8fa  6b			rtl
$09:e8fb  e9 41		 sbc #$41
$09:e8fd  48			pha
$09:e8fe  02 4c		 cop #$4c
$09:e900  6d 1e 8f	  adc $8f1e
$09:e903  6f 97 db e4   adc $e4db97
$09:e907  4f 8a 90 7d   eor $7d908a
$09:e90b  8a			txa
$09:e90c  43 bc		 eor $bc,s
$09:e90e  5e 73 fe	  lsr $fe73,x
$09:e911  9c fd e9	  stz $e9fd
$09:e914  68			pla
$09:e915  39 ff 0a	  and $0aff,y
$09:e918  cc ef 97	  cpy $97ef
$09:e91b  b8			clv
$09:e91c  37 86		 and [$86],y
$09:e91e  0b			phd
$09:e91f  05 81		 ora $81
$09:e921  31 07		 and ($07),y
$09:e923  d2 c4		 cmp ($c4)
$09:e925  16 20		 asl $20,x
$09:e927  2f c1 90 10   and $1090c1
$09:e92b  18			clc
$09:e92c  0e 99 a8	  asl $a899
$09:e92f  3e 16 a0	  rol $a016,x
$09:e932  b5 01		 lda $01,x
$09:e934  7e 0d 80	  ror $800d,x
$09:e937  84 c2		 sty $c2
$09:e939  75 ce		 adc $ce,x
$09:e93b  41 f4		 eor ($f4,x)
$09:e93d  b9 05 c8	  lda $c805,y
$09:e940  05 ff		 ora $ff
$09:e942  7f f8 43 c4   adc $c443f8,x
$09:e946  3e 32 f2	  rol $f232,x
$09:e949  1f 95 3c bc   ora $bc3c95,x
$09:e94d  fe 04 51	  inc $5104,x
$09:e950  22 49 16 47   jsl $471649
$09:e954  41 3a		 eor ($3a,x)
$09:e956  11 e8		 ora ($e8),y
$09:e958  0e a9 e8	  asl $e8a9
$09:e95b  37 8f		 and [$8f],y
$09:e95d  82 d3 5f	  brl $4933
$09:e960  af da 3d 09   lda $093dda
$09:e964  01 48		 ora ($48,x)
$09:e966  8f 81 28 3e   sta $3e2881
$09:e96a  df 2a 7c 7c   cmp $7c7c2a,x
$09:e96e  89 f3		 bit #$f3
$09:e970  f2 fb		 sbc ($fb)
$09:e972  14 03		 trb $03
$09:e974  7a			ply
$09:e975  57 8e		 eor [$8e],y
$09:e977  7f d3 9f 57   adc $579fd3,x
$09:e97b  9f 87 3f 7d   sta $7d3f87,x
$09:e97f  bf 40 a0 b0   lda $b0a040,x
$09:e983  55 f8		 eor $f8,x
$09:e985  78			sei
$09:e986  58			cli
$09:e987  22 bf 1f 4c   jsl $4c1fbf
$09:e98b  1a			inc a
$09:e98c  ef 7f d3 40   sbc $40d37f
$09:e990  60			rts
$09:e991  2c f0 f4	  bit $f4f0
$09:e994  b4 45		 ldy $45,x
$09:e996  9e 2c 40	  stz $402c,x
$09:e999  66 86		 ror $86
$09:e99b  ba			tsx
$09:e99c  13 09		 ora ($09,s),y
$09:e99e  6f 87 85 c2   adc $c28587
$09:e9a2  2d f1 6a	  and $6af1
$09:e9a5  03 34		 ora $34,s
$09:e9a7  0b			phd
$09:e9a8  de ff f0	  dec $f0ff,x
$09:e9ab  87 88		 sta [$88]
$09:e9ad  7c 65 e4	  jmp ($e465,x)
$09:e9b0  3f 2a 79 97   and $97792a,x
$09:e9b4  ce de 7e	  dec $7ede
$09:e9b7  5a			phy
$09:e9b8  fd 7e b4	  sbc $b47e,x
$09:e9bb  7e bf 47	  ror $47bf,x
$09:e9be  82 ce 7e	  brl $688f
$09:e9c1  bf 07 a2 bc   lda $bca207,x
$09:e9c5  92 d5		 sta ($d5)
$09:e9c7  8e 2b fd	  stx $fd2b
$09:e9ca  81 ae		 sta ($ae,x)
$09:e9cc  cc ae fa	  cpy $faae
$09:e9cf  5d fb e1	  eor $e1fb,x
$09:e9d2  77 f8		 adc [$f8],y
$09:e9d4  43 20		 eor $20,s
$09:e9d6  c0 fd		 cpy #$fd
$09:e9d8  da			phx
$09:e9d9  3f fc 21 ee   and $ee21fc,x
$09:e9dd  ca			dex
$09:e9de  b4 13		 ldy $13,x
$09:e9e0  b7 c1		 lda [$c1],y
$09:e9e2  91 76		 sta ($76),y
$09:e9e4  67 a3		 adc [$a3]
$09:e9e6  24 ec		 bit $ec
$09:e9e8  cb			wai
$09:e9e9  83 fb		 sta $fb,s
$09:e9eb  6d 44 ee	  adc $ee44
$09:e9ee  f5 bb		 sbc $bb,x
$09:e9f0  32 9d		 and ($9d)
$09:e9f2  8f 76 65 12   sta $126576
$09:e9f6  8a			txa
$09:e9f7  cf eb e5 ee   cmp $eee5eb
$09:e9fb  0b			phd
$09:e9fc  ee 84 42	  inc $4284
$09:e9ff  3c cf 45	  bit $45cf,x
$09:ea02  84 7a		 sty $7a
$09:ea04  1d e1 01	  ora $01e1,x
$09:ea07  f0 7a		 beq $ea83
$09:ea09  00 52		 brk #$52
$09:ea0b  ef 10 1a 49   sbc $491a10
$09:ea0f  c3 08		 cmp $08,s
$09:ea11  ef 08 34 16   sbc $163408
$09:ea15  04 22		 tsb $22
$09:ea17  08			php
$09:ea18  37 a2		 and [$a2],y
$09:ea1a  4f 07 14 9b   eor $9b1407
$09:ea1e  bc 60 3a	  ldy $3a60,x
$09:ea21  61 90		 adc ($90,x)
$09:ea23  41 42		 eor ($42,x)
$09:ea25  e0 29		 cpx #$29
$09:ea27  6b			rtl
$09:ea28  2c 27 5c	  bit $5c27
$09:ea2b  42 08		 wdm #$08
$09:ea2d  08			php
$09:ea2e  9d ac a4	  sta $a4ac,x
$09:ea31  00 7a		 brk #$7a
$09:ea33  0f 84 6c e4   ora $e46c84
$09:ea37  f0 1b		 beq $ea54
$09:ea39  07 a3		 ora [$a3]
$09:ea3b  03 e9		 ora $e9,s
$09:ea3d  23 3e		 and $3e,s
$09:ea3f  56 df		 lsr $df,x
$09:ea41  b5 f4		 lda $f4,x
$09:ea43  78			sei
$09:ea44  70 05		 bvs $ea4b
$09:ea46  58			cli
$09:ea47  cb			wai
$09:ea48  5e cc 23	  lsr $23cc,x
$09:ea4b  e0 32		 cpx #$32
$09:ea4d  c5 f2		 cmp $f2
$09:ea4f  f6 46		 inc $46,x
$09:ea51  00 10		 brk #$10
$09:ea53  15 61		 ora $61,x
$09:ea55  1e 16 38	  asl $3816,x
$09:ea58  74 5d		 stz $5d,x
$09:ea5a  44 16 35	  mvp $35,$16
$09:ea5d  18			clc
$09:ea5e  a8			tay
$09:ea5f  87 6c		 sta [$6c]
$09:ea61  1e 0c 5e	  asl $5e0c,x
$09:ea64  31 63		 and ($63),y
$09:ea66  33 47		 and ($47,s),y
$09:ea68  f0 62		 beq $eacc
$09:ea6a  31 2c		 and ($2c),y
$09:ea6c  19 1b 06	  ora $061b,y
$09:ea6f  17 0c		 ora [$0c],y
$09:ea71  d0 a5		 bne $ea18
$09:ea73  e8			inx
$09:ea74  60			rts
$09:ea75  b0 6e		 bcs $eae5
$09:ea77  0a			asl a
$09:ea78  1b			tcs
$09:ea79  01 4c		 ora ($4c,x)
$09:ea7b  21 1e		 and ($1e,x)
$09:ea7d  e7 8a		 sbc [$8a]
$09:ea7f  95 06		 sta $06,x
$09:ea81  ef 7f 09 20   sbc $20097f
$09:ea85  05 0c		 ora $0c
$09:ea87  a0 fd		 ldy #$fd
$09:ea89  09 38		 ora #$38
$09:ea8b  3d 00 26	  and $2600,x
$09:ea8e  fb			xce
$09:ea8f  24 4a		 bit $4a
$09:ea91  49 fc		 eor #$fc
$09:ea93  10 68		 bpl $eafd
$09:ea95  2c 08 50	  bit $5008
$09:ea98  10 60		 bpl $eafa
$09:ea9a  eb			xba
$09:ea9b  fb			xce
$09:ea9c  20 b0 1d	  jsr $1db0
$09:ea9f  30 e0		 bmi $ea81
$09:eaa1  03 91		 ora $91,s
$09:eaa3  e1 80		 sbc ($80,x)
$09:eaa5  c2 75		 rep #$75
$09:eaa7  c4 80		 cpy $80
$09:eaa9  b2 87		 lda ($87)
$09:eaab  5f d3 05 78   eor $7805d3,x
$09:eaaf  8f 84 98 16   sta $169884
$09:eab3  51 fb		 eor ($fb),y
$09:eab5  80 44		 bra $eafb
$09:eab7  ac 05 d7	  ldy $d705
$09:eaba  2b			pld
$09:eabb  07 87		 ora [$87]
$09:eabd  f7 e0		 sbc [$e0],y
$09:eabf  f0 ed		 beq $eaae
$09:eac1  76 f9		 ror $f9,x
$09:eac3  82 fe e5	  brl $d0c4
$09:eac6  c9 ee 89	  cmp #$89ee
$09:eac9  03 d0		 ora $d0,s
$09:eacb  03 0b		 ora $0b,s
$09:eacd  6d 0e 8b	  adc $8b0e
$09:ead0  a8			tay
$09:ead1  4a			lsr a
$09:ead2  c6 a2		 dec $a2
$09:ead4  2b			pld
$09:ead5  18			clc
$09:ead6  34 3c		 bit $3c,x
$09:ead8  93 4c		 sta ($4c,s),y
$09:eada  62 c6 71	  per $5ca3
$09:eadd  b7 f2		 lda [$f2],y
$09:eadf  b0 62		 bcs $eb43
$09:eae1  58			cli
$09:eae2  33 8a		 and ($8a,s),y
$09:eae4  bf f8 66 98   lda $9866f8,x
$09:eae8  66 8d		 ror $8d
$09:eaea  61 ca		 adc ($ca,x)
$09:eaec  c1 83		 cmp ($83,x)
$09:eaee  70 d6		 bvs $eac6
$09:eaf0  10 00		 bpl $eaf2
$09:eaf2  15 e8		 ora $e8,x
$09:eaf4  03 ca		 ora $ca,s
$09:eaf6  91 00		 sta ($00),y
$09:eaf8  f1 c7		 sbc ($c7),y
$09:eafa  7f 80 3c 23   adc $233c80,x
$09:eafe  e2 2f		 sep #$2f
$09:eb00  19 e5 a4	  ora $a4e5,y
$09:eb03  65 79		 adc $79
$09:eb05  34 40		 bit $40,x
$09:eb07  0c af 28	  tsb $28af
$09:eb0a  4f 02 16 dc   eor $dc1602
$09:eb0e  4a			lsr a
$09:eb0f  5b			tcd
$09:eb10  6b			rtl
$09:eb11  29 5f		 and #$5f
$09:eb13  97 da		 sta [$da],y
$09:eb15  31 cc		 and ($cc),y
$09:eb17  75 3a		 adc $3a,x
$09:eb19  9c 52 ba	  stz $ba52
$09:eb1c  35 1e		 and $1e,x
$09:eb1e  ac c2 da	  ldy $dac2
$09:eb21  19 4a ca	  ora $ca4a,y
$09:eb24  45 43		 eor $43
$09:eb26  9e 4f 9e	  stz $9e4f,x
$09:eb29  ad 3d 29	  lda $293d
$09:eb2c  15 3e		 ora $3e,x
$09:eb2e  75 35		 adc $35,x
$09:eb30  02 b4		 cop #$b4
$09:eb32  ec a4 55	  cpx $55a4
$09:eb35  70 26		 bvs $eb5d
$09:eb37  fa			plx
$09:eb38  40			rti
$09:eb39  9b			txy
$09:eb3a  e1 0a		 sbc ($0a,x)
$09:eb3c  78			sei
$09:eb3d  97 c6		 sta [$c6],y
$09:eb3f  d9 38 9b	  cmp $9b38,y
$09:eb42  19 5a 72	  ora $725a,y
$09:eb45  4f 38 0d 00   eor $000d38
$09:eb49  e8			inx
$09:eb4a  3e 23 a1	  rol $a123,x
$09:eb4d  8f ce 13 48   sta $4813ce
$09:eb51  42 0c		 wdm #$0c
$09:eb53  41 08		 eor ($08,x)
$09:eb55  6a			ror a
$09:eb56  22 f3 42 21   jsl $2142f3
$09:eb5a  e9 41		 sbc #$41
$09:eb5c  49 a3		 eor #$a3
$09:eb5e  8b			phb
$09:eb5f  d5 fe		 cmp $fe,x
$09:eb61  c0 f6 8f	  cpy #$8ff6
$09:eb64  b8			clv
$09:eb65  bc 7e 55	  ldy $557e,x
$09:eb68  09 03		 ora #$03
$09:eb6a  e4 dc		 cpx $dc
$09:eb6c  ef 58 7c ed   sbc $ed7c58
$09:eb70  81 f3		 sta ($f3,x)
$09:eb72  b0 d0		 bcs $eb44
$09:eb74  cf be 46 39   cmp $3946be
$09:eb78  19 0f d4	  ora $d40f,y
$09:eb7b  72 61		 adc ($61)
$09:eb7d  2c 90 87	  bit $8790
$09:eb80  e0 96 33	  cpx #$3396
$09:eb83  39 5c cd	  and $cd5c,y
$09:eb86  ce f0 c8	  dec $c8f0
$09:eb89  c1 a4		 cmp ($a4,x)
$09:eb8b  dc ef e9	  jml [$e9ef]
$09:eb8e  80 c0		 bra $eb50
$09:eb90  e0 3e 28	  cpx #$283e
$09:eb93  0c 05 ce	  tsb $ce05
$09:eb96  fe 18 4c	  inc $4c18,x
$09:eb99  12 13		 ora ($13)
$09:eb9b  12 84		 ora ($84)
$09:eb9d  c2 5c		 rep #$5c
$09:eb9f  ef ee 84 43   sbc $4384ee
$09:eba3  e1 1e		 sbc ($1e,x)
$09:eba5  68			pla
$09:eba6  44 21 cf	  mvp $cf,$21
$09:eba9  ea			nop
$09:ebaa  ff 60 7b 47   sbc $477b60,x
$09:ebae  db			stp
$09:ebaf  d5 1f		 cmp $1f,x
$09:ebb1  77 9d		 adc [$9d],y
$09:ebb3  2d bc d4	  and $d4bc
$09:ebb6  37 7a		 and [$7a],y
$09:ebb8  54 db cd	  mvn $cd,$db
$09:ebbb  4f 77 a5 6d   eor $6da577
$09:ebbf  bc d5 77	  ldy $77d5,x
$09:ebc2  7a			ply
$09:ebc3  45 90		 eor $90
$09:ebc5  0f 1a 8d 88   ora $888d1a
$09:ebc9  6f d3 22 95   adc $9522d3
$09:ebcd  4c 46 02	  jmp $0246
$09:ebd0  25 89		 and $89
$09:ebd2  7c ae 5e	  jmp ($5eae,x)
$09:ebd5  40			rti
$09:ebd6  11 ac		 ora ($ac),y
$09:ebd8  46 0b		 lsr $0b
$09:ebda  e7 15		 sbc [$15]
$09:ebdc  23 3c		 and $3c,s
$09:ebde  06 03		 asl $03
$09:ebe0  e2 80		 sep #$80
$09:ebe2  ca			dex
$09:ebe3  20 3e 01	  jsr $013e
$09:ebe6  b3 c2		 lda ($c2,s),y
$09:ebe8  61 31		 adc ($31,x)
$09:ebea  28			plp
$09:ebeb  4c a6 13	  jmp $13a6
$09:ebee  e8			inx
$09:ebef  23 3c		 and $3c,s
$09:ebf1  22 11 e6 84   jsl $84e611
$09:ebf5  43 e1		 eor $e1,s
$09:ebf7  07 57		 ora [$57]
$09:ebf9  f7 37		 sbc [$37],y
$09:ebfb  bd 5f ec	  lda $ec5f,x
$09:ebfe  0f 68 fb 7a   ora $7afb68
$09:ec02  a7 93		 lda [$93]
$09:ec04  e7 83		 sbc [$83]
$09:ec06  4f 5b c7 3a   eor $3ac75b
$09:ec0a  9a			txs
$09:ec0b  80 1a		 bra $ec27
$09:ec0d  76 fa		 ror $fa,x
$09:ec0f  f0 5f		 beq $ec70
$09:ec11  87 3c		 sta [$3c]
$09:ec13  5b			tcd
$09:ec14  e3 ef		 sbc $ef,s
$09:ec16  9c 4d 8c	  stz $8c4d
$09:ec19  0d 39 6f	  ora $6f39
$09:ec1c  1c 06 80	  trb $8006
$09:ec1f  6f 1f 51 bc   adc $bc511f
$09:ec23  db			stp
$09:ec24  c7 09		 cmp [$09]
$09:ec26  a4 1f		 ldy $1f
$09:ec28  c6 20		 dec $20
$09:ec2a  7f 36 f1 c2   adc $c2f136,x
$09:ec2e  21 e8		 and ($e8,x)
$09:ec30  f1 f7		 sbc ($f7),y
$09:ec32  23 cd		 and $cd,s
$09:ec34  bd ea af	  lda $afea,x
$09:ec37  5d fb 33	  eor $33fb,x
$09:ec3a  db			stp
$09:ec3b  be ee f7	  ldx $f7ee,y
$09:ec3e  b2 d7		 lda ($d7)
$09:ec40  7c 1e 8b	  jmp ($8b1e,x)
$09:ec43  4d 7c 16	  eor $167c
$09:ec46  2f f7 f4 02   and $02f4f7
$09:ec4a  00 32		 brk #$32
$09:ec4c  4f f9 0c 98   eor $980cf9
$09:ec50  3f c4 1e 31   and $311ec4,x
$09:ec54  f2 17		 sbc ($17)
$09:ec56  94 fc		 sty $fc,x
$09:ec58  c9 e7		 cmp #$e7
$09:ec5a  5f 80 58 6b   eor $6b5880,x
$09:ec5e  8a			txa
$09:ec5f  81 b8		 sta ($b8,x)
$09:ec61  23 62		 and $62,s
$09:ec63  01 64		 ora ($64,x)
$09:ec65  5c 0d a8 fb   jml $fba80d
$09:ec69  0c 6f 6b	  tsb $6b6f
$09:ec6c  fb			xce
$09:ec6d  a3 dd		 lda $dd,s
$09:ec6f  c7 5f		 cmp [$5f]
$09:ec71  7f a3 b9 d3   adc $d3b9a3,x
$09:ec75  a0 0f 37	  ldy #$370f
$09:ec78  73 84		 adc ($84,s),y
$09:ec7a  11 7d		 ora ($7d),y
$09:ec7c  00 f4		 brk #$f4
$09:ec7e  b8			clv
$09:ec7f  85 b6		 sta $b6
$09:ec81  d6 06		 dec $06,x
$09:ec83  da			phx
$09:ec84  f0 5b		 beq $ece1
$09:ec86  4a			lsr a
$09:ec87  b0 4f		 bcs $ecd8
$09:ec89  f3 07		 sbc ($07,s),y
$09:ec8b  9c 5f d9	  stz $d95f
$09:ec8e  a0 d0 ac	  ldy #$acd0
$09:ec91  c2 e3		 rep #$e3
$09:ec93  5c 50 15 89   jml $891550
$09:ec97  f4 5e 1d	  pea $1d5e
$09:ec9a  16 8d		 asl $8d,x
$09:ec9c  f4 16 bb	  pea $bb16
$09:ec9f  22 c0 9f 47   jsl $479fc0
$09:eca3  e9 d2 69	  sbc #$69d2
$09:eca6  5d de cd	  eor $cdde,x
$09:eca9  f6 f7		 inc $f7,x
$09:ecab  bb			tyx
$09:ecac  fd ee b5	  sbc $b5ee,x
$09:ecaf  f0 42		 beq $ecf3
$09:ecb1  0d b7 d0	  ora $d0b7
$09:ecb4  86 df		 stx $df
$09:ecb6  03 dd		 ora $dd,s
$09:ecb8  ee 01 9d	  inc $9d01
$09:ecbb  b5 0e		 lda $0e,x
$09:ecbd  8c 5d 15	  sty $155d
$09:ecc0  d0 ce		 bne $ec90
$09:ecc2  d7 49		 cmp [$49],y
$09:ecc4  3e 5a f1	  rol $f15a,x
$09:ecc7  59 fb 33	  eor $33fb,y
$09:ecca  39 a4 1a	  and $1aa4,y
$09:eccd  06 57		 asl $57
$09:eccf  c3 9b		 cmp $9b,s
$09:ecd1  ce 3d ce	  dec $ce3d
$09:ecd4  c3 5c		 cmp $5c,s
$09:ecd6  54 95 c2	  mvn $c2,$95
$09:ecd9  01 e9		 ora ($e9,x)
$09:ecdb  ce e7 9e	  dec $9ee7
$09:ecde  e9 64 5c	  sbc #$5c64
$09:ece1  95 a9		 sta $a9,x
$09:ece3  ef ec ff 70   sbc $70ffec
$09:ece7  7b			tdc
$09:ece8  ba			tsx
$09:ece9  eb			xba
$09:ecea  ef f0 b4 0a   sbc $0ab4f0
$09:ecee  c2 bc		 rep #$bc
$09:ecf0  1f d0 2c 1a   ora $1a2cd0,x
$09:ecf4  50 0b		 bvc $ed01
$09:ecf6  e1 6f		 sbc ($6f,x)
$09:ecf8  13 f8		 ora ($f8,s),y
$09:ecfa  e3 c9		 sbc $c9,s
$09:ecfc  3e 5a f3	  rol $f35a,x
$09:ecff  5f 9f 0e e3   eor $e30e9f,x
$09:ed03  5c 51 05 89   jml $890551
$09:ed07  0d 36 bb	  ora $bb36
$09:ed0a  22 c8 1d de   jsl $de1dc8
$09:ed0e  c5 f6		 cmp $f6
$09:ed10  b7 b8		 lda [$b8],y
$09:ed12  62 d3 5f	  per $4ce8
$09:ed15  79 b5 a0	  adc $a0b5,y
$09:ed18  e2 08		 sep #$08
$09:ed1a  c7 01		 cmp [$01]
$09:ed1c  29 f1 c0	  and #$c0f1
$09:ed1f  6a			ror a
$09:ed20  ff f0 87 a3   sbc $a387f0,x
$09:ed24  89 42 17	  bit #$1742
$09:ed27  08			php
$09:ed28  2f a2 0a a1   and $a10aa2
$09:ed2c  23 e2		 and $e2,s
$09:ed2e  2c 42 d5	  bit $d542
$09:ed31  0b			phd
$09:ed32  f0 c2		 beq $ecf6
$09:ed34  d6 2a		 dec $2a,x
$09:ed36  82 3a ec	  brl $d973
$09:ed39  23 dd		 and $dd,s
$09:ed3b  08			php
$09:ed3c  4a			lsr a
$09:ed3d  c1 d3		 cmp ($d3,x)
$09:ed3f  d0 be		 bne $ecff
$09:ed41  8c 4a cd	  sty $cd4a
$09:ed44  7d 19 96	  adc $9619,x
$09:ed47  6f 22 33 2b   adc $2b3322
$09:ed4b  be 95 7e	  ldx $7e95,y
$09:ed4e  f8			sed
$09:ed4f  55 fe		 eor $fe,x
$09:ed51  c0 db 4d	  cpy #$4ddb
$09:ed54  7d e0 55	  adc $55e0,x
$09:ed57  a4 61		 ldy $61
$09:ed59  7b			tdc
$09:ed5a  34 1a		 bit $1a,x
$09:ed5c  11 83		 ora ($83),y
$09:ed5e  59 d1 85	  eor $85d1,y
$09:ed61  e1 d1		 sbc ($d1,x)
$09:ed63  68			pla
$09:ed64  c4 0c		 cpy $0c
$09:ed66  6b			rtl
$09:ed67  3f 4e 93 4a   and $4a934e,x
$09:ed6b  30 63		 bmi $edd0
$09:ed6d  5c 03 e5 18   jml $18e503
$09:ed71  75 cb		 adc $cb,x
$09:ed73  80 48		 bra $edbd
$09:ed75  2e 35 cb	  rol $cb35
$09:ed78  12 31		 ora ($31)
$09:ed7a  ec 96 a0	  cpx $a096
$09:ed7d  00 5a		 brk #$5a
$09:ed7f  ec 8d 2a	  cpx $2a8d
$09:ed82  11 d3		 ora ($d3),y
$09:ed84  68			pla
$09:ed85  82 6a 70	  brl $5df2
$09:ed88  01 28		 ora ($28,x)
$09:ed8a  98			tya
$09:ed8b  00 be		 brk #$be
$09:ed8d  e6 00		 inc $00
$09:ed8f  3d 17 82	  and $8217,x
$09:ed92  bf 68 00 03   lda $030068,x
$09:ed96  bc d2 00	  ldy $00d2,x
$09:ed99  ef 1b 47 a3   sbc $a3471b
$09:ed9d  db			stp
$09:ed9e  e5 4f		 sbc $4f
$09:eda0  e5 e2		 sbc $e2
$09:eda2  f3 9f		 sbc ($9f,s),y
$09:eda4  f5 67		 sbc $67,x
$09:eda6  ef 4b 41 cf   sbc $cf414b
$09:edaa  f8			sed
$09:edab  96 67		 stx $67,y
$09:edad  7c bd d9	  jmp ($d9bd,x)
$09:edb0  66 56		 ror $56
$09:edb2  5b			tcd
$09:edb3  63 0c		 adc $0c,s
$09:edb5  a2 8c 42	  ldx #$428c
$09:edb8  b2 af		 lda ($af)
$09:edba  c2 e5		 rep #$e5
$09:edbc  74 b6		 stz $b6,x
$09:edbe  b4 85		 ldy $85,x
$09:edc0  a2 b6 d5	  ldx #$d5b6
$09:edc3  f8			sed
$09:edc4  db			stp
$09:edc5  9c 44 e1	  stz $e144
$09:edc8  68			pla
$09:edc9  04 1b		 tsb $1b
$09:edcb  33 9a		 and ($9a,s),y
$09:edcd  13 1d		 ora ($1d,s),y
$09:edcf  65 28		 adc $28
$09:edd1  48			pha
$09:edd2  f0 80		 beq $ed54
$09:edd4  6a			ror a
$09:edd5  33 79		 and ($79,s),y
$09:edd7  c1 31		 cmp ($31,x)
$09:edd9  d9 83 e9	  cmp $e983,y
$09:eddc  00 f4		 brk #$f4
$09:edde  e7 73		 sbc [$73]
$09:ede0  c6 b6		 dec $b6
$09:ede2  05 11		 ora $11
$09:ede4  5e 81 66	  lsr $6681,x
$09:ede7  68			pla
$09:ede8  90 dd		 bcc $edc7
$09:edea  d8			cld
$09:edeb  6b			rtl
$09:edec  97 00		 sta [$00],y
$09:edee  58			cli
$09:edef  5c 6b 86 48   jml $48866b
$09:edf3  b2 5a		 lda ($5a)
$09:edf5  81 41		 sta ($41,x)
$09:edf7  6b			rtl
$09:edf8  b2 13		 lda ($13)
$09:edfa  e0 fe 88	  cpx #$88fe
$09:edfd  22 44 18 d8   jsl $d81844
$09:ee01  ce a0 74	  dec $74a0
$09:ee04  23 d0		 and $d0,s
$09:ee06  1d 50 d6	  ora $d650,x
$09:ee09  76 97		 ror $97,x
$09:ee0b  e0 fa 12	  cpx #$12fa
$09:ee0e  02 fc		 cop #$fc
$09:ee10  10 50		 bpl $ee62
$09:ee12  24 03		 bit $03
$09:ee14  db			stp
$09:ee15  e5 4f		 sbc $4f
$09:ee17  e5 e9		 sbc $e9
$09:ee19  5e 39 ff	  lsr $ff39,x
$09:ee1c  56 7d		 lsr $7d,x
$09:ee1e  5e 7e 2c	  lsr $2c7e,x
$09:ee21  fd f6 fd	  sbc $fdf6,x
$09:ee24  65 b2		 adc $b2
$09:ee26  db			stp
$09:ee27  18			clc
$09:ee28  01 14		 ora ($14,x)
$09:ee2a  60			rts
$09:ee2b  8b			phb
$09:ee2c  00 66		 brk #$66
$09:ee2e  56 5b		 lsr $5b,x
$09:ee30  bd fe db	  lda $dbfe,x
$09:ee33  72 ba		 adc ($ba)
$09:ee35  5b			tcd
$09:ee36  5a			phy
$09:ee37  22 d0 56 68   jsl $6856d0
$09:ee3b  5b			tcd
$09:ee3c  ac b6 e7	  ldy $e7b6
$09:ee3f  09 38 15	  ora #$1538
$09:ee42  9a			txs
$09:ee43  09 b2 79	  ora #$79b2
$09:ee46  35 a0		 and $a0,x
$09:ee48  3e 22 94	  rol $9422,x
$09:ee4b  14 a7		 trb $a7
$09:ee4d  a4 3e		 ldy $3e
$09:ee4f  20 09 f4	  jsr $f409
$09:ee52  78			sei
$09:ee53  5f 9e 0d f8   eor $f80d9e,x
$09:ee57  05 70		 ora $70
$09:ee59  7e 17 08	  ror $0817,x
$09:ee5c  2f a2 0b 71   and $710ba2
$09:ee60  20 80 a5	  jsr $a580
$09:ee63  2c 84 f0	  bit $f084
$09:ee66  b5 42		 lda $42,x
$09:ee68  fc 30 bb	  jsr ($bb30,x)
$09:ee6b  59 44 03	  eor $0344,y
$09:ee6e  28			plp
$09:ee6f  77 28		 adc [$28],y
$09:ee71  47 ba		 eor [$ba]
$09:ee73  10 7d		 bpl $eef2
$09:ee75  04 50		 tsb $50
$09:ee77  8a			txa
$09:ee78  c8			iny
$09:ee79  dd e7 ed	  cmp $ede7,x
$09:ee7c  7c 85 68	  jmp ($6885,x)
$09:ee7f  fd 61 60	  sbc $6061,x
$09:ee82  b3 9f		 lda ($9f,s),y
$09:ee84  ac 2a 06	  ldy $062a
$09:ee87  60			rts
$09:ee88  49 e2 c7	  eor #$c7e2
$09:ee8b  15 fe		 ora $fe,x
$09:ee8d  c0 6b 0d	  cpy #$0d6b
$09:ee90  c0 d5 e6	  cpy #$e6d5
$09:ee93  01 15		 ora ($15,x)
$09:ee95  a3 45		 lda $45,s
$09:ee97  eb			xba
$09:ee98  a3 b2		 lda $b2,s
$09:ee9a  5f cb f5 6d   eor $6df5cb,x
$09:ee9e  28			plp
$09:ee9f  f0 12		 beq $eeb3
$09:eea1  8a			txa
$09:eea2  44 6b b0	  mvp $b0,$6b
$09:eea5  64 e1		 stz $e1
$09:eea7  8c 91 42	  sty $4291
$09:eeaa  35 dd		 and $dd,x
$09:eeac  a3 fc		 lda $fc,s
$09:eeae  c6 68		 dec $68
$09:eeb0  d1 10		 cmp ($10),y
$09:eeb2  6a			ror a
$09:eeb3  8c 90 94	  sty $9490
$09:eeb6  4f e4 19 a0   eor $a019e4
$09:eeba  90 6d		 bcc $ef29
$09:eebc  04 ea		 tsb $ea
$09:eebe  1b			tcs
$09:eebf  16 44		 asl $44,x
$09:eec1  7f 23 32 c9   adc $c93223,x
$09:eec5  0b			phd
$09:eec6  e6 e3		 inc $e3
$09:eec8  5c ae 5c 0b   jml $0b5cae
$09:eecc  d5 6b		 cmp $6b,x
$09:eece  b2 59		 lda ($59)
$09:eed0  2d 40 e2	  and $e240
$09:eed3  f6 f9		 inc $f9,x
$09:eed5  56 48		 lsr $48,x
$09:eed7  4a			lsr a
$09:eed8  2f 5b b3 29   and $29b35b
$09:eedc  d8			cld
$09:eedd  f7 66		 sbc [$66],y
$09:eedf  51 28		 eor ($28),y
$09:eee1  ac fe be	  ldy $befe
$09:eee4  5e ee 57	  lsr $57ee,x
$09:eee7  67 91		 adc [$91]
$09:eee9  3c 59 de	  bit $de59,x
$09:eeec  16 57		 asl $57,x
$09:eeee  91 80		 sta ($80),y
$09:eef0  56 ca		 lsr $ca,x
$09:eef2  ef db 6b fc   sbc $fc6bdb
$09:eef6  6e 62 19	  ror $1962
$09:eef9  b7 3b		 lda [$3b],y
$09:eefb  c2 db		 rep #$db
$09:eefd  74 18		 stz $18,x
$09:eeff  cb			wai
$09:ef00  f8			sed
$09:ef01  ad c4 22	  lda $22c4
$09:ef04  20 a8 34	  jsr $34a8
$09:ef07  02 1a		 cop #$1a
$09:ef09  4f 00 0d db   eor $db0d00
$09:ef0d  b2 b6		 lda ($b6)
$09:ef0f  f7 8e		 sbc [$8e],y
$09:ef11  65 84		 adc $84
$09:ef13  18			clc
$09:ef14  0e 1b 6d	  asl $6d1b
$09:ef17  d5 23		 cmp $23,x
$09:ef19  21 e1		 and ($e1,x)
$09:ef1b  82 a8 6e	  brl $5dc6
$09:ef1e  f9 8b c6	  sbc $c68b,y
$09:ef21  2c 66 69	  bit $6966
$09:ef24  6e be 62	  ror $62be
$09:ef27  31 2c		 and ($2c),y
$09:ef29  19 82 dd	  ora $dd82,y
$09:ef2c  b0 b8		 bcs $eee6
$09:ef2e  66 85		 ror $85
$09:ef30  4d 2e d8	  eor $d82e
$09:ef33  2c 1b 82	  bit $821b
$09:ef36  99 a1 76	  sta $76a1,y
$09:ef39  b9 3b 81	  lda $813b,y
$09:ef3c  e2 2f		 sep #$2f
$09:ef3e  05 bb		 ora $bb
$09:ef40  df ec b6 57   cmp $57b6ec,x
$09:ef44  89 80		 bit #$80
$09:ef46  15 fa		 ora $fa,x
$09:ef48  16 d7		 asl $d7,x
$09:ef4a  86 db		 stx $db
$09:ef4c  ac b7 31	  ldy $31b7
$09:ef4f  04 bf		 tsb $bf
$09:ef51  42 ed		 wdm #$ed
$09:ef53  6d ba 0c	  adc $0cba
$09:ef56  21 f8		 and ($f8,x)
$09:ef58  76 e2		 ror $e2,x
$09:ef5a  09 10		 ora #$10
$09:ef5c  14 1b		 trb $1b
$09:ef5e  e4 00		 cpx $00
$09:ef60  00 60		 brk #$60
$09:ef62  00 1e		 brk #$1e
$09:ef64  17 b7		 ora [$b7],y
$09:ef66  cc 3f c0	  cpy $c03f
$09:ef69  43 79		 eor $79,s
$09:ef6b  7b			tdc
$09:ef6c  6d b6 ea	  adc $eab6
$09:ef6f  90 97		 bcc $ef08
$09:ef71  e8			inx
$09:ef72  41 53		 eor ($53,x)
$09:ef74  f6 1d		 inc $1d,x
$09:ef76  19 a6 31	  ora $31a6,y
$09:ef79  63 38		 adc $38,s
$09:ef7b  d1 70		 cmp ($70),y
$09:ef7d  41 71		 eor ($71,x)
$09:ef7f  2c 19 c5	  bit $c519
$09:ef82  0b			phd
$09:ef83  82 69 86	  brl $75ef
$09:ef86  68			pla
$09:ef87  d6 1d		 dec $1d,x
$09:ef89  7e 18 37	  ror $3718,x
$09:ef8c  0d 61 3c	  ora $3c61
$09:ef8f  1e 8a f4	  asl $f48a,x
$09:ef92  01 e4		 ora ($e4,x)
$09:ef94  96 af		 stx $af,y
$09:ef96  47 85		 eor [$85]
$09:ef98  e4 3e		 cpx $3e
$09:ef9a  8f 03 c5 ab   sta $abc503
$09:ef9e  be 0f 4b	  ldx $4b0f,y
$09:efa1  c8			iny
$09:efa2  5d f1 5d	  eor $5df1,x
$09:efa5  7d 45 66	  adc $6645,x
$09:efa8  be 25 1b	  ldx $1b25,y
$09:efab  40			rti
$09:efac  2a			rol a
$09:efad  2c ce f0	  bit $f0ce
$09:efb0  1a			inc a
$09:efb1  93 ed		 sta ($ed,s),y
$09:efb3  c3 20		 cmp $20,s
$09:efb5  35 30		 and $30,x
$09:efb7  5b			tcd
$09:efb8  82 40 6d	  brl $5cfb
$09:efbb  36 91		 rol $91,x
$09:efbd  38			sec
$09:efbe  91 63		 sta ($63),y
$09:efc0  26 45		 rol $45
$09:efc2  41 b3		 eor ($b3,x)
$09:efc4  e5 0e		 sbc $0e
$09:efc6  30 0a		 bmi $efd2
$09:efc8  5b			tcd
$09:efc9  8d 72 b9	  sta $b972
$09:efcc  70 1a		 bvs $efe8
$09:efce  d5 ae		 cmp $ae,x
$09:efd0  c9 64		 cmp #$64
$09:efd2  7c 81 19	  jmp ($1981,x)
$09:efd5  fc be d2	  jsr ($d2be,x)
$09:efd8  09 2b		 ora #$2b
$09:efda  c1 6a		 cmp ($6a,x)
$09:efdc  5e 37 90	  lsr $9037,x
$09:efdf  e3 a9		 sbc $a9,s
$09:efe1  d4 e7		 pei ($e7)
$09:efe3  92 bc		 sta ($bc)
$09:efe5  92 8d		 sta ($8d)
$09:efe7  47 ab		 eor [$ab]
$09:efe9  30 b6		 bmi $efa1
$09:efeb  86 c2		 stx $c2
$09:efed  b0 f9		 bcs $efe8
$09:efef  fe 5a dc	  inc $dc5a,x
$09:eff2  28			plp
$09:eff3  fe bb fd	  inc $fdbb,x
$09:eff6  61 7a		 adc ($7a,x)
$09:eff8  2a			rol a
$09:eff9  3e 5d 5f	  rol $5f5d,x
$09:effc  1e ff fc	  asl $fcff,x
$09:efff  d3 00		 cmp ($00,s),y
$09:f001  00 00		 brk #$00
$09:f003  00 1e		 brk #$1e
$09:f005  5f ff 7f 4a   eor $4a7fff,x
$09:f009  29 00		 and #$00
$09:f00b  00 df		 brk #$df
$09:f00d  22 df 73 4a   jsl $4a73df
$09:f011  29 00		 and #$00
$09:f013  00 e0		 brk #$e0
$09:f015  78			sei
$09:f016  1c 00 4a	  trb $4a00
$09:f019  29 00		 and #$00
$09:f01b  00 84		 brk #$84
$09:f01d  48			pha
$09:f01e  de 6f 08	  dec $086f,x
$09:f021  21 00		 and ($00,x)
$09:f023  00 16		 brk #$16
$09:f025  00 1f		 brk #$1f
$09:f027  00 9f		 brk #$9f
$09:f029  01 df		 ora ($df,x)
$09:f02b  02 9f		 cop #$9f
$09:f02d  33 ad		 and ($ad,s),y
$09:f02f  59 d6 72	  eor $72d6,y
$09:f032  39 7f 6a	  and $6a7f,y
$09:f035  00 d0		 brk #$d0
$09:f037  00 97		 brk #$97
$09:f039  01 7f		 ora ($7f,x)
$09:f03b  02 3f		 cop #$3f
$09:f03d  4f ff 7f 08   eor $087fff
$09:f041  21 00		 and ($00,x)
$09:f043  00 a7		 brk #$a7
$09:f045  0c 2d 15	  tsb $152d
$09:f048  d4 21		 pei ($21)
$09:f04a  9c 2e 6b	  stz $6b2e
$09:f04d  39 d6 72	  and $72d6,y
$09:f050  a0 40 80	  ldy #$8040
$09:f053  7d 00 01	  adc $0100,x
$09:f056  a0 01 60	  ldy #$6001
$09:f059  02 40		 cop #$40
$09:f05b  03 d0		 ora $d0,s
$09:f05d  43 ff		 eor $ff,s
$09:f05f  7f 08 21 00   adc $002108,x
$09:f063  00 2a		 brk #$2a
$09:f065  19 d0 35	  ora $35d0,y
$09:f068  96 4a		 stx $4a,y
$09:f06a  fa			plx
$09:f06b  56 9f		 lsr $9f,x
$09:f06d  67 ff		 adc [$ff]
$09:f06f  7f 80 15 40   adc $401580,x
$09:f073  2b			pld
$09:f074  00 28		 brk #$28
$09:f076  00 50		 brk #$50
$09:f078  00 7c		 brk #$7c
$09:f07a  e0 7d ef	  cpx #$ef7d
$09:f07d  7e ff 7f	  ror $7fff,x
$09:f080  08			php
$09:f081  21 00		 and ($00,x)
$09:f083  00 b2		 brk #$b2
$09:f085  00 98		 brk #$98
$09:f087  01 df		 ora ($df,x)
$09:f089  02 9f		 cop #$9f
$09:f08b  33 12		 and ($12,s),y
$09:f08d  00 1f		 brk #$1f
$09:f08f  00 00		 brk #$00
$09:f091  30 00		 bmi $f093
$09:f093  78			sei
$09:f094  c5 1c		 cmp $1c
$09:f096  8b			phb
$09:f097  3d 50 5e	  and $5e50,x
$09:f09a  35 7f		 and $7f,x
$09:f09c  9a			txs
$09:f09d  7f ff 7f 08   adc $087fff,x
$09:f0a1  21 00		 and ($00,x)
$09:f0a3  00 05		 brk #$05
$09:f0a5  40			rti
$09:f0a6  0c 7c 30	  tsb $307c
$09:f0a9  7d 73 7e	  adc $7e73,x
$09:f0ac  96 7f		 stx $7f,y
$09:f0ae  bf 56 12 00   lda $001256,x
$09:f0b2  1f 00 06 18   ora $180600,x
$09:f0b6  0c 30 12	  tsb $1230
$09:f0b9  48			pha
$09:f0ba  18			clc
$09:f0bb  60			rts
$09:f0bc  1c 72 ff	  trb $ff72
$09:f0bf  7f 08 21 00   adc $002108,x
$09:f0c3  00 12		 brk #$12
$09:f0c5  00 1f		 brk #$1f
$09:f0c7  00 1f		 brk #$1f
$09:f0c9  32 3f		 and ($3f)
$09:f0cb  5b			tcd
$09:f0cc  3f 03 52 42   and $425203,x
$09:f0d0  18			clc
$09:f0d1  5b			tcd
$09:f0d2  ff 73 84 10   sbc $108473,x
$09:f0d6  08			php
$09:f0d7  21 8c		 and ($8c,x)
$09:f0d9  31 10		 and ($10),y
$09:f0db  42 f7		 wdm #$f7
$09:f0dd  5e ff 7f	  lsr $7fff,x
$09:f0e0  e7 1c		 sbc [$1c]
$09:f0e2  25 01		 and $01
$09:f0e4  86 05		 stx $05
$09:f0e6  08			php
$09:f0e7  0a			asl a
$09:f0e8  0b			phd
$09:f0e9  13 8d		 ora ($8d,s),y
$09:f0eb  1b			tcs
$09:f0ec  21 48		 and ($48,x)
$09:f0ee  00 00		 brk #$00
$09:f0f0  21 08		 and ($08,x)
$09:f0f2  23 14		 and $14,s
$09:f0f4  66 1c		 ror $1c
$09:f0f6  a9 24		 lda #$24
$09:f0f8  0e 25 71	  asl $7125
$09:f0fb  21 16		 and ($16,x)
$09:f0fd  26 dc		 rol $dc
$09:f0ff  26 00		 rol $00
$09:f101  00 00		 brk #$00
$09:f103  00 1e		 brk #$1e
$09:f105  5f ff 7f 4a   eor $4a7fff,x
$09:f109  29 00		 and #$00
$09:f10b  00 df		 brk #$df
$09:f10d  22 df 73 4a   jsl $4a73df
$09:f111  29 00		 and #$00
$09:f113  00 e0		 brk #$e0
$09:f115  78			sei
$09:f116  1c 00 4a	  trb $4a00
$09:f119  29 00		 and #$00
$09:f11b  00 84		 brk #$84
$09:f11d  48			pha
$09:f11e  de 6f ce	  dec $ce6f,x
$09:f121  01 10		 ora ($10,x)
$09:f123  10 bf		 bpl $f0e4
$09:f125  00 5f		 brk #$5f
$09:f127  02 5f		 cop #$5f
$09:f129  23 ff		 and $ff,s
$09:f12b  7f 44 50 85   adc $855044,x
$09:f12f  71 c7		 adc ($c7),y
$09:f131  7e ec 7f	  ror $7fec,x
$09:f134  94 05		 sty $05,x
$09:f136  3b			tsc
$09:f137  0e 2c 69	  asl $692c
$09:f13a  df 43 00 00   cmp $000043,x
$09:f13e  86 34		 stx $34
$09:f140  16 00		 asl $00,x
$09:f142  13 30		 ora ($30,s),y
$09:f144  5f 4c ff 65   eor $65ff4c,x
$09:f148  ff 7b 0f 65   sbc $650f7b,x
$09:f14c  fc 7d 0b	  jsr ($0b7d,x)
$09:f14f  24 f4		 bit $f4
$09:f151  0d 2c 15	  ora $152c
$09:f154  fa			plx
$09:f155  6f c0 7c 80   adc $807cc0
$09:f159  7e 3f 13	  ror $133f,x
$09:f15c  00 00		 brk #$00
$09:f15e  04 50		 tsb $50
$09:f160  86 2a		 stx $2a
$09:f162  20 3a c0	  jsr $c03a
$09:f165  5f 41 24 ff   eor $ff2441,x
$09:f169  5b			tcd
$09:f16a  15 28		 ora $28,x
$09:f16c  5f 38 0b 24   eor $240b38,x
$09:f170  f4 0d 2c	  pea $2c0d
$09:f173  15 fa		 ora $fa,x
$09:f175  6f c0 7c 80   adc $807cc0
$09:f179  7e 3f 13	  ror $133f,x
$09:f17c  00 00		 brk #$00
$09:f17e  04 50		 tsb $50
$09:f180  d1 29		 cmp ($29),y
$09:f182  26 2d		 rol $2d
$09:f184  eb			xba
$09:f185  45 b2		 eor $b2
$09:f187  56 fe		 lsr $fe,x
$09:f189  7f 12 10 bf   adc $bf1012,x
$09:f18d  00 f0		 brk #$f0
$09:f18f  14 ff		 trb $ff
$09:f191  0d ff 2a	  ora $2aff
$09:f194  61 18		 adc ($18,x)
$09:f196  c0 3b 7a	  cpy #$7a3b
$09:f199  6f 8c 13 00   adc $00138c
$09:f19d  00 84		 brk #$84
$09:f19f  23 4a		 and $4a,s
$09:f1a1  29 eb		 and #$eb
$09:f1a3  59 13 73	  eor $7313,y
$09:f1a6  ff 7f c5 0c   sbc $0cc57f,x
$09:f1aa  8b			phb
$09:f1ab  01 b6		 ora ($b6,x)
$09:f1ad  12 11		 ora ($11)
$09:f1af  1c 1f 31	  trb $311f
$09:f1b2  7f 07 59 02   adc $025907,x
$09:f1b6  bf 7c e0 41   lda $41e07c,x
$09:f1ba  45 3d		 eor $3d
$09:f1bc  00 00		 brk #$00
$09:f1be  c4 28		 cpy $28
$09:f1c0  4a			lsr a
$09:f1c1  29 ae		 and #$ae
$09:f1c3  59 b7 7e	  eor $7eb7,y
$09:f1c6  ff 7f c9 18   sbc $18c97f,x
$09:f1ca  91 11		 sta ($11),y
$09:f1cc  99 2a 12	  sta $122a,y
$09:f1cf  14 1f		 trb $1f
$09:f1d1  00 f7		 brk #$f7
$09:f1d3  08			php
$09:f1d4  df 05 1f 13   cmp $131f05,x
$09:f1d8  e0 7d 60	  cpx #$607d
$09:f1db  7f 00 00 06   adc $060000,x
$09:f1df  78			sei
$09:f1e0  e7 1c		 sbc [$1c]
$09:f1e2  25 01		 and $01
$09:f1e4  86 05		 stx $05
$09:f1e6  08			php
$09:f1e7  0a			asl a
$09:f1e8  0b			phd
$09:f1e9  13 8d		 ora ($8d,s),y
$09:f1eb  1b			tcs
$09:f1ec  21 48		 and ($48,x)
$09:f1ee  00 00		 brk #$00
$09:f1f0  21 08		 and ($08,x)
$09:f1f2  23 14		 and $14,s
$09:f1f4  66 1c		 ror $1c
$09:f1f6  a9 24		 lda #$24
$09:f1f8  0e 25 71	  asl $7125
$09:f1fb  21 16		 and ($16,x)
$09:f1fd  26 dc		 rol $dc
$09:f1ff  26 4b		 rol $4b
$09:f201  4c 47 45	  jmp $4547
$09:f204  45 45		 eor $45
$09:f206  43 41		 eor $41,s
$09:f208  42 44		 wdm #$44
$09:f20a  46 46		 lsr $46
$09:f20c  46 48		 lsr $48
$09:f20e  4b			phk
$09:f20f  4c 50 51	  jmp $5150
$09:f212  52 52		 eor ($52)
$09:f214  52 52		 eor ($52)
$09:f216  52 52		 eor ($52)
$09:f218  52 52		 eor ($52)
$09:f21a  52 52		 eor ($52)
$09:f21c  52 52		 eor ($52)
$09:f21e  50 51		 bvc $f271
$09:f220  53 4d		 eor ($4d,s),y
$09:f222  52 52		 eor ($52)
$09:f224  52 52		 eor ($52)
$09:f226  52 52		 eor ($52)
$09:f228  52 52		 eor ($52)
$09:f22a  52 52		 eor ($52)
$09:f22c  52 52		 eor ($52)
$09:f22e  53 4d		 eor ($4d,s),y
$09:f230  53 4d		 eor ($4d,s),y
$09:f232  52 52		 eor ($52)
$09:f234  52 52		 eor ($52)
$09:f236  52 52		 eor ($52)
$09:f238  52 52		 eor ($52)
$09:f23a  52 52		 eor ($52)
$09:f23c  52 52		 eor ($52)
$09:f23e  53 4d		 eor ($4d,s),y
$09:f240  53 4d		 eor ($4d,s),y
$09:f242  52 52		 eor ($52)
$09:f244  52 52		 eor ($52)
$09:f246  52 52		 eor ($52)
$09:f248  52 52		 eor ($52)
$09:f24a  52 52		 eor ($52)
$09:f24c  52 52		 eor ($52)
$09:f24e  53 4d		 eor ($4d,s),y
$09:f250  53 4d		 eor ($4d,s),y
$09:f252  52 52		 eor ($52)
$09:f254  52 52		 eor ($52)
$09:f256  52 52		 eor ($52)
$09:f258  52 52		 eor ($52)
$09:f25a  52 52		 eor ($52)
$09:f25c  52 52		 eor ($52)
$09:f25e  53 4d		 eor ($4d,s),y
$09:f260  4e 4f 52	  lsr $524f
$09:f263  52 52		 eor ($52)
$09:f265  52 52		 eor ($52)
$09:f267  52 52		 eor ($52)
$09:f269  52 52		 eor ($52)
$09:f26b  52 52		 eor ($52)
$09:f26d  52 4e		 eor ($4e)
$09:f26f  4f 50 51 52   eor $525150
$09:f273  52 52		 eor ($52)
$09:f275  52 52		 eor ($52)
$09:f277  52 52		 eor ($52)
$09:f279  52 52		 eor ($52)
$09:f27b  52 52		 eor ($52)
$09:f27d  52 50		 eor ($50)
$09:f27f  51 53		 eor ($53),y
$09:f281  4d 52 52	  eor $5252
$09:f284  52 52		 eor ($52)
$09:f286  52 52		 eor ($52)
$09:f288  52 52		 eor ($52)
$09:f28a  52 52		 eor ($52)
$09:f28c  52 52		 eor ($52)
$09:f28e  53 4d		 eor ($4d,s),y
$09:f290  53 4d		 eor ($4d,s),y
$09:f292  52 52		 eor ($52)
$09:f294  52 52		 eor ($52)
$09:f296  52 52		 eor ($52)
$09:f298  52 52		 eor ($52)
$09:f29a  52 52		 eor ($52)
$09:f29c  52 52		 eor ($52)
$09:f29e  53 4d		 eor ($4d,s),y
$09:f2a0  53 4d		 eor ($4d,s),y
$09:f2a2  52 52		 eor ($52)
$09:f2a4  52 52		 eor ($52)
$09:f2a6  52 52		 eor ($52)
$09:f2a8  52 52		 eor ($52)
$09:f2aa  52 52		 eor ($52)
$09:f2ac  52 52		 eor ($52)
$09:f2ae  53 4d		 eor ($4d,s),y
$09:f2b0  53 4d		 eor ($4d,s),y
$09:f2b2  52 52		 eor ($52)
$09:f2b4  52 52		 eor ($52)
$09:f2b6  52 52		 eor ($52)
$09:f2b8  52 52		 eor ($52)
$09:f2ba  52 52		 eor ($52)
$09:f2bc  52 52		 eor ($52)
$09:f2be  53 4d		 eor ($4d,s),y
$09:f2c0  4e 4f 52	  lsr $524f
$09:f2c3  52 52		 eor ($52)
$09:f2c5  52 52		 eor ($52)
$09:f2c7  52 52		 eor ($52)
$09:f2c9  52 52		 eor ($52)
$09:f2cb  52 52		 eor ($52)
$09:f2cd  52 4e		 eor ($4e)
$09:f2cf  4f 49 4a 47   eor $474a49
$09:f2d3  45 45		 eor $45
$09:f2d5  45 45		 eor $45
$09:f2d7  43 44		 eor $44,s
$09:f2d9  46 46		 lsr $46
$09:f2db  46 46		 lsr $46
$09:f2dd  48			pha
$09:f2de  49 4a		 eor #$4a
$09:f2e0  00 00		 brk #$00
$09:f2e2  00 00		 brk #$00
$09:f2e4  00 00		 brk #$00
$09:f2e6  00 00		 brk #$00
$09:f2e8  00 00		 brk #$00
$09:f2ea  00 00		 brk #$00
$09:f2ec  00 00		 brk #$00
$09:f2ee  00 00		 brk #$00
$09:f2f0  00 00		 brk #$00
$09:f2f2  00 00		 brk #$00
$09:f2f4  00 00		 brk #$00
$09:f2f6  00 00		 brk #$00
$09:f2f8  00 00		 brk #$00
$09:f2fa  00 00		 brk #$00
$09:f2fc  00 00		 brk #$00
$09:f2fe  00 00		 brk #$00
$09:f300  08			php
$09:f301  21 ff		 and ($ff,x)
$09:f303  7f ff 7f ff   adc $ff7fff,x
$09:f307  7f ff 7f ff   adc $ff7fff,x
$09:f30b  7f ff 7f ff   adc $ff7fff,x
$09:f30f  7f ff 7f ff   adc $ff7fff,x
$09:f313  7f ff 7f ff   adc $ff7fff,x
$09:f317  7f ff 7f ff   adc $ff7fff,x
$09:f31b  7f ff 7f ff   adc $ff7fff,x
$09:f31f  7f 08 21 00   adc $002108,x
$09:f323  00 94		 brk #$94
$09:f325  01 5a		 ora ($5a,x)
$09:f327  02 ff		 cop #$ff
$09:f329  5b			tcd
$09:f32a  5f 1b 14 00   eor $00141b,x
$09:f32e  1f 00 1f 02   ora $021f00,x
$09:f332  46 30		 lsr $30
$09:f334  00 48		 brk #$48
$09:f336  00 70		 brk #$70
$09:f338  20 76 d2	  jsr $d276
$09:f33b  7b			tdc
$09:f33c  db			stp
$09:f33d  7b			tdc
$09:f33e  ff 7f 8c 31   sbc $318c7f,x
$09:f342  00 00		 brk #$00
$09:f344  4a			lsr a
$09:f345  00 12		 brk #$12
$09:f347  00 18		 brk #$18
$09:f349  00 1e		 brk #$1e
$09:f34b  00 0c		 brk #$0c
$09:f34d  01 70		 ora ($70,x)
$09:f34f  01 be		 ora ($be,x)
$09:f351  02 86		 cop #$86
$09:f353  30 4c		 bmi $f3a1
$09:f355  61 90		 adc ($90,x)
$09:f357  5a			phy
$09:f358  56 73		 lsr $73,x
$09:f35a  4e 21 56	  lsr $5621
$09:f35d  42 5e		 wdm #$5e
$09:f35f  63 8c		 adc $8c,s
$09:f361  31 00		 and ($00),y
$09:f363  00 10		 brk #$10
$09:f365  73 54		 adc ($54,s),y
$09:f367  77 98		 adc [$98],y
$09:f369  7b			tdc
$09:f36a  dc 7f 10	  jml [$107f]
$09:f36d  42 18		 wdm #$18
$09:f36f  63 ff		 adc $ff,s
$09:f371  7f ec 4f f6   adc $f64fec,x
$09:f375  73 86		 adc ($86,s),y
$09:f377  30 4c		 bmi $f3c5
$09:f379  61 90		 adc ($90,x)
$09:f37b  29 98		 and #$98
$09:f37d  4a			lsr a
$09:f37e  5e 63 08	  lsr $0863,x
$09:f381  21 ff		 and ($ff,x)
$09:f383  7f ff 7f ff   adc $ff7fff,x
$09:f387  7f ff 7f ff   adc $ff7fff,x
$09:f38b  7f ff 7f ff   adc $ff7fff,x
$09:f38f  7f ff 7f ff   adc $ff7fff,x
$09:f393  7f ff 7f ff   adc $ff7fff,x
$09:f397  7f ff 7f ff   adc $ff7fff,x
$09:f39b  7f ff 7f ff   adc $ff7fff,x
$09:f39f  7f 04 06 00   adc $000604,x
$09:f3a3  18			clc
$09:f3a4  6f 7b d9 76   adc $76d97b
$09:f3a8  1b			tcs
$09:f3a9  2d 9e d0	  and $d09e
$09:f3ac  02 bb		 cop #$bb
$09:f3ae  1d 90 4c	  ora $4c90,x
$09:f3b1  77 14		 adc [$14],y
$09:f3b3  0c 7e f4	  tsb $f47e
$09:f3b6  26 4f		 rol $4f
$09:f3b8  60			rts
$09:f3b9  dd 62 b1	  cmp $b162,x
$09:f3bc  02 30		 cop #$30
$09:f3be  85 e2		 sta $e2
$09:f3c0  3b			tsc
$09:f3c1  94 0c		 sty $0c,x
$09:f3c3  15 26		 ora $26,x
$09:f3c5  93 83		 sta ($83,s),y
$09:f3c7  85 87		 sta $87
$09:f3c9  ce eb 6d	  dec $6deb
$09:f3cc  b4 db		 ldy $db,x
$09:f3ce  ae b8 8a	  ldx $8ab8
$09:f3d1  85 46		 sta $46
$09:f3d3  a3 52		 lda $52,s
$09:f3d5  c4 01		 cpy $01
$09:f3d7  83 73		 sta $73,s
$09:f3d9  8e c4 5b	  stx $5bc4
$09:f3dc  6d 1e 8b	  adc $8b1e
$09:f3df  45 b8		 eor $b8
$09:f3e1  72 16		 adc ($16)
$09:f3e3  3a			dec a
$09:f3e4  cd 68 7c	  cmp $7c68
$09:f3e7  02 12		 cop #$12
$09:f3e9  b4 7c		 ldy $7c,x
$09:f3eb  fe 1f 3b	  inc $3b1f,x
$09:f3ee  46 22		 lsr $22
$09:f3f0  b1 85		 lda ($85),y
$09:f3f2  c4 0a		 cpy $0a
$09:f3f4  80 40		 bra $f436
$09:f3f6  77 52		 adc [$52],y
$09:f3f8  a0 5a 2e	  ldy #$2e5a
$09:f3fb  df dc 44 dc   cmp $dc44dc,x
$09:f3ff  72 22		 adc ($22)
$09:f401  01 14		 ora ($14,x)
$09:f403  04 2e		 tsb $2e
$09:f405  eb			xba
$09:f406  69 bb		 adc #$bb
$09:f408  43 44		 eor $44,s
$09:f40a  63 4b		 adc $4b,s
$09:f40c  c2 58		 rep #$58
$09:f40e  84 01		 sty $01
$09:f410  8b			phb
$09:f411  c6 20		 dec $20
$09:f413  94 48		 sty $48,x
$09:f415  58			cli
$09:f416  49 06		 eor #$06
$09:f418  d7 6c		 cmp [$6c],y
$09:f41a  91 5d		 sta ($5d),y
$09:f41c  f2 04		 sbc ($04)
$09:f41e  04 e2		 tsb $e2
$09:f420  f6 84		 inc $84,x
$09:f422  80 6f		 bra $f493
$09:f424  b1 43		 lda ($43),y
$09:f426  80 7b		 bra $f4a3
$09:f428  52 00		 eor ($00)
$09:f42a  82 26 09	  brl $fd53
$09:f42d  54 81 1c	  mvn $1c,$81
$09:f430  0b			phd
$09:f431  11 89		 ora ($89),y
$09:f433  dd ac a3	  cmp $a3ac,x
$09:f436  15 4b		 ora $4b,x
$09:f438  c1 dd		 cmp ($dd,x)
$09:f43a  5a			phy
$09:f43b  92 ee		 sta ($ee)
$09:f43d  f7 f6		 sbc [$f6],y
$09:f43f  b0 45		 bcs $f486
$09:f441  8a			txa
$09:f442  7b			tdc
$09:f443  06 08		 asl $08
$09:f445  84 48		 sty $48
$09:f447  c4 18		 cpy $18
$09:f449  fd e8 60	  sbc $60e8,x
$09:f44c  b7 18		 lda [$18],y
$09:f44e  ec 18 80	  cpx $8018
$09:f451  cf 22 62 08   cmp $086222
$09:f455  6f d0 c4 14   adc $14c4d0
$09:f459  9c 19 e0	  stz $e019
$09:f45c  4b			phk
$09:f45d  a1 0c		 lda ($0c,x)
$09:f45f  19 0e 22	  ora $220e,y
$09:f462  14 6a		 trb $6a
$09:f464  0c 25 64	  tsb $6425
$09:f467  b6 08		 ldx $08,y
$09:f469  c0 36 80	  cpy #$8036
$09:f46c  e0 0c 41	  cpx #$410c
$09:f46f  0a			asl a
$09:f470  24 81		 bit $81
$09:f472  e8			inx
$09:f473  3e e2 f2	  rol $f2e2,x
$09:f476  a8			tay
$09:f477  58			cli
$09:f478  ea			nop
$09:f479  35 2c		 and $2c,x
$09:f47b  47 a7		 eor [$a7]
$09:f47d  d5 4b		 cmp $4b,x
$09:f47f  17 9e		 ora [$9e],y
$09:f481  21 12		 and ($12,x)
$09:f483  15 8c		 ora $8c,x
$09:f485  2d 8e b4	  and $b48e
$09:f488  2f 33 10 0d   and $0d1033
$09:f48c  83 b9		 sta $b9,s
$09:f48e  e0 c5 62	  cpx #$62c5
$09:f491  29 64		 and #$64
$09:f493  90 c1		 bcc $f456
$09:f495  58			cli
$09:f496  2a			rol a
$09:f497  43 a1		 eor $a1,s
$09:f499  17 95		 ora [$95],y
$09:f49b  df 11 6a b5   cmp $b56a11,x
$09:f49f  91 40		 sta ($40),y
$09:f4a1  9a			txs
$09:f4a2  16 12		 asl $12,x
$09:f4a4  80 8d		 bra $f433
$09:f4a6  82 6e 36	  brl $2b17
$09:f4a9  0b			phd
$09:f4aa  55 ca		 eor $ca,x
$09:f4ac  e6 36		 inc $36
$09:f4ae  0c 25 8a	  tsb $8a25
$09:f4b1  c6 54		 dec $54
$09:f4b3  2f a8 d8 21   and $21d8a8
$09:f4b7  69 d0		 adc #$d0
$09:f4b9  b4 e3		 ldy $e3,x
$09:f4bb  15 e1		 ora $e1,x
$09:f4bd  84 c2		 sty $c2
$09:f4bf  8f c4 62 24   sta $2462c4
$09:f4c3  40			rti
$09:f4c4  b4 da		 ldy $da,x
$09:f4c6  33 1b		 and ($1b,s),y
$09:f4c8  6d b6 fa	  adc $fab6
$09:f4cb  d9 40 32	  cmp $3240,y
$09:f4ce  a6 22		 ldx $22
$09:f4d0  18			clc
$09:f4d1  8d 0b 48	  sta $480b
$09:f4d4  0c 37 47	  tsb $4737
$09:f4d7  c0 ba 8f	  cpy #$8fba
$09:f4da  40			rti
$09:f4db  9e 58 8b	  stz $8b58,x
$09:f4de  92 34		 sta ($34)
$09:f4e0  19 e6 81	  ora $81e6,y
$09:f4e3  0a			asl a
$09:f4e4  89 7c		 bit #$7c
$09:f4e6  4d 42 9d	  eor $9d42
$09:f4e9  00 06		 brk #$06
$09:f4eb  bf 7c 02 3b   lda $3b027c,x
$09:f4ef  01 20		 ora ($20,x)
$09:f4f1  85 0b		 sta $0b
$09:f4f3  67 b4		 adc [$b4]
$09:f4f5  00 88		 brk #$88
$09:f4f7  50 77		 bvc $f570
$09:f4f9  18			clc
$09:f4fa  e6 40		 inc $40
$09:f4fc  c3 69		 cmp $69,s
$09:f4fe  78			sei
$09:f4ff  4c 7e f4	  jmp $f47e
$09:f502  28			plp
$09:f503  24 f0		 bit $f0
$09:f505  a5 f7		 lda $f7
$09:f507  28			plp
$09:f508  0b			phd
$09:f509  a0 54 8a	  ldy #$8a54
$09:f50c  5c 2e cc 81   jml $81cc2e
$09:f510  2f 80 e0 44   and $44e080
$09:f514  c0 c6 21	  cpy #$21c6
$09:f517  c0 0e 03	  cpy #$030e
$09:f51a  05 59		 ora $59
$09:f51c  38			sec
$09:f51d  22 7c 69 78   jsl $78697c
$09:f521  3a			dec a
$09:f522  42 50		 wdm #$50
$09:f524  29 64		 and #$64
$09:f526  42 75		 wdm #$75
$09:f528  87 b3		 sta [$b3]
$09:f52a  11 ee		 ora ($ee),y
$09:f52c  c1 52		 cmp ($52,x)
$09:f52e  d0 21		 bne $f551
$09:f530  61 17		 adc ($17,x)
$09:f532  82 d0 7b	  brl $7105
$09:f535  9e 0c 55	  stz $550c,x
$09:f538  d7 11		 cmp [$11],y
$09:f53a  6d 50 02	  adc $0250
$09:f53d  44 1c c1	  mvp $c1,$1c
$09:f540  61 b4		 adc ($b4,x)
$09:f542  b3 03		 lda ($03,s),y
$09:f544  11 77		 ora ($77),y
$09:f546  63 10		 adc $10,s
$09:f548  9c 6b 36	  stz $366b
$09:f54b  27 30		 and [$30]
$09:f54d  5a			phy
$09:f54e  15 80		 ora $80,x
$09:f550  81 08		 sta ($08,x)
$09:f552  68			pla
$09:f553  d1 51		 cmp ($51),y
$09:f555  43 98		 eor $98,s
$09:f557  b4 bb		 ldy $bb,x
$09:f559  42 1a		 wdm #$1a
$09:f55b  38			sec
$09:f55c  02 2a		 cop #$2a
$09:f55e  9e 03 c1	  stz $c103,x
$09:f561  98			tya
$09:f562  b4 5a		 ldy $5a,x
$09:f564  4d e2 55	  eor $55e2
$09:f567  42 18		 wdm #$18
$09:f569  43 13		 eor $13,s
$09:f56b  e0 80 12	  cpx #$1280
$09:f56e  18			clc
$09:f56f  19 4a c1	  ora $c14a,y
$09:f572  52 22		 eor ($22)
$09:f574  85 28		 sta $28
$09:f576  fe 37 32	  inc $3237,x
$09:f579  18			clc
$09:f57a  7a			ply
$09:f57b  7d 44 30	  adc $3044,x
$09:f57e  3d 05 85	  and $8505,x
$09:f581  76 18		 ror $18,x
$09:f583  c4 78		 cpy $78
$09:f585  98			tya
$09:f586  84 4c		 sty $4c
$09:f588  13 73		 ora ($73,s),y
$09:f58a  c0 58 ac	  cpy #$ac58
$09:f58d  78			sei
$09:f58e  5c 4e fc 03   jml $03fc4e
$09:f592  ef ff 07 66   sbc $6607ff
$09:f596  c8			iny
$09:f597  3e fb 3d	  rol $3dfb,x
$09:f59a  a0 38 99	  ldy #$9938
$09:f59d  26 78		 rol $78
$09:f59f  03 88		 ora $88,s
$09:f5a1  50 31		 bvc $f5d4
$09:f5a3  3b			tsc
$09:f5a4  b0 71		 bcs $f617
$09:f5a6  36 4d		 rol $4d,x
$09:f5a8  0c 05 90	  tsb $9005
$09:f5ab  85 8e		 sta $8e
$09:f5ad  51 d2		 eor ($d2),y
$09:f5af  56 db		 lsr $db,x
$09:f5b1  4d b9 32	  eor $32b9
$09:f5b4  38			sec
$09:f5b5  d1 d1		 cmp ($d1),y
$09:f5b7  a5 86		 lda $86
$09:f5b9  db			stp
$09:f5ba  68			pla
$09:f5bb  f4 5a 2d	  pea $2d5a
$09:f5be  d8			cld
$09:f5bf  87 68		 sta [$68]
$09:f5c1  6d c1 c4	  adc $c4c1
$09:f5c4  bb			tyx
$09:f5c5  1b			tcs
$09:f5c6  47 cf		 eor [$cf]
$09:f5c8  e1 f3		 sbc ($f3,x)
$09:f5ca  b4 19		 ldy $19,x
$09:f5cc  c0 74 72	  cpy #$7274
$09:f5cf  0a			asl a
$09:f5d0  92 60		 sta ($60)
$09:f5d2  2e a7 20	  rol $20a7
$09:f5d5  b4 5d		 ldy $5d,x
$09:f5d7  8e ec db	  stx $dbec
$09:f5da  14 08		 trb $08
$09:f5dc  5a			phy
$09:f5dd  6e d0 d2	  ror $d2d0
$09:f5e0  42 c8		 wdm #$c8
$09:f5e2  2c 4d b0	  bit $b04d
$09:f5e5  fe b0 c6	  inc $c6b0,x
$09:f5e8  94 77		 sty $77,x
$09:f5ea  6a			ror a
$09:f5eb  83 ac		 sta $ac,s
$09:f5ed  1c 40 b3	  trb $b340
$09:f5f0  22 ca 13 83   jsl $8313ca
$09:f5f4  0b			phd
$09:f5f5  0c 76 86	  tsb $8676
$09:f5f8  d9 88 46	  cmp $4688,y
$09:f5fb  a3 90		 lda $90,s
$09:f5fd  2d 60 1c	  and $1c60
$09:f600  8c 58 07	  sty $0758
$09:f603  26 eb		 rol $eb
$09:f605  15 82		 ora $82,x
$09:f607  a4 d2		 ldy $d2
$09:f609  8f 0a eb 41   sta $41eb0a
$09:f60d  f8			sed
$09:f60e  7f 47 27 b0   adc $b02747,x
$09:f612  d8			cld
$09:f613  89 c9		 bit #$c9
$09:f615  de 04 f0	  dec $f004,x
$09:f618  a9 63		 lda #$63
$09:f61a  f7 a2		 sbc [$a2],y
$09:f61c  70 d9		 bvs $f5f7
$09:f61e  6e 31 c9	  ror $c931
$09:f621  10 1c		 bpl $f63f
$09:f623  83 bc		 sta $bc,s
$09:f625  2e b5 02	  rol $02b5
$09:f628  08			php
$09:f629  cd f1 10	  cmp $10f1
$09:f62c  a3 00		 lda $00,s
$09:f62e  09 80		 ora #$80
$09:f630  3a			dec a
$09:f631  58			cli
$09:f632  32 78		 and ($78)
$09:f634  08			php
$09:f635  c5 20		 cmp $20
$09:f637  10 ca		 bpl $f603
$09:f639  58			cli
$09:f63a  c4 02		 cpy $02
$09:f63c  80 ef		 bra $f62d
$09:f63e  0a			asl a
$09:f63f  5f 6e bb 4f   eor $4fbb6e,x
$09:f643  f4 57 c8	  pea $c857
$09:f646  23 4e		 and $4e,s
$09:f648  a6 d7		 ldx $d7
$09:f64a  b0 74		 bcs $f6c0
$09:f64c  b7 78		 lda [$78],y
$09:f64e  62 3b 9f	  per $958c
$09:f651  0a			asl a
$09:f652  af c2 cf 8a   lda $8acfc2
$09:f656  bc 94 c6	  ldy $c694,x
$09:f659  ae 7f 07	  ldx $077f
$09:f65c  78			sei
$09:f65d  69 28		 adc #$28
$09:f65f  17 73		 ora [$73],y
$09:f661  18			clc
$09:f662  8c 46 a2	  sty $a246
$09:f665  6a			ror a
$09:f666  0a			asl a
$09:f667  94 dd		 sty $dd,x
$09:f669  de 10 d2	  dec $d210,x
$09:f66c  10 7a		 bpl $f6e8
$09:f66e  09 61		 ora #$61
$09:f670  88			dey
$09:f671  be d3 29	  ldx $29d3,y
$09:f674  d4 cf		 pei ($cf)
$09:f676  45 68		 eor $68
$09:f678  bc 25 10	  ldy $1025,x
$09:f67b  ab			plb
$09:f67c  94 c7		 sty $c7,x
$09:f67e  15 7b		 ora $7b,x
$09:f680  f8			sed
$09:f681  59 90 60	  eor $6090,y
$09:f684  10 02		 bpl $f688
$09:f686  78			sei
$09:f687  cd cc 65	  cmp $65cc
$09:f68a  0d c2 56	  ora $56c2
$09:f68d  53 20		 eor ($20,s),y
$09:f68f  61 08		 adc ($08,x)
$09:f691  59 3c 7b	  eor $7b3c,y
$09:f694  74 ea		 stz $ea,x
$09:f696  f7 a3		 sbc [$a3],y
$09:f698  d0 a1		 bne $f63b
$09:f69a  0f 42 90 29   ora $299042
$09:f69e  82 90 77	  brl $6e31
$09:f6a1  84 de		 sty $de
$09:f6a3  f3 67		 sbc ($67,s),y
$09:f6a5  29 85		 and #$85
$09:f6a7  5f 15 dc aa   eor $aadc15,x
$09:f6ab  d5 11		 cmp $11,x
$09:f6ad  20 50 02	  jsr $0250
$09:f6b0  78			sei
$09:f6b1  a6 04		 ldx $04
$09:f6b3  c6 06		 dec $06
$09:f6b5  14 56		 trb $56
$09:f6b7  95 2e		 sta $2e,x
$09:f6b9  fb			xce
$09:f6ba  4d ae 92	  eor $92ae
$09:f6bd  c2 93		 rep #$93
$09:f6bf  7d 54 81	  adc $8154,x
$09:f6c2  2c 4d c3	  bit $c34d
$09:f6c5  84 bd		 sty $bd
$09:f6c7  a0 c1 66	  ldy #$66c1
$09:f6ca  15 1a		 ora $1a,x
$09:f6cc  9f c3 e1 54   sta $54e1c3,x
$09:f6d0  b3 d8		 lda ($d8,s),y
$09:f6d2  69 40		 adc #$40
$09:f6d4  60			rts
$09:f6d5  27 8d		 and [$8d]
$09:f6d7  42 a3		 wdm #$a3
$09:f6d9  78			sei
$09:f6da  a7 17		 lda [$17]
$09:f6dc  43 b9		 eor $b9,s
$09:f6de  e0 c5 7d	  cpx #$7dc5
$09:f6e1  f1 0e		 sbc ($0e),y
$09:f6e3  f1 c5		 sbc ($c5),y
$09:f6e5  b0 42		 bcs $f729
$09:f6e7  c5 5b		 cmp $5b
$09:f6e9  aa			tax
$09:f6ea  58			cli
$09:f6eb  c5 20		 cmp $20
$09:f6ed  cc 0f 4f	  cpy $4f0f
$09:f6f0  a9 de		 lda #$de
$09:f6f2  1b			tcs
$09:f6f3  5d f3 00	  eor $00f3,x
$09:f6f6  f0 b8		 beq $f6b0
$09:f6f8  88			dey
$09:f6f9  66 23		 ror $23
$09:f6fb  db			stp
$09:f6fc  82 a4 bb	  brl $b2a3
$09:f6ff  c1 e0		 cmp ($e0,x)
$09:f701  36 d0		 rol $d0,x
$09:f703  48			pha
$09:f704  02 42		 cop #$42
$09:f706  17 0d		 ora [$0d],y
$09:f708  04 83		 tsb $83
$09:f70a  d0 36		 bne $f742
$09:f70c  7b			tdc
$09:f70d  47 80		 eor [$80]
$09:f70f  f7 28		 sbc [$28],y
$09:f711  00 90		 brk #$90
$09:f713  86 c2		 stx $c2
$09:f715  c3 22		 cmp $22,s
$09:f717  04 0c		 tsb $0c
$09:f719  4e ec 00	  lsr $00ec
$09:f71c  38			sec
$09:f71d  c2 20		 rep #$20
$09:f71f  f9 08 82	  sbc $8208,y
$09:f722  09 0c 20	  ora #$200c
$09:f725  fc 76 bb	  jsr ($bb76,x)
$09:f728  62 9a ef	  per $e6c5
$09:f72b  80 41		 bra $f76e
$09:f72d  88			dey
$09:f72e  c7 ef		 cmp [$ef]
$09:f730  46 00		 lsr $00
$09:f732  62 60 89	  per $8095
$09:f735  62 07 e2	  per $d93f
$09:f738  62 74 f8	  per $efaf
$09:f73b  d2 ed		 cmp ($ed)
$09:f73d  f4 cd 92	  pea $92cd
$09:f740  09 f7 18	  ora #$18f7
$09:f743  e8			inx
$09:f744  56 23		 lsr $23,x
$09:f746  b9 f0 36	  lda $36f0,y
$09:f749  88			dey
$09:f74a  24 30		 bit $30
$09:f74c  54 b1 50	  mvn $50,$b1
$09:f74f  06 82		 asl $82
$09:f751  db			stp
$09:f752  69 9b f6	  adc #$f69b
$09:f755  e9 c3 70	  sbc #$70c3
$09:f758  0e 85 2a	  asl $2a85
$09:f75b  15 0b		 ora $0b,x
$09:f75d  53 82		 eor ($82,s),y
$09:f75f  74 2d		 stz $2d,x
$09:f761  18			clc
$09:f762  04 79		 tsb $79
$09:f764  bd 02 a5	  lda $a502,x
$09:f767  0c 86 d2	  tsb $d286
$09:f76a  d3 a1		 cmp ($a1,s),y
$09:f76c  4f f4 53 f1   eor $f153f4
$09:f770  1d b5 f0	  ora $f0b5,x
$09:f773  00 c5		 brk #$c5
$09:f775  da			phx
$09:f776  10 af		 bpl $f727
$09:f778  0a			asl a
$09:f779  b4 3e		 ldy $3e,x
$09:f77b  15 5a		 ora $5a,x
$09:f77d  ba			tsx
$09:f77e  3c a1 58	  bit $58a1,x
$09:f781  2b			pld
$09:f782  05 45		 ora $45
$09:f784  da			phx
$09:f785  10 db		 bpl $f762
$09:f787  ad a6 d3	  lda $d3a6
$09:f78a  80 57		 bra $f7e3
$09:f78c  00 28		 brk #$28
$09:f78e  07 20		 ora [$20]
$09:f790  b4 07		 ldy $07,x
$09:f792  28			plp
$09:f793  58			cli
$09:f794  54 a0 da	  mvn $da,$a0
$09:f797  05 68		 ora $68
$09:f799  42 c3		 wdm #$c3
$09:f79b  41 dc		 eor ($dc,x)
$09:f79d  f0 62		 beq $f801
$09:f79f  83 40		 sta $40,s
$09:f7a1  09 08 6e	  ora #$6e08
$09:f7a4  13 0b		 ora ($0b,s),y
$09:f7a6  0c 1f 82	  tsb $821f
$09:f7a9  88			dey
$09:f7aa  03 41		 ora $41,s
$09:f7ac  77 4b		 adc [$4b],y
$09:f7ae  05 26		 ora $26
$09:f7b0  93 83		 sta ($83,s),y
$09:f7b2  a5 89		 lda $89
$09:f7b4  44 7e 00	  mvp $00,$7e
$09:f7b7  71 15		 adc ($15),y
$09:f7b9  1a			inc a
$09:f7ba  d4 07		 pei ($07)
$09:f7bc  20 df 01	  jsr $01df
$09:f7bf  f8			sed
$09:f7c0  2d 41 28	  and $2841
$09:f7c3  2b			pld
$09:f7c4  30 b1		 bmi $f777
$09:f7c6  d6 6b		 dec $6b,x
$09:f7c8  4d f0 47	  eor $47f0
$09:f7cb  00 fc		 brk #$fc
$09:f7cd  2c 62 81	  bit $8162
$09:f7d0  6f 85 63 0a   adc $0a6385
$09:f7d4  a2 04 a0	  ldx #$a004
$09:f7d7  e3 31		 sbc $31,s
$09:f7d9  bb			tyx
$09:f7da  b1 b0		 lda ($b0),y
$09:f7dc  3c 03 18	  bit $1803,x
$09:f7df  43 17		 eor $17,s
$09:f7e1  b1 62		 lda ($62),y
$09:f7e3  77 fb		 adc [$fb],y
$09:f7e5  6d b9 08	  adc $08b9
$09:f7e8  71 a4		 adc ($a4),y
$09:f7ea  c0 db 1b	  cpy #$1bdb
$09:f7ed  05 e0		 ora $e0
$09:f7ef  07 02		 ora [$02]
$09:f7f1  25 89		 and $89
$09:f7f3  34 0f		 bit $0f,x
$09:f7f5  43 8b		 eor $8b,s
$09:f7f7  21 88		 and ($88,x)
$09:f7f9  f4 0b a1	  pea $a10b
$09:f7fc  8f de 6d 0b   sta $0b6dde
$09:f800  a0 5d 0d	  ldy #$0d5d
$09:f803  a9 50 0e	  lda #$0e50
$09:f806  e2 63		 sep #$63
$09:f808  18			clc
$09:f809  5e 3f 7b	  lsr $7b3f,x
$09:f80c  b2 d9		 lda ($d9)
$09:f80e  6c ce 27	  jmp ($27ce)
$09:f811  20 d8 6c	  jsr $6cd8
$09:f814  69 db		 adc #$db
$09:f816  4b			phk
$09:f817  4d ba 1a	  eor $1aba
$09:f81a  d3 04		 cmp ($04,s),y
$09:f81c  01 25		 ora ($25,x)
$09:f81e  87 71		 sta [$71]
$09:f820  86 aa		 stx $aa
$09:f822  6f 70 16 84   adc $841670
$09:f826  78			sei
$09:f827  42 c1		 wdm #$c1
$09:f829  21 82		 and ($82,x)
$09:f82b  0c 88 ac	  tsb $ac88
$09:f82e  18			clc
$09:f82f  01 8a		 ora ($8a,x)
$09:f831  a6 7a		 ldx $7a
$09:f833  29 88		 and #$88
$09:f835  f0 c4		 beq $f7fb
$09:f837  52 00		 eor ($00)
$09:f839  c2 12		 rep #$12
$09:f83b  16 80		 asl $80,x
$09:f83d  d5 2c		 cmp $2c,x
$09:f83f  f6 6c		 inc $6c,x
$09:f841  05 a2		 ora $a2
$09:f843  15 58		 ora $58,x
$09:f845  b1 39		 lda ($39),y
$09:f847  c0 10 10	  cpy #$1010
$09:f84a  be df a2	  ldx $a2df,y
$09:f84d  97 80		 sta [$80],y
$09:f84f  c0 5a 6d	  cpy #$6d5a
$09:f852  37 68		 and [$68],y
$09:f854  64 34		 stz $34
$09:f856  2a			rol a
$09:f857  2c 80 86	  bit $8680
$09:f85a  f7 2c		 sbc [$2c],y
$09:f85c  f8			sed
$09:f85d  a6 10		 ldx $10
$09:f85f  5a			phy
$09:f860  2e d0 a8	  rol $a8d0
$09:f863  5c 28 2a 2c   jml $2c2a28
$09:f867  71 86		 adc ($86),y
$09:f869  00 c1		 brk #$c1
$09:f86b  0c 6f 3f	  tsb $3f6f
$09:f86e  02 7a		 cop #$7a
$09:f870  24 90		 bit $90
$09:f872  6c 17 24	  jmp ($2417)
$09:f875  c8			iny
$09:f876  e3 a8		 sbc $a8,s
$09:f878  05 b2		 ora $b2
$09:f87a  11 90		 ora ($90),y
$09:f87c  a0 15 21	  ldy #$2115
$09:f87f  37 24		 and [$24],y
$09:f881  85 d4		 sta $d4
$09:f883  b6 5b		 ldx $5b,y
$09:f885  ac 53 30	  ldy $3053
$09:f888  2b			pld
$09:f889  d4 da		 pei ($da)
$09:f88b  f6 13		 inc $13,x
$09:f88d  b7 5d		 lda [$5d],y
$09:f88f  a7 11		 lda [$11]
$09:f891  00 e0		 brk #$e0
$09:f893  23 f0		 and $f0,s
$09:f895  5e 07 c1	  lsr $c107,x
$09:f898  7e 05 01	  ror $0105,x
$09:f89b  aa			tax
$09:f89c  fc 2a f9	  jsr ($f92a,x)
$09:f89f  01 60		 ora ($60,x)
$09:f8a1  0f c2 97 77   ora $7797c2
$09:f8a5  31 0a		 and ($0a),y
$09:f8a7  90 0c		 bcc $f8b5
$09:f8a9  44 3b 11	  mvp $11,$3b
$09:f8ac  f8			sed
$09:f8ad  92 08		 sta ($08)
$09:f8af  8c 04 20	  sty $2004
$09:f8b2  a7 53		 lda [$53]
$09:f8b4  0d 86 57	  ora $5786
$09:f8b7  32 b3		 and ($b3)
$09:f8b9  8a			txa
$09:f8ba  02 1a		 cop #$1a
$09:f8bc  62 1e e5	  per $dddd
$09:f8bf  01 22		 ora ($22,x)
$09:f8c1  3f d3 59 62   and $6259d3,x
$09:f8c5  26 e7		 rol $e7
$09:f8c7  73 c4		 adc ($c4,s),y
$09:f8c9  76 eb		 ror $eb,x
$09:f8cb  f4 d2 10	  pea $10d2
$09:f8ce  27 09		 and [$09]
$09:f8d0  b6 16		 ldx $16,y
$09:f8d2  6f 85 9f e0   adc $e09f85
$09:f8d6  56 05		 lsr $05,x
$09:f8d8  91 17		 sta ($17),y
$09:f8da  06 15		 asl $15
$09:f8dc  dc a0 5d	  jml [$5da0]
$09:f8df  d8			cld
$09:f8e0  43 88		 eor $88,s
$09:f8e2  30 93		 bmi $f877
$09:f8e4  00 05		 brk #$05
$09:f8e6  81 84		 sta ($84,x)
$09:f8e8  a5 a9		 lda $a9
$09:f8ea  cc 8c 0a	  cpy $0a8c
$09:f8ed  85 c1		 sta $c1
$09:f8ef  e2 16		 sep #$16
$09:f8f1  39 ba b6	  and $b6ba,y
$09:f8f4  50 30		 bvc $f926
$09:f8f6  96 2a		 stx $2a,y
$09:f8f8  8f f6 a3 63   sta $63a3f6
$09:f8fc  79 83 e4	  adc $e483,y
$09:f8ff  6c 75 a1	  jmp ($a175)
$09:f902  f8			sed
$09:f903  42 fb		 wdm #$fb
$09:f905  74 ca		 stz $ca,x
$09:f907  77 a2		 adc [$a2],y
$09:f909  9d 5a be	  sta $be5a,x
$09:f90c  81 40		 sta ($40,x)
$09:f90e  f4 18 5c	  pea $5c18
$09:f911  40			rti
$09:f912  fc 1c 00	  jsr ($001c,x)
$09:f915  54 0b 31	  mvn $31,$0b
$09:f918  54 2f 75	  mvn $75,$2f
$09:f91b  5b			tcd
$09:f91c  3a			dec a
$09:f91d  d0 61		 bne $f980
$09:f91f  83 f0		 sta $f0,s
$09:f921  c1 18		 cmp ($18,x)
$09:f923  4f 49 40 ac   eor $ac4049
$09:f927  b0 85		 bcs $f8ae
$09:f929  be 00 f0	  ldx $f000,y
$09:f92c  68			pla
$09:f92d  0d 76 9f	  ora $9f76
$09:f930  e8			inx
$09:f931  53 05		 eor ($05,s),y
$09:f933  7b			tdc
$09:f934  d1 5d		 cmp ($5d),y
$09:f936  a6 e2		 ldx $e2
$09:f938  30 40		 bmi $f97a
$09:f93a  f2 ab		 sbc ($ab)
$09:f93c  2e 82 a8	  rol $a882
$09:f93f  e6 0f		 inc $0f
$09:f941  82 e8 2c	  brl $262c
$09:f944  c1 00		 cmp ($00,x)
$09:f946  07 89		 ora [$89]
$09:f948  9c ca 29	  stz $29ca
$09:f94b  48			pha
$09:f94c  a4 ee		 ldy $ee
$09:f94e  b1 6a		 lda ($6a),y
$09:f950  64 53		 stz $53
$09:f952  05 32		 ora $32
$09:f954  bd e8 a6	  lda $a6e8,x
$09:f957  e1 2b		 sbc ($2b,x)
$09:f959  3b			tsc
$09:f95a  5d f3 99	  eor $99f3,x
$09:f95d  1c c1 54	  trb $54c1
$09:f960  3a			dec a
$09:f961  16 15		 asl $15,x
$09:f963  dc 04 00	  jml [$0004]
$09:f966  61 14		 adc ($14,x)
$09:f968  34 a4		 bit $a4,x
$09:f96a  74 bc		 stz $bc,x
$09:f96c  41 fc		 eor ($fc,x)
$09:f96e  61 65		 adc ($65,x)
$09:f970  10 49		 bpl $f9bb
$09:f972  8e 31 30	  stx $3031
$09:f975  8e e0 30	  stx $30e0
$09:f978  04 35		 tsb $35
$09:f97a  80 17		 bra $f993
$09:f97c  5c 4e ff 6c   jml $6cff4e
$09:f980  a9 39		 lda #$39
$09:f982  01 bc		 ora ($bc,x)
$09:f984  31 69		 and ($69),y
$09:f986  82 c6 b3	  brl $ad4f
$09:f989  41 72		 eor ($72,x)
$09:f98b  bb			tyx
$09:f98c  55 4a		 eor $4a,x
$09:f98e  6d d7 2c	  adc $2cd7
$09:f991  cd bd 83	  cmp $83bd
$09:f994  56 36		 lsr $36,x
$09:f996  3b			tsc
$09:f997  27 50		 and [$50]
$09:f999  ee 21 89	  inc $8921
$09:f99c  32 a8		 and ($a8)
$09:f99e  54 5e a5	  mvn $a5,$5e
$09:f9a1  61 a5		 adc ($a5,x)
$09:f9a3  43 6e		 eor $6e,s
$09:f9a5  b6 93		 ldx $93,y
$09:f9a7  08			php
$09:f9a8  57 52		 eor [$52],y
$09:f9aa  63 62		 adc $62,s
$09:f9ac  7a			ply
$09:f9ad  8d 8e b3	  sta $b38e
$09:f9b0  5a			phy
$09:f9b1  85 42		 sta $42
$09:f9b3  e1 44		 sbc ($44,x)
$09:f9b5  10 3b		 bpl $f9f2
$09:f9b7  05 2f		 ora $2f
$09:f9b9  06 6d		 asl $6d
$09:f9bb  00 b0		 brk #$b0
$09:f9bd  56 81		 lsr $81,x
$09:f9bf  a1 4b		 lda ($4b,x)
$09:f9c1  86 bb		 stx $bb
$09:f9c3  c3 b7		 cmp $b7,s
$09:f9c5  4e 20 85	  lsr $8520
$09:f9c8  02 97		 cop #$97
$09:f9ca  84 4b		 sty $4b
$09:f9cc  87 90		 sta [$90]
$09:f9ce  52 60		 eor ($60)
$09:f9d0  f1 59		 sbc ($59),y
$09:f9d2  22 a1 69 6a   jsl $6a69a1
$09:f9d6  76 64		 ror $64,x
$09:f9d8  2e 0f 12	  rol $120f
$09:f9db  b8			clv
$09:f9dc  7d 83 a8	  adc $a883,x
$09:f9df  b0 ab		 bcs $f98c
$09:f9e1  73 74		 adc ($74,s),y
$09:f9e3  1e e3 1c	  asl $1ce3,x
$09:f9e6  a3 15		 lda $15,s
$09:f9e8  38			sec
$09:f9e9  32 09		 and ($09)
$09:f9eb  20 0e f3	  jsr $f30e
$09:f9ee  01 84		 ora ($84,x)
$09:f9f0  2c a0 87	  bit $87a0
$09:f9f3  50 c1		 bvc $f9b6
$09:f9f5  52 69		 eor ($69)
$09:f9f7  38			sec
$09:f9f8  3a			dec a
$09:f9f9  59 e0 56	  eor $56e0,y
$09:f9fc  e4 e8		 cpx $e8
$09:f9fe  03 50		 ora $50,s
$09:fa00  3d 06 a5	  and $a506,x
$09:fa03  0b			phd
$09:fa04  c4 3b		 cpy $3b
$09:fa06  c0 8e		 cpy #$8e
$09:fa08  48			pha
$09:fa09  50 79		 bvc $fa84
$09:fa0b  08			php
$09:fa0c  24 4f		 bit $4f
$09:fa0e  03 0d		 ora $0d,s
$09:fa10  6d 91 a8	  adc $a891
$09:fa13  04 61		 tsb $61
$09:fa15  58			cli
$09:fa16  c2 ab		 rep #$ab
$09:fa18  41 38		 eor ($38,x)
$09:fa1a  2a			rol a
$09:fa1b  e2 51		 sep #$51
$09:fa1d  8d d5 36	  sta $36d5
$09:fa20  14 b7		 trb $b7
$09:fa22  79 26 c0	  adc $c026,y
$09:fa25  ce 78 30	  dec $3078
$09:fa28  18			clc
$09:fa29  09 80 f0	  ora #$f080
$09:fa2c  98			tya
$09:fa2d  e3 e0		 sbc $e0,s
$09:fa2f  a2 c9		 ldx #$c9
$09:fa31  94 69		 sty $69,x
$09:fa33  b0 fa		 bcs $fa2f
$09:fa35  5a			phy
$09:fa36  6e d0 c0	  ror $c0d0
$09:fa39  e8			inx
$09:fa3a  43 44		 eor $44,s
$09:fa3c  a1 62		 lda ($62,x)
$09:fa3e  4c 02 64	  jmp $6402
$09:fa41  0f 65 0a 78   ora $780a65
$09:fa45  84 29		 sty $29
$09:fa47  36 10		 rol $10,x
$09:fa49  ac 25 64	  ldy $6425
$09:fa4c  10 18		 bpl $fa66
$09:fa4e  5e dd 33	  lsr $33dd,x
$09:fa51  08			php
$09:fa52  f2 07		 sbc ($07)
$09:fa54  f9 3c 85	  sbc $853c,y
$09:fa57  e2 34		 sep #$34
$09:fa59  be e5 53	  ldx $53e5,y
$09:fa5c  15 e4		 ora $e4,x
$09:fa5e  0f b0 50 71   ora $7150b0
$09:fa62  1d ba 6e	  ora $6eba,x
$09:fa65  08			php
$09:fa66  84 83		 sty $83
$09:fa68  00 df		 brk #$df
$09:fa6a  62 c3 e3	  per $de30
$09:fa6d  a5 f8		 lda $f8
$09:fa6f  54 0a 4d	  mvn $4d,$0a
$09:fa72  b5 19		 lda $19,x
$09:fa74  9c 1a a0	  stz $a01a
$09:fa77  cf 1d 96 cf   cmp $cf961d
$09:fa7b  68			pla
$09:fa7c  40			rti
$09:fa7d  54 28 35	  mvn $35,$28
$09:fa80  c6 1b		 dec $1b
$09:fa82  88			dey
$09:fa83  c7 ef		 cmp [$ef]
$09:fa85  49 eb		 eor #$eb
$09:fa87  ba			tsx
$09:fa88  c5 a2		 cmp $a2
$09:fa8a  c6 dc		 dec $dc
$09:fa8c  c9 08		 cmp #$08
$09:fa8e  52 e4		 eor ($e4)
$09:fa90  71 18		 adc ($18),y
$09:fa92  94 80		 sty $80,x
$09:fa94  6d 77 d8	  adc $d877
$09:fa97  ac 47 f5	  ldy $f547
$09:fa9a  6a			ror a
$09:fa9b  0c 60 c1	  tsb $c160
$09:fa9e  52 70		 eor ($70)
$09:faa0  70 a3		 bvs $fa45
$09:faa2  c8			iny
$09:faa3  a8			tay
$09:faa4  8c ec 30	  sty $30ec
$09:faa7  ca			dex
$09:faa8  85 46		 sta $46
$09:faaa  c3 4a		 cmp $4a,s
$09:faac  31 81		 and ($81),y
$09:faae  4c 0d 80	  jmp $800d
$09:fab1  e4 47		 cpx $47
$09:fab3  b0 a5		 bcs $fa5a
$09:fab5  c0 f0		 cpy #$f0
$09:fab7  24 70		 bit $70
$09:fab9  6e 86 30	  ror $3086
$09:fabc  c0 38		 cpy #$38
$09:fabe  8a			txa
$09:fabf  c5 8e		 cmp $8e
$09:fac1  b3 5a		 lda ($5a,s),y
$09:fac3  a5 a2		 lda $a2
$09:fac5  4b			phk
$09:fac6  11 dc		 ora ($dc),y
$09:fac8  f0 23		 beq $faed
$09:faca  85 ba		 sta $ba
$09:facc  0e a0 71	  asl $71a0
$09:facf  81 8c		 sta ($8c,x)
$09:fad1  8e e1 e3	  stx $e3e1
$09:fad4  4f ab ac 0d   eor $0dacab
$09:fad8  c0 74		 cpy #$74
$09:fada  06 99		 asl $99
$09:fadc  81 00		 sta ($00,x)
$09:fade  08			php
$09:fadf  0e 52 5f	  asl $5f52
$09:fae2  85 00		 sta $00
$09:fae4  dc 09 50	  jml [$5009]
$09:fae7  a8			tay
$09:fae8  d4 90		 pei ($90)
$09:faea  21 88		 and ($88,x)
$09:faec  bb			tyx
$09:faed  be 04 f2	  ldx $f204,y
$09:faf0  38			sec
$09:faf1  8a			txa
$09:faf2  45 f2		 eor $f2
$09:faf4  9b			txy
$09:faf5  4d f4 57	  eor $57f4
$09:faf8  90 20		 bcc $fb1a
$09:fafa  04 0a		 tsb $0a
$09:fafc  75 30		 adc $30,x
$09:fafe  f2 34		 sbc ($34)
$09:fb00  8b			phb
$09:fb01  05 6e		 ora $6e
$09:fb03  cd f0 b3	  cmp $b3f0
$09:fb06  fc 1e 80	  jsr ($801e,x)
$09:fb09  12 2c		 ora ($2c)
$09:fb0b  81 e8		 sta ($e8,x)
$09:fb0d  2c 0f 21	  bit $210f
$09:fb10  bb			tyx
$09:fb11  a5 42		 lda $42
$09:fb13  a4 f7		 ldy $f7
$09:fb15  67 90		 adc [$90]
$09:fb17  5e 01 05	  lsr $0501,x
$09:fb1a  52 ed		 eor ($ed)
$09:fb1c  d7 e9		 cmp [$e9],y
$09:fb1e  a0 80		 ldy #$80
$09:fb20  16 18		 asl $18,x
$09:fb22  44 eb 41	  mvp $41,$eb
$09:fb25  76 53		 ror $53,x
$09:fb27  03 cc		 ora $cc,s
$09:fb29  29 6f		 and #$6f
$09:fb2b  80 3a		 bra $fb67
$09:fb2d  03 e1		 ora $e1,s
$09:fb2f  54 a1 78	  mvn $78,$a1
$09:fb32  a7 0e		 lda [$0e]
$09:fb34  47 06		 eor [$06]
$09:fb36  37 6c		 and [$6c],y
$09:fb38  25 40		 and $40
$09:fb3a  22 78 a0 bb   jsl $bba078
$09:fb3e  52 f0		 eor ($f0)
$09:fb40  95 95		 sta $95,x
$09:fb42  c0 3e		 cpy #$3e
$09:fb44  02 97		 cop #$97
$09:fb46  83 7c		 sta $7c,s
$09:fb48  0d d3 7f	  ora $7fd3
$09:fb4b  b7 90		 lda [$90],y
$09:fb4d  63 11		 adc $11,s
$09:fb4f  e8			inx
$09:fb50  ea			nop
$09:fb51  0a			asl a
$09:fb52  5d b7 10	  eor $10b7,x
$09:fb55  fc 19 06	  jsr ($0619,x)
$09:fb58  d9 3e 7b	  cmp $7b3e,y
$09:fb5b  ec 54 2b	  cpx $2b54
$09:fb5e  fa			plx
$09:fb5f  f5 0c		 sbc $0c,x
$09:fb61  6a			ror a
$09:fb62  70 55		 bvs $fbb9
$09:fb64  a9 ba		 lda #$ba
$09:fb66  c5 a3		 cmp $a3
$09:fb68  c7 1a		 cmp [$1a]
$09:fb6a  8c 19 06	  sty $0619
$09:fb6d  cb			wai
$09:fb6e  67 b4		 adc [$b4]
$09:fb70  56 8e		 lsr $8e,x
$09:fb72  d5 3e		 cmp $3e,x
$09:fb74  6b			rtl
$09:fb75  c1 7f		 cmp ($7f,x)
$09:fb77  02 6c		 cop #$6c
$09:fb79  9a			txs
$09:fb7a  53 88		 eor ($88,s),y
$09:fb7c  c7 ef		 cmp [$ef]
$09:fb7e  76 4e		 ror $4e,x
$09:fb80  20 60 1b	  jsr $1b60
$09:fb83  4a			lsr a
$09:fb84  f6 1b		 inc $1b,x
$09:fb86  9c 71 9c	  stz $9c71
$09:fb89  12 c1		 ora ($c1)
$09:fb8b  88			dey
$09:fb8c  56 be		 lsr $be,x
$09:fb8e  2b			pld
$09:fb8f  11 dc		 ora ($dc),y
$09:fb91  b3 a5		 lda ($a5,s),y
$09:fb93  82 18 ff	  brl $faae
$09:fb96  98			tya
$09:fb97  65 dd		 adc $dd
$09:fb99  f8			sed
$09:fb9a  7b			tdc
$09:fb9b  0d 8b 88	  ora $888b
$09:fb9e  76 5b		 ror $5b,x
$09:fba0  8c 72 58	  sty $5872
$09:fba3  30 54		 bmi $fbf9
$09:fba5  bc 44 2c	  ldy $2c44,x
$09:fba8  0a			asl a
$09:fba9  69 60		 adc #$60
$09:fbab  ba			tsx
$09:fbac  a5 c2		 lda $c2
$09:fbae  17 88		 ora [$88],y
$09:fbb0  a8			tay
$09:fbb1  52 87		 eor ($87)
$09:fbb3  20 05 25	  jsr $2505
$09:fbb6  48			pha
$09:fbb7  60			rts
$09:fbb8  ac 16 1b	  ldy $1b16
$09:fbbb  05 4a		 ora $4a
$09:fbbd  1a			inc a
$09:fbbe  5f 0b 0e 0c   eor $0c0e0b,x
$09:fbc2  0a			asl a
$09:fbc3  57 58		 eor [$58],y
$09:fbc5  5d 42 a3	  eor $a342,x
$09:fbc8  78			sei
$09:fbc9  a6 13		 ldx $13
$09:fbcb  42 19		 wdm #$19
$09:fbcd  50 b1		 bvc $fb80
$09:fbcf  e1 40		 sbc ($40,x)
$09:fbd1  a5 0a		 lda $0a
$09:fbd3  3f 85 8a b7   and $b78a85,x
$09:fbd7  54 a8 d8	  mvn $d8,$a8
$09:fbda  69 58		 adc #$58
$09:fbdc  4c 2b f8	  jmp $f82b
$09:fbdf  1e e2 0d	  asl $0de2,x
$09:fbe2  02 28		 cop #$28
$09:fbe4  54 4e e0	  mvn $e0,$4e
$09:fbe7  5d 04 b0	  eor $b004,x
$09:fbea  43 64		 eor $64,s
$09:fbec  00 70		 brk #$70
$09:fbee  86 8a		 stx $8a
$09:fbf0  80 ec		 bra $fbde
$09:fbf2  82 c1 7f	  brl $7bb6
$09:fbf5  06 eb		 asl $eb
$09:fbf7  c5 0a		 cmp $0a
$09:fbf9  3a			dec a
$09:fbfa  8d 8e c4	  sta $c48e
$09:fbfd  5d 01 c8	  eor $c801,x
$09:fc00  3f 08 0e 24   and $240e08,x
$09:fc04  b0 2e		 bcs $fc34
$09:fc06  81 b0		 sta ($b0,x)
$09:fc08  05 81		 ora $81
$09:fc0a  0a			asl a
$09:fc0b  19 86 30	  ora $3086,y
$09:fc0e  fe 16 ca	  inc $ca16,x
$09:fc11  00 34		 brk #$34
$09:fc13  15 61		 ora $61,x
$09:fc15  8c 5b 9e	  sty $9e5b
$09:fc18  37 7e		 and [$7e],y
$09:fc1a  8f 0c 5e 33   sta $335e0c
$09:fc1e  f1 8c		 sbc ($8c),y
$09:fc20  f2 2f		 sbc ($2f)
$09:fc22  43 6c		 eor $6c,s
$09:fc24  c8			iny
$09:fc25  3d bc 83	  and $83bc,x
$09:fc28  6b			rtl
$09:fc29  b6 df		 ldx $df,y
$09:fc2b  7e 98 e2	  ror $e298,x
$09:fc2e  ce 06 c3	  dec $c306
$09:fc31  ee bf 5b	  inc $5bbf
$09:fc34  b6 c4		 ldx $c4,y
$09:fc36  2a			rol a
$09:fc37  89 04		 bit #$04
$09:fc39  0f 43 86 7b   ora $7b8643
$09:fc3d  95 40		 sta $40,x
$09:fc3f  39 04 59	  and $5904,y
$09:fc42  2c c3 11	  bit $11c3
$09:fc45  ee fe fd	  inc $fdfe
$09:fc48  91 83		 sta ($83),y
$09:fc4a  0c 86 c2	  tsb $c286
$09:fc4d  b0 8f		 bcs $fbde
$09:fc4f  31 9b		 and ($9b),y
$09:fc51  8c c3 d8	  sty $d8c3
$09:fc54  14 04		 trb $04
$09:fc56  d0 fd		 bne $fc55
$09:fc58  06 62		 asl $62
$09:fc5a  39 05 58	  and $5805,y
$09:fc5d  85 01		 sta $01
$09:fc5f  56 2b		 lsr $2b,x
$09:fc61  50 41		 bvc $fca4
$09:fc63  01 0c		 ora ($0c,x)
$09:fc65  03 c5		 ora $c5,s
$09:fc67  e9 f5		 sbc #$f5
$09:fc69  3c 4c 6a	  bit $6a4c,x
$09:fc6c  37 61		 and [$61],y
$09:fc6e  09 a7		 ora #$a7
$09:fc70  03 ec		 ora $ec,s
$09:fc72  02 30		 cop #$30
$09:fc74  a0 20		 ldy #$20
$09:fc76  82 96 fe	  brl $fb0f
$09:fc79  00 48		 brk #$48
$09:fc7b  05 04		 ora $04
$09:fc7d  02 4a		 cop #$4a
$09:fc7f  a1 49		 lda ($49,x)
$09:fc81  85 48		 sta $48
$09:fc83  5a			phy
$09:fc84  01 41		 ora ($41,x)
$09:fc86  10 8c		 bpl $fc14
$09:fc88  30 3a		 bmi $fcc4
$09:fc8a  55 0a		 eor $0a,x
$09:fc8c  8d 87 06	  sta $0687
$09:fc8f  5f 0a 4d 24   eor $244d0a,x
$09:fc93  e6 1e		 inc $1e
$09:fc95  f1 60		 sbc ($60),y
$09:fc97  c3 21		 cmp $21,s
$09:fc99  6a			ror a
$09:fc9a  32 30		 and ($30)
$09:fc9c  05 46		 ora $46
$09:fc9e  a3 52		 lda $52,s
$09:fca0  5a			phy
$09:fca1  80 24		 bra $fcc7
$09:fca3  1f 02 f3 18   ora $18f302,x
$09:fca7  61 c0		 adc ($c0,x)
$09:fca9  2f 14 ea 91   and $91ea14
$09:fcad  ec 09 a5	  cpx $a509
$09:fcb0  8c 4f 8e	  sty $8e4f
$09:fcb3  21 00		 and ($00,x)
$09:fcb5  15 ba		 ora $ba,x
$09:fcb7  a5 8c		 lda $8c
$09:fcb9  b4 49		 ldy $49,x
$09:fcbb  e0 64		 cpx #$64
$09:fcbd  0e fb 16	  asl $16fb
$09:fcc0  a3 0a		 lda $0a,s
$09:fcc2  cd 67 0a	  cmp $0a67
$09:fcc5  f4 2c 4e	  pea $4e2c
$09:fcc8  fd d8 3b	  sbc $3bd8,x
$09:fccb  55 90		 eor $90,x
$09:fccd  27 c9		 and [$c9]
$09:fccf  3e 58 d7	  rol $d758,x
$09:fcd2  21 ed		 and ($ed,x)
$09:fcd4  55 e2		 eor $e2,x
$09:fcd6  d4 5d		 pei ($5d)
$09:fcd8  bb			tyx
$09:fcd9  3c 9b f4	  bit $f49b,x
$09:fcdc  35 08		 and $08,x
$09:fcde  57 d8		 eor [$d8],y
$09:fce0  22 2a 30 28   jsl $28302a
$09:fce4  88			dey
$09:fce5  7c be d6	  jmp ($d6be,x)
$09:fce8  db			stp
$09:fce9  4d ba 17	  eor $17ba
$09:fcec  ed 2f 81	  sbc $812f
$09:fcef  80 3f		 bra $fd30
$09:fcf1  b0 d8		 bcs $fccb
$09:fcf3  60			rts
$09:fcf4  c4 29		 cpy $29
$09:fcf6  76 db		 ror $db,x
$09:fcf8  47 a2		 eor [$a2]
$09:fcfa  d1 6e		 cmp ($6e),y
$09:fcfc  45 82		 eor $82
$09:fcfe  4c 4e 42	  jmp $424e
$09:fd01  40			rti
$09:fd02  1b			tcs
$09:fd03  47 cf		 eor [$cf]
$09:fd05  e1 f3		 sbc ($f3,x)
$09:fd07  b4 10		 ldy $10,x
$09:fd09  85 00		 sta $00
$09:fd0b  44 32 ba	  mvp $ba,$32
$09:fd0e  87 c2		 sta [$c2]
$09:fd10  d1 76		 cmp ($76),y
$09:fd12  c4 7b		 cpy $7b
$09:fd14  0f 61 84 c2   ora $c28461
$09:fd18  82 c3 ed	  brl $eade
$09:fd1b  f2 2c		 sbc ($2c)
$09:fd1d  85 d6		 sta $d6
$09:fd1f  d3 76		 cmp ($76,s),y
$09:fd21  86 bb		 stx $bb
$09:fd23  c0 fa		 cpy #$fa
$09:fd25  0f a1 02 02   ora $0202a1
$09:fd29  70 61		 bvs $fd8c
$09:fd2b  b0 a0		 bcs $fccd
$09:fd2d  e0 7b		 cpx #$7b
$09:fd2f  95 44		 sta $44,x
$09:fd31  fa			plx
$09:fd32  3f b8 6c 21   and $216cb8,x
$09:fd36  89 01		 bit #$01
$09:fd38  fa			plx
$09:fd39  3e 80 48	  rol $4880,x
$09:fd3c  10 df		 bpl $fd1d
$09:fd3e  b3 bc		 lda ($bc,s),y
$09:fd40  21 73		 and ($73,x)
$09:fd42  7f ae 33 ed   adc $ed33ae,x
$09:fd46  0c 28 8a	  tsb $8a28
$09:fd49  a4 61		 ldy $61
$09:fd4b  74 bc		 stz $bc,x
$09:fd4d  13 ec		 ora ($ec,s),y
$09:fd4f  7b			tdc
$09:fd50  9e 0c 50	  stz $500c,x
$09:fd53  28			plp
$09:fd54  0c 42 47	  tsb $4742
$09:fd57  22 c1 f8 ca   jsl $caf8c1
$09:fd5b  ae 24 1a	  ldx $1a24
$09:fd5e  5e 33 11	  lsr $1133,x
$09:fd61  8c 85 bc	  sty $bc85
$09:fd64  c0 38		 cpy #$38
$09:fd66  10 d6		 bpl $fd3e
$09:fd68  2a			rol a
$09:fd69  42 db		 wdm #$db
$09:fd6b  60			rts
$09:fd6c  c3 4c		 cmp $4c,s
$09:fd6e  6e fd a8	  ror $a8fd
$09:fd71  5b			tcd
$09:fd72  ec 53 45	  cpx $4553
$09:fd75  db			stp
$09:fd76  c7 ba		 cmp [$ba]
$09:fd78  c5 b8		 cmp $b8
$09:fd7a  31 82		 and ($82),y
$09:fd7c  0c fc 65	  tsb $65fc
$09:fd7f  05 d8		 ora $d8
$09:fd81  d0 21		 bne $fda4
$09:fd83  b0 c4		 bcs $fd49
$09:fd85  ee d9 ed	  inc $edd9
$09:fd88  0b			phd
$09:fd89  3e 00 70	  rol $7000,x
$09:fd8c  30 58		 bmi $fde6
$09:fd8e  fd ee c8	  sbc $c8ee,x
$09:fd91  0e 3b 3d	  asl $3d3b
$09:fd94  a3 28		 lda $28,s
$09:fd96  29 14		 and #$14
$09:fd98  9a			txs
$09:fd99  4e 0d 3a	  lsr $3a0d
$09:fd9c  05 b1		 ora $b1
$09:fd9e  1d 06 09	  ora $0906,x
$09:fda1  ea			nop
$09:fda2  55 0a		 eor $0a,x
$09:fda4  8d 46 c2	  sta $c246
$09:fda7  11 12		 ora ($12),y
$09:fda9  40			rti
$09:fdaa  c3 29		 cmp $29,s
$09:fdac  6f 52 c2 58   adc $58c252
$09:fdb0  84 00		 sty $00
$09:fdb2  21 01		 and ($01,x)
$09:fdb4  20 76 eb	  jsr $eb76
$09:fdb7  d8			cld
$09:fdb8  4c 43 d4	  jmp $d443
$09:fdbb  a9 78		 lda #$78
$09:fdbd  4a			lsr a
$09:fdbe  c8			iny
$09:fdbf  c0 6a		 cpy #$6a
$09:fdc1  47 f0		 eor [$f0]
$09:fdc3  aa			tax
$09:fdc4  e2 9e		 sep #$9e
$09:fdc6  86 77		 stx $77
$09:fdc8  1c 25 66	  trb $6625
$09:fdcb  b3 5a		 lda ($5a,s),y
$09:fdcd  c4 5d		 cpy $5d
$09:fdcf  6e fd ca	  ror $cafd
$09:fdd2  01 2c		 ora ($2c,x)
$09:fdd4  8a			txa
$09:fdd5  00 5f		 brk #$5f
$09:fdd7  32 c8		 and ($c8)
$09:fdd9  00 81		 brk #$81
$09:fddb  6c 0f 61	  jmp ($610f)
$09:fdde  c1 04		 cmp ($04,x)
$09:fde0  06 96		 asl $96
$09:fde2  85 0c		 sta $0c
$09:fde4  12 20		 ora ($20)
$09:fde6  31 2b		 and ($2b),y
$09:fde8  80 64		 bra $fe4e
$09:fdea  08			php
$09:fdeb  7c 6a 45	  jmp ($456a,x)
$09:fdee  00 3a		 brk #$3a
$09:fdf0  05 2d		 ora $2d
$09:fdf2  e8			inx
$09:fdf3  b8			clv
$09:fdf4  4b			phk
$09:fdf5  15 8c		 ora $8c,x
$09:fdf7  aa			tax
$09:fdf8  05 00		 ora $00
$09:fdfa  5a			phy
$09:fdfb  13 d8		 ora ($d8,s),y
$09:fdfd  ca			dex
$09:fdfe  21 85		 and ($85,x)
$09:fe00  c4 43		 cpy $43
$09:fe02  16 c8		 asl $c8,x
$09:fe04  c8			iny
$09:fe05  38			sec
$09:fe06  55 d4		 eor $d4,x
$09:fe08  ce 07 94	  dec $9407
$09:fe0b  67 a2		 adc [$a2]
$09:fe0d  58			cli
$09:fe0e  53 0a		 eor ($0a,s),y
$09:fe10  e1 45		 sbc ($45,x)
$09:fe12  38			sec
$09:fe13  aa			tax
$09:fe14  15 b1		 ora $b1,x
$09:fe16  ed e3 80	  sbc $80e3
$09:fe19  3b			tsc
$09:fe1a  fc 01 e1	  jsr ($e101,x)
$09:fe1d  1f 11 78 c7   ora $c77811,x
$09:fe21  10 61		 bpl $fe84
$09:fe23  59 50 85	  eor $8550,y
$09:fe26  2d 06 18	  and $1806
$09:fe29  32 40		 and ($40)
$09:fe2b  8f 91 26 30   sta $302691
$09:fe2f  ba			tsx
$09:fe30  5d 22 93	  eor $9322,x
$09:fe33  49 25		 eor #$25
$09:fe35  00 c4		 brk #$c4
$09:fe37  b0 65		 bcs $fe9e
$09:fe39  60			rts
$09:fe3a  25 8a		 and $8a
$09:fe3c  3c 2a 35	  bit $352a,x
$09:fe3f  1b			tcs
$09:fe40  0d 28 7c	  ora $7c28
$09:fe43  70 b9		 bvs $fdfe
$09:fe45  ba			tsx
$09:fe46  4c 69 78	  jmp $7869
$09:fe49  4a			lsr a
$09:fe4a  c9 e8		 cmp #$e8
$09:fe4c  2b			pld
$09:fe4d  44 e7 3b	  mvp $3b,$e7
$09:fe50  82 84 0c	  brl $0ad7
$09:fe53  40			rti
$09:fe54  5d 33 a0	  eor $a033,x
$09:fe57  99 02 1b	  sta $1b02,y
$09:fe5a  84 a4		 sty $a4
$09:fe5c  52 a9		 eor ($a9)
$09:fe5e  78			sei
$09:fe5f  8c 29 39	  sty $3929
$09:fe62  8e 83 84	  stx $8483
$09:fe65  51 11		 eor ($11),y
$09:fe67  3a			dec a
$09:fe68  16 46		 asl $46,x
$09:fe6a  ad 33 20	  lda $2033
$09:fe6d  42 fe		 wdm #$fe
$09:fe6f  b8			clv
$09:fe70  8c 46 0a	  sty $0a46
$09:fe73  c0 6c		 cpy #$6c
$09:fe75  06 30		 asl $30
$09:fe77  0f 8e 90 8b   ora $8b908e
$09:fe7b  16 40		 asl $40,x
$09:fe7d  1a			inc a
$09:fe7e  82 a5 82	  brl $8126
$09:fe81  26 9d		 rol $9d
$09:fe83  21 92		 and ($92,x)
$09:fe85  05 a0		 ora $a0
$09:fe87  6c 09 ac	  jmp ($ac09)
$09:fe8a  19 20 31	  ora $3120,y
$09:fe8d  f7 f7		 sbc [$f7],y
$09:fe8f  83 fc		 sta $fc,s
$09:fe91  41 e3		 eor ($e3,x)
$09:fe93  1f 21 79 4f   ora $4f7921,x
$09:fe97  cc 9e 75	  cpy $759e
$09:fe9a  f4 37 a5	  pea $a537
$09:fe9d  fd 51 eb	  sbc $eb51,x
$09:fea0  9f 65 7b 6f   sta $6f7b65,x
$09:fea4  dd 9e fd	  cmp $fd9e,x
$09:fea7  f0 5d		 beq $ff06
$09:fea9  e0 a9		 cpx #$a9
$09:feab  40			rti
$09:feac  bc a8 54	  ldy $54a8,x
$09:feaf  81 79		 sta ($79,x)
$09:feb1  58			cli
$09:feb2  c2 82		 rep #$82
$09:feb4  fc 9d e5	  jsr ($e59d,x)
$09:feb7  ff 38 7a 07   sbc $077a38,x
$09:febb  d2 5e		 cmp ($5e)
$09:febd  a3 f5		 lda $f5,s
$09:febf  a7 b1		 lda [$b1]
$09:fec1  7d ad ee	  adc $eead,x
$09:fec4  07 85		 ora [$85]
$09:fec6  e2 1e		 sep #$1e
$09:fec8  41 0d		 eor ($0d,x)
$09:feca  79 0b c8	  adc $c80b,y
$09:fecd  71 2e		 adc ($2e),y
$09:fecf  02 fa		 cop #$fa
$09:fed1  e2 1e		 sep #$1e
$09:fed3  24 f2		 bit $f2
$09:fed5  07 88		 ora [$88]
$09:fed7  bf 0c 0c 94   lda $940c0c,x
$09:fedb  b7 a1		 lda [$a1],y
$09:fedd  03 11		 ora $11,s
$09:fedf  ea			nop
$09:fee0  58			cli
$09:fee1  40			rti
$09:fee2  38			sec
$09:fee3  bd 40 18	  lda $1840,x
$09:fee6  af 55 05 40   lda $400555
$09:feea  5c 00 e6 fb   jml $fbe600
$09:feee  4a			lsr a
$09:feef  4e 0f 0a	  lsr $0a0f
$09:fef2  07 27		 ora [$27]
$09:fef4  a9 3f		 lda #$3f
$09:fef6  0e a3 52	  asl $52a3
$09:fef9  c4 60		 cpy $60
$09:fefb  f0 54		 beq $ff51
$09:fefd  a2 b1		 ldx #$b1
$09:feff  97 16		 sta [$16],y
$09:ff01  17 4b		 ora [$4b],y
$09:ff03  ac 56 80	  ldy $8056
$09:ff06  c6 fc		 dec $fc
$09:ff08  3b			tsc
$09:ff09  1d 6b ed	  ora $ed6b,x
$09:ff0c  88			dey
$09:ff0d  32 83		 and ($83)
$09:ff0f  c8			iny
$09:ff10  00 20		 brk #$20
$09:ff12  fb			xce
$09:ff13  4b			phk
$09:ff14  0a			asl a
$09:ff15  18			clc
$09:ff16  6a			ror a
$09:ff17  06 20		 asl $20
$09:ff19  7c 3a 04	  jmp ($043a,x)
$09:ff1c  02 e1		 cop #$e1
$09:ff1e  58			cli
$09:ff1f  29 89		 and #$89
$09:ff21  e5 92		 sbc $92
$09:ff23  c2 53		 rep #$53
$09:ff25  0c 18 1c	  tsb $1c18
$09:ff28  4f 4b 61 c1   eor $c1614b
$09:ff2c  ad 81 72	  lda $7281
$09:ff2f  28			plp
$09:ff30  82 c6 b8	  brl $b7f9
$09:ff33  0a			asl a
$09:ff34  b3 59		 lda ($59,s),y
$09:ff36  3b			tsc
$09:ff37  01 cc		 ora ($cc,x)
$09:ff39  16 c1		 asl $c1,x
$09:ff3b  77 7d		 adc [$7d],y
$09:ff3d  86 fd		 stx $fd
$09:ff3f  fa			plx
$09:ff40  4e 0f c2	  lsr $c20f
$09:ff43  58			cli
$09:ff44  aa			tax
$09:ff45  3f da 8d 8d   and $8d8dda,x
$09:ff49  e6 0f		 inc $0f
$09:ff4b  91 b1		 sta ($b1),y
$09:ff4d  b8			clv
$09:ff4e  7c 1d e1	  jmp ($e11d,x)
$09:ff51  ff 18 79 07   sbc $077918,x
$09:ff55  ca			dex
$09:ff56  5e 63 f3	  lsr $f363,x
$09:ff59  a7 a1		 lda [$a1]
$09:ff5b  7d 2d ea	  adc $ea2d,x
$09:ff5e  7f 5c 7b 27   adc $277b5c,x
$09:ff62  db			stp
$09:ff63  5e eb f7	  lsr $f7eb,x
$09:ff66  e7 83		 sbc [$83]
$09:ff68  7c 3d e2	  jmp ($e23d,x)
$09:ff6b  ff 20 79 47   sbc $477920,x
$09:ff6f  cc 5e 73	  cpy $735e
$09:ff72  f4 27 a5	  pea $a527
$09:ff75  7d 4d eb	  adc $eb4d,x
$09:ff78  7f 64 7b 67   adc $677b64,x
$09:ff7c  db			stp
$09:ff7d  c5 e4		 cmp $e4
$09:ff7f  77 86		 adc [$86],y
$09:ff81  22 15 0b c4   jsl $c40b15
$09:ff85  3b			tsc
$09:ff86  c1 bc		 cmp ($bc,x)
$09:ff88  bb			tyx
$09:ff89  6d b6 fb	  adc $fbb6
$09:ff8c  15 0b		 ora $0b,x
$09:ff8e  86 62		 stx $62
$09:ff90  77 fb		 adc [$fb],y
$09:ff92  66 f2		 ror $f2
$09:ff94  c8			iny
$09:ff95  24 1b		 bit $1b
$09:ff97  ab			plb
$09:ff98  8c 37 11	  sty $1137
$09:ff9b  89 dd		 bit #$dd
$09:ff9d  c8			iny
$09:ff9e  1b			tcs
$09:ff9f  cb			wai
$09:ffa0  b2 d9		 lda ($d9)
$09:ffa2  6e 31 d8	  ror $d831
$09:ffa5  88			dey
$09:ffa6  5e 3f 79	  lsr $793f,x
$09:ffa9  b4 6f		 ldy $6f,x
$09:ffab  2c 37 b9	  bit $b937
$09:ffae  40			rti
$09:ffaf  c4 62		 cpy $62
$09:ffb1  21 b0		 and ($b0,x)
$09:ffb3  ac 7e f5	  ldy $f57e
$09:ffb6  bd e4 8f	  lda $8fe4,x
$09:ffb9  2c f9 ab	  bit $abf9
$09:ffbc  cf 7e 8c f4   cmp $f48c7e
$09:ffc0  ef ab bd 7f   sbc $7fbdab
$09:ffc4  ed 0f 70	  sbc $700f
$09:ffc7  fb			xce
$09:ffc8  cb			wai
$09:ffc9  c0 7e 14	  cpy #$147e
$09:ffcc  f1 2f		 sbc ($2f),y
$09:ffce  8d bc 8f	  sta $8fbc
$09:ffd1  e5 8f		 sbc $8f
$09:ffd3  34 f9		 bit $f9,x
$09:ffd5  eb			xba
$09:ffd6  d1 7e		 cmp ($7e),y
$09:ffd8  9c f5 6f	  stz $6ff5
$09:ffdb  af bd 9f ee   lda $ee9fbd
$09:ffdf  0c 00 00	  tsb $0000
$09:ffe2  00 00		 brk #$00
$09:ffe4  33 7f		 and ($7f,s),y
$09:ffe6  ff 7f 4a 29   sbc $294a7f,x
$09:ffea  00 00		 brk #$00
$09:ffec  df 22 df 73   cmp $73df22,x
$09:fff0  4a			lsr a
$09:fff1  29 00		 and #$00
$09:fff3  00 e0		 brk #$e0
$09:fff5  78			sei
$09:fff6  1c 00 4a	  trb $4a00
$09:fff9  29 00		 and #$00
$09:fffb  00 e0		 brk #$e0
$09:fffd  78			sei
$09:fffe  1c 00 34	  trb $3400
