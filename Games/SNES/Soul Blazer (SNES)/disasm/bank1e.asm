; Soul Blazer (SNES) - Bank $1e
; Disassembled from ROM
; File offset: $0f0000-$0f7fff
; CPU address: $1e:$8000-$1e:$ffff
;===========================================================

.bank $1e
.org $8000

$1e:8000  02 04		 cop #$04
$1e:8002  00 08		 brk #$08
$1e:8004  f4 3b fc	  pea $fc3b
$1e:8007  01 e1		 ora ($e1,x)
$1e:8009  1f 0f 54 a8   ora $a8540f,x
$1e:800d  5e 14 91	  lsr $9114,x
$1e:8010  78			sei
$1e:8011  8c 62 37	  sty $3762
$1e:8014  36 a1		 rol $a1,x
$1e:8016  4d a6 d7	  eor $d7a6
$1e:8019  a2 08		 ldx #$08
$1e:801b  de 48 60	  dec $6048,x
$1e:801e  42 08		 wdm #$08
$1e:8020  e4 aa		 cpx $aa
$1e:8022  47 3e		 eor [$3e]
$1e:8024  a5 4f		 lda $4f
$1e:8026  a7 d8		 lda [$d8]
$1e:8028  2c 1d 2b	  bit $2b1d
$1e:802b  01 81		 ora ($81,x)
$1e:802d  29 81 48	  and #$4881
$1e:8030  24 92		 bit $92
$1e:8032  a9 7c 40	  lda #$407c
$1e:8035  c2 11		 rep #$11
$1e:8037  1c 56 2e	  trb $2e56
$1e:803a  21 88		 and ($88,x)
$1e:803c  c4 98		 cpy $98
$1e:803e  4a			lsr a
$1e:803f  5b			tcd
$1e:8040  4b			phk
$1e:8041  a1 c6		 lda ($c6,x)
$1e:8043  0e 21 19	  asl $1921
$1e:8046  c9 64 e6	  cmp #$e664
$1e:8049  59 0c 89	  eor $890c,y
$1e:804c  c4 a7		 cpy $a7
$1e:804e  65 f1		 adc $f1
$1e:8050  fe 98 ca	  inc $ca98,x
$1e:8053  d0 68		 bne $80bd
$1e:8055  2f e9 b6 2e   and $2eb6e9
$1e:8059  07 87		 ora [$87]
$1e:805b  76 0c		 ror $0c,x
$1e:805d  87 35		 sta [$35]
$1e:805f  9b			txy
$1e:8060  b6 e6		 ldx $e6,y
$1e:8062  33 2a		 and ($2a,s),y
$1e:8064  12 96		 ora ($96)
$1e:8066  ca			dex
$1e:8067  a5 72		 lda $72
$1e:8069  69 d4 9a	  adc #$9ad4
$1e:806c  4d a2 d1	  eor $d1a2
$1e:806f  da			phx
$1e:8070  f4 1a 15	  pea $151a
$1e:8073  98			tya
$1e:8074  2c 82 58	  bit $5882
$1e:8077  2f 1a 58 bc   and $bc581a
$1e:807b  65 f7		 adc $f7
$1e:807d  35 70		 and $70,x
$1e:807f  30 0c		 bmi $808d
$1e:8081  52 b2		 eor ($b2)
$1e:8083  ff ea b8 05   sbc $05b8ea,x
$1e:8087  55 2f		 eor $2f,x
$1e:8089  b5 32		 lda $32,x
$1e:808b  08			php
$1e:808c  64 21		 stz $21
$1e:808e  ef 78 84 68   sbc $688478
$1e:8092  04 11		 tsb $11
$1e:8094  20 22 80	  jsr $8022
$1e:8097  81 fe		 sta ($fe,x)
$1e:8099  50 38		 bvc $80d3
$1e:809b  b5 00		 lda $00,x
$1e:809d  28			plp
$1e:809e  b0 40		 bcs $80e0
$1e:80a0  71 c2		 adc ($c2),y
$1e:80a2  e3 d4		 sbc $d4,s
$1e:80a4  81 22		 sta ($22,x)
$1e:80a6  c3 23		 cmp $23,s
$1e:80a8  4d 91 8d	  eor $8d91
$1e:80ab  43 e1		 eor $e1,s
$1e:80ad  30 8b		 bmi $803a
$1e:80af  1d 42 a3	  ora $a342,x
$1e:80b2  50 ad		 bvc $8061
$1e:80b4  d8			cld
$1e:80b5  aa			tax
$1e:80b6  70 d1		 bvs $8089
$1e:80b8  71 44		 adc ($44),y
$1e:80ba  a8			tay
$1e:80bb  30 88		 bmi $8045
$1e:80bd  4d 62 0b	  eor $0b62
$1e:80c0  06 83		 asl $83
$1e:80c2  41 fe		 eor ($fe,x)
$1e:80c4  f0 58		 beq $811e
$1e:80c6  a0 b9 ac	  ldy #$acb9
$1e:80c9  03 d0		 ora $d0,s
$1e:80cb  19 07 bc	  ora $bc07,y
$1e:80ce  ae 23 f6	  ldx $f623
$1e:80d1  2b			pld
$1e:80d2  8c 4e 0c	  sty $0c4e
$1e:80d5  4d 08 d5	  eor $d508
$1e:80d8  2c a1 07	  bit $07a1
$1e:80db  83 1f		 sta $1f,s
$1e:80dd  b4 56		 ldy $56,x
$1e:80df  2c 88 20	  bit $2088
$1e:80e2  e8			inx
$1e:80e3  1b			tcs
$1e:80e4  d6 c3		 dec $c3,x
$1e:80e6  1d 8f 26	  ora $268f,x
$1e:80e9  08			php
$1e:80ea  5a			phy
$1e:80eb  64 22		 stz $22
$1e:80ed  52 21		 eor ($21)
$1e:80ef  98			tya
$1e:80f0  45 ea		 eor $ea
$1e:80f2  a5 4b		 lda $4b
$1e:80f4  04 e6		 tsb $e6
$1e:80f6  24 3f		 bit $3f
$1e:80f8  31 b8		 and ($b8),y
$1e:80fa  b1 46		 lda ($46),y
$1e:80fc  b4 65		 ldy $65,x
$1e:80fe  27 f9		 and [$f9]
$1e:8100  1a			inc a
$1e:8101  82 70 d4	  brl $5574
$1e:8104  12 48		 ora ($48)
$1e:8106  2e d4 04	  rol $04d4
$1e:8109  a3 21		 lda $21,s
$1e:810b  56 14		 lsr $14,x
$1e:810d  6e 6d 42	  ror $426d
$1e:8110  9b			txy
$1e:8111  4d af 53	  eor $53af
$1e:8114  7b			tdc
$1e:8115  94 d6		 sty $d6,x
$1e:8117  f2 f3		 sbc ($f3)
$1e:8119  07 90		 ora [$90]
$1e:811b  47 25		 eor [$25]
$1e:811d  52 39		 eor ($39)
$1e:811f  f5 2a		 sbc $2a,x
$1e:8121  7d 3e c1	  adc $c13e,x
$1e:8124  5e ee 97	  lsr $97ee,x
$1e:8127  8c 08 0c	  sty $0c08
$1e:812a  00 41		 brk #$41
$1e:812c  24 95		 bit $95
$1e:812e  4b			phk
$1e:812f  e2 01		 sep #$01
$1e:8131  10 88		 bpl $80bb
$1e:8133  e2 b1		 sep #$b1
$1e:8135  76 9c		 ror $9c,x
$1e:8137  46 24		 lsr $24
$1e:8139  22 52 da 5d   jsl $5dda52
$1e:813d  0e 30 21	  asl $2130
$1e:8140  08			php
$1e:8141  ce 4b 27	  dec $274b
$1e:8144  71 c8		 adc ($c8),y
$1e:8146  64 44		 stz $44
$1e:8148  25 3b		 and $3b
$1e:814a  07 8f		 ora [$8f]
$1e:814c  f4 26 53	  pea $5326
$1e:814f  20 c1 7f	  jsr $7fc1
$1e:8152  43 b1		 eor $b1,s
$1e:8154  69 14		 adc #$14
$1e:8156  3c 80 a2	  bit $a280,x
$1e:8159  12 1c		 ora ($1c)
$1e:815b  d6 6e		 dec $6e,x
$1e:815d  eb			xba
$1e:815e  98			tya
$1e:815f  cc 94 4a	  cpy $4a94
$1e:8162  5b			tcd
$1e:8163  2a			rol a
$1e:8164  95 c9		 sta $c9,x
$1e:8166  a7 52		 lda [$52]
$1e:8168  69 36		 adc #$36
$1e:816a  8b			phb
$1e:816b  47 6c		 eor [$6c]
$1e:816d  d0 68		 bne $81d7
$1e:816f  4c 60 62	  jmp $6260
$1e:8172  09 64		 ora #$64
$1e:8174  a8			tay
$1e:8175  de 14 b3	  dec $b314,x
$1e:8178  78			sei
$1e:8179  cb			wai
$1e:817a  ed 45 e0	  sbc $e045
$1e:817d  38			sec
$1e:817e  1b			tcs
$1e:817f  3c 59 e3	  bit $e359,x
$1e:8182  65 b3		 adc $b3
$1e:8184  57 2c		 eor [$2c],y
$1e:8186  d6 77		 dec $77,x
$1e:8188  21 9f		 and ($9f,x)
$1e:818a  d1 d2		 cmp ($d2),y
$1e:818c  16 c8		 asl $c8,x
$1e:818e  ac 5a 2d	  ldy $2d5a
$1e:8191  40			rti
$1e:8192  4d 0a 3d	  eor $3d0a
$1e:8195  ac 31 d8	  ldy $d831
$1e:8198  f4 7a 90	  pea $907a
$1e:819b  aa			tax
$1e:819c  13 fa		 ora ($fa,s),y
$1e:819e  44 a8 30	  mvp $30,$a8
$1e:81a1  88			dey
$1e:81a2  4a			lsr a
$1e:81a3  dd 11 ed	  cmp $ed11,x
$1e:81a6  51 a8		 eor ($a8),y
$1e:81a8  31 d1		 and ($d1),y
$1e:81aa  1e b1 38	  asl $38b1,x
$1e:81ad  34 1a		 bit $1a,x
$1e:81af  70 d8		 bvs $8189
$1e:81b1  34 7a		 bit $7a,x
$1e:81b3  b9 45 16	  lda $1645,y
$1e:81b6  48			pha
$1e:81b7  b0 3f		 bcs $81f8
$1e:81b9  2a			rol a
$1e:81ba  48			pha
$1e:81bb  e1 16		 sbc ($16,x)
$1e:81bd  09 cc		 ora #$cc
$1e:81bf  49 df		 eor #$df
$1e:81c1  50 9a		 bvc $815d
$1e:81c3  c4 35		 cpy $35
$1e:81c5  dc 2e 67	  jml [$672e]
$1e:81c8  7d 1d 2d	  adc $2d1d,x
$1e:81cb  28			plp
$1e:81cc  10 34		 bpl $8202
$1e:81ce  d1 a6		 cmp ($a6),y
$1e:81d0  c2 2e		 rep #$2e
$1e:81d2  0b			phd
$1e:81d3  58			cli
$1e:81d4  5a			phy
$1e:81d5  a8			tay
$1e:81d6  d5 61		 cmp $61,x
$1e:81d8  1f 0d a8 28   ora $28a80d,x
$1e:81dc  16 ec		 asl $ec,x
$1e:81de  0c 35 ac	  tsb $ac35
$1e:81e1  3e d0 83	  rol $83d0,x
$1e:81e4  e5 2b		 sbc $2b
$1e:81e6  0c 01 85	  tsb $8501
$1e:81e9  7f a6 94 14   adc $1494a6,x
$1e:81ed  00 a4		 brk #$a4
$1e:81ef  0a			asl a
$1e:81f0  74 38		 stz $38,x
$1e:81f2  01 c8		 ora ($c8,x)
$1e:81f4  18			clc
$1e:81f5  e8			inx
$1e:81f6  a6 e5		 ldx $e5
$1e:81f8  85 a8		 sta $a8
$1e:81fa  d4 17		 pei ($17)
$1e:81fc  f3 52		 sbc ($52,s),y
$1e:81fe  06 84		 asl $84
$1e:8200  e2 0c		 sep #$0c
$1e:8202  cf a8 a0 4d   cmp $4da0a8
$1e:8206  5b			tcd
$1e:8207  ec 11 09	  cpx $0911
$1e:820a  b3 bc		 lda ($bc,s),y
$1e:820c  28			plp
$1e:820d  4e f0 80	  lsr $80f0
$1e:8210  3d 5e 7c	  and $7c5e,x
$1e:8213  ff 0a 53 fc   sbc $fc530a,x
$1e:8217  1e b1 10	  asl $10b1,x
$1e:821a  07 9b		 ora [$9b]
$1e:821c  d6 23		 dec $23,x
$1e:821e  01 f0		 ora ($f0,x)
$1e:8220  99 07 c0	  sta $c007,y
$1e:8223  0b			phd
$1e:8224  76 80		 ror $80,x
$1e:8226  9e dc 04	  stz $04dc,x
$1e:8229  75 20		 adc $20,x
$1e:822b  90 69		 bcc $8296
$1e:822d  2d a4 f0	  and $f0a4
$1e:8230  7a			ply
$1e:8231  c4 9a		 cpy $9a
$1e:8233  4d 27 b5	  eor $b527
$1e:8236  c9 64 cf	  cmp #$cf64
$1e:8239  58			cli
$1e:823a  95 4a		 sta $4a,x
$1e:823c  a5 f7		 lda $f7
$1e:823e  39 6c a9	  and $a96c,y
$1e:8241  eb			xba
$1e:8242  1e 83 80	  asl $8083,x
$1e:8245  7f ce 74 6f   adc $6f74ce,x
$1e:8249  1b			tcs
$1e:824a  51 ce		 eor ($ce),y
$1e:824c  9d e1 37	  sta $37e1,x
$1e:824f  b9 4d 5e	  lda $5e4d,y
$1e:8252  97 3f		 sta [$3f],y
$1e:8254  ba			tsx
$1e:8255  4f 40 99 69   eor $699940
$1e:8259  09 ed c4	  ora #$c4ed
$1e:825c  47 b3		 eor [$b3]
$1e:825e  20 9d 3b	  jsr $3b9d
$1e:8261  bd ff e1	  lda $e1ff,x
$1e:8264  0f 10 f8 cb   ora $cbf810
$1e:8268  c8			iny
$1e:8269  7e 54 f3	  ror $f354,x
$1e:826c  2f 9d bd 0f   and $0fbd9d
$1e:8270  e9 8f 54	  sbc #$548f
$1e:8273  fa			plx
$1e:8274  eb			xba
$1e:8275  d9 7e dc	  cmp $dc7e,y
$1e:8278  f8			sed
$1e:8279  04 61		 tsb $61
$1e:827b  de 16 97	  dec $9716,x
$1e:827e  78			sei
$1e:827f  37 a2		 and [$a2],y
$1e:8281  41 20		 eor ($20,x)
$1e:8283  d2 5d		 cmp ($5d)
$1e:8285  5f e0 de 89   eor $89dee0,x
$1e:8289  34 9a		 bit $9a,x
$1e:828b  4f 6c 92 c9   eor $c9926c
$1e:828f  9b			txy
$1e:8290  de 25 f1	  dec $f125,x
$1e:8293  b7 91		 lda [$91],y
$1e:8295  fc b1 e6	  jsr ($e6b1,x)
$1e:8298  9f 3d 7a 2f   sta $2f7a3d,x
$1e:829c  d3 9e		 cmp ($9e,s),y
$1e:829e  ad f5 f7	  lda $f7f5
$1e:82a1  b3 fd		 lda ($fd,s),y
$1e:82a3  c1 ef		 cmp ($ef,x)
$1e:82a5  1f 01 78 4f   ora $4f7801,x
$1e:82a9  c4 9e		 cpy $9e
$1e:82ab  35 f2		 and $f2,x
$1e:82ad  37 95		 and [$95],y
$1e:82af  fc d1 e7	  jsr ($e7d1,x)
$1e:82b2  9f 45 7a 6f   sta $6f7a45,x
$1e:82b6  d5 9e		 cmp $9e,x
$1e:82b8  bd f6 77	  lda $77f6,x
$1e:82bb  b7 f4		 lda [$f4],y
$1e:82bd  01 05		 ora ($05,x)
$1e:82bf  00 05		 brk #$05
$1e:82c1  80 3b		 bra $82fe
$1e:82c3  d3 59		 cmp ($59,s),y
$1e:82c5  ad 77 ab	  lda $ab77
$1e:82c8  bf c0 1e 11   lda $111ec0,x
$1e:82cc  f1 17		 sbc ($17),y
$1e:82ce  8c fc 7e	  sty $7efc
$1e:82d1  18			clc
$1e:82d2  2c 28 e2	  bit $e228
$1e:82d5  ed 58 6c	  sbc $6c58
$1e:82d8  3d b4 b7	  and $b7b4,x
$1e:82db  36 bb		 rol $bb,x
$1e:82dd  de 3b 1f	  dec $1f3b,x
$1e:82e0  7c b6 1a	  jmp ($1ab6,x)
$1e:82e3  16 d1		 asl $d1,x
$1e:82e5  69 b9 6b	  adc #$6bb9
$1e:82e8  b5 e8		 lda $e8,x
$1e:82ea  42 ba		 wdm #$ba
$1e:82ec  db			stp
$1e:82ed  ad e7 e2	  lda $e2e7
$1e:82f0  c0 5c		 cpy #$5c
$1e:82f2  6f 50 64 a1   adc $a16450
$1e:82f6  df 6e d8 14   cmp $14d86e,x
$1e:82fa  60			rts
$1e:82fb  24 0a		 bit $0a
$1e:82fd  0a			asl a
$1e:82fe  a3 0c		 lda $0c,s
$1e:8300  ee 75 46	  inc $4675
$1e:8303  29 a2 b8	  and #$b8a2
$1e:8306  28			plp
$1e:8307  4b			phk
$1e:8308  60			rts
$1e:8309  a5 25		 lda $25
$1e:830b  a0 2a		 ldy #$2a
$1e:830d  86 ef		 stx $ef
$1e:830f  78			sei
$1e:8310  bc a8 c6	  ldy $c6a8,x
$1e:8313  0c c3 06	  tsb $06c3
$1e:8316  20 a8 c6	  jsr $c6a8
$1e:8319  fd 7f 8c	  sbc $8c7f,x
$1e:831c  57 68		 eor [$68],y
$1e:831e  b4 1a		 ldy $1a,x
$1e:8320  95 76		 sta $76,x
$1e:8322  9b			txy
$1e:8323  5d 68 2c	  eor $2c68,x
$1e:8326  7e 31 02	  ror $0231,x
$1e:8329  81 52		 sta ($52,x)
$1e:832b  aa			tax
$1e:832c  4e 00 72	  lsr $7200
$1e:832f  0b			phd
$1e:8330  88			dey
$1e:8331  db			stp
$1e:8332  c1 43		 cmp ($43,x)
$1e:8334  80 bc		 bra $82f2
$1e:8336  62 85 43	  per $c6be
$1e:8339  6f 03 c4 ea   adc $eac403
$1e:833d  e0 51		 cpx #$51
$1e:833f  78			sei
$1e:8340  9b			txy
$1e:8341  f8			sed
$1e:8342  73 b9		 adc ($b9,s),y
$1e:8344  d0 18		 bne $835e
$1e:8346  e4 b2		 cpx $b2
$1e:8348  40			rti
$1e:8349  81 08		 sta ($08,x)
$1e:834b  8b			phb
$1e:834c  b8			clv
$1e:834d  42 34		 wdm #$34
$1e:834f  fd 20 89	  sbc $8920,x
$1e:8352  81 8c		 sta ($8c,x)
$1e:8354  36 6f		 rol $6f,x
$1e:8356  19 78 87	  ora $8778,y
$1e:8359  f6 3f		 inc $3f,x
$1e:835b  48			pha
$1e:835c  a4 d2		 ldy $d2
$1e:835e  6a			ror a
$1e:835f  b0 8a		 bcs $82eb
$1e:8361  b1 40		 lda ($40),y
$1e:8363  0a			asl a
$1e:8364  03 3c		 ora $3c,s
$1e:8366  2a			rol a
$1e:8367  0d 32 a1	  ora $a132
$1e:836a  51 a2		 eor ($a2),y
$1e:836c  d7 61		 cmp [$61],y
$1e:836e  2d 60 6a	  and $6a60
$1e:8371  83 54		 sta $54,s
$1e:8373  27 8d		 and [$8d]
$1e:8375  00 a9		 brk #$a9
$1e:8377  d5 2b		 cmp $2b,x
$1e:8379  15 98		 ora $98,x
$1e:837b  26 2a		 rol $2a
$1e:837d  08			php
$1e:837e  73 0a		 adc ($0a,s),y
$1e:8380  f5 7e		 sbc $7e,x
$1e:8382  09 12 39	  ora #$3912
$1e:8385  8d 6e b8	  sta $b86e
$1e:8388  6f 08 ac 1e   adc $1eac08
$1e:838c  06 81		 asl $81
$1e:838e  0b			phd
$1e:838f  35 9e		 and $9e,x
$1e:8391  06 88		 asl $88
$1e:8393  23 e9		 and $e9,s
$1e:8395  22 02 1b 17   jsl $171b02
$1e:8399  8b			phb
$1e:839a  e2 e0		 sep #$e0
$1e:839c  f1 78		 sbc ($78),y
$1e:839e  7c 4a 27	  jmp ($274a,x)
$1e:83a1  07 46		 ora [$46]
$1e:83a3  a4 3a		 ldy $3a
$1e:83a5  c1 61		 cmp ($61,x)
$1e:83a7  b1 58		 lda ($58),y
$1e:83a9  e9 36		 sbc #$36
$1e:83ab  44 53 c3	  mvp $c3,$53
$1e:83ae  9f e7 1f 89   sta $891fe7,x
$1e:83b2  22 d2 28 a2   jsl $a228d2
$1e:83b6  0d 34 07	  ora $0734
$1e:83b9  11 89		 ora ($89),y
$1e:83bb  80 e9		 bra $83a6
$1e:83bd  e0 70		 cpx #$70
$1e:83bf  c8			iny
$1e:83c0  a2 b5		 ldx #$b5
$1e:83c2  f2 19		 sbc ($19)
$1e:83c4  10 68		 bpl $842e
$1e:83c6  2a			rol a
$1e:83c7  a1 88		 lda ($88,x)
$1e:83c9  19 8c cc	  ora $cc8c,y
$1e:83cc  05 92		 ora $92
$1e:83ce  0a			asl a
$1e:83cf  b7 a0		 lda [$a0],y
$1e:83d1  40			rti
$1e:83d2  5e a3 44	  lsr $44a3,x
$1e:83d5  45 34		 eor $34
$1e:83d7  4e 1d 48	  lsr $481d
$1e:83da  aa			tax
$1e:83db  bd 42 ad	  lda $ad42,x
$1e:83de  4c 45 2c	  jmp $2c45
$1e:83e1  4a			lsr a
$1e:83e2  15 0e		 ora $0e,x
$1e:83e4  99 c9 64	  sta $64c9,y
$1e:83e7  96 59		 stx $59,y
$1e:83e9  24 d2		 bit $d2
$1e:83eb  07 0a		 ora [$0a]
$1e:83ed  46 0d		 lsr $0d
$1e:83ef  82 92 a5	  brl $2984
$1e:83f2  22 88 59 4a   jsl $4a5988
$1e:83f6  80 a5		 bra $839d
$1e:83f8  35 a1		 and $a1,x
$1e:83fa  40			rti
$1e:83fb  a0 51		 ldy #$51
$1e:83fd  d8			cld
$1e:83fe  f0 cc		 beq $83cc
$1e:8400  20 4f 52	  jsr $524f
$1e:8403  8f ad 06 af   sta $af06ad
$1e:8407  57 80		 eor [$80],y
$1e:8409  8d 41 ea	  sta $ea41
$1e:840c  24 21		 bit $21
$1e:840e  1e 95 5f	  asl $5f95,x
$1e:8411  25 92		 and $92
$1e:8413  ab			plb
$1e:8414  91 46		 sta ($46),y
$1e:8416  20 51 21	  jsr $2151
$1e:8419  e8			inx
$1e:841a  c4 4a		 cpy $4a
$1e:841c  2a			rol a
$1e:841d  50 31		 bvc $8450
$1e:841f  ea			nop
$1e:8420  c7 71		 cmp [$71]
$1e:8422  84 67		 sty $67
$1e:8424  7a			ply
$1e:8425  19 d1 1e	  ora $1ed1,y
$1e:8428  a7 48		 lda [$48]
$1e:842a  12 0c		 ora ($0c)
$1e:842c  f0 50		 beq $847e
$1e:842e  09 51		 ora #$51
$1e:8430  aa			tax
$1e:8431  c2 12		 rep #$12
$1e:8433  83 4c		 sta $4c,s
$1e:8435  a8			tay
$1e:8436  54 68 b5	  mvn $b5,$68
$1e:8439  d9 e5 76	  cmp $76e5,y
$1e:843c  bb			tyx
$1e:843d  4d 52 8c	  eor $8c52
$1e:8440  26 bb		 rol $bb
$1e:8442  45 a9		 eor $a9
$1e:8444  d5 1f		 cmp $1f,x
$1e:8446  e1 04		 sbc ($04,x)
$1e:8448  58			cli
$1e:8449  84 49		 sty $49
$1e:844b  62 2b 53	  per $d779
$1e:844e  76 9c		 ror $9c,x
$1e:8450  4a			lsr a
$1e:8451  1b			tcs
$1e:8452  17 62		 ora [$62],y
$1e:8454  14 3c		 trb $3c
$1e:8456  14 b1		 trb $b1
$1e:8458  47 90		 eor [$90]
$1e:845a  58			cli
$1e:845b  05 47		 ora $47
$1e:845d  03 86		 ora $86,s
$1e:845f  45 1f		 eor $1f
$1e:8461  a6 d2		 ldx $d2
$1e:8463  0d 44 05	  ora $0544
$1e:8466  ca			dex
$1e:8467  3a			dec a
$1e:8468  96 52		 stx $52,y
$1e:846a  b8			clv
$1e:846b  47 55		 eor [$55]
$1e:846d  01 c4		 ora ($c4,x)
$1e:846f  62 60 3a	  per $bed2
$1e:8472  b8			clv
$1e:8473  1c 4d d8	  trb $d84d
$1e:8476  da			phx
$1e:8477  68			pla
$1e:8478  0e 43 23	  asl $2343
$1e:847b  01 d3		 ora ($d3,x)
$1e:847d  86 c1		 stx $c1
$1e:847f  98			tya
$1e:8480  6f b0 87 1f   adc $1f87b0
$1e:8484  c3 31		 cmp $31,s
$1e:8486  99 80 d1	  sta $d180,y
$1e:8489  20 ee b7	  jsr $b7ee
$1e:848c  a4 55		 ldy $55
$1e:848e  5c a1 56 a6   jml $a656a1
$1e:8492  06 96		 asl $96
$1e:8494  19 fb 87	  ora $87fb,y
$1e:8497  4c e4 b2	  jmp $b2e4
$1e:849a  4b			phk
$1e:849b  2c 92 68	  bit $6892
$1e:849e  ca			dex
$1e:849f  68			pla
$1e:84a0  54 2c 68	  mvn $68,$2c
$1e:84a3  ad b4 8a	  lda $8ab4
$1e:84a6  e3 60		 sbc $60,s
$1e:84a8  eb			xba
$1e:84a9  54 75 39	  mvn $39,$75
$1e:84ac  84 e2		 sty $e2
$1e:84ae  46 12		 lsr $12
$1e:84b0  5e 85 81	  lsr $8185,x
$1e:84b3  20 0d 52	  jsr $520d
$1e:84b6  4a			lsr a
$1e:84b7  89 c8		 bit #$c8
$1e:84b9  ec 91 88	  cpx $8891
$1e:84bc  12 02		 ora ($02)
$1e:84be  e3 f1		 sbc $f1,s
$1e:84c0  8a			txa
$1e:84c1  1c 05 22	  trb $2205
$1e:84c4  39 ac de	  and $deac,y
$1e:84c7  71 22		 adc ($22),y
$1e:84c9  54 2a 1a	  mvn $1a,$2a
$1e:84cc  38			sec
$1e:84cd  12 21		 ora ($21)
$1e:84cf  10 48		 bpl $8519
$1e:84d1  86 53		 stx $53
$1e:84d3  2d 97 c9	  and $c997
$1e:84d6  a4 4a		 ldy $4a
$1e:84d8  02 9e		 cop #$9e
$1e:84da  24 88		 bit $88
$1e:84dc  e5 54		 sbc $54
$1e:84de  c1 9d		 cmp ($9d,x)
$1e:84e0  54 fa 84	  mvn $84,$fa
$1e:84e3  95 cd		 sta $cd,x
$1e:84e5  9e cf ae	  stz $aecf,x
$1e:84e8  2d 00 4b	  and $4b00
$1e:84eb  94 90		 sty $90,x
$1e:84ed  48			pha
$1e:84ee  52 23		 eor ($23)
$1e:84f0  a3 48		 lda $48,s
$1e:84f2  96 94		 stx $94,y
$1e:84f4  4c 10 19	  jmp $1910
$1e:84f7  34 9e		 bit $9e,x
$1e:84f9  51 29		 eor ($29),y
$1e:84fb  7d 0e 91	  adc $910e,x
$1e:84fe  f4 30 1a	  pea $1a30
$1e:8501  5d 2c 4c	  eor $4c2c,x
$1e:8504  12 e9		 ora ($e9)
$1e:8506  7c 02 61	  jmp ($6102,x)
$1e:8509  31 99		 and ($99),y
$1e:850b  00 c7		 brk #$c7
$1e:850d  61 b0		 adc ($b0,x)
$1e:850f  8e e3 23	  stx $23e3
$1e:8512  d3 59		 cmp ($59,s),y
$1e:8514  b4 de		 ldy $de,x
$1e:8516  00 1e		 brk #$1e
$1e:8518  09 c4		 ora #$c4
$1e:851a  e6 75		 inc $75
$1e:851c  a0 9e ce	  ldy #$ce9e
$1e:851f  e7 73		 sbc [$73]
$1e:8521  a9 e4		 lda #$e4
$1e:8523  f6 7d		 inc $7d,x
$1e:8525  3f 0f 08 78   and $78080f,x
$1e:8529  23 31		 and $31,s
$1e:852b  ad 0e c6	  lda $c60e
$1e:852e  9d 4f 96	  sta $964f,x
$1e:8531  4b			phk
$1e:8532  63 71		 adc $71,s
$1e:8534  c1 69		 cmp ($69,x)
$1e:8536  87 82		 sta [$82]
$1e:8538  45 a2		 eor $a2
$1e:853a  92 d1		 sta ($d1)
$1e:853c  a8			tay
$1e:853d  f2 49		 sbc ($49)
$1e:853f  2c 8c 78	  bit $788c
$1e:8542  b0 09		 bcs $854d
$1e:8544  56 8a		 lsr $8a,x
$1e:8546  b4 46		 ldy $46,x
$1e:8548  0a			asl a
$1e:8549  d4 96		 pei ($96)
$1e:854b  56 4b		 lsr $4b,x
$1e:854d  f2 e3		 sbc ($e3)
$1e:854f  91 4c		 sta ($4c),y
$1e:8551  d5 e7		 cmp $e7,x
$1e:8553  bf 4d fa b3   lda $b3fa4d,x
$1e:8557  d7 be		 cmp [$be],y
$1e:8559  ce f6 fe	  dec $fef6
$1e:855c  80 02		 bra $8560
$1e:855e  02 00		 cop #$00
$1e:8560  04 8d		 tsb $8d
$1e:8562  c6 e3		 dec $e3
$1e:8564  91 77		 sta ($77),y
$1e:8566  90 42		 bcc $85aa
$1e:8568  69 34		 adc #$34
$1e:856a  48			pha
$1e:856b  d3 bc		 cmp ($bc,s),y
$1e:856d  1f 29 0e 85   ora $850e29,x
$1e:8571  c3 e0		 cmp $e0,s
$1e:8573  d1 98		 cmp ($98),y
$1e:8575  6c 6a 2c	  jmp ($2c6a)
$1e:8578  f9 58 0c	  sbc $0c58,y
$1e:857b  12 41		 ora ($41)
$1e:857d  49 84		 eor #$84
$1e:857f  3c 40 10	  bit $1040,x
$1e:8582  d1 b8		 cmp ($b8),y
$1e:8584  4c a6 42	  jmp $42a6
$1e:8587  13 07		 ora ($07,s),y
$1e:8589  cb			wai
$1e:858a  3e 46 33	  rol $3346,x
$1e:858d  2a			rol a
$1e:858e  97 c8		 sta [$c8],y
$1e:8590  a9 b0		 lda #$b0
$1e:8592  61 2c		 adc ($2c,x)
$1e:8594  3d 02 69	  and $6902,x
$1e:8597  1f a1 40 84   ora $8440a1,x
$1e:859b  b1 14		 lda ($14),y
$1e:859d  84 cc		 sty $cc
$1e:859f  e4 d2		 cpx $d2
$1e:85a1  61 25		 adc ($25,x)
$1e:85a3  42 67		 wdm #$67
$1e:85a5  b3 29		 lda ($29,s),y
$1e:85a7  68			pla
$1e:85a8  d0 80		 bne $852a
$1e:85aa  21 04		 and ($04,x)
$1e:85ac  01 81		 ora ($81,x)
$1e:85ae  78			sei
$1e:85af  e5 92		 sbc $92
$1e:85b1  ba			tsx
$1e:85b2  4d 2c 00	  eor $002c
$1e:85b5  14 ca		 trb $ca
$1e:85b7  4c 9e 7d	  jmp $7d9e
$1e:85ba  47 82		 eor [$82]
$1e:85bc  0b			phd
$1e:85bd  86 1b		 stx $1b
$1e:85bf  0d a2 d2	  ora $d2a2
$1e:85c2  69 30		 adc #$30
$1e:85c4  48			pha
$1e:85c5  25 26		 and $26
$1e:85c7  53 3a		 eor ($3a,s),y
$1e:85c9  9d cc 60	  sta $60cc,x
$1e:85cc  6e f2 a4	  ror $a4f2
$1e:85cf  3d 45 04	  and $0445,x
$1e:85d2  32 a8		 and ($a8)
$1e:85d4  1c ae 7b	  trb $7bae
$1e:85d7  49 7c		 eor #$7c
$1e:85d9  94 74		 sty $74,x
$1e:85db  0a			asl a
$1e:85dc  34 87		 bit $87,x
$1e:85de  a0 40 e7	  ldy #$e740
$1e:85e1  d0 39		 bne $861c
$1e:85e3  ed 11 f2	  sbc $f211
$1e:85e6  61 52		 adc ($52,x)
$1e:85e8  8e 46 68	  stx $6846
$1e:85eb  b3 89		 lda ($89,s),y
$1e:85ed  ec 9c 48	  cpx $489c
$1e:85f0  b1 d5		 lda ($d5),y
$1e:85f2  89 42		 bit #$42
$1e:85f4  57 61		 eor [$61],y
$1e:85f6  36 2a		 rol $2a,x
$1e:85f8  dc e2 06	  jml [$06e2]
$1e:85fb  cd 08 74	  cmp $7408
$1e:85fe  16 16		 asl $16,x
$1e:8600  45 66		 eor $66
$1e:8602  57 09		 eor [$09],y
$1e:8604  60			rts
$1e:8605  d2 cf		 cmp ($cf)
$1e:8607  d7 a4		 cmp [$a4],y
$1e:8609  c0 e9 27	  cpy #$27e9
$1e:860c  d0 03		 bne $8611
$1e:860e  a9 a4		 lda #$a4
$1e:8610  42 a1		 wdm #$a1
$1e:8612  27 81		 and [$81]
$1e:8614  c0 e4 47	  cpy #$47e4
$1e:8617  51 2c		 eor ($2c),y
$1e:8619  94 05		 sty $05,x
$1e:861b  12 12		 ora ($12)
$1e:861d  89 74		 bit #$74
$1e:861f  e8			inx
$1e:8620  4e 12 6a	  lsr $6a12
$1e:8623  15 24		 ora $24,x
$1e:8625  d8			cld
$1e:8626  90 39		 bcc $8661
$1e:8628  54 9c 2a	  mvn $2a,$9c
$1e:862b  04 61		 tsb $61
$1e:862d  9d aa 80	  sta $80aa,x
$1e:8630  56 4a		 lsr $4a,x
$1e:8632  90 45		 bcc $8679
$1e:8634  00 54		 brk #$54
$1e:8636  64 52		 stz $52
$1e:8638  04 28		 tsb $28
$1e:863a  4e d7 c0	  lsr $c0d7
$1e:863d  04 00		 tsb $00
$1e:863f  b0 4a		 bcs $868b
$1e:8641  88			dey
$1e:8642  a3 31		 lda $31,s
$1e:8644  90 c8		 bcc $860e
$1e:8646  66 74		 ror $74
$1e:8648  98			tya
$1e:8649  44 6a 36	  mvp $36,$6a
$1e:864c  88			dey
$1e:864d  02 28		 cop #$28
$1e:864f  91 02		 sta ($02),y
$1e:8651  78			sei
$1e:8652  15 1a		 ora $1a,x
$1e:8654  4a			lsr a
$1e:8655  f0 16		 beq $866d
$1e:8657  c1 32		 cmp ($32,x)
$1e:8659  81 cc		 sta ($cc,x)
$1e:865b  a6 54		 ldx $54
$1e:865d  91 b0		 sta ($b0),y
$1e:865f  4f 20 72 89   eor $897220
$1e:8663  81 e8		 sta ($e8,x)
$1e:8665  24 ce		 bit $ce
$1e:8667  20 a2 43	  jsr $43a2
$1e:866a  61 b4		 adc ($b4,x)
$1e:866c  50 b0		 bvc $861e
$1e:866e  05 82		 ora $82
$1e:8670  68			pla
$1e:8671  48			pha
$1e:8672  09 a9		 ora #$a9
$1e:8674  20 17 c1	  jsr $c117
$1e:8677  11 8e		 ora ($8e),y
$1e:8679  45 23		 eor $23
$1e:867b  29 10		 and #$10
$1e:867d  a4 89		 ldy $89
$1e:867f  81 02		 sta ($02,x)
$1e:8681  13 e2		 ora ($e2,s),y
$1e:8683  d0 2f		 bne $86b4
$1e:8685  82 90 c5	  brl $4c18
$1e:8688  08			php
$1e:8689  e4 5c		 cpx $5c
$1e:868b  82 05 42	  brl $c893
$1e:868e  9d d2 68	  sta $68d2,x
$1e:8691  86 d0		 stx $d0
$1e:8693  79 92 84	  adc $8492,y
$1e:8696  14 80		 trb $80
$1e:8698  46 24		 lsr $24
$1e:869a  e0 1f 41	  cpx #$411f
$1e:869d  e6 71		 inc $71
$1e:869f  c5 10		 cmp $10
$1e:86a1  1c 09 78	  trb $7809
$1e:86a4  0b			phd
$1e:86a5  00 79		 brk #$79
$1e:86a7  a4 52		 ldy $52
$1e:86a9  2f 10 49 0b   and $0b4910
$1e:86ad  30 a9		 bmi $8658
$1e:86af  84 80		 sty $80
$1e:86b1  1d 84 14	  ora $1484,x
$1e:86b4  10 25		 bpl $86db
$1e:86b6  f1 91		 sbc ($91),y
$1e:86b8  cf 66 d0 84   cmp $84d066
$1e:86bc  10 22		 bpl $86e0
$1e:86be  00 90		 brk #$90
$1e:86c0  02 b0		 cop #$b0
$1e:86c2  80 9b		 bra $865f
$1e:86c4  c2 65		 rep #$65
$1e:86c6  33 45		 and ($45,s),y
$1e:86c8  85 3d		 sta $3d
$1e:86ca  e0 20 90	  cpx #$9020
$1e:86cd  9a			txs
$1e:86ce  a7 41		 lda [$41]
$1e:86d0  68			pla
$1e:86d1  12 78		 ora ($78)
$1e:86d3  f2 04		 sbc ($04)
$1e:86d5  13 20		 ora ($20,s),y
$1e:86d7  d6 04		 dec $04,x
$1e:86d9  98			tya
$1e:86da  a7 05		 lda [$05]
$1e:86dc  88			dey
$1e:86dd  13 a8		 ora ($a8,s),y
$1e:86df  fa			plx
$1e:86e0  5c 29 32 08   jml $083229
$1e:86e4  a4 42		 ldy $42
$1e:86e6  21 0d		 and ($0d,x)
$1e:86e8  88			dey
$1e:86e9  46 62		 lsr $62
$1e:86eb  31 b5		 and ($b5),y
$1e:86ed  98			tya
$1e:86ee  c8			iny
$1e:86ef  60			rts
$1e:86f0  72 09		 adc ($09)
$1e:86f2  cc 85 c6	  cpy $c685
$1e:86f5  54 88 a3	  mvn $a3,$88
$1e:86f8  78			sei
$1e:86f9  54 41 03	  mvn $03,$41
$1e:86fc  97 48		 sta [$48],y
$1e:86fe  67 d0		 adc [$d0]
$1e:8700  36 f2		 rol $f2,x
$1e:8702  b7 80		 lda [$80],y
$1e:8704  84 0c		 sty $0c
$1e:8706  40			rti
$1e:8707  7d 04 b0	  adc $b004,x
$1e:870a  9e f1 b8	  stz $b8f1,x
$1e:870d  ea			nop
$1e:870e  84 54		 sty $54
$1e:8710  60			rts
$1e:8711  de 18 0b	  dec $0b18,x
$1e:8714  cc ca a4	  cpy $a4ca
$1e:8717  7b			tdc
$1e:8718  08			php
$1e:8719  cb			wai
$1e:871a  dc a5 32	  jml [$32a5]
$1e:871d  e9 69 cd	  sbc #$cd69
$1e:8720  63 b1		 adc $b1,s
$1e:8722  78			sei
$1e:8723  dd 29 70	  cmp $7029,x
$1e:8726  14 09		 trb $09
$1e:8728  04 a6		 tsb $a6
$1e:872a  5b			tcd
$1e:872b  03 87		 ora $87,s
$1e:872d  9d 50 2c	  sta $2c50,x
$1e:8730  01 10		 ora ($10,x)
$1e:8732  a0 49 65	  ldy #$6549
$1e:8735  53 f9		 eor ($f9,s),y
$1e:8737  7c b6 04	  jmp ($04b6,x)
$1e:873a  9a			txs
$1e:873b  58			cli
$1e:873c  1c d1 46	  trb $46d1
$1e:873f  10 39		 bpl $877a
$1e:8741  5c 0e 7e 15   jml $157e0e
$1e:8745  06 f1		 asl $f1
$1e:8747  89 c2 79	  bit #$79c2
$1e:874a  28			plp
$1e:874b  93 4b		 sta ($4b,s),y
$1e:874d  e5 92		 sbc $92
$1e:874f  f9 82 e5	  sbc $e582,y
$1e:8752  46 e3		 lsr $e3
$1e:8754  03 9c		 ora $9c,s
$1e:8756  88			dey
$1e:8757  84 48		 sty $48
$1e:8759  2b			pld
$1e:875a  a5 36		 lda $36
$1e:875c  01 24		 ora ($24,x)
$1e:875e  04 61		 tsb $61
$1e:8760  44 8d 17	  mvp $17,$8d
$1e:8763  e1 74		 sbc ($74,x)
$1e:8765  11 c3		 ora ($c3),y
$1e:8767  50 ba		 bvc $8723
$1e:8769  02 3b		 cop #$3b
$1e:876b  01 82		 ora ($82,x)
$1e:876d  26 55		 rol $55
$1e:876f  e8			inx
$1e:8770  31 78		 and ($78),y
$1e:8772  88			dey
$1e:8773  d4 14		 pei ($14)
$1e:8775  01 4b		 ora ($4b,x)
$1e:8777  76 c4		 ror $c4,x
$1e:8779  72 90		 adc ($90)
$1e:877b  bf 18 1a a5   lda $a51a18,x
$1e:877f  4a			lsr a
$1e:8780  4b			phk
$1e:8781  19 94 36	  ora $3694,y
$1e:8784  59 e0 b2	  eor $b2e0,y
$1e:8787  c1 86		 cmp ($86,x)
$1e:8789  46 e5		 lsr $e5
$1e:878b  6d 91 40	  adc $4091
$1e:878e  04 12		 tsb $12
$1e:8790  08			php
$1e:8791  20 6a 20	  jsr $206a
$1e:8794  2c 1f a1	  bit $a11f
$1e:8797  3e 81 c8	  rol $c881,x
$1e:879a  29 e9 95	  and #$95e9
$1e:879d  8c 86 c2	  sty $c286
$1e:87a0  13 3e		 ora ($3e,s),y
$1e:87a2  91 ce		 sta ($ce),y
$1e:87a4  64 32		 stz $32
$1e:87a6  70 7a		 bvs $8822
$1e:87a8  86 c1		 stx $c1
$1e:87aa  3e 12 39	  rol $3912,x
$1e:87ad  03 54		 ora $54,s
$1e:87af  26 d0		 rol $d0
$1e:87b1  3a			dec a
$1e:87b2  6c 15 fe	  jmp ($fe15)
$1e:87b5  b0 99		 bcs $8750
$1e:87b7  04 7e		 tsb $7e
$1e:87b9  41 20		 eor ($20,x)
$1e:87bb  9b			txy
$1e:87bc  35 44		 and $44,x
$1e:87be  1e b0 99	  asl $99b0,x
$1e:87c1  32 8c		 and ($8c)
$1e:87c3  a0 74 91	  ldy #$9174
$1e:87c6  7b			tdc
$1e:87c7  07 42		 ora [$42]
$1e:87c9  58			cli
$1e:87ca  e5 09		 sbc $09
$1e:87cc  3b			tsc
$1e:87cd  54 07 ec	  mvn $ec,$07
$1e:87d0  2d 07 28	  and $2807
$1e:87d3  a9 c1 cf	  lda #$cfc1
$1e:87d6  11 78		 ora ($78),y
$1e:87d8  84 36		 sty $36
$1e:87da  59 2b 65	  eor $652b,y
$1e:87dd  04 68		 tsb $68
$1e:87df  16 02		 asl $02,x
$1e:87e1  66 16		 ror $16
$1e:87e3  84 36		 sty $36
$1e:87e5  35 16		 and $16,x
$1e:87e7  8b			phb
$1e:87e8  1f c6 36 02   ora $0236c6,x
$1e:87ec  03 00		 ora $00,s
$1e:87ee  06 8d		 asl $8d
$1e:87f0  3b			tsc
$1e:87f1  c2 24		 rep #$24
$1e:87f3  f1 b8		 sbc ($b8),y
$1e:87f5  1c 5a 80	  trb $805a
$1e:87f8  01 a8		 ora ($a8,x)
$1e:87fa  d4 2e		 pei ($2e)
$1e:87fc  3d 48 08	  and $0848,x
$1e:87ff  d4 6a		 pei ($6a)
$1e:8801  1f 08 84 88   ora $888408,x
$1e:8805  6a			ror a
$1e:8806  25 41		 and $41
$1e:8808  84 d8		 sty $d8
$1e:880a  aa			tax
$1e:880b  35 01		 and $01,x
$1e:880d  9b			txy
$1e:880e  56 e1		 lsr $e1,x
$1e:8810  01 f1		 ora ($f1,x)
$1e:8812  b0 41		 bcs $8855
$1e:8814  6a			ror a
$1e:8815  f0 62		 beq $8879
$1e:8817  22 c1 c5 c5   jsl $c5c5c1
$1e:881b  58			cli
$1e:881c  86 bb		 stx $bb
$1e:881e  c4 a8		 cpy $a8
$1e:8820  82 00 1f	  brl $a723
$1e:8823  95 79		 sta $79,x
$1e:8825  fe 26 62	  inc $6226,x
$1e:8828  82 46 ab	  brl $3371
$1e:882b  e4 e5		 cpx $e5
$1e:882d  08			php
$1e:882e  01 d8		 ora ($d8,x)
$1e:8830  a1 85		 lda ($85,x)
$1e:8832  c7 10		 cmp [$10]
$1e:8834  19 48 4d	  ora $4d48,y
$1e:8837  ad 0f 11	  lda $110f
$1e:883a  15 81		 ora $81,x
$1e:883c  26 27		 rol $27
$1e:883e  e8			inx
$1e:883f  fe a2 7d	  inc $7da2,x
$1e:8842  35 43		 and $43,x
$1e:8844  42 a9		 wdm #$a9
$1e:8846  2a			rol a
$1e:8847  e2 27		 sep #$27
$1e:8849  06 6b		 asl $6b
$1e:884b  14 50		 trb $50
$1e:884d  b8			clv
$1e:884e  e5 46		 sbc $46
$1e:8850  36 84		 rol $84,x
$1e:8852  6a			ror a
$1e:8853  24 ef		 bit $ef
$1e:8855  52 d0		 eor ($d0)
$1e:8857  7b			tdc
$1e:8858  7d 1e cf	  adc $cf1e,x
$1e:885b  47 ba		 eor [$ba]
$1e:885d  2d 40 7f	  and $7f40
$1e:8860  a9 ac		 lda #$ac
$1e:8862  3d 1e af	  and $af1e,x
$1e:8865  58			cli
$1e:8866  28			plp
$1e:8867  23 d4		 and $d4,s
$1e:8869  80 7a		 bra $88e5
$1e:886b  9e c1 f4	  stz $f4c1,x
$1e:886e  0f d0 f4 21   ora $21f4d0
$1e:8872  89 0c		 bit #$0c
$1e:8874  be 8f 6f	  ldx $6f8f,y
$1e:8877  af d9 ed 10   lda $10edd9
$1e:887b  29 84		 and #$84
$1e:887d  27 31		 and [$31]
$1e:887f  2f 47 d4 54   and $54d447
$1e:8883  01 e0		 ora ($e0,x)
$1e:8885  b1 b1		 lda ($b1),y
$1e:8887  86 b6		 stx $b6
$1e:8889  88			dey
$1e:888a  3d 4f db	  and $db4f,x
$1e:888d  52 f7		 eor ($f7)
$1e:888f  06 88		 asl $88
$1e:8891  41 5a		 eor ($5a,x)
$1e:8893  c1 07		 cmp ($07,x)
$1e:8895  4c 0c 56	  jmp $560c
$1e:8898  2d c0 fb	  and $fbc0
$1e:889b  70 41		 bvs $88de
$1e:889d  00 99		 brk #$99
$1e:889f  25 21		 and $21
$1e:88a1  56 63		 lsr $63,x
$1e:88a3  b1 ee		 lda ($ee),y
$1e:88a5  47 c3		 eor [$c3]
$1e:88a7  92 18		 sta ($18)
$1e:88a9  05 49		 ora $49
$1e:88ab  2d 10 48	  and $4810
$1e:88ae  85 f6		 sta $f6
$1e:88b0  19 32 a4	  ora $a432,y
$1e:88b3  0b			phd
$1e:88b4  01 16		 ora ($16,x)
$1e:88b6  8b			phb
$1e:88b7  9d 66 c2	  sta $c266,x
$1e:88ba  68			pla
$1e:88bb  08			php
$1e:88bc  f4 7d 0b	  pea $0b7d
$1e:88bf  21 f6		 and ($f6,x)
$1e:88c1  4c 37 f5	  jmp $f537
$1e:88c4  61 23		 adc ($23,x)
$1e:88c6  71 20		 adc ($20),y
$1e:88c8  13 45		 ora ($45,s),y
$1e:88ca  6b			rtl
$1e:88cb  46 f2		 lsr $f2
$1e:88cd  28			plp
$1e:88ce  13 85		 ora ($85,s),y
$1e:88d0  60			rts
$1e:88d1  e3 62		 sbc $62,s
$1e:88d3  89 50		 bit #$50
$1e:88d5  51 e3		 eor ($e3),y
$1e:88d7  55 8b		 eor $8b,x
$1e:88d9  3d 16 2f	  and $2f16,x
$1e:88dc  08			php
$1e:88dd  31 8a		 and ($8a),y
$1e:88df  80 2b		 bra $890c
$1e:88e1  b1 e0		 lda ($e0),y
$1e:88e3  22 c7 e1 2e   jsl $2ee1c7
$1e:88e7  f1 58		 sbc ($58),y
$1e:88e9  53 f8		 eor ($f8,s),y
$1e:88eb  95 f5		 sta $f5,x
$1e:88ed  fd 07 bd	  sbc $bd07,x
$1e:88f0  89 ae		 bit #$ae
$1e:88f2  6f e1 1c 2d   adc $2d1ce1
$1e:88f6  81 c0		 sta ($c0,x)
$1e:88f8  2e a0 07	  rol $07a0
$1e:88fb  0f cc 92 87   ora $8792cc
$1e:88ff  05 39		 ora $39
$1e:8901  87 bc		 sta [$bc]
$1e:8903  b2 88		 lda ($88)
$1e:8905  05 8d		 ora $8d
$1e:8907  44 e0 d1	  mvp $d1,$e0
$1e:890a  43 51		 eor $51,s
$1e:890c  96 18		 stx $18,y
$1e:890e  fe 66 52	  inc $5266,x
$1e:8911  8a			txa
$1e:8912  c5 a2		 cmp $a2
$1e:8914  cf d0 84 fa   cmp $fa84d0
$1e:8918  7d 1e df	  adc $df1e,x
$1e:891b  47 b9		 eor [$b9]
$1e:891d  de 0b 80	  dec $800b,x
$1e:8920  ac c7 63	  ldy $63c7
$1e:8923  d1 e0		 cmp ($e0),y
$1e:8925  68			pla
$1e:8926  42 3d		 wdm #$3d
$1e:8928  1e 8f 5f	  asl $5f8f,x
$1e:892b  b3 d0		 lda ($d0,s),y
$1e:892d  5b			tcd
$1e:892e  26 22		 rol $22
$1e:8930  fa			plx
$1e:8931  d2 23		 cmp ($23)
$1e:8933  e8			inx
$1e:8934  4a			lsr a
$1e:8935  10 59		 bpl $8990
$1e:8937  53 e0		 eor ($e0,s),y
$1e:8939  a2 0f 63	  ldx #$630f
$1e:893c  fc 1a e2	  jsr ($e21a,x)
$1e:893f  c7 44		 cmp [$44]
$1e:8941  88			dey
$1e:8942  fa			plx
$1e:8943  bd 66 f1	  lda $f166,x
$1e:8946  9c 35 97	  stz $9735
$1e:8949  d1 ea		 cmp ($ea),y
$1e:894b  50 02		 bvc $894f
$1e:894d  8c 0f e1	  sty $e10f
$1e:8950  12 73		 ora ($73)
$1e:8952  29 a0		 and #$a0
$1e:8954  9e 2a 5c	  stz $5c2a,x
$1e:8957  03 c0		 ora $c0,s
$1e:8959  9e 06 07	  stz $0706,x
$1e:895c  16 aa		 asl $aa,x
$1e:895e  80 c6		 bra $8926
$1e:8960  08			php
$1e:8961  74 1b		 stz $1b,x
$1e:8963  04 e6		 tsb $e6
$1e:8965  24 68		 bit $68
$1e:8967  18			clc
$1e:8968  5c 7a ba 13   jml $13ba7a
$1e:896c  18			clc
$1e:896d  63 e5		 adc $e5,s
$1e:896f  ce a2 56	  dec $56a2
$1e:8972  30 53		 bmi $89c7
$1e:8974  57 d4		 eor [$d4],y
$1e:8976  c5 60		 cmp $60
$1e:8978  af 06 6b fa   lda $fa6b06
$1e:897c  26 f1		 rol $f1
$1e:897e  bd 31 ca	  lda $ca31,x
$1e:8981  a4 48		 ldy $48
$1e:8983  86 a8		 stx $a8
$1e:8985  55 ce		 eor $ce,x
$1e:8987  63 14		 adc $14,s
$1e:8989  7c bb c9	  jmp ($c9bb,x)
$1e:898c  c1 67		 cmp ($67,x)
$1e:898e  15 8b		 ora $8b,x
$1e:8990  24 5a		 bit $5a
$1e:8992  2e 7b 2a	  rol $2a7b
$1e:8995  cc 76 3c	  cpy $3c76
$1e:8998  a1 68		 lda ($68,x)
$1e:899a  f8			sed
$1e:899b  2c 86 64	  bit $6486
$1e:899e  af 73 e0 98   lda $98e073
$1e:89a2  c9 7e		 cmp #$7e
$1e:89a4  f5 34		 sbc $34,x
$1e:89a6  68			pla
$1e:89a7  4e 20 cc	  lsr $cc20
$1e:89aa  fa			plx
$1e:89ab  3c 04 49	  bit $4904,x
$1e:89ae  bd 68 50	  lda $5068,x
$1e:89b1  80 3b		 bra $89ee
$1e:89b3  c6 c4		 dec $c4
$1e:89b5  c0 8a db	  cpy #$db8a
$1e:89b8  bc ac 10	  ldy $10ac,x
$1e:89bb  53 a1		 eor ($a1,s),y
$1e:89bd  01 4e		 ora ($4e,x)
$1e:89bf  0e ef 23	  asl $23ef
$1e:89c2  fd 3f cc	  sbc $cc3f,x
$1e:89c5  70 10		 bvs $89d7
$1e:89c7  34 89		 bit $89,x
$1e:89c9  c1 0a		 cmp ($0a,x)
$1e:89cb  20 0f 58	  jsr $580f
$1e:89ce  5a			phy
$1e:89cf  84 e1		 sty $e1
$1e:89d1  81 d7		 sta ($d7,x)
$1e:89d3  45 02		 eor $02
$1e:89d5  e4 92		 cpx $92
$1e:89d7  01 17		 ora ($17,x)
$1e:89d9  07 a9		 ora [$a9]
$1e:89db  e8			inx
$1e:89dc  17 03		 ora [$03],y
$1e:89de  61 50		 adc ($50,x)
$1e:89e0  04 7c		 tsb $7c
$1e:89e2  7f 1f d8 4b   adc $4bd81f,x
$1e:89e6  cc 5f c6	  cpy $c65f
$1e:89e9  53 60		 eor ($60,s),y
$1e:89eb  18			clc
$1e:89ec  41 81		 eor ($81,x)
$1e:89ee  c6 43		 dec $43
$1e:89f0  27 c9		 and [$c9]
$1e:89f2  54 86 80	  mvn $80,$86
$1e:89f5  2e 68 9c	  rol $9c68
$1e:89f8  19 2e 4d	  ora $4d2e,y
$1e:89fb  d0 0f		 bne $8a0c
$1e:89fd  30 55		 bmi $8a54
$1e:89ff  85 c9		 sta $c9
$1e:8a01  15 aa		 ora $aa,x
$1e:8a03  c5 96		 cmp $96
$1e:8a05  aa			tax
$1e:8a06  4e 32 d8	  lsr $d832
$1e:8a09  57 63		 eor [$63],y
$1e:8a0b  cc 55 2f	  cpy $2f55
$1e:8a0e  1b			tcs
$1e:8a0f  4b			phk
$1e:8a10  db			stp
$1e:8a11  f5 63		 sbc $63,x
$1e:8a13  43 93		 eor $93,s
$1e:8a15  c5 2b		 cmp $2b
$1e:8a17  4a			lsr a
$1e:8a18  f3 3e		 sbc ($3e,s),y
$1e:8a1a  00 09		 brk #$09
$1e:8a1c  8f c8 8c 05   sta $058cc8
$1e:8a20  2b			pld
$1e:8a21  0f 8d 26 30   ora $30268d
$1e:8a25  35 b1		 and $b1,x
$1e:8a27  c1 07		 cmp ($07,x)
$1e:8a29  aa			tax
$1e:8a2a  8c 08 5b	  sty $5b08
$1e:8a2d  18			clc
$1e:8a2e  e1 81		 sbc ($81,x)
$1e:8a30  a7 33		 lda [$33]
$1e:8a32  09 9c		 ora #$9c
$1e:8a34  0e 64 0c	  asl $0c64
$1e:8a37  38			sec
$1e:8a38  ac 5a 2e	  ldy $2e5a
$1e:8a3b  77 34		 adc [$34],y
$1e:8a3d  20 af ca	  jsr $caaf
$1e:8a40  b3 1d		 lda ($1d,s),y
$1e:8a42  8f 47 cf 01   sta $01cf47
$1e:8a46  fd 23 bb	  sbc $bb23,x
$1e:8a49  c0 6b 45	  cpy #$456b
$1e:8a4c  4a			lsr a
$1e:8a4d  00 0c		 brk #$0c
$1e:8a4f  1d ea 55	  ora $55ea,x
$1e:8a52  22 4b 04 42   jsl $42044b
$1e:8a56  27 06		 and [$06]
$1e:8a58  ab			plb
$1e:8a59  a5 06		 lda $06
$1e:8a5b  28			plp
$1e:8a5c  1a			inc a
$1e:8a5d  70 9d		 bvs $89fc
$1e:8a5f  94 05		 sty $05,x
$1e:8a61  64 d1		 stz $d1
$1e:8a63  72 e2		 adc ($e2)
$1e:8a65  b0 9a		 bcs $8a01
$1e:8a67  3e df f6	  rol $f6df,x
$1e:8a6a  e7 c0		 sbc [$c0]
$1e:8a6c  00 02		 brk #$02
$1e:8a6e  03 00		 ora $00,s
$1e:8a70  06 9c		 asl $9c
$1e:8a72  4e 35 6f	  lsr $6f35
$1e:8a75  09 d0		 ora #$d0
$1e:8a77  f2 67		 sbc ($67)
$1e:8a79  10 9a		 bpl $8a15
$1e:8a7b  2e c0 02	  rol $02c0
$1e:8a7e  fa			plx
$1e:8a7f  2c e3 f8	  bit $f8e3
$1e:8a82  21 40		 and ($40,x)
$1e:8a84  1a			inc a
$1e:8a85  d2 75		 cmp ($75)
$1e:8a87  27 3b		 and [$3b]
$1e:8a89  2e 40 85	  rol $8540
$1e:8a8c  b9 f6 ae	  lda $aef6,y
$1e:8a8f  9f 3b 91 a8   sta $a8913b,x
$1e:8a93  d7 f2		 cmp [$f2],y
$1e:8a95  3b			tsc
$1e:8a96  1c d1 98	  trb $98d1
$1e:8a99  6b			rtl
$1e:8a9a  39 1a c1	  and $c11a,y
$1e:8a9d  a8			tay
$1e:8a9e  40			rti
$1e:8a9f  a0 63 80	  ldy #$8063
$1e:8aa2  0f 8f 3f 68   ora $683f8f
$1e:8aa6  43 0d		 eor $0d,s
$1e:8aa8  bf 40 86 23   lda $238640,x
$1e:8aac  b0 21		 bcs $8acf
$1e:8aae  80 bc		 bra $8a6c
$1e:8ab0  79 f0 48	  adc $48f0,y
$1e:8ab3  0c 06 0f	  tsb $0f06
$1e:8ab6  d0 2a		 bne $8ae2
$1e:8ab8  04 06		 tsb $06
$1e:8aba  01 00		 ora ($00,x)
$1e:8abc  2a			rol a
$1e:8abd  00 fc		 brk #$fc
$1e:8abf  a0 45 b0	  ldy #$b045
$1e:8ac2  97 74		 sta [$74],y
$1e:8ac4  0b			phd
$1e:8ac5  60			rts
$1e:8ac6  68			pla
$1e:8ac7  32 79		 and ($79)
$1e:8ac9  18			clc
$1e:8aca  c4 6c		 cpy $6c
$1e:8acc  3c ce 66	  bit $66ce,x
$1e:8acf  b0 d0		 bcs $8aa1
$1e:8ad1  25 f4		 and $f4
$1e:8ad3  81 8b		 sta ($8b,x)
$1e:8ad5  40			rti
$1e:8ad6  42 5d		 wdm #$5d
$1e:8ad8  14 60		 trb $60
$1e:8ada  1b			tcs
$1e:8adb  d1 0a		 cmp ($0a),y
$1e:8add  1d 5f b0	  ora $b05f,x
$1e:8ae0  84 35		 sty $35
$1e:8ae2  93 59		 sta ($59,s),y
$1e:8ae4  6c b4 3e	  jmp ($3eb4)
$1e:8ae7  1f b4 11 f5   ora $f511b4,x
$1e:8aeb  3e e2 81	  rol $81e2,x
$1e:8aee  31 8a		 and ($8a),y
$1e:8af0  3d bf a3	  and $a3bf,x
$1e:8af3  11 1d		 ora ($1d),y
$1e:8af5  01 f4		 ora ($f4,x)
$1e:8af7  97 44		 sta [$44],y
$1e:8af9  3c 11 a8	  bit $a811,x
$1e:8afc  12 44		 ora ($44)
$1e:8afe  da			phx
$1e:8aff  4c a2 26	  jmp $26a2
$1e:8b02  09 0c		 ora #$0c
$1e:8b04  0a			asl a
$1e:8b05  60			rts
$1e:8b06  75 0e		 adc $0e,x
$1e:8b08  60			rts
$1e:8b09  7c 0b 24	  jmp ($240b,x)
$1e:8b0c  5c 12 c9 21   jml $21c912
$1e:8b10  47 41		 eor [$41]
$1e:8b12  38			sec
$1e:8b13  d5 bc		 cmp $bc,x
$1e:8b15  25 f8		 and $f8
$1e:8b17  19 b0 94	  ora $94b0,y
$1e:8b1a  00 03		 brk #$03
$1e:8b1c  45 9d		 eor $9d
$1e:8b1e  9c 68 c0	  stz $c068
$1e:8b21  17 a5		 ora [$a5],y
$1e:8b23  9c 21 cc	  stz $cc21
$1e:8b26  3e dc 9d	  rol $9ddc,x
$1e:8b29  9c e5 8e	  stz $8ee5
$1e:8b2c  02 f2		 cop #$f2
$1e:8b2e  3b			tsc
$1e:8b2f  08			php
$1e:8b30  bc 7b 3c	  ldy $3c7b,x
$1e:8b33  9d 76 a5	  sta $a576,x
$1e:8b36  ac 4d 60	  ldy $604d
$1e:8b39  db			stp
$1e:8b3a  f4 08 45	  pea $4508
$1e:8b3d  ce 16 0b	  dec $0b16
$1e:8b40  98			tya
$1e:8b41  9c c1 07	  stz $07c1
$1e:8b44  e8			inx
$1e:8b45  39 86 10	  and $1086,y
$1e:8b48  4b			phk
$1e:8b49  01 e8		 ora ($e8,x)
$1e:8b4b  1f 04 f8 32   ora $32f804,x
$1e:8b4f  ee 81 f0	  inc $f081
$1e:8b52  50 a0		 bvc $8af4
$1e:8b54  4c 17 18	  jmp $1817
$1e:8b57  b7 43		 lda [$43],y
$1e:8b59  98			tya
$1e:8b5a  35 13		 and $13,x
$1e:8b5c  41 8f		 eor ($8f,x)
$1e:8b5e  43 a2		 eor $a2,s
$1e:8b60  7f 01 39 ac   adc $ac3901,x
$1e:8b64  8c 98 32	  sty $3298
$1e:8b67  d9 6c bc	  cmp $bc6c,y
$1e:8b6a  6a			ror a
$1e:8b6b  1d 5f b7	  ora $b75f,x
$1e:8b6e  a3 ec		 lda $ec,s
$1e:8b70  88			dey
$1e:8b71  32 e9		 and ($e9)
$1e:8b73  3b			tsc
$1e:8b74  07 a9		 ora [$a9]
$1e:8b76  f7 f3		 sbc [$f3],y
$1e:8b78  fd d1 0a	  sbc $0ad1,x
$1e:8b7b  ea			nop
$1e:8b7c  11 b8		 ora ($b8),y
$1e:8b7e  76 69		 ror $69,x
$1e:8b80  34 84		 bit $84,x
$1e:8b82  3a			dec a
$1e:8b83  27 4c		 and [$4c]
$1e:8b85  88			dey
$1e:8b86  03 71		 ora $71,s
$1e:8b88  d6 22		 dec $22,x
$1e:8b8a  07 59		 ora [$59]
$1e:8b8c  d6 16		 dec $16,x
$1e:8b8e  87 30		 sta [$30]
$1e:8b90  ee 05 90	  inc $9005
$1e:8b93  20 92 20	  jsr $2092
$1e:8b96  48			pha
$1e:8b97  80 9d		 bra $8b36
$1e:8b99  04 31		 tsb $31
$1e:8b9b  34 40		 bit $40,x
$1e:8b9d  a4 26		 ldy $26
$1e:8b9f  21 2a		 and ($2a,x)
$1e:8ba1  00 b4		 brk #$b4
$1e:8ba3  35 1a		 and $1a,x
$1e:8ba5  f2 fa		 sbc ($fa)
$1e:8ba7  17 cd		 ora [$cd],y
$1e:8ba9  14 1f		 trb $1f
$1e:8bab  d9 ce c9	  cmp $c9ce,y
$1e:8bae  9e 2f 47	  stz $472f,x
$1e:8bb1  1b			tcs
$1e:8bb2  83 bc		 sta $bc,s
$1e:8bb4  1b			tcs
$1e:8bb5  e6 f6		 inc $f6
$1e:8bb7  52 08		 eor ($08)
$1e:8bb9  3f c1 be 67   and $67bec1,x
$1e:8bbd  22 74 14 05   jsl $051474
$1e:8bc1  de 1e 84	  dec $841e,x
$1e:8bc4  39 ff 42	  and $42ff,y
$1e:8bc7  2a			rol a
$1e:8bc8  ff 0f 3d 2d   sbc $2d3d0f,x
$1e:8bcc  10 48		 bpl $8c16
$1e:8bce  20 ed 00	  jsr $00ed
$1e:8bd1  4d de 0b	  eor $0bde
$1e:8bd4  64 4a		 stz $4a
$1e:8bd6  02 14		 cop #$14
$1e:8bd8  c7 c2		 cmp [$c2]
$1e:8bda  86 45		 stx $45
$1e:8bdc  20 16 50	  jsr $5016
$1e:8bdf  1e 8b 11	  asl $118b,x
$1e:8be2  49 07		 eor #$07
$1e:8be4  21 8e		 and ($8e,x)
$1e:8be6  25 e6		 and $e6
$1e:8be8  0e 86 df	  asl $df86
$1e:8beb  a1 d0		 lda ($d0,x)
$1e:8bed  6b			rtl
$1e:8bee  89 b9		 bit #$b9
$1e:8bf0  5c 63 07 44   jml $440763
$1e:8bf4  83 9c		 sta $9c,s
$1e:8bf6  83 ea		 sta $ea,s
$1e:8bf8  f9 09 72	  sbc $7209,y
$1e:8bfb  24 1f		 bit $1f
$1e:8bfd  04 0f		 tsb $0f
$1e:8bff  12 48		 ora ($48)
$1e:8c01  2c e6 71	  bit $71e6
$1e:8c04  a1 e5		 lda ($e5,x)
$1e:8c06  30 67		 bmi $8c6f
$1e:8c08  b9 d5 9c	  lda $9cd5,y
$1e:8c0b  69 f5		 adc #$f5
$1e:8c0d  bb			tyx
$1e:8c0e  16 8b		 asl $8b,x
$1e:8c10  e6 73		 inc $73
$1e:8c12  5c 99 c4 e3   jml $e3c499
$1e:8c16  54 e0 9d	  mvn $9d,$e0
$1e:8c19  0f 24 23 2a   ora $2a2324
$1e:8c1d  61 d7		 adc ($d7,x)
$1e:8c1f  6a			ror a
$1e:8c20  4e e0 f1	  lsr $f1e0
$1e:8c23  8d 67 5f	  sta $5f67
$1e:8c26  67 39		 adc [$39]
$1e:8c28  43 03		 eor $03,s
$1e:8c2a  c5 c8		 cmp $c8
$1e:8c2c  a1 c9		 lda ($c9,x)
$1e:8c2e  7e 82 58	  ror $5882,x
$1e:8c31  01 04		 ora ($04,x)
$1e:8c33  bd 02 58	  lda $5802,x
$1e:8c36  9d 43 92	  sta $9243,x
$1e:8c39  0d 00 b2	  ora $b200
$1e:8c3c  1a			inc a
$1e:8c3d  43 91		 eor $91,s
$1e:8c3f  d1 1c		 cmp ($1c),y
$1e:8c41  07 20		 ora [$20]
$1e:8c43  38			sec
$1e:8c44  22 13 ed 8d   jsl $8ded13
$1e:8c48  58			cli
$1e:8c49  5a			phy
$1e:8c4a  43 31		 eor $31,s
$1e:8c4c  ea			nop
$1e:8c4d  fd 8f 41	  sbc $418f,x
$1e:8c50  35 96		 and $96,x
$1e:8c52  cb			wai
$1e:8c53  c5 60		 cmp $60
$1e:8c55  3d 21 98	  and $9821,x
$1e:8c58  f5 3e		 sbc $3e,x
$1e:8c5a  e8			inx
$1e:8c5b  13 0d		 ora ($0d,s),y
$1e:8c5d  81 34		 sta ($34,x)
$1e:8c5f  f5 9c		 sbc $9c,x
$1e:8c61  d3 98		 cmp ($98,s),y
$1e:8c63  80 04		 bra $8c69
$1e:8c65  34 61		 bit $61,x
$1e:8c67  81 07		 sta ($07,x)
$1e:8c69  82 08 8d	  brl $1974
$1e:8c6c  0f 00 0f 82   ora $820f00
$1e:8c70  48			pha
$1e:8c71  83 0a		 sta $0a,s
$1e:8c73  f2 83		 sbc ($83)
$1e:8c75  4a			lsr a
$1e:8c76  09 41		 ora #$41
$1e:8c78  5f 1d b0 e0   eor $e0b01d,x
$1e:8c7c  f2 97		 sbc ($97)
$1e:8c7e  f5 cb		 sbc $cb,x
$1e:8c80  d0 4e		 bne $8cd0
$1e:8c82  33 1b		 and ($1b,s),y
$1e:8c84  1d 6b 42	  ora $426b,x
$1e:8c87  33 39		 and ($39,s),y
$1e:8c89  f9 c3 34	  sbc $34c3,y
$1e:8c8c  35 4e		 and $4e,x
$1e:8c8e  09 76		 ora #$76
$1e:8c90  02 7e		 cop #$7e
$1e:8c92  5f 3e 0a f0   eor $f00a3e,x
$1e:8c96  df 8b 3c 7b   cmp $7b3c8b,x
$1e:8c9a  e4 ef		 cpx $ef
$1e:8c9c  2f f9 c3 d4   and $d4c3f9
$1e:8ca0  e5 ac		 sbc $ac
$1e:8ca2  e6 f6		 inc $f6
$1e:8ca4  75 90		 adc $90,x
$1e:8ca6  25 04		 and $04
$1e:8ca8  ed 36 fd	  sbc $fd36
$1e:8cab  0d a2 28	  ora $28a2
$1e:8cae  f8			sed
$1e:8caf  9d 04 81	  sta $8104,x
$1e:8cb2  c0 60 fd	  cpy #$fd60
$1e:8cb5  08			php
$1e:8cb6  0a			asl a
$1e:8cb7  40			rti
$1e:8cb8  e5 ca		 sbc $ca
$1e:8cba  04 57		 tsb $57
$1e:8cbc  66 b1		 ror $b1
$1e:8cbe  5a			phy
$1e:8cbf  8c 41 57	  sty $5741
$1e:8cc2  27 63		 and [$63]
$1e:8cc4  a2 d5 3e	  ldx #$3ed5
$1e:8cc7  cb			wai
$1e:8cc8  04 bb		 tsb $bb
$1e:8cca  49 11		 eor #$11
$1e:8ccc  e7 cd		 sbc [$cd]
$1e:8cce  65 ae		 adc $ae
$1e:8cd0  61 97		 adc ($97,x)
$1e:8cd2  f3 8e		 sbc ($8e,s),y
$1e:8cd4  9e fc f0	  stz $f0fc,x
$1e:8cd7  6f 87 bc 5f   adc $5fbc87
$1e:8cdb  e4 0f		 cpx $0f
$1e:8cdd  28			plp
$1e:8cde  f9 8b ce	  sbc $ce8b,y
$1e:8ce1  7e 84 f4	  ror $f484,x
$1e:8ce4  af a9 bd 6f   lda $6fbda9
$1e:8ce8  ec 8f 6c	  cpx $6c8f
$1e:8ceb  fb			xce
$1e:8cec  a8			tay
$1e:8ced  80 80		 bra $8c6f
$1e:8cef  0d c0 7c	  ora $7cc0
$1e:8cf2  31 5f		 and ($5f),y
$1e:8cf4  0c a7 c3	  tsb $c3a7
$1e:8cf7  3d f0 d4	  and $d4f0,x
$1e:8cfa  7c 36 5f	  jmp ($5f36,x)
$1e:8cfd  0d e7 c3	  ora $c3e7
$1e:8d00  8d f0 e8	  sta $e8f0
$1e:8d03  7c 3b 5f	  jmp ($5f3b,x)
$1e:8d06  0f 27 c3 dd   ora $ddc327
$1e:8d0a  f0 fc		 beq $8d08
$1e:8d0c  7c 20 5f	  jmp ($5f20,x)
$1e:8d0f  18			clc
$1e:8d10  67 c6		 adc [$c6]
$1e:8d12  2d f1 90	  and $90f1
$1e:8d15  7c 65 5f	  jmp ($5f65,x)
$1e:8d18  19 a7 c6	  ora $c6a7,y
$1e:8d1b  7d f1 a4	  adc $a4f1,x
$1e:8d1e  7c 6a 5f	  jmp ($5f6a,x)
$1e:8d21  1a			inc a
$1e:8d22  e7 c6		 sbc [$c6]
$1e:8d24  cd f1 b8	  cmp $b8f1
$1e:8d27  7c 6f 5f	  jmp ($5f6f,x)
$1e:8d2a  1c 27 c7	  trb $c727
$1e:8d2d  1d f1 cc	  ora $ccf1,x
$1e:8d30  7c 74 5f	  jmp ($5f74,x)
$1e:8d33  1d 67 c7	  ora $c767,x
$1e:8d36  6d f1 e0	  adc $e0f1
$1e:8d39  7c 79 5f	  jmp ($5f79,x)
$1e:8d3c  1e a7 c7	  asl $c7a7,x
$1e:8d3f  bd f1 f4	  lda $f4f1,x
$1e:8d42  7c 7e 5f	  jmp ($5f7e,x)
$1e:8d45  1f e7 c6 0d   ora $0dc6e7,x
$1e:8d49  f2 88		 sbc ($88)
$1e:8d4b  7c a3 5f	  jmp ($5fa3,x)
$1e:8d4e  29 27		 and #$27
$1e:8d50  ca			dex
$1e:8d51  5d f2 9c	  eor $9cf2,x
$1e:8d54  7c a8 5f	  jmp ($5fa8,x)
$1e:8d57  2a			rol a
$1e:8d58  67 ca		 adc [$ca]
$1e:8d5a  ad f2 b0	  lda $b0f2
$1e:8d5d  7c ad 5f	  jmp ($5fad,x)
$1e:8d60  2b			pld
$1e:8d61  a7 ca		 lda [$ca]
$1e:8d63  fd f2 c4	  sbc $c4f2,x
$1e:8d66  7c b2 5f	  jmp ($5fb2,x)
$1e:8d69  2c e7 cb	  bit $cbe7
$1e:8d6c  4d f2 d8	  eor $d8f2
$1e:8d6f  7c b7 5f	  jmp ($5fb7,x)
$1e:8d72  2e 27 cb	  rol $cb27
$1e:8d75  9d f2 ec	  sta $ecf2,x
$1e:8d78  7c bc 5f	  jmp ($5fbc,x)
$1e:8d7b  2f 67 cb ed   and $edcb67
$1e:8d7f  f2 87		 sbc ($87)
$1e:8d81  c0 0e 01	  cpy #$010e
$1e:8d84  ff ff c0 3e   sbc $3ec0ff,x
$1e:8d88  67 30		 adc [$30]
$1e:8d8a  37 a4		 and [$a4],y
$1e:8d8c  a8			tay
$1e:8d8d  ec f5 43	  cpx $43f5
$1e:8d90  b3 df		 lda ($df,s),y
$1e:8d92  8e cf a8	  stx $a8cf
$1e:8d95  3b			tsc
$1e:8d96  3f 48 ec ff   and $ffec48,x
$1e:8d9a  c3 b3		 cmp $b3,s
$1e:8d9c  c9 be		 cmp #$be
$1e:8d9e  87 76		 sta [$76]
$1e:8da0  a8			tay
$1e:8da1  2f 1e f4 bc   and $bcf41e
$1e:8da5  7d 22 f1	  adc $f122,x
$1e:8da8  f9 cb c7	  sbc $c7cb,y
$1e:8dab  fc 2f 1e	  jsr ($1e2f,x)
$1e:8dae  45 f5		 eor $f5
$1e:8db0  3b			tsc
$1e:8db1  b5 31		 lda $31,x
$1e:8db3  f0 f7		 beq $8dac
$1e:8db5  67 c3		 adc [$c3]
$1e:8db7  e8			inx
$1e:8db8  1f 0f ca 7c   ora $7cca0f,x
$1e:8dbc  3f d1 f0 f1   and $f1f0d1,x
$1e:8dc0  ef b1 dd a9   sbc $a9ddb1
$1e:8dc4  03 47		 ora $47,s
$1e:8dc6  b9 0d 1f	  lda $1f0d,y
$1e:8dc9  38			sec
$1e:8dca  34 7e		 bit $7e,x
$1e:8dcc  30 d1		 bmi $8d9f
$1e:8dce  fe 03 47	  inc $4703,x
$1e:8dd1  8d 7d d6	  sta $d67d
$1e:8dd4  6d 44 38	  adc $3844
$1e:8dd7  3d b8 e0	  and $e0b8,x
$1e:8dda  f9 83 83	  sbc $8383,y
$1e:8ddd  f0 8e		 beq $8d6d
$1e:8ddf  0f ec 38 3c   ora $3c38ec
$1e:8de3  5b			tcd
$1e:8de4  f0 ef		 beq $8dd5
$1e:8de6  6a			ror a
$1e:8de7  02 b1		 cop #$b1
$1e:8de9  ed 4a c7	  sbc $c74a
$1e:8dec  ca			dex
$1e:8ded  2b			pld
$1e:8dee  1f 7c ac 7f   ora $7fac7c,x
$1e:8df2  42 b1		 wdm #$b1
$1e:8df4  e2 5f		 sep #$5f
$1e:8df6  91 5b		 sta ($5b),y
$1e:8df8  4f 1d 0f 66   eor $660f1d
$1e:8dfc  74 3e		 stz $3e,x
$1e:8dfe  41 d0		 eor ($d0,x)
$1e:8e00  fb			xce
$1e:8e01  a7 43		 lda [$43]
$1e:8e03  f9 1d 0f	  sbc $0f1d,y
$1e:8e06  0e fd 19	  asl $19fd
$1e:8e09  da			phx
$1e:8e0a  70 24		 bvs $8e30
$1e:8e0c  7b			tdc
$1e:8e0d  10 91		 bpl $8da0
$1e:8e0f  f1 82		 sbc ($82),y
$1e:8e11  47 db		 eor [$db]
$1e:8e13  09 1f		 ora #$1f
$1e:8e15  c0 24		 cpy #$24
$1e:8e17  78			sei
$1e:8e18  57 ed		 eor [$ed],y
$1e:8e1a  46 d3		 lsr $d3
$1e:8e1c  43 03		 eor $03,s
$1e:8e1e  d7 8c		 cmp [$8c],y
$1e:8e20  0f 88 30 3e   ora $3e3088
$1e:8e24  c8			iny
$1e:8e25  c0 fd		 cpy #$fd
$1e:8e27  c3 03		 cmp $03,s
$1e:8e29  c1 bf		 cmp ($bf,x)
$1e:8e2b  8d f6 98	  sta $98f6
$1e:8e2e  27 1e		 and [$1e]
$1e:8e30  b4 9c		 ldy $9c,x
$1e:8e32  7c 22 71	  jmp ($7122,x)
$1e:8e35  f5 c9		 sbc $c9,x
$1e:8e37  c7 ec		 cmp [$ec]
$1e:8e39  27 1e		 and [$1e]
$1e:8e3b  05 fd		 ora $fd
$1e:8e3d  0d b4 b1	  ora $b1b4
$1e:8e40  b0 f5		 bcs $8e37
$1e:8e42  66 c0		 ror $c0
$1e:8e44  8c 82 29	  sty $2982
$1e:8e47  00 84		 brk #$84
$1e:8e49  0c 85 e6	  tsb $e685
$1e:8e4c  0f 30 82 0c   ora $0c8230
$1e:8e50  86 18		 stx $18
$1e:8e52  32 0e		 and ($0e)
$1e:8e54  43 e4		 eor $e4,s
$1e:8e56  5e 62 02	  lsr $0262,x
$1e:8e59  18			clc
$1e:8e5a  43 ec		 eor $ec,s
$1e:8e5c  40			rti
$1e:8e5d  42 ff		 wdm #$ff
$1e:8e5f  10 09		 bpl $8e6a
$1e:8e61  3c 3c 03	  bit $033c,x
$1e:8e64  e1 2f		 sbc ($2f,x)
$1e:8e66  11 f8		 ora ($f8),y
$1e:8e68  d3 c8		 cmp ($c8,s),y
$1e:8e6a  be 56 f3	  ldx $f356,y
$1e:8e6d  3f 9e 3d 13   and $133d9e,x
$1e:8e71  e9 af		 sbc #$af
$1e:8e73  55 fa		 eor $fa,x
$1e:8e75  f3 d9		 sbc ($d9,s),y
$1e:8e77  be de f7	  ldx $f7de,y
$1e:8e7a  7f 80 3c 23   adc $233c80,x
$1e:8e7e  e2 2f		 sep #$2f
$1e:8e80  19 f9 13	  ora $13f9,y
$1e:8e83  ca			dex
$1e:8e84  be 66 f3	  ldx $f366,y
$1e:8e87  bf a2 3d 33   lda $333da2,x
$1e:8e8b  ea			nop
$1e:8e8c  af 5d fb 33   lda $33fb5d
$1e:8e90  db			stp
$1e:8e91  be ee f7	  ldx $f7ee,y
$1e:8e94  ff 84 3c 43   sbc $433c84,x
$1e:8e98  e3 2f		 sbc $2f,s
$1e:8e9a  21 f9		 and ($f9,x)
$1e:8e9c  53 cc		 eor ($cc,s),y
$1e:8e9e  be 76 f4	  ldx $f476,y
$1e:8ea1  3f a6 3d 53   and $533da6,x
$1e:8ea5  eb			xba
$1e:8ea6  af 65 fb 73   lda $73fb65
$1e:8eaa  dd be fe	  cmp $febe,x
$1e:8ead  f0 7f		 beq $8f2e
$1e:8eaf  88			dey
$1e:8eb0  3c 63 e4	  bit $e463,x
$1e:8eb3  2f 29 f9 93   and $93f929
$1e:8eb7  ce be 86	  dec $86be
$1e:8eba  f4 bf aa	  pea $aabf
$1e:8ebd  3d 73 ec	  and $ec73,x
$1e:8ec0  af 6d fb b3   lda $b3fb6d
$1e:8ec4  df be 0e f0   cmp $f00ebe,x
$1e:8ec8  ff 8c 3c 83   sbc $833c8c,x
$1e:8ecc  e5 2f		 sbc $2f
$1e:8ece  31 f9		 and ($f9),y
$1e:8ed0  d3 d0		 cmp ($d0,s),y
$1e:8ed2  be 96 f5	  ldx $f596,y
$1e:8ed5  3f ae 3d 93   and $933dae,x
$1e:8ed9  ed af 75	  sbc $75af
$1e:8edc  fb			xce
$1e:8edd  f3 c1		 sbc ($c1,s),y
$1e:8edf  be 1e f1	  ldx $f11e,y
$1e:8ee2  7f 90 3c a3   adc $a33c90,x
$1e:8ee6  e6 2f		 inc $2f
$1e:8ee8  39 fa 13	  and $13fa,y
$1e:8eeb  d2 be		 cmp ($be)
$1e:8eed  a6 f5		 ldx $f5
$1e:8eef  bf b2 3d b3   lda $b33db2,x
$1e:8ef3  ee af 7d	  inc $7daf
$1e:8ef6  f8			sed
$1e:8ef7  33 c3		 and ($c3,s),y
$1e:8ef9  be 2e f1	  ldx $f12e,y
$1e:8efc  ff 94 3c c3   sbc $c33c94,x
$1e:8f00  e7 2f		 sbc [$2f]
$1e:8f02  41 fa		 eor ($fa,x)
$1e:8f04  53 d4		 eor ($d4,s),y
$1e:8f06  be b6 f6	  ldx $f6b6,y
$1e:8f09  3f b6 3d d3   and $d33db6,x
$1e:8f0d  ef af 05 f8   sbc $f805af
$1e:8f11  73 c5		 adc ($c5,s),y
$1e:8f13  be 3e f2	  ldx $f23e,y
$1e:8f16  7f 98 3c e3   adc $e33c98,x
$1e:8f1a  e8			inx
$1e:8f1b  2f 49 fa 93   and $93fa49
$1e:8f1f  d6 be		 dec $be,x
$1e:8f21  c6 f6		 dec $f6
$1e:8f23  bf ba 3d f3   lda $f33dba,x
$1e:8f27  e0 af		 cpx #$af
$1e:8f29  0d f8 b3	  ora $b3f8
$1e:8f2c  c7 be		 cmp [$be]
$1e:8f2e  4e f2 ff	  lsr $fff2
$1e:8f31  9c 3d 03	  stz $033d
$1e:8f34  e9 2f		 sbc #$2f
$1e:8f36  51 fa		 eor ($fa),y
$1e:8f38  d3 d8		 cmp ($d8,s),y
$1e:8f3a  be d6 f7	  ldx $f7d6,y
$1e:8f3d  3f be 3c 13   and $133cbe,x
$1e:8f41  e1 af		 sbc ($af,x)
$1e:8f43  15 f8		 ora $f8,x
$1e:8f45  f3 c9		 sbc ($c9,s),y
$1e:8f47  be 5e f3	  ldx $f35e,y
$1e:8f4a  7f a0 3d 23   adc $233da0,x
$1e:8f4e  ea			nop
$1e:8f4f  2f 59 fb 13   and $13fb59
$1e:8f53  da			phx
$1e:8f54  be e6 f7	  ldx $f7e6,y
$1e:8f57  bf 82 3c 32   lda $323c82,x
$1e:8f5b  81 50		 sta ($50,x)
$1e:8f5d  fe 7f e2	  inc $e27f,x
$1e:8f60  10 02		 bpl $8f64
$1e:8f62  68			pla
$1e:8f63  09 fc		 ora #$fc
$1e:8f65  71 60		 adc ($60),y
$1e:8f67  05 01		 ora $01
$1e:8f69  00 05		 brk #$05
$1e:8f6b  93 c3		 sta ($c3,s),y
$1e:8f6d  a1 d2		 lda ($d2,x)
$1e:8f6f  77 78		 adc [$78],y
$1e:8f71  bc 1e 1d	  ldy $1d1e,x
$1e:8f74  03 8b		 ora $8b,s
$1e:8f76  54 aa 71	  mvn $71,$aa
$1e:8f79  60			rts
$1e:8f7a  20 80 96	  jsr $9680
$1e:8f7d  1d 0b 8f	  ora $8f0b,x
$1e:8f80  56 ab		 lsr $ab,x
$1e:8f82  71 e0		 adc ($e0),y
$1e:8f84  a0 84		 ldy #$84
$1e:8f86  96 1d		 stx $1d,y
$1e:8f88  0f eb c6 23   ora $23c6eb
$1e:8f8c  1f d1 10 09   ora $0910d1,x
$1e:8f90  53 bd		 eor ($bd,s),y
$1e:8f92  de 93 d4	  dec $d493,x
$1e:8f95  38			sec
$1e:8f96  f3 be		 sbc ($be,s),y
$1e:8f98  07 07		 ora [$07]
$1e:8f9a  84 33		 sty $33
$1e:8f9c  4b			phk
$1e:8f9d  6c 02 01	  jmp ($0102)
$1e:8fa0  27 ac		 and [$ac]
$1e:8fa2  71 c7		 adc ($c7),y
$1e:8fa4  a1 c3		 lda ($c3,x)
$1e:8fa6  21 30		 and ($30,x)
$1e:8fa8  f4 03 e0	  pea $e003
$1e:8fab  41 f2		 eor ($f2,x)
$1e:8fad  95 8b		 sta $8b,x
$1e:8faf  c4 c5		 cpy $c5
$1e:8fb1  84 0f		 sty $0f
$1e:8fb3  40			rti
$1e:8fb4  87 13		 sta [$13]
$1e:8fb6  8b			phb
$1e:8fb7  c6 49		 dec $49
$1e:8fb9  a1 71		 lda ($71,x)
$1e:8fbb  38			sec
$1e:8fbc  8e d0 91	  stx $91d0
$1e:8fbf  48			pha
$1e:8fc0  dd 83 fd	  cmp $fd83,x
$1e:8fc3  75 94		 adc $94,x
$1e:8fc5  3a			dec a
$1e:8fc6  27 06		 and [$06]
$1e:8fc8  aa			tax
$1e:8fc9  57 20		 eor [$20],y
$1e:8fcb  d0 78		 bne $9045
$1e:8fcd  cc 16 0c	  cpy $0c16
$1e:8fd0  b8			clv
$1e:8fd1  3a			dec a
$1e:8fd2  a3 bd		 lda $bd,s
$1e:8fd4  21 f1		 and ($f1,x)
$1e:8fd6  98			tya
$1e:8fd7  6b			rtl
$1e:8fd8  d0 9e		 bne $8f78
$1e:8fda  02 5b		 cop #$5b
$1e:8fdc  26 97		 rol $97
$1e:8fde  b7 a5		 lda [$a5],y
$1e:8fe0  7e 2c 03	  ror $032c,x
$1e:8fe3  78			sei
$1e:8fe4  b5 4e		 lda $4e,x
$1e:8fe6  2c 00 1a	  bit $1a00
$1e:8fe9  93 fe		 sta ($fe,s),y
$1e:8feb  2b			pld
$1e:8fec  71 e0		 adc ($e0),y
$1e:8fee  80 d6		 bra $8fc6
$1e:8ff0  81 f1		 sta ($f1,x)
$1e:8ff2  de 0f 85	  dec $850f,x
$1e:8ff5  e2 f2		 sep #$f2
$1e:8ff7  23 1d		 and $1d,s
$1e:8ff9  18			clc
$1e:8ffa  8c 6f 5e	  sty $5e6f
$1e:8ffd  cf 6f 20 b6   cmp $b6206f
$1e:9001  38			sec
$1e:9002  8d 66 8f	  sta $8f66
$1e:9005  5d ae 1a	  eor $1aae,x
$1e:9008  16 0b		 asl $0b,x
$1e:900a  29 95		 and #$95
$1e:900c  f8			sed
$1e:900d  16 c6		 asl $c6,x
$1e:900f  97 80		 sta [$80],y
$1e:9011  d7 4e		 cmp [$4e],y
$1e:9013  27 32		 and [$32]
$1e:9015  79 cc eb	  adc $ebcc,y
$1e:9018  5d 82 f9	  eor $f982,x
$1e:901b  7c f4 88	  jmp ($88f4,x)
$1e:901e  b1 bc		 lda ($bc),y
$1e:9020  6a			ror a
$1e:9021  b5 d4		 lda $d4,x
$1e:9023  0b			phd
$1e:9024  b6 be		 ldx $be,y
$1e:9026  ef 42 25 07   sbc $072542
$1e:902a  43 a3		 eor $a3,s
$1e:902c  78			sei
$1e:902d  45 8e		 eor $8e
$1e:902f  8c c4 12	  sty $12c4
$1e:9032  7d 7f ef	  adc $ef7f,x
$1e:9035  5f 27 31 05   eor $053127,x
$1e:9039  e2 f5		 sep #$f5
$1e:903b  88			dey
$1e:903c  17 99		 ora [$99],y
$1e:903e  50 30		 bvc $9070
$1e:9040  da			phx
$1e:9041  fc 39 64	  jsr ($6439,x)
$1e:9044  71 18		 adc ($18),y
$1e:9046  a1 71		 lda ($71,x)
$1e:9048  10 86		 bpl $8fd0
$1e:904a  91 49		 sta ($49),y
$1e:904c  93 d2		 sta ($d2,s),y
$1e:904e  69 44		 adc #$44
$1e:9050  a0 1e		 ldy #$1e
$1e:9052  21 48		 and ($48,x)
$1e:9054  06 8c		 asl $8c
$1e:9056  4c 1e ef	  jmp $ef1e
$1e:9059  12 41		 ora ($41)
$1e:905b  b0 d8		 bcs $9035
$1e:905d  a8			tay
$1e:905e  c7 66		 cmp [$66]
$1e:9060  a3 1d		 lda $1d,s
$1e:9062  91 70		 sta ($70),y
$1e:9064  3d 95 c8	  and $c895,x
$1e:9067  32 c0		 and ($c0)
$1e:9069  6a			ror a
$1e:906a  8a			txa
$1e:906b  f8			sed
$1e:906c  77 f3		 adc [$f3],y
$1e:906e  83 4c		 sta $4c,s
$1e:9070  00 de		 brk #$de
$1e:9072  d6 1d		 dec $1d,x
$1e:9074  30 ca		 bmi $9040
$1e:9076  2d 52 a9	  and $a952
$1e:9079  c5 80		 cmp $80
$1e:907b  42 00		 wdm #$00
$1e:907d  78			sei
$1e:907e  f5 6a		 sbc $6a,x
$1e:9080  b7 1e		 lda [$1e],y
$1e:9082  09 08		 ora #$08
$1e:9084  41 f9		 eor ($f9,x)
$1e:9086  3e cf 6e	  rol $6ecf,x
$1e:9089  d7 6d		 cmp [$6d],y
$1e:908b  27 e4		 and [$e4]
$1e:908d  72 47		 adc ($47)
$1e:908f  80 25		 bra $90b6
$1e:9091  0c 1e d3	  tsb $d31e
$1e:9094  4d bb f8	  eor $f8bb
$1e:9097  89 c3		 bit #$c3
$1e:9099  79 27 dd	  adc $dd27,y
$1e:909c  fc 3e 24	  jsr ($243e,x)
$1e:909f  c0 1a		 cpy #$1a
$1e:90a1  86 3f		 stx $3f
$1e:90a3  79 a7 dd	  adc $dda7,y
$1e:90a6  e9 53		 sbc #$53
$1e:90a8  80 fc		 bra $90a6
$1e:90aa  0d d0 d5	  ora $d5d0
$1e:90ad  76 9f		 ror $9f,x
$1e:90af  dd dd e9	  cmp $e9dd,x
$1e:90b2  58			cli
$1e:90b3  03 2b		 ora $2b,s
$1e:90b5  c5 5e		 cmp $5e
$1e:90b7  2f 5f dd 34   and $34dd5f
$1e:90bb  9c 8a c3	  stz $c38a
$1e:90be  30 e4		 bmi $90a4
$1e:90c0  e2 31		 sep #$31
$1e:90c2  43 2b		 eor $2b,s
$1e:90c4  17 89		 ora [$89],y
$1e:90c6  09 fc		 ora #$fc
$1e:90c8  df 74 60 0f   cmp $0f6074,x
$1e:90cc  c7 78		 cmp [$78]
$1e:90ce  33 6f		 and ($6f,s),y
$1e:90d0  17 d9		 ora [$d9],y
$1e:90d2  38			sec
$1e:90d3  1e d2 80	  asl $80d2,x
$1e:90d6  6f 77 d2 7d   adc $7dd277
$1e:90da  26 94		 rol $94
$1e:90dc  a0 0a		 ldy #$0a
$1e:90de  50 81		 bvc $9061
$1e:90e0  75 95		 adc $95,x
$1e:90e2  81 06		 sta ($06,x)
$1e:90e4  aa			tax
$1e:90e5  57 20		 eor [$20],y
$1e:90e7  cb			wai
$1e:90e8  21 58		 and ($58,x)
$1e:90ea  3b			tsc
$1e:90eb  bf 9c 1a dd   lda $dd1a9c,x
$1e:90ef  f5 f8		 sbc $f8,x
$1e:90f1  43 58		 eor $58,s
$1e:90f3  01 27		 ora ($27,x)
$1e:90f5  87 b0		 sta [$b0]
$1e:90f7  45 80		 eor $80
$1e:90f9  72 78		 adc ($78)
$1e:90fb  24 9e		 bit $9e
$1e:90fd  2b			pld
$1e:90fe  16 e6		 asl $e6,x
$1e:9100  c5 a2		 cmp $a2
$1e:9102  f2 78		 sbc ($78)
$1e:9104  1c 5a a5	  trb $a55a
$1e:9107  53 8b		 eor ($8b,s),y
$1e:9109  45 a0		 eor $a0
$1e:910b  90 e8		 bcc $90f5
$1e:910d  64 9e		 stz $9e
$1e:910f  3b			tsc
$1e:9110  1e ea c7	  asl $c7ea,x
$1e:9113  a3 f2		 lda $f2,s
$1e:9115  78			sei
$1e:9116  5c 7a b5 5b   jml $5bb57a
$1e:911a  8f 47 a1 90   sta $90a147
$1e:911e  e7 88		 sbc [$88]
$1e:9120  30 89		 bmi $90ab
$1e:9122  7e 10 fd	  ror $fd10,x
$1e:9125  a6 9b		 ldx $9b
$1e:9127  75 de		 adc $de,x
$1e:9129  ef c3 43 d0   sbc $d043c3
$1e:912d  7c 18 07	  jmp ($0718,x)
$1e:9130  3e a2 1e	  rol $1ea2,x
$1e:9133  19 3d b4	  ora $b43d,y
$1e:9136  84 0f		 sty $0f
$1e:9138  31 da		 and ($da),y
$1e:913a  7f 77 43 b0   adc $b04377,x
$1e:913e  ac 8f 8b	  ldy $8b8f
$1e:9141  53 ab		 eor ($ab,s),y
$1e:9143  d6 bc		 dec $bc,x
$1e:9145  c4 70		 cpy $70
$1e:9147  62 d0 8a	  per $1c1a
$1e:914a  82 40 a4	  brl $358d
$1e:914d  20 90 8b	  jsr $8b90
$1e:9150  8a			txa
$1e:9151  04 b6		 tsb $b6
$1e:9153  51 d0		 eor ($d0),y
$1e:9155  c8			iny
$1e:9156  14 84		 trb $84
$1e:9158  32 11		 and ($11)
$1e:915a  f1 c2		 sbc ($c2),y
$1e:915c  fd cf ef	  sbc $efcf,x
$1e:915f  75 f5		 adc $f5,x
$1e:9161  71 89		 adc ($89),y
$1e:9163  83 f6		 sta $f6,s
$1e:9165  47 bd		 eor [$bd]
$1e:9167  d3 d7		 cmp ($d7,s),y
$1e:9169  da			phx
$1e:916a  2e 0f 59	  rol $590f
$1e:916d  3f 39 b2 e0   and $e0b239,x
$1e:9171  c1 95		 cmp ($95,x)
$1e:9173  e1 54		 sbc ($54,x)
$1e:9175  ae 2b c5	  ldx $c52b
$1e:9178  62 91 41	  per $d30c
$1e:917b  91 8c		 sta ($8c),y
$1e:917d  0d 84 ae	  ora $ae84
$1e:9180  0d 6e ff	  ora $ff6e
$1e:9183  ed bc 11	  sbc $11bc
$1e:9186  87 91		 sta [$91]
$1e:9188  b7 a3		 lda [$a3],y
$1e:918a  81 c1		 sta ($c1,x)
$1e:918c  e1 10		 sbc ($10,x)
$1e:918e  84 9e		 sty $9e
$1e:9190  1b			tcs
$1e:9191  81 b0		 sta ($b0,x)
$1e:9193  37 93		 and [$93],y
$1e:9195  86 de		 stx $de
$1e:9197  28			plp
$1e:9198  af 37 71 cd   lda $cd7137
$1e:919c  8b			phb
$1e:919d  83 66		 sta $66,s
$1e:919f  3b			tsc
$1e:91a0  d5 dc		 cmp $dc,x
$1e:91a2  75 63		 adc $63,x
$1e:91a4  ed e0 da	  sbc $dae0
$1e:91a7  49 c9		 eor #$c9
$1e:91a9  40			rti
$1e:91aa  13 3d		 ora ($3d,s),y
$1e:91ac  74 e2		 stz $e2,x
$1e:91ae  67 3a		 adc [$3a]
$1e:91b0  d7 37		 cmp [$37],y
$1e:91b2  80 f0		 bra $91a4
$1e:91b4  43 34		 eor $34,s
$1e:91b6  a4 52		 ldy $52
$1e:91b8  69 43		 adc #$43
$1e:91ba  c1 ff		 cmp ($ff,x)
$1e:91bc  e9 99		 sbc #$99
$1e:91be  c0 33		 cpy #$33
$1e:91c0  42 c1		 wdm #$c1
$1e:91c2  0f 4f 89 c5   ora $c5894f
$1e:91c6  e3 37		 sbc $37,s
$1e:91c8  a0 5e		 ldy #$5e
$1e:91ca  47 2f		 eor [$2f]
$1e:91cc  41 fa		 eor ($fa,x)
$1e:91ce  53 d4		 eor ($d4,s),y
$1e:91d0  be b6 f6	  ldx $f6b6,y
$1e:91d3  3f b6 3d d2   and $d23db6,x
$1e:91d7  60			rts
$1e:91d8  01 04		 ora ($04,x)
$1e:91da  00 04		 brk #$04
$1e:91dc  87 3b		 sta [$3b]
$1e:91de  c2 4f		 rep #$4f
$1e:91e0  27 87		 and [$87]
$1e:91e2  43 e3		 eor $e3,s
$1e:91e4  11 98		 ora ($98),y
$1e:91e6  6b			rtl
$1e:91e7  c4 9d		 cpy $9d
$1e:91e9  e3 03		 sbc $03,s
$1e:91eb  8b			phb
$1e:91ec  54 aa 71	  mvn $71,$aa
$1e:91ef  68			pla
$1e:91f0  bb			tyx
$1e:91f1  d8			cld
$1e:91f2  22 a0 12 82   jsl $8212a0
$1e:91f6  3b			tsc
$1e:91f7  c2 17		 rep #$17
$1e:91f9  1e ad 56	  asl $56ad,x
$1e:91fc  e3 d1		 sbc $d1,s
$1e:91fe  f8			sed
$1e:91ff  c4 6a		 cpy $6a
$1e:9201  3a			dec a
$1e:9202  11 28		 ora ($28),y
$1e:9204  63 bc		 adc $bc,s
$1e:9206  1e a0 21	  asl $21a0,x
$1e:9209  87 b9		 sta [$b9]
$1e:920b  54 04 21	  mvn $21,$04
$1e:920e  fd 8e 49	  sbc $498e,x
$1e:9211  46 a2		 lsr $a2
$1e:9213  29 2a		 and #$2a
$1e:9215  8b			phb
$1e:9216  c8			iny
$1e:9217  2b			pld
$1e:9218  02 11		 cop #$11
$1e:921a  92 49		 sta ($49)
$1e:921c  88			dey
$1e:921d  a2 29 2a	  ldx #$2a29
$1e:9220  cb			wai
$1e:9221  cc 84 56	  cpy $5684
$1e:9224  f4 07 42	  pea $4207
$1e:9227  c8			iny
$1e:9228  a4 6e		 ldy $6e
$1e:922a  d0 90		 bne $91bc
$1e:922c  97 46		 sta [$46],y
$1e:922e  27 06		 and [$06]
$1e:9230  38			sec
$1e:9231  85 52		 sta $52
$1e:9233  b8			clv
$1e:9234  71 08		 adc ($08),y
$1e:9236  3c 66 0a	  bit $0a66,x
$1e:9239  71 08		 adc ($08),y
$1e:923b  a3 f0		 lda $f0,s
$1e:923d  9e 06 f4	  stz $f406,x
$1e:9240  02 e1		 cop #$e1
$1e:9242  3b			tsc
$1e:9243  c2 2c		 rep #$2c
$1e:9245  8f 2e 6f 35   sta $356f2e
$1e:9249  1e 11 70	  asl $7011,x
$1e:924c  38			sec
$1e:924d  a3 c6		 lda $c6,s
$1e:924f  3c 9f 2e	  bit $2e9f,x
$1e:9252  af 55 3e 11   lda $113e55
$1e:9256  f0 b8		 beq $9210
$1e:9258  a7 c6		 lda [$c6]
$1e:925a  bc af 6b	  ldy $6baf,x
$1e:925d  36 a2		 rol $a2,x
$1e:925f  ac af 28	  ldy $28af
$1e:9262  02 fd		 cop #$fd
$1e:9264  ad da 85	  lda $85da
$1e:9267  f1 f2		 sbc ($f2),y
$1e:9269  b9 76 ab	  lda $ab76,y
$1e:926c  c5 e5		 cmp $e5
$1e:926e  a6 17		 ldx $17
$1e:9270  ab			plb
$1e:9271  5c 03 38 bf   jml $bf3803
$1e:9275  3e 97 4e	  rol $4e97,x
$1e:9278  d5 80		 cmp $80,x
$1e:927a  c0 ff 70	  cpy #$70ff
$1e:927d  38			sec
$1e:927e  26 b8		 rol $b8
$1e:9280  2f d7 b6 e1   and $e1b6d7
$1e:9284  17 98		 ora [$98],y
$1e:9286  39 8f 99	  and $998f,y
$1e:9289  ca			dex
$1e:928a  7e 07 2e	  ror $2e07,x
$1e:928d  01 6a		 ora ($6a,x)
$1e:928f  c8			iny
$1e:9290  e4 64		 cpx $64
$1e:9292  e0 20 73	  cpx #$7320
$1e:9295  97 53		 sta [$53],y
$1e:9297  a4 0c		 ldy $0c
$1e:9299  0e 9c 03	  asl $039c
$1e:929c  25 94		 and $94
$1e:929e  ca			dex
$1e:929f  e7 39		 sbc [$39]
$1e:92a1  1c 9c 9a	  trb $9a9c
$1e:92a4  fc 7b 8e	  jsr ($8e7b,x)
$1e:92a7  d2 80		 cmp ($80)
$1e:92a9  63 be		 adc $be,s
$1e:92ab  5f 3c bf c3   eor $c3bf3c,x
$1e:92af  e3 8f		 sbc $8f,s
$1e:92b1  5f ab 3c 04   eor $043cab,x
$1e:92b5  38			sec
$1e:92b6  df 01 08 c9   cmp $c90801,x
$1e:92ba  c4 a5		 cpy $a5
$1e:92bc  a8			tay
$1e:92bd  75 28		 adc $28,x
$1e:92bf  84 73		 sty $73
$1e:92c1  82 51 bc	  brl $4f15
$1e:92c4  6a			ror a
$1e:92c5  2f 42 bb c0   and $c0bb42
$1e:92c9  46 30		 lsr $30
$1e:92cb  4f b2 1f 99   eor $991fb2
$1e:92cf  91 41		 sta ($41),y
$1e:92d1  64 4f		 stz $4f
$1e:92d3  32 21		 and ($21)
$1e:92d5  1a			inc a
$1e:92d6  04 36		 tsb $36
$1e:92d8  4f f0 28 ae   eor $ae28f0
$1e:92dc  23 51		 and $51,s
$1e:92de  8a			txa
$1e:92df  46 0c		 lsr $0c
$1e:92e1  00 1e		 brk #$1e
$1e:92e3  02 15		 cop #$15
$1e:92e5  a5 ea		 lda $ea
$1e:92e7  28			plp
$1e:92e8  69 b2 0f	  adc #$0fb2
$1e:92eb  be 6b 51	  ldx $516b,y
$1e:92ee  9b			txy
$1e:92ef  4d 95 8a	  eor $8a95
$1e:92f2  c1 9e		 cmp ($9e,x)
$1e:92f4  21 1e		 and ($1e,x)
$1e:92f6  7e c1 a8	  ror $a8c1,x
$1e:92f9  b0 32		 bcs $932d
$1e:92fb  86 c7		 stx $c7
$1e:92fd  6a			ror a
$1e:92fe  b4 5a		 ldy $5a,x
$1e:9300  4a			lsr a
$1e:9301  46 d0		 lsr $d0
$1e:9303  0d 43 40	  ora $4043
$1e:9306  2d 96 8b	  and $8b96
$1e:9309  5d aa 31	  eor $31aa,x
$1e:930c  18			clc
$1e:930d  e8			inx
$1e:930e  74 63		 stz $63,x
$1e:9310  1a			inc a
$1e:9311  4d 2b 80	  eor $802b
$1e:9314  1c e5 19	  trb $19e5
$1e:9317  6f 16 43 20   adc $204316
$1e:931b  f1 27		 sbc ($27),y
$1e:931d  42 d9		 wdm #$d9
$1e:931f  24 00		 bit $00
$1e:9321  0a			asl a
$1e:9322  90 d9		 bcc $92fd
$1e:9324  60			rts
$1e:9325  c0 f0 e7	  cpy #$e7f0
$1e:9328  73 81		 adc ($81,s),y
$1e:932a  e2 0f		 sep #$0f
$1e:932c  68			pla
$1e:932d  70 7c		 bvs $93ab
$1e:932f  24 f2		 bit $f2
$1e:9331  70 f8		 bvs $932b
$1e:9333  87 da		 sta [$da]
$1e:9335  07 16		 ora [$16]
$1e:9337  8b			phb
$1e:9338  54 aa 63	  mvn $63,$aa
$1e:933b  00 1a		 brk #$1a
$1e:933d  10 c8		 bpl $9307
$1e:933f  a0 90 b8	  ldy #$b890
$1e:9342  f4 7a b5	  pea $b57a
$1e:9345  5b			tcd
$1e:9346  20 01 10	  jsr $1001
$1e:9349  88			dey
$1e:934a  45 0c		 eor $0c
$1e:934c  87 eb		 sta [$eb]
$1e:934e  dc e8 e7	  jml [$e7e8]
$1e:9351  4d 7c 36	  eor $367c
$1e:9354  a0 e7 4f	  ldy #$4fe7
$1e:9357  eb			xba
$1e:9358  9d 6a 35	  sta $356a,x
$1e:935b  82 d8 ca	  brl $5e36
$1e:935e  dc e6 73	  jml [$73e6]
$1e:9361  02 80		 cop #$80
$1e:9363  46 6b		 lsr $6b
$1e:9365  30 f7		 bmi $935e
$1e:9367  00 4a		 brk #$4a
$1e:9369  25 32		 and $32
$1e:936b  a7 38		 lda [$38]
$1e:936d  a0 8e 33	  ldy #$338e
$1e:9370  0d 3f 8c	  ora $8c3f
$1e:9373  c2 63		 rep #$63
$1e:9375  32 73		 and ($73)
$1e:9377  8a			txa
$1e:9378  48			pha
$1e:9379  d1 a0		 cmp ($a0),y
$1e:937b  5f 03 99 14   eor $149903,x
$1e:937f  04 a0		 tsb $a0
$1e:9381  27 30		 and [$30]
$1e:9383  36 8a		 rol $8a,x
$1e:9385  09 1c e4	  ora #$e41c
$1e:9388  82 13 e8	  brl $7b9e
$1e:938b  a4 88		 ldy $88
$1e:938d  a0 65 00	  ldy #$0065
$1e:9390  49 82 34	  eor #$3482
$1e:9393  40			rti
$1e:9394  07 22		 ora [$22]
$1e:9396  8c 48 c1	  sty $c148
$1e:9399  09 0d 89	  ora #$890d
$1e:939c  83 c2		 sta $c2,s
$1e:939e  a9 5c 83	  lda #$835c
$1e:93a1  41 df		 eor ($df,x)
$1e:93a3  81 05		 sta ($05,x)
$1e:93a5  70 94		 bvs $933b
$1e:93a7  1a			inc a
$1e:93a8  28			plp
$1e:93a9  1f 43 f8 23   ora $23f843,x
$1e:93ad  40			rti
$1e:93ae  42 a2		 wdm #$a2
$1e:93b0  f0 19		 beq $93cb
$1e:93b2  0c 5c f8	  tsb $f85c
$1e:93b5  11 51		 ora ($51),y
$1e:93b7  89 41 03	  bit #$0341
$1e:93ba  e0 3f 02	  cpx #$023f
$1e:93bd  10 c7		 bpl $9386
$1e:93bf  e3 11		 sbc $11,s
$1e:93c1  a8			tay
$1e:93c2  e9 04 a1	  sbc #$a104
$1e:93c5  8f c0 3f 89   sta $893fc0
$1e:93c9  c0 23 92	  cpy #$9223
$1e:93cc  59 29 a4	  eor $a429,y
$1e:93cf  df 00 f4 1f   cmp $1ff400,x
$1e:93d3  e8			inx
$1e:93d4  94 24		 sty $24,x
$1e:93d6  92 69		 sta ($69)
$1e:93d8  30 94		 bmi $936e
$1e:93da  06 20		 asl $20
$1e:93dc  f7 22		 sbc [$22],y
$1e:93de  f8			sed
$1e:93df  8d 42 31	  sta $3142
$1e:93e2  38			sec
$1e:93e3  9d 10 c4	  sta $c410,x
$1e:93e6  d8			cld
$1e:93e7  2f a0 37 89   and $8937a0
$1e:93eb  9c 68 14	  stz $1468
$1e:93ee  23 49		 and $49,s
$1e:93f0  d6 5e		 dec $5e,x
$1e:93f2  62 38 12	  per $a62d
$1e:93f5  28			plp
$1e:93f6  5d ae f3	  eor $f3ae,x
$1e:93f9  a1 20		 lda ($20,x)
$1e:93fb  8b			phb
$1e:93fc  0c 90 54	  tsb $5490
$1e:93ff  0b			phd
$1e:9400  f5 fc		 sbc $fc,x
$1e:9402  ae 03 50	  ldx $5003
$1e:9405  16 22		 asl $22,x
$1e:9407  cc 69 18	  cpy $1869
$1e:940a  6c 3d 28	  jmp ($283d)
$1e:940d  52 83		 eor ($83)
$1e:940f  f2 29		 sbc ($29)
$1e:9411  c1 35		 cmp ($35,x)
$1e:9413  07 03		 ora [$03]
$1e:9415  48			pha
$1e:9416  a5 49		 lda $49
$1e:9418  04 e2		 tsb $e2
$1e:941a  5c 32 09 ac   jml $ac0932
$1e:941e  50 58		 bvc $9478
$1e:9420  6d 82 91	  adc $9182
$1e:9423  46 24		 lsr $24
$1e:9425  6d 94 7e	  adc $7e94
$1e:9428  04 4d		 tsb $4d
$1e:942a  d2 50		 cmp ($50)
$1e:942c  74 d8		 stz $d8,x
$1e:942e  41 5a		 eor ($5a,x)
$1e:9430  24 ee		 bit $ee
$1e:9432  27 c9		 and [$c9]
$1e:9434  20 00 78	  jsr $7800
$1e:9437  45 e0		 eor $e0
$1e:9439  76 00		 ror $00,x
$1e:943b  03 03		 ora $03,s
$1e:943d  00 09		 brk #$09
$1e:943f  ed 5c 3b	  sbc $3b5c
$1e:9442  de 9f 43	  dec $439f,x
$1e:9445  cd 7d 5e	  cmp $5e7d
$1e:9448  cf 5c 36 1f   cmp $1f365c
$1e:944c  eb			xba
$1e:944d  78			sei
$1e:944e  80 09		 bra $9459
$1e:9450  9f 61 70 7f   sta $7f7061,x
$1e:9454  03 c0		 ora $c0,s
$1e:9456  70 a1		 bvs $93f9
$1e:9458  25 7d		 and $7d
$1e:945a  f8			sed
$1e:945b  30 3b		 bmi $9498
$1e:945d  6e ff 00	  ror $00ff
$1e:9460  79 04 42	  adc $4204,y
$1e:9463  6a			ror a
$1e:9464  3b			tsc
$1e:9465  f1 67		 sbc ($67),y
$1e:9467  97 7c		 sta [$7c],y
$1e:9469  1d e5 ff	  ora $ffe5,x
$1e:946c  38			sec
$1e:946d  7a			ply
$1e:946e  07 ca		 ora [$ca]
$1e:9470  5e a3 af	  lsr $afa3,x
$1e:9473  17 8a		 ora [$8a],y
$1e:9475  1e d2 74	  asl $74d2,x
$1e:9478  50 79		 bvc $94f3
$1e:947a  bc ee f3	  ldy $f3ee,x
$1e:947d  41 bb		 eor ($bb,x)
$1e:947f  f5 16		 sbc $16,x
$1e:9481  6c ba 07	  jmp ($07ba)
$1e:9484  e8			inx
$1e:9485  72 79		 adc ($79)
$1e:9487  3d a0 17	  and $17a0,x
$1e:948a  bc fc 09	  ldy $09fc,x
$1e:948d  e1 5f		 sbc ($5f,x)
$1e:948f  13 78		 ora ($78,s),y
$1e:9491  df c9 1e 59   cmp $591ec9,x
$1e:9495  f3 57		 sbc ($57,s),y
$1e:9497  9e fd 19	  stz $19fd,x
$1e:949a  e9 df f3	  sbc #$f3df
$1e:949d  f7 f6		 sbc [$f6],y
$1e:949f  5b			tcd
$1e:94a0  cd eb ca	  cmp $caeb
$1e:94a3  77 ce		 adc [$ce],y
$1e:94a5  f0 df		 beq $9486
$1e:94a7  80 42		 bra $94eb
$1e:94a9  84 02		 sty $02
$1e:94ab  60			rts
$1e:94ac  08			php
$1e:94ad  3b			tsc
$1e:94ae  c2 07		 rep #$07
$1e:94b0  16 8b		 asl $8b,x
$1e:94b2  52 82		 eor ($82)
$1e:94b4  4d 04 dd	  eor $dd04
$1e:94b7  bb			tyx
$1e:94b8  c2 17		 rep #$17
$1e:94ba  1e 8f 54	  asl $548f,x
$1e:94bd  84 4d		 sty $4d
$1e:94bf  0c 07 0c	  tsb $0c07
$1e:94c2  3e c1 ba	  rol $bac1,x
$1e:94c5  dd 4a 65	  cmp $654a,x
$1e:94c8  03 53		 ora $53,s
$1e:94ca  b0 43		 bcs $950f
$1e:94cc  43 c1		 eor $c1,s
$1e:94ce  4a			lsr a
$1e:94cf  8b			phb
$1e:94d0  da			phx
$1e:94d1  37 5c		 and [$5c],y
$1e:94d3  2b			pld
$1e:94d4  1f 17 8b cc   ora $cc8b17,x
$1e:94d8  b0 da		 bcs $94b4
$1e:94da  a5 16		 lda $16
$1e:94dc  8b			phb
$1e:94dd  cd ef bf	  cmp $bfef
$1e:94e0  52 8f		 eor ($8f)
$1e:94e2  da			phx
$1e:94e3  f8			sed
$1e:94e4  5c 7b 47 13   jml $13477b
$1e:94e8  89 6b da	  bit #$da6b
$1e:94eb  6d 07 62	  adc $6207
$1e:94ee  0e 0e 50	  asl $500e
$1e:94f1  d8			cld
$1e:94f2  38			sec
$1e:94f3  dc 7b 5f	  jml [$5f7b]
$1e:94f6  0f 86 35 2b   ora $2b3586
$1e:94fa  40			rti
$1e:94fb  f4 79 03	  pea $0379
$1e:94fe  55 1c		 eor $1c,x
$1e:9500  19 34 4c	  ora $4c34,y
$1e:9503  02 72		 cop #$72
$1e:9505  73 60		 adc ($60,s),y
$1e:9507  03 80		 ora $80,s
$1e:9509  e1 70		 sbc ($70,x)
$1e:950b  dd 91 ff	  cmp $ff91,x
$1e:950e  22 b1 6e ff   jsl $ff6eb1
$1e:9512  34 e3		 bit $e3,x
$1e:9514  36 b8		 rol $b8,x
$1e:9516  ec 7b 9d	  cpx $9d7b
$1e:9519  d5 24		 cmp $24,x
$1e:951b  89 c6 7a	  bit #$7ac6
$1e:951e  dd 02 30	  cmp $3002,x
$1e:9521  1c 5e c7	  trb $c75e
$1e:9524  62 b0 f3	  per $88d7
$1e:9527  f9 a6 60	  sbc $60a6,y
$1e:952a  41 c4		 eor ($c4,x)
$1e:952c  16 0d		 asl $0d,x
$1e:952e  da			phx
$1e:952f  b8			clv
$1e:9530  77 bd		 adc [$bd],y
$1e:9532  3e 87 9a	  rol $9a87,x
$1e:9535  fa			plx
$1e:9536  bd 9e b8	  lda $b89e,x
$1e:9539  6c 3f d6	  jmp ($d63f)
$1e:953c  f1 00		 sbc ($00),y
$1e:953e  13 3e		 ora ($3e,s),y
$1e:9540  c2 e0		 rep #$e0
$1e:9542  fe 07 80	  inc $8007,x
$1e:9545  e1 42		 sbc ($42,x)
$1e:9547  4a			lsr a
$1e:9548  fb			xce
$1e:9549  f0 60		 beq $95ab
$1e:954b  76 dd		 ror $dd,x
$1e:954d  fe 00 f2	  inc $f200,x
$1e:9550  08			php
$1e:9551  84 d4		 sty $d4
$1e:9553  77 e2		 adc [$e2],y
$1e:9555  cf 2e f8 3b   cmp $3bf82e
$1e:9559  e1 e6		 sbc ($e6,x)
$1e:955b  0f 38 fa 0b   ora $0bfa38
$1e:955f  ca			dex
$1e:9560  7e a4 9f	  ror $9fa4,x
$1e:9563  17 8a		 ora [$8a],y
$1e:9565  1e d2 74	  asl $74d2,x
$1e:9568  50 79		 bvc $95e3
$1e:956a  bc ee f3	  ldy $f3ee,x
$1e:956d  41 bb		 eor ($bb,x)
$1e:956f  f5 16		 sbc $16,x
$1e:9571  6c ba 07	  jmp ($07ba)
$1e:9574  e8			inx
$1e:9575  72 79		 adc ($79)
$1e:9577  3d a0 17	  and $17a0,x
$1e:957a  bc fc 09	  ldy $09fc,x
$1e:957d  e1 5f		 sbc ($5f,x)
$1e:957f  61 27		 adc ($27,x)
$1e:9581  8f c9 e5 17   sta $17e5c9
$1e:9585  d7 ab		 cmp [$ab],y
$1e:9587  ac 7c 01	  ldy $017c
$1e:958a  fd 7a b9	  sbc $b97a,x
$1e:958d  e8			inx
$1e:958e  c0 27 df	  cpy #$df27
$1e:9591  b7 dd		 lda [$dd],y
$1e:9593  ef 0f f8 c3   sbc $c3f80f
$1e:9597  c8			iny
$1e:9598  3e 52 f5	  rol $f552,x
$1e:959b  1d 75 fa	  ora $fa75,x
$1e:959e  b2 99		 lda ($99)
$1e:95a0  43 c5		 eor $c5,s
$1e:95a2  ec 10 dd	  cpx $dd10
$1e:95a5  97 7f		 sta [$7f],y
$1e:95a7  94 f2		 sty $f2,x
$1e:95a9  89 45 a2	  bit #$a245
$1e:95ac  1b			tcs
$1e:95ad  bf ef f2 1e   lda $1ef2ef,x
$1e:95b1  37 bb		 and [$bb],y
$1e:95b3  7f e5 e6 f6   adc $f6e6e5,x
$1e:95b7  0f d0 70 00   ora $0070d0
$1e:95bb  30 3c		 bmi $95f9
$1e:95bd  1c d7 8d	  trb $8dd7
$1e:95c0  0b			phd
$1e:95c1  43 9d		 eor $9d,s
$1e:95c3  d5 00		 cmp $00,x
$1e:95c5  e7 58		 sbc [$58]
$1e:95c7  03 21		 ora $21,s
$1e:95c9  b2 e7		 lda ($e7)
$1e:95cb  f3 5e		 sbc ($5e,s),y
$1e:95cd  41 c6		 eor ($c6,x)
$1e:95cf  e3 ed		 sbc $ed,s
$1e:95d1  78			sei
$1e:95d2  f6 3e		 inc $3e,x
$1e:95d4  a5 87		 lda $87
$1e:95d6  a8			tay
$1e:95d7  2b			pld
$1e:95d8  27 79		 and [$79]
$1e:95da  6d 52 63	  adc $6352
$1e:95dd  68			pla
$1e:95de  e8			inx
$1e:95df  f4 fa 23	  pea $23fa
$1e:95e2  b3 e5		 lda ($e5,s),y
$1e:95e4  da			phx
$1e:95e5  65 29		 adc $29
$1e:95e7  32 b5		 and ($b5)
$1e:95e9  f4 ba 7d	  pea $7dba
$1e:95ec  22 59 de a0   jsl $a0de59
$1e:95f0  e5 2b		 sbc $2b
$1e:95f2  ef ec a1 f6   sbc $f6a1ec
$1e:95f6  2b			pld
$1e:95f7  0b			phd
$1e:95f8  09 b6 c9	  ora #$c9b6
$1e:95fb  d1 d9		 cmp ($d9),y
$1e:95fd  44 e0 d0	  mvp $d0,$e0
$1e:9600  6b			rtl
$1e:9601  d3 49		 cmp ($49,s),y
$1e:9603  a2 81 e0	  ldx #$e081
$1e:9606  d9 6f dc	  cmp $dc6f,y
$1e:9609  21 7b		 and ($7b,x)
$1e:960b  71 33		 adc ($33),y
$1e:960d  84 3b		 sty $3b
$1e:960f  57 0e		 eor [$0e],y
$1e:9611  f7 a7		 sbc [$a7],y
$1e:9613  d0 f3		 bne $9608
$1e:9615  5f 57 b3 d7   eor $d7b357,x
$1e:9619  0d 87 fa	  ora $fa87
$1e:961c  de 20 02	  dec $0220,x
$1e:961f  67 d8		 adc [$d8]
$1e:9621  5c 1f c0 f0   jml $f0c01f
$1e:9625  1c 28 49	  trb $4928
$1e:9628  5f 7e 0c 0e   eor $0e0c7e,x
$1e:962c  db			stp
$1e:962d  bf c0 1e 41   lda $411ec0,x
$1e:9631  10 9a		 bpl $95cd
$1e:9633  8e fc 59	  stx $59fc
$1e:9636  e5 df		 sbc $df
$1e:9638  07 79		 ora [$79]
$1e:963a  7f ce 1e 81   adc $811ece,x
$1e:963e  f2 97		 sbc ($97)
$1e:9640  a8			tay
$1e:9641  eb			xba
$1e:9642  c5 e2		 cmp $e2
$1e:9644  87 b4		 sta [$b4]
$1e:9646  9d 14 1e	  sta $1e14,x
$1e:9649  6f 3b bc d0   adc $d0bc3b
$1e:964d  6e fd 45	  ror $45fd
$1e:9650  9b			txy
$1e:9651  2e 81 fa	  rol $fa81
$1e:9654  1c 9e 4f	  trb $4f9e
$1e:9657  68			pla
$1e:9658  05 ef		 ora $ef
$1e:965a  3f 02 78 57   and $577802,x
$1e:965e  c4 de		 cpy $de
$1e:9660  37 f2		 and [$f2],y
$1e:9662  47 96		 eor [$96]
$1e:9664  7c d5 e7	  jmp ($e7d5,x)
$1e:9667  bf 46 7a 77   lda $777a46,x
$1e:966b  fc fd fd	  jsr ($fdfd,x)
$1e:966e  96 f3		 stx $f3,y
$1e:9670  7a			ply
$1e:9671  f2 9d		 sbc ($9d)
$1e:9673  f3 bc		 sbc ($bc,s),y
$1e:9675  37 f7		 and [$f7],y
$1e:9677  bd f8 06	  lda $06f8,x
$1e:967a  5d fe 00	  eor $00fe,x
$1e:967d  00 1d		 brk #$1d
$1e:967f  6f c1 fe 00   adc $00fec1
$1e:9683  f1 8f		 sbc ($8f),y
$1e:9685  88			dey
$1e:9686  bc 67 e4	  ldy $e467,x
$1e:9689  4f 2a f9 9b   eor $9bf92a
$1e:968d  ce fe 88	  dec $88fe
$1e:9690  f4 cf b9	  pea $b9cf
$1e:9693  cc 01 05	  cpy $0501
$1e:9696  00 05		 brk #$05
$1e:9698  9e cf 30	  stz $30cf,x
$1e:969b  38			sec
$1e:969c  19 65 16	  ora $1665,y
$1e:969f  1c f5 1a	  trb $1af5
$1e:96a2  24 b5		 bit $b5
$1e:96a4  e2 0e		 sep #$0e
$1e:96a6  f0 96		 beq $963e
$1e:96a8  cb			wai
$1e:96a9  1e 21 34	  asl $3421,x
$1e:96ac  a6 bd		 ldx $bd
$1e:96ae  4a			lsr a
$1e:96af  99 35 78	  sta $7835,y
$1e:96b2  83 fc		 sta $fc,s
$1e:96b4  9e 61 2e	  stz $2e61,x
$1e:96b7  9b			txy
$1e:96b8  f9 7c 7e	  sbc $7e7c,y
$1e:96bb  4f 3c da 5e   eor $5eda3c
$1e:96bf  f9 20 09	  sbc $0920,y
$1e:96c2  4f a7 f1 79   eor $79f1a7
$1e:96c6  b4 de		 ldy $de,x
$1e:96c8  2a			rol a
$1e:96c9  23 00		 and $00,s
$1e:96cb  49 51 02	  eor #$0251
$1e:96ce  43 57		 eor $57,s
$1e:96d0  b3 c7		 lda ($c7,s),y
$1e:96d2  c4 61		 cpy $61
$1e:96d4  1d 19 80	  ora $8019,x
$1e:96d7  64 68		 stz $68
$1e:96d9  b4 c1		 ldy $c1,x
$1e:96db  10 d7		 bpl $96b4
$1e:96dd  ed f5 5a	  sbc $5af5
$1e:96e0  35 1e		 and $1e,x
$1e:96e2  aa			tax
$1e:96e3  43 01		 eor $01,s
$1e:96e5  48			pha
$1e:96e6  d3 44		 cmp ($44,s),y
$1e:96e8  c0 39 19	  cpy #$1939
$1e:96eb  bd 76 9d	  lda $9d76,x
$1e:96ee  4f ae 93 d0   eor $d093ae
$1e:96f2  82 42 30	  brl $c737
$1e:96f5  8c 4e 27	  sty $274e
$1e:96f8  51 92		 eor ($92),y
$1e:96fa  fa			plx
$1e:96fb  14 48		 trb $48
$1e:96fd  8c 11 8a	  sty $8a11
$1e:9700  05 0a		 ora $0a
$1e:9702  34 46		 bit $46,x
$1e:9704  02 79		 cop #$79
$1e:9706  12 48		 ora ($48)
$1e:9708  ac 13 8b	  ldy $8b13
$1e:970b  b5 de		 lda $de,x
$1e:970d  74 56		 stz $56,x
$1e:970f  02 09		 cop #$09
$1e:9711  1c 4f fb	  trb $fb4f
$1e:9714  48			pha
$1e:9715  c3 61		 cmp $61,s
$1e:9717  e9 5f d8	  sbc #$d85f
$1e:971a  c9 e4 90	  cmp #$90e4
$1e:971d  25 18		 and $18
$1e:971f  51 81		 eor ($81),y
$1e:9721  d8			cld
$1e:9722  14 61		 trb $61
$1e:9724  1a			inc a
$1e:9725  44 91 cc	  mvp $cc,$91
$1e:9728  63 12		 adc $12,s
$1e:972a  b5 18		 lda $18,x
$1e:972c  52 29		 eor ($29)
$1e:972e  4b			phk
$1e:972f  22 4d 0a 84   jsl $840a4d
$1e:9733  65 12		 adc $12
$1e:9735  99 54 63	  sta $6354,y
$1e:9738  23 91		 and $91,s
$1e:973a  61 12		 adc ($12,x)
$1e:973c  a8			tay
$1e:973d  64 f1		 stz $f1
$1e:973f  c9 2c c2	  cmp #$c22c
$1e:9742  63 32		 adc $32,s
$1e:9744  8c 65 32	  sty $3265
$1e:9747  ad 21 68	  lda $6821
$1e:974a  04 66		 tsb $66
$1e:974c  4f 27 92 49   eor $499227
$1e:9750  94 63		 sty $63,x
$1e:9752  18			clc
$1e:9753  f9 7c d4	  sbc $d47c,y
$1e:9756  62 e0 06	  per $9e39
$1e:9759  e8			inx
$1e:975a  bb			tyx
$1e:975b  84 cc		 sty $cc
$1e:975d  0e 52 33	  asl $3352
$1e:9760  03 b8		 ora $b8,s
$1e:9762  a2 d1 68	  ldx #$68d1
$1e:9765  24 9e		 bit $9e
$1e:9767  80 87		 bra $96f0
$1e:9769  07 30		 ora [$30]
$1e:976b  21 42		 and ($42,x)
$1e:976d  85 27		 sta $27
$1e:976f  81 bf		 sta ($bf,x)
$1e:9771  c2 3d		 rep #$3d
$1e:9773  1e 86 00	  asl $0086,x
$1e:9776  82 67 42	  brl $d9e0
$1e:9779  73 00		 adc ($00,s),y
$1e:977b  4c 64 f0	  jmp $f064
$1e:977e  b0 78		 bcs $97f8
$1e:9780  40			rti
$1e:9781  39 f0 d9	  and $d9f0,y
$1e:9784  3d 22 93	  and $9322,x
$1e:9787  4a			lsr a
$1e:9788  73 00		 adc ($00,s),y
$1e:978a  8c 64 f0	  sty $f064
$1e:978d  fe 3c 00	  inc $003c,x
$1e:9790  3e 4e e1	  rol $e14e,x
$1e:9793  73 03		 adc ($03,s),y
$1e:9795  b8			clv
$1e:9796  85 87		 sta $87
$1e:9798  15 8b		 ora $8b,x
$1e:979a  73 40		 adc ($40,s),y
$1e:979c  00 e6		 brk #$e6
$1e:979e  00 60		 brk #$60
$1e:97a0  10 c2		 bpl $9764
$1e:97a2  2e 2d 28	  rol $282d
$1e:97a5  ec 7b aa	  cpx $aa7b
$1e:97a8  10 07		 bpl $97b1
$1e:97aa  30 07		 bmi $97b3
$1e:97ac  00 a6		 brk #$a6
$1e:97ae  11 f1		 ora ($f1),y
$1e:97b0  68			pla
$1e:97b1  e6 bb		 inc $bb
$1e:97b3  c6 10		 dec $10
$1e:97b5  ef c3 5c c1   sbc $c15cc3
$1e:97b9  0f eb 98 47   ora $4798eb
$1e:97bd  36 1f		 rol $1f,x
$1e:97bf  08			php
$1e:97c0  2c 1a 0d	  bit $0d1a
$1e:97c3  ce 83 45	  dec $4583
$1e:97c6  0c c2 2d	  tsb $2dc2
$1e:97c9  13 d0		 ora ($d0,s),y
$1e:97cb  8c 10 6a	  sty $6a10
$1e:97ce  30 fe		 bmi $97ce
$1e:97d0  67 29		 adc [$29]
$1e:97d2  14 42		 trb $42
$1e:97d4  01 d3		 ora ($d3,x)
$1e:97d6  4e 27 20	  lsr $2027
$1e:97d9  51 87		 eor ($87),y
$1e:97db  f5 3a		 sbc $3a,x
$1e:97dd  49 a2 10	  eor #$10a2
$1e:97e0  0e 9c 26	  asl $269c
$1e:97e3  70 fd		 bvs $97e2
$1e:97e5  09 e9 b4	  ora #$b4e9
$1e:97e8  c2 33		 rep #$33
$1e:97ea  3c 46 9d	  bit $9d46,x
$1e:97ed  06 87		 asl $87
$1e:97ef  97 d3		 sta [$d3],y
$1e:97f1  34 45		 bit $45,x
$1e:97f3  6d 9f d4	  adc $d49f
$1e:97f6  2e 34 d1	  rol $d134
$1e:97f9  33 0c		 and ($0c,s),y
$1e:97fb  11 53		 ora ($53),y
$1e:97fd  5b			tcd
$1e:97fe  4f c0 85 13   eor $1385c0
$1e:9802  39 0c 1a	  and $1a0c,y
$1e:9805  0f c7 47 96   ora $9647c7
$1e:9809  9d a8 48	  sta $48a8,x
$1e:980c  13 3c		 ora ($3c,s),y
$1e:980e  02 7c		 cop #$7c
$1e:9810  88			dey
$1e:9811  40			rti
$1e:9812  85 12		 sta $12
$1e:9814  10 b0		 bpl $97c6
$1e:9816  80 7a		 bra $9892
$1e:9818  68			pla
$1e:9819  24 93		 bit $93
$1e:981b  ce 27 41	  dec $4127
$1e:981e  20 1e 8c	  jsr $8c1e
$1e:9821  56 2d		 lsr $2d,x
$1e:9823  16 e6		 asl $e6,x
$1e:9825  c5 a0		 cmp $a0
$1e:9827  89 60 9c	  bit #$9c60
$1e:982a  5d ae f3	  eor $f3ae,x
$1e:982d  a1 e1		 lda ($e1,x)
$1e:982f  47 63		 eor [$63]
$1e:9831  d1 ee		 cmp ($ee),y
$1e:9833  ac 7a 18	  ldy $187a
$1e:9836  96 0a		 stx $0a,y
$1e:9838  46 1b		 lsr $1b
$1e:983a  0f 4a 1e 0e   ora $0e1e4a
$1e:983e  6b			rtl
$1e:983f  bc 80 1e	  ldy $1e80,x
$1e:9842  fc 34 6c	  jsr ($6c34,x)
$1e:9845  34 0a		 bit $0a,x
$1e:9847  13 90		 ora ($90,s),y
$1e:9849  17 0e		 ora [$0e],y
$1e:984b  66 78		 ror $78
$1e:984d  28			plp
$1e:984e  ac 14 03	  ldy $0314
$1e:9851  14 3b		 trb $3b
$1e:9853  39 41 06	  and $0641,y
$1e:9856  a5 48		 lda $48
$1e:9858  a5 16		 lda $16
$1e:985a  c9 5e e4	  cmp #$e45e
$1e:985d  85 57		 sta $57
$1e:985f  c0 e5 15	  cpy #$15e5
$1e:9862  ef 03 31 0c   sbc $0c3103
$1e:9866  5a			phy
$1e:9867  2f c7 30 19   and $1930c7
$1e:986b  90 a1		 bcc $980e
$1e:986d  67 21		 adc [$21]
$1e:986f  8f 47 f8 e7   sta $e7f847
$1e:9873  03 3a		 ora $3a,s
$1e:9875  14 3f		 trb $3f
$1e:9877  ae 80 2c	  ldx $2c80
$1e:987a  da			phx
$1e:987b  00 90		 brk #$90
$1e:987d  66 8d		 ror $8d
$1e:987f  54 7b a3	  mvn $a3,$7b
$1e:9882  57 94		 eor [$94],y
$1e:9884  2f 2e 58 54   and $54582e
$1e:9888  b9 82 f3	  lda $f382,y
$1e:988b  e9 0f cb	  sbc #$cb0f
$1e:988e  a6 15		 ldx $15
$1e:9890  2e a0 fc	  rol $fca0
$1e:9893  d1 e7		 cmp ($e7),y
$1e:9895  a0 0a 96	  ldy #$960a
$1e:9898  84 35		 sty $35
$1e:989a  e2 bf		 sep #$bf
$1e:989c  1e 79 37	  asl $3779,x
$1e:989f  cb			wai
$1e:98a0  de 5f e8	  dec $e85f,x
$1e:98a3  32 fc		 and ($fc)
$1e:98a5  39 cb f0	  and $f0cb,y
$1e:98a8  8a			txa
$1e:98a9  74 3a		 stz $3a,x
$1e:98ab  31 36		 and ($36),y
$1e:98ad  01 c1		 ora ($c1,x)
$1e:98af  9c 09 27	  stz $2709
$1e:98b2  8d c6 d9	  sta $d9c6
$1e:98b5  eb			xba
$1e:98b6  af 6f 9b 54   lda $549b6f
$1e:98ba  9b			txy
$1e:98bb  e9 f9		 sbc #$f9
$1e:98bd  d3 bc		 cmp ($bc,s),y
$1e:98bf  05 55		 ora $55
$1e:98c1  10 07		 bpl $98ca
$1e:98c3  81 3c		 sta ($3c,x)
$1e:98c5  ea			nop
$1e:98c6  31 19		 and ($19),y
$1e:98c8  7a			ply
$1e:98c9  48			pha
$1e:98ca  33 c3		 and ($c3,s),y
$1e:98cc  be 2e 08	  ldx $082e,y
$1e:98cf  d0 87		 bne $9858
$1e:98d1  09 de		 ora #$de
$1e:98d3  5f f3 87 a0   eor $a087f3,x
$1e:98d7  7d 25 ea	  adc $ea25,x
$1e:98da  3f 5a 7b 17   and $177b5a,x
$1e:98de  da			phx
$1e:98df  de e7 50	  dec $50e7,x
$1e:98e2  02 02		 cop #$02
$1e:98e4  00 04		 brk #$04
$1e:98e6  87 3b		 sta [$3b]
$1e:98e8  d2 1f		 cmp ($1f)
$1e:98ea  19 86 bb	  ora $bb86,y
$1e:98ed  d6 07		 dec $07,x
$1e:98ef  16 a9		 asl $a9,x
$1e:98f1  54 e2 d1	  mvn $d1,$e2
$1e:98f4  68			pla
$1e:98f5  bc 66 2a	  ldy $2a66,x
$1e:98f8  04 00		 tsb $00
$1e:98fa  11 43		 ora ($43),y
$1e:98fc  a1 71		 lda ($71,x)
$1e:98fe  ea			nop
$1e:98ff  d5 6e		 cmp $6e,x
$1e:9901  3d 1e 8f	  and $8f1e,x
$1e:9904  c6 a3		 dec $a3
$1e:9906  a1 40		 lda ($40,x)
$1e:9908  09 13		 ora #$13
$1e:990a  d4 3f		 pei ($3f)
$1e:990c  b1 81		 lda ($81),y
$1e:990e  10 47		 bpl $9957
$1e:9910  24 a2		 bit $a2
$1e:9912  20 ef 77	  jsr $77ef
$1e:9915  af 17 9b d7   lda $d79b17
$1e:9919  79 ea 02	  adc $02ea,y
$1e:991c  52 92		 eor ($92)
$1e:991e  49 84		 eor #$84
$1e:9920  41 00		 eor ($00,x)
$1e:9922  80 60		 bra $9984
$1e:9924  35 f8		 and $f8,x
$1e:9926  28			plp
$1e:9927  04 3a		 tsb $3a
$1e:9929  a0 35		 ldy #$35
$1e:992b  01 29		 ora ($29,x)
$1e:992d  6b			rtl
$1e:992e  c7 05		 cmp [$05]
$1e:9930  ae 1e 8d	  ldx $8d1e
$1e:9933  60			rts
$1e:9934  66 7a		 ror $7a
$1e:9936  fd 70 e0	  sbc $e070,x
$1e:9939  f1 43		 sbc ($43),y
$1e:993b  e0 18		 cpx #$18
$1e:993d  19 58 08	  ora $0858,y
$1e:9940  e7 81		 sbc [$81]
$1e:9942  84 f9		 sty $f9
$1e:9944  9e a0 35	  stz $35a0,x
$1e:9947  23 99		 and $99,s
$1e:9949  0e 43 47	  asl $4743
$1e:994c  91 89		 sta ($89),y
$1e:994e  78			sei
$1e:994f  9e a1 3b	  stz $3ba1,x
$1e:9952  b6 e1		 ldx $e1,y
$1e:9954  2f 17 a4 08   and $08a417
$1e:9958  5b			tcd
$1e:9959  47 21		 eor [$21]
$1e:995b  9d e4 72	  sta $72e4,x
$1e:995e  73 23		 adc ($23,s),y
$1e:9960  f0 e3		 beq $9945
$1e:9962  8e 44 7a	  stx $7a44
$1e:9965  09 62		 ora #$62
$1e:9967  c7 7c		 cmp [$7c]
$1e:9969  3e 38 f2	  rol $f238,x
$1e:996c  78			sei
$1e:996d  24 76		 bit $76
$1e:996f  1e a1 f5	  asl $f5a1,x
$1e:9972  97 a4		 sta [$a4],y
$1e:9974  df 49 a5 4f   cmp $4fa549,x
$1e:9978  02 41		 cop #$41
$1e:997a  85 60		 sta $60
$1e:997c  2c 0c 86	  bit $860c
$1e:997f  43 37		 eor $37,s
$1e:9981  0e 77 ec	  asl $ec77
$1e:9984  5a			phy
$1e:9985  a5 53		 lda $53
$1e:9987  8b			phb
$1e:9988  00 80		 brk #$80
$1e:998a  00 d0		 brk #$d0
$1e:998c  48			pha
$1e:998d  74 7a		 stz $7a,x
$1e:998f  b5 5b		 lda $5b,x
$1e:9991  8f 04 80 20   sta $208004
$1e:9995  d0 c8		 bne $995f
$1e:9997  77 78		 adc [$78],y
$1e:9999  3f 5d f8 6c   and $6cf85d,x
$1e:999d  39 2c 62	  and $622c,y
$1e:99a0  f6 e7		 inc $e7,x
$1e:99a2  8b			phb
$1e:99a3  52 c5		 eor ($c5)
$1e:99a5  60			rts
$1e:99a6  22 25 8f 9f   jsl $9f8f25
$1e:99aa  51 17		 eor ($17),y
$1e:99ac  1d 92 d9	  ora $d992,x
$1e:99af  68			pla
$1e:99b0  b4 95		 ldy $95,x
$1e:99b2  0a			asl a
$1e:99b3  d7 cf		 cmp [$cf],y
$1e:99b5  ac c3 be	  ldy $bec3
$1e:99b8  e5 f1		 sbc $f1
$1e:99ba  ba			tsx
$1e:99bb  c2 0e		 rep #$0e
$1e:99bd  c2 65		 rep #$65
$1e:99bf  08			php
$1e:99c0  c9 6c 05	  cmp #$056c
$1e:99c3  a1 f6		 lda ($f6,x)
$1e:99c5  37 8d		 and [$8d],y
$1e:99c7  d2 20		 cmp ($20)
$1e:99c9  65 2f		 adc $2f
$1e:99cb  e9 a8 fa	  sbc #$faa8
$1e:99ce  c7 f1		 cmp [$f1]
$1e:99d0  cc 4e ed	  cpy $ed4e
$1e:99d3  b6 dc		 ldx $dc,y
$1e:99d5  21 a1		 and ($a1,x)
$1e:99d7  45 ee		 eor $ee
$1e:99d9  65 08		 adc $08
$1e:99db  d5 94		 cmp $94,x
$1e:99dd  98			tya
$1e:99de  ae 82 80	  ldx $8082
$1e:99e1  70 38		 bvs $9a1b
$1e:99e3  3c 2c 99	  bit $992c,x
$1e:99e6  70 58		 bvs $9a40
$1e:99e8  c5 88		 cmp $88
$1e:99ea  d6 60		 dec $60,x
$1e:99ec  5c a3 c3 1d   jml $1dc3a3
$1e:99f0  3d 2f 01	  and $012f,x
$1e:99f3  af 5b 5d e3   lda $e35d5b
$1e:99f7  55 ae		 eor $ae,x
$1e:99f9  5b			tcd
$1e:99fa  5a			phy
$1e:99fb  cc 18 ac	  cpy $ac18
$1e:99fe  4d 08 75	  eor $7508
$1e:9a01  63 8f		 adc $8f,s
$1e:9a03  00 e2		 brk #$e2
$1e:9a05  64 72		 stz $72
$1e:9a07  3d d5 90	  and $90d5,x
$1e:9a0a  62 56 80	  per $1a63
$1e:9a0d  b5 18		 lda $18,x
$1e:9a0f  74 3d		 stz $3d,x
$1e:9a11  e2 18		 sep #$18
$1e:9a13  ee 47 27	  inc $2747
$1e:9a16  1f 00 9d e1   ora $e19d00,x
$1e:9a1a  30 18		 bmi $9a34
$1e:9a1c  2c 8c 4b	  bit $4b8c
$1e:9a1f  cc ff 3f	  cpy $3fff
$1e:9a22  87 c4		 sta [$c4]
$1e:9a24  0c 09 30	  tsb $3009
$1e:9a27  05 06		 ora $06
$1e:9a29  53 2b		 eor ($2b,s),y
$1e:9a2b  e2 07		 sep #$07
$1e:9a2d  ce 23 15	  dec $1523
$1e:9a30  f2 f9		 sbc ($f9)
$1e:9a32  e6 61		 inc $61
$1e:9a34  d5 00		 cmp $00,x
$1e:9a36  8b			phb
$1e:9a37  82 00 58	  brl $f23a
$1e:9a3a  18			clc
$1e:9a3b  f7 79		 sbc [$79],y
$1e:9a3d  04 c7		 tsb $c7
$1e:9a3f  cc 5f 31	  cpy $315f
$1e:9a42  e1 00		 sbc ($00,x)
$1e:9a44  0b			phd
$1e:9a45  49 a5 f1	  eor #$f1a5
$1e:9a48  1b			tcs
$1e:9a49  cf a1 d1 27   cmp $27d1a1
$1e:9a4d  0e 16 c1	  asl $c116
$1e:9a50  9e c8 19	  stz $19c8,x
$1e:9a53  06 fa		 asl $fa
$1e:9a55  68			pla
$1e:9a56  3c 5b fc	  bit $fc5b,x
$1e:9a59  2d 96 8b	  and $8b96
$1e:9a5c  4a			lsr a
$1e:9a5d  60			rts
$1e:9a5e  13 20		 ora ($20,s),y
$1e:9a60  72 03		 adc ($03)
$1e:9a62  88			dey
$1e:9a63  db			stp
$1e:9a64  2d 62 f0	  and $f062
$1e:9a67  8c 4a d3	  sty $d34a
$1e:9a6a  01 af		 ora ($af,x)
$1e:9a6c  42 0a		 wdm #$0a
$1e:9a6e  08			php
$1e:9a6f  4e c1 65	  lsr $65c1
$1e:9a72  77 84		 adc [$84],y
$1e:9a74  a2 53		 ldx #$53
$1e:9a76  2a			rol a
$1e:9a77  3a			dec a
$1e:9a78  07 f6		 ora [$f6]
$1e:9a7a  30 91		 bmi $9a0d
$1e:9a7c  38			sec
$1e:9a7d  4d cd fe	  eor $fecd
$1e:9a80  13 09		 ora ($09,s),y
$1e:9a82  8c c9 08	  sty $08c9
$1e:9a85  4a			lsr a
$1e:9a86  12 8c		 ora ($8c)
$1e:9a88  44 6e 4f	  mvp $4f,$6e
$1e:9a8b  f0 3a		 beq $9ac7
$1e:9a8d  0a			asl a
$1e:9a8e  c6 05		 dec $05
$1e:9a90  c1 0f		 cmp ($0f,x)
$1e:9a92  90 30		 bcc $9ac4
$1e:9a94  4a			lsr a
$1e:9a95  45 23		 eor $23
$1e:9a97  60			rts
$1e:9a98  9c 83 37	  stz $3783
$1e:9a9b  0e 89 c1	  asl $c189
$1e:9a9e  aa			tax
$1e:9a9f  95 c8		 sta $c8,x
$1e:9aa1  34 1a		 bit $1a,x
$1e:9aa3  0f 19 82 b5   ora $b58219
$1e:9aa7  01 a4		 ora ($a4,x)
$1e:9aa9  50 e6		 bvc $9a91
$1e:9aab  fa			plx
$1e:9aac  43 e3		 eor $e3,s
$1e:9aae  30 d6		 bmi $9a86
$1e:9ab0  fa			plx
$1e:9ab1  09 c6 01	  ora #$01c6
$1e:9ab4  4b			phk
$1e:9ab5  c4 60		 cpy $60
$1e:9ab7  70 42		 bvs $9afb
$1e:9ab9  70 e1		 bvs $9a9c
$1e:9abb  89 c3 9f	  bit #$9fc3
$1e:9abe  59 87 11	  eor $1187,y
$1e:9ac1  ce 10 f5	  dec $f510
$1e:9ac4  67 40		 adc [$40]
$1e:9ac6  15 ce		 ora $ce,x
$1e:9ac8  21 89		 and ($89,x)
$1e:9aca  c5 01		 cmp $01
$1e:9acc  db			stp
$1e:9acd  ac 1f 1c	  ldy $1c1f
$1e:9ad0  c4 ee		 cpy $ee
$1e:9ad2  db			stp
$1e:9ad3  6d 03 b3	  adc $b303
$1e:9ad6  c0 6c		 cpy #$6c
$1e:9ad8  56 01		 lsr $01,x
$1e:9ada  99 f0 c6	  sta $c6f0,y
$1e:9add  61 cf		 adc ($cf,x)
$1e:9adf  a8			tay
$1e:9ae0  bb			tyx
$1e:9ae1  8a			txa
$1e:9ae2  d4 7a		 pei ($7a)
$1e:9ae4  23 90		 and $90,s
$1e:9ae6  71 4e		 adc ($4e),y
$1e:9ae8  40			rti
$1e:9ae9  fc 11 f9	  jsr ($f911,x)
$1e:9aec  2c 5c 58	  bit $585c
$1e:9aef  96 a8		 stx $a8,y
$1e:9af1  e4 95		 cpx $95
$1e:9af3  14 06		 trb $06
$1e:9af5  30 34		 bmi $9b2b
$1e:9af7  01 6d		 ora ($6d,x)
$1e:9af9  a4 92		 ldy $92
$1e:9afb  64 50		 stz $50
$1e:9afd  1c c0 f0	  trb $f0c0
$1e:9b00  05 b5		 ora $b5
$1e:9b02  b2 2c		 lda ($2c)
$1e:9b04  4f fb 18 12   eor $1218fb
$1e:9b08  00 f0		 brk #$f0
$1e:9b0a  7e a8 f1	  ror $f1a8,x
$1e:9b0d  ec c2 16	  cpx $16c2
$1e:9b10  26 fa		 rol $fa
$1e:9b12  3f a2 7c 7b   and $7b7ca2,x
$1e:9b16  11 04		 ora ($04),y
$1e:9b18  ab			plb
$1e:9b19  07 61		 ora [$61]
$1e:9b1b  6a			ror a
$1e:9b1c  22 a6 5f c0   jsl $c05fa6
$1e:9b20  30 60		 bmi $9b82
$1e:9b22  d5 4a		 cmp $4a,x
$1e:9b24  e4 19		 cpx $19
$1e:9b26  a4 0d		 ldy $0d
$1e:9b28  06 8a		 asl $8a
$1e:9b2a  43 9b		 eor $9b,s
$1e:9b2c  dc 02 04	  jml [$0402]
$1e:9b2f  00 08		 brk #$08
$1e:9b31  f6 fa		 inc $fa,x
$1e:9b33  1d f6 ef	  ora $eff6,x
$1e:9b36  0f 53 fc 23   ora $23fc53
$1e:9b3a  51 a8		 eor ($a8),y
$1e:9b3c  90 10		 bcc $9b4e
$1e:9b3e  c1 44		 cmp ($44,x)
$1e:9b40  ef 28 d4 0e   sbc $0ed428
$1e:9b44  81 16		 sta ($16,x)
$1e:9b46  0a			asl a
$1e:9b47  94 10		 sty $10,x
$1e:9b49  26 11		 rol $11
$1e:9b4b  67 f8		 adc [$f8]
$1e:9b4d  fb			xce
$1e:9b4e  63 50		 adc $50,s
$1e:9b50  ba			tsx
$1e:9b51  44 78 4a	  mvp $4a,$78
$1e:9b54  50 c1		 bvc $9b17
$1e:9b56  18			clc
$1e:9b57  47 9d		 eor [$9d]
$1e:9b59  e0 21		 cpx #$21
$1e:9b5b  18			clc
$1e:9b5c  7c 22 12	  jmp ($1222,x)
$1e:9b5f  35 1b		 and $1b,x
$1e:9b61  04 34		 tsb $34
$1e:9b63  66 10		 ror $10
$1e:9b65  97 80		 sta [$80],y
$1e:9b67  7a			ply
$1e:9b68  fe b1 2a	  inc $2ab1,x
$1e:9b6b  08			php
$1e:9b6c  d8			cld
$1e:9b6d  a1 35		 lda ($35,x)
$1e:9b6f  81 d8		 sta ($d8,x)
$1e:9b71  c2 00		 rep #$00
$1e:9b73  61 a9		 adc ($a9,x)
$1e:9b75  fb			xce
$1e:9b76  6a			ror a
$1e:9b77  46 92		 lsr $92
$1e:9b79  13 0e		 ora ($0e,s),y
$1e:9b7b  07 db		 ora [$db]
$1e:9b7d  83 17		 sta $17,s
$1e:9b7f  22 bd 88 46   jsl $4688bd
$1e:9b83  1c 8f 8f	  trb $8f8f
$1e:9b86  26 3e		 rol $3e
$1e:9b88  35 7f		 and $7f,x
$1e:9b8a  98			tya
$1e:9b8b  f0 61		 beq $9bee
$1e:9b8d  16 3a		 asl $3a,x
$1e:9b8f  85 45		 sta $45
$1e:9b91  08			php
$1e:9b92  55 21		 eor $21,x
$1e:9b94  d8			cld
$1e:9b95  fb			xce
$1e:9b96  c8			iny
$1e:9b97  60			rts
$1e:9b98  48			pha
$1e:9b99  18			clc
$1e:9b9a  2c 1a 70	  bit $701a
$1e:9b9d  95 28		 sta $28,x
$1e:9b9f  a4 6a		 ldy $6a
$1e:9ba1  27 06		 and [$06]
$1e:9ba3  3f 90 e8 40   and $40e890,x
$1e:9ba7  ae 8f 31	  ldx $318f
$1e:9baa  d8			cld
$1e:9bab  7a			ply
$1e:9bac  7d 2f 03	  adc $032f,x
$1e:9baf  18			clc
$1e:9bb0  90 e0		 bcc $9b92
$1e:9bb2  67 31		 adc [$31]
$1e:9bb4  25 b8		 and $b8
$1e:9bb6  ad c1 6c	  lda $6cc1
$1e:9bb9  4a			lsr a
$1e:9bba  f5 18		 sbc $18,x
$1e:9bbc  07 ac		 ora [$ac]
$1e:9bbe  5e 43 00	  lsr $0043,x
$1e:9bc1  4f a8 0d a2   eor $a20da8
$1e:9bc5  4b			phk
$1e:9bc6  91 77		 sta ($77),y
$1e:9bc8  a3 d9		 lda $d9,s
$1e:9bca  5d 0a a5	  eor $a50a,x
$1e:9bcd  7a			ply
$1e:9bce  04 58		 tsb $58
$1e:9bd0  1f 50 48 d5   ora $d54850,x
$1e:9bd4  22 3c 1f a8   jsl $a81f3c
$1e:9bd8  64 68		 stz $68
$1e:9bda  ea			nop
$1e:9bdb  63 06		 adc $06,s
$1e:9bdd  3d 08 c2	  and $c208,x
$1e:9be0  8d 20 c4	  sta $c420
$1e:9be3  01 7f		 ora ($7f,x)
$1e:9be5  21 4e		 and ($4e,x)
$1e:9be7  a1 5b		 lda ($5b,x)
$1e:9be9  23 3a		 and $3a,s
$1e:9beb  51 20		 eor ($20),y
$1e:9bed  e3 67		 sbc $67,s
$1e:9bef  52 24		 eor ($24)
$1e:9bf1  3e b4 47	  rol $47b4,x
$1e:9bf4  68			pla
$1e:9bf5  a4 69		 ldy $69
$1e:9bf7  b8			clv
$1e:9bf8  a3 85		 lda $85,s
$1e:9bfa  73 03		 adc ($03,s),y
$1e:9bfc  64 59		 stz $59
$1e:9bfe  e4 48		 cpx $48
$1e:9c00  5f 47 b9 23   eor $23b947,x
$1e:9c04  8d b2 51	  sta $51b2
$1e:9c07  d2 44		 cmp ($44)
$1e:9c09  7d 89 3c	  adc $3c89,x
$1e:9c0c  60			rts
$1e:9c0d  e2 90		 sep #$90
$1e:9c0f  ab			plb
$1e:9c10  05 d0		 ora $d0
$1e:9c12  81 84		 sta ($84,x)
$1e:9c14  19 28 43	  ora $4328,y
$1e:9c17  c1 85		 cmp ($85,x)
$1e:9c19  88			dey
$1e:9c1a  19 de b0	  ora $b0de,y
$1e:9c1d  fb			xce
$1e:9c1e  11 7c		 ora ($7c),y
$1e:9c20  50 c3		 bvc $9be5
$1e:9c22  60			rts
$1e:9c23  7f ac 3e c0   adc $c03eac,x
$1e:9c27  6f 03 a0 42   adc $42a003
$1e:9c2b  3f b5 80 7b   and $7b80b5,x
$1e:9c2f  3c c5 28	  bit $28c5,x
$1e:9c32  06 30		 asl $30
$1e:9c34  a9 87 dd	  lda #$dd87
$1e:9c37  3a			dec a
$1e:9c38  31 33		 and ($33),y
$1e:9c3a  80 8b		 bra $9bc7
$1e:9c3c  e9 3e 08	  sbc #$083e
$1e:9c3f  10 7f		 bpl $9cc0
$1e:9c41  9c 56 2d	  stz $2d56
$1e:9c44  17 31		 ora [$31],y
$1e:9c46  8c 12 35	  sty $3512
$1e:9c49  ec 36 02	  cpx $0236
$1e:9c4c  90 ab		 bcc $9bf9
$1e:9c4e  31 d8		 and ($d8),y
$1e:9c50  f4 7c e6	  pea $e67c
$1e:9c53  30 c2		 bmi $9c17
$1e:9c55  e0 97		 cpx #$97
$1e:9c57  41 2a		 eor ($2a,x)
$1e:9c59  a6 13		 ldx $13
$1e:9c5b  7c 0a 91	  jmp ($910a,x)
$1e:9c5e  8e 26 08	  stx $0826
$1e:9c61  13 fc		 ora ($fc,s),y
$1e:9c63  24 91		 bit $91
$1e:9c65  1f 09 34 1d   ora $1d3409,x
$1e:9c69  13 06		 ora ($06,s),y
$1e:9c6b  89 46 d2	  bit #$d246
$1e:9c6e  92 d1		 sta ($d1)
$1e:9c70  b8			clv
$1e:9c71  a4 d4		 ldy $d4
$1e:9c73  1e 87 88	  asl $8887,x
$1e:9c76  1f d8 8e 27   ora $278ed8,x
$1e:9c7a  a0 78		 ldy #$78
$1e:9c7c  8a			txa
$1e:9c7d  3d ab 13	  and $13ab,x
$1e:9c80  98			tya
$1e:9c81  91 20		 sta ($20),y
$1e:9c83  1e 2d fd	  asl $fd2d,x
$1e:9c86  20 98 34	  jsr $3498
$1e:9c89  0d 87 5a	  ora $5a87
$1e:9c8c  4a			lsr a
$1e:9c8d  15 8e		 ora $8e,x
$1e:9c8f  a4 0d		 ldy $0d
$1e:9c91  7a			ply
$1e:9c92  72 54		 adc ($54)
$1e:9c94  e8			inx
$1e:9c95  c5 40		 cmp $40
$1e:9c97  8a			txa
$1e:9c98  00 35		 brk #$35
$1e:9c9a  c0 0f		 cpy #$0f
$1e:9c9c  1c 10 88	  trb $8810
$1e:9c9f  88			dey
$1e:9ca0  88			dey
$1e:9ca1  d0 e2		 bne $9c85
$1e:9ca3  27 a4		 and [$a4]
$1e:9ca5  c5 a8		 cmp $a8
$1e:9ca7  07 f1		 ora [$f1]
$1e:9ca9  8b			phb
$1e:9caa  45 c8		 eor $c8
$1e:9cac  cf 1e a4 23   cmp $23a41e
$1e:9cb0  c6 3d		 dec $3d
$1e:9cb2  1f 7b 3a ca   ora $ca3a7b,x
$1e:9cb6  c9 82 a0	  cmp #$a082
$1e:9cb9  a7 d9		 lda [$d9]
$1e:9cbb  54 6a 0b	  mvn $0b,$6a
$1e:9cbe  f9 16 0c	  sbc $0c16,y
$1e:9cc1  1a			inc a
$1e:9cc2  70 cf		 bvs $9c93
$1e:9cc4  a1 f8		 lda ($f8,x)
$1e:9cc6  1b			tcs
$1e:9cc7  cd c1 11	  cmp $11c1
$1e:9cca  a8			tay
$1e:9ccb  03 bf		 ora $bf,s
$1e:9ccd  c0 1e		 cpy #$1e
$1e:9ccf  11 f1		 ora ($f1),y
$1e:9cd1  17 8c		 ora [$8c],y
$1e:9cd3  fc 89 e5	  jsr ($e589,x)
$1e:9cd6  5f 33 79 df   eor $df7933,x
$1e:9cda  d1 1e		 cmp ($1e),y
$1e:9cdc  99 f5 57	  sta $57f5,y
$1e:9cdf  ae fd 99	  ldx $99fd
$1e:9ce2  ed df 72	  sbc $72df
$1e:9ce5  ac 22 12	  ldy $1222
$1e:9ce8  f6 2a		 inc $2a,x
$1e:9cea  c3 95		 cmp $95,s
$1e:9cec  de e7 08	  dec $08e7,x
$1e:9cef  b0 3b		 bcs $9d2c
$1e:9cf1  7d fd e0	  adc $e0fd,x
$1e:9cf4  ff 10 78 c7   sbc $c77810,x
$1e:9cf8  c8			iny
$1e:9cf9  47 59		 eor [$59]
$1e:9cfb  fd 95 80	  sbc $8095,x
$1e:9cfe  ce 04 df	  dec $df04
$1e:9d01  1f 4f fc 95   ora $95fc4f,x
$1e:9d05  e3 bf		 sbc $bf,s
$1e:9d07  46 7a		 lsr $7a
$1e:9d09  77 d5		 adc [$d5],y
$1e:9d0b  d3 fd		 cmp ($fd,s),y
$1e:9d0d  5d 7a ae	  eor $ae7a,x
$1e:9d10  5e be 06	  lsr $06be,x
$1e:9d13  f0 bf		 beq $9cd4
$1e:9d15  8a			txa
$1e:9d16  3c 73 e4	  bit $e473,x
$1e:9d19  af 2d f9 b3   lda $b3f92d
$1e:9d1d  cf be 8e f4   cmp $f48ebe
$1e:9d21  ff ac 3d 83   sbc $833dac,x
$1e:9d25  ed 2f 71	  sbc $712f
$1e:9d28  fc 02 11	  jsr ($1102,x)
$1e:9d2b  09 7b 15	  ora #$157b
$1e:9d2e  61 cb		 adc ($cb,x)
$1e:9d30  e0 df		 cpx #$df
$1e:9d32  0f 78 bf c8   ora $c8bf78
$1e:9d36  1e 51 f3	  asl $f351,x
$1e:9d39  17 9c		 ora [$9c],y
$1e:9d3b  fd 09 e9	  sbc $e909,x
$1e:9d3e  5f 53 7a df   eor $df7a53,x
$1e:9d42  d9 1e d9	  cmp $d91e,y
$1e:9d45  f7 51		 sbc [$51],y
$1e:9d47  00 02		 brk #$02
$1e:9d49  02 00		 cop #$00
$1e:9d4b  04 8f		 tsb $8f
$1e:9d4d  3b			tsc
$1e:9d4e  de 61 22	  dec $2261,x
$1e:9d51  8d 47 23	  sta $2347
$1e:9d54  b2 d7		 lda ($d7)
$1e:9d56  7f 80 2a 67   adc $672a80,x
$1e:9d5a  0d 7f 64	  ora $647f
$1e:9d5d  52 2a		 eor ($2a)
$1e:9d5f  fe f1 7c	  inc $7cf1,x
$1e:9d62  cc 66 53	  cpy $5366
$1e:9d65  39 a4 d4	  and $d4a4,y
$1e:9d68  5f 13 89 cc   eor $cc8913,x
$1e:9d6c  ea			nop
$1e:9d6d  77 3c		 adc [$3c],y
$1e:9d6f  9e c5 8b	  stz $8bc5,x
$1e:9d72  ef 40 a0 d0   sbc $d0a040
$1e:9d76  a8			tay
$1e:9d77  74 8a		 stz $8a,x
$1e:9d79  2c 4c de	  bit $de4c
$1e:9d7c  b4 da		 ldy $da,x
$1e:9d7e  75 3e		 adc $3e,x
$1e:9d80  93 4a		 sta ($4a,s),y
$1e:9d82  a2 50		 ldx #$50
$1e:9d84  e8			inx
$1e:9d85  71 23		 adc ($23),y
$1e:9d87  fc 52 ea	  jsr ($ea52,x)
$1e:9d8a  47 d0		 eor [$d0]
$1e:9d8c  97 42		 sta [$42],y
$1e:9d8e  11 fb		 ora ($fb),y
$1e:9d90  10 88		 bpl $9d1a
$1e:9d92  a7 f2		 lda [$f2]
$1e:9d94  31 19		 and ($19),y
$1e:9d96  57 ac		 eor [$ac],y
$1e:9d98  1a			inc a
$1e:9d99  0c af 05	  tsb $05af
$1e:9d9c  c8			iny
$1e:9d9d  ca			dex
$1e:9d9e  a5 72		 lda $72
$1e:9da0  c8			iny
$1e:9da1  32 fe		 and ($fe)
$1e:9da3  17 01		 ora [$01],y
$1e:9da5  09 85 42	  ora #$4285
$1e:9da8  e1 8c		 sbc ($8c,x)
$1e:9daa  fa			plx
$1e:9dab  82 37 f6	  brl $93e5
$1e:9dae  6d 1f dc	  adc $dc1f
$1e:9db1  40			rti
$1e:9db2  b7 d0		 lda [$d0],y
$1e:9db4  27 a1		 and [$a1]
$1e:9db6  6d 5e 81	  adc $815e
$1e:9db9  bf 81 6f 5d   lda $5d6f81,x
$1e:9dbd  e0 f6		 cpx #$f6
$1e:9dbf  27 e0		 and [$e0]
$1e:9dc1  3c c5 f8	  bit $f8c5,x
$1e:9dc4  0f 41 77 86   ora $867741
$1e:9dc8  f5 f2		 sbc $f2,x
$1e:9dca  2f 40 90 48   and $489040
$1e:9dce  77 e0		 adc [$e0],y
$1e:9dd0  41 7c		 eor ($7c,x)
$1e:9dd2  83 bc		 sta $bc,s
$1e:9dd4  01 47		 ora ($47,x)
$1e:9dd6  02 94		 cop #$94
$1e:9dd8  4a			lsr a
$1e:9dd9  5f a0 f4 07   eor $07f4a0,x
$1e:9ddd  98			tya
$1e:9dde  3f c7 67 af   and $af67c7,x
$1e:9de2  dd ee 32	  cmp $32ee,x
$1e:9de5  9a			txs
$1e:9de6  fd a7 1c	  sbc $1ca7,x
$1e:9de9  64 10		 stz $10
$1e:9deb  2c a6 ce	  bit $cea6
$1e:9dee  6d 27 cc	  adc $cc27
$1e:9df1  ec 30 1b	  cpx $1b30
$1e:9df4  6c ce 6b	  jmp ($6bce)
$1e:9df7  37 b6		 and [$b6],y
$1e:9df9  db			stp
$1e:9dfa  ec 23 7b	  cpx $7b23
$1e:9dfd  6d e6 c2	  adc $c2e6
$1e:9e00  7d 17 c0	  adc $c017,x
$1e:9e03  14 47		 trb $47
$1e:9e05  43 a2		 eor $a2,s
$1e:9e07  d1 e9		 cmp ($e9),y
$1e:9e09  30 45		 bmi $9e50
$1e:9e0b  11 c0		 ora ($c0),y
$1e:9e0d  e0 a8		 cpx #$a8
$1e:9e0f  d2 f2		 cmp ($f2)
$1e:9e11  91 5e		 sta ($5e),y
$1e:9e13  ef 97 db f5   sbc $f5db97
$1e:9e17  fc b0 17	  jsr ($17b0,x)
$1e:9e1a  8b			phb
$1e:9e1b  cd ea 8f	  cmp $8fea
$1e:9e1e  37 31		 and [$31],y
$1e:9e20  14 8e		 trb $8e
$1e:9e22  af 26 91 99   lda $999126
$1e:9e26  c6 f2		 dec $f2
$1e:9e28  76 0a		 ror $0a,x
$1e:9e2a  64 fe		 stz $fe
$1e:9e2c  4a			lsr a
$1e:9e2d  81 09		 sta ($09,x)
$1e:9e2f  1a			inc a
$1e:9e30  04 50		 tsb $50
$1e:9e32  60			rts
$1e:9e33  84 09		 sty $09
$1e:9e35  24 9a		 bit $9a
$1e:9e37  4b			phk
$1e:9e38  01 80		 ora ($80,x)
$1e:9e3a  a1 49		 lda ($49,x)
$1e:9e3c  23 09		 and $09,s
$1e:9e3e  0d 56 f4	  ora $f456
$1e:9e41  0d 63 90	  ora $9063
$1e:9e44  7d 42 46	  adc $4642,x
$1e:9e47  a3 70		 lda $70,s
$1e:9e49  f8			sed
$1e:9e4a  dc 39 23	  jml [$2339]
$1e:9e4d  45 c1		 eor $c1
$1e:9e4f  bc 41 5d	  ldy $5d41,x
$1e:9e52  fa			plx
$1e:9e53  8f 07 f9 54   sta $54f907
$1e:9e57  40			rti
$1e:9e58  a3 6b		 lda $6b,s
$1e:9e5a  b6 02		 ldx $02,y
$1e:9e5c  48			pha
$1e:9e5d  00 f5		 brk #$f5
$1e:9e5f  1b			tcs
$1e:9e60  9d d0 32	  sta $32d0,x
$1e:9e63  59 dc 58	  eor $58dc,y
$1e:9e66  7c 2d 15	  jmp ($152d,x)
$1e:9e69  9b			txy
$1e:9e6a  0d 66 b5	  ora $b566
$1e:9e6d  51 b9		 eor ($b9),y
$1e:9e6f  5d c5 25	  eor $25c5,x
$1e:9e72  a5 d3		 lda $d3
$1e:9e74  69 6a 36	  adc #$366a
$1e:9e77  5b			tcd
$1e:9e78  7d 42 d5	  adc $d542,x
$1e:9e7b  55 0c		 eor $0c,x
$1e:9e7d  2e 3b 38	  rol $383b
$1e:9e80  23 0a		 and $0a,s
$1e:9e82  dd 72 d5	  cmp $d572,x
$1e:9e85  5f ae 8a 8c   eor $8c8aae,x
$1e:9e89  52 19		 eor ($19)
$1e:9e8b  cd 3d 4e	  cmp $4e3d
$1e:9e8e  c7 62		 cmp [$62]
$1e:9e90  ab			plb
$1e:9e91  11 80		 ora ($80),y
$1e:9e93  32 81		 and ($81)
$1e:9e95  90 cf		 bcc $9e66
$1e:9e97  59 2d 55	  eor $552d,y
$1e:9e9a  4a			lsr a
$1e:9e9b  f5 aa		 sbc $aa,x
$1e:9e9d  ce 28 51	  dec $5128
$1e:9ea0  48			pha
$1e:9ea1  54 6b 16	  mvn $16,$6b
$1e:9ea4  0b			phd
$1e:9ea5  49 14 4b	  eor #$4b14
$1e:9ea8  0a			asl a
$1e:9ea9  19 0c 4e	  ora $4e0c,y
$1e:9eac  2b			pld
$1e:9ead  13 8f		 ora ($8f,s),y
$1e:9eaf  ac 59 8c	  ldy $8c59
$1e:9eb2  ec 29 0c	  cpx $0c29
$1e:9eb5  1e 2e 03	  asl $032e,x
$1e:9eb8  97 a8		 sta [$a8],y
$1e:9eba  e7 ee		 sbc [$ee]
$1e:9ebc  17 14		 ora [$14],y
$1e:9ebe  ab			plb
$1e:9ebf  62 f0 b8	  per $57b2
$1e:9ec2  6c 3a 00	  jmp ($003a)
$1e:9ec5  2d b6 e5	  and $e5b6
$1e:9ec8  2b			pld
$1e:9ec9  60			rts
$1e:9eca  f1 d8		 sbc ($d8),y
$1e:9ecc  bc 5e 3b	  ldy $3b5e,x
$1e:9ecf  11 76		 ora ($76),y
$1e:9ed1  5a			phy
$1e:9ed2  be 3b 0d	  ldx $0d3b,y
$1e:9ed5  8c 60 86	  sty $8660
$1e:9ed8  42 ea		 wdm #$ea
$1e:9eda  c5 75		 cmp $75
$1e:9edc  79 e4 16	  adc $16e4,y
$1e:9edf  be c5 79	  ldx $79c5,y
$1e:9ee2  2b			pld
$1e:9ee3  be 6f 17	  ldx $176f,y
$1e:9ee6  9b			txy
$1e:9ee7  fd e6 d7	  sbc $d7e6,x
$1e:9eea  6c 7f 8e	  jmp ($8e7f)
$1e:9eed  b3 5b		 lda ($5b,s),y
$1e:9eef  ad d5 6b	  lda $6bd5
$1e:9ef2  75 db		 adc $db,x
$1e:9ef4  9d d4 96	  sta $96d4,x
$1e:9ef7  07 07		 ora [$07]
$1e:9ef9  2b			pld
$1e:9efa  ae c7 65	  ldx $65c7
$1e:9efd  a9 d5 e1	  lda #$e1d5
$1e:9f00  31 b2		 and ($b2),y
$1e:9f02  59 34 8c	  eor $8c34,y
$1e:9f05  ce b0 11	  dec $11b0
$1e:9f08  31 07		 and ($07),y
$1e:9f0a  03 51		 ora $51,s
$1e:9f0c  25 2b		 and $2b
$1e:9f0e  a8			tay
$1e:9f0f  98			tya
$1e:9f10  e0 31		 cpx #$31
$1e:9f12  b8			clv
$1e:9f13  74 6c		 stz $6c,x
$1e:9f15  ce c2 63	  dec $63c2
$1e:9f18  c0 13		 cpy #$13
$1e:9f1a  00 ee		 brk #$ee
$1e:9f1c  c3 64		 cmp $64,s
$1e:9f1e  26 00		 rol $00
$1e:9f20  fe c9 62	  inc $62c9,x
$1e:9f23  4f 61 aa 64   eor $64aa61
$1e:9f27  73 03		 adc ($03,s),y
$1e:9f29  f6 12		 inc $12,x
$1e:9f2b  9e 63 41	  stz $4163,x
$1e:9f2e  a0 b8		 ldy #$b8
$1e:9f30  5c 51 ea 7b   jml $7bea51
$1e:9f34  2d 00 98	  and $9800
$1e:9f37  2d b6 e4	  and $e4b6
$1e:9f3a  f8			sed
$1e:9f3b  a8			tay
$1e:9f3c  c7 25		 cmp [$25]
$1e:9f3e  93 46		 sta ($46,s),y
$1e:9f40  08			php
$1e:9f41  98			tya
$1e:9f42  5a			phy
$1e:9f43  ad 95 55	  lda $5595
$1e:9f46  18			clc
$1e:9f47  98			tya
$1e:9f48  1c ad 96	  trb $96ad
$1e:9f4b  80 b2		 bra $9eff
$1e:9f4d  11 5e		 ora ($5e),y
$1e:9f4f  cc 76 5f	  cpy $5f76
$1e:9f52  f0 03		 beq $9f57
$1e:9f54  06 00		 asl $00
$1e:9f56  12 80		 ora ($80)
$1e:9f58  3b			tsc
$1e:9f59  fc 01 e1	  jsr ($e101,x)
$1e:9f5c  1f 11 78 cf   ora $cf7811,x
$1e:9f60  c8			iny
$1e:9f61  9e 55 f3	  stz $f355,x
$1e:9f64  37 9d		 and [$9d],y
$1e:9f66  fd 11 e9	  sbc $e911,x
$1e:9f69  9f 55 7a ef   sta $ef7a55,x
$1e:9f6d  d9 9e dd	  cmp $dd9e,y
$1e:9f70  f7 77		 sbc [$77],y
$1e:9f72  bf fc 21 e2   lda $e221fc,x
$1e:9f76  1f 19 79 0f   ora $0f7919,x
$1e:9f7a  ca			dex
$1e:9f7b  9e 65 f3	  stz $f365,x
$1e:9f7e  b7 a1		 lda [$a1],y
$1e:9f80  fd 31 ea	  sbc $ea31,x
$1e:9f83  9f 5d 7b 2f   sta $2f7b5d,x
$1e:9f87  db			stp
$1e:9f88  9e ed f7	  stz $f7ed,x
$1e:9f8b  f7 83		 sbc [$83],y
$1e:9f8d  fc 41 e3	  jsr ($e341,x)
$1e:9f90  1f 21 79 4f   ora $4f7921,x
$1e:9f94  cc 9e 75	  cpy $759e
$1e:9f97  f4 37 a5	  pea $a537
$1e:9f9a  fd 51 eb	  sbc $eb51,x
$1e:9f9d  9f 65 7b 6f   sta $6f7b65,x
$1e:9fa1  dd 9e fd	  cmp $fd9e,x
$1e:9fa4  f0 77		 beq $a01d
$1e:9fa6  87 fc		 sta [$fc]
$1e:9fa8  61 e4		 adc ($e4,x)
$1e:9faa  1f 29 79 8f   ora $8f7929,x
$1e:9fae  ce 9e 85	  dec $859e
$1e:9fb1  f4 b7 a9	  pea $a9b7
$1e:9fb4  fd 71 ec	  sbc $ec71,x
$1e:9fb7  9f 6d 7b af   sta $af7b6d,x
$1e:9fbb  df 9e 0d f0   cmp $f00d9e,x
$1e:9fbf  f7 8b		 sbc [$8b],y
$1e:9fc1  fc 81 e5	  jsr ($e581,x)
$1e:9fc4  1f 31 79 cf   ora $cf7931,x
$1e:9fc8  d0 9e		 bne $9f68
$1e:9fca  95 f5		 sta $f5,x
$1e:9fcc  37 ad		 and [$ad],y
$1e:9fce  fd 91 ed	  sbc $ed91,x
$1e:9fd1  9f 75 7b ef   sta $ef7b75,x
$1e:9fd5  c1 9e		 cmp ($9e,x)
$1e:9fd7  1d f1 77	  ora $77f1,x
$1e:9fda  8f fc a1 e6   sta $e6a1fc
$1e:9fde  1f 39 7a 0f   ora $0f7a39,x
$1e:9fe2  d2 9e		 cmp ($9e)
$1e:9fe4  a5 f5		 lda $f5
$1e:9fe6  b7 b1		 lda [$b1],y
$1e:9fe8  fd b1 ee	  sbc $eeb1,x
$1e:9feb  9f 7d 78 2f   sta $2f787d,x
$1e:9fef  c3 9e		 cmp $9e,s
$1e:9ff1  2d f1 f7	  and $f7f1
$1e:9ff4  93 fc		 sta ($fc,s),y
$1e:9ff6  c1 e7		 cmp ($e7,x)
$1e:9ff8  1f 41 7a 4f   ora $4f7a41,x
$1e:9ffc  d4 9e		 pei ($9e)
$1e:9ffe  b5 f6		 lda $f6,x
$1e:a000  37 b5		 and [$b5],y
$1e:a002  fd d1 ef	  sbc $efd1,x
$1e:a005  9f 05 78 6f   sta $6f7805,x
$1e:a009  c5 9e		 cmp $9e
$1e:a00b  3d f2 77	  and $77f2,x
$1e:a00e  97 fc		 sta [$fc],y
$1e:a010  e1 e8		 sbc ($e8,x)
$1e:a012  1f 49 7a 8f   ora $8f7a49,x
$1e:a016  d6 9e		 dec $9e,x
$1e:a018  c5 f6		 cmp $f6
$1e:a01a  b7 b9		 lda [$b9],y
$1e:a01c  fd f1 e0	  sbc $e0f1,x
$1e:a01f  9f 0d 78 af   sta $af780d,x
$1e:a023  c7 9e		 cmp [$9e]
$1e:a025  4d f2 f7	  eor $f7f2
$1e:a028  9b			txy
$1e:a029  fd 01 e9	  sbc $e901,x
$1e:a02c  1f 51 7a cf   ora $cf7a51,x
$1e:a030  d8			cld
$1e:a031  9e d5 f7	  stz $f7d5,x
$1e:a034  37 bd		 and [$bd],y
$1e:a036  fc 11 e1	  jsr ($e111,x)
$1e:a039  9f 15 78 ef   sta $ef7815,x
$1e:a03d  c9 9e 5d	  cmp #$5d9e
$1e:a040  f3 77		 sbc ($77,s),y
$1e:a042  9f fd 21 ea   sta $ea21fd,x
$1e:a046  1f 59 7b 0f   ora $0f7b59,x
$1e:a04a  da			phx
$1e:a04b  9e e5 f7	  stz $f7e5,x
$1e:a04e  b7 81		 lda [$81],y
$1e:a050  fc 31 e2	  jsr ($e231,x)
$1e:a053  9f 1d 79 2f   sta $2f791d,x
$1e:a057  cb			wai
$1e:a058  9e 6d f3	  stz $f36d,x
$1e:a05b  f7 a3		 sbc [$a3],y
$1e:a05d  fd 41 eb	  sbc $eb41,x
$1e:a060  1f 5c 25 63   ora $63255c,x
$1e:a064  03 82		 ora $82,s
$1e:a066  5e 65 66	  lsr $6665,x
$1e:a069  b5 5b		 lda $5b,x
$1e:a06b  66 fb		 ror $fb
$1e:a06d  b7 df		 lda [$df],y
$1e:a06f  de 0f f1	  dec $f10f,x
$1e:a072  07 8c		 ora [$8c]
$1e:a074  7c 85 e5	  jmp ($e585,x)
$1e:a077  3f 32 79 d7   and $d77932,x
$1e:a07b  d0 de		 bne $a05b
$1e:a07d  97 f5		 sta [$f5],y
$1e:a07f  47 ae		 eor [$ae]
$1e:a081  7d 95 ed	  adc $ed95,x
$1e:a084  bf 76 7b f7   lda $f77b76,x
$1e:a088  c1 de		 cmp ($de,x)
$1e:a08a  1f f1 87 90   ora $9087f1,x
$1e:a08e  7c a5 e6	  jmp ($e6a5,x)
$1e:a091  3f 3a 7a 17   and $177a3a,x
$1e:a095  d2 de		 cmp ($de)
$1e:a097  a7 f5		 lda [$f5]
$1e:a099  c7 b2		 cmp [$b2]
$1e:a09b  7d b5 ee	  adc $eeb5,x
$1e:a09e  8b			phb
$1e:a09f  ac 56 6b	  ldy $6b56
$1e:a0a2  55 b7		 eor $b7,x
$1e:a0a4  6f bf bc 1f   adc $1fbcbf
$1e:a0a8  e2 0e		 sep #$0e
$1e:a0aa  b2 10		 lda ($10)
$1e:a0ac  1a			inc a
$1e:a0ad  c0 2a		 cpy #$2a
$1e:a0af  4b			phk
$1e:a0b0  61 41		 adc ($41,x)
$1e:a0b2  ad 16 91	  lda $9116
$1e:a0b5  59 dd 2e	  eor $2edd,y
$1e:a0b8  97 0b		 sta [$0b],y
$1e:a0ba  8d ca e6	  sta $e6ca
$1e:a0bd  60			rts
$1e:a0be  03 08		 ora $08,s
$1e:a0c0  8a			txa
$1e:a0c1  ce f9 7c	  dec $7cf9
$1e:a0c4  bc 0a 82	  ldy $820a,x
$1e:a0c7  f6 70		 inc $70,x
$1e:a0c9  03 89		 ora $89,s
$1e:a0cb  0b			phd
$1e:a0cc  0b			phd
$1e:a0cd  09 84 14	  ora #$1484
$1e:a0d0  92 00		 sta ($00)
$1e:a0d2  30 98		 bmi $a06c
$1e:a0d4  01 53		 ora ($53,x)
$1e:a0d6  0a			asl a
$1e:a0d7  54 52 e9	  mvn $e9,$52
$1e:a0da  2f 51 fa d3   and $d3fa51
$1e:a0de  d8			cld
$1e:a0df  be df 87	  ldx $87df,y
$1e:a0e2  7f 80 3c 23   adc $233c80,x
$1e:a0e6  e2 2f		 sep #$2f
$1e:a0e8  19 f9 13	  ora $13f9,y
$1e:a0eb  ca			dex
$1e:a0ec  be 66 f3	  ldx $f366,y
$1e:a0ef  bf a2 3d 33   lda $333da2,x
$1e:a0f3  ea			nop
$1e:a0f4  af 5d fb 33   lda $33fb5d
$1e:a0f8  db			stp
$1e:a0f9  be ee f7	  ldx $f7ee,y
$1e:a0fc  ff 84 3c 43   sbc $433c84,x
$1e:a100  e3 2f		 sbc $2f,s
$1e:a102  21 f9		 and ($f9,x)
$1e:a104  53 cc		 eor ($cc,s),y
$1e:a106  be 76 f4	  ldx $f476,y
$1e:a109  3f a6 3d 53   and $533da6,x
$1e:a10d  eb			xba
$1e:a10e  af 65 fb 73   lda $73fb65
$1e:a112  dc 25 58	  jml [$5825]
$1e:a115  ac d6 ab	  ldy $abd6
$1e:a118  6e f8 78	  ror $78f8
$1e:a11b  78			sei
$1e:a11c  07 c2		 ora [$c2]
$1e:a11e  5e 23 f1	  lsr $f123,x
$1e:a121  a7 91		 lda [$91]
$1e:a123  7c ad e6	  jmp ($e6ad,x)
$1e:a126  01 bc		 ora ($bc,x)
$1e:a128  de 8b 99	  dec $998b,x
$1e:a12b  61 b1		 adc ($b1,x)
$1e:a12d  17 11		 ora [$11],y
$1e:a12f  23 ea		 and $ea,s
$1e:a131  2f 59 fb 13   and $13fb59
$1e:a135  da			phx
$1e:a136  be e6 f7	  ldx $f7e6,y
$1e:a139  bf 82 3c 33   lda $333c82,x
$1e:a13d  e2 af		 sep #$af
$1e:a13f  1d f9 33	  ora $33f9,x
$1e:a142  cb			wai
$1e:a143  be 6e f3	  ldx $f36e,y
$1e:a146  ff a4 3d 43   sbc $433da4,x
$1e:a14a  eb			xba
$1e:a14b  2f 61 fb 53   and $53fb61
$1e:a14f  dc ae 02	  jml [$02ae]
$1e:a152  02 00		 cop #$00
$1e:a154  04 ac		 tsb $ac
$1e:a156  56 2a		 lsr $2a,x
$1e:a158  d5 7b		 cmp $7b,x
$1e:a15a  85 62		 sta $62
$1e:a15c  cd 62 a9	  cmp $a962
$1e:a15f  54 2e 17	  mvn $17,$2e
$1e:a162  7b			tdc
$1e:a163  e5 aa		 sbc $aa
$1e:a165  c5 67		 cmp $67
$1e:a167  77 86		 adc [$86],y
$1e:a169  17 0c		 ora [$0c],y
$1e:a16b  f3 0b		 sbc ($0b,s),y
$1e:a16d  05 66		 ora $66
$1e:a16f  9b			txy
$1e:a170  4c b8 5b	  jmp $5bb8
$1e:a173  ad f6 ea	  lda $eaf6
$1e:a176  75 85		 adc $85,x
$1e:a178  e8			inx
$1e:a179  0f 71 ac 5a   ora $5aac71
$1e:a17d  2b			pld
$1e:a17e  75 db		 adc $db,x
$1e:a180  fe 06 fd	  inc $fd06,x
$1e:a183  80 ad		 bra $a132
$1e:a185  57 6d		 eor [$6d],y
$1e:a187  20 40 b9	  jsr $b940
$1e:a18a  5c ae 16 cc   jml $cc16ae
$1e:a18e  08			php
$1e:a18f  58			cli
$1e:a190  2c 2f 10	  bit $102f
$1e:a193  b0 07		 bcs $a19c
$1e:a195  00 1c		 brk #$1c
$1e:a197  01 50		 ora ($50,x)
$1e:a199  ad 0c 8a	  lda $8a0c
$1e:a19c  bb			tyx
$1e:a19d  72 be		 adc ($be)
$1e:a19f  df 6e 41 c3   cmp $c3416e,x
$1e:a1a3  18			clc
$1e:a1a4  a1 09		 lda ($09,x)
$1e:a1a6  05 a3		 ora $a3
$1e:a1a8  64 b1		 stz $b1
$1e:a1aa  da			phx
$1e:a1ab  f0 01		 beq $a1ae
$1e:a1ad  61 be		 adc ($be,x)
$1e:a1af  da			phx
$1e:a1b0  ef b6 d1 18   sbc $18d1b6
$1e:a1b4  58			cli
$1e:a1b5  ec ae f0	  cpx $f0ae
$1e:a1b8  af 57 c2 a3   lda $a3c257
$1e:a1bc  69 b9		 adc #$b9
$1e:a1be  dd 1d e0	  cmp $e01d,x
$1e:a1c1  f3 03		 sbc ($03,s),y
$1e:a1c3  61 00		 adc ($00,x)
$1e:a1c5  42 c8		 wdm #$c8
$1e:a1c7  57 0b		 eor [$0b],y
$1e:a1c9  28			plp
$1e:a1ca  04 2c		 tsb $2c
$1e:a1cc  d7 67		 cmp [$67],y
$1e:a1ce  c9 3f		 cmp #$3f
$1e:a1d0  c8			iny
$1e:a1d1  d8			cld
$1e:a1d2  42 91		 wdm #$91
$1e:a1d4  ac 82 49	  ldy $4982
$1e:a1d7  de 46 d4	  dec $d446,x
$1e:a1da  10 00		 bpl $a1dc
$1e:a1dc  c8			iny
$1e:a1dd  9d e1 51	  sta $51e1,x
$1e:a1e0  a3 be		 lda $be,s
$1e:a1e2  c8			iny
$1e:a1e3  02 03		 cop #$03
$1e:a1e5  04 77		 tsb $77
$1e:a1e7  85 26		 sta $26
$1e:a1e9  a6 0b		 ldx $0b
$1e:a1eb  21 48		 and ($48,x)
$1e:a1ed  d7 03		 cmp [$03],y
$1e:a1ef  04 ef		 tsb $ef
$1e:a1f1  0a			asl a
$1e:a1f2  50 58		 bvc $a24c
$1e:a1f4  04 21		 tsb $21
$1e:a1f6  7e 2c 06	  ror $062c,x
$1e:a1f9  06 b9		 asl $b9
$1e:a1fb  61 33		 adc ($33,x)
$1e:a1fd  85 81		 sta $81
$1e:a1ff  5e 29 a1	  lsr $a129,x
$1e:a202  ae dd 5a	  ldx $5add
$1e:a205  c2 ca		 rep #$ca
$1e:a207  01 48		 ora ($48,x)
$1e:a209  a1 42		 lda ($42,x)
$1e:a20b  aa			tax
$1e:a20c  31 10		 and ($10),y
$1e:a20e  b8			clv
$1e:a20f  16 03		 asl $03,x
$1e:a211  00 ca		 brk #$ca
$1e:a213  04 b8		 tsb $b8
$1e:a215  a1 42		 lda ($42,x)
$1e:a217  90 f0		 bcc $a209
$1e:a219  b7 7f		 lda [$7f],y
$1e:a21b  80 3c		 bra $a259
$1e:a21d  23 e2		 and $e2,s
$1e:a21f  2f 19 f9 13   and $13f919
$1e:a223  ca			dex
$1e:a224  30 a5		 bmi $a1cb
$1e:a226  02 8e		 cop #$8e
$1e:a228  2d 40 a3	  and $a340
$1e:a22b  97 24		 sta [$24],y
$1e:a22d  06 d7		 asl $d7
$1e:a22f  6d 29 1d	  adc $1d29
$1e:a232  48			pha
$1e:a233  7a			ply
$1e:a234  87 d6		 sta [$d6]
$1e:a236  5e 53 ca	  lsr $ca53,x
$1e:a239  a5 6e		 lda $6e
$1e:a23b  b5 5a		 lda $5a,x
$1e:a23d  67 85		 adc [$85]
$1e:a23f  ce e9 60	  dec $60e9
$1e:a242  ae 5c ad	  ldx $ad5c
$1e:a245  77 db		 adc [$db],y
$1e:a247  91 7c		 sta ($7c),y
$1e:a249  29 f6		 and #$f6
$1e:a24b  db			stp
$1e:a24c  85 b2		 sta $b2
$1e:a24e  d7 65		 cmp [$65],y
$1e:a250  c2 e1		 rep #$e1
$1e:a252  ad 0f 21	  lda $210f
$1e:a255  79 81 7c	  adc $7c81,y
$1e:a258  1e e1 70	  asl $70e1,x
$1e:a25b  2f 0d 5a af   and $af5a0d
$1e:a25f  60			rts
$1e:a260  ad d7 6e	  lda $6ed7
$1e:a263  57 20		 eor [$20],y
$1e:a265  70 85		 bvs $a1ec
$1e:a267  c0 26		 cpy #$26
$1e:a269  40			rti
$1e:a26a  70 b2		 bvs $a21e
$1e:a26c  58			cli
$1e:a26d  f0 0f		 beq $a27e
$1e:a26f  20 ae 89	  jsr $89ae
$1e:a272  48			pha
$1e:a273  26 55		 rol $55
$1e:a275  1a			inc a
$1e:a276  3d f2 d5	  and $d5f2,x
$1e:a279  87 16		 sta [$16]
$1e:a27b  4d 52 a7	  eor $a752
$1e:a27e  6f b7 5b de   adc $de5bb7
$1e:a282  62 35 1a	  per $bcba
$1e:a285  85 c2		 sta $c2
$1e:a287  ef 67 ac 52   sbc $52ac67
$1e:a28b  41 46		 eor ($46,x)
$1e:a28d  2d 2a 4d	  and $4d2a
$1e:a290  32 e1		 and ($e1)
$1e:a292  6e b0 80	  ror $80b0
$1e:a295  02 c7		 cop #$c7
$1e:a297  6b			rtl
$1e:a298  b5 80		 lda $80,x
$1e:a29a  86 c6		 stx $c6
$1e:a29c  1f 0a ab e8   ora $e8ab0a,x
$1e:a2a0  2b			pld
$1e:a2a1  b8			clv
$1e:a2a2  4a			lsr a
$1e:a2a3  c5 7a		 cmp $7a
$1e:a2a5  be ee 1b	  ldx $1bee,y
$1e:a2a8  85 d1		 sta $d1
$1e:a2aa  dc 95 db	  jml [$db95]
$1e:a2ad  8a			txa
$1e:a2ae  15 2e		 ora $2e,x
$1e:a2b0  b5 77		 lda $77,x
$1e:a2b2  70 9c		 bvs $a250
$1e:a2b4  4a			lsr a
$1e:a2b5  f6 10		 inc $10,x
$1e:a2b7  13 c9		 ora ($c9,s),y
$1e:a2b9  61 9d		 adc ($9d,x)
$1e:a2bb  c2 57		 rep #$57
$1e:a2bd  16 78		 asl $78,x
$1e:a2bf  09 84 f2	  ora #$f284
$1e:a2c2  48			pha
$1e:a2c3  d2 00		 cmp ($00)
$1e:a2c5  95 94		 sta $94,x
$1e:a2c7  6c 77 6b	  jmp ($6b77)
$1e:a2ca  85 2c		 sta $2c
$1e:a2cc  aa			tax
$1e:a2cd  01 05		 ora ($05,x)
$1e:a2cf  a4 92		 ldy $92
$1e:a2d1  06 dd		 asl $dd
$1e:a2d3  70 a6		 bvs $a27b
$1e:a2d5  19 40 60	  ora $6040,y
$1e:a2d8  a5 72		 lda $72
$1e:a2da  0e 85 c9	  asl $c985
$1e:a2dd  9c 22 14	  stz $1422
$1e:a2e0  00 95		 brk #$95
$1e:a2e2  f6 fb		 inc $fb,x
$1e:a2e4  63 b2		 adc $b2,s
$1e:a2e6  a9 02 91	  lda #$9102
$1e:a2e9  58			cli
$1e:a2ea  78			sei
$1e:a2eb  d5 76		 cmp $76,x
$1e:a2ed  d2 f1		 cmp ($f1)
$1e:a2ef  d7 86		 cmp [$86],y
$1e:a2f1  df ec af 1c   cmp $1cafec,x
$1e:a2f5  52 83		 eor ($83)
$1e:a2f7  c7 2d		 cmp [$2d]
$1e:a2f9  23 0d		 and $0d,s
$1e:a2fb  17 f2		 ora [$f2],y
$1e:a2fd  d4 1e		 pei ($1e)
$1e:a2ff  38			sec
$1e:a300  df 03 0f 9c   cmp $9c0f03,x
$1e:a304  bd 07 e9	  lda $e907,x
$1e:a307  4f 52 fa db   eor $dbfa52
$1e:a30b  d8			cld
$1e:a30c  fe e6 50	  inc $50e6,x
$1e:a30f  02 02		 cop #$02
$1e:a311  00 04		 brk #$04
$1e:a313  91 bb		 sta ($bb),y
$1e:a315  ef f0 ef c9   sbc $c9eff0
$1e:a319  1c bd fd	  trb $fdbd
$1e:a31c  e0 ff 10	  cpx #$10ff
$1e:a31f  76 e3		 ror $e3,x
$1e:a321  73 d4		 adc ($d4,s),y
$1e:a323  e9 ef b7	  sbc #$b7ef
$1e:a326  ee f5 9b	  inc $9bf5
$1e:a329  bb			tyx
$1e:a32a  c3 81		 cmp $81,s
$1e:a32c  e6 ab		 inc $ab
$1e:a32e  55 bc		 eor $bc,x
$1e:a330  dc 77 7a	  jml [$7a77]
$1e:a333  cf dd e1 eb   cmp $ebe1dd
$1e:a337  af 55 ea fe   lda $feea55
$1e:a33b  6a			ror a
$1e:a33c  c3 bd		 cmp $bd,s
$1e:a33e  68			pla
$1e:a33f  ee f0 ac	  inc $acf0
$1e:a342  79 ab 95	  adc $95ab,y
$1e:a345  df 36 b3 a9   cmp $a9b336,x
$1e:a349  be dc f4	  ldx $f4dc,y
$1e:a34c  ce c3 36	  dec $36c3
$1e:a34f  ea			nop
$1e:a350  48			pha
$1e:a351  ec 1e 6b	  cpx $6b1e
$1e:a354  25 97		 and $97
$1e:a356  cd b0 af	  cmp $afb0
$1e:a359  79 90 e0	  adc $e090,y
$1e:a35c  86 33		 stx $33
$1e:a35e  78			sei
$1e:a35f  d0 e8		 bne $a349
$1e:a361  86 40		 stx $40
$1e:a363  48			pha
$1e:a364  84 ad		 sty $ad
$1e:a366  30 14		 bmi $a37c
$1e:a368  44 b8 9b	  mvp $9b,$b8
$1e:a36b  c6 83		 dec $83
$1e:a36d  42 4a		 wdm #$4a
$1e:a36f  0c e6 a2	  tsb $a2e6
$1e:a372  a8			tay
$1e:a373  09 d2 9c	  ora #$9cd2
$1e:a376  4b			phk
$1e:a377  e2 72		 sep #$72
$1e:a379  15 2c		 ora $2c,x
$1e:a37b  9c 01 04	  stz $0401
$1e:a37e  2a			rol a
$1e:a37f  59 40 02	  eor $0240,y
$1e:a382  48			pha
$1e:a383  50 01		 bvc $a386
$1e:a385  41 99		 eor ($99,x)
$1e:a387  b6 02		 ldx $02,y
$1e:a389  84 a7		 sty $a7
$1e:a38b  0a			asl a
$1e:a38c  1a			inc a
$1e:a38d  7d 92 e6	  adc $e692,x
$1e:a390  a7 0a		 lda [$0a]
$1e:a392  08			php
$1e:a393  bb			tyx
$1e:a394  5f be 0e f0   eor $f00ebe,x
$1e:a398  ff 8c 3c 6c   sbc $6c3c8c,x
$1e:a39c  7b			tdc
$1e:a39d  83 c1		 sta $c1,s
$1e:a39f  6f c6 d1 c0   adc $c0d1c6
$1e:a3a3  f3 55		 sbc ($55,s),y
$1e:a3a5  aa			tax
$1e:a3a6  de 6e 38	  dec $386e,x
$1e:a3a9  da			phx
$1e:a3aa  18			clc
$1e:a3ab  01 57		 ora ($57,x)
$1e:a3ad  ab			plb
$1e:a3ae  d9 f9 e4	  cmp $e4f9,y
$1e:a3b1  50 df		 bvc $a392
$1e:a3b3  12 08		 ora ($08)
$1e:a3b5  90 1b		 bcc $a3d2
$1e:a3b7  ed 67 99	  sbc $9967
$1e:a3ba  64 44		 stz $44
$1e:a3bc  50 f3		 bvc $a3b1
$1e:a3be  1f c2 bc 7f   ora $7fbcc2,x
$1e:a3c2  1f 36 c1 82   ora $82c136,x
$1e:a3c6  56 02		 lsr $02,x
$1e:a3c8  28			plp
$1e:a3c9  3a			dec a
$1e:a3ca  81 ce		 sta ($ce,x)
$1e:a3cc  6e 42 4a	  ror $4a42
$1e:a3cf  89 14		 bit #$14
$1e:a3d1  17 46		 ora [$46],y
$1e:a3d3  ba			tsx
$1e:a3d4  07 20		 ora [$20]
$1e:a3d6  b8			clv
$1e:a3d7  89 3a		 bit #$3a
$1e:a3d9  4d 73 72	  eor $7273
$1e:a3dc  09 e4		 ora #$e4
$1e:a3de  2c e6 c1	  bit $c1e6
$1e:a3e1  51 03		 eor ($03),y
$1e:a3e3  a0 92		 ldy #$92
$1e:a3e5  a4 89		 ldy $89
$1e:a3e7  14 e0		 trb $e0
$1e:a3e9  ba			tsx
$1e:a3ea  45 46		 eor $46
$1e:a3ec  2a			rol a
$1e:a3ed  50 b0		 bvc $a39f
$1e:a3ef  26 09		 rol $09
$1e:a3f1  18			clc
$1e:a3f2  2b			pld
$1e:a3f3  31 69		 and ($69),y
$1e:a3f5  1a			inc a
$1e:a3f6  9d 8c c2	  sta $c28c,x
$1e:a3f9  79 2f 32	  adc $322f,y
$1e:a3fc  84 d4		 sty $d4
$1e:a3fe  21 2b		 and ($2b,x)
$1e:a400  91 fa		 sta ($fa),y
$1e:a402  eb			xba
$1e:a403  cc 92 7b	  cpy $7b92
$1e:a406  22 c4 4c c2   jsl $c24cc4
$1e:a40a  99 27 b1	  sta $b127,y
$1e:a40d  b0 0a		 bcs $a419
$1e:a40f  46 d7		 lsr $d7
$1e:a411  05 48		 ora $48
$1e:a413  88			dey
$1e:a414  05 64		 ora $64
$1e:a416  22 82 77 b2   jsl $b27782
$1e:a41a  44 92 23	  mvp $23,$92
$1e:a41d  44 33 08	  mvp $08,$33
$1e:a420  09 d6		 ora #$d6
$1e:a422  23 42		 and $42,s
$1e:a424  7f 88 49 d2   adc $d24988,x
$1e:a428  42 fe		 wdm #$fe
$1e:a42a  05 3a		 ora $3a
$1e:a42c  05 91		 ora $91
$1e:a42e  44 21 f1	  mvp $f1,$21
$1e:a431  19 0b 5c	  ora $5c0b,y
$1e:a434  0e cc 3f	  asl $3fcc
$1e:a437  4d 67 5f	  eor $5f67
$1e:a43a  ac 87 04	  ldy $0487
$1e:a43d  31 bf		 and ($bf),y
$1e:a43f  c6 ad		 dec $ad
$1e:a441  56 f3		 lsr $f3,x
$1e:a443  6c 3b fd	  jmp ($fd3b)
$1e:a446  e4 b8		 cpx $b8
$1e:a448  25 8c		 and $8c
$1e:a44a  3e 35 7a	  rol $7a35,x
$1e:a44d  bb			tyx
$1e:a44e  ac d4 cb	  ldy $cbd4
$1e:a451  c2 43		 rep #$43
$1e:a453  97 15		 sta [$15],y
$1e:a455  4d 1c a4	  eor $a41c
$1e:a458  b9 73 54	  lda $5473,y
$1e:a45b  d0 cf		 bne $a42c
$1e:a45d  f6 f6		 inc $f6,x
$1e:a45f  0e 04 12	  asl $1204
$1e:a462  33 a3		 and ($a3,s),y
$1e:a464  20 8c 89	  jsr $898c
$1e:a467  bc 02 83	  ldy $8302,x
$1e:a46a  a1 18		 lda ($18,x)
$1e:a46c  c8			iny
$1e:a46d  84 16		 sty $16
$1e:a46f  7e 7b b4	  ror $b47b,x
$1e:a472  c7 02		 cmp [$02]
$1e:a474  53 22		 eor ($22,s),y
$1e:a476  91 3f		 sta ($3f),y
$1e:a478  54 9a 07	  mvn $07,$9a
$1e:a47b  41 31		 eor ($31,x)
$1e:a47d  0d 81 bc	  ora $bc81
$1e:a480  05 20		 ora $20
$1e:a482  a1 84		 lda ($84,x)
$1e:a484  95 f2		 sta $f2,x
$1e:a486  86 20		 stx $20
$1e:a488  33 93		 and ($93,s),y
$1e:a48a  d4 90		 pei ($90)
$1e:a48c  42 a5		 wdm #$a5
$1e:a48e  10 a0		 bpl $a430
$1e:a490  10 58		 bpl $a4ea
$1e:a492  5e 00 b2	  lsr $b200,x
$1e:a495  79 84 e5	  adc $e584,y
$1e:a498  fe 3f d7	  inc $d73f,x
$1e:a49b  b0 8a		 bcs $a427
$1e:a49d  45 4a		 eor $4a
$1e:a49f  3e 63 7a	  rol $7a63,x
$1e:a4a2  a8			tay
$1e:a4a3  00 72		 brk #$72
$1e:a4a5  22 c1 58 92   jsl $9258c1
$1e:a4a9  c4 b5		 cpy $b5
$1e:a4ab  84 85		 sty $85
$1e:a4ad  60			rts
$1e:a4ae  93 04		 sta ($04,s),y
$1e:a4b0  b6 1e		 ldx $1e,y
$1e:a4b2  6a			ror a
$1e:a4b3  b5 59		 lda $59,x
$1e:a4b5  f6 4d		 inc $4d,x
$1e:a4b7  e6 03		 inc $03
$1e:a4b9  85 5e		 sta $5e
$1e:a4bb  ae 2b 26	  ldx $262b
$1e:a4be  f3 70		 sbc ($70,s),y
$1e:a4c0  90 65		 bcc $a527
$1e:a4c2  c5 6f		 cmp $6f
$1e:a4c4  47 29		 eor [$29]
$1e:a4c6  26 5c		 rol $5c
$1e:a4c8  d6 f7		 dec $f7,x
$1e:a4ca  b7 7c		 lda [$7c],y
$1e:a4cc  02 02		 cop #$02
$1e:a4ce  00 04		 brk #$04
$1e:a4d0  8b			phb
$1e:a4d1  bb			tyx
$1e:a4d2  de 4b 2d	  dec $2d4b,x
$1e:a4d5  77 ae		 adc [$ae],y
$1e:a4d7  2b			pld
$1e:a4d8  17 88		 ora [$88],y
$1e:a4da  c8			iny
$1e:a4db  bd 9e 6a	  lda $6a9e,x
$1e:a4de  0f 79 b4 98   ora $98b479
$1e:a4e2  1e 53 d0	  asl $d053,x
$1e:a4e5  fb			xce
$1e:a4e6  cf a5 c1 f2   cmp $f2c1a5
$1e:a4ea  77 9e		 adc [$9e],y
$1e:a4ec  41 de		 eor ($de,x)
$1e:a4ee  14 f7		 trb $f7
$1e:a4f0  c1 c0		 cmp ($c0,x)
$1e:a4f2  60			rts
$1e:a4f3  2e f3 a8	  rol $a8f3
$1e:a4f6  54 a2 f5	  mvn $f5,$a2
$1e:a4f9  71 c5		 adc ($c5),y
$1e:a4fb  3b			tsc
$1e:a4fc  c4 6e		 cpy $6e
$1e:a4fe  43 d0		 eor $d0,s
$1e:a500  26 c1		 rol $c1
$1e:a502  1c 8b 64	  trb $648b
$1e:a505  44 17 93	  mvp $93,$17
$1e:a508  c0 a3		 cpy #$a3
$1e:a50a  e4 d8		 cpx $d8
$1e:a50c  7b			tdc
$1e:a50d  9c 0c 7a	  stz $7a0c
$1e:a510  26 f7		 rol $f7
$1e:a512  7c 8c 46	  jmp ($468c,x)
$1e:a515  05 02		 ora $02
$1e:a517  77 a9		 adc [$a9],y
$1e:a519  10 5f		 bpl $a57a
$1e:a51b  23 28		 and $28,s
$1e:a51d  86 44		 stx $44
$1e:a51f  a6 f1		 ldx $f1
$1e:a521  45 7b		 eor $7b
$1e:a523  4c d1 42	  jmp $42d1
$1e:a526  ef 09 fc 71   sbc $71fc09
$1e:a52a  7e d3 b5	  ror $b5d3,x
$1e:a52d  d1 bb		 cmp ($bb),y
$1e:a52f  ee 22 ef	  inc $ef22
$1e:a532  82 20 0e	  brl $b355
$1e:a535  42 19		 wdm #$19
$1e:a537  42 03		 wdm #$03
$1e:a539  a0 25		 ldy #$25
$1e:a53b  1d af 8a	  ora $8aaf,x
$1e:a53e  1c 86 2c	  trb $2c86
$1e:a541  0a			asl a
$1e:a542  18			clc
$1e:a543  8c 88 e0	  sty $e088
$1e:a546  e6 d2		 inc $d2
$1e:a548  69 ac		 adc #$ac
$1e:a54a  d4 1e		 pei ($1e)
$1e:a54c  41 52		 eor ($52,x)
$1e:a54e  07 94		 ora [$94]
$1e:a550  fa			plx
$1e:a551  5d 3d 9e	  eor $9e3d,x
$1e:a554  87 c8		 sta [$c8]
$1e:a556  4a			lsr a
$1e:a557  41 f2		 eor ($f2,x)
$1e:a559  2c 91 64	  bit $6491
$1e:a55c  d7 62		 cmp [$62],y
$1e:a55e  d9 01 c9	  cmp $c901,y
$1e:a561  0c 6a 20	  tsb $206a
$1e:a564  78			sei
$1e:a565  28			plp
$1e:a566  11 3c		 ora ($3c),y
$1e:a568  93 c0		 sta ($c0,s),y
$1e:a56a  dc 01 da	  jml [$da01]
$1e:a56d  c5 4c		 cmp $4c
$1e:a56f  21 15		 and ($15,x)
$1e:a571  48			pha
$1e:a572  89 25		 bit #$25
$1e:a574  a0 31		 ldy #$31
$1e:a576  d3 88		 cmp ($88,s),y
$1e:a578  47 59		 eor [$59]
$1e:a57a  e2 39		 sep #$39
$1e:a57c  68			pla
$1e:a57d  11 84		 ora ($84),y
$1e:a57f  48			pha
$1e:a580  e0 cf		 cpx #$cf
$1e:a582  02 c9		 cop #$c9
$1e:a584  13 4a		 ora ($4a,s),y
$1e:a586  28			plp
$1e:a587  71 18		 adc ($18),y
$1e:a589  0a			asl a
$1e:a58a  c0 68		 cpy #$68
$1e:a58c  13 71		 ora ($71,s),y
$1e:a58e  da			phx
$1e:a58f  45 c8		 eor $c8
$1e:a591  a3 01		 lda $01,s
$1e:a593  33 4d		 and ($4d,s),y
$1e:a595  4a			lsr a
$1e:a596  05 24		 ora $24
$1e:a598  96 15		 stx $15,y
$1e:a59a  c1 0e		 cmp ($0e,x)
$1e:a59c  35 06		 and $06,x
$1e:a59e  c8			iny
$1e:a59f  50 22		 bvc $a5c3
$1e:a5a1  92 50		 sta ($50)
$1e:a5a3  85 4b		 sta $4b
$1e:a5a5  69 11		 adc #$11
$1e:a5a7  c9 28		 cmp #$28
$1e:a5a9  82 93 88	  brl $2e3f
$1e:a5ac  9e 18 74	  stz $7418,x
$1e:a5af  3e 2e e5	  rol $e52e,x
$1e:a5b2  08			php
$1e:a5b3  b2 6c		 lda ($6c)
$1e:a5b5  9d d0 9f	  sta $9fd0,x
$1e:a5b8  17 69		 ora [$69],y
$1e:a5ba  e2 b1		 sep #$b1
$1e:a5bc  60			rts
$1e:a5bd  22 c4 64 53   jsl $5364c4
$1e:a5c1  e2 89		 sep #$89
$1e:a5c3  08			php
$1e:a5c4  bb			tyx
$1e:a5c5  15 18		 ora $18,x
$1e:a5c7  e6 c4		 inc $c4
$1e:a5c9  36 aa		 rol $aa,x
$1e:a5cb  35 cd		 and $cd,x
$1e:a5cd  a8			tay
$1e:a5ce  75 18		 adc $18,x
$1e:a5d0  b0 c0		 bcs $a592
$1e:a5d2  b2 11		 lda ($11)
$1e:a5d4  18			clc
$1e:a5d5  8d f9 3e	  sta $3ef9
$1e:a5d8  19 77 71	  ora $7177,y
$1e:a5db  40			rti
$1e:a5dc  86 00		 stx $00
$1e:a5de  56 01		 lsr $01,x
$1e:a5e0  80 b7		 bra $a599
$1e:a5e2  8e 9e 3d	  stx $3d9e
$1e:a5e5  25 a8		 and $a8
$1e:a5e7  c0 a3		 cpy #$a3
$1e:a5e9  f1 fa		 sbc ($fa),y
$1e:a5eb  7b			tdc
$1e:a5ec  7c aa ee	  jmp ($eeaa,x)
$1e:a5ef  e5 18		 sbc $18
$1e:a5f1  0d 5d 3e	  ora $3e5d
$1e:a5f4  04 d2		 tsb $d2
$1e:a5f6  77 21		 adc [$21],y
$1e:a5f8  54 55 c2	  mvn $c2,$55
$1e:a5fb  5d 63 19	  eor $1963,x
$1e:a5fe  b7 8d		 lda [$8d],y
$1e:a600  dc 75 05	  jml [$0575]
$1e:a603  30 15		 bmi $a61a
$1e:a605  52 2b		 eor ($2b)
$1e:a607  01 80		 ora ($80,x)
$1e:a609  c5 52		 cmp $52
$1e:a60b  42 8f		 wdm #$8f
$1e:a60d  21 b0		 and ($b0,x)
$1e:a60f  1a			inc a
$1e:a610  06 3a		 asl $3a
$1e:a612  9c 08 eb	  stz $eb08
$1e:a615  b9 60 6d	  lda $6d60,y
$1e:a618  d2 4e		 cmp ($4e)
$1e:a61a  02 70		 cop #$70
$1e:a61c  00 04		 brk #$04
$1e:a61e  07 00		 ora [$00]
$1e:a620  58			cli
$1e:a621  03 01		 ora $01,s
$1e:a623  c6 05		 dec $05
$1e:a625  51 8f		 eor ($8f),y
$1e:a627  83 fc		 sta $fc,s
$1e:a629  41 a8		 eor ($a8,x)
$1e:a62b  92 64		 sta ($64)
$1e:a62d  84 3a		 sty $3a
$1e:a62f  1f 4f 7a 84   ora $847a4f,x
$1e:a633  59 92 11	  eor $1192,y
$1e:a636  02 41		 cop #$41
$1e:a638  bc ca ae	  ldy $aeca,x
$1e:a63b  f8			sed
$1e:a63c  35 b8		 and $b8,x
$1e:a63e  36 49		 rol $49,x
$1e:a640  b2 8d		 lda ($8d)
$1e:a642  74 74		 stz $74,x
$1e:a644  93 a5		 sta ($a5,s),y
$1e:a646  1c e8 ef	  trb $efe8
$1e:a649  43 e2		 eor $e2,s
$1e:a64b  22 46 a0 2f   jsl $2fa046
$1e:a64f  d2 53		 cmp ($53)
$1e:a651  91 f6		 sta ($f6),y
$1e:a653  9e 47 da	  stz $da47,x
$1e:a656  ba			tsx
$1e:a657  d0 0c		 bne $a665
$1e:a659  c0 4b		 cpy #$4b
$1e:a65b  c3 b0		 cmp $b0,s
$1e:a65d  0b			phd
$1e:a65e  d1 76		 cmp ($76),y
$1e:a660  4b			phk
$1e:a661  c0 87		 cpy #$87
$1e:a663  3d 42 1e	  and $1e42,x
$1e:a666  8b			phb
$1e:a667  58			cli
$1e:a668  aa			tax
$1e:a669  f0 22		 beq $a68d
$1e:a66b  b1 54		 lda ($54),y
$1e:a66d  bc c7 52	  ldy $52c7,x
$1e:a670  81 1d		 sta ($1d,x)
$1e:a672  8e a5 e2	  stx $e2a5
$1e:a675  05 02		 ora $02
$1e:a677  92 4b		 sta ($4b)
$1e:a679  20 4f 50	  jsr $504f
$1e:a67c  83 4a		 sta $4a,s
$1e:a67e  e8			inx
$1e:a67f  ea			nop
$1e:a680  f0 a8		 beq $a62a
$1e:a682  54 41 fe	  mvn $fe,$41
$1e:a685  20 d0 02	  jsr $02d0
$1e:a688  03 00		 ora $00,s
$1e:a68a  06 f6		 asl $f6
$1e:a68c  fa			plx
$1e:a68d  1d f7 ed	  ora $edf7,x
$1e:a690  8d 46 a2	  sta $a246
$1e:a693  40			rti
$1e:a694  0b			phd
$1e:a695  8d 40 e8	  sta $e840
$1e:a698  11 60		 ora ($60),y
$1e:a69a  8d 46 a1	  sta $a146
$1e:a69d  74 88		 stz $88,x
$1e:a69f  f0 86		 beq $a627
$1e:a6a1  a3 50		 lda $50,s
$1e:a6a3  fa			plx
$1e:a6a4  d5 8e		 cmp $8e,x
$1e:a6a6  a1 51		 lda ($51,x)
$1e:a6a8  19 c4 6a	  ora $6ac4,y
$1e:a6ab  27 07		 and [$07]
$1e:a6ad  fb			xce
$1e:a6ae  c1 60		 cmp ($60,x)
$1e:a6b0  d3 82		 cmp ($82,s),y
$1e:a6b2  23 bf		 and $bf,s
$1e:a6b4  c2 1f		 rep #$1f
$1e:a6b6  ef 86 80 27   sbc $278086
$1e:a6ba  d0 3f		 bne $a6fb
$1e:a6bc  08			php
$1e:a6bd  34 52		 bit $52,x
$1e:a6bf  35 eb		 and $eb,x
$1e:a6c1  77 87		 adc [$87],y
$1e:a6c3  a3 d7		 lda $d7,s
$1e:a6c5  eb			xba
$1e:a6c6  33 8c		 and ($8c,s),y
$1e:a6c8  69 fc		 adc #$fc
$1e:a6ca  27 01		 and [$01]
$1e:a6cc  34 03		 bit $03,x
$1e:a6ce  bc 0d 27	  ldy $270d,x
$1e:a6d1  12 f4		 ora ($f4)
$1e:a6d3  bc 00 ca	  ldy $ca00,x
$1e:a6d6  86 50		 stx $50
$1e:a6d8  40			rti
$1e:a6d9  81 94		 sta ($94,x)
$1e:a6db  0b			phd
$1e:a6dc  c1 ed		 cmp ($ed,x)
$1e:a6de  3f 81 94 12   and $129481,x
$1e:a6e2  62 67 13	  per $ba4c
$1e:a6e5  40			rti
$1e:a6e6  c4 8e		 cpy $8e
$1e:a6e8  a6 a1		 ldx $a1
$1e:a6ea  34 c9		 bit $c9,x
$1e:a6ec  99 09 40	  sta $4009,y
$1e:a6ef  a9 32		 lda #$32
$1e:a6f1  f6 83		 inc $83,x
$1e:a6f3  44 03 e1	  mvp $e1,$03
$1e:a6f6  2f 10 d2 c0   and $c0d210
$1e:a6fa  17 80		 ora [$80],y
$1e:a6fc  f0 37		 beq $a735
$1e:a6fe  b2 b0		 lda ($b0)
$1e:a700  76 34		 ror $34,x
$1e:a702  d1 c8		 cmp ($c8),y
$1e:a704  24 69		 bit $69
$1e:a706  c3 90		 cmp $90,s
$1e:a708  c8			iny
$1e:a709  d5 6a		 cmp $6a,x
$1e:a70b  13 08		 ora ($08,s),y
$1e:a70d  18			clc
$1e:a70e  45 80		 eor $80
$1e:a710  a6 10		 ldx $10
$1e:a712  71 8c		 adc ($8c),y
$1e:a714  c2 6b		 rep #$6b
$1e:a716  13 98		 ora ($98,s),y
$1e:a718  94 3c		 sty $3c,x
$1e:a71a  61 b0		 adc ($b0,x)
$1e:a71c  f2 06		 sbc ($06)
$1e:a71e  d0 4a		 bne $a76a
$1e:a720  1e 61 f3	  asl $f361,x
$1e:a723  97 a0		 sta [$a0],y
$1e:a725  fd 29 e3	  sbc $e329,x
$1e:a728  02 fe		 cop #$fe
$1e:a72a  92 8e		 sta ($8e)
$1e:a72c  2e 30 d8	  rol $d830
$1e:a72f  f9 03 55	  sbc $5503,y
$1e:a732  c0 40 ab	  cpy #$ab40
$1e:a735  15 45		 ora $45,x
$1e:a737  3c 03 0b	  bit $0b03,x
$1e:a73a  82 bb f2	  brl $99f8
$1e:a73d  b0 9d		 bcs $a6dc
$1e:a73f  10 08		 bpl $a749
$1e:a741  58			cli
$1e:a742  eb			xba
$1e:a743  40			rti
$1e:a744  12 11		 ora ($11)
$1e:a746  95 81		 sta $81,x
$1e:a748  5a			phy
$1e:a749  20 20 ac	  jsr $ac20
$1e:a74c  d9 00 44	  cmp $4400,y
$1e:a74f  33 20		 and ($20,s),y
$1e:a751  ea			nop
$1e:a752  00 e4		 brk #$e4
$1e:a754  5c 61 3e 62   jml $623e61
$1e:a758  a9 2b c3	  lda #$c32b
$1e:a75b  7e 2c f1	  ror $f12c,x
$1e:a75e  ef c5 5d f9   sbc $f95dc5
$1e:a762  59 8e bf	  eor $bf8e,y
$1e:a765  c2 a3		 rep #$a3
$1e:a767  50 60		 bvc $a7c9
$1e:a769  d4 6a		 pei ($6a)
$1e:a76b  27 06		 and [$06]
$1e:a76d  9c 34 6a	  stz $6a34
$1e:a770  34 df		 bit $df,x
$1e:a772  08			php
$1e:a773  93 86		 sta ($86,s),y
$1e:a775  98			tya
$1e:a776  57 53		 eor [$53],y
$1e:a778  3f 04 19 a3   and $a31904,x
$1e:a77c  71 46		 adc ($46),y
$1e:a77e  fe b8 07	  inc $07b8,x
$1e:a781  d7 ed		 cmp [$ed],y
$1e:a783  f4 7a 3d	  pea $3d7a
$1e:a786  62 42 10	  per $b7cb
$1e:a789  a4 68		 ldy $68
$1e:a78b  46 1e		 lsr $1e
$1e:a78d  d1 88		 cmp ($88),y
$1e:a78f  88			dey
$1e:a790  84 42		 sty $42
$1e:a792  91 21		 sta ($21),y
$1e:a794  b9 08 08	  lda $0808,y
$1e:a797  60			rts
$1e:a798  b1 a1		 lda ($a1),y
$1e:a79a  3b			tsc
$1e:a79b  10 14		 bpl $a7b1
$1e:a79d  7e 03 05	  ror $0503,x
$1e:a7a0  10 0f		 bpl $a7b1
$1e:a7a2  d4 84		 pei ($84)
$1e:a7a4  22 f0 20 2b   jsl $2b20f0
$1e:a7a8  7c 35 3f	  jmp ($3f35,x)
$1e:a7ab  6d 48 74	  adc $7448
$1e:a7ae  88			dey
$1e:a7af  28			plp
$1e:a7b0  2e 08 1f	  rol $1f08
$1e:a7b3  03 ed		 ora $ed,s
$1e:a7b5  c1 82		 cmp ($82,x)
$1e:a7b7  04 e6		 tsb $e6
$1e:a7b9  17 c8		 ora [$c8],y
$1e:a7bb  f8			sed
$1e:a7bc  72 61		 adc ($61)
$1e:a7be  91 a8		 sta ($a8),y
$1e:a7c0  b5 01		 lda $01,x
$1e:a7c2  3e b1 68	  rol $68b1,x
$1e:a7c5  ba			tsx
$1e:a7c6  ec 2b 13	  cpx $132b
$1e:a7c9  98			tya
$1e:a7ca  94 7a		 sty $7a,x
$1e:a7cc  90 af		 bcc $a77d
$1e:a7ce  58			cli
$1e:a7cf  f4 7e 13	  pea $137e
$1e:a7d2  08			php
$1e:a7d3  b0 3f		 bcs $a814
$1e:a7d5  41 e1		 eor ($e1,x)
$1e:a7d7  55 1a		 eor $1a,x
$1e:a7d9  92 b4		 sta ($b4)
$1e:a7db  00 17		 brk #$17
$1e:a7dd  38			sec
$1e:a7de  06 88		 asl $88
$1e:a7e0  46 83		 lsr $83
$1e:a7e2  63 00		 adc $00,s
$1e:a7e4  77 fa		 adc [$fa],y
$1e:a7e6  e8			inx
$1e:a7e7  00 23		 brk #$23
$1e:a7e9  62 ad 80	  per $2899
$1e:a7ec  8a			txa
$1e:a7ed  10 f0		 bpl $a7df
$1e:a7ef  20 41 d8	  jsr $d841
$1e:a7f2  68			pla
$1e:a7f3  e0 13 7e	  cpx #$7e13
$1e:a7f6  a5 8e		 lda $8e
$1e:a7f8  b4 01		 ldy $01,x
$1e:a7fa  30 53		 bmi $a84f
$1e:a7fc  d6 7f		 dec $7f,x
$1e:a7fe  62 65 0e	  per $b666
$1e:a801  29 06 01	  and #$0106
$1e:a804  ae 36 ff	  ldx $ff36
$1e:a807  f9 23 c7	  sbc $c723,y
$1e:a80a  3c 23 23	  bit $2323,x
$1e:a80d  6d 0c c9	  adc $c90c
$1e:a810  fb			xce
$1e:a811  e0 e7 a7	  cpx #$a7e7
$1e:a814  86 1d		 stx $1d
$1e:a816  81 ed		 sta ($ed,x)
$1e:a818  1f 7a 7a 97   ora $977a7a,x
$1e:a81c  c2 d6		 rep #$d6
$1e:a81e  43 f3		 eor $f3,s
$1e:a820  a7 85		 lda [$85]
$1e:a822  29 ea af	  and #$afea
$1e:a825  23 6f		 and $6f,s
$1e:a827  95 86		 sta $86,x
$1e:a829  9c f0 2f	  stz $2ff0
$1e:a82c  e8			inx
$1e:a82d  08			php
$1e:a82e  a8			tay
$1e:a82f  c1 cf		 cmp ($cf,x)
$1e:a831  16 f9		 asl $f9,x
$1e:a833  7a			ply
$1e:a834  7f e9 bf 56   adc $56bfe9,x
$1e:a838  7b			tdc
$1e:a839  7f d7 9e cd   adc $cd9ed7,x
$1e:a83d  f6 f7		 inc $f7,x
$1e:a83f  00 02		 brk #$02
$1e:a841  03 00		 ora $00,s
$1e:a843  06 f4		 asl $f4
$1e:a845  3b			tsc
$1e:a846  f6 44		 inc $44,x
$1e:a848  ff e8 dc d8   sbc $d8dce8,x
$1e:a84c  23 72		 and $72,s
$1e:a84e  29 1c f8	  and #$f81c
$1e:a851  43 72		 eor $72,s
$1e:a853  29 7c ce	  and #$ce7c
$1e:a856  ff 6e 99 8d   sbc $8d996e,x
$1e:a85a  20 5e 13	  jsr $135e
$1e:a85d  4b			phk
$1e:a85e  bd 1e 68	  lda $681e,x
$1e:a861  44 19 91	  mvp $91,$19
$1e:a864  15 05		 ora $05,x
$1e:a866  e2 34		 sep #$34
$1e:a868  1b			tcs
$1e:a869  fd f4 ac	  sbc $acf4,x
$1e:a86c  c3 f1		 cmp $f1,s
$1e:a86e  22 0e 12 4b   jsl $4b120e
$1e:a872  26 33		 rol $33
$1e:a874  a9 3c		 lda #$3c
$1e:a876  af f4 9b e4   lda $e49bf4
$1e:a87a  b5 fe		 lda $fe,x
$1e:a87c  e6 01		 inc $01
$1e:a87e  fe d2 b0	  inc $b0d2,x
$1e:a881  87 60		 sta [$60]
$1e:a883  08			php
$1e:a884  29 3d		 and #$3d
$1e:a886  0e a2 20	  asl $20a2
$1e:a889  52 fa		 eor ($fa)
$1e:a88b  9d 80 c0	  sta $c080,x
$1e:a88e  64 d2		 stz $d2
$1e:a890  39 82 4c	  and $4c82,y
$1e:a893  ca			dex
$1e:a894  06 3d		 asl $3d
$1e:a896  2b			pld
$1e:a897  bd 29 46	  lda $4629,x
$1e:a89a  c4 82		 cpy $82
$1e:a89c  47 b9		 eor [$b9]
$1e:a89e  41 2d		 eor ($2d,x)
$1e:a8a0  c9 fb		 cmp #$fb
$1e:a8a2  c3 e1		 cmp $e1,s
$1e:a8a4  a9 fe		 lda #$fe
$1e:a8a6  87 7e		 sta [$7e]
$1e:a8a8  9d dc ee	  sta $eedc,x
$1e:a8ab  a8			tay
$1e:a8ac  94 07		 sty $07,x
$1e:a8ae  b4 72		 ldy $72,x
$1e:a8b0  44 99 40	  mvp $40,$99
$1e:a8b3  fb			xce
$1e:a8b4  49 24		 eor #$24
$1e:a8b6  4b			phk
$1e:a8b7  94 17		 sty $17,x
$1e:a8b9  a9 d4		 lda #$d4
$1e:a8bb  59 46 cb	  eor $cb46,y
$1e:a8be  25 0a		 and $0a
$1e:a8c0  df 49 e9 6e   cmp $6ee949,x
$1e:a8c4  1b			tcs
$1e:a8c5  b4 98		 ldy $98,x
$1e:a8c7  be 92 72	  ldx $7292,y
$1e:a8ca  3b			tsc
$1e:a8cb  01 43		 ora ($43,x)
$1e:a8cd  75 cc		 adc $cc,x
$1e:a8cf  dd 81 41	  cmp $4181,x
$1e:a8d2  60			rts
$1e:a8d3  69 42		 adc #$42
$1e:a8d5  0b			phd
$1e:a8d6  87 0b		 sta [$0b]
$1e:a8d8  e9 c3		 sbc #$c3
$1e:a8da  0e 83 00	  asl $0083
$1e:a8dd  d4 84		 pei ($84)
$1e:a8df  28			plp
$1e:a8e0  0e 57 d3	  asl $d357
$1e:a8e3  96 2d		 stx $2d,y
$1e:a8e5  05 c2		 ora $c2
$1e:a8e7  1f 05 c3 2c   ora $2cc305,x
$1e:a8eb  33 68		 and ($68,s),y
$1e:a8ed  c5 fc		 cmp $fc
$1e:a8ef  f0 09		 beq $a8fa
$1e:a8f1  c3 22		 cmp $22,s
$1e:a8f3  02 8d		 cop #$8d
$1e:a8f5  10 e2		 bpl $a8d9
$1e:a8f7  ac 69 ac	  ldy $ac69
$1e:a8fa  da			phx
$1e:a8fb  6e 37 6b	  ror $6b37
$1e:a8fe  b1 04		 lda ($04),y
$1e:a900  6e f3 d9	  ror $d9f3
$1e:a903  f4 fc ce	  pea $cefc
$1e:a906  eb			xba
$1e:a907  63 59		 adc $59,s
$1e:a909  9f f6 67 6f   sta $6f67f6,x
$1e:a90d  a3 5f		 lda $5f,s
$1e:a90f  98			tya
$1e:a910  a8			tay
$1e:a911  a3 6b		 lda $6b,s
$1e:a913  bd 1d 2a	  lda $2a1d,x
$1e:a916  8b			phb
$1e:a917  34 4c		 bit $4c,x
$1e:a919  12 95		 ora ($95)
$1e:a91b  14 68		 trb $68
$1e:a91d  44 23 aa	  mvp $aa,$23
$1e:a920  05 69		 ora $69
$1e:a922  0e 4a 32	  asl $324a
$1e:a925  c2 92		 rep #$92
$1e:a927  4c 1e f2	  jmp $f21e
$1e:a92a  b9 31 64	  lda $6431,y
$1e:a92d  c3 ee		 cmp $ee,s
$1e:a92f  67 67		 adc [$67]
$1e:a931  82 35 00	  brl $a969
$1e:a934  ee a6 f0	  inc $f0a6
$1e:a937  00 93		 brk #$93
$1e:a939  8c 50 eb	  sty $eb50
$1e:a93c  22 97 cc d2   jsl $d2cc97
$1e:a940  36 8f		 rol $8f,x
$1e:a942  09 a2		 ora #$a2
$1e:a944  85 26		 sta $26
$1e:a946  4a			lsr a
$1e:a947  54 47 fc	  mvn $fc,$47
$1e:a94a  bf 0b 76 c3   lda $c3760b,x
$1e:a94e  92 50		 sta ($50)
$1e:a950  94 92		 sty $92,x
$1e:a952  b9 34 9e	  lda $9e34,y
$1e:a955  f9 25 93	  sbc $9325,y
$1e:a958  35 5e		 and $5e,x
$1e:a95a  44 df 09	  mvp $09,$df
$1e:a95d  79 96 64	  adc $6496,y
$1e:a960  54 e4 88	  mvn $88,$e4
$1e:a963  df ef b7 db   cmp $dbb7ef,x
$1e:a967  70 c4		 bvs $a92d
$1e:a969  a6 63		 ldx $63
$1e:a96b  51 50		 eor ($50),y
$1e:a96d  96 11		 stx $11,y
$1e:a96f  a8			tay
$1e:a970  12 72		 ora ($72)
$1e:a972  09 00		 ora #$00
$1e:a974  81 c8		 sta ($c8,x)
$1e:a976  09 12		 ora #$12
$1e:a978  1a			inc a
$1e:a979  bb			tyx
$1e:a97a  f0 d5		 beq $a951
$1e:a97c  00 45		 brk #$45
$1e:a97e  25 09		 and $09
$1e:a980  83 2d		 sta $2d,s
$1e:a982  ee 25 51	  inc $5125
$1e:a985  64 96		 stz $96
$1e:a987  18			clc
$1e:a988  48			pha
$1e:a989  60			rts
$1e:a98a  71 11		 adc ($11),y
$1e:a98c  8b			phb
$1e:a98d  54 e5 81	  mvn $81,$e5
$1e:a990  58			cli
$1e:a991  72 a8		 adc ($a8)
$1e:a993  99 e6 c6	  sta $c6e6,y
$1e:a996  f4 9b bd	  pea $bd9b
$1e:a999  da			phx
$1e:a99a  7c 7f 49	  jmp ($497f,x)
$1e:a99d  f8			sed
$1e:a99e  1e 96 47	  asl $4796,x
$1e:a9a1  7f b7 3e 90   adc $903eb7,x
$1e:a9a5  42 01		 wdm #$01
$1e:a9a7  f1 fe		 sbc ($fe),y
$1e:a9a9  91 c6		 sta ($c6),y
$1e:a9ab  8c 8a c0	  sty $c08a
$1e:a9ae  7a			ply
$1e:a9af  8f c9 7e e4   sta $e47ec9
$1e:a9b3  31 27		 and ($27),y
$1e:a9b5  9b			txy
$1e:a9b6  3d ca 80	  and $80ca,x
$1e:a9b9  de ef ea	  dec $eaef,x
$1e:a9bc  54 20 0f	  mvn $0f,$20
$1e:a9bf  2b			pld
$1e:a9c0  c2 e1		 rep #$e1
$1e:a9c2  de 59 46	  dec $4659,x
$1e:a9c5  fe bc b0	  inc $b0bc,x
$1e:a9c8  3f e3 0f 20   and $200fe3,x
$1e:a9cc  f9 4b cc	  sbc $cc4b,y
$1e:a9cf  7e 74 f4	  ror $f474,x
$1e:a9d2  2f a5 bd 4f   and $4fbda5
$1e:a9d6  eb			xba
$1e:a9d7  8f 64 fb 6b   sta $6bfb64
$1e:a9db  dd 7e fc	  cmp $fc7e,x
$1e:a9de  f0 6f		 beq $aa4f
$1e:a9e0  87 bc		 sta [$bc]
$1e:a9e2  5f e4 0f 28   eor $280fe4,x
$1e:a9e6  f9 8b ce	  sbc $ce8b,y
$1e:a9e9  7e 84 f4	  ror $f484,x
$1e:a9ec  af a9 bd 6f   lda $6fbda9
$1e:a9f0  ec 8f 6c	  cpx $6c8f
$1e:a9f3  fb			xce
$1e:a9f4  a8			tay
$1e:a9f5  80 02		 bra $a9f9
$1e:a9f7  03 00		 ora $00,s
$1e:a9f9  06 f4		 asl $f4
$1e:a9fb  3b			tsc
$1e:a9fc  f6 44		 inc $44,x
$1e:a9fe  ff e8 dc d8   sbc $d8dce8,x
$1e:aa02  22 91 c0 7a   jsl $7ac091
$1e:aa06  48			pha
$1e:aa07  a4 73		 ldy $73
$1e:aa09  e1 0a		 sbc ($0a,x)
$1e:aa0b  49 03 e9	  eor #$e903
$1e:aa0e  22 97 cc c6   jsl $c6cc97
$1e:aa12  27 7c		 and [$7c]
$1e:aa14  96 8b		 stx $8b,y
$1e:aa16  d0 5e		 bne $aa76
$1e:aa18  13 42		 ora ($42,s),y
$1e:aa1a  09 e1 26	  ora #$26e1
$1e:aa1d  b3 69		 lda ($69,s),y
$1e:aa1f  b9 04 85	  lda $8504,y
$1e:aa22  ed 6f 9e	  sbc $9e6f
$1e:aa25  cf a7 e3 b7   cmp $b7e3a7
$1e:aa29  fe 90 43	  inc $4390,x
$1e:aa2c  0f 85 a7 5d   ora $5da785
$1e:aa30  89 75 7c	  bit #$7c75
$1e:aa33  92 c9		 sta ($c9)
$1e:aa35  a4 e3		 ldy $e3
$1e:aa37  b4 c2		 ldy $c2,x
$1e:aa39  e1 6e		 sbc ($6e,x)
$1e:aa3b  c6 70		 dec $70
$1e:aa3d  c2 e1		 rep #$e1
$1e:aa3f  87 02		 sta [$02]
$1e:aa41  81 04		 sta ($04,x)
$1e:aa43  10 48		 bpl $aa8d
$1e:aa45  a5 72		 lda $72
$1e:aa47  63 c8		 adc $c8,s
$1e:aa49  1d c6 4d	  ora $4dc6,x
$1e:aa4c  2c 47 91	  bit $9147
$1e:aa4f  e4 1f		 cpx $1f
$1e:aa51  e5 2f		 sbc $2f
$1e:aa53  a7 8e		 lda [$8e]
$1e:aa55  01 fe		 ora ($fe,x)
$1e:aa57  b2 f0		 lda ($f0)
$1e:aa59  79 4d ef	  adc $ef4d,y
$1e:aa5c  84 80		 sty $80
$1e:aa5e  0b			phd
$1e:aa5f  ac dc 3e	  ldy $3edc
$1e:aa62  53 fb		 eor ($fb,s),y
$1e:aa64  b9 60 04	  lda $0460,y
$1e:aa67  eb			xba
$1e:aa68  3f 17 f9 03   and $03f917,x
$1e:aa6c  7d 0e fd	  adc $fd0e,x
$1e:aa6f  53 32		 eor ($32,s),y
$1e:aa71  99 97 62	  sta $6297,y
$1e:aa74  b7 50		 lda [$50],y
$1e:aa76  7a			ply
$1e:aa77  32 c5		 and ($c5)
$1e:aa79  8e a1 f4	  stx $f4a1
$1e:aa7c  6a			ror a
$1e:aa7d  4b			phk
$1e:aa7e  54 dc 92	  mvn $92,$dc
$1e:aa81  e5 16		 sbc $16
$1e:aa83  c0 34 46	  cpy #$4634
$1e:aa86  de c5 09	  dec $09c5,x
$1e:aa89  fb			xce
$1e:aa8a  45 ff		 eor $ff
$1e:aa8c  ae 10 42	  ldx $4210
$1e:aa8f  05 1a		 ora $1a
$1e:aa91  ec e1 12	  cpx $12e1
$1e:aa94  f8			sed
$1e:aa95  93 11		 sta ($11,s),y
$1e:aa97  28			plp
$1e:aa98  32 76		 and ($76)
$1e:aa9a  8b			phb
$1e:aa9b  98			tya
$1e:aa9c  83 0b		 sta $0b,s
$1e:aa9e  86 6c		 stx $6c
$1e:aaa0  0a			asl a
$1e:aaa1  00 2e		 brk #$2e
$1e:aaa3  c7 f4		 cmp [$f4]
$1e:aaa5  39 0c 9a	  and $9a0c,y
$1e:aaa8  59 22 95	  eor $9522,y
$1e:aaab  a4 42		 ldy $42
$1e:aaad  4e 8f 4a	  lsr $4a8f
$1e:aab0  3b			tsc
$1e:aab1  60			rts
$1e:aab2  00 c9		 brk #$c9
$1e:aab4  2f a7 a8 0e   and $0ea8a7
$1e:aab8  f8			sed
$1e:aab9  e8			inx
$1e:aaba  00 92		 brk #$92
$1e:aabc  4d d5 e9	  eor $e9d5
$1e:aabf  77 29		 adc [$29],y
$1e:aac1  80 89		 bra $aa4c
$1e:aac3  27 eb		 and [$eb]
$1e:aac5  f4 17 f9	  pea $f917
$1e:aac8  03 5a		 ora $5a,s
$1e:aaca  8c 52 66	  sty $6652
$1e:aacd  a0 19 90	  ldy #$9019
$1e:aad0  c4 b3		 cpy $b3
$1e:aad2  46 a3		 lsr $a3
$1e:aad4  9c d5 09	  stz $09d5
$1e:aad7  28			plp
$1e:aad8  51 43		 eor ($43),y
$1e:aada  82 52 52	  brl $fd2f
$1e:aadd  a2 74 05	  ldx #$0574
$1e:aae0  30 73		 bmi $ab55
$1e:aae2  14 ec		 trb $ec
$1e:aae4  a4 35		 ldy $35
$1e:aae6  a0 7d 16	  ldy #$167d
$1e:aae9  ec b5 17	  cpx $17b5
$1e:aaec  20 31 03	  jsr $0331
$1e:aaef  e8			inx
$1e:aaf0  c7 66		 cmp [$66]
$1e:aaf2  28			plp
$1e:aaf3  be 41 a9	  ldx $a941,y
$1e:aaf6  2d 53 7f	  and $7f53
$1e:aaf9  9b			txy
$1e:aafa  7e 5d fe	  ror $fe5d,x
$1e:aafd  00 f0		 brk #$f0
$1e:aaff  8f b0 4c 4e   sta $4e4cb0
$1e:ab03  b8			clv
$1e:ab04  51 c9		 eor ($c9),y
$1e:ab06  b4 48		 ldy $48,x
$1e:ab08  70 92		 bvs $aa9c
$1e:ab0a  62 33 11	  per $bc40
$1e:ab0d  99 29 27	  sta $2729,y
$1e:ab10  53 52		 eor ($52,s),y
$1e:ab12  1d 39 54	  ora $5439,x
$1e:ab15  4a			lsr a
$1e:ab16  41 c2		 eor ($c2,x)
$1e:ab18  32 01		 and ($01)
$1e:ab1a  69 27 53	  adc #$5327
$1e:ab1d  53 83		 eor ($83,s),y
$1e:ab1f  19 6e c1	  ora $c16e,y
$1e:ab22  f4 5b 8b	  pea $8b5b
$1e:ab25  5d 24 e2	  eor $e224,x
$1e:ab28  f4 06 09	  pea $0906
$1e:ab2b  05 25		 ora $25
$1e:ab2d  e3 f4		 sbc $f4,s
$1e:ab2f  a3 a2		 lda $a2,s
$1e:ab31  02 6d		 cop #$6d
$1e:ab33  1c 91 46	  trb $4691
$1e:ab36  ca			dex
$1e:ab37  21 37		 and ($37,x)
$1e:ab39  27 a5		 and [$a5]
$1e:ab3b  dd e6 13	  cmp $13e6,x
$1e:ab3e  e9 24 8a	  sbc #$8a24
$1e:ab41  46 61		 lsr $61
$1e:ab43  09 f9 7d	  ora #$7df9
$1e:ab46  1f 28 b0 66   ora $66b028,x
$1e:ab4a  40			rti
$1e:ab4b  2a			rol a
$1e:ab4c  c7 08		 cmp [$08]
$1e:ab4e  5a			phy
$1e:ab4f  09 ba ac	  ora #$acba
$1e:ab52  81 4c		 sta ($4c,x)
$1e:ab54  f2 fc		 sbc ($fc)
$1e:ab56  2d 18 0b	  and $0b18
$1e:ab59  e1 67		 sbc ($67,x)
$1e:ab5b  c2 af		 rep #$af
$1e:ab5d  c3 0c		 cmp $0c,s
$1e:ab5f  23 3c		 and $3c,s
$1e:ab61  28			plp
$1e:ab62  a0 58 42	  ldy #$4258
$1e:ab65  36 01		 rol $01,x
$1e:ab67  8a			txa
$1e:ab68  8d cc 66	  sta $66cc
$1e:ab6b  0d e8 24	  ora $24e8
$1e:ab6e  24 01		 bit $01
$1e:ab70  df cc 80 43   cmp $4380cc,x
$1e:ab74  17 fd		 ora [$fd],y
$1e:ab76  40			rti
$1e:ab77  58			cli
$1e:ab78  57 7f		 eor [$7f],y
$1e:ab7a  87 3c		 sta [$3c]
$1e:ab7c  5b			tcd
$1e:ab7d  e3 ef		 sbc $ef,s
$1e:ab7f  27 f9		 and [$f9]
$1e:ab81  83 ce		 sta $ce,s
$1e:ab83  3e 82 f4	  rol $f482,x
$1e:ab86  9f a9 3d 6b   sta $6b3da9,x
$1e:ab8a  ec 6f 6b	  cpx $6b6f
$1e:ab8d  fb			xce
$1e:ab8e  a3 df		 lda $df,s
$1e:ab90  3e 0a f0	  rol $f00a,x
$1e:ab93  df 8b 3c 7b   cmp $7b3c8b,x
$1e:ab97  e4 ef		 cpx $ef
$1e:ab99  2f f9 c3 d0   and $d0c3f9
$1e:ab9d  3e 92 f5	  rol $f592,x
$1e:aba0  1f ad 3d 8b   ora $8b3dad,x
$1e:aba4  ed 6f 73	  sbc $736f
$1e:aba7  a8			tay
$1e:aba8  02 02		 cop #$02
$1e:abaa  00 04		 brk #$04
$1e:abac  f6 fa		 inc $fa,x
$1e:abae  1d f6 ef	  ora $eff6,x
$1e:abb1  0f 53 fc 23   ora $23fc53
$1e:abb5  51 a8		 eor ($a8),y
$1e:abb7  90 10		 bcc $abc9
$1e:abb9  c1 44		 cmp ($44,x)
$1e:abbb  ef 28 d4 0e   sbc $0ed428
$1e:abbf  81 16		 sta ($16,x)
$1e:abc1  0a			asl a
$1e:abc2  94 10		 sty $10,x
$1e:abc4  26 11		 rol $11
$1e:abc6  67 f8		 adc [$f8]
$1e:abc8  fb			xce
$1e:abc9  63 50		 adc $50,s
$1e:abcb  ba			tsx
$1e:abcc  44 78 4a	  mvp $4a,$78
$1e:abcf  50 c1		 bvc $ab92
$1e:abd1  18			clc
$1e:abd2  47 9d		 eor [$9d]
$1e:abd4  e0 21 18	  cpx #$1821
$1e:abd7  7c 22 12	  jmp ($1222,x)
$1e:abda  35 1b		 and $1b,x
$1e:abdc  04 34		 tsb $34
$1e:abde  66 10		 ror $10
$1e:abe0  97 80		 sta [$80],y
$1e:abe2  7a			ply
$1e:abe3  fe b1 2a	  inc $2ab1,x
$1e:abe6  08			php
$1e:abe7  d8			cld
$1e:abe8  a1 35		 lda ($35,x)
$1e:abea  81 d8		 sta ($d8,x)
$1e:abec  c2 00		 rep #$00
$1e:abee  61 a9		 adc ($a9,x)
$1e:abf0  fb			xce
$1e:abf1  6a			ror a
$1e:abf2  46 92		 lsr $92
$1e:abf4  13 0e		 ora ($0e,s),y
$1e:abf6  07 db		 ora [$db]
$1e:abf8  83 17		 sta $17,s
$1e:abfa  22 bd 88 46   jsl $4688bd
$1e:abfe  1c 8f 8f	  trb $8f8f
$1e:ac01  26 3e		 rol $3e
$1e:ac03  35 7f		 and $7f,x
$1e:ac05  98			tya
$1e:ac06  f0 61		 beq $ac69
$1e:ac08  16 3a		 asl $3a,x
$1e:ac0a  85 45		 sta $45
$1e:ac0c  08			php
$1e:ac0d  55 21		 eor $21,x
$1e:ac0f  d8			cld
$1e:ac10  fb			xce
$1e:ac11  c8			iny
$1e:ac12  60			rts
$1e:ac13  48			pha
$1e:ac14  18			clc
$1e:ac15  2c 1a 70	  bit $701a
$1e:ac18  95 28		 sta $28,x
$1e:ac1a  a4 6a		 ldy $6a
$1e:ac1c  27 06		 and [$06]
$1e:ac1e  3f 90 e8 40   and $40e890,x
$1e:ac22  ae 8f 31	  ldx $318f
$1e:ac25  d8			cld
$1e:ac26  7a			ply
$1e:ac27  7d 2f 03	  adc $032f,x
$1e:ac2a  18			clc
$1e:ac2b  90 e0		 bcc $ac0d
$1e:ac2d  67 31		 adc [$31]
$1e:ac2f  25 b8		 and $b8
$1e:ac31  ad c1 6c	  lda $6cc1
$1e:ac34  4a			lsr a
$1e:ac35  f5 18		 sbc $18,x
$1e:ac37  07 ac		 ora [$ac]
$1e:ac39  5e 43 00	  lsr $0043,x
$1e:ac3c  5f b2 dd 97   eor $97ddb2,x
$1e:ac40  22 ef 47 b2   jsl $b247ef
$1e:ac44  a9 91 fe	  lda #$fe91
$1e:ac47  c4 f0		 cpy $f0
$1e:ac49  a0 45 81	  ldy #$8145
$1e:ac4c  f5 04		 sbc $04,x
$1e:ac4e  8d 52 23	  sta $2352
$1e:ac51  c1 fa		 cmp ($fa,x)
$1e:ac53  86 46		 stx $46
$1e:ac55  8e a6 30	  stx $30a6
$1e:ac58  63 d0		 adc $d0,s
$1e:ac5a  8c 28 d2	  sty $d228
$1e:ac5d  0e 40 17	  asl $1740
$1e:ac60  f2 14		 sbc ($14)
$1e:ac62  ea			nop
$1e:ac63  15 b2		 ora $b2,x
$1e:ac65  33 a5		 and ($a5,s),y
$1e:ac67  12 0e		 ora ($0e)
$1e:ac69  36 75		 rol $75,x
$1e:ac6b  22 43 c8 cf   jsl $cfc843
$1e:ac6f  14 8d		 trb $8d
$1e:ac71  37 14		 and [$14],y
$1e:ac73  70 a0		 bvs $ac15
$1e:ac75  d0 6e		 bne $ace5
$1e:ac77  0b			phd
$1e:ac78  3c 89 0b	  bit $0b89,x
$1e:ac7b  e8			inx
$1e:ac7c  f7 24		 sbc [$24],y
$1e:ac7e  71 d4		 adc ($d4),y
$1e:ac80  4a			lsr a
$1e:ac81  3a			dec a
$1e:ac82  75 8f		 adc $8f,x
$1e:ac84  b1 67		 lda ($67),y
$1e:ac86  7e e6 0e	  ror $0ee6,x
$1e:ac89  29 0a b0	  and #$b00a
$1e:ac8c  5d 0f 4f	  eor $4f0f,x
$1e:ac8f  a5 7e		 lda $7e
$1e:ac91  29 11 f6	  and #$f611
$1e:ac94  a5 0a		 lda $0a
$1e:ac96  c0 ad 07	  cpy #$07ad
$1e:ac99  b8			clv
$1e:ac9a  bd c1 ec	  lda $ecc1,x
$1e:ac9d  4e f5 49	  lsr $49f5
$1e:aca0  07 ad		 ora [$ad]
$1e:aca2  f6 49		 inc $49,x
$1e:aca4  24 01		 bit $01
$1e:aca6  93 dd		 sta ($dd,s),y
$1e:aca8  9d ec 07	  sta $07ec,x
$1e:acab  67 fa		 adc [$fa]
$1e:acad  85 9d		 sta $9d
$1e:acaf  de a8 12	  dec $12a8,x
$1e:acb2  4f 03 f1 a2   eor $a2f103
$1e:acb6  b1 6a		 lda ($6a),y
$1e:acb8  01 94		 ora ($94,x)
$1e:acba  60			rts
$1e:acbb  91 af		 sta ($af),y
$1e:acbd  61 b0		 adc ($b0,x)
$1e:acbf  14 85		 trb $85
$1e:acc1  59 8e c7	  eor $c78e,y
$1e:acc4  a9 07 51	  lda #$5107
$1e:acc7  86 15		 stx $15
$1e:acc9  4d 2a a6	  eor $a62a
$1e:accc  16 52		 asl $52,x
$1e:acce  31 c5		 and ($c5),y
$1e:acd0  8f f0 d6 44   sta $44d6f0
$1e:acd4  7c 20 90	  jmp ($9020,x)
$1e:acd7  3e 15 1a	  rol $1a15,x
$1e:acda  83 06		 sta $06,s
$1e:acdc  a3 51		 lda $51,s
$1e:acde  38			sec
$1e:acdf  34 e1		 bit $e1,x
$1e:ace1  a3 45		 lda $45,s
$1e:ace3  91 2b		 sta ($2b),y
$1e:ace5  13 89		 ora ($89,s),y
$1e:ace7  fd 1e e2	  sbc $e21e,x
$1e:acea  68			pla
$1e:aceb  07 8d		 ora [$8d]
$1e:aced  0a			asl a
$1e:acee  61 41		 adc ($41,x)
$1e:acf0  26 09		 rol $09
$1e:acf2  38			sec
$1e:acf3  d5 45		 cmp $45,x
$1e:acf5  58			cli
$1e:acf6  22 00 00 9e   jsl $9e0000
$1e:acfa  69 00 7d	  adc #$7d00
$1e:acfd  27 b8		 and [$b8]
$1e:acff  d8			cld
$1e:ad00  75 a5		 adc $a5,x
$1e:ad02  59 58 ea	  eor $ea58,y
$1e:ad05  44 41 00	  mvp $00,$41
$1e:ad08  11 7c		 ora ($7c),y
$1e:ad0a  29 c9 53	  and #$53c9
$1e:ad0d  a3 15		 lda $15,s
$1e:ad0f  00 1e		 brk #$1e
$1e:ad11  60			rts
$1e:ad12  49 0f 8b	  eor #$8b0f
$1e:ad15  ca			dex
$1e:ad16  c4 22		 cpy $22
$1e:ad18  22 20 33 b8   jsl $b83320
$1e:ad1c  4d e9 31	  eor $31e9
$1e:ad1f  6a			ror a
$1e:ad20  01 fc		 ora ($fc,x)
$1e:ad22  62 d1 70	  per $1df6
$1e:ad25  33 c7		 and ($c7,s),y
$1e:ad27  a9 08 f1	  lda #$f108
$1e:ad2a  8f 47 ca ce   sta $ceca47
$1e:ad2e  b2 b3		 lda ($b3)
$1e:ad30  60			rts
$1e:ad31  a8			tay
$1e:ad32  28			plp
$1e:ad33  b6 55		 ldx $55,y
$1e:ad35  1a			inc a
$1e:ad36  82 fe 45	  brl $f337
$1e:ad39  83 06		 sta $06,s
$1e:ad3b  9c 33 ea	  stz $ea33
$1e:ad3e  28			plp
$1e:ad3f  73 03		 adc ($03,s),y
$1e:ad41  72 38		 adc ($38)
$1e:ad43  1a			inc a
$1e:ad44  34 02		 bit $02,x
$1e:ad46  02 00		 cop #$00
$1e:ad48  04 b0		 tsb $b0
$1e:ad4a  3b			tsc
$1e:ad4b  fc 01 e1	  jsr ($e101,x)
$1e:ad4e  1f 11 78 cf   ora $cf7811,x
$1e:ad52  c8			iny
$1e:ad53  9e 55 f3	  stz $f355,x
$1e:ad56  37 9d		 and [$9d],y
$1e:ad58  fd 11 e9	  sbc $e911,x
$1e:ad5b  9f b0 57 2b   sta $2b57b0,x
$1e:ad5f  b5 64		 lda $64,x
$1e:ad61  dd 4b a4	  cmp $a44b,x
$1e:ad64  30 18		 bmi $ad7e
$1e:ad66  0a			asl a
$1e:ad67  6e 63 d0	  ror $d063
$1e:ad6a  c5 e8		 cmp $e8
$1e:ad6c  2f 8e b7 56   and $56b78e
$1e:ad70  af 57 d3 63   lda $63d357
$1e:ad74  26 82		 rol $82
$1e:ad76  33 16		 and ($16,s),y
$1e:ad78  c6 bd		 dec $bd
$1e:ad7a  08			php
$1e:ad7b  aa			tax
$1e:ad7c  6c a2 d2	  jmp ($d2a2)
$1e:ad7f  95 ed		 sta $ed,x
$1e:ad81  be 7c 15	  ldx $157c,y
$1e:ad84  eb			xba
$1e:ad85  0a			asl a
$1e:ad86  aa			tax
$1e:ad87  b5 4c		 lda $4c,x
$1e:ad89  2c d5 b6	  bit $b6d5
$1e:ad8c  58			cli
$1e:ad8d  b9 8c 2c	  lda $2c8c,y
$1e:ad90  ae 31 80	  ldx $8031
$1e:ad93  c8			iny
$1e:ad94  2a			rol a
$1e:ad95  eb			xba
$1e:ad96  28			plp
$1e:ad97  65 94		 adc $94
$1e:ad99  06 b5		 asl $b5
$1e:ad9b  1d 0b 34	  ora $340b,x
$1e:ad9e  cc ae 50	  cpy $50ae
$1e:ada1  18			clc
$1e:ada2  1c 9c 2c	  trb $2c9c
$1e:ada5  d3 53		 cmp ($53,s),y
$1e:ada7  31 c2		 and ($c2),y
$1e:ada9  e3 e1		 sbc $e1,s
$1e:adab  66 95		 ror $95
$1e:adad  36 c9		 rol $c9,x
$1e:adaf  7a			ply
$1e:adb0  13 08		 ora ($08,s),y
$1e:adb2  78			sei
$1e:adb3  58			cli
$1e:adb4  e1 d1		 sbc ($d1,x)
$1e:adb6  d6 51		 dec $51,x
$1e:adb8  9e 0a 47	  stz $470a,x
$1e:adbb  2f 64 14 c2   and $c21464
$1e:adbf  22 69 18 2b   jsl $2b1869
$1e:adc3  6c 60 73	  jmp ($7360)
$1e:adc6  73 d8		 adc ($d8,s),y
$1e:adc8  b6 8e		 ldx $8e,y
$1e:adca  07 2b		 ora [$2b]
$1e:adcc  b0 42		 bcs $ae10
$1e:adce  16 c4		 asl $c4,x
$1e:add0  6b			rtl
$1e:add1  22 31 45 02   jsl $024531
$1e:add5  c1 36		 cmp ($36,x)
$1e:add7  96 4b		 stx $4b,y
$1e:add9  42 c0		 wdm #$c0
$1e:addb  c7 16		 cmp [$16]
$1e:addd  48			pha
$1e:adde  2c c4 f6	  bit $f6c4
$1e:ade1  c5 b3		 cmp $b3
$1e:ade3  8b			phb
$1e:ade4  54 cb 21	  mvn $21,$cb
$1e:ade7  34 0b		 bit $0b,x
$1e:ade9  35 72		 and $72,x
$1e:adeb  ba			tsx
$1e:adec  56 19		 lsr $19,x
$1e:adee  04 08		 tsb $08
$1e:adf0  2c 50 92	  bit $9250
$1e:adf3  c8			iny
$1e:adf4  15 02		 ora $02,x
$1e:adf6  42 66		 wdm #$66
$1e:adf8  38			sec
$1e:adf9  50 64		 bvc $ae5f
$1e:adfb  64 40		 stz $40
$1e:adfd  11 1b		 ora ($1b),y
$1e:adff  11 dc		 ora ($dc),y
$1e:ae01  ea			nop
$1e:ae02  d5 74		 cmp $74,x
$1e:ae04  a9 91 89	  lda #$8991
$1e:ae07  2e a0 13	  rol $13a0
$1e:ae0a  5d 00 c3	  eor $c300,x
$1e:ae0d  2b			pld
$1e:ae0e  15 94		 ora $94,x
$1e:ae10  32 08		 and ($08)
$1e:ae12  19 42 23	  ora $2342,y
$1e:ae15  0b			phd
$1e:ae16  8e 4c 47	  stx $474c
$1e:ae19  a1 18		 lda ($18,x)
$1e:ae1b  20 c4 a1	  jsr $a1c4
$1e:ae1e  f8			sed
$1e:ae1f  32 89		 and ($89)
$1e:ae21  2c da 32	  bit $32da
$1e:ae24  20 55 f8	  jsr $f855
$1e:ae27  59 2c b6	  eor $b62c,y
$1e:ae2a  6b			rtl
$1e:ae2b  3b			tsc
$1e:ae2c  a4 16		 ldy $16
$1e:ae2e  46 3c		 lsr $3c
$1e:ae30  18			clc
$1e:ae31  9b			txy
$1e:ae32  a5 4a		 lda $4a
$1e:ae34  09 52 83	  ora #$8352
$1e:ae37  46 dd		 lsr $dd
$1e:ae39  2b			pld
$1e:ae3a  09 81 c1	  ora #$c181
$1e:ae3d  50 c1		 bvc $ae00
$1e:ae3f  03 9b		 ora $9b,s
$1e:ae41  ba			tsx
$1e:ae42  5a			phy
$1e:ae43  c1 24		 cmp ($24,x)
$1e:ae45  8b			phb
$1e:ae46  d8			cld
$1e:ae47  05 e0		 ora $e0
$1e:ae49  8d 67 4a	  sta $4a67
$1e:ae4c  45 93		 eor $93
$1e:ae4e  8e d1 f5	  stx $f5d1
$1e:ae51  dd 40 66	  cmp $6640,x
$1e:ae54  10 f5		 bpl $ae4b
$1e:ae56  68			pla
$1e:ae57  8b			phb
$1e:ae58  c6 28		 dec $28
$1e:ae5a  e9 51 40	  sbc #$4051
$1e:ae5d  4b			phk
$1e:ae5e  d5 a1		 cmp $a1,x
$1e:ae60  12 54		 ora ($54)
$1e:ae62  b9 ec 65	  lda $65ec,y
$1e:ae65  aa			tax
$1e:ae66  d0 8d		 bne $adf5
$1e:ae68  41 96		 eor ($96,x)
$1e:ae6a  c0 f9 69	  cpy #$69f9
$1e:ae6d  93 8b		 sta ($8b,s),y
$1e:ae6f  0f a0 ad 4a   ora $4aada0
$1e:ae73  a5 56		 lda $56
$1e:ae75  bc f1 20	  ldy $20f1,x
$1e:ae78  89 47 20	  bit #$2047
$1e:ae7b  f1 da		 sbc ($da),y
$1e:ae7d  e5 75		 sbc $75
$1e:ae7f  2c 30 b8	  bit $b830
$1e:ae82  fa			plx
$1e:ae83  b4 17		 ldy $17,x
$1e:ae85  43 1c		 eor $1c,s
$1e:ae87  98			tya
$1e:ae88  bb			tyx
$1e:ae89  c0 a6 07	  cpy #$07a6
$1e:ae8c  a3 56		 lda $56,s
$1e:ae8e  82 74 25	  brl $d405
$1e:ae91  d2 13		 cmp ($13)
$1e:ae93  b2 92		 lda ($92)
$1e:ae95  8d e6 66	  sta $66e6
$1e:ae98  36 9a		 rol $9a,x
$1e:ae9a  24 9c		 bit $9c
$1e:ae9c  cb			wai
$1e:ae9d  12 65		 ora ($65)
$1e:ae9f  40			rti
$1e:aea0  1c 9e 30	  trb $309e
$1e:aea3  31 29		 and ($29),y
$1e:aea5  54 64 c8	  mvn $c8,$64
$1e:aea8  b0 3b		 bcs $aee5
$1e:aeaa  35 9d		 and $9d,x
$1e:aeac  80 70		 bra $af1e
$1e:aeae  95 22		 sta $22,x
$1e:aeb0  c3 5c		 cmp $5c,s
$1e:aeb2  eb			xba
$1e:aeb3  64 b2		 stz $b2
$1e:aeb5  a4 42		 ldy $42
$1e:aeb7  07 59		 ora [$59]
$1e:aeb9  96 04		 stx $04,y
$1e:aebb  85 ce		 sta $ce
$1e:aebd  d1 06		 cmp ($06),y
$1e:aebf  45 38		 eor $38
$1e:aec1  30 01		 bmi $aec4
$1e:aec3  03 00		 ora $00,s
$1e:aec5  03 a0		 ora $a0,s
$1e:aec7  d2 5d		 cmp ($5d)
$1e:aec9  f8			sed
$1e:aeca  f0 aa		 beq $ae76
$1e:aecc  73 bc		 adc ($bc,s),y
$1e:aece  68			pla
$1e:aecf  3b			tsc
$1e:aed0  99 ee e2	  sta $e2ee,y
$1e:aed3  9f 4e dc 84   sta $84dc4e,x
$1e:aed7  86 9e		 stx $9e
$1e:aed9  10 17		 bpl $aef2
$1e:aedb  78			sei
$1e:aedc  50 a6		 bvc $ae84
$1e:aede  5a			phy
$1e:aedf  59 94 ce	  eor $ce94,y
$1e:aee2  65 31		 adc $31
$1e:aee4  99 cc 44	  sta $44cc,y
$1e:aee7  e1 34		 sbc ($34,x)
$1e:aee9  d2 cd		 cmp ($cd)
$1e:aeeb  03 81		 ora $81,s
$1e:aeed  42 13		 wdm #$13
$1e:aeef  04 d0		 tsb $d0
$1e:aef1  46 73		 lsr $73
$1e:aef3  41 b8		 eor ($b8,x)
$1e:aef5  89 82 81	  bit #$8182
$1e:aef8  42 1c		 wdm #$1c
$1e:aefa  0c ce 67	  tsb $67ce
$1e:aefd  96 cb		 stx $cb,y
$1e:aeff  90 c2		 bcc $aec3
$1e:af01  69 32 19	  adc #$1932
$1e:af04  04 d2		 tsb $d2
$1e:af06  81 49		 sta ($49,x)
$1e:af08  d8			cld
$1e:af09  8d 4b 3d	  sta $3d4b
$1e:af0c  9f 1b a1 34   sta $34a11b,x
$1e:af10  05 c1		 ora $c1
$1e:af12  3d 19 00	  and $0019,x
$1e:af15  94 66		 sty $66,x
$1e:af17  44 a0 25	  mvp $25,$a0
$1e:af1a  04 d3		 tsb $d3
$1e:af1c  60			rts
$1e:af1d  fe 0a 10	  inc $100a,x
$1e:af20  94 04		 sty $04,x
$1e:af22  63 fd		 adc $fd,s
$1e:af24  33 14		 and ($14,s),y
$1e:af26  c6 78		 dec $78
$1e:af28  5e 00 78	  lsr $7800,x
$1e:af2b  0c 44 cc	  tsb $cc44
$1e:af2e  53 c2		 eor ($c2,s),y
$1e:af30  58			cli
$1e:af31  8b			phb
$1e:af32  00 3c		 brk #$3c
$1e:af34  02 60		 cop #$60
$1e:af36  d2 92		 cmp ($92)
$1e:af38  00 cc		 brk #$cc
$1e:af3a  03 72		 ora $72,s
$1e:af3c  11 01		 ora ($01),y
$1e:af3e  f0 07		 beq $af47
$1e:af40  e2 72		 sep #$72
$1e:af42  11 20		 ora ($20),y
$1e:af44  19 c4 8e	  ora $8ec4,y
$1e:af47  43 e0		 eor $e0,s
$1e:af49  13 89		 ora ($89,s),y
$1e:af4b  c4 76		 cpy $76
$1e:af4d  13 99		 ora ($99,s),y
$1e:af4f  ce c4 8e	  dec $8ec4
$1e:af52  33 32		 and ($32,s),y
$1e:af54  70 2e		 bvs $af84
$1e:af56  00 82		 brk #$82
$1e:af58  44 e0 77	  mvp $77,$e0
$1e:af5b  82 e4 0d	  brl $bd42
$1e:af5e  80 0e		 bra $af6e
$1e:af60  07 80		 ora [$80]
$1e:af62  6c 67 a2	  jmp ($a267)
$1e:af65  60			rts
$1e:af66  0e 08 b8	  asl $b808
$1e:af69  57 a2		 eor [$a2],y
$1e:af6b  f0 2d		 beq $af9a
$1e:af6d  88			dey
$1e:af6e  88			dey
$1e:af6f  0b			phd
$1e:af70  a2 d0		 ldx #$d0
$1e:af72  13 68		 ora ($68,s),y
$1e:af74  33 88		 and ($88,s),y
$1e:af76  de 22 50	  dec $5022,x
$1e:af79  63 13		 adc $13,s
$1e:af7b  bc 9b e4	  ldy $e49b,x
$1e:af7e  70 03		 bvs $af83
$1e:af80  38			sec
$1e:af81  39 c9 be	  and $bec9,y
$1e:af84  4f 93 5c 0b   eor $0b5c93
$1e:af88  de 8d c1	  dec $c18d,x
$1e:af8b  b9 03 62	  lda $6203,y
$1e:af8e  7c 11 81	  jmp ($8111,x)
$1e:af91  4e 0c ca	  lsr $ca0c
$1e:af94  3c 51 62	  bit $6251,x
$1e:af97  0a			asl a
$1e:af98  81 28		 sta ($28,x)
$1e:af9a  26 c1		 rol $c1
$1e:af9c  26 1b		 rol $1b
$1e:af9e  8a			txa
$1e:af9f  78			sei
$1e:afa0  25 69		 and $69
$1e:afa2  ca			dex
$1e:afa3  11 4d		 ora ($4d),y
$1e:afa5  0a			asl a
$1e:afa6  6c 28 14	  jmp ($1428)
$1e:afa9  9a			txs
$1e:afaa  09 b4		 ora #$b4
$1e:afac  68			pla
$1e:afad  4a			lsr a
$1e:afae  00 02		 brk #$02
$1e:afb0  02 88		 cop #$88
$1e:afb2  e8			inx
$1e:afb3  06 e2		 asl $e2
$1e:afb5  a0 d0		 ldy #$d0
$1e:afb7  a7 84		 lda [$84]
$1e:afb9  61 98		 adc ($98,x)
$1e:afbb  e9 5b		 sbc #$5b
$1e:afbd  60			rts
$1e:afbe  d5 03		 cmp $03,x
$1e:afc0  69 ee		 adc #$ee
$1e:afc2  48			pha
$1e:afc3  e0 a8		 cpx #$a8
$1e:afc5  03 98		 ora $98,s
$1e:afc7  25 c5		 and $c5
$1e:afc9  cc 08 01	  cpy $0108
$1e:afcc  22 88 10 0e   jsl $0e1088
$1e:afd0  82 a4 16	  brl $c677
$1e:afd3  e0 1c		 cpx #$1c
$1e:afd5  0f 4a 04 13   ora $13044a
$1e:afd9  c8			iny
$1e:afda  a5 00		 lda $00
$1e:afdc  4c 08 01	  jmp $0108
$1e:afdf  7a			ply
$1e:afe0  0a			asl a
$1e:afe1  e8			inx
$1e:afe2  54 a4 65	  mvn $65,$a4
$1e:afe5  03 e1		 ora $e1,s
$1e:afe7  4e 5a 21	  lsr $215a
$1e:afea  b1 5a		 lda ($5a),y
$1e:afec  9c ca 79	  stz $79ca
$1e:afef  b0 3e		 bcs $b02f
$1e:aff1  99 b4 5a	  sta $5ab4,y
$1e:aff4  81 b0		 sta ($b0,x)
$1e:aff6  68			pla
$1e:aff7  8c e4 dc	  sty $dce4
$1e:affa  30 07		 bmi $b003
$1e:affc  7f 80 3c 23   adc $233c80,x
$1e:b000  e2 2f		 sep #$2f
$1e:b002  19 f9 0b	  ora $0bf9,y
$1e:b005  3f 73 4c f6   and $f64c73,x
$1e:b009  7d 30 1f	  adc $1f30,x
$1e:b00c  b2 13		 lda ($13)
$1e:b00e  a8			tay
$1e:b00f  41 42		 eor ($42,x)
$1e:b011  0b			phd
$1e:b012  50 9a		 bvc $afae
$1e:b014  16 a1		 asl $a1,x
$1e:b016  70 1f		 bvs $b037
$1e:b018  f5 a0		 sbc $a0,x
$1e:b01a  96 a6		 stx $a6,y
$1e:b01c  65 32		 adc $32
$1e:b01e  9a			txs
$1e:b01f  4f 26 84 a9   eor $a98426
$1e:b023  53 8c		 eor ($8c,s),y
$1e:b025  d0 b3		 bne $afda
$1e:b027  0a			asl a
$1e:b028  2f 59 fb 13   and $13fb59
$1e:b02c  da			phx
$1e:b02d  be e6 60	  ldx $60e6,y
$1e:b030  02 02		 cop #$02
$1e:b032  00 04		 brk #$04
$1e:b034  f4 3b f6	  pea $f63b
$1e:b037  44 ff e8	  mvp $e8,$ff
$1e:b03a  dc d8 23	  jml [$23d8]
$1e:b03d  72 29		 adc ($29)
$1e:b03f  1c f8 43	  trb $43f8
$1e:b042  72 29		 adc ($29)
$1e:b044  7c ce ff	  jmp ($ffce,x)
$1e:b047  6e 99 8d	  ror $8d99
$1e:b04a  20 5e 13	  jsr $135e
$1e:b04d  4b			phk
$1e:b04e  bd 1e 68	  lda $681e,x
$1e:b051  44 19 91	  mvp $91,$19
$1e:b054  15 05		 ora $05,x
$1e:b056  e2 34		 sep #$34
$1e:b058  1b			tcs
$1e:b059  fd f4 ac	  sbc $acf4,x
$1e:b05c  c3 f1		 cmp $f1,s
$1e:b05e  22 0e 12 4b   jsl $4b120e
$1e:b062  26 33		 rol $33
$1e:b064  a9 3c		 lda #$3c
$1e:b066  af f4 9b e4   lda $e49bf4
$1e:b06a  b5 fe		 lda $fe,x
$1e:b06c  e6 01		 inc $01
$1e:b06e  80 52		 bra $b0c2
$1e:b070  b0 87		 bcs $aff9
$1e:b072  60			rts
$1e:b073  08			php
$1e:b074  29 3d		 and #$3d
$1e:b076  0e a2 20	  asl $20a2
$1e:b079  52 fa		 eor ($fa)
$1e:b07b  9d 80 c0	  sta $c080,x
$1e:b07e  64 d2		 stz $d2
$1e:b080  39 82 4c	  and $4c82,y
$1e:b083  ca			dex
$1e:b084  06 3d		 asl $3d
$1e:b086  2b			pld
$1e:b087  bd 29 46	  lda $4629,x
$1e:b08a  c4 82		 cpy $82
$1e:b08c  47 b9		 eor [$b9]
$1e:b08e  41 2d		 eor ($2d,x)
$1e:b090  c9 fb		 cmp #$fb
$1e:b092  c3 e1		 cmp $e1,s
$1e:b094  a9 fe		 lda #$fe
$1e:b096  87 7e		 sta [$7e]
$1e:b098  9d dc ee	  sta $eedc,x
$1e:b09b  a8			tay
$1e:b09c  94 07		 sty $07,x
$1e:b09e  b4 72		 ldy $72,x
$1e:b0a0  44 99 40	  mvp $40,$99
$1e:b0a3  fb			xce
$1e:b0a4  49 24		 eor #$24
$1e:b0a6  4b			phk
$1e:b0a7  94 17		 sty $17,x
$1e:b0a9  a9 d4		 lda #$d4
$1e:b0ab  59 46 cb	  eor $cb46,y
$1e:b0ae  25 0a		 and $0a
$1e:b0b0  df 49 e9 6e   cmp $6ee949,x
$1e:b0b4  1b			tcs
$1e:b0b5  b4 98		 ldy $98,x
$1e:b0b7  be 92 72	  ldx $7292,y
$1e:b0ba  3b			tsc
$1e:b0bb  01 55		 ora ($55,x)
$1e:b0bd  60			rts
$1e:b0be  69 42		 adc #$42
$1e:b0c0  0c 2b 00	  tsb $002b
$1e:b0c3  d4 84		 pei ($84)
$1e:b0c5  28			plp
$1e:b0c6  55 c2		 eor $c2,x
$1e:b0c8  1f 05 c3 2c   ora $2cc305,x
$1e:b0cc  33 68		 and ($68,s),y
$1e:b0ce  c5 fc		 cmp $fc
$1e:b0d0  f0 09		 beq $b0db
$1e:b0d2  c3 22		 cmp $22,s
$1e:b0d4  02 8d		 cop #$8d
$1e:b0d6  10 e2		 bpl $b0ba
$1e:b0d8  ac 69 ac	  ldy $ac69
$1e:b0db  da			phx
$1e:b0dc  6e 37 6b	  ror $6b37
$1e:b0df  b1 04		 lda ($04),y
$1e:b0e1  6e f3 d9	  ror $d9f3
$1e:b0e4  f4 fc ce	  pea $cefc
$1e:b0e7  f2 f9		 sbc ($f9)
$1e:b0e9  9c cd 72	  stz $72cd
$1e:b0ec  0b			phd
$1e:b0ed  33 80		 and ($80,s),y
$1e:b0ef  4c ed f4	  jmp $f4ed
$1e:b0f2  6b			rtl
$1e:b0f3  f3 bc		 sbc ($bc,s),y
$1e:b0f5  26 93		 rol $93
$1e:b0f7  44 38 28	  mvp $28,$38
$1e:b0fa  da			phx
$1e:b0fb  ef 47 77 93   sbc $937747
$1e:b0ff  c4 16		 cpy $16
$1e:b101  68			pla
$1e:b102  11 20		 ora ($20),y
$1e:b104  3a			dec a
$1e:b105  28			plp
$1e:b106  d2 64		 cmp ($64)
$1e:b108  09 17		 ora #$17
$1e:b10a  78			sei
$1e:b10b  2e 44 29	  rol $2944
$1e:b10e  68			pla
$1e:b10f  72 51		 adc ($51)
$1e:b111  96 14		 stx $14,y
$1e:b113  92 60		 sta ($60)
$1e:b115  f7 95		 sbc [$95],y
$1e:b117  c9 8b		 cmp #$8b
$1e:b119  26 1f		 rol $1f
$1e:b11b  73 3b		 adc ($3b,s),y
$1e:b11d  3c 12 6b	  bit $6b12,x
$1e:b120  36 3b		 rol $3b,x
$1e:b122  ab			plb
$1e:b123  fd 1c 62	  sbc $621c,x
$1e:b126  87 50		 sta [$50]
$1e:b128  bb			tyx
$1e:b129  24 58		 bit $58
$1e:b12b  0e 80 91	  asl $9180
$1e:b12e  15 90		 ora $90,x
$1e:b130  ac 51 fe	  ldy $fe51
$1e:b133  48			pha
$1e:b134  0b			phd
$1e:b135  b6 1f		 ldx $1f,y
$1e:b137  0a			asl a
$1e:b138  c4 82		 cpy $82
$1e:b13a  b8			clv
$1e:b13b  c9 ef		 cmp #$ef
$1e:b13d  92 52		 sta ($52)
$1e:b13f  ca			dex
$1e:b140  16 cc		 asl $cc,x
$1e:b142  dc 26 59	  jml [$5926]
$1e:b145  91 53		 sta ($53),y
$1e:b147  82 23 7f	  brl $306d
$1e:b14a  be df 6d	  ldx $6ddf,y
$1e:b14d  c3 12		 cmp $12,s
$1e:b14f  1a			inc a
$1e:b150  10 84		 bpl $b0d6
$1e:b152  da			phx
$1e:b153  81 27		 sta ($27,x)
$1e:b155  20 90 90	  jsr $9090
$1e:b158  8a			txa
$1e:b159  2a			rol a
$1e:b15a  38			sec
$1e:b15b  47 e1		 eor [$e1]
$1e:b15d  aa			tax
$1e:b15e  00 8a		 brk #$8a
$1e:b160  4a			lsr a
$1e:b161  13 06		 ora ($06,s),y
$1e:b163  5b			tcd
$1e:b164  dc 4a a2	  jml [$a24a]
$1e:b167  c4 2c		 cpy $2c
$1e:b169  30 90		 bmi $b0fb
$1e:b16b  c0 e2		 cpy #$e2
$1e:b16d  23 16		 and $16,s
$1e:b16f  c9 cb		 cmp #$cb
$1e:b171  02 b0		 cop #$b0
$1e:b173  e5 51		 sbc $51
$1e:b175  33 cd		 and ($cd,s),y
$1e:b177  8d e9 37	  sta $37e9
$1e:b17a  7b			tdc
$1e:b17b  b4 f8		 ldy $f8,x
$1e:b17d  fe 93 f0	  inc $f093,x
$1e:b180  3d 05 ce	  and $ce05,x
$1e:b183  ff 6e 7d 20   sbc $207d6e,x
$1e:b187  84 03		 sty $03
$1e:b189  e3 00		 sbc $00,s
$1e:b18b  23 8d		 and $8d,s
$1e:b18d  19 15 81	  ora $8115,y
$1e:b190  85 1f		 sta $1f
$1e:b192  92 fd		 sta ($fd)
$1e:b194  c8			iny
$1e:b195  62 4f 36	  per $e7e7
$1e:b198  7b			tdc
$1e:b199  95 01		 sta $01,x
$1e:b19b  bd c0 02	  lda $02c0,x
$1e:b19e  02 00		 cop #$00
$1e:b1a0  04 bb		 tsb $bb
$1e:b1a2  3b			tsc
$1e:b1a3  fc 01 e1	  jsr ($e101,x)
$1e:b1a6  1f 11 78 cf   ora $cf7811,x
$1e:b1aa  b4 e3		 ldy $e3,x
$1e:b1ac  3c bc 6c	  bit $6cbc,x
$1e:b1af  ae e4 6f	  ldx $6fe4
$1e:b1b2  2b			pld
$1e:b1b3  dd ec ab	  cmp $abec,x
$1e:b1b6  b8			clv
$1e:b1b7  32 a8		 and ($a8)
$1e:b1b9  5e 2f 28	  lsr $282f,x
$1e:b1bc  80 2a		 bra $b1e8
$1e:b1be  a2 1c		 ldx #$1c
$1e:b1c0  50 85		 bvc $b147
$1e:b1c2  7a			ply
$1e:b1c3  4c 02 2d	  jmp $2d02
$1e:b1c6  53 00		 eor ($00,s),y
$1e:b1c8  84 2c		 sty $2c
$1e:b1ca  05 f3		 ora $f3
$1e:b1cc  02 55		 cop #$55
$1e:b1ce  02 21		 cop #$21
$1e:b1d0  29 c6		 and #$c6
$1e:b1d2  fc 85 1b	  jsr ($1b85,x)
$1e:b1d5  fd f6 fc	  sbc $fcf6,x
$1e:b1d8  88			dey
$1e:b1d9  02 a1		 cop #$a1
$1e:b1db  69 f5		 adc #$f5
$1e:b1dd  1a			inc a
$1e:b1de  94 21		 sty $21,x
$1e:b1e0  2e 05 30	  rol $3005
$1e:b1e3  05 41		 ora $41
$1e:b1e5  31 82		 and ($82),y
$1e:b1e7  49 17		 eor #$17
$1e:b1e9  01 7d		 ora ($7d,x)
$1e:b1eb  be 36 c2	  ldx $c236,y
$1e:b1ee  ef 76 bc 6c   sbc $6cbc76
$1e:b1f2  af 57 ac 1b   lda $1bac57
$1e:b1f6  78			sei
$1e:b1f7  70 7a		 bvs $b273
$1e:b1f9  ad 43 a8	  lda $a843
$1e:b1fc  6e d7 6c	  ror $6cd7
$1e:b1ff  1d e5 e2	  ora $e2e5,x
$1e:b202  18			clc
$1e:b203  06 18		 asl $18
$1e:b205  6a			ror a
$1e:b206  bf 6e e0 7c   lda $7ce06e,x
$1e:b20a  9d f9 c4	  sta $c4f9,x
$1e:b20d  17 ab		 ora [$ab],y
$1e:b20f  fd e5 e0	  sbc $e0e5,x
$1e:b212  1f c7 ca df   ora $dfcac7,x
$1e:b216  ef 81 10 be   sbc $be1081
$1e:b21a  b8			clv
$1e:b21b  c2 f4		 rep #$f4
$1e:b21d  f9 57 78	  sbc $7857,y
$1e:b220  3a			dec a
$1e:b221  43 53		 eor $53,s
$1e:b223  7f c0 5f 70   adc $705fc0,x
$1e:b227  21 86		 and ($86,x)
$1e:b229  17 f9		 ora [$f9],y
$1e:b22b  03 ca		 ora $ca,s
$1e:b22d  3e 62 f3	  rol $f362,x
$1e:b230  9f be 4a f0   sta $f04abe,x
$1e:b234  f1 16		 sbc ($16),y
$1e:b236  f0 1f		 beq $b257
$1e:b238  e4 02		 cpx $02
$1e:b23a  28			plp
$1e:b23b  d3 d3		 cmp ($d3,s),y
$1e:b23d  be 4f 4f	  ldx $4f4f,y
$1e:b240  78			sei
$1e:b241  c0 5f 30	  cpy #$305f
$1e:b244  28			plp
$1e:b245  d2 70		 cmp ($70)
$1e:b247  02 b5		 cop #$b5
$1e:b249  2f 37 fb ed   and $edfb37
$1e:b24d  f9 5b 40	  sbc $405b,y
$1e:b250  30 5d		 bmi $b2af
$1e:b252  ad ed 5a	  lda $5aed
$1e:b255  6a			ror a
$1e:b256  a0 be ae	  ldy #$aebe
$1e:b259  d7 06		 cmp [$06],y
$1e:b25b  8d 31 10	  sta $1031
$1e:b25e  36 92		 rol $92,x
$1e:b260  f0 11		 beq $b273
$1e:b262  17 60		 ora [$60],y
$1e:b264  22 41 c4 4a   jsl $4ac441
$1e:b268  23 d4		 and $d4,s
$1e:b26a  00 45		 brk #$45
$1e:b26c  30 38		 bmi $b2a6
$1e:b26e  34 50		 bit $50,x
$1e:b270  ac 8d 28	  ldy $288d
$1e:b273  97 fb		 sta [$fb],y
$1e:b275  f2 68		 sbc ($68)
$1e:b277  41 95		 eor ($95,x)
$1e:b279  7d 78 8d	  adc $8d78,x
$1e:b27c  f1 1b		 sbc ($1b),y
$1e:b27e  00 12		 brk #$12
$1e:b280  01 8a		 ora ($8a,x)
$1e:b282  06 88		 asl $88
$1e:b284  e6 92		 inc $92
$1e:b286  92 b9		 sta ($b9)
$1e:b288  a4 99		 ldy $99
$1e:b28a  54 06 84	  mvn $84,$06
$1e:b28d  49 36 0f	  eor #$0f36
$1e:b290  54 e8 05	  mvn $05,$e8
$1e:b293  d0 36		 bne $b2cb
$1e:b295  81 28		 sta ($28,x)
$1e:b297  8b			phb
$1e:b298  80 71		 bra $b30b
$1e:b29a  13 a0		 ora ($a0,s),y
$1e:b29c  0e e0 7f	  asl $7fe0
$1e:b29f  50 38		 bvc $b2d9
$1e:b2a1  3b			tsc
$1e:b2a2  49 ee 04	  eor #$04ee
$1e:b2a5  e4 78		 cpx $78
$1e:b2a7  0b			phd
$1e:b2a8  b0 c0		 bcs $b26a
$1e:b2aa  e0 5e 51	  cpx #$515e
$1e:b2ad  d2 35		 cmp ($35)
$1e:b2af  c2 fb		 rep #$fb
$1e:b2b1  81 17		 sta ($17,x)
$1e:b2b3  38			sec
$1e:b2b4  8d 2f cb	  sta $cb2f
$1e:b2b7  fa			plx
$1e:b2b8  5a			phy
$1e:b2b9  2b			pld
$1e:b2ba  83 4e		 sta $4e,s
$1e:b2bc  c0 0d 46	  cpy #$460d
$1e:b2bf  59 07 49	  eor $4907,y
$1e:b2c2  e3 e9		 sbc $e9,s
$1e:b2c4  71 23		 adc ($23),y
$1e:b2c6  18			clc
$1e:b2c7  2a			rol a
$1e:b2c8  8a			txa
$1e:b2c9  e4 0a		 cpx $0a
$1e:b2cb  a3 39		 lda $39,s
$1e:b2cd  1f 01 4e 21   ora $214e01,x
$1e:b2d1  61 43		 adc ($43,x)
$1e:b2d3  99 19 10	  sta $1019,y
$1e:b2d6  40			rti
$1e:b2d7  26 14		 rol $14
$1e:b2d9  ba			tsx
$1e:b2da  05 80		 ora $80
$1e:b2dc  06 63		 asl $63
$1e:b2de  71 53		 adc ($53),y
$1e:b2e0  a0 98 00	  ldy #$0098
$1e:b2e3  67 7e		 adc [$7e]
$1e:b2e5  d5 2d		 cmp $2d,x
$1e:b2e7  96 f9		 stx $f9,y
$1e:b2e9  81 01		 sta ($01,x)
$1e:b2eb  9a			txs
$1e:b2ec  dc c2 e5	  jml [$e5c2]
$1e:b2ef  d8			cld
$1e:b2f0  7e 1d d9	  ror $d91d,x
$1e:b2f3  fa			plx
$1e:b2f4  62 78 47	  per $fa6f
$1e:b2f7  20 d8 47	  jsr $47d8
$1e:b2fa  46 8c		 lsr $8c
$1e:b2fc  61 50		 adc ($50,x)
$1e:b2fe  2d 45 13	  and $1345
$1e:b301  04 55		 tsb $55
$1e:b303  70 7b		 bvs $b380
$1e:b305  6b			rtl
$1e:b306  dd 62 02	  cmp $0262,x
$1e:b309  02 00		 cop #$00
$1e:b30b  04 80		 tsb $80
$1e:b30d  3b			tsc
$1e:b30e  fc 01 e0	  jsr ($e001,x)
$1e:b311  52 9f		 eor ($9f)
$1e:b313  c1 20		 cmp ($20,x)
$1e:b315  b0 60		 bcs $b377
$1e:b317  2c c2 a1	  bit $a1c2
$1e:b31a  70 ca		 bvs $b2e6
$1e:b31c  1c 38 0b	  trb $0b38
$1e:b31f  11 1a		 ora ($1a),y
$1e:b321  2d 06 81	  and $8106
$1e:b324  15 8b		 ora $8b,x
$1e:b326  01 49		 ora ($49,x)
$1e:b328  dc 71 88	  jml [$8871]
$1e:b32b  cc 04 8a	  cpy $8a04
$1e:b32e  11 d8		 ora ($d8),y
$1e:b330  f0 14		 beq $b346
$1e:b332  a1 83		 lda ($83,x)
$1e:b334  a3 90		 lda $90,s
$1e:b336  91 42		 sta ($42),y
$1e:b338  87 25		 sta [$25]
$1e:b33a  1c 94 4a	  trb $4a94
$1e:b33d  80 05		 bra $b344
$1e:b33f  29 44 a6	  and #$a644
$1e:b342  55 01		 eor $01,x
$1e:b344  96 4b		 stx $4b,y
$1e:b346  65 c0		 adc $c0
$1e:b348  51 9c		 eor ($9c),y
$1e:b34a  ce 80 a7	  dec $a780
$1e:b34d  31 99		 and ($99),y
$1e:b34f  11 42		 ora ($42),y
$1e:b351  6b			rtl
$1e:b352  36 02		 rol $02,x
$1e:b354  c1 b4		 cmp ($b4,x)
$1e:b356  27 73		 and [$73]
$1e:b358  c9 e8 45	  cmp #$45e8
$1e:b35b  00 b9		 brk #$b9
$1e:b35d  03 85		 ora $85,s
$1e:b35f  81 6c		 sta ($6c,x)
$1e:b361  86 14		 stx $14
$1e:b363  10 2d		 bpl $b392
$1e:b365  94 c4		 sty $c4,x
$1e:b367  0a			asl a
$1e:b368  92 68		 sta ($68)
$1e:b36a  38			sec
$1e:b36b  14 e5		 trb $e5
$1e:b36d  14 2a		 trb $2a
$1e:b36f  20 14 a1	  jsr $a114
$1e:b372  30 28		 bmi $b39c
$1e:b374  6c 3d 4e	  jmp ($4e3d)
$1e:b377  92 49		 sta ($49)
$1e:b379  99 68 e8	  sta $e868,y
$1e:b37c  d2 38		 cmp ($38)
$1e:b37e  b8			clv
$1e:b37f  17 de		 ora [$de],y
$1e:b381  fe 08 f0	  inc $f008,x
$1e:b384  cf 87 8a 27   cmp $278a87
$1e:b388  05 83		 ora $83
$1e:b38a  07 ac		 ora [$ac]
$1e:b38c  ac 10 e0	  ldy $e010
$1e:b38f  f3 b1		 sbc ($b1,s),y
$1e:b391  4a			lsr a
$1e:b392  03 27		 ora $27,s
$1e:b394  0f 33 4d 10   ora $104d33
$1e:b398  ea			nop
$1e:b399  e0 f8 44	  cpx #$44f8
$1e:b39c  6a			ror a
$1e:b39d  03 01		 ora $01,s
$1e:b39f  95 c7		 sta $c7,x
$1e:b3a1  e6 d0		 inc $d0
$1e:b3a3  08			php
$1e:b3a4  20 c1 62	  jsr $62c1
$1e:b3a7  12 28		 ora ($28)
$1e:b3a9  a4 e2		 ldy $e2
$1e:b3ab  83 37		 sta $37,s
$1e:b3ad  0f 04 32 87   ora $873204
$1e:b3b1  2f 0f 2c 72   and $722c0f
$1e:b3b5  60			rts
$1e:b3b6  90 2a		 bcc $b3e2
$1e:b3b8  04 56		 tsb $56
$1e:b3ba  2c 1e 46	  bit $461e
$1e:b3bd  e0 cd 07	  cpx #$07cd
$1e:b3c0  85 1d		 sta $1d
$1e:b3c2  8f 07 ac 81   sta $81ac07
$1e:b3c6  21 e3		 and ($e3,x)
$1e:b3c8  55 93		 eor $93,x
$1e:b3ca  4b			phk
$1e:b3cb  dc 16 77	  jml [$7716]
$1e:b3ce  67 03		 adc [$03]
$1e:b3d0  21 d9		 and ($d9,x)
$1e:b3d2  c1 09		 cmp ($09,x)
$1e:b3d4  94 70		 sty $70,x
$1e:b3d6  3a			dec a
$1e:b3d7  a1 45		 lda ($45,x)
$1e:b3d9  1e 39 f8	  asl $f839,x
$1e:b3dc  04 82		 tsb $82
$1e:b3de  27 05		 and [$05]
$1e:b3e0  1d dc 32	  ora $32dc,x
$1e:b3e3  03 43		 ora $43,s
$1e:b3e5  1d d4 4a	  ora $4ad4,x
$1e:b3e8  81 01		 sta ($01,x)
$1e:b3ea  93 8e		 sta ($8e,s),y
$1e:b3ec  ea			nop
$1e:b3ed  73 3a		 adc ($3a,s),y
$1e:b3ef  9e 4f 47	  stz $474f,x
$1e:b3f2  61 3f		 adc ($3f,x)
$1e:b3f4  82 41 60	  brl $1438
$1e:b3f7  c3 b9		 cmp $b9,s
$1e:b3f9  81 c2		 sta ($c2,x)
$1e:b3fb  e1 81		 sbc ($81,x)
$1e:b3fd  5a			phy
$1e:b3fe  8c 46 68	  sty $6846
$1e:b401  34 08		 bit $08,x
$1e:b403  ac 58 85	  ldy $8558
$1e:b406  32 17		 and ($17)
$1e:b408  98			tya
$1e:b409  47 63		 eor [$63]
$1e:b40b  c3 b8		 cmp $b8,s
$1e:b40d  94 50		 sty $50,x
$1e:b40f  a8			tay
$1e:b410  94 38		 sty $38,x
$1e:b412  70 5f		 bvs $b473
$1e:b414  da			phx
$1e:b415  9e e5 f2	  stz $f2e5,x
$1e:b418  51 a1		 eor ($a1),y
$1e:b41a  28			plp
$1e:b41b  b6 4c		 ldx $4c,y
$1e:b41d  3a			dec a
$1e:b41e  35 f9		 and $f9,x
$1e:b420  f0 c5		 beq $b3e7
$1e:b422  be fc b1	  ldx $b1fc,y
$1e:b425  70 b0		 bvs $b3d7
$1e:b427  e8			inx
$1e:b428  ad 48 1d	  lda $1d48
$1e:b42b  85 24		 sta $24
$1e:b42d  45 87		 eor $87
$1e:b42f  31 1a		 and ($1a),y
$1e:b431  2a			rol a
$1e:b432  86 e3		 stx $e3
$1e:b434  11 95		 ora ($95),y
$1e:b436  88			dey
$1e:b437  2c aa 41	  bit $41aa
$1e:b43a  21 4b		 and ($4b,x)
$1e:b43c  05 0e		 ora $0e
$1e:b43e  4a			lsr a
$1e:b43f  8a			txa
$1e:b440  89 44 a6	  bit #$a644
$1e:b443  55 01		 eor $01,x
$1e:b445  96 4b		 stx $4b,y
$1e:b447  65 c5		 adc $c5
$1e:b449  68			pla
$1e:b44a  98			tya
$1e:b44b  cc 92 c1	  cpy $c192
$1e:b44e  35 9b		 and $9b,x
$1e:b450  07 aa		 ora [$aa]
$1e:b452  76 2a		 ror $2a,x
$1e:b454  f7 42		 sbc [$42],y
$1e:b456  00 01		 brk #$01
$1e:b458  03 00		 ora $00,s
$1e:b45a  03 bf		 ora $bf,s
$1e:b45c  3b			tsc
$1e:b45d  fa			plx
$1e:b45e  e7 86		 sbc [$86]
$1e:b460  b8			clv
$1e:b461  61 80		 adc ($80,x)
$1e:b463  2f 74 77 85   and $857774
$1e:b467  ef 1d 78 c7   sbc $c7781d
$1e:b46b  04 5e		 tsb $5e
$1e:b46d  f8			sed
$1e:b46e  ef 0b fd 12   sbc $12fd0b
$1e:b472  86 21		 stx $21
$1e:b474  7c 05 f5	  jmp ($f505,x)
$1e:b477  de 1a 1b	  dec $1b1a,x
$1e:b47a  6d b2 db	  adc $dbb2
$1e:b47d  99 a4 8d	  sta $8da4,y
$1e:b480  47 34		 eor [$34]
$1e:b482  32 0c		 and ($0c)
$1e:b484  46 80		 lsr $80
$1e:b486  3c 79 9d	  bit $9d79,x
$1e:b489  35 98		 and $98,x
$1e:b48b  8a			txa
$1e:b48c  3a			dec a
$1e:b48d  7c d0 ac	  jmp ($acd0,x)
$1e:b490  ef e3 10 b2   sbc $b210e3
$1e:b494  59 b2 b4	  eor $b4b2,y
$1e:b497  8b			phb
$1e:b498  96 5a		 stx $5a,y
$1e:b49a  cd 6e 1d	  cmp $1d6e
$1e:b49d  80 b4		 bra $b453
$1e:b49f  84 20		 sty $20
$1e:b4a1  53 0c		 eor ($0c,s),y
$1e:b4a3  ed 46 a9	  sbc $a946
$1e:b4a6  9e 2c 80	  stz $802c,x
$1e:b4a9  ac 07 a4	  ldy $a407
$1e:b4ac  31 0c		 and ($0c),y
$1e:b4ae  de 5c 8a	  dec $8a5c,x
$1e:b4b1  59 fc e1	  eor $e1fc,y
$1e:b4b4  6c c4 05	  jmp ($05c4)
$1e:b4b7  9b			txy
$1e:b4b8  b7 e5		 lda [$e5],y
$1e:b4ba  f3 f6		 sbc ($f6,s),y
$1e:b4bc  fc e0 aa	  jsr ($aae0,x)
$1e:b4bf  06 41		 asl $41
$1e:b4c1  9b			txy
$1e:b4c2  ce 24 88	  dec $8824
$1e:b4c5  78			sei
$1e:b4c6  78			sei
$1e:b4c7  2c 0a 84	  bit $840a
$1e:b4ca  32 54		 and ($54)
$1e:b4cc  3c 52 88	  bit $8852,x
$1e:b4cf  70 58		 bvs $b529
$1e:b4d1  91 68		 sta ($68),y
$1e:b4d3  e0 ee cb	  cpx #$cbee
$1e:b4d6  11 bb		 ora ($bb),y
$1e:b4d8  db			stp
$1e:b4d9  33 17		 and ($17,s),y
$1e:b4db  55 89		 eor $89,x
$1e:b4dd  61 1d		 adc ($1d,x)
$1e:b4df  eb			xba
$1e:b4e0  7f a1 e4 05   adc $05e4a1,x
$1e:b4e4  a2 fb 50	  ldx #$50fb
$1e:b4e7  18			clc
$1e:b4e8  e1 d6		 sbc ($d6,x)
$1e:b4ea  c1 85		 cmp ($85,x)
$1e:b4ec  01 08		 ora ($08,x)
$1e:b4ee  31 1c		 and ($1c),y
$1e:b4f0  21 78		 and ($78,x)
$1e:b4f2  c7 d0		 cmp [$d0]
$1e:b4f4  f2 38		 sbc ($38)
$1e:b4f6  db			stp
$1e:b4f7  c3 84		 cmp $84,s
$1e:b4f9  6f 8d e0 bf   adc $bfe08d
$1e:b4fd  db			stp
$1e:b4fe  6d 8f 17	  adc $178f
$1e:b501  c4 5f		 cpy $5f
$1e:b503  5b			tcd
$1e:b504  c0 60 10	  cpy #$1060
$1e:b507  0b			phd
$1e:b508  e0 34 0e	  cpx #$0e34
$1e:b50b  e3 c5		 sbc $c5,s
$1e:b50d  d2 71		 cmp ($71)
$1e:b50f  8f 20 09 8b   sta $8b0920
$1e:b513  ec ef e0	  cpx $e0ef
$1e:b516  10 b2		 bpl $b4ca
$1e:b518  59 ad c0	  eor $c0ad,y
$1e:b51b  20 11 88	  jsr $8811
$1e:b51e  2c 1f a4	  bit $a41f
$1e:b521  f1 0b		 sbc ($0b),y
$1e:b523  8d 5a dc	  sta $dc5a
$1e:b526  f2 01		 sbc ($01)
$1e:b528  98			tya
$1e:b529  be c0 1a	  ldx $1ac0,y
$1e:b52c  40			rti
$1e:b52d  10 bc		 bpl $b4eb
$1e:b52f  d7 84		 cmp [$84],y
$1e:b531  a2 43 11	  ldx #$1143
$1e:b534  59 bc 04	  eor $04bc,y
$1e:b537  46 2f		 lsr $2f
$1e:b539  20 11 8b	  jsr $8b11
$1e:b53c  ed 86 62	  sbc $6286
$1e:b53f  02 01		 cop #$01
$1e:b541  98			tya
$1e:b542  82 d8 86	  brl $3c1d
$1e:b545  2f 20 21 88   and $882120
$1e:b549  6f c5 9e 3d   adc $3d9ec5
$1e:b54d  f2 77		 sbc ($77)
$1e:b54f  97 fc		 sta [$fc],y
$1e:b551  e1 e8		 sbc ($e8,x)
$1e:b553  1f 49 7a 8f   ora $8f7a49,x
$1e:b557  d6 9e		 dec $9e,x
$1e:b559  c5 f6		 cmp $f6
$1e:b55b  b7 b9		 lda [$b9],y
$1e:b55d  fd f1 e0	  sbc $e0f1,x
$1e:b560  9f 1d 3e 4e   sta $4e3e1d,x
$1e:b564  df 94 33 02   cmp $023394,x
$1e:b568  0c 49 6c	  tsb $6c49
$1e:b56b  91 72		 sta ($72),y
$1e:b56d  e1 e0		 sbc ($e0,x)
$1e:b56f  b0 2a		 bcs $b59b
$1e:b571  10 c9		 bpl $b53c
$1e:b573  50 f1		 bvc $b566
$1e:b575  4a			lsr a
$1e:b576  21 c1		 and ($c1,x)
$1e:b578  62 49 a3	  per $58c4
$1e:b57b  83 bb		 sta $bb,s
$1e:b57d  2c 46 ef	  bit $ef46
$1e:b580  6c cc 5d	  jmp ($5dcc)
$1e:b583  56 25		 lsr $25,x
$1e:b585  84 37		 sty $37
$1e:b587  02 f8		 cop #$f8
$1e:b589  ef f4 3c 81   sbc $813cf4
$1e:b58d  34 57		 bit $57,x
$1e:b58f  c5 00		 cmp $00
$1e:b591  67 fb		 adc [$fb]
$1e:b593  83 00		 sta $00,s
$1e:b595  92 02		 sta ($02)
$1e:b597  8a			txa
$1e:b598  4e 23 d3	  lsr $d323
$1e:b59b  89 44 e3	  bit #$e344
$1e:b59e  25 38		 and $38
$1e:b5a0  d6 4e		 dec $4e,x
$1e:b5a2  36 d3		 rol $d3,x
$1e:b5a4  8e 04 e3	  stx $e304
$1e:b5a7  b5 38		 lda $38,x
$1e:b5a9  f2 4e		 sbc ($4e)
$1e:b5ab  28			plp
$1e:b5ac  d3 98		 cmp ($98,s),y
$1e:b5ae  00 0c		 brk #$0c
$1e:b5b0  ea			nop
$1e:b5b1  13 9f		 ora ($9f,s),y
$1e:b5b3  ff fc 06 98   sbc $9806fc,x
$1e:b5b7  80 50		 bra $b609
$1e:b5b9  e7 c0		 sbc [$c0]
$1e:b5bb  8a			txa
$1e:b5bc  03 4b		 ora $4b,s
$1e:b5be  64 e6		 stz $e6
$1e:b5c0  04 0e		 tsb $0e
$1e:b5c2  50 fb		 bvc $b5bf
$1e:b5c4  7b			tdc
$1e:b5c5  c3 1e		 cmp $1e,s
$1e:b5c7  29 cd 78	  and #$78cd
$1e:b5ca  e3 c1		 sbc $c1,s
$1e:b5cc  e9 01 18	  sbc #$1801
$1e:b5cf  68			pla
$1e:b5d0  2c 21 e0	  bit $e021
$1e:b5d3  45 82		 eor $82
$1e:b5d5  10 15		 bpl $b5ec
$1e:b5d7  02 81		 cop #$81
$1e:b5d9  32 01		 and ($01)
$1e:b5db  a7 c4		 lda [$c4]
$1e:b5dd  14 fa		 trb $fa
$1e:b5df  43 f3		 eor $f3,s
$1e:b5e1  a8			tay
$1e:b5e2  42 06		 wdm #$06
$1e:b5e4  03 3e		 ora $3e,s
$1e:b5e6  72 41		 adc ($41)
$1e:b5e8  55 64		 eor $64,x
$1e:b5ea  03 48		 ora $48,s
$1e:b5ec  6c e8 16	  jmp ($16e8)
$1e:b5ef  46 f0		 lsr $f0
$1e:b5f1  05 83		 ora $83
$1e:b5f3  3c 04 e8	  bit $e804,x
$1e:b5f6  cf 06 9b 2d   cmp $2d9b06
$1e:b5fa  d1 c3		 cmp ($c3),y
$1e:b5fc  ef 2f 69 b2   sbc $b2692f
$1e:b600  25 00		 and $00
$1e:b602  30 c9		 bmi $b5cd
$1e:b604  a6 5c		 ldx $5c
$1e:b606  48			pha
$1e:b607  20 10 82	  jsr $8210
$1e:b60a  12 b6		 ora ($b6)
$1e:b60c  c0 de 11	  cpy #$11de
$1e:b60f  06 48		 asl $48
$1e:b611  4a			lsr a
$1e:b612  21 50		 and ($50,x)
$1e:b614  12 78		 ora ($78)
$1e:b616  c0 25 50	  cpy #$5025
$1e:b619  a1 ff		 lda ($ff,x)
$1e:b61b  b2 42		 lda ($42)
$1e:b61d  58			cli
$1e:b61e  53 49		 eor ($49,s),y
$1e:b620  71 6b		 adc ($6b),y
$1e:b622  c9 e3 40	  cmp #$40e3
$1e:b625  29 a5 08	  and #$08a5
$1e:b628  ec 31 86	  cpx $8631
$1e:b62b  48			pha
$1e:b62c  93 c0		 sta ($c0,s),y
$1e:b62e  86 41		 stx $41
$1e:b630  b2 4c		 lda ($4c)
$1e:b632  8c 96 1c	  sty $1c96
$1e:b635  42 02		 wdm #$02
$1e:b637  18			clc
$1e:b638  c9 94 e4	  cmp #$e494
$1e:b63b  43 09		 eor $09,s
$1e:b63d  b2 b8		 lda ($b8)
$1e:b63f  09 e3 08	  ora #$08e3
$1e:b642  9a			txs
$1e:b643  c3 3f		 cmp $3f,s
$1e:b645  1f f4 ac 3e   ora $3eacf4,x
$1e:b649  c8			iny
$1e:b64a  86 32		 stx $32
$1e:b64c  75 70		 adc $70,x
$1e:b64e  2a			rol a
$1e:b64f  0a			asl a
$1e:b650  6e ae 15	  ror $15ae
$1e:b653  c0 d5 17	  cpy #$17d5
$1e:b656  82 55 24	  brl $daae
$1e:b659  ca			dex
$1e:b65a  20 c0 56	  jsr $56c0
$1e:b65d  50 8a		 bvc $b5e9
$1e:b65f  23 44		 and $44,s
$1e:b661  48			pha
$1e:b662  42 d7		 wdm #$d7
$1e:b664  08			php
$1e:b665  5c 02 6b 00   jml $006b02
$1e:b669  09 04 18	  ora #$1804
$1e:b66c  84 71		 sty $71
$1e:b66e  11 20		 ora ($20),y
$1e:b670  44 0f 21	  mvp $21,$0f
$1e:b673  30 80		 bmi $b5f5
$1e:b675  c3 08		 cmp $08,s
$1e:b677  41 30		 eor ($30,x)
$1e:b679  09 04 40	  ora #$4004
$1e:b67c  20 12 04	  jsr $0412
$1e:b67f  a8			tay
$1e:b680  4e 20 61	  lsr $6120
$1e:b683  72 09		 adc ($09)
$1e:b685  04 4e		 tsb $4e
$1e:b687  19 01 84	  ora $8401,y
$1e:b68a  4a			lsr a
$1e:b68b  01 61		 ora ($61,x)
$1e:b68d  04 12		 tsb $12
$1e:b68f  84 62		 sty $62
$1e:b691  30 0b		 bmi $b69e
$1e:b693  08			php
$1e:b694  30 94		 bmi $b62a
$1e:b696  a4 11		 ldy $11
$1e:b698  08			php
$1e:b699  40			rti
$1e:b69a  b0 86		 bcs $b622
$1e:b69c  e1 0a		 sbc ($0a,x)
$1e:b69e  0f 00 a0 63   ora $63a000
$1e:b6a2  10 c2		 bpl $b666
$1e:b6a4  09 0a 02	  ora #$020a
$1e:b6a7  38			sec
$1e:b6a8  25 00		 and $00
$1e:b6aa  68			pla
$1e:b6ab  4c 20 10	  jmp $1020
$1e:b6ae  d0 f0		 bne $b6a0
$1e:b6b0  12 c0		 ora ($c0)
$1e:b6b2  26 10		 rol $10
$1e:b6b4  f2 b1		 sbc ($b1)
$1e:b6b6  4e 20 11	  lsr $1120
$1e:b6b9  f1 61		 sbc ($61),y
$1e:b6bb  14 c2		 trb $c2
$1e:b6bd  40			rti
$1e:b6be  25 09		 and $09
$1e:b6c0  40			rti
$1e:b6c1  48			pha
$1e:b6c2  20 12 20	  jsr $2012
$1e:b6c5  f0 04		 beq $b6cb
$1e:b6c7  c0 50 12	  cpy #$1250
$1e:b6ca  40			rti
$1e:b6cb  f0 18		 beq $b6e5
$1e:b6cd  40			rti
$1e:b6ce  c2 13		 rep #$13
$1e:b6d0  48			pha
$1e:b6d1  60			rts
$1e:b6d2  02 01		 cop #$01
$1e:b6d4  00 02		 brk #$02
$1e:b6d6  ce 65 f3	  dec $f365
$1e:b6d9  b7 8d		 lda [$8d],y
$1e:b6db  4d c1 e8	  eor $e8c1
$1e:b6de  37 1b		 and [$1b],y
$1e:b6e0  96 ef		 stx $ef,y
$1e:b6e2  49 78 7e	  eor #$7e78
$1e:b6e5  06 93		 asl $93
$1e:b6e7  3e fc 07	  rol $07fc,x
$1e:b6ea  98			tya
$1e:b6eb  3e 02 e8	  rol $e802,x
$1e:b6ee  ef 0c f6 b1   sbc $b1f60c
$1e:b6f2  f8			sed
$1e:b6f3  20 b2 c0	  jsr $c0b2
$1e:b6f6  60			rts
$1e:b6f7  78			sei
$1e:b6f8  1c 0d c3	  trb $c30d
$1e:b6fb  fc 83 4b	  jsr ($4b83,x)
$1e:b6fe  88			dey
$1e:b6ff  c4 85		 cpy $85
$1e:b701  43 72		 eor $72,s
$1e:b703  0b			phd
$1e:b704  20 d2 e4	  jsr $e4d2
$1e:b707  44 83 ba	  mvp $ba,$83
$1e:b70a  0d 1d ee	  ora $ee1d
$1e:b70d  f8			sed
$1e:b70e  1a			inc a
$1e:b70f  2c 80 90	  bit $9080
$1e:b712  75 77		 adc $77,x
$1e:b714  8b			phb
$1e:b715  cd ea fd	  cmp $fdea
$1e:b718  7f 0a 80 68   adc $68800a,x
$1e:b71c  b3 19		 lda ($19,s),y
$1e:b71e  9d ee 9f	  sta $9fee,x
$1e:b721  05 83		 ora $83
$1e:b723  0a			asl a
$1e:b724  81 64		 sta ($64,x)
$1e:b726  74 a1		 stz $a1,x
$1e:b728  a2 d0 68	  ldx #$68d0
$1e:b72b  77 da		 adc [$da],y
$1e:b72d  fc 56 2c	  jsr ($2c56,x)
$1e:b730  b2 5a		 lda ($5a)
$1e:b732  6d 68 ec	  adc $ec68
$1e:b735  6f da 8d 2e   adc $2e8dda
$1e:b739  ff 61 92 34   sbc $349261,x
$1e:b73d  16 97		 asl $97,x
$1e:b73f  5d b0 bd	  eor $bdb0,x
$1e:b742  5f 0d 81 a7   eor $a7810d,x
$1e:b746  d6 ec		 dec $ec,x
$1e:b748  36 19		 rol $19,x
$1e:b74a  ac d9 70	  ldy $70d9
$1e:b74d  50 82		 bvc $b6d1
$1e:b74f  7a			ply
$1e:b750  2d 7a 14	  and $147a
$1e:b753  36 1a		 rol $1a,x
$1e:b755  2d 19 b0	  and $b019
$1e:b758  52 82		 eor ($82)
$1e:b75a  82 3d 86	  brl $3d9a
$1e:b75d  f3 6d		 sbc ($6d,s),y
$1e:b75f  aa			tax
$1e:b760  3d 92 50	  and $5092,x
$1e:b763  52 45		 eor ($45)
$1e:b765  b1 d9		 lda ($d9),y
$1e:b767  71 10		 adc ($10),y
$1e:b769  29 b0 d9	  and #$d9b0
$1e:b76c  ed 17 64	  sbc $6417
$1e:b76f  79 34 99	  adc $9934,y
$1e:b772  6d 42 a1	  adc $a142
$1e:b775  b6 db		 ldx $db,y
$1e:b777  96 8d		 stx $8d,y
$1e:b779  36 4c		 rol $4c,x
$1e:b77b  b2 2c		 lda ($2c)
$1e:b77d  9a			txs
$1e:b77e  dd 8b 25	  cmp $258b,x
$1e:b781  78			sei
$1e:b782  77 8d		 adc [$8d],y
$1e:b784  f4 8c 2f	  pea $2f8c
$1e:b787  03 76		 ora $76,s
$1e:b789  23 cc		 and $cc,s
$1e:b78b  34 af		 bit $af,x
$1e:b78d  52 7d		 eor ($7d)
$1e:b78f  19 38 2f	  ora $2f38,y
$1e:b792  77 c4		 adc [$c4],y
$1e:b794  50 91		 bvc $b727
$1e:b796  c0 20 25	  cpy #$2520
$1e:b799  93 79		 sta ($79,s),y
$1e:b79b  82 08 77	  brl $2ea6
$1e:b79e  f8			sed
$1e:b79f  2c 1b 71	  bit $711b
$1e:b7a2  51 e6		 eor ($e6),y
$1e:b7a4  75 0c		 adc $0c,x
$1e:b7a6  56 2c		 lsr $2c,x
$1e:b7a8  50 ed		 bvc $b797
$1e:b7aa  63 c9		 adc $c9,s
$1e:b7ac  0d 9d ac	  ora $ac9d
$1e:b7af  68			pla
$1e:b7b0  63 6e		 adc $6e,s
$1e:b7b2  21 40		 and ($40,x)
$1e:b7b4  d2 c4		 cmp ($c4)
$1e:b7b6  58			cli
$1e:b7b7  9d 9a 98	  sta $989a,x
$1e:b7ba  4a			lsr a
$1e:b7bb  f2 db		 sbc ($db)
$1e:b7bd  62 d2 3a	  per $f292
$1e:b7c0  50 4e		 bvc $b810
$1e:b7c2  e8			inx
$1e:b7c3  2b			pld
$1e:b7c4  55 fa		 eor $fa,x
$1e:b7c6  f3 d9		 sbc ($d9,s),y
$1e:b7c8  be de e0	  ldx $e0de,y
$1e:b7cb  70 10		 bvs $b7dd
$1e:b7cd  0c 00 92	  tsb $9200
$1e:b7d0  10 38		 bpl $b80a
$1e:b7d2  25 fc		 and $fc
$1e:b7d4  3d de 5a	  and $5ade,x
$1e:b7d7  ff 7f e3 19   sbc $19e37f,x
$1e:b7db  e0 3e 95	  cpx #$953e
$1e:b7de  47 90		 eor [$90]
$1e:b7e0  00 96		 brk #$96
$1e:b7e2  01 9c		 ora ($9c,x)
$1e:b7e4  16 00		 asl $00,x
$1e:b7e6  00 0e		 brk #$0e
$1e:b7e8  08			php
$1e:b7e9  16 14		 asl $14,x
$1e:b7eb  00 50		 brk #$50
$1e:b7ed  41 24		 eor ($24,x)
$1e:b7ef  82 38 e3	  brl $9b2a
$1e:b7f2  40			rti
$1e:b7f3  45 49		 eor $49
$1e:b7f5  a6 55		 ldx $55
$1e:b7f7  07 5a		 ora [$5a]
$1e:b7f9  aa			tax
$1e:b7fa  6a			ror a
$1e:b7fb  e0 1c a0	  cpx #$a01c
$1e:b7fe  35 20		 and $20,x
$1e:b800  46 a0		 lsr $a0
$1e:b802  56 27		 lsr $27,x
$1e:b804  49 69 59	  eor #$5969
$1e:b807  ab			plb
$1e:b808  61 ed		 adc ($ed,x)
$1e:b80a  71 40		 adc ($40),y
$1e:b80c  02 42		 cop #$42
$1e:b80e  08			php
$1e:b80f  c6 18		 dec $18
$1e:b811  4a			lsr a
$1e:b812  29 ef 3d	  and #$3def
$1e:b815  94 52		 sty $52,x
$1e:b817  18			clc
$1e:b818  63 9c		 adc $9c,s
$1e:b81a  73 f1		 adc ($f1,s),y
$1e:b81c  00 b9		 brk #$b9
$1e:b81e  0d 7c 16	  ora $167c
$1e:b821  5e 33 f1	  lsr $f133,x
$1e:b824  55 96		 eor $96,x
$1e:b826  62 1a 73	  per $2b43
$1e:b829  9e 25 57	  stz $5725,x
$1e:b82c  15 4a		 ora $4a,x
$1e:b82e  00 f1		 brk #$f1
$1e:b830  00 b9		 brk #$b9
$1e:b832  0d 7c 16	  ora $167c
$1e:b835  5e 33 f1	  lsr $f133,x
$1e:b838  55 96		 eor $96,x
$1e:b83a  62 1a 73	  per $2b57
$1e:b83d  08			php
$1e:b83e  21 6b		 and ($6b,x)
$1e:b840  2d ce 39	  and $39ce
$1e:b843  31 46		 and ($46),y
$1e:b845  94 52		 sty $52,x
$1e:b847  f7 5e		 sbc [$5e],y
$1e:b849  5a			phy
$1e:b84a  6b			rtl
$1e:b84b  93 34		 sta ($34,s),y
$1e:b84d  05 00		 ora $00
$1e:b84f  0c 00 52	  tsb $5200
$1e:b852  10 f8		 bpl $b84c
$1e:b854  30 fc		 bmi $b852
$1e:b856  55 de		 eor $de,x
$1e:b858  62 61 18	  per $d0bc
$1e:b85b  c3 30		 cmp $30,s
$1e:b85d  66 51		 ror $51
$1e:b85f  07 6a		 ora [$6a]
$1e:b861  cd 6a 36	  cmp $366a
$1e:b864  6f f1 55 96   adc $9655f1
$1e:b868  62 5a 6b	  per $23c5
$1e:b86b  9c 10 21	  stz $2110
$1e:b86e  0c 63 10	  tsb $1063
$1e:b871  a5 1c		 lda $1c
$1e:b873  08			php
$1e:b874  2d 6b 39	  and $396b
$1e:b877  ef 45 94 5a   sbc $5a9445
$1e:b87b  f1 00		 sbc ($00),y
$1e:b87d  b9 0d 7c	  lda $7c0d,y
$1e:b880  16 5e		 asl $5e,x
$1e:b882  33 f1		 and ($f1,s),y
$1e:b884  55 96		 eor $96,x
$1e:b886  62 1a 73	  per $2ba3
$1e:b889  7b			tdc
$1e:b88a  6f 41 1e 42   adc $421e41
$1e:b88e  08			php
$1e:b88f  c6 18		 dec $18
$1e:b891  4a			lsr a
$1e:b892  29 ef 3d	  and #$3def
$1e:b895  94 52		 sty $52,x
$1e:b897  18			clc
$1e:b898  63 9c		 adc $9c,s
$1e:b89a  73 41		 adc ($41,s),y
$1e:b89c  24 62		 bit $62
$1e:b89e  38			sec
$1e:b89f  c3 40		 cmp $40,s
$1e:b8a1  25 49		 and $49
$1e:b8a3  86 55		 stx $55
$1e:b8a5  e7 59		 sbc [$59]
$1e:b8a7  49 66 ca	  eor #$ca66
$1e:b8aa  72 00		 adc ($00)
$1e:b8ac  50 0c		 bvc $b8ba
$1e:b8ae  00 92		 brk #$92
$1e:b8b0  10 38		 bpl $b8ea
$1e:b8b2  25 fc		 and $fc
$1e:b8b4  3d de 5a	  and $5ade,x
$1e:b8b7  ff 7f e3 19   sbc $19e37f,x
$1e:b8bb  e0 3e 95	  cpx #$953e
$1e:b8be  47 90		 eor [$90]
$1e:b8c0  00 96		 brk #$96
$1e:b8c2  01 9c		 ora ($9c,x)
$1e:b8c4  16 00		 asl $00,x
$1e:b8c6  00 0e		 brk #$0e
$1e:b8c8  08			php
$1e:b8c9  16 14		 asl $14,x
$1e:b8cb  40			rti
$1e:b8cc  01 ce		 ora ($ce,x)
$1e:b8ce  55 31		 eor $31,x
$1e:b8d0  5e 94 66	  lsr $6694,x
$1e:b8d3  f7 6e		 sbc [$6e],y
$1e:b8d5  7b			tdc
$1e:b8d6  77 ff		 adc [$ff],y
$1e:b8d8  7f 45 31 66   adc $663145,x
$1e:b8dc  35 aa		 and $aa,x
$1e:b8de  3d 0b 46	  and $460b,x
$1e:b8e1  aa			tax
$1e:b8e2  3d 66 35	  and $3566,x
$1e:b8e5  63 14		 adc $14,s
$1e:b8e7  a5 1c		 lda $1c
$1e:b8e9  e6 24		 inc $24
$1e:b8eb  00 50		 brk #$50
$1e:b8ed  00 00		 brk #$00
$1e:b8ef  43 08		 eor $08,s
$1e:b8f1  a6 14		 ldx $14
$1e:b8f3  09 21 8d	  ora #$8d21
$1e:b8f6  31 f0		 and ($f0),y
$1e:b8f8  3d 53 4a	  and $4a53,x
$1e:b8fb  26 00		 rol $00
$1e:b8fd  6c 04 ae	  jmp ($ae04)
$1e:b900  04 32		 tsb $32
$1e:b902  09 98 0d	  ora #$0d98
$1e:b905  d0 0c		 bne $b913
$1e:b907  32 11		 and ($11)
$1e:b909  b6 56		 ldx $56,y
$1e:b90b  40			rti
$1e:b90c  28			plp
$1e:b90d  42 0c		 wdm #$0c
$1e:b90f  a4 1c		 ldy $1c
$1e:b911  e6 24		 inc $24
$1e:b913  28			plp
$1e:b914  29 8b 35	  and #$358b
$1e:b917  0e 42 c2	  asl $c242
$1e:b91a  00 23		 brk #$23
$1e:b91c  05 a4		 ora $a4
$1e:b91e  09 45 0e	  ora #$0e45
$1e:b921  87 04		 sta [$04]
$1e:b923  ca			dex
$1e:b924  0c 2c 15	  tsb $152c
$1e:b927  90 25		 bcc $b94e
$1e:b929  f3 31		 sbc ($31,s),y
$1e:b92b  f0 40		 beq $b96d
$1e:b92d  43 08		 eor $08,s
$1e:b92f  a6 14		 ldx $14
$1e:b931  09 21 8d	  ora #$8d21
$1e:b934  31 f0		 and ($f0),y
$1e:b936  3d 53 4a	  and $4a53,x
$1e:b939  b6 56		 ldx $56,y
$1e:b93b  6c 04 d0	  jmp ($d004)
$1e:b93e  0c 14 09	  tsb $0914
$1e:b941  98			tya
$1e:b942  0d fb 11	  ora $11fb
$1e:b945  32 11		 and ($11)
$1e:b947  b4 1d		 ldy $1d,x
$1e:b949  3a			dec a
$1e:b94a  63 4a		 adc $4a,s
$1e:b94c  29 62 08	  and #$0862
$1e:b94f  e3 0c		 sbc $0c,s
$1e:b951  24 15		 bit $15
$1e:b953  85 1d		 sta $1d
$1e:b955  e7 25		 sbc [$25]
$1e:b957  69 36 52	  adc #$5236
$1e:b95a  08			php
$1e:b95b  b6 14		 ldx $14,y
$1e:b95d  5a			phy
$1e:b95e  29 fc 3d	  and #$3dfc
$1e:b961  a3 30		 lda $30,s
$1e:b963  27 3d		 and [$3d]
$1e:b965  aa			tax
$1e:b966  51 4d		 eor ($4d),y
$1e:b968  5e d8 66	  lsr $66d8,x
$1e:b96b  00 60		 brk #$60
$1e:b96d  e7 49		 sbc [$49]
$1e:b96f  2b			pld
$1e:b970  52 8f		 eor ($8f)
$1e:b972  5e 32 73	  lsr $7332,x
$1e:b975  8f 5e 2b 52   sta $522b5e
$1e:b979  a5 3d		 lda $3d
$1e:b97b  c6 41		 dec $41
$1e:b97d  0a			asl a
$1e:b97e  4a			lsr a
$1e:b97f  6b			rtl
$1e:b980  52 0a		 eor ($0a)
$1e:b982  4a			lsr a
$1e:b983  c6 41		 dec $41
$1e:b985  63 14		 adc $14,s
$1e:b987  a5 1c		 lda $1c
$1e:b989  e6 24		 inc $24
$1e:b98b  00 50		 brk #$50
$1e:b98d  0c 00 92	  tsb $9200
$1e:b990  10 38		 bpl $b9ca
$1e:b992  25 fc		 and $fc
$1e:b994  3d de 5a	  and $5ade,x
$1e:b997  ff 7f e3 19   sbc $19e37f,x
$1e:b99b  e0 3e 95	  cpx #$953e
$1e:b99e  47 90		 eor [$90]
$1e:b9a0  00 96		 brk #$96
$1e:b9a2  01 9c		 ora ($9c,x)
$1e:b9a4  16 00		 asl $00,x
$1e:b9a6  00 0e		 brk #$0e
$1e:b9a8  08			php
$1e:b9a9  16 14		 asl $14,x
$1e:b9ab  ce 39 e3	  dec $e339
$1e:b9ae  2c 26 35	  bit $3526
$1e:b9b1  87 3d		 sta [$3d]
$1e:b9b3  05 31		 ora $31
$1e:b9b5  a3 28		 lda $28,s
$1e:b9b7  80 20		 bra $b9d9
$1e:b9b9  60			rts
$1e:b9ba  1c a0 24	  trb $24a0
$1e:b9bd  00 00		 brk #$00
$1e:b9bf  66 00		 ror $00
$1e:b9c1  cb			wai
$1e:b9c2  08			php
$1e:b9c3  2f 0d 62 18   and $18620d
$1e:b9c7  e5 2c		 sbc $2c
$1e:b9c9  aa			tax
$1e:b9ca  3d 00 50	  and $5000,x
$1e:b9cd  62 18 a3	  per $5ce8
$1e:b9d0  2c 26 3d	  bit $3d26
$1e:b9d3  a9 4d 6d	  lda #$6d4d
$1e:b9d6  62 89 4d	  per $0762
$1e:b9d9  06 39		 asl $39
$1e:b9db  a3 2c		 lda $2c,s
$1e:b9dd  8c 41 10	  sty $1041
$1e:b9e0  4e 94 5e	  lsr $5e94
$1e:b9e3  31 52		 and ($52),y
$1e:b9e5  46 04		 lsr $04
$1e:b9e7  88			dey
$1e:b9e8  08			php
$1e:b9e9  eb			xba
$1e:b9ea  10 40		 bpl $ba2c
$1e:b9ec  29 44 04	  and #$0444
$1e:b9ef  86 08		 stx $08
$1e:b9f1  c8			iny
$1e:b9f2  0c 2b 15	  tsb $152b
$1e:b9f5  ae 1d 11	  ldx $111d
$1e:b9f8  2a			rol a
$1e:b9f9  67 08		 adc [$08]
$1e:b9fb  aa			tax
$1e:b9fc  10 ec		 bpl $b9ea
$1e:b9fe  18			clc
$1e:b9ff  2f 21 92 2d   and $2d9221
$1e:ba03  2d 05 f3	  and $f305
$1e:ba06  11 b8		 ora ($b8),y
$1e:ba08  22 3b 3f 4a   jsl $4a3f3b
$1e:ba0c  01 44		 ora ($44,x)
$1e:ba0e  00 89		 brk #$89
$1e:ba10  04 cd		 tsb $cd
$1e:ba12  08			php
$1e:ba13  51 0d		 eor ($0d),y
$1e:ba15  d5 15		 cmp $15,x
$1e:ba17  59 1e 63	  eor $631e,y
$1e:ba1a  18			clc
$1e:ba1b  c6 2c		 dec $2c
$1e:ba1d  6b			rtl
$1e:ba1e  39 10 52	  and $5210,y
$1e:ba21  d6 6a		 dec $6a,x
$1e:ba23  00 00		 brk #$00
$1e:ba25  c8			iny
$1e:ba26  0c 2b 15	  tsb $152b
$1e:ba29  ae 1d 00	  ldx $001d
$1e:ba2c  50 41		 bvc $ba6f
$1e:ba2e  04 83		 tsb $83
$1e:ba30  08			php
$1e:ba31  e6 14		 inc $14
$1e:ba33  6a			ror a
$1e:ba34  25 ef		 and $ef
$1e:ba36  39 52 4a	  and $4a52,y
$1e:ba39  d6 5a		 dec $5a,x
$1e:ba3b  00 00		 brk #$00
$1e:ba3d  84 10		 sty $10
$1e:ba3f  08			php
$1e:ba40  21 8c		 and ($8c,x)
$1e:ba42  31 10		 and ($10),y
$1e:ba44  42 94		 wdm #$94
$1e:ba46  52 18		 eor ($18)
$1e:ba48  63 9c		 adc $9c,s
$1e:ba4a  73 0a		 adc ($0a,s),y
$1e:ba4c  28			plp
$1e:ba4d  62 28 c3	  per $7d78
$1e:ba50  3c 46 4d	  bit $4d46,x
$1e:ba53  e9 5d ad	  sbc #$ad5d
$1e:ba56  72 a9		 adc ($a9)
$1e:ba58  5d 46 4d	  eor $4d46,x
$1e:ba5b  c3 3c		 cmp $3c,s
$1e:ba5d  ef 4d 73 5e   sbc $5e734d
$1e:ba61  f7 6a		 sbc [$6a],y
$1e:ba63  73 5e		 adc ($5e,s),y
$1e:ba65  66 08		 ror $08
$1e:ba67  c8			iny
$1e:ba68  0c 2b 15	  tsb $152b
$1e:ba6b  00 50		 brk #$50
$1e:ba6d  0c 00 92	  tsb $9200
$1e:ba70  10 38		 bpl $baaa
$1e:ba72  25 fc		 and $fc
$1e:ba74  3d de 5a	  and $5ade,x
$1e:ba77  ff 7f e3 19   sbc $19e37f,x
$1e:ba7b  e0 3e 95	  cpx #$953e
$1e:ba7e  47 90		 eor [$90]
$1e:ba80  00 96		 brk #$96
$1e:ba82  01 9c		 ora ($9c,x)
$1e:ba84  16 00		 asl $00,x
$1e:ba86  00 0e		 brk #$0e
$1e:ba88  08			php
$1e:ba89  16 14		 asl $14,x
$1e:ba8b  40			rti
$1e:ba8c  01 ce		 ora ($ce,x)
$1e:ba8e  55 31		 eor $31,x
$1e:ba90  5e 94 66	  lsr $6694,x
$1e:ba93  f7 6e		 sbc [$6e],y
$1e:ba95  7b			tdc
$1e:ba96  77 ff		 adc [$ff],y
$1e:ba98  7f 1c 00 fc   adc $fc001c,x
$1e:ba9c  00 dc		 brk #$dc
$1e:ba9e  01 9c		 ora ($9c,x)
$1e:baa0  02 9c		 cop #$9c
$1e:baa2  03 68		 ora $68,s
$1e:baa4  33 80		 and ($80,s),y
$1e:baa6  46 a0		 lsr $a0
$1e:baa8  71 00		 adc ($00),y
$1e:baaa  70 00		 bvs $baac
$1e:baac  50 42		 bvc $baf0
$1e:baae  08			php
$1e:baaf  c3 18		 cmp $18,s
$1e:bab1  66 2d		 ror $2d
$1e:bab3  2a			rol a
$1e:bab4  46 cc		 lsr $cc
$1e:bab6  5a			phy
$1e:bab7  99 73 cc	  sta $cc73,y
$1e:baba  5a			phy
$1e:babb  2a			rol a
$1e:babc  46 66		 lsr $66
$1e:babe  2d ff 7f	  and $7fff
$1e:bac1  28			plp
$1e:bac2  14 4c		 trb $4c
$1e:bac4  20 d0 30	  jsr $30d0
$1e:bac7  14 3d		 trb $3d
$1e:bac9  00 00		 brk #$00
$1e:bacb  40			rti
$1e:bacc  28			plp
$1e:bacd  05 00		 ora $00
$1e:bacf  48			pha
$1e:bad0  08			php
$1e:bad1  8d 10 12	  sta $1210
$1e:bad4  21 97		 and ($97,x)
$1e:bad6  31 5a		 and ($5a),y
$1e:bad8  4a			lsr a
$1e:bad9  df 5a 00 20   cmp $20005a,x
$1e:badd  a3 30		 lda $30,s
$1e:badf  27 3d		 and [$3d]
$1e:bae1  aa			tax
$1e:bae2  51 4d		 eor ($4d),y
$1e:bae4  5e 10 09	  lsr $0910,x
$1e:bae7  d6 11		 dec $11,x
$1e:bae9  9e 22 e6	  stz $e622,x
$1e:baec  65 64		 adc $64
$1e:baee  08			php
$1e:baef  c8			iny
$1e:baf0  14 4c		 trb $4c
$1e:baf2  25 d0		 and $d0
$1e:baf4  35 54		 and $54,x
$1e:baf6  46 d8		 lsr $d8
$1e:baf8  56 5c		 lsr $5c,x
$1e:bafa  67 4a		 adc [$4a]
$1e:bafc  04 8c		 tsb $8c
$1e:bafe  08			php
$1e:baff  12 0d		 ora ($0d)
$1e:bb01  d8			cld
$1e:bb02  11 7b		 ora ($7b),y
$1e:bb04  16 40		 asl $40,x
$1e:bb06  51 00		 eor ($00),y
$1e:bb08  6a			ror a
$1e:bb09  dc 2a c6	  jml [$c62a]
$1e:bb0c  15 40		 ora $40,x
$1e:bb0e  00 82		 brk #$82
$1e:bb10  04 e5		 tsb $e5
$1e:bb12  10 27		 bpl $bb3b
$1e:bb14  19 8a 25	  ora $258a,y
$1e:bb17  0e 36 92	  asl $9236
$1e:bb1a  46 c6		 lsr $c6
$1e:bb1c  18			clc
$1e:bb1d  4a			lsr a
$1e:bb1e  29 ad 35	  and #$35ad
$1e:bb21  10 42		 bpl $bb65
$1e:bb23  73 4e		 adc ($4e,s),y
$1e:bb25  d6 5a		 dec $5a,x
$1e:bb27  39 67 9c	  and $9c67,y
$1e:bb2a  73 00		 adc ($00,s),y
$1e:bb2c  60			rts
$1e:bb2d  12 05		 ora ($05)
$1e:bb2f  96 09		 stx $09,y
$1e:bb31  5a			phy
$1e:bb32  0e dd 12	  asl $12dd
$1e:bb35  5e 17 be	  lsr $be17,x
$1e:bb38  3b			tsc
$1e:bb39  de 5b de	  dec $de5b,x
$1e:bb3c  7b			tdc
$1e:bb3d  0e 0c 05	  asl $050c
$1e:bb40  00 c3		 brk #$c3
$1e:bb42  10 47		 bpl $bb8b
$1e:bb44  15 ab		 ora $ab,x
$1e:bb46  25 0e		 and $0e
$1e:bb48  32 b2		 and ($b2)
$1e:bb4a  42 70		 wdm #$70
$1e:bb4c  10 0c		 bpl $bb5a
$1e:bb4e  00 92		 brk #$92
$1e:bb50  10 38		 bpl $bb8a
$1e:bb52  25 fc		 and $fc
$1e:bb54  3d de 5a	  and $5ade,x
$1e:bb57  ff 7f e3 19   sbc $19e37f,x
$1e:bb5b  e0 3e 95	  cpx #$953e
$1e:bb5e  47 90		 eor [$90]
$1e:bb60  00 96		 brk #$96
$1e:bb62  01 9c		 ora ($9c,x)
$1e:bb64  16 00		 asl $00,x
$1e:bb66  00 0e		 brk #$0e
$1e:bb68  08			php
$1e:bb69  16 14		 asl $14,x
$1e:bb6b  00 50		 brk #$50
$1e:bb6d  41 24		 eor ($24,x)
$1e:bb6f  82 38 e3	  brl $9eaa
$1e:bb72  40			rti
$1e:bb73  45 49		 eor $49
$1e:bb75  a6 55		 ldx $55
$1e:bb77  07 5a		 ora [$5a]
$1e:bb79  aa			tax
$1e:bb7a  6a			ror a
$1e:bb7b  e0 1c a0	  cpx #$a01c
$1e:bb7e  35 20		 and $20,x
$1e:bb80  46 a0		 lsr $a0
$1e:bb82  56 27		 lsr $27,x
$1e:bb84  49 69 59	  eor #$5969
$1e:bb87  ab			plb
$1e:bb88  61 ed		 adc ($ed,x)
$1e:bb8a  71 80		 adc ($80),y
$1e:bb8c  03 42		 ora $42,s
$1e:bb8e  08			php
$1e:bb8f  c6 18		 dec $18
$1e:bb91  4a			lsr a
$1e:bb92  29 ce 39	  and #$39ce
$1e:bb95  52 4a		 eor ($4a)
$1e:bb97  d6 5a		 dec $5a,x
$1e:bb99  5a			phy
$1e:bb9a  6b			rtl
$1e:bb9b  f1 00		 sbc ($00),y
$1e:bb9d  d4 19		 pei ($19)
$1e:bb9f  58			cli
$1e:bba0  22 5e 33 26   jsl $26335e
$1e:bba4  00 68		 brk #$68
$1e:bba6  04 ac		 tsb $ac
$1e:bba8  08			php
$1e:bba9  10 11		 bpl $bbbc
$1e:bbab  57 15		 eor [$15],y
$1e:bbad  20 0c 41	  jsr $410c
$1e:bbb0  14 62		 trb $62
$1e:bbb2  1c a3 28	  trb $28a3
$1e:bbb5  e6 38		 inc $38
$1e:bbb7  47 41		 eor [$41]
$1e:bbb9  a9 49 0b	  lda #$0b49
$1e:bbbc  52 a4		 eor ($a4)
$1e:bbbe  10 07		 bpl $bbc7
$1e:bbc0  1d 6a 29	  ora $296a,x
$1e:bbc3  cd 35 30	  cmp $3035
$1e:bbc6  42 93		 wdm #$93
$1e:bbc8  4e d5 56	  lsr $56d5
$1e:bbcb  93 34		 sta ($34,s),y
$1e:bbcd  00 08		 brk #$08
$1e:bbcf  ae 00 84	  ldx $8400
$1e:bbd2  18			clc
$1e:bbd3  c8			iny
$1e:bbd4  30 bd		 bmi $bb93
$1e:bbd6  09 7e 02	  ora #$027e
$1e:bbd9  61 18		 adc ($18,x)
$1e:bbdb  c3 30		 cmp $30,s
$1e:bbdd  66 51		 ror $51
$1e:bbdf  07 6a		 ora [$6a]
$1e:bbe1  cd 6a 36	  cmp $366a
$1e:bbe4  6f 9c 10 dc   adc $dc109c
$1e:bbe8  1e 5a 6b	  asl $6b5a,x
$1e:bbeb  9c 10 46	  stz $4610
$1e:bbee  00 88		 brk #$88
$1e:bbf0  04 ec		 tsb $ec
$1e:bbf2  08			php
$1e:bbf3  70 15		 bvs $bc0a
$1e:bbf5  f4 25 78	  pea $7825
$1e:bbf8  2a			rol a
$1e:bbf9  1c 3b 11	  trb $113b
$1e:bbfc  09 d9 19	  ora #$19d9
$1e:bbff  9c 2a 5e	  stz $5e2a
$1e:bc02  43 88		 eor $88,s
$1e:bc04  10 ec		 bpl $bbf2
$1e:bc06  20 70 31	  jsr $3170
$1e:bc09  7b			tdc
$1e:bc0a  6f 41 1e 06   adc $061e41
$1e:bc0e  0c 4a 18	  tsb $184a
$1e:bc11  8c 24 f0	  sty $f024
$1e:bc14  30 34		 bmi $bc4a
$1e:bc16  41 96		 eor ($96,x)
$1e:bc18  49 fa 51	  eor #$51fa
$1e:bc1b  41 18		 eor ($18,x)
$1e:bc1d  62 20 83	  per $3f40
$1e:bc20  2c a4 38	  bit $38a4
$1e:bc23  e6 40		 inc $40
$1e:bc25  27 4d		 and [$4d]
$1e:bc27  89 59 0b	  bit #$0b59
$1e:bc2a  6a			ror a
$1e:bc2b  0e 44 00	  asl $0044
$1e:bc2e  38			sec
$1e:bc2f  20 41 c4	  jsr $c441
$1e:bc32  54 47 61	  mvn $61,$47
$1e:bc35  41 0c		 eor ($0c,x)
$1e:bc37  83 14		 sta $14,s
$1e:bc39  c5 1c		 cmp $1c
$1e:bc3b  08			php
$1e:bc3c  21 69		 and ($69,x)
$1e:bc3e  25 ac		 and $ac
$1e:bc40  31 ee		 and ($ee),y
$1e:bc42  39 30 42	  and $4230,y
$1e:bc45  80 01		 bra $bc48
$1e:bc47  24 16		 bit $16
$1e:bc49  41 0c		 eor ($0c,x)
$1e:bc4b  0a			asl a
$1e:bc4c  6c 62 18	  jmp ($1862)
$1e:bc4f  62 20 c3	  per $7f72
$1e:bc52  2c 26 3d	  bit $3d26
$1e:bc55  67 04		 adc [$04]
$1e:bc57  ec 0c 6f	  cpx $6f0c
$1e:bc5a  15 13		 ora $13,x
$1e:bc5c  1e e0 08	  asl $08e0,x
$1e:bc5f  a0 01 24	  ldy #$2401
$1e:bc62  16 c6		 asl $c6,x
$1e:bc64  1a			inc a
$1e:bc65  80 01		 bra $bc68
$1e:bc67  24 16		 bit $16
$1e:bc69  41 0c		 eor ($0c,x)
$1e:bc6b  07 1c		 ora [$1c]
$1e:bc6d  02 1c		 cop #$1c
$1e:bc6f  62 20 c4	  per $8092
$1e:bc72  28			plp
$1e:bc73  25 3d		 and $3d
$1e:bc75  41 0c		 eor ($0c,x)
$1e:bc77  83 14		 sta $14,s
$1e:bc79  c5 1c		 cmp $1c
$1e:bc7b  07 25		 ora [$25]
$1e:bc7d  69 25 ac	  adc #$ac25
$1e:bc80  31 ee		 and ($ee),y
$1e:bc82  39 30 42	  and $4230,y
$1e:bc85  aa			tax
$1e:bc86  45 0a		 eor $0a
$1e:bc88  46 41		 lsr $41
$1e:bc8a  0c 40 3c	  tsb $3c40
$1e:bc8d  02 10		 cop #$10
$1e:bc8f  02 20		 cop #$20
$1e:bc91  45 2c		 eor $2c
$1e:bc93  a7 38		 lda [$38]
$1e:bc95  41 0c		 eor ($0c,x)
$1e:bc97  a5 14		 lda $14
$1e:bc99  e7 18		 sbc [$18]
$1e:bc9b  2a			rol a
$1e:bc9c  21 8d		 and ($8d,x)
$1e:bc9e  2d cf 31	  and $31cf
$1e:bca1  32 3a		 and ($3a)
$1e:bca3  95 42		 sta $42,x
$1e:bca5  80 01		 bra $bca8
$1e:bca7  24 16		 bit $16
$1e:bca9  41 0c		 eor ($0c,x)
$1e:bcab  02 4c		 cop #$4c
$1e:bcad  44 24 65	  mvp $65,$24
$1e:bcb0  30 a7		 bmi $bc59
$1e:bcb2  38			sec
$1e:bcb3  e9 40 c0	  sbc #$c040
$1e:bcb6  64 80		 stz $80
$1e:bcb8  54 40 48	  mvn $48,$40
$1e:bcbb  00 34		 brk #$34
$1e:bcbd  0b			phd
$1e:bcbe  00 8f		 brk #$8f
$1e:bcc0  00 d3		 brk #$d3
$1e:bcc2  20 37 11	  jsr $1137
$1e:bcc5  27 04		 and [$04]
$1e:bcc7  02 18		 cop #$18
$1e:bcc9  41 0c		 eor ($0c,x)
$1e:bccb  40			rti
$1e:bccc  61 0c		 adc ($0c,x)
$1e:bcce  4e 4f 5a	  lsr $5a4f
$1e:bcd1  d2 6a		 cmp ($6a)
$1e:bcd3  35 73		 and $73,x
$1e:bcd5  02 18		 cop #$18
$1e:bcd7  80 50		 bra $bd29
$1e:bcd9  a0 5c c0	  ldy #$c05c
$1e:bcdc  64 e0		 stz $e0
$1e:bcde  70 20		 bvs $bd00
$1e:bce0  75 60		 adc $60,x
$1e:bce2  7d e0 7d	  adc $7de0,x
$1e:bce5  04 38		 tsb $38
$1e:bce7  8a			txa
$1e:bce8  39 41 0c	  and $0c41,y
$1e:bceb  4b			phk
$1e:bcec  0c ab 54	  tsb $54ab
$1e:bcef  69 40 6b	  adc #$6b40
$1e:bcf2  55 6b		 eor $6b,x
$1e:bcf4  6d cc 69	  adc $69cc
$1e:bcf7  6a			ror a
$1e:bcf8  66 0a		 ror $0a
$1e:bcfa  5e ca 76	  lsr $76ca,x
$1e:bcfd  0c 00 b2	  tsb $b200
$1e:bd00  00 70		 brk #$70
$1e:bd02  01 c6		 ora ($c6,x)
$1e:bd04  44 80 01	  mvp $01,$80
$1e:bd07  24 16		 bit $16
$1e:bd09  41 0c		 eor ($0c,x)
$1e:bd0b  00 48		 brk #$48
$1e:bd0d  14 05		 trb $05
$1e:bd0f  12 15		 ora ($15)
$1e:bd11  30 21		 bmi $bd34
$1e:bd13  2f 31 4d 3d   and $3d4d31
$1e:bd17  4c 4d 49	  jmp $494d
$1e:bd1a  5d 48 69	  eor $6948,x
$1e:bd1d  41 10		 eor ($10,x)
$1e:bd1f  c5 20		 cmp $20
$1e:bd21  4e 25 9c	  lsr $9c25
$1e:bd24  16 77		 asl $77,x
$1e:bd26  05 aa		 ora $aa
$1e:bd28  00 da		 brk #$da
$1e:bd2a  09 00 48	  ora #$4800
$1e:bd2d  40			rti
$1e:bd2e  55 4f		 eor $4f,x
$1e:bd30  4e 13 57	  lsr $5713
$1e:bd33  68			pla
$1e:bd34  35 8c		 and $8c,x
$1e:bd36  00 53		 brk #$53
$1e:bd38  01 3b		 ora ($3b,x)
$1e:bd3a  02 80		 cop #$80
$1e:bd3c  00 06		 brk #$06
$1e:bd3e  00 c0		 brk #$c0
$1e:bd40  00 20		 brk #$20
$1e:bd42  01 a0		 ora ($a0,x)
$1e:bd44  05 60		 ora $60
$1e:bd46  0c e0 24	  tsb $24e0
$1e:bd49  00 00		 brk #$00
$1e:bd4b  00 48		 brk #$48
$1e:bd4d  40			rti
$1e:bd4e  55 4f		 eor $4f,x
$1e:bd50  4e 13 57	  lsr $5713
$1e:bd53  68			pla
$1e:bd54  35 8c		 and $8c,x
$1e:bd56  00 53		 brk #$53
$1e:bd58  01 3b		 ora ($3b,x)
$1e:bd5a  02 db		 cop #$db
$1e:bd5c  0a			asl a
$1e:bd5d  06 00		 asl $00
$1e:bd5f  0e 00 14	  asl $1400
$1e:bd62  00 1a		 brk #$1a
$1e:bd64  00 60		 brk #$60
$1e:bd66  0c e0 24	  tsb $24e0
$1e:bd69  00 00		 brk #$00
$1e:bd6b  00 36		 brk #$36
$1e:bd6d  40			rti
$1e:bd6e  55 ee		 eor $ee,x
$1e:bd70  35 80		 and $80,x
$1e:bd72  4e c0 40	  lsr $40c0
$1e:bd75  60			rts
$1e:bd76  2c 00 10	  bit $1000
$1e:bd79  00 00		 brk #$00
$1e:bd7b  db			stp
$1e:bd7c  0a			asl a
$1e:bd7d  4b			phk
$1e:bd7e  00 d3		 brk #$d3
$1e:bd80  00 98		 brk #$98
$1e:bd82  11 1a		 ora ($1a),y
$1e:bd84  1a			inc a
$1e:bd85  9b			txy
$1e:bd86  2e fb 3a	  rol $3afb
$1e:bd89  3b			tsc
$1e:bd8a  57 00		 eor [$00],y
$1e:bd8c  48			pha
$1e:bd8d  40			rti
$1e:bd8e  55 4f		 eor $4f,x
$1e:bd90  4e 13 57	  lsr $5713
$1e:bd93  68			pla
$1e:bd94  35 8c		 and $8c,x
$1e:bd96  00 53		 brk #$53
$1e:bd98  01 3b		 ora ($3b,x)
$1e:bd9a  02 db		 cop #$db
$1e:bd9c  0a			asl a
$1e:bd9d  4b			phk
$1e:bd9e  00 d3		 brk #$d3
$1e:bda0  00 98		 brk #$98
$1e:bda2  11 1a		 ora ($1a),y
$1e:bda4  1a			inc a
$1e:bda5  60			rts
$1e:bda6  0c e0 24	  tsb $24e0
$1e:bda9  00 00		 brk #$00
$1e:bdab  00 48		 brk #$48
$1e:bdad  40			rti
$1e:bdae  55 06		 eor $06,x
$1e:bdb0  00 0b		 brk #$0b
$1e:bdb2  00 14		 brk #$14
$1e:bdb4  00 1a		 brk #$1a
$1e:bdb6  00 53		 brk #$53
$1e:bdb8  01 3b		 ora ($3b,x)
$1e:bdba  02 db		 cop #$db
$1e:bdbc  0a			asl a
$1e:bdbd  8c 00 d3	  sty $d300
$1e:bdc0  00 98		 brk #$98
$1e:bdc2  11 1a		 ora ($1a),y
$1e:bdc4  1a			inc a
$1e:bdc5  9b			txy
$1e:bdc6  2e fb 3a	  rol $3afb
$1e:bdc9  02 00		 cop #$00
$1e:bdcb  00 48		 brk #$48
$1e:bdcd  40			rti
$1e:bdce  55 5b		 eor $5b,x
$1e:bdd0  39 da 20	  and $20da,y
$1e:bdd3  56 10		 lsr $10,x
$1e:bdd5  02 00		 cop #$00
$1e:bdd7  53 01		 eor ($01,s),y
$1e:bdd9  3b			tsc
$1e:bdda  02 db		 cop #$db
$1e:bddc  0a			asl a
$1e:bddd  4b			phk
$1e:bdde  00 d3		 brk #$d3
$1e:bde0  00 98		 brk #$98
$1e:bde2  11 1a		 ora ($1a),y
$1e:bde4  1a			inc a
$1e:bde5  9b			txy
$1e:bde6  2e fb 3a	  rol $3afb
$1e:bde9  3b			tsc
$1e:bdea  57 70		 eor [$70],y
$1e:bdec  10 0c		 bpl $bdfa
$1e:bdee  00 92		 brk #$92
$1e:bdf0  10 38		 bpl $be2a
$1e:bdf2  25 fc		 and $fc
$1e:bdf4  3d de 5a	  and $5ade,x
$1e:bdf7  ff 7f e3 19   sbc $19e37f,x
$1e:bdfb  e0 3e 95	  cpx #$953e
$1e:bdfe  47 90		 eor [$90]
$1e:be00  00 96		 brk #$96
$1e:be02  01 9c		 ora ($9c,x)
$1e:be04  16 00		 asl $00,x
$1e:be06  00 0e		 brk #$0e
$1e:be08  08			php
$1e:be09  16 14		 asl $14,x
$1e:be0b  00 50		 brk #$50
$1e:be0d  a2 08 e3	  ldx #$e308
$1e:be10  10 26		 bpl $be38
$1e:be12  15 68		 ora $68,x
$1e:be14  1d ab 25	  ora $25ab,x
$1e:be17  0c 2e 70	  tsb $702e
$1e:be1a  36 e0		 rol $e0,x
$1e:be1c  1c a0 35	  trb $35a0
$1e:be1f  20 46 a0	  jsr $a046
$1e:be22  56 27		 lsr $27,x
$1e:be24  49 69 59	  eor #$5969
$1e:be27  ab			plb
$1e:be28  61 ed		 adc ($ed,x)
$1e:be2a  71 80		 adc ($80),y
$1e:be2c  03 42		 ora $42,s
$1e:be2e  08			php
$1e:be2f  c6 18		 dec $18
$1e:be31  4a			lsr a
$1e:be32  29 ef 3d	  and #$3def
$1e:be35  94 52		 sty $52,x
$1e:be37  18			clc
$1e:be38  63 9c		 adc $9c,s
$1e:be3a  73 f1		 adc ($f1,s),y
$1e:be3c  00 b9		 brk #$b9
$1e:be3e  0d 7c 16	  ora $167c
$1e:be41  5e 33 0c	  lsr $0c33,x
$1e:be44  3a			dec a
$1e:be45  90 4a		 bcc $be91
$1e:be47  14 5b		 trb $5b
$1e:be49  9e 25 57	  stz $5725,x
$1e:be4c  15 4a		 ora $4a,x
$1e:be4e  00 f1		 brk #$f1
$1e:be50  00 b9		 brk #$b9
$1e:be52  0d 7c 16	  ora $167c
$1e:be55  5e 33 0c	  lsr $0c33,x
$1e:be58  3a			dec a
$1e:be59  90 4a		 bcc $bea5
$1e:be5b  14 5b		 trb $5b
$1e:be5d  08			php
$1e:be5e  21 6b		 and ($6b,x)
$1e:be60  2d ce 39	  and $39ce
$1e:be63  31 46		 and ($46),y
$1e:be65  94 52		 sty $52,x
$1e:be67  f7 5e		 sbc [$5e],y
$1e:be69  5a			phy
$1e:be6a  6b			rtl
$1e:be6b  93 34		 sta ($34,s),y
$1e:be6d  05 00		 ora $00
$1e:be6f  0c 00 52	  tsb $5200
$1e:be72  10 f8		 bpl $be6c
$1e:be74  30 fc		 bmi $be72
$1e:be76  55 de		 eor $de,x
$1e:be78  62 61 18	  per $d6dc
$1e:be7b  c3 30		 cmp $30,s
$1e:be7d  66 51		 ror $51
$1e:be7f  07 6a		 ora [$6a]
$1e:be81  cd 6a 36	  cmp $366a
$1e:be84  6f 0c 3a 90   adc $903a0c
$1e:be88  4a			lsr a
$1e:be89  5a			phy
$1e:be8a  6b			rtl
$1e:be8b  9c 10 21	  stz $2110
$1e:be8e  0c 63 10	  tsb $1063
$1e:be91  a5 1c		 lda $1c
$1e:be93  08			php
$1e:be94  2d 6b 39	  and $396b
$1e:be97  ef 45 94 5a   sbc $5a9445
$1e:be9b  f1 00		 sbc ($00),y
$1e:be9d  b9 0d 7c	  lda $7c0d,y
$1e:bea0  16 5e		 asl $5e,x
$1e:bea2  33 0c		 and ($0c,s),y
$1e:bea4  3a			dec a
$1e:bea5  90 4a		 bcc $bef1
$1e:bea7  14 5b		 trb $5b
$1e:bea9  7b			tdc
$1e:beaa  6f 41 1e 42   adc $421e41
$1e:beae  08			php
$1e:beaf  c6 18		 dec $18
$1e:beb1  4a			lsr a
$1e:beb2  29 ef 3d	  and #$3def
$1e:beb5  94 52		 sty $52,x
$1e:beb7  18			clc
$1e:beb8  63 9c		 adc $9c,s
$1e:beba  73 a2		 adc ($a2,s),y
$1e:bebc  08			php
$1e:bebd  e3 10		 sbc $10,s
$1e:bebf  26 15		 rol $15
$1e:bec1  68			pla
$1e:bec2  1d ab 25	  ora $25ab,x
$1e:bec5  0c 2e 70	  tsb $702e
$1e:bec8  36 14		 rol $14,x
$1e:beca  47 00		 eor [$00]
$1e:becc  50 0c		 bvc $beda
$1e:bece  00 92		 brk #$92
$1e:bed0  10 38		 bpl $bf0a
$1e:bed2  25 fc		 and $fc
$1e:bed4  3d de 5a	  and $5ade,x
$1e:bed7  ff 7f e3 19   sbc $19e37f,x
$1e:bedb  e0 3e 95	  cpx #$953e
$1e:bede  47 90		 eor [$90]
$1e:bee0  00 96		 brk #$96
$1e:bee2  01 9c		 ora ($9c,x)
$1e:bee4  16 43		 asl $43,x
$1e:bee6  04 0e		 tsb $0e
$1e:bee8  08			php
$1e:bee9  16 14		 asl $14,x
$1e:beeb  a5 14		 lda $14
$1e:beed  85 18		 sta $18
$1e:beef  64 14		 stz $14
$1e:bef1  43 10		 eor $10,s
$1e:bef3  22 0c 21 08   jsl $08210c
$1e:bef7  a0 00 20	  ldy #$2000
$1e:befa  15 c0		 ora $c0,x
$1e:befc  19 40 26	  ora $2640,y
$1e:beff  e0 2e 46	  cpx #$462e
$1e:bf02  08			php
$1e:bf03  00 00		 brk #$00
$1e:bf05  ab			plb
$1e:bf06  0c 0d 15	  tsb $150d
$1e:bf09  44 00 8c	  mvp $8c,$00
$1e:bf0c  7a			ply
$1e:bf0d  87 08		 sta [$08]
$1e:bf0f  ca			dex
$1e:bf10  0c 2d 11	  tsb $112d
$1e:bf13  91 1d		 sta ($1d),y
$1e:bf15  f4 25 88	  pea $8825
$1e:bf18  29 63 21	  and #$2163
$1e:bf1b  24 19		 bit $19
$1e:bf1d  e3 10		 sbc $10,s
$1e:bf1f  84 28		 sty $28
$1e:bf21  08			php
$1e:bf22  39 ce 51	  and $51ce,y
$1e:bf25  52 62		 eor ($62)
$1e:bf27  18			clc
$1e:bf28  73 ff		 adc ($ff,s),y
$1e:bf2a  7f 0f 3c 65   adc $653c0f,x
$1e:bf2e  08			php
$1e:bf2f  a7 08		 lda [$08]
$1e:bf31  ca			dex
$1e:bf32  0c 2d 11	  tsb $112d
$1e:bf35  91 1d		 sta ($1d),y
$1e:bf37  20 01 a4	  jsr $a401
$1e:bf3a  09 28 12	  ora #$1228
$1e:bf3d  c8			iny
$1e:bf3e  1a			inc a
$1e:bf3f  62 10 c4	  per $8352
$1e:bf42  18			clc
$1e:bf43  27 25		 and [$25]
$1e:bf45  ab			plb
$1e:bf46  35 0e		 and $0e,x
$1e:bf48  42 43		 wdm #$43
$1e:bf4a  04 00		 tsb $00
$1e:bf4c  60			rts
$1e:bf4d  f6 01		 inc $01,x
$1e:bf4f  74 01		 stz $01,x
$1e:bf51  a2 08 e4	  ldx #$e408
$1e:bf54  10 46		 bpl $bf9c
$1e:bf56  0d a8 0d	  ora $0da8
$1e:bf59  8a			txa
$1e:bf5a  1c 8f 20	  trb $208f
$1e:bf5d  f2 30		 sbc ($30)
$1e:bf5f  36 41		 rol $41,x
$1e:bf61  66 08		 ror $08
$1e:bf63  aa			tax
$1e:bf64  0c 0d 15	  tsb $150d
$1e:bf67  50 1d		 bvc $bf86
$1e:bf69  44 00 dd	  mvp $dd,$00
$1e:bf6c  4d a8 08	  eor $08a8
$1e:bf6f  eb			xba
$1e:bf70  0c 2d 19	  tsb $192d
$1e:bf73  8f 21 f1 2d   sta $2df121
$1e:bf77  65 08		 adc $08
$1e:bf79  87 08		 sta [$08]
$1e:bf7b  ca			dex
$1e:bf7c  0c 2d 11	  tsb $112d
$1e:bf7f  62 10 c4	  per $8392
$1e:bf82  18			clc
$1e:bf83  27 25		 and [$25]
$1e:bf85  ab			plb
$1e:bf86  35 0e		 and $0e,x
$1e:bf88  42 43		 wdm #$43
$1e:bf8a  00 dd		 brk #$dd
$1e:bf8c  01 65		 ora ($65,x)
$1e:bf8e  08			php
$1e:bf8f  87 08		 sta [$08]
$1e:bf91  ca			dex
$1e:bf92  0c 2d 11	  tsb $112d
$1e:bf95  90 19		 bcc $bfb0
$1e:bf97  e4 10		 cpx $10
$1e:bf99  46 0d		 lsr $0d
$1e:bf9b  a1 20		 lda ($20,x)
$1e:bf9d  a1 20		 lda ($20,x)
$1e:bf9f  e3 28		 sbc $28,s
$1e:bfa1  25 31		 and $31
$1e:bfa3  86 3d		 stx $3d
$1e:bfa5  e3 28		 sbc $28,s
$1e:bfa7  25 31		 and $31
$1e:bfa9  86 3d		 stx $3d
$1e:bfab  00 50		 brk #$50
$1e:bfad  0c 00 92	  tsb $9200
$1e:bfb0  10 38		 bpl $bfea
$1e:bfb2  25 fc		 and $fc
$1e:bfb4  3d de 5a	  and $5ade,x
$1e:bfb7  ff 7f e3 19   sbc $19e37f,x
$1e:bfbb  e0 3e 95	  cpx #$953e
$1e:bfbe  47 90		 eor [$90]
$1e:bfc0  00 96		 brk #$96
$1e:bfc2  01 9c		 ora ($9c,x)
$1e:bfc4  16 43		 asl $43,x
$1e:bfc6  04 0e		 tsb $0e
$1e:bfc8  08			php
$1e:bfc9  16 14		 asl $14,x
$1e:bfcb  a5 14		 lda $14
$1e:bfcd  a8			tay
$1e:bfce  2d ea 35	  and $35ea
$1e:bfd1  2c 3e 6e	  bit $6e3e
$1e:bfd4  46 b0		 lsr $b0
$1e:bfd6  4e a0 00	  lsr $00a0
$1e:bfd9  20 15 a0	  jsr $a015
$1e:bfdc  1d 00 2e	  ora $2e00,x
$1e:bfdf  80 36		 bra $c017
$1e:bfe1  46 08		 lsr $08
$1e:bfe3  46 08		 lsr $08
$1e:bfe5  ab			plb
$1e:bfe6  0c 0d 15	  tsb $150d
$1e:bfe9  44 00 8c	  mvp $8c,$00
$1e:bfec  7a			ply
$1e:bfed  a8			tay
$1e:bfee  08			php
$1e:bfef  eb			xba
$1e:bff0  0c 2d 11	  tsb $112d
$1e:bff3  91 1d		 sta ($1d),y
$1e:bff5  f4 25 88	  pea $8825
$1e:bff8  29 63 21	  and #$2163
$1e:bffb  24 19		 bit $19
$1e:bffd  e3 10		 sbc $10,s
$1e:bfff  84 28		 sty $28
$1e:c001  08			php
$1e:c002  39 ce 51	  and $51ce,y
$1e:c005  52 62		 eor ($62)
$1e:c007  18			clc
$1e:c008  73 ff		 adc ($ff,s),y
$1e:c00a  7f 0f 3c 86   adc $863c0f,x
$1e:c00e  0c a9 0c	  tsb $0ca9
$1e:c011  ec 14 50	  cpx $5014
$1e:c014  1d d3 29	  ora $29d3,x
$1e:c017  c2 10		 rep #$10
$1e:c019  45 15		 eor $15
$1e:c01b  a8			tay
$1e:c01c  15 08		 ora $08,x
$1e:c01e  1a			inc a
$1e:c01f  85 08		 sta $08
$1e:c021  c7 08		 cmp [$08]
$1e:c023  2b			pld
$1e:c024  0d 6e 0d	  ora $0d6e
$1e:c027  af 19 43 04   lda $044319
$1e:c02b  00 60		 brk #$60
$1e:c02d  86 0c		 stx $0c
$1e:c02f  a9 0c ec	  lda #$ec0c
$1e:c032  14 50		 trb $50
$1e:c034  1d d3 29	  ora $29d3,x
$1e:c037  c2 10		 rep #$10
$1e:c039  45 15		 eor $15
$1e:c03b  a8			tay
$1e:c03c  15 08		 ora $08,x
$1e:c03e  1a			inc a
$1e:c03f  62 10 c4	  per $8452
$1e:c042  18			clc
$1e:c043  27 25		 and [$25]
$1e:c045  ab			plb
$1e:c046  35 0e		 and $0e,x
$1e:c048  42 43		 wdm #$43
$1e:c04a  04 dd		 tsb $dd
$1e:c04c  4d a8 08	  eor $08a8
$1e:c04f  eb			xba
$1e:c050  0c 2d 19	  tsb $192d
$1e:c053  8f 21 f1 2d   sta $2df121
$1e:c057  65 08		 adc $08
$1e:c059  87 08		 sta [$08]
$1e:c05b  ca			dex
$1e:c05c  0c 2d 11	  tsb $112d
$1e:c05f  62 10 c4	  per $8472
$1e:c062  18			clc
$1e:c063  27 25		 and [$25]
$1e:c065  ab			plb
$1e:c066  35 0e		 and $0e,x
$1e:c068  42 43		 wdm #$43
$1e:c06a  00 dd		 brk #$dd
$1e:c06c  01 65		 ora ($65,x)
$1e:c06e  08			php
$1e:c06f  87 08		 sta [$08]
$1e:c071  ca			dex
$1e:c072  0c 2d 11	  tsb $112d
$1e:c075  90 19		 bcc $c090
$1e:c077  e4 10		 cpx $10
$1e:c079  46 0d		 lsr $0d
$1e:c07b  a1 20		 lda ($20,x)
$1e:c07d  a1 20		 lda ($20,x)
$1e:c07f  e3 28		 sbc $28,s
$1e:c081  25 31		 and $31
$1e:c083  86 3d		 stx $3d
$1e:c085  e3 28		 sbc $28,s
$1e:c087  25 31		 and $31
$1e:c089  86 3d		 stx $3d
$1e:c08b  00 50		 brk #$50
$1e:c08d  0c 00 92	  tsb $9200
$1e:c090  10 38		 bpl $c0ca
$1e:c092  25 fc		 and $fc
$1e:c094  3d de 5a	  and $5ade,x
$1e:c097  ff 7f e3 19   sbc $19e37f,x
$1e:c09b  e0 3e 95	  cpx #$953e
$1e:c09e  47 90		 eor [$90]
$1e:c0a0  00 96		 brk #$96
$1e:c0a2  01 9c		 ora ($9c,x)
$1e:c0a4  16 43		 asl $43,x
$1e:c0a6  04 0e		 tsb $0e
$1e:c0a8  08			php
$1e:c0a9  16 14		 asl $14,x
$1e:c0ab  a5 14		 lda $14
$1e:c0ad  a8			tay
$1e:c0ae  2d ea 35	  and $35ea
$1e:c0b1  2c 3e 6e	  bit $6e3e
$1e:c0b4  46 b0		 lsr $b0
$1e:c0b6  4e a0 00	  lsr $00a0
$1e:c0b9  20 15 a0	  jsr $a015
$1e:c0bc  1d 00 2e	  ora $2e00,x
$1e:c0bf  80 36		 bra $c0f7
$1e:c0c1  46 08		 lsr $08
$1e:c0c3  46 08		 lsr $08
$1e:c0c5  ab			plb
$1e:c0c6  0c 0d 15	  tsb $150d
$1e:c0c9  44 00 ad	  mvp $ad,$00
$1e:c0cc  35 a7		 and $a7,x
$1e:c0ce  08			php
$1e:c0cf  ca			dex
$1e:c0d0  0c 4f 19	  tsb $194f
$1e:c0d3  b2 1d		 lda ($1d)
$1e:c0d5  f4 25 0d	  pea $0d25
$1e:c0d8  11 a8		 ora ($a8),y
$1e:c0da  15 45		 ora $45,x
$1e:c0dc  15 c2		 ora $c2,x
$1e:c0de  10 84		 bpl $c064
$1e:c0e0  28			plp
$1e:c0e1  08			php
$1e:c0e2  39 ce 51	  and $51ce,y
$1e:c0e5  52 62		 eor ($62)
$1e:c0e7  18			clc
$1e:c0e8  73 ff		 adc ($ff,s),y
$1e:c0ea  7f 0f 3c 65   adc $653c0f,x
$1e:c0ee  08			php
$1e:c0ef  87 08		 sta [$08]
$1e:c0f1  ca			dex
$1e:c0f2  0c 2d 11	  tsb $112d
$1e:c0f5  91 1d		 sta ($1d),y
$1e:c0f7  c2 10		 rep #$10
$1e:c0f9  45 15		 eor $15
$1e:c0fb  e3 05		 sbc $05,s
$1e:c0fd  47 12		 eor [$12]
$1e:c0ff  62 10 c4	  per $8512
$1e:c102  18			clc
$1e:c103  27 25		 and [$25]
$1e:c105  ab			plb
$1e:c106  35 0e		 and $0e,x
$1e:c108  42 43		 wdm #$43
$1e:c10a  04 00		 tsb $00
$1e:c10c  60			rts
$1e:c10d  f6 01		 inc $01,x
$1e:c10f  74 01		 stz $01,x
$1e:c111  82 08 e4	  brl $a51c
$1e:c114  10 46		 bpl $c15c
$1e:c116  0d a8 0d	  ora $0da8
$1e:c119  8a			txa
$1e:c11a  1c 8f 20	  trb $208f
$1e:c11d  f2 30		 sbc ($30)
$1e:c11f  36 41		 rol $41,x
$1e:c121  66 08		 ror $08
$1e:c123  aa			tax
$1e:c124  0c 0d 15	  tsb $150d
$1e:c127  50 1d		 bvc $c146
$1e:c129  44 00 dd	  mvp $dd,$00
$1e:c12c  4d a8 08	  eor $08a8
$1e:c12f  eb			xba
$1e:c130  0c 2d 19	  tsb $192d
$1e:c133  8f 21 f1 2d   sta $2df121
$1e:c137  65 08		 adc $08
$1e:c139  87 08		 sta [$08]
$1e:c13b  ca			dex
$1e:c13c  0c 2d 11	  tsb $112d
$1e:c13f  62 10 c4	  per $8552
$1e:c142  18			clc
$1e:c143  27 25		 and [$25]
$1e:c145  ab			plb
$1e:c146  35 0e		 and $0e,x
$1e:c148  42 43		 wdm #$43
$1e:c14a  00 dd		 brk #$dd
$1e:c14c  01 65		 ora ($65,x)
$1e:c14e  08			php
$1e:c14f  87 08		 sta [$08]
$1e:c151  ca			dex
$1e:c152  0c 2d 11	  tsb $112d
$1e:c155  90 19		 bcc $c170
$1e:c157  e4 10		 cpx $10
$1e:c159  46 0d		 lsr $0d
$1e:c15b  a1 20		 lda ($20,x)
$1e:c15d  a1 20		 lda ($20,x)
$1e:c15f  e3 28		 sbc $28,s
$1e:c161  25 31		 and $31
$1e:c163  86 3d		 stx $3d
$1e:c165  e3 28		 sbc $28,s
$1e:c167  25 31		 and $31
$1e:c169  86 3d		 stx $3d
$1e:c16b  00 50		 brk #$50
$1e:c16d  0c 00 92	  tsb $9200
$1e:c170  10 38		 bpl $c1aa
$1e:c172  25 fc		 and $fc
$1e:c174  3d de 5a	  and $5ade,x
$1e:c177  ff 7f e3 19   sbc $19e37f,x
$1e:c17b  e0 3e 95	  cpx #$953e
$1e:c17e  47 90		 eor [$90]
$1e:c180  00 96		 brk #$96
$1e:c182  01 9c		 ora ($9c,x)
$1e:c184  16 00		 asl $00,x
$1e:c186  00 0e		 brk #$0e
$1e:c188  08			php
$1e:c189  16 14		 asl $14,x
$1e:c18b  8c 31 46	  sty $4631
$1e:c18e  21 25		 and ($25,x)
$1e:c190  1d 04 19	  ora $1904,x
$1e:c193  e3 14		 sbc $14,s
$1e:c195  46 21		 lsr $21
$1e:c197  25 1d		 and $1d
$1e:c199  04 19		 tsb $19
$1e:c19b  e3 14		 sbc $14,s
$1e:c19d  c2 10		 rep #$10
$1e:c19f  46 21		 lsr $21
$1e:c1a1  ca			dex
$1e:c1a2  31 4e		 and ($4e),y
$1e:c1a4  42 46		 wdm #$46
$1e:c1a6  21 ca		 and ($ca,x)
$1e:c1a8  31 4e		 and ($4e),y
$1e:c1aa  42 00		 wdm #$00
$1e:c1ac  50 43		 bvc $c1f1
$1e:c1ae  04 87		 tsb $87
$1e:c1b0  0c ec 14	  tsb $14ec
$1e:c1b3  50 1d		 bvc $c1d2
$1e:c1b5  d3 29		 cmp ($29,s),y
$1e:c1b7  57 36		 eor [$36],y
$1e:c1b9  66 04		 ror $04
$1e:c1bb  ca			dex
$1e:c1bc  08			php
$1e:c1bd  2c 11 62	  bit $6211
$1e:c1c0  10 c4		 bpl $c186
$1e:c1c2  18			clc
$1e:c1c3  27 25		 and [$25]
$1e:c1c5  ab			plb
$1e:c1c6  35 0e		 and $0e,x
$1e:c1c8  42 43		 wdm #$43
$1e:c1ca  04 40		 tsb $40
$1e:c1cc  28			plp
$1e:c1cd  00 0c		 brk #$0c
$1e:c1cf  21 18		 and ($18,x)
$1e:c1d1  63 20		 adc $20,s
$1e:c1d3  a5 28		 lda $28
$1e:c1d5  08			php
$1e:c1d6  35 8b		 and $8b,x
$1e:c1d8  41 4d		 eor ($4d,x)
$1e:c1da  52 43		 eor ($43)
$1e:c1dc  04 87		 tsb $87
$1e:c1de  0c ec 14	  tsb $14ec
$1e:c1e1  50 1d		 bvc $c200
$1e:c1e3  d3 29		 cmp ($29,s),y
$1e:c1e5  57 36		 eor [$36],y
$1e:c1e7  db			stp
$1e:c1e8  46 dc		 lsr $dc
$1e:c1ea  11 e6		 ora ($e6),y
$1e:c1ec  65 44		 adc $44
$1e:c1ee  00 89		 brk #$89
$1e:c1f0  04 cd		 tsb $cd
$1e:c1f2  08			php
$1e:c1f3  51 0d		 eor ($0d),y
$1e:c1f5  d5 15		 cmp $15,x
$1e:c1f7  59 1e dc	  eor $dc1e,y
$1e:c1fa  2a			rol a
$1e:c1fb  63 18		 adc $18,s
$1e:c1fd  c6 20		 dec $20
$1e:c1ff  4a			lsr a
$1e:c200  29 ce 31	  and #$31ce
$1e:c203  52 46		 eor ($46)
$1e:c205  d6 56		 dec $56,x
$1e:c207  42 08		 wdm #$08
$1e:c209  bd 77 35	  lda $3577,x
$1e:c20c  14 02		 trb $02
$1e:c20e  00 25		 brk #$25
$1e:c210  00 6b		 brk #$6b
$1e:c212  04 b1		 tsb $b1
$1e:c214  08			php
$1e:c215  17 19		 ora [$19],y
$1e:c217  9b			txy
$1e:c218  25 1c		 and $1c
$1e:c21a  2e a3 0c	  rol $0ca3
$1e:c21d  25 11		 and $11
$1e:c21f  a6 15		 ldx $15
$1e:c221  2a			rol a
$1e:c222  1a			inc a
$1e:c223  8e 1e ca	  stx $ca1e
$1e:c226  08			php
$1e:c227  2c 11 90	  bit $9011
$1e:c22a  19 00 60	  ora $6000,y
$1e:c22d  c2 10		 rep #$10
$1e:c22f  46 21		 lsr $21
$1e:c231  ca			dex
$1e:c232  31 4e		 and ($4e),y
$1e:c234  42 82		 wdm #$82
$1e:c236  18			clc
$1e:c237  05 2d		 ora $2d
$1e:c239  87 31		 sta [$31]
$1e:c23b  2a			rol a
$1e:c23c  3a			dec a
$1e:c23d  4f 1d 24 00   eor $00241d
$1e:c241  66 04		 ror $04
$1e:c243  ca			dex
$1e:c244  08			php
$1e:c245  2c 11 90	  bit $9011
$1e:c248  19 f2 21	  ora $21f2,y
$1e:c24b  00 50		 brk #$50
$1e:c24d  0c 00 92	  tsb $9200
$1e:c250  10 38		 bpl $c28a
$1e:c252  25 fc		 and $fc
$1e:c254  3d de 5a	  and $5ade,x
$1e:c257  ff 7f e3 19   sbc $19e37f,x
$1e:c25b  e0 3e 95	  cpx #$953e
$1e:c25e  47 90		 eor [$90]
$1e:c260  00 96		 brk #$96
$1e:c262  01 9c		 ora ($9c,x)
$1e:c264  16 00		 asl $00,x
$1e:c266  00 0e		 brk #$0e
$1e:c268  08			php
$1e:c269  16 14		 asl $14,x
$1e:c26b  c2 11		 rep #$11
$1e:c26d  e5 24		 sbc $24
$1e:c26f  00 21		 brk #$21
$1e:c271  80 31		 bra $c2a4
$1e:c273  00 42		 brk #$42
$1e:c275  80 52		 bra $c2c9
$1e:c277  00 63		 brk #$63
$1e:c279  80 73		 bra $c2ee
$1e:c27b  06 18		 asl $18
$1e:c27d  0b			phd
$1e:c27e  2c 31 44	  bit $4431
$1e:c281  d4 50		 pei ($50)
$1e:c283  98			tya
$1e:c284  61 3a		 adc ($3a,x)
$1e:c286  6a			ror a
$1e:c287  dd 76 e0	  cmp $e076,x
$1e:c28a  56 c0		 lsr $c0,x
$1e:c28c  04 88		 tsb $88
$1e:c28e  28			plp
$1e:c28f  88			dey
$1e:c290  28			plp
$1e:c291  ca			dex
$1e:c292  30 0c		 bmi $c2a0
$1e:c294  39 6d 45	  and $456d,y
$1e:c297  ca			dex
$1e:c298  30 0c		 bmi $c2a6
$1e:c29a  39 6d 45	  and $456d,y
$1e:c29d  11 31		 ora ($31),y
$1e:c29f  51 3d		 eor ($3d),y
$1e:c2a1  92 41		 sta ($41)
$1e:c2a3  f3 4d		 sbc ($4d,s),y
$1e:c2a5  92 41		 sta ($41)
$1e:c2a7  51 3d		 eor ($3d),y
$1e:c2a9  02 00		 cop #$00
$1e:c2ab  40			rti
$1e:c2ac  28			plp
$1e:c2ad  21 0c		 and ($0c,x)
$1e:c2af  63 14		 adc $14,s
$1e:c2b1  c6 20		 dec $20
$1e:c2b3  4b			phk
$1e:c2b4  31 ef		 and ($ef),y
$1e:c2b6  45 32		 eor $32
$1e:c2b8  4e d7 62	  lsr $62d7
$1e:c2bb  43 04		 eor $04,s
$1e:c2bd  87 0c		 sta [$0c]
$1e:c2bf  ea			nop
$1e:c2c0  14 4f		 trb $4f
$1e:c2c2  1d d3 29	  ora $29d3,x
$1e:c2c5  57 36		 eor [$36],y
$1e:c2c7  db			stp
$1e:c2c8  46 7e		 lsr $7e
$1e:c2ca  7b			tdc
$1e:c2cb  e6 65		 inc $65
$1e:c2cd  44 00 89	  mvp $89,$00
$1e:c2d0  04 cd		 tsb $cd
$1e:c2d2  08			php
$1e:c2d3  51 0d		 eor ($0d),y
$1e:c2d5  d5 15		 cmp $15,x
$1e:c2d7  59 1e dc	  eor $dc1e,y
$1e:c2da  2a			rol a
$1e:c2db  63 18		 adc $18,s
$1e:c2dd  c6 20		 dec $20
$1e:c2df  4a			lsr a
$1e:c2e0  29 ce 31	  and #$31ce
$1e:c2e3  52 46		 eor ($46)
$1e:c2e5  d6 56		 dec $56,x
$1e:c2e7  42 08		 wdm #$08
$1e:c2e9  bd 77 35	  lda $3577,x
$1e:c2ec  14 02		 trb $02
$1e:c2ee  00 25		 brk #$25
$1e:c2f0  00 6b		 brk #$6b
$1e:c2f2  04 b1		 tsb $b1
$1e:c2f4  08			php
$1e:c2f5  17 19		 ora [$19],y
$1e:c2f7  9b			txy
$1e:c2f8  25 1c		 and $1c
$1e:c2fa  2e a0 0c	  rol $0ca0
$1e:c2fd  20 0d a0	  jsr $a00d
$1e:c300  11 20		 ora ($20),y
$1e:c302  16 80		 asl $80,x
$1e:c304  1a			inc a
$1e:c305  ce 14 32	  dec $3214
$1e:c308  25 97		 and $97
$1e:c30a  31 00		 and ($00),y
$1e:c30c  60			rts
$1e:c30d  ce 20 0f	  dec $0f20
$1e:c310  29 50 31	  and #$3150
$1e:c313  b2 41		 lda ($41)
$1e:c315  4a			lsr a
$1e:c316  00 12		 brk #$12
$1e:c318  00 18		 brk #$18
$1e:c31a  00 1e		 brk #$1e
$1e:c31c  00 4f		 brk #$4f
$1e:c31e  1d 24 00	  ora $0024,x
$1e:c321  67 08		 adc [$08]
$1e:c323  ce 14 32	  dec $3214
$1e:c326  25 97		 and $97
$1e:c328  31 1a		 and ($1a),y
$1e:c32a  42 c6		 wdm #$c6
$1e:c32c  30 0c		 bmi $c33a
$1e:c32e  00 92		 brk #$92
$1e:c330  10 38		 bpl $c36a
$1e:c332  25 fc		 and $fc
$1e:c334  3d de 5a	  and $5ade,x
$1e:c337  ff 7f e3 19   sbc $19e37f,x
$1e:c33b  e0 3e 95	  cpx #$953e
$1e:c33e  47 90		 eor [$90]
$1e:c340  00 96		 brk #$96
$1e:c342  01 9c		 ora ($9c,x)
$1e:c344  16 00		 asl $00,x
$1e:c346  00 0e		 brk #$0e
$1e:c348  08			php
$1e:c349  16 14		 asl $14,x
$1e:c34b  8c 31 de	  sty $de31
$1e:c34e  7b			tdc
$1e:c34f  f9 56 54	  sbc $5456,y
$1e:c352  42 af		 wdm #$af
$1e:c354  2d 0a 19	  and $190a
$1e:c357  a0 00 20	  ldy #$2000
$1e:c35a  15 a0		 ora $a0,x
$1e:c35c  1d 00 2e	  ora $2e00,x
$1e:c35f  80 36		 bra $c397
$1e:c361  46 08		 lsr $08
$1e:c363  46 08		 lsr $08
$1e:c365  ab			plb
$1e:c366  0c c6 20	  tsb $20c6
$1e:c369  00 00		 brk #$00
$1e:c36b  00 50		 brk #$50
$1e:c36d  12 00		 ora ($00)
$1e:c36f  36 00		 rol $00,x
$1e:c371  98			tya
$1e:c372  00 1b		 brk #$1b
$1e:c374  01 9e		 ora ($9e,x)
$1e:c376  01 1f		 ora ($1f,x)
$1e:c378  0e ff 26	  asl $26ff
$1e:c37b  63 18		 adc $18,s
$1e:c37d  c6 20		 dec $20
$1e:c37f  4a			lsr a
$1e:c380  29 ce 31	  and #$31ce
$1e:c383  52 46		 eor ($46)
$1e:c385  d6 56		 dec $56,x
$1e:c387  42 08		 wdm #$08
$1e:c389  5e 63 40	  lsr $4063,x
$1e:c38c  28			plp
$1e:c38d  25 00		 and $00
$1e:c38f  48			pha
$1e:c390  00 8a		 brk #$8a
$1e:c392  04 ce		 tsb $ce
$1e:c394  08			php
$1e:c395  31 0d		 and ($0d),y
$1e:c397  74 11		 stz $11,x
$1e:c399  d8			cld
$1e:c39a  15 43		 ora $43,x
$1e:c39c  04 87		 tsb $87
$1e:c39e  0c ea 14	  tsb $14ea
$1e:c3a1  4f 1d d3 29   eor $29d31d
$1e:c3a5  57 36		 eor [$36],y
$1e:c3a7  db			stp
$1e:c3a8  46 7e		 lsr $7e
$1e:c3aa  7b			tdc
$1e:c3ab  e6 65		 inc $65
$1e:c3ad  42 10		 wdm #$10
$1e:c3af  63 18		 adc $18,s
$1e:c3b1  c6 20		 dec $20
$1e:c3b3  4a			lsr a
$1e:c3b4  29 ce 31	  and #$31ce
$1e:c3b7  52 46		 eor ($46)
$1e:c3b9  b5 4e		 lda $4e,x
$1e:c3bb  45 04		 eor $04
$1e:c3bd  88			dey
$1e:c3be  08			php
$1e:c3bf  ee 0c 52	  inc $520c
$1e:c3c2  1d d7 2d	  ora $2dd7,x
$1e:c3c5  5b			tcd
$1e:c3c6  42 00		 wdm #$00
$1e:c3c8  00 5b		 brk #$5b
$1e:c3ca  5f 35 14 02   eor $021435,x
$1e:c3ce  00 25		 brk #$25
$1e:c3d0  00 6b		 brk #$6b
$1e:c3d2  04 b1		 tsb $b1
$1e:c3d4  08			php
$1e:c3d5  17 19		 ora [$19],y
$1e:c3d7  9b			txy
$1e:c3d8  25 1c		 and $1c
$1e:c3da  2e a0 0c	  rol $0ca0
$1e:c3dd  20 0d a0	  jsr $a00d
$1e:c3e0  11 20		 ora ($20),y
$1e:c3e2  16 80		 asl $80,x
$1e:c3e4  1a			inc a
$1e:c3e5  ce 14 32	  dec $3214
$1e:c3e8  25 97		 and $97
$1e:c3ea  31 00		 and ($00),y
$1e:c3ec  60			rts
$1e:c3ed  88			dey
$1e:c3ee  28			plp
$1e:c3ef  2a			rol a
$1e:c3f0  00 12		 brk #$12
$1e:c3f2  00 18		 brk #$18
$1e:c3f4  00 1e		 brk #$1e
$1e:c3f6  00 ca		 brk #$ca
$1e:c3f8  30 0c		 bmi $c406
$1e:c3fa  39 6d 45	  and $456d,y
$1e:c3fd  4f 1d 24 00   eor $00241d
$1e:c401  67 08		 adc [$08]
$1e:c403  ce 14 32	  dec $3214
$1e:c406  25 97		 and $97
$1e:c408  31 1a		 and ($1a),y
$1e:c40a  42 c6		 wdm #$c6
$1e:c40c  30 0c		 bmi $c41a
$1e:c40e  00 92		 brk #$92
$1e:c410  10 38		 bpl $c44a
$1e:c412  25 fc		 and $fc
$1e:c414  3d de 5a	  and $5ade,x
$1e:c417  ff 7f e3 19   sbc $19e37f,x
$1e:c41b  e0 3e 95	  cpx #$953e
$1e:c41e  47 90		 eor [$90]
$1e:c420  00 96		 brk #$96
$1e:c422  01 9c		 ora ($9c,x)
$1e:c424  16 00		 asl $00,x
$1e:c426  00 0e		 brk #$0e
$1e:c428  08			php
$1e:c429  16 14		 asl $14,x
$1e:c42b  8c 31 de	  sty $de31
$1e:c42e  7b			tdc
$1e:c42f  5a			phy
$1e:c430  6b			rtl
$1e:c431  b5 56		 lda $56,x
$1e:c433  31 46		 and ($46),y
$1e:c435  ad 35 29	  lda $2935
$1e:c438  25 c6		 and $c6
$1e:c43a  18			clc
$1e:c43b  63 0c		 adc $0c,s
$1e:c43d  21 18		 and ($18,x)
$1e:c43f  81 28		 sta ($28,x)
$1e:c441  00 39		 brk #$39
$1e:c443  80 59		 bra $c49e
$1e:c445  00 72		 brk #$72
$1e:c447  c0 7a 00	  cpy #$007a
$1e:c44a  00 00		 brk #$00
$1e:c44c  50 1f		 bvc $c46d
$1e:c44e  0c 5f 18	  tsb $185f
$1e:c451  9f 24 df 2c   sta $2cdf24,x
$1e:c455  1f 35 5f 4d   ora $4d5f35,x
$1e:c459  df 61 63 18   cmp $186361,x
$1e:c45d  c6 20		 dec $20
$1e:c45f  4a			lsr a
$1e:c460  29 ce 31	  and #$31ce
$1e:c463  52 46		 eor ($46)
$1e:c465  d6 56		 dec $56,x
$1e:c467  42 08		 wdm #$08
$1e:c469  5e 63 40	  lsr $4063,x
$1e:c46c  28			plp
$1e:c46d  23 00		 and $00,s
$1e:c46f  67 04		 adc [$04]
$1e:c471  ab			plb
$1e:c472  08			php
$1e:c473  10 0d		 bpl $c482
$1e:c475  72 15		 adc ($15)
$1e:c477  f6 1d		 inc $1d,x
$1e:c479  9a			txs
$1e:c47a  2a			rol a
$1e:c47b  43 04		 eor $04,s
$1e:c47d  87 0c		 sta [$0c]
$1e:c47f  ea			nop
$1e:c480  14 4f		 trb $4f
$1e:c482  1d d3 29	  ora $29d3,x
$1e:c485  57 36		 eor [$36],y
$1e:c487  db			stp
$1e:c488  46 7e		 lsr $7e
$1e:c48a  7b			tdc
$1e:c48b  e6 65		 inc $65
$1e:c48d  21 08		 and ($08,x)
$1e:c48f  63 14		 adc $14,s
$1e:c491  c5 24		 cmp $24
$1e:c493  48			pha
$1e:c494  31 ed		 and ($ed),y
$1e:c496  45 71		 eor $71
$1e:c498  56 d4		 lsr $d4,x
$1e:c49a  62 20 00	  per $c4bd
$1e:c49d  82 04 05	  brl $c9a4
$1e:c4a0  0d 69 1d	  ora $1d69
$1e:c4a3  ed 25 92	  sbc $9225
$1e:c4a6  36 00		 rol $00,x
$1e:c4a8  00 58		 brk #$58
$1e:c4aa  5b			tcd
$1e:c4ab  35 14		 and $14,x
$1e:c4ad  02 00		 cop #$00
$1e:c4af  25 00		 and $00
$1e:c4b1  6b			rtl
$1e:c4b2  04 b1		 tsb $b1
$1e:c4b4  08			php
$1e:c4b5  17 19		 ora [$19],y
$1e:c4b7  9b			txy
$1e:c4b8  25 1c		 and $1c
$1e:c4ba  2e 44 20	  rol $2044
$1e:c4bd  aa			tax
$1e:c4be  20 ee 1c	  jsr $1cee
$1e:c4c1  33 1d		 and ($1d,s),y
$1e:c4c3  ba			tsx
$1e:c4c4  19 fc 15	  ora $15fc,y
$1e:c4c7  02 0c		 cop #$0c
$1e:c4c9  9e 2a 00	  stz $002a,x
$1e:c4cc  60			rts
$1e:c4cd  90 0d		 bcc $c4dc
$1e:c4cf  f3 19		 sbc ($19,s),y
$1e:c4d1  57 2a		 eor [$2a],y
$1e:c4d3  da			phx
$1e:c4d4  36 5d		 rol $5d,x
$1e:c4d6  47 be		 eor [$be]
$1e:c4d8  5b			tcd
$1e:c4d9  54 32 24	  mvn $24,$32
$1e:c4dc  00 67		 brk #$67
$1e:c4de  08			php
$1e:c4df  ce 14 32	  dec $3214
$1e:c4e2  25 97		 and $97
$1e:c4e4  31 1a		 and ($1a),y
$1e:c4e6  42 00		 wdm #$00
$1e:c4e8  00 de		 brk #$de
$1e:c4ea  5a			phy
$1e:c4eb  70 10		 bvs $c4fd
$1e:c4ed  0c 00 92	  tsb $9200
$1e:c4f0  10 38		 bpl $c52a
$1e:c4f2  25 fc		 and $fc
$1e:c4f4  3d de 5a	  and $5ade,x
$1e:c4f7  ff 7f e3 19   sbc $19e37f,x
$1e:c4fb  e0 3e 95	  cpx #$953e
$1e:c4fe  47 90		 eor [$90]
$1e:c500  00 96		 brk #$96
$1e:c502  01 9c		 ora ($9c,x)
$1e:c504  16 00		 asl $00,x
$1e:c506  00 0e		 brk #$0e
$1e:c508  08			php
$1e:c509  16 14		 asl $14,x
$1e:c50b  00 50		 brk #$50
$1e:c50d  47 24		 eor [$24]
$1e:c50f  6c 38 ce	  jmp ($ce38)
$1e:c512  40			rti
$1e:c513  30 49		 bmi $c55e
$1e:c515  94 55		 sty $55,x
$1e:c517  f5 59		 sbc $59,x
$1e:c519  58			cli
$1e:c51a  66 e0		 ror $e0
$1e:c51c  1c a0 35	  trb $35a0
$1e:c51f  20 46 a0	  jsr $a046
$1e:c522  56 27		 lsr $27,x
$1e:c524  49 69 59	  eor #$5969
$1e:c527  ab			plb
$1e:c528  61 ed		 adc ($ed,x)
$1e:c52a  71 80		 adc ($80),y
$1e:c52c  03 42		 ora $42,s
$1e:c52e  08			php
$1e:c52f  c6 18		 dec $18
$1e:c531  4a			lsr a
$1e:c532  29 ef 3d	  and #$3def
$1e:c535  94 52		 sty $52,x
$1e:c537  18			clc
$1e:c538  63 9c		 adc $9c,s
$1e:c53a  73 f1		 adc ($f1,s),y
$1e:c53c  00 b9		 brk #$b9
$1e:c53e  0d 7c 16	  ora $167c
$1e:c541  5e 33 f5	  lsr $f533,x
$1e:c544  55 98		 eor $98,x
$1e:c546  62 1c 73	  per $3865
$1e:c549  9e 25 57	  stz $5725,x
$1e:c54c  15 4a		 ora $4a,x
$1e:c54e  00 f1		 brk #$f1
$1e:c550  00 b9		 brk #$b9
$1e:c552  0d 7c 16	  ora $167c
$1e:c555  5e 33 f5	  lsr $f533,x
$1e:c558  55 98		 eor $98,x
$1e:c55a  62 1c 73	  per $3879
$1e:c55d  08			php
$1e:c55e  21 6b		 and ($6b,x)
$1e:c560  2d ce 39	  and $39ce
$1e:c563  31 46		 and ($46),y
$1e:c565  94 52		 sty $52,x
$1e:c567  f7 5e		 sbc [$5e],y
$1e:c569  5a			phy
$1e:c56a  6b			rtl
$1e:c56b  93 34		 sta ($34,s),y
$1e:c56d  05 00		 ora $00
$1e:c56f  0c 00 52	  tsb $5200
$1e:c572  10 f8		 bpl $c56c
$1e:c574  30 fc		 bmi $c572
$1e:c576  55 de		 eor $de,x
$1e:c578  62 61 18	  per $dddc
$1e:c57b  c3 30		 cmp $30,s
$1e:c57d  66 51		 ror $51
$1e:c57f  07 6a		 ora [$6a]
$1e:c581  cd 6a 36	  cmp $366a
$1e:c584  6f f5 55 98   adc $9855f5
$1e:c588  62 5a 6b	  per $30e5
$1e:c58b  9c 10 21	  stz $2110
$1e:c58e  0c 63 10	  tsb $1063
$1e:c591  a5 1c		 lda $1c
$1e:c593  08			php
$1e:c594  2d 6b 39	  and $396b
$1e:c597  ef 45 94 5a   sbc $5a9445
$1e:c59b  f1 00		 sbc ($00),y
$1e:c59d  b9 0d 7c	  lda $7c0d,y
$1e:c5a0  16 5e		 asl $5e,x
$1e:c5a2  33 f5		 and ($f5,s),y
$1e:c5a4  55 98		 eor $98,x
$1e:c5a6  62 1c 73	  per $38c5
$1e:c5a9  7b			tdc
$1e:c5aa  6f 41 1e 42   adc $421e41
$1e:c5ae  08			php
$1e:c5af  c6 18		 dec $18
$1e:c5b1  4a			lsr a
$1e:c5b2  29 ef 3d	  and #$3def
$1e:c5b5  94 52		 sty $52,x
$1e:c5b7  18			clc
$1e:c5b8  63 9c		 adc $9c,s
$1e:c5ba  73 47		 adc ($47,s),y
$1e:c5bc  24 6c		 bit $6c
$1e:c5be  38			sec
$1e:c5bf  ce 40 30	  dec $3040
$1e:c5c2  49 94 55	  eor #$5594
$1e:c5c5  f5 59		 sbc $59,x
$1e:c5c7  58			cli
$1e:c5c8  66 db		 ror $db
$1e:c5ca  72 00		 adc ($00)
$1e:c5cc  50 0c		 bvc $c5da
$1e:c5ce  00 92		 brk #$92
$1e:c5d0  10 38		 bpl $c60a
$1e:c5d2  25 fc		 and $fc
$1e:c5d4  3d de 5a	  and $5ade,x
$1e:c5d7  ff 7f e3 19   sbc $19e37f,x
$1e:c5db  e0 3e 95	  cpx #$953e
$1e:c5de  47 90		 eor [$90]
$1e:c5e0  00 96		 brk #$96
$1e:c5e2  01 9c		 ora ($9c,x)
$1e:c5e4  16 00		 asl $00,x
$1e:c5e6  00 0e		 brk #$0e
$1e:c5e8  08			php
$1e:c5e9  16 14		 asl $14,x
$1e:c5eb  a0 14 80	  ldy #$8014
$1e:c5ee  34 67		 bit $67,x
$1e:c5f0  3d 25 3d	  and $3d25,x
$1e:c5f3  e2 34		 sep #$34
$1e:c5f5  80 20		 bra $c617
$1e:c5f7  21 18		 and ($18,x)
$1e:c5f9  84 40		 sty $40
$1e:c5fb  04 51		 tsb $51
$1e:c5fd  a7 55		 lda [$55]
$1e:c5ff  0c 00 73	  tsb $7300
$1e:c602  0c c0 1d	  tsb $1dc0
$1e:c605  80 22		 bra $c629
$1e:c607  19 02 00	  ora $0002,y
$1e:c60a  00 8c		 brk #$8c
$1e:c60c  7a			ply
$1e:c60d  90 4d		 bcc $c65c
$1e:c60f  4d 41 eb	  eor $eb41
$1e:c612  38			sec
$1e:c613  a8			tay
$1e:c614  28			plp
$1e:c615  65 20		 adc $20
$1e:c617  c8			iny
$1e:c618  18			clc
$1e:c619  4c 29 d0	  jmp $d029
$1e:c61c  39 54 4a	  and $4a54,y
$1e:c61f  a9 04		 lda #$04
$1e:c621  cb			wai
$1e:c622  08			php
$1e:c623  0d 0d 4f	  ora $4f0d
$1e:c626  11 91		 ora ($91),y
$1e:c628  19 65 14	  ora $1465,y
$1e:c62b  62 1c 1a	  per $e04a
$1e:c62e  63 75		 adc $75,s
$1e:c630  4e f1 3d	  lsr $3df1
$1e:c633  4c 29 c8	  jmp $c829
$1e:c636  18			clc
$1e:c637  43 30		 eor $30,s
$1e:c639  84 44		 sty $44
$1e:c63b  04 51		 tsb $51
$1e:c63d  47 61		 eor [$61]
$1e:c63f  02 14		 cop #$14
$1e:c641  23 20		 and $20,s
$1e:c643  65 30		 adc $30
$1e:c645  aa			tax
$1e:c646  69 4e		 adc #$4e
$1e:c648  72 40		 adc ($40)
$1e:c64a  10 ff		 bpl $c64b
$1e:c64c  2f 1a 63 75   and $75631a
$1e:c650  4e f1 3d	  lsr $3df1
$1e:c653  4c 29 c8	  jmp $c829
$1e:c656  18			clc
$1e:c657  04 51		 tsb $51
$1e:c659  44 35 c6	  mvp $c6,$35
$1e:c65c  41 2a		 eor ($2a,x)
$1e:c65e  52 82		 eor ($82)
$1e:c660  04 c4		 tsb $c4
$1e:c662  14 66		 trb $66
$1e:c664  25 0a		 and $0a
$1e:c666  36 8e		 rol $8e,x
$1e:c668  46 40		 lsr $40
$1e:c66a  0c d5 4d	  tsb $4dd5
$1e:c66d  b7 3d		 lda [$3d],y
$1e:c66f  6a			ror a
$1e:c670  14 ad		 trb $ad
$1e:c672  1c f1 28	  trb $28f1
$1e:c675  54 35 c8	  mvn $c8,$35
$1e:c678  18			clc
$1e:c679  4c 29 d0	  jmp $d029
$1e:c67c  39 54 4a	  and $4a54,y
$1e:c67f  0c 00 73	  tsb $7300
$1e:c682  0c 32 01	  tsb $0132
$1e:c685  d8			cld
$1e:c686  52 00		 eor ($00)
$1e:c688  00 86		 brk #$86
$1e:c68a  08			php
$1e:c68b  dd 01 1a	  cmp $1a01,x
$1e:c68e  63 75		 adc $75,s
$1e:c690  4e f1 3d	  lsr $3df1
$1e:c693  4c 29 c8	  jmp $c829
$1e:c696  18			clc
$1e:c697  a2 1c		 ldx #$1c
$1e:c699  04 25		 tsb $25
$1e:c69b  86 35		 stx $35
$1e:c69d  0a			asl a
$1e:c69e  46 0c		 lsr $0c
$1e:c6a0  00 92		 brk #$92
$1e:c6a2  10 38		 bpl $c6dc
$1e:c6a4  25 fc		 and $fc
$1e:c6a6  3d de 5a	  and $5ade,x
$1e:c6a9  45 0c		 eor $0c
$1e:c6ab  00 50		 brk #$50
$1e:c6ad  0c 00 92	  tsb $9200
$1e:c6b0  10 38		 bpl $c6ea
$1e:c6b2  25 fc		 and $fc
$1e:c6b4  3d de 5a	  and $5ade,x
$1e:c6b7  ff 7f e3 19   sbc $19e37f,x
$1e:c6bb  e0 3e		 cpx #$3e
$1e:c6bd  95 47		 sta $47,x
$1e:c6bf  90 00		 bcc $c6c1
$1e:c6c1  96 01		 stx $01,y
$1e:c6c3  9c 16 00	  stz $0016
$1e:c6c6  00 0e		 brk #$0e
$1e:c6c8  08			php
$1e:c6c9  16 14		 asl $14,x
$1e:c6cb  60			rts
$1e:c6cc  22 62 28 c3   jsl $c32862
$1e:c6d0  3c 46 4d	  bit $4d46,x
$1e:c6d3  e9 5d		 sbc #$5d
$1e:c6d5  ad 72 e9	  lda $e972
$1e:c6d8  5d 46 4d	  eor $4d46,x
$1e:c6db  c3 3c		 cmp $3c,s
$1e:c6dd  43 00		 eor $00,s
$1e:c6df  87 08		 sta [$08]
$1e:c6e1  eb			xba
$1e:c6e2  10 4e		 bpl $c732
$1e:c6e4  1d c6 18	  ora $18c6,x
$1e:c6e7  63 0c		 adc $0c,s
$1e:c6e9  20 04 00	  jsr $0004
$1e:c6ec  2c d8 49	  bit $49d8
$1e:c6ef  5c 5a 63 0c   jml $0c635a
$1e:c6f3  a5 14		 lda $14
$1e:c6f5  e7 1c		 sbc [$1c]
$1e:c6f7  25 11		 and $11
$1e:c6f9  88			dey
$1e:c6fa  1d de 6a	  ora $6ade,x
$1e:c6fd  a3 08		 lda $08,s
$1e:c6ff  27 0d		 and [$0d]
$1e:c701  aa			tax
$1e:c702  11 2c		 ora ($2c),y
$1e:c704  1a			inc a
$1e:c705  8e 22 d2	  stx $d222
$1e:c708  2a			rol a
$1e:c709  58			cli
$1e:c70a  39 be 01	  and $01be,y
$1e:c70d  20 04 63	  jsr $6304
$1e:c710  0c a5 14	  tsb $14a5
$1e:c713  e7 1c		 sbc [$1c]
$1e:c715  29 25		 and #$25
$1e:c717  6b			rtl
$1e:c718  2d ce 39	  and $39ce
$1e:c71b  87 08		 sta [$08]
$1e:c71d  43 00		 eor $00,s
$1e:c71f  87 08		 sta [$08]
$1e:c721  eb			xba
$1e:c722  10 4e		 bpl $c772
$1e:c724  1d b2 29	  ora $29b2,x
$1e:c727  14 3a		 trb $3a
$1e:c729  98			tya
$1e:c72a  4a			lsr a
$1e:c72b  f0 40		 beq $c76d
$1e:c72d  20 04 63	  jsr $6304
$1e:c730  0c a5 14	  tsb $14a5
$1e:c733  e7 1c		 sbc [$1c]
$1e:c735  29 25		 and #$25
$1e:c737  6b			rtl
$1e:c738  2d ce 39	  and $39ce
$1e:c73b  a1 04		 lda ($04,x)
$1e:c73d  60			rts
$1e:c73e  00 a1		 brk #$a1
$1e:c740  04 05		 tsb $05
$1e:c742  11 68		 ora ($68),y
$1e:c744  1d cc 29	  ora $29cc,x
$1e:c747  2f 36 b4 46   and $46b436
$1e:c74b  4c 61 21	  jmp $2161
$1e:c74e  00 63		 brk #$63
$1e:c750  18			clc
$1e:c751  c6 24		 dec $24
$1e:c753  29 31		 and #$31
$1e:c755  8c 41 10	  sty $1041
$1e:c758  4e 73 5a	  lsr $5a73
$1e:c75b  f7 6a		 sbc [$6a],y
$1e:c75d  15 0a		 ora $0a,x
$1e:c75f  fb			xce
$1e:c760  1a			inc a
$1e:c761  44 18 86	  mvp $86,$18
$1e:c764  20 c8 28	  jsr $28c8
$1e:c767  2c 39 90	  bit $9039
$1e:c76a  49 00		 eor #$00
$1e:c76c  00 00		 brk #$00
$1e:c76e  00 20		 brk #$20
$1e:c770  04 41		 tsb $41
$1e:c772  08			php
$1e:c773  62 10 83	  per $4a86
$1e:c776  14 44		 trb $44
$1e:c778  04 6a		 tsb $6a
$1e:c77a  14 b0		 trb $b0
$1e:c77c  1c 14 29	  trb $2914
$1e:c77f  98			tya
$1e:c780  39 a1 04	  and $04a1,y
$1e:c783  05 11		 ora $11
$1e:c785  88			dey
$1e:c786  1d ec 29	  ora $29ec,x
$1e:c789  50 3a		 bvc $c7c5
$1e:c78b  00 50		 brk #$50
$1e:c78d  0c 00 92	  tsb $9200
$1e:c790  10 38		 bpl $c7ca
$1e:c792  25 fc		 and $fc
$1e:c794  3d de 5a	  and $5ade,x
$1e:c797  ff 7f e3 19   sbc $19e37f,x
$1e:c79b  e0 3e		 cpx #$3e
$1e:c79d  95 47		 sta $47,x
$1e:c79f  90 00		 bcc $c7a1
$1e:c7a1  96 01		 stx $01,y
$1e:c7a3  9c 16 00	  stz $0016
$1e:c7a6  00 0e		 brk #$0e
$1e:c7a8  08			php
$1e:c7a9  16 14		 asl $14,x
$1e:c7ab  ce 39 82	  dec $8239
$1e:c7ae  28			plp
$1e:c7af  e2 34		 sep #$34
$1e:c7b1  44 3d a6	  mvp $a6,$3d
$1e:c7b4  49 08		 eor #$08
$1e:c7b6  52 6a		 eor ($6a)
$1e:c7b8  5a			phy
$1e:c7b9  10 6b		 bpl $c826
$1e:c7bb  80 53		 bra $c810
$1e:c7bd  00 4b		 brk #$4b
$1e:c7bf  80 42		 bra $c803
$1e:c7c1  00 32		 brk #$32
$1e:c7c3  80 29		 bra $c7ee
$1e:c7c5  2e 6f 2e	  rol $2e6f
$1e:c7c8  6f 90 7b 00   adc $007b90
$1e:c7cc  50 00		 bvc $c7ce
$1e:c7ce  00 ff		 brk #$ff
$1e:c7d0  7f ff 7f ff   adc $ff7fff,x
$1e:c7d4  7f ff 7f ff   adc $ff7fff,x
$1e:c7d8  7f ff 7f ff   adc $ff7fff,x
$1e:c7dc  7f ff 7f ff   adc $ff7fff,x
$1e:c7e0  7f c2 28 46   adc $4628c2,x
$1e:c7e4  41 08		 eor ($08,x)
$1e:c7e6  52 cd		 eor ($cd)
$1e:c7e8  62 96 7b	  per $4381
$1e:c7eb  40			rti
$1e:c7ec  29 65		 and #$65
$1e:c7ee  04 c7		 tsb $c7
$1e:c7f0  08			php
$1e:c7f1  2b			pld
$1e:c7f2  0d 8e 11	  ora $118e
$1e:c7f5  f1 1d		 sbc ($1d),y
$1e:c7f7  54 2a c1	  mvn $c1,$2a
$1e:c7fa  00 22		 brk #$22
$1e:c7fc  05 c3		 ora $c3
$1e:c7fe  09 44		 ora #$44
$1e:c800  0e c6 12	  asl $12c6
$1e:c803  aa			tax
$1e:c804  00 10		 brk #$10
$1e:c806  01 96		 ora ($96,x)
$1e:c808  09 1a		 ora #$1a
$1e:c80a  12 4a		 ora ($4a)
$1e:c80c  01 44		 ora ($44,x)
$1e:c80e  04 89		 tsb $89
$1e:c810  08			php
$1e:c811  cd 0c 51	  cmp $510c
$1e:c814  15 d5		 ora $d5,x
$1e:c816  21 59		 and ($59,x)
$1e:c818  2a			rol a
$1e:c819  ca			dex
$1e:c81a  18			clc
$1e:c81b  51 29		 eor ($29),y
$1e:c81d  d4 39		 pei ($39)
$1e:c81f  59 4a fe	  eor $fe4a,y
$1e:c822  5e 65 04	  lsr $0465,x
$1e:c825  c7 08		 cmp [$08]
$1e:c827  2b			pld
$1e:c828  0d 8e 11	  ora $118e
$1e:c82b  00 50		 brk #$50
$1e:c82d  41 04		 eor ($04,x)
$1e:c82f  83 08		 sta $08,s
$1e:c831  e6 14		 inc $14
$1e:c833  6a			ror a
$1e:c834  25 ef		 and $ef
$1e:c836  39 52 4a	  and $4a52,y
$1e:c839  d6 5a		 dec $5a,x
$1e:c83b  00 00		 brk #$00
$1e:c83d  84 10		 sty $10
$1e:c83f  08			php
$1e:c840  21 8c		 and ($8c,x)
$1e:c842  31 10		 and ($10),y
$1e:c844  42 94		 wdm #$94
$1e:c846  52 18		 eor ($18)
$1e:c848  63 9c		 adc $9c,s
$1e:c84a  73 0c		 adc ($0c,s),y
$1e:c84c  18			clc
$1e:c84d  42 30		 wdm #$30
$1e:c84f  e4 35		 cpx $35
$1e:c851  66 46		 ror $46
$1e:c853  c9 4e		 cmp #$4e
$1e:c855  6d 5b e9	  adc $e95b
$1e:c858  5d 46 4d	  eor $4d46,x
$1e:c85b  c3 3c		 cmp $3c,s
$1e:c85d  94 52		 sty $52,x
$1e:c85f  18			clc
$1e:c860  63 9c		 adc $9c,s
$1e:c862  73 18		 adc ($18,s),y
$1e:c864  63 85		 adc $85,s
$1e:c866  04 c7		 tsb $c7
$1e:c868  08			php
$1e:c869  2b			pld
$1e:c86a  0d 00 50	  ora $5000
$1e:c86d  0c 00 92	  tsb $9200
$1e:c870  10 38		 bpl $c8aa
$1e:c872  25 fc		 and $fc
$1e:c874  3d de 5a	  and $5ade,x
$1e:c877  ff 7f e3 19   sbc $19e37f,x
$1e:c87b  e0 3e		 cpx #$3e
$1e:c87d  95 47		 sta $47,x
$1e:c87f  90 00		 bcc $c881
$1e:c881  96 01		 stx $01,y
$1e:c883  9c 16 00	  stz $0016
$1e:c886  00 0e		 brk #$0e
$1e:c888  08			php
$1e:c889  16 14		 asl $14,x
$1e:c88b  ce 39 e3	  dec $e339
$1e:c88e  2c 26 35	  bit $3526
$1e:c891  87 3d		 sta [$3d]
$1e:c893  05 31		 ora $31
$1e:c895  a3 28		 lda $28,s
$1e:c897  80 20		 bra $c8b9
$1e:c899  60			rts
$1e:c89a  1c a0 24	  trb $24a0
$1e:c89d  00 00		 brk #$00
$1e:c89f  66 00		 ror $00
$1e:c8a1  cb			wai
$1e:c8a2  08			php
$1e:c8a3  2f 0d 62 18   and $18620d
$1e:c8a7  e5 2c		 sbc $2c
$1e:c8a9  aa			tax
$1e:c8aa  3d 00 50	  and $5000,x
$1e:c8ad  00 00		 brk #$00
$1e:c8af  14 01		 trb $01
$1e:c8b1  96 01		 stx $01,y
$1e:c8b3  58			cli
$1e:c8b4  02 dc		 cop #$dc
$1e:c8b6  02 aa		 cop #$aa
$1e:c8b8  00 10		 brk #$10
$1e:c8ba  01 96		 ora ($96,x)
$1e:c8bc  09 1a		 ora #$1a
$1e:c8be  12 ff		 ora ($ff)
$1e:c8c0  7f c2 28 46   adc $4628c2,x
$1e:c8c4  41 08		 eor ($08,x)
$1e:c8c6  52 cd		 eor ($cd)
$1e:c8c8  62 96 7b	  per $4461
$1e:c8cb  40			rti
$1e:c8cc  29 a7		 and #$a7
$1e:c8ce  08			php
$1e:c8cf  0a			asl a
$1e:c8d0  11 6c		 ora ($6c),y
$1e:c8d2  21 d0		 and ($d0,x)
$1e:c8d4  29 34		 and #$34
$1e:c8d6  32 97		 and ($97)
$1e:c8d8  3a			dec a
$1e:c8d9  c1 00		 cmp ($00,x)
$1e:c8db  22 05 c3 09   jsl $09c305
$1e:c8df  44 0e c6	  mvp $c6,$0e
$1e:c8e2  12 aa		 ora ($aa)
$1e:c8e4  00 10		 brk #$10
$1e:c8e6  01 96		 ora ($96,x)
$1e:c8e8  09 1a		 ora #$1a
$1e:c8ea  12 80		 ora ($80)
$1e:c8ec  2a			rol a
$1e:c8ed  a7 08		 lda [$08]
$1e:c8ef  0a			asl a
$1e:c8f0  11 6c		 ora ($6c),y
$1e:c8f2  21 d0		 and ($d0,x)
$1e:c8f4  29 34		 and #$34
$1e:c8f6  32 97		 and ($97)
$1e:c8f8  3a			dec a
$1e:c8f9  a2 14		 ldx #$14
$1e:c8fb  25 25		 and $25
$1e:c8fd  c9 39		 cmp #$39
$1e:c8ff  4b			phk
$1e:c900  4a			lsr a
$1e:c901  ed 5e 27	  sbc $275e
$1e:c904  19 ca 25	  ora $25ca,y
$1e:c907  4c 2e f0	  jmp $f02e
$1e:c90a  42 00		 wdm #$00
$1e:c90c  50 41		 bvc $c94f
$1e:c90e  04 83		 tsb $83
$1e:c910  08			php
$1e:c911  e6 14		 inc $14
$1e:c913  6a			ror a
$1e:c914  25 ef		 and $ef
$1e:c916  39 52 4a	  and $4a52,y
$1e:c919  d6 5a		 dec $5a,x
$1e:c91b  63 14		 adc $14,s
$1e:c91d  c6 20		 dec $20
$1e:c91f  29 31		 and #$31
$1e:c921  8c 3d 10	  sty $103d
$1e:c924  42 a7		 wdm #$a7
$1e:c926  08			php
$1e:c927  0a			asl a
$1e:c928  11 6c		 ora ($6c),y
$1e:c92a  21 0a		 and ($0a,x)
$1e:c92c  28			plp
$1e:c92d  c2 24		 rep #$24
$1e:c92f  23 35		 and $35,s
$1e:c931  a6 45		 ldx $45
$1e:c933  09 4e 8d	  ora #$8d4e
$1e:c936  5a			phy
$1e:c937  e9 5d 46	  sbc #$465d
$1e:c93a  4d c3 3c	  eor $3cc3
$1e:c93d  73 4e		 adc ($4e,s),y
$1e:c93f  f7 5e		 sbc [$5e],y
$1e:c941  5a			phy
$1e:c942  6b			rtl
$1e:c943  18			clc
$1e:c944  63 a7		 adc $a7,s
$1e:c946  08			php
$1e:c947  0a			asl a
$1e:c948  11 6c		 ora ($6c),y
$1e:c94a  21 00		 and ($00,x)
$1e:c94c  50 0c		 bvc $c95a
$1e:c94e  00 92		 brk #$92
$1e:c950  10 38		 bpl $c98a
$1e:c952  25 fc		 and $fc
$1e:c954  3d de 5a	  and $5ade,x
$1e:c957  ff 7f e3 19   sbc $19e37f,x
$1e:c95b  e0 3e		 cpx #$3e
$1e:c95d  95 47		 sta $47,x
$1e:c95f  90 00		 bcc $c961
$1e:c961  96 01		 stx $01,y
$1e:c963  9c 16 00	  stz $0016
$1e:c966  00 0e		 brk #$0e
$1e:c968  08			php
$1e:c969  16 14		 asl $14,x
$1e:c96b  ce 39 48	  dec $4839
$1e:c96e  04 8c		 tsb $8c
$1e:c970  08			php
$1e:c971  d0 0c		 bne $c97f
$1e:c973  32 11		 and ($11)
$1e:c975  96 15		 stx $15,y
$1e:c977  fa			plx
$1e:c978  19 60 1c	  ora $1c60,y
$1e:c97b  a0 24		 ldy #$24
$1e:c97d  00 00		 brk #$00
$1e:c97f  66 00		 ror $00
$1e:c981  cb			wai
$1e:c982  08			php
$1e:c983  2f 0d 62 18   and $18620d
$1e:c987  e5 2c		 sbc $2c
$1e:c989  aa			tax
$1e:c98a  3d 00 50	  and $5000,x
$1e:c98d  44 0c a4	  mvp $a4,$0c
$1e:c990  18			clc
$1e:c991  06 25		 asl $25
$1e:c993  68			pla
$1e:c994  31 cb		 and ($cb),y
$1e:c996  3d 2e 4a	  and $4a2e,x
$1e:c999  28			plp
$1e:c99a  04 6a		 tsb $6a
$1e:c99c  0c ab 10	  tsb $10ab
$1e:c99f  0d 1d c2	  ora $c21d
$1e:c9a2  28			plp
$1e:c9a3  46 41		 lsr $41
$1e:c9a5  08			php
$1e:c9a6  52 cd		 eor ($cd)
$1e:c9a8  62 96 7b	  per $4541
$1e:c9ab  40			rti
$1e:c9ac  29 28 04	  and #$0428
$1e:c9af  6a			ror a
$1e:c9b0  0c ab 10	  tsb $10ab
$1e:c9b3  0d 1d 6f	  ora $6f1d
$1e:c9b6  25 d1		 and $d1
$1e:c9b8  31 c1		 and ($c1),y
$1e:c9ba  00 22		 brk #$22
$1e:c9bc  05 c3		 ora $c3
$1e:c9be  09 44 0e	  ora #$0e44
$1e:c9c1  c6 12		 dec $12
$1e:c9c3  aa			tax
$1e:c9c4  00 10		 brk #$10
$1e:c9c6  01 96		 ora ($96,x)
$1e:c9c8  09 1a 12	  ora #$121a
$1e:c9cb  4a			lsr a
$1e:c9cc  01 44		 ora ($44,x)
$1e:c9ce  04 86		 tsb $86
$1e:c9d0  0c cb 14	  tsb $14cb
$1e:c9d3  71 25		 adc ($25),y
$1e:c9d5  d4 35		 pei ($35)
$1e:c9d7  76 4a		 ror $4a,x
$1e:c9d9  85 0c		 sta $0c
$1e:c9db  e8			inx
$1e:c9dc  18			clc
$1e:c9dd  4a			lsr a
$1e:c9de  29 8b 35	  and #$358b
$1e:c9e1  0e 4a d4	  asl $d44a
$1e:c9e4  00 58		 brk #$58
$1e:c9e6  01 da		 ora ($da,x)
$1e:c9e8  09 5c 12	  ora #$125c
$1e:c9eb  00 50		 brk #$50
$1e:c9ed  28			plp
$1e:c9ee  04 6a		 tsb $6a
$1e:c9f0  0c ab 10	  tsb $10ab
$1e:c9f3  0d 1d 6f	  ora $6f1d
$1e:c9f6  25 d1		 and $d1
$1e:c9f8  31 34		 and ($34),y
$1e:c9fa  3e 21 0c	  rol $0c21,x
$1e:c9fd  42 14		 wdm #$14
$1e:c9ff  84 1c		 sty $1c
$1e:ca01  e6 28		 inc $28
$1e:ca03  69 35 cc	  adc #$cc35
$1e:ca06  41 4f		 eor ($4f,x)
$1e:ca08  4e d3 62	  lsr $62d3
$1e:ca0b  0a			asl a
$1e:ca0c  28			plp
$1e:ca0d  82 25 e3	  brl $ad35
$1e:ca10  35 66		 and $66,x
$1e:ca12  46 a9		 lsr $a9
$1e:ca14  4e 2d 5b	  lsr $5b2d
$1e:ca17  e9 5d 46	  sbc #$465d
$1e:ca1a  4d c3 3c	  eor $3cc3
$1e:ca1d  73 4e		 adc ($4e,s),y
$1e:ca1f  f7 5e		 sbc [$5e],y
$1e:ca21  5a			phy
$1e:ca22  6b			rtl
$1e:ca23  18			clc
$1e:ca24  63 44		 adc $44,s
$1e:ca26  0c a4 18	  tsb $18a4
$1e:ca29  06 25		 asl $25
$1e:ca2b  00 50		 brk #$50
$1e:ca2d  0c 00 92	  tsb $9200
$1e:ca30  10 38		 bpl $ca6a
$1e:ca32  25 fc		 and $fc
$1e:ca34  3d de 5a	  and $5ade,x
$1e:ca37  ff 7f e3 19   sbc $19e37f,x
$1e:ca3b  e0 3e		 cpx #$3e
$1e:ca3d  95 47		 sta $47,x
$1e:ca3f  90 00		 bcc $ca41
$1e:ca41  96 01		 stx $01,y
$1e:ca43  9c 16 00	  stz $0016
$1e:ca46  00 0e		 brk #$0e
$1e:ca48  08			php
$1e:ca49  16 14		 asl $14,x
$1e:ca4b  08			php
$1e:ca4c  21 82		 and ($82,x)
$1e:ca4e  28			plp
$1e:ca4f  e2 34		 sep #$34
$1e:ca51  44 3d a6	  mvp $a6,$3d
$1e:ca54  49 08		 eor #$08
$1e:ca56  52 6a		 eor ($6a)
$1e:ca58  5a			phy
$1e:ca59  10 6b		 bpl $cac6
$1e:ca5b  80 53		 bra $cab0
$1e:ca5d  00 4b		 brk #$4b
$1e:ca5f  80 42		 bra $caa3
$1e:ca61  00 32		 brk #$32
$1e:ca63  80 29		 bra $ca8e
$1e:ca65  4e 76 2e	  lsr $2e76
$1e:ca68  47 9b		 eor [$9b]
$1e:ca6a  42 00		 wdm #$00
$1e:ca6c  50 4a		 bvc $cab8
$1e:ca6e  00 90		 brk #$90
$1e:ca70  00 14		 brk #$14
$1e:ca72  01 96		 ora ($96,x)
$1e:ca74  01 58		 ora ($58,x)
$1e:ca76  02 dc		 cop #$dc
$1e:ca78  02 5c		 cop #$5c
$1e:ca7a  43 88		 eor $88,s
$1e:ca7c  08			php
$1e:ca7d  cc 0c 2f	  cpy $2f0c
$1e:ca80  11 c2		 ora ($c2),y
$1e:ca82  28			plp
$1e:ca83  46 41		 lsr $41
$1e:ca85  08			php
$1e:ca86  52 cd		 eor ($cd)
$1e:ca88  62 96 7b	  per $4621
$1e:ca8b  40			rti
$1e:ca8c  29 45		 and #$45
$1e:ca8e  04 88		 tsb $88
$1e:ca90  08			php
$1e:ca91  cc 0c 2f	  cpy $2f0c
$1e:ca94  11 91		 ora ($91),y
$1e:ca96  15 f5		 ora $f5,x
$1e:ca98  19 81 00	  ora $0081,y
$1e:ca9b  e2 04		 sep #$04
$1e:ca9d  43 09		 eor $09,s
$1e:ca9f  c4 0d		 cpy $0d
$1e:caa1  46 12		 lsr $12
$1e:caa3  a8			tay
$1e:caa4  10 0b		 bpl $cab1
$1e:caa6  19 6d 25	  ora $256d,y
$1e:caa9  f1 39		 sbc ($39),y
$1e:caab  4a			lsr a
$1e:caac  01 45		 ora ($45,x)
$1e:caae  04 88		 tsb $88
$1e:cab0  08			php
$1e:cab1  cc 0c 2f	  cpy $2f0c
$1e:cab4  11 91		 ora ($91),y
$1e:cab6  15 f5		 ora $f5,x
$1e:cab8  19 82 04	  ora $0482,y
$1e:cabb  c5 10		 cmp $10
$1e:cabd  48			pha
$1e:cabe  19 cb 25	  ora $25cb,y
$1e:cac1  70 3e		 bvs $cb01
$1e:cac3  45 04		 eor $04
$1e:cac5  88			dey
$1e:cac6  08			php
$1e:cac7  cc 0c 2f	  cpy $2f0c
$1e:caca  11 00		 ora ($00),y
$1e:cacc  50 23		 bvc $caf1
$1e:cace  04 66		 tsb $66
$1e:cad0  0c a8 10	  tsb $10a8
$1e:cad3  0b			phd
$1e:cad4  19 6d 25	  ora $256d,y
$1e:cad7  f1 39		 sbc ($39),y
$1e:cad9  54 42 41	  mvn $41,$42
$1e:cadc  04 83		 tsb $83
$1e:cade  08			php
$1e:cadf  c5 10		 cmp $10
$1e:cae1  28			plp
$1e:cae2  19 8b 25	  ora $258b,y
$1e:cae5  ee 35 72	  inc $7235
$1e:cae8  42 f5		 wdm #$f5
$1e:caea  52 0a		 eor ($0a)
$1e:caec  28			plp
$1e:caed  82 25 e3	  brl $ae15
$1e:caf0  35 66		 and $66,x
$1e:caf2  46 a9		 lsr $a9
$1e:caf4  4e 2d 5b	  lsr $5b2d
$1e:caf7  e9 5d		 sbc #$5d
$1e:caf9  46 4d		 lsr $4d
$1e:cafb  c3 3c		 cmp $3c,s
$1e:cafd  73 4e		 adc ($4e,s),y
$1e:caff  f7 5e		 sbc [$5e],y
$1e:cb01  5a			phy
$1e:cb02  6b			rtl
$1e:cb03  18			clc
$1e:cb04  63 45		 adc $45,s
$1e:cb06  04 88		 tsb $88
$1e:cb08  08			php
$1e:cb09  cc 0c 00	  cpy $000c
$1e:cb0c  28			plp
$1e:cb0d  0c 00 92	  tsb $9200
$1e:cb10  10 38		 bpl $cb4a
$1e:cb12  25 fc		 and $fc
$1e:cb14  3d de 5a	  and $5ade,x
$1e:cb17  ff 7f e3 19   sbc $19e37f,x
$1e:cb1b  e0 3e		 cpx #$3e
$1e:cb1d  95 47		 sta $47,x
$1e:cb1f  90 00		 bcc $cb21
$1e:cb21  96 01		 stx $01,y
$1e:cb23  9c 16 00	  stz $0016
$1e:cb26  00 0e		 brk #$0e
$1e:cb28  08			php
$1e:cb29  16 14		 asl $14,x
$1e:cb2b  13 00		 ora ($00,s),y
$1e:cb2d  62 28 c3	  per $8e58
$1e:cb30  3c 46 4d	  bit $4d46,x
$1e:cb33  e9 5d		 sbc #$5d
$1e:cb35  ad 72 e9	  lda $e972
$1e:cb38  5d 46 4d	  eor $4d46,x
$1e:cb3b  c3 3c		 cmp $3c,s
$1e:cb3d  ef 4d 73 5e   sbc $5e734d
$1e:cb41  f7 6a		 sbc [$6a],y
$1e:cb43  73 5e		 adc ($5e,s),y
$1e:cb45  66 08		 ror $08
$1e:cb47  c8			iny
$1e:cb48  0c 2b 15	  tsb $152b
$1e:cb4b  10 40		 bpl $cb8d
$1e:cb4d  00 00		 brk #$00
$1e:cb4f  21 08		 and ($08,x)
$1e:cb51  65 0c		 adc $0c
$1e:cb53  88			dey
$1e:cb54  0c a8 14	  tsb $14a8
$1e:cb57  4e 29 14	  lsr $1429
$1e:cb5a  42 1c		 wdm #$1c
$1e:cb5c  63 23		 adc $23,s
$1e:cb5e  00 68		 brk #$68
$1e:cb60  04 f0		 tsb $f0
$1e:cb62  04 76		 tsb $76
$1e:cb64  0d d8 0d	  ora $0dd8
$1e:cb67  9c 26 eb	  stz $eb26
$1e:cb6a  1c e0 02	  trb $02e0
$1e:cb6d  00 00		 brk #$00
$1e:cb6f  21 08		 and ($08,x)
$1e:cb71  65 0c		 adc $0c
$1e:cb73  a9 10		 lda #$10
$1e:cb75  ed 14 72	  sbc $7214
$1e:cb78  1d f6 25	  ora $25f6,x
$1e:cb7b  9c 32 62	  stz $6232
$1e:cb7e  18			clc
$1e:cb7f  c4 28		 cpy $28
$1e:cb81  48			pha
$1e:cb82  39 cc 49	  and $49cc,y
$1e:cb85  50 5a		 bvc $cbe1
$1e:cb87  d4 6a		 pei ($6a)
$1e:cb89  58			cli
$1e:cb8a  73 00		 adc ($00,s),y
$1e:cb8c  7c 00 00	  jmp ($0000,x)
$1e:cb8f  21 08		 and ($08,x)
$1e:cb91  65 0c		 adc $0c
$1e:cb93  a9 0c		 lda #$0c
$1e:cb95  ed 10 72	  sbc $7210
$1e:cb98  15 f6		 ora $f6,x
$1e:cb9a  1d 9c 26	  ora $269c,x
$1e:cb9d  62 18 c4	  per $8fb8
$1e:cba0  28			plp
$1e:cba1  48			pha
$1e:cba2  39 cc 49	  and $49cc,y
$1e:cba5  50 5a		 bvc $cc01
$1e:cba7  d4 6a		 pei ($6a)
$1e:cba9  58			cli
$1e:cbaa  73 79		 adc ($79,s),y
$1e:cbac  02 00		 cop #$00
$1e:cbae  00 00		 brk #$00
$1e:cbb0  04 21		 tsb $21
$1e:cbb2  08			php
$1e:cbb3  65 0c		 adc $0c
$1e:cbb5  a9 0c		 lda #$0c
$1e:cbb7  ed 10 72	  sbc $7210
$1e:cbba  15 f6		 ora $f6,x
$1e:cbbc  1d 21 08	  ora $0821,x
$1e:cbbf  62 10 c4	  per $8fd2
$1e:cbc2  20 48 31	  jsr $3148
$1e:cbc5  cc 41 50	  cpy $5041
$1e:cbc8  52 d4		 eor ($d4)
$1e:cbca  62 00 00	  per $cbcd
$1e:cbcd  00 00		 brk #$00
$1e:cbcf  21 08		 and ($08,x)
$1e:cbd1  65 0c		 adc $0c
$1e:cbd3  a9 0c		 lda #$0c
$1e:cbd5  ed 10 72	  sbc $7210
$1e:cbd8  15 f6		 ora $f6,x
$1e:cbda  1d 9c 26	  ora $269c,x
$1e:cbdd  23 00		 and $00,s
$1e:cbdf  68			pla
$1e:cbe0  04 f0		 tsb $f0
$1e:cbe2  04 76		 tsb $76
$1e:cbe4  0d d8 0d	  ora $0dd8
$1e:cbe7  9c 26 3f	  stz $3f26
$1e:cbea  37 70		 and [$70],y
$1e:cbec  10 0d		 bpl $cbfb
$1e:cbee  00 92		 brk #$92
$1e:cbf0  10 38		 bpl $cc2a
$1e:cbf2  25 fc		 and $fc
$1e:cbf4  3d de 5a	  and $5ade,x
$1e:cbf7  ff 7f e3 19   sbc $19e37f,x
$1e:cbfb  e0 3e		 cpx #$3e
$1e:cbfd  95 47		 sta $47,x
$1e:cbff  90 00		 bcc $cc01
$1e:cc01  96 01		 stx $01,y
$1e:cc03  9c 16 00	  stz $0016
$1e:cc06  00 0e		 brk #$0e
$1e:cc08  08			php
$1e:cc09  16 14		 asl $14,x
$1e:cc0b  00 50		 brk #$50
$1e:cc0d  4e 08 8c	  lsr $8c08
$1e:cc10  10 ce		 bpl $cbe0
$1e:cc12  18			clc
$1e:cc13  30 25		 bmi $cc3a
$1e:cc15  92 31		 sta ($31)
$1e:cc17  f4 3d 56	  pea $563d
$1e:cc1a  4a			lsr a
$1e:cc1b  0b			phd
$1e:cc1c  31 8f		 and ($8f),y
$1e:cc1e  45 f1		 eor $f1
$1e:cc20  51 75		 eor ($75),y
$1e:cc22  5a			phy
$1e:cc23  27 49		 and [$49]
$1e:cc25  69 59		 adc #$59
$1e:cc27  ab			plb
$1e:cc28  61 ed		 adc ($ed,x)
$1e:cc2a  71 80		 adc ($80),y
$1e:cc2c  03 42		 ora $42,s
$1e:cc2e  08			php
$1e:cc2f  c6 18		 dec $18
$1e:cc31  4a			lsr a
$1e:cc32  29 ef		 and #$ef
$1e:cc34  3d 94 52	  and $5294,x
$1e:cc37  18			clc
$1e:cc38  63 9c		 adc $9c,s
$1e:cc3a  73 f1		 adc ($f1,s),y
$1e:cc3c  00 b9		 brk #$b9
$1e:cc3e  0d 7c 16	  ora $167c
$1e:cc41  5e 33 14	  lsr $1433,x
$1e:cc44  42 98		 wdm #$98
$1e:cc46  52 1c		 eor ($1c)
$1e:cc48  63 9e		 adc $9e,s
$1e:cc4a  25 57		 and $57
$1e:cc4c  15 4a		 ora $4a,x
$1e:cc4e  00 f1		 brk #$f1
$1e:cc50  00 b9		 brk #$b9
$1e:cc52  0d 7c 16	  ora $167c
$1e:cc55  5e 33 14	  lsr $1433,x
$1e:cc58  42 98		 wdm #$98
$1e:cc5a  52 1c		 eor ($1c)
$1e:cc5c  63 08		 adc $08,s
$1e:cc5e  21 6b		 and ($6b,x)
$1e:cc60  2d ce 39	  and $39ce
$1e:cc63  31 46		 and ($46),y
$1e:cc65  94 52		 sty $52,x
$1e:cc67  f7 5e		 sbc [$5e],y
$1e:cc69  5a			phy
$1e:cc6a  6b			rtl
$1e:cc6b  93 34		 sta ($34,s),y
$1e:cc6d  05 00		 ora $00
$1e:cc6f  0c 00 52	  tsb $5200
$1e:cc72  10 f8		 bpl $cc6c
$1e:cc74  30 fc		 bmi $cc72
$1e:cc76  55 de		 eor $de,x
$1e:cc78  62 61 18	  per $e4dc
$1e:cc7b  c3 30		 cmp $30,s
$1e:cc7d  66 51		 ror $51
$1e:cc7f  07 6a		 ora [$6a]
$1e:cc81  cd 6a 36	  cmp $366a
$1e:cc84  6f 14 42 98   adc $984214
$1e:cc88  52 5a		 eor ($5a)
$1e:cc8a  6b			rtl
$1e:cc8b  9c 10 21	  stz $2110
$1e:cc8e  0c 63 10	  tsb $1063
$1e:cc91  a5 1c		 lda $1c
$1e:cc93  08			php
$1e:cc94  2d 6b 39	  and $396b
$1e:cc97  ef 45 94 5a   sbc $5a9445
$1e:cc9b  f1 00		 sbc ($00),y
$1e:cc9d  b9 0d 7c	  lda $7c0d,y
$1e:cca0  16 5e		 asl $5e,x
$1e:cca2  33 14		 and ($14,s),y
$1e:cca4  42 98		 wdm #$98
$1e:cca6  52 1c		 eor ($1c)
$1e:cca8  63 7b		 adc $7b,s
$1e:ccaa  6f 41 1e 42   adc $421e41
$1e:ccae  08			php
$1e:ccaf  c6 18		 dec $18
$1e:ccb1  4a			lsr a
$1e:ccb2  29 ef		 and #$ef
$1e:ccb4  3d 94 52	  and $5294,x
$1e:ccb7  18			clc
$1e:ccb8  63 9c		 adc $9c,s
$1e:ccba  73 4e		 adc ($4e,s),y
$1e:ccbc  08			php
$1e:ccbd  8c 10 ce	  sty $ce10
$1e:ccc0  18			clc
$1e:ccc1  30 25		 bmi $cce8
$1e:ccc3  92 31		 sta ($31)
$1e:ccc5  f4 3d 56	  pea $563d
$1e:ccc8  4a			lsr a
$1e:ccc9  da			phx
$1e:ccca  5a			phy
$1e:cccb  00 50		 brk #$50
$1e:cccd  87 14		 sta [$14]
$1e:cccf  aa			tax
$1e:ccd0  28			plp
$1e:ccd1  ec 30 2f	  cpx $2f30
$1e:ccd4  3d 71 45	  and $4571,x
$1e:ccd7  b3 51		 lda ($51,s),y
$1e:ccd9  c2 10		 rep #$10
$1e:ccdb  23 15		 and $15,s
$1e:ccdd  84 19		 sty $19
$1e:ccdf  90 00		 bcc $cce1
$1e:cce1  96 01		 stx $01,y
$1e:cce3  9c 16 43	  stz $4316
$1e:cce6  00 0e		 brk #$0e
$1e:cce8  08			php
$1e:cce9  16 14		 asl $14,x
$1e:cceb  4f 41 65 00   eor $006541
$1e:ccef  87 00		 sta [$00]
$1e:ccf1  ca			dex
$1e:ccf2  0c 0d 15	  tsb $150d
$1e:ccf5  4f 19 62 20   eor $206219
$1e:ccf9  a4 30		 ldy $30
$1e:ccfb  06 3d		 asl $3d
$1e:ccfd  48			pha
$1e:ccfe  49 8a		 eor #$8a
$1e:cd00  59 cc 69	  eor $69cc,y
$1e:cd03  63 04		 adc $04,s
$1e:cd05  a5 0c		 lda $0c
$1e:cd07  e7 18		 sbc [$18]
$1e:cd09  42 08		 wdm #$08
$1e:cd0b  e2 25		 sep #$25
$1e:cd0d  65 00		 adc $00
$1e:cd0f  87 00		 sta [$00]
$1e:cd11  ca			dex
$1e:cd12  0c 0d 15	  tsb $150d
$1e:cd15  4f 19 42 08   eor $084219
$1e:cd19  63 04		 adc $04,s
$1e:cd1b  a5 0c		 lda $0c
$1e:cd1d  e7 18		 sbc [$18]
$1e:cd1f  29 21		 and #$21
$1e:cd21  6b			rtl
$1e:cd22  29 62		 and #$62
$1e:cd24  20 a4 30	  jsr $30a4
$1e:cd27  06 3d		 asl $3d
$1e:cd29  92 5a		 sta ($5a)
$1e:cd2b  cc 7d 62	  cpy $627d
$1e:cd2e  20 a4 30	  jsr $30a4
$1e:cd31  06 3d		 asl $3d
$1e:cd33  48			pha
$1e:cd34  49 8a		 eor #$8a
$1e:cd36  59 42 08	  eor $0842,y
$1e:cd39  63 04		 adc $04,s
$1e:cd3b  a5 0c		 lda $0c
$1e:cd3d  e7 18		 sbc [$18]
$1e:cd3f  29 21		 and #$21
$1e:cd41  6b			rtl
$1e:cd42  29 69		 and #$69
$1e:cd44  00 8b		 brk #$8b
$1e:cd46  1c eb 00	  trb $00eb
$1e:cd49  4f 01 00 60   eor $600001
$1e:cd4d  63 04		 adc $04,s
$1e:cd4f  a5 0c		 lda $0c
$1e:cd51  e7 18		 sbc [$18]
$1e:cd53  29 21		 and #$21
$1e:cd55  6b			rtl
$1e:cd56  29 6b		 and #$6b
$1e:cd58  35 aa		 and $aa,x
$1e:cd5a  28			plp
$1e:cd5b  cf 3c 13 4d   cmp $4d133c
$1e:cd5f  5c 71 a4 30   jml $30a471
$1e:cd63  06 3d		 asl $3d
$1e:cd65  48			pha
$1e:cd66  49 8a		 eor #$8a
$1e:cd68  59 43 00	  eor $0043,y
$1e:cd6b  29 25		 and #$25
$1e:cd6d  02 1c		 cop #$1c
$1e:cd6f  02 1c		 cop #$1c
$1e:cd71  02 1c		 cop #$1c
$1e:cd73  a5 0c		 lda $0c
$1e:cd75  e7 18		 sbc [$18]
$1e:cd77  62 20 a4	  per $719a
$1e:cd7a  30 06		 bmi $cd82
$1e:cd7c  3d 48 49	  and $4948,x
$1e:cd7f  8a			txa
$1e:cd80  59 cc 69	  eor $69cc,y
$1e:cd83  02 1c		 cop #$1c
$1e:cd85  02 1c		 cop #$1c
$1e:cd87  02 1c		 cop #$1c
$1e:cd89  21 08		 and ($08,x)
$1e:cd8b  4d 01 45	  eor $4501
$1e:cd8e  00 87		 brk #$87
$1e:cd90  08			php
$1e:cd91  ca			dex
$1e:cd92  0c 0b 19	  tsb $190b
$1e:cd95  4d 19 63	  eor $6319
$1e:cd98  04 a5		 tsb $a5
$1e:cd9a  0c e7 18	  tsb $18e7
$1e:cd9d  ad 0c b3	  lda $b30c
$1e:cda0  00 14		 brk #$14
$1e:cda2  11 98		 ora ($98),y
$1e:cda4  11 7d		 ora ($7d),y
$1e:cda6  1a			inc a
$1e:cda7  fe 26 22	  inc $2226,x
$1e:cdaa  00 00		 brk #$00
$1e:cdac  50 0c		 bvc $cdba
$1e:cdae  00 92		 brk #$92
$1e:cdb0  10 38		 bpl $cdea
$1e:cdb2  25 fc		 and $fc
$1e:cdb4  3d de 5a	  and $5ade,x
$1e:cdb7  ff 7f e3 19   sbc $19e37f,x
$1e:cdbb  e0 3e 95	  cpx #$953e
$1e:cdbe  47 90		 eor [$90]
$1e:cdc0  00 96		 brk #$96
$1e:cdc2  01 9c		 ora ($9c,x)
$1e:cdc4  16 00		 asl $00,x
$1e:cdc6  00 0e		 brk #$0e
$1e:cdc8  08			php
$1e:cdc9  16 14		 asl $14,x
$1e:cdcb  8d 31 9c	  sta $9c31
$1e:cdce  73 a5		 adc ($a5,s),y
$1e:cdd0  14 4a		 trb $4a
$1e:cdd2  29 31		 and #$31
$1e:cdd4  46 81		 lsr $81
$1e:cdd6  1c a2 28	  trb $28a2
$1e:cdd9  e4 34		 cpx $34
$1e:cddb  26 39		 rol $39
$1e:cddd  68			pla
$1e:cdde  3d ab 45	  and $45ab,x
$1e:cde1  ee 45 55	  inc $5545
$1e:cde4  4a			lsr a
$1e:cde5  ba			tsx
$1e:cde6  4e fc 52	  lsr $52fc
$1e:cde9  3e 5b 00	  rol $005b,x
$1e:cdec  2c 21 08	  bit $0821
$1e:cdef  63 0c		 adc $0c,s
$1e:cdf1  84 10		 sty $10
$1e:cdf3  c6 18		 dec $18
$1e:cdf5  29 25		 and #$25
$1e:cdf7  8c 31 ef	  sty $ef31
$1e:cdfa  3d c2 38	  and $38c2,x
$1e:cdfd  04 3d		 tsb $3d
$1e:cdff  46 41		 lsr $41
$1e:ce01  88			dey
$1e:ce02  4d ca 59	  eor $59ca
$1e:ce05  0c 62 4e	  tsb $4e62
$1e:ce08  6a			ror a
$1e:ce09  90 72		 bcc $ce7d
$1e:ce0b  be 01 08	  ldx $0801,y
$1e:ce0e  21 8c		 and ($8c,x)
$1e:ce10  31 ef		 and ($ef),y
$1e:ce12  3d 52 4a	  and $4a52,x
$1e:ce15  b5 56		 lda $56,x
$1e:ce17  18			clc
$1e:ce18  63 9c		 adc $9c,s
$1e:ce1a  73 02		 adc ($02,s),y
$1e:ce1c  00 23		 brk #$23
$1e:ce1e  04 66		 tsb $66
$1e:ce20  08			php
$1e:ce21  c8			iny
$1e:ce22  0c 2c 15	  tsb $152c
$1e:ce25  af 1d 12 2a   lda $2a121d
$1e:ce29  95 3a		 sta $3a,x
$1e:ce2b  f0 40		 beq $ce6d
$1e:ce2d  08			php
$1e:ce2e  21 8c		 and ($8c,x)
$1e:ce30  31 ef		 and ($ef),y
$1e:ce32  3d 52 4a	  and $4a52,x
$1e:ce35  b5 56		 lda $56,x
$1e:ce37  18			clc
$1e:ce38  63 9c		 adc $9c,s
$1e:ce3a  73 00		 adc ($00,s),y
$1e:ce3c  00 41		 brk #$41
$1e:ce3e  10 82		 bpl $cdc2
$1e:ce40  1c c3 28	  trb $28c3
$1e:ce43  25 35		 and $35
$1e:ce45  a9 41		 lda #$41
$1e:ce47  4c 52 0e	  jmp $0e52
$1e:ce4a  6b			rtl
$1e:ce4b  4c 61 25	  jmp $2561
$1e:ce4e  00 67		 brk #$67
$1e:ce50  04 cb		 tsb $cb
$1e:ce52  08			php
$1e:ce53  2e 11 92	  rol $9211
$1e:ce56  19 f6 21	  ora $21f6,y
$1e:ce59  58			cli
$1e:ce5a  2e 8c 31	  rol $318c
$1e:ce5d  52 4a		 eor ($4a)
$1e:ce5f  18			clc
$1e:ce60  63 41		 adc $41,s
$1e:ce62  0c a3 20	  tsb $20a3
$1e:ce65  06 31		 asl $31
$1e:ce67  a4 49		 ldy $49
$1e:ce69  46 5a		 lsr $5a
$1e:ce6b  16 14		 asl $14,x
$1e:ce6d  9c 73 61	  stz $6173
$1e:ce70  14 82		 trb $82
$1e:ce72  18			clc
$1e:ce73  a3 1c		 lda $1c,s
$1e:ce75  c3 24		 cmp $24,s
$1e:ce77  e4 2c		 cpx $2c
$1e:ce79  05 35		 ora $35
$1e:ce7b  44 39 68	  mvp $68,$39
$1e:ce7e  3d 8a 41	  and $418a,x
$1e:ce81  ab			plb
$1e:ce82  45 ee		 eor $ee
$1e:ce84  45 55		 eor $55
$1e:ce86  4a			lsr a
$1e:ce87  ba			tsx
$1e:ce88  4e 1e 53	  lsr $531e
$1e:ce8b  81 1c		 sta ($1c,x)
$1e:ce8d  0c 00 92	  tsb $9200
$1e:ce90  10 38		 bpl $ceca
$1e:ce92  25 fc		 and $fc
$1e:ce94  3d de 5a	  and $5ade,x
$1e:ce97  ff 7f e3 19   sbc $19e37f,x
$1e:ce9b  e0 3e 95	  cpx #$953e
$1e:ce9e  47 90		 eor [$90]
$1e:cea0  00 96		 brk #$96
$1e:cea2  01 9c		 ora ($9c,x)
$1e:cea4  16 00		 asl $00,x
$1e:cea6  00 0e		 brk #$0e
$1e:cea8  08			php
$1e:cea9  16 14		 asl $14,x
$1e:ceab  81 1c		 sta ($1c,x)
$1e:cead  27 31		 and [$31]
$1e:ceaf  af 45 d0 4d   lda $4dd045
$1e:ceb3  f1 55		 sbc ($55),y
$1e:ceb5  12 52		 ora ($52)
$1e:ceb7  f0 4d		 beq $cf06
$1e:ceb9  ae 49 8c	  ldx $8c49
$1e:cebc  45 86		 eor $86
$1e:cebe  35 a8		 and $a8,x
$1e:cec0  39 ca 3d	  and $3dca,y
$1e:cec3  0c 46 eb	  tsb $eb46
$1e:cec6  41 c9		 eor ($c9,x)
$1e:cec8  3d a8 39	  and $39a8,x
$1e:cecb  81 1c		 sta ($1c,x)
$1e:cecd  27 31		 and [$31]
$1e:cecf  0f 52 30 5a   ora $5a3052
$1e:ced3  51 62		 eor ($62),y
$1e:ced5  72 5e		 adc ($5e)
$1e:ced7  50 5a		 bvc $cf33
$1e:ced9  0e 56 ec	  asl $ec56
$1e:cedc  51 86		 eor ($86),y
$1e:cede  35 a8		 and $a8,x
$1e:cee0  39 ca 3d	  and $3dca,y
$1e:cee3  0c 46 eb	  tsb $eb46
$1e:cee6  41 c9		 eor ($c9,x)
$1e:cee8  3d a8 39	  and $39a8,x
$1e:ceeb  81 1c		 sta ($1c,x)
$1e:ceed  08			php
$1e:ceee  21 8c		 and ($8c,x)
$1e:cef0  31 ef		 and ($ef),y
$1e:cef2  3d 52 4a	  and $4a52,x
$1e:cef5  b5 56		 lda $56,x
$1e:cef7  18			clc
$1e:cef8  63 9c		 adc $9c,s
$1e:cefa  73 00		 adc ($00,s),y
$1e:cefc  08			php
$1e:cefd  41 10		 eor ($10,x)
$1e:ceff  82 18 c3	  brl $921a
$1e:cf02  20 06 29	  jsr $2906
$1e:cf05  68			pla
$1e:cf06  31 cc		 and ($cc),y
$1e:cf08  39 52 4a	  and $4a52,y
$1e:cf0b  81 1c		 sta ($1c,x)
$1e:cf0d  08			php
$1e:cf0e  21 8c		 and ($8c,x)
$1e:cf10  31 ef		 and ($ef),y
$1e:cf12  3d 52 4a	  and $4a52,x
$1e:cf15  b5 56		 lda $56,x
$1e:cf17  18			clc
$1e:cf18  63 9c		 adc $9c,s
$1e:cf1a  73 00		 adc ($00,s),y
$1e:cf1c  00 41		 brk #$41
$1e:cf1e  10 82		 bpl $cea2
$1e:cf20  1c c3 28	  trb $28c3
$1e:cf23  25 35		 and $35
$1e:cf25  a9 41		 lda #$41
$1e:cf27  4c 52 0e	  jmp $0e52
$1e:cf2a  6b			rtl
$1e:cf2b  81 1c		 sta ($1c,x)
$1e:cf2d  25 00		 and $00
$1e:cf2f  67 04		 adc [$04]
$1e:cf31  cb			wai
$1e:cf32  08			php
$1e:cf33  2e 11 92	  rol $9211
$1e:cf36  19 f6 21	  ora $21f6,y
$1e:cf39  58			cli
$1e:cf3a  2e 8c 31	  rol $318c
$1e:cf3d  52 4a		 eor ($4a)
$1e:cf3f  18			clc
$1e:cf40  63 21		 adc $21,s
$1e:cf42  14 65		 trb $65
$1e:cf44  24 a6		 bit $a6
$1e:cf46  30 04		 bmi $cf4c
$1e:cf48  29 86		 and #$86
$1e:cf4a  39 81 1c	  and $1c81,y
$1e:cf4d  27 31		 and [$31]
$1e:cf4f  6f 52 90 5a   adc $5a9052
$1e:cf53  d1 62		 cmp ($62),y
$1e:cf55  d2 5e		 cmp ($5e)
$1e:cf57  b0 62		 bcs $cfbb
$1e:cf59  6e 5e 4c	  ror $4c5e
$1e:cf5c  56 86		 lsr $86,x
$1e:cf5e  35 a8		 and $a8,x
$1e:cf60  39 ca 3d	  and $3dca,y
$1e:cf63  0c 46 eb	  tsb $eb46
$1e:cf66  41 c9		 eor ($c9,x)
$1e:cf68  3d a8 39	  and $39a8,x
$1e:cf6b  00 50		 brk #$50
$1e:cf6d  0c 00 92	  tsb $9200
$1e:cf70  10 38		 bpl $cfaa
$1e:cf72  25 fc		 and $fc
$1e:cf74  3d de 5a	  and $5ade,x
$1e:cf77  ff 7f e3 19   sbc $19e37f,x
$1e:cf7b  e0 3e 95	  cpx #$953e
$1e:cf7e  47 90		 eor [$90]
$1e:cf80  00 96		 brk #$96
$1e:cf82  01 9c		 ora ($9c,x)
$1e:cf84  16 00		 asl $00,x
$1e:cf86  00 0e		 brk #$0e
$1e:cf88  08			php
$1e:cf89  16 14		 asl $14,x
$1e:cf8b  60			rts
$1e:cf8c  22 c0 2c a0   jsl $a02cc0
$1e:cf90  24 80		 bit $80
$1e:cf92  28			plp
$1e:cf93  c0 34 00	  cpy #$0034
$1e:cf96  3d 60 51	  and $5160,x
$1e:cf99  00 62		 brk #$62
$1e:cf9b  60			rts
$1e:cf9c  51 00		 eor ($00),y
$1e:cf9e  3d c0 34	  and $34c0,x
$1e:cfa1  80 28		 bra $cfcb
$1e:cfa3  a1 24		 lda ($24,x)
$1e:cfa5  88			dey
$1e:cfa6  1d ec 29	  ora $29ec,x
$1e:cfa9  50 3a		 bvc $cfe5
$1e:cfab  00 2c		 brk #$2c
$1e:cfad  c2 38		 rep #$38
$1e:cfaf  63 0c		 adc $0c,s
$1e:cfb1  84 10		 sty $10
$1e:cfb3  c6 18		 dec $18
$1e:cfb5  29 25 8c	  and #$8c25
$1e:cfb8  31 ef		 and ($ef),y
$1e:cfba  3d 46 41	  and $4146,x
$1e:cfbd  88			dey
$1e:cfbe  4d 0c 62	  eor $620c
$1e:cfc1  90 72		 bcc $d035
$1e:cfc3  53 41		 eor ($41,s),y
$1e:cfc5  96 4d		 stx $4d,y
$1e:cfc7  1a			inc a
$1e:cfc8  62 9c 72	  per $4267
$1e:cfcb  be 01 21	  ldx $2101,y
$1e:cfce  08			php
$1e:cfcf  63 0c		 adc $0c,s
$1e:cfd1  84 10		 sty $10
$1e:cfd3  c6 18		 dec $18
$1e:cfd5  29 25 8c	  and #$8c25
$1e:cfd8  31 ef		 and ($ef),y
$1e:cfda  3d 20 08	  and $0820,x
$1e:cfdd  41 0c		 eor ($0c,x)
$1e:cfdf  62 14 c3	  per $92f6
$1e:cfe2  1c 25 25	  trb $2525
$1e:cfe5  a8			tay
$1e:cfe6  29 0a 36	  and #$360a
$1e:cfe9  8d 3e f0	  sta $f03e
$1e:cfec  40			rti
$1e:cfed  04 08		 tsb $08
$1e:cfef  45 18		 eor $18
$1e:cff1  a8			tay
$1e:cff2  24 0b		 bit $0b
$1e:cff4  31 6e		 and ($6e),y
$1e:cff6  3d f2 4d	  and $4df2,x
$1e:cff9  77 62		 adc [$62],y
$1e:cffb  02 00		 cop #$00
$1e:cffd  23 04		 and $04,s
$1e:cfff  66 08		 ror $08
$1e:d001  c8			iny
$1e:d002  0c 2c 15	  tsb $152c
$1e:d005  af 1d 12 2a   lda $2a121d
$1e:d009  95 3a		 sta $3a,x
$1e:d00b  4c 61 25	  jmp $2561
$1e:d00e  00 67		 brk #$67
$1e:d010  04 cb		 tsb $cb
$1e:d012  08			php
$1e:d013  2e 11 92	  rol $9211
$1e:d016  19 f6 21	  ora $21f6,y
$1e:d019  58			cli
$1e:d01a  2e 8c 31	  rol $318c
$1e:d01d  52 4a		 eor ($4a)
$1e:d01f  18			clc
$1e:d020  63 41		 adc $41,s
$1e:d022  0c a3 20	  tsb $20a3
$1e:d025  06 31		 asl $31
$1e:d027  a4 49		 ldy $49
$1e:d029  46 5a		 lsr $5a
$1e:d02b  16 14		 asl $14,x
$1e:d02d  43 49		 eor $49,s
$1e:d02f  87 51		 sta [$51]
$1e:d031  eb			xba
$1e:d032  5d 6e 62	  eor $626e,x
$1e:d035  e5 5d		 sbc $5d
$1e:d037  83 51		 sta $51,s
$1e:d039  05 3d		 ora $3d
$1e:d03b  46 45		 lsr $45
$1e:d03d  88			dey
$1e:d03e  4d ea 5d	  eor $5dea
$1e:d041  88			dey
$1e:d042  51 46		 eor ($46),y
$1e:d044  49 20 08	  eor #$0820
$1e:d047  62 14 c4	  per $945e
$1e:d04a  1c 00 50	  trb $5000
$1e:d04d  0c 00 92	  tsb $9200
$1e:d050  10 38		 bpl $d08a
$1e:d052  25 fc		 and $fc
$1e:d054  3d de 5a	  and $5ade,x
$1e:d057  ff 7f e3 19   sbc $19e37f,x
$1e:d05b  e0 3e 95	  cpx #$953e
$1e:d05e  47 90		 eor [$90]
$1e:d060  00 96		 brk #$96
$1e:d062  01 9c		 ora ($9c,x)
$1e:d064  16 00		 asl $00,x
$1e:d066  00 0e		 brk #$0e
$1e:d068  08			php
$1e:d069  16 14		 asl $14,x
$1e:d06b  60			rts
$1e:d06c  22 c0 2c a0   jsl $a02cc0
$1e:d070  24 80		 bit $80
$1e:d072  28			plp
$1e:d073  c0 34 00	  cpy #$0034
$1e:d076  3d 60 51	  and $5160,x
$1e:d079  00 62		 brk #$62
$1e:d07b  60			rts
$1e:d07c  51 00		 eor ($00),y
$1e:d07e  3d c0 34	  and $34c0,x
$1e:d081  80 28		 bra $d0ab
$1e:d083  a1 24		 lda ($24,x)
$1e:d085  88			dey
$1e:d086  1d ec 29	  ora $29ec,x
$1e:d089  50 3a		 bvc $d0c5
$1e:d08b  00 2c		 brk #$2c
$1e:d08d  c2 38		 rep #$38
$1e:d08f  63 0c		 adc $0c,s
$1e:d091  84 10		 sty $10
$1e:d093  c6 18		 dec $18
$1e:d095  29 25 8c	  and #$8c25
$1e:d098  31 ef		 and ($ef),y
$1e:d09a  3d 46 41	  and $4146,x
$1e:d09d  88			dey
$1e:d09e  4d 0c 62	  eor $620c
$1e:d0a1  90 72		 bcc $d115
$1e:d0a3  53 41		 eor ($41,s),y
$1e:d0a5  96 4d		 stx $4d,y
$1e:d0a7  1a			inc a
$1e:d0a8  62 9c 72	  per $4347
$1e:d0ab  be 01 21	  ldx $2101,y
$1e:d0ae  08			php
$1e:d0af  63 0c		 adc $0c,s
$1e:d0b1  84 10		 sty $10
$1e:d0b3  c6 14		 dec $14
$1e:d0b5  29 19 8c	  and #$8c19
$1e:d0b8  25 ef		 and $ef
$1e:d0ba  29 23 08	  and #$0823
$1e:d0bd  45 0c		 eor $0c
$1e:d0bf  67 14		 adc [$14]
$1e:d0c1  c9 1c 2c	  cmp #$2c1c
$1e:d0c4  25 af		 and $af
$1e:d0c6  29 13 36	  and #$3613
$1e:d0c9  97 3e		 sta [$3e],y
$1e:d0cb  f0 40		 beq $d10d
$1e:d0cd  08			php
$1e:d0ce  21 8c		 and ($8c,x)
$1e:d0d0  31 ef		 and ($ef),y
$1e:d0d2  3d 52 4a	  and $4a52,x
$1e:d0d5  b5 56		 lda $56,x
$1e:d0d7  18			clc
$1e:d0d8  63 9c		 adc $9c,s
$1e:d0da  73 02		 adc ($02,s),y
$1e:d0dc  00 23		 brk #$23
$1e:d0de  04 66		 tsb $66
$1e:d0e0  08			php
$1e:d0e1  c8			iny
$1e:d0e2  0c 2c 15	  tsb $152c
$1e:d0e5  af 1d 12 2a   lda $2a121d
$1e:d0e9  95 3a		 sta $3a,x
$1e:d0eb  4c 61 25	  jmp $2561
$1e:d0ee  00 67		 brk #$67
$1e:d0f0  04 cb		 tsb $cb
$1e:d0f2  08			php
$1e:d0f3  2e 11 92	  rol $9211
$1e:d0f6  19 f6 21	  ora $21f6,y
$1e:d0f9  58			cli
$1e:d0fa  2e 8c 31	  rol $318c
$1e:d0fd  52 4a		 eor ($4a)
$1e:d0ff  18			clc
$1e:d100  63 41		 adc $41,s
$1e:d102  0c a3 20	  tsb $20a3
$1e:d105  06 31		 asl $31
$1e:d107  a4 49		 ldy $49
$1e:d109  46 5a		 lsr $5a
$1e:d10b  16 14		 asl $14,x
$1e:d10d  88			dey
$1e:d10e  5a			phy
$1e:d10f  05 52		 ora $52
$1e:d111  c3 49		 cmp $49,s
$1e:d113  43 49		 eor $49,s
$1e:d115  03 39		 ora $39,s
$1e:d117  c2 30		 rep #$30
$1e:d119  a0 20 46	  ldy #$4620
$1e:d11c  45 88		 eor $88
$1e:d11e  4d ea 5d	  eor $5dea
$1e:d121  88			dey
$1e:d122  51 46		 eor ($46),y
$1e:d124  49 20 08	  eor #$0820
$1e:d127  62 14 c4	  per $953e
$1e:d12a  1c 00 50	  trb $5000
$1e:d12d  0c 00 92	  tsb $9200
$1e:d130  10 38		 bpl $d16a
$1e:d132  25 fc		 and $fc
$1e:d134  3d de 5a	  and $5ade,x
$1e:d137  ff 7f e3 19   sbc $19e37f,x
$1e:d13b  e0 3e 95	  cpx #$953e
$1e:d13e  47 90		 eor [$90]
$1e:d140  00 96		 brk #$96
$1e:d142  01 9c		 ora ($9c,x)
$1e:d144  16 00		 asl $00,x
$1e:d146  00 0e		 brk #$0e
$1e:d148  08			php
$1e:d149  16 14		 asl $14,x
$1e:d14b  60			rts
$1e:d14c  22 41 18 a3   jsl $a31841
$1e:d150  24 e6		 bit $e6
$1e:d152  30 69		 bmi $d1bd
$1e:d154  41 ed		 eor ($ed,x)
$1e:d156  51 8f		 eor ($8f),y
$1e:d158  5e 14 6b	  lsr $6b14,x
$1e:d15b  7a			ply
$1e:d15c  73 43		 adc ($43,s),y
$1e:d15e  00 87		 brk #$87
$1e:d160  08			php
$1e:d161  eb			xba
$1e:d162  10 4e		 bpl $d1b2
$1e:d164  1d c6 18	  ora $18c6,x
$1e:d167  63 0c		 adc $0c,s
$1e:d169  20 04 00	  jsr $0004
$1e:d16c  2c 86 49	  bit $4986
$1e:d16f  c8			iny
$1e:d170  4d 4a 5a	  eor $5a4a
$1e:d173  8e 62 d2	  stx $d262
$1e:d176  6a			ror a
$1e:d177  34 73		 bit $73,x
$1e:d179  98			tya
$1e:d17a  73 20		 adc ($20,s),y
$1e:d17c  0c 61 14	  tsb $1461
$1e:d17f  a2 20 e3	  ldx #$e320
$1e:d182  30 65		 bmi $d1e9
$1e:d184  41 09		 eor ($09,x)
$1e:d186  52 8c		 eor ($8c)
$1e:d188  5a			phy
$1e:d189  0e 6b be	  asl $be6b
$1e:d18c  01 29		 ora ($29,x)
$1e:d18e  25 ad		 and $ad
$1e:d190  35 10		 and $10,x
$1e:d192  42 73		 wdm #$73
$1e:d194  4e d6 5a	  lsr $5ad6
$1e:d197  39 67 9c	  and $9c67,y
$1e:d19a  73 20		 adc ($20,s),y
$1e:d19c  0c 61 14	  tsb $1461
$1e:d19f  a2 20 e3	  ldx #$e320
$1e:d1a2  30 65		 bmi $d209
$1e:d1a4  41 09		 eor ($09,x)
$1e:d1a6  52 8c		 eor ($8c)
$1e:d1a8  5a			phy
$1e:d1a9  0e 6b f0	  asl $f06b
$1e:d1ac  40			rti
$1e:d1ad  98			tya
$1e:d1ae  73 98		 adc ($98,s),y
$1e:d1b0  73 4a		 adc ($4a,s),y
$1e:d1b2  5a			phy
$1e:d1b3  8e 62 d2	  stx $d262
$1e:d1b6  6a			ror a
$1e:d1b7  34 73		 bit $73,x
$1e:d1b9  98			tya
$1e:d1ba  73 20		 adc ($20,s),y
$1e:d1bc  0c 61 14	  tsb $1461
$1e:d1bf  a2 20 e3	  ldx #$e320
$1e:d1c2  30 65		 bmi $d229
$1e:d1c4  41 09		 eor ($09,x)
$1e:d1c6  52 8c		 eor ($8c)
$1e:d1c8  5a			phy
$1e:d1c9  0e 6b 4c	  asl $4c6b
$1e:d1cc  61 25		 adc ($25,x)
$1e:d1ce  00 67		 brk #$67
$1e:d1d0  04 cb		 tsb $cb
$1e:d1d2  08			php
$1e:d1d3  2e 11 92	  rol $9211
$1e:d1d6  19 f6 21	  ora $21f6,y
$1e:d1d9  58			cli
$1e:d1da  2e 8c 31	  rol $318c
$1e:d1dd  52 4a		 eor ($4a)
$1e:d1df  18			clc
$1e:d1e0  63 60		 adc $60,s
$1e:d1e2  18			clc
$1e:d1e3  c0 40 40	  cpy #$4040
$1e:d1e6  51 a0		 eor ($a0),y
$1e:d1e8  61 40		 adc ($40,x)
$1e:d1ea  72 16		 adc ($16)
$1e:d1ec  14 63		 trb $63
$1e:d1ee  21 e5		 and ($e5,x)
$1e:d1f0  29 68 3e	  and #$3e68
$1e:d1f3  cc 4e 2f	  cpy $2f4e
$1e:d1f6  5f 44 04 6a   eor $6a0444,x
$1e:d1fa  14 b0		 trb $b0
$1e:d1fc  1c 14 29	  trb $2914
$1e:d1ff  98			tya
$1e:d200  39 a1 04	  and $04a1,y
$1e:d203  05 11		 ora $11
$1e:d205  88			dey
$1e:d206  1d ec 29	  ora $29ec,x
$1e:d209  50 3a		 bvc $d245
$1e:d20b  00 50		 brk #$50
$1e:d20d  0c 00 92	  tsb $9200
$1e:d210  10 38		 bpl $d24a
$1e:d212  25 fc		 and $fc
$1e:d214  3d de 5a	  and $5ade,x
$1e:d217  ff 7f e3 19   sbc $19e37f,x
$1e:d21b  e0 3e 95	  cpx #$953e
$1e:d21e  47 90		 eor [$90]
$1e:d220  00 96		 brk #$96
$1e:d222  01 9c		 ora ($9c,x)
$1e:d224  16 00		 asl $00,x
$1e:d226  00 0e		 brk #$0e
$1e:d228  08			php
$1e:d229  16 14		 asl $14,x
$1e:d22b  60			rts
$1e:d22c  22 41 18 a3   jsl $a31841
$1e:d230  24 e6		 bit $e6
$1e:d232  30 69		 bmi $d29d
$1e:d234  41 ed		 eor ($ed,x)
$1e:d236  51 8f		 eor ($8f),y
$1e:d238  5e 14 6b	  lsr $6b14,x
$1e:d23b  7a			ply
$1e:d23c  73 43		 adc ($43,s),y
$1e:d23e  00 87		 brk #$87
$1e:d240  08			php
$1e:d241  eb			xba
$1e:d242  10 4e		 bpl $d292
$1e:d244  1d c6 18	  ora $18c6,x
$1e:d247  63 0c		 adc $0c,s
$1e:d249  20 04 00	  jsr $0004
$1e:d24c  2c 86 49	  bit $4986
$1e:d24f  c8			iny
$1e:d250  4d 4a 5a	  eor $5a4a
$1e:d253  8e 62 d2	  stx $d262
$1e:d256  6a			ror a
$1e:d257  34 73		 bit $73,x
$1e:d259  98			tya
$1e:d25a  73 20		 adc ($20,s),y
$1e:d25c  0c 61 14	  tsb $1461
$1e:d25f  a2 20 e3	  ldx #$e320
$1e:d262  30 65		 bmi $d2c9
$1e:d264  41 09		 eor ($09,x)
$1e:d266  52 8c		 eor ($8c)
$1e:d268  5a			phy
$1e:d269  0e 6b be	  asl $be6b
$1e:d26c  01 29		 ora ($29,x)
$1e:d26e  25 ad		 and $ad
$1e:d270  35 10		 and $10,x
$1e:d272  42 73		 wdm #$73
$1e:d274  4e d6 5a	  lsr $5ad6
$1e:d277  39 67 9c	  and $9c67,y
$1e:d27a  73 20		 adc ($20,s),y
$1e:d27c  0c 61 14	  tsb $1461
$1e:d27f  a2 20 e3	  ldx #$e320
$1e:d282  30 65		 bmi $d2e9
$1e:d284  41 09		 eor ($09,x)
$1e:d286  52 8c		 eor ($8c)
$1e:d288  5a			phy
$1e:d289  0e 6b f0	  asl $f06b
$1e:d28c  40			rti
$1e:d28d  98			tya
$1e:d28e  73 98		 adc ($98,s),y
$1e:d290  73 4a		 adc ($4a,s),y
$1e:d292  5a			phy
$1e:d293  8e 62 d2	  stx $d262
$1e:d296  6a			ror a
$1e:d297  34 73		 bit $73,x
$1e:d299  98			tya
$1e:d29a  73 20		 adc ($20,s),y
$1e:d29c  0c 61 14	  tsb $1461
$1e:d29f  a2 20 e3	  ldx #$e320
$1e:d2a2  30 65		 bmi $d309
$1e:d2a4  41 09		 eor ($09,x)
$1e:d2a6  52 8c		 eor ($8c)
$1e:d2a8  5a			phy
$1e:d2a9  0e 6b 4c	  asl $4c6b
$1e:d2ac  61 25		 adc ($25,x)
$1e:d2ae  00 67		 brk #$67
$1e:d2b0  04 cb		 tsb $cb
$1e:d2b2  08			php
$1e:d2b3  2e 11 92	  rol $9211
$1e:d2b6  19 f6 21	  ora $21f6,y
$1e:d2b9  58			cli
$1e:d2ba  2e 8c 31	  rol $318c
$1e:d2bd  52 4a		 eor ($4a)
$1e:d2bf  18			clc
$1e:d2c0  63 60		 adc $60,s
$1e:d2c2  18			clc
$1e:d2c3  c0 40 40	  cpy #$4040
$1e:d2c6  51 a0		 eor ($a0),y
$1e:d2c8  61 40		 adc ($40,x)
$1e:d2ca  72 16		 adc ($16)
$1e:d2cc  14 8b		 trb $8b
$1e:d2ce  35 cc		 and $cc,x
$1e:d2d0  3d ed 45	  and $45ed,x
$1e:d2d3  0e 4a 2f	  asl $2f4a
$1e:d2d6  4e 44 04	  lsr $0444
$1e:d2d9  6a			ror a
$1e:d2da  14 b0		 trb $b0
$1e:d2dc  1c 14 29	  trb $2914
$1e:d2df  98			tya
$1e:d2e0  39 a1 04	  and $04a1,y
$1e:d2e3  05 11		 ora $11
$1e:d2e5  88			dey
$1e:d2e6  1d ec 29	  ora $29ec,x
$1e:d2e9  50 3a		 bvc $d325
$1e:d2eb  00 50		 brk #$50
$1e:d2ed  0c 00 92	  tsb $9200
$1e:d2f0  10 38		 bpl $d32a
$1e:d2f2  25 fc		 and $fc
$1e:d2f4  3d de 5a	  and $5ade,x
$1e:d2f7  ff 7f e3 19   sbc $19e37f,x
$1e:d2fb  e0 3e 95	  cpx #$953e
$1e:d2fe  47 90		 eor [$90]
$1e:d300  00 96		 brk #$96
$1e:d302  01 9c		 ora ($9c,x)
$1e:d304  16 00		 asl $00,x
$1e:d306  00 0e		 brk #$0e
$1e:d308  08			php
$1e:d309  16 14		 asl $14,x
$1e:d30b  60			rts
$1e:d30c  22 ce 39 52   jsl $5239ce
$1e:d310  4a			lsr a
$1e:d311  18			clc
$1e:d312  63 de		 adc $de,s
$1e:d314  7b			tdc
$1e:d315  20 3c 60	  jsr $603c
$1e:d318  06 98		 asl $98
$1e:d31a  73 20		 adc ($20,s),y
$1e:d31c  0c 61 14	  tsb $1461
$1e:d31f  a2 20 e3	  ldx #$e320
$1e:d322  30 65		 bmi $d389
$1e:d324  41 09		 eor ($09,x)
$1e:d326  52 8c		 eor ($8c)
$1e:d328  5a			phy
$1e:d329  0e 6b 00	  asl $006b
$1e:d32c  2c 86 49	  bit $4986
$1e:d32f  c8			iny
$1e:d330  4d 4a 5a	  eor $5a4a
$1e:d333  8e 62 d2	  stx $d262
$1e:d336  6a			ror a
$1e:d337  34 73		 bit $73,x
$1e:d339  98			tya
$1e:d33a  73 20		 adc ($20,s),y
$1e:d33c  0c 61 14	  tsb $1461
$1e:d33f  a2 20 e3	  ldx #$e320
$1e:d342  30 65		 bmi $d3a9
$1e:d344  41 09		 eor ($09,x)
$1e:d346  52 8c		 eor ($8c)
$1e:d348  5a			phy
$1e:d349  0e 6b be	  asl $be6b
$1e:d34c  01 29		 ora ($29,x)
$1e:d34e  25 ad		 and $ad
$1e:d350  35 10		 and $10,x
$1e:d352  42 73		 wdm #$73
$1e:d354  4e d6 5a	  lsr $5ad6
$1e:d357  39 67 9c	  and $9c67,y
$1e:d35a  73 20		 adc ($20,s),y
$1e:d35c  0c 61 14	  tsb $1461
$1e:d35f  a2 20 e3	  ldx #$e320
$1e:d362  30 65		 bmi $d3c9
$1e:d364  41 09		 eor ($09,x)
$1e:d366  52 8c		 eor ($8c)
$1e:d368  5a			phy
$1e:d369  0e 6b f0	  asl $f06b
$1e:d36c  40			rti
$1e:d36d  98			tya
$1e:d36e  73 98		 adc ($98,s),y
$1e:d370  73 4a		 adc ($4a,s),y
$1e:d372  5a			phy
$1e:d373  8e 62 d2	  stx $d262
$1e:d376  6a			ror a
$1e:d377  34 73		 bit $73,x
$1e:d379  98			tya
$1e:d37a  73 20		 adc ($20,s),y
$1e:d37c  0c 61 14	  tsb $1461
$1e:d37f  a2 20 e3	  ldx #$e320
$1e:d382  30 65		 bmi $d3e9
$1e:d384  41 09		 eor ($09,x)
$1e:d386  52 8c		 eor ($8c)
$1e:d388  5a			phy
$1e:d389  0e 6b 4c	  asl $4c6b
$1e:d38c  61 25		 adc ($25,x)
$1e:d38e  00 67		 brk #$67
$1e:d390  04 cb		 tsb $cb
$1e:d392  08			php
$1e:d393  2e 11 92	  rol $9211
$1e:d396  19 f6 21	  ora $21f6,y
$1e:d399  58			cli
$1e:d39a  2e 8c 31	  rol $318c
$1e:d39d  52 4a		 eor ($4a)
$1e:d39f  18			clc
$1e:d3a0  63 60		 adc $60,s
$1e:d3a2  18			clc
$1e:d3a3  c0 40 40	  cpy #$4040
$1e:d3a6  51 a0		 eor ($a0),y
$1e:d3a8  61 40		 adc ($40,x)
$1e:d3aa  72 16		 adc ($16)
$1e:d3ac  14 00		 trb $00
$1e:d3ae  00 00		 brk #$00
$1e:d3b0  10 20		 bpl $d3d2
$1e:d3b2  18			clc
$1e:d3b3  40			rti
$1e:d3b4  20 80 28	  jsr $2880
$1e:d3b7  c0 30 20	  cpy #$2030
$1e:d3ba  3d e0 48	  and $48e0,x
$1e:d3bd  14 29		 trb $29
$1e:d3bf  98			tya
$1e:d3c0  39 a1 04	  and $04a1,y
$1e:d3c3  05 11		 ora $11
$1e:d3c5  88			dey
$1e:d3c6  1d ec 29	  ora $29ec,x
$1e:d3c9  50 3a		 bvc $d405
$1e:d3cb  70 10		 bvs $d3dd
$1e:d3cd  0c 00 92	  tsb $9200
$1e:d3d0  10 38		 bpl $d40a
$1e:d3d2  25 fc		 and $fc
$1e:d3d4  3d de 5a	  and $5ade,x
$1e:d3d7  ff 7f e3 19   sbc $19e37f,x
$1e:d3db  e0 3e 95	  cpx #$953e
$1e:d3de  47 90		 eor [$90]
$1e:d3e0  00 96		 brk #$96
$1e:d3e2  01 9c		 ora ($9c,x)
$1e:d3e4  16 00		 asl $00,x
$1e:d3e6  00 0e		 brk #$0e
$1e:d3e8  08			php
$1e:d3e9  16 14		 asl $14,x
$1e:d3eb  00 50		 brk #$50
$1e:d3ed  86 00		 stx $00
$1e:d3ef  c8			iny
$1e:d3f0  08			php
$1e:d3f1  0a			asl a
$1e:d3f2  0d 4c 11	  ora $114c
$1e:d3f5  8e 19 f3	  stx $f319
$1e:d3f8  21 55		 and ($55,x)
$1e:d3fa  2a			rol a
$1e:d3fb  ea			nop
$1e:d3fc  08			php
$1e:d3fd  b0 15		 bcs $d414
$1e:d3ff  34 1e		 bit $1e,x
$1e:d401  ba			tsx
$1e:d402  2a			rol a
$1e:d403  27 49		 and [$49]
$1e:d405  69 59 ab	  adc #$ab59
$1e:d408  61 ed		 adc ($ed,x)
$1e:d40a  71 80		 adc ($80),y
$1e:d40c  03 42		 ora $42,s
$1e:d40e  08			php
$1e:d40f  c6 18		 dec $18
$1e:d411  4a			lsr a
$1e:d412  29 ef 3d	  and #$3def
$1e:d415  94 52		 sty $52,x
$1e:d417  18			clc
$1e:d418  63 9c		 adc $9c,s
$1e:d41a  73 f1		 adc ($f1,s),y
$1e:d41c  00 b9		 brk #$b9
$1e:d41e  0d 7c 16	  ora $167c
$1e:d421  5e 33 53	  lsr $5333,x
$1e:d424  22 d9 32 5c   jsl $5c32d9
$1e:d428  43 9e		 eor $9e,s
$1e:d42a  25 57		 and $57
$1e:d42c  15 4a		 ora $4a,x
$1e:d42e  00 f1		 brk #$f1
$1e:d430  00 b9		 brk #$b9
$1e:d432  0d 7c 16	  ora $167c
$1e:d435  5e 33 53	  lsr $5333,x
$1e:d438  22 d9 32 5c   jsl $5c32d9
$1e:d43c  43 08		 eor $08,s
$1e:d43e  21 6b		 and ($6b,x)
$1e:d440  2d ce 39	  and $39ce
$1e:d443  31 46		 and ($46),y
$1e:d445  94 52		 sty $52,x
$1e:d447  f7 5e		 sbc [$5e],y
$1e:d449  5a			phy
$1e:d44a  6b			rtl
$1e:d44b  93 34		 sta ($34,s),y
$1e:d44d  05 00		 ora $00
$1e:d44f  0c 00 52	  tsb $5200
$1e:d452  10 f8		 bpl $d44c
$1e:d454  30 fc		 bmi $d452
$1e:d456  55 de		 eor $de,x
$1e:d458  62 61 18	  per $ecbc
$1e:d45b  c3 30		 cmp $30,s
$1e:d45d  66 51		 ror $51
$1e:d45f  07 6a		 ora [$6a]
$1e:d461  cd 6a 36	  cmp $366a
$1e:d464  6f 53 22 d9   adc $d92253
$1e:d468  32 5a		 and ($5a)
$1e:d46a  6b			rtl
$1e:d46b  9c 10 21	  stz $2110
$1e:d46e  0c 63 10	  tsb $1063
$1e:d471  a5 1c		 lda $1c
$1e:d473  08			php
$1e:d474  2d 6b 39	  and $396b
$1e:d477  ef 45 94 5a   sbc $5a9445
$1e:d47b  f1 00		 sbc ($00),y
$1e:d47d  b9 0d 7c	  lda $7c0d,y
$1e:d480  16 5e		 asl $5e,x
$1e:d482  33 53		 and ($53,s),y
$1e:d484  22 d9 32 5c   jsl $5c32d9
$1e:d488  43 7b		 eor $7b,s
$1e:d48a  6f 41 1e 42   adc $421e41
$1e:d48e  08			php
$1e:d48f  c6 18		 dec $18
$1e:d491  4a			lsr a
$1e:d492  29 ef 3d	  and #$3def
$1e:d495  94 52		 sty $52,x
$1e:d497  18			clc
$1e:d498  63 9c		 adc $9c,s
$1e:d49a  73 86		 adc ($86,s),y
$1e:d49c  00 c8		 brk #$c8
$1e:d49e  08			php
$1e:d49f  0a			asl a
$1e:d4a0  0d 4c 11	  ora $114c
$1e:d4a3  8e 19 f3	  stx $f319
$1e:d4a6  21 55		 and ($55,x)
$1e:d4a8  2a			rol a
$1e:d4a9  d9 32 00	  cmp $0032,y
$1e:d4ac  50 0c		 bvc $d4ba
$1e:d4ae  00 92		 brk #$92
$1e:d4b0  10 38		 bpl $d4ea
$1e:d4b2  25 fc		 and $fc
$1e:d4b4  3d de 5a	  and $5ade,x
$1e:d4b7  ff 7f e3 19   sbc $19e37f,x
$1e:d4bb  e0 3e 95	  cpx #$953e
$1e:d4be  47 90		 eor [$90]
$1e:d4c0  00 96		 brk #$96
$1e:d4c2  01 9c		 ora ($9c,x)
$1e:d4c4  16 43		 asl $43,x
$1e:d4c6  04 0e		 tsb $0e
$1e:d4c8  08			php
$1e:d4c9  16 14		 asl $14,x
$1e:d4cb  4f 41 22 00   eor $002241
$1e:d4cf  09 0c 0c	  ora #$0c0c
$1e:d4d2  1c ad 35	  trb $35ad
$1e:d4d5  10 42		 bpl $d519
$1e:d4d7  73 4e		 adc ($4e,s),y
$1e:d4d9  b4 52		 ldy $52,x
$1e:d4db  64 00		 stz $00
$1e:d4dd  cb			wai
$1e:d4de  00 2f		 brk #$2f
$1e:d4e0  01 b4		 ora ($b4,x)
$1e:d4e2  01 9c		 ora ($9c,x)
$1e:d4e4  02 a7		 cop #$a7
$1e:d4e6  08			php
$1e:d4e7  e9 08 2c	  sbc #$2c08
$1e:d4ea  0d aa 28	  ora $28aa
$1e:d4ed  22 00 41 08   jsl $084100
$1e:d4f1  a5 1c		 lda $1c
$1e:d4f3  6b			rtl
$1e:d4f4  35 ce		 and $ce,x
$1e:d4f6  41 52		 eor ($52,x)
$1e:d4f8  4e b5 5a	  lsr $5ab5
$1e:d4fb  64 00		 stz $00
$1e:d4fd  c8			iny
$1e:d4fe  08			php
$1e:d4ff  0a			asl a
$1e:d500  09 6e 0d	  ora #$0d6e
$1e:d503  d0 19		 bne $d51e
$1e:d505  02 19		 cop #$19
$1e:d507  83 21		 sta $21,s
$1e:d509  04 32		 tsb $32
$1e:d50b  c6 18		 dec $18
$1e:d50d  8c 18 d0	  sty $d018
$1e:d510  28			plp
$1e:d511  46 32		 lsr $32
$1e:d513  25 1a		 and $1a
$1e:d515  02 19		 cop #$19
$1e:d517  83 21		 sta $21,s
$1e:d519  04 32		 tsb $32
$1e:d51b  64 00		 stz $00
$1e:d51d  c8			iny
$1e:d51e  08			php
$1e:d51f  0a			asl a
$1e:d520  09 6e 0d	  ora #$0d6e
$1e:d523  67 10		 adc [$10]
$1e:d525  69 14 4b	  adc #$4b14
$1e:d528  28			plp
$1e:d529  42 04		 wdm #$04
$1e:d52b  00 60		 brk #$60
$1e:d52d  66 28		 ror $28
$1e:d52f  a8			tay
$1e:d530  30 eb		 bmi $d51d
$1e:d532  3c 76 3d	  bit $3d76,x
$1e:d535  ed 4d d2	  sbc $d24d
$1e:d538  66 e5		 ror $e5
$1e:d53a  4c 20 65	  jmp $6520
$1e:d53d  80 75		 bra $d5b4
$1e:d53f  e0 7d cb	  cpx #$cb7d
$1e:d542  7e 8c 01	  ror $018c,x
$1e:d545  c3 21		 cmp $21,s
$1e:d547  84 36		 sty $36
$1e:d549  43 00		 eor $00,s
$1e:d54b  0e 38 c8	  asl $c838
$1e:d54e  08			php
$1e:d54f  41 08		 eor ($08,x)
$1e:d551  0a			asl a
$1e:d552  09 41 0c	  ora #$0c41
$1e:d555  83 14		 sta $14,s
$1e:d557  c5 1c		 cmp $1c
$1e:d559  07 25		 ora [$25]
$1e:d55b  84 08		 sty $08
$1e:d55d  e7 18		 sbc [$18]
$1e:d55f  29 21 6b	  and #$6b21
$1e:d562  29 ce 35	  and #$35ce
$1e:d565  06 08		 asl $08
$1e:d567  09 0c 0c	  ora #$0c0c
$1e:d56a  1c 4d 01	  trb $014d
$1e:d56d  a5 18		 lda $18
$1e:d56f  08			php
$1e:d570  21 6b		 and ($6b,x)
$1e:d572  31 ce		 and ($ce),y
$1e:d574  3d 7f 18	  and $187f,x
$1e:d577  bf 28 43 04   lda $044328,x
$1e:d57b  65 08		 adc $08
$1e:d57d  88			dey
$1e:d57e  0c cb 14	  tsb $14cb
$1e:d581  0e 1d 71	  asl $711d
$1e:d584  25 06		 and $06
$1e:d586  08			php
$1e:d587  09 0c 0c	  ora #$0c0c
$1e:d58a  1c 00 50	  trb $5000
$1e:d58d  0c 00 92	  tsb $9200
$1e:d590  10 38		 bpl $d5ca
$1e:d592  25 fc		 and $fc
$1e:d594  3d de 5a	  and $5ade,x
$1e:d597  ff 7f e3 19   sbc $19e37f,x
$1e:d59b  e0 3e 95	  cpx #$953e
$1e:d59e  47 90		 eor [$90]
$1e:d5a0  00 96		 brk #$96
$1e:d5a2  01 9c		 ora ($9c,x)
$1e:d5a4  16 43		 asl $43,x
$1e:d5a6  04 0e		 tsb $0e
$1e:d5a8  08			php
$1e:d5a9  16 14		 asl $14,x
$1e:d5ab  47 1c		 eor [$1c]
$1e:d5ad  22 04 83 08   jsl $088304
$1e:d5b1  e6 10		 inc $10
$1e:d5b3  47 11		 eor [$11]
$1e:d5b5  c8			iny
$1e:d5b6  19 2a 26	  ora $262a,y
$1e:d5b9  69 18 ac	  adc #$ac18
$1e:d5bc  20 0f 2d	  jsr $2d0f
$1e:d5bf  93 3d		 sta ($3d,s),y
$1e:d5c1  f6 49		 inc $49,x
$1e:d5c3  45 00		 eor $00
$1e:d5c5  a8			tay
$1e:d5c6  08			php
$1e:d5c7  e9 08 4b	  sbc #$4b08
$1e:d5ca  0d aa 28	  ora $28aa
$1e:d5cd  22 04 42 0c   jsl $0c4204
$1e:d5d1  83 14		 sta $14,s
$1e:d5d3  e7 20		 sbc [$20]
$1e:d5d5  4a			lsr a
$1e:d5d6  31 8c		 and ($8c),y
$1e:d5d8  35 64		 and $64,x
$1e:d5da  00 a7		 brk #$a7
$1e:d5dc  08			php
$1e:d5dd  e9 08 2c	  sbc #$2c08
$1e:d5e0  0d 6d 19	  ora $196d
$1e:d5e3  c4 10		 cpy $10
$1e:d5e5  06 11		 asl $11
$1e:d5e7  47 19		 eor [$19]
$1e:d5e9  8a			txa
$1e:d5ea  25 6b		 and $6b
$1e:d5ec  2d 22 04	  and $0422
$1e:d5ef  ab			plb
$1e:d5f0  00 30		 brk #$30
$1e:d5f2  01 b6		 ora ($b6,x)
$1e:d5f4  01 9d		 ora ($9d,x)
$1e:d5f6  02 3e		 cop #$3e
$1e:d5f8  27 00		 and [$00]
$1e:d5fa  24 a0		 bit $a0
$1e:d5fc  38			sec
$1e:d5fd  00 4d		 brk #$4d
$1e:d5ff  c5 6d		 cmp $6d
$1e:d601  69 7a e6	  adc #$e67a
$1e:d604  10 47		 bpl $d64d
$1e:d606  11 c8		 ora ($c8),y
$1e:d608  19 2a 26	  ora $262a,y
$1e:d60b  ad 35 86	  lda $8635
$1e:d60e  08			php
$1e:d60f  c8			iny
$1e:d610  0c 2b 15	  tsb $152b
$1e:d613  ae 1d e3	  ldx $e31d
$1e:d616  19 25 1a	  ora $1a25,y
$1e:d619  00 24		 brk #$24
$1e:d61b  a0 38 00	  ldy #$0038
$1e:d61e  4d c5 6d	  eor $6dc5
$1e:d621  2b			pld
$1e:d622  77 c0		 adc [$c0],y
$1e:d624  00 40		 brk #$40
$1e:d626  01 a5		 ora ($a5,x)
$1e:d628  1d 22 04	  ora $0422,x
$1e:d62b  84 10		 sty $10
$1e:d62d  84 14		 sty $14
$1e:d62f  c6 1c		 dec $1c
$1e:d631  29 29 8c	  and #$8c29
$1e:d634  35 ef		 and $ef,x
$1e:d636  41 73		 eor ($73,x)
$1e:d638  52 b0		 eor ($b0)
$1e:d63a  2c 36 3d	  bit $3d36
$1e:d63d  fc 55 ff	  jsr ($ff55,x)
$1e:d640  76 bf		 ror $bf,x
$1e:d642  7f 67 04 44   adc $440467,x
$1e:d646  08			php
$1e:d647  ff 7f ff 7f   sbc $7fff7f,x
$1e:d64b  00 60		 brk #$60
$1e:d64d  22 04 05 00   jsl $000504
$1e:d651  4a			lsr a
$1e:d652  00 12		 brk #$12
$1e:d654  00 17		 brk #$17
$1e:d656  00 1c		 brk #$1c
$1e:d658  00 69		 brk #$69
$1e:d65a  18			clc
$1e:d65b  ac 20 0f	  ldy $0f20
$1e:d65e  2d 93 3d	  and $3d93
$1e:d661  f6 49		 inc $49,x
$1e:d663  45 00		 eor $00
$1e:d665  84 14		 sty $14
$1e:d667  c6 1c		 dec $1c
$1e:d669  29 29 00	  and #$0029
$1e:d66c  50 0c		 bvc $d67a
$1e:d66e  00 92		 brk #$92
$1e:d670  10 38		 bpl $d6aa
$1e:d672  25 fc		 and $fc
$1e:d674  3d de 5a	  and $5ade,x
$1e:d677  ff 7f e3 19   sbc $19e37f,x
$1e:d67b  e0 3e 95	  cpx #$953e
$1e:d67e  47 90		 eor [$90]
$1e:d680  00 96		 brk #$96
$1e:d682  01 9c		 ora ($9c,x)
$1e:d684  16 43		 asl $43,x
$1e:d686  04 0e		 tsb $0e
$1e:d688  08			php
$1e:d689  16 14		 asl $14,x
$1e:d68b  47 1c		 eor [$1c]
$1e:d68d  22 04 a2 04   jsl $04a204
$1e:d691  03 0d		 ora $0d,s
$1e:d693  84 11		 sty $11
$1e:d695  65 16		 adc $16
$1e:d697  e6 1a		 inc $1a
$1e:d699  6a			ror a
$1e:d69a  0c 8e 10	  tsb $108e
$1e:d69d  b2 14		 lda ($14)
$1e:d69f  16 21		 asl $21,x
$1e:d6a1  99 31 45	  sta $4531,y
$1e:d6a4  00 a8		 brk #$a8
$1e:d6a6  08			php
$1e:d6a7  e9 08 4b	  sbc #$4b08
$1e:d6aa  0d e5 1d	  ora $1de5
$1e:d6ad  22 04 89 24   jsl $248904
$1e:d6b1  8b			phb
$1e:d6b2  20 ae 2c	  jsr $2cae
$1e:d6b5  ee 30 89	  inc $8930
$1e:d6b8  24 00		 bit $00
$1e:d6ba  2c a0 40	  bit $40a0
$1e:d6bd  00 51		 brk #$51
$1e:d6bf  c5 6d		 cmp $6d
$1e:d6c1  66 76		 ror $76
$1e:d6c3  20 01 a0	  jsr $a001
$1e:d6c6  01 65		 ora ($65,x)
$1e:d6c8  16 e6		 asl $e6,x
$1e:d6ca  1a			inc a
$1e:d6cb  40			rti
$1e:d6cc  29 c0 00	  and #$00c0
$1e:d6cf  40			rti
$1e:d6d0  01 a5		 ora ($a5,x)
$1e:d6d2  1d 29 19	  ora $1929,x
$1e:d6d5  8c 29 ce	  sty $ce29
$1e:d6d8  31 91		 and ($91),y
$1e:d6da  55 39		 eor $39,x
$1e:d6dc  16 46		 asl $46,x
$1e:d6de  18			clc
$1e:d6df  c9 28 2b	  cmp #$2b28
$1e:d6e2  41 6d		 eor ($6d,x)
$1e:d6e4  19 f1 11	  ora $11f1,y
$1e:d6e7  54 2a b6	  mvn $b6,$2a
$1e:d6ea  3a			dec a
$1e:d6eb  ad 35 86	  lda $8635
$1e:d6ee  08			php
$1e:d6ef  c8			iny
$1e:d6f0  0c 2b 15	  tsb $152b
$1e:d6f3  cf 1d 65 16   cmp $16651d
$1e:d6f7  46 1f		 lsr $1f
$1e:d6f9  00 24		 brk #$24
$1e:d6fb  a0 38 00	  ldy #$0038
$1e:d6fe  4d c5 6d	  eor $6dc5
$1e:d701  2b			pld
$1e:d702  77 20		 adc [$20],y
$1e:d704  01 a0		 ora ($a0,x)
$1e:d706  01 65		 ora ($65,x)
$1e:d708  16 22		 asl $22,x
$1e:d70a  04 29		 tsb $29
$1e:d70c  25 84		 and $84
$1e:d70e  14 c6		 trb $c6
$1e:d710  1c 29 29	  trb $2929
$1e:d713  8c 35 ef	  sty $ef35
$1e:d716  41 73		 eor ($73,x)
$1e:d718  52 05		 eor ($05)
$1e:d71a  00 68		 brk #$68
$1e:d71c  08			php
$1e:d71d  8b			phb
$1e:d71e  08			php
$1e:d71f  ee 10 32	  inc $3210
$1e:d722  1d 20 01	  ora $0120,x
$1e:d725  a0 01 65	  ldy #$6501
$1e:d728  16 2b		 asl $2b,x
$1e:d72a  15 00		 ora $00,x
$1e:d72c  60			rts
$1e:d72d  84 14		 sty $14
$1e:d72f  8c 35 ef	  sty $ef35
$1e:d732  41 73		 eor ($73,x)
$1e:d734  52 ee		 eor ($ee)
$1e:d736  1c b5 31	  trb $31b5
$1e:d739  85 00		 sta $00
$1e:d73b  e9 08 2c	  sbc #$2c08
$1e:d73e  09 8f 11	  ora #$118f
$1e:d741  12 1e		 ora ($1e)
$1e:d743  20 01 a0	  jsr $a001
$1e:d746  01 65		 ora ($65,x)
$1e:d748  16 ff		 asl $ff,x
$1e:d74a  7f 70 10 0c   adc $0c1070,x
$1e:d74e  00 92		 brk #$92
$1e:d750  10 38		 bpl $d78a
$1e:d752  25 fc		 and $fc
$1e:d754  3d de 5a	  and $5ade,x
$1e:d757  ff 7f e3 19   sbc $19e37f,x
$1e:d75b  e0 3e 95	  cpx #$953e
$1e:d75e  47 90		 eor [$90]
$1e:d760  00 96		 brk #$96
$1e:d762  01 9c		 ora ($9c,x)
$1e:d764  16 00		 asl $00,x
$1e:d766  00 0e		 brk #$0e
$1e:d768  08			php
$1e:d769  16 14		 asl $14,x
$1e:d76b  00 50		 brk #$50
$1e:d76d  21 04		 and ($04,x)
$1e:d76f  63 0c		 adc $0c,s
$1e:d771  84 10		 sty $10
$1e:d773  c6 18		 dec $18
$1e:d775  08			php
$1e:d776  21 4a		 and ($4a,x)
$1e:d778  29 8c 31	  and #$318c
$1e:d77b  88			dey
$1e:d77c  04 0f		 tsb $0f
$1e:d77e  01 d4		 ora ($d4,x)
$1e:d780  09 58 12	  ora #$1258
$1e:d783  27 49		 and [$49]
$1e:d785  69 59 ab	  adc #$ab59
$1e:d788  61 ed		 adc ($ed,x)
$1e:d78a  71 80		 adc ($80),y
$1e:d78c  03 42		 ora $42,s
$1e:d78e  08			php
$1e:d78f  c6 18		 dec $18
$1e:d791  4a			lsr a
$1e:d792  29 ef 3d	  and #$3def
$1e:d795  94 52		 sty $52,x
$1e:d797  18			clc
$1e:d798  63 9c		 adc $9c,s
$1e:d79a  73 f1		 adc ($f1,s),y
$1e:d79c  00 b9		 brk #$b9
$1e:d79e  0d 7c 16	  ora $167c
$1e:d7a1  5e 33 10	  lsr $1033,x
$1e:d7a4  42 94		 wdm #$94
$1e:d7a6  52 18		 eor ($18)
$1e:d7a8  63 9e		 adc $9e,s
$1e:d7aa  25 57		 and $57
$1e:d7ac  15 4a		 ora $4a,x
$1e:d7ae  00 f1		 brk #$f1
$1e:d7b0  00 b9		 brk #$b9
$1e:d7b2  0d 7c 16	  ora $167c
$1e:d7b5  5e 33 10	  lsr $1033,x
$1e:d7b8  42 94		 wdm #$94
$1e:d7ba  52 18		 eor ($18)
$1e:d7bc  63 08		 adc $08,s
$1e:d7be  21 6b		 and ($6b,x)
$1e:d7c0  2d ce 39	  and $39ce
$1e:d7c3  31 46		 and ($46),y
$1e:d7c5  94 52		 sty $52,x
$1e:d7c7  f7 5e		 sbc [$5e],y
$1e:d7c9  5a			phy
$1e:d7ca  6b			rtl
$1e:d7cb  93 34		 sta ($34,s),y
$1e:d7cd  05 00		 ora $00
$1e:d7cf  0c 00 52	  tsb $5200
$1e:d7d2  10 f8		 bpl $d7cc
$1e:d7d4  30 fc		 bmi $d7d2
$1e:d7d6  55 de		 eor $de,x
$1e:d7d8  62 61 18	  per $f03c
$1e:d7db  c3 30		 cmp $30,s
$1e:d7dd  66 51		 ror $51
$1e:d7df  07 6a		 ora [$6a]
$1e:d7e1  cd 6a 36	  cmp $366a
$1e:d7e4  6f 10 42 94   adc $944210
$1e:d7e8  52 5a		 eor ($5a)
$1e:d7ea  6b			rtl
$1e:d7eb  9c 10 21	  stz $2110
$1e:d7ee  0c 63 10	  tsb $1063
$1e:d7f1  a5 1c		 lda $1c
$1e:d7f3  08			php
$1e:d7f4  2d 6b 39	  and $396b
$1e:d7f7  ef 45 94 5a   sbc $5a9445
$1e:d7fb  f1 00		 sbc ($00),y
$1e:d7fd  b9 0d 7c	  lda $7c0d,y
$1e:d800  16 5e		 asl $5e,x
$1e:d802  33 10		 and ($10,s),y
$1e:d804  42 94		 wdm #$94
$1e:d806  52 18		 eor ($18)
$1e:d808  63 7b		 adc $7b,s
$1e:d80a  6f 41 1e 42   adc $421e41
$1e:d80e  08			php
$1e:d80f  c6 18		 dec $18
$1e:d811  4a			lsr a
$1e:d812  29 ef 3d	  and #$3def
$1e:d815  94 52		 sty $52,x
$1e:d817  18			clc
$1e:d818  63 9c		 adc $9c,s
$1e:d81a  73 21		 adc ($21,s),y
$1e:d81c  04 63		 tsb $63
$1e:d81e  0c 84 10	  tsb $1084
$1e:d821  c6 18		 dec $18
$1e:d823  08			php
$1e:d824  21 4a		 and ($4a,x)
$1e:d826  29 8c 31	  and #$318c
$1e:d829  ef 3d 00 50   sbc $50003d
$1e:d82d  0c 00 92	  tsb $9200
$1e:d830  10 38		 bpl $d86a
$1e:d832  25 fc		 and $fc
$1e:d834  3d de 5a	  and $5ade,x
$1e:d837  ff 7f e3 19   sbc $19e37f,x
$1e:d83b  e0 3e 95	  cpx #$953e
$1e:d83e  47 90		 eor [$90]
$1e:d840  00 96		 brk #$96
$1e:d842  01 9c		 ora ($9c,x)
$1e:d844  16 00		 asl $00,x
$1e:d846  00 0e		 brk #$0e
$1e:d848  08			php
$1e:d849  16 14		 asl $14,x
$1e:d84b  00 6c		 brk #$6c
$1e:d84d  43 08		 eor $08,s
$1e:d84f  a6 14		 ldx $14
$1e:d851  09 21 8d	  ora #$8d21
$1e:d854  31 f0		 and ($f0),y
$1e:d856  3d 53 4a	  and $4a53,x
$1e:d859  b6 56		 ldx $56,y
$1e:d85b  3a			dec a
$1e:d85c  63 6c		 adc $6c,s
$1e:d85e  04 d0		 tsb $d0
$1e:d860  0c 14 09	  tsb $0914
$1e:d863  98			tya
$1e:d864  0d fb 11	  ora $11fb
$1e:d867  32 11		 and ($11)
$1e:d869  b4 1d		 ldy $1d,x
$1e:d86b  00 50		 brk #$50
$1e:d86d  23 08		 and $08,s
$1e:d86f  47 0c		 eor [$0c]
$1e:d871  8b			phb
$1e:d872  14 ce		 trb $ce
$1e:d874  1c 11 25	  trb $2511
$1e:d877  54 31 96	  mvn $96,$31
$1e:d87a  39 18 42	  and $4218,y
$1e:d87d  84 10		 sty $10
$1e:d87f  c6 18		 dec $18
$1e:d881  29 25 8c	  and #$8c25
$1e:d884  31 ef		 and ($ef),y
$1e:d886  3d 52 4a	  and $4a52,x
$1e:d889  f7 5e		 sbc [$5e],y
$1e:d88b  40			rti
$1e:d88c  28			plp
$1e:d88d  43 00		 eor $00,s
$1e:d88f  a6 08		 ldx $08
$1e:d891  09 11 8d	  ora #$8d11
$1e:d894  1d f0 2d	  ora $2df0,x
$1e:d897  53 3a		 eor ($3a,s),y
$1e:d899  b6 42		 ldx $42,y
$1e:d89b  1a			inc a
$1e:d89c  53 44		 eor ($44,s),y
$1e:d89e  00 67		 brk #$67
$1e:d8a0  08			php
$1e:d8a1  aa			tax
$1e:d8a2  0c cc 10	  tsb $10cc
$1e:d8a5  0e 15 50	  asl $5015
$1e:d8a8  1d 92 21	  ora $2192,x
$1e:d8ab  f0 40		 beq $d8ed
$1e:d8ad  43 00		 eor $00,s
$1e:d8af  a6 08		 ldx $08
$1e:d8b1  09 11 8d	  ora #$8d11
$1e:d8b4  1d f0 2d	  ora $2df0,x
$1e:d8b7  53 3a		 eor ($3a,s),y
$1e:d8b9  b6 42		 ldx $42,y
$1e:d8bb  1a			inc a
$1e:d8bc  53 62		 eor ($62,s),y
$1e:d8be  08			php
$1e:d8bf  a4 0c		 ldy $0c
$1e:d8c1  e5 10		 sbc $10
$1e:d8c3  27 15		 and [$15]
$1e:d8c5  68			pla
$1e:d8c6  1d ca 21	  ora $21ca,x
$1e:d8c9  0d 2a 4a	  ora $4a2a
$1e:d8cc  29 42 0c	  and #$0c42
$1e:d8cf  83 14		 sta $14,s
$1e:d8d1  c4 20		 cpy $20
$1e:d8d3  05 29		 ora $29
$1e:d8d5  46 31		 lsr $31
$1e:d8d7  a8			tay
$1e:d8d8  41 c2		 eor ($c2,x)
$1e:d8da  00 23		 brk #$23
$1e:d8dc  05 a4		 ora $a4
$1e:d8de  09 45 0e	  ora #$0e45
$1e:d8e1  a3 30		 lda $30,s
$1e:d8e3  27 3d		 and [$3d]
$1e:d8e5  cc 4d 2e	  cpy $2e4d
$1e:d8e8  52 b3		 eor ($b3)
$1e:d8ea  62 00 60	  per $38ed
$1e:d8ed  42 0c		 wdm #$0c
$1e:d8ef  83 14		 sta $14,s
$1e:d8f1  c4 20		 cpy $20
$1e:d8f3  05 29		 ora $29
$1e:d8f5  46 31		 lsr $31
$1e:d8f7  80 34		 bra $d92d
$1e:d8f9  c2 50		 rep #$50
$1e:d8fb  04 55		 tsb $55
$1e:d8fd  c2 50		 rep #$50
$1e:d8ff  c2 50		 rep #$50
$1e:d901  c2 50		 rep #$50
$1e:d903  46 59		 lsr $59
$1e:d905  0c 7a 90	  tsb $907a
$1e:d908  7a			ply
$1e:d909  88			dey
$1e:d90a  65 c6		 adc $c6
$1e:d90c  30 0c		 bmi $d91a
$1e:d90e  00 92		 brk #$92
$1e:d910  10 38		 bpl $d94a
$1e:d912  25 fc		 and $fc
$1e:d914  3d de 5a	  and $5ade,x
$1e:d917  ff 7f e3 19   sbc $19e37f,x
$1e:d91b  e0 3e 95	  cpx #$953e
$1e:d91e  47 90		 eor [$90]
$1e:d920  00 96		 brk #$96
$1e:d922  01 9c		 ora ($9c,x)
$1e:d924  16 00		 asl $00,x
$1e:d926  00 0e		 brk #$0e
$1e:d928  08			php
$1e:d929  16 14		 asl $14,x
$1e:d92b  8c 31 21	  sty $2131
$1e:d92e  10 85		 bpl $d8b5
$1e:d930  18			clc
$1e:d931  c8			iny
$1e:d932  20 2c 29	  jsr $292c
$1e:d935  90 29		 bcc $d960
$1e:d937  f4 29 79	  pea $7929
$1e:d93a  2e 3f 37	  rol $373f
$1e:d93d  05 41		 ora $41
$1e:d93f  88			dey
$1e:d940  55 6d		 eor $6d,x
$1e:d942  6a			ror a
$1e:d943  33 7b		 and ($7b,s),y
$1e:d945  8c 15 54	  sty $5415
$1e:d948  22 9d 3b 00   jsl $003b9d
$1e:d94c  50 03		 bvc $d951
$1e:d94e  00 24		 brk #$24
$1e:d950  04 48		 tsb $48
$1e:d952  08			php
$1e:d953  89 10 ca	  bit #$ca10
$1e:d956  18			clc
$1e:d957  0e 21 70	  asl $7021
$1e:d95a  2d 00 04	  and $0400
$1e:d95d  01 08		 ora ($08,x)
$1e:d95f  02 0c		 cop #$0c
$1e:d961  23 10		 and $10,s
$1e:d963  44 14 65	  mvp $65,$14
$1e:d966  18			clc
$1e:d967  00 00		 brk #$00
$1e:d969  b2 35		 lda ($35)
$1e:d96b  40			rti
$1e:d96c  28			plp
$1e:d96d  00 04		 brk #$04
$1e:d96f  20 0c 62	  jsr $620c
$1e:d972  18			clc
$1e:d973  a4 20		 ldy $20
$1e:d975  e5 24		 sbc $24
$1e:d977  48			pha
$1e:d978  29 cc 35	  and #$35cc
$1e:d97b  63 0c		 adc $0c,s
$1e:d97d  c6 18		 dec $18
$1e:d97f  4a			lsr a
$1e:d980  29 ce 39	  and #$39ce
$1e:d983  52 4a		 eor ($4a)
$1e:d985  d6 5a		 dec $5a,x
$1e:d987  00 00		 brk #$00
$1e:d989  5a			phy
$1e:d98a  6b			rtl
$1e:d98b  e6 65		 inc $65
$1e:d98d  00 04		 brk #$04
$1e:d98f  20 0c 62	  jsr $620c
$1e:d992  18			clc
$1e:d993  a4 20		 ldy $20
$1e:d995  e5 24		 sbc $24
$1e:d997  48			pha
$1e:d998  29 cc 35	  and #$35cc
$1e:d99b  44 04 87	  mvp $87,$04
$1e:d99e  08			php
$1e:d99f  cc 10 2e	  cpy $2e10
$1e:d9a2  19 b2 25	  ora $25b2,y
$1e:d9a5  56 36		 lsr $36,x
$1e:d9a7  1c 4b 4e	  trb $4e4b
$1e:d9aa  42 35		 wdm #$35
$1e:d9ac  14 02		 trb $02
$1e:d9ae  00 25		 brk #$25
$1e:d9b0  00 68		 brk #$68
$1e:d9b2  04 aa		 tsb $aa
$1e:d9b4  08			php
$1e:d9b5  0e 19 92	  asl $9219
$1e:d9b8  25 16		 and $16
$1e:d9ba  2e 63 0c	  rol $0c63
$1e:d9bd  a5 14		 lda $14
$1e:d9bf  e7 1c		 sbc [$1c]
$1e:d9c1  29 25 8c	  and #$8c25
$1e:d9c4  31 ef		 and ($ef),y
$1e:d9c6  3d 00 00	  and $0000,x
$1e:d9c9  9e 2a 00	  stz $002a,x
$1e:d9cc  60			rts
$1e:d9cd  00 00		 brk #$00
$1e:d9cf  20 00 41	  jsr $4100
$1e:d9d2  04 82		 tsb $82
$1e:d9d4  0c c4 18	  tsb $18c4
$1e:d9d7  05 29		 ora $29
$1e:d9d9  68			pla
$1e:d9da  39 24 00	  and $0024,y
$1e:d9dd  67 08		 adc [$08]
$1e:d9df  ce 14 32	  dec $3214
$1e:d9e2  25 97		 and $97
$1e:d9e4  31 1a		 and ($1a),y
$1e:d9e6  42 00		 wdm #$00
$1e:d9e8  00 ca		 brk #$ca
$1e:d9ea  49 c6 30	  eor #$30c6
$1e:d9ed  0c 00 92	  tsb $9200
$1e:d9f0  10 38		 bpl $da2a
$1e:d9f2  25 fc		 and $fc
$1e:d9f4  3d de 5a	  and $5ade,x
$1e:d9f7  ff 7f e3 19   sbc $19e37f,x
$1e:d9fb  e0 3e 95	  cpx #$953e
$1e:d9fe  47 90		 eor [$90]
$1e:da00  00 96		 brk #$96
$1e:da02  01 9c		 ora ($9c,x)
$1e:da04  16 00		 asl $00,x
$1e:da06  00 0e		 brk #$0e
$1e:da08  08			php
$1e:da09  16 14		 asl $14,x
$1e:da0b  8c 31 02	  sty $0231
$1e:da0e  00 04		 brk #$04
$1e:da10  00 26		 brk #$26
$1e:da12  04 67		 tsb $67
$1e:da14  0c a9 14	  tsb $14a9
$1e:da17  eb			xba
$1e:da18  1c 2d 25	  trb $252d
$1e:da1b  40			rti
$1e:da1c  00 a0		 brk #$a0
$1e:da1e  00 20		 brk #$20
$1e:da20  15 a0		 ora $a0,x
$1e:da22  1d 00 2e	  ora $2e00,x
$1e:da25  80 36		 bra $da5d
$1e:da27  00 00		 brk #$00
$1e:da29  b2 35		 lda ($35)
$1e:da2b  00 50		 brk #$50
$1e:da2d  08			php
$1e:da2e  21 6b		 and ($6b,x)
$1e:da30  2d 03 00	  and $0003
$1e:da33  24 04		 bit $04
$1e:da35  66 0c		 ror $0c
$1e:da37  a9 14 ea	  lda #$ea14
$1e:da3a  1c 00 04	  trb $0400
$1e:da3d  01 08		 ora ($08,x)
$1e:da3f  02 0c		 cop #$0c
$1e:da41  23 10		 and $10,s
$1e:da43  44 14 65	  mvp $65,$14
$1e:da46  18			clc
$1e:da47  00 00		 brk #$00
$1e:da49  0e 21 40	  asl $4021
$1e:da4c  28			plp
$1e:da4d  00 04		 brk #$04
$1e:da4f  20 10 62	  jsr $6210
$1e:da52  18			clc
$1e:da53  a4 24		 ldy $24
$1e:da55  e6 30		 inc $30
$1e:da57  48			pha
$1e:da58  3d cc 49	  and $49cc,x
$1e:da5b  63 0c		 adc $0c,s
$1e:da5d  c6 18		 dec $18
$1e:da5f  4a			lsr a
$1e:da60  29 ce 39	  and #$39ce
$1e:da63  52 4a		 eor ($4a)
$1e:da65  d6 5a		 dec $5a,x
$1e:da67  50 52		 bvc $dabb
$1e:da69  5a			phy
$1e:da6a  6b			rtl
$1e:da6b  e6 65		 inc $65
$1e:da6d  64 08		 stz $08
$1e:da6f  c8			iny
$1e:da70  14 2b		 trb $2b
$1e:da72  21 8e		 and ($8e,x)
$1e:da74  29 f2 35	  and #$35f2
$1e:da77  53 46		 eor ($46,s),y
$1e:da79  d6 5a		 dec $5a,x
$1e:da7b  44 04 87	  mvp $87,$04
$1e:da7e  08			php
$1e:da7f  cc 10 2e	  cpy $2e10
$1e:da82  19 b2 25	  ora $25b2,y
$1e:da85  56 36		 lsr $36,x
$1e:da87  22 00 39 67   jsl $673900
$1e:da8b  35 14		 and $14,x
$1e:da8d  02 00		 cop #$00
$1e:da8f  25 00		 and $00
$1e:da91  68			pla
$1e:da92  04 aa		 tsb $aa
$1e:da94  08			php
$1e:da95  0e 19 92	  asl $9219
$1e:da98  25 16		 and $16
$1e:da9a  2e 63 0c	  rol $0c63
$1e:da9d  a5 14		 lda $14
$1e:da9f  e7 1c		 sbc [$1c]
$1e:daa1  29 25 8c	  and #$8c25
$1e:daa4  31 ef		 and ($ef),y
$1e:daa6  3d 00 00	  and $0000,x
$1e:daa9  9e 2a 00	  stz $002a,x
$1e:daac  60			rts
$1e:daad  42 08		 wdm #$08
$1e:daaf  84 10		 sty $10
$1e:dab1  c6 18		 dec $18
$1e:dab3  08			php
$1e:dab4  21 6b		 and ($6b,x)
$1e:dab6  2d ef 3d	  and $3def
$1e:dab9  73 4e		 adc ($4e,s),y
$1e:dabb  00 08		 brk #$08
$1e:dabd  20 10 62	  jsr $6210
$1e:dac0  18			clc
$1e:dac1  a4 24		 ldy $24
$1e:dac3  e5 30		 sbc $30
$1e:dac5  6a			ror a
$1e:dac6  3d 00 00	  and $0000,x
$1e:dac9  0e 52 c6	  asl $c652
$1e:dacc  30 0c		 bmi $dada
$1e:dace  00 92		 brk #$92
$1e:dad0  10 38		 bpl $db0a
$1e:dad2  25 fc		 and $fc
$1e:dad4  3d de 5a	  and $5ade,x
$1e:dad7  ff 7f e3 19   sbc $19e37f,x
$1e:dadb  e0 3e 95	  cpx #$953e
$1e:dade  47 90		 eor [$90]
$1e:dae0  00 96		 brk #$96
$1e:dae2  01 9c		 ora ($9c,x)
$1e:dae4  16 00		 asl $00,x
$1e:dae6  00 0e		 brk #$0e
$1e:dae8  08			php
$1e:dae9  16 14		 asl $14,x
$1e:daeb  8c 31 01	  sty $0131
$1e:daee  08			php
$1e:daef  02 0c		 cop #$0c
$1e:daf1  24 14		 bit $14
$1e:daf3  66 1c		 ror $1c
$1e:daf5  a7 20		 lda [$20]
$1e:daf7  e9 2c 2b	  sbc #$2b2c
$1e:dafa  35 be		 and $be,x
$1e:dafc  02 00		 cop #$00
$1e:dafe  18			clc
$1e:daff  40			rti
$1e:db00  30 c0		 bmi $dac2
$1e:db02  40			rti
$1e:db03  40			rti
$1e:db04  59 c0 69	  eor $69c0,y
$1e:db07  00 00		 brk #$00
$1e:db09  c0 7a 00	  cpy #$007a
$1e:db0c  50 08		 bvc $db16
$1e:db0e  21 6b		 and ($6b,x)
$1e:db10  2d 03 00	  and $0003
$1e:db13  24 04		 bit $04
$1e:db15  66 0c		 ror $0c
$1e:db17  a9 14 ea	  lda #$ea14
$1e:db1a  1c 00 04	  trb $0400
$1e:db1d  01 08		 ora ($08,x)
$1e:db1f  02 0c		 cop #$0c
$1e:db21  23 10		 and $10,s
$1e:db23  44 14 65	  mvp $65,$14
$1e:db26  18			clc
$1e:db27  00 00		 brk #$00
$1e:db29  0e 21 40	  asl $4021
$1e:db2c  28			plp
$1e:db2d  02 00		 cop #$00
$1e:db2f  24 04		 bit $04
$1e:db31  47 08		 eor [$08]
$1e:db33  88			dey
$1e:db34  10 ea		 bpl $db20
$1e:db36  1c 4e 29	  trb $294e
$1e:db39  d2 39		 cmp ($39)
$1e:db3b  63 0c		 adc $0c,s
$1e:db3d  c6 18		 dec $18
$1e:db3f  4a			lsr a
$1e:db40  29 ce 39	  and #$39ce
$1e:db43  52 4a		 eor ($4a)
$1e:db45  d6 5a		 dec $5a,x
$1e:db47  16 42		 asl $42,x
$1e:db49  5a			phy
$1e:db4a  6b			rtl
$1e:db4b  e6 65		 inc $65
$1e:db4d  64 08		 stz $08
$1e:db4f  c8			iny
$1e:db50  14 2b		 trb $2b
$1e:db52  21 8e		 and ($8e,x)
$1e:db54  29 f2 35	  and #$35f2
$1e:db57  53 46		 eor ($46,s),y
$1e:db59  d6 5a		 dec $5a,x
$1e:db5b  44 04 87	  mvp $87,$04
$1e:db5e  08			php
$1e:db5f  cc 10 2e	  cpy $2e10
$1e:db62  19 b2 25	  ora $25b2,y
$1e:db65  56 36		 lsr $36,x
$1e:db67  22 00 39 67   jsl $673900
$1e:db6b  35 14		 and $14,x
$1e:db6d  02 00		 cop #$00
$1e:db6f  25 00		 and $00
$1e:db71  68			pla
$1e:db72  04 aa		 tsb $aa
$1e:db74  08			php
$1e:db75  0e 19 92	  asl $9219
$1e:db78  25 16		 and $16
$1e:db7a  2e 63 0c	  rol $0c63
$1e:db7d  a5 14		 lda $14
$1e:db7f  e7 1c		 sbc [$1c]
$1e:db81  29 25 8c	  and #$8c25
$1e:db84  31 ef		 and ($ef),y
$1e:db86  3d 00 00	  and $0000,x
$1e:db89  9e 2a 00	  stz $002a,x
$1e:db8c  60			rts
$1e:db8d  42 08		 wdm #$08
$1e:db8f  84 10		 sty $10
$1e:db91  c6 18		 dec $18
$1e:db93  08			php
$1e:db94  21 6b		 and ($6b,x)
$1e:db96  2d ef 3d	  and $3def
$1e:db99  73 4e		 adc ($4e,s),y
$1e:db9b  02 00		 cop #$00
$1e:db9d  25 04		 and $04
$1e:db9f  48			pha
$1e:dba0  08			php
$1e:dba1  6a			ror a
$1e:dba2  0c ac 14	  tsb $14ac
$1e:dba5  10 21		 bpl $dbc8
$1e:dba7  00 00		 brk #$00
$1e:dba9  94 31		 sty $31,x
$1e:dbab  c6 30		 dec $30
$1e:dbad  0c 00 92	  tsb $9200
$1e:dbb0  10 38		 bpl $dbea
$1e:dbb2  25 fc		 and $fc
$1e:dbb4  3d de 5a	  and $5ade,x
$1e:dbb7  ff 7f e3 19   sbc $19e37f,x
$1e:dbbb  e0 3e 95	  cpx #$953e
$1e:dbbe  47 90		 eor [$90]
$1e:dbc0  00 96		 brk #$96
$1e:dbc2  01 9c		 ora ($9c,x)
$1e:dbc4  16 00		 asl $00,x
$1e:dbc6  00 0e		 brk #$0e
$1e:dbc8  08			php
$1e:dbc9  16 14		 asl $14,x
$1e:dbcb  8c 31 03	  sty $0331
$1e:dbce  00 24		 brk #$24
$1e:dbd0  04 48		 tsb $48
$1e:dbd2  08			php
$1e:dbd3  89 10 ca	  bit #$ca10
$1e:dbd6  18			clc
$1e:dbd7  0e 21 70	  asl $7021
$1e:dbda  2d be 02	  and $02be
$1e:dbdd  00 18		 brk #$18
$1e:dbdf  40			rti
$1e:dbe0  30 c0		 bmi $dba2
$1e:dbe2  40			rti
$1e:dbe3  40			rti
$1e:dbe4  59 c0 69	  eor $69c0,y
$1e:dbe7  00 00		 brk #$00
$1e:dbe9  c0 7a 00	  cpy #$007a
$1e:dbec  50 08		 bvc $dbf6
$1e:dbee  21 6b		 and ($6b,x)
$1e:dbf0  2d 03 00	  and $0003
$1e:dbf3  24 04		 bit $04
$1e:dbf5  66 0c		 ror $0c
$1e:dbf7  a9 14 ea	  lda #$ea14
$1e:dbfa  1c 00 00	  trb $0000
$1e:dbfd  21 04		 and ($04,x)
$1e:dbff  42 08		 wdm #$08
$1e:dc01  63 0c		 adc $0c,s
$1e:dc03  84 10		 sty $10
$1e:dc05  a5 14		 lda $14
$1e:dc07  00 00		 brk #$00
$1e:dc09  0e 21 40	  asl $4021
$1e:dc0c  28			plp
$1e:dc0d  00 00		 brk #$00
$1e:dc0f  22 04 43 08   jsl $084304
$1e:dc13  86 10		 stx $10
$1e:dc15  c7 18		 cmp [$18]
$1e:dc17  43 08		 eor $08,s
$1e:dc19  64 0c		 stz $0c
$1e:dc1b  86 10		 stx $10
$1e:dc1d  c7 18		 cmp [$18]
$1e:dc1f  e9 1c 0a	  sbc #$0a1c
$1e:dc22  21 4b		 and ($4b,x)
$1e:dc24  29 8d 31	  and #$318d
$1e:dc27  cf 39 11 42   cmp $421139
$1e:dc2b  e6 65		 inc $65
$1e:dc2d  46 00		 lsr $00
$1e:dc2f  8a			txa
$1e:dc30  08			php
$1e:dc31  ec 10 72	  cpx $7210
$1e:dc34  21 16		 and ($16,x)
$1e:dc36  2e 9c 3a	  rol $3a9c
$1e:dc39  fe 46 62	  inc $6246,x
$1e:dc3c  18			clc
$1e:dc3d  a4 24		 ldy $24
$1e:dc3f  e6 30		 inc $30
$1e:dc41  48			pha
$1e:dc42  3d cc 49	  and $49cc,x
$1e:dc45  4f 52 22 00   eor $002252
$1e:dc49  39 67 35	  and $3567,y
$1e:dc4c  14 02		 trb $02
$1e:dc4e  00 48		 brk #$48
$1e:dc50  08			php
$1e:dc51  89 10 ca	  bit #$ca10
$1e:dc54  18			clc
$1e:dc55  0e 21 70	  asl $7021
$1e:dc58  2d f2 3d	  and $3df2
$1e:dc5b  65 10		 adc $10
$1e:dc5d  e9 20 4c	  sbc #$4c20
$1e:dc60  2d d0 3d	  and $3dd0
$1e:dc63  54 4e d8	  mvn $d8,$4e
$1e:dc66  5e 00 00	  lsr $0000,x
$1e:dc69  5c 6f 00 60   jml $60006f
$1e:dc6d  63 0c		 adc $0c,s
$1e:dc6f  c6 18		 dec $18
$1e:dc71  29 25 8c	  and #$8c25
$1e:dc74  31 ef		 and ($ef),y
$1e:dc76  3d 94 52	  and $5294,x
$1e:dc79  5a			phy
$1e:dc7a  6b			rtl
$1e:dc7b  21 04		 and ($04,x)
$1e:dc7d  63 0c		 adc $0c,s
$1e:dc7f  a5 14		 lda $14
$1e:dc81  e7 1c		 sbc [$1c]
$1e:dc83  29 25 6b	  and #$6b25
$1e:dc86  2d 00 00	  and $0000
$1e:dc89  de 7b c6	  dec $c67b,x
$1e:dc8c  30 0c		 bmi $dc9a
$1e:dc8e  00 92		 brk #$92
$1e:dc90  10 38		 bpl $dcca
$1e:dc92  25 fc		 and $fc
$1e:dc94  3d de 5a	  and $5ade,x
$1e:dc97  ff 7f e3 19   sbc $19e37f,x
$1e:dc9b  e0 3e 95	  cpx #$953e
$1e:dc9e  47 90		 eor [$90]
$1e:dca0  00 96		 brk #$96
$1e:dca2  01 9c		 ora ($9c,x)
$1e:dca4  16 00		 asl $00,x
$1e:dca6  00 0e		 brk #$0e
$1e:dca8  08			php
$1e:dca9  16 14		 asl $14,x
$1e:dcab  8c 31 22	  sty $2231
$1e:dcae  08			php
$1e:dcaf  83 1c		 sta $1c,s
$1e:dcb1  05 29		 ora $29
$1e:dcb3  88			dey
$1e:dcb4  39 4d 52	  and $524d,y
$1e:dcb7  d2 62		 cmp ($62)
$1e:dcb9  54 73 66	  mvn $66,$73
$1e:dcbc  04 aa		 tsb $aa
$1e:dcbe  00 ee		 brk #$ee
$1e:dcc0  08			php
$1e:dcc1  30 11		 bmi $dcd4
$1e:dcc3  94 19		 sty $19,x
$1e:dcc5  d6 21		 dec $21,x
$1e:dcc7  00 00		 brk #$00
$1e:dcc9  d5 5b		 cmp $5b,x
$1e:dccb  60			rts
$1e:dccc  1e 22 08	  asl $0822,x
$1e:dccf  a3 1c		 lda $1c,s
$1e:dcd1  05 29		 ora $29
$1e:dcd3  68			pla
$1e:dcd4  39 4d 52	  and $524d,y
$1e:dcd7  d2 62		 cmp ($62)
$1e:dcd9  54 73 24	  mvn $24,$73
$1e:dcdc  00 67		 brk #$67
$1e:dcde  08			php
$1e:dcdf  aa			tax
$1e:dce0  10 ec		 bpl $dcce
$1e:dce2  18			clc
$1e:dce3  2f 21 92 2d   and $2d9221
$1e:dce7  f4 39 64	  pea $6439
$1e:dcea  14 40		 trb $40
$1e:dcec  28			plp
$1e:dced  00 00		 brk #$00
$1e:dcef  41 0c		 eor ($0c,x)
$1e:dcf1  a4 18		 ldy $18
$1e:dcf3  29 25 8c	  and #$8c25
$1e:dcf6  31 ef		 and ($ef),y
$1e:dcf8  3d 73 4e	  and $4e73,x
$1e:dcfb  66 04		 ror $04
$1e:dcfd  aa			tax
$1e:dcfe  00 ee		 brk #$ee
$1e:dd00  08			php
$1e:dd01  30 11		 bmi $dd14
$1e:dd03  94 19		 sty $19,x
$1e:dd05  d6 21		 dec $21,x
$1e:dd07  00 00		 brk #$00
$1e:dd09  37 67		 and [$67],y
$1e:dd0b  e6 65		 inc $65
$1e:dd0d  00 04		 brk #$04
$1e:dd0f  20 0c 62	  jsr $620c
$1e:dd12  18			clc
$1e:dd13  a4 20		 ldy $20
$1e:dd15  e6 24		 inc $24
$1e:dd17  48			pha
$1e:dd18  29 cc 35	  and #$35cc
$1e:dd1b  44 04 87	  mvp $87,$04
$1e:dd1e  08			php
$1e:dd1f  cc 10 2e	  cpy $2e10
$1e:dd22  19 b2 25	  ora $25b2,y
$1e:dd25  56 36		 lsr $36,x
$1e:dd27  1c 4b 4e	  trb $4e4b
$1e:dd2a  42 35		 wdm #$35
$1e:dd2c  14 02		 trb $02
$1e:dd2e  04 25		 tsb $25
$1e:dd30  0c 68 0c	  tsb $0c68
$1e:dd33  aa			tax
$1e:dd34  10 0e		 bpl $dd44
$1e:dd36  19 92 25	  ora $2592,y
$1e:dd39  16 2e		 asl $2e,x
$1e:dd3b  61 08		 adc ($08,x)
$1e:dd3d  a4 10		 ldy $10
$1e:dd3f  07 1d		 ora [$1d]
$1e:dd41  49 25 cc	  eor #$cc25
$1e:dd44  31 2f		 and ($2f),y
$1e:dd46  3e 00 00	  rol $0000,x
$1e:dd49  98			tya
$1e:dd4a  3a			dec a
$1e:dd4b  00 60		 brk #$60
$1e:dd4d  00 00		 brk #$00
$1e:dd4f  20 08 81	  jsr $8108
$1e:dd52  14 c3		 trb $c3
$1e:dd54  20 24 2d	  jsr $2d24
$1e:dd57  65 35		 adc $35
$1e:dd59  c8			iny
$1e:dd5a  41 24		 eor ($24,x)
$1e:dd5c  00 67		 brk #$67
$1e:dd5e  08			php
$1e:dd5f  aa			tax
$1e:dd60  10 ec		 bpl $dd4e
$1e:dd62  18			clc
$1e:dd63  2f 21 92 2d   and $2d9221
$1e:dd67  f4 39 2a	  pea $2a39
$1e:dd6a  4e c6 30	  lsr $30c6
$1e:dd6d  0c 00 92	  tsb $9200
$1e:dd70  10 38		 bpl $ddaa
$1e:dd72  25 fc		 and $fc
$1e:dd74  3d de 5a	  and $5ade,x
$1e:dd77  ff 7f e3 19   sbc $19e37f,x
$1e:dd7b  e0 3e 95	  cpx #$953e
$1e:dd7e  47 90		 eor [$90]
$1e:dd80  00 96		 brk #$96
$1e:dd82  01 9c		 ora ($9c,x)
$1e:dd84  16 00		 asl $00,x
$1e:dd86  00 0e		 brk #$0e
$1e:dd88  08			php
$1e:dd89  16 14		 asl $14,x
$1e:dd8b  8c 31 22	  sty $2231
$1e:dd8e  08			php
$1e:dd8f  83 1c		 sta $1c,s
$1e:dd91  05 29		 ora $29
$1e:dd93  88			dey
$1e:dd94  39 4d 52	  and $524d,y
$1e:dd97  d2 62		 cmp ($62)
$1e:dd99  54 73 66	  mvn $66,$73
$1e:dd9c  04 aa		 tsb $aa
$1e:dd9e  00 ee		 brk #$ee
$1e:dda0  08			php
$1e:dda1  30 11		 bmi $ddb4
$1e:dda3  94 19		 sty $19,x
$1e:dda5  d6 21		 dec $21,x
$1e:dda7  00 00		 brk #$00
$1e:dda9  d5 5b		 cmp $5b,x
$1e:ddab  60			rts
$1e:ddac  1e 22 08	  asl $0822,x
$1e:ddaf  a3 1c		 lda $1c,s
$1e:ddb1  05 29		 ora $29
$1e:ddb3  68			pla
$1e:ddb4  39 4d 52	  and $524d,y
$1e:ddb7  d2 62		 cmp ($62)
$1e:ddb9  54 73 24	  mvn $24,$73
$1e:ddbc  00 67		 brk #$67
$1e:ddbe  08			php
$1e:ddbf  aa			tax
$1e:ddc0  10 ec		 bpl $ddae
$1e:ddc2  18			clc
$1e:ddc3  2f 21 92 2d   and $2d9221
$1e:ddc7  f4 39 64	  pea $6439
$1e:ddca  14 40		 trb $40
$1e:ddcc  28			plp
$1e:ddcd  00 00		 brk #$00
$1e:ddcf  41 0c		 eor ($0c,x)
$1e:ddd1  a4 18		 ldy $18
$1e:ddd3  29 25 8c	  and #$8c25
$1e:ddd6  31 ef		 and ($ef),y
$1e:ddd8  3d 73 4e	  and $4e73,x
$1e:dddb  66 04		 ror $04
$1e:dddd  aa			tax
$1e:ddde  00 ee		 brk #$ee
$1e:dde0  08			php
$1e:dde1  30 11		 bmi $ddf4
$1e:dde3  94 19		 sty $19,x
$1e:dde5  d6 21		 dec $21,x
$1e:dde7  00 00		 brk #$00
$1e:dde9  37 67		 and [$67],y
$1e:ddeb  e6 65		 inc $65
$1e:dded  00 04		 brk #$04
$1e:ddef  20 0c 62	  jsr $620c
$1e:ddf2  18			clc
$1e:ddf3  a4 20		 ldy $20
$1e:ddf5  e5 24		 sbc $24
$1e:ddf7  48			pha
$1e:ddf8  29 cc 35	  and #$35cc
$1e:ddfb  44 04 87	  mvp $87,$04
$1e:ddfe  08			php
$1e:ddff  cc 10 2e	  cpy $2e10
$1e:de02  19 b2 25	  ora $25b2,y
$1e:de05  56 36		 lsr $36,x
$1e:de07  1c 4b 4e	  trb $4e4b
$1e:de0a  42 35		 wdm #$35
$1e:de0c  14 ff		 trb $ff
$1e:de0e  7f ff 7f ff   adc $ff7fff,x
$1e:de12  7f ff 7f ff   adc $ff7fff,x
$1e:de16  7f ff 7f ff   adc $ff7fff,x
$1e:de1a  7f ff 7f 00   adc $007fff,x
$1e:de1e  18			clc
$1e:de1f  40			rti
$1e:de20  30 c0		 bmi $dde2
$1e:de22  40			rti
$1e:de23  40			rti
$1e:de24  59 c0 69	  eor $69c0,y
$1e:de27  00 00		 brk #$00
$1e:de29  c0 7a 00	  cpy #$007a
$1e:de2c  60			rts
$1e:de2d  00 00		 brk #$00
$1e:de2f  20 08 81	  jsr $8108
$1e:de32  14 c3		 trb $c3
$1e:de34  20 24 2d	  jsr $2d24
$1e:de37  65 35		 adc $35
$1e:de39  c8			iny
$1e:de3a  41 24		 eor ($24,x)
$1e:de3c  00 67		 brk #$67
$1e:de3e  08			php
$1e:de3f  aa			tax
$1e:de40  10 ec		 bpl $de2e
$1e:de42  18			clc
$1e:de43  2f 21 92 2d   and $2d9221
$1e:de47  f4 39 2a	  pea $2a39
$1e:de4a  4e 70 10	  lsr $1070
$1e:de4d  0c 00 92	  tsb $9200
$1e:de50  10 38		 bpl $de8a
$1e:de52  25 fc		 and $fc
$1e:de54  3d de 5a	  and $5ade,x
$1e:de57  ff 7f e3 19   sbc $19e37f,x
$1e:de5b  e0 3e 95	  cpx #$953e
$1e:de5e  47 90		 eor [$90]
$1e:de60  00 96		 brk #$96
$1e:de62  01 9c		 ora ($9c,x)
$1e:de64  16 00		 asl $00,x
$1e:de66  00 0e		 brk #$0e
$1e:de68  08			php
$1e:de69  16 14		 asl $14,x
$1e:de6b  00 50		 brk #$50
$1e:de6d  03 18		 ora $18,s
$1e:de6f  44 08 86	  mvp $86,$08
$1e:de72  10 c8		 bpl $de3c
$1e:de74  14 0a		 trb $0a
$1e:de76  1d 4d 25	  ora $254d,x
$1e:de79  b0 31		 bcs $deac
$1e:de7b  65 04		 adc $04
$1e:de7d  ca			dex
$1e:de7e  10 4e		 bpl $dece
$1e:de80  19 92 21	  ora $2192,y
$1e:de83  27 49		 and [$49]
$1e:de85  69 59 ab	  adc #$ab59
$1e:de88  61 ed		 adc ($ed,x)
$1e:de8a  71 80		 adc ($80),y
$1e:de8c  03 42		 ora $42,s
$1e:de8e  08			php
$1e:de8f  c6 18		 dec $18
$1e:de91  4a			lsr a
$1e:de92  29 ef 3d	  and #$3def
$1e:de95  94 52		 sty $52,x
$1e:de97  18			clc
$1e:de98  63 9c		 adc $9c,s
$1e:de9a  73 f1		 adc ($f1,s),y
$1e:de9c  00 b9		 brk #$b9
$1e:de9e  0d 7c 16	  ora $167c
$1e:dea1  5e 33 a6	  lsr $a633,x
$1e:dea4  41 27		 eor ($27,x)
$1e:dea6  52 cc		 eor ($cc)
$1e:dea8  62 9e 25	  per $0449
$1e:deab  57 15		 eor [$15],y
$1e:dead  4a			lsr a
$1e:deae  00 f1		 brk #$f1
$1e:deb0  00 b9		 brk #$b9
$1e:deb2  0d 7c 16	  ora $167c
$1e:deb5  5e 33 10	  lsr $1033,x
$1e:deb8  42 94		 wdm #$94
$1e:deba  52 18		 eor ($18)
$1e:debc  63 08		 adc $08,s
$1e:debe  15 6b		 ora $6b,x
$1e:dec0  1d ce 25	  ora $25ce,x
$1e:dec3  31 2e		 and ($2e),y
$1e:dec5  94 36		 sty $36,x
$1e:dec7  f7 42		 sbc [$42],y
$1e:dec9  5a			phy
$1e:deca  53 93		 eor ($93,s),y
$1e:decc  34 05		 bit $05,x
$1e:dece  00 0c		 brk #$0c
$1e:ded0  00 52		 brk #$52
$1e:ded2  10 f8		 bpl $decc
$1e:ded4  30 fc		 bmi $ded2
$1e:ded6  55 de		 eor $de,x
$1e:ded8  62 61 18	  per $f73c
$1e:dedb  c3 30		 cmp $30,s
$1e:dedd  66 51		 ror $51
$1e:dedf  07 6a		 ora [$6a]
$1e:dee1  cd 6a 36	  cmp $366a
$1e:dee4  6f 10 42 94   adc $944210
$1e:dee8  52 5a		 eor ($5a)
$1e:deea  6b			rtl
$1e:deeb  9c 10 26	  stz $2610
$1e:deee  00 68		 brk #$68
$1e:def0  04 ac		 tsb $ac
$1e:def2  08			php
$1e:def3  10 11		 bpl $df06
$1e:def5  d4 19		 pei ($19)
$1e:def7  58			cli
$1e:def8  22 1c 2b f1   jsl $f12b1c
$1e:defc  00 b9		 brk #$b9
$1e:defe  0d 7c 16	  ora $167c
$1e:df01  5e 33 a6	  lsr $a633,x
$1e:df04  41 27		 eor ($27,x)
$1e:df06  52 cc		 eor ($cc)
$1e:df08  62 7b 6f	  per $4e86
$1e:df0b  41 1e		 eor ($1e,x)
$1e:df0d  42 08		 wdm #$08
$1e:df0f  c6 18		 dec $18
$1e:df11  4a			lsr a
$1e:df12  29 ef 3d	  and #$3def
$1e:df15  94 52		 sty $52,x
$1e:df17  18			clc
$1e:df18  63 9c		 adc $9c,s
$1e:df1a  73 03		 adc ($03,s),y
$1e:df1c  18			clc
$1e:df1d  44 18 86	  mvp $86,$18
$1e:df20  20 c8 24	  jsr $24c8
$1e:df23  0a			asl a
$1e:df24  2d 4d 39	  and $394d
$1e:df27  b0 45		 bcs $df6e
$1e:df29  34 56		 bit $56,x
$1e:df2b  00 50		 brk #$50
$1e:df2d  0c 00 92	  tsb $9200
$1e:df30  10 38		 bpl $df6a
$1e:df32  25 fc		 and $fc
$1e:df34  3d de 5a	  and $5ade,x
$1e:df37  ff 7f e3 19   sbc $19e37f,x
$1e:df3b  e0 3e 95	  cpx #$953e
$1e:df3e  47 90		 eor [$90]
$1e:df40  00 96		 brk #$96
$1e:df42  01 9c		 ora ($9c,x)
$1e:df44  16 00		 asl $00,x
$1e:df46  00 0e		 brk #$0e
$1e:df48  08			php
$1e:df49  16 14		 asl $14,x
$1e:df4b  13 00		 ora ($00,s),y
$1e:df4d  a0 30 80	  ldy #$8030
$1e:df50  44 00 5d	  mvp $5d,$00
$1e:df53  60			rts
$1e:df54  75 00		 adc $00,x
$1e:df56  7e c0 7e	  ror $7ec0,x
$1e:df59  61 7f		 adc ($7f,x)
$1e:df5b  f1 7f		 sbc ($7f),y
$1e:df5d  ff 7f 3e 67   sbc $673e7f,x
$1e:df61  bd 56 fb	  lda $fb56,x
$1e:df64  3d 3a 25	  and $253a,x
$1e:df67  f9 1c 17	  sbc $171c,y
$1e:df6a  00 21		 brk #$21
$1e:df6c  10 00		 bpl $df6e
$1e:df6e  10 a5		 bpl $df15
$1e:df70  2c 29 41	  bit $4129
$1e:df73  ae 5d 11	  ldx $115d
$1e:df76  66 94		 ror $94
$1e:df78  6e 18 7b	  ror $7b18
$1e:df7b  9c 7f 1f	  stz $1f7f
$1e:df7e  00 bf		 brk #$bf
$1e:df80  35 bf		 and $bf,x
$1e:df82  56 bf		 lsr $bf,x
$1e:df84  77 57		 adc [$57],y
$1e:df86  7f 71 7e 8c   adc $8c7e71,x
$1e:df8a  7d a1 11	  adc $11a1,x
$1e:df8d  c8			iny
$1e:df8e  20 cc 20	  jsr $20cc
$1e:df91  12 05		 ora ($05)
$1e:df93  97 09		 sta [$09],y
$1e:df95  5c 0e fe 1e   jml $1efe0e
$1e:df99  9f 37 18 73   sta $731837,x
$1e:df9d  00 00		 brk #$00
$1e:df9f  00 08		 brk #$08
$1e:dfa1  62 14 c6	  per $a5b8
$1e:dfa4  20 29 2d	  jsr $2d29
$1e:dfa7  ce 45 94	  dec $9445
$1e:dfaa  5e 2f 48	  lsr $482f,x
$1e:dfad  ae 5d a5	  ldx $a55d
$1e:dfb0  2c 29 41	  bit $4129
$1e:dfb3  15 18		 ora $18,x
$1e:dfb5  76 0d		 ror $0d,x
$1e:dfb7  bf 24 5e 17   lda $175e24,x
$1e:dfbb  0b			phd
$1e:dfbc  1c 00 00	  trb $0000
$1e:dfbf  22 08 c8 14   jsl $14c808
$1e:dfc3  4c 25 f1	  jmp $f125
$1e:dfc6  3d b6 52	  and $52b6,x
$1e:dfc9  5a			phy
$1e:dfca  67 87		 adc [$87]
$1e:dfcc  3d cc 20	  and $20cc,x
$1e:dfcf  12 05		 ora ($05)
$1e:dfd1  96 09		 stx $09,y
$1e:dfd3  5a			phy
$1e:dfd4  0e dd 12	  asl $12dd
$1e:dfd7  5f 2f 5f 01   eor $015f2f,x
$1e:dfdb  ff 7f 1f 13   sbc $131f7f,x
$1e:dfdf  9a			txs
$1e:dfe0  3b			tsc
$1e:dfe1  2e 2b a7	  rol $a72b
$1e:dfe4  26 80		 rol $80
$1e:dfe6  25 a0		 and $a0
$1e:dfe8  1c 41 0c	  trb $0c41
$1e:dfeb  66 01		 ror $01
$1e:dfed  ff 7f 00 00   sbc $00007f,x
$1e:dff1  00 10		 brk #$10
$1e:dff3  00 24		 brk #$24
$1e:dff5  00 40		 brk #$40
$1e:dff7  20 64 a0	  jsr $a064
$1e:dffa  7d 20 7f	  adc $7f20,x
$1e:dffd  f1 7f		 sbc ($7f),y
$1e:dfff  05 14		 ora $14
$1e:e001  2d 1c 58	  and $581c
$1e:e004  18			clc
$1e:e005  3f 0d 9f 16   and $169f0d,x
$1e:e009  bf 3f 00 50   lda $50003f,x
$1e:e00d  0c 00 92	  tsb $9200
$1e:e010  10 38		 bpl $e04a
$1e:e012  25 fc		 and $fc
$1e:e014  3d de 5a	  and $5ade,x
$1e:e017  ff 7f e3 19   sbc $19e37f,x
$1e:e01b  e0 3e 95	  cpx #$953e
$1e:e01e  47 90		 eor [$90]
$1e:e020  00 96		 brk #$96
$1e:e022  01 9c		 ora ($9c,x)
$1e:e024  16 00		 asl $00,x
$1e:e026  00 0e		 brk #$0e
$1e:e028  08			php
$1e:e029  16 14		 asl $14,x
$1e:e02b  13 00		 ora ($00,s),y
$1e:e02d  a0 30 80	  ldy #$8030
$1e:e030  44 00 5d	  mvp $5d,$00
$1e:e033  60			rts
$1e:e034  75 00		 adc $00,x
$1e:e036  7e c0 7e	  ror $7ec0,x
$1e:e039  61 7f		 adc ($7f,x)
$1e:e03b  f1 7f		 sbc ($7f),y
$1e:e03d  ff 7f 3e 67   sbc $673e7f,x
$1e:e041  bd 56 fb	  lda $fb56,x
$1e:e044  3d 3a 25	  and $253a,x
$1e:e047  f9 1c 17	  sbc $171c,y
$1e:e04a  00 21		 brk #$21
$1e:e04c  10 00		 bpl $e04e
$1e:e04e  10 a5		 bpl $dff5
$1e:e050  2c 29 41	  bit $4129
$1e:e053  ae 5d 11	  ldx $115d
$1e:e056  66 94		 ror $94
$1e:e058  6e 18 7b	  ror $7b18
$1e:e05b  9c 7f 1f	  stz $1f7f
$1e:e05e  00 bf		 brk #$bf
$1e:e060  35 bf		 and $bf,x
$1e:e062  56 bf		 lsr $bf,x
$1e:e064  77 57		 adc [$57],y
$1e:e066  7f 71 7e 8c   adc $8c7e71,x
$1e:e06a  7d a1 11	  adc $11a1,x
$1e:e06d  c8			iny
$1e:e06e  20 cc 20	  jsr $20cc
$1e:e071  12 05		 ora ($05)
$1e:e073  97 09		 sta [$09],y
$1e:e075  5c 0e fe 1e   jml $1efe0e
$1e:e079  9f 37 18 73   sta $731837,x
$1e:e07d  00 00		 brk #$00
$1e:e07f  00 08		 brk #$08
$1e:e081  62 14 c6	  per $a698
$1e:e084  20 29 2d	  jsr $2d29
$1e:e087  ce 45 94	  dec $9445
$1e:e08a  5e 2f 48	  lsr $482f,x
$1e:e08d  ae 5d a5	  ldx $a55d
$1e:e090  2c 29 41	  bit $4129
$1e:e093  15 18		 ora $18,x
$1e:e095  76 0d		 ror $0d,x
$1e:e097  bf 24 5e 17   lda $175e24,x
$1e:e09b  0b			phd
$1e:e09c  1c 00 00	  trb $0000
$1e:e09f  22 08 c8 14   jsl $14c808
$1e:e0a3  4c 25 f1	  jmp $f125
$1e:e0a6  3d b6 52	  and $52b6,x
$1e:e0a9  5a			phy
$1e:e0aa  67 87		 adc [$87]
$1e:e0ac  3d cc 20	  and $20cc,x
$1e:e0af  12 05		 ora ($05)
$1e:e0b1  96 09		 stx $09,y
$1e:e0b3  5a			phy
$1e:e0b4  0e dd 12	  asl $12dd
$1e:e0b7  5f 2f 91 7d   eor $7d912f,x
$1e:e0bb  ff 7f 20 7f   sbc $7f207f,x
$1e:e0bf  9a			txs
$1e:e0c0  3b			tsc
$1e:e0c1  2e 2b a7	  rol $a72b
$1e:e0c4  26 80		 rol $80
$1e:e0c6  25 a0		 and $a0
$1e:e0c8  1c 41 0c	  trb $0c41
$1e:e0cb  e0 02 00	  cpx #$0002
$1e:e0ce  00 23		 brk #$23
$1e:e0d0  08			php
$1e:e0d1  66 10		 ror $10
$1e:e0d3  c9 1c 0c	  cmp #$0c1c
$1e:e0d6  25 6f		 and $6f
$1e:e0d8  31 b0		 and ($b0),y
$1e:e0da  39 34 4a	  and $4a34,y
$1e:e0dd  00 00		 brk #$00
$1e:e0df  00 14		 brk #$14
$1e:e0e1  00 30		 brk #$30
$1e:e0e3  60			rts
$1e:e0e4  4c 80 70	  jmp $7080
$1e:e0e7  04 7d		 tsb $7d
$1e:e0e9  c0 7d 90	  cpy #$907d
$1e:e0ec  71 e2		 adc ($e2),y
$1e:e0ee  38			sec
$1e:e0ef  e3 45		 sbc $45,s
$1e:e0f1  ff 7b 3b 53   sbc $533b7b,x
$1e:e0f5  b7 36		 lda [$36],y
$1e:e0f7  d2 25		 cmp ($25)
$1e:e0f9  2c 21 a6	  bit $a621
$1e:e0fc  18			clc
$1e:e0fd  23 10		 and $10,s
$1e:e0ff  00 00		 brk #$00
$1e:e101  25 14		 and $14
$1e:e103  6c 18 94	  jmp ($9418)
$1e:e106  10 da		 bpl $e0e2
$1e:e108  10 9f		 bpl $e0a9
$1e:e10a  0d 51 72	  ora $7251
$1e:e10d  e4 24		 cpx $24
$1e:e10f  81 1c		 sta ($1c,x)
$1e:e111  00 00		 brk #$00
$1e:e113  9a			txs
$1e:e114  77 b1		 adc [$b1],y
$1e:e116  56 0d		 lsr $0d,x
$1e:e118  4a			lsr a
$1e:e119  68			pla
$1e:e11a  39 46 31	  and $3146,y
$1e:e11d  03 24		 ora $24,s
$1e:e11f  00 50		 brk #$50
$1e:e121  9f 0f fe 19   sta $19fe0f,x
$1e:e125  35 0d		 and $0d,x
$1e:e127  cb			wai
$1e:e128  14 00		 trb $00
$1e:e12a  1c 8d 05	  trb $058d
$1e:e12d  19 01 5f	  ora $5f01,y
$1e:e130  02 00		 cop #$00
$1e:e132  00 9b		 brk #$9b
$1e:e134  63 51		 adc $51,s
$1e:e136  42 8b		 wdm #$8b
$1e:e138  2d 07 1d	  and $1d07
$1e:e13b  c5 14		 cmp $14
$1e:e13d  ae 04 c8	  ldx $c804
$1e:e140  04 1f		 tsb $1f
$1e:e142  13 5e		 ora ($5e,s),y
$1e:e144  12 98		 ora ($98)
$1e:e146  15 52		 ora $52,x
$1e:e148  11 cc		 ora ($cc),y
$1e:e14a  0c 65 45	  tsb $4565
$1e:e14d  15 63		 ora $63,x
$1e:e14f  50 4a		 bvc $e19b
$1e:e151  ac 35 28	  ldy $2835
$1e:e154  29 e6 24	  and #$24e6
$1e:e157  a4 20		 ldy $20
$1e:e159  21 0c		 and ($0c,x)
$1e:e15b  9c 77 bf	  stz $bf77
$1e:e15e  16 00		 asl $00,x
$1e:e160  00 52		 brk #$52
$1e:e162  36 8d		 rol $8d,x
$1e:e164  31 c8		 and ($c8),y
$1e:e166  24 44		 bit $44
$1e:e168  18			clc
$1e:e169  96 0d		 stx $0d,y
$1e:e16b  ae 2e 15	  ldx $152e
$1e:e16e  63 50		 adc $50,s
$1e:e170  4a			lsr a
$1e:e171  ac 35 28	  ldy $2835
$1e:e174  29 e6 24	  and #$24e6
$1e:e177  a4 20		 ldy $20
$1e:e179  ea			nop
$1e:e17a  00 9c		 brk #$9c
$1e:e17c  77 df		 adc [$df],y
$1e:e17e  02 00		 cop #$00
$1e:e180  00 e0		 brk #$e0
$1e:e182  09 21 0d	  ora #$0d21
$1e:e185  c2 14		 rep #$14
$1e:e187  42 10		 wdm #$10
$1e:e189  94 01		 sty $01,x
$1e:e18b  65 45		 adc $45
$1e:e18d  00 00		 brk #$00
$1e:e18f  42 10		 wdm #$10
$1e:e191  65 18		 adc $18
$1e:e193  49 1c 8d	  eor #$8d1c
$1e:e196  20 b1 1c	  jsr $1cb1
$1e:e199  99 10 bf	  sta $bf10,y
$1e:e19c  15 df		 ora $df,x
$1e:e19e  16 bf		 asl $bf,x
$1e:e1a0  3f ff 7f 60   and $607fff,x
$1e:e1a4  20 a0 30	  jsr $30a0
$1e:e1a7  80 44		 bra $e1ed
$1e:e1a9  00 5d		 brk #$5d
$1e:e1ab  9c 05 8d	  stz $8d05
$1e:e1ae  05 00		 ora $00
$1e:e1b0  00 8d		 brk #$8d
$1e:e1b2  05 8d		 ora $8d
$1e:e1b4  05 8d		 ora $8d
$1e:e1b6  05 8d		 ora $8d
$1e:e1b8  05 8d		 ora $8d
$1e:e1ba  05 8d		 ora $8d
$1e:e1bc  05 00		 ora $00
$1e:e1be  00 00		 brk #$00
$1e:e1c0  10 22		 bpl $e1e4
$1e:e1c2  2c 42 44	  bit $4442
$1e:e1c5  43 70		 eor $70,s
$1e:e1c7  04 7d		 tsb $7d
$1e:e1c9  e3 7d		 sbc $7d,s
$1e:e1cb  02 02		 cop #$02
$1e:e1cd  00 04		 brk #$04
$1e:e1cf  89 3b ee	  bit #$ee3b
$1e:e1d2  36 ef		 rol $ef,x
$1e:e1d4  b8			clv
$1e:e1d5  98			tya
$1e:e1d6  28			plp
$1e:e1d7  24 6e		 bit $6e
$1e:e1d9  fa			plx
$1e:e1da  8e 46 23	  stx $2346
$1e:e1dd  31 47		 and ($47),y
$1e:e1df  8d c8 24	  sta $24c8
$1e:e1e2  20 eb 91	  jsr $91eb
$1e:e1e5  48			pha
$1e:e1e6  a4 00		 ldy $00
$1e:e1e8  e0 91 02	  cpx #$0291
$1e:e1eb  c2 36		 rep #$36
$1e:e1ed  0e 79 20	  asl $2079
$1e:e1f0  e0 83 80	  cpx #$8083
$1e:e1f3  0b			phd
$1e:e1f4  07 7d		 ora [$7d]
$1e:e1f6  0b			phd
$1e:e1f7  36 37		 rol $37,x
$1e:e1f9  22 89 03 ad   jsl $ad0389
$1e:e1fd  01 e9		 ora ($e9,x)
$1e:e1ff  1f 51 7b bd   ora $bd7b51,x
$1e:e203  a4 60		 ldy $60
$1e:e205  d5 8e		 cmp $8e,x
$1e:e207  05 21		 ora $21
$1e:e209  f4 51 a8	  pea $a851
$1e:e20c  d9 51 45	  cmp $4551,y
$1e:e20f  62 ad 18	  per $fabf
$1e:e212  d0 70		 bne $e284
$1e:e214  1f ad 22 3a   ora $3a22ad,x
$1e:e218  7a			ply
$1e:e219  b6 63		 ldx $63,y
$1e:e21b  4f cd 69 83   eor $8369cd
$1e:e21f  95 41		 sta $41,x
$1e:e221  49 13 71	  eor #$7113
$1e:e224  b4 8e		 ldy $8e,x
$1e:e226  35 14		 and $14,x
$1e:e228  72 8c		 adc ($8c)
$1e:e22a  8a			txa
$1e:e22b  44 62 67	  mvp $67,$62
$1e:e22e  13 48		 ora ($48,s),y
$1e:e230  8e 22 e9	  stx $e922
$1e:e233  31 d3		 and ($d3),y
$1e:e235  49 16 cb	  eor #$cb16
$1e:e238  1c 91 bb	  trb $bb91
$1e:e23b  b5 dd		 lda $dd,x
$1e:e23d  e8			inx
$1e:e23e  4f 4a fa 9b   eor $9bfa4a
$1e:e242  df 6a e5 67   cmp $67e56a,x
$1e:e246  db			stp
$1e:e247  45 0e		 eor $0e
$1e:e249  9a			txs
$1e:e24a  bf e6 00 c7   lda $c700e6,x
$1e:e24e  0a			asl a
$1e:e24f  6c d8 69	  jmp ($69d8)
$1e:e252  21 93		 and ($93,x)
$1e:e254  89 88 19	  bit #$1988
$1e:e257  f0 4d		 beq $e2a6
$1e:e259  44 db c0	  mvp $c0,$db
$1e:e25c  74 b9		 stz $b9,x
$1e:e25e  14 62		 trb $62
$1e:e260  32 37		 and ($37)
$1e:e262  06 05		 asl $05
$1e:e264  3c f8 28	  bit $28f8,x
$1e:e267  0d 0d 60	  ora $600d
$1e:e26a  3c 69 81	  bit $8169,x
$1e:e26d  92 38		 sta ($38)
$1e:e26f  d4 51		 pei ($51)
$1e:e271  7f 71 a2 40   adc $40a271,x
$1e:e275  2f ee 44 f3   and $f344ee
$1e:e279  d9 1c 70	  cmp $701c,y
$1e:e27c  09 cd 2f	  ora #$2fcd
$1e:e27f  71 f9		 adc ($f9),y
$1e:e281  ff d2 1e a1   sbc $a11ed2,x
$1e:e285  f5 97		 sbc $97,x
$1e:e287  b0 f8		 bcs $e281
$1e:e289  b4 af		 ldy $af,x
$1e:e28b  8f 04 f8 6b   sta $6bf804
$1e:e28f  de 34 37	  dec $3734,x
$1e:e292  89 1c 4e	  bit #$4e1c
$1e:e295  24 72		 bit $72
$1e:e297  31 d3		 and ($d3),y
$1e:e299  47 0e		 eor [$0e]
$1e:e29b  00 e8		 brk #$e8
$1e:e29d  c1 40		 cmp ($40,x)
$1e:e29f  45 1d		 eor $1d
$1e:e2a1  16 38		 asl $38,x
$1e:e2a3  03 95		 ora $95,s
$1e:e2a5  a8			tay
$1e:e2a6  1d c3 60	  ora $60c3,x
$1e:e2a9  02 01		 cop #$01
$1e:e2ab  00 02		 brk #$02
$1e:e2ad  83 bb		 sta $bb,s
$1e:e2af  fd fd 90	  sbc $90fd,x
$1e:e2b2  f0 7e		 beq $e332
$1e:e2b4  c5 c3		 cmp $c3
$1e:e2b6  fb			xce
$1e:e2b7  1f 17 ec 9c   ora $9cec17,x
$1e:e2bb  7f b2 f2 7e   adc $7ef2b2,x
$1e:e2bf  cd cb f1	  cmp $f1cb
$1e:e2c2  9d cf 17	  sta $17cf,x
$1e:e2c5  c7 09		 cmp [$09]
$1e:e2c7  85 c4		 sta $c4
$1e:e2c9  62 71 58	  per $3b3d
$1e:e2cc  bb			tyx
$1e:e2cd  85 f3		 sta $f3
$1e:e2cf  41 a1		 eor ($a1,x)
$1e:e2d1  d2 69		 cmp ($69)
$1e:e2d3  72 d7		 adc ($d7)
$1e:e2d5  fb			xce
$1e:e2d6  c5 e7		 cmp $e7
$1e:e2d8  0d 87 c8	  ora $c887
$1e:e2db  64 72		 stz $72
$1e:e2dd  59 3c a6	  eor $a63c,y
$1e:e2e0  8b			phb
$1e:e2e1  47 a9		 eor [$a9]
$1e:e2e3  d5 66		 cmp $66,x
$1e:e2e5  72 b9		 adc ($b9)
$1e:e2e7  ac dc de	  ldy $dedc
$1e:e2ea  e1 71		 sbc ($71,x)
$1e:e2ec  b9 5c ee	  lda $ee5c,y
$1e:e2ef  97 5b		 sta [$5b],y
$1e:e2f1  b5 de		 lda $de,x
$1e:e2f3  f7 7d		 sbc [$7d],y
$1e:e2f5  bf 60 12 85   lda $851260,x
$1e:e2f9  6f af 57 ec   adc $ec57af
$1e:e2fd  76 8b		 ror $8b,x
$1e:e2ff  5d b9 3e	  eor $3eb9,x
$1e:e302  16 8a		 asl $8a,x
$1e:e304  dd 72 ba	  cmp $ba72,x
$1e:e307  a0 1b 25	  ldy #$251b
$1e:e30a  96 cd		 stx $cd,y
$1e:e30c  67 57		 adc [$57]
$1e:e30e  d5 6a		 cmp $6a,x
$1e:e310  b1 59		 lda ($59),y
$1e:e312  5f 95 65 80   eor $806595,x
$1e:e316  8c 00 80	  sty $8000
$1e:e319  33 fd		 and ($fd,s),y
$1e:e31b  bd 80 0d	  lda $0d80,x
$1e:e31e  7e fc 3c	  ror $3cfc,x
$1e:e321  1f b1 70 fe   ora $fe70b1,x
$1e:e325  c7 c5		 cmp [$c5]
$1e:e327  fb			xce
$1e:e328  27 1f		 and [$1f]
$1e:e32a  ec bc 9f	  cpx $9fbc
$1e:e32d  b3 72		 lda ($72,s),y
$1e:e32f  fe de b1	  inc $b1de,x
$1e:e332  19 7c 6e	  ora $6e7c,y
$1e:e335  87 15		 sta [$15]
$1e:e337  8d ce 26	  sta $26ce
$1e:e33a  03 11		 ora $11,s
$1e:e33c  98			tya
$1e:e33d  c5 cd		 cmp $cd
$1e:e33f  f0 58		 beq $e399
$1e:e341  3d 36 9f	  and $9f36,x
$1e:e344  51 a9		 eor ($a9),y
$1e:e346  d5 6a		 cmp $6a,x
$1e:e348  f1 99		 sbc ($99),y
$1e:e34a  ac dc df	  ldy $dfdc
$1e:e34d  21 9f		 and ($9f,x)
$1e:e34f  c9 e5 0e	  cmp #$0ee5
$1e:e352  e0 77 03	  cpx #$0377
$1e:e355  e8			inx
$1e:e356  61 30		 adc ($30,x)
$1e:e358  b8			clv
$1e:e359  6b			rtl
$1e:e35a  f6 03		 inc $03,x
$1e:e35c  02 77		 cop #$77
$1e:e35e  0b			phd
$1e:e35f  c5 e6		 cmp $e6
$1e:e361  f5 37		 sbc $37,x
$1e:e363  b4 5a		 ldy $5a,x
$1e:e365  6d 56 bb	  adc $bb56
$1e:e368  65 b6		 adc $b6
$1e:e36a  dd 6f af	  cmp $af6f,x
$1e:e36d  57 ec		 eor [$ec],y
$1e:e36f  69 f1 52	  adc #$52f1
$1e:e372  05 92		 ora $92
$1e:e374  cb			wai
$1e:e375  66 b3		 ror $b3
$1e:e377  ab			plb
$1e:e378  ea			nop
$1e:e379  b5 58		 lda $58,x
$1e:e37b  ac af ca	  ldy $caaf
$1e:e37e  b2 c0		 lda ($c0)
$1e:e380  46 00		 lsr $00
$1e:e382  38			sec
$1e:e383  35 bb		 and $bb,x
$1e:e385  e0 01 01	  cpx #$0101
$1e:e388  00 01		 brk #$01
$1e:e38a  8b			phb
$1e:e38b  d4 2a		 pei ($2a)
$1e:e38d  50 38		 bvc $e3c7
$1e:e38f  1c 5d e8	  trb $e85d
$1e:e392  33 aa		 and ($aa,s),y
$1e:e394  bc 46 2f	  ldy $2f46,x
$1e:e397  11 9d		 ora ($9d),y
$1e:e399  3c c2 02	  bit $02c2,x
$1e:e39c  00 08		 brk #$08
$1e:e39e  9c 16 16	  stz $1616
$1e:e3a1  f4 0a 24	  pea $240a
$1e:e3a4  5d fc 51	  eor $51fc,x
$1e:e3a7  18			clc
$1e:e3a8  60			rts
$1e:e3a9  00 5e		 brk #$5e
$1e:e3ab  81 11		 sta ($11,x)
$1e:e3ad  78			sei
$1e:e3ae  04 e9		 tsb $e9
$1e:e3b0  fe 50 18	  inc $1850,x
$1e:e3b3  44 5e 04	  mvp $04,$5e
$1e:e3b6  20 08 3c	  jsr $3c08
$1e:e3b9  32 27		 and ($27)
$1e:e3bb  0c 85 d3	  tsb $d385
$1e:e3be  66 e1		 ror $e1
$1e:e3c0  a2 8b d4	  ldx #$d48b
$1e:e3c3  9e 83 34	  stz $3483,x
$1e:e3c6  86 c3		 stx $c3
$1e:e3c8  e1 f1		 sbc ($f1,x)
$1e:e3ca  07 a0		 ora [$a0]
$1e:e3cc  06 8a		 asl $8a
$1e:e3ce  a1 17		 lda ($17,x)
$1e:e3d0  11 84		 ora ($84),y
$1e:e3d2  2c 66 10	  bit $1066
$1e:e3d5  e8			inx
$1e:e3d6  7c a0 0a	  jmp ($0aa0,x)
$1e:e3d9  02 00		 cop #$00
$1e:e3db  92 4b		 sta ($4b)
$1e:e3dd  06 23		 asl $23
$1e:e3df  0f 9c 51 a0   ora $a0519c
$1e:e3e3  d0 4a		 bne $e42f
$1e:e3e5  3c 29 e6	  bit $e629,x
$1e:e3e8  52 59		 eor ($59)
$1e:e3ea  6e 47 16	  ror $1647
$1e:e3ed  50 01		 bvc $e3f0
$1e:e3ef  b8			clv
$1e:e3f0  55 de		 eor $de,x
$1e:e3f2  81 4c		 sta ($4c,x)
$1e:e3f4  8d bd 03	  sta $03bd
$1e:e3f7  14 5c		 trb $5c
$1e:e3f9  0c 59 3c	  tsb $3c59
$1e:e3fc  60			rts
$1e:e3fd  64 01		 stz $01
$1e:e3ff  8b			phb
$1e:e400  c8			iny
$1e:e401  65 4f		 adc $4f
$1e:e403  40			rti
$1e:e404  c4 97		 cpy $97
$1e:e406  02 2f		 cop #$2f
$1e:e408  0c 90 15	  tsb $1590
$1e:e40b  80 e0		 bra $e3ed
$1e:e40d  31 7a		 and ($7a),y
$1e:e40f  5c 8d e8 19   jml $19e88d
$1e:e413  62 e0 41	  per $25f6
$1e:e416  cc e0 64	  cpy $64e0
$1e:e419  03 01		 ora $01,s
$1e:e41b  00 06		 brk #$06
$1e:e41d  2b			pld
$1e:e41e  15 00		 ora $00,x
$1e:e420  04 0c		 tsb $0c
$1e:e422  ee 02 30	  inc $3002
$1e:e425  a2 c3 e1	  ldx #$e1c3
$1e:e428  10 b0		 bpl $e3da
$1e:e42a  00 c7		 brk #$c7
$1e:e42c  63 a0		 adc $a0,s
$1e:e42e  c1 3b		 cmp ($3b,x)
$1e:e430  81 0c		 sta ($0c,x)
$1e:e432  46 81		 lsr $81
$1e:e434  11 0d		 ora ($0d),y
$1e:e436  10 00		 bpl $e438
$1e:e438  53 c3		 eor ($c3,s),y
$1e:e43a  20 82 4a	  jsr $4a82
$1e:e43d  ca			dex
$1e:e43e  a3 02		 lda $02,s
$1e:e440  a1 c0		 lda ($c0,x)
$1e:e442  a3 ec		 lda $ec,s
$1e:e444  90 a1		 bcc $e3e7
$1e:e446  c4 50		 cpy $50
$1e:e448  e1 11		 sbc ($11,x)
$1e:e44a  7c 86 59	  jmp ($5986,x)
$1e:e44d  ea			nop
$1e:e44e  4f b0 7d 95   eor $957db0
$1e:e452  42 27		 wdm #$27
$1e:e454  13 85		 ora ($85,s),y
$1e:e456  b7 80		 lda [$80],y
$1e:e458  5e 34 4a	  lsr $4a34,x
$1e:e45b  78			sei
$1e:e45c  28			plp
$1e:e45d  20 74 48	  jsr $4874
$1e:e460  88			dey
$1e:e461  02 01		 cop #$01
$1e:e463  00 02		 brk #$02
$1e:e465  84 40		 sty $40
$1e:e467  6d 36 d8	  adc $d836
$1e:e46a  03 ce		 ora $ce,s
$1e:e46c  60			rts
$1e:e46d  3a			dec a
$1e:e46e  68			pla
$1e:e46f  0b			phd
$1e:e470  c0 1e 95	  cpy #$951e
$1e:e473  01 b7		 ora ($b7,x)
$1e:e475  c0 6d 6f	  cpy #$6f6d
$1e:e478  39 d3 80	  and $80d3,y
$1e:e47b  42 11		 wdm #$11
$1e:e47d  15 02		 ora $02,x
$1e:e47f  58			cli
$1e:e480  04 02		 tsb $02
$1e:e482  74 2f		 stz $2f,x
$1e:e484  28			plp
$1e:e485  b0 93		 bcs $e41a
$1e:e487  2d 75 e7	  and $e775
$1e:e48a  a5 3b		 lda $3b
$1e:e48c  c2 2b		 rep #$2b
$1e:e48e  66 79		 ror $79
$1e:e490  c8			iny
$1e:e491  44 34 c5	  mvp $c5,$34
$1e:e494  2a			rol a
$1e:e495  b6 0b		 ldx $0b,y
$1e:e497  c4 c4		 cpy $c4
$1e:e499  16 c7		 asl $c7,x
$1e:e49b  9b			txy
$1e:e49c  5a			phy
$1e:e49d  05 e2		 ora $e2
$1e:e49f  ef 0a fd f9   sbc $f9fd0a
$1e:e4a3  e2 16		 sep #$16
$1e:e4a5  db			stp
$1e:e4a6  65 b1		 adc $b1
$1e:e4a8  2c 16 db	  bit $db16
$1e:e4ab  53 fc		 eor ($fc,s),y
$1e:e4ad  84 41		 sty $41
$1e:e4af  94 fe		 sty $fe,x
$1e:e4b1  df 80 21 7d   cmp $7d2180,x
$1e:e4b5  84 c2		 sty $c2
$1e:e4b7  54 c0 1f	  mvn $1f,$c0
$1e:e4ba  14 00		 trb $00
$1e:e4bc  e4 32		 cpx $32
$1e:e4be  79 45 50	  adc $5045,y
$1e:e4c1  65 72		 adc $72
$1e:e4c3  79 2c 9e	  adc $9e2c,y
$1e:e4c6  c0 be		 cpy #$be
$1e:e4c8  21 f0		 and ($f0,x)
$1e:e4ca  8a			txa
$1e:e4cb  e4 72		 cpx $72
$1e:e4cd  19 15 d8	  ora $d815,y
$1e:e4d0  31 41		 and ($41),y
$1e:e4d2  92 3b		 sta ($3b)
$1e:e4d4  57 9d		 eor [$9d],y
$1e:e4d6  36 bd		 rol $bd,x
$1e:e4d8  d7 c8		 cmp [$c8],y
$1e:e4da  d1 75		 cmp ($75),y
$1e:e4dc  dd aa 11	  cmp $11aa,x
$1e:e4df  a7 78		 lda [$78]
$1e:e4e1  62 7c 00	  per $e560
$1e:e4e4  18			clc
$1e:e4e5  fd cb 51	  sbc $51cb,x
$1e:e4e8  bc 1f d7	  ldy $d71f,x
$1e:e4eb  1d 58 85	  ora $8558,x
$1e:e4ee  bc 5f 6a	  ldy $6a5f,x
$1e:e4f1  f1 27		 sbc ($27),y
$1e:e4f3  e6 9a		 inc $9a
$1e:e4f5  11 6d		 ora ($6d),y
$1e:e4f7  75 cc		 adc $cc,x
$1e:e4f9  5d 5e 36	  eor $365e,x
$1e:e4fc  eb			xba
$1e:e4fd  4b			phk
$1e:e4fe  ad ed b5	  lda $b5ed
$1e:e501  d8			cld
$1e:e502  e8			inx
$1e:e503  f0 34		 beq $e539
$1e:e505  d6 bb		 dec $bb,x
$1e:e507  65 b2		 adc $b2
$1e:e509  db			stp
$1e:e50a  6d 49 02	  adc $0249
$1e:e50d  48			pha
$1e:e50e  2d 17 d8	  and $d817
$1e:e511  88			dey
$1e:e512  30 60		 bmi $e574
$1e:e514  37 d5		 and [$d5],y
$1e:e516  b8			clv
$1e:e517  42 6f		 wdm #$6f
$1e:e519  c9 f3 ca	  cmp #$caf3
$1e:e51c  cf 8f 83 7d   cmp $7d838f
$1e:e520  ca			dex
$1e:e521  b1 c3		 lda ($c3),y
$1e:e523  25 94		 and $94
$1e:e525  54 86 4b	  mvn $4b,$86
$1e:e528  25 93		 and $93
$1e:e52a  c8			iny
$1e:e52b  0a			asl a
$1e:e52c  cb			wai
$1e:e52d  6b			rtl
$1e:e52e  90 c8		 bcc $e4f8
$1e:e530  64 58		 stz $58
$1e:e532  20 b9 06	  jsr $06b9
$1e:e535  01 0e		 ora ($0e,x)
$1e:e537  f9 b5 ee	  sbc $eeb5,y
$1e:e53a  b1 01		 lda ($01),y
$1e:e53c  01 00		 ora ($00,x)
$1e:e53e  01 81		 ora ($81,x)
$1e:e540  40			rti
$1e:e541  a3 90		 lda $90,s
$1e:e543  a8			tay
$1e:e544  5c 91 e8 4f   jml $4fe891
$1e:e548  20 90 40	  jsr $4090
$1e:e54b  e0 71		 cpx #$71
$1e:e54d  07 80		 ora [$80]
$1e:e54f  49 22 51	  eor #$5122
$1e:e552  37 a0		 and [$a0],y
$1e:e554  4a			lsr a
$1e:e555  9e 80 02	  stz $0280,x
$1e:e558  17 d8		 ora [$d8],y
$1e:e55a  c7 20		 cmp [$20]
$1e:e55c  92 48		 sta ($48)
$1e:e55e  d4 6e		 pei ($6e)
$1e:e560  1d 46 99	  ora $9946,x
$1e:e563  51 e3		 eor ($e3),y
$1e:e565  c1 20		 cmp ($20,x)
$1e:e567  92 41		 sta ($41)
$1e:e569  1f 61 0a 88   ora $880a61,x
$1e:e56d  bd 06 2d	  lda $2d06,x
$1e:e570  2e 9e 4b	  rol $4b9e
$1e:e573  e4 cf		 cpx $cf
$1e:e575  41 88		 eor ($88,x)
$1e:e577  3e 82 25	  rol $2582,x
$1e:e57a  19 7a 0e	  ora $0e7a,y
$1e:e57d  62 6d 57	  per $3ced
$1e:e580  9b			txy
$1e:e581  e6 9e		 inc $9e
$1e:e583  83 18		 sta $18,s
$1e:e585  01 84		 ora ($84,x)
$1e:e587  6a			ror a
$1e:e588  43 0e		 eor $0e,s
$1e:e58a  95 d7		 sta $d7,x
$1e:e58c  2b			pld
$1e:e58d  b4 8a		 ldy $8a,x
$1e:e58f  4d 2a bd	  eor $bd2a
$1e:e592  5f 99 c7 a4   eor $a4c799,x
$1e:e596  01 a0		 ora ($a0,x)
$1e:e598  11 0c		 ora ($0c),y
$1e:e59a  ca			dex
$1e:e59b  81 15		 sta ($15,x)
$1e:e59d  a8			tay
$1e:e59e  54 6a 51	  mvn $51,$6a
$1e:e5a1  5a			phy
$1e:e5a2  0c c8 50	  tsb $50c8
$1e:e5a5  41 00		 eor ($00,x)
$1e:e5a7  cc 53 ac	  cpy $ac53
$1e:e5aa  96 5a		 stx $5a,y
$1e:e5ac  c5 66		 cmp $66
$1e:e5ae  b5 66		 lda $66,x
$1e:e5b0  b3 d3		 lda ($d3,s),y
$1e:e5b2  c7 00		 cmp [$00]
$1e:e5b4  10 01		 bpl $e5b7
$1e:e5b6  60			rts
$1e:e5b7  68			pla
$1e:e5b8  34 32		 bit $32,x
$1e:e5ba  dc a4 fa	  jml [$faa4]
$1e:e5bd  a7 3f		 lda [$3f]
$1e:e5bf  c9 cb 74	  cmp #$74cb
$1e:e5c2  3a			dec a
$1e:e5c3  28			plp
$1e:e5c4  54 30 76	  mvn $76,$30
$1e:e5c7  3a			dec a
$1e:e5c8  8d 4c d7	  sta $d74c
$1e:e5cb  39 42 a1	  and $a142,y
$1e:e5ce  d1 33		 cmp ($33),y
$1e:e5d0  73 5d		 adc ($5d,s),y
$1e:e5d2  4e aa 25	  lsr $25aa
$1e:e5d5  14 05		 trb $05
$1e:e5d7  81 34		 sta ($34,x)
$1e:e5d9  b3 13		 lda ($13,s),y
$1e:e5db  0a			asl a
$1e:e5dc  2c c4 70	  bit $70c4
$1e:e5df  51 a8		 eor ($a8),y
$1e:e5e1  e4 22		 cpx $22
$1e:e5e3  12 f8		 ora ($f8)
$1e:e5e5  19 26 82	  ora $8226,y
$1e:e5e8  59 3d 96	  eor $963d,y
$1e:e5eb  e8			inx
$1e:e5ec  94 05		 sty $05,x
$1e:e5ee  08			php
$1e:e5ef  80 c0		 bra $e5b1
$1e:e5f1  61 20		 adc ($20,x)
$1e:e5f3  21 d4		 and ($d4,x)
$1e:e5f5  4d 29 93	  eor $9329
$1e:e5f8  5d 50 04	  eor $0450,x
$1e:e5fb  55 a1		 eor $a1,x
$1e:e5fd  22 88 44 43   jsl $434488
$1e:e601  22 f4 08 3a   jsl $3a08f4
$1e:e605  64 a3		 stz $a3
$1e:e607  71 09		 adc ($09),y
$1e:e609  14 0a		 trb $0a
$1e:e60b  00 cf		 brk #$cf
$1e:e60d  da			phx
$1e:e60e  9d 52 af	  sta $af52,x
$1e:e611  15 67		 ora $67,x
$1e:e613  d0 02		 bne $e617
$1e:e615  02 00		 cop #$00
$1e:e617  04 cf		 tsb $cf
$1e:e619  bb			tyx
$1e:e61a  e7 31		 sbc [$31]
$1e:e61c  99 77 96	  sta $9677,y
$1e:e61f  23 13		 and $13,s
$1e:e621  8a			txa
$1e:e622  c5 bb		 cmp $bb
$1e:e624  d3 35		 cmp ($35,s),y
$1e:e626  9b			txy
$1e:e627  77 96		 adc [$96],y
$1e:e629  43 23		 eor $23,s
$1e:e62b  92 c9		 sta ($c9)
$1e:e62d  bb			tyx
$1e:e62e  eb			xba
$1e:e62f  19 8d c7	  ora $c78d,y
$1e:e632  63 dd		 adc $dd,s
$1e:e634  f5 94		 sbc $94,x
$1e:e636  ca			dex
$1e:e637  e5 b2		 sbc $b2
$1e:e639  ee fa 77	  inc $77fa
$1e:e63c  b0 06		 bcs $e644
$1e:e63e  1f 28 11 a0   ora $a01128,x
$1e:e642  59 08 7c	  eor $7c08,y
$1e:e645  64 2f		 stz $2f
$1e:e647  b4 77		 ldy $77,x
$1e:e649  c0 2c		 cpy #$2c
$1e:e64b  0f be 0c 02   ora $020cbe
$1e:e64f  4d 03 7c	  eor $7c03
$1e:e652  3d e2 f7	  and $f7e2,x
$1e:e655  7d 82 8b	  adc $8b82,x
$1e:e658  01 60		 ora ($60,x)
$1e:e65a  b2 56		 lda ($56)
$1e:e65c  17 8c		 ora [$8c],y
$1e:e65e  b1 1f		 lda ($1f),y
$1e:e660  e6 61		 inc $61
$1e:e662  23 6a		 and $6a,s
$1e:e664  bb			tyx
$1e:e665  dd fe 00	  cmp $00fe,x
$1e:e668  37 b5		 and [$b5],y
$1e:e66a  36 7d		 rol $7d,x
$1e:e66c  d4 c2		 pei ($c2)
$1e:e66e  37 24		 and [$24],y
$1e:e670  50 e0		 bvc $e652
$1e:e672  8b			phb
$1e:e673  14 48		 trb $48
$1e:e675  31 44		 and ($44),y
$1e:e677  96 0c		 stx $0c,y
$1e:e679  71 86		 adc ($86),y
$1e:e67b  70 24		 bvs $e6a1
$1e:e67d  61 dc		 adc ($dc,x)
$1e:e67f  00 5a		 brk #$5a
$1e:e681  e8			inx
$1e:e682  f2 3b		 sbc ($3b)
$1e:e684  8a			txa
$1e:e685  19 b4 c3	  ora $c3b4,y
$1e:e688  8f 24 fb 70   sta $70fb24
$1e:e68c  4c e0 17	  jmp $17e0
$1e:e68f  31 ca		 and ($ca),y
$1e:e691  1d 0c 2e	  ora $2e0c,x
$1e:e694  79 b3 4e	  adc $4eb3,y
$1e:e697  67 f1		 adc [$f1]
$1e:e699  61 39		 adc ($39,x)
$1e:e69b  1c 16 4c	  trb $4c16
$1e:e69e  47 24		 eor [$24]
$1e:e6a0  82 c7 b6	  brl $9d6a
$1e:e6a3  b5 bb		 lda $bb,x
$1e:e6a5  e1 73		 sbc ($73,x)
$1e:e6a7  28			plp
$1e:e6a8  68			pla
$1e:e6a9  4b			phk
$1e:e6aa  c4 7e		 cpy $7e
$1e:e6ac  81 11		 sta ($11,x)
$1e:e6ae  c2 ae		 rep #$ae
$1e:e6b0  5c 90 ae ff   jml $ffae90
$1e:e6b4  33 b3		 and ($b3,s),y
$1e:e6b6  77 df		 adc [$df],y
$1e:e6b8  9e 03 62	  stz $6203,x
$1e:e6bb  40			rti
$1e:e6bc  29 59 d2	  and #$d259
$1e:e6bf  cb			wai
$1e:e6c0  57 cc		 eor [$cc],y
$1e:e6c2  2f f7 34 cf   and $cf34f7
$1e:e6c6  85 12		 sta $12
$1e:e6c8  26 2d		 rol $2d
$1e:e6ca  6a			ror a
$1e:e6cb  29 8b 62	  and #$628b
$1e:e6ce  88			dey
$1e:e6cf  22 cc a2 f4   jsl $f4a2cc
$1e:e6d3  f5 7f		 sbc $7f,x
$1e:e6d5  b0 3c		 bcs $e713
$1e:e6d7  6a			ror a
$1e:e6d8  c0 56		 cpy #$56
$1e:e6da  22 b0 54 c0   jsl $c054b0
$1e:e6de  01 01		 ora ($01,x)
$1e:e6e0  00 01		 brk #$01
$1e:e6e2  93 c3		 sta ($c3,s),y
$1e:e6e4  a1 f1		 lda ($f1,x)
$1e:e6e6  9a			txs
$1e:e6e7  35 1e		 and $1e,x
$1e:e6e9  35 4e		 and $4e,x
$1e:e6eb  a7 bc		 lda [$bc]
$1e:e6ed  86 33		 stx $33
$1e:e6ef  0d 87 49	  ora $4987
$1e:e6f2  e4 f0		 cpx $f0
$1e:e6f4  38			sec
$1e:e6f5  bb			tyx
$1e:e6f6  d4 63		 pei ($63)
$1e:e6f8  13 bc		 ora ($bc,s),y
$1e:e6fa  23 d4		 and $d4,s
$1e:e6fc  a2 b0		 ldx #$b0
$1e:e6fe  47 78		 eor [$78]
$1e:e700  42 e3		 wdm #$e3
$1e:e702  f3 bb		 sbc ($bb,s),y
$1e:e704  68			pla
$1e:e705  4c 27 13	  jmp $1327
$1e:e708  a0 90		 ldy #$90
$1e:e70a  e1 23		 sbc ($23,x)
$1e:e70c  b0 c8		 bcs $e6d6
$1e:e70e  73 c0		 adc ($c0,s),y
$1e:e710  3f b3 89 cc   and $cc89b3,x
$1e:e714  ea			nop
$1e:e715  71 76		 adc ($76),y
$1e:e717  bb			tyx
$1e:e718  89 00 46	  bit #$4600
$1e:e71b  0f b2 a8 46   ora $46a8b2
$1e:e71f  28			plp
$1e:e720  13 3c		 ora ($3c,s),y
$1e:e722  6e 32 fd	  ror $fd32
$1e:e725  7f 1a 04 ce   adc $ce041a,x
$1e:e729  85 19		 sta $19
$1e:e72b  a8			tay
$1e:e72c  bf 82 b1 18   lda $18b182,x
$1e:e730  a4 52		 ldy $52
$1e:e732  69 44 20	  adc #$2044
$1e:e735  21 95		 and ($95,x)
$1e:e737  2a			rol a
$1e:e738  33 59		 and ($59,s),y
$1e:e73a  77 8e		 adc [$8e],y
$1e:e73c  77 dd		 adc [$dd],y
$1e:e73e  ef 03 07 83   sbc $830703
$1e:e742  c2 06		 rep #$06
$1e:e744  02 90		 cop #$90
$1e:e746  67 5f		 adc [$5f]
$1e:e748  80 f0		 bra $e73a
$1e:e74a  0c 71 48	  tsb $4871
$1e:e74d  31 f8		 and ($f8),y
$1e:e74f  e2 b0		 sep #$b0
$1e:e751  19 00 c4	  ora $c400,y
$1e:e754  25 df		 and $df
$1e:e756  17 09		 ora [$09],y
$1e:e758  86 87		 stx $87
$1e:e75a  a5 e8		 lda $e8
$1e:e75c  8c 46 3d	  sty $3d46
$1e:e75f  09 15		 ora #$15
$1e:e761  f4 93 49	  pea $4993
$1e:e764  d6 52		 dec $52,x
$1e:e766  28			plp
$1e:e767  c4 8d		 cpy $8d
$1e:e769  d6 52		 dec $52,x
$1e:e76b  13 68		 ora ($68,s),y
$1e:e76d  c4 e0		 cpy $e0
$1e:e76f  d5 4a		 cmp $4a,x
$1e:e771  e4 1a		 cpx $1a
$1e:e773  0f 18 8c c1   ora $c18c18
$1e:e777  56 25		 lsr $25,x
$1e:e779  14 7e		 trb $7e
$1e:e77b  80 78		 bra $e7f5
$1e:e77d  1f c0 f0 05   ora $05f0c0,x
$1e:e781  b0 3f		 bcs $e7c2
$1e:e783  09 80		 ora #$80
$1e:e785  30 06		 bmi $e78d
$1e:e787  7f b8 30 01   adc $0130b8,x
$1e:e78b  01 00		 ora ($00,x)
$1e:e78d  01 ad		 ora ($ad,x)
$1e:e78f  bb			tyx
$1e:e790  fe ab 36	  inc $36ab,x
$1e:e793  01 1d		 ora ($1d,x)
$1e:e795  51 f4		 eor ($f4),y
$1e:e797  d5 d0		 cmp $d0,x
$1e:e799  12 57		 ora ($57)
$1e:e79b  2a			rol a
$1e:e79c  40			rti
$1e:e79d  01 04		 ora ($04,x)
$1e:e79f  05 4e		 ora $4e
$1e:e7a1  ba			tsx
$1e:e7a2  11 70		 ora ($70),y
$1e:e7a4  f8			sed
$1e:e7a5  4d c5 04	  eor $04c5
$1e:e7a8  2b			pld
$1e:e7a9  01 91		 ora ($91,x)
$1e:e7ab  8a			txa
$1e:e7ac  06 99		 asl $99
$1e:e7ae  59 a8 8a	  eor $8aa8,y
$1e:e7b1  44 76 17	  mvp $17,$76
$1e:e7b4  59 81 10	  eor $1081,y
$1e:e7b7  47 a2		 eor [$a2]
$1e:e7b9  44 0a 08	  mvp $08,$0a
$1e:e7bc  e4 68		 cpx $68
$1e:e7be  39 ac f1	  and $f1ac,y
$1e:e7c1  4c 33 64	  jmp $6433
$1e:e7c4  c1 ad		 cmp ($ad,x)
$1e:e7c6  d2 e6		 cmp ($e6)
$1e:e7c8  14 a0		 trb $a0
$1e:e7ca  f0 5d		 beq $e829
$1e:e7cc  68			pla
$1e:e7cd  3a			dec a
$1e:e7ce  0a			asl a
$1e:e7cf  7f 2e b3 a1   adc $a1b32e,x
$1e:e7d3  26 00		 rol $00
$1e:e7d5  20 2a a6	  jsr $a62a
$1e:e7d8  81 2f		 sta ($2f,x)
$1e:e7da  8e 73 3e	  stx $3e73
$1e:e7dd  73 0c		 adc ($0c,s),y
$1e:e7df  ec e2 83	  cpx $83e2
$1e:e7e2  5c 9b 57 6e   jml $6e579b
$1e:e7e6  02 81		 cop #$81
$1e:e7e8  98			tya
$1e:e7e9  50 27		 bvc $e812
$1e:e7eb  48			pha
$1e:e7ec  22 40 01 e4   jsl $e40140
$1e:e7f0  6d 01 81	  adc $8101
$1e:e7f3  2d 84 c2	  and $c284
$1e:e7f6  70 92		 bvs $e78a
$1e:e7f8  12 30		 ora ($30)
$1e:e7fa  cd e9 84	  cmp $84e9
$1e:e7fd  71 0f		 adc ($0f),y
$1e:e7ff  01 10		 ora ($10,x)
$1e:e801  94 2d		 sty $2d,x
$1e:e803  75 0c		 adc $0c,x
$1e:e805  85 6e		 sta $6e
$1e:e807  92 b1		 sta ($b1)
$1e:e809  12 d8		 ora ($d8)
$1e:e80b  ac 49 62	  ldy $6249
$1e:e80e  0f 05 a9 96   ora $96a905
$1e:e812  05 e0		 ora $e0
$1e:e814  97 08		 sta [$08],y
$1e:e816  03 43		 ora $43,s
$1e:e818  2d 0d 0d	  and $0d0d
$1e:e81b  01 01		 ora ($01,x)
$1e:e81d  00 01		 brk #$01
$1e:e81f  d7 ea		 cmp [$ea],y
$1e:e821  75 39		 adc $39,x
$1e:e823  9d 7b cc	  sta $cc7b,x
$1e:e826  33 2f		 and ($2f,s),y
$1e:e828  22 7a 96 7b   jsl $7b967a
$1e:e82c  38			sec
$1e:e82d  f1 0c		 sbc ($0c),y
$1e:e82f  f0 0c		 beq $e83d
$1e:e831  1e c0 03	  asl $03c0,x
$1e:e834  10 20		 bpl $e856
$1e:e836  e7 b4		 sbc [$b4]
$1e:e838  da			phx
$1e:e839  4c d6 b8	  jmp $b8d6
$1e:e83c  24 79		 bit $79
$1e:e83e  bd 30 64	  lda $6430,x
$1e:e841  73 3a		 adc ($3a,s),y
$1e:e843  6d 0e 87	  adc $870e
$1e:e846  57 aa		 eor [$aa],y
$1e:e848  11 1e		 ora ($1e),y
$1e:e84a  b3 43		 lda ($43,s),y
$1e:e84c  9b			txy
$1e:e84d  d3 e9		 cmp ($e9,s),y
$1e:e84f  f4 ba 1c	  pea $1cba
$1e:e852  c6 60		 dec $60
$1e:e854  42 d9		 wdm #$d9
$1e:e856  8d 80 bc	  sta $bc80
$1e:e859  05 e0		 ora $e0
$1e:e85b  f3 01		 sbc ($01,s),y
$1e:e85d  0b			phd
$1e:e85e  3b			tsc
$1e:e85f  c3 5e		 cmp $5e,s
$1e:e861  11 0c		 ora ($0c),y
$1e:e863  d8			cld
$1e:e864  fe c4 20	  inc $20c4,x
$1e:e867  48			pha
$1e:e868  02 87		 cop #$87
$1e:e86a  98			tya
$1e:e86b  7c e5 ba	  jmp ($bae5,x)
$1e:e86e  2d 6a 48	  and $486a
$1e:e871  f4 67 94	  pea $9467
$1e:e874  cf 67 d3 e2   cmp $e2d367
$1e:e878  03 05		 ora $05,s
$1e:e87a  10 e7		 bpl $e863
$1e:e87c  74 7a		 stz $7a,x
$1e:e87e  03 e0		 ora $e0,s
$1e:e880  e9 b4		 sbc #$b4
$1e:e882  ea			nop
$1e:e883  f1 0c		 sbc ($0c),y
$1e:e885  82 c8 76	  brl $5f50
$1e:e888  42 f2		 wdm #$f2
$1e:e88a  24 02		 bit $02
$1e:e88c  a4 03		 ldy $03
$1e:e88e  a0 b0		 ldy #$b0
$1e:e890  07 b0		 ora [$b0]
$1e:e892  69 f5		 adc #$f5
$1e:e894  08			php
$1e:e895  f2 4c		 sbc ($4c)
$1e:e897  06 97		 asl $97
$1e:e899  36 f2		 rol $f2,x
$1e:e89b  5d 28 bc	  eor $bc28,x
$1e:e89e  36 2f		 rol $2f,x
$1e:e8a0  20 14 80	  jsr $8014
$1e:e8a3  04 03		 tsb $03
$1e:e8a5  e1 a1		 sbc ($a1,x)
$1e:e8a7  cc b8 89	  cpy $89b8
$1e:e8aa  ca			dex
$1e:e8ab  40			rti
$1e:e8ac  01 01		 ora ($01,x)
$1e:e8ae  00 01		 brk #$01
$1e:e8b0  93 3b		 sta ($3b,s),y
$1e:e8b2  fc 01 e1	  jsr ($e101,x)
$1e:e8b5  1f 93 41 60   ora $604193,x
$1e:e8b9  d0 7b		 bne $e936
$1e:e8bb  d4 06		 pei ($06)
$1e:e8bd  04 13		 tsb $13
$1e:e8bf  78			sei
$1e:e8c0  64 36		 stz $36
$1e:e8c2  8d 47 a2	  sta $a247
$1e:e8c5  d3 a1		 cmp ($a1,s),y
$1e:e8c7  10 90		 bpl $e859
$1e:e8c9  9a			txs
$1e:e8ca  c5 22		 cmp $22
$1e:e8cc  b1 68		 lda ($68),y
$1e:e8ce  bd 3e 9b	  lda $9b3e,x
$1e:e8d1  10 88		 bpl $e85b
$1e:e8d3  c4 a2		 cpy $a2
$1e:e8d5  61 34		 adc ($34,x)
$1e:e8d7  8e 47 63	  stx $6347
$1e:e8da  d1 fa		 cmp ($fa),y
$1e:e8dc  bd 56 31	  lda $3156,x
$1e:e8df  19 8d 46	  ora $468d,y
$1e:e8e2  c2 69		 rep #$69
$1e:e8e4  24 92		 bit $92
$1e:e8e6  c9 a4 f5	  cmp #$f5a4
$1e:e8e9  fa			plx
$1e:e8ea  eb			xba
$1e:e8eb  b8			clv
$1e:e8ec  24 52		 bit $52
$1e:e8ee  30 9b		 bmi $e88b
$1e:e8f0  cb			wai
$1e:e8f1  ec f6 59	  cpx $59f6
$1e:e8f4  40			rti
$1e:e8f5  4d e4 32	  eor $32e4
$1e:e8f8  b9 64 9a	  lda $9a64,y
$1e:e8fb  53 2a		 eor ($2a,s),y
$1e:e8fd  42 00		 wdm #$00
$1e:e8ff  4d 65 b4	  eor $b465
$1e:e902  0a			asl a
$1e:e903  04 ba		 tsb $ba
$1e:e905  5b			tcd
$1e:e906  41 49		 eor ($49,x)
$1e:e908  84 ae		 sty $ae
$1e:e90a  5b			tcd
$1e:e90b  04 44		 tsb $44
$1e:e90d  14 0d		 trb $0d
$1e:e90f  2c 14 14	  bit $1414
$1e:e912  b0 24		 bcs $e938
$1e:e914  81 48		 sta ($48,x)
$1e:e916  52 e0		 eor ($e0)
$1e:e918  98			tya
$1e:e919  c2 94		 rep #$94
$1e:e91b  43 52		 eor $52,s
$1e:e91d  a9 d0 69	  lda #$69d0
$1e:e920  74 0a		 stz $0a,x
$1e:e922  62 e0 28	  per $1205
$1e:e925  30 b0		 bmi $e8d7
$1e:e927  98			tya
$1e:e928  43 ab		 eor $ab,s
$1e:e92a  15 9a		 ora $9a,x
$1e:e92c  5d 6a b7	  eor $b76a,x
$1e:e92f  60			rts
$1e:e930  b0 d2		 bcs $e904
$1e:e932  aa			tax
$1e:e933  14 26		 trb $26
$1e:e935  08			php
$1e:e936  43 e4		 eor $e4,s
$1e:e938  d0 06		 bne $e940
$1e:e93a  7f b8 30 01   adc $0130b8,x
$1e:e93e  01 00		 ora ($00,x)
$1e:e940  01 80		 ora ($80,x)
$1e:e942  3b			tsc
$1e:e943  fd ff bd	  sbc $bdff,x
$1e:e946  ee cf 6b	  inc $6bcf
$1e:e949  61 dc		 adc ($dc,x)
$1e:e94b  ec f6 42	  cpx $42f6
$1e:e94e  09 de 7f	  ora #$7fde
$1e:e951  87 63		 sta [$63]
$1e:e953  79 bd d8	  adc $d8bd,y
$1e:e956  ef b7 9b cf   sbc $cf9bb7
$1e:e95a  30 84		 bmi $e8e0
$1e:e95c  b7 fd		 lda [$fd],y
$1e:e95e  80 f0		 bra $e950
$1e:e960  d6 6b		 dec $6b,x
$1e:e962  37 5e		 and [$5e],y
$1e:e964  37 13		 and [$13],y
$1e:e966  89 e7 e2	  bit #$e2e7
$1e:e969  71 46		 adc ($46),y
$1e:e96b  61 c7		 adc ($c7,x)
$1e:e96d  16 95		 asl $95,x
$1e:e96f  62 b1 c8	  per $b223
$1e:e972  21 b7		 and ($b7,x)
$1e:e974  28			plp
$1e:e975  5a			phy
$1e:e976  5f 02 19 72   eor $721902,x
$1e:e97a  7b			tdc
$1e:e97b  d4 ae		 pei ($ae)
$1e:e97d  f5 c2		 sbc $c2,x
$1e:e97f  e0 4c 3f	  cpx #$3f4c
$1e:e982  8f 27 e7 f3   sta $f3e727
$1e:e986  25 8e		 and $8e
$1e:e988  2f b1 70 be   and $be70b1
$1e:e98c  13 0c		 ora ($0c,s),y
$1e:e98e  96 1f		 stx $1f,y
$1e:e990  4f a9 2c 02   eor $022ca9
$1e:e994  00 10		 brk #$10
$1e:e996  00 a8		 brk #$a8
$1e:e998  87 86		 sta [$86]
$1e:e99a  f9 5e ad	  sbc $ad5e,y
$1e:e99d  d6 c9		 dec $c9,x
$1e:e99f  63 e1		 adc $e1,s
$1e:e9a1  f3 78		 sbc ($78,s),y
$1e:e9a3  51 41		 eor ($41),y
$1e:e9a5  cf 0f 0d c0   cmp $c00d0f
$1e:e9a9  90 9e		 bcc $e949
$1e:e9ab  54 c1 83	  mvn $83,$c1
$1e:e9ae  88			dey
$1e:e9af  2a			rol a
$1e:e9b0  1b			tcs
$1e:e9b1  0d 80 70	  ora $7080
$1e:e9b4  9f e9 ce 45   sta $45cee9,x
$1e:e9b8  0e e3 72	  asl $72e3
$1e:e9bb  8c 27 fa	  sty $fa27
$1e:e9be  26 11		 rol $11
$1e:e9c0  38			sec
$1e:e9c1  4c 9f 6d	  jmp $6d9f
$1e:e9c4  7b			tdc
$1e:e9c5  ac 40 01	  ldy $0140
$1e:e9c8  01 00		 ora ($00,x)
$1e:e9ca  01 cc		 ora ($cc,x)
$1e:e9cc  bb			tyx
$1e:e9cd  fb			xce
$1e:e9ce  27 a1		 and [$a1]
$1e:e9d0  d6 68		 dec $68,x
$1e:e9d2  40			rti
$1e:e9d3  2f 94 77 86   and $867794
$1e:e9d7  6f 53 b4 d4   adc $d4b453
$1e:e9db  84 5f		 sty $5f
$1e:e9dd  38			sec
$1e:e9de  ef 0c d6 c3   sbc $c3d60c
$1e:e9e2  71 bc		 adc ($bc),y
$1e:e9e4  dc ec 36	  jml [$36ec]
$1e:e9e7  22 53 e4 66   jsl $66e453
$1e:e9eb  1d e1 b3	  ora $b3e1,x
$1e:e9ee  d8			cld
$1e:e9ef  ef 7f 7b ee   sbc $ee7b7f
$1e:e9f3  27 07		 and [$07]
$1e:e9f5  92 36		 sta ($36)
$1e:e9f7  0e 1e c7	  asl $c71e
$1e:e9fa  81 b2		 sta ($b2,x)
$1e:e9fc  0f 16 eb 7f   ora $7feb16
$1e:ea00  bb			tyx
$1e:ea01  e0 64 32	  cpx #$3264
$1e:ea04  3a			dec a
$1e:ea05  bc 8e 48	  ldy $488e,x
$1e:ea08  56 79		 lsr $79,x
$1e:ea0a  a1 43		 lda ($43,x)
$1e:ea0c  13 c7		 ora ($c7,s),y
$1e:ea0e  80 2d		 bra $ea3d
$1e:ea10  21 29		 and ($29,x)
$1e:ea12  0f 04 00 1a   ora $1a0004
$1e:ea16  21 58		 and ($58,x)
$1e:ea18  0f 48 50 a1   ora $a15048
$1e:ea1c  00 d5		 brk #$d5
$1e:ea1e  16 cc		 asl $cc,x
$1e:ea20  40			rti
$1e:ea21  1d 5e b7	  ora $b75e,x
$1e:ea24  5c b8 22 00   jml $0022b8
$1e:ea28  15 37		 ora $37,x
$1e:ea2a  77 bd		 adc [$bd],y
$1e:ea2c  df 36 08 c0   cmp $c00836,x
$1e:ea30  3f a3 b4 e0   and $e0b4a3,x
$1e:ea34  f9 7c de	  sbc $de7c,y
$1e:ea37  7e 12 18	  ror $1812,x
$1e:ea3a  46 c3		 lsr $c3
$1e:ea3c  ca			dex
$1e:ea3d  16 8e		 asl $8e,x
$1e:ea3f  8c 8e 24	  sty $248e
$1e:ea42  70 d2		 bvs $ea16
$1e:ea44  2b			pld
$1e:ea45  c4 8e		 cpy $8e
$1e:ea47  2b			pld
$1e:ea48  60			rts
$1e:ea49  5f 74 01 9f   eor $9f0174,x
$1e:ea4d  ee 0c 00	  inc $000c
$1e:ea50  00 74		 brk #$74
$1e:ea52  49 3e 6e	  eor #$6e3e
$1e:ea55  de 6e 7e	  dec $7e6e,x
$1e:ea58  6f 94 56 aa   adc $aa5694
$1e:ea5c  24 76		 bit $76
$1e:ea5e  01 9d		 ora ($9d,x)
$1e:ea60  02 7e		 cop #$7e
$1e:ea62  33 0e		 and ($0e,s),y
$1e:ea64  4e c6 20	  lsr $20c6
$1e:ea67  48			pha
$1e:ea68  31 ab		 and ($ab),y
$1e:ea6a  41 92		 eor ($92,x)
$1e:ea6c  5a			phy
$1e:ea6d  99 73 00	  sta $0073,y
$1e:ea70  00 2e		 brk #$2e
$1e:ea72  1d f6 2d	  ora $2df6,x
$1e:ea75  38			sec
$1e:ea76  32 9a		 and ($9a)
$1e:ea78  3e 12 3e	  rol $3e12,x
$1e:ea7b  ce 00 76	  dec $7600
$1e:ea7e  01 9d		 ora ($9d,x)
$1e:ea80  02 87		 cop #$87
$1e:ea82  0c 69 39	  tsb $3969
$1e:ea85  c6 20		 dec $20
$1e:ea87  48			pha
$1e:ea88  31 ab		 and ($ab),y
$1e:ea8a  41 92		 eor ($92,x)
$1e:ea8c  5a			phy
$1e:ea8d  99 73 00	  sta $0073,y
$1e:ea90  00 26		 brk #$26
$1e:ea92  00 6a		 brk #$6a
$1e:ea94  00 ce		 brk #$ce
$1e:ea96  00 32		 brk #$32
$1e:ea98  01 38		 ora ($38,x)
$1e:ea9a  32 ce		 and ($ce)
$1e:ea9c  00 76		 brk #$76
$1e:ea9e  01 9d		 ora ($9d,x)
$1e:eaa0  02 7e		 cop #$7e
$1e:eaa2  33 ff		 and ($ff,s),y
$1e:eaa4  67 e6		 adc [$e6]
$1e:eaa6  30 69		 bmi $eb11
$1e:eaa8  49 cc 61	  eor #$61cc
$1e:eaab  36 7f		 rol $7f,x
$1e:eaad  ff 7f 84 10   sbc $10847f,x
$1e:eab1  00 00		 brk #$00
$1e:eab3  83 28		 sta $28,s
$1e:eab5  07 49		 ora [$49]
$1e:eab7  ee 69 ff	  inc $ff69
$1e:eaba  7f ff 7f 0a   adc $0a7fff,x
$1e:eabe  61 4b		 adc ($4b,x)
$1e:eac0  65 ad		 adc $ad
$1e:eac2  65 ee		 adc $ee
$1e:eac4  69 50 6a	  adc #$6a50
$1e:eac7  91 6e		 sta ($6e),y
$1e:eac9  f3 6e		 sbc ($6e,s),y
$1e:eacb  34 73		 bit $73,x
$1e:eacd  96 73		 stx $73,y
$1e:eacf  01 01		 ora ($01,x)
$1e:ead1  00 01		 brk #$01
$1e:ead3  ef 62 1e 07   sbc $071e62
$1e:ead7  de 77 b6	  dec $b677,x
$1e:eada  02 fe		 cop #$fe
$1e:eadc  00 3f		 brk #$3f
$1e:eade  37 98		 and [$98],y
$1e:eae0  00 78		 brk #$78
$1e:eae2  fc 0e 03	  jsr ($030e,x)
$1e:eae5  0e 10 3f	  asl $3f10
$1e:eae8  77 b8		 adc [$b8],y
$1e:eaea  20 60 d1	  jsr $d160
$1e:eaed  85 c2		 sta $c2
$1e:eaef  e0 62 00	  cpx #$0062
$1e:eaf2  11 88		 ora ($88),y
$1e:eaf4  88			dey
$1e:eaf5  e1 41		 sbc ($41,x)
$1e:eaf7  e1 eb		 sbc ($eb,x)
$1e:eaf9  f5 e4		 sbc $e4,x
$1e:eafb  13 d1		 ora ($d1,s),y
$1e:eafd  18			clc
$1e:eafe  8c c4 62	  sty $62c4
$1e:eb01  02 d0		 cop #$d0
$1e:eb03  ef 0c 00 58   sbc $58000c
$1e:eb07  14 51		 trb $51
$1e:eb09  51 11		 eor ($11),y
$1e:eb0b  04 78		 tsb $78
$1e:eb0d  0f 60 10 9c   ora $9c1060
$1e:eb11  2b			pld
$1e:eb12  f7 fb		 sbc [$fb],y
$1e:eb14  12 19		 ora ($19)
$1e:eb16  34 03		 bit $03,x
$1e:eb18  e3 04		 sbc $04,s
$1e:eb1a  11 88		 ora ($88),y
$1e:eb1c  c4 04		 cpy $04
$1e:eb1e  66 2d		 ror $2d
$1e:eb20  21 b1		 and ($b1,x)
$1e:eb22  8d 8c c4	  sta $c48c
$1e:eb25  02 d3		 cop #$d3
$1e:eb27  21 50		 and ($50,x)
$1e:eb29  b8			clv
$1e:eb2a  c4 66		 cpy $66
$1e:eb2c  63 31		 adc $31,s
$1e:eb2e  e8			inx
$1e:eb2f  df af aa 02   cmp $02aaaf,x
$1e:eb33  10 02		 bpl $eb37
$1e:eb35  81 3b		 sta ($3b,x)
$1e:eb37  de 6c 36	  dec $366c,x
$1e:eb3a  15 60		 ora $60,x
$1e:eb3c  43 70		 eor $70,s
$1e:eb3e  58			cli
$1e:eb3f  27 9b		 and [$9b]
$1e:eb41  dd 8e c6	  cmp $c68e,x
$1e:eb44  b0 08		 bcs $eb4e
$1e:eb46  58			cli
$1e:eb47  0c 04 f7	  tsb $f704
$1e:eb4a  40			rti
$1e:eb4b  19 fe e0	  ora $e0fe,y
$1e:eb4e  c0 02 01	  cpy #$0102
$1e:eb51  00 02		 brk #$02
$1e:eb53  80 3b		 bra $eb90
$1e:eb55  fc 01 e1	  jsr ($e101,x)
$1e:eb58  1f 11 78 cf   ora $cf7811,x
$1e:eb5c  c8			iny
$1e:eb5d  9e 55 f3	  stz $f355,x
$1e:eb60  37 9d		 and [$9d],y
$1e:eb62  fd 11 e9	  sbc $e911,x
$1e:eb65  9f 55 7a ef   sta $ef7a55,x
$1e:eb69  d9 9e dd	  cmp $dd9e,y
$1e:eb6c  f7 77		 sbc [$77],y
$1e:eb6e  bf fc 21 e1   lda $e121fc,x
$1e:eb72  74 81		 stz $81,x
$1e:eb74  05 f2		 ora $f2
$1e:eb76  13 0a		 ora ($0a,s),y
$1e:eb78  85 c3		 sta $c3
$1e:eb7a  21 a1		 and ($a1,x)
$1e:eb7c  79 88 c4	  adc $c488,y
$1e:eb7f  a2 71 48	  ldx #$4871
$1e:eb82  a8			tay
$1e:eb83  5e 63 31	  lsr $3163,x
$1e:eb86  a8			tay
$1e:eb87  dc 72 3a	  jml [$3a72]
$1e:eb8a  17 99		 ora [$99],y
$1e:eb8c  0c 8a 47	  tsb $478a
$1e:eb8f  24 92		 bit $92
$1e:eb91  85 e6		 sta $e6
$1e:eb93  53 2a		 eor ($2a,s),y
$1e:eb95  95 cb		 sta $cb,x
$1e:eb97  25 a1		 and $a1
$1e:eb99  79 98 cc	  adc $cc98,y
$1e:eb9c  a6 73		 ldx $73
$1e:eb9e  49 ac d8	  eor #$d8ac
$1e:eba1  2f 13 99 d4   and $d49913
$1e:eba5  ee 79 3d	  inc $3d79
$1e:eba8  9f 05 de 81   sta $81de05,x
$1e:ebac  41 a1		 eor ($a1,x)
$1e:ebae  50 e8		 bvc $eb98
$1e:ebb0  94 5a		 sty $5a,x
$1e:ebb2  30 5d		 bmi $ec11
$1e:ebb4  e9 14 9a	  sbc #$9a14
$1e:ebb7  55 2e		 eor $2e,x
$1e:ebb9  99 4d a7	  sta $a74d,y
$1e:ebbc  05 de		 ora $de
$1e:ebbe  a1 51		 lda ($51,x)
$1e:ebc0  a9 54 ea	  lda #$ea54
$1e:ebc3  95 5a		 sta $5a,x
$1e:ebc5  b3 30		 lda ($30,s),y
$1e:ebc7  02 fe		 cop #$fe
$1e:ebc9  df d0 01 01   cmp $0101d0,x
$1e:ebcd  00 01		 brk #$01
$1e:ebcf  b5 3b		 lda $3b,x
$1e:ebd1  c7 09		 cmp [$09]
$1e:ebd3  68			pla
$1e:ebd4  7a			ply
$1e:ebd5  16 22		 asl $22,x
$1e:ebd7  d6 fa		 dec $fa,x
$1e:ebd9  27 83		 and [$83]
$1e:ebdb  bd d5 e2	  lda $e2d5,x
$1e:ebde  37 2b		 and [$2b],y
$1e:ebe0  9b			txy
$1e:ebe1  d0 c2		 bne $eba5
$1e:ebe3  40			rti
$1e:ebe4  f9 27 90	  sbc $9027,y
$1e:ebe7  de af 6f	  dec $6faf,x
$1e:ebea  43 11		 eor $11,s
$1e:ebec  0b			phd
$1e:ebed  e4 70		 cpx $70
$1e:ebef  96 cb		 stx $cb,y
$1e:ebf1  46 0b		 lsr $0b
$1e:ebf3  06 fa		 asl $fa
$1e:ebf5  31 90		 and ($90),y
$1e:ebf7  5a			phy
$1e:ebf8  2d 8f 90	  and $908f
$1e:ebfb  b9 5d 1e	  lda $1e5d,y
$1e:ebfe  82 fa 37	  brl $23fb
$1e:ec01  a0 de 03	  ldy #$03de
$1e:ec04  41 7a		 eor ($7a,x)
$1e:ec06  be 10 67	  ldx $6710,y
$1e:ec09  00 23		 brk #$23
$1e:ec0b  0c 16 11	  tsb $1116
$1e:ec0e  f4 66 14	  pea $1466
$1e:ec11  c4 0e		 cpy $0e
$1e:ec13  80 84		 bra $eb99
$1e:ec15  a6 14		 ldx $14
$1e:ec17  7a			ply
$1e:ec18  08			php
$1e:ec19  c0 0e 34	  cpy #$340e
$1e:ec1c  30 02		 bmi $ec20
$1e:ec1e  60			rts
$1e:ec1f  5b			tcd
$1e:ec20  6e b8 c7	  ror $c7b8
$1e:ec23  d1 dd		 cmp ($dd),y
$1e:ec25  ee b6 f1	  inc $f1b6
$1e:ec28  f8			sed
$1e:ec29  97 04		 sta [$04],y
$1e:ec2b  85 04		 sta $04
$1e:ec2d  f1 36		 sbc ($36),y
$1e:ec2f  43 d0		 eor $d0,s
$1e:ec31  4b			phk
$1e:ec32  e0 16 3b	  cpx #$3b16
$1e:ec35  45 b7		 eor $b7
$1e:ec37  19 6e bb	  ora $bb6e,y
$1e:ec3a  db			stp
$1e:ec3b  d8			cld
$1e:ec3c  04 25		 tsb $25
$1e:ec3e  57 a0		 eor [$a0],y
$1e:ec40  5d 99 cd	  eor $cd99,x
$1e:ec43  00 6f		 brk #$6f
$1e:ec45  e8			inx
$1e:ec46  02 01		 cop #$01
$1e:ec48  00 02		 brk #$02
$1e:ec4a  8d bb f7	  sta $f7bb
$1e:ec4d  33 ad		 and ($ad,s),y
$1e:ec4f  00 64		 brk #$64
$1e:ec51  66 38		 ror $38
$1e:ec53  10 c8		 bpl $ec1d
$1e:ec55  ce 58 41	  dec $4158
$1e:ec58  91 9c		 sta ($9c),y
$1e:ec5a  b8			clv
$1e:ec5b  c3 03		 cmp $03,s
$1e:ec5d  fe 30 3b	  inc $3b30,x
$1e:ec60  67 bc		 adc [$bc]
$1e:ec62  ac 96 c1	  ldy $c196
$1e:ec65  f2 c6		 sbc ($c6)
$1e:ec67  7e e6 64	  ror $64e6,x
$1e:ec6a  1f 80 bd 05   ora $05bd80,x
$1e:ec6e  ec 2f 02	  cpx $022f
$1e:ec71  fa			plx
$1e:ec72  8a			txa
$1e:ec73  18			clc
$1e:ec74  dd ba 10	  cmp $10ba,x
$1e:ec77  70 20		 bvs $ec99
$1e:ec79  2c 3a 27	  bit $273a
$1e:ec7c  0b			phd
$1e:ec7d  4d 96 d7	  eor $d796
$1e:ec80  2d e7 d6	  and $d6e7
$1e:ec83  ea			nop
$1e:ec84  40			rti
$1e:ec85  0f 00 67 fb   ora $fb6700
$1e:ec89  7b			tdc
$1e:ec8a  23 6e		 and $6e,s
$1e:ec8c  fd 63 3b	  sbc $3b63,x
$1e:ec8f  19 33 4a	  ora $4a33,y
$1e:ec92  d0 07		 bne $ec9b
$1e:ec94  dc 68 81	  jml [$8168]
$1e:ec97  b1 a5		 lda ($a5),y
$1e:ec99  b3 9d		 lda ($9d,s),y
$1e:ec9b  90 3d		 bcc $ecda
$1e:ec9d  e7 64		 sbc [$64]
$1e:ec9f  f7 95		 sbc [$95],y
$1e:eca1  50 78		 bvc $ed1b
$1e:eca3  ff 73 2a 0b   sbc $0b2a73,x
$1e:eca7  3c 7b f1	  bit $f17b,x
$1e:ecaa  a6 31		 ldx $31
$1e:ecac  6d 4e 92	  adc $924e
$1e:ecaf  0f 32 27 9d   ora $9d2732
$1e:ecb3  61 fe		 adc ($fe,x)
$1e:ecb5  db			stp
$1e:ecb6  5c b7 9d fe   jml $fe9db7
$1e:ecba  5a			phy
$1e:ecbb  27 06		 and [$06]
$1e:ecbd  b7 7c		 lda [$7c],y
$1e:ecbf  01 01		 ora ($01,x)
$1e:ecc1  00 01		 brk #$01
$1e:ecc3  ad bb fe	  lda $febb
$1e:ecc6  ab			plb
$1e:ecc7  36 01		 rol $01,x
$1e:ecc9  3d 51 fc	  and $fc51,x
$1e:eccc  55 d9		 eor $d9,x
$1e:ecce  b8			clv
$1e:eccf  49 eb 95	  eor #$95eb
$1e:ecd2  2a			rol a
$1e:ecd3  dd 4e bb	  cmp $bb4e,x
$1e:ecd6  50 ac		 bvc $ec84
$1e:ecd8  dd 6e b3	  cmp $b36e,x
$1e:ecdb  01 2a		 ora ($2a,x)
$1e:ecdd  54 43 a3	  mvn $a3,$43
$1e:ece0  4c 12 85	  jmp $8512
$1e:ece3  02 70		 cop #$70
$1e:ece5  25 21		 and $21
$1e:ece7  98			tya
$1e:ece8  dd 41 81	  cmp $8141,x
$1e:eceb  53 cd		 eor ($cd,s),y
$1e:eced  67 88		 adc [$88]
$1e:ecef  2d 9b 19	  and $199b
$1e:ecf2  00 70		 brk #$70
$1e:ecf4  2a			rol a
$1e:ecf5  7a			ply
$1e:ecf6  0a			asl a
$1e:ecf7  cf 2c a4 34   cmp $34a42c
$1e:ecfb  f2 90		 sbc ($90)
$1e:ecfd  e8			inx
$1e:ecfe  68			pla
$1e:ecff  15 a1		 ora $a1,x
$1e:ed01  60			rts
$1e:ed02  54 f3 99	  mvn $99,$f3
$1e:ed05  f3 0b		 sbc ($0b,s),y
$1e:ed07  67 68		 adc [$68]
$1e:ed09  15 7b		 ora $7b,x
$1e:ed0b  a9 38 27	  lda #$2738
$1e:ed0e  47 08		 eor [$08]
$1e:ed10  12 85		 ora ($85)
$1e:ed12  04 9c		 tsb $9c
$1e:ed14  03 28		 ora $28,s
$1e:ed16  12 89		 ora ($89)
$1e:ed18  f4 92 14	  pea $1492
$1e:ed1b  8d ea 53	  sta $53ea
$1e:ed1e  c0 29 2b	  cpy #$2b29
$1e:ed21  03 a5		 ora $a5,s
$1e:ed23  ab			plb
$1e:ed24  01 60		 ora ($60,x)
$1e:ed26  4f 07 a9 9f   eor $9fa907
$1e:ed2a  41 e0		 eor ($e0,x)
$1e:ed2c  90 06		 bcc $ed34
$1e:ed2e  7f b8 30 06   adc $0630b8,x
$1e:ed32  00 4e		 brk #$4e
$1e:ed34  2e 0d ff	  rol $ff0d
$1e:ed37  f1 b8		 sbc ($b8),y
$1e:ed39  07 00		 ora [$00]
$1e:ed3b  18			clc
$1e:ed3c  00 00		 brk #$00
$1e:ed3e  2f 32 65 7f   and $7f6532
$1e:ed42  98			tya
$1e:ed43  b2 cb		 lda ($cb)
$1e:ed45  e5 fc		 sbc $fc
$1e:ed47  19 32 4c	  ora $4c32,y
$1e:ed4a  65 72		 adc $72
$1e:ed4c  7f 8c 98 a5   adc $a5988c,x
$1e:ed50  b2 bf		 lda ($bf)
$1e:ed52  cb			wai
$1e:ed53  d8			cld
$1e:ed54  e5 f2		 sbc $f2
$1e:ed56  fc 35 00	  jsr ($0035,x)
$1e:ed59  00 10		 brk #$10
$1e:ed5b  02 10		 cop #$10
$1e:ed5d  0a			asl a
$1e:ed5e  10 ff		 bpl $ed5f
$1e:ed60  00 02		 brk #$02
$1e:ed62  10 00		 bpl $ed64
$1e:ed64  00 1a		 brk #$1a
$1e:ed66  10 1f		 bpl $ed87
$1e:ed68  10 22		 bpl $ed8c
$1e:ed6a  10 25		 bpl $ed91
$1e:ed6c  10 28		 bpl $ed96
$1e:ed6e  10 2b		 bpl $ed9b
$1e:ed70  10 2e		 bpl $eda0
$1e:ed72  10 31		 bpl $eda5
$1e:ed74  10 fa		 bpl $ed70
$1e:ed76  01 60		 ora ($60,x)
$1e:ed78  c9 00 60	  cmp #$6000
$1e:ed7b  c9 00 60	  cmp #$6000
$1e:ed7e  c9 00 60	  cmp #$6000
$1e:ed81  c9 00 60	  cmp #$6000
$1e:ed84  c9 00 60	  cmp #$6000
$1e:ed87  c9 00 60	  cmp #$6000
$1e:ed8a  c9 00 60	  cmp #$6000
$1e:ed8d  c9 00 00	  cmp #$0000
$1e:ed90  04 00		 tsb $00
$1e:ed92  34 2c		 bit $2c,x
$1e:ed94  53 73		 eor ($73,s),y
$1e:ed96  94 77		 sty $77,x
$1e:ed98  02 00		 cop #$00
$1e:ed9a  fd 0f d3	  sbc $d30f,x
$1e:ed9d  77 00		 adc [$00],y
$1e:ed9f  00 01		 brk #$01
$1e:eda1  1d 01 01	  ora $0101,x
$1e:eda4  00 01		 brk #$01
$1e:eda6  87 43		 sta [$43]
$1e:eda8  a4 ef		 ldy $ef
$1e:edaa  19 77 84	  ora $8477,y
$1e:edad  3a			dec a
$1e:edae  07 52		 ora [$52]
$1e:edb0  a9 80 62	  lda #$6280
$1e:edb3  08			php
$1e:edb4  f0 08		 beq $edbe
$1e:edb6  5d 6a b6	  eor $b66a,x
$1e:edb9  11 88		 ora ($88),y
$1e:edbb  63 c4		 adc $c4,s
$1e:edbd  2a			rol a
$1e:edbe  1b			tcs
$1e:edbf  5d b0 89	  eor $89b0,x
$1e:edc2  f6 f5		 inc $f5,x
$1e:edc4  17 88		 ora [$88],y
$1e:edc6  56 37		 lsr $37,x
$1e:edc8  9a			txs
$1e:edc9  79 c4 e8	  adc $e8c4,y
$1e:edcc  64 b6		 stz $b6
$1e:edce  1a			inc a
$1e:edcf  c8			iny
$1e:edd0  78			sei
$1e:edd1  68			pla
$1e:edd2  74 ba		 stz $ba,x
$1e:edd4  05 0a		 ora $0a
$1e:edd6  86 43		 stx $43
$1e:edd8  02 11		 cop #$11
$1e:edda  52 c5		 eor ($c5)
$1e:eddc  a8			tay
$1e:eddd  43 02		 eor $02,s
$1e:eddf  92 8f		 sta ($8f)
$1e:ede1  06 1d		 asl $1d
$1e:ede3  0f da 49 f1   ora $f149da
$1e:ede7  98			tya
$1e:ede8  d3 12		 cmp ($12,s),y
$1e:edea  ee 61 af	  inc $af61
$1e:eded  00 a8		 brk #$a8
$1e:edef  14 68		 trb $68
$1e:edf1  5a			phy
$1e:edf2  44 1a 1e	  mvp $1e,$1a
$1e:edf5  90 c4		 bcc $edbb
$1e:edf7  29 14 a4	  and #$a414
$1e:edfa  92 9f		 sta ($9f)
$1e:edfc  0f 7b be 51   ora $51be7b
$1e:ee00  3e fc ba	  rol $bafc,x
$1e:ee03  31 3a		 and ($3a),y
$1e:ee05  a5 71		 lda $71
$1e:ee07  63 11		 adc $11,s
$1e:ee09  47 e8		 eor [$e8]
$1e:ee0b  bc 72 00	  ldy $0072,x
$1e:ee0e  cf f7 06 00   cmp $0006f7
$1e:ee12  2b			pld
$1e:ee13  15 00		 ora $00,x
$1e:ee15  00 00		 brk #$00
$1e:ee17  38			sec
$1e:ee18  80 50		 bra $ee6a
$1e:ee1a  40			rti
$1e:ee1b  69 69 7e	  adc #$7e69
$1e:ee1e  ea			nop
$1e:ee1f  00 70		 brk #$70
$1e:ee21  01 17		 ora ($17,x)
$1e:ee23  02 be		 cop #$be
$1e:ee25  02 00		 cop #$00
$1e:ee27  01 c0		 ora ($c0,x)
$1e:ee29  01 c0		 ora ($c0,x)
$1e:ee2b  02 80		 cop #$80
$1e:ee2d  32 1e		 and ($1e)
$1e:ee2f  00 9c		 brk #$9c
$1e:ee31  73 2b		 adc ($2b,s),y
$1e:ee33  15 00		 ora $00,x
$1e:ee35  00 07		 brk #$07
$1e:ee37  28			plp
$1e:ee38  0c 44 11	  tsb $1144
$1e:ee3b  60			rts
$1e:ee3c  16 7c		 asl $7c,x
$1e:ee3e  47 01		 eor [$01]
$1e:ee40  0d 02 13	  ora $1302
$1e:ee43  03 ff		 ora $ff,s
$1e:ee45  03 12		 ora $12,s
$1e:ee47  00 19		 brk #$19
$1e:ee49  00 df		 brk #$df
$1e:ee4b  00 5f		 brk #$5f
$1e:ee4d  02 5f		 cop #$5f
$1e:ee4f  43 ff		 eor $ff,s
$1e:ee51  7f 2b 15 64   adc $64152b,x
$1e:ee55  08			php
$1e:ee56  06 21		 asl $21
$1e:ee58  aa			tax
$1e:ee59  35 4e		 and $4e,x
$1e:ee5b  4a			lsr a
$1e:ee5c  13 63		 ora ($63,s),y
$1e:ee5e  c9 18 4e	  cmp #$4e18
$1e:ee61  29 d4 39	  and #$39d4
$1e:ee64  d9 5a ee	  cmp $ee5a,y
$1e:ee67  00 72		 brk #$72
$1e:ee69  09 f6 11	  ora #$11f6
$1e:ee6c  9a			txs
$1e:ee6d  22 de 7b ff   jsl $ff7bde
$1e:ee71  7f 4a 29 00   adc $00294a,x
$1e:ee75  00 86		 brk #$86
$1e:ee77  25 49		 and $49
$1e:ee79  3a			dec a
$1e:ee7a  0c 4b f0	  tsb $f04b
$1e:ee7d  5f 4a 01 72   eor $72014a,x
$1e:ee81  01 d8		 ora ($d8,x)
$1e:ee83  01 df		 ora ($df,x)
$1e:ee85  02 12		 cop #$12
$1e:ee87  00 19		 brk #$19
$1e:ee89  00 df		 brk #$df
$1e:ee8b  00 5f		 brk #$5f
$1e:ee8d  02 5f		 cop #$5f
$1e:ee8f  43 ff		 eor $ff,s
$1e:ee91  7f 4a 29 00   adc $00294a,x
$1e:ee95  00 e0		 brk #$e0
$1e:ee97  48			pha
$1e:ee98  60			rts
$1e:ee99  59 00 6a	  eor $6a00,y
$1e:ee9c  c0 7e ec	  cpy #$ec7e
$1e:ee9f  00 b2		 brk #$b2
$1e:eea1  01 78		 ora ($78,x)
$1e:eea3  02 7e		 cop #$7e
$1e:eea5  03 0c		 ora $0c,s
$1e:eea7  30 12		 bmi $eebb
$1e:eea9  48			pha
$1e:eeaa  18			clc
$1e:eeab  60			rts
$1e:eeac  1f 7c 10 75   ora $75107c,x
$1e:eeb0  ff 7f 4a 29   sbc $294a7f,x
$1e:eeb4  00 00		 brk #$00
$1e:eeb6  cc 18 10	  cpy $1018
$1e:eeb9  21 54		 and ($54,x)
$1e:eebb  29 59 4a	  and #$4a59
$1e:eebe  00 58		 brk #$58
$1e:eec0  00 7c		 brk #$7c
$1e:eec2  00 7e		 brk #$7e
$1e:eec4  ff 7f c8 14   sbc $14c87f,x
$1e:eec8  4c 25 d0	  jmp $d025
$1e:eecb  35 54		 and $54,x
$1e:eecd  46 d8		 lsr $d8
$1e:eecf  56 5c		 lsr $5c,x
$1e:eed1  67 b1		 adc [$b1]
$1e:eed3  00 00		 brk #$00
$1e:eed5  00 2a		 brk #$2a
$1e:eed7  23 21		 and $21,s
$1e:eed9  0c ff 7b	  tsb $7bff
$1e:eedc  d1 5d		 cmp ($5d),y
$1e:eede  0a			asl a
$1e:eedf  35 85		 and $85,x
$1e:eee1  1c 5f 5e	  trb $5e5f
$1e:eee4  1f 39 79 30   ora $307939,x
$1e:eee8  30 20		 bmi $ef0a
$1e:eeea  29 14 20	  and #$2014
$1e:eeed  08			php
$1e:eeee  39 77 00	  and $0077,y
$1e:eef1  00 10		 brk #$10
$1e:eef3  02 b7		 cop #$b7
$1e:eef5  02 51		 cop #$51
$1e:eef7  16 cc		 asl $cc,x
$1e:eef9  1d 69 19	  ora $1969,x
$1e:eefc  00 00		 brk #$00
$1e:eefe  00 00		 brk #$00
$1e:ef00  00 00		 brk #$00
$1e:ef02  00 00		 brk #$00
$1e:ef04  9d 17 00	  sta $0017,x
$1e:ef07  00 00		 brk #$00
$1e:ef09  00 00		 brk #$00
$1e:ef0b  00 00		 brk #$00
$1e:ef0d  00 00		 brk #$00
$1e:ef0f  00 00		 brk #$00
$1e:ef11  00 2a		 brk #$2a
$1e:ef13  5d 3f 01	  eor $013f,x
$1e:ef16  df 06 9f 2f   cmp $2f9f06,x
$1e:ef1a  ff 7b d1 5d   sbc $5dd17b,x
$1e:ef1e  0a			asl a
$1e:ef1f  35 85		 and $85,x
$1e:ef21  1c 21 0c	  trb $0c21
$1e:ef24  58			cli
$1e:ef25  00 6f		 brk #$6f
$1e:ef27  00 d6		 brk #$d6
$1e:ef29  14 3f		 trb $3f
$1e:ef2b  0e ca 04	  asl $04ca
$1e:ef2e  39 77 73	  and $7377,y
$1e:ef31  09 00 36	  ora #$3600
$1e:ef34  40			rti
$1e:ef35  55 ee		 eor $ee,x
$1e:ef37  35 80		 and $80,x
$1e:ef39  4e c0 40	  lsr $40c0
$1e:ef3c  60			rts
$1e:ef3d  2c 00 10	  bit $1000
$1e:ef40  00 00		 brk #$00
$1e:ef42  db			stp
$1e:ef43  0a			asl a
$1e:ef44  4b			phk
$1e:ef45  00 d3		 brk #$d3
$1e:ef47  00 98		 brk #$98
$1e:ef49  11 1a		 ora ($1a),y
$1e:ef4b  1a			inc a
$1e:ef4c  9b			txy
$1e:ef4d  2e fb 3a	  rol $3afb
$1e:ef50  3b			tsc
$1e:ef51  57 00		 eor [$00],y
$1e:ef53  00 40		 brk #$40
$1e:ef55  55 4f		 eor $4f,x
$1e:ef57  4e 13 57	  lsr $5713
$1e:ef5a  68			pla
$1e:ef5b  35 60		 and $60,x
$1e:ef5d  0c e0 24	  tsb $24e0
$1e:ef60  04 00		 tsb $00
$1e:ef62  00 00		 brk #$00
$1e:ef64  4b			phk
$1e:ef65  00 d3		 brk #$d3
$1e:ef67  00 98		 brk #$98
$1e:ef69  11 1a		 ora ($1a),y
$1e:ef6b  1a			inc a
$1e:ef6c  9b			txy
$1e:ef6d  2e fb 3a	  rol $3afb
$1e:ef70  3b			tsc
$1e:ef71  57 00		 eor [$00],y
$1e:ef73  48			pha
$1e:ef74  40			rti
$1e:ef75  55 5b		 eor $5b,x
$1e:ef77  39 da 20	  and $20da,y
$1e:ef7a  56 10		 lsr $10,x
$1e:ef7c  02 00		 cop #$00
$1e:ef7e  53 01		 eor ($01,s),y
$1e:ef80  3b			tsc
$1e:ef81  02 db		 cop #$db
$1e:ef83  0a			asl a
$1e:ef84  4b			phk
$1e:ef85  00 d3		 brk #$d3
$1e:ef87  00 98		 brk #$98
$1e:ef89  11 1a		 ora ($1a),y
$1e:ef8b  1a			inc a
$1e:ef8c  9b			txy
$1e:ef8d  2e fb 3a	  rol $3afb
$1e:ef90  3b			tsc
$1e:ef91  57 ca		 eor [$ca],y
$1e:ef93  0c 00 00	  tsb $0000
$1e:ef96  ee 00 54	  inc $5400
$1e:ef99  01 ba		 ora ($ba,x)
$1e:ef9b  01 5e		 ora ($5e,x)
$1e:ef9d  02 3f		 cop #$3f
$1e:ef9f  43 8c		 eor $8c,s
$1e:efa1  1d 52 36	  ora $3652,x
$1e:efa4  18			clc
$1e:efa5  4f de 6f 04   eor $046fde
$1e:efa9  28			plp
$1e:efaa  46 40		 lsr $40
$1e:efac  e9 58 ce	  sbc #$ce58
$1e:efaf  71 5a		 adc ($5a),y
$1e:efb1  03 25		 ora $25,s
$1e:efb3  31 00		 and ($00),y
$1e:efb5  00 ee		 brk #$ee
$1e:efb7  00 72		 brk #$72
$1e:efb9  09 f6 11	  ora #$11f6
$1e:efbc  9a			txs
$1e:efbd  22 3c 4f c8   jsl $c84f3c
$1e:efc1  00 b0		 brk #$b0
$1e:efc3  01 14		 ora ($14,x)
$1e:efc5  02 ff		 cop #$ff
$1e:efc7  7f 70 0c b8   adc $b80c70,x
$1e:efcb  14 df		 trb $df
$1e:efcd  18			clc
$1e:efce  5e 03 00	  lsr $0003,x
$1e:efd1  60			rts
$1e:efd2  25 31		 and $31
$1e:efd4  00 00		 brk #$00
$1e:efd6  04 19		 tsb $19
$1e:efd8  87 29		 sta [$29]
$1e:efda  0a			asl a
$1e:efdb  36 8e		 rol $8e,x
$1e:efdd  42 96		 wdm #$96
$1e:efdf  67 65		 adc [$65]
$1e:efe1  39 a6 41	  and $41a6,y
$1e:efe4  08			php
$1e:efe5  52 ff		 eor ($ff)
$1e:efe7  7f ff 7f ff   adc $ff7fff,x
$1e:efeb  7f ff 7f ff   adc $ff7fff,x
$1e:efef  7f a6 41 46   adc $4641a6,x
$1e:eff3  21 21		 and ($21,x)
$1e:eff5  04 c0		 tsb $c0
$1e:eff7  14 80		 trb $80
$1e:eff9  21 40		 and ($40,x)
$1e:effb  36 00		 rol $00,x
$1e:effd  47 28		 eor [$28]
$1e:efff  00 8c		 brk #$8c
$1e:f001  00 10		 brk #$10
$1e:f003  01 94		 ora ($94,x)
$1e:f005  01 cc		 ora ($cc,x)
$1e:f007  00 72		 brk #$72
$1e:f009  01 38		 ora ($38,x)
$1e:f00b  02 3f		 cop #$3f
$1e:f00d  03 1c		 ora $1c,s
$1e:f00f  00 99		 brk #$99
$1e:f011  7f 46 21 00   adc $002146,x
$1e:f015  00 c8		 brk #$c8
$1e:f017  2d 4c 3e	  and $3e4c
$1e:f01a  cf 52 54 67   cmp $675452
$1e:f01e  0a			asl a
$1e:f01f  01 b0		 ora ($b0,x)
$1e:f021  09 56 12	  ora #$1256
$1e:f024  dc 22 43	  jml [$4322]
$1e:f027  04 87		 tsb $87
$1e:f029  0c ec 14	  tsb $14ec
$1e:f02c  50 1d		 bvc $f04b
$1e:f02e  d3 29		 cmp ($29,s),y
$1e:f030  fb			xce
$1e:f031  7b			tdc
$1e:f032  46 21		 lsr $21
$1e:f034  00 00		 brk #$00
$1e:f036  f2 38		 sbc ($38)
$1e:f038  58			cli
$1e:f039  4d fe 61	  eor $61fe
$1e:f03c  7f 72 00 01   adc $010072,x
$1e:f040  e0 01 00	  cpx #$0001
$1e:f043  03 f3		 ora $f3,s
$1e:f045  33 0a		 and ($0a,s),y
$1e:f047  01 b0		 ora ($b0,x)
$1e:f049  09 56 12	  ora #$1256
$1e:f04c  dc 22 1c	  jml [$1c22]
$1e:f04f  00 7f		 brk #$7f
$1e:f051  02 4a		 cop #$4a
$1e:f053  29 00 00	  and #$0000
$1e:f056  85 1d		 sta $1d
$1e:f058  47 2e		 eor [$2e]
$1e:f05a  0a			asl a
$1e:f05b  3b			tsc
$1e:f05c  ec 4f 0c	  cpx $0c4f
$1e:f05f  01 b2		 ora ($b2,x)
$1e:f061  01 38		 ora ($38,x)
$1e:f063  02 df		 cop #$df
$1e:f065  02 12		 cop #$12
$1e:f067  00 19		 brk #$19
$1e:f069  00 df		 brk #$df
$1e:f06b  00 5f		 brk #$5f
$1e:f06d  02 5f		 cop #$5f
$1e:f06f  43 ff		 eor $ff,s
$1e:f071  7f 10 01 00   adc $000110,x
$1e:f075  00 5f		 brk #$5f
$1e:f077  15 1f		 ora $1f,x
$1e:f079  22 df 2e 9f   jsl $9f2edf
$1e:f07d  3b			tsc
$1e:f07e  cd 39 50	  cmp $5039
$1e:f081  4a			lsr a
$1e:f082  d4 5a		 pei ($5a)
$1e:f084  57 6b		 eor [$6b],y
$1e:f086  00 70		 brk #$70
$1e:f088  40			rti
$1e:f089  75 8a		 adc $8a,x
$1e:f08b  7a			ply
$1e:f08c  d4 7f		 pei ($7f)
$1e:f08e  10 00		 bpl $f090
$1e:f090  fc 7f 4a	  jsr ($4a7f,x)
$1e:f093  29 00 00	  and #$0000
$1e:f096  84 00		 sty $00
$1e:f098  29 09 ef	  and #$ef09
$1e:f09b  19 d6 36	  ora $36d6,y
$1e:f09e  ff 7f ff 7f   sbc $7fff7f,x
$1e:f0a2  ff 7f ff 7f   sbc $7fff7f,x
$1e:f0a6  ff 7f ff 7f   sbc $7fff7f,x
$1e:f0aa  ff 7f ff 7f   sbc $7fff7f,x
$1e:f0ae  18			clc
$1e:f0af  00 ff		 brk #$ff
$1e:f0b1  67 0b		 adc [$0b]
$1e:f0b3  59 ad 35	  eor $35ad,y
$1e:f0b6  6b			rtl
$1e:f0b7  2d e7 1c	  and $1ce7
$1e:f0ba  a5 14		 lda $14
$1e:f0bc  63 0c		 adc $0c,s
$1e:f0be  00 00		 brk #$00
$1e:f0c0  73 4e		 adc ($4e,s),y
$1e:f0c2  7b			tdc
$1e:f0c3  6f 73 4e a5   adc $a54e73
$1e:f0c7  14 29		 trb $29
$1e:f0c9  25 ef		 and $ef
$1e:f0cb  3d f7 5e	  and $5ef7,x
$1e:f0ce  ff 7f 29 25   sbc $25297f,x
$1e:f0d2  0b			phd
$1e:f0d3  59 ad 35	  eor $35ad,y
$1e:f0d6  6b			rtl
$1e:f0d7  2d e7 1c	  and $1ce7
$1e:f0da  a5 14		 lda $14
$1e:f0dc  63 0c		 adc $0c,s
$1e:f0de  00 00		 brk #$00
$1e:f0e0  73 4e		 adc ($4e,s),y
$1e:f0e2  7b			tdc
$1e:f0e3  6f 73 4e a5   adc $a54e73
$1e:f0e7  14 29		 trb $29
$1e:f0e9  25 ef		 and $ef
$1e:f0eb  3d f7 5e	  and $5ef7,x
$1e:f0ee  ff 7f 29 25   sbc $25297f,x
$1e:f0f2  0b			phd
$1e:f0f3  59 ad 35	  eor $35ad,y
$1e:f0f6  6b			rtl
$1e:f0f7  2d e7 1c	  and $1ce7
$1e:f0fa  a5 14		 lda $14
$1e:f0fc  63 0c		 adc $0c,s
$1e:f0fe  00 00		 brk #$00
$1e:f100  73 4e		 adc ($4e,s),y
$1e:f102  7b			tdc
$1e:f103  6f 73 4e a5   adc $a54e73
$1e:f107  14 29		 trb $29
$1e:f109  25 ef		 and $ef
$1e:f10b  3d f7 5e	  and $5ef7,x
$1e:f10e  ff 7f 29 25   sbc $25297f,x
$1e:f112  c4 50		 cpy $50
$1e:f114  02 14		 cop #$14
$1e:f116  45 28		 eor $28
$1e:f118  6c 62 94	  jmp ($9462)
$1e:f11b  73 1f		 adc ($1f,s),y
$1e:f11d  00 f1		 brk #$f1
$1e:f11f  60			rts
$1e:f120  96 7d		 stx $7d,y
$1e:f122  36 7f		 rol $7f,x
$1e:f124  00 02		 brk #$02
$1e:f126  c0 12 80	  cpy #$8012
$1e:f129  3b			tsc
$1e:f12a  f9 73 50	  sbc $5073,y
$1e:f12d  2d 38 4e	  and $4e38
$1e:f130  3f 73 c4 50   and $50c473,x
$1e:f134  02 14		 cop #$14
$1e:f136  45 28		 eor $28
$1e:f138  6c 62 94	  jmp ($9462)
$1e:f13b  73 e0		 adc ($e0,s),y
$1e:f13d  33 16		 and ($16,s),y
$1e:f13f  10 1f		 bpl $f160
$1e:f141  30 bf		 bmi $f102
$1e:f143  66 58		 ror $58
$1e:f145  01 3c		 ora ($3c,x)
$1e:f147  02 1e		 cop #$1e
$1e:f149  03 df		 ora $df,s
$1e:f14b  6f 50 15 38   adc $381550
$1e:f14f  2a			rol a
$1e:f150  3f 43 c4 50   and $50c443,x
$1e:f154  02 14		 cop #$14
$1e:f156  45 28		 eor $28
$1e:f158  6c 62 94	  jmp ($9462)
$1e:f15b  73 db		 adc ($db,s),y
$1e:f15d  7b			tdc
$1e:f15e  8b			phb
$1e:f15f  31 50		 and ($50),y
$1e:f161  4a			lsr a
$1e:f162  16 63		 asl $63,x
$1e:f164  8a			txa
$1e:f165  38			sec
$1e:f166  ad 48 32	  lda $3248
$1e:f169  5d 3c 72	  eor $723c,x
$1e:f16c  f2 00		 sbc ($00)
$1e:f16e  9f 01 df 02   sta $02df01,x
$1e:f172  00 2c		 brk #$2c
$1e:f174  00 00		 brk #$00
$1e:f176  10 1a		 bpl $f192
$1e:f178  d6 2e		 dec $2e,x
$1e:f17a  5a			phy
$1e:f17b  43 ff		 eor $ff,s
$1e:f17d  5b			tcd
$1e:f17e  04 18		 tsb $18
$1e:f180  28			plp
$1e:f181  30 90		 bmi $f113
$1e:f183  50 17		 bvc $f19c
$1e:f185  69 1c 65	  adc #$651c
$1e:f188  df 4c 08 09   cmp $09084c,x
$1e:f18c  8c 11 80	  sty $8011
$1e:f18f  7d ff 7f	  adc $7fff,x
$1e:f192  c6 28		 dec $28
$1e:f194  00 00		 brk #$00
$1e:f196  4a			lsr a
$1e:f197  1d ce 29	  ora $29ce,x
$1e:f19a  52 36		 eor ($36)
$1e:f19c  d6 3e		 dec $3e,x
$1e:f19e  32 01		 and ($01)
$1e:f1a0  98			tya
$1e:f1a1  01 1e		 ora ($1e,x)
$1e:f1a3  02 df		 cop #$df
$1e:f1a5  26 43		 rol $43
$1e:f1a7  15 c4		 ora $c4,x
$1e:f1a9  1d 86 2a	  ora $2a86,x
$1e:f1ac  48			pha
$1e:f1ad  37 ff		 and [$ff],y
$1e:f1af  03 18		 ora $18,s
$1e:f1b1  00 c6		 brk #$c6
$1e:f1b3  28			plp
$1e:f1b4  00 00		 brk #$00
$1e:f1b6  c0 7c 09	  cpy #$097c
$1e:f1b9  7e 33 7f	  ror $7f33,x
$1e:f1bc  bb			tyx
$1e:f1bd  7f 70 01 d4   adc $d40170,x
$1e:f1c1  01 5a		 ora ($5a,x)
$1e:f1c3  02 1e		 cop #$1e
$1e:f1c5  33 2b		 and ($2b,s),y
$1e:f1c7  00 70		 brk #$70
$1e:f1c9  00 f6		 brk #$f6
$1e:f1cb  00 7c		 brk #$7c
$1e:f1cd  01 ff		 ora ($ff,x)
$1e:f1cf  7f ff 7f 2b   adc $2b7fff,x
$1e:f1d3  0d 00 00	  ora $0000
$1e:f1d6  2c 00 92	  bit $9200
$1e:f1d9  00 f8		 brk #$f8
$1e:f1db  00 9f		 brk #$9f
$1e:f1dd  01 aa		 ora ($aa,x)
$1e:f1df  01 4f		 ora ($4f,x)
$1e:f1e1  02 16		 cop #$16
$1e:f1e3  03 fd		 ora $fd,s
$1e:f1e5  03 8c		 ora $8c,s
$1e:f1e7  31 10		 and ($10),y
$1e:f1e9  42 94		 wdm #$94
$1e:f1eb  52 18		 eor ($18)
$1e:f1ed  63 00		 adc $00,s
$1e:f1ef  7c df 02	  jmp ($02df,x)
$1e:f1f2  2b			pld
$1e:f1f3  0d 00 00	  ora $0000
$1e:f1f6  aa			tax
$1e:f1f7  00 10		 brk #$10
$1e:f1f9  01 96		 ora ($96,x)
$1e:f1fb  09 1a 12	  ora #$121a
$1e:f1fe  01 01		 ora ($01,x)
$1e:f200  a3 01		 lda $01,s
$1e:f202  68			pla
$1e:f203  02 50		 cop #$50
$1e:f205  03 86		 ora $86,s
$1e:f207  7d 6c 7e	  adc $7e6c,x
$1e:f20a  33 7f		 and ($7f,s),y
$1e:f20c  bb			tyx
$1e:f20d  7f 9f 03 ff   adc $ff039f,x
$1e:f211  7f 2b 0d 00   adc $000d2b,x
$1e:f215  00 c5		 brk #$c5
$1e:f217  10 48		 bpl $f261
$1e:f219  19 ec 29	  ora $29ec,y
$1e:f21c  92 42		 sta ($42)
$1e:f21e  26 18		 rol $18
$1e:f220  6e 34 f6	  ror $f634
$1e:f223  48			pha
$1e:f224  9e 55 8c	  stz $8c55,x
$1e:f227  00 32		 brk #$32
$1e:f229  09 38 16	  ora #$1638
$1e:f22c  7e 27 18	  ror $1827,x
$1e:f22f  00 ff		 brk #$ff
$1e:f231  7f 00 01 a6   adc $a60100,x
$1e:f235  3c eb 68	  bit $68eb,x
$1e:f238  ae 7e 25	  ldx $257e
$1e:f23b  24 ba		 bit $ba
$1e:f23d  08			php
$1e:f23e  ff 01 1f 2b   sbc $2b1f01,x
$1e:f242  3f 5b 8d 39   and $398d5b,x
$1e:f246  ff 22 d7 3a   sbc $3ad722,x
$1e:f24a  ef 31 2c 14   sbc $142c31
$1e:f24e  4b			phk
$1e:f24f  31 a0		 and ($a0),y
$1e:f251  3c 00 55	  bit $5500,x
$1e:f254  46 45		 lsr $45
$1e:f256  ea			nop
$1e:f257  51 8c		 eor ($8c),y
$1e:f259  66 73		 ror $73
$1e:f25b  00 1f		 brk #$1f
$1e:f25d  01 ff		 ora ($ff,x)
$1e:f25f  0a			asl a
$1e:f260  ff 7f 00 00   sbc $00007f,x
$1e:f264  00 04		 brk #$04
$1e:f266  21 08		 and ($08,x)
$1e:f268  65 0c		 adc $0c
$1e:f26a  a9 0c ed	  lda #$ed0c
$1e:f26d  10 72		 bpl $f2e1
$1e:f26f  15 f6		 ora $f6,x
$1e:f271  1d 00 55	  ora $5500,x
$1e:f274  49 1c ff	  eor #$ff1c
$1e:f277  3b			tsc
$1e:f278  3f 23 7f 2a   and $2a7f23,x
$1e:f27c  7f 11 d5 1c   adc $1cd511,x
$1e:f280  4e 20 00	  lsr $0020
$1e:f283  00 50		 brk #$50
$1e:f285  46 42		 lsr $42
$1e:f287  10 57		 bpl $f2e0
$1e:f289  5b			tcd
$1e:f28a  8a			txa
$1e:f28b  35 9c		 and $9c,x
$1e:f28d  73 e5		 adc ($e5,s),y
$1e:f28f  24 43		 bit $43
$1e:f291  14 29		 trb $29
$1e:f293  25 00		 and $00
$1e:f295  20 20 01	  jsr $0120
$1e:f298  c3 01		 cmp $01,s
$1e:f29a  88			dey
$1e:f29b  02 50		 cop #$50
$1e:f29d  03 ce		 ora $ce,s
$1e:f29f  00 76		 brk #$76
$1e:f2a1  01 5e		 ora ($5e,x)
$1e:f2a3  02 a0		 cop #$a0
$1e:f2a5  48			pha
$1e:f2a6  c7 61		 cmp [$61]
$1e:f2a8  72 7b		 adc ($7b)
$1e:f2aa  fc 7f 6f	  jsr ($6f7f,x)
$1e:f2ad  25 56		 and $56
$1e:f2af  3e 7e 63	  rol $637e,x
$1e:f2b2  29 25 06	  and #$0625
$1e:f2b5  00 0a		 brk #$0a
$1e:f2b7  00 14		 brk #$14
$1e:f2b9  00 1e		 brk #$1e
$1e:f2bb  00 9f		 brk #$9f
$1e:f2bd  25 40		 and $40
$1e:f2bf  11 00		 ora ($00),y
$1e:f2c1  22 c0 36 0a   jsl $0a36c0
$1e:f2c5  28			plp
$1e:f2c6  70 40		 bvs $f308
$1e:f2c8  37 5d		 and [$5d],y
$1e:f2ca  7f 7e 6f 25   adc $256f7e,x
$1e:f2ce  56 3e		 lsr $3e,x
$1e:f2d0  7e 63 29	  ror $2963,x
$1e:f2d3  25 00		 and $00
$1e:f2d5  00 aa		 brk #$aa
$1e:f2d7  28			plp
$1e:f2d8  50 41		 bvc $f31b
$1e:f2da  f6 59		 inc $59,x
$1e:f2dc  dc 72 e9	  jml [$e972]
$1e:f2df  00 4d		 brk #$4d
$1e:f2e1  01 f2		 ora ($f2,x)
$1e:f2e3  01 d8		 ora ($d8,x)
$1e:f2e5  02 cb		 cop #$cb
$1e:f2e7  11 90		 ora ($90),y
$1e:f2e9  22 96 3b f9   jsl $f93b96
$1e:f2ed  4f e0 7f ff   eor $ff7fe0
$1e:f2f1  7f b5 56 00   adc $0056b5,x
$1e:f2f5  00 e0		 brk #$e0
$1e:f2f7  28			plp
$1e:f2f8  40			rti
$1e:f2f9  39 c0 51	  and $51c0,y
$1e:f2fc  40			rti
$1e:f2fd  6a			ror a
$1e:f2fe  a8			tay
$1e:f2ff  00 ec		 brk #$ec
$1e:f301  00 72		 brk #$72
$1e:f303  01 d8		 ora ($d8,x)
$1e:f305  01 8b		 ora ($8b,x)
$1e:f307  31 50		 and ($50),y
$1e:f309  4a			lsr a
$1e:f30a  16 63		 asl $63,x
$1e:f30c  fc 7f 1a	  jsr ($1a7f,x)
$1e:f30f  00 9d		 brk #$9d
$1e:f311  26 b5		 rol $b5
$1e:f313  56 00		 lsr $00,x
$1e:f315  00 00		 brk #$00
$1e:f317  19 c0 29	  ora $29c0,y
$1e:f31a  80 3a		 bra $f356
$1e:f31c  40			rti
$1e:f31d  4b			phk
$1e:f31e  2c 09 d2	  bit $d209
$1e:f321  15 98		 ora $98,x
$1e:f323  2a			rol a
$1e:f324  9f 43 8e 00   sta $008e43,x
$1e:f328  f2 00		 sbc ($00)
$1e:f32a  76 01		 ror $01,x
$1e:f32c  1a			inc a
$1e:f32d  02 1c		 cop #$1c
$1e:f32f  00 ff		 brk #$ff
$1e:f331  7f b5 56 00   adc $0056b5,x
$1e:f335  00 a6		 brk #$a6
$1e:f337  28			plp
$1e:f338  0a			asl a
$1e:f339  41 6d		 eor ($6d,x)
$1e:f33b  59 d1 71	  eor $71d1,y
$1e:f33e  ff 7f ff 7f   sbc $7fff7f,x
$1e:f342  ff 7f 10 01   sbc $01107f,x
$1e:f346  ef 3d 73 4e   sbc $4e733d
$1e:f34a  f7 5e		 sbc [$5e],y
$1e:f34c  9c 73 ff	  stz $ff73
$1e:f34f  03 ff		 ora $ff,s
$1e:f351  7f 29 25 00   adc $002529,x
$1e:f355  00 05		 brk #$05
$1e:f357  20 6a 38	  jsr $386a
$1e:f35a  10 51		 bpl $f3ad
$1e:f35c  17 6a		 ora [$6a],y
$1e:f35e  87 31		 sta [$31]
$1e:f360  4d 4a 13	  eor $134a
$1e:f363  63 db		 adc $db,s
$1e:f365  7b			tdc
$1e:f366  88			dey
$1e:f367  00 ec		 brk #$ec
$1e:f369  10 b2		 bpl $f31d
$1e:f36b  1d 78 2e	  ora $2e78,x
$1e:f36e  1f 00 ff 7f   ora $7fff00,x
$1e:f372  29 25 00	  and #$0025
$1e:f375  00 04		 brk #$04
$1e:f377  00 0a		 brk #$0a
$1e:f379  00 11		 brk #$11
$1e:f37b  00 19		 brk #$19
$1e:f37d  00 cc		 brk #$cc
$1e:f37f  00 72		 brk #$72
$1e:f381  01 38		 ora ($38,x)
$1e:f383  02 3f		 cop #$3f
$1e:f385  03 c4		 ora $c4,s
$1e:f387  18			clc
$1e:f388  88			dey
$1e:f389  31 4e		 and ($4e),y
$1e:f38b  4a			lsr a
$1e:f38c  16 63		 asl $63,x
$1e:f38e  1f 00 ff 7f   ora $7fff00,x
$1e:f392  29 25 00	  and #$0025
$1e:f395  00 a2		 brk #$a2
$1e:f397  30 64		 bmi $f3fd
$1e:f399  49 6c 62	  eor #$626c
$1e:f39c  d9 7b 18	  cmp $187b,y
$1e:f39f  00 3f		 brk #$3f
$1e:f3a1  01 7f		 ora ($7f,x)
$1e:f3a3  02 3f		 cop #$3f
$1e:f3a5  03 00		 ora $00,s
$1e:f3a7  01 c0		 ora ($c0,x)
$1e:f3a9  01 80		 ora ($80,x)
$1e:f3ab  02 f0		 cop #$f0
$1e:f3ad  43 ff		 eor $ff,s
$1e:f3af  33 ff		 and ($ff,s),y
$1e:f3b1  7f 00 55 00   adc $005500,x
$1e:f3b5  00 c3		 brk #$c3
$1e:f3b7  00 cc		 brk #$cc
$1e:f3b9  01 94		 ora ($94,x)
$1e:f3bb  02 3c		 cop #$3c
$1e:f3bd  03 08		 ora $08,s
$1e:f3bf  00 6d		 brk #$6d
$1e:f3c1  00 f2		 brk #$f2
$1e:f3c3  00 d8		 brk #$d8
$1e:f3c5  01 3f		 ora ($3f,x)
$1e:f3c7  03 66		 ora $66,s
$1e:f3c9  1c ea 30	  trb $30ea
$1e:f3cc  ce 49 d3	  dec $d349
$1e:f3cf  62 ff 7f	  per $73d1
$1e:f3d2  00 45		 brk #$45
$1e:f3d4  00 00		 brk #$00
$1e:f3d6  05 28		 ora $28
$1e:f3d8  a8			tay
$1e:f3d9  1c 4a 11	  trb $114a
$1e:f3dc  c3 00		 cmp $00,s
$1e:f3de  cc 01 94	  cpy $9401
$1e:f3e1  02 3c		 cop #$3c
$1e:f3e3  03 0b		 ora $0b,s
$1e:f3e5  00 16		 brk #$16
$1e:f3e7  00 03		 brk #$03
$1e:f3e9  18			clc
$1e:f3ea  a5 30		 lda $30
$1e:f3ec  6b			rtl
$1e:f3ed  49 73 62	  eor #$6273
$1e:f3f0  ff 7f 00 45   sbc $45007f,x
$1e:f3f4  08			php
$1e:f3f5  30 0f		 bmi $f406
$1e:f3f7  40			rti
$1e:f3f8  1b			tcs
$1e:f3f9  48			pha
$1e:f3fa  bf 71 3f 77   lda $773f71,x
$1e:f3fe  13 08		 ora ($08,s),y
$1e:f400  bf 00 3f 12   lda $123f00,x
$1e:f404  bf 33 62 2c   lda $2c6233,x
$1e:f408  a0 40 e3	  ldy #$e340
$1e:f40b  60			rts
$1e:f40c  c2 79		 rep #$79
$1e:f40e  e2 7e		 sep #$7e
$1e:f410  ff 7f 29 25   sbc $25297f,x
$1e:f414  00 00		 brk #$00
$1e:f416  03 00		 ora $00,s
$1e:f418  26 00		 rol $00
$1e:f41a  69 00		 adc #$00
$1e:f41c  ac 08 0f	  ldy $0f08
$1e:f41f  19 6e 1d	  ora $1d6e,y
$1e:f422  14 2a		 trb $2a
$1e:f424  40			rti
$1e:f425  0d 00 16	  ora $1600
$1e:f428  c0 1e		 cpy #$1e
$1e:f42a  d2 27		 cmp ($27)
$1e:f42c  70 00		 bvs $f42e
$1e:f42e  36 01		 rol $01,x
$1e:f430  3c 02 29	  bit $2902,x
$1e:f433  25 00		 and $00
$1e:f435  00 4a		 brk #$4a
$1e:f437  29 10		 and #$10
$1e:f439  42 d6		 wdm #$d6
$1e:f43b  5a			phy
$1e:f43c  9c 73 b8	  stz $b873
$1e:f43f  28			plp
$1e:f440  7c 39 7f	  jmp ($7f39,x)
$1e:f443  4e ae 00	  lsr $00ae
$1e:f446  34 01		 bit $01,x
$1e:f448  3c 02 9f	  bit $9f02,x
$1e:f44b  63 6f		 adc $6f,s
$1e:f44d  25 56		 and $56
$1e:f44f  3e 7e 63	  rol $637e,x
$1e:f452  e9 08		 sbc #$08
$1e:f454  00 00		 brk #$00
$1e:f456  27 29		 and [$29]
$1e:f458  cb			wai
$1e:f459  41 8f		 eor ($8f,x)
$1e:f45b  5a			phy
$1e:f45c  34 73		 bit $73,x
$1e:f45e  0a			asl a
$1e:f45f  00 12		 brk #$12
$1e:f461  00 1c		 brk #$1c
$1e:f463  00 a7		 brk #$a7
$1e:f465  08			php
$1e:f466  e9 08		 sbc #$08
$1e:f468  2c 0d 6d	  bit $6d0d
$1e:f46b  19 d2 2d	  ora $2dd2,y
$1e:f46e  78			sei
$1e:f46f  3e 3f 4f	  rol $4f3f,x
$1e:f472  29 25		 and #$25
$1e:f474  00 00		 brk #$00
$1e:f476  c5 18		 cmp $18
$1e:f478  8b			phb
$1e:f479  31 71		 and ($71),y
$1e:f47b  4e 78 6f	  lsr $6f78
$1e:f47e  a0 30		 ldy #$30
$1e:f480  00 51		 brk #$51
$1e:f482  80 7d		 bra $f501
$1e:f484  08			php
$1e:f485  00 6e		 brk #$6e
$1e:f487  00 14		 brk #$14
$1e:f489  01 3c		 ora ($3c,x)
$1e:f48b  02 6f		 cop #$6f
$1e:f48d  25 56		 and $56
$1e:f48f  3e 7e 63	  rol $637e,x
$1e:f492  8c 31 00	  sty $0031
$1e:f495  00 43		 brk #$43
$1e:f497  1d 06 2e	  ora $2e06,x
$1e:f49a  ec 42 f3	  cpx $f342
$1e:f49d  5b			tcd
$1e:f49e  04 04		 tsb $04
$1e:f4a0  0e 18 18	  asl $1818
$1e:f4a3  38			sec
$1e:f4a4  ec 00 d6	  cpx $d600
$1e:f4a7  01 1e		 ora ($1e,x)
$1e:f4a9  03 df		 ora $df,s
$1e:f4ab  63 6f		 adc $6f,s
$1e:f4ad  25 56		 and $56
$1e:f4af  3e 7e 63	  rol $637e,x
$1e:f4b2  8c 31 00	  sty $0031
$1e:f4b5  00 aa		 brk #$aa
$1e:f4b7  00 10		 brk #$10
$1e:f4b9  01 76		 ora ($76,x)
$1e:f4bb  01 fe		 ora ($fe,x)
$1e:f4bd  01 0a		 ora ($0a,x)
$1e:f4bf  00 14		 brk #$14
$1e:f4c1  00 1e		 brk #$1e
$1e:f4c3  00 05		 brk #$05
$1e:f4c5  02 0a		 cop #$0a
$1e:f4c7  03 cf		 ora $cf,s
$1e:f4c9  03 7f		 ora $7f,s
$1e:f4cb  32 6f		 and ($6f)
$1e:f4cd  25 56		 and $56
$1e:f4cf  3e 7e 63	  rol $637e,x
$1e:f4d2  10 29		 bpl $f4fd
$1e:f4d4  00 00		 brk #$00
$1e:f4d6  84 20		 sty $20
$1e:f4d8  08			php
$1e:f4d9  39 ce 51	  and $51ce,y
$1e:f4dc  b5 6a		 lda $6a,x
$1e:f4de  a8			tay
$1e:f4df  00 ec		 brk #$ec
$1e:f4e1  00 72		 brk #$72
$1e:f4e3  01 38		 ora ($38,x)
$1e:f4e5  02 8c		 cop #$8c
$1e:f4e7  2d 52 42	  and $4252
$1e:f4ea  18			clc
$1e:f4eb  5b			tcd
$1e:f4ec  ff 73 9f 03   sbc $039f73,x
$1e:f4f0  ff 7f 10 29   sbc $29107f,x
$1e:f4f4  00 00		 brk #$00
$1e:f4f6  88			dey
$1e:f4f7  00 0e		 brk #$0e
$1e:f4f9  05 d4		 ora $d4
$1e:f4fb  11 ba		 ora ($ba),y
$1e:f4fd  22 05 01 87   jsl $870105
$1e:f501  01 4b		 ora ($4b,x)
$1e:f503  02 11		 cop #$11
$1e:f505  03 8c		 ora $8c,s
$1e:f507  2d 52 42	  and $4252
$1e:f50a  18			clc
$1e:f50b  5b			tcd
$1e:f50c  ff 73 9f 03   sbc $039f73,x
$1e:f510  ff 7f 10 29   sbc $29107f,x
$1e:f514  00 00		 brk #$00
$1e:f516  0c 00 52	  tsb $5200
$1e:f519  00 b8		 brk #$b8
$1e:f51b  00 3f		 brk #$3f
$1e:f51d  01 a8		 ora ($a8,x)
$1e:f51f  00 ec		 brk #$ec
$1e:f521  00 72		 brk #$72
$1e:f523  01 38		 ora ($38,x)
$1e:f525  02 c5		 cop #$c5
$1e:f527  18			clc
$1e:f528  8a			txa
$1e:f529  31 50		 and ($50),y
$1e:f52b  4a			lsr a
$1e:f52c  16 63		 asl $63,x
$1e:f52e  9f 03 ff 7f   sta $7fff03,x
$1e:f532  69 7c		 adc #$7c
$1e:f534  39 15 1f	  and $1f15,y
$1e:f537  02 5e		 cop #$5e
$1e:f539  03 0f		 ora $0f,s
$1e:f53b  05 a4		 ora $a4
$1e:f53d  14 98		 trb $98
$1e:f53f  0d 6f 08	  ora $086f
$1e:f542  89 14		 bit #$14
$1e:f544  04 7e		 tsb $7e
$1e:f546  8d 45 a1	  sta $a145
$1e:f549  5c 35 63 28   jml $286335
$1e:f54d  31 98		 and ($98),y
$1e:f54f  01 fc		 ora ($fc,x)
$1e:f551  73 69		 adc ($69,s),y
$1e:f553  7c 0f 00	  jmp ($000f,x)
$1e:f556  9f 0c 5f 1e   sta $1e5f0c,x
$1e:f55a  9f 03 bd 7f   sta $7fbd03,x
$1e:f55e  6e 14 00	  ror $0014
$1e:f561  00 fe		 brk #$fe
$1e:f563  55 cb		 eor $cb,x
$1e:f565  3d 30 6a	  and $6a30,x
$1e:f568  4a			lsr a
$1e:f569  5d e4 50	  eor $50e4,x
$1e:f56c  f6 7e		 inc $7e,x
$1e:f56e  00 00		 brk #$00
$1e:f570  00 00		 brk #$00
$1e:f572  69 7c		 adc #$7c
$1e:f574  ff 34 8c 60   sbc $608c34,x
$1e:f578  51 79		 eor ($79),y
$1e:f57a  05 34		 ora $34
$1e:f57c  63 0c		 adc $0c,s
$1e:f57e  68			pla
$1e:f57f  4c 69 35	  jmp $3569
$1e:f582  84 18		 sty $18
$1e:f584  55 2c		 eor $2c,x
$1e:f586  07 2d		 ora [$2d]
$1e:f588  a6 10		 ldx $10
$1e:f58a  d3 62		 cmp ($62,s),y
$1e:f58c  4c 1c ff	  jmp $ff1c
$1e:f58f  7f 54 7a 20   adc $207a54,x
$1e:f593  01 00		 ora ($00,x)
$1e:f595  00 00		 brk #$00
$1e:f597  38			sec
$1e:f598  00 68		 brk #$68
$1e:f59a  12 00		 ora ($00)
$1e:f59c  1a			inc a
$1e:f59d  00 8b		 brk #$8b
$1e:f59f  31 50		 and ($50),y
$1e:f5a1  4a			lsr a
$1e:f5a2  16 63		 asl $63,x
$1e:f5a4  fc 7f ce	  jsr ($ce7f,x)
$1e:f5a7  00 76		 brk #$76
$1e:f5a9  01 5e		 ora ($5e,x)
$1e:f5ab  02 6f		 cop #$6f
$1e:f5ad  25 56		 and $56
$1e:f5af  3e 7e 63	  rol $637e,x
$1e:f5b2  20 01 00	  jsr $0001
$1e:f5b5  00 a8		 brk #$a8
$1e:f5b7  00 0e		 brk #$0e
$1e:f5b9  01 94		 ora ($94,x)
$1e:f5bb  01 1a		 ora ($1a,x)
$1e:f5bd  02 08		 cop #$08
$1e:f5bf  21 8c		 and ($8c,x)
$1e:f5c1  31 52		 and ($52),y
$1e:f5c3  4a			lsr a
$1e:f5c4  18			clc
$1e:f5c5  63 14		 adc $14,s
$1e:f5c7  00 1f		 brk #$1f
$1e:f5c9  00 1f		 brk #$1f
$1e:f5cb  02 3f		 cop #$3f
$1e:f5cd  27 3f		 and [$3f]
$1e:f5cf  4b			phk
$1e:f5d0  9f 67 20 01   sta $012067,x
$1e:f5d4  00 00		 brk #$00
$1e:f5d6  00 38		 brk #$38
$1e:f5d8  00 68		 brk #$68
$1e:f5da  80 01		 bra $f5dd
$1e:f5dc  40			rti
$1e:f5dd  03 00		 ora $00,s
$1e:f5df  20 60 40	  jsr $4060
$1e:f5e2  85 61		 sta $61
$1e:f5e4  2c 7f ce	  bit $ce7f
$1e:f5e7  00 76		 brk #$76
$1e:f5e9  01 5e		 ora ($5e,x)
$1e:f5eb  02 6f		 cop #$6f
$1e:f5ed  25 56		 and $56
$1e:f5ef  3e 7e 63	  rol $637e,x
$1e:f5f2  e5 24		 sbc $24
$1e:f5f4  00 04		 brk #$04
$1e:f5f6  aa			tax
$1e:f5f7  10 50		 bpl $f649
$1e:f5f9  1d 36 32	  ora $3236,x
$1e:f5fc  1c 4b 62	  trb $624b
$1e:f5ff  10 e6		 bpl $f5e7
$1e:f601  20 ac 39	  jsr $39ac
$1e:f604  72 52		 adc ($52)
$1e:f606  46 00		 lsr $00
$1e:f608  ac 00 32	  ldy $3200
$1e:f60b  01 d8		 ora ($d8,x)
$1e:f60d  01 38		 ora ($38,x)
$1e:f60f  6b			rtl
$1e:f610  ff 7f e5 24   sbc $24e57f,x
$1e:f614  00 00		 brk #$00
$1e:f616  9f 01 df 02   sta $02df01,x
$1e:f61a  9f 27 ff 4f   sta $4fff27,x
$1e:f61e  60			rts
$1e:f61f  59 c5 61	  eor $61c5,y
$1e:f622  4a			lsr a
$1e:f623  6a			ror a
$1e:f624  d1 72		 cmp ($72),y
$1e:f626  08			php
$1e:f627  21 8c		 and ($8c,x)
$1e:f629  31 10		 and ($10),y
$1e:f62b  42 94		 wdm #$94
$1e:f62d  52 18		 eor ($18)
$1e:f62f  63 ff		 adc $ff,s
$1e:f631  7f e5 24 00   adc $0024e5,x
$1e:f635  00 12		 brk #$12
$1e:f637  00 1c		 brk #$1c
$1e:f639  00 9e		 brk #$9e
$1e:f63b  01 3f		 ora ($3f,x)
$1e:f63d  33 e6		 and ($e6,s),y
$1e:f63f  20 ac 39	  jsr $39ac
$1e:f642  72 52		 adc ($52)
$1e:f644  38			sec
$1e:f645  6b			rtl
$1e:f646  c0 00		 cpy #$00
$1e:f648  82 01 88	  brl $7e4c
$1e:f64b  02 d2		 cop #$d2
$1e:f64d  03 dd		 ora $dd,s
$1e:f64f  7f ff 7f c5   adc $c57fff,x
$1e:f653  34 00		 bit $00,x
$1e:f655  00 05		 brk #$05
$1e:f657  21 87		 and ($87,x)
$1e:f659  31 4b		 and ($4b),y
$1e:f65b  4a			lsr a
$1e:f65c  0e 63 04	  asl $0463
$1e:f65f  18			clc
$1e:f660  08			php
$1e:f661  30 0f		 bmi $f672
$1e:f663  4c 17 68	  jmp $6817
$1e:f666  48			pha
$1e:f667  00 8e		 brk #$8e
$1e:f669  00 15		 brk #$15
$1e:f66b  01 dc		 ora ($dc,x)
$1e:f66d  01 de		 ora ($de,x)
$1e:f66f  03 f9		 ora $f9,s
$1e:f671  7f c5 34 00   adc $0034c5,x
$1e:f675  00 e6		 brk #$e6
$1e:f677  20 6a 31	  jsr $316a
$1e:f67a  0e 4a d4	  asl $d44a
$1e:f67d  62 06 04	  per $fa86
$1e:f680  0c 08 13	  tsb $1308
$1e:f683  10 1a		 bpl $f69f
$1e:f685  14 48		 trb $48
$1e:f687  00 ce		 brk #$ce
$1e:f689  00 75		 brk #$75
$1e:f68b  01 3c		 ora ($3c,x)
$1e:f68d  02 de		 cop #$de
$1e:f68f  03 ff		 ora $ff,s
$1e:f691  7f e5 24 00   adc $0024e5,x
$1e:f695  00 12		 brk #$12
$1e:f697  00 1c		 brk #$1c
$1e:f699  00 9e		 brk #$9e
$1e:f69b  01 3f		 ora ($3f,x)
$1e:f69d  33 9f		 and ($9f,s),y
$1e:f69f  01 df		 ora ($df,x)
$1e:f6a1  02 9f		 cop #$9f
$1e:f6a3  27 ff		 and [$ff]
$1e:f6a5  4f 00 18 00   eor $001800
$1e:f6a9  30 e3		 bmi $f68e
$1e:f6ab  48			pha
$1e:f6ac  e7 61		 sbc [$61]
$1e:f6ae  52 7f		 eor ($7f)
$1e:f6b0  ff 7f 00 50   sbc $50007f,x
$1e:f6b4  00 00		 brk #$00
$1e:f6b6  cc 21 c6	  cpy $c621
$1e:f6b9  18			clc
$1e:f6ba  ad 65 d9	  lda $d965
$1e:f6bd  7f 3f 03 c8   adc $c8033f,x
$1e:f6c1  0c 84 14	  tsb $1484
$1e:f6c4  73 1a		 adc ($1a,s),y
$1e:f6c6  73 01		 adc ($01,s),y
$1e:f6c8  28			plp
$1e:f6c9  1d c8 55	  ora $55c8,x
$1e:f6cc  63 18		 adc $18,s
$1e:f6ce  26 39		 rol $39
$1e:f6d0  e4 28		 cpx $28
$1e:f6d2  00 50		 brk #$50
$1e:f6d4  00 00		 brk #$00
$1e:f6d6  5f 01 5f 02   eor $025f01,x
$1e:f6da  3f 2b ff 57   and $57ff2b,x
$1e:f6de  ff 7f 00 00   sbc $00007f,x
$1e:f6e2  00 00		 brk #$00
$1e:f6e4  00 00		 brk #$00
$1e:f6e6  00 00		 brk #$00
$1e:f6e8  00 00		 brk #$00
$1e:f6ea  00 00		 brk #$00
$1e:f6ec  00 00		 brk #$00
$1e:f6ee  00 00		 brk #$00
$1e:f6f0  00 00		 brk #$00
$1e:f6f2  84 10		 sty $10
$1e:f6f4  00 00		 brk #$00
$1e:f6f6  a0 14		 ldy #$14
$1e:f6f8  40			rti
$1e:f6f9  21 e0		 and ($e0,x)
$1e:f6fb  25 ef		 and $ef
$1e:f6fd  52 4d		 eor ($4d)
$1e:f6ff  00 b4		 brk #$b4
$1e:f701  00 77		 brk #$77
$1e:f703  11 b8		 ora ($b8),y
$1e:f705  12 08		 ora ($08)
$1e:f707  00 10		 brk #$10
$1e:f709  00 1c		 brk #$1c
$1e:f70b  00 df		 brk #$df
$1e:f70d  3e d6 46	  rol $46d6,x
$1e:f710  ff 7f 84 10   sbc $10847f,x
$1e:f714  df 57 5f 0f   cmp $0f5f57,x
$1e:f718  5f 02 5e 01   eor $015e02,x
$1e:f71c  9a			txs
$1e:f71d  00 02		 brk #$02
$1e:f71f  18			clc
$1e:f720  06 30		 asl $30
$1e:f722  0b			phd
$1e:f723  48			pha
$1e:f724  11 60		 ora ($60),y
$1e:f726  8a			txa
$1e:f727  00 10		 brk #$10
$1e:f729  09 d7		 ora #$d7
$1e:f72b  15 df		 ora $df,x
$1e:f72d  26 00		 rol $00
$1e:f72f  00 ff		 brk #$ff
$1e:f731  7f 84 10 00   adc $001084,x
$1e:f735  10 a5		 bpl $f6dc
$1e:f737  2c 29 41	  bit $4129
$1e:f73a  ae 5d 11	  ldx $115d
$1e:f73d  66 94		 ror $94
$1e:f73f  6e 18 7b	  ror $7b18
$1e:f742  9c 7f 18	  stz $187f
$1e:f745  7b			tdc
$1e:f746  9c 7f 18	  stz $187f
$1e:f749  7b			tdc
$1e:f74a  94 6e		 sty $6e,x
$1e:f74c  11 66		 ora ($66),y
$1e:f74e  11 66		 ora ($66),y
$1e:f750  94 6e		 sty $6e,x
$1e:f752  84 10		 sty $10
$1e:f754  00 00		 brk #$00
$1e:f756  a0 14		 ldy #$14
$1e:f758  40			rti
$1e:f759  21 e0		 and ($e0,x)
$1e:f75b  25 ef		 and $ef
$1e:f75d  52 50		 eor ($50)
$1e:f75f  00 d2		 brk #$d2
$1e:f761  00 73		 brk #$73
$1e:f763  01 13		 ora ($13,x)
$1e:f765  0a			asl a
$1e:f766  08			php
$1e:f767  00 10		 brk #$10
$1e:f769  00 1c		 brk #$1c
$1e:f76b  00 df		 brk #$df
$1e:f76d  3e 53 36	  rol $3653,x
$1e:f770  ff 7f 46 19   sbc $19467f,x
$1e:f774  ff 7f 76 6b   sbc $6b767f,x
$1e:f778  11 6b		 ora ($6b),y
$1e:f77a  8f 66 2e 62   sta $622e66
$1e:f77e  ab			plb
$1e:f77f  51 7f		 eor ($7f),y
$1e:f781  57 1f		 eor [$1f],y
$1e:f783  43 59		 eor $59,s
$1e:f785  36 d6		 rol $d6,x
$1e:f787  2d 92 2d	  and $2d92
$1e:f78a  1f 20 ff 48   ora $48ff20,x
$1e:f78e  be 65 9e	  ldx $9e65,y
$1e:f791  7e 06 2a	  ror $2a06,x
$1e:f794  2a			rol a
$1e:f795  7d 68 60	  adc $6068,x
$1e:f798  a6 40		 ldx $40
$1e:f79a  85 30		 sta $30
$1e:f79c  00 1c		 brk #$1c
$1e:f79e  00 00		 brk #$00
$1e:f7a0  1f 43 38 32   ora $323843,x
$1e:f7a4  95 25		 sta $25,x
$1e:f7a6  2d 21 a7	  and $a721
$1e:f7a9  18			clc
$1e:f7aa  6a			ror a
$1e:f7ab  2e fa 0b	  rol $0bfa
$1e:f7ae  29 25		 and #$25
$1e:f7b0  ae 31 66	  ldx $6631
$1e:f7b3  2a			rol a
$1e:f7b4  0f 18 9f 0c   ora $0c9f18
$1e:f7b8  df 01 1f 0b   cmp $0b1f01,x
$1e:f7bc  7a			ply
$1e:f7bd  3b			tsc
$1e:f7be  d8			cld
$1e:f7bf  26 d2		 rol $d2
$1e:f7c1  21 2c		 and ($2c,x)
$1e:f7c3  21 a6		 and ($a6,x)
$1e:f7c5  18			clc
$1e:f7c6  00 00		 brk #$00
$1e:f7c8  83 1c		 sta $1c,s
$1e:f7ca  04 2d		 tsb $2d
$1e:f7cc  86 39		 stx $39
$1e:f7ce  0a			asl a
$1e:f7cf  17 6b		 ora [$6b],y
$1e:f7d1  27 4a		 and [$4a]
$1e:f7d3  1d ad 18	  ora $18ad,x
$1e:f7d6  90 20		 bcc $f7f8
$1e:f7d8  ff 7b ff 7f   sbc $7fff7b,x
$1e:f7dc  7b			tdc
$1e:f7dd  77 d5		 adc [$d5],y
$1e:f7df  6a			ror a
$1e:f7e0  0e 4e 6a	  asl $6a4e
$1e:f7e3  39 e6 24	  and $24e6,y
$1e:f7e6  00 08		 brk #$08
$1e:f7e8  21 21		 and ($21,x)
$1e:f7ea  23 22		 and $22,s
$1e:f7ec  4c 1b fb	  jmp $fb1b
$1e:f7ef  1f 99 19 a7   ora $a71999,x
$1e:f7f3  3c 18 34	  bit $3418,x
$1e:f7f6  7f 59 ff 7b   adc $7bff59,x
$1e:f7fa  3b			tsc
$1e:f7fb  53 b7		 eor ($b7,s),y
$1e:f7fd  36 d2		 rol $d2,x
$1e:f7ff  25 2c		 and $2c
$1e:f801  21 a6		 and ($a6,x)
$1e:f803  18			clc
$1e:f804  a4 18		 ldy $18
$1e:f806  00 00		 brk #$00
$1e:f808  83 1c		 sta $1c,s
$1e:f80a  04 2d		 tsb $2d
$1e:f80c  86 39		 stx $39
$1e:f80e  8e 5a 13	  stx $135a
$1e:f811  6b			rtl
$1e:f812  f1 0d		 sbc ($0d),y
$1e:f814  23 48		 and $48,s
$1e:f816  e3 7c		 sbc $7c,s
$1e:f818  a0 7e		 ldy #$7e
$1e:f81a  a0 7f		 ldy #$7f
$1e:f81c  ff 7f f8 0c   sbc $0cf87f,x
$1e:f820  dd 01 53	  cmp $5301,x
$1e:f823  20 7f 0e	  jsr $0e7f
$1e:f826  09 24		 ora #$24
$1e:f828  5f 27 ff 43   eor $43ff27,x
$1e:f82c  07 24		 ora [$24]
$1e:f82e  5c 7d d9 6d   jml $6dd97d
$1e:f832  01 01		 ora ($01,x)
$1e:f834  00 01		 brk #$01
$1e:f836  a3 51		 lda $51,s
$1e:f838  a5 12		 lda $12
$1e:f83a  99 63 bc	  sta $bc63,y
$1e:f83d  25 4e		 and $4e
$1e:f83f  f0 a3		 beq $f7e4
$1e:f841  4a			lsr a
$1e:f842  e5 2f		 sbc $2f
$1e:f844  71 9a		 adc ($9a),y
$1e:f846  d3 e6		 cmp ($e6,s),y
$1e:f848  a0 10		 ldy #$10
$1e:f84a  a3 d5		 lda $d5,s
$1e:f84c  c0 20		 cpy #$20
$1e:f84e  00 20		 brk #$20
$1e:f850  28			plp
$1e:f851  cf 41 e1 5f   cmp $5fe141
$1e:f855  07 88		 ora [$88]
$1e:f857  4d e8 a1	  eor $a1e8
$1e:f85a  fd 98 4c	  sbc $4c98,x
$1e:f85d  66 42		 ror $42
$1e:f85f  fb			xce
$1e:f860  9c 4e 67	  stz $674e
$1e:f863  43 fb		 eor $fb,s
$1e:f865  a0 50		 ldy #$50
$1e:f867  68			pla
$1e:f868  44 fb a4	  mvp $a4,$fb
$1e:f86b  52 69		 eor ($69)
$1e:f86d  45 fb		 eor $fb
$1e:f86f  a8			tay
$1e:f870  54 6a 46	  mvn $46,$6a
$1e:f873  fb			xce
$1e:f874  99 cd 0f	  sta $0fcd,y
$1e:f877  f9 3b 9e	  sbc $9e3b,y
$1e:f87a  23 f2		 and $f2,s
$1e:f87c  87 44		 sta [$44]
$1e:f87e  4f e5 2e 99   eor $992ee5
$1e:f882  4d a7 2b	  eor $2ba7
$1e:f885  ea			nop
$1e:f886  a7 54		 lda [$54]
$1e:f888  aa			tax
$1e:f889  d5 97		 cmp $97,x
$1e:f88b  f5 00		 sbc $00,x
$1e:f88d  67 fb		 adc [$fb]
$1e:f88f  83 00		 sta $00,s
$1e:f891  01 01		 ora ($01,x)
$1e:f893  00 01		 brk #$01
$1e:f895  c8			iny
$1e:f896  bb			tyx
$1e:f897  f6 10		 inc $10,x
$1e:f899  ff d8 80 3f   sbc $3f80d8,x
$1e:f89d  63 01		 adc $01,s
$1e:f89f  fd 90 48	  sbc $4890,x
$1e:f8a2  45 f9		 eor $f9
$1e:f8a4  28			plp
$1e:f8a5  94 8f		 sty $8f,x
$1e:f8a7  f2 61		 sbc ($61)
$1e:f8a9  31 99		 and ($99),y
$1e:f8ab  4c c9 f5	  jmp $f5c9
$1e:f8ae  38			sec
$1e:f8af  9c ce a7	  stz $a7ce
$1e:f8b2  65 fa		 adc $fa
$1e:f8b4  80 c0		 bra $f876
$1e:f8b6  a0 70		 ldy #$70
$1e:f8b8  43 7d		 eor $7d,s
$1e:f8ba  42 61		 wdm #$61
$1e:f8bc  50 b8		 bvc $f876
$1e:f8be  61 fe		 adc ($fe,x)
$1e:f8c0  a2 31		 ldx #$31
$1e:f8c2  28			plp
$1e:f8c3  9c 51 1f	  stz $1f51
$1e:f8c6  51 94		 eor ($94),y
$1e:f8c8  ff ac 3d 83   sbc $833dac,x
$1e:f8cc  ed 2f 71	  sbc $712f
$1e:f8cf  c8			iny
$1e:f8d0  01 01		 ora ($01,x)
$1e:f8d2  00 01		 brk #$01
$1e:f8d4  b9 5c ee	  lda $ee5c,y
$1e:f8d7  97 57		 sta [$57],y
$1e:f8d9  7d 5e af	  adc $af5e,x
$1e:f8dc  77 cb		 adc [$cb],y
$1e:f8de  eb			xba
$1e:f8df  fe b9 bc	  inc $bcb9,x
$1e:f8e2  ae 5f 30	  ldx $305f
$1e:f8e5  1f 5d 5e 97   ora $975e5d,x
$1e:f8e9  4f a8 1f a7   eor $a71fa8
$1e:f8ed  7f 80 3c 23   adc $233c80,x
$1e:f8f1  e2 2f		 sep #$2f
$1e:f8f3  19 f9 13	  ora $13f9,y
$1e:f8f6  ca			dex
$1e:f8f7  be 66 f3	  ldx $f366,y
$1e:f8fa  bf a2 3d 33   lda $333da2,x
$1e:f8fe  ee 63 01	  inc $0163
$1e:f901  01 00		 ora ($00,x)
$1e:f903  01 80		 ora ($80,x)
$1e:f905  c0 a1		 cpy #$a1
$1e:f907  30 a7		 bmi $f8b0
$1e:f909  7d 3c 71	  adc $713c,x
$1e:f90c  de 0e ff	  dec $ff0e,x
$1e:f90f  00 78		 brk #$78
$1e:f911  47 c4		 eor [$c4]
$1e:f913  5e 33 f2	  lsr $f233,x
$1e:f916  27 95		 and [$95]
$1e:f918  7c cd e7	  jmp ($e7cd,x)
$1e:f91b  7f 44 7a 67   adc $677a44,x
$1e:f91f  d5 5e		 cmp $5e,x
$1e:f921  bb			tyx
$1e:f922  f7 40		 sbc [$40],y
$1e:f924  80 01		 bra $f927
$1e:f926  01 00		 ora ($00,x)
$1e:f928  01 88		 ora ($88,x)
$1e:f92a  44 5d f8	  mvp $f8,$5d
$1e:f92d  f0 d8		 beq $f907
$1e:f92f  83 bf		 sta $bf,s
$1e:f931  c0 1e		 cpy #$1e
$1e:f933  11 f1		 ora ($f1),y
$1e:f935  17 8c		 ora [$8c],y
$1e:f937  fc 89 e5	  jsr ($e589,x)
$1e:f93a  5f 33 79 df   eor $df7933,x
$1e:f93e  d1 1e		 cmp ($1e),y
$1e:f940  99 f5 57	  sta $57f5,y
$1e:f943  ae fd d4	  ldx $d4fd
$1e:f946  20 00 00	  jsr $0000
$1e:f949  00 00		 brk #$00
$1e:f94b  33 7f		 and ($7f,s),y
$1e:f94d  1f 7c 4a 29   ora $294a7c,x
$1e:f951  00 00		 brk #$00
$1e:f953  df 22 df 73   cmp $73df22,x
$1e:f957  4a			lsr a
$1e:f958  29 00		 and #$00
$1e:f95a  00 e0		 brk #$e0
$1e:f95c  78			sei
$1e:f95d  1c 00 4a	  trb $4a00
$1e:f960  29 00		 and #$00
$1e:f962  00 e0		 brk #$e0
$1e:f964  78			sei
$1e:f965  1c 00 00	  trb $0000
$1e:f968  00 00		 brk #$00
$1e:f96a  00 00		 brk #$00
$1e:f96c  00 00		 brk #$00
$1e:f96e  00 00		 brk #$00
$1e:f970  00 00		 brk #$00
$1e:f972  00 00		 brk #$00
$1e:f974  00 00		 brk #$00
$1e:f976  00 00		 brk #$00
$1e:f978  00 00		 brk #$00
$1e:f97a  00 00		 brk #$00
$1e:f97c  00 00		 brk #$00
$1e:f97e  00 00		 brk #$00
$1e:f980  ff ff ff ff   sbc $ffffff,x
$1e:f984  ff ff ff ff   sbc $ffffff,x
$1e:f988  ff ff ff ff   sbc $ffffff,x
$1e:f98c  ff ff ff ff   sbc $ffffff,x
$1e:f990  ff ff ff ff   sbc $ffffff,x
$1e:f994  ff ff ff ff   sbc $ffffff,x
$1e:f998  ff ff ff ff   sbc $ffffff,x
$1e:f99c  ff ff ff ff   sbc $ffffff,x
$1e:f9a0  08			php
$1e:f9a1  00 00		 brk #$00
$1e:f9a3  00 00		 brk #$00
$1e:f9a5  80 00		 bra $f9a7
$1e:f9a7  00 02		 brk #$02
$1e:f9a9  00 00		 brk #$00
$1e:f9ab  00 00		 brk #$00
$1e:f9ad  00 00		 brk #$00
$1e:f9af  00 00		 brk #$00
$1e:f9b1  00 00		 brk #$00
$1e:f9b3  00 00		 brk #$00
$1e:f9b5  00 00		 brk #$00
$1e:f9b7  00 00		 brk #$00
$1e:f9b9  00 00		 brk #$00
$1e:f9bb  00 00		 brk #$00
$1e:f9bd  00 00		 brk #$00
$1e:f9bf  00 ff		 brk #$ff
$1e:f9c1  ff ff ff ff   sbc $ffffff,x
$1e:f9c5  ff ff ff ff   sbc $ffffff,x
$1e:f9c9  ff ff ff ff   sbc $ffffff,x
$1e:f9cd  ff ff ff ff   sbc $ffffff,x
$1e:f9d1  ff ff ff ff   sbc $ffffff,x
$1e:f9d5  ff ff ff ff   sbc $ffffff,x
$1e:f9d9  ff ff ff ff   sbc $ffffff,x
$1e:f9dd  ff ff ff 00   sbc $00ffff,x
$1e:f9e1  00 00		 brk #$00
$1e:f9e3  00 00		 brk #$00
$1e:f9e5  00 00		 brk #$00
$1e:f9e7  00 00		 brk #$00
$1e:f9e9  00 00		 brk #$00
$1e:f9eb  00 00		 brk #$00
$1e:f9ed  00 00		 brk #$00
$1e:f9ef  00 00		 brk #$00
$1e:f9f1  00 00		 brk #$00
$1e:f9f3  00 00		 brk #$00
$1e:f9f5  00 00		 brk #$00
$1e:f9f7  00 00		 brk #$00
$1e:f9f9  00 00		 brk #$00
$1e:f9fb  00 00		 brk #$00
$1e:f9fd  00 00		 brk #$00
$1e:f9ff  00 ff		 brk #$ff
$1e:fa01  ff ff ff ff   sbc $ffffff,x
$1e:fa05  ff ff ff ff   sbc $ffffff,x
$1e:fa09  ff ff ff ff   sbc $ffffff,x
$1e:fa0d  ff ff ff ff   sbc $ffffff,x
$1e:fa11  ff ff ff ff   sbc $ffffff,x
$1e:fa15  ff ff ff ff   sbc $ffffff,x
$1e:fa19  ff ff ff ff   sbc $ffffff,x
$1e:fa1d  ff ff ff 80   sbc $80ffff,x
$1e:fa21  00 00		 brk #$00
$1e:fa23  00 00		 brk #$00
$1e:fa25  00 00		 brk #$00
$1e:fa27  00 01		 brk #$01
$1e:fa29  40			rti
$1e:fa2a  00 00		 brk #$00
$1e:fa2c  00 00		 brk #$00
$1e:fa2e  00 00		 brk #$00
$1e:fa30  00 00		 brk #$00
$1e:fa32  00 00		 brk #$00
$1e:fa34  00 00		 brk #$00
$1e:fa36  00 00		 brk #$00
$1e:fa38  00 00		 brk #$00
$1e:fa3a  00 00		 brk #$00
$1e:fa3c  00 00		 brk #$00
$1e:fa3e  00 00		 brk #$00
$1e:fa40  ff ff ff ff   sbc $ffffff,x
$1e:fa44  ff ff ff ff   sbc $ffffff,x
$1e:fa48  ff ff ff ff   sbc $ffffff,x
$1e:fa4c  ff ff ff ff   sbc $ffffff,x
$1e:fa50  ff ff ff ff   sbc $ffffff,x
$1e:fa54  ff ff ff ff   sbc $ffffff,x
$1e:fa58  ff ff ff ff   sbc $ffffff,x
$1e:fa5c  ff ff ff ff   sbc $ffffff,x
$1e:fa60  50 00		 bvc $fa62
$1e:fa62  00 00		 brk #$00
$1e:fa64  00 00		 brk #$00
$1e:fa66  00 00		 brk #$00
$1e:fa68  02 00		 cop #$00
$1e:fa6a  00 00		 brk #$00
$1e:fa6c  00 00		 brk #$00
$1e:fa6e  00 00		 brk #$00
$1e:fa70  00 00		 brk #$00
$1e:fa72  00 00		 brk #$00
$1e:fa74  00 00		 brk #$00
$1e:fa76  00 00		 brk #$00
$1e:fa78  00 00		 brk #$00
$1e:fa7a  00 00		 brk #$00
$1e:fa7c  00 00		 brk #$00
$1e:fa7e  00 00		 brk #$00
$1e:fa80  ff ff ff ff   sbc $ffffff,x
$1e:fa84  ff ff ff ff   sbc $ffffff,x
$1e:fa88  ff ff ff ff   sbc $ffffff,x
$1e:fa8c  ff ff ff ff   sbc $ffffff,x
$1e:fa90  ff ff ff ff   sbc $ffffff,x
$1e:fa94  ff ff ff ff   sbc $ffffff,x
$1e:fa98  ff ff ff ff   sbc $ffffff,x
$1e:fa9c  ff ff ff ff   sbc $ffffff,x
$1e:faa0  80 40		 bra $fae2
$1e:faa2  00 00		 brk #$00
$1e:faa4  00 00		 brk #$00
$1e:faa6  00 00		 brk #$00
$1e:faa8  00 00		 brk #$00
$1e:faaa  00 00		 brk #$00
$1e:faac  00 00		 brk #$00
$1e:faae  00 00		 brk #$00
$1e:fab0  00 00		 brk #$00
$1e:fab2  00 00		 brk #$00
$1e:fab4  00 00		 brk #$00
$1e:fab6  00 00		 brk #$00
$1e:fab8  00 00		 brk #$00
$1e:faba  00 00		 brk #$00
$1e:fabc  00 00		 brk #$00
$1e:fabe  00 00		 brk #$00
$1e:fac0  ff ff ff ff   sbc $ffffff,x
$1e:fac4  ff ff ff ff   sbc $ffffff,x
$1e:fac8  ff ff ff ff   sbc $ffffff,x
$1e:facc  ff ff ff ff   sbc $ffffff,x
$1e:fad0  ff ff ff ff   sbc $ffffff,x
$1e:fad4  ff ff ff ff   sbc $ffffff,x
$1e:fad8  ff ff ff ff   sbc $ffffff,x
$1e:fadc  ff ff ff ff   sbc $ffffff,x
$1e:fae0  00 01		 brk #$01
$1e:fae2  00 00		 brk #$00
$1e:fae4  00 00		 brk #$00
$1e:fae6  00 00		 brk #$00
$1e:fae8  00 00		 brk #$00
$1e:faea  00 00		 brk #$00
$1e:faec  00 00		 brk #$00
$1e:faee  00 00		 brk #$00
$1e:faf0  00 00		 brk #$00
$1e:faf2  00 00		 brk #$00
$1e:faf4  00 00		 brk #$00
$1e:faf6  00 00		 brk #$00
$1e:faf8  00 00		 brk #$00
$1e:fafa  00 00		 brk #$00
$1e:fafc  00 00		 brk #$00
$1e:fafe  00 00		 brk #$00
$1e:fb00  ff ff ff ff   sbc $ffffff,x
$1e:fb04  ff ff ff ff   sbc $ffffff,x
$1e:fb08  ff ff ff ff   sbc $ffffff,x
$1e:fb0c  ff ff ff ff   sbc $ffffff,x
$1e:fb10  ff ff ff ff   sbc $ffffff,x
$1e:fb14  ff ff ff ff   sbc $ffffff,x
$1e:fb18  ff ff ff ff   sbc $ffffff,x
$1e:fb1c  ff ff ff ff   sbc $ffffff,x
$1e:fb20  00 00		 brk #$00
$1e:fb22  00 00		 brk #$00
$1e:fb24  00 00		 brk #$00
$1e:fb26  00 00		 brk #$00
$1e:fb28  00 00		 brk #$00
$1e:fb2a  00 00		 brk #$00
$1e:fb2c  00 00		 brk #$00
$1e:fb2e  00 00		 brk #$00
$1e:fb30  00 00		 brk #$00
$1e:fb32  00 00		 brk #$00
$1e:fb34  00 00		 brk #$00
$1e:fb36  00 00		 brk #$00
$1e:fb38  00 00		 brk #$00
$1e:fb3a  00 00		 brk #$00
$1e:fb3c  00 00		 brk #$00
$1e:fb3e  00 00		 brk #$00
$1e:fb40  ff ff ff ff   sbc $ffffff,x
$1e:fb44  ff ff ff ff   sbc $ffffff,x
$1e:fb48  ff ff ff ff   sbc $ffffff,x
$1e:fb4c  ff ff ff ff   sbc $ffffff,x
$1e:fb50  ff ff ff ff   sbc $ffffff,x
$1e:fb54  ff ff ff ff   sbc $ffffff,x
$1e:fb58  ff ff ff ff   sbc $ffffff,x
$1e:fb5c  ff ff ff ff   sbc $ffffff,x
$1e:fb60  01 00		 ora ($00,x)
$1e:fb62  00 00		 brk #$00
$1e:fb64  00 00		 brk #$00
$1e:fb66  00 00		 brk #$00
$1e:fb68  00 00		 brk #$00
$1e:fb6a  00 00		 brk #$00
$1e:fb6c  00 00		 brk #$00
$1e:fb6e  00 00		 brk #$00
$1e:fb70  00 00		 brk #$00
$1e:fb72  00 00		 brk #$00
$1e:fb74  00 00		 brk #$00
$1e:fb76  00 00		 brk #$00
$1e:fb78  00 00		 brk #$00
$1e:fb7a  00 00		 brk #$00
$1e:fb7c  00 00		 brk #$00
$1e:fb7e  00 00		 brk #$00
$1e:fb80  ff ff ff ff   sbc $ffffff,x
$1e:fb84  ff ff ff ff   sbc $ffffff,x
$1e:fb88  ff ff ff ff   sbc $ffffff,x
$1e:fb8c  ff ff ff ff   sbc $ffffff,x
$1e:fb90  ff ff ff ff   sbc $ffffff,x
$1e:fb94  ff ff ff ff   sbc $ffffff,x
$1e:fb98  ff ff ff ff   sbc $ffffff,x
$1e:fb9c  ff ff ff ff   sbc $ffffff,x
$1e:fba0  00 00		 brk #$00
$1e:fba2  00 00		 brk #$00
$1e:fba4  00 00		 brk #$00
$1e:fba6  00 00		 brk #$00
$1e:fba8  00 00		 brk #$00
$1e:fbaa  00 00		 brk #$00
$1e:fbac  00 00		 brk #$00
$1e:fbae  00 00		 brk #$00
$1e:fbb0  00 00		 brk #$00
$1e:fbb2  00 00		 brk #$00
$1e:fbb4  00 00		 brk #$00
$1e:fbb6  00 00		 brk #$00
$1e:fbb8  00 00		 brk #$00
$1e:fbba  00 00		 brk #$00
$1e:fbbc  00 00		 brk #$00
$1e:fbbe  00 00		 brk #$00
$1e:fbc0  ff ff ff ff   sbc $ffffff,x
$1e:fbc4  ff ff ff ff   sbc $ffffff,x
$1e:fbc8  ff ff ff ff   sbc $ffffff,x
$1e:fbcc  ff ff ff ff   sbc $ffffff,x
$1e:fbd0  ff ff ff ff   sbc $ffffff,x
$1e:fbd4  ff ff ff ff   sbc $ffffff,x
$1e:fbd8  ff ff ff ff   sbc $ffffff,x
$1e:fbdc  ff ff ff ff   sbc $ffffff,x
$1e:fbe0  01 00		 ora ($00,x)
$1e:fbe2  00 00		 brk #$00
$1e:fbe4  00 00		 brk #$00
$1e:fbe6  00 00		 brk #$00
$1e:fbe8  00 00		 brk #$00
$1e:fbea  00 00		 brk #$00
$1e:fbec  00 00		 brk #$00
$1e:fbee  00 00		 brk #$00
$1e:fbf0  00 00		 brk #$00
$1e:fbf2  00 00		 brk #$00
$1e:fbf4  00 00		 brk #$00
$1e:fbf6  00 00		 brk #$00
$1e:fbf8  00 00		 brk #$00
$1e:fbfa  00 00		 brk #$00
$1e:fbfc  00 00		 brk #$00
$1e:fbfe  00 00		 brk #$00
$1e:fc00  ff ff ff ff   sbc $ffffff,x
$1e:fc04  ff ff ff ff   sbc $ffffff,x
$1e:fc08  ff ff ff ff   sbc $ffffff,x
$1e:fc0c  ff ff ff ff   sbc $ffffff,x
$1e:fc10  ff ff ff ff   sbc $ffffff,x
$1e:fc14  ff ff ff ff   sbc $ffffff,x
$1e:fc18  ff ff ff ff   sbc $ffffff,x
$1e:fc1c  ff ff ff ff   sbc $ffffff,x
$1e:fc20  00 00		 brk #$00
$1e:fc22  00 00		 brk #$00
$1e:fc24  00 00		 brk #$00
$1e:fc26  00 00		 brk #$00
$1e:fc28  00 00		 brk #$00
$1e:fc2a  00 00		 brk #$00
$1e:fc2c  00 00		 brk #$00
$1e:fc2e  00 00		 brk #$00
$1e:fc30  00 00		 brk #$00
$1e:fc32  00 00		 brk #$00
$1e:fc34  00 00		 brk #$00
$1e:fc36  00 00		 brk #$00
$1e:fc38  00 00		 brk #$00
$1e:fc3a  00 00		 brk #$00
$1e:fc3c  00 00		 brk #$00
$1e:fc3e  00 00		 brk #$00
$1e:fc40  ff ff ff ff   sbc $ffffff,x
$1e:fc44  ff ff ff ff   sbc $ffffff,x
$1e:fc48  ff ff ff ff   sbc $ffffff,x
$1e:fc4c  ff ff ff ff   sbc $ffffff,x
$1e:fc50  ff ff ff ff   sbc $ffffff,x
$1e:fc54  ff ff ff ff   sbc $ffffff,x
$1e:fc58  ff ff ff ff   sbc $ffffff,x
$1e:fc5c  ff ff ff ff   sbc $ffffff,x
$1e:fc60  00 00		 brk #$00
$1e:fc62  00 00		 brk #$00
$1e:fc64  00 00		 brk #$00
$1e:fc66  00 00		 brk #$00
$1e:fc68  00 00		 brk #$00
$1e:fc6a  00 00		 brk #$00
$1e:fc6c  00 00		 brk #$00
$1e:fc6e  00 00		 brk #$00
$1e:fc70  00 00		 brk #$00
$1e:fc72  00 00		 brk #$00
$1e:fc74  00 00		 brk #$00
$1e:fc76  00 00		 brk #$00
$1e:fc78  00 00		 brk #$00
$1e:fc7a  00 00		 brk #$00
$1e:fc7c  00 00		 brk #$00
$1e:fc7e  00 00		 brk #$00
$1e:fc80  ff ff ff ff   sbc $ffffff,x
$1e:fc84  ff ff ff ff   sbc $ffffff,x
$1e:fc88  ff ff ff ff   sbc $ffffff,x
$1e:fc8c  ff ff ff ff   sbc $ffffff,x
$1e:fc90  ff ff ff ff   sbc $ffffff,x
$1e:fc94  ff ff ff ff   sbc $ffffff,x
$1e:fc98  ff ff ff ff   sbc $ffffff,x
$1e:fc9c  ff ff ff ff   sbc $ffffff,x
$1e:fca0  00 00		 brk #$00
$1e:fca2  00 00		 brk #$00
$1e:fca4  00 00		 brk #$00
$1e:fca6  00 00		 brk #$00
$1e:fca8  00 00		 brk #$00
$1e:fcaa  00 00		 brk #$00
$1e:fcac  00 00		 brk #$00
$1e:fcae  00 00		 brk #$00
$1e:fcb0  00 00		 brk #$00
$1e:fcb2  00 00		 brk #$00
$1e:fcb4  00 00		 brk #$00
$1e:fcb6  00 00		 brk #$00
$1e:fcb8  00 00		 brk #$00
$1e:fcba  00 00		 brk #$00
$1e:fcbc  00 00		 brk #$00
$1e:fcbe  00 00		 brk #$00
$1e:fcc0  ff ff ff ff   sbc $ffffff,x
$1e:fcc4  ff ff ff ff   sbc $ffffff,x
$1e:fcc8  ff ff ff ff   sbc $ffffff,x
$1e:fccc  ff ff ff ff   sbc $ffffff,x
$1e:fcd0  ff ff ff ff   sbc $ffffff,x
$1e:fcd4  ff ff ff ff   sbc $ffffff,x
$1e:fcd8  ff ff ff ff   sbc $ffffff,x
$1e:fcdc  ff ff ff ff   sbc $ffffff,x
$1e:fce0  00 00		 brk #$00
$1e:fce2  00 00		 brk #$00
$1e:fce4  00 00		 brk #$00
$1e:fce6  00 00		 brk #$00
$1e:fce8  00 00		 brk #$00
$1e:fcea  00 00		 brk #$00
$1e:fcec  00 00		 brk #$00
$1e:fcee  00 00		 brk #$00
$1e:fcf0  00 00		 brk #$00
$1e:fcf2  00 00		 brk #$00
$1e:fcf4  00 00		 brk #$00
$1e:fcf6  00 00		 brk #$00
$1e:fcf8  00 00		 brk #$00
$1e:fcfa  00 00		 brk #$00
$1e:fcfc  00 00		 brk #$00
$1e:fcfe  00 00		 brk #$00
$1e:fd00  ff ff ff ff   sbc $ffffff,x
$1e:fd04  ff ff ff ff   sbc $ffffff,x
$1e:fd08  ff ff ff ff   sbc $ffffff,x
$1e:fd0c  ff ff ff ff   sbc $ffffff,x
$1e:fd10  ff ff ff ff   sbc $ffffff,x
$1e:fd14  ff ff ff ff   sbc $ffffff,x
$1e:fd18  ff ff ff ff   sbc $ffffff,x
$1e:fd1c  ff ff ff ff   sbc $ffffff,x
$1e:fd20  00 00		 brk #$00
$1e:fd22  00 00		 brk #$00
$1e:fd24  00 00		 brk #$00
$1e:fd26  00 00		 brk #$00
$1e:fd28  00 00		 brk #$00
$1e:fd2a  00 00		 brk #$00
$1e:fd2c  00 00		 brk #$00
$1e:fd2e  00 00		 brk #$00
$1e:fd30  00 00		 brk #$00
$1e:fd32  00 00		 brk #$00
$1e:fd34  00 00		 brk #$00
$1e:fd36  00 00		 brk #$00
$1e:fd38  00 00		 brk #$00
$1e:fd3a  00 00		 brk #$00
$1e:fd3c  00 00		 brk #$00
$1e:fd3e  00 00		 brk #$00
$1e:fd40  ff ff ff ff   sbc $ffffff,x
$1e:fd44  ff ff ff ff   sbc $ffffff,x
$1e:fd48  ff ff ff ff   sbc $ffffff,x
$1e:fd4c  ff ff ff ff   sbc $ffffff,x
$1e:fd50  ff ff ff ff   sbc $ffffff,x
$1e:fd54  ff ff ff ff   sbc $ffffff,x
$1e:fd58  ff ff ff ff   sbc $ffffff,x
$1e:fd5c  ff ff ff ff   sbc $ffffff,x
$1e:fd60  00 00		 brk #$00
$1e:fd62  00 00		 brk #$00
$1e:fd64  00 00		 brk #$00
$1e:fd66  00 00		 brk #$00
$1e:fd68  00 00		 brk #$00
$1e:fd6a  00 00		 brk #$00
$1e:fd6c  00 00		 brk #$00
$1e:fd6e  00 00		 brk #$00
$1e:fd70  00 00		 brk #$00
$1e:fd72  00 00		 brk #$00
$1e:fd74  00 00		 brk #$00
$1e:fd76  00 00		 brk #$00
$1e:fd78  00 00		 brk #$00
$1e:fd7a  00 00		 brk #$00
$1e:fd7c  00 00		 brk #$00
$1e:fd7e  00 00		 brk #$00
$1e:fd80  ff ff ff ff   sbc $ffffff,x
$1e:fd84  ff ff ff ff   sbc $ffffff,x
$1e:fd88  ff ff ff ff   sbc $ffffff,x
$1e:fd8c  ff ff ff ff   sbc $ffffff,x
$1e:fd90  ff ff ff ff   sbc $ffffff,x
$1e:fd94  ff ff ff ff   sbc $ffffff,x
$1e:fd98  ff ff ff ff   sbc $ffffff,x
$1e:fd9c  ff ff ff ff   sbc $ffffff,x
$1e:fda0  00 00		 brk #$00
$1e:fda2  00 00		 brk #$00
$1e:fda4  00 00		 brk #$00
$1e:fda6  00 00		 brk #$00
$1e:fda8  00 00		 brk #$00
$1e:fdaa  00 00		 brk #$00
$1e:fdac  00 00		 brk #$00
$1e:fdae  00 00		 brk #$00
$1e:fdb0  00 00		 brk #$00
$1e:fdb2  00 00		 brk #$00
$1e:fdb4  00 00		 brk #$00
$1e:fdb6  00 00		 brk #$00
$1e:fdb8  00 00		 brk #$00
$1e:fdba  00 00		 brk #$00
$1e:fdbc  02 00		 cop #$00
$1e:fdbe  00 00		 brk #$00
$1e:fdc0  ff ff ff ff   sbc $ffffff,x
$1e:fdc4  ff ff ff ff   sbc $ffffff,x
$1e:fdc8  ff ff ff ff   sbc $ffffff,x
$1e:fdcc  ff ff ff ff   sbc $ffffff,x
$1e:fdd0  ff ff ff ff   sbc $ffffff,x
$1e:fdd4  ff ff ff ff   sbc $ffffff,x
$1e:fdd8  ff ff ff ff   sbc $ffffff,x
$1e:fddc  ff ff ff ff   sbc $ffffff,x
$1e:fde0  00 00		 brk #$00
$1e:fde2  00 00		 brk #$00
$1e:fde4  00 00		 brk #$00
$1e:fde6  00 00		 brk #$00
$1e:fde8  00 00		 brk #$00
$1e:fdea  00 00		 brk #$00
$1e:fdec  00 00		 brk #$00
$1e:fdee  00 00		 brk #$00
$1e:fdf0  00 00		 brk #$00
$1e:fdf2  00 00		 brk #$00
$1e:fdf4  00 00		 brk #$00
$1e:fdf6  00 00		 brk #$00
$1e:fdf8  00 00		 brk #$00
$1e:fdfa  00 00		 brk #$00
$1e:fdfc  00 00		 brk #$00
$1e:fdfe  10 00		 bpl $fe00
$1e:fe00  ff ff ff ff   sbc $ffffff,x
$1e:fe04  ff ff ff ff   sbc $ffffff,x
$1e:fe08  ff ff ff ff   sbc $ffffff,x
$1e:fe0c  ff ff ff ff   sbc $ffffff,x
$1e:fe10  ff ff ff ff   sbc $ffffff,x
$1e:fe14  ff ff ff ff   sbc $ffffff,x
$1e:fe18  ff ff ff ff   sbc $ffffff,x
$1e:fe1c  ff ff ff ff   sbc $ffffff,x
$1e:fe20  00 00		 brk #$00
$1e:fe22  00 00		 brk #$00
$1e:fe24  00 00		 brk #$00
$1e:fe26  00 00		 brk #$00
$1e:fe28  00 00		 brk #$00
$1e:fe2a  00 00		 brk #$00
$1e:fe2c  00 00		 brk #$00
$1e:fe2e  00 00		 brk #$00
$1e:fe30  00 00		 brk #$00
$1e:fe32  00 00		 brk #$00
$1e:fe34  00 00		 brk #$00
$1e:fe36  00 00		 brk #$00
$1e:fe38  00 00		 brk #$00
$1e:fe3a  00 00		 brk #$00
$1e:fe3c  00 00		 brk #$00
$1e:fe3e  00 00		 brk #$00
$1e:fe40  ff ff ff ff   sbc $ffffff,x
$1e:fe44  ff ff ff ff   sbc $ffffff,x
$1e:fe48  ff ff ff ff   sbc $ffffff,x
$1e:fe4c  ff ff ff ff   sbc $ffffff,x
$1e:fe50  ff ff ff ff   sbc $ffffff,x
$1e:fe54  ff ff ff ff   sbc $ffffff,x
$1e:fe58  ff ff ff ff   sbc $ffffff,x
$1e:fe5c  ff ff ff ff   sbc $ffffff,x
$1e:fe60  00 00		 brk #$00
$1e:fe62  00 00		 brk #$00
$1e:fe64  00 00		 brk #$00
$1e:fe66  00 00		 brk #$00
$1e:fe68  00 00		 brk #$00
$1e:fe6a  00 00		 brk #$00
$1e:fe6c  00 00		 brk #$00
$1e:fe6e  00 00		 brk #$00
$1e:fe70  00 40		 brk #$40
$1e:fe72  00 00		 brk #$00
$1e:fe74  00 00		 brk #$00
$1e:fe76  00 00		 brk #$00
$1e:fe78  00 00		 brk #$00
$1e:fe7a  00 00		 brk #$00
$1e:fe7c  00 00		 brk #$00
$1e:fe7e  00 00		 brk #$00
$1e:fe80  ff ff ff ff   sbc $ffffff,x
$1e:fe84  ff ff ff ff   sbc $ffffff,x
$1e:fe88  ff ff ff ff   sbc $ffffff,x
$1e:fe8c  ff ff ff ff   sbc $ffffff,x
$1e:fe90  ff ff ff ff   sbc $ffffff,x
$1e:fe94  ff ff ff ff   sbc $ffffff,x
$1e:fe98  ff ff ff ff   sbc $ffffff,x
$1e:fe9c  ff ff ff ff   sbc $ffffff,x
$1e:fea0  00 00		 brk #$00
$1e:fea2  00 00		 brk #$00
$1e:fea4  00 00		 brk #$00
$1e:fea6  00 00		 brk #$00
$1e:fea8  00 00		 brk #$00
$1e:feaa  00 00		 brk #$00
$1e:feac  00 00		 brk #$00
$1e:feae  00 00		 brk #$00
$1e:feb0  00 00		 brk #$00
$1e:feb2  00 00		 brk #$00
$1e:feb4  00 00		 brk #$00
$1e:feb6  00 00		 brk #$00
$1e:feb8  00 00		 brk #$00
$1e:feba  00 00		 brk #$00
$1e:febc  00 20		 brk #$20
$1e:febe  00 00		 brk #$00
$1e:fec0  ff ff ff ff   sbc $ffffff,x
$1e:fec4  ff ff ff ff   sbc $ffffff,x
$1e:fec8  ff ff ff ff   sbc $ffffff,x
$1e:fecc  ff ff ff ff   sbc $ffffff,x
$1e:fed0  ff ff ff ff   sbc $ffffff,x
$1e:fed4  ff ff ff ff   sbc $ffffff,x
$1e:fed8  ff ff ff ff   sbc $ffffff,x
$1e:fedc  ff ff ff ff   sbc $ffffff,x
$1e:fee0  00 00		 brk #$00
$1e:fee2  00 00		 brk #$00
$1e:fee4  00 00		 brk #$00
$1e:fee6  00 00		 brk #$00
$1e:fee8  00 00		 brk #$00
$1e:feea  00 00		 brk #$00
$1e:feec  00 00		 brk #$00
$1e:feee  00 00		 brk #$00
$1e:fef0  00 00		 brk #$00
$1e:fef2  00 00		 brk #$00
$1e:fef4  00 00		 brk #$00
$1e:fef6  00 00		 brk #$00
$1e:fef8  00 00		 brk #$00
$1e:fefa  00 00		 brk #$00
$1e:fefc  00 00		 brk #$00
$1e:fefe  00 00		 brk #$00
$1e:ff00  ff ff ff ff   sbc $ffffff,x
$1e:ff04  ff ff ff ff   sbc $ffffff,x
$1e:ff08  ff ff ff ff   sbc $ffffff,x
$1e:ff0c  ff ff ff ff   sbc $ffffff,x
$1e:ff10  ff ff ff ff   sbc $ffffff,x
$1e:ff14  ff ff ff ff   sbc $ffffff,x
$1e:ff18  ff ff ff ff   sbc $ffffff,x
$1e:ff1c  ff ff ff ff   sbc $ffffff,x
$1e:ff20  00 00		 brk #$00
$1e:ff22  00 00		 brk #$00
$1e:ff24  00 00		 brk #$00
$1e:ff26  00 00		 brk #$00
$1e:ff28  00 00		 brk #$00
$1e:ff2a  00 00		 brk #$00
$1e:ff2c  00 00		 brk #$00
$1e:ff2e  00 00		 brk #$00
$1e:ff30  00 00		 brk #$00
$1e:ff32  00 00		 brk #$00
$1e:ff34  00 00		 brk #$00
$1e:ff36  00 00		 brk #$00
$1e:ff38  00 00		 brk #$00
$1e:ff3a  00 00		 brk #$00
$1e:ff3c  00 00		 brk #$00
$1e:ff3e  00 00		 brk #$00
$1e:ff40  ff ff ff ff   sbc $ffffff,x
$1e:ff44  ff ff ff ff   sbc $ffffff,x
$1e:ff48  ff ff ff ff   sbc $ffffff,x
$1e:ff4c  ff ff ff ff   sbc $ffffff,x
$1e:ff50  ff ff ff ff   sbc $ffffff,x
$1e:ff54  ff ff ff ff   sbc $ffffff,x
$1e:ff58  ff ff ff ff   sbc $ffffff,x
$1e:ff5c  ff ff ff ff   sbc $ffffff,x
$1e:ff60  00 00		 brk #$00
$1e:ff62  00 00		 brk #$00
$1e:ff64  00 00		 brk #$00
$1e:ff66  00 00		 brk #$00
$1e:ff68  00 00		 brk #$00
$1e:ff6a  00 00		 brk #$00
$1e:ff6c  00 00		 brk #$00
$1e:ff6e  00 00		 brk #$00
$1e:ff70  00 00		 brk #$00
$1e:ff72  00 00		 brk #$00
$1e:ff74  00 00		 brk #$00
$1e:ff76  00 00		 brk #$00
$1e:ff78  00 00		 brk #$00
$1e:ff7a  00 00		 brk #$00
$1e:ff7c  00 00		 brk #$00
$1e:ff7e  00 00		 brk #$00
$1e:ff80  ff ff ff ff   sbc $ffffff,x
$1e:ff84  ff ff ff ff   sbc $ffffff,x
$1e:ff88  ff ff ff ff   sbc $ffffff,x
$1e:ff8c  ff ff ff ff   sbc $ffffff,x
$1e:ff90  ff ff ff ff   sbc $ffffff,x
$1e:ff94  ff ff ff ff   sbc $ffffff,x
$1e:ff98  ff ff ff ff   sbc $ffffff,x
$1e:ff9c  ff ff ff ff   sbc $ffffff,x
$1e:ffa0  00 00		 brk #$00
$1e:ffa2  00 00		 brk #$00
$1e:ffa4  00 00		 brk #$00
$1e:ffa6  00 00		 brk #$00
$1e:ffa8  00 00		 brk #$00
$1e:ffaa  00 00		 brk #$00
$1e:ffac  00 00		 brk #$00
$1e:ffae  00 00		 brk #$00
$1e:ffb0  00 00		 brk #$00
$1e:ffb2  00 00		 brk #$00
$1e:ffb4  00 00		 brk #$00
$1e:ffb6  00 00		 brk #$00
$1e:ffb8  00 00		 brk #$00
$1e:ffba  00 00		 brk #$00
$1e:ffbc  00 00		 brk #$00
$1e:ffbe  00 00		 brk #$00
$1e:ffc0  ff ff ff ff   sbc $ffffff,x
$1e:ffc4  ff ff ff ff   sbc $ffffff,x
$1e:ffc8  ff ff ff ff   sbc $ffffff,x
$1e:ffcc  ff ff ff ff   sbc $ffffff,x
$1e:ffd0  ff ff ff ff   sbc $ffffff,x
$1e:ffd4  ff ff ff ff   sbc $ffffff,x
$1e:ffd8  ff ff ff ff   sbc $ffffff,x
$1e:ffdc  ff ff ff ff   sbc $ffffff,x
$1e:ffe0  00 00		 brk #$00
$1e:ffe2  00 10		 brk #$10
$1e:ffe4  00 00		 brk #$00
$1e:ffe6  00 08		 brk #$08
$1e:ffe8  00 00		 brk #$00
$1e:ffea  10 04		 bpl $fff0
$1e:ffec  00 00		 brk #$00
$1e:ffee  10 00		 bpl $fff0
$1e:fff0  00 00		 brk #$00
$1e:fff2  0a			asl a
$1e:fff3  00 00		 brk #$00
$1e:fff5  00 00		 brk #$00
$1e:fff7  29 00		 and #$00
$1e:fff9  00 90		 brk #$90
$1e:fffb  00 00		 brk #$00
$1e:fffd  00 14		 brk #$14
$1e:ffff  44 02 3b	  mvp $3b,$02
