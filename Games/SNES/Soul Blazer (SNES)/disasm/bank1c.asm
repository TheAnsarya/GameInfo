; Soul Blazer (SNES) - Bank $1c
; Disassembled from ROM
; File offset: $0e0000-$0e7fff
; CPU address: $1c:$8000-$1c:$ffff
;===========================================================

.bank $1c
.org $8000

$1c:8000  04 04		 tsb $04
$1c:8002  00 10		 brk #$10
$1c:8004  80 3b		 bra $8041
$1c:8006  fc 01 da	  jsr ($da01,x)
$1c:8009  ce 60 48	  dec $4860
$1c:800c  75 80		 adc $80,x
$1c:800e  d6 80		 dec $80,x
$1c:8010  40			rti
$1c:8011  f9 dc 81	  sbc $81dc,y
$1c:8014  10 f6		 bpl $800c
$1c:8016  82 45 db	  brl $5b5e
$1c:8019  11 08		 ora ($08),y
$1c:801b  7d 46 4e	  adc $4e46,x
$1c:801e  1f 2e ac f4   ora $f4ac2e,x
$1c:8022  44 24 35	  mvp $35,$24
$1c:8025  0f 97 52 7c   ora $7c5297
$1c:8029  22 12 9a 8b   jsl $8b9a12
$1c:802d  fc c0 ff	  jsr ($ffc0,x)
$1c:8030  d3 56		 cmp ($56,s),y
$1c:8032  8e 5b 59	  stx $595b
$1c:8035  d9 9d 5b	  cmp $5b9d,y
$1c:8038  39 b8 db	  and $dbb8,y
$1c:803b  60			rts
$1c:803c  88			dey
$1c:803d  12 66		 ora ($66)
$1c:803f  1f 0f a8 84   ora $84a80f,x
$1c:8043  39 f6 ae	  and $aef6,y
$1c:8046  9f 38 86 2a   sta $2a8638,x
$1c:804a  42 00		 wdm #$00
$1c:804c  04 21		 tsb $21
$1c:804e  44 30 21	  mvp $21,$30
$1c:8051  00 14		 brk #$14
$1c:8053  c5 68		 cmp $68
$1c:8055  40			rti
$1c:8056  00 10		 brk #$10
$1c:8058  02 4c		 cop #$4c
$1c:805a  39 98 c4	  and $c498,y
$1c:805d  b9 b1 45	  lda $45b1,y
$1c:8060  7e 43 3b	  ror $3b43,x
$1c:8063  68			pla
$1c:8064  7b			tdc
$1c:8065  c3 df		 cmp $df,s
$1c:8067  d7 cc		 cmp [$cc],y
$1c:8069  d6 3f		 dec $3f,x
$1c:806b  83 58		 sta $58,s
$1c:806d  28			plp
$1c:806e  10 82		 bpl $7ff2
$1c:8070  f3 16		 sbc ($16,s),y
$1c:8072  66 3a		 ror $3a
$1c:8074  11 02		 ora ($02),y
$1c:8076  89 4f		 bit #$4f
$1c:8078  59 cd e6	  eor $e6cd,y
$1c:807b  f6 44		 inc $44,x
$1c:807d  07 d8		 ora [$d8]
$1c:807f  1a			inc a
$1c:8080  02 cc		 cop #$cc
$1c:8082  ba			tsx
$1c:8083  1f 45 08 08   ora $080845,x
$1c:8087  0f 9f f4 fa   ora $faf49f
$1c:808b  2c c6 5d	  bit $5dc6
$1c:808e  d0 80		 bne $8010
$1c:8090  ac 40 8e	  ldy $8e40
$1c:8093  90 48		 bcc $80dd
$1c:8095  09 3c		 ora #$3c
$1c:8097  dc 02 47	  jml [$4702]
$1c:809a  48			pha
$1c:809b  14 00		 trb $00
$1c:809d  bf e7 0f 28   lda $280fe7,x
$1c:80a1  87 f4		 sta [$f4]
$1c:80a3  e8			inx
$1c:80a4  bf d3 e7 a7   lda $a7e7d3,x
$1c:80a8  7d 5d eb	  adc $eb5d,x
$1c:80ab  ff 68 2f 68   sbc $682f68,x
$1c:80af  28			plp
$1c:80b0  1d b6 59	  ora $59b6,x
$1c:80b3  3b			tsc
$1c:80b4  bd fd ae	  lda $aefd,x
$1c:80b7  80 e6		 bra $809f
$1c:80b9  6b			rtl
$1c:80ba  1f d1 ac e6   ora $e6acd1,x
$1c:80be  72 03		 adc ($03)
$1c:80c0  e0 ec 82	  cpx #$82ec
$1c:80c3  c8			iny
$1c:80c4  f3 7b		 sbc ($7b,s),y
$1c:80c6  22 1b fe fd   jsl $fdfe1b
$1c:80ca  66 36		 ror $36
$1c:80cc  c1 94		 cmp ($94,x)
$1c:80ce  eb			xba
$1c:80cf  39 10 84	  and $8410,y
$1c:80d2  51 89		 eor ($89),y
$1c:80d4  5b			tcd
$1c:80d5  eb			xba
$1c:80d6  80 44		 bra $811c
$1c:80d8  a3 f9		 lda $f9,s
$1c:80da  a0 e5 ed	  ldy #$ede5
$1c:80dd  97 17		 sta [$17],y
$1c:80df  80 81		 bra $8062
$1c:80e1  47 c2		 eor [$c2]
$1c:80e3  38			sec
$1c:80e4  72 43		 adc ($43)
$1c:80e6  dd 65 5f	  cmp $5f65,x
$1c:80e9  5a			phy
$1c:80ea  19 ed e0	  ora $e0ed,y
$1c:80ed  76 7d		 ror $7d,x
$1c:80ef  b3 14		 lda ($14,s),y
$1c:80f1  5d a2 9d	  eor $9da2,x
$1c:80f4  68			pla
$1c:80f5  0b			phd
$1c:80f6  50 c3		 bvc $80bb
$1c:80f8  63 c8		 adc $c8,s
$1c:80fa  4f 88 74 1c   eor $1c7488
$1c:80fe  6f db e4 00   adc $00e4db
$1c:8102  35 fb		 and $fb,x
$1c:8104  fc cd 60	  jsr ($60cd,x)
$1c:8107  91 9c		 sta ($9c),y
$1c:8109  42 10		 wdm #$10
$1c:810b  1e 47 23	  asl $2347,x
$1c:810e  00 21		 brk #$21
$1c:8110  50 f8		 bvc $810a
$1c:8112  2c 48 3f	  bit $3f48
$1c:8115  fa			plx
$1c:8116  ca			dex
$1c:8117  ee 08 84	  inc $8408
$1c:811a  76 56		 ror $56,x
$1c:811c  e8			inx
$1c:811d  38			sec
$1c:811e  40			rti
$1c:811f  e6 18		 inc $18
$1c:8121  0f a1 cd 60   ora $60cda1
$1c:8125  7f 5c 01 3c   adc $3c015c,x
$1c:8129  b0 0d		 bcs $8138
$1c:812b  91 5c		 sta ($5c),y
$1c:812d  93 68		 sta ($68,s),y
$1c:812f  20 e5 a0	  jsr $a0e5
$1c:8132  6c 8e 00	  jmp ($008e)
$1c:8135  ac 2c 92	  ldy $922c
$1c:8138  55 91		 eor $91,x
$1c:813a  bc 4d c5	  ldy $c54d,x
$1c:813d  5f 6c 92 d4   eor $d4926c,x
$1c:8141  0f 2c 72 33   ora $33722c
$1c:8145  90 9e		 bcc $80e5
$1c:8147  5d 06 6d	  eor $6d06,x
$1c:814a  50 3c		 bvc $8188
$1c:814c  b9 54 99	  lda $9954,y
$1c:814f  22 a9 a6 c1   jsl $c1a6a9
$1c:8153  22 51 c2 01   jsl $01c251
$1c:8157  17 25		 ora [$25],y
$1c:8159  08			php
$1c:815a  77 d1		 adc [$d1],y
$1c:815c  83 03		 sta $03,s
$1c:815e  e7 0a		 sbc [$0a]
$1c:8160  45 e6		 eor $e6
$1c:8162  7d 5e 57	  adc $575e,x
$1c:8165  2b			pld
$1c:8166  b8			clv
$1c:8167  17 1e		 ora [$1e],y
$1c:8169  df 56 7a f8   cmp $f87a56,x
$1c:816d  20 20 72	  jsr $7220
$1c:8170  73 19		 adc ($19,s),y
$1c:8172  9c d3 c0	  stz $c0d3
$1c:8175  ba			tsx
$1c:8176  93 e1		 sta ($e1,s),y
$1c:8178  48			pha
$1c:8179  84 c7		 sty $c7
$1c:817b  93 a0		 sta ($a0,s),y
$1c:817d  95 68		 sta $68,x
$1c:817f  5e 12 0a	  lsr $0a12,x
$1c:8182  0e 2f a7	  asl $a72f
$1c:8185  38			sec
$1c:8186  f0 40		 beq $81c8
$1c:8188  18			clc
$1c:8189  01 0b		 ora ($0b,x)
$1c:818b  a9 dd		 lda #$dd
$1c:818d  f5 69		 sbc $69,x
$1c:818f  1e 08 13	  asl $1308,x
$1c:8192  00 a1		 brk #$a1
$1c:8194  04 83		 tsb $83
$1c:8196  d5 c8		 cmp $c8,x
$1c:8198  0f d3 cc 9e   ora $9eccd3
$1c:819c  0b			phd
$1c:819d  d8			cld
$1c:819e  e6 99		 inc $99
$1c:81a0  c7 b2		 cmp [$b2]
$1c:81a2  5c 3d 61 9c   jml $9c613d
$1c:81a6  b5 9f		 lda $9f,x
$1c:81a8  43 b8		 eor $b8,s
$1c:81aa  7d 4e 24	  adc $244e,x
$1c:81ad  f0 03		 beq $81b2
$1c:81af  b8			clv
$1c:81b0  9d c6 09	  sta $09c6,x
$1c:81b3  01 80		 ora ($80,x)
$1c:81b5  c2 10		 rep #$10
$1c:81b7  24 a0		 bit $a0
$1c:81b9  14 89		 trb $89
$1c:81bb  b0 8d		 bcs $814a
$1c:81bd  28			plp
$1c:81be  a9 fb		 lda #$fb
$1c:81c0  d6 73		 dec $73,x
$1c:81c2  16 37		 asl $37,x
$1c:81c4  03 79		 ora $79,s
$1c:81c6  29 98		 and #$98
$1c:81c8  cd 42 bf	  cmp $bf42
$1c:81cb  6e 7a 04	  ror $047a
$1c:81ce  be a1 10	  ldx $10a1,y
$1c:81d1  5f 97 f5 a8   eor $a8f597,x
$1c:81d5  48			pha
$1c:81d6  71 44		 adc ($44),y
$1c:81d8  80 84		 bra $815e
$1c:81da  79 f0 29	  adc $29f0,y
$1c:81dd  77 40		 adc [$40],y
$1c:81df  de a7 50	  dec $50a7,x
$1c:81e2  81 40		 sta ($40,x)
$1c:81e4  1d ea 81	  ora $81ea,x
$1c:81e7  4f a3 f5 92   eor $92f5a3
$1c:81eb  0a			asl a
$1c:81ec  96 10		 stx $10,y
$1c:81ee  7a			ply
$1c:81ef  89 1d		 bit #$1d
$1c:81f1  de 4b 0a	  dec $0a4b,x
$1c:81f4  e4 76		 cpx $76
$1c:81f6  96 21		 stx $21,y
$1c:81f8  db			stp
$1c:81f9  e4 75		 cpx $75
$1c:81fb  67 a5		 adc [$a5]
$1c:81fd  c0 22 91	  cpy #$9122
$1c:8200  10 0c		 bpl $820e
$1c:8202  a4 cd		 ldy $cd
$1c:8204  0e a4 f8	  asl $f8a4
$1c:8207  d8			cld
$1c:8208  05 52		 ora $52
$1c:820a  2a			rol a
$1c:820b  03 58		 ora $58,s
$1c:820d  5b			tcd
$1c:820e  82 64 7e	  brl $0075
$1c:8211  a7 35		 lda [$35]
$1c:8213  ce 10 87	  dec $8710
$1c:8216  b2 1d		 lda ($1d)
$1c:8218  10 16		 bpl $8230
$1c:821a  20 56 03	  jsr $0356
$1c:821d  98			tya
$1c:821e  6c 82 ca	  jmp ($ca82)
$1c:8221  18			clc
$1c:8222  51 22		 eor ($22),y
$1c:8224  57 d4		 eor [$d4],y
$1c:8226  e0 24 31	  cpx #$3124
$1c:8229  a1 eb		 lda ($eb,x)
$1c:822b  00 81		 brk #$81
$1c:822d  67 5b		 adc [$5b]
$1c:822f  83 f4		 sta $f4,s
$1c:8231  06 62		 asl $62
$1c:8233  d2 47		 cmp ($47)
$1c:8235  e8			inx
$1c:8236  06 89		 asl $89
$1c:8238  be 1d 5e	  ldx $5e1d,y
$1c:823b  52 fd		 eor ($fd)
$1c:823d  54 e2 a7	  mvn $a7,$e2
$1c:8240  06 58		 asl $58
$1c:8242  72 73		 adc ($73)
$1c:8244  0b			phd
$1c:8245  f4 db 2d	  pea $2ddb
$1c:8248  c5 6e		 cmp $6e
$1c:824a  1b			tcs
$1c:824b  66 e0		 ror $e0
$1c:824d  68			pla
$1c:824e  20 67 3a	  jsr $3a67
$1c:8251  29 0a		 and #$0a
$1c:8253  0a			asl a
$1c:8254  fe a7 30	  inc $30a7,x
$1c:8257  49 5c		 eor #$5c
$1c:8259  21 16		 and ($16,x)
$1c:825b  0a			asl a
$1c:825c  15 12		 ora $12,x
$1c:825e  1a			inc a
$1c:825f  44 96 44	  mvp $44,$96
$1c:8262  ca			dex
$1c:8263  0b			phd
$1c:8264  3f cc 6a 2b   and $2b6acc,x
$1c:8268  a0 52 0c	  ldy #$0c52
$1c:826b  f5 86		 sbc $86,x
$1c:826d  49 20		 eor #$20
$1c:826f  22 1a a8 a7   jsl $a7a81a
$1c:8273  c4 03		 cpy $03
$1c:8275  29 c7		 and #$c7
$1c:8277  ec 80 6b	  cpx $6b80
$1c:827a  c1 33		 cmp ($33,x)
$1c:827c  2b			pld
$1c:827d  ec 35 8b	  cpx $8b35
$1c:8280  a0 65 88	  ldy #$8865
$1c:8283  fc 0f 08	  jsr ($080f,x)
$1c:8286  08			php
$1c:8287  13 91		 ora ($91,s),y
$1c:8289  72 49		 adc ($49)
$1c:828b  e0 78 46	  cpx #$4678
$1c:828e  39 32 87	  and $8732,y
$1c:8291  a8			tay
$1c:8292  5f 06 81 1d   eor $1d8106,x
$1c:8296  80 40		 bra $82d8
$1c:8298  6c b0 3c	  jmp ($3cb0)
$1c:829b  2f 52 7c 66   and $667c52
$1c:829f  11 88		 ora ($88),y
$1c:82a1  3b			tsc
$1c:82a2  e7 95		 sbc [$95]
$1c:82a4  dc 69 8b	  jml [$8b69]
$1c:82a7  fe 73 39	  inc $3973,x
$1c:82aa  a2 01 04	  ldx #$0401
$1c:82ad  22 55 a1 20   jsl $20a155
$1c:82b1  15 7c		 ora $7c,x
$1c:82b3  52 2e		 eor ($2e)
$1c:82b5  52 32		 eor ($32)
$1c:82b7  82 2c 30	  brl $b2e6
$1c:82ba  0f 15 45 89   ora $894515
$1c:82be  04 4e		 tsb $4e
$1c:82c0  01 5d		 ora ($5d,x)
$1c:82c2  c1 00		 cmp ($00,x)
$1c:82c4  8e cb ac	  stx $accb
$1c:82c7  ec f6 0e	  cpx $0ef6
$1c:82ca  22 80 24 fa   jsl $fa2480
$1c:82ce  7d 79 dc	  adc $dc79,x
$1c:82d1  f4 08 a4	  pea $a408
$1c:82d4  05 cc		 ora $cc
$1c:82d6  02 22		 cop #$22
$1c:82d8  80 42		 bra $831c
$1c:82da  03 41		 ora $41,s
$1c:82dc  04 50		 tsb $50
$1c:82de  1d 9f 6c	  ora $6c9f,x
$1c:82e1  32 13		 and ($13)
$1c:82e3  91 14		 sta ($14),y
$1c:82e5  55 22		 eor $22,x
$1c:82e7  04 22		 tsb $22
$1c:82e9  1c 41 35	  trb $3541
$1c:82ec  47 28		 eor [$28]
$1c:82ee  af 12 fa eb   lda $ebfa12
$1c:82f2  3b			tsc
$1c:82f3  63 b2		 adc $b2,s
$1c:82f5  4e 82 99	  lsr $9982
$1c:82f8  5f 29 00 56   eor $560029,x
$1c:82fc  81 c7		 sta ($c7,x)
$1c:82fe  15 20		 ora $20,x
$1c:8300  6f 84 5a 1f   adc $1f5a84
$1c:8304  e0 76 5c	  cpx #$5c76
$1c:8307  d5 7c		 cmp $7c,x
$1c:8309  83 04		 sta $04,s
$1c:830b  1c 2b f9	  trb $f92b
$1c:830e  08			php
$1c:830f  88			dey
$1c:8310  7c 19 f2	  jmp ($f219,x)
$1c:8313  15 13		 ora $13,x
$1c:8315  22 13 e8 ea   jsl $eae813
$1c:8319  e2 60		 sep #$60
$1c:831b  1c 87 55	  trb $5587
$1c:831e  df 10 31 b0   cmp $b03110,x
$1c:8322  0e 43 a8	  asl $a843
$1c:8325  ef 92 30 3b   sbc $3b3092
$1c:8329  c6 07		 dec $07
$1c:832b  ac 5d 01	  ldy $015d
$1c:832e  dc 04 03	  jml [$0304]
$1c:8331  02 af		 cop #$af
$1c:8333  8a			txa
$1c:8334  40			rti
$1c:8335  3e 30 36	  rol $3630,x
$1c:8338  48			pha
$1c:8339  7d 70 18	  adc $1870,x
$1c:833c  06 48		 asl $48
$1c:833e  ed ac e3	  sbc $e3ac
$1c:8341  90 db		 bcc $831e
$1c:8343  32 41		 and ($41)
$1c:8345  9c 30 71	  stz $7130
$1c:8348  98			tya
$1c:8349  36 48		 rol $48,x
$1c:834b  8a			txa
$1c:834c  8e c1 97	  stx $97c1
$1c:834f  0c c1 d2	  tsb $d2c1
$1c:8352  6f a0 2c 21   adc $212ca0
$1c:8356  49 41		 eor #$41
$1c:8358  22 68 12 7c   jsl $7c1268
$1c:835c  b6 c8		 ldx $c8,y
$1c:835e  9d 4e 56	  sta $564e,x
$1c:8361  41 7a		 eor ($7a,x)
$1c:8363  4e f5 8e	  lsr $8ef5
$1c:8366  30 11		 bmi $8379
$1c:8368  8b			phb
$1c:8369  8c 96 00	  sty $0096
$1c:836c  df 17 fc 80   cmp $80fc17,x
$1c:8370  0d 7f ba	  ora $ba7f
$1c:8373  c7 e0		 cmp [$e0]
$1c:8375  cf 79 0e 11   cmp $110e79
$1c:8379  63 af		 adc $af,s
$1c:837b  3d c4 a4	  and $a4c4,x
$1c:837e  51 22		 eor ($22),y
$1c:8380  80 70		 bra $83f2
$1c:8382  39 39 b9	  and $b939,y
$1c:8385  f7 23		 sbc [$23],y
$1c:8387  a8			tay
$1c:8388  ff 00 b8 99   sbc $99b800,x
$1c:838c  4f 9d d4 d1   eor $d1d49d
$1c:8390  b0 4d		 bcs $83df
$1c:8392  74 6b		 stz $6b,x
$1c:8394  b1 ed		 lda ($ed),y
$1c:8396  80 03		 bra $839b
$1c:8398  9a			txs
$1c:8399  1f ae cb 04   ora $04cbae,x
$1c:839d  3e 82 f9	  rol $f982,x
$1c:83a0  fa			plx
$1c:83a1  b6 85		 ldx $85,y
$1c:83a3  ec 63 f5	  cpx $f563
$1c:83a6  84 6b		 sty $6b
$1c:83a8  03 e0		 ora $e0,s
$1c:83aa  66 1a		 ror $1a
$1c:83ac  f9 3d a0	  sbc $a03d,y
$1c:83af  62 f1 02	  per $86a3
$1c:83b2  84 0e		 sty $0e
$1c:83b4  ce 5f 77	  dec $775f
$1c:83b7  b0 95		 bcs $834e
$1c:83b9  c4 dd		 cpy $dd
$1c:83bb  47 df		 eor [$df]
$1c:83bd  47 7a		 eor [$7a]
$1c:83bf  7b			tdc
$1c:83c0  42 aa		 wdm #$aa
$1c:83c2  af 76 8a 30   lda $308a76
$1c:83c6  20 3f 7a	  jsr $7a3f
$1c:83c9  c6 00		 dec $00
$1c:83cb  5a			phy
$1c:83cc  ba			tsx
$1c:83cd  4e 08 e9	  lsr $e908
$1c:83d0  8f 07 d3 9c   sta $9cd307
$1c:83d4  01 89		 ora ($89,x)
$1c:83d6  a4 0d		 ldy $0d
$1c:83d8  40			rti
$1c:83d9  f4 31 e0	  pea $e031
$1c:83dc  7a			ply
$1c:83dd  b4 8f		 ldy $8f,x
$1c:83df  11 38		 ora ($38),y
$1c:83e1  81 b8		 sta ($b8,x)
$1c:83e3  4d a2 fc	  eor $fca2
$1c:83e6  0e af a9	  asl $a9af
$1c:83e9  80 00		 bra $83eb
$1c:83eb  21 4f		 and ($4f,x)
$1c:83ed  2b			pld
$1c:83ee  f0 3a		 beq $842a
$1c:83f0  8c 01 09	  sty $0901
$1c:83f3  1d 7c a4	  ora $a47c,x
$1c:83f6  4f c1 0f ab   eor $ab0fc1
$1c:83fa  e0 83 43	  cpx #$4383
$1c:83fd  ac 6c 18	  ldy $186c
$1c:8400  4c 8d a7	  jmp $a78d
$1c:8403  03 fa		 ora $fa,s
$1c:8405  13 4c		 ora ($4c,s),y
$1c:8407  26 e0		 rol $e0
$1c:8409  81 2e		 sta ($2e,x)
$1c:840b  92 78		 sta ($78)
$1c:840d  b5 8a		 lda $8a,x
$1c:840f  f4 d6 05	  pea $05d6
$1c:8412  5d 80 9c	  eor $9c80,x
$1c:8415  f0 ab		 beq $83c2
$1c:8417  f5 67		 sbc $67,x
$1c:8419  bc 8f ea	  ldy $ea8f,x
$1c:841c  24 0f		 bit $0f
$1c:841e  d1 d4		 cmp ($d4),y
$1c:8420  9f 72 13 02   sta $021372,x
$1c:8424  7e 83 c2	  ror $c283,x
$1c:8427  9b			txy
$1c:8428  16 06		 asl $06,x
$1c:842a  3d 06 e0	  and $e006,x
$1c:842d  ad cc 24	  lda $24cc
$1c:8430  64 c1		 stz $c1
$1c:8432  fa			plx
$1c:8433  e0 30 04	  cpx #$0430
$1c:8436  d1 08		 cmp ($08),y
$1c:8438  30 24		 bmi $845e
$1c:843a  20 ec a0	  jsr $a0ec
$1c:843d  2e 88 c0	  rol $c088
$1c:8440  85 04		 sta $04
$1c:8442  28			plp
$1c:8443  09 73		 ora #$73
$1c:8445  28			plp
$1c:8446  03 22		 ora $22,s
$1c:8448  79 40 99	  adc $9940,y
$1c:844b  8a			txa
$1c:844c  0a			asl a
$1c:844d  00 89		 brk #$89
$1c:844f  46 11		 lsr $11
$1c:8451  8e 0a 00	  stx $000a
$1c:8454  99 46 92	  sta $9246,y
$1c:8457  18			clc
$1c:8458  c9 df		 cmp #$df
$1c:845a  25 53		 and $53
$1c:845c  20 00 bc	  jsr $bc00
$1c:845f  75 90		 adc $90,x
$1c:8461  27 51		 and [$51]
$1c:8463  be 49 98	  ldx $9849,y
$1c:8466  2c c1 f9	  bit $f9c1
$1c:8469  ba			tsx
$1c:846a  8e 06 0a	  stx $0a06
$1c:846d  13 00		 ora ($00,s),y
$1c:846f  b7 05		 lda [$05],y
$1c:8471  d2 81		 cmp ($81)
$1c:8473  94 7b		 sty $7b,x
$1c:8475  13 a4		 ora ($a4,s),y
$1c:8477  df 46 25 47   cmp $472546,x
$1c:847b  49 12		 eor #$12
$1c:847d  c8			iny
$1c:847e  db			stp
$1c:847f  38			sec
$1c:8480  8c 48 68	  sty $6848
$1c:8483  cd ef 8a	  cmp $8aef
$1c:8486  c5 89		 cmp $89
$1c:8488  4c de f9	  jmp $f9de
$1c:848b  0c 80 2c	  tsb $2c80
$1c:848e  1f 42 35 47   ora $473542,x
$1c:8492  48			pha
$1c:8493  b7 40		 lda [$40],y
$1c:8495  94 64		 sty $64,x
$1c:8497  54 2a c3	  mvn $c3,$2a
$1c:849a  a5 0c		 lda $0c
$1c:849c  b0 cf		 bcs $846d
$1c:849e  83 ca		 sta $ca,s
$1c:84a0  40			rti
$1c:84a1  f9 c1 10	  sbc $10c1,y
$1c:84a4  fe 84 4d	  inc $4d84,x
$1c:84a7  de 02 12	  dec $1202,x
$1c:84aa  7c 98 84	  jmp ($8498,x)
$1c:84ad  df 27 ac 7f   cmp $7fac27,x
$1c:84b1  b7 6b		 lda [$6b],y
$1c:84b3  99 cc ed	  sta $edcc,y
$1c:84b6  80 8a		 bra $8442
$1c:84b8  07 ac		 ora [$ac]
$1c:84ba  19 00 86	  ora $8600,y
$1c:84bd  a0 64 12	  ldy #$1264
$1c:84c0  18			clc
$1c:84c1  4b			phk
$1c:84c2  2c 08 0b	  bit $0b08
$1c:84c5  5f 23 1a 28   eor $281a23,x
$1c:84c9  ce 24 e9	  dec $e924
$1c:84cc  17 48		 ora [$48],y
$1c:84ce  a2 01 5a	  ldx #$5a01
$1c:84d1  1a			inc a
$1c:84d2  c0 c0 73	  cpy #$73c0
$1c:84d5  35 8c		 and $8c,x
$1c:84d7  a3 80		 lda $80,s
$1c:84d9  c0 d3 00	  cpy #$00d3
$1c:84dc  ee 19 d5	  inc $d519
$1c:84df  b0 04		 bcs $84e5
$1c:84e1  0a			asl a
$1c:84e2  60			rts
$1c:84e3  3b			tsc
$1c:84e4  29 bc		 and #$bc
$1c:84e6  79 1f d3	  adc $d31f,y
$1c:84e9  a6 1c		 ldx $1c
$1c:84eb  8a			txa
$1c:84ec  bb			tyx
$1c:84ed  82 4b ab	  brl $303b
$1c:84f0  a0 04 05	  ldy #$0504
$1c:84f3  ac 75 89	  ldy $8975
$1c:84f6  84 0c		 sty $0c
$1c:84f8  a2 ed 11	  ldx #$11ed
$1c:84fb  81 ba		 sta ($ba,x)
$1c:84fd  c1 f2		 cmp ($f2,x)
$1c:84ff  21 71		 and ($71,x)
$1c:8501  e6 1a		 inc $1a
$1c:8503  44 82 4e	  mvp $4e,$82
$1c:8506  d1 10		 cmp ($10),y
$1c:8508  21 3d		 and ($3d,x)
$1c:850a  95 ea		 sta $ea,x
$1c:850c  3e 06 7b	  rol $7b06,x
$1c:850f  90 51		 bcc $8562
$1c:8511  4c 2c f8	  jmp $f82c
$1c:8514  08			php
$1c:8515  09 88		 ora #$88
$1c:8517  5f f1 ac 7e   eor $7eacf1,x
$1c:851b  80 3b		 bra $8558
$1c:851d  99 46 1f	  sta $1f46,y
$1c:8520  8e cb 65	  stx $65cb
$1c:8523  05 ed		 ora $ed
$1c:8525  f5 e7		 sbc $e7,x
$1c:8527  40			rti
$1c:8528  6b			rtl
$1c:8529  ec 10 20	  cpx $2010
$1c:852c  09 04		 ora #$04
$1c:852e  c9 01		 cmp #$01
$1c:8530  08			php
$1c:8531  e7 40		 sbc [$40]
$1c:8533  ec f0 22	  cpx $22f0
$1c:8536  78			sei
$1c:8537  e2 31		 sep #$31
$1c:8539  24 f4		 bit $f4
$1c:853b  81 f3		 sta ($f3,x)
$1c:853d  a0 4c		 ldy #$4c
$1c:853f  51 80		 eor ($80),y
$1c:8541  c0 f1		 cpy #$f1
$1c:8543  58			cli
$1c:8544  b2 f9		 lda ($f9)
$1c:8546  ab			plb
$1c:8547  c3 58		 cmp $58,s
$1c:8549  8c 13 7d	  sty $7d13
$1c:854c  72 0f		 adc ($0f)
$1c:854e  62 7f ae	  per $33d0
$1c:8551  46 09		 lsr $09
$1c:8553  1f 76 5d 63   ora $635d76,x
$1c:8557  c2 5f		 rep #$5f
$1c:8559  06 ff		 asl $ff
$1c:855b  b7 f8		 lda [$f8],y
$1c:855d  76 c3		 ror $c3,x
$1c:855f  fb			xce
$1c:8560  cd 17 e0	  cmp $e017
$1c:8563  dc 08 84	  jml [$8408]
$1c:8566  df a0 e0 73   cmp $73e0a0,x
$1c:856a  f6 c5		 inc $c5,x
$1c:856c  b0 56		 bcs $85c4
$1c:856e  01 6c		 ora ($6c,x)
$1c:8570  25 c7		 and $c7
$1c:8572  b0 54		 bcs $85c8
$1c:8574  8b			phb
$1c:8575  bc 4b e4	  ldy $e44b,x
$1c:8578  6a			ror a
$1c:8579  17 cc		 ora [$cc],y
$1c:857b  29 50		 and #$50
$1c:857d  13 e1		 ora ($e1,s),y
$1c:857f  a9 af		 lda #$af
$1c:8581  85 b1		 sta $b1
$1c:8583  ec 3a ce	  cpx $ce3a
$1c:8586  66 b1		 ror $b1
$1c:8588  de 04 70	  dec $7004,x
$1c:858b  e6 07		 inc $07
$1c:858d  d2 02		 cmp ($02)
$1c:858f  ad 07 78	  lda $7807
$1c:8592  16 17		 asl $17,x
$1c:8594  58			cli
$1c:8595  52 15		 eor ($15)
$1c:8597  60			rts
$1c:8598  12 45		 ora ($45)
$1c:859a  de 13 ab	  dec $ab13,x
$1c:859d  61 60		 adc ($60,x)
$1c:859f  7b			tdc
$1c:85a0  4b			phk
$1c:85a1  94 e4		 sty $e4,x
$1c:85a3  75 7d		 adc $7d,x
$1c:85a5  65 84		 adc $84
$1c:85a7  ec 32 4f	  cpx $4f32
$1c:85aa  b3 c8		 lda ($c8,s),y
$1c:85ac  ea			nop
$1c:85ad  7b			tdc
$1c:85ae  0f c2 7e 1d   ora $1d7ec2
$1c:85b2  63 60		 adc $60,s
$1c:85b4  be a6 78	  ldx $78a6,y
$1c:85b7  e7 c1		 sbc [$c1]
$1c:85b9  1b			tcs
$1c:85ba  e3 08		 sbc $08,s
$1c:85bc  2b			pld
$1c:85bd  c0 84 cc	  cpy #$cc84
$1c:85c0  c0 c9 45	  cpy #$45c9
$1c:85c3  c0 98 51	  cpy #$5198
$1c:85c6  b0 ac		 bcs $8574
$1c:85c8  72 31		 adc ($31)
$1c:85ca  10 18		 bpl $85e4
$1c:85cc  1a			inc a
$1c:85cd  f0 23		 beq $85f2
$1c:85cf  47 12		 eor [$12]
$1c:85d1  8e 50 72	  stx $7250
$1c:85d4  6e 13 77	  ror $7713
$1c:85d7  cb			wai
$1c:85d8  ab			plb
$1c:85d9  86 66		 stx $66
$1c:85db  ff a2 20 bf   sbc $bf20a2,x
$1c:85df  b1 c2		 lda ($c2),y
$1c:85e1  26 71		 rol $71
$1c:85e3  d6 1c		 dec $1c,x
$1c:85e5  80 7e		 bra $8665
$1c:85e7  7a			ply
$1c:85e8  c0 49 2a	  cpy #$2a49
$1c:85eb  1d 5e a9	  ora $a95e,x
$1c:85ee  96 57		 stx $57,y
$1c:85f0  37 57		 and [$57],y
$1c:85f2  d6 8b		 dec $8b,x
$1c:85f4  23 79		 and $79,s
$1c:85f6  ac 4f a9	  ldy $a94f
$1c:85f9  ec 4c 11	  cpx $114c
$1c:85fc  fc d6 20	  jsr ($20d6,x)
$1c:85ff  1c 12 fd	  trb $fd12
$1c:8602  6d 85 82	  adc $8285
$1c:8605  4f b7 08 f3   eor $f308b7
$1c:8609  55 f1		 eor $f1,x
$1c:860b  ac 69 13	  ldy $1369
$1c:860e  40			rti
$1c:860f  17 f0		 ora [$f0],y
$1c:8611  bb			tyx
$1c:8612  27 00		 and [$00]
$1c:8614  33 e0		 and ($e0,s),y
$1c:8616  10 ae		 bpl $85c6
$1c:8618  1b			tcs
$1c:8619  00 08		 brk #$08
$1c:861b  81 40		 sta ($40,x)
$1c:861d  1d e8 f6	  ora $f6e8,x
$1c:8620  68			pla
$1c:8621  64 82		 stz $82
$1c:8623  19 23 86	  ora $8623,y
$1c:8626  4c 21 9b	  jmp $9b21
$1c:8629  28			plp
$1c:862a  b6 32		 ldx $32,y
$1c:862c  2d 2d 8b	  and $8b2d
$1c:862f  5b			tcd
$1c:8630  22 d6 d8 b4   jsl $b4d8d6
$1c:8634  b2 2d		 lda ($2d)
$1c:8636  8f 8b 5b a2   sta $a25b8b
$1c:863a  d6 f8		 dec $f8,x
$1c:863c  b4 2a		 ldy $2a,x
$1c:863e  2d 0d 8b	  and $8b0d
$1c:8641  4a			lsr a
$1c:8642  a2 d0 b8	  ldx #$b8d0
$1c:8645  b4 30		 ldy $30,x
$1c:8647  32 31		 and ($31)
$1c:8649  c8			iny
$1c:864a  b4 74		 ldy $74,x
$1c:864c  3e 30 f8	  rol $f830,x
$1c:864f  b4 3a		 ldy $3a,x
$1c:8651  2d 2f 8e	  and $8e2f
$1c:8654  68			pla
$1c:8655  23 9a		 and $9a,s
$1c:8657  58			cli
$1c:8658  e6 d0		 inc $d0
$1c:865a  5e 3a 28	  lsr $283a,x
$1c:865d  e6 84		 inc $84
$1c:865f  72 3b		 adc ($3b)
$1c:8661  38			sec
$1c:8662  64 86		 stz $86
$1c:8664  19 22 86	  ora $8622,y
$1c:8667  4c 61 92	  jmp $9261
$1c:866a  48			pha
$1c:866b  b5 f2		 lda $f2,x
$1c:866d  2d 7d 8b	  and $8b7d
$1c:8670  4b			phk
$1c:8671  a2 d8 d8	  ldx #$d8d8
$1c:8674  b5 fa		 lda $fa,x
$1c:8676  2d 7f 8b	  and $8b7f
$1c:8679  63 a2		 adc $a2,s
$1c:867b  d2 b8		 cmp ($b8)
$1c:867d  b4 6a		 ldy $6a,x
$1c:867f  2d 1b 0d	  and $0d1b
$1c:8682  8c ae 6d	  sty $6dae
$1c:8685  0c 9b 43	  tsb $439b
$1c:8688  66 d1		 ror $d1
$1c:868a  c9 b0		 cmp #$b0
$1c:868c  98			tya
$1c:868d  23 d1		 and $d1,s
$1c:868f  68			pla
$1c:8690  f9 2c 65	  sbc $652c,y
$1c:8693  ef f1 20 00   sbc $0020f1
$1c:8697  10 08		 bpl $86a1
$1c:8699  80 00		 bra $869b
$1c:869b  49 9c		 eor #$9c
$1c:869d  7a			ply
$1c:869e  c1 1e		 cmp ($1e,x)
$1c:86a0  b0 c7		 bcs $8669
$1c:86a2  ae 11 eb	  ldx $eb11
$1c:86a5  8c 5b 39	  sty $395b
$1c:86a8  16 ce		 asl $ce,x
$1c:86aa  c5 b5		 cmp $b5
$1c:86ac  91 6d		 sta ($6d),y
$1c:86ae  6c 5b 3d	  jmp ($3d5b)
$1c:86b1  16 cf		 asl $cf,x
$1c:86b3  88			dey
$1c:86b4  c7 5e		 cmp [$5e]
$1c:86b6  57 19		 eor [$19],y
$1c:86b8  dc 5a 95	  jml [$955a]
$1c:86bb  16 a5		 asl $a5,x
$1c:86bd  83 c4		 sta $c4,s
$1c:86bf  14 13		 trb $13
$1c:86c1  c8			iny
$1c:86c2  b4 f6		 ldy $f6,x
$1c:86c4  2d 3e 34	  and $343e
$1c:86c7  8d 3a 2d	  sta $2d3a
$1c:86ca  4f 1f 88 00   eor $00881f
$1c:86ce  08			php
$1c:86cf  80 04		 bra $86d5
$1c:86d1  02 02		 cop #$02
$1c:86d3  4c a2 dc	  jmp $dca2
$1c:86d6  08			php
$1c:86d7  b7 06		 lda [$06],y
$1c:86d9  2d d0 8b	  and $8bd0
$1c:86dc  74 62		 stz $62,x
$1c:86de  58			cli
$1c:86df  c8			iny
$1c:86e0  94 b6		 sty $b6,x
$1c:86e2  25 6c		 and $6c
$1c:86e4  89 5b		 bit #$5b
$1c:86e6  62 52 c8	  per $4f3b
$1c:86e9  96 3e		 stx $3e,y
$1c:86eb  25 6e		 and $6e
$1c:86ed  89 05		 bit #$05
$1c:86ef  82 b5 16	  brl $9da7
$1c:86f2  a6 c5		 ldx $c5
$1c:86f4  ab			plb
$1c:86f5  71 6a		 adc ($6a),y
$1c:86f7  ec 5a 98	  cpx $985a
$1c:86fa  d9 1a e3	  cmp $e31a,y
$1c:86fd  74 eb		 stz $eb,x
$1c:86ff  ee 31 af	  inc $af31
$1c:8702  1b			tcs
$1c:8703  ce 64 7d	  dec $7d64
$1c:8706  03 b9		 ora $b9,s
$1c:8708  bd 06 25	  lda $2506,x
$1c:870b  dc 89 77	  jml [$7789]
$1c:870e  62 5e c8	  per $4f6f
$1c:8711  97 b6		 sta [$b6],y
$1c:8713  25 7c		 and $7c
$1c:8715  89 5f		 bit #$5f
$1c:8717  62 52 e8	  per $6f6c
$1c:871a  96 36		 stx $36,y
$1c:871c  25 7e		 and $7e
$1c:871e  89 5f		 bit #$5f
$1c:8720  e2 58		 sep #$58
$1c:8722  e8			inx
$1c:8723  94 ae		 sty $ae,x
$1c:8725  25 0a		 and $0a
$1c:8727  89 43		 bit #$43
$1c:8729  62 52 a8	  per $2f7e
$1c:872c  94 2e		 sty $2e,x
$1c:872e  25 0c		 and $0c
$1c:8730  0c 8c 72	  tsb $728c
$1c:8733  25 1d		 and $1d
$1c:8735  0f 8c 3e 25   ora $253e8c
$1c:8739  0e 89 1b	  asl $1b89
$1c:873c  81 60		 sta ($60,x)
$1c:873e  4f 60 7a 02   eor $027a60
$1c:8742  e0 86		 cpx #$86
$1c:8744  83 12		 sta $12,s
$1c:8746  ef 44 bb f1   sbc $f1bb44
$1c:874a  2f 74 4b df   and $df4b74
$1c:874e  12 ce		 ora ($ce)
$1c:8750  44 b3 b1	  mvp $b1,$b3
$1c:8753  2d 64 4b	  and $4b64
$1c:8756  5b			tcd
$1c:8757  12 cf		 ora ($cf)
$1c:8759  44 b3 e2	  mvp $e2,$b3
$1c:875c  31 d7		 and ($d7),y
$1c:875e  c4 a3		 cpy $a3
$1c:8760  51 28		 eor ($28),y
$1c:8762  d8			cld
$1c:8763  6c 65 71	  jmp ($7165)
$1c:8766  0e 34 43	  asl $4334
$1c:8769  8f 10 eb 44   sta $44eb10
$1c:876d  3a			dec a
$1c:876e  f1 28		 sbc ($28),y
$1c:8770  f4 4a 3f	  pea $3f4a
$1c:8773  12 06		 ora ($06)
$1c:8775  00 b8		 brk #$b8
$1c:8777  1e 04 b6	  asl $b604,x
$1c:877a  07 b0		 ora [$b0]
$1c:877c  2c 12 65	  bit $6512
$1c:877f  18			clc
$1c:8780  80 c6		 bra $8748
$1c:8782  20 51 88	  jsr $8851
$1c:8785  8c 62 25	  sty $2562
$1c:8788  08			php
$1c:8789  e2 42		 sep #$42
$1c:878b  38			sec
$1c:878c  b0 8e		 bcs $871c
$1c:878e  a4 23		 ldy $23
$1c:8790  aa			tax
$1c:8791  89 14		 bit #$14
$1c:8793  40			rti
$1c:8794  23 83		 and $83,s
$1c:8796  a8			tay
$1c:8797  57 19		 eor [$19],y
$1c:8799  dc 4a 95	  jml [$954a]
$1c:879c  12 a5		 ora ($a5)
$1c:879e  c4 9a		 cpy $9a
$1c:87a0  00 ca		 brk #$ca
$1c:87a2  09 e4		 ora #$e4
$1c:87a4  4a			lsr a
$1c:87a5  7b			tdc
$1c:87a6  12 9f		 ora ($9f)
$1c:87a8  1a			inc a
$1c:87a9  46 9d		 lsr $9d
$1c:87ab  12 a7		 ora ($a7)
$1c:87ad  c7 ac		 cmp [$ac]
$1c:87af  d1 eb		 cmp ($eb),y
$1c:87b1  3c 7a ed	  bit $ed7a,x
$1c:87b4  1e bb c7	  asl $c7bb,x
$1c:87b7  ac 51 eb	  ldy $eb51
$1c:87ba  1c 7a e5	  trb $e57a
$1c:87bd  1e b9 c6	  asl $c6b9,x
$1c:87c0  a1 11		 lda ($11,x)
$1c:87c2  a8			tay
$1c:87c3  4c 6a 31	  jmp $316a
$1c:87c6  1a			inc a
$1c:87c7  8c c6 ad	  sty $adc6
$1c:87ca  51 ab		 eor ($ab),y
$1c:87cc  5c 6a f5 1a   jml $1af56a
$1c:87d0  bd c5 21	  lda $21c5,x
$1c:87d3  11 48		 ora ($48),y
$1c:87d5  4c 52 31	  jmp $3152
$1c:87d8  14 8c		 trb $8c
$1c:87da  c4 ab		 cpy $ab
$1c:87dc  51 2a		 eor ($2a),y
$1c:87de  6c 4a b7	  jmp ($b74a)
$1c:87e1  12 ae		 ora ($ae)
$1c:87e3  c4 a9		 cpy $a9
$1c:87e5  8d 91 ae	  sta $ae91
$1c:87e8  37 4e		 and [$4e],y
$1c:87ea  be e3 1a	  ldx $1ae3,y
$1c:87ed  f4 7b 0d	  pea $0d7b
$1c:87f0  1e c3 c7	  asl $c7c3,x
$1c:87f3  b2 d1		 lda ($d1)
$1c:87f5  ec bc 7a	  cpx $7abc
$1c:87f8  c9 1e		 cmp #$1e
$1c:87fa  b2 c7		 lda ($c7)
$1c:87fc  ae 91 eb	  ldx $eb91
$1c:87ff  ac 6a 51	  ldy $516a
$1c:8802  1a			inc a
$1c:8803  94 c6		 sty $c6,x
$1c:8805  a7 11		 lda [$11]
$1c:8807  a9 cc		 lda #$cc
$1c:8809  6a			ror a
$1c:880a  d1 1a		 cmp ($1a),y
$1c:880c  b4 c6		 ldy $c6,x
$1c:880e  af 11 ab cc   lda $ccab11
$1c:8812  52 51		 eor ($51)
$1c:8814  14 94		 trb $94
$1c:8816  c5 27		 cmp $27
$1c:8818  11 49		 ora ($49),y
$1c:881a  cc 5b 7d	  cpy $7d5b
$1c:881d  16 df		 asl $df,x
$1c:881f  c5 b9		 cmp $b9
$1c:8821  d1 6e		 cmp ($6e),y
$1c:8823  7c 4b 11	  jmp ($114b,x)
$1c:8826  12 c4		 ora ($c4)
$1c:8828  c4 b3		 cpy $b3
$1c:882a  11 2c		 ora ($2c),y
$1c:882c  cc 4b 15	  cpy $154b
$1c:882f  12 c5		 ora ($c5)
$1c:8831  c4 b3		 cpy $b3
$1c:8833  51 2c		 eor ($2c),y
$1c:8835  dc 7b 4d	  jml [$4d7b]
$1c:8838  1e d3 c7	  asl $c7d3,x
$1c:883b  b6 d1		 ldx $d1,y
$1c:883d  ed bc 6b	  sbc $6bbc
$1c:8840  7d 1a df	  adc $df1a,x
$1c:8843  c6 b9		 dec $b9
$1c:8845  d1 ae		 cmp ($ae),y
$1c:8847  7c 6a 91	  jmp ($916a,x)
$1c:884a  1a			inc a
$1c:884b  a4 c6		 ldy $c6
$1c:884d  ab			plb
$1c:884e  11 aa		 ora ($aa),y
$1c:8850  cc 6b 79	  cpy $796b
$1c:8853  1a			inc a
$1c:8854  de c6 b9	  dec $b9c6,x
$1c:8857  91 ae		 sta ($ae),y
$1c:8859  6c 52 91	  jmp ($9152)
$1c:885c  14 a4		 trb $a4
$1c:885e  c5 2b		 cmp $2b
$1c:8860  11 4a		 ora ($4a),y
$1c:8862  cc 5b 79	  cpy $795b
$1c:8865  16 de		 asl $de,x
$1c:8867  c5 b9		 cmp $b9
$1c:8869  91 6e		 sta ($6e),y
$1c:886b  6d 4b 13	  adc $134b
$1c:886e  52 c4		 eor ($c4)
$1c:8870  54 b3 35	  mvn $35,$b3
$1c:8873  21 20		 and ($20,x)
$1c:8875  6a			ror a
$1c:8876  a2 5a		 ldx #$5a
$1c:8878  b8			clv
$1c:8879  96 ea		 stx $ea,y
$1c:887b  25 bb		 and $bb
$1c:887d  8e 68 23	  stx $2368
$1c:8880  9a			txs
$1c:8881  58			cli
$1c:8882  e6 92		 inc $92
$1c:8884  39 b0 8e	  and $8eb0,y
$1c:8887  68			pla
$1c:8888  a3 9a		 lda $9a,s
$1c:888a  18			clc
$1c:888b  e6 c6		 inc $c6
$1c:888d  39 a3 37	  and $37a3,y
$1c:8890  8e d4 e6	  stx $e6d4
$1c:8893  a7 c0		 lda [$c0]
$1c:8895  3e 0c 01	  rol $010c,x
$1c:8898  1e b1 69	  asl $69b1,x
$1c:889b  64 5a		 stz $5a
$1c:889d  5b			tcd
$1c:889e  16 d4		 asl $d4,x
$1c:88a0  45 b5		 eor $b5
$1c:88a2  33 44		 and ($44,s),y
$1c:88a4  f8			sed
$1c:88a5  6b			rtl
$1c:88a6  94 23		 sty $23,x
$1c:88a8  34 8b		 bit $8b,x
$1c:88aa  7a			ply
$1c:88ab  22 de 98 b7   jsl $b798de
$1c:88af  aa			tax
$1c:88b0  2d eb 3f	  and $3feb
$1c:88b3  9e d0 ea	  stz $ead0,x
$1c:88b6  2b			pld
$1c:88b7  04 c8		 tsb $c8
$1c:88b9  9b			txy
$1c:88ba  d7 00		 cmp [$00],y
$1c:88bc  77 5c		 adc [$5c],y
$1c:88be  84 d2		 sty $d2
$1c:88c0  4c cf 19	  jmp $19cf
$1c:88c3  b3 4c		 lda ($4c,s),y
$1c:88c5  22 db 88 b6   jsl $b688db
$1c:88c9  e6 2d		 inc $2d
$1c:88cb  5c 8b 57 62   jml $62578b
$1c:88cf  dc 88 b7	  jml [$b788]
$1c:88d2  26 2d		 rol $2d
$1c:88d4  d8			cld
$1c:88d5  8b			phb
$1c:88d6  76 62		 ror $62,x
$1c:88d8  dc a8 b7	  jml [$b7a8]
$1c:88db  2e 2d da	  rol $da2d
$1c:88de  8b			phb
$1c:88df  76 d0		 ror $d0,x
$1c:88e1  e6 7a		 inc $7a
$1c:88e3  03 f0		 ora $f0,s
$1c:88e5  3c 13 02	  bit $0213,x
$1c:88e8  6f 35 a1 1e   adc $1ea135
$1c:88ec  09 e8		 ora #$e8
$1c:88ee  31 69		 and ($69),y
$1c:88f0  2c 5a 4f	  bit $4f5a
$1c:88f3  16 9a		 asl $9a,x
$1c:88f5  c5 a6		 cmp $a6
$1c:88f7  f3 69		 sbc ($69,s),y
$1c:88f9  2c da 4d	  bit $4dda
$1c:88fc  36 9a		 rol $9a,x
$1c:88fe  cd 83 a0	  cmp $a083
$1c:8901  1a			inc a
$1c:8902  00 d0		 brk #$d0
$1c:8904  08			php
$1c:8905  c8			iny
$1c:8906  34 12		 bit $12,x
$1c:8908  70 e8		 bvs $88f2
$1c:890a  cd e1 92	  cmp $92e1
$1c:890d  08			php
$1c:890e  64 86		 stz $86
$1c:8910  31 01		 and ($01),y
$1c:8912  8c 40 86	  sty $8640
$1c:8915  20 2f 01	  jsr $012f
$1c:8918  99 8c 02	  sta $028c,y
$1c:891b  46 33		 lsr $33
$1c:891d  18			clc
$1c:891e  28			plp
$1c:891f  dc 64 44	  jml [$4464]
$1c:8922  32 25		 and ($25)
$1c:8924  9c 46 31	  stz $3146
$1c:8927  15 19		 ora $19,x
$1c:8929  91 4c		 sta ($4c),y
$1c:892b  a1 1c		 lda ($1c,x)
$1c:892d  48			pha
$1c:892e  47 16		 eor [$16]
$1c:8930  11 92		 ora ($92),y
$1c:8932  84 65		 sty $65
$1c:8934  4b			phk
$1c:8935  e3 83		 sbc $83,s
$1c:8937  84 75		 sty $75
$1c:8939  21 18		 and ($18,x)
$1c:893b  52 98		 eor ($98)
$1c:893d  c4 a1		 cpy $a1
$1c:893f  93 18		 sta ($18,s),y
$1c:8941  64 c0		 stz $c0
$1c:8943  de 73 03	  dec $0373,x
$1c:8946  98			tya
$1c:8947  14 c8		 trb $c8
$1c:8949  e6 33		 inc $33
$1c:894b  23 f9		 and $f9,s
$1c:894d  9f 02 66 4f   sta $4f6602,x
$1c:8951  58			cli
$1c:8952  31 bd		 and ($bd),y
$1c:8954  66 46		 ror $46
$1c:8956  11 30		 ora ($30),y
$1c:8958  06 4e		 asl $4e
$1c:895a  11 94		 ora ($94),y
$1c:895c  30 8e		 bmi $88ec
$1c:895e  0a			asl a
$1c:895f  11 d5		 ora ($d5),y
$1c:8961  84 61		 sty $61
$1c:8963  22 55 aa f5   jsl $f5aa55
$1c:8967  06 25		 asl $25
$1c:8969  5b			tcd
$1c:896a  af 54 62 52   lda $526254
$1c:896e  cb			wai
$1c:896f  f5 02		 sbc $02,x
$1c:8971  25 3c		 and $3c
$1c:8973  bf 54 27 cb   lda $cb2754,x
$1c:8977  a0 96		 ldy #$96
$1c:8979  cf aa 11 29   cmp $2911aa
$1c:897d  ec 79 64	  cpx $6479
$1c:8980  15 f8		 ora $f8,x
$1c:8982  f2 d8		 sbc ($d8)
$1c:8984  2b			pld
$1c:8985  c6 75		 dec $75
$1c:8987  52 01		 eor ($01)
$1c:8989  81 1a		 sta ($1a,x)
$1c:898b  c4 6a		 cpy $6a
$1c:898d  06 e2		 asl $e2
$1c:898f  28			plp
$1c:8990  01 a8		 ora ($a8,x)
$1c:8992  31 2a		 and ($2a),y
$1c:8994  62 c4 6b	  per $f55b
$1c:8997  8b			phb
$1c:8998  51 a6		 eor ($a6),y
$1c:899a  2e 46 b8	  rol $b846
$1c:899d  bd 3a 6b	  lda $6b3a,x
$1c:89a0  0c 6b ac	  tsb $ac6b
$1c:89a3  71 a6		 adc ($a6),y
$1c:89a5  b2 c6		 lda ($c6)
$1c:89a7  ba			tsx
$1c:89a8  a7 53		 lda [$53]
$1c:89aa  20 28 10	  jsr $1028
$1c:89ad  2c 4a a0	  bit $a04a
$1c:89b0  0e 21 80	  asl $8021
$1c:89b3  02 83		 cop #$83
$1c:89b5  1e 8b 47	  asl $478b,x
$1c:89b8  a2 f0		 ldx #$f0
$1c:89ba  e9 92		 sbc #$92
$1c:89bc  c4 27		 cpy $27
$1c:89be  d0 75		 bne $8a35
$1c:89c0  c8			iny
$1c:89c1  0c c1 7a	  tsb $7ac1
$1c:89c4  57 e8		 eor [$e8],y
$1c:89c6  3b			tsc
$1c:89c7  0c 21 d3	  tsb $d321
$1c:89ca  3a			dec a
$1c:89cb  f4 5e bc	  pea $bc5e
$1c:89ce  30 0a		 bmi $89da
$1c:89d0  0c 3b fb	  tsb $fb3b
$1c:89d3  34 93		 bit $93,x
$1c:89d5  13 ce		 ora ($ce,s),y
$1c:89d7  7e 55 1d	  ror $1d55,x
$1c:89da  71 64		 adc ($64),y
$1c:89dc  66 91		 ror $91
$1c:89de  6a			ror a
$1c:89df  14 5a		 trb $5a
$1c:89e1  87 16		 sta [$16]
$1c:89e3  a9 45		 lda #$45
$1c:89e5  aa			tax
$1c:89e6  71 6a		 adc ($6a),y
$1c:89e8  24 5a		 bit $5a
$1c:89ea  8b			phb
$1c:89eb  16 aa		 asl $aa,x
$1c:89ed  45 aa		 eor $aa
$1c:89ef  a2 f3		 ldx #$f3
$1c:89f1  23 00		 and $00,s
$1c:89f3  d9 26 63	  cmp $6326,y
$1c:89f6  d7 1a		 cmp [$1a],y
$1c:89f8  01 21		 ora ($21,x)
$1c:89fa  62 9a 08	  per $9297
$1c:89fd  46 86		 lsr $86
$1c:89ff  11 b1		 ora ($b1),y
$1c:8a01  8a			txa
$1c:8a02  6c 11 eb	  jmp ($eb11)
$1c:8a05  80 8b		 bra $8992
$1c:8a07  51 a2		 eor ($a2),y
$1c:8a09  d4 78		 pei ($78)
$1c:8a0b  b5 72		 lda $72,x
$1c:8a0d  2d 5d 8b	  and $8b5d
$1c:8a10  55 a2		 eor $a2,x
$1c:8a12  d5 75		 cmp $75,x
$1c:8a14  19 0b fc	  ora $fc0b,y
$1c:8a17  81 c5		 sta ($c5,x)
$1c:8a19  d0 2d		 bne $8a48
$1c:8a1b  04 e9		 tsb $e9
$1c:8a1d  9e 33 66	  stz $6633,x
$1c:8a20  98			tya
$1c:8a21  b6 02		 ldx $02,y
$1c:8a23  6d 16 f0	  adc $f016
$1c:8a26  45 bc		 eor $bc
$1c:8a28  31 6f		 and ($6f),y
$1c:8a2a  24 5b		 bit $5b
$1c:8a2c  cb			wai
$1c:8a2d  16 f1		 asl $f1,x
$1c:8a2f  45 bc		 eor $bc
$1c:8a31  71 6f		 adc ($6f),y
$1c:8a33  34 5b		 bit $5b,x
$1c:8a35  cf 12 85 57   cmp $578512
$1c:8a39  81 81		 sta ($81,x)
$1c:8a3b  2a			rol a
$1c:8a3c  89 42		 bit #$42
$1c:8a3e  e2 50		 sep #$50
$1c:8a40  c3 c8		 cmp $c8,s
$1c:8a42  44 a3 8b	  mvp $8b,$a3
$1c:8a45  d2 89		 cmp ($89)
$1c:8a47  43 48		 eor $48,s
$1c:8a49  61 12		 adc ($12,x)
$1c:8a4b  8e c7 9e	  stx $9ec7
$1c:8a4e  41 0f		 eor ($0f,x)
$1c:8a50  89 43		 bit #$43
$1c:8a52  a2 52		 ldx #$52
$1c:8a54  f8			sed
$1c:8a55  64 82		 stz $82
$1c:8a57  19 21 86	  ora $8621,y
$1c:8a5a  4c a1 9f	  jmp $9fa1
$1c:8a5d  d8			cld
$1c:8a5e  00 5d		 brk #$5d
$1c:8a60  63 58		 adc $58,s
$1c:8a62  88			dey
$1c:8a63  d6 26		 dec $26,x
$1c:8a65  35 98		 and $98,x
$1c:8a67  8d 66 63	  sta $6366
$1c:8a6a  58			cli
$1c:8a6b  a8			tay
$1c:8a6c  d6 2e		 dec $2e,x
$1c:8a6e  35 9a		 and $9a,x
$1c:8a70  8d 66 e3	  sta $e366
$1c:8a73  d0 88		 bne $89fd
$1c:8a75  f4 26 3d	  pea $3d26
$1c:8a78  18			clc
$1c:8a79  8f 46 63 db   sta $db6346
$1c:8a7d  e8			inx
$1c:8a7e  f6 fe		 inc $fe,x
$1c:8a80  3d ce 8f	  and $8fce,x
$1c:8a83  73 e7		 adc ($e7,s),y
$1c:8a85  d2 59		 cmp ($59)
$1c:8a87  f4 9a 7d	  pea $7d9a
$1c:8a8a  35 9f		 and $9f,x
$1c:8a8c  4d 88 22	  eor $2288
$1c:8a8f  42 02		 wdm #$02
$1c:8a91  30 11		 bmi $8aa4
$1c:8a93  8a			txa
$1c:8a94  4e 45 19	  lsr $1945
$1c:8a97  bc f2 4c	  ldy $4cf2,x
$1c:8a9a  57 19		 eor [$19],y
$1c:8a9c  b1 6c		 lda ($6c),y
$1c:8a9e  2b			pld
$1c:8a9f  58			cli
$1c:8aa0  9a			txs
$1c:8aa1  d6 22		 dec $22,x
$1c:8aa3  b5 99		 lda $99,x
$1c:8aa5  ad 09 03	  lda $0309
$1c:8aa8  55 1a		 eor $1a,x
$1c:8aaa  d5 c6		 cmp $c6,x
$1c:8aac  b7 51		 lda [$51],y
$1c:8aae  ad dc 7a	  lda $7adc
$1c:8ab1  51 1e		 eor ($1e),y
$1c:8ab3  94 c7		 sty $c7,x
$1c:8ab5  a7 11		 lda [$11]
$1c:8ab7  e9 cc		 sbc #$cc
$1c:8ab9  7b			tdc
$1c:8aba  79 1e de	  adc $de1e,y
$1c:8abd  c7 b9		 cmp [$b9]
$1c:8abf  91 ee		 sta ($ee),y
$1c:8ac1  6a			ror a
$1c:8ac2  5c 76 29 b1   jml $b12976
$1c:8ac6  d8			cld
$1c:8ac7  1f cf 43 14   ora $1443cf,x
$1c:8acb  c8			iny
$1c:8acc  c7 ad		 cmp [$ad]
$1c:8ace  51 eb		 eor ($eb),y
$1c:8ad0  5c 7a f5 1e   jml $1ef57a
$1c:8ad4  bd 85 d9	  lda $d985,x
$1c:8ad7  3d d1 ea	  and $ead1,x
$1c:8ada  44 7a 93	  mvp $93,$7a
$1c:8add  1e ac 47	  asl $47ac,x
$1c:8ae0  ab			plb
$1c:8ae1  28			plp
$1c:8ae2  75 d8		 adc $d8,x
$1c:8ae4  54 a4 f5	  mvn $f5,$a4
$1c:8ae7  aa			tax
$1c:8ae8  05 4a		 ora $4a
$1c:8aea  6f 5a a8 46   adc $46a85a
$1c:8aee  9f 41 27 8d   sta $8d2741,x
$1c:8af2  01 02		 ora ($02,x)
$1c:8af4  6f 1e b4 47   adc $47b41e
$1c:8af8  ad 31 eb	  lda $eb31
$1c:8afb  c4 7a		 cpy $7a
$1c:8afd  f2 9e		 sbc ($9e)
$1c:8aff  f0 ba		 beq $8abb
$1c:8b01  c5 a5		 cmp $a5
$1c:8b03  91 ef		 sta ($ef),y
$1c:8b05  9c 5a 79	  stz $795a
$1c:8b08  1e fa 3c	  asl $3cfa,x
$1c:8b0b  46 5a		 lsr $5a
$1c:8b0d  f5 08		 sbc $08,x
$1c:8b0f  b4 f6		 ldy $f6,x
$1c:8b11  25 2c		 and $2c
$1c:8b13  8d 7c e2	  sta $e27c
$1c:8b16  53 c8		 eor ($c8,s),y
$1c:8b18  d7 d0		 cmp [$d0],y
$1c:8b1a  02 32		 cop #$32
$1c:8b1c  d0 28		 bne $8b46
$1c:8b1e  44 a7 b1	  mvp $b1,$a7
$1c:8b21  e9 2c		 sbc #$2c
$1c:8b23  7a			ply
$1c:8b24  4f 1e 9a c7   eor $c79a1e
$1c:8b28  a6 f1		 ldx $f1
$1c:8b2a  48			pha
$1c:8b2b  0c 52 05	  tsb $0552
$1c:8b2e  14 88		 trb $88
$1c:8b30  c5 22		 cmp $22
$1c:8b32  4d ff a6	  eor $a6ff
$1c:8b35  47 be		 eor [$be]
$1c:8b37  b1 6a		 lda ($6a),y
$1c:8b39  e4 7b		 cpx $7b
$1c:8b3b  ec 31 1a	  cpx $1a31
$1c:8b3e  68			pla
$1c:8b3f  d4 22		 pei ($22)
$1c:8b41  d5 d8		 cmp $d8,x
$1c:8b43  95 32		 sta $32,x
$1c:8b45  35 f5		 and $f5,x
$1c:8b47  89 57		 bit #$57
$1c:8b49  23 5f		 and $5f,s
$1c:8b4b  62 08 d3	  per $5e56
$1c:8b4e  48			pha
$1c:8b4f  a1 12		 lda ($12,x)
$1c:8b51  ae c6 38	  ldx $38c6
$1c:8b54  55 8e		 eor $8e,x
$1c:8b56  14 73		 trb $73
$1c:8b58  e3 5c		 sbc $5c,s
$1c:8b5a  f8			sed
$1c:8b5b  b7 bd		 lda [$bd],y
$1c:8b5d  ce ab 71	  dec $71ab
$1c:8b60  d0 a2		 bne $8b04
$1c:8b62  c7 40		 cmp [$40]
$1c:8b64  6f 5d 81 7b   adc $7b815d
$1c:8b68  d1 fe		 cmp ($fe),y
$1c:8b6a  9e c8 64	  stz $64c8,x
$1c:8b6d  06 19		 asl $19
$1c:8b6f  02 86		 cop #$86
$1c:8b71  44 61 81	  mvp $81,$61
$1c:8b74  ef 63 7b 5f   sbc $5f7b63
$1c:8b78  cc e9 1c	  cpy $1ce9
$1c:8b7b  80 c7		 bra $8b44
$1c:8b7d  20 51 c8	  jsr $c851
$1c:8b80  8c 72 25	  sty $2572
$1c:8b83  1c 82 47	  trb $4782
$1c:8b86  20 6f 91	  jsr $916f
$1c:8b89  7c 04 41	  jmp ($4104,x)
$1c:8b8c  fe 2f c4	  inc $c42f,x
$1c:8b8f  7d 20 19	  adc $1920,x
$1c:8b92  1f 01 13 7f   ora $7f1301,x
$1c:8b96  8c 51 fe	  sty $fe51
$1c:8b99  61 84		 adc ($84,x)
$1c:8b9b  29 07		 and #$07
$1c:8b9d  0e 21 f1	  asl $f121
$1c:8ba0  88			dey
$1c:8ba1  7c a1 d0	  jmp ($d0a1,x)
$1c:8ba4  18			clc
$1c:8ba5  74 0a		 stz $0a,x
$1c:8ba7  1d 11 87	  ora $8711,x
$1c:8baa  44 a1 d0	  mvp $d0,$a1
$1c:8bad  48			pha
$1c:8bae  74 0c		 stz $0c,x
$1c:8bb0  72 23		 adc ($23)
$1c:8bb2  80 88		 bra $8b3c
$1c:8bb4  0f c4 78 83   ora $8378c4
$1c:8bb8  a4 23		 ldy $23
$1c:8bba  20 e0 22	  jsr $22e0
$1c:8bbd  63 f1		 adc $f1,s
$1c:8bbf  8a			txa
$1c:8bc0  0f cc b0 71   ora $71b0cc
$1c:8bc4  af 81 9d 05   lda $059d81
$1c:8bc8  65 1c		 adc $1c
$1c:8bca  da			phx
$1c:8bcb  47 32		 eor [$32]
$1c:8bcd  26 f3		 rol $f3
$1c:8bcf  d0 c7		 bne $8b98
$1c:8bd1  30 22		 bmi $8bf5
$1c:8bd3  72 13		 adc ($13)
$1c:8bd5  94 63		 sty $63,x
$1c:8bd7  85 18		 sta $18
$1c:8bd9  43 07		 eor $07,s
$1c:8bdb  4a			lsr a
$1c:8bdc  31 d3		 and ($d3),y
$1c:8bde  8e 7c 63	  stx $637c
$1c:8be1  87 20		 sta [$20]
$1c:8be3  48			pha
$1c:8be4  0c 32 07	  tsb $0732
$1c:8be7  0c 82 0a	  tsb $0a82
$1c:8bea  c9 36		 cmp #$36
$1c:8bec  c7 f3		 cmp [$f3]
$1c:8bee  e9 47		 sbc #$47
$1c:8bf0  3a			dec a
$1c:8bf1  70 4f		 bvs $8c42
$1c:8bf3  dd 13 f7	  cmp $f713,x
$1c:8bf6  84 fd		 sty $fd
$1c:8bf8  f1 3f		 sbc ($3f),y
$1c:8bfa  70 8f		 bvs $8b8b
$1c:8bfc  f5 23		 sbc $23,x
$1c:8bfe  fd 88 ff	  sbc $ff88,x
$1c:8c01  72 3f		 adc ($3f)
$1c:8c03  d1 08		 cmp ($08),y
$1c:8c05  02 fd		 cop #$fd
$1c:8c07  20 df 7a	  jsr $7adf
$1c:8c0a  37 de		 and [$de],y
$1c:8c0c  0d f8 a3	  ora $a3f8
$1c:8c0f  7e 20 df	  ror $df20,x
$1c:8c12  9a			txs
$1c:8c13  37 e6		 and [$e6],y
$1c:8c15  0d fa a3	  ora $a3fa
$1c:8c18  7e a0 9f	  ror $9fa0,x
$1c:8c1b  fa			plx
$1c:8c1c  27 ff		 and [$ff]
$1c:8c1e  09 ff		 ora #$ff
$1c:8c20  e2 7f		 sep #$7f
$1c:8c22  e0 9f		 cpx #$9f
$1c:8c24  ca			dex
$1c:8c25  27 f3		 and [$f3]
$1c:8c27  09 fc		 ora #$fc
$1c:8c29  e2 7f		 sep #$7f
$1c:8c2b  15 ec		 ora $ec,x
$1c:8c2d  00 08		 brk #$08
$1c:8c2f  81 40		 sta ($40,x)
$1c:8c31  1d e9 18	  ora $18e9,x
$1c:8c34  90 46		 bcc $8c7c
$1c:8c36  24 91		 bit $91
$1c:8c38  89 84		 bit #$84
$1c:8c3a  62 69 18	  per $a4a6
$1c:8c3d  92 c6		 sta ($c6)
$1c:8c3f  24 71		 bit $71
$1c:8c41  89 ac		 bit #$ac
$1c:8c43  62 67 36	  per $c2ad
$1c:8c46  cb			wai
$1c:8c47  5d b2 d3	  eor $d3b2,x
$1c:8c4a  6d 35 db	  adc $db35
$1c:8c4d  4d 30 af	  eor $af30
$1c:8c50  4c 2b f3	  jmp $f32b
$1c:8c53  0b			phd
$1c:8c54  74 c2		 stz $c2,x
$1c:8c56  df 36 bc 4d   cmp $4dbc36,x
$1c:8c5a  af 33 6c 44   lda $446c33
$1c:8c5e  db			stp
$1c:8c5f  13 36		 ora ($36,s),y
$1c:8c61  ae 4d ae	  ldx $ae4d
$1c:8c64  b3 6c		 lda ($6c,s),y
$1c:8c66  24 db		 bit $db
$1c:8c68  0b			phd
$1c:8c69  34 ba		 bit $ba,x
$1c:8c6b  4d 2b b3	  eor $b32b
$1c:8c6e  4c 24 d3	  jmp $d324
$1c:8c71  0a			asl a
$1c:8c72  f7 19		 sbc [$19],y
$1c:8c74  0b			phd
$1c:8c75  ec 66 31	  cpx $3166
$1c:8c78  89 10		 bit #$10
$1c:8c7a  04 66		 tsb $66
$1c:8c7c  40			rti
$1c:8c7d  50 8d		 bvc $8c0c
$1c:8c7f  43 a3		 eor $a3,s
$1c:8c81  50 d8		 bvc $8c5b
$1c:8c83  d4 7a		 pei ($7a)
$1c:8c85  35 1d		 and $1d,x
$1c:8c87  8d 61 a3	  sta $a361
$1c:8c8a  57 62		 eor [$62],y
$1c:8c8c  48			pha
$1c:8c8d  dd e3 19	  cmp $19e3,x
$1c:8c90  08			php
$1c:8c91  c6 44		 dec $44
$1c:8c93  a2 25		 ldx #$25
$1c:8c95  00 c0		 brk #$c0
$1c:8c97  46 30		 lsr $30
$1c:8c99  25 91		 and $91
$1c:8c9b  2c 01 60	  bit $6001
$1c:8c9e  8a			txa
$1c:8c9f  88			dey
$1c:8ca0  52 02		 eor ($02)
$1c:8ca2  d0 64		 bne $8d08
$1c:8ca4  22 d2 e8 b4   jsl $b4e8d2
$1c:8ca8  be 2d 3e	  ldx $3e2d,y
$1c:8cab  8b			phb
$1c:8cac  4f c7 e3 0f   eor $0fe3c7
$1c:8cb0  21 8c		 and ($8c,x)
$1c:8cb2  7c 7e 34	  jmp ($347e,x)
$1c:8cb5  f2 18		 sbc ($18)
$1c:8cb7  47 a5		 eor [$a5]
$1c:8cb9  b5 aa		 lda $aa,x
$1c:8cbb  71 e4		 adc ($e4),y
$1c:8cbd  2b			pld
$1c:8cbe  d2 d3		 cmp ($d3)
$1c:8cc0  e8			inx
$1c:8cc1  ec 63 5f	  cpx $5f63
$1c:8cc4  38			sec
$1c:8cc5  d7 06		 cmp [$06],y
$1c:8cc7  35 c2		 and $c2,x
$1c:8cc9  33 af		 and ($af,s),y
$1c:8ccb  c8			iny
$1c:8ccc  ae a5 64	  ldx $64a5
$1c:8ccf  f8			sed
$1c:8cd0  95 c2		 sta $c2,x
$1c:8cd2  2d 7e 8b	  and $8b7e
$1c:8cd5  5f e2 d8 e8   eor $e8d8e2,x
$1c:8cd9  b6 3c		 ldx $3c,y
$1c:8cdb  4e 37 51	  lsr $5137
$1c:8cde  59 c1 a3	  eor $a3c1,y
$1c:8ce1  10 38		 bpl $8d1b
$1c:8ce3  c4 5a		 cpy $5a
$1c:8ce5  31 17		 and ($17),y
$1c:8ce7  ec 44 e3	  cpx $e344
$1c:8cea  10 76		 bpl $8d62
$1c:8cec  19 2f c5	  ora $c52f,y
$1c:8cef  94 4c		 sty $4c,x
$1c:8cf1  80 68		 bra $8d5b
$1c:8cf3  0f 61 84 11   ora $118461
$1c:8cf7  79 85 26	  adc $2685,y
$1c:8cfa  61 4a		 adc ($4a,x)
$1c:8cfc  98			tya
$1c:8cfd  7d 66 1f	  adc $1f66,x
$1c:8d00  62 fa fc	  per $89fd
$1c:8d03  62 d9 e8	  per $75df
$1c:8d06  b6 7e		 ldx $7e,y
$1c:8d08  2d ae 8b	  and $8bae
$1c:8d0b  6b			rtl
$1c:8d0c  e2 d9		 sep #$d9
$1c:8d0e  48			pha
$1c:8d0f  b6 56		 ldx $56,y
$1c:8d11  2d a4 8b	  and $8ba4
$1c:8d14  69 63		 adc #$63
$1c:8d16  52 68		 eor ($68)
$1c:8d18  d4 9e		 pei ($9e)
$1c:8d1a  35 36		 and $36,x
$1c:8d1c  8d 4d e2	  sta $e24d
$1c:8d1f  9c 18 a2	  stz $a218
$1c:8d22  58			cli
$1c:8d23  06 83		 asl $83
$1c:8d25  1a			inc a
$1c:8d26  8c 46 a1	  sty $a146
$1c:8d29  01 11		 ora ($11,x)
$1c:8d2b  08			php
$1c:8d2c  00 00		 brk #$00
$1c:8d2e  a2 01		 ldx #$01
$1c:8d30  b0 2b		 bcs $8d5d
$1c:8d32  8d 30 a2	  sta $a230
$1c:8d35  22 20 a6 96   jsl $96a620
$1c:8d39  44 50 1f	  mvp $1f,$50
$1c:8d3c  19 96 de	  ora $de96,y
$1c:8d3f  65 b8		 adc $b8
$1c:8d41  17 94		 ora [$94],y
$1c:8d43  43 67		 eor $67,s
$1c:8d45  18			clc
$1c:8d46  de 8d ca	  dec $ca8d,x
$1c:8d49  31 be		 and ($be),y
$1c:8d4b  ac 6f 87	  ldy $876f
$1c:8d4e  e5 58		 sbc $58
$1c:8d50  1d 07 0c	  ora $0c07,x
$1c:8d53  8e 57 8e	  stx $8e57
$1c:8d56  6c 82 01	  jmp ($0182)
$1c:8d59  78			sei
$1c:8d5a  ee 93 ca	  inc $ca93
$1c:8d5d  71 cd		 adc ($cd),y
$1c:8d5f  2c 8f 76	  bit $768f
$1c:8d62  69 0a		 adc #$0a
$1c:8d64  ba			tsx
$1c:8d65  42 a6		 wdm #$a6
$1c:8d67  91 ab		 sta ($ab),y
$1c:8d69  a4 6a		 ldy $6a
$1c:8d6b  e1 0b		 sbc ($0b,x)
$1c:8d6d  98			tya
$1c:8d6e  42 ee		 wdm #$ee
$1c:8d70  11 b9		 ora ($b9),y
$1c:8d72  84 6e		 sty $6e
$1c:8d74  01 00		 ora ($00,x)
$1c:8d76  81 1c		 sta ($1c,x)
$1c:8d78  04 de		 tsb $de
$1c:8d7a  87 12		 sta [$12]
$1c:8d7c  8b			phb
$1c:8d7d  64 e2		 stz $e2
$1c:8d7f  d4 18		 pei ($18)
$1c:8d81  b6 82		 ldx $82,y
$1c:8d83  2d 51 8b	  and $8b51
$1c:8d86  50 a2		 bvc $8d2a
$1c:8d88  d4 38		 pei ($38)
$1c:8d8a  b6 0a		 ldx $0a,y
$1c:8d8c  2d 53 89	  and $8953
$1c:8d8f  50 22		 bvc $8db3
$1c:8d91  54 48 95	  mvn $95,$48
$1c:8d94  42 25		 wdm #$25
$1c:8d96  51 47		 eor ($47),y
$1c:8d98  8e 49 26	  stx $2649
$1c:8d9b  3a			dec a
$1c:8d9c  08			php
$1c:8d9d  96 4d		 stx $4d,y
$1c:8d9f  22 29 e0 4b   jsl $4be029
$1c:8da3  05 0a		 ora $0a
$1c:8da5  25 43		 and $43
$1c:8da7  89 60		 bit #$60
$1c:8da9  a2 55		 ldx #$55
$1c:8dab  33 a0		 and ($a0,s),y
$1c:8dad  c0 25		 cpy #$25
$1c:8daf  1c 69 47	  trb $4769
$1c:8db2  1e 81 00	  asl $0081,x
$1c:8db5  5b			tcd
$1c:8db6  85 a3		 sta $a3
$1c:8db8  8f 68 e3 45   sta $45e368
$1c:8dbc  b6 11		 ldx $11,y
$1c:8dbe  6b			rtl
$1c:8dbf  0c 5b 81	  tsb $815b
$1c:8dc2  16 b8		 asl $b8,x
$1c:8dc4  c5 ae		 cmp $ae
$1c:8dc6  51 6b		 eor ($6b),y
$1c:8dc8  1b			tcs
$1c:8dc9  14 6e		 trb $6e
$1c:8dcb  31 2b		 and ($2b),y
$1c:8dcd  04 4a		 tsb $4a
$1c:8dcf  c3 12		 cmp $12,s
$1c:8dd1  67 03		 adc [$03]
$1c:8dd3  38			sec
$1c:8dd4  b6 0d		 ldx $0d,y
$1c:8dd6  31 e0		 and ($e0),y
$1c:8dd8  36 45		 rol $45,x
$1c:8dda  a4 0d		 ldy $0d
$1c:8ddc  e0 67		 cpx #$67
$1c:8dde  05 ca		 ora $ca
$1c:8de0  25 63		 and $63
$1c:8de2  69 94		 adc #$94
$1c:8de4  2b			pld
$1c:8de5  a1 0a		 lda ($0a,x)
$1c:8de7  e8			inx
$1c:8de8  c2 bc		 rep #$bc
$1c:8dea  10 af		 bpl $8d9b
$1c:8dec  0d 2b a3	  ora $a32b
$1c:8def  4a			lsr a
$1c:8df0  e8			inx
$1c:8df1  52 9e		 eor ($9e)
$1c:8df3  c1 e0		 cmp ($e0,x)
$1c:8df5  9a			txs
$1c:8df6  6d 66 1b	  adc $1b66
$1c:8df9  89 a7 14	  bit #$14a7
$1c:8dfc  02 11		 cop #$11
$1c:8dfe  6c 64 5b	  jmp ($5b64)
$1c:8e01  1b			tcs
$1c:8e02  16 d7		 asl $d7,x
$1c:8e04  45 b5		 eor $b5
$1c:8e06  f9 6b 26	  sbc $266b,y
$1c:8e09  5a			phy
$1c:8e0a  d3 96		 cmp ($96,s),y
$1c:8e0c  aa			tax
$1c:8e0d  65 ab		 adc $ab
$1c:8e0f  39 2b 26	  and $262b,y
$1c:8e12  4a			lsr a
$1c:8e13  d3 92		 cmp ($92,s),y
$1c:8e15  aa			tax
$1c:8e16  64 ab		 stz $ab
$1c:8e18  31 a9		 and ($a9),y
$1c:8e1a  74 6a		 stz $6a,x
$1c:8e1c  5f 1a 9f 46   eor $469f1a,x
$1c:8e20  a7 f1		 lda [$f1]
$1c:8e22  6b			rtl
$1c:8e23  14 5a		 trb $5a
$1c:8e25  e7 16		 sbc [$16]
$1c:8e27  e4 0a		 cpx $0a
$1c:8e29  c5 10		 cmp $10
$1c:8e2b  55 28		 eor $28,x
$1c:8e2d  b6 0e		 ldx $0e,y
$1c:8e2f  2d 40 8b	  and $8b40
$1c:8e32  20 82 a1	  jsr $a182
$1c:8e35  16 43		 asl $43,x
$1c:8e37  00 e0		 brk #$e0
$1c:8e39  32 43		 and ($43)
$1c:8e3b  b1 d0		 lda ($d0),y
$1c:8e3d  4d b4 33	  eor $33b4
$1c:8e40  6d 14 5b	  adc $5b14
$1c:8e43  e0 4b 1d	  cpx #$1d4b
$1c:8e46  99 3d 22	  sta $223d,y
$1c:8e49  45 65		 eor $65
$1c:8e4b  8d 4a 4b	  sta $4b4a
$1c:8e4e  e9 28 ec	  sbc #$ec28
$1c:8e51  da			phx
$1c:8e52  3b			tsc
$1c:8e53  32 8e		 and ($8e)
$1c:8e55  d5 a3		 cmp $a3,x
$1c:8e57  b4 27		 ldy $27,x
$1c:8e59  36 60		 rol $60,x
$1c:8e5b  c5 ac		 cmp $ac
$1c:8e5d  11 66		 ora ($66),y
$1c:8e5f  10 1d		 bpl $8e7e
$1c:8e61  11 80		 ora ($80),y
$1c:8e63  0c 60 e0	  tsb $e060
$1c:8e66  45 3e		 eor $3e
$1c:8e68  08			php
$1c:8e69  71 d8		 adc ($d8),y
$1c:8e6b  c5 36		 cmp $36
$1c:8e6d  4a			lsr a
$1c:8e6e  73 a9		 adc ($a9,s),y
$1c:8e70  44 b0 71	  mvp $71,$b0
$1c:8e73  2b			pld
$1c:8e74  14 4a		 trb $4a
$1c:8e76  e6 d3		 inc $d3
$1c:8e78  25 80		 and $80
$1c:8e7a  c0 25 92	  cpy #$9225
$1c:8e7d  a9 64 e9	  lda #$e964
$1c:8e80  72 0a		 adc ($0a)
$1c:8e82  70 b6		 bvs $8e3a
$1c:8e84  4e ad 92	  lsr $92ad
$1c:8e87  a9 b7 12	  lda #$12b7
$1c:8e8a  65 b8		 adc $b8
$1c:8e8c  9b			txy
$1c:8e8d  6d 56 21	  adc $2156
$1c:8e90  32 db		 and ($db)
$1c:8e92  ab			plb
$1c:8e93  c5 70		 cmp $70
$1c:8e95  1b			tcs
$1c:8e96  55 7f		 eor $7f,x
$1c:8e98  f1 25		 sbc ($25),y
$1c:8e9a  cb			wai
$1c:8e9b  21 68		 and ($68,x)
$1c:8e9d  84 b9		 sty $b9
$1c:8e9f  70 2d		 bvs $8ece
$1c:8ea1  71 67		 adc ($67),y
$1c:8ea3  7a			ply
$1c:8ea4  dc 7a f3	  jml [$f37a]
$1c:8ea7  6f 34 db cf   adc $cfdb34
$1c:8eab  36 ea		 rol $ea,x
$1c:8ead  ac 47 ca	  ldy $ca47
$1c:8eb0  f3 1e		 sbc ($1e,s),y
$1c:8eb2  2a			rol a
$1c:8eb3  c4 58		 cpy $58
$1c:8eb5  02 b7		 cop #$b7
$1c:8eb7  10 00		 bpl $8eb9
$1c:8eb9  36 11		 rol $11,x
$1c:8ebb  e4 ad		 cpx $ad
$1c:8ebd  11 7e		 ora ($7e),y
$1c:8ebf  1b			tcs
$1c:8ec0  44 5a 02	  mvp $02,$5a
$1c:8ec3  d7 11		 cmp [$11],y
$1c:8ec5  00 2e		 brk #$2e
$1c:8ec7  06 69		 asl $69
$1c:8ec9  d7 9a		 cmp [$9a],y
$1c:8ecb  75 66		 adc $66,x
$1c:8ecd  9c 59 a7	  stz $a759
$1c:8ed0  94 5e		 sty $5e,x
$1c:8ed2  7d 61 98	  adc $9861,x
$1c:8ed5  2c c9 fe	  bit $fec9
$1c:8ed8  4b			phk
$1c:8ed9  b2 03		 lda ($03)
$1c:8edb  94 db		 sty $db,x
$1c:8edd  a8			tay
$1c:8ede  f7 09		 sbc [$09],y
$1c:8ee0  b7 91		 lda [$91],y
$1c:8ee2  f6 2f		 inc $2f,x
$1c:8ee4  20 ec 3d	  jsr $3dec
$1c:8ee7  47 d0		 eor [$d0]
$1c:8ee9  d3 20		 cmp ($20,s),y
$1c:8eeb  f9 36 c8	  sbc $c836,y
$1c:8eee  4e 51 8c	  lsr $8c51
$1c:8ef1  84 63		 sty $63
$1c:8ef3  23 34		 and $34,s
$1c:8ef5  ce cd 35	  dec $35cd
$1c:8ef8  b1 8c		 lda ($8c),y
$1c:8efa  01 c4		 ora ($c4,x)
$1c:8efc  0e 24 6f	  asl $6f24
$1c:8eff  1c 09 d4	  trb $d409
$1c:8f02  72 11		 adc ($11)
$1c:8f04  6d 5c 5b	  adc $5b5c
$1c:8f07  59 16 ce	  eor $ce16,y
$1c:8f0a  c5 90		 cmp $90
$1c:8f0c  82 71 14	  brl $a380
$1c:8f0f  20 c4 b9	  jsr $b9c4
$1c:8f12  f1 2e		 sbc ($2e),y
$1c:8f14  76 5b		 ror $5b,x
$1c:8f16  3b			tsc
$1c:8f17  96 42		 stx $42,y
$1c:8f19  08			php
$1c:8f1a  bc 7c d3	  ldy $d37c,x
$1c:8f1d  4f 38 c4 12   eor $12c438
$1c:8f21  22 36 05 20   jsl $200536
$1c:8f25  75 26		 adc $26,x
$1c:8f27  9d 89 a6	  sta $a689,x
$1c:8f2a  86 69		 stx $69
$1c:8f2c  a2 9a 6c	  ldx #$6c9a
$1c:8f2f  95 e2		 sta $e2,x
$1c:8f31  a4 05		 ldy $05
$1c:8f33  a0 2c 81	  ldy #$812c
$1c:8f36  70 0b		 bvs $8f43
$1c:8f38  60			rts
$1c:8f39  7a			ply
$1c:8f3a  01 40		 ora ($40,x)
$1c:8f3c  0b			phd
$1c:8f3d  41 a1		 eor ($a1,x)
$1c:8f3f  9b			txy
$1c:8f40  68			pla
$1c:8f41  90 e7		 bcc $8f2a
$1c:8f43  9b			txy
$1c:8f44  8b			phb
$1c:8f45  67 22		 adc [$22]
$1c:8f47  5d e8 97	  eor $97e8,x
$1c:8f4a  7e 25 ee	  ror $ee25,x
$1c:8f4d  89 7b cc	  bit #$cc7b
$1c:8f50  e0 25 21	  cpx #$2125
$1c:8f53  28			plp
$1c:8f54  0b			phd
$1c:8f55  cd 4c 1e	  cmp $1e4c
$1c:8f58  53 b8		 eor ($b8,s),y
$1c:8f5a  43 37		 eor $37,s
$1c:8f5c  e8			inx
$1c:8f5d  10 78		 bpl $8fd7
$1c:8f5f  83 c5		 sta $c5,s
$1c:8f61  0e e2 fe	  asl $fee2
$1c:8f64  07 a1		 ora [$a1]
$1c:8f66  bd 51 de	  lda $de51,x
$1c:8f69  4f 16 7a 9b   eor $9b7a16
$1c:8f6d  f8			sed
$1c:8f6e  40			rti
$1c:8f6f  70 05		 bvs $8f76
$1c:8f71  5c 8b c4 72   jml $72c48b
$1c:8f75  02 f5		 cop #$f5
$1c:8f77  f9 0b 50	  sbc $500b,y
$1c:8f7a  de 14 af	  dec $af14,x
$1c:8f7d  fc 28 90	  jsr ($9028,x)
$1c:8f80  1e 98 57	  asl $5798,x
$1c:8f83  a8			tay
$1c:8f84  5e 80 37	  lsr $3780,x
$1c:8f87  1b			tcs
$1c:8f88  13 e8		 ora ($e8,s),y
$1c:8f8a  b2 10		 lda ($10)
$1c:8f8c  03 38		 ora $38,s
$1c:8f8e  da			phx
$1c:8f8f  3b			tsc
$1c:8f90  92 8e		 sta ($8e)
$1c:8f92  e3 fc		 sbc $fc,s
$1c:8f94  36 9a		 rol $9a,x
$1c:8f96  04 88		 tsb $88
$1c:8f98  6d 38 07	  adc $0738
$1c:8f9b  11 c0		 ora ($c0),y
$1c:8f9d  9d 41 fe	  sta $fe41,x
$1c:8fa0  11 e9		 ora ($e9),y
$1c:8fa2  e6 5b		 inc $5b
$1c:8fa4  81 1e		 sta ($1e,x)
$1c:8fa6  9e a0 41	  stz $41a0,x
$1c:8fa9  02 3b		 cop #$3b
$1c:8fab  c4 08		 cpy $08
$1c:8fad  ee cf e1	  inc $e1cf
$1c:8fb0  16 ed		 asl $ed,x
$1c:8fb2  a0 c2 2d	  ldy #$2dc2
$1c:8fb5  eb			xba
$1c:8fb6  48			pha
$1c:8fb7  8e f1 2a	  stx $2af1
$1c:8fba  08			php
$1c:8fbb  d0 7f		 bne $903c
$1c:8fbd  8d 30 16	  sta $1630
$1c:8fc0  2a			rol a
$1c:8fc1  20 a6 82	  jsr $82a6
$1c:8fc4  c5 50		 cmp $50
$1c:8fc6  18			clc
$1c:8fc7  08			php
$1c:8fc8  d4 31		 pei ($31)
$1c:8fca  02 11		 cop #$11
$1c:8fcc  a8			tay
$1c:8fcd  e2 14		 sep #$14
$1c:8fcf  a3 50		 lda $50,s
$1c:8fd1  25 88		 and $88
$1c:8fd3  c7 cf		 cmp [$cf]
$1c:8fd5  e9 16 d1	  sbc #$d116
$1c:8fd8  a1 c9		 lda ($c9,x)
$1c:8fda  8a			txa
$1c:8fdb  08			php
$1c:8fdc  d1 47		 cmp ($47),y
$1c:8fde  06 f1		 asl $f1
$1c:8fe0  a2 2c		 ldx #$2c
$1c:8fe2  e2 9e		 sep #$9e
$1c:8fe4  b4 46		 ldy $46,x
$1c:8fe6  78			sei
$1c:8fe7  8d 19 63	  sta $6319
$1c:8fea  4c a1 d5	  jmp $d5a1
$1c:8fed  48			pha
$1c:8fee  75 66		 adc $66,x
$1c:8ff0  1d 64 87	  ora $8764,x
$1c:8ff3  5a			phy
$1c:8ff4  43 a1		 eor $a1,s
$1c:8ff6  10 89		 bpl $8f81
$1c:8ff8  02 ca		 cop #$ca
$1c:8ffa  21 11		 and ($11,x)
$1c:8ffc  05 8b		 ora $8b
$1c:8ffe  d0 43		 bne $9043
$1c:9000  a2 fa		 ldx #$fa
$1c:9002  17 b8		 ora [$b8],y
$1c:9004  80 05		 bra $900b
$1c:9006  e2 2a		 sep #$2a
$1c:9008  00 f9		 brk #$f9
$1c:900a  10 c5		 bpl $8fd1
$1c:900c  54 1f 29	  mvn $29,$1f
$1c:900f  d6 e6		 dec $e6,x
$1c:9011  75 ba		 adc $ba,x
$1c:9013  9d 72 67	  sta $6772,x
$1c:9016  55 78		 eor $78,x
$1c:9018  77 4a		 adc [$4a],y
$1c:901a  1d d3 87	  ora $87d3,x
$1c:901d  78			sei
$1c:901e  a1 de		 lda ($de,x)
$1c:9020  3a			dec a
$1c:9021  77 4e		 adc [$4e],y
$1c:9023  9d d2 a7	  sta $a7d2,x
$1c:9026  09 83		 ora #$83
$1c:9028  c5 34		 cmp $34
$1c:902a  b6 dd		 ldx $dd,y
$1c:902c  2d b3 4b	  and $4bb3
$1c:902f  ed d2 fb	  sbc $fbd2
$1c:9032  36 c6		 rol $c6,x
$1c:9034  4d b1 a3	  eor $a3b1
$1c:9037  77 d7		 adc [$d7],y
$1c:9039  4d b5 f3	  eor $f3b5
$1c:903c  ae 55 e8	  ldx $e855
$1c:903f  30 15		 bmi $9056
$1c:9041  69 d7		 adc #$d7
$1c:9043  32 31		 and ($31)
$1c:9045  20 8a 6c	  jsr $6c8a
$1c:9048  63 13		 adc $13,s
$1c:904a  08			php
$1c:904b  a7 06		 lda [$06]
$1c:904d  21 a7		 and ($a7,x)
$1c:904f  a8			tay
$1c:9050  69 ca		 adc #$ca
$1c:9052  e1 10		 sbc ($10,x)
$1c:9054  d4 16		 pei ($16)
$1c:9056  cf 50 59 12   cmp $125950
$1c:905a  f0 51		 beq $90ad
$1c:905c  4b			phk
$1c:905d  63 45		 adc $45,s
$1c:905f  8d 65 e3	  sta $e365
$1c:9062  59 88 d6	  eor $d688,y
$1c:9065  66 35		 ror $35
$1c:9067  9a			txs
$1c:9068  8d 6a 63	  sta $636a
$1c:906b  5a			phy
$1c:906c  a8			tay
$1c:906d  b5 c4		 lda $c4,x
$1c:906f  f6 11		 inc $11,x
$1c:9071  2a			rol a
$1c:9072  04 5b		 tsb $5b
$1c:9074  97 12		 sta [$12],y
$1c:9076  a8			tay
$1c:9077  25 c1		 and $c1
$1c:9079  02 34		 cop #$34
$1c:907b  44 28 44	  mvp $44,$28
$1c:907e  aa			tax
$1c:907f  31 2b		 and ($2b),y
$1c:9081  04 5b		 tsb $5b
$1c:9083  d7 12		 cmp [$12],y
$1c:9085  3f 01 f0 12   and $12f001,x
$1c:9089  41 61		 eor ($61,x)
$1c:908b  49 9e		 eor #$9e
$1c:908d  76 2d		 ror $2d,x
$1c:908f  ad 8b 66	  lda $668b
$1c:9092  e2 d9		 sep #$d9
$1c:9094  c2 a8		 rep #$a8
$1c:9096  45 38		 eor $38
$1c:9098  51 8d		 eor ($8d),y
$1c:909a  f5 63		 sbc $63,x
$1c:909c  7d 3a c3	  adc $c33a,x
$1c:909f  4e ae cb	  lsr $cbae
$1c:90a2  11 bb		 ora ($bb),y
$1c:90a4  ad 45 64	  lda $6445
$1c:90a7  cb			wai
$1c:90a8  02 bb		 cop #$bb
$1c:90aa  c6 29		 dec $29
$1c:90ac  a1 11		 lda ($11,x)
$1c:90ae  64 06		 stz $06
$1c:90b0  42 1d		 wdm #$1d
$1c:90b2  6c 8d 53	  jmp ($538d)
$1c:90b5  21 d8		 and ($d8,x)
$1c:90b7  a6 88		 ldx $88
$1c:90b9  46 a9		 lsr $a9
$1c:90bb  b0 eb		 bcs $90a8
$1c:90bd  e3 5c		 sbc $5c,s
$1c:90bf  71 70		 adc ($70),y
$1c:90c1  e6 a0		 inc $a0
$1c:90c3  c3 ad		 cmp $ad,s
$1c:90c5  4d 53 c5	  eor $c553
$1c:90c8  b5 c6		 lda $c6,x
$1c:90ca  d6 4b		 dec $4b,x
$1c:90cc  1b			tcs
$1c:90cd  31 2c		 and ($2c),y
$1c:90cf  5e 04 f2	  lsr $f204,x
$1c:90d2  4b			phk
$1c:90d3  3b			tsc
$1c:90d4  fc 6a e0	  jsr ($e06a,x)
$1c:90d7  31 01		 and ($01),y
$1c:90d9  25 5e		 and $5e
$1c:90db  35 46		 and $46,x
$1c:90dd  8d 59 a3	  sta $a359
$1c:90e0  58			cli
$1c:90e1  10 78		 bpl $915b
$1c:90e3  d9 e3 54	  cmp $54e3,y
$1c:90e6  70 c8		 bvs $90b0
$1c:90e8  e0 21		 cpx #$21
$1c:90ea  d7 a6		 cmp [$a6],y
$1c:90ec  8b			phb
$1c:90ed  de dc e7	  dec $e7dc,x
$1c:90f0  86 8d		 stx $8d
$1c:90f2  61 e3		 adc ($e3,x)
$1c:90f4  57 68		 eor [$68],y
$1c:90f6  d7 d2		 cmp [$d2],y
$1c:90f8  35 77		 and $77,x
$1c:90fa  19 88 d0	  ora $d088,y
$1c:90fd  58			cli
$1c:90fe  22 c2 3b d5   jsl $d53bc2
$1c:9102  9a			txs
$1c:9103  f5 56		 sbc $56,x
$1c:9105  24 93		 bit $93
$1c:9107  fc 09 2b	  jsr ($2b09,x)
$1c:910a  b1 9d		 lda ($9d),y
$1c:910c  7c e7 5c	  jmp ($5ce7,x)
$1c:910f  19 d7 0b	  ora $0bd7,y
$1c:9112  21 c8		 and ($c8,x)
$1c:9114  88			dey
$1c:9115  69 cb e5	  adc #$e5cb
$1c:9118  50 31		 bvc $914b
$1c:911a  09 9c a5	  ora #$a59c
$1c:911d  d4 8b		 pei ($8b)
$1c:911f  75 22		 adc $22,x
$1c:9121  5d 58 b7	  eor $b758,x
$1c:9124  56 0e		 lsr $0e,x
$1c:9126  77 68		 adc [$68],y
$1c:9128  b7 5a		 lda [$5a],y
$1c:912a  16 e5		 asl $e5,x
$1c:912c  32 ad		 and ($ad)
$1c:912e  4c ab 6b	  jmp $6bab
$1c:9131  72 97		 adc ($97)
$1c:9133  56 a5		 lsr $a5,x
$1c:9135  d5 b8		 cmp $b8,x
$1c:9137  b6 c6		 ldx $c6,y
$1c:9139  2d f3 8b	  and $8bf3
$1c:913c  70 62		 bvs $91a0
$1c:913e  dc 29 34	  jml [$3429]
$1c:9141  ee cd 3b	  inc $3bcd
$1c:9144  4f 9c ae cd   eor $cdae9c
$1c:9148  2b			pld
$1c:9149  4f 94 ba a9   eor $a9ba94
$1c:914d  2e aa cb	  rol $cbaa
$1c:9150  ac 92 eb	  ldy $eb92
$1c:9153  2a			rol a
$1c:9154  c4 6b		 cpy $6b
$1c:9156  2b			pld
$1c:9157  51 b4		 eor ($b4),y
$1c:9159  ab			plb
$1c:915a  c5 74		 cmp $74
$1c:915c  0b			phd
$1c:915d  40			rti
$1c:915e  5f 06 de 5d   eor $5dde06,x
$1c:9162  b8			clv
$1c:9163  95 5c		 sta $5c,x
$1c:9165  19 68 c7	  ora $c768,y
$1c:9168  6d 53 68	  adc $6853
$1c:916b  72 96		 adc ($96)
$1c:916d  4c a5 a6	  jmp $a6a5
$1c:9170  31 81		 and ($81),y
$1c:9172  8c 60 13	  sty $1360
$1c:9175  e7 4b		 sbc [$4b]
$1c:9177  b3 52		 lda ($52,s),y
$1c:9179  e6 dc		 inc $dc
$1c:917b  4b			phk
$1c:917c  76 de		 ror $de,x
$1c:917e  6d b5 78	  adc $78b5
$1c:9181  84 0a		 sty $0a
$1c:9183  00 f7		 brk #$f7
$1c:9185  47 7b		 eor [$7b]
$1c:9187  46 a0		 lsr $a0
$1c:9189  31 a8		 and ($a8),y
$1c:918b  14 6a		 trb $6a
$1c:918d  3d 1a 8f	  and $8f1a,x
$1c:9190  c5 a3		 cmp $a3
$1c:9192  11 68		 ora ($68),y
$1c:9194  40			rti
$1c:9195  44 42 01	  mvp $01,$42
$1c:9198  04 8b		 tsb $8b
$1c:919a  41 62		 eor ($62,x)
$1c:919c  d1 48		 cmp ($48),y
$1c:919e  b4 56		 ldy $56,x
$1c:91a0  21 06		 and ($06,x)
$1c:91a2  88			dey
$1c:91a3  41 e2		 eor ($e2,x)
$1c:91a5  11 68		 ora ($68),y
$1c:91a7  84 5e		 sty $5e
$1c:91a9  a5 09		 lda $09
$1c:91ab  89 42 6a	  bit #$6a42
$1c:91ae  51 98		 eor ($98),y
$1c:91b0  94 66		 sty $66,x
$1c:91b2  6d c5 78	  adc $78c5
$1c:91b5  8b			phb
$1c:91b6  c0 5e		 cpy #$5e
$1c:91b8  ed 18 90	  sbc $9018
$1c:91bb  c6 24		 dec $24
$1c:91bd  4d f2 8d	  eor $8df2
$1c:91c0  43 e3		 eor $e3,s
$1c:91c2  50 e0		 bvc $91a4
$1c:91c4  68			pla
$1c:91c5  02 c6		 cop #$c6
$1c:91c7  71 1a		 adc ($1a),y
$1c:91c9  9c 94 46	  stz $4694
$1c:91cc  71 4a		 adc ($4a),y
$1c:91ce  f6 42		 inc $42,x
$1c:91d0  bd 94 af	  lda $af94,x
$1c:91d3  6c 2b db	  jmp ($db2b)
$1c:91d6  18			clc
$1c:91d7  83 46		 sta $46,s
$1c:91d9  20 e1 00	  jsr $00e1
$1c:91dc  8c 45 e2	  sty $e245
$1c:91df  11 18		 ora ($18),y
$1c:91e1  84 48		 sty $48
$1c:91e3  d2 31		 cmp ($31)
$1c:91e5  17 99		 ora [$99],y
$1c:91e7  0b			phd
$1c:91e8  c9 ee d3	  cmp #$d3ee
$1c:91eb  2d bd cb	  and $cbbd
$1c:91ee  6e 7f 26	  ror $267f
$1c:91f1  38			sec
$1c:91f2  3c 41 0e	  bit $0e41,x
$1c:91f5  44 f3 94	  mvp $94,$f3
$1c:91f8  13 c4		 ora ($c4,s),y
$1c:91fa  a0 92		 ldy #$92
$1c:91fc  89 a7 ee	  bit #$eea7
$1c:91ff  69 fc 9a	  adc #$9afc
$1c:9202  6d 26 9b	  adc $9b26
$1c:9205  68			pla
$1c:9206  a7 c1		 lda [$c1]
$1c:9208  4e 90 4f	  lsr $4f90
$1c:920b  ed 13 fb	  sbc $fb13
$1c:920e  84 fe		 sty $fe
$1c:9210  f1 3f		 sbc ($3f),y
$1c:9212  b1 8f		 lda ($8f),y
$1c:9214  f5 63		 sbc $63,x
$1c:9216  fd 98 ff	  sbc $ff98,x
$1c:9219  76 3f		 ror $3f,x
$1c:921b  d1 48		 cmp ($48),y
$1c:921d  02 fd		 cop #$fd
$1c:921f  20 df 7a	  jsr $7adf
$1c:9222  37 de		 and [$de],y
$1c:9224  0d f8 a3	  ora $a3f8
$1c:9227  7e 20 df	  ror $df20,x
$1c:922a  9a			txs
$1c:922b  37 e6		 and [$e6],y
$1c:922d  0d fa a3	  ora $a3fa
$1c:9230  7e a3 58	  ror $58a3,x
$1c:9233  66 b8		 ror $b8
$1c:9235  dd a3 57	  cmp $57a3,x
$1c:9238  76 e8		 ror $e8,x
$1c:923a  b7 01		 lda [$01],y
$1c:923c  b8			clv
$1c:923d  8d a3 03	  sta $03a3
$1c:9240  04 00		 tsb $00
$1c:9242  0c c0 50	  tsb $50c0
$1c:9245  1e 09 48	  asl $4809,x
$1c:9248  a4 50		 ldy $50
$1c:924a  68			pla
$1c:924b  15 0b		 ora $0b,x
$1c:924d  75 be		 adc $be,x
$1c:924f  a1 53		 lda ($53,x)
$1c:9251  c0 3d		 cpy #$3d
$1c:9253  c0 02		 cpy #$02
$1c:9255  34 2a		 bit $2a,x
$1c:9257  95 4a		 sta $4a,x
$1c:9259  92 f8		 sta ($f8)
$1c:925b  07 e0		 ora [$e0]
$1c:925d  50 28		 bvc $9287
$1c:925f  6f f0 03 80   adc $8003f0
$1c:9263  1c 29 5e	  trb $5e29
$1c:9266  1b			tcs
$1c:9267  c5 44		 cmp $44
$1c:9269  10 0f		 bpl $927a
$1c:926b  c0 a1		 cpy #$a1
$1c:926d  03 c2		 ora $c2,s
$1c:926f  a9 e8 f0	  lda #$f0e8
$1c:9272  40			rti
$1c:9273  63 70		 adc $70,s
$1c:9275  11 30		 ora ($30),y
$1c:9277  78			sei
$1c:9278  66 94		 ror $94
$1c:927a  7c 76 3e	  jmp ($3e76,x)
$1c:927d  9f 43 a2 7a   sta $7aa243,x
$1c:9281  7d be 11	  adc $11be,x
$1c:9284  30 c0		 bmi $9246
$1c:9286  7c 1e 89	  jmp ($891e,x)
$1c:9289  7c 6a 51	  jmp ($516a,x)
$1c:928c  31 89		 and ($89),y
$1c:928e  0b			phd
$1c:928f  c2 03		 rep #$03
$1c:9291  e9 13 0c	  sbc #$0c13
$1c:9294  fb			xce
$1c:9295  d0 37		 bne $92ce
$1c:9297  08			php
$1c:9298  28			plp
$1c:9299  ec 84 00	  cpx $0084
$1c:929c  34 31		 bit $31,x
$1c:929e  30 8e		 bmi $922e
$1c:92a0  52 89		 eor ($89)
$1c:92a2  79 2a 90	  adc $902a,y
$1c:92a5  98			tya
$1c:92a6  44 a1 34	  mvp $34,$a1
$1c:92a9  2d 9c f8	  and $f89c
$1c:92ac  c8			iny
$1c:92ad  92 09		 sta ($09)
$1c:92af  e4 06		 cpx $06
$1c:92b1  16 5b		 asl $5b,x
$1c:92b3  33 0a		 and ($0a,s),y
$1c:92b5  c7 22		 cmp [$22]
$1c:92b7  33 f8		 and ($f8,s),y
$1c:92b9  8c 5c b8	  sty $b85c
$1c:92bc  46 62		 lsr $62
$1c:92be  13 04		 ora ($04,s),y
$1c:92c0  d2 49		 cmp ($49)
$1c:92c2  19 9f c6	  ora $c69f,y
$1c:92c5  63 e3		 adc $e3,s
$1c:92c7  c1 a5		 cmp ($a5,x)
$1c:92c9  d3 06		 cmp ($06,s),y
$1c:92cb  84 39		 sty $39
$1c:92cd  1f ac a6 50   ora $50a6ac,x
$1c:92d1  a9 02 6b	  lda #$6b02
$1c:92d4  92 83		 sta ($83)
$1c:92d6  eb			xba
$1c:92d7  33 95		 and ($95,s),y
$1c:92d9  4a			lsr a
$1c:92da  e5 53		 sbc $53
$1c:92dc  92 f3		 sta ($f3)
$1c:92de  1a			inc a
$1c:92df  8a			txa
$1c:92e0  29 13 65	  and #$6513
$1c:92e3  84 9a		 sty $9a
$1c:92e5  89 e8 19	  bit #$19e8
$1c:92e8  8f 87 d0 6a   sta $6ad087
$1c:92ec  38			sec
$1c:92ed  44 f6 6f	  mvp $6f,$f6
$1c:92f0  02 3f		 cop #$3f
$1c:92f2  a8			tay
$1c:92f3  e8			inx
$1c:92f4  e0 93		 cpx #$93
$1c:92f6  e1 c0		 sbc ($c0,x)
$1c:92f8  50 1d		 bvc $9317
$1c:92fa  e3 41		 sbc $41,s
$1c:92fc  05 03		 ora $03
$1c:92fe  c8			iny
$1c:92ff  28			plp
$1c:9300  14 8a		 trb $8a
$1c:9302  83 d4		 sta $d4,s
$1c:9304  df e1 42 a4   cmp $a442e1,x
$1c:9308  bd 40 04	  lda $0440,x
$1c:930b  0f 41 02 95   ora $950241
$1c:930f  48			pha
$1c:9310  1e 14 aa	  asl $aa14,x
$1c:9313  8d 26 84	  sta $8426
$1c:9316  12 0a		 ora ($0a)
$1c:9318  90 1c		 bcc $9336
$1c:931a  28			plp
$1c:931b  55 ea		 eor $ea,x
$1c:931d  3d 6e 08	  and $086e,x
$1c:9320  45 05		 eor $05
$1c:9322  90 54		 bcc $9378
$1c:9324  69 4b 21	  adc #$214b
$1c:9327  0b			phd
$1c:9328  85 28		 sta $28
$1c:932a  94 12		 sty $12,x
$1c:932c  a9 77 a1	  lda #$a177
$1c:932f  82 24 70	  brl $0356
$1c:9332  31 1c		 and ($1c),y
$1c:9334  fa			plx
$1c:9335  5f 27 89 cd   eor $cd8927,x
$1c:9339  7d 26 80	  adc $8026,x
$1c:933c  f0 fb		 beq $9339
$1c:933e  58			cli
$1c:933f  20 92 2f	  jsr $2f92
$1c:9342  4c 06 05	  jmp $0506
$1c:9345  37 0f		 and [$0f],y
$1c:9347  82 c8 5a	  brl $ee12
$1c:934a  22 51 2f 4b   jsl $4b2f51
$1c:934e  44 65 c3	  mvp $c3,$65
$1c:9351  53 49		 eor ($49,s),y
$1c:9353  0c 82 79	  tsb $7982
$1c:9356  36 80		 rol $80,x
$1c:9358  cf 27 90 39   cmp $399027
$1c:935c  a9 68 0a	  lda #$0a68
$1c:935f  29 1c 88	  and #$881c
$1c:9362  c4 27		 cpy $27
$1c:9364  f1 03		 sbc ($03),y
$1c:9366  c8			iny
$1c:9367  4d 46 80	  eor $8046
$1c:936a  47 01		 eor [$01]
$1c:936c  08			php
$1c:936d  29 42 49	  and #$4942
$1c:9370  19 8c 4f	  ora $4f8c,y
$1c:9373  e3 08		 sbc $08,s
$1c:9375  90 97		 bcc $930e
$1c:9377  1c 49 66	  trb $6649
$1c:937a  2c 60 fa	  bit $fa60
$1c:937d  fd 65 32	  sbc $3265,x
$1c:9380  84 d8		 sty $d8
$1c:9382  41 0e		 eor ($0e,x)
$1c:9384  22 47 21 60   jsl $602147
$1c:9388  4a			lsr a
$1c:9389  66 52		 ror $52
$1c:938b  b9 52 ac	  lda $ac52,y
$1c:938e  0b			phd
$1c:938f  e8			inx
$1c:9390  d3 07		 cmp ($07,s),y
$1c:9392  30 4a		 bmi $93de
$1c:9394  66 11		 ror $11
$1c:9396  48			pha
$1c:9397  9a			txs
$1c:9398  f0 26		 beq $93c0
$1c:939a  a6 04		 ldx $04
$1c:939c  f0 a9		 beq $9347
$1c:939e  c6 61		 dec $61
$1c:93a0  12 84		 ora ($84)
$1c:93a2  4f 7e 84 72   eor $72847e
$1c:93a6  49 a3 24	  eor #$24a3
$1c:93a9  4f e2 62 42   eor $4262e2
$1c:93ad  d8			cld
$1c:93ae  35 ce		 and $ce,x
$1c:93b0  5c 31 00 50   jml $500031
$1c:93b4  3b			tsc
$1c:93b5  c6 91		 dec $91
$1c:93b7  50 a4		 bvc $935d
$1c:93b9  3c cd e2	  bit $e2cd,x
$1c:93bc  18			clc
$1c:93bd  1a			inc a
$1c:93be  43 fc		 eor $fc,s
$1c:93c0  a8			tay
$1c:93c1  34 0a		 bit $0a,x
$1c:93c3  08			php
$1c:93c4  0c e9 18	  tsb $18e9
$1c:93c7  1a			inc a
$1c:93c8  35 6c		 and $6c,x
$1c:93ca  1e 54 9a	  asl $9a54,x
$1c:93cd  45 08		 eor $08
$1c:93cf  26 60		 rol $60
$1c:93d1  d0 a3		 bne $9376
$1c:93d3  2a			rol a
$1c:93d4  c2 76		 rep #$76
$1c:93d6  9c 0b 45	  stz $450b
$1c:93d9  6e d2 23	  ror $23d2
$1c:93dc  29 8d 74	  and #$748d
$1c:93df  3a			dec a
$1c:93e0  0b			phd
$1c:93e1  d0 8a		 bne $936d
$1c:93e3  a7 04		 lda [$04]
$1c:93e5  66 82		 ror $82
$1c:93e7  b2 9e		 lda ($9e)
$1c:93e9  c2 63		 rep #$63
$1c:93eb  43 27		 eor $27,s
$1c:93ed  96 5b		 stx $5b,y
$1c:93ef  6a			ror a
$1c:93f0  d4 66		 pei ($66)
$1c:93f2  30 8c		 bmi $9380
$1c:93f4  9d 72 02	  sta $0272,x
$1c:93f7  c0 9b 42	  cpy #$429b
$1c:93fa  ca			dex
$1c:93fb  39 11 88	  and $8811,y
$1c:93fe  45 ca		 eor $ca
$1c:9400  57 19		 eor [$19],y
$1c:9402  8c 47 d3	  sty $d347
$1c:9405  47 29		 eor [$29]
$1c:9407  fe a6 c4	  inc $c4a6,x
$1c:940a  96 25		 stx $25,y
$1c:940c  37 1b		 and [$1b],y
$1c:940e  28			plp
$1c:940f  7c c6 4a	  jmp ($4ac6,x)
$1c:9412  82 01 d8	  brl $6c16
$1c:9415  0b			phd
$1c:9416  ea			nop
$1c:9417  53 29		 eor ($29,s),y
$1c:9419  9c d7 66	  stz $66d7
$1c:941c  e4 09		 cpx $09
$1c:941e  2d 85 96	  and $9685
$1c:9421  9d e0 97	  sta $97e0,x
$1c:9424  94 72		 sty $72,x
$1c:9426  03 34		 ora $34,s
$1c:9428  28			plp
$1c:9429  e5 13		 sbc $13
$1c:942b  c3 01		 cmp $01,s
$1c:942d  78			sei
$1c:942e  8f 85 c0 33   sta $33c085
$1c:9432  18			clc
$1c:9433  94 d7		 sty $d7,x
$1c:9435  c1 01		 cmp ($01,x)
$1c:9437  fe d2 e9	  inc $e9d2,x
$1c:943a  8f c0 80 c6   sta $c680c0
$1c:943e  e0 25 01	  cpx #$0125
$1c:9441  7c 84 b9	  jmp ($b984,x)
$1c:9444  e0 34 3a	  cpx #$3a34
$1c:9447  23 c4		 and $c4,s
$1c:9449  9b			txy
$1c:944a  e4 f9		 cpx $f9
$1c:944c  08			php
$1c:944d  23 c4		 and $c4,s
$1c:944f  41 e0		 eor ($e0,x)
$1c:9451  04 00		 tsb $00
$1c:9453  9b			txy
$1c:9454  4d 40 43	  eor $4340
$1c:9457  43 7f		 eor $7f,s
$1c:9459  84 f9		 sty $f9
$1c:945b  e2 2d		 sep #$2d
$1c:945d  01 7c		 ora ($7c,x)
$1c:945f  8f a4 1a 22   sta $221aa4
$1c:9463  f1 f0		 sbc ($f0),y
$1c:9465  fa			plx
$1c:9466  7c 00 66	  jmp ($6600,x)
$1c:9469  9f 0f c0 1e   sta $1ec00f,x
$1c:946d  17 f7		 ora [$f7],y
$1c:946f  a2 86 cc	  ldx #$cc86
$1c:9472  7e 5e 8f	  ror $8f5e,x
$1c:9475  48			pha
$1c:9476  d9 3c 20	  cmp $203c,y
$1c:9479  40			rti
$1c:947a  27 88		 and [$88]
$1c:947c  bc 42 a9	  ldy $a942,x
$1c:947f  2e 00 89	  rol $8900
$1c:9482  bc 81 e2	  ldy $e281,x
$1c:9485  06 37		 asl $37
$1c:9487  d8			cld
$1c:9488  78			sei
$1c:9489  7c 27 f5	  jmp ($f527,x)
$1c:948c  7b			tdc
$1c:948d  1c 2a 6d	  trb $6d2a
$1c:9490  03 9e		 ora $9e,s
$1c:9492  1b			tcs
$1c:9493  ca			dex
$1c:9494  a7 54		 lda [$54]
$1c:9496  32 9c		 and ($9c)
$1c:9498  5a			phy
$1c:9499  23 10		 and $10,s
$1c:949b  55 82		 eor $82,x
$1c:949d  00 c0		 brk #$c0
$1c:949f  80 e0		 bra $9481
$1c:94a1  19 6c 7a	  ora $7a6c,y
$1c:94a4  33 18		 and ($18,s),y
$1c:94a6  5d 82 80	  eor $8082,x
$1c:94a9  de 20 86	  dec $8620,x
$1c:94ac  17 1a		 ora [$1a],y
$1c:94ae  28			plp
$1c:94af  4a			lsr a
$1c:94b0  f3 01		 sbc ($01,s),y
$1c:94b2  32 8c		 and ($8c)
$1c:94b4  aa			tax
$1c:94b5  56 d8		 lsr $d8,x
$1c:94b7  32 80		 and ($80)
$1c:94b9  8c 86 37	  sty $3786
$1c:94bc  34 93		 bit $93,x
$1c:94be  c4 dd		 cpy $dd
$1c:94c0  08			php
$1c:94c1  11 30		 ora ($30),y
$1c:94c3  60			rts
$1c:94c4  78			sei
$1c:94c5  50 c1		 bvc $9488
$1c:94c7  29 98		 and #$98
$1c:94c9  06 8d		 asl $8d
$1c:94cb  fa			plx
$1c:94cc  9e 05 30	  stz $3005,x
$1c:94cf  3e 46 6b	  rol $6b46,x
$1c:94d2  e8			inx
$1c:94d3  7e a1 b4	  ror $b4a1,x
$1c:94d6  16 a2		 asl $a2,x
$1c:94d8  f9 22 20	  sbc $2022,y
$1c:94db  3f 58 2e 72   and $722e58,x
$1c:94df  e9 05		 sbc #$05
$1c:94e1  f8			sed
$1c:94e2  22 84 d0 7b   jsl $7bd084
$1c:94e6  9d 9a 39	  sta $399a,x
$1c:94e9  f3 00		 sbc ($00,s),y
$1c:94eb  29 94		 and #$94
$1c:94ed  5f 23 86 92   eor $928623,x
$1c:94f1  7d df ec	  adc $ecdf,x
$1c:94f4  f7 39		 sbc [$39],y
$1c:94f6  af 63 b6 10   lda $10b663
$1c:94fa  51 32		 eor ($32),y
$1c:94fc  fa			plx
$1c:94fd  60			rts
$1c:94fe  4f d4 f0 81   eor $81f0d4
$1c:9502  97 c1		 sta [$c1],y
$1c:9504  e8			inx
$1c:9505  f4 c0 7f	  pea $7fc0
$1c:9508  a7 41		 lda [$41]
$1c:950a  6a			ror a
$1c:950b  03 dd		 ora $dd,s
$1c:950d  a6 d0		 ldx $d0
$1c:950f  39 e4 f2	  and $f2e4,y
$1c:9512  07 36		 ora [$36]
$1c:9514  48			pha
$1c:9515  84 2c		 sty $2c
$1c:9517  f0 90		 beq $94a9
$1c:9519  18			clc
$1c:951a  8c 41 3e	  sty $3e41
$1c:951d  b1 71		 lda ($71),y
$1c:951f  49 03		 eor #$03
$1c:9521  42 33		 wdm #$33
$1c:9523  18			clc
$1c:9524  57 ac		 eor [$ac],y
$1c:9526  7c 12 4f	  jmp ($4f12,x)
$1c:9529  40			rti
$1c:952a  94 ca		 sty $ca,x
$1c:952c  17 ee		 ora [$ee],y
$1c:952e  8a			txa
$1c:952f  39 5c a9	  and $a95c,y
$1c:9532  9e 73 a9	  stz $a973,x
$1c:9535  4c ca 57	  jmp $57ca
$1c:9538  38			sec
$1c:9539  15 87		 ora $87,x
$1c:953b  83 c1		 sta $c1,s
$1c:953d  13 6f		 ora ($6f,s),y
$1c:953f  a4 54		 ldy $54
$1c:9541  72 11		 adc ($11)
$1c:9543  48			pha
$1c:9544  9c 98 18	  stz $1898
$1c:9547  43 70		 eor $70,s
$1c:9549  68			pla
$1c:954a  33 20		 and ($20,s),y
$1c:954c  6b			rtl
$1c:954d  b4 68		 ldy $68,x
$1c:954f  0c be 4e	  tsb $4ebe
$1c:9552  e0 66 00	  cpx #$0066
$1c:9555  4b			phk
$1c:9556  2d b5 64	  and $64b5
$1c:9559  28			plp
$1c:955a  4f 66 f3 d8   eor $d8f366
$1c:955e  10 44		 bpl $95a4
$1c:9560  21 23		 and ($23,x)
$1c:9562  80 60		 bra $95c4
$1c:9564  0c c6 bb	  tsb $bbc6
$1c:9567  21 2a		 and ($2a,x)
$1c:9569  83 b4		 sta $b4,s
$1c:956b  67 de		 adc [$de]
$1c:956d  83 38		 sta $38,s
$1c:956f  86 8e		 stx $8e
$1c:9571  3b			tsc
$1c:9572  6c 5e 81	  jmp ($815e)
$1c:9575  50 7d		 bvc $95f4
$1c:9577  05 70		 ora $70
$1c:9579  67 94		 adc [$94]
$1c:957b  e6 bb		 inc $bb
$1c:957d  da			phx
$1c:957e  46 09		 lsr $09
$1c:9580  8c 3d 07	  sty $073d
$1c:9583  60			rts
$1c:9584  00 a5		 brk #$a5
$1c:9586  7f b2 6f 33   adc $336fb2,x
$1c:958a  f8			sed
$1c:958b  46 c2		 lsr $c2
$1c:958d  42 12		 wdm #$12
$1c:958f  0b			phd
$1c:9590  ad 14 a0	  lda $a014
$1c:9593  62 31 f0	  per $85c7
$1c:9596  7a			ply
$1c:9597  50 61		 bvc $95fa
$1c:9599  e8			inx
$1c:959a  f0 dc		 beq $9578
$1c:959c  8b			phb
$1c:959d  cc ad 07	  cpy $07ad
$1c:95a0  68			pla
$1c:95a1  a7 40		 lda [$40]
$1c:95a3  da			phx
$1c:95a4  04 30		 tsb $30
$1c:95a6  31 91		 and ($91),y
$1c:95a8  04 8a		 tsb $8a
$1c:95aa  05 7a		 ora $7a
$1c:95ac  2f 1a 10 4a   and $4a101a
$1c:95b0  04 43		 tsb $43
$1c:95b2  0b			phd
$1c:95b3  9d 36 9c	  sta $9c36,x
$1c:95b6  41 24		 eor ($24,x)
$1c:95b8  20 21 d2	  jsr $d221
$1c:95bb  03 70		 ora $70,s
$1c:95bd  aa			tax
$1c:95be  83 81		 sta $81,s
$1c:95c0  22 e4 11 4e   jsl $4e11e4
$1c:95c4  1a			inc a
$1c:95c5  4a			lsr a
$1c:95c6  3c 2a c3	  bit $c32a,x
$1c:95c9  42 39		 wdm #$39
$1c:95cb  9c 0f 82	  stz $820f
$1c:95ce  42 1f		 wdm #$1f
$1c:95d0  00 c4		 brk #$c4
$1c:95d2  06 21		 asl $21
$1c:95d4  e9 f4		 sbc #$f4
$1c:95d6  39 c1 16	  and $16c1,y
$1c:95d9  54 3a 1d	  mvn $1d,$3a
$1c:95dc  11 c8		 ora ($c8),y
$1c:95de  23 40		 and $40,s
$1c:95e0  9b			txy
$1c:95e1  fd 3e 81	  sbc $813e,x
$1c:95e4  10 0a		 bpl $95f0
$1c:95e6  0b			phd
$1c:95e7  bc 4a a0	  ldy $a04a,x
$1c:95ea  50 11		 bvc $95fd
$1c:95ec  88			dey
$1c:95ed  c6 dd		 dec $dd
$1c:95ef  23 e1		 and $e1,s
$1c:95f1  77 92		 adc [$92],y
$1c:95f3  cd 8f 60	  cmp $608f
$1c:95f6  43 0a		 eor $0a,s
$1c:95f8  1d 4e a8	  ora $a84e,x
$1c:95fb  85 62		 sta $62
$1c:95fd  81 bc		 sta ($bc,x)
$1c:95ff  02 f2		 cop #$f2
$1c:9601  61 42		 adc ($42,x)
$1c:9603  fa			plx
$1c:9604  88			dey
$1c:9605  09 28		 ora #$28
$1c:9607  c7 12		 cmp [$12]
$1c:9609  18			clc
$1c:960a  08			php
$1c:960b  91 ff		 sta ($ff),y
$1c:960d  a4 c2		 ldy $c2
$1c:960f  3a			dec a
$1c:9610  87 a4		 sta [$a4]
$1c:9612  f6 02		 inc $02,x
$1c:9614  28			plp
$1c:9615  78			sei
$1c:9616  84 fb		 sty $fb
$1c:9618  c3 ed		 cmp $ed,s
$1c:961a  f4 35 11	  pea $1135
$1c:961d  70 54		 bvs $9673
$1c:961f  4b			phk
$1c:9620  88			dey
$1c:9621  58			cli
$1c:9622  00 46		 brk #$46
$1c:9624  47 5a		 eor [$5a]
$1c:9626  5d 30 4b	  eor $4b30,x
$1c:9629  0c 72 a1	  tsb $a172
$1c:962c  a3 c2		 lda $c2,s
$1c:962e  ed 76 9f	  sbc $9f76
$1c:9631  28			plp
$1c:9632  82 ed 7f	  brl $1622
$1c:9635  14 ad		 trb $ad
$1c:9637  0f 07 58 59   ora $595807
$1c:963b  1d 69 4a	  ora $4a69,x
$1c:963e  2a			rol a
$1c:963f  51 58		 eor ($58),y
$1c:9641  06 12		 asl $12
$1c:9643  c0 c2 3b	  cpy #$3bc2
$1c:9646  12 c9		 ora ($c9)
$1c:9648  18			clc
$1c:9649  0c d1 66	  tsb $66d1
$1c:964c  86 d8		 stx $d8
$1c:964e  27 b3		 and [$b3]
$1c:9650  d8			cld
$1c:9651  13 bc		 ora ($bc,s),y
$1c:9653  26 f0		 rol $f0
$1c:9655  98			tya
$1c:9656  d4 a6		 pei ($a6)
$1c:9658  61 12		 adc ($12,x)
$1c:965a  84 4f		 sty $4f
$1c:965c  7c 21 91	  jmp ($9121,x)
$1c:965f  24 97		 bit $97
$1c:9661  a2 68 f6	  ldx #$f668
$1c:9664  29 77		 and #$77
$1c:9666  a0 c6 1e	  ldy #$1ec6
$1c:9669  84 08		 sty $08
$1c:966b  8d c3 c1	  sta $c1c3
$1c:966e  2f 7b 14 d7   and $d7147b
$1c:9672  fa			plx
$1c:9673  fc 07 e0	  jsr ($e007,x)
$1c:9676  83 4a		 sta $4a,s
$1c:9678  0a			asl a
$1c:9679  f6 28		 inc $28,x
$1c:967b  54 0e 6d	  mvn $6d,$0e
$1c:967e  3c 9b 12	  bit $129b,x
$1c:9681  50 0a		 bvc $968d
$1c:9683  51 68		 eor ($68),y
$1c:9685  8c 40 74	  sty $7440
$1c:9688  27 73		 and [$73]
$1c:968a  f4 85 46	  pea $4685
$1c:968d  59 1e 8c	  eor $8c1e,y
$1c:9690  c6 09		 dec $09
$1c:9692  42 79		 wdm #$79
$1c:9694  40			rti
$1c:9695  28			plp
$1c:9696  ca			dex
$1c:9697  0a			asl a
$1c:9698  e8			inx
$1c:9699  88			dey
$1c:969a  40			rti
$1c:969b  28			plp
$1c:969c  4a			lsr a
$1c:969d  e5 46		 sbc $46
$1c:969f  74 4b		 stz $4b,x
$1c:96a1  1f a2 0b 27   ora $270ba2,x
$1c:96a5  89 9d		 bit #$9d
$1c:96a7  d5 fa		 cmp $fa,x
$1c:96a9  3e 90 e8	  rol $e890,x
$1c:96ac  78			sei
$1c:96ad  26 ef		 rol $ef
$1c:96af  10 fa		 bpl $96ab
$1c:96b1  22 43 0e f4   jsl $f40e43
$1c:96b5  0f 04 fb d1   ora $d1fb04
$1c:96b9  77 53		 adc [$53],y
$1c:96bb  8a			txa
$1c:96bc  44 6b 2b	  mvp $2b,$6b
$1c:96bf  61 bf		 adc ($bf,x)
$1c:96c1  cb			wai
$1c:96c2  d0 41		 bne $9705
$1c:96c4  77 4c		 adc [$4c],y
$1c:96c6  82 e0 53	  brl $eaa9
$1c:96c9  21 61		 and ($61,x)
$1c:96cb  63 0d		 adc $0d,s
$1c:96cd  6a			ror a
$1c:96ce  fa			plx
$1c:96cf  a5 15		 lda $15
$1c:96d1  48			pha
$1c:96d2  58			cli
$1c:96d3  b0 b8		 bcs $968d
$1c:96d5  55 48		 eor $48,x
$1c:96d7  b6 09		 ldx $09,y
$1c:96d9  34 0a		 bit $0a,x
$1c:96db  82 b0 7d	  brl $148e
$1c:96de  fe ee 0c	  inc $0cee,x
$1c:96e1  fb			xce
$1c:96e2  7d 98 f8	  adc $f898,x
$1c:96e5  c7 88		 cmp [$88]
$1c:96e7  dc 80 58	  jml [$5880]
$1c:96ea  02 b1		 cop #$b1
$1c:96ec  81 cf		 sta ($cf,x)
$1c:96ee  20 33 69	  jsr $6933
$1c:96f1  0c 06 f7	  tsb $f706
$1c:96f4  4d a3 40	  eor $40a3
$1c:96f7  63 83		 adc $83,s
$1c:96f9  a3 1d		 lda $1d,s
$1c:96fb  84 fe		 sty $fe
$1c:96fd  23 1d		 and $1d,s
$1c:96ff  ba			tsx
$1c:9700  53 69		 eor ($69,s),y
$1c:9702  d4 69		 pei ($69)
$1c:9704  7c 90 94	  jmp ($9490,x)
$1c:9707  64 b0		 stz $b0
$1c:9709  9f c6 64 b7   sta $b764c6,x
$1c:970d  ca			dex
$1c:970e  2d 1a 8d	  and $8d1a
$1c:9711  0b			phd
$1c:9712  2b			pld
$1c:9713  3c c6 24	  bit $24c6,x
$1c:9716  1b			tcs
$1c:9717  28			plp
$1c:9718  84 5c		 sty $5c
$1c:971a  ae b3 29	  ldx $29b3
$1c:971d  cc 4a ae	  cpy $ae4a
$1c:9720  0d 0a 34	  ora $340a
$1c:9723  62 3e 57	  per $ee64
$1c:9726  59 85 94	  eor $9485,y
$1c:9729  78			sei
$1c:972a  21 d0		 and ($d0,x)
$1c:972c  10 b1		 bpl $96df
$1c:972e  1c 2b a4	  trb $a42b
$1c:9731  b2 a3		 lda ($a3)
$1c:9733  4e ca 1b	  lsr $1bca
$1c:9736  15 28		 ora $28,x
$1c:9738  34 a2		 bit $a2,x
$1c:973a  db			stp
$1c:973b  56 25		 lsr $25,x
$1c:973d  94 68		 sty $68,x
$1c:973f  e0 f3 12	  cpx #$12f3
$1c:9742  c9 9f		 cmp #$9f
$1c:9744  d2 67		 cmp ($67)
$1c:9746  2a			rol a
$1c:9747  95 ca		 sta $ca,x
$1c:9749  a7 28		 lda [$28]
$1c:974b  a4 9d		 ldy $9d
$1c:974d  24 ca		 bit $ca
$1c:974f  d5 63		 cmp $63,x
$1c:9751  53 0e		 eor ($0e,s),y
$1c:9753  08			php
$1c:9754  96 56		 stx $56,y
$1c:9756  7b			tdc
$1c:9757  5a			phy
$1c:9758  5c 14 a1 61   jml $61a114
$1c:975c  6f 1a a8 ac   adc $aca81a
$1c:9760  16 25		 asl $25,x
$1c:9762  30 2d		 bmi $9791
$1c:9764  51 70		 eor ($70),y
$1c:9766  8e 0c 5d	  stx $5d0c
$1c:9769  83 3f		 sta $3f,s
$1c:976b  17 41		 ora [$41],y
$1c:976d  00 77		 brk #$77
$1c:976f  f8			sed
$1c:9770  03 c2		 ora $c2,s
$1c:9772  3e 22 f1	  rol $f122,x
$1c:9775  9f 91 3c ab   sta $ab3c91,x
$1c:9779  e6 6f		 inc $6f
$1c:977b  3b			tsc
$1c:977c  fa			plx
$1c:977d  23 d3		 and $d3,s
$1c:977f  3e aa f5	  rol $f5aa,x
$1c:9782  df b3 3d bb   cmp $bb3db3,x
$1c:9786  ee ee 9e	  inc $9eee
$1c:9789  48			pha
$1c:978a  60			rts
$1c:978b  30 19		 bmi $97a6
$1c:978d  04 f2		 tsb $f2
$1c:978f  03 0b		 ora $0b,s
$1c:9791  77 34		 adc [$34],y
$1c:9793  42 3b		 wdm #$3b
$1c:9795  01 f0		 ora ($f0,x)
$1c:9797  47 22		 eor [$22]
$1c:9799  33 f8		 and ($f8,s),y
$1c:979b  8b			phb
$1c:979c  b9 a3 12	  lda $12a3,y
$1c:979f  59 74 16	  eor $1674,y
$1c:97a2  49 19		 eor #$19
$1c:97a4  9f c6 5d cd   sta $cd5dc6,x
$1c:97a8  31 89		 and ($89),y
$1c:97aa  41 25		 eor ($25,x)
$1c:97ac  f1 a9		 sbc ($a9),y
$1c:97ae  44 a6 50	  mvp $50,$a6
$1c:97b1  ee 69 c8	  inc $c869
$1c:97b4  c0 20 b1	  cpy #$b120
$1c:97b7  a9 54		 lda #$54
$1c:97b9  ec 6c f1	  cpx $f16c
$1c:97bc  39 30 84	  and $8430,y
$1c:97bf  24 f1		 bit $f1
$1c:97c1  38			sec
$1c:97c2  ac a5 dc	  ldy $dca5
$1c:97c5  d3 d8		 cmp ($d8,s),y
$1c:97c7  10 04		 bpl $97cd
$1c:97c9  27 b0		 and [$b0]
$1c:97cb  98			tya
$1c:97cc  d1 59		 cmp ($59),y
$1c:97ce  cd de 7f	  cmp $7fde
$1c:97d1  f4 87 a8	  pea $a887
$1c:97d4  7d 65 ec	  adc $ec65,x
$1c:97d7  3f 6a 7b 79   and $797b6a,x
$1c:97db  e6 11		 inc $11
$1c:97dd  28			plp
$1c:97de  54 06 6d	  mvn $6d,$06
$1c:97e1  21 80		 and ($80,x)
$1c:97e3  cd 0c ad	  cmp $ad0c
$1c:97e6  30 8b		 bmi $9773
$1c:97e8  05 06		 ora $06
$1c:97ea  3b			tsc
$1c:97eb  e8			inx
$1c:97ec  19 03 e1	  ora $e103,y
$1c:97ef  a3 c2		 lda $c2,s
$1c:97f1  41 92		 eor ($92,x)
$1c:97f3  cd 48 40	  cmp $4048
$1c:97f6  56 51		 lsr $51,x
$1c:97f8  a0 ca 66	  ldy #$66ca
$1c:97fb  31 29		 and ($29),y
$1c:97fd  73 d9		 adc ($d9,s),y
$1c:97ff  e5 52		 sbc $52
$1c:9801  b1 78		 lda ($78),y
$1c:9803  4e 62 50	  lsr $5062
$1c:9806  40			rti
$1c:9807  33 c4		 and ($c4,s),y
$1c:9809  c7 e5		 cmp [$e5]
$1c:980b  26 0a		 rol $0a
$1c:980d  c4 f7		 cpy $f7
$1c:980f  e8			inx
$1c:9810  50 0c		 bvc $981e
$1c:9812  3c dd eb	  bit $ebdd,x
$1c:9815  17 6a		 ora [$6a],y
$1c:9817  cd 62 b1	  cmp $b162
$1c:981a  5a			phy
$1c:981b  bf f8 40 cf   lda $cf40f8,x
$1c:981f  58			cli
$1c:9820  b0 d8		 bcs $97fa
$1c:9822  2c 16 2a	  bit $2a16
$1c:9825  d5 da		 cmp $da,x
$1c:9827  fb			xce
$1c:9828  1a			inc a
$1c:9829  9d b7 90	  sta $90b7,x
$1c:982c  e2 07		 sep #$07
$1c:982e  f2 30		 sbc ($30)
$1c:9830  85 9e		 sta $9e
$1c:9832  d6 79		 dec $79,x
$1c:9834  a3 f8		 lda $f8,s
$1c:9836  d8			cld
$1c:9837  9b			txy
$1c:9838  de a9 f5	  dec $f5a9,x
$1c:983b  d7 b2		 cmp [$b2],y
$1c:983d  fd b9 f0	  sbc $f0b9,x
$1c:9840  00 00		 brk #$00
$1c:9842  08			php
$1c:9843  81 40		 sta ($40,x)
$1c:9845  1d e9 1c	  ora $1ce9,x
$1c:9848  c0 3d df	  cpy #$df3d
$1c:984b  02 f7		 cop #$f7
$1c:984d  1e ed 0a	  asl $0aed,x
$1c:9850  01 5e		 ora ($5e,x)
$1c:9852  d4 01		 pei ($01)
$1c:9854  c7 71		 cmp [$71]
$1c:9856  1e d4 3b	  asl $3bd4,x
$1c:9859  c2 3d		 rep #$3d
$1c:985b  b8			clv
$1c:985c  08			php
$1c:985d  8e 0a 3d	  stx $3d0a
$1c:9860  83 8f		 sta $8f,s
$1c:9862  64 a3		 stz $a3
$1c:9864  d9 38 f6	  cmp $f638,y
$1c:9867  12 3d		 ora ($3d)
$1c:9869  85 8f		 sta $8f
$1c:986b  65 23		 adc $23
$1c:986d  d9 58 f6	  cmp $f658,y
$1c:9870  1a			inc a
$1c:9871  3d 87 8f	  and $8f87,x
$1c:9874  65 a3		 adc $a3
$1c:9876  d9 78 f6	  cmp $f678,y
$1c:9879  8a			txa
$1c:987a  3d a3 8f	  and $8fa3,x
$1c:987d  6c a3 db	  jmp ($dba3)
$1c:9880  38			sec
$1c:9881  f6 9a		 inc $9a,x
$1c:9883  3d a7 8f	  and $8fa7,x
$1c:9886  6d a3 db	  adc $dba3
$1c:9889  78			sei
$1c:988a  f7 0a		 sbc [$0a],y
$1c:988c  3d c3 8f	  and $8fc3,x
$1c:988f  74 a3		 stz $a3,x
$1c:9891  dd 38 f7	  cmp $f738,x
$1c:9894  12 3d		 ora ($3d)
$1c:9896  c5 8f		 cmp $8f
$1c:9898  75 23		 adc $23,x
$1c:989a  dd 58 f7	  cmp $f758,x
$1c:989d  1a			inc a
$1c:989e  3d c7 8f	  and $8fc7,x
$1c:98a1  75 a3		 adc $a3,x
$1c:98a3  dd 78 f7	  cmp $f778,x
$1c:98a6  8a			txa
$1c:98a7  3d e3 08	  and $08e3,x
$1c:98aa  8d 86 3d	  sta $3d86
$1c:98ad  e4 8f		 cpx $8f
$1c:98af  79 63 d6	  adc $d663,y
$1c:98b2  28			plp
$1c:98b3  f5 8e		 sbc $8e,x
$1c:98b5  3d e6 8f	  and $8fe6,x
$1c:98b8  79 e3 d6	  adc $d6e3,y
$1c:98bb  47 78		 eor [$78]
$1c:98bd  57 b4		 eor [$b4],y
$1c:98bf  23 11		 and $11,s
$1c:98c1  12 06		 ora ($06)
$1c:98c3  c0 6e 27	  cpy #$276e
$1c:98c6  00 d8		 brk #$d8
$1c:98c8  89 44 90	  bit #$9044
$1c:98cb  1c 02 58	  trb $5802
$1c:98ce  f4 23 dc	  pea $dc23
$1c:98d1  12 48		 ora ($48)
$1c:98d3  f4 49 a3	  pea $a349
$1c:98d6  e0 18 bf	  cpx #$bf18
$1c:98d9  84 76		 sty $76
$1c:98db  66 41		 ror $41
$1c:98dd  77 b4		 adc [$b4],y
$1c:98df  7a			ply
$1c:98e0  e9 1e ba	  sbc #$ba1e
$1c:98e3  c6 34		 dec $34
$1c:98e5  91 8d		 sta ($8d),y
$1c:98e7  2c 63 69	  bit $6963
$1c:98ea  18			clc
$1c:98eb  da			phx
$1c:98ec  bd d2 31	  lda $31d2,x
$1c:98ef  90 5c		 bcc $994d
$1c:98f1  fb			xce
$1c:98f2  10 d7		 bpl $98cb
$1c:98f4  e8			inx
$1c:98f5  cf 5c 0b 0c   cmp $0c0b5c
$1c:98f9  40			rti
$1c:98fa  43 18		 eor $18,s
$1c:98fc  d0 3f		 bne $993d
$1c:98fe  ca			dex
$1c:98ff  25 22		 and $22
$1c:9901  89 48 e2	  bit #$e248
$1c:9904  53 28		 eor ($28,s),y
$1c:9906  94 ce		 sty $ce,x
$1c:9908  25 20		 and $20
$1c:990a  89 48 62	  bit #$6248
$1c:990d  53 08		 eor ($08,s),y
$1c:990f  94 c6		 sty $c6,x
$1c:9911  21 40		 and ($40,x)
$1c:9913  7f 9d 40 03   adc $03409d,x
$1c:9917  20 42 a8	  jsr $a842
$1c:991a  64 02		 stz $02
$1c:991c  c2 05		 rep #$05
$1c:991e  3a			dec a
$1c:991f  20 7c 68	  jsr $687c
$1c:9922  62 15 10	  per $a93a
$1c:9925  55 0e		 eor $0e,x
$1c:9927  a0 24 11	  ldy #$1124
$1c:992a  c8			iny
$1c:992b  44 aa 83	  mvp $83,$aa
$1c:992e  f0 8f		 beq $98bf
$1c:9930  55 63		 eor $63,x
$1c:9932  d5 68		 cmp $68,x
$1c:9934  95 4c		 sta $4c,x
$1c:9936  82 8f f3	  brl $8cc8
$1c:9939  a9 14 c2	  lda #$c214
$1c:993c  25 10		 and $10
$1c:993e  89 44 62	  bit #$6244
$1c:9941  54 58 95	  mvn $95,$58
$1c:9944  19 52 35	  ora $3552,y
$1c:9947  85 48		 sta $48
$1c:9949  d6 48		 dec $48,x
$1c:994b  eb			xba
$1c:994c  57 20		 eor [$20],y
$1c:994e  8d 1d 26	  sta $261d
$1c:9951  74 82		 stz $82,x
$1c:9953  08			php
$1c:9954  ed ab db	  sbc $dbab
$1c:9957  22 08 d0 a3   jsl $a3d008
$1c:995b  dd 2a f7	  cmp $f72a,x
$1c:995e  5a			phy
$1c:995f  3d 49 20	  and $2049,x
$1c:9962  8f 5a bd d2   sta $d2bd5a
$1c:9966  8f 79 23 de   sta $de2379
$1c:996a  f8			sed
$1c:996b  f5 8a		 sbc $8a,x
$1c:996d  3d 6b 8f	  and $8f6b,x
$1c:9970  78			sei
$1c:9971  a3 de		 lda $de,s
$1c:9973  e8			inx
$1c:9974  f1 90		 sbc ($90),y
$1c:9976  63 d8		 adc $d8,s
$1c:9978  48			pha
$1c:9979  f6 16		 inc $16,x
$1c:997b  3d 92 8f	  and $8f92,x
$1c:997e  64 d3		 stz $d3
$1c:9980  e7 96		 sbc [$96]
$1c:9982  8f 65 e2 54   sta $54e265
$1c:9986  a8			tay
$1c:9987  95 2e		 sta $2e,x
$1c:9989  25 5a		 and $5a
$1c:998b  89 56 e2	  bit #$e256
$1c:998e  10 e8		 bpl $9978
$1c:9990  84 3d		 sty $3d
$1c:9992  6e 51 4f	  ror $4f51
$1c:9995  b4 42		 ldy $42,x
$1c:9997  03 14		 ora $14,s
$1c:9999  8d 45 39	  sta $3945
$1c:999c  ab			plb
$1c:999d  72 8e		 adc ($8e)
$1c:999f  5e 63 84	  lsr $8463,x
$1c:99a2  e0 64 15	  cpx #$1564
$1c:99a5  56 39		 lsr $39,x
$1c:99a7  71 8b		 adc ($8b),y
$1c:99a9  49 2a d2	  eor #$d22a
$1c:99ac  48			pha
$1c:99ad  b4 d2		 ldy $d2,x
$1c:99af  ad 34 8b	  lda $8b34
$1c:99b2  4d 6a d3	  eor $d36a
$1c:99b5  56 d9		 lsr $d9,x
$1c:99b7  c9 6a d2	  cmp #$d26a
$1c:99ba  56 d9		 lsr $d9,x
$1c:99bc  4d a7 17	  eor $17a7
$1c:99bf  69 c3 04	  adc #$04c3
$1c:99c2  18			clc
$1c:99c3  21 1a		 and ($1a,x)
$1c:99c5  ae 46 a5	  ldx $a546
$1c:99c8  31 aa		 and ($aa),y
$1c:99ca  ec 6a 73	  cpx $736a
$1c:99cd  1a			inc a
$1c:99ce  96 46		 stx $46,y
$1c:99d0  ab			plb
$1c:99d1  f1 a9		 sbc ($a9),y
$1c:99d3  e4 6a		 cpx $6a
$1c:99d5  bd 1a 95	  lda $951a,x
$1c:99d8  46 a5		 lsr $a5
$1c:99da  71 a9		 adc ($a9),y
$1c:99dc  d4 6a		 pei ($6a)
$1c:99de  77 1a		 adc [$1a],y
$1c:99e0  a6 c6		 ldx $c6
$1c:99e2  a9 d1 69	  lda #$69d1
$1c:99e5  bd 5a 6f	  lda $6f5a,x
$1c:99e8  16 93		 asl $93,x
$1c:99ea  55 a4		 eor $a4,x
$1c:99ec  d1 69		 cmp ($69),y
$1c:99ee  b5 5a		 lda $5a,x
$1c:99f0  6d 1a a6	  adc $a61a
$1c:99f3  04 41		 tsb $41
$1c:99f5  ee 22 00	  inc $0022
$1c:99f8  08			php
$1c:99f9  05 3c		 ora $3c
$1c:99fb  52 35		 eor ($35)
$1c:99fd  f9 b0 6c	  sbc $6cb0,y
$1c:9a00  22 e3 11 0d   jsl $0d11e3
$1c:9a04  80 c0		 bra $99c6
$1c:9a06  a2 82 f0	  ldx #$f082
$1c:9a09  8b			phb
$1c:9a0a  45 62		 eor $62
$1c:9a0c  d0 52		 bne $9a60
$1c:9a0e  08			php
$1c:9a0f  90 00		 bcc $9a11
$1c:9a11  80 51		 bra $9a64
$1c:9a13  41 f8		 eor ($f8,x)
$1c:9a15  3e 44 10	  rol $1044,x
$1c:9a18  0f e0 06 00   ora $0006e0
$1c:9a1c  20 00 00	  jsr $0000
$1c:9a1f  0c 00 20	  tsb $2000
$1c:9a22  57 22		 eor [$22],y
$1c:9a24  d2 77		 cmp ($77)
$1c:9a26  d8			cld
$1c:9a27  65 a4		 adc $a4
$1c:9a29  f1 69		 sbc ($69),y
$1c:9a2b  40			rti
$1c:9a2c  04 32		 tsb $32
$1c:9a2e  c6 80		 dec $80
$1c:9a30  af 45 8c 01   lda $018c45
$1c:9a34  29 8b 57	  and #$578b
$1c:9a37  62 d3 98	  per $330d
$1c:9a3a  b4 b2		 ldy $b2,x
$1c:9a3c  2d 5f 8b	  and $8b5f
$1c:9a3f  4f 22 c6 e0   eor $e0c622
$1c:9a43  95 45		 sta $45,x
$1c:9a45  a5 71		 lda $71
$1c:9a47  69 d4 5a	  adc #$5ad4
$1c:9a4a  76 71		 ror $71,x
$1c:9a4c  14 00		 trb $00
$1c:9a4e  1d 81 08	  ora $0881,x
$1c:9a51  08			php
$1c:9a52  00 3c		 brk #$3c
$1c:9a54  02 10		 cop #$10
$1c:9a56  0f 81 4d 8b   ora $8b4d81
$1c:9a5a  04 92		 tsb $92
$1c:9a5c  98			tya
$1c:9a5d  99 13 00	  sta $0013,y
$1c:9a60  28			plp
$1c:9a61  01 30		 ora ($30,x)
$1c:9a63  14 f5		 trb $f5
$1c:9a65  48			pha
$1c:9a66  8b			phb
$1c:9a67  82 0d 36	  brl $d077
$1c:9a6a  83 ac		 sta $ac,s
$1c:9a6c  45 60		 eor $60
$1c:9a6e  0b			phd
$1c:9a6f  02 84		 cop #$84
$1c:9a71  ab			plb
$1c:9a72  c2 2d		 rep #$2d
$1c:9a74  18			clc
$1c:9a75  8b			phb
$1c:9a76  42 18		 wdm #$18
$1c:9a78  22 c0 01 f0   jsl $f001c0
$1c:9a7c  41 e2		 eor ($e2,x)
$1c:9a7e  d1 78		 cmp ($78),y
$1c:9a80  b2 f8		 lda ($f8)
$1c:9a82  21 4c		 and ($4c,x)
$1c:9a84  b1 65		 lda ($65),y
$1c:9a86  03 40		 ora $40,s
$1c:9a88  23 2c		 and $2c,s
$1c:9a8a  11 22		 ora ($22),y
$1c:9a8c  03 60		 ora $60,s
$1c:9a8e  0c 02 73	  tsb $7302
$1c:9a91  03 29		 ora $29,s
$1c:9a93  1e 40 d6	  asl $d640,x
$1c:9a96  07 d0		 ora [$d0]
$1c:9a98  89 57 22	  bit #$2257
$1c:9a9b  52 98		 eor ($98)
$1c:9a9d  95 76		 sta $76,x
$1c:9a9f  25 39		 and $39
$1c:9aa1  89 4b 22	  bit #$224b
$1c:9aa4  55 f8		 eor $f8,x
$1c:9aa6  94 f2		 sty $f2,x
$1c:9aa8  24 ee		 bit $ee
$1c:9aaa  09 54 4a	  ora #$4a54
$1c:9aad  57 12		 eor [$12],y
$1c:9aaf  9d 44 a7	  sta $a744,x
$1c:9ab2  6f 11 00 03   adc $030011
$1c:9ab6  d8			cld
$1c:9ab7  00 80		 brk #$80
$1c:9ab9  00 07		 brk #$07
$1c:9abb  c0 01 01	  cpy #$0101
$1c:9abe  f8			sed
$1c:9abf  14 d8		 trb $d8
$1c:9ac1  92 68		 sta ($68)
$1c:9ac3  e2 54		 sep #$54
$1c:9ac5  c0 c8		 cpy #$c8
$1c:9ac7  3b			tsc
$1c:9ac8  c4 40		 cpy $40
$1c:9aca  01 80		 ora ($80,x)
$1c:9acc  a7 8a		 lda [$8a]
$1c:9ace  45 5c		 eor $5c
$1c:9ad0  11 29		 ora ($29),y
$1c:9ad2  b4 4c		 ldy $4c,x
$1c:9ad4  62 23 00	  per $9afa
$1c:9ad7  18			clc
$1c:9ad8  14 10		 trb $10
$1c:9ada  5e 11 68	  lsr $6811,x
$1c:9add  1c 5a 04	  trb $045a
$1c:9ae0  41 12		 eor ($12,x)
$1c:9ae2  00 10		 brk #$10
$1c:9ae4  0a			asl a
$1c:9ae5  08			php
$1c:9ae6  3f 0c a4 7b   and $7ba40c,x
$1c:9aea  29 1f 88	  and #$881f
$1c:9aed  40			rti
$1c:9aee  4a			lsr a
$1c:9aef  61 16		 adc ($16,x)
$1c:9af1  8a			txa
$1c:9af2  b6 c4		 ldx $c4,y
$1c:9af4  84 11		 sty $11
$1c:9af6  57 78		 eor [$78],y
$1c:9af8  38			sec
$1c:9af9  41 e6		 eor ($e6,x)
$1c:9afb  0e 52 7c	  asl $7c52
$1c:9afe  83 ac		 sta $ac,s
$1c:9b00  1f a1 36 92   ora $9236a1,x
$1c:9b04  5d a4 93	  eor $93a4,x
$1c:9b07  69 a5 da	  adc #$daa5
$1c:9b0a  69 36 9a	  adc #$9a36
$1c:9b0d  dd a6 a7	  cmp $a7a6,x
$1c:9b10  32 8b		 and ($8b)
$1c:9b12  4b			phk
$1c:9b13  62 d2 e8	  per $83e8
$1c:9b16  b4 f6		 ldy $f6,x
$1c:9b18  2d 3e ab	  and $ab3e
$1c:9b1b  4b			phk
$1c:9b1c  aa			tax
$1c:9b1d  d2 da		 cmp ($da)
$1c:9b1f  b2 18		 lda ($18)
$1c:9b21  27 b1		 and [$b1]
$1c:9b23  48			pha
$1c:9b24  94 51		 sty $51,x
$1c:9b26  1c 10 44	  trb $4410
$1c:9b29  78			sei
$1c:9b2a  55 11		 eor $11,x
$1c:9b2c  c5 13		 cmp $13
$1c:9b2e  47 8a		 eor [$8a]
$1c:9b30  68			pla
$1c:9b31  92 81		 sta ($81)
$1c:9b33  2d 4c 95	  and $954c
$1c:9b36  51 4c		 eor ($4c),y
$1c:9b38  30 28		 bmi $9b62
$1c:9b3a  02 bc		 cop #$bc
$1c:9b3c  ab			plb
$1c:9b3d  d9 85 79	  cmp $7985,y
$1c:9b40  47 96		 eor [$96]
$1c:9b42  c7 5e		 cmp [$5e]
$1c:9b44  e4 2c		 cpx $2c
$1c:9b46  c7 b1		 cmp [$b1]
$1c:9b48  1e 61 0c	  asl $0c61,x
$1c:9b4b  7b			tdc
$1c:9b4c  b0 af		 bcs $9afd
$1c:9b4e  45 c8		 eor $c8
$1c:9b50  dc d6 e7	  jml [$e7d6]
$1c:9b53  76 5c		 ror $5c,x
$1c:9b55  8d 8a 3d	  sta $3d8a
$1c:9b58  63 8f		 adc $8f,s
$1c:9b5a  5d 23 d7	  eor $d723,x
$1c:9b5d  58			cli
$1c:9b5e  f6 a2		 inc $a2,x
$1c:9b60  bd a8 8f	  lda $8fa8,x
$1c:9b63  6e 2b db	  ror $db2b
$1c:9b66  88			dey
$1c:9b67  f5 a1		 sbc $a1,x
$1c:9b69  c2 3b		 rep #$3b
$1c:9b6b  86 e9		 stx $e9
$1c:9b6d  57 ad		 eor [$ad],y
$1c:9b6f  0b			phd
$1c:9b70  31 7a		 and ($7a),y
$1c:9b72  0b			phd
$1c:9b73  a4 6e		 ldy $6e
$1c:9b75  95 eb		 sta $eb,x
$1c:9b77  3b			tsc
$1c:9b78  9c 17 22	  stz $2217
$1c:9b7b  06 0b		 asl $0b
$1c:9b7d  ad 08 00	  lda $0008
$1c:9b80  59 87 68	  eor $6887,y
$1c:9b83  82 09 d8	  brl $738f
$1c:9b86  19 85 c8	  ora $c885,y
$1c:9b89  d8			cld
$1c:9b8a  17 23		 ora [$23],y
$1c:9b8c  70 73		 bvs $9c01
$1c:9b8e  80 84		 bra $9b14
$1c:9b90  1d 60 25	  ora $2560,x
$1c:9b93  05 b9		 ora $b9
$1c:9b95  81 05		 sta ($05,x)
$1c:9b97  6e 60 c1	  ror $c160
$1c:9b9a  6f 8d c8 46   adc $46c88d
$1c:9b9e  41 f2		 eor ($f2,x)
$1c:9ba0  5d 80 94	  eor $9480,x
$1c:9ba3  7c 51 ef	  jmp ($ef51,x)
$1c:9ba6  1b			tcs
$1c:9ba7  8c 6d 24	  sty $246d
$1c:9baa  f2 5c		 sbc ($5c)
$1c:9bac  8d de 3d	  sta $3dde
$1c:9baf  e4 8f		 cpx $8f
$1c:9bb1  79 63 d6	  adc $d663,y
$1c:9bb4  58			cli
$1c:9bb5  f5 9a		 sbc $9a,x
$1c:9bb7  3d e6 8f	  and $8fe6,x
$1c:9bba  79 e3 d7	  adc $d7e3,y
$1c:9bbd  86 18		 stx $18
$1c:9bbf  03 ce		 ora $ce,s
$1c:9bc1  ec 15 66	  cpx $6615
$1c:9bc4  a8			tay
$1c:9bc5  47 9c		 eor [$9c]
$1c:9bc7  02 b3		 cop #$b3
$1c:9bc9  23 f9		 and $f9,s
$1c:9bcb  2e c8 ae	  rol $aec8
$1c:9bce  95 ec		 sta $ec,x
$1c:9bd0  41 9c		 eor ($9c,x)
$1c:9bd2  f1 0b		 sbc ($0b),y
$1c:9bd4  73 ac		 adc ($ac,s),y
$1c:9bd6  47 9c		 eor [$9c]
$1c:9bd8  81 7b		 sta ($7b,x)
$1c:9bda  3f 8d ac b6   and $b6ac8d,x
$1c:9bde  35 92		 and $92,x
$1c:9be0  39 b9 02	  and $02b9,y
$1c:9be3  f4 a7 25	  pea $25a7
$1c:9be6  19 27 e6	  ora $e627,y
$1c:9be9  e4 b3		 cpx $b3
$1c:9beb  54 10 c7	  mvn $c7,$10
$1c:9bee  8f c1 9b 8f   sta $8f9bc1
$1c:9bf2  14 81		 trb $81
$1c:9bf4  dc 16 18	  jml [$1816]
$1c:9bf7  f1 80		 sbc ($80),y
$1c:9bf9  9f 03 1e d4   sta $d41e03,x
$1c:9bfd  57 b9		 eor [$b9],y
$1c:9bff  0d b0 af	  ora $afb0
$1c:9c02  76 05		 ror $05,x
$1c:9c04  e4 83		 cpx $83
$1c:9c06  11 b2		 ora ($b2),y
$1c:9c08  bb			tyx
$1c:9c09  d1 f6		 cmp ($f6),y
$1c:9c0b  03 52		 ora $52,s
$1c:9c0d  58			cli
$1c:9c0e  88			dey
$1c:9c0f  f0 19		 beq $9c2a
$1c:9c11  ca			dex
$1c:9c12  35 08		 and $08,x
$1c:9c14  95 50		 sta $50,x
$1c:9c16  2e 11 ec	  rol $ec11
$1c:9c19  4c 7b 14	  jmp $147b
$1c:9c1c  17 3b		 ora [$3b],y
$1c:9c1e  cc 7a ad	  cpy $ad7a
$1c:9c21  12 a9		 ora ($a9)
$1c:9c23  86 46		 stx $46
$1c:9c25  ab			plb
$1c:9c26  1e b8 89	  asl $89b8,x
$1c:9c29  d7 16		 cmp [$16],y
$1c:9c2b  27 3d		 and [$3d]
$1c:9c2d  50 d4		 bvc $9c03
$1c:9c2f  43 04		 eor $04,s
$1c:9c31  2c 0d 4c	  bit $4c0d
$1c:9c34  7b			tdc
$1c:9c35  0d 1e cc	  ora $cc1e
$1c:9c38  c7 b2		 cmp [$b2]
$1c:9c3a  d1 ec		 cmp ($ec),y
$1c:9c3c  b9 1c 73	  lda $731c,y
$1c:9c3f  44 b2 af	  mvp $af,$b2
$1c:9c42  14 83		 trb $83
$1c:9c44  07 1e		 ora [$1e]
$1c:9c46  c9 47 b2	  cmp #$b247
$1c:9c49  74 25		 stz $25,x
$1c:9c4b  00 97		 brk #$97
$1c:9c4d  c6 e1		 dec $e1
$1c:9c4f  9e ec 17	  stz $17ec,x
$1c:9c52  c7 70		 cmp [$70]
$1c:9c54  5f 1b 64 7a   eor $7a641b,x
$1c:9c58  db			stp
$1c:9c59  1e be 47	  asl $47be,x
$1c:9c5c  af b1 2b 74   lda $742bb1
$1c:9c60  4a			lsr a
$1c:9c61  df 12 a2 c4   cmp $c4a212,x
$1c:9c65  a8			tay
$1c:9c66  d1 2b		 cmp ($2b),y
$1c:9c68  f4 4a fe	  pea $fe4a
$1c:9c6b  7b			tdc
$1c:9c6c  3c 74 4b	  bit $4b74,x
$1c:9c6f  1e 7b 3c	  asl $3c7b,x
$1c:9c72  f4 4b 3e	  pea $3e4b
$1c:9c75  7b			tdc
$1c:9c76  28			plp
$1c:9c77  f3 98		 sbc ($98,s),y
$1c:9c79  2c 6d b1	  bit $b16d
$1c:9c7c  b9 c4 a1	  lda $a1c4,y
$1c:9c7f  71 28		 adc ($28),y
$1c:9c81  64 4a		 stz $4a
$1c:9c83  65 12		 adc $12
$1c:9c85  99 c7 35	  sta $35c7,y
$1c:9c88  d1 cd		 cmp ($cd),y
$1c:9c8a  7c 73 7d	  jmp ($7d73,x)
$1c:9c8d  1c df c4	  trb $c4df
$1c:9c90  28			plp
$1c:9c91  71 0a		 adc ($0a),y
$1c:9c93  24 43		 bit $43
$1c:9c95  19 10 c6	  ora $c610,y
$1c:9c98  ab			plb
$1c:9c99  c2 a1		 rep #$a1
$1c:9c9b  9c 58 85	  stz $8558
$1c:9c9e  41 60		 eor ($60,x)
$1c:9ca0  1a			inc a
$1c:9ca1  c8			iny
$1c:9ca2  85 01		 sta $01
$1c:9ca4  82 3b c6	  brl $62e2
$1c:9ca7  08			php
$1c:9ca8  eb			xba
$1c:9ca9  62 15 08	  per $a4c1
$1c:9cac  86 f5		 stx $f5
$1c:9cae  82 2c 00	  brl $9cdd
$1c:9cb1  66 05		 ror $05
$1c:9cb3  43 21		 eor $21,s
$1c:9cb5  bc c8 35	  ldy $35c8,x
$1c:9cb8  05 82		 ora $82
$1c:9cba  2b			pld
$1c:9cbb  20 59 02	  jsr $0259
$1c:9cbe  e8			inx
$1c:9cbf  33 ab		 and ($ab,s),y
$1c:9cc1  33 70		 and ($70,s),y
$1c:9cc3  0c 73 57	  tsb $5773
$1c:9cc6  1c c0 3c	  trb $3cc0
$1c:9cc9  55 e1		 eor $e1,x
$1c:9ccb  0f 86 78 10   ora $107886
$1c:9ccf  1a			inc a
$1c:9cd0  81 88		 sta ($88,x)
$1c:9cd2  aa			tax
$1c:9cd3  27 80		 and [$80]
$1c:9cd5  2a			rol a
$1c:9cd6  00 34		 brk #$34
$1c:9cd8  5b			tcd
$1c:9cd9  f8			sed
$1c:9cda  00 bd		 brk #$bd
$1c:9cdc  63 9c		 adc $9c,s
$1c:9cde  81 a8		 sta ($a8,x)
$1c:9ce0  f6 05		 inc $05,x
$1c:9ce2  e1 10		 sbc ($10,x)
$1c:9ce4  a9 c4 2a	  lda #$2ac4
$1c:9ce7  91 ca		 sta ($ca),y
$1c:9ce9  ac 72 ac	  ldy $ac72
$1c:9cec  41 02		 eor ($02,x)
$1c:9cee  0a			asl a
$1c:9cef  0c ce e9	  tsb $e9ce
$1c:9cf2  1c ba c4	  trb $c4ba
$1c:9cf5  24 11		 bit $11
$1c:9cf7  09 0c 42	  ora #$420c
$1c:9cfa  61 10		 adc ($10,x)
$1c:9cfc  98			tya
$1c:9cfd  c6 32		 dec $32
$1c:9cff  11 c9		 ora ($c9),y
$1c:9d01  7b			tdc
$1c:9d02  c4 67		 cpy $67
$1c:9d04  ef 11 97 97   sbc $979711
$1c:9d08  c6 7f		 dec $7f
$1c:9d0a  0c dc c3	  tsb $c3dc
$1c:9d0d  37 5c		 and [$5c],y
$1c:9d0f  ce e5 33	  dec $33e5
$1c:9d12  97 0c		 sta [$0c],y
$1c:9d14  3b			tsc
$1c:9d15  07 32		 ora [$32]
$1c:9d17  19 db 86	  ora $86db,y
$1c:9d1a  77 21		 adc [$21],y
$1c:9d1c  9c 98 67	  stz $6798
$1c:9d1f  2a			rol a
$1c:9d20  19 d9 86	  ora $86d9,y
$1c:9d23  76 a3		 ror $a3,x
$1c:9d25  dc 28 f7	  jml [$f728]
$1c:9d28  3a			dec a
$1c:9d29  3d d2 8f	  and $8fd2,x
$1c:9d2c  77 a3		 adc [$a3],y
$1c:9d2e  dc 48 f7	  jml [$f748]
$1c:9d31  3e 3d d4	  rol $d43d,x
$1c:9d34  8f 77 e3 da   sta $dae377
$1c:9d38  28			plp
$1c:9d39  f5 06		 sbc $06,x
$1c:9d3b  3d b2 8f	  and $8fb2,x
$1c:9d3e  54 63 86	  mvn $86,$63
$1c:9d41  81 8e		 sta ($8e,x)
$1c:9d43  3c 00 cc	  bit $cc00,x
$1c:9d46  0f 00 31 19   ora $193100
$1c:9d4a  bc a1 9b	  ldy $9ba1,x
$1c:9d4d  be 66 ed	  ldx $ed66,y
$1c:9d50  66 14		 ror $14
$1c:9d52  c3 e0		 cmp $e0,s
$1c:9d54  2d 06 3d	  and $3d06
$1c:9d57  e4 8f		 cpx $8f
$1c:9d59  7b			tdc
$1c:9d5a  e3 d6		 sbc $d6,s
$1c:9d5c  28			plp
$1c:9d5d  f5 8e		 sbc $8e,x
$1c:9d5f  3d e2 8f	  and $8fe2,x
$1c:9d62  7b			tdc
$1c:9d63  a0 50 08	  ldy #$0850
$1c:9d66  f5 86		 sbc $86,x
$1c:9d68  25 10		 and $10
$1c:9d6a  89 7c a2	  bit #$a27c
$1c:9d6d  5f 08 97 c6   eor $c69708,x
$1c:9d71  25 7e		 and $7e
$1c:9d73  89 7c da	  bit #$da7c
$1c:9d76  67 8e		 adc [$8e]
$1c:9d78  89 7d 1a	  bit #$1a7d
$1c:9d7b  67 9e		 adc [$9e]
$1c:9d7d  89 7d 5a	  bit #$5a7d
$1c:9d80  64 97		 stz $97
$1c:9d82  1d 1c 7b	  ora $7b1c,x
$1c:9d85  d5 1e		 cmp $1e,x
$1c:9d87  f5 c7		 sbc $c7,x
$1c:9d89  b4 d1		 ldy $d1,x
$1c:9d8b  ed 3c 7b	  sbc $7b3c
$1c:9d8e  d9 1e f6	  cmp $f61e,y
$1c:9d91  97 c4		 sta [$c4],y
$1c:9d93  c8			iny
$1c:9d94  06 40		 asl $40
$1c:9d96  c0 97 c7	  cpy #$c797
$1c:9d99  02 9f		 cop #$9f
$1c:9d9b  1e e8 0d	  asl $0de8,x
$1c:9d9e  41 c4		 eor ($c4,x)
$1c:9da0  02 38		 cop #$38
$1c:9da2  84 3a		 sty $3a
$1c:9da4  21 0d		 and ($0d,x)
$1c:9da6  8e 11 02	  stx $0211
$1c:9da9  e2 1f		 sep #$1f
$1c:9dab  20 f9 47	  jsr $47f9
$1c:9dae  a9 11 2a	  lda #$2a11
$1c:9db1  a3 ec		 lda $ec,s
$1c:9db3  2b			pld
$1c:9db4  cf 40 c2 47   cmp $47c240
$1c:9db8  bd 11 ec	  lda $ec11,x
$1c:9dbb  a4 7b		 ldy $7b
$1c:9dbd  d2 50		 cmp ($50)
$1c:9dbf  12 0d		 ora ($0d)
$1c:9dc1  a7 c5		 lda [$c5]
$1c:9dc3  48			pha
$1c:9dc4  05 30		 ora $30
$1c:9dc6  28			plp
$1c:9dc7  10 08		 bpl $9dd1
$1c:9dc9  8b			phb
$1c:9dca  a4 02		 ldy $02
$1c:9dcc  22 c1 15 00   jsl $0015c1
$1c:9dd0  b0 33		 bcs $9e05
$1c:9dd2  69 c5 da	  adc #$dac5
$1c:9dd5  71 14		 adc ($14),y
$1c:9dd7  8f 45 32 31   sta $313245
$1c:9ddb  48			pha
$1c:9ddc  3c 52 0d	  bit $0d52,x
$1c:9ddf  14 8d		 trb $8d
$1c:9de1  45 23		 eor $23
$1c:9de3  71 c8		 adc ($c8),y
$1c:9de5  e9 65 55	  sbc #$5565
$1c:9de8  80 80		 bra $9d6a
$1c:9dea  03 03		 ora $03,s
$1c:9dec  20 08 b0	  jsr $b008
$1c:9def  88			dey
$1c:9df0  00 40		 brk #$40
$1c:9df2  21 60		 and ($60,x)
$1c:9df4  90 00		 bcc $9df6
$1c:9df6  6c 18 27	  jmp ($2718)
$1c:9df9  f6 89		 inc $89,x
$1c:9dfb  fd c2 7f	  sbc $7fc2,x
$1c:9dfe  78			sei
$1c:9dff  9f d2 0b 44   sta $440bd2,x
$1c:9e03  3f d5 0f f6   and $f60fd5,x
$1c:9e07  43 fd		 eor $fd,s
$1c:9e09  d0 ff		 bne $9e0a
$1c:9e0b  41 be		 eor ($be,x)
$1c:9e0d  f4 6f bc	  pea $bc6f
$1c:9e10  1b			tcs
$1c:9e11  f1 46		 sbc ($46),y
$1c:9e13  fc 41 bf	  jsr ($bf41,x)
$1c:9e16  34 6f		 bit $6f,x
$1c:9e18  cc 1b f5	  cpy $f51b
$1c:9e1b  46 fd		 lsr $fd
$1c:9e1d  41 3f		 eor ($3f,x)
$1c:9e1f  f4 4f fe	  pea $fe4f
$1c:9e22  13 ff		 ora ($ff,s),y
$1c:9e24  c4 ff		 cpy $ff
$1c:9e26  c1 3f		 cmp ($3f,x)
$1c:9e28  94 4f		 sty $4f,x
$1c:9e2a  e6 13		 inc $13
$1c:9e2c  f9 c4 fe	  sbc $fec4,y
$1c:9e2f  41 3f		 eor ($3f,x)
$1c:9e31  74 4f		 stz $4f,x
$1c:9e33  de 13 f7	  dec $f713,x
$1c:9e36  c4 fd		 cpy $fd
$1c:9e38  80 b8		 bra $9df2
$1c:9e3a  0e ad 4e	  asl $4ead
$1c:9e3d  2f 93 8c f4   and $f48c93
$1c:9e41  e3 81		 sbc $81,s
$1c:9e43  38			sec
$1c:9e44  f1 4e		 sbc ($4e),y
$1c:9e46  20 93 9c	  jsr $9c93
$1c:9e49  34 e6		 bit $e6,x
$1c:9e4b  11 3a		 ora ($3a),y
$1c:9e4d  c5 4e		 cmp $4e
$1c:9e4f  b2 93		 lda ($93)
$1c:9e51  ac f4 eb	  ldy $ebf4
$1c:9e54  51 3a		 eor ($3a),y
$1c:9e56  e5 4e		 sbc $4e
$1c:9e58  bd 93 a8	  lda $a893,x
$1c:9e5b  74 ee		 stz $ee,x
$1c:9e5d  41 3b		 eor ($3b,x)
$1c:9e5f  99 4e e8	  sta $e84e,y
$1c:9e62  93 ba		 sta ($ba,s),y
$1c:9e64  74 ee		 stz $ee,x
$1c:9e66  c1 3b		 cmp ($3b,x)
$1c:9e68  b9 4e f2	  lda $f24e,y
$1c:9e6b  93 bd		 sta ($bd,s),y
$1c:9e6d  b4 ef		 ldy $ef,x
$1c:9e6f  b1 3b		 lda ($3b),y
$1c:9e71  f1 4e		 sbc ($4e),y
$1c:9e73  fd 93 bf	  sbc $bf93,x
$1c:9e76  b4 ee		 ldy $ee,x
$1c:9e78  01 3c		 ora ($3c,x)
$1c:9e7a  91 4f		 sta ($4f),y
$1c:9e7c  28			plp
$1c:9e7d  93 ca		 sta ($ca,s),y
$1c:9e7f  74 f3		 stz $f3,x
$1c:9e81  41 3c		 eor ($3c,x)
$1c:9e83  f9 0a 02	  sbc $020a,y
$1c:9e86  7b			tdc
$1c:9e87  96 9e		 stx $9e,y
$1c:9e89  ca			dex
$1c:9e8a  27 d3		 and [$d3]
$1c:9e8c  a9 f5 f2	  lda #$f2f5
$1c:9e8f  7d 86 9f	  adc $9f86,x
$1c:9e92  66 27		 ror $27
$1c:9e94  da			phx
$1c:9e95  a9 f6 d2	  lda #$d2f6
$1c:9e98  7d be 9f	  adc $9fbe,x
$1c:9e9b  72 27		 adc ($27)
$1c:9e9d  dd 29 f4	  cmp $f429,x
$1c:9ea0  16 00		 asl $00,x
$1c:9ea2  4a			lsr a
$1c:9ea3  2f a4 fa 08   and $08faa4
$1c:9ea7  4a			lsr a
$1c:9ea8  38			sec
$1c:9ea9  84 fe		 sty $fe
$1c:9eab  04 4a		 tsb $4a
$1c:9ead  39 64 fe	  and $fe64,y
$1c:9eb0  02 4a		 cop #$4a
$1c:9eb2  3a			dec a
$1c:9eb3  44 ff ff	  mvp $ff,$ff
$1c:9eb6  ff 24 91 84   sbc $849124,x
$1c:9eba  09 e8 61	  ora #$61e8
$1c:9ebd  02 ba		 cop #$ba
$1c:9ebf  18			clc
$1c:9ec0  40			rti
$1c:9ec1  be 86 10	  ldx $1086,y
$1c:9ec4  33 b1		 and ($b1,s),y
$1c:9ec6  a4 09		 ldy $09
$1c:9ec8  e8			inx
$1c:9ec9  69 02 ba	  adc #$ba02
$1c:9ecc  1a			inc a
$1c:9ecd  40			rti
$1c:9ece  be 86 90	  ldx $9086,y
$1c:9ed1  33 a1		 and ($a1,s),y
$1c:9ed3  a4 09		 ldy $09
$1c:9ed5  a8			tay
$1c:9ed6  b1 22		 lda ($22),y
$1c:9ed8  b9 2c 48	  lda $482c,y
$1c:9edb  be 4b 12	  ldx $124b,y
$1c:9ede  33 94		 and ($94,s),y
$1c:9ee0  1c 94 76	  trb $7694
$1c:9ee3  49 fb 45	  eor #$45fb
$1c:9ee6  31 cd		 and ($cd),y
$1c:9ee8  85 dc		 sta $dc
$1c:9eea  36 17		 rol $17,x
$1c:9eec  c4 68		 cpy $68
$1c:9eee  12 ca		 ora ($ca)
$1c:9ef0  35 c0		 and $c0,x
$1c:9ef2  94 46		 sty $46,x
$1c:9ef4  10 6b		 bpl $9f61
$1c:9ef6  83 cf		 sta $cf,s
$1c:9ef8  db			stp
$1c:9ef9  4a			lsr a
$1c:9efa  fb			xce
$1c:9efb  46 f8		 lsr $f8
$1c:9efd  04 fd		 tsb $fd
$1c:9eff  c4 af		 cpy $af
$1c:9f01  b4 73		 ldy $73,x
$1c:9f03  80 cf		 bra $9ed4
$1c:9f05  dd 4a 3b	  cmp $3b4a,x
$1c:9f08  47 78		 eor [$78]
$1c:9f0a  14 f9		 trb $f9
$1c:9f0c  e3 8a		 sbc $8a,s
$1c:9f0e  d0 00		 bne $9f10
$1c:9f10  e2 06		 sep #$06
$1c:9f12  03 28		 ora $28,s
$1c:9f14  f1 01		 sbc ($01),y
$1c:9f16  0e 28 60	  asl $6028
$1c:9f19  72 8f		 adc ($8f)
$1c:9f1b  10 20		 bpl $9f3d
$1c:9f1d  e3 06		 sbc $06,s
$1c:9f1f  0b			phd
$1c:9f20  28			plp
$1c:9f21  73 03		 adc ($03,s),y
$1c:9f23  0e 38 48	  asl $4838
$1c:9f26  e7 47		 sbc [$47]
$1c:9f28  30 44		 bmi $9f6e
$1c:9f2a  93 df		 sta ($df,s),y
$1c:9f2c  d4 ce		 pei ($ce)
$1c:9f2e  01 25		 ora ($25,x)
$1c:9f30  9b			txy
$1c:9f31  07 79		 ora [$79]
$1c:9f33  96 40		 stx $40,y
$1c:9f35  12 61		 ora ($61)
$1c:9f37  d1 06		 cmp ($06),y
$1c:9f39  9b			txy
$1c:9f3a  64 01		 stz $01
$1c:9f3c  27 1d		 and [$1d]
$1c:9f3e  18			clc
$1c:9f3f  51 ea		 eor ($ea),y
$1c:9f41  10 f6		 bpl $9f39
$1c:9f43  31 d8		 and ($d8),y
$1c:9f45  28			plp
$1c:9f46  07 76		 ora [$76]
$1c:9f48  e8			inx
$1c:9f49  20 1e 81	  jsr $811e
$1c:9f4c  41 7a		 eor ($7a,x)
$1c:9f4e  84 1d		 sty $1d
$1c:9f50  8c 30 18	  sty $1830
$1c:9f53  04 32		 tsb $32
$1c:9f55  80 97		 bra $9eee
$1c:9f57  49 42 79	  eor #$7942
$1c:9f5a  68			pla
$1c:9f5b  89 e5 3f	  bit #$3fe5
$1c:9f5e  92 5c		 sta ($5c)
$1c:9f60  9e a1 7c	  stz $7ca1,x
$1c:9f63  4f 1b d4 33   eor $33d41b
$1c:9f67  0c 05 da	  tsb $da05
$1c:9f6a  30 15		 bmi $9f81
$1c:9f6c  12 49		 ora ($49)
$1c:9f6e  70 00		 bvs $9f70
$1c:9f70  97 b1		 sta [$b1],y
$1c:9f72  3c 26 12	  bit $1226,x
$1c:9f75  84 50		 sty $50
$1c:9f77  5b			tcd
$1c:9f78  69 24 75	  adc #$7524
$1c:9f7b  2a			rol a
$1c:9f7c  4c 89 04	  jmp $0489
$1c:9f7f  57 0a		 eor [$0a],y
$1c:9f81  e5 05		 sbc $05
$1c:9f83  fa			plx
$1c:9f84  98			tya
$1c:9f85  67 d1		 adc [$d1]
$1c:9f87  ff 8c 42 03   sbc $03428c,x
$1c:9f8b  20 89 02	  jsr $0289
$1c:9f8e  d0 90		 bne $9f20
$1c:9f90  40			rti
$1c:9f91  34 0d		 bit $0d,x
$1c:9f93  a4 0c		 ldy $0c
$1c:9f95  90 7b		 bcc $a012
$1c:9f97  04 a0		 tsb $a0
$1c:9f99  ac c0 68	  ldy $68c0
$1c:9f9c  5e 8a 08	  lsr $088a,x
$1c:9f9f  f5 20		 sbc $20,x
$1c:9fa1  94 21		 sty $21,x
$1c:9fa3  db			stp
$1c:9fa4  50 e8		 bvc $9f8e
$1c:9fa6  43 d4		 eor $d4,s
$1c:9fa8  b3 13		 lda ($13,s),y
$1c:9faa  04 42		 tsb $42
$1c:9fac  83 90		 sta $90,s
$1c:9fae  1a			inc a
$1c:9faf  12 cc		 ora ($cc)
$1c:9fb1  0c e8 65	  tsb $65e8
$1c:9fb4  a0 fb		 ldy #$fb
$1c:9fb6  10 c0		 bpl $9f78
$1c:9fb8  68			pla
$1c:9fb9  4d d0 44	  eor $44d0
$1c:9fbc  a1 24		 lda ($24,x)
$1c:9fbe  91 68		 sta ($68),y
$1c:9fc0  4b			phk
$1c:9fc1  21 0a		 and ($0a,x)
$1c:9fc3  15 41		 ora $41,x
$1c:9fc5  a6 4a		 ldx $4a
$1c:9fc7  94 2c		 sty $2c,x
$1c:9fc9  a2 b5		 ldx #$b5
$1c:9fcb  0b			phd
$1c:9fcc  a4 33		 ldy $33
$1c:9fce  2f e7 ff 98   and $98ffe7
$1c:9fd2  30 58		 bmi $a02c
$1c:9fd4  24 02		 bit $02
$1c:9fd6  4e c4 36	  lsr $36c4
$1c:9fd9  a8			tay
$1c:9fda  09 43 04	  ora #$0443
$1c:9fdd  5e 7c f3	  lsr $f37c,x
$1c:9fe0  11 5d		 ora ($5d),y
$1c:9fe2  24 57		 bit $57
$1c:9fe4  4e 09 59	  lsr $5909
$1c:9fe7  7c 94 21	  jmp ($2194,x)
$1c:9fea  9a			txs
$1c:9feb  15 00		 ora $00,x
$1c:9fed  62 c5 40	  per $e0b5
$1c:9ff0  7f b3 dd 9d   adc $9dddb3,x
$1c:9ff4  ec 5f 60	  cpx $605f
$1c:9ff7  69 3d ca	  adc #$ca3d
$1c:9ffa  04 16		 tsb $16
$1c:9ffc  52 08		 eor ($08)
$1c:9ffe  55 28		 eor $28,x
$1c:a000  6f 02 20 91   adc $912002
$1c:a004  35 23		 and $23,x
$1c:a006  84 45		 sty $45
$1c:a008  b8			clv
$1c:a009  11 14		 ora ($14),y
$1c:a00b  87 e4		 sta [$e4]
$1c:a00d  c5 9c		 cmp $9c
$1c:a00f  1b			tcs
$1c:a010  17 18		 ora [$18],y
$1c:a012  3a			dec a
$1c:a013  5f f3 90 03   eor $0390f3,x
$1c:a017  06 93		 asl $93
$1c:a019  02 5a		 cop #$5a
$1c:a01b  24 c9		 bit $c9
$1c:a01d  3e 85 b4	  rol $b485,x
$1c:a020  49 81 8d	  eor #$8d81
$1c:a023  12 7e		 ora ($7e)
$1c:a025  bc 14 fa	  ldy $fa14,x
$1c:a028  20 d1 76	  jsr $76d1
$1c:a02b  08			php
$1c:a02c  b4 5d		 ldy $5d,x
$1c:a02e  89 a8 dc	  bit #$dca8
$1c:a031  65 a8		 adc $a8
$1c:a033  26 0b		 rol $0b
$1c:a035  8d 1e 28	  sta $281e
$1c:a038  5b			tcd
$1c:a039  27 19		 and [$19]
$1c:a03b  72 dd		 adc ($dd)
$1c:a03d  0a			asl a
$1c:a03e  e7 f7		 sbc [$f7]
$1c:a040  82 a0 c8	  brl $68e3
$1c:a043  16 5e		 asl $5e,x
$1c:a045  e4 61		 cpx $61
$1c:a047  9a			txs
$1c:a048  44 d4 63	  mvp $63,$d4
$1c:a04b  52 77		 eor ($77)
$1c:a04d  90 d5		 bcc $a024
$1c:a04f  08			php
$1c:a050  68			pla
$1c:a051  ad 21 a9	  lda $a921
$1c:a054  01 c8		 ora ($c8,x)
$1c:a056  6b			rtl
$1c:a057  e4 69		 cpx $69
$1c:a059  6a			ror a
$1c:a05a  91 34		 sta ($34),y
$1c:a05c  85 e5		 sta $e5
$1c:a05e  03 67		 ora $67,s
$1c:a060  8b			phb
$1c:a061  7c 22 34	  jmp ($3422,x)
$1c:a064  44 2a 4b	  mvp $4b,$2a
$1c:a067  51 8a		 eor ($8a),y
$1c:a069  8b			phb
$1c:a06a  6a			ror a
$1c:a06b  4a			lsr a
$1c:a06c  53 52		 eor ($52,s),y
$1c:a06e  7e a4 f5	  ror $f5a4,x
$1c:a071  af af 8e ca   lda $ca8eaf
$1c:a075  cc 5c 0b	  cpy $0b5c
$1c:a078  31 73		 and ($73),y
$1c:a07a  ac c5 dc	  ldy $dcc5
$1c:a07d  b3 17		 lda ($17,s),y
$1c:a07f  aa			tax
$1c:a080  cc 5f 55	  cpy $555f
$1c:a083  11 e2		 ora ($e2),y
$1c:a085  05 e2		 ora $e2
$1c:a087  84 40		 sty $40
$1c:a089  28			plp
$1c:a08a  14 12		 trb $12
$1c:a08c  f1 1c		 sbc ($1c),y
$1c:a08e  03 e9		 ora $e9,s
$1c:a090  3e 0a 84	  rol $840a,x
$1c:a093  1c 3e 7f	  trb $7f3e
$1c:a096  fa			plx
$1c:a097  20 a5 2a	  jsr $2aa5
$1c:a09a  74 51		 stz $51,x
$1c:a09c  4a			lsr a
$1c:a09d  6d 47 0b	  adc $0b47
$1c:a0a0  1e a3 0a	  asl $0aa3,x
$1c:a0a3  70 8e		 bvs $a033
$1c:a0a5  c3 f6		 cmp $f6,s
$1c:a0a7  1b			tcs
$1c:a0a8  80 55		 bra $a0ff
$1c:a0aa  08			php
$1c:a0ab  a1 80		 lda ($80,x)
$1c:a0ad  a3 7f		 lda $7f,s
$1c:a0af  ff e6 b6 0f   sbc $0fb6e6,x
$1c:a0b3  a6 8c		 ldx $8c
$1c:a0b5  e4 30		 cpx $30
$1c:a0b7  13 62		 ora ($62,s),y
$1c:a0b9  a1 d1		 lda ($d1,x)
$1c:a0bb  06 50		 asl $50
$1c:a0bd  f5 f0		 sbc $f0,x
$1c:a0bf  b1 40		 lda ($40),y
$1c:a0c1  4a			lsr a
$1c:a0c2  49 92 fe	  eor #$fe92
$1c:a0c5  ff d3 e8 a7   sbc $a7e8d3,x
$1c:a0c9  01 1a		 ora ($1a,x)
$1c:a0cb  26 40		 rol $40
$1c:a0cd  1a			inc a
$1c:a0ce  42 52		 wdm #$52
$1c:a0d0  82 c0 10	  brl $b193
$1c:a0d3  e4 25		 cpx $25
$1c:a0d5  08			php
$1c:a0d6  23 08		 and $08,s
$1c:a0d8  e2 13		 sep #$13
$1c:a0da  f8			sed
$1c:a0db  13 08		 ora ($08,s),y
$1c:a0dd  e5 93		 sbc $93
$1c:a0df  f4 38 21	  pea $2138
$1c:a0e2  ca			dex
$1c:a0e3  91 3f		 sta ($3f),y
$1c:a0e5  39 94 42	  and $4294,y
$1c:a0e8  01 18		 ora ($18,x)
$1c:a0ea  66 13		 ror $13
$1c:a0ec  90 5a		 bcc $a148
$1c:a0ee  28			plp
$1c:a0ef  1b			tcs
$1c:a0f0  06 11		 asl $11
$1c:a0f2  06 c1		 asl $c1
$1c:a0f4  ca			dex
$1c:a0f5  0e 3f 7d	  asl $7d3f
$1c:a0f8  03 44		 ora $44,s
$1c:a0fa  df 61 12 7f   cmp $7f1261,x
$1c:a0fe  7b			tdc
$1c:a0ff  e4 66		 cpx $66
$1c:a101  0f 74 a0 06   ora $06a074
$1c:a105  bd f2 33	  lda $33f2,x
$1c:a108  27 ba		 and [$ba]
$1c:a10a  50 94		 bvc $a0a0
$1c:a10c  83 1f		 sta $1f,s
$1c:a10e  80 48		 bra $a158
$1c:a110  14 82		 trb $82
$1c:a112  57 02		 eor [$02],y
$1c:a114  b8			clv
$1c:a115  32 49		 and ($49)
$1c:a117  6e 11 08	  ror $0811
$1c:a11a  61 80		 adc ($80,x)
$1c:a11c  87 21		 sta [$21]
$1c:a11e  2c 61 02	  bit $0261
$1c:a121  64 62		 stz $62
$1c:a123  14 ca		 trb $ca
$1c:a125  01 bc		 ora ($bc,x)
$1c:a127  47 21		 eor [$21]
$1c:a129  6c 1a 89	  jmp ($891a)
$1c:a12c  57 e1		 eor [$e1],y
$1c:a12e  c6 74		 dec $74
$1c:a130  97 1b		 sta [$1b],y
$1c:a132  92 9c		 sta ($9c)
$1c:a134  75 4b		 adc $4b,x
$1c:a136  71 f3		 adc ($f3),y
$1c:a138  cc 63 4c	  cpy $4c63
$1c:a13b  33 a5		 and ($a5,s),y
$1c:a13d  b0 dc		 bcs $a11b
$1c:a13f  90 c3		 bcc $a104
$1c:a141  aa			tax
$1c:a142  4b			phk
$1c:a143  14 de		 trb $de
$1c:a145  63 1a		 adc $1a,s
$1c:a147  71 9d		 adc ($9d),y
$1c:a149  2d c9 84	  and $84c9
$1c:a14c  87 1d		 sta [$1d]
$1c:a14e  52 5c		 eor ($5c)
$1c:a150  35 11		 and $11,x
$1c:a152  ce 93 c2	  dec $c293
$1c:a155  08			php
$1c:a156  43 08		 eor $08,s
$1c:a158  23 74		 and $74,s
$1c:a15a  22 16 a2 18   jsl $18a216
$1c:a15e  3f 3e 01 06   and $06013e,x
$1c:a162  07 a5		 ora [$a5]
$1c:a164  ac 2d e2	  ldy $e22d
$1c:a167  71 84		 adc ($84),y
$1c:a169  03 d6		 ora $d6,s
$1c:a16b  84 33		 sty $33
$1c:a16d  f1 40		 sbc ($40),y
$1c:a16f  42 85		 wdm #$85
$1c:a171  6a			ror a
$1c:a172  4e 30 f8	  lsr $f830
$1c:a175  0a			asl a
$1c:a176  00 3e		 brk #$3e
$1c:a178  e2 70		 sep #$70
$1c:a17a  92 18		 sta ($18)
$1c:a17c  c8			iny
$1c:a17d  3e 16 ac	  rol $ac16,x
$1c:a180  11 af		 ora ($af),y
$1c:a182  c4 e1		 cpy $e1
$1c:a184  26 3f		 rol $3f
$1c:a186  a5 ad		 lda $ad
$1c:a188  0d e2 61	  ora $61e2
$1c:a18b  94 1f		 sty $1f,x
$1c:a18d  d7 84		 cmp [$84],y
$1c:a18f  a3 f1		 lda $f1,s
$1c:a191  38			sec
$1c:a192  4a			lsr a
$1c:a193  93 6a		 sta ($6a,s),y
$1c:a195  be 12 98	  ldx $9812,y
$1c:a198  35 c0		 and $c0,x
$1c:a19a  03 02		 ora $02,s
$1c:a19c  80 80		 bra $a11e
$1c:a19e  51 06		 eor ($06),y
$1c:a1a0  40			rti
$1c:a1a1  d7 00		 cmp [$00],y
$1c:a1a3  88			dey
$1c:a1a4  5e 86 42	  lsr $4286,x
$1c:a1a7  dd fa 33	  cmp $33fa,x
$1c:a1aa  bd 2f 6f	  lda $6f2f,x
$1c:a1ad  6f 03 8d 21   adc $218d03
$1c:a1b1  de aa 21	  dec $21aa,x
$1c:a1b4  0a			asl a
$1c:a1b5  fd 28 16	  sbc $1628,x
$1c:a1b8  aa			tax
$1c:a1b9  21 90		 and ($90,x)
$1c:a1bb  13 04		 ora ($04,s),y
$1c:a1bd  96 90		 stx $90,y
$1c:a1bf  46 60		 lsr $60
$1c:a1c1  b1 c6		 lda ($c6),y
$1c:a1c3  d1 04		 cmp ($04),y
$1c:a1c5  2c 8b 5c	  bit $5c8b
$1c:a1c8  2d 18 48	  and $4818
$1c:a1cb  0b			phd
$1c:a1cc  1c ad 1c	  trb $1cad
$1c:a1cf  43 38		 eor $38,s
$1c:a1d1  97 06		 sta [$06],y
$1c:a1d3  89 fe		 bit #$fe
$1c:a1d5  ff c7 a0 07   sbc $07a0c7,x
$1c:a1d9  70 3a		 bvs $a215
$1c:a1db  81 4d		 sta ($4d,x)
$1c:a1dd  a1 88		 lda ($88,x)
$1c:a1df  40			rti
$1c:a1e0  2f 0a 14 10   and $10140a
$1c:a1e4  c3 44		 cmp $44,s
$1c:a1e6  41 8a		 eor ($8a,x)
$1c:a1e8  14 0c		 trb $0c
$1c:a1ea  a2 85		 ldx #$85
$1c:a1ec  13 58		 ora ($58,s),y
$1c:a1ee  af c8 62 0e   lda $0e62c8
$1c:a1f2  18			clc
$1c:a1f3  67 8d		 adc [$8d]
$1c:a1f5  80 be		 bra $a1b5
$1c:a1f7  20 61 b8	  jsr $b861
$1c:a1fa  15 c1		 ora $c1,x
$1c:a1fc  41 f0		 eor ($f0,x)
$1c:a1fe  8c 82 cd	  sty $cd82
$1c:a201  34 0b		 bit $0b,x
$1c:a203  af 5a 8d 89   lda $898d5a
$1c:a207  66 97		 ror $97
$1c:a209  26 b5		 rol $b5
$1c:a20b  c0 c6		 cpy #$c6
$1c:a20d  a0 47		 ldy #$47
$1c:a20f  08			php
$1c:a210  64 12		 stz $12
$1c:a212  cc b3 27	  cpy $27b3
$1c:a215  47 b0		 eor [$b0]
$1c:a217  6f 24 b3 4d   adc $4db324
$1c:a21b  13 cb		 ora ($cb,s),y
$1c:a21d  96 e0		 stx $e0,y
$1c:a21f  04 0b		 tsb $0b
$1c:a221  38			sec
$1c:a222  1d 2c 8b	  ora $8b2c,x
$1c:a225  34 ba		 bit $ba,x
$1c:a227  05 7c		 ora $7c
$1c:a229  93 ec		 sta ($ec,s),y
$1c:a22b  0c ca 0a	  tsb $0aca
$1c:a22e  93 48		 sta ($48,s),y
$1c:a230  31 38		 and ($38),y
$1c:a232  90 dd		 bcc $a211
$1c:a234  d5 a5		 cmp $a5,x
$1c:a236  02 d4		 cop #$d4
$1c:a238  08			php
$1c:a239  81 6c		 sta ($6c,x)
$1c:a23b  10 a8		 bpl $a1e5
$1c:a23d  05 dc		 ora $dc
$1c:a23f  44 04 10	  mvp $10,$04
$1c:a242  52 8d		 eor ($8d)
$1c:a244  08			php
$1c:a245  38			sec
$1c:a246  51 41		 eor ($41),y
$1c:a248  bc 10 02	  ldy $0210,x
$1c:a24b  19 00 bb	  ora $bb00,y
$1c:a24e  2a			rol a
$1c:a24f  09 82		 ora #$82
$1c:a251  34 24		 bit $24,x
$1c:a253  d9 41 14	  cmp $1441,y
$1c:a256  04 34		 tsb $34
$1c:a258  08			php
$1c:a259  b1 6a		 lda ($6a),y
$1c:a25b  a0 d0		 ldy #$d0
$1c:a25d  0c 74 09	  tsb $0974
$1c:a260  36 50		 rol $50,x
$1c:a262  66 8a		 ror $8a
$1c:a264  16 6c		 asl $6c,x
$1c:a266  82 18 67	  brl $0981
$1c:a269  39 c2 34	  and $34c2,y
$1c:a26c  ce 71 1a	  dec $1a71
$1c:a26f  04 5c		 tsb $5c
$1c:a271  b5 06		 lda $06,x
$1c:a273  a0 83		 ldy #$83
$1c:a275  80 4c		 bra $a2c3
$1c:a277  34 20		 bit $20,x
$1c:a279  90 2d		 bcc $a2a8
$1c:a27b  84 44		 sty $44
$1c:a27d  1d 46 20	  ora $2046,x
$1c:a280  0e 19 a8	  asl $a819
$1c:a283  44 86 f1	  mvp $f1,$86
$1c:a286  fc 40 0f	  jsr ($0f40,x)
$1c:a289  c2 91		 rep #$91
$1c:a28b  88			dey
$1c:a28c  65 88		 adc $88
$1c:a28e  8b			phb
$1c:a28f  c6 6a		 dec $6a
$1c:a291  72 11		 adc ($11)
$1c:a293  ea			nop
$1c:a294  1e 82 24	  asl $2482,x
$1c:a297  f2 75		 sbc ($75)
$1c:a299  e0 40 60	  cpx #$6040
$1c:a29c  8c 51 c5	  sty $c551
$1c:a29f  39 c6 08	  and $08c6,y
$1c:a2a2  a8			tay
$1c:a2a3  16 58		 asl $58,x
$1c:a2a5  25 84		 and $84
$1c:a2a7  b8			clv
$1c:a2a8  29 72		 and #$72
$1c:a2aa  07 b2		 ora [$b2]
$1c:a2ac  8c ce 01	  sty $01ce
$1c:a2af  8c 55 93	  sty $9355
$1c:a2b2  2c 51 e2	  bit $e251
$1c:a2b5  a3 04		 lda $04,s
$1c:a2b7  a2 af bd	  ldx #$bdaf
$1c:a2ba  9e d0 33	  stz $33d0,x
$1c:a2bd  b2 ab		 lda ($ab)
$1c:a2bf  c0 8a 05	  cpy #$058a
$1c:a2c2  22 57 81 e8   jsl $e88157
$1c:a2c6  4b			phk
$1c:a2c7  25 aa		 and $aa
$1c:a2c9  53 01		 eor ($01,s),y
$1c:a2cb  48			pha
$1c:a2cc  b7 50		 lda [$50],y
$1c:a2ce  41 e8		 eor ($e8,x)
$1c:a2d0  42 40		 wdm #$40
$1c:a2d2  74 ff		 stz $ff,x
$1c:a2d4  20 99 40	  jsr $4099
$1c:a2d7  83 1e		 sta $1e,s
$1c:a2d9  59 15 a8	  eor $a815,y
$1c:a2dc  84 c5		 sty $c5
$1c:a2de  6a			ror a
$1c:a2df  23 51		 and $51,s
$1c:a2e1  00 7a		 brk #$7a
$1c:a2e3  9c 35 61	  stz $6135
$1c:a2e6  46 2a		 lsr $2a
$1c:a2e8  7a			ply
$1c:a2e9  9c 35 81	  stz $8135
$1c:a2ec  44 dd 9b	  mvp $9b,$dd
$1c:a2ef  fd 18 3a	  sbc $3a18,x
$1c:a2f2  d0 a2		 bne $a296
$1c:a2f4  6f 11 7e a8   adc $a87e11
$1c:a2f8  14 51		 trb $51
$1c:a2fa  2a			rol a
$1c:a2fb  47 7a		 eor [$7a]
$1c:a2fd  a7 5f		 lda [$5f]
$1c:a2ff  c7 fd		 cmp [$fd]
$1c:a301  60			rts
$1c:a302  41 c0		 eor ($c0,x)
$1c:a304  06 9a		 asl $9a
$1c:a306  99 99 56	  sta $5699,y
$1c:a309  c2 01		 rep #$01
$1c:a30b  00 48		 brk #$48
$1c:a30d  1d e2 20	  ora $20e2,x
$1c:a310  05 81		 ora $81
$1c:a312  42 99		 wdm #$99
$1c:a314  e3 20		 sbc $20,s
$1c:a316  84 46		 sty $46
$1c:a318  3b			tsc
$1c:a319  81 b0		 sta ($b0,x)
$1c:a31b  7f 83 bc 39   adc $39bc83,x
$1c:a31f  a1 b1		 lda ($b1,x)
$1c:a321  90 46		 bcc $a369
$1c:a323  21 1d		 and ($1d,x)
$1c:a325  cc 24 05	  cpy $0524
$1c:a328  e0 00 d1	  cpx #$d100
$1c:a32b  e2 00		 sep #$00
$1c:a32d  c5 e0		 cmp $e0
$1c:a32f  1c d0 80	  trb $80d0
$1c:a332  03 40		 ora $40,s
$1c:a334  36 3c		 rol $3c,x
$1c:a336  48			pha
$1c:a337  04 66		 tsb $66
$1c:a339  1f 03 92 ff   ora $ff9203,x
$1c:a33d  09 81		 ora #$81
$1c:a33f  21 83		 and ($83,x)
$1c:a341  8a			txa
$1c:a342  43 fa		 eor $fa,s
$1c:a344  02 00		 cop #$00
$1c:a346  68			pla
$1c:a347  01 86		 ora ($86,x)
$1c:a349  88			dey
$1c:a34a  11 17		 ora ($17),y
$1c:a34c  f8			sed
$1c:a34d  d1 1d		 cmp ($1d),y
$1c:a34f  d5 0c		 cmp $0c,x
$1c:a351  7d a7 40	  adc $40a7,x
$1c:a354  04 9c		 tsb $9c
$1c:a356  10 4a		 bpl $a3a2
$1c:a358  75 02		 adc $02,x
$1c:a35a  e9 c3		 sbc #$c3
$1c:a35c  0b			phd
$1c:a35d  80 80		 bra $a2df
$1c:a35f  b8			clv
$1c:a360  21 70		 and ($70,x)
$1c:a362  09 17		 ora #$17
$1c:a364  40			rti
$1c:a365  4a			lsr a
$1c:a366  11 85		 ora ($85),y
$1c:a368  60			rts
$1c:a369  4a			lsr a
$1c:a36a  3e ca 70	  rol $70ca,x
$1c:a36d  13 80		 ora ($80,s),y
$1c:a36f  84 3f		 sty $3f
$1c:a371  42 c2		 wdm #$c2
$1c:a373  10 87		 bpl $a2fc
$1c:a375  ed 4e 0f	  sbc $0f4e
$1c:a378  e0 3e 87	  cpx #$873e
$1c:a37b  dc 66 9c	  jml [$9c66]
$1c:a37e  30 10		 bmi $a390
$1c:a380  0f 0b a8 ed   ora $eda80b
$1c:a384  39 0b cd	  and $cd0b,y
$1c:a387  61 af		 adc ($af,x)
$1c:a389  b2 84		 lda ($84)
$1c:a38b  c6 3a		 dec $3a
$1c:a38d  c0 22 08	  cpy #$0822
$1c:a390  87 1d		 sta [$1d]
$1c:a392  b0 12		 bcs $a3a6
$1c:a394  87 d8		 sta [$d8]
$1c:a396  4a			lsr a
$1c:a397  39 60 92	  and $9260,y
$1c:a39a  8c c2 3b	  sty $3bc2
$1c:a39d  41 72		 eor ($72,x)
$1c:a39f  54 07 24	  mvn $24,$07
$1c:a3a2  d6 4a		 dec $4a,x
$1c:a3a4  80 e3		 bra $a389
$1c:a3a6  9c 89 94	  stz $9489
$1c:a3a9  1d 63 c9	  ora $c963,x
$1c:a3ac  ca			dex
$1c:a3ad  7e 08 e3	  ror $e308,x
$1c:a3b0  94 fc		 sty $fc,x
$1c:a3b2  45 80		 eor $80
$1c:a3b4  7b			tdc
$1c:a3b5  06 b8		 asl $b8
$1c:a3b7  7d 11 c4	  adc $c411,x
$1c:a3ba  d7 0f		 cmp [$0f],y
$1c:a3bc  a8			tay
$1c:a3bd  cc 8e 61	  cpy $618e
$1c:a3c0  c9 4e		 cmp #$4e
$1c:a3c2  12 d4		 ora ($d4)
$1c:a3c4  3b			tsc
$1c:a3c5  4a			lsr a
$1c:a3c6  33 23		 and ($23,s),y
$1c:a3c8  6f 88 ad 7e   adc $7ead88
$1c:a3cc  e3 22		 sbc $22,s
$1c:a3ce  7a			ply
$1c:a3cf  0d 77 e2	  ora $e277
$1c:a3d2  3c 82 08	  bit $0882,x
$1c:a3d5  0f a6 89 08   ora $0889a6
$1c:a3d9  0c 9d 28	  tsb $289d
$1c:a3dc  08			php
$1c:a3dd  1c 4b 57	  trb $574b
$1c:a3e0  b9 7e 0a	  lda $0a7e,y
$1c:a3e3  91 12		 sta ($12),y
$1c:a3e5  01 bc		 ora ($bc,x)
$1c:a3e7  95 41		 sta $41,x
$1c:a3e9  03 58		 ora $58,s
$1c:a3eb  89 bc		 bit #$bc
$1c:a3ed  21 1a		 and ($1a,x)
$1c:a3ef  e3 f1		 sbc $f1,s
$1c:a3f1  2a			rol a
$1c:a3f2  83 9e		 sta $9e,s
$1c:a3f4  7f 15 48 f7   adc $f74815,x
$1c:a3f8  cf c4 ad 13   cmp $13adc4
$1c:a3fc  aa			tax
$1c:a3fd  1f 48 e8 3c   ora $3ce848,x
$1c:a401  c8			iny
$1c:a402  20 00 08	  jsr $0800
$1c:a405  91 40		 sta ($40),y
$1c:a407  1d e9 0a	  ora $0ae9,x
$1c:a40a  90 c2		 bcc $a3ce
$1c:a40c  aa			tax
$1c:a40d  10 ab		 bpl $a3ba
$1c:a40f  04 2a		 tsb $2a
$1c:a411  c3 08		 cmp $08,s
$1c:a413  a8			tay
$1c:a414  c2 2a		 rep #$2a
$1c:a416  50 8b		 bvc $a3a3
$1c:a418  14 22		 trb $22
$1c:a41a  c7 48		 cmp [$48]
$1c:a41c  a9 52 2a	  lda #$2a52
$1c:a41f  34 80		 bit $80,x
$1c:a421  30 58		 bmi $a47b
$1c:a423  a9 4f a0	  lda #$a04f
$1c:a426  90 d2		 bcc $a3fa
$1c:a428  ac 34 ab	  ldy $ab34
$1c:a42b  04 22		 tsb $22
$1c:a42d  a7 08		 lda [$08]
$1c:a42f  ab			plb
$1c:a430  42 2c		 wdm #$2c
$1c:a432  b0 8b		 bcs $a3bf
$1c:a434  30 4c		 bmi $a482
$1c:a436  a1 50		 lda ($50,x)
$1c:a438  78			sei
$1c:a439  54 22 15	  mvn $15,$22
$1c:a43c  39 13 8b	  and $8b13,y
$1c:a43f  d8			cld
$1c:a440  1e c1 20	  asl $20c1,x
$1c:a443  7b			tdc
$1c:a444  88			dey
$1c:a445  cc 21 6f	  cpy $6f21
$1c:a448  b2 7d		 lda ($7d)
$1c:a44a  98			tya
$1c:a44b  10 40		 bpl $a48d
$1c:a44d  66 0c		 ror $0c
$1c:a44f  10 59		 bpl $a4aa
$1c:a451  85 04		 sta $04
$1c:a453  26 40		 rol $40
$1c:a455  b0 84		 bcs $a3db
$1c:a457  41 8a		 eor ($8a,x)
$1c:a459  e3 16		 sbc $16,s
$1c:a45b  84 45		 sty $45
$1c:a45d  e1 11		 sbc ($11,x)
$1c:a45f  88			dey
$1c:a460  44 9c c6	  mvp $c6,$9c
$1c:a463  26 20		 rol $20
$1c:a465  31 1c		 and ($1c),y
$1c:a467  2a			rol a
$1c:a468  35 0a		 and $0a,x
$1c:a46a  8d c2 a1	  sta $a1c2
$1c:a46d  b0 a8		 bcs $a417
$1c:a46f  60			rts
$1c:a470  ac 63 82	  ldy $8263
$1c:a473  b3 8e		 lda ($8e,s),y
$1c:a475  8a			txa
$1c:a476  cc fc 47	  cpy $47fc
$1c:a479  a3 99		 lda $99,s
$1c:a47b  72 e6		 adc ($e6)
$1c:a47d  5c c9 97 6e   jml $6e97c9
$1c:a481  65 dc		 adc $dc
$1c:a483  2b			pld
$1c:a484  8c 98 ae	  sty $ae98
$1c:a487  33 68		 and ($68,s),y
$1c:a489  44 dd 3e	  mvp $3e,$dd
$1c:a48c  34 78		 bit $78,x
$1c:a48e  44 a1 3e	  mvp $3e,$a1
$1c:a491  6a			ror a
$1c:a492  60			rts
$1c:a493  94 42		 sty $42,x
$1c:a495  a4 4f		 ldy $4f
$1c:a497  71 91		 adc ($91),y
$1c:a499  ac c4 58	  ldy $58c4
$1c:a49c  56 48		 lsr $48,x
$1c:a49e  55 19		 eor $19,x
$1c:a4a0  66 75		 ror $75
$1c:a4a2  48			pha
$1c:a4a3  55 56		 eor $56,x
$1c:a4a5  11 23		 ora ($23),y
$1c:a4a7  63 a0		 adc $a0,s
$1c:a4a9  ac e1 2d	  ldy $2de1
$1c:a4ac  31 7e		 and ($7e),y
$1c:a4ae  0d 2a 11	  ora $112a
$1c:a4b1  4a			lsr a
$1c:a4b2  12 05		 ora ($05)
$1c:a4b4  5e 15 38	  lsr $3815,x
$1c:a4b7  85 59		 sta $59
$1c:a4b9  e1 54		 sbc ($54,x)
$1c:a4bb  87 08		 sta [$08]
$1c:a4bd  b8			clv
$1c:a4be  82 32 eb	  brl $8ff3
$1c:a4c1  0a			asl a
$1c:a4c2  54 3a 14	  mvn $14,$3a
$1c:a4c5  f0 03		 beq $a4ca
$1c:a4c7  a1 5d		 lda ($5d,x)
$1c:a4c9  a1 57		 lda ($57,x)
$1c:a4cb  71 59		 adc ($59),y
$1c:a4cd  be 09 68	  ldx $6809,y
$1c:a4d0  40			rti
$1c:a4d1  45 a4		 eor $a4
$1c:a4d3  46 01		 lsr $01
$1c:a4d5  e3 27		 sbc $27,s
$1c:a4d7  09 88 40	  ora #$4088
$1c:a4da  22 e1 32 27   jsl $2732e1
$1c:a4de  84 2a		 sty $2a
$1c:a4e0  b0 4f		 bcs $a531
$1c:a4e2  28			plp
$1c:a4e3  54 a4 4e	  mvn $4e,$a4
$1c:a4e6  b1 e3		 lda ($e3),y
$1c:a4e8  88			dey
$1c:a4e9  ae 82 19	  ldx $1982
$1c:a4ec  08			php
$1c:a4ed  c9 42 32	  cmp #$3242
$1c:a4f0  70 8a		 bvs $a47c
$1c:a4f2  74 22		 stz $22,x
$1c:a4f4  9e 3b 31	  stz $313b,x
$1c:a4f7  c1 4c		 cmp ($4c,x)
$1c:a4f9  a1 13		 lda ($13,x)
$1c:a4fb  18			clc
$1c:a4fc  44 42 11	  mvp $11,$42
$1c:a4ff  11 a4		 ora ($a4),y
$1c:a501  4d c9 e3	  eor $e3c9
$1c:a504  28			plp
$1c:a505  29 89 41	  and #$4189
$1c:a508  28			plp
$1c:a509  e2 32		 sep #$32
$1c:a50b  11 95		 ora ($95),y
$1c:a50d  33 7f		 and ($7f,s),y
$1c:a50f  0c df 99	  tsb $99df
$1c:a512  ca			dex
$1c:a513  15 1a		 ora $1a,x
$1c:a515  85 47		 sta $47
$1c:a517  de 63 00	  dec $0063,x
$1c:a51a  84 56		 sty $56
$1c:a51c  61 15		 adc ($15,x)
$1c:a51e  b3 b9		 lda ($b9,s),y
$1c:a520  42 a3		 wdm #$a3
$1c:a522  b0 a9		 bcs $a4cd
$1c:a524  e3 f4		 sbc $f4,s
$1c:a526  59 01 11	  eor $1101,y
$1c:a529  25 8d		 and $8d
$1c:a52b  0a			asl a
$1c:a52c  11 41		 ora ($41),y
$1c:a52e  a5 4e		 lda $4e
$1c:a530  11 e2		 ora ($e2),y
$1c:a532  ee 07 70	  inc $7007
$1c:a535  24 02		 bit $02
$1c:a537  af 4a a4 52   lda $52a44a
$1c:a53b  ac f5 8e	  ldy $8ef5
$1c:a53e  6c 63 9a	  jmp ($9a63)
$1c:a541  9f 2a 67 b6   sta $b6672a,x
$1c:a545  19 ed 53	  ora $53ed,y
$1c:a548  91 fc		 sta ($fc),y
$1c:a54a  5a			phy
$1c:a54b  04 76		 tsb $76
$1c:a54d  0e 01 2c	  asl $2c01
$1c:a550  76 08		 ror $08,x
$1c:a552  71 44		 adc ($44),y
$1c:a554  07 04		 ora [$04]
$1c:a556  96 3b		 stx $3b,y
$1c:a558  14 38		 trb $38
$1c:a55a  f4 09 63	  pea $6309
$1c:a55d  d1 04		 cmp ($04),y
$1c:a55f  9f 81 a6 14   sta $14a681,x
$1c:a563  aa			tax
$1c:a564  c4 28		 cpy $28
$1c:a566  40			rti
$1c:a567  02 60		 cop #$60
$1c:a569  b0 d6		 bcs $a541
$1c:a56b  3b			tsc
$1c:a56c  b1 8e		 lda ($8e),y
$1c:a56e  ed 33 9b	  sbc $9b33
$1c:a571  0c 53 07	  tsb $0753
$1c:a574  76 18		 ror $18,x
$1c:a576  e2 07		 sep #$07
$1c:a578  40			rti
$1c:a579  a0 c6		 ldy #$c6
$1c:a57b  38			sec
$1c:a57c  b3 7a		 lda ($7a,s),y
$1c:a57e  02 34		 cop #$34
$1c:a580  17 e6		 ora [$e6],y
$1c:a582  8c 08 94	  sty $9408
$1c:a585  22 60 49 15   jsl $154960
$1c:a589  e1 12		 sbc ($12,x)
$1c:a58b  02 04		 cop #$04
$1c:a58d  c3 26		 cmp $26,s
$1c:a58f  d9 36 d9	  cmp $d936,y
$1c:a592  be cd f2	  ldx $f2cd,y
$1c:a595  85 5c		 sta $5c
$1c:a597  21 57		 and ($57,x)
$1c:a599  18			clc
$1c:a59a  56 02		 lsr $02,x
$1c:a59c  15 81		 ora $81,x
$1c:a59e  c5 70		 cmp $70
$1c:a5a0  b1 5c		 lda ($5c),y
$1c:a5a2  31 99		 and ($99),y
$1c:a5a4  20 46 7a	  jsr $7a46
$1c:a5a7  73 18		 adc ($18,s),y
$1c:a5a9  61 04		 adc ($04,x)
$1c:a5ab  50 40		 bvc $a5ed
$1c:a5ad  46 03		 lsr $03
$1c:a5af  a0 10		 ldy #$10
$1c:a5b1  81 a0		 sta ($a0,x)
$1c:a5b3  04 c2		 tsb $c2
$1c:a5b5  d3 42		 cmp ($42,s),y
$1c:a5b7  b6 d0		 ldx $d0,y
$1c:a5b9  a8			tay
$1c:a5ba  ac 2a 0b	  ldy $0b2a
$1c:a5bd  08			php
$1c:a5be  c5 c2		 cmp $c2
$1c:a5c0  31 90		 and ($90),y
$1c:a5c2  8c 94 23	  sty $2394
$1c:a5c5  27 0a		 and [$0a]
$1c:a5c7  92 42		 sta ($42)
$1c:a5c9  a4 a5		 ldy $a5
$1c:a5cb  72 c5		 adc ($c5)
$1c:a5cd  60			rts
$1c:a5ce  31 43		 and ($43),y
$1c:a5d0  60			rts
$1c:a5d1  b8			clv
$1c:a5d2  62 ae 20	  per $c683
$1c:a5d5  d1 66		 cmp ($66),y
$1c:a5d7  03 30		 ora $30,s
$1c:a5d9  22 2e f1 68   jsl $68f12e
$1c:a5dd  03 c0		 ora $c0,s
$1c:a5df  08			php
$1c:a5e0  c0 82		 cpy #$82
$1c:a5e2  22 b0 3c 00   jsl $003cb0
$1c:a5e6  80 8d		 bra $a575
$1c:a5e8  00 8d		 brk #$8d
$1c:a5ea  42 a3		 wdm #$a3
$1c:a5ec  69 33		 adc #$33
$1c:a5ee  81 c2		 sta ($c2,x)
$1c:a5f0  a0 90		 ldy #$90
$1c:a5f2  a8			tay
$1c:a5f3  9c 2a 28	  stz $282a
$1c:a5f6  67 32		 adc [$32]
$1c:a5f8  e1 19		 sbc ($19,x)
$1c:a5fa  04 c6		 tsb $c6
$1c:a5fc  52 e8		 eor ($e8)
$1c:a5fe  04 cb		 tsb $cb
$1c:a600  e0 b7		 cpx #$b7
$1c:a602  1f 89 fd 52   ora $52fd89,x
$1c:a606  c0 c2		 cpy #$c2
$1c:a608  48			pha
$1c:a609  04 43		 tsb $43
$1c:a60b  93 10		 sta ($10,s),y
$1c:a60d  e5 44		 sbc $44
$1c:a60f  3b			tsc
$1c:a610  31 0e		 and ($0e),y
$1c:a612  d5 43		 cmp $43,x
$1c:a614  95 50		 sta $50,x
$1c:a616  e4 d4		 cpx $d4
$1c:a618  1a			inc a
$1c:a619  c1 d9		 cmp ($d9,x)
$1c:a61b  84 61		 sty $61
$1c:a61d  e1 9c		 sbc ($9c,x)
$1c:a61f  87 08		 sta [$08]
$1c:a621  f9 dc 20	  sbc $20dc,y
$1c:a624  df 17 30 e2   cmp $e23017,x
$1c:a628  30 58		 bmi $a682
$1c:a62a  8c 1e 22	  sty $221e
$1c:a62d  e5 88		 sbc $88
$1c:a62f  b9 ad c2	  lda $c2ad,y
$1c:a632  e5 f2		 sbc $f2
$1c:a634  7b			tdc
$1c:a635  94 aa		 sty $aa,x
$1c:a637  69 2a		 adc #$2a
$1c:a639  9a			txs
$1c:a63a  ca			dex
$1c:a63b  a2 72		 ldx #$72
$1c:a63d  a5 30		 lda $30
$1c:a63f  4d 21 53	  eor $5321
$1c:a642  55 19		 eor $19,x
$1c:a644  64 3b		 stz $3b
$1c:a646  39 0e d6	  and $d60e,y
$1c:a649  43 93		 eor $93,s
$1c:a64b  90 e5		 bcc $a632
$1c:a64d  74 3b		 stz $3b,x
$1c:a64f  5d 0e cf	  eor $cf0e,x
$1c:a652  43 95		 eor $95,s
$1c:a654  d0 e4		 bne $a63a
$1c:a656  cc b0 81	  cpy $81b0
$1c:a659  f1 f9		 sbc ($f9),y
$1c:a65b  cc be 8e	  cpy $8ebe
$1c:a65e  50 6f		 bvc $a6cf
$1c:a660  8f a1 da 10   sta $10daa1
$1c:a664  88			dey
$1c:a665  00 bc		 brk #$bc
$1c:a667  7a			ply
$1c:a668  50 8e		 bvc $a5f8
$1c:a66a  9d 22 00	  sta $0022,x
$1c:a66d  37 11		 and [$11],y
$1c:a66f  b0 74		 bcs $a6e5
$1c:a671  91 22		 sta ($22),y
$1c:a673  40			rti
$1c:a674  2c 6c 2b	  bit $2b6c
$1c:a677  37 0a		 and [$0a],y
$1c:a679  ce 42 b5	  dec $b542
$1c:a67c  70 ad		 bvs $a62b
$1c:a67e  65 2a		 adc $2a
$1c:a680  00 4f		 brk #$4f
$1c:a682  1c 69 3c	  trb $3c69
$1c:a685  05 e7		 ora $e7
$1c:a687  6f 2d 86 33   adc $33862d
$1c:a68b  dd 8c f7	  cmp $f78c,x
$1c:a68e  e3 3b		 sbc $3b,s
$1c:a690  d8			cld
$1c:a691  ce fb 14	  dec $14fb
$1c:a694  d8			cld
$1c:a695  c3 08		 cmp $08,s
$1c:a697  f1 42		 sbc ($42),y
$1c:a699  3c 6f 32	  bit $326f,x
$1c:a69c  a4 78		 ldy $78
$1c:a69e  e9 1e		 sbc #$1e
$1c:a6a0  27 99		 and [$99]
$1c:a6a2  0f c7 3a 3f   ora $3f3ac7
$1c:a6a6  28			plp
$1c:a6a7  42 c0		 wdm #$c0
$1c:a6a9  ba			tsx
$1c:a6aa  d0 8f		 bne $a63b
$1c:a6ac  35 2b		 and $2b,x
$1c:a6ae  3a			dec a
$1c:a6af  4f 32 00 5f   eor $5f0032
$1c:a6b3  d2 e2		 cmp ($e2)
$1c:a6b5  40			rti
$1c:a6b6  18			clc
$1c:a6b7  67 7a		 adc [$7a]
$1c:a6b9  19 df 86	  ora $86df,y
$1c:a6bc  7b			tdc
$1c:a6bd  a1 9e		 lda ($9e,x)
$1c:a6bf  f8			sed
$1c:a6c0  67 3a		 adc [$3a]
$1c:a6c2  19 cf 53	  ora $53cf,y
$1c:a6c5  92 2c		 sta ($2c)
$1c:a6c7  a9 19		 lda #$19
$1c:a6c9  aa			tax
$1c:a6ca  46 65		 lsr $65
$1c:a6cc  16 50		 asl $50,x
$1c:a6ce  85 b0		 sta $b0
$1c:a6d0  66 a6		 ror $a6
$1c:a6d2  4f a1 99 75   eor $7599a1
$1c:a6d6  de e0 2f	  dec $2fe0,x
$1c:a6d9  3c 83 2c	  bit $2c83,x
$1c:a6dc  46 03		 lsr $03
$1c:a6de  48			pha
$1c:a6df  c8			iny
$1c:a6e0  b3 51		 lda ($51,s),y
$1c:a6e2  96 39		 stx $39,y
$1c:a6e4  1a			inc a
$1c:a6e5  67 36		 adc [$36]
$1c:a6e7  19 cd a6	  ora $a6cd,y
$1c:a6ea  77 61		 adc [$61],y
$1c:a6ec  9d d9 97	  sta $97d9,x
$1c:a6ef  d6 65		 dec $65,x
$1c:a6f1  f6 73		 inc $73,x
$1c:a6f3  95 2b		 sta $2b,x
$1c:a6f5  55 4a		 eor $4a,x
$1c:a6f7  d4 8f		 pei ($8f)
$1c:a6f9  cd e4 1a	  cmp $1ae4
$1c:a6fc  a4 19		 ldy $19
$1c:a6fe  e8			inx
$1c:a6ff  21 1a		 and ($1a,x)
$1c:a701  16 d9		 asl $d9,x
$1c:a703  42 b4		 wdm #$b4
$1c:a705  00 71		 brk #$71
$1c:a707  20 0d 2b	  jsr $2b0d
$1c:a70a  42 09		 wdm #$09
$1c:a70c  40			rti
$1c:a70d  38			sec
$1c:a70e  84 00		 sty $00
$1c:a710  80 2e		 bra $a740
$1c:a712  32 a6		 and ($a6)
$1c:a714  7b			tdc
$1c:a715  61 9e		 adc ($9e,x)
$1c:a717  d9 97 a6	  cmp $a697,y
$1c:a71a  65 ea		 adc $ea
$1c:a71c  99 7a e6	  sta $e67a,y
$1c:a71f  5e c3 39	  lsr $39c3,x
$1c:a722  45 bc		 eor $bc
$1c:a724  35 6f		 and $6f,x
$1c:a726  08			php
$1c:a727  cc e5 51	  cpy $51e5
$1c:a72a  69 5c		 adc #$5c
$1c:a72c  22 47 48 d1   jsl $d14847
$1c:a730  d2 37		 cmp ($37)
$1c:a732  d4 8d		 pei ($8d)
$1c:a734  eb			xba
$1c:a735  fc 40 00	  jsr ($0040,x)
$1c:a738  04 0c		 tsb $0c
$1c:a73a  83 04		 sta $04,s
$1c:a73c  2e 4c 01	  rol $014c
$1c:a73f  b9 75 c4	  lda $c475,y
$1c:a742  e7 89		 sbc [$89]
$1c:a744  99 62 a9	  sta $a962,y
$1c:a747  11 8a		 ora ($8a),y
$1c:a749  44 5e 91	  mvp $91,$5e
$1c:a74c  27 31		 and [$31]
$1c:a74e  8c 1a 11	  sty $111a
$1c:a751  63 a4		 adc $a4,s
$1c:a753  45 8d		 eor $8d
$1c:a755  20 3b 28	  jsr $283b
$1c:a758  b4 ea		 ldy $ea,x
$1c:a75a  2d 3b 39	  and $393b
$1c:a75d  9f 52 2d d5   sta $d52d52,x
$1c:a761  84 68		 sty $68
$1c:a763  c7 e1		 cmp [$e1]
$1c:a765  08			php
$1c:a766  23 06		 and $06,s
$1c:a768  fa			plx
$1c:a769  11 7f		 ora ($7f),y
$1c:a76b  43 89		 eor $89,s
$1c:a76d  30 66		 bmi $a7d5
$1c:a76f  58			cli
$1c:a770  56 08		 lsr $08,x
$1c:a772  a4 05		 ldy $05
$1c:a774  22 88 f0 a4   jsl $a4f088
$1c:a778  4d d3 e3	  eor $e3d3
$1c:a77b  28			plp
$1c:a77c  a4 51		 ldy $51
$1c:a77e  e9 12		 sbc #$12
$1c:a780  63 48		 adc $48,s
$1c:a782  cd 8d a2	  cmp $a28d
$1c:a785  7c 18 b7	  jmp ($b718,x)
$1c:a788  92 2d		 sta ($2d)
$1c:a78a  e5 59		 sbc $59
$1c:a78c  9f 1a 2d c7   sta $c72d1a,x
$1c:a790  c4 5b		 cpy $5b
$1c:a792  17 e1		 ora [$e1],y
$1c:a794  08			php
$1c:a795  d6 b0		 dec $b0,x
$1c:a797  c1 2a		 cmp ($2a,x)
$1c:a799  74 56		 stz $56,x
$1c:a79b  58			cli
$1c:a79c  20 cd 08	  jsr $08cd
$1c:a79f  24 32		 bit $32
$1c:a7a1  21 94		 and ($94,x)
$1c:a7a3  32 00		 and ($00)
$1c:a7a5  df 48 54 f6   cmp $f65448,x
$1c:a7a9  15 3c		 ora $3c,x
$1c:a7ab  17 9a		 ora [$9a],y
$1c:a7ad  f0 62		 beq $a811
$1c:a7af  d9 68 b6	  cmp $b668,y
$1c:a7b2  5e ac f6	  lsr $f6ac,x
$1c:a7b5  07 a0		 ora [$a0]
$1c:a7b7  3d 05 86	  and $8605,x
$1c:a7ba  50 8b		 bvc $a747
$1c:a7bc  68			pla
$1c:a7bd  0c 12 a4	  tsb $a412
$1c:a7c0  9b			txy
$1c:a7c1  19 60 25	  ora $2560,y
$1c:a7c4  a1 58		 lda ($58,x)
$1c:a7c6  6a			ror a
$1c:a7c7  56 84		 lsr $84,x
$1c:a7c9  5e 4e b1	  lsr $b14e,x
$1c:a7cc  9f 42 b7 54   sta $54b742,x
$1c:a7d0  ac 8d 2a	  ldy $2a8d
$1c:a7d3  7d 4a 76	  adc $764a,x
$1c:a7d6  00 98		 brk #$98
$1c:a7d8  37 50		 and [$50],y
$1c:a7da  cc 44 33	  cpy $3344
$1c:a7dd  51 08		 eor ($08),y
$1c:a7df  b7 8c		 lda [$8c],y
$1c:a7e1  c0 36		 cpy #$36
$1c:a7e3  a2 40		 ldx #$40
$1c:a7e5  91 8f		 sta ($8f),y
$1c:a7e7  c4 7c		 cpy $7c
$1c:a7e9  30 ab		 bmi $a796
$1c:a7eb  f9 1c 07	  sbc $071c,y
$1c:a7ee  e5 08		 sbc $08
$1c:a7f0  eb			xba
$1c:a7f1  42 3c		 wdm #$3c
$1c:a7f3  c3 32		 cmp $32,s
$1c:a7f5  a4 20		 ldy $20
$1c:a7f7  82 7d 08	  brl $b077
$1c:a7fa  46 06		 lsr $06
$1c:a7fc  46 91		 lsr $91
$1c:a7fe  3e 2b 85	  rol $852b,x
$1c:a801  23 22		 and $22,s
$1c:a803  5b			tcd
$1c:a804  08			php
$1c:a805  56 86		 lsr $86,x
$1c:a807  94 18		 sty $18,x
$1c:a809  02 61		 cop #$61
$1c:a80b  5f 61 17 ec   eor $ec1761,x
$1c:a80f  45 d3		 eor $d3
$1c:a811  11 75		 ora ($75),y
$1c:a813  75 8e		 adc $8e,x
$1c:a815  19 d6 46	  ora $46d6,y
$1c:a818  94 14		 sty $14,x
$1c:a81a  8e 6e 15	  stx $156e
$1c:a81d  9c 85 6b	  stz $6b85
$1c:a820  a1 5a		 lda ($5a,x)
$1c:a822  f3 08		 sbc ($08,s),y
$1c:a824  9b			txy
$1c:a825  80 68		 bra $a88f
$1c:a827  31 e9		 and ($e9),y
$1c:a829  1c 7b 6a	  trb $6a7b
$1c:a82c  97 28		 sta [$28],y
$1c:a82e  e5 66		 sbc $66
$1c:a830  39 5b 4f	  and $4f5b,y
$1c:a833  95 7b		 sta $7b,x
$1c:a835  6b			rtl
$1c:a836  5e 91 a9	  lsr $a991,x
$1c:a839  c9 1e		 cmp #$1e
$1c:a83b  54 8d a5	  mvn $a5,$8d
$1c:a83e  23 67		 and $67,s
$1c:a840  08			php
$1c:a841  37 01		 and [$01],y
$1c:a843  88			dey
$1c:a844  e1 9e		 sbc ($9e,x)
$1c:a846  85 f8		 sta $f8
$1c:a848  24 c8		 bit $c8
$1c:a84a  5e 2c 24	  lsr $242c,x
$1c:a84d  60			rts
$1c:a84e  06 21		 asl $21
$1c:a850  26 50		 rol $50
$1c:a852  8c f4 23	  sty $23f4
$1c:a855  3f 08 c9 42   and $42c908,x
$1c:a859  32 6b		 and ($6b)
$1c:a85b  72 2d		 adc ($2d)
$1c:a85d  9a			txs
$1c:a85e  40			rti
$1c:a85f  96 c0		 stx $c0,y
$1c:a861  b4 0e		 ldy $0e,x
$1c:a863  25 23		 and $23
$1c:a865  c4 73		 cpy $73
$1c:a867  28			plp
$1c:a868  67 22		 adc [$22]
$1c:a86a  99 68 86	  sta $8668,y
$1c:a86d  76 31		 ror $31,x
$1c:a86f  97 8a		 sta [$8a],y
$1c:a871  47 9a		 eor [$9a]
$1c:a873  91 d6		 sta ($d6),y
$1c:a875  a4 66		 ldy $66
$1c:a877  a9 19		 lda #$19
$1c:a879  96 79		 stx $79,y
$1c:a87b  2e cf 50	  rol $50cf
$1c:a87e  c1 12		 cmp ($12,x)
$1c:a880  e0 c2		 cpx #$c2
$1c:a882  0a			asl a
$1c:a883  05 99		 ora $99
$1c:a885  84 66		 sty $66
$1c:a887  86 ea		 stx $ea
$1c:a889  6e 0f 14	  ror $140f
$1c:a88c  23 88		 and $88,s
$1c:a88e  73 3a		 adc ($3a,s),y
$1c:a890  64 2a		 stz $2a
$1c:a892  9b			txy
$1c:a893  0a			asl a
$1c:a894  ae 42 ab	  ldx $ab42
$1c:a897  a2 f1		 ldx #$f1
$1c:a899  af 0c c6 dd   lda $ddc60c
$1c:a89d  4a			lsr a
$1c:a89e  d9 52 b5	  cmp $b552,y
$1c:a8a1  27 b3		 and [$b3]
$1c:a8a3  d0 c2		 bne $a867
$1c:a8a5  b4 02		 ldy $02,x
$1c:a8a7  13 25		 ora ($25,s),y
$1c:a8a9  01 20		 ora ($20,x)
$1c:a8ab  04 44		 tsb $44
$1c:a8ad  42 0d		 wdm #$0d
$1c:a8af  90 84		 bcc $a835
$1c:a8b1  a1 96		 lda ($96,x)
$1c:a8b3  88			dey
$1c:a8b4  46 1c		 lsr $1c
$1c:a8b6  1e 3c 88	  asl $883c,x
$1c:a8b9  45 ee		 eor $ee
$1c:a8bb  11 7c		 ora ($7c),y
$1c:a8bd  6d 94 2a	  adc $2a94
$1c:a8c0  d9 0a b6	  cmp $b60a,y
$1c:a8c3  88			dey
$1c:a8c4  4c e0 15	  jmp $15e0
$1c:a8c7  f2 d9		 sbc ($d9)
$1c:a8c9  b2 03		 lda ($03)
$1c:a8cb  50 e3		 bvc $a8b0
$1c:a8cd  17 20		 ora [$20],y
$1c:a8cf  38			sec
$1c:a8d0  11 0c		 ora ($0c),y
$1c:a8d2  94 40		 sty $40,x
$1c:a8d4  6a			ror a
$1c:a8d5  2e dd 08	  rol $08dd
$1c:a8d8  59 56 08	  eor $0856,y
$1c:a8db  cc dc a0	  cpy $a0dc
$1c:a8de  1f 5c a3 6c   ora $6ca35c,x
$1c:a8e2  e9 d0		 sbc #$d0
$1c:a8e4  8a			txa
$1c:a8e5  78			sei
$1c:a8e6  84 f2		 sty $f2
$1c:a8e8  b4 a7		 ldy $a7,x
$1c:a8ea  00 37		 brk #$37
$1c:a8ec  0b			phd
$1c:a8ed  1d 08 c7	  ora $c708,x
$1c:a8f0  97 c1		 sta [$c1],y
$1c:a8f2  ee 10 cb	  inc $cb10
$1c:a8f5  c3 ec		 cmp $ec,s
$1c:a8f7  29 9b		 and #$9b
$1c:a8f9  80 78		 bra $a973
$1c:a8fb  52 01		 eor ($01)
$1c:a8fd  82 49 12	  brl $bb49
$1c:a900  52 50		 eor ($50)
$1c:a902  ca			dex
$1c:a903  29 1e		 and #$1e
$1c:a905  77 06		 adc [$06],y
$1c:a907  95 de		 sta $de,x
$1c:a909  3b			tsc
$1c:a90a  58			cli
$1c:a90b  e5 66		 sbc $66
$1c:a90d  39 5b 7b	  and $7b5b,y
$1c:a910  95 7b		 sta $7b,x
$1c:a912  4b			phk
$1c:a913  5e 91 d7	  lsr $d791,x
$1c:a916  b6 a0		 ldx $a0,y
$1c:a918  10 86		 bpl $a8a0
$1c:a91a  66 00		 ror $00
$1c:a91c  e3 78		 sbc $78,s
$1c:a91e  c6 35		 dec $35
$1c:a920  05 a2		 ora $a2
$1c:a922  2d 20 08	  and $0820
$1c:a925  01 90		 ora ($90,x)
$1c:a927  37 0a		 and [$0a],y
$1c:a929  31 c8		 and ($c8),y
$1c:a92b  84 57		 sty $57
$1c:a92d  ce d1 10	  dec $10d1
$1c:a930  40			rti
$1c:a931  05 85		 ora $85
$1c:a933  66 45		 ror $45
$1c:a935  31 9f		 and ($9f),y
$1c:a937  ae c8 d6	  ldx $d6c8
$1c:a93a  6c 41 a5	  jmp ($a541)
$1c:a93d  4f d8 a3 79   eor $79a3d8
$1c:a941  84 5e		 sty $5e
$1c:a943  a1 0b		 lda ($0b,x)
$1c:a945  82 c3 d3	  brl $7d0b
$1c:a948  1a			inc a
$1c:a949  04 80		 tsb $80
$1c:a94b  06 81		 asl $81
$1c:a94d  36 00		 rol $00,x
$1c:a94f  4c 02 60	  jmp $6002
$1c:a952  08			php
$1c:a953  02 80		 cop #$80
$1c:a955  44 a2 08	  mvp $08,$a2
$1c:a958  05 00		 ora $00
$1c:a95a  6a			ror a
$1c:a95b  18			clc
$1c:a95c  a1 0a		 lda ($0a,x)
$1c:a95e  9f 1b c6 5a   sta $5ac61b,x
$1c:a962  f7 6a		 sbc [$6a],y
$1c:a964  51 c8		 eor ($c8),y
$1c:a966  69 52		 adc #$52
$1c:a968  d6 28		 dec $28,x
$1c:a96a  47 2b		 eor [$2b]
$1c:a96c  48			pha
$1c:a96d  74 99		 stz $99,x
$1c:a96f  7c a5 50	  jmp ($50a5,x)
$1c:a972  04 79		 tsb $79
$1c:a974  33 c4		 and ($c4,s),y
$1c:a976  20 0d 80	  jsr $800d
$1c:a979  32 00		 and ($00)
$1c:a97b  20 83 00	  jsr $0083
$1c:a97e  56 00		 lsr $00,x
$1c:a980  40			rti
$1c:a981  16 00		 asl $00,x
$1c:a983  30 34		 bmi $a9b9
$1c:a985  ed fc 3b	  sbc $3bfc
$1c:a988  7e af 28	  ror $28af,x
$1c:a98b  87 fa		 sta [$fa]
$1c:a98d  a1 fe		 lda ($fe,x)
$1c:a98f  c8			iny
$1c:a990  7f ba 1f e9   adc $e91fba,x
$1c:a994  97 c2		 sta [$c2],y
$1c:a996  44 92 0f	  mvp $0f,$92
$1c:a999  8b			phb
$1c:a99a  04 20		 tsb $20
$1c:a99c  df 7a 37 de   cmp $de377a,x
$1c:a9a0  0d f8 a3	  ora $a3f8
$1c:a9a3  7e 20 df	  ror $df20,x
$1c:a9a6  9a			txs
$1c:a9a7  37 e6		 and [$e6],y
$1c:a9a9  0d fa a3	  ora $a3fa
$1c:a9ac  7e a0 9f	  ror $9fa0,x
$1c:a9af  fa			plx
$1c:a9b0  27 ff		 and [$ff]
$1c:a9b2  09 ff		 ora #$ff
$1c:a9b4  e2 7f		 sep #$7f
$1c:a9b6  e0 9f		 cpx #$9f
$1c:a9b8  ca			dex
$1c:a9b9  27 f3		 and [$f3]
$1c:a9bb  09 fc		 ora #$fc
$1c:a9bd  e2 7f		 sep #$7f
$1c:a9bf  20 9f ba	  jsr $ba9f
$1c:a9c2  27 ef		 and [$ef]
$1c:a9c4  09 fb		 ora #$fb
$1c:a9c6  e2 7e		 sep #$7e
$1c:a9c8  c0 df		 cpy #$df
$1c:a9ca  0a			asl a
$1c:a9cb  9d 4e 3f	  sta $3f4e,x
$1c:a9ce  93 88		 sta ($88,s),y
$1c:a9d0  b4 e6		 ldy $e6,x
$1c:a9d2  61 39		 adc ($39,x)
$1c:a9d4  a1 4e		 lda ($4e,x)
$1c:a9d6  6b			rtl
$1c:a9d7  93 9b		 sta ($9b,s),y
$1c:a9d9  b4 e7		 ldy $e7,x
$1c:a9db  01 39		 ora ($39,x)
$1c:a9dd  cd 4e 76	  cmp $764e
$1c:a9e0  93 9d		 sta ($9d,s),y
$1c:a9e2  f4 e7 b1	  pea $b1e7
$1c:a9e5  39 f9 4e	  and $4ef9,y
$1c:a9e8  7f 93 98 b4   adc $b49893,x
$1c:a9ec  ea			nop
$1c:a9ed  61 3a		 adc ($3a,x)
$1c:a9ef  07 05		 ora [$05]
$1c:a9f1  52 75		 eor ($75)
$1c:a9f3  6e 9d 5e	  ror $5e9d
$1c:a9f6  27 59		 and [$59]
$1c:a9f8  29 d4		 and #$d4
$1c:a9fa  52 77		 eor ($77)
$1c:a9fc  86 9d		 stx $9d
$1c:a9fe  e6 27		 inc $27
$1c:aa00  7b			tdc
$1c:aa01  a9 df		 lda #$df
$1c:aa03  32 77		 and ($77)
$1c:aa05  de 9d fc	  dec $fc9d,x
$1c:aa08  27 7f		 and [$7f]
$1c:aa0a  a9 dc		 lda #$dc
$1c:aa0c  00 52		 brk #$52
$1c:aa0e  76 49		 ror $49,x
$1c:aa10  e0 a4		 cpx #$a4
$1c:aa12  a0 22		 ldy #$22
$1c:aa14  e5 16		 sbc $16
$1c:aa16  f8			sed
$1c:aa17  fb			xce
$1c:aa18  c9 fd		 cmp #$fd
$1c:aa1a  28			plp
$1c:aa1b  9e 96 4b	  stz $4b96,x
$1c:aa1e  fd ff 37	  sbc $37ff,x
$1c:aa21  a1 b7		 lda ($b7,x)
$1c:aa23  cf de 8f ee   cmp $ee8fde
$1c:aa27  f2 40		 sbc ($40)
$1c:aa29  ca			dex
$1c:aa2a  a0 af		 ldy #$af
$1c:aa2c  45 6f		 eor $6f
$1c:aa2e  af bd 9f 1f   lda $1f9fbd
$1c:aa32  ff fc 0c b4   sbc $b40cfc,x
$1c:aa36  ae b4 c4	  ldx $c4b4
$1c:aa39  cf dd 69 2e   cmp $2e69dd
$1c:aa3d  9f ba 58 02   sta $0258ba,x
$1c:aa41  0f 34 95 50   ora $509534
$1c:aa45  1e 69 94	  asl $9469,x
$1c:aa48  9f 3a 58 36   sta $36583a,x
$1c:aa4c  00 d6		 brk #$d6
$1c:aa4e  01 f6		 ora ($f6,x)
$1c:aa50  25 f4		 and $f4
$1c:aa52  af 10 74 a1   lda $a17410
$1c:aa56  94 a0		 sty $a0,x
$1c:aa58  49 91		 eor #$91
$1c:aa5a  29 83		 and #$83
$1c:aa5c  c4 1a		 cpy $1a
$1c:aa5e  a0 99		 ldy #$99
$1c:aa60  07 98		 ora [$98]
$1c:aa62  11 da		 ora ($da),y
$1c:aa64  08			php
$1c:aa65  46 32		 lsr $32
$1c:aa67  db			stp
$1c:aa68  14 d8		 trb $d8
$1c:aa6a  96 ce		 stx $ce,y
$1c:aa6c  94 74		 sty $74,x
$1c:aa6e  80 6c		 bra $aadc
$1c:aa70  0a			asl a
$1c:aa71  65 fe		 adc $fe
$1c:aa73  ff 86 c0 b6   sbc $b6c086,x
$1c:aa77  5f d4 b0 ba   eor $bab0d4,x
$1c:aa7b  53 f8		 eor ($f8,s),y
$1c:aa7d  9e 34 cb	  stz $cb34,x
$1c:aa80  24 59		 bit $59
$1c:aa82  12 ce		 ora ($ce)
$1c:aa84  92 74		 sta ($74)
$1c:aa86  83 fc		 sta $fc,s
$1c:aa88  8a			txa
$1c:aa89  60			rts
$1c:aa8a  95 07		 sta $07,x
$1c:aa8c  f9 13 c1	  sbc $c113,y
$1c:aa8f  3a			dec a
$1c:aa90  0f f6 53 83   ora $8353f6
$1c:aa94  fd 1a ec	  sbc $ec1a,x
$1c:aa97  cf 66 3b 31   cmp $313b66
$1c:aa9b  50 9e		 bvc $aa3b
$1c:aa9d  03 f0		 ora $f0,s
$1c:aa9f  67 91		 adc [$91]
$1c:aaa1  4c 07 e0	  jmp $e007
$1c:aaa4  d7 22		 cmp [$22],y
$1c:aaa6  08			php
$1c:aaa7  0f c1 be 86   ora $86bec1
$1c:aaab  90 0d		 bcc $aaba
$1c:aaad  90 55		 bcc $ab04
$1c:aaaf  81 ac		 sta ($ac,x)
$1c:aab1  05 66		 ora $66
$1c:aab3  2a			rol a
$1c:aab4  21 c2		 and ($c2,x)
$1c:aab6  55 40		 eor $40,x
$1c:aab8  67 92		 adc [$92]
$1c:aaba  54 09 20	  mvn $20,$09
$1c:aabd  d7 24		 cmp [$24],y
$1c:aabf  e8			inx
$1c:aac0  12 41		 ora ($41)
$1c:aac2  be 8a 70	  ldx $708a,y
$1c:aac5  2c 91 4d	  bit $4d91
$1c:aac8  89 6c		 bit #$6c
$1c:aaca  43 65		 eor $65,s
$1c:aacc  08			php
$1c:aacd  2d 49 7c	  and $7c49
$1c:aad0  1c 42 90	  trb $9042
$1c:aad3  af 81 7a 08   lda $087a81
$1c:aad7  72 14		 adc ($14)
$1c:aad9  82 d4 10	  brl $bbb0
$1c:aadc  e4 b5		 cpx $b5
$1c:aade  01 48		 ora ($48,x)
$1c:aae0  25 d1		 and $d1
$1c:aae2  7c 1d 94	  jmp ($941d,x)
$1c:aae5  c1 80		 cmp ($80,x)
$1c:aae7  c3 dc		 cmp $dc,s
$1c:aae9  90 35		 bcc $ab20
$1c:aaeb  6a			ror a
$1c:aaec  29 01		 and #$01
$1c:aaee  5a			phy
$1c:aaef  48			pha
$1c:aaf0  14 5b		 trb $5b
$1c:aaf2  a0 14		 ldy #$14
$1c:aaf4  15 e4		 ora $e4,x
$1c:aaf6  7f 25 79 1c   adc $1c7925,x
$1c:aafa  c0 52		 cpy #$52
$1c:aafc  0d 74 52	  ora $5274
$1c:aaff  a1 cc		 lda ($cc,x)
$1c:ab01  00 60		 brk #$60
$1c:ab03  87 22		 sta [$22]
$1c:ab05  29 21		 and #$21
$1c:ab07  d1 da		 cmp ($da),y
$1c:ab09  44 12 52	  mvp $52,$12
$1c:ab0c  02 8c		 cop #$8c
$1c:ab0e  20 74 11	  jsr $1174
$1c:ab11  ca			dex
$1c:ab12  02 41		 cop #$41
$1c:ab14  56 4c		 lsr $4c,x
$1c:ab16  b1 09		 lda ($09),y
$1c:ab18  2c 60 24	  bit $2460
$1c:ab1b  b2 d0		 lda ($d0)
$1c:ab1d  51 90		 eor ($90),y
$1c:ab1f  40			rti
$1c:ab20  52 08		 eor ($08)
$1c:ab22  14 14		 trb $14
$1c:ab24  90 14		 bcc $ab3a
$1c:ab26  85 24		 sta $24
$1c:ab28  91 21		 sta ($21),y
$1c:ab2a  89 22		 bit #$22
$1c:ab2c  48			pha
$1c:ab2d  92 c2		 sta ($c2)
$1c:ab2f  12 44		 ora ($44)
$1c:ab31  99 08 c0	  sta $c008,y
$1c:ab34  22 32 50 48   jsl $485032
$1c:ab38  03 49		 ora $49,s
$1c:ab3a  86 54		 stx $54
$1c:ab3c  2a			rol a
$1c:ab3d  09 d5		 ora #$d5
$1c:ab3f  2b			pld
$1c:ab40  c7 25		 cmp [$25]
$1c:ab42  51 81		 eor ($81),y
$1c:ab44  ed 04 60	  sbc $6004
$1c:ab47  83 04		 sta $04,s
$1c:ab49  3a			dec a
$1c:ab4a  5e 91 ce	  lsr $ce91,x
$1c:ab4d  73 69		 adc ($69,s),y
$1c:ab4f  15 08		 ora $08,x
$1c:ab51  ea			nop
$1c:ab52  90 da		 bcc $ab2e
$1c:ab54  11 cd		 ora ($cd),y
$1c:ab56  ac 2b 05	  ldy $052b
$1c:ab59  9b			txy
$1c:ab5a  ae 1f 6a	  ldx $6a1f
$1c:ab5d  b0 5c		 bcs $abbb
$1c:ab5f  5a			phy
$1c:ab60  e0 40		 cpx #$40
$1c:ab62  61 fc		 adc ($fc,x)
$1c:ab64  13 0c		 ora ($0c,s),y
$1c:ab66  ba			tsx
$1c:ab67  7e 73 64	  ror $6473,x
$1c:ab6a  ea			nop
$1c:ab6b  20 03 1e	  jsr $1e03
$1c:ab6e  7c 5d 21	  jmp ($215d,x)
$1c:ab71  f1 77		 sbc ($77),y
$1c:ab73  27 c5		 and [$c5]
$1c:ab75  ea			nop
$1c:ab76  9f 17 e2 08   sta $08e217,x
$1c:ab7a  d0 3b		 bne $abb7
$1c:ab7c  3f d9 ee ce   and $ceeed9,x
$1c:ab80  f6 4a		 inc $4a,x
$1c:ab82  a1 e4		 lda ($e4,x)
$1c:ab84  90 a1		 bcc $ab27
$1c:ab86  16 80		 asl $80,x
$1c:ab88  4d 60 12	  eor $1260
$1c:ab8b  c8			iny
$1c:ab8c  04 32		 tsb $32
$1c:ab8e  01 20		 ora ($20,x)
$1c:ab90  2d 0c 69	  and $690c
$1c:ab93  00 11		 brk #$11
$1c:ab95  e9 2c		 sbc #$2c
$1c:ab97  02 61		 cop #$61
$1c:ab99  11 40		 ora ($40),y
$1c:ab9b  04 96		 tsb $96
$1c:ab9d  3c 64 1a	  bit $1a64,x
$1c:aba0  01 84		 ora ($84,x)
$1c:aba2  61 12		 adc ($12,x)
$1c:aba4  89 09		 bit #$09
$1c:aba6  9c 8e 42	  stz $428e
$1c:aba9  6e 28 84	  ror $8428
$1c:abac  82 62 67	  brl $1311
$1c:abaf  24 00		 bit $00
$1c:abb1  d0 20		 bne $abd3
$1c:abb3  31 69		 and ($69),y
$1c:abb5  2c 62 20	  bit $2062
$1c:abb8  6e 08 0c	  ror $0c08
$1c:abbb  96 2c		 stx $2c,y
$1c:abbd  8e 13 70	  stx $7013
$1c:abc0  45 a5		 eor $a5
$1c:abc2  b2 88		 lda ($88)
$1c:abc4  45 80		 eor $80
$1c:abc6  98			tya
$1c:abc7  12 d8		 ora ($d8)
$1c:abc9  b2 70		 lda ($70)
$1c:abcb  4d c4 9c	  eor $9cc4
$1c:abce  0b			phd
$1c:abcf  09 9c		 ora #$9c
$1c:abd1  95 42		 sta $42,x
$1c:abd3  6e 29 84	  ror $8429
$1c:abd6  02 e2		 cop #$e2
$1c:abd8  67 25		 adc [$25]
$1c:abda  c0 a2		 cpy #$a2
$1c:abdc  82 21 2b	  brl $d700
$1c:abdf  83 c8		 sta $c8,s
$1c:abe1  60			rts
$1c:abe2  89 10		 bit #$10
$1c:abe4  95 c4		 sta $c4,x
$1c:abe6  18			clc
$1c:abe7  c2 6e		 rep #$6e
$1c:abe9  08			php
$1c:abea  84 ce		 sty $ce
$1c:abec  2f 19 92 13   and $139219
$1c:abf0  02 67		 cop #$67
$1c:abf2  10 6a		 bpl $ac5e
$1c:abf4  09 b8 23	  ora #$23b8
$1c:abf7  12 b6		 ora ($b6)
$1c:abf9  a0 18		 ldy #$18
$1c:abfb  c2 01		 rep #$01
$1c:abfd  2b			pld
$1c:abfe  8c 38 85	  sty $8538
$1c:ac01  14 10		 trb $10
$1c:ac03  09 dc 22	  ora #$22dc
$1c:ac06  41 02		 eor ($02,x)
$1c:ac08  48			pha
$1c:ac09  84 ee		 sty $ee
$1c:ac0b  00 f0		 brk #$f0
$1c:ac0d  13 70		 ora ($70,s),y
$1c:ac0f  40			rti
$1c:ac10  28			plp
$1c:ac11  71 88		 adc ($88),y
$1c:ac13  c4 89		 cpy $89
$1c:ac15  f6 2d		 inc $2d,x
$1c:ac17  f0 7f		 beq $ac98
$1c:ac19  81 b8		 sta ($b8,x)
$1c:ac1b  21 13		 and ($13,x)
$1c:ac1d  b7 f0		 lda [$f0],y
$1c:ac1f  48			pha
$1c:ac20  c9 80 ef	  cmp #$ef80
$1c:ac23  00 60		 brk #$60
$1c:ac25  d0 20		 bne $ac47
$1c:ac27  b0 06		 bcs $ac2f
$1c:ac29  b0 15		 bcs $ac40
$1c:ac2b  c2 1a		 rep #$1a
$1c:ac2d  5a			phy
$1c:ac2e  38			sec
$1c:ac2f  c1 30		 cmp ($30,x)
$1c:ac31  21 b1		 and ($b1,x)
$1c:ac33  48			pha
$1c:ac34  04 c4		 tsb $c4
$1c:ac36  cc 31 40	  cpy $4031
$1c:ac39  e8			inx
$1c:ac3a  0a			asl a
$1c:ac3b  40			rti
$1c:ac3c  dc 02 60	  jml [$6002]
$1c:ac3f  84 4a		 sty $4a
$1c:ac41  4e 82 2d	  lsr $2d82
$1c:ac44  01 b0		 ora ($b0,x)
$1c:ac46  8c 8a 21	  sty $218a
$1c:ac49  21 41		 and ($41,x)
$1c:ac4b  08			php
$1c:ac4c  ec 08 82	  cpx $8208
$1c:ac4f  8a			txa
$1c:ac50  08			php
$1c:ac51  2c 52 30	  bit $3052
$1c:ac54  6d 18 0c	  adc $0c18
$1c:ac57  52 0a		 eor ($0a)
$1c:ac59  52 13		 eor ($13)
$1c:ac5b  70 41		 bvs $ac9e
$1c:ac5d  63 92		 adc $92,s
$1c:ac5f  88			dey
$1c:ac60  4a			lsr a
$1c:ac61  78			sei
$1c:ac62  63 90		 adc $90,s
$1c:ac64  53 00		 eor ($00,s),y
$1c:ac66  8c 88 c0	  sty $c088
$1c:ac69  0a			asl a
$1c:ac6a  c1 1d		 cmp ($1d,x)
$1c:ac6c  81 b8		 sta ($b8,x)
$1c:ac6e  46 45		 lsr $45
$1c:ac70  30 80		 bmi $abf2
$1c:ac72  ae 84 76	  ldx $7684
$1c:ac75  07 c1		 ora [$c1]
$1c:ac77  04 0c		 tsb $0c
$1c:ac79  64 88		 stz $88
$1c:ac7b  00 30		 brk #$30
$1c:ac7d  80 46		 bra $acc5
$1c:ac7f  61 08		 adc ($08,x)
$1c:ac81  a1 76		 lda ($76,x)
$1c:ac83  0c 64 a4	  tsb $a464
$1c:ac86  15 22		 ora $22,x
$1c:ac88  a8			tay
$1c:ac89  46 5b		 lsr $5b
$1c:ac8b  e0 99 07	  cpx #$0799
$1c:ac8e  d0 c8		 bne $ac58
$1c:ac90  4c 01 72	  jmp $7201
$1c:ac93  51 8c		 eor ($8c),y
$1c:ac95  01 4c		 ora ($4c,x)
$1c:ac97  28			plp
$1c:ac98  62 30 05	  per $b1cb
$1c:ac9b  cd 1a 52	  cmp $521a
$1c:ac9e  98			tya
$1c:ac9f  45 cd		 eor $cd
$1c:aca1  0c 47 c0	  tsb $c047
$1c:aca4  c1 a3		 cmp ($a3,x)
$1c:aca6  48			pha
$1c:aca7  8c 18 3a	  sty $3a18
$1c:acaa  04 2e		 tsb $2e
$1c:acac  01 2a		 ora ($2a,x)
$1c:acae  0d 0c 30	  ora $300c
$1c:acb1  3c d1 38	  bit $38d1,x
$1c:acb4  d4 02		 pei ($02)
$1c:acb6  60			rts
$1c:acb7  2a			rol a
$1c:acb8  18			clc
$1c:acb9  d4 4d		 pei ($4d)
$1c:acbb  bc 27 80	  ldy $8027,x
$1c:acbe  6e 04 22	  ror $2204
$1c:acc1  50 38		 bvc $acfb
$1c:acc3  17 18		 ora [$18],y
$1c:acc5  3b			tsc
$1c:acc6  05 d0		 ora $d0
$1c:acc8  51 09		 eor ($09),y
$1c:acca  01 18		 ora ($18,x)
$1c:accc  5c 60 fa 12   jml $12fa60
$1c:acd0  70 42		 bvs $ad14
$1c:acd2  e3 51		 sbc $51,s
$1c:acd4  88			dey
$1c:acd5  81 50		 sta ($50,x)
$1c:acd7  63 50		 adc $50,s
$1c:acd9  b0 40		 bcs $ad1b
$1c:acdb  9e 02 17	  stz $1702,x
$1c:acde  22 94 42 0c   jsl $0c4294
$1c:ace2  43 22		 eor $22,s
$1c:ace4  85 85		 sta $85
$1c:ace6  85 d0		 sta $d0
$1c:ace8  41 60		 eor ($60,x)
$1c:acea  38			sec
$1c:aceb  0b			phd
$1c:acec  8c 04 82	  sty $8204
$1c:acef  e8			inx
$1c:acf0  29 84 00	  and #$0084
$1c:acf3  fc 2e 30	  jsr ($302e,x)
$1c:acf6  19 09 38	  ora $3809,y
$1c:acf9  21 11		 and ($11,x)
$1c:acfb  d8			cld
$1c:acfc  74 6b		 stz $6b,x
$1c:acfe  22 55 08 ec   jsl $ec0855
$1c:ad02  20 80 29	  jsr $2980
$1c:ad05  41 92		 eor ($92,x)
$1c:ad07  c7 a1		 cmp [$a1]
$1c:ad09  5b			tcd
$1c:ad0a  04 d8		 tsb $d8
$1c:ad0c  49 60 04	  eor #$0460
$1c:ad0f  e1 3c		 sbc ($3c,x)
$1c:ad11  04 42		 tsb $42
$1c:ad13  3b			tsc
$1c:ad14  1e 89 6c	  asl $6c89,x
$1c:ad17  83 21		 sta $21,s
$1c:ad19  1e 87 97	  asl $9787,x
$1c:ad1c  05 44		 ora $44
$1c:ad1e  32 d8		 and ($d8)
$1c:ad20  74 8b		 stz $8b,x
$1c:ad22  20 67 18	  jsr $1867
$1c:ad25  01 a8		 ora ($a8,x)
$1c:ad27  4c c5 16	  jmp $16c5
$1c:ad2a  8d 68 0d	  sta $0d68
$1c:ad2d  a4 78		 ldy $78
$1c:ad2f  1a			inc a
$1c:ad30  04 5e		 tsb $5e
$1c:ad32  01 38		 ora ($38,x)
$1c:ad34  68			pla
$1c:ad35  3c 50 32	  bit $3250,x
$1c:ad38  12 09		 ora ($09)
$1c:ad3a  3b			tsc
$1c:ad3b  94 2f		 sty $2f,x
$1c:ad3d  62 e0 93	  per $4120
$1c:ad40  b5 c1		 lda $c1,x
$1c:ad42  2a			rol a
$1c:ad43  09 02 76	  ora #$7602
$1c:ad46  06 2d		 asl $2d
$1c:ad48  2e 4a 21	  rol $214a
$1c:ad4b  21 84		 and ($84,x)
$1c:ad4d  62 4f 10	  per $bd9f
$1c:ad50  8c 66 c0	  sty $c066
$1c:ad53  81 27		 sta ($27,x)
$1c:ad55  07 84		 ora [$84]
$1c:ad57  63 36		 adc $36,s
$1c:ad59  51 09		 eor ($09),y
$1c:ad5b  bc 21 60	  ldy $6021,x
$1c:ad5e  19 d2 88	  ora $88d2,y
$1c:ad61  42 26		 wdm #$26
$1c:ad63  eb			xba
$1c:ad64  e1 17		 sbc ($17,x)
$1c:ad66  03 10		 ora $10,s
$1c:ad68  14 41		 trb $41
$1c:ad6a  8d 83 16	  sta $1683
$1c:ad6d  41 78		 eor ($78,x)
$1c:ad6f  0c d0 a3	  tsb $a3d0
$1c:ad72  2d 05 50	  and $5005
$1c:ad75  1b			tcs
$1c:ad76  b5 61		 lda $61,x
$1c:ad78  36 85		 rol $85,x
$1c:ad7a  90 52		 bcc $adce
$1c:ad7c  08			php
$1c:ad7d  86 f4		 stx $f4
$1c:ad7f  32 0d		 and ($0d)
$1c:ad81  10 74		 bpl $adf7
$1c:ad83  08			php
$1c:ad84  b8			clv
$1c:ad85  21 13		 and ($13,x)
$1c:ad87  f7 40		 sbc [$40],y
$1c:ad89  6f 85 c1 3f   adc $3fc185
$1c:ad8d  84 3d		 sty $3d
$1c:ad8f  84 32		 sty $32
$1c:ad91  14 78		 trb $78
$1c:ad93  04 62		 tsb $62
$1c:ad95  31 af		 and ($af),y
$1c:ad97  0c 80 04	  tsb $0480
$1c:ad9a  00 82		 brk #$82
$1c:ad9c  97 21		 sta [$21],y
$1c:ad9e  c8			iny
$1c:ad9f  76 d3		 ror $d3,x
$1c:ada1  c4 12		 cpy $12
$1c:ada3  1a			inc a
$1c:ada4  07 e3		 ora [$e3]
$1c:ada6  ff 28 80 07   sbc $078028,x
$1c:adaa  c2 20		 rep #$20
$1c:adac  8a			txa
$1c:adad  38			sec
$1c:adae  59 44 04	  eor $0444,y
$1c:adb1  60			rts
$1c:adb2  20 09 b8	  jsr $b809
$1c:adb5  a8			tay
$1c:adb6  96 01		 stx $01,y
$1c:adb8  57 15		 eor [$15],y
$1c:adba  12 a0		 ora ($a0)
$1c:adbc  2e ee b1	  rol $b1ee
$1c:adbf  84 04		 sty $04
$1c:adc1  83 2e		 sta $2e,s
$1c:adc3  9e 08 c2	  stz $c208,x
$1c:adc6  50 20		 bvc $ade8
$1c:adc8  19 84 f0	  ora $f084,y
$1c:adcb  2f 41 28 13   and $132841
$1c:adcf  62 69 28	  per $d63b
$1c:add2  82 8c 07	  brl $b561
$1c:add5  18			clc
$1c:add6  c2 88		 rep #$88
$1c:add8  28			plp
$1c:add9  ad d0 76	  lda $76d0
$1c:addc  04 42		 tsb $42
$1c:adde  31 55		 and ($55),y
$1c:ade0  31 12		 and ($12),y
$1c:ade2  a0 2e a4	  ldy #$a42e
$1c:ade5  d2 09		 cmp ($09)
$1c:ade7  06 59		 asl $59
$1c:ade9  e6 10		 inc $10
$1c:adeb  09 c4 02	  ora #$02c4
$1c:adee  57 00		 eor [$00],y
$1c:adf0  86 89		 stx $89
$1c:adf2  0e 2a 62	  asl $622a
$1c:adf5  10 90		 bpl $ad87
$1c:adf7  4a			lsr a
$1c:adf8  0f 00 2b 01   ora $012b00
$1c:adfc  38			sec
$1c:adfd  4a			lsr a
$1c:adfe  21 4d		 and ($4d,x)
$1c:ae00  d0 7b		 bne $ae7d
$1c:ae02  00 b8		 brk #$b8
$1c:ae04  21 85		 and ($85,x)
$1c:ae06  c0 98 42	  cpy #$4298
$1c:ae09  0b			phd
$1c:ae0a  01 1e		 ora ($1e,x)
$1c:ae0c  46 11		 lsr $11
$1c:ae0e  98			tya
$1c:ae0f  25 44		 and $44
$1c:ae11  d1 98		 cmp ($98),y
$1c:ae13  01 02		 ora ($02,x)
$1c:ae15  72 eb		 adc ($eb)
$1c:ae17  19 43 d8	  ora $d843,y
$1c:ae1a  29 4d d1	  and #$d14d
$1c:ae1d  6c 8d 2d	  jmp ($2d8d)
$1c:ae20  5e 48 a0	  lsr $a048,x
$1c:ae23  ad 2b c8	  lda $c82b
$1c:ae26  24 16		 bit $16
$1c:ae28  a2 e0 84	  ldx #$84e0
$1c:ae2b  46 d6		 lsr $d6
$1c:ae2d  9a			txs
$1c:ae2e  20 90 5b	  jsr $5b90
$1c:ae31  8b			phb
$1c:ae32  80 7a		 bra $aeae
$1c:ae34  00 90		 brk #$90
$1c:ae36  5b			tcd
$1c:ae37  db			stp
$1c:ae38  24 8a		 bit $8a
$1c:ae3a  0a			asl a
$1c:ae3b  fb			xce
$1c:ae3c  64 9f		 stz $9f
$1c:ae3e  a1 4f		 lda ($4f,x)
$1c:ae40  49 90 d4	  eor #$d490
$1c:ae43  25 89		 and $89
$1c:ae45  a2 88 48	  ldx #$4888
$1c:ae48  25 c9		 and $c9
$1c:ae4a  a2 56 04	  ldx #$0456
$1c:ae4d  f9 b2 4a	  sbc $4ab2,y
$1c:ae50  c0 9f ad	  cpy #$ad9f
$1c:ae53  81 14		 sta ($14,x)
$1c:ae55  0b			phd
$1c:ae56  a0 a6 aa	  ldy #$aaa6
$1c:ae59  09 f2 12	  ora #$12f2
$1c:ae5c  93 b8		 sta ($b8,s),y
$1c:ae5e  92 82		 sta ($82)
$1c:ae60  5b			tcd
$1c:ae61  00 85		 brk #$85
$1c:ae63  9f ce 28 0a   sta $0a28ce,x
$1c:ae67  12 e0		 ora ($e0)
$1c:ae69  4a			lsr a
$1c:ae6a  35 29		 and $29,x
$1c:ae6c  a1 35		 lda ($35,x)
$1c:ae6e  8f 28 52 2f   sta $2f5228
$1c:ae72  81 e4		 sta ($e4,x)
$1c:ae74  ad 84 a0	  lda $a084
$1c:ae77  12 8d		 ora ($8d)
$1c:ae79  38			sec
$1c:ae7a  ec 9e 41	  cpx $419e
$1c:ae7d  c7 2e		 cmp [$2e]
$1c:ae7f  03 ac		 ora $ac,s
$1c:ae81  1d 61 e8	  ora $e861,x
$1c:ae84  65 8a		 adc $8a
$1c:ae86  e4 22		 cpx $22
$1c:ae88  1e 72 81	  asl $8172,x
$1c:ae8b  0d 83 ee	  ora $ee83
$1c:ae8e  b6 00		 ldx $00,y
$1c:ae90  68			pla
$1c:ae91  2e 83 ca	  rol $ca83
$1c:ae94  5e 27 90	  lsr $9027,x
$1c:ae97  71 58		 adc ($58),y
$1c:ae99  82 ba 09	  brl $b856
$1c:ae9c  46 d8		 lsr $d8
$1c:ae9e  d8			cld
$1c:ae9f  4d 30 d3	  eor $d330
$1c:aea2  2a			rol a
$1c:aea3  04 6c		 tsb $6c
$1c:aea5  12 8d		 ora ($8d)
$1c:aea7  ab			plb
$1c:aea8  10 1a		 bpl $aec4
$1c:aeaa  60			rts
$1c:aeab  ac 0e a2	  ldy $a20e
$1c:aeae  04 9d		 tsb $9d
$1c:aeb0  61 e4		 adc ($e4,x)
$1c:aeb2  40			rti
$1c:aeb3  90 d8		 bcc $ae8d
$1c:aeb5  3e 88 12	  rol $1288,x
$1c:aeb8  6e 87 a8	  ror $a887
$1c:aebb  f4 4d d0	  pea $d04d
$1c:aebe  f5 9b		 sbc $9b,x
$1c:aec0  09 ba 1e	  ora #$1eba
$1c:aec3  c2 81		 rep #$81
$1c:aec5  37 43		 and [$43],y
$1c:aec7  db			stp
$1c:aec8  00 fe		 brk #$fe
$1c:aeca  7f e1 90 05   adc $0590e1,x
$1c:aece  a8			tay
$1c:aecf  2c c0 7c	  bit $7cc0
$1c:aed2  03 e0		 ora $e0,s
$1c:aed4  80 a0		 bra $ae76
$1c:aed6  45 02		 eor $02
$1c:aed8  3f 05 97 a0   and $a09705,x
$1c:aedc  47 c2		 eor [$c2]
$1c:aede  c7 f4		 cmp [$f4]
$1c:aee0  08			php
$1c:aee1  fc 5b 9e	  jsr ($9e5b,x)
$1c:aee4  81 1f		 sta ($1f,x)
$1c:aee6  f5 01		 sbc $01,x
$1c:aee8  e5 ea		 sbc $ea
$1c:aeea  40			rti
$1c:aeeb  fe bc 7c	  inc $7cbc,x
$1c:aeee  04 41		 tsb $41
$1c:aef0  b3 7d		 lda ($7d,s),y
$1c:aef2  02 90		 cop #$90
$1c:aef4  5f 63 02 60   eor $600263,x
$1c:aef8  1c 22 01	  trb $0122
$1c:aefb  04 20		 tsb $20
$1c:aefd  1c 42 08	  trb $0842
$1c:af00  31 f2		 and ($f2),y
$1c:af02  48			pha
$1c:af03  7e 88 a4	  ror $a488,x
$1c:af06  9e 0f c9	  stz $c90f,x
$1c:af09  14 5f		 trb $5f
$1c:af0b  44 37 47	  mvp $47,$37
$1c:af0e  f0 3f		 beq $af4f
$1c:af10  8f 9c 68 f2   sta $f2689c
$1c:af14  90 f0		 bcc $af06
$1c:af16  8f be 52 1f   sta $1f52be
$1c:af1a  12 48		 ora ($48)
$1c:af1c  e3 05		 sbc $05,s
$1c:af1e  27 7f		 and [$7f]
$1c:af20  14 22		 trb $22
$1c:af22  0d 04 7f	  ora $7f04
$1c:af25  09 24 22	  ora #$2224
$1c:af28  ca			dex
$1c:af29  7f 23 8d e5   adc $e58d23,x
$1c:af2d  78			sei
$1c:af2e  98			tya
$1c:af2f  96 1f		 stx $1f,y
$1c:af31  91 c7		 sta ($c7),y
$1c:af33  26 bc		 rol $bc
$1c:af35  4d 1c 13	  eor $131c
$1c:af38  f7 ff		 sbc [$ff],y
$1c:af3a  86 c0		 stx $c0
$1c:af3c  21 61		 and ($61,x)
$1c:af3e  90 11		 bcc $af51
$1c:af40  d7 fe		 cmp [$fe],y
$1c:af42  04 fc		 tsb $fc
$1c:af44  f2 98		 sbc ($98)
$1c:af46  7b			tdc
$1c:af47  c7 a2		 cmp [$a2]
$1c:af49  95 84		 sta $84,x
$1c:af4b  90 92		 bcc $aedf
$1c:af4d  40			rti
$1c:af4e  90 1f		 bcc $af6f
$1c:af50  b2 c8		 lda ($c8)
$1c:af52  8d 40 70	  sta $7040
$1c:af55  14 21		 trb $21
$1c:af57  98			tya
$1c:af58  8d 43 f7	  sta $f743
$1c:af5b  c2 1e		 rep #$1e
$1c:af5d  11 18		 ora ($18),y
$1c:af5f  30 42		 bmi $afa3
$1c:af61  6f 1a 07 f0   adc $f0071a
$1c:af65  74 9f		 stz $9f,x
$1c:af67  c2 0a		 rep #$0a
$1c:af69  7f 09 09 fc   adc $fc0909,x
$1c:af6d  27 f0		 and [$f0]
$1c:af6f  f0 bb		 beq $af2c
$1c:af71  2b			pld
$1c:af72  40			rti
$1c:af73  1a			inc a
$1c:af74  97 64		 sta [$64],y
$1c:af76  82 04 a2	  brl $517d
$1c:af79  ec 92 00	  cpx $0092
$1c:af7c  86 5d		 stx $5d
$1c:af7e  93 cf		 sta ($cf,s),y
$1c:af80  8d 42 11	  sta $1142
$1c:af83  da			phx
$1c:af84  47 27		 eor [$27]
$1c:af86  69 2a 9d	  adc #$9d2a
$1c:af89  a4 e2		 ldy $e2
$1c:af8b  76 b0		 ror $b0,x
$1c:af8d  40			rti
$1c:af8e  00 08		 brk #$08
$1c:af90  81 40		 sta ($40,x)
$1c:af92  1d e9 10	  ora $10e9,x
$1c:af95  88			dey
$1c:af96  c4 22		 cpy $22
$1c:af98  4f 91 7c 04   eor $047c91
$1c:af9c  5e 21 18	  lsr $1821,x
$1c:af9f  88			dey
$1c:afa0  41 c0		 eor ($c0,x)
$1c:afa2  6b			rtl
$1c:afa3  08			php
$1c:afa4  01 84		 ora ($84,x)
$1c:afa6  4a			lsr a
$1c:afa7  13 12		 ora ($12,s),y
$1c:afa9  85 44		 sta $44
$1c:afab  a3 31		 lda $31,s
$1c:afad  28			plp
$1c:afae  d4 4a		 pei ($4a)
$1c:afb0  0f 52 82 c4   ora $c48252
$1c:afb4  a0 d1 2a	  ldy #$2ad1
$1c:afb7  84 7b		 sty $7b
$1c:afb9  01 1e		 ora ($1e,x)
$1c:afbb  c0 d7 b0	  cpy #$b0d7
$1c:afbe  15 ec		 ora $ec,x
$1c:afc0  0c 48 34	  tsb $3448
$1c:afc3  00 e0		 brk #$e0
$1c:afc5  a0 09 c0	  ldy #$c009
$1c:afc8  06 23		 asl $23
$1c:afca  12 01		 ora ($01)
$1c:afcc  20 c4 86	  jsr $86c4
$1c:afcf  04 04		 tsb $04
$1c:afd1  00 13		 brk #$13
$1c:afd3  c5 2b		 cmp $2b
$1c:afd5  a4 f0		 ldy $f0
$1c:afd7  9a			txs
$1c:afd8  70 ca		 bvs $afa4
$1c:afda  61 12		 adc ($12,x)
$1c:afdc  90 0a		 bcc $afe8
$1c:afde  c6 60		 dec $60
$1c:afe0  1d 1a 91	  ora $911a,x
$1c:afe3  7c 6c 11	  jmp ($116c,x)
$1c:afe6  eb			xba
$1c:afe7  08			php
$1c:afe8  74 22		 stz $22,x
$1c:afea  52 11		 eor ($11)
$1c:afec  58			cli
$1c:afed  cc 4a e2	  cpy $e24a
$1c:aff0  6a			ror a
$1c:aff1  02 e0		 cop #$e0
$1c:aff3  1b			tcs
$1c:aff4  80 50		 bra $b046
$1c:aff6  a2 91 0e	  ldx #$0e91
$1c:aff9  00 70		 brk #$70
$1c:affb  28			plp
$1c:affc  22 71 0e 0c   jsl $0c0e71
$1c:b000  4a			lsr a
$1c:b001  a3 0a		 lda $0a,s
$1c:b003  c8			iny
$1c:b004  42 b2		 wdm #$b2
$1c:b006  22 33 35 20   jsl $203533
$1c:b00a  78			sei
$1c:b00b  2e 11 eb	  rol $eb11
$1c:b00e  89 8d 4b	  bit #$4b8d
$1c:b011  08			php
$1c:b012  6a			ror a
$1c:b013  02 c0		 cop #$c0
$1c:b015  1b			tcs
$1c:b016  80 b8		 bra $afd0
$1c:b018  22 b1 16 01   jsl $0116b1
$1c:b01c  a0 10 c1	  ldy #$c110
$1c:b01f  51 60		 eor ($60),y
$1c:b021  8a			txa
$1c:b022  18			clc
$1c:b023  05 80		 ora $80
$1c:b025  86 04		 stx $04
$1c:b027  60			rts
$1c:b028  d5 b2		 cmp $b2,x
$1c:b02a  d1 6c		 cmp ($6c),y
$1c:b02c  b5 5b		 lda $5b,x
$1c:b02e  4d 16 d3	  eor $d316
$1c:b031  44 ac 51	  mvp $51,$ac
$1c:b034  eb			xba
$1c:b035  1c 7a e5	  trb $e57a
$1c:b038  1e b9 a7	  asl $a7b9,x
$1c:b03b  cf 05 1e c1   cmp $c11e05
$1c:b03f  d7 ac		 cmp [$ac],y
$1c:b041  75 2b		 adc $2b,x
$1c:b043  15 7a		 ora $7a,x
$1c:b045  e7 4a		 sbc [$4a]
$1c:b047  b9 00 d6	  lda $d600,y
$1c:b04a  21 12		 and ($12,x)
$1c:b04c  8a			txa
$1c:b04d  8a			txa
$1c:b04e  c6 30		 dec $30
$1c:b050  f7 14		 sbc [$14],y
$1c:b052  30 45		 bmi $b099
$1c:b054  80 22		 bra $b078
$1c:b056  80 07		 bra $b05f
$1c:b058  c0 01 09	  cpy #$0901
$1c:b05b  00 10		 brk #$10
$1c:b05d  b6 d8		 ldx $d8,y
$1c:b05f  44 a3 71	  mvp $71,$a3
$1c:b062  ea			nop
$1c:b063  1b			tcs
$1c:b064  b4 2a		 ldy $2a,x
$1c:b066  50 ba		 bvc $b022
$1c:b068  55 0e		 eor $0e,x
$1c:b06a  a5 1b		 lda $1b
$1c:b06c  89 4c a3	  bit #$a34c
$1c:b06f  d4 28		 pei ($28)
$1c:b071  94 cc		 sty $cc,x
$1c:b073  2a			rol a
$1c:b074  34 2a		 bit $2a,x
$1c:b076  94 c8		 sty $c8,x
$1c:b078  36 33		 rol $33,x
$1c:b07a  38			sec
$1c:b07b  84 46		 sty $46
$1c:b07d  21 02		 and ($02,x)
$1c:b07f  7b			tdc
$1c:b080  04 42		 tsb $42
$1c:b082  03 36		 ora $36,s
$1c:b084  e4 cd		 cpx $cd
$1c:b086  b9 53 6b	  lda $6b53,y
$1c:b089  f4 ba ff	  pea $ffba
$1c:b08c  36 93		 rol $93,x
$1c:b08e  4d a4 e3	  eor $e3a4
$1c:b091  f2 17		 sbc ($17)
$1c:b093  88			dey
$1c:b094  d0 06		 bne $b09c
$1c:b096  82 47 58	  brl $08e0
$1c:b099  a1 1c		 lda ($1c,x)
$1c:b09b  e2 62		 sep #$62
$1c:b09d  f1 18		 sbc ($18),y
$1c:b09f  04 10		 tsb $10
$1c:b0a1  66 23		 ror $23
$1c:b0a3  00 81		 brk #$81
$1c:b0a5  92 4c		 sta ($4c)
$1c:b0a7  cc 46 20	  cpy $2046
$1c:b0aa  2e 11 c0	  rol $c011
$1c:b0ad  8d 8c 54	  sta $548c
$1c:b0b0  2a			rol a
$1c:b0b1  a4 42		 ldy $42
$1c:b0b3  aa			tax
$1c:b0b4  87 28		 sta [$28]
$1c:b0b6  95 1a		 sta $1a,x
$1c:b0b8  25 47		 and $47
$1c:b0ba  89 55		 bit #$55
$1c:b0bc  a2 55 78	  ldx #$7855
$1c:b0bf  95 22		 sta $22,x
$1c:b0c1  25 49		 and $49
$1c:b0c3  89 56		 bit #$56
$1c:b0c5  22 55 91 08   jsl $089155
$1c:b0c9  47 b0		 eor [$b0]
$1c:b0cb  21 50		 and ($50,x)
$1c:b0cd  af 28 83 01   lda $018328
$1c:b0d1  5e a1 57	  lsr $57a1,x
$1c:b0d4  95 01		 sta $01,x
$1c:b0d6  43 33		 eor $33,s
$1c:b0d8  99 d1 8b	  sta $8bd1,y
$1c:b0db  80 56		 bra $b133
$1c:b0dd  24 11		 bit $11
$1c:b0df  c5 34		 cmp $34
$1c:b0e1  11 4a		 ora ($4a),y
$1c:b0e3  db			stp
$1c:b0e4  1c 2a 95	  trb $952a
$1c:b0e7  b8			clv
$1c:b0e8  87 bd		 sta [$bd]
$1c:b0ea  9e 93 69	  stz $6993,x
$1c:b0ed  44 da 53	  mvp $53,$da
$1c:b0f0  36 9c		 rol $9c,x
$1c:b0f2  4d a7 2a	  eor $2aa7
$1c:b0f5  70 50		 bvs $b147
$1c:b0f7  84 5a		 sty $5a
$1c:b0f9  49 16		 eor #$16
$1c:b0fb  92 c5		 sta ($c5)
$1c:b0fd  25 51		 and $51
$1c:b0ff  49 d3		 eor #$d3
$1c:b101  a4 65		 ldy $65
$1c:b103  4a			lsr a
$1c:b104  f5 2b		 sbc $2b,x
$1c:b106  32 f9		 and ($f9)
$1c:b108  17 83		 ora [$83],y
$1c:b10a  76 96		 ror $96,x
$1c:b10c  4d a5 93	  eor $93a5
$1c:b10f  49 58		 eor #$58
$1c:b111  2c 22 11	  bit $1122
$1c:b114  c0 78 84	  cpy #$8478
$1c:b117  c6 2d		 dec $2d
$1c:b119  26 8b		 rol $8b
$1c:b11b  49 e2		 eor #$e2
$1c:b11d  d3 68		 cmp ($68,s),y
$1c:b11f  b4 de		 ldy $de,x
$1c:b121  2d 34 8b	  and $8b34
$1c:b124  4d 62 d3	  eor $d362
$1c:b127  a8			tay
$1c:b128  b3 a0		 lda ($a0,s),y
$1c:b12a  1d 03 34	  ora $3403,x
$1c:b12d  92 4d		 sta ($4d)
$1c:b12f  24 b1		 bit $b1
$1c:b131  6c 48 bc	  jmp ($bc48)
$1c:b134  7a			ply
$1c:b135  03 30		 ora $30,s
$1c:b137  8a			txa
$1c:b138  67 62		 adc [$62]
$1c:b13a  10 78		 bpl $b1b4
$1c:b13c  a6 b4		 ldx $b4
$1c:b13e  72 11		 adc ($11)
$1c:b140  8d ac 63	  sta $63ac
$1c:b143  6d 18 e2	  adc $e218
$1c:b146  c6 38		 dec $38
$1c:b148  d3 4b		 cmp ($4b,s),y
$1c:b14a  c9 1d		 cmp #$1d
$1c:b14c  26 db		 rol $db
$1c:b14e  09 b6		 ora #$b6
$1c:b150  c6 6d		 dec $6d
$1c:b152  c0 9b 70	  cpy #$709b
$1c:b155  62 d4 a8	  per $5a2c
$1c:b158  b5 2e		 lda $2e,x
$1c:b15a  2d 5a 8d	  and $8d5a
$1c:b15d  6e 4b 21	  ror $214b
$1c:b160  56 a5		 lsr $a5,x
$1c:b162  46 b7		 lsr $b7
$1c:b164  55 6a		 eor $6a,x
$1c:b166  d4 da		 pei ($da)
$1c:b168  69 36		 adc #$36
$1c:b16a  9a			txs
$1c:b16b  cd af a6	  cmp $a6af
$1c:b16e  b0 8b		 bcs $b0fb
$1c:b170  78			sei
$1c:b171  22 df 08 d6   jsl $d608df
$1c:b175  a4 e6		 ldy $e6
$1c:b177  0f 71 81 30   ora $308171
$1c:b17b  c6 44		 dec $44
$1c:b17d  ef 13 d0 2d   sbc $2dd013
$1c:b181  02 02		 cop #$02
$1c:b183  77 34		 adc [$34],y
$1c:b185  21 20		 and ($20,x)
$1c:b187  09 88		 ora #$88
$1c:b189  10 1c		 bpl $b1a7
$1c:b18b  b5 2b		 lda $2b,x
$1c:b18d  2d 4b 87	  and $874b
$1c:b190  5f 53 60 99   eor $996053,x
$1c:b194  0e b5 29	  asl $29b5
$1c:b197  36 4c		 rol $4c,x
$1c:b199  91 d0		 sta ($d0),y
$1c:b19b  b3 41		 lda ($41,s),y
$1c:b19d  52 11		 eor ($11)
$1c:b19f  6f 0d 5b c2   adc $c25b0d
$1c:b1a3  af 3e 8d 5b   lda $5b8d3e
$1c:b1a7  a2 af 3a	  ldx #$3aaf
$1c:b1aa  65 5a		 adc $5a
$1c:b1ac  99 16 ae	  sta $ae16,y
$1c:b1af  55 ab		 eor $ab,x
$1c:b1b1  91 6f		 sta ($6f),y
$1c:b1b3  95 5b		 sta $5b,x
$1c:b1b5  e5 16		 sbc $16
$1c:b1b7  f8			sed
$1c:b1b8  d5 be		 cmp $be,x
$1c:b1ba  35 ea		 and $ea,x
$1c:b1bc  9c 79 a0	  stz $a079
$1c:b1bf  16 08		 asl $08,x
$1c:b1c1  f5 86		 sbc $86,x
$1c:b1c3  31 99		 and ($99),y
$1c:b1c5  8c 66 a3	  sty $a366
$1c:b1c8  1c d8 c7	  trb $c7d8
$1c:b1cb  d9 b6 3d	  cmp $3db6,y
$1c:b1ce  d6 d9		 dec $d9,x
$1c:b1d0  09 40		 ora #$40
$1c:b1d2  46 37		 lsr $37
$1c:b1d4  d7 58		 cmp [$58],y
$1c:b1d6  44 ac 91	  mvp $91,$ac
$1c:b1d9  eb			xba
$1c:b1da  2c 4a e9	  bit $e94a
$1c:b1dd  1e ba d2	  asl $d2ba,x
$1c:b1e0  ac b5 2b	  ldy $2bb5
$1c:b1e3  25 2a		 and $2a
$1c:b1e5  eb			xba
$1c:b1e6  52 ba		 eor ($ba)
$1c:b1e8  45 b0		 eor $b0
$1c:b1ea  90 ac		 bcc $b198
$1c:b1ec  2b			pld
$1c:b1ed  cc a1 52	  cpy $52a1
$1c:b1f0  3a			dec a
$1c:b1f1  b6 11		 ldx $11,y
$1c:b1f3  f6 51		 inc $51,x
$1c:b1f5  2b			pld
$1c:b1f6  34 7a		 bit $7a,x
$1c:b1f8  85 12		 sta $12
$1c:b1fa  bb			tyx
$1c:b1fb  47 a8		 eor [$a8]
$1c:b1fd  74 aa		 stz $aa,x
$1c:b1ff  15 4a		 ora $4a,x
$1c:b201  cd 4a a1	  cmp $a14a
$1c:b204  d4 ae		 pei ($ae)
$1c:b206  d3 6c		 cmp ($6c,s),y
$1c:b208  a4 da		 ldy $da
$1c:b20a  d7 36		 cmp [$36],y
$1c:b20c  86 07		 stx $07
$1c:b20e  cc 40 02	  cpy $0240
$1c:b211  00 86		 brk #$86
$1c:b213  45 a6		 eor $a6
$1c:b215  90 e9		 bcc $b200
$1c:b217  ab			plb
$1c:b218  a4 67		 ldy $67
$1c:b21a  f1 49		 sbc ($49),y
$1c:b21c  54 52 75	  mvn $75,$52
$1c:b21f  34 92		 bit $92,x
$1c:b221  6d 27 91	  adc $9127
$1c:b224  ec 04 7b	  cpx $7b04
$1c:b227  03 16		 ora $16,s
$1c:b229  92 65		 sta ($65)
$1c:b22b  a7 93		 lda [$93]
$1c:b22d  69 a4		 adc #$a4
$1c:b22f  b8			clv
$1c:b230  d4 32		 pei ($32)
$1c:b232  e3 60		 sbc $60,s
$1c:b234  5a			phy
$1c:b235  89 f3		 bit #$f3
$1c:b237  69 2d		 adc #$2d
$1c:b239  8d e4 bf	  sta $bfe4
$1c:b23c  37 a3		 and [$a3],y
$1c:b23e  58			cli
$1c:b23f  46 ba		 lsr $ba
$1c:b241  b1 ae		 lda ($ae),y
$1c:b243  b4 6b		 ldy $6b,x
$1c:b245  cb			wai
$1c:b246  1a			inc a
$1c:b247  f3 45		 sbc ($45,s),y
$1c:b249  32 55		 and ($55)
$1c:b24b  4c 94 53	  jmp $5394
$1c:b24e  45 54		 eor $54
$1c:b250  d1 45		 cmp ($45),y
$1c:b252  2b			pld
$1c:b253  a7 f6		 lda [$f6]
$1c:b255  86 21		 stx $21
$1c:b257  95 0a		 sta $0a,x
$1c:b259  91 6f		 sta ($6f),y
$1c:b25b  52 5c		 eor ($5c)
$1c:b25d  6f ae b0 88   adc $88b0ae
$1c:b261  51 22		 eor ($22),y
$1c:b263  14 54		 trb $54
$1c:b265  f9 4e 32	  sbc $324e,y
$1c:b268  ea			nop
$1c:b269  74 8c		 stz $8c,x
$1c:b26b  74 a3		 stz $a3,x
$1c:b26d  5d 28 b7	  eor $b728,x
$1c:b270  52 29		 eor ($29)
$1c:b272  c4 57		 cpy $57
$1c:b274  95 5b		 sta $5b,x
$1c:b276  89 54		 bit #$54
$1c:b278  ea			nop
$1c:b279  45 b3		 eor $b3
$1c:b27b  71 6c		 adc ($6c),y
$1c:b27d  4a			lsr a
$1c:b27e  fc a3 19	  jsr ($19a3,x)
$1c:b281  98			tya
$1c:b282  c6 69		 dec $69
$1c:b284  8e 55 6c	  stx $6c55
$1c:b287  ac 5b 2b	  ldy $2b5b
$1c:b28a  56 d2		 lsr $d2,x
$1c:b28c  c5 b4		 cmp $b4
$1c:b28e  a2 93 14	  ldx #$1493
$1c:b291  23 60		 and $60,s
$1c:b293  d8			cld
$1c:b294  23 89		 and $89,s
$1c:b296  8d 6a e3	  sta $e36a
$1c:b299  5a			phy
$1c:b29a  a9 b6		 lda #$b6
$1c:b29c  c8			iny
$1c:b29d  3e 2f 02	  rol $022f,x
$1c:b2a0  79 23 c0	  adc $c023,y
$1c:b2a3  31 8f		 and ($8f),y
$1c:b2a5  f4 8b 4e	  pea $4e8b
$1c:b2a8  c0 e3 8b	  cpy #$8be3
$1c:b2ab  05 82		 ora $82
$1c:b2ad  c4 16		 cpy $16
$1c:b2af  25 56		 and $56
$1c:b2b1  ea			nop
$1c:b2b2  4d af 73	  eor $73af
$1c:b2b5  6c 4c db	  jmp ($db4c)
$1c:b2b8  78			sei
$1c:b2b9  19 10 d0	  ora $d010,y
$1c:b2bc  06 0d		 asl $0d
$1c:b2be  ce ba b6	  dec $b6ba
$1c:b2c1  d8			cld
$1c:b2c2  b7 0e		 lda [$0e],y
$1c:b2c4  29 2e		 and #$2e
$1c:b2c6  8a			txa
$1c:b2c7  67 a2		 adc [$a2]
$1c:b2c9  92 f8		 sta ($f8)
$1c:b2cb  a6 ba		 ldx $ba
$1c:b2cd  6d 9c 1f	  adc $1f9c
$1c:b2d0  8e b0 86	  stx $86b0
$1c:b2d3  11 af		 ora ($af),y
$1c:b2d5  9c 5b de	  stz $de5b
$1c:b2d8  49 3e		 eor #$3e
$1c:b2da  61 3c		 adc ($3c,x)
$1c:b2dc  22 5d b8 97   jsl $97b85d
$1c:b2e0  70 9e		 bvs $b280
$1c:b2e2  38			sec
$1c:b2e3  92 99		 sta ($99)
$1c:b2e5  b0 80		 bcs $b267
$1c:b2e7  a4 8c		 ldy $8c
$1c:b2e9  20 c5 3a	  jsr $3ac5
$1c:b2ec  c7 53		 cmp [$53]
$1c:b2ee  3a			dec a
$1c:b2ef  d3 ce		 cmp ($ce,s),y
$1c:b2f1  b5 06		 lda $06,x
$1c:b2f3  f1 e4		 sbc ($e4),y
$1c:b2f5  1c 44 e4	  trb $e444
$1c:b2f8  16 73		 asl $73,x
$1c:b2fa  d8			cld
$1c:b2fb  e1 cf		 sbc ($cf,x)
$1c:b2fd  e7 88		 sbc [$88]
$1c:b2ff  3f 9e e1 16   and $16e19e,x
$1c:b303  27 c2		 and [$c2]
$1c:b305  3e 11 c8	  rol $c811,x
$1c:b308  36 f3		 rol $f3,x
$1c:b30a  ae ba 64	  ldx $64ba
$1c:b30d  4f 81 68 4f   eor $4f6881
$1c:b311  94 da		 sty $da,x
$1c:b313  d9 36 b6	  cmp $b636,y
$1c:b316  cd a7 aa	  cmp $aaa7
$1c:b319  b0 37		 bcs $b352
$1c:b31b  8e 5d 5e	  stx $5e5d
$1c:b31e  7c 73 a8	  jmp ($a873,x)
$1c:b321  ac 83 2e	  ldy $2e83
$1c:b324  7b			tdc
$1c:b325  35 c1		 and $c1,x
$1c:b327  1f 09 38 1d   ora $1d3809,x
$1c:b32b  86 59		 stx $59
$1c:b32d  e6 1a		 inc $1a
$1c:b32f  66 9a		 ror $9a
$1c:b331  06 c1		 asl $c1
$1c:b333  20 11 00	  jsr $0011
$1c:b336  07 c6		 ora [$c6]
$1c:b338  5f 03 c2 ae   eor $aec203,x
$1c:b33c  ed 33 7f	  sbc $7f33
$1c:b33f  23 51		 and $51,s
$1c:b341  16 08		 asl $08,x
$1c:b343  8c 00 20	  sty $2000
$1c:b346  01 01		 ora ($01,x)
$1c:b348  18			clc
$1c:b349  41 82		 eor ($82,x)
$1c:b34b  0c 13 60	  tsb $6013
$1c:b34e  91 80		 sta ($80),y
$1c:b350  9a			txs
$1c:b351  00 20		 brk #$20
$1c:b353  3c 12 f0	  bit $f012,x
$1c:b356  8b			phb
$1c:b357  1b			tcs
$1c:b358  c4 db		 cpy $db
$1c:b35a  ce 8b 3f	  dec $3f8b
$1c:b35d  59 0c 42	  eor $420c,y
$1c:b360  c2 3d		 rep #$3d
$1c:b362  10 20		 bpl $b384
$1c:b364  0f 03 d0 3b   ora $3bd003
$1c:b368  1f 4c eb d8   ora $d8eb4c,x
$1c:b36c  57 09		 eor [$09],y
$1c:b36e  b7 a8		 lda [$a8],y
$1c:b370  b6 25		 ldx $25,y
$1c:b372  20 bb 95	  jsr $95bb
$1c:b375  46 ee		 lsr $ee
$1c:b377  83 5c		 sta $5c,s
$1c:b379  41 6c		 eor ($6c,x)
$1c:b37b  cb			wai
$1c:b37c  82 57 23	  brl $d6d6
$1c:b37f  b9 91 08	  lda $0891,y
$1c:b382  b0 5c		 bcs $b3e0
$1c:b384  99 b7 2a	  sta $2ab7,y
$1c:b387  6d 7e 9b	  adc $9b7e
$1c:b38a  5f d0 e3 86   eor $86e3d0,x
$1c:b38e  45 8a		 eor $8a
$1c:b390  b0 12		 bcs $b3a4
$1c:b392  40			rti
$1c:b393  8a			txa
$1c:b394  04 b0		 tsb $b0
$1c:b396  23 83		 and $83,s
$1c:b398  b3 36		 lda ($36,s),y
$1c:b39a  ed 4d a5	  sbc $a54d
$1c:b39d  aa			tax
$1c:b39e  31 dd		 and ($dd),y
$1c:b3a0  dd b7 73	  cmp $73b7,x
$1c:b3a3  6e 5d db	  ror $db5d
$1c:b3a6  97 36		 sta [$36],y
$1c:b3a8  1f 07 ae 6c   ora $6cae07,x
$1c:b3ac  56 25		 lsr $25,x
$1c:b3ae  90 0f		 bcc $b3bf
$1c:b3b0  80 b4		 bra $b366
$1c:b3b2  1e 99 b5	  asl $b599,x
$1c:b3b5  b9 32 37	  lda $3732,y
$1c:b3b8  e9 75 fe	  sbc #$fe75
$1c:b3bb  2d 8e 87	  and $878e
$1c:b3be  63 e2		 adc $e2,s
$1c:b3c0  d3 e6		 cmp ($e6,s),y
$1c:b3c2  58			cli
$1c:b3c3  f3 d9		 sbc ($d9,s),y
$1c:b3c5  e3 4d		 sbc $4d,s
$1c:b3c7  69 8b 40	  adc #$408b
$1c:b3ca  25 ad		 and $ad
$1c:b3cc  31 9e		 and ($9e),y
$1c:b3ce  b6 45		 ldx $45,y
$1c:b3d0  a0 0d e0	  ldy #$e00d
$1c:b3d3  6b			rtl
$1c:b3d4  17 39		 ora [$39],y
$1c:b3d6  a6 10		 ldx $10
$1c:b3d8  ea			nop
$1c:b3d9  68			pla
$1c:b3da  c4 48		 cpy $48
$1c:b3dc  04 f2		 tsb $f2
$1c:b3de  a1 40		 lda ($40,x)
$1c:b3e0  10 06		 bpl $b3e8
$1c:b3e2  21 10		 and ($10,x)
$1c:b3e4  aa			tax
$1c:b3e5  67 62		 adc [$62]
$1c:b3e7  11 8a		 ora ($8a),y
$1c:b3e9  a6 b6		 ldx $b6
$1c:b3eb  2d df 07	  and $07df
$1c:b3ee  8d f4 26	  sta $26f4
$1c:b3f1  21 00		 and ($00,x)
$1c:b3f3  6d 00 50	  adc $5000
$1c:b3f6  1b			tcs
$1c:b3f7  c4 10		 cpy $10
$1c:b3f9  06 f0		 asl $f0
$1c:b3fb  05 8b		 ora $8b
$1c:b3fd  bc 13 08	  ldy $0813,x
$1c:b400  75 f6		 adc $f6,x
$1c:b402  31 cd		 and ($cd),y
$1c:b404  17 df		 ora [$df],y
$1c:b406  74 76		 stz $76,x
$1c:b408  d1 6f		 cmp ($6f),y
$1c:b40a  51 1c		 eor ($1c),y
$1c:b40c  59 82 9f	  eor $9f82,y
$1c:b40f  54 f2 23	  mvn $23,$f2
$1c:b412  01 48		 ora ($48,x)
$1c:b414  11 e9		 ora ($e9),y
$1c:b416  b4 7c		 ldy $7c,x
$1c:b418  a6 66		 ldx $66
$1c:b41a  02 2e		 cop #$2e
$1c:b41c  0c 42 23	  tsb $2342
$1c:b41f  34 ca		 bit $ca,x
$1c:b421  1c 47 26	  trb $2647
$1c:b424  6f 5d 21 bd   adc $bd215d
$1c:b428  6f 31 6d 1c   adc $1c6d31
$1c:b42c  5b			tcd
$1c:b42d  28			plp
$1c:b42e  89 1c 9a	  bit #$9a1c
$1c:b431  1d 74 91	  ora $9174,x
$1c:b434  64 30		 stz $30
$1c:b436  6d 22 db	  adc $db22
$1c:b439  38			sec
$1c:b43a  94 89		 sty $89,x
$1c:b43c  2e 3b 34	  rol $343b
$1c:b43f  d8			cld
$1c:b440  c4 41		 cpy $41
$1c:b442  21 14		 and ($14,x)
$1c:b444  ce d5 35	  dec $35d5
$1c:b447  f1 4d		 sbc ($4d),y
$1c:b449  7c da 9f	  jmp ($9fda,x)
$1c:b44c  36 a7		 rol $a7,x
$1c:b44e  2c 45 60	  bit $6045
$1c:b451  15 f9		 ora $f9,x
$1c:b453  b5 79		 lda $79,x
$1c:b455  72 2b		 adc ($2b)
$1c:b457  80 5c		 bra $b4b5
$1c:b459  04 35		 tsb $35
$1c:b45b  72 31		 adc ($31)
$1c:b45d  d8			cld
$1c:b45e  a6 36		 ldx $36
$1c:b460  29 bd 8a	  and #$8abd
$1c:b463  67 a2		 adc [$a2]
$1c:b465  99 f6 0a	  sta $0af6,y
$1c:b468  2d c6 1f	  and $1fc6
$1c:b46b  36 87		 rol $87,x
$1c:b46d  36 45		 rol $45,x
$1c:b46f  b0 4d		 bcs $b4be
$1c:b471  e3 54		 sbc $54,s
$1c:b473  84 52		 sty $52
$1c:b475  5d 14 d6	  eor $d614,x
$1c:b478  c5 25		 cmp $25
$1c:b47a  ec 11 78	  cpx $7811
$1c:b47d  13 50		 ora ($50,s),y
$1c:b47f  2d d3 6b	  and $6bd3
$1c:b482  79 6c 4c	  adc $4c6c,y
$1c:b485  c0 f8 02	  cpy #$02f8
$1c:b488  f0 17		 beq $b4a1
$1c:b48a  02 7b		 cop #$7b
$1c:b48c  14 d7		 trb $d7
$1c:b48e  2b			pld
$1c:b48f  42 21		 wdm #$21
$1c:b491  07 05		 ora [$05]
$1c:b493  81 8c		 sta ($8c,x)
$1c:b495  5f 41 3d 32   eor $323d41,x
$1c:b499  a9 88 0c	  lda #$0c88
$1c:b49c  00 60		 brk #$60
$1c:b49e  49 6c 5a	  eor #$5a6c
$1c:b4a1  3d 16 8f	  and $8f16,x
$1c:b4a4  c5 b0		 cmp $b0
$1c:b4a6  c2 b0		 rep #$b0
$1c:b4a8  69 8b c8	  adc #$c88b
$1c:b4ab  e2 d8		 sep #$d8
$1c:b4ad  e8			inx
$1c:b4ae  b6 3c		 ldx $3c,y
$1c:b4b0  9a			txs
$1c:b4b1  03 b1		 ora $b1,s
$1c:b4b3  1c 00 98	  trb $9800
$1c:b4b6  07 81		 ora [$81]
$1c:b4b8  3d 4b 8a	  and $8a4b,x
$1c:b4bb  80 c8		 bra $b485
$1c:b4bd  22 3a 02 30   jsl $30023a
$1c:b4c1  4f a2 dd 98   eor $98dda2
$1c:b4c5  b7 6a		 lda [$6a],y
$1c:b4c7  25 7c		 and $7c
$1c:b4c9  a9 5f 04	  lda #$045f
$1c:b4cc  e6 46		 inc $46
$1c:b4ce  00 a0		 brk #$a0
$1c:b4d0  3e 08 28	  rol $2808,x
$1c:b4d3  04 60		 tsb $60
$1c:b4d5  f1 55		 sbc ($55),y
$1c:b4d7  bc 51 6f	  ldy $6f51,x
$1c:b4da  1d 5b c7	  ora $c75b,x
$1c:b4dd  d6 cb		 dec $cb,x
$1c:b4df  1e 02 2d	  asl $2d02,x
$1c:b4e2  e4 ab		 cpx $ab
$1c:b4e4  79 23 1c	  adc $1c23,y
$1c:b4e7  d3 f8		 cmp ($f8,s),y
$1c:b4e9  5e 38 48	  lsr $4838,x
$1c:b4ec  30 3f		 bmi $b52d
$1c:b4ee  94 d3		 sty $d3,x
$1c:b4f0  86 8b		 stx $8b
$1c:b4f2  08			php
$1c:b4f3  a7 4e		 lda [$4e]
$1c:b4f5  2c 90 0e	  bit $0e90
$1c:b4f8  a4 53		 ldy $53
$1c:b4fa  88			dey
$1c:b4fb  8f 2a b7 12   sta $12b72a
$1c:b4ff  a9 d4 8b	  lda #$8bd4
$1c:b502  65 13		 adc $13
$1c:b504  e9 10 f6	  sbc #$f610
$1c:b507  c4 3d		 cpy $3d
$1c:b509  d1 0d		 cmp ($0d),y
$1c:b50b  f4 43 7f	  pea $7f43
$1c:b50e  04 fe		 tsb $fe
$1c:b510  d1 3f		 cmp ($3f),y
$1c:b512  b8			clv
$1c:b513  4f ef 13 fb   eor $fb13ef
$1c:b517  18			clc
$1c:b518  ff 56 3f d9   sbc $d93f56,x
$1c:b51c  8f f7 63 fd   sta $fd63f7
$1c:b520  1e c0 42	  asl $42c0,x
$1c:b523  b0 35		 bcs $b55a
$1c:b525  ec 05 2b	  cpx $2b05
$1c:b528  03 06		 ora $06,s
$1c:b52a  fb			xce
$1c:b52b  d1 be		 cmp ($be),y
$1c:b52d  f0 6f		 beq $b59e
$1c:b52f  c5 1b		 cmp $1b
$1c:b531  f1 06		 sbc ($06),y
$1c:b533  fc d1 bf	  jsr ($bfd1,x)
$1c:b536  30 6f		 bmi $b5a7
$1c:b538  d5 1b		 cmp $1b,x
$1c:b53a  f5 1e		 sbc $1e,x
$1c:b53c  fd b5 c7	  sbc $c7b5,x
$1c:b53f  f8			sed
$1c:b540  db			stp
$1c:b541  08			php
$1c:b542  94 56		 sty $56,x
$1c:b544  bd ff a9	  lda $a9ff,x
$1c:b547  41 db		 eor ($db,x)
$1c:b549  e1 0a		 sbc ($0a,x)
$1c:b54b  71 04		 adc ($04),y
$1c:b54d  55 d2		 eor $d2,x
$1c:b54f  1d 28 38	  ora $3828,x
$1c:b552  04 04		 tsb $04
$1c:b554  00 10		 brk #$10
$1c:b556  cb			wai
$1c:b557  68			pla
$1c:b558  de 01 41	  dec $4101,x
$1c:b55b  78			sei
$1c:b55c  2e 5b ee	  rol $ee5b
$1c:b55f  fc 0d 26	  jsr ($260d,x)
$1c:b562  2f 3d 9e a4   and $a49e3d
$1c:b566  80 40		 bra $b5a8
$1c:b568  04 58		 tsb $58
$1c:b56a  cd 5b f0	  cmp $f05b
$1c:b56d  b2 7a		 lda ($7a)
$1c:b56f  6d 35 44	  adc $4435
$1c:b572  22 01 22 ca   jsl $ca2201
$1c:b576  02 cf		 cop #$cf
$1c:b578  2f 89 10 ae   and $ae1089
$1c:b57c  43 2a		 eor $2a,s
$1c:b57e  0b			phd
$1c:b57f  2e ef 6b	  rol $6bef
$1c:b582  14 31		 trb $31
$1c:b584  3c 46 2b	  bit $2b46,x
$1c:b587  30 2a		 bmi $b5b3
$1c:b589  30 fa		 bmi $b585
$1c:b58b  e2 04		 sep #$04
$1c:b58d  e4 ef		 cpx $ef
$1c:b58f  20 f8 0c	  jsr $0cf8
$1c:b592  d0 62		 bne $b5f6
$1c:b594  19 8c e8	  ora $e88c,y
$1c:b597  10 73		 bpl $b60c
$1c:b599  c2 f0		 rep #$f0
$1c:b59b  21 a0		 and ($a0,x)
$1c:b59d  84 34		 sty $34
$1c:b59f  5a			phy
$1c:b5a0  50 a0		 bvc $b542
$1c:b5a2  e9 89 e4	  sbc #$e489
$1c:b5a5  55 23		 eor $23,x
$1c:b5a7  a3 07		 lda $07,s
$1c:b5a9  c3 22		 cmp $22,s
$1c:b5ab  81 3d		 sta ($3d,x)
$1c:b5ad  46 27		 lsr $27
$1c:b5af  40			rti
$1c:b5b0  81 3d		 sta ($3d,x)
$1c:b5b2  26 6f		 rol $6f
$1c:b5b4  1d 8e ee	  ora $ee8e,x
$1c:b5b7  24 43		 bit $43
$1c:b5b9  1d 8f 1c	  ora $1c8f,x
$1c:b5bc  06 35		 asl $35
$1c:b5be  28			plp
$1c:b5bf  38			sec
$1c:b5c0  ec b6 b1	  cpx $b1b6
$1c:b5c3  40			rti
$1c:b5c4  1d d5 00	  ora $00d5,x
$1c:b5c7  65 84		 adc $84
$1c:b5c9  00 49		 brk #$49
$1c:b5cb  15 00		 ora $00,x
$1c:b5cd  bf 05 5e 44   lda $445e05,x
$1c:b5d1  f1 1c		 sbc ($1c),y
$1c:b5d3  a2 bd c5	  ldx #$c5bd
$1c:b5d6  0a			asl a
$1c:b5d7  af f6 e2 17   lda $17e2f6
$1c:b5db  c7 21		 cmp [$21]
$1c:b5dd  db			stp
$1c:b5de  ee b7 21	  inc $21b7
$1c:b5e1  b8			clv
$1c:b5e2  19 62 60	  ora $6062,y
$1c:b5e5  d0 49		 bne $b630
$1c:b5e7  80 bd		 bra $b5a6
$1c:b5e9  8c 5e 7b	  sty $7b5e
$1c:b5ec  3d 49 05	  and $0549,x
$1c:b5ef  02 f6		 cop #$f6
$1c:b5f1  32 66		 and ($66)
$1c:b5f3  d0 a8		 bne $b59d
$1c:b5f5  9b			txy
$1c:b5f6  41 7b		 eor ($7b,x)
$1c:b5f8  3a			dec a
$1c:b5f9  04 38		 tsb $38
$1c:b5fb  0b			phd
$1c:b5fc  01 7b		 ora ($7b,x)
$1c:b5fe  3a			dec a
$1c:b5ff  ad 96 28	  lda $2896
$1c:b602  78			sei
$1c:b603  0f c1 7e 80   ora $807ec1
$1c:b607  fc b2 d9	  jsr ($d9b2,x)
$1c:b60a  71 60		 adc ($60),y
$1c:b60c  8b			phb
$1c:b60d  00 18		 brk #$18
$1c:b60f  20 a3 05	  jsr $05a3
$1c:b612  06 7c		 asl $7c
$1c:b614  78			sei
$1c:b615  23 c0		 and $c0,s
$1c:b617  0e 08 68	  asl $6808
$1c:b61a  c3 41		 cmp $41,s
$1c:b61c  a7 25		 lda [$25]
$1c:b61e  19 68 cd	  ora $cd68,y
$1c:b621  f3 91		 sbc ($91,s),y
$1c:b623  3f b8 ac 85   and $85acb8,x
$1c:b627  81 dc		 sta ($dc,x)
$1c:b629  c7 24		 cmp [$24]
$1c:b62b  05 1e		 ora $1e
$1c:b62d  78			sei
$1c:b62e  f2 d1		 sbc ($d1)
$1c:b630  f7 75		 sbc [$75],y
$1c:b632  8a			txa
$1c:b633  01 4f		 ora ($4f,x)
$1c:b635  91 21		 sta ($21),y
$1c:b637  59 b3 a1	  eor $a1b3,y
$1c:b63a  d4 8f		 pei ($8f)
$1c:b63c  05 bb		 ora $bb
$1c:b63e  3a			dec a
$1c:b63f  2d 90 b3	  and $b390
$1c:b642  33 2d		 and ($2d,s),y
$1c:b644  a2 07 c6	  ldx #$c607
$1c:b647  6d 24 64	  adc $6424
$1c:b64a  00 1f		 brk #$1f
$1c:b64c  c2 fc		 rep #$fc
$1c:b64e  8a			txa
$1c:b64f  4a			lsr a
$1c:b650  54 1c 66	  mvn $66,$1c
$1c:b653  ad 7e 46	  lda $467e
$1c:b656  25 2f		 and $2f
$1c:b658  8e 50 14	  stx $1450
$1c:b65b  64 a3		 stz $a3
$1c:b65d  56 06		 lsr $06,x
$1c:b65f  83 51		 sta $51,s
$1c:b661  90 ca		 bcc $b62d
$1c:b663  82 8d 78	  brl $2ef3
$1c:b666  22 f2 d5 6c   jsl $6cd5f2
$1c:b66a  b3 02		 lda ($02,s),y
$1c:b66c  94 55		 sty $55,x
$1c:b66e  1c 01 58	  trb $5801
$1c:b671  22 80 cb 3c   jsl $3ccb80
$1c:b675  c8			iny
$1c:b676  5e ab c0	  lsr $c0ab,x
$1c:b679  cc 67 40	  cpy $4067
$1c:b67c  46 aa		 lsr $aa
$1c:b67e  35 51		 and $51,x
$1c:b680  68			pla
$1c:b681  b4 a1		 ldy $a1,x
$1c:b683  23 27		 and $27,s
$1c:b685  b8			clv
$1c:b686  bd 4b ef	  lda $ef4b,x
$1c:b689  a0 c8 a2	  ldy #$a2c8
$1c:b68c  4c 9f 18	  jmp $189f
$1c:b68f  d7 51		 cmp [$51],y
$1c:b691  97 dc		 sta [$dc],y
$1c:b693  90 3a		 bcc $b6cf
$1c:b695  ce ee b3	  dec $b3ee
$1c:b698  58			cli
$1c:b699  2f 5d 0e a4   and $a40e5d
$1c:b69d  71 46		 adc ($46),y
$1c:b69f  61 d9		 adc ($d9,x)
$1c:b6a1  64 3b		 stz $3b
$1c:b6a3  7d d6 f9	  adc $f9d6,x
$1c:b6a6  66 59		 ror $59
$1c:b6a8  ed 9a 14	  sbc $149a
$1c:b6ab  a2 68 d3	  ldx #$d368
$1c:b6ae  47 9c		 eor [$9c]
$1c:b6b0  05 1b		 ora $1b
$1c:b6b2  bb			tyx
$1c:b6b3  df fe 10 f1   cmp $f110fe,x
$1c:b6b7  0f 8b ab 46   ora $46ab8b
$1c:b6bb  3f 0a 08 fc   and $fc080a,x
$1c:b6bf  72 c2		 adc ($c2)
$1c:b6c1  e6 cf		 inc $cf
$1c:b6c3  13 c2		 ora ($c2,s),y
$1c:b6c5  92 4f		 sta ($4f)
$1c:b6c7  0c 63 a9	  tsb $a963
$1c:b6ca  f4 c5 f0	  pea $f0c5
$1c:b6cd  a8			tay
$1c:b6ce  97 c3		 sta [$c3],y
$1c:b6d0  28			plp
$1c:b6d1  ea			nop
$1c:b6d2  74 9a		 stz $9a,x
$1c:b6d4  2e 51 96	  rol $9651
$1c:b6d7  59 13 f8	  eor $f813,y
$1c:b6da  6a			ror a
$1c:b6db  14 e2		 trb $e2
$1c:b6dd  ea			nop
$1c:b6de  77 08		 adc [$08],y
$1c:b6e0  e3 ce		 sbc $ce,s
$1c:b6e2  60			rts
$1c:b6e3  c9 46 59	  cmp #$5946
$1c:b6e6  77 75		 adc [$75],y
$1c:b6e8  99 6c ba	  sta $ba6c,y
$1c:b6eb  0e 99 61	  asl $6199
$1c:b6ee  a4 cb		 ldy $cb
$1c:b6f0  9c e9 3a	  stz $3ae9
$1c:b6f3  3d a5 1f	  and $1fa5,x
$1c:b6f6  a5 25		 lda $25
$1c:b6f8  5e 4c 3c	  lsr $3c4c,x
$1c:b6fb  56 7b		 lsr $7b,x
$1c:b6fd  76 f2		 ror $f2,x
$1c:b6ff  c3 f4		 cmp $f4,s
$1c:b701  50 81		 bvc $b684
$1c:b703  cc 41 e3	  cpy $e341
$1c:b706  41 d2		 eor ($d2,x)
$1c:b708  62 ca 07	  per $bed5
$1c:b70b  9e cf b0	  stz $b0cf,x
$1c:b70e  c3 3a		 cmp $3a,s
$1c:b710  4f 2d 26 4c   eor $4c262d
$1c:b714  c0 7a 6d	  cpy #$6d7a
$1c:b717  3e 2b 55	  rol $552b,x
$1c:b71a  a5 2f		 lda $2f
$1c:b71c  93 84		 sta ($84,s),y
$1c:b71e  48			pha
$1c:b71f  36 b1		 rol $b1,x
$1c:b721  1c 56 87	  trb $8756
$1c:b724  32 54		 and ($54)
$1c:b726  4d 49 c4	  eor $c449
$1c:b729  47 e5		 eor [$e5]
$1c:b72b  90 c6		 bcc $b6f3
$1c:b72d  a4 00		 ldy $00
$1c:b72f  ca			dex
$1c:b730  58			cli
$1c:b731  f2 08		 sbc ($08)
$1c:b733  b0 40		 bcs $b775
$1c:b735  b8			clv
$1c:b736  01 91		 ora ($91,x)
$1c:b738  d6 1d		 dec $1d,x
$1c:b73a  84 2c		 sty $2c
$1c:b73c  25 d5		 and $d5
$1c:b73e  52 a0		 eor ($a0)
$1c:b740  fc c9 e4	  jsr ($e4c9,x)
$1c:b743  d4 52		 pei ($52)
$1c:b745  79 1f bd	  adc $bd1f,y
$1c:b748  1e 6e 54	  asl $546e,x
$1c:b74b  37 96		 and [$96],y
$1c:b74d  28			plp
$1c:b74e  de 0a 1f	  dec $1f0a,x
$1c:b751  7c 36 93	  jmp ($9336,x)
$1c:b754  60			rts
$1c:b755  5c 08 02 7f   jml $7f0208
$1c:b759  80 08		 bra $b763
$1c:b75b  0c 23 b0	  tsb $b023
$1c:b75e  f7 4e		 sbc [$4e],y
$1c:b760  c0 ef 77	  cpy #$77ef
$1c:b763  7a			ply
$1c:b764  e8			inx
$1c:b765  f4 79 67	  pea $6779
$1c:b768  8b			phb
$1c:b769  03 c0		 ora $c0,s
$1c:b76b  1e 14 1c	  asl $1c14,x
$1c:b76e  f6 31		 inc $31,x
$1c:b770  6a			ror a
$1c:b771  69 72 c5	  adc #$c572
$1c:b774  e7 85		 sbc [$85]
$1c:b776  61 49		 adc ($49,x)
$1c:b778  d3 65		 cmp ($65,s),y
$1c:b77a  04 2f		 tsb $2f
$1c:b77c  93 d3		 sta ($d3,s),y
$1c:b77e  0e c2 a2	  asl $a2c2
$1c:b781  e3 54		 sbc $54,s
$1c:b783  3b			tsc
$1c:b784  62 52 6a	  per $21d9
$1c:b787  b7 6c		 lda [$6c],y
$1c:b789  50 ff		 bvc $b78a
$1c:b78b  60			rts
$1c:b78c  0b			phd
$1c:b78d  35 4b		 and $4b,x
$1c:b78f  b1 7a		 lda ($7a),y
$1c:b791  57 e4		 eor [$e4],y
$1c:b793  4d a3 cf	  eor $cfa3
$1c:b796  37 c3		 and [$c3],y
$1c:b798  23 91		 and $91,s
$1c:b79a  d4 13		 pei ($13)
$1c:b79c  83 62		 sta $62,s
$1c:b79e  61 7c		 adc ($7c,x)
$1c:b7a0  de 3b 1d	  dec $1d3b,x
$1c:b7a3  8f 2f 4b e0   sta $e04b2f
$1c:b7a7  72 ce		 adc ($ce)
$1c:b7a9  00 27		 brk #$27
$1c:b7ab  c2 59		 rep #$59
$1c:b7ad  07 f0		 ora [$f0]
$1c:b7af  46 46		 lsr $46
$1c:b7b1  50 77		 bvc $b82a
$1c:b7b3  59 40 ef	  eor $ef40,y
$1c:b7b6  40			rti
$1c:b7b7  8b			phb
$1c:b7b8  3f af 47 a3   and $a347af,x
$1c:b7bc  a0 83 c0	  ldy #$c083
$1c:b7bf  1e 0f a4	  asl $a40f,x
$1c:b7c2  cb			wai
$1c:b7c3  04 83		 tsb $83
$1c:b7c5  3d 9e a4	  and $a49e,x
$1c:b7c8  87 c3		 sta [$c3]
$1c:b7ca  3d 8c 30	  and $308c,x
$1c:b7cd  a6 93		 ldx $93
$1c:b7cf  17 9e		 ora [$9e],y
$1c:b7d1  d3 69		 cmp ($69,s),y
$1c:b7d3  aa			tax
$1c:b7d4  22 f0 d3 65   jsl $65d3f0
$1c:b7d8  04 cb		 tsb $cb
$1c:b7da  93 d3		 sta ($d3,s),y
$1c:b7dc  22 cb 12 bf   jsl $bf12cb
$1c:b7e0  63 48		 adc $48,s
$1c:b7e2  9e cb 14	  stz $14cb,x
$1c:b7e5  8f 63 c8 a3   sta $a3c863
$1c:b7e9  42 00		 wdm #$00
$1c:b7eb  42 84		 wdm #$84
$1c:b7ed  48			pha
$1c:b7ee  93 d0		 sta ($d0,s),y
$1c:b7f0  8a			txa
$1c:b7f1  e5 e1		 sbc $e1
$1c:b7f3  20 91 55	  jsr $5591
$1c:b7f6  cd de 62	  cmp $62de
$1c:b7f9  0d 06 47	  ora $4706
$1c:b7fc  23 9a		 and $9a,s
$1c:b7fe  32 d6		 and ($d6)
$1c:b800  63 1b		 adc $1b,s
$1c:b802  8e c7 67	  stx $67c7
$1c:b805  0e d2 64	  asl $64d2
$1c:b808  0c b3 e1	  tsb $e1b3
$1c:b80b  89 86 74	  bit #$7486
$1c:b80e  62 c9 e6	  per $9eda
$1c:b811  4c 50 59	  jmp $5950
$1c:b814  2c de 38	  bit $38de
$1c:b817  d4 4d		 pei ($4d)
$1c:b819  0a			asl a
$1c:b81a  65 1b		 adc $1b
$1c:b81c  86 68		 stx $68
$1c:b81e  3a			dec a
$1c:b81f  3c b1 74	  bit $74b1,x
$1c:b822  0e 81 96	  asl $9681
$1c:b825  d1 83		 cmp ($83),y
$1c:b827  c0 20 05	  cpy #$0520
$1c:b82a  91 a4		 sta ($a4),y
$1c:b82c  e7 b3		 sbc [$b3]
$1c:b82e  d9 f4 18	  cmp $18f4,y
$1c:b831  67 44		 adc [$44]
$1c:b833  00 1f		 brk #$1f
$1c:b835  0c 62 98	  tsb $9862
$1c:b838  aa			tax
$1c:b839  3a			dec a
$1c:b83a  6d 36 9f	  adc $9f36
$1c:b83d  15 aa		 ora $aa,x
$1c:b83f  d2 8c		 cmp ($8c)
$1c:b841  00 5e		 brk #$5e
$1c:b843  19 45 31	  ora $3145,y
$1c:b846  1f cc fe 8a   ora $8afecc,x
$1c:b84a  53 c4		 eor ($c4,s),y
$1c:b84c  13 c5		 ora ($c5,s),y
$1c:b84e  9e 04 f1	  stz $f104,x
$1c:b851  80 3d		 bra $b890
$1c:b853  10 9e		 bpl $b7f3
$1c:b855  44 70 27	  mvp $27,$70
$1c:b858  92 11		 sta ($11)
$1c:b85a  11 e6		 ora ($e6),y
$1c:b85c  8f 92 fc 92   sta $92fc92
$1c:b860  b3 10		 lda ($10,s),y
$1c:b862  f4 41 fc	  pea $fc41
$1c:b865  9a			txs
$1c:b866  8d 1f c7	  sta $c71f
$1c:b869  fe cc b3	  inc $b3cc,x
$1c:b86c  c3 53		 cmp $53,s
$1c:b86e  8a			txa
$1c:b86f  d0 b3		 bne $b824
$1c:b871  c7 33		 cmp [$33]
$1c:b873  9a			txs
$1c:b874  25 1f		 and $1f
$1c:b876  73 1d		 adc ($1d,s),y
$1c:b878  8e c7 88	  stx $88c7
$1c:b87b  c3 1a		 cmp $1a,s
$1c:b87d  e0 06 f8	  cpx #$f806
$1c:b880  67 05		 adc [$05]
$1c:b882  64 01		 stz $01
$1c:b884  03 bb		 ora $bb,s
$1c:b886  7d fb bd	  adc $bdfb,x
$1c:b889  a3 b0		 lda $b0,s
$1c:b88b  bb			tyx
$1c:b88c  c1 4e		 cmp ($4e,x)
$1c:b88e  ce e1 22	  dec $22e1
$1c:b891  8b			phb
$1c:b892  e8			inx
$1c:b893  9e 6a ef	  stz $ef6a,x
$1c:b896  27 f2		 and [$f2]
$1c:b898  65 72		 adc $72
$1c:b89a  da			phx
$1c:b89b  31 30		 and ($30),y
$1c:b89d  e5 81		 sbc $81
$1c:b89f  64 ef		 stz $ef
$1c:b8a1  3c ee 78	  bit $78ee,x
$1c:b8a4  6a			ror a
$1c:b8a5  79 f7 e2	  adc $e2f7,y
$1c:b8a8  e8			inx
$1c:b8a9  b4 ba		 ldy $ba,x
$1c:b8ab  62 29 e9	  per $a1d7
$1c:b8ae  c5 8a		 cmp $8a
$1c:b8b0  51 a7		 eor ($a7),y
$1c:b8b2  78			sei
$1c:b8b3  64 4c		 stz $4c
$1c:b8b5  25 a8		 and $a8
$1c:b8b7  10 86		 bpl $b83f
$1c:b8b9  80 c2		 bra $b87d
$1c:b8bb  7a			ply
$1c:b8bc  4c db 9c	  jmp $9cdb
$1c:b8bf  5c 02 f1 17   jml $17f102
$1c:b8c3  28			plp
$1c:b8c4  b9 c3 2d	  lda $2dc3,y
$1c:b8c7  ac d6 77	  ldy $77d6
$1c:b8ca  50 00		 bvc $b8cc
$1c:b8cc  2a			rol a
$1c:b8cd  21 18		 and ($18,x)
$1c:b8cf  a0 05 ec	  ldy #$ec05
$1c:b8d2  4e db 48	  lsr $48db
$1c:b8d5  28			plp
$1c:b8d6  84 93		 sty $93
$1c:b8d8  70 0f		 bvs $b8e9
$1c:b8da  95 07		 sta $07,x
$1c:b8dc  a4 5c		 ldy $5c
$1c:b8de  08			php
$1c:b8df  89 05 d0	  bit #$d005
$1c:b8e2  6a			ror a
$1c:b8e3  15 29		 ora $29,x
$1c:b8e5  98			tya
$1c:b8e6  d8			cld
$1c:b8e7  ae e1 68	  ldx $68e1
$1c:b8ea  4a			lsr a
$1c:b8eb  9a			txs
$1c:b8ec  62 13 66	  per $1f02
$1c:b8ef  92 84		 sta ($84)
$1c:b8f1  ff f0 05 3f   sbc $3f05f0,x
$1c:b8f5  3c 1b db	  bit $db1b,x
$1c:b8f8  0c 56 48	  tsb $4856
$1c:b8fb  81 b8		 sta ($b8,x)
$1c:b8fd  ec e0 c7	  cpx $c7e0
$1c:b900  35 9a		 and $9a,x
$1c:b902  cc b1 0a	  cpy $0ab1
$1c:b905  c6 50		 dec $50
$1c:b907  59 44 7e	  eor $7e44,y
$1c:b90a  23 74		 and $74,s
$1c:b90c  f8			sed
$1c:b90d  29 ff 60	  and #$60ff
$1c:b910  62 fb f1	  per $ab0e
$1c:b913  58			cli
$1c:b914  a2 7c e5	  ldx #$e57c
$1c:b917  8f e1 89 c4   sta $c489e1
$1c:b91b  8f ef ee ef   sta $efeeef
$1c:b91f  10 15		 bpl $b936
$1c:b921  bf fd e1 41   lda $41e1fd,x
$1c:b925  ce cb 68	  dec $68cb
$1c:b928  f4 70 07	  pea $0770
$1c:b92b  80 6c		 bra $b999
$1c:b92d  4e 2f a4	  lsr $a42f
$1c:b930  c5 e7		 cmp $e7
$1c:b932  83 f7		 sta $f7,s
$1c:b934  a4 c9		 ldy $c9
$1c:b936  e9 85 f6	  sbc #$f685
$1c:b939  dc 12 fe	  jml [$fe12]
$1c:b93c  3b			tsc
$1c:b93d  4c a5 0b	  jmp $0ba5
$1c:b940  c1 3f		 cmp ($3f,x)
$1c:b942  f9 c3 d4	  sbc $d4c3,y
$1c:b945  3e 42 84	  rol $8442,x
$1c:b948  e7 ab		 sbc [$ab]
$1c:b94a  43 bb		 eor $bb,s
$1c:b94c  ac cb 2f	  ldy $2fcb
$1c:b94f  40			rti
$1c:b950  22 19 6d 63   jsl $636d19
$1c:b954  bc 1e 00	  ldy $001e,x
$1c:b957  a7 61		 lda [$61]
$1c:b959  0d af 05	  ora $05af
$1c:b95c  a3 2d		 lda $2d,s
$1c:b95e  a2 01 82	  ldx #$8201
$1c:b961  ca			dex
$1c:b962  01 fd		 ora ($fd,x)
$1c:b964  41 d1		 eor ($d1,x)
$1c:b966  bc 40 06	  ldy $0640,x
$1c:b969  39 6d 18	  and $186d,y
$1c:b96c  fc 08 00	  jsr ($0008,x)
$1c:b96f  a8			tay
$1c:b970  1a			inc a
$1c:b971  4e 7b 3d	  lsr $3d7b
$1c:b974  9f 58 06 74   sta $740658,x
$1c:b978  a0 04 f0	  ldy #$f004
$1c:b97b  c6 01		 dec $01
$1c:b97d  8a			txa
$1c:b97e  a3 a6		 lda $a6,s
$1c:b980  d3 69		 cmp ($69,s),y
$1c:b982  f1 3a		 sbc ($3a),y
$1c:b984  2d 29 80	  and $8029
$1c:b987  0b			phd
$1c:b988  e1 94		 sbc ($94,x)
$1c:b98a  03 12		 ora $12,s
$1c:b98c  bc 0d ec	  ldy $ec0d,x
$1c:b98f  d1 48		 cmp ($48),y
$1c:b991  03 7c		 ora $7c,s
$1c:b993  10 0a		 bpl $b99f
$1c:b995  04 43		 tsb $43
$1c:b997  7c ac 8d	  jmp ($8dac,x)
$1c:b99a  00 e8		 brk #$e8
$1c:b99c  8f 68 a2 7f   sta $7fa268
$1c:b9a0  d2 1e		 cmp ($1e)
$1c:b9a2  c1 c7		 cmp ($c7,x)
$1c:b9a4  62 08 43	  per $fcaf
$1c:b9a7  55 83		 eor $83,x
$1c:b9a9  0a			asl a
$1c:b9aa  50 c4		 bvc $b970
$1c:b9ac  1c f8 31	  trb $31f8
$1c:b9af  16 c2		 asl $c2,x
$1c:b9b1  bf fd e0 ab   lda $abe0fd,x
$1c:b9b5  76 0f		 ror $0f,x
$1c:b9b7  f8			sed
$1c:b9b8  42 07		 wdm #$07
$1c:b9ba  5f 96 d1 9b   eor $9bd196,x
$1c:b9be  00 d6		 brk #$d6
$1c:b9c0  1b			tcs
$1c:b9c1  3f 8e cc dc   and $dccc8e,x
$1c:b9c5  01 62		 ora ($62,x)
$1c:b9c7  ce e7 8f	  dec $8fe7
$1c:b9ca  63 a4		 adc $a4,s
$1c:b9cc  c5 f6		 cmp $f6
$1c:b9ce  3e 5d 93	  rol $935d,x
$1c:b9d1  d8			cld
$1c:b9d2  67 d8		 adc [$d8]
$1c:b9d4  e1 a2		 sbc ($a2,x)
$1c:b9d6  d2 e9		 cmp ($e9)
$1c:b9d8  91 63		 sta ($63),y
$1c:b9da  a4 c9		 ldy $c9
$1c:b9dc  f8			sed
$1c:b9dd  3e 5e 14	  rol $145e,x
$1c:b9e0  58			cli
$1c:b9e1  69 d5 ec	  adc #$ecd5
$1c:b9e4  45 26		 eor $26
$1c:b9e6  02 e8		 cop #$e8
$1c:b9e8  32 2a		 and ($2a)
$1c:b9ea  b1 1a		 lda ($1a),y
$1c:b9ec  93 49		 sta ($49,s),y
$1c:b9ee  b1 b8		 lda ($b8),y
$1c:b9f0  e5 e0		 sbc $e0
$1c:b9f2  05 41		 ora $41
$1c:b9f4  56 4c		 lsr $4c,x
$1c:b9f6  13 c9		 ora ($c9,s),y
$1c:b9f8  1a			inc a
$1c:b9f9  83 59		 sta $59,s
$1c:b9fb  ac d2 66	  ldy $66d2
$1c:b9fe  d7 81		 cmp [$81],y
$1c:ba00  dc 5e 0b	  jml [$0b5e]
$1c:ba03  48			pha
$1c:ba04  b3 82		 lda ($82,s),y
$1c:ba06  b1 66		 lda ($66),y
$1c:ba08  0e b3 ba	  asl $bab3
$1c:ba0b  e0 17 11	  cpx #$1117
$1c:ba0e  e5 85		 sbc $85
$1c:ba10  8e 2f 77	  stx $772f
$1c:ba13  6d 91 45	  adc $4591
$1c:ba16  ff af ef 77   sbc $77efaf,x
$1c:ba1a  f8			sed
$1c:ba1b  83 c2		 sta $c2,s
$1c:ba1d  39 41 d1	  and $d141,y
$1c:ba20  98			tya
$1c:ba21  04 be		 tsb $be
$1c:ba23  7a			ply
$1c:ba24  37 60		 and [$60],y
$1c:ba26  0b			phd
$1c:ba27  06 92		 asl $92
$1c:ba29  84 04		 sty $04
$1c:ba2b  20 1b cf	  jsr $cf1b
$1c:ba2e  18			clc
$1c:ba2f  dc 05 78	  jml [$7805]
$1c:ba32  d4 52		 pei ($52)
$1c:ba34  80 94		 bra $b9ca
$1c:ba36  03 f9		 ora $f9,s
$1c:ba38  e5 1b		 sbc $1b
$1c:ba3a  80 2c		 bra $ba68
$1c:ba3c  15 8c		 ora $8c,x
$1c:ba3e  65 51		 adc $51
$1c:ba40  45 8a		 eor $8a
$1c:ba42  60			rts
$1c:ba43  ca			dex
$1c:ba44  28			plp
$1c:ba45  da			phx
$1c:ba46  6c d9 31	  jmp ($31d9)
$1c:ba49  e0 66 5c	  cpx #$5c66
$1c:ba4c  6e ea 2d	  ror $2dea
$1c:ba4f  26 6f		 rol $6f
$1c:ba51  1c ed bc	  trb $bced
$1c:ba54  b3 20		 lda ($20,s),y
$1c:ba56  05 f6		 ora $f6
$1c:ba58  13 14		 ora ($14,s),y
$1c:ba5a  b0 f6		 bcs $ba52
$1c:ba5c  fb			xce
$1c:ba5d  a1 48		 lda ($48,x)
$1c:ba5f  cc e2 71	  cpy $71e2
$1c:ba62  39 04 c8	  and $c804,y
$1c:ba65  91 59		 sta ($59),y
$1c:ba67  9a			txs
$1c:ba68  09 64 6a	  ora #$6a64
$1c:ba6b  c3 fc		 cmp $fc,s
$1c:ba6d  b2 c6		 lda ($c6)
$1c:ba6f  24 13		 bit $13
$1c:ba71  1a			inc a
$1c:ba72  58			cli
$1c:ba73  73 a7		 adc ($a7,s),y
$1c:ba75  15 1b		 ora $1b,x
$1c:ba77  1b			tcs
$1c:ba78  fc 34 5a	  jsr ($5a34,x)
$1c:ba7b  54 0a 91	  mvn $91,$0a
$1c:ba7e  8d 26 9b	  sta $9b26
$1c:ba81  2d 0e a5	  and $a50e
$1c:ba84  2a			rol a
$1c:ba85  05 62		 ora $62
$1c:ba87  c5 62		 cmp $62
$1c:ba89  4b			phk
$1c:ba8a  e5 90		 sbc $90
$1c:ba8c  d9 68 b0	  cmp $b068,y
$1c:ba8f  65 f0		 adc $f0
$1c:ba91  33 16		 and ($16,s),y
$1c:ba93  24 9e		 bit $9e
$1c:ba95  a8			tay
$1c:ba96  f7 2f		 sbc [$2f],y
$1c:ba98  a9 7c 60	  lda #$607c
$1c:ba9b  05 f3		 ora $f3
$1c:ba9d  37 fa		 and [$fa],y
$1c:ba9f  01 d4		 ora ($d4,x)
$1c:baa1  c9 99 57	  cmp #$5799
$1c:baa4  96 4b		 stx $4b,y
$1c:baa6  64 af		 stz $af
$1c:baa8  35 79		 and $79,x
$1c:baaa  63 97		 adc $97,s
$1c:baac  e1 dc		 sbc ($dc,x)
$1c:baae  5f 8b 05 c3   eor $c3058b,x
$1c:bab2  a1 ac		 lda ($ac,x)
$1c:bab4  ee b3 c5	  inc $c5b3
$1c:bab7  a2 e0 46	  ldx #$46e0
$1c:baba  02 32		 cop #$32
$1c:babc  bc 4a e1	  ldy $e14a,x
$1c:babf  a1 57		 lda ($57,x)
$1c:bac1  96 68		 stx $68,y
$1c:bac3  24 6c		 bit $6c
$1c:bac5  21 c7		 and ($c7,x)
$1c:bac7  98			tya
$1c:bac8  c3 1a		 cmp $1a,s
$1c:baca  c0 2c e3	  cpy #$e32c
$1c:bacd  ec 9b 81	  cpx $819b
$1c:bad0  96 cb		 stx $cb,y
$1c:bad2  94 c3		 sty $c3,x
$1c:bad4  2b			pld
$1c:bad5  96 68		 stx $68,y
$1c:bad7  96 59		 stx $59,y
$1c:bad9  ce 3a 3d	  dec $3d3a
$1c:badc  18			clc
$1c:badd  44 0c 60	  mvp $60,$0c
$1c:bae0  fa			plx
$1c:bae1  37 39		 and [$39],y
$1c:bae3  e7 85		 sbc [$85]
$1c:bae5  e1 9f		 sbc ($9f,x)
$1c:bae7  09 88 99	  ora #$9988
$1c:baea  f4 c3 f0	  pea $f0c3
$1c:baed  d3 88		 cmp ($88,s),y
$1c:baef  e9 1e 9d	  sbc #$9d1e
$1c:baf2  be eb 9d	  ldx $9deb,y
$1c:baf5  8f e8 45 e1   sta $e145e8
$1c:baf9  2c 17 fc	  bit $fc17
$1c:bafc  a1 e8		 lda ($e8,x)
$1c:bafe  1c 7a 93	  trb $937a
$1c:bb01  e1 5c		 sbc ($5c,x)
$1c:bb03  e6 06		 inc $06
$1c:bb05  20 00 02	  jsr $0200
$1c:bb08  8d ce 61	  sta $61ce
$1c:bb0b  90 0c		 bcc $bb19
$1c:bb0d  08			php
$1c:bb0e  65 1b		 adc $1b
$1c:bb10  3e ea 20	  rol $20ea,x
$1c:bb13  00 08		 brk #$08
$1c:bb15  81 40		 sta ($40,x)
$1c:bb17  1d e9 10	  ora $10e9,x
$1c:bb1a  81 3d		 sta ($3d,x)
$1c:bb1c  d1 de		 cmp ($de),y
$1c:bb1e  11 28		 ora ($28),y
$1c:bb20  20 04 60	  jsr $6004
$1c:bb23  55 28		 eor $28,x
$1c:bb25  25 08		 and $08
$1c:bb27  00 00		 brk #$00
$1c:bb29  61 77		 adc ($77,x)
$1c:bb2b  94 4a		 sty $4a,x
$1c:bb2d  0f 12 82 bb   ora $bb8212
$1c:bb31  c0 12 30	  cpy #$3012
$1c:bb34  60			rts
$1c:bb35  98			tya
$1c:bb36  03 ce		 ora $ce,s
$1c:bb38  0a			asl a
$1c:bb39  1b			tcs
$1c:bb3a  00 7a		 brk #$7a
$1c:bb3c  85 03		 sta $03
$1c:bb3e  19 12 c6	  ora $c612,y
$1c:bb41  c4 b3		 cpy $b3
$1c:bb43  91 2c		 sta ($2c),y
$1c:bb45  ec 42 24	  cpx $2442
$1c:bb48  37 47		 and [$47],y
$1c:bb4a  f8			sed
$1c:bb4b  c5 00		 cmp $00
$1c:bb4d  23 53		 and $53,s
$1c:bb4f  89 45 62	  bit #$6245
$1c:bb52  57 08		 eor [$08],y
$1c:bb54  96 06		 stx $06,y
$1c:bb56  25 80		 and $80
$1c:bb58  89 5c 49	  bit #$495c
$1c:bb5b  2a			rol a
$1c:bb5c  4a			lsr a
$1c:bb5d  02 80		 cop #$80
$1c:bb5f  13 80		 ora ($80,s),y
$1c:bb61  98			tya
$1c:bb62  19 08 96	  ora $9608,y
$1c:bb65  46 25		 lsr $25
$1c:bb67  a0 89 68	  ldy #$6889
$1c:bb6a  4c 22 60	  jmp $6022
$1c:bb6d  03 30		 ora $30,s
$1c:bb6f  19 02 1d	  ora $1d02,y
$1c:bb72  12 87		 ora ($87)
$1c:bb74  c4 a3		 cpy $a3
$1c:bb76  d1 28		 cmp ($28),y
$1c:bb78  fd 4a 1b	  sbc $1b4a,x
$1c:bb7b  12 96		 ora ($96)
$1c:bb7d  d4 a3		 pei ($a3)
$1c:bb7f  b1 29		 lda ($29),y
$1c:bb81  ed 4a 19	  sbc $194a
$1c:bb84  12 96		 ora ($96)
$1c:bb86  54 a3 91	  mvn $91,$a3
$1c:bb89  29 e3 dc	  and #$dce3
$1c:bb8c  e1 11		 sbc ($11,x)
$1c:bb8e  08			php
$1c:bb8f  4b			phk
$1c:bb90  dc e1 51	  jml [$51e1]
$1c:bb93  08			php
$1c:bb94  5b			tcd
$1c:bb95  dc 64 c9	  jml [$c964]
$1c:bb98  72 89		 adc ($89)
$1c:bb9a  52 22		 eor ($22)
$1c:bb9c  54 98 95	  mvn $95,$98
$1c:bb9f  62 25 59	  per $14c7
$1c:bba2  89 51 a2	  bit #$a251
$1c:bba5  54 78 95	  mvn $95,$78
$1c:bba8  5a			phy
$1c:bba9  25 57		 and $57
$1c:bbab  89 4b a2	  bit #$a24b
$1c:bbae  52 f8		 eor ($f8)
$1c:bbb0  94 fa		 sty $fa,x
$1c:bbb2  25 3f		 and $3f
$1c:bbb4  3c 89 e0	  bit $e089,x
$1c:bbb7  0f c0 7c 04   ora $047cc0
$1c:bbbb  10 20		 bpl $bbdd
$1c:bbbd  02 78		 cop #$78
$1c:bbbf  83 18		 sta $18,s
$1c:bbc1  c4 4a		 cpy $4a
$1c:bbc3  32 b3		 and ($b3)
$1c:bbc5  38			sec
$1c:bbc6  d4 4a		 pei ($4a)
$1c:bbc8  36 73		 rol $73,x
$1c:bbca  28			plp
$1c:bbcb  84 d9		 sty $d9
$1c:bbcd  ee 2d 82	  inc $822d
$1c:bbd0  93 c4		 sta ($c4,s),y
$1c:bbd2  26 f1		 rol $f1
$1c:bbd4  09 44 42	  ora #$4244
$1c:bbd7  54 e1 0a	  mvn $0a,$e1
$1c:bbda  83 80		 sta $80,s
$1c:bbdc  1c c1 2b	  trb $2bc1
$1c:bbdf  88			dey
$1c:bbe0  53 22		 eor ($22,s),y
$1c:bbe2  14 d4		 trb $d4
$1c:bbe4  39 d7 22	  and $22d7,y
$1c:bbe7  15 d4		 ora $d4,x
$1c:bbe9  39 bc 02	  and $02bc,y
$1c:bbec  d0 f3		 bne $bbe1
$1c:bbee  5b			tcd
$1c:bbef  3a			dec a
$1c:bbf0  1c a2 56	  trb $56a2
$1c:bbf3  63 b8		 adc $b8,s
$1c:bbf5  dd a2 57	  cmp $57a2,x
$1c:bbf8  74 08		 stz $08,x
$1c:bbfa  44 ad 31	  mvp $31,$ad
$1c:bbfd  2b			pld
$1c:bbfe  c4 4a		 cpy $4a
$1c:bc00  f3 10		 sbc ($10,s),y
$1c:bc02  9c 44 27	  stz $2744
$1c:bc05  4e 33 11	  lsr $1133
$1c:bc08  04 ed		 tsb $ed
$1c:bc0a  d6 51		 dec $51,x
$1c:bc0c  6b			rtl
$1c:bc0d  d4 5a		 pei ($5a)
$1c:bc0f  97 16		 sta [$16],y
$1c:bc11  bd c5 ab	  lda $abc5,x
$1c:bc14  71 0a		 adc ($0a),y
$1c:bc16  84 42		 sty $42
$1c:bc18  a3 10		 lda $10,s
$1c:bc1a  b0 44		 bcs $bc60
$1c:bc1c  2c 31 0c	  bit $0c31
$1c:bc1f  74 43		 stz $43,x
$1c:bc21  1e 87 39	  asl $3987,x
$1c:bc24  34 52		 bit $52,x
$1c:bc26  d7 10		 cmp [$10],y
$1c:bc28  f6 45		 inc $45,x
$1c:bc2a  2b			pld
$1c:bc2b  e4 91		 cpx $91
$1c:bc2d  9b			txy
$1c:bc2e  45 29		 eor $29
$1c:bc30  f1 0f		 sbc ($0f),y
$1c:bc32  6c 4b 3d	  jmp ($3d4b)
$1c:bc35  16 af		 asl $af,x
$1c:bc37  c4 b5		 cpy $b5
$1c:bc39  c5 90		 cmp $90
$1c:bc3b  43 97		 eor $97,s
$1c:bc3d  43 1d		 eor $1d,s
$1c:bc3f  d0 c7		 bne $bc08
$1c:bc41  c5 a9		 cmp $a9
$1c:bc43  f1 28		 sbc ($28),y
$1c:bc45  79 9c 5a	  adc $5a9c,y
$1c:bc48  c1 25		 cmp ($25,x)
$1c:bc4a  37 8a		 and [$8a],y
$1c:bc4c  20 ad 84	  jsr $84ad
$1c:bc4f  91 7b		 sta ($7b),y
$1c:bc51  06 38		 asl $38
$1c:bc53  92 36		 sta ($36)
$1c:bc55  d1 f8		 cmp ($f8),y
$1c:bc57  83 82		 sta $82,s
$1c:bc59  30 59		 bmi $bcb4
$1c:bc5b  1e 71 64	  asl $6471,x
$1c:bc5e  0c e3 1b	  tsb $1be3
$1c:bc61  35 94		 and $94,x
$1c:bc63  4b			phk
$1c:bc64  7c 89 48	  jmp ($4889,x)
$1c:bc67  a5 3a		 lda $3a
$1c:bc69  29 5e 50	  and #$505e
$1c:bc6c  8d 38 ce	  sta $ce38
$1c:bc6f  32 f3		 and ($f3)
$1c:bc71  38			sec
$1c:bc72  b3 83		 lda ($83,s),y
$1c:bc74  3d 12 cf	  and $cf12,x
$1c:bc77  96 c2		 stx $c2,y
$1c:bc79  25 af		 and $af
$1c:bc7b  4b			phk
$1c:bc7c  84 4b		 sty $4b
$1c:bc7e  7e 8b 08	  ror $088b,x
$1c:bc81  97 3e		 sta [$3e],y
$1c:bc83  25 2e		 and $2e
$1c:bc85  5c a8 40 2d   jml $2d40a8
$1c:bc89  f1 20		 sbc ($20),y
$1c:bc8b  a1 04		 lda ($04,x)
$1c:bc8d  80 34		 bra $bcc3
$1c:bc8f  71 6a		 adc ($6a),y
$1c:bc91  50 c4		 bvc $bc57
$1c:bc93  6b			rtl
$1c:bc94  43 50		 eor $50,s
$1c:bc96  89 4b 62	  bit #$624b
$1c:bc99  53 58		 eor ($58,s),y
$1c:bc9b  94 d2		 sty $d2,x
$1c:bc9d  24 fc		 bit $fc
$1c:bc9f  23 10		 and $10,s
$1c:bca1  c4 2d		 cpy $2d
$1c:bca3  41 11		 eor ($11,x)
$1c:bca5  b7 54		 lda [$54],y
$1c:bca7  a3 b1		 lda $b1,s
$1c:bca9  2b			pld
$1c:bcaa  f5 49		 sbc $49,x
$1c:bcac  c0 12 ca	  cpy #$ca12
$1c:bcaf  94 f6		 sty $f6,x
$1c:bcb1  25 3c		 and $3c
$1c:bcb3  89 50 a2	  bit #$a250
$1c:bcb6  54 38 95	  mvn $95,$38
$1c:bcb9  4a			lsr a
$1c:bcba  05 00		 ora $00
$1c:bcbc  89 51 22	  bit #$2251
$1c:bcbf  54 58 95	  mvn $95,$58
$1c:bcc2  52 25		 eor ($25)
$1c:bcc4  55 89		 eor $89,x
$1c:bcc6  43 a2		 eor $a2,s
$1c:bcc8  56 28		 lsr $28,x
$1c:bcca  94 7a		 sty $7a,x
$1c:bccc  25 72		 and $72
$1c:bcce  89 6c 1b	  bit #$1b6c
$1c:bcd1  e3 c0		 sbc $c0,s
$1c:bcd3  89 4f 5e	  bit #$5e4f
$1c:bcd6  e3 d1		 sbc $d1,s
$1c:bcd8  7d 8f 84	  adc $848f,x
$1c:bcdb  be 33 21	  ldx $2133,y
$1c:bcde  39 37 c1	  and $c137,y
$1c:bce1  92 21		 sta ($21)
$1c:bce3  e0 bf b3	  cpx #$b3bf
$1c:bce6  c2 a5		 rep #$a5
$1c:bce8  0c 89 47	  tsb $4789
$1c:bceb  6a			ror a
$1c:bcec  51 c8		 eor ($c8),y
$1c:bcee  85 92		 sta $92
$1c:bcf0  21 65		 and ($65,x)
$1c:bcf2  8a			txa
$1c:bcf3  40			rti
$1c:bcf4  48			pha
$1c:bcf5  61 16		 adc ($16,x)
$1c:bcf7  23 0c		 and $0c,s
$1c:bcf9  4a			lsr a
$1c:bcfa  e9 12 ba	  sbc #$ba12
$1c:bcfd  af c6 c7 12   lda $12c7c6
$1c:bd01  9f 44 ae 71   sta $71ae44,x
$1c:bd05  2e 83 bc	  rol $bc83
$1c:bd08  7c 0f 31	  jmp ($310f,x)
$1c:bd0b  78			sei
$1c:bd0c  06 c4		 asl $c4
$1c:bd0e  76 11		 ror $11,x
$1c:bd10  2e 0f 40	  rol $400f
$1c:bd13  54 26 72	  mvn $72,$26
$1c:bd16  88			dey
$1c:bd17  1b			tcs
$1c:bd18  c2 22		 rep #$22
$1c:bd1a  71 13		 adc ($13),y
$1c:bd1c  a9 40 ce	  lda #$ce40
$1c:bd1f  23 13		 and $13,s
$1c:bd21  73 94		 adc ($94,s),y
$1c:bd23  42 46		 wdm #$46
$1c:bd25  83 0c		 sta $0c,s
$1c:bd27  82 18 5c	  brl $1942
$1c:bd2a  e6 68		 inc $68
$1c:bd2c  56 78		 lsr $78,x
$1c:bd2e  c5 9a		 cmp $9a
$1c:bd30  63 17		 adc $17,s
$1c:bd32  89 51 a2	  bit #$a251
$1c:bd35  57 c8		 eor [$c8],y
$1c:bd37  95 5a		 sta $5a,x
$1c:bd39  25 7d		 and $7d
$1c:bd3b  88			dey
$1c:bd3c  4d 85 22	  eor $2285
$1c:bd3f  a8			tay
$1c:bd40  28			plp
$1c:bd41  85 42		 sta $42
$1c:bd43  48			pha
$1c:bd44  b1 01		 lda ($01),y
$1c:bd46  58			cli
$1c:bd47  ad 00 f8	  lda $f800
$1c:bd4a  0b			phd
$1c:bd4b  61 e8		 adc ($e8,x)
$1c:bd4d  2d 0a 22	  and $220a
$1c:bd50  bf 2c 84 91   lda $91842c,x
$1c:bd54  92 06		 sta ($06)
$1c:bd56  f1 73		 sbc ($73),y
$1c:bd58  18			clc
$1c:bd59  b4 43		 ldy $43,x
$1c:bd5b  01 6e		 ora ($6e,x)
$1c:bd5d  0d 8b d8	  ora $d88b
$1c:bd60  07 40		 ora [$40]
$1c:bd62  22 08 e0 94   jsl $94e008
$1c:bd66  2a			rol a
$1c:bd67  53 58		 eor ($58,s),y
$1c:bd69  92 60		 sta ($60)
$1c:bd6b  20 55 29	  jsr $2955
$1c:bd6e  a4 6b		 ldy $6b
$1c:bd70  45 1a		 eor $1a
$1c:bd72  d1 c6		 cmp ($c6),y
$1c:bd74  b6 51		 ldx $51,y
$1c:bd76  ad 9c 6b	  lda $6b9c
$1c:bd79  25 1a		 and $1a
$1c:bd7b  c9 bd cd	  cmp #$cdbd
$1c:bd7e  e0 4f 81	  cpx #$814f
$1c:bd81  88			dey
$1c:bd82  44 80 e1	  mvp $e1,$80
$1c:bd85  14 e1		 trb $e1
$1c:bd87  45 38		 eor $38
$1c:bd89  71 4e		 adc ($4e),y
$1c:bd8b  94 53		 sty $53,x
$1c:bd8d  a7 14		 lda [$14]
$1c:bd8f  dd 45 37	  cmp $3745,x
$1c:bd92  65 71		 adc $71
$1c:bd94  19 01 70	  ora $7001,y
$1c:bd97  06 c1		 asl $c1
$1c:bd99  2c 30 8c	  bit $8c30
$1c:bd9c  f0 ca		 beq $bd68
$1c:bd9e  05 70		 ora $70
$1c:bda0  89 3a 02	  bit #$023a
$1c:bda3  68			pla
$1c:bda4  eb			xba
$1c:bda5  08			php
$1c:bda6  14 02		 trb $02
$1c:bda8  25 85		 and $85
$1c:bdaa  18			clc
$1c:bdab  8e 12 a5	  stx $a512
$1c:bdae  85 a1		 sta $a1
$1c:bdb0  40			rti
$1c:bdb1  2a			rol a
$1c:bdb2  43 61		 eor $61,s
$1c:bdb4  88			dey
$1c:bdb5  51 9a		 eor ($9a),y
$1c:bdb7  63 34		 adc $34,s
$1c:bdb9  3f 9e 1d a6   and $a61d9e,x
$1c:bdbd  15 09		 ora $09,x
$1c:bdbf  a0 bc 05	  ldy #$05bc
$1c:bdc2  e3 94		 sbc $94,s
$1c:bdc4  89 65 49	  bit #$4965
$1c:bdc7  e7 86		 sbc [$86]
$1c:bdc9  89 65 9a	  bit #$9a65
$1c:bdcc  63 88		 adc $88,s
$1c:bdce  22 9a 30 31   jsl $31309a
$1c:bdd2  26 12		 rol $12
$1c:bdd4  8f 71 23 dc   sta $dc2371
$1c:bdd8  58			cli
$1c:bdd9  f6 d2		 inc $d2,x
$1c:bddb  3d b5 38	  and $38b5,x
$1c:bdde  85 78		 sta $78
$1c:bde0  e0 1b 5a	  cpx #$5a1b
$1c:bde3  f1 d0		 sbc ($d0),y
$1c:bde5  34 91		 bit $91,x
$1c:bde7  ed 29 cc	  sbc $cc29
$1c:bdea  f4 b5 e4	  pea $e4b5
$1c:bded  00 1f		 brk #$1f
$1c:bdef  0b			phd
$1c:bdf0  c9 1e f2	  cmp #$f21e
$1c:bdf3  a3 cf		 lda $cf,s
$1c:bdf5  cb			wai
$1c:bdf6  5e 48 0a	  lsr $0a48,x
$1c:bdf9  64 92		 stz $92
$1c:bdfb  2c 95 53	  bit $5395
$1c:bdfe  90 1c		 bcc $be1c
$1c:be00  83 a9		 sta $a9,s
$1c:be02  1e ea c4	  asl $c4ea,x
$1c:be05  a4 d1		 ldy $d1
$1c:be07  ef 14 4a 65   sbc $654a14
$1c:be0b  1e f1 d7	  asl $d7f1,x
$1c:be0e  97 41		 sta [$41],y
$1c:be10  33 af		 and ($af,s),y
$1c:be12  78			sei
$1c:be13  fa			plx
$1c:be14  53 25		 eor ($25,s),y
$1c:be16  b8			clv
$1c:be17  e5 dd		 sbc $dd
$1c:be19  65 5e		 adc $5e
$1c:be1b  65 04		 adc $04
$1c:be1d  d8			cld
$1c:be1e  56 46		 lsr $46,x
$1c:be20  31 cd		 and ($cd),y
$1c:be22  36 44		 rol $44,x
$1c:be24  10 19		 bpl $be3f
$1c:be26  b3 18		 lda ($18,s),y
$1c:be28  b7 86		 lda [$86],y
$1c:be2a  1d e6 87	  ora $87e6,x
$1c:be2d  79 dd 23	  adc $23dd,y
$1c:be30  e6 31		 inc $31
$1c:be32  94 33		 sty $33,x
$1c:be34  8e f3 07	  stx $07f3
$1c:be37  79 e9 a1	  adc $a1e9,y
$1c:be3a  9a			txs
$1c:be3b  7e 67 1d	  ror $1d67,x
$1c:be3e  fe 06 32	  inc $3206,x
$1c:be41  e6 3f		 inc $3f
$1c:be43  83 4c		 sta $4c,s
$1c:be45  ef 3e 30 35   sbc $35303e
$1c:be49  7a			ply
$1c:be4a  cf 11 eb 80   cmp $80eb11
$1c:be4e  cc 20 22	  cpy $2220
$1c:be51  13 0e		 ora ($0e,s),y
$1c:be53  0f 33 ad 12   ora $12ad33
$1c:be57  81 53		 sta ($53,x)
$1c:be59  b6 d4		 ldx $d4,y
$1c:be5b  ed bb 9c	  sbc $9cbb
$1c:be5e  76 c2		 ror $c2,x
$1c:be60  f0 74		 beq $bed6
$1c:be62  8e dc 5e	  stx $5edc
$1c:be65  3b			tsc
$1c:be66  71 88		 adc ($88),y
$1c:be68  39 c4 7c	  and $7cc4,y
$1c:be6b  2e 91 db	  rol $db91
$1c:be6e  73 86		 adc ($86,s),y
$1c:be70  81 e7		 sta ($e7,x)
$1c:be72  6a			ror a
$1c:be73  87 38		 sta [$38]
$1c:be75  88			dey
$1c:be76  38			sec
$1c:be77  ed be 38	  sbc $38be
$1c:be7a  70 25		 bvs $bea1
$1c:be7c  51 29		 eor ($29),y
$1c:be7e  10 d0		 bpl $be50
$1c:be80  4b			phk
$1c:be81  60			rts
$1c:be82  59 06 a8	  eor $a806,y
$1c:be85  44 b5 11	  mvp $11,$b5
$1c:be88  2d cc 4b	  and $4bcc
$1c:be8b  70 6f		 bvs $befc
$1c:be8d  1d 49 cc	  ora $cc49,x
$1c:be90  4e 40 70	  lsr $7040
$1c:be93  0c cc 4b	  tsb $4bcc
$1c:be96  30 73		 bmi $bf0b
$1c:be98  34 01		 bit $01,x
$1c:be9a  1f 09 04 09   ora $090409,x
$1c:be9e  10 3a		 bpl $beda
$1c:bea0  02 00		 cop #$00
$1c:bea2  12 20		 ora ($20)
$1c:bea4  80 2d		 bra $bed3
$1c:bea6  43 74		 eor $74,s
$1c:bea8  62 51 4d	  per $0bfc
$1c:beab  54 53 57	  mvn $57,$53
$1c:beae  14 dd		 trb $dd
$1c:beb0  45 37		 eor $37
$1c:beb2  71 48		 adc ($48),y
$1c:beb4  0a			asl a
$1c:beb5  ac 21 dc	  ldy $dc21
$1c:beb8  aa			tax
$1c:beb9  75 be		 adc $be,x
$1c:bebb  1d da 87	  ora $87da,x
$1c:bebe  76 e1		 ror $e1,x
$1c:bec0  d0 d8		 bne $be9a
$1c:bec2  77 36		 adc [$36],y
$1c:bec4  1d dc 87	  ora $87dc,x
$1c:bec7  77 61		 adc [$61],y
$1c:bec9  dc b8 77	  jml [$77b8]
$1c:becc  32 05		 and ($05)
$1c:bece  00 61		 brk #$61
$1c:bed0  84 4b		 sty $4b
$1c:bed2  a1 16		 lda ($16,x)
$1c:bed4  af c4 bc 0c   lda $0cbcc4
$1c:bed8  90 8a		 bcc $be64
$1c:beda  74 a2		 stz $a2,x
$1c:bedc  9d 36 79	  sta $7936,x
$1c:bedf  65 99		 adc $99
$1c:bee1  41 d1		 eor ($d1,x)
$1c:bee3  6b			rtl
$1c:bee4  8f 86 21 ac   sta $ac2186
$1c:bee8  88			dey
$1c:bee9  6b			rtl
$1c:beea  62 1b c8	  per $8708
$1c:beed  86 f6		 stx $f6
$1c:beef  29 c8 8a	  and #$8ac8
$1c:bef2  72 62		 adc ($62)
$1c:bef4  9d 88 a7	  sta $a788,x
$1c:bef7  65 8a		 adc $8a
$1c:bef9  3b			tsc
$1c:befa  06 28		 asl $28
$1c:befc  f0 1b		 beq $bf19
$1c:befe  20 c5 1f	  jsr $1fc5
$1c:bf01  0b			phd
$1c:bf02  0c 98 a3	  tsb $a398
$1c:bf05  96 89		 stx $89,y
$1c:bf07  61 98		 adc ($98,x)
$1c:bf09  a4 03		 ldy $03
$1c:bf0b  1f 04 4b 62   ora $624b04,x
$1c:bf0f  f9 1e 08	  sbc $081e,y
$1c:bf12  14 80		 trb $80
$1c:bf14  27 96		 and [$96]
$1c:bf16  88			dey
$1c:bf17  40			rti
$1c:bf18  83 e3		 sta $e3,s
$1c:bf1a  88			dey
$1c:bf1b  10 a8		 bpl $bec5
$1c:bf1d  80 31		 bra $bf50
$1c:bf1f  31 2f		 and ($2f),y
$1c:bf21  44 4b d3	  mvp $d3,$4b
$1c:bf24  12 ab		 ora ($ab)
$1c:bf26  44 aa f1	  mvp $f1,$aa
$1c:bf29  0f 44 42 bb   ora $bb4244
$1c:bf2d  10 9a		 bpl $bec9
$1c:bf2f  07 ce		 ora [$ce]
$1c:bf31  4d 0c e3	  eor $e30c
$1c:bf34  c3 3d		 cmp $3d,s
$1c:bf36  51 09		 eor ($09),y
$1c:bf38  b0 7c		 bcs $bfb6
$1c:bf3a  21 9e		 and ($9e,x)
$1c:bf3c  b2 18		 lda ($18)
$1c:bf3e  0f ca 21 0a   ora $0a21ca
$1c:bf42  88			dey
$1c:bf43  7b			tdc
$1c:bf44  08			php
$1c:bf45  e5 10		 sbc $10
$1c:bf47  f6 c4		 inc $c4,x
$1c:bf49  21 24		 and ($24,x)
$1c:bf4b  71 29		 adc ($29),y
$1c:bf4d  01 80		 ora ($80,x)
$1c:bf4f  62 54 68	  per $27a6
$1c:bf52  97 b2		 sta [$b2],y
$1c:bf54  24 34		 bit $34
$1c:bf56  0b			phd
$1c:bf57  ec 4b bd	  cpx $bd4b
$1c:bf5a  12 81		 ora ($81)
$1c:bf5c  24 c7		 bit $c7
$1c:bf5e  dd d0 ef	  cmp $efd0,x
$1c:bf61  a7 c0		 lda [$c0]
$1c:bf63  ee 49 f1	  inc $f149
$1c:bf66  3e 17 7e	  rol $7e17,x
$1c:bf69  a1 ef		 lda ($ef,x)
$1c:bf6b  0f 81 dc 73   ora $73dc81
$1c:bf6f  61 f1		 adc ($f1,x)
$1c:bf71  44 06 69	  mvp $69,$06
$1c:bf74  02 67		 cop #$67
$1c:bf76  e0 f8 26	  cpx #$26f8
$1c:bf79  c1 f2		 cmp ($f2,x)
$1c:bf7b  14 ef		 trb $ef
$1c:bf7d  a3 0c		 lda $0c,s
$1c:bf7f  a1 ca		 lda ($ca,x)
$1c:bf81  23 51		 and $51,s
$1c:bf83  9f c5 3e 3f   sta $3f3ec5,x
$1c:bf87  28			plp
$1c:bf88  77 c9		 adc [$c9],y
$1c:bf8a  3e 2b 21	  rol $212b,x
$1c:bf8d  87 72		 sta [$72]
$1c:bf8f  e1 df		 sbc ($df,x)
$1c:bf91  35 99		 and $99,x
$1c:bf93  53 be		 eor ($be,s),y
$1c:bf95  70 ee		 bvs $bf85
$1c:bf97  62 ec fc	  per $bc86
$1c:bf9a  d0 ef		 bne $bf8b
$1c:bf9c  3c 3b eb	  bit $eb3b,x
$1c:bf9f  0e fb 63	  asl $63fb
$1c:bfa2  be b8 ef	  ldx $efb8,y
$1c:bfa5  b3 3c		 lda ($3c,s),y
$1c:bfa7  a2 50 16	  ldx #$1650
$1c:bfaa  fa			plx
$1c:bfab  44 1c cb	  mvp $cb,$1c
$1c:bfae  12 cc		 ora ($cc)
$1c:bfb0  44 9e 20	  mvp $20,$9e
$1c:bfb3  74 09		 stz $09,x
$1c:bfb5  12 5d		 ora ($5d)
$1c:bfb7  9e 23 99	  stz $9923,x
$1c:bfba  00 8e		 brk #$8e
$1c:bfbc  a2 65 a9	  ldx #$a965
$1c:bfbf  99 6e 26	  sta $266e,y
$1c:bfc2  5b			tcd
$1c:bfc3  99 96 a2	  sta $a296,y
$1c:bfc6  29 4e 8a	  and #$8a4e
$1c:bfc9  57 a2		 eor [$a2],y
$1c:bfcb  18			clc
$1c:bfcc  e8			inx
$1c:bfcd  86 3f		 stx $3f
$1c:bfcf  a1 8e		 lda ($8e,x)
$1c:bfd1  e8			inx
$1c:bfd2  63 c2		 adc $c2,s
$1c:bfd4  20 0f 00	  jsr $000f
$1c:bfd7  b8			clv
$1c:bfd8  44 2d 41	  mvp $41,$2d
$1c:bfdb  b2 a9		 lda ($a9)
$1c:bfdd  5f 22 54 9a   eor $9a5422,x
$1c:bfe1  91 b8		 sta ($b8),y
$1c:bfe3  2b			pld
$1c:bfe4  27 31		 and [$31]
$1c:bfe6  90 01		 bcc $bfe9
$1c:bfe8  42 25		 wdm #$25
$1c:bfea  30 88		 bmi $bf74
$1c:bfec  6a			ror a
$1c:bfed  a2 1a b8	  ldx #$b81a
$1c:bff0  86 ea		 stx $ea
$1c:bff2  21 bb		 and ($bb,x)
$1c:bff4  89 48 4e	  bit #$4e48
$1c:bff7  63 31		 adc $31,s
$1c:bff9  02 84		 cop #$84
$1c:bffb  43 91		 eor $91,s
$1c:bffd  10 e4		 bpl $bfe3
$1c:bfff  c4 3b		 cpy $3b
$1c:c001  11 0e		 ora ($0e),y
$1c:c003  cc 53 a5	  cpy $a553
$1c:c006  14 e9		 trb $e9
$1c:c008  84 ca		 sty $ca
$1c:c00a  21 88		 and ($88,x)
$1c:c00c  47 8c		 eor [$8c]
$1c:c00e  22 21 09 e6   jsl $e60921
$1c:c012  69 f9 9a	  adc #$9af9
$1c:c015  68			pla
$1c:c016  84 2a		 sty $2a
$1c:c018  21 0b		 and ($0b,x)
$1c:c01a  88			dey
$1c:c01b  6b			rtl
$1c:c01c  22 12 98 86   jsl $869812
$1c:c020  f2 20		 sbc ($20)
$1c:c022  2c 07 a0	  bit $a007
$1c:c025  50 08		 bvc $c02f
$1c:c027  21 32		 and ($32,x)
$1c:c029  c5 37		 cmp $37
$1c:c02b  ca			dex
$1c:c02c  65 8b		 adc $8b
$1c:c02e  3a			dec a
$1c:c02f  8d 04 e6	  sta $e604
$1c:c032  38			sec
$1c:c033  b2 08		 lda ($08)
$1c:c035  c3 a2		 cmp $a2,s
$1c:c037  50 f8		 bvc $c031
$1c:c039  94 e6		 sty $e6,x
$1c:c03b  25 fd		 and $fd
$1c:c03d  80 23		 bra $c062
$1c:c03f  fd 3a 85	  sbc $853a,x
$1c:c042  90 c8		 bcc $c00c
$1c:c044  77 d4		 adc [$d4],y
$1c:c046  e3 ef		 sbc $ef,s
$1c:c048  43 8e		 eor $8e,s
$1c:c04a  7e 25 1e	  ror $1e25,x
$1c:c04d  89 6b e6	  bit #$e66b
$1c:c050  1b			tcs
$1c:c051  e9 86 fe	  sbc #$fe86
$1c:c054  69 82 ba	  adc #$ba82
$1c:c057  60			rts
$1c:c058  a2 59 e4	  ldx #$e459
$1c:c05b  48			pha
$1c:c05c  eb			xba
$1c:c05d  a2 51 f8	  ldx #$f851
$1c:c060  b5 7e		 lda $7e,x
$1c:c062  ad 5f cb	  lda $cb5f
$1c:c065  5a			phy
$1c:c066  fa			plx
$1c:c067  d6 b4		 dec $b4,x
$1c:c069  b7 b7		 lda [$b7],y
$1c:c06b  b6 2d		 ldx $2d,y
$1c:c06d  a2 ab 68	  ldx #$68ab
$1c:c070  a2 db 2a	  ldx #$2adb
$1c:c073  b6 ca		 ldx $ca,y
$1c:c075  69 83 ba	  adc #$ba83
$1c:c078  3e 03 67	  rol $6703,x
$1c:c07b  34 d9		 bit $d9,x
$1c:c07d  e4 3e		 cpx $3e
$1c:c07f  0f f1 89 00   ora $0089f1
$1c:c083  c1 8e		 cmp ($8e,x)
$1c:c085  4f 32 6f 78   eor $786f32
$1c:c089  7f c6 1e 41   adc $411ec6,x
$1c:c08d  f2 97		 sbc ($97)
$1c:c08f  98			tya
$1c:c090  fc e9 e8	  jsr ($e8e9,x)
$1c:c093  5f 4b 74 52   eor $52744b,x
$1c:c097  02 a7		 cop #$a7
$1c:c099  48			pha
$1c:c09a  27 ee		 and [$ee]
$1c:c09c  89 fb c2	  bit #$c2fb
$1c:c09f  7e f8 9f	  ror $9ff8,x
$1c:c0a2  b8			clv
$1c:c0a3  c7 fa		 cmp [$fa]
$1c:c0a5  b1 fe		 lda ($fe),y
$1c:c0a7  cc 7f bb	  cpy $bb7f
$1c:c0aa  1f e7 23 41   ora $4123e7,x
$1c:c0ae  be f4 6f	  ldx $6ff4,y
$1c:c0b1  bc 1b f1	  ldy $f11b,x
$1c:c0b4  46 fc		 lsr $fc
$1c:c0b6  41 bf		 eor ($bf,x)
$1c:c0b8  34 6f		 bit $6f,x
$1c:c0ba  cc 1b f5	  cpy $f51b
$1c:c0bd  46 fd		 lsr $fd
$1c:c0bf  41 3f		 eor ($3f,x)
$1c:c0c1  f4 4f fe	  pea $fe4f
$1c:c0c4  13 ff		 ora ($ff,s),y
$1c:c0c6  c4 ff		 cpy $ff
$1c:c0c8  c1 3f		 cmp ($3f,x)
$1c:c0ca  94 4f		 sty $4f,x
$1c:c0cc  e6 13		 inc $13
$1c:c0ce  f9 c4 fe	  sbc $fec4,y
$1c:c0d1  2b			pld
$1c:c0d2  d8			cld
$1c:c0d3  00 08		 brk #$08
$1c:c0d5  82 40 1d	  brl $de18
$1c:c0d8  e9 08 9a	  sbc #$9a08
$1c:c0db  c2 24		 rep #$24
$1c:c0dd  2f 51 c0 c1   and $c1c051
$1c:c0e1  22 0f f0 86   jsl $86f00f
$1c:c0e5  4e e1 99	  lsr $99e1
$1c:c0e8  b0 09		 bcs $c0f3
$1c:c0ea  e7 21		 sbc [$21]
$1c:c0ec  99 d8 64	  sta $64d8,y
$1c:c0ef  58			cli
$1c:c0f0  16 0f		 asl $0f,x
$1c:c0f2  f2 09		 sbc ($09)
$1c:c0f4  bd 4d de	  lda $de4d,x
$1c:c0f7  36 37		 rol $37,x
$1c:c0f9  79 f0 9d	  adc $9df0,y
$1c:c0fc  e3 d2		 sbc $d2,s
$1c:c0fe  7a			ply
$1c:c0ff  8c 7a 11	  sty $117a
$1c:c102  3f 84 53 e1   and $e15384,x
$1c:c106  19 08 44	  ora $4408,y
$1c:c109  c5 ea		 cmp $ea
$1c:c10b  34 1a		 bit $1a,x
$1c:c10d  20 c0 47	  jsr $47c0
$1c:c110  e3 2e		 sbc $2e,s
$1c:c112  86 51		 stx $51
$1c:c114  e1 91		 sbc ($91,x)
$1c:c116  28			plp
$1c:c117  64 ae		 stz $ae
$1c:c119  19 22 86	  ora $8622,y
$1c:c11c  44 e1 91	  mvp $91,$e1
$1c:c11f  48			pha
$1c:c120  64 8e		 stz $8e
$1c:c122  19 24 86	  ora $8624,y
$1c:c125  45 41		 eor $41
$1c:c127  e3 25		 sbc $25,s
$1c:c129  86 49		 stx $49
$1c:c12b  a1 91		 lda ($91,x)
$1c:c12d  78			sei
$1c:c12e  64 62		 stz $62
$1c:c130  19 27 86	  ora $8627,y
$1c:c133  4a			lsr a
$1c:c134  21 91		 and ($91,x)
$1c:c136  97 78		 sta [$78],y
$1c:c138  43 25		 eor $25,s
$1c:c13a  34 c9		 bit $c9,x
$1c:c13c  54 33 d1	  mvn $d1,$33
$1c:c13f  0c e3 c3	  tsb $c3e3
$1c:c142  3f 10 ce bc   and $bcce10,x
$1c:c146  33 91		 and ($91,s),y
$1c:c148  0c e4 c3	  tsb $c3e4
$1c:c14b  3b			tsc
$1c:c14c  10 ce		 bpl $c11c
$1c:c14e  cb			wai
$1c:c14f  bd 21 90	  lda $9021,x
$1c:c152  43 bb		 eor $bb,s
$1c:c154  80 83		 bra $c0d9
$1c:c156  8b			phb
$1c:c157  0c ea 43	  tsb $43ea
$1c:c15a  3a			dec a
$1c:c15b  b0 ce		 bcs $c12b
$1c:c15d  34 33		 bit $33,x
$1c:c15f  d3 0c		 cmp ($0c,s),y
$1c:c161  eb			xba
$1c:c162  43 3f		 eor $3f,s
$1c:c164  28			plp
$1c:c165  13 82		 ora ($82,s),y
$1c:c167  9a			txs
$1c:c168  47 fd		 eor [$fd]
$1c:c16a  0c ff 9e	  tsb $9eff
$1c:c16d  ca			dex
$1c:c16e  19 cb 86	  ora $86cb,y
$1c:c171  76 a1		 ror $a1,x
$1c:c173  1d 38 67	  ora $6738,x
$1c:c176  a8			tay
$1c:c177  de 29 a0	  dec $a029,x
$1c:c17a  3a			dec a
$1c:c17b  07 e6		 ora [$e6]
$1c:c17d  19 ca 5f	  ora $5fca,y
$1c:c180  84 43		 sty $43
$1c:c182  d4 c3		 pei ($c3)
$1c:c184  05 bb		 ora $bb
$1c:c186  04 d1		 tsb $d1
$1c:c188  66 10		 ror $10
$1c:c18a  8f 2c 33 99   sta $99332c
$1c:c18e  08			php
$1c:c18f  fa			plx
$1c:c190  e2 3e		 sep #$3e
$1c:c192  05 20		 ora $20
$1c:c194  8a			txa
$1c:c195  43 62		 eor $62,s
$1c:c197  91 c8		 sta ($c8),y
$1c:c199  a4 76		 ldy $76
$1c:c19b  10 44		 bpl $c1e1
$1c:c19d  0e 0c 23	  asl $230c
$1c:c1a0  a1 08		 lda ($08,x)
$1c:c1a2  e8			inx
$1c:c1a3  c2 28		 rep #$28
$1c:c1a5  ae f1 9b	  ldx $9bf1
$1c:c1a8  bb			tyx
$1c:c1a9  c1 02		 cmp ($02,x)
$1c:c1ab  7d ba 67	  adc $67ba,x
$1c:c1ae  6d ee 90	  adc $90ee
$1c:c1b1  ce e4 23	  dec $23e4
$1c:c1b4  86 d3		 stx $d3
$1c:c1b6  1c 4c 23	  trb $234c
$1c:c1b9  fb			xce
$1c:c1ba  14 80		 trb $80
$1c:c1bc  03 c6		 ora $c6,s
$1c:c1be  71 14		 adc ($14),y
$1c:c1c0  9c 83 ce	  stz $ce83
$1c:c1c3  74 0f		 stz $0f,x
$1c:c1c5  19 64 52	  ora $5264,y
$1c:c1c8  5b			tcd
$1c:c1c9  10 9e		 bpl $c169
$1c:c1cb  44 27 b0	  mvp $b0,$27
$1c:c1ce  c8			iny
$1c:c1cf  5c 32 77 0c   jml $0c7732
$1c:c1d3  cd c3 33	  cmp $33c3
$1c:c1d6  80 b1		 bra $c189
$1c:c1d8  d5 3b		 cmp $3b,x
$1c:c1da  cc 68 94	  cpy $9468
$1c:c1dd  38			sec
$1c:c1de  44 d2 11	  mvp $11,$d2
$1c:c1e1  36 84		 rol $84,x
$1c:c1e3  51 0f		 eor ($0f),y
$1c:c1e5  e1 08		 sbc ($08,x)
$1c:c1e7  d5 91		 cmp $91,x
$1c:c1e9  47 77		 eor [$77]
$1c:c1eb  08			php
$1c:c1ec  de 45 29	  dec $2945,x
$1c:c1ef  11 4a		 ora ($4a),y
$1c:c1f1  4b			phk
$1c:c1f2  f4 22 15	  pea $1522
$1c:c1f5  98			tya
$1c:c1f6  a5 2a		 lda $2a
$1c:c1f8  21 4b		 and ($4b,x)
$1c:c1fa  88			dey
$1c:c1fb  56 a2		 lsr $a2,x
$1c:c1fd  15 b8		 ora $b8,x
$1c:c1ff  85 32		 sta $32
$1c:c201  21 4d		 and ($4d,x)
$1c:c203  88			dey
$1c:c204  57 22		 eor [$22],y
$1c:c206  15 d8		 ora $d8,x
$1c:c208  84 00		 sty $00
$1c:c20a  ce 35 e8	  dec $e835
$1c:c20d  85 7e		 sta $7e
$1c:c20f  11 50		 ora ($50),y
$1c:c211  84 54		 sty $54
$1c:c213  48			pha
$1c:c214  a3 61		 lda $61,s
$1c:c216  77 8c		 adc [$8c],y
$1c:c218  c9 de 34	  cmp #$34de
$1c:c21b  22 08 cd 53   jsl $53cd08
$1c:c21f  e5 08		 sbc $08
$1c:c221  a7 91		 lda [$91]
$1c:c223  45 ec		 eor $ec
$1c:c225  31 48		 and ($48),y
$1c:c227  fc 42 d3	  jsr ($d342,x)
$1c:c22a  14 97		 trb $97
$1c:c22c  c5 2f		 cmp $2f
$1c:c22e  31 0b		 and ($0b),y
$1c:c230  54 42 d7	  mvn $d7,$42
$1c:c233  14 bd		 trb $bd
$1c:c235  45 2f		 eor $2f
$1c:c237  71 0b		 adc ($0b),y
$1c:c239  64 42		 stz $42
$1c:c23b  db			stp
$1c:c23c  10 be		 bpl $c1fc
$1c:c23e  44 2f b1	  mvp $b1,$2f
$1c:c241  0b			phd
$1c:c242  74 42		 stz $42,x
$1c:c244  df 10 bf 44   cmp $44bf10,x
$1c:c248  2f e4 51 b8   and $b851e4
$1c:c24c  91 47		 sta ($47),y
$1c:c24e  03 48		 ora $48,s
$1c:c250  f2 c2		 sbc ($c2)
$1c:c252  3c 74 8f	  bit $8f74,x
$1c:c255  ac 23 e7	  ldy $e723
$1c:c258  08			php
$1c:c259  da			phx
$1c:c25a  c2 34		 rep #$34
$1c:c25c  f0 88		 beq $c1e6
$1c:c25e  3c 22 0c	  bit $0c22,x
$1c:c261  79 02 28	  adc $2802,y
$1c:c264  d0 88		 bne $c1ee
$1c:c266  a2 44 14	  ldx #$1444
$1c:c269  19 f4 e1	  ora $e1f4,y
$1c:c26c  9e 10 48	  stz $4810,x
$1c:c26f  43 3e		 eor $3e,s
$1c:c271  30 8d		 bmi $c200
$1c:c273  48			pha
$1c:c274  24 7c		 bit $7c
$1c:c276  90 85		 bcc $c1fd
$1c:c278  c0 73 a1	  cpy #$a173
$1c:c27b  1c f8 47	  trb $47f8
$1c:c27e  7a			ply
$1c:c27f  11 df		 ora ($df),y
$1c:c281  84 50		 sty $50
$1c:c283  08			php
$1c:c284  61 08		 adc ($08,x)
$1c:c286  f9 22 48	  sbc $4822,y
$1c:c289  7e 24 00	  ror $0024,x
$1c:c28c  a2 43 23	  ldx #$2343
$1c:c28f  50 c8		 bvc $c259
$1c:c291  dc 33 3a	  jml [$3a33]
$1c:c294  db			stp
$1c:c295  11 50		 ora ($50),y
$1c:c297  4e db 60	  lsr $60db
$1c:c29a  0b			phd
$1c:c29b  28			plp
$1c:c29c  46 64		 lsr $64
$1c:c29e  22 3a 96 c8   jsl $c8963a
$1c:c2a2  43 2a		 eor $2a,s
$1c:c2a4  ed d0 86	  sbc $86d0
$1c:c2a7  59 e1 1f	  eor $1fe1,y
$1c:c2aa  48			pha
$1c:c2ab  42 f0		 wdm #$f0
$1c:c2ad  3c d0 8f	  bit $8fd0,x
$1c:c2b0  3c 23 df	  bit $df23,x
$1c:c2b3  c8			iny
$1c:c2b4  f8			sed
$1c:c2b5  42 35		 wdm #$35
$1c:c2b7  47 b1		 eor [$b1]
$1c:c2b9  9b			txy
$1c:c2ba  9e c7 12	  stz $12c7,x
$1c:c2bd  2b			pld
$1c:c2be  19 04 22	  ora $2204,y
$1c:c2c1  22 c5 16 20   jsl $2016c5
$1c:c2c5  2e 00 24	  rol $2400
$1c:c2c8  0b			phd
$1c:c2c9  c0 70 17	  cpy #$1770
$1c:c2cc  39 b2 0e	  and $0eb2,y
$1c:c2cf  b1 d4		 lda ($d4),y
$1c:c2d1  c2 37		 rep #$37
$1c:c2d3  25 11		 and $11
$1c:c2d5  f8			sed
$1c:c2d6  36 c6		 rol $c6,x
$1c:c2d8  ac 19 1b	  ldy $1b19
$1c:c2db  30 dd		 bmi $c2ba
$1c:c2dd  61 30		 adc ($30,x)
$1c:c2df  8e 6a cc	  stx $cc6a
$1c:c2e2  7c 46 b0	  jmp ($b046,x)
$1c:c2e5  a6 77		 ldx $77
$1c:c2e7  29 9d b0	  and #$b09d
$1c:c2ea  39 42 20	  and $2042,y
$1c:c2ed  66 51		 ror $51
$1c:c2ef  3d 84 26	  and $2684,x
$1c:c2f2  19 cb 86	  ora $86cb,y
$1c:c2f5  71 61		 adc ($61),y
$1c:c2f7  9d 48 67	  sta $6748,x
$1c:c2fa  55 ba		 eor $ba,x
$1c:c2fc  3e f8 27	  rol $27f8,x
$1c:c2ff  d9 16 10	  cmp $1016,y
$1c:c302  8a			txa
$1c:c303  ac 22 a9	  ldy $a922
$1c:c306  08			php
$1c:c307  b2 c2		 lda ($c2)
$1c:c309  2c 82 91	  bit $9182
$1c:c30c  f0 38		 beq $c346
$1c:c30e  47 e0		 eor [$e0]
$1c:c310  29 0a 47	  and #$470a
$1c:c313  83 11		 sta $11,s
$1c:c315  e0 e6 37	  cpx #$37e6
$1c:c318  80 cc		 bra $c2e6
$1c:c31a  06 60		 asl $60
$1c:c31c  98			tya
$1c:c31d  19 c2 19	  ora $19c2,y
$1c:c320  eb			xba
$1c:c321  86 7b		 stx $7b
$1c:c323  00 e5		 brk #$e5
$1c:c325  50 cc		 bvc $c2f3
$1c:c327  44 20 51	  mvp $51,$20
$1c:c32a  09 f2 ec	  ora #$ecf2
$1c:c32d  07 63		 ora [$63]
$1c:c32f  a7 3d		 lda [$3d]
$1c:c331  8e dc f6	  stx $f6dc
$1c:c334  27 80		 and [$80]
$1c:c336  3c 01 ec	  bit $ec01,x
$1c:c339  3d c3 71	  and $71c3,x
$1c:c33c  85 0e		 sta $0e
$1c:c33e  c7 f9		 cmp [$f9]
$1c:c340  44 80 36	  mvp $36,$80
$1c:c343  5a			phy
$1c:c344  11 c0		 ora ($c0),y
$1c:c346  6c 84 31	  jmp ($3184)
$1c:c349  cc 5d c8	  cpy $c85d
$1c:c34c  67 74		 adc [$74]
$1c:c34e  d2 15		 cmp ($15)
$1c:c350  0d 73 b4	  ora $b473
$1c:c353  22 1b 18 86   jsl $86181b
$1c:c357  b5 ee		 lda $ee,x
$1c:c359  3b			tsc
$1c:c35a  d7 d8		 cmp [$d8],y
$1c:c35c  e8			inx
$1c:c35d  5f 2e 00 07   eor $07002e,x
$1c:c361  e1 3e		 sbc ($3e,x)
$1c:c363  03 5e		 ora $5e,s
$1c:c365  fb			xce
$1c:c366  1d f4 43	  ora $43f4,x
$1c:c369  2b			pld
$1c:c36a  10 bb		 bpl $c327
$1c:c36c  06 47		 asl $47
$1c:c36e  0c ad 05	  tsb $05ad
$1c:c371  68			pla
$1c:c372  36 48		 rol $48,x
$1c:c374  3a			dec a
$1c:c375  01 71		 ora ($71,x)
$1c:c377  14 05		 trb $05
$1c:c379  da			phx
$1c:c37a  19 ed 88	  ora $88ed,y
$1c:c37d  5d 13 60	  eor $6013,x
$1c:c380  31 00		 and ($00),y
$1c:c382  c8			iny
$1c:c383  e1 44		 sbc ($44,x)
$1c:c385  e2 3a		 sep #$3a
$1c:c387  0c 78 65	  tsb $6578
$1c:c38a  07 22		 ora [$22]
$1c:c38c  1a			inc a
$1c:c38d  02 00		 cop #$00
$1c:c38f  0b			phd
$1c:c390  06 21		 asl $21
$1c:c392  77 13		 adc [$13],y
$1c:c394  8e 1e a0	  stx $a01e
$1c:c397  12 00		 ora ($00)
$1c:c399  00 6c		 brk #$6c
$1c:c39b  e2 00		 sep #$00
$1c:c39d  68			pla
$1c:c39e  d7 c2		 cmp [$c2],y
$1c:c3a0  06 81		 asl $81
$1c:c3a2  be 34 80	  ldx $8034,y
$1c:c3a5  cc 6b 15	  cpy $156b
$1c:c3a8  08			php
$1c:c3a9  0c 42 d0	  tsb $d042
$1c:c3ac  27 12		 and [$12]
$1c:c3ae  62 0a 01	  per $c4bb
$1c:c3b1  00 83		 brk #$83
$1c:c3b3  a2 26		 ldx #$26
$1c:c3b5  10 78		 bpl $c42f
$1c:c3b7  06 80		 asl $80
$1c:c3b9  90 27		 bcc $c3e2
$1c:c3bb  b0 3f		 bcs $c3fc
$1c:c3bd  02 b1		 cop #$b1
$1c:c3bf  10 c2		 bpl $c383
$1c:c3c1  d4 0b		 pei ($0b)
$1c:c3c3  80 52		 bra $c417
$1c:c3c5  00 d0		 brk #$d0
$1c:c3c7  61 ca		 adc ($ca,x)
$1c:c3c9  20 69 1c	  jsr $1c69
$1c:c3cc  39 a4 61	  and $61a4,y
$1c:c3cf  f1 08		 sbc ($08),y
$1c:c3d1  12 bc		 ora ($bc)
$1c:c3d3  2a			rol a
$1c:c3d4  19 84 69	  ora $6984,y
$1c:c3d7  44 35 82	  mvp $82,$35
$1c:c3da  71 d4		 adc ($d4),y
$1c:c3dc  2f c7 62 9f   and $9f62c7
$1c:c3e0  17 e0		 ora [$e0],y
$1c:c3e2  30 01		 bmi $c3e5
$1c:c3e4  44 5a c5	  mvp $c5,$5a
$1c:c3e7  68			pla
$1c:c3e8  ab			plb
$1c:c3e9  08			php
$1c:c3ea  ec 04 00	  cpx $0004
$1c:c3ed  81 41		 sta ($41,x)
$1c:c3ef  2e 62 71	  rol $7162
$1c:c3f2  22 16 b0 66   jsl $66b016
$1c:c3f6  0e 74 88	  asl $8874
$1c:c3f9  43 a2		 eor $a2,s
$1c:c3fb  13 e8		 ora ($e8,s),y
$1c:c3fd  80 d8		 bra $c3d7
$1c:c3ff  2e b1 0f	  rol $0fb1
$1c:c402  da			phx
$1c:c403  ec 54 84	  cpx $8454
$1c:c406  36 21		 rol $21,x
$1c:c408  b0 15		 bcs $c41f
$1c:c40a  05 1e		 ora $1e
$1c:c40c  77 65		 adc [$65],y
$1c:c40e  69 2b		 adc #$2b
$1c:c410  46 1c		 lsr $1c
$1c:c412  b5 08		 lda $08,x
$1c:c414  26 4e		 rol $4e
$1c:c416  21 3e		 and ($3e,x)
$1c:c418  82 60 97	  brl $5b7b
$1c:c41b  60			rts
$1c:c41c  b5 17		 lda $17,x
$1c:c41e  90 3c		 bcc $c45c
$1c:c420  82 02 ad	  brl $7125
$1c:c423  1c 6a b4	  trb $b46a
$1c:c426  40			rti
$1c:c427  00 da		 brk #$da
$1c:c429  0c 23 74	  tsb $7423
$1c:c42c  95 a2		 sta $a2,x
$1c:c42e  94 20		 sty $20,x
$1c:c430  21 01		 and ($01,x)
$1c:c432  04 72		 tsb $72
$1c:c434  a3 c3		 lda $c3,s
$1c:c436  16 9b		 asl $9b,x
$1c:c438  d8			cld
$1c:c439  1b			tcs
$1c:c43a  41 85		 eor ($85,x)
$1c:c43c  6e 8b d8	  ror $d88b
$1c:c43f  00 40		 brk #$40
$1c:c441  88			dey
$1c:c442  25 40		 and $40
$1c:c444  60			rts
$1c:c445  15 63		 ora $63,x
$1c:c447  46 88		 lsr $88
$1c:c449  65 03		 adc $03
$1c:c44b  21 44		 and ($44,x)
$1c:c44d  c6 41		 dec $41
$1c:c44f  31 68		 and ($68),y
$1c:c451  90 82		 bcc $c3d5
$1c:c453  65 e0		 adc $e0
$1c:c455  98			tya
$1c:c456  88			dey
$1c:c457  26 30		 rol $30
$1c:c459  de 0b 90	  dec $900b,x
$1c:c45c  84 51		 sty $51
$1c:c45e  62 19 61	  per $257a
$1c:c461  50 2e		 bvc $c491
$1c:c463  42 09		 wdm #$09
$1c:c465  8a			txa
$1c:c466  3d 8e 5c	  and $5c8e,x
$1c:c469  de 28 c0	  dec $c028,x
$1c:c46c  c5 44		 cmp $44
$1c:c46e  32 a1		 and ($a1)
$1c:c470  90 45		 bcc $c4b7
$1c:c472  89 d8		 bit #$d8
$1c:c474  32 a8		 and ($a8)
$1c:c476  91 3f		 sta ($3f),y
$1c:c478  06 e1		 asl $e1
$1c:c47a  1e 10 8d	  asl $8d10,x
$1c:c47d  24 22		 bit $22
$1c:c47f  66 83		 ror $83
$1c:c481  08			php
$1c:c482  22 98 37 08   jsl $083798
$1c:c486  30 59		 bmi $c4e1
$1c:c488  8f ea 09 00   sta $0009ea
$1c:c48c  84 67		 sty $67
$1c:c48e  d6 e1		 dec $e1,x
$1c:c490  08			php
$1c:c491  5f 84 26 11   eor $112684,x
$1c:c495  cd 84 7d	  cmp $7d84
$1c:c498  e1 9c		 sbc ($9c,x)
$1c:c49a  b8			clv
$1c:c49b  67 32		 adc [$32]
$1c:c49d  11 99		 ora ($99),y
$1c:c49f  84 7c		 sty $7c
$1c:c4a1  18			clc
$1c:c4a2  23 bf		 and $bf,s
$1c:c4a4  67 9e		 adc [$9e]
$1c:c4a6  9d a2 ab	  sta $aba2,x
$1c:c4a9  f0 fe		 beq $c4a9
$1c:c4ab  33 ce		 and ($ce,s),y
$1c:c4ad  9f 08 f7 2c   sta $2cf708,x
$1c:c4b1  c6 c1		 dec $c1
$1c:c4b3  08			php
$1c:c4b4  9b			txy
$1c:c4b5  42 28		 wdm #$28
$1c:c4b7  8b			phb
$1c:c4b8  90 5c		 bcc $c516
$1c:c4ba  8b			phb
$1c:c4bb  a0 16		 ldy #$16
$1c:c4bd  84 ae		 sty $ae
$1c:c4bf  08			php
$1c:c4c0  04 32		 tsb $32
$1c:c4c2  a5 44		 lda $44
$1c:c4c4  00 05		 brk #$05
$1c:c4c6  89 86		 bit #$86
$1c:c4c8  0f 32 5c 8c   ora $8c5c32
$1c:c4cc  81 ae		 sta ($ae,x)
$1c:c4ce  14 86		 trb $86
$1c:c4d0  10 41		 bpl $c513
$1c:c4d2  a0 99		 ldy #$99
$1c:c4d4  48			pha
$1c:c4d5  62 08 55	  per $19e0
$1c:c4d8  e0 c7		 cpx #$c7
$1c:c4da  28			plp
$1c:c4db  24 42		 bit $42
$1c:c4dd  11 d3		 ora ($d3),y
$1c:c4df  61 90		 adc ($90,x)
$1c:c4e1  0c 1d a3	  tsb $a31d
$1c:c4e4  1e 73 8c	  asl $8c73,x
$1c:c4e7  b9 5a 31	  lda $315a,y
$1c:c4ea  07 98		 ora [$98]
$1c:c4ec  8e 04 c6	  stx $c604
$1c:c4ef  26 23		 rol $23
$1c:c4f1  2e 84 32	  rol $3284
$1c:c4f4  ed 04 c1	  sbc $c104
$1c:c4f7  86 42		 stx $42
$1c:c4f9  19 bd 27	  ora $27bd,y
$1c:c4fc  96 33		 stx $33,y
$1c:c4fe  5b			tcd
$1c:c4ff  0c d4 15	  tsb $15d4
$1c:c502  c7 62		 cmp [$62]
$1c:c504  4f 08 46 7a   eor $7a4608
$1c:c508  11 4e		 ora ($4e),y
$1c:c50a  a4 2f		 ldy $2f
$1c:c50c  03 4b		 ora $4b,s
$1c:c50e  08			php
$1c:c50f  d0 42		 bne $c553
$1c:c511  34 50		 bit $50,x
$1c:c513  8d 84 23	  sta $2384
$1c:c516  65 0c		 adc $0c
$1c:c518  d7 c2		 cmp [$c2],y
$1c:c51a  22 10 cd f1   jsl $f1cd10
$1c:c51e  c4 6e		 cpy $6e
$1c:c520  90 cc		 bcc $c4ee
$1c:c522  d4 33		 pei ($33)
$1c:c524  08			php
$1c:c525  19 02 19	  ora $1902,y
$1c:c528  27 cf		 and [$cf]
$1c:c52a  26 19		 rol $19
$1c:c52c  04 39		 tsb $39
$1c:c52e  43 00		 eor $00,s
$1c:c530  80 78		 bra $c5aa
$1c:c532  04 81		 tsb $81
$1c:c534  5d a1 98	  eor $98a1,x
$1c:c537  52 68		 eor ($68)
$1c:c539  a6 81		 ldx $81
$1c:c53b  30 17		 bmi $c554
$1c:c53d  72 68		 adc ($68)
$1c:c53f  e1 df		 sbc ($df,x)
$1c:c541  26 68		 rol $68
$1c:c543  15 08		 ora $08,x
$1c:c545  1c 45 4c	  trb $4c45
$1c:c548  07 62		 ora [$62]
$1c:c54a  4c 01 e0	  jmp $e001
$1c:c54d  30 c0		 bmi $c50f
$1c:c54f  31 ac		 and ($ac),y
$1c:c551  41 32		 eor ($32,x)
$1c:c553  30 cb		 bmi $c520
$1c:c555  42 1d		 wdm #$1d
$1c:c557  84 61		 sty $61
$1c:c559  50 80		 bvc $c4db
$1c:c55b  88			dey
$1c:c55c  c2 21		 rep #$21
$1c:c55e  0f 79 94 33   ora $339479
$1c:c562  fd 0c ff	  sbc $ff0c,x
$1c:c565  c2 2e		 rep #$2e
$1c:c567  06 94		 asl $94
$1c:c569  71 9a		 adc ($9a),y
$1c:c56b  a0 35		 ldy #$35
$1c:c56d  44 d1 78	  mvp $78,$d1
$1c:c570  1a			inc a
$1c:c571  fc 18 60	  jsr ($6018,x)
$1c:c574  c3 12		 cmp $12,s
$1c:c576  81 5e		 sta ($5e,x)
$1c:c578  09 e1 04	  ora #$04e1
$1c:c57b  b9 21 cf	  lda $cf21,y
$1c:c57e  24 57		 bit $57
$1c:c580  01 18		 ora ($18,x)
$1c:c582  43 34		 eor $34,s
$1c:c584  60			rts
$1c:c585  f2 86		 sbc ($86)
$1c:c587  76 21		 ror $21,x
$1c:c589  9d 98 67	  sta $6798,x
$1c:c58c  a2 19		 ldx #$19
$1c:c58e  e9 2f 81	  sbc #$812f
$1c:c591  8c 0c 67	  sty $670c
$1c:c594  89 84 2a	  bit #$2a84
$1c:c597  0b			phd
$1c:c598  54 f7 92	  mvn $92,$f7
$1c:c59b  80 81		 bra $c51e
$1c:c59d  44 0c 19	  mvp $19,$0c
$1c:c5a0  20 58 bf	  jsr $bf58
$1c:c5a3  83 0c		 sta $0c,s
$1c:c5a5  71 12		 adc ($12),y
$1c:c5a7  41 6a		 eor ($6a,x)
$1c:c5a9  0d e0 fd	  ora $fde0
$1c:c5ac  1d f4 33	  ora $33f4,x
$1c:c5af  97 0c		 sta [$0c],y
$1c:c5b1  e6 33		 inc $33
$1c:c5b3  c0 b6		 cpy #$b6
$1c:c5b5  50 8f		 bvc $c546
$1c:c5b7  9c 23 9d	  stz $9d23
$1c:c5ba  08			php
$1c:c5bb  e2 26		 sep #$26
$1c:c5bd  cd 48 09	  cmp $0948
$1c:c5c0  80 d8		 bra $c59a
$1c:c5c2  94 c5		 sty $c5,x
$1c:c5c4  24 17		 bit $17
$1c:c5c6  61 f9		 adc ($f9,x)
$1c:c5c8  dc d3 22	  jml [$22d3]
$1c:c5cb  fe 24 c0	  inc $c024,x
$1c:c5ce  2e 8d 76	  rol $768d
$1c:c5d1  4d 71 88	  eor $8871
$1c:c5d4  23 ca		 and $ca,s
$1c:c5d6  90 20		 bcc $c5f8
$1c:c5d8  18			clc
$1c:c5d9  40			rti
$1c:c5da  90 33		 bcc $c60f
$1c:c5dc  d0 8e		 bne $c56c
$1c:c5de  f4 23 cb	  pea $cb23
$1c:c5e1  08			php
$1c:c5e2  f7 c2		 sbc [$c2],y
$1c:c5e4  3e a5 51	  rol $51a5,x
$1c:c5e7  bb			tyx
$1c:c5e8  aa			tax
$1c:c5e9  47 0f		 eor [$0f]
$1c:c5eb  04 c2		 tsb $c2
$1c:c5ed  22 57 06 69   jsl $690657
$1c:c5f1  00 38		 brk #$38
$1c:c5f3  e5 51		 sbc $51
$1c:c5f5  a2 4e		 ldx #$4e
$1c:c5f7  0c d0 3c	  tsb $3cd0
$1c:c5fa  55 c0		 eor $c0,x
$1c:c5fc  92 06		 sta ($06)
$1c:c5fe  50 c3		 bvc $c5c3
$1c:c600  3d 70 cf	  and $cf70,x
$1c:c603  61 34		 adc ($34,x)
$1c:c605  09 a1		 ora #$a1
$1c:c607  10 ba		 bpl $c5c3
$1c:c609  44 2e b1	  mvp $b1,$2e
$1c:c60c  0c 24 43	  tsb $4324
$1c:c60f  0a			asl a
$1c:c610  97 08		 sta [$08],y
$1c:c612  46 99		 lsr $99
$1c:c614  36 3b		 rol $3b,x
$1c:c616  64 18		 stz $18
$1c:c618  aa			tax
$1c:c619  80 d0		 bra $c5eb
$1c:c61b  18			clc
$1c:c61c  74 59		 stz $59,x
$1c:c61e  ac 05 76	  ldy $7605
$1c:c621  4b			phk
$1c:c622  b2 6b		 lda ($6b)
$1c:c624  8e 69 b6	  stx $b669
$1c:c627  28			plp
$1c:c628  e0 30		 cpx #$30
$1c:c62a  05 1a		 ora $1a
$1c:c62c  09 97		 ora #$97
$1c:c62e  84 69		 sty $69
$1c:c630  21 9e		 and ($9e,x)
$1c:c632  d6 8a		 dec $8a,x
$1c:c634  e5 22		 sbc $22
$1c:c636  19 5a 26	  ora $265a,y
$1c:c639  32 09		 and ($09)
$1c:c63b  8a			txa
$1c:c63c  84 78		 sty $78
$1c:c63e  e1 10		 sbc ($10,x)
$1c:c640  03 08		 ora $08,s
$1c:c642  c0 11		 cpy #$11
$1c:c644  a3 97		 lda $97,s
$1c:c646  82 6e 21	  brl $e7b7
$1c:c649  13 38		 ora ($38,s),y
$1c:c64b  45 14		 eor $14
$1c:c64d  5f 3b a8 46   eor $46a83b,x
$1c:c651  a8			tay
$1c:c652  5e a3 e0	  lsr $e0a3,x
$1c:c655  4f 02 69 09   eor $096902
$1c:c659  02 99		 cop #$99
$1c:c65b  04 b8		 tsb $b8
$1c:c65d  a5 03		 lda $03
$1c:c65f  1d 08 8f	  ora $8f08,x
$1c:c662  42 29		 wdm #$29
$1c:c664  e1 d0		 sbc ($d0,x)
$1c:c666  82 62 05	  brl $cbcb
$1c:c669  e5 04		 sbc $04
$1c:c66b  c5 c1		 cmp $c1
$1c:c66d  31 86		 and ($86),y
$1c:c66f  33 4a		 and ($4a,s),y
$1c:c671  01 c3		 ora ($c3,x)
$1c:c673  d0 34		 bne $c6a9
$1c:c675  df 1d b3 8c   cmp $8cb31d,x
$1c:c679  92 67		 sta ($67)
$1c:c67b  4e 48 8e	  lsr $8e48
$1c:c67e  95 c2		 sta $c2,x
$1c:c680  29 c1		 and #$c1
$1c:c682  88			dey
$1c:c683  5a			phy
$1c:c684  22 0d a0 81   jsl $81a00d
$1c:c688  37 40		 and [$40],y
$1c:c68a  fb			xce
$1c:c68b  eb			xba
$1c:c68c  ef 67 fa 0a   sbc $0afa67
$1c:c690  c0 26		 cpy #$26
$1c:c692  0e a0 4e	  asl $4ea0
$1c:c695  29 53		 and #$53
$1c:c697  8b			phb
$1c:c698  24 e2		 bit $e2
$1c:c69a  fd 38 d0	  sbc $d038,x
$1c:c69d  4e 35 53	  lsr $5335
$1c:c6a0  88			dey
$1c:c6a1  24 e6		 bit $e6
$1c:c6a3  1d 39 90	  ora $9039,x
$1c:c6a6  4e 6c 53	  lsr $536c
$1c:c6a9  9c a4 e7	  stz $e7a4
$1c:c6ac  9d 39 84	  sta $8439,x
$1c:c6af  4e a8 53	  lsr $53a8
$1c:c6b2  ab			plb
$1c:c6b3  24 eb		 bit $eb
$1c:c6b5  0d 3a d4	  ora $d43a
$1c:c6b8  4e b9 53	  lsr $53b9
$1c:c6bb  af 64 ea 1d   lda $1dea64
$1c:c6bf  3b			tsc
$1c:c6c0  98			tya
$1c:c6c1  4e ea 53	  lsr $53ea
$1c:c6c4  bb			tyx
$1c:c6c5  a4 ee		 ldy $ee
$1c:c6c7  fd 3b d0	  sbc $d03b,x
$1c:c6ca  4e f6 53	  lsr $53f6
$1c:c6cd  bd e4 ee	  lda $eee4,x
$1c:c6d0  0d 3c 90	  ora $903c
$1c:c6d3  4f 27 53 ca   eor $ca5327
$1c:c6d7  64 f2		 stz $f2
$1c:c6d9  dd 3c 80	  cmp $803c,x
$1c:c6dc  0b			phd
$1c:c6dd  ce f1 3c	  dec $3cf1
$1c:c6e0  ff ff e0 63   sbc $63e0ff,x
$1c:c6e4  05 1c		 ora $1c
$1c:c6e6  a7 30		 lda [$30]
$1c:c6e8  5c b2 09 e8   jml $e809b2
$1c:c6ec  dd 89 e0	  cmp $e089,x
$1c:c6ef  41 c1		 eor ($c1,x)
$1c:c6f1  a9 42		 lda #$42
$1c:c6f3  45 e7		 eor $e7
$1c:c6f5  ac 9e 9b	  ldy $9b9e
$1c:c6f8  53 9e		 eor ($9e,s),y
$1c:c6fa  74 53		 stz $53,x
$1c:c6fc  9b			txy
$1c:c6fd  7c 8a 02	  jmp ($028a,x)
$1c:c700  2f 48 ac f8   and $f8ac48
$1c:c704  6e 10 11	  ror $1110
$1c:c707  78			sei
$1c:c708  ff 3f e9 50   sbc $50e93f,x
$1c:c70c  4c 97 f9	  jmp $f997
$1c:c70f  3c a3 70	  bit $70a3,x
$1c:c712  4f a2 4c 93   eor $934ca2
$1c:c716  24 99		 bit $99
$1c:c718  04 fa		 tsb $fa
$1c:c71a  40			rti
$1c:c71b  96 cb		 stx $cb,y
$1c:c71d  04 80		 tsb $80
$1c:c71f  5a			phy
$1c:c720  55 0b		 eor $0b,x
$1c:c722  bd 58 2b	  lda $2b58,x
$1c:c725  3d 13 20	  and $2013,x
$1c:c728  d7 84		 cmp [$84],y
$1c:c72a  6b			rtl
$1c:c72b  44 67 e3	  mvp $e3,$67
$1c:c72e  76 6b		 ror $6b,x
$1c:c730  80 e5		 bra $c717
$1c:c732  1d e4 39	  ora $39e4,x
$1c:c735  47 c8		 eor [$c8]
$1c:c737  42 c5		 wdm #$c5
$1c:c739  e7 65		 sbc [$65]
$1c:c73b  9f c1 c2 17   sta $17c2c1,x
$1c:c73f  b9 9f c1	  lda $c19f,y
$1c:c742  5e 8a 1f	  lsr $1f8a,x
$1c:c745  40			rti
$1c:c746  e8			inx
$1c:c747  0b			phd
$1c:c748  f0 5a		 beq $c7a4
$1c:c74a  00 d8		 brk #$d8
$1c:c74c  02 a5		 cop #$a5
$1c:c74e  86 80		 stx $80
$1c:c750  37 48		 and [$48],y
$1c:c752  69 81		 adc #$81
$1c:c754  5f 20 2f 42   eor $422f20,x
$1c:c758  f8			sed
$1c:c759  0b			phd
$1c:c75a  d0 ce		 bne $c72a
$1c:c75c  00 d0		 brk #$d0
$1c:c75e  8f bc cf 6b   sta $6bcfbc
$1c:c762  40			rti
$1c:c763  02 a5		 cop #$a5
$1c:c765  fa			plx
$1c:c766  8a			txa
$1c:c767  05 4c		 ora $4c
$1c:c769  d2 49		 cmp ($49)
$1c:c76b  52 3e		 eor ($3e)
$1c:c76d  a2 74		 ldx #$74
$1c:c76f  0b			phd
$1c:c770  49 68		 eor #$68
$1c:c772  2f d4 db 28   and $28dbd4
$1c:c776  97 a4		 sta [$a4],y
$1c:c778  a2 56		 ldx #$56
$1c:c77a  5f b7 1d 76   eor $761db7,x
$1c:c77e  d9 56 22	  cmp $2256,y
$1c:c781  fb			xce
$1c:c782  94 4b		 sty $4b,x
$1c:c784  0a			asl a
$1c:c785  a3 3f		 lda $3f,s
$1c:c787  fc 21 a4	  jsr ($a421,x)
$1c:c78a  f4 80 a2	  pea $a280
$1c:c78d  14 6a		 trb $6a
$1c:c78f  1d 11 c2	  ora $c211,x
$1c:c792  fb			xce
$1c:c793  47 0b		 eor [$0b]
$1c:c795  09 a0		 ora #$a0
$1c:c797  8b			phb
$1c:c798  d1 ea		 cmp ($ea),y
$1c:c79a  0c 34 7a	  tsb $7a34
$1c:c79d  85 04		 sta $04
$1c:c79f  b4 b5		 ldy $b5,x
$1c:c7a1  d2 d2		 cmp ($d2)
$1c:c7a3  de 4a 06	  dec $064a,x
$1c:c7a6  f5 07		 sbc $07,x
$1c:c7a8  da			phx
$1c:c7a9  1d cb 62	  ora $62cb,x
$1c:c7ac  7c 5e 69	  jmp ($695e,x)
$1c:c7af  f1 7d		 sbc ($7d),y
$1c:c7b1  25 05		 and $05
$1c:c7b3  22 84 16 84   jsl $841684
$1c:c7b7  49 49		 eor #$49
$1c:c7b9  0a			asl a
$1c:c7ba  79 67 a9	  adc $a967,y
$1c:c7bd  e5 ac		 sbc $ac
$1c:c7bf  d0 8a		 bne $c74b
$1c:c7c1  2d c9 4f	  and $4fc9
$1c:c7c4  1b			tcs
$1c:c7c5  d4 3d		 pei ($3d)
$1c:c7c7  8c 05 87	  sty $8705
$1c:c7ca  d0 cd		 bne $c799
$1c:c7cc  69 32		 adc #$32
$1c:c7ce  a1 9c		 lda ($9c,x)
$1c:c7d0  db			stp
$1c:c7d1  a6 d0		 ldx $d0
$1c:c7d3  13 b9		 ora ($b9,s),y
$1c:c7d5  7d 9c 4b	  adc $4b9c,x
$1c:c7d8  19 a2 1d	  ora $1da2,y
$1c:c7db  52 79		 eor ($79)
$1c:c7dd  44 66 84	  mvp $84,$66
$1c:c7e0  1c 30 77	  trb $7730
$1c:c7e3  5a			phy
$1c:c7e4  13 f5		 ora ($f5,s),y
$1c:c7e6  32 20		 and ($20)
$1c:c7e8  45 01		 eor $01
$1c:c7ea  b6 b5		 ldx $b5,y
$1c:c7ec  6c 2f d4	  jmp ($d42f)
$1c:c7ef  aa			tax
$1c:c7f0  d0 df		 bne $c7d1
$1c:c7f2  a9 7f		 lda #$7f
$1c:c7f4  13 28		 ora ($28,s),y
$1c:c7f6  95 b5		 sta $b5,x
$1c:c7f8  2d 81 0a	  and $0a81
$1c:c7fb  a5 7e		 lda $7e
$1c:c7fd  88			dey
$1c:c7fe  15 4c		 ora $4c,x
$1c:c800  11 21		 ora ($21),y
$1c:c802  48			pha
$1c:c803  ed a5 7d	  sbc $7da5
$1c:c806  08			php
$1c:c807  58			cli
$1c:c808  e0 1c		 cpx #$1c
$1c:c80a  87 d3		 sta [$d3]
$1c:c80c  9a			txs
$1c:c80d  42 2e		 wdm #$2e
$1c:c80f  16 3e		 asl $3e,x
$1c:c811  e9 21		 sbc #$21
$1c:c813  4e 6d f2	  lsr $f26d
$1c:c816  7d 09 d5	  adc $d509,x
$1c:c819  0e 6d 07	  asl $076d
$1c:c81c  a2 b3		 ldx #$b3
$1c:c81e  43 de		 eor $de,s
$1c:c820  16 38		 asl $38,x
$1c:c822  e2 78		 sep #$78
$1c:c824  58			cli
$1c:c825  24 f7		 bit $f7
$1c:c827  25 5a		 and $5a
$1c:c829  38			sec
$1c:c82a  42 03		 wdm #$03
$1c:c82c  00 ff		 brk #$ff
$1c:c82e  18			clc
$1c:c82f  86 63		 stx $63
$1c:c831  45 5d		 eor $5d
$1c:c833  92 ec		 sta ($ec)
$1c:c835  2a			rol a
$1c:c836  8c 29 35	  sty $3529
$1c:c839  84 09		 sty $09
$1c:c83b  a0 b0		 ldy #$b0
$1c:c83d  46 40		 lsr $40
$1c:c83f  aa			tax
$1c:c840  d8			cld
$1c:c841  2a			rol a
$1c:c842  8b			phb
$1c:c843  10 35		 bpl $c87a
$1c:c845  b4 46		 ldy $46,x
$1c:c847  7e 15 48	  ror $4815,x
$1c:c84a  6d 00 6e	  adc $6e00
$1c:c84d  96 1a		 stx $1a,y
$1c:c84f  01 ad		 ora ($ad,x)
$1c:c851  81 60		 sta ($60,x)
$1c:c853  fd c7 d8	  sbc $d8c7,x
$1c:c856  18			clc
$1c:c857  48			pha
$1c:c858  c2 4f		 rep #$4f
$1c:c85a  b0 31		 bcs $c88d
$1c:c85c  a0 94		 ldy #$94
$1c:c85e  95 69		 sta $69,x
$1c:c860  b5 a0		 lda $a0,x
$1c:c862  2a			rol a
$1c:c863  d3 a2		 cmp ($a2,s),y
$1c:c865  42 5f		 wdm #$5f
$1c:c867  69 09		 adc #$09
$1c:c869  61 34		 adc ($34,x)
$1c:c86b  10 68		 bpl $c8d5
$1c:c86d  57 c7		 eor [$c7],y
$1c:c86f  87 74		 sta [$74]
$1c:c871  9e 83 42	  stz $4283,x
$1c:c874  11 00		 ora ($00),y
$1c:c876  8c 40 26	  sty $2640
$1c:c879  01 11		 ora ($11,x)
$1c:c87b  88			dey
$1c:c87c  40			rti
$1c:c87d  24 10		 bit $10
$1c:c87f  08			php
$1c:c880  54 01 76	  mvn $76,$01
$1c:c883  06 f1		 asl $f1
$1c:c885  f5 41		 sbc $41,x
$1c:c887  0e a2 7e	  asl $7ea2
$1c:c88a  0f 5d 10 ea   ora $ea105d
$1c:c88e  27 10		 and [$10]
$1c:c890  f6 9e		 inc $9e,x
$1c:c892  c2 09		 rep #$09
$1c:c894  0c 8d 41	  tsb $418d
$1c:c897  8e 21 01	  stx $0121
$1c:c89a  86 41		 stx $41
$1c:c89c  11 a1		 ora ($a1),y
$1c:c89e  21 3a		 and ($3a,x)
$1c:c8a0  01 bc		 ora ($bc,x)
$1c:c8a2  a8			tay
$1c:c8a3  c7 b0		 cmp [$b0]
$1c:c8a5  37 81		 and [$81],y
$1c:c8a7  f8			sed
$1c:c8a8  3d c9 e2	  and $e2c9,x
$1c:c8ab  38			sec
$1c:c8ac  04 19		 tsb $19
$1c:c8ae  12 50		 ora ($50)
$1c:c8b0  a8			tay
$1c:c8b1  b0 44		 bcs $c8f7
$1c:c8b3  12 22		 ora ($22)
$1c:c8b5  b0 04		 bcs $c8bb
$1c:c8b7  18			clc
$1c:c8b8  19 d0 e6	  ora $e6d0,y
$1c:c8bb  06 f5		 asl $f5
$1c:c8bd  53 8c		 eor ($8c,s),y
$1c:c8bf  a9 56		 lda #$56
$1c:c8c1  2a			rol a
$1c:c8c2  01 8d		 ora ($8d,x)
$1c:c8c4  49 93		 eor #$93
$1c:c8c6  c5 20		 cmp $20
$1c:c8c8  85 27		 sta $27
$1c:c8ca  44 dc 32	  mvp $32,$dc
$1c:c8cd  a3 d2		 lda $d2,s
$1c:c8cf  46 90		 lsr $90
$1c:c8d1  29 0a		 and #$0a
$1c:c8d3  44 0c 1a	  mvp $1a,$0c
$1c:c8d6  15 0a		 ora $0a,x
$1c:c8d8  90 14		 bcc $c8ee
$1c:c8da  c6 1d		 dec $1d
$1c:c8dc  0a			asl a
$1c:c8dd  91 44		 sta ($44),y
$1c:c8df  28			plp
$1c:c8e0  47 40		 eor [$40]
$1c:c8e2  7a			ply
$1c:c8e3  04 6a		 tsb $6a
$1c:c8e5  21 23		 and ($23,x)
$1c:c8e7  00 14		 brk #$14
$1c:c8e9  aa			tax
$1c:c8ea  01 43		 ora ($43,x)
$1c:c8ec  5d 29 9c	  eor $9c29,x
$1c:c8ef  0d f1 28	  ora $28f1
$1c:c8f2  3d 24 61	  and $6124,x
$1c:c8f5  02 2a		 cop #$2a
$1c:c8f7  71 94		 adc ($94),y
$1c:c8f9  33 92		 and ($92,s),y
$1c:c8fb  30 d5		 bmi $c8d2
$1c:c8fd  48			pha
$1c:c8fe  42 74		 wdm #$74
$1c:c900  5e 81 08	  lsr $0881,x
$1c:c903  90 41		 bcc $c946
$1c:c905  4b			phk
$1c:c906  c1 04		 cmp ($04,x)
$1c:c908  8a			txa
$1c:c909  4a			lsr a
$1c:c90a  21 15		 and ($15,x)
$1c:c90c  50 01		 bvc $c90f
$1c:c90e  46 22		 lsr $22
$1c:c910  12 50		 ora ($50)
$1c:c912  01 4a		 ora ($4a,x)
$1c:c914  20 13 53	  jsr $5313
$1c:c917  a1 0f		 lda ($0f,x)
$1c:c919  01 10		 ora ($10,x)
$1c:c91b  0b			phd
$1c:c91c  b4 65		 ldy $65,x
$1c:c91e  82 64 a0	  brl $6985
$1c:c921  c1 c3		 cmp ($c3,x)
$1c:c923  90 38		 bcc $c95d
$1c:c925  c5 4e		 cmp $4e
$1c:c927  ae d1 80	  ldx $80d1
$1c:c92a  3c 45 42	  bit $4245,x
$1c:c92d  31 01		 and ($01),y
$1c:c92f  49 b1		 eor #$b1
$1c:c931  40			rti
$1c:c932  7c 2d 11	  jmp ($112d,x)
$1c:c935  88			dey
$1c:c936  35 40		 and $40,x
$1c:c938  d2 86		 cmp ($86)
$1c:c93a  92 68		 sta ($68)
$1c:c93c  83 e0		 sta $e0,s
$1c:c93e  1c a0 69	  trb $69a0
$1c:c941  10 d9		 bpl $c91c
$1c:c943  03 81		 ora $81,s
$1c:c945  66 0a		 ror $0a
$1c:c947  82 68 80	  brl $49b2
$1c:c94a  44 20 4d	  mvp $4d,$20
$1c:c94d  f1 8f		 sbc ($8f),y
$1c:c94f  a8			tay
$1c:c950  25 7c		 and $7c
$1c:c952  10 f0		 bpl $c944
$1c:c954  58			cli
$1c:c955  03 82		 ora $82,s
$1c:c957  05 07		 ora $07
$1c:c959  88			dey
$1c:c95a  4e 00 e0	  lsr $e000
$1c:c95d  ce 18 05	  dec $0518
$1c:c960  20 d0 31	  jsr $31d0
$1c:c963  26 0d		 rol $0d
$1c:c965  2f 81 9e f3   and $f39e81
$1c:c969  96 59		 stx $59,y
$1c:c96b  37 42		 and [$42],y
$1c:c96d  94 68		 sty $68,x
$1c:c96f  10 c8		 bpl $c939
$1c:c971  16 00		 asl $00,x
$1c:c973  08			php
$1c:c974  43 30		 eor $30,s
$1c:c976  57 02		 eor [$02],y
$1c:c978  c8			iny
$1c:c979  06 a1		 asl $a1
$1c:c97b  08			php
$1c:c97c  ae 1a 46	  ldx $461a
$1c:c97f  10 15		 bpl $c996
$1c:c981  1a			inc a
$1c:c982  01 c4		 ora ($c4,x)
$1c:c984  a3 10		 lda $10,s
$1c:c986  c2 a0		 rep #$a0
$1c:c988  1e 46 31	  asl $3146,x
$1c:c98b  0e 38 10	  asl $1038
$1c:c98e  68			pla
$1c:c98f  25 82		 and $82
$1c:c991  62 0d 04	  per $cda1
$1c:c994  b8			clv
$1c:c995  e0 46		 cpx #$46
$1c:c997  50 9e		 bvc $c937
$1c:c999  09 88 ca	  ora #$ca88
$1c:c99c  13 e1		 ora ($e1,s),y
$1c:c99e  da			phx
$1c:c99f  5b			tcd
$1c:c9a0  08			php
$1c:c9a1  49 6e 01	  eor #$016e
$1c:c9a4  f8			sed
$1c:c9a5  50 6b		 bvc $ca12
$1c:c9a7  a1 84		 lda ($84,x)
$1c:c9a9  ae 87 fc	  ldx $fc87
$1c:c9ac  61 e4		 adc ($e4,x)
$1c:c9ae  1f 29 78 3d   ora $3d7829,x
$1c:c9b2  22 f0 9a f1   jsl $f19af0
$1c:c9b6  b0 97		 bcs $c94f
$1c:c9b8  a2 73		 ldx #$73
$1c:c9ba  f4 27 a5	  pea $a527
$1c:c9bd  7d 4d e6	  adc $e64d,x
$1c:c9c0  34 88		 bit $88,x
$1c:c9c2  c3 eb		 cmp $eb,s
$1c:c9c4  e6 c2		 inc $c2
$1c:c9c6  08			php
$1c:c9c7  8b			phb
$1c:c9c8  1f db 1e e9   ora $e91edb,x
$1c:c9cc  f7 d7		 sbc [$d7],y
$1c:c9ce  ad ca 0d	  lda $0dca
$1c:c9d1  12 08		 ora ($08)
$1c:c9d3  9c 3a 14	  stz $143a
$1c:c9d6  c4 f1		 cpy $f1
$1c:c9d8  4f 8e bc 97   eor $97bc8e
$1c:c9dc  e0 85		 cpx #$85
$1c:c9de  89 41 83	  bit #$8341
$1c:c9e1  04 0b		 tsb $0b
$1c:c9e3  08			php
$1c:c9e4  71 b0		 adc ($b0),y
$1c:c9e6  53 24		 eor ($24,s),y
$1c:c9e8  73 f4		 adc ($f4,s),y
$1c:c9ea  27 a5		 and [$a5]
$1c:c9ec  7d 4c d0	  adc $d04c,x
$1c:c9ef  32 db		 and ($db)
$1c:c9f1  42 22		 wdm #$22
$1c:c9f3  11 18		 ora ($18),y
$1c:c9f5  91 9c		 sta ($9c),y
$1c:c9f7  5b			tcd
$1c:c9f8  80 0d		 bra $ca07
$1c:c9fa  13 79		 ora ($79,s),y
$1c:c9fc  c6 d9		 dec $d9
$1c:c9fe  29 1b 68	  and #$681b
$1c:ca01  24 2d		 bit $2d
$1c:ca03  ae 90 b6	  ldx $b690
$1c:ca06  f2 40		 sbc ($40)
$1c:ca08  dc a9 03	  jml [$03a9]
$1c:ca0b  76 1c		 ror $1c,x
$1c:ca0d  6d 3c 84	  adc $843c
$1c:ca10  50 53		 bvc $ca65
$1c:ca12  34 18		 bit $18,x
$1c:ca14  07 31		 ora [$31]
$1c:ca16  50 7a		 bvc $ca92
$1c:ca18  18			clc
$1c:ca19  80 2e		 bra $ca49
$1c:ca1b  71 e6		 adc ($e6),y
$1c:ca1d  4a			lsr a
$1c:ca1e  47 9a		 eor [$9a]
$1c:ca20  09 0e 6b	  ora #$6b0e
$1c:ca23  a4 39		 ldy $39
$1c:ca25  bc 90 67	  ldy $6790,x
$1c:ca28  2a			rol a
$1c:ca29  41 9d		 eor ($9d,x)
$1c:ca2b  87 1e		 sta [$1e]
$1c:ca2d  23 22		 and $22,s
$1c:ca2f  64 1f		 stz $1f
$1c:ca31  44 da 08	  mvp $08,$da
$1c:ca34  aa			tax
$1c:ca35  8c db 41	  sty $41db
$1c:ca38  02 76		 cop #$76
$1c:ca3a  8c 02 0b	  sty $0b02
$1c:ca3d  00 a0		 brk #$a0
$1c:ca3f  41 20		 eor ($20,x)
$1c:ca41  10 45		 bpl $ca88
$1c:ca43  c0 43		 cpy #$43
$1c:ca45  6c 8b 80	  jmp ($808b)
$1c:ca48  52 fc		 eor ($fc)
$1c:ca4a  02 c0		 cop #$c0
$1c:ca4c  b8			clv
$1c:ca4d  4b			phk
$1c:ca4e  2a			rol a
$1c:ca4f  ff d6 85 44   sbc $4485d6,x
$1c:ca53  5c a3 c0 1b   jml $1bc0a3
$1c:ca57  be d2 07	  ldx $07d2,y
$1c:ca5a  82 59 5e	  brl $28b6
$1c:ca5d  e6 c8		 inc $c8
$1c:ca5f  08			php
$1c:ca60  1a			inc a
$1c:ca61  ad 57 23	  lda $2357
$1c:ca64  0b			phd
$1c:ca65  80 59		 bra $cac0
$1c:ca67  30 8b		 bmi $c9f4
$1c:ca69  21 0c		 and ($0c,x)
$1c:ca6b  86 01		 stx $01
$1c:ca6d  b6 61		 ldx $61,y
$1c:ca6f  8d b2 8a	  sta $8ab2
$1c:ca72  13 40		 ora ($40,s),y
$1c:ca74  2f f1 21 71   and $7121f1
$1c:ca78  05 28		 ora $28
$1c:ca7a  13 f2		 ora ($f2,s),y
$1c:ca7c  01 18		 ora ($18,x)
$1c:ca7e  13 40		 ora ($40,s),y
$1c:ca80  f7 18		 sbc [$18],y
$1c:ca82  bb			tyx
$1c:ca83  e4 55		 cpx $55
$1c:ca85  51 07		 eor ($07),y
$1c:ca87  7c 05 89	  jmp ($8905,x)
$1c:ca8a  70 10		 bvs $ca9c
$1c:ca8c  f5 c8		 sbc $c8,x
$1c:ca8e  dd 1b 62	  cmp $621b,x
$1c:ca91  86 fc		 stx $fc
$1c:ca93  12 60		 ora ($60)
$1c:ca95  a0 b0		 ldy #$b0
$1c:ca97  3b			tsc
$1c:ca98  aa			tax
$1c:ca99  7f d2 8d 03   adc $038dd2,x
$1c:ca9d  82 dd 30	  brl $fb7d
$1c:caa0  8b			phb
$1c:caa1  cf 34 06 89   cmp $890634
$1c:caa5  30 97		 bmi $ca3e
$1c:caa7  56 b8		 lsr $b8,x
$1c:caa9  9a			txs
$1c:caaa  82 30 c1	  brl $8bdd
$1c:caad  98			tya
$1c:caae  04 22		 tsb $22
$1c:cab0  01 c0		 ora ($c0,x)
$1c:cab2  3a			dec a
$1c:cab3  04 0a		 tsb $0a
$1c:cab5  0c 69 0f	  tsb $0f69
$1c:cab8  31 d0		 and ($d0),y
$1c:caba  5e df c2	  lsr $c2df,x
$1c:cabd  3a			dec a
$1c:cabe  08			php
$1c:cabf  14 22		 trb $22
$1c:cac1  1e 78 11	  asl $1178,x
$1c:cac4  f4 13 40	  pea $4013
$1c:cac7  f8			sed
$1c:cac8  ea			nop
$1c:cac9  14 02		 trb $02
$1c:cacb  0c 74 00	  tsb $0074
$1c:cace  68			pla
$1c:cacf  50 85		 bvc $ca56
$1c:cad1  9e 21 12	  stz $1221,x
$1c:cad4  00 01		 brk #$01
$1c:cad6  40			rti
$1c:cad7  50 24		 bvc $cafd
$1c:cad9  00 6f		 brk #$6f
$1c:cadb  8c 51 f3	  sty $f351
$1c:cade  4b			phk
$1c:cadf  b0 e2		 bcs $cac3
$1c:cae1  02 0e		 cop #$0e
$1c:cae3  18			clc
$1c:cae4  0e 48 ab	  asl $ab48
$1c:cae7  e6 a0		 inc $a0
$1c:cae9  a7 62		 lda [$62]
$1c:caeb  02 0c		 cop #$0c
$1c:caed  34 54		 bit $54,x
$1c:caef  08			php
$1c:caf0  0f 48 9c 1c   ora $1c9c48
$1c:caf4  90 09		 bcc $caff
$1c:caf6  90 31		 bcc $cb29
$1c:caf8  9b			txy
$1c:caf9  e1 a0		 sbc ($a0,x)
$1c:cafb  60			rts
$1c:cafc  14 f0		 trb $f0
$1c:cafe  09 13 ac	  ora #$ac13
$1c:cb01  b0 36		 bcs $cb39
$1c:cb03  88			dey
$1c:cb04  18			clc
$1c:cb05  ce 2e bd	  dec $bd2e
$1c:cb08  a8			tay
$1c:cb09  3c 03 c4	  bit $c403,x
$1c:cb0c  24 38		 bit $38
$1c:cb0e  7b			tdc
$1c:cb0f  49 1e 80	  eor #$801e
$1c:cb12  47 b6		 eor [$b6]
$1c:cb14  23 10		 and $10,s
$1c:cb16  02 02		 cop #$02
$1c:cb18  ec 06 89	  cpx $8906
$1c:cb1b  17 89		 ora [$89],y
$1c:cb1d  f8			sed
$1c:cb1e  8d fe 09	  sta $09fe
$1c:cb21  1b			tcs
$1c:cb22  d0 8b		 bne $caaf
$1c:cb24  c2 fb		 rep #$fb
$1c:cb26  15 11		 ora $11,x
$1c:cb28  45 94		 eor $94
$1c:cb2a  2a			rol a
$1c:cb2b  75 03		 adc $03,x
$1c:cb2d  c8			iny
$1c:cb2e  c2 a0		 rep #$a0
$1c:cb30  9f 68 13 18   sta $181368,x
$1c:cb34  4f 61 e4 4a   eor $4ae461
$1c:cb38  1c 39 a4	  trb $a439
$1c:cb3b  86 40		 stx $40
$1c:cb3d  21 f0		 and ($f0,x)
$1c:cb3f  50 0a		 bvc $cb4b
$1c:cb41  a1 f7		 lda ($f7,x)
$1c:cb43  2c 79 a7	  bit $a779
$1c:cb46  ca			dex
$1c:cb47  03 06		 ora $06,s
$1c:cb49  81 1f		 sta ($1f,x)
$1c:cb4b  c4 40		 cpy $40
$1c:cb4d  28			plp
$1c:cb4e  5f 6c 94 44   eor $44946c,x
$1c:cb52  49 21 c0	  eor #$c021
$1c:cb55  84 c2		 sty $c2
$1c:cb57  20 f7 87	  jsr $87f7
$1c:cb5a  78			sei
$1c:cb5b  c2 44		 rep #$44
$1c:cb5d  41 68		 eor ($68,x)
$1c:cb5f  41 00		 eor ($00,x)
$1c:cb61  84 02		 sty $02
$1c:cb63  a1 84		 lda ($84,x)
$1c:cb65  59 8b 10	  eor $108b,y
$1c:cb68  09 0c ce	  ora #$ce0c
$1c:cb6b  48			pha
$1c:cb6c  33 55		 and ($55,s),y
$1c:cb6e  21 cd		 and ($cd,x)
$1c:cb70  c3 58		 cmp $58,s
$1c:cb72  06 19		 asl $19
$1c:cb74  c8			iny
$1c:cb75  6c 6f 6b	  jmp ($6b6f)
$1c:cb78  d6 91		 dec $91,x
$1c:cb7a  c9 ef 5f	  cmp #$5fef
$1c:cb7d  d3 2c		 cmp ($2c,s),y
$1c:cb7f  c4 f0		 cpy $f0
$1c:cb81  00 c8		 brk #$c8
$1c:cb83  56 88		 lsr $88,x
$1c:cb85  9c 2c cb	  stz $cb2c
$1c:cb88  30 3e		 bmi $cbc8
$1c:cb8a  83 68		 sta $68,s
$1c:cb8c  96 a3		 stx $a3,y
$1c:cb8e  07 84		 ora [$84]
$1c:cb90  71 89		 adc ($89),y
$1c:cb92  ba			tsx
$1c:cb93  63 52		 adc $52,s
$1c:cb95  e3 1a		 sbc $1a,s
$1c:cb97  cb			wai
$1c:cb98  8e 4d f2	  stx $f24d
$1c:cb9b  f7 f5		 sbc [$f5],y
$1c:cb9d  d2 66		 cmp ($66)
$1c:cb9f  9e 04 d2	  stz $d204,x
$1c:cba2  09 41 44	  ora #$4441
$1c:cba5  21 60		 and ($60,x)
$1c:cba7  c4 2d		 cpy $2d
$1c:cba9  bd 32 3a	  lda $3a32,x
$1c:cbac  86 5f		 stx $5f
$1c:cbae  a6 47		 ldx $47
$1c:cbb0  90 e0		 bcc $cb92
$1c:cbb2  f4 c8 fa	  pea $fac8
$1c:cbb5  07 e2		 ora [$e2]
$1c:cbb7  8e 04 70	  stx $7004
$1c:cbba  0e 42 40	  asl $4042
$1c:cbbd  12 16		 ora ($16)
$1c:cbbf  29 8e 42	  and #$428e
$1c:cbc2  d3 0e		 cmp ($0e,s),y
$1c:cbc4  24 02		 bit $02
$1c:cbc6  78			sei
$1c:cbc7  23 10		 and $10,s
$1c:cbc9  0f f7 fd 38   ora $38fdf7
$1c:cbcd  a4 82		 ldy $82
$1c:cbcf  b5 02		 lda $02,x
$1c:cbd1  86 13		 stx $13
$1c:cbd3  00 87		 brk #$87
$1c:cbd5  1a			inc a
$1c:cbd6  04 6c		 tsb $6c
$1c:cbd8  10 88		 bpl $cb62
$1c:cbda  35 e2		 and $e2,x
$1c:cbdc  04 69		 tsb $69
$1c:cbde  01 11		 ora ($11,x)
$1c:cbe0  26 92		 rol $92
$1c:cbe2  08			php
$1c:cbe3  7f 03 49 66   adc $664903,x
$1c:cbe7  8d 21 0a	  sta $0a21
$1c:cbea  4d 0e 2c	  eor $2c0e
$1c:cbed  14 30		 trb $30
$1c:cbef  a8			tay
$1c:cbf0  51 00		 eor ($00),y
$1c:cbf2  4b			phk
$1c:cbf3  e3 02		 sbc $02,s
$1c:cbf5  1c 9a 78	  trb $789a
$1c:cbf8  22 a9 95 54   jsl $5495a9
$1c:cbfc  08			php
$1c:cbfd  2c 20 b0	  bit $b020
$1c:cc00  0c 61 3c	  tsb $3c61
$1c:cc03  20 84 f0	  jsr $f084
$1c:cc06  86 d9		 stx $d9
$1c:cc08  09 e0 6e	  ora #$6ee0
$1c:cc0b  f8			sed
$1c:cc0c  06 39		 asl $39
$1c:cc0e  03 51		 ora $51,s
$1c:cc10  21 58		 and ($58,x)
$1c:cc12  9d 51 04	  sta $0451,x
$1c:cc15  30 d8		 bmi $cbef
$1c:cc17  05 93		 ora $93
$1c:cc19  08			php
$1c:cc1a  da			phx
$1c:cc1b  28			plp
$1c:cc1c  2e b1 49	  rol $49b1
$1c:cc1f  eb			xba
$1c:cc20  58			cli
$1c:cc21  d7 22		 cmp [$22],y
$1c:cc23  06 2e		 asl $2e
$1c:cc25  f9 73 c9	  sbc $c973,y
$1c:cc28  41 c1		 eor ($c1,x)
$1c:cc2a  61 cc		 adc ($cc,x)
$1c:cc2c  27 84		 and [$84]
$1c:cc2e  3d 04 37	  and $3704,x
$1c:cc31  46 e7		 lsr $e7
$1c:cc33  bb			tyx
$1c:cc34  47 9c		 eor [$9c]
$1c:cc36  f1 60		 sbc ($60),y
$1c:cc38  00 08		 brk #$08
$1c:cc3a  81 40		 sta ($40,x)
$1c:cc3c  1d e9 12	  ora $12e9,x
$1c:cc3f  90 bd		 bcc $cbfe
$1c:cc41  c6 6d		 dec $6d
$1c:cc43  12 93		 ora ($93)
$1c:cc45  4c a3 33	  jmp $33a3
$1c:cc48  28			plp
$1c:cc49  d3 fc		 cmp ($fc,s),y
$1c:cc4b  e1 f3		 sbc ($f3,x)
$1c:cc4d  28			plp
$1c:cc4e  d8			cld
$1c:cc4f  1c c1 41	  trb $41c1
$1c:cc52  1f 07 98 48   ora $489807,x
$1c:cc56  20 61 72	  jsr $7261
$1c:cc59  b9 02 02	  lda $0202,y
$1c:cc5c  08			php
$1c:cc5d  1f 28 94 56   ora $569428,x
$1c:cc61  a5 1c		 lda $1c
$1c:cc63  89 75 e2	  bit #$e275
$1c:cc66  51 78		 eor ($78),y
$1c:cc68  94 66		 sty $66,x
$1c:cc6a  25 03		 and $03
$1c:cc6c  17 98		 ora [$98],y
$1c:cc6e  b8			clv
$1c:cc6f  20 b1 29	  jsr $29b1
$1c:cc72  04 4a		 tsb $4a
$1c:cc74  14 2f		 trb $2f
$1c:cc76  18			clc
$1c:cc77  d4 4a		 pei ($4a)
$1c:cc79  16 41		 asl $41,x
$1c:cc7b  0c 93 f0	  tsb $f093
$1c:cc7e  07 40		 ora [$40]
$1c:cc80  f8			sed
$1c:cc81  08			php
$1c:cc82  74 c2		 stz $c2,x
$1c:cc84  53 30		 eor ($30,s),y
$1c:cc86  95 44		 sta $44,x
$1c:cc88  23 05		 and $05,s
$1c:cc8a  30 18		 bmi $cca4
$1c:cc8c  88			dey
$1c:cc8d  98			tya
$1c:cc8e  0b			phd
$1c:cc8f  03 52		 ora $52,s
$1c:cc91  8f 17 44 7c   sta $7c4417
$1c:cc95  10 8a		 bpl $cc21
$1c:cc97  94 5a		 sty $5a,x
$1c:cc99  a5 0f		 lda $0f
$1c:cc9b  33 90		 and ($90,s),y
$1c:cc9d  b4 61		 ldy $61,x
$1c:cc9f  22 b1 37 00   jsl $0037b1
$1c:cca3  f8			sed
$1c:cca4  22 11 28 b1   jsl $b12811
$1c:cca8  0c 62 24	  tsb $2462
$1c:ccab  11 3e		 ora ($3e),y
$1c:ccad  01 08		 ora ($08,x)
$1c:ccaf  06 04		 asl $04
$1c:ccb1  60			rts
$1c:ccb2  08			php
$1c:ccb3  19 4c a2	  ora $a24c,y
$1c:ccb6  10 68		 bpl $cd20
$1c:ccb8  84 1e		 sty $1e
$1c:ccba  21 17		 and ($17,x)
$1c:ccbc  88			dey
$1c:ccbd  75 d3		 adc $d3,x
$1c:ccbf  23 17		 and $17,s
$1c:ccc1  33 8c		 and ($8c,s),y
$1c:ccc3  28			plp
$1c:ccc4  ce 2a 42	  dec $422a
$1c:ccc7  37 00		 and [$00],y
$1c:ccc9  a0 8e 40	  ldy #$408e
$1c:cccc  3e 03 70	  rol $7003,x
$1c:cccf  1f 00 f8 0b   ora $0bf800,x
$1c:ccd3  42 5a		 wdm #$5a
$1c:ccd5  12 08		 ora ($08)
$1c:ccd7  91 82		 sta ($82),y
$1c:ccd9  41 18		 eor ($18,x)
$1c:ccdb  98			tya
$1c:ccdc  9c 22 51	  stz $5122
$1c:ccdf  b8			clv
$1c:cce0  94 7e		 sty $7e,x
$1c:cce2  24 d3		 bit $d3
$1c:cce4  06 60		 asl $60
$1c:cce6  0c 82 18	  tsb $1882
$1c:cce9  d3 18		 cmp ($18,s),y
$1c:cceb  6a			ror a
$1c:ccec  8d 54 87	  sta $8754
$1c:ccef  12 8e		 ora ($8e)
$1c:ccf1  d4 a3		 pei ($a3)
$1c:ccf3  ab			plb
$1c:ccf4  97 5c		 sta [$5c],y
$1c:ccf6  34 05		 bit $05,x
$1c:ccf8  62 a2 a0	  per $6d9d
$1c:ccfb  67 00		 adc [$00]
$1c:ccfd  b8			clv
$1c:ccfe  05 c0		 ora $c0
$1c:cd00  ee 22 40	  inc $4022
$1c:cd03  0a			asl a
$1c:cd04  80 54		 bra $cd5a
$1c:cd06  0e e0 06	  asl $06e0
$1c:cd09  09 b4 7a	  ora #$7ab4
$1c:cd0c  e6 d2		 inc $d2
$1c:cd0e  a9 0f 00	  lda #$000f
$1c:cd11  44 0a 20	  mvp $20,$0a
$1c:cd14  39 00 70	  and $7000,y
$1c:cd17  0e 81 0d	  asl $0d81
$1c:cd1a  0e 8c 52	  asl $528c
$1c:cd1d  24 38		 bit $38
$1c:cd1f  09 25 4a	  ora #$4a25
$1c:cd22  48			pha
$1c:cd23  97 19		 sta [$19],y
$1c:cd25  0a			asl a
$1c:cd26  64 64		 stz $64
$1c:cd28  35 29		 and $29,x
$1c:cd2a  2c 48 90	  bit $9048
$1c:cd2d  13 08		 ora ($08,s),y
$1c:cd2f  94 c5		 sty $c5,x
$1c:cd31  2e 33 64	  rol $6433
$1c:cd34  d9 47 b1	  cmp $b147,y
$1c:cd37  11 ec		 ora ($ec),y
$1c:cd39  4c 7b 31	  jmp $317b
$1c:cd3c  1e cc 9d	  asl $9dcc,x
$1c:cd3f  42 a5		 wdm #$a5
$1c:cd41  27 2f		 and [$2f]
$1c:cd43  8c de 24	  sty $24de
$1c:cd46  62 04 50	  per $1d4d
$1c:cd49  19 81 1c	  ora $1c81,y
$1c:cd4c  14 48		 trb $48
$1c:cd4e  85 16		 sta $16
$1c:cd50  21 54		 and ($54,x)
$1c:cd52  88			dey
$1c:cd53  55 5f		 eor $5f,x
$1c:cd55  a2 d0 09	  ldx #$09d0
$1c:cd58  5c 4a 58 d1   jml $d1584a
$1c:cd5c  16 40		 asl $40,x
$1c:cd5e  4e 62 53	  lsr $5362
$1c:cd61  a8			tay
$1c:cd62  85 02		 sta $02
$1c:cd64  21 41		 and ($41,x)
$1c:cd66  88			dey
$1c:cd67  54 22 15	  mvn $15,$22
$1c:cd6a  18			clc
$1c:cd6b  94 f2		 sty $f2,x
$1c:cd6d  25 4e		 and $4e
$1c:cd6f  67 92		 adc [$92]
$1c:cd71  1c d1 03	  trb $03d1
$1c:cd74  0e a3 43	  asl $43a3
$1c:cd77  a8			tay
$1c:cd78  f0 ea		 beq $cd64
$1c:cd7a  b4 3a		 ldy $3a,x
$1c:cd7c  ae 9f 3a	  ldx $3a9f
$1c:cd7f  44 3a 93	  mvp $93,$3a
$1c:cd82  12 c3		 ora ($c3)
$1c:cd84  44 b0 f1	  mvp $f1,$b0
$1c:cd87  2c b4 4b	  bit $4bb4
$1c:cd8a  2f 12 a5 44   and $44a512
$1c:cd8e  a9 71 2a	  lda #$2a71
$1c:cd91  d4 4a		 pei ($4a)
$1c:cd93  b6 b9		 ldx $b9,y
$1c:cd95  15 d0		 ora $d0,x
$1c:cd97  2f 81 7c 4b   and $4b7c81
$1c:cd9b  80 5f		 bra $cdfc
$1c:cd9d  05 6b		 ora $6b
$1c:cd9f  29 59 ca	  and #$ca59
$1c:cda2  56 22		 lsr $22,x
$1c:cda4  92 f8		 sta ($f8)
$1c:cda6  84 ef		 sty $ef
$1c:cda8  a9 58 ea	  lda #$ea58
$1c:cdab  56 6a		 lsr $6a,x
$1c:cdad  13 ba		 ora ($ba,s),y
$1c:cdaf  a3 50		 lda $50,s
$1c:cdb1  5b			tcd
$1c:cdb2  61 14		 adc ($14,x)
$1c:cdb4  69 05 61	  adc #$6105
$1c:cdb7  be 4e 73	  ldx $734e,y
$1c:cdba  38			sec
$1c:cdbb  06 b4		 asl $b4
$1c:cdbd  e6 39		 inc $39
$1c:cdbf  d7 7a		 cmp [$7a],y
$1c:cdc1  ef 5a 64 d3   sbc $d3645a
$1c:cdc5  26 d9		 rol $d9
$1c:cdc7  36 cb		 rol $cb,x
$1c:cdc9  28			plp
$1c:cdca  00 2a		 brk #$2a
$1c:cdcc  cb			wai
$1c:cdcd  8c 1b 61	  sty $611b
$1c:cdd0  d4 97		 pei ($97)
$1c:cdd2  d5 2b		 cmp $2b,x
$1c:cdd4  15 46		 ora $46,x
$1c:cdd6  80 b4		 bra $cd8c
$1c:cdd8  41 be		 eor ($be,x)
$1c:cdda  51 2b		 eor ($2b),y
$1c:cddc  04 4a		 tsb $4a
$1c:cdde  c3 12		 cmp $12,s
$1c:cde0  b8			clv
$1c:cde1  44 ae 31	  mvp $31,$ae
$1c:cde4  2b			pld
$1c:cde5  14 4a		 trb $4a
$1c:cde7  c7 12		 cmp [$12]
$1c:cde9  b9 44 ae	  lda $ae44,y
$1c:cdec  72 c8		 adc ($c8)
$1c:cdee  14 b2		 trb $b2
$1c:cdf0  d0 39		 bne $ce2b
$1c:cdf2  18			clc
$1c:cdf3  15 b0		 ora $b0,x
$1c:cdf5  70 23		 bvs $ce1a
$1c:cdf7  f0 b6		 beq $cdaf
$1c:cdf9  10 80		 bpl $cd7b
$1c:cdfb  78			sei
$1c:cdfc  23 b2		 and $b2,s
$1c:cdfe  87 5e		 sta [$5e]
$1c:ce00  a1 d6		 lda ($d6,x)
$1c:ce02  b8			clv
$1c:ce03  75 ee		 adc $ee,x
$1c:ce05  25 4f		 and $4f
$1c:ce07  80 15		 bra $ce1e
$1c:ce09  d6 1d		 dec $1d,x
$1c:ce0b  64 87		 stz $87
$1c:ce0d  59 54 65	  eor $6554,y
$1c:ce10  12 af		 ora ($af)
$1c:ce12  44 ab f1	  mvp $f1,$ab
$1c:ce15  2b			pld
$1c:ce16  74 4a		 stz $4a,x
$1c:ce18  de 4f 5a	  dec $5a4f,x
$1c:ce1b  ec 3a cd	  cpx $cd3a
$1c:ce1e  0e b4 9d	  asl $9db4
$1c:ce21  46 cf		 lsr $cf
$1c:ce23  4e 27 05	  lsr $0527
$1c:ce26  a0 fe 14	  ldy #$14fe
$1c:ce29  e4 10		 cpx $10
$1c:ce2b  5a			phy
$1c:ce2c  21 c8		 and ($c8,x)
$1c:ce2e  01 44		 ora ($44,x)
$1c:ce30  8d dd 16	  sta $16dd
$1c:ce33  37 98		 and [$98],y
$1c:ce35  75 d9		 adc $d9,x
$1c:ce37  0e 37 f8	  asl $f837
$1c:ce3a  75 fa		 adc $fa,x
$1c:ce3c  1d 6a 2b	  ora $2b6a,x
$1c:ce3f  b4 4b		 ldy $4b,x
$1c:ce41  01 52		 ora ($52,x)
$1c:ce43  c0 1d 42	  cpy #$421d
$1c:ce46  25 55		 and $55
$1c:ce48  53 ac		 eor ($ac,s),y
$1c:ce4a  5e 2d 82	  lsr $822d,x
$1c:ce4d  8b			phb
$1c:ce4e  60			rts
$1c:ce4f  e2 d9		 sep #$d9
$1c:ce51  28			plp
$1c:ce52  b6 4e		 ldx $4e,y
$1c:ce54  3d 84 8f	  and $8f84,x
$1c:ce57  61 63		 adc ($63,x)
$1c:ce59  d9 48 f6	  cmp $f648,y
$1c:ce5c  55 12		 eor $12,x
$1c:ce5e  68			pla
$1c:ce5f  82 b4 b3	  brl $8216
$1c:ce62  c5 28		 cmp $28
$1c:ce64  09 40 28	  ora #$2840
$1c:ce67  01 40		 ora ($40,x)
$1c:ce69  2d 49 d8	  and $d849
$1c:ce6c  2b			pld
$1c:ce6d  b4 5b		 ldy $5b,x
$1c:ce6f  19 16 c6	  ora $c616,y
$1c:ce72  c5 b1		 cmp $b1
$1c:ce74  d1 6c		 cmp ($6c),y
$1c:ce76  7b			tdc
$1c:ce77  bc de 40	  ldy $40de,x
$1c:ce7a  f0 0c		 beq $ce88
$1c:ce7c  54 5b 16	  mvn $16,$5b
$1c:ce7f  fb			xce
$1c:ce80  77 a0		 adc [$a0],y
$1c:ce82  c4 b4		 cpy $b4
$1c:ce84  51 2d		 eor ($2d),y
$1c:ce86  1c 4b 65	  trb $654b
$1c:ce89  12 d9		 ora ($d9)
$1c:ce8b  c4 bb		 cpy $bb
$1c:ce8d  11 2f		 ora ($2f),y
$1c:ce8f  2c 4b d1	  bit $d14b
$1c:ce92  12 f4		 ora ($f4)
$1c:ce94  c7 b4		 cmp [$b4]
$1c:ce96  91 ed		 sta ($ed),y
$1c:ce98  2c 7b 69	  bit $697b
$1c:ce9b  1e da c4	  asl $c4da,x
$1c:ce9e  22 f1 0e bc   jsl $bc0ef1
$1c:cea2  43 4d		 eor $4d,s
$1c:cea4  10 d3		 bpl $ce79
$1c:cea6  c5 37		 cmp $37
$1c:cea8  95 4d		 sta $4d,x
$1c:ceaa  e0 bc		 cpx #$bc
$1c:ceac  a3 9a		 lda $9a,s
$1c:ceae  88			dey
$1c:ceaf  e6 a6		 inc $a6
$1c:ceb1  39 b8 8e	  and $8eb8,y
$1c:ceb4  6e 63 9a	  ror $9a63
$1c:ceb7  a8			tay
$1c:ceb8  e6 ae		 inc $ae
$1c:ceba  39 ba 8e	  and $8eba,y
$1c:cebd  6e c7 22	  ror $22c7
$1c:cec0  40			rti
$1c:cec1  01 f0		 ora ($f0,x)
$1c:cec3  6e a2 1a	  ror $1aa2
$1c:cec6  08			php
$1c:cec7  86 84		 stx $84
$1c:cec9  52 22		 eor ($22)
$1c:cecb  80 14		 bra $cee1
$1c:cecd  04 8c		 tsb $8c
$1c:cecf  52 33		 eor ($33)
$1c:ced1  38			sec
$1c:ced2  84 88		 sty $88
$1c:ced4  52 33		 eor ($33)
$1c:ced6  21 38		 and ($38,x)
$1c:ced8  39 9a 29	  and $299a,y
$1c:cedb  ac aa 6b	  ldy $6baa
$1c:cede  05 ec		 ora $ec
$1c:cee0  53 33		 eor ($33,s),y
$1c:cee2  00 48		 brk #$48
$1c:cee4  4c 63 36	  jmp $3663
$1c:cee7  89 75 a2	  bit #$a275
$1c:ceea  53 68		 eor ($68,s),y
$1c:ceec  f7 9a		 sbc [$9a],y
$1c:ceee  25 e7		 and $e7
$1c:cef0  8f 76 a2 5d   sta $5da276
$1c:cef4  b8			clv
$1c:cef5  97 a9		 sta [$a9],y
$1c:cef7  12 11		 ora ($11)
$1c:cef9  2d 74 4b	  and $4b74
$1c:cefc  5f 12 df 44   eor $44df12,x
$1c:cf00  b7 f3		 lda [$f3],y
$1c:cf02  2e 12 7d	  rol $7d12
$1c:cf05  79 8a 55	  adc $558a,y
$1c:cf08  50 07		 bvc $cf11
$1c:cf0a  2d 5e 51	  and $515e
$1c:cf0d  2c da dc	  bit $dcda
$1c:cf10  78			sei
$1c:cf11  8b			phb
$1c:cf12  b1 e2		 lda ($e2),y
$1c:cf14  af c7 86 c3   lda $c386c7
$1c:cf18  08			php
$1c:cf19  87 1a		 sta [$1a]
$1c:cf1b  21 c7		 and ($c7,x)
$1c:cf1d  88			dey
$1c:cf1e  72 22		 adc ($22)
$1c:cf20  1c 98 87	  trb $8798
$1c:cf23  35 9e		 and $9e,x
$1c:cf25  3c a6 9d	  bit $9da6,x
$1c:cf28  b3 81		 lda ($81,s),y
$1c:cf2a  c0 4c		 cpy #$4c
$1c:cf2c  c0 6a		 cpy #$6a
$1c:cf2e  03 a0		 ora $a0,s
$1c:cf30  99 00 d0	  sta $d000,y
$1c:cf33  07 41		 ora [$41]
$1c:cf35  34 01		 bit $01,x
$1c:cf37  94 0e		 sty $0e,x
$1c:cf39  01 99		 ora ($99,x)
$1c:cf3b  73 9f		 adc ($9f,s),y
$1c:cf3d  e2 a0		 sep #$a0
$1c:cf3f  16 59		 asl $59,x
$1c:cf41  b3 05		 lda ($05,s),y
$1c:cf43  fe 3d 15	  inc $153d,x
$1c:cf46  79 f4 1f	  adc $1ff4,y
$1c:cf49  e2 a8		 sep #$a8
$1c:cf4b  16 59		 asl $59,x
$1c:cf4d  fa			plx
$1c:cf4e  e2 1e		 sep #$1e
$1c:cf50  c3 3b		 cmp $3b,s
$1c:cf52  45 b1		 eor $b1
$1c:cf54  51 6c		 eor ($6c),y
$1c:cf56  6c 5b 1d	  jmp ($1d5b)
$1c:cf59  16 c6		 asl $c6,x
$1c:cf5b  0b			phd
$1c:cf5c  c7 16		 cmp [$16]
$1c:cf5e  33 51		 and ($51,s),y
$1c:cf60  91 63		 sta ($63),y
$1c:cf62  c6 a2		 dec $a2
$1c:cf64  3a			dec a
$1c:cf65  22 30 0e 08   jsl $080e30
$1c:cf69  64 04		 stz $04
$1c:cf6b  64 2a		 stz $2a
$1c:cf6d  20 c9 0c	  jsr $0cc9
$1c:cf70  04 54		 tsb $54
$1c:cf72  18			clc
$1c:cf73  92 20		 sta ($20)
$1c:cf75  3a			dec a
$1c:cf76  e8			inx
$1c:cf77  b2 89		 lda ($89)
$1c:cf79  76 22		 ror $22,x
$1c:cf7b  5d 98 97	  eor $9798,x
$1c:cf7e  a2 25		 ldx #$25
$1c:cf80  e9 8f		 sbc #$8f
$1c:cf82  76 a2		 ror $a2,x
$1c:cf84  5d b8 97	  eor $97b8,x
$1c:cf87  aa			tax
$1c:cf88  25 17		 and $17
$1c:cf8a  89 77		 bit #$77
$1c:cf8c  23 dd		 and $dd,s
$1c:cf8e  d3 88		 cmp ($88,s),y
$1c:cf90  44 bd b1	  mvp $b1,$bd
$1c:cf93  ec 44 7b	  cpx $7b44
$1c:cf96  13 1e		 ora ($1e,s),y
$1c:cf98  ef 47 b3 28   sbc $28b347
$1c:cf9c  f3 cc		 sbc ($cc,s),y
$1c:cf9e  47 bd		 eor [$bd]
$1c:cfa0  c2 f3		 rep #$f3
$1c:cfa2  19 01 98	  ora $9801,y
$1c:cfa5  8a			txa
$1c:cfa6  45 8c		 eor $8c
$1c:cfa8  8f 74 a3 dd   sta $dda374
$1c:cfac  34 d8		 bit $d8,x
$1c:cfae  f8			sed
$1c:cfaf  e3 dd		 sbc $dd,s
$1c:cfb1  48			pha
$1c:cfb2  f7 56		 sbc [$56],y
$1c:cfb4  3d e4 4a	  and $4ae4,x
$1c:cfb7  86 5b		 stx $5b
$1c:cfb9  63 16		 adc $16,s
$1c:cfbb  d8			cld
$1c:cfbc  45 b8		 eor $b8
$1c:cfbe  10 ec		 bpl $cfac
$1c:cfc0  83 04		 sta $04,s
$1c:cfc2  3a			dec a
$1c:cfc3  db			stp
$1c:cfc4  16 28		 asl $28,x
$1c:cfc6  f0 18		 beq $cfe0
$1c:cfc8  66 c0		 ror $c0
$1c:cfca  16 59		 asl $59,x
$1c:cfcc  ec 2a cc	  cpx $cc2a
$1c:cfcf  02 6b		 cop #$6b
$1c:cfd1  0b			phd
$1c:cfd2  8d 1b e4	  sta $e41b
$1c:cfd5  c3 36		 cmp $36,s
$1c:cfd7  20 bc 51	  jsr $51bc
$1c:cfda  86 13		 stx $13
$1c:cfdc  0b			phd
$1c:cfdd  f4 c2 f7	  pea $f7c2
$1c:cfe0  30 b5		 bmi $cf97
$1c:cfe2  cc 2d 40	  cpy $402d
$1c:cfe5  11 01		 ora ($01),y
$1c:cfe7  00 18		 brk #$18
$1c:cfe9  00 c5		 brk #$c5
$1c:cfeb  7f 02 8d ea   adc $ea8d02,x
$1c:cfef  61 c2		 adc ($c2,x)
$1c:cff1  98			tya
$1c:cff2  72 c2		 adc ($c2)
$1c:cff4  e7 cc		 sbc [$cc]
$1c:cff6  0b			phd
$1c:cff7  88			dey
$1c:cff8  80 62		 bra $d05c
$1c:cffa  42 65		 wdm #$65
$1c:cffc  98			tya
$1c:cffd  73 85		 adc ($85,s),y
$1c:cfff  e2 18		 sep #$18
$1c:d001  01 71		 ora ($71,x)
$1c:d003  74 42		 stz $42,x
$1c:d005  e7 d0		 sbc [$d0]
$1c:d007  17 88		 ora [$88],y
$1c:d009  80 62		 bra $d06d
$1c:d00b  16 08		 asl $08,x
$1c:d00d  85 86		 sta $86
$1c:d00f  21 70		 and ($70,x)
$1c:d011  88			dey
$1c:d012  5c 62 1a 08   jml $081a62
$1c:d016  86 86		 stx $86
$1c:d018  21 a6		 and ($a6,x)
$1c:d01a  88			dey
$1c:d01b  69 c9 e7	  adc #$e7c9
$1c:d01e  d7 88		 cmp [$88],y
$1c:d020  21 82		 and ($82,x)
$1c:d022  86 85		 stx $85
$1c:d024  1d b2 14	  ora $14b2,x
$1c:d027  76 f1		 ror $f1,x
$1c:d029  28			plp
$1c:d02a  6c 4b 3e	  jmp ($3e4b)
$1c:d02d  85 0c		 sta $0c
$1c:d02f  94 da		 sty $da,x
$1c:d031  25 42		 and $42
$1c:d033  89 48 62	  bit #$6248
$1c:d036  5c 18 96 6a   jml $6a9618
$1c:d03a  25 9b		 and $9b
$1c:d03c  89 67 22	  bit #$2267
$1c:d03f  59 e8 87	  eor $87e8,y
$1c:d042  82 21 e1	  brl $b166
$1c:d045  3f 9f 29 0e   and $0e299f,x
$1c:d049  b1 7c		 lda ($7c),y
$1c:d04b  84 f6		 sty $f6
$1c:d04d  21 4d		 and ($4d,x)
$1c:d04f  43 82		 eor $82,s
$1c:d051  44 62 e8	  mvp $e8,$62
$1c:d054  70 a8		 bvs $cffe
$1c:d056  25 01		 and $01
$1c:d058  28			plp
$1c:d059  29 91 49	  and #$4991
$1c:d05c  02 70		 cop #$70
$1c:d05e  93 0c		 sta ($0c,s),y
$1c:d060  9c 65 01	  stz $0165
$1c:d063  22 09 24 13   jsl $132409
$1c:d067  d4 88		 pei ($88)
$1c:d069  24 45		 bit $45
$1c:d06b  10 5c		 bpl $d0c9
$1c:d06d  f8			sed
$1c:d06e  87 7e		 sta [$7e]
$1c:d070  21 e2		 and ($e2,x)
$1c:d072  88			dey
$1c:d073  7b			tdc
$1c:d074  d9 e6 d2	  cmp $d2e6,y
$1c:d077  06 80		 asl $80
$1c:d079  35 09		 and $09,x
$1c:d07b  5c 0e 44 68   jml $68440e
$1c:d07f  12 b8		 ora ($b8)
$1c:d081  1a			inc a
$1c:d082  80 5c		 bra $d0e0
$1c:d084  16 a8		 asl $a8,x
$1c:d086  97 01		 sta [$01],y
$1c:d088  e8			inx
$1c:d089  4a			lsr a
$1c:d08a  e0 7d		 cpx #$7d
$1c:d08c  13 40		 ora ($40,s),y
$1c:d08e  00 04		 brk #$04
$1c:d090  ee 29 6c	  inc $6c29
$1c:d093  42 5d		 wdm #$5d
$1c:d095  10 9f		 bpl $d036
$1c:d097  44 27 f3	  mvp $f3,$27
$1c:d09a  0a			asl a
$1c:d09b  61 6c		 adc ($6c,x)
$1c:d09d  26 17		 rol $17
$1c:d09f  82 e8 db	  brl $ac8a
$1c:d0a2  22 57 48 95   jsl $954857
$1c:d0a6  f2 25		 sbc ($25)
$1c:d0a8  81 89		 sta ($89,x)
$1c:d0aa  5d 62 56	  eor $5662,x
$1c:d0ad  d8			cld
$1c:d0ae  96 44		 stx $44,y
$1c:d0b0  ca			dex
$1c:d0b1  0f f4 98 57   ora $5798f4
$1c:d0b5  03 e2		 ora $e2,s
$1c:d0b7  72 01		 adc ($01)
$1c:d0b9  20 1d 80	  jsr $801d
$1c:d0bc  c0 02		 cpy #$02
$1c:d0be  a0 32		 ldy #$32
$1c:d0c0  0c 33 20	  tsb $2033
$1c:d0c3  47 4c		 eor [$4c]
$1c:d0c5  95 23		 sta $23,x
$1c:d0c7  25 49		 and $49
$1c:d0c9  89 55 a2	  bit #$a255
$1c:d0cc  55 76		 eor $76,x
$1c:d0ce  98			tya
$1c:d0cf  81 81		 sta ($81,x)
$1c:d0d1  f8			sed
$1c:d0d2  0d 60 69	  ora $6960
$1c:d0d5  03 58		 ora $58,s
$1c:d0d7  1a			inc a
$1c:d0d8  80 ae		 bra $d088
$1c:d0da  0d 04 43	  ora $4304
$1c:d0dd  43 10		 eor $10,s
$1c:d0df  fa			plx
$1c:d0e0  44 3e aa	  mvp $aa,$3e
$1c:d0e3  31 6d		 and ($6d),y
$1c:d0e5  21 68		 and ($68,x)
$1c:d0e7  9b			txy
$1c:d0e8  83 12		 sta $12,s
$1c:d0ea  87 c4		 sta [$c4]
$1c:d0ec  a6 87		 ldx $87
$1c:d0ee  f1 40		 sbc ($40),y
$1c:d0f0  04 d6		 tsb $d6
$1c:d0f2  25 03		 and $03
$1c:d0f4  44 9c 9d	  mvp $9d,$9c
$1c:d0f7  12 33		 ora ($33)
$1c:d0f9  74 4a		 stz $4a,x
$1c:d0fb  a5 9a		 lda $9a
$1c:d0fd  73 12		 adc ($12,s),y
$1c:d0ff  9d 44 3e	  sta $3e44,x
$1c:d102  51 0f		 eor ($0f),y
$1c:d104  9a			txs
$1c:d105  9c a2 95	  stz $95a2
$1c:d108  28			plp
$1c:d109  a5 4e		 lda $4e
$1c:d10b  29 28 8a	  and #$8a28
$1c:d10e  4e 26 11	  lsr $1126
$1c:d111  99 84 69	  sta $6984,y
$1c:d114  6e 70 f9	  ror $f970
$1c:d117  84 6d		 sty $6d
$1c:d119  7e 6c 20	  ror $206c,x
$1c:d11c  8f b1 cd 94   sta $94cdb1
$1c:d120  10 36		 bpl $d158
$1c:d122  79 5c 18	  adc $185c,y
$1c:d125  01 04		 ora ($04,x)
$1c:d127  6b			rtl
$1c:d128  94 4a		 sty $4a,x
$1c:d12a  96 df		 stx $df,y
$1c:d12c  1b			tcs
$1c:d12d  eb			xba
$1c:d12e  8c 22 1f	  sty $1f22
$1c:d131  08			php
$1c:d132  87 c6		 sta [$c6]
$1c:d134  21 a6		 and ($a6,x)
$1c:d136  88			dey
$1c:d137  69 c1 a3	  adc #$a3c1
$1c:d13a  21 2d		 and ($2d,x)
$1c:d13c  8c d8 5e	  sty $5ed8
$1c:d13f  99 07 b0	  sta $b007,y
$1c:d142  bf 45 e8 46   lda $46e845,x
$1c:d146  c2 fb		 rep #$fb
$1c:d148  74 3e		 stz $3e,x
$1c:d14a  c0 77 31	  cpy #$3177
$1c:d14d  03 c8		 ora $c8,s
$1c:d14f  05 c0		 ora $c0
$1c:d151  f6 58		 inc $58,x
$1c:d153  84 cd		 sty $cd
$1c:d155  ee 66 c1	  inc $c166
$1c:d158  22 84 4a 43   jsl $434a84
$1c:d15c  12 86		 ora ($86)
$1c:d15e  c4 a6		 cpy $a6
$1c:d160  d5 29		 cmp $29,x
$1c:d162  04 4a		 tsb $4a
$1c:d164  43 52		 eor $52,s
$1c:d166  85 54		 sta $54
$1c:d168  a1 26		 lda ($26,x)
$1c:d16a  71 79		 adc ($79),y
$1c:d16c  22 a0 9d 04   jsl $049da0
$1c:d170  0c 25 41	  tsb $4125
$1c:d173  03 08		 ora $08,s
$1c:d175  18			clc
$1c:d176  42 80		 wdm #$80
$1c:d178  13 01		 ora ($01,s),y
$1c:d17a  e8			inx
$1c:d17b  05 00		 ora $00
$1c:d17d  e8			inx
$1c:d17e  2e bb bc	  rol $bcbb
$1c:d181  63 06		 adc $06,s
$1c:d183  f4 63 9c	  pea $9c63
$1c:d186  a6 61		 ldx $61
$1c:d188  2a			rol a
$1c:d189  98			tya
$1c:d18a  53 22		 eor ($22,s),y
$1c:d18c  1c f9 85	  trb $85f9
$1c:d18f  e0 2e 10	  cpx #$102e
$1c:d192  04 3b		 tsb $3b
$1c:d194  d0 10		 bne $d1a6
$1c:d196  f0 9b		 beq $d133
$1c:d198  f4 58 41	  pea $4158
$1c:d19b  3f b4 4f ee   and $ee4fb4,x
$1c:d19f  13 fb		 ora ($fb,s),y
$1c:d1a1  c4 fe		 cpy $fe
$1c:d1a3  c3 3f		 cmp $3f,s
$1c:d1a5  d4 cf		 pei ($cf)
$1c:d1a7  f6 33		 inc $33,x
$1c:d1a9  fd cc ff	  sbc $ffcc,x
$1c:d1ac  21 da		 and ($da,x)
$1c:d1ae  0d f7 a3	  ora $a3f7
$1c:d1b1  7d e0 df	  adc $dfe0,x
$1c:d1b4  8a			txa
$1c:d1b5  37 e2		 and [$e2],y
$1c:d1b7  0d f9 a3	  ora $a3f9
$1c:d1ba  7e 60 df	  ror $df60,x
$1c:d1bd  aa			tax
$1c:d1be  37 e9		 and [$e9],y
$1c:d1c0  4e ff ca	  lsr $caff
$1c:d1c3  27 f3		 and [$f3]
$1c:d1c5  09 fc e2	  ora #$e2fc
$1c:d1c8  7f 20 9f ba   adc $ba9f20,x
$1c:d1cc  27 ef		 and [$ef]
$1c:d1ce  09 fb e2	  ora #$e2fb
$1c:d1d1  7e c0 00	  ror $00c0,x
$1c:d1d4  08			php
$1c:d1d5  81 40		 sta ($40,x)
$1c:d1d7  1d e9 32	  ora $32e9,x
$1c:d1da  88			dey
$1c:d1db  4c a2 33	  jmp $33a2
$1c:d1de  29 04 ca	  and #$ca04
$1c:d1e1  43 76		 eor $76,s
$1c:d1e3  8f cd a3 f7   sta $f7a3cd
$1c:d1e7  69 7c da	  adc #$da7c
$1c:d1ea  5f 32 03 84   eor $840332,x
$1c:d1ee  ce 65 42	  dec $4265
$1c:d1f1  99 50 e6	  sta $e650,y
$1c:d1f4  53 49		 eor ($49,s),y
$1c:d1f6  94 d6		 sty $d6,x
$1c:d1f8  65 44		 adc $44
$1c:d1fa  99 51 66	  sta $6651,y
$1c:d1fd  51 d9		 eor ($d9),y
$1c:d1ff  94 7a		 sty $7a,x
$1c:d201  e5 2e		 sbc $2e
$1c:d203  99 4b a1	  sta $a14b,y
$1c:d206  d1 58		 cmp ($58),y
$1c:d208  75 3a		 adc $3a,x
$1c:d20a  1d 25 87	  ora $8725,x
$1c:d20d  4b			phk
$1c:d20e  62 12 2a	  per $fc23
$1c:d211  84 8b		 sty $8b
$1c:d213  21 22		 and ($22,x)
$1c:d215  e8			inx
$1c:d216  48			pha
$1c:d217  a3 d5		 lda $d5,s
$1c:d219  08			php
$1c:d21a  f5 46		 sbc $46,x
$1c:d21c  25 9d		 and $9d
$1c:d21e  c9 67 62	  cmp #$6267
$1c:d221  53 08		 eor ($08,s),y
$1c:d223  94 c6		 sty $c6,x
$1c:d225  3d 40 8f	  and $8f40,x
$1c:d228  50 45		 bvc $d26f
$1c:d22a  eb			xba
$1c:d22b  ad 89 44	  lda $4489
$1c:d22e  22 51 11 b9   jsl $b91151
$1c:d232  44 35 b3	  mvp $b3,$35
$1c:d235  0a			asl a
$1c:d236  3e 40 a0	  rol $a040,x
$1c:d239  10 12		 bpl $d24d
$1c:d23b  78			sei
$1c:d23c  cd ca 63	  cmp $63ca
$1c:d23f  37 98		 and [$98],y
$1c:d241  45 e6		 eor $e6
$1c:d243  11 89		 ora ($89),y
$1c:d245  a7 22		 lda [$22]
$1c:d247  69 c9 8f	  adc #$8fc9
$1c:d24a  4a			lsr a
$1c:d24b  a3 d2		 lda $d2,s
$1c:d24d  b1 99		 lda ($99),y
$1c:d24f  44 23 51	  mvp $51,$23
$1c:d252  08			php
$1c:d253  e1 bc		 sbc ($bc,x)
$1c:d255  a3 9f		 lda $9f,s
$1c:d257  58			cli
$1c:d258  e7 da		 sbc [$da]
$1c:d25a  21 9d		 and ($9d,x)
$1c:d25c  c8			iny
$1c:d25d  1b			tcs
$1c:d25e  82 36 71	  brl $4397
$1c:d261  14 01		 trb $01
$1c:d263  48			pha
$1c:d264  a2 18 c1	  ldx #$c118
$1c:d267  58			cli
$1c:d268  64 31		 stz $31
$1c:d26a  85 f2		 sta $f2
$1c:d26c  98			tya
$1c:d26d  49 e6 12	  eor #$12e6
$1c:d270  8b			phb
$1c:d271  81 48		 sta ($48,x)
$1c:d273  33 e5		 and ($e5,s),y
$1c:d275  51 ce		 eor ($ce),y
$1c:d277  dc 26 e9	  jml [$e926]
$1c:d27a  d2 3e		 cmp ($3e)
$1c:d27c  84 c2		 sty $c2
$1c:d27e  3b			tsc
$1c:d27f  30 8f		 bmi $d210
$1c:d281  18			clc
$1c:d282  ca			dex
$1c:d283  5d a2 57	  eor $57a2,x
$1c:d286  84 ca		 sty $ca
$1c:d288  02 b3		 cop #$b3
$1c:d28a  1a			inc a
$1c:d28b  44 ca 93	  mvp $93,$ca
$1c:d28e  72 9c		 adc ($9c)
$1c:d290  4c b0 13	  jmp $13b0
$1c:d293  2a			rol a
$1c:d294  54 ca 97	  mvn $97,$ca
$1c:d297  32 c0		 and ($c0)
$1c:d299  cc 97 81	  cpy $8197
$1c:d29c  3a			dec a
$1c:d29d  63 8b		 adc $8b,s
$1c:d29f  00 a7		 brk #$a7
$1c:d2a1  2c f1 5c	  bit $5cf1
$1c:d2a4  0c 52 e7	  tsb $e752
$1c:d2a7  54 ea 45	  mvn $45,$ea
$1c:d2aa  34 71		 bit $71,x
$1c:d2ac  0f f4 51 b4   ora $b451f4
$1c:d2b0  17 3a		 ora [$3a],y
$1c:d2b2  87 fa		 sta [$fa]
$1c:d2b4  a9 e7 63	  lda #$63e7
$1c:d2b7  9b			txy
$1c:d2b8  20 9a 04	  jsr $049a
$1c:d2bb  d0 2c		 bne $d2e9
$1c:d2bd  14 cb		 trb $cb
$1c:d2bf  21 3a		 and ($3a,x)
$1c:d2c1  c1 cc		 cmp ($cc,x)
$1c:d2c3  b4 13		 ldy $13,x
$1c:d2c5  2c 8b dc	  bit $dc8b
$1c:d2c8  74 2f		 stz $2f,x
$1c:d2ca  b0 8d		 bcs $d259
$1c:d2cc  60			rts
$1c:d2cd  e1 d7		 sbc ($d7,x)
$1c:d2cf  c0 38 d7	  cpy #$d738
$1c:d2d2  81 28		 sta ($28,x)
$1c:d2d4  07 0c		 ora [$0c]
$1c:d2d6  a6 8f		 ldx $8f
$1c:d2d8  20 de 06	  jsr $06de
$1c:d2db  c0 f4 3f	  cpy #$3ff4
$1c:d2de  dd 4f 3b	  cmp $3b4f,x
$1c:d2e1  7c 7c 70	  jmp ($707c,x)
$1c:d2e4  8b			phb
$1c:d2e5  65 22		 adc $22
$1c:d2e7  d9 88 b6	  cmp $b688,y
$1c:d2ea  72 2d		 adc ($2d)
$1c:d2ec  97 29		 sta [$29],y
$1c:d2ee  9d ca 65	  sta $65ca,x
$1c:d2f1  72 a1		 adc ($a1)
$1c:d2f3  dc a8 57	  jml [$57a8]
$1c:d2f6  29 ad ca	  and #$caad
$1c:d2f9  69 72 a2	  adc #$a272
$1c:d2fc  dc a8 92	  jml [$92a8]
$1c:d2ff  eb			xba
$1c:d300  1b			tcs
$1c:d301  14 3d		 trb $3d
$1c:d303  c4 00		 cpy $00
$1c:d305  c1 4b		 cmp ($4b,x)
$1c:d307  aa			tax
$1c:d308  76 ea		 ror $ea,x
$1c:d30a  9f ba a7 ae   sta $aea7ba,x
$1c:d30e  a9 ae c0	  lda #$c0ae
$1c:d311  7e 38 22	  ror $2238,x
$1c:d314  18			clc
$1c:d315  46 a0		 lsr $a0
$1c:d317  75 a8		 adc $a8,x
$1c:d319  1c 6a 05	  trb $056a
$1c:d31c  5a			phy
$1c:d31d  81 16		 sta ($16,x)
$1c:d31f  ce 25 5a	  dec $5a25
$1c:d322  89 2c 45	  bit #$452c
$1c:d325  f0 10		 beq $d337
$1c:d327  17 d8		 ora [$d8],y
$1c:d329  ae 11 6c	  ldx $6c11
$1c:d32c  0c 02 5b	  tsb $5b02
$1c:d32f  04 e1		 tsb $e1
$1c:d331  4e 52 c8	  lsr $c852
$1c:d334  ac b2 2d	  ldy $2db2
$1c:d337  72 23		 adc ($23)
$1c:d339  06 89		 asl $89
$1c:d33b  f6 2b		 inc $2b,x
$1c:d33d  60			rts
$1c:d33e  88			dey
$1c:d33f  4c a2 37	  jmp $37a2
$1c:d342  28			plp
$1c:d343  fc c9 28	  jsr ($28c9,x)
$1c:d346  13 64		 ora ($64,s),y
$1c:d348  ba			tsx
$1c:d349  d1 93		 cmp ($93),y
$1c:d34b  e2 b6		 sep #$b6
$1c:d34d  08			php
$1c:d34e  0c 42 45	  tsb $4542
$1c:d351  10 c6		 bpl $d319
$1c:d353  64 24		 stz $24
$1c:d355  5d 09 10	  eor $1009,x
$1c:d358  c8			iny
$1c:d359  14 28		 trb $28
$1c:d35b  9f 0b 90 c4   sta $c4900b,x
$1c:d35f  16 85		 asl $85,x
$1c:d361  62 4b 8b	  per $5eaf
$1c:d364  00 a6		 brk #$a6
$1c:d366  d7 26		 cmp [$26],y
$1c:d368  00 b2		 brk #$b2
$1c:d36a  46 a5		 lsr $a5
$1c:d36c  36 c7		 rol $c7,x
$1c:d36e  af c9 a2 17   lda $17a2c9
$1c:d372  2a			rol a
$1c:d373  93 1c		 sta ($1c,s),y
$1c:d375  9a			txs
$1c:d376  20 d1 14	  jsr $14d1
$1c:d379  c0 e4		 cpy #$e4
$1c:d37b  35 5d		 and $5d,x
$1c:d37d  0d 54 43	  ora $4354
$1c:d380  55 50		 eor $50,x
$1c:d382  d5 4c		 cmp $4c,x
$1c:d384  b0 13		 bcs $d399
$1c:d386  2c 0c cb	  bit $cb0c
$1c:d389  21 32		 and ($32,x)
$1c:d38b  c8			iny
$1c:d38c  c7 aa		 cmp [$aa]
$1c:d38e  91 6b		 sta ($6b),y
$1c:d390  2c 7a bf	  bit $bf7a
$1c:d393  1e c5 c5	  asl $c5c5,x
$1c:d396  b0 d1		 bcs $d369
$1c:d398  eb			xba
$1c:d399  bc 7b 15	  ldy $157b,x
$1c:d39c  1e e5 45	  asl $45e5,x
$1c:d39f  ac 11 6b	  ldy $6b11
$1c:d3a2  0c 5a e1	  tsb $e15a
$1c:d3a5  16 b8		 asl $b8,x
$1c:d3a7  c5 ae		 cmp $ae
$1c:d3a9  91 6b		 sta ($6b),y
$1c:d3ab  ac 5b 09	  ldy $095b
$1c:d3ae  16 c2		 asl $c2,x
$1c:d3b0  c5 ae		 cmp $ae
$1c:d3b2  c0 10		 cpy #$10
$1c:d3b4  7f 8e 1d ee   adc $ee1d8e,x
$1c:d3b8  35 58		 and $58,x
$1c:d3ba  f5 91		 sbc $91,x
$1c:d3bc  f2 11		 sbc ($11)
$1c:d3be  6a			ror a
$1c:d3bf  b4 5a		 ldy $5a,x
$1c:d3c1  af 16 b3 45   lda $45b316
$1c:d3c5  ac f3 2d	  ldy $2df3
$1c:d3c8  04 cb		 tsb $cb
$1c:d3ca  42 a3		 wdm #$a3
$1c:d3cc  28			plp
$1c:d3cd  b5 ea		 lda $ea,x
$1c:d3cf  2d 7b 8b	  and $8b7b
$1c:d3d2  65 2b		 adc $2b
$1c:d3d4  db			stp
$1c:d3d5  a1 b9		 lda ($b9,x)
$1c:d3d7  67 80		 adc [$80]
$1c:d3d9  c1 95		 cmp ($95,x)
$1c:d3db  b9 4d c1	  lda $c14d,y
$1c:d3de  20 47 10	  jsr $1047
$1c:d3e1  70 02		 bvs $d3e5
$1c:d3e3  12 da		 ora ($da)
$1c:d3e5  07 3b		 ora [$3b]
$1c:d3e7  74 5a		 stz $5a,x
$1c:d3e9  df 1e ac 47   cmp $47ac1e,x
$1c:d3ed  ab			plb
$1c:d3ee  31 6b		 and ($6b),y
$1c:d3f0  44 5a d3	  mvp $d3,$5a
$1c:d3f3  16 ad		 asl $ad,x
$1c:d3f5  45 ab		 eor $ab
$1c:d3f7  71 6b		 adc ($6b),y
$1c:d3f9  54 5a d6	  mvn $d6,$5a
$1c:d3fc  07 09		 ora [$09]
$1c:d3fe  91 30		 sta ($30),y
$1c:d400  2e 07 11	  rol $1107
$1c:d403  c9 67		 cmp #$67
$1c:d405  a9 e6		 lda #$e6
$1c:d407  32 af		 and ($af)
$1c:d409  57 e2		 eor [$e2],y
$1c:d40b  d9 33 19	  cmp $1933,y
$1c:d40e  12 c6		 ora ($c6)
$1c:d410  b6 4b		 ldx $4b,y
$1c:d412  13 70		 ora ($70,s),y
$1c:d414  c5 af		 cmp $af
$1c:d416  a0 b1		 ldy #$b1
$1c:d418  c6 c5		 dec $c5
$1c:d41a  af d1 6b fc   lda $fc6bd1
$1c:d41e  5b			tcd
$1c:d41f  1c 0d 1b	  trb $1b0d
$1c:d422  c4 5a		 cpy $5a
$1c:d424  f3 16		 sbc ($16,s),y
$1c:d426  c4 45		 cpy $45
$1c:d428  b1 23		 lda ($23),y
$1c:d42a  72 8f		 adc ($8f)
$1c:d42c  01 01		 ora ($01,x)
$1c:d42e  fc 15 a3	  jsr ($a315,x)
$1c:d431  a8			tay
$1c:d432  da			phx
$1c:d433  8e a1 12	  stx $12a1
$1c:d436  80 2d		 bra $d465
$1c:d438  ce 10 b7	  dec $b710
$1c:d43b  2a			rol a
$1c:d43c  92 f8		 sta ($f8)
$1c:d43e  49 63		 eor #$63
$1c:d440  7b			tdc
$1c:d441  25 82		 and $82
$1c:d443  b4 22		 ldy $22,x
$1c:d445  50 56		 bvc $d49d
$1c:d447  78			sei
$1c:d448  d3 22		 cmp ($22,s),y
$1c:d44a  54 d8 94	  mvn $94,$d8
$1c:d44d  32 25		 and ($25)
$1c:d44f  07 89		 ora [$89]
$1c:d451  43 62		 eor $62,s
$1c:d453  50 6a		 bvc $d4bf
$1c:d455  94 1e		 sty $1e,x
$1c:d457  a5 0c		 lda $0c
$1c:d459  a9 37		 lda #$37
$1c:d45b  81 b8		 sta ($b8,x)
$1c:d45d  0b			phd
$1c:d45e  82 85 ba	  brl $8ee6
$1c:d461  c0 6e		 cpy #$6e
$1c:d463  07 50		 ora [$50]
$1c:d465  55 82		 eor $82,x
$1c:d467  d4 61		 pei ($61)
$1c:d469  d1 28		 cmp ($28),y
$1c:d46b  7a			ply
$1c:d46c  dc 62 95	  jml [$9562]
$1c:d46f  28			plp
$1c:d470  7d 4a 1d	  adc $1d4a,x
$1c:d473  52 7f		 eor ($7f)
$1c:d475  04 02		 tsb $02
$1c:d477  5d 15 97	  eor $9715,x
$1c:d47a  53 a7		 eor ($a7,s),y
$1c:d47c  dc 89 b7	  jml [$b789]
$1c:d47f  26 25		 rol $25
$1c:d481  5c 89 57 62   jml $625789
$1c:d485  52 45		 eor ($45)
$1c:d487  b8			clv
$1c:d488  4c a2 f3	  jmp $f3a2
$1c:d48b  28			plp
$1c:d48c  c4 ca		 cpy $ca
$1c:d48e  4f 32 94 44   eor $449432
$1c:d492  a1 4d		 lda ($4d,x)
$1c:d494  97 85		 sta [$85],y
$1c:d496  38			sec
$1c:d497  cd b0 5f	  cmp $5fb0
$1c:d49a  28			plp
$1c:d49b  97 d1		 sta [$d1],y
$1c:d49d  be 63 60	  ldx $6063,y
$1c:d4a0  f9 54 82	  sbc $8254,y
$1c:d4a3  40			rti
$1c:d4a4  da			phx
$1c:d4a5  50 88		 bvc $d42f
$1c:d4a7  38			sec
$1c:d4a8  ca			dex
$1c:d4a9  65 1d		 adc $1d
$1c:d4ab  99 47 80	  sta $8047,y
$1c:d4ae  e3 16		 sbc $16,s
$1c:d4b0  9d 4f a7	  sta $a74f,x
$1c:d4b3  53 f9		 eor ($f9,s),y
$1c:d4b5  d6 62		 dec $62,x
$1c:d4b7  75 99		 adc $99,x
$1c:d4b9  97 65		 sta [$65],y
$1c:d4bb  a5 d9		 lda $d9
$1c:d4bd  79 74 b2	  adc $b274,y
$1c:d4c0  5d 3d 9a	  eor $9a3d,x
$1c:d4c3  6a			ror a
$1c:d4c4  26 9b		 rol $9b
$1c:d4c6  b9 a6 a6	  lda $a6a6,y
$1c:d4c9  69 cb		 adc #$cb
$1c:d4cb  a9 34		 lda #$34
$1c:d4cd  02 13		 cop #$13
$1c:d4cf  52 6b		 eor ($6b)
$1c:d4d1  03 78		 ora $78,s
$1c:d4d3  0e 41 05	  asl $0541
$1c:d4d6  71 83		 adc ($83),y
$1c:d4d8  54 0a e4	  mvn $e4,$0a
$1c:d4db  07 23		 ora [$23]
$1c:d4dd  19 14 ca	  ora $ca14,y
$1c:d4e0  5d 25 97	  eor $9725,x
$1c:d4e3  49 a7		 eor #$a7
$1c:d4e5  53 b9		 eor ($b9,s),y
$1c:d4e7  d4 f1		 pei ($f1)
$1c:d4e9  1e 68 02	  asl $0268,x
$1c:d4ec  44 11 90	  mvp $90,$11
$1c:d4ef  6e db bb	  ror $bbdb
$1c:d4f2  b6 a2		 ldx $a2,y
$1c:d4f4  ed cb bb	  sbc $bbcb
$1c:d4f7  6a			ror a
$1c:d4f8  63 d9		 adc $d9,s
$1c:d4fa  ac f7 82	  ldy $82f7
$1c:d4fd  3d a5 8b	  and $8ba5,x
$1c:d500  6a			ror a
$1c:d501  f3 de		 sbc ($de,s),y
$1c:d503  15 88		 ora $88,x
$1c:d505  45 b5		 eor $b5
$1c:d507  99 6d ca	  sta $ca6d,y
$1c:d50a  dc b2 db	  jml [$dbb2]
$1c:d50d  85 e8		 sta $e8
$1c:d50f  4d b5 13	  eor $13b5
$1c:d512  6d dc db	  adc $dbdc
$1c:d515  53 36		 eor ($36,s),y
$1c:d517  e5 c7		 sbc $c7
$1c:d519  b4 91		 ldy $91,x
$1c:d51b  6d 32 cc	  adc $cc32
$1c:d51e  74 eb		 stz $eb,x
$1c:d520  f4 ab 6b	  pea $6bab
$1c:d523  16 e1		 asl $e1,x
$1c:d525  5e cd 55	  lsr $55cd,x
$1c:d528  b5 75		 lda $75,x
$1c:d52a  ed 25 5b	  sbc $5b25
$1c:d52d  4c e5 1d	  jmp $1de5
$1c:d530  3d 7b 4b	  and $4b7b,x
$1c:d533  0e 92 c3	  asl $c392
$1c:d536  a5 b1		 lda $b1
$1c:d538  e9 1c		 sbc #$1c
$1c:d53a  7a			ply
$1c:d53b  27 10		 and [$10]
$1c:d53d  ce e4 33	  dec $33e4
$1c:d540  b2 c8		 lda ($c8)
$1c:d542  ac b2 9d	  ldy $9db2
$1c:d545  1e d8 47	  asl $47d8,x
$1c:d548  ba			tsx
$1c:d549  31 ee		 and ($ee),y
$1c:d54b  04 7b		 tsb $7b
$1c:d54d  c3 1e		 cmp $1e,s
$1c:d54f  e8			inx
$1c:d550  00 45		 brk #$45
$1c:d552  64 00		 stz $00
$1c:d554  61 af		 adc ($af,x)
$1c:d556  00 03		 brk #$03
$1c:d558  c1 5e		 cmp ($5e,x)
$1c:d55a  02 03		 cop #$03
$1c:d55c  40			rti
$1c:d55d  36 2b		 rol $2b,x
$1c:d55f  31 e0		 and ($e0),y
$1c:d561  c5 b8		 cmp $b8
$1c:d563  d1 6e		 cmp ($6e),y
$1c:d565  3c 5b 71	  bit $715b,x
$1c:d568  16 dc		 asl $dc,x
$1c:d56a  d5 b6		 cmp $b6,x
$1c:d56c  2e 51 e0	  rol $e051
$1c:d56f  bb			tyx
$1c:d570  42 2d		 wdm #$2d
$1c:d572  b2 9b		 lda ($9b)
$1c:d574  6d a2 dc	  adc $dca2
$1c:d577  2b			pld
$1c:d578  b6 dc		 ldx $dc,y
$1c:d57a  6a			ror a
$1c:d57b  03 10		 ora $10,s
$1c:d57d  18			clc
$1c:d57e  80 d4		 bra $d554
$1c:d580  aa			tax
$1c:d581  c3 01		 cmp $01,s
$1c:d583  ab			plb
$1c:d584  70 98		 bvs $d51e
$1c:d586  e3 b3		 sbc $b3,s
$1c:d588  65 8f		 adc $8f
$1c:d58a  0e 6d b4	  asl $b46d
$1c:d58d  9b			txy
$1c:d58e  6d 66 dc	  adc $dc66
$1c:d591  49 b7		 eor #$b7
$1c:d593  16 ed		 asl $ed,x
$1c:d595  b3 54		 lda ($54,s),y
$1c:d597  8f 0d 5a 34   sta $345a0d
$1c:d59b  f8			sed
$1c:d59c  f5 66		 sbc $66,x
$1c:d59e  3d 64 8b	  and $8b64,x
$1c:d5a1  59 63 d5	  eor $d563,y
$1c:d5a4  88			dey
$1c:d5a5  f6 ea		 inc $ea,x
$1c:d5a7  2d 86 8f	  and $8f86
$1c:d5aa  61 e1		 adc ($e1,x)
$1c:d5ac  5d 58 57	  eor $5758,x
$1c:d5af  5a			phy
$1c:d5b0  15 e5		 ora $e5,x
$1c:d5b2  85 79		 sta $79
$1c:d5b4  b2 19		 lda ($19)
$1c:d5b6  e8			inx
$1c:d5b7  a7 31		 lda [$31]
$1c:d5b9  f2 11		 sbc ($11)
$1c:d5bb  0d 6b dc	  ora $dc6b
$1c:d5be  4f c0 78 1a   eor $1a78c0
$1c:d5c2  a6 f0		 ldx $f0
$1c:d5c4  f6 39		 inc $39,x
$1c:d5c6  e8			inx
$1c:d5c7  86 7c		 stx $7c
$1c:d5c9  ee 19 0c	  inc $0c19
$1c:d5cc  fa			plx
$1c:d5cd  1c 1e e1	  trb $e11e
$1c:d5d0  34 de		 bit $de,x
$1c:d5d2  cd 37 d2	  cmp $d237
$1c:d5d5  ce 6c d3	  dec $d36c
$1c:d5d8  9d 3e df	  sta $df3e,x
$1c:d5db  cd b5 73	  cmp $73b5
$1c:d5de  ee 7c db	  inc $db7c
$1c:d5e1  4f 76 d5 df   eor $dfd576
$1c:d5e5  b7 f7		 lda [$f7],y
$1c:d5e7  6d 3d fb	  adc $fb3d
$1c:d5ea  9f 74 df 5d   sta $5ddf74,x
$1c:d5ee  37 b7		 and [$b7],y
$1c:d5f0  4e 75 b1	  lsr $b175
$1c:d5f3  38			sec
$1c:d5f4  1e a9 a7	  asl $a7a9,x
$1c:d5f7  7a			ply
$1c:d5f8  69 d7		 adc #$d7
$1c:d5fa  9a			txs
$1c:d5fb  7b			tdc
$1c:d5fc  a6 9d		 ldx $9d
$1c:d5fe  f5 b8		 sbc $b8,x
$1c:d600  fb			xce
$1c:d601  ee 9d 79	  inc $799d
$1c:d604  b7 aa		 lda [$aa],y
$1c:d606  6d dc 8b	  adc $8bdc
$1c:d609  76 22		 ror $22,x
$1c:d60b  de c9 b7	  dec $b7c9,x
$1c:d60e  75 8e		 adc $8e,x
$1c:d610  11 6f		 ora ($6f),y
$1c:d612  6c 5b b7	  jmp ($b75b)
$1c:d615  16 f4		 asl $f4,x
$1c:d617  45 bb		 eor $bb
$1c:d619  31 e9		 and ($e9),y
$1c:d61b  54 7a 57	  mvn $57,$7a
$1c:d61e  16 ed		 asl $ed,x
$1c:d620  45 bd		 eor $bd
$1c:d622  6d b2 cf	  adc $cfb2
$1c:d625  78			sei
$1c:d626  73 de		 adc ($de,s),y
$1c:d628  08			php
$1c:d629  b6 6e		 ldx $6e,y
$1c:d62b  2d 9c 5b	  and $5b9c
$1c:d62e  85 d1		 sta $d1
$1c:d630  80 1d		 bra $d64f
$1c:d632  7b			tdc
$1c:d633  a3 10		 lda $10,s
$1c:d635  17 40		 ora [$40],y
$1c:d637  f0 0f		 beq $d648
$1c:d639  73 14		 adc ($14,s),y
$1c:d63b  ae dd da	  ldx $dadd
$1c:d63e  b7 6e		 lda [$6e],y
$1c:d640  ad ed bb	  lda $bbed
$1c:d643  77 18		 adc [$18],y
$1c:d645  e1 56		 sbc ($56,x)
$1c:d647  f6 55		 inc $55,x
$1c:d649  bb			tyx
$1c:d64a  15 6f		 ora $6f,x
$1c:d64c  5d 5b b4	  eor $b45b,x
$1c:d64f  db			stp
$1c:d650  2a			rol a
$1c:d651  b7 66		 lda [$66],y
$1c:d653  ad e8 6d	  lda $6de8
$1c:d656  94 4b		 sty $4b,x
$1c:d658  04 1f		 tsb $1f
$1c:d65a  08			php
$1c:d65b  d6 0c		 dec $0c,x
$1c:d65d  47 11		 eor [$11]
$1c:d65f  e9 1c		 sbc #$1c
$1c:d661  7a			ply
$1c:d662  27 92		 and [$92]
$1c:d664  ce c4 b5	  dec $b5c4
$1c:d667  a2 31		 ldx #$31
$1c:d669  f1 0b		 sbc ($0b),y
$1c:d66b  c2 35		 rep #$35
$1c:d66d  d3 17		 cmp ($17,s),y
$1c:d66f  94 4b		 sty $4b,x
$1c:d671  3a			dec a
$1c:d672  33 0c		 and ($0c,s),y
$1c:d674  75 4f		 adc $4f,x
$1c:d676  9d 53 a7	  sta $a753,x
$1c:d679  54 e1 d5	  mvn $d5,$e1
$1c:d67c  31 59		 and ($59),y
$1c:d67e  c4 c7		 cpy $c7
$1c:d680  62 50 a2	  per $78d3
$1c:d683  01 08		 ora ($08,x)
$1c:d685  13 a4		 ora ($a4,s),y
$1c:d687  1f 2a d7 48   ora $48d72a,x
$1c:d68b  46 15		 lsr $15
$1c:d68d  af 11 d4 47   lda $47d411
$1c:d691  c1 13		 cmp ($13,x)
$1c:d693  c9 6b e2	  cmp #$e26b
$1c:d696  50 11		 bvc $d6a9
$1c:d698  a8			tay
$1c:d699  36 c1		 rol $c1,x
$1c:d69b  02 19		 cop #$19
$1c:d69d  2c f8 74	  bit $74f8
$1c:d6a0  73 a2		 adc ($a2,s),y
$1c:d6a2  f3 d6		 sbc ($d6,s),y
$1c:d6a4  8d 42 61	  sta $6142
$1c:d6a7  10 98		 bpl $d641
$1c:d6a9  44 66 12	  mvp $12,$66
$1c:d6ac  09 84 86	  ora #$8684
$1c:d6af  61 1d		 adc ($1d,x)
$1c:d6b1  98			tya
$1c:d6b2  47 ae		 eor [$ae]
$1c:d6b4  12 e9		 ora ($e9)
$1c:d6b6  84 ba		 sty $ba
$1c:d6b8  e9 bb ba	  sbc #$babb
$1c:d6bb  6a			ror a
$1c:d6bc  2e 9c bb	  rol $bb9c
$1c:d6bf  a6 a6		 ldx $a6
$1c:d6c1  00 af		 brk #$af
$1c:d6c3  f6 07		 inc $07,x
$1c:d6c5  b4 7d		 ldy $7d,x
$1c:d6c7  c5 ef		 cmp $ef
$1c:d6c9  3f 02 78 57   and $577802,x
$1c:d6cd  c4 de		 cpy $de
$1c:d6cf  37 f2		 and [$f2],y
$1c:d6d1  47 96		 eor [$96]
$1c:d6d3  7c d5 e7	  jmp ($e7d5,x)
$1c:d6d6  bf 46 7a 77   lda $777a46,x
$1c:d6da  d5 de		 cmp $de,x
$1c:d6dc  bf f6 87 b7   lda $b787f6,x
$1c:d6e0  ae 21 9d	  ldx $9d21
$1c:d6e3  c8			iny
$1c:d6e4  67 62		 adc [$62]
$1c:d6e6  19 e8 86	  ora $86e8,y
$1c:d6e9  7d de 3a	  adc $3ade,x
$1c:d6ec  d7 98		 cmp [$98],y
$1c:d6ee  eb			xba
$1c:d6ef  e2 1a		 sep #$1a
$1c:d6f1  d7 c8		 cmp [$c8],y
$1c:d6f3  eb			xba
$1c:d6f4  9f a2 f8 20   sta $20f8a2,x
$1c:d6f8  22 3c 88 1c   jsl $1c883c
$1c:d6fc  80 46		 bra $d744
$1c:d6fe  7a			ply
$1c:d6ff  0b			phd
$1c:d700  79 b2 19	  adc $19b2,y
$1c:d703  ec 86 7d	  cpx $7d86
$1c:d706  e2 2f		 sep #$2f
$1c:d708  00 18		 brk #$18
$1c:d70a  06 bd		 asl $bd
$1c:d70c  e2 20		 sep #$20
$1c:d70e  00 d7		 brk #$d7
$1c:d710  0e 45 f4	  asl $f445
$1c:d713  00 00		 brk #$00
$1c:d715  1c 11 11	  trb $1111
$1c:d718  06 44		 asl $44
$1c:d71a  4e 42 23	  lsr $2342
$1c:d71d  0d 05 bd	  ora $bd05
$1c:d720  e7 7f		 sbc [$7f]
$1c:d722  44 7a 67	  mvp $67,$7a
$1c:d725  d3 c5		 cmp ($c5,s),y
$1c:d727  14 fe		 trb $fe
$1c:d729  d5 3f		 cmp $3f,x
$1c:d72b  b9 4f ef	  lda $ef4f,y
$1c:d72e  53 fb		 eor ($fb,s),y
$1c:d730  10 ff		 bpl $d731
$1c:d732  54 3f d9	  mvn $d9,$3f
$1c:d735  0f f7 43 fc   ora $fc43f7
$1c:d739  9e 68 37	  stz $3768,x
$1c:d73c  de 8d f7	  dec $f78d,x
$1c:d73f  89 7e		 bit #$7e
$1c:d741  2a			rol a
$1c:d742  5f 88 37 e6   eor $e63788,x
$1c:d746  8d f9 89	  sta $89f9
$1c:d749  7e aa 5f	  ror $5faa,x
$1c:d74c  a8			tay
$1c:d74d  a7 ee		 lda [$ee]
$1c:d74f  a9 fb		 lda #$fb
$1c:d751  ca			dex
$1c:d752  7e fa 9f	  ror $9ffa,x
$1c:d755  b8			clv
$1c:d756  87 f2		 sta [$f2]
$1c:d758  a1 fc		 lda ($fc,x)
$1c:d75a  c8			iny
$1c:d75b  7f 3a 1f c4   adc $c41f3a,x
$1c:d75f  f3 00		 sbc ($00,s),y
$1c:d761  00 08		 brk #$08
$1c:d763  81 40		 sta ($40,x)
$1c:d765  1d e9 4e	  ora $4ee9,x
$1c:d768  81 53		 sta ($53,x)
$1c:d76a  a0 34		 ldy #$34
$1c:d76c  e8			inx
$1c:d76d  95 3a		 sta $3a,x
$1c:d76f  23 4e		 and $4e,s
$1c:d771  82 53 a0	  brl $77c7
$1c:d774  74 e8		 stz $e8,x
$1c:d776  a5 3a		 lda $3a
$1c:d778  27 0e		 and [$0e]
$1c:d77a  80 c3		 bra $d73f
$1c:d77c  a0 50		 ldy #$50
$1c:d77e  e8			inx
$1c:d77f  8c 3a 25	  sty $253a
$1c:d782  0e 81 c3	  asl $c381
$1c:d785  a0 90		 ldy #$90
$1c:d787  e0 30		 cpx #$30
$1c:d789  45 21		 eor $21
$1c:d78b  90 b8		 bcc $d745
$1c:d78d  60			rts
$1c:d78e  64 23		 stz $23
$1c:d790  70 c8		 bvs $d75a
$1c:d792  e4 b3		 cpx $b3
$1c:d794  4d 28 d3	  eor $d328
$1c:d797  cb			wai
$1c:d798  36 d2		 rol $d2,x
$1c:d79a  cd bc 3b	  cmp $3bbc
$1c:d79d  4d 0a d3	  eor $d30a
$1c:d7a0  c3 b6		 cmp $b6,s
$1c:d7a2  d0 ed		 bne $d791
$1c:d7a4  bd 4b 85	  lda $854b,x
$1c:d7a7  16 96		 asl $96,x
$1c:d7a9  d4 bd		 pei ($bd)
$1c:d7ab  e3 10		 sbc $10,s
$1c:d7ad  a7 48		 lda [$48]
$1c:d7af  69 d2		 adc #$d2
$1c:d7b1  0a			asl a
$1c:d7b2  74 c6		 stz $c6,x
$1c:d7b4  9d 30 87	  sta $8730,x
$1c:d7b7  41 61		 eor ($61,x)
$1c:d7b9  d0 68		 bne $d823
$1c:d7bb  74 56		 stz $56,x
$1c:d7bd  1d 16 87	  ora $8716,x
$1c:d7c0  48			pha
$1c:d7c1  21 d2		 and ($d2,x)
$1c:d7c3  18			clc
$1c:d7c4  70 f8		 bvs $d7be
$1c:d7c6  26 31		 rol $31
$1c:d7c8  49 44		 eor #$44
$1c:d7ca  52 52		 eor ($52)
$1c:d7cc  51 12		 eor ($12),y
$1c:d7ce  80 14		 bra $d7e4
$1c:d7d0  0a			asl a
$1c:d7d1  55 14		 eor $14,x
$1c:d7d3  9c 13 c6	  stz $c613
$1c:d7d6  5a			phy
$1c:d7d7  5b			tcd
$1c:d7d8  19 5c 3a	  ora $3a5c,y
$1c:d7db  a5 0e		 lda $0e
$1c:d7dd  a8			tay
$1c:d7de  19 c6 a3	  ora $a3c6,y
$1c:d7e1  0e 97 43	  asl $4397
$1c:d7e4  a5 f4		 lda $f4
$1c:d7e6  e9 cc		 sbc #$cc
$1c:d7e8  38			sec
$1c:d7e9  e8			inx
$1c:d7ea  12 68		 ora ($68)
$1c:d7ec  74 9e		 stz $9e,x
$1c:d7ee  1d 36 87	  ora $8736,x
$1c:d7f1  4d e1 d0	  eor $d0e1
$1c:d7f4  78			sei
$1c:d7f5  74 22		 stz $22,x
$1c:d7f7  1d 17 87	  ora $8717,x
$1c:d7fa  46 29		 lsr $29
$1c:d7fc  d2 7a		 cmp ($7a)
$1c:d7fe  74 9a		 stz $9a,x
$1c:d800  9d 37 a7	  sta $a737,x
$1c:d803  4d 8b e6	  eor $e68b
$1c:d806  52 09		 eor ($09)
$1c:d808  61 fc		 adc ($fc,x)
$1c:d80a  e8			inx
$1c:d80b  50 ea		 bvc $d7f7
$1c:d80d  09 fc		 ora #$fc
$1c:d80f  e8			inx
$1c:d810  34 e4		 bit $e4,x
$1c:d812  e0 51		 cpx #$51
$1c:d814  29 d4		 and #$d4
$1c:d816  38			sec
$1c:d817  75 52		 adc $52,x
$1c:d819  9d 53 0b	  sta $0b53,x
$1c:d81c  8c 3c 36	  sty $363c
$1c:d81f  31 f9		 and ($f9),y
$1c:d821  54 8a 55	  mvn $55,$8a
$1c:d824  23 97		 and $97,s
$1c:d826  46 65		 lsr $65
$1c:d828  d1 a9		 cmp ($a9),y
$1c:d82a  54 ca 55	  mvn $55,$ca
$1c:d82d  33 5d		 and ($5d,s),y
$1c:d82f  94 3a		 sty $3a,x
$1c:d831  49 0e		 eor #$0e
$1c:d833  92 92		 sta ($92)
$1c:d835  ca			dex
$1c:d836  9d 25 a7	  sta $a725,x
$1c:d839  49 07		 eor #$07
$1c:d83b  65 6a		 adc $6a
$1c:d83d  91 da		 sta ($da),y
$1c:d83f  a4 56		 ldy $56
$1c:d841  e8			inx
$1c:d842  d5 ba		 cmp $ba,x
$1c:d844  32 6d		 and ($6d)
$1c:d846  0a			asl a
$1c:d847  71 a0		 adc ($a0),y
$1c:d849  5c 22 aa 0a   jml $0aaa22
$1c:d84d  24 3a		 bit $3a
$1c:d84f  a6 ab		 ldx $ab
$1c:d851  00 b9		 brk #$b9
$1c:d853  cf 96 a0 af   cmp $afa096
$1c:d857  58			cli
$1c:d858  e0 5d		 cpx #$5d
$1c:d85a  5e c4 f2	  lsr $f2c4,x
$1c:d85d  27 f1		 and [$f1]
$1c:d85f  2c 81 e8	  bit $e881
$1c:d862  33 2a		 and ($2a,s),y
$1c:d864  30 5c		 bmi $d8c2
$1c:d866  67 a1		 adc [$a1]
$1c:d868  b0 89		 bcs $d7f3
$1c:d86a  51 83		 eor ($83),y
$1c:d86c  e8			inx
$1c:d86d  8f 59 44 c2   sta $c24459
$1c:d871  8d 30 86	  sta $8630
$1c:d874  cc 27 af	  cpy $af27
$1c:d877  d0 17		 bne $d890
$1c:d879  ac 7e 25	  ldy $257e
$1c:d87c  3c 89 4e	  bit $4e89,x
$1c:d87f  e2 54		 sep #$54
$1c:d881  58			cli
$1c:d882  74 fe		 stz $fe,x
$1c:d884  75 a2		 adc $a2,x
$1c:d886  9d 68 e7	  sta $e768,x
$1c:d889  5b			tcd
$1c:d88a  29 d6		 and #$d6
$1c:d88c  cc 7e 91	  cpy $917e
$1c:d88f  29 fc		 and #$fc
$1c:d891  5b			tcd
$1c:d892  43 16		 eor $16,s
$1c:d894  d0 45		 bne $d8db
$1c:d896  b6 31		 ldx $31,y
$1c:d898  6d 84 4b	  adc $4b84
$1c:d89b  9b			txy
$1c:d89c  52 e6		 eor ($e6)
$1c:d89e  c4 bb		 cpy $bb
$1c:d8a0  b5 2e		 lda $2e,x
$1c:d8a2  ec 4b db	  cpx $db4b
$1c:d8a5  52 f6		 eor ($f6)
$1c:d8a7  c4 bd		 cpy $bd
$1c:d8a9  d5 2f		 cmp $2f,x
$1c:d8ab  70 fc		 bvs $d8a9
$1c:d8ad  48			pha
$1c:d8ae  00 54		 brk #$54
$1c:d8b0  0a			asl a
$1c:d8b1  2c 2a c1	  bit $c12a
$1c:d8b4  0a			asl a
$1c:d8b5  b0 c2		 bcs $d879
$1c:d8b7  ae 10 ab	  ldx $ab10
$1c:d8ba  8c 3a 41	  sty $413a
$1c:d8bd  1e a6 b2	  asl $b2a6,x
$1c:d8c0  c2 3d		 rep #$3d
$1c:d8c2  5d 8f 52	  eor $528f,x
$1c:d8c5  e3 d4		 sbc $d4,s
$1c:d8c7  c8			iny
$1c:d8c8  73 78		 adc ($78,s),y
$1c:d8ca  23 55		 and $55,s
$1c:d8cc  ea			nop
$1c:d8cd  6d 3a 41	  adc $413a
$1c:d8d0  5e ae b5	  lsr $b5ae,x
$1c:d8d3  42 1d		 wdm #$1d
$1c:d8d5  55 c7		 eor $c7,x
$1c:d8d7  3a			dec a
$1c:d8d8  81 c4		 sta ($c4,x)
$1c:d8da  29 90 a7	  and #$a790
$1c:d8dd  55 5b		 eor $5b,x
$1c:d8df  e5 1c		 sbc $1c
$1c:d8e1  a3 c7		 lda $c7,s
$1c:d8e3  29 11 ca	  and #$ca11
$1c:d8e6  bc 72 b1	  ldy $b172,x
$1c:d8e9  1c a4 c7	  trb $c7a4
$1c:d8ec  29 4f b2	  and #$b24f
$1c:d8ef  85 60		 sta $60
$1c:d8f1  21 58		 and ($58,x)
$1c:d8f3  18			clc
$1c:d8f4  56 42		 lsr $42,x
$1c:d8f6  15 91		 ora $91,x
$1c:d8f8  86 44		 stx $44
$1c:d8fa  17 e2		 ora [$e2],y
$1c:d8fc  fc 18 75	  jsr ($7518,x)
$1c:d8ff  9e 1d 68	  stz $681d,x
$1c:d902  a7 66		 lda [$66]
$1c:d904  e1 d9		 sbc ($d9,x)
$1c:d906  b9 74 26	  lda $2674,y
$1c:d909  55 0a		 eor $0a,x
$1c:d90b  95 59		 sta $59,x
$1c:d90d  a5 d1		 lda $d1
$1c:d90f  a8			tay
$1c:d910  74 16		 stz $16,x
$1c:d912  15 63		 ora $63,x
$1c:d914  87 45		 sta [$45]
$1c:d916  61 57		 adc ($57,x)
$1c:d918  36 b8		 rol $b8,x
$1c:d91a  43 a0		 eor $a0,s
$1c:d91c  d0 ab		 bne $d8c9
$1c:d91e  94 3a		 sty $3a,x
$1c:d920  2d 1a ea	  and $ea1a
$1c:d923  46 ba		 lsr $ba
$1c:d925  b1 af		 lda ($af),y
$1c:d927  24 4b		 bit $4b
$1c:d929  3e af 30	  rol $30af,x
$1c:d92c  a0 b3 ce	  ldy #$ceb3
$1c:d92f  c9 2a b2	  cmp #$b22a
$1c:d932  cb			wai
$1c:d933  20 b2 c8	  jsr $c8b2
$1c:d936  34 b2		 bit $b2,x
$1c:d938  2b			pld
$1c:d939  2c 8b 43	  bit $438b
$1c:d93c  20 f0 c8	  jsr $c8f0
$1c:d93f  44 32 2f	  mvp $2f,$32
$1c:d942  0c 8c 4a	  tsb $4a8c
$1c:d945  26 52		 rol $52
$1c:d947  89 9c b2	  bit #$b29c
$1c:d94a  33 2c		 and ($2c,s),y
$1c:d94c  6b			rtl
$1c:d94d  04 1e		 tsb $1e
$1c:d94f  15 83		 ora $83,x
$1c:d951  87 45		 sta [$45]
$1c:d953  e1 59		 sbc ($59,x)
$1c:d955  28			plp
$1c:d956  56 0a		 lsr $0a,x
$1c:d958  1d 08 0d	  ora $0d08,x
$1c:d95b  84 3a		 sty $3a
$1c:d95d  31 16		 and ($16),y
$1c:d95f  96 44		 stx $44,y
$1c:d961  b8			clv
$1c:d962  51 69		 eor ($69),y
$1c:d964  6c 4b de	  jmp ($de4b)
$1c:d967  cf 29 74 65   cmp $657429
$1c:d96b  fa			plx
$1c:d96c  10 aa		 bpl $d918
$1c:d96e  cc 2a b5	  cpy $b52a
$1c:d971  0a			asl a
$1c:d972  b4 c2		 ldy $c2,x
$1c:d974  ad 50 aa	  lda $aa50
$1c:d977  dc 2a b9	  jml [$b92a]
$1c:d97a  0a			asl a
$1c:d97b  b5 c2		 lda $c2,x
$1c:d97d  ad 94 aa	  lda $aa94
$1c:d980  d5 2a		 cmp $2a,x
$1c:d982  b3 4a		 lda ($4a,s),y
$1c:d984  b5 52		 lda $52,x
$1c:d986  ad 34 aa	  lda $aa34
$1c:d989  e5 2a		 sbc $2a
$1c:d98b  b7 4a		 lda [$4a],y
$1c:d98d  23 05		 and $05,s
$1c:d98f  ae 2d a0	  ldx $a02d
$1c:d992  8b			phb
$1c:d993  68			pla
$1c:d994  62 db 08	  per $e272
$1c:d997  b6 c6		 ldx $c6,y
$1c:d999  19 0b 8a	  ora $8a0b,y
$1c:d99c  5b			tcd
$1c:d99d  56 61		 lsr $61,x
$1c:d99f  14 be		 trb $be
$1c:d9a1  d5 0c		 cmp $0c,x
$1c:d9a3  41 0c		 eor ($0c,x)
$1c:d9a5  aa			tax
$1c:d9a6  5f 56 a0 cf   eor $cfa056,x
$1c:d9aa  1b			tcs
$1c:d9ab  ab			plb
$1c:d9ac  ec 99 ec	  cpx $ec99
$1c:d9af  6f 21 99 17   adc $179921
$1c:d9b3  c6 fc		 dec $fc
$1c:d9b5  b3 22		 lda ($22,s),y
$1c:d9b7  f8			sed
$1c:d9b8  1a			inc a
$1c:d9b9  40			rti
$1c:d9ba  c6 36		 dec $36
$1c:d9bc  e4 79		 cpx $79
$1c:d9be  45 2d		 eor $2d
$1c:d9c0  e8			inx
$1c:d9c1  d4 ca		 pei ($ca)
$1c:d9c3  5d b2 97	  eor $97b2,x
$1c:d9c6  74 f9		 stz $f9,x
$1c:d9c8  dd 32 97	  cmp $9732,x
$1c:d9cb  b8			clv
$1c:d9cc  a2 b8 2e	  ldx #$2eb8
$1c:d9cf  88			dey
$1c:d9d0  b2 8a		 lda ($8a)
$1c:d9d2  5d a2 8a	  eor $8aa2,x
$1c:d9d5  60			rts
$1c:d9d6  46 09		 lsr $09
$1c:d9d8  5c 6f 8c 10   jml $108c6f
$1c:d9dc  eb			xba
$1c:d9dd  5b			tcd
$1c:d9de  aa			tax
$1c:d9df  cc 20 d0	  cpy $d020
$1c:d9e2  f5 ad		 sbc $ad,x
$1c:d9e4  ec 70 2f	  cpx $2f70
$1c:d9e7  85 53		 sta $53
$1c:d9e9  1e 63 0a	  asl $0a63,x
$1c:d9ec  a5 ea		 lda $ea
$1c:d9ee  18			clc
$1c:d9ef  d0 0b		 bne $d9fc
$1c:d9f1  cb			wai
$1c:d9f2  4c 6f 11	  jmp $116f
$1c:d9f5  46 d0		 lsr $d0
$1c:d9f7  43 22		 eor $22,s
$1c:d9f9  97 88		 sta [$88],y
$1c:d9fb  82 d8 1a	  brl $f4d6
$1c:d9fe  c0 e2 06	  cpy #$06e2
$1c:da01  90 47		 bcc $da4a
$1c:da03  23 d4		 and $d4,s
$1c:da05  e8			inx
$1c:da06  f5 3e		 sbc $3e,x
$1c:da08  3d 5e 8f	  and $8f5e,x
$1c:da0b  57 e3		 eor [$e3],y
$1c:da0d  d8			cld
$1c:da0e  48			pha
$1c:da0f  f6 16		 inc $16,x
$1c:da11  3d 86 8f	  and $8f86,x
$1c:da14  61 f2		 adc ($f2,x)
$1c:da16  cc 40 bf	  cpy $bf40
$1c:da19  16 c1		 asl $c1,x
$1c:da1b  fe 11 6b	  inc $6b11,x
$1c:da1e  77 59		 adc [$59],y
$1c:da20  88			dey
$1c:da21  0c 20 d8	  tsb $d820
$1c:da24  c5 2f		 cmp $2f
$1c:da26  ee 10 88	  inc $8810
$1c:da29  23 06		 and $06,s
$1c:da2b  35 d4		 and $d4,x
$1c:da2d  8d 75 6a	  sta $6a75
$1c:da30  59 f8 d7	  eor $d7f8,y
$1c:da33  96 15		 stx $15,y
$1c:da35  34 85		 bit $85,x
$1c:da37  4d 61 d3	  eor $d361
$1c:da3a  08			php
$1c:da3b  74 c6		 stz $c6,x
$1c:da3d  95 35		 sta $35,x
$1c:da3f  a5 4d		 lda $4d
$1c:da41  29 d3 1a	  and #$1ad3
$1c:da44  74 c2		 stz $c2,x
$1c:da46  a1 d2		 lda ($d2,x)
$1c:da48  88			dey
$1c:da49  74 85		 stz $85,x
$1c:da4b  e0 2f 08	  cpx #$082f
$1c:da4e  74 2e		 stz $2e,x
$1c:da50  1d 0c 87	  ora $870c,x
$1c:da53  4b			phk
$1c:da54  a1 d2		 lda ($d2,x)
$1c:da56  f8			sed
$1c:da57  36 26		 rol $26,x
$1c:da59  0d 8a 83	  ora $838a
$1c:da5c  66 60		 ror $60
$1c:da5e  d9 a1 79	  cmp $79a1,y
$1c:da61  12 4a		 ora ($4a)
$1c:da63  1d 26 87	  ora $8726,x
$1c:da66  49 e1 da	  eor #$dae1
$1c:da69  48			pha
$1c:da6a  74 de		 stz $de,x
$1c:da6c  9d 96 a7	  sta $a796,x
$1c:da6f  48			pha
$1c:da70  29 da 51	  and #$51da
$1c:da73  68			pla
$1c:da74  35 c2		 and $c2,x
$1c:da76  19 0f 86	  ora $860f,y
$1c:da79  59 e1 96	  eor $96e1,y
$1c:da7c  89 c6 8a	  bit #$8ac6
$1c:da7f  71 a3		 adc ($a3),y
$1c:da81  9c 6c a7	  stz $a76c
$1c:da84  1b			tcs
$1c:da85  3e 87 48	  rol $4887,x
$1c:da88  de 59 0e	  dec $0e59,x
$1c:da8b  95 32		 sta $32,x
$1c:da8d  73 0c		 adc ($0c,s),y
$1c:da8f  3c 02 d0	  bit $d002,x
$1c:da92  4b			phk
$1c:da93  e5 28		 sbc $28
$1c:da95  d5 ca		 cmp $ca,x
$1c:da97  35 87		 and $87,x
$1c:da99  50 3a		 bvc $dad5
$1c:da9b  81 cc		 sta ($cc,x)
$1c:da9d  a1 d0		 lda ($d0,x)
$1c:da9f  78			sei
$1c:daa0  74 22		 stz $22,x
$1c:daa2  1d 94 87	  ora $8794,x
$1c:daa5  65 62		 adc $62
$1c:daa7  92 88		 sta ($88)
$1c:daa9  a4 a6		 ldy $a6
$1c:daab  29 2d 8a	  and #$8a2d
$1c:daae  4b			phk
$1c:daaf  12 e2		 ora ($e2)
$1c:dab1  9c 04 e0	  stz $e004
$1c:dab4  c4 b8		 cpy $b8
$1c:dab6  11 2e		 ora ($2e),y
$1c:dab8  0c 4b a1	  tsb $a14b
$1c:dabb  12 e8		 ora ($e8)
$1c:dabd  c4 27		 cpy $27
$1c:dabf  4a			lsr a
$1c:dac0  f4 86 62	  pea $6286
$1c:dac3  16 e0		 asl $e0,x
$1c:dac5  af 6c 66 21   lda $21666c
$1c:dac9  86 10		 stx $10
$1c:dacb  cc ba d4	  cpy $d4ba
$1c:dace  73 0c		 adc ($0c,s),y
$1c:dad0  55 64		 eor $64,x
$1c:dad2  0a			asl a
$1c:dad3  bc 29 99	  ldy $9929,x
$1c:dad6  76 18		 ror $18,x
$1c:dad8  53 33		 eor ($33,s),y
$1c:dada  0b			phd
$1c:dadb  70 e6		 bvs $dac3
$1c:dadd  66 1a		 ror $1a
$1c:dadf  e6 de		 inc $de
$1c:dae1  16 9b		 asl $9b,x
$1c:dae3  35 ca		 and $ca,x
$1c:dae5  5d 09 95	  eor $9509,x
$1c:dae8  42 a5		 wdm #$a5
$1c:daea  56 69		 lsr $69,x
$1c:daec  74 69		 stz $69,x
$1c:daee  ee 76 49	  inc $4976
$1c:daf1  55 94		 eor $94,x
$1c:daf3  6e 30 f1	  ror $f130
$1c:daf6  d9 0d ce	  cmp $ce0d,y
$1c:daf9  cf 0e b4 46   cmp $46b40e
$1c:dafd  bb			tyx
$1c:dafe  11 ae		 ora ($ae),y
$1c:db00  bc 6b d1	  ldy $d16b,x
$1c:db03  1a			inc a
$1c:db04  e3 46		 sbc $46,s
$1c:db06  b6 91		 ldx $91,y
$1c:db08  ad ac 6b	  lda $6bac
$1c:db0b  89 1a e2	  bit #$e21a
$1c:db0e  87 d2		 sta [$d2]
$1c:db10  15 d6		 ora $d6,x
$1c:db12  0f 95 68 3c   ora $3c6895
$1c:db16  1c 58 62	  trb $6258
$1c:db19  00 35		 brk #$35
$1c:db1b  07 b2		 ora [$b2]
$1c:db1d  ad 75 eb	  lda $eb75
$1c:db20  5d 81 98	  eor $9881,x
$1c:db23  56 bd		 lsr $bd,x
$1c:db25  07 75		 ora [$75]
$1c:db27  8f c3 b5 b0   sta $b0b5c3
$1c:db2b  ed 74 3b	  sbc $3b74
$1c:db2e  7b			tdc
$1c:db2f  0e df 53	  asl $53df
$1c:db32  07 41		 ora [$41]
$1c:db34  0c 88 1f	  tsb $1f88
$1c:db37  06 35		 asl $35
$1c:db39  d4 8d		 pei ($8d)
$1c:db3b  75 63		 adc $63,x
$1c:db3d  5e 48 d7	  lsr $d748,x
$1c:db40  94 be		 sty $be,x
$1c:db42  21 a0		 and ($a0,x)
$1c:db44  f3 07		 sbc ($07,s),y
$1c:db46  40			rti
$1c:db47  7e 3d 42	  ror $423d,x
$1c:db4a  18			clc
$1c:db4b  9b			txy
$1c:db4c  03 1b		 ora $1b,s
$1c:db4e  1a			inc a
$1c:db4f  c7 42		 cmp [$42]
$1c:db51  b3 b0		 lda ($b0,s),y
$1c:db53  ac f5 2b	  ldy $2bf5
$1c:db56  c7 4a		 cmp [$4a]
$1c:db58  f1 52		 sbc ($52),y
$1c:db5a  8f c0 7c 0f   sta $0f7cc0
$1c:db5e  14 2b		 trb $2b
$1c:db60  c6 7b		 dec $7b
$1c:db62  28			plp
$1c:db63  57 4d		 eor [$4d],y
$1c:db65  1e 54 ed	  asl $ed54,x
$1c:db68  42 3c		 wdm #$3c
$1c:db6a  a1 c9		 lda ($c9,x)
$1c:db6c  61 7b		 adc ($7b,x)
$1c:db6e  8d d6 5d	  sta $5dd6
$1c:db71  19 7e 80	  ora $807e,y
$1c:db74  dc 4b 21	  jml [$214b]
$1c:db77  67 86		 adc [$86]
$1c:db79  5a			phy
$1c:db7a  23 da		 and $da,s
$1c:db7c  98			tya
$1c:db7d  f6 aa		 inc $aa,x
$1c:db7f  15 b9		 ora $b9,x
$1c:db81  8f 6e ab da   sta $daab6e
$1c:db85  aa			tax
$1c:db86  f6 a6		 inc $a6,x
$1c:db88  bd ba a5	  lda $a5ba,x
$1c:db8b  2d 03 16	  and $1603
$1c:db8e  b1 7c		 lda ($7c),y
$1c:db90  5a			phy
$1c:db91  ec 94 e5	  cpx $e594
$1c:db94  28			plp
$1c:db95  d5 ca		 cmp $ca,x
$1c:db97  35 91		 and $91,x
$1c:db99  49 44 52	  eor #$5244
$1c:db9c  5a			phy
$1c:db9d  d3 2e		 cmp ($2e,s),y
$1c:db9f  66 e0		 ror $e0
$1c:dba1  b4 03		 ldy $03,x
$1c:dba3  b2 70		 lda ($70)
$1c:dba5  88			dey
$1c:dba6  e8			inx
$1c:dba7  e1 5c		 sbc ($5c,x)
$1c:dba9  98			tya
$1c:dbaa  f7 2a		 sbc [$2a],y
$1c:dbac  1d d9 87	  ora $87d9,x
$1c:dbaf  76 ab		 ror $ab,x
$1c:dbb1  dc aa 57	  jml [$57aa]
$1c:dbb4  26 1d		 rol $1d
$1c:dbb6  da			phx
$1c:dbb7  a7 76		 lda [$76]
$1c:dbb9  5d e7 e9	  eor $e9e7,x
$1c:dbbc  87 7a		 sta [$7a]
$1c:dbbe  9e e7 ea	  stz $eae7,x
$1c:dbc1  a7 7a		 lda [$7a]
$1c:dbc3  61 5b		 adc ($5b,x)
$1c:dbc5  b8			clv
$1c:dbc6  56 f2		 lsr $f2,x
$1c:dbc8  25 af		 and $af
$1c:dbca  89 6f e9	  bit #$e96f
$1c:dbcd  50 ea		 bvc $dbb9
$1c:dbcf  74 82		 stz $82,x
$1c:dbd1  9d 31 a7	  sta $a731,x
$1c:dbd4  4c 11 e8	  jmp $e811
$1c:dbd7  99 19 04	  sta $0419,y
$1c:dbda  2a			rol a
$1c:dbdb  1d 0e 98	  ora $980e,x
$1c:dbde  43 a6		 eor $a6,s
$1c:dbe0  32 8e		 and ($8e)
$1c:dbe2  5c a3 99 08   jml $0899a3
$1c:dbe6  e9 8c c2	  sbc #$c28c
$1c:dbe9  d1 cc		 cmp ($cc),y
$1c:dbeb  b4 72		 ldy $72,x
$1c:dbed  c6 65		 dec $65
$1c:dbef  4a			lsr a
$1c:dbf0  f6 52		 inc $52,x
$1c:dbf2  bd 74 ae	  lda $ae74,x
$1c:dbf5  e5 2b		 sbc $2b
$1c:dbf7  b7 0a		 lda [$0a],y
$1c:dbf9  f5 c2		 sbc $c2,x
$1c:dbfb  bd 90 a2	  lda $a290,x
$1c:dbfe  30 11		 bmi $dc11
$1c:dc00  03 9f		 ora $9f,s
$1c:dc02  4a			lsr a
$1c:dc03  e7 52		 sbc [$52]
$1c:dc05  bb			tyx
$1c:dc06  f4 ae f4	  pea $f4ae
$1c:dc09  2b			pld
$1c:dc0a  9d 0a e7	  sta $e70a,x
$1c:dc0d  c2 8a		 rep #$8a
$1c:dc0f  c1 df		 cmp ($df,x)
$1c:dc11  84 78		 sty $78
$1c:dc13  21 1e		 and ($1e,x)
$1c:dc15  16 c8		 asl $c8,x
$1c:dc17  45 25		 eor $25
$1c:dc19  8a			txa
$1c:dc1a  72 a6		 adc ($a6)
$1c:dc1c  39 03 71	  and $7103,y
$1c:dc1f  4e cd c3	  lsr $c3cd
$1c:dc22  b3 68		 lda ($68,s),y
$1c:dc24  f2 53		 sbc ($53)
$1c:dc26  8b			phb
$1c:dc27  88			dey
$1c:dc28  cd e1 4e	  cmp $4ee1
$1c:dc2b  dc 27 40	  jml [$4027]
$1c:dc2e  de 3b 83	  dec $833b,x
$1c:dc31  88			dey
$1c:dc32  43 8e		 eor $8e,s
$1c:dc34  42 e1		 wdm #$e1
$1c:dc36  15 50		 ora $50,x
$1c:dc38  39 06 98	  and $9806,y
$1c:dc3b  ea			nop
$1c:dc3c  03 50		 ora $50,s
$1c:dc3e  3a			dec a
$1c:dc3f  81 2c		 sta ($2c,x)
$1c:dc41  4e a3 33	  lsr $33a3
$1c:dc44  9b			txy
$1c:dc45  80 23		 bra $dc6a
$1c:dc47  90 05		 bcc $dc4e
$1c:dc49  7f b0 3d 9d   adc $9d3db0,x
$1c:dc4d  66 71		 ror $71
$1c:dc4f  4c 04 3c	  jmp $3c04
$1c:dc52  da			phx
$1c:dc53  09 72 86	  ora #$8672
$1c:dc56  59 e1 91	  eor $91e1,y
$1c:dc59  f6 77		 inc $77,x
$1c:dc5b  bf fc 21 e2   lda $e221fc,x
$1c:dc5f  1f 19 79 0f   ora $0f7919,x
$1c:dc63  ca			dex
$1c:dc64  9e 65 f3	  stz $f365,x
$1c:dc67  b7 a1		 lda [$a1],y
$1c:dc69  fd 31 ea	  sbc $ea31,x
$1c:dc6c  9f 5d 7b 2f   sta $2f7b5d,x
$1c:dc70  db			stp
$1c:dc71  9e ed f7	  stz $f7ed,x
$1c:dc74  f7 83		 sbc [$83],y
$1c:dc76  fc 41 e3	  jsr ($e341,x)
$1c:dc79  1f 21 79 4f   ora $4f7921,x
$1c:dc7d  cc 9e 75	  cpy $759e
$1c:dc80  f4 37 a5	  pea $a537
$1c:dc83  fd 3c 90	  sbc $903c,x
$1c:dc86  4f ed 13 fb   eor $fb13ed
$1c:dc8a  84 fe		 sty $fe
$1c:dc8c  f1 3f		 sbc ($3f),y
$1c:dc8e  b0 8f		 bcs $dc1f
$1c:dc90  f5 23		 sbc $23,x
$1c:dc92  fd 88 ff	  sbc $ff88,x
$1c:dc95  72 3f		 adc ($3f)
$1c:dc97  c9 e6 83	  cmp #$83e6
$1c:dc9a  7d e8 df	  adc $dfe8,x
$1c:dc9d  78			sei
$1c:dc9e  37 e2		 and [$e2],y
$1c:dca0  8d f8 83	  sta $83f8
$1c:dca3  7e 68 df	  ror $df68,x
$1c:dca6  98			tya
$1c:dca7  37 ea		 and [$ea],y
$1c:dca9  8d fa 53	  sta $53fa
$1c:dcac  bf f2 89 fc   lda $fc89f2,x
$1c:dcb0  c2 7f		 rep #$7f
$1c:dcb2  38			sec
$1c:dcb3  9f c8 27 ee   sta $ee27c8,x
$1c:dcb7  89 fb c2	  bit #$c2fb
$1c:dcba  7e f8 9f	  ror $9ff8,x
$1c:dcbd  b0 04		 bcs $dcc3
$1c:dcbf  04 00		 tsb $00
$1c:dcc1  10 fb		 bpl $dcbe
$1c:dcc3  3b			tsc
$1c:dcc4  c3 56		 cmp $56,s
$1c:dcc6  f1 bc		 sbc ($bc),y
$1c:dcc8  f6 c2		 inc $c2,x
$1c:dcca  8a			txa
$1c:dccb  01 af		 ora ($af,x)
$1c:dccd  b6 98		 ldx $98,y
$1c:dccf  03 bb		 ora $bb,s
$1c:dcd1  2f ef 20 45   and $4520ef
$1c:dcd5  5a			phy
$1c:dcd6  8d 7f 23	  sta $237f
$1c:dcd9  59 cd 19	  eor $19cd,y
$1c:dcdc  c8			iny
$1c:dcdd  7c 39 1c	  jmp ($1c39,x)
$1c:dce0  ff 79 0e 45   sbc $450e79,x
$1c:dce4  e2 42		 sep #$42
$1c:dce6  b1 fa		 lda ($fa),y
$1c:dce8  6b			rtl
$1c:dce9  39 86 63	  and $6386,y
$1c:dcec  d6 13		 dec $13,x
$1c:dcee  5b			tcd
$1c:dcef  9c 22 42	  stz $4222
$1c:dcf2  10 8f		 bpl $dc83
$1c:dcf4  d0 ea		 bne $dce0
$1c:dcf6  03 23		 ora $23,s
$1c:dcf8  36 49		 rol $49,x
$1c:dcfa  09 8f ec	  ora #$ec8f
$1c:dcfd  42 03		 wdm #$03
$1c:dcff  2a			rol a
$1c:dd00  23 e0		 and $e0,s
$1c:dd02  ea			nop
$1c:dd03  1d 5e 52	  ora $525e,x
$1c:dd06  f0 13		 beq $dd1b
$1c:dd08  f0 75		 beq $dd7f
$1c:dd0a  0e 4e 63	  asl $634e
$1c:dd0d  33 b1		 and ($b1,s),y
$1c:dd0f  57 d7		 eor [$d7],y
$1c:dd11  27 40		 and [$40]
$1c:dd13  ef 16 05 6c   sbc $6c0516
$1c:dd17  df e1 f6 d5   cmp $d5f6e1,x
$1c:dd1b  b7 47		 lda [$47],y
$1c:dd1d  71 b9		 adc ($b9),y
$1c:dd1f  9e db 99	  stz $99db,x
$1c:dd22  41 6e		 eor ($6e,x)
$1c:dd24  9e bd 03	  stz $03bd,x
$1c:dd27  ec 11 0d	  cpx $0d11
$1c:dd2a  16 77		 asl $77,x
$1c:dd2c  ed c0 e0	  sbc $e0c0
$1c:dd2f  f9 9e e5	  sbc $e59e,y
$1c:dd32  e6 02		 inc $02
$1c:dd34  03 f8		 ora $f8,s
$1c:dd36  b4 af		 ldy $af,x
$1c:dd38  11 7b		 ora ($7b),y
$1c:dd3a  23 c4		 and $c4,s
$1c:dd3c  4e c1 c9	  lsr $c9c1
$1c:dd3f  d7 6a		 cmp [$6a],y
$1c:dd41  73 d0		 adc ($d0,s),y
$1c:dd43  e0 32 43	  cpx #$4332
$1c:dd46  f3 ba		 sbc ($ba,s),y
$1c:dd48  84 58		 sty $58
$1c:dd4a  3a			dec a
$1c:dd4b  c7 4d		 cmp [$4d]
$1c:dd4d  16 b7		 asl $b7,x
$1c:dd4f  5b			tcd
$1c:dd50  f9 1d 4b	  sbc $4b1d,y
$1c:dd53  7d ba 2e	  adc $2eba,x
$1c:dd56  12 03		 ora ($03)
$1c:dd58  a0 08 47	  ldy #$4708
$1c:dd5b  64 39		 stz $39
$1c:dd5d  03 b0		 ora $b0,s
$1c:dd5f  8e 41 d6	  stx $d641
$1c:dd62  1a			inc a
$1c:dd63  81 f8		 sta ($f8,x)
$1c:dd65  93 41		 sta ($41,s),y
$1c:dd67  20 1c 89	  jsr $891c
$1c:dd6a  84 da		 sty $da
$1c:dd6c  6f 30 10 10   adc $101030
$1c:dd70  fd 0a c4	  sbc $c40a,x
$1c:dd73  58			cli
$1c:dd74  12 64		 ora ($64)
$1c:dd76  16 02		 asl $02,x
$1c:dd78  9d 4f 2c	  sta $2c4f,x
$1c:dd7b  01 71		 ora ($71,x)
$1c:dd7d  b4 3c		 ldy $3c,x
$1c:dd7f  83 40		 sta $40,s
$1c:dd81  55 aa		 eor $aa,x
$1c:dd83  e6 80		 inc $80
$1c:dd85  26 26		 rol $26
$1c:dd87  6f 45 9c 2b   adc $2b9c45
$1c:dd8b  01 a0		 ora ($a0,x)
$1c:dd8d  66 c6		 ror $c6
$1c:dd8f  b0 11		 bcs $dda2
$1c:dd91  07 33		 ora [$33]
$1c:dd93  59 d4 d1	  eor $d1d4,y
$1c:dd96  e8			inx
$1c:dd97  b4 9c		 ldy $9c,x
$1c:dd99  84 a9		 sty $a9
$1c:dd9b  16 84		 asl $84,x
$1c:dd9d  9a			txs
$1c:dd9e  1c a5 7d	  trb $7da5
$1c:dda1  72 c4		 adc ($c4)
$1c:dda3  41 ad		 eor ($ad,x)
$1c:dda5  d8			cld
$1c:dda6  af e7 33 9f   lda $9f33e7
$1c:ddaa  fb			xce
$1c:ddab  6a			ror a
$1c:ddac  b5 6c		 lda $6c,x
$1c:ddae  fa			plx
$1c:ddaf  77 83		 adc [$83],y
$1c:ddb1  fc 1b f8	  jsr ($f81b,x)
$1c:ddb4  13 06		 ora ($06,s),y
$1c:ddb6  e0 bc 27	  cpx #$27bc
$1c:ddb9  3c df dd	  bit $dddf,x
$1c:ddbc  33 7f		 and ($7f,s),y
$1c:ddbe  4a			lsr a
$1c:ddbf  82 20 b3	  brl $90e2
$1c:ddc2  20 72 35	  jsr $3572
$1c:ddc5  9c d1 9c	  stz $9cd1
$1c:ddc8  95 07		 sta $07,x
$1c:ddca  9f ef 21 c8   sta $c821ef,x
$1c:ddce  bc 48 56	  ldy $5648,x
$1c:ddd1  3f 5d 67 30   and $30675d,x
$1c:ddd5  ce a4 f5	  dec $f5a4
$1c:ddd8  e7 08		 sbc [$08]
$1c:ddda  18			clc
$1c:dddb  be c3 36	  ldx $36c3,y
$1c:ddde  27 f9		 and [$f9]
$1c:dde0  00 0c		 brk #$0c
$1c:dde2  ce 67 2d	  dec $2d67
$1c:dde5  0f 29 61 9a   ora $9a6129
$1c:dde9  7d 8e b5	  adc $b58e,x
$1c:ddec  81 6f		 sta ($6f,x)
$1c:ddee  00 d5		 brk #$d5
$1c:ddf0  34 1b		 bit $1b,x
$1c:ddf2  e2 d1		 sep #$d1
$1c:ddf4  20 84 d0	  jsr $d084
$1c:ddf7  c2 05		 rep #$05
$1c:ddf9  ab			plb
$1c:ddfa  67 83		 adc [$83]
$1c:ddfc  c2 5f		 rep #$5f
$1c:ddfe  80 11		 bra $de11
$1c:de00  bd 16 75	  lda $7516,x
$1c:de03  fd ba 5f	  sbc $5fba,x
$1c:de06  b1 dd		 lda ($dd),y
$1c:de08  8e e7 c9	  stx $c9e7
$1c:de0b  d7 6a		 cmp [$6a],y
$1c:de0d  50 ec		 bvc $ddfb
$1c:de0f  88			dey
$1c:de10  2d 67 27	  and $2767
$1c:de13  67 f6		 adc [$f6]
$1c:de15  29 d7 38	  and #$38d7
$1c:de18  58			cli
$1c:de19  23 fc		 and $fc,s
$1c:de1b  1e 82 8d	  asl $8d82,x
$1c:de1e  f5 84		 sbc $84,x
$1c:de20  94 0f		 sty $0f,x
$1c:de22  ba			tsx
$1c:de23  48			pha
$1c:de24  4b			phk
$1c:de25  64 34		 stz $34
$1c:de27  63 ba		 adc $ba,s
$1c:de29  13 5f		 ora ($5f,s),y
$1c:de2b  9c 77 63	  stz $6377
$1c:de2e  1a			inc a
$1c:de2f  a5 94		 lda $94
$1c:de31  9a			txs
$1c:de32  1c ae 57	  trb $57ae
$1c:de35  70 ec		 bvs $de23
$1c:de37  49 67 d6	  eor #$d667
$1c:de3a  e6 73		 inc $73
$1c:de3c  4b			phk
$1c:de3d  29 26 86	  and #$8626
$1c:de40  ab			plb
$1c:de41  ed b2 59	  sbc $59b2
$1c:de44  5e 77 51	  lsr $5177,x
$1c:de47  af 61 5b 80   lda $805b61
$1c:de4b  4f 04 b3 31   eor $31b304
$1c:de4f  60			rts
$1c:de50  e9 9a 02	  sbc #$029a
$1c:de53  f2 8d		 sbc ($8d)
$1c:de55  9b			txy
$1c:de56  80 1d		 bra $de75
$1c:de58  fb			xce
$1c:de59  b2 7f		 lda ($7f)
$1c:de5b  f8			sed
$1c:de5c  43 c4		 eor $c4,s
$1c:de5e  3e 32 f2	  rol $f232,x
$1c:de61  1f fb f5 9c   ora $9cf5fb,x
$1c:de65  d5 21		 cmp $21,x
$1c:de67  16 e1		 asl $e1,x
$1c:de69  06 44		 asl $44
$1c:de6b  9a			txs
$1c:de6c  42 a9		 wdm #$a9
$1c:de6e  f3 c9		 sbc ($c9,s),y
$1c:de70  a7 ac		 lda [$ac]
$1c:de72  e6 2c		 inc $2c
$1c:de74  cf 58 5a 66   cmp $665a58
$1c:de78  0b			phd
$1c:de79  92 d3		 sta ($d3)
$1c:de7b  94 d1		 sty $d1,x
$1c:de7d  7e 5a 70	  ror $705a,x
$1c:de80  b4 fa		 ldy $fa,x
$1c:de82  dd 8b 85	  cmp $858b,x
$1c:de85  f3 ec		 sbc ($ec,s),y
$1c:de87  f0 d8		 beq $de61
$1c:de89  51 5d		 eor ($5d),y
$1c:de8b  f8			sed
$1c:de8c  c1 80		 cmp ($80,x)
$1c:de8e  47 b0		 eor [$b0]
$1c:de90  58			cli
$1c:de91  ea			nop
$1c:de92  02 39		 cop #$39
$1c:de94  60			rts
$1c:de95  8a			txa
$1c:de96  09 50 68	  ora #$6850
$1c:de99  2f 35 92 ac   and $ac9235
$1c:de9d  c8			iny
$1c:de9e  5e 66 50	  lsr $5066,x
$1c:dea1  08			php
$1c:dea2  d1 48		 cmp ($48),y
$1c:dea4  84 4e		 sty $4e
$1c:dea6  4f 51 93 9b   eor $9b9351
$1c:deaa  fd 00 e4	  sbc $e400,x
$1c:dead  44 3f c7	  mvp $c7,$3f
$1c:deb0  3b			tsc
$1c:deb1  ab			plb
$1c:deb2  58			cli
$1c:deb3  9e f2 31	  stz $31f2,x
$1c:deb6  09 f9 ea	  ora #$eaf9
$1c:deb9  56 67		 lsr $67,x
$1c:debb  dc 8c 52	  jml [$528c]
$1c:debe  3e 4d 5e	  rol $5e4d,x
$1c:dec1  7b			tdc
$1c:dec2  f6 c8		 inc $c8,x
$1c:dec4  ec 28 ae	  cpx $ae28
$1c:dec7  f7 a2		 sbc [$a2],y
$1c:dec9  3b			tsc
$1c:deca  c8			iny
$1c:decb  23 bc		 and $bc,s
$1c:decd  92 ad		 sta ($ad)
$1c:decf  ff 41 a0 67   sbc $67a041,x
$1c:ded3  63 39		 adc $39,s
$1c:ded5  6b			rtl
$1c:ded6  01 82		 ora ($82,x)
$1c:ded8  d7 66		 cmp [$66],y
$1c:deda  c9 15 07	  cmp #$0715
$1c:dedd  92 9a		 sta ($9a)
$1c:dedf  34 d1		 bit $d1,x
$1c:dee1  eb			xba
$1c:dee2  07 46		 ora [$46]
$1c:dee4  03 86		 ora $86,s
$1c:dee6  91 07		 sta ($07),y
$1c:dee8  60			rts
$1c:dee9  56 05		 lsr $05,x
$1c:deeb  94 19		 sty $19,x
$1c:deed  c1 a7		 cmp ($a7,x)
$1c:deef  c7 50		 cmp [$50]
$1c:def1  49 03 b3	  eor #$b303
$1c:def4  e2 7a		 sep #$7a
$1c:def6  b5 89		 lda $89,x
$1c:def8  ea			nop
$1c:def9  d4 cf		 pei ($cf)
$1c:defb  0b			phd
$1c:defc  8b			phb
$1c:defd  ea			nop
$1c:defe  56 a7		 lsr $a7,x
$1c:df00  ea			nop
$1c:df01  3a			dec a
$1c:df02  13 21		 ora ($21,s),y
$1c:df04  d7 d8		 cmp [$d8],y
$1c:df06  de d7 6d	  dec $6dd7,x
$1c:df09  2f db 64 57   and $5764db
$1c:df0d  45 a1		 eor $a1
$1c:df0f  72 76		 adc ($76)
$1c:df11  7f 6d 9e a3   adc $a39e6d,x
$1c:df15  5e f2 9d	  lsr $9df2,x
$1c:df18  76 a4		 ror $a4,x
$1c:df1a  1a			inc a
$1c:df1b  0f 1f 01 78   ora $78011f
$1c:df1f  4f c4 9e d6   eor $d69ec4
$1c:df23  0f e8 e3 c5   ora $c5e3e8
$1c:df27  37 ac		 and [$ac],y
$1c:df29  61 99		 adc ($99,x)
$1c:df2b  72 1a		 adc ($1a)
$1c:df2d  48			pha
$1c:df2e  2c 84 32	  bit $3284
$1c:df31  9f 7c 5c 9a   sta $9a5c7c,x
$1c:df35  ce 62 d4	  dec $d462
$1c:df38  f5 85		 sbc $85,x
$1c:df3a  c4 e5		 cpy $e5
$1c:df3c  30 83		 bmi $dec1
$1c:df3e  b8			clv
$1c:df3f  dc 0e ab	  jml [$ab0e]
$1c:df42  08			php
$1c:df43  79 62 d2	  adc $d262,y
$1c:df46  d3 eb		 cmp ($eb,s),y
$1c:df48  76 3a		 ror $3a,x
$1c:df4a  dc d3 b0	  jml [$b0d3]
$1c:df4d  73 0d		 adc ($0d,s),y
$1c:df4f  21 cf		 and ($cf,x)
$1c:df51  97 83		 sta [$83],y
$1c:df53  ed f6 d5	  sbc $d5f6
$1c:df56  6a			ror a
$1c:df57  f5 5a		 sbc $5a,x
$1c:df59  1e af 73	  asl $73af,x
$1c:df5c  93 a0		 sta ($a0,s),y
$1c:df5e  71 0b		 adc ($0b),y
$1c:df60  80 1c		 bra $df7e
$1c:df62  06 e3		 asl $e3
$1c:df64  0f 8b c4 dc   ora $dcc48b
$1c:df68  01 b2		 ora ($b2,x)
$1c:df6a  fb			xce
$1c:df6b  67 b6		 adc [$b6]
$1c:df6d  14 50		 trb $50
$1c:df6f  08			php
$1c:df70  d0 c0		 bne $df32
$1c:df72  25 a2		 and $a2
$1c:df74  ce 98 03	  dec $0398
$1c:df77  ed a6 00	  sbc $00a6
$1c:df7a  9d 10 0e	  sta $0e10,x
$1c:df7d  7a			ply
$1c:df7e  57 e8		 eor [$e8],y
$1c:df80  8c 44 42	  sty $4244
$1c:df83  cb			wai
$1c:df84  c0 30		 cpy #$30
$1c:df86  01 80		 ora ($80,x)
$1c:df88  84 23		 sty $23
$1c:df8a  fd 13 99	  sbc $9913,x
$1c:df8d  bc 43 e2	  ldy $e243,x
$1c:df90  76 02		 ror $02,x
$1c:df92  19 eb 05	  ora $05eb,y
$1c:df95  4c 94 61	  jmp $6194
$1c:df98  d3 14		 cmp ($14,s),y
$1c:df9a  a0 99		 ldy #$99
$1c:df9c  e5 d6		 sbc $d6
$1c:df9e  5a			phy
$1c:df9f  06 b0		 asl $b0
$1c:dfa1  d1 65		 cmp ($65),y
$1c:dfa3  90 31		 bcc $dfd6
$1c:dfa5  01 66		 ora ($66,x)
$1c:dfa7  92 aa		 sta ($aa)
$1c:dfa9  8c f4 ef	  sty $eff4
$1c:dfac  ab			plb
$1c:dfad  bb			tyx
$1c:dfae  4e bf bd	  lsr $bdbf
$1c:dfb1  07 db		 ora [$db]
$1c:dfb3  56 33		 lsr $33,x
$1c:dfb5  15 b9		 ora $b9,x
$1c:dfb7  21 41		 and ($41,x)
$1c:dfb9  ee ae f5	  inc $f5ae
$1c:dfbc  02 d1		 cop #$d1
$1c:dfbe  88			dey
$1c:dfbf  08			php
$1c:dfc0  4a			lsr a
$1c:dfc1  43 27		 eor $27,s
$1c:dfc3  79 88 e4	  adc $e488,y
$1c:dfc6  3e 2f 67	  rol $672f,x
$1c:dfc9  1b			tcs
$1c:dfca  97 56		 sta [$56],y
$1c:dfcc  b1 d5		 lda ($d5),y
$1c:dfce  e5 10		 sbc $10
$1c:dfd0  87 b8		 sta [$b8]
$1c:dfd2  3f 00 3a 75   and $753a00,x
$1c:dfd6  2b			pld
$1c:dfd7  5c 9c c6 c7   jml $c7c69c
$1c:dfdb  5b			tcd
$1c:dfdc  99 cd 13	  sta $13cd,y
$1c:dfdf  c0 0e		 cpy #$0e
$1c:dfe1  cc b0 fb	  cpy $fbb0
$1c:dfe4  6a			ror a
$1c:dfe5  8f e2 1f 1e   sta $1e1fe2
$1c:dfe9  ac f4 80	  ldy $80f4
$1c:dfec  05 f1		 ora $f1
$1c:dfee  5e 04 ed	  lsr $ed04,x
$1c:dff1  5e 25 e2	  lsr $e225,x
$1c:dff4  ac 4f 79	  ldy $794f
$1c:dff7  25 f1		 and $f1
$1c:dff9  e2 d9		 sep #$d9
$1c:dffb  bd 35 ec	  lda $ec35,x
$1c:dffe  e1 2d		 sbc ($2d,x)
$1c:e000  27 dd		 and [$dd]
$1c:e002  42 68		 wdm #$68
$1c:e004  f7 68		 sbc [$68],y
$1c:e006  7e aa 1e	  ror $1eaa,x
$1c:e009  90 0e		 bcc $e019
$1c:e00b  c4 71		 cpy $71
$1c:e00d  ea			nop
$1c:e00e  51 3d		 eor ($3d),y
$1c:e010  54 44 f1	  mvn $f1,$44
$1c:e013  12 95		 ora ($95)
$1c:e015  53 84		 eor ($84,s),y
$1c:e017  22 5f d6 b4   jsl $b4d65f
$1c:e01b  a6 0d		 ldx $0d
$1c:e01d  0b			phd
$1c:e01e  d5 6a		 cmp $6a,x
$1c:e020  db			stp
$1c:e021  f7 f6		 sbc [$f6],y
$1c:e023  1b			tcs
$1c:e024  b6 b0		 ldx $b0,y
$1c:e026  22 3c e2 f8   jsl $f8e23c
$1c:e02a  96 58		 stx $58,y
$1c:e02c  40			rti
$1c:e02d  4f b2 e6 83   eor $83e6b2
$1c:e031  df 58 fa 3f   cmp $3ffa58,x
$1c:e035  78			sei
$1c:e036  7e 5f 64	  ror $645f,x
$1c:e039  ef 67 9a 3f   sbc $3f9a67
$1c:e03d  55 3e		 eor $3e,x
$1c:e03f  1d 55 f9	  ora $f955,x
$1c:e042  77 13		 adc [$13],y
$1c:e044  e0 fe		 cpx #$fe
$1c:e046  45 78		 eor $78
$1c:e048  72 73		 adc ($73)
$1c:e04a  0d 00 cc	  ora $cc00
$1c:e04d  e6 8a		 inc $8a
$1c:e04f  83 3d		 sta $3d,s
$1c:e051  54 27 27	  mvn $27,$27
$1c:e054  67 f6		 adc [$f6]
$1c:e056  76 86		 ror $86,x
$1c:e058  c8			iny
$1c:e059  fe 35 89	  inc $8935,x
$1c:e05c  e9 85		 sbc #$85
$1c:e05e  35 da		 and $da,x
$1c:e060  9d 5e a3	  sta $a35e,x
$1c:e063  5e 64 1a	  lsr $1a64,x
$1c:e066  d4 f8		 pei ($f8)
$1c:e068  c2 99		 rep #$99
$1c:e06a  bd 85 17	  lda $1785,x
$1c:e06d  45 9c		 eor $9c
$1c:e06f  7e 47 53	  ror $5347,x
$1c:e072  46 88		 lsr $88
$1c:e074  1d 20 f2	  ora $f220,x
$1c:e077  00 08		 brk #$08
$1c:e079  4c 84 82	  jmp $8284
$1c:e07c  95 40		 sta $40,x
$1c:e07e  8e 4b f9	  stx $f94b
$1c:e081  e5 eb		 sbc $eb
$1c:e083  4b			phk
$1c:e084  00 d0		 brk #$d0
$1c:e086  ac c9 a4	  ldy $a4c9
$1c:e089  35 5a		 and $5a,x
$1c:e08b  b7 0d		 lda [$0d],y
$1c:e08d  1d c3 3c	  ora $3cc3,x
$1c:e090  88			dey
$1c:e091  2e 4d 0d	  rol $0d4d
$1c:e094  0c 79 df	  tsb $df79
$1c:e097  b1 9c		 lda ($9c),y
$1c:e099  34 c9		 bit $c9,x
$1c:e09b  82 ea 51	  brl $3288
$1c:e09e  12 c7		 ora ($c7)
$1c:e0a0  a5 fb		 lda $fb
$1c:e0a2  1d c0 d6	  ora $d6c0,x
$1c:e0a5  21 26		 and ($26,x)
$1c:e0a7  3b			tsc
$1c:e0a8  0e cc f4	  asl $f4cc
$1c:e0ab  41 47		 eor ($47,x)
$1c:e0ad  33 80		 and ($80,s),y
$1c:e0af  3f cf 45 ac   and $ac45cf,x
$1c:e0b3  e6 91		 inc $91
$1c:e0b5  4f 58 2c 6e   eor $6e2c58
$1c:e0b9  7f bc aa 7c   adc $7caabc,x
$1c:e0bd  e0 e3 15	  cpx #$15e3
$1c:e0c0  1c 9b e5	  trb $e59b
$1c:e0c3  e6 d6		 inc $d6
$1c:e0c5  73 35		 adc ($35,s),y
$1c:e0c7  86 9b		 stx $9b
$1c:e0c9  e7 1c		 sbc [$1c]
$1c:e0cb  c8			iny
$1c:e0cc  b7 29		 lda [$29],y
$1c:e0ce  65 46		 adc $46
$1c:e0d0  fe a7 40	  inc $40a7,x
$1c:e0d3  a0 dc ff	  ldy #$ffdc
$1c:e0d6  db			stp
$1c:e0d7  42 92		 wdm #$92
$1c:e0d9  bf b3 42 df   lda $df42b3,x
$1c:e0dd  e0 60 14	  cpx #$1460
$1c:e0e0  c1 24		 cmp ($24,x)
$1c:e0e2  cf 93 9b d8   cmp $d89b93
$1c:e0e6  51 7e		 eor ($7e),y
$1c:e0e8  c3 10		 cmp $10,s
$1c:e0ea  79 3f 53	  adc $533f,y
$1c:e0ed  46 fd		 lsr $fd
$1c:e0ef  07 7d		 ora [$7d]
$1c:e0f1  0d 49 ff	  ora $ff49
$1c:e0f4  04 44		 tsb $44
$1c:e0f6  77 c1		 adc [$c1],y
$1c:e0f8  d5 1f		 cmp $1f,x
$1c:e0fa  ec 86 02	  cpx $0286
$1c:e0fd  42 3b		 wdm #$3b
$1c:e0ff  d8			cld
$1c:e100  ac cf f4	  ldy $f4cf
$1c:e103  14 a0		 trb $a0
$1c:e105  ae 0e 70	  ldx $700e
$1c:e108  ff 43 9c 28   sbc $289c43,x
$1c:e10c  04 8e		 tsb $8e
$1c:e10e  c4 83		 cpy $83
$1c:e110  70 07		 bvs $e119
$1c:e112  29 43		 and #$43
$1c:e114  7f 6d 3e b7   adc $b73e6d,x
$1c:e118  62 b1 a6	  per $87cc
$1c:e11b  f8			sed
$1c:e11c  6a			ror a
$1c:e11d  98			tya
$1c:e11e  17 00		 ora [$00],y
$1c:e120  67 e8		 adc [$e8]
$1c:e122  70 3f		 bvs $e163
$1c:e124  2c fb 06	  bit $06fb
$1c:e127  83 be		 sta $be,s
$1c:e129  b4 59		 ldy $59,x
$1c:e12b  d7 7e		 cmp [$7e],y
$1c:e12d  e9 4a		 sbc #$4a
$1c:e12f  ce 5c 1e	  dec $1e5c
$1c:e132  a5 b3		 lda $b3
$1c:e134  93 b3		 sta ($b3,s),y
$1c:e136  33 3e		 and ($3e,s),y
$1c:e138  b0 b6		 bcs $e0f0
$1c:e13a  5c 9d 71 cd   jml $cd719d
$1c:e13e  ca			dex
$1c:e13f  a5 fd		 lda $fd
$1c:e141  e4 e6		 cpx $e6
$1c:e143  d2 67		 cmp ($67)
$1c:e145  ac 1a 97	  ldy $971a
$1c:e148  57 b8		 eor [$b8],y
$1c:e14a  19 1d 18	  ora $181d,y
$1c:e14d  58			cli
$1c:e14e  ce 45 ce	  dec $ce45
$1c:e151  e4 d0		 cpx $d0
$1c:e153  c2 e4		 rep #$e4
$1c:e155  23 41		 and $41,s
$1c:e157  a9 75 28	  lda #$2875
$1c:e15a  81 80		 sta ($80,x)
$1c:e15c  ea			nop
$1c:e15d  f2 85		 sbc ($85)
$1c:e15f  f6 2c		 inc $2c,x
$1c:e161  0c c0 bf	  tsb $bfc0
$1c:e164  76 63		 ror $63,x
$1c:e166  f3 20		 sbc ($20,s),y
$1c:e168  18			clc
$1c:e169  a5 39		 lda $39
$1c:e16b  49 fb e5	  eor #$e5fb
$1c:e16e  e8			inx
$1c:e16f  35 bb		 and $bb,x
$1c:e171  15 7d		 ora $7d,x
$1c:e173  e7 f5		 sbc [$f5]
$1c:e175  5f 65 fe 38   eor $38fe65,x
$1c:e179  ad b7 ed	  lda $edb7
$1c:e17c  e0 fb 67	  cpx #$67fb
$1c:e17f  80 70		 bra $e1f1
$1c:e181  f1 2f		 sbc ($2f),y
$1c:e183  b6 99		 ldx $99,y
$1c:e185  e3 9a		 sbc $9a,s
$1c:e187  8d 79 3c	  sta $3c79
$1c:e18a  c2 2f		 rep #$2f
$1c:e18c  a9 d0 f2	  lda #$f2d0
$1c:e18f  35 85		 and $85,x
$1c:e191  f3 11		 sbc ($11,s),y
$1c:e193  ae 8b 38	  ldx $388b
$1c:e196  53 33		 eor ($33,s),y
$1c:e198  fb			xce
$1c:e199  e8			inx
$1c:e19a  b4 85		 ldy $85,x
$1c:e19c  33 d6		 and ($d6,s),y
$1c:e19e  23 d9		 and $d9,s
$1c:e1a0  34 24		 bit $24,x
$1c:e1a2  22 3c 1a 64   jsl $641a3c
$1c:e1a6  b9 5d c2	  lda $c25d,y
$1c:e1a9  0a			asl a
$1c:e1aa  08			php
$1c:e1ab  db			stp
$1c:e1ac  33 9a		 and ($9a,s),y
$1c:e1ae  18			clc
$1c:e1af  e7 d8		 sbc [$d8]
$1c:e1b1  40			rti
$1c:e1b2  03 2b		 ora $2b,s
$1c:e1b4  d4 ec		 pei ($ec)
$1c:e1b6  84 20		 sty $20
$1c:e1b8  47 62		 eor [$62]
$1c:e1ba  39 03 c3	  and $c303,y
$1c:e1bd  94 a1		 sty $a1,x
$1c:e1bf  bf b6 9f 5b   lda $5b9fb6,x
$1c:e1c3  b1 58		 lda ($58),y
$1c:e1c5  d7 db		 cmp [$db],y
$1c:e1c7  ed aa 60	  sbc $60aa
$1c:e1ca  5b			tcd
$1c:e1cb  83 5b		 sta $5b,s
$1c:e1cd  bf a2 17 88   lda $8817a2,x
$1c:e1d1  c4 4a		 cpy $4a
$1c:e1d3  c0 32 1e	  cpy #$1e32
$1c:e1d6  77 27		 adc [$27],y
$1c:e1d8  5d a9 77	  eor $77a9,x
$1c:e1db  81 00		 sta ($00,x)
$1c:e1dd  1e 71 b3	  asl $b371,x
$1c:e1e0  fb			xce
$1c:e1e1  16 8d		 asl $8d,x
$1c:e1e3  e9 26 a3	  sbc #$a326
$1c:e1e6  d6 01		 dec $01,x
$1c:e1e8  61 0e		 adc ($0e,x)
$1c:e1ea  af 67 4b ae   lda $ae4b67
$1c:e1ee  b0 0f		 bcs $e1ff
$1c:e1f0  61 04		 adc ($04,x)
$1c:e1f2  0d 40 81	  ora $8140
$1c:e1f5  05 54		 ora $54
$1c:e1f7  31 47		 and ($47),y
$1c:e1f9  e0 9b f0	  cpx #$f09b
$1c:e1fc  da			phx
$1c:e1fd  03 f5		 ora $f5,s
$1c:e1ff  20 a3 f0	  jsr $f0a3
$1c:e202  79 49 fa	  adc $fa49,y
$1c:e205  e5 e8		 sbc $e8
$1c:e207  3e da dd	  rol $ddda,x
$1c:e20a  8a			txa
$1c:e20b  be 73 39	  ldx $3973,y
$1c:e20e  ff b6 a9 7d   sbc $7da9b6,x
$1c:e212  6c c0 70	  jmp ($70c0)
$1c:e215  6b			rtl
$1c:e216  77 c0		 adc [$c0],y
$1c:e218  75 0e		 adc $0e,x
$1c:e21a  a9 4e 2b	  lda #$2b4e
$1c:e21d  93 8b		 sta ($8b,s),y
$1c:e21f  34 e2		 bit $e2,x
$1c:e221  e1 38		 sbc ($38,x)
$1c:e223  c5 4e		 cmp $4e
$1c:e225  34 93		 bit $93,x
$1c:e227  8d f4 e3	  sta $e3f4
$1c:e22a  91 38		 sta ($38),y
$1c:e22c  e9 4e 3b	  sbc #$3b4e
$1c:e22f  93 8f		 sta ($8f,s),y
$1c:e231  f4 e2 41	  pea $41e2
$1c:e234  39 a1 4e	  and $4ea1,y
$1c:e237  69 93 9a	  adc #$9a93
$1c:e23a  b4 e6		 ldy $e6,x
$1c:e23c  c1 39		 cmp ($39,x)
$1c:e23e  c1 4e		 cmp ($4e,x)
$1c:e240  74 93		 stz $93,x
$1c:e242  9e 34 e7	  stz $e734,x
$1c:e245  a1 39		 lda ($39,x)
$1c:e247  ed 4e 7c	  sbc $7c4e
$1c:e24a  93 98		 sta ($98,s),y
$1c:e24c  34 ea		 bit $ea,x
$1c:e24e  51 3a		 eor ($3a),y
$1c:e250  a5 4e		 lda $4e
$1c:e252  b2 93		 lda ($93)
$1c:e254  ae f0 70	  ldx $70f0
$1c:e257  27 78		 and [$78]
$1c:e259  a9 df b2	  lda #$b2df
$1c:e25c  77 4e		 adc [$4e],y
$1c:e25e  9e 5c 27	  stz $275c,x
$1c:e261  91 a9		 sta ($a9),y
$1c:e263  ec f2 7b	  cpx $7bf2
$1c:e266  5e 9e e4	  lsr $e49e,x
$1c:e269  27 b9		 and [$b9]
$1c:e26b  a9 ee f2	  lda #$f2ee
$1c:e26e  7b			tdc
$1c:e26f  e6 9e		 inc $9e
$1c:e271  c2 27		 rep #$27
$1c:e273  d1 a9		 cmp ($a9),y
$1c:e275  f4 00 82	  pea $8200
$1c:e278  72 c9		 adc ($c9)
$1c:e27a  f7 ff		 sbc [$ff],y
$1c:e27c  fe 41 4a	  inc $4a41,x
$1c:e27f  41 21		 eor ($21,x)
$1c:e281  ec 84 81	  cpx $8184
$1c:e284  82 10 46	  brl $2897
$1c:e287  03 00		 ora $00,s
$1c:e289  bc cf a0	  ldy $a0cf,x
$1c:e28c  a6 03		 ldx $03
$1c:e28e  ca			dex
$1c:e28f  cf 8b e9 b8   cmp $b8e98b
$1c:e293  2e 29 24	  rol $2429
$1c:e296  3a			dec a
$1c:e297  86 63		 stx $63
$1c:e299  24 87		 bit $87
$1c:e29b  c0 dc 64	  cpy #$64dc
$1c:e29e  90 86		 bcc $e226
$1c:e2a0  4f cb a4 49   eor $49a4cb
$1c:e2a4  29 44 fc	  and #$fc44
$1c:e2a7  ce 04 92	  dec $9204
$1c:e2aa  9e cf d2	  stz $d2cf,x
$1c:e2ad  69 52 48	  adc #$4852
$1c:e2b0  09 05 2c	  ora #$2c05
$1c:e2b3  ea			nop
$1c:e2b4  a7 be		 lda [$be]
$1c:e2b6  2a			rol a
$1c:e2b7  9f 22 90 18   sta $189022,x
$1c:e2bb  19 80 d6	  ora $d680,y
$1c:e2be  60			rts
$1c:e2bf  cb			wai
$1c:e2c0  4d 33 49	  eor $4933
$1c:e2c3  5a			phy
$1c:e2c4  2d bb 64	  and $64bb
$1c:e2c7  29 24 17	  and #$1724
$1c:e2ca  a0 ed 4e	  ldy #$4eed
$1c:e2cd  83 d1		 sta $d1,s
$1c:e2cf  5e 6d e5	  lsr $e56d,x
$1c:e2d2  64 19		 stz $19
$1c:e2d4  24 98		 bit $98
$1c:e2d6  e0 0f 4f	  cpx #$4f0f
$1c:e2d9  d0 59		 bne $e334
$1c:e2db  42 ad		 wdm #$ad
$1c:e2dd  0f a0 12 5a   ora $5a12a0
$1c:e2e1  d4 2e		 pei ($2e)
$1c:e2e3  7f b0 b9 f2   adc $f2b9b0,x
$1c:e2e7  14 10		 trb $10
$1c:e2e9  c8			iny
$1c:e2ea  41 dc		 eor ($dc,x)
$1c:e2ec  87 24		 sta [$24]
$1c:e2ee  a0 13 d2	  ldy #$d213
$1c:e2f1  8e 56 51	  stx $5156
$1c:e2f4  b8			clv
$1c:e2f5  13 d3		 ora ($d3,s),y
$1c:e2f7  1a			inc a
$1c:e2f8  2e 12 79	  rol $7912
$1c:e2fb  06 43		 asl $43
$1c:e2fd  60			rts
$1c:e2fe  56 30		 lsr $30,x
$1c:e300  c8			iny
$1c:e301  74 cf		 stz $cf,x
$1c:e303  0a			asl a
$1c:e304  41 03		 eor ($03,x)
$1c:e306  8a			txa
$1c:e307  46 49		 lsr $49
$1c:e309  86 19		 stx $19
$1c:e30b  29 e5 05	  and #$05e5
$1c:e30e  26 96		 rol $96
$1c:e310  64 d2		 stz $d2
$1c:e312  92 c1		 sta ($c1)
$1c:e314  26 9b		 rol $9b
$1c:e316  a2 60 91	  ldx #$9160
$1c:e319  53 c8		 eor ($c8,s),y
$1c:e31b  b2 7b		 lda ($7b)
$1c:e31d  85 08		 sta $08
$1c:e31f  72 d1		 adc ($d1)
$1c:e321  8a			txa
$1c:e322  19 35 97	  ora $9735,y
$1c:e325  60			rts
$1c:e326  4f 48 05 08   eor $080548
$1c:e32a  9e 92 a7	  stz $a792,x
$1c:e32d  12 d1		 ora ($d1)
$1c:e32f  98			tya
$1c:e330  c2 71		 rep #$71
$1c:e332  46 28		 lsr $28
$1c:e334  1c 53 34	  trb $3453
$1c:e337  fc 5e 23	  jsr ($235e,x)
$1c:e33a  f1 7d		 sbc ($7d),y
$1c:e33c  cf 23 56 93   cmp $935623
$1c:e340  3c 12 69	  bit $6912,x
$1c:e343  49 0f 2d	  eor #$2d0f
$1c:e346  e8			inx
$1c:e347  3c ba b6	  bit $b6ba,x
$1c:e34a  80 c3		 bra $e30f
$1c:e34c  d8			cld
$1c:e34d  07 dc		 ora [$dc]
$1c:e34f  a1 9a		 lda ($9a,x)
$1c:e351  c1 80		 cmp ($80,x)
$1c:e353  5f 82 02 c5   eor $c50282,x
$1c:e357  28			plp
$1c:e358  84 1c		 sty $1c
$1c:e35a  1f f9 41 c7   ora $c741f9,x
$1c:e35e  2c 37 69	  bit $6937
$1c:e361  81 41		 sta ($41,x)
$1c:e363  69 85 05	  adc #$0585
$1c:e366  b4 22		 ldy $22,x
$1c:e368  b5 13		 lda $13,x
$1c:e36a  ea			nop
$1c:e36b  a7 41		 lda [$41]
$1c:e36d  b0 dd		 bcs $e34c
$1c:e36f  b0 85		 bcs $e2f6
$1c:e371  05 cc		 ora $cc
$1c:e373  94 17		 sty $17,x
$1c:e375  5c d4 d6 9f   jml $9fd6d4
$1c:e379  bd 1d 9a	  lda $9a1d,x
$1c:e37c  c3 12		 cmp $12,s
$1c:e37e  4a			lsr a
$1c:e37f  07 f7		 ora [$f7]
$1c:e381  fe a9 4f	  inc $4fa9,x
$1c:e384  f7 fd		 sbc [$fd],y
$1c:e386  62 88 10	  per $f411
$1c:e389  58			cli
$1c:e38a  b2 c4		 lda ($c4)
$1c:e38c  12 84		 ora ($84)
$1c:e38e  51 05		 eor ($05),y
$1c:e390  48			pha
$1c:e391  40			rti
$1c:e392  d4 8a		 pei ($8a)
$1c:e394  17 f1		 ora [$f1],y
$1c:e396  47 8e		 eor [$8e]
$1c:e398  70 2a		 bvs $e3c4
$1c:e39a  8c b0 ee	  sty $eeb0
$1c:e39d  50 df		 bvc $e37e
$1c:e39f  a9 f8 40	  lda #$40f8
$1c:e3a2  1b			tcs
$1c:e3a3  f4 10 e9	  pea $e910
$1c:e3a6  02 43		 cop #$43
$1c:e3a8  0a			asl a
$1c:e3a9  f0 87		 beq $e332
$1c:e3ab  e0 7f 01	  cpx #$017f
$1c:e3ae  fa			plx
$1c:e3af  1f c0 f3 e8   ora $e8f3c0,x
$1c:e3b3  af 4d e1 dc   lda $dce14d
$1c:e3b7  8e e0 53	  stx $53e0
$1c:e3ba  0c 23 f0	  tsb $f023
$1c:e3bd  4e e0 77	  lsr $77e0
$1c:e3c0  07 d9		 ora [$d9]
$1c:e3c2  1d c9 d2	  ora $d2c9,x
$1c:e3c5  85 f0		 sta $f0
$1c:e3c7  05 81		 ora $81
$1c:e3c9  64 98		 stz $98
$1c:e3cb  a0 e1 01	  ldy #$01e1
$1c:e3ce  fa			plx
$1c:e3cf  38			sec
$1c:e3d0  41 b7		 eor ($b7,x)
$1c:e3d2  ee cf 7e	  inc $7ecf
$1c:e3d5  e0 94 8a	  cpx #$8a94
$1c:e3d8  25 c3		 and $c3
$1c:e3da  2b			pld
$1c:e3db  2f 60 34 be   and $be3460
$1c:e3df  d0 d2		 bne $e3b3
$1c:e3e1  c0 a8 a2	  cpy #$a2a8
$1c:e3e4  52 07		 eor ($07)
$1c:e3e6  81 14		 sta ($14,x)
$1c:e3e8  08			php
$1c:e3e9  64 61		 stz $61
$1c:e3eb  22 59 03 c0   jsl $c00359
$1c:e3ef  a2 87 12	  ldx #$1287
$1c:e3f2  2d 81 7c	  and $7c81
$1c:e3f5  9b			txy
$1c:e3f6  20 65 44	  jsr $4465
$1c:e3f9  1c 1d 51	  trb $511d
$1c:e3fc  fa			plx
$1c:e3fd  27 ed		 and [$ed]
$1c:e3ff  36 a2		 rol $a2,x
$1c:e401  4f d4 9e b5   eor $b59ed4
$1c:e405  f6 33		 inc $33,x
$1c:e407  c1 ce		 cmp ($ce,x)
$1c:e409  0a			asl a
$1c:e40a  ef 22 28 3d   sbc $3d2822
$1c:e40e  50 5e		 bvc $e46e
$1c:e410  05 30		 ora $30
$1c:e412  12 90		 ora ($90)
$1c:e414  94 88		 sty $88,x
$1c:e416  64 25		 stz $25
$1c:e418  22 59 0d 41   jsl $410d59
$1c:e41c  f6 44		 inc $44,x
$1c:e41e  52 2c		 eor ($2c)
$1c:e420  a4 14		 ldy $14
$1c:e422  44 71 7a	  mvp $7a,$71
$1c:e425  28			plp
$1c:e426  ad 2c 83	  lda $832c
$1c:e429  25 d8		 and $d8
$1c:e42b  8c 97 fc	  sty $fc97
$1c:e42e  5c 18 78 88   jml $887818
$1c:e432  e9 74 63	  sbc #$6374
$1c:e435  d8			cld
$1c:e436  c0 3f 5f	  cpy #$5f3f
$1c:e439  f2 98		 sbc ($98)
$1c:e43b  13 7c		 ora ($7c,s),y
$1c:e43d  bc ff cf	  ldy $cfff,x
$1c:e440  fc 30 c4	  jsr ($c430,x)
$1c:e443  2d a0 8f	  and $8fa0
$1c:e446  88			dey
$1c:e447  8e c0 7c	  stx $7cc0
$1c:e44a  17 78		 ora [$78],y
$1c:e44c  08			php
$1c:e44d  8a			txa
$1c:e44e  49 40 44	  eor #$4440
$1c:e451  a5 1d		 lda $1d
$1c:e453  20 b6 a4	  jsr $a4b6
$1c:e456  82 e3 68	  brl $4d3c
$1c:e459  08			php
$1c:e45a  74 08		 stz $08,x
$1c:e45c  85 c2		 sta $c2
$1c:e45e  84 ab		 sty $ab
$1c:e460  4c d2 c9	  jmp $c9d2
$1c:e463  78			sei
$1c:e464  8b			phb
$1c:e465  25 f7		 and $f7
$1c:e467  50 8f		 bvc $e3f8
$1c:e469  e8			inx
$1c:e46a  c9 07 50	  cmp #$5007
$1c:e46d  40			rti
$1c:e46e  c8			iny
$1c:e46f  c5 ff		 cmp $ff
$1c:e471  58			cli
$1c:e472  83 55		 sta $55,s
$1c:e474  17 20		 ora [$20],y
$1c:e476  d5 46		 cmp $46,x
$1c:e478  08			php
$1c:e479  35 51		 and $51,x
$1c:e47b  a2 42 23	  ldx #$2342
$1c:e47e  42 0b		 wdm #$0b
$1c:e480  dd 13 e0	  cmp $e013,x
$1c:e483  4b			phk
$1c:e484  01 0a		 ora ($0a,x)
$1c:e486  21 40		 and ($40,x)
$1c:e488  12 80		 ora ($80)
$1c:e48a  52 3b		 eor ($3b)
$1c:e48c  94 41		 sty $41,x
$1c:e48e  78			sei
$1c:e48f  21 f0		 and ($f0,x)
$1c:e491  0f 81 5c 1f   ora $1f5c81
$1c:e495  e5 08		 sbc $08
$1c:e497  14 28		 trb $28
$1c:e499  7c 03 7e	  jmp ($7e03,x)
$1c:e49c  2c 08 20	  bit $2008
$1c:e49f  a5 22		 lda $22
$1c:e4a1  82 05 1e	  brl $02a9
$1c:e4a4  a3 1c		 lda $1c,s
$1c:e4a6  01 26		 ora ($26,x)
$1c:e4a8  2d 01 bf	  and $bf01
$1c:e4ab  8b			phb
$1c:e4ac  00 c2		 brk #$c2
$1c:e4ae  b1 13		 lda ($13),y
$1c:e4b0  39 a0 80	  and $80a0,y
$1c:e4b3  7a			ply
$1c:e4b4  8e d2 80	  stx $80d2
$1c:e4b7  42 60		 wdm #$60
$1c:e4b9  11 20		 ora ($20),y
$1c:e4bb  18			clc
$1c:e4bc  00 c2		 brk #$c2
$1c:e4be  03 08		 ora $08,s
$1c:e4c0  13 a4		 ora ($a4,s),y
$1c:e4c2  25 da		 and $da
$1c:e4c4  06 8f		 asl $8f
$1c:e4c6  16 02		 asl $02,x
$1c:e4c8  40			rti
$1c:e4c9  c5 a1		 cmp $a1
$1c:e4cb  13 53		 ora ($53,s),y
$1c:e4cd  7a			ply
$1c:e4ce  dc 60 ab	  jml [$ab60]
$1c:e4d1  b4 8a		 ldy $8a,x
$1c:e4d3  b0 bd		 bcs $e492
$1c:e4d5  6e 30 65	  ror $6530
$1c:e4d8  da			phx
$1c:e4d9  45 9b		 eor $9b
$1c:e4db  de b7 18	  dec $18b7,x
$1c:e4de  3a			dec a
$1c:e4df  ed 22 ea	  sbc $ea22
$1c:e4e2  c5 2c		 cmp $2c
$1c:e4e4  dc 29 58	  jml [$5829]
$1c:e4e7  68			pla
$1c:e4e8  20 ff ff	  jsr $ffff
$1c:e4eb  cb			wai
$1c:e4ec  72 fd		 adc ($fd)
$1c:e4ee  00 bf		 brk #$bf
$1c:e4f0  a2 82 1c	  ldx #$1c82
$1c:e4f3  40			rti
$1c:e4f4  f4 c0 c8	  pea $c8c0
$1c:e4f7  0a			asl a
$1c:e4f8  be 98 19	  ldx $1998,y
$1c:e4fb  21 ab		 and ($ab,x)
$1c:e4fd  c1 03		 cmp ($03,x)
$1c:e4ff  28			plp
$1c:e500  3f f8 20 64   and $6420f8,x
$1c:e504  47 61		 eor [$61]
$1c:e506  87 a6		 sta [$a6]
$1c:e508  3e 80 95	  rol $9580,x
$1c:e50b  f0 08		 beq $e515
$1c:e50d  49 95 3e	  eor #$3e95
$1c:e510  cf 25 f7 9e   cmp $9ef725
$1c:e514  86 54		 stx $54
$1c:e516  94 f3		 sty $f3,x
$1c:e518  d0 cb		 bne $e4e5
$1c:e51a  10 a6		 bpl $e4c2
$1c:e51c  69 68 18	  adc #$1868
$1c:e51f  e4 82		 cpx $82
$1c:e521  a1 50		 lda ($50,x)
$1c:e523  1c 94 22	  trb $2294
$1c:e526  10 e8		 bpl $e510
$1c:e528  18			clc
$1c:e529  43 bc		 eor $bc,s
$1c:e52b  23 18		 and $18,s
$1c:e52d  40			rti
$1c:e52e  97 8d		 sta [$8d],y
$1c:e530  c6 a4		 dec $a4
$1c:e532  27 4a		 and [$4a]
$1c:e534  10 b9		 bpl $e4ef
$1c:e536  30 a3		 bmi $e4db
$1c:e538  5f 11 95 00   eor $009511,x
$1c:e53c  50 82		 bvc $e4c0
$1c:e53e  d3 19		 cmp ($19,s),y
$1c:e540  83 a0		 sta $a0,s
$1c:e542  c7 5c		 cmp [$5c]
$1c:e544  6d 4a 11	  adc $114a
$1c:e547  d1 30		 cmp ($30),y
$1c:e549  ae 83 8e	  ldx $8e83
$1c:e54c  06 2a		 asl $2a
$1c:e54e  19 00 c0	  ora $c000,y
$1c:e551  22 4a 09 08   jsl $08094a
$1c:e555  b8			clv
$1c:e556  2d 46 09	  and $0946
$1c:e559  00 8a		 brk #$8a
$1c:e55b  65 0b		 adc $0b
$1c:e55d  07 1d		 ora [$1d]
$1c:e55f  0c 54 36	  tsb $3654
$1c:e562  01 82		 ora ($82,x)
$1c:e564  44 94 16	  mvp $16,$94
$1c:e567  11 72		 ora ($72),y
$1c:e569  5d 1c 55	  eor $551c,x
$1c:e56c  80 8a		 bra $e4f8
$1c:e56e  3e 36 92	  rol $9236,x
$1c:e571  dc 52 e0	  jml [$e052]
$1c:e574  bc f6 6b	  ldy $6bf6,x
$1c:e577  9b			txy
$1c:e578  49 b4 20	  eor #$20b4
$1c:e57b  03 71		 ora $71,s
$1c:e57d  1a			inc a
$1c:e57e  00 23		 brk #$23
$1c:e580  70 0f		 bvs $e591
$1c:e582  e7 fd		 sbc [$fd]
$1c:e584  00 07		 brk #$07
$1c:e586  e0 01 84	  cpx #$8401
$1c:e589  04 fc		 tsb $fc
$1c:e58b  10 78		 bpl $e605
$1c:e58d  05 19		 ora $19
$1c:e58f  30 31		 bmi $e5c2
$1c:e591  08			php
$1c:e592  7c 02 c8	  jmp ($c802,x)
$1c:e595  89 11 d0	  bit #$d011
$1c:e598  d1 00		 cmp ($00),y
$1c:e59a  e3 18		 sbc $18,s
$1c:e59c  21 86		 and ($86,x)
$1c:e59e  54 54 6a	  mvn $6a,$54
$1c:e5a1  30 18		 bmi $e5bb
$1c:e5a3  ca			dex
$1c:e5a4  68			pla
$1c:e5a5  29 03 f2	  and #$f203
$1c:e5a8  3f 05 94 8c   and $8c9405,x
$1c:e5ac  70 82		 bvs $e530
$1c:e5ae  61 82		 adc ($82,x)
$1c:e5b0  80 a6		 bra $e558
$1c:e5b2  82 fd b3	  brl $99b2
$1c:e5b5  0f d2 e8 46   ora $46e8d2
$1c:e5b9  f2 bf		 sbc ($bf)
$1c:e5bb  da			phx
$1c:e5bc  0d 29 75	  ora $7529
$1c:e5bf  38			sec
$1c:e5c0  78			sei
$1c:e5c1  28			plp
$1c:e5c2  15 60		 ora $60,x
$1c:e5c4  d3 48		 cmp ($48,s),y
$1c:e5c6  10 54		 bpl $e61c
$1c:e5c8  81 41		 sta ($41,x)
$1c:e5ca  6a			ror a
$1c:e5cb  81 05		 sta ($05,x)
$1c:e5cd  84 12		 sty $12
$1c:e5cf  14 a6		 trb $a6
$1c:e5d1  f8			sed
$1c:e5d2  35 25		 and $25,x
$1c:e5d4  6a			ror a
$1c:e5d5  2d 32 b6	  and $b632
$1c:e5d8  39 ca 11	  and $11ca,y
$1c:e5db  08			php
$1c:e5dc  ae 3b 84	  ldx $843b
$1c:e5df  cc 11 8a	  cpy $8a11
$1c:e5e2  63 7c		 adc $7c,s
$1c:e5e4  20 e0 40	  jsr $40e0
$1c:e5e7  07 85		 ora [$85]
$1c:e5e9  08			php
$1c:e5ea  08			php
$1c:e5eb  0a			asl a
$1c:e5ec  50 6b		 bvc $e659
$1c:e5ee  f0 60		 beq $e650
$1c:e5f0  5d 44 18	  eor $1844,x
$1c:e5f3  b7 db		 lda [$db],y
$1c:e5f5  0b			phd
$1c:e5f6  48			pha
$1c:e5f7  0e 34 23	  asl $2334
$1c:e5fa  10 24		 bpl $e620
$1c:e5fc  00 1e		 brk #$1e
$1c:e5fe  40			rti
$1c:e5ff  d0 0a		 bne $e60b
$1c:e601  93 4c		 sta ($4c,s),y
$1c:e603  a3 ef		 lda $ef,s
$1c:e605  4a			lsr a
$1c:e606  52 84		 eor ($84)
$1c:e608  f8			sed
$1c:e609  06 50		 asl $50
$1c:e60b  78			sei
$1c:e60c  44 b8 14	  mvp $14,$b8
$1c:e60f  71 7a		 adc ($7a),y
$1c:e611  68			pla
$1c:e612  44 cf e0	  mvp $e0,$cf
$1c:e615  5e 37 9e	  lsr $9e37,x
$1c:e618  db			stp
$1c:e619  80 69		 bra $e684
$1c:e61b  5e 05 22	  lsr $2205,x
$1c:e61e  01 15		 ora ($15,x)
$1c:e620  20 18 33	  jsr $3318
$1c:e623  1f 0b 48 ee   ora $ee480b,x
$1c:e627  25 03		 and $03
$1c:e629  3f 91 64 50   and $506491,x
$1c:e62d  c2 35		 rep #$35
$1c:e62f  f4 d0 92	  pea $92d0
$1c:e632  52 bc		 eor ($bc)
$1c:e634  50 46		 bvc $e67c
$1c:e636  a2 2c 05	  ldx #$052c
$1c:e639  3e 09 30	  rol $3009,x
$1c:e63c  8b			phb
$1c:e63d  8b			phb
$1c:e63e  c5 26		 cmp $26
$1c:e640  09 a0 82	  ora #$82a0
$1c:e643  a7 c2		 lda [$c2]
$1c:e645  09 14 37	  ora #$3714
$1c:e648  86 19		 stx $19
$1c:e64a  48			pha
$1c:e64b  31 83		 and ($83),y
$1c:e64d  80 65		 bra $e6b4
$1c:e64f  c3 65		 cmp $65,s
$1c:e651  08			php
$1c:e652  83 e5		 sta $e5,s
$1c:e654  8e 60 4d	  stx $4d60
$1c:e657  02 98		 cop #$98
$1c:e659  62 0e 60	  per $466a
$1c:e65c  9a			txs
$1c:e65d  02 98		 cop #$98
$1c:e65f  62 54 82	  per $68b6
$1c:e662  93 08		 sta ($08,s),y
$1c:e664  c0 32 e2	  cpy #$e232
$1c:e667  01 a3		 ora ($a3,x)
$1c:e669  15 80		 ora $80,x
$1c:e66b  a0 03 82	  ldy #$8203
$1c:e66e  9a			txs
$1c:e66f  01 08		 ora ($08,x)
$1c:e671  0a			asl a
$1c:e672  84 fa		 sty $fa
$1c:e674  18			clc
$1c:e675  b1 81		 lda ($81),y
$1c:e677  1f 43 18 37   ora $371843,x
$1c:e67b  30 5f		 bmi $e6dc
$1c:e67d  88			dey
$1c:e67e  d4 38		 pei ($38)
$1c:e680  a2 a3 d4	  ldx #$d4a3
$1c:e683  0c 13 52	  tsb $5213
$1c:e686  37 f2		 and [$f2],y
$1c:e688  47 96		 eor [$96]
$1c:e68a  57 56		 eor [$56],y
$1c:e68c  61 4d		 adc ($4d,x)
$1c:e68e  64 0b		 stz $0b
$1c:e690  f9 ff 86	  sbc $86ff,y
$1c:e693  39 05 d8	  and $d805,y
$1c:e696  4d 30 4c	  eor $4c30
$1c:e699  8b			phb
$1c:e69a  40			rti
$1c:e69b  61 1a		 adc ($1a,x)
$1c:e69d  66 b9		 ror $b9
$1c:e69f  00 43		 brk #$43
$1c:e6a1  6c ca f6	  jmp ($f6ca)
$1c:e6a4  d8			cld
$1c:e6a5  e9 db e9	  sbc #$e9db
$1c:e6a8  b7 73		 lda [$73],y
$1c:e6aa  7b			tdc
$1c:e6ab  6c 78 ed	  jmp ($ed78)
$1c:e6ae  f4 eb 80	  pea $80eb
$1c:e6b1  bd b6 3e	  lda $3eb6,x
$1c:e6b4  76 fa		 ror $fa,x
$1c:e6b6  7d c3 de	  adc $dec3,x
$1c:e6b9  db			stp
$1c:e6ba  1f 43 7d 3f   ora $3f7d43,x
$1c:e6be  03 af		 ora $af,s
$1c:e6c0  6d 8f a5	  adc $a58f
$1c:e6c3  be 9f 94	  ldx $949f,y
$1c:e6c6  c8			iny
$1c:e6c7  b4 c9		 ldy $c9,x
$1c:e6c9  a2 90 13	  ldx #$1390
$1c:e6cc  f0 b4		 beq $e682
$1c:e6ce  07 d4		 ora [$d4]
$1c:e6d0  72 f2		 adc ($f2)
$1c:e6d2  e0 fb 10	  cpx #$10fb
$1c:e6d5  fe 5c 1f	  inc $1f5c,x
$1c:e6d8  72 73		 adc ($73)
$1c:e6da  cb			wai
$1c:e6db  83 c8		 sta $c8,s
$1c:e6dd  58			cli
$1c:e6de  f9 70 79	  sbc $7970,y
$1c:e6e1  4c 6f 2e	  jmp $2e6f
$1c:e6e4  0f 31 b7 e5   ora $e5b731
$1c:e6e8  c1 e7		 cmp ($e7,x)
$1c:e6ea  40			rti
$1c:e6eb  a1 30		 lda ($30,x)
$1c:e6ed  08			php
$1c:e6ee  c4 02		 cpy $02
$1c:e6f0  50 5c		 bvc $e74e
$1c:e6f2  39 84 00	  and $0084,y
$1c:e6f5  0c 10 18	  tsb $1810
$1c:e6f8  49 bc 23	  eor #$23bc
$1c:e6fb  1a			inc a
$1c:e6fc  48			pha
$1c:e6fd  24 06		 bit $06
$1c:e6ff  0b			phd
$1c:e700  0c 88 42	  tsb $4288
$1c:e703  3a			dec a
$1c:e704  81 a0		 sta ($a0,x)
$1c:e706  86 c1		 stx $c1
$1c:e708  03 c1		 ora $c1,s
$1c:e70a  d5 0d		 cmp $0d,x
$1c:e70c  10 20		 bpl $e72e
$1c:e70e  3c 82 12	  bit $1282,x
$1c:e711  04 07		 tsb $07
$1c:e713  94 34		 sty $34,x
$1c:e715  10 08		 bpl $e71f
$1c:e717  88			dey
$1c:e718  78			sei
$1c:e719  34 01		 bit $01,x
$1c:e71b  a0 88 97	  ldy #$9788
$1c:e71e  80 76		 bra $e796
$1c:e720  14 41		 trb $41
$1c:e722  b8			clv
$1c:e723  82 03 60	  brl $4729
$1c:e726  3d 22 40	  and $4022,x
$1c:e729  d1 00		 cmp ($00),y
$1c:e72b  de 17 f1	  dec $f117,x
$1c:e72e  47 8e		 eor [$8e]
$1c:e730  47 44		 eor [$44]
$1c:e732  3d 4d 11	  and $114d,x
$1c:e735  11 36		 ora ($36),y
$1c:e737  44 b4 d9	  mvp $d9,$b4
$1c:e73a  14 bc		 trb $bc
$1c:e73c  c7 e7		 cmp [$e7]
$1c:e73e  4f 1c 17 40   eor $40171c
$1c:e742  7a			ply
$1c:e743  9d 02 22	  sta $2202,x
$1c:e746  78			sei
$1c:e747  09 69 e0	  ora #$e069
$1c:e74a  4f fa c3 d8   eor $d8c3fa
$1c:e74e  3e 38 2e	  rol $2e38,x
$1c:e751  90 f5		 bcc $e748
$1c:e753  3a			dec a
$1c:e754  44 44 f1	  mvp $f1,$44
$1c:e757  12 d3		 ora ($d3)
$1c:e759  c5 44		 cmp $44
$1c:e75b  79 03 f4	  adc $f403,y
$1c:e75e  1f a0 3a 40   ora $403aa0,x
$1c:e762  f0 11		 beq $e775
$1c:e764  cf 89 04 1d   cmp $1d0489
$1c:e768  34 80		 bit $80,x
$1c:e76a  ac 24 65	  ldy $6524
$1c:e76d  e2 c0		 sep #$c0
$1c:e76f  80 03		 bra $e774
$1c:e771  04 00		 tsb $00
$1c:e773  0c fb bb	  tsb $bbfb
$1c:e776  fa			plx
$1c:e777  1d 38 00	  ora $0038,x
$1c:e77a  8d 08 04	  sta $0408
$1c:e77d  ff 79 cc 0e   sbc $0ecc79,x
$1c:e781  2c 12 0a	  bit $0a12
$1c:e784  55 9e		 eor $9e,x
$1c:e786  2d 67 0a	  and $0a67
$1c:e789  a0 3c 21	  ldy #$213c
$1c:e78c  71 e1		 adc ($e1),y
$1c:e78e  10 54		 bpl $e7e4
$1c:e790  ad f7 1b	  lda $1bf7
$1c:e793  78			sei
$1c:e794  94 23		 sty $23,x
$1c:e796  d6 ea		 dec $ea,x
$1c:e798  95 b8		 sta $b8,x
$1c:e79a  1e 10 f9	  asl $f910,x
$1c:e79d  44 a6 87	  mvp $87,$a6
$1c:e7a0  77 b8		 adc [$b8],y
$1c:e7a2  5c ae c3 50   jml $50c3ae
$1c:e7a6  ba			tsx
$1c:e7a7  5c 06 a0 2f   jml $2fa006
$1c:e7ab  19 4c a2	  ora $a24c,y
$1c:e7ae  8b			phb
$1c:e7af  7d bf 5d	  adc $5dbf,x
$1c:e7b2  6f 84 50 bf   adc $bf5084
$1c:e7b6  92 06		 sta ($06)
$1c:e7b8  71 0e		 adc ($0e),y
$1c:e7ba  18			clc
$1c:e7bb  88			dey
$1c:e7bc  c8			iny
$1c:e7bd  29 74 da	  and #$da74
$1c:e7c0  59 55 02	  eor $0255,y
$1c:e7c3  41 17		 eor ($17,x)
$1c:e7c5  29 89 8d	  and #$8d89
$1c:e7c8  3f a5 31 8f   and $8f31a5,x
$1c:e7cc  50 a3		 bvc $e771
$1c:e7ce  e6 36		 inc $36
$1c:e7d0  31 9d		 and ($9d),y
$1c:e7d2  82 95 4c	  brl $346a
$1c:e7d5  a7 5b		 lda [$5b]
$1c:e7d7  25 56		 and $56
$1c:e7d9  da			phx
$1c:e7da  72 04		 adc ($04)
$1c:e7dc  10 e9		 bpl $e7c7
$1c:e7de  42 a9		 wdm #$a9
$1c:e7e0  46 e6		 lsr $e6
$1c:e7e2  d3 0f		 cmp ($0f,s),y
$1c:e7e4  ac c6 6c	  ldy $6cc6
$1c:e7e7  96 09		 stx $09,y
$1c:e7e9  a2 58 52	  ldx #$5258
$1c:e7ec  c1 4a		 cmp ($4a,x)
$1c:e7ee  a2 c8 e7	  ldx #$e7c8
$1c:e7f1  d3 2f		 cmp ($2f,s),y
$1c:e7f3  ac ce 7c	  ldy $7cce
$1c:e7f6  a6 09		 ldx $09
$1c:e7f8  e2 98		 sep #$98
$1c:e7fa  54 c1 52	  mvn $52,$c1
$1c:e7fd  a1 4b		 lda ($4b,x)
$1c:e7ff  e0 2b		 cpx #$2b
$1c:e801  2a			rol a
$1c:e802  3f 84 be 04   and $04be84,x
$1c:e806  c2 a4		 rep #$a4
$1c:e808  78			sei
$1c:e809  2c 4a 5c	  bit $5c4a
$1c:e80c  b2 59		 lda ($59)
$1c:e80e  74 61		 stz $61,x
$1c:e810  3e 0c 1b	  rol $1b0c,x
$1c:e813  88			dey
$1c:e814  7d dd fb	  adc $fbdd,x
$1c:e817  38			sec
$1c:e818  9c 50 9f	  stz $9f50
$1c:e81b  e0 ff		 cpx #$ff
$1c:e81d  08			php
$1c:e81e  73 bd		 adc ($bd,s),y
$1c:e820  a2 d6		 ldx #$d6
$1c:e822  7a			ply
$1c:e823  51 7c		 eor ($7c),y
$1c:e825  22 d0 49 d3   jsl $d349d0
$1c:e829  bd a3 d6	  lda $d6a3,x
$1c:e82c  fa			plx
$1c:e82d  94 78		 sty $78,x
$1c:e82f  44 10 c0	  mvp $c0,$10
$1c:e832  b3 dd		 lda ($dd,s),y
$1c:e834  ae 17 7a	  ldx $7a17
$1c:e837  24 a6		 bit $a6
$1c:e839  c1 0d		 cmp ($0d,x)
$1c:e83b  0b			phd
$1c:e83c  3d ce f9	  and $f9ce,x
$1c:e83f  7d a3 4a	  adc $4aa3,x
$1c:e842  2d 03 58	  and $5803
$1c:e845  a6 d2		 ldx $d2
$1c:e847  cc 42 34	  cpy $3442
$1c:e84a  08			php
$1c:e84b  70 08		 bvs $e855
$1c:e84d  40			rti
$1c:e84e  25 0e		 and $0e
$1c:e850  39 1d a2	  and $a21d,y
$1c:e853  2a			rol a
$1c:e854  12 18		 ora ($18)
$1c:e856  b0 44		 bcs $e89c
$1c:e858  42 a0		 wdm #$a0
$1c:e85a  60			rts
$1c:e85b  29 4d ae	  and #$ae4d
$1c:e85e  3a			dec a
$1c:e85f  22 18 f0 84   jsl $84f018
$1c:e863  44 a1 4c	  mvp $4c,$a1
$1c:e866  a7 1f		 lda [$1f]
$1c:e868  e2 ac		 sep #$ac
$1c:e86a  44 19 a4	  mvp $a4,$19
$1c:e86d  d9 20 48	  cmp $4820,y
$1c:e870  f3 8e		 sbc ($8e,s),y
$1c:e872  51 8a		 eor ($8a),y
$1c:e874  83 3c		 sta $3c,s
$1c:e876  9f 28 09 3e   sta $3e0928,x
$1c:e87a  72 4a		 adc ($4a)
$1c:e87c  21 90		 and ($90,x)
$1c:e87e  5a			phy
$1c:e87f  ca			dex
$1c:e880  d6 18		 dec $18,x
$1c:e882  44 b6 8c	  mvp $8c,$b6
$1c:e885  74 17		 stz $17,x
$1c:e887  24 cb		 bit $cb
$1c:e889  46 40		 lsr $40
$1c:e88b  5f 08 4b 3d   eor $3d4b08,x
$1c:e88f  24 10		 bit $10
$1c:e891  19 72 e4	  ora $e472,y
$1c:e894  4b			phk
$1c:e895  e3 25		 sbc $25,s
$1c:e897  93 38		 sta ($38,s),y
$1c:e899  0e 4e c7	  asl $c74e
$1c:e89c  60			rts
$1c:e89d  bb			tyx
$1c:e89e  3c 64 ac	  bit $ac64,x
$1c:e8a1  c5 a3		 cmp $a3
$1c:e8a3  7d 0c e6	  adc $e60c,x
$1c:e8a6  06 68		 asl $68
$1c:e8a8  1b			tcs
$1c:e8a9  3c 5a ce	  bit $ce5a,x
$1c:e8ac  6a			ror a
$1c:e8ad  30 79		 bmi $e928
$1c:e8af  42 cf		 wdm #$cf
$1c:e8b1  03 6f		 ora $6f,s
$1c:e8b3  8f 5b cf 46   sta $46cf5b
$1c:e8b7  0f 28 79 7c   ora $7c7928
$1c:e8bb  28			plp
$1c:e8bc  77 7c		 adc [$7c],y
$1c:e8be  1d dd 96	  ora $96dd,x
$1c:e8c1  09 c0		 ora #$c0
$1c:e8c3  17 21		 ora [$21],y
$1c:e8c5  80 28		 bra $e8ef
$1c:e8c7  b7 3b		 lda [$3b],y
$1c:e8c9  a5 fd		 lda $fd
$1c:e8cb  b6 08		 ldx $08,y
$1c:e8cd  c1 17		 cmp ($17,x)
$1c:e8cf  ad 76 9b	  lda $9b76
$1c:e8d2  4b			phk
$1c:e8d3  a6 d7		 ldx $d7
$1c:e8d5  07 6b		 ora [$6b]
$1c:e8d7  7b			tdc
$1c:e8d8  bc 33 04	  ldy $0433,x
$1c:e8db  ca			dex
$1c:e8dc  76 8b		 ror $8b,x
$1c:e8de  cd ec 5e	  cmp $5eec
$1c:e8e1  a6 54		 ldx $54
$1c:e8e3  1e 43 30	  asl $3043,x
$1c:e8e6  3f a6 92 2e   and $2e92a6,x
$1c:e8ea  80 24		 bra $e910
$1c:e8ec  61 c7		 adc ($c7,x)
$1c:e8ee  3a			dec a
$1c:e8ef  0a			asl a
$1c:e8f0  80 6c		 bra $e95e
$1c:e8f2  22 e6 47 2e   jsl $2e47e6
$1c:e8f6  80 94		 bra $e88c
$1c:e8f8  04 81		 tsb $81
$1c:e8fa  1f 3a 49 d1   ora $d1493a,x
$1c:e8fe  8c ec c0	  sty $c0ec
$1c:e901  a5 df		 lda $df
$1c:e903  a3 06		 lda $06,s
$1c:e905  a5 42		 lda $42
$1c:e907  97 c2		 sta [$c2],y
$1c:e909  61 32		 adc ($32,x)
$1c:e90b  08			php
$1c:e90c  c3 c8		 cmp $c8,s
$1c:e90e  1e c3 20	  asl $20c3,x
$1c:e911  80 c0		 bra $e8d3
$1c:e913  61 16		 adc ($16,x)
$1c:e915  0a			asl a
$1c:e916  54 ae 4d	  mvn $4d,$ae
$1c:e919  26 93		 rol $93
$1c:e91b  c4 24		 cpy $24
$1c:e91d  a0 20		 ldy #$20
$1c:e91f  01 0c		 ora ($0c,x)
$1c:e921  0a			asl a
$1c:e922  05 10		 ora $10
$1c:e924  a1 54		 lda ($54,x)
$1c:e926  8a			txa
$1c:e927  e1 47		 sbc ($47,x)
$1c:e929  97 c2		 sta [$c2],y
$1c:e92b  25 b5		 and $b5
$1c:e92d  72 c0		 adc ($c0)
$1c:e92f  53 e5		 eor ($e5,s),y
$1c:e931  ef c1 a5 7e   sbc $7ea5c1
$1c:e935  ad 23 50	  lda $5023
$1c:e938  97 c4		 sta [$c4],y
$1c:e93a  25 a3		 and $a3
$1c:e93c  a0 22		 ldy #$22
$1c:e93e  84 bc		 sty $bc
$1c:e940  18			clc
$1c:e941  35 2b		 and $2b,x
$1c:e943  5e 04 52	  lsr $5204,x
$1c:e946  21 50		 and ($50,x)
$1c:e948  a3 7f		 lda $7f,s
$1c:e94a  44 42 fc	  mvp $fc,$42
$1c:e94d  1a			inc a
$1c:e94e  9d 3a 99	  sta $993a,x
$1c:e951  4e ac 89	  lsr $89ac
$1c:e954  26 85		 rol $85
$1c:e956  1b			tcs
$1c:e957  9b			txy
$1c:e958  4d 26 d3	  eor $d326
$1c:e95b  71 a8		 adc ($a8),y
$1c:e95d  a1 40		 lda ($40,x)
$1c:e95f  74 74		 stz $74,x
$1c:e961  a9 1c		 lda #$1c
$1c:e963  fa			plx
$1c:e964  79 3e 9f	  adc $9f3e,y
$1c:e967  89 5e		 bit #$5e
$1c:e969  45 52		 eor $52
$1c:e96b  0d 8b f0	  ora $f08b
$1c:e96e  4a			lsr a
$1c:e96f  cd 01 11	  cmp $1101
$1c:e972  84 0a		 sty $0a
$1c:e974  5c 0c 11 32   jml $32110c
$1c:e978  a0 80		 ldy #$80
$1c:e97a  54 0f 62	  mvn $62,$0f
$1c:e97d  85 1d		 sta $1d
$1c:e97f  9f 0e 01 10   sta $10010e,x
$1c:e983  38			sec
$1c:e984  cb			wai
$1c:e985  04 eb		 tsb $eb
$1c:e987  02 83		 cop #$83
$1c:e989  86 01		 stx $01
$1c:e98b  60			rts
$1c:e98c  75 e3		 adc $e3,x
$1c:e98e  c2 c3		 rep #$c3
$1c:e990  ec 56 16	  cpx $1656
$1c:e993  02 5a		 cop #$5a
$1c:e995  95 29		 sta $29,x
$1c:e997  13 83		 ora ($83,s),y
$1c:e999  34 02		 bit $02,x
$1c:e99b  f4 d0 18	  pea $18d0
$1c:e99e  34 1c		 bit $1c,x
$1c:e9a0  f2 93		 sbc ($93)
$1c:e9a2  b6 f8		 ldx $f8,y
$1c:e9a4  de db e3	  dec $e3db,x
$1c:e9a7  0e 87 aa	  asl $aa87
$1c:e9aa  50 2c		 bvc $e9d8
$1c:e9ac  41 85		 eor ($85,x)
$1c:e9ae  2b			pld
$1c:e9af  0d 56 98	  ora $9856
$1c:e9b2  26 21		 rol $21
$1c:e9b4  42 89		 wdm #$89
$1c:e9b6  86 87		 stx $87
$1c:e9b8  1b			tcs
$1c:e9b9  2b			pld
$1c:e9ba  11 61		 ora ($61),y
$1c:e9bc  4a			lsr a
$1c:e9bd  c3 45		 cmp $45,s
$1c:e9bf  91 bf		 sta ($bf),y
$1c:e9c1  df fa 09 39   cmp $3909fa,x
$1c:e9c5  78			sei
$1c:e9c6  3f 45 c1 58   and $58c145,x
$1c:e9ca  a7 53		 lda [$53]
$1c:e9cc  08			php
$1c:e9cd  21 5a		 and ($5a,x)
$1c:e9cf  03 34		 ora $34,s
$1c:e9d1  be 6b 36	  ldx $366b,y
$1c:e9d4  9a			txs
$1c:e9d5  4d 8a 03	  eor $038a
$1c:e9d8  37 1b		 and [$1b],y
$1c:e9da  b4 f6		 ldy $f6,x
$1c:e9dc  7d 3c 9f	  adc $9f3c,x
$1c:e9df  18			clc
$1c:e9e0  06 7e		 asl $7e
$1c:e9e2  47 64		 eor [$64]
$1c:e9e4  e0 9b		 cpx #$9b
$1c:e9e6  d4 72		 pei ($72)
$1c:e9e8  8a			txa
$1c:e9e9  c1 3f		 cmp ($3f,x)
$1c:e9eb  a4 b8		 ldy $b8
$1c:e9ed  52 91		 eor ($91)
$1c:e9ef  88			dey
$1c:e9f0  4a			lsr a
$1c:e9f1  41 a1		 eor ($a1,x)
$1c:e9f3  43 a3		 eor $a3,s
$1c:e9f5  88			dey
$1c:e9f6  49 64		 eor #$64
$1c:e9f8  ca			dex
$1c:e9f9  16 96		 asl $96,x
$1c:e9fb  0a			asl a
$1c:e9fc  c9 f2		 cmp #$f2
$1c:e9fe  0f 03 59 1d   ora $1d5903
$1c:ea02  79 38 4f	  adc $4f38,y
$1c:ea05  f0 7e		 beq $ea85
$1c:ea07  81 04		 sta ($04,x)
$1c:ea09  98			tya
$1c:ea0a  87 59		 sta [$59]
$1c:ea0c  57 0d		 eor [$0d],y
$1c:ea0e  18			clc
$1c:ea0f  1a			inc a
$1c:ea10  05 22		 ora $22
$1c:ea12  6a			ror a
$1c:ea13  24 dc		 bit $dc
$1c:ea15  52 21		 eor ($21)
$1c:ea17  d0 31		 bne $ea4a
$1c:ea19  13 91		 ora ($91,s),y
$1c:ea1b  27 ec		 and [$ec]
$1c:ea1d  46 b2		 lsr $b2
$1c:ea1f  d6 ec		 dec $ec,x
$1c:ea21  d4 ca		 pei ($ca)
$1c:ea23  a5 82		 lda $82
$1c:ea25  1b			tcs
$1c:ea26  3a			dec a
$1c:ea27  6a			ror a
$1c:ea28  34 c3		 bit $c3,x
$1c:ea2a  eb			xba
$1c:ea2b  31 8e		 and ($8e),y
$1c:ea2d  51 2d		 eor ($2d),y
$1c:ea2f  0f d0 72 34   ora $3472d0
$1c:ea33  cb			wai
$1c:ea34  eb			xba
$1c:ea35  33 92		 and ($92,s),y
$1c:ea37  51 9f		 eor ($9f),y
$1c:ea39  83 19		 sta $19,s
$1c:ea3b  88			dey
$1c:ea3c  88			dey
$1c:ea3d  0e 42 47	  asl $4742
$1c:ea40  3b			tsc
$1c:ea41  45 e6		 eor $e6
$1c:ea43  f7 08		 sbc [$08],y
$1c:ea45  50 24		 bvc $ea6b
$1c:ea47  9c ae 6f	  stz $6fae
$1c:ea4a  c1 44		 cmp ($44,x)
$1c:ea4c  85 7d		 sta $7d
$1c:ea4e  6e 34 f3	  ror $f334
$1c:ea51  f0 8a		 beq $e9dd
$1c:ea53  49 fa		 eor #$fa
$1c:ea55  07 92		 ora [$92]
$1c:ea57  94 9f		 sty $9f,x
$1c:ea59  06 03		 asl $03
$1c:ea5b  2e 1c b2	  rol $b21c
$1c:ea5e  2c 0a 40	  bit $400a
$1c:ea61  8d 01 00	  sta $0001
$1c:ea64  44 89 55	  mvp $55,$89
$1c:ea67  2b			pld
$1c:ea68  53 91		 eor ($91,s),y
$1c:ea6a  6e 2b ab	  ror $ab2b
$1c:ea6d  33 ae		 and ($ae,s),y
$1c:ea6f  0b			phd
$1c:ea70  08			php
$1c:ea71  a0 69		 ldy #$69
$1c:ea73  35 2e		 and $2e,x
$1c:ea75  3a			dec a
$1c:ea76  49 49		 eor #$49
$1c:ea78  8e 95 f5	  stx $f595
$1c:ea7b  37 94		 and [$94],y
$1c:ea7d  c3 fa		 cmp $fa,s
$1c:ea7f  ba			tsx
$1c:ea80  f5 58		 sbc $58,x
$1c:ea82  c3 be		 cmp $be,s
$1c:ea84  ee f5 9c	  inc $9cf5
$1c:ea87  c3 cc		 cmp $cc,s
$1c:ea89  82 37 08	  brl $f2c3
$1c:ea8c  0b			phd
$1c:ea8d  bd af 77	  lda $77af,x
$1c:ea90  82 a0 c0	  brl $ab33
$1c:ea93  a5 d0		 lda $d0
$1c:ea95  27 7f		 and [$7f]
$1c:ea97  4e 03 e1	  lsr $e103
$1c:ea9a  b2 f9		 lda ($f9)
$1c:ea9c  ec 83 e1	  cpx $e183
$1c:ea9f  0e 87 82	  asl $8287
$1c:eaa2  48			pha
$1c:eaa3  8e 11 61	  stx $6111
$1c:eaa6  78			sei
$1c:eaa7  fd 85 e5	  sbc $e585,x
$1c:eaaa  17 7c		 ora [$7c],y
$1c:eaac  a5 0a		 lda $0a
$1c:eaae  3c 40 0f	  bit $0f40,x
$1c:eab1  b1 00		 lda ($00),y
$1c:eab3  63 d1		 adc $d1,s
$1c:eab5  f1 4a		 sbc ($4a),y
$1c:eab7  52 96		 eor ($96)
$1c:eab9  50 3a		 bvc $eaf5
$1c:eabb  46 14		 lsr $14
$1c:eabd  12 bc		 ora ($bc)
$1c:eabf  76 55		 ror $55,x
$1c:eac1  2a			rol a
$1c:eac2  75 32		 adc $32,x
$1c:eac4  cb			wai
$1c:eac5  5b			tcd
$1c:eac6  b3 53		 lda ($53,s),y
$1c:eac8  10 00		 bpl $eaca
$1c:eaca  80 0a		 bra $ead6
$1c:eacc  d0 2c		 bne $eafa
$1c:eace  a8			tay
$1c:eacf  b1 b9		 lda ($b9),y
$1c:ead1  b4 c3		 ldy $c3,x
$1c:ead3  eb			xba
$1c:ead4  31 9b		 and ($9b),y
$1c:ead6  4d 26 c9	  eor $c926
$1c:ead9  51 9b		 eor ($9b),y
$1c:eadb  87 06		 sta [$06]
$1c:eadd  87 23		 sta [$23]
$1c:eadf  9f 4c be b3   sta $b3be4c,x
$1c:eae3  39 f4 f2	  and $f2f4,y
$1c:eae6  7c a5 19	  jmp ($19a5,x)
$1c:eae9  f8			sed
$1c:eaea  b0 41		 bcs $eb2d
$1c:eaec  40			rti
$1c:eaed  1c 15 8c	  trb $8c15
$1c:eaf0  8e 82 22	  stx $2282
$1c:eaf3  c1 89		 cmp ($89,x)
$1c:eaf5  0a			asl a
$1c:eaf6  b4 65		 ldy $65,x
$1c:eaf8  72 66		 adc ($66)
$1c:eafa  8c 49 e8	  sty $e849
$1c:eafd  34 1a		 bit $1a,x
$1c:eaff  ed 36 96	  sbc $9636
$1c:eb02  e0 7a		 cpx #$7a
$1c:eb04  7c be 93	  jmp ($93be,x)
$1c:eb07  49 84		 eor #$84
$1c:eb09  4b			phk
$1c:eb0a  68			pla
$1c:eb0b  c3 a3		 cmp $a3,s
$1c:eb0d  58			cli
$1c:eb0e  b4 42		 ldy $42,x
$1c:eb10  5b			tcd
$1c:eb11  44 35 18	  mvp $18,$35
$1c:eb14  11 9d		 ora ($9d),y
$1c:eb16  fe 00 f0	  inc $f000,x
$1c:eb19  89 ff		 bit #$ff
$1c:eb1b  43 83		 eor $83,s
$1c:eb1d  2e 0d f8	  rol $f80d
$1c:eb20  33 c7		 and ($c7,s),y
$1c:eb22  be 4e 48	  ldx $484e,y
$1c:eb25  49 d2		 eor #$d2
$1c:eb27  0b			phd
$1c:eb28  e4 d0		 cpx $d0
$1c:eb2a  a2 78		 ldx #$78
$1c:eb2c  b7 ea		 lda [$ea],y
$1c:eb2e  96 5f		 stx $5f,y
$1c:eb30  19 4c a1	  ora $a14c,y
$1c:eb33  45 24		 eor $24
$1c:eb35  f1 51		 sbc ($51),y
$1c:eb37  a5 8e		 lda $8e
$1c:eb39  c5 61		 cmp $61
$1c:eb3b  5c 92 7d ed   jml $ed7d92
$1c:eb3f  10 58		 bpl $eb99
$1c:eb41  34 1a		 bit $1a,x
$1c:eb43  f4 ca 0a	  pea $0aca
$1c:eb46  0c b6 84	  tsb $84b6
$1c:eb49  d1 58		 cmp ($58),y
$1c:eb4b  6c 3a 77	  jmp ($773a)
$1c:eb4e  7b			tdc
$1c:eb4f  9d ce e9	  sta $e9ce,x
$1c:eb52  32 da		 and ($da)
$1c:eb54  53 85		 eor ($85,s),y
$1c:eb56  61 b3		 adc ($b3,x)
$1c:eb58  af bb ac 55   lda $55acbb
$1c:eb5c  ee a3 2b	  inc $2ba3
$1c:eb5f  04 56		 tsb $56
$1c:eb61  2c 9f 3a	  bit $3a9f
$1c:eb64  ad 32 9c	  lda $9c32
$1c:eb67  05 3b		 ora $3b
$1c:eb69  24 76		 bit $76
$1c:eb6b  3c af 3a	  bit $3aaf,x
$1c:eb6e  1c 6e 6d	  trb $6d6e
$1c:eb71  34 9b		 bit $9b,x
$1c:eb73  06 00		 asl $00
$1c:eb75  2e 11 ca	  rol $ca11
$1c:eb78  22 7c e8 b2   jsl $b2e87c
$1c:eb7c  39 f4 f2	  and $f2f4,y
$1c:eb7f  7c 28 01	  jmp ($0128,x)
$1c:eb82  38			sec
$1c:eb83  49 28		 eor #$28
$1c:eb85  c0 f4		 cpy #$f4
$1c:eb87  29 a9		 and #$a9
$1c:eb89  3c 03 ca	  bit $ca03,x
$1c:eb8c  63 52		 adc $52,s
$1c:eb8e  f8			sed
$1c:eb8f  0b			phd
$1c:eb90  bc 7f d0	  ldy $d07f,x
$1c:eb93  a2 83		 ldx #$83
$1c:eb95  cb			wai
$1c:eb96  8b			phb
$1c:eb97  47 26		 eor [$26]
$1c:eb99  96 10		 stx $10,y
$1c:eb9b  72 9b		 adc ($9b)
$1c:eb9d  4b			phk
$1c:eb9e  af 14 ad 64   lda $64ad14
$1c:eba2  64 41		 stz $41
$1c:eba4  8c c4 62	  sty $62c4
$1c:eba7  32 18		 and ($18)
$1c:eba9  cc 48 a0	  cpy $a048
$1c:ebac  16 2b		 asl $2b,x
$1c:ebae  0d 8a d2	  ora $d28a
$1c:ebb1  53 28		 eor ($28,s),y
$1c:ebb3  44 96 4d	  mvp $4d,$96
$1c:ebb6  27 f8		 and [$f8]
$1c:ebb8  49 50		 eor #$50
$1c:ebba  01 7a		 ora ($7a,x)
$1c:ebbc  83 41		 sta $41,s
$1c:ebbe  a0 f2		 ldy #$f2
$1c:ebc0  8a			txa
$1c:ebc1  14 be		 trb $be
$1c:ebc3  22 ac 0a 0c   jsl $0c0aac
$1c:ebc7  bf ee c8 0a   lda $0ac8ee,x
$1c:ebcb  35 ee		 and $ee,x
$1c:ebcd  77 0e		 adc [$0e],y
$1c:ebcf  87 d0		 sta [$d0]
$1c:ebd1  a9 52		 lda #$52
$1c:ebd3  b9 31 fc	  lda $fc31,y
$1c:ebd6  28			plp
$1c:ebd7  2d 50 6c	  and $6c50
$1c:ebda  05 13		 ora $13
$1c:ebdc  ef f7 9c c3   sbc $c39cf7
$1c:ebe0  e9 55		 sbc #$55
$1c:ebe2  2a			rol a
$1c:ebe3  5a			phy
$1c:ebe4  3c 28 f4	  bit $f428,x
$1c:ebe7  17 49		 ora [$49],y
$1c:ebe9  51 a4		 eor ($a4),y
$1c:ebeb  5f b8 03 c6   eor $c603b8,x
$1c:ebef  ed 0f 0d	  sbc $0d0f
$1c:ebf2  07 78		 ora [$78]
$1c:ebf4  7f c6 1e 41   adc $411ec6,x
$1c:ebf8  f2 97		 sbc ($97)
$1c:ebfa  98			tya
$1c:ebfb  fc e9 e8	  jsr ($e8e9,x)
$1c:ebfe  5f 4b 7a 9f   eor $9f7a4b,x
$1c:ec02  d7 1e		 cmp [$1e],y
$1c:ec04  c9 f6		 cmp #$f6
$1c:ec06  d7 ba		 cmp [$ba],y
$1c:ec08  fd dc 11	  sbc $11dc,x
$1c:ec0b  09 6d		 ora #$6d
$1c:ec0d  62 b5 2f	  per $1bc5
$1c:ec10  77 4c		 adc [$4c],y
$1c:ec12  22 6b 36 9b   jsl $9b366b
$1c:ec16  4d dd d3	  eor $d3dd
$1c:ec19  22 9e cf a7   jsl $a7cf9e
$1c:ec1d  d3 f7		 cmp ($f7,s),y
$1c:ec1f  74 c6		 stz $c6,x
$1c:ec21  21 23		 and ($23,x)
$1c:ec23  00 90		 brk #$90
$1c:ec25  3d 2a 4b	  and $4b2a,x
$1c:ec28  26 93		 rol $93
$1c:ec2a  49 c0		 eor #$c0
$1c:ec2c  95 2d		 sta $2d,x
$1c:ec2e  ab			plb
$1c:ec2f  d3 c0		 cmp ($c0,s),y
$1c:ec31  74 5e		 stz $5e,x
$1c:ec33  f3 7f		 sbc ($7f,s),y
$1c:ec35  a0 3d		 ldy #$3d
$1c:ec37  23 ea		 and $ea,s
$1c:ec39  2f 59 fb 13   and $13fb59
$1c:ec3d  da			phx
$1c:ec3e  be de 69	  ldx $69de,y
$1c:ec41  7c 46 43	  jmp ($4346,x)
$1c:ec44  10 96		 bpl $ebdc
$1c:ec46  d1 1d		 cmp ($1d),y
$1c:ec48  cc de 09	  cpy $09de
$1c:ec4b  59 08 09	  eor $0908,y
$1c:ec4e  e1 46		 sbc ($46,x)
$1c:ec50  7f 33 78 29   adc $297833,x
$1c:ec54  a5 20		 lda $20
$1c:ec56  79 10 3d	  adc $3d10,y
$1c:ec59  5b			tcd
$1c:ec5a  c1 53		 cmp ($53,x)
$1c:ec5c  ad 4b c0	  lda $c04b
$1c:ec5f  45 28		 eor $28
$1c:ec61  a2 88		 ldx #$88
$1c:ec63  4d bc 14	  eor $14bc
$1c:ec66  58			cli
$1c:ec67  dc dd e4	  jml [$e4dd]
$1c:ec6a  55 5a		 eor $5a,x
$1c:ec6c  c8			iny
$1c:ec6d  61 68		 adc ($68,x)
$1c:ec6f  72 39		 adc ($39)
$1c:ec71  f8			sed
$1c:ec72  08			php
$1c:ec73  a8			tay
$1c:ec74  63 00		 adc $00,s
$1c:ec76  14 ac		 trb $ac
$1c:ec78  be 04 f2	  ldx $f204,y
$1c:ec7b  2a			rol a
$1c:ec7c  29 00		 and #$00
$1c:ec7e  07 2b		 ora [$2b]
$1c:ec80  2f 90 7f c8   and $c87f90
$1c:ec84  64 60		 stz $60
$1c:ec86  41 68		 eor ($68,x)
$1c:ec88  ca			dex
$1c:ec89  e4 e5		 cpx $e5
$1c:ec8b  23 38		 and $38,s
$1c:ec8d  23 78		 and $78,s
$1c:ec8f  2b			pld
$1c:ec90  b4 71		 ldy $71,x
$1c:ec92  09 9f		 ora #$9f
$1c:ec94  d5 bc		 cmp $bc,x
$1c:ec96  14 e1		 trb $e1
$1c:ec98  b9 56 11	  lda $1156,y
$1c:ec9b  cc de 09	  cpy $09de
$1c:ec9e  b4 d0		 ldy $d0,x
$1c:eca0  90 13		 bcc $ecb5
$1c:eca2  59 a2 79	  eor $79a2,y
$1c:eca5  9b			txy
$1c:eca6  c1 3e		 cmp ($3e,x)
$1c:eca8  9e 4f e4	  stz $e44f,x
$1c:ecab  53 d9		 eor ($d9,s),y
$1c:ecad  e2 b9		 sep #$b9
$1c:ecaf  97 9e		 sta [$9e],y
$1c:ecb1  cd f6 f7	  cmp $f7f6
$1c:ecb4  00 03		 brk #$03
$1c:ecb6  04 00		 tsb $00
$1c:ecb8  0c fb 7d	  tsb $7dfb
$1c:ecbb  b5 7a		 lda $7a,x
$1c:ecbd  bf b5 b6 db   lda $dbb6b5,x
$1c:ecc1  f6 d0		 inc $d0,x
$1c:ecc3  ee 38 7b	  inc $7b38
$1c:ecc6  9d 03 c0	  sta $c003,x
$1c:ecc9  a1 34		 lda ($34,x)
$1c:eccb  5a			phy
$1c:eccc  2e c2 dd	  rol $ddc2
$1c:eccf  6e d1 67	  ror $67d1
$1c:ecd2  37 55		 and [$55],y
$1c:ecd4  bd de 6f	  lda $6fde,x
$1c:ecd7  60			rts
$1c:ecd8  01 0f		 ora ($0f,x)
$1c:ecda  b4 28		 ldy $28,x
$1c:ecdc  02 36		 cop #$36
$1c:ecde  fb			xce
$1c:ecdf  7e 8b 49	  ror $498b,x
$1c:ece2  c0 e3		 cpy #$e3
$1c:ece4  f0 74		 beq $ed5a
$1c:ece6  60			rts
$1c:ece7  c1 d4		 cmp ($d4,x)
$1c:ece9  6b			rtl
$1c:ecea  f9 02 1b	  sbc $1b02,y
$1c:eced  fb			xce
$1c:ecee  6c 84 21	  jmp ($2184)
$1c:ecf1  ac e6 8d	  ldy $8de6
$1c:ecf4  20 3e 5c	  jsr $5c3e
$1c:ecf7  ff 79 11 ff   sbc $ff1179,x
$1c:ecfb  af 60 20 df   lda $df2060
$1c:ecff  bc 0c 04	  ldy $040c,x
$1c:ed02  13 d6		 ora ($d6,s),y
$1c:ed04  73 0c		 adc ($0c,s),y
$1c:ed06  e5 ac		 sbc $ac
$1c:ed08  2e 8e 93	  rol $938e
$1c:ed0b  b8			clv
$1c:ed0c  42 2e		 wdm #$2e
$1c:ed0e  77 57		 adc [$57],y
$1c:ed10  95 ca		 sta $ca,x
$1c:ed12  38			sec
$1c:ed13  9b			txy
$1c:ed14  e0 4e		 cpx #$4e
$1c:ed16  47 c9		 eor [$c9]
$1c:ed18  dc 71 90	  jml [$9071]
$1c:ed1b  26 08		 rol $08
$1c:ed1d  0d fa 09	  ora $09fa
$1c:ed20  37 d5		 and [$d5],y
$1c:ed22  bc 3e 57	  ldy $573e,x
$1c:ed25  29 e5		 and #$e5
$1c:ed27  f2 f0		 sbc ($f0)
$1c:ed29  38			sec
$1c:ed2a  5c 13 91 f5   jml $f59113
$1c:ed2e  03 02		 ora $02,s
$1c:ed30  42 2c		 wdm #$2c
$1c:ed32  ce 68 82	  dec $8268
$1c:ed35  7c e1 09	  jmp ($09e1,x)
$1c:ed38  90 c4		 bcc $ecfe
$1c:ed3a  5e 46 32	  lsr $3246,x
$1c:ed3d  1a			inc a
$1c:ed3e  19 b0 47	  ora $47b0,y
$1c:ed41  fa			plx
$1c:ed42  be 02 86	  ldx $8602,y
$1c:ed45  b7 c0		 lda [$c0],y
$1c:ed47  fe 3a 0f	  inc $0f3a,x
$1c:ed4a  b5 b6		 lda $b6,x
$1c:ed4c  da			phx
$1c:ed4d  ef 52 f8 23   sbc $23f852
$1c:ed51  c3 77		 cmp $77,s
$1c:ed53  9b			txy
$1c:ed54  d8			cld
$1c:ed55  5b			tcd
$1c:ed56  ad cf f5	  lda $f5cf
$1c:ed59  37 87		 and [$87],y
$1c:ed5b  03 09		 ora $09,s
$1c:ed5d  c1 d1		 cmp ($d1,x)
$1c:ed5f  ec 2d f6	  cpx $f62d
$1c:ed62  f0 7a		 beq $edde
$1c:ed64  ad c7 2a	  lda $2ac7
$1c:ed67  b7 30		 lda [$30],y
$1c:ed69  fa			plx
$1c:ed6a  eb			xba
$1c:ed6b  04 07		 tsb $07
$1c:ed6d  d5 ac		 cmp $ac,x
$1c:ed6f  56 03		 lsr $03,x
$1c:ed71  e9 ac		 sbc #$ac
$1c:ed73  5b			tcd
$1c:ed74  08			php
$1c:ed75  88			dey
$1c:ed76  79 23 66	  adc $6623,y
$1c:ed79  e7 8f		 sbc [$8f]
$1c:ed7b  cc 6a 15	  cpy $156a
$1c:ed7e  aa			tax
$1c:ed7f  d0 dc		 bne $ed5d
$1c:ed81  49 6e		 eor #$6e
$1c:ed83  45 03		 eor $03
$1c:ed85  19 12 93	  ora $9312,y
$1c:ed88  ab			plb
$1c:ed89  ca			dex
$1c:ed8a  cb			wai
$1c:ed8b  f7 3a		 sbc [$3a],y
$1c:ed8d  95 ae		 sta $ae,x
$1c:ed8f  41 d0		 eor ($d0,x)
$1c:ed91  4e 22 4d	  lsr $4d22
$1c:ed94  1e 4e e3	  asl $e34e,x
$1c:ed97  0b			phd
$1c:ed98  b9 5b 9a	  lda $9a5b,y
$1c:ed9b  00 f9		 brk #$f9
$1c:ed9d  f9 3c b6	  sbc $b63c,y
$1c:eda0  1a			inc a
$1c:eda1  b7 bf		 lda [$bf],y
$1c:eda3  42 26		 wdm #$26
$1c:eda5  f9 24 26	  sbc $2624,y
$1c:eda8  e0 ea		 cpx #$ea
$1c:edaa  06 85		 asl $85
$1c:edac  6e 6a 03	  ror $036a
$1c:edaf  27 20		 and [$20]
$1c:edb1  92 39		 sta ($39)
$1c:edb3  fa			plx
$1c:edb4  ce 6f 37	  dec $376f
$1c:edb7  24 c0		 bit $c0
$1c:edb9  06 1a		 asl $1a
$1c:edbb  30 87		 bmi $ed44
$1c:edbd  58			cli
$1c:edbe  e5 1f		 sbc $1f
$1c:edc0  2b			pld
$1c:edc1  95 9a		 sta $9a,x
$1c:edc3  4a			lsr a
$1c:edc4  d2 bd		 cmp ($bd)
$1c:edc6  5e af ed	  lsr $edaf,x
$1c:edc9  a1 dc		 lda ($dc,x)
$1c:edcb  70 f7		 bvs $edc4
$1c:edcd  3a			dec a
$1c:edce  0f b5 b6 db   ora $dbb6b5
$1c:edd2  f6 77		 inc $77,x
$1c:edd4  8f da 8b 45   sta $458bda
$1c:edd8  d1 67		 cmp ($67),y
$1c:edda  37 55		 and [$55],y
$1c:eddc  bd de 6f	  lda $6fde,x
$1c:eddf  61 6e		 adc ($6e,x)
$1c:ede1  b7 6c		 lda [$6c],y
$1c:ede3  1f e1 9d 7f   ora $7f9de1,x
$1c:ede7  16 91		 asl $91,x
$1c:ede9  54 3a 3d	  mvn $3d,$3a
$1c:edec  85 be		 sta $be
$1c:edee  df b0 7f 86   cmp $867fb0,x
$1c:edf2  97 ec		 sta [$ec],y
$1c:edf4  b6 64		 ldx $64,y
$1c:edf6  a2 6b		 ldx #$6b
$1c:edf8  b5 2c		 lda $2c,x
$1c:edfa  66 61		 ror $61
$1c:edfc  8e b0 c6	  stx $c6b0
$1c:edff  1b			tcs
$1c:ee00  3f b3 5a 55   and $555ab3,x
$1c:ee04  e0 2c		 cpx #$2c
$1c:ee06  1f eb 5d ff   ora $ff5deb,x
$1c:ee0a  a4 a1		 ldy $a1
$1c:ee0c  7b			tdc
$1c:ee0d  03 4c		 ora $4c,s
$1c:ee0f  35 9c		 and $9c,x
$1c:ee11  ce 66 44	  dec $4466
$1c:ee14  c4 0c		 cpy $0c
$1c:ee16  e1 25		 sbc ($25,x)
$1c:ee18  0e 6f 44	  asl $446f
$1c:ee1b  48			pha
$1c:ee1c  1e af 2b	  asl $2baf,x
$1c:ee1f  2f dc 4e 81   and $814edc
$1c:ee23  bc b9 7a	  ldy $7ab9,x
$1c:ee26  33 71		 and ($71,s),y
$1c:ee28  72 77		 adc ($77)
$1c:ee2a  18			clc
$1c:ee2b  5d c9 d8	  eor $d8c9,x
$1c:ee2e  d0 40		 bne $ee70
$1c:ee30  f4 03 f9	  pea $f903
$1c:ee33  6f ab 78 7c   adc $7c78ab
$1c:ee37  ae 53 cb	  ldx $cb53
$1c:ee3a  e5 c9		 sbc $c9
$1c:ee3c  e5 b0		 sbc $b0
$1c:ee3e  c0 40		 cpy #$40
$1c:ee40  24 0f		 bit $0f
$1c:ee42  53 81		 eor ($81,s),y
$1c:ee44  c7 e0		 cmp [$e0]
$1c:ee46  9d 8d 44	  sta $448d,x
$1c:ee49  1c 2e 09	  trb $092e
$1c:ee4c  20 84 e4	  jsr $e484
$1c:ee4f  77 21		 adc [$21],y
$1c:ee51  d8			cld
$1c:ee52  66 33		 ror $33
$1c:ee54  25 f1		 and $f1
$1c:ee56  1a			inc a
$1c:ee57  a1 20		 lda ($20,x)
$1c:ee59  c7 aa		 cmp [$aa]
$1c:ee5b  d2 42		 cmp ($42)
$1c:ee5d  51 b3		 eor ($b3),y
$1c:ee5f  f0 ba		 beq $ee1b
$1c:ee61  00 10		 brk #$10
$1c:ee63  13 81		 ora ($81,s),y
$1c:ee65  84 5e		 sty $5e
$1c:ee67  88			dey
$1c:ee68  67 10		 adc [$10]
$1c:ee6a  88			dey
$1c:ee6b  1d 40 4e	  ora $4e40,x
$1c:ee6e  47 20		 eor [$20]
$1c:ee70  e5 1d		 sbc $1d
$1c:ee72  4d 18 22	  eor $2218
$1c:ee75  74 dc		 stz $dc,x
$1c:ee77  71 90		 adc ($90),y
$1c:ee79  a7 ba		 lda [$ba]
$1c:ee7b  4a			lsr a
$1c:ee7c  08			php
$1c:ee7d  88			dey
$1c:ee7e  93 62		 sta ($62,s),y
$1c:ee80  95 35		 sta $35,x
$1c:ee82  60			rts
$1c:ee83  80 8d		 bra $ee12
$1c:ee85  44 d9 9c	  mvp $9c,$d9
$1c:ee88  d0 08		 bne $ee92
$1c:ee8a  c8			iny
$1c:ee8b  28			plp
$1c:ee8c  77 1f		 adc [$1f],y
$1c:ee8e  b6 c8		 ldx $c8,y
$1c:ee90  0c 15 82	  tsb $8215
$1c:ee93  89 2c		 bit #$2c
$1c:ee95  d7 51		 cmp [$51],y
$1c:ee97  af 6d 85 63   lda $63856d
$1c:ee9b  fa			plx
$1c:ee9c  62 02 3b	  per $29a1
$1c:ee9f  e8			inx
$1c:eea0  46 c1		 lsr $c1
$1c:eea2  5a			phy
$1c:eea3  1b			tcs
$1c:eea4  05 65		 ora $65
$1c:eea6  64 ce		 stz $ce
$1c:eea8  f2 21		 sbc ($21)
$1c:eeaa  d3 ff		 cmp ($ff,s),y
$1c:eeac  c2 1e		 rep #$1e
$1c:eeae  21 a1		 and ($a1,x)
$1c:eeb0  10 0b		 bpl $eebd
$1c:eeb2  e3 08		 sbc $08,s
$1c:eeb4  3a			dec a
$1c:eeb5  dc a9 29	  jml [$29a9]
$1c:eeb8  b9 1a ce	  lda $ce1a,y
$1c:eebb  6b			rtl
$1c:eebc  90 b2		 bcc $ee70
$1c:eebe  4e 40 d6	  lsr $d640
$1c:eec1  07 43		 ora [$43]
$1c:eec3  59 cc e6	  eor $e6cc,y
$1c:eec6  64 5e		 stz $5e
$1c:eec8  00 ec		 brk #$ec
$1c:eeca  8e 72 5c	  stx $5c72
$1c:eecd  32 e9		 and ($e9)
$1c:eecf  a3 7f		 lda $7f,s
$1c:eed1  af 39 4e 18   lda $184e39
$1c:eed5  55 51		 eor $51,x
$1c:eed7  83 d7		 sta $d7,s
$1c:eed9  26 b7		 rol $b7
$1c:eedb  1d f8 51	  ora $51f8,x
$1c:eede  37 cb		 and [$cb],y
$1c:eee0  92 e7		 sta ($e7)
$1c:eee2  31 d8		 and ($d8),y
$1c:eee4  5e bc e6	  lsr $e6bc,x
$1c:eee7  bb			tyx
$1c:eee8  0f d5 c6 2e   ora $2ec6d5
$1c:eeec  95 73		 sta $73,x
$1c:eeee  b7 bf		 lda [$bf],y
$1c:eef0  ca			dex
$1c:eef1  5f 13 19 98   eor $981913,x
$1c:eef5  94 c5		 sty $c5,x
$1c:eef7  6e ff 00	  ror $00ff
$1c:eefa  78			sei
$1c:eefb  47 c4		 eor [$c4]
$1c:eefd  5e 33 f2	  lsr $f233,x
$1c:ef00  27 95		 and [$95]
$1c:ef02  68			pla
$1c:ef03  fe 2f 24	  inc $242f,x
$1c:ef06  d6 72		 dec $72,x
$1c:ef08  39 39 bd	  and $bd39,y
$1c:ef0b  12 58		 ora ($58)
$1c:ef0d  f9 49 30	  sbc $3049,y
$1c:ef10  03 17		 ora $17,s
$1c:ef12  57 97		 eor [$97],y
$1c:ef14  a3 7f		 lda $7f,s
$1c:ef16  12 80		 ora ($80)
$1c:ef18  38			sec
$1c:ef19  ca			dex
$1c:ef1a  30 03		 bmi $ef1f
$1c:ef1c  12 80		 ora ($80)
$1c:ef1e  38			sec
$1c:ef1f  7b			tdc
$1c:ef20  9f 2f 95 5e   sta $5e952f,x
$1c:ef24  4b			phk
$1c:ef25  c0 13 12	  cpy #$1213
$1c:ef28  c0 77 6c	  cpy #$6c77
$1c:ef2b  63 e3		 adc $e3,s
$1c:ef2d  b0 c0		 bcs $eeef
$1c:ef2f  0c 4c 00	  tsb $004c
$1c:ef32  e1 70		 sbc ($70,x)
$1c:ef34  5a			phy
$1c:ef35  c6 42		 dec $42
$1c:ef37  6e 4e 63	  ror $634e
$1c:ef3a  32 3f		 and ($3f)
$1c:ef3c  5e ad 60	  lsr $60ad,x
$1c:ef3f  aa			tax
$1c:ef40  5c 9d 9f db   jml $db9f9d
$1c:ef44  fa			plx
$1c:ef45  40			rti
$1c:ef46  4e 49 68	  lsr $6849
$1c:ef49  4b			phk
$1c:ef4a  43 ae		 eor $ae,s
$1c:ef4c  d4 8f		 pei ($8f)
$1c:ef4e  d7 a9		 cmp [$a9],y
$1c:ef50  59 1d 05	  eor $051d,y
$1c:ef53  69 f6		 adc #$f6
$1c:ef55  1a			inc a
$1c:ef56  0f b0 ff 1f   ora $1fffb0
$1c:ef5a  be 0e f0	  ldx $f00e,y
$1c:ef5d  ff 8c 0b 08   sbc $080b8c,x
$1c:ef61  35 dc		 and $dc,x
$1c:ef63  a9 16		 lda #$16
$1c:ef65  7f ba ce 6f   adc $6fceba,x
$1c:ef69  37 24		 and [$24],y
$1c:ef6b  e2 07		 sep #$07
$1c:ef6d  28			plp
$1c:ef6e  eb			xba
$1c:ef6f  0b			phd
$1c:ef70  65 a8		 adc $a8
$1c:ef72  d7 aa		 cmp [$aa],y
$1c:ef74  43 9e		 eor $9e,s
$1c:ef76  5f 07 a8 f9   eor $f9a807,x
$1c:ef7a  5e a5 fd	  lsr $fda5,x
$1c:ef7d  fb			xce
$1c:ef7e  68			pla
$1c:ef7f  5e 22 f5	  lsr $f522,x
$1c:ef82  27 c2		 and [$c2]
$1c:ef84  7b			tdc
$1c:ef85  f4 59 c0	  pea $c059
$1c:ef88  09 eb		 ora #$eb
$1c:ef8a  39 9c cc	  and $cc9c,y
$1c:ef8d  88			dey
$1c:ef8e  5c 35 80 d1   jml $d18035
$1c:ef92  d2 25		 cmp ($25)
$1c:ef94  40			rti
$1c:ef95  06 29		 asl $29
$1c:ef97  11 cb		 ora ($cb),y
$1c:ef99  88			dey
$1c:ef9a  4d 58 22	  eor $2258
$1c:ef9d  23 51		 and $51,s
$1c:ef9f  06 14		 asl $14
$1c:efa1  62 7b a5	  per $951f
$1c:efa4  a0 e5 15	  ldy #$15e5
$1c:efa7  ec 43 16	  cpx $1643
$1c:efaa  60			rts
$1c:efab  88			dey
$1c:efac  8d 84 60	  sta $6084
$1c:efaf  31 cc		 and ($cc),y
$1c:efb1  e6 80		 inc $80
$1c:efb3  27 ce		 and [$ce]
$1c:efb5  fe b4 c8	  inc $c8b4,x
$1c:efb8  2c 3f 6d	  bit $6d3f
$1c:efbb  90 45		 bcc $f002
$1c:efbd  1c 44 ea	  trb $ea44
$1c:efc0  0e ad 61	  asl $61ad
$1c:efc3  de 60 45	  dec $4560,x
$1c:efc6  68			pla
$1c:efc7  87 26		 sta [$26]
$1c:efc9  b0 6f		 bcs $f03a
$1c:efcb  54 32 fa	  mvn $fa,$32
$1c:efce  0f c6 16 15   ora $1516c6
$1c:efd2  20 86 43	  jsr $4386
$1c:efd5  59 40 f3	  eor $f340,y
$1c:efd8  a3 8d		 lda $8d,s
$1c:efda  8c 42 73	  sty $7342
$1c:efdd  e4 53		 cpx $53
$1c:efdf  2b			pld
$1c:efe0  4e f0 e5	  lsr $e5f0
$1c:efe3  30 4f		 bmi $f034
$1c:efe5  96 38		 stx $38,y
$1c:efe7  16 09		 asl $09,x
$1c:efe9  7d b4 fa	  adc $fab4,x
$1c:efec  dd 6e c5	  cmp $c56e,x
$1c:efef  a2 05 f0	  ldx #$f005
$1c:eff2  1f 86 ef 30   ora $30ef86,x
$1c:eff6  d3 1f		 cmp ($1f,s),y
$1c:eff8  b7 db		 lda [$db],y
$1c:effa  55 aa		 eor $aa,x
$1c:effc  70 16		 bvs $f014
$1c:effe  84 9e		 sty $9e
$1c:f000  3a			dec a
$1c:f001  07 00		 ora [$00]
$1c:f003  81 9d		 sta ($9d,x)
$1c:f005  df 0f 22 fe   cmp $fe220f,x
$1c:f009  bd d8 d8	  lda $d8d8,x
$1c:f00c  2a			rol a
$1c:f00d  90 09		 bcc $f018
$1c:f00f  a8			tay
$1c:f010  48			pha
$1c:f011  75 9c		 adc $9c,x
$1c:f013  e5 ba		 sbc $ba
$1c:f015  2d 1b 9f	  and $9f1b
$1c:f018  ce e4 b2	  dec $b2e4
$1c:f01b  05 62		 ora $62
$1c:f01d  63 03		 adc $03,s
$1c:f01f  e7 e4		 sbc [$e4]
$1c:f021  f2 d8		 sbc ($d8)
$1c:f023  6a			ror a
$1c:f024  de 1f 2a	  dec $2a1f,x
$1c:f027  44 22 00	  mvp $00,$22
$1c:f02a  ef c5 a3 d4   sbc $d4a3c5
$1c:f02e  e0 61 38	  cpx #$3861
$1c:f031  2b			pld
$1c:f032  13 28		 ora ($28,s),y
$1c:f034  07 1c		 ora [$1c]
$1c:f036  a6 1c		 ldx $1c
$1c:f038  f3 d8		 sbc ($d8,s),y
$1c:f03a  72 32		 adc ($32)
$1c:f03c  ab			plb
$1c:f03d  14 58		 trb $58
$1c:f03f  9f 3d 44 1c   sta $1c443d,x
$1c:f043  dc 97 34	  jml [$3497]
$1c:f046  be 26 77	  ldx $7726,y
$1c:f049  49 82		 eor #$82
$1c:f04b  64 8e		 stz $8e
$1c:f04d  de 67 80	  dec $8067,x
$1c:f050  88			dey
$1c:f051  9d 20 be	  sta $be20,x
$1c:f054  02 09		 cop #$09
$1c:f056  e5 08		 sbc $08
$1c:f058  c7 95		 cmp [$95]
$1c:f05a  cb			wai
$1c:f05b  1d 0a ec	  ora $ec0a,x
$1c:f05e  45 20		 eor $20
$1c:f060  c0 0e 33	  cpy #$330e
$1c:f063  0c 39 59	  tsb $5939
$1c:f066  9c d6 ea	  stz $ead6
$1c:f069  b7 bd		 lda [$bd],y
$1c:f06b  e1 8f		 sbc ($8f,x)
$1c:f06d  00 72		 brk #$72
$1c:f06f  1c 3d e5	  trb $e53d
$1c:f072  6f 77 98 d8   adc $d89877
$1c:f076  fd b4 3b	  sbc $3bb4,x
$1c:f079  a9 cb		 lda #$cb
$1c:f07b  88			dey
$1c:f07c  37 63		 and [$63],y
$1c:f07e  80 70		 bra $f0f0
$1c:f080  9e 83 ec	  stz $ec83,x
$1c:f083  07 20		 ora [$20]
$1c:f085  51 fb		 eor ($fb),y
$1c:f087  ff a8 40 e4   sbc $e440a8,x
$1c:f08b  eb			xba
$1c:f08c  b5 2e		 lda $2e,x
$1c:f08e  f8			sed
$1c:f08f  41 8f		 eor ($8f,x)
$1c:f091  25 da		 and $da
$1c:f093  4a			lsr a
$1c:f094  00 50		 brk #$50
$1c:f096  8a			txa
$1c:f097  8c 01 07	  sty $0701
$1c:f09a  9b			txy
$1c:f09b  d1 02		 cmp ($02),y
$1c:f09d  05 60		 ora $60
$1c:f09f  68			pla
$1c:f0a0  00 10		 brk #$10
$1c:f0a2  0f 2f 46 1e   ora $1e462f
$1c:f0a6  26 b8		 rol $b8
$1c:f0a8  30 80		 bmi $f02a
$1c:f0aa  4c 6d 71	  jmp $716d
$1c:f0ad  dc 8b cb	  jml [$cb8b]
$1c:f0b0  7d 5b df	  adc $df5b,x
$1c:f0b3  8d 90 86	  sta $8690
$1c:f0b6  1b			tcs
$1c:f0b7  b0 40		 bcs $f0f9
$1c:f0b9  f5 38		 sbc $38,x
$1c:f0bb  18			clc
$1c:f0bc  4e 08 98	  lsr $9808
$1c:f0bf  ca			dex
$1c:f0c0  41 c2		 eor ($c2,x)
$1c:f0c2  e0 82 0b	  cpx #$0b82
$1c:f0c5  91 95		 sta ($95),y
$1c:f0c7  46 08		 lsr $08
$1c:f0c9  20 f3 19	  jsr $19f3
$1c:f0cc  90 78		 bcc $f146
$1c:f0ce  f3 79		 sbc ($79,s),y
$1c:f0d0  b9 23 90	  lda $9023,y
$1c:f0d3  05 d3		 ora $d3
$1c:f0d5  66 ee		 ror $ee
$1c:f0d7  90 49		 bcc $f122
$1c:f0d9  3f 78 fa 01   and $01fa78,x
$1c:f0dd  50 4f		 bvc $f12e
$1c:f0df  88			dey
$1c:f0e0  50 53		 bvc $f135
$1c:f0e2  e3 ac		 sbc $ac,s
$1c:f0e4  45 91		 eor $91
$1c:f0e6  88			dey
$1c:f0e7  18			clc
$1c:f0e8  c2 24		 rep #$24
$1c:f0ea  15 b1		 ora $b1,x
$1c:f0ec  9f 07 94 bf   sta $bf9407,x
$1c:f0f0  0e 58 cc	  asl $cc58
$1c:f0f3  57 e2		 eor [$e2],y
$1c:f0f5  bf 27 e8 6b   lda $6be827,x
$1c:f0f9  75 b9		 adc $b9,x
$1c:f0fb  9c d6 e8	  stz $e8d6
$1c:f0fe  9a			txs
$1c:f0ff  19 8d 8b	  ora $8b8d,y
$1c:f102  3c 1a e3	  bit $e31a,x
$1c:f105  9f fb 6a b5   sta $b56afb,x
$1c:f109  5f 6d 09 70   eor $70096d,x
$1c:f10d  41 a0		 eor ($a0,x)
$1c:f10f  df 16 f8 fd   cmp $fdf816,x
$1c:f113  ba			tsx
$1c:f114  9f b8 03 c7   sta $c703b8,x
$1c:f118  c0 5e 13	  cpy #$135e
$1c:f11b  f1 27		 sbc ($27),y
$1c:f11d  8d 7c 81	  sta $817c
$1c:f120  1b			tcs
$1c:f121  f5 ba		 sbc $ba,x
$1c:f123  6f 88 0d c1   adc $c10d88
$1c:f127  5b			tcd
$1c:f128  1f 53 80 40   ora $408053,x
$1c:f12c  65 b2		 adc $b2
$1c:f12e  2e 80 d2	  rol $d280
$1c:f131  fd 5a c2	  sbc $c25a,x
$1c:f134  04 8f		 tsb $8f
$1c:f136  11 c9		 ora ($c9),y
$1c:f138  ac 7f d2	  ldy $d27f
$1c:f13b  40			rti
$1c:f13c  77 9e		 adc [$9e],y
$1c:f13e  a5 68		 lda $68
$1c:f140  cc 15 93	  cpy $9315
$1c:f143  bc 9c b7	  ldy $b79c,x
$1c:f146  b8			clv
$1c:f147  72 3e		 adc ($3e)
$1c:f149  af 28 80 db   lda $db8028
$1c:f14d  92 92		 sta ($92)
$1c:f14f  6e 09 3e	  ror $3e09
$1c:f152  e9 f7 d7	  sbc #$d7f7
$1c:f155  82 fc 39	  brl $2b54
$1c:f158  e2 df		 sep #$df
$1c:f15a  1f 79 3f f8   ora $f83f79,x
$1c:f15e  fc 1e 47	  jsr ($471e,x)
$1c:f161  3f df ef e7   and $e7efdf,x
$1c:f165  75 38		 adc $38,x
$1c:f167  1c 75 5b	  trb $5b75
$1c:f16a  99 09 88	  sta $8809,y
$1c:f16d  26 10		 rol $10
$1c:f16f  d1 ec		 cmp ($ec),y
$1c:f171  0a			asl a
$1c:f172  01 cd		 ora ($cd,x)
$1c:f174  40			rti
$1c:f175  86 b0		 stx $b0
$1c:f177  ca			dex
$1c:f178  1a			inc a
$1c:f179  c4 08		 cpy $08
$1c:f17b  ad 50 ca	  lda $ca50
$1c:f17e  09 16 62	  ora #$6216
$1c:f181  0e b1 1e	  asl $1eb1
$1c:f184  9f f4 b3 73   sta $73b3f4,x
$1c:f188  ca			dex
$1c:f189  01 cc		 ora ($cc,x)
$1c:f18b  58			cli
$1c:f18c  ba			tsx
$1c:f18d  ad 39 5d	  lda $5d39
$1c:f190  c7 11		 cmp [$11]
$1c:f192  f5 79		 sbc $79,x
$1c:f194  5c a5 5a 71   jml $715aa5
$1c:f198  b7 2c		 lda [$2c],y
$1c:f19a  33 e4		 and ($e4,s),y
$1c:f19c  ee 38 cc	  inc $cc38
$1c:f19f  11 57		 ora ($57),y
$1c:f1a1  0d 6f 7e	  ora $7e6f
$1c:f1a4  d3 4d		 cmp ($4d,s),y
$1c:f1a6  f5 6d		 sbc $6d,x
$1c:f1a8  a2 2a		 ldx #$2a
$1c:f1aa  e1 78		 sbc ($78,x)
$1c:f1ac  78			sei
$1c:f1ad  07 c2		 ora [$c2]
$1c:f1af  5e 23 f1	  lsr $f123,x
$1c:f1b2  a7 91		 lda [$91]
$1c:f1b4  7c ad e5	  jmp ($e5ad,x)
$1c:f1b7  e5 a2		 sbc $a2
$1c:f1b9  d1 74		 cmp ($74),y
$1c:f1bb  5a			phy
$1c:f1bc  4e 07 1c	  lsr $1c07
$1c:f1bf  bd 0c 33	  lda $330c,x
$1c:f1c2  e4 17		 cpx $17
$1c:f1c4  a3 9a		 lda $9a,s
$1c:f1c6  8f 32 f4 7b   sta $7bf432
$1c:f1ca  d3 e6		 cmp ($e6,s),y
$1c:f1cc  5e 8f fa	  lsr $fa8f,x
$1c:f1cf  83 53		 sta $53,s
$1c:f1d1  e1 ac		 sbc ($ac,x)
$1c:f1d3  e6 30		 inc $30
$1c:f1d5  81 2b		 sta ($2b,x)
$1c:f1d7  5c ee af 2b   jml $2bafee
$1c:f1db  94 c5		 sty $c5,x
$1c:f1dd  be 4e e3	  ldx $e34e,y
$1c:f1e0  8c 5e 80	  sty $805e
$1c:f1e3  02 08		 cop #$08
$1c:f1e5  00 10		 brk #$10
$1c:f1e7  d4 46		 pei ($46)
$1c:f1e9  de 19 03	  dec $0319,x
$1c:f1ec  b9 5c c0	  lda $c05c,y
$1c:f1ef  05 71		 ora $71
$1c:f1f1  00 98		 brk #$98
$1c:f1f3  10 6e		 bpl $f263
$1c:f1f5  90 a8		 bcc $f19f
$1c:f1f7  60			rts
$1c:f1f8  44 21 d0	  mvp $d0,$21
$1c:f1fb  c8			iny
$1c:f1fc  54 36 1d	  mvn $1d,$36
$1c:f1ff  0d 08 88	  ora $8808
$1c:f202  40			rti
$1c:f203  2e b1 41	  rol $41b1
$1c:f206  06 5d		 asl $5d
$1c:f208  3e bb ff	  rol $ffbb,x
$1c:f20b  a8			tay
$1c:f20c  c8			iny
$1c:f20d  3e c3 53	  rol $53c3,x
$1c:f210  19 06 7f	  ora $7f06,y
$1c:f213  ed 75 19	  sbc $1975
$1c:f216  08			php
$1c:f217  ce 85 e0	  dec $e085
$1c:f21a  50 cb		 bvc $f1e7
$1c:f21c  af 04 c0 25   lda $25c004
$1c:f220  09 ba 6f	  ora #$6fba
$1c:f223  ce 03 94	  dec $9403
$1c:f226  28			plp
$1c:f227  30 d4		 bmi $f1fd
$1c:f229  07 e3		 ora [$e3]
$1c:f22b  c2 80		 rep #$80
$1c:f22d  1d 24 5e	  ora $5e24,x
$1c:f230  19 5d fa	  ora $fa5d,y
$1c:f233  0c 8c 48	  tsb $488c
$1c:f236  7d 2c aa	  adc $aa2c,x
$1c:f239  0c 92 20	  tsb $2092
$1c:f23c  73 34		 adc ($34,s),y
$1c:f23e  69 a0 cd	  adc #$cda0
$1c:f241  62 83 50	  per $42c7
$1c:f244  81 d9		 sta ($d9,x)
$1c:f246  6c 8c 02	  jmp ($028c)
$1c:f249  00 85		 brk #$85
$1c:f24b  94 00		 sty $00,x
$1c:f24d  57 0b		 eor [$0b],y
$1c:f24f  25 d3		 and $d3
$1c:f251  5c d0 9d b5   jml $b59dd0
$1c:f255  d2 1b		 cmp ($1b)
$1c:f257  75 9c		 adc $9c,x
$1c:f259  4e dc 31	  lsr $31dc
$1c:f25c  3c 0f 84	  bit $840f,x
$1c:f25f  6d de fa	  adc $fade
$1c:f262  0c 6b e8	  tsb $e86b
$1c:f265  29 f8 d6	  and #$d6f8
$1c:f268  50 b2		 bvc $f21c
$1c:f26a  4a			lsr a
$1c:f26b  e2 ca		 sep #$ca
$1c:f26d  2b			pld
$1c:f26e  84 12		 sty $12
$1c:f270  af 74 86 42   lda $428674
$1c:f274  a1 80		 lda ($80,x)
$1c:f276  f4 85 51	  pea $5185
$1c:f279  ee 97 5b	  inc $5b97
$1c:f27c  a5 3d		 lda $3d
$1c:f27e  da			phx
$1c:f27f  01 f3		 ora ($f3,x)
$1c:f281  8a			txa
$1c:f282  c5 23		 cmp $23
$1c:f284  11 49		 ora ($49),y
$1c:f286  fc 0c 16	  jsr ($160c,x)
$1c:f289  1b			tcs
$1c:f28a  fb			xce
$1c:f28b  a1 14		 lda ($14,x)
$1c:f28d  f2 a7		 sbc ($a7)
$1c:f28f  00 97		 brk #$97
$1c:f291  ef f3 d7 5c   sbc $5cd7f3
$1c:f295  c5 d7		 cmp $d7
$1c:f297  7d 75 17	  adc $1775,x
$1c:f29a  a4 01		 ldy $01
$1c:f29c  06 39		 asl $39
$1c:f29e  fb			xce
$1c:f29f  a0 64		 ldy #$64
$1c:f2a1  37 ca		 and [$ca],y
$1c:f2a3  f0 34		 beq $f2d9
$1c:f2a5  99 10 08	  sta $0810,y
$1c:f2a8  e3 75		 sbc $75,s
$1c:f2aa  9f c1 47 a0   sta $a047c1,x
$1c:f2ae  77 42		 adc [$42],y
$1c:f2b0  20 70 c9	  jsr $c970
$1c:f2b3  03 57		 ora $57,s
$1c:f2b5  88			dey
$1c:f2b6  f2 45		 sbc ($45)
$1c:f2b8  c0 50		 cpy #$50
$1c:f2ba  5d ff 0c	  eor $0cff,x
$1c:f2bd  b2 14		 lda ($14)
$1c:f2bf  f8			sed
$1c:f2c0  90 74		 bcc $f336
$1c:f2c2  0d e9 c2	  ora $c2e9
$1c:f2c5  22 80 e0 2e   jsl $2ee080
$1c:f2c9  95 3a		 sta $3a,x
$1c:f2cb  98			tya
$1c:f2cc  34 0d		 bit $0d,x
$1c:f2ce  e6 34		 inc $34
$1c:f2d0  02 28		 cop #$28
$1c:f2d2  1d 82 eb	  ora $eb82,x
$1c:f2d5  4b			phk
$1c:f2d6  a5 9f		 lda $9f
$1c:f2d8  58			cli
$1c:f2d9  b0 1f		 bcs $f2fa
$1c:f2db  b2 40		 lda ($40)
$1c:f2dd  a2 dd		 ldx #$dd
$1c:f2df  42 89		 wdm #$89
$1c:f2e1  a3 b2		 lda $b2,s
$1c:f2e3  80 10		 bra $f2f5
$1c:f2e5  00 50		 brk #$50
$1c:f2e7  14 59		 trb $59
$1c:f2e9  43 a1		 eor $a1,s
$1c:f2eb  b0 c6		 bcs $f2b3
$1c:f2ed  80 34		 bra $f323
$1c:f2ef  ca			dex
$1c:f2f0  15 0e		 ora $0e,x
$1c:f2f2  87 a6		 sta [$a6]
$1c:f2f4  c8			iny
$1c:f2f5  48			pha
$1c:f2f6  2e 16 8b	  rol $8b16
$1c:f2f9  a2 ca		 ldx #$ca
$1c:f2fb  e9 b1 78	  sbc #$78b1
$1c:f2fe  4e c2 e9	  lsr $e9c2
$1c:f301  43 ba		 eor $ba,s
$1c:f303  bc 2d 34	  ldy $342d,x
$1c:f306  0e fd d6	  asl $d6fd
$1c:f309  3f f7 66 ef   and $ef66f7,x
$1c:f30d  4d 90 d4	  eor $d490
$1c:f310  5f 27 fa 0f   eor $0ffa27,x
$1c:f314  a0 d5		 ldy #$d5
$1c:f316  a0 77		 ldy #$77
$1c:f318  31 7e		 and ($7e),y
$1c:f31a  c3 47		 cmp $47,s
$1c:f31c  f8			sed
$1c:f31d  de 01 7e	  dec $7e01,x
$1c:f320  f4 0b fb	  pea $fb0b
$1c:f323  00 17		 brk #$17
$1c:f325  ef 61 ff e3   sbc $e3ff61
$1c:f329  52 1b		 eor ($1b)
$1c:f32b  9b			txy
$1c:f32c  e4 ea		 cpx $ea
$1c:f32e  70 2b		 bvs $f35b
$1c:f330  9d c9 81	  sta $81c9,x
$1c:f333  37 1b		 and [$1b],y
$1c:f335  9f 01 9e 1b   sta $1b9e01,x
$1c:f339  46 7d		 lsr $7d
$1c:f33b  b4 b3		 ldy $b3,x
$1c:f33d  81 44		 sta ($44,x)
$1c:f33f  a2 bc		 ldx #$bc
$1c:f341  01 de		 ora ($de,x)
$1c:f343  7b			tdc
$1c:f344  cd fe ea	  cmp $eafe
$1c:f347  9b			txy
$1c:f348  4b			phk
$1c:f349  a7 dd		 lda [$dd]
$1c:f34b  69 8f 24	  adc #$248f
$1c:f34e  78			sei
$1c:f34f  06 f2		 asl $f2
$1c:f351  01 bf		 ora ($bf,x)
$1c:f353  dd d3 6a	  cmp $6ad3,x
$1c:f356  f7 4c		 sbc [$4c],y
$1c:f358  6d 0d e2	  adc $e20d
$1c:f35b  af 03 aa dd   lda $ddaa03
$1c:f35f  6e 94 b9	  ror $b994
$1c:f362  2b			pld
$1c:f363  00 20		 brk #$20
$1c:f365  f4 48 33	  pea $3348
$1c:f368  01 60		 ora ($60,x)
$1c:f36a  97 50		 sta [$50],y
$1c:f36c  68			pla
$1c:f36d  42 a1		 wdm #$a1
$1c:f36f  d9 ca 36	  cmp $36ca,y
$1c:f372  76 1b		 ror $1b,x
$1c:f374  0c 87 0d	  tsb $0d87
$1c:f377  c2 1b		 rep #$1b
$1c:f379  47 ba		 eor [$ba]
$1c:f37b  c0 5f a1	  cpy #$a15f
$1c:f37e  14 8a		 trb $8a
$1c:f380  42 35		 wdm #$35
$1c:f382  90 98		 bcc $f31c
$1c:f384  a9 08 08	  lda #$0808
$1c:f387  e3 3f		 sbc $3f,s
$1c:f389  ba			tsx
$1c:f38a  43 c1		 eor $c1,s
$1c:f38c  a1 ca		 lda ($ca,x)
$1c:f38e  df f2 eb 05   cmp $05ebf2,x
$1c:f392  50 29		 bvc $f3bd
$1c:f394  1d 66 eb	  ora $eb66,x
$1c:f397  17 7e		 ora [$7e],y
$1c:f399  87 4e		 sta [$4e]
$1c:f39b  b0 62		 bcs $f3ff
$1c:f39d  02 b0		 cop #$b0
$1c:f39f  82 40 a8	  brl $9be2
$1c:f3a2  15 9b		 ora $9b,x
$1c:f3a4  a7 40		 lda [$40]
$1c:f3a6  1a			inc a
$1c:f3a7  05 51		 ora $51
$1c:f3a9  2a			rol a
$1c:f3aa  8f 4c c4 1d   sta $1dc44c
$1c:f3ae  22 e0 ef 9f   jsl $9fefe0
$1c:f3b2  a0 72 43	  ldy #$4372
$1c:f3b5  91 9b		 sta ($9b),y
$1c:f3b7  43 7c		 eor $7c,s
$1c:f3b9  0d 03 11	  ora $1103
$1c:f3bc  1e c1 10	  asl $10c1,x
$1c:f3bf  97 5e		 sta [$5e],y
$1c:f3c1  43 f4		 eor $f4,s
$1c:f3c3  37 aa		 and [$aa],y
$1c:f3c5  21 2a		 and ($2a,x)
$1c:f3c7  11 54		 ora ($54),y
$1c:f3c9  3f 26 d0 a9   and $a9d026,x
$1c:f3cd  9c 08 d0	  stz $d008
$1c:f3d0  69 94 14	  adc #$1494
$1c:f3d3  05 c4		 ora $c4
$1c:f3d5  4e 36 4b	  lsr $4b36
$1c:f3d8  28			plp
$1c:f3d9  a1 2e		 lda ($2e,x)
$1c:f3db  50 17		 bvc $f3f4
$1c:f3dd  0e 34 45	  asl $4534
$1c:f3e0  a5 9c		 lda $9c
$1c:f3e2  08			php
$1c:f3e3  03 bf		 ora $bf,s
$1c:f3e5  c0 1e 0f	  cpy #$0f1e
$1c:f3e8  c2 10		 rep #$10
$1c:f3ea  08			php
$1c:f3eb  06 f1		 asl $f1
$1c:f3ed  7c 13 0d	  jmp ($0d13,x)
$1c:f3f0  e4 44		 cpx $44
$1c:f3f2  50 0f		 bvc $f403
$1c:f3f4  a8			tay
$1c:f3f5  c0 73 f8	  cpy #$f873
$1c:f3f8  0b			phd
$1c:f3f9  d0 d8		 bne $f3d3
$1c:f3fb  70 23		 bvs $f420
$1c:f3fd  22 07 88 c8   jsl $c88807
$1c:f401  70 57		 bvs $f45a
$1c:f403  b2 30		 lda ($30)
$1c:f405  e0 c8 44	  cpx #$44c8
$1c:f408  3f 32 94 83   and $839432,x
$1c:f40c  ff 7e 70 1c   sbc $1c707e,x
$1c:f410  a1 49		 lda ($49,x)
$1c:f412  73 e2		 adc ($e2,s),y
$1c:f414  50 17		 bvc $f42d
$1c:f416  8f 0a 00 74   sta $74000a
$1c:f41a  71 a8		 adc ($a8),y
$1c:f41c  0b			phd
$1c:f41d  c3 2b		 cmp $2b,s
$1c:f41f  bf 41 97 07   lda $079741,x
$1c:f423  82 89 74	  brl $68af
$1c:f426  19 24 40	  ora $4024,y
$1c:f429  e6 48		 inc $48
$1c:f42b  c2 12		 rep #$12
$1c:f42d  a2 81 11	  ldx #$1181
$1c:f430  84 bf		 sty $bf
$1c:f432  f6 87		 inc $87,x
$1c:f434  b8			clv
$1c:f435  7d e5 e0	  adc $e0e5,x
$1c:f438  3f 07 c2 c4   and $c4c207,x
$1c:f43c  c1 f3		 cmp ($f3,x)
$1c:f43e  7a			ply
$1c:f43f  17 8e		 ora [$8e],y
$1c:f441  04 1f		 tsb $1f
$1c:f443  37 b1		 and [$b1],y
$1c:f445  f8			sed
$1c:f446  e0 c1 f2	  cpx #$f2c1
$1c:f449  85 30		 sta $30
$1c:f44b  77 83		 adc [$83],y
$1c:f44d  e1 6a		 sbc ($6a,x)
$1c:f44f  00 fc		 brk #$fc
$1c:f451  c0 9c 3d	  cpy #$3d9c
$1c:f454  03 e9		 ora $e9,s
$1c:f456  2f 59 7b 0f   and $0f7b59
$1c:f45a  da			phx
$1c:f45b  9e e5 f7	  stz $f7e5,x
$1c:f45e  b7 81		 lda [$81],y
$1c:f460  fc 31 ea	  jsr ($ea31,x)
$1c:f463  84 d8		 sty $d8
$1c:f465  8c 07 61	  sty $6107
$1c:f468  eb			xba
$1c:f469  f5 7a		 sbc $7a,x
$1c:f46b  bd 9b 11	  lda $119b,x
$1c:f46e  54 fc fe	  mvn $fe,$fc
$1c:f471  5f 2f a0 e7   eor $e7a02f,x
$1c:f475  c9 5e 5b	  cmp #$5b5e
$1c:f478  f1 63		 sbc ($63),y
$1c:f47a  f8			sed
$1c:f47b  fc 5e 2f	  jsr ($2f5e,x)
$1c:f47e  21 a6		 and ($a6,x)
$1c:f480  bd 3d 9e	  lda $9e3d,x
$1c:f483  cf 84 d3 2a   cmp $2ad384
$1c:f487  04 0f		 tsb $0f
$1c:f489  a6 23		 ldx $23
$1c:f48b  18			clc
$1c:f48c  b1 1c		 lda ($1c),y
$1c:f48e  4a			lsr a
$1c:f48f  9a			txs
$1c:f490  17 fe		 ora [$fe],y
$1c:f492  d0 f7		 bne $f48b
$1c:f494  0f bc bc 07   ora $07bcbc
$1c:f498  e1 4f		 sbc ($4f,x)
$1c:f49a  12 f8		 ora ($f8)
$1c:f49c  db			stp
$1c:f49d  c8			iny
$1c:f49e  31 d3		 and ($d3),y
$1c:f4a0  e5 72		 sbc $72
$1c:f4a2  eb			xba
$1c:f4a3  05 50		 ora $50
$1c:f4a5  29 11 05	  and #$0511
$1c:f4a8  0a			asl a
$1c:f4a9  a2 55 1e	  ldx #$1e55
$1c:f4ac  91 4c		 sta ($4c),y
$1c:f4ae  3a			dec a
$1c:f4af  45 ca		 eor $ca
$1c:f4b1  31 11		 and ($11),y
$1c:f4b3  b3 cf		 lda ($cf,s),y
$1c:f4b5  be 5e 32	  ldx $325e,y
$1c:f4b8  90 f4		 bcc $f4ae
$1c:f4ba  90 f4		 bcc $f4b0
$1c:f4bc  68			pla
$1c:f4bd  1e 9a 98	  asl $989a,x
$1c:f4c0  c8			iny
$1c:f4c1  29 73 b9	  and #$b973
$1c:f4c4  5c ec 96 56   jml $5696ec
$1c:f4c8  18			clc
$1c:f4c9  31 c4		 and ($c4),y
$1c:f4cb  83 ed		 sta $ed,s
$1c:f4cd  cf 76 fb fb   cmp $fbfb76
$1c:f4d1  c1 fd		 cmp ($fd,x)
$1c:f4d3  14 8c		 trb $8c
$1c:f4d5  45 2f		 eor $2f
$1c:f4d7  d7 fb		 cmp [$fb],y
$1c:f4d9  c5 6a		 cmp $6a
$1c:f4db  cd 5a b7	  cmp $b75a
$1c:f4de  5e 44 45	  lsr $4544,x
$1c:f4e1  00 c2		 brk #$c2
$1c:f4e3  ca			dex
$1c:f4e4  73 f8		 adc ($f8,s),y
$1c:f4e6  6c 3e 02	  jmp ($023e)
$1c:f4e9  df 7a b6 de   cmp $deb67a,x
$1c:f4ed  b0 23		 bcs $f512
$1c:f4ef  22 07 8f d7   jsl $d78f07
$1c:f4f3  eb			xba
$1c:f4f4  9f c1 5e c8   sta $c85ec1,x
$1c:f4f8  c3 83		 cmp $83,s
$1c:f4fa  21 10		 and ($10,x)
$1c:f4fc  fc c8 43	  jsr ($43c8,x)
$1c:f4ff  85 29		 sta $29
$1c:f501  11 48		 ora ($48),y
$1c:f503  41 ff		 eor ($ff,x)
$1c:f505  bf 38 0e 50   lda $500e38,x
$1c:f509  b0 b9		 bcs $f4c4
$1c:f50b  fb			xce
$1c:f50c  c5 6c		 cmp $6c
$1c:f50e  82 3c 28	  brl $1d4d
$1c:f511  01 d1		 ora ($d1,x)
$1c:f513  f0 17		 beq $f52c
$1c:f515  a2 08 65	  ldx #$6508
$1c:f518  77 e8		 adc [$e8],y
$1c:f51a  32 e0		 and ($e0)
$1c:f51c  f0 4a		 beq $f568
$1c:f51e  85 80		 sta $80
$1c:f520  b6 a3		 ldx $a3,y
$1c:f522  c5 06		 cmp $06
$1c:f524  49 10 39	  eor #$3910
$1c:f527  92 30		 sta ($30)
$1c:f529  84 a1		 sty $a1
$1c:f52b  7c b3 0a	  jmp ($0ab3,x)
$1c:f52e  41 40		 eor ($40,x)
$1c:f530  88			dey
$1c:f531  c0 b7 97	  cpy #$97b7
$1c:f534  fd 9f ee	  sbc $ee9f,x
$1c:f537  0f 78 f8 0b   ora $0bf878
$1c:f53b  c1 d3		 cmp ($d3,x)
$1c:f53d  5b			tcd
$1c:f53e  be 56 ab	  ldx $ab56,y
$1c:f541  57 90		 eor [$90],y
$1c:f543  74 de		 stz $de,x
$1c:f545  af 56 fb d6   lda $d6fb56
$1c:f549  04 1d		 tsb $1d
$1c:f54b  37 b1		 and [$b1],y
$1c:f54d  f8			sed
$1c:f54e  e0 c1 d2	  cpx #$d2c1
$1c:f551  9b			txy
$1c:f552  04 d8		 tsb $d8
$1c:f554  7d 41 de	  adc $de41,x
$1c:f557  5e 85 a8	  lsr $a885,x
$1c:f55a  17 b3		 ora [$b3],y
$1c:f55c  02 70		 cop #$70
$1c:f55e  f4 0e e1	  pea $e10e
$1c:f561  50 3e		 bvc $f5a1
$1c:f563  b1 f6		 lda ($f6),y
$1c:f565  17 b4		 ora [$b4],y
$1c:f567  fd c9 ef	  sbc $efc9,x
$1c:f56a  5f 03 78 5f   eor $5f7803,x
$1c:f56e  c3 eb		 cmp $eb,s
$1c:f570  b1 18		 lda ($18),y
$1c:f572  0e c3 d7	  asl $d7c3
$1c:f575  ea			nop
$1c:f576  f5 7b		 sbc $7b,x
$1c:f578  36 22		 rol $22,x
$1c:f57a  a7 d8		 lda [$d8]
$1c:f57c  73 3e		 adc ($3e,s),y
$1c:f57e  7f 2f 97 d3   adc $d3972f,x
$1c:f582  9a			txs
$1c:f583  3a			dec a
$1c:f584  8e e1 14	  stx $14e1
$1c:f587  ba			tsx
$1c:f588  a3 a8		 lda $a8,s
$1c:f58a  ea			nop
$1c:f58b  11 74		 ora ($74),y
$1c:f58d  88			dey
$1c:f58e  7d d2 d4	  adc $d4d2,x
$1c:f591  f8			sed
$1c:f592  fc 5e 2f	  jsr ($2f5e,x)
$1c:f595  21 65		 and ($65,x)
$1c:f597  be 23 21	  ldx $2123,y
$1c:f59a  f4 f6 7b	  pea $7bf6
$1c:f59d  3e 11 ca	  rol $ca11,x
$1c:f5a0  ec 3e 09	  cpx $093e
$1c:f5a3  02 18		 cop #$18
$1c:f5a5  10 7d		 bpl $f624
$1c:f5a7  31 18		 and ($18),y
$1c:f5a9  c5 88		 cmp $88
$1c:f5ab  e2 54		 sep #$54
$1c:f5ad  d0 bf		 bne $f56e
$1c:f5af  f6 87		 inc $87,x
$1c:f5b1  b8			clv
$1c:f5b2  7d e5 e0	  adc $e0e5,x
$1c:f5b5  3f 0a 78 97   and $97780a,x
$1c:f5b9  c6 de		 dec $de
$1c:f5bb  41 8a		 eor ($8a,x)
$1c:f5bd  c7 4e		 cmp [$4e]
$1c:f5bf  b0 54		 bcs $f615
$1c:f5c1  22 98 93 14   jsl $149398
$1c:f5c5  c4 85		 cpy $85
$1c:f5c7  9e 32 09	  stz $0932,x
$1c:f5ca  b3 c9		 lda ($c9,s),y
$1c:f5cc  a9 8d 29	  lda #$298d
$1c:f5cf  a1 69		 lda ($69,x)
$1c:f5d1  b7 b7		 lda [$b7],y
$1c:f5d3  54 a6 6f	  mvn $6f,$a6
$1c:f5d6  ae 89 4c	  ldx $4c89
$1c:f5d9  b9 dc 6e	  lda $6edc,y
$1c:f5dc  76 4b		 ror $4b,x
$1c:f5de  2d ca e6	  and $e6ca
$1c:f5e1  c7 12		 cmp [$12]
$1c:f5e3  0f b7 3d db   ora $db3db7
$1c:f5e7  ef ef 07 f4   sbc $f407ef
$1c:f5eb  52 31		 eor ($31)
$1c:f5ed  14 bf		 trb $bf
$1c:f5ef  5f ef 15 ab   eor $ab15ef,x
$1c:f5f3  35 6a		 and $6a,x
$1c:f5f5  dd 79 11	  cmp $1179,x
$1c:f5f8  14 03		 trb $03
$1c:f5fa  0b			phd
$1c:f5fb  2f cf e1 b0   and $b0e1cf
$1c:f5ff  f8			sed
$1c:f600  0b			phd
$1c:f601  7d ea db	  adc $dbea,x
$1c:f604  7a			ply
$1c:f605  c0 8c		 cpy #$8c
$1c:f607  88			dey
$1c:f608  1e 3f 5f	  asl $5f3f,x
$1c:f60b  ae 7f 05	  ldx $057f
$1c:f60e  7b			tdc
$1c:f60f  23 0e		 and $0e,s
$1c:f611  0c 84 43	  tsb $4384
$1c:f614  f3 21		 sbc ($21,s),y
$1c:f616  0e 14 a4	  asl $a414
$1c:f619  45 21		 eor $21
$1c:f61b  07 fe		 ora [$fe]
$1c:f61d  fc e0 39	  jsr ($39e0,x)
$1c:f620  42 c2		 wdm #$c2
$1c:f622  e7 ef		 sbc [$ef]
$1c:f624  15 b2		 ora $b2,x
$1c:f626  08			php
$1c:f627  f0 a0		 beq $f5c9
$1c:f629  07 47		 ora [$47]
$1c:f62b  c0 5e		 cpy #$5e
$1c:f62d  88			dey
$1c:f62e  21 95		 and ($95,x)
$1c:f630  df a0 cb 83   cmp $83cba0,x
$1c:f634  c1 2a		 cmp ($2a,x)
$1c:f636  16 02		 asl $02,x
$1c:f638  da			phx
$1c:f639  8f 14 19 24   sta $241914
$1c:f63d  40			rti
$1c:f63e  e6 48		 inc $48
$1c:f640  c2 12		 rep #$12
$1c:f642  85 f2		 sta $f2
$1c:f644  cc 29 05	  cpy $0529
$1c:f647  02 23		 cop #$23
$1c:f649  02 de		 cop #$de
$1c:f64b  5f 88 3f d6   eor $d63f88,x
$1c:f64f  0c 5f b9	  tsb $b95f
$1c:f652  06 7e		 asl $7e
$1c:f654  42 5f		 wdm #$5f
$1c:f656  b9 ee b2	  lda $b2ee,y
$1c:f659  7c 5f f7	  jmp ($f75f,x)
$1c:f65c  e7 83		 sbc [$83]
$1c:f65e  7e b7 7c	  ror $7cb7,x
$1c:f661  ad 56 af	  lda $af56
$1c:f664  20 e7 d6	  jsr $d6e7
$1c:f667  40			rti
$1c:f668  2f 57 ab 7d   and $7dab57
$1c:f66c  eb			xba
$1c:f66d  02 0e		 cop #$0e
$1c:f66f  7b			tdc
$1c:f670  ec 02 f6	  cpx $f602
$1c:f673  3f 1c 18 d2   and $d2181c,x
$1c:f677  53 60		 eor ($60,s),y
$1c:f679  9b			txy
$1c:f67a  0f a8 d2 41   ora $41d2a8
$1c:f67e  d9 57 80	  cmp $8057,y
$1c:f681  2d 40 1d	  and $1d40
$1c:f684  98			tya
$1c:f685  13 87		 ora ($87,s),y
$1c:f687  a0 77 0a	  ldy #$0a77
$1c:f68a  81 f5		 sta ($f5,x)
$1c:f68c  8f c0 20 ff   sta $ff20c0
$1c:f690  58			cli
$1c:f691  32 ce		 and ($ce)
$1c:f693  f3 99		 sbc ($99,s),y
$1c:f695  fc ea ce	  jsr ($ceea,x)
$1c:f698  e1 1a		 sbc ($1a,x)
$1c:f69a  c8			iny
$1c:f69b  4a			lsr a
$1c:f69c  cf de fe 08   cmp $08fede
$1c:f6a0  f0 cf		 beq $f671
$1c:f6a2  87 cf		 sta [$cf]
$1c:f6a4  62 30 1d	  per $13d7
$1c:f6a7  87 af		 sta [$af]
$1c:f6a9  d5 ea		 cmp $ea,x
$1c:f6ab  f6 6c		 inc $6c,x
$1c:f6ad  45 4f		 eor $4f
$1c:f6af  b0 e6		 bcs $f697
$1c:f6b1  7c fe 5f	  jmp ($5ffe,x)
$1c:f6b4  2f a7 34 75   and $7534a7
$1c:f6b8  1d c2 29	  ora $29c2,x
$1c:f6bb  75 47		 adc $47,x
$1c:f6bd  51 d4		 eor ($d4),y
$1c:f6bf  22 e9 10 fb   jsl $fb10e9
$1c:f6c3  a5 a9		 lda $a9
$1c:f6c5  f1 f8		 sbc ($f8),y
$1c:f6c7  bc 5e 42	  ldy $425e,x
$1c:f6ca  cb			wai
$1c:f6cb  7c 46 43	  jmp ($4346,x)
$1c:f6ce  e9 ec f6	  sbc #$f6ec
$1c:f6d1  7c 23 95	  jmp ($9523,x)
$1c:f6d4  d8			cld
$1c:f6d5  7c 12 04	  jmp ($0412,x)
$1c:f6d8  30 20		 bmi $f6fa
$1c:f6da  fa			plx
$1c:f6db  62 31 8b	  per $820f
$1c:f6de  11 c4		 ora ($c4),y
$1c:f6e0  a9 a1 7f	  lda #$7fa1
$1c:f6e3  ed 0f 70	  sbc $700f
$1c:f6e6  fb			xce
$1c:f6e7  cb			wai
$1c:f6e8  c0 7e 14	  cpy #$147e
$1c:f6eb  f1 2f		 sbc ($2f),y
$1c:f6ed  8d bc 83	  sta $83bc
$1c:f6f0  15 82		 ora $82,x
$1c:f6f2  93 93		 sta ($93,s),y
$1c:f6f4  3c bb e6	  bit $e6bb,x
$1c:f6f7  ef 20 8e b3   sbc $b38e20
$1c:f6fb  1a			inc a
$1c:f6fc  74 cd		 stz $cd,x
$1c:f6fe  9d d4 e9	  sta $e9d4,x
$1c:f701  9f ab a1 d3   sta $d3a1ab,x
$1c:f705  2e 77 1b	  rol $1b77
$1c:f708  9d c9 88	  sta $88c9,x
$1c:f70b  84 1f		 sty $1f
$1c:f70d  6e 7c 00	  ror $007c
$1c:f710  00 08		 brk #$08
$1c:f712  81 40		 sta ($40,x)
$1c:f714  1d e9 16	  ora $16e9,x
$1c:f717  81 45		 sta ($45,x)
$1c:f719  a0 71 68	  ldy #$6871
$1c:f71c  94 5a		 sty $5a,x
$1c:f71e  27 1a		 and [$1a]
$1c:f720  9b			txy
$1c:f721  c6 a0		 dec $a0
$1c:f723  31 a8		 and ($a8),y
$1c:f725  84 6a		 sty $6a
$1c:f727  23 5a		 and $5a,s
$1c:f729  80 d6		 bra $f701
$1c:f72b  a6 f5		 ldx $f5
$1c:f72d  a0 30 44	  ldy #$4430
$1c:f730  23 14		 and $14,s
$1c:f732  c8			iny
$1c:f733  c5 36		 cmp $36
$1c:f735  31 5c		 and ($5c),y
$1c:f737  8c 57 63	  sty $6357
$1c:f73a  16 ca		 asl $ca,x
$1c:f73c  c5 32		 cmp $32
$1c:f73e  b1 5d		 lda ($5d),y
$1c:f740  ac 57 21	  ldy $2157
$1c:f743  10 00		 bpl $f745
$1c:f745  fa			plx
$1c:f746  43 25		 eor $25,s
$1c:f748  50 c9		 bvc $f713
$1c:f74a  5c 32 69 0c   jml $0c6932
$1c:f74e  9a			txs
$1c:f74f  c5 29		 cmp $29
$1c:f751  d1 4a		 cmp ($4a),y
$1c:f753  7c 52 bd	  jmp ($bd52,x)
$1c:f756  14 af		 trb $af
$1c:f758  c5 a4		 cmp $a4
$1c:f75a  51 69		 eor ($69),y
$1c:f75c  1c 5a 65	  trb $655a
$1c:f75f  16 99		 asl $99,x
$1c:f761  c6 a4		 dec $a4
$1c:f763  11 a9		 ora ($a9),y
$1c:f765  0c 6a 61	  tsb $616a
$1c:f768  1a			inc a
$1c:f769  98			tya
$1c:f76a  d6 a4		 dec $a4,x
$1c:f76c  35 a9		 and $a9,x
$1c:f76e  05 68		 ora $68
$1c:f770  8c 13 08	  sty $0813
$1c:f773  56 12		 lsr $12,x
$1c:f775  15 85		 ora $85,x
$1c:f777  85 65		 sta $65
$1c:f779  21 59		 and ($59,x)
$1c:f77b  5e 56 c7	  lsr $c756,x
$1c:f77e  95 b0		 sta $b0,x
$1c:f780  e5 68		 sbc $68
$1c:f782  79 5a 08	  adc $085a,y
$1c:f785  a4 62		 ldy $62
$1c:f787  29 19 8a	  and #$8a19
$1c:f78a  40			rti
$1c:f78b  0c 61 0c	  tsb $0c61
$1c:f78e  84 43		 sty $43
$1c:f790  21 30		 and ($30,x)
$1c:f792  c1 30		 cmp ($30,x)
$1c:f794  40			rti
$1c:f795  21 54		 and ($54,x)
$1c:f797  08			php
$1c:f798  55 06		 eor $06,x
$1c:f79a  15 50		 ora $50,x
$1c:f79c  85 54		 sta $54
$1c:f79e  61 54		 adc ($54,x)
$1c:f7a0  28			plp
$1c:f7a1  55 0e		 eor $0e,x
$1c:f7a3  15 52		 ora $52,x
$1c:f7a5  85 54		 sta $54
$1c:f7a7  e1 54		 sbc ($54,x)
$1c:f7a9  48			pha
$1c:f7aa  55 16		 eor $16,x
$1c:f7ac  15 54		 ora $54,x
$1c:f7ae  85 55		 sta $55
$1c:f7b0  61 54		 adc ($54,x)
$1c:f7b2  68			pla
$1c:f7b3  55 1e		 eor $1e,x
$1c:f7b5  15 56		 ora $56,x
$1c:f7b7  85 55		 sta $55
$1c:f7b9  e1 5a		 sbc ($5a,x)
$1c:f7bb  48			pha
$1c:f7bc  56 96		 lsr $96,x
$1c:f7be  15 b4		 ora $b4,x
$1c:f7c0  85 6d		 sta $6d
$1c:f7c2  79 59 1e	  adc $1e59,y
$1c:f7c5  56 43		 lsr $43,x
$1c:f7c7  95 81		 sta $81,x
$1c:f7c9  e5 60		 sbc $60
$1c:f7cb  22 90 a8 a4   jsl $a4a890
$1c:f7cf  2e 29 3e	  rol $3e29
$1c:f7d2  8a			txa
$1c:f7d3  67 14		 adc [$14]
$1c:f7d5  21 54		 and ($54,x)
$1c:f7d7  53 02		 eor ($02,s),y
$1c:f7d9  98			tya
$1c:f7da  79 55 7e	  adc $7e55,y
$1c:f7dd  55 5b		 eor $5b,x
$1c:f7df  95 47		 sta $47,x
$1c:f7e1  e5 51		 sbc $51
$1c:f7e3  b9 55 5e	  lda $5e55,y
$1c:f7e6  55 53		 eor $53,x
$1c:f7e8  95 45		 sta $45,x
$1c:f7ea  e5 51		 sbc $51
$1c:f7ec  39 55 3e	  and $3e55,y
$1c:f7ef  55 4b		 eor $4b,x
$1c:f7f1  95 43		 sta $43,x
$1c:f7f3  e5 50		 sbc $50
$1c:f7f5  b9 55 1e	  lda $1e55,y
$1c:f7f8  55 43		 eor $43,x
$1c:f7fa  95 41		 sta $41,x
$1c:f7fc  e5 1c		 sbc $1c
$1c:f7fe  03 01		 ora $01,s
$1c:f800  0a			asl a
$1c:f801  c0 c2 b2	  cpy #$b2c2
$1c:f804  10 a4		 bpl $f7aa
$1c:f806  c0 25 83	  cpy #$8325
$1c:f809  69 ca d2	  adc #$d2ca
$1c:f80c  f2 b4		 sbc ($b4)
$1c:f80e  86 30		 stx $30
$1c:f810  aa			tax
$1c:f811  57 cc		 eor [$cc],y
$1c:f813  64 35		 stz $35
$1c:f815  0a			asl a
$1c:f816  a3 80		 lda $80,s
$1c:f818  1d 45 4f	  ora $4f45,x
$1c:f81b  aa			tax
$1c:f81c  53 9c		 eor ($9c,s),y
$1c:f81e  21 54		 and ($54,x)
$1c:f820  af 52 bd 34   lda $34bd52
$1c:f824  ab			plb
$1c:f825  e5 2b		 sbc $2b
$1c:f827  f3 4a		 sbc ($4a,s),y
$1c:f829  c6 52		 dec $52
$1c:f82b  bd f4 af	  lda $aff4,x
$1c:f82e  75 2b		 adc $2b,x
$1c:f830  ff 4a ff 52   sbc $52ff4a,x
$1c:f834  bd b4 af	  lda $afb4,x
$1c:f837  65 2b		 adc $2b
$1c:f839  fb			xce
$1c:f83a  4a			lsr a
$1c:f83b  fe 42 b4	  inc $b442,x
$1c:f83e  10 ad		 bpl $f7ed
$1c:f840  0c 2b 61	  tsb $612b
$1c:f843  0a			asl a
$1c:f844  2c 01 58	  bit $5801
$1c:f847  32 9c		 and ($9c)
$1c:f849  ac 2f 2b	  ldy $2b2f
$1c:f84c  08			php
$1c:f84d  ab			plb
$1c:f84e  0a			asl a
$1c:f84f  a2 a0 15	  ldx #$15a0
$1c:f852  02 21		 cop #$21
$1c:f854  14 18		 trb $18
$1c:f856  08			php
$1c:f857  02 7d		 cop #$7d
$1c:f859  08			php
$1c:f85a  80 0b		 bra $f867
$1c:f85c  d2 95		 cmp ($95)
$1c:f85e  eb			xba
$1c:f85f  a5 7a		 lda $7a
$1c:f861  a9 5f ba	  lda #$ba5f
$1c:f864  57 ea		 eor [$ea],y
$1c:f866  15 ec		 ora $ec,x
$1c:f868  85 7b		 sta $7b
$1c:f86a  61 40		 adc ($40,x)
$1c:f86c  e0 fe c2	  cpx #$c2fe
$1c:f86f  bd d0 af	  lda $afd0,x
$1c:f872  7c 2b fd	  jmp ($fd2b,x)
$1c:f875  0a			asl a
$1c:f876  ff e2 bf 98   sbc $98bfe2,x
$1c:f87a  af ee 2b d9   lda $d92bee
$1c:f87e  8a			txa
$1c:f87f  f6 e2		 inc $e2,x
$1c:f881  bf d8 a2 70   lda $70a2d8,x
$1c:f885  7b			tdc
$1c:f886  b1 5e		 lda ($5e),y
$1c:f888  f8			sed
$1c:f889  a2 80 3b	  ldx #$3b80
$1c:f88c  6a			ror a
$1c:f88d  32 aa		 and ($aa)
$1c:f88f  76 c5		 ror $c5,x
$1c:f891  29 0a be	  and #$be0a
$1c:f894  42 bd		 wdm #$bd
$1c:f896  30 ac		 bmi $f844
$1c:f898  64 2b		 stz $2b
$1c:f89a  f3 8a		 sbc ($8a,s),y
$1c:f89c  fd 62 bf	  sbc $bf62,x
$1c:f89f  78			sei
$1c:f8a0  af 56 2b d7   lda $d72b56
$1c:f8a4  ca			dex
$1c:f8a5  fd f2 bf	  sbc $bff2,x
$1c:f8a8  5c a3 f0 7a   jml $7af0a3
$1c:f8ac  a2 13 88	  ldx #$8813
$1c:f8af  84 e6		 sty $e6
$1c:f8b1  21 00		 and ($00,x)
$1c:f8b3  45 82		 eor $82
$1c:f8b5  3b			tsc
$1c:f8b6  b9 5f fe	  lda $fe5f,y
$1c:f8b9  57 fb		 eor [$fb],y
$1c:f8bb  95 ef		 sta $ef,x
$1c:f8bd  e5 7b		 sbc $7b
$1c:f8bf  b9 5f de	  lda $de5f,y
$1c:f8c2  57 f3		 eor [$f3],y
$1c:f8c4  95 ed		 sta $ed,x
$1c:f8c6  e5 10		 sbc $10
$1c:f8c8  03 d5		 ora $d5,s
$1c:f8ca  0a			asl a
$1c:f8cb  f5 c2		 sbc $c2,x
$1c:f8cd  87 c0		 sta [$c0]
$1c:f8cf  7a			ply
$1c:f8d0  0c 66 28	  tsb $2866
$1c:f8d3  ec 17 cc	  cpx $cc17
$1c:f8d6  57 a7		 eor [$a7],y
$1c:f8d8  95 f9		 sta $f9,x
$1c:f8da  e5 63		 sbc $63
$1c:f8dc  39 4b e0	  and $e04b,y
$1c:f8df  be 23 bd	  ldx $bd23,y
$1c:f8e2  af ed e4 8a   lda $8ae4ed
$1c:f8e6  41 22		 eor ($22,x)
$1c:f8e8  90 58		 bcc $f942
$1c:f8ea  a3 cc		 lda $cc,s
$1c:f8ec  22 b0 c9 24   jsl $24c9b0
$1c:f8f0  32 4b		 and ($4b)
$1c:f8f2  0c 9a 43	  tsb $439a
$1c:f8f5  26 af		 rol $af
$1c:f8f7  73 94		 adc ($94,s),y
$1c:f8f9  43 24		 eor $24,s
$1c:f8fb  ef 71 94 be   sbc $be9471
$1c:f8ff  c6 6d		 dec $6d
$1c:f901  0e 96 43	  asl $4396
$1c:f904  a5 e0		 lda $e0
$1c:f906  f2 e5		 sbc ($e5)
$1c:f908  72 f9		 adc ($f9)
$1c:f90a  41 90		 eor ($90,x)
$1c:f90c  dd f2 b7	  cmp $b7f2,x
$1c:f90f  5c ae 4f 2b   jml $2b4fae
$1c:f913  91 ca		 sta ($ca),y
$1c:f915  dc f2 b7	  jml [$b7f2]
$1c:f918  0e 77 83	  asl $8377
$1c:f91b  45 20		 eor $20
$1c:f91d  f1 48		 sbc ($48),y
$1c:f91f  b4 52		 ldy $52,x
$1c:f921  2e de 68	  rol $68de
$1c:f924  b6 22		 ldx $22,y
$1c:f926  2d 89 8b	  and $8b89
$1c:f929  44 a2 d1	  mvp $d1,$a2
$1c:f92c  38			sec
$1c:f92d  74 32		 stz $32,x
$1c:f92f  1d 0d 87	  ora $870d,x
$1c:f932  47 21		 eor [$21]
$1c:f934  d1 d8		 cmp ($d8),y
$1c:f936  71 3c		 adc ($3c),y
$1c:f938  21 e4		 and ($e4,x)
$1c:f93a  d1 8f		 cmp ($8f),y
$1c:f93c  f2 b5		 sbc ($b5)
$1c:f93e  7c ad 57	  jmp ($57ad,x)
$1c:f941  2b			pld
$1c:f942  37 ca		 and [$ca],y
$1c:f944  cd 72 b5	  cmp $b572
$1c:f947  3c ad 47	  bit $47ad,x
$1c:f94a  2b			pld
$1c:f94b  33 ca		 and ($ca,s),y
$1c:f94d  cc 39 e7	  cpy $e739
$1c:f950  1e f3 1c	  asl $1cf3,x
$1c:f953  fc 52 91	  jsr ($9152,x)
$1c:f956  14 a4		 trb $a4
$1c:f958  c5 2b		 cmp $2b
$1c:f95a  11 4a		 ora ($4a),y
$1c:f95c  cc 5a 45	  cpy $455a
$1c:f95f  16 91		 asl $91,x
$1c:f961  c5 a3		 cmp $a3
$1c:f963  51 68		 eor ($68),y
$1c:f965  d8			cld
$1c:f966  3c 65 b0	  bit $b065,x
$1c:f969  e9 e4 3a	  sbc #$3ae4
$1c:f96c  7a			ply
$1c:f96d  89 10 90	  bit #$9010
$1c:f970  23 82		 and $82,s
$1c:f972  7e 0f 34	  ror $340f,x
$1c:f975  60			rts
$1c:f976  4f e3 17 9a   eor $9a17e3
$1c:f97a  c5 e7		 cmp $e7
$1c:f97c  31 79		 and ($79),y
$1c:f97e  ec 5e 6a	  cpx $6a5e
$1c:f981  96 f7		 stx $f7,y
$1c:f983  88			dey
$1c:f984  55 2f		 eor $2f,x
$1c:f986  ef 50 3b 8d   sbc $8d3b50
$1c:f98a  b8			clv
$1c:f98b  f6 36		 inc $36,x
$1c:f98d  ea			nop
$1c:f98e  a2 c8 29	  ldx #$29c8
$1c:f991  2b			pld
$1c:f992  71 ac		 adc ($ac),y
$1c:f994  c4 b3		 cpy $b3
$1c:f996  b1 2c		 lda ($2c),y
$1c:f998  f2 fc		 sbc ($fc)
$1c:f99a  e7 51		 sbc [$51]
$1c:f99c  29 dc 4a	  and #$4adc
$1c:f99f  95 12		 sta $12,x
$1c:f9a1  a5 d4		 lda $d4
$1c:f9a3  a7 75		 lda [$75]
$1c:f9a5  29 d5 49	  and #$49d5
$1c:f9a8  9c 14 a8	  stz $a814
$1c:f9ab  a7 42		 lda [$42]
$1c:f9ad  29 d1 8a	  and #$8ad1
$1c:f9b0  76 e2		 ror $e2,x
$1c:f9b2  9d 2a a7	  sta $a72a,x
$1c:f9b5  46 a9		 lsr $a9
$1c:f9b7  d0 aa		 bne $f963
$1c:f9b9  37 83		 and [$83],y
$1c:f9bb  b7 10		 lda [$10],y
$1c:f9bd  9c 44 27	  stz $2744
$1c:f9c0  2e 91 9c	  rol $9c91
$1c:f9c3  1d c6 da	  ora $dac6,x
$1c:f9c6  7b			tdc
$1c:f9c7  1b			tcs
$1c:f9c8  6d 51 e4	  adc $e451
$1c:f9cb  0b			phd
$1c:f9cc  a0 79 05	  ldy #$0579
$1c:f9cf  66 1d		 ror $1d
$1c:f9d1  d9 87 76	  cmp $7687,y
$1c:f9d4  a1 dd		 lda ($dd,x)
$1c:f9d6  88			dey
$1c:f9d7  77 02		 adc [$02],y
$1c:f9d9  25 5a		 and $5a
$1c:f9db  89 56 e2	  bit #$e256
$1c:f9de  56 a8		 lsr $a8,x
$1c:f9e0  95 ae		 sta $ae,x
$1c:f9e2  a5 5b		 lda $5b
$1c:f9e4  a9 56 aa	  lda #$aa56
$1c:f9e7  40			rti
$1c:f9e8  e0 b5 1b	  cpx #$1bb5
$1c:f9eb  c5 50		 cmp $50
$1c:f9ed  07 30		 ora [$30]
$1c:f9ef  bf a9 c7 1e   lda $1ec7a9,x
$1c:f9f3  ab			plb
$1c:f9f4  1c fc 3a	  trb $3afc
$1c:f9f7  fb			xce
$1c:f9f8  0e bf 43	  asl $43bf
$1c:f9fb  b1 b0		 lda ($b0),y
$1c:f9fd  ec 74 5b	  cpx $5b74
$1c:fa00  e1 16		 sbc ($16,x)
$1c:fa02  f8			sed
$1c:fa03  c5 bf		 cmp $bf
$1c:fa05  11 6f		 ora ($6f),y
$1c:fa07  44 4b c5	  mvp $c5,$4b
$1c:fa0a  92 f1		 sta ($f1)
$1c:fa0c  c4 bc		 cpy $bc
$1c:fa0e  91 2f		 sta ($2f),y
$1c:fa10  2d 4b c7	  and $c74b
$1c:fa13  52 f1		 eor ($f1)
$1c:fa15  54 87 c0	  mvn $c0,$87
$1c:fa18  3c 0b d4	  bit $d40b,x
$1c:fa1b  4a			lsr a
$1c:fa1c  f7 12		 sbc [$12],y
$1c:fa1e  c5 44		 cmp $44
$1c:fa20  b1 75		 lda ($75),y
$1c:fa22  2b			pld
$1c:fa23  dd 4a f5	  cmp $f54a,x
$1c:fa26  52 27		 eor ($27)
$1c:fa28  06 2b		 asl $2b
$1c:fa2a  25 e2		 and $e2
$1c:fa2c  89 0e 80	  bit #$800e
$1c:fa2f  b0 3d		 bcs $fa6e
$1c:fa31  22 00 97 c3   jsl $c39700
$1c:fa35  a4 58		 ldy $58
$1c:fa37  09 cc 4a	  ora #$4acc
$1c:fa3a  71 12		 adc ($12),y
$1c:fa3c  f0 9a		 beq $f9d8
$1c:fa3e  c2 a4		 rep #$a4
$1c:fa40  68			pla
$1c:fa41  09 35 48	  ora #$4835
$1c:fa44  d8			cld
$1c:fa45  12 68		 ora ($68)
$1c:fa47  97 d2		 sta [$d2],y
$1c:fa49  25 f5		 and $f5
$1c:fa4b  89 7c a2	  bit #$a27c
$1c:fa4e  5f 3a 97 d6   eor $d6973a,x
$1c:fa52  a5 f4		 lda $f4
$1c:fa54  a9 1f 80	  lda #$801f
$1c:fa57  f8			sed
$1c:fa58  1d 68 97	  ora $9768,x
$1c:fa5b  5e 25 e6	  lsr $e625,x
$1c:fa5e  89 79 ea	  bit #$ea79
$1c:fa61  5d 7a 97	  eor $977a,x
$1c:fa64  5a			phy
$1c:fa65  a4 8e		 ldy $8e
$1c:fa67  0f 34 53 e2   ora $e25334
$1c:fa6b  f1 1f		 sbc ($1f),y
$1c:fa6d  43 d4		 eor $d4,s
$1c:fa6f  fe 0f 71	  inc $710f,x
$1c:fa72  fc 1d 44	  jsr ($441d,x)
$1c:fa75  d4 07		 pei ($07)
$1c:fa77  60			rts
$1c:fa78  f0 c2		 beq $fa3c
$1c:fa7a  ac 10 ab	  ldy $ab10
$1c:fa7d  0c 2a e1	  tsb $e12a
$1c:fa80  0a			asl a
$1c:fa81  b8			clv
$1c:fa82  c2 ac		 rep #$ac
$1c:fa84  50 ab		 bvc $fa31
$1c:fa86  1c 2a e5	  trb $e52a
$1c:fa89  0a			asl a
$1c:fa8a  b9 c2 ac	  lda $acc2,y
$1c:fa8d  90 ab		 bcc $fa3a
$1c:fa8f  2c 2a e9	  bit $e92a
$1c:fa92  0a			asl a
$1c:fa93  ba			tsx
$1c:fa94  c2 ac		 rep #$ac
$1c:fa96  d0 ab		 bne $fa43
$1c:fa98  3c 2a ed	  bit $ed2a,x
$1c:fa9b  0a			asl a
$1c:fa9c  bb			tyx
$1c:fa9d  f2 99		 sbc ($99)
$1c:fa9f  c1 76		 cmp ($76,x)
$1c:faa1  e5 59		 sbc $59
$1c:faa3  f9 56 6e	  sbc $6e56,y
$1c:faa6  55 d7		 eor $d7,x
$1c:faa8  95 74		 sta $74,x
$1c:faaa  e5 59		 sbc $59
$1c:faac  79 56 4e	  adc $4e56,y
$1c:faaf  55 cf		 eor $cf,x
$1c:fab1  95 72		 sta $72,x
$1c:fab3  e5 58		 sbc $58
$1c:fab5  f9 56 2e	  sbc $2e56,y
$1c:fab8  55 c7		 eor $c7,x
$1c:faba  95 70		 sta $70,x
$1c:fabc  e5 58		 sbc $58
$1c:fabe  79 4b 00	  adc $004b,y
$1c:fac1  c1 42		 cmp ($42,x)
$1c:fac3  b0 70		 bcs $fb35
$1c:fac5  ac 94 2b	  ldy $2b94
$1c:fac8  27 0a		 and [$0a]
$1c:faca  c3 42		 cmp $42,s
$1c:facc  b0 f0		 bcs $fabe
$1c:face  ac b4 2b	  ldy $2bb4
$1c:fad1  2f ca d9 f2   and $f2d9ca
$1c:fad5  b6 5c		 ldx $5c,y
$1c:fad7  ad 1f 2b	  lda $2b1f
$1c:fada  45 ca		 eor $ca
$1c:fadc  db			stp
$1c:fadd  f2 b6		 sbc ($b6)
$1c:fadf  dc ad 3f	  jml [$3fad]
$1c:fae2  2b			pld
$1c:fae3  4d ca ef	  eor $efca
$1c:fae6  f2 bb		 sbc ($bb)
$1c:fae8  dc ae 7f	  jml [$7fae]
$1c:faeb  2b			pld
$1c:faec  9d ca ee	  sta $eeca,x
$1c:faef  f2 bb		 sbc ($bb)
$1c:faf1  9c ae 6f	  stz $6fae
$1c:faf4  2b			pld
$1c:faf5  99 0a cc	  sta $cc0a,y
$1c:faf8  42 b3		 wdm #$b3
$1c:fafa  30 ad		 bmi $faa9
$1c:fafc  44 2b 53	  mvp $53,$2b
$1c:faff  0a			asl a
$1c:fb00  cd 42 b3	  cmp $b342
$1c:fb03  70 ad		 bvs $fab2
$1c:fb05  54 2b 57	  mvn $57,$2b
$1c:fb08  0a			asl a
$1c:fb09  d1 42		 cmp ($42),y
$1c:fb0b  b4 70		 ldy $70,x
$1c:fb0d  ad 94 2b	  lda $2b94
$1c:fb10  67 0a		 adc [$0a]
$1c:fb12  d3 42		 cmp ($42,s),y
$1c:fb14  b4 f0		 ldy $f0,x
$1c:fb16  ad b4 28	  lda $28b4
$1c:fb19  10 19		 bpl $fb34
$1c:fb1b  3e 56 4b	  rol $4b56,x
$1c:fb1e  95 83		 sta $83,x
$1c:fb20  e5 60		 sbc $60
$1c:fb22  b9 4f e0	  lda $e04f,y
$1c:fb25  cb			wai
$1c:fb26  72 b0		 adc ($b0)
$1c:fb28  fc ac 37	  jsr ($37ac,x)
$1c:fb2b  2b			pld
$1c:fb2c  7f ca df 72   adc $72dfca,x
$1c:fb30  b5 fc		 lda $fc,x
$1c:fb32  ad 77 2b	  lda $2b77
$1c:fb35  7b			tdc
$1c:fb36  ca			dex
$1c:fb37  de 72 b5	  dec $b572,x
$1c:fb3a  bc ad 64	  ldy $64ad,x
$1c:fb3d  2b			pld
$1c:fb3e  71 0a		 adc ($0a),y
$1c:fb40  dc c2 b9	  jml [$b9c2]
$1c:fb43  10 ae		 bpl $faf3
$1c:fb45  4c 2b 75	  jmp $752b
$1c:fb48  0a			asl a
$1c:fb49  dd c2 b9	  cmp $b9c2,x
$1c:fb4c  50 ae		 bvc $fafc
$1c:fb4e  5c 28 bc 1a   jml $1abc28
$1c:fb52  d8			cld
$1c:fb53  56 f2		 lsr $f2,x
$1c:fb55  15 bd		 ora $bd,x
$1c:fb57  85 6b		 sta $6b
$1c:fb59  a1 5a		 lda ($5a,x)
$1c:fb5b  f8			sed
$1c:fb5c  56 fa		 lsr $fa,x
$1c:fb5e  15 bf		 ora $bf,x
$1c:fb60  8c 5a 23	  sty $235a
$1c:fb63  16 98		 asl $98,x
$1c:fb65  c5 e2		 cmp $e2
$1c:fb67  31 79		 and ($79),y
$1c:fb69  40			rti
$1c:fb6a  8d a2 b0	  sta $b0a2
$1c:fb6d  86 0b		 stx $0b
$1c:fb6f  c5 53		 cmp $53
$1c:fb71  b7 54		 lda [$54],y
$1c:fb73  85 a4		 sta $a4
$1c:fb75  47 39		 eor [$39]
$1c:fb77  14 85		 trb $85
$1c:fb79  c5 3b		 cmp $3b
$1c:fb7b  71 44		 adc ($44),y
$1c:fb7d  b0 cc		 bcs $fb4b
$1c:fb7f  3c 13 08	  bit $0813,x
$1c:fb82  f4 c3 ab	  pea $abc3
$1c:fb85  30 97		 bmi $fb1e
$1c:fb87  5c 23 d7 0f   jml $0fd723
$1c:fb8b  05 c1		 ora $c1
$1c:fb8d  4c 1d 58	  jmp $581d
$1c:fb90  50 78		 bvc $fc0a
$1c:fb92  39 b0 ae	  and $aeb0,y
$1c:fb95  e4 2b		 cpx $2b
$1c:fb97  bb			tyx
$1c:fb98  0a			asl a
$1c:fb99  e7 42		 sbc [$42]
$1c:fb9b  b9 f0 ae	  lda $aef0,y
$1c:fb9e  f4 2b be	  pea $be2b
$1c:fba1  83 0c		 sta $0c,s
$1c:fba3  c2 18		 rep #$18
$1c:fba5  10 03		 bpl $fbaa
$1c:fba7  d8			cld
$1c:fba8  46 0a		 lsr $0a
$1c:fbaa  1c aa 53	  trb $53aa
$1c:fbad  8a			txa
$1c:fbae  94 e6		 sty $e6,x
$1c:fbb0  a5 e1		 lda $e1
$1c:fbb2  69 84 01	  adc #$0184
$1c:fbb5  af ee 8f 7c   lda $7c8fee
$1c:fbb9  f8			sed
$1c:fbba  2b			pld
$1c:fbbb  c3 7e		 cmp $7e,s
$1c:fbbd  2c f1 ef	  bit $eff1
$1c:fbc0  93 bc		 sta ($bc,s),y
$1c:fbc2  bf e7 0f 40   lda $400fe7,x
$1c:fbc6  fa			plx
$1c:fbc7  4b			phk
$1c:fbc8  d4 7e		 pei ($7e)
$1c:fbca  b4 f6		 ldy $f6,x
$1c:fbcc  2f b5 bd cf   and $cfbdb5
$1c:fbd0  ef 8f 04 f8   sbc $f8048f
$1c:fbd4  6b			rtl
$1c:fbd5  c5 7e		 cmp $7e
$1c:fbd7  3c f2 6f	  bit $6ff2,x
$1c:fbda  97 bc		 sta [$bc],y
$1c:fbdc  df e8 0f 48   cmp $480fe8,x
$1c:fbe0  fa			plx
$1c:fbe1  8b			phb
$1c:fbe2  d6 7e		 dec $7e,x
$1c:fbe4  c4 f6		 cpy $f6
$1c:fbe6  af b9 bd ef   lda $efbdb9
$1c:fbea  e0 8f 0c	  cpx #$0c8f
$1c:fbed  f8			sed
$1c:fbee  ab			plb
$1c:fbef  c7 7e		 cmp [$7e]
$1c:fbf1  4c f2 ef	  jmp $eff2
$1c:fbf4  9b			txy
$1c:fbf5  bc ff e9	  ldy $e9ff,x
$1c:fbf8  0f 4f 5c 13   ora $135c4f
$1c:fbfc  8b			phb
$1c:fbfd  44 e2 e1	  mvp $e1,$e2
$1c:fc00  38			sec
$1c:fc01  bc 4e 2c	  ldy $2c4e,x
$1c:fc04  33 8d		 and ($8d,s),y
$1c:fc06  4c e3 63	  jmp $63e3
$1c:fc09  38			sec
$1c:fc0a  dc ce 32	  jml [$32ce]
$1c:fc0d  79 a0 dd	  adc $dda0,y
$1c:fc10  3a			dec a
$1c:fc11  37 4e		 and [$4e],y
$1c:fc13  0d d4 a3	  ora $a3d4
$1c:fc16  75 20		 adc $20,x
$1c:fc18  dc 1a 37	  jml [$371a]
$1c:fc1b  06 0d		 asl $0d
$1c:fc1d  c2 a3		 rep #$a3
$1c:fc1f  70 a0		 bvs $fbc1
$1c:fc21  9c 7a 27	  stz $277a
$1c:fc24  1f 09 c7 e2   ora $e2c709,x
$1c:fc28  71 e0		 adc ($e0),y
$1c:fc2a  9c 4a 27	  stz $274a
$1c:fc2d  13 09		 ora ($09,s),y
$1c:fc2f  c4 72		 cpy $72
$1c:fc31  04 13		 tsb $13
$1c:fc33  87 44		 sta [$44]
$1c:fc35  e1 e1		 sbc ($e1,x)
$1c:fc37  38			sec
$1c:fc38  7c 4e 18	  jmp ($184e,x)
$1c:fc3b  00 08		 brk #$08
$1c:fc3d  80 3b		 bra $fc7a
$1c:fc3f  d6 11		 dec $11,x
$1c:fc41  5a			phy
$1c:fc42  84 56		 sty $56
$1c:fc44  e1 16		 sbc ($16,x)
$1c:fc46  a8			tay
$1c:fc47  45 ae		 eor $ae
$1c:fc49  11 5c		 ora ($5c),y
$1c:fc4b  84 57		 sty $57
$1c:fc4d  61 16		 adc ($16,x)
$1c:fc4f  c8			iny
$1c:fc50  45 b5		 eor $b5
$1c:fc52  de ce f6	  dec $f6ce,x
$1c:fc55  77 04		 adc [$04],y
$1c:fc57  a2 16 17	  ldx #$1716
$1c:fc5a  18			clc
$1c:fc5b  d8			cld
$1c:fc5c  5c 61 a1 71   jml $71a161
$1c:fc60  8e 85 c6	  stx $c685
$1c:fc63  1e 17 18	  asl $1817,x
$1c:fc66  fb			xce
$1c:fc67  bd ef 50	  lda $50ef,x
$1c:fc6a  8b			phb
$1c:fc6b  dc 23 15	  jml [$1523]
$1c:fc6e  08			php
$1c:fc6f  c5 c2		 cmp $c2
$1c:fc71  2f 90 8b ec   and $ec8b90
$1c:fc75  23 19		 and $19,s
$1c:fc77  08			php
$1c:fc78  c6 81		 dec $81
$1c:fc7a  fa			plx
$1c:fc7b  51 0a		 eor ($0a),y
$1c:fc7d  94 4a		 sty $4a,x
$1c:fc7f  e5 11		 sbc $11
$1c:fc81  a9 44 ee	  lda #$ee44
$1c:fc84  51 0c		 eor ($0c),y
$1c:fc86  94 4b		 sty $4b,x
$1c:fc88  65 11		 adc $11
$1c:fc8a  c9 44 f6	  cmp #$f644
$1c:fc8d  51 0e		 eor ($0e),y
$1c:fc8f  94 4b		 sty $4b,x
$1c:fc91  e5 11		 sbc $11
$1c:fc93  e9 44 fe	  sbc #$fe44
$1c:fc96  11 10		 ora ($10),y
$1c:fc98  84 44		 sty $44
$1c:fc9a  61 12		 adc ($12,x)
$1c:fc9c  08			php
$1c:fc9d  44 84 e6	  mvp $e6,$84
$1c:fca0  67 01		 adc [$01]
$1c:fca2  8e 45 cf	  stx $cf45
$1c:fca5  f3 01		 sbc ($01,s),y
$1c:fca7  8e 41 e3	  stx $e341
$1c:fcaa  90 64		 bcc $fd10
$1c:fcac  49 c5 e5	  eor #$e5c5
$1c:fcaf  13 a9		 ora ($a9,s),y
$1c:fcb1  44 e6 51	  mvp $51,$e6
$1c:fcb4  4a			lsr a
$1c:fcb5  94 52		 sty $52,x
$1c:fcb7  65 12		 adc $12
$1c:fcb9  c9 45 36	  cmp #$3645
$1c:fcbc  51 3c		 eor ($3c),y
$1c:fcbe  94 52		 sty $52,x
$1c:fcc0  e5 12		 sbc $12
$1c:fcc2  e9 45 3e	  sbc #$3e45
$1c:fcc5  51 3e		 eor ($3e),y
$1c:fcc7  94 42		 sty $42,x
$1c:fcc9  63 90		 adc $90,s
$1c:fccb  28			plp
$1c:fccc  e4 0e		 cpx $0e
$1c:fcce  39 12 8e	  and $8e12,y
$1c:fcd1  44 e3 90	  mvp $90,$e3
$1c:fcd4  48			pha
$1c:fcd5  e4 16		 cpx $16
$1c:fcd7  39 14 8e	  and $8e14,y
$1c:fcda  45 50		 eor $50
$1c:fcdc  ae 80 24	  ldx $2480
$1c:fcdf  81 20		 sta ($20,x)
$1c:fce1  02 2c		 cop #$2c
$1c:fce3  7f 18 3d a2   adc $a23d18,x
$1c:fce7  17 60		 ora [$60],y
$1c:fce9  80 5a		 bra $fd45
$1c:fceb  23 6d		 and $6d,s
$1c:fced  90 94		 bcc $fc83
$1c:fcef  53 25		 eor ($25,s),y
$1c:fcf1  07 30		 ora [$30]
$1c:fcf3  0b			phd
$1c:fcf4  15 3a		 ora $3a,x
$1c:fcf6  51 19		 eor ($19),y
$1c:fcf8  94 4a		 sty $4a,x
$1c:fcfa  a5 12		 lda $12
$1c:fcfc  98			tya
$1c:fcfd  e4 8a		 cpx $8a
$1c:fcff  39 23 8e	  and $8e23,y
$1c:fd02  4c a3 93	  jmp $93a3
$1c:fd05  38			sec
$1c:fd06  e4 92		 cpx $92
$1c:fd08  39 25 8e	  and $8e25,y
$1c:fd0b  4d 23 93	  eor $9323
$1c:fd0e  56 99		 lsr $99,x
$1c:fd10  33 5d		 and ($5d,s),y
$1c:fd12  90 80		 bcc $fc94
$1c:fd14  23 b4		 and $b4,s
$1c:fd16  4a			lsr a
$1c:fd17  ed 10 ab	  sbc $ab10
$1c:fd1a  44 ee d1	  mvp $d1,$ee
$1c:fd1d  1a			inc a
$1c:fd1e  b4 43		 ldy $43,x
$1c:fd20  5b			tcd
$1c:fd21  23 1d		 and $1d,s
$1c:fd23  6c 8c 3d	  jmp ($3d8c)
$1c:fd26  b2 31		 lda ($31)
$1c:fd28  f6 c8		 inc $c8,x
$1c:fd2a  47 28		 eor [$28]
$1c:fd2c  82 f1 a2	  brl $a020
$1c:fd2f  8b			phb
$1c:fd30  cc 60 54	  cpy $5460
$1c:fd33  81 9a		 sta ($9a,x)
$1c:fd35  8f 80 60 54   sta $546080
$1c:fd39  62 0c 5a	  per $5748
$1c:fd3c  27 36		 and [$36]
$1c:fd3e  89 d5 a2	  bit #$a2d5
$1c:fd41  93 68		 sta ($68,s),y
$1c:fd43  a5 5a		 lda $5a
$1c:fd45  25 b6		 and $b6
$1c:fd47  88			dey
$1c:fd48  65 a2		 adc $a2
$1c:fd4a  7b			tdc
$1c:fd4b  68			pla
$1c:fd4c  8e 5a 25	  stx $255a
$1c:fd4f  f6 88		 inc $88,x
$1c:fd51  75 a2		 adc $a2,x
$1c:fd53  7f 68 8f 47   adc $478f68,x
$1c:fd57  2c 11 cb	  bit $cb11
$1c:fd5a  0c 72 e1	  tsb $e172
$1c:fd5d  1c b8 c7	  trb $c7b8
$1c:fd60  2c 51 cb	  bit $cb51
$1c:fd63  1c 72 e5	  trb $e572
$1c:fd66  1c b9 c7	  trb $c7b9
$1c:fd69  2c 91 cb	  bit $cb91
$1c:fd6c  2c 72 e9	  bit $e972
$1c:fd6f  1c ba c2	  trb $c2ba
$1c:fd72  2c d0 8b	  bit $8bd0
$1c:fd75  3c 22 ed	  bit $ed22,x
$1c:fd78  08			php
$1c:fd79  bb			tyx
$1c:fd7a  c2 2d		 rep #$2d
$1c:fd7c  10 8b		 bpl $fd09
$1c:fd7e  4c 22 f1	  jmp $f122
$1c:fd81  08			php
$1c:fd82  bc 8b ce	  ldy $ce8b,x
$1c:fd85  a8			tay
$1c:fd86  9b			txy
$1c:fd87  0b			phd
$1c:fd88  45 36		 eor $36
$1c:fd8a  d1 2c		 cmp ($2c),y
$1c:fd8c  b4 52		 ldy $52,x
$1c:fd8e  ed 13 cb	  sbc $cb13
$1c:fd91  45 3e		 eor $3e
$1c:fd93  d1 2e		 cmp ($2e),y
$1c:fd95  b4 42		 ldy $42,x
$1c:fd97  6d 13 e8	  adc $e813
$1c:fd9a  e6 02		 inc $02
$1c:fd9c  39 81 8e	  and $8e81,y
$1c:fd9f  64 23		 stz $23
$1c:fda1  99 18 e6	  sta $e618,y
$1c:fda4  0a			asl a
$1c:fda5  39 83 8e	  and $8e83,y
$1c:fda8  64 a3		 stz $a3
$1c:fdaa  99 38 e6	  sta $e638,y
$1c:fdad  12 39		 ora ($39)
$1c:fdaf  85 8e		 sta $8e
$1c:fdb1  65 23		 adc $23
$1c:fdb3  99 58 46	  sta $4658,y
$1c:fdb6  1a			inc a
$1c:fdb7  11 87		 ora ($87),y
$1c:fdb9  84 65		 sty $65
$1c:fdbb  a1 19		 lda ($19,x)
$1c:fdbd  78			sei
$1c:fdbe  46 22		 lsr $22
$1c:fdc0  11 89		 ora ($89),y
$1c:fdc2  84 66		 sty $66
$1c:fdc4  21 19		 and ($19,x)
$1c:fdc6  98			tya
$1c:fdc7  e5 09		 sbc $09
$1c:fdc9  ae 35 26	  ldx $2635
$1c:fdcc  d8			cld
$1c:fdcd  24 02		 bit $02
$1c:fdcf  d1 4c		 cmp ($4c),y
$1c:fdd1  12 80		 ora ($80)
$1c:fdd3  94 63		 sty $63,x
$1c:fdd5  36 8a		 rol $8a,x
$1c:fdd7  75 a2		 adc $a2,x
$1c:fdd9  53 68		 eor ($68,s),y
$1c:fddb  95 47		 sta $47,x
$1c:fddd  34 11		 bit $11,x
$1c:fddf  cd 0c 73	  cmp $730c
$1c:fde2  61 1c		 adc ($1c,x)
$1c:fde4  d8			cld
$1c:fde5  c7 34		 cmp [$34]
$1c:fde7  51 cd		 eor ($cd),y
$1c:fde9  1c 73 65	  trb $6573
$1c:fdec  1c d9 c7	  trb $c7d9
$1c:fdef  34 91		 bit $91,x
$1c:fdf1  cd 2c 73	  cmp $732c
$1c:fdf4  69 1c da	  adc #$da1c
$1c:fdf7  c2 34		 rep #$34
$1c:fdf9  d0 8d		 bne $fd88
$1c:fdfb  3c 23 6d	  bit $6d23,x
$1c:fdfe  08			php
$1c:fdff  db			stp
$1c:fe00  c2 35		 rep #$35
$1c:fe02  10 8d		 bpl $fd91
$1c:fe04  4c 23 71	  jmp $7123
$1c:fe07  08			php
$1c:fe08  dc c7 28	  jml [$28c7]
$1c:fe0b  61 71		 adc ($71,x)
$1c:fe0d  a9 86 c4	  lda #$c486
$1c:fe10  6c c2 42	  jmp ($42c2)
$1c:fe13  ab			plb
$1c:fe14  47 13		 eor [$13]
$1c:fe16  81 c0		 sta ($c0,x)
$1c:fe18  8e 70 63	  stx $6370
$1c:fe1b  9d 08 e7	  sta $e708,x
$1c:fe1e  46 39		 lsr $39
$1c:fe20  c2 8e		 rep #$8e
$1c:fe22  70 e3		 bvs $fe07
$1c:fe24  9d 28 e7	  sta $e728,x
$1c:fe27  4e 39 c4	  lsr $c439
$1c:fe2a  8e 71 63	  stx $6371
$1c:fe2d  9d 48 e7	  sta $e748,x
$1c:fe30  56 11		 lsr $11,x
$1c:fe32  c6 84		 dec $84
$1c:fe34  71 e1		 adc ($e1),y
$1c:fe36  1d 68 47	  ora $4768,x
$1c:fe39  5e 11 c8	  lsr $c811,x
$1c:fe3c  84 72		 sty $72
$1c:fe3e  61 1d		 adc ($1d,x)
$1c:fe40  88			dey
$1c:fe41  47 66		 eor [$66]
$1c:fe43  11 ca		 ora ($ca),y
$1c:fe45  84 72		 sty $72
$1c:fe47  e1 1d		 sbc ($1d,x)
$1c:fe49  a8			tay
$1c:fe4a  47 6e		 eor [$6e]
$1c:fe4c  11 cc		 ora ($cc),y
$1c:fe4e  84 73		 sty $73
$1c:fe50  61 1d		 adc ($1d,x)
$1c:fe52  c8			iny
$1c:fe53  47 76		 eor [$76]
$1c:fe55  39 55 0f	  and $0f55,y
$1c:fe58  8a			txa
$1c:fe59  70 2a		 bvs $fe85
$1c:fe5b  f1 cf		 sbc ($cf),y
$1c:fe5d  04 73		 tsb $73
$1c:fe5f  c3 1c		 cmp $1c,s
$1c:fe61  f8			sed
$1c:fe62  47 3e		 eor [$3e]
$1c:fe64  31 cf		 and ($cf),y
$1c:fe66  14 73		 trb $73
$1c:fe68  c7 1c		 cmp [$1c]
$1c:fe6a  f9 47 3e	  sbc $3e47,y
$1c:fe6d  71 cf		 adc ($cf),y
$1c:fe6f  24 73		 bit $73
$1c:fe71  cb			wai
$1c:fe72  1c fa 47	  trb $47fa
$1c:fe75  3e b0 8f	  rol $8fb0,x
$1c:fe78  34 23		 bit $23,x
$1c:fe7a  cf 08 fb 42   cmp $42fb08
$1c:fe7e  3e f0 8f	  rol $8ff0,x
$1c:fe81  44 23 d3	  mvp $d3,$23
$1c:fe84  08			php
$1c:fe85  fc 42 3f	  jsr ($3f42,x)
$1c:fe88  30 8f		 bmi $fe19
$1c:fe8a  54 23 d7	  mvn $d7,$23
$1c:fe8d  08			php
$1c:fe8e  fd 42 3f	  sbc $3f42,x
$1c:fe91  70 8f		 bvs $fe22
$1c:fe93  64 23		 stz $23
$1c:fe95  db			stp
$1c:fe96  08			php
$1c:fe97  fe 42 3f	  inc $3f42,x
$1c:fe9a  b1 ca		 lda ($ca),y
$1c:fe9c  39 a4 ea	  and $eaa4,y
$1c:fe9f  91 0b		 sta ($0b),y
$1c:fea1  34 42		 bit $42,x
$1c:fea3  cf 10 bb 44   cmp $44bb10
$1c:fea7  2e f1 0b	  rol $0bf1
$1c:feaa  44 42 d3	  mvp $d3,$42
$1c:fead  10 bc		 bpl $fe6b
$1c:feaf  44 2f 31	  mvp $31,$2f
$1c:feb2  0c 34 43	  tsb $4334
$1c:feb5  0f 10 cb 44   ora $44cb10
$1c:feb9  32 f1		 and ($f1)
$1c:febb  0c 44 43	  tsb $4344
$1c:febe  13 10		 ora ($10,s),y
$1c:fec0  cc 44 33	  cpy $3344
$1c:fec3  31 0e		 and ($0e),y
$1c:fec5  34 43		 bit $43,x
$1c:fec7  8f 10 eb 44   sta $44eb10
$1c:fecb  3a			dec a
$1c:fecc  f1 0e		 sbc ($0e),y
$1c:fece  44 43 93	  mvp $93,$43
$1c:fed1  10 ec		 bpl $febf
$1c:fed3  44 3b 30	  mvp $30,$3b
$1c:fed6  06 fa		 asl $fa
$1c:fed8  c7 28		 cmp [$28]
$1c:feda  51 ca		 eor ($ca),y
$1c:fedc  c4 72		 cpy $72
$1c:fede  a4 eb		 ldy $eb
$1c:fee0  06 fb		 asl $fb
$1c:fee2  37 da		 and [$da],y
$1c:fee4  21 a6		 and ($a6,x)
$1c:fee6  88			dey
$1c:fee7  69 e2 1b	  adc #$1be2
$1c:feea  68			pla
$1c:feeb  86 de		 stx $de
$1c:feed  21 a8		 and ($a8,x)
$1c:feef  88			dey
$1c:fef0  6a			ror a
$1c:fef1  62 1b 88	  per $870f
$1c:fef4  86 e6		 stx $e6
$1c:fef6  21 ca		 and ($ca,x)
$1c:fef8  88			dey
$1c:fef9  72 e2		 adc ($e2)
$1c:fefb  1d a8 87	  ora $87a8,x
$1c:fefe  6e 21 cc	  ror $cc21
$1c:ff01  88			dey
$1c:ff02  73 62		 adc ($62,s),y
$1c:ff04  1d c8 87	  ora $87c8,x
$1c:ff07  75 df		 adc $df,x
$1c:ff09  d0 8d		 bne $fe98
$1c:ff0b  54 23 57	  mvn $57,$23
$1c:ff0e  08			php
$1c:ff0f  dd 42 37	  cmp $3742,x
$1c:ff12  70 8d		 bvs $fea1
$1c:ff14  64 23		 stz $23
$1c:ff16  5b			tcd
$1c:ff17  08			php
$1c:ff18  de 42 37	  dec $3742,x
$1c:ff1b  b0 8c		 bcs $fea9
$1c:ff1d  d4 23		 pei ($23)
$1c:ff1f  36 2f		 rol $2f,x
$1c:ff21  3c e4 23	  bit $23e4,x
$1c:ff24  3a			dec a
$1c:ff25  37 2a		 and [$2a],y
$1c:ff27  46 76		 lsr $76
$1c:ff29  91 9c		 sta ($9c),y
$1c:ff2b  a4 13		 ldy $13
$1c:ff2d  83 59		 sta $59,s
$1c:ff2f  48			pha
$1c:ff30  cd d2 33	  cmp $33d2
$1c:ff33  54 8d 5d	  mvn $5d,$8d
$1c:ff36  23 54		 and $54,s
$1c:ff38  53 3d		 eor ($3d,s),y
$1c:ff3a  ed 23 78	  sbc $7823
$1c:ff3d  5b			tcd
$1c:ff3e  3d dd 20	  and $20dd,x
$1c:ff41  68			pla
$1c:ff42  04 0d		 tsb $0d
$1c:ff44  19 99 00	  ora $0099,y
$1c:ff47  87 84		 sta [$84]
$1c:ff49  48			pha
$1c:ff4a  13 19		 ora ($19,s),y
$1c:ff4c  94 08		 sty $08,x
$1c:ff4e  d8			cld
$1c:ff4f  25 73		 and $73
$1c:ff51  28			plp
$1c:ff52  69 ff 85	  adc #$85ff
$1c:ff55  fc 5f e4	  jsr ($e45f,x)
$1c:ff58  7f 42 33 d0   adc $d03342,x
$1c:ff5c  8c fc 23	  sty $23fc
$1c:ff5f  5d 08 d7	  eor $d708,x
$1c:ff62  c2 31		 rep #$31
$1c:ff64  d0 8c		 bne $fef2
$1c:ff66  7c 22 dd	  jmp ($dd22,x)
$1c:ff69  08			php
$1c:ff6a  b7 c2		 lda [$c2],y
$1c:ff6c  2f d0 8b fb   and $fb8bd0
$1c:ff70  de a9 16	  dec $16a9,x
$1c:ff73  fa			plx
$1c:ff74  45 ba		 eor $ba
$1c:ff76  90 0e		 bcc $ff86
$1c:ff78  0b			phd
$1c:ff79  f0 4c		 beq $ffc7
$1c:ff7b  f1 f4		 sbc ($f4),y
$1c:ff7d  8c 70 6c	  sty $6c70
$1c:ff80  c2 03		 rep #$03
$1c:ff82  00 13		 brk #$13
$1c:ff84  ac 23 7d	  ldy $7d23
$1c:ff87  08			php
$1c:ff88  df bb cc 01   cmp $01ccbb,x
$1c:ff8c  a3 b6		 lda $b6,s
$1c:ff8e  0f b0 3f 84   ora $843fb0
$1c:ff92  ee f4 21	  inc $21f4
$1c:ff95  81 3f		 sta ($3f,x)
$1c:ff97  3c 02 81	  bit $8102,x
$1c:ff9a  7e 07 b0	  ror $b007,x
$1c:ff9d  9d 95 de	  sta $de95,x
$1c:ffa0  bf f6 87 b8   lda $b887f6,x
$1c:ffa4  7d e5 e0	  adc $e0e5,x
$1c:ffa7  3f 0a 78 97   and $97780a,x
$1c:ffab  c6 de		 dec $de
$1c:ffad  47 f2		 eor [$f2]
$1c:ffaf  c7 9a		 cmp [$9a]
$1c:ffb1  7c f5 e8	  jmp ($e8f5,x)
$1c:ffb4  bf 4e 7a b7   lda $b77a4e,x
$1c:ffb8  d7 de		 cmp [$de],y
$1c:ffba  cf f7 07 bc   cmp $bc07f7
$1c:ffbe  7c 05 e1	  jmp ($e105,x)
$1c:ffc1  3f 12 78 d7   and $d77812,x
$1c:ffc5  c8			iny
$1c:ffc6  de 57 f3	  dec $f357,x
$1c:ffc9  47 9e		 eor [$9e]
$1c:ffcb  7d 15 e9	  adc $e915,x
$1c:ffce  bf 56 7a f7   lda $f77a56,x
$1c:ffd2  d9 de df	  cmp $dfde,y
$1c:ffd5  f7 87		 sbc [$87],y
$1c:ffd7  80 7c		 bra $0055
$1c:ffd9  25 e2		 and $e2
$1c:ffdb  3f 1a 79 17   and $17791a,x
$1c:ffdf  ca			dex
$1c:ffe0  de 67 f3	  dec $f367,x
$1c:ffe3  c7 a2		 cmp [$a2]
$1c:ffe5  7d 35 ea	  adc $ea35,x
$1c:ffe8  bf 5e 7b 37   lda $377b5e,x
$1c:ffec  db			stp
$1c:ffed  dc 6e c0	  jml [$c06e]
$1c:fff0  f4 57 a6	  pea $a657
$1c:fff3  fd 59 eb	  sbc $eb59,x
$1c:fff6  df 67 7b 7f   cmp $7f7b67,x
$1c:fffa  40			rti
$1c:fffb  00 00		 brk #$00
$1c:fffd  00 00		 brk #$00
$1c:ffff  00 00		 brk #$00
