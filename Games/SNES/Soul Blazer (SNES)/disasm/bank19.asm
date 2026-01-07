; Soul Blazer (SNES) - Bank $19
; Disassembled from ROM
; File offset: $0c8000-$0cffff
; CPU address: $19:$8000-$19:$ffff
;===========================================================

.bank $19
.org $8000

$19:8000  00 20		 brk #$20
$19:8002  80 3b		 bra $803f
$19:8004  fc 01 e1	  jsr ($e101,x)
$19:8007  1f 0e 44 5a   ora $5a440e,x
$19:800b  34 1c		 bit $1c,x
$19:800d  f1 ff		 sbc ($ff),y
$19:800f  94 3c		 sty $3c,x
$19:8011  ac 71 f3	  ldy $f371
$19:8014  39 c7 23	  and $23c7,y
$19:8017  05 6f		 ora $6f
$19:8019  3f fa 43 d2   and $d243fa,x
$19:801d  c7 2d		 cmp [$2d]
$19:801f  95 aa		 sta $aa,x
$19:8021  00 cc		 brk #$cc
$19:8023  12 b8		 ora ($b8)
$19:8025  ea			nop
$19:8026  5b			tcd
$19:8027  d7 fe		 cmp [$fe],y
$19:8029  d0 f6		 bne $8021
$19:802b  b1 aa		 lda ($aa),y
$19:802d  45 d3		 eor $d3
$19:802f  ef af 05 f8   sbc $f805af
$19:8033  51 a5		 eor ($a5),y
$19:8035  e6 e2		 inc $e2
$19:8037  12 84		 ora ($84)
$19:8039  70 ce		 bvs $8009
$19:803b  01 4f		 ora ($4f,x)
$19:803d  1f f9 3b 15   ora $153bf9,x
$19:8041  82 e7 32	  brl $b32b
$19:8044  fb			xce
$19:8045  1b			tcs
$19:8046  bc ff ed	  ldy $edff,x
$19:8049  9f 71 7a cb   sta $cb7a71,x
$19:804d  d8			cld
$19:804e  7e d4 f7	  ror $f7d4,x
$19:8051  2f bd bc 0f   and $0fbcbd
$19:8055  e1 8f		 sbc ($8f,x)
$19:8057  14 f8		 trb $f8
$19:8059  eb			xba
$19:805a  c9 7e		 cmp #$7e
$19:805c  54 69 7c	  mvn $7c,$69
$19:805f  60			rts
$19:8060  c4 71		 cpy $71
$19:8062  c8			iny
$19:8063  fc 7c a9	  jsr ($a97c,x)
$19:8066  e7 ff		 sbc [$ff]
$19:8068  47 64		 eor [$64]
$19:806a  7e 57 1d	  ror $1d57,x
$19:806d  95 ca		 sta $ca,x
$19:806f  d3 92		 cmp ($92,s),y
$19:8071  ae f5 ff	  ldx $fff5
$19:8074  b4 3d		 ldy $3d,x
$19:8076  c3 ef		 cmp $ef,s
$19:8078  2f 01 f8 53   and $53f801
$19:807c  c4 be		 cpy $be
$19:807e  36 f2		 rol $f2,x
$19:8080  3f 96 3c d3   and $d33c96,x
$19:8084  e7 af		 sbc [$af]
$19:8086  45 fa		 eor $fa
$19:8088  73 d5		 adc ($d5,s),y
$19:808a  be be f6	  ldx $f6be,y
$19:808d  7f c0 25 f1   adc $f125c0,x
$19:8091  88			dey
$19:8092  fc ae 3b	  jsr ($3bae,x)
$19:8095  00 8c		 brk #$8c
$19:8097  47 23		 eor [$23]
$19:8099  ee a0 72	  inc $72a0
$19:809c  8b			phb
$19:809d  44 63 51	  mvp $51,$63
$19:80a0  e7 a0		 sbc [$a0]
$19:80a2  34 45		 bit $45,x
$19:80a4  e8			inx
$19:80a5  2f 52 8d 47   and $478d52
$19:80a9  40			rti
$19:80aa  43 18		 eor $18,s
$19:80ac  68			pla
$19:80ad  80 08		 bra $80b7
$19:80af  a3 72		 lda $72,s
$19:80b1  b7 38		 lda [$38],y
$19:80b3  84 46		 sty $46
$19:80b5  2d 19 80	  and $8019
$19:80b8  04 4a		 tsb $4a
$19:80ba  39 2d 8d	  and $8d2d,y
$19:80bd  c0 23		 cpy #$23
$19:80bf  62 02 95	  per $15c4
$19:80c2  c6 83		 dec $83
$19:80c4  e9 17		 sbc #$17
$19:80c6  8b			phb
$19:80c7  3e 8d e8	  rol $e88d,x
$19:80ca  31 b8		 and ($b8),y
$19:80cc  b4 b6		 ldy $b6,x
$19:80ce  57 2d		 eor [$2d],y
$19:80d0  8b			phb
$19:80d1  46 e3		 lsr $e3
$19:80d3  d2 b8		 cmp ($b8)
$19:80d5  a4 ac		 ldy $ac
$19:80d7  1c 0d 11	  trb $110d
$19:80da  8c 10 52	  sty $5210
$19:80dd  01 12		 ora ($12,x)
$19:80df  24 29		 bit $29
$19:80e1  21 4a		 and ($4a,x)
$19:80e3  cf 10 24 28   cmp $282410
$19:80e7  d8			cld
$19:80e8  22 f2 c7 98   jsl $98c7f2
$19:80ec  39 40 5e	  and $5e40,y
$19:80ef  92 b0		 sta ($b0)
$19:80f1  a0 46		 ldy #$46
$19:80f3  c0 45		 cpy #$45
$19:80f5  2d 8e 34	  and $348e
$19:80f8  42 2e		 wdm #$2e
$19:80fa  02 18		 cop #$18
$19:80fc  a8			tay
$19:80fd  78			sei
$19:80fe  10 e2		 bpl $80e2
$19:8100  11 08		 ora ($08),y
$19:8102  d4 59		 pei ($59)
$19:8104  a2 49		 ldx #$49
$19:8106  21 96		 and ($96,x)
$19:8108  b4 4c		 ldy $4c,x
$19:810a  46 2d		 lsr $2d
$19:810c  13 1e		 ora ($1e,s),y
$19:810e  01 04		 ora ($04,x)
$19:8110  0b			phd
$19:8111  1a			inc a
$19:8112  39 06 92	  and $9206,y
$19:8115  45 89		 eor $89
$19:8117  0b			phd
$19:8118  19 24 2c	  ora $2c24,y
$19:811b  69 a1		 adc #$a1
$19:811d  ac f6 37	  ldy $37f6
$19:8120  00 bd		 brk #$bd
$19:8122  17 21		 ora [$21],y
$19:8124  14 39		 trb $39
$19:8126  83 d0		 sta $d0,s
$19:8128  df 00 81 25   cmp $258100,x
$19:812c  c9 00		 cmp #$00
$19:812e  d9 38 09	  cmp $0938,y
$19:8131  c0 07		 cpy #$07
$19:8133  d2 90		 cmp ($90)
$19:8135  14 80		 trb $80
$19:8137  1f 63 e0 92   ora $92e063,x
$19:813b  0c 5e d1	  tsb $d15e
$19:813e  d9 5a b4	  cmp $b45a,y
$19:8141  47 92		 eor [$92]
$19:8143  31 06		 and ($06),y
$19:8145  ba			tsx
$19:8146  13 d9		 ora ($d9,s),y
$19:8148  4a			lsr a
$19:8149  0c f4 2f	  tsb $2ff4
$19:814c  b2 bf		 lda ($bf)
$19:814e  8e fe 88	  stx $88fe
$19:8151  f4 ce 2b	  pea $2bce
$19:8154  bd 7f ed	  lda $ed7f,x
$19:8157  0f 70 fb cb   ora $cbfb70
$19:815b  c0 7e		 cpy #$7e
$19:815d  14 f0		 trb $f0
$19:815f  fc 47 86	  jsr ($8647,x)
$19:8162  08			php
$19:8163  99 08 a4	  sta $a408,y
$19:8166  68			pla
$19:8167  66 83		 ror $83
$19:8169  80 8e		 bra $80f9
$19:816b  90 c5		 bcc $8132
$19:816d  32 44		 and ($44)
$19:816f  36 8e		 rol $8e,x
$19:8171  14 c4		 trb $c4
$19:8173  9f 51 b3 18   sta $18b351,x
$19:8177  97 da		 sta [$da],y
$19:8179  3d 2b 8e	  and $8e2b,x
$19:817c  25 cc		 and $cc
$19:817e  de d1 d9	  dec $d9d1,x
$19:8181  5c 6c f5 67   jml $67f56c
$19:8185  10 8d		 bpl $8114
$19:8187  22 ad 02 11   jsl $1102ad
$19:818b  94 d5		 sty $d5,x
$19:818d  8b			phb
$19:818e  e2 01		 sep #$01
$19:8190  16 1d		 asl $1d,x
$19:8192  10 a8		 bpl $813c
$19:8194  a2 c4		 ldx #$c4
$19:8196  45 25		 eor $25
$19:8198  10 a8		 bpl $8142
$19:819a  ca			dex
$19:819b  8a			txa
$19:819c  d3 73		 cmp ($73,s),y
$19:819e  22 98 88 60   jsl $608898
$19:81a2  ae f7 21	  ldx $21f7
$19:81a5  94 6e		 sty $6e,x
$19:81a7  2a			rol a
$19:81a8  03 02		 ora $02,s
$19:81aa  19 01 04	  ora $0401,y
$19:81ad  e0 05		 cpx #$05
$19:81af  31 48		 and ($48),y
$19:81b1  10 3d		 bpl $81f0
$19:81b3  8c 64 a0	  sty $a064
$19:81b6  20 fb 2c	  jsr $2cfb
$19:81b9  06 33		 asl $33
$19:81bb  19 97 ca	  ora $ca97,y
$19:81be  e2 8b		 sep #$8b
$19:81c0  05 8c		 ora $8c
$19:81c2  4a			lsr a
$19:81c3  e5 f1		 sbc $f1
$19:81c5  87 f9		 sta [$f9]
$19:81c7  31 8e		 and ($8e),y
$19:81c9  28			plp
$19:81ca  c4 68		 cpy $68
$19:81cc  a3 55		 lda $55,s
$19:81ce  5a			phy
$19:81cf  62 57 48	  per $ca29
$19:81d2  b3 99		 lda ($99,s),y
$19:81d4  1c 43 14	  trb $1443
$19:81d7  97 ab		 sta [$ab],y
$19:81d9  12 5f		 ora ($5f)
$19:81db  14 8c		 trb $8c
$19:81dd  1c 08 96	  trb $9608
$19:81e0  11 79		 ora ($79),y
$19:81e2  6c 6c e0	  jmp ($e06c)
$19:81e5  40			rti
$19:81e6  00 40		 brk #$40
$19:81e8  0c 45 a4	  tsb $a445
$19:81eb  71 49		 adc ($49),y
$19:81ed  68			pla
$19:81ee  50 1a		 bvc $820a
$19:81f0  65 1c		 adc $1c
$19:81f2  97 c5		 sta [$c5],y
$19:81f4  e2 82		 sep #$82
$19:81f6  63 8c		 adc $8c,s
$19:81f8  44 44 80	  mvp $80,$44
$19:81fb  1f 21 51 3b   ora $3b5121,x
$19:81ff  d0 1c		 bne $821d
$19:8201  11 a5		 ora ($a5),y
$19:8203  82 92 c8	  brl $4a98
$19:8206  84 02		 sty $02
$19:8208  60			rts
$19:8209  43 0b		 eor $0b,s
$19:820b  09 01		 ora #$01
$19:820d  e4 12		 cpx $12
$19:820f  16 7b		 asl $7b,x
$19:8211  a9 d9		 lda #$d9
$19:8213  4e b0 08	  lsr $08b0
$19:8216  c4 69		 cpy $69
$19:8218  e2 49		 sep #$49
$19:821a  50 80		 bvc $819c
$19:821c  3c 4d ac	  bit $ac4d,x
$19:821f  10 08		 bpl $8229
$19:8221  b8			clv
$19:8222  c8			iny
$19:8223  00 42		 brk #$42
$19:8225  58			cli
$19:8226  10 13		 bpl $823b
$19:8228  3b			tsc
$19:8229  c0 26		 cpy #$26
$19:822b  24 f4		 bit $f4
$19:822d  0a			asl a
$19:822e  a9 28		 lda #$28
$19:8230  22 e6 75 32   jsl $3275e6
$19:8234  04 41		 tsb $41
$19:8236  ec 25 81	  cpx $8125
$19:8239  95 c5		 sta $c5,x
$19:823b  13 a0		 ora ($a0,s),y
$19:823d  58			cli
$19:823e  28			plp
$19:823f  cc 4e 57	  cpy $574e
$19:8242  2f 97 bd 84   and $84bd97
$19:8246  04 24		 tsb $24
$19:8248  00 96		 brk #$96
$19:824a  90 c0		 bcc $820c
$19:824c  26 51		 rol $51
$19:824e  82 50 93	  brl $15a1
$19:8251  cc a4 31	  cpy $31a4
$19:8254  72 fe		 adc ($fe)
$19:8256  8a			txa
$19:8257  51 ea		 eor ($ea),y
$19:8259  47 8f		 eor [$8f]
$19:825b  15 19		 ora $19,x
$19:825d  0c 86 66	  tsb $6686
$19:8260  4c 11 51	  jmp $5111
$19:8263  45 e5		 eor $e5
$19:8265  72 b1		 adc ($b1)
$19:8267  80 3d		 bra $82a6
$19:8269  84 be		 sty $be
$19:826b  04 00		 tsb $00
$19:826d  88			dey
$19:826e  44 9e c0	  mvp $c0,$9e
$19:8271  e6 03		 inc $03
$19:8273  b5 4b		 lda $4b,x
$19:8275  62 8b 84	  per $0703
$19:8278  06 a3		 asl $a3
$19:827a  10 41		 bpl $82bd
$19:827c  d5 12		 cmp $12,x
$19:827e  09 a9		 ora #$a9
$19:8280  7c 97 c3	  jmp ($c397,x)
$19:8283  2d 2f 94	  and $942f
$19:8286  49 7a		 eor #$7a
$19:8288  11 a7		 ora ($a7),y
$19:828a  8d 91 c6	  sta $c691
$19:828d  25 2c		 and $2c
$19:828f  96 c4		 stx $c4,y
$19:8291  88			dey
$19:8292  e1 14		 sbc ($14,x)
$19:8294  96 44		 stx $44,y
$19:8296  e5 b2		 sbc $b2
$19:8298  c1 18		 cmp ($18,x)
$19:829a  8d c2 5a	  sta $5ac2
$19:829d  31 29		 and ($29),y
$19:829f  6c 58 24	  jmp ($2458)
$19:82a2  63 60		 adc $60,s
$19:82a4  8a			txa
$19:82a5  ac 12 2a	  ldy $2a12
$19:82a8  12 04		 ora ($04)
$19:82aa  d2 4b		 cmp ($4b)
$19:82ac  e5 a3		 sbc $a3
$19:82ae  10 52		 bpl $8302
$19:82b0  0b			phd
$19:82b1  c4 43		 cpy $43
$19:82b3  00 99		 brk #$99
$19:82b5  09 5b		 ora #$5b
$19:82b7  fc 5f e0	  jsr ($e05f,x)
$19:82ba  04 09		 tsb $09
$19:82bc  5c bc 7e 91   jml $917ebc
$19:82c0  55 e0		 eor $e0,x
$19:82c2  36 ca		 rol $ca,x
$19:82c4  31 2d		 and ($2d),y
$19:82c6  06 8b		 asl $8b
$19:82c8  6c a2 4e	  jmp ($4ea2)
$19:82cb  75 8b		 adc $8b,x
$19:82cd  b7 d4		 lda [$d4],y
$19:82cf  cc 48 93	  cpy $9348
$19:82d2  78			sei
$19:82d3  b4 ae		 ldy $ae,x
$19:82d5  23 18		 and $18,s
$19:82d7  1f 98 f4 22   ora $22f498,x
$19:82db  23 f3		 and $f3,s
$19:82dd  10 09		 bpl $82e8
$19:82df  44 e2 c3	  mvp $c3,$e2
$19:82e2  c0 28		 cpy #$28
$19:82e4  a0 80		 ldy #$80
$19:82e6  0c 46 1f	  tsb $1f46
$19:82e9  09 79		 ora #$79
$19:82eb  aa			tax
$19:82ec  d2 20		 cmp ($20)
$19:82ee  29 13		 and #$13
$19:82f0  e1 29		 sbc ($29,x)
$19:82f2  80 26		 bra $831a
$19:82f4  28			plp
$19:82f5  00 5f		 brk #$5f
$19:82f7  a3 10		 lda $10,s
$19:82f9  25 71		 and $71
$19:82fb  61 4a		 adc ($4a,x)
$19:82fd  33 dc		 and ($dc,s),y
$19:82ff  40			rti
$19:8300  a1 f6		 lda ($f6,x)
$19:8302  37 da		 and [$da],y
$19:8304  dc 50 48	  jml [$4850]
$19:8307  a6 07		 ldx $07
$19:8309  fb			xce
$19:830a  14 4d		 trb $4d
$19:830c  9e 20 f6	  stz $f620,x
$19:830f  51 28		 eor ($28),y
$19:8311  79 ce 6c	  adc $6cce,y
$19:8314  ca			dex
$19:8315  21 9b		 and ($9b,x)
$19:8317  20 cc 81	  jsr $81cc
$19:831a  21 03		 and ($03,x)
$19:831c  28			plp
$19:831d  4a			lsr a
$19:831e  8c cc 0a	  sty $0acc
$19:8321  fb			xce
$19:8322  21 b9		 and ($b9,x)
$19:8324  9c 14 06	  stz $0614
$19:8327  47 ba		 eor [$ba]
$19:8329  09 92		 ora #$92
$19:832b  2e 84 64	  rol $6484
$19:832e  9b			txy
$19:832f  a7 93		 lda [$93]
$19:8331  2b			pld
$19:8332  ed fe 2b	  sbc $2bfe
$19:8335  fb			xce
$19:8336  07 8b		 ora [$8b]
$19:8338  3e c3 e2	  rol $e2c3,x
$19:833b  df 61 99 9c   cmp $9c9961,x
$19:833f  45 de		 eor $de
$19:8341  c4 33		 cpy $33
$19:8343  40			rti
$19:8344  8b			phb
$19:8345  fd 8a 66	  sbc $668a,x
$19:8348  91 10		 sta ($10),y
$19:834a  7b			tdc
$19:834b  18			clc
$19:834c  cd 42 12	  cmp $1242
$19:834f  f3 19		 sbc ($19,s),y
$19:8351  18			clc
$19:8352  c9 5a		 cmp #$5a
$19:8354  ca			dex
$19:8355  d4 8a		 pei ($8a)
$19:8357  0d 95 8a	  ora $8a95
$19:835a  b1 46		 lda ($46),y
$19:835c  2a			rol a
$19:835d  44 9a 89	  mvp $89,$9a
$19:8360  14 07		 trb $07
$19:8362  94 50		 sty $50,x
$19:8364  4e c2 72	  lsr $72c2
$19:8367  89 c4		 bit #$c4
$19:8369  65 ae		 adc $ae
$19:836b  f2 79		 sbc ($79)
$19:836d  11 bc		 ora ($bc),y
$19:836f  e2 21		 sep #$21
$19:8371  20 7f 91	  jsr $917f
$19:8374  7c 22 2f	  jmp ($2f22,x)
$19:8377  e3 96		 sbc $96,s
$19:8379  83 12		 sta $12,s
$19:837b  23 16		 and $16,s
$19:837d  42 83		 wdm #$83
$19:837f  4c 62 31	  jmp $3162
$19:8382  47 a8		 eor [$a8]
$19:8384  0b			phd
$19:8385  c1 0a		 cmp ($0a,x)
$19:8387  11 04		 ora ($04),y
$19:8389  e0 8b		 cpx #$8b
$19:838b  c1 40		 cmp ($40,x)
$19:838d  11 08		 ora ($08),y
$19:838f  9c b5 48	  stz $48b5
$19:8392  46 fb		 lsr $fb
$19:8394  79 81 10	  adc $1081,y
$19:8397  40			rti
$19:8398  06 bf		 asl $bf
$19:839a  70 79		 bvs $8415
$19:839c  04 85		 tsb $85
$19:839e  9e e2 73	  stz $73e2,x
$19:83a1  11 83		 ora ($83),y
$19:83a3  7d dd fe	  adc $fedd,x
$19:83a6  00 f1		 brk #$f1
$19:83a8  c2 4a		 rep #$4a
$19:83aa  e5 d2		 sbc $d2
$19:83ac  d5 11		 cmp $11,x
$19:83ae  44 e5 d2	  mvp $d2,$e5
$19:83b1  b4 a0		 ldy $a0,x
$19:83b3  87 46		 sta [$46]
$19:83b5  27 2b		 and [$2b]
$19:83b7  96 cb		 stx $cb,y
$19:83b9  03 67		 ora $67,s
$19:83bb  16 18		 asl $18,x
$19:83bd  98			tya
$19:83be  b5 82		 lda $82,x
$19:83c0  07 2f		 ora [$2f]
$19:83c2  8a			txa
$19:83c3  bb			tyx
$19:83c4  99 dd e5	  sta $e5dd,y
$19:83c7  ee 18 92	  inc $9218
$19:83ca  84 13		 sty $13
$19:83cc  40			rti
$19:83cd  31 33		 and ($33),y
$19:83cf  98			tya
$19:83d0  91 40		 sta ($40),y
$19:83d2  fe 4a 10	  inc $104a,x
$19:83d5  3f a4 54 e8   and $e854a4,x
$19:83d9  08			php
$19:83da  f4 88 4b	  pea $4b88
$19:83dd  d1 ea		 cmp ($ea),y
$19:83df  26 15		 rol $15
$19:83e1  01 c0		 ora ($c0,x)
$19:83e3  25 aa		 and $aa
$19:83e5  15 80		 ora $80,x
$19:83e7  44 86 24	  mvp $24,$86
$19:83ea  1a			inc a
$19:83eb  11 89		 ora ($89),y
$19:83ed  cb			wai
$19:83ee  05 00		 ora $00
$19:83f0  89 45		 bit #$45
$19:83f2  fb			xce
$19:83f3  4a			lsr a
$19:83f4  e2 48		 sep #$48
$19:83f6  f3 67		 sbc ($67,s),y
$19:83f8  30 ac		 bmi $83a6
$19:83fa  22 2a 03 0d   jsl $0d032a
$19:83fe  03 81		 ora $81,s
$19:8400  22 0d d1 09   jsl $09d10d
$19:8404  2b			pld
$19:8405  c5 05		 cmp $05
$19:8407  00 f9		 brk #$f9
$19:8409  c8			iny
$19:840a  90 23		 bcc $842f
$19:840c  65 ef		 adc $ef
$19:840e  05 96		 ora $96
$19:8410  44 5f 0a	  mvp $0a,$5f
$19:8413  fd 13 b9	  sbc $b913,x
$19:8416  19 c6 5a	  ora $5ac6,y
$19:8419  33 59		 and ($59,s),y
$19:841b  61 fc		 adc ($fc,x)
$19:841d  8c e4 43	  sty $43e4
$19:8420  64 d9		 stz $d9
$19:8422  94 25		 sty $25,x
$19:8424  56 82		 lsr $82,x
$19:8426  60			rts
$19:8427  50 14		 bvc $843d
$19:8429  45 2e		 eor $2e
$19:842b  0b			phd
$19:842c  93 5a		 sta ($5a,s),y
$19:842e  81 c5		 sta ($c5,x)
$19:8430  18			clc
$19:8431  a2 c1		 ldx #$c1
$19:8433  33 fb		 and ($fb,s),y
$19:8435  35 41		 and $41,x
$19:8437  a0 88		 ldy #$88
$19:8439  f6 97		 inc $97,x
$19:843b  b7 f6		 lda [$f6],y
$19:843d  56 f7		 lsr $f7,x
$19:843f  55 7b		 eor $7b,x
$19:8441  bf d5 7e e0   lda $e07ed5,x
$19:8445  f5 67		 sbc $67,x
$19:8447  b8			clv
$19:8448  a1 5b		 lda ($5b,x)
$19:844a  ec 72 35	  cpx $3572
$19:844d  78			sei
$19:844e  bb			tyx
$19:844f  d9 06 af	  cmp $af06,y
$19:8452  e7 49		 sbc [$49]
$19:8454  a8			tay
$19:8455  39 d5 48	  and $48d5,y
$19:8458  e0 00		 cpx #$00
$19:845a  fb			xce
$19:845b  2c 89 e0	  bit $e089
$19:845e  63 09		 adc $09,s
$19:8460  42 19		 wdm #$19
$19:8462  02 52		 cop #$52
$19:8464  86 50		 stx $50
$19:8466  95 59		 sta $59,x
$19:8468  98			tya
$19:8469  15 e6		 ora $e6,x
$19:846b  42 f3		 wdm #$f3
$19:846d  57 a8		 eor [$a8],y
$19:846f  0c 8f 74	  tsb $748f
$19:8472  13 24		 ora ($24,s),y
$19:8474  5d 0a d8	  eor $d80a,x
$19:8477  56 ca		 lsr $ca,x
$19:8479  c3 78		 cmp $78,s
$19:847b  0a			asl a
$19:847c  be c8 62	  ldx $62c8,y
$19:847f  bf b2 98 b3   lda $b398b2,x
$19:8483  ec 52 2d	  cpx $2d52
$19:8486  f6 19		 inc $19,x
$19:8488  93 bd		 sta ($bd,s),y
$19:848a  8e 04 43	  stx $4304
$19:848d  34 08		 bit $08,x
$19:848f  bf d8 a6 69   lda $69a6d8,x
$19:8493  11 07		 ora ($07),y
$19:8495  b1 8c		 lda ($8c),y
$19:8497  d4 22		 pei ($22)
$19:8499  1f 67 7b 2c   ora $2c7b67,x
$19:849d  02 5b		 cop #$5b
$19:849f  12 19		 ora ($19)
$19:84a1  a2 c0		 ldx #$c0
$19:84a3  65 ec		 adc $ec
$19:84a5  55 21		 eor $21,x
$19:84a7  8a			txa
$19:84a8  b1 5a		 lda ($5a),y
$19:84aa  c8			iny
$19:84ab  42 15		 wdm #$15
$19:84ad  62 cb 55	  per $da7b
$19:84b0  8f 11 96 cb   sta $cb9611
$19:84b4  22 65 e1 7b   jsl $7be165
$19:84b8  0c be 59	  tsb $59be
$19:84bb  14 2f		 trb $2f
$19:84bd  03 fc		 ora $fc,s
$19:84bf  8f 41 13 96   sta $961341
$19:84c3  bf c9 04 40   lda $4004c9,x
$19:84c7  f2 08		 sbc ($08)
$19:84c9  80 e4		 bra $84af
$19:84cb  11 e9		 ora ($e9),y
$19:84cd  2f 96 87 c8   and $c88796
$19:84d1  40			rti
$19:84d2  49 f6		 eor #$f6
$19:84d4  3b			tsc
$19:84d5  13 e4		 ora ($e4,s),y
$19:84d7  95 ee		 sta $ee,x
$19:84d9  87 30		 sta [$30]
$19:84db  18			clc
$19:84dc  4b			phk
$19:84dd  18			clc
$19:84de  0b			phd
$19:84df  2d 47 98	  and $9847
$19:84e2  4c 12 c8	  jmp $c812
$19:84e5  13 08		 ora ($08,s),y
$19:84e7  8a			txa
$19:84e8  85 22		 sta $22
$19:84ea  2d f6 6b	  and $6bf6
$19:84ed  04 ba		 tsb $ba
$19:84ef  57 10		 eor [$10],y
$19:84f1  57 04		 eor [$04],y
$19:84f3  01 ac		 ora ($ac,x)
$19:84f5  11 29		 ora ($29),y
$19:84f7  6b			rtl
$19:84f8  c8			iny
$19:84f9  9c c0 e6	  stz $e6c0
$19:84fc  07 d0		 ora [$d0]
$19:84fe  4b			phk
$19:84ff  e5 72		 sbc $72
$19:8501  e7 fa		 sbc [$fa]
$19:8503  cb			wai
$19:8504  62 01 03	  per $8808
$19:8507  33 00		 and ($00,s),y
$19:8509  41 22		 eor ($22,x)
$19:850b  04 30		 tsb $30
$19:850d  4e 84 ae	  lsr $ae84
$19:8510  5a			phy
$19:8511  20 02 18	  jsr $1802
$19:8514  3c 41 5c	  bit $5c41,x
$19:8517  12 c3		 ora ($c3)
$19:8519  33 8d		 and ($8d,s),y
$19:851b  b9 f4 06	  lda $06f4,y
$19:851e  74 96		 stz $96,x
$19:8520  13 c0		 ora ($c0,s),y
$19:8522  54 24 60	  mvn $60,$24
$19:8525  0a			asl a
$19:8526  09 3c		 ora #$3c
$19:8528  01 e2		 ora ($e2,x)
$19:852a  20 02 fa	  jsr $fa02
$19:852d  09 04		 ora #$04
$19:852f  be 6f 53	  ldx $536f,y
$19:8532  7b			tdc
$19:8533  89 18		 bit #$18
$19:8535  0e 26 2e	  asl $2e26
$19:8538  07 f9		 ora [$f9]
$19:853a  39 80 5a	  and $5a80,y
$19:853d  08			php
$19:853e  03 7d		 ora $7d,s
$19:8540  08			php
$19:8541  40			rti
$19:8542  e5 92		 sbc $92
$19:8544  e4 82		 cpx $82
$19:8546  08			php
$19:8547  c8			iny
$19:8548  42 22		 wdm #$22
$19:854a  30 11		 bmi $855d
$19:854c  81 64		 sta ($64,x)
$19:854e  25 65		 and $65
$19:8550  01 80		 ora ($80,x)
$19:8552  3c 80 f0	  bit $f080,x
$19:8555  8f 20 96 1c   sta $1c9620
$19:8559  4c 0a 02	  jmp $020a
$19:855c  30 7f		 bmi $85dd
$19:855e  92 fc		 sta ($fc)
$19:8560  65 8f		 adc $8f
$19:8562  f2 29		 sbc ($29)
$19:8564  14 b0		 trb $b0
$19:8566  20 25 22	  jsr $2225
$19:8569  69 11		 adc #$11
$19:856b  21 05		 and ($05,x)
$19:856d  b0 af		 bcs $851e
$19:856f  06 b9		 asl $b9
$19:8571  91 82		 sta ($82),y
$19:8573  5e ac 12	  lsr $12ac,x
$19:8576  10 a1		 bpl $8519
$19:8578  41 f0		 eor ($f0,x)
$19:857a  88			dey
$19:857b  41 7c		 eor ($7c,x)
$19:857d  09 4c		 ora #$4c
$19:857f  11 e2		 ora ($e2),y
$19:8581  a7 02		 lda [$02]
$19:8583  c8			iny
$19:8584  a3 cc		 lda $cc,s
$19:8586  b2 06		 lda ($06)
$19:8588  76 7c		 ror $7c,x
$19:858a  02 9c		 cop #$9c
$19:858c  0d 4a 77	  ora $774a
$19:858f  47 00		 eor [$00]
$19:8591  9c 91 b6	  stz $b691
$19:8594  08			php
$19:8595  93 18		 sta ($18,s),y
$19:8597  0a			asl a
$19:8598  08			php
$19:8599  dc a0 18	  jml [$18a0]
$19:859c  34 72		 bit $72,x
$19:859e  29 45		 and #$45
$19:85a0  3e 4a 91	  rol $914a,x
$19:85a3  95 a8		 sta $a8,x
$19:85a5  40			rti
$19:85a6  28			plp
$19:85a7  2a			rol a
$19:85a8  c1 0e		 cmp ($0e,x)
$19:85aa  88			dey
$19:85ab  e8			inx
$19:85ac  da			phx
$19:85ad  60			rts
$19:85ae  b1 47		 lda ($47),y
$19:85b0  b8			clv
$19:85b1  4a			lsr a
$19:85b2  c8			iny
$19:85b3  44 c6 03	  mvp $03,$c6
$19:85b6  28			plp
$19:85b7  cb			wai
$19:85b8  c8			iny
$19:85b9  64 a3		 stz $a3
$19:85bb  10 b9		 bpl $8576
$19:85bd  03 04		 ora $04,s
$19:85bf  12 12		 ora ($12)
$19:85c1  f6 ea		 inc $ea,x
$19:85c3  26 84		 rol $84
$19:85c5  5c 4e 32 2a   jml $2a324e
$19:85c9  8b			phb
$19:85ca  c5 15		 cmp $15
$19:85cc  ef 2e 6b 98   sbc $986b2e
$19:85d0  50 51		 bvc $8623
$19:85d2  e0 47		 cpx #$47
$19:85d4  28			plp
$19:85d5  81 38		 sta ($38,x)
$19:85d7  4a			lsr a
$19:85d8  06 d4		 asl $d4
$19:85da  40			rti
$19:85db  f2 a3		 sbc ($a3)
$19:85dd  c1 c2		 cmp ($c2,x)
$19:85df  60			rts
$19:85e0  21 1d		 and ($1d,x)
$19:85e2  1a			inc a
$19:85e3  dc 5d ec	  jml [$ec5d]
$19:85e6  82 35 f8	  brl $7e1e
$19:85e9  a0 8c		 ldy #$8c
$19:85eb  9c a5 a0	  stz $a0a5
$19:85ee  68			pla
$19:85ef  03 51		 ora $51,s
$19:85f1  9c ea 66	  stz $66ea
$19:85f4  13 58		 ora ($58,s),y
$19:85f6  b0 45		 bcs $863d
$19:85f8  3e 4f 03	  rol $034f,x
$19:85fb  18			clc
$19:85fc  48			pha
$19:85fd  00 c8		 brk #$c8
$19:85ff  0a			asl a
$19:8600  d0 05		 bne $8607
$19:8602  d8			cld
$19:8603  04 0d		 tsb $0d
$19:8605  82 01 63	  brl $e909
$19:8608  4c 1a 90	  jmp $901a
$19:860b  9b			txy
$19:860c  e9 2f		 sbc #$2f
$19:860e  79 90 bc	  adc $bc90,y
$19:8611  d6 ea		 dec $ea,x
$19:8613  03 09		 ora $09,s
$19:8615  79 ea ce	  adc $ceea,y
$19:8618  20 c0 46	  jsr $46c0
$19:861b  78			sei
$19:861c  3a			dec a
$19:861d  c9 76		 cmp #$76
$19:861f  06 50		 asl $50
$19:8621  4c 23 80	  jmp $8023
$19:8624  a5 6c		 lda $6c
$19:8626  90 39		 bcc $8661
$19:8628  90 c4		 bcc $85ee
$19:862a  d5 f6		 cmp $f6,x
$19:862c  09 15		 ora #$15
$19:862e  fd 84 05	  sbc $0584,x
$19:8631  5e 45 a2	  lsr $a245,x
$19:8634  6c 11 8e	  jmp ($8e11)
$19:8637  c6 84		 dec $84
$19:8639  71 17		 adc ($17),y
$19:863b  7b			tdc
$19:863c  10 cd		 bpl $860b
$19:863e  02 2f		 cop #$2f
$19:8640  f6 29		 inc $29,x
$19:8642  94 b2		 sty $b2,x
$19:8644  5c 2a 02 99   jml $99022a
$19:8648  a8			tay
$19:8649  44 d0 a1	  mvp $a1,$d0
$19:864c  f7 57		 sbc [$57],y
$19:864e  9b			txy
$19:864f  64 45		 stz $45
$19:8651  eb			xba
$19:8652  2d 17 ab	  and $ab17
$19:8655  19 07 a0	  ora $a007,y
$19:8658  c6 35		 dec $35
$19:865a  58			cli
$19:865b  04 02		 tsb $02
$19:865d  56 a1		 lsr $a1,x
$19:865f  02 a0		 cop #$a0
$19:8661  84 00		 sty $00
$19:8663  3f b2 d7 79   and $79d7b2,x
$19:8667  3c 08 de	  bit $de08,x
$19:866a  b2 c7		 lda ($c7)
$19:866c  f9 00 40	  sbc $4000,y
$19:866f  b2 07		 lda ($07)
$19:8671  f4 71 00	  pea $0071
$19:8674  5c cb 20 0e   jml $0e20cb
$19:8678  34 a0		 bit $a0,x
$19:867a  80 c0		 bra $863c
$19:867c  da			phx
$19:867d  12 c0		 ora ($c0)
$19:867f  a8			tay
$19:8680  38			sec
$19:8681  40			rti
$19:8682  3a			dec a
$19:8683  0f 50 52 03   ora $035250
$19:8687  94 22		 sty $22,x
$19:8689  07 14		 ora [$14]
$19:868b  08			php
$19:868c  02 c1		 cop #$c1
$19:868e  50 c8		 bvc $8658
$19:8690  03 16		 ora $16,s
$19:8692  03 05		 ora $05,s
$19:8694  ce 56 14	  dec $1456
$19:8697  00 ba		 brk #$ba
$19:8699  8a			txa
$19:869a  14 3c		 trb $3c
$19:869c  ea			nop
$19:869d  a1 21		 lda ($21,x)
$19:869f  8c 4a 2e	  sty $2e4a
$19:86a2  ef 28 94 69   sbc $699428
$19:86a6  f8			sed
$19:86a7  0a			asl a
$19:86a8  a0 97		 ldy #$97
$19:86aa  45 a3		 eor $a3
$19:86ac  20 31 55	  jsr $5531
$19:86af  00 08		 brk #$08
$19:86b1  dd c3 18	  cmp $18c3,x
$19:86b4  08			php
$19:86b5  92 a4		 sta ($a4)
$19:86b7  42 2d		 wdm #$2d
$19:86b9  17 10		 ora [$10],y
$19:86bb  92 70		 sta ($70)
$19:86bd  60			rts
$19:86be  02 11		 cop #$11
$19:86c0  95 c5		 sta $c5,x
$19:86c2  1f 82 fc 08   ora $08fc82,x
$19:86c6  bb			tyx
$19:86c7  b8			clv
$19:86c8  05 e6		 ora $e6
$19:86ca  fc 08 c3	  jsr ($c308,x)
$19:86cd  94 80		 sty $80,x
$19:86cf  64 de		 stz $de
$19:86d1  04 a8		 tsb $a8
$19:86d3  10 8a		 bpl $865f
$19:86d5  28			plp
$19:86d6  95 07		 sta $07,x
$19:86d8  88			dey
$19:86d9  45 02		 eor $02
$19:86db  21 15		 and ($15,x)
$19:86dd  77 94		 adc [$94],y
$19:86df  bc 22 11	  ldy $1122,x
$19:86e2  47 79		 eor [$79]
$19:86e4  89 09		 bit #$09
$19:86e6  e2 31		 sep #$31
$19:86e8  11 20		 ora ($20),y
$19:86ea  a8			tay
$19:86eb  01 e2		 ora ($e2,x)
$19:86ed  4a			lsr a
$19:86ee  c0 95		 cpy #$95
$19:86f0  c4 8e		 cpy $8e
$19:86f2  26 0d		 rol $0d
$19:86f4  12 78		 ora ($78)
$19:86f6  1f 08 1a 11   ora $111a08,x
$19:86fa  55 e0		 eor $e0,x
$19:86fc  3c 40 ba	  bit $ba40,x
$19:86ff  32 d2		 and ($d2)
$19:8701  b8			clv
$19:8702  23 48		 and $48,s
$19:8704  2a			rol a
$19:8705  11 61		 ora ($61),y
$19:8707  3a			dec a
$19:8708  95 c9		 sta $c9,x
$19:870a  3e ca e6	  rol $e6ca,x
$19:870d  88			dey
$19:870e  8d d6 22	  sta $22d6
$19:8711  03 22		 ora $22,s
$19:8713  61 00		 adc ($00,x)
$19:8715  c2 58		 rep #$58
$19:8717  66 24		 ror $24
$19:8719  c2 a3		 rep #$a3
$19:871b  80 f2		 bra $870f
$19:871d  11 37		 ora ($37),y
$19:871f  79 2a 71	  adc $712a,y
$19:8722  cd 03 75	  cmp $7503
$19:8725  8d 30 16	  sta $1630
$19:8728  32 b3		 and ($b3)
$19:872a  18			clc
$19:872b  98			tya
$19:872c  0d 52 e2	  ora $e252
$19:872f  55 00		 eor $00,x
$19:8731  82 85 82	  brl $09b9
$19:8734  24 9f		 bit $9f
$19:8736  14 f8		 trb $f8
$19:8738  a7 89		 lda [$89]
$19:873a  3e 32 c7	  rol $c732,x
$19:873d  7c cb 23	  jmp ($23cb,x)
$19:8740  08			php
$19:8741  00 43		 brk #$43
$19:8743  0b			phd
$19:8744  68			pla
$19:8745  14 20		 trb $20
$19:8747  3d 22 11	  and $1122,x
$19:874a  4b			phk
$19:874b  62 f1 89	  per $113f
$19:874e  64 59		 stz $59
$19:8750  98			tya
$19:8751  68			pla
$19:8752  b0 4d		 bcs $87a1
$19:8754  8c 49 30	  sty $3049
$19:8757  2a			rol a
$19:8758  35 8a		 and $8a,x
$19:875a  b3 05		 lda ($05,s),y
$19:875c  3c 4e 68	  bit $684e,x
$19:875f  2e 02 e0	  rol $e002
$19:8762  a2 4f f6	  ldx #$f64f
$19:8765  60			rts
$19:8766  0c 48 ce	  tsb $ce48
$19:8769  11 42		 ora ($42),y
$19:876b  a8			tay
$19:876c  14 40		 trb $40
$19:876e  a2 32 b2	  ldx #$b232
$19:8771  a8			tay
$19:8772  24 89		 bit $89
$19:8774  ba			tsx
$19:8775  31 59		 and ($59),y
$19:8777  79 80 06	  adc $0680,y
$19:877a  43 17		 eor $17,s
$19:877c  45 8b		 eor $8b
$19:877e  8e a2 d1	  stx $d1a2
$19:8781  49 6c b6	  eor #$b66c
$19:8784  5e 2e 14	  lsr $142e,x
$19:8787  20 ae 02	  jsr $02ae
$19:878a  22 52 04 21   jsl $210452
$19:878e  a3 41		 lda $41,s
$19:8790  72 01		 adc ($01)
$19:8792  93 49		 sta ($49,s),y
$19:8794  04 01		 tsb $01
$19:8796  9e a3 20	  stz $20a3,x
$19:8799  8a			txa
$19:879a  0a			asl a
$19:879b  8a			txa
$19:879c  26 32		 rol $32
$19:879e  02 68		 cop #$68
$19:87a0  08			php
$19:87a1  cd df 72	  cmp $72df
$19:87a4  c8			iny
$19:87a5  a3 e4		 lda $e4,s
$19:87a7  e5 e4		 sbc $e4
$19:87a9  71 7e		 adc ($7e),y
$19:87ab  0b			phd
$19:87ac  20 da 06	  jsr $06da
$19:87af  8f 13 08 b4   sta $b40813
$19:87b3  09 40 06	  ora #$0640
$19:87b6  10 75		 bpl $882d
$19:87b8  14 b4		 trb $b4
$19:87ba  c0 2e ba	  cpy #$ba2e
$19:87bd  8d 25 80	  sta $8025
$19:87c0  c2 2b		 rep #$2b
$19:87c2  d1 11		 cmp ($11),y
$19:87c4  01 68		 ora ($68,x)
$19:87c6  50 82		 bvc $874a
$19:87c8  22 03 f9 c6   jsl $c6f903
$19:87cc  11 c2		 ora ($c2),y
$19:87ce  10 55		 bpl $8825
$19:87d0  00 34		 brk #$34
$19:87d2  86 2e		 stx $2e
$19:87d4  9a			txs
$19:87d5  08			php
$19:87d6  90 84		 bcc $875c
$19:87d8  cc 24 ab	  cpy $ab24
$19:87db  a5 6a		 lda $6a
$19:87dd  b0 42		 bcs $8821
$19:87df  56 80		 lsr $80,x
$19:87e1  04 e0		 tsb $e0
$19:87e3  b0 08		 bcs $87ed
$19:87e5  82 21 a2	  brl $2a09
$19:87e8  95 85		 sta $85,x
$19:87ea  d5 aa		 cmp $aa,x
$19:87ec  03 a1		 ora $a1,s
$19:87ee  12 81		 ora ($81)
$19:87f0  0c 0d 7e	  tsb $7e0d
$19:87f3  b3 f6		 lda ($f6,s),y
$19:87f5  27 bd		 and [$bd]
$19:87f7  c2 54		 rep #$54
$19:87f9  d8			cld
$19:87fa  46 a1		 lsr $a1
$19:87fc  b4 59		 ldy $59,x
$19:87fe  8f ef cf 67   sta $67cfef
$19:8802  4b			phk
$19:8803  99 5b a6	  sta $a65b,y
$19:8806  dd 11 33	  cmp $3311,x
$19:8809  0b			phd
$19:880a  fc 81 e5	  jsr ($e581,x)
$19:880d  1f 31 79 cf   ora $cf7931,x
$19:8811  d0 9e		 bne $87b1
$19:8813  95 f5		 sta $f5,x
$19:8815  37 ad		 and [$ad],y
$19:8817  fd 91 ed	  sbc $ed91,x
$19:881a  9f 09 14 ae   sta $ae1409,x
$19:881e  56 e9		 lsr $e9,x
$19:8820  f7 40		 sbc [$40],y
$19:8822  cb			wai
$19:8823  62 2e f2	  per $7a54
$19:8826  02 84		 cop #$84
$19:8828  56 2a		 lsr $2a,x
$19:882a  ef 19 7c 50   sbc $507c19
$19:882e  26 2e		 rol $2e
$19:8830  f0 09		 beq $883b
$19:8832  18			clc
$19:8833  58			cli
$19:8834  62 62 12	  per $9a99
$19:8837  96 06		 stx $06,y
$19:8839  00 44		 brk #$44
$19:883b  71 17		 adc ($17),y
$19:883d  41 44		 eor ($44,x)
$19:883f  62 c3 40	  per $c905
$19:8842  19 18 d0	  ora $d018,y
$19:8845  41 a0		 eor ($a0,x)
$19:8847  3f 89 7c b4   and $b47c89,x
$19:884b  1a			inc a
$19:884c  11 42		 ora ($42),y
$19:884e  58			cli
$19:884f  4b			phk
$19:8850  65 72		 adc $72
$19:8852  c0 98 4b	  cpy #$4b98
$19:8855  25 a2		 and $a2
$19:8857  60			rts
$19:8858  78			sei
$19:8859  00 4c		 brk #$4c
$19:885b  00 c7		 brk #$c7
$19:885d  00 10		 brk #$10
$19:885f  83 bd		 sta $bd,s
$19:8861  04 20		 tsb $20
$19:8863  34 19		 bit $19,x
$19:8865  58			cli
$19:8866  58			cli
$19:8867  60			rts
$19:8868  06 f6		 asl $f6
$19:886a  1f 88 80 0f   ora $0f8088,x
$19:886e  92 14		 sta ($14)
$19:8870  28			plp
$19:8871  92 32		 sta ($32)
$19:8873  44 23 2b	  mvp $2b,$23
$19:8876  03 12		 ora $12,s
$19:8878  7d 9c 1a	  adc $1a9c,x
$19:887b  2e 30 10	  rol $1030
$19:887e  c5 58		 cmp $58
$19:8880  0a			asl a
$19:8881  c6 48		 dec $48
$19:8883  80 4c		 bra $88d1
$19:8885  1d 06 13	  ora $1306,x
$19:8888  13 4a		 ora ($4a,s),y
$19:888a  08			php
$19:888b  40			rti
$19:888c  04 22		 tsb $22
$19:888e  83 1c		 sta $1c,s
$19:8890  a0 18 07	  ldy #$0718
$19:8893  28			plp
$19:8894  72 01		 adc ($01)
$19:8896  f9 cb 04	  sbc $04cb,y
$19:8899  a0 3f 28	  ldy #$283f
$19:889c  82 08 5b	  brl $e3a7
$19:889f  82 91 36	  brl $bf33
$19:88a2  e0 cb 22	  cpx #$22cb
$19:88a5  45 90		 eor $90
$19:88a7  32 0c		 and ($0c)
$19:88a9  bd 44 aa	  lda $aa44,x
$19:88ac  a4 39		 ldy $39
$19:88ae  94 48		 sty $48,x
$19:88b0  de 4a d1	  dec $d14a,x
$19:88b3  7c 9b 28	  jmp ($289b,x)
$19:88b6  d0 02		 bne $88ba
$19:88b8  40			rti
$19:88b9  56 c2		 lsr $c2,x
$19:88bb  b7 8c		 lda [$8c],y
$19:88bd  a6 ce		 ldx $ce
$19:88bf  35 71		 and $71,x
$19:88c1  1b			tcs
$19:88c2  f0 55		 beq $8919
$19:88c4  86 ef		 stx $ef
$19:88c6  47 98		 eor [$98]
$19:88c8  3f cc 86 60   and $6086cc,x
$19:88cc  d0 56		 bne $8924
$19:88ce  90 48		 bcc $8918
$19:88d0  db			stp
$19:88d1  24 1a		 bit $1a
$19:88d3  37 08		 and [$08],y
$19:88d5  cb			wai
$19:88d6  62 32 d4	  per $5d0b
$19:88d9  d9 a7 c0	  cmp $c0a7,y
$19:88dc  42 03		 wdm #$03
$19:88de  f2 3a		 sbc ($3a)
$19:88e0  c1 ea		 cmp ($ea,x)
$19:88e2  d5 a6		 cmp $a6,x
$19:88e4  cb			wai
$19:88e5  f6 e7		 inc $e7,x
$19:88e7  c0 25 e2	  cpy #$e225
$19:88ea  01 3d		 ora ($3d,x)
$19:88ec  12 7c		 ora ($7c)
$19:88ee  05 e0		 ora $e0
$19:88f0  7b			tdc
$19:88f1  34 40		 bit $40,x
$19:88f3  92 d8		 sta ($d8)
$19:88f5  97 e5		 sta [$e5],y
$19:88f7  cf 36 92 25   cmp $259236
$19:88fb  0d ec 87	  ora $87ec
$19:88fe  64 3f		 stz $3f
$19:8900  a4 15		 ldy $15
$19:8902  12 11		 ora ($11)
$19:8904  12 d5		 ora ($d5)
$19:8906  9b			txy
$19:8907  bc ff e9	  ldy $e9ff,x
$19:890a  0f 50 fc a9   ora $a9fc50
$19:890e  59 eb dc	  eor $dceb,y
$19:8911  69 7a 9f	  adc #$9f7a
$19:8914  5e 06 bb	  lsr $bb06,x
$19:8917  47 b7		 eor [$b7]
$19:8919  b7 fc		 lda [$fc],y
$19:891b  3f e3 0f 20   and $200fe3,x
$19:891f  f9 4b cc	  sbc $cc4b,y
$19:8922  7e 74 f4	  ror $f474,x
$19:8925  2f a5 bd 4f   and $4fbda5
$19:8929  eb			xba
$19:892a  8f 64 fb 6b   sta $6bfb64
$19:892e  c0 43 2b	  cpy #$2b43
$19:8931  89 3c 0a	  bit #$0a3c
$19:8934  5b			tcd
$19:8935  10 77		 bpl $89ae
$19:8937  9b			txy
$19:8938  d4 25		 pei ($25)
$19:893a  b2 b8		 lda ($b8)
$19:893c  88			dey
$19:893d  00 65		 brk #$65
$19:893f  92 f9		 sta ($f9)
$19:8941  5b			tcd
$19:8942  fc e5 b2	  jsr ($b2e5,x)
$19:8945  f7 f0		 sbc [$f0],y
$19:8947  44 02 04	  mvp $04,$02
$19:894a  04 19		 tsb $19
$19:894c  70 41		 bvs $898f
$19:894e  25 d2		 and $d2
$19:8950  b9 78 85	  lda $8578,y
$19:8953  00 c1		 brk #$c1
$19:8955  2e 12 23	  rol $2312
$19:8958  a8			tay
$19:8959  9e 00 30	  stz $3000,x
$19:895c  31 a3		 and ($a3),y
$19:895e  4b			phk
$19:895f  00 00		 brk #$00
$19:8961  30 22		 bmi $8985
$19:8963  20 82 c2	  jsr $c282
$19:8966  57 2d		 eor [$2d],y
$19:8968  7a			ply
$19:8969  80 40		 bra $89ab
$19:896b  4a			lsr a
$19:896c  4c 21 22	  jmp $2221
$19:896f  78			sei
$19:8970  88			dey
$19:8971  42 5d		 wdm #$5d
$19:8973  2c 96 0b	  bit $0b96
$19:8976  c6 5a		 dec $5a
$19:8978  f0 10		 beq $898a
$19:897a  78			sei
$19:897b  0b			phd
$19:897c  c4 de		 cpy $de
$19:897e  c0 01 0b	  cpy #$0b01
$19:8981  81 f1		 sta ($f1,x)
$19:8983  25 85		 and $85
$19:8985  10 03		 bpl $898a
$19:8987  00 44		 brk #$44
$19:8989  de a2 10	  dec $10a2,x
$19:898c  37 e8		 and [$e8],y
$19:898e  19 44 c0	  ora $c044,y
$19:8991  66 70		 ror $70
$19:8993  33 10		 and ($10,s),y
$19:8995  80 46		 bra $89dd
$19:8997  46 f0		 lsr $f0
$19:8999  15 82		 ora $82,x
$19:899b  ad 82 5c	  lda $5c82
$19:899e  00 20		 brk #$20
$19:89a0  00 1f		 brk #$1f
$19:89a2  88			dey
$19:89a3  02 49		 cop #$49
$19:89a5  75 4b		 adc $4b,x
$19:89a7  28			plp
$19:89a8  a5 1b		 lda $1b
$19:89aa  f5 12		 sbc $12,x
$19:89ac  67 01		 adc [$01]
$19:89ae  a8			tay
$19:89af  07 02		 ora [$02]
$19:89b1  1f 03 99 0e   ora $0e9903,x
$19:89b5  00 40		 brk #$40
$19:89b7  02 f4		 cop #$f4
$19:89b9  97 bc		 sta [$bc],y
$19:89bb  8d ea 43	  sta $43ea
$19:89be  74 08		 stz $08,x
$19:89c0  28			plp
$19:89c1  18			clc
$19:89c2  1b			tcs
$19:89c3  fa			plx
$19:89c4  19 25 9a	  ora $9a25,y
$19:89c7  06 40		 asl $40
$19:89c9  dc 41 91	  jml [$9141]
$19:89cc  40			rti
$19:89cd  83 10		 sta $10,s
$19:89cf  8d a0 81	  sta $81a0
$19:89d2  02 48		 cop #$48
$19:89d4  11 85		 ora ($85),y
$19:89d6  b6 4d		 ldx $4d,y
$19:89d8  80 28		 bra $8a02
$19:89da  0c ba 00	  tsb $00ba
$19:89dd  ab			plb
$19:89de  08			php
$19:89df  83 a0		 sta $a0,s
$19:89e1  65 88		 adc $88
$19:89e3  32 2f		 and ($2f)
$19:89e5  b2 e4		 lda ($e4)
$19:89e7  1e 00 10	  asl $1000,x
$19:89ea  25 c8		 and $c8
$19:89ec  25 01		 and $01
$19:89ee  aa			tax
$19:89ef  04 01		 tsb $01
$19:89f1  66 08		 ror $08
$19:89f3  1c 99 46	  trb $4699
$19:89f6  07 16		 ora [$16]
$19:89f8  82 4b 59	  brl $e346
$19:89fb  ca			dex
$19:89fc  93 11		 sta ($11,s),y
$19:89fe  43 4b		 eor $4b,s
$19:8a00  13 e8		 ora ($e8,s),y
$19:8a02  19 45 7b	  ora $7b45,y
$19:8a05  8d 8c 8e	  sta $8e8c
$19:8a08  41 93		 eor ($93,x)
$19:8a0a  96 11		 stx $11,y
$19:8a0c  00 c8		 brk #$c8
$19:8a0e  2a			rol a
$19:8a0f  80 49		 bra $8a5a
$19:8a11  0b			phd
$19:8a12  48			pha
$19:8a13  93 02		 sta ($02,s),y
$19:8a15  ff 05 01 1e   sbc $1e0105,x
$19:8a19  c1 04		 cmp ($04,x)
$19:8a1b  0e 21 96	  asl $9621
$19:8a1e  3a			dec a
$19:8a1f  c0 12 63	  cpy #$6312
$19:8a22  32 89		 and ($89)
$19:8a24  23 82		 and $82,s
$19:8a26  56 33		 lsr $33,x
$19:8a28  24 f0		 bit $f0
$19:8a2a  90 c8		 bcc $89f4
$19:8a2c  94 0e		 sty $0e,x
$19:8a2e  31 01		 and ($01),y
$19:8a30  99 8c 0a	  sta $0a8c,y
$19:8a33  e2 58		 sep #$58
$19:8a35  12 e0		 ora ($e0)
$19:8a37  25 8c		 and $8c
$19:8a39  30 2a		 bmi $8a65
$19:8a3b  24 50		 bit $50
$19:8a3d  2b			pld
$19:8a3e  dc 9d c4	  jml [$c49d]
$19:8a41  2f 60 30 8e   and $8e3060
$19:8a45  ac e4 06	  ldy $06e4
$19:8a48  32 26		 and ($26)
$19:8a4a  8b			phb
$19:8a4b  ac 0f 64	  ldy $640f
$19:8a4e  27 17		 and [$17]
$19:8a50  20 bb 85	  jsr $85bb
$19:8a53  40			rti
$19:8a54  42 00		 wdm #$00
$19:8a56  76 a1		 ror $a1,x
$19:8a58  cb			wai
$19:8a59  d0 7e		 bne $8ad9
$19:8a5b  94 f5		 sty $f5,x
$19:8a5d  2f ad bd 8f   and $8fbdad
$19:8a61  ed 8f 74	  sbc $748f
$19:8a64  fb			xce
$19:8a65  eb			xba
$19:8a66  c1 7e		 cmp ($7e,x)
$19:8a68  1c f1 6f	  trb $6ff1
$19:8a6b  8f bc 9f e6   sta $e69fbc
$19:8a6f  0f 38 fa 0b   ora $0bfa38
$19:8a73  d2 7e		 cmp ($7e)
$19:8a75  a4 f5		 ldy $f5
$19:8a77  af b1 bd af   lda $afbdb1
$19:8a7b  ee 84 bd	  inc $bd84
$19:8a7e  14 ab		 trb $ab
$19:8a80  4e 37 13	  lsr $1337
$19:8a83  89 d4 e6	  bit #$e6d4
$19:8a86  89 39 d7	  bit #$d739
$19:8a89  4e 63 13	  lsr $1363
$19:8a8c  a9 94 ea	  lda #$ea94
$19:8a8f  99 3a cf	  sta $cf3a,y
$19:8a92  4e b7 13	  lsr $13b7
$19:8a95  af 94 eb f9   lda $f9eb94
$19:8a99  3a			dec a
$19:8a9a  b3 4e		 lda ($4e,s),y
$19:8a9c  f3 13		 sbc ($13,s),y
$19:8a9e  be 54 ef	  ldx $ef54,y
$19:8aa1  b9 3b f7	  lda $f73b,y
$19:8aa4  4e e0 13	  lsr $13e0
$19:8aa7  c8			iny
$19:8aa8  94 f2		 sty $f2,x
$19:8aaa  49 3c 9b	  eor #$9b3c
$19:8aad  4f 2a 13 cb   eor $cb132a
$19:8ab1  d4 f3		 pei ($f3)
$19:8ab3  49 3c e7	  eor #$e73c
$19:8ab6  4f 3f 13 c8   eor $c8133f
$19:8aba  14 f6		 trb $f6
$19:8abc  19 3d ab	  ora $ab3d,y
$19:8abf  4f 74 13 df   eor $df1374
$19:8ac3  d4 f6		 pei ($f6)
$19:8ac5  29 3e 93	  and #$933e
$19:8ac8  4f aa 13 ed   eor $ed13aa
$19:8acc  94 fb		 sty $fb,x
$19:8ace  79 3e e3	  adc $e33e,y
$19:8ad1  4f ba 13 ef   eor $ef13ba
$19:8ad5  14 fb		 trb $fb
$19:8ad7  e9 3e 83	  sbc #$833e
$19:8ada  4f e3 13 f9   eor $f913e3
$19:8ade  54 fe 09	  mvn $09,$fe
$19:8ae1  00 23		 brk #$23
$19:8ae3  17 76		 ora [$76],y
$19:8ae5  89 01 23	  bit #$2301
$19:8ae8  1e 96 88	  asl $8896,x
$19:8aeb  45 68		 eor $68
$19:8aed  11 39		 ora ($39),y
$19:8aef  49 a9 5b	  eor #$5ba9
$19:8af2  a2 97		 ldx #$97
$19:8af4  58			cli
$19:8af5  ab			plb
$19:8af6  e6 6d		 inc $6d
$19:8af8  32 b4		 and ($b4)
$19:8afa  0c 8c 79	  tsb $798c
$19:8afd  ca			dex
$19:8afe  47 ff		 eor [$ff]
$19:8b00  fe 4d 0f	  inc $0f4d,x
$19:8b03  f7 fd		 sbc [$fd],y
$19:8b05  42 44		 wdm #$44
$19:8b07  63 51		 adc $51,s
$19:8b09  09 34 14	  ora #$1434
$19:8b0c  a0 a5		 ldy #$a5
$19:8b0e  05 6e		 ora $6e
$19:8b10  2a			rol a
$19:8b11  41 5b		 eor ($5b,x)
$19:8b13  44 60 5d	  mvp $5d,$60
$19:8b16  92 75		 sta ($75)
$19:8b18  89 a4 4d	  bit #$4da4
$19:8b1b  07 28		 ora [$28]
$19:8b1d  2b			pld
$19:8b1e  e0 9a		 cpx #$9a
$19:8b20  07 d0		 ora [$d0]
$19:8b22  76 e3		 ror $e3,x
$19:8b24  af 0d a4 ed   lda $eda40d
$19:8b28  85 28		 sta $28
$19:8b2a  43 93		 eor $93,s
$19:8b2c  ce 46 22	  dec $2246
$19:8b2f  68			pla
$19:8b30  54 a9 2a	  mvn $2a,$a9
$19:8b33  f4 1c 83	  pea $831c
$19:8b36  9d 07 3e	  sta $3e07,x
$19:8b39  4a			lsr a
$19:8b3a  f2 df		 sbc ($df)
$19:8b3c  9b			txy
$19:8b3d  3c fa 83	  bit $83fa,x
$19:8b40  36 18		 rol $18,x
$19:8b42  a0 c4		 ldy #$c4
$19:8b44  0f 38 a1 f5   ora $f5a138
$19:8b48  97 b0		 sta [$b0],y
$19:8b4a  fd a9 e8	  sbc $e8a9,x
$19:8b4d  ba			tsx
$19:8b4e  70 90		 bvs $8ae0
$19:8b50  c4 20		 cpy $20
$19:8b52  a2 03		 ldx #$03
$19:8b54  fb			xce
$19:8b55  50 c0		 bvc $8b17
$19:8b57  e9 12 a2	  sbc #$a212
$19:8b5a  01 d2		 ora ($d2,x)
$19:8b5c  ab			plb
$19:8b5d  43 18		 eor $18,s
$19:8b5f  84 18		 sty $18
$19:8b61  30 71		 bmi $8bd4
$19:8b63  da			phx
$19:8b64  18			clc
$19:8b65  85 3c		 sta $3c
$19:8b67  b4 21		 ldy $21,x
$19:8b69  0a			asl a
$19:8b6a  07 4a		 ora [$4a]
$19:8b6c  06 76		 asl $76
$19:8b6e  10 d9		 bpl $8b49
$19:8b70  41 d6		 eor ($d6,x)
$19:8b72  02 2d		 cop #$2d
$19:8b74  46 e9		 lsr $e9
$19:8b76  09 c0 2e	  ora #$2ec0
$19:8b79  09 b2 bc	  ora #$bcb2
$19:8b7c  50 e0		 bvc $8b5e
$19:8b7e  83 c3		 sta $c3,s
$19:8b80  d1 50		 cmp ($50),y
$19:8b82  c7 60		 cmp [$60]
$19:8b84  9b			txy
$19:8b85  23 08		 and $08,s
$19:8b87  40			rti
$19:8b88  8b			phb
$19:8b89  8a			txa
$19:8b8a  87 03		 sta [$03]
$19:8b8c  2a			rol a
$19:8b8d  25 48		 and $48
$19:8b8f  be 44 30	  ldx $3044,y
$19:8b92  0c 11 84	  tsb $8411
$19:8b95  08			php
$19:8b96  a0 6b		 ldy #$6b
$19:8b98  00 c1		 brk #$c1
$19:8b9a  6d cb 42	  adc $42cb
$19:8b9d  18			clc
$19:8b9e  2e 98 39	  rol $3998
$19:8ba1  43 a4		 eor $a4,s
$19:8ba3  95 49		 sta $49,x
$19:8ba5  75 11		 adc $11,x
$19:8ba7  2a			rol a
$19:8ba8  81 d0		 sta ($d0,x)
$19:8baa  46 b2		 lsr $b2
$19:8bac  34 88		 bit $88,x
$19:8bae  a1 eb		 lda ($eb,x)
$19:8bb0  a5 c2		 lda $c2
$19:8bb2  1b			tcs
$19:8bb3  c7 31		 cmp [$31]
$19:8bb5  a6 31		 ldx $31
$19:8bb7  d2 b7		 cmp ($b7)
$19:8bb9  4c 0c 14	  jmp $140c
$19:8bbc  56 01		 lsr $01,x
$19:8bbe  d6 a5		 dec $a5,x
$19:8bc0  91 41		 sta ($41),y
$19:8bc2  06 89		 asl $89
$19:8bc4  b0 02		 bcs $8bc8
$19:8bc6  a7 eb		 lda [$eb]
$19:8bc8  ff 34 9f 88   sbc $889f34,x
$19:8bcc  4b			phk
$19:8bcd  f8			sed
$19:8bce  f0 14		 beq $8be4
$19:8bd0  a9 11 41	  lda #$4111
$19:8bd3  e2 03		 sep #$03
$19:8bd5  b0 0c		 bcs $8be3
$19:8bd7  13 c4		 ora ($c4,s),y
$19:8bd9  10 64		 bpl $8c3f
$19:8bdb  3d 0a 9d	  and $9d0a,x
$19:8bde  01 2a		 ora ($2a,x)
$19:8be0  43 b0		 eor $b0,s
$19:8be2  a4 cf		 ldy $cf
$19:8be4  d3 a4		 cmp ($a4,s),y
$19:8be6  9d 00 c8	  sta $c800,x
$19:8be9  0f 49 3c 01   ora $013c49
$19:8bed  90 67		 bcc $8c56
$19:8bef  a5 79		 lda $79
$19:8bf1  f4 69 e0	  pea $e069
$19:8bf4  08			php
$19:8bf5  83 3c		 sta $3c,s
$19:8bf7  84 60		 sty $60
$19:8bf9  19 44 f0	  ora $f044,y
$19:8bfc  5c c8 4b 8f   jml $8f4bc8
$19:8c00  9f ba 51 3c   sta $3c51ba,x
$19:8c04  1e 37 d1	  asl $d137,x
$19:8c07  88			dey
$19:8c08  c2 36		 rep #$36
$19:8c0a  12 34		 ora ($34)
$19:8c0c  f0 4d		 beq $8c5b
$19:8c0e  e8			inx
$19:8c0f  09 d2 11	  ora #$11d2
$19:8c12  87 fc		 sta [$fc]
$19:8c14  64 a6		 stz $a6
$19:8c16  b0 2e		 bcs $8c46
$19:8c18  b2 94		 lda ($94)
$19:8c1a  98			tya
$19:8c1b  60			rts
$19:8c1c  47 0e		 eor [$0e]
$19:8c1e  39 09 75	  and $7509,y
$19:8c21  6f a1 44 a0   adc $a044a1
$19:8c25  cd 0a 20	  cmp $200a
$19:8c28  55 04		 eor $04,x
$19:8c2a  49 12 41	  eor #$4112
$19:8c2d  3e c8 92	  rol $92c8,x
$19:8c30  1a			inc a
$19:8c31  16 f2		 asl $f2,x
$19:8c33  80 b9		 bra $8bee
$19:8c35  46 ec		 lsr $ec
$19:8c37  2f c1 96 95   and $9596c1
$19:8c3b  6a			ror a
$19:8c3c  0b			phd
$19:8c3d  25 be		 and $be
$19:8c3f  f4 16 5a	  pea $5a16
$19:8c42  66 28		 ror $28
$19:8c44  4c 94 11	  jmp $1194
$19:8c47  83 45		 sta $45,s
$19:8c49  04 60		 tsb $60
$19:8c4b  d9 44 49	  cmp $4944,y
$19:8c4e  38			sec
$19:8c4f  c9 12 4e	  cmp #$4e12
$19:8c52  b2 81		 lda ($81)
$19:8c54  c0 3f a8	  cpy #$a83f
$19:8c57  a1 a8		 lda ($a8,x)
$19:8c59  d1 02		 cmp ($02),y
$19:8c5b  69 7b a2	  adc #$a27b
$19:8c5e  21 48		 and ($48,x)
$19:8c60  8e 08 70	  stx $7008
$19:8c63  91 d1		 sta ($d1),y
$19:8c65  4a			lsr a
$19:8c66  a4 87		 ldy $87
$19:8c68  08			php
$19:8c69  3d 14 4a	  and $4a14,x
$19:8c6c  93 fa		 sta ($fa,s),y
$19:8c6e  2b			pld
$19:8c6f  b4 20		 ldy $20,x
$19:8c71  50 0f		 bvc $8c82
$19:8c73  e7 fc		 sbc [$fc]
$19:8c75  e2 03		 sep #$03
$19:8c77  30 1f		 bmi $8c98
$19:8c79  80 54		 bra $8ccf
$19:8c7b  0e 20 3b	  asl $3b20
$19:8c7e  01 f8		 ora ($f8,x)
$19:8c80  7f 88 42 2b   adc $2b4288,x
$19:8c84  01 f8		 ora ($f8,x)
$19:8c86  0f 48 66 48   ora $486648
$19:8c8a  52 1d		 eor ($1d)
$19:8c8c  a2 ac 0b	  ldx #$0bac
$19:8c8f  64 69		 stz $69
$19:8c91  42 69		 wdm #$69
$19:8c93  2a			rol a
$19:8c94  c0 26 05	  cpy #$0526
$19:8c97  52 3d		 eor ($3d)
$19:8c99  90 ce		 bcc $8c69
$19:8c9b  85 a4		 sta $a4
$19:8c9d  7d 0d a5	  adc $a50d,x
$19:8ca0  25 5e		 and $5e
$19:8ca2  47 d0		 eor [$d0]
$19:8ca4  f6 26		 inc $26,x
$19:8ca6  8c 7e 12	  sty $127e
$19:8ca9  4a			lsr a
$19:8caa  50 94		 bvc $8c40
$19:8cac  9e 61 55	  stz $5561,x
$19:8caf  a5 1f		 lda $1f
$19:8cb1  41 e2		 eor ($e2,x)
$19:8cb3  57 fa		 eor [$fa],y
$19:8cb5  51 9d		 eor ($9d),y
$19:8cb7  1a			inc a
$19:8cb8  e1 6d		 sbc ($6d,x)
$19:8cba  a5 af		 lda $af
$19:8cbc  53 58		 eor ($58,s),y
$19:8cbe  c4 58		 cpy $58
$19:8cc0  cb			wai
$19:8cc1  11 7d		 ora ($7d),y
$19:8cc3  f4 a5 ea	  pea $eaa5
$19:8cc6  50 e9		 bvc $8cb1
$19:8cc8  61 12		 adc ($12,x)
$19:8cca  63 16		 adc $16,s
$19:8ccc  89 74 2c	  bit #$2c74
$19:8ccf  63 80		 adc $80,s
$19:8cd1  60			rts
$19:8cd2  9c 8b f9	  stz $f98b
$19:8cd5  ff f4 d6 46   sbc $46d6f4,x
$19:8cd9  41 00		 eor ($00,x)
$19:8cdb  08			php
$19:8cdc  15 c8		 ora $c8,x
$19:8cde  a2 00 10	  ldx #$1000
$19:8ce1  2f 90 fc 01   and $01fc90
$19:8ce5  24 7b		 bit $7b
$19:8ce7  20 4a 41	  jsr $414a
$19:8cea  c4 0a		 cpy $0a
$19:8cec  0f 23 4a 00   ora $004a23
$19:8cf0  42 24		 wdm #$24
$19:8cf2  c6 30		 dec $30
$19:8cf4  08			php
$19:8cf5  19 d3 f4	  ora $f4d3,y
$19:8cf8  30 5f		 bmi $8d59
$19:8cfa  e8			inx
$19:8cfb  00 52		 brk #$52
$19:8cfd  60			rts
$19:8cfe  b7 00		 lda [$00],y
$19:8d00  79 15 48	  adc $4815,y
$19:8d03  2e 8b 70	  rol $708b
$19:8d06  0f a3 84 20   ora $2084a3
$19:8d0a  c1 85		 cmp ($85,x)
$19:8d0c  17 f9		 ora [$f9],y
$19:8d0e  00 d6		 brk #$d6
$19:8d10  e0 05 2d	  cpx #$2d05
$19:8d13  bd 29 6e	  lda $6e29,x
$19:8d16  00 d2		 brk #$d2
$19:8d18  4a			lsr a
$19:8d19  a3 94		 lda $94,s
$19:8d1b  12 a8		 ora ($a8)
$19:8d1d  e1 04		 sbc ($04,x)
$19:8d1f  aa			tax
$19:8d20  19 c1 2a	  ora $2ac1,y
$19:8d23  81 70		 sta ($70,x)
$19:8d25  4a			lsr a
$19:8d26  a0 4c 12	  ldy #$124c
$19:8d29  a0 69 07	  ldy #$0769
$19:8d2c  28			plp
$19:8d2d  1c 41 2a	  trb $2a41
$19:8d30  07 54		 ora [$54]
$19:8d32  66 a2		 ror $a2
$19:8d34  ec 87 68	  cpx $6887
$19:8d37  95 02		 sta $02,x
$19:8d39  1a			inc a
$19:8d3a  1b			tcs
$19:8d3b  c3 bf		 cmp $bf,s
$19:8d3d  47 74		 eor [$74]
$19:8d3f  a4 a5		 ldy $a5
$19:8d41  e0 b6 5a	  cpx #$5ab6
$19:8d44  33 9d		 and ($9d,s),y
$19:8d46  9e ec ef	  stz $efec,x
$19:8d49  07 38		 ora [$38]
$19:8d4b  1a			inc a
$19:8d4c  40			rti
$19:8d4d  de 06 70	  dec $7006,x
$19:8d50  ce 52 02	  dec $0252
$19:8d53  a4 db		 ldy $db
$19:8d55  00 d8		 brk #$d8
$19:8d57  43 47		 eor $47,s
$19:8d59  a2 c3 00	  ldx #$00c3
$19:8d5c  dc 05 58	  jml [$5805]
$19:8d5f  26 5f		 rol $5f
$19:8d61  a5 50		 lda $50
$19:8d63  86 c9		 stx $c9
$19:8d65  26 0e		 rol $0e
$19:8d67  70 0d		 bvs $8d76
$19:8d69  91 e4		 sta ($e4),y
$19:8d6b  09 68 a1	  ora #$a168
$19:8d6e  20 da 12	  jsr $12da
$19:8d71  d1 1e		 cmp ($1e),y
$19:8d73  0d 30 0d	  ora $0d30
$19:8d76  93 5c		 sta ($5c,s),y
$19:8d78  0d 65 09	  ora $0965
$19:8d7b  80 31		 bra $8dae
$19:8d7d  c3 fa		 cmp $fa,s
$19:8d7f  6c 95 f8	  jmp ($f895)
$19:8d82  1a			inc a
$19:8d83  51 7e		 eor ($7e),y
$19:8d85  06 16		 asl $16
$19:8d87  30 a3		 bmi $8d2c
$19:8d89  9c 1c 07	  stz $071c
$19:8d8c  00 a9		 brk #$a9
$19:8d8e  52 53		 eor ($53)
$19:8d90  ed d6 a5	  sbc $a5d6
$19:8d93  b9 c0 52	  lda $52c0,y
$19:8d96  0e 13 a1	  asl $a113
$19:8d99  a7 da		 lda [$da]
$19:8d9b  d1 40		 cmp ($40),y
$19:8d9d  55 c4		 eor $c4,x
$19:8d9f  1d 80 ad	  ora $ad80,x
$19:8da2  14 8b		 trb $8b
$19:8da4  d0 59		 bne $8dff
$19:8da6  ed a3 a0	  sbc $a0a3
$19:8da9  b4 52		 ldy $52,x
$19:8dab  a5 42		 lda $42
$19:8dad  67 a1		 adc [$a1]
$19:8daf  a4 1a		 ldy $1a
$19:8db1  e8			inx
$19:8db2  69 06 fa	  adc #$fa06
$19:8db5  2f 49 d2 4b   and $4bd249
$19:8db9  d2 78		 cmp ($78)
$19:8dbb  b0 bc		 bcs $8d79
$19:8dbd  2a			rol a
$19:8dbe  74 05		 stz $05,x
$19:8dc0  e9 44 20	  sbc #$2044
$19:8dc3  10 f0		 bpl $8db5
$19:8dc5  00 89		 brk #$89
$19:8dc7  40			rti
$19:8dc8  4a			lsr a
$19:8dc9  08			php
$19:8dca  72 5b		 adc ($5b)
$19:8dcc  8c 81 6e	  sty $6e81
$19:8dcf  22 50 89 1c   jsl $1c8950
$19:8dd3  84 57		 sty $57
$19:8dd5  32 21		 and ($21)
$19:8dd7  b9 89 40	  lda $4089,y
$19:8dda  9a			txs
$19:8ddb  82 f5 92	  brl $20d3
$19:8dde  0d ce 19	  ora $19ce
$19:8de1  00 fe		 brk #$fe
$19:8de3  0f cd 02 0f   ora $0f02cd
$19:8de7  f0 84		 beq $8d6d
$19:8de9  3f c0 dc 27   and $27dcc0,x
$19:8ded  21 80		 and ($80,x)
$19:8def  25 c8		 and $c8
$19:8df1  4a			lsr a
$19:8df2  10 b8		 bpl $8dac
$19:8df4  07 f4		 ora [$f4]
$19:8df6  d3 43		 cmp ($43,s),y
$19:8df8  c0 3b 9c	  cpy #$9c3b
$19:8dfb  4c fb e7	  jmp $e7fb
$19:8dfe  22 c0 1d d1   jsl $d11dc0
$19:8e02  5c 06 3f 1d   jml $1d3f06
$19:8e06  82 b9 22	  brl $b0c2
$19:8e09  78			sei
$19:8e0a  03 40		 ora $40,s
$19:8e0c  19 80 a2	  ora $a280,y
$19:8e0f  c6 e2		 dec $e2
$19:8e11  3b			tsc
$19:8e12  21 c0		 and ($c0,x)
$19:8e14  84 a0		 sty $a0
$19:8e16  d2 f3		 cmp ($f3)
$19:8e18  88			dey
$19:8e19  d0 1c		 bne $8e37
$19:8e1b  e9 40 77	  sbc #$7740
$19:8e1e  79 c4 0b	  adc $0bc4,y
$19:8e21  66 72		 ror $72
$19:8e23  08			php
$19:8e24  8b			phb
$19:8e25  b7 c3		 lda [$c3],y
$19:8e27  44 02 48	  mvp $48,$02
$19:8e2a  88			dey
$19:8e2b  08			php
$19:8e2c  57 c4		 eor [$c4],y
$19:8e2e  10 40		 bpl $8e70
$19:8e30  e8			inx
$19:8e31  07 4e		 ora [$4e]
$19:8e33  08			php
$19:8e34  7b			tdc
$19:8e35  18			clc
$19:8e36  ac 02 44	  ldy $4402
$19:8e39  6d 15 c0	  adc $c015
$19:8e3c  48			pha
$19:8e3d  20 10 a2	  jsr $a210
$19:8e40  68			pla
$19:8e41  c2 22		 rep #$22
$19:8e43  10 49		 bpl $8e8e
$19:8e45  3d 12 02	  and $0212,x
$19:8e48  ea			nop
$19:8e49  18			clc
$19:8e4a  24 9a		 bit $9a
$19:8e4c  88			dey
$19:8e4d  b7 18		 lda [$18],y
$19:8e4f  44 52 2c	  mvp $2c,$52
$19:8e52  72 08		 adc ($08)
$19:8e54  41 ec		 eor ($ec,x)
$19:8e56  22 91 73 c9   jsl $c97391
$19:8e5a  40			rti
$19:8e5b  23 90		 and $90,s
$19:8e5d  73 90		 adc ($90,s),y
$19:8e5f  41 61		 eor ($61,x)
$19:8e61  67 60		 adc [$60]
$19:8e63  8c 21 c9	  sty $c921
$19:8e66  08			php
$19:8e67  10 83		 bpl $8dec
$19:8e69  91 47		 sta ($47),y
$19:8e6b  20 14 63	  jsr $6314
$19:8e6e  c9 26 42	  cmp #$4226
$19:8e71  8e 72 05	  stx $0572
$19:8e74  b8			clv
$19:8e75  26 42		 rol $42
$19:8e77  91 44		 sta ($44),y
$19:8e79  2a			rol a
$19:8e7a  84 50		 sty $50
$19:8e7c  b4 e9		 ldy $e9,x
$19:8e7e  10 32		 bpl $8eb2
$19:8e80  9c 9a 08	  stz $089a
$19:8e83  6c 39 39	  jmp ($3939)
$19:8e86  54 14 a5	  mvn $a5,$14
$19:8e89  46 2a		 lsr $2a
$19:8e8b  82 78 ca	  brl $5906
$19:8e8e  a0 97 2a	  ldy #$2a97
$19:8e91  41 54		 eor ($54,x)
$19:8e93  21 70		 and ($70,x)
$19:8e95  54 58 b6	  mvn $b6,$58
$19:8e98  c9 24 2c	  cmp #$2c24
$19:8e9b  d2 42		 cmp ($42)
$19:8e9d  0b			phd
$19:8e9e  34 8f		 bit $8f,x
$19:8ea0  a2 c6 23	  ldx #$23c6
$19:8ea3  b0 95		 bcs $8e3a
$19:8ea5  42 0c		 wdm #$0c
$19:8ea7  63 08		 adc $08,s
$19:8ea9  e4 19		 cpx $19
$19:8eab  8c 2a d0	  sty $d02a
$19:8eae  8f 40 3f ff   sta $ff3f40
$19:8eb2  f2 f9		 sbc ($f9)
$19:8eb4  41 cc		 eor ($cc,x)
$19:8eb6  83 04		 sta $04,s
$19:8eb8  84 41		 sty $41
$19:8eba  63 47		 adc $47,s
$19:8ebc  20 0b 01	  jsr $010b
$19:8ebf  60			rts
$19:8ec0  10 c3		 bpl $8e85
$19:8ec2  00 86		 brk #$86
$19:8ec4  45 20		 eor $20
$19:8ec6  33 b0		 and ($b0,s),y
$19:8ec8  d1 16		 cmp ($16),y
$19:8eca  42 74		 wdm #$74
$19:8ecc  72 08		 adc ($08)
$19:8ece  61 60		 adc ($60,x)
$19:8ed0  67 22		 adc [$22]
$19:8ed2  f2 88		 sbc ($88)
$19:8ed4  41 65		 eor ($65,x)
$19:8ed6  27 91		 and [$91]
$19:8ed8  0b			phd
$19:8ed9  04 36		 tsb $36
$19:8edb  32 aa		 and ($aa)
$19:8edd  13 a0		 ora ($a0,s),y
$19:8edf  02 9a		 cop #$9a
$19:8ee1  12 a4		 ora ($a4)
$19:8ee3  08			php
$19:8ee4  5a			phy
$19:8ee5  e4 22		 cpx $22
$19:8ee7  ae 82 02	  ldx $0282
$19:8eea  80 7c		 bra $8f68
$19:8eec  17 e0		 ora [$e0],y
$19:8eee  cd 10 c0	  cmp $c010
$19:8ef1  01 40		 ora ($40,x)
$19:8ef3  62 02 51	  per $dff8
$19:8ef6  2c 90 b0	  bit $b090
$19:8ef9  40			rti
$19:8efa  a3 0c		 lda $0c,s
$19:8efc  19 89 d4	  ora $d489,y
$19:8eff  87 42		 sta [$42]
$19:8f01  05 00		 ora $00
$19:8f03  b0 10		 bcs $8f15
$19:8f05  44 0a 10	  mvp $10,$0a
$19:8f08  77 28		 adc [$28],y
$19:8f0a  45 61		 eor $61
$19:8f0c  30 40		 bmi $8f4e
$19:8f0e  28			plp
$19:8f0f  2d 42 26	  and $2642
$19:8f12  ff 02 70 93   sbc $937002,x
$19:8f16  40			rti
$19:8f17  02 06		 cop #$06
$19:8f19  10 7d		 bpl $8f98
$19:8f1b  04 06		 tsb $06
$19:8f1d  85 c4		 sta $c4
$19:8f1f  50 09		 bvc $8f2a
$19:8f21  40			rti
$19:8f22  2a			rol a
$19:8f23  5c 46 38 47   jml $473846
$19:8f27  22 30 0a 22   jsl $220a30
$19:8f2b  b4 a1		 ldy $a1,x
$19:8f2d  10 9a		 bpl $8ec9
$19:8f2f  a2 b4 a0	  ldx #$a0b4
$19:8f32  11 1b		 ora ($1b),y
$19:8f34  22 98 21 8f   jsl $8f2198
$19:8f38  20 80 d0	  jsr $d080
$19:8f3b  55 a1		 eor $a1,x
$19:8f3d  14 0b		 trb $0b
$19:8f3f  84 32		 sty $32
$19:8f41  c2 ad		 rep #$ad
$19:8f43  05 f0		 ora $f0
$19:8f45  33 42		 and ($42,s),y
$19:8f47  c0 d0 25	  cpy #$25d0
$19:8f4a  c0 54 1a	  cpy #$1a54
$19:8f4d  05 0a		 ora $0a
$19:8f4f  83 d0		 sta $d0,s
$19:8f51  38			sec
$19:8f52  89 22 04	  bit #$0422
$19:8f55  02 48		 cop #$48
$19:8f57  89 a1 0b	  bit #$0ba1
$19:8f5a  5e 13 14	  lsr $1413,x
$19:8f5d  2a			rol a
$19:8f5e  02 f0		 cop #$f0
$19:8f60  70 0c		 bvs $8f6e
$19:8f62  1a			inc a
$19:8f63  e0 fa 21	  cpx #$21fa
$19:8f66  c8			iny
$19:8f67  5c 18 44 63   jml $634418
$19:8f6b  0a			asl a
$19:8f6c  0d 11 4e	  ora $4e11
$19:8f6f  50 8a		 bvc $8efb
$19:8f71  10 3c		 bpl $8faf
$19:8f73  81 61		 sta ($61,x)
$19:8f75  52 17		 eor ($17)
$19:8f77  83 2c		 sta $2c,s
$19:8f79  21 70		 and ($70,x)
$19:8f7b  5b			tcd
$19:8f7c  0b			phd
$19:8f7d  e8			inx
$19:8f7e  84 21		 sty $21
$19:8f80  60			rts
$19:8f81  1e 82 f4	  asl $f482,x
$19:8f84  62 14 41	  per $d09b
$19:8f87  59 31 42	  eor $4231,y
$19:8f8a  a8			tay
$19:8f8b  2b			pld
$19:8f8c  27 80		 and [$80]
$19:8f8e  59 28 9f	  eor $9f28,y
$19:8f91  ff fc 79 d2   sbc $d279fc,x
$19:8f95  e0 b0 80	  cpx #$80b0
$19:8f98  c1 4e		 cmp ($4e,x)
$19:8f9a  01 04		 ora ($04,x)
$19:8f9c  b8			clv
$19:8f9d  ab			plb
$19:8f9e  42 0b		 wdm #$0b
$19:8fa0  10 82		 bpl $8f24
$19:8fa2  43 32		 eor $32,s
$19:8fa4  4a			lsr a
$19:8fa5  d0 86		 bne $8f2d
$19:8fa7  9c 02 19	  stz $1902
$19:8faa  91 56		 sta ($56),y
$19:8fac  8c 55 e0	  sty $e055
$19:8faf  17 33		 ora [$33],y
$19:8fb1  19 31 43	  ora $4331,y
$19:8fb4  06 63		 asl $63
$19:8fb6  22 c8 64 d5   jsl $d564c8
$19:8fba  a1 15		 lda ($15,x)
$19:8fbc  02 19		 cop #$19
$19:8fbe  e4 5e		 cpx $5e
$19:8fc0  e3 c4		 sbc $c4,s
$19:8fc2  20 d4 24	  jsr $24d4
$19:8fc5  c8			iny
$19:8fc6  2f 64 3d 03   and $033d64
$19:8fca  c0 00 02	  cpy #$0200
$19:8fcd  7a			ply
$19:8fce  42 7a		 wdm #$7a
$19:8fd0  0a			asl a
$19:8fd1  c5 3a		 cmp $3a
$19:8fd3  37 35		 and [$35],y
$19:8fd5  81 1b		 sta ($1b,x)
$19:8fd7  85 60		 sta $60
$19:8fd9  50 c8		 bvc $8fa3
$19:8fdb  26 4c		 rol $4c
$19:8fdd  56 05		 lsr $05,x
$19:8fdf  70 61		 bvs $9042
$19:8fe1  06 48		 asl $48
$19:8fe3  56 05		 lsr $05,x
$19:8fe5  e0 61 06	  cpx #$0661
$19:8fe8  44 56 2f	  mvp $2f,$56
$19:8feb  00 8c		 brk #$8c
$19:8fed  0e 81 de	  asl $de81
$19:8ff0  2f 00 83 36   and $368300
$19:8ff4  44 16 11	  mvp $11,$16
$19:8ff7  0d d4 08	  ora $08d4
$19:8ffa  98			tya
$19:8ffb  29 00 cb	  and #$cb00
$19:8ffe  3a			dec a
$19:8fff  08			php
$19:9000  dc 1a 67	  jml [$671a]
$19:9003  41 24		 eor ($24,x)
$19:9005  43 2a		 eor $2a,s
$19:9007  e8			inx
$19:9008  00 98		 brk #$98
$19:900a  24 43		 bit $43
$19:900c  fc fd 23	  jsr ($23fd,x)
$19:900f  70 77		 bvs $9088
$19:9011  1f a2 d6 f8   ora $f8d6a2,x
$19:9015  53 a1		 eor ($a1,s),y
$19:9017  21 60		 and ($60,x)
$19:9019  44 a4 bf	  mvp $bf,$a4
$19:901c  53 c8		 eor ($c8,s),y
$19:901e  f6 4b		 inc $4b,x
$19:9020  db			stp
$19:9021  bd 23 80	  lda $8023,x
$19:9024  bb			tyx
$19:9025  81 c0		 sta ($c0,x)
$19:9027  20 2e 12	  jsr $122e
$19:902a  c4 bd		 cpy $bd
$19:902c  93 36		 sta ($36,s),y
$19:902e  fd 4c 5c	  sbc $5c4c,x
$19:9031  09 0e 11	  ora #$110e
$19:9034  16 68		 asl $68,x
$19:9036  13 c5		 ora ($c5,s),y
$19:9038  b8			clv
$19:9039  48			pha
$19:903a  d0 71		 bne $90ad
$19:903c  14 22		 trb $22
$19:903e  5e 04 38	  lsr $3804,x
$19:9041  04 bf		 tsb $bf
$19:9043  04 55		 tsb $55
$19:9045  04 18		 tsb $18
$19:9047  cb			wai
$19:9048  f8			sed
$19:9049  48			pha
$19:904a  31 3c		 and ($3c),y
$19:904c  0d 0b f9	  ora $f90b
$19:904f  ff 86 40 20   sbc $204086,x
$19:9053  e5 11		 sbc $11
$19:9055  6e 11 48	  ror $4811
$19:9058  9b			txy
$19:9059  23 0f		 and $0f,s
$19:905b  05 db		 ora $db
$19:905d  a0 0a 47	  ldy #$470a
$19:9060  d0 81		 bne $8fe3
$19:9062  14 85		 trb $85
$19:9064  08			php
$19:9065  1e 00 59	  asl $5900,x
$19:9068  c8			iny
$19:9069  09 35 08	  ora #$0835
$19:906c  84 68		 sty $68
$19:906e  17 44		 ora [$44],y
$19:9070  39 0d 82	  and $820d,y
$19:9073  c8			iny
$19:9074  20 70 50	  jsr $5070
$19:9077  78			sei
$19:9078  43 20		 eor $20,s
$19:907a  49 12 87	  eor #$8712
$19:907d  2c 45 5c	  bit $5c45
$19:9080  87 43		 sta [$43]
$19:9082  a7 bc		 lda [$bc]
$19:9084  52 7f		 eor ($7f)
$19:9086  02 ff		 cop #$ff
$19:9088  7f e1 46 a7   adc $a746e1,x
$19:908c  78			sei
$19:908d  ad 39 e2	  lda $e239
$19:9090  94 d7		 sty $d7,x
$19:9092  21 c5		 and ($c5,x)
$19:9094  4d 8a 50	  eor $508a
$19:9097  06 39		 asl $39
$19:9099  d2 9e		 cmp ($9e)
$19:909b  24 d3		 bit $d3
$19:909d  0a			asl a
$19:909e  5b			tcd
$19:909f  c4 e2		 cpy $e2
$19:90a1  14 c5		 trb $c5
$19:90a3  29 b1 01	  and #$01b1
$19:90a6  58			cli
$19:90a7  87 31		 sta [$31]
$19:90a9  45 94		 eor $94
$19:90ab  7c f6 45	  jmp ($45f6,x)
$19:90ae  11 a1		 ora ($a1),y
$19:90b0  1f 0e 3e 89   ora $893e0e,x
$19:90b4  22 f8 e0 bf   jsl $bfe0f8
$19:90b8  ff f8 7a 8c   sbc $8c7af8,x
$19:90bc  20 06 a0	  jsr $a006
$19:90bf  24 2c		 bit $2c
$19:90c1  02 0c		 cop #$0c
$19:90c3  79 02 d0	  adc $d002,y
$19:90c6  9e 80 f6	  stz $f680,x
$19:90c9  2b			pld
$19:90ca  20 3d 09	  jsr $093d
$19:90cd  9c 4f 02	  stz $024f
$19:90d0  89 1e 11	  bit #$111e
$19:90d3  a8			tay
$19:90d4  18			clc
$19:90d5  c1 40		 cmp ($40,x)
$19:90d7  80 7c		 bra $9155
$19:90d9  3f e6 42 3d   and $3d42e6,x
$19:90dd  03 5c		 ora $5c,s
$19:90df  0d 81 20	  ora $2081
$19:90e2  d1 41		 cmp ($41),y
$19:90e4  20 26 c0	  jsr $c026
$19:90e7  52 8d		 eor ($8d)
$19:90e9  11 44		 ora ($44),y
$19:90eb  31 08		 and ($08),y
$19:90ed  87 09		 sta [$09]
$19:90ef  50 4b		 bvc $913c
$19:90f1  31 57		 and ($57),y
$19:90f3  92 58		 sta ($58)
$19:90f5  3c 4a 82	  bit $824a,x
$19:90f8  60			rts
$19:90f9  8d 10 8c	  sta $8c10
$19:90fc  11 f8		 ora ($f8),y
$19:90fe  04 e2		 tsb $e2
$19:9100  01 e8		 ora ($e8,x)
$19:9102  4d 99 30	  eor $3099
$19:9105  14 45		 trb $45
$19:9107  10 aa		 bpl $90b3
$19:9109  aa			tax
$19:910a  0d bc 0a	  ora $0abc
$19:910d  f3 80		 sbc ($80,s),y
$19:910f  55 d6		 eor $d6,x
$19:9111  c6 ec		 dec $ec
$19:9113  0a			asl a
$19:9114  21 a8		 and ($a8,x)
$19:9116  22 22 07 1f   jsl $1f0722
$19:911a  82 88 0a	  brl $9ba5
$19:911d  c3 87		 cmp $87,s
$19:911f  81 01		 sta ($01,x)
$19:9121  04 b0		 tsb $b0
$19:9123  17 78		 ora [$78],y
$19:9125  13 db		 ora ($db,s),y
$19:9127  cb			wai
$19:9128  01 a7		 ora ($a7,x)
$19:912a  05 10		 ora $10
$19:912c  1c 36 e1	  trb $e136
$19:912f  1f 06 8f 5c   ora $5c8f06,x
$19:9133  4c 9e 78	  jmp $789e
$19:9136  11 e8		 ora ($e8),y
$19:9138  24 f0		 bit $f0
$19:913a  0a			asl a
$19:913b  84 03		 sty $03
$19:913d  ee 9b 39	  inc $399b
$19:9140  22 84 21 11   jsl $112184
$19:9144  59 3c 43	  eor $433c,y
$19:9147  8a			txa
$19:9148  c4 08		 cpy $08
$19:914a  ac 20 b6	  ldy $b620
$19:914d  2b			pld
$19:914e  d0 2c		 bne $917c
$19:9150  84 de		 sty $de
$19:9152  01 e5		 ora ($e5,x)
$19:9154  2f 11 a4 59   and $59a411
$19:9158  63 25		 adc $25,s
$19:915a  83 ce		 sta $ce,s
$19:915c  30 8d		 bmi $90eb
$19:915e  80 92		 bra $90f2
$19:9160  c0 0e e2	  cpy #$e20e
$19:9163  73 28		 adc ($28,s),y
$19:9165  7c c3 28	  jmp ($28c3,x)
$19:9168  7a			ply
$19:9169  24 28		 bit $28
$19:916b  9c ca 2f	  stz $2fca
$19:916e  28			plp
$19:916f  d2 1e		 cmp ($1e)
$19:9171  89 26 27	  bit #$2726
$19:9174  32 8f		 and ($8f)
$19:9176  c8			iny
$19:9177  36 87		 rol $87,x
$19:9179  a2 50 89	  ldx #$8950
$19:917c  cc a4 f1	  cpy $f1a4
$19:917f  8e 21 e8	  stx $e821
$19:9182  95 e2		 sta $e2,x
$19:9184  e7 18		 sbc [$18]
$19:9186  e9 6c 16	  sbc #$166c
$19:9189  23 0e		 and $0e,s
$19:918b  8b			phb
$19:918c  c0 27 f7	  cpy #$f727
$19:918f  66 c0		 ror $c0
$19:9191  45 1f		 eor $1f
$19:9193  00 c5		 brk #$c5
$19:9195  03 98		 ora $98,s
$19:9197  41 a3		 eor ($a3,x)
$19:9199  ec 40 ba	  cpx $ba40
$19:919c  83 42		 sta $42,s
$19:919e  39 09 69	  and $6909,y
$19:91a1  0d 00 fa	  ora $fa00
$19:91a4  11 e3		 ora ($e3),y
$19:91a6  78			sei
$19:91a7  61 56		 adc ($56,x)
$19:91a9  41 1d		 eor ($1d,x)
$19:91ab  84 38		 sty $38
$19:91ad  05 9c		 ora $9c
$19:91af  10 f8		 bpl $91a9
$19:91b1  b1 bc		 lda ($bc),y
$19:91b3  30 cb		 bmi $9180
$19:91b5  20 8a c4	  jsr $c48a
$19:91b8  1d c2 ce	  ora $cec2,x
$19:91bb  06 10		 asl $10
$19:91bd  44 25 fb	  mvp $fb,$25
$19:91c0  35 90		 and $90,x
$19:91c2  45 a1		 eor $a1
$19:91c4  ef c3 84 47   sbc $4784c3
$19:91c8  54 21 b5	  mvn $b5,$21
$19:91cb  71 90		 adc ($90),y
$19:91cd  28			plp
$19:91ce  59 c1 10	  eor $10c1,y
$19:91d1  8a			txa
$19:91d2  a8			tay
$19:91d3  43 6c		 eor $6c,s
$19:91d5  f1 20		 sbc ($20),y
$19:91d7  c0 b3 80	  cpy #$80b3
$19:91da  10 09		 bpl $91e5
$19:91dc  30 d2		 bmi $91b0
$19:91de  b8			clv
$19:91df  c8			iny
$19:91e0  4c 2f 82	  jmp $822f
$19:91e3  8c 49 df	  sty $df49
$19:91e6  c6 34		 dec $34
$19:91e8  38			sec
$19:91e9  f4 1d f8	  pea $f81d
$19:91ec  6d 00 7e	  adc $7e00
$19:91ef  19 f0 25	  ora $25f0,y
$19:91f2  f1 0e		 sbc ($0e),y
$19:91f4  a5 12		 lda $12
$19:91f6  1d 00 97	  ora $9700,x
$19:91f9  40			rti
$19:91fa  2b			pld
$19:91fb  0a			asl a
$19:91fc  c0 80 48	  cpy #$4880
$19:91ff  20 15 08	  jsr $0815
$19:9202  04 6a		 tsb $6a
$19:9204  01 01		 ora ($01,x)
$19:9206  8f 43 a8 10   sta $10a843
$19:920a  8e f2 e4	  stx $e4f2
$19:920d  25 81		 and $81
$19:920f  50 9c		 bvc $91ad
$19:9211  5f 0d 05 20   eor $20050d,x
$19:9215  94 67		 sty $67,x
$19:9217  17 23		 ora [$23],y
$19:9219  2c 39 8c	  bit $8c39
$19:921c  10 ee		 bpl $920c
$19:921e  26 c1		 rol $c1
$19:9220  59 04 5e	  eor $5e04,y
$19:9223  3a			dec a
$19:9224  5e 0f f8	  lsr $f80f,x
$19:9227  f8			sed
$19:9228  62 c8 81	  per $13f3
$19:922b  3b			tsc
$19:922c  14 02		 trb $02
$19:922e  91 5c		 sta ($5c),y
$19:9230  3e 81 a8	  rol $a881,x
$19:9233  12 c2		 ora ($c2)
$19:9235  b9 08 7c	  lda $7c08,y
$19:9238  74 e6		 stz $e6,x
$19:923a  19 e3 e8	  ora $e8e3,y
$19:923d  18			clc
$19:923e  c1 48		 cmp ($48,x)
$19:9240  26 80		 rol $80
$19:9242  87 47		 sta [$47]
$19:9244  8d 81 6e	  sta $6e81
$19:9247  53 92		 eor ($92,s),y
$19:9249  c8			iny
$19:924a  d4 40		 pei ($40)
$19:924c  96 0a		 stx $0a,y
$19:924e  f2 64		 sbc ($64)
$19:9250  23 b0		 and $b0,s
$19:9252  f6 00		 inc $00,x
$19:9254  a8			tay
$19:9255  08			php
$19:9256  ca			dex
$19:9257  29 90 92	  and #$9290
$19:925a  42 0c		 wdm #$0c
$19:925c  a1 dd		 lda ($dd,x)
$19:925e  34 04		 bit $04,x
$19:9260  22 48 d5 14   jsl $14d548
$19:9264  21 4c		 and ($4c,x)
$19:9266  24 12		 bit $12
$19:9268  e4 59		 cpx $59
$19:926a  38			sec
$19:926b  c4 28		 cpy $28
$19:926d  08			php
$19:926e  60			rts
$19:926f  9c 46 39	  stz $3946
$19:9272  e8			inx
$19:9273  b2 78		 lda ($78)
$19:9275  89 a0 20	  bit #$20a0
$19:9278  f2 59		 sbc ($59)
$19:927a  84 62		 sty $62
$19:927c  1a			inc a
$19:927d  99 09 34	  sta $3409,y
$19:9280  19 fe 27	  ora $27fe,y
$19:9283  62 7f 86	  per $1905
$19:9286  f1 32		 sbc ($32),y
$19:9288  40			rti
$19:9289  d1 29		 cmp ($29),y
$19:928b  dc 60 c3	  jml [$c360]
$19:928e  e7 2f		 sbc [$2f]
$19:9290  41 fa		 eor ($fa,x)
$19:9292  53 d4		 eor ($d4,s),y
$19:9294  be b6 f6	  ldx $f6b6,y
$19:9297  3f b6 19 f8   and $f819b6,x
$19:929b  7c a0 12	  jmp ($12a0,x)
$19:929e  72 8c		 adc ($8c)
$19:92a0  84 ff		 sty $ff
$19:92a2  0d f1 ac	  ora $acf1
$19:92a5  96 a2		 stx $a2,y
$19:92a7  09 f0 d4	  ora #$d4f0
$19:92aa  46 44		 lsr $44
$19:92ac  be 36 f2	  ldx $f236,y
$19:92af  3f 96 3c d3   and $d33c96,x
$19:92b3  e7 af		 sbc [$af]
$19:92b5  45 fa		 eor $fa
$19:92b7  71 a0		 adc ($a0),y
$19:92b9  10 f5		 bpl $92b0
$19:92bb  30 48		 bmi $9305
$19:92bd  35 23		 and $23,x
$19:92bf  62 5a 94	  per $271c
$19:92c2  02 4c		 cop #$4c
$19:92c4  bb			tyx
$19:92c5  02 f0		 cop #$f0
$19:92c7  3a			dec a
$19:92c8  41 74		 eor ($74,x)
$19:92ca  b2 58		 lda ($58)
$19:92cc  3a			dec a
$19:92cd  b8			clv
$19:92ce  37 ae		 and [$ae],y
$19:92d0  92 65		 sta ($65)
$19:92d2  13 01		 ora ($01,s),y
$19:92d4  59 d5 18	  eor $18d5,y
$19:92d7  6d fb b3	  adc $b3fb
$19:92da  df be 0e f0   cmp $f00ebe,x
$19:92de  ff 8c 3c 83   sbc $833c8c,x
$19:92e2  e5 26		 sbc $26
$19:92e4  30 a9		 bmi $928f
$19:92e6  bd 8a 80	  lda $808a,x
$19:92e9  79 16 80	  adc $8016,y
$19:92ec  1d d5 0a	  ora $0ad5,x
$19:92ef  87 d5		 sta [$d5]
$19:92f1  81 c0		 sta ($c0,x)
$19:92f3  24 86		 bit $86
$19:92f5  80 80		 bra $9277
$19:92f7  42 12		 wdm #$12
$19:92f9  42 93		 wdm #$93
$19:92fb  08			php
$19:92fc  62 60 20	  per $b35f
$19:92ff  91 38		 sta ($38),y
$19:9301  f4 03 d4	  pea $d403
$19:9304  d0 08		 bne $930e
$19:9306  9c 10 a4	  stz $a410
$19:9309  34 44		 bit $44,x
$19:930b  80 47		 bra $9354
$19:930d  e2 d1		 sep #$d1
$19:930f  0e cb 08	  asl $08cb
$19:9312  23 f0		 and $f0,s
$19:9314  03 00		 ora $00,s
$19:9316  97 0a		 sta [$0a],y
$19:9318  3b			tsc
$19:9319  09 f4 98	  ora #$98f4
$19:931c  ca			dex
$19:931d  3d 08 f4	  and $f408,x
$19:9320  97 0a		 sta [$0a],y
$19:9322  1d 18 e4	  ora $e418,x
$19:9325  98			tya
$19:9326  c8			iny
$19:9327  f8			sed
$19:9328  25 c2		 and $c2
$19:932a  83 48		 sta $48,s
$19:932c  37 26		 and [$26],y
$19:932e  32 45		 and ($45)
$19:9330  09 70 88	  ora #$8870
$19:9333  80 8c		 bra $92c1
$19:9335  34 c0		 bit $c0,x
$19:9337  d1 3f		 cmp ($3f),y
$19:9339  df f2 68 10   cmp $1068f2,x
$19:933d  c1 a6		 cmp ($a6,x)
$19:933f  11 05		 ora ($05),y
$19:9341  50 c1		 bvc $9304
$19:9343  9a			txs
$19:9344  61 02		 adc ($02,x)
$19:9346  80 47		 bra $938f
$19:9348  20 16 a5	  jsr $a516
$19:934b  90 2c		 bcc $9379
$19:934d  82 29 08	  brl $9b79
$19:9350  ad 2c 81	  lda $812c
$19:9353  62 11 78	  per $0b67
$19:9356  2a			rol a
$19:9357  d8			cld
$19:9358  56 21		 lsr $21,x
$19:935a  0f 86 af 45   ora $45af86
$19:935e  64 10		 stz $10
$19:9360  88			dey
$19:9361  a5 a5		 lda $a5
$19:9363  6e 4b 30	  ror $304b
$19:9366  ac c0 94	  ldy $94c0
$19:9369  65 28		 adc $28
$19:936b  54 51 24	  mvn $24,$51
$19:936e  16 c7		 asl $c7,x
$19:9370  18			clc
$19:9371  5e 24 66	  lsr $6624,x
$19:9374  0e c4 38	  asl $38c4
$19:9377  8c 3d 96	  sty $963d
$19:937a  91 86		 sta ($86),y
$19:937c  92 48		 sta ($48)
$19:937e  1b			tcs
$19:937f  29 29 54	  and #$5429
$19:9382  2c 15 60	  bit $6015
$19:9385  52 15		 eor ($15)
$19:9387  aa			tax
$19:9388  46 57		 lsr $57
$19:938a  84 be		 sty $be
$19:938c  19 0d 6d	  ora $6d0d,y
$19:938f  7c 70 a6	  jmp ($a670,x)
$19:9392  90 b1		 bcc $9345
$19:9394  c6 24		 dec $24
$19:9396  d9 49 64	  cmp $6449,y
$19:9399  02 02		 cop #$02
$19:939b  aa			tax
$19:939c  33 88		 and ($88,s),y
$19:939e  35 0a		 and $0a,x
$19:93a0  4a			lsr a
$19:93a1  34 15		 bit $15,x
$19:93a3  90 49		 bcc $93ee
$19:93a5  60			rts
$19:93a6  0d 23 8e	  ora $8e23
$19:93a9  c2 1b		 rep #$1b
$19:93ab  20 fe 28	  jsr $28fe
$19:93ae  a0 d0 14	  ldy #$14d0
$19:93b1  64 8f		 stz $8f
$19:93b3  02 52		 cop #$52
$19:93b5  40			rti
$19:93b6  d6 05		 dec $05,x
$19:93b8  18			clc
$19:93b9  2e a4 40	  rol $40a4
$19:93bc  c8			iny
$19:93bd  8f 20 1a 14   sta $141a20
$19:93c1  21 24		 and ($24,x)
$19:93c3  29 14 25	  and #$2514
$19:93c6  02 78		 cop #$78
$19:93c8  e8			inx
$19:93c9  a1 83		 lda ($83,x)
$19:93cb  87 40		 sta [$40]
$19:93cd  3f 5f f0 d9   and $d9f05f,x
$19:93d1  24 0c		 bit $0c
$19:93d3  a8			tay
$19:93d4  1f ca 12 cc   ora $cc12ca,x
$19:93d8  ff b4 23 70   sbc $7023b4,x
$19:93dc  44 a0 10	  mvp $10,$a0
$19:93df  a8			tay
$19:93e0  01 b8		 ora ($b8,x)
$19:93e2  15 ca		 ora $ca,x
$19:93e4  94 2b		 sty $2b,x
$19:93e6  c8			iny
$19:93e7  18			clc
$19:93e8  43 03		 eor $03,s
$19:93ea  7a			ply
$19:93eb  33 0c		 and ($0c,s),y
$19:93ed  3c 34 3f	  bit $3f34,x
$19:93f0  f5 69		 sbc $69,x
$19:93f2  94 06		 sty $06,x
$19:93f4  0e ec 1f	  asl $1fec
$19:93f7  60			rts
$19:93f8  60			rts
$19:93f9  60			rts
$19:93fa  ee f1 a0	  inc $a0f1
$19:93fd  3a			dec a
$19:93fe  cf d9 c0 76   cmp $76c0d9
$19:9402  0b			phd
$19:9403  f4 70 0d	  pea $0d70
$19:9406  ef 76 86 a8   sbc $a88676
$19:940a  cc 2f 51	  cpy $512f
$19:940d  d5 2e		 cmp $2e,x
$19:940f  80 04		 bra $9415
$19:9411  5a			phy
$19:9412  ac 13 ac	  ldy $ac13
$19:9415  f5 5c		 sbc $5c,x
$19:9417  24 60		 bit $60
$19:9419  44 60 11	  mvp $11,$60
$19:941c  33 c8		 and ($c8,s),y
$19:941e  b9 96 16	  lda $1696,y
$19:9421  c5 08		 cmp $08
$19:9423  24 b0		 bit $b0
$19:9425  cc 30 b2	  cpy $b230
$19:9428  18			clc
$19:9429  ae 82 05	  ldx $0582
$19:942c  09 54 84	  ora #$8454
$19:942f  b4 54		 ldy $54,x
$19:9431  04 f0		 tsb $f0
$19:9433  55 04		 eor $04,x
$19:9435  b6 05		 ldx $05,y
$19:9437  fc 37 8c	  jsr ($8c37,x)
$19:943a  36 01		 rol $01,x
$19:943c  fb			xce
$19:943d  56 9a		 lsr $9a,x
$19:943f  75 6d		 adc $6d,x
$19:9441  6a			ror a
$19:9442  53 73		 eor ($73,s),y
$19:9444  01 c5		 ora ($c5,x)
$19:9446  1d 42 98	  ora $9842,x
$19:9449  2c 03 58	  bit $5803
$19:944c  93 60		 sta ($60,s),y
$19:944e  84 16		 sty $16
$19:9450  88			dey
$19:9451  34 83		 bit $83,x
$19:9453  20 d6 38	  jsr $38d6
$19:9456  42 48		 wdm #$48
$19:9458  41 3f		 eor ($3f,x)
$19:945a  00 dd		 brk #$dd
$19:945c  87 13		 sta [$13]
$19:945e  76 23		 ror $23,x
$19:9460  07 61		 ora [$61]
$19:9462  6e f8 40	  ror $40f8
$19:9465  13 dd		 ora ($dd,s),y
$19:9467  8a			txa
$19:9468  85 0e		 sta $0e
$19:946a  4c 54 34	  jmp $3454
$19:946d  2d 72 04	  and $0472
$19:9470  0e 02 c0	  asl $c002
$19:9473  49 06 ea	  eor #$ea06
$19:9476  95 18		 sta $18,x
$19:9478  0c 12 2b	  tsb $2b12
$19:947b  0a			asl a
$19:947c  a7 a6		 lda [$a6]
$19:947e  86 0b		 stx $0b
$19:9480  0e 88 cf	  asl $cf88
$19:9483  c6 41		 dec $41
$19:9485  05 80		 ora $80
$19:9487  45 e1		 eor $e1
$19:9489  14 d1		 trb $d1
$19:948b  18			clc
$19:948c  3d c2 21	  and $21c2,x
$19:948f  0f b4 bd 4a   ora $4abdb4
$19:9493  11 17		 ora ($17),y
$19:9495  ac 8c 81	  ldy $818c
$19:9498  d2 00		 cmp ($00)
$19:949a  70 b5		 bvs $9451
$19:949c  02 8a		 cop #$8a
$19:949e  01 1f		 ora ($1f,x)
$19:94a0  ad 0c 82	  lda $820c
$19:94a3  09 01 8f	  ora #$8f01
$19:94a6  c0 29 d4	  cpy #$d429
$19:94a9  2f f7 fc 82   and $82fcf7
$19:94ad  12 28		 ora ($28)
$19:94af  01 70		 ora ($70,x)
$19:94b1  0f 2c 68 08   ora $08682c
$19:94b5  b0 24		 bcs $94db
$19:94b7  4c e1 08	  jmp $08e1
$19:94ba  87 00		 sta [$00]
$19:94bc  84 60		 sty $60
$19:94be  30 00		 bmi $94c0
$19:94c0  81 40		 sta ($40,x)
$19:94c2  21 d0		 and ($d0,x)
$19:94c4  80 b8		 bra $947e
$19:94c6  08			php
$19:94c7  0a			asl a
$19:94c8  40			rti
$19:94c9  61 57		 adc ($57,x)
$19:94cb  00 34		 brk #$34
$19:94cd  06 1b		 asl $1b
$19:94cf  06 04		 asl $04
$19:94d1  94 02		 sty $02,x
$19:94d3  27 00		 and [$00]
$19:94d5  01 09		 ora ($09,x)
$19:94d7  7c ab 68	  jmp ($68ab,x)
$19:94da  c2 64		 rep #$64
$19:94dc  74 f8		 stz $f8,x
$19:94de  d9 e2 d1	  cmp $d1e2,y
$19:94e1  9e 20 7c	  stz $7c20,x
$19:94e4  5a			phy
$19:94e5  33 d8		 and ($d8,s),y
$19:94e7  10 42		 bpl $952b
$19:94e9  00 4e		 brk #$4e
$19:94eb  2e 0d ff	  rol $ff0d
$19:94ee  ec b8 07	  cpx $07b8
$19:94f1  00 0e		 brk #$0e
$19:94f3  ff e0 b8 01   sbc $01b8e0,x
$19:94f7  80 0f		 bra $9508
$19:94f9  ff e0 b8 03   sbc $03b8e0,x
$19:94fd  00 10		 brk #$10
$19:94ff  ff e0 b8 03   sbc $03b8e0,x
$19:9503  c0 11 ff	  cpy #$ff11
$19:9506  f6 b8		 inc $b8,x
$19:9508  07 a8		 ora [$a8]
$19:950a  12 ff		 ora ($ff)
$19:950c  e0 b8 00	  cpx #$00b8
$19:950f  f0 13		 beq $9524
$19:9511  ff e0 b8 07   sbc $07b8e0,x
$19:9515  a8			tay
$19:9516  14 ff		 trb $ff
$19:9518  f1 b8		 sbc ($b8),y
$19:951a  07 00		 ora [$00]
$19:951c  15 ff		 ora $ff,x
$19:951e  e0 b8 06	  cpx #$06b8
$19:9521  15 16		 ora $16,x
$19:9523  ff e0 b8 07   sbc $07b8e0,x
$19:9527  a8			tay
$19:9528  17 ff		 ora [$ff],y
$19:952a  e0 b8 07	  cpx #$07b8
$19:952d  a8			tay
$19:952e  18			clc
$19:952f  00 00		 brk #$00
$19:9531  2f 32 65 7f   and $7f6532
$19:9535  98			tya
$19:9536  b2 cb		 lda ($cb)
$19:9538  e5 fc		 sbc $fc
$19:953a  19 32 4c	  ora $4c32,y
$19:953d  65 72		 adc $72
$19:953f  7f 8c 98 a5   adc $a5988c,x
$19:9543  b2 bf		 lda ($bf)
$19:9545  cb			wai
$19:9546  d8			cld
$19:9547  e5 f2		 sbc $f2
$19:9549  fc 73 09	  jsr ($0973,x)
$19:954c  00 10		 brk #$10
$19:954e  02 10		 cop #$10
$19:9550  0a			asl a
$19:9551  10 ff		 bpl $9552
$19:9553  00 02		 brk #$02
$19:9555  10 00		 bpl $9557
$19:9557  00 1a		 brk #$1a
$19:9559  10 33		 bpl $958e
$19:955b  11 8d		 ora ($8d),y
$19:955d  12 95		 ora ($95)
$19:955f  13 de		 ora ($de,s),y
$19:9561  13 44		 ora ($44,s),y
$19:9563  15 2f		 ora $2f,x
$19:9565  17 70		 ora [$70],y
$19:9567  18			clc
$19:9568  fa			plx
$19:9569  08			php
$19:956a  ea			nop
$19:956b  00 e0		 brk #$e0
$19:956d  03 e7		 ora $e7,s
$19:956f  19 ed 87	  ora $87ed,y
$19:9572  e5 ff		 sbc $ff
$19:9574  e1 08		 sbc ($08,x)
$19:9576  f5 80		 sbc $80,x
$19:9578  7f 7f f7 03   adc $03f77f,x
$19:957c  aa			tax
$19:957d  00 e3		 brk #$e3
$19:957f  30 46		 bmi $95c7
$19:9581  40			rti
$19:9582  0c c9 0c	  tsb $0cc9
$19:9585  5d 9f a6	  eor $a69f,x
$19:9588  9f a9 a9 a6   sta $a6a9a9,x
$19:958c  c9 60 c9	  cmp #$c960
$19:958f  0c c9 9f	  tsb $9fc9
$19:9592  a6 9f		 ldx $9f
$19:9594  a9 a9 a6	  lda #$a6a9
$19:9597  c9 60 c9	  cmp #$c960
$19:959a  0c c9 9f	  tsb $9fc9
$19:959d  a6 9f		 ldx $9f
$19:959f  a9 a9 a6	  lda #$a6a9
$19:95a2  c9 3c c9	  cmp #$c93c
$19:95a5  0c a1 a8	  tsb $a8a1
$19:95a8  a1 c9		 lda ($c9,x)
$19:95aa  a1 a9		 lda ($a9,x)
$19:95ac  a1 a9		 lda ($a9,x)
$19:95ae  a9 a6 c9	  lda #$c9a6
$19:95b1  3c c9 0c	  bit $0cc9,x
$19:95b4  a1 a9		 lda ($a9,x)
$19:95b6  a1 c9		 lda ($c9,x)
$19:95b8  9f a6 9f a9   sta $a99fa6,x
$19:95bc  a9 0c 5b	  lda #$5b0c
$19:95bf  a6 c9		 ldx $c9
$19:95c1  3c c9 0c	  bit $0cc9,x
$19:95c4  5d a1 a8	  eor $a8a1,x
$19:95c7  a1 c9		 lda ($c9,x)
$19:95c9  a1 a9		 lda ($a9,x)
$19:95cb  a1 a9		 lda ($a9,x)
$19:95cd  a9 a6 c9	  lda #$c9a6
$19:95d0  3c c9 0c	  bit $0cc9,x
$19:95d3  a9 a9 a6	  lda #$a6a9
$19:95d6  ed 89 e1	  sbc $e189
$19:95d9  0a			asl a
$19:95da  24 c9		 bit $c9
$19:95dc  0c b2 b9	  tsb $b9b2
$19:95df  18			clc
$19:95e0  b9 0c 5b	  lda $5b0c,y
$19:95e3  b9 18 c8	  lda $c818,y
$19:95e6  18			clc
$19:95e7  5d b7 b7	  eor $b7b7,x
$19:95ea  b5 b4		 lda $b4,x
$19:95ec  b2 b2		 lda ($b2)
$19:95ee  b2 24		 lda ($24)
$19:95f0  b4 3c		 ldy $3c,x
$19:95f2  b5 0c		 lda $0c,x
$19:95f4  b5 b2		 lda $b2,x
$19:95f6  b2 b0		 lda ($b0)
$19:95f8  18			clc
$19:95f9  b2 0c		 lda ($0c)
$19:95fb  b5 0c		 lda $0c,x
$19:95fd  5b			tcd
$19:95fe  b7 18		 lda [$18],y
$19:9600  c8			iny
$19:9601  18			clc
$19:9602  5d b5 b4	  eor $b4b5,x
$19:9605  b0 60		 bcs $9667
$19:9607  5b			tcd
$19:9608  b2 48		 lda ($48)
$19:960a  c8			iny
$19:960b  06 6b		 asl $6b
$19:960d  b2 b4		 lda ($b4)
$19:960f  b5 b7		 lda $b7,x
$19:9611  ed 8c 60	  sbc $608c
$19:9614  5b			tcd
$19:9615  b9 18 c8	  lda $c818,y
$19:9618  0c c9 0c	  tsb $0cc9
$19:961b  5d b5 18	  eor $18b5,x
$19:961e  b4 b5		 ldy $b5,x
$19:9620  60			rts
$19:9621  5a			phy
$19:9622  b7 30		 lda [$30],y
$19:9624  5d b9 b5	  eor $b5b9,x
$19:9627  60			rts
$19:9628  5a			phy
$19:9629  b2 18		 lda ($18)
$19:962b  c8			iny
$19:962c  0c c9 0c	  tsb $0cc9
$19:962f  5d b5 18	  eor $18b5,x
$19:9632  b4 b5		 ldy $b5,x
$19:9634  60			rts
$19:9635  59 b9 48	  eor $48b9,y
$19:9638  c8			iny
$19:9639  06 6b		 asl $6b
$19:963b  b2 b4		 lda ($b4)
$19:963d  b5 b7		 lda $b7,x
$19:963f  60			rts
$19:9640  59 b9 18	  eor $18b9,y
$19:9643  c8			iny
$19:9644  0c c9 0c	  tsb $0cc9
$19:9647  5d b5 18	  eor $18b5,x
$19:964a  b4 b5		 ldy $b5,x
$19:964c  60			rts
$19:964d  5a			phy
$19:964e  b7 30		 lda [$30],y
$19:9650  5d b9 b5	  eor $b5b9,x
$19:9653  60			rts
$19:9654  5a			phy
$19:9655  b2 18		 lda ($18)
$19:9657  c8			iny
$19:9658  0c c9 0c	  tsb $0cc9
$19:965b  5d b5 18	  eor $18b5,x
$19:965e  b4 b5		 ldy $b5,x
$19:9660  24 b4		 bit $b4
$19:9662  3c 5b b2	  bit $b25b,x
$19:9665  60			rts
$19:9666  c8			iny
$19:9667  0c 5d a1	  tsb $a15d
$19:966a  18			clc
$19:966b  a2 a6 a9	  ldx #$a9a6
$19:966e  0c 5b ab	  tsb $ab5b
$19:9671  c8			iny
$19:9672  18			clc
$19:9673  5d a9 a8	  eor $a8a9,x
$19:9676  24 a9		 bit $a9
$19:9678  24 5c		 bit $5c
$19:967a  a8			tay
$19:967b  3c 5a a6	  bit $a65a,x
$19:967e  60			rts
$19:967f  c8			iny
$19:9680  00 ea		 brk #$ea
$19:9682  00 e0		 brk #$e0
$19:9684  02 ed		 cop #$ed
$19:9686  6b			rtl
$19:9687  e1 0b		 sbc ($0b,x)
$19:9689  e3 30		 sbc $30,s
$19:968b  0a			asl a
$19:968c  0a			asl a
$19:968d  60			rts
$19:968e  c9 c9 c9	  cmp #$c9c9
$19:9691  24 c9		 bit $c9
$19:9693  0c 5d ad	  tsb $ad5d
$19:9696  ae 18 b0	  ldx $b018
$19:9699  0c 5b b2	  tsb $b25b
$19:969c  30 c8		 bmi $9666
$19:969e  18			clc
$19:969f  5d b5 b7	  eor $b7b5,x
$19:96a2  b4 b0		 ldy $b0,x
$19:96a4  b0 ad		 bcs $9653
$19:96a6  60			rts
$19:96a7  5b			tcd
$19:96a8  b2 18		 lda ($18)
$19:96aa  68			pla
$19:96ab  c8			iny
$19:96ac  0c c9 0c	  tsb $0cc9
$19:96af  5d ad ae	  eor $aead,x
$19:96b2  18			clc
$19:96b3  b0 0c		 bcs $96c1
$19:96b5  5b			tcd
$19:96b6  b2 30		 lda ($30)
$19:96b8  c8			iny
$19:96b9  18			clc
$19:96ba  5d b5 b7	  eor $b7b5,x
$19:96bd  b4 b0		 ldy $b0,x
$19:96bf  b0 ad		 bcs $966e
$19:96c1  60			rts
$19:96c2  5b			tcd
$19:96c3  b2 18		 lda ($18)
$19:96c5  68			pla
$19:96c6  c8			iny
$19:96c7  48			pha
$19:96c8  c9 ea f4	  cmp #$f4ea
$19:96cb  ed 57 e0	  sbc $e057
$19:96ce  02 18		 cop #$18
$19:96d0  c9 0c 5d	  cmp #$5d0c
$19:96d3  b9 b7 b2	  lda $b2b7,y
$19:96d6  b9 18 c9	  lda $c918,y
$19:96d9  60			rts
$19:96da  c9 18 c9	  cmp #$c918
$19:96dd  0c b9 b7	  tsb $b7b9
$19:96e0  b2 b9		 lda ($b9)
$19:96e2  18			clc
$19:96e3  c9 60 c9	  cmp #$c960
$19:96e6  18			clc
$19:96e7  c9 0c b9	  cmp #$b90c
$19:96ea  b7 b2		 lda [$b2],y
$19:96ec  b9 18 c9	  lda $c918,y
$19:96ef  60			rts
$19:96f0  c9 54 c9	  cmp #$c954
$19:96f3  0c b2 b5	  tsb $b5b2
$19:96f6  b7 0c		 lda [$0c],y
$19:96f8  5c b4 0c 5b   jml $5b0cb4
$19:96fc  bc ea 00	  ldy $00ea,x
$19:96ff  e0 06 ed	  cpx #$ed06
$19:9702  bb			tyx
$19:9703  e1 0a		 sbc ($0a,x)
$19:9705  c9 0c 5d	  cmp #$5d0c
$19:9708  9c 9a 98	  stz $989a
$19:970b  e1 07		 sbc ($07,x)
$19:970d  ed 64 ea	  sbc $ea64
$19:9710  00 e0		 brk #$e0
$19:9712  07 c9		 ora [$c9]
$19:9714  0c 3d a4	  tsb $a43d
$19:9717  a6 18		 ldx $18
$19:9719  ae ad 0c	  ldx $0cad
$19:971c  ab			plb
$19:971d  c8			iny
$19:971e  a4 a6		 ldy $a6
$19:9720  18			clc
$19:9721  ae ad 0c	  ldx $0cad
$19:9724  ab			plb
$19:9725  c8			iny
$19:9726  a4 a6		 ldy $a6
$19:9728  18			clc
$19:9729  ad a8 0c	  lda $0ca8
$19:972c  a4 c8		 ldy $c8
$19:972e  a4 a6		 ldy $a6
$19:9730  18			clc
$19:9731  ad ab 0c	  lda $0cab
$19:9734  a9 c8 a4	  lda #$a4c8
$19:9737  a6 18		 ldx $18
$19:9739  ae ad 0c	  ldx $0cad
$19:973c  ab			plb
$19:973d  c8			iny
$19:973e  a4 a6		 ldy $a6
$19:9740  18			clc
$19:9741  ae ad 0c	  ldx $0cad
$19:9744  ab			plb
$19:9745  c8			iny
$19:9746  a4 a6		 ldy $a6
$19:9748  18			clc
$19:9749  ad a8 0c	  lda $0ca8
$19:974c  a4 c8		 ldy $c8
$19:974e  a4 a6		 ldy $a6
$19:9750  18			clc
$19:9751  ad aa 0c	  lda $0caa
$19:9754  a6 c8		 ldx $c8
$19:9756  a4 a6		 ldy $a6
$19:9758  18			clc
$19:9759  ae ad 0c	  ldx $0cad
$19:975c  ab			plb
$19:975d  c8			iny
$19:975e  a4 a6		 ldy $a6
$19:9760  18			clc
$19:9761  ae ad 0c	  ldx $0cad
$19:9764  ab			plb
$19:9765  c8			iny
$19:9766  a4 a6		 ldy $a6
$19:9768  18			clc
$19:9769  ad a8 0c	  lda $0ca8
$19:976c  a4 c8		 ldy $c8
$19:976e  a4 a6		 ldy $a6
$19:9770  18			clc
$19:9771  ad ab 0c	  lda $0cab
$19:9774  a9 c8 a4	  lda #$a4c8
$19:9777  a6 18		 ldx $18
$19:9779  ae ad 0c	  ldx $0cad
$19:977c  ab			plb
$19:977d  c8			iny
$19:977e  a4 a6		 ldy $a6
$19:9780  18			clc
$19:9781  ad a8 0c	  lda $0ca8
$19:9784  a4 24		 ldy $24
$19:9786  1d a6 e1	  ora $e1a6,x
$19:9789  09 ea 00	  ora #$00ea
$19:978c  ed 53 e0	  sbc $e053
$19:978f  02 0c		 cop #$0c
$19:9791  3b			tsc
$19:9792  b2 0c		 lda ($0c)
$19:9794  3d ad 18	  and $18ad,x
$19:9797  a6 0c		 ldx $0c
$19:9799  3b			tsc
$19:979a  b2 0c		 lda ($0c)
$19:979c  3d ad 18	  and $18ad,x
$19:979f  a6 0c		 ldx $0c
$19:97a1  3b			tsc
$19:97a2  b2 0c		 lda ($0c)
$19:97a4  3d ad 18	  and $18ad,x
$19:97a7  a6 0c		 ldx $0c
$19:97a9  3b			tsc
$19:97aa  b2 0c		 lda ($0c)
$19:97ac  3d ae 18	  and $18ae,x
$19:97af  a9 a2 a9	  lda #$a9a2
$19:97b2  0c ae 0c	  tsb $0cae
$19:97b5  3b			tsc
$19:97b6  b0 18		 bcs $97d0
$19:97b8  3d ab a4	  and $a4ab,x
$19:97bb  ab			plb
$19:97bc  0c 3b b0	  tsb $b03b
$19:97bf  24 3d		 bit $3d
$19:97c1  a6 0c		 ldx $0c
$19:97c3  3b			tsc
$19:97c4  b2 0c		 lda ($0c)
$19:97c6  3d ad 18	  and $18ad,x
$19:97c9  a6 0c		 ldx $0c
$19:97cb  3b			tsc
$19:97cc  b2 0c		 lda ($0c)
$19:97ce  3d ad 18	  and $18ad,x
$19:97d1  a6 0c		 ldx $0c
$19:97d3  3b			tsc
$19:97d4  b2 0c		 lda ($0c)
$19:97d6  3d ad 24	  and $24ad,x
$19:97d9  a6 00		 ldx $00
$19:97db  ea			nop
$19:97dc  f4 e0 04	  pea $04e0
$19:97df  ed c3 e1	  sbc $e1c3
$19:97e2  0a			asl a
$19:97e3  e3 12		 sbc $12,s
$19:97e5  46 7f		 lsr $7f
$19:97e7  0c 7d 9f	  tsb $9f7d
$19:97ea  a6 48		 ldx $48
$19:97ec  c9 54 c9	  cmp #$c954
$19:97ef  0c a6 9f	  tsb $9fa6
$19:97f2  a6 48		 ldx $48
$19:97f4  c9 60 c9	  cmp #$c960
$19:97f7  0c 9f a6	  tsb $a69f
$19:97fa  48			pha
$19:97fb  c9 0c a1	  cmp #$a10c
$19:97fe  0c 7b a8	  tsb $a87b
$19:9801  48			pha
$19:9802  c9 0c 7d	  cmp #$7d0c
$19:9805  a6 0c		 ldx $0c
$19:9807  7b			tdc
$19:9808  ad 48 c9	  lda $c948
$19:980b  0c 7d a6	  tsb $a67d
$19:980e  0c 7b ad	  tsb $ad7b
$19:9811  48			pha
$19:9812  c9 0c 7d	  cmp #$7d0c
$19:9815  9f a6 48 c9   sta $c948a6,x
$19:9819  0c a1 0c	  tsb $0ca1
$19:981c  7b			tdc
$19:981d  a8			tay
$19:981e  48			pha
$19:981f  c9 0c 7d	  cmp #$7d0c
$19:9822  a6 0c		 ldx $0c
$19:9824  7b			tdc
$19:9825  ad 48 c9	  lda $c948
$19:9828  0c 7d a6	  tsb $a67d
$19:982b  0c 7b ad	  tsb $ad7b
$19:982e  48			pha
$19:982f  c9 54 c9	  cmp #$c954
$19:9832  ed 7d 0c	  sbc $0c7d
$19:9835  7d b2 0c	  adc $0cb2,x
$19:9838  7e b5 0c	  ror $0cb5,x
$19:983b  7b			tdc
$19:983c  b7 0c		 lda [$0c],y
$19:983e  7d b4 0c	  adc $0cb4,x
$19:9841  7b			tdc
$19:9842  b9 30 c9	  lda $c930,y
$19:9845  54 c9 0c	  mvn $0c,$c9
$19:9848  7d b2 0c	  adc $0cb2,x
$19:984b  7e b5 0c	  ror $0cb5,x
$19:984e  7b			tdc
$19:984f  b7 0c		 lda [$0c],y
$19:9851  7d b9 0c	  adc $0cb9,x
$19:9854  7b			tdc
$19:9855  b5 c9		 lda $c9,x
$19:9857  b4 c9		 ldy $c9,x
$19:9859  b2 60		 lda ($60)
$19:985b  c9 c9 ed	  cmp #$edc9
$19:985e  b9 0c 7e	  lda $7e0c,y
$19:9861  a6 18		 ldx $18
$19:9863  7c ad 3c	  jmp ($3cad,x)
$19:9866  c9 60 c9	  cmp #$c960
$19:9869  ea			nop
$19:986a  00 e0		 brk #$e0
$19:986c  01 ed		 ora ($ed,x)
$19:986e  6e e1 0a	  ror $0ae1
$19:9871  e3 0c		 sbc $0c,s
$19:9873  0c 0c 24	  tsb $240c
$19:9876  5d 9f 0c	  eor $0c9f,x
$19:9879  9f 30 9f 24   sta $249f30,x
$19:987d  a4 0c		 ldy $0c
$19:987f  a4 30		 ldy $30
$19:9881  a4 24		 ldy $24
$19:9883  9d 0c 9d	  sta $9d0c,x
$19:9886  30 9d		 bmi $9825
$19:9888  24 a2		 bit $a2
$19:988a  0c a2 30	  tsb $30a2
$19:988d  a2 24 9f	  ldx #$9f24
$19:9890  0c 9f 30	  tsb $309f
$19:9893  9f 24 a4 0c   sta $0ca424,x
$19:9897  a4 30		 ldy $30
$19:9899  a4 24		 ldy $24
$19:989b  9d 0c 9d	  sta $9d0c,x
$19:989e  30 9d		 bmi $983d
$19:98a0  24 a6		 bit $a6
$19:98a2  0c a6 a6	  tsb $a6a6
$19:98a5  18			clc
$19:98a6  9e 0c a1	  stz $a10c,x
$19:98a9  24 9f		 bit $9f
$19:98ab  0c 9f 30	  tsb $309f
$19:98ae  9f 24 a4 0c   sta $0ca424,x
$19:98b2  a4 30		 ldy $30
$19:98b4  a4 24		 ldy $24
$19:98b6  9d 0c 9d	  sta $9d0c,x
$19:98b9  30 9d		 bmi $9858
$19:98bb  24 a2		 bit $a2
$19:98bd  0c a2 18	  tsb $18a2
$19:98c0  a2 a1 24	  ldx #$24a1
$19:98c3  9f 0c 9f 30   sta $309f0c,x
$19:98c7  9f 24 a1 0c   sta $0ca124,x
$19:98cb  a1 30		 lda ($30,x)
$19:98cd  a1 24		 lda ($24,x)
$19:98cf  a6 0c		 ldx $0c
$19:98d1  a6 30		 ldx $30
$19:98d3  a6 24		 ldx $24
$19:98d5  a6 0c		 ldx $0c
$19:98d7  a6 30		 ldx $30
$19:98d9  a6 54		 ldx $54
$19:98db  9f 0c a0 60   sta $60a00c,x
$19:98df  a1 a6		 lda ($a6,x)
$19:98e1  c8			iny
$19:98e2  00 e0		 brk #$e0
$19:98e4  05 ea		 ora $ea
$19:98e6  00 ed		 brk #$ed
$19:98e8  77 e1		 adc [$e1],y
$19:98ea  0a			asl a
$19:98eb  e3 01		 sbc $01,s
$19:98ed  01 01		 ora ($01,x)
$19:98ef  60			rts
$19:98f0  7d 9f c8	  adc $c89f,x
$19:98f3  c8			iny
$19:98f4  0c c8 54	  tsb $54c8
$19:98f7  c9 60 a2	  cmp #$a260
$19:98fa  a4 a6		 ldy $a6
$19:98fc  c8			iny
$19:98fd  a2 a4 a6	  ldx #$a6a4
$19:9900  48			pha
$19:9901  c8			iny
$19:9902  0c 9a 98	  tsb $989a
$19:9905  60			rts
$19:9906  96 98		 stx $98,y
$19:9908  9a			txs
$19:9909  30 c8		 bmi $98d3
$19:990b  98			tya
$19:990c  60			rts
$19:990d  96 95		 stx $95,y
$19:990f  9a			txs
$19:9910  48			pha
$19:9911  9a			txs
$19:9912  18			clc
$19:9913  c9 ed 64	  cmp #$64ed
$19:9916  60			rts
$19:9917  a6 a8		 ldx $a8
$19:9919  c8			iny
$19:991a  a6 a6		 ldx $a6
$19:991c  a8			tay
$19:991d  c8			iny
$19:991e  a6 a6		 ldx $a6
$19:9920  a8			tay
$19:9921  c8			iny
$19:9922  a6 a6		 ldx $a6
$19:9924  a8			tay
$19:9925  c8			iny
$19:9926  a9 a6 a8	  lda #$a8a6
$19:9929  c8			iny
$19:992a  a9 00 ed	  lda #$ed00
$19:992d  be e1 0a	  ldx $0ae1,y
$19:9930  18			clc
$19:9931  59 ca 18	  eor $18ca,y
$19:9934  57 cc		 eor [$cc],y
$19:9936  c9 0c cc	  cmp #$cc0c
$19:9939  0c 59 ca	  tsb $ca59
$19:993c  18			clc
$19:993d  ca			dex
$19:993e  18			clc
$19:993f  57 cc		 eor [$cc],y
$19:9941  c9 cc 18	  cmp #$18cc
$19:9944  59 ca 18	  eor $18ca,y
$19:9947  57 cc		 eor [$cc],y
$19:9949  c9 0c cc	  cmp #$cc0c
$19:994c  0c 59 ca	  tsb $ca59
$19:994f  18			clc
$19:9950  ca			dex
$19:9951  18			clc
$19:9952  57 cc		 eor [$cc],y
$19:9954  30 c9		 bmi $991f
$19:9956  18			clc
$19:9957  59 ca 18	  eor $18ca,y
$19:995a  57 cc		 eor [$cc],y
$19:995c  c9 0c cc	  cmp #$cc0c
$19:995f  0c 59 ca	  tsb $ca59
$19:9962  18			clc
$19:9963  ca			dex
$19:9964  18			clc
$19:9965  57 cc		 eor [$cc],y
$19:9967  c9 cc 18	  cmp #$18cc
$19:996a  59 ca 18	  eor $18ca,y
$19:996d  57 cc		 eor [$cc],y
$19:996f  c9 0c cc	  cmp #$cc0c
$19:9972  0c 59 ca	  tsb $ca59
$19:9975  18			clc
$19:9976  ca			dex
$19:9977  18			clc
$19:9978  57 cc		 eor [$cc],y
$19:997a  c9 cc 18	  cmp #$18cc
$19:997d  59 ca 18	  eor $18ca,y
$19:9980  57 cc		 eor [$cc],y
$19:9982  c9 0c cc	  cmp #$cc0c
$19:9985  0c 59 ca	  tsb $ca59
$19:9988  18			clc
$19:9989  ca			dex
$19:998a  18			clc
$19:998b  57 cc		 eor [$cc],y
$19:998d  c9 cc 18	  cmp #$18cc
$19:9990  59 ca 18	  eor $18ca,y
$19:9993  57 cc		 eor [$cc],y
$19:9995  c9 0c cc	  cmp #$cc0c
$19:9998  0c 59 ca	  tsb $ca59
$19:999b  18			clc
$19:999c  ca			dex
$19:999d  18			clc
$19:999e  57 cc		 eor [$cc],y
$19:99a0  c9 cc 24	  cmp #$24cc
$19:99a3  5b			tcd
$19:99a4  ca			dex
$19:99a5  0c ca 0c	  tsb $0cca
$19:99a8  57 cc		 eor [$cc],y
$19:99aa  cc 0c 5b	  cpy $5b0c
$19:99ad  cb			wai
$19:99ae  0c 57 cc	  tsb $cc57
$19:99b1  0c 5b ca	  tsb $ca5b
$19:99b4  18			clc
$19:99b5  57 cc		 eor [$cc],y
$19:99b7  0c 5b ca	  tsb $ca5b
$19:99ba  30 c9		 bmi $9985
$19:99bc  24 ca		 bit $ca
$19:99be  0c ca 0c	  tsb $0cca
$19:99c1  57 cc		 eor [$cc],y
$19:99c3  cc 0c 5b	  cpy $5b0c
$19:99c6  cb			wai
$19:99c7  0c 57 cc	  tsb $cc57
$19:99ca  0c 5b ca	  tsb $ca5b
$19:99cd  18			clc
$19:99ce  57 cc		 eor [$cc],y
$19:99d0  0c 5b ca	  tsb $ca5b
$19:99d3  30 c9		 bmi $999e
$19:99d5  24 ca		 bit $ca
$19:99d7  0c ca 0c	  tsb $0cca
$19:99da  57 cc		 eor [$cc],y
$19:99dc  cc 0c 5b	  cpy $5b0c
$19:99df  cb			wai
$19:99e0  0c 57 cc	  tsb $cc57
$19:99e3  0c 5b ca	  tsb $ca5b
$19:99e6  18			clc
$19:99e7  57 cc		 eor [$cc],y
$19:99e9  0c 5b ca	  tsb $ca5b
$19:99ec  30 c9		 bmi $99b7
$19:99ee  18			clc
$19:99ef  ca			dex
$19:99f0  30 c9		 bmi $99bb
$19:99f2  0c 5d cc	  tsb $cc5d
$19:99f5  0c 5b ca	  tsb $ca5b
$19:99f8  18			clc
$19:99f9  ca			dex
$19:99fa  18			clc
$19:99fb  57 cc		 eor [$cc],y
$19:99fd  0c c9 c9	  tsb $c9c9
$19:9a00  c9 c9 18	  cmp #$18c9
$19:9a03  5b			tcd
$19:9a04  ca			dex
$19:9a05  0c cb ca	  tsb $cacb
$19:9a08  18			clc
$19:9a09  ca			dex
$19:9a0a  cb			wai
$19:9a0b  ca			dex
$19:9a0c  0c cb ca	  tsb $cacb
$19:9a0f  18			clc
$19:9a10  ca			dex
$19:9a11  cb			wai
$19:9a12  ca			dex
$19:9a13  0c cb ca	  tsb $cacb
$19:9a16  18			clc
$19:9a17  ca			dex
$19:9a18  cb			wai
$19:9a19  ca			dex
$19:9a1a  0c cb ca	  tsb $cacb
$19:9a1d  18			clc
$19:9a1e  ca			dex
$19:9a1f  cb			wai
$19:9a20  ca			dex
$19:9a21  0c cb ca	  tsb $cacb
$19:9a24  18			clc
$19:9a25  ca			dex
$19:9a26  cb			wai
$19:9a27  ca			dex
$19:9a28  0c cb ca	  tsb $cacb
$19:9a2b  18			clc
$19:9a2c  ca			dex
$19:9a2d  cb			wai
$19:9a2e  ca			dex
$19:9a2f  0c cb ca	  tsb $cacb
$19:9a32  18			clc
$19:9a33  ca			dex
$19:9a34  cb			wai
$19:9a35  ca			dex
$19:9a36  0c cb ca	  tsb $cacb
$19:9a39  18			clc
$19:9a3a  ca			dex
$19:9a3b  cb			wai
$19:9a3c  ca			dex
$19:9a3d  0c cb ca	  tsb $cacb
$19:9a40  18			clc
$19:9a41  ca			dex
$19:9a42  cb			wai
$19:9a43  ca			dex
$19:9a44  0c cb ca	  tsb $cacb
$19:9a47  18			clc
$19:9a48  ca			dex
$19:9a49  cb			wai
$19:9a4a  ca			dex
$19:9a4b  0c cb ca	  tsb $cacb
$19:9a4e  18			clc
$19:9a4f  ca			dex
$19:9a50  cb			wai
$19:9a51  ca			dex
$19:9a52  0c cb ca	  tsb $cacb
$19:9a55  18			clc
$19:9a56  ca			dex
$19:9a57  cb			wai
$19:9a58  ca			dex
$19:9a59  0c cb ca	  tsb $cacb
$19:9a5c  18			clc
$19:9a5d  ca			dex
$19:9a5e  cb			wai
$19:9a5f  ca			dex
$19:9a60  0c cb ca	  tsb $cacb
$19:9a63  18			clc
$19:9a64  ca			dex
$19:9a65  cb			wai
$19:9a66  ca			dex
$19:9a67  0c cb ca	  tsb $cacb
$19:9a6a  18			clc
$19:9a6b  ca			dex
$19:9a6c  cb			wai
$19:9a6d  18			clc
$19:9a6e  5d ca 0c	  eor $0cca,x
$19:9a71  5b			tcd
$19:9a72  cb			wai
$19:9a73  0c 5d ca	  tsb $ca5d
$19:9a76  ca			dex
$19:9a77  0c 57 cc	  tsb $cc57
$19:9a7a  c9 cc 18	  cmp #$18cc
$19:9a7d  5b			tcd
$19:9a7e  ca			dex
$19:9a7f  3c c9 0c	  bit $0cc9,x
$19:9a82  ca			dex
$19:9a83  18			clc
$19:9a84  ca			dex
$19:9a85  48			pha
$19:9a86  c9 18 ca	  cmp #$ca18
$19:9a89  3c c9 0c	  bit $0cc9,x
$19:9a8c  ca			dex
$19:9a8d  18			clc
$19:9a8e  ca			dex
$19:9a8f  48			pha
$19:9a90  c9 00 ea	  cmp #$ea00
$19:9a93  f4 e0 00	  pea $00e0
$19:9a96  ed 75 e1	  sbc $e175
$19:9a99  0b			phd
$19:9a9a  e3 01		 sbc $01,s
$19:9a9c  0a			asl a
$19:9a9d  0a			asl a
$19:9a9e  18			clc
$19:9a9f  c9 0c 5d	  cmp #$5d0c
$19:9aa2  ae ad c9	  ldx $c9ad
$19:9aa5  ae 18 c9	  ldx $c918
$19:9aa8  24 c9		 bit $c9
$19:9aaa  0c ae c9	  tsb $c9ae
$19:9aad  b0 18		 bcs $9ac7
$19:9aaf  c9 c9 0c	  cmp #$0cc9
$19:9ab2  ae ad c9	  ldx $c9ad
$19:9ab5  ae 18 c9	  ldx $c918
$19:9ab8  0c 5b ae	  tsb $ae5b
$19:9abb  54 c9 18	  mvn $18,$c9
$19:9abe  c9 0c 5d	  cmp #$5d0c
$19:9ac1  ae ad c9	  ldx $c9ad
$19:9ac4  ae 18 c9	  ldx $c918
$19:9ac7  c9 0c b0	  cmp #$b00c
$19:9aca  af c9 b0 18   lda $18b0c9
$19:9ace  c9 c9 0c	  cmp #$0cc9
$19:9ad1  5b			tcd
$19:9ad2  b5 b4		 lda $b4,x
$19:9ad4  c9 0c 59	  cmp #$590c
$19:9ad7  b5 18		 lda $18,x
$19:9ad9  c9 c9 0c	  cmp #$0cc9
$19:9adc  5b			tcd
$19:9add  b5 b4		 lda $b4,x
$19:9adf  c9 0c 59	  cmp #$590c
$19:9ae2  b5 18		 lda $18,x
$19:9ae4  c9 c9 0c	  cmp #$0cc9
$19:9ae7  5d ae ad	  eor $adae,x
$19:9aea  c9 ae 18	  cmp #$18ae
$19:9aed  c9 c9 0c	  cmp #$0cc9
$19:9af0  b0 af		 bcs $9aa1
$19:9af2  c9 b0 18	  cmp #$18b0
$19:9af5  c9 c9 0c	  cmp #$0cc9
$19:9af8  5b			tcd
$19:9af9  b5 b4		 lda $b4,x
$19:9afb  c9 0c 59	  cmp #$590c
$19:9afe  b5 18		 lda $18,x
$19:9b00  c9 c9 0c	  cmp #$0cc9
$19:9b03  5b			tcd
$19:9b04  b5 b4		 lda $b4,x
$19:9b06  c9 0c 59	  cmp #$590c
$19:9b09  b5 18		 lda $18,x
$19:9b0b  c9 60 c9	  cmp #$c960
$19:9b0e  c9 c9 c9	  cmp #$c9c9
$19:9b11  c9 c9 e1	  cmp #$e1c9
$19:9b14  09 18 c9	  ora #$c918
$19:9b17  0c 5c b5	  tsb $b55c
$19:9b1a  b4 c9		 ldy $c9,x
$19:9b1c  0c 5b b5	  tsb $b55b
$19:9b1f  18			clc
$19:9b20  c9 24 c9	  cmp #$c924
$19:9b23  0c 5c b9	  tsb $b95c
$19:9b26  c9 0c 5b	  cmp #$5b0c
$19:9b29  b7 18		 lda [$18],y
$19:9b2b  c9 ed 7d	  cmp #$7ded
$19:9b2e  e1 0b		 sbc ($0b,x)
$19:9b30  0c 5d b9	  tsb $b95d
$19:9b33  0c 5b b9	  tsb $b95b
$19:9b36  0c 5d b9	  tsb $b95d
$19:9b39  0c 59 b9	  tsb $b959
$19:9b3c  0c 5d b9	  tsb $b95d
$19:9b3f  0c 5b b7	  tsb $b75b
$19:9b42  c9 0c 59	  cmp #$590c
$19:9b45  b7 e1		 lda [$e1],y
$19:9b47  09 ea 00	  ora #$00ea
$19:9b4a  0c 5a cc	  tsb $cc5a
$19:9b4d  0c 5e cc	  tsb $cc5e
$19:9b50  0c 5d cc	  tsb $cc5d
$19:9b53  0c 5b cc	  tsb $cc5b
$19:9b56  30 c9		 bmi $9b21
$19:9b58  e1 0b		 sbc ($0b,x)
$19:9b5a  ea			nop
$19:9b5b  f4 e0 00	  pea $00e0
$19:9b5e  0c 5d b7	  tsb $b75d
$19:9b61  0c 5b b7	  tsb $b75b
$19:9b64  0c 5d b7	  tsb $b75d
$19:9b67  0c 59 b7	  tsb $b759
$19:9b6a  0c 5d b7	  tsb $b75d
$19:9b6d  0c 5b b5	  tsb $b55b
$19:9b70  c9 0c 59	  cmp #$590c
$19:9b73  b5 e1		 lda $e1,x
$19:9b75  09 ea 00	  ora #$00ea
$19:9b78  0c 5a cc	  tsb $cc5a
$19:9b7b  0c 5e cc	  tsb $cc5e
$19:9b7e  0c 5d cc	  tsb $cc5d
$19:9b81  0c 5b cc	  tsb $cc5b
$19:9b84  30 c9		 bmi $9b4f
$19:9b86  e1 0b		 sbc ($0b,x)
$19:9b88  ea			nop
$19:9b89  f4 e0 00	  pea $00e0
$19:9b8c  0c 5d b9	  tsb $b95d
$19:9b8f  0c 5b b9	  tsb $b95b
$19:9b92  0c 5d b9	  tsb $b95d
$19:9b95  0c 59 b9	  tsb $b959
$19:9b98  0c 5d b9	  tsb $b95d
$19:9b9b  0c 5b b7	  tsb $b75b
$19:9b9e  c9 0c 59	  cmp #$590c
$19:9ba1  b7 e1		 lda [$e1],y
$19:9ba3  09 ea 00	  ora #$00ea
$19:9ba6  0c 5a cc	  tsb $cc5a
$19:9ba9  0c 5e cc	  tsb $cc5e
$19:9bac  0c 5d cc	  tsb $cc5d
$19:9baf  0c 5b cc	  tsb $cc5b
$19:9bb2  30 c9		 bmi $9b7d
$19:9bb4  60			rts
$19:9bb5  c9 e1 09	  cmp #$09e1
$19:9bb8  ea			nop
$19:9bb9  00 0c		 brk #$0c
$19:9bbb  5a			phy
$19:9bbc  cc 0c 5e	  cpy $5e0c
$19:9bbf  cc 0c 5d	  cpy $5d0c
$19:9bc2  cc 0c 5b	  cpy $5b0c
$19:9bc5  cc 30 c9	  cpy $c930
$19:9bc8  e1 0b		 sbc ($0b,x)
$19:9bca  ea			nop
$19:9bcb  f4 e0 00	  pea $00e0
$19:9bce  0c 5d b9	  tsb $b95d
$19:9bd1  0c 5b b9	  tsb $b95b
$19:9bd4  0c 5d b9	  tsb $b95d
$19:9bd7  0c 59 b9	  tsb $b959
$19:9bda  0c 5d b9	  tsb $b95d
$19:9bdd  0c 5b b7	  tsb $b75b
$19:9be0  c9 0c 59	  cmp #$590c
$19:9be3  b7 e1		 lda [$e1],y
$19:9be5  09 ea 00	  ora #$00ea
$19:9be8  cc 0c 5d	  cpy $5d0c
$19:9beb  cc 0c 5c	  cpy $5c0c
$19:9bee  cc 0c 59	  cpy $590c
$19:9bf1  cc 30 c9	  cpy $c930
$19:9bf4  e1 0b		 sbc ($0b,x)
$19:9bf6  ea			nop
$19:9bf7  f4 e0 00	  pea $00e0
$19:9bfa  0c 5d b7	  tsb $b75d
$19:9bfd  0c 5b b7	  tsb $b75b
$19:9c00  0c 5d b7	  tsb $b75d
$19:9c03  0c 59 b7	  tsb $b759
$19:9c06  0c 5d b7	  tsb $b75d
$19:9c09  0c 5b b5	  tsb $b55b
$19:9c0c  c9 0c 59	  cmp #$590c
$19:9c0f  b5 e1		 lda $e1,x
$19:9c11  09 ea 00	  ora #$00ea
$19:9c14  0c 5a cc	  tsb $cc5a
$19:9c17  0c 5e cc	  tsb $cc5e
$19:9c1a  0c 5d cc	  tsb $cc5d
$19:9c1d  0c 5b cc	  tsb $cc5b
$19:9c20  30 c9		 bmi $9beb
$19:9c22  e1 0b		 sbc ($0b,x)
$19:9c24  ea			nop
$19:9c25  f4 e0 00	  pea $00e0
$19:9c28  0c 5d b9	  tsb $b95d
$19:9c2b  0c 5b b9	  tsb $b95b
$19:9c2e  0c 5d b9	  tsb $b95d
$19:9c31  0c 59 b9	  tsb $b959
$19:9c34  0c 5d b9	  tsb $b95d
$19:9c37  0c 5b b7	  tsb $b75b
$19:9c3a  c9 0c 59	  cmp #$590c
$19:9c3d  b7 e1		 lda [$e1],y
$19:9c3f  09 ea 00	  ora #$00ea
$19:9c42  0c 5a cc	  tsb $cc5a
$19:9c45  0c 5e cc	  tsb $cc5e
$19:9c48  0c 5d cc	  tsb $cc5d
$19:9c4b  0c 5b cc	  tsb $cc5b
$19:9c4e  30 c9		 bmi $9c19
$19:9c50  60			rts
$19:9c51  c9 0c 59	  cmp #$590c
$19:9c54  cc 0c 5d	  cpy $5d0c
$19:9c57  cc 0c 5c	  cpy $5c0c
$19:9c5a  cc 0c 59	  cpy $590c
$19:9c5d  cc 30 c9	  cpy $c930
$19:9c60  e1 0b		 sbc ($0b,x)
$19:9c62  e0 00 ed	  cpx #$ed00
$19:9c65  73 ea		 adc ($ea,s),y
$19:9c67  00 0c		 brk #$0c
$19:9c69  5d a1 18	  eor $18a1,x
$19:9c6c  a2 a6 a9	  ldx #$a9a6
$19:9c6f  0c ab c8	  tsb $c8ab
$19:9c72  18			clc
$19:9c73  a9 a8 24	  lda #$24a8
$19:9c76  a9 a8 3c	  lda #$3ca8
$19:9c79  a6 60		 ldx $60
$19:9c7b  c8			iny
$19:9c7c  00 ea		 brk #$ea
$19:9c7e  f4 e0 00	  pea $00e0
$19:9c81  ed 50 e1	  sbc $e150
$19:9c84  09 1e c9	  ora #$c91e
$19:9c87  0c 5d ae	  tsb $ae5d
$19:9c8a  ad c9 ae	  lda $aec9
$19:9c8d  18			clc
$19:9c8e  c9 24 c9	  cmp #$c924
$19:9c91  0c ae c9	  tsb $c9ae
$19:9c94  b0 18		 bcs $9cae
$19:9c96  c9 c9 0c	  cmp #$0cc9
$19:9c99  ae ad c9	  ldx $c9ad
$19:9c9c  ae 18 c9	  ldx $c918
$19:9c9f  0c ae 54	  tsb $54ae
$19:9ca2  c9 18 c9	  cmp #$c918
$19:9ca5  0c ae ad	  tsb $adae
$19:9ca8  c9 ae 18	  cmp #$18ae
$19:9cab  c9 c9 0c	  cmp #$0cc9
$19:9cae  b0 af		 bcs $9c5f
$19:9cb0  c9 b0 18	  cmp #$18b0
$19:9cb3  c9 c9 0c	  cmp #$0cc9
$19:9cb6  b5 b4		 lda $b4,x
$19:9cb8  c9 0c 5b	  cmp #$5b0c
$19:9cbb  b5 18		 lda $18,x
$19:9cbd  c9 c9 0c	  cmp #$0cc9
$19:9cc0  5d b5 b4	  eor $b4b5,x
$19:9cc3  c9 0c 5b	  cmp #$5b0c
$19:9cc6  b5 18		 lda $18,x
$19:9cc8  c9 c9 0c	  cmp #$0cc9
$19:9ccb  5d ae ad	  eor $adae,x
$19:9cce  c9 ae 18	  cmp #$18ae
$19:9cd1  c9 c9 0c	  cmp #$0cc9
$19:9cd4  b0 af		 bcs $9c85
$19:9cd6  c9 b0 18	  cmp #$18b0
$19:9cd9  c9 c9 0c	  cmp #$0cc9
$19:9cdc  b5 b4		 lda $b4,x
$19:9cde  c9 0c 5b	  cmp #$5b0c
$19:9ce1  b5 18		 lda $18,x
$19:9ce3  c9 c9 0c	  cmp #$0cc9
$19:9ce6  5d b5 b4	  eor $b4b5,x
$19:9ce9  c9 0c 5b	  cmp #$5b0c
$19:9cec  b5 18		 lda $18,x
$19:9cee  c9 60 c9	  cmp #$c960
$19:9cf1  c9 c9 c9	  cmp #$c9c9
$19:9cf4  c9 c9 18	  cmp #$18c9
$19:9cf7  c9 0c 5d	  cmp #$5d0c
$19:9cfa  b5 b4		 lda $b4,x
$19:9cfc  c9 0c 5b	  cmp #$5b0c
$19:9cff  b5 18		 lda $18,x
$19:9d01  c9 24 c9	  cmp #$c924
$19:9d04  0c 5d b9	  tsb $b95d
$19:9d07  c9 0c 5b	  cmp #$5b0c
$19:9d0a  b7 18		 lda [$18],y
$19:9d0c  c9 ed 50	  cmp #$50ed
$19:9d0f  e1 09		 sbc ($09,x)
$19:9d11  0c 5d b9	  tsb $b95d
$19:9d14  0c 5b b9	  tsb $b95b
$19:9d17  0c 5d b9	  tsb $b95d
$19:9d1a  0c 59 b9	  tsb $b959
$19:9d1d  0c 5d b9	  tsb $b95d
$19:9d20  0c 5b b7	  tsb $b75b
$19:9d23  c9 0c 59	  cmp #$590c
$19:9d26  b7 60		 lda [$60],y
$19:9d28  c9 0c 5d	  cmp #$5d0c
$19:9d2b  b7 0c		 lda [$0c],y
$19:9d2d  5b			tcd
$19:9d2e  b7 0c		 lda [$0c],y
$19:9d30  5d b7 0c	  eor $0cb7,x
$19:9d33  59 b7 0c	  eor $0cb7,y
$19:9d36  5d b7 0c	  eor $0cb7,x
$19:9d39  5b			tcd
$19:9d3a  b5 c9		 lda $c9,x
$19:9d3c  0c 59 b5	  tsb $b559
$19:9d3f  60			rts
$19:9d40  c9 0c 5d	  cmp #$5d0c
$19:9d43  b9 0c 5b	  lda $5b0c,y
$19:9d46  b9 0c 5d	  lda $5d0c,y
$19:9d49  b9 0c 59	  lda $590c,y
$19:9d4c  b9 0c 5d	  lda $5d0c,y
$19:9d4f  b9 0c 5b	  lda $5b0c,y
$19:9d52  b7 c9		 lda [$c9],y
$19:9d54  0c 59 b7	  tsb $b759
$19:9d57  60			rts
$19:9d58  c9 c9 c9	  cmp #$c9c9
$19:9d5b  0c 5d b9	  tsb $b95d
$19:9d5e  0c 5b b9	  tsb $b95b
$19:9d61  0c 5d b9	  tsb $b95d
$19:9d64  0c 59 b9	  tsb $b959
$19:9d67  0c 5d b9	  tsb $b95d
$19:9d6a  0c 5b b7	  tsb $b75b
$19:9d6d  c9 0c 59	  cmp #$590c
$19:9d70  b7 60		 lda [$60],y
$19:9d72  c9 0c 5d	  cmp #$5d0c
$19:9d75  b7 0c		 lda [$0c],y
$19:9d77  5b			tcd
$19:9d78  b7 0c		 lda [$0c],y
$19:9d7a  5d b7 0c	  eor $0cb7,x
$19:9d7d  59 b7 0c	  eor $0cb7,y
$19:9d80  5d b7 0c	  eor $0cb7,x
$19:9d83  5b			tcd
$19:9d84  b5 c9		 lda $c9,x
$19:9d86  0c 59 b5	  tsb $b559
$19:9d89  60			rts
$19:9d8a  c9 0c 5d	  cmp #$5d0c
$19:9d8d  b9 0c 5b	  lda $5b0c,y
$19:9d90  b9 0c 5d	  lda $5d0c,y
$19:9d93  b9 0c 59	  lda $590c,y
$19:9d96  b9 0c 5d	  lda $5d0c,y
$19:9d99  b9 0c 5b	  lda $5b0c,y
$19:9d9c  b7 c9		 lda [$c9],y
$19:9d9e  0c 59 b7	  tsb $b759
$19:9da1  ea			nop
$19:9da2  00 60		 brk #$60
$19:9da4  c9 c9 c9	  cmp #$c9c9
$19:9da7  5a			phy
$19:9da8  c9 0c c8	  cmp #$c80c
$19:9dab  48			pha
$19:9dac  c9 e1 0a	  cmp #$0ae1
$19:9daf  e0 04 ed	  cpx #$ed04
$19:9db2  c3 0c		 cmp $0c,s
$19:9db4  7b			tdc
$19:9db5  95 18		 sta $18,x
$19:9db7  7c 9a 48	  jmp ($489a,x)
$19:9dba  c9 60 c9	  cmp #$c960
$19:9dbd  00 ea		 brk #$ea
$19:9dbf  00 e0		 brk #$e0
$19:9dc1  02 ed		 cop #$ed
$19:9dc3  43 e1		 eor $e1,s
$19:9dc5  07 e3		 ora [$e3]
$19:9dc7  01 01		 ora ($01,x)
$19:9dc9  01 67		 ora ($67,x)
$19:9dcb  c9 60 c9	  cmp #$c960
$19:9dce  c9 24 c9	  cmp #$c924
$19:9dd1  0c 5d ad	  tsb $ad5d
$19:9dd4  ae 18 b0	  ldx $b018
$19:9dd7  0c 5b b2	  tsb $b25b
$19:9dda  30 c8		 bmi $9da4
$19:9ddc  18			clc
$19:9ddd  5d b5 b7	  eor $b7b5,x
$19:9de0  b4 b0		 ldy $b0,x
$19:9de2  b0 ad		 bcs $9d91
$19:9de4  60			rts
$19:9de5  5b			tcd
$19:9de6  b2 18		 lda ($18)
$19:9de8  68			pla
$19:9de9  c8			iny
$19:9dea  0c c9 0c	  tsb $0cc9
$19:9ded  5d ad ae	  eor $aead,x
$19:9df0  18			clc
$19:9df1  b0 0c		 bcs $9dff
$19:9df3  5b			tcd
$19:9df4  b2 30		 lda ($30)
$19:9df6  c8			iny
$19:9df7  18			clc
$19:9df8  5d b5 b7	  eor $b7b5,x
$19:9dfb  b4 b0		 ldy $b0,x
$19:9dfd  b0 ad		 bcs $9dac
$19:9dff  60			rts
$19:9e00  5b			tcd
$19:9e01  b2 18		 lda ($18)
$19:9e03  68			pla
$19:9e04  c8			iny
$19:9e05  48			pha
$19:9e06  c9 e4 ea	  cmp #$eae4
$19:9e09  00 e0		 brk #$e0
$19:9e0b  03 ed		 ora $ed,s
$19:9e0d  50 e1		 bvc $9df0
$19:9e0f  07 e3		 ora [$e3]
$19:9e11  30 1e		 bmi $9e31
$19:9e13  18			clc
$19:9e14  24 c9		 bit $c9
$19:9e16  0c 5d b2	  tsb $b25d
$19:9e19  b9 18 b9	  lda $b918,y
$19:9e1c  0c 5b b9	  tsb $b95b
$19:9e1f  18			clc
$19:9e20  c8			iny
$19:9e21  18			clc
$19:9e22  5d b7 b7	  eor $b7b7,x
$19:9e25  18			clc
$19:9e26  5b			tcd
$19:9e27  b5 18		 lda $18,x
$19:9e29  5d b4 b2	  eor $b2b4,x
$19:9e2c  b2 b2		 lda ($b2)
$19:9e2e  24 b4		 bit $b4
$19:9e30  3c b5 0c	  bit $0cb5,x
$19:9e33  b5 b2		 lda $b2,x
$19:9e35  b2 b0		 lda ($b0)
$19:9e37  18			clc
$19:9e38  b2 0c		 lda ($0c)
$19:9e3a  b5 0c		 lda $0c,x
$19:9e3c  5b			tcd
$19:9e3d  b7 18		 lda [$18],y
$19:9e3f  c8			iny
$19:9e40  18			clc
$19:9e41  5d b5 b4	  eor $b4b5,x
$19:9e44  b0 60		 bcs $9ea6
$19:9e46  5b			tcd
$19:9e47  b2 48		 lda ($48)
$19:9e49  c8			iny
$19:9e4a  06 6d		 asl $6d
$19:9e4c  b2 b4		 lda ($b4)
$19:9e4e  b5 ab		 lda $ab,x
$19:9e50  ed 46 60	  sbc $6046
$19:9e53  5b			tcd
$19:9e54  b9 18 c8	  lda $c818,y
$19:9e57  0c c9 0c	  tsb $0cc9
$19:9e5a  5d b5 18	  eor $18b5,x
$19:9e5d  b4 b5		 ldy $b5,x
$19:9e5f  60			rts
$19:9e60  5b			tcd
$19:9e61  b7 30		 lda [$30],y
$19:9e63  5d b9 b5	  eor $b5b9,x
$19:9e66  60			rts
$19:9e67  5b			tcd
$19:9e68  b2 18		 lda ($18)
$19:9e6a  c8			iny
$19:9e6b  0c c9 0c	  tsb $0cc9
$19:9e6e  5d b5 18	  eor $18b5,x
$19:9e71  b4 b5		 ldy $b5,x
$19:9e73  60			rts
$19:9e74  5b			tcd
$19:9e75  b9 48 c8	  lda $c848,y
$19:9e78  06 4d		 asl $4d
$19:9e7a  b2 b4		 lda ($b4)
$19:9e7c  b5 ab		 lda $ab,x
$19:9e7e  60			rts
$19:9e7f  5b			tcd
$19:9e80  b9 18 c8	  lda $c818,y
$19:9e83  0c c9 0c	  tsb $0cc9
$19:9e86  5d b5 18	  eor $18b5,x
$19:9e89  b4 b5		 ldy $b5,x
$19:9e8b  60			rts
$19:9e8c  5b			tcd
$19:9e8d  b7 30		 lda [$30],y
$19:9e8f  5d b9 b5	  eor $b5b9,x
$19:9e92  60			rts
$19:9e93  5b			tcd
$19:9e94  b2 18		 lda ($18)
$19:9e96  c8			iny
$19:9e97  0c c9 0c	  tsb $0cc9
$19:9e9a  5d b5 18	  eor $18b5,x
$19:9e9d  b4 b5		 ldy $b5,x
$19:9e9f  24 b4		 bit $b4
$19:9ea1  3c 5b b2	  bit $b25b,x
$19:9ea4  60			rts
$19:9ea5  c8			iny
$19:9ea6  0c 5d a1	  tsb $a15d
$19:9ea9  18			clc
$19:9eaa  a2 a6 a9	  ldx #$a9a6
$19:9ead  0c 5b ab	  tsb $ab5b
$19:9eb0  c8			iny
$19:9eb1  18			clc
$19:9eb2  5d a9 a8	  eor $a8a9,x
$19:9eb5  24 a9		 bit $a9
$19:9eb7  a8			tay
$19:9eb8  3c 59 a6	  bit $a659,x
$19:9ebb  58			cli
$19:9ebc  c8			iny
$19:9ebd  01 c9		 ora ($c9,x)
$19:9ebf  00 00		 brk #$00
$19:9ec1  2c 00 34	  bit $3400
$19:9ec4  2c 53 73	  bit $7353
$19:9ec7  6f 75 ae 75   adc $75ae75
$19:9ecb  e4 75		 cpx $75
$19:9ecd  ff 75 35 76   sbc $763575,x
$19:9ed1  50 76		 bvc $9f49
$19:9ed3  6b			rtl
$19:9ed4  76 64		 ror $64,x
$19:9ed6  8c 64 8c	  sty $8c64
$19:9ed9  9c 99 00	  stz $0099
$19:9edc  9c 49 9e	  stz $9e49
$19:9edf  49 9e 14	  eor #$149e
$19:9ee2  b2 55		 lda ($55)
$19:9ee4  b6 94		 ldx $94,y
$19:9ee6  b6 94		 ldx $94,y
$19:9ee8  b6 f9		 ldx $f9,y
$19:9eea  ba			tsx
$19:9eeb  f9 ba e3	  sbc $e3ba,y
$19:9eee  c4 e3		 cpy $e3
$19:9ef0  c4 02		 cpy $02
$19:9ef2  00 fd		 brk #$fd
$19:9ef4  0f c5 c7 00   ora $00c7c5
$19:9ef8  00 0b		 brk #$0b
$19:9efa  13 14		 ora ($14,s),y
$19:9efc  15 1f		 ora $1f,x
$19:9efe  16 1e		 asl $1e,x
$19:9f00  17 1d		 ora [$1d],y
$19:9f02  18			clc
$19:9f03  19 1a 03	  ora $031a,y
$19:9f06  06 00		 asl $00
$19:9f08  12 80		 ora ($80)
$19:9f0a  3b			tsc
$19:9f0b  fd ec 92	  sbc $92ec,x
$19:9f0e  19 14 8e	  ora $8e14,y
$19:9f11  47 24		 eor [$24]
$19:9f13  92 81		 sta ($81)
$19:9f15  14 24		 trb $24
$19:9f17  32 8c		 and ($8c)
$19:9f19  76 93		 ror $93,x
$19:9f1b  e3 f1		 sbc $f1,s
$19:9f1d  96 82		 stx $82,y
$19:9f1f  42 01		 wdm #$01
$19:9f21  26 c5		 rol $c5
$19:9f23  64 b3		 stz $b3
$19:9f25  3a			dec a
$19:9f26  8d 0e 9c	  sta $9c0e
$19:9f29  32 3f		 and ($3f)
$19:9f2b  1c 46 30	  trb $3046
$19:9f2e  58			cli
$19:9f2f  01 f1		 ora ($f1,x)
$19:9f31  cc e9 b3	  cpy $b3e9
$19:9f34  58			cli
$19:9f35  cc 46 94	  cpy $9446
$19:9f38  52 38		 eor ($38)
$19:9f3a  9d fe db	  sta $dbfe,x
$19:9f3d  7c 1f 1c	  jmp ($1c1f,x)
$19:9f40  de 68 76	  dec $7668,x
$19:9f43  1d 6d b0	  ora $b06d,x
$19:9f46  f4 31 58	  pea $5831
$19:9f49  9d dc 83	  sta $83dc,x
$19:9f4c  6a			ror a
$19:9f4d  1f 1c ae 48   ora $48ae1c,x
$19:9f51  96 1d		 stx $1d,y
$19:9f53  77 68		 adc [$68],y
$19:9f55  6e b1 58	  ror $58b1
$19:9f58  fd ee cf	  sbc $cfee,x
$19:9f5b  68			pla
$19:9f5c  1f 1c 46 23   ora $23461c,x
$19:9f60  1a			inc a
$19:9f61  4c 09 06	  jmp $0609
$19:9f64  c3 73		 cmp $73,s
$19:9f66  8e f5 fc	  stx $fcf5
$19:9f69  89 61 21	  bit #$2161
$19:9f6c  94 e3		 sty $e3,x
$19:9f6e  bd a3 b0	  lda $b0a3,x
$19:9f71  db			stp
$19:9f72  95 cb		 sta $cb,x
$19:9f74  db			stp
$19:9f75  93 fa		 sta ($fa,s),y
$19:9f77  12 c0		 ora ($c0)
$19:9f79  40			rti
$19:9f7a  1e 9f 51	  asl $519f,x
$19:9f7d  2c 4c e5	  bit $e54c
$19:9f80  88			dey
$19:9f81  c9 0e 80	  cmp #$800e
$19:9f84  fc 38 83	  jsr ($8338,x)
$19:9f87  e0 95 cb	  cpx #$cb95
$19:9f8a  fa			plx
$19:9f8b  62 0c 61	  per $009a
$19:9f8e  90 04		 bcc $9f94
$19:9f90  01 f2		 ora ($f2,x)
$19:9f92  46 09		 lsr $09
$19:9f94  5c 71 62 c0   jml $c06271
$19:9f98  c6 8f		 dec $8f
$19:9f9a  03 6e		 ora $6e,s
$19:9f9c  20 0f 5f	  jsr $5f0f
$19:9f9f  bb			tyx
$19:9fa0  1f bc da 13   ora $13dabc,x
$19:9fa4  40			rti
$19:9fa5  8e 04 70	  stx $7004
$19:9fa8  3a			dec a
$19:9fa9  89 80 72	  bit #$7280
$19:9fac  65 31		 adc $31
$19:9fae  73 38		 adc ($38,s),y
$19:9fb0  c0 73 d9	  cpy #$d973
$19:9fb3  86 24		 stx $24
$19:9fb5  6c 04 01	  jmp ($0104)
$19:9fb8  9c d3 67	  stz $67d3
$19:9fbb  4b			phk
$19:9fbc  61 b2		 adc ($b2,x)
$19:9fbe  73 2e		 adc ($2e,s),y
$19:9fc0  e0 00 ae	  cpx #$ae00
$19:9fc3  f7 90		 sbc [$90],y
$19:9fc5  85 06		 sta $06
$19:9fc7  49 25 7d	  eor #$7d25
$19:9fca  a0 10 a5	  ldy #$a510
$19:9fcd  1f 16 90 c9   ora $c99016,x
$19:9fd1  df a3 22 07   cmp $0722a3,x
$19:9fd5  84 b4		 sty $b4
$19:9fd7  00 39		 brk #$39
$19:9fd9  2d 27 c4	  and $c427
$19:9fdc  86 01		 stx $01
$19:9fde  40			rti
$19:9fdf  37 8f		 and [$8f],y
$19:9fe1  b9 52 02	  lda $0252,y
$19:9fe4  a1 c5		 lda ($c5,x)
$19:9fe6  e2 34		 sep #$34
$19:9fe8  bf 1c 68 50   lda $50681c,x
$19:9fec  13 e2		 ora ($e2,s),y
$19:9fee  73 05		 adc ($05,s),y
$19:9ff0  c1 6d		 cmp ($6d,x)
$19:9ff2  ba			tsx
$19:9ff3  db			stp
$19:9ff4  ec 84 be	  cpx $be84
$19:9ff7  64 5f		 stz $5f
$19:9ff9  1f b3 11 7a   ora $7a11b3,x
$19:9ffd  fb			xce
$19:9ffe  ac 88 6c	  ldy $6c88
$19:a001  65 18		 adc $18
$19:a003  ec a2 74	  cpx $74a2
$19:a006  1b			tcs
$19:a007  08			php
$19:a008  78			sei
$19:a009  0f 7e bf 33   ora $33bf7e
$19:a00d  98			tya
$19:a00e  61 86		 adc ($86,x)
$19:a010  fd 78 25	  sbc $2578,x
$19:a013  d4 fe		 pei ($fe)
$19:a015  e7 9c		 sbc [$9c]
$19:a017  41 a7		 eor ($a7,x)
$19:a019  62 36 c3	  per $6352
$19:a01c  73 8e		 adc ($8e,s),y
$19:a01e  d7 66		 cmp [$66],y
$19:a020  f3 fa		 sbc ($fa,s),y
$19:a022  ad 1b 11	  lda $111b
$19:a025  8c 21 af	  sty $af21
$19:a028  d1 e4		 cmp ($e4),y
$19:a02a  b2 d9		 lda ($d9)
$19:a02c  6c 42 22	  jmp ($2242)
$19:a02f  3e 58 85	  rol $8558,x
$19:a032  18			clc
$19:a033  64 fd		 stz $fd
$19:a035  ae 42 d9	  ldx $d942
$19:a038  ed 0d e5	  sbc $e50d
$19:a03b  93 c9		 sta ($c9,s),y
$19:a03d  6b			rtl
$19:a03e  14 61		 trb $61
$19:a040  e9 f5		 sbc #$f5
$19:a042  62 04 00	  per $a049
$19:a045  e4 0d		 cpx $0d
$19:a047  99 c0 73	  sta $73c0,y
$19:a04a  21 10		 and ($10,x)
$19:a04c  ca			dex
$19:a04d  28			plp
$19:a04e  c3 ef		 cmp $ef,s
$19:a050  ee 51 8a	  inc $8a51
$19:a053  5c 36 3b 8c   jml $8c3b36
$19:a057  76 73		 ror $73,x
$19:a059  4c 75 15	  jmp $1575
$19:a05c  a0 e4		 ldy #$e4
$19:a05e  cc a1 94	  cpy $94a1
$19:a061  c7 e3		 cmp [$e3]
$19:a063  92 61		 sta ($61)
$19:a065  ab			plb
$19:a066  d3 66		 cmp ($66,s),y
$19:a068  b2 fa		 lda ($fa)
$19:a06a  0d 0e 8b	  ora $8b0e
$19:a06d  40			rti
$19:a06e  d2 10		 cmp ($10)
$19:a070  88			dey
$19:a071  01 48		 ora ($48,x)
$19:a073  0c 52 20	  tsb $2052
$19:a076  e0 c8		 cpx #$c8
$19:a078  e4 92		 cpx $92
$19:a07a  57 83		 eor [$83],y
$19:a07c  4a			lsr a
$19:a07d  34 7a		 bit $7a,x
$19:a07f  1d 4e 77	  ora $774e,x
$19:a082  18			clc
$19:a083  23 17		 and $17,s
$19:a085  c1 15		 cmp ($15,x)
$19:a087  48			pha
$19:a088  54 19 7d	  mvn $7d,$19
$19:a08b  fe fb e2	  inc $e2fb,x
$19:a08e  34 0c		 bit $0c,x
$19:a090  66 20		 ror $20
$19:a092  2e 18 c5	  rol $c518
$19:a095  d0 0e		 bne $a0a5
$19:a097  8b			phb
$19:a098  6e 51 19	  ror $1951
$19:a09b  2e db ac	  rol $acdb
$19:a09e  28			plp
$19:a09f  0d f6 2f	  ora $2ff6
$19:a0a2  2a			rol a
$19:a0a3  bd 05 68	  lda $6805,x
$19:a0a6  6c 1a 00	  jmp ($001a)
$19:a0a9  0c 09 07	  tsb $0709
$19:a0ac  5c de 1b 5d   jml $5d1bde
$19:a0b0  f6 2b		 inc $2b,x
$19:a0b2  10 a8		 bpl $a05c
$19:a0b4  16 80		 asl $80,x
$19:a0b6  25 c0		 and $c0
$19:a0b8  7c 08 c4	  jmp ($c408,x)
$19:a0bb  c4 64		 cpy $64
$19:a0bd  b4 3a		 ldy $3a,x
$19:a0bf  76 d8		 ror $d8,x
$19:a0c1  93 60		 sta ($60,s),y
$19:a0c3  ac 0e a2	  ldy $a20e
$19:a0c6  26 bf		 rol $bf
$19:a0c8  bb			tyx
$19:a0c9  ef fd 49 86   sbc $8649fd
$19:a0cd  73 3a		 adc ($3a,s),y
$19:a0cf  4d 75 b8	  eor $b875
$19:a0d2  66 75		 ror $75
$19:a0d4  1a			inc a
$19:a0d5  97 18		 sta [$18],y
$19:a0d7  13 53		 ora ($53,s),y
$19:a0d9  61 b9		 adc ($b9,x)
$19:a0db  c7 64		 cmp [$64]
$19:a0dd  91 40		 sta ($40),y
$19:a0df  d3 1c		 cmp ($1c,s),y
$19:a0e1  b6 34		 ldx $34,y
$19:a0e3  9c 67 40	  stz $4067
$19:a0e6  03 86		 ora $86,s
$19:a0e8  73 54		 adc ($54,s),y
$19:a0ea  e2 1c		 sep #$1c
$19:a0ec  4c be 64	  jmp $64be
$19:a0ef  38			sec
$19:a0f0  02 91		 cop #$91
$19:a0f2  e6 74		 inc $74
$19:a0f4  c8			iny
$19:a0f5  90 ce		 bcc $a0c5
$19:a0f7  e2 13		 sep #$13
$19:a0f9  a1 00		 lda ($00,x)
$19:a0fb  dd 9c 4b	  cmp $4b9c,x
$19:a0fe  17 88		 ora [$88],y
$19:a100  cd a6 05	  cmp $05a6
$19:a103  56 50		 lsr $50,x
$19:a105  02 40		 cop #$40
$19:a107  0d c0 86	  ora $86c0
$19:a10a  39 5c de	  and $de5c,y
$19:a10d  7f 34 4c 17   adc $174c34,x
$19:a111  90 64		 bcc $a177
$19:a113  89 80		 bit #$80
$19:a115  bf 03 21 19   lda $192103,x
$19:a119  83 da		 sta $da,s
$19:a11b  db			stp
$19:a11c  29 36		 and #$36
$19:a11e  29 8c		 and #$8c
$19:a120  39 8d 1b	  and $1b8d,y
$19:a123  98			tya
$19:a124  72 79		 adc ($79)
$19:a126  23 c8		 and $c8,s
$19:a128  68			pla
$19:a129  f4 0e f0	  pea $f00e
$19:a12c  6b			rtl
$19:a12d  0e ab 25	  asl $25ab
$19:a130  a0 d0		 ldy #$d0
$19:a132  ea			nop
$19:a133  73 d9		 adc ($d9,s),y
$19:a135  ed 46 8b	  sbc $8b46
$19:a138  25 ad		 and $ad
$19:a13a  93 62		 sta ($62,s),y
$19:a13c  f1 85		 sbc ($85),y
$19:a13e  60			rts
$19:a13f  cb			wai
$19:a140  19 85 ae	  ora $ae85,y
$19:a143  06 a1		 asl $a1
$19:a145  cf 66 26 13   cmp $132666
$19:a149  19 73 94	  ora $9473,y
$19:a14c  82 21 8c	  brl $2d70
$19:a14f  d7 aa		 cmp [$aa],y
$19:a151  41 90		 eor ($90,x)
$19:a153  2d d0 77	  and $77d0
$19:a156  81 98		 sta ($98,x)
$19:a158  31 3b		 and ($3b),y
$19:a15a  fe b3 51	  inc $51b3,x
$19:a15d  32 c2		 and ($c2)
$19:a15f  f1 08		 sbc ($08),y
$19:a161  07 c9		 ora [$c9]
$19:a163  c2 1d		 rep #$1d
$19:a165  76 18		 ror $18,x
$19:a167  84 c9		 sty $c9
$19:a169  ba			tsx
$19:a16a  01 f2		 ora ($f2,x)
$19:a16c  c7 ef		 cmp [$ef]
$19:a16e  1a			inc a
$19:a16f  44 e6 1f	  mvp $1f,$e6
$19:a172  bc 86 45	  ldy $4586,x
$19:a175  24 92		 bit $92
$19:a177  bb			tyx
$19:a178  c3 ee		 cmp $ee,s
$19:a17a  e1 26		 sbc ($26,x)
$19:a17c  20 39 85	  jsr $8539
$19:a17f  de 09 d0	  dec $d009,x
$19:a182  77 87		 adc [$87],y
$19:a184  bd c2 2d	  lda $2dc2,x
$19:a187  31 d7		 and ($d7),y
$19:a189  e4 b4		 cpx $b4
$19:a18b  f2 6c		 sbc ($6c)
$19:a18d  82 b4 06	  brl $a844
$19:a190  22 e1 15 10   jsl $1015e1
$19:a194  b7 c3		 lda [$c3],y
$19:a196  10 1f		 bpl $a1b7
$19:a198  06 68		 asl $68
$19:a19a  0c 47 1e	  tsb $1e47
$19:a19d  cf 0d 96 e3   cmp $e3960d
$19:a1a1  1d a3 ca	  ora $caa3,x
$19:a1a4  13 86		 ora ($86,s),y
$19:a1a6  01 21		 ora ($21,x)
$19:a1a8  94 e3		 sty $e3,x
$19:a1aa  bd 3e a7	  lda $a73e,x
$19:a1ad  b1 66		 lda ($66),y
$19:a1af  41 40		 eor ($40,x)
$19:a1b1  3e 17 70	  rol $7017,x
$19:a1b4  fd 7e fe	  sbc $fe7e,x
$19:a1b7  dc 43 ec	  jml [$ec43]
$19:a1ba  35 3f		 and $3f,x
$19:a1bc  d1 60		 cmp ($60),y
$19:a1be  6a			ror a
$19:a1bf  24 32		 bit $32
$19:a1c1  33 10		 and ($10,s),y
$19:a1c3  fc 84 e0	  jsr ($e084,x)
$19:a1c6  26 10		 rol $10
$19:a1c8  c1 67		 cmp ($67,x)
$19:a1ca  4f e0 72 11   eor $1172e0
$19:a1ce  a0 ed 86	  ldy #$86ed
$19:a1d1  e0 10 07	  cpx #$0710
$19:a1d4  88			dey
$19:a1d5  67 51		 adc [$51]
$19:a1d7  e2 83		 sep #$83
$19:a1d9  4e be d7	  lsr $d7be
$19:a1dc  6c 59 0c	  jmp ($0c59)
$19:a1df  de 77 43	  dec $4377,x
$19:a1e2  a2 03 06	  ldx #$0603
$19:a1e5  49 8c		 eor #$8c
$19:a1e7  0f 41 5b 86   ora $865b41
$19:a1eb  ac 32 21	  ldy $2132
$19:a1ee  31 c6		 and ($c6),y
$19:a1f0  63 5a		 adc $5a,s
$19:a1f2  c0 05 06	  cpy #$0605
$19:a1f5  c8			iny
$19:a1f6  e5 72		 sbc $72
$19:a1f8  4f b0 19 96   eor $9619b0
$19:a1fc  db			stp
$19:a1fd  6e 88 03	  ror $0388
$19:a200  c0 01 cb	  cpy #$cb01
$19:a203  47 a1		 eor [$a1]
$19:a205  cb			wai
$19:a206  00 81		 brk #$81
$19:a208  0e 22 33	  asl $3322
$19:a20b  74 96		 stz $96,x
$19:a20d  54 22 a2	  mvn $a2,$22
$19:a210  34 45		 bit $45,x
$19:a212  0a			asl a
$19:a213  18			clc
$19:a214  86 72		 stx $72
$19:a216  65 22		 adc $22
$19:a218  0b			phd
$19:a219  ec 37 38	  cpx $3837
$19:a21c  ec 60 fe	  cpx $fe60
$19:a21f  91 40		 sta ($40),y
$19:a221  d5 0c		 cmp $0c,x
$19:a223  7e f3 68	  ror $68f3,x
$19:a226  62 ad d9	  per $7bd6
$19:a229  3a			dec a
$19:a22a  8d 60 6f	  sta $6f60
$19:a22d  0f 7a 02 f1   ora $f1027a
$19:a231  18			clc
$19:a232  f7 21		 sbc [$21],y
$19:a234  0d 1f 16	  ora $161f
$19:a237  0f 0d 38 85   ora $85380d
$19:a23b  3b			tsc
$19:a23c  22 63 75 83   jsl $837563
$19:a240  50 46		 bvc $a288
$19:a242  43 b0		 eor $b0,s
$19:a244  d8			cld
$19:a245  f6 36		 inc $36,x
$19:a247  67 11		 adc [$11]
$19:a249  2d 8e 4b	  and $4b8e
$19:a24c  1f bd d9 34   ora $34d9bd,x
$19:a250  43 71		 eor $71,s
$19:a252  8e 4e 83	  stx $834e
$19:a255  40			rti
$19:a256  5a			phy
$19:a257  81 94		 sta ($94,x)
$19:a259  c9 e9		 cmp #$e9
$19:a25b  f5 80		 sbc $80,x
$19:a25d  f0 07		 beq $a266
$19:a25f  87 d3		 sta [$d3]
$19:a261  11 ef		 ora ($ef),y
$19:a263  07 83		 ora [$83]
$19:a265  74 32		 stz $32,x
$19:a267  5a			phy
$19:a268  0c 96 a3	  tsb $a396
$19:a26b  4e cf 16	  lsr $16cf
$19:a26e  a0 6b f2	  ldy #$f26b
$19:a271  5a			phy
$19:a272  7f 4f ab 1f   adc $1fab4f,x
$19:a276  2d 92 49	  and $4992
$19:a279  75 41		 adc $41,x
$19:a27b  d0 d1		 bne $a24e
$19:a27d  68			pla
$19:a27e  00 21		 brk #$21
$19:a280  a9 cc		 lda #$cc
$19:a282  65 34		 adc $34
$19:a284  7f 4d 27 c7   adc $c7274d,x
$19:a288  13 27		 ora ($27,s),y
$19:a28a  7b			tdc
$19:a28b  87 df		 sta [$df]
$19:a28d  11 ed		 ora ($ed),y
$19:a28f  c4 65		 cpy $65
$19:a291  73 9a		 adc ($9a,s),y
$19:a293  6c f3 bc	  jmp ($bcf3)
$19:a296  1c 40 0d	  trb $0d40
$19:a299  07 10		 ora [$10]
$19:a29b  63 04		 adc $04,s
$19:a29d  21 88		 and ($88,x)
$19:a29f  c9 66		 cmp #$66
$19:a2a1  f4 c2 70	  pea $70c2
$19:a2a4  cc 08 03	  cpy $0308
$19:a2a7  1b			tcs
$19:a2a8  27 ca		 and [$ca]
$19:a2aa  1b			tcs
$19:a2ab  43 6c		 eor $6c,s
$19:a2ad  bc 00 00	  ldy $0000,x
$19:a2b0  05 83		 ora $83
$19:a2b2  4d 9a c6	  eor $c69a
$19:a2b5  cb			wai
$19:a2b6  e6 33		 inc $33
$19:a2b8  2f 6a 80 55   and $55806a
$19:a2bc  60			rts
$19:a2bd  21 0c		 and ($0c,x)
$19:a2bf  de 7f 35	  dec $357f,x
$19:a2c2  89 97		 bit #$97
$19:a2c4  cc a0 10	  cpy $10a0
$19:a2c7  01 60		 ora ($60,x)
$19:a2c9  2c 43 6b	  bit $6b43
$19:a2cc  b6 19		 ldx $19,y
$19:a2ce  08			php
$19:a2cf  90 01		 bcc $a2d2
$19:a2d1  a1 21		 lda ($21,x)
$19:a2d3  91 c9		 sta ($c9),y
$19:a2d5  4a			lsr a
$19:a2d6  80 c1		 bra $a299
$19:a2d8  14 c9		 trb $c9
$19:a2da  e2 05		 sep #$05
$19:a2dc  a1 26		 lda ($26,x)
$19:a2de  c8			iny
$19:a2df  49 d2		 eor #$d2
$19:a2e1  90 4a		 bcc $a32d
$19:a2e3  19 80 f4	  ora $f480,y
$19:a2e6  19 02 72	  ora $7202,y
$19:a2e9  62 d9 40	  per $e3c5
$19:a2ec  1a			inc a
$19:a2ed  02 c7		 cop #$c7
$19:a2ef  0e cb 2c	  asl $2ccb
$19:a2f2  43 83		 eor $83,s
$19:a2f4  26 c8		 rol $c8
$19:a2f6  cb			wai
$19:a2f7  64 ae		 stz $ae
$19:a2f9  21 67		 and ($67,x)
$19:a2fb  87 61		 sta [$61]
$19:a2fd  a8			tay
$19:a2fe  25 91		 and $91
$19:a300  93 62		 sta ($62,s),y
$19:a302  c3 a4		 cmp $a4,s
$19:a304  11 07		 ora ($07),y
$19:a306  10 ba		 bpl $a2c2
$19:a308  c0 38 33	  cpy #$3338
$19:a30b  09 71		 ora #$71
$19:a30d  b4 1c		 ldy $1c,x
$19:a30f  25 92		 and $92
$19:a311  ca			dex
$19:a312  66 73		 ror $73
$19:a314  d9 8d 18	  cmp $188d,y
$19:a317  34 20		 bit $20,x
$19:a319  07 c1		 ora [$c1]
$19:a31b  61 86		 adc ($86,x)
$19:a31d  20 6a 79	  jsr $796a
$19:a320  dc a3 ec	  jml [$eca3]
$19:a323  89 a1		 bit #$a1
$19:a325  a1 c9		 lda ($c9,x)
$19:a327  00 03		 brk #$03
$19:a329  4f ab cf e7   eor $e7cfab
$19:a32d  f5 59		 sbc $59,x
$19:a32f  20 59 13	  jsr $1359
$19:a332  41 da		 eor ($da,x)
$19:a334  32 62		 and ($62)
$19:a336  b8			clv
$19:a337  14 04		 trb $04
$19:a339  e6 99		 inc $99
$19:a33b  77 79		 adc [$79],y
$19:a33d  8c 00 c2	  sty $c200
$19:a340  98			tya
$19:a341  bc 96 b8	  ldy $b896,x
$19:a344  9a			txs
$19:a345  12 19		 ora ($19)
$19:a347  4e 38 80	  lsr $8038
$19:a34a  26 f2		 rol $f2
$19:a34c  da			phx
$19:a34d  ef b1 79 c7   sbc $c779b1
$19:a351  81 85		 sta ($85,x)
$19:a353  14 34		 trb $34
$19:a355  38			sec
$19:a356  a7 81		 lda [$81]
$19:a358  e3 f7		 sbc $f7,s
$19:a35a  87 f7		 sta [$f7]
$19:a35c  78			sei
$19:a35d  1f d4 28 3b   ora $3b28d4,x
$19:a361  0d 8a 48	  ora $488a
$19:a364  07 8b		 ora [$8b]
$19:a366  ed 50 8e	  sbc $8e50
$19:a369  c9 4a		 cmp #$4a
$19:a36b  05 53		 ora $53
$19:a36d  78			sei
$19:a36e  1a			inc a
$19:a36f  c8			iny
$19:a370  f4 6c 11	  pea $116c
$19:a373  c4 66		 cpy $66
$19:a375  42 05		 wdm #$05
$19:a377  f7 f9		 sbc [$f9],y
$19:a379  29 c3		 and #$c3
$19:a37b  27 9e		 and [$9e]
$19:a37d  cf 6a 34 4e   cmp $4e346a
$19:a381  11 30		 ora ($30),y
$19:a383  1e bb 44	  asl $44bb,x
$19:a386  c5 06		 cmp $06
$19:a388  a8			tay
$19:a389  69 b3		 adc #$b3
$19:a38b  19 2d 3e	  ora $3e2d,y
$19:a38e  51 e2		 eor ($e2),y
$19:a390  5a			phy
$19:a391  f4 31 b9	  pea $b931
$19:a394  47 40		 eor [$40]
$19:a396  e2 08		 sep #$08
$19:a398  d4 67		 pei ($67)
$19:a39a  14 0d		 trb $0d
$19:a39c  07 20		 ora [$20]
$19:a39e  e7 f3		 sbc [$f3]
$19:a3a0  5a			phy
$19:a3a1  7c 96 31	  jmp ($3196,x)
$19:a3a4  56 31		 lsr $31,x
$19:a3a6  c8			iny
$19:a3a7  d9 a8 3d	  cmp $3da8,y
$19:a3aa  ca			dex
$19:a3ab  b2 d7		 lda ($d7)
$19:a3ad  64 b1		 stz $b1
$19:a3af  b2 f9		 lda ($f9)
$19:a3b1  8a			txa
$19:a3b2  f0 23		 beq $a3d7
$19:a3b4  d1 85		 cmp ($85),y
$19:a3b6  58			cli
$19:a3b7  2e 8a 5d	  rol $5d8a
$19:a3ba  8b			phb
$19:a3bb  5d 04 ca	  eor $ca04,x
$19:a3be  43 23		 eor $23,s
$19:a3c0  92 47		 sta ($47)
$19:a3c2  57 83		 eor [$83],y
$19:a3c4  31 99		 and ($99),y
$19:a3c6  00 02		 brk #$02
$19:a3c8  60			rts
$19:a3c9  d2 29		 cmp ($29)
$19:a3cb  33 20		 and ($20,s),y
$19:a3cd  00 00		 brk #$00
$19:a3cf  df 96 b8 e5   cmp $e5b896,x
$19:a3d3  72 59		 adc ($59)
$19:a3d5  4c 97 d1	  jmp $d197
$19:a3d8  64 06		 stz $06
$19:a3da  41 c9		 eor ($c9,x)
$19:a3dc  27 03		 and [$03]
$19:a3de  45 92		 eor $92
$19:a3e0  c9 6a		 cmp #$6a
$19:a3e2  73 c6		 adc ($c6,s),y
$19:a3e4  c0 c4 7b	  cpy #$7bc4
$19:a3e7  7d 3e af	  adc $af3e,x
$19:a3ea  be 49 de	  ldx $de49,y
$19:a3ed  1a			inc a
$19:a3ee  1c 96 8b	  trb $8b96
$19:a3f1  2d a6 cd	  and $cda6
$19:a3f4  65 b1		 adc $b1
$19:a3f6  0a			asl a
$19:a3f7  b2 09		 lda ($09)
$19:a3f9  9e 23 fb	  stz $fb23,x
$19:a3fc  f7 cd		 sbc [$cd],y
$19:a3fe  2a			rol a
$19:a3ff  83 1b		 sta $1b,s
$19:a401  bf db 09 13   lda $1309db,x
$19:a405  7d 8a 39	  adc $398a,x
$19:a408  86 58		 stx $58
$19:a40a  44 3b 79	  mvp $79,$3b
$19:a40d  00 d1		 brk #$d1
$19:a40f  37 58		 and [$58],y
$19:a411  b3 50		 lda ($50,s),y
$19:a413  62 77 e3	  per $878d
$19:a416  36 1a		 rol $1a,x
$19:a418  06 d4		 asl $d4
$19:a41a  56 1e		 lsr $1e,x
$19:a41c  9c 7e f7	  stz $f77e
$19:a41f  65 b3		 adc $b3
$19:a421  da			phx
$19:a422  10 9b		 bpl $a3bf
$19:a424  74 91		 stz $91,x
$19:a426  0f bb d4 09   ora $09d4bb
$19:a42a  e0 52 62	  cpx #$6252
$19:a42d  e0 64 be	  cpx #$be64
$19:a430  5f 5c 40 14   eor $14405c,x
$19:a434  31 3b		 and ($3b),y
$19:a436  b9 07 64	  lda $6407,y
$19:a439  b0 99		 bcs $a3d4
$19:a43b  77 b0		 adc [$b0],y
$19:a43d  e4 f4		 cpx $f4
$19:a43f  64 f1		 stz $f1
$19:a441  ec 6c 91	  cpx $916c
$19:a444  03 b8		 ora $b8,s
$19:a446  c7 68		 cmp [$68]
$19:a448  f4 1a 1d	  pea $1d1a
$19:a44b  3e 67 3d	  rol $3d67,x
$19:a44e  a8			tay
$19:a44f  d3 a3		 cmp ($a3,s),y
$19:a451  c3 44		 cmp $44,s
$19:a453  8f 14 78 ad   sta $ad7814
$19:a457  87 39		 sta [$39]
$19:a459  a6 d3		 ldx $d3
$19:a45b  6a			ror a
$19:a45c  04 00		 tsb $00
$19:a45e  18			clc
$19:a45f  30 40		 bmi $a4a1
$19:a461  31 83		 and ($83),y
$19:a463  15 9b		 ora $9b,x
$19:a465  cf e7 f3 58   cmp $58f3e7
$19:a469  99 7b 40	  sta $407b,y
$19:a46c  65 c3		 adc $c3
$19:a46e  c1 92		 cmp ($92,x)
$19:a470  b7 03		 lda [$03],y
$19:a472  18			clc
$19:a473  c2 0c		 rep #$0c
$19:a475  96 26		 stx $26,y
$19:a477  4f 21 91 c9   eor $c99121
$19:a47b  66 0b		 ror $0b
$19:a47d  00 d2		 brk #$d2
$19:a47f  49 dd		 eor #$dd
$19:a481  82 ba 1c	  brl $c13e
$19:a484  6c 9e 4d	  jmp ($4d9e)
$19:a487  90 93		 bcc $a41c
$19:a489  c0 18 03	  cpy #$0318
$19:a48c  32 80		 and ($80)
$19:a48e  38			sec
$19:a48f  05 a0		 ora $a0
$19:a491  33 26		 and ($26,s),y
$19:a493  80 37		 bra $a4cc
$19:a495  c1 a0		 cmp ($a0,x)
$19:a497  39 6c ae	  and $ae6c,y
$19:a49a  33 11		 and ($11,s),y
$19:a49c  8c d7 e8	  sty $e8d7
$19:a49f  f2 59		 sbc ($59)
$19:a4a1  6c 43 e0	  jmp ($e043)
$19:a4a4  18			clc
$19:a4a5  c0 e0 07	  cpy #$07e0
$19:a4a8  d0 6f		 bne $a519
$19:a4aa  fa			plx
$19:a4ab  db			stp
$19:a4ac  ec 5e 20	  cpx $205e
$19:a4af  de 39 2f	  dec $2f39,x
$19:a4b2  ae 3e 5b	  ldx $5b3e
$19:a4b5  24 92		 bit $92
$19:a4b7  be 83 77	  ldx $7783,y
$19:a4ba  d7 25		 cmp [$25],y
$19:a4bc  8e 23 de	  stx $de23
$19:a4bf  f8			sed
$19:a4c0  17 c9		 ora [$c9],y
$19:a4c2  03 c4		 ora $c4,s
$19:a4c4  b4 5f		 ldy $5f,x
$19:a4c6  2f b3 e0 7e   and $7ee0b3
$19:a4ca  5f 46 30 7b   eor $7b3046,x
$19:a4ce  f1 fb		 sbc ($fb),y
$19:a4d0  c2 98		 rep #$98
$19:a4d2  09 03		 ora #$03
$19:a4d4  e8			inx
$19:a4d5  72 00		 adc ($00)
$19:a4d7  b0 fd		 bcs $a4d6
$19:a4d9  d8			cld
$19:a4da  c0 38 01	  cpy #$0138
$19:a4dd  80 97		 bra $a476
$19:a4df  07 da		 ora [$da]
$19:a4e1  f2 07		 sbc ($07)
$19:a4e3  90 7c		 bcc $a561
$19:a4e5  83 a3		 sta $a3,s
$19:a4e7  af ca 63 f7   lda $f763ca
$19:a4eb  a8			tay
$19:a4ec  c0 fe fa	  cpy #$fafe
$19:a4ef  c0 05 8a	  cpy #$8a05
$19:a4f2  63 06		 adc $06,s
$19:a4f4  bb			tyx
$19:a4f5  53 9e		 eor ($9e,s),y
$19:a4f7  cc 7d c4	  cpy $c47d
$19:a4fa  c1 f2		 cmp ($f2,x)
$19:a4fc  c4 63		 cpy $63
$19:a4fe  42 20		 wdm #$20
$19:a500  24 06		 bit $06
$19:a502  30 67		 bmi $a56b
$19:a504  14 61		 trb $61
$19:a506  9a			txs
$19:a507  f9 30 87	  sbc $8730,y
$19:a50a  1b			tcs
$19:a50b  bf db 88 c4   lda $c488db,x
$19:a50f  da			phx
$19:a510  59 af 70	  eor $70af,y
$19:a513  00 36		 brk #$36
$19:a515  c8			iny
$19:a516  50 3c		 bvc $a554
$19:a518  81 e8		 sta ($e8,x)
$19:a51a  f5 7a		 sbc $7a,x
$19:a51c  ad 61 00	  lda $0061
$19:a51f  37 bb		 and [$bb],y
$19:a521  31 90		 and ($90),y
$19:a523  48			pha
$19:a524  36 1b		 rol $1b,x
$19:a526  12 a0		 ora ($a0)
$19:a528  07 44		 ora [$44]
$19:a52a  10 03		 bpl $a52f
$19:a52c  71 29		 adc ($29),y
$19:a52e  06 cb		 asl $cb
$19:a530  64 54		 stz $54
$19:a532  0f ba 08 13   ora $1308ba
$19:a536  c2 f8		 rep #$f8
$19:a538  1f b8 dc 08   ora $08dcb8,x
$19:a53c  e1 f7		 sbc ($f7,x)
$19:a53e  02 81		 cop #$81
$19:a540  d8			cld
$19:a541  24 ff		 bit $ff
$19:a543  13 a0		 ora ($a0,s),y
$19:a545  bc 40 56	  ldy $5640,x
$19:a548  0f 20 3a 8c   ora $8c3a20
$19:a54c  bd cc 0c	  lda $0ccc,x
$19:a54f  b1 98		 lda ($98),y
$19:a551  cb			wai
$19:a552  b1 6c		 lda ($6c),y
$19:a554  93 68		 sta ($68,s),y
$19:a556  84 ca		 sty $ca
$19:a558  01 00		 ora ($00,x)
$19:a55a  6d 94 c1	  adc $c194
$19:a55d  b2 2d		 lda ($2d)
$19:a55f  b2 75		 lda ($75)
$19:a561  7b			tdc
$19:a562  ef c1 9e 1d   sbc $1d9ec1
$19:a566  f1 19		 sbc ($19),y
$19:a568  e6 89		 inc $89
$19:a56a  21 a5		 and ($a5,x)
$19:a56c  f8			sed
$19:a56d  fc 71 18	  jsr ($1871,x)
$19:a570  9e 7f 1b	  stz $1b7f,x
$19:a573  9c 23 31	  stz $3123
$19:a576  d8			cld
$19:a577  75 b8		 adc $b8,x
$19:a579  c3 d0		 cmp $d0,s
$19:a57b  2e 07 2f	  rol $2f07
$19:a57e  e7 c5		 sbc [$c5]
$19:a580  1f a7 2e 71   ora $712ea7,x
$19:a584  f3 f9		 sbc ($f9,s),y
$19:a586  f2 b1		 sbc ($b1)
$19:a588  58			cli
$19:a589  fe 6f 0f	  inc $0f6f,x
$19:a58c  88			dey
$19:a58d  23 3c		 and $3c,s
$19:a58f  69 30 3a	  adc #$3a30
$19:a592  9c 0e 4e	  stz $4e0e
$19:a595  3b			tsc
$19:a596  d7 f2		 cmp [$f2],y
$19:a598  25 80		 and $80
$19:a59a  8c f9 fc	  sty $fcf9
$19:a59d  72 b9		 adc ($b9)
$19:a59f  7b			tdc
$19:a5a0  72 7f		 adc ($7f)
$19:a5a2  43 6a		 eor $6a,s
$19:a5a4  93 03		 sta ($03,s),y
$19:a5a6  e6 68		 inc $68
$19:a5a8  15 00		 ora $00,x
$19:a5aa  0e 80 fc	  asl $fc80
$19:a5ad  bd 0e 99	  lda $990e,x
$19:a5b0  64 3f		 stz $3f
$19:a5b2  ab			plb
$19:a5b3  00 65		 brk #$65
$19:a5b5  01 f9		 ora ($f9,x)
$19:a5b7  7a			ply
$19:a5b8  a5 80		 lda $80
$19:a5ba  6a			ror a
$19:a5bb  10 f0		 bpl $a5ad
$19:a5bd  38			sec
$19:a5be  e2 33		 sep #$33
$19:a5c0  e6 71		 inc $71
$19:a5c2  09 a0		 ora #$a0
$19:a5c4  47 02		 eor [$02]
$19:a5c6  38			sec
$19:a5c7  1d 44 9e	  ora $9e44,x
$19:a5ca  a5 70		 lda $70
$19:a5cc  2b			pld
$19:a5cd  82 94 0a	  brl $b064
$19:a5d0  e1 d0		 sbc ($d0,x)
$19:a5d2  80 33		 bra $a607
$19:a5d4  c9 88		 cmp #$88
$19:a5d6  85 70		 sta $70
$19:a5d8  ea			nop
$19:a5d9  21 81		 and ($81,x)
$19:a5db  9e 65 b0	  stz $b065,x
$19:a5de  e1 39		 sbc ($39,x)
$19:a5e0  97 90		 sta [$90],y
$19:a5e2  cf 37 9f 81   cmp $819f37
$19:a5e6  3c 2b e1	  bit $e12b,x
$19:a5e9  e6 c5		 inc $c5
$19:a5eb  e2 34		 sep #$34
$19:a5ed  a1 e5		 lda ($e5,x)
$19:a5ef  c4 ab		 cpy $ab
$19:a5f1  01 70		 ora ($70,x)
$19:a5f3  5d 6e 70	  eor $706e,x
$19:a5f6  c9 9a		 cmp #$9a
$19:a5f8  a9 38		 lda #$38
$19:a5fa  e5 07		 sbc $07
$19:a5fc  95 3a		 sta $3a,x
$19:a5fe  0d 84 28	  ora $2884
$19:a601  87 f5		 sta [$f5]
$19:a603  9a			txs
$19:a604  1d 3f ec	  ora $ec3f,x
$19:a607  03 9e		 ora $9e,s
$19:a609  bc 16 68	  ldy $6816,x
$19:a60c  21 40		 and ($40,x)
$19:a60e  a2 0c		 ldx #$0c
$19:a610  c1 e9		 cmp ($e9,x)
$19:a612  b3 81		 lda ($81,s),y
$19:a614  48			pha
$19:a615  2c 62 e0	  bit $e062
$19:a618  72 4e		 adc ($4e)
$19:a61a  42 64		 wdm #$64
$19:a61c  13 c0		 ora ($c0,s),y
$19:a61e  19 41 8c	  ora $8c41,y
$19:a621  5c ac 52 08   jml $0852ac
$19:a625  97 a2		 sta [$a2],y
$19:a627  4a			lsr a
$19:a628  26 e0		 rol $e0
$19:a62a  23 e1		 and $e1,s
$19:a62c  ca			dex
$19:a62d  3c 3e 22	  bit $223e,x
$19:a630  3a			dec a
$19:a631  71 1a		 adc ($1a),y
$19:a633  4f 8b 90 38   eor $38908b
$19:a637  7d 34 80	  adc $8034,x
$19:a63a  a2 ce		 ldx #$ce
$19:a63c  01 ee		 ora ($ee,x)
$19:a63e  c4 32		 cpy $32
$19:a640  87 13		 sta [$13]
$19:a642  c1 e4		 cmp ($e4,x)
$19:a644  63 98		 adc $98,s
$19:a646  41 d3		 eor ($d3,x)
$19:a648  4e 8a e0	  lsr $e08a
$19:a64b  32 79		 and ($79)
$19:a64d  9c c6 53	  stz $53c6
$19:a650  1f 8e d1 e4   ora $e4d18e,x
$19:a654  8c 40 8a	  sty $8a40
$19:a657  13 38		 ora ($38,s),y
$19:a659  68			pla
$19:a65a  33 9a		 and ($9a,s),y
$19:a65c  6d 36 7b	  adc $7b36
$19:a65f  30 1e		 bmi $a67f
$19:a661  f7 ff		 sbc [$ff],y
$19:a663  84 3c		 sty $3c
$19:a665  3d 7c 6e	  and $6e7c,x
$19:a668  b7 1b		 lda [$1b],y
$19:a66a  8d ce c5	  sta $c5ce
$19:a66d  87 a3		 sta [$a3]
$19:a66f  e7 38		 sbc [$38]
$19:a671  53 07		 eor ($07,s),y
$19:a673  17 9c		 ora [$9c],y
$19:a675  35 94		 and $94,x
$19:a677  d1 1c		 cmp ($1c),y
$19:a679  40			rti
$19:a67a  3c ed 42	  bit $42ed,x
$19:a67d  47 81		 eor [$81]
$19:a67f  17 0c		 ora [$0c],y
$19:a681  78			sei
$19:a682  9d 22 2e	  sta $2e22,x
$19:a685  70 39		 bvs $a6c0
$19:a687  24 5c		 bit $5c
$19:a689  60			rts
$19:a68a  08			php
$19:a68b  79 f8 8e	  adc $8ef8,y
$19:a68e  41 51		 eor ($51,x)
$19:a690  d7 2f		 cmp [$2f],y
$19:a692  aa			tax
$19:a693  82 11 a4	  brl $4aa7
$19:a696  f3 78		 sbc ($78,s),y
$19:a698  5c 3e 21 0e   jml $0e213e
$19:a69c  b2 58		 lda ($58)
$19:a69e  8c 4f 2f	  sty $2f4f
$19:a6a1  fa			plx
$19:a6a2  64 97		 stz $97
$19:a6a4  77 bf		 adc [$bf],y
$19:a6a6  fc 21 e2	  jsr ($e221,x)
$19:a6a9  1f 36 0f 3f   ora $3f0f36,x
$19:a6ad  ad ce c5	  lda $c5ce
$19:a6b0  65 44		 adc $44
$19:a6b2  b3 cb		 lda ($cb,s),y
$19:a6b4  9c 30 c3	  stz $c330
$19:a6b7  10 25		 bpl $a6de
$19:a6b9  9e 63 48	  stz $4863,x
$19:a6bc  54 93 00	  mvn $00,$93
$19:a6bf  70 87		 bvs $a648
$19:a6c1  51 87		 eor ($87),y
$19:a6c3  46 51		 lsr $51
$19:a6c5  fe b4 e8	  inc $e8b4,x
$19:a6c8  ca			dex
$19:a6c9  3f 3e ab 92   and $92ab3e,x
$19:a6cd  b1 ec		 lda ($ec),y
$19:a6cf  f0 e1		 beq $a6b2
$19:a6d1  72 04		 adc ($04)
$19:a6d3  be ab f5	  ldx $f5ab,y
$19:a6d6  e7 97		 sbc [$97]
$19:a6d8  db			stp
$19:a6d9  9f c6 1b 86   sta $861bc6,x
$19:a6dd  2f 19 9b d3   and $d39b19
$19:a6e1  1f e2 71 c5   ora $c571e2,x
$19:a6e5  e3 16		 sbc $16,s
$19:a6e7  43 36		 eor $36,s
$19:a6e9  c4 9c		 cpy $9c
$19:a6eb  46 8f		 lsr $8f
$19:a6ed  57 9f		 eor [$9f],y
$19:a6ef  d3 37		 cmp ($37,s),y
$19:a6f1  43 2d		 eor $2d,s
$19:a6f3  88			dey
$19:a6f4  c6 63		 dec $63
$19:a6f6  5a			phy
$19:a6f7  c0 05		 cpy #$05
$19:a6f9  06 c8		 asl $c8
$19:a6fb  e5 72		 sbc $72
$19:a6fd  4f 62 6a 8f   eor $8f6a62
$19:a701  1f a9 d0 e9   ora $e9d0a9,x
$19:a705  ba			tsx
$19:a706  45 b4		 eor $b4
$19:a708  03 31		 ora $31,s
$19:a70a  01 02		 ora ($02,x)
$19:a70c  1c 04 60	  trb $6004
$19:a70f  16 01		 asl $01,x
$19:a711  18			clc
$19:a712  3a			dec a
$19:a713  44 a6 21	  mvp $21,$a6
$19:a716  21 11		 and ($11,x)
$19:a718  98			tya
$19:a719  58			cli
$19:a71a  04 e0		 tsb $e0
$19:a71c  8a			txa
$19:a71d  00 60		 brk #$60
$19:a71f  72 c2		 adc ($c2)
$19:a721  c1 d4		 cmp ($d4,x)
$19:a723  11 a1		 ora ($a1),y
$19:a725  0c 11 41	  tsb $4111
$19:a728  f7 1f		 sbc [$1f],y
$19:a72a  82 20 04	  brl $ab4d
$19:a72d  62 53 3e	  per $e583
$19:a730  07 24		 ora [$24]
$19:a732  3e 03 f0	  rol $f003,x
$19:a735  29 37		 and #$37
$19:a737  f4 76 18	  pea $1876
$19:a73a  a1 78		 lda ($78,x)
$19:a73c  40			rti
$19:a73d  39 9c 42	  and $429c,y
$19:a740  9b			txy
$19:a741  1a			inc a
$19:a742  8b			phb
$19:a743  96 e4		 stx $e4,y
$19:a745  11 c1		 ora ($c1),y
$19:a747  1d 9b 98	  ora $989b,x
$19:a74a  e4 21		 cpx $21
$19:a74c  c0 90		 cpy #$90
$19:a74e  c8			iny
$19:a74f  d4 58		 pei ($58)
$19:a751  f3 f9		 sbc ($f9,s),y
$19:a753  89 4c		 bit #$4c
$19:a755  f2 38		 sbc ($38)
$19:a757  b7 c0		 lda [$c0],y
$19:a759  40			rti
$19:a75a  04 22		 tsb $22
$19:a75c  38			sec
$19:a75d  19 c8 8c	  ora $8cc8,y
$19:a760  7a			ply
$19:a761  bc 51 61	  ldy $6151,x
$19:a764  8c 87 81	  sty $8187
$19:a767  c1 ec		 cmp ($ec,x)
$19:a769  70 f8		 bvs $a763
$19:a76b  81 60		 sta ($60,x)
$19:a76d  2d 88 74	  and $7488
$19:a770  39 bc 26	  and $26bc,y
$19:a773  88			dey
$19:a774  72 31		 adc ($31)
$19:a776  d8			cld
$19:a777  8c 7b 40	  sty $407b
$19:a77a  5a			phy
$19:a77b  80 ee		 bra $a76b
$19:a77d  96 f2		 stx $f2,y
$19:a77f  ea			nop
$19:a780  34 ed		 bit $ed,x
$19:a782  71 e4		 adc ($e4),y
$19:a784  37 bc		 and [$bc],y
$19:a786  0b			phd
$19:a787  e1 6f		 sbc ($6f,x)
$19:a789  0f 2e 53 13   ora $13532e
$19:a78d  cf e3 73 b1   cmp $b173e3
$19:a791  5a			phy
$19:a792  3d 08 79	  and $7908,x
$19:a795  bd a9 01	  lda $01a9,x
$19:a798  55 86		 eor $86,x
$19:a79a  30 bc		 bmi $a758
$19:a79c  01 e5		 ora ($e5,x)
$19:a79e  c6 2c		 dec $2c
$19:a7a0  01 74		 ora ($74,x)
$19:a7a2  1c 61 90	  trb $9061
$19:a7a5  07 98		 ora [$98]
$19:a7a7  a8			tay
$19:a7a8  1c 75 29	  trb $2975
$19:a7ab  72 83		 adc ($83)
$19:a7ad  cd fd 42	  cmp $42fd
$19:a7b0  92 58		 sta ($58)
$19:a7b2  0c cf c4	  tsb $c4cf
$19:a7b5  39 11 92	  and $9211,y
$19:a7b8  5b			tcd
$19:a7b9  02 c7		 cop #$c7
$19:a7bb  09 cb		 ora #$cb
$19:a7bd  2c c3 c7	  bit $c7c3
$19:a7c0  88			dey
$19:a7c1  4f 83 c4 3b   eor $3bc483
$19:a7c5  0d bf 5a	  ora $5abf
$19:a7c8  fb			xce
$19:a7c9  1b			tcs
$19:a7ca  da			phx
$19:a7cb  fe e4 a2	  inc $a2e4,x
$19:a7ce  80 20		 bra $a7f0
$19:a7d0  8f 15 88 72   sta $728815
$19:a7d4  2f 3f 8e 70   and $708e3f
$19:a7d8  03 18		 ora $18,s
$19:a7da  10 c3		 bpl $a79f
$19:a7dc  24 e4		 bit $e4
$19:a7de  52 08		 eor ($08)
$19:a7e0  7c fa a7	  jmp ($a7fa,x)
$19:a7e3  00 e2		 brk #$e2
$19:a7e5  f3 b1		 sbc ($b1,s),y
$19:a7e7  60			rts
$19:a7e8  e6 31		 inc $31
$19:a7ea  09 bc		 ora #$bc
$19:a7ec  43 60		 eor $60,s
$19:a7ee  e4 5e		 cpx $5e
$19:a7f0  61 fc		 adc ($fc,x)
$19:a7f2  42 c3		 wdm #$c3
$19:a7f4  d4 33		 pei ($33)
$19:a7f6  36 24		 rol $24,x
$19:a7f8  2a			rol a
$19:a7f9  1c 0e 0a	  trb $0a0e
$19:a7fc  48			pha
$19:a7fd  0c ae a2	  tsb $a2ae
$19:a800  0e 12 94	  asl $9412
$19:a803  0a			asl a
$19:a804  a4 e4		 ldy $e4
$19:a806  f3 77		 sbc ($77,s),y
$19:a808  9f fd 21 ea   sta $ea21fd,x
$19:a80c  1f 59 7b 0f   ora $0f7b59,x
$19:a810  da			phx
$19:a811  9e e5 f7	  stz $f7e5,x
$19:a814  b7 81		 lda [$81],y
$19:a816  fc 1e b9	  jsr ($b91e,x)
$19:a819  2c 66 37	  bit $3766
$19:a81c  9f c6 12 27   sta $2712c6,x
$19:a820  3b			tsc
$19:a821  14 1d		 trb $1d
$19:a823  11 10		 ora ($10),y
$19:a825  f1 fe		 sbc ($fe),y
$19:a827  63 44		 adc $44,s
$19:a829  e5 62		 sbc $62
$19:a82b  c3 a3		 cmp $a3,s
$19:a82d  cf e3 ff 7e   cmp $7effe3
$19:a831  7d 0e 9f	  adc $9f0e,x
$19:a834  50 68		 bvc $a89e
$19:a836  5c 5e 70 74   jml $74705e
$19:a83a  79 bc 2e	  adc $2ebc,y
$19:a83d  67 10		 adc [$10]
$19:a83f  68			pla
$19:a840  a3 a0		 lda $a0,s
$19:a842  0e 8f bb	  asl $bb8f
$19:a845  11 8f		 ora ($8f),y
$19:a847  e6 f0		 inc $f0
$19:a849  ca			dex
$19:a84a  69 d4		 adc #$d4
$19:a84c  2e 17 d7	  rol $d717
$19:a84f  11 e9		 ora ($e9),y
$19:a851  f5 62		 sbc $62,x
$19:a853  79 7f 39	  adc $397f,y
$19:a856  c9 a4		 cmp #$a4
$19:a858  4b			phk
$19:a859  67 88		 adc [$88]
$19:a85b  c4 64		 cpy $64
$19:a85d  f4 66 20	  pea $2066
$19:a860  e1 76		 sbc ($76,x)
$19:a862  38			sec
$19:a863  48			pha
$19:a864  81 e4		 sta ($e4,x)
$19:a866  03 fd		 ora $fd,s
$19:a868  3b			tsc
$19:a869  ea			nop
$19:a86a  ef 5f fb 43   sbc $43fb5f
$19:a86e  dc 3e f0	  jml [$f03e]
$19:a871  ce 7f 5b	  dec $5b7f
$19:a874  9d 8b c4	  sta $c48b,x
$19:a877  7c 8e 01	  jmp ($018e,x)
$19:a87a  92 fa		 sta ($fa)
$19:a87c  e3 de		 sbc $de,s
$19:a87e  07 cb		 ora [$cb]
$19:a880  9c 12 c3	  stz $c312
$19:a883  15 88		 ora $88,x
$19:a885  f7 a0		 sbc [$a0],y
$19:a887  01 00		 ora ($00,x)
$19:a889  00 c4		 brk #$c4
$19:a88b  e8			inx
$19:a88c  7e f9 58	  ror $58f9,x
$19:a88f  af 97 d8 30   lda $30d897
$19:a893  3f 27 81 f3   and $f38127,x
$19:a897  0b			phd
$19:a898  43 8a		 eor $8a,s
$19:a89a  fa			plx
$19:a89b  1c 80 2c	  trb $2c80
$19:a89e  2f 03 c7 f3   and $f3c703
$19:a8a2  38			sec
$19:a8a3  82 40 c4	  brl $6ce6
$19:a8a6  7b			tdc
$19:a8a7  71 18		 adc ($18),y
$19:a8a9  c2 40		 rep #$40
$19:a8ab  3c 0f 28	  bit $280f,x
$19:a8ae  84 0e		 sty $0e
$19:a8b0  46 3b		 lsr $3b
$19:a8b2  ff eb c4 80   sbc $80c4eb,x
$19:a8b6  45 e0		 eor $e0
$19:a8b8  79 ec c7	  adc $c7ec,y
$19:a8bb  dc 4c 1f	  jml [$1f4c]
$19:a8be  2c 46 34	  bit $3446
$19:a8c1  22 07 c2 7f   jsl $7fc207
$19:a8c5  86 9b		 stx $9b
$19:a8c7  35 f2		 and $f2,x
$19:a8c9  c6 1d		 dec $1d
$19:a8cb  03 1b		 ora $1b,s
$19:a8cd  cf e3 f5 0d   cmp $0df5e3
$19:a8d1  69 9a		 adc #$9a
$19:a8d3  f7 16		 sbc [$16],y
$19:a8d5  03 8c		 ora $8c,s
$19:a8d7  85 0f		 sta $0f
$19:a8d9  df 43 a6 6b   cmp $6ba643,x
$19:a8dd  4d 66 20	  eor $2066
$19:a8e0  a4 1c		 ldy $1c
$19:a8e2  3e 20 c8	  rol $c820,x
$19:a8e5  38			sec
$19:a8e6  1c 1e 43	  trb $431e
$19:a8e9  c0 f2		 cpy #$f2
$19:a8eb  43 71		 eor $71,s
$19:a8ed  29 07		 and #$07
$19:a8ef  0b			phd
$19:a8f0  84 54		 sty $54
$19:a8f2  0f bb c3 d7   ora $d7c3bb
$19:a8f6  9e cd f6	  stz $f6cd,x
$19:a8f9  f7 00		 sbc [$00],y
$19:a8fb  04 06		 tsb $06
$19:a8fd  00 18		 brk #$18
$19:a8ff  c0 5e		 cpy #$5e
$19:a901  6f 8f 1b c0   adc $c01b8f
$19:a905  5e 30 80	  lsr $8030,x
$19:a908  1b			tcs
$19:a909  c0 60		 cpy #$60
$19:a90b  22 11 f8 88   jsl $88f811
$19:a90f  4e 41 e1	  lsr $e141
$19:a912  18			clc
$19:a913  86 53		 stx $53
$19:a915  6e e2 30	  ror $30e2
$19:a918  86 67		 stx $67
$19:a91a  61 94		 adc ($94,x)
$19:a91c  3a			dec a
$19:a91d  1d 36 9d	  ora $9d36,x
$19:a920  4d 0f 88	  eor $880f
$19:a923  90 2f		 bcc $a954
$19:a925  f4 eb fd	  pea $fdeb
$19:a928  37 3b		 and [$3b],y
$19:a92a  4d a1 51	  eor $51a1
$19:a92d  28			plp
$19:a92e  54 2a 18	  mvn $18,$2a
$19:a931  7c 46 80	  jmp ($8046,x)
$19:a934  22 0a 75 df   jsl $df750a
$19:a938  3b			tsc
$19:a939  3a			dec a
$19:a93a  1e 05 2e	  asl $2e05,x
$19:a93d  95 4b		 sta $4b,x
$19:a93f  0f 8c ba 52   ora $52ba8c
$19:a943  53 22		 eor ($22,s),y
$19:a945  40			rti
$19:a946  13 42		 ora ($42,s),y
$19:a948  9a			txs
$19:a949  23 02		 and $02,s
$19:a94b  7c 43 21	  jmp ($2143,x)
$19:a94e  82 d0 16	  brl $c021
$19:a951  00 7c		 brk #$7c
$19:a953  69 c3		 adc #$c3
$19:a955  d0 a2		 bne $a8f9
$19:a957  08			php
$19:a958  83 3b		 sta $3b,s
$19:a95a  4e 32 98	  lsr $9832
$19:a95d  7c 47 28	  jmp ($2847,x)
$19:a960  38			sec
$19:a961  09 4f		 ora #$4f
$19:a963  f4 ae 02	  pea $02ae
$19:a966  e2 a6		 sep #$a6
$19:a968  d2 a9		 cmp ($a9)
$19:a96a  94 a2		 sty $a2,x
$19:a96c  68			pla
$19:a96d  22 04 ac 26   jsl $26ac04
$19:a971  e2 29		 sep #$29
$19:a973  29 70		 and #$70
$19:a975  0c e2 2e	  tsb $2ee2
$19:a978  22 92 2c d5   jsl $d52c92
$19:a97c  5f e2 00 91   eor $9100e2,x
$19:a980  c7 63		 cmp [$63]
$19:a982  b2 96		 lda ($96)
$19:a984  98			tya
$19:a985  35 94		 and $94,x
$19:a987  1e 12 09	  asl $0912,x
$19:a98a  0b			phd
$19:a98b  88			dey
$19:a98c  26 2e		 rol $2e
$19:a98e  21 73		 and ($73,x)
$19:a990  25 f1		 and $f1
$19:a992  df b8 47 fe   cmp $fe47b8,x
$19:a996  c4 41		 cpy $41
$19:a998  e9 17		 sbc #$17
$19:a99a  89 4f		 bit #$4f
$19:a99c  67 b2		 adc [$b2]
$19:a99e  a8			tay
$19:a99f  28			plp
$19:a9a0  6c 4d 00	  jmp ($004d)
$19:a9a3  73 13		 adc ($13,s),y
$19:a9a5  58			cli
$19:a9a6  4b			phk
$19:a9a7  e3 54		 sbc $54,s
$19:a9a9  5a			phy
$19:a9aa  2c 1d 48	  bit $481d
$19:a9ad  88			dey
$19:a9ae  33 13		 and ($13,s),y
$19:a9b0  00 60		 brk #$60
$19:a9b2  05 4a		 ora $4a
$19:a9b4  93 31		 sta ($31,s),y
$19:a9b6  33 ac		 and ($ac,s),y
$19:a9b8  d4 6c		 pei ($6c)
$19:a9ba  e4 f7		 cpx $f7
$19:a9bc  14 30		 trb $30
$19:a9be  80 ae		 bra $a96e
$19:a9c0  e2 51		 sep #$51
$19:a9c2  1c 38 c5	  trb $c538
$19:a9c5  45 0e		 eor $0e
$19:a9c7  41 52		 eor ($52,x)
$19:a9c9  c7 92		 cmp [$92]
$19:a9cb  7d 35 d4	  adc $d435,x
$19:a9ce  e3 a0		 sbc $a0,s
$19:a9d0  5d e9 d1	  eor $d1e9,x
$19:a9d3  d6 7a		 dec $7a,x
$19:a9d5  49 06		 eor #$06
$19:a9d7  e3 4d		 sbc $4d,s
$19:a9d9  bf c3 2f f4   lda $f42fc3,x
$19:a9dd  29 0b		 and #$0b
$19:a9df  7d 64 55	  adc $5564,x
$19:a9e2  ea			nop
$19:a9e3  fd 36 75	  sbc $7536,x
$19:a9e6  4d 86 52	  eor $5286
$19:a9e9  af 8e fd c2   lda $c2fd8e
$19:a9ed  3f f6 0a 0f   and $0f0af6,x
$19:a9f1  89 58		 bit #$58
$19:a9f3  e0 25		 cpx #$25
$19:a9f5  50 54		 bvc $aa4b
$19:a9f7  dc c1 15	  jml [$15c1]
$19:a9fa  18			clc
$19:a9fb  29 03		 and #$03
$19:a9fd  c1 e7		 cmp ($e7,x)
$19:a9ff  60			rts
$19:aa00  50 12		 bvc $aa14
$19:aa02  10 10		 bpl $aa14
$19:aa04  40			rti
$19:aa05  82 30 27	  brl $d138
$19:aa08  40			rti
$19:aa09  11 03		 ora ($03),y
$19:aa0b  3b			tsc
$19:aa0c  19 fe db	  ora $dbfe,y
$19:aa0f  4a			lsr a
$19:aa10  4d 55 aa	  eor $aa55
$19:aa13  94 81		 sty $81,x
$19:aa15  1c 04 40	  trb $4004
$19:aa18  20 99 14	  jsr $1499
$19:aa1b  6a			ror a
$19:aa1c  d5 72		 cmp $72,x
$19:aa1e  08			php
$19:aa1f  0b			phd
$19:aa20  fc 7c 33	  jsr ($337c,x)
$19:aa23  a3 fa		 lda $fa,s
$19:aa25  0a			asl a
$19:aa26  87 5c		 sta [$5c]
$19:aa28  6e 04 11	  ror $1104
$19:aa2b  9d 6d 00	  sta $006d,x
$19:aa2e  a2 9f		 ldx #$9f
$19:aa30  1d 16 76	  ora $7616,x
$19:aa33  9b			txy
$19:aa34  c3 bf		 cmp $bf,s
$19:aa36  53 68		 eor ($68,s),y
$19:aa38  74 47		 stz $47,x
$19:aa3a  60			rts
$19:aa3b  29 da		 and #$da
$19:aa3d  87 02		 sta [$02]
$19:aa3f  c3 df		 cmp $df,s
$19:aa41  a9 74		 lda #$74
$19:aa43  ca			dex
$19:aa44  15 0d		 ora $0d,x
$19:aa46  6e d4 b8	  ror $b8d4
$19:aa49  16 3f		 asl $3f,x
$19:aa4b  1f 4d a6 d2   ora $d2a64d,x
$19:aa4f  a9 73		 lda #$73
$19:aa51  a3 10		 lda $10,s
$19:aa53  92 c6		 sta ($c6)
$19:aa55  03 7c		 ora $7c,s
$19:aa57  77 dd		 adc [$dd],y
$19:aa59  ef 03 84 7f   sbc $7f8403
$19:aa5d  dd eb 03	  cmp $03eb,x
$19:aa60  05 07		 ora $07
$19:aa62  d4 af		 pei ($af)
$19:aa64  03 81		 ora $81,s
$19:aa66  94 87		 sty $87,x
$19:aa68  ea			nop
$19:aa69  08			php
$19:aa6a  1d fc 09	  ora $09fc,x
$19:aa6d  95 20		 sta $20,x
$19:aa6f  39 73 18	  and $1873,y
$19:aa72  44 cc 40	  mvp $40,$cc
$19:aa75  2c 1b 69	  bit $691b
$19:aa78  3e 36 a4	  rol $a436,x
$19:aa7b  b2 80		 lda ($80)
$19:aa7d  c6 76		 dec $76
$19:aa7f  a4 00		 ldy $00
$19:aa81  8c 98 c0	  sty $c098
$19:aa84  90 06		 bcc $aa8c
$19:aa86  00 84		 brk #$84
$19:aa88  8b			phb
$19:aa89  07 3b		 ora [$3b]
$19:aa8b  02 2d		 cop #$2d
$19:aa8d  01 bc		 ora ($bc,x)
$19:aa8f  09 03		 ora #$03
$19:aa91  09 8a		 ora #$8a
$19:aa93  18			clc
$19:aa94  40			rti
$19:aa95  d8			cld
$19:aa96  50 9d		 bvc $aa35
$19:aa98  ac 4d 46	  ldy $464d
$19:aa9b  10 22		 bpl $aabf
$19:aa9d  b3 e7		 lda ($e7,s),y
$19:aa9f  60			rts
$19:aaa0  25 a0		 and $a0
$19:aaa2  41 8e		 eor ($8e,x)
$19:aaa4  d6 28		 dec $28,x
$19:aaa6  46 04		 lsr $04
$19:aaa8  b0 1b		 bcs $aac5
$19:aaaa  17 2e		 ora [$2e],y
$19:aaac  78			sei
$19:aaad  13 90		 ora ($90,s),y
$19:aaaf  96 92		 stx $92,y
$19:aab1  04 55		 tsb $55
$19:aab3  48			pha
$19:aab4  a2 3c		 ldx #$3c
$19:aab6  8f 86 68 03   sta $036886
$19:aaba  c8			iny
$19:aabb  19 02 03	  ora $0302,y
$19:aabe  14 38		 trb $38
$19:aac0  01 ec		 ora ($ec,x)
$19:aac2  88			dey
$19:aac3  80 73		 bra $ab38
$19:aac5  13 50		 ora ($50,s),y
$19:aac7  67 62		 adc [$62]
$19:aac9  65 81		 adc $81
$19:aacb  8c b3 08	  sty $08b3
$19:aace  cc 67 70	  cpy $7067
$19:aad1  30 01		 bmi $aad4
$19:aad3  90 20		 bcc $aaf5
$19:aad5  42 c1		 wdm #$c1
$19:aad7  c0 60		 cpy #$60
$19:aad9  07 e0		 ora [$e0]
$19:aadb  40			rti
$19:aadc  03 98		 ora $98,s
$19:aade  59 ec cf	  eor $cfec,y
$19:aae1  83 b3		 sta $b3,s
$19:aae3  bb			tyx
$19:aae4  c2 05		 rep #$05
$19:aae6  0a			asl a
$19:aae7  01 0c		 ora ($0c,x)
$19:aae9  0a			asl a
$19:aaea  cb			wai
$19:aaeb  60			rts
$19:aaec  b0 d8		 bcs $aac6
$19:aaee  ac 60 b0	  ldy $b060
$19:aaf1  81 3f		 sta ($3f,x)
$19:aaf3  de d1 73	  dec $73d1,x
$19:aaf6  b5 5a		 lda $5a,x
$19:aaf8  ee 36 49	  inc $4936
$19:aafb  33 bc		 and ($bc,s),y
$19:aafd  40			rti
$19:aafe  45 01		 eor $01
$19:ab00  b2 82		 lda ($82)
$19:ab02  82 c2 08	  brl $b3c7
$19:ab05  0b			phd
$19:ab06  18			clc
$19:ab07  78			sei
$19:ab08  40			rti
$19:ab09  2b			pld
$19:ab0a  6a			ror a
$19:ab0b  b9 da 6d	  lda $6dda,y
$19:ab0e  16 cb		 asl $cb,x
$19:ab10  58			cli
$19:ab11  ba			tsx
$19:ab12  31 30		 and ($30),y
$19:ab14  20 50 5d	  jsr $5d50
$19:ab17  85 b3		 sta $b3
$19:ab19  6e cb da	  ror $dacb
$19:ab1c  b0 d7		 bcs $aaf5
$19:ab1e  41 e9		 eor ($e9,x)
$19:ab20  40			rti
$19:ab21  44 49 61	  mvp $61,$49
$19:ab24  04 8d		 tsb $8d
$19:ab26  d6 c0		 dec $c0,x
$19:ab28  1e 7e 3d	  asl $3d7e,x
$19:ab2b  b2 d8		 lda ($d8)
$19:ab2d  1a			inc a
$19:ab2e  0b			phd
$19:ab2f  65 a2		 adc $a2
$19:ab31  2a			rol a
$19:ab32  0f 65 50 34   ora $345065
$19:ab36  81 12		 sta ($12,x)
$19:ab38  39 d0 fb	  and $fbd0,y
$19:ab3b  59 e5 09	  eor $09e5,y
$19:ab3e  83 fe		 sta $fe,s
$19:ab40  83 c5		 sta $c5,s
$19:ab42  70 08		 bvs $ab4c
$19:ab44  91 03		 sta ($03),y
$19:ab46  84 04		 sty $04
$19:ab48  94 26		 sty $26,x
$19:ab4a  d2 83		 cmp ($83)
$19:ab4c  ca			dex
$19:ab4d  56 40		 lsr $40,x
$19:ab4f  a2 00		 ldx #$00
$19:ab51  b8			clv
$19:ab52  42 4b		 wdm #$4b
$19:ab54  43 68		 eor $68,s
$19:ab56  57 30		 eor [$30],y
$19:ab58  18			clc
$19:ab59  2c 37 63	  bit $6337
$19:ab5c  50 8b		 bvc $aae9
$19:ab5e  49 82		 eor #$82
$19:ab60  a5 b0		 lda $b0
$19:ab62  b5 1e		 lda $1e,x
$19:ab64  02 d8		 cop #$d8
$19:ab66  ae 8c 4d	  ldx $4d8c
$19:ab69  d4 94		 pei ($94)
$19:ab6b  76 67		 ror $67,x
$19:ab6d  79 db 5e	  adc $5edb,y
$19:ab70  a1 55		 lda ($55,x)
$19:ab72  aa			tax
$19:ab73  bd 45 ea	  lda $ea45,x
$19:ab76  02 b0		 cop #$b0
$19:ab78  14 12		 trb $12
$19:ab7a  28			plp
$19:ab7b  20 55 6a	  jsr $6a55
$19:ab7e  bd 3a 85	  lda $853a,x
$19:ab81  43 a2		 eor $a2,s
$19:ab83  53 6d		 eor ($6d,s),y
$19:ab85  17 0b		 ora [$0b],y
$19:ab87  55 c2		 eor $c2,x
$19:ab89  e3 68		 sbc $68,s
$19:ab8b  59 04 12	  eor $1204,y
$19:ab8e  7b			tdc
$19:ab8f  3d 05 05	  and $0505,x
$19:ab92  2e 99 42	  rol $4299
$19:ab95  c4 9a		 cpy $9a
$19:ab97  44 44 01	  mvp $01,$44
$19:ab9a  51 a2		 eor ($a2),y
$19:ab9c  d1 61		 cmp ($61),y
$19:ab9e  94 aa		 sty $aa,x
$19:aba0  6d 36 95	  adc $9536
$19:aba3  6e 3c 81	  ror $813c
$19:aba6  e0 2d		 cpx #$2d
$19:aba8  61 53		 adc ($53,x)
$19:abaa  7d 1d 86	  adc $861d,x
$19:abad  c7 60		 cmp [$60]
$19:abaf  01 08		 ora ($08,x)
$19:abb1  94 e5		 sty $e5,x
$19:abb3  50 5c		 bvc $ac11
$19:abb5  dc 0a db	  jml [$db0a]
$19:abb8  73 3e		 adc ($3e,s),y
$19:abba  01 e0		 ora ($e0,x)
$19:abbc  02 88		 cop #$88
$19:abbe  b1 18		 lda ($18),y
$19:abc0  25 b4		 and $b4
$19:abc2  3e 43 f0	  rol $f043,x
$19:abc5  12 9a		 ora ($9a)
$19:abc7  c4 1a		 cpy $1a
$19:abc9  a1 6d		 lda ($6d,x)
$19:abcb  17 8d		 ora [$8d],y
$19:abcd  ac 66 a5	  ldy $a566
$19:abd0  a3 03		 lda $03,s
$19:abd2  02 8c		 cop #$8c
$19:abd4  90 02		 bcc $abd8
$19:abd6  68			pla
$19:abd7  59 42 3c	  eor $3c42,y
$19:abda  b6 d0		 ldx $d0,y
$19:abdc  1f ec 08 b0   ora $b008ec,x
$19:abe0  b6 21		 ldx $21,y
$19:abe2  01 81		 ora ($81,x)
$19:abe4  44 d0 b6	  mvp $b6,$d0
$19:abe7  ab			plb
$19:abe8  48			pha
$19:abe9  44 0e 74	  mvp $74,$0e
$19:abec  eb			xba
$19:abed  13 15		 ora ($15,s),y
$19:abef  e1 ae		 sbc ($ae,x)
$19:abf1  97 12		 sta [$12],y
$19:abf3  90 5b		 bcc $ac50
$19:abf5  0a			asl a
$19:abf6  b3 75		 lda ($75,s),y
$19:abf8  20 89 92	  jsr $9289
$19:abfb  5d d5 55	  eor $55d5,x
$19:abfe  aa			tax
$19:abff  8f 42 ef 4e   sta $4eef42
$19:ac03  bf 53 69 d4   lda $d46953,x
$19:ac07  d8			cld
$19:ac08  65 36		 adc $36
$19:ac0a  05 05		 ora $05
$19:ac0c  82 ca ea	  brl $96d9
$19:ac0f  d5 74		 cmp $74,x
$19:ac11  30 50		 bmi $ac63
$19:ac13  e9 d8		 sbc #$d8
$19:ac15  7b			tdc
$19:ac16  f5 fa		 sbc $fa,x
$19:ac18  ef 77 35 89   sbc $893577
$19:ac1c  d8			cld
$19:ac1d  b5 d0		 lda $d0,x
$19:ac1f  1a			inc a
$19:ac20  5d 37 0e	  eor $0e37,x
$19:ac23  21 0b		 and ($0b,x)
$19:ac25  fd fc d8	  sbc $d8fc,x
$19:ac28  06 c0		 asl $c0
$19:ac2a  63 8c		 adc $8c,s
$19:ac2c  06 03		 asl $03
$19:ac2e  b5 a6		 lda $a6,x
$19:ac30  e3 c6		 sbc $c6,s
$19:ac32  20 05 03	  jsr $0305
$19:ac35  d8			cld
$19:ac36  1d 53 3b	  ora $3b53,x
$19:ac39  b5 c6		 lda $c6,x
$19:ac3b  90 0c		 bcc $ac49
$19:ac3d  f4 2c 62	  pea $622c
$19:ac40  0c 00 fd	  tsb $fd00
$19:ac43  31 c4		 and ($c4),y
$19:ac45  63 3c		 adc $3c,s
$19:ac47  10 fd		 bpl $ac46
$19:ac49  32 c4		 and ($c4)
$19:ac4b  65 75		 adc $75
$19:ac4d  06 df		 asl $df
$19:ac4f  1b			tcs
$19:ac50  35 38		 and $38,x
$19:ac52  91 59		 sta ($59),y
$19:ac54  ec b6 0b	  cpx $0bb6
$19:ac57  0b			phd
$19:ac58  00 31		 brk #$31
$19:ac5a  ac 41 62	  ldy $6241
$19:ac5d  98			tya
$19:ac5e  74 2c		 stz $2c,x
$19:ac60  b6 86		 ldx $86,y
$19:ac62  78			sei
$19:ac63  5a			phy
$19:ac64  e1 2b		 sbc ($2b,x)
$19:ac66  41 3c		 eor ($3c,x)
$19:ac68  35 86		 and $86,x
$19:ac6a  03 75		 ora $75,s
$19:ac6c  b1 d8		 lda ($d8),y
$19:ac6e  ac 08 65	  ldy $6508
$19:ac71  3e 8d ce	  rol $ce8d,x
$19:ac74  32 d3		 and ($d3)
$19:ac76  0b			phd
$19:ac77  55 a1		 eor $a1,x
$19:ac79  2d 18 9b	  and $9b18
$19:ac7c  0c 09 c4	  tsb $c409
$19:ac7f  16 15		 asl $15,x
$19:ac81  34 5b		 bit $5b,x
$19:ac83  ad 31 4b	  lda $4b31
$19:ac86  5a			phy
$19:ac87  c8			iny
$19:ac88  12 d2		 ora ($d2)
$19:ac8a  c3 06		 cmp $06,s
$19:ac8c  18			clc
$19:ac8d  29 62		 and #$62
$19:ac8f  db			stp
$19:ac90  6d da c2	  adc $c2da
$19:ac93  60			rts
$19:ac94  4e f0 77	  lsr $77f0
$19:ac97  91 a0		 sta ($a0),y
$19:ac99  70 38		 bvs $acd3
$19:ac9b  18			clc
$19:ac9c  4c 65 ea	  jmp $ea65
$19:ac9f  51 98		 eor ($98),y
$19:aca1  10 b4		 bpl $ac57
$19:aca3  09 a0		 ora #$a0
$19:aca5  fb			xce
$19:aca6  21 40		 and ($40,x)
$19:aca8  01 00		 ora ($00,x)
$19:acaa  5c 11 47 f8   jml $f84711
$19:acae  42 62		 wdm #$62
$19:acb0  91 38		 sta ($38),y
$19:acb2  c8			iny
$19:acb3  31 21		 and ($21),y
$19:acb5  30 47		 bmi $acfe
$19:acb7  a1 3d		 lda ($3d,x)
$19:acb9  0b			phd
$19:acba  10 fd		 bpl $acb9
$19:acbc  00 30		 brk #$30
$19:acbe  6d 62 72	  adc $7262
$19:acc1  9c dc 07	  stz $07dc
$19:acc4  37 02		 and [$02],y
$19:acc6  81 41		 sta ($41,x)
$19:acc8  65 62		 adc $62
$19:acca  b2 2c		 lda ($2c)
$19:accc  80 50		 bra $ad1e
$19:acce  01 22		 ora ($22,x)
$19:acd0  b6 31		 ldx $31,y
$19:acd2  da			phx
$19:acd3  5b			tcd
$19:acd4  4c c4 b6	  jmp $b6c4
$19:acd7  2c c4 14	  bit $14c4
$19:acda  18			clc
$19:acdb  76 d8		 ror $d8,x
$19:acdd  09 4d		 ora #$4d
$19:acdf  41 49		 eor ($49,x)
$19:ace1  01 28		 ora ($28,x)
$19:ace3  bb			tyx
$19:ace4  e8			inx
$19:ace5  c9 f2		 cmp #$f2
$19:ace7  7a			ply
$19:ace8  f0 5a		 beq $ad44
$19:acea  14 5b		 trb $5b
$19:acec  21 06		 and ($06,x)
$19:acee  83 27		 sta $27,s
$19:acf0  25 52		 and $52
$19:acf2  13 3c		 ora ($3c,s),y
$19:acf4  9e 4c 78	  stz $784c,x
$19:acf7  84 33		 sty $33
$19:acf9  82 5f 6f	  brl $1c5b
$19:acfc  ab			plb
$19:acfd  a9 5b		 lda #$5b
$19:acff  8b			phb
$19:ad00  22 e0 98 c7   jsl $c798e0
$19:ad04  30 ae		 bmi $acb4
$19:ad06  8f 01 80 59   sta $598001
$19:ad0a  10 3c		 bpl $ad48
$19:ad0c  2c b6 eb	  bit $ebb6
$19:ad0f  4d ab 0d	  eor $0dab
$19:ad12  74 b5		 stz $b5,x
$19:ad14  c9 9d		 cmp #$9d
$19:ad16  ef 61 b1 82   sbc $82b161
$19:ad1a  02 eb		 cop #$eb
$19:ad1c  60			rts
$19:ad1d  7f 34 07 8f   adc $8f0734,x
$19:ad21  73 b6		 adc ($b6,s),y
$19:ad23  5b			tcd
$19:ad24  30 b6		 bmi $acdc
$19:ad26  cb			wai
$19:ad27  44 55 de	  mvp $de,$55
$19:ad2a  cc 10 81	  cpy $8110
$19:ad2d  40			rti
$19:ad2e  45 24		 eor $24
$19:ad30  ef 42 c0 59   sbc $59c042
$19:ad34  e5 03		 sbc $03
$19:ad36  83 94		 sta $94,s
$19:ad38  bb			tyx
$19:ad39  df 13 61 b1   cmp $b16113,x
$19:ad3d  02 44		 cop #$44
$19:ad3f  7c d0 17	  jmp ($17d0,x)
$19:ad42  b9 5a ed	  lda $ed5a,y
$19:ad45  96 b2		 stx $b2,y
$19:ad47  74 02		 stz $02,x
$19:ad49  0a			asl a
$19:ad4a  ed 60 1f	  sbc $1f60
$19:ad4d  40			rti
$19:ad4e  60			rts
$19:ad4f  5f 61 68 27   eor $276861,x
$19:ad53  40			rti
$19:ad54  24 09		 bit $09
$19:ad56  41 75		 eor ($75,x)
$19:ad58  26 94		 rol $94
$19:ad5a  c9 54		 cmp #$54
$19:ad5c  10 6d		 bpl $adcb
$19:ad5e  24 0b		 bit $0b
$19:ad60  8f 6c 7c 80   sta $807c6c
$19:ad64  64 2d		 stz $2d
$19:ad66  90 67		 bcc $adcf
$19:ad68  78			sei
$19:ad69  54 2a 2a	  mvn $2a,$2a
$19:ad6c  12 ac		 ora ($ac)
$19:ad6e  a8			tay
$19:ad6f  52 a0		 eor ($a0)
$19:ad71  ef 0a 35 1d   sbc $1d350a
$19:ad75  62 55 85	  per $32cd
$19:ad78  8a			txa
$19:ad79  51 9d		 eor ($9d),y
$19:ad7b  e0 48		 cpx #$48
$19:ad7d  3b			tsc
$19:ad7e  06 d6		 asl $d6
$19:ad80  03 05		 ora $05,s
$19:ad82  64 9b		 stz $9b
$19:ad84  bc 0b 05	  ldy $050b,x
$19:ad87  70 b4		 bvs $ad3d
$19:ad89  31 c2		 and ($c2),y
$19:ad8b  53 36		 eor ($36,s),y
$19:ad8d  1c 13 fc	  trb $fc13
$19:ad90  05 08		 ora $08
$19:ad92  27 09		 and [$09]
$19:ad94  4c 98 90	  jmp $9098
$19:ad97  4d 10 b4	  eor $b410
$19:ad9a  16 c2		 asl $c2,x
$19:ad9c  d8			cld
$19:ad9d  35 08		 and $08,x
$19:ad9f  24 f6		 bit $f6
$19:ada1  7a			ply
$19:ada2  31 18		 and ($18),y
$19:ada4  25 b6		 and $b6
$19:ada6  c0 c2		 cpy #$c2
$19:ada8  37 a8		 and [$a8],y
$19:adaa  d1 68		 cmp ($68),y
$19:adac  a3 10		 lda $10,s
$19:adae  22 85 b6 d0   jsl $d0b685
$19:adb2  59 23 e8	  eor $e823,y
$19:adb5  3d 9d c2	  and $c29d,x
$19:adb8  8e 11 04	  stx $0411
$19:adbb  29 08		 and #$08
$19:adbd  45 e6		 eor $e6
$19:adbf  f7 61		 sbc [$61],y
$19:adc1  7b			tdc
$19:adc2  8a			txa
$19:adc3  3c 73 f0	  bit $f073,x
$19:adc6  7f e8 f2 8b   adc $8bf2e8,x
$19:adca  1e 09 48	  asl $4809,x
$19:adcd  32 3d		 and ($3d)
$19:adcf  66 6f		 ror $6f
$19:add1  80 99		 bra $ad6c
$19:add3  25 46		 and $46
$19:add5  db			stp
$19:add6  51 a8		 eor ($a8),y
$19:add8  27 d4		 and [$d4]
$19:adda  10 0a		 bpl $ade6
$19:addc  03 a3		 ora $a3,s
$19:adde  d1 95		 cmp ($95),y
$19:ade0  f9 05 5f	  sbc $5f05,y
$19:ade3  d6 6e		 dec $6e,x
$19:ade5  03 6d		 ora $6d,s
$19:ade7  94 33		 sty $33,x
$19:ade9  d6 6c		 dec $6c,x
$19:adeb  cf 2d b3 34   cmp $34b32d
$19:adef  2c 36 37	  bit $3736
$19:adf2  fa			plx
$19:adf3  49 b1		 eor #$b1
$19:adf5  20 01 75	  jsr $7501
$19:adf8  85 b7		 sta $b7
$19:adfa  8f 73 b6 3c   sta $3cb673
$19:adfe  46 d0		 lsr $d0
$19:ae00  73 7d		 adc ($7d,s),y
$19:ae02  b8			clv
$19:ae03  7d 07 e0	  adc $e007,x
$19:ae06  6b			rtl
$19:ae07  12 41		 ora ($41)
$19:ae09  59 6c 77	  eor $776c,y
$19:ae0c  67 19		 adc [$19]
$19:ae0e  1c de cb	  trb $cbde
$19:ae11  86 ba		 stx $ba
$19:ae13  5a			phy
$19:ae14  9e 6c 0b	  stz $0b6c,x
$19:ae17  3c 4d d6	  bit $d64d,x
$19:ae1a  03 61		 ora $61,s
$19:ae1c  80 d8		 bra $adf6
$19:ae1e  c2 d1		 rep #$d1
$19:ae20  6e b5 40	  ror $40b5
$19:ae23  ad 31 9b	  lda $9b31
$19:ae26  80 9a		 bra $adc2
$19:ae28  20 41 11	  jsr $1141
$19:ae2b  1a			inc a
$19:ae2c  54 04 42	  mvn $42,$04
$19:ae2f  16 b8		 asl $b8,x
$19:ae31  0d b0 4d	  ora $4db0
$19:ae34  16 3b		 asl $3b,x
$19:ae36  ab			plb
$19:ae37  80 1c		 bra $ae55
$19:ae39  60			rts
$19:ae3a  f6 7e		 inc $7e,x
$19:ae3c  3b			tsc
$19:ae3d  c4 2e		 cpy $2e
$19:ae3f  36 81		 rol $81,x
$19:ae41  10 11		 bpl $ae54
$19:ae43  9f 6a 00 48   sta $48006a,x
$19:ae47  32 58		 and ($58)
$19:ae49  66 6f		 ror $6f
$19:ae4b  b0 99		 bcs $ade6
$19:ae4d  41 aa		 eor ($aa,x)
$19:ae4f  35 04		 and $04,x
$19:ae51  fc 22 c1	  jsr ($c122,x)
$19:ae54  3e 14 7a	  rol $7a14,x
$19:ae57  32 bf		 and ($bf)
$19:ae59  2c b1 09	  bit $09b1
$19:ae5c  84 79		 sty $79
$19:ae5e  85 56		 sta $56
$19:ae60  58			cli
$19:ae61  c0 20 1a	  cpy #$1a20
$19:ae64  54 cf 0d	  mvn $0d,$cf
$19:ae67  75 3a		 adc $3a,x
$19:ae69  85 43		 sta $43
$19:ae6b  a1 d3		 lda ($d3,x)
$19:ae6d  69 b2		 adc #$b2
$19:ae6f  9e 1d f9	  stz $f91d,x
$19:ae72  cc 13 aa	  cpy $aa13
$19:ae75  6e 76 03	  ror $0376
$19:ae78  6d 46 82	  adc $8246
$19:ae7b  24 32		 bit $32
$19:ae7d  8f 61 c9 e4   sta $e4c961
$19:ae81  f1 18		 sbc ($18),y
$19:ae83  1c 0e 76	  trb $760e
$19:ae86  04 f1		 tsb $f1
$19:ae88  38			sec
$19:ae89  5c 28 0e 30   jml $300e28
$19:ae8d  b7 e1		 lda [$e1],y
$19:ae8f  3c 13 1d	  bit $1d13,x
$19:ae92  8d 0b 93	  sta $930b
$19:ae95  f0 5e		 beq $aef5
$19:ae97  80 f1		 bra $ae8a
$19:ae99  2c e6 58	  bit $58e6
$19:ae9c  2e ce f1	  rol $f1ce
$19:ae9f  4e 84 1b	  lsr $1b84
$19:aea2  4e 17 30	  lsr $3017
$19:aea5  da			phx
$19:aea6  90 5e		 bcc $af06
$19:aea8  55 04		 eor $04,x
$19:aeaa  0e 9c aa	  asl $aa9c
$19:aead  0a			asl a
$19:aeae  53 5c		 eor ($5c,s),y
$19:aeb0  c9 30		 cmp #$30
$19:aeb2  5d e8 d2	  eor $d2e8,x
$19:aeb5  52 62		 eor ($62)
$19:aeb7  18			clc
$19:aeb8  bc e7 50	  ldy $50e7,x
$19:aebb  69 98		 adc #$98
$19:aebd  c4 92		 cpy $92
$19:aebf  6b			rtl
$19:aec0  33 7e		 and ($7e,s),y
$19:aec2  85 46		 sta $46
$19:aec4  a1 59		 lda ($59,x)
$19:aec6  a8			tay
$19:aec7  27 c1		 and [$c1]
$19:aec9  46 cf		 lsr $cf
$19:aecb  d0 a3		 bne $ae70
$19:aecd  d1 ab		 cmp ($ab),y
$19:aecf  14 65		 trb $65
$19:aed1  78			sei
$19:aed2  2c d9 fa	  bit $fad9
$19:aed5  11 68		 ora ($68),y
$19:aed7  95 96		 sta $96,x
$19:aed9  21 30		 and ($30,x)
$19:aedb  8f 31 11 7e   sta $7e1131
$19:aedf  0f d0 82 46   ora $4682d0
$19:aee3  ac b1 88	  ldy $88b1
$19:aee6  3a			dec a
$19:aee7  4d 59 e0	  eor $e059
$19:aeea  cd 4d 28	  cmp $284d
$19:aeed  d9 21 58	  cmp $5821,y
$19:aef0  86 e0		 stx $e0
$19:aef2  e0 30 07	  cpx #$0730
$19:aef5  24 da		 bit $da
$19:aef7  c0 a5 31	  cpy #$31a5
$19:aefa  5b			tcd
$19:aefb  75 a6		 adc $a6,x
$19:aefd  d5 6c		 cmp $6c,x
$19:aeff  77 bc		 adc [$bc],y
$19:af01  06 04		 asl $04
$19:af03  08			php
$19:af04  00 48		 brk #$48
$19:af06  bb			tyx
$19:af07  c2 05		 rep #$05
$19:af09  28			plp
$19:af0a  09 15		 ora #$15
$19:af0c  9e cc 18	  stz $18cc,x
$19:af0f  3b			tsc
$19:af10  6b			rtl
$19:af11  bc 31 36	  ldy $3631,x
$19:af14  1b			tcs
$19:af15  15 8e		 ora $8e,x
$19:af17  c3 63		 cmp $63,s
$19:af19  b2 d8		 lda ($d8)
$19:af1b  04 43		 tsb $43
$19:af1d  76 b0		 ror $b0,x
$19:af1f  40			rti
$19:af20  5d e1 6e	  eor $6ee1,x
$19:af23  b8			clv
$19:af24  3f 40 68 16   and $166840,x
$19:af28  5b			tcd
$19:af29  45 ae		 eor $ae
$19:af2b  d5 86		 cmp $86,x
$19:af2d  ba			tsx
$19:af2e  5a			phy
$19:af2f  25 20		 and $20
$19:af31  f1 04		 sbc ($04),y
$19:af33  88			dey
$19:af34  20 2c a0	  jsr $a02c
$19:af37  b2 ba		 lda ($ba)
$19:af39  3e 00 3e	  rol $3e00,x
$19:af3c  b6 0b		 ldx $0b,y
$19:af3e  28			plp
$19:af3f  84 ae		 sty $ae
$19:af41  b6 01		 ldx $01,y
$19:af43  f0 be		 beq $af03
$19:af45  c6 e3		 dec $e3
$19:af47  6c b4 59	  jmp ($59b4)
$19:af4a  5f 63 6b 32   eor $326b63,x
$19:af4e  80 fb		 bra $af4b
$19:af50  01 a0		 ora ($a0,x)
$19:af52  3e 17 89	  rol $8917,x
$19:af55  67 48		 adc [$48]
$19:af57  c0 21 43	  cpy #$4321
$19:af5a  f3 40		 sbc ($40,s),y
$19:af5c  78			sei
$19:af5d  f6 e1		 inc $e1,x
$19:af5f  c8			iny
$19:af60  0d 05 1c	  ora $1c05
$19:af63  ef 70 3c e3   sbc $e33c70
$19:af67  dc 5e 46	  jml [$465e]
$19:af6a  ef 09 93 50   sbc $509309
$19:af6e  f2 ac		 sbc ($ac)
$19:af70  23 61		 and $61,s
$19:af72  06 03		 asl $03
$19:af74  15 82		 ora $82,x
$19:af76  68			pla
$19:af77  db			stp
$19:af78  43 70		 eor $70,s
$19:af7a  56 cb		 lsr $cb,x
$19:af7c  8d a0 d2	  sta $d2a0
$19:af7f  71 53		 adc ($53),y
$19:af81  41 db		 eor ($db,x)
$19:af83  2d a4 a0	  and $a0a4
$19:af86  20 a2 d4	  jsr $d4a2
$19:af89  08			php
$19:af8a  47 6d		 eor [$6d]
$19:af8c  b3 d9		 lda ($d9,s),y
$19:af8e  82 06 0e	  brl $bd97
$19:af91  78			sei
$19:af92  0a			asl a
$19:af93  30 0a		 bmi $af9f
$19:af95  65 01		 adc $01
$19:af97  80 a2		 bra $af3b
$19:af99  c6 c0		 dec $c0
$19:af9b  8a			txa
$19:af9c  0b			phd
$19:af9d  6c 9a e7	  jmp ($e79a)
$19:afa0  6c b5 61	  jmp ($61b5)
$19:afa3  4d 83 26	  eor $2683
$19:afa6  4d 83 c0	  eor $c083
$19:afa9  13 41		 ora ($41,s),y
$19:afab  6d 8a 9e	  adc $9e8a
$19:afae  16 4c		 asl $4c,x
$19:afb0  08			php
$19:afb1  55 d1		 eor $d1,x
$19:afb3  ae 86 4c	  ldx $4c86
$19:afb6  88			dey
$19:afb7  21 60		 and ($60,x)
$19:afb9  a5 42		 lda $42
$19:afbb  02 93		 cop #$93
$19:afbd  28			plp
$19:afbe  14 99		 trb $99
$19:afc0  f0 37		 beq $aff9
$19:afc2  17 98		 ora [$98],y
$19:afc4  17 82		 ora [$82],y
$19:afc6  05 1b		 ora $1b
$19:afc8  92 9c		 sta ($9c)
$19:afca  82 38 66	  brl $1605
$19:afcd  02 43		 cop #$43
$19:afcf  cb			wai
$19:afd0  97 43		 sta [$43],y
$19:afd2  2f 1b 00 81   and $81001b
$19:afd6  0f c7 fd 42   ora $42fdc7
$19:afda  0c 54 60	  tsb $6054
$19:afdd  2f c0 b4 1f   and $1fb4c0
$19:afe1  9c 0e c6	  stz $c60e
$19:afe4  40			rti
$19:afe5  91 c7		 sta ($c7),y
$19:afe7  56 41		 lsr $41,x
$19:afe9  24 30		 bit $30
$19:afeb  89 3c		 bit #$3c
$19:afed  4d e1 6d	  eor $6de1
$19:aff0  d2 40		 cmp ($40)
$19:aff2  a0 30 68	  ldy #$6830
$19:aff5  36 90		 rol $90,x
$19:aff7  18			clc
$19:aff8  0c 20 63	  tsb $6320
$19:affb  8b			phb
$19:affc  10 2d		 bpl $b02b
$19:affe  ae 0c c1	  ldx $c10c
$19:b001  b3 b3		 lda ($b3,s),y
$19:b003  07 80		 ora [$80]
$19:b005  b6 d9		 ldx $d9,y
$19:b007  63 1a		 adc $1a,s
$19:b009  ea			nop
$19:b00a  15 0d		 ora $0d,x
$19:b00c  e6 0f		 inc $0f
$19:b00e  20 1b 06	  jsr $061b
$19:b011  1e fd 42	  asl $42fd,x
$19:b014  79 03 bc	  adc $bc03,y
$19:b017  69 54		 adc #$54
$19:b019  b0 18		 bcs $b033
$19:b01b  00 81		 brk #$81
$19:b01d  2c 18 fc	  bit $fc18
$19:b020  7d 28 04	  adc $0428,x
$19:b023  0f f1 a6 d3   ora $d3a6f1
$19:b027  6e e1 30	  ror $30e1
$19:b02a  86 13		 stx $13
$19:b02c  d4 1e		 pei ($1e)
$19:b02e  54 eb fd	  mvn $fd,$eb
$19:b031  de ff 4d	  dec $4dff,x
$19:b034  0c 44 32	  tsb $3244
$19:b037  ee 14 0a	  inc $0a14
$19:b03a  75 dd		 adc $dd,x
$19:b03c  4c 43 a1	  jmp $a143
$19:b03f  0f 84 1c 30   ora $301c84
$19:b043  a1 96		 lda ($96,x)
$19:b045  20 b0 e5	  jsr $e5b0
$19:b048  82 20 14	  brl $c46b
$19:b04b  0b			phd
$19:b04c  f5 38		 sbc $38,x
$19:b04e  2f 34 eb f5   and $f5eb34
$19:b052  fb			xce
$19:b053  1e 13 00	  asl $0013,x
$19:b056  c4 e1		 cpy $e1
$19:b058  f0 e1		 beq $b03b
$19:b05a  20 bf ae	  jsr $aebf
$19:b05d  c2 19		 rep #$19
$19:b05f  42 a2		 wdm #$a2
$19:b061  53 a9		 eor ($a9,s),y
$19:b063  a7 f6		 lda [$f6]
$19:b065  bf 2e c2 9c   lda $9cc22e,x
$19:b069  fc 07 e9	  jsr ($e907,x)
$19:b06c  d3 71		 cmp ($71,s),y
$19:b06e  e8			inx
$19:b06f  30 bb		 bmi $b02c
$19:b071  e3 d7		 sbc $d7,s
$19:b073  61 4d		 adc ($4d,x)
$19:b075  06 00		 asl $00
$19:b077  34 b4		 bit $b4,x
$19:b079  d0 c5		 bne $b040
$19:b07b  10 1d		 bpl $b09a
$19:b07d  42 9a		 wdm #$9a
$19:b07f  c9 15		 cmp #$15
$19:b081  c1 59		 cmp ($59,x)
$19:b083  64 12		 stz $12
$19:b085  16 0d		 asl $0d,x
$19:b087  d9 71 6e	  cmp $6e71,y
$19:b08a  28			plp
$19:b08b  68			pla
$19:b08c  95 97		 sta $97,x
$19:b08e  02 d0		 cop #$d0
$19:b090  c8			iny
$19:b091  24 68		 bit $68
$19:b093  9e 1a 5c	  stz $5c1a,x
$19:b096  6b			rtl
$19:b097  d0 31		 bne $b0ca
$19:b099  cf 40 85 62   cmp $628540
$19:b09d  23 58		 and $58,s
$19:b09f  1c 0b bd	  trb $bd0b
$19:b0a2  b2 cf		 lda ($cf)
$19:b0a4  89 c4		 bit #$c4
$19:b0a6  42 82		 wdm #$82
$19:b0a8  88			dey
$19:b0a9  0b			phd
$19:b0aa  7c 60 90	  jmp ($9060,x)
$19:b0ad  32 62		 and ($62)
$19:b0af  70 7d		 bvs $b12e
$19:b0b1  1c 08 20	  trb $2008
$19:b0b4  59 41 a0	  eor $a041,y
$19:b0b7  09 da		 ora #$da
$19:b0b9  53 39		 eor ($39,s),y
$19:b0bb  b2 cb		 lda ($cb)
$19:b0bd  20 81 42	  jsr $4281
$19:b0c0  fe 86 50	  inc $5086,x
$19:b0c3  5e 62 41	  lsr $4162,x
$19:b0c6  12 08		 ora ($08)
$19:b0c8  2a			rol a
$19:b0c9  06 82		 asl $82
$19:b0cb  34 10		 bit $10,x
$19:b0cd  54 09 c6	  mvn $c6,$09
$19:b0d0  fa			plx
$19:b0d1  77 03		 adc [$03],y
$19:b0d3  57 9e		 eor [$9e],y
$19:b0d5  fd f8 b0	  sbc $b0f8,x
$19:b0d8  78			sei
$19:b0d9  2a			rol a
$19:b0da  91 1d		 sta ($1d),y
$19:b0dc  e0 fd 09	  cpx #$09fd
$19:b0df  9b			txy
$19:b0e0  c0 66 50	  cpy #$5066
$19:b0e3  65 a2		 adc $a2
$19:b0e5  2b			pld
$19:b0e6  c1 fa		 cmp ($fa,x)
$19:b0e8  12 19		 ora ($19)
$19:b0ea  16 fe		 asl $fe,x
$19:b0ec  41 21		 eor ($21,x)
$19:b0ee  61 b4		 adc ($b4,x)
$19:b0f0  89 fa		 bit #$fa
$19:b0f2  0e 2b c1	  asl $c12b
$19:b0f5  64 99		 stz $99
$19:b0f7  da			phx
$19:b0f8  dc 09 74	  jml [$7409]
$19:b0fb  a7 43		 lda [$43]
$19:b0fd  a2 d1 68	  ldx #$68d1
$19:b100  e5 2f		 sbc $2f
$19:b102  07 97		 ora [$97]
$19:b104  6a			ror a
$19:b105  35 3f		 and $3f,x
$19:b107  dd 56 af	  cmp $af56,x
$19:b10a  58			cli
$19:b10b  00 0d		 brk #$0d
$19:b10d  50 0d		 bvc $b11c
$19:b10f  25 db		 and $db
$19:b111  0d 8e cb	  ora $cb8e
$19:b114  65 b3		 adc $b3
$19:b116  da			phx
$19:b117  04 1d		 tsb $1d
$19:b119  de 1b 9d	  dec $9d1b,x
$19:b11c  d6 eb		 dec $eb,x
$19:b11e  76 f5		 ror $f5,x
$19:b120  01 0b		 ora ($0b,x)
$19:b122  3b			tsc
$19:b123  d3 3b		 cmp ($3b,s),y
$19:b125  0c 86 53	  tsb $5386
$19:b128  a9 b4		 lda #$b4
$19:b12a  da			phx
$19:b12b  73 f1		 adc ($f1,s),y
$19:b12d  01 03		 ora ($03,x)
$19:b12f  be 1d 80	  ldx $801d,y
$19:b132  ac 06 a0	  ldy $a006
$19:b135  0c 7d ed	  tsb $ed7d
$19:b138  36 53		 rol $53,x
$19:b13a  ff 24 85 34   sbc $348524,x
$19:b13e  38			sec
$19:b13f  e5 a0		 sbc $a0
$19:b141  23 90		 and $90,s
$19:b143  ec 05 a4	  cpx $a405
$19:b146  70 22		 bvs $b16a
$19:b148  d0 15		 bne $b15f
$19:b14a  80 6a		 bra $b1b6
$19:b14c  06 62		 asl $62
$19:b14e  37 a2		 and [$a2],y
$19:b150  02 20		 cop #$20
$19:b152  08			php
$19:b153  ff 50 7a c7   sbc $c77a50,x
$19:b157  d8			cld
$19:b158  5e d3 f6	  lsr $f6d3,x
$19:b15b  f4 0c c1	  pea $c10c
$19:b15e  1b			tcs
$19:b15f  55 ca		 eor $ca,x
$19:b161  e9 0c		 sbc #$0c
$19:b163  35 88		 and $88,x
$19:b165  e9 ad		 sbc #$ad
$19:b167  56 ca		 lsr $ca,x
$19:b169  61 b4		 adc ($b4,x)
$19:b16b  47 59		 eor [$59]
$19:b16d  8c 0d 00	  sty $000d
$19:b170  de 7b 2c	  dec $2c7b,x
$19:b173  b3 3a		 lda ($3a,s),y
$19:b175  ef c6 f0 3f   sbc $3ff0c6
$19:b179  f1 bc		 sbc ($bc),y
$19:b17b  00 ff		 brk #$ff
$19:b17d  10 53		 bpl $b1d2
$19:b17f  78			sei
$19:b180  51 82		 eor ($82),y
$19:b182  62 f6 f7	  per $a97b
$19:b185  a4 fd		 ldy $fd
$19:b187  49 eb		 eor #$eb
$19:b189  5f 63 7b 5f   eor $5f7b63,x
$19:b18d  db			stp
$19:b18e  c9 6d		 cmp #$6d
$19:b190  77 e3		 adc [$e3],y
$19:b192  b8			clv
$19:b193  25 50		 and $50
$19:b195  50 08		 bvc $b19f
$19:b197  e6 e0		 inc $e0
$19:b199  40			rti
$19:b19a  12 02		 ora ($02)
$19:b19c  04 06		 tsb $06
$19:b19e  01 b5		 ora ($b5,x)
$19:b1a0  8a			txa
$19:b1a1  42 63		 wdm #$63
$19:b1a3  30 98		 bmi $b13d
$19:b1a5  a4 4f		 ldy $4f
$19:b1a7  3b			tsc
$19:b1a8  19 08 04	  ora $0408,y
$19:b1ab  26 27		 rol $27
$19:b1ad  14 39		 trb $39
$19:b1af  05 b6		 ora $b6
$19:b1b1  0e 6f 21	  asl $216f
$19:b1b4  0b			phd
$19:b1b5  c0 36 a1	  cpy #$a136
$19:b1b8  a1 8a		 lda ($8a,x)
$19:b1ba  04 83		 tsb $83
$19:b1bc  3a			dec a
$19:b1bd  10 40		 bpl $b1ff
$19:b1bf  ef 8b 80 2e   sbc $2e808b
$19:b1c3  31 90		 and ($90),y
$19:b1c5  d8			cld
$19:b1c6  0d 86 26	  ora $2686
$19:b1c9  12 11		 ora ($11)
$19:b1cb  ef 93 8c 26   sbc $268c93
$19:b1cf  43 77		 eor $77,s
$19:b1d1  81 40		 sta ($40,x)
$19:b1d3  a0 28 11	  ldy #$1128
$19:b1d6  ce a0 12	  dec $12a0
$19:b1d9  04 ee		 tsb $ee
$19:b1db  01 0a		 ora ($0a,x)
$19:b1dd  7f c4 fc 17   adc $17fcc4,x
$19:b1e1  08			php
$19:b1e2  98			tya
$19:b1e3  68			pla
$19:b1e4  41 a0		 eor ($a0,x)
$19:b1e6  5f f0 82 95   eor $9582f0,x
$19:b1ea  fd 71 0c	  sbc $0c71,x
$19:b1ed  92 ce		 sta ($ce)
$19:b1ef  8c 10 9a	  sty $9a10
$19:b1f2  38			sec
$19:b1f3  d8			cld
$19:b1f4  43 c4		 eor $c4,s
$19:b1f6  a0 f0 07	  ldy #$07f0
$19:b1f9  ba			tsx
$19:b1fa  db			stp
$19:b1fb  65 50		 adc $50
$19:b1fd  58			cli
$19:b1fe  2e 6f 1b	  rol $1b6f
$19:b201  2b			pld
$19:b202  26 83		 rol $83
$19:b204  dd 49 e1	  cmp $e149,x
$19:b207  02 39		 cop #$39
$19:b209  02 84		 cop #$84
$19:b20b  00 ce		 brk #$ce
$19:b20d  cf 48 20 1a   cmp $1a2048
$19:b211  21 3f		 and ($3f,x)
$19:b213  b8			clv
$19:b214  13 a8		 ora ($a8,s),y
$19:b216  c3 1e		 cmp $1e,s
$19:b218  29 67		 and #$67
$19:b21a  42 be		 wdm #$be
$19:b21c  1a			inc a
$19:b21d  65 06		 adc $06
$19:b21f  30 8c		 bmi $b1ad
$19:b221  cc 6d 06	  cpy $066d
$19:b224  f4 7b 3e	  pea $3e7b
$19:b227  d6 05		 dec $05,x
$19:b229  02 80		 cop #$80
$19:b22b  a0 44 8d	  ldy #$8d44
$19:b22e  e3 7f		 sbc $7f,s
$19:b230  04 33		 tsb $33
$19:b232  80 20		 bra $b254
$19:b234  3f b8 0c 4d   and $4d0cb8,x
$19:b238  2d 39 d4	  and $d439
$19:b23b  28			plp
$19:b23c  11 2a		 ora ($2a),y
$19:b23e  04 51		 tsb $51
$19:b240  08			php
$19:b241  cc 04 2b	  cpy $2b04
$19:b244  1b			tcs
$19:b245  58			cli
$19:b246  0a			asl a
$19:b247  88			dey
$19:b248  33 b0		 and ($b0,s),y
$19:b24a  11 2c		 ora ($2c),y
$19:b24c  3b			tsc
$19:b24d  bd ff e1	  lda $e1ff,x
$19:b250  0f 10 f8 cb   ora $cbf810
$19:b254  c8			iny
$19:b255  7e 54 f3	  ror $f354,x
$19:b258  2f 9d bd 0f   and $0fbd9d
$19:b25c  e9 8f		 sbc #$8f
$19:b25e  54 fa eb	  mvn $eb,$fa
$19:b261  d9 7e dc	  cmp $dc7e,y
$19:b264  f7 6f		 sbc [$6f],y
$19:b266  bf bc 1f e2   lda $e21fbc,x
$19:b26a  0f 18 f9 0b   ora $0bf918
$19:b26e  ca			dex
$19:b26f  7e 64 f3	  ror $f364,x
$19:b272  af a1 bd 2f   lda $2fbda1
$19:b276  ea			nop
$19:b277  8f 5c fb 2b   sta $2bfb5c
$19:b27b  db			stp
$19:b27c  7e de 0b	  ror $0bde,x
$19:b27f  6c 1e 52	  jmp ($521e)
$19:b282  f1 a8		 sbc ($a8),y
$19:b284  06 d6		 asl $d6
$19:b286  33 14		 and ($14,s),y
$19:b288  84 c2		 sty $c2
$19:b28a  62 71 4c	  per $fefe
$19:b28d  e8			inx
$19:b28e  04 23		 tsb $23
$19:b290  30 98		 bmi $b22a
$19:b292  a4 4d		 ldy $4d
$19:b294  fa			plx
$19:b295  0e ff 81	  asl $81ff
$19:b298  40			rti
$19:b299  a0 22 13	  ldy #$1322
$19:b29c  11 a3		 ora ($a3),y
$19:b29e  7b			tdc
$19:b29f  c7 de		 cmp [$de]
$19:b2a1  4f f3 07 9c   eor $9c07f3
$19:b2a5  7d 05 e9	  adc $e905,x
$19:b2a8  3f 52 7a d7   and $d77a52,x
$19:b2ac  d8			cld
$19:b2ad  de d7 f6	  dec $f6d7,x
$19:b2b0  f2 6d		 sbc ($6d)
$19:b2b2  63 20		 adc $20,s
$19:b2b4  70 84		 bvs $b23a
$19:b2b6  c4 e2		 cpy $e2
$19:b2b8  80 d0		 bra $b28a
$19:b2ba  6f 2d b6 65   adc $65b62d
$19:b2be  06 00		 asl $00
$19:b2c0  8c cd ed	  sty $edcd
$19:b2c3  02 74		 cop #$74
$19:b2c5  83 37		 sta $37,s
$19:b2c7  bc 4f e3	  ldy $e34f,x
$19:b2ca  8f 24 f9 6b   sta $6bf924
$19:b2ce  cd 7e 7c	  cmp $7c7e
$19:b2d1  f4 6f a7	  pea $a76f
$19:b2d4  bd 5f ec	  lda $ec5f,x
$19:b2d7  0f 68 fb 8a   ora $8afb68
$19:b2db  80 00		 bra $b2dd
$19:b2dd  20 80 3b	  jsr $3b80
$19:b2e0  fc 01 e0	  jsr ($e001,x)
$19:b2e3  63 81		 adc $81,s
$19:b2e5  c0 23 d0	  cpy #$d023
$19:b2e8  1b			tcs
$19:b2e9  a4 3b		 ldy $3b
$19:b2eb  bb			tyx
$19:b2ec  32 07		 and ($07)
$19:b2ee  4c 7e 03	  jmp $037e
$19:b2f1  7f 80 7f c0   adc $c07f80,x
$19:b2f5  cd d8 90	  cmp $90d8
$19:b2f8  6f 39 1c 98   adc $981c39
$19:b2fc  95 83		 sta $83,x
$19:b2fe  9a			txs
$19:b2ff  06 7f		 asl $7f
$19:b301  c4 03		 cpy $03
$19:b303  f9 e4 ff	  sbc $ffe4,y
$19:b306  cc 85 ce	  cpy $ce85
$19:b309  06 4c		 asl $4c
$19:b30b  00 1b		 brk #$1b
$19:b30d  b0 13		 bcs $b322
$19:b30f  98			tya
$19:b310  35 ee		 and $ee,x
$19:b312  31 71		 and ($71),y
$19:b314  97 5f		 sta [$5f],y
$19:b316  a2 1b cb	  ldx #$cb1b
$19:b319  27 8e		 and [$8e]
$19:b31b  c9 d7		 cmp #$d7
$19:b31d  ac ed 68	  ldy $68ed
$19:b320  d0 09		 bne $b32b
$19:b322  fc 1c 58	  jsr ($581c,x)
$19:b325  17 f8		 ora [$f8],y
$19:b327  7d fe 37	  adc $37fe,x
$19:b32a  ff 8c 7f e4   sbc $e47f8c,x
$19:b32e  3f e9 c7 ff   and $ffc7e9,x
$19:b332  db			stp
$19:b333  27 cc		 and [$cc]
$19:b335  4a			lsr a
$19:b336  74 b0		 stz $b0,x
$19:b338  be 7e 83	  ldx $837e,y
$19:b33b  15 39		 ora $39,x
$19:b33d  a8			tay
$19:b33e  76 fd		 ror $fd,x
$19:b340  59 8e a6	  eor $a68e,y
$19:b343  c1 12		 cmp ($12,x)
$19:b345  1c 6f fd	  trb $fd6f
$19:b348  c3 ff		 cmp $ff,s
$19:b34a  1f ff f1 ff   ora $fff1ff,x
$19:b34e  f2 7f		 sbc ($7f)
$19:b350  fe 1e ff	  inc $ff1e,x
$19:b353  8f bf f4 e0   sta $e0f4bf
$19:b357  14 d9		 trb $d9
$19:b359  84 9e		 sty $9e
$19:b35b  31 9f		 and ($9f),y
$19:b35d  80 7b		 bra $b3da
$19:b35f  c5 a3		 cmp $a3
$19:b361  7f c0 0b 83   adc $830bc0,x
$19:b365  fe bf de	  inc $debf,x
$19:b368  a4 23		 ldy $23
$19:b36a  d1 10		 cmp ($10),y
$19:b36c  fc 44 3d	  jsr ($3d44,x)
$19:b36f  04 71		 tsb $71
$19:b371  f8			sed
$19:b372  42 3f		 wdm #$3f
$19:b374  8d a1 f0	  sta $f0a1
$19:b377  7f 3c 1f 87   adc $871f3c,x
$19:b37b  08			php
$19:b37c  7c 1c 89	  jmp ($891c,x)
$19:b37f  fc 75 84	  jsr ($8475,x)
$19:b382  12 21		 ora ($21)
$19:b384  14 80		 trb $80
$19:b386  3c 42 3d	  bit $3d42,x
$19:b389  18			clc
$19:b38a  89 46		 bit #$46
$19:b38c  21 10		 and ($10,x)
$19:b38e  08			php
$19:b38f  64 12		 stz $12
$19:b391  11 0c		 ora ($0c),y
$19:b393  87 c7		 sta [$c7]
$19:b395  df e5 17 87   cmp $8717e5,x
$19:b399  81 42		 sta ($42,x)
$19:b39b  0f 0f 81 c3   ora $c3810f
$19:b39f  e1 70		 sbc ($70,x)
$19:b3a1  7b			tdc
$19:b3a2  65 da		 adc $da
$19:b3a4  df 75 b7 5d   cmp $5db775,x
$19:b3a8  66 d3		 ror $d3
$19:b3aa  b9 bc e8	  lda $e8bc,y
$19:b3ad  2e 11 b8	  rol $b811
$19:b3b0  ee 6e 3b	  inc $3b6e
$19:b3b3  85 fd		 sta $fd
$19:b3b5  e1 04		 sbc ($04,x)
$19:b3b7  03 c2		 ora $c2,s
$19:b3b9  fe 89 4b	  inc $4b89,x
$19:b3bc  c3 fe		 cmp $fe,s
$19:b3be  15 84		 ora $84,x
$19:b3c0  fc fe 10	  jsr ($10fe,x)
$19:b3c3  08			php
$19:b3c4  fc 03 3f	  jsr ($3f03,x)
$19:b3c7  80 c7		 bra $b390
$19:b3c9  e0 28 fc	  cpx #$fc28
$19:b3cc  0b			phd
$19:b3cd  1f 83 62 a3   ora $a36283,x
$19:b3d1  05 f9		 ora $f9
$19:b3d3  df c8 83 3f   cmp $3f83c8,x
$19:b3d7  52 0c		 eor ($0c)
$19:b3d9  3f ff fd 80   and $80fdff,x
$19:b3dd  7f 20 3f f8   adc $f83f20,x
$19:b3e1  0f fa 00 55   ora $5500fa
$19:b3e5  2f ec 07 f5   and $f507ec
$19:b3e9  03 ff		 ora $ff,s
$19:b3eb  7f cb e4 bf   adc $bfe4cb,x
$19:b3ef  42 f8		 wdm #$f8
$19:b3f1  7f 17 a0 6f   adc $6fa017,x
$19:b3f5  1c 01 c8	  trb $c801
$19:b3f8  68			pla
$19:b3f9  07 30		 ora [$30]
$19:b3fb  d0 60		 bne $b45d
$19:b3fd  2a			rol a
$19:b3fe  10 8b		 bpl $b38b
$19:b400  01 bc		 ora ($bc,x)
$19:b402  8e 44 77	  stx $7744
$19:b405  0b			phd
$19:b406  06 02		 asl $02
$19:b408  61 80		 adc ($80,x)
$19:b40a  cc 1f ce	  cpy $ce1f
$19:b40d  03 00		 ora $00,s
$19:b40f  83 40		 sta $40,s
$19:b411  21 10		 and ($10,x)
$19:b413  58			cli
$19:b414  8c 1e 27	  sty $271e
$19:b417  0f 91 c3 d1   ora $d1c391
$19:b41b  e9 07		 sbc #$07
$19:b41d  80 43		 bra $b462
$19:b41f  a0 11 88	  ldy #$8811
$19:b422  04 42		 tsb $42
$19:b424  01 30		 ora ($30,x)
$19:b426  3b			tsc
$19:b427  04 ef		 tsb $ef
$19:b429  31 3c		 and ($3c),y
$19:b42b  cc 5f a9	  cpy $a95f
$19:b42e  19 c8 07	  ora $07c8,y
$19:b431  ba			tsx
$19:b432  01 b0		 ora ($b0,x)
$19:b434  82 72 b0	  brl $64a9
$19:b437  1f 3a 24 03   ora $03243a,x
$19:b43b  87 00		 sta [$00]
$19:b43d  e0 c0 3c	  cpx #$3cc0
$19:b440  70 0b		 bvs $b44d
$19:b442  8c 02 fe	  sty $fe02
$19:b445  30 14		 bmi $b45b
$19:b447  f0 40		 beq $b489
$19:b449  61 d0		 adc ($d0,x)
$19:b44b  3b			tsc
$19:b44c  e4 1a		 cpx $1a
$19:b44e  32 cf		 and ($cf)
$19:b450  08			php
$19:b451  34 e2		 bit $e2,x
$19:b453  33 e0		 and ($e0,s),y
$19:b455  83 de		 sta $de,s
$19:b457  3f 90 03 70   and $700390,x
$19:b45b  37 d3		 and [$d3],y
$19:b45d  fd 01 fc	  sbc $fc01,x
$19:b460  c1 8d		 cmp ($8d,x)
$19:b462  c1 fc		 cmp ($fc,x)
$19:b464  81 a4		 sta ($a4,x)
$19:b466  c2 07		 rep #$07
$19:b468  00 81		 brk #$81
$19:b46a  40			rti
$19:b46b  60			rts
$19:b46c  d0 38		 bne $b4a6
$19:b46e  4c 1e 2d	  jmp $2d1e
$19:b471  09 9c		 ora #$9c
$19:b473  c2 26		 rep #$26
$19:b475  b1 d4		 lda ($d4),y
$19:b477  90 bc		 bcc $b435
$19:b479  41 e2		 eor ($e2,x)
$19:b47b  0a			asl a
$19:b47c  50 4f		 bvc $b4cd
$19:b47e  04 7e		 tsb $7e
$19:b480  0f 3f 81 4f   ora $4f813f
$19:b484  ed 7d 8f	  sbc $8f7d
$19:b487  84 3e		 sty $3e
$19:b489  95 44		 sta $44,x
$19:b48b  e5 4d		 sbc $4d
$19:b48d  b5 54		 lda $54,x
$19:b48f  d8			cld
$19:b490  cf ca 85 98   cmp $9885ca
$19:b494  99 e3 a0	  sta $a0e3,y
$19:b497  ed f1 df	  sbc $dff1
$19:b49a  94 c3		 sty $c3,x
$19:b49c  ff f0 ff c3   sbc $c3fff0,x
$19:b4a0  3f fe 7f fd   and $fd7ffe,x
$19:b4a4  c4 50		 cpy $50
$19:b4a6  16 6c		 asl $6c,x
$19:b4a8  ce ae 25	  dec $25ae
$19:b4ab  de e4 d8	  dec $d8e4,x
$19:b4ae  2c d3 0b	  bit $0bd3
$19:b4b1  6f 2a 99 bb   adc $bb992a
$19:b4b5  b3 58		 lda ($58,s),y
$19:b4b7  73 3f		 adc ($3f,s),y
$19:b4b9  fa			plx
$19:b4ba  27 fe		 and [$fe]
$19:b4bc  43 ff		 eor $ff,s
$19:b4be  cf ff f9 ff   cmp $fff9ff
$19:b4c2  f9 bf fc	  sbc $fcbf,y
$19:b4c5  3e 04 50	  rol $5004,x
$19:b4c8  e0 60 2e	  cpx #$2e60
$19:b4cb  14 0d		 trb $0d
$19:b4cd  c4 42		 cpy $42
$19:b4cf  d9 88 ce	  cmp $ce88,y
$19:b4d2  5c 2e 12 4e   jml $4e122e
$19:b4d6  84 13		 sty $13
$19:b4d8  f9 08 80	  sbc $8008,y
$19:b4db  13 c3		 ora ($c3,s),y
$19:b4dd  e1 c0		 sbc ($c0,x)
$19:b4df  fc 74 3f	  jsr ($3f74,x)
$19:b4e2  9c 83 30	  stz $3083
$19:b4e5  fa			plx
$19:b4e6  3f 9e 0f e5   and $e50f9e,x
$19:b4ea  2a			rol a
$19:b4eb  1b			tcs
$19:b4ec  53 8f		 eor ($8f,s),y
$19:b4ee  d9 64 31	  cmp $3164,y
$19:b4f1  c9 04 b2	  cmp #$b204
$19:b4f4  01 2a		 ora ($2a,x)
$19:b4f6  80 49		 bra $b541
$19:b4f8  24 13		 bit $13
$19:b4fa  49 84 c2	  eor #$c284
$19:b4fd  ff 20 bf c7   sbc $c7bf20,x
$19:b501  af f1 f9 fa   lda $faf9f1
$19:b505  14 90		 trb $90
$19:b507  c1 2f		 cmp ($2f,x)
$19:b509  8f fa ab 17   sta $17abfa
$19:b50d  5c e6 c7 91   jml $91c7e6
$19:b511  b4 ee		 ldy $ee,x
$19:b513  6f 3a 9d 8f   adc $8f9d3a
$19:b517  25 6a		 and $6a
$19:b519  dd 5c b5	  cmp $b55c,x
$19:b51c  51 f7		 eor ($f7),y
$19:b51e  f1 3f		 sbc ($3f),y
$19:b520  78			sei
$19:b521  7c 14 20	  jmp ($2014,x)
$19:b524  a1 08		 lda ($08,x)
$19:b526  1f ff 13 f7   ora $f713ff,x
$19:b52a  55 83		 eor $83,x
$19:b52c  24 1b		 bit $1b
$19:b52e  ec df 05	  cpx $05df
$19:b531  78			sei
$19:b532  2b			pld
$19:b533  c5 7f		 cmp $7f
$19:b535  bf 48 07 e2   lda $e20748,x
$19:b539  09 fe 69	  ora #$69fe
$19:b53c  0f e9 a0 10   ora $10a0e9
$19:b540  2f fb 68 7f   and $7f68fb
$19:b544  1f c6 f8 ff   ora $fff8c6,x
$19:b548  9c 61 fc	  stz $fc61
$19:b54b  73 17		 adc ($17,s),y
$19:b54d  fd d6 10	  sbc $10d6,x
$19:b550  e8			inx
$19:b551  54 56 1f	  mvn $1f,$56
$19:b554  16 80		 asl $80,x
$19:b556  c8			iny
$19:b557  e1 12		 sbc ($12,x)
$19:b559  88			dey
$19:b55a  ec b2 1f	  cpx $1fb2
$19:b55d  03 83		 ora $83,s
$19:b55f  d0 23		 bne $b584
$19:b561  d0 98		 bne $b4fb
$19:b563  3c 72 06	  bit $0672,x
$19:b566  01 09		 ora ($09,x)
$19:b568  b3 d0		 lda ($d0,s),y
$19:b56a  20 13 08	  jsr $0813
$19:b56d  04 e2		 tsb $e2
$19:b56f  01 61		 ora ($61,x)
$19:b571  80 4b		 bra $b5be
$19:b573  65 51		 adc $51
$19:b575  38			sec
$19:b576  e7 9f		 sbc [$9f]
$19:b578  f3 bf		 sbc ($bf,s),y
$19:b57a  a3 7e		 lda $7e,s
$19:b57c  2e b0 19	  rol $19b0
$19:b57f  14 0f		 trb $0f
$19:b581  99 05 8d	  sta $8d05,y
$19:b584  74 3f		 stz $3f,x
$19:b586  fe 0f fc	  inc $fc0f,x
$19:b589  07 fd		 ora [$fd]
$19:b58b  07 fc		 ora [$fc]
$19:b58d  2c ca 7e	  bit $7eca
$19:b590  b8			clv
$19:b591  1e c6 e3	  asl $e3c6,x
$19:b594  dd de f9	  cmp $f9de,x
$19:b597  fb			xce
$19:b598  ff 97 bd fc   sbc $fcbd97,x
$19:b59c  1a			inc a
$19:b59d  41 1b		 eor ($1b,x)
$19:b59f  c8			iny
$19:b5a0  42 32		 wdm #$32
$19:b5a2  10 ec		 bpl $b590
$19:b5a4  3d ff 83	  and $83ff,x
$19:b5a7  3f f0 47 ff   and $ff47f0,x
$19:b5ab  10 7d		 bpl $b62a
$19:b5ad  f5 06		 sbc $06,x
$19:b5af  79 c0 cf	  adc $cfc0,y
$19:b5b2  d8			cld
$19:b5b3  09 61 75	  ora #$7561
$19:b5b6  83 42		 sta $42,s
$19:b5b8  a1 9e		 lda ($9e,x)
$19:b5ba  cf 8c c7 97   cmp $97c78c
$19:b5be  c4 97		 cpy $97
$19:b5c0  dc 3f d0	  jml [$d03f]
$19:b5c3  0f cc 06 26   ora $2606cc
$19:b5c7  26 0f		 rol $0f
$19:b5c9  8f fa 05 fc   sta $fc05fa
$19:b5cd  86 7c		 stx $7c
$19:b5cf  26 1c		 rol $1c
$19:b5d1  08			php
$19:b5d2  0c 02 0d	  tsb $0d02
$19:b5d5  00 fe		 brk #$fe
$19:b5d7  40			rti
$19:b5d8  29 1e 0a	  and #$0a1e
$19:b5db  07 a3		 ora [$a3]
$19:b5dd  89 f8 c0	  bit #$c0f8
$19:b5e0  7d 24 5f	  adc $5f24,x
$19:b5e3  4a			lsr a
$19:b5e4  0f 8b 81 ea   ora $ea818b
$19:b5e8  c0 77 63	  cpy #$6377
$19:b5eb  10 03		 bpl $b5f0
$19:b5ed  f8			sed
$19:b5ee  43 10		 eor $10,s
$19:b5f0  43 0e		 eor $0e,s
$19:b5f2  80 47		 bra $b63b
$19:b5f4  e0 11 78	  cpx #$7811
$19:b5f7  04 8a		 tsb $8a
$19:b5f9  01 21		 ora ($21,x)
$19:b5fb  83 c8		 sta $c8,s
$19:b5fd  12 01		 ora ($01)
$19:b5ff  03 a0		 ora $a0,s
$19:b601  4a			lsr a
$19:b602  68			pla
$19:b603  0f c0 97 e0   ora $e097c0
$19:b607  2b			pld
$19:b608  f8			sed
$19:b609  08			php
$19:b60a  78			sei
$19:b60b  2c 01 61	  bit $6101
$19:b60e  3c 80 5d	  bit $5d80,x
$19:b611  a0 17 88	  ldy #$8817
$19:b614  05 42		 ora $42
$19:b616  01 e0		 ora ($e0,x)
$19:b618  80 7c		 bra $b696
$19:b61a  20 1c 0f	  jsr $0f1c
$19:b61d  e4 e0		 cpx $e0
$19:b61f  5a			phy
$19:b620  0a			asl a
$19:b621  d0 e0		 bne $b603
$19:b623  c0 33 f0	  cpy #$f033
$19:b626  0e 3c 03	  asl $033c
$19:b629  e7 00		 sbc [$00]
$19:b62b  e1 c0		 sbc ($c0,x)
$19:b62d  e0 0c 00	  cpx #$000c
$19:b630  87 8a		 sta [$8a]
$19:b632  86 fe		 stx $fe
$19:b634  2a			rol a
$19:b635  16 19		 asl $19,x
$19:b637  47 ec		 eor [$ec]
$19:b639  10 69		 bpl $b6a4
$19:b63b  c4 3a		 cpy $3a
$19:b63d  e0 25 08	  cpx #$0825
$19:b640  77 c2		 adc [$c2],y
$19:b642  f3 80		 sbc ($80,s),y
$19:b644  9f f0 1b 60   sta $601bf0,x
$19:b648  2d 0f f0	  and $f00f
$19:b64b  8c 20 2d	  sty $2d20
$19:b64e  f2 fc		 sbc ($fc)
$19:b650  c1 85		 cmp ($85,x)
$19:b652  a0 2d 0c	  ldy #$0c2d
$19:b655  c4 1f		 cpy $1f
$19:b657  1e 6a 08	  asl $086a,x
$19:b65a  0c 32 07	  tsb $0732
$19:b65d  4c 81 e5	  jmp $e581
$19:b660  a0 33 35	  ldy #$3533
$19:b663  10 92		 bpl $b5f7
$19:b665  c3 1e		 cmp $1e,s
$19:b667  d4 18		 pei ($18)
$19:b669  7f c2 9f b0   adc $b09fc2,x
$19:b66d  cb			wai
$19:b66e  da			phx
$19:b66f  26 7c		 rol $7c
$19:b671  c9 e7 0e	  cmp #$0ee7
$19:b674  0f ef 87 ef   ora $ef87ef
$19:b678  e0 37 78	  cpx #$7837
$19:b67b  1f 3e 0c b8   ora $b80c3e,x
$19:b67f  01 58		 ora ($58,x)
$19:b681  66 78		 ror $78
$19:b683  73 c5		 adc ($c5,s),y
$19:b685  68			pla
$19:b686  c0 31 0a	  cpy #$0a31
$19:b689  c1 55		 cmp ($55,x)
$19:b68b  80 84		 bra $b611
$19:b68d  3c ee c1	  bit $c1ee,x
$19:b690  c8			iny
$19:b691  7e fc 1f	  ror $1ffc,x
$19:b694  9e 07 ce	  stz $ce07,x
$19:b697  03 eb		 ora $eb,s
$19:b699  80 f5		 bra $b690
$19:b69b  e4 74		 cpx $74
$19:b69d  fe 54 7e	  inc $7e54,x
$19:b6a0  39 3f 35	  and $353f,y
$19:b6a3  81 ac		 sta ($ac,x)
$19:b6a5  10 61		 bpl $b708
$19:b6a7  1c 50 08	  trb $0850
$19:b6aa  95 32		 sta $32,x
$19:b6ac  1e 0e 41	  asl $410e,x
$19:b6af  40			rti
$19:b6b0  7c 9f 02	  jmp ($029f,x)
$19:b6b3  a8			tay
$19:b6b4  5c bf 17 af   jml $af17bf
$19:b6b8  c7 e7		 cmp [$e7]
$19:b6ba  f9 10 40	  sbc $4010,y
$19:b6bd  0a			asl a
$19:b6be  05 07		 ora $07
$19:b6c0  e4 bf		 cpx $bf
$19:b6c2  23 73		 and $73,s
$19:b6c4  60			rts
$19:b6c5  20 16 08	  jsr $0816
$19:b6c8  04 40		 tsb $40
$19:b6ca  9a			txs
$19:b6cb  07 09		 ora [$09]
$19:b6cd  55 84		 eor $84,x
$19:b6cf  c2 01		 rep #$01
$19:b6d1  cf 90 5f b2   cmp $b25f90
$19:b6d5  17 fc		 ora [$fc],y
$19:b6d7  8f fe 21 67   sta $6721fe
$19:b6db  bc 79 e2	  ldy $e279,x
$19:b6de  12 7e		 ora ($7e)
$19:b6e0  84 f7		 sty $f7
$19:b6e2  99 5f df	  sta $df5f,y
$19:b6e5  f3 e7		 sbc ($e7,s),y
$19:b6e7  f8			sed
$19:b6e8  eb			xba
$19:b6e9  fd 3f 7f	  sbc $7f3f,x
$19:b6ec  47 df		 eor [$df]
$19:b6ee  a9 43 df	  lda #$df43
$19:b6f1  1f e1 cf e0   ora $e0cfe1,x
$19:b6f5  f7 09		 sbc [$09],y
$19:b6f7  87 fa		 sta [$fa]
$19:b6f9  93 c9		 sta ($c9,s),y
$19:b6fb  97 57		 sta [$57],y
$19:b6fd  e2 13		 sep #$13
$19:b6ff  c0 c0		 cpy #$c0
$19:b701  6a			ror a
$19:b702  e7 1d		 sbc [$1d]
$19:b704  78			sei
$19:b705  86 3f		 stx $3f
$19:b707  1f 01 c0 cd   ora $cdc001,x
$19:b70b  a0 1a		 ldy #$1a
$19:b70d  0d 07 0f	  ora $0f07
$19:b710  87 ff		 sta [$ff]
$19:b712  ff f1 ff fe   sbc $fefff1,x
$19:b716  ff fc 8e e1   sbc $e18efc,x
$19:b71a  2c 97 76	  bit $7697
$19:b71d  b0 15		 bcs $b734
$19:b71f  2e 9c e2	  rol $e29c
$19:b722  bd 83 9c	  lda $9c83,x
$19:b725  06 81		 asl $81
$19:b727  76 0b		 ror $0b,x
$19:b729  f0 e8		 beq $b713
$19:b72b  c0 64		 cpy #$64
$19:b72d  b5 a9		 lda $a9,x
$19:b72f  64 03		 stz $03
$19:b731  43 a1		 eor $a1,s
$19:b733  e3 b2		 sbc $b2,s
$19:b735  c1 94		 cmp ($94,x)
$19:b737  3b			tsc
$19:b738  fb			xce
$19:b739  fd bb a3	  sbc $a3bb,x
$19:b73c  47 ff		 eor [$ff]
$19:b73e  55 35		 eor $35,x
$19:b740  fa			plx
$19:b741  7a			ply
$19:b742  d7 7a		 cmp [$7a],y
$19:b744  e9 ec fc	  sbc #$fcec
$19:b747  f5 7a		 sbc $7a,x
$19:b749  22 c1 ff c7   jsl $c7ffc1
$19:b74d  bc 33 be	  ldy $be33,x
$19:b750  04 2f		 tsb $2f
$19:b752  c1 15		 cmp ($15,x)
$19:b754  f8			sed
$19:b755  60			rts
$19:b756  ac 1a eb	  ldy $eb1a
$19:b759  fc bf c1	  jsr ($c1bf,x)
$19:b75c  ef f0 5f fc   sbc $fc5ff0
$19:b760  1b			tcs
$19:b761  fb			xce
$19:b762  07 de		 ora [$de]
$19:b764  51 13		 eor ($13),y
$19:b766  e6 7c		 inc $7c
$19:b768  f9 94 38	  sbc $3894,y
$19:b76b  e4 7f		 cpx $7f
$19:b76d  fe 1f 4c	  inc $4c1f,x
$19:b770  fd fe 7e	  sbc $7efe,x
$19:b773  28			plp
$19:b774  16 48		 asl $48,x
$19:b776  60			rts
$19:b777  7f d3 f9 fe   adc $fef9d3,x
$19:b77b  5e 71 af	  lsr $af71,x
$19:b77e  99 eb 66	  sta $66eb,y
$19:b781  78			sei
$19:b782  79 c7 76	  adc $76c7,y
$19:b785  33 fe		 and ($fe,s),y
$19:b787  8e 3f c3	  stx $c33f
$19:b78a  80 40		 bra $b7cc
$19:b78c  1e 1f f3	  asl $f31f,x
$19:b78f  8d f8 e1	  sta $e1f8
$19:b792  7c 3d 7e	  jmp ($7e3d,x)
$19:b795  8f 0f e3 9b   sta $9be30f
$19:b799  3f dd f1 e6   and $e6f1dd,x
$19:b79d  bf bf 66 7f   lda $7f66bf,x
$19:b7a1  ed ef fc	  sbc $fcef
$19:b7a4  e3 f5		 sbc $f5,s
$19:b7a6  f1 3b		 sbc ($3b),y
$19:b7a8  2c ed fe	  bit $feed
$19:b7ab  40			rti
$19:b7ac  10 c0		 bpl $b76e
$19:b7ae  04 c2		 tsb $c2
$19:b7b0  3f e8 8b d0   and $d08be8,x
$19:b7b4  23 f8		 and $f8,s
$19:b7b6  08			php
$19:b7b7  7e fe ff	  ror $fffe,x
$19:b7ba  69 ff d6	  adc #$d6ff
$19:b7bd  bf 77 3c 7e   lda $7e3c77,x
$19:b7c1  fa			plx
$19:b7c2  b3 db		 lda ($db,s),y
$19:b7c4  bb			tyx
$19:b7c5  f9 be 2f	  sbc $2fbe,y
$19:b7c8  d4 82		 pei ($82)
$19:b7ca  00 06		 brk #$06
$19:b7cc  31 e7		 and ($e7),y
$19:b7ce  87 f8		 sta [$f8]
$19:b7d0  31 40		 and ($40),y
$19:b7d2  c7 9f		 cmp [$9f]
$19:b7d4  f8			sed
$19:b7d5  2e fa 8c	  rol $8cfa
$19:b7d8  9d 32 e6	  sta $e632,x
$19:b7db  1c 91 28	  trb $2891
$19:b7de  4f d5 02 2d   eor $2d02d5
$19:b7e2  4c e4 7f	  jmp $7fe4
$19:b7e5  6d 3e d6	  adc $d63e
$19:b7e8  4c f3 f2	  jmp $f2f3
$19:b7eb  ae ac 6f	  ldx $6fac
$19:b7ee  f7 18		 sbc [$18],y
$19:b7f0  31 81		 and ($81),y
$19:b7f2  0c 3c 1f	  tsb $1f3c
$19:b7f5  fe 09 00	  inc $0009,x
$19:b7f8  79 5f 5f	  adc $5f5f,y
$19:b7fb  3f 83 cc 4e   and $4ecc83,x
$19:b7ff  3f af ef 79   and $79efaf,x
$19:b803  ff d7 6f f2   sbc $f26fd7,x
$19:b807  f7 ff		 sbc [$ff],y
$19:b809  9c 3e 9b	  stz $9b3e
$19:b80c  33 3f		 and ($3f,s),y
$19:b80e  91 fc		 sta ($fc),y
$19:b810  a8			tay
$19:b811  06 04		 asl $04
$19:b813  8f cd a1 31   sta $31a1cd
$19:b817  88			dey
$19:b818  3c 72 07	  bit $0772,x
$19:b81b  0e 80 c1	  asl $c180
$19:b81e  e0 10		 cpx #$10
$19:b820  38			sec
$19:b821  06 0e		 asl $0e
$19:b823  01 01		 ora ($01,x)
$19:b825  80 4f		 bra $b876
$19:b827  f8			sed
$19:b828  11 f3		 ora ($f3),y
$19:b82a  38			sec
$19:b82b  78			sei
$19:b82c  21 ff		 and ($ff,x)
$19:b82e  08			php
$19:b82f  3f e2 07 fc   and $fc07e2,x
$19:b833  c1 df		 cmp ($df,x)
$19:b835  20 3f e8	  jsr $e83f
$19:b838  07 c2		 ora [$c2]
$19:b83a  00 f7		 brk #$f7
$19:b83c  09 fc 03	  ora #$03fc
$19:b83f  1f 00 e0 03   ora $03e000,x
$19:b843  c3 c1		 cmp $c1,s
$19:b845  1e e0 4e	  asl $4ee0,x
$19:b848  10 81		 bpl $b7cb
$19:b84a  f8			sed
$19:b84b  0b			phd
$19:b84c  93 7d		 sta ($7d,s),y
$19:b84e  a0 11		 ldy #$11
$19:b850  07 30		 ora [$30]
$19:b852  7e e0 3e	  ror $3ee0,x
$19:b855  78			sei
$19:b856  0c 3e 07	  tsb $073e
$19:b859  1f 80 5f e0   ora $e05f80,x
$19:b85d  11 e8		 ora ($e8),y
$19:b85f  00 f4		 brk #$f4
$19:b861  60			rts
$19:b862  90 05		 bcc $b869
$19:b864  f0 04		 beq $b86a
$19:b866  03 c1		 ora $c1,s
$19:b868  00 c0		 brk #$c0
$19:b86a  40			rti
$19:b86b  3c 27 f1	  bit $f127,x
$19:b86e  f8			sed
$19:b86f  7f 7e 1f ef   adc $ef1f7e,x
$19:b873  07 fb		 ora [$fb]
$19:b875  81 f6		 sta ($f6,x)
$19:b877  80 7b		 bra $b8f4
$19:b879  60			rts
$19:b87a  1c 58 04	  trb $0458
$19:b87d  9e 01 cf	  stz $cf01,x
$19:b880  7c 83 f4	  jmp ($f483,x)
$19:b883  1f a1 09 80   ora $8009a1,x
$19:b887  44 a0 13	  mvp $13,$a0
$19:b88a  a1 00		 lda ($00,x)
$19:b88c  84 00		 sty $00
$19:b88e  92 14		 sta ($14)
$19:b890  08			php
$19:b891  04 83		 tsb $83
$19:b893  01 90		 ora ($90,x)
$19:b895  f0 72		 beq $b909
$19:b897  3e 14 0f	  rol $0f14,x
$19:b89a  47 13		 eor [$13]
$19:b89c  e1 22		 sbc ($22,x)
$19:b89e  fe 12 40	  inc $4012,x
$19:b8a1  30 16		 bmi $b8b9
$19:b8a3  08			php
$19:b8a4  04 c0		 tsb $c0
$19:b8a6  84 2b		 sty $2b
$19:b8a8  e0 86		 cpx #$86
$19:b8aa  40			rti
$19:b8ab  20 c2 a1	  jsr $a1c2
$19:b8ae  07 04		 ora [$04]
$19:b8b0  fb			xce
$19:b8b1  01 be		 ora ($be,x)
$19:b8b3  c0 03		 cpy #$03
$19:b8b5  83 f8		 sta $f8,s
$19:b8b7  98			tya
$19:b8b8  11 08		 ora ($08),y
$19:b8ba  7f d3 e3 7f   adc $7fe3d3,x
$19:b8be  51 0a		 eor ($0a),y
$19:b8c0  99 e0 1d	  sta $1de0,y
$19:b8c3  f9 03 81	  sbc $8103,y
$19:b8c6  12 21		 ora ($21)
$19:b8c8  83 c1		 sta $c1,s
$19:b8ca  e1 ef		 sbc ($ef,x)
$19:b8cc  0a			asl a
$19:b8cd  68			pla
$19:b8ce  4f 85 f3 fe   eor $fef385
$19:b8d2  0d 0e bc	  ora $bc0e
$19:b8d5  41 63		 eor ($63,x)
$19:b8d7  9e f6 06	  stz $06f6,x
$19:b8da  f4 f9 9e	  pea $9ef9
$19:b8dd  1e f7 07	  asl $07f7,x
$19:b8e0  fd 81 df	  sbc $df81,x
$19:b8e3  60			rts
$19:b8e4  f7 98		 sbc [$98],y
$19:b8e6  2d e7 17	  and $17e7
$19:b8e9  f3 e7		 sbc ($e7,s),y
$19:b8eb  ed 6f ef	  sbc $ef6f
$19:b8ee  ef f2 52 0a   sbc $0a52f2
$19:b8f2  8c 77 d7	  sty $d777
$19:b8f5  fd ed ff	  sbc $ffed,x
$19:b8f8  8d 18 c2	  sta $c218
$19:b8fb  46 3d		 lsr $3d
$19:b8fd  15 0a		 ora $0a,x
$19:b8ff  45 c3		 eor $c3
$19:b901  a1 a0		 lda ($a0,x)
$19:b903  88			dey
$19:b904  58			cli
$19:b905  34 14		 bit $14,x
$19:b907  0a			asl a
$19:b908  06 01		 asl $01
$19:b90a  3e 5b f1	  rol $f15b,x
$19:b90d  10 a9		 bpl $b8b8
$19:b90f  5b			tcd
$19:b910  ed 06 bf	  sbc $bf06
$19:b913  40			rti
$19:b914  2e 10 f9	  rol $f910
$19:b917  84 3e		 sty $3e
$19:b919  41 1f		 eor ($1f,x)
$19:b91b  1b			tcs
$19:b91c  85 80		 sta $80
$19:b91e  74 3f		 stz $3f,x
$19:b920  95 fd		 sta $fd,x
$19:b922  27 c7		 and [$c7]
$19:b924  5f bf e1 f0   eor $f0e1bf,x
$19:b928  fe 30 1b	  inc $1b30,x
$19:b92b  c6 00		 dec $00
$19:b92d  aa			tax
$19:b92e  45 30		 eor $30
$19:b930  f0 c0		 beq $b8f2
$19:b932  68			pla
$19:b933  1f f9 e7 ff   ora $ffe7f9,x
$19:b937  fc a6 53	  jsr ($53a6,x)
$19:b93a  18			clc
$19:b93b  18			clc
$19:b93c  c1 df		 cmp ($df,x)
$19:b93e  e0 0f		 cpx #$0f
$19:b940  08			php
$19:b941  f8			sed
$19:b942  8b			phb
$19:b943  c6 7e		 dec $7e
$19:b945  c0 9d		 cpy #$9d
$19:b947  39 43 cc	  and $cc43,y
$19:b94a  38			sec
$19:b94b  7f 0b 4f fe   adc $fe4f0b,x
$19:b94f  ad f7 96	  lda $96f7
$19:b952  f7 7e		 sbc [$7e],y
$19:b954  72 fd		 adc ($fd)
$19:b956  fd 63 9f	  sbc $9f63,x
$19:b959  f2 ef		 sbc ($ef)
$19:b95b  f7 e0		 sbc [$e0],y
$19:b95d  1f f7 f8 42   ora $42f8f7,x
$19:b961  3f f0 2f fc   and $fc2ff0,x
$19:b965  83 bf		 sta $bf,s
$19:b967  18			clc
$19:b968  f3 e0		 sbc ($e0,s),y
$19:b96a  af ba 0b fc   lda $fc0bba
$19:b96e  bf c1 ef f0   lda $f0efc1,x
$19:b972  5f fc 13 ff   eor $ff13fc,x
$19:b976  05 df		 ora $df
$19:b978  51 93		 eor ($93),y
$19:b97a  a6 5c		 ldx $5c
$19:b97c  f9 94 38	  sbc $3894,y
$19:b97f  e4 7f		 cpx $7f
$19:b981  fe 1f 69	  inc $691f,x
$19:b984  f8			sed
$19:b985  a0 55		 ldy #$55
$19:b987  41 81		 eor ($81,x)
$19:b989  ff 4f e7 f9   sbc $f9e74f,x
$19:b98d  c8			iny
$19:b98e  fe de 7f	  inc $7fde,x
$19:b991  a5 9e		 lda $9e
$19:b993  f6 6c		 inc $6c,x
$19:b995  fe f9 b7	  inc $b7f9,x
$19:b998  5e 32 ff	  lsr $ff32,x
$19:b99b  0e 07 ff	  asl $ff07
$19:b99e  c0 40		 cpy #$40
$19:b9a0  1e 17 fd	  asl $fd17,x
$19:b9a3  3c 1c 6f	  bit $6f1c,x
$19:b9a6  cf 87 fd cd   cmp $cdfd87
$19:b9aa  9f ee f8 ff   sta $fff8ee,x
$19:b9ae  5f de f3 ff   eor $fff3de,x
$19:b9b2  6e bf e5	  ror $e5bf
$19:b9b5  f3 fb		 sbc ($fb,s),y
$19:b9b7  bb			tyx
$19:b9b8  ff f7 e6 ff   sbc $ffe6f7,x
$19:b9bc  27 f9		 and [$f9]
$19:b9be  27 82		 and [$82]
$19:b9c0  c0 00		 cpy #$00
$19:b9c2  1f 84 3e 47   ora $473e84,x
$19:b9c6  70 92		 bvs $b95a
$19:b9c8  49 bd 98	  eor #$98bd
$19:b9cb  0a			asl a
$19:b9cc  97 4e		 sta [$4e],y
$19:b9ce  7b			tdc
$19:b9cf  5f c8 cf 27   eor $27cfc8,x
$19:b9d3  f0 0e		 beq $b9e3
$19:b9d5  5d e3 1f	  eor $1fe3,x
$19:b9d8  8f ec c0 62   sta $62c0ec
$19:b9dc  76 c9		 ror $c9,x
$19:b9de  64 03		 stz $03
$19:b9e0  41 a1		 eor ($a1,x)
$19:b9e2  68			pla
$19:b9e3  82 a8 30	  brl $ea8e
$19:b9e6  e0 00		 cpx #$00
$19:b9e8  47 fa		 eor [$fa]
$19:b9ea  83 d6		 sta $d6,s
$19:b9ec  3e c2 f6	  rol $f6c2,x
$19:b9ef  9f b9 3d eb   sta $eb3db9,x
$19:b9f3  e0 6f		 cpx #$6f
$19:b9f5  0b			phd
$19:b9f6  f8			sed
$19:b9f7  a3 c7		 lda $c7,s
$19:b9f9  3e 4a f2	  rol $f24a,x
$19:b9fc  df 9b 3c fb   cmp $fb3c9b,x
$19:ba00  e8			inx
$19:ba01  ef 4f fa c3   sbc $c3fa4f
$19:ba05  d8			cld
$19:ba06  3e d2 f6	  rol $f6d2,x
$19:ba09  f4 f4 f9	  pea $f9f4
$19:ba0c  9e 1e f7	  stz $f71e,x
$19:ba0f  07 fd		 ora [$fd]
$19:ba11  81 df		 sta ($df,x)
$19:ba13  60			rts
$19:ba14  f7 98		 sbc [$98],y
$19:ba16  2d e7 17	  and $17e7
$19:ba19  f3 e7		 sbc ($e7,s),y
$19:ba1b  ed 6f ef	  sbc $ef6f
$19:ba1e  ef f2 ff 81   sbc $81fff2
$19:ba22  0f 7d 7f de   ora $de7f7d
$19:ba26  df f8 d1 8c   cmp $8cd1f8,x
$19:ba2a  24 63		 bit $63
$19:ba2c  d1 50		 cmp ($50),y
$19:ba2e  a4 5c		 ldy $5c
$19:ba30  3a			dec a
$19:ba31  1a			inc a
$19:ba32  08			php
$19:ba33  85 83		 sta $83
$19:ba35  41 40		 eor ($40,x)
$19:ba37  a0 60		 ldy #$60
$19:ba39  3f e1 f1 df   and $dff1e1,x
$19:ba3d  88			dey
$19:ba3e  84 08		 sty $08
$19:ba40  02 84		 cop #$84
$19:ba42  fa			plx
$19:ba43  41 ef		 eor ($ef,x)
$19:ba45  d0 0b		 bne $ba52
$19:ba47  84 3e		 sty $3e
$19:ba49  61 0f		 adc ($0f,x)
$19:ba4b  90 47		 bcc $ba94
$19:ba4d  c6 e1		 dec $e1
$19:ba4f  60			rts
$19:ba50  1d 0f e0	  ora $e00f,x
$19:ba53  50 a4		 bvc $b9f9
$19:ba55  06 f3		 asl $f3
$19:ba57  c7 fc		 cmp [$fc]
$19:ba59  7e 3f 8c	  ror $8c3f,x
$19:ba5c  06 f1		 asl $f1
$19:ba5e  80 2a		 bra $ba8a
$19:ba60  91 4c		 sta ($4c),y
$19:ba62  3c 30 18	  bit $1830,x
$19:ba65  07 fe		 ora [$fe]
$19:ba67  39 ff ff	  and $ffff,y
$19:ba6a  0a			asl a
$19:ba6b  14 c6		 trb $c6
$19:ba6d  06 31		 asl $31
$19:ba6f  80 7f		 bra $baf0
$19:ba71  a0 1b		 ldy #$1b
$19:ba73  ec 01 cc	  cpx $cc01
$19:ba76  0e 21 fc	  asl $fc21
$19:ba79  3c 0f e0	  bit $e00f,x
$19:ba7c  be 01 f1	  ldx $f101,y
$19:ba7f  02 11		 cop #$11
$19:ba81  01 9b		 ora ($9b,x)
$19:ba83  de 9f f5	  dec $f59f,x
$19:ba86  87 b0		 sta [$b0]
$19:ba88  7d a5 ee	  adc $eea5,x
$19:ba8b  3f 7a 78 17   and $17787a,x
$19:ba8f  c2 de		 rep #$de
$19:ba91  27 f1		 and [$f1]
$19:ba93  c7 92		 cmp [$92]
$19:ba95  7c b5 e6	  jmp ($e6b5,x)
$19:ba98  bf 3e 7a 37   lda $377a3e,x
$19:ba9c  d3 de		 cmp ($de,s),y
$19:ba9e  af f6 07 b4   lda $b407f6
$19:baa2  7d c5 ef	  adc $efc5,x
$19:baa5  3f 02 78 57   and $577802,x
$19:baa9  c4 de		 cpy $de
$19:baab  37 f2		 and [$f2],y
$19:baad  47 96		 eor [$96]
$19:baaf  7c d5 e7	  jmp ($e7d5,x)
$19:bab2  bf 46 7a 77   lda $777a46,x
$19:bab6  d5 de		 cmp $de,x
$19:bab8  bf f6 87 b8   lda $b887f6,x
$19:babc  7d e5 e0	  adc $e0e5,x
$19:babf  3f 0a 78 97   and $97780a,x
$19:bac3  c6 de		 dec $de
$19:bac5  47 f2		 eor [$f2]
$19:bac7  c7 9a		 cmp [$9a]
$19:bac9  7c f5 e8	  jmp ($e8f5,x)
$19:bacc  bf 4e 7a b7   lda $b77a4e,x
$19:bad0  d7 de		 cmp [$de],y
$19:bad2  cf f7 07 bc   cmp $bc07f7
$19:bad6  7c 05 e1	  jmp ($e105,x)
$19:bad9  3f 12 78 d7   and $d77812,x
$19:badd  c8			iny
$19:bade  de 57 f3	  dec $f357,x
$19:bae1  47 9e		 eor [$9e]
$19:bae3  7d 15 e9	  adc $e915,x
$19:bae6  bf 56 7a f7   lda $f77a56,x
$19:baea  d9 de df	  cmp $dfde,y
$19:baed  f7 87		 sbc [$87],y
$19:baef  80 7c		 bra $bb6d
$19:baf1  25 e2		 and $e2
$19:baf3  3f 1a 79 17   and $17791a,x
$19:baf7  ca			dex
$19:baf8  de 67 f3	  dec $f367,x
$19:bafb  c7 a2		 cmp [$a2]
$19:bafd  7d 35 ea	  adc $ea35,x
$19:bb00  bf 5e 7b 37   lda $377b5e,x
$19:bb04  db			stp
$19:bb05  de ef f0	  dec $f0ef,x
$19:bb08  07 84		 ora [$84]
$19:bb0a  7c 45 e3	  jmp ($e345,x)
$19:bb0d  3f 22 79 57   and $577922,x
$19:bb11  cc de 77	  cpy $77de
$19:bb14  f4 47 a6	  pea $a647
$19:bb17  7d 55 eb	  adc $eb55,x
$19:bb1a  bf 66 7b 77   lda $777b66,x
$19:bb1e  dd de ff	  cmp $ffde,x
$19:bb21  f0 87		 beq $baaa
$19:bb23  88			dey
$19:bb24  7c 65 e4	  jmp ($e465,x)
$19:bb27  3f 2a 79 97   and $97792a,x
$19:bb2b  ce de 87	  dec $87de
$19:bb2e  f4 c7 aa	  pea $aac7
$19:bb31  7d 75 ec	  adc $ec75,x
$19:bb34  bf 6e 7b b7   lda $b77b6e,x
$19:bb38  df de 0f f1   cmp $f10fde,x
$19:bb3c  07 8c		 ora [$8c]
$19:bb3e  7c 85 e5	  jmp ($e585,x)
$19:bb41  3f 32 79 d7   and $d77932,x
$19:bb45  d0 de		 bne $bb25
$19:bb47  97 f5		 sta [$f5],y
$19:bb49  47 ae		 eor [$ae]
$19:bb4b  7d 95 ed	  adc $ed95,x
$19:bb4e  bf 76 7b f7   lda $f77b76,x
$19:bb52  c1 de		 cmp ($de,x)
$19:bb54  1f f1 87 90   ora $9087f1,x
$19:bb58  7c a5 e6	  jmp ($e6a5,x)
$19:bb5b  3f 3a 7a 17   and $177a3a,x
$19:bb5f  d2 de		 cmp ($de)
$19:bb61  a7 f5		 lda [$f5]
$19:bb63  c7 b2		 cmp [$b2]
$19:bb65  7d b5 ee	  adc $eeb5,x
$19:bb68  bf 7e 78 37   lda $37787e,x
$19:bb6c  c3 de		 cmp $de,s
$19:bb6e  2f f2 07 94   and $9407f2
$19:bb72  7c c5 e7	  jmp ($e7c5,x)
$19:bb75  3f 42 7a 57   and $577a42,x
$19:bb79  d4 de		 pei ($de)
$19:bb7b  b7 f6		 lda [$f6],y
$19:bb7d  47 b6		 eor [$b6]
$19:bb7f  7d bc 5f	  adc $5fbc,x
$19:bb82  88			dey
$19:bb83  07 c2		 ora [$c2]
$19:bb85  01 e1		 ora ($e1,x)
$19:bb87  80 f1		 bra $bb7a
$19:bb89  a0 f9 88	  ldy #$88f9
$19:bb8c  fd 9e f1	  sbc $f19e,x
$19:bb8f  3e e6 ff	  rol $ffe6,x
$19:bb92  3f 7f f7 f8   and $f8f77f,x
$19:bb96  ff bf ff 8f   sbc $8fffbf,x
$19:bb9a  ff 83 ff 80   sbc $80ff83,x
$19:bb9e  ff c3 3e 7f   sbc $7f3ec3,x
$19:bba2  88			dey
$19:bba3  3b			tsc
$19:bba4  7b			tdc
$19:bba5  c3 fe		 cmp $fe,s
$19:bba7  30 f2		 bmi $bb9b
$19:bba9  0f 94 bc c7   ora $c7bc94
$19:bbad  e7 4f		 sbc [$4f]
$19:bbaf  42 fa		 wdm #$fa
$19:bbb1  5b			tcd
$19:bbb2  d4 fe		 pei ($fe)
$19:bbb4  b8			clv
$19:bbb5  f6 4f		 inc $4f,x
$19:bbb7  b6 bd		 ldx $bd,y
$19:bbb9  d7 ef		 cmp [$ef],y
$19:bbbb  cf 06 f8 7b   cmp $7bf806
$19:bbbf  c5 fe		 cmp $fe
$19:bbc1  40			rti
$19:bbc2  f2 8f		 sbc ($8f)
$19:bbc4  98			tya
$19:bbc5  bc e7 e8	  ldy $e8e7,x
$19:bbc8  4f 4a fa 9b   eor $9bfa4a
$19:bbcc  d6 fe		 dec $fe,x
$19:bbce  c8			iny
$19:bbcf  f6 cf		 inc $cf,x
$19:bbd1  ba			tsx
$19:bbd2  bd f7 e0	  lda $e0f7,x
$19:bbd5  cf 0e f8 bb   cmp $bbf80e
$19:bbd9  c7 fe		 cmp [$fe]
$19:bbdb  50 f3		 bvc $bbd0
$19:bbdd  0f 9c bd 07   ora $07bd9c
$19:bbe1  e9 4f 52	  sbc #$524f
$19:bbe4  fa			plx
$19:bbe5  db			stp
$19:bbe6  d8			cld
$19:bbe7  fe d8 f7	  inc $f7d8,x
$19:bbea  4f be bc 17   eor $17bcbe
$19:bbee  e1 cf		 sbc ($cf,x)
$19:bbf0  16 f8		 asl $f8,x
$19:bbf2  fb			xce
$19:bbf3  c9 fe 60	  cmp #$60fe
$19:bbf6  f3 8f		 sbc ($8f,s),y
$19:bbf8  a0 bd 27	  ldy #$27bd
$19:bbfb  ea			nop
$19:bbfc  4f 5a fb 1b   eor $1bfb5a
$19:bc00  da			phx
$19:bc01  fe e8 f7	  inc $f7e8,x
$19:bc04  cf 82 bc 37   cmp $37bc82
$19:bc08  e2 cf		 sep #$cf
$19:bc0a  1e f9 3b	  asl $3bf9,x
$19:bc0d  cb			wai
$19:bc0e  fe 70 f4	  inc $f470,x
$19:bc11  0f a4 bd 47   ora $47bda4
$19:bc15  eb			xba
$19:bc16  4f 62 fb 5b   eor $5bfb62
$19:bc1a  dc fe f8	  jml [$f8fe]
$19:bc1d  f0 4f		 beq $bc6e
$19:bc1f  86 bc		 stx $bc
$19:bc21  57 e3		 eor [$e3],y
$19:bc23  cf 26 f9 7b   cmp $7bf926
$19:bc27  cd fe 80	  cmp $80fe
$19:bc2a  f4 8f a8	  pea $a88f
$19:bc2d  bd 67 ec	  lda $ec67,x
$19:bc30  4f 6a fb 9b   eor $9bfb6a
$19:bc34  de fe 08	  dec $08fe,x
$19:bc37  f0 cf		 beq $bc08
$19:bc39  8a			txa
$19:bc3a  bc 77 e4	  ldy $e477,x
$19:bc3d  cf 2e f9 bb   cmp $bbf92e
$19:bc41  cf fe 90 f5   cmp $f590fe
$19:bc45  0f ac bd 87   ora $87bdac
$19:bc49  ed 4f 72	  sbc $724f
$19:bc4c  fb			xce
$19:bc4d  db			stp
$19:bc4e  c0 fe 18	  cpy #$18fe
$19:bc51  f1 4f		 sbc ($4f),y
$19:bc53  8e bc 97	  stx $97bc
$19:bc56  e5 cf		 sbc $cf
$19:bc58  36 f9		 rol $f9,x
$19:bc5a  fb			xce
$19:bc5b  d1 fe		 cmp ($fe),y
$19:bc5d  a0 f5 8f	  ldy #$8ff5
$19:bc60  b0 bd		 bcs $bc1f
$19:bc62  a7 ee		 lda [$ee]
$19:bc64  4f 7a f8 1b   eor $1bf87a
$19:bc68  c2 fe		 rep #$fe
$19:bc6a  28			plp
$19:bc6b  f1 cf		 sbc ($cf),y
$19:bc6d  92 bc		 sta ($bc)
$19:bc6f  b7 e6		 lda [$e6],y
$19:bc71  cf 3e fa 3b   cmp $3bfa3e
$19:bc75  d3 fe		 cmp ($fe,s),y
$19:bc77  b0 f6		 bcs $bc6f
$19:bc79  0f b4 bd c7   ora $c7bdb4
$19:bc7d  ef 4f 02 f8   sbc $f8024f
$19:bc81  5b			tcd
$19:bc82  c4 fe		 cpy $fe
$19:bc84  38			sec
$19:bc85  f2 4f		 sbc ($4f)
$19:bc87  96 bc		 stx $bc,y
$19:bc89  d7 e7		 cmp [$e7],y
$19:bc8b  cf 46 fa 7b   cmp $7bfa46
$19:bc8f  d5 fe		 cmp $fe,x
$19:bc91  c0 f6 8f	  cpy #$8ff6
$19:bc94  b8			clv
$19:bc95  bd e7 e0	  lda $e0e7,x
$19:bc98  4f 0a f8 9b   eor $9bf80a
$19:bc9c  c6 fe		 dec $fe
$19:bc9e  48			pha
$19:bc9f  f2 cf		 sbc ($cf)
$19:bca1  9a			txs
$19:bca2  bc f7 e8	  ldy $e8f7,x
$19:bca5  cf 4e fa bb   cmp $bbfa4e
$19:bca9  d7 fe		 cmp [$fe],y
$19:bcab  d0 f7		 bne $bca4
$19:bcad  0d 80 2a	  ora $2a80
$19:bcb0  00 4e		 brk #$4e
$19:bcb2  2e 0d ff	  rol $ff0d
$19:bcb5  f1 b8		 sbc ($b8),y
$19:bcb7  07 00		 ora [$00]
$19:bcb9  0e ff e0	  asl $e0ff
$19:bcbc  b8			clv
$19:bcbd  03 00		 ora $00,s
$19:bcbf  0f ff e0 b8   ora $b8e0ff
$19:bcc3  03 c0		 ora $c0,s
$19:bcc5  10 ff		 bpl $bcc6
$19:bcc7  e0 b8 03	  cpx #$03b8
$19:bcca  80 11		 bra $bcdd
$19:bccc  ff e0 b8 00   sbc $00b8e0,x
$19:bcd0  f0 12		 beq $bce4
$19:bcd2  ff f6 b8 07   sbc $07b8f6,x
$19:bcd6  a8			tay
$19:bcd7  13 ff		 ora ($ff,s),y
$19:bcd9  e8			inx
$19:bcda  b8			clv
$19:bcdb  03 d0		 ora $d0,s
$19:bcdd  18			clc
$19:bcde  00 00		 brk #$00
$19:bce0  2f 32 65 7f   and $7f6532
$19:bce4  98			tya
$19:bce5  b2 cb		 lda ($cb)
$19:bce7  e5 fc		 sbc $fc
$19:bce9  19 32 4c	  ora $4c32,y
$19:bcec  65 72		 adc $72
$19:bcee  7f 8c 98 a5   adc $a5988c,x
$19:bcf2  b2 bf		 lda ($bf)
$19:bcf4  cb			wai
$19:bcf5  d8			cld
$19:bcf6  e5 f2		 sbc $f2
$19:bcf8  fc 3f 09	  jsr ($093f,x)
$19:bcfb  00 10		 brk #$10
$19:bcfd  02 10		 cop #$10
$19:bcff  0a			asl a
$19:bd00  10 ff		 bpl $bd01
$19:bd02  00 02		 brk #$02
$19:bd04  10 00		 bpl $bd06
$19:bd06  00 1a		 brk #$1a
$19:bd08  10 30		 bpl $bd3a
$19:bd0a  11 fc		 ora ($fc),y
$19:bd0c  11 08		 ora ($08),y
$19:bd0e  13 fa		 ora ($fa,s),y
$19:bd10  13 60		 ora ($60,s),y
$19:bd12  16 98		 asl $98,x
$19:bd14  17 34		 ora [$34],y
$19:bd16  18			clc
$19:bd17  fa			plx
$19:bd18  07 ea		 ora [$ea]
$19:bd1a  00 e0		 brk #$e0
$19:bd1c  02 e7		 cop #$e7
$19:bd1e  13 ed		 ora ($ed,s),y
$19:bd20  be e5 fa	  ldx $fae5,y
$19:bd23  e1 0a		 sbc ($0a,x)
$19:bd25  f5 80		 sbc $80,x
$19:bd27  45 45		 eor $45
$19:bd29  f7 03		 sbc [$03],y
$19:bd2b  aa			tax
$19:bd2c  00 06		 brk #$06
$19:bd2e  4d b4 b2	  eor $b2b4
$19:bd31  0c b0 af	  tsb $afb0
$19:bd34  b0 06		 bcs $bd3c
$19:bd36  b2 b0		 lda ($b0)
$19:bd38  0c af 18	  tsb $18af
$19:bd3b  ad 06 b0	  lda $b006
$19:bd3e  af 0c ad ad   lda $adad0c
$19:bd42  ab			plb
$19:bd43  18			clc
$19:bd44  a8			tay
$19:bd45  ab			plb
$19:bd46  0c b5 06	  tsb $06b5
$19:bd49  b4 b5		 ldy $b5,x
$19:bd4b  0c b2 b0	  tsb $b0b2
$19:bd4e  18			clc
$19:bd4f  b2 ab		 lda ($ab)
$19:bd51  0c b4 06	  tsb $06b4
$19:bd54  b2 b4		 lda ($b4)
$19:bd56  0c b0 af	  tsb $afb0
$19:bd59  18			clc
$19:bd5a  b0 a9		 bcs $bd05
$19:bd5c  0c b2 06	  tsb $06b2
$19:bd5f  b0 b2		 bcs $bd13
$19:bd61  0c af ad	  tsb $adaf
$19:bd64  18			clc
$19:bd65  af b4 0c b5   lda $b50cb4
$19:bd69  06 b2		 asl $b2
$19:bd6b  b0 0c		 bcs $bd79
$19:bd6d  b0 af		 bcs $bd1e
$19:bd6f  18			clc
$19:bd70  b0 18		 bcs $bd8a
$19:bd72  4a			lsr a
$19:bd73  b0 e1		 bcs $bd56
$19:bd75  09 ed 96	  ora #$96ed
$19:bd78  30 5d		 bmi $bdd7
$19:bd7a  b0 0c		 bcs $bd88
$19:bd7c  c8			iny
$19:bd7d  0c 5b b2	  tsb $b25b
$19:bd80  0c 5d b0	  tsb $b05d
$19:bd83  0c 59 af	  tsb $af59
$19:bd86  30 5d		 bmi $bde5
$19:bd88  af 0c c8 0c   lda $0cc80c
$19:bd8c  5b			tcd
$19:bd8d  b0 0c		 bcs $bd9b
$19:bd8f  5d af 0c	  eor $0caf,x
$19:bd92  59 ad 30	  eor $30ad,y
$19:bd95  5d ad 0c	  eor $0cad,x
$19:bd98  af 0c 5b ad   lda $ad5b0c
$19:bd9c  0c 5d b2	  tsb $b25d
$19:bd9f  0c 59 b0	  tsb $b059
$19:bda2  18			clc
$19:bda3  5c b0 18 5a   jml $5a18b0
$19:bda7  b2 30		 lda ($30)
$19:bda9  59 b4 30	  eor $30b4,y
$19:bdac  5d b0 0c	  eor $0cb0,x
$19:bdaf  c8			iny
$19:bdb0  0c 5b b2	  tsb $b25b
$19:bdb3  0c 5d b0	  tsb $b05d
$19:bdb6  0c 59 af	  tsb $af59
$19:bdb9  30 5d		 bmi $be18
$19:bdbb  af 0c c8 0c   lda $0cc80c
$19:bdbf  5b			tcd
$19:bdc0  b0 0c		 bcs $bdce
$19:bdc2  5d af 0c	  eor $0caf,x
$19:bdc5  59 ad 30	  eor $30ad,y
$19:bdc8  5d ad 0c	  eor $0cad,x
$19:bdcb  af 0c 5b ad   lda $ad5b0c
$19:bdcf  0c 5d b2	  tsb $b25d
$19:bdd2  0c 59 b0	  tsb $b059
$19:bdd5  18			clc
$19:bdd6  5d b0 18	  eor $18b0,x
$19:bdd9  5b			tcd
$19:bdda  b2 30		 lda ($30)
$19:bddc  b0 e1		 bcs $bdbf
$19:bdde  0a			asl a
$19:bddf  ed b4 18	  sbc $18b4
$19:bde2  5d b0 b7	  eor $b7b0,x
$19:bde5  30 6a		 bmi $be51
$19:bde7  b8			clv
$19:bde8  18			clc
$19:bde9  5d ae b5	  eor $b5ae,x
$19:bdec  30 6a		 bmi $be58
$19:bdee  b7 18		 lda [$18],y
$19:bdf0  5d ac b3	  eor $b3ac,x
$19:bdf3  0c b5 0c	  tsb $0cb5
$19:bdf6  5b			tcd
$19:bdf7  b3 0c		 lda ($0c,s),y
$19:bdf9  5d b2 0c	  eor $0cb2,x
$19:bdfc  59 b0 18	  eor $18b0,y
$19:bdff  5d b0 18	  eor $18b0,x
$19:be02  5b			tcd
$19:be03  b2 30		 lda ($30)
$19:be05  5a			phy
$19:be06  b3 18		 lda ($18,s),y
$19:be08  5d b0 b7	  eor $b7b0,x
$19:be0b  30 6a		 bmi $be77
$19:be0d  b8			clv
$19:be0e  18			clc
$19:be0f  5d ae b5	  eor $b5ae,x
$19:be12  30 6a		 bmi $be7e
$19:be14  b7 18		 lda [$18],y
$19:be16  5d ac b3	  eor $b3ac,x
$19:be19  0c b5 0c	  tsb $0cb5
$19:be1c  5b			tcd
$19:be1d  b3 0c		 lda ($0c,s),y
$19:be1f  5d b2 0c	  eor $0cb2,x
$19:be22  59 b0 18	  eor $18b0,y
$19:be25  5d b3 18	  eor $18b3,x
$19:be28  5b			tcd
$19:be29  b2 30		 lda ($30)
$19:be2b  b3 00		 lda ($00,s),y
$19:be2d  ea			nop
$19:be2e  00 e0		 brk #$e0
$19:be30  02 ed		 cop #$ed
$19:be32  96 e1		 stx $e1,y
$19:be34  0c 60 c9	  tsb $c960
$19:be37  c9 c9 c9	  cmp #$c9c9
$19:be3a  c9 c9 30	  cmp #$30c9
$19:be3d  5d a1 30	  eor $30a1,x
$19:be40  5b			tcd
$19:be41  a6 30		 ldx $30
$19:be43  5d 9f 30	  eor $309f,x
$19:be46  5b			tcd
$19:be47  a4 30		 ldy $30
$19:be49  5d 9d 30	  eor $309d,x
$19:be4c  5b			tcd
$19:be4d  9f 18 5d 9d   sta $9d5d18,x
$19:be51  18			clc
$19:be52  5b			tcd
$19:be53  9f 30 4b 98   sta $984b30,x
$19:be57  30 5d		 bmi $beb6
$19:be59  a1 30		 lda ($30,x)
$19:be5b  5b			tcd
$19:be5c  a6 30		 ldx $30
$19:be5e  5d 9f 30	  eor $309f,x
$19:be61  5b			tcd
$19:be62  a4 30		 ldy $30
$19:be64  5d 9d 30	  eor $309d,x
$19:be67  5b			tcd
$19:be68  9f 18 5d 9d   sta $9d5d18,x
$19:be6c  18			clc
$19:be6d  5b			tcd
$19:be6e  9f 30 5d 98   sta $985d30,x
$19:be72  ea			nop
$19:be73  00 e1		 brk #$e1
$19:be75  0e ed 7d	  asl $7ded
$19:be78  0c c9 b7	  tsb $b7c9
$19:be7b  0c 5b b0	  tsb $b05b
$19:be7e  b7 c9		 lda [$c9],y
$19:be80  0c 5d b8	  tsb $b85d
$19:be83  0c 5b b0	  tsb $b05b
$19:be86  b8			clv
$19:be87  c9 0c 5d	  cmp #$5d0c
$19:be8a  b5 0c		 lda $0c,x
$19:be8c  5b			tcd
$19:be8d  ae b5 c9	  ldx $c9b5
$19:be90  0c 5d b7	  tsb $b75d
$19:be93  0c 5b ae	  tsb $ae5b
$19:be96  b7 c9		 lda [$c9],y
$19:be98  0c 5d b3	  tsb $b35d
$19:be9b  0c 5b ac	  tsb $ac5b
$19:be9e  b3 c9		 lda ($c9,s),y
$19:bea0  0c 5d b5	  tsb $b55d
$19:bea3  0c 5b ae	  tsb $ae5b
$19:bea6  b5 c9		 lda $c9,x
$19:bea8  0c 5d b3	  tsb $b35d
$19:beab  0c 5b ae	  tsb $ae5b
$19:beae  b3 0c		 lda ($0c,s),y
$19:beb0  5d b3 0c	  eor $0cb3,x
$19:beb3  5b			tcd
$19:beb4  ae 18 b3	  ldx $b318
$19:beb7  0c c9 0c	  tsb $0cc9
$19:beba  5d b7 0c	  eor $0cb7,x
$19:bebd  5b			tcd
$19:bebe  b0 b7		 bcs $be77
$19:bec0  c9 0c 5d	  cmp #$5d0c
$19:bec3  b8			clv
$19:bec4  0c 5b b0	  tsb $b05b
$19:bec7  b8			clv
$19:bec8  c9 0c 5d	  cmp #$5d0c
$19:becb  b5 0c		 lda $0c,x
$19:becd  5b			tcd
$19:bece  ae b5 c9	  ldx $c9b5
$19:bed1  0c 5d b7	  tsb $b75d
$19:bed4  0c 5b ae	  tsb $ae5b
$19:bed7  b7 c9		 lda [$c9],y
$19:bed9  0c 5d b3	  tsb $b35d
$19:bedc  0c 5b ac	  tsb $ac5b
$19:bedf  b3 c9		 lda ($c9,s),y
$19:bee1  0c 5d b5	  tsb $b55d
$19:bee4  0c 5b ae	  tsb $ae5b
$19:bee7  b5 c9		 lda $c9,x
$19:bee9  0c 5d b3	  tsb $b35d
$19:beec  0c 5b b2	  tsb $b25b
$19:beef  b5 0c		 lda $0c,x
$19:bef1  5d b7 0c	  eor $0cb7,x
$19:bef4  5b			tcd
$19:bef5  b3 18		 lda ($18,s),y
$19:bef7  b7 00		 lda [$00],y
$19:bef9  ea			nop
$19:befa  f4 e0 05	  pea $05e0
$19:befd  ed af e1	  sbc $e1af
$19:bf00  0a			asl a
$19:bf01  18			clc
$19:bf02  7d a4 a4	  adc $a4a4,x
$19:bf05  ab			plb
$19:bf06  ad a9 ab	  lda $aba9
$19:bf09  a4 a8		 ldy $a8
$19:bf0b  a9 a9 ab	  lda #$aba9
$19:bf0e  ab			plb
$19:bf0f  a8			tay
$19:bf10  a8			tay
$19:bf11  ad ad a6	  lda $a6ad
$19:bf14  a6 a8		 ldx $a8
$19:bf16  a8			tay
$19:bf17  a9 ab a4	  lda #$a4ab
$19:bf1a  a4 ed		 ldy $ed
$19:bf1c  aa			tax
$19:bf1d  e1 0a		 sbc ($0a,x)
$19:bf1f  0c c9 0c	  tsb $0cc9
$19:bf22  4d b4 0c	  eor $0cb4
$19:bf25  4b			phk
$19:bf26  ad b4 c9	  lda $c9b4
$19:bf29  0c 4d b5	  tsb $b54d
$19:bf2c  0c 4b ad	  tsb $ad4b
$19:bf2f  b5 c9		 lda $c9,x
$19:bf31  0c 4d b2	  tsb $b24d
$19:bf34  0c 4b ab	  tsb $ab4b
$19:bf37  b2 c9		 lda ($c9)
$19:bf39  0c 4d b4	  tsb $b44d
$19:bf3c  0c 4b ab	  tsb $ab4b
$19:bf3f  b4 c9		 ldy $c9,x
$19:bf41  0c 4d b0	  tsb $b04d
$19:bf44  0c 4b a9	  tsb $a94b
$19:bf47  b0 c9		 bcs $bf12
$19:bf49  0c 4d b2	  tsb $b24d
$19:bf4c  0c 4b ab	  tsb $ab4b
$19:bf4f  b2 c9		 lda ($c9)
$19:bf51  0c 4d b0	  tsb $b04d
$19:bf54  0c 4b af	  tsb $af4b
$19:bf57  b2 0c		 lda ($0c)
$19:bf59  4d b0 0c	  eor $0cb0
$19:bf5c  4b			phk
$19:bf5d  ab			plb
$19:bf5e  18			clc
$19:bf5f  b0 0c		 bcs $bf6d
$19:bf61  c9 0c 4d	  cmp #$4d0c
$19:bf64  b4 0c		 ldy $0c,x
$19:bf66  4b			phk
$19:bf67  ad b4 c9	  lda $c9b4
$19:bf6a  0c 4d b5	  tsb $b54d
$19:bf6d  0c 4b ad	  tsb $ad4b
$19:bf70  b5 c9		 lda $c9,x
$19:bf72  0c 4d b2	  tsb $b24d
$19:bf75  0c 4b ab	  tsb $ab4b
$19:bf78  b2 c9		 lda ($c9)
$19:bf7a  0c 4d b4	  tsb $b44d
$19:bf7d  0c 4b ab	  tsb $ab4b
$19:bf80  b4 c9		 ldy $c9,x
$19:bf82  0c 4d b0	  tsb $b04d
$19:bf85  0c 4b b5	  tsb $b54b
$19:bf88  b0 c9		 bcs $bf53
$19:bf8a  0c 4d b2	  tsb $b24d
$19:bf8d  0c 4b ab	  tsb $ab4b
$19:bf90  b2 c9		 lda ($c9)
$19:bf92  0c 4d b0	  tsb $b04d
$19:bf95  0c 4b af	  tsb $af4b
$19:bf98  b2 0c		 lda ($0c)
$19:bf9a  4d b4 0c	  eor $0cb4
$19:bf9d  4b			phk
$19:bf9e  b0 18		 bcs $bfb8
$19:bfa0  b4 ed		 ldy $ed,x
$19:bfa2  b4 e1		 ldy $e1,x
$19:bfa4  0a			asl a
$19:bfa5  24 7d		 bit $7d
$19:bfa7  a4 0c		 ldy $0c
$19:bfa9  7b			tdc
$19:bfaa  a4 24		 ldy $24
$19:bfac  7d a9 0c	  adc $0ca9,x
$19:bfaf  7b			tdc
$19:bfb0  a9 24 7d	  lda #$7d24
$19:bfb3  ae 0c 7b	  ldx $7b0c
$19:bfb6  ae 24 7d	  ldx $7d24
$19:bfb9  a7 0c		 lda [$0c]
$19:bfbb  7b			tdc
$19:bfbc  a7 24		 lda [$24]
$19:bfbe  7d ac 0c	  adc $0cac,x
$19:bfc1  7b			tdc
$19:bfc2  ac 24 7d	  ldy $7d24
$19:bfc5  ae 0c 7b	  ldx $7b0c
$19:bfc8  ae 18 7d	  ldx $7d18
$19:bfcb  ac ae 0c	  ldy $0cae
$19:bfce  a7 0c		 lda [$0c]
$19:bfd0  7b			tdc
$19:bfd1  a2 18 7d	  ldx #$7d18
$19:bfd4  a7 24		 lda [$24]
$19:bfd6  a4 0c		 ldy $0c
$19:bfd8  7b			tdc
$19:bfd9  a4 24		 ldy $24
$19:bfdb  7d a9 0c	  adc $0ca9,x
$19:bfde  7b			tdc
$19:bfdf  a9 24 7d	  lda #$7d24
$19:bfe2  ae 0c 7b	  ldx $7b0c
$19:bfe5  ae 24 7d	  ldx $7d24
$19:bfe8  a7 0c		 lda [$0c]
$19:bfea  7b			tdc
$19:bfeb  a7 24		 lda [$24]
$19:bfed  7d ac 0c	  adc $0cac,x
$19:bff0  7b			tdc
$19:bff1  ac 24 7d	  ldy $7d24
$19:bff4  ae 0c 7b	  ldx $7b0c
$19:bff7  ae 18 7d	  ldx $7d18
$19:bffa  ac ae 0c	  ldy $0cae
$19:bffd  a7 0c		 lda [$0c]
$19:bfff  7b			tdc
$19:c000  a2 18 7d	  ldx #$7d18
$19:c003  a7 00		 lda [$00]
$19:c005  e0 03 ea	  cpx #$ea03
$19:c008  00 ed		 brk #$ed
$19:c00a  87 e1		 sta [$e1]
$19:c00c  09 e3 30	  ora #$30e3
$19:c00f  1e 22 48	  asl $4822,x
$19:c012  5d 9f 18	  eor $189f,x
$19:c015  a1 a1		 lda ($a1,x)
$19:c017  0c a1 a3	  tsb $a3a1
$19:c01a  30 6d		 bmi $c089
$19:c01c  9f 30 5d a1   sta $a15d30,x
$19:c020  30 6a		 bmi $c08c
$19:c022  a3 30		 lda $30,s
$19:c024  5d 9f 30	  eor $309f,x
$19:c027  6b			rtl
$19:c028  a1 30		 lda ($30,x)
$19:c02a  5d a1 30	  eor $30a1,x
$19:c02d  5b			tcd
$19:c02e  a3 18		 lda $18,s
$19:c030  5d a1 a3	  eor $a3a1,x
$19:c033  a4 18		 ldy $18
$19:c035  4d 9f e0	  eor $e09f
$19:c038  03 ed		 ora $ed,s
$19:c03a  96 e1		 stx $e1,y
$19:c03c  0a			asl a
$19:c03d  18			clc
$19:c03e  5d a1 18	  eor $18a1,x
$19:c041  5b			tcd
$19:c042  a8			tay
$19:c043  30 a9		 bmi $bfee
$19:c045  18			clc
$19:c046  5d 9f 18	  eor $189f,x
$19:c049  5b			tcd
$19:c04a  a6 30		 ldx $30
$19:c04c  a8			tay
$19:c04d  18			clc
$19:c04e  5d 9d a4	  eor $a49d,x
$19:c051  0c a6 0c	  tsb $0ca6
$19:c054  5b			tcd
$19:c055  a4 0c		 ldy $0c
$19:c057  5d a3 0c	  eor $0ca3,x
$19:c05a  59 a1 18	  eor $18a1,y
$19:c05d  5d a1 18	  eor $18a1,x
$19:c060  5b			tcd
$19:c061  a3 30		 lda $30,s
$19:c063  a4 18		 ldy $18
$19:c065  5d a1 18	  eor $18a1,x
$19:c068  5b			tcd
$19:c069  a8			tay
$19:c06a  30 59		 bmi $c0c5
$19:c06c  a9 18 5d	  lda #$5d18
$19:c06f  9f 18 5b a6   sta $a65b18,x
$19:c073  30 59		 bmi $c0ce
$19:c075  a8			tay
$19:c076  18			clc
$19:c077  5d 9d a4	  eor $a49d,x
$19:c07a  0c a6 0c	  tsb $0ca6
$19:c07d  5b			tcd
$19:c07e  a4 0c		 ldy $0c
$19:c080  5d a3 0c	  eor $0ca3,x
$19:c083  59 a1 18	  eor $18a1,y
$19:c086  5d a1 18	  eor $18a1,x
$19:c089  5b			tcd
$19:c08a  a3 30		 lda $30,s
$19:c08c  a4 e1		 ldy $e1
$19:c08e  09 ed 78	  ora #$78ed
$19:c091  30 5d		 bmi $c0f0
$19:c093  a7 0c		 lda [$0c]
$19:c095  c8			iny
$19:c096  0c 5b a9	  tsb $a95b
$19:c099  0c 5d a7	  tsb $a75d
$19:c09c  0c 59 a6	  tsb $a659
$19:c09f  30 5d		 bmi $c0fe
$19:c0a1  a6 0c		 ldx $0c
$19:c0a3  c8			iny
$19:c0a4  0c 5b a7	  tsb $a75b
$19:c0a7  0c 5d a6	  tsb $a65d
$19:c0aa  0c 59 a4	  tsb $a459
$19:c0ad  30 5d		 bmi $c10c
$19:c0af  a4 0c		 ldy $0c
$19:c0b1  a6 0c		 ldx $0c
$19:c0b3  5b			tcd
$19:c0b4  a4 0c		 ldy $0c
$19:c0b6  5d a9 0c	  eor $0ca9,x
$19:c0b9  59 a7 18	  eor $18a7,y
$19:c0bc  5d a7 18	  eor $18a7,x
$19:c0bf  5b			tcd
$19:c0c0  a9 30 ab	  lda #$ab30
$19:c0c3  30 5d		 bmi $c122
$19:c0c5  a7 0c		 lda [$0c]
$19:c0c7  c8			iny
$19:c0c8  0c 5b a9	  tsb $a95b
$19:c0cb  0c 5d a7	  tsb $a75d
$19:c0ce  0c 59 a6	  tsb $a659
$19:c0d1  30 5d		 bmi $c130
$19:c0d3  a6 0c		 ldx $0c
$19:c0d5  c8			iny
$19:c0d6  0c 5b a7	  tsb $a75b
$19:c0d9  0c 5d a6	  tsb $a65d
$19:c0dc  0c 59 a4	  tsb $a459
$19:c0df  30 5d		 bmi $c13e
$19:c0e1  a4 0c		 ldy $0c
$19:c0e3  a6 0c		 ldx $0c
$19:c0e5  5b			tcd
$19:c0e6  a4 0c		 ldy $0c
$19:c0e8  5d a9 0c	  eor $0ca9,x
$19:c0eb  59 a7 18	  eor $18a7,y
$19:c0ee  5d a7 18	  eor $18a7,x
$19:c0f1  5b			tcd
$19:c0f2  a6 30		 ldx $30
$19:c0f4  a2 e4 00	  ldx #$00e4
$19:c0f7  e0 00 ed	  cpx #$ed00
$19:c0fa  7d e1 0b	  adc $0be1,x
$19:c0fd  06 2e		 asl $2e
$19:c0ff  b7 06		 lda [$06],y
$19:c101  2d b5 0c	  and $0cb5
$19:c104  3d b4 b2	  and $b2b4,x
$19:c107  b4 06		 ldy $06,x
$19:c109  2d b5 b4	  and $b4b5
$19:c10c  0c 3d b2	  tsb $b23d
$19:c10f  18			clc
$19:c110  b0 06		 bcs $c118
$19:c112  2e b4 06	  rol $06b4
$19:c115  2d b2 0c	  and $0cb2
$19:c118  3d b0 b0	  and $b0b0,x
$19:c11b  af 18 ab b0   lda $b0ab18
$19:c11f  e0 00 e1	  cpx #$e100
$19:c122  0b			phd
$19:c123  ed 82 06	  sbc $0682
$19:c126  3d b9 06	  and $06b9,x
$19:c129  3b			tsc
$19:c12a  b5 06		 lda $06,x
$19:c12c  3d b4 06	  and $06b4,x
$19:c12f  39 b5 06	  and $06b5,y
$19:c132  3d b9 06	  and $06b9,x
$19:c135  3b			tsc
$19:c136  b5 06		 lda $06,x
$19:c138  3d b4 06	  and $06b4,x
$19:c13b  39 b5 06	  and $06b5,y
$19:c13e  3d bb 06	  and $06bb,x
$19:c141  3b			tsc
$19:c142  b7 06		 lda [$06],y
$19:c144  3d b5 06	  and $06b5,x
$19:c147  39 b7 06	  and $06b7,y
$19:c14a  3d bb 06	  and $06bb,x
$19:c14d  3b			tsc
$19:c14e  b7 06		 lda [$06],y
$19:c150  3d b5 06	  and $06b5,x
$19:c153  39 b7 06	  and $06b7,y
$19:c156  3d b7 06	  and $06b7,x
$19:c159  3b			tsc
$19:c15a  b4 06		 ldy $06,x
$19:c15c  3d b2 06	  and $06b2,x
$19:c15f  39 b4 06	  and $06b4,y
$19:c162  3d b7 06	  and $06b7,x
$19:c165  3b			tsc
$19:c166  b4 06		 ldy $06,x
$19:c168  3d b2 06	  and $06b2,x
$19:c16b  39 b4 06	  and $06b4,y
$19:c16e  3d b9 06	  and $06b9,x
$19:c171  3b			tsc
$19:c172  b4 06		 ldy $06,x
$19:c174  3d b2 06	  and $06b2,x
$19:c177  39 b4 06	  and $06b4,y
$19:c17a  3d ad 06	  and $06ad,x
$19:c17d  3b			tsc
$19:c17e  af 06 3d b0   lda $b03d06
$19:c182  06 39		 asl $39
$19:c184  a9 06 3d	  lda #$3d06
$19:c187  a9 06 3b	  lda #$3b06
$19:c18a  ab			plb
$19:c18b  06 3d		 asl $3d
$19:c18d  ad 06 39	  lda $3906
$19:c190  af 06 3d b0   lda $b03d06
$19:c194  06 3b		 asl $3b
$19:c196  b2 06		 lda ($06)
$19:c198  3d b4 06	  and $06b4,x
$19:c19b  39 b5 06	  and $06b5,y
$19:c19e  3d ab 06	  and $06ab,x
$19:c1a1  3b			tsc
$19:c1a2  ad 06 3d	  lda $3d06
$19:c1a5  af 06 39 b0   lda $b03906
$19:c1a9  06 3d		 asl $3d
$19:c1ab  b2 06		 lda ($06)
$19:c1ad  3b			tsc
$19:c1ae  b4 06		 ldy $06,x
$19:c1b0  3d b5 06	  and $06b5,x
$19:c1b3  39 b7 06	  and $06b7,y
$19:c1b6  3d b9 06	  and $06b9,x
$19:c1b9  3b			tsc
$19:c1ba  b5 06		 lda $06,x
$19:c1bc  3d b4 06	  and $06b4,x
$19:c1bf  39 b5 06	  and $06b5,y
$19:c1c2  3d bb 06	  and $06bb,x
$19:c1c5  3b			tsc
$19:c1c6  b7 06		 lda [$06],y
$19:c1c8  3d b2 06	  and $06b2,x
$19:c1cb  39 b7 06	  and $06b7,y
$19:c1ce  3d bc 06	  and $06bc,x
$19:c1d1  3b			tsc
$19:c1d2  b7 06		 lda [$06],y
$19:c1d4  3d b5 06	  and $06b5,x
$19:c1d7  39 b7 18	  and $18b7,y
$19:c1da  6d b4 60	  adc $60b4
$19:c1dd  c9 c9 c9	  cmp #$c9c9
$19:c1e0  c9 c9 c9	  cmp #$c9c9
$19:c1e3  c9 c9 06	  cmp #$06c9
$19:c1e6  3d b7 06	  and $06b7,x
$19:c1e9  3b			tsc
$19:c1ea  b3 06		 lda ($06,s),y
$19:c1ec  3d b2 06	  and $06b2,x
$19:c1ef  39 b3 06	  and $06b3,y
$19:c1f2  3d b7 06	  and $06b7,x
$19:c1f5  3b			tsc
$19:c1f6  b3 06		 lda ($06,s),y
$19:c1f8  3d b2 06	  and $06b2,x
$19:c1fb  39 b3 06	  and $06b3,y
$19:c1fe  3d b8 06	  and $06b8,x
$19:c201  3b			tsc
$19:c202  b5 06		 lda $06,x
$19:c204  3d b3 06	  and $06b3,x
$19:c207  39 b5 06	  and $06b5,y
$19:c20a  3d b8 06	  and $06b8,x
$19:c20d  3b			tsc
$19:c20e  b5 06		 lda $06,x
$19:c210  3d b3 06	  and $06b3,x
$19:c213  39 b5 06	  and $06b5,y
$19:c216  3d b2 06	  and $06b2,x
$19:c219  3b			tsc
$19:c21a  ae 06 3d	  ldx $3d06
$19:c21d  ab			plb
$19:c21e  06 39		 asl $39
$19:c220  ae 06 3d	  ldx $3d06
$19:c223  b2 06		 lda ($06)
$19:c225  3b			tsc
$19:c226  ae 06 3d	  ldx $3d06
$19:c229  ab			plb
$19:c22a  06 39		 asl $39
$19:c22c  ae 06 3d	  ldx $3d06
$19:c22f  b3 06		 lda ($06,s),y
$19:c231  3b			tsc
$19:c232  ae 06 3d	  ldx $3d06
$19:c235  ab			plb
$19:c236  06 39		 asl $39
$19:c238  ae 06 3d	  ldx $3d06
$19:c23b  b3 06		 lda ($06,s),y
$19:c23d  3b			tsc
$19:c23e  ae 06 3d	  ldx $3d06
$19:c241  ab			plb
$19:c242  06 39		 asl $39
$19:c244  ae 06 3d	  ldx $3d06
$19:c247  b0 06		 bcs $c24f
$19:c249  3b			tsc
$19:c24a  ac 06 3d	  ldy $3d06
$19:c24d  ab			plb
$19:c24e  06 39		 asl $39
$19:c250  ac 06 3d	  ldy $3d06
$19:c253  b0 06		 bcs $c25b
$19:c255  3b			tsc
$19:c256  ac 06 3d	  ldy $3d06
$19:c259  ab			plb
$19:c25a  06 39		 asl $39
$19:c25c  ac 06 3d	  ldy $3d06
$19:c25f  b2 06		 lda ($06)
$19:c261  3b			tsc
$19:c262  ae 06 3d	  ldx $3d06
$19:c265  ab			plb
$19:c266  06 39		 asl $39
$19:c268  ae 06 3d	  ldx $3d06
$19:c26b  b2 06		 lda ($06)
$19:c26d  3b			tsc
$19:c26e  ae 06 3d	  ldx $3d06
$19:c271  ab			plb
$19:c272  06 39		 asl $39
$19:c274  ae 06 3d	  ldx $3d06
$19:c277  b0 06		 bcs $c27f
$19:c279  3b			tsc
$19:c27a  ac 06 3d	  ldy $3d06
$19:c27d  ab			plb
$19:c27e  06 39		 asl $39
$19:c280  ac 06 3d	  ldy $3d06
$19:c283  b0 06		 bcs $c28b
$19:c285  3b			tsc
$19:c286  ac 06 3d	  ldy $3d06
$19:c289  ab			plb
$19:c28a  06 39		 asl $39
$19:c28c  ac 06 3d	  ldy $3d06
$19:c28f  b3 06		 lda ($06,s),y
$19:c291  3b			tsc
$19:c292  ae 06 3d	  ldx $3d06
$19:c295  ab			plb
$19:c296  06 39		 asl $39
$19:c298  a7 06		 lda [$06]
$19:c29a  3d ab 06	  and $06ab,x
$19:c29d  3b			tsc
$19:c29e  ae 06 3d	  ldx $3d06
$19:c2a1  b3 06		 lda ($06,s),y
$19:c2a3  39 b7 06	  and $06b7,y
$19:c2a6  3d b7 06	  and $06b7,x
$19:c2a9  3b			tsc
$19:c2aa  b3 06		 lda ($06,s),y
$19:c2ac  3d b2 06	  and $06b2,x
$19:c2af  39 b3 06	  and $06b3,y
$19:c2b2  3d b7 06	  and $06b7,x
$19:c2b5  3b			tsc
$19:c2b6  b3 06		 lda ($06,s),y
$19:c2b8  3d b2 06	  and $06b2,x
$19:c2bb  39 b3 06	  and $06b3,y
$19:c2be  3d b8 06	  and $06b8,x
$19:c2c1  3b			tsc
$19:c2c2  b5 06		 lda $06,x
$19:c2c4  3d b3 06	  and $06b3,x
$19:c2c7  39 b5 06	  and $06b5,y
$19:c2ca  3d b8 06	  and $06b8,x
$19:c2cd  3b			tsc
$19:c2ce  b5 06		 lda $06,x
$19:c2d0  3d b3 06	  and $06b3,x
$19:c2d3  39 b5 06	  and $06b5,y
$19:c2d6  3d b2 06	  and $06b2,x
$19:c2d9  3b			tsc
$19:c2da  ae 06 3d	  ldx $3d06
$19:c2dd  ab			plb
$19:c2de  06 39		 asl $39
$19:c2e0  ae 06 3d	  ldx $3d06
$19:c2e3  b2 06		 lda ($06)
$19:c2e5  3b			tsc
$19:c2e6  ae 06 3d	  ldx $3d06
$19:c2e9  ab			plb
$19:c2ea  06 39		 asl $39
$19:c2ec  ae 06 3d	  ldx $3d06
$19:c2ef  b3 06		 lda ($06,s),y
$19:c2f1  3b			tsc
$19:c2f2  ae 06 3d	  ldx $3d06
$19:c2f5  ab			plb
$19:c2f6  06 39		 asl $39
$19:c2f8  ae 06 3d	  ldx $3d06
$19:c2fb  b3 06		 lda ($06,s),y
$19:c2fd  3b			tsc
$19:c2fe  ae 06 3d	  ldx $3d06
$19:c301  ab			plb
$19:c302  06 39		 asl $39
$19:c304  ae 06 3d	  ldx $3d06
$19:c307  b0 06		 bcs $c30f
$19:c309  3b			tsc
$19:c30a  ac 06 3d	  ldy $3d06
$19:c30d  ab			plb
$19:c30e  06 39		 asl $39
$19:c310  ac 06 3d	  ldy $3d06
$19:c313  b0 06		 bcs $c31b
$19:c315  3b			tsc
$19:c316  ac 06 3d	  ldy $3d06
$19:c319  ab			plb
$19:c31a  06 39		 asl $39
$19:c31c  ac 06 3d	  ldy $3d06
$19:c31f  b2 06		 lda ($06)
$19:c321  3b			tsc
$19:c322  ae 06 3d	  ldx $3d06
$19:c325  ab			plb
$19:c326  06 39		 asl $39
$19:c328  ae 06 3d	  ldx $3d06
$19:c32b  b2 06		 lda ($06)
$19:c32d  3b			tsc
$19:c32e  ae 06 3d	  ldx $3d06
$19:c331  ab			plb
$19:c332  06 39		 asl $39
$19:c334  ae 06 3d	  ldx $3d06
$19:c337  b0 06		 bcs $c33f
$19:c339  3b			tsc
$19:c33a  ac 06 3d	  ldy $3d06
$19:c33d  ab			plb
$19:c33e  06 39		 asl $39
$19:c340  ac 06 3d	  ldy $3d06
$19:c343  b2 06		 lda ($06)
$19:c345  3b			tsc
$19:c346  ae 06 3d	  ldx $3d06
$19:c349  ac 06 39	  ldy $3906
$19:c34c  ae 06 3d	  ldx $3d06
$19:c34f  b3 06		 lda ($06,s),y
$19:c351  3b			tsc
$19:c352  ae 06 3d	  ldx $3d06
$19:c355  ab			plb
$19:c356  06 39		 asl $39
$19:c358  ae 18 3d	  ldx $3d18
$19:c35b  b3 00		 lda ($00,s),y
$19:c35d  ea			nop
$19:c35e  00 e0		 brk #$e0
$19:c360  05 ed		 ora $ed
$19:c362  50 e1		 bvc $c345
$19:c364  0a			asl a
$19:c365  18			clc
$19:c366  5d a4 a4	  eor $a4a4,x
$19:c369  ab			plb
$19:c36a  ad a9 ab	  lda $aba9
$19:c36d  a4 a8		 ldy $a8
$19:c36f  a9 a9 ab	  lda #$aba9
$19:c372  ab			plb
$19:c373  a8			tay
$19:c374  a8			tay
$19:c375  ad ad a6	  lda $a6ad
$19:c378  a6 a8		 ldx $a8
$19:c37a  a8			tay
$19:c37b  a9 ab a4	  lda #$a4ab
$19:c37e  a4 ea		 ldy $ea
$19:c380  f4 ed 82	  pea $82ed
$19:c383  e1 0b		 sbc ($0b,x)
$19:c385  0f c9 0c 4d   ora $4d0cc9
$19:c389  b4 0c		 ldy $0c,x
$19:c38b  4b			phk
$19:c38c  ad b4 c9	  lda $c9b4
$19:c38f  0c 4d b5	  tsb $b54d
$19:c392  0c 4b ad	  tsb $ad4b
$19:c395  b5 c9		 lda $c9,x
$19:c397  0c 4d b2	  tsb $b24d
$19:c39a  0c 4b ab	  tsb $ab4b
$19:c39d  b2 c9		 lda ($c9)
$19:c39f  0c 4d b4	  tsb $b44d
$19:c3a2  0c 4b ab	  tsb $ab4b
$19:c3a5  b4 c9		 ldy $c9,x
$19:c3a7  0c 4d b0	  tsb $b04d
$19:c3aa  0c 4b a9	  tsb $a94b
$19:c3ad  b0 c9		 bcs $c378
$19:c3af  0c 4d b2	  tsb $b24d
$19:c3b2  0c 4b ab	  tsb $ab4b
$19:c3b5  b2 c9		 lda ($c9)
$19:c3b7  0c 4d b0	  tsb $b04d
$19:c3ba  0c 4b af	  tsb $af4b
$19:c3bd  b2 0c		 lda ($0c)
$19:c3bf  4d b0 0c	  eor $0cb0
$19:c3c2  4b			phk
$19:c3c3  ab			plb
$19:c3c4  18			clc
$19:c3c5  b0 0c		 bcs $c3d3
$19:c3c7  c9 0c 4d	  cmp #$4d0c
$19:c3ca  b4 0c		 ldy $0c,x
$19:c3cc  4b			phk
$19:c3cd  ad b4 c9	  lda $c9b4
$19:c3d0  0c 4d b5	  tsb $b54d
$19:c3d3  0c 4b ad	  tsb $ad4b
$19:c3d6  b5 c9		 lda $c9,x
$19:c3d8  0c 4d b2	  tsb $b24d
$19:c3db  0c 4b ab	  tsb $ab4b
$19:c3de  b2 c9		 lda ($c9)
$19:c3e0  0c 4d b4	  tsb $b44d
$19:c3e3  0c 4b ab	  tsb $ab4b
$19:c3e6  b4 c9		 ldy $c9,x
$19:c3e8  0c 4d b0	  tsb $b04d
$19:c3eb  0c 4b b5	  tsb $b54b
$19:c3ee  b0 c9		 bcs $c3b9
$19:c3f0  0c 4d b2	  tsb $b24d
$19:c3f3  0c 4b ab	  tsb $ab4b
$19:c3f6  b2 c9		 lda ($c9)
$19:c3f8  0c 4d b0	  tsb $b04d
$19:c3fb  0c 4b af	  tsb $af4b
$19:c3fe  b2 0c		 lda ($0c)
$19:c400  4d b4 0c	  eor $0cb4
$19:c403  4b			phk
$19:c404  b0 15		 bcs $c41b
$19:c406  b4 ea		 ldy $ea,x
$19:c408  00 e0		 brk #$e0
$19:c40a  06 ea		 asl $ea
$19:c40c  f4 ed be	  pea $beed
$19:c40f  e1 08		 sbc ($08,x)
$19:c411  0c c9 06	  tsb $06c9
$19:c414  2d b7 b7	  and $b7b7
$19:c417  0c 5d b7	  tsb $b75d
$19:c41a  06 2d		 asl $2d
$19:c41c  b0 b7		 bcs $c3d5
$19:c41e  30 5d		 bmi $c47d
$19:c420  b8			clv
$19:c421  0c c9 06	  tsb $06c9
$19:c424  2d b5 b5	  and $b5b5
$19:c427  0c 5d b5	  tsb $b55d
$19:c42a  06 2d		 asl $2d
$19:c42c  ae b5 30	  ldx $30b5
$19:c42f  5d b7 0c	  eor $0cb7,x
$19:c432  c9 06 2d	  cmp #$2d06
$19:c435  b3 b3		 lda ($b3,s),y
$19:c437  0c 5d b3	  tsb $b35d
$19:c43a  06 2d		 asl $2d
$19:c43c  ac b3 30	  ldy $30b3
$19:c43f  5d b5 0c	  eor $0cb5,x
$19:c442  c9 06 2d	  cmp #$2d06
$19:c445  b3 b3		 lda ($b3,s),y
$19:c447  0c 5d b3	  tsb $b35d
$19:c44a  0c 2d b5	  tsb $b52d
$19:c44d  30 5d		 bmi $c4ac
$19:c44f  b7 0c		 lda [$0c],y
$19:c451  c9 06 2d	  cmp #$2d06
$19:c454  b7 b7		 lda [$b7],y
$19:c456  0c 5d b7	  tsb $b75d
$19:c459  06 2d		 asl $2d
$19:c45b  b0 b7		 bcs $c414
$19:c45d  30 5d		 bmi $c4bc
$19:c45f  b8			clv
$19:c460  0c c9 06	  tsb $06c9
$19:c463  2d b5 b5	  and $b5b5
$19:c466  0c 5d b5	  tsb $b55d
$19:c469  06 2d		 asl $2d
$19:c46b  ae b5 30	  ldx $30b5
$19:c46e  5d b7 0c	  eor $0cb7,x
$19:c471  c9 06 2d	  cmp #$2d06
$19:c474  b3 b3		 lda ($b3,s),y
$19:c476  0c 5d b3	  tsb $b35d
$19:c479  06 2d		 asl $2d
$19:c47b  ac b3 30	  ldy $30b3
$19:c47e  5d b5 12	  eor $12b5,x
$19:c481  2d b3 06	  and $06b3
$19:c484  b5 e3		 lda $e3,x
$19:c486  01 5a		 ora ($5a,x)
$19:c488  80 12		 bra $c49c
$19:c48a  5d b5 e4	  eor $e4b5,x
$19:c48d  03 0d		 ora $0d,s
$19:c48f  b4 b5		 ldy $b5,x
$19:c491  30 5d		 bmi $c4f0
$19:c493  b3 00		 lda ($00,s),y
$19:c495  e0 06 ea	  cpx #$ea06
$19:c498  f4 ed 78	  pea $78ed
$19:c49b  e1 05		 sbc ($05,x)
$19:c49d  66 c9		 ror $c9
$19:c49f  60			rts
$19:c4a0  c9 c9 c9	  cmp #$c9c9
$19:c4a3  c9 c9 c9	  cmp #$c9c9
$19:c4a6  c9 c9 c9	  cmp #$c9c9
$19:c4a9  c9 c9 c9	  cmp #$c9c9
$19:c4ac  c9 0c c9	  cmp #$c90c
$19:c4af  06 2d		 asl $2d
$19:c4b1  b7 b7		 lda [$b7],y
$19:c4b3  0c 5d b7	  tsb $b75d
$19:c4b6  06 2d		 asl $2d
$19:c4b8  b0 b7		 bcs $c471
$19:c4ba  30 5d		 bmi $c519
$19:c4bc  b8			clv
$19:c4bd  0c c9 06	  tsb $06c9
$19:c4c0  2d b5 b5	  and $b5b5
$19:c4c3  0c 5d b5	  tsb $b55d
$19:c4c6  06 2d		 asl $2d
$19:c4c8  ae b5 30	  ldx $30b5
$19:c4cb  5d b7 0c	  eor $0cb7,x
$19:c4ce  c9 06 2d	  cmp #$2d06
$19:c4d1  b3 b3		 lda ($b3,s),y
$19:c4d3  0c 5d b3	  tsb $b35d
$19:c4d6  06 2d		 asl $2d
$19:c4d8  ac b3 30	  ldy $30b3
$19:c4db  5d b5 0c	  eor $0cb5,x
$19:c4de  c9 06 2d	  cmp #$2d06
$19:c4e1  b3 b3		 lda ($b3,s),y
$19:c4e3  0c 5d b3	  tsb $b35d
$19:c4e6  0c 2d b5	  tsb $b52d
$19:c4e9  30 5d		 bmi $c548
$19:c4eb  b7 0c		 lda [$0c],y
$19:c4ed  c9 06 2d	  cmp #$2d06
$19:c4f0  b7 b7		 lda [$b7],y
$19:c4f2  0c 5d b7	  tsb $b75d
$19:c4f5  06 2d		 asl $2d
$19:c4f7  b0 b7		 bcs $c4b0
$19:c4f9  30 5d		 bmi $c558
$19:c4fb  b8			clv
$19:c4fc  0c c9 06	  tsb $06c9
$19:c4ff  2d b5 b5	  and $b5b5
$19:c502  0c 5d b5	  tsb $b55d
$19:c505  06 2d		 asl $2d
$19:c507  ae b5 30	  ldx $30b5
$19:c50a  5d b7 0c	  eor $0cb7,x
$19:c50d  c9 06 2d	  cmp #$2d06
$19:c510  b3 b3		 lda ($b3,s),y
$19:c512  0c 5d b3	  tsb $b35d
$19:c515  06 2d		 asl $2d
$19:c517  ac b3 30	  ldy $30b3
$19:c51a  5d b5 12	  eor $12b5,x
$19:c51d  2d b3 06	  and $06b3
$19:c520  b5 e3		 lda $e3,x
$19:c522  01 5a		 ora ($5a,x)
$19:c524  80 12		 bra $c538
$19:c526  5d b5 e4	  eor $e4b5,x
$19:c529  03 0d		 ora $0d,s
$19:c52b  b4 b5		 ldy $b5,x
$19:c52d  2a			rol a
$19:c52e  5d b3 00	  eor $00b3,x
$19:c531  ea			nop
$19:c532  00 e0		 brk #$e0
$19:c534  02 ed		 cop #$ed
$19:c536  5a			phy
$19:c537  e1 09		 sbc ($09,x)
$19:c539  06 c9		 asl $c9
$19:c53b  06 4d		 asl $4d
$19:c53d  b4 b2		 ldy $b2,x
$19:c53f  0c b0 af	  tsb $afb0
$19:c542  b0 06		 bcs $c54a
$19:c544  b2 b0		 lda ($b0)
$19:c546  0c af 18	  tsb $18af
$19:c549  ad 06 b0	  lda $b006
$19:c54c  af 0c ad ad   lda $adad0c
$19:c550  ab			plb
$19:c551  18			clc
$19:c552  a8			tay
$19:c553  ab			plb
$19:c554  0c b5 06	  tsb $06b5
$19:c557  b4 b5		 ldy $b5,x
$19:c559  0c b2 b0	  tsb $b0b2
$19:c55c  18			clc
$19:c55d  b2 ab		 lda ($ab)
$19:c55f  0c b4 06	  tsb $06b4
$19:c562  b2 b4		 lda ($b4)
$19:c564  0c b0 af	  tsb $afb0
$19:c567  18			clc
$19:c568  b0 a9		 bcs $c513
$19:c56a  0c b2 06	  tsb $06b2
$19:c56d  b0 b2		 bcs $c521
$19:c56f  0c af ad	  tsb $adaf
$19:c572  18			clc
$19:c573  af b4 0c b5   lda $b50cb4
$19:c577  06 b2		 asl $b2
$19:c579  b0 0c		 bcs $c587
$19:c57b  b0 af		 bcs $c52c
$19:c57d  18			clc
$19:c57e  b0 18		 bcs $c598
$19:c580  4a			lsr a
$19:c581  b0 e1		 bcs $c564
$19:c583  08			php
$19:c584  ed 46 30	  sbc $3046
$19:c587  5d b0 0c	  eor $0cb0,x
$19:c58a  c8			iny
$19:c58b  0c 5b b2	  tsb $b25b
$19:c58e  0c 5d b0	  tsb $b05d
$19:c591  0c 59 af	  tsb $af59
$19:c594  30 5d		 bmi $c5f3
$19:c596  af 0c c8 0c   lda $0cc80c
$19:c59a  5b			tcd
$19:c59b  b0 0c		 bcs $c5a9
$19:c59d  5d af 0c	  eor $0caf,x
$19:c5a0  59 ad 30	  eor $30ad,y
$19:c5a3  5d ad 0c	  eor $0cad,x
$19:c5a6  af 0c 5b ad   lda $ad5b0c
$19:c5aa  0c 5d b2	  tsb $b25d
$19:c5ad  0c 59 b0	  tsb $b059
$19:c5b0  18			clc
$19:c5b1  5c b0 18 5a   jml $5a18b0
$19:c5b5  b2 30		 lda ($30)
$19:c5b7  58			cli
$19:c5b8  b4 30		 ldy $30,x
$19:c5ba  5d b0 0c	  eor $0cb0,x
$19:c5bd  c8			iny
$19:c5be  0c 5b b2	  tsb $b25b
$19:c5c1  0c 5d b0	  tsb $b05d
$19:c5c4  0c 59 af	  tsb $af59
$19:c5c7  30 5d		 bmi $c626
$19:c5c9  af 0c c8 0c   lda $0cc80c
$19:c5cd  5b			tcd
$19:c5ce  b0 0c		 bcs $c5dc
$19:c5d0  5d af 0c	  eor $0caf,x
$19:c5d3  59 ad 30	  eor $30ad,y
$19:c5d6  5d ad 0c	  eor $0cad,x
$19:c5d9  af 0c 5b ad   lda $ad5b0c
$19:c5dd  0c 5d b2	  tsb $b25d
$19:c5e0  0c 59 b0	  tsb $b059
$19:c5e3  18			clc
$19:c5e4  5d b0 18	  eor $18b0,x
$19:c5e7  5b			tcd
$19:c5e8  b2 30		 lda ($30)
$19:c5ea  b0 e1		 bcs $c5cd
$19:c5ec  09 ed 5a	  ora #$5aed
$19:c5ef  18			clc
$19:c5f0  5d b0 b7	  eor $b7b0,x
$19:c5f3  30 6a		 bmi $c65f
$19:c5f5  b8			clv
$19:c5f6  18			clc
$19:c5f7  5d ae b5	  eor $b5ae,x
$19:c5fa  30 6a		 bmi $c666
$19:c5fc  b7 18		 lda [$18],y
$19:c5fe  5d ac b3	  eor $b3ac,x
$19:c601  0c b5 0c	  tsb $0cb5
$19:c604  5b			tcd
$19:c605  b3 0c		 lda ($0c,s),y
$19:c607  5d b2 0c	  eor $0cb2,x
$19:c60a  59 b0 18	  eor $18b0,y
$19:c60d  5d b0 18	  eor $18b0,x
$19:c610  5b			tcd
$19:c611  b2 30		 lda ($30)
$19:c613  5a			phy
$19:c614  b3 18		 lda ($18,s),y
$19:c616  5d b0 b7	  eor $b7b0,x
$19:c619  30 6a		 bmi $c685
$19:c61b  b8			clv
$19:c61c  18			clc
$19:c61d  5d ae b5	  eor $b5ae,x
$19:c620  30 6a		 bmi $c68c
$19:c622  b7 18		 lda [$18],y
$19:c624  5d ac b3	  eor $b3ac,x
$19:c627  0c b5 0c	  tsb $0cb5
$19:c62a  5b			tcd
$19:c62b  b3 0c		 lda ($0c,s),y
$19:c62d  5d b2 0c	  eor $0cb2,x
$19:c630  59 b0 18	  eor $18b0,y
$19:c633  5d b3 18	  eor $18b3,x
$19:c636  5b			tcd
$19:c637  b2 2a		 lda ($2a)
$19:c639  b3 00		 lda ($00,s),y
$19:c63b  00 1c		 brk #$1c
$19:c63d  00 34		 brk #$34
$19:c63f  2c 53 73	  bit $7353
$19:c642  94 77		 sty $77,x
$19:c644  d3 77		 cmp ($77,s),y
$19:c646  4e 7b 69	  lsr $697b
$19:c649  7b			tdc
$19:c64a  84 7b		 sty $7b
$19:c64c  7d 91 e6	  adc $e691,x
$19:c64f  94 25		 sty $25,x
$19:c651  95 89		 sta $89,x
$19:c653  97 d2		 sta [$d2],y
$19:c655  99 d2 99	  sta $99d2,y
$19:c658  0a			asl a
$19:c659  a7 39		 lda [$39]
$19:c65b  ab			plb
$19:c65c  02 00		 cop #$00
$19:c65e  fd 0f 06	  sbc $060f,x
$19:c661  ba			tsx
$19:c662  00 00		 brk #$00
$19:c664  07 1d		 ora [$1d]
$19:c666  1b			tcs
$19:c667  1f 12 1e 16   ora $161e12,x
$19:c66b  11 24		 ora ($24),y
$19:c66d  00 4e		 brk #$4e
$19:c66f  2e 0d ff	  rol $ff0d
$19:c672  e0 b8 01	  cpx #$01b8
$19:c675  80 0e		 bra $c685
$19:c677  ff e0 b8 00   sbc $00b8e0,x
$19:c67b  f0 0f		 beq $c68c
$19:c67d  ff f7 b8 07   sbc $07b8f7,x
$19:c681  a8			tay
$19:c682  10 ff		 bpl $c683
$19:c684  e0 b8 03	  cpx #$03b8
$19:c687  00 11		 brk #$11
$19:c689  ff f6 b8 07   sbc $07b8f6,x
$19:c68d  a8			tay
$19:c68e  12 ff		 ora ($ff)
$19:c690  e0 b8 03	  cpx #$03b8
$19:c693  c0 18 00	  cpy #$0018
$19:c696  00 2f		 brk #$2f
$19:c698  32 65		 and ($65)
$19:c69a  7f 98 b2 cb   adc $cbb298,x
$19:c69e  e5 fc		 sbc $fc
$19:c6a0  19 32 4c	  ora $4c32,y
$19:c6a3  65 72		 adc $72
$19:c6a5  7f 8c 98 a5   adc $a5988c,x
$19:c6a9  b2 bf		 lda ($bf)
$19:c6ab  cb			wai
$19:c6ac  d8			cld
$19:c6ad  e5 f2		 sbc $f2
$19:c6af  fc 4a 09	  jsr ($094a,x)
$19:c6b2  00 10		 brk #$10
$19:c6b4  02 10		 cop #$10
$19:c6b6  0a			asl a
$19:c6b7  10 ff		 bpl $c6b8
$19:c6b9  00 02		 brk #$02
$19:c6bb  10 00		 bpl $c6bd
$19:c6bd  00 1a		 brk #$1a
$19:c6bf  10 ee		 bpl $c6af
$19:c6c1  10 67		 bpl $c72a
$19:c6c3  12 35		 ora ($35)
$19:c6c5  14 ec		 trb $ec
$19:c6c7  14 4b		 trb $4b
$19:c6c9  16 89		 asl $89,x
$19:c6cb  16 59		 asl $59,x
$19:c6cd  18			clc
$19:c6ce  fa			plx
$19:c6cf  06 ea		 asl $ea
$19:c6d1  00 e0		 brk #$e0
$19:c6d3  03 e7		 ora $e7,s
$19:c6d5  17 ed		 ora [$ed],y
$19:c6d7  96 e5		 stx $e5,y
$19:c6d9  f0 e1		 beq $c6bc
$19:c6db  0a			asl a
$19:c6dc  f5 80		 sbc $80,x
$19:c6de  7f 7f f7 03   adc $03f77f,x
$19:c6e2  aa			tax
$19:c6e3  00 e3		 brk #$e3
$19:c6e5  08			php
$19:c6e6  28			plp
$19:c6e7  80 3c		 bra $c725
$19:c6e9  c9 c9 c9	  cmp #$c9c9
$19:c6ec  c9 3c 5d	  cmp #$5d3c
$19:c6ef  b2 ac		 lda ($ac)
$19:c6f1  ad a6 b2	  lda $b2a6
$19:c6f4  ac ad a6	  ldy $a6ad
$19:c6f7  ae ab a8	  ldx $a8ab
$19:c6fa  a2 a5 a8	  ldx #$a8a5
$19:c6fd  ab			plb
$19:c6fe  b1 b4		 lda ($b4),y
$19:c700  ae ab a5	  ldx $a5ab
$19:c703  a4 a8		 ldy $a8
$19:c705  ab			plb
$19:c706  ad e5 be	  lda $bee5
$19:c709  e0 04 ea	  cpx #$ea04
$19:c70c  00 18		 brk #$18
$19:c70e  c9 06 47	  cmp #$4706
$19:c711  a1 06		 lda ($06,x)
$19:c713  49 a7 e5	  eor #$e5a7
$19:c716  c8			iny
$19:c717  06 4b		 asl $4b
$19:c719  ae 06 49	  ldx $4906
$19:c71c  a1 06		 lda ($06,x)
$19:c71e  4b			phk
$19:c71f  a7 06		 lda [$06]
$19:c721  47 ae		 eor [$ae]
$19:c723  06 4b		 asl $4b
$19:c725  a1 06		 lda ($06,x)
$19:c727  49 a7 06	  eor #$06a7
$19:c72a  4b			phk
$19:c72b  ae 06 47	  ldx $4706
$19:c72e  a1 e5		 lda ($e5,x)
$19:c730  dc 06 4b	  jml [$4b06]
$19:c733  a7 06		 lda [$06]
$19:c735  49 ae 06	  eor #$06ae
$19:c738  4b			phk
$19:c739  a1 06		 lda ($06,x)
$19:c73b  47 a7		 eor [$a7]
$19:c73d  0c 4b ae	  tsb $ae4b
$19:c740  06 49		 asl $49
$19:c742  a1 06		 lda ($06,x)
$19:c744  47 a7		 eor [$a7]
$19:c746  e5 e6		 sbc $e6
$19:c748  06 4c		 asl $4c
$19:c74a  ae 06 4a	  ldx $4a06
$19:c74d  a1 06		 lda ($06,x)
$19:c74f  4c a7 06	  jmp $06a7
$19:c752  48			pha
$19:c753  ae 06 4c	  ldx $4c06
$19:c756  a1 06		 lda ($06,x)
$19:c758  4a			lsr a
$19:c759  a7 06		 lda [$06]
$19:c75b  4c ae 06	  jmp $06ae
$19:c75e  48			pha
$19:c75f  a1 e5		 lda ($e5,x)
$19:c761  f0 06		 beq $c769
$19:c763  4c a7 06	  jmp $06a7
$19:c766  4a			lsr a
$19:c767  ae 06 4c	  ldx $4c06
$19:c76a  a1 06		 lda ($06,x)
$19:c76c  48			pha
$19:c76d  a7 0c		 lda [$0c]
$19:c76f  4c ae 06	  jmp $06ae
$19:c772  4a			lsr a
$19:c773  a1 06		 lda ($06,x)
$19:c775  48			pha
$19:c776  a7 e5		 lda [$e5]
$19:c778  ff 06 4d ae   sbc $ae4d06,x
$19:c77c  06 4b		 asl $4b
$19:c77e  a1 06		 lda ($06,x)
$19:c780  4d a7 06	  eor $06a7
$19:c783  49 ae 06	  eor #$06ae
$19:c786  4d a1 06	  eor $06a1
$19:c789  4b			phk
$19:c78a  a7 06		 lda [$06]
$19:c78c  4d ae 06	  eor $06ae
$19:c78f  49 a1 06	  eor #$06a1
$19:c792  4d a7 06	  eor $06a7
$19:c795  4b			phk
$19:c796  ae 06 4d	  ldx $4d06
$19:c799  a1 18		 lda ($18,x)
$19:c79b  49 a7 ea	  eor #$eaa7
$19:c79e  00 06		 brk #$06
$19:c7a0  c9 00 ea	  cmp #$ea00
$19:c7a3  00 e0		 brk #$e0
$19:c7a5  01 ed		 ora ($ed,x)
$19:c7a7  be e1 09	  ldx $09e1,y
$19:c7aa  3c c9 c9	  bit $c9c9,x
$19:c7ad  c9 c9 18	  cmp #$18c9
$19:c7b0  c9 06 3d	  cmp #$3d06
$19:c7b3  ad ae af	  lda $afae
$19:c7b6  b0 0c		 bcs $c7c4
$19:c7b8  b1 18		 lda ($18),y
$19:c7ba  c9 06 ac	  cmp #$ac06
$19:c7bd  ad ae af	  lda $afae
$19:c7c0  0c b0 18	  tsb $18b0
$19:c7c3  c9 06 ab	  cmp #$ab06
$19:c7c6  ac ad ae	  ldy $aead
$19:c7c9  0c af 18	  tsb $18af
$19:c7cc  c9 06 a9	  cmp #$a906
$19:c7cf  aa			tax
$19:c7d0  ab			plb
$19:c7d1  ac 0c ad	  ldy $ad0c
$19:c7d4  18			clc
$19:c7d5  c9 06 ad	  cmp #$ad06
$19:c7d8  ae af b0	  ldx $b0af
$19:c7db  0c b1 18	  tsb $18b1
$19:c7de  c9 06 af	  cmp #$af06
$19:c7e1  b0 b1		 bcs $c794
$19:c7e3  b2 0c		 lda ($0c)
$19:c7e5  b3 18		 lda ($18,s),y
$19:c7e7  c9 06 ad	  cmp #$ad06
$19:c7ea  ae af b0	  ldx $b0af
$19:c7ed  0c b1 18	  tsb $18b1
$19:c7f0  c9 06 ab	  cmp #$ab06
$19:c7f3  ac ad ae	  ldy $aead
$19:c7f6  0c af 18	  tsb $18af
$19:c7f9  c9 06 ad	  cmp #$ad06
$19:c7fc  ae af b0	  ldx $b0af
$19:c7ff  0c b1 18	  tsb $18b1
$19:c802  c9 06 ab	  cmp #$ab06
$19:c805  ac ad ae	  ldy $aead
$19:c808  0c af 18	  tsb $18af
$19:c80b  c9 06 aa	  cmp #$aa06
$19:c80e  ab			plb
$19:c80f  ac ad 0c	  ldy $0cad
$19:c812  ae 18 c9	  ldx $c918
$19:c815  06 ab		 asl $ab
$19:c817  ac ad ae	  ldy $aead
$19:c81a  0c af 18	  tsb $18af
$19:c81d  c9 06 b0	  cmp #$b006
$19:c820  b1 b2		 lda ($b2),y
$19:c822  b3 0c		 lda ($0c,s),y
$19:c824  b4 18		 ldy $18,x
$19:c826  c9 06 af	  cmp #$af06
$19:c829  b0 b1		 bcs $c7dc
$19:c82b  b2 0c		 lda ($0c)
$19:c82d  b3 18		 lda ($18,s),y
$19:c82f  c9 06 ad	  cmp #$ad06
$19:c832  ae af b0	  ldx $b0af
$19:c835  0c b1 18	  tsb $18b1
$19:c838  c9 06 ac	  cmp #$ac06
$19:c83b  ad ae af	  lda $afae
$19:c83e  0c b0 18	  tsb $18b0
$19:c841  c9 06 ab	  cmp #$ab06
$19:c844  ac ad ae	  ldy $aead
$19:c847  0c af 18	  tsb $18af
$19:c84a  c9 06 a9	  cmp #$a906
$19:c84d  aa			tax
$19:c84e  ab			plb
$19:c84f  ac 0c ad	  ldy $ad0c
$19:c852  18			clc
$19:c853  c9 06 ab	  cmp #$ab06
$19:c856  ac ad ae	  ldy $aead
$19:c859  0c af 18	  tsb $18af
$19:c85c  c9 06 ad	  cmp #$ad06
$19:c85f  ae af b0	  ldx $b0af
$19:c862  0c b1 18	  tsb $18b1
$19:c865  c9 06 ad	  cmp #$ad06
$19:c868  ae af b0	  ldx $b0af
$19:c86b  0c b1 18	  tsb $18b1
$19:c86e  c9 06 af	  cmp #$af06
$19:c871  b0 b1		 bcs $c824
$19:c873  b2 0c		 lda ($0c)
$19:c875  b3 18		 lda ($18,s),y
$19:c877  c9 06 ae	  cmp #$ae06
$19:c87a  af b0 b1 0c   lda $0cb1b0
$19:c87e  b2 18		 lda ($18)
$19:c880  c9 06 ac	  cmp #$ac06
$19:c883  ad ae af	  lda $afae
$19:c886  0c b0 ea	  tsb $eab0
$19:c889  00 18		 brk #$18
$19:c88b  c9 06 45	  cmp #$4506
$19:c88e  a1 06		 lda ($06,x)
$19:c890  47 a7		 eor [$a7]
$19:c892  e1 0d		 sbc ($0d,x)
$19:c894  06 49		 asl $49
$19:c896  ae 06 47	  ldx $4706
$19:c899  a1 06		 lda ($06,x)
$19:c89b  49 a7 06	  eor #$06a7
$19:c89e  45 ae		 eor $ae
$19:c8a0  06 49		 asl $49
$19:c8a2  a1 06		 lda ($06,x)
$19:c8a4  47 a7		 eor [$a7]
$19:c8a6  06 49		 asl $49
$19:c8a8  ae 06 45	  ldx $4506
$19:c8ab  a1 06		 lda ($06,x)
$19:c8ad  49 a7 06	  eor #$06a7
$19:c8b0  47 ae		 eor [$ae]
$19:c8b2  06 49		 asl $49
$19:c8b4  a1 06		 lda ($06,x)
$19:c8b6  45 a7		 eor $a7
$19:c8b8  0c 49 ae	  tsb $ae49
$19:c8bb  06 47		 asl $47
$19:c8bd  a1 06		 lda ($06,x)
$19:c8bf  45 a7		 eor $a7
$19:c8c1  e1 07		 sbc ($07,x)
$19:c8c3  06 4a		 asl $4a
$19:c8c5  ae 06 48	  ldx $4806
$19:c8c8  a1 06		 lda ($06,x)
$19:c8ca  4a			lsr a
$19:c8cb  a7 06		 lda [$06]
$19:c8cd  46 ae		 lsr $ae
$19:c8cf  06 4a		 asl $4a
$19:c8d1  a1 06		 lda ($06,x)
$19:c8d3  48			pha
$19:c8d4  a7 06		 lda [$06]
$19:c8d6  4a			lsr a
$19:c8d7  ae 06 46	  ldx $4606
$19:c8da  a1 06		 lda ($06,x)
$19:c8dc  4a			lsr a
$19:c8dd  a7 06		 lda [$06]
$19:c8df  48			pha
$19:c8e0  ae 06 4a	  ldx $4a06
$19:c8e3  a1 06		 lda ($06,x)
$19:c8e5  46 a7		 lsr $a7
$19:c8e7  0c 4a ae	  tsb $ae4a
$19:c8ea  06 48		 asl $48
$19:c8ec  a1 06		 lda ($06,x)
$19:c8ee  46 a7		 lsr $a7
$19:c8f0  e1 09		 sbc ($09,x)
$19:c8f2  06 4b		 asl $4b
$19:c8f4  ae 06 49	  ldx $4906
$19:c8f7  a1 06		 lda ($06,x)
$19:c8f9  4b			phk
$19:c8fa  a7 06		 lda [$06]
$19:c8fc  47 ae		 eor [$ae]
$19:c8fe  06 4b		 asl $4b
$19:c900  a1 06		 lda ($06,x)
$19:c902  49 a7 06	  eor #$06a7
$19:c905  4b			phk
$19:c906  ae 06 47	  ldx $4706
$19:c909  a1 06		 lda ($06,x)
$19:c90b  4b			phk
$19:c90c  a7 06		 lda [$06]
$19:c90e  49 ae 06	  eor #$06ae
$19:c911  4b			phk
$19:c912  a1 18		 lda ($18,x)
$19:c914  47 a7		 eor [$a7]
$19:c916  ea			nop
$19:c917  00 06		 brk #$06
$19:c919  c9 00 ea	  cmp #$ea00
$19:c91c  00 e0		 brk #$e0
$19:c91e  00 ed		 brk #$ed
$19:c920  6e e1 0a	  ror $0ae1
$19:c923  e3 18		 sbc $18,s
$19:c925  46 7f		 lsr $7f
$19:c927  0c c9 0c	  tsb $0cc9
$19:c92a  5d a6 0c	  eor $0ca6,x
$19:c92d  5b			tcd
$19:c92e  ad b2 0c	  lda $0cb2
$19:c931  59 ad c9	  eor $c9ad,y
$19:c934  0c 5d a6	  tsb $a65d
$19:c937  0c 5b ac	  tsb $ac5b
$19:c93a  b2 0c		 lda ($0c)
$19:c93c  59 ac c9	  eor $c9ac,y
$19:c93f  0c 5d a6	  tsb $a65d
$19:c942  0c 5b ad	  tsb $ad5b
$19:c945  b2 0c		 lda ($0c)
$19:c947  59 ad c9	  eor $c9ad,y
$19:c94a  0c 5d a6	  tsb $a65d
$19:c94d  0c 5b ac	  tsb $ac5b
$19:c950  b2 0c		 lda ($0c)
$19:c952  59 ac c9	  eor $c9ac,y
$19:c955  0c 5d a6	  tsb $a65d
$19:c958  0c 5b ad	  tsb $ad5b
$19:c95b  b2 0c		 lda ($0c)
$19:c95d  59 ad c9	  eor $c9ad,y
$19:c960  0c 5d a6	  tsb $a65d
$19:c963  0c 5b ac	  tsb $ac5b
$19:c966  b2 0c		 lda ($0c)
$19:c968  59 ac c9	  eor $c9ac,y
$19:c96b  0c 5d a6	  tsb $a65d
$19:c96e  0c 5b ad	  tsb $ad5b
$19:c971  b2 0c		 lda ($0c)
$19:c973  59 ad c9	  eor $c9ad,y
$19:c976  0c 5d a6	  tsb $a65d
$19:c979  0c 5b ac	  tsb $ac5b
$19:c97c  b2 0c		 lda ($0c)
$19:c97e  59 ac c9	  eor $c9ac,y
$19:c981  0c 5d a6	  tsb $a65d
$19:c984  0c 5b ad	  tsb $ad5b
$19:c987  b2 0c		 lda ($0c)
$19:c989  59 ad c9	  eor $c9ad,y
$19:c98c  0c 5d a6	  tsb $a65d
$19:c98f  0c 5b ac	  tsb $ac5b
$19:c992  b2 0c		 lda ($0c)
$19:c994  59 ac c9	  eor $c9ac,y
$19:c997  0c 5d a6	  tsb $a65d
$19:c99a  0c 5b ad	  tsb $ad5b
$19:c99d  b2 0c		 lda ($0c)
$19:c99f  59 ad c9	  eor $c9ad,y
$19:c9a2  0c 5d a6	  tsb $a65d
$19:c9a5  0c 5b ac	  tsb $ac5b
$19:c9a8  b2 0c		 lda ($0c)
$19:c9aa  59 ac c9	  eor $c9ac,y
$19:c9ad  0c 5d a6	  tsb $a65d
$19:c9b0  0c 5b ac	  tsb $ac5b
$19:c9b3  b2 0c		 lda ($0c)
$19:c9b5  59 ac c9	  eor $c9ac,y
$19:c9b8  0c 5d a6	  tsb $a65d
$19:c9bb  0c 5b ab	  tsb $ab5b
$19:c9be  b2 0c		 lda ($0c)
$19:c9c0  59 ab c9	  eor $c9ab,y
$19:c9c3  0c 5d ab	  tsb $ab5d
$19:c9c6  0c 5b b0	  tsb $b05b
$19:c9c9  b7 0c		 lda [$0c],y
$19:c9cb  59 b0 c9	  eor $c9b0,y
$19:c9ce  0c 5d ab	  tsb $ab5d
$19:c9d1  0c 5b b3	  tsb $b35b
$19:c9d4  b7 0c		 lda [$0c],y
$19:c9d6  59 b3 c9	  eor $c9b3,y
$19:c9d9  0c 5d a5	  tsb $a55d
$19:c9dc  0c 5b ab	  tsb $ab5b
$19:c9df  b1 0c		 lda ($0c),y
$19:c9e1  59 ab c9	  eor $c9ab,y
$19:c9e4  0c 5d a5	  tsb $a55d
$19:c9e7  0c 5b ab	  tsb $ab5b
$19:c9ea  b1 0c		 lda ($0c),y
$19:c9ec  59 ab c9	  eor $c9ab,y
$19:c9ef  0c 5d a5	  tsb $a55d
$19:c9f2  0c 5b ab	  tsb $ab5b
$19:c9f5  b1 0c		 lda ($0c),y
$19:c9f7  59 ab c9	  eor $c9ab,y
$19:c9fa  0c 5d a5	  tsb $a55d
$19:c9fd  0c 5b ab	  tsb $ab5b
$19:ca00  b1 0c		 lda ($0c),y
$19:ca02  59 ab c9	  eor $c9ab,y
$19:ca05  0c 5d a8	  tsb $a85d
$19:ca08  0c 5b ad	  tsb $ad5b
$19:ca0b  b4 0c		 ldy $0c,x
$19:ca0d  59 ad c9	  eor $c9ad,y
$19:ca10  0c 5d a7	  tsb $a75d
$19:ca13  0c 5b ae	  tsb $ae5b
$19:ca16  b3 0c		 lda ($0c,s),y
$19:ca18  59 ae c9	  eor $c9ae,y
$19:ca1b  0c 5d a8	  tsb $a85d
$19:ca1e  0c 5b b0	  tsb $b05b
$19:ca21  b4 0c		 ldy $0c,x
$19:ca23  59 b0 c9	  eor $c9b0,y
$19:ca26  0c 5d a2	  tsb $a25d
$19:ca29  0c 5b aa	  tsb $aa5b
$19:ca2c  ae 0c 59	  ldx $590c
$19:ca2f  aa			tax
$19:ca30  c9 0c 5d	  cmp #$5d0c
$19:ca33  a1 0c		 lda ($0c,x)
$19:ca35  5b			tcd
$19:ca36  a9 ad 0c	  lda #$0cad
$19:ca39  59 a9 c9	  eor $c9a9,y
$19:ca3c  0c 5d a1	  tsb $a15d
$19:ca3f  0c 5b a8	  tsb $a85b
$19:ca42  ad 0c 59	  lda $590c
$19:ca45  a8			tay
$19:ca46  c9 0c 5d	  cmp #$5d0c
$19:ca49  a8			tay
$19:ca4a  0c 5b b0	  tsb $b05b
$19:ca4d  b4 0c		 ldy $0c,x
$19:ca4f  59 b0 c9	  eor $c9b0,y
$19:ca52  0c 5d a5	  tsb $a55d
$19:ca55  0c 5b a8	  tsb $a85b
$19:ca58  b1 0c		 lda ($0c),y
$19:ca5a  59 a8 ea	  eor $eaa8,y
$19:ca5d  f4 18 c9	  pea $c918
$19:ca60  06 47		 asl $47
$19:ca62  a1 06		 lda ($06,x)
$19:ca64  49 a7 06	  eor #$06a7
$19:ca67  4b			phk
$19:ca68  ae 06 49	  ldx $4906
$19:ca6b  a1 06		 lda ($06,x)
$19:ca6d  4b			phk
$19:ca6e  a7 06		 lda [$06]
$19:ca70  47 ae		 eor [$ae]
$19:ca72  06 4b		 asl $4b
$19:ca74  a1 06		 lda ($06,x)
$19:ca76  49 a7 06	  eor #$06a7
$19:ca79  4b			phk
$19:ca7a  ae 06 47	  ldx $4706
$19:ca7d  a1 06		 lda ($06,x)
$19:ca7f  4b			phk
$19:ca80  a7 06		 lda [$06]
$19:ca82  49 ae 06	  eor #$06ae
$19:ca85  4b			phk
$19:ca86  a1 06		 lda ($06,x)
$19:ca88  47 a7		 eor [$a7]
$19:ca8a  0c 45 ae	  tsb $ae45
$19:ca8d  06 49		 asl $49
$19:ca8f  a1 06		 lda ($06,x)
$19:ca91  47 a7		 eor [$a7]
$19:ca93  06 4c		 asl $4c
$19:ca95  ae 06 4a	  ldx $4a06
$19:ca98  a1 06		 lda ($06,x)
$19:ca9a  4c a7 06	  jmp $06a7
$19:ca9d  48			pha
$19:ca9e  ae 06 4c	  ldx $4c06
$19:caa1  a1 06		 lda ($06,x)
$19:caa3  4a			lsr a
$19:caa4  a7 06		 lda [$06]
$19:caa6  4c ae 06	  jmp $06ae
$19:caa9  48			pha
$19:caaa  a1 06		 lda ($06,x)
$19:caac  4c a7 06	  jmp $06a7
$19:caaf  4a			lsr a
$19:cab0  ae 06 4c	  ldx $4c06
$19:cab3  a1 06		 lda ($06,x)
$19:cab5  48			pha
$19:cab6  a7 0c		 lda [$0c]
$19:cab8  46 ae		 lsr $ae
$19:caba  06 4a		 asl $4a
$19:cabc  a1 06		 lda ($06,x)
$19:cabe  48			pha
$19:cabf  a7 06		 lda [$06]
$19:cac1  4d ae 06	  eor $06ae
$19:cac4  4b			phk
$19:cac5  a1 06		 lda ($06,x)
$19:cac7  4d a7 06	  eor $06a7
$19:caca  49 ae 06	  eor #$06ae
$19:cacd  4d a1 06	  eor $06a1
$19:cad0  4b			phk
$19:cad1  a7 06		 lda [$06]
$19:cad3  4d ae 06	  eor $06ae
$19:cad6  49 a1 06	  eor #$06a1
$19:cad9  4d a7 06	  eor $06a7
$19:cadc  4b			phk
$19:cadd  ae 06 4d	  ldx $4d06
$19:cae0  a1 18		 lda ($18,x)
$19:cae2  47 a7		 eor [$a7]
$19:cae4  06 c9		 asl $c9
$19:cae6  ea			nop
$19:cae7  00 00		 brk #$00
$19:cae9  e0 01 ea	  cpx #$ea01
$19:caec  f4 ed aa	  pea $aaed
$19:caef  e1 0a		 sbc ($0a,x)
$19:caf1  3c 5d a6	  bit $a65d,x
$19:caf4  a0 a6 a0	  ldy #$a0a6
$19:caf7  a6 a0		 ldx $a0
$19:caf9  a6 a0		 ldx $a0
$19:cafb  a6 a0		 ldx $a0
$19:cafd  a6 a0		 ldx $a0
$19:caff  a2 9e a4	  ldx #$a49e
$19:cb02  a7 a2		 lda [$a2]
$19:cb04  a2 a2 a2	  ldx #$a2a2
$19:cb07  a1 a7		 lda ($a7,x)
$19:cb09  a4 9e		 ldy $9e
$19:cb0b  9d a1 a4	  sta $a4a1,x
$19:cb0e  a1 e0		 lda ($e0,x)
$19:cb10  05 ea		 ora $ea
$19:cb12  00 ea		 brk #$ea
$19:cb14  0c 18 c9	  tsb $c918
$19:cb17  06 42		 asl $42
$19:cb19  a1 06		 lda ($06,x)
$19:cb1b  43 a7		 eor $a7,s
$19:cb1d  06 45		 asl $45
$19:cb1f  ae 06 43	  ldx $4306
$19:cb22  a1 06		 lda ($06,x)
$19:cb24  45 a7		 eor $a7
$19:cb26  06 42		 asl $42
$19:cb28  ae 06 45	  ldx $4506
$19:cb2b  a1 06		 lda ($06,x)
$19:cb2d  43 a7		 eor $a7,s
$19:cb2f  06 45		 asl $45
$19:cb31  ae 06 42	  ldx $4206
$19:cb34  a1 06		 lda ($06,x)
$19:cb36  45 a7		 eor $a7
$19:cb38  06 43		 asl $43
$19:cb3a  ae 06 45	  ldx $4506
$19:cb3d  a1 06		 lda ($06,x)
$19:cb3f  42 a7		 wdm #$a7
$19:cb41  0c 45 ae	  tsb $ae45
$19:cb44  06 43		 asl $43
$19:cb46  a1 06		 lda ($06,x)
$19:cb48  42 a7		 wdm #$a7
$19:cb4a  06 49		 asl $49
$19:cb4c  ae 06 47	  ldx $4706
$19:cb4f  a1 06		 lda ($06,x)
$19:cb51  49 a7 06	  eor #$06a7
$19:cb54  45 ae		 eor $ae
$19:cb56  06 49		 asl $49
$19:cb58  a1 06		 lda ($06,x)
$19:cb5a  47 a7		 eor [$a7]
$19:cb5c  06 49		 asl $49
$19:cb5e  ae 06 45	  ldx $4506
$19:cb61  a1 06		 lda ($06,x)
$19:cb63  49 a7 06	  eor #$06a7
$19:cb66  47 ae		 eor [$ae]
$19:cb68  06 49		 asl $49
$19:cb6a  a1 06		 lda ($06,x)
$19:cb6c  45 a7		 eor $a7
$19:cb6e  0c 49 ae	  tsb $ae49
$19:cb71  06 47		 asl $47
$19:cb73  a1 06		 lda ($06,x)
$19:cb75  45 a7		 eor $a7
$19:cb77  06 4d		 asl $4d
$19:cb79  ae 06 4b	  ldx $4b06
$19:cb7c  a1 06		 lda ($06,x)
$19:cb7e  4d a7 06	  eor $06a7
$19:cb81  49 ae 06	  eor #$06ae
$19:cb84  4d a1 06	  eor $06a1
$19:cb87  4b			phk
$19:cb88  a7 06		 lda [$06]
$19:cb8a  4d ae 06	  eor $06ae
$19:cb8d  49 a1 06	  eor #$06a1
$19:cb90  4d a7 06	  eor $06a7
$19:cb93  4b			phk
$19:cb94  ae 06 4d	  ldx $4d06
$19:cb97  a1 18		 lda ($18,x)
$19:cb99  49 a7 ea	  eor #$eaa7
$19:cb9c  00 06		 brk #$06
$19:cb9e  c9 00 e0	  cmp #$e000
$19:cba1  02 ea		 cop #$ea
$19:cba3  00 ed		 brk #$ed
$19:cba5  91 e1		 sta ($e1),y
$19:cba7  0a			asl a
$19:cba8  e1 0c		 sbc ($0c,x)
$19:cbaa  0c 1d ab	  tsb $ab1d
$19:cbad  06 a1		 asl $a1
$19:cbaf  0c a8 a9	  tsb $a9a8
$19:cbb2  ab			plb
$19:cbb3  06 a3		 asl $a3
$19:cbb5  e1 08		 sbc ($08,x)
$19:cbb7  0c a8 a9	  tsb $a9a8
$19:cbba  ab			plb
$19:cbbb  06 a1		 asl $a1
$19:cbbd  0c a8 06	  tsb $06a8
$19:cbc0  a9 e1 0c	  lda #$0ce1
$19:cbc3  c9 0c ab	  cmp #$ab0c
$19:cbc6  06 a3		 asl $a3
$19:cbc8  0c a8 a9	  tsb $a9a8
$19:cbcb  ab			plb
$19:cbcc  e1 08		 sbc ($08,x)
$19:cbce  06 a1		 asl $a1
$19:cbd0  0c a8 06	  tsb $06a8
$19:cbd3  a9 c9 0c	  lda #$0cc9
$19:cbd6  ab			plb
$19:cbd7  06 a3		 asl $a3
$19:cbd9  0c a8 e1	  tsb $e1a8
$19:cbdc  0c a9 ab	  tsb $aba9
$19:cbdf  06 a1		 asl $a1
$19:cbe1  0c a8 a9	  tsb $a9a8
$19:cbe4  06 ab		 asl $ab
$19:cbe6  e1 08		 sbc ($08,x)
$19:cbe8  c9 a3 0c	  cmp #$0ca3
$19:cbeb  a8			tay
$19:cbec  a9 ab 06	  lda #$06ab
$19:cbef  a1 a8		 lda ($a8,x)
$19:cbf1  e1 0c		 sbc ($0c,x)
$19:cbf3  c9 0c a9	  cmp #$a90c
$19:cbf6  06 ab		 asl $ab
$19:cbf8  c9 a3 0c	  cmp #$0ca3
$19:cbfb  a8			tay
$19:cbfc  a9 e1 08	  lda #$08e1
$19:cbff  ab			plb
$19:cc00  06 a1		 asl $a1
$19:cc02  0c a8 a9	  tsb $a9a8
$19:cc05  ab			plb
$19:cc06  06 a3		 asl $a3
$19:cc08  e1 0c		 sbc ($0c,x)
$19:cc0a  0c a8 a9	  tsb $a9a8
$19:cc0d  ab			plb
$19:cc0e  06 a1		 asl $a1
$19:cc10  0c a8 06	  tsb $06a8
$19:cc13  a9 e1 08	  lda #$08e1
$19:cc16  c9 0c ab	  cmp #$ab0c
$19:cc19  06 a3		 asl $a3
$19:cc1b  0c a8 a9	  tsb $a9a8
$19:cc1e  ab			plb
$19:cc1f  e1 0c		 sbc ($0c,x)
$19:cc21  06 a1		 asl $a1
$19:cc23  0c a8 06	  tsb $06a8
$19:cc26  a9 c9 0c	  lda #$0cc9
$19:cc29  ab			plb
$19:cc2a  06 a3		 asl $a3
$19:cc2c  0c a8 e1	  tsb $e1a8
$19:cc2f  08			php
$19:cc30  a9 ab 06	  lda #$06ab
$19:cc33  a1 0c		 lda ($0c,x)
$19:cc35  a8			tay
$19:cc36  a9 06 ab	  lda #$ab06
$19:cc39  e1 0c		 sbc ($0c,x)
$19:cc3b  c9 a3 0c	  cmp #$0ca3
$19:cc3e  a8			tay
$19:cc3f  a9 ab 06	  lda #$06ab
$19:cc42  a1 a8		 lda ($a8,x)
$19:cc44  e1 08		 sbc ($08,x)
$19:cc46  c9 0c a9	  cmp #$a90c
$19:cc49  06 ab		 asl $ab
$19:cc4b  c9 a3 0c	  cmp #$0ca3
$19:cc4e  a8			tay
$19:cc4f  a9 e1 08	  lda #$08e1
$19:cc52  ab			plb
$19:cc53  06 a1		 asl $a1
$19:cc55  0c a8 a9	  tsb $a9a8
$19:cc58  ab			plb
$19:cc59  06 a3		 asl $a3
$19:cc5b  e1 0c		 sbc ($0c,x)
$19:cc5d  0c a8 a9	  tsb $a9a8
$19:cc60  ab			plb
$19:cc61  06 a1		 asl $a1
$19:cc63  0c a8 06	  tsb $06a8
$19:cc66  a9 e1 08	  lda #$08e1
$19:cc69  c9 0c ab	  cmp #$ab0c
$19:cc6c  06 a3		 asl $a3
$19:cc6e  0c a8 a9	  tsb $a9a8
$19:cc71  ab			plb
$19:cc72  e1 0c		 sbc ($0c,x)
$19:cc74  06 a1		 asl $a1
$19:cc76  0c a8 06	  tsb $06a8
$19:cc79  a9 c9 0c	  lda #$0cc9
$19:cc7c  ab			plb
$19:cc7d  06 a3		 asl $a3
$19:cc7f  0c a8 e1	  tsb $e1a8
$19:cc82  08			php
$19:cc83  a9 ab 06	  lda #$06ab
$19:cc86  a1 0c		 lda ($0c,x)
$19:cc88  a8			tay
$19:cc89  a9 06 ab	  lda #$ab06
$19:cc8c  e1 0c		 sbc ($0c,x)
$19:cc8e  c9 a3 0c	  cmp #$0ca3
$19:cc91  a8			tay
$19:cc92  a9 ab 06	  lda #$06ab
$19:cc95  a1 a8		 lda ($a8,x)
$19:cc97  e1 08		 sbc ($08,x)
$19:cc99  c9 0c a9	  cmp #$a90c
$19:cc9c  06 ab		 asl $ab
$19:cc9e  c9 a3 0c	  cmp #$0ca3
$19:cca1  a8			tay
$19:cca2  a9 e1 08	  lda #$08e1
$19:cca5  ab			plb
$19:cca6  06 a1		 asl $a1
$19:cca8  0c a8 a9	  tsb $a9a8
$19:ccab  ab			plb
$19:ccac  06 a3		 asl $a3
$19:ccae  e1 0c		 sbc ($0c,x)
$19:ccb0  0c a8 a9	  tsb $a9a8
$19:ccb3  ab			plb
$19:ccb4  06 a1		 asl $a1
$19:ccb6  0c a8 06	  tsb $06a8
$19:ccb9  a9 e1 08	  lda #$08e1
$19:ccbc  c9 0c ab	  cmp #$ab0c
$19:ccbf  06 a3		 asl $a3
$19:ccc1  0c a8 a9	  tsb $a9a8
$19:ccc4  ab			plb
$19:ccc5  e1 0c		 sbc ($0c,x)
$19:ccc7  06 a1		 asl $a1
$19:ccc9  0c a8 06	  tsb $06a8
$19:cccc  a9 c9 0c	  lda #$0cc9
$19:cccf  ab			plb
$19:ccd0  06 a3		 asl $a3
$19:ccd2  0c a8 e1	  tsb $e1a8
$19:ccd5  08			php
$19:ccd6  a9 ab 06	  lda #$06ab
$19:ccd9  a1 0c		 lda ($0c,x)
$19:ccdb  a8			tay
$19:ccdc  a9 06 ab	  lda #$ab06
$19:ccdf  e1 0c		 sbc ($0c,x)
$19:cce1  c9 a3 0c	  cmp #$0ca3
$19:cce4  a8			tay
$19:cce5  a9 ab 06	  lda #$06ab
$19:cce8  a1 a8		 lda ($a8,x)
$19:ccea  e1 08		 sbc ($08,x)
$19:ccec  c9 0c a9	  cmp #$a90c
$19:ccef  06 ab		 asl $ab
$19:ccf1  c9 a3 0c	  cmp #$0ca3
$19:ccf4  a8			tay
$19:ccf5  a9 18 c9	  lda #$c918
$19:ccf8  0c c9 60	  tsb $60c9
$19:ccfb  c9 c9 c9	  cmp #$c9c9
$19:ccfe  00 ea		 brk #$ea
$19:cd00  00 e0		 brk #$e0
$19:cd02  03 ed		 ora $ed,s
$19:cd04  64 e1		 stz $e1
$19:cd06  06 f5		 asl $f5
$19:cd08  20 22 22	  jsr $2222
$19:cd0b  f7 03		 sbc [$03],y
$19:cd0d  aa			tax
$19:cd0e  00 e3		 brk #$e3
$19:cd10  24 46		 bit $46
$19:cd12  40			rti
$19:cd13  48			pha
$19:cd14  c9 3c c9	  cmp #$c93c
$19:cd17  c9 c9 3c	  cmp #$3cc9
$19:cd1a  5d b2 ac	  eor $acb2,x
$19:cd1d  ad a6 b2	  lda $b2a6
$19:cd20  ac ad a6	  ldy $a6ad
$19:cd23  ae ab a8	  ldx $a8ab
$19:cd26  a2 a5 a8	  ldx #$a8a5
$19:cd29  ab			plb
$19:cd2a  b1 b4		 lda ($b4),y
$19:cd2c  ae ab a5	  ldx $a5ab
$19:cd2f  a4 a8		 ldy $a8
$19:cd31  ab			plb
$19:cd32  30 ad		 bmi $cce1
$19:cd34  18			clc
$19:cd35  c9 0c c9	  cmp #$c90c
$19:cd38  60			rts
$19:cd39  c9 c9 c9	  cmp #$c9c9
$19:cd3c  00 ea		 brk #$ea
$19:cd3e  00 e0		 brk #$e0
$19:cd40  00 ed		 brk #$ed
$19:cd42  3c e1 11	  bit $11e1,x
$19:cd45  e3 18		 sbc $18,s
$19:cd47  1e 1e 12	  asl $121e,x
$19:cd4a  c9 0c 5d	  cmp #$5d0c
$19:cd4d  a6 0c		 ldx $0c
$19:cd4f  5b			tcd
$19:cd50  ad b2 0c	  lda $0cb2
$19:cd53  59 ad c9	  eor $c9ad,y
$19:cd56  0c 5d a6	  tsb $a65d
$19:cd59  0c 5b ac	  tsb $ac5b
$19:cd5c  b2 0c		 lda ($0c)
$19:cd5e  59 ac c9	  eor $c9ac,y
$19:cd61  0c 5d a6	  tsb $a65d
$19:cd64  0c 5b ad	  tsb $ad5b
$19:cd67  b2 0c		 lda ($0c)
$19:cd69  59 ad c9	  eor $c9ad,y
$19:cd6c  0c 5d a6	  tsb $a65d
$19:cd6f  0c 5b ac	  tsb $ac5b
$19:cd72  b2 0c		 lda ($0c)
$19:cd74  59 ac c9	  eor $c9ac,y
$19:cd77  0c 5d a6	  tsb $a65d
$19:cd7a  0c 5b ad	  tsb $ad5b
$19:cd7d  b2 0c		 lda ($0c)
$19:cd7f  59 ad c9	  eor $c9ad,y
$19:cd82  0c 5d a6	  tsb $a65d
$19:cd85  0c 5b ac	  tsb $ac5b
$19:cd88  b2 0c		 lda ($0c)
$19:cd8a  59 ac c9	  eor $c9ac,y
$19:cd8d  0c 5d a6	  tsb $a65d
$19:cd90  0c 5b ad	  tsb $ad5b
$19:cd93  b2 0c		 lda ($0c)
$19:cd95  59 ad c9	  eor $c9ad,y
$19:cd98  0c 5d a6	  tsb $a65d
$19:cd9b  0c 5b ac	  tsb $ac5b
$19:cd9e  b2 0c		 lda ($0c)
$19:cda0  59 ac c9	  eor $c9ac,y
$19:cda3  0c 5d a6	  tsb $a65d
$19:cda6  0c 5b ad	  tsb $ad5b
$19:cda9  b2 0c		 lda ($0c)
$19:cdab  59 ad c9	  eor $c9ad,y
$19:cdae  0c 5d a6	  tsb $a65d
$19:cdb1  0c 5b ac	  tsb $ac5b
$19:cdb4  b2 0c		 lda ($0c)
$19:cdb6  59 ac c9	  eor $c9ac,y
$19:cdb9  0c 5d a6	  tsb $a65d
$19:cdbc  0c 5b ad	  tsb $ad5b
$19:cdbf  b2 0c		 lda ($0c)
$19:cdc1  59 ad c9	  eor $c9ad,y
$19:cdc4  0c 5d a6	  tsb $a65d
$19:cdc7  0c 5b ac	  tsb $ac5b
$19:cdca  b2 0c		 lda ($0c)
$19:cdcc  59 ac c9	  eor $c9ac,y
$19:cdcf  0c 5d a6	  tsb $a65d
$19:cdd2  0c 5b ac	  tsb $ac5b
$19:cdd5  b2 0c		 lda ($0c)
$19:cdd7  59 ac c9	  eor $c9ac,y
$19:cdda  0c 5d a6	  tsb $a65d
$19:cddd  0c 5b ab	  tsb $ab5b
$19:cde0  b2 0c		 lda ($0c)
$19:cde2  59 ab c9	  eor $c9ab,y
$19:cde5  0c 5d ab	  tsb $ab5d
$19:cde8  0c 5b b0	  tsb $b05b
$19:cdeb  b7 0c		 lda [$0c],y
$19:cded  59 b0 c9	  eor $c9b0,y
$19:cdf0  0c 5d ab	  tsb $ab5d
$19:cdf3  0c 5b b3	  tsb $b35b
$19:cdf6  b7 0c		 lda [$0c],y
$19:cdf8  59 b3 c9	  eor $c9b3,y
$19:cdfb  0c 5d a5	  tsb $a55d
$19:cdfe  0c 5b ab	  tsb $ab5b
$19:ce01  b1 0c		 lda ($0c),y
$19:ce03  59 ab c9	  eor $c9ab,y
$19:ce06  0c 5d a5	  tsb $a55d
$19:ce09  0c 5b ab	  tsb $ab5b
$19:ce0c  b1 0c		 lda ($0c),y
$19:ce0e  59 ab c9	  eor $c9ab,y
$19:ce11  0c 5d a5	  tsb $a55d
$19:ce14  0c 5b ab	  tsb $ab5b
$19:ce17  b1 0c		 lda ($0c),y
$19:ce19  59 ab c9	  eor $c9ab,y
$19:ce1c  0c 5d a5	  tsb $a55d
$19:ce1f  0c 5b ab	  tsb $ab5b
$19:ce22  b1 0c		 lda ($0c),y
$19:ce24  59 ab c9	  eor $c9ab,y
$19:ce27  0c 5d a8	  tsb $a85d
$19:ce2a  0c 5b ad	  tsb $ad5b
$19:ce2d  b4 0c		 ldy $0c,x
$19:ce2f  59 ad c9	  eor $c9ad,y
$19:ce32  0c 5d a7	  tsb $a75d
$19:ce35  0c 5b ae	  tsb $ae5b
$19:ce38  b3 0c		 lda ($0c,s),y
$19:ce3a  59 ae c9	  eor $c9ae,y
$19:ce3d  0c 5d a8	  tsb $a85d
$19:ce40  0c 5b b0	  tsb $b05b
$19:ce43  b4 0c		 ldy $0c,x
$19:ce45  59 b0 c9	  eor $c9b0,y
$19:ce48  0c 5d a2	  tsb $a25d
$19:ce4b  0c 5b aa	  tsb $aa5b
$19:ce4e  ae 0c 59	  ldx $590c
$19:ce51  aa			tax
$19:ce52  c9 0c 5d	  cmp #$5d0c
$19:ce55  a1 0c		 lda ($0c,x)
$19:ce57  5b			tcd
$19:ce58  a9 ad 0c	  lda #$0cad
$19:ce5b  59 a9 c9	  eor $c9a9,y
$19:ce5e  0c 5d a1	  tsb $a15d
$19:ce61  0c 5b a8	  tsb $a85b
$19:ce64  ad 0c 59	  lda $590c
$19:ce67  a8			tay
$19:ce68  c9 0c 5d	  cmp #$5d0c
$19:ce6b  a8			tay
$19:ce6c  0c 5b b0	  tsb $b05b
$19:ce6f  b4 0c		 ldy $0c,x
$19:ce71  59 b0 c9	  eor $c9b0,y
$19:ce74  0c 5d a5	  tsb $a55d
$19:ce77  0c 5b a8	  tsb $a85b
$19:ce7a  b1 0c		 lda ($0c),y
$19:ce7c  59 a8 ed	  eor $eda8,y
$19:ce7f  50 ea		 bvc $ce6b
$19:ce81  00 1e		 brk #$1e
$19:ce83  c9 06 47	  cmp #$4706
$19:ce86  a1 06		 lda ($06,x)
$19:ce88  49 a7 06	  eor #$06a7
$19:ce8b  4b			phk
$19:ce8c  ae 06 49	  ldx $4906
$19:ce8f  a1 06		 lda ($06,x)
$19:ce91  4b			phk
$19:ce92  a7 06		 lda [$06]
$19:ce94  47 ae		 eor [$ae]
$19:ce96  06 4b		 asl $4b
$19:ce98  a1 06		 lda ($06,x)
$19:ce9a  49 a7 06	  eor #$06a7
$19:ce9d  4b			phk
$19:ce9e  ae 06 47	  ldx $4706
$19:cea1  a1 06		 lda ($06,x)
$19:cea3  4b			phk
$19:cea4  a7 06		 lda [$06]
$19:cea6  49 ae 06	  eor #$06ae
$19:cea9  4b			phk
$19:ceaa  a1 06		 lda ($06,x)
$19:ceac  47 a7		 eor [$a7]
$19:ceae  0c 45 ae	  tsb $ae45
$19:ceb1  06 49		 asl $49
$19:ceb3  a1 06		 lda ($06,x)
$19:ceb5  47 a7		 eor [$a7]
$19:ceb7  06 4c		 asl $4c
$19:ceb9  ae 06 4a	  ldx $4a06
$19:cebc  a1 06		 lda ($06,x)
$19:cebe  4c a7 06	  jmp $06a7
$19:cec1  48			pha
$19:cec2  ae 06 4c	  ldx $4c06
$19:cec5  a1 06		 lda ($06,x)
$19:cec7  4a			lsr a
$19:cec8  a7 06		 lda [$06]
$19:ceca  4c ae 06	  jmp $06ae
$19:cecd  48			pha
$19:cece  a1 06		 lda ($06,x)
$19:ced0  4c a7 06	  jmp $06a7
$19:ced3  4a			lsr a
$19:ced4  ae 06 4c	  ldx $4c06
$19:ced7  a1 06		 lda ($06,x)
$19:ced9  48			pha
$19:ceda  a7 0c		 lda [$0c]
$19:cedc  46 ae		 lsr $ae
$19:cede  06 4a		 asl $4a
$19:cee0  a1 06		 lda ($06,x)
$19:cee2  48			pha
$19:cee3  a7 06		 lda [$06]
$19:cee5  4d ae 06	  eor $06ae
$19:cee8  4b			phk
$19:cee9  a1 06		 lda ($06,x)
$19:ceeb  4d a7 06	  eor $06a7
$19:ceee  49 ae 06	  eor #$06ae
$19:cef1  4d a1 06	  eor $06a1
$19:cef4  4b			phk
$19:cef5  a7 06		 lda [$06]
$19:cef7  4d ae 06	  eor $06ae
$19:cefa  49 a1 06	  eor #$06a1
$19:cefd  4d a7 06	  eor $06a7
$19:cf00  4b			phk
$19:cf01  ae 06 4d	  ldx $4d06
$19:cf04  a1 12		 lda ($12,x)
$19:cf06  48			pha
$19:cf07  a7 ed		 lda [$ed]
$19:cf09  3c ea 00	  bit $00ea,x
$19:cf0c  00 ea		 brk #$ea
$19:cf0e  00 e0		 brk #$e0
$19:cf10  01 ed		 ora ($ed,x)
$19:cf12  64 e1		 stz $e1
$19:cf14  06 45		 asl $45
$19:cf16  c9 3c c9	  cmp #$c93c
$19:cf19  c9 c9 18	  cmp #$18c9
$19:cf1c  c9 06 3d	  cmp #$3d06
$19:cf1f  ad ae af	  lda $afae
$19:cf22  b0 0c		 bcs $cf30
$19:cf24  b1 18		 lda ($18),y
$19:cf26  c9 06 ac	  cmp #$ac06
$19:cf29  ad ae af	  lda $afae
$19:cf2c  0c b0 18	  tsb $18b0
$19:cf2f  c9 06 ab	  cmp #$ab06
$19:cf32  ac ad ae	  ldy $aead
$19:cf35  0c af 18	  tsb $18af
$19:cf38  c9 06 a9	  cmp #$a906
$19:cf3b  aa			tax
$19:cf3c  ab			plb
$19:cf3d  ac 0c ad	  ldy $ad0c
$19:cf40  18			clc
$19:cf41  c9 06 ad	  cmp #$ad06
$19:cf44  ae af b0	  ldx $b0af
$19:cf47  0c b1 18	  tsb $18b1
$19:cf4a  c9 06 af	  cmp #$af06
$19:cf4d  b0 b1		 bcs $cf00
$19:cf4f  b2 0c		 lda ($0c)
$19:cf51  b3 18		 lda ($18,s),y
$19:cf53  c9 06 ad	  cmp #$ad06
$19:cf56  ae af b0	  ldx $b0af
$19:cf59  0c b1 18	  tsb $18b1
$19:cf5c  c9 06 ab	  cmp #$ab06
$19:cf5f  ac ad ae	  ldy $aead
$19:cf62  0c af 18	  tsb $18af
$19:cf65  c9 06 ad	  cmp #$ad06
$19:cf68  ae af b0	  ldx $b0af
$19:cf6b  0c b1 18	  tsb $18b1
$19:cf6e  c9 06 ab	  cmp #$ab06
$19:cf71  ac ad ae	  ldy $aead
$19:cf74  0c af 18	  tsb $18af
$19:cf77  c9 06 aa	  cmp #$aa06
$19:cf7a  ab			plb
$19:cf7b  ac ad 0c	  ldy $0cad
$19:cf7e  ae 18 c9	  ldx $c918
$19:cf81  06 ab		 asl $ab
$19:cf83  ac ad ae	  ldy $aead
$19:cf86  0c af 18	  tsb $18af
$19:cf89  c9 06 b0	  cmp #$b006
$19:cf8c  b1 b2		 lda ($b2),y
$19:cf8e  b3 0c		 lda ($0c,s),y
$19:cf90  b4 18		 ldy $18,x
$19:cf92  c9 06 af	  cmp #$af06
$19:cf95  b0 b1		 bcs $cf48
$19:cf97  b2 0c		 lda ($0c)
$19:cf99  b3 18		 lda ($18,s),y
$19:cf9b  c9 06 ad	  cmp #$ad06
$19:cf9e  ae af b0	  ldx $b0af
$19:cfa1  0c b1 18	  tsb $18b1
$19:cfa4  c9 06 ac	  cmp #$ac06
$19:cfa7  ad ae af	  lda $afae
$19:cfaa  0c b0 18	  tsb $18b0
$19:cfad  c9 06 ab	  cmp #$ab06
$19:cfb0  ac ad ae	  ldy $aead
$19:cfb3  0c af 18	  tsb $18af
$19:cfb6  c9 06 a9	  cmp #$a906
$19:cfb9  aa			tax
$19:cfba  ab			plb
$19:cfbb  ac 0c ad	  ldy $ad0c
$19:cfbe  18			clc
$19:cfbf  c9 06 ab	  cmp #$ab06
$19:cfc2  ac ad ae	  ldy $aead
$19:cfc5  0c af 18	  tsb $18af
$19:cfc8  c9 06 ad	  cmp #$ad06
$19:cfcb  ae af b0	  ldx $b0af
$19:cfce  0c b1 18	  tsb $18b1
$19:cfd1  c9 06 ad	  cmp #$ad06
$19:cfd4  ae af b0	  ldx $b0af
$19:cfd7  0c b1 18	  tsb $18b1
$19:cfda  c9 06 af	  cmp #$af06
$19:cfdd  b0 b1		 bcs $cf90
$19:cfdf  b2 0c		 lda ($0c)
$19:cfe1  b3 18		 lda ($18,s),y
$19:cfe3  c9 06 ae	  cmp #$ae06
$19:cfe6  af b0 b1 0c   lda $0cb1b0
$19:cfea  b2 18		 lda ($18)
$19:cfec  c9 06 ac	  cmp #$ac06
$19:cfef  ad ae af	  lda $afae
$19:cff2  03 b0		 ora $b0,s
$19:cff4  18			clc
$19:cff5  c9 0c c9	  cmp #$c90c
$19:cff8  60			rts
$19:cff9  c9 c9 c9	  cmp #$c9c9
$19:cffc  00 00		 brk #$00
$19:cffe  18			clc
$19:cfff  00 34		 brk #$34
$19:d001  2c 53 73	  bit $7353
$19:d004  89 73 a4	  bit #$a473
$19:d007  73 08		 adc ($08,s),y
$19:d009  76 51		 ror $51,x
$19:d00b  78			sei
$19:d00c  51 78		 eor ($78),y
$19:d00e  d6 7d		 dec $7d,x
$19:d010  51 81		 eor ($81),y
$19:d012  6c 81 6c	  jmp ($6c81)
$19:d015  81 a4		 sta ($a4,x)
$19:d017  8e bf 8e	  stx $8ebf
$19:d01a  02 00		 cop #$00
$19:d01c  fd 0f b8	  sbc $b80f,x
$19:d01f  a4 00		 ldy $00
$19:d021  00 06		 brk #$06
$19:d023  14 1e		 trb $1e
$19:d025  08			php
$19:d026  1b			tcs
$19:d027  16 1f		 asl $1f,x
$19:d029  03 0c		 ora $0c,s
$19:d02b  00 24		 brk #$24
$19:d02d  96 bb		 stx $bb,y
$19:d02f  d6 11		 dec $11,x
$19:d031  04 86		 tsb $86
$19:d033  bb			tyx
$19:d034  d9 e5 e0	  cmp $e0e5,y
$19:d037  3f 0a 7e 57   and $577e0a,x
$19:d03b  24 17		 bit $17
$19:d03d  1c 95 b0	  trb $b095
$19:d040  76 23		 ror $23,x
$19:d042  04 ba		 tsb $ba
$19:d044  58			cli
$19:d045  c2 e3		 rep #$e3
$19:d047  62 25 06	  per $d66f
$19:d04a  33 c4		 and ($c4,s),y
$19:d04c  40			rti
$19:d04d  59 50 5c	  eor $5c50,y
$19:d050  6c 18 ec	  jmp ($ec18)
$19:d053  7e 2e 2a	  ror $2a2e,x
$19:d056  1f 2c 94 56   ora $56942c,x
$19:d05a  2b			pld
$19:d05b  0b			phd
$19:d05c  89 86 03	  bit #$0386
$19:d05f  d1 8a		 cmp ($8a),y
$19:d061  c5 f8		 cmp $f8
$19:d063  2c 61 f2	  bit $f261
$19:d066  b9 58 ec	  lda $ec58,y
$19:d069  70 18		 bvs $d083
$19:d06b  dc 72 3b	  jml [$3b72]
$19:d06e  63 32		 adc $32,s
$19:d070  01 b5		 ora ($b5,x)
$19:d072  71 38		 adc ($38),y
$19:d074  c3 d0		 cmp $d0,s
$19:d076  1b			tcs
$19:d077  40			rti
$19:d078  c8			iny
$19:d079  07 b1		 ora [$b1]
$19:d07b  0f 95 cc d6   ora $d6cc95
$19:d07f  08			php
$19:d080  a2 45 3e	  ldx #$3e45
$19:d083  62 dc 96	  per $6762
$19:d086  73 71		 adc ($71,s),y
$19:d088  0d 41 2c	  ora $2c41
$19:d08b  c8			iny
$19:d08c  a1 21		 lda ($21,x)
$19:d08e  19 90 37	  ora $3790,y
$19:d091  fb			xce
$19:d092  d6 38		 dec $38,x
$19:d094  6f d7 68 b3   adc $b368d7
$19:d098  2e 13 1c	  rol $1c13
$19:d09b  58			cli
$19:d09c  e3 c3		 sbc $c3,s
$19:d09e  df ef c3 e1   cmp $e1c3ef,x
$19:d0a2  6e d8 6b	  ror $6bd8
$19:d0a5  a2 bc 0d	  ldx #$0dbc
$19:d0a8  f6 f1		 inc $f1,x
$19:d0aa  ac 9b d0	  ldy $d09b
$19:d0ad  f9 c0 a0	  sbc $a0c0,y
$19:d0b0  70 48		 bvs $d0fa
$19:d0b2  2c 18 35	  bit $3518
$19:d0b5  2f 4f 02 f8   and $f8024f
$19:d0b9  59 ed 82	  eor $82ed,y
$19:d0bc  f2 ec		 sbc ($ec)
$19:d0be  f6 bb		 inc $bb,x
$19:d0c0  7d ce e8	  adc $e8ce,x
$19:d0c3  bc 72 79	  ldy $7972,x
$19:d0c6  49 6f ef	  eor #$ef6f
$19:d0c9  13 62		 ora ($62,s),y
$19:d0cb  20 80 50	  jsr $5080
$19:d0ce  ce 80 64	  dec $6480
$19:d0d1  01 78		 ora ($78,x)
$19:d0d3  78			sei
$19:d0d4  31 16		 and ($16),y
$19:d0d6  1c 7d 80	  trb $807d
$19:d0d9  28			plp
$19:d0da  50 e3		 bvc $d0bf
$19:d0dc  a0 58 c8	  ldy #$c858
$19:d0df  03 63		 ora $63,s
$19:d0e1  c5 58		 cmp $58
$19:d0e3  31 70		 and ($70),y
$19:d0e5  98			tya
$19:d0e6  50 54		 bvc $d13c
$19:d0e8  62 d2 75	  per $46bd
$19:d0eb  68			pla
$19:d0ec  14 02		 trb $02
$19:d0ee  c2 ac		 rep #$ac
$19:d0f0  18			clc
$19:d0f1  84 46		 sty $46
$19:d0f3  24 15		 bit $15
$19:d0f5  18			clc
$19:d0f6  f4 3e c7	  pea $c73e
$19:d0f9  e0 30 05	  cpx #$0530
$19:d0fc  81 86		 sta ($86,x)
$19:d0fe  31 88		 and ($88),y
$19:d100  cc 68 ea	  cpy $ea68
$19:d103  7e 93 d0	  ror $d093,x
$19:d106  16 80		 asl $80,x
$19:d108  b6 32		 ldx $32,y
$19:d10a  09 0c 8a	  ora #$8a0c
$19:d10d  07 f1		 ora [$f1]
$19:d10f  3b			tsc
$19:d110  8c 5d 86	  sty $865d
$19:d113  07 00		 ora [$00]
$19:d115  3d 8a 48	  and $488a,x
$19:d118  24 10		 bit $10
$19:d11a  3f 84 16 3e   and $3e1684,x
$19:d11e  9a			txs
$19:d11f  12 58		 ora ($58)
$19:d121  78			sei
$19:d122  11 83		 ora ($83),y
$19:d124  23 92		 and $92,s
$19:d126  49 66 31	  eor #$3166
$19:d129  49 92 a8	  eor #$a892
$19:d12c  97 26		 sta [$26],y
$19:d12e  8c 25 cb	  sty $cb25
$19:d131  12 c3		 ora ($c3)
$19:d133  86 bf		 stx $bf
$19:d135  25 ca		 and $ca
$19:d137  ef dd a0 db   sbc $dba0dd
$19:d13b  0e 1b 4a	  asl $4a1b
$19:d13e  9b			txy
$19:d13f  81 2d		 sta ($2d,x)
$19:d141  84 41		 sty $41
$19:d143  21 a1		 and ($a1,x)
$19:d145  99 0e 03	  sta $030e,y
$19:d148  c3 c0		 cmp $c0,s
$19:d14a  3e 12 f0	  rol $f012,x
$19:d14d  c8			iny
$19:d14e  e5 72		 sbc $72
$19:d150  44 d0 c9	  mvp $c9,$d0
$19:d153  e5 03		 sbc $03
$19:d155  23 93		 and $93,s
$19:d157  10 0e		 bpl $d167
$19:d159  4b			phk
$19:d15a  27 92		 and [$92]
$19:d15c  f5 62		 sbc $62,x
$19:d15e  71 88		 adc ($88),y
$19:d160  00 c9		 brk #$c9
$19:d162  86 46		 stx $46
$19:d164  c4 20		 cpy $20
$19:d166  14 80		 trb $80
$19:d168  15 03		 ora $03,x
$19:d16a  2d 97 c6	  and $c697
$19:d16d  58			cli
$19:d16e  ed a3 b1	  sbc $b1a3
$19:d171  c7 90		 cmp [$90]
$19:d173  07 11		 ora [$11]
$19:d175  61 32		 adc ($32,x)
$19:d177  16 35		 asl $35,x
$19:d179  1c 04 b1	  trb $b104
$19:d17c  c5 90		 cmp $90
$19:d17e  05 40		 ora $40
$19:d180  07 42		 ora [$42]
$19:d182  c5 b1		 cmp $b1
$19:d184  42 da		 wdm #$da
$19:d186  19 08 5c	  ora $5c08,y
$19:d189  4c 42 1e	  jmp $1e42
$19:d18c  8b			phb
$19:d18d  19 1c 1a	  ora $1a1c,y
$19:d190  46 7c		 lsr $7c
$19:d192  18			clc
$19:d193  0c 6e 39	  tsb $396e
$19:d196  1d b1 f8	  ora $f8b1,x
$19:d199  31 58		 and ($58),y
$19:d19b  b2 38		 lda ($38)
$19:d19d  31 04		 and ($04),y
$19:d19f  f8			sed
$19:d1a0  2c 45 4a	  bit $4a45
$19:d1a3  0a			asl a
$19:d1a4  25 18		 and $18
$19:d1a6  b0 a9		 bcs $d151
$19:d1a8  f5 90		 sbc $90,x
$19:d1aa  64 43		 stz $43
$19:d1ac  21 c3		 and ($c3,x)
$19:d1ae  8a			txa
$19:d1af  ba			tsx
$19:d1b0  83 7e		 sta $7e,s
$19:d1b2  cf 05 ba 66   cmp $66ba05
$19:d1b6  43 20		 eor $20,s
$19:d1b8  d2 0d		 cmp ($0d)
$19:d1ba  eb			xba
$19:d1bb  84 37		 sty $37
$19:d1bd  8b			phb
$19:d1be  25 25		 and $25
$19:d1c0  94 b6		 sty $b6,x
$19:d1c2  dd b1 d7	  cmp $d7b1,x
$19:d1c5  ac 83 84	  ldy $8483
$19:d1c8  e2 1d		 sep #$1d
$19:d1ca  f6 f1		 inc $f1,x
$19:d1cc  f2 2e		 sbc ($2e)
$19:d1ce  f1 59		 sbc ($59),y
$19:d1d0  17 03		 ora [$03],y
$19:d1d2  7d bd 6a	  adc $6abd,x
$19:d1d5  1f 09 fe ae   ora $aefe09,x
$19:d1d9  02 04		 cop #$04
$19:d1db  03 80		 ora $80,s
$19:d1dd  5f e8 f6 17   eor $17f6e8,x
$19:d1e1  09 38 45	  ora #$4538
$19:d1e4  fe 80 60	  inc $6080,x
$19:d1e7  15 8e		 ora $8e,x
$19:d1e9  f3 82		 sbc ($82,s),y
$19:d1eb  36 17		 rol $17,x
$19:d1ed  fa			plx
$19:d1ee  bd 41 f2	  lda $f241,x
$19:d1f1  0f 43 5e 86   ora $865e43
$19:d1f5  41 64		 eor ($64,x)
$19:d1f7  14 80		 trb $80
$19:d1f9  20 ac 89	  jsr $89ac
$19:d1fc  f6 11		 inc $11,x
$19:d1fe  55 e8		 eor $e8,x
$19:d200  66 32		 ror $32
$19:d202  16 73		 asl $73,x
$19:d204  19 2c 95	  ora $952c,y
$19:d207  dc 39 8b	  jml [$8b39]
$19:d20a  35 a6		 and $a6,x
$19:d20c  d7 6a		 cmp [$6a],y
$19:d20e  b3 14		 lda ($14,s),y
$19:d210  44 d6 a7	  mvp $a7,$d6
$19:d213  f4 30 81	  pea $8130
$19:d216  eb			xba
$19:d217  10 e5		 bpl $d1fe
$19:d219  e0 b1		 cpx #$b1
$19:d21b  d8			cld
$19:d21c  e5 b9		 sbc $b9
$19:d21e  5c 95 b1 44   jml $44b195
$19:d222  6e c0 cc	  ror $ccc0
$19:d225  10 41		 bpl $d268
$19:d227  38			sec
$19:d228  12 dc		 ora ($dc)
$19:d22a  90 50		 bcc $d27c
$19:d22c  83 60		 sta $60,s
$19:d22e  da			phx
$19:d22f  06 68		 asl $68
$19:d231  5b			tcd
$19:d232  93 81		 sta ($81,s),y
$19:d234  e0 20		 cpx #$20
$19:d236  17 35		 ora [$35],y
$19:d238  c2 1c		 rep #$1c
$19:d23a  e5 b9		 sbc $b9
$19:d23c  9b			txy
$19:d23d  08			php
$19:d23e  82 1b 0d	  brl $df5c
$19:d241  70 ac		 bvs $d1ef
$19:d243  78			sei
$19:d244  6c 88 d8	  jmp ($d888)
$19:d247  eb			xba
$19:d248  fa			plx
$19:d249  02 81		 cop #$81
$19:d24b  5c 25 20 72   jml $722025
$19:d24f  06 85		 asl $85
$19:d251  21 00		 and ($00,x)
$19:d253  f0 5f		 beq $d2b4
$19:d255  62 f1 72	  per $4549
$19:d258  d0 ad		 bne $d207
$19:d25a  03 7d		 ora $7d,s
$19:d25c  c3 00		 cmp $00,s
$19:d25e  49 30 56	  eor #$5630
$19:d261  62 00 87	  per $5964
$19:d264  28			plp
$19:d265  93 43		 sta ($43,s),y
$19:d267  82 12 a6	  brl $787c
$19:d26a  20 3f e5	  jsr $e53f
$19:d26d  f7 0b		 sbc [$0b],y
$19:d26f  c0 7a a3	  cpy #$a37a
$19:d272  e4 16		 cpx $16
$19:d274  c0 9b 12	  cpy #$129b
$19:d277  a2 ac 81	  ldx #$81ac
$19:d27a  c8			iny
$19:d27b  21 09		 and ($09,x)
$19:d27d  14 99		 trb $99
$19:d27f  4c cc 6c	  jmp $6ccc
$19:d282  fa			plx
$19:d283  07 f9		 ora [$f9]
$19:d285  15 07		 ora $07,x
$19:d287  c1 89		 cmp ($89,x)
$19:d289  c6 1b		 dec $1b
$19:d28b  d5 2c		 cmp $2c,x
$19:d28d  09 32 b1	  ora #$b132
$19:d290  65 b1		 adc $b1
$19:d292  a8			tay
$19:d293  55 c5		 eor $c5,x
$19:d295  62 ca 43	  per $1662
$19:d298  8a			txa
$19:d299  b0 58		 bcs $d2f3
$19:d29b  16 02		 asl $02,x
$19:d29d  6f 57 60 14   adc $146057
$19:d2a1  49 5e 0c	  eor #$0c5e
$19:d2a4  13 7a		 ora ($7a,s),y
$19:d2a6  8d 9d a2	  sta $a29d
$19:d2a9  0c d4 66	  tsb $66d4
$19:d2ac  25 96		 and $96
$19:d2ae  cc e1 0c	  cpy $0ce1
$19:d2b1  83 44		 sta $44,s
$19:d2b3  2c b6 9b	  bit $9bb6
$19:d2b6  53 90		 eor ($90,s),y
$19:d2b8  55 a0		 eor $a0,x
$19:d2ba  7c 11 70	  jmp ($7011,x)
$19:d2bd  03 da		 ora $da,s
$19:d2bf  db			stp
$19:d2c0  2d 96 a3	  and $a396
$19:d2c3  00 7a		 brk #$7a
$19:d2c5  23 f6		 and $f6,s
$19:d2c7  7e 0c 54	  ror $540c,x
$19:d2ca  74 2f		 stz $2f,x
$19:d2cc  46 7d		 lsr $7d
$19:d2ce  90 ec		 bcc $d2bc
$19:d2d0  9e 6f 91	  stz $916f,x
$19:d2d3  0e a6 f3	  asl $f3a6
$19:d2d6  82 87 2d	  brl $0060
$19:d2d9  86 ba		 stx $ba
$19:d2db  db			stp
$19:d2dc  99 7e 80	  sta $807e,y
$19:d2df  00 40		 brk #$40
$19:d2e1  40			rti
$19:d2e2  87 3d		 sta [$3d]
$19:d2e4  8e bd f8	  stx $f8bd
$19:d2e7  32 de		 and ($de)
$19:d2e9  00 c5		 brk #$c5
$19:d2eb  9f 25 94 0e   sta $0e9425,x
$19:d2ef  8f 3b 9b c3   sta $c39b3b
$19:d2f3  df 89 16 71   cmp $711689,x
$19:d2f7  93 2e		 sta ($2e,s),y
$19:d2f9  06 f7		 asl $f7
$19:d2fb  7f d0 78 8a   adc $8a78d0,x
$19:d2ff  e1 8d		 sbc ($8d,x)
$19:d301  81 bc		 sta ($bc,x)
$19:d303  7f 83 fc 39   adc $39fc83,x
$19:d307  cb			wai
$19:d308  84 f3		 sty $f3
$19:d30a  78			sei
$19:d30b  d1 80		 cmp ($80),y
$19:d30d  b8			clv
$19:d30e  77 c9		 adc [$c9],y
$19:d310  7b			tdc
$19:d311  53 80		 eor ($80,s),y
$19:d313  8f bf 5a b0   sta $b05abf
$19:d317  12 4e		 ora ($4e)
$19:d319  44 37 00	  mvp $00,$37
$19:d31c  2b			pld
$19:d31d  ec 76 2a	  cpx $2a76
$19:d320  f9 1c 88	  sbc $881c,y
$19:d323  34 55		 bit $55,x
$19:d325  f0 49		 beq $d370
$19:d327  4b			phk
$19:d328  75 20		 adc $20,x
$19:d32a  20 3c e4	  jsr $e43c
$19:d32d  18			clc
$19:d32e  07 07		 ora [$07]
$19:d330  21 67		 and ($67,x)
$19:d332  b3 d9		 lda ($d9,s),y
$19:d334  5f 41 15 1f   eor $1f1541,x
$19:d338  89 88 03	  bit #$0388
$19:d33b  65 98		 adc $98
$19:d33d  b3 59		 lda ($59,s),y
$19:d33f  87 81		 sta [$81]
$19:d341  98			tya
$19:d342  b7 3c		 lda [$3c],y
$19:d344  84 7e		 sty $7e
$19:d346  20 81 0c	  jsr $0c81
$19:d349  a6 43		 ldx $43
$19:d34b  81 be		 sta ($be,x)
$19:d34d  df 00 41 ee   cmp $ee4100,x
$19:d351  39 2b 65	  and $652b,y
$19:d354  b0 d8		 bcs $d32e
$19:d356  20 a0 7d	  jsr $7da0
$19:d359  88			dey
$19:d35a  cc 72 2e	  cpy $2e72
$19:d35d  f0 3d		 beq $d39c
$19:d35f  10 78		 bpl $d3d9
$19:d361  41 62		 eor ($62,x)
$19:d363  43 16		 eor $16,s
$19:d365  68			pla
$19:d366  00 03		 brk #$03
$19:d368  56 99		 lsr $99,x
$19:d36a  01 78		 ora ($78,x)
$19:d36c  13 dc		 ora ($dc,s),y
$19:d36e  62 1a df	  per $b28b
$19:d371  05 8c		 ora $8c
$19:d373  9e 39 51	  stz $5139,x
$19:d376  50 99		 bvc $d311
$19:d378  04 fa		 tsb $fa
$19:d37a  19 8b 9d	  ora $9d8b,y
$19:d37d  8f 12 4f 1c   sta $1c4f12
$19:d381  90 04		 bcc $d387
$19:d383  37 e1		 and [$e1],y
$19:d385  30 03		 bmi $d38a
$19:d387  01 a4		 ora ($a4,x)
$19:d389  b1 44		 lda ($44),y
$19:d38b  f1 b7		 sbc ($b7),y
$19:d38d  6f 38 1b cd   adc $cd1b38
$19:d391  f0 98		 beq $d32b
$19:d393  37 fc		 and [$fc],y
$19:d395  33 48		 and ($48,s),y
$19:d397  e4 0c		 cpx $0c
$19:d399  02 3a		 cop #$3a
$19:d39b  25 d8		 and $d8
$19:d39d  05 03		 ora $03
$19:d39f  82 3d 1c	  brl $efdf
$19:d3a2  c1 c0		 cmp ($c0,x)
$19:d3a4  78			sei
$19:d3a5  5c 36 c1 00   jml $00c136
$19:d3a9  81 46		 sta ($46,x)
$19:d3ab  01 83		 ora ($83,x)
$19:d3ad  41 07		 eor ($07,x)
$19:d3af  05 44		 ora $44
$19:d3b1  0e a0 00	  asl $00a0
$19:d3b4  86 f1		 stx $f1
$19:d3b6  56 a4		 lsr $a4,x
$19:d3b8  d0 e0		 bne $d39a
$19:d3ba  26 80		 rol $80
$19:d3bc  96 43		 stx $43,y
$19:d3be  71 27		 adc ($27),y
$19:d3c0  88			dey
$19:d3c1  c9 2c fa	  cmp #$fa2c
$19:d3c4  c7 e8		 cmp [$e8]
$19:d3c6  03 44		 ora $44,s
$19:d3c8  ae 56 67	  ldx $6756
$19:d3cb  12 b7		 ora ($b7)
$19:d3cd  0d b6 60	  ora $60b6
$19:d3d0  b3 05		 lda ($05,s),y
$19:d3d2  11 28		 ora ($28),y
$19:d3d4  09 f2 57	  ora #$57f2
$19:d3d7  2b			pld
$19:d3d8  73 ff		 adc ($ff,s),y
$19:d3da  09 20 0f	  ora #$0f20
$19:d3dd  dc c6 50	  jml [$50c6]
$19:d3e0  1f a6 81 7f   ora $7f81a6,x
$19:d3e4  da			phx
$19:d3e5  4c 08 19	  jmp $1908
$19:d3e8  8c f0 58	  sty $58f0
$19:d3eb  ed 83 fa	  sbc $fa83
$19:d3ee  c5 d8		 cmp $d8
$19:d3f0  d2 64		 cmp ($64)
$19:d3f2  62 03 a9	  per $7cf8
$19:d3f5  a7 00		 lda [$00]
$19:d3f7  9c 29 30	  stz $3029
$19:d3fa  30 05		 bmi $d401
$19:d3fc  8c c0 06	  sty $06c0
$19:d3ff  00 3f		 brk #$3f
$19:d401  82 f0 58	  brl $2cf4
$19:d404  22 7f 1a 45   jsl $451a7f
$19:d408  8e 90 94	  stx $9490
$19:d40b  2b			pld
$19:d40c  69 48 18	  adc #$1848
$19:d40f  20 97 05	  jsr $0597
$19:d412  13 18		 ora ($18,s),y
$19:d414  00 f8		 brk #$f8
$19:d416  08			php
$19:d417  f5 5a		 sbc $5a,x
$19:d419  2a			rol a
$19:d41a  30 1f		 bmi $d43b
$19:d41c  a0 c0 6b	  ldy #$6bc0
$19:d41f  3b			tsc
$19:d420  24 72		 bit $72
$19:d422  20 c0 c8	  jsr $c8c0
$19:d425  32 49		 and ($49)
$19:d427  92 36		 sta ($36)
$19:d429  57 d8		 eor [$d8],y
$19:d42b  3d 59 c2	  and $c259,x
$19:d42e  6d d1 25	  adc $25d1
$19:d431  a3 be		 lda $be,s
$19:d433  51 82		 eor ($82),y
$19:d435  c0 3e 16	  cpy #$163e
$19:d438  ff 86 f7 7e   sbc $7ef786,x
$19:d43c  10 18		 bpl $d456
$19:d43e  77 a1		 adc [$a1],y
$19:d440  40			rti
$19:d441  df ef 40 c2   cmp $c240ef,x
$19:d445  8c 20 a8	  sty $a820
$19:d448  f0 82		 beq $d3cc
$19:d44a  82 14 0d	  brl $e161
$19:d44d  e0 40 11	  cpx #$1140
$19:d450  85 bc		 sta $bc
$19:d452  13 17		 ora ($17,s),y
$19:d454  3b			tsc
$19:d455  9a			txs
$19:d456  14 0e		 trb $0e
$19:d458  18			clc
$19:d459  50 11		 bvc $d46c
$19:d45b  87 be		 sta [$be]
$19:d45d  de f3 8f	  dec $8ff3,x
$19:d460  e3 be		 sbc $be,s
$19:d462  1b			tcs
$19:d463  0f 39 18 7b   ora $7b1839
$19:d467  cd f6 f0	  cmp $f0f6
$19:d46a  1e 7b ed	  asl $ed7b,x
$19:d46d  f2 2e		 sbc ($2e)
$19:d46f  06 01		 asl $01
$19:d471  c2 29		 rep #$29
$19:d473  80 69		 bra $d4de
$19:d475  15 07		 ora $07,x
$19:d477  c0 18 07	  cpy #$0718
$19:d47a  96 c6		 stx $c6,y
$19:d47c  6a			ror a
$19:d47d  55 58		 eor $58,x
$19:d47f  2a			rol a
$19:d480  c0 8a 2a	  cpy #$2a8a
$19:d483  a1 b1		 lda ($b1,x)
$19:d485  9b			txy
$19:d486  05 7e		 ora $7e
$19:d488  8a			txa
$19:d489  b0 c4		 bcs $d44f
$19:d48b  e3 12		 sbc $12,s
$19:d48d  e0 6b 2c	  cpx #$2c6b
$19:d490  c1 7d		 cmp ($7d,x)
$19:d492  3c 18 ac	  bit $ac18,x
$19:d495  5a			phy
$19:d496  9c 0d 64	  stz $640d
$19:d499  5e 0d 86	  lsr $860d,x
$19:d49c  b9 8e 60	  lda $608e,y
$19:d49f  02 66		 cop #$66
$19:d4a1  81 b4		 sta ($b4,x)
$19:d4a3  76 3a		 ror $3a,x
$19:d4a5  f8			sed
$19:d4a6  ab			plb
$19:d4a7  60			rts
$19:d4a8  b2 0b		 lda ($0b)
$19:d4aa  50 b2		 bvc $d45e
$19:d4ac  ba			tsx
$19:d4ad  09 90 d9	  ora #$d990
$19:d4b0  86 30		 stx $30
$19:d4b2  33 09		 and ($09,s),y
$19:d4b4  ae ee 45	  ldx $45ee
$19:d4b7  80 3b		 bra $d4f4
$19:d4b9  fc 01 e1	  jsr ($e101,x)
$19:d4bc  1f 11 78 cf   ora $cf7811,x
$19:d4c0  c8			iny
$19:d4c1  9e 55 f3	  stz $f355,x
$19:d4c4  37 9d		 and [$9d],y
$19:d4c6  fd 11 e9	  sbc $e911,x
$19:d4c9  9f 55 7a d1   sta $d17a55,x
$19:d4cd  e2 bb		 sep #$bb
$19:d4cf  4d db 1c	  eor $1cdb
$19:d4d2  36 b1		 rol $b1,x
$19:d4d4  56 58		 lsr $58,x
$19:d4d6  b0 89		 bcs $d461
$19:d4d8  9c 11 5d	  stz $5d11
$19:d4db  ce cd ae	  dec $aecd
$19:d4de  1b			tcs
$19:d4df  86 58		 stx $58
$19:d4e1  31 81		 and ($81),y
$19:d4e3  68			pla
$19:d4e4  3c 9e 53	  bit $539e,x
$19:d4e7  51 da		 eor ($da),y
$19:d4e9  c0 b4		 cpy #$b4
$19:d4eb  f7 ff		 sbc [$ff],y
$19:d4ed  84 3c		 sty $3c
$19:d4ef  43 e3		 eor $e3,s
$19:d4f1  2f 21 f9 53   and $53f921
$19:d4f5  cc be 76	  cpy $76be
$19:d4f8  f4 3f a6	  pea $a63f
$19:d4fb  3d 53 ea	  and $ea53,x
$19:d4fe  e2 69		 sep #$69
$19:d500  0a			asl a
$19:d501  ba			tsx
$19:d502  f6 ac		 inc $ac,x
$19:d504  07 8a		 ora [$8a]
$19:d506  ed 37 6d	  sbc $6d37
$19:d509  b1 dc		 lda ($dc),y
$19:d50b  34 23		 bit $23,x
$19:d50d  73 b3		 adc ($b3,s),y
$19:d50f  75 8a		 adc $8a,x
$19:d511  bb			tyx
$19:d512  df fe 10 f1   cmp $f110fe,x
$19:d516  0f 8c bc 87   ora $87bc8c
$19:d51a  e5 4f		 sbc $4f
$19:d51c  32 f9		 and ($f9)
$19:d51e  db			stp
$19:d51f  d0 fe		 bne $d51f
$19:d521  98			tya
$19:d522  f5 4f		 sbc $4f,x
$19:d524  ae bd 7c	  ldx $7cbd
$19:d527  3b			tsc
$19:d528  b6 79		 ldx $79,y
$19:d52a  6d 57 d1	  adc $d157
$19:d52d  b3 6f		 lda ($6f,s),y
$19:d52f  96 e1		 stx $e1,y
$19:d531  7d d1 5d	  adc $5dd1,x
$19:d534  b6 e9		 ldx $e9,y
$19:d536  ee 1b 78	  inc $781b
$19:d539  ac 57 73	  ldy $7357
$19:d53c  b3 77		 lda ($77,s),y
$19:d53e  a8			tay
$19:d53f  15 5f		 ora $5f,x
$19:d541  af b4 68 93   lda $9368b4
$19:d545  ee 5f a0	  inc $a05f
$19:d548  e2 17		 sep #$17
$19:d54a  dc bd 95	  jml [$95bd]
$19:d54d  ec 0f fc	  cpx $fc0f
$19:d550  7d 80 ff	  adc $ff80,x
$19:d553  d7 c7		 cmp [$c7],y
$19:d555  67 32		 adc [$32]
$19:d557  81 22		 sta ($22,x)
$19:d559  ce 9e 85	  dec $859e
$19:d55c  f4 b7 a9	  pea $a9b7
$19:d55f  fd d9 1c	  sbc $1cd9,x
$19:d562  d5 8e		 cmp $8e,x
$19:d564  72 79		 adc ($79)
$19:d566  4b			phk
$19:d567  1f 6f 40 a8   ora $a8406f,x
$19:d56b  17 4e		 ora [$4e],y
$19:d56d  26 21		 rol $21
$19:d56f  48			pha
$19:d570  bc 7c 05	  ldy $057c,x
$19:d573  e1 3a		 sbc ($3a,x)
$19:d575  db			stp
$19:d576  84 23		 sty $23
$19:d578  6d ba 1d	  adc $1dba
$19:d57b  89 b6		 bit #$b6
$19:d57d  0d 0a 40	  ora $400a
$19:d580  f2 8e		 sbc ($8e)
$19:d582  2e 24 d5	  rol $d524
$19:d585  e7 bc		 sbc [$bc]
$19:d587  4c 7a a7	  jmp $a77a
$19:d58a  d7 5e		 cmp [$5e],y
$19:d58c  cb			wai
$19:d58d  f6 e7		 inc $e7,x
$19:d58f  c0 03		 cpy #$03
$19:d591  64 1e		 stz $1e
$19:d593  07 2f		 ora [$2f]
$19:d595  bd bc 0f	  lda $0fbc,x
$19:d598  e5 81		 sbc $81
$19:d59a  6f 16 e8 5e   adc $5ee816
$19:d59e  5b			tcd
$19:d59f  76 f1		 ror $f1,x
$19:d5a1  72 79		 adc ($79)
$19:d5a3  48			pha
$19:d5a4  5f 1e 79 37   eor $37791e,x
$19:d5a8  cb			wai
$19:d5a9  de 6f e4	  dec $e46f,x
$19:d5ac  77 a7		 adc [$a7],y
$19:d5ae  fd 61 e7	  sbc $e761,x
$19:d5b1  78			sei
$19:d5b2  5c e0 e5 1b   jml $1be5e0
$19:d5b6  fe f0 f0	  inc $f0f0,x
$19:d5b9  0f 84 bc 47   ora $47bc84
$19:d5bd  e3 4f		 sbc $4f,s
$19:d5bf  22 f9 5b cc   jsl $cc5bf9
$19:d5c3  fe 78 f5	  inc $f578,x
$19:d5c6  f7 b3		 sbc [$b3],y
$19:d5c8  fd 57 eb	  sbc $eb57,x
$19:d5cb  cf 66 fb 7b   cmp $7bfb66
$19:d5cf  dd fe 00	  cmp $00fe,x
$19:d5d2  f0 8f		 beq $d563
$19:d5d4  88			dey
$19:d5d5  bc 67 e4	  ldy $e467,x
$19:d5d8  4f 2a f9 9b   eor $9bf92a
$19:d5dc  ce fe 84	  dec $84fe
$19:d5df  ab			plb
$19:d5e0  25 8e		 and $8e
$19:d5e2  91 15		 sta ($15),y
$19:d5e4  a4 25		 ldy $25
$19:d5e6  81 08		 sta ($08,x)
$19:d5e8  f1 55		 sbc ($55),y
$19:d5ea  29 f8		 and #$f8
$19:d5ec  10 8e		 bpl $d57c
$19:d5ee  97 18		 sta [$18],y
$19:d5f0  ad 91 30	  lda $3091
$19:d5f3  08			php
$19:d5f4  4f 66 7b 77   eor $777b66
$19:d5f8  dd de ff	  cmp $ffde,x
$19:d5fb  f0 87		 beq $d584
$19:d5fd  88			dey
$19:d5fe  7c 65 e4	  jmp ($e465,x)
$19:d601  3f 2a 79 97   and $97792a,x
$19:d605  ce de 87	  dec $87de
$19:d608  f4 83 45	  pea $4583
$19:d60b  62 a9 0c	  per $e2b7
$19:d60e  e4 f2		 cpx $f2
$19:d610  92 1e		 sta ($1e)
$19:d612  c3 f6		 cmp $f6,s
$19:d614  a7 b9		 lda [$b9]
$19:d616  7d ed e0	  adc $e0ed,x
$19:d619  7f 0c 78 a7   adc $a7780c,x
$19:d61d  c7 5e		 cmp [$5e]
$19:d61f  46 98		 lsr $98
$19:d621  44 30 8d	  mvp $8d,$30
$19:d624  91 38		 sta ($38),y
$19:d626  a1 1b		 lda ($1b,x)
$19:d628  23 71		 and $71,s
$19:d62a  c4 9e		 cpy $9e
$19:d62c  f8			sed
$19:d62d  08			php
$19:d62e  de 99 f5	  dec $f599,x
$19:d631  57 ad		 eor [$ad],y
$19:d633  1e 55 9a	  asl $9a55,x
$19:d636  cf 31 c3 37   cmp $37c331
$19:d63a  15 65		 ora $65,x
$19:d63c  8a			txa
$19:d63d  10 99		 bpl $d5d8
$19:d63f  c1 2a		 cmp ($2a,x)
$19:d641  d0 72		 bne $d6b5
$19:d643  da			phx
$19:d644  e1 a1		 sbc ($a1,x)
$19:d646  8a			txa
$19:d647  b1 45		 lda ($45),y
$19:d649  68			pla
$19:d64a  3c 6e 3b	  bit $3b6e,x
$19:d64d  10 33		 bpl $d682
$19:d64f  99 f7 38	  sta $38f7,y
$19:d652  67 5b		 adc [$5b]
$19:d654  60			rts
$19:d655  d6 05		 dec $05,x
$19:d657  a7 bf		 lda [$bf]
$19:d659  fc 21 e2	  jsr ($e221,x)
$19:d65c  1f 19 79 0f   ora $0f7919,x
$19:d660  ca			dex
$19:d661  9e 65 f3	  stz $f365,x
$19:d664  b7 a1		 lda [$a1],y
$19:d666  fd 31 ea	  sbc $ea31,x
$19:d669  9f 57 13 48   sta $481357,x
$19:d66d  55 d7		 eor $d7,x
$19:d66f  9b			txy
$19:d670  60			rts
$19:d671  3c 57 69	  bit $6957,x
$19:d674  bb			tyx
$19:d675  6d 8e 85	  adc $858e
$19:d678  a1 1b		 lda ($1b,x)
$19:d67a  99 e5 19	  sta $19e5,y
$19:d67d  d8			cld
$19:d67e  0a			asl a
$19:d67f  ef 7f f8 43   sbc $43f87f
$19:d683  c4 3e		 cpy $3e
$19:d685  32 f2		 and ($f2)
$19:d687  1f 93 e6 11   ora $11e693,x
$19:d68b  0c 29 6c	  tsb $6c29
$19:d68e  50 9f		 bvc $d62f
$19:d690  91 38		 sta ($38),y
$19:d692  21 3f		 and ($3f,x)
$19:d694  23 71		 and $71,s
$19:d696  c5 8f		 cmp $8f
$19:d698  a8			tay
$19:d699  bd 67 eb	  lda $eb67,x
$19:d69c  e8			inx
$19:d69d  dd b3 cb	  cmp $cbb3,x
$19:d6a0  6a			ror a
$19:d6a1  be 8a 33	  ldx $338a,y
$19:d6a4  7c 67 bb	  jmp ($bb67,x)
$19:d6a7  85 f7		 sta $f7
$19:d6a9  4b			phk
$19:d6aa  3b			tsc
$19:d6ab  cf 62 8a ca   cmp $ca8a62
$19:d6af  b4 1c		 ldy $1c,x
$19:d6b1  b4 d3		 ldy $d3,x
$19:d6b3  01 4d		 ora ($4d,x)
$19:d6b5  f8			sed
$19:d6b6  f2 ac		 sbc ($ac)
$19:d6b8  d6 78		 dec $78,x
$19:d6ba  2e 19 b0	  rol $b019
$19:d6bd  5c e7 33 e2   jml $e233e7
$19:d6c1  70 ce		 bvs $d691
$19:d6c3  be c0 4c	  ldx $4cc0,y
$19:d6c6  0e fb 7a	  asl $7afb
$19:d6c9  8b			phb
$19:d6ca  fe c0 a2	  inc $a2c0,x
$19:d6cd  be 3e 21	  ldx $213e,y
$19:d6d0  17 6c		 ora [$6c],y
$19:d6d2  e6 41		 inc $41
$19:d6d4  24 51		 bit $51
$19:d6d6  cf d0 9e 95   cmp $959ed0
$19:d6da  f5 37		 sbc $37,x
$19:d6dc  ac 62 2b	  ldy $2b62
$19:d6df  cd 58 e7	  cmp $e758
$19:d6e2  1b			tcs
$19:d6e3  8e b1 f5	  stx $f5b1
$19:d6e6  db			stp
$19:d6e7  71 20		 adc ($20),y
$19:d6e9  1a			inc a
$19:d6ea  13 73		 ora ($73,s),y
$19:d6ec  c5 77		 cmp $77
$19:d6ee  34 29		 bit $29,x
$19:d6f0  fb			xce
$19:d6f1  f0 1d		 beq $d710
$19:d6f3  fe 00 dc	  inc $dc00,x
$19:d6f6  e8			inx
$19:d6f7  02 68		 cop #$68
$19:d6f9  93 e1		 sta ($e1,s),y
$19:d6fb  60			rts
$19:d6fc  77 80		 adc [$80],y
$19:d6fe  11 b6		 ora ($b6),y
$19:d700  9c ce 87	  stz $87ce
$19:d703  80 6d		 bra $d772
$19:d705  83 42		 sta $42,s
$19:d707  90 3c		 bcc $d745
$19:d709  a3 8b		 lda $8b,s
$19:d70b  89 35		 bit #$35
$19:d70d  79 ef 13	  adc $13ef,y
$19:d710  1e a9 f7	  asl $f7a9,x
$19:d713  33 ac		 and ($ac,s),y
$19:d715  09 84		 ora #$84
$19:d717  8b			phb
$19:d718  01 b3		 ora ($b3,x)
$19:d71a  d9 d6 1e	  cmp $1ed6,y
$19:d71d  de 90 60	  dec $6090,x
$19:d720  cf e8 7b 87   cmp $877be8
$19:d724  2f bd bd bc   and $bcbdbd
$19:d728  d3 e0		 cmp ($e0,s),y
$19:d72a  f8			sed
$19:d72b  d1 40		 cmp ($40),y
$19:d72d  86 4f		 stx $4f
$19:d72f  49 d0		 eor #$d0
$19:d731  bc 67 7b	  ldy $7b67,x
$19:d734  76 f1		 ror $f1,x
$19:d736  71 b8		 adc ($b8),y
$19:d738  e8			inx
$19:d739  5f 1e 79 37   eor $37791e,x
$19:d73d  cb			wai
$19:d73e  de 6f e4	  dec $e46f,x
$19:d741  77 a7		 adc [$a7],y
$19:d743  fd 61 e7	  sbc $e761,x
$19:d746  78			sei
$19:d747  5c e0 e5 1b   jml $1be5e0
$19:d74b  fe eb 9b	  inc $9beb,x
$19:d74e  3d 9d d7	  and $d79d,x
$19:d751  e0 ef		 cpx #$ef
$19:d753  0f f8 c3 c8   ora $c8c3f8
$19:d757  3e 52 f3	  rol $f352,x
$19:d75a  1f 9d 3d 75   ora $753d9d,x
$19:d75e  ec bf 42	  cpx $42bf
$19:d761  fa			plx
$19:d762  e3 d9		 sbc $d9,s
$19:d764  3e da f7	  rol $f7da,x
$19:d767  5f bf 3c 1b   eor $1b3cbf,x
$19:d76b  e1 ef		 sbc ($ef,x)
$19:d76d  17 f9		 ora [$f9],y
$19:d76f  03 ca		 ora $ca,s
$19:d771  3e 62 f3	  rol $f362,x
$19:d774  9f 9f a2 dd   sta $dda29f,x
$19:d778  15 48		 ora $48,x
$19:d77a  01 f8		 ora ($f8,x)
$19:d77c  2c 96 3a	  bit $3a96
$19:d77f  44 55 2a	  mvp $2a,$55
$19:d782  16 44		 asl $44,x
$19:d784  61 d9		 adc ($d9,x)
$19:d786  12 42		 ora ($42)
$19:d788  90 14		 bcc $d79e
$19:d78a  80 f8		 bra $d784
$19:d78c  11 8e		 ora ($8e),y
$19:d78e  97 15		 sta [$15],y
$19:d790  00 d2		 brk #$d2
$19:d792  0f de cc f6   ora $f6ccde
$19:d796  ef bb bd ff   sbc $ffbdbb
$19:d79a  e1 0f		 sbc ($0f,x)
$19:d79c  10 f8		 bpl $d796
$19:d79e  cb			wai
$19:d79f  c8			iny
$19:d7a0  7e 54 f3	  ror $f354,x
$19:d7a3  2f 9d bd 0f   and $0fbd9d
$19:d7a7  e9 06		 sbc #$06
$19:d7a9  8a			txa
$19:d7aa  c5 52		 cmp $52
$19:d7ac  19 c6 e3	  ora $e3c6,y
$19:d7af  a4 3d		 ldy $3d
$19:d7b1  87 ed		 sta [$ed]
$19:d7b3  4f 72 fb db   eor $dbfb72
$19:d7b7  c0 fe		 cpy #$fe
$19:d7b9  18			clc
$19:d7ba  f1 4f		 sbc ($4f),y
$19:d7bc  8e bc 8d	  stx $8dbc
$19:d7bf  30 88		 bmi $d749
$19:d7c1  61 1b		 adc ($1b,x)
$19:d7c3  22 71 42 36   jsl $364271
$19:d7c7  46 ee		 lsr $ee
$19:d7c9  04 6c		 tsb $6c
$19:d7cb  96 5c		 stx $5c,y
$19:d7cd  48			pha
$19:d7ce  de 99 f5	  dec $f599,x
$19:d7d1  57 ad		 eor [$ad],y
$19:d7d3  1e 55 9a	  asl $9a55,x
$19:d7d6  cf 31 c3 37   cmp $37c331
$19:d7da  15 65		 ora $65,x
$19:d7dc  8a			txa
$19:d7dd  d0 79		 bne $d858
$19:d7df  1c 56 20	  trb $2056
$19:d7e2  68			pla
$19:d7e3  29 f5		 and #$f5
$19:d7e5  9e 5e 86	  stz $865e,x
$19:d7e8  2a			rol a
$19:d7e9  c5 15		 cmp $15
$19:d7eb  a0 f1		 ldy #$f1
$19:d7ed  b8			clv
$19:d7ee  ec 40 ce	  cpx $ce40
$19:d7f1  67 dc		 adc [$dc]
$19:d7f3  e1 9d		 sbc ($9d,x)
$19:d7f5  6d 83 58	  adc $5883
$19:d7f8  16 9e		 asl $9e,x
$19:d7fa  ff f0 87 88   sbc $8887f0,x
$19:d7fe  7c 65 e4	  jmp ($e465,x)
$19:d801  3f 81 c1 20   and $20c181,x
$19:d805  a4 4b		 ldy $4b
$19:d807  97 4a		 sta [$4a],y
$19:d809  e5 e4		 sbc $e4
$19:d80b  4b			phk
$19:d80c  e9 4a		 sbc #$4a
$19:d80e  7a			ply
$19:d80f  64 8c		 stz $8c
$19:d811  9a			txs
$19:d812  75 49		 adc $49,x
$19:d814  19 f1 43	  ora $43f1,y
$19:d817  ef c1 0f 93   sbc $930fc1
$19:d81b  18			clc
$19:d81c  a7 58		 lda [$58]
$19:d81e  88			dey
$19:d81f  b1 58		 lda ($58),y
$19:d821  a9 13		 lda #$13
$19:d823  33 6c		 and ($6c,s),y
$19:d825  07 8a		 ora [$8a]
$19:d827  f8			sed
$19:d828  2c 6d b1	  bit $b16d
$19:d82b  d0 ce		 bne $d7fb
$19:d82d  08			php
$19:d82e  8c da 09	  sty $09da
$19:d831  e5 19		 sbc $19
$19:d833  d8			cld
$19:d834  04 4f		 tsb $4f
$19:d836  7f f8 43 c4   adc $c443f8,x
$19:d83a  3e 32 f2	  rol $f232,x
$19:d83d  1f 92 0b 19   ora $190b92,x
$19:d841  15 b6		 ora $b6,x
$19:d843  92 0a		 sta ($0a)
$19:d845  11 0c		 ora ($0c),y
$19:d847  24 2e		 bit $2e
$19:d849  36 c6		 rol $c6,x
$19:d84b  c0 38		 cpy #$38
$19:d84d  44 50 91	  mvp $91,$50
$19:d850  91 3b		 sta ($3b),y
$19:d852  81 23		 sta ($23,x)
$19:d854  23 76		 and $76,s
$19:d856  82 46 4b	  brl $239f
$19:d859  2e 24 8f	  rol $8f24
$19:d85c  59 7a fa	  eor $fa7a,y
$19:d85f  6c 6c f2	  jmp ($f26c)
$19:d862  35 9a		 and $9a,x
$19:d864  f9 28 cd	  sbc $cd28,y
$19:d867  f1 9e		 sbc ($9e),y
$19:d869  d8			cld
$19:d86a  d7 dd		 cmp [$dd],y
$19:d86c  2c ef 3d	  bit $3def
$19:d86f  8a			txa
$19:d870  2b			pld
$19:d871  2a			rol a
$19:d872  d0 72		 bne $d8e6
$19:d874  d7 c9		 cmp [$c9],y
$19:d876  15 ba		 ora $ba,x
$19:d878  dd 62 b3	  cmp $b362,x
$19:d87b  88			dey
$19:d87c  ab			plb
$19:d87d  ee 25 59	  inc $5925
$19:d880  ac f0 5c	  ldy $5cf0
$19:d883  33 6f		 and ($6f,s),y
$19:d885  b1 ac		 lda ($ac),y
$19:d887  83 d7		 sta $d7,s
$19:d889  39 9f 13	  and $139f,y
$19:d88c  86 75		 stx $75
$19:d88e  f6 02		 inc $02,x
$19:d890  60			rts
$19:d891  77 db		 adc [$db],y
$19:d893  d4 5f		 pei ($5f)
$19:d895  ea			nop
$19:d896  09 02		 ora #$02
$19:d898  31 02		 and ($02),y
$19:d89a  82 70 be	  brl $970d
$19:d89d  3d 59 2c	  and $2c59,x
$19:d8a0  4a			lsr a
$19:d8a1  a5 2a		 lda $2a
$19:d8a3  ad 35 13	  lda $1335
$19:d8a6  59 67 32	  eor $3267,y
$19:d8a9  81 54		 sta ($54,x)
$19:d8ab  a5 95		 lda $95
$19:d8ad  86 a4		 stx $a4
$19:d8af  9e 3d 13	  stz $133d,x
$19:d8b2  e9 af		 sbc #$af
$19:d8b4  55 fa		 eor $fa,x
$19:d8b6  c4 f9		 cpy $f9
$19:d8b8  1f 25 8e 71   ora $718e25,x
$19:d8bc  b8			clv
$19:d8bd  eb			xba
$19:d8be  1f 6d ac 57   ora $57ac6d,x
$19:d8c2  57 00		 eor [$00],y
$19:d8c4  d0 9b		 bne $d861
$19:d8c6  9f c1 63 a1   sta $a163c1,x
$19:d8ca  4f df 81 a1   eor $a181df
$19:d8ce  27 23		 and [$23]
$19:d8d0  da			phx
$19:d8d1  1e 1b 9d	  asl $9d1b,x
$19:d8d4  00 4d		 brk #$4d
$19:d8d6  12 7c		 ora ($7c)
$19:d8d8  2c 0e f3	  bit $f30e
$19:d8db  c2 67		 rep #$67
$19:d8dd  33 ab		 and ($ab,s),y
$19:d8df  84 e8		 sty $e8
$19:d8e1  b4 0e		 ldy $0e,x
$19:d8e3  47 35		 eor [$35]
$19:d8e5  0d c4 92	  ora $92c4
$19:d8e8  24 19		 bit $19
$19:d8ea  2c 99 46	  bit $4699
$19:d8ed  a7 0f		 lda [$0f]
$19:d8ef  07 2b		 ora [$2b]
$19:d8f1  b1 bf		 lda ($bf),y
$19:d8f3  0d b4 98	  ora $98b4
$19:d8f6  f5 4f		 sbc $4f,x
$19:d8f8  b9 9d 60	  lda $609d,y
$19:d8fb  4c 24 58	  jmp $5824
$19:d8fe  0d 9f 58	  ora $589f
$19:d901  b0 f6		 bcs $d8f9
$19:d903  f4 83 06	  pea $0683
$19:d906  7f 43 b1 b9   adc $b9b143,x
$19:d90a  7d ed ed	  adc $eded,x
$19:d90d  e6 9f		 inc $9f
$19:d90f  07 c6		 ora [$c6]
$19:d911  8a			txa
$19:d912  04 3e		 tsb $3e
$19:d914  47 15		 eor [$15]
$19:d916  bc 53 a9	  ldy $a953,x
$19:d919  d5 c2		 cmp $c2,x
$19:d91b  75 3b		 adc $3b,x
$19:d91d  02 1f		 cop #$1f
$19:d91f  1b			tcs
$19:d920  8e 85 39	  stx $3985
$19:d923  65 c4		 adc $c4
$19:d925  f9 e7 da	  sbc $dae7,y
$19:d928  46 82		 lsr $82
$19:d92a  34 08		 bit $08,x
$19:d92c  7e 54 f6	  ror $f654,x
$19:d92f  f7 a5		 sbc [$a5],y
$19:d931  7d 4d eb	  adc $eb4d,x
$19:d934  7f 14 2a e6   adc $e62a14,x
$19:d938  07 28		 ora [$28]
$19:d93a  df f7 5c d9   cmp $d95cf7,x
$19:d93e  f5 8e		 sbc $8e,x
$19:d940  bf 07 78 7f   lda $7f7807,x
$19:d944  c6 1e		 dec $1e
$19:d946  41 f2		 eor ($f2,x)
$19:d948  97 98		 sta [$98],y
$19:d94a  fc e9 eb	  jsr ($ebe9,x)
$19:d94d  af 65 fa 17   lda $17fa65
$19:d951  d7 1e		 cmp [$1e],y
$19:d953  c9 f6 d7	  cmp #$d7f6
$19:d956  ba			tsx
$19:d957  fd e2 79	  sbc $79e2,x
$19:d95a  2b			pld
$19:d95b  60			rts
$19:d95c  0c 32 79	  tsb $7932
$19:d95f  49 6c b5	  eor #$b56c
$19:d962  e2 d6		 sep #$d6
$19:d964  e8			inx
$19:d965  af 82 c7 15   lda $15c782
$19:d969  02 0b		 cop #$0b
$19:d96b  c5 b2		 cmp $b2
$19:d96d  16 78		 asl $78,x
$19:d96f  a8			tay
$19:d970  4c ad af	  jmp $afad
$19:d973  16 cc		 asl $cc,x
$19:d975  59 84 40	  eor $4084,y
$19:d978  35 1c		 and $1c,x
$19:d97a  8b			phb
$19:d97b  c5 81		 cmp $81
$19:d97d  01 98		 ora ($98,x)
$19:d97f  b4 da		 ldy $da,x
$19:d981  ed 76 ac	  sbc $ac76
$19:d984  cb			wai
$19:d985  c7 cb		 cmp [$cb]
$19:d987  5e 6b f3	  lsr $f36b,x
$19:d98a  e7 c0		 sbc [$c0]
$19:d98c  2e 56 34	  rol $3456
$19:d98f  80 1f		 bra $d9b0
$19:d991  82 c9 63	  brl $3d5d
$19:d994  b2 45		 lda ($45)
$19:d996  52 a2		 eor ($a2)
$19:d998  8c 34 a8	  sty $a834
$19:d99b  1f 80 48 0a   ora $0a4880,x
$19:d99f  52 f0		 eor ($f0)
$19:d9a1  23 0c		 and $0c,s
$19:d9a3  28			plp
$19:d9a4  09 31 4c	  ora #$4c31
$19:d9a7  02 d8		 cop #$d8
$19:d9a9  8f de cc f6   sta $f6ccde
$19:d9ad  ef bb bd ff   sbc $ffbdbb
$19:d9b1  e1 0f		 sbc ($0f,x)
$19:d9b3  10 f8		 bpl $d9ad
$19:d9b5  cb			wai
$19:d9b6  c8			iny
$19:d9b7  7e 54 f3	  ror $f354,x
$19:d9ba  2f 9d bd 0f   and $0fbd9d
$19:d9be  e9 06 e4	  sbc #$e406
$19:d9c1  71 52		 adc ($52),y
$19:d9c3  19 c6 e3	  ora $e3c6,y
$19:d9c6  a4 3d		 ldy $3d
$19:d9c8  87 ed		 sta [$ed]
$19:d9ca  4f 72 b8 33   eor $33b872
$19:d9ce  13 ba		 ora ($ba,s),y
$19:d9d0  4e 36 d3	  lsr $d336
$19:d9d3  8f 44 e2 65   sta $65e244
$19:d9d7  39 9e 4e	  and $4e9e,y
$19:d9da  69 d3 9f	  adc #$9fd3
$19:d9dd  84 e7		 sty $e7
$19:d9df  f5 39		 sbc $39,x
$19:d9e1  8e 4e a7	  stx $a74e
$19:d9e4  d3 ab		 cmp ($ab,s),y
$19:d9e6  04 eb		 tsb $eb
$19:d9e8  05 3a		 ora $3a
$19:d9ea  c6 4e		 dec $4e
$19:d9ec  b2 d3		 lda ($d3)
$19:d9ee  ad 04 eb	  lda $eb04
$19:d9f1  55 3a		 eor $3a,x
$19:d9f3  da			phx
$19:d9f4  4e b7 d3	  lsr $d3b7
$19:d9f7  af 04 ea 05   lda $05ea04
$19:d9fb  3b			tsc
$19:d9fc  92 4e		 sta ($4e)
$19:d9fe  e5 d3		 sbc $d3
$19:da00  b9 c4 ee	  lda $eec4,y
$19:da03  85 3b		 sta $3b
$19:da05  ae 4e ed	  ldx $ed4e
$19:da08  d3 bc		 cmp ($bc,s),y
$19:da0a  44 ef 35	  mvp $35,$ef
$19:da0d  3b			tsc
$19:da0e  da			phx
$19:da0f  4e f8 d3	  lsr $d3f8
$19:da12  be 84 ef	  ldx $ef84,y
$19:da15  c5 3b		 cmp $3b
$19:da17  fa			plx
$19:da18  4e e0 d3	  lsr $d3e0
$19:da1b  c8			iny
$19:da1c  84 f2		 sty $f2
$19:da1e  35 3c		 and $3c,x
$19:da20  92 4f		 sta ($4f)
$19:da22  25 d3		 and $d3
$19:da24  c9 c4 f2	  cmp #$f2c4
$19:da27  a5 3c		 lda $3c
$19:da29  c2 4f		 rep #$4f
$19:da2b  33 d3		 and ($d3,s),y
$19:da2d  ce 84 f2	  dec $f284
$19:da30  05 3d		 ora $3d
$19:da32  9a			txs
$19:da33  4f 6c d3 dc   eor $dcd36c
$19:da37  84 f7		 sty $f7
$19:da39  55 3d		 eor $3d,x
$19:da3b  da			phx
$19:da3c  4f 77 d3 df   eor $dfd377
$19:da40  44 f6 55	  mvp $55,$f6
$19:da43  3e b6 4f	  rol $4fb6,x
$19:da46  b5 d3		 lda $d3,x
$19:da48  ee 04 fb	  inc $fb04
$19:da4b  a5 3e		 lda $3e
$19:da4d  f2 4f		 sbc ($4f)
$19:da4f  bf d3 e8 0c   lda $0ce8d3,x
$19:da53  00 c8		 brk #$c8
$19:da55  50 89		 bvc $d9e0
$19:da57  f9 8d 3f	  sbc $3f8d,y
$19:da5a  54 53 1a	  mvn $1a,$53
$19:da5d  49 0d 5b	  eor #$5b0d
$19:da60  4e 35 6e	  lsr $6e35
$19:da63  18			clc
$19:da64  d4 ff		 pei ($ff)
$19:da66  ff f9 8d 39   sbc $398df9,x
$19:da6a  86 ad		 stx $ad
$19:da6c  82 50 0d	  brl $e7bf
$19:da6f  79 2e a0	  adc $a02e,y
$19:da72  41 53		 eor ($53,x)
$19:da74  9b			txy
$19:da75  66 5e		 ror $5e
$19:da77  2d 29 78	  and $7829
$19:da7a  b9 05 e2	  lda $e205,y
$19:da7d  b7 5a		 lda [$5a],y
$19:da7f  55 41		 eor $41,x
$19:da81  6b			rtl
$19:da82  e3 b7		 sbc $b7,s
$19:da84  e8			inx
$19:da85  2a			rol a
$19:da86  30 83		 bmi $da0b
$19:da88  99 07 f1	  sta $f107,y
$19:da8b  ff ec 87 86   sbc $8687ec,x
$19:da8f  06 b8		 asl $b8
$19:da91  28			plp
$19:da92  07 12		 ora [$12]
$19:da94  82 2b 41	  brl $1bc2
$19:da97  39 24 d2	  and $d224,y
$19:da9a  d9 49 49	  cmp $4949,y
$19:da9d  a1 c5		 lda ($c5,x)
$19:da9f  88			dey
$19:daa0  6d 96 22	  adc $2296
$19:daa3  2f 1c a9 e9   and $e9a91c
$19:daa7  34 fc		 bit $fc,x
$19:daa9  1b			tcs
$19:daaa  3c bb e8	  bit $e8bb,x
$19:daad  ef 4f f9 22   sbc $22f94f
$19:dab1  57 7f		 eor [$7f],y
$19:dab3  49 0f a1	  eor #$a10f
$19:dab6  18			clc
$19:dab7  3d c1 e5	  and $e5c1,x
$19:daba  71 93		 adc ($93),y
$19:dabc  7d 21 54	  adc $5421,x
$19:dabf  27 4e		 and [$4e]
$19:dac1  4b			phk
$19:dac2  68			pla
$19:dac3  42 94		 wdm #$94
$19:dac5  1e 83 94	  asl $9483,x
$19:dac8  01 68		 ora ($68,x)
$19:daca  f7 00		 sbc [$00],y
$19:dacc  5e 01 d8	  lsr $d801,x
$19:dacf  12 01		 ora ($01)
$19:dad1  14 04		 trb $04
$19:dad3  80 65		 bra $db3a
$19:dad5  06 30		 asl $30
$19:dad7  07 40		 ora [$40]
$19:dad9  48			pha
$19:dada  38			sec
$19:dadb  c8			iny
$19:dadc  9e 81 92	  stz $9281,x
$19:dadf  28			plp
$19:dae0  d0 1c		 bne $dafe
$19:dae2  9b			txy
$19:dae3  e5 02		 sbc $02
$19:dae5  80 54		 bra $db3b
$19:dae7  0d cb fe	  ora $fecb
$19:daea  ff 9d d0 fe   sbc $fed09d,x
$19:daee  0f a0 b2 82   ora $82b2a0
$19:daf2  06 1e		 asl $1e
$19:daf4  fa			plx
$19:daf5  3b			tsc
$19:daf6  d2 31		 cmp ($31)
$19:daf8  fd 48 c7	  sbc $c748,x
$19:dafb  ad 50 db	  lda $db50
$19:dafe  a8			tay
$19:daff  cd 04 a8	  cmp $a804
$19:db02  2b			pld
$19:db03  53 64		 eor ($64,s),y
$19:db05  b4 55		 ldy $55,x
$19:db07  9b			txy
$19:db08  73 8d		 adc ($8d,s),y
$19:db0a  ca			dex
$19:db0b  09 04 f8	  ora #$f804
$19:db0e  33 d2		 and ($d2,s),y
$19:db10  45 43		 eor $43
$19:db12  67 e4		 adc [$e4]
$19:db14  f9 54 65	  sbc $6554,y
$19:db17  12 54		 ora ($54)
$19:db19  83 c5		 sta $c5,s
$19:db1b  2e cf 85	  rol $85cf
$19:db1e  7b			tdc
$19:db1f  b6 49		 ldx $49,y
$19:db21  54 28 f4	  mvn $f4,$28
$19:db24  d7 04		 cmp [$04],y
$19:db26  1f da 10 79   ora $7910da,x
$19:db2a  65 10		 adc $10
$19:db2c  9a			txs
$19:db2d  0c 90 4d	  tsb $4d90
$19:db30  01 9c		 ora ($9c,x)
$19:db32  38			sec
$19:db33  94 11		 sty $11,x
$19:db35  89 41 06	  bit #$0641
$19:db38  c2 67		 rep #$67
$19:db3a  04 d0		 tsb $d0
$19:db3c  41 60		 eor ($60,x)
$19:db3e  1d 9a 0a	  ora $0a9a,x
$19:db41  ad 86 e0	  lda $e086
$19:db44  ad 42 39	  lda $3942
$19:db47  0c 4b fb	  tsb $fb4b
$19:db4a  ff 1b a1 fc   sbc $fca11b,x
$19:db4e  07 e8		 ora [$e8]
$19:db50  2f 02 3b 0b   and $0b3b02
$19:db54  c0 a2		 cpy #$a2
$19:db56  87 14		 sta [$14]
$19:db58  64 81		 stz $81
$19:db5a  a4 09		 ldy $09
$19:db5c  e4 89		 cpx $89
$19:db5e  28			plp
$19:db5f  10 f8		 bpl $db59
$19:db61  cd 20 35	  cmp $3520
$19:db64  02 3a		 cop #$3a
$19:db66  02 c8		 cop #$c8
$19:db68  a2 40		 ldx #$40
$19:db6a  b2 23		 lda ($23)
$19:db6c  b0 50		 bcs $dbbe
$19:db6e  29 e2 e1	  and #$e1e2
$19:db71  20 92 54	  jsr $5492
$19:db74  17 60		 ora [$60],y
$19:db76  bf 4b 22 f1   lda $f1224b,x
$19:db7a  4d 20 c5	  eor $c520
$19:db7d  43 48		 eor $48,s
$19:db7f  60			rts
$19:db80  17 86		 ora [$86],y
$19:db82  69 05 c9	  adc #$c905
$19:db85  38			sec
$19:db86  d3 38		 cmp ($38,s),y
$19:db88  2e 12 99	  rol $9912
$19:db8b  25 43		 and $43
$19:db8d  70 f2		 bvs $db81
$19:db8f  53 48		 eor ($48,s),y
$19:db91  56 68		 lsr $68,x
$19:db93  a7 52		 lda [$52]
$19:db95  72 94		 adc ($94)
$19:db97  30 0c		 bmi $dba5
$19:db99  a9 50 f1	  lda #$f150
$19:db9c  3c 8c d2	  bit $d28c,x
$19:db9f  06 90		 asl $90
$19:dba1  97 81		 sta [$81],y
$19:dba3  84 82		 sty $82
$19:dba5  4b			phk
$19:dba6  60			rts
$19:dba7  7d 80 5c	  adc $5c80,x
$19:dbaa  16 c4		 asl $c4,x
$19:dbac  19 03 29	  ora $2903,y
$19:dbaf  03 50		 ora $50,s
$19:dbb1  6e 82 30	  ror $3082
$19:dbb4  1b			tcs
$19:dbb5  a0 14		 ldy #$14
$19:dbb7  06 e9		 asl $e9
$19:dbb9  83 24		 sta $24,s
$19:dbbb  2e b4 90	  rol $90b4
$19:dbbe  bd 02 42	  lda $4202,x
$19:dbc1  be c8 6e	  ldx $6ec8,y
$19:dbc4  83 50		 sta $50,s
$19:dbc6  17 a0		 ora [$a0],y
$19:dbc8  3c 04 e8	  bit $e804,x
$19:dbcb  23 21		 and $21,s
$19:dbcd  ba			tsx
$19:dbce  45 a8		 eor $a8
$19:dbd0  c3 74		 cmp $74,s
$19:dbd2  b8			clv
$19:dbd3  a5 17		 lda $17
$19:dbd5  98			tya
$19:dbd6  94 59		 sty $59,x
$19:dbd8  3d 1c 6e	  and $6e1c,x
$19:dbdb  98			tya
$19:dbdc  25 62		 and $62
$19:dbde  f7 68		 sbc [$68],y
$19:dbe0  e3 f2		 sbc $f2,s
$19:dbe2  12 80		 ora ($80)
$19:dbe4  5c 12 64 3f   jml $3f6412
$19:dbe8  24 d9		 bit $d9
$19:dbea  08			php
$19:dbeb  40			rti
$19:dbec  a2 0a		 ldx #$0a
$19:dbee  32 60		 and ($60)
$19:dbf0  92 ac		 sta ($ac)
$19:dbf2  87 e4		 sta [$e4]
$19:dbf4  b3 26		 lda ($26,s),y
$19:dbf6  89 2e d8	  bit #$d82e
$19:dbf9  42 0c		 wdm #$0c
$19:dbfb  54 08 83	  mvn $83,$08
$19:dbfe  35 03		 and $03,x
$19:dc00  60			rts
$19:dc01  d5 41		 cmp $41,x
$19:dc03  08			php
$19:dc04  37 51		 and [$51],y
$19:dc06  b2 18		 lda ($18)
$19:dc08  27 31		 and [$31]
$19:dc0a  b6 41		 ldx $41,y
$19:dc0c  76 50		 ror $50,x
$19:dc0e  72 11		 adc ($11)
$19:dc10  fe a8 b0	  inc $b0a8,x
$19:dc13  52 10		 eor ($10)
$19:dc15  83 42		 sta $42,s
$19:dc17  23 49		 and $49,s
$19:dc19  15 a4		 ora $a4,x
$19:dc1b  98			tya
$19:dc1c  64 6d		 stz $6d
$19:dc1e  90 18		 bcc $dc38
$19:dc20  a2 10		 ldx #$10
$19:dc22  07 20		 ora [$20]
$19:dc24  83 49		 sta $49,s
$19:dc26  dd 25 b2	  cmp $b225,x
$19:dc29  04 b6		 tsb $b6
$19:dc2b  21 a1		 and ($a1,x)
$19:dc2d  6d 19 60	  adc $6019
$19:dc30  31 46		 and ($46),y
$19:dc32  18			clc
$19:dc33  0e 51 b6	  asl $b651
$19:dc36  03 10		 ora $10,s
$19:dc38  29 b4 e2	  and #$e2b4
$19:dc3b  90 4b		 bcc $dc88
$19:dc3d  4b			phk
$19:dc3e  12 19		 ora ($19)
$19:dc40  71 94		 adc ($94),y
$19:dc42  86 c8		 stx $c8
$19:dc44  11 0e		 ora ($0e),y
$19:dc46  01 b6		 ora ($b6,x)
$19:dc48  4b			phk
$19:dc49  3c 22 7e	  bit $7e22,x
$19:dc4c  53 6e		 eor ($6e,s),y
$19:dc4e  92 18		 sta ($18)
$19:dc50  5b			tcd
$19:dc51  21 fd		 and ($fd,x)
$19:dc53  ff f9 d6 86   sbc $86d6f9,x
$19:dc57  d9 0f e2	  cmp $e20f,y
$19:dc5a  d0 cd		 bne $dc29
$19:dc5c  20 bb 42	  jsr $42bb
$19:dc5f  58			cli
$19:dc60  30 c1		 bmi $dc23
$19:dc62  de 8e f0	  dec $f08e,x
$19:dc65  ab			plb
$19:dc66  d2 5e		 cmp ($5e)
$19:dc68  28			plp
$19:dc69  dd 46 db	  cmp $db46,x
$19:dc6c  11 01		 ora ($01),y
$19:dc6e  ba			tsx
$19:dc6f  86 90		 stx $90
$19:dc71  6e a1 c4	  ror $c4a1
$19:dc74  1e b8 f3	  asl $f3b8,x
$19:dc77  26 39		 rol $39
$19:dc79  0d c1 e6	  ora $e6c1
$19:dc7c  ce b6 75	  dec $75b6
$19:dc7f  a1 10		 lda ($10,x)
$19:dc81  1c 68 33	  trb $3368
$19:dc84  61 1f		 adc ($1f,x)
$19:dc86  06 d0		 asl $d0
$19:dc88  2f 8f b6 7d   and $7db68f
$19:dc8c  a2 90		 ldx #$90
$19:dc8e  00 68		 brk #$68
$19:dc90  75 63		 adc $63,x
$19:dc92  2f 14 da 0e   and $0eda14
$19:dc96  af 11 88 4c   lda $4c8811
$19:dc9a  29 49 d4	  and #$d449
$19:dc9d  a9 d2 93	  lda #$93d2
$19:dca0  68			pla
$19:dca1  c7 05		 cmp [$05]
$19:dca3  1a			inc a
$19:dca4  3c 41 56	  bit $5641,x
$19:dca7  8f 12 51 93   sta $935112
$19:dcab  c4 95		 cpy $95
$19:dcad  65 05		 adc $05
$19:dcaf  19 08 c8	  ora $c808,y
$19:dcb2  2e d4 a6	  rol $a6d4
$19:dcb5  9a			txs
$19:dcb6  69 db 4b	  adc #$4bdb
$19:dcb9  df 68 3c 26   cmp $263c68,x
$19:dcbd  96 11		 stx $11,y
$19:dcbf  28			plp
$19:dcc0  84 02		 sty $02
$19:dcc2  c1 00		 cmp ($00,x)
$19:dcc4  e0 7f		 cpx #$7f
$19:dcc6  df 20 f9 03   cmp $03f920,x
$19:dcca  b8			clv
$19:dccb  0c 48 02	  tsb $0248
$19:dcce  23 11		 and $11,s
$19:dcd0  7c 84 80	  jmp ($8084,x)
$19:dcd3  ee 10 08	  inc $0810
$19:dcd6  c3 e8		 cmp $e8,s
$19:dcd8  7c 0f e3	  jmp ($e30f,x)
$19:dcdb  82 28 06	  brl $e306
$19:dcde  10 a2		 bpl $dc82
$19:dce0  00 51		 brk #$51
$19:dce2  42 22		 wdm #$22
$19:dce4  12 00		 ora ($00)
$19:dce6  88			dey
$19:dce7  40			rti
$19:dce8  44 65 00	  mvp $00,$65
$19:dceb  a1 40		 lda ($40,x)
$19:dced  60			rts
$19:dcee  90 49		 bcc $dd39
$19:dcf0  04 42		 tsb $42
$19:dcf2  04 12		 tsb $12
$19:dcf4  57 b9		 eor [$b9],y
$19:dcf6  3e 42 0c	  rol $0c42,x
$19:dcf9  20 3a 80	  jsr $803a
$19:dcfc  99 28 02	  sta $0228,y
$19:dcff  d4 90		 pei ($90)
$19:dd01  0d 04 46	  ora $4604
$19:dd04  14 01		 trb $01
$19:dd06  58			cli
$19:dd07  0d 4e 60	  ora $604e
$19:dd0a  3b			tsc
$19:dd0b  01 b0		 ora ($b0,x)
$19:dd0d  93 c6		 sta ($c6,s),y
$19:dd0f  84 13		 sty $13
$19:dd11  42 e8		 wdm #$e8
$19:dd13  3f c8 46 02   and $0246c8,x
$19:dd17  12 b8		 ora ($b8)
$19:dd19  09 92 c0	  ora #$c092
$19:dd1c  2d 4a 01	  and $014a
$19:dd1f  79 0b 80	  adc $800b,y
$19:dd22  5f 01 10 58   eor $581001,x
$19:dd26  1f 20 9e 24   ora $249e20,x
$19:dd2a  38			sec
$19:dd2b  19 52 a0	  ora $a052,y
$19:dd2e  6c 40 88	  jmp ($8840)
$19:dd31  1d 0d 2a	  ora $2a0d,x
$19:dd34  07 b4		 ora [$b4]
$19:dd36  24 88		 bit $88
$19:dd38  8c 0a a0	  sty $a00a
$19:dd3b  5e 33 50	  lsr $5033,x
$19:dd3e  27 4c		 and [$4c]
$19:dd40  c6 0a		 dec $0a
$19:dd42  43 27		 eor $27,s
$19:dd44  81 94		 sta ($94,x)
$19:dd46  c9 c0 6c	  cmp #$6cc0
$19:dd49  32 e0		 and ($e0)
$19:dd4b  1c d0 ba	  trb $bad0
$19:dd4e  07 b4		 ora [$b4]
$19:dd50  0f 88 8c 0b   ora $0b8c88
$19:dd54  62 9e 21	  per $fef5
$19:dd57  c8			iny
$19:dd58  29 0c 4a	  and #$4a0c
$19:dd5b  06 53		 asl $53
$19:dd5d  15 81		 ora $81,x
$19:dd5f  cc 94 60	  cpy $6094
$19:dd62  42 03		 wdm #$03
$19:dd64  da			phx
$19:dd65  0f 01 14 04   ora $041401
$19:dd69  32 4f		 and ($4f)
$19:dd6b  09 f0 4c	  ora #$4cf0
$19:dd6e  a0 03		 ldy #$03
$19:dd70  04 a8		 tsb $a8
$19:dd72  25 40		 and $40
$19:dd74  72 82		 adc ($82)
$19:dd76  90 01		 bcc $dd79
$19:dd78  84 e0		 sty $e0
$19:dd7a  90 15		 bcc $dd91
$19:dd7c  e7 38		 sbc [$38]
$19:dd7e  12 46		 ora ($46)
$19:dd80  00 4c		 brk #$4c
$19:dd82  0f 87 fc 24   ora $24fc87
$19:dd86  01 20		 ora ($20,x)
$19:dd88  2a			rol a
$19:dd89  80 ec		 bra $dd77
$19:dd8b  9f e2 7c 29   sta $297ce2,x
$19:dd8f  12 cc		 ora ($cc)
$19:dd91  03 e2		 ora $e2,s
$19:dd93  67 06		 adc [$06]
$19:dd95  78			sei
$19:dd96  30 ca		 bmi $dd62
$19:dd98  45 c2		 eor $c2
$19:dd9a  31 89		 and ($89),y
$19:dd9c  d0 70		 bne $de0e
$19:dd9e  43 9a		 eor $9a,s
$19:dda0  8a			txa
$19:dda1  2e c6 40	  rol $40c6
$19:dda4  8e 08 a8	  stx $a808
$19:dda7  a4 11		 ldy $11
$19:dda9  e3 18		 sbc $18,s
$19:ddab  8a			txa
$19:ddac  9d c0 32	  sta $32c0,x
$19:ddaf  10 89		 bpl $dd3a
$19:ddb1  44 19 66	  mvp $66,$19
$19:ddb4  00 b0		 brk #$b0
$19:ddb6  94 42		 sty $42,x
$19:ddb8  20 dc 24	  jsr $24dc
$19:ddbb  68			pla
$19:ddbc  92 02		 sta ($02)
$19:ddbe  0a			asl a
$19:ddbf  29 00 88	  and #$8800
$19:ddc2  04 42		 tsb $42
$19:ddc4  28			plp
$19:ddc5  29 05 90	  and #$9005
$19:ddc8  c2 22		 rep #$22
$19:ddca  8a			txa
$19:ddcb  80 08		 bra $ddd5
$19:ddcd  8c e2 08	  sty $08e2
$19:ddd0  b6 22		 ldx $22,y
$19:ddd2  48			pha
$19:ddd3  41 15		 eor ($15,x)
$19:ddd5  00 95		 brk #$95
$19:ddd7  02 48		 cop #$48
$19:ddd9  41 55		 eor ($55,x)
$19:dddb  04 95		 tsb $95
$19:dddd  09 b9 f8	  ora #$f8b9
$19:dde0  12 a0		 ora ($a0)
$19:dde2  8e 09 b8	  stx $b809
$19:dde5  54 14 a0	  mvn $a0,$14
$19:dde8  19 09 28	  ora $2809,y
$19:ddeb  54 13 c0	  mvn $c0,$13
$19:ddee  0b			phd
$19:ddef  09 29 f8	  ora #$f829
$19:ddf2  02 20		 cop #$20
$19:ddf4  b2 09		 lda ($09)
$19:ddf6  39 f8 16	  and $16f8,y
$19:ddf9  40			rti
$19:ddfa  11 09		 ora ($09),y
$19:ddfc  38			sec
$19:ddfd  70 67		 bvs $de66
$19:ddff  12 88		 ora ($88)
$19:de01  84 90		 sty $90
$19:de03  fc 04 90	  jsr ($9004,x)
$19:de06  52 04		 eor ($04)
$19:de08  91 f8		 sta ($f8),y
$19:de0a  49 50 9a	  eor #$9a50
$19:de0d  00 c9		 brk #$c9
$19:de0f  1c 13 41	  trb $4113
$19:de12  c5 a2		 cmp $a2
$19:de14  d6 6e		 dec $6e,x
$19:de16  93 49		 sta ($49,s),y
$19:de18  b9 dc 1d	  lda $1ddc,y
$19:de1b  20 e4 15	  jsr $15e4
$19:de1e  08			php
$19:de1f  29 41 d6	  and #$d641
$19:de22  2b			pld
$19:de23  d2 7c		 cmp ($7c)
$19:de25  8a			txa
$19:de26  d9 24 ea	  cmp $ea24,y
$19:de29  80 7f		 bra $deaa
$19:de2b  00 1c		 brk #$1c
$19:de2d  58			cli
$19:de2e  80 fe		 bra $de2e
$19:de30  00 a8		 brk #$a8
$19:de32  a4 c9		 ldy $c9
$19:de34  20 21 80	  jsr $8021
$19:de37  6a			ror a
$19:de38  14 57		 trb $57
$19:de3a  04 a2		 tsb $a2
$19:de3c  14 f0		 trb $f0
$19:de3e  b9 c1 c8	  lda $c8c1,y
$19:de41  0a			asl a
$19:de42  51 6c		 eor ($6c),y
$19:de44  92 b0		 sta ($b0)
$19:de46  4c a4 cf	  jmp $cfa4
$19:de49  17 a9		 ora [$a9],y
$19:de4b  30 44		 bmi $de91
$19:de4d  30 0b		 bmi $de5a
$19:de4f  10 64		 bpl $deb5
$19:de51  0b			phd
$19:de52  d5 22		 cmp $22,x
$19:de54  88			dey
$19:de55  f2 5d		 sbc ($5d)
$19:de57  08			php
$19:de58  0c 81 c2	  tsb $c281
$19:de5b  cb			wai
$19:de5c  00 98		 brk #$98
$19:de5e  00 04		 brk #$04
$19:de60  a0 31		 ldy #$31
$19:de62  05 a0		 ora $a0
$19:de64  ac d2 02	  ldy $02d2
$19:de67  be 10 f0	  ldx $f010,y
$19:de6a  a2 c1		 ldx #$c1
$19:de6c  67 e1		 adc [$e1]
$19:de6e  f0 85		 beq $ddf5
$19:de70  2e 0c fa	  rol $fa0c
$19:de73  0c 84 24	  tsb $2484
$19:de76  83 04		 sta $04,s
$19:de78  a1 10		 lda ($10,x)
$19:de7a  c1 d8		 cmp ($d8,x)
$19:de7c  31 0a		 and ($0a),y
$19:de7e  38			sec
$19:de7f  57 18		 eor [$18],y
$19:de81  8b			phb
$19:de82  81 e0		 sta ($e0,x)
$19:de84  6b			rtl
$19:de85  e0 79		 cpx #$79
$19:de87  14 38		 trb $38
$19:de89  ae 30 96	  ldx $9630
$19:de8c  50 4b		 bvc $ded9
$19:de8e  89 21 08	  bit #$0821
$19:de91  3a			dec a
$19:de92  04 02		 tsb $02
$19:de94  5e f1 16	  lsr $16f1,x
$19:de97  fc 01 45	  jsr ($4501,x)
$19:de9a  7c 20 b2	  jmp ($b220,x)
$19:de9d  80 c2		 bra $de61
$19:de9f  19 41 3e	  ora $3e41,y
$19:dea2  24 84		 bit $84
$19:dea4  25 bc		 and $bc
$19:dea6  33 f8		 and ($f8,s),y
$19:dea8  17 f3		 ora [$f3],y
$19:deaa  ff 0c 80 10   sbc $10800c,x
$19:deae  40			rti
$19:deaf  7e 0b b4	  ror $b40b,x
$19:deb2  26 1c		 rol $1c
$19:deb4  f0 7d		 beq $df33
$19:deb6  ed c1 9e	  sbc $9ec1
$19:deb9  be 06 1e	  ldx $1e06,y
$19:debc  fc 78 33	  jsr ($3378,x)
$19:debf  70 60		 bvs $df21
$19:dec1  ed e0 a0	  sbc $a0e0
$19:dec4  1d c8 f4	  ora $f4c8,x
$19:dec7  27 c2		 and [$c2]
$19:dec9  4c 85 40	  jmp $4085
$19:decc  ee 48 81	  inc $8148
$19:decf  3e 10 ec	  rol $ec10,x
$19:ded2  2c 07 73	  bit $7307
$19:ded5  4b			phk
$19:ded6  81 f0		 sta ($f0,x)
$19:ded8  5b			tcd
$19:ded9  ff 41 75 13   sbc $137541,x
$19:dedd  d4 2a		 pei ($2a)
$19:dedf  2e a1 35	  rol $35a1
$19:dee2  c2 b5		 rep #$b5
$19:dee4  a8			tay
$19:dee5  0b			phd
$19:dee6  64 3e		 stz $3e
$19:dee8  09 ae cf	  ora #$cfae
$19:deeb  e5 70		 sbc $70
$19:deed  3e 1b ac	  rol $ac1b,x
$19:def0  0e c4 8f	  asl $8fc4
$19:def3  0c 02 2d	  tsb $2d02
$19:def6  30 09		 bmi $df01
$19:def8  24 c8		 bit $c8
$19:defa  26 53		 rol $53
$19:defc  20 a0 f6	  jsr $f6a0
$19:deff  98			tya
$19:df00  dc 56 a9	  jml [$a956]
$19:df03  81 5e		 sta ($5e,x)
$19:df05  78			sei
$19:df06  84 9a		 sty $9a
$19:df08  29 81 08	  and #$0881
$19:df0b  78			sei
$19:df0c  f4 74 0b	  pea $0b74
$19:df0f  54 d8 13	  mvn $13,$d8
$19:df12  8d 4b bd	  sta $bd4b
$19:df15  05 aa		 ora $aa
$19:df17  78			sei
$19:df18  0c 9e 3d	  tsb $3d9e
$19:df1b  1e 92 d5	  asl $d592,x
$19:df1e  3c 44 e3	  bit $e344,x
$19:df21  91 13		 sta ($13),y
$19:df23  94 16		 sty $16,x
$19:df25  0c b2 89	  tsb $89b2
$19:df28  35 40		 and $40,x
$19:df2a  7a			ply
$19:df2b  30 a8		 bmi $ded5
$19:df2d  85 0d		 sta $0d
$19:df2f  ea			nop
$19:df30  30 15		 bmi $df47
$19:df32  a8			tay
$19:df33  bb			tyx
$19:df34  46 10		 lsr $10
$19:df36  af 0a 9a e0   lda $e09a0a
$19:df3a  98			tya
$19:df3b  62 bf 28	  per $07fd
$19:df3e  d4 02		 pei ($02)
$19:df40  c6 b8		 dec $b8
$19:df42  26 88		 rol $88
$19:df44  92 0d		 sta ($0d)
$19:df46  43 eb		 eor $eb,s
$19:df48  23 b9		 and $b9,s
$19:df4a  ae 12 e6	  ldx $e612
$19:df4d  bf 4c 1b 19   lda $191b4c,x
$19:df51  30 6c		 bmi $dfbf
$19:df53  d4 c9		 pei ($c9)
$19:df55  b5 13		 lda $13,x
$19:df57  26 db		 rol $db
$19:df59  b8			clv
$19:df5a  1a			inc a
$19:df5b  a9 8b c3	  lda #$c38b
$19:df5e  0a			asl a
$19:df5f  84 68		 sty $68
$19:df61  92 a5		 sta ($a5)
$19:df63  12 80		 ora ($80)
$19:df65  6c 89 ca	  jmp ($ca89)
$19:df68  87 42		 sta [$42]
$19:df6a  f0 23		 beq $df8f
$19:df6c  ca			dex
$19:df6d  01 46		 ora ($46,x)
$19:df6f  82 20 48	  brl $2792
$19:df72  74 08		 stz $08,x
$19:df74  79 46 85	  adc $8546,y
$19:df77  20 a4 10	  jsr $10a4
$19:df7a  42 90		 wdm #$90
$19:df7c  42 ac		 wdm #$ac
$19:df7e  c5 2f		 cmp $2f
$19:df80  2f 0d 28 ce   and $ce280d
$19:df84  97 63		 sta [$63],y
$19:df86  70 c4		 bvs $df4c
$19:df88  4a			lsr a
$19:df89  d4 7d		 pei ($7d)
$19:df8b  2a			rol a
$19:df8c  74 10		 stz $10,x
$19:df8e  94 25		 sty $25,x
$19:df90  f0 a6		 beq $df38
$19:df92  41 05		 eor ($05,x)
$19:df94  c1 17		 cmp ($17,x)
$19:df96  80 46		 bra $dfde
$19:df98  07 aa		 ora [$aa]
$19:df9a  6e 03 e8	  ror $e803
$19:df9d  43 c5		 eor $c5,s
$19:df9f  c1 67		 cmp ($67,x)
$19:dfa1  24 84		 bit $84
$19:dfa3  3c 1c 0b	  bit $0b1c,x
$19:dfa6  90 6d		 bcc $e015
$19:dfa8  84 21		 sty $21
$19:dfaa  7a			ply
$19:dfab  11 0b		 ora ($0b),y
$19:dfad  59 bc 16	  eor $16bc,y
$19:dfb0  e2 c7		 sep #$c7
$19:dfb2  0a			asl a
$19:dfb3  04 1a		 tsb $1a
$19:dfb5  01 15		 ora ($15,x)
$19:dfb7  55 09		 eor $09,x
$19:dfb9  b8			clv
$19:dfba  15 ed		 ora $ed,x
$19:dfbc  0b			phd
$19:dfbd  80 43		 bra $e002
$19:dfbf  2d 84 90	  and $9084
$19:dfc2  70 83		 bvs $df47
$19:dfc4  88			dey
$19:dfc5  2d ce 52	  and $52ce
$19:dfc8  86 40		 stx $40
$19:dfca  31 c6		 and ($c6),y
$19:dfcc  f0 83		 beq $df51
$19:dfce  43 62		 eor $62,s
$19:dfd0  10 4c		 bpl $e01e
$19:dfd2  31 78		 and ($78),y
$19:dfd4  62 d0 08	  per $e8a7
$19:dfd7  c8			iny
$19:dfd8  50 04		 bvc $dfde
$19:dfda  4e cc 1b	  lsr $1bcc
$19:dfdd  48			pha
$19:dfde  20 8e 21	  jsr $218e
$19:dfe1  89 24 80	  bit #$8024
$19:dfe4  b8			clv
$19:dfe5  21 10		 and ($10,x)
$19:dfe7  8b			phb
$19:dfe8  d3 d0		 cmp ($d0,s),y
$19:dfea  1f 82 fd 06   ora $06fd82,x
$19:dfee  bb			tyx
$19:dfef  bc 00 d6	  ldy $d600,x
$19:dff2  18			clc
$19:dff3  ca			dex
$19:dff4  01 f4		 ora ($f4,x)
$19:dff6  21 90		 and ($90,x)
$19:dff8  a8			tay
$19:dff9  06 b8		 asl $b8
$19:dffb  64 0f		 stz $0f
$19:dffd  00 1b		 brk #$1b
$19:dfff  06 b1		 asl $b1
$19:e001  84 10		 sty $10
$19:e003  68			pla
$19:e004  74 16		 stz $16,x
$19:e006  1b			tcs
$19:e007  96 a0		 stx $a0,y
$19:e009  42 15		 wdm #$15
$19:e00b  02 8d		 cop #$8d
$19:e00d  00 0a		 brk #$0a
$19:e00f  2c cd 86	  bit $86cd
$19:e012  18			clc
$19:e013  75 d9		 adc $d9,x
$19:e015  16 45		 asl $45,x
$19:e017  84 42		 sty $42
$19:e019  60			rts
$19:e01a  cd b2 48	  cmp $48b2
$19:e01d  ce 34 00	  dec $0034
$19:e020  08			php
$19:e021  34 c0		 bit $c0,x
$19:e023  45 2e		 eor $2e
$19:e025  f1 85		 sbc ($85),y
$19:e027  63 05		 adc $05,s
$19:e029  64 36		 stz $36
$19:e02b  13 f9		 ora ($f9,s),y
$19:e02d  0f 45 5a 10   ora $105a45
$19:e031  e8			inx
$19:e032  31 10		 and ($10),y
$19:e034  40			rti
$19:e035  02 4c		 cop #$4c
$19:e037  07 fc		 ora [$fc]
$19:e039  92 00		 sta ($00)
$19:e03b  26 23		 rol $23
$19:e03d  20 24 00	  jsr $0024
$19:e040  30 46		 bmi $e088
$19:e042  43 08		 eor $08,s
$19:e044  5d 05 e9	  eor $e905,x
$19:e047  a1 ce		 lda ($ce,x)
$19:e049  72 b6		 adc ($b6)
$19:e04b  0c 85 dc	  tsb $dc85
$19:e04e  36 e6		 rol $e6,x
$19:e050  99 3c 04	  sta $043c,y
$19:e053  80 10		 bra $e065
$19:e055  d8			cld
$19:e056  33 dc		 and ($dc,s),y
$19:e058  48			pha
$19:e059  00 25		 brk #$25
$19:e05b  37 4a		 and [$4a],y
$19:e05d  40			rti
$19:e05e  9d c2 48	  sta $48c2,x
$19:e061  08			php
$19:e062  45 78		 eor $78
$19:e064  54 0f 91	  mvn $91,$0f
$19:e067  80 3f		 bra $e0a8
$19:e069  02 12		 cop #$12
$19:e06b  9f 19 83 b9   sta $b98319,x
$19:e06f  59 c1 01	  eor $01c1,y
$19:e072  81 09		 sta ($09,x)
$19:e074  82 41 a4	  brl $84b8
$19:e077  2e 04 48	  rol $4804
$19:e07a  d4 01		 pei ($01)
$19:e07c  70 1c		 bvs $e09a
$19:e07e  80 50		 bra $e0d0
$19:e080  21 11		 and ($11,x)
$19:e082  8d a0 64	  sta $64a0
$19:e085  84 82		 sty $82
$19:e087  e8			inx
$19:e088  18			clc
$19:e089  d4 62		 pei ($62)
$19:e08b  21 d4		 and ($d4,x)
$19:e08d  35 04		 and $04,x
$19:e08f  62 04 32	  per $1296
$19:e092  13 18		 ora ($18,s),y
$19:e094  c4 86		 cpy $86
$19:e096  41 d5		 eor ($d5,x)
$19:e098  59 8c 28	  eor $288c,y
$19:e09b  80 22		 bra $e0bf
$19:e09d  e0 83 c4	  cpx #$c483
$19:e0a0  e4 10		 cpx $10
$19:e0a2  8f 21 a8 61   sta $61a821
$19:e0a6  64 e1		 stz $e1
$19:e0a8  17 04		 ora [$04],y
$19:e0aa  32 1d		 and ($1d)
$19:e0ac  28			plp
$19:e0ad  80 6e		 bra $e11d
$19:e0af  94 23		 sty $23,x
$19:e0b1  1a			inc a
$19:e0b2  04 54		 tsb $54
$19:e0b4  04 2a		 tsb $2a
$19:e0b6  3a			dec a
$19:e0b7  64 30		 stz $30
$19:e0b9  27 80		 and [$80]
$19:e0bb  2c 1a 83	  bit $831a
$19:e0be  69 09 03	  adc #$0309
$19:e0c1  6c 74 21	  jmp ($2174)
$19:e0c4  20 6e 01	  jsr $016e
$19:e0c7  43 19		 eor $19,s
$19:e0c9  19 07 59	  ora $5907,y
$19:e0cc  ee 31 14	  inc $1431
$19:e0cf  68			pla
$19:e0d0  75 d6		 adc $d6,x
$19:e0d2  63 09		 adc $09,s
$19:e0d4  46 87		 lsr $87
$19:e0d6  60			rts
$19:e0d7  6a			ror a
$19:e0d8  30 14		 bmi $e0ee
$19:e0da  68			pla
$19:e0db  76 59		 ror $59,x
$19:e0dd  e1 06		 sbc ($06,x)
$19:e0df  26 8e		 rol $8e
$19:e0e1  a9 9e 10	  lda #$109e
$19:e0e4  e2 a0		 sep #$a0
$19:e0e6  ea			nop
$19:e0e7  d9 e1 09	  cmp $09e1,y
$19:e0ea  88			dey
$19:e0eb  17 03		 ora [$03],y
$19:e0ed  76 5f		 ror $5f,x
$19:e0ef  e8			inx
$19:e0f0  84 04		 sty $04
$19:e0f2  e2 22		 sep #$22
$19:e0f4  00 80		 brk #$80
$19:e0f6  21 00		 and ($00,x)
$19:e0f8  f2 02		 sbc ($02)
$19:e0fa  00 65		 brk #$65
$19:e0fc  01 fc		 ora ($fc,x)
$19:e0fe  59 e4 86	  eor $86e4,y
$19:e101  11 70		 ora ($70),y
$19:e103  01 c1		 ora ($c1,x)
$19:e105  1a			inc a
$19:e106  22 e0 70 0c   jsl $0c70e0
$19:e10a  43 ae		 eor $ae,s
$19:e10c  2e 05 a8	  rol $a805
$19:e10f  26 c4		 rol $c4
$19:e111  5c 0a 10 51   jml $51100a
$19:e115  08			php
$19:e116  b8			clv
$19:e117  13 20		 ora ($20,s),y
$19:e119  a9 11		 lda #$11
$19:e11b  e0 c4 56	  cpx #$56c4
$19:e11e  02 2e		 cop #$2e
$19:e120  08			php
$19:e121  54 3d 6e	  mvn $6e,$3d
$19:e124  34 08		 bit $08,x
$19:e126  4b			phk
$19:e127  94 4c		 sty $4c,x
$19:e129  93 00		 sta ($00,s),y
$19:e12b  89 1c		 bit #$1c
$19:e12d  43 48		 eor $48,s
$19:e12f  c8			iny
$19:e130  18			clc
$19:e131  10 9c		 bpl $e0cf
$19:e133  5b			tcd
$19:e134  a3 12		 lda $12,s
$19:e136  70 86		 bvs $e0be
$19:e138  d0 54		 bne $e18e
$19:e13a  43 51		 eor $51,s
$19:e13c  7c 84 09	  jmp ($0984,x)
$19:e13f  f8			sed
$19:e140  3d 45 98	  and $9845,x
$19:e143  2f 40 86 20   and $208640
$19:e147  e1 7a		 sbc ($7a,x)
$19:e149  8f 55 66 03   sta $036655
$19:e14d  41 29		 eor ($29,x)
$19:e14f  03 e4		 ora $e4,s
$19:e151  21 70		 and ($70,x)
$19:e153  f0 58		 beq $e1ad
$19:e155  79 16 61	  adc $6116,y
$19:e158  13 83		 ora ($83,s),y
$19:e15a  97 c5		 sta [$c5],y
$19:e15c  f2 10		 sbc ($10)
$19:e15e  e8			inx
$19:e15f  62 dc 37	  per $193e
$19:e162  40			rti
$19:e163  f0 80		 beq $e0e5
$19:e165  45 c3		 eor $c3
$19:e167  36 d2		 rol $d2,x
$19:e169  1d 33 21	  ora $2133,x
$19:e16c  35 07		 and $07,x
$19:e16e  e2 6d		 sep #$6d
$19:e170  0b			phd
$19:e171  20 9c 22	  jsr $229c
$19:e174  b3 07		 lda ($07,s),y
$19:e176  d9 75 96	  cmp $9675,y
$19:e179  64 ef		 stz $ef
$19:e17b  15 08		 ora $08,x
$19:e17d  3b			tsc
$19:e17e  4b			phk
$19:e17f  b0 a1		 bcs $e122
$19:e181  07 31		 ora [$31]
$19:e183  76 54		 ror $54,x
$19:e185  21 0b		 and ($0b,x)
$19:e187  87 01		 sta [$01]
$19:e189  04 c4		 tsb $c4
$19:e18b  30 60		 bmi $e1ed
$19:e18d  58			cli
$19:e18e  87 06		 sta [$06]
$19:e190  12 12		 ora ($12)
$19:e192  13 87		 ora ($87,s),y
$19:e194  20 41 04	  jsr $0441
$19:e197  23 10		 and $10,s
$19:e199  43 02		 eor $02,s
$19:e19b  24 46		 bit $46
$19:e19d  20 81 04	  jsr $0481
$19:e1a0  80 b8		 bra $e15a
$19:e1a2  09 2e		 ora #$2e
$19:e1a4  26 90		 rol $90
$19:e1a6  8c 27 01	  sty $0127
$19:e1a9  3e 06 90	  rol $9006,x
$19:e1ac  63 02		 adc $02,s
$19:e1ae  94 4d		 sty $4d,x
$19:e1b0  21 08		 and ($08,x)
$19:e1b2  88			dey
$19:e1b3  ab			plb
$19:e1b4  04 d2		 tsb $d2
$19:e1b6  0b			phd
$19:e1b7  00 59		 brk #$59
$19:e1b9  89 a4		 bit #$a4
$19:e1bb  15 40		 ora $40,x
$19:e1bd  ba			tsx
$19:e1be  13 48		 ora ($48,s),y
$19:e1c0  28			plp
$19:e1c1  c1 82		 cmp ($82,x)
$19:e1c3  26 90		 rol $90
$19:e1c5  87 c2		 sta [$c2]
$19:e1c7  99 02 0a	  sta $0a02,y
$19:e1ca  13 c9		 ora ($c9,s),y
$19:e1cc  1d d2 08	  ora $08d2,x
$19:e1cf  76 18		 ror $18,x
$19:e1d1  43 a8		 eor $a8,s
$19:e1d3  39 50 21	  and $2150,y
$19:e1d6  b0 8e		 bcs $e166
$19:e1d8  06 84		 asl $84
$19:e1da  35 11		 and $11,x
$19:e1dc  b8			clv
$19:e1dd  76 87		 ror $87,x
$19:e1df  64 46		 stz $46
$19:e1e1  12 10		 ora ($10)
$19:e1e3  8a			txa
$19:e1e4  7f 96 3b 4e   adc $4e3b96,x
$19:e1e8  59 09 3b	  eor $3b09,y
$19:e1eb  64 94		 stz $94
$19:e1ed  ed 94 3c	  sbc $3c94
$19:e1f0  6e 3c c1	  ror $c13c
$19:e1f3  da			phx
$19:e1f4  73 08		 adc ($08,s),y
$19:e1f6  40			rti
$19:e1f7  4b			phk
$19:e1f8  2e e1 09	  rol $09e1
$19:e1fb  3b			tsc
$19:e1fc  83 b0		 sta $b0,s
$19:e1fe  5f 00 a9 c7   eor $c7a900,x
$19:e202  61 01		 adc ($01,x)
$19:e204  80 40		 bra $e246
$19:e206  cd a1 ec	  cmp $eca1
$19:e209  43 83		 eor $83,s
$19:e20b  60			rts
$19:e20c  06 e1		 asl $e1
$19:e20e  f4 43 89	  pea $8943
$19:e211  f6 16		 inc $16,x
$19:e213  60			rts
$19:e214  b3 02		 lda ($02,s),y
$19:e216  b0 fa		 bcs $e212
$19:e218  98			tya
$19:e219  1e 56 1f	  asl $1f56,x
$19:e21c  43 57		 eor $57,s
$19:e21e  ca			dex
$19:e21f  c3 e6		 cmp $e6,s
$19:e221  75 79		 adc $79,x
$19:e223  58			cli
$19:e224  65 0f		 adc $0f
$19:e226  ff 2b 0c a8   sbc $a80c2b,x
$19:e22a  29 6a		 and #$6a
$19:e22c  41 4f		 eor ($4f,x)
$19:e22e  97 d6		 sta [$d6],y
$19:e230  08			php
$19:e231  e4 5f		 cpx $5f
$19:e233  e7 fe		 sbc [$fe]
$19:e235  19 00 24	  ora $2400,y
$19:e238  01 18		 ora ($18,x)
$19:e23a  19 28 53	  ora $5328,y
$19:e23d  3f 2c 09 72   and $72092c,x
$19:e241  11 42		 ora ($42),y
$19:e243  e0 ae 41	  cpx #$41ae
$19:e246  06 8b		 asl $8b
$19:e248  30 4c		 bmi $e296
$19:e24a  0f ba 10 69   ora $6910ba
$19:e24e  14 88		 trb $88
$19:e250  7b			tdc
$19:e251  b1 10		 lda ($10),y
$19:e253  14 89		 trb $89
$19:e255  7b			tdc
$19:e256  a9 07		 lda #$07
$19:e258  71 39		 adc ($39),y
$19:e25a  8f 21 56 51   sta $515621
$19:e25e  85 52		 sta $52
$19:e260  c1 46		 cmp ($46,x)
$19:e262  e7 08		 sbc [$08]
$19:e264  ba			tsx
$19:e265  1f c9 2c 34   ora $342cc9,x
$19:e269  83 c8		 sta $c8,s
$19:e26b  8c 83 08	  sty $0883
$19:e26e  7f 25 20 9f   adc $9f2025,x
$19:e272  40			rti
$19:e273  6e 54 45	  ror $4554
$19:e276  00 8c		 brk #$8c
$19:e278  82 40 2f	  brl $11bb
$19:e27b  35 d0		 and $d0,x
$19:e27d  24 4e		 bit $4e
$19:e27f  21 08		 and ($08,x)
$19:e281  ba			tsx
$19:e282  a9 cd		 lda #$cd
$19:e284  90 0a		 bcc $e290
$19:e286  02 44		 cop #$44
$19:e288  86 14		 stx $14
$19:e28a  fe 4d 51	  inc $514d,x
$19:e28d  57 1c		 eor [$1c],y
$19:e28f  42 88		 wdm #$88
$19:e291  78			sei
$19:e292  11 90		 ora ($90),y
$19:e294  4a			lsr a
$19:e295  17 6b		 ora [$6b],y
$19:e297  06 11		 asl $11
$19:e299  1c 61 68	  trb $6861
$19:e29c  0e 01 51	  asl $5101
$19:e29f  85 50		 sta $50
$19:e2a1  f0 51		 beq $e2f4
$19:e2a3  88			dey
$19:e2a4  46 51		 lsr $51
$19:e2a6  b0 60		 bcs $e308
$19:e2a8  70 50		 bvs $e2fa
$19:e2aa  12 e8		 ora ($e8)
$19:e2ac  32 a7		 and ($a7)
$19:e2ae  f2 0a		 sbc ($0a)
$19:e2b0  0a			asl a
$19:e2b1  d4 e2		 pei ($e2)
$19:e2b3  2f 41 27 14   and $142741
$19:e2b7  0d e8 70	  ora $70e8
$19:e2ba  23 c0		 and $c0,s
$19:e2bc  9a			txs
$19:e2bd  82 15 00	  brl $e2d5
$19:e2c0  e7 ac		 sbc [$ac]
$19:e2c2  46 00		 lsr $00
$19:e2c4  37 1e		 and [$1e],y
$19:e2c6  02 14		 cop #$14
$19:e2c8  a2 62 4b	  ldx #$4b62
$19:e2cb  82 0d c0	  brl $a2db
$19:e2ce  d4 30		 pei ($30)
$19:e2d0  c1 c0		 cmp ($c0,x)
$19:e2d2  50 16		 bvc $e2ea
$19:e2d4  22 5a 1c 03   jsl $031c5a
$19:e2d8  f0 22		 beq $e2fc
$19:e2da  44 51 ff	  mvp $ff,$51
$19:e2dd  7f d1 ab 01   adc $01abd1,x
$19:e2e1  85 42		 sta $42
$19:e2e3  60			rts
$19:e2e4  1d dc 04	  ora $04dc,x
$19:e2e7  02 16		 cop #$16
$19:e2e9  30 08		 bmi $e2f3
$19:e2eb  3f 75 ec 10   and $10ec75,x
$19:e2ef  98			tya
$19:e2f0  11 d8		 ora ($d8),y
$19:e2f2  3b			tsc
$19:e2f3  c4 11		 cpy $11
$19:e2f5  3d 84 27	  and $2784,x
$19:e2f8  bc 52 18	  ldy $1852,x
$19:e2fb  3c 12 0b	  bit $0b12,x
$19:e2fe  ce 26 8c	  dec $8c26
$19:e301  58			cli
$19:e302  96 30		 stx $30,y
$19:e304  22 49 bc c1   jsl $c1bc49
$19:e308  ec 11 18	  cpx $1811
$19:e30b  4c 05 1a	  jmp $1a05
$19:e30e  30 c8		 bmi $e2d8
$19:e310  28			plp
$19:e311  dc 0f e3	  jml [$e30f]
$19:e314  07 85		 ora [$85]
$19:e316  41 a0		 eor ($a0,x)
$19:e318  9c d3 c8	  stz $c8d3
$19:e31b  08			php
$19:e31c  c2 07		 rep #$07
$19:e31e  07 e6		 ora [$e6]
$19:e320  a2 05 e6	  ldx #$e605
$19:e323  10 a4		 bpl $e2c9
$19:e325  a0 29 04	  ldy #$0429
$19:e328  62 1c ee	  per $d147
$19:e32b  02 70		 cop #$70
$19:e32d  08			php
$19:e32e  c0 5a 02	  cpy #$025a
$19:e331  70 12		 bvs $e345
$19:e333  8a			txa
$19:e334  08			php
$19:e335  52 18		 eor ($18)
$19:e337  4c 1e 01	  jmp $011e
$19:e33a  ce 2e 84	  dec $842e
$19:e33d  31 f8		 and ($f8),y
$19:e33f  10 7e		 bpl $e3bf
$19:e341  71 e4		 adc ($e4),y
$19:e343  20 10 d8	  jsr $d810
$19:e346  0c 19 7c	  tsb $7c19
$19:e349  30 d5		 bmi $e320
$19:e34b  08			php
$19:e34c  40			rti
$19:e34d  79 a5 d1	  adc $d1a5,y
$19:e350  87 92		 sta [$92]
$19:e352  c7 fe		 cmp [$fe]
$19:e354  6c 36 d0	  jmp ($d036)
$19:e357  ac 81 64	  ldy $6481
$19:e35a  1d f4 e0	  ora $e0f4,x
$19:e35d  37 c0		 and [$c0],y
$19:e35f  12 34		 ora ($34)
$19:e361  20 39 40	  jsr $4039
$19:e364  3b			tsc
$19:e365  fc 25 88	  jsr ($8825,x)
$19:e368  85 c7		 sta $c7
$19:e36a  04 22		 tsb $22
$19:e36c  13 b4		 ora ($b4,s),y
$19:e36e  4e 31 53	  lsr $5331
$19:e371  8d 64 e3	  sta $e364
$19:e374  9d 38 f8	  sta $f838,x
$19:e377  4e 24 53	  lsr $5324
$19:e37a  9b			txy
$19:e37b  24 e6		 bit $e6
$19:e37d  dd 39 bc	  cmp $bc39,x
$19:e380  4e 70 53	  lsr $5370
$19:e383  9c 64 e7	  stz $e764
$19:e386  2d 39 d0	  and $d039
$19:e389  4e 75 53	  lsr $5375
$19:e38c  9d a4 e7	  sta $e7a4,x
$19:e38f  7d 39 e4	  adc $e439,x
$19:e392  4e 7d 53	  lsr $537d
$19:e395  9f a4 e7 fd   sta $fde7a4,x
$19:e399  39 84 4e	  and $4e84,y
$19:e39c  a2 53 a8	  ldx #$a853
$19:e39f  e4 ea		 cpx $ea
$19:e3a1  4d 3a 98	  eor $983a
$19:e3a4  4e 84 01	  lsr $0184
$19:e3a7  44 9d 53	  mvp $53,$9d
$19:e3aa  a7 55		 lda [$55]
$19:e3ac  89 d5		 bit #$d5
$19:e3ae  8a			txa
$19:e3af  75 6c		 adc $6c,x
$19:e3b1  9d 69 a7	  sta $a769,x
$19:e3b4  5e 09 d7	  lsr $d709,x
$19:e3b7  aa			tax
$19:e3b8  75 f4		 adc $f4,x
$19:e3ba  9d 7f a7	  sta $a77f,x
$19:e3bd  50 89		 bvc $e348
$19:e3bf  dd 0a 77	  cmp $770a,x
$19:e3c2  7c 9d ed	  jmp ($ed9d,x)
$19:e3c5  a7 7f		 lda [$7f]
$19:e3c7  09 dc		 ora #$dc
$19:e3c9  ca			dex
$19:e3ca  79 74 9e	  adc $9e74,y
$19:e3cd  6d a7 9f	  adc $9fa7
$19:e3d0  89 e4		 bit #$e4
$19:e3d2  ea			nop
$19:e3d3  7b			tdc
$19:e3d4  7c 9e e7	  jmp ($e79e,x)
$19:e3d7  a7 bc		 lda [$bc]
$19:e3d9  09 ec		 ora #$ec
$19:e3db  0a			asl a
$19:e3dc  7d 84 9f	  adc $9f84,x
$19:e3df  79 a7 d0	  adc $d0a7,y
$19:e3e2  38			sec
$19:e3e3  01 60		 ora ($60,x)
$19:e3e5  a5 13		 lda $13
$19:e3e7  f2 ba		 sbc ($ba)
$19:e3e9  4f 4b cb 52   eor $52cb4b
$19:e3ed  2f 2d 9e 7f   and $7f9e2d
$19:e3f1  ff ff 95 d3   sbc $d395ff,x
$19:e3f5  22 5e 5d a1   jsl $a15d5e
$19:e3f9  79 7a e5	  adc $e57a,y
$19:e3fc  e5 fd		 sbc $fd
$19:e3fe  1d 86 02	  ora $0286,x
$19:e401  58			cli
$19:e402  38			sec
$19:e403  ed 01 36	  sbc $3601
$19:e406  94 05		 sty $05,x
$19:e408  12 d8		 ora ($d8)
$19:e40a  d4 4b		 pei ($4b)
$19:e40c  86 a0		 stx $a0
$19:e40e  1d db 53	  ora $53db,x
$19:e411  40			rti
$19:e412  2b			pld
$19:e413  a7 31		 lda [$31]
$19:e415  88			dey
$19:e416  be f6 22	  ldx $22f6,y
$19:e419  c4 a8		 cpy $a8
$19:e41b  27 70		 and [$70]
$19:e41d  84 16		 sty $16
$19:e41f  0e 6b 41	  asl $416b
$19:e422  6f a6 25 cc   adc $cc25a6
$19:e426  bd d7 32	  lda $32d7,x
$19:e429  cc 68 4d	  cpy $4d68
$19:e42c  f4 c2 bf	  pea $bfc2
$19:e42f  97 b3		 sta [$b3],y
$19:e431  42 6e		 wdm #$6e
$19:e433  b4 b6		 ldy $b6,x
$19:e435  86 e7		 stx $e7
$19:e437  4c 08 61	  jmp $6108
$19:e43a  7a			ply
$19:e43b  a1 85		 lda ($85,x)
$19:e43d  94 d1		 sty $d1,x
$19:e43f  1c e9 7d	  trb $7de9
$19:e442  18			clc
$19:e443  2f 44 60 b2   and $b26044
$19:e447  5a			phy
$19:e448  2c 28 84	  bit $8428
$19:e44b  77 9a		 adc [$9a],y
$19:e44d  29 dc		 and #$dc
$19:e44f  08			php
$19:e450  47 00		 eor [$00]
$19:e452  e6 94		 inc $94
$19:e454  1e a5 46	  asl $46a5,x
$19:e457  28			plp
$19:e458  b5 b8		 lda $b8,x
$19:e45a  c8			iny
$19:e45b  f8			sed
$19:e45c  a3 23		 lda $23,s
$19:e45e  e9 8c		 sbc #$8c
$19:e460  8f d0 32 3f   sta $3f32d0
$19:e464  b0 c8		 bcs $e42e
$19:e466  f0 8a		 beq $e3f2
$19:e468  3a			dec a
$19:e469  0d a4 8a	  ora $8aa4
$19:e46c  07 a0		 ora [$a0]
$19:e46e  28			plp
$19:e46f  06 02		 asl $02
$19:e471  42 3a		 wdm #$3a
$19:e473  e5 1d		 sbc $1d
$19:e475  6e 97 f5	  ror $f597
$19:e478  f2 e8		 sbc ($e8)
$19:e47a  97 cb		 sta [$cb],y
$19:e47c  c5 50		 cmp $50
$19:e47e  3f a1 40 f2   and $f240a1,x
$19:e482  7a			ply
$19:e483  42 0d		 wdm #$0d
$19:e485  ad ae a7	  lda $a7ae
$19:e488  e0 ba 9e	  cpx #$9eba
$19:e48b  0f 49 41 b4   ora $b44149
$19:e48f  c4 10		 cpy $10
$19:e491  f5 b0		 sbc $b0,x
$19:e493  43 f9		 eor $f9,s
$19:e495  c1 0f		 cmp ($0f,x)
$19:e497  5e a5 20	  lsr $20a5,x
$19:e49a  da			phx
$19:e49b  f4 30 7c	  pea $7c30
$19:e49e  b0 c1		 bcs $e461
$19:e4a0  f9 c3 07	  sbc $07c3,y
$19:e4a3  fc 13 86	  jsr ($8613,x)
$19:e4a6  07 00		 ora [$00]
$19:e4a8  2d 82 0c	  and $0c82
$19:e4ab  25 13		 and $13
$19:e4ad  f2 d8		 sbc ($d8)
$19:e4af  42 0b		 wdm #$0b
$19:e4b1  c3 3d		 cmp $3d,s
$19:e4b3  31 0c		 and ($0c),y
$19:e4b5  1e 01 02	  asl $0201,x
$19:e4b8  80 54		 bra $e50e
$19:e4ba  8c 43 06	  sty $0643
$19:e4bd  80 41		 bra $e500
$19:e4bf  20 16 73	  jsr $7316
$19:e4c2  10 9d		 bpl $e461
$19:e4c4  c0 ee 06	  cpy #$06ee
$19:e4c7  12 37		 ora ($37)
$19:e4c9  81 dc		 sta ($dc,x)
$19:e4cb  0d 24 85	  ora $8524
$19:e4ce  23 88		 and $88,s
$19:e4d0  16 48		 asl $48,x
$19:e4d2  8a			txa
$19:e4d3  1f d3 01 a6   ora $a601d3,x
$19:e4d7  43 f6		 eor $f6,s
$19:e4d9  68			pla
$19:e4da  3f e7 fd 4e   and $4efde7,x
$19:e4de  07 12		 ora [$12]
$19:e4e0  fd 2a 04	  sbc $042a,x
$19:e4e3  f2 5f		 sbc ($5f)
$19:e4e5  9f ff f8 c0   sta $c0f8ff,x
$19:e4e9  6a			ror a
$19:e4ea  f0 01		 beq $e4ed
$19:e4ec  01 a4		 ora ($a4,x)
$19:e4ee  94 20		 sty $20,x
$19:e4f0  6f 22 2b 18   adc $182b22
$19:e4f4  41 9b		 eor ($9b,x)
$19:e4f6  ed ed 52	  sbc $52ed
$19:e4f9  91 bc		 sta ($bc),y
$19:e4fb  13 68		 ora ($68,s),y
$19:e4fd  87 44		 sta [$44]
$19:e4ff  c8			iny
$19:e500  1d 40 e2	  ora $e240,x
$19:e503  49 90		 eor #$90
$19:e505  32 81		 and ($81)
$19:e507  e4 97		 cpx $97
$19:e509  21 0a		 and ($0a,x)
$19:e50b  40			rti
$19:e50c  19 14 03	  ora $0314,y
$19:e50f  60			rts
$19:e510  69 27		 adc #$27
$19:e512  18			clc
$19:e513  19 41 22	  ora $2241,y
$19:e516  85 51		 sta $51
$19:e518  30 1c		 bmi $e536
$19:e51a  06 01		 asl $01
$19:e51c  f6 34		 inc $34,x
$19:e51e  19 bc 07	  ora $07bc,y
$19:e521  a0 71 22	  ldy #$2271
$19:e524  48			pha
$19:e525  0d 40 f2	  ora $f240
$19:e528  4a			lsr a
$19:e529  d2 40		 cmp ($40)
$19:e52b  92 94		 sta ($94)
$19:e52d  91 24		 sta ($24),y
$19:e52f  77 05		 adc [$05],y
$19:e531  c8			iny
$19:e532  24 50		 bit $50
$19:e534  16 0a		 asl $0a,x
$19:e536  70 1b		 bvs $e553
$19:e538  90 4c		 bcc $e586
$19:e53a  13 20		 ora ($20,s),y
$19:e53c  3f 20 98 19   and $199820,x
$19:e540  48			pha
$19:e541  e6 4e		 inc $4e
$19:e543  30 59		 bmi $e59e
$19:e545  90 4c		 bcc $e593
$19:e547  1f 69 05 25   ora $250569,x
$19:e54b  08			php
$19:e54c  fc 92 a0	  jsr ($a092,x)
$19:e54f  63 03		 adc $03,s
$19:e551  3a			dec a
$19:e552  2f c0 de 83   and $83dec0
$19:e556  50 3b		 bvc $e593
$19:e558  a0 d4 0f	  ldy #$0fd4
$19:e55b  e8			inx
$19:e55c  35 04		 and $04,x
$19:e55e  3a			dec a
$19:e55f  0d 41 1e	  ora $1e41
$19:e562  9f b1 80 8f   sta $8f80b1,x
$19:e566  c9 9e		 cmp #$9e
$19:e568  09 f6		 ora #$f6
$19:e56a  19 02 3d	  ora $3d02,y
$19:e56d  06 40		 asl $40
$19:e56f  03 41		 ora $41,s
$19:e571  90 02		 bcc $e575
$19:e573  d0 52		 bne $e5c7
$19:e575  41 52		 eor ($52,x)
$19:e577  19 00 6d	  ora $6d00,y
$19:e57a  06 41		 asl $41
$19:e57c  0c 12 2c	  tsb $2c12
$19:e57f  39 e9 2d	  and $2de9,y
$19:e582  d4 3f		 pei ($3f)
$19:e584  80 15		 bra $e59b
$19:e586  0b			phd
$19:e587  a8			tay
$19:e588  f0 02		 beq $e58c
$19:e58a  a8			tay
$19:e58b  3d 51 8e	  and $8e51,x
$19:e58e  0f d4 fb 0f   ora $0ffbd4
$19:e592  97 e8		 sta [$e8],y
$19:e594  26 5f		 rol $5f
$19:e596  90 b9		 bcc $e551
$19:e598  58			cli
$19:e599  e0 0d 06	  cpx #$060d
$19:e59c  e9 27		 sbc #$27
$19:e59e  c2 02		 rep #$02
$19:e5a0  ca			dex
$19:e5a1  37 98		 and [$98],y
$19:e5a3  23 c0		 and $c0,s
$19:e5a5  1a			inc a
$19:e5a6  48			pha
$19:e5a7  d0 4e		 bne $e5f7
$19:e5a9  83 d4		 sta $d4,s
$19:e5ab  80 61		 bra $e60e
$19:e5ad  09 61		 ora #$61
$19:e5af  1b			tcs
$19:e5b0  ec 01 60	  cpx $6001
$19:e5b3  69 40		 adc #$40
$19:e5b5  5a			phy
$19:e5b6  36 40		 rol $40,x
$19:e5b8  fe 0f 52	  inc $520f,x
$19:e5bb  71 83		 adc ($83),y
$19:e5bd  cc 03 a8	  cpy $a803
$19:e5c0  b9 01 a8	  lda $a801,y
$19:e5c3  01 48		 ora ($48,x)
$19:e5c5  5a			phy
$19:e5c6  1f 71 71 8d   ora $8d7171,x
$19:e5ca  40			rti
$19:e5cb  9a			txs
$19:e5cc  0f 52 1e 81   ora $811e52
$19:e5d0  34 1f		 bit $1f,x
$19:e5d2  a4 45		 ldy $45
$19:e5d4  05 88		 ora $88
$19:e5d6  01 48		 ora ($48,x)
$19:e5d8  7a			ply
$19:e5d9  1f b5 92 89   ora $8992b5,x
$19:e5dd  41 ea		 eor ($ea,x)
$19:e5df  42 d0		 wdm #$d0
$19:e5e1  0f 83 d4 03   ora $03d483
$19:e5e5  e8			inx
$19:e5e6  a9 40		 lda #$40
$19:e5e8  f8			sed
$19:e5e9  17 49		 ora [$49],y
$19:e5eb  4a			lsr a
$19:e5ec  4b			phk
$19:e5ed  94 12		 sty $12,x
$19:e5ef  81 15		 sta ($15,x)
$19:e5f1  3f af 21 13   and $1321af,x
$19:e5f5  90 24		 bcc $e61b
$19:e5f7  06 a0		 asl $a0
$19:e5f9  2f 20 48 0b   and $0b4820
$19:e5fd  41 fa		 eor ($fa,x)
$19:e5ff  8a			txa
$19:e600  70 50		 bvs $e652
$19:e602  a2 54 13	  ldx #$1354
$19:e605  a0 4f 23	  ldy #$234f
$19:e608  19 15 c8	  ora $c815,y
$19:e60b  d6 49		 dec $49,x
$19:e60d  94 42		 sty $42,x
$19:e60f  80 14		 bra $e625
$19:e611  93 a0		 sta ($a0,s),y
$19:e613  7d 07 69	  adc $6907,x
$19:e616  19 c1 1e	  ora $1ec1,y
$19:e619  85 30		 sta $30
$19:e61b  42 80		 wdm #$80
$19:e61d  74 9d		 stz $9d,x
$19:e61f  00 9f		 brk #$9f
$19:e621  63 61		 adc $61,s
$19:e623  7e 8c 06	  ror $068c,x
$19:e626  e8			inx
$19:e627  0e b9 c9	  asl $c9b9
$19:e62a  76 87		 ror $87,x
$19:e62c  25 c8		 and $c8
$19:e62e  9a			txs
$19:e62f  1e 25 41	  asl $4125,x
$19:e632  35 a7		 and $a7,x
$19:e634  be 80 6b	  ldx $6b80,y
$19:e637  4e 62 71	  lsr $7162
$19:e63a  75 34		 adc $34,x
$19:e63c  07 28		 ora [$28]
$19:e63e  1b			tcs
$19:e63f  08			php
$19:e640  a6 16		 ldx $16
$19:e642  da			phx
$19:e643  41 94		 eor ($94,x)
$19:e645  0d 84 b5	  ora $b584
$19:e648  05 7b		 ora $7b
$19:e64a  4c d7 12	  jmp $12d7
$19:e64d  e5 05		 sbc $05
$19:e64f  ae 34 c9	  ldx $c934
$19:e652  8e ca d2	  stx $d2ca
$19:e655  56 96		 lsr $96,x
$19:e657  5a			phy
$19:e658  95 0d		 sta $0d,x
$19:e65a  36 1b		 rol $1b,x
$19:e65c  dc 1e 3e	  jml [$3e1e]
$19:e65f  02 f0		 cop #$f0
$19:e661  9f 14 c0 4b   sta $4bc014,x
$19:e665  e3 6f		 sbc $6f,s
$19:e667  23 f8		 and $f8,s
$19:e669  61 d5		 adc ($d5,x)
$19:e66b  a0 19 4e	  ldy #$4e19
$19:e66e  71 81		 adc ($81),y
$19:e670  4f 21 11 3a   eor $3a1121
$19:e674  7a			ply
$19:e675  17 d2		 ora [$d2],y
$19:e677  ca			dex
$19:e678  ef 25 0f ac   sbc $ac0f25
$19:e67c  bd de 11	  lda $11de,x
$19:e67f  74 a1		 stz $a1,x
$19:e681  fe 04 0a	  inc $0a04,x
$19:e684  db			stp
$19:e685  06 af		 asl $af
$19:e687  b9 9d 1a	  lda $1a9d,y
$19:e68a  4f 3f 69 0f   eor $0f693f
$19:e68e  f3 ff		 sbc ($ff,s),y
$19:e690  0c 80 06	  tsb $0680
$19:e693  40			rti
$19:e694  2e 11 08	  rol $0811
$19:e697  00 7c		 brk #$7c
$19:e699  11 a4		 ora ($a4),y
$19:e69b  8e 18 84	  stx $8418
$19:e69e  10 50		 bpl $e6f0
$19:e6a0  22 01 16 22   jsl $221601
$19:e6a4  34 04		 bit $04,x
$19:e6a6  67 20		 adc [$20]
$19:e6a8  82 05 fd	  brl $e3b0
$19:e6ab  1c 11 11	  trb $1111
$19:e6ae  5d 8a c6	  eor $c68a,x
$19:e6b1  01 08		 ora ($08,x)
$19:e6b3  32 84		 and ($84)
$19:e6b5  04 56		 tsb $56
$19:e6b7  06 60		 asl $60
$19:e6b9  33 8d		 and ($8d,s),y
$19:e6bb  10 ca		 bpl $e687
$19:e6bd  49 c0		 eor #$c0
$19:e6bf  e2 19		 sep #$19
$19:e6c1  04 ea		 tsb $ea
$19:e6c3  38			sec
$19:e6c4  41 61		 eor ($61,x)
$19:e6c6  46 06		 lsr $06
$19:e6c8  2b			pld
$19:e6c9  03 7f		 ora $7f,s
$19:e6cb  1c 23 79	  trb $7923
$19:e6ce  04 47		 tsb $47
$19:e6d0  1e 30 d0	  asl $d030,x
$19:e6d3  06 42		 asl $42
$19:e6d5  ce 1b 05	  dec $051b
$19:e6d8  05 fb		 ora $fb
$19:e6da  e4 a7		 cpx $a7
$19:e6dc  a9 7f		 lda #$7f
$19:e6de  74 b7		 stz $b7,x
$19:e6e0  f0 f8		 beq $e6da
$19:e6e2  48			pha
$19:e6e3  10 b7		 bpl $e69c
$19:e6e5  10 93		 bpl $e67a
$19:e6e7  b6 88		 ldx $88,y
$19:e6e9  f6 0b		 inc $0b,x
$19:e6eb  d3 0f		 cmp ($0f,s),y
$19:e6ed  83 9f		 sta $9f,s
$19:e6ef  cb			wai
$19:e6f0  65 05		 adc $05
$19:e6f2  5f 11 64 21   eor $216411,x
$19:e6f6  c0 44		 cpy #$44
$19:e6f8  97 02		 sta [$02],y
$19:e6fa  fc 5e 30	  jsr ($305e,x)
$19:e6fd  71 07		 adc ($07),y
$19:e6ff  8c 7e 12	  sty $127e
$19:e702  43 f2		 eor $f2,s
$19:e704  a7 ca		 lda [$ca]
$19:e706  4c de 77	  jmp $77de
$19:e709  f9 2b 68	  sbc $682b,y
$19:e70c  d1 de		 cmp ($de),y
$19:e70e  f0 a9		 beq $e6b9
$19:e710  1a			inc a
$19:e711  b3 d7		 lda ($d7,s),y
$19:e713  bf 03 67 fb   lda $fb6703,x
$19:e717  83 e4		 sta $e4,s
$19:e719  ef 22 7e 93   sbc $937e22
$19:e71d  cd 55 00	  cmp $0055
$19:e720  9c 09 42	  stz $4209
$19:e723  9c 53 80	  stz $8053
$19:e726  03 08		 ora $08,s
$19:e728  52 9c		 eor ($9c)
$19:e72a  63 11		 adc $11,s
$19:e72c  88			dey
$19:e72d  44 ee 09	  mvp $09,$ee
$19:e730  00 84		 brk #$84
$19:e732  44 06 a1	  mvp $a1,$06
$19:e735  3c 1c 04	  bit $041c,x
$19:e738  60			rts
$19:e739  66 03		 ror $03
$19:e73b  d2 88		 cmp ($88)
$19:e73d  42 06		 wdm #$06
$19:e73f  a4 fa		 ldy $fa
$19:e741  00 18		 brk #$18
$19:e743  46 3b		 lsr $3b
$19:e745  84 d2		 sty $d2
$19:e747  1d 07 b0	  ora $b007,x
$19:e74a  8c 49 b0	  sty $b049
$19:e74d  ef 3c 80 06   sbc $06803c
$19:e751  03 a0		 ora $a0,s
$19:e753  f7 13		 sbc [$13],y
$19:e755  48			pha
$19:e756  82 1b 68	  brl $4f74
$19:e759  71 8c		 adc ($8c),y
$19:e75b  48			pha
$19:e75c  21 da		 and ($da,x)
$19:e75e  87 40		 sta [$40]
$19:e760  93 63		 sta ($63,s),y
$19:e762  27 14		 and [$14]
$19:e764  c4 0a		 cpy $0a
$19:e766  31 17		 and ($17),y
$19:e768  1e 94 4a	  asl $4a94,x
$19:e76b  10 89		 bpl $e6f6
$19:e76d  38			sec
$19:e76e  54 41 12	  mvn $12,$41
$19:e771  13 d1		 ora ($d1,s),y
$19:e773  c0 46		 cpy #$46
$19:e775  a0 09		 ldy #$09
$19:e777  72 7d		 adc ($7d)
$19:e779  04 49		 tsb $49
$19:e77b  3a			dec a
$19:e77c  05 32		 ora $32
$19:e77e  47 04		 eor [$04]
$19:e780  3c b4 06	  bit $06b4,x
$19:e783  30 81		 bmi $e706
$19:e785  42 61		 wdm #$61
$19:e787  c6 80		 dec $80
$19:e789  7e 04 2a	  ror $2a04,x
$19:e78c  03 1e		 ora $1e,s
$19:e78e  30 8a		 bmi $e71a
$19:e790  90 4e		 bcc $e7e0
$19:e792  a3 01		 lda $01,s
$19:e794  81 25		 sta ($25,x)
$19:e796  80 dc		 bra $e774
$19:e798  23 80		 and $80,s
$19:e79a  13 5c		 ora ($5c,s),y
$19:e79c  10 68		 bpl $e806
$19:e79e  29 91		 and #$91
$19:e7a0  8a			txa
$19:e7a1  12 45		 ora ($45)
$19:e7a3  32 30		 and ($30)
$19:e7a5  c1 d8		 cmp ($d8,x)
$19:e7a7  8d c6 38	  sta $38c6
$19:e7aa  42 12		 wdm #$12
$19:e7ac  61 45		 adc ($45,x)
$19:e7ae  20 2a 63	  jsr $632a
$19:e7b1  8a			txa
$19:e7b2  42 55		 wdm #$55
$19:e7b4  a7 04		 lda [$04]
$19:e7b6  33 11		 and ($11,s),y
$19:e7b8  3c 21 85	  bit $8521,x
$19:e7bb  f3 8a		 sbc ($8a,s),y
$19:e7bd  1c ce 03	  trb $03ce
$19:e7c0  04 36		 tsb $36
$19:e7c2  1c 18 f2	  trb $f218
$19:e7c5  32 63		 and ($63)
$19:e7c7  ec 41 a3	  cpx $a341
$19:e7ca  11 67		 ora ($67),y
$19:e7cc  61 0c		 adc ($0c,x)
$19:e7ce  40			rti
$19:e7cf  62 70 e8	  per $d042
$19:e7d2  80 c4		 bra $e798
$19:e7d4  11 63		 ora ($63),y
$19:e7d6  1e 1a 8a	  asl $8a1a,x
$19:e7d9  2c 0d 41	  bit $410d
$19:e7dc  16 1a		 asl $1a,x
$19:e7de  82 9c 86	  brl $6e7d
$19:e7e1  21 0e		 and ($0e,x)
$19:e7e3  57 14		 eor [$14],y
$19:e7e5  18			clc
$19:e7e6  a8			tay
$19:e7e7  00 92		 brk #$92
$19:e7e9  87 10		 sta [$10]
$19:e7eb  c0 20		 cpy #$20
$19:e7ed  30 61		 bmi $e850
$19:e7ef  f0 32		 beq $e823
$19:e7f1  46 02		 lsr $02
$19:e7f3  4c 10 b0	  jmp $b010
$19:e7f6  b3 3d		 lda ($3d,s),y
$19:e7f8  e4 04		 cpx $04
$19:e7fa  11 71		 ora ($71),y
$19:e7fc  11 04		 ora ($04),y
$19:e7fe  5d 24 df	  eor $df24,x
$19:e801  17 81		 ora [$81],y
$19:e803  37 c0		 and [$c0],y
$19:e805  32 a1		 and ($a1)
$19:e807  26 70		 rol $70
$19:e809  84 08		 sty $08
$19:e80b  9c 6f ff	  stz $ff6f
$19:e80e  08			php
$19:e80f  04 08		 tsb $08
$19:e811  eb			xba
$19:e812  90 24		 bcc $e838
$19:e814  20 a5 46	  jsr $46a5
$19:e817  24 8b		 bit $8b
$19:e819  14 a8		 trb $a8
$19:e81b  c2 92		 rep #$92
$19:e81d  42 33		 wdm #$33
$19:e81f  18			clc
$19:e820  d2 64		 cmp ($64)
$19:e822  46 60		 lsr $60
$19:e824  51 08		 eor ($08),y
$19:e826  90 50		 bcc $e878
$19:e828  09 e4		 ora #$e4
$19:e82a  de 08 81	  dec $8108,x
$19:e82d  58			cli
$19:e82e  a0 4b d4	  ldy #$d44b
$19:e831  16 03		 asl $03,x
$19:e833  14 60		 trb $60
$19:e835  30 25		 bmi $e85c
$19:e837  02 3d		 cop #$3d
$19:e839  05 52		 ora $52
$19:e83b  3f df fc ea   and $eafcdf,x
$19:e83f  01 31		 ora ($31,x)
$19:e841  3c 8c c0	  bit $c08c,x
$19:e844  fa			plx
$19:e845  91 58		 sta ($58),y
$19:e847  d4 46		 pei ($46)
$19:e849  31 62		 and ($62),y
$19:e84b  83 40		 sta $40,s
$19:e84d  64 e8		 stz $e8
$19:e84f  10 90		 bpl $e7e1
$19:e851  dc 20 ca	  jml [$ca20]
$19:e854  70 8b		 bvs $e7e1
$19:e856  c2 e3		 rep #$e3
$19:e858  df 11 b8 46   cmp $46b811,x
$19:e85c  e2 82		 sep #$82
$19:e85e  d0 f9		 bne $e859
$19:e860  0c 02 3b	  tsb $3b02
$19:e863  0a			asl a
$19:e864  83 c6		 sta $c6,s
$19:e866  bc 64 52	  ldy $5264,x
$19:e869  82 c7 3c	  brl $2533
$19:e86c  a3 00		 lda $00,s
$19:e86e  88			dey
$19:e86f  45 e2		 eor $e2
$19:e871  f0 aa		 beq $e81d
$19:e873  40			rti
$19:e874  c0 20 12	  cpy #$1220
$19:e877  78			sei
$19:e878  fc 0a ac	  jsr ($ac0a,x)
$19:e87b  53 29		 eor ($29,s),y
$19:e87d  0c 02 b0	  tsb $b002
$19:e880  30 08		 bmi $e88a
$19:e882  e4 2e		 cpx $2e
$19:e884  41 01		 eor ($01,x)
$19:e886  ab			plb
$19:e887  51 83		 eor ($83),y
$19:e889  81 38		 sta ($38,x)
$19:e88b  11 88		 ora ($88),y
$19:e88d  8a			txa
$19:e88e  23 0a		 and $0a,s
$19:e890  00 b1		 brk #$b1
$19:e892  8c 02 4a	  sty $4a02
$19:e895  ce 1c 90	  dec $901c
$19:e898  dc 23 91	  jml [$9123]
$19:e89b  18			clc
$19:e89c  6c 6c 7a	  jmp ($7a6c)
$19:e89f  31 a8		 and ($a8),y
$19:e8a1  9c 2e 3a	  stz $3a2e
$19:e8a4  44 28 44	  mvp $44,$28
$19:e8a7  06 3e		 asl $3e
$19:e8a9  4b			phk
$19:e8aa  28			plp
$19:e8ab  44 1e 32	  mvp $32,$1e
$19:e8ae  52 28		 eor ($28)
$19:e8b0  ac 58 b0	  ldy $b058
$19:e8b3  72 58		 adc ($58)
$19:e8b5  f1 7c		 sbc ($7c),y
$19:e8b7  e2 ad		 sep #$ad
$19:e8b9  00 33		 brk #$33
$19:e8bb  94 26		 sty $26,x
$19:e8bd  3e 6d 51	  rol $516d,x
$19:e8c0  05 46		 ora $46
$19:e8c2  05 a1		 ora $a1
$19:e8c4  64 42		 stz $42
$19:e8c6  14 06		 trb $06
$19:e8c8  41 72		 eor ($72,x)
$19:e8ca  1f 0c 4a 1f   ora $1f4a0c,x
$19:e8ce  1a			inc a
$19:e8cf  1e 8a 34	  asl $348a,x
$19:e8d2  07 60		 ora [$60]
$19:e8d4  98			tya
$19:e8d5  31 a0		 and ($a0),y
$19:e8d7  12 c6		 ora ($c6)
$19:e8d9  3f 06 28 24   and $242806,x
$19:e8dd  54 ae 92	  mvn $92,$ae
$19:e8e0  52 f2		 eor ($f2)
$19:e8e2  45 4c		 eor $4c
$19:e8e4  a9 09		 lda #$09
$19:e8e6  36 79		 rol $79,x
$19:e8e8  f5 2c		 sbc $2c,x
$19:e8ea  48			pha
$19:e8eb  44 ba 22	  mvp $22,$ba
$19:e8ee  de 3b 10	  dec $103b,x
$19:e8f1  84 48		 sty $48
$19:e8f3  1d 89 20	  ora $2089,x
$19:e8f6  4f 9a 20 14   eor $14209a
$19:e8fa  de b7 d9	  dec $d9b7,x
$19:e8fd  d4 01		 pei ($01)
$19:e8ff  8c 0c a8	  sty $a80c
$19:e902  8d 46 23	  sta $2346
$19:e905  16 36		 asl $36,x
$19:e907  c0 49 e0	  cpy #$e049
$19:e90a  10 69		 bpl $e975
$19:e90c  15 c1		 ora $c1,x
$19:e90e  be 11 e8	  ldx $e811,y
$19:e911  8c 4a 3c	  sty $3c4a
$19:e914  39 28 94	  and $9428,y
$19:e917  5a			phy
$19:e918  34 ec		 bit $ec,x
$19:e91a  18			clc
$19:e91b  fb			xce
$19:e91c  c0 25 04	  cpy #$0425
$19:e91f  72 85		 adc ($85)
$19:e921  0f 81 f4 51   ora $51f481
$19:e925  78			sei
$19:e926  f1 50		 sbc ($50),y
$19:e928  e4 f2		 cpx $f2
$19:e92a  60			rts
$19:e92b  39 c5 e5	  and $e5c5,y
$19:e92e  00 e3		 brk #$e3
$19:e930  85 c9		 sta $c9
$19:e932  c2 a7		 rep #$a7
$19:e934  39 80 4c	  and $4c80,y
$19:e937  83 b3		 sta $b3,s
$19:e939  19 89 46	  ora $4689,y
$19:e93c  2c 82 c0	  bit $c082
$19:e93f  93 07		 sta ($07,s),y
$19:e941  42 45		 wdm #$45
$19:e943  92 19		 sta ($19)
$19:e945  84 7e		 sty $7e
$19:e947  1f 0f 1c 14   ora $141c0f,x
$19:e94b  72 25		 adc ($25)
$19:e94d  0b			phd
$19:e94e  8f 90 06 45   sta $450690
$19:e952  04 82		 tsb $82
$19:e954  c7 48		 cmp [$48]
$19:e956  e5 09		 sbc $09
$19:e958  81 13		 sta ($13,x)
$19:e95a  4e 2d 18	  lsr $182d
$19:e95d  54 1c 9a	  mvn $9a,$1c
$19:e960  40			rti
$19:e961  5b			tcd
$19:e962  38			sec
$19:e963  b4 88		 ldy $88,x
$19:e965  c4 70		 cpy $70
$19:e967  a9 0a f5	  lda #$f50a
$19:e96a  66 27		 ror $27
$19:e96c  17 6a		 ora [$6a],y
$19:e96e  94 86		 sty $86,x
$19:e970  e4 3a		 cpx $3a
$19:e972  06 78		 asl $78
$19:e974  44 63 16	  mvp $16,$63
$19:e977  27 10		 and [$10]
$19:e979  46 62		 lsr $62
$19:e97b  b0 b4		 bcs $e931
$19:e97d  61 46		 adc ($46,x)
$19:e97f  e2 71		 sep #$71
$19:e981  08			php
$19:e982  cb			wai
$19:e983  a0 5e		 ldy #$5e
$19:e985  41 04		 eor ($04,x)
$19:e987  77 13		 adc [$13],y
$19:e989  ac 20 f1	  ldy $f120
$19:e98c  a7 b1		 lda [$b1]
$19:e98e  c5 df		 cmp $df
$19:e990  89 1f		 bit #$1f
$19:e992  01 a4		 ora ($a4,x)
$19:e994  84 14		 sty $14
$19:e996  92 05		 sta ($05)
$19:e998  ef b5 4e e8   sbc $e84eb5
$19:e99c  28			plp
$19:e99d  26 88		 rol $88
$19:e99f  58			cli
$19:e9a0  c6 c7		 dec $c7
$19:e9a2  1a			inc a
$19:e9a3  1a			inc a
$19:e9a4  9c 32 3c	  stz $3c32
$19:e9a7  e8			inx
$19:e9a8  19 0c 16	  ora $160c,y
$19:e9ab  11 1a		 ora ($1a),y
$19:e9ad  77 9b		 adc [$9b],y
$19:e9af  b4 1e		 ldy $1e,x
$19:e9b1  de 07 b8	  dec $b807,x
$19:e9b4  c0 28		 cpy #$28
$19:e9b6  20 16 08	  jsr $0816
$19:e9b9  07 a3		 ora [$a3]
$19:e9bb  fe 1e 00	  inc $001e,x
$19:e9be  f0 44		 beq $ea04
$19:e9c0  4d a1 08	  eor $08a1
$19:e9c3  b0 44		 bcs $ea09
$19:e9c5  26 16		 rol $16
$19:e9c7  b8			clv
$19:e9c8  40			rti
$19:e9c9  18			clc
$19:e9ca  2a			rol a
$19:e9cb  10 09		 bpl $e9d6
$19:e9cd  c5 b9		 cmp $b9
$19:e9cf  a0 12		 ldy #$12
$19:e9d1  0a			asl a
$19:e9d2  03 50		 ora $50,s
$19:e9d4  37 10		 and [$10],y
$19:e9d6  88			dey
$19:e9d7  04 82		 tsb $82
$19:e9d9  90 cd		 bcc $e9a8
$19:e9db  39 c4 a1	  and $a1c4,y
$19:e9de  a8			tay
$19:e9df  17 66		 ora [$66],y
$19:e9e1  f1 36		 sbc ($36),y
$19:e9e3  81 9e		 sta ($9e,x)
$19:e9e5  35 06		 and $06,x
$19:e9e7  68			pla
$19:e9e8  42 2d		 wdm #$2d
$19:e9ea  8d 00 94	  sta $9400
$19:e9ed  4e 1e e1	  lsr $e11e
$19:e9f0  9a			txs
$19:e9f1  6f 04 c2 71   adc $71c204
$19:e9f5  38			sec
$19:e9f6  84 5f		 sty $5f
$19:e9f8  60			rts
$19:e9f9  90 18		 bcc $ea13
$19:e9fb  c5 21		 cmp $21
$19:e9fd  ee 17 a6	  inc $a617
$19:ea00  80 52		 bra $ea54
$19:ea02  23 12		 and $12,s
$19:ea04  08			php
$19:ea05  c5 01		 cmp $01
$19:ea07  a0 0b		 ldy #$0b
$19:ea09  f1 9c		 sbc ($9c),y
$19:ea0b  53 01		 eor ($01,s),y
$19:ea0d  e5 28		 sbc $28
$19:ea0f  88			dey
$19:ea10  07 06		 ora [$06]
$19:ea12  61 30		 adc ($30,x)
$19:ea14  88			dey
$19:ea15  4a			lsr a
$19:ea16  32 cf		 and ($cf)
$19:ea18  a2 6a		 ldx #$6a
$19:ea1a  1d 62 10	  ora $1062,x
$19:ea1d  13 06		 ora ($06,s),y
$19:ea1f  b0 b0		 bcs $e9d1
$19:ea21  00 26		 brk #$26
$19:ea23  14 e8		 trb $e8
$19:ea25  41 b4		 eor ($b4,x)
$19:ea27  0e 40 bc	  asl $bc40
$19:ea2a  02 09		 cop #$09
$19:ea2c  1c 82 04	  trb $0482
$19:ea2f  75 06		 adc $06,x
$19:ea31  48			pha
$19:ea32  c0 2e		 cpy #$2e
$19:ea34  90 32		 bcc $ea68
$19:ea36  78			sei
$19:ea37  b2 82		 lda ($82)
$19:ea39  c9 03		 cmp #$03
$19:ea3b  23 04		 and $04,s
$19:ea3d  80 e2		 bra $ea21
$19:ea3f  24 78		 bit $78
$19:ea41  30 8d		 bmi $e9d0
$19:ea43  80 aa		 bra $e9ef
$19:ea45  06 12		 asl $12
$19:ea47  b1 17		 lda ($17),y
$19:ea49  0d 78 1f	  ora $1f78
$19:ea4c  86 19		 stx $19
$19:ea4e  9a			txs
$19:ea4f  56 cc		 lsr $cc,x
$19:ea51  71 4b		 adc ($4b),y
$19:ea53  41 71		 eor ($71,x)
$19:ea55  48			pha
$19:ea56  00 c4		 brk #$c4
$19:ea58  28			plp
$19:ea59  21 a8		 and ($a8,x)
$19:ea5b  e1 14		 sbc ($14,x)
$19:ea5d  38			sec
$19:ea5e  12 38		 ora ($38)
$19:ea60  a1 18		 lda ($18,x)
$19:ea62  22 e0 c6 08   jsl $08c6e0
$19:ea66  61 a8		 adc ($a8,x)
$19:ea68  42 84		 wdm #$84
$19:ea6a  22 20 43 0d   jsl $0d4320
$19:ea6e  4a			lsr a
$19:ea6f  14 08		 trb $08
$19:ea71  42 7b		 wdm #$7b
$19:ea73  02 3c		 cop #$3c
$19:ea75  90 c3		 bcc $ea3a
$19:ea77  30 a9		 bmi $ea22
$19:ea79  02 31		 cop #$31
$19:ea7b  5e 17 c6	  lsr $c617,x
$19:ea7e  45 04		 eor $04
$19:ea80  d9 1e c0	  cmp $c01e,y
$19:ea83  9a			txs
$19:ea84  64 20		 stz $20
$19:ea86  a5 34		 lda $34
$19:ea88  c8			iny
$19:ea89  86 18		 stx $18
$19:ea8b  e5 f4		 sbc $f4
$19:ea8d  b9 54 86	  lda $8654,y
$19:ea90  18			clc
$19:ea91  02 a9		 cop #$a9
$19:ea93  c4 32		 cpy $32
$19:ea95  8f 6f 21 0d   sta $0d216f
$19:ea99  e3 04		 sbc $04,s
$19:ea9b  d4 3c		 pei ($3c)
$19:ea9d  c6 08		 dec $08
$19:ea9f  a4 04		 ldy $04
$19:eaa1  3b			tsc
$19:eaa2  29 01		 and #$01
$19:eaa4  48			pha
$19:eaa5  23 8d		 and $8d,s
$19:eaa7  31 1f		 and ($1f),y
$19:eaa9  0c 2d b4	  tsb $b42d
$19:eaac  a6 34		 ldx $34
$19:eaae  3c 00 a0	  bit $a000,x
$19:eab1  a1 19		 lda ($19,x)
$19:eab3  08			php
$19:eab4  41 64		 eor ($64,x)
$19:eab6  f1 85		 sbc ($85),y
$19:eab8  f2 70		 sbc ($70)
$19:eaba  86 71		 stx $71
$19:eabc  c2 04		 rep #$04
$19:eabe  cf 84 6c 0b   cmp $0b6c84
$19:eac2  fe 70 fd	  inc $fd70,x
$19:eac5  92 0b		 sta ($0b)
$19:eac7  d2 7f		 cmp ($7f)
$19:eac9  b4 52		 ldy $52,x
$19:eacb  fc a1 b0	  jsr ($b0a1,x)
$19:eace  22 90 98 00   jsl $009890
$19:ead2  06 0e		 asl $0e
$19:ead4  c1 18		 cmp ($18,x)
$19:ead6  c4 42		 cpy $42
$19:ead8  11 37		 ora ($37),y
$19:eada  83 c0		 sta $c0,s
$19:eadc  5d 00 e8	  eor $e800,x
$19:eadf  09 cb		 ora #$cb
$19:eae1  ac 17 00	  ldy $0017
$19:eae4  e8			inx
$19:eae5  09 d3		 ora #$d3
$19:eae7  ac 16 e0	  ldy $e016
$19:eaea  b8			clv
$19:eaeb  0a			asl a
$19:eaec  3b			tsc
$19:eaed  ac 97 01	  ldy $0197
$19:eaf0  49 79		 eor #$79
$19:eaf2  12 e0		 ora ($e0)
$19:eaf4  29 4e		 and #$4e
$19:eaf6  b0 77		 bcs $eb6f
$19:eaf8  02 dc		 cop #$dc
$19:eafa  24 0e		 bit $0e
$19:eafc  30 6c		 bmi $eb6a
$19:eafe  1a			inc a
$19:eaff  c0 1b		 cpy #$1b
$19:eb01  e4 b0		 cpx $b0
$19:eb03  07 29		 ora [$29]
$19:eb05  44 25 8e	  mvp $8e,$25
$19:eb08  b3 88		 lda ($88,s),y
$19:eb0a  53 5e		 eor ($5e,s),y
$19:eb0c  47 10		 eor [$10]
$19:eb0e  a7 3c		 lda [$3c]
$19:eb10  89 c0		 bit #$c0
$19:eb12  12 e7		 ora ($e7)
$19:eb14  c9 38		 cmp #$38
$19:eb16  42 d6		 wdm #$d6
$19:eb18  eb			xba
$19:eb19  27 08		 and [$08]
$19:eb1b  5b			tcd
$19:eb1c  5e 44 e1	  lsr $e144,x
$19:eb1f  0b			phd
$19:eb20  70 38		 bvs $eb5a
$19:eb22  e4 01		 cpx $01
$19:eb24  46 6e		 lsr $6e
$19:eb26  a4 29		 ldy $29
$19:eb28  c8			iny
$19:eb29  91 78		 sta ($78),y
$19:eb2b  68			pla
$19:eb2c  04 e3		 tsb $e3
$19:eb2e  27 00		 and [$00]
$19:eb30  04 94		 tsb $94
$19:eb32  68			pla
$19:eb33  e0 01		 cpx #$01
$19:eb35  20 77 04	  jsr $0477
$19:eb38  1e 1a 3b	  asl $3b1a,x
$19:eb3b  17 00		 ora [$00],y
$19:eb3d  7d e1 8e	  adc $8ee1,x
$19:eb40  c3 84		 cmp $84,s
$19:eb42  a1 41		 lda ($41,x)
$19:eb44  c2 02		 rep #$02
$19:eb46  70 85		 bvs $eacd
$19:eb48  a1 40		 lda ($40,x)
$19:eb4a  4e 00 30	  lsr $3000
$19:eb4d  fc c3 10	  jsr ($10c3,x)
$19:eb50  02 03		 cop #$03
$19:eb52  0f d2 84 04   ora $0484d2
$19:eb56  03 18		 ora $18,s
$19:eb58  fd c3 3f	  sbc $3fc3,x
$19:eb5b  1f fa 03 80   ora $8003fa,x
$19:eb5f  59 40 b2	  eor $b240,y
$19:eb62  20 e0 34	  jsr $34e0
$19:eb65  02 50		 cop #$50
$19:eb67  11 0a		 ora ($0a),y
$19:eb69  04 2d		 tsb $2d
$19:eb6b  d8			cld
$19:eb6c  0e 70 80	  asl $8070
$19:eb6f  50 98		 bvc $eb09
$19:eb71  81 20		 sta ($20,x)
$19:eb73  08			php
$19:eb74  0d 11 88	  ora $8811
$19:eb77  43 40		 eor $40,s
$19:eb79  91 32		 sta ($32),y
$19:eb7b  c8			iny
$19:eb7c  68			pla
$19:eb7d  12 46		 ora ($46)
$19:eb7f  20 06 80	  jsr $8006
$19:eb82  22 14 58 58   jsl $585814
$19:eb86  74 51		 stz $51,x
$19:eb88  e1 36		 sbc ($36,x)
$19:eb8a  73 84		 adc ($84,s),y
$19:eb8c  22 50 8f 0e   jsl $0e8f50
$19:eb90  f9 a0 16	  sbc $16a0,y
$19:eb93  63 24		 adc $24,s
$19:eb95  80 7f		 bra $ec16
$19:eb97  3f e8 81 80   and $8081e8,x
$19:eb9b  41 04		 eor ($04,x)
$19:eb9d  62 57 02	  per $edf7
$19:eba0  b8			clv
$19:eba1  43 d1		 eor $d1,s
$19:eba3  a0 b5		 ldy #$b5
$19:eba5  08			php
$19:eba6  84 08		 sty $08
$19:eba8  14 03		 trb $03
$19:ebaa  41 80		 eor ($80,x)
$19:ebac  43 01		 eor $01,s
$19:ebae  44 57 08	  mvp $08,$57
$19:ebb1  74 3d		 stz $3d,x
$19:ebb3  b8			clv
$19:ebb4  06 00		 asl $00
$19:ebb6  1d 0a 1c	  ora $1c0a,x
$19:ebb9  80 24		 bra $ebdf
$19:ebbb  a3 18		 lda $18,s
$19:ebbd  07 6a		 ora [$6a]
$19:ebbf  1c 6a 05	  trb $056a
$19:ebc2  50 c1		 bvc $eb85
$19:ebc4  21 e5		 and ($e5,x)
$19:ebc6  f1 2b		 sbc ($2b),y
$19:ebc8  84 18		 sty $18
$19:ebca  14 07		 trb $07
$19:ebcc  30 6e		 bmi $ec3c
$19:ebce  06 da		 asl $da
$19:ebd0  1c b0 0a	  trb $0ab0
$19:ebd3  43 a0		 eor $a0,s
$19:ebd5  56 a1		 lsr $a1,x
$19:ebd7  50 74		 bvc $ec4d
$19:ebd9  0c 49 ec	  tsb $ec49
$19:ebdc  31 81		 and ($81),y
$19:ebde  10 75		 bpl $ec55
$19:ebe0  00 41		 brk #$41
$19:ebe2  18			clc
$19:ebe3  90 16		 bcc $ebfb
$19:ebe5  ce 60 f0	  dec $f060
$19:ebe8  08			php
$19:ebe9  07 88		 ora [$88]
$19:ebeb  ca			dex
$19:ebec  4c d0 e9	  jmp $e9d0
$19:ebef  00 82		 brk #$82
$19:ebf1  11 30		 ora ($30),y
$19:ebf3  38			sec
$19:ebf4  0d 10 e8	  ora $e810
$19:ebf7  26 91		 rol $91
$19:ebf9  3d 04 e1	  and $e104,x
$19:ebfc  44 11 02	  mvp $02,$11
$19:ebff  e8			inx
$19:ec00  a0 c1		 ldy #$c1
$19:ec02  8c 05 d1	  sty $d105
$19:ec05  41 02		 eor ($02,x)
$19:ec07  31 50		 and ($50),y
$19:ec09  a6 75		 ldx $75
$19:ec0b  03 78		 ora $78,s
$19:ec0d  19 0d 42	  ora $420d,y
$19:ec10  65 90		 adc $90
$19:ec12  50 99		 bvc $ebad
$19:ec14  80 15		 bra $ec2b
$19:ec16  ea			nop
$19:ec17  85 0e		 sta $0e
$19:ec19  aa			tax
$19:ec1a  ac 90 a1	  ldy $a190
$19:ec1d  d6 2f		 dec $2f,x
$19:ec1f  10 84		 bpl $eba5
$19:ec21  3a			dec a
$19:ec22  6a			ror a
$19:ec23  b2 65		 lda ($65)
$19:ec25  91 28		 sta ($28),y
$19:ec27  a5 e4		 lda $e4
$19:ec29  f5 1d		 sbc $1d,x
$19:ec2b  82 08 62	  brl $4e36
$19:ec2e  f1 06		 sbc ($06),y
$19:ec30  68			pla
$19:ec31  a0 c2		 ldy #$c2
$19:ec33  1f 18 66 80   ora $806618,x
$19:ec37  b8			clv
$19:ec38  23 10		 and $10,s
$19:ec3a  f8			sed
$19:ec3b  87 41		 sta [$41]
$19:ec3d  2c 4e e2	  bit $e24e
$19:ec40  4b			phk
$19:ec41  8b			phb
$19:ec42  9c 88 61	  stz $6188
$19:ec45  28			plp
$19:ec46  8f c0 3a ef   sta $ef3ac0
$19:ec4a  10 88		 bpl $ebd4
$19:ec4c  48			pha
$19:ec4d  01 41		 ora ($41,x)
$19:ec4f  d8			cld
$19:ec50  78			sei
$19:ec51  84 82		 sty $82
$19:ec53  20 11 1a	  jsr $1a11
$19:ec56  24 06		 bit $06
$19:ec58  51 08		 eor ($08),y
$19:ec5a  05 08		 ora $08
$19:ec5c  6c 0d 03	  jmp ($030d)
$19:ec5f  1f 06 08 74   ora $740806,x
$19:ec63  04 c2		 tsb $c2
$19:ec65  81 03		 sta ($03,x)
$19:ec67  00 41		 brk #$41
$19:ec69  e4 0c		 cpx $0c
$19:ec6b  d3 1a		 cmp ($1a,s),y
$19:ec6d  10 38		 bpl $eca7
$19:ec6f  44 c0 13	  mvp $13,$c0
$19:ec72  32 10		 and ($10)
$19:ec74  a0 41		 ldy #$41
$19:ec76  16 0b		 asl $0b,x
$19:ec78  a0 6d		 ldy #$6d
$19:ec7a  89 20		 bit #$20
$19:ec7c  09 01		 ora #$01
$19:ec7e  02 80		 cop #$80
$19:ec80  40			rti
$19:ec81  5b			tcd
$19:ec82  63 08		 adc $08,s
$19:ec84  c6 41		 dec $41
$19:ec86  8b			phb
$19:ec87  62 2c 0c	  per $f8b6
$19:ec8a  e4 18		 cpx $18
$19:ec8c  9a			txs
$19:ec8d  4c a0 29	  jmp $29a0
$19:ec90  d4 42		 pei ($42)
$19:ec92  1c 61 22	  trb $2261
$19:ec95  40			rti
$19:ec96  4b			phk
$19:ec97  8d 03 4d	  sta $4d03
$19:ec9a  80 49		 bra $ece5
$19:ec9c  ca			dex
$19:ec9d  4a			lsr a
$19:ec9e  68			pla
$19:ec9f  02 d8		 cop #$d8
$19:eca1  4f 62 f0 0c   eor $0cf062
$19:eca5  34 14		 bit $14,x
$19:eca7  1c 12 d4	  trb $d412
$19:ecaa  b0 62		 bcs $ed0e
$19:ecac  13 21		 ora ($21,s),y
$19:ecae  0b			phd
$19:ecaf  99 42 e1	  sta $e142,y
$19:ecb2  98			tya
$19:ecb3  a4 c8		 ldy $c8
$19:ecb5  4e 20 b0	  lsr $b020
$19:ecb8  78			sei
$19:ecb9  86 31		 stx $31
$19:ecbb  32 13		 and ($13)
$19:ecbd  08			php
$19:ecbe  6a			ror a
$19:ecbf  ac 13 03	  ldy $0313
$19:ecc2  3d 6e 04	  and $046e,x
$19:ecc5  5d 4c 0d	  eor $0d4c,x
$19:ecc8  c0 aa		 cpy #$aa
$19:ecca  40			rti
$19:eccb  28			plp
$19:eccc  05 25		 ora $25
$19:ecce  7f 83 c8 25   adc $25c883,x
$19:ecd2  8e 00 56	  stx $5600
$19:ecd5  8c 02 88	  sty $8802
$19:ecd8  0f 05 30 93   ora $933005
$19:ecdc  06 60		 asl $60
$19:ecde  9f 19 bc 35   sta $35bc19,x
$19:ece2  b8			clv
$19:ece3  09 80		 ora #$80
$19:ece5  fc 7f e9	  jsr ($e97f,x)
$19:ece8  20 10 80	  jsr $8010
$19:eceb  39 c1 8a	  and $8ac1,y
$19:ecee  88			dey
$19:ecef  50 9c		 bvc $ec8d
$19:ecf1  89 43		 bit #$43
$19:ecf3  1c bc 09	  trb $09bc
$19:ecf6  ac 12 45	  ldy $4512
$19:ecf9  06 7d		 asl $7d
$19:ecfb  0c e6 01	  tsb $01e6
$19:ecfe  21 83		 and ($83,x)
$19:ed00  be 80 8c	  ldx $8c80,y
$19:ed03  11 11		 ora ($11),y
$19:ed05  c0 2b		 cpy #$2b
$19:ed07  40			rti
$19:ed08  eb			xba
$19:ed09  18			clc
$19:ed0a  ac 4e 2f	  ldy $2f4e
$19:ed0d  53 8c		 eor ($8c,s),y
$19:ed0f  e4 e3		 cpx $e3
$19:ed11  7d 38 f0	  adc $f038,x
$19:ed14  4e 20 53	  lsr $5320
$19:ed17  99 24 e6	  sta $e624,y
$19:ed1a  8d 39 b4	  sta $b439
$19:ed1d  4e 71 53	  lsr $5371
$19:ed20  9d 64 e7	  sta $e764,x
$19:ed23  9d 39 f8	  sta $f839,x
$19:ed26  4e 61 53	  lsr $5361
$19:ed29  a9 24		 lda #$24
$19:ed2b  ea			nop
$19:ed2c  7d 3a ac	  adc $ac3a,x
$19:ed2f  4e ae 53	  lsr $53ae
$19:ed32  ac 64 eb	  ldy $eb64
$19:ed35  5d 3a d8	  eor $d83a,x
$19:ed38  4e f6 53	  lsr $53f6
$19:ed3b  c8			iny
$19:ed3c  64 f6		 stz $f6
$19:ed3e  3d 3d cc	  and $cc3d,x
$19:ed41  4f 74 53 de   eor $de5374
$19:ed45  24 f7		 bit $f7
$19:ed47  cd 3d 84	  cmp $843d
$19:ed4a  4f a5 53 ea   eor $ea53a5
$19:ed4e  64 fa		 stz $fa
$19:ed50  dd 3e f4	  cmp $f43e,x
$19:ed53  4f a0 53 f8   eor $f853a0
$19:ed57  e4 fe		 cpx $fe
$19:ed59  6d 3f a8	  adc $a83f
$19:ed5c  4f ed 53 fc   eor $fc53ed
$19:ed60  24 ff		 bit $ff
$19:ed62  3d 3f dc	  and $dc3f,x
$19:ed65  4f fa 53 ff   eor $ff53fa
$19:ed69  64 fe		 stz $fe
$19:ed6b  3d 40 87	  and $8740,x
$19:ed6e  c0 09		 cpy #$09
$19:ed70  05 28		 ora $28
$19:ed72  23 2d		 and $2d,s
$19:ed74  64 8c		 stz $8c
$19:ed76  b8			clv
$19:ed77  a2 32		 ldx #$32
$19:ed79  ee e8 1f	  inc $1fe8
$19:ed7c  ff f9 1d 3d   sbc $3d1df9,x
$19:ed80  84 65		 sty $65
$19:ed82  8b			phb
$19:ed83  50 48		 bvc $edcd
$19:ed85  e9 40		 sbc #$40
$19:ed87  3c 2d aa	  bit $aa2d,x
$19:ed8a  82 67 6c	  brl $59f4
$19:ed8d  a1 e1		 lda ($e1,x)
$19:ed8f  78			sei
$19:ed90  a7 85		 lda [$85]
$19:ed92  fe 9e 16	  inc $169e,x
$19:ed95  5d 42 33	  eor $3342,x
$19:ed98  84 1c		 sty $1c
$19:ed9a  90 30		 bcc $edcc
$19:ed9c  12 60		 ora ($60)
$19:ed9e  ab			plb
$19:ed9f  50 aa		 bvc $ed4b
$19:eda1  0a			asl a
$19:eda2  d4 2e		 pei ($2e)
$19:eda4  82 b5 0c	  brl $fa5c
$19:eda7  a4 ad		 ldy $ad
$19:eda9  23 38		 and $38,s
$19:edab  1b			tcs
$19:edac  c1 9e		 cmp ($9e,x)
$19:edae  87 70		 sta [$70]
$19:edb0  67 a1		 adc [$a1]
$19:edb2  fc 19 e8	  jsr ($e819,x)
$19:edb5  87 25		 sta [$25]
$19:edb7  68			pla
$19:edb8  19 c1 1e	  ora $1ec1,y
$19:edbb  4f 14 4c 83   eor $834c14
$19:edbf  c5 14		 cmp $14
$19:edc1  20 f1 45	  jsr $45f1
$19:edc4  49 11		 eor #$11
$19:edc6  d2 cd		 cmp ($cd)
$19:edc8  42 23		 wdm #$23
$19:edca  a6 40		 ldx $40
$19:edcc  34 bb		 bit $bb,x
$19:edce  a1 12		 lda ($12,x)
$19:edd0  f9 02 0f	  sbc $0f02,y
$19:edd3  0e a1 9c	  asl $9ca1
$19:edd6  52 70		 eor ($70)
$19:edd8  3c 5b 10	  bit $105b,x
$19:eddb  f1 71		 sbc ($71),y
$19:eddd  94 33		 sty $33,x
$19:eddf  3b			tsc
$19:ede0  6d 87 8b	  adc $8b87
$19:ede3  e7 1e		 sbc [$1e]
$19:ede5  2c 7e 88	  bit $887e
$19:ede8  35 4a		 and $4a,x
$19:edea  85 11		 sta $11
$19:edec  56 c1		 lsr $c1,x
$19:edee  90 5e		 bcc $ee4e
$19:edf0  a0 84		 ldy #$84
$19:edf2  17 a8		 ora [$a8],y
$19:edf4  29 05		 and #$05
$19:edf6  ea			nop
$19:edf7  0c 49 9e	  tsb $9e49
$19:edfa  83 b0		 sta $b0,s
$19:edfc  67 a1		 adc [$a1]
$19:edfe  0c 19 e8	  tsb $e819
$19:ee01  4b			phk
$19:ee02  06 7a		 asl $7a
$19:ee04  14 c9		 trb $c9
$19:ee06  e2 85		 sep #$85
$19:ee08  d0 78		 bne $ee82
$19:ee0a  a1 94		 lda ($94,x)
$19:ee0c  1e 28 6d	  asl $6d28,x
$19:ee0f  07 8a		 ora [$8a]
$19:ee11  1d 4a 0a	  ora $0a4a,x
$19:ee14  92 3c		 sta ($3c)
$19:ee16  45 11		 eor $11
$19:ee18  be 9c ea	  ldx $ea9c,y
$19:ee1b  24 0d		 bit $0d
$19:ee1d  24 71		 bit $71
$19:ee1f  4a			lsr a
$19:ee20  2b			pld
$19:ee21  75 0a		 adc $0a,x
$19:ee23  a1 5a		 lda ($5a,x)
$19:ee25  a2 be		 ldx #$be
$19:ee27  53 41		 eor ($41,s),y
$19:ee29  45 77		 eor $77
$19:ee2b  91 54		 sta ($54),y
$19:ee2d  3c cf 63	  bit $63cf,x
$19:ee30  6b			rtl
$19:ee31  94 b2		 sty $b2,x
$19:ee33  8c 13 4b	  sty $4b13
$19:ee36  25 19		 and $19
$19:ee38  de 0d 72	  dec $720d,x
$19:ee3b  ce 51 8a	  dec $8a51
$19:ee3e  a1 09		 lda ($09,x)
$19:ee40  30 1f		 bmi $ee61
$19:ee42  1a			inc a
$19:ee43  8c 2d 4f	  sty $4f2d
$19:ee46  f0 d1		 beq $ee19
$19:ee48  66 d4		 ror $d4
$19:ee4a  71 5b		 adc ($5b),y
$19:ee4c  5b			tcd
$19:ee4d  a8			tay
$19:ee4e  e2 d4		 sep #$d4
$19:ee50  d3 13		 cmp ($13,s),y
$19:ee52  97 bc		 sta [$bc],y
$19:ee54  44 78 b5	  mvp $b5,$78
$19:ee57  20 5a 94	  jsr $945a
$19:ee5a  e3 42		 sbc $42,s
$19:ee5c  e1 a9		 sbc ($a9,x)
$19:ee5e  0b			phd
$19:ee5f  b6 df		 ldx $df,y
$19:ee61  52 1a		 eor ($1a)
$19:ee63  a9 d3		 lda #$d3
$19:ee65  41 2f		 eor ($2f,x)
$19:ee67  f5 04		 sbc $04,x
$19:ee69  ed 72 2f	  sbc $2f72
$19:ee6c  83 cc		 sta $cc,s
$19:ee6e  10 20		 bpl $ee90
$19:ee70  fb			xce
$19:ee71  23 f9		 and $f9,s
$19:ee73  27 7d		 and [$7d]
$19:ee75  5d eb ff	  eor $ffeb,x
$19:ee78  68			pla
$19:ee79  0a			asl a
$19:ee7a  24 18		 bit $18
$19:ee7c  a8			tay
$19:ee7d  e3 47		 sbc $47,s
$19:ee7f  0f bc bc 07   ora $07bcbc
$19:ee83  c9 10		 cmp #$10
$19:ee85  62 a0 8d	  per $7c28
$19:ee88  04 3e		 tsb $3e
$19:ee8a  32 f2		 and ($f2)
$19:ee8c  1f 00 fc c9   ora $c9fc00,x
$19:ee90  e7 5f		 sbc [$5f]
$19:ee92  43 29		 eor $29,s
$19:ee94  1c 89 e0	  trb $e089
$19:ee97  4f 06 1e 28   eor $281e06
$19:ee9b  fd 69 ec	  sbc $ec69,x
$19:ee9e  5e 41 e3	  lsr $e341,x
$19:eea1  8f de 9e 05   sta $059ede
$19:eea5  e2 1e		 sep #$1e
$19:eea7  08			php
$19:eea8  fc 69 e4	  jsr ($e469,x)
$19:eeab  5e 02 f9	  lsr $f902,x
$19:eeae  9b			txy
$19:eeaf  ce fe 18	  dec $18fe
$19:eeb2  52 48		 eor ($48)
$19:eeb4  41 c8		 eor ($c8,x)
$19:eeb6  e0 48		 cpx #$48
$19:eeb8  1c 85 26	  trb $2685
$19:eebb  be a2 1f	  ldx $1fa2,y
$19:eebe  d7 fe		 cmp [$fe],y
$19:eec0  4f 49 81 a8   eor $a88149
$19:eec4  87 f8		 sta [$f8]
$19:eec6  ae 5f f7	  ldx $f75f
$19:eec9  fe 78 b0	  inc $b078,x
$19:eecc  32 48		 and ($48)
$19:eece  2f d0 8e 15   and $158ed0
$19:eed2  15 81		 ora $81,x
$19:eed4  c0 60		 cpy #$60
$19:eed6  16 65		 asl $65,x
$19:eed8  81 c0		 sta ($c0,x)
$19:eeda  9a			txs
$19:eedb  cb			wai
$19:eedc  04 6b		 tsb $6b
$19:eede  0a			asl a
$19:eedf  a4 a0		 ldy $a0
$19:eee1  cd 61 50	  cmp $5061
$19:eee4  93 54		 sta ($54,s),y
$19:eee6  14 e0		 trb $e0
$19:eee8  49 08		 eor #$08
$19:eeea  fa			plx
$19:eeeb  88			dey
$19:eeec  60			rts
$19:eeed  ad 61 65	  lda $6561
$19:eef0  14 21		 trb $21
$19:eef2  ec 6f f0	  cpx $f06f
$19:eef5  65 16		 adc $16
$19:eef7  22 88 0d 4e   jsl $4e0d88
$19:eefb  70 51		 bvs $ef4e
$19:eefd  62 94 50	  per $3f94
$19:ef00  69 12		 adc #$12
$19:ef02  40			rti
$19:ef03  26 84		 rol $84
$19:ef05  90 0d		 bcc $ef14
$19:ef07  83 05		 sta $05,s
$19:ef09  04 7e		 tsb $7e
$19:ef0b  34 b0		 bit $b0,x
$19:ef0d  8f 88 85 ba   sta $ba8588
$19:ef11  0e 32 2d	  asl $2d32
$19:ef14  81 b5		 sta ($b5,x)
$19:ef16  03 60		 ora $60,s
$19:ef18  d5 07		 cmp $07,x
$19:ef1a  19 0e c1	  ora $c10e,y
$19:ef1d  32 13		 and ($13)
$19:ef1f  16 51		 asl $51,x
$19:ef21  eb			xba
$19:ef22  1f 03 0f 65   ora $650f03,x
$19:ef26  1f 5a 92 91   ora $91925a,x
$19:ef2a  48			pha
$19:ef2b  3d 29 22	  and $2229,x
$19:ef2e  93 85		 sta ($85,s),y
$19:ef30  02 da		 cop #$da
$19:ef32  69 48		 adc #$48
$19:ef34  f6 cd		 inc $cd,x
$19:ef36  28			plp
$19:ef37  17 96		 ora [$96],y
$19:ef39  a8			tay
$19:ef3a  5f e2 a1 65   eor $65a1e2,x
$19:ef3e  b4 b4		 ldy $b4,x
$19:ef40  7b			tdc
$19:ef41  57 a9		 eor [$a9],y
$19:ef43  69 14		 adc #$14
$19:ef45  cb			wai
$19:ef46  37 17		 and [$17],y
$19:ef48  aa			tax
$19:ef49  dc 58 6d	  jml [$6d58]
$19:ef4c  31 0a		 and ($0a),y
$19:ef4e  10 71		 bpl $efc1
$19:ef50  f0 9f		 beq $eef1
$19:ef52  41 2e		 eor ($2e,x)
$19:ef54  0f 74 4f 83   ora $834f74
$19:ef58  dd 14 e0	  cmp $e014,x
$19:ef5b  f7 45		 sbc [$45],y
$19:ef5d  79 3d c9	  adc $c93d,y
$19:ef60  0a			asl a
$19:ef61  0b			phd
$19:ef62  90 0c		 bcc $ef70
$19:ef64  a3 04		 lda $04,s
$19:ef66  03 28		 ora $28,s
$19:ef68  c9 00		 cmp #$00
$19:ef6a  ca			dex
$19:ef6b  34 49		 bit $49,x
$19:ef6d  ee 08 50	  inc $5008
$19:ef70  6c 90 ed	  jmp ($ed90)
$19:ef73  1c 60 3b	  trb $3b60
$19:ef76  47 58		 eor [$58]
$19:ef78  0e d1 e6	  asl $e6d1
$19:ef7b  c8			iny
$19:ef7c  50 c8		 bvc $ef46
$19:ef7e  52 4f		 eor ($4f)
$19:ef80  a5 fd		 lda $fd
$19:ef82  ff c9 cc 97   sbc $97ccc9,x
$19:ef86  fe 39 3c	  inc $3c39,x
$19:ef89  f0 c8		 beq $ef53
$19:ef8b  63 50		 adc $50,s
$19:ef8d  41 c4		 eor ($c4,x)
$19:ef8f  15 98		 ora $98,x
$19:ef91  75 13		 adc $13,x
$19:ef93  21 84		 and ($84,x)
$19:ef95  c2 cc		 rep #$cc
$19:ef97  9c b8 12	  stz $12b8
$19:ef9a  a9 ef		 lda #$ef
$19:ef9c  66 43		 ror $43
$19:ef9e  81 ae		 sta ($ae,x)
$19:efa0  b6 09		 ldx $09,y
$19:efa2  00 31		 brk #$31
$19:efa4  83 d5		 sta $d5,s
$19:efa6  04 61		 tsb $61
$19:efa8  4c a6 35	  jmp $35a6
$19:efab  d2 ec		 cmp ($ec)
$19:efad  de 5d 01	  dec $015d,x
$19:efb0  69 44		 adc #$44
$19:efb2  61 ca		 adc ($ca,x)
$19:efb4  6f 2f 99 bc   adc $bc992f
$19:efb8  b0 2a		 bcs $efe4
$19:efba  68			pla
$19:efbb  d4 18		 pei ($18)
$19:efbd  20 96 28	  jsr $2896
$19:efc0  f5 34		 sbc $34,x
$19:efc2  16 94		 asl $94,x
$19:efc4  80 92		 bra $ef58
$19:efc6  dc 81 0f	  jml [$0f81]
$19:efc9  9c 09 2f	  stz $2f09
$19:efcc  18			clc
$19:efcd  24 be		 bit $be
$19:efcf  20 43 c3	  jsr $c343
$19:efd2  29 c0		 and #$c0
$19:efd4  b4 9b		 ldy $9b,x
$19:efd6  11 96		 ora ($96),y
$19:efd8  c1 4e		 cmp ($4e,x)
$19:efda  11 b6		 ora ($b6),y
$19:efdc  28			plp
$19:efdd  8c ba 62	  sty $62ba
$19:efe0  32 f0		 and ($f0)
$19:efe2  8a			txa
$19:efe3  cf de 23 2f   cmp $2f23de
$19:efe7  cc 8c b0	  cpy $b08c
$19:efea  8a			txa
$19:efeb  78			sei
$19:efec  8d a3 b4	  sta $b4a3
$19:efef  f0 5a		 beq $f04b
$19:eff1  4c 92 8b	  jmp $8b92
$19:eff4  47 45		 eor [$45]
$19:eff6  3d 71 28	  and $2871,x
$19:eff9  b7 14		 lda [$14],y
$19:effb  a2 e1		 ldx #$e1
$19:effd  91 4f		 sta ($4f),y
$19:efff  9b			txy
$19:f000  4a			lsr a
$19:f001  2e c1 28	  rol $28c1
$19:f004  bc 54 53	  ldy $5354,x
$19:f007  f6 92		 inc $92,x
$19:f009  8b			phb
$19:f00a  04 a8		 tsb $a8
$19:f00c  41 42		 eor ($42,x)
$19:f00e  87 2e		 sta [$2e]
$19:f010  75 2d		 adc $2d,x
$19:f012  62 a1 07	  per $f7b6
$19:f015  0a			asl a
$19:f016  1e 09 f4	  asl $f409,x
$19:f019  ba			tsx
$19:f01a  ca			dex
$19:f01b  81 c4		 sta ($c4,x)
$19:f01d  3f c9 e3 eb   and $ebe3c9,x
$19:f021  02 84		 cop #$84
$19:f023  72 11		 adc ($11)
$19:f025  08			php
$19:f026  04 80		 tsb $80
$19:f028  70 21		 bvs $f04b
$19:f02a  92 75		 sta ($75)
$19:f02c  94 22		 sty $22,x
$19:f02e  21 08		 and ($08,x)
$19:f030  92 9d		 sta ($9d)
$19:f032  c2 0f		 rep #$0f
$19:f034  01 14		 ora ($14,x)
$19:f036  0d 02 02	  ora $0202
$19:f039  17 38		 ora [$38],y
$19:f03b  23 a0		 and $a0,s
$19:f03d  20 82 70	  jsr $7082
$19:f040  c3 41		 cmp $41,s
$19:f042  06 62		 asl $62
$19:f044  18			clc
$19:f045  18			clc
$19:f046  10 5f		 bpl $f0a7
$19:f048  e1 70		 sbc ($70,x)
$19:f04a  d9 a0 ac	  cmp $aca0,y
$19:f04d  8b			phb
$19:f04e  22 32 49 10   jsl $104932
$19:f052  e5 30		 sbc $30
$19:f054  e4 04		 cpx $04
$19:f056  81 40		 sta ($40,x)
$19:f058  86 60		 stx $60
$19:f05a  19 b8 0c	  ora $0cb8,y
$19:f05d  20 4e 13	  jsr $134e
$19:f060  51 28		 eor ($28),y
$19:f062  a2 01		 ldx #$01
$19:f064  16 06		 asl $06,x
$19:f066  30 3c		 bmi $f0a4
$19:f068  98			tya
$19:f069  e4 20		 cpx $20
$19:f06b  a3 c5		 lda $c5,s
$19:f06d  3c 95 08	  bit $0895,x
$19:f070  f3 e2		 sbc ($e2,s),y
$19:f072  f0 92		 beq $f006
$19:f074  23 49		 and $49,s
$19:f076  76 29		 ror $29,x
$19:f078  44 34 94	  mvp $94,$34
$19:f07b  14 dc		 trb $dc
$19:f07d  34 45		 bit $45,x
$19:f07f  19 c0 a8	  ora $a8c0,y
$19:f082  44 8a 1c	  mvp $1c,$8a
$19:f085  80 94		 bra $f01b
$19:f087  61 50		 adc ($50,x)
$19:f089  e9 2e		 sbc #$2e
$19:f08b  00 58		 brk #$58
$19:f08d  2e c1 e0	  rol $e0c1
$19:f090  10 4e		 bpl $f0e0
$19:f092  0c 40 20	  tsb $2040
$19:f095  c8			iny
$19:f096  49 88		 eor #$88
$19:f098  f6 e7		 inc $e7,x
$19:f09a  38			sec
$19:f09b  7c 26 69	  jmp ($6926,x)
$19:f09e  80 16		 bra $f0b6
$19:f0a0  08			php
$19:f0a1  58			cli
$19:f0a2  5e c9 08	  lsr $08c9,x
$19:f0a5  7e a4 a0	  ror $a0a4,x
$19:f0a8  f1 61		 sbc ($61),y
$19:f0aa  11 44		 ora ($44),y
$19:f0ac  04 4a		 tsb $4a
$19:f0ae  0d 35 0c	  ora $0c35
$19:f0b1  82 3c 08	  brl $f8f0
$19:f0b4  02 f6		 cop #$f6
$19:f0b6  03 21		 ora $21,s
$19:f0b8  3f 09 82 00   and $008209,x
$19:f0bc  20 a1 0b	  jsr $0ba1
$19:f0bf  fd e6 12	  sbc $12e6,x
$19:f0c2  42 19		 wdm #$19
$19:f0c4  1a			inc a
$19:f0c5  84 94		 sty $94
$19:f0c7  90 42		 bcc $f10b
$19:f0c9  8a			txa
$19:f0ca  4a			lsr a
$19:f0cb  28			plp
$19:f0cc  41 30		 eor ($30,x)
$19:f0ce  19 84 5a	  ora $5a84,y
$19:f0d1  00 04		 brk #$04
$19:f0d3  01 98		 ora ($98,x)
$19:f0d5  0c 41 6c	  tsb $6c41
$19:f0d8  30 08		 bmi $f0e2
$19:f0da  c2 98		 rep #$98
$19:f0dc  28			plp
$19:f0dd  01 11		 ora ($11,x)
$19:f0df  8c 42 21	  sty $2142
$19:f0e2  15 00		 ora $00,x
$19:f0e4  88			dey
$19:f0e5  2e 80 62	  rol $6280
$19:f0e8  08			php
$19:f0e9  20 2a 08	  jsr $082a
$19:f0ec  50 21		 bvc $f10f
$19:f0ee  62 e0 4d	  per $3ed1
$19:f0f1  83 a8		 sta $a8,s
$19:f0f3  42 22		 wdm #$22
$19:f0f5  85 88		 sta $88
$19:f0f7  32 41		 and ($41)
$19:f0f9  28			plp
$19:f0fa  29 74		 and #$74
$19:f0fc  a8			tay
$19:f0fd  a5 c8		 lda $c8
$19:f0ff  62 15 20	  per $1117
$19:f102  20 28 0a	  jsr $0a28
$19:f105  a6 a5		 ldx $a5
$19:f107  48			pha
$19:f108  72 b1		 adc ($b1)
$19:f10a  21 b0		 and ($b0,x)
$19:f10c  44 1f a5	  mvp $a5,$1f
$19:f10f  3d 4a 92	  and $924a,x
$19:f112  b8			clv
$19:f113  14 05		 trb $05
$19:f115  cc 52 a7	  cpy $a752
$19:f118  5d c1 98	  eor $98c1,x
$19:f11b  3f 18 7b 05   and $057b18,x
$19:f11f  49 c0		 eor #$c0
$19:f121  20 a1 6e	  jsr $6ea1
$19:f124  2c b8 2a	  bit $2ab8
$19:f127  92 d7		 sta ($d7)
$19:f129  58			cli
$19:f12a  bd 81 dc	  lda $dc81,x
$19:f12d  05 54		 ora $54
$19:f12f  75 8c		 adc $8c,x
$19:f131  00 12		 brk #$12
$19:f133  10 89		 bpl $f0be
$19:f135  29 88		 and #$88
$19:f137  20 e0 f0	  jsr $f0e0
$19:f13a  33 85		 and ($85,s),y
$19:f13c  02 02		 cop #$02
$19:f13e  62 02 b8	  per $a943
$19:f141  85 40		 sta $40
$19:f143  c4 2f		 cpy $2f
$19:f145  60			rts
$19:f146  79 01 cc	  adc $cc01,y
$19:f149  8f 26 5f 58   sta $585f26
$19:f14d  5c 36 68 69   jml $696836
$19:f151  24 80		 bit $80
$19:f153  9c 12 44	  stz $4412
$19:f156  77 48		 adc [$48],y
$19:f158  11 dc		 ora ($dc),y
$19:f15a  4a			lsr a
$19:f15b  f6 16		 inc $16,x
$19:f15d  18			clc
$19:f15e  84 d4		 sty $d4
$19:f160  c6 21		 dec $21
$19:f162  60			rts
$19:f163  5d 81 c0	  eor $c081,x
$19:f166  15 26		 ora $26,x
$19:f168  77 15		 adc [$15],y
$19:f16a  49 50		 eor #$50
$19:f16c  95 3e		 sta $3e,x
$19:f16e  66 09		 ror $09
$19:f170  22 f4 9c 82   jsl $829cf4
$19:f174  c4 45		 cpy $45
$19:f176  01 34		 ora ($34,x)
$19:f178  c6 04		 dec $04
$19:f17a  0d 04 07	  ora $0704
$19:f17d  42 a1		 wdm #$a1
$19:f17f  d2 5c		 cmp ($5c)
$19:f181  01 a8		 ora ($a8,x)
$19:f183  41 c3		 eor ($c3,x)
$19:f185  c0 3c 1c	  cpy #$1c3c
$19:f188  18			clc
$19:f189  ee 47 c0	  inc $c047
$19:f18c  93 1f		 sta ($1f,s),y
$19:f18e  be 11 0f	  ldx $0f11,y
$19:f191  84 cd		 sty $cd
$19:f193  02 24		 cop #$24
$19:f195  38			sec
$19:f196  10 c2		 bpl $f15a
$19:f198  42 03		 wdm #$03
$19:f19a  e9 28		 sbc #$28
$19:f19c  54 7c 22	  mvn $22,$7c
$19:f19f  25 06		 and $06
$19:f1a1  9a			txs
$19:f1a2  e0 17 c2	  cpx #$c217
$19:f1a5  62 12 10	  per $01ba
$19:f1a8  26 c8		 rol $c8
$19:f1aa  3c 4e a0	  bit $a04e,x
$19:f1ad  12 03		 ora ($03)
$19:f1af  4b			phk
$19:f1b0  c1 a3		 cmp ($a3,x)
$19:f1b2  24 32		 bit $32
$19:f1b4  92 30		 sta ($30)
$19:f1b6  4d 89 04	  eor $0489
$19:f1b9  39 a4 a1	  and $a1a4,y
$19:f1bc  f8			sed
$19:f1bd  2d d0 8b	  and $8bd0
$19:f1c0  40			rti
$19:f1c1  04 c0		 tsb $c0
$19:f1c3  dd 07 90	  cmp $9007,x
$19:f1c6  41 46		 eor ($46,x)
$19:f1c8  83 18		 sta $18,s
$19:f1ca  2c 05 00	  bit $0005
$19:f1cd  4c 31 88	  jmp $8831
$19:f1d0  44 22 a0	  mvp $a0,$22
$19:f1d3  50 05		 bvc $f1da
$19:f1d5  e8			inx
$19:f1d6  03 04		 ora $04,s
$19:f1d8  a0 0f 20	  ldy #$200f
$19:f1db  1b			tcs
$19:f1dc  04 2c		 tsb $2c
$19:f1de  4c 0e 30	  jmp $300e
$19:f1e1  79 05 08	  adc $0805,y
$19:f1e4  4c 2a 78	  jmp $782a
$19:f1e7  83 2c		 sta $2c,s
$19:f1e9  92 82		 sta ($82)
$19:f1eb  b9 4a 8b	  lda $8b4a,y
$19:f1ee  01 21		 ora ($21,x)
$19:f1f0  ac 74 87	  ldy $8774
$19:f1f3  2e 48 b2	  rol $b248
$19:f1f6  15 26		 ora $26,x
$19:f1f8  72 54		 adc ($54)
$19:f1fa  da			phx
$19:f1fb  b6 b1		 ldx $b1,y
$19:f1fd  f6 11		 inc $11,x
$19:f1ff  4a			lsr a
$19:f200  98			tya
$19:f201  e9 2b		 sbc #$2b
$19:f203  67 7b		 adc [$7b]
$19:f205  7f de 0b 2d   adc $2d0bde,x
$19:f209  63 a4		 adc $a4,s
$19:f20b  b9 ff e4	  lda $e4ff,y
$19:f20e  90 20		 bcc $f230
$19:f210  81 dd		 sta ($dd,x)
$19:f212  0b			phd
$19:f213  a0 fb 10	  ldy #$10fb
$19:f216  40			rti
$19:f217  55 a0		 eor $a0,x
$19:f219  88			dey
$19:f21a  21 44		 and ($44,x)
$19:f21c  0d 11 f6	  ora $f611
$19:f21f  20 10 a3	  jsr $a310
$19:f222  22 c9 2c 34   jsl $342cc9
$19:f226  48			pha
$19:f227  09 f4		 ora #$f4
$19:f229  aa			tax
$19:f22a  90 45		 bcc $f271
$19:f22c  08			php
$19:f22d  af 42 88 8b   lda $8b8842
$19:f231  04 a1		 tsb $a1
$19:f233  60			rts
$19:f234  93 29		 sta ($29,s),y
$19:f236  82 49 09	  brl $fb82
$19:f239  e7 ea		 sbc [$ea]
$19:f23b  e8			inx
$19:f23c  b4 ab		 ldy $ab,x
$19:f23e  a4 92		 ldy $92
$19:f240  8e 99 4a	  stx $4a99
$19:f243  3a			dec a
$19:f244  83 d6		 sta $d6,s
$19:f246  23 92		 and $92,s
$19:f248  4c a6 49	  jmp $49a6
$19:f24b  79 e8 71	  adc $71e8,y
$19:f24e  ac 22 d2	  ldy $d222
$19:f251  b0 92		 bcs $f1e5
$19:f253  4a			lsr a
$19:f254  42 65		 wdm #$65
$19:f256  29 0e		 and #$0e
$19:f258  6f 58 8e 0d   adc $0d8e58
$19:f25c  32 98		 and ($98)
$19:f25e  30 17		 bmi $f277
$19:f260  c2 21		 rep #$21
$19:f262  70 da		 bvs $f23e
$19:f264  b6 11		 ldx $11,y
$19:f266  04 25		 tsb $25
$19:f268  a1 e2		 lda ($e2,x)
$19:f26a  2a			rol a
$19:f26b  46 27		 lsr $27
$19:f26d  05 a3		 ora $a3
$19:f26f  17 48		 ora [$48],y
$19:f271  d0 3c		 bne $f2af
$19:f273  41 68		 eor ($68,x)
$19:f275  92 82		 sta ($82)
$19:f277  e8			inx
$19:f278  ed 4c 22	  sbc $224c
$19:f27b  b8			clv
$19:f27c  a3 10		 lda $10,s
$19:f27e  0c 11 74	  tsb $7411
$19:f281  90 82		 bcc $f205
$19:f283  64 12		 stz $12
$19:f285  5f d5 cb a9   eor $a9cbd5,x
$19:f289  57 32		 eor [$32],y
$19:f28b  25 1c		 and $1c
$19:f28d  d6 94		 dec $94,x
$19:f28f  73 97		 adc ($97,s),y
$19:f291  a0 c7 24	  ldy #$24c7
$19:f294  87 4c		 sta [$4c]
$19:f296  92 3b		 sta ($3b)
$19:f298  c2 64		 rep #$64
$19:f29a  5d 20 d8	  eor $d820,x
$19:f29d  99 0a 21	  sta $210a,y
$19:f2a0  08			php
$19:f2a1  a4 17		 ldy $17
$19:f2a3  49 e8 2b	  eor #$2be8
$19:f2a6  8f 41 8e 0d   sta $0d8e41
$19:f2aa  0e 98 33	  asl $3398
$19:f2ad  20 94 c1	  jsr $c194
$19:f2b0  16 10		 asl $10,x
$19:f2b2  22 90 94 42   jsl $429490
$19:f2b6  0d 00 80	  ora $8000
$19:f2b9  c3 08		 cmp $08,s
$19:f2bb  21 0a		 and ($0a,x)
$19:f2bd  b3 1e		 lda ($1e,s),y
$19:f2bf  46 21		 lsr $21
$19:f2c1  02 84		 cop #$84
$19:f2c3  58			cli
$19:f2c4  0f 20 e5 01   ora $01e520
$19:f2c8  98			tya
$19:f2c9  58			cli
$19:f2ca  58			cli
$19:f2cb  c0 8b 08	  cpy #$088b
$19:f2ce  4c 27 00	  jmp $0027
$19:f2d1  3d 28 8c	  and $8c28,x
$19:f2d4  07 20		 ora [$20]
$19:f2d6  c6 07		 dec $07
$19:f2d8  98			tya
$19:f2d9  44 a0 14	  mvp $14,$a0
$19:f2dc  36 30		 rol $30,x
$19:f2de  87 68		 sta [$68]
$19:f2e0  98			tya
$19:f2e1  a2 93 b4	  ldx #$b493
$19:f2e4  0b			phd
$19:f2e5  fc 40 11	  jsr ($1140,x)
$19:f2e8  0c 09 10	  tsb $1009
$19:f2eb  a1 50		 lda ($50,x)
$19:f2ed  8c 89 4a	  sty $4a89
$19:f2f0  d8			cld
$19:f2f1  c0 29 3b	  cpy #$3b29
$19:f2f4  51 b9		 eor ($b9),y
$19:f2f6  db			stp
$19:f2f7  a0 3a 0b	  ldy #$0b3a
$19:f2fa  11 2e		 ora ($2e),y
$19:f2fc  1b			tcs
$19:f2fd  a0 46 06	  ldy #$0646
$19:f300  aa			tax
$19:f301  17 c4		 ora [$c4],y
$19:f303  28			plp
$19:f304  10 48		 bpl $f34e
$19:f306  65 24		 adc $24
$19:f308  96 29		 stx $29,y
$19:f30a  60			rts
$19:f30b  63 85		 adc $85,s
$19:f30d  11 c6		 ora ($c6),y
$19:f30f  22 a0 ac b2   jsl $b2aca0
$19:f313  49 a8 34	  eor #$34a8
$19:f316  40			rti
$19:f317  31 40		 and ($40),y
$19:f319  2b			pld
$19:f31a  c0 52 0a	  cpy #$0a52
$19:f31d  05 39		 ora $39
$19:f31f  69 ec 51	  adc #$51ec
$19:f322  a5 32		 lda $32
$19:f324  52 94		 eor ($94)
$19:f326  d0 4a		 bne $f372
$19:f328  d3 5d		 cmp ($5d,s),y
$19:f32a  2b			pld
$19:f32b  4d ef 77	  eor $77ef
$19:f32e  fd 2d 92	  sbc $922d,x
$19:f331  94 b6		 sty $b6,x
$19:f333  82 56 da	  brl $cd8c
$19:f336  e9 5b 0b	  sbc #$0b5b
$19:f339  7a			ply
$19:f33a  f4 97 73	  pea $7397
$19:f33d  0b			phd
$19:f33e  86 d2		 stx $d2
$19:f340  70 8d		 bvs $f2cf
$19:f342  81 37		 sta ($37,x)
$19:f344  0f 11 86 30   ora $308611
$19:f348  38			sec
$19:f349  ad 64 e2	  lda $e264
$19:f34c  47 c1		 eor [$c1]
$19:f34e  e2 07		 sep #$07
$19:f350  8a			txa
$19:f351  21 7e		 and ($7e,x)
$19:f353  0e 92 f4	  asl $f492
$19:f356  33 c5		 and ($c5,s),y
$19:f358  cf 36 8d 28   cmp $288d36
$19:f35c  e2 94		 sep #$94
$19:f35e  a3 c2		 lda $c2,s
$19:f360  56 8f		 lsr $8f,x
$19:f362  e9 5a 43	  sbc #$435a
$19:f365  7a			ply
$19:f366  5f e9 67 14   eor $1467e9,x
$19:f36a  a5 9e		 lda $9e
$19:f36c  12 b6		 ora ($b6)
$19:f36e  7f 4a da fb   adc $fbda4a,x
$19:f372  c5 21		 cmp $21
$19:f374  19 2b 8a	  ora $8a2b,y
$19:f377  64 19		 stz $19
$19:f379  e0 69		 cpx #$69
$19:f37b  08			php
$19:f37c  0c 06 0f	  tsb $0f06
$19:f37f  00 84		 brk #$84
$19:f381  e2 18		 sep #$18
$19:f383  a3 08		 lda $08,s
$19:f385  80 c2		 bra $f349
$19:f387  29 81 92	  and #$9281
$19:f38a  84 c0		 sty $c0
$19:f38c  2b			pld
$19:f38d  84 70		 sty $70
$19:f38f  67 84		 adc [$84]
$19:f391  46 01		 lsr $01
$19:f393  7d 13 94	  adc $9413,x
$19:f396  26 11		 rol $11
$19:f398  7c 13 94	  jmp ($9413,x)
$19:f39b  06 21		 asl $21
$19:f39d  93 02		 sta ($02,s),y
$19:f39f  78			sei
$19:f3a0  54 71 41	  mvn $41,$71
$19:f3a3  9f 15 78 ef   sta $ef7815,x
$19:f3a7  c2 85		 rep #$85
$19:f3a9  8c 28 f9	  sty $f928
$19:f3ac  8b			phb
$19:f3ad  ce 64 cf	  dec $cf64
$19:f3b0  06 78		 asl $78
$19:f3b2  2b			pld
$19:f3b3  51 ee		 eor ($ee),y
$19:f3b5  0f 72 80 6a   ora $6a8072
$19:f3b9  15 96		 ora $96,x
$19:f3bb  74 17		 stz $17,x
$19:f3bd  80 c2		 bra $f381
$19:f3bf  18			clc
$19:f3c0  05 08		 ora $08
$19:f3c2  78			sei
$19:f3c3  86 e1		 stx $e1
$19:f3c5  2e 0f 10	  rol $100f
$19:f3c8  6f 06 a9 ba   adc $baa906
$19:f3cc  4d f0 dd	  eor $ddf0
$19:f3cf  30 7d		 bmi $f44e
$19:f3d1  a5 fa		 lda $fa
$19:f3d3  b7 22		 lda [$22],y
$19:f3d5  6e d5 9e	  ror $9ed5
$19:f3d8  bc 1d 64	  ldy $641d,x
$19:f3db  08			php
$19:f3dc  2d eb 30	  and $30eb
$19:f3df  e6 0a		 inc $0a
$19:f3e1  bd 78 3c	  lda $3c78,x
$19:f3e4  a1 ff		 lda ($ff,x)
$19:f3e6  89 8b 84	  bit #$848b
$19:f3e9  55 f1		 eor $f1,x
$19:f3eb  e0 9a		 cpx #$9a
$19:f3ed  6c a8 20	  jmp ($20a8)
$19:f3f0  f2 ff		 sbc ($ff)
$19:f3f2  3e 8e 00	  rol $008e,x
$19:f3f5  92 17		 sta ($17)
$19:f3f7  98			tya
$19:f3f8  c8			iny
$19:f3f9  9e 31 05	  stz $0531,x
$19:f3fc  81 c0		 sta ($c0,x)
$19:f3fe  23 59		 and $59,s
$19:f400  62 a0 41	  per $35a3
$19:f403  20 90 a8	  jsr $a890
$19:f406  86 9a		 stx $9a
$19:f408  04 39		 tsb $39
$19:f40a  18			clc
$19:f40b  14 43		 trb $43
$19:f40d  7c 38 28	  jmp ($2838,x)
$19:f410  94 03		 sty $03,x
$19:f412  bc f1 39	  ldy $39f1,x
$19:f415  03 11		 ora $11,s
$19:f417  60			rts
$19:f418  ae c0 58	  ldx $58c0
$19:f41b  84 3e		 sty $3e
$19:f41d  12 ae		 ora ($ae)
$19:f41f  14 b0		 trb $b0
$19:f421  44 21 12	  mvp $12,$21
$19:f424  53 f8		 eor ($f8,s),y
$19:f426  41 e0		 eor ($e0,x)
$19:f428  2d d1 a0	  and $a0d1
$19:f42b  0e 45 8e	  asl $8e45
$19:f42e  43 92		 eor $92,s
$19:f430  0d 13 1b	  ora $1b13
$19:f433  da			phx
$19:f434  e4 e2		 cpx $e2
$19:f436  08			php
$19:f437  5c 36 68 e7   jml $e76836
$19:f43b  44 f9 42	  mvp $42,$f9
$19:f43e  01 c2		 ora ($c2,x)
$19:f440  ee 42 a0	  inc $a042
$19:f443  1d 81 f1	  ora $f181,x
$19:f446  70 56		 bvs $f49e
$19:f448  a9 c0 44	  lda #$44c0
$19:f44b  eb			xba
$19:f44c  01 84		 ora ($84,x)
$19:f44e  37 02		 and [$02],y
$19:f450  6a			ror a
$19:f451  93 12		 sta ($12,s),y
$19:f453  20 11 c1	  jsr $c111
$19:f456  ce 22 72	  dec $7222
$19:f459  73 88		 adc ($88,s),y
$19:f45b  a7 d5		 lda [$d5]
$19:f45d  c2 4c		 rep #$4c
$19:f45f  18			clc
$19:f460  44 90 92	  mvp $92,$90
$19:f463  47 01		 eor [$01]
$19:f465  73 81		 adc ($81,s),y
$19:f467  60			rts
$19:f468  93 e0		 sta ($e0,s),y
$19:f46a  51 38		 eor ($38),y
$19:f46c  15 01		 ora $01,x
$19:f46e  37 0c		 and [$0c],y
$19:f470  f5 56		 sbc $56,x
$19:f472  06 5d		 asl $5d
$19:f474  b2 50		 lda ($50)
$19:f476  c8			iny
$19:f477  74 97		 stz $97,x
$19:f479  00 e1		 brk #$e1
$19:f47b  15 08		 ora $08,x
$19:f47d  f0 17		 beq $f496
$19:f47f  c3 02		 cmp $02,s
$19:f481  88			dey
$19:f482  41 83		 eor ($83,x)
$19:f484  e5 12		 sbc $12
$19:f486  80 49		 bra $f4d1
$19:f488  9e 06 8d	  stz $8d06,x
$19:f48b  f0 c8		 beq $f455
$19:f48d  c4 61		 cpy $61
$19:f48f  33 45		 and ($45,s),y
$19:f491  21 34		 and ($34,x)
$19:f493  85 56		 sta $56
$19:f495  90 85		 bcc $f41c
$19:f497  92 4a		 sta ($4a)
$19:f499  04 c6		 tsb $c6
$19:f49b  be 91 b0	  ldx $b091,y
$19:f49e  32 cc		 and ($cc)
$19:f4a0  98			tya
$19:f4a1  11 48		 ora ($48),y
$19:f4a3  34 d5		 bit $d5,x
$19:f4a5  48			pha
$19:f4a6  04 b0		 tsb $b0
$19:f4a8  01 8a		 ora ($8a,x)
$19:f4aa  ac 1b a0	  ldy $a01b
$19:f4ad  af 48 0a d8   lda $d80a48
$19:f4b1  4a			lsr a
$19:f4b2  e6 ef		 inc $ef
$19:f4b4  f3 68		 sbc ($68,s),y
$19:f4b6  aa			tax
$19:f4b7  02 48		 cop #$48
$19:f4b9  06 21		 asl $21
$19:f4bb  a0 83		 ldy #$83
$19:f4bd  51 32		 eor ($32),y
$19:f4bf  01 53		 ora ($53,x)
$19:f4c1  94 22		 sty $22,x
$19:f4c3  04 c4		 tsb $c4
$19:f4c5  11 a5		 ora ($a5),y
$19:f4c7  70 3d		 bvs $f506
$19:f4c9  05 e6		 ora $e6
$19:f4cb  0b			phd
$19:f4cc  10 57		 bpl $f525
$19:f4ce  04 5a		 tsb $5a
$19:f4d0  01 14		 ora ($14,x)
$19:f4d2  d3 a7		 cmp ($a7,s),y
$19:f4d4  46 31		 lsr $31
$19:f4d6  04 88		 tsb $88
$19:f4d8  22 04 c6 10   jsl $10c604
$19:f4dc  c8			iny
$19:f4dd  45 40		 eor $40
$19:f4df  62 30 88	  per $7d12
$19:f4e2  24 22		 bit $22
$19:f4e4  14 31		 trb $31
$19:f4e6  07 98		 ora [$98]
$19:f4e8  1c c2 16	  trb $16c2
$19:f4eb  cf 18 84 52   cmp $528418
$19:f4ef  01 42		 ora ($42,x)
$19:f4f1  10 89		 bpl $f47c
$19:f4f3  3e 20 e5	  rol $e520,x
$19:f4f6  ab			plb
$19:f4f7  a0 9a		 ldy #$9a
$19:f4f9  12 a2		 ora ($a2)
$19:f4fb  76 48		 ror $48,x
$19:f4fd  71 a0		 adc ($a0),y
$19:f4ff  90 21		 bcc $f522
$19:f501  52 3e		 eor ($3e)
$19:f503  a5 4c		 lda $4c
$19:f505  de 90 d4	  dec $d490,x
$19:f508  25 96		 and $96
$19:f50a  7c d5 32	  jmp ($32d5,x)
$19:f50d  a3 b2		 lda $b2,s
$19:f50f  4a			lsr a
$19:f510  cf be 8e f4   cmp $f48ebe
$19:f514  fc 1c 4a	  jsr ($4a1c,x)
$19:f517  5a			phy
$19:f518  ed 49 72	  sbc $7249
$19:f51b  bb			tyx
$19:f51c  56 a1		 lsr $a1,x
$19:f51e  0f 02 8a d4   ora $d48a02
$19:f522  00 c0		 brk #$c0
$19:f524  78			sei
$19:f525  17 d8		 ora [$d8],y
$19:f527  82 02 11	  brl $062c
$19:f52a  e6 23		 inc $23
$19:f52c  80 20		 bra $f54e
$19:f52e  49 a1 44	  eor #$44a1
$19:f531  24 8c		 bit $8c
$19:f533  22 01 f6 27   jsl $27f601
$19:f537  91 68		 sta ($68),y
$19:f539  4a			lsr a
$19:f53a  c2 3d		 rep #$3d
$19:f53c  ff 39 3d 3c   sbc $3c3d39,x
$19:f540  e5 64		 sbc $64
$19:f542  fb			xce
$19:f543  97 53		 sta [$53],y
$19:f545  ee 64 f2	  inc $f264
$19:f548  58			cli
$19:f549  fa			plx
$19:f54a  09 e9 e8	  ora #$e8e9
$19:f54d  2b			pld
$19:f54e  27 e0		 and [$e0]
$19:f550  ba			tsx
$19:f551  9f 84 71 c5   sta $c57184,x
$19:f555  60			rts
$19:f556  1f 3f f9 84   ora $84f93f,x
$19:f55a  0c 20 10	  tsb $1020
$19:f55d  10 39		 bpl $f598
$19:f55f  75 89		 adc $89,x
$19:f561  e6 cb		 inc $cb
$19:f563  05 c3		 ora $c3
$19:f565  90 c9		 bcc $f530
$19:f567  8a			txa
$19:f568  bd 76 6a	  lda $6a76,x
$19:f56b  75 da		 adc $da,x
$19:f56d  9e eb 1e	  stz $1eeb,x
$19:f570  c3 35		 cmp $35,s
$19:f572  3b			tsc
$19:f573  08			php
$19:f574  ef 25 8e 80   sbc $808e25
$19:f578  9e 9a 02	  stz $029a,x
$19:f57b  b2 6c		 lda ($6c)
$19:f57d  16 29		 asl $29,x
$19:f57f  b0 06		 bcs $f587
$19:f581  78			sei
$19:f582  74 78		 stz $78,x
$19:f584  02 14		 cop #$14
$19:f586  e0 0a 13	  cpx #$130a
$19:f589  a0 b1 4e	  ldy #$4eb1
$19:f58c  80 db		 bra $f569
$19:f58e  c3 a3		 cmp $a3,s
$19:f590  e0 10 a7	  cpx #$a710
$19:f593  80 50		 bra $f5e5
$19:f595  9f 05 8a 7c   sta $7c8a05,x
$19:f599  1e 07 18	  asl $1807,x
$19:f59c  57 83		 eor [$83],y
$19:f59e  70 c3		 bvs $f563
$19:f5a0  2b			pld
$19:f5a1  c9 10 a7	  cmp #$a710
$19:f5a4  24 50		 bit $50
$19:f5a6  9d 94 1a	  sta $1a94,x
$19:f5a9  76 5e		 ror $5e,x
$19:f5ab  1e eb 1e	  asl $1eeb,x
$19:f5ae  43 a5		 eor $a5,s
$19:f5b0  39 08 af	  and $af08,y
$19:f5b3  0e 8f a4	  asl $a48f
$19:f5b6  42 9e		 wdm #$9e
$19:f5b8  91 42		 sta ($42),y
$19:f5ba  7e 50 69	  ror $6950,x
$19:f5bd  f9 30 78	  sbc $7830,y
$19:f5c0  74 74		 stz $74,x
$19:f5c2  22 14 d0 8a   jsl $8ad014
$19:f5c6  13 62		 ora ($62,s),y
$19:f5c8  83 4d		 sta $4d,s
$19:f5ca  8b			phb
$19:f5cb  eb			xba
$19:f5cc  de a3 c1	  dec $c1a3,x
$19:f5cf  72 a7		 adc ($a7)
$19:f5d1  04 a4		 tsb $a4
$19:f5d3  9d 14 1a	  sta $1a14,x
$19:f5d6  74 44		 stz $44,x
$19:f5d8  9e f5 1f	  stz $1ff5,x
$19:f5db  0b			phd
$19:f5dc  95 3c		 sta $3c,x
$19:f5de  21 64		 and ($64,x)
$19:f5e0  f8			sed
$19:f5e1  a0 d3 e2	  ldy #$e2d3
$19:f5e4  b4 38		 ldy $38,x
$19:f5e6  b4 03		 ldy $03,x
$19:f5e8  e4 bc		 cpx $bc
$19:f5ea  ad b3 25	  lda $25b3
$19:f5ed  36 c7		 rol $c7,x
$19:f5ef  8f 65 8f 19   sta $198f65
$19:f5f3  92 9c		 sta ($9c)
$19:f5f5  64 a7		 stz $a7
$19:f5f7  aa			tax
$19:f5f8  c7 8e		 cmp [$8e]
$19:f5fa  a9 4e 39	  lda #$394e
$19:f5fd  38			sec
$19:f5fe  4a			lsr a
$19:f5ff  e4 2b		 cpx $2b
$19:f601  48			pha
$19:f602  0b			phd
$19:f603  60			rts
$19:f604  45 43		 eor $43
$19:f606  a2 03 8b	  ldx #$8b03
$19:f609  3f f8 4e 1f   and $1f4ef8,x
$19:f60d  15 0f		 ora $0f,x
$19:f60f  89 ec 71	  bit #$71ec
$19:f612  88			dey
$19:f613  07 e1		 ora [$e1]
$19:f615  38			sec
$19:f616  6d 95 d2	  adc $d295
$19:f619  02 fd		 cop #$fd
$19:f61b  f8			sed
$19:f61c  3c 41 07	  bit $0741,x
$19:f61f  bf 07 c8 f6   lda $f6c807,x
$19:f623  f6 e9		 inc $e9,x
$19:f625  33 3d		 and ($3d,s),y
$19:f627  e4 45		 cpx $45
$19:f629  ff 03 91 d0   sbc $d09103,x
$19:f62d  c2 1c		 rep #$1c
$19:f62f  89 f1 89	  bit #$89f1
$19:f632  27 bc		 and [$bc]
$19:f634  8c 4b 3b	  sty $3b4b
$19:f637  1a			inc a
$19:f638  8c 02 10	  sty $1002
$19:f63b  d8			cld
$19:f63c  0f 50 d4 1b   ora $1bd450
$19:f640  20 da 13	  jsr $13da
$19:f643  a0 c2 1b	  ldy #$1bc2
$19:f646  21 fa		 and ($fa,x)
$19:f648  6e 93 a0	  ror $a093
$19:f64b  59 1e d9	  eor $d91e,y
$19:f64e  1f 5b 75 3d   ora $3d755b,x
$19:f652  6e 44 fd	  ror $fd44
$19:f655  ba			tsx
$19:f656  d3 f6		 cmp ($f6,s),y
$19:f658  f2 f6		 sbc ($f6)
$19:f65a  c8			iny
$19:f65b  fb			xce
$19:f65c  1b			tcs
$19:f65d  a9 ec 72	  lda #$72ec
$19:f660  27 f1		 and [$f1]
$19:f662  d6 9f		 dec $9f,x
$19:f664  c0 e7 b6	  cpy #$b6e7
$19:f667  47 da		 eor [$da]
$19:f669  dd 4f 69	  cmp $694f,x
$19:f66c  d0 1d		 bne $f68b
$19:f66e  a5 ed		 lda $ed
$19:f670  e2 0e		 sep #$0e
$19:f672  4f db 84 23   eor $2384db
$19:f676  f8			sed
$19:f677  e8			inx
$19:f678  3f ad d4 fe   and $fed4ad,x
$19:f67c  98			tya
$19:f67d  93 fa		 sta ($fa,s),y
$19:f67f  69 4f e9	  adc #$e94f
$19:f682  c3 db		 cmp $db,s
$19:f684  23 b7		 and $b7,s
$19:f686  6e a6 dc	  ror $dca6
$19:f689  c4 9b		 cpy $9b
$19:f68b  74 9a		 stz $9a,x
$19:f68d  6d d3 42	  adc $42d3
$19:f690  ed 24 d8	  sbc $d824
$19:f693  48			pha
$19:f694  19 83 01	  ora $0183,y
$19:f697  2a			rol a
$19:f698  09 50 7f	  ora #$7f50
$19:f69b  d0 20		 bne $f6bd
$19:f69d  02 07		 cop #$07
$19:f69f  00 0e		 brk #$0e
$19:f6a1  80 3b		 bra $f6de
$19:f6a3  d2 7b		 cmp ($7b)
$19:f6a5  03 af		 ora $af,s
$19:f6a7  5b			tcd
$19:f6a8  6a			ror a
$19:f6a9  75 27		 adc $27,x
$19:f6ab  d8			cld
$19:f6ac  5c a0 17 c8   jml $c817a0
$19:f6b0  b8			clv
$19:f6b1  04 2f		 tsb $2f
$19:f6b3  b0 09		 bcs $f6be
$19:f6b5  f3 dc		 sbc ($dc,s),y
$19:f6b7  2d 76 9b	  and $9b76
$19:f6ba  40			rti
$19:f6bb  2c 6f 10	  bit $106f
$19:f6be  58			cli
$19:f6bf  30 44		 bmi $f705
$19:f6c1  20 f8 b9	  jsr $b9f8
$19:f6c4  fc f6 a1	  jsr ($a1f6,x)
$19:f6c7  45 0c		 eor $0c
$19:f6c9  97 c2		 sta [$c2],y
$19:f6cb  07 08		 ora [$08]
$19:f6cd  fa			plx
$19:f6ce  c6 e3		 dec $e3
$19:f6d0  10 98		 bpl $f66a
$19:f6d2  24 5a		 bit $5a
$19:f6d4  7d 53 9e	  adc $9e53,x
$19:f6d7  d4 85		 pei ($85)
$19:f6d9  21 52		 and ($52,x)
$19:f6db  f8			sed
$19:f6dc  87 c2		 sta [$c2]
$19:f6de  37 f3		 and [$f3],y
$19:f6e0  11 8e		 ora ($8e),y
$19:f6e2  1a			inc a
$19:f6e3  7f 80 9f 09   adc $099f80,x
$19:f6e7  82 2d b6	  brl $ad17
$19:f6ea  9c 87 c3	  stz $c387
$19:f6ed  6f 1b 8e 78   adc $788e1b
$19:f6f1  60			rts
$19:f6f2  90 08		 bcc $f6fc
$19:f6f4  b0 d8		 bcs $f6ce
$19:f6f6  30 e4		 bmi $f6dc
$19:f6f8  90 96		 bcc $f690
$19:f6fa  ce c3 e1	  dec $e1c3
$19:f6fd  19 8d 71	  ora $718d,y
$19:f700  24 bc		 bit $bc
$19:f702  9e 43 bc	  stz $bc43,x
$19:f705  22 c5 82 e4   jsl $e482c5
$19:f709  5e a1 51	  lsr $51a1,x
$19:f70c  28			plp
$19:f70d  c4 6a		 cpy $6a
$19:f70f  49 c8 2b	  eor #$2bc8
$19:f712  0b			phd
$19:f713  bc 2e 06	  ldy $062e,x
$19:f716  a0 2b 04	  ldy #$042b
$19:f719  36 15		 rol $15,x
$19:f71b  0b			phd
$19:f71c  85 cc		 sta $cc
$19:f71e  f9 2e f3	  sbc $f32e,y
$19:f721  b8			clv
$19:f722  9e 80 ac	  stz $ac80,x
$19:f725  17 cc		 ora [$cc],y
$19:f727  66 3b		 ror $3b
$19:f729  1d 8f 77	  ora $778f,x
$19:f72c  99 20 a0	  sta $a020,y
$19:f72f  80 f4		 bra $f725
$19:f731  bc bb ce	  ldy $cebb,x
$19:f734  2d 7c bf	  and $bf7c
$19:f737  45 e0		 eor $e0
$19:f739  7d 5d 80	  adc $805d,x
$19:f73c  88			dey
$19:f73d  9d e6 0f	  sta $0fe6,x
$19:f740  20 f8 7b	  jsr $7bf8
$19:f743  63 51		 adc $51,s
$19:f745  b5 22		 lda $22,x
$19:f747  87 c2		 sta [$c2]
$19:f749  31 1c		 and ($1c),y
$19:f74b  82 c4 23	  brl $1b12
$19:f74e  2b			pld
$19:f74f  d0 22		 bne $f773
$19:f751  0a			asl a
$19:f752  dc fc 11	  jml [$11fc]
$19:f755  cf 2c 22 35   cmp $35222c
$19:f759  f3 8e		 sbc ($8e,s),y
$19:f75b  47 0a		 eor [$0a]
$19:f75d  80 ef		 bra $f74e
$19:f75f  23 28		 and $28,s
$19:f761  49 78 90	  eor #$9078
$19:f764  25 e0		 and $e0
$19:f766  46 b6		 lsr $b6
$19:f768  fc 43 20	  jsr ($2043,x)
$19:f76b  35 92		 and $92,x
$19:f76d  49 1a 80	  eor #$801a
$19:f770  dc c5 81	  jml [$81c5]
$19:f773  52 aa		 eor ($aa)
$19:f775  5a			phy
$19:f776  eb			xba
$19:f777  f0 49		 beq $f7c2
$19:f779  ea			nop
$19:f77a  14 d0		 trb $d0
$19:f77c  a1 68		 lda ($68,x)
$19:f77e  7f 93 d0 67   adc $67d093,x
$19:f782  c8			iny
$19:f783  50 be		 bvc $f743
$19:f785  45 c1		 eor $c1
$19:f787  61 7d		 adc ($7d,x)
$19:f789  a0 51 42	  ldy #$4251
$19:f78c  05 51		 ora $51
$19:f78e  9e a3 5a	  stz $5aa3,x
$19:f791  74 f0		 stz $f0,x
$19:f793  09 e8 84	  ora #$84e8
$19:f796  2a			rol a
$19:f797  83 90		 sta $90,s
$19:f799  be 60 96	  ldx $9660,y
$19:f79c  00 a2		 brk #$a2
$19:f79e  1f 3e da 2c   ora $2cda3e,x
$19:f7a2  26 09		 rol $09
$19:f7a4  f6 2a		 inc $2a,x
$19:f7a6  7f 85 48 04   adc $044885,x
$19:f7aa  43 cb		 eor $cb,s
$19:f7ac  20 59 87	  jsr $8759
$19:f7af  9a			txs
$19:f7b0  5a			phy
$19:f7b1  8c 04 60	  sty $6004
$19:f7b4  c5 99		 cmp $99
$19:f7b6  61 b0		 adc ($b0,x)
$19:f7b8  e2 47		 sep #$47
$19:f7ba  e7 11		 sbc [$11]
$19:f7bc  a8			tay
$19:f7bd  4f 22 2c 9a   eor $9a2c22
$19:f7c1  02 88		 cop #$88
$19:f7c3  b6 86		 ldx $86,y
$19:f7c5  33 19		 and ($19,s),y
$19:f7c7  51 07		 eor ($07),y
$19:f7c9  d4 9c		 pei ($9c)
$19:f7cb  17 08		 ora [$08],y
$19:f7cd  01 80		 ora ($80,x)
$19:f7cf  1d 06 c1	  ora $c106,x
$19:f7d2  18			clc
$19:f7d3  dc 66 13	  jml [$1366]
$19:f7d6  00 b8		 brk #$b8
$19:f7d8  9b			txy
$19:f7d9  c5 b0		 cmp $b0
$19:f7db  3a			dec a
$19:f7dc  e9 84 61	  sbc #$6184
$19:f7df  c0 1f 25	  cpy #$251f
$19:f7e2  18			clc
$19:f7e3  61 88		 adc ($88,x)
$19:f7e5  44 fa 1b	  mvp $1b,$fa
$19:f7e8  d4 2a		 pei ($2a)
$19:f7ea  17 12		 ora [$12],y
$19:f7ec  70 02		 bvs $f7f0
$19:f7ee  cc 22 f7	  cpy $f722
$19:f7f1  eb			xba
$19:f7f2  e9 40 1f	  sbc #$1f40
$19:f7f5  45 0d		 eor $0d
$19:f7f7  87 74		 sta [$74]
$19:f7f9  e5 12		 sbc $12
$19:f7fb  98			tya
$19:f7fc  5c 30 38 38   jml $383830
$19:f800  90 68		 bcc $f86a
$19:f802  3e 8f b7	  rol $b78f,x
$19:f805  ca			dex
$19:f806  e5 c3		 sbc $c3
$19:f808  a1 f0		 lda ($f0,x)
$19:f80a  1f bc 44 38   ora $3844bc,x
$19:f80e  37 96		 and [$96],y
$19:f810  b2 39		 lda ($39)
$19:f812  46 41		 lsr $41
$19:f814  19 8d 75	  ora $758d,y
$19:f817  f6 10		 inc $10,x
$19:f819  94 19		 sty $19,x
$19:f81b  31 92		 and ($92),y
$19:f81d  70 79		 bvs $f898
$19:f81f  1f 73 12 7d   ora $7d1273,x
$19:f823  82 c0 8e	  brl $86e6
$19:f826  44 e1 97	  mvp $97,$e1
$19:f829  b6 33		 ldx $33,y
$19:f82b  f4 e4 b2	  pea $b2e4
$19:f82e  58			cli
$19:f82f  5c 2e 67 c9   jml $c9672e
$19:f833  5b			tcd
$19:f834  19 dc 63	  ora $63dc,y
$19:f837  53 59		 eor ($59,s),y
$19:f839  16 ea		 asl $ea,x
$19:f83b  42 ad		 wdm #$ad
$19:f83d  06 32		 asl $32
$19:f83f  21 c3		 and ($c3,x)
$19:f841  a9 28 97	  lda #$9728
$19:f844  48			pha
$19:f845  e4 7b		 cpx $7b
$19:f847  3c 8c 5c	  bit $5c8c,x
$19:f84a  28			plp
$19:f84b  0a			asl a
$19:f84c  43 86		 eor $86,s
$19:f84e  f6 b9		 inc $b9,x
$19:f850  52 19		 eor ($19)
$19:f852  14 8b		 trb $8b
$19:f854  24 38		 bit $38
$19:f856  05 92		 ora $92
$19:f858  5f 2f a5 60   eor $60a52f,x
$19:f85c  ee ee e4	  inc $e4ee
$19:f85f  70 3e		 bvs $f89f
$19:f861  ae c2 33	  ldx $33c2
$19:f864  ec 62 0d	  cpx $0d62
$19:f867  e2 0a		 sep #$0a
$19:f869  b4 1c		 ldy $1c,x
$19:f86b  b8			clv
$19:f86c  80 20		 bra $f88e
$19:f86e  70 83		 bvs $f7f3
$19:f870  48			pha
$19:f871  46 98		 lsr $98
$19:f873  82 87 07	  brl $fffd
$19:f876  20 83 c6	  jsr $c683
$19:f879  0b			phd
$19:f87a  10 8e		 bpl $f80a
$19:f87c  c6 38		 dec $38
$19:f87e  7e 14 18	  ror $1814,x
$19:f881  c3 40		 cmp $40,s
$19:f883  83 05		 sta $05,s
$19:f885  92 49		 sta ($49)
$19:f887  22 0e 10 8e   jsl $8e100e
$19:f88b  6d e4 bc	  adc $bce4
$19:f88e  95 e0		 sta $e0,x
$19:f890  b2 86		 lda ($86)
$19:f892  11 ed		 ora ($ed),y
$19:f894  e3 c6		 sbc $c6,s
$19:f896  e3 9f		 sbc $9f,s
$19:f898  78			sei
$19:f899  d7 b2		 cmp [$b2],y
$19:f89b  48			pha
$19:f89c  bb			tyx
$19:f89d  26 50		 rol $50
$19:f89f  8c c2 35	  sty $35c2
$19:f8a2  fd 90 38	  sbc $3890,x
$19:f8a5  06 62		 asl $62
$19:f8a7  f5 33		 sbc $33,x
$19:f8a9  68			pla
$19:f8aa  91 03		 sta ($03),y
$19:f8ac  c9 38 e1	  cmp #$e138
$19:f8af  c7 23		 cmp [$23]
$19:f8b1  6c 45 e4	  jmp ($e445)
$19:f8b4  42 1c		 wdm #$1c
$19:f8b6  00 45		 brk #$45
$19:f8b8  06 90		 asl $90
$19:f8ba  38			sec
$19:f8bb  d7 9b		 cmp [$9b],y
$19:f8bd  c8			iny
$19:f8be  85 42		 sta $42
$19:f8c0  e2 51		 sep #$51
$19:f8c2  c2 21		 rep #$21
$19:f8c4  65 60		 adc $60
$19:f8c6  13 d4		 ora ($d4,s),y
$19:f8c8  50 61		 bvc $f92b
$19:f8ca  bb			tyx
$19:f8cb  d2 58		 cmp ($58)
$19:f8cd  6c 39 5e	  jmp ($5e39)
$19:f8d0  0c 21 72	  tsb $7221
$19:f8d3  06 1a		 asl $1a
$19:f8d5  7d 83 0a	  adc $0a83,x
$19:f8d8  86 66		 stx $66
$19:f8da  58			cli
$19:f8db  59 18 73	  eor $7318,y
$19:f8de  48			pha
$19:f8df  4b			phk
$19:f8e0  83 81		 sta $81,s
$19:f8e2  a3 51		 lda $51,s
$19:f8e4  1b			tcs
$19:f8e5  61 6c		 adc ($6c,x)
$19:f8e7  45 15		 eor $15
$19:f8e9  f0 2a		 beq $f915
$19:f8eb  70 3a		 bvs $f927
$19:f8ed  75 6a		 adc $6a,x
$19:f8ef  b3 58		 lda ($58,s),y
$19:f8f1  ac 6d e0	  ldy $e06d
$19:f8f4  31 cf		 and ($cf),y
$19:f8f6  b4 55		 ldy $55,x
$19:f8f8  6e 0f 57	  ror $570f
$19:f8fb  94 b0		 sty $b0,x
$19:f8fd  cd eb 1c	  cmp $1ceb
$19:f900  b6 9a		 ldx $9a,y
$19:f902  26 50		 rol $50
$19:f904  d2 26		 cmp ($26)
$19:f906  90 be		 bcc $f8c6
$19:f908  39 85 c0	  and $c085,y
$19:f90b  7c c3 c0	  jmp ($c0c3,x)
$19:f90e  39 86 f1	  and $f186,y
$19:f911  05 83		 ora $83
$19:f913  de 51 42	  dec $4251,x
$19:f916  30 08		 bmi $f920
$19:f918  37 a6		 and [$a6],y
$19:f91a  51 29		 eor ($29),y
$19:f91c  19 0d ea	  ora $ea0d,y
$19:f91f  14 03		 trb $03
$19:f921  38			sec
$19:f922  19 fc 3e	  ora $3efc,y
$19:f925  d1 af		 cmp ($af),y
$19:f927  6a			ror a
$19:f928  5c a1 a1 33   jml $33a1a1
$19:f92c  81 f8		 sta ($f8,x)
$19:f92e  23 69		 and $69,s
$19:f930  00 8e		 brk #$8e
$19:f932  25 d4		 and $d4
$19:f934  32 52		 and ($52)
$19:f936  52 d0		 eor ($d0)
$19:f938  c6 4b		 dec $4b
$19:f93a  b3 24		 lda ($24,s),y
$19:f93c  fb			xce
$19:f93d  46 e3		 lsr $e3
$19:f93f  b1 82		 lda ($82),y
$19:f941  ec 6b a6	  cpx $a66b
$19:f944  1c 75 90	  trb $9075
$19:f947  93 40		 sta ($40,s),y
$19:f949  38			sec
$19:f94a  2f 92 18 04   and $041892
$19:f94e  43 eb		 eor $eb,s
$19:f950  e5 90		 sbc $90
$19:f952  46 d1		 lsr $d1
$19:f954  a3 21		 lda $21,s
$19:f956  7c 9c 0e	  jmp ($0e9c,x)
$19:f959  11 18		 ora ($18),y
$19:f95b  8d 40 a7	  sta $a740
$19:f95e  11 98		 ora ($98),y
$19:f960  8c 1e 4b	  sty $4b1e
$19:f963  b2 27		 lda ($27)
$19:f965  0c f5 4a	  tsb $4af5
$19:f968  4a			lsr a
$19:f969  80 8d		 bra $f8f8
$19:f96b  aa			tax
$19:f96c  02 13		 cop #$13
$19:f96e  2c bf 39	  bit $39bf
$19:f971  03 31		 ora $31,s
$19:f973  3e 82 29	  rol $2982,x
$19:f976  86 39		 stx $39
$19:f978  ed 2d 01	  sbc $012d
$19:f97b  f0 2d		 beq $f9aa
$19:f97d  94 46		 sty $46,x
$19:f97f  80 51		 bra $f9d2
$19:f981  f0 0a		 beq $f98d
$19:f983  51 f1		 eor ($f1),y
$19:f985  48			pha
$19:f986  20 31 a8	  jsr $a831
$19:f989  e2 70		 sep #$70
$19:f98b  2b			pld
$19:f98c  15 8a		 ora $8a,x
$19:f98e  e5 2a		 sbc $2a
$19:f990  9e 4e 06	  stz $064e,x
$19:f993  30 2a		 bmi $f9bf
$19:f995  81 76		 sta ($76,x)
$19:f997  1c fd 84	  trb $84fd
$19:f99a  24 4e		 bit $4e
$19:f99c  38			sec
$19:f99d  81 c0		 sta ($c0,x)
$19:f99f  41 87		 eor ($87,x)
$19:f9a1  a1 3d		 lda ($3d,x)
$19:f9a3  81 d3		 sta ($d3,x)
$19:f9a5  ab			plb
$19:f9a6  55 6a		 eor $6a,x
$19:f9a8  ad 54 6e	  lda $6e54
$19:f9ab  30 68		 bmi $fa15
$19:f9ad  83 28		 sta $28,s
$19:f9af  21 38		 and ($38,x)
$19:f9b1  79 f5 fd	  adc $fdf5,y
$19:f9b4  f4 15 eb	  pea $eb15
$19:f9b7  55 d9		 eor $d9,x
$19:f9b9  8c 11 a8	  sty $a811
$19:f9bc  d4 05		 pei ($05)
$19:f9be  76 04		 ror $04,x
$19:f9c0  d0 8b		 bne $f94d
$19:f9c2  3e 46 bd	  rol $bd46,x
$19:f9c5  6b			rtl
$19:f9c6  ba			tsx
$19:f9c7  31 85		 and ($85),y
$19:f9c9  b0 29		 bcs $f9f4
$19:f9cb  c1 52		 cmp ($52,x)
$19:f9cd  83 e8		 sta $e8,s
$19:f9cf  2a			rol a
$19:f9d0  14 5a		 trb $5a
$19:f9d2  2b			pld
$19:f9d3  18			clc
$19:f9d4  55 41		 eor $41,x
$19:f9d6  f7 4e		 sbc [$4e],y
$19:f9d8  0b			phd
$19:f9d9  e0 6b		 cpx #$6b
$19:f9db  b5 3a		 lda $3a,x
$19:f9dd  95 49		 sta $49,x
$19:f9df  8c 11 cf	  sty $cf11
$19:f9e2  bc 07 ac	  ldy $ac07,x
$19:f9e5  ed 00 39	  sbc $3900
$19:f9e8  52 e9		 eor ($e9)
$19:f9ea  34 8a		 bit $8a,x
$19:f9ec  43 18		 eor $18,s
$19:f9ee  36 f0		 rol $f0,x
$19:f9f0  16 d0		 asl $d0,x
$19:f9f2  71 42		 adc ($42),y
$19:f9f4  c5 41		 cmp $41
$19:f9f6  16 85		 asl $85,x
$19:f9f8  17 e0		 ora [$e0],y
$19:f9fa  97 0e		 sta [$0e],y
$19:f9fc  23 2c		 and $2c,s
$19:f9fe  02 40		 cop #$40
$19:fa00  7d 19 ed	  adc $ed19,x
$19:fa03  32 86		 and ($86)
$19:fa05  6b			rtl
$19:fa06  0f 88 40 19   ora $194088
$19:fa0a  62 a8 0f	  per $09b5
$19:fa0d  0c 13 0d	  tsb $0d13
$19:fa10  3e c0 45	  rol $45c0,x
$19:fa13  8f 62 b7 18   sta $18b762
$19:fa17  eb			xba
$19:fa18  20 38 db	  jsr $db38
$19:fa1b  89 3c		 bit #$3c
$19:fa1d  9b			txy
$19:fa1e  7f 26 43 84   adc $844326,x
$19:fa22  a6 01		 ldx $01
$19:fa24  08			php
$19:fa25  5d 83 70	  eor $7083,x
$19:fa28  0a			asl a
$19:fa29  41 28		 eor ($28,x)
$19:fa2b  43 82		 eor $82,s
$19:fa2d  5c 7f bb 99   jml $99bb7f
$19:fa31  0f 57 61 1c   ora $1c6157
$19:fa35  e2 79		 sep #$79
$19:fa37  44 61 e8	  mvp $e8,$61
$19:fa3a  d3 4a		 cmp ($4a,s),y
$19:fa3c  e5 4a		 sbc $4a
$19:fa3e  81 d3		 sta ($d3,x)
$19:fa40  ed 21 0a	  sbc $0a21
$19:fa43  31 74		 and ($74),y
$19:fa45  07 b5		 ora [$b5]
$19:fa47  2c 92 6d	  bit $6d92
$19:fa4a  cc 95 ce	  cpy $ce95
$19:fa4d  3e f8 cc	  rol $ccf8,x
$19:fa50  6b			rtl
$19:fa51  84 86		 sty $86
$19:fa53  0d f2 1c	  ora $1cf2
$19:fa56  a5 32		 lda $32
$19:fa58  28			plp
$19:fa59  41 08		 eor ($08,x)
$19:fa5b  0e 23 1a	  asl $1a23
$19:fa5e  98			tya
$19:fa5f  e9 a5		 sbc #$a5
$19:fa61  f2 15		 sbc ($15)
$19:fa63  40			rti
$19:fa64  36 02		 rol $02,x
$19:fa66  47 0a		 eor [$0a]
$19:fa68  85 c2		 sta $c2
$19:fa6a  e2 48		 sep #$48
$19:fa6c  30 89		 bmi $f9f7
$19:fa6e  c3 2f		 cmp $2f,s
$19:fa70  78			sei
$19:fa71  6d 91 9c	  adc $9c91
$19:fa74  30 dd		 bmi $fa53
$19:fa76  c9 15		 cmp #$15
$19:fa78  56 ab		 lsr $ab,x
$19:fa7a  57 a5		 eor [$a5],y
$19:fa7c  53 c6		 eor ($c6,s),y
$19:fa7e  e3 08		 sbc $08,s
$19:fa80  68			pla
$19:fa81  84 67		 sty $67
$19:fa83  fb			xce
$19:fa84  01 f7		 ora ($f7,x)
$19:fa86  42 6e		 wdm #$6e
$19:fa88  f6 aa		 inc $aa,x
$19:fa8a  fb			xce
$19:fa8b  c8			iny
$19:fa8c  08			php
$19:fa8d  e2 8f		 sep #$8f
$19:fa8f  11 09		 ora ($09),y
$19:fa91  42 6e		 wdm #$6e
$19:fa93  b6 b0		 ldx $b0,y
$19:fa95  08			php
$19:fa96  95 c5		 sta $c5,x
$19:fa98  3e 11 b8	  rol $b811,x
$19:fa9b  e0 c8		 cpx #$c8
$19:fa9d  23 30		 and $30,s
$19:fa9f  92 d8		 sta ($d8)
$19:faa1  54 5e 43	  mvn $43,$5e
$19:faa4  00 bd		 brk #$bd
$19:faa6  37 c2		 and [$c2],y
$19:faa8  24 d0		 bit $d0
$19:faaa  28			plp
$19:faab  4d 4a a5	  eor $a54a
$19:faae  54 79 14	  mvn $14,$79
$19:fab1  02 1b		 cop #$1b
$19:fab3  0e 6f 8b	  asl $8b6f
$19:fab6  80 21		 bra $fad9
$19:fab8  94 81		 sty $81,x
$19:faba  f8			sed
$19:fabb  52 c0		 eor ($c0)
$19:fabd  62 24 01	  per $fbe4
$19:fac0  b0 92		 bcs $fa54
$19:fac2  86 1f		 stx $1f
$19:fac4  40			rti
$19:fac5  0f 85 16 84   ora $841685
$19:fac9  14 02		 trb $02
$19:facb  38			sec
$19:facc  15 96		 ora $96,x
$19:face  75 43		 adc $43,x
$19:fad0  30 05		 bmi $fad7
$19:fad2  34 6a		 bit $6a,x
$19:fad4  10 0b		 bpl $fae1
$19:fad6  e4 5c		 cpx $5c
$19:fad8  d0 37		 bne $fb11
$19:fada  d2 38		 cmp ($38)
$19:fadc  45 8d		 eor $8d
$19:fade  e3 8a		 sbc $8a,s
$19:fae0  22 85 e2 0b   jsl $0be285
$19:fae4  06 3c		 asl $3c
$19:fae6  0c 1e f2	  tsb $f21e
$19:fae9  65 09		 adc $09
$19:faeb  09 58		 ora #$58
$19:faed  4a			lsr a
$19:faee  a0 f6		 ldy #$f6
$19:faf0  18			clc
$19:faf1  d4 6c		 pei ($6c)
$19:faf3  1a			inc a
$19:faf4  0e a1 96	  asl $96a1
$19:faf7  ba			tsx
$19:faf8  80 ac		 bra $faa6
$19:fafa  2f 60 04 04   and $040460
$19:fafe  6b			rtl
$19:faff  e5 11		 sbc $11
$19:fb01  3e 01 51	  rol $5101,x
$19:fb04  5e c3 1c	  lsr $1cc3,x
$19:fb07  f7 75		 sbc [$75],y
$19:fb09  f6 08		 inc $08,x
$19:fb0b  c0 92		 cpy #$92
$19:fb0d  95 91		 sta $91,x
$19:fb0f  ec 1e 59	  cpx $591e
$19:fb12  04 6a		 tsb $6a
$19:fb14  03 c1		 ora $c1,s
$19:fb16  46 07		 lsr $07
$19:fb18  f4 ac 28	  pea $28ac
$19:fb1b  00 3b		 brk #$3b
$19:fb1d  04 43		 tsb $43
$19:fb1f  c7 38		 cmp [$38]
$19:fb21  4c 82 2c	  jmp $2c82
$19:fb24  64 72		 stz $72
$19:fb26  89 3c		 bit #$3c
$19:fb28  99 a2 5c	  sta $5ca2,y
$19:fb2b  7f bc 6e 3b   adc $3b6ebc,x
$19:fb2f  18			clc
$19:fb30  8e 23 02	  stx $0223
$19:fb33  45 b8		 eor $b8
$19:fb35  df 34 87 7e   cmp $7e8734,x
$19:fb39  d6 0e		 dec $0e,x
$19:fb3b  38			sec
$19:fb3c  b0 23		 bcs $fb61
$19:fb3e  9f 34 60 63   sta $636034,x
$19:fb42  71 d8		 adc ($d8),y
$19:fb44  e1 c8		 sbc ($c8,x)
$19:fb46  c3 21		 cmp $21,s
$19:fb48  f0 04		 beq $fb4e
$19:fb4a  18			clc
$19:fb4b  bd c3 2f	  lda $2fc3,x
$19:fb4e  bb			tyx
$19:fb4f  3b			tsc
$19:fb50  9c 1a 6e	  stz $6e1a
$19:fb53  91 37		 sta ($37),y
$19:fb55  b8			clv
$19:fb56  4b			phk
$19:fb57  a4 50		 ldy $50
$19:fb59  8f 6c 67 6f   sta $6f676c
$19:fb5d  d6 56		 dec $56,x
$19:fb5f  08			php
$19:fb60  1d 24 32	  ora $3224,x
$19:fb63  38			sec
$19:fb64  43 a4		 eor $a4,s
$19:fb66  23 51		 and $51,s
$19:fb68  9f a2 70 40   sta $4070a2,x
$19:fb6c  e5 86		 sbc $86
$19:fb6e  ef 49 21 11   sbc $112149
$19:fb72  88			dey
$19:fb73  c7 f5		 cmp [$f5]
$19:fb75  94 1f		 sty $1f,x
$19:fb77  44 60 99	  mvp $99,$60
$19:fb7a  05 f8		 ora $f8
$19:fb7c  1b			tcs
$19:fb7d  d4 b8		 pei ($b8)
$19:fb7f  b6 81		 ldx $81,y
$19:fb81  94 0a		 sty $0a,x
$19:fb83  d0 81		 bne $fb06
$19:fb85  cf b0 66 80   cmp $8066b0
$19:fb89  cd 4b 21	  cmp $214b
$19:fb8c  51 21		 eor ($21),y
$19:fb8e  80 0c		 bra $fb9c
$19:fb90  01 b8		 ora ($b8,x)
$19:fb92  30 0c		 bmi $fba0
$19:fb94  0d 9a ca	  ora $ca9a
$19:fb97  5b			tcd
$19:fb98  0b			phd
$19:fb99  66 52		 ror $52
$19:fb9b  28			plp
$19:fb9c  51 14		 eor ($14),y
$19:fb9e  48			pha
$19:fb9f  23 06		 and $06,s
$19:fba1  07 6e		 ora [$6e]
$19:fba3  ad 56 6b	  lda $6b56
$19:fba6  15 84		 ora $84,x
$19:fba8  b1 0c		 lda ($0c),y
$19:fbaa  03 dc		 ora $dc,s
$19:fbac  ad 09 e9	  lda $e909
$19:fbaf  a4 6a		 ldy $6a
$19:fbb1  d5 5a		 cmp $5a,x
$19:fbb3  ab			plb
$19:fbb4  18			clc
$19:fbb5  23 69		 and $69,s
$19:fbb7  80 8e		 bra $fb47
$19:fbb9  2f 03 0f 3e   and $3e0f03
$19:fbbd  bf 9a 82 bd   lda $bd829a,x
$19:fbc1  6a			ror a
$19:fbc2  bb			tyx
$19:fbc3  75 76		 adc $76,x
$19:fbc5  11 98		 ora ($98),y
$19:fbc7  ef 12 37 19   sbc $193712
$19:fbcb  56 84		 lsr $84,x
$19:fbcd  58			cli
$19:fbce  d2 35		 cmp ($35)
$19:fbd0  eb			xba
$19:fbd1  5d d0 3e	  eor $3ed0,x
$19:fbd4  2c a0 e3	  bit $e3a0
$19:fbd7  46 0a		 lsr $0a
$19:fbd9  c2 69		 rep #$69
$19:fbdb  1a			inc a
$19:fbdc  85 16		 sta $16
$19:fbde  8a			txa
$19:fbdf  2f 12 98 47   and $479812
$19:fbe3  62 70 cb	  per $c756
$19:fbe6  d9 e0 6b	  cmp $6be0,y
$19:fbe9  b5 3a		 lda $3a,x
$19:fbeb  95 4a		 sta $4a,x
$19:fbed  15 d4		 ora $d4,x
$19:fbef  92 c9		 sta ($c9)
$19:fbf1  5e 65 86	  lsr $8665,x
$19:fbf4  44 0d 2e	  mvp $2e,$0d
$19:fbf7  93 48		 sta ($48,s),y
$19:fbf9  a4 43		 ldy $43
$19:fbfb  66 92		 ror $92
$19:fbfd  2d d4 3a	  and $3ad4
$19:fc00  1c f6 28	  trb $28f6
$19:fc03  1d 81 5a	  ora $5a81,x
$19:fc06  14 5f		 trb $5f
$19:fc08  80 70		 bra $fc7a
$19:fc0a  64 6d		 stz $6d
$19:fc0c  60			rts
$19:fc0d  71 94		 adc ($94),y
$19:fc0f  f6 c7		 inc $c7,x
$19:fc11  62 75 87	  per $8389
$19:fc14  c6 47		 dec $47
$19:fc16  2b			pld
$19:fc17  78			sei
$19:fc18  04 aa		 tsb $aa
$19:fc1a  57 a8		 eor [$a8],y
$19:fc1c  98			tya
$19:fc1d  71 63		 adc ($63),y
$19:fc1f  26 40		 rol $40
$19:fc21  db			stp
$19:fc22  f1 12		 sbc ($12),y
$19:fc24  c1 22		 cmp ($22,x)
$19:fc26  71 9d		 adc ($9d),y
$19:fc28  e8			inx
$19:fc29  9e 51 a1	  stz $a151,x
$19:fc2c  10 25		 bpl $fc53
$19:fc2e  82 47 21	  brl $1d78
$19:fc31  71 99		 adc ($99),y
$19:fc33  7c e3 8a	  jmp ($8ae3,x)
$19:fc36  51 de		 eor ($de),y
$19:fc38  6c 4a e0	  jmp ($e04a)
$19:fc3b  e3 13		 sbc $13,s
$19:fc3d  79 47 23	  adc $2347,y
$19:fc40  6b			rtl
$19:fc41  51 92		 eor ($92),y
$19:fc43  c5 9c		 cmp $9c
$19:fc45  c4 04		 cpy $04
$19:fc47  18			clc
$19:fc48  5b			tcd
$19:fc49  00 58		 brk #$58
$19:fc4b  a1 00		 lda ($00,x)
$19:fc4d  96 45		 stx $45,y
$19:fc4f  c8			iny
$19:fc50  01 98		 ora ($98,x)
$19:fc52  9f 15 c2 1b   sta $1bc215,x
$19:fc56  0e 68 0b	  asl $0b68
$19:fc59  54 6d 96	  mvn $96,$6d
$19:fc5c  52 80		 eor ($80)
$19:fc5e  59 f0 0e	  eor $0ef0,y
$19:fc61  32 70		 and ($70)
$19:fc63  25 62		 and $62
$19:fc65  b1 5c		 lda ($5c),y
$19:fc67  a5 5b		 lda $5b
$19:fc69  c8			iny
$19:fc6a  a0 d6		 ldy #$d6
$19:fc6c  0c 37 72	  tsb $7237
$19:fc6f  44 ff 2a	  mvp $2a,$ff
$19:fc72  ad 56 ae	  lda $ae56
$19:fc75  62 11 a0	  per $9c89
$19:fc78  35 83		 and $83,x
$19:fc7a  2e e1 00	  rol $00e1
$19:fc7d  80 dd		 bra $fc5c
$19:fc7f  ed 55 f3	  sbc $f355
$19:fc82  10 61		 bpl $fce5
$19:fc84  c8			iny
$19:fc85  83 00		 sta $00,s
$19:fc87  97 1a		 sta [$1a],y
$19:fc89  83 66		 sta $66,s
$19:fc8b  21 0b		 and ($0b,x)
$19:fc8d  ad ad 02	  lda $02ad
$19:fc90  30 41		 bmi $fcd3
$19:fc92  81 4b		 sta ($4b,x)
$19:fc94  b7 72		 lda [$72],y
$19:fc96  3b			tsc
$19:fc97  f5 f6		 sbc $f6,x
$19:fc99  00 dc		 brk #$dc
$19:fc9b  0a			asl a
$19:fc9c  89 89 2f	  bit #$2f89
$19:fc9f  10 59		 bpl $fcfa
$19:fca1  26 f2		 rol $f2
$19:fca3  0d 07 bc	  ora $bc07
$19:fca6  d4 aa		 pei ($aa)
$19:fca8  55 43		 eor $43,x
$19:fcaa  92 09		 sta ($09)
$19:fcac  83 db		 sta $db,s
$19:fcae  1d 0e 0d	  ora $0d0e,x
$19:fcb1  21 7e		 and ($7e,x)
$19:fcb3  14 b4		 trb $b4
$19:fcb5  19 2a 02	  ora $022a,y
$19:fcb8  20 f9 00	  jsr $00f9
$19:fcbb  e0 d0		 cpx #$d0
$19:fcbd  13 e1		 ora ($e1,s),y
$19:fcbf  45 b0		 eor $b0
$19:fcc1  a5 04		 lda $04
$19:fcc3  4c 02 91	  jmp $9102
$19:fcc6  8d 87 42	  sta $4287
$19:fcc9  75 62		 adc $62,x
$19:fccb  70 05		 bvs $fcd2
$19:fccd  90 68		 bcc $fd37
$19:fccf  17 cc		 ora [$cc],y
$19:fcd1  14 22		 trb $22
$19:fcd3  39 1a fa	  and $fa1a,y
$19:fcd6  c0 43		 cpy #$43
$19:fcd8  a1 86		 lda ($86,x)
$19:fcda  ef 9a 8c 48   sbc $488c9a
$19:fcde  18			clc
$19:fcdf  69 f6 d6	  adc #$d6f6
$19:fce2  fc fb 13	  jsr ($13fb,x)
$19:fce5  c0 26		 cpy #$26
$19:fce7  81 e6		 sta ($e6,x)
$19:fce9  70 0c		 bvs $fcf7
$19:fceb  94 16		 sty $16,x
$19:fced  0c 0b 14	  tsb $140b
$19:fcf0  41 49		 eor ($49,x)
$19:fcf2  e4 c7		 cpx $c7
$19:fcf4  c1 1a		 cmp ($1a,x)
$19:fcf6  84 21		 sty $21
$19:fcf8  94 31		 sty $31,x
$19:fcfa  c4 40		 cpy $40
$19:fcfc  1e 80 26	  asl $2680,x
$19:fcff  08			php
$19:fd00  c1 0c		 cmp ($0c,x)
$19:fd02  0c 62 3b	  tsb $3b62
$19:fd05  1c e3 87	  trb $87e3
$19:fd08  c1 54		 cmp ($54,x)
$19:fd0a  12 1d		 ora ($1d)
$19:fd0c  55 fa		 eor $fa,x
$19:fd0e  2e 36 0c	  rol $0c36
$19:fd11  83 a0		 sta $a0,s
$19:fd13  3d f1 98	  and $98f1,x
$19:fd16  c8			iny
$19:fd17  7c 24 b2	  jmp ($b224,x)
$19:fd1a  5d 9e b4	  eor $b49e,x
$19:fd1d  16 5a		 asl $5a,x
$19:fd1f  c8			iny
$19:fd20  54 2e 25	  mvn $25,$2e
$19:fd23  19 8c 22	  ora $228c,y
$19:fd26  0b			phd
$19:fd27  03 08		 ora $08,s
$19:fd29  e7 ec		 sbc [$ec]
$19:fd2b  3e 91 98	  rol $9891,x
$19:fd2e  4e 76 1c	  lsr $1c76
$19:fd31  4a			lsr a
$19:fd32  08			php
$19:fd33  5c 02 43 23   jml $234302
$19:fd37  dd b5 c8	  cmp $c8b5,x
$19:fd3a  9a			txs
$19:fd3b  0d d0 80	  ora $80d0
$19:fd3e  43 61		 eor $61,s
$19:fd40  d0 ec		 bne $fd2e
$19:fd42  37 75		 and [$75],y
$19:fd44  e2 0d		 sep #$0d
$19:fd46  70 8e		 bvs $fcd6
$19:fd48  7f 76 f1 bf   adc $bff176,x
$19:fd4c  0c 10 2a	  tsb $2a10
$19:fd4f  4f f0 10 85   eor $8510f0
$19:fd53  ea			nop
$19:fd54  15 12		 ora $12,x
$19:fd56  8d 40 7d	  sta $7d40
$19:fd59  b2 80		 lda ($80)
$19:fd5b  98			tya
$19:fd5c  04 c3		 tsb $c3
$19:fd5e  7e 1f 0d	  ror $0d1f,x
$19:fd61  d3 c8		 cmp ($c8,s),y
$19:fd63  32 91		 and ($91)
$19:fd65  48			pha
$19:fd66  c4 6a		 cpy $6a
$19:fd68  33 b8		 and ($b8,s),y
$19:fd6a  45 14		 eor $14
$19:fd6c  9c 3e 41	  stz $413e
$19:fd6f  80 2e		 bra $fd9f
$19:fd71  0c 2e 67	  tsb $672e
$19:fd74  2a			rol a
$19:fd75  95 ca		 sta $ca,x
$19:fd77  a5 e1		 lda $e1
$19:fd79  50 18		 bvc $fd93
$19:fd7b  04 90		 tsb $90
$19:fd7d  2a			rol a
$19:fd7e  06 c1		 asl $c1
$19:fd80  87 43		 sta [$43]
$19:fd82  cb			wai
$19:fd83  e0 f7		 cpx #$f7
$19:fd85  0d 98 7c	  ora $7c98
$19:fd88  11 26		 ora ($26),y
$19:fd8a  13 0d		 ora ($0d,s),y
$19:fd8c  ca			dex
$19:fd8d  24 77		 bit $77
$19:fd8f  e9 d1 90	  sbc #$90d1
$19:fd92  ee 37 c8	  inc $c837
$19:fd95  b2 93		 lda ($93)
$19:fd97  4a			lsr a
$19:fd98  53 29		 eor ($29,s),y
$19:fd9a  86 d8		 stx $d8
$19:fd9c  e9 95 46	  sbc #$4695
$19:fd9f  ab			plb
$19:fda0  07 39		 ora [$39]
$19:fda2  2b			pld
$19:fda3  42 fc		 wdm #$fc
$19:fda5  ef 1c dc fb   sbc $fbdc1c
$19:fda9  0a			asl a
$19:fdaa  0a			asl a
$19:fdab  08			php
$19:fdac  81 34		 sta ($34,x)
$19:fdae  23 5b		 and $5b,s
$19:fdb0  73 48		 adc ($48,s),y
$19:fdb2  11 4a		 ora ($4a),y
$19:fdb4  0d ab c2	  ora $c2ab
$19:fdb7  75 76		 adc $76,x
$19:fdb9  10 18		 bpl $fdd3
$19:fdbb  c0 24		 cpy #$24
$19:fdbd  23 46		 and $46,s
$19:fdbf  90 8d		 bcc $fd4e
$19:fdc1  c6 0a		 dec $0a
$19:fdc3  a0 58		 ldy #$58
$19:fdc5  0b			phd
$19:fdc6  fc 23 81	  jsr ($8123,x)
$19:fdc9  1b			tcs
$19:fdca  07 84		 ora [$84]
$19:fdcc  73 e6		 adc ($e6,s),y
$19:fdce  69 08 d4	  adc #$d408
$19:fdd1  6e 02 0f	  ror $0f02
$19:fdd4  00 a0		 brk #$a0
$19:fdd6  c6 bc		 dec $bc
$19:fdd8  b2 08		 lda ($08)
$19:fdda  dc 74 b0	  jml [$b074]
$19:fddd  10 44		 bpl $fe23
$19:fddf  b0 7f		 bcs $fe60
$19:fde1  78			sei
$19:fde2  31 b0		 and ($b0),y
$19:fde4  a0 c6		 ldy #$c6
$19:fde6  3c 93 88	  bit $8893,x
$19:fde9  cf f4 d0 31   cmp $31d0f4
$19:fded  c7 d8		 cmp [$d8]
$19:fdef  7c a3 f0	  jmp ($f0a3,x)
$19:fdf2  9c fa 10	  stz $10fa
$19:fdf5  12 c0		 ora ($c0)
$19:fdf7  20 08 e1	  jsr $e108
$19:fdfa  a4 21		 ldy $21
$19:fdfc  71 2e		 adc ($2e),y
$19:fdfe  2c 04 18	  bit $1804
$19:fe01  30 d5		 bmi $fdd8
$19:fe03  29 29 c2	  and #$c229
$19:fe06  19 7b cf	  ora $cf7b,y
$19:fe09  45 1f		 eor $1f
$19:fe0b  20 3c 14	  jsr $143c
$19:fe0e  98			tya
$19:fe0f  4d 80 03	  eor $0380
$19:fe12  37 ca		 and [$ca],y
$19:fe14  a8			tay
$19:fe15  cb			wai
$19:fe16  a9 21 2e	  lda #$2e21
$19:fe19  84 02		 sty $02
$19:fe1b  07 08		 ora [$08]
$19:fe1d  8d c7 3e	  sta $3ec7
$19:fe20  91 18		 sta ($18),y
$19:fe22  3d e5 ae	  and $aee5,x
$19:fe25  0c 15 94	  tsb $9415
$19:fe28  f1 a3		 sbc ($a3),y
$19:fe2a  31 ae		 and ($ae),y
$19:fe2c  23 f4		 and $f4,s
$19:fe2e  1a			inc a
$19:fe2f  e5 be		 sbc $be
$19:fe31  62 18 3c	  per $3a4c
$19:fe34  01 64		 ora ($64,x)
$19:fe36  eb			xba
$19:fe37  05 00		 ora $00
$19:fe39  27 c6		 and [$c6]
$19:fe3b  43 a8		 eor $a8,s
$19:fe3d  98			tya
$19:fe3e  08			php
$19:fe3f  44 98 26	  mvp $26,$98
$19:fe42  50 58		 bvc $fe9c
$19:fe44  1e cb 3f	  asl $3fcb,x
$19:fe47  e0 fa		 cpx #$fa
$19:fe49  c6 fa		 dec $fa
$19:fe4b  fb			xce
$19:fe4c  04 69		 tsb $69
$19:fe4e  20 45 ac	  jsr $ac45
$19:fe51  08			php
$19:fe52  61 8e		 adc ($8e,x)
$19:fe54  ed fd e2	  sbc $e2fd
$19:fe57  c1 4b		 cmp ($4b,x)
$19:fe59  82 05 37	  brl $3561
$19:fe5c  d2 90		 cmp ($90)
$19:fe5e  58			cli
$19:fe5f  46 87		 lsr $87
$19:fe61  82 9f 06	  brl $0503
$19:fe64  f9 4b e4	  sbc $e44b,y
$19:fe67  2a			rol a
$19:fe68  70 05		 bvs $fe6f
$19:fe6a  08			php
$19:fe6b  cc 0c a1	  cpy $a10c
$19:fe6e  16 58		 asl $58,x
$19:fe70  16 1b		 asl $1b,x
$19:fe72  67 91		 adc [$91]
$19:fe74  8b			phb
$19:fe75  be 06 fb	  ldx $fb06,y
$19:fe78  86 96		 stx $96
$19:fe7a  ac 12 01	  ldy $0112
$19:fe7d  a4 82		 ldy $82
$19:fe7f  9a			txs
$19:fe80  46 0d		 lsr $0d
$19:fe82  07 d0		 ora [$d0]
$19:fe84  bc 0d 60	  ldy $600d,x
$19:fe87  1a			inc a
$19:fe88  08			php
$19:fe89  2c 43 ea	  bit $ea43
$19:fe8c  61 08		 adc ($08,x)
$19:fe8e  d1 f0		 cmp ($f0),y
$19:fe90  34 4f		 bit $4f,x
$19:fe92  82 8b e2	  brl $e120
$19:fe95  02 c1		 cop #$c1
$19:fe97  1a			inc a
$19:fe98  f2 c8		 sbc ($c8)
$19:fe9a  1d 21 1c	  ora $1c21,x
$19:fe9d  88			dey
$19:fe9e  82 08 d2	  brl $d0a9
$19:fea1  31 05		 and ($05),y
$19:fea3  50 79		 bvc $ff1e
$19:fea5  27 11		 and [$11]
$19:fea7  d8			cld
$19:fea8  e4 05		 cpx $05
$19:feaa  76 1d		 ror $1d,x
$19:feac  0e c7 43	  asl $43c7
$19:feaf  88			dey
$19:feb0  bb			tyx
$19:feb1  05 48		 ora $48
$19:feb3  46 e0		 lsr $e0
$19:feb5  30 1f		 bmi $fed6
$19:feb7  bc 04 32	  ldy $3204,x
$19:feba  3d 1e cf	  and $cf1e,x
$19:febd  47 8f		 eor [$8f]
$19:febf  c3 8d		 cmp $8d,s
$19:fec1  7d b8 08	  adc $08b8,x
$19:fec4  a0 8c		 ldy #$8c
$19:fec6  ed c3 20	  sbc $20c3
$19:fec9  ab			plb
$19:feca  0e 91 7c	  asl $7c91
$19:fecd  38			sec
$19:fece  8a			txa
$19:fecf  a1 2d		 lda ($2d,x)
$19:fed1  8a			txa
$19:fed2  ac 15 43	  ldy $4315
$19:fed5  01 85		 ora ($85,x)
$19:fed7  9b			txy
$19:fed8  c2 25		 rep #$25
$19:feda  c3 35		 cmp $35,s
$19:fedc  08			php
$19:fedd  a8			tay
$19:fede  49 61 1b	  eor #$1b61
$19:fee1  2d 04 38	  and $3804
$19:fee4  fe 10 a3	  inc $a310,x
$19:fee7  80 c6		 bra $feaf
$19:fee9  e3 9c		 sbc $9c,s
$19:feeb  ed 80 64	  sbc $6480
$19:feee  55 40		 eor $40,x
$19:fef0  b0 18		 bcs $ff0a
$19:fef2  6a			ror a
$19:fef3  00 ce		 brk #$ce
$19:fef5  02 3b		 cop #$3b
$19:fef7  0e 14 4d	  asl $4d14
$19:fefa  60			rts
$19:fefb  89 21 49	  bit #$4921
$19:fefe  a4 31		 ldy $31
$19:ff00  fe aa 16	  inc $16aa,x
$19:ff03  87 ab		 sta [$ab]
$19:ff05  e4 00		 cpx $00
$19:ff07  70 1f		 bvs $ff28
$19:ff09  b2 ff		 lda ($ff)
$19:ff0b  23 5f		 and $5f,s
$19:ff0d  a5 fe		 lda $fe
$19:ff0f  41 2f		 eor ($2f,x)
$19:ff11  81 f1		 sta ($f1,x)
$19:ff13  be e1 b6	  ldx $b6e1,y
$19:ff16  99 fe 9c	  sta $9cfe,y
$19:ff19  8a			txa
$19:ff1a  44 ac 1b	  mvp $1b,$ac
$19:ff1d  d8			cld
$19:ff1e  54 06 43	  mvn $43,$06
$19:ff21  07 d0		 ora [$d0]
$19:ff23  c5 a0		 cmp $a0
$19:ff25  13 59		 ora ($59,s),y
$19:ff27  1c 8d 78	  trb $788d
$19:ff2a  42 53		 wdm #$53
$19:ff2c  88			dey
$19:ff2d  81 02		 sta ($02,x)
$19:ff2f  01 21		 ora ($21,x)
$19:ff31  dd 48 93	  cmp $9348,x
$19:ff34  e5 10		 sbc $10
$19:ff36  26 00		 rol $00
$19:ff38  e0 36		 cpx #$36
$19:ff3a  01 40		 ora ($40,x)
$19:ff3c  d1 f7		 cmp ($f7),y
$19:ff3e  01 20		 ora ($20,x)
$19:ff40  9f 2f 91 d4   sta $d4912f,x
$19:ff44  63 9c		 adc $9c,s
$19:ff46  28			plp
$19:ff47  0c 46 0d	  tsb $0d46
$19:ff4a  e9 7c 84	  sbc #$847c
$19:ff4d  85 1e		 sta $1e
$19:ff4f  23 40		 and $40,s
$19:ff51  43 04		 eor $04,s
$19:ff53  07 8d		 ora [$8d]
$19:ff55  ed 3d 07	  sbc $073d
$19:ff58  d2 47		 cmp ($47)
$19:ff5a  bb			tyx
$19:ff5b  d9 41 19	  cmp $1941,y
$19:ff5e  a3 c7		 lda $c7,s
$19:ff60  e1 c6		 sbc ($c6,x)
$19:ff62  7f bc 03 d0   adc $d003bc,x
$19:ff66  22 c2 49 24   jsl $2449c2
$19:ff6a  03 02		 ora $02,s
$19:ff6c  3c 23 3c	  bit $3c23,x
$19:ff6f  53 e8		 eor ($e8,s),y
$19:ff71  22 c3 86 40   jsl $4086c3
$19:ff75  08			php
$19:ff76  9c 86 54	  stz $5486
$19:ff79  9f 28 c4 74   sta $74c428,x
$19:ff7d  80 03		 bra $ff82
$19:ff7f  10 8d		 bpl $ff0e
$19:ff81  27 42		 and [$42]
$19:ff83  19 2d 26	  ora $262d,y
$19:ff86  0a			asl a
$19:ff87  3c 22 71	  bit $7122,x
$19:ff8a  2f 99 00 62   and $620099
$19:ff8e  6f c0 87 96   adc $9687c0
$19:ff92  c9 d8 10	  cmp #$10d8
$19:ff95  c8			iny
$19:ff96  54 4b 61	  mvn $61,$4b
$19:ff99  1a			inc a
$19:ff9a  3b			tsc
$19:ff9b  82 f5 e1	  brl $e193
$19:ff9e  f0 d8		 beq $ff78
$19:ffa0  53 ec		 eor ($ec,s),y
$19:ffa2  57 d5		 eor [$d5],y
$19:ffa4  0d 05 92	  ora $9205
$19:ffa7  d7 d8		 cmp [$d8],y
$19:ffa9  de d7 f7	  dec $f7d7,x
$19:ffac  47 be		 eor [$be]
$19:ffae  7c d6 52	  jmp ($52d6,x)
$19:ffb1  79 30 3c	  adc $3c30,y
$19:ffb4  9f d1 be 08   sta $08bed1,x
$19:ffb8  0e fc 29	  asl $29fc
$19:ffbb  3a			dec a
$19:ffbc  51 78		 eor ($78),y
$19:ffbe  ea			nop
$19:ffbf  66 0f		 ror $0f
$19:ffc1  ef 22 f9 5b   sbc $5bf922
$19:ffc5  cc fe 78	  cpy $78fe
$19:ffc8  f4 4f a6	  pea $a64f
$19:ffcb  bd 57 eb	  lda $eb57,x
$19:ffce  cf 66 fb 7b   cmp $7bfb66
$19:ffd2  dd fe 00	  cmp $00fe,x
$19:ffd5  f0 8f		 beq $ff66
$19:ffd7  88			dey
$19:ffd8  bc 67 e4	  ldy $e467,x
$19:ffdb  4f 2a f9 9b   eor $9bf92a
$19:ffdf  ce fe 88	  dec $88fe
$19:ffe2  f4 cf aa	  pea $aacf
$19:ffe5  bd 77 ec	  lda $ec77,x
$19:ffe8  cf 6e f8 00   cmp $00f86e
$19:ffec  00 00		 brk #$00
$19:ffee  00 00		 brk #$00
$19:fff0  00 00		 brk #$00
$19:fff2  00 00		 brk #$00
$19:fff4  00 00		 brk #$00
$19:fff6  00 00		 brk #$00
$19:fff8  00 00		 brk #$00
$19:fffa  00 00		 brk #$00
$19:fffc  00 00		 brk #$00
$19:fffe  00 00		 brk #$00
