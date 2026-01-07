; Soul Blazer (SNES) - Bank $1d
; Disassembled from ROM
; File offset: $0e8000-$0effff
; CPU address: $1d:$8000-$1d:$ffff
;===========================================================

.bank $1d
.org $8000

$1d:8000  00 08		 brk #$08
$1d:8002  80 3b		 bra $803f
$1d:8004  d6 51		 dec $51,x
$1d:8006  10 7b		 bpl $8083
$1d:8008  ac 2a 51	  ldy $512a
$1d:800b  06 94		 asl $94
$1d:800d  41 25		 eor ($25,x)
$1d:800f  11 39		 ora ($39),y
$1d:8011  43 d8		 eor $d8,s
$1d:8013  1e c1 02	  asl $02c1,x
$1d:8016  94 40		 sty $40,x
$1d:8018  c0 e6 02	  cpy #$02e6
$1d:801b  00 60		 brk #$60
$1d:801d  3d 82 22	  and $2282,x
$1d:8020  0d 0b 44	  ora $440b
$1d:8023  21 fe		 and ($fe,x)
$1d:8025  70 50		 bvs $8077
$1d:8027  38			sec
$1d:8028  80 07		 bra $8031
$1d:802a  d0 06		 bne $8032
$1d:802c  67 b0		 adc [$b0]
$1d:802e  44 82 e7	  mvp $e7,$82
$1d:8031  13 0e		 ora ($0e,s),y
$1d:8033  88			dey
$1d:8034  20 80 c1	  jsr $c180
$1d:8037  15 1a		 ora $1a,x
$1d:8039  8c 12 d1	  sty $d112
$1d:803c  18			clc
$1d:803d  01 88		 ora ($88,x)
$1d:803f  d0 87		 bne $7fc8
$1d:8041  84 06		 sty $06
$1d:8043  08			php
$1d:8044  49 2c 5f	  eor #$5f2c
$1d:8047  01 1a		 ora ($1a,x)
$1d:8049  14 ac		 trb $ac
$1d:804b  2c 52 23	  bit $2352
$1d:804e  61 f4		 adc ($f4,x)
$1d:8050  0a			asl a
$1d:8051  80 00		 bra $8053
$1d:8053  00 82		 brk #$82
$1d:8055  37 08		 and [$08],y
$1d:8057  2d 62 66	  and $6662
$1d:805a  f0 b4		 beq $8010
$1d:805c  18			clc
$1d:805d  00 10		 brk #$10
$1d:805f  41 c0		 eor ($c0,x)
$1d:8061  8d fa 22	  sta $22fa
$1d:8064  be 88 a1	  ldx $a188,y
$1d:8067  b4 62		 ldy $62,x
$1d:8069  cf 71 02 03   cmp $030271
$1d:806d  e0 09 81	  cpx #$8109
$1d:8070  17 36		 ora [$36],y
$1d:8072  8c 34 da	  sty $da34
$1d:8075  21 62		 and ($62,x)
$1d:8077  01 01		 ora ($01,x)
$1d:8079  d0 ce		 bne $8049
$1d:807b  e6 36		 inc $36
$1d:807d  08			php
$1d:807e  85 a2		 sta $a2
$1d:8080  3f e8 26 00   and $0026e8,x
$1d:8084  70 75		 bvs $80fb
$1d:8086  10 85		 bpl $800d
$1d:8088  e8			inx
$1d:8089  ab			plb
$1d:808a  94 82		 sty $82,x
$1d:808c  63 c1		 adc $c1,s
$1d:808e  61 88		 adc ($88,x)
$1d:8090  38			sec
$1d:8091  09 c2 a7	  ora #$a7c2
$1d:8094  35 72		 and $72,x
$1d:8096  47 40		 eor [$40]
$1d:8098  a3 1c		 lda $1c,s
$1d:809a  56 ac		 lsr $ac,x
$1d:809c  0b			phd
$1d:809d  51 07		 eor ($07),y
$1d:809f  f4 26 80	  pea $8026
$1d:80a2  38			sec
$1d:80a3  3e 88 8f	  rol $8f88,x
$1d:80a6  a2 1e 6f	  ldx #$6f1e
$1d:80a9  18			clc
$1d:80aa  ee a2 30	  inc $30a2
$1d:80ad  d9 12 60	  cmp $6012,y
$1d:80b0  42 df		 wdm #$df
$1d:80b2  20 c3 18	  jsr $18c3
$1d:80b5  53 fc		 eor ($fc,s),y
$1d:80b7  0b			phd
$1d:80b8  ea			nop
$1d:80b9  64 25		 stz $25
$1d:80bb  41 29		 eor ($29,x)
$1d:80bd  02 20		 cop #$20
$1d:80bf  6b			rtl
$1d:80c0  00 38		 brk #$38
$1d:80c2  4a			lsr a
$1d:80c3  20 24 f2	  jsr $f224
$1d:80c6  37 8c		 and [$8c],y
$1d:80c8  31 2e		 and ($2e),y
$1d:80ca  22 80 8a 6a   jsl $6a8a80
$1d:80ce  21 20		 and ($20,x)
$1d:80d0  71 04		 adc ($04),y
$1d:80d2  02 08		 cop #$08
$1d:80d4  13 44		 ora ($44,s),y
$1d:80d6  46 a8		 lsr $a8
$1d:80d8  43 4c		 eor $4c,s
$1d:80da  63 32		 adc $32,s
$1d:80dc  88			dey
$1d:80dd  f0 6c		 beq $814b
$1d:80df  45 c4		 eor $c4
$1d:80e1  e4 28		 cpx $28
$1d:80e3  2a			rol a
$1d:80e4  94 43		 sty $43,x
$1d:80e6  c5 0e		 cmp $0e
$1d:80e8  13 8c		 ora ($8c,s),y
$1d:80ea  3b			tsc
$1d:80eb  d0 c4		 bne $80b1
$1d:80ed  08			php
$1d:80ee  b0 14		 bcs $8104
$1d:80f0  03 e4		 ora $e4,s
$1d:80f2  03 0b		 ora $0b,s
$1d:80f4  40			rti
$1d:80f5  60			rts
$1d:80f6  1f 84 44 11   ora $114484,x
$1d:80fa  99 30 c4	  sta $c430,y
$1d:80fd  88			dey
$1d:80fe  01 e2		 ora ($e2,x)
$1d:8100  2b			pld
$1d:8101  04 2d		 tsb $2d
$1d:8103  1e 41 90	  asl $9041,x
$1d:8106  71 a9		 adc ($a9),y
$1d:8108  d0 22		 bne $812c
$1d:810a  42 b2		 wdm #$b2
$1d:810c  3a			dec a
$1d:810d  81 3c		 sta ($3c,x)
$1d:810f  10 22		 bpl $8133
$1d:8111  50 01		 bvc $8114
$1d:8113  82 42 93	  brl $1458
$1d:8116  63 15		 adc $15,s
$1d:8118  0a			asl a
$1d:8119  89 a8 07	  bit #$07a8
$1d:811c  82 77 26	  brl $a796
$1d:811f  08			php
$1d:8120  0f 41 42 0f   ora $0f4241
$1d:8124  71 0f		 adc ($0f),y
$1d:8126  12 88		 ora ($88)
$1d:8128  6d 07 00	  adc $0007
$1d:812b  38			sec
$1d:812c  1a			inc a
$1d:812d  84 c4		 sty $c4
$1d:812f  41 0a		 eor ($0a,x)
$1d:8131  37 93		 and [$93],y
$1d:8133  c5 56		 cmp $56
$1d:8135  02 f1		 cop #$f1
$1d:8137  45 79		 eor $79
$1d:8139  3f 55 e0 67   and $67e055,x
$1d:813d  32 59		 and ($59)
$1d:813f  9b			txy
$1d:8140  c0 5b e8	  cpy #$e85b
$1d:8143  4f 08 46 d6   eor $d64608
$1d:8147  11 94		 ora ($94),y
$1d:8149  84 70		 sty $70
$1d:814b  05 61		 ora $61
$1d:814d  48			pha
$1d:814e  c9 d2 32	  cmp #$32d2
$1d:8151  54 8d 1d	  mvn $1d,$8d
$1d:8154  23 45		 and $45,s
$1d:8156  08			php
$1d:8157  b2 42		 lda ($42)
$1d:8159  36 03		 rol $03,x
$1d:815b  75 e0		 adc $e0,x
$1d:815d  c2 30		 rep #$30
$1d:815f  43 91		 eor $91,s
$1d:8161  14 16		 trb $16
$1d:8163  80 56		 bra $81bb
$1d:8165  38			sec
$1d:8166  48			pha
$1d:8167  46 06		 lsr $06
$1d:8169  91 62		 sta ($62),y
$1d:816b  84 15		 sty $15
$1d:816d  02 e8		 cop #$e8
$1d:816f  51 5b		 eor ($5b),y
$1d:8171  99 44 f0	  sta $f044,y
$1d:8174  64 b1		 stz $b1
$1d:8176  c0 0d c7	  cpy #$c70d
$1d:8179  22 27 5d 08   jsl $085d27
$1d:817d  a4 72		 ldy $72
$1d:817f  06 73		 asl $73
$1d:8181  15 06		 ora $06,x
$1d:8183  d0 56		 bne $81db
$1d:8185  3b			tsc
$1d:8186  12 88		 ora ($88)
$1d:8188  15 c6		 ora $c6,x
$1d:818a  c2 55		 rep #$55
$1d:818c  11 c1		 ora ($c1),y
$1d:818e  11 08		 ora ($08),y
$1d:8190  80 43		 bra $81d5
$1d:8192  82 40 16	  brl $97d5
$1d:8195  92 11		 sta ($11)
$1d:8197  c4 13		 cpy $13
$1d:8199  9f 15 46 39   sta $394615,x
$1d:819d  28			plp
$1d:819e  46 4e		 lsr $4e
$1d:81a0  10 36		 bpl $81d8
$1d:81a2  0d 1a 1c	  ora $1c1a
$1d:81a5  6e 50 84	  ror $8450
$1d:81a8  60			rts
$1d:81a9  94 c8		 sty $c8,x
$1d:81ab  a6 68		 ldx $68
$1d:81ad  c2 64		 rep #$64
$1d:81af  21 98		 and ($98,x)
$1d:81b1  1a			inc a
$1d:81b2  02 63		 cop #$63
$1d:81b4  23 19		 and $19,s
$1d:81b6  d9 61 0a	  cmp $0a61,y
$1d:81b9  26 70		 rol $70
$1d:81bb  02 b1		 cop #$b1
$1d:81bd  07 40		 ora [$40]
$1d:81bf  36 01		 rol $01,x
$1d:81c1  d0 0e		 bne $81d1
$1d:81c3  81 64		 sta ($64,x)
$1d:81c5  03 a0		 ora $a0,s
$1d:81c7  5b			tcd
$1d:81c8  02 c0		 cop #$c0
$1d:81ca  85 82		 sta $82
$1d:81cc  03 3b		 ora $3b,s
$1d:81ce  00 2c		 brk #$2c
$1d:81d0  4d 04 36	  eor $3604
$1d:81d3  0c 88 44	  tsb $4488
$1d:81d6  4e c0 16	  lsr $16c0
$1d:81d9  07 f1		 ora [$f1]
$1d:81db  64 01		 stz $01
$1d:81dd  e6 22		 inc $22
$1d:81df  0c 98 5c	  tsb $5c98
$1d:81e2  c4 00		 cpy $00
$1d:81e4  9a			txs
$1d:81e5  07 a1		 ora [$a1]
$1d:81e7  26 80		 rol $80
$1d:81e9  54 0f c6	  mvn $c6,$0f
$1d:81ec  43 02		 eor $02,s
$1d:81ee  10 80		 bpl $8170
$1d:81f0  80 88		 bra $817a
$1d:81f2  00 71		 brk #$71
$1d:81f4  12 90		 ora ($90)
$1d:81f6  e8			inx
$1d:81f7  40			rti
$1d:81f8  c0 44 02	  cpy #$0244
$1d:81fb  e0 58 67	  cpx #$6758
$1d:81fe  73 25		 adc ($25,s),y
$1d:8200  83 0c		 sta $0c,s
$1d:8202  f8			sed
$1d:8203  50 8e		 bvc $8193
$1d:8205  19 bc f6	  ora $f6bc,y
$1d:8208  67 71		 adc [$71]
$1d:820a  d9 1e c6	  cmp $c61e,y
$1d:820d  e2 7f		 sep #$7f
$1d:820f  12 f1		 ora ($f1)
$1d:8211  3a			dec a
$1d:8212  83 2a		 sta $2a,s
$1d:8214  9f 15 30 69   sta $693015,x
$1d:8218  5d 27 94	  eor $9427,x
$1d:821b  c4 5c		 cpy $5c
$1d:821d  12 e1		 ora ($e1)
$1d:821f  08			php
$1d:8220  4d 11 00	  eor $0011
$1d:8223  8b			phb
$1d:8224  04 40		 tsb $40
$1d:8226  22 81 08 01   jsl $010881
$1d:822a  e4 41		 cpx $41
$1d:822c  60			rts
$1d:822d  7c 10 71	  jmp ($7110,x)
$1d:8230  86 84		 stx $84
$1d:8232  28			plp
$1d:8233  27 e4		 and [$e4]
$1d:8235  11 10		 ora ($10),y
$1d:8237  b8			clv
$1d:8238  48			pha
$1d:8239  20 25 23	  jsr $2325
$1d:823c  80 99		 bra $81d7
$1d:823e  80 56		 bra $8296
$1d:8240  24 10		 bit $10
$1d:8242  15 81		 ora $81,x
$1d:8244  98			tya
$1d:8245  0f 04 26 11   ora $112604
$1d:8249  58			cli
$1d:824a  06 80		 asl $80
$1d:824c  ce 20 e0	  dec $e020
$1d:824f  0d 00 c0	  ora $c000
$1d:8252  00 a0		 brk #$a0
$1d:8254  21 01		 and ($01,x)
$1d:8256  80 19		 bra $8271
$1d:8258  c0 8c		 cpy #$8c
$1d:825a  0d a2 2c	  ora $2ca2
$1d:825d  f6 a8		 inc $a8,x
$1d:825f  b1 4a		 lda ($4a),y
$1d:8261  0a			asl a
$1d:8262  bc de 05	  ldy $05de,x
$1d:8265  47 84		 eor [$84]
$1d:8267  52 21		 eor ($21)
$1d:8269  15 78		 ora $78,x
$1d:826b  45 62		 eor $62
$1d:826d  11 49		 ora ($49),y
$1d:826f  84 52		 sty $52
$1d:8271  a1 15		 lda ($15,x)
$1d:8273  98			tya
$1d:8274  45 6a		 eor $6a
$1d:8276  11 4b		 ora ($4b),y
$1d:8278  84 6b		 sty $6b
$1d:827a  e1 15		 sbc ($15,x)
$1d:827c  b8			clv
$1d:827d  45 70		 eor $70
$1d:827f  82 24 20	  brl $a2a6
$1d:8282  ae 90 47	  ldx $4790
$1d:8285  0f 08 c4 42   ora $42c408
$1d:8289  32 f0		 and ($f0)
$1d:828b  8c c4 23	  sty $23c4
$1d:828e  13 08		 ora ($08,s),y
$1d:8290  c5 42		 cmp $42
$1d:8292  33 30		 and ($30,s),y
$1d:8294  8c d4 23	  sty $23d4
$1d:8297  17 08		 ora [$08],y
$1d:8299  c6 42		 dec $42
$1d:829b  33 70		 and ($70,s),y
$1d:829d  8c e4 23	  sty $23e4
$1d:82a0  1a			inc a
$1d:82a1  41 1c		 eor ($1c,x)
$1d:82a3  ec 20 84	  cpx $8420
$1d:82a6  16 78		 asl $78,x
$1d:82a8  45 a2		 eor $a2
$1d:82aa  11 77		 ora ($77),y
$1d:82ac  84 5e		 sty $5e
$1d:82ae  21 16		 and ($16,x)
$1d:82b0  98			tya
$1d:82b1  45 aa		 eor $aa
$1d:82b3  11 79		 ora ($79),y
$1d:82b5  84 5e		 sty $5e
$1d:82b7  a1 16		 lda ($16,x)
$1d:82b9  b8			clv
$1d:82ba  45 b2		 eor $b2
$1d:82bc  11 7b		 ora ($7b),y
$1d:82be  84 5f		 sty $5f
$1d:82c0  21 16		 and ($16,x)
$1d:82c2  d1 78		 cmp ($78),y
$1d:82c4  df 48 23 a7   cmp $a72348,x
$1d:82c8  84 6a		 sty $6a
$1d:82ca  08			php
$1d:82cb  e7 a9		 sbc [$a9]
$1d:82cd  84 6a		 sty $6a
$1d:82cf  88			dey
$1d:82d0  22 30 0d 5c   jsl $5c0d30
$1d:82d4  23 58		 and $58,s
$1d:82d6  47 34		 eor [$34]
$1d:82d8  e1 12		 sbc ($12,x)
$1d:82da  0a			asl a
$1d:82db  9d 08 a7	  sta $a708,x
$1d:82de  c2 2b		 rep #$2b
$1d:82e0  d0 8a		 bne $826c
$1d:82e2  fc 22 fd	  jsr ($fd22,x)
$1d:82e5  08			php
$1d:82e6  bf c2 31 d0   lda $d031c2,x
$1d:82ea  8c 79 04	  sty $0479
$1d:82ed  6d e9 b3	  adc $b3e9
$1d:82f0  cf 42 33 e4   cmp $e43342
$1d:82f4  72 88		 adc ($88)
$1d:82f6  74 59		 stz $59,x
$1d:82f8  eb			xba
$1d:82f9  d6 6b		 dec $6b,x
$1d:82fb  af 6d be 8a   lda $8abe6d
$1d:82ff  35 d7		 and $d7,x
$1d:8301  f4 3d b9	  pea $b93d
$1d:8304  0f 5e 43 b6   ora $b6435e
$1d:8308  f3 1f		 sbc ($1f,s),y
$1d:830a  ef 43 ac f3   sbc $f3ac43
$1d:830e  1e f3 7c	  asl $7cf3,x
$1d:8311  7b			tdc
$1d:8312  ed f1 f7	  sbc $f7f1
$1d:8315  e4 3d		 cpx $3d
$1d:8317  ef 91 ff be   sbc $beff91
$1d:831b  40			rti
$1d:831c  1a			inc a
$1d:831d  20 81 e8	  jsr $e881
$1d:8320  77 c2		 adc [$c2],y
$1d:8322  23 db		 and $db,s
$1d:8324  0a			asl a
$1d:8325  88			dey
$1d:8326  68			pla
$1d:8327  3d 9d 0f	  and $0f9d,x
$1d:832a  5f 43 b8 19   eor $19b843,x
$1d:832e  17 90		 ora [$90],y
$1d:8330  7b			tdc
$1d:8331  43 22		 eor $22,s
$1d:8333  f4 07 90	  pea $9007
$1d:8336  7b			tdc
$1d:8337  1e 63 dc	  asl $dc63,x
$1d:833a  c8			iny
$1d:833b  77 5f		 adc [$5f],y
$1d:833d  a0 f3		 ldy #$f3
$1d:833f  20 69 64	  jsr $6469
$1d:8342  3f c3 93 03   and $0393c3,x
$1d:8346  03 d0		 ora $d0,s
$1d:8348  02 c8		 cop #$c8
$1d:834a  0c 01 f1	  tsb $f101
$1d:834d  f4 3b dd	  pea $dd3b
$1d:8350  0e e9 6c	  asl $6ce9
$1d:8353  c5 82		 cmp $82
$1d:8355  1f 1f f0 8c   ora $8cf01f,x
$1d:8359  9b			txy
$1d:835a  e3 dc		 sbc $dc,s
$1d:835c  88			dey
$1d:835d  7f a2 1e c6   adc $c61ea2,x
$1d:8361  f9 f7 62	  sbc $62f7,y
$1d:8364  0f e0 3e 08   ora $083ee0
$1d:8368  34 9b		 bit $9b,x
$1d:836a  e3 ff		 sbc $ff,s
$1d:836c  01 95		 ora ($95,x)
$1d:836e  43 bf		 eor $bf,s
$1d:8370  50 ed		 bvc $835f
$1d:8372  d4 11		 pei ($11)
$1d:8374  c0 92		 cpy #$92
$1d:8376  0e f5 40	  asl $40f5
$1d:8379  d4 00		 pei ($00)
$1d:837b  e1 48		 sbc ($48,x)
$1d:837d  8a			txa
$1d:837e  58			cli
$1d:837f  bb			tyx
$1d:8380  b5 0f		 lda $0f,x
$1d:8382  fa			plx
$1d:8383  44 7d 95	  mvp $95,$7d
$1d:8386  0f 5b 7c aa   ora $aa7c5b
$1d:838a  1e d8 82	  asl $82d8,x
$1d:838d  b8			clv
$1d:838e  04 80		 tsb $80
$1d:8390  d8			cld
$1d:8391  01 00		 ora ($00,x)
$1d:8393  27 81		 and [$81]
$1d:8395  fc 09 80	  jsr ($8009,x)
$1d:8398  ec d4 3b	  cpx $3bd4
$1d:839b  00 10		 brk #$10
$1d:839d  42 88		 wdm #$88
$1d:839f  48			pha
$1d:83a0  93 c1		 sta ($c1,s),y
$1d:83a2  ff 4e 88 18   sbc $18884e,x
$1d:83a6  02 00		 cop #$00
$1d:83a8  f8			sed
$1d:83a9  02 e0		 cop #$e0
$1d:83ab  24 83		 bit $83
$1d:83ad  b8			clv
$1d:83ae  a9 44 f9	  lda #$f944
$1d:83b1  ab			plb
$1d:83b2  83 da		 sta $da,s
$1d:83b4  c3 08		 cmp $08,s
$1d:83b6  83 c0		 sta $c0,s
$1d:83b8  3a			dec a
$1d:83b9  2f 30 c8 79   and $79c830
$1d:83bd  fa			plx
$1d:83be  0f 60 eb d4   ora $d4eb60
$1d:83c2  1e c1 f8	  asl $f8c1,x
$1d:83c5  7c 8f 5b	  jmp ($5b8f,x)
$1d:83c8  21 d9		 and ($d9,x)
$1d:83ca  c8			iny
$1d:83cb  7a			ply
$1d:83cc  9f 23 da 7e   sta $7eda23,x
$1d:83d0  83 e4		 sta $e4,s
$1d:83d2  3a			dec a
$1d:83d3  1e a0 68	  asl $68a0,x
$1d:83d6  fe 81 e2	  inc $e281,x
$1d:83d9  00 0e		 brk #$0e
$1d:83db  c9 5c 41	  cmp #$415c
$1d:83de  c1 e7		 cmp ($e7,x)
$1d:83e0  09 9f 9b	  ora #$9b9f
$1d:83e3  21 e8		 and ($e8,x)
$1d:83e5  1f 9f e5 ee   ora $eee59f,x
$1d:83e9  00 31		 brk #$31
$1d:83eb  eb			xba
$1d:83ec  e4 3b		 cpx $3b
$1d:83ee  00 51		 brk #$51
$1d:83f0  02 00		 cop #$00
$1d:83f2  78			sei
$1d:83f3  9e c0 38	  stz $38c0,x
$1d:83f6  4f 50 0c 42   eor $420c50
$1d:83fa  c1 ea		 cmp ($ea,x)
$1d:83fc  15 8f		 ora $8f,x
$1d:83fe  68			pla
$1d:83ff  3a			dec a
$1d:8400  60			rts
$1d:8401  e0 0e		 cpx #$0e
$1d:8403  07 e4		 ora [$e4]
$1d:8405  36 3d		 rol $3d,x
$1d:8407  81 59		 sta ($59,x)
$1d:8409  08			php
$1d:840a  40			rti
$1d:840b  4e 01 51	  lsr $5101
$1d:840e  eb			xba
$1d:840f  44 0d c1	  mvp $c1,$0d
$1d:8412  d7 88		 cmp [$88],y
$1d:8414  79 a2 1e	  adc $1ea2,y
$1d:8417  73 78		 adc ($78,s),y
$1d:8419  9b			txy
$1d:841a  81 8c		 sta ($8c,x)
$1d:841c  0f 00 fc bc   ora $bcfc00
$1d:8420  40			rti
$1d:8421  7e 46 f1	  ror $f146,x
$1d:8424  ed 1b c4	  sbc $c41b
$1d:8427  24 1f		 bit $1f
$1d:8429  aa			tax
$1d:842a  83 40		 sta $40,s
$1d:842c  02 40		 cop #$40
$1d:842e  d0 06		 bne $8436
$1d:8430  20 8f c9	  jsr $c98f
$1d:8433  22 29 63 a8   jsl $a86329
$1d:8437  3f 01 a0 02   and $02a001,x
$1d:843b  20 18 01	  jsr $0118
$1d:843e  40			rti
$1d:843f  1e 80 12	  asl $1280,x
$1d:8442  18			clc
$1d:8443  80 58		 bra $849d
$1d:8445  4e a0 b5	  lsr $b5a0
$1d:8448  14 60		 trb $60
$1d:844a  3c 00 00	  bit $0000,x
$1d:844d  2b			pld
$1d:844e  73 09		 adc ($09,s),y
$1d:8450  12 78		 ora ($78)
$1d:8452  3b			tsc
$1d:8453  4f d0 49 8b   eor $8b49d0
$1d:8457  48			pha
$1d:8458  12 46		 ora ($46)
$1d:845a  9d 17 e0	  sta $e017,x
$1d:845d  aa			tax
$1d:845e  c5 40		 cmp $40
$1d:8460  47 40		 eor [$40]
$1d:8462  f4 25 c1	  pea $c125
$1d:8465  02 03		 cop #$03
$1d:8467  73 f2		 adc ($f2,s),y
$1d:8469  f4 20 19	  pea $1920
$1d:846c  0e ab e4	  asl $e4ab
$1d:846f  7e 79 07	  ror $0779,x
$1d:8472  d0 74		 bne $84e8
$1d:8474  72 1d		 adc ($1d)
$1d:8476  47 b8		 eor [$b8]
$1d:8478  00 47		 brk #$47
$1d:847a  ea			nop
$1d:847b  01 18		 ora ($18,x)
$1d:847d  07 40		 ora [$40]
$1d:847f  10 3d		 bpl $84be
$1d:8481  0e a8 3c	  asl $3ca8
$1d:8484  7e 7d 0e	  ror $0e7d,x
$1d:8487  a1 04		 lda ($04,x)
$1d:8489  42 01		 wdm #$01
$1d:848b  e2 07		 sep #$07
$1d:848d  8f 4b a1 e1   sta $e1a14b
$1d:8491  c8			iny
$1d:8492  78			sei
$1d:8493  c7 e6		 cmp [$e6]
$1d:8495  28			plp
$1d:8496  01 10		 ora ($10,x)
$1d:8498  07 83		 ora [$83]
$1d:849a  a5 90		 lda $90
$1d:849c  e9 81 44	  sbc #$4481
$1d:849f  3c 01 e1	  bit $e101,x
$1d:84a2  00 8f		 brk #$8f
$1d:84a4  d0 72		 bne $8518
$1d:84a6  60			rts
$1d:84a7  80 0f		 bra $84b8
$1d:84a9  03 f0		 ora $f0,s
$1d:84ab  1f 00 ce 0f   ora $0fce00,x
$1d:84af  a8			tay
$1d:84b0  74 81		 stz $81,x
$1d:84b2  e2 1c		 sep #$1c
$1d:84b4  0e 99 6c	  asl $6c99
$1d:84b7  d9 c2 21	  cmp $21c2,y
$1d:84ba  0e 87 d0	  asl $d087
$1d:84bd  4a			lsr a
$1d:84be  3d 18 81	  and $8118,x
$1d:84c1  b8			clv
$1d:84c2  3a			dec a
$1d:84c3  51 0f		 eor ($0f),y
$1d:84c5  a4 43		 ldy $43
$1d:84c7  c4 6f		 cpy $6f
$1d:84c9  13 70		 ora ($70,s),y
$1d:84cb  74 e2		 stz $e2,x
$1d:84cd  1d 43 d9	  ora $d943,x
$1d:84d0  03 48		 ora $48,s
$1d:84d2  de 3f 53	  dec $533f,x
$1d:84d5  78			sei
$1d:84d6  f9 6a 1d	  sbc $1d6a,y
$1d:84d9  56 98		 lsr $98,x
$1d:84db  a3 81		 lda $81,s
$1d:84dd  a8			tay
$1d:84de  1d 4a 81	  ora $814a,x
$1d:84e1  10 01		 bpl $84e4
$1d:84e3  c2 d3		 rep #$d3
$1d:84e5  14 b1		 trb $b1
$1d:84e7  74 ea		 stz $ea,x
$1d:84e9  1f 56 98 f8   ora $f89856,x
$1d:84ed  aa			tax
$1d:84ee  1e 17 79	  asl $7917,x
$1d:84f1  1e cd 10	  asl $10cd,x
$1d:84f4  1d 54 59	  ora $5954,x
$1d:84f7  1b			tcs
$1d:84f8  c4 fc		 cpy $fc
$1d:84fa  00 01		 brk #$01
$1d:84fc  5c 82 14 41   jml $411482
$1d:8500  04 9e		 tsb $9e
$1d:8502  0f aa 74 42   ora $4274aa
$1d:8506  44 08 14	  mvp $14,$08
$1d:8509  98			tya
$1d:850a  ac 05 46	  ldy $4605
$1d:850d  6a			ror a
$1d:850e  02 f0		 cop #$f0
$1d:8510  c4 3c		 cpy $3c
$1d:8512  60			rts
$1d:8513  00 08		 brk #$08
$1d:8515  81 40		 sta ($40,x)
$1d:8517  1d e9 10	  ora $10e9,x
$1d:851a  88			dey
$1d:851b  bd d6 02	  lda $02d6,x
$1d:851e  ff 17 c2 e4   sbc $e4c217,x
$1d:8522  20 20 b0	  jsr $b020
$1d:8525  7b			tdc
$1d:8526  8c 48 1e	  sty $1e48
$1d:8529  55 00		 eor $00,x
$1d:852b  90 85		 bcc $84b2
$1d:852d  ce 04 ff	  dec $ff04
$1d:8530  00 b9		 brk #$b9
$1d:8532  3f c4 40 01   and $0140c4,x
$1d:8536  46 91		 lsr $91
$1d:8538  03 50		 ora $50,s
$1d:853a  1a			inc a
$1d:853b  32 28		 and ($28)
$1d:853d  84 0e		 sty $0e
$1d:853f  21 04		 and ($04,x)
$1d:8541  88			dey
$1d:8542  44 e2 11	  mvp $11,$e2
$1d:8545  42 19		 wdm #$19
$1d:8547  90 08		 bcc $8551
$1d:8549  84 04		 sty $04
$1d:854b  00 23		 brk #$23
$1d:854d  21 10		 and ($10,x)
$1d:854f  0a			asl a
$1d:8550  04 f8		 tsb $f8
$1d:8552  09 0b dc	  ora #$dc0b
$1d:8555  64 65		 stz $65
$1d:8557  f5 31		 sbc $31,x
$1d:8559  13 e0		 ora ($e0,s),y
$1d:855b  8d c8 6e	  sta $6ec8
$1d:855e  83 52		 sta $52,s
$1d:8560  21 10		 and ($10,x)
$1d:8562  10 46		 bpl $85aa
$1d:8564  63 1d		 adc $1d,s
$1d:8566  98			tya
$1d:8567  40			rti
$1d:8568  8c 40 16	  sty $1640
$1d:856b  69 0c 63	  adc #$630c
$1d:856e  e8			inx
$1d:856f  17 08		 ora [$08],y
$1d:8571  c7 d8		 cmp [$d8]
$1d:8573  66 0e		 ror $0e
$1d:8575  f0 8f		 beq $8506
$1d:8577  57 b3		 eor [$b3],y
$1d:8579  d4 ce		 pei ($ce)
$1d:857b  f4 ad de	  pea $dead
$1d:857e  54 28 05	  mvn $05,$28
$1d:8581  7a			ply
$1d:8582  1b			tcs
$1d:8583  18			clc
$1d:8584  fe 87 c1	  inc $c187,x
$1d:8587  5e 59 ca	  lsr $ca59,x
$1d:858a  67 72		 adc [$72]
$1d:858c  56 c7		 lsr $c7,x
$1d:858e  0c c7 d6	  tsb $d6c7
$1d:8591  35 f6		 and $f6,x
$1d:8593  89 49 e3	  bit #$e349
$1d:8596  d4 c8		 pei ($c8)
$1d:8598  f5 35		 sbc $35,x
$1d:859a  5e 0d f3	  lsr $f30d,x
$1d:859d  fa			plx
$1d:859e  af c9 7e 51   lda $517ec9
$1d:85a2  e8			inx
$1d:85a3  74 7a		 stz $7a,x
$1d:85a5  1f 1e 79 84   ora $84791e,x
$1d:85a9  7d 7e 0c	  adc $0c7e,x
$1d:85ac  50 5b		 bvc $8609
$1d:85ae  8d 39 76	  sta $7639
$1d:85b1  19 ea 6d	  ora $6dea,y
$1d:85b4  4a			lsr a
$1d:85b5  05 12		 ora $12
$1d:85b7  80 bf		 bra $8578
$1d:85b9  c8			iny
$1d:85ba  0a			asl a
$1d:85bb  00 57		 brk #$57
$1d:85bd  81 47		 sta ($47,x)
$1d:85bf  9f 45 4f 75   sta $754f45,x
$1d:85c3  9d 79 f6	  sta $f679,x
$1d:85c6  51 ea		 eor ($ea),y
$1d:85c8  f8			sed
$1d:85c9  65 17		 adc $17
$1d:85cb  64 0b		 stz $0b
$1d:85cd  45 e8		 eor $e8
$1d:85cf  00 c9		 brk #$c9
$1d:85d1  4e 44 15	  lsr $1544
$1d:85d4  20 1e 7a	  jsr $7a1e
$1d:85d7  56 11		 lsr $11,x
$1d:85d9  42 7a		 wdm #$7a
$1d:85db  83 02		 sta $02,s
$1d:85dd  40			rti
$1d:85de  a8			tay
$1d:85df  06 d8		 asl $d8
$1d:85e1  57 86		 eor [$86],y
$1d:85e3  40			rti
$1d:85e4  60			rts
$1d:85e5  29 5b 74	  and #$745b
$1d:85e8  03 e9		 ora $e9,s
$1d:85ea  de 86 97	  dec $9786,x
$1d:85ed  d1 ba		 cmp ($ba),y
$1d:85ef  02 72		 cop #$72
$1d:85f1  cf 3e 84 82   cmp $82843e
$1d:85f5  34 5c		 bit $5c,x
$1d:85f7  84 05		 sty $05
$1d:85f9  16 08		 asl $08,x
$1d:85fb  90 54		 bcc $8651
$1d:85fd  82 2c c9	  brl $4f2c
$1d:8600  04 90		 tsb $90
$1d:8602  08			php
$1d:8603  90 fc		 bcc $8601
$1d:8605  68			pla
$1d:8606  a3 f2		 lda $f2,s
$1d:8608  89 64 82	  bit #$8264
$1d:860b  a1 12		 lda ($12,x)
$1d:860d  d1 44		 cmp ($44),y
$1d:860f  a2 51 4a	  ldx #$4a51
$1d:8612  cd 52 b2	  cmp $b252
$1d:8615  af 28 c7 21   lda $21c728
$1d:8619  6e 11 4b	  ror $4b11
$1d:861c  4d 52 d2	  eor $d252
$1d:861f  e7 68		 sbc [$68]
$1d:8621  82 38 11	  brl $975c
$1d:8624  c1 21		 cmp ($21,x)
$1d:8626  65 8a		 adc $8a
$1d:8628  20 20 91	  jsr $9120
$1d:862b  08			php
$1d:862c  9c 42 28	  stz $2842
$1d:862f  d3 14		 cmp ($14,s),y
$1d:8631  40			rti
$1d:8632  40			rti
$1d:8633  da			phx
$1d:8634  22 d2 06 e0   jsl $e006d2
$1d:8638  22 01 a8 8d   jsl $8da801
$1d:863c  20 88 c5	  jsr $c588
$1d:863f  a6 11		 ldx $11
$1d:8641  69 8c 5a	  adc #$5a8c
$1d:8644  81 16		 sta ($16,x)
$1d:8646  a0 c4 ba	  ldy #$bac4
$1d:8649  11 2e		 ora ($2e),y
$1d:864b  8c 4b c1	  sty $c14b
$1d:864e  12 f0		 ora ($f0)
$1d:8650  d4 20		 pei ($20)
$1d:8652  4c 70 1f	  jmp $1f70
$1d:8655  86 42		 stx $42
$1d:8657  46 41		 lsr $41
$1d:8659  59 b9 04	  eor $04b9,y
$1d:865c  e7 08		 sbc [$08]
$1d:865e  70 1f		 bvs $867f
$1d:8660  8c 86 a1	  sty $a186
$1d:8663  22 66 9b 30   jsl $309b66
$1d:8667  6a			ror a
$1d:8668  12 66		 ora ($66)
$1d:866a  59 b3 0a	  eor $0ab3,y
$1d:866d  65 10		 adc $10
$1d:866f  99 c4 28	  sta $28c4,y
$1d:8672  51 0a		 eor ($0a),y
$1d:8674  20 bc e6	  jsr $e6bc
$1d:8677  83 57		 sta $57,s
$1d:8679  a1 8b		 lda ($8b,x)
$1d:867b  d6 87		 dec $87,x
$1d:867d  12 d8		 ora ($d8)
$1d:867f  44 b6 31	  mvp $31,$b6
$1d:8682  2e 04 4a	  rol $4a04
$1d:8685  c3 12		 cmp $12,s
$1d:8687  d9 44 b6	  cmp $b644,y
$1d:868a  71 2b		 adc ($2b),y
$1d:868c  14 4b		 trb $4b
$1d:868e  86 9e		 stx $9e
$1d:8690  1a			inc a
$1d:8691  8c 4a c0	  sty $c04a
$1d:8694  55 1a		 eor $1a,x
$1d:8696  94 4a		 sty $4a,x
$1d:8698  a6 5b		 ldx $5b
$1d:869a  1b			tcs
$1d:869b  18			clc
$1d:869c  bc 47 80	  ldy $8047,x
$1d:869f  34 21		 bit $21,x
$1d:86a1  b0 0f		 bcs $86b2
$1d:86a3  00 78		 brk #$78
$1d:86a5  43 60		 eor $60,s
$1d:86a7  21 20		 and ($20,x)
$1d:86a9  d8			cld
$1d:86aa  26 c3		 rol $c3
$1d:86ac  b1 a3		 lda ($a3),y
$1d:86ae  44 b6 91	  mvp $91,$b6
$1d:86b1  2b			pld
$1d:86b2  8c 4b 89	  sty $894b
$1d:86b5  12 da		 ora ($da)
$1d:86b7  c4 ae		 cpy $ae
$1d:86b9  51 2d		 eor ($2d),y
$1d:86bb  bc 4b 6d	  ldy $6d4b,x
$1d:86be  12 e3		 ora ($e3)
$1d:86c0  c4 ae		 cpy $ae
$1d:86c2  09 11 c0	  ora #$c011
$1d:86c5  44 b0 29	  mvp $29,$b0
$1d:86c8  71 b9		 adc ($b9),y
$1d:86ca  c4 b0		 cpy $b0
$1d:86cc  51 2c		 eor ($2c),y
$1d:86ce  19 bd 50	  ora $50bd,y
$1d:86d1  c4 b2		 cpy $b2
$1d:86d3  62 51 a1	  per $2827
$1d:86d6  d7 27		 cmp [$27],y
$1d:86d8  12 67		 ora ($67)
$1d:86da  07 4a		 ora [$4a]
$1d:86dc  25 a3		 and $a3
$1d:86de  89 78 a2	  bit #$a278
$1d:86e1  5d 38 94	  eor $9438,x
$1d:86e4  d6 25		 dec $25,x
$1d:86e6  e3 89		 sbc $89,s
$1d:86e8  51 00		 eor ($00),y
$1d:86ea  81 12		 sta ($12,x)
$1d:86ec  c8			iny
$1d:86ed  c4 b4		 cpy $b4
$1d:86ef  11 2d		 ora ($2d),y
$1d:86f1  0c 4b 25	  tsb $254b
$1d:86f4  52 91		 eor ($91)
$1d:86f6  c4 b4		 cpy $b4
$1d:86f8  51 20		 eor ($20),y
$1d:86fa  90 1c		 bcc $8718
$1d:86fc  08			php
$1d:86fd  f9 07 64	  sbc $6407,y
$1d:8700  3a			dec a
$1d:8701  41 18		 eor ($18,x)
$1d:8703  1d c0 10	  ora $10c0,x
$1d:8706  1c 84 8c	  trb $8c84
$1d:8709  c0 01 30	  cpy #$3001
$1d:870c  09 91 7c	  ora #$7c91
$1d:870f  4a			lsr a
$1d:8710  40			rti
$1d:8711  64 22		 stz $22
$1d:8713  c0 1a 8e	  cpy #$8e1a
$1d:8716  29 d4 8a	  and #$8ad4
$1d:8719  75 45		 adc $45,x
$1d:871b  e7 e4		 sbc [$e4]
$1d:871d  1b			tcs
$1d:871e  8f 94 76 01   sta $017694
$1d:8722  92 0c		 sta ($0c)
$1d:8724  84 52		 sty $52
$1d:8726  48			pha
$1d:8727  41 68		 eor ($68,x)
$1d:8729  96 54		 stx $54,y
$1d:872b  42 3a		 wdm #$3a
$1d:872d  58			cli
$1d:872e  90 98		 bcc $86c8
$1d:8730  b2 82		 lda ($82)
$1d:8732  b1 d2		 lda ($d2),y
$1d:8734  44 94 08	  mvp $08,$94
$1d:8737  96 25		 stx $25,y
$1d:8739  50 27		 bvc $8762
$1d:873b  03 06		 ora $06,s
$1d:873d  17 19		 ora [$19],y
$1d:873f  08			php
$1d:8740  5c 42 c6 6f   jml $6fc642
$1d:8744  22 1d 06 48   jsl $48061d
$1d:8748  9e 35 12	  stz $1235,x
$1d:874b  99 d4 8b	  sta $8bd4,y
$1d:874e  2b			pld
$1d:874f  b4 30		 ldy $30,x
$1d:8751  8f 12 25 81   sta $812512
$1d:8755  33 8e		 and ($8e,s),y
$1d:8757  de 25 82	  dec $8225,x
$1d:875a  89 71 c0	  bit #$c071
$1d:875d  eb			xba
$1d:875e  46 77		 lsr $77
$1d:8760  8c d8 06	  sty $06d8
$1d:8763  2b			pld
$1d:8764  62 c9 80	  per $0830
$1d:8767  c4 1c		 cpy $1c
$1d:8769  00 60		 brk #$60
$1d:876b  5d 32 e8	  eor $e832,x
$1d:876e  16 88		 asl $88,x
$1d:8770  b2 38		 lda ($38)
$1d:8772  96 4a		 stx $4a,y
$1d:8774  a4 1e		 ldy $1e
$1d:8776  0d 16 4a	  ora $4a16
$1d:8779  03 12		 ora $12,s
$1d:877b  ec 44 bb	  cpx $bb44
$1d:877e  31 2f		 and ($2f),y
$1d:8780  44 4b d3	  mvp $d3,$4b
$1d:8783  92 93		 sta ($93)
$1d:8785  c4 b2		 cpy $b2
$1d:8787  31 27		 and ($27),y
$1d:8789  80 68		 bra $87f3
$1d:878b  62 5d 38	  per $bfeb
$1d:878e  94 da		 sty $da,x
$1d:8790  25 e3		 and $e3
$1d:8792  89 30 80	  bit #$8030
$1d:8795  24 21		 bit $21
$1d:8797  91 a2		 sta ($a2),y
$1d:8799  80 7c		 bra $8817
$1d:879b  18			clc
$1d:879c  84 e0		 sty $e0
$1d:879e  c9 44 a4	  cmp #$a444
$1d:87a1  2e 30 89	  rol $8930
$1d:87a4  1d 87 21	  ora $2187,x
$1d:87a7  23 23		 and $23,s
$1d:87a9  89 f8 26	  bit #$26f8
$1d:87ac  f1 09		 sbc ($09),y
$1d:87ae  c0 c4 46	  cpy #$46c4
$1d:87b1  00 30		 brk #$30
$1d:87b3  08			php
$1d:87b4  90 c4		 bcc $877a
$1d:87b6  62 46 f1	  per $78ff
$1d:87b9  9c 1b c6	  stz $c61b
$1d:87bc  6e 3f 39	  ror $393f
$1d:87bf  16 42		 asl $42,x
$1d:87c1  02 2f		 cop #$2f
$1d:87c3  22 68 13 4c   jsl $4c1368
$1d:87c7  50 04		 bvc $87cd
$1d:87c9  e0 91 0f	  cpx #$0f91
$1d:87cc  c8			iny
$1d:87cd  67 24		 adc [$24]
$1d:87cf  62 1f 11	  per $98f1
$1d:87d2  c9 86 01	  cmp #$0186
$1d:87d5  54 88 55	  mvn $55,$88
$1d:87d8  62 16 48	  per $cff1
$1d:87db  85 94		 sta $94
$1d:87dd  5e b7 41	  lsr $41b7,x
$1d:87e0  79 e1 06	  adc $06e1,y
$1d:87e3  a6 8e		 ldx $8e
$1d:87e5  01 a1		 ora ($a1,x)
$1d:87e7  25 00		 and $00
$1d:87e9  64 8a		 stz $8a
$1d:87eb  04 4d		 tsb $4d
$1d:87ed  02 08		 cop #$08
$1d:87ef  06 41		 asl $41
$1d:87f1  75 40		 adc $40,x
$1d:87f3  89 f8 90	  bit #$90f8
$1d:87f6  01 85		 ora ($85,x)
$1d:87f8  5e 8a 18	  lsr $188a,x
$1d:87fb  10 c4		 bpl $87c1
$1d:87fd  84 05		 sty $05
$1d:87ff  a0 4e 10	  ldy #$104e
$1d:8802  62 80 05	  per $8d85
$1d:8805  a0 21 01	  ldy #$0121
$1d:8808  7c 48 20	  jmp ($2048,x)
$1d:880b  5a			phy
$1d:880c  02 18		 cop #$18
$1d:880e  10 04		 bpl $8814
$1d:8810  b4 05		 ldy $05,x
$1d:8812  f1 34		 sbc ($34),y
$1d:8814  89 0c 1d	  bit #$1d0c
$1d:8817  b8			clv
$1d:8818  87 72		 sta [$72]
$1d:881a  21 eb		 and ($eb,x)
$1d:881c  88			dey
$1d:881d  7b			tdc
$1d:881e  22 1d d7 78   jsl $78d71d
$1d:8822  fb			xce
$1d:8823  5e 62 f2	  lsr $f262,x
$1d:8826  07 c0		 ora [$c0]
$1d:8828  3d 81 f8	  and $f881,x
$1d:882b  03 02		 ora $02,s
$1d:882d  01 10		 ora ($10,x)
$1d:882f  c0 3d 4c	  cpy #$4c3d
$1d:8832  b1 a3		 lda ($a3),y
$1d:8834  8b			phb
$1d:8835  c6 90		 dec $90
$1d:8837  53 1e		 eor ($1e,s),y
$1d:8839  d3 9c		 cmp ($9c,s),y
$1d:883b  dc 84 f2	  jml [$f284]
$1d:883e  06 60		 asl $60
$1d:8840  01 09		 ora ($09,x)
$1d:8842  04 0f		 tsb $0f
$1d:8844  00 5a		 brk #$5a
$1d:8846  13 c8		 ora ($c8,s),y
$1d:8848  17 54		 ora [$54],y
$1d:884a  fc 06 41	  jsr ($4106,x)
$1d:884d  3d 01 08	  and $0801,x
$1d:8850  00 81		 brk #$81
$1d:8852  a8			tay
$1d:8853  3e 00 10	  rol $1000,x
$1d:8856  04 60		 tsb $60
$1d:8858  51 20		 eor ($20),y
$1d:885a  20 1e 80	  jsr $801e
$1d:885d  5c 44 50 d4   jml $d45044
$1d:8861  3d 91 e8	  and $e891,x
$1d:8864  74 7a		 stz $7a,x
$1d:8866  5f 1e 39 84   eor $84391e,x
$1d:886a  2f 3d 2c cf   and $cf2c3d
$1d:886e  4b			phk
$1d:886f  6a			ror a
$1d:8870  50 28		 bvc $889a
$1d:8872  94 04		 sty $04,x
$1d:8874  ee 47 d0	  inc $d047
$1d:8877  3e bc 0a	  rol $0abc,x
$1d:887a  3d 2e 8f	  and $8f2e,x
$1d:887d  43 e3		 eor $e3,s
$1d:887f  d0 c8		 bne $8849
$1d:8881  f4 7c de	  pea $de7c
$1d:8884  31 b3		 and ($b3),y
$1d:8886  98			tya
$1d:8887  cf e2 52 08   cmp $0852e2
$1d:888b  94 42		 sty $42,x
$1d:888d  3d 2c 8f	  and $8f2c,x
$1d:8890  4b			phk
$1d:8891  63 d1		 adc $d1,s
$1d:8893  c4 88		 cpy $88
$1d:8895  cf 92 a0 77   cmp $77a092
$1d:8899  0e f4 ad	  asl $adf4
$1d:889c  06 8b		 asl $8b
$1d:889e  10 3d		 bpl $88dd
$1d:88a0  92 5d		 sta ($5d)
$1d:88a2  61 6a		 adc ($6a,x)
$1d:88a4  73 4a		 adc ($4a,s),y
$1d:88a6  0e 7a 56	  asl $567a
$1d:88a9  89 46 7a	  bit #$7a46
$1d:88ac  a1 01		 lda ($01,x)
$1d:88ae  40			rti
$1d:88af  75 e5		 adc $e5,x
$1d:88b1  90 28		 bcc $88db
$1d:88b3  0a			asl a
$1d:88b4  56 a5		 lsr $a5,x
$1d:88b6  08			php
$1d:88b7  c7 21		 cmp [$21]
$1d:88b9  de 72 9a	  dec $9a72,x
$1d:88bc  d4 f6		 pei ($f6)
$1d:88be  35 3d		 and $3d,x
$1d:88c0  3d 93 dc	  and $dc93,x
$1d:88c3  90 64		 bcc $8929
$1d:88c5  ff 58 13 bc   sbc $bc1358,x
$1d:88c9  e5 4e		 sbc $4e
$1d:88cb  f3 9c		 sbc ($9c,s),y
$1d:88cd  bb			tyx
$1d:88ce  c9 3e 51	  cmp #$513e
$1d:88d1  a9 e5 6a	  lda #$6ae5
$1d:88d4  79 18 9d	  adc $9d18,y
$1d:88d7  3b			tsc
$1d:88d8  d1 ee		 cmp ($ee),y
$1d:88da  1d a9 d8	  ora $d8a9,x
$1d:88dd  0d 06 20	  ora $2006
$1d:88e0  bb			tyx
$1d:88e1  27 78		 and [$78]
$1d:88e3  46 83		 lsr $83
$1d:88e5  43 1a		 eor $1a,s
$1d:88e7  94 c6		 sty $c6,x
$1d:88e9  85 03		 sta $03
$1d:88eb  1a			inc a
$1d:88ec  0a			asl a
$1d:88ed  0e 6a 77	  asl $776a
$1d:88f0  da			phx
$1d:88f1  9e 22 c8	  stz $c822,x
$1d:88f4  9e ad e3	  stz $e3ad,x
$1d:88f7  11 88		 ora ($88),y
$1d:88f9  c8			iny
$1d:88fa  04 05		 tsb $05
$1d:88fc  3b			tsc
$1d:88fd  12 88		 ora ($88)
$1d:88ff  60			rts
$1d:8900  35 0e		 and $0e,x
$1d:8902  f1 dc		 sbc ($dc),y
$1d:8904  46 27		 lsr $27
$1d:8906  95 83		 sta $83,x
$1d:8908  71 3c		 adc ($3c),y
$1d:890a  0f 31 3c ec   ora $ec3c31
$1d:890e  4f 23 57 e8   eor $e85723
$1d:8912  d5 fe		 cmp $fe,x
$1d:8914  35 8e		 and $8e,x
$1d:8916  8d 63 e3	  sta $e363
$1d:8919  19 83 db	  ora $db83,y
$1d:891c  3b			tsc
$1d:891d  cf 31 50 74   cmp $745031
$1d:8921  84 4a		 sty $4a
$1d:8923  a1 22		 lda ($22,x)
$1d:8925  88			dey
$1d:8926  48			pha
$1d:8927  9c 60 ed	  stz $ed60
$1d:892a  06 18		 asl $18
$1d:892c  c7 ea		 cmp [$ea]
$1d:892e  10 28		 bpl $8958
$1d:8930  82 c0 27	  brl $b0f3
$1d:8933  11 09		 ora ($09),y
$1d:8935  bc 7a 1d	  ldy $1d7a,x
$1d:8938  1e 87 e7	  asl $e787,x
$1d:893b  a5 8d		 lda $8d
$1d:893d  10 8f		 bpl $88ce
$1d:893f  53 23		 eor ($23,s),y
$1d:8941  d4 d8		 pei ($d8)
$1d:8943  14 01		 trb $01
$1d:8945  86 0b		 stx $0b
$1d:8947  50 59		 bvc $89a2
$1d:8949  8a			txa
$1d:894a  d0 29		 bne $8975
$1d:894c  4c 71 a4	  jmp $a471
$1d:894f  2c c6 92	  bit $92c6
$1d:8952  cf 5a 3b 0c   cmp $0c3b5a
$1d:8956  98			tya
$1d:8957  67 47		 adc [$47]
$1d:8959  68			pla
$1d:895a  8b			phb
$1d:895b  48			pha
$1d:895c  1b			tcs
$1d:895d  d1 03		 cmp ($03),y
$1d:895f  88			dey
$1d:8960  47 62		 eor [$62]
$1d:8962  11 37		 ora ($37),y
$1d:8964  c8			iny
$1d:8965  54 1f 41	  mvn $41,$1f
$1d:8968  04 7f		 tsb $7f
$1d:896a  8c 52 21	  sty $2152
$1d:896d  01 03		 ora ($03,x)
$1d:896f  8b			phb
$1d:8970  f0 00		 beq $8972
$1d:8972  c0 f8 08	  cpy #$08f8
$1d:8975  26 42		 rol $42
$1d:8977  02 13		 cop #$13
$1d:8979  06 39		 asl $39
$1d:897b  05 46		 ora $46
$1d:897d  8f 18 ad 07   sta $07ad18
$1d:8981  d1 8e		 cmp ($8e),y
$1d:8983  31 2c		 and ($2c),y
$1d:8985  83 a0		 sta $a0,s
$1d:8987  24 51		 bit $51
$1d:8989  ad f4 6b	  lda $6bf4
$1d:898c  7f 1a e7 46   adc $46e71a,x
$1d:8990  b9 eb 50	  lda $50eb,y
$1d:8993  8a			txa
$1d:8994  75 96		 adc $96,x
$1d:8996  61 14		 adc ($14,x)
$1d:8998  f3 45		 sbc ($45,s),y
$1d:899a  3a			dec a
$1d:899b  e3 b1		 sbc $b1,s
$1d:899d  f3 b1		 sbc ($b1,s),y
$1d:899f  c4 70		 cpy $70
$1d:89a1  1c 92 48	  trb $4892
$1d:89a4  11 c9		 ora ($c9),y
$1d:89a6  92 44		 sta ($44)
$1d:89a8  92 1f		 sta ($1f)
$1d:89aa  80 f4		 bra $89a0
$1d:89ac  7c e3 90	  jmp ($90e3,x)
$1d:89af  24 89		 bit $89
$1d:89b1  71 0b		 adc ($0b),y
$1d:89b3  40			rti
$1d:89b4  4a			lsr a
$1d:89b5  0f 3c 6b bd   ora $bd6b3c
$1d:89b9  1a			inc a
$1d:89ba  ef c6 bd d1   sbc $d1bdc6
$1d:89be  af 7c 5b 3d   lda $3d5b7c
$1d:89c2  16 cf		 asl $cf,x
$1d:89c4  c5 b5		 cmp $b5
$1d:89c6  d1 6d		 cmp ($6d),y
$1d:89c8  79 9c cb	  adc $cb9c,y
$1d:89cb  82 99 34	  brl $be67
$1d:89ce  40			rti
$1d:89cf  93 d0		 sta ($d0,s),y
$1d:89d1  8a			txa
$1d:89d2  45 32		 eor $32
$1d:89d4  22 a2 4d 8a   jsl $8a4da2
$1d:89d8  65 04		 adc $04
$1d:89da  fd d1 3f	  sbc $3fd1,x
$1d:89dd  78			sei
$1d:89de  4f df 13 f7   eor $f713df
$1d:89e2  0c ff 53	  tsb $53ff
$1d:89e5  3f d8 cf f7   and $f7cfd8,x
$1d:89e9  33 fc		 and ($fc,s),y
$1d:89eb  df 68 37 de   cmp $de3768,x
$1d:89ef  8d f7 83	  sta $83f7
$1d:89f2  7e 28 df	  ror $df28,x
$1d:89f5  88			dey
$1d:89f6  37 e6		 and [$e6],y
$1d:89f8  8d f9 83	  sta $83f9
$1d:89fb  7e a8 df	  ror $dfa8,x
$1d:89fe  a8			tay
$1d:89ff  27 fe		 and [$fe]
$1d:8a01  89 ff c2	  bit #$c2ff
$1d:8a04  7f f8 9f f8   adc $f89ff8,x
$1d:8a08  27 f2		 and [$f2]
$1d:8a0a  89 fc c2	  bit #$c2fc
$1d:8a0d  7f 38 9f c5   adc $c59f38,x
$1d:8a11  7b			tdc
$1d:8a12  00 a0		 brk #$a0
$1d:8a14  0d af 4e	  ora $4eaf
$1d:8a17  2d 13 8b	  and $8b13
$1d:8a1a  94 e3		 sty $e3,x
$1d:8a1c  59 38 e7	  eor $e738,y
$1d:8a1f  4e 26 13	  lsr $1326
$1d:8a22  9c 94 e7	  stz $e794
$1d:8a25  e9 39 ab	  sbc #$ab39
$1d:8a28  4e b4 13	  lsr $13b4
$1d:8a2b  af 94 ea 89   lda $89ea94
$1d:8a2f  3b			tsc
$1d:8a30  cb			wai
$1d:8a31  4e f5 13	  lsr $13f5
$1d:8a34  bd d4 ef	  lda $efd4,x
$1d:8a37  99 3b eb	  sta $eb3b,y
$1d:8a3a  4e fc 13	  lsr $13fc
$1d:8a3d  bf 54 ef f9   lda $f9ef54,x
$1d:8a41  3b			tsc
$1d:8a42  87 4f		 sta [$4f]
$1d:8a44  24 13		 bit $13
$1d:8a46  c9 54 f2	  cmp #$f254
$1d:8a49  69 3c 9f	  adc #$9f3c
$1d:8a4c  4f 2c 13 cb   eor $cb132c
$1d:8a50  54 f3 19	  mvn $19,$f3
$1d:8a53  3c cb 4f	  bit $4fcb,x
$1d:8a56  37 13		 and [$13],y
$1d:8a58  ce 14 f3	  dec $f314
$1d:8a5b  b9 3c fb	  lda $fb3c,y
$1d:8a5e  4f 22 13 d9   eor $d91322
$1d:8a62  54 f6 99	  mvn $99,$f6
$1d:8a65  3d ef 4f	  and $4fef,x
$1d:8a68  7d 13 df	  adc $df13,x
$1d:8a6b  94 f7		 sty $f7,x
$1d:8a6d  f9 3d 87	  sbc $873d,y
$1d:8a70  4f a4 13 e9   eor $e913a4
$1d:8a74  94 fa		 sty $fa,x
$1d:8a76  89 3e ab	  bit #$ab3e
$1d:8a79  4f ac 13 eb   eor $eb13ac
$1d:8a7d  54 fa 1f	  mvn $1f,$fa
$1d:8a80  00 27		 brk #$27
$1d:8a82  16 12		 asl $12,x
$1d:8a84  7d ff ff	  adc $ffff,x
$1d:8a87  93 53		 sta ($53,s),y
$1d:8a89  be 54 18	  ldx $1854,y
$1d:8a8c  09 38 f3	  ora #$f338
$1d:8a8f  33 e3		 and ($e3,s),y
$1d:8a91  0a			asl a
$1d:8a92  6f 0d 0a 5d   adc $5d0a0d
$1d:8a96  03 4e		 ora $4e,s
$1d:8a98  14 c0		 trb $c0
$1d:8a9a  c3 c5		 cmp $c5,s
$1d:8a9c  50 81		 bvc $8a1f
$1d:8a9e  93 8e		 sta ($8e,s),y
$1d:8aa0  05 3f		 ora $3f
$1d:8aa2  4d a4 95	  eor $95a4
$1d:8aa5  44 b4 85	  mvp $85,$b4
$1d:8aa8  12 da		 ora ($da)
$1d:8aaa  e7 e5		 sbc [$e5]
$1d:8aac  f4 ff 7f	  pea $7fff
$1d:8aaf  ce e8 55	  dec $55e8
$1d:8ab2  03 bb		 ora $bb,s
$1d:8ab4  1d d2 04	  ora $04d2,x
$1d:8ab7  d2 d4		 cmp ($d4)
$1d:8ab9  d8			cld
$1d:8aba  1d d2 08	  ora $08d2,x
$1d:8abd  76 56		 ror $56,x
$1d:8abf  0f 9d 94 c2   ora $c2949d
$1d:8ac3  0d 38 2f	  ora $2f38
$1d:8ac6  a7 f1		 lda [$f1]
$1d:8ac8  f4 bf d7	  pea $d7bf
$1d:8acb  d2 be		 cmp ($be)
$1d:8acd  59 f2 c0	  eor $c0f2,y
$1d:8ad0  9f 79 78 f7   sta $f77879,x
$1d:8ad4  c2 96		 rep #$96
$1d:8ad6  99 01 5a	  sta $5a01,y
$1d:8ad9  2e c0 b6	  rol $b6c0
$1d:8adc  8b			phb
$1d:8add  b0 64		 bcs $8b43
$1d:8adf  a1 6c		 lda ($6c,x)
$1d:8ae1  1a			inc a
$1d:8ae2  28			plp
$1d:8ae3  bb			tyx
$1d:8ae4  24 3a		 bit $3a
$1d:8ae6  36 50		 rol $50,x
$1d:8ae8  3a			dec a
$1d:8ae9  0e 96 2d	  asl $2d96
$1d:8aec  f9 b3 c3	  sbc $c3b3,y
$1d:8aef  68			pla
$1d:8af0  c1 01		 cmp ($01,x)
$1d:8af2  5a			phy
$1d:8af3  26 49		 rol $49
$1d:8af5  d2 8c		 cmp ($8c)
$1d:8af7  54 29 83	  mvn $83,$29
$1d:8afa  35 1c		 and $1c,x
$1d:8afc  64 e9		 stz $e9
$1d:8afe  42 9a		 wdm #$9a
$1d:8b00  30 41		 bmi $8b43
$1d:8b02  6b			rtl
$1d:8b03  ec 6f 3a	  cpx $3a6f
$1d:8b06  e0 b4 b4	  cpx #$b4b4
$1d:8b09  54 11 5a	  mvn $5a,$11
$1d:8b0c  6f 89 8b da   adc $da8b89
$1d:8b10  26 2f		 rol $2f
$1d:8b12  f4 98 b1	  pea $b198
$1d:8b15  9a			txs
$1d:8b16  10 ad		 bpl $8ac5
$1d:8b18  27 86		 and [$86]
$1d:8b1a  c5 ac		 cmp $ac
$1d:8b1c  1b			tcs
$1d:8b1d  16 f7		 asl $f7,x
$1d:8b1f  42 82		 wdm #$82
$1d:8b21  91 95		 sta ($95),y
$1d:8b23  46 02		 lsr $02
$1d:8b25  d0 0b		 bne $8b32
$1d:8b27  82 34 0d	  brl $985e
$1d:8b2a  60			rts
$1d:8b2b  2c 33 57	  bit $5733
$1d:8b2e  9e e0 8b	  stz $8be0,x
$1d:8b31  e5 6d		 sbc $6d
$1d:8b33  42 a2		 wdm #$a2
$1d:8b35  74 11		 stz $11,x
$1d:8b37  a4 3f		 ldy $3f
$1d:8b39  0f e7 fc b6   ora $b6fce7
$1d:8b3d  09 74 2d	  ora #$2d74
$1d:8b40  fa			plx
$1d:8b41  7b			tdc
$1d:8b42  d5 fe		 cmp $fe,x
$1d:8b44  c0 54 2a	  cpy #$2a54
$1d:8b47  3b			tsc
$1d:8b48  c1 1a		 cmp ($1a,x)
$1d:8b4a  09 10 64	  ora #$6410
$1d:8b4d  96 3a		 stx $3a,y
$1d:8b4f  7e 33 48	  ror $4833,x
$1d:8b52  b3 a1		 lda ($a1,s),y
$1d:8b54  73 14		 adc ($14,s),y
$1d:8b56  07 18		 ora [$18]
$1d:8b58  11 51		 ora ($51),y
$1d:8b5a  2e 93 2a	  rol $2a93
$1d:8b5d  09 2d 0b	  ora #$0b2d
$1d:8b60  20 33 48	  jsr $4833
$1d:8b63  9d 00 66	  sta $6600,x
$1d:8b66  94 e3		 sty $e3,x
$1d:8b68  12 da		 ora ($da)
$1d:8b6a  8c 4b 86	  sty $864b
$1d:8b6d  18			clc
$1d:8b6e  0c 1d 92	  tsb $921d
$1d:8b71  2c 70 1c	  bit $1c70
$1d:8b74  82 15 38	  brl $c38c
$1d:8b77  d3 f4		 cmp ($f4,s),y
$1d:8b79  1a			inc a
$1d:8b7a  37 c0		 and [$c0],y
$1d:8b7c  d2 09		 cmp ($09)
$1d:8b7e  74 a5		 stz $a5,x
$1d:8b80  d0 10		 bne $8b92
$1d:8b82  64 df		 stz $df
$1d:8b84  22 48 2a 53   jsl $532a48
$1d:8b88  a0 a6 18	  ldy #$18a6
$1d:8b8b  7b			tdc
$1d:8b8c  a8			tay
$1d:8b8d  d2 64		 cmp ($64)
$1d:8b8f  bb			tyx
$1d:8b90  45 29		 eor $29
$1d:8b92  2e d1 6e	  rol $6ed1
$1d:8b95  48			pha
$1d:8b96  5c d5 25 3e   jml $3e25d5
$1d:8b9a  5e a6 fd	  lsr $fda6,x
$1d:8b9d  a3 59		 lda $59,s
$1d:8b9f  45 61		 eor $61
$1d:8ba1  e2 74		 sep #$74
$1d:8ba3  2b			pld
$1d:8ba4  44 2c e0	  mvp $e0,$2c
$1d:8ba7  c7 f6		 cmp [$f6]
$1d:8ba9  3e 86 08	  rol $0886,x
$1d:8bac  d0 38		 bne $8be6
$1d:8bae  ad 0c 96	  lda $960c
$1d:8bb1  92 a1		 sta ($a1)
$1d:8bb3  a2 d1		 ldx #$d1
$1d:8bb5  a8			tay
$1d:8bb6  62 d4 80	  per $0c8d
$1d:8bb9  50 d7		 bvc $8b92
$1d:8bbb  28			plp
$1d:8bbc  7b			tdc
$1d:8bbd  01 98		 ora ($98,x)
$1d:8bbf  0a			asl a
$1d:8bc0  da			phx
$1d:8bc1  e0 34		 cpx #$34
$1d:8bc3  5c 28 d1 74   jml $74d128
$1d:8bc7  24 45		 bit $45
$1d:8bc9  ad 93 17	  lda $1793
$1d:8bcc  fb			xce
$1d:8bcd  ff 2f 80 ad   sbc $ad802f,x
$1d:8bd1  b9 63 45	  lda $4563,y
$1d:8bd4  f0 0d		 beq $8be3
$1d:8bd6  17 ea		 ora [$ea],y
$1d:8bd8  44 5d b1	  mvp $b1,$5d
$1d:8bdb  30 cf		 bmi $8bac
$1d:8bdd  e0 89		 cpx #$89
$1d:8bdf  20 38 39	  jsr $3938
$1d:8be2  41 a2		 eor ($a2,x)
$1d:8be4  50 aa		 bvc $8b90
$1d:8be6  21 a5		 and ($a5,x)
$1d:8be8  24 cb		 bit $cb
$1d:8bea  85 a1		 sta $a1
$1d:8bec  51 15		 eor ($15),y
$1d:8bee  e8			inx
$1d:8bef  e5 05		 sbc $05
$1d:8bf1  ba			tsx
$1d:8bf2  2c 41 7e	  bit $7e41
$1d:8bf5  8b			phb
$1d:8bf6  10 63		 bpl $8c5b
$1d:8bf8  b0 1c		 bcs $8c16
$1d:8bfa  16 e8		 asl $e8,x
$1d:8bfc  07 05		 ora [$05]
$1d:8bfe  fa			plx
$1d:8bff  3c 41 8e	  bit $8e41,x
$1d:8c02  8f 10 5a a0   sta $a05a10
$1d:8c06  04 97		 tsb $97
$1d:8c08  e4 01		 cpx $01
$1d:8c0a  26 39		 rol $39
$1d:8c0c  41 50		 eor ($50,x)
$1d:8c0e  c7 5e		 cmp [$5e]
$1d:8c10  a2 06		 ldx #$06
$1d:8c12  52 f4		 eor ($f4)
$1d:8c14  20 5c b0	  jsr $b05c
$1d:8c17  81 76		 sta ($76,x)
$1d:8c19  4c 81 83	  jmp $8381
$1d:8c1c  a1 8f		 lda ($8f,x)
$1d:8c1e  9d 44 1d	  sta $1d44,x
$1d:8c21  a7 a8		 lda [$a8]
$1d:8c23  84 a2		 sty $a2
$1d:8c25  f0 1d		 beq $8c44
$1d:8c27  a0 dc		 ldy #$dc
$1d:8c29  03 28		 ora $28,s
$1d:8c2b  41 00		 eor ($00,x)
$1d:8c2d  ca			dex
$1d:8c2e  12 40		 ora ($40)
$1d:8c30  53 c3		 eor ($c3,s),y
$1d:8c32  be 60 a4	  ldx $a460,y
$1d:8c35  1a			inc a
$1d:8c36  8a			txa
$1d:8c37  c1 49		 cmp ($49,x)
$1d:8c39  12 49		 ora ($49)
$1d:8c3b  67 c9		 adc [$c9]
$1d:8c3d  25 ad		 and $ad
$1d:8c3f  24 95		 bit $95
$1d:8c41  23 ea		 and $ea,s
$1d:8c43  27 1c		 and [$1c]
$1d:8c45  a2 6c		 ldx #$6c
$1d:8c47  32 f4		 and ($f4)
$1d:8c49  21 ca		 and ($ca,x)
$1d:8c4b  7f bf fb a6   adc $a6fbbf,x
$1d:8c4f  a1 b6		 lda ($b6,x)
$1d:8c51  c0 ea		 cpy #$ea
$1d:8c53  1d d6 a0	  ora $a0d6,x
$1d:8c56  bf c1 9e 57   lda $579ec1,x
$1d:8c5a  6a			ror a
$1d:8c5b  2b			pld
$1d:8c5c  ad 31 6c	  lda $6c31
$1d:8c5f  a1 75		 lda ($75,x)
$1d:8c61  93 8c		 sta ($8c,s),y
$1d:8c63  1e 28 e3	  asl $e328,x
$1d:8c66  07 ca		 ora [$ca]
$1d:8c68  38			sec
$1d:8c69  c9 e2		 cmp #$e2
$1d:8c6b  4e 32 05	  lsr $0532
$1d:8c6e  b3 bd		 lda ($bd,s),y
$1d:8c70  04 64		 tsb $64
$1d:8c72  0b			phd
$1d:8c73  60			rts
$1d:8c74  0a			asl a
$1d:8c75  0d 49 f2	  ora $f249
$1d:8c78  5f e3 a1 e8   eor $e8a1e3,x
$1d:8c7c  a8			tay
$1d:8c7d  24 36		 bit $36
$1d:8c7f  df 13 05 d6   cmp $d60513,x
$1d:8c83  0e b2 85	  asl $85b2
$1d:8c86  22 85 d6 52   jsl $52d685
$1d:8c8a  63 02		 adc $02,s
$1d:8c8c  d0 a8		 bne $8c36
$1d:8c8e  8c b0 23	  sty $23b0
$1d:8c91  84 40		 sty $40
$1d:8c93  e8			inx
$1d:8c94  27 34		 and [$34]
$1d:8c96  2c a4 02	  bit $02a4
$1d:8c99  8d 04 39	  sta $3904
$1d:8c9c  d4 0c		 pei ($0c)
$1d:8c9e  8e 30 88	  stx $8830
$1d:8ca1  24 12		 bit $12
$1d:8ca3  b0 87		 bcs $8c2c
$1d:8ca5  08			php
$1d:8ca6  44 01 32	  mvp $32,$01
$1d:8ca9  15 98		 ora $98,x
$1d:8cab  22 07 d2 4f   jsl $4fd207
$1d:8caf  5a			phy
$1d:8cb0  4e 25 6d	  lsr $6d25
$1d:8cb3  47 e9		 eor [$e9]
$1d:8cb5  18			clc
$1d:8cb6  ae 27 12	  ldx $1227
$1d:8cb9  ba			tsx
$1d:8cba  c6 f4		 dec $f4
$1d:8cbc  8c 52 13	  sty $1352
$1d:8cbf  89 49		 bit #$49
$1d:8cc1  74 fa		 stz $fa,x
$1d:8cc3  46 29		 lsr $29
$1d:8cc5  49 c4		 eor #$c4
$1d:8cc7  a5 83		 lda $83
$1d:8cc9  3d 23 14	  and $1423,x
$1d:8ccc  c4 e2		 cpy $e2
$1d:8cce  53 45		 eor ($45,s),y
$1d:8cd0  fe 91 8a	  inc $8a91,x
$1d:8cd3  72 71		 adc ($71)
$1d:8cd5  29 e5		 and #$e5
$1d:8cd7  2a			rol a
$1d:8cd8  8c 34 d6	  sty $d634
$1d:8cdb  05 00		 ora $00
$1d:8cdd  29 94		 and #$94
$1d:8cdf  22 80 8a 23   jsl $238a80
$1d:8ce3  80 54		 bra $8d39
$1d:8ce5  1a			inc a
$1d:8ce6  66 81		 ror $81
$1d:8ce8  db			stp
$1d:8ce9  82 45 30	  brl $bd31
$1d:8cec  09 8f		 ora #$8f
$1d:8cee  6e 0e 81	  ror $810e
$1d:8cf1  22 9b 02 f9   jsl $f9029b
$1d:8cf5  c8			iny
$1d:8cf6  0b			phd
$1d:8cf7  eb			xba
$1d:8cf8  05 33		 ora $33
$1d:8cfa  94 42		 sty $42,x
$1d:8cfc  11 86		 ora ($86),y
$1d:8cfe  59 8c 21	  eor $218c,y
$1d:8d01  c2 19		 rep #$19
$1d:8d03  67 29		 adc [$29]
$1d:8d05  20 03 4d	  jsr $4d03
$1d:8d08  80 49		 bra $8d53
$1d:8d0a  14 23		 trb $23
$1d:8d0c  a0 8a 23	  ldy #$238a
$1d:8d0f  10 78		 bpl $8d89
$1d:8d11  16 9e		 asl $9e,x
$1d:8d13  68			pla
$1d:8d14  1a			inc a
$1d:8d15  12 45		 ora ($45)
$1d:8d17  2a			rol a
$1d:8d18  40			rti
$1d:8d19  1f 34 0d c9   ora $c90d34,x
$1d:8d1d  22 98 20 ef   jsl $ef2098
$1d:8d21  9a			txs
$1d:8d22  07 44		 ora [$44]
$1d:8d24  91 4d		 sta ($4d),y
$1d:8d26  90 fc		 bcc $8d24
$1d:8d28  e3 ed		 sbc $ed,s
$1d:8d2a  68			pla
$1d:8d2b  1b			tcs
$1d:8d2c  04 02		 tsb $02
$1d:8d2e  2f 86 28 14   and $142886
$1d:8d32  22 1f 96 28   jsl $28961f
$1d:8d36  14 42		 trb $42
$1d:8d38  0f a6 7d 14   ora $147da6
$1d:8d3c  1e 11 d2	  asl $d211,x
$1d:8d3f  7d 14 3e	  adc $3e14,x
$1d:8d42  01 e2		 ora ($e2,x)
$1d:8d44  1c f9 40	  trb $40f9
$1d:8d47  68			pla
$1d:8d48  8a			txa
$1d:8d49  d4 aa		 pei ($aa)
$1d:8d4b  21 bc		 and ($bc,x)
$1d:8d4d  a0 37 44	  ldy #$4437
$1d:8d50  da			phx
$1d:8d51  61 14		 adc ($14,x)
$1d:8d53  5e 50 1d	  lsr $1d50,x
$1d:8d56  22 6d 36 8f   jsl $8f366d
$1d:8d5a  a1 8b		 lda ($8b,x)
$1d:8d5c  a2 9e 08	  ldx #$089e
$1d:8d5f  fa			plx
$1d:8d60  08			php
$1d:8d61  0c 1c 6a	  tsb $6a1c
$1d:8d64  1d 47 41	  ora $4147,x
$1d:8d67  0d 83 c8	  ora $c883
$1d:8d6a  3f 4e 31 00   and $00314e,x
$1d:8d6e  88			dey
$1d:8d6f  21 d7		 and ($d7,x)
$1d:8d71  5f 79 40 48   eor $484079,x
$1d:8d75  40			rti
$1d:8d76  9c 39 00	  stz $0039
$1d:8d79  13 ca		 ora ($ca,s),y
$1d:8d7b  03 12		 ora $12,s
$1d:8d7d  4d a4 88	  eor $88a4
$1d:8d80  fe 28 30	  inc $3028,x
$1d:8d83  12 f5		 ora ($f5)
$1d:8d85  00 6c		 brk #$6c
$1d:8d87  85 11		 sta $11
$1d:8d89  41 84		 eor ($84,x)
$1d:8d8b  66 01		 ror $01
$1d:8d8d  ff ff a3 e8   sbc $e8a3ff,x
$1d:8d91  a2 95 42	  ldx #$4295
$1d:8d94  c1 82		 cmp ($82,x)
$1d:8d96  78			sei
$1d:8d97  a2 92 0a	  ldx #$0a92
$1d:8d9a  02 a0		 cop #$a0
$1d:8d9c  03 e0		 ora $e0,s
$1d:8d9e  ff 14 91 ab   sbc $ab9114,x
$1d:8da2  c9 fe		 cmp #$fe
$1d:8da4  34 68		 bit $68,x
$1d:8da6  24 05		 bit $05
$1d:8da8  2a			rol a
$1d:8da9  4a			lsr a
$1d:8daa  40			rti
$1d:8dab  21 90		 and ($90,x)
$1d:8dad  7d 03 e0	  adc $e003,x
$1d:8db0  65 33		 adc $33
$1d:8db2  08			php
$1d:8db3  29 04		 and #$04
$1d:8db5  84 4a		 sty $4a
$1d:8db7  40			rti
$1d:8db8  84 9d		 sty $9d
$1d:8dba  86 2b		 stx $2b
$1d:8dbc  00 f9		 brk #$f9
$1d:8dbe  98			tya
$1d:8dbf  0e 06 42	  asl $4206
$1d:8dc2  38			sec
$1d:8dc3  03 f0		 ora $f0,s
$1d:8dc5  61 01		 adc ($01,x)
$1d:8dc7  d0 80		 bne $8d49
$1d:8dc9  75 9f		 adc $9f,x
$1d:8dcb  a7 00		 lda [$00]
$1d:8dcd  01 84		 ora ($84,x)
$1d:8dcf  1a			inc a
$1d:8dd0  01 0c		 ora ($0c,x)
$1d:8dd2  80 46		 bra $8e1a
$1d:8dd4  e0 1f 73	  cpx #$731f
$1d:8dd7  02 90		 cop #$90
$1d:8dd9  82 14 fb	  brl $88f0
$1d:8ddc  0d b3 e8	  ora $e8b3
$1d:8ddf  e0 1c 73	  cpx #$731c
$1d:8de2  41 40		 eor ($40,x)
$1d:8de4  23 d0		 and $d0,s
$1d:8de6  0f d3 41 c8   ora $c841d3
$1d:8dea  63 86		 adc $86,s
$1d:8dec  0a			asl a
$1d:8ded  93 7c		 sta ($7c,s),y
$1d:8def  32 c1		 and ($c1)
$1d:8df1  63 80		 adc $80,s
$1d:8df3  69 a0		 adc #$a0
$1d:8df5  10 78		 bpl $8e6f
$1d:8df7  04 2d		 tsb $2d
$1d:8df9  df 4f c0 7e   cmp $7ec04f,x
$1d:8dfd  8a			txa
$1d:8dfe  40			rti
$1d:8dff  61 40		 adc ($40,x)
$1d:8e01  41 a0		 eor ($a0,x)
$1d:8e03  3f 02 1c cc   and $cc1c02,x
$1d:8e07  a5 39		 lda $39
$1d:8e09  71 92		 adc ($92),y
$1d:8e0b  00 df		 brk #$df
$1d:8e0d  34 80		 bit $80,x
$1d:8e0f  a9 c5		 lda #$c5
$1d:8e11  d4 02		 pei ($02)
$1d:8e13  b2 8e		 lda ($8e)
$1d:8e15  40			rti
$1d:8e16  3e c3 28	  rol $28c3,x
$1d:8e19  7e 06 db	  ror $db06,x
$1d:8e1c  80 fa		 bra $8e18
$1d:8e1e  3e 3f 03	  rol $033f,x
$1d:8e21  f9 ff 77	  sbc $77ff,y
$1d:8e24  04 61		 tsb $61
$1d:8e26  ac 61 25	  ldy $2561
$1d:8e29  19 86 1b	  ora $1b86,y
$1d:8e2c  00 1d		 brk #$1d
$1d:8e2e  31 48		 and ($48),y
$1d:8e30  05 8c		 ora $8c
$1d:8e32  52 08		 eor ($08)
$1d:8e34  62 19 80	  per $0e50
$1d:8e37  28			plp
$1d:8e38  02 1e		 cop #$1e
$1d:8e3a  9f 41 39 09   sta $093941,x
$1d:8e3e  01 14		 ora ($14,x)
$1d:8e40  03 30		 ora $30,s
$1d:8e42  fc 03 dc	  jsr ($dc03,x)
$1d:8e45  ca			dex
$1d:8e46  3c 65 f9	  bit $f965,x
$1d:8e49  19 88 aa	  ora $aa88,y
$1d:8e4c  6e 61 28	  ror $2861
$1d:8e4f  0c 46 01	  tsb $0146
$1d:8e52  ff 19 1c 05   sbc $051c19,x
$1d:8e56  f4 22 41	  pea $4122
$1d:8e59  c3 8d		 cmp $8d,s
$1d:8e5b  c4 66		 cpy $66
$1d:8e5d  48			pha
$1d:8e5e  c4 7d		 cpy $7d
$1d:8e60  ae 26 05	  ldx $0526
$1d:8e63  04 80		 tsb $80
$1d:8e65  45 00		 eor $00
$1d:8e67  ee 37 00	  inc $0037
$1d:8e6a  80 17		 bra $8e83
$1d:8e6c  87 17		 sta [$17]
$1d:8e6e  02 80		 cop #$80
$1d:8e70  97 86		 sta [$86],y
$1d:8e72  01 8c		 ora ($8c,x)
$1d:8e74  01 9b		 ora ($9b,x)
$1d:8e76  cf 71 c0 3f   cmp $3fc071
$1d:8e7a  62 8e 9c	  per $2b0b
$1d:8e7d  92 70		 sta ($70)
$1d:8e7f  f0 78		 beq $8ef9
$1d:8e81  83 27		 sta $27,s
$1d:8e83  52 18		 eor ($18)
$1d:8e85  33 1b		 and ($1b,s),y
$1d:8e87  09 57		 ora #$57
$1d:8e89  56 2d		 lsr $2d,x
$1d:8e8b  4d 61 27	  eor $2761
$1d:8e8e  d8			cld
$1d:8e8f  a3 ae		 lda $ae,s
$1d:8e91  47 fa		 eor [$fa]
$1d:8e93  d0 79		 bne $8f0e
$1d:8e95  0a			asl a
$1d:8e96  43 89		 eor $89,s
$1d:8e98  c0 3f af	  cpy #$af3f
$1d:8e9b  6a			ror a
$1d:8e9c  e5 29		 sbc $29
$1d:8e9e  3d 68 3c	  and $3c68,x
$1d:8ea1  c2 f7		 rep #$f7
$1d:8ea3  ad 07 9c	  lda $9c07
$1d:8ea6  ce 38 c0	  dec $c038
$1d:8ea9  7a			ply
$1d:8eaa  56 81		 lsr $81,x
$1d:8eac  08			php
$1d:8ead  97 41		 sta [$41],y
$1d:8eaf  1e 42 8a	  asl $8a42,x
$1d:8eb2  0f 31 d0 1f   ora $1fd031
$1d:8eb6  5e 0b 6f	  lsr $6f0b,x
$1d:8eb9  40			rti
$1d:8eba  53 c1		 eor ($c1,s),y
$1d:8ebc  31 ea		 and ($ea),y
$1d:8ebe  18			clc
$1d:8ebf  78			sei
$1d:8ec0  24 6d		 bit $6d
$1d:8ec2  0f 12 45 05   ora $054512
$1d:8ec6  98			tya
$1d:8ec7  6c 63 5d	  jmp ($5d63)
$1d:8eca  b5 18		 lda $18,x
$1d:8ecc  7c ad 16	  jmp ($16ad,x)
$1d:8ecf  c3 ef		 cmp $ef,s
$1d:8ed1  95 a2		 sta $a2,x
$1d:8ed3  dc 99 f2	  jml [$f299]
$1d:8ed6  b7 fb		 lda [$fb],y
$1d:8ed8  17 9e		 ora [$9e],y
$1d:8eda  79 86 b9	  adc $b986,y
$1d:8edd  44 46 96	  mvp $96,$46
$1d:8ee0  b6 02		 ldx $02,y
$1d:8ee2  f9 01 46	  sbc $4601,y
$1d:8ee5  01 ee		 ora ($ee,x)
$1d:8ee7  1b			tcs
$1d:8ee8  1c 5c 6d	  trb $6d5c
$1d:8eeb  70 73		 bvs $8f60
$1d:8eed  e1 c1		 sbc ($c1,x)
$1d:8eef  c1 c6		 cmp ($c6,x)
$1d:8ef1  f7 f4		 sbc [$f4],y
$1d:8ef3  c0 82 fc	  cpy #$fc82
$1d:8ef6  38			sec
$1d:8ef7  cb			wai
$1d:8ef8  43 14		 eor $14,s
$1d:8efa  97 f3		 sta [$f3],y
$1d:8efc  ff 0c 80 19   sbc $19800c,x
$1d:8f00  c0 ca 0c	  cpy #$0cca
$1d:8f03  52 57		 eor ($57)
$1d:8f05  90 58		 bcc $8f5f
$1d:8f07  6b			rtl
$1d:8f08  c6 4f		 dec $4f
$1d:8f0a  0b			phd
$1d:8f0b  0d 7e 00	  ora $007e
$1d:8f0e  00 08		 brk #$08
$1d:8f10  80 3b		 bra $8f4d
$1d:8f12  d6 29		 dec $29,x
$1d:8f14  f0 7b		 beq $8f91
$1d:8f16  af ee 29 e5   lda $e529ee
$1d:8f1a  8a			txa
$1d:8f1b  7f 22 9f 57   adc $579f22,x
$1d:8f1f  f8			sed
$1d:8f20  55 3f		 eor $3f,x
$1d:8f22  79 4f df	  adc $df4f,y
$1d:8f25  50 00		 bvc $8f27
$1d:8f27  1f 28 64 0a   ora $0a6428,x
$1d:8f2b  29 f3 86	  and #$86f3
$1d:8f2e  44 a1 9b	  mvp $9b,$a1
$1d:8f31  0a			asl a
$1d:8f32  66 c0		 ror $c0
$1d:8f34  2e 51 8e	  rol $8e51
$1d:8f37  05 63		 ora $63
$1d:8f39  80 1f		 bra $8f5a
$1d:8f3b  28			plp
$1d:8f3c  65 ea		 adc $ea
$1d:8f3e  19 7b 86	  ora $867b,y
$1d:8f41  62 a1 98	  per $27e5
$1d:8f44  b8			clv
$1d:8f45  a7 b2		 lda [$b2]
$1d:8f47  29 d0 8a	  and #$8ad0
$1d:8f4a  7a			ply
$1d:8f4b  c6 22		 dec $22
$1d:8f4d  32 4f		 and ($4f)
$1d:8f4f  64 40		 stz $40
$1d:8f51  7c 1d 08	  jmp ($081d,x)
$1d:8f54  87 ac		 sta [$ac]
$1d:8f56  82 24 24	  brl $b37d
$1d:8f59  18			clc
$1d:8f5a  00 c0		 brk #$c0
$1d:8f5c  06 80		 asl $80
$1d:8f5e  34 01		 bit $01,x
$1d:8f60  f1 11		 sbc ($11),y
$1d:8f62  00 88		 brk #$88
$1d:8f64  03 00		 ora $00,s
$1d:8f66  f6 c5		 inc $c5,x
$1d:8f68  3f a6 11 f6   and $f611a6,x
$1d:8f6c  c4 0c		 cpy $0c
$1d:8f6e  c1 fd		 cmp ($fd,x)
$1d:8f70  34 8f		 bit $8f,x
$1d:8f72  b6 31		 ldx $31,y
$1d:8f74  1a			inc a
$1d:8f75  8c 46 e3	  sty $e346
$1d:8f78  10 c8		 bpl $8f42
$1d:8f7a  c4 36		 cpy $36
$1d:8f7c  29 01 8a	  and #$8a01
$1d:8f7f  41 22		 eor ($22,x)
$1d:8f81  92 38		 sta ($38)
$1d:8f83  a5 d0		 lda $d0
$1d:8f85  ee 21 20	  inc $2021
$1d:8f88  88			dey
$1d:8f89  c5 22		 cmp $22
$1d:8f8b  47 f3		 eor [$f3]
$1d:8f8d  81 a1		 sta ($a1,x)
$1d:8f8f  55 08		 eor $08,x
$1d:8f91  09 50 3c	  ora #$3c50
$1d:8f94  12 51		 ora ($51)
$1d:8f96  02 41		 cop #$41
$1d:8f98  13 4a		 ora ($4a,s),y
$1d:8f9a  aa			tax
$1d:8f9b  90 63		 bcc $9000
$1d:8f9d  11 c8		 ora ($c8),y
$1d:8f9f  c4 76		 cpy $76
$1d:8fa1  29 ff 59	  and #$59ff
$1d:8fa4  84 32		 sty $32
$1d:8fa6  23 0c		 and $0c,s
$1d:8fa8  4a			lsr a
$1d:8fa9  81 f0		 sta ($f0,x)
$1d:8fab  61 90		 adc ($90,x)
$1d:8fad  10 88		 bpl $8f37
$1d:8faf  2d c4 2c	  and $2cc4
$1d:8fb2  0c 02 81	  tsb $8102
$1d:8fb5  b1 55		 lda ($55),y
$1d:8fb7  70 2b		 bvs $8fe4
$1d:8fb9  f1 82		 sbc ($82),y
$1d:8fbb  34 d5		 bit $d5,x
$1d:8fbd  84 11		 sty $11
$1d:8fbf  36 aa		 rol $aa,x
$1d:8fc1  b9 06 21	  lda $2106,y
$1d:8fc4  21 88		 and ($88,x)
$1d:8fc6  48			pha
$1d:8fc7  22 13 18 84   jsl $841813
$1d:8fcb  c1 e2		 cmp ($e2,x)
$1d:8fcd  32 27		 and ($27)
$1d:8fcf  a8			tay
$1d:8fd0  cc 9d e2	  cpy $e29d
$1d:8fd3  fa			plx
$1d:8fd4  07 a0		 ora [$a0]
$1d:8fd6  3f 8a 48 f3   and $f3488a,x
$1d:8fda  19 a4 52	  ora $52a4,y
$1d:8fdd  43 14		 eor $14,s
$1d:8fdf  90 45		 bcc $9026
$1d:8fe1  26 31		 rol $31
$1d:8fe3  49 80 44	  eor #$4480
$1d:8fe6  64 41		 stz $41
$1d:8fe8  51 99		 eor ($99),y
$1d:8fea  03 c4		 ora $c4,s
$1d:8fec  34 01		 bit $01,x
$1d:8fee  40			rti
$1d:8fef  0f 14 90 26   ora $269014
$1d:8ff3  33 48		 and ($48,s),y
$1d:8ff5  85 06		 sta $06
$1d:8ff7  21 40		 and ($40,x)
$1d:8ff9  88			dey
$1d:8ffa  7f a2 03 50   adc $5003a2,x
$1d:8ffe  19 05 08	  ora $0805,y
$1d:9001  6a			ror a
$1d:9002  23 40		 and $40,s
$1d:9004  18			clc
$1d:9005  00 e8		 brk #$e8
$1d:9007  06 80		 asl $80
$1d:9009  3e 2a 20	  rol $202a,x
$1d:900c  cc 16 63	  cpy $6316
$1d:900f  41 8a		 eor ($8a,x)
$1d:9011  50 22		 bvc $9035
$1d:9013  84 c0		 sty $c0
$1d:9015  88			dey
$1d:9016  45 0a		 eor $0a
$1d:9018  41 42		 eor ($42,x)
$1d:901a  2a			rol a
$1d:901b  89 30 0a	  bit #$0a30
$1d:901e  00 5a		 brk #$5a
$1d:9020  02 60		 cop #$60
$1d:9022  17 8a		 ora [$8a],y
$1d:9024  88			dey
$1d:9025  5d 1f fc	  eor $fc1f,x
$1d:9028  23 29		 and $29,s
$1d:902a  48			pha
$1d:902b  ca			dex
$1d:902c  42 34		 wdm #$34
$1d:902e  94 8d		 sty $8d,x
$1d:9030  21 cd		 and ($cd,x)
$1d:9032  88			dey
$1d:9033  e4 6f		 cpx $6f
$1d:9035  08			php
$1d:9036  46 12		 lsr $12
$1d:9038  11 95		 ora ($95),y
$1d:903a  84 65		 sty $65
$1d:903c  a1 17		 lda ($17,x)
$1d:903e  98			tya
$1d:903f  45 9a		 eor $9a
$1d:9041  11 e0		 ora ($e0),y
$1d:9043  84 78		 sty $78
$1d:9045  61 1d		 adc ($1d,x)
$1d:9047  28			plp
$1d:9048  c7 4e		 cmp [$4e]
$1d:904a  11 d1		 ora ($d1),y
$1d:904c  a4 78		 ldy $78
$1d:904e  23 1d		 and $1d,s
$1d:9050  4a			lsr a
$1d:9051  47 48		 eor [$48]
$1d:9053  5e 34 32	  lsr $3234,x
$1d:9056  59 42 38	  eor $3842,y
$1d:9059  f4 8e 3c	  pea $3c8e
$1d:905c  23 07		 and $07,s
$1d:905e  48			pha
$1d:905f  c1 c2		 cmp ($c2,x)
$1d:9061  32 74		 and ($74)
$1d:9063  8c 9c 23	  sty $239c
$1d:9066  47 48		 eor [$48]
$1d:9068  d1 8f		 cmp ($8f),y
$1d:906a  c9 5e 69	  cmp #$695e
$1d:906d  40			rti
$1d:906e  ea			nop
$1d:906f  42 3c		 wdm #$3c
$1d:9071  50 8f		 bvc $9002
$1d:9073  1c 63 c8	  trb $c863
$1d:9076  9d 0a 47	  sta $470a,x
$1d:9079  8e 90 c4	  stx $c490
$1d:907c  0e ad 23	  asl $23ad
$1d:907f  ab			plb
$1d:9080  08			php
$1d:9081  c0 d2 30	  cpy #$30d2
$1d:9084  30 c8		 bmi $904e
$1d:9086  0e 63 e3	  asl $e363
$1d:9089  98			tya
$1d:908a  fa			plx
$1d:908b  46 3e		 lsr $3e
$1d:908d  31 8f		 and ($8f),y
$1d:908f  a3 64		 lda $64,s
$1d:9091  1b			tcs
$1d:9092  e0 dd 08	  cpx #$08dd
$1d:9095  46 de		 lsr $de
$1d:9097  91 b7		 sta ($b7),y
$1d:9099  73 91		 adc ($91,s),y
$1d:909b  7c a1 1b	  jmp ($1ba1,x)
$1d:909e  58			cli
$1d:909f  46 da		 lsr $da
$1d:90a1  11 d6		 ora ($d6),y
$1d:90a3  84 75		 sty $75
$1d:90a5  e1 1e		 sbc ($1e,x)
$1d:90a7  68			pla
$1d:90a8  47 9e		 eor [$9e]
$1d:90aa  11 75		 ora ($75),y
$1d:90ac  a4 61		 ldy $61
$1d:90ae  61 1a		 adc ($1a,x)
$1d:90b0  5a			phy
$1d:90b1  46 98		 lsr $98
$1d:90b3  02 14		 cop #$14
$1d:90b5  80 00		 bra $90b7
$1d:90b7  01 83		 ora ($83,x)
$1d:90b9  4a			lsr a
$1d:90ba  b7 37		 lda [$37],y
$1d:90bc  a0 c3 25	  ldy #$25c3
$1d:90bf  d0 c9		 bne $908a
$1d:90c1  fc 32 5f	  jsr ($5f32,x)
$1d:90c4  0c 8f c1	  tsb $c18f
$1d:90c7  25 50		 and $50
$1d:90c9  49 5c 12	  eor #$125c
$1d:90cc  75 04		 adc $04,x
$1d:90ce  9d d1 25	  sta $25d1,x
$1d:90d1  74 49		 stz $49,x
$1d:90d3  55 10		 eor $10,x
$1d:90d5  4c 13 a8	  jmp $a813
$1d:90d8  66 42		 ror $42
$1d:90da  19 91 86	  ora $8691,y
$1d:90dd  68			pla
$1d:90de  05 e3		 ora $e3
$1d:90e0  90 a6		 bcc $9088
$1d:90e2  68			pla
$1d:90e3  46 23		 lsr $23
$1d:90e5  67 8c		 adc [$8c]
$1d:90e7  76 63		 ror $63,x
$1d:90e9  1d a8 c7	  ora $c7a8,x
$1d:90ec  a6 31		 ldx $31
$1d:90ee  ea			nop
$1d:90ef  8a			txa
$1d:90f0  6e aa 9b	  ror $9baa
$1d:90f3  a8			tay
$1d:90f4  a7 2a		 lda [$2a]
$1d:90f6  a9 ca 86	  lda #$86ca
$1d:90f9  7d a1 9f	  adc $9fa1,x
$1d:90fc  78			sei
$1d:90fd  c7 e2		 cmp [$e2]
$1d:90ff  31 f9		 and ($f9),y
$1d:9101  29 91 3c	  and #$3c91
$1d:9104  fb			xce
$1d:9105  75 8e		 adc $8e,x
$1d:9107  d9 5c ff	  cmp $ff5c,y
$1d:910a  54 cf d1	  mvn $d1,$cf
$1d:910d  3c 85 e7	  bit $e785,x
$1d:9110  92 86		 sta ($86)
$1d:9112  0e 80 70	  asl $7080
$1d:9115  5a			phy
$1d:9116  21 e8		 and ($e8,x)
$1d:9118  0d cc 68	  ora $68cc
$1d:911b  03 e0		 ora $e0,s
$1d:911d  ec 46 3d	  cpx $3d46
$1d:9120  08			php
$1d:9121  72 a6		 adc ($a6)
$1d:9123  6e 21 9b	  ror $9b21
$1d:9126  8a			txa
$1d:9127  67 22		 adc [$22]
$1d:9129  19 c8 10	  ora $10c8,y
$1d:912c  88			dey
$1d:912d  88			dey
$1d:912e  27 62		 and [$62]
$1d:9130  50 a6		 bvc $90d8
$1d:9132  6e 61 9b	  ror $9b61
$1d:9135  9a			txs
$1d:9136  67 26		 adc [$26]
$1d:9138  19 c9 15	  ora $15c9,y
$1d:913b  8a			txa
$1d:913c  a0 e1 90	  ldy #$90e1
$1d:913f  58			cli
$1d:9140  64 1a		 stz $1a
$1d:9142  19 11 86	  ora $8611,y
$1d:9145  45 a2		 eor $a2
$1d:9147  90 18		 bcc $9161
$1d:9149  a4 12		 ldy $12
$1d:914b  29 11 88	  and #$8811
$1d:914e  43 da		 eor $da,s
$1d:9150  e1 0c		 sbc ($0c,x)
$1d:9152  dd c3 22	  cmp $22c3,x
$1d:9155  b0 ce		 bcs $9125
$1d:9157  5c 53 39 14   jml $143953
$1d:915b  ce c5 35	  dec $35c5
$1d:915e  91 4d		 sta ($4d),y
$1d:9160  68			pla
$1d:9161  8c 05 61	  sty $6105
$1d:9164  04 a5		 tsb $a5
$1d:9166  41 29		 eor ($29,x)
$1d:9168  6a			ror a
$1d:9169  72 6a		 adc ($6a)
$1d:916b  83 54		 sta $54,s
$1d:916d  c4 80		 cpy $80
$1d:916f  d6 0a		 dec $0a,x
$1d:9171  56 12		 lsr $12,x
$1d:9173  76 e7		 ror $e7,x
$1d:9175  19 5b ac	  ora $ac5b,y
$1d:9178  22 90 b8 a4   jsl $a4b890
$1d:917c  29 e2 30	  and #$30e2
$1d:917f  b5 f8		 lda $f8,x
$1d:9181  c1 16		 cmp ($16,x)
$1d:9183  62 be 05	  per $9744
$1d:9186  80 77		 bra $91ff
$1d:9188  18			clc
$1d:9189  63 dd		 adc $dd,s
$1d:918b  8a			txa
$1d:918c  6f 22 9b d8   adc $d89b22
$1d:9190  a7 32		 lda [$32]
$1d:9192  29 cd 11	  and #$11cd
$1d:9195  90 3c		 bcc $91d3
$1d:9197  85 64		 sta $64
$1d:9199  df 2c 20 78   cmp $78202c,x
$1d:919d  1d 01 2a	  ora $2a01,x
$1d:91a0  75 87		 adc $87,x
$1d:91a2  12 77		 ora ($77)
$1d:91a4  c4 9d		 cpy $9d
$1d:91a6  71 04		 adc ($04),y
$1d:91a8  c1 2a		 cmp ($2a,x)
$1d:91aa  8c 49 63	  sty $6349
$1d:91ad  12 68		 ora ($68)
$1d:91af  c4 d6		 cpy $d6
$1d:91b1  31 36		 and ($36),y
$1d:91b3  17 8c		 ora [$8c],y
$1d:91b5  9c 66 33	  stz $3366
$1d:91b8  78			sei
$1d:91b9  a5 dd		 lda $dd
$1d:91bb  e2 24		 sep #$24
$1d:91bd  00 78		 brk #$78
$1d:91bf  04 2e		 tsb $2e
$1d:91c1  a8			tay
$1d:91c2  40			rti
$1d:91c3  12 48		 ora ($48)
$1d:91c5  ca			dex
$1d:91c6  22 92 98 a4   jsl $a49892
$1d:91ca  e2 29		 sep #$29
$1d:91cc  39 8a 4f	  and $4f8a,y
$1d:91cf  22 93 d8 a5   jsl $a5d893
$1d:91d3  32 29		 and ($29)
$1d:91d5  4d 8c 4f	  eor $4f8c
$1d:91d8  a3 13		 lda $13,s
$1d:91da  f3 08		 sbc ($08,s),y
$1d:91dc  cf a1 92 e8   cmp $e892a1
$1d:91e0  64 bc		 stz $bc
$1d:91e2  d2 32		 cmp ($32)
$1d:91e4  e8			inx
$1d:91e5  c5 16		 cmp $16
$1d:91e7  31 46		 and ($46),y
$1d:91e9  86 41		 stx $41
$1d:91eb  ce 60 6f	  dec $6f60
$1d:91ee  1a			inc a
$1d:91ef  39 cc 6b	  and $6bcc,y
$1d:91f2  63 f3		 adc $f3,s
$1d:91f4  bc 45 22	  ldy $2245,x
$1d:91f7  e4 73		 cpx $73
$1d:91f9  8b			phb
$1d:91fa  d5 2f		 cmp $2f,x
$1d:91fc  06 75		 asl $75
$1d:91fe  9f 14 ce 91   sta $91ce14,x
$1d:9202  14 a4		 trb $a4
$1d:9204  97 c6		 sta [$c6],y
$1d:9206  9e 61 1a	  stz $1a61,x
$1d:9209  71 9c		 adc ($9c),y
$1d:920b  67 e9		 adc [$e9]
$1d:920d  32 88		 and ($88)
$1d:920f  42 22		 wdm #$22
$1d:9211  10 98		 bpl $91ab
$1d:9213  84 62		 sty $62
$1d:9215  21 19		 and ($19,x)
$1d:9217  57 8d		 eor [$8d],y
$1d:9219  69 66		 adc #$66
$1d:921b  36 a5		 rol $a5,x
$1d:921d  ba			tsx
$1d:921e  da			phx
$1d:921f  e2 95		 sep #$95
$1d:9221  18			clc
$1d:9222  a5 42		 lda $42
$1d:9224  29 61		 and #$61
$1d:9226  8a			txa
$1d:9227  58			cli
$1d:9228  96 e5		 stx $e5,y
$1d:922a  14 91		 trb $91
$1d:922c  c5 2e		 cmp $2e
$1d:922e  8a			txa
$1d:922f  f5 b5		 sbc $b5,x
$1d:9231  45 20		 eor $20
$1d:9233  b1 48		 lda ($48),y
$1d:9235  14 52		 trb $52
$1d:9237  2b			pld
$1d:9238  14 89		 trb $89
$1d:923a  29 c9		 and #$c9
$1d:923c  a6 4c		 ldx $4c
$1d:923e  91 64		 sta ($64),y
$1d:9240  05 81		 ora $81
$1d:9242  96 2c		 stx $2c,y
$1d:9244  84 7a		 sty $7a
$1d:9246  03 28		 ora $28,s
$1d:9248  2a			rol a
$1d:9249  6f 31 b1 b1   adc $b1b131
$1d:924d  c6 a4		 dec $a4
$1d:924f  cb			wai
$1d:9250  27 fa		 and [$fa]
$1d:9252  d9 00 eb	  cmp $eb00,y
$1d:9255  54 03 9b	  mvn $9b,$03
$1d:9258  50 b9		 bvc $9213
$1d:925a  d1 0e		 cmp ($0e),y
$1d:925c  7c 43 bd	  jmp ($bd43,x)
$1d:925f  10 ef		 bpl $9250
$1d:9261  9d ca 29	  sta $29ca,x
$1d:9264  9a			txs
$1d:9265  8a			txa
$1d:9266  66 cd		 ror $cd
$1d:9268  e4 35		 cpx $35
$1d:926a  0a			asl a
$1d:926b  a6 68		 ldx $68
$1d:926d  5e 7a a8	  lsr $a87a,x
$1d:9270  a6 ae		 ldx $ae
$1d:9272  11 70		 ora ($70),y
$1d:9274  a4 5c		 ldy $5c
$1d:9276  21 18		 and ($18,x)
$1d:9278  0a			asl a
$1d:9279  46 02		 lsr $02
$1d:927b  21 21		 and ($21,x)
$1d:927d  88			dey
$1d:927e  48			pha
$1d:927f  a2 13		 ldx #$13
$1d:9281  18			clc
$1d:9282  84 cc		 sty $cc
$1d:9284  9e 50 8c	  stz $8c50,x
$1d:9287  a5 23		 lda $23
$1d:9289  28			plp
$1d:928a  ef 50 30 7b   sbc $7b3050
$1d:928e  a2 9e		 ldx #$9e
$1d:9290  f1 59		 sbc ($59),y
$1d:9292  11 da		 ora ($da),y
$1d:9294  11 72		 ora ($72),y
$1d:9296  3b			tsc
$1d:9297  ed 56 11	  sbc $1156
$1d:929a  56 84		 lsr $84,x
$1d:929c  59 61 16	  eor $1661,y
$1d:929f  68			pla
$1d:92a0  45 d6		 eor $d6
$1d:92a2  11 85		 ora ($85),y
$1d:92a4  84 69		 sty $69
$1d:92a6  61 1a		 adc ($1a,x)
$1d:92a8  68			pla
$1d:92a9  46 42		 lsr $42
$1d:92ab  11 91		 ora ($91),y
$1d:92ad  84 68		 sty $68
$1d:92af  12 e1		 ora ($e1)
$1d:92b1  18			clc
$1d:92b2  93 27		 sta ($27,s),y
$1d:92b4  c6 6b		 dec $6b
$1d:92b6  18			clc
$1d:92b7  9b			txy
$1d:92b8  43 25		 eor $25,s
$1d:92ba  90 c9		 bcc $9285
$1d:92bc  6c 33 59	  jmp ($5933)
$1d:92bf  0c d6 c2	  tsb $c2d6
$1d:92c2  2e 34 8b	  rol $8b34
$1d:92c5  8c 23 03	  sty $0323
$1d:92c8  48			pha
$1d:92c9  c0 c2		 cpy #$c2
$1d:92cb  30 4b		 bmi $9318
$1d:92cd  71 c1		 adc ($c1),y
$1d:92cf  c2 2e		 rep #$2e
$1d:92d1  6b			rtl
$1d:92d2  73 b9		 adc ($b9,s),y
$1d:92d4  d2 17		 cmp ($17)
$1d:92d6  81 76		 sta ($76,x)
$1d:92d8  63 8e		 adc $8e,s
$1d:92da  19 96 39	  ora $3996,y
$1d:92dd  58			cli
$1d:92de  46 5a		 lsr $5a
$1d:92e0  10 94		 bpl $9276
$1d:92e2  26 40		 rol $40
$1d:92e4  43 99		 eor $99,s
$1d:92e6  63 1e		 adc $1e,s
$1d:92e8  1c 80 e4	  trb $e480
$1d:92eb  21 90		 and ($90,x)
$1d:92ed  77 18		 adc [$18],y
$1d:92ef  ef 21 9b d8   sbc $d89b21
$1d:92f3  67 32		 adc [$32]
$1d:92f5  19 cd 84	  ora $84cd,y
$1d:92f8  61 e1		 adc ($e1,x)
$1d:92fa  18			clc
$1d:92fb  88			dey
$1d:92fc  46 5e		 lsr $5e
$1d:92fe  11 98		 ora ($98),y
$1d:9300  a4 62		 ldy $62
$1d:9302  29 18 7a	  and #$7a18
$1d:9305  43 d8		 eor $d8,s
$1d:9307  1e 81 b1	  asl $b181,x
$1d:930a  7f 8f 04 06   adc $06048f,x
$1d:930e  20 00 d9	  jsr $d900
$1d:9311  00 c7		 brk #$c7
$1d:9313  85 08		 sta $08
$1d:9315  e1 c2		 sbc ($c2,x)
$1d:9317  36 60		 rol $60,x
$1d:9319  f3 4c		 sbc ($4c,s),y
$1d:931b  10 51		 bpl $936e
$1d:931d  93 40		 sta ($40,s),y
$1d:931f  98			tya
$1d:9320  0c 85 23	  tsb $2385
$1d:9323  42 19		 wdm #$19
$1d:9325  1d 4c 23	  ora $234c,x
$1d:9328  4f 08 d4 42   eor $42d408
$1d:932c  31 30		 and ($30),y
$1d:932e  8c cd 23	  sty $23cd
$1d:9331  51 48		 eor ($48),y
$1d:9333  d3 d2		 cmp ($d2,s),y
$1d:9335  06 c0		 asl $c0
$1d:9337  34 04		 bit $04,x
$1d:9339  40			rti
$1d:933a  56 61		 lsr $61,x
$1d:933c  08			php
$1d:933d  c0 b4		 cpy #$b4
$1d:933f  c2 36		 rep #$36
$1d:9341  b0 8d		 bcs $92d0
$1d:9343  b4 23		 ldy $23,x
$1d:9345  8b			phb
$1d:9346  08			php
$1d:9347  e3 44		 sbc $44,s
$1d:9349  28			plp
$1d:934a  31 0a		 and ($0a),y
$1d:934c  14 21		 trb $21
$1d:934e  38			sec
$1d:934f  1a			inc a
$1d:9350  12 78		 ora ($78)
$1d:9352  d1 0a		 cmp ($0a),y
$1d:9354  64 17		 stz $17
$1d:9356  3d a1 8c	  and $8ca1,x
$1d:9359  53 01		 eor ($01,s),y
$1d:935b  a2 31 8f	  ldx #$8f31
$1d:935e  12 19		 ora ($19)
$1d:9360  01 86		 ora ($86,x)
$1d:9362  6e e1 91	  ror $91e1
$1d:9365  18			clc
$1d:9366  67 2c		 adc [$2c]
$1d:9368  de 30 63	  dec $6330,x
$1d:936b  98			tya
$1d:936c  c5 8d		 cmp $8d
$1d:936e  e3 02		 sbc $02,s
$1d:9370  86 45		 stx $45
$1d:9372  61 91		 adc ($91,x)
$1d:9374  28			plp
$1d:9375  c5 fa		 cmp $fa
$1d:9377  31 7f		 and ($7f),y
$1d:9379  8c 63 a3	  sty $a363
$1d:937c  18			clc
$1d:937d  f8			sed
$1d:937e  c5 72		 cmp $72
$1d:9380  31 5d		 and ($5d),y
$1d:9382  8c 6b a3	  sty $a36b
$1d:9385  1a			inc a
$1d:9386  f8			sed
$1d:9387  c5 7a		 cmp $7a
$1d:9389  31 5f		 and ($5f),y
$1d:938b  45 94		 eor $94
$1d:938d  22 eb 08 ab   jsl $ab08eb
$1d:9391  42 2f		 wdm #$2f
$1d:9393  30 8b		 bmi $9320
$1d:9395  32 7c		 and ($7c)
$1d:9397  48			pha
$1d:9398  40			rti
$1d:9399  a4 0b		 ldy $0b
$1d:939b  49 bc 7b	  eor #$7bbc
$1d:939e  87 31		 sta [$31]
$1d:93a0  ee c3 20	  inc $20c3
$1d:93a3  a8			tay
$1d:93a4  11 3a		 ora ($3a),y
$1d:93a6  04 49		 tsb $49
$1d:93a8  6e 68 42	  ror $4268
$1d:93ab  cf 46 33 e9   cmp $e93346
$1d:93af  33 b6		 and ($b6,s),y
$1d:93b1  46 2d		 lsr $2d
$1d:93b3  a9 33 b7	  lda #$b733
$1d:93b6  46 2d		 lsr $2d
$1d:93b8  e8			inx
$1d:93b9  b2 86		 lda ($86)
$1d:93bb  5d e1 90	  eor $90e1,x
$1d:93be  b8			clv
$1d:93bf  65 e2		 adc $e2
$1d:93c1  19 17 70	  ora $7017,y
$1d:93c4  85 31		 sta $31
$1d:93c6  c0 11 7a	  cpy #$7a11
$1d:93c9  65 e2		 adc $e2
$1d:93cb  00 ef		 brk #$ef
$1d:93cd  f0 07		 beq $93d6
$1d:93cf  84 7c		 sty $7c
$1d:93d1  2c 4e 11	  bit $114e
$1d:93d4  71 03		 adc ($03),y
$1d:93d6  98			tya
$1d:93d7  22 e1 6f 1f   jsl $1f6fe1
$1d:93db  f9 43 cc	  sbc $cc43,y
$1d:93de  3e 72 f4	  rol $f472,x
$1d:93e1  1f a5 3d 4b   ora $4b3da5,x
$1d:93e5  eb			xba
$1d:93e6  6f 63 fb 63   adc $63fb63
$1d:93ea  dd 3e fa	  cmp $fa3e,x
$1d:93ed  f0 5f		 beq $944e
$1d:93ef  87 3c		 sta [$3c]
$1d:93f1  5b			tcd
$1d:93f2  e3 ef		 sbc $ef,s
$1d:93f4  27 f9		 and [$f9]
$1d:93f6  83 ce		 sta $ce,s
$1d:93f8  3e 82 f4	  rol $f482,x
$1d:93fb  9f a9 3d 6b   sta $6b3da9,x
$1d:93ff  ec 6f 6b	  cpx $6b6f
$1d:9402  fb			xce
$1d:9403  a1 00		 lda ($00,x)
$1d:9405  04 04		 tsb $04
$1d:9407  00 10		 brk #$10
$1d:9409  80 bb		 bra $93c6
$1d:940b  fd f0 d6	  sbc $d6f0,x
$1d:940e  8b			phb
$1d:940f  4e 5e d0	  lsr $d05e
$1d:9412  09 07 c4	  ora #$c407
$1d:9415  5c 2e 39 fb   jml $fb392e
$1d:9419  80 64		 bra $947f
$1d:941b  1f 11 80 14   ora $148011,x
$1d:941f  93 e2		 sta ($e2,s),y
$1d:9421  70 23		 bvs $9446
$1d:9423  91 c1		 sta ($c1),y
$1d:9425  be 27 1d	  ldx $1d27,y
$1d:9428  6d 24 86	  adc $8624
$1d:942b  13 1e		 ora ($1e,s),y
$1d:942d  f8			sed
$1d:942e  8c 1d b6	  sty $b61d
$1d:9431  0f 6d 1c 83   ora $831c6d
$1d:9435  e2 30		 sep #$30
$1d:9437  56 d8		 lsr $d8,x
$1d:9439  0d b4 59	  ora $59b4
$1d:943c  66 b0		 ror $b0
$1d:943e  2e 03 e3	  rol $e303
$1d:9441  d1 de		 cmp ($de),y
$1d:9443  9f f5 87 b0   sta $b087f5,x
$1d:9447  7d a5 ee	  adc $eea5,x
$1d:944a  3f 77 46 5e   and $5e4677,x
$1d:944e  d1 68		 cmp ($68),y
$1d:9450  b4 bf		 ldy $bf,x
$1d:9452  c9 dc		 cmp #$dc
$1d:9454  00 01		 brk #$01
$1d:9456  ad 82 c3	  lda $c382
$1d:9459  3f 70 80 dc   and $dc8070,x
$1d:945d  41 e1		 eor ($e1,x)
$1d:945f  70 b8		 bvs $9419
$1d:9461  bb			tyx
$1d:9462  80 28		 bra $948c
$1d:9464  18			clc
$1d:9465  8b			phb
$1d:9466  1e 2a a9	  asl $a92a,x
$1d:9469  80 c1		 bra $942c
$1d:946b  40			rti
$1d:946c  4d a2 1f	  eor $1fa2
$1d:946f  18			clc
$1d:9470  0d ba df	  ora $dfba
$1d:9473  6a			ror a
$1d:9474  b0 5b		 bcs $94d1
$1d:9476  2a			rol a
$1d:9477  d8			cld
$1d:9478  1c 2e 3f	  trb $3f2e
$1d:947b  03 83		 ora $83,s
$1d:947d  80 8c		 bra $940b
$1d:947f  84 4e		 sty $4e
$1d:9481  36 aa		 rol $aa,x
$1d:9483  35 d6		 and $d6,x
$1d:9485  aa			tax
$1d:9486  6d 03 68	  adc $6803
$1d:9489  61 31		 adc ($31,x)
$1d:948b  e2 52		 sep #$52
$1d:948d  80 db		 bra $946a
$1d:948f  ee 55 ca	  inc $ca55
$1d:9492  e5 77		 sbc $77
$1d:9494  02 4f		 cop #$4f
$1d:9496  4c 1c 06	  jmp $061c
$1d:9499  03 87		 ora $87,s
$1d:949b  24 85		 bit $85
$1d:949d  92 c9		 sta ($c9)
$1d:949f  57 20		 eor [$20],y
$1d:94a1  81 7c		 sta ($7c,x)
$1d:94a3  f0 45		 beq $94ea
$1d:94a5  70 bb		 bvs $9462
$1d:94a7  0a			asl a
$1d:94a8  02 cc		 cop #$cc
$1d:94aa  5d 0b d8	  eor $d80b,x
$1d:94ad  d0 09		 bne $94b8
$1d:94af  e0 57		 cpx #$57
$1d:94b1  08			php
$1d:94b2  29 5c		 and #$5c
$1d:94b4  28			plp
$1d:94b5  b8			clv
$1d:94b6  7b			tdc
$1d:94b7  79 ac 2b	  adc $2bac,y
$1d:94ba  e6 61		 inc $61
$1d:94bc  40			rti
$1d:94bd  31 ec		 and ($ec),y
$1d:94bf  2d f0 1b	  and $1bf0
$1d:94c2  a6 19		 ldx $19
$1d:94c4  01 08		 ora ($08,x)
$1d:94c6  01 81		 ora ($81,x)
$1d:94c8  9a			txs
$1d:94c9  41 3f		 eor ($3f,x)
$1d:94cb  97 74		 sta [$74],y
$1d:94cd  fe df d3	  inc $d3df,x
$1d:94d0  fa			plx
$1d:94d1  cd f6 f7	  cmp $f7f6
$1d:94d4  a7 f6		 lda [$f6]
$1d:94d6  d3 5b		 cmp ($5b,s),y
$1d:94d8  b4 5a		 ldy $5a,x
$1d:94da  2d 25 70	  and $7025
$1d:94dd  00 8e		 brk #$8e
$1d:94df  5c 0e 78 ab   jml $ab780e
$1d:94e3  1e 26 e1	  asl $e126,x
$1d:94e6  71 2b		 adc ($2b),y
$1d:94e8  85 c0		 sta $c0
$1d:94ea  24 19		 bit $19
$1d:94ec  f0 b9		 beq $94a7
$1d:94ee  db			stp
$1d:94ef  2c 16 bb	  bit $bb16
$1d:94f2  7a			ply
$1d:94f3  78			sei
$1d:94f4  6f 17 81 28   adc $288117
$1d:94f8  8a			txa
$1d:94f9  46 f3		 lsr $f3
$1d:94fb  75 a3		 adc $a3,x
$1d:94fd  da			phx
$1d:94fe  ed c8 01	  sbc $01c8
$1d:9501  16 80		 asl $80,x
$1d:9503  a1 2f		 lda ($2f,x)
$1d:9505  55 ea		 eor $ea,x
$1d:9507  f5 cd		 sbc $cd,x
$1d:9509  5c 43 d0 c7   jml $c7d043
$1d:950d  89 92		 bit #$92
$1d:950f  cb			wai
$1d:9510  65 46		 adc $46
$1d:9512  06 1c		 asl $1c
$1d:9514  48			pha
$1d:9515  42 c1		 wdm #$c1
$1d:9517  12 8d		 ora ($8d)
$1d:9519  f6 cb		 inc $cb,x
$1d:951b  67 11		 adc [$11]
$1d:951d  80 8c		 bra $94ab
$1d:951f  c7 82		 cmp [$82]
$1d:9521  48			pha
$1d:9522  1b			tcs
$1d:9523  cd 9e dd	  cmp $dd9e
$1d:9526  45 c3		 eor $c3
$1d:9528  ab			plb
$1d:9529  8a			txa
$1d:952a  0a			asl a
$1d:952b  64 38		 stz $38
$1d:952d  08			php
$1d:952e  dc 2d f6	  jml [$f62d]
$1d:9531  e2 88		 sep #$88
$1d:9533  20 e2 f3	  jsr $f3e2
$1d:9536  03 41		 ora $41,s
$1d:9538  c9 d0		 cmp #$d0
$1d:953a  6f 89 0c 56   adc $560c89
$1d:953e  7a			ply
$1d:953f  f7 d9		 sbc [$d9],y
$1d:9541  de df f7	  dec $f7df,x
$1d:9544  7e da 2d	  ror $2dda,x
$1d:9547  39 70 00	  and $0070,y
$1d:954a  20 e6 e1	  jsr $e1e6
$1d:954d  71 cf		 adc ($cf),y
$1d:954f  84 01		 sty $01
$1d:9551  07 19		 ora [$19]
$1d:9553  62 b2 20	  per $b608
$1d:9556  df 3c 5d 0d   cmp $0d5d3c,x
$1d:955a  06 84		 asl $84
$1d:955c  49 26		 eor #$26
$1d:955e  81 d4		 sta ($d4,x)
$1d:9560  6a			ror a
$1d:9561  44 92 65	  mvp $65,$92
$1d:9564  32 27		 and ($27)
$1d:9566  95 71		 sta $71,x
$1d:9568  df e8 3f 4a   cmp $4a3fe8,x
$1d:956c  7a			ply
$1d:956d  97 d6		 sta [$d6],y
$1d:956f  de c7 f6	  dec $f6c7,x
$1d:9572  c7 ba		 cmp [$ba]
$1d:9574  7d f5 e0	  adc $e0f5,x
$1d:9577  bf 0e 79 70   lda $70790e,x
$1d:957b  60			rts
$1d:957c  50 c8		 bvc $9546
$1d:957e  64 22		 stz $22
$1d:9580  0d 09 19	  ora $1909
$1d:9583  00 dc		 brk #$dc
$1d:9585  60			rts
$1d:9586  45 c2		 eor $c2
$1d:9588  87 49		 sta [$49]
$1d:958a  a4 d2		 ldy $d2
$1d:958c  48			pha
$1d:958d  84 96		 sty $96
$1d:958f  4d 27 a1	  eor $a127
$1d:9592  50 e4		 bvc $9578
$1d:9594  f0 e1		 beq $9577
$1d:9596  e9 cb		 sbc #$cb
$1d:9598  a8			tay
$1d:9599  12 c8		 ora ($c8)
$1d:959b  c4 b6		 cpy $b6
$1d:959d  7f 2f 9a 4d   adc $4d9a2f,x
$1d:95a1  69 64		 adc #$64
$1d:95a3  c4 c8		 cpy $c8
$1d:95a5  50 63		 bvc $960a
$1d:95a7  51 ab		 eor ($ab),y
$1d:95a9  0c de c3	  tsb $c3de
$1d:95ac  3a			dec a
$1d:95ad  9d d4 c9	  sta $c9d4,x
$1d:95b0  89 98		 bit #$98
$1d:95b2  8e 64 72	  stx $7264
$1d:95b5  46 40		 lsr $40
$1d:95b7  32 04		 and ($04)
$1d:95b9  74 d6		 stz $d6,x
$1d:95bb  a6 50		 ldx $50
$1d:95bd  cc e6 8e	  cpy $8ee6
$1d:95c0  c3 48		 cmp $48,s
$1d:95c2  a4 d2		 ldy $d2
$1d:95c4  89 89		 bit #$89
$1d:95c6  1e 49 04	  asl $0449,x
$1d:95c9  6e 38 92	  ror $9238
$1d:95cc  0a			asl a
$1d:95cd  85 45		 sta $45
$1d:95cf  16 83		 asl $83,x
$1d:95d1  10 83		 bpl $9556
$1d:95d3  0c c2 3a	  tsb $3ac2
$1d:95d6  36 05		 rol $05,x
$1d:95d8  18			clc
$1d:95d9  0e d0 4c	  asl $4cd0
$1d:95dc  71 d1		 adc ($d1),y
$1d:95de  06 c6		 asl $c6
$1d:95e0  44 1e d7	  mvp $d7,$1e
$1d:95e3  f7 47		 sbc [$47],y
$1d:95e5  be 7c 15	  ldx $157c,y
$1d:95e8  e1 bf		 sbc ($bf,x)
$1d:95ea  16 78		 asl $78,x
$1d:95ec  f7 c9		 sbc [$c9],y
$1d:95ee  de 5f f3	  dec $f35f,x
$1d:95f1  87 a0		 sta [$a0]
$1d:95f3  7d 25 ea	  adc $ea25,x
$1d:95f6  3f 5a 7b 17   and $177b5a,x
$1d:95fa  da			phx
$1d:95fb  de e7 f7	  dec $f7e7,x
$1d:95fe  c7 82		 cmp [$82]
$1d:9600  7c 35 e2	  jmp ($e235,x)
$1d:9603  bf 1e 79 37   lda $37791e,x
$1d:9607  cb			wai
$1d:9608  de 6f f4	  dec $f46f,x
$1d:960b  07 a4		 ora [$a4]
$1d:960d  7d 45 eb	  adc $eb45,x
$1d:9610  3f 62 7b 57   and $577b62,x
$1d:9614  dc de f7	  jml [$f7de]
$1d:9617  f0 47		 beq $9660
$1d:9619  86 7c		 stx $7c
$1d:961b  40			rti
$1d:961c  90 28		 bcc $9646
$1d:961e  68			pla
$1d:961f  c8			iny
$1d:9620  e1 50		 sbc ($50,x)
$1d:9622  68			pla
$1d:9623  5c 36 04 20   jml $200436
$1d:9627  28			plp
$1d:9628  7e 33 1b	  ror $1b33,x
$1d:962b  22 22 0c 82   jsl $820c22
$1d:962f  21 21		 and ($21,x)
$1d:9631  91 c3		 sta ($c3),y
$1d:9633  c7 a7		 cmp [$a7]
$1d:9635  32 98		 and ($98)
$1d:9637  4e 65 53	  lsr $5365
$1d:963a  6c a4 a2	  jmp ($a2a4)
$1d:963d  31 29		 and ($29),y
$1d:963f  95 93		 sta $93,x
$1d:9641  12 61		 ora ($61)
$1d:9643  31 9c		 and ($9c),y
$1d:9645  44 a2 b3	  mvp $b3,$a2
$1d:9648  3c 99 a0	  bit $a099,x
$1d:964b  35 44		 and $44,x
$1d:964d  c4 89		 cpy $89
$1d:964f  1c 86 b3	  trb $b386
$1d:9652  9b			txy
$1d:9653  3b			tsc
$1d:9654  8e 74 98	  stx $9874
$1d:9657  91 59		 sta ($59),y
$1d:9659  f9 c8 8e	  sbc $8ec8,y
$1d:965c  43 15		 eor $15,s
$1d:965e  26 24		 rol $24
$1d:9660  5e 6f 16	  lsr $166f,x
$1d:9663  8b			phb
$1d:9664  44 e2 89	  mvp $89,$e2
$1d:9667  40			rti
$1d:9668  8b			phb
$1d:9669  45 c9		 eor $c9
$1d:966b  86 31		 stx $31
$1d:966d  18			clc
$1d:966e  30 dc		 bmi $964c
$1d:9670  22 a3 a0 52   jsl $52a0a3
$1d:9674  00 f0		 brk #$f0
$1d:9676  c4 09		 cpy $09
$1d:9678  15 10		 ora $10,x
$1d:967a  6c 44 41	  jmp ($4144)
$1d:967d  ed 8f 74	  sbc $748f
$1d:9680  fb			xce
$1d:9681  eb			xba
$1d:9682  c1 7e		 cmp ($7e,x)
$1d:9684  1c f4 f2	  trb $f2f4
$1d:9687  0c 99 58	  tsb $5899
$1d:968a  70 f9		 bvs $9685
$1d:968c  14 8e		 trb $8e
$1d:968e  9d 4f 22	  sta $224f,x
$1d:9691  11 08		 ora ($08),y
$1d:9693  21 e3		 and ($e3,x)
$1d:9695  d3 db		 cmp ($db,s),y
$1d:9697  6b			rtl
$1d:9698  69 94		 adc #$94
$1d:969a  d2 a1		 cmp ($a1)
$1d:969c  6b			rtl
$1d:969d  36 e4		 rol $e4,x
$1d:969f  c4 cd		 cpy $cd
$1d:96a1  e5 74		 sbc $74
$1d:96a3  db			stp
$1d:96a4  ee 3f 1f	  inc $1f3f
$1d:96a7  7f a6 d3 e7   adc $e7d3a6,x
$1d:96ab  49 89		 eor #$89
$1d:96ad  ae d7 69	  ldx $69d7
$1d:96b0  4e 40 72	  lsr $7240
$1d:96b3  2d 79 31	  and $3179
$1d:96b6  34 5a		 bit $5a,x
$1d:96b8  2d 22 08	  and $0822
$1d:96bb  10 45		 bpl $9702
$1d:96bd  a3 26		 lda $26,s
$1d:96bf  24 52		 bit $52
$1d:96c1  2d 16 89	  and $8916
$1d:96c4  c4 92		 cpy $92
$1d:96c6  45 15		 eor $15
$1d:96c8  26 25		 rol $25
$1d:96ca  67 56		 adc [$56]
$1d:96cc  a3 08		 lda $08,s
$1d:96ce  92 88		 sta ($88)
$1d:96d0  93 6a		 sta ($6a,s),y
$1d:96d2  92 f5		 sta ($f5)
$1d:96d4  1f ad 3d 8b   ora $8b3dad,x
$1d:96d8  4f 0f 00 f8   eor $f8000f
$1d:96dc  4b			phk
$1d:96dd  c4 7e		 cpy $7e
$1d:96df  34 f2		 bit $f2,x
$1d:96e1  2f 94 66 05   and $056694
$1d:96e5  0c 31 84	  tsb $8431
$1d:96e8  22 0d 09 31   jsl $31090d
$1d:96ec  89 8c		 bit #$8c
$1d:96ee  20 45 11	  jsr $1145
$1d:96f1  87 49		 sta [$49]
$1d:96f3  8e 61 24	  stx $2461
$1d:96f6  88			dey
$1d:96f7  49 4e		 eor #$4e
$1d:96f9  63 27		 adc $27,s
$1d:96fb  a5 c3		 lda $c3
$1d:96fd  8d e5 2e	  sta $2ee5
$1d:9700  c8			iny
$1d:9701  20 c2 30	  jsr $30c2
$1d:9704  84 19		 sty $19
$1d:9706  74 be		 stz $be,x
$1d:9708  a6 7e		 ldx $7e
$1d:970a  3d 86 62	  and $6286,x
$1d:970d  b4 94		 ldy $94,x
$1d:970f  3d 94 76	  and $7694,x
$1d:9712  94 7e		 sty $7e,x
$1d:9714  3d c4 f2	  and $f2c4,x
$1d:9717  c4 a4		 cpy $a4
$1d:9719  3d d5 85	  and $85d5,x
$1d:971c  1a			inc a
$1d:971d  91 a5		 sta ($a5),y
$1d:971f  9b			txy
$1d:9720  d4 8f		 pei ($8f)
$1d:9722  c7 b1		 cmp [$b1]
$1d:9724  c5 d6		 cmp $d6
$1d:9726  18			clc
$1d:9727  83 b9		 sta $b9,s
$1d:9729  8e 4f e7	  stx $e74f
$1d:972c  f1 d4		 sbc ($d4),y
$1d:972e  74 ec		 stz $ec,x
$1d:9730  ac 33 79	  ldy $7933
$1d:9733  bb			tyx
$1d:9734  35 14		 and $14,x
$1d:9736  69 ba		 adc #$ba
$1d:9738  59 8b 34	  eor $348b,y
$1d:973b  de 3e 02	  dec $023e,x
$1d:973e  f0 9f		 beq $96df
$1d:9740  89 3c		 bit #$3c
$1d:9742  6b			rtl
$1d:9743  e4 6f		 cpx $6f
$1d:9745  27 b4		 and [$b4]
$1d:9747  0a			asl a
$1d:9748  1a			inc a
$1d:9749  61 08		 adc ($08,x)
$1d:974b  54 1a 16	  mvn $16,$1a
$1d:974e  64 18		 stz $18
$1d:9750  6c 08 9e	  jmp ($9e08)
$1d:9753  50 f9		 bvc $974e
$1d:9755  11 c4		 ora ($c4),y
$1d:9757  24 11		 bit $11
$1d:9759  09 09		 ora #$09
$1d:975b  d0 64		 bne $97c1
$1d:975d  70 f3		 bvs $9752
$1d:975f  61 d1		 adc ($d1,x)
$1d:9761  25 52		 and $52
$1d:9763  a9 44		 lda #$44
$1d:9765  62 52 84	  per $1bba
$1d:9768  19 59 ed	  ora $ed59,y
$1d:976b  28			plp
$1d:976c  31 28		 and ($28),y
$1d:976e  94 53		 sty $53,x
$1d:9770  20 94 28	  jsr $2894
$1d:9773  a9 ed		 lda #$ed
$1d:9775  12 41		 ora ($41)
$1d:9777  12 ac		 ora ($ac)
$1d:9779  e6 14		 inc $14
$1d:977b  84 9a		 sty $9a
$1d:977d  58			cli
$1d:977e  a6 47		 ldx $47
$1d:9780  25 7e		 and $7e
$1d:9782  50 8a		 bvc $970e
$1d:9784  48			pha
$1d:9785  13 4b		 ora ($4b,s),y
$1d:9787  59 cc e6	  eor $e6cc,y
$1d:978a  96 96		 stx $96,y
$1d:978c  a1 14		 lda ($14,x)
$1d:978e  a7 a9		 lda [$a9]
$1d:9790  65 df		 adc $df
$1d:9792  e0 0f		 cpx #$0f
$1d:9794  08			php
$1d:9795  f9 4b 61	  sbc $614b,y
$1d:9798  90 68		 bcc $9802
$1d:979a  34 30		 bit $30,x
$1d:979c  6a			ror a
$1d:979d  03 32		 ora $32,s
$1d:979f  35 9c		 and $9c,x
$1d:97a1  3a			dec a
$1d:97a2  4d 10 88	  eor $8810
$1d:97a5  49 88		 eor #$88
$1d:97a7  a0 43		 ldy #$43
$1d:97a9  19 3c 38	  ora $383c,y
$1d:97ac  7a			ply
$1d:97ad  72 ed		 adc ($ed)
$1d:97af  06 86		 asl $86
$1d:97b1  5c 55 02 98   jml $980255
$1d:97b5  cb			wai
$1d:97b6  c9 89		 cmp #$89
$1d:97b8  61 d4		 adc ($d4,x)
$1d:97ba  6a			ror a
$1d:97bb  63 51		 adc $51,s
$1d:97bd  a3 11		 lda $11,s
$1d:97bf  47 49		 eor [$49]
$1d:97c1  88			dey
$1d:97c2  65 03		 adc $03
$1d:97c4  92 9a		 sta ($9a)
$1d:97c6  d2 04		 cmp ($04)
$1d:97c8  72 38		 adc ($38)
$1d:97ca  e4 fd		 cpx $fd
$1d:97cc  0e 06 b4	  asl $b406
$1d:97cf  80 c7		 bra $9798
$1d:97d1  0a			asl a
$1d:97d2  60			rts
$1d:97d3  65 19		 adc $19
$1d:97d5  ba			tsx
$1d:97d6  5c 11 6a 62   jml $626a11
$1d:97da  33 bc		 and ($bc,s),y
$1d:97dc  41 0e		 eor ($0e,x)
$1d:97de  49 1c		 eor #$1c
$1d:97e0  ca			dex
$1d:97e1  64 f5		 stz $f5
$1d:97e3  47 c9		 eor [$c9]
$1d:97e5  35 06		 and $06,x
$1d:97e7  73 37		 adc ($37,s),y
$1d:97e9  9d 26 22	  sta $2226,x
$1d:97ec  48			pha
$1d:97ed  d8			cld
$1d:97ee  e2 6a		 sep #$6a
$1d:97f0  65 12		 adc $12
$1d:97f2  36 06		 rol $06,x
$1d:97f4  7a			ply
$1d:97f5  4c 38 7c	  jmp $7c38
$1d:97f8  59 e4 31	  eor $31e4,y
$1d:97fb  38			sec
$1d:97fc  a3 c8		 lda $c8,s
$1d:97fe  62 f0 f1	  per $89f1
$1d:9801  69 c3		 adc #$c3
$1d:9803  61 50		 adc ($50,x)
$1d:9805  68			pla
$1d:9806  5c 2a 2a 05   jml $052a2a
$1d:980a  00 20		 brk #$20
$1d:980c  0f 0c 44 91   ora $91440c
$1d:9810  50 6c		 bvc $987e
$1d:9812  03 4e		 ora $4e,s
$1d:9814  22 18 d1 b7   jsl $b7d118
$1d:9818  91 fc		 sta ($fc),y
$1d:981a  b1 e6		 lda ($e6),y
$1d:981c  9f 3d 7a 2f   sta $2f7a3d,x
$1d:9820  d3 9e		 cmp ($9e,s),y
$1d:9822  ad fd a6	  lda $a6fd
$1d:9825  d7 79		 cmp [$79],y
$1d:9827  bd 5f 86	  lda $865f,x
$1d:982a  d1 84		 cmp ($84),y
$1d:982c  6c 11 de	  jmp ($de11)
$1d:982f  ec f7 6c	  cpx $6cf7
$1d:9832  fc 68 6e	  jsr ($6e68,x)
$1d:9835  cc 26 30	  cpy $3026
$1d:9838  e8			inx
$1d:9839  f3 cd		 sbc ($cd,s),y
$1d:983b  23 71		 and $71,s
$1d:983d  c8			iny
$1d:983e  f4 7e 1c	  pea $1c7e
$1d:9841  13 18		 ora ($18,s),y
$1d:9843  14 32		 trb $32
$1d:9845  0d 0c 01	  ora $010c
$1d:9848  94 22		 sty $22,x
$1d:984a  3b			tsc
$1d:984b  09 86		 ora #$86
$1d:984d  40			rti
$1d:984e  95 d5		 sta $d5,x
$1d:9850  1d 57 6c	  ora $6c57,x
$1d:9853  65 5d		 adc $5d
$1d:9855  e3 cf		 sbc $cf,s
$1d:9857  26 f9		 rol $f9
$1d:9859  7b			tdc
$1d:985a  cd fe 80	  cmp $80fe
$1d:985d  f4 8f a8	  pea $a88f
$1d:9860  bd 5d 3b	  lda $3b5d,x
$1d:9863  4d ee f3	  eor $f3ee
$1d:9866  6a			ror a
$1d:9867  bf 05 f9 b0   lda $b0f905,x
$1d:986b  8d c1 bb	  sta $bbc1
$1d:986e  b6 86		 ldx $86,y
$1d:9870  ec e0 30	  cpx $30e0
$1d:9873  f8			sed
$1d:9874  b4 4e		 ldy $4e,x
$1d:9876  29 16		 and #$16
$1d:9878  7a			ply
$1d:9879  1c 5e 1e	  trb $1e5e
$1d:987c  12 28		 ora ($28)
$1d:987e  14 36		 trb $36
$1d:9880  15 15		 ora $15,x
$1d:9882  85 c3		 sta $c3
$1d:9884  60			rts
$1d:9885  d0 d0		 bne $9857
$1d:9887  28			plp
$1d:9888  c0 84		 cpy #$84
$1d:988a  4b			phk
$1d:988b  15 57		 ora $57,x
$1d:988d  6c 45 5d	  jmp ($5d45)
$1d:9890  e3 4f		 sbc $4f,s
$1d:9892  22 f9 5b cc   jsl $cc5bf9
$1d:9896  fe 78 f4	  inc $f478,x
$1d:9899  4f a6 bd 57   eor $57bda6
$1d:989d  ea			nop
$1d:989e  e0 de		 cpx #$de
$1d:98a0  6d 76 8c	  adc $8c76
$1d:98a3  02 de		 cop #$de
$1d:98a5  ef 37 ac 33   sbc $33ac37
$1d:98a9  da			phx
$1d:98aa  b8			clv
$1d:98ab  37 76		 and [$76],y
$1d:98ad  d0 dd		 bne $988c
$1d:98af  9a			txs
$1d:98b0  b8			clv
$1d:98b1  21 d1		 and ($d1,x)
$1d:98b3  e8			inx
$1d:98b4  f4 6e 38	  pea $386e
$1d:98b7  f2 08		 sbc ($08)
$1d:98b9  fe 72 3f	  inc $3f72,x
$1d:98bc  3e 87 2b	  rol $2b87,x
$1d:98bf  8a			txa
$1d:98c0  05 0c		 ora $0c
$1d:98c2  86 42		 stx $42
$1d:98c4  23 b0		 and $b0,s
$1d:98c6  98			tya
$1d:98c7  64 18		 stz $18
$1d:98c9  0e 30 25	  asl $2530
$1d:98cc  73 47		 adc ($47,s),y
$1d:98ce  55 db		 eor $db,x
$1d:98d0  19 57 78	  ora $7857,y
$1d:98d3  db			stp
$1d:98d4  c8			iny
$1d:98d5  fe 58 f3	  inc $f358,x
$1d:98d8  4f 9e bd 17   eor $17bd9e
$1d:98dc  e9 cf		 sbc #$cf
$1d:98de  56 fe		 lsr $fe,x
$1d:98e0  d3 6a		 cmp ($6a,s),y
$1d:98e2  bf 0d e3 00   lda $00e30d,x
$1d:98e6  37 ab		 and [$ab],y
$1d:98e8  f1 de		 sbc ($de),y
$1d:98ea  b0 c7		 bcs $98b3
$1d:98ec  6a			ror a
$1d:98ed  e0 dd		 cpx #$dd
$1d:98ef  db			stp
$1d:98f0  43 76		 eor $76,s
$1d:98f2  60			rts
$1d:98f3  00 08		 brk #$08
$1d:98f5  81 40		 sta ($40,x)
$1d:98f7  1d e9 14	  ora $14e9,x
$1d:98fa  80 c5		 bra $98c1
$1d:98fc  20 4f 91	  jsr $914f
$1d:98ff  7c 03 e0	  jmp ($e003,x)
$1d:9902  20 6f b3	  jsr $b36f
$1d:9905  82 45 20	  brl $b94d
$1d:9908  a0 91		 ldy #$91
$1d:990a  04 00		 tsb $00
$1d:990c  20 20 c0	  jsr $c020
$1d:990f  b3 83		 lda ($83,s),y
$1d:9911  c5 21		 cmp $21
$1d:9913  01 91		 ora ($91,x)
$1d:9915  0c 00 60	  tsb $6000
$1d:9918  21 21		 and ($21,x)
$1d:991a  b2 8d		 lda ($8d)
$1d:991c  54 23 55	  mvn $55,$23
$1d:991f  18			clc
$1d:9920  d5 82		 cmp $82,x
$1d:9922  35 61		 and $61,x
$1d:9924  8d 4d 3b	  sta $3b4d
$1d:9927  54 48 d5	  mvn $d5,$48
$1d:992a  13 b5		 ora ($b5,s),y
$1d:992c  34 cd		 bit $cd,x
$1d:992e  51 2b		 eor ($2b),y
$1d:9930  43 60		 eor $60,s
$1d:9932  9a			txs
$1d:9933  56 a8		 lsr $a8,x
$1d:9935  80 72		 bra $99a9
$1d:9937  ea			nop
$1d:9938  03 8a		 ora $8a,s
$1d:993a  09 18		 ora #$18
$1d:993c  21 0c		 and ($0c,x)
$1d:993e  62 8b 18	  per $b1cc
$1d:9941  80 c6		 bra $9909
$1d:9943  36 51		 rol $51,x
$1d:9945  88			dey
$1d:9946  14 63		 trb $63
$1d:9948  84 07		 sty $07
$1d:994a  48			pha
$1d:994b  c1 18		 cmp ($18,x)
$1d:994d  cb			wai
$1d:994e  68			pla
$1d:994f  5b			tcd
$1d:9950  12 e0		 ora ($e0)
$1d:9952  4d 62 d1	  eor $d162
$1d:9955  3a			dec a
$1d:9956  b4 8f		 ldy $8f,x
$1d:9958  2d 23 eb	  and $eb23
$1d:995b  1c 04 de	  trb $de04
$1d:995e  07 50		 ora [$50]
$1d:9960  39 84 6a	  and $6a84,y
$1d:9963  27 5a		 and [$5a]
$1d:9965  91 e6		 sta ($e6),y
$1d:9967  a4 7d		 ldy $7d
$1d:9969  a4 00		 ldy $00
$1d:996b  9f c1 0a 08   sta $080ac1,x
$1d:996f  30 8d		 bmi $98fe
$1d:9971  5c 23 57 18   jml $185723
$1d:9975  d6 02		 dec $02,x
$1d:9977  35 81		 and $81,x
$1d:9979  27 8e		 and [$8e]
$1d:997b  48			pha
$1d:997c  a6 3a		 ldx $3a
$1d:997e  22 fa d1 4c   jsl $4cd1fa
$1d:9982  eb			xba
$1d:9983  04 8b		 tsb $8b
$1d:9985  48			pha
$1d:9986  22 d1 15 79   jsl $7915d1
$1d:998a  3b			tsc
$1d:998b  c2 2d		 rep #$2d
$1d:998d  b7 77		 lda [$77],y
$1d:998f  94 5b		 sty $5b,x
$1d:9991  6d 16 e9	  adc $e916
$1d:9994  c5 b8		 cmp $b8
$1d:9996  d1 6e		 cmp ($6e),y
$1d:9998  3d 5b 67	  and $675b,x
$1d:999b  56 db		 lsr $db,x
$1d:999d  55 98		 eor $98,x
$1d:999f  c1 c6		 cmp ($c6,x)
$1d:99a1  ab			plb
$1d:99a2  2e 8d ea	  rol $ea8d
$1d:99a5  79 27 c8	  adc $c827,y
$1d:99a8  e8			inx
$1d:99a9  a2 d5		 ldx #$d5
$1d:99ab  08			php
$1d:99ac  b5 46		 lda $46,x
$1d:99ae  2d 60 8b	  and $8b60
$1d:99b1  58			cli
$1d:99b2  62 d1 25	  per $bf86
$1d:99b5  78			sei
$1d:99b6  ba			tsx
$1d:99b7  0b			phd
$1d:99b8  29 16 ca	  and #$ca16
$1d:99bb  e5 a3		 sbc $a3
$1d:99bd  51 6d		 eor ($6d),y
$1d:99bf  2b			pld
$1d:99c0  5c 5b 81 b5   jml $b5815b
$1d:99c4  6b			rtl
$1d:99c5  84 5b		 sty $5b
$1d:99c7  ad 16 eb	  lda $eb16
$1d:99ca  c5 bc		 cmp $bc
$1d:99cc  d1 6f		 cmp ($6f),y
$1d:99ce  3d 5b af	  and $af5b,x
$1d:99d1  56 eb		 lsr $eb,x
$1d:99d3  55 80		 eor $80,x
$1d:99d5  c0 04		 cpy #$04
$1d:99d7  0e 1c 5b	  asl $5b1c
$1d:99da  66 11		 ror $11
$1d:99dc  1e 20 4c	  asl $4c20,x
$1d:99df  c2 02		 rep #$02
$1d:99e1  f7 38		 sbc [$38],y
$1d:99e3  15 53		 ora $53,x
$1d:99e5  27 16		 and [$16]
$1d:99e7  b6 45		 ldx $45,y
$1d:99e9  ad f5 6d	  lda $6df5
$1d:99ec  2f 5a 35 96   and $96355a
$1d:99f0  85 45		 sta $45
$1d:99f2  b2 cb		 lda ($cb)
$1d:99f4  71 d3		 adc ($d3),y
$1d:99f6  45 b2		 eor $b2
$1d:99f8  f1 68		 sbc ($68),y
$1d:99fa  14 5b		 trb $5b
$1d:99fc  4f 16 e2 80   eor $80e216
$1d:9a00  c8			iny
$1d:9a01  06 60		 asl $60
$1d:9a03  c1 05		 cmp ($05,x)
$1d:9a05  9f 8e 2d e4   sta $e42d8e,x
$1d:9a09  09 9b 08	  ora #$089b
$1d:9a0c  0a			asl a
$1d:9a0d  40			rti
$1d:9a0e  10 28		 bpl $9a38
$1d:9a10  0d 5b cb	  ora $cb5b
$1d:9a13  56 d1		 lsr $d1,x
$1d:9a15  d5 b4		 cmp $b4,x
$1d:9a17  f5 6c		 sbc $6c,x
$1d:9a19  b7 5a		 lda [$5a],y
$1d:9a1b  15 56		 ora $56,x
$1d:9a1d  d3 50		 cmp ($50,s),y
$1d:9a1f  86 85		 stx $85
$1d:9a21  a7 19		 lda [$19]
$1d:9a23  98			tya
$1d:9a24  f8			sed
$1d:9a25  07 41		 ora [$41]
$1d:9a27  98			tya
$1d:9a28  8b			phb
$1d:9a29  66 5e		 ror $5e
$1d:9a2b  e7 d5		 sbc [$d5]
$1d:9a2d  6b			rtl
$1d:9a2e  84 48		 sty $48
$1d:9a30  84 1b		 sty $1b
$1d:9a32  34 38		 bit $38,x
$1d:9a34  f1 2a		 sbc ($2a),y
$1d:9a36  dc 34 38	  jml [$3834]
$1d:9a39  e1 90		 sbc ($90,x)
$1d:9a3b  e0 1f		 cpx #$1f
$1d:9a3d  5c d1 7c 4c   jml $4c7cd1
$1d:9a41  81 b8		 sta ($b8,x)
$1d:9a43  ab			plb
$1d:9a44  66 0c		 ror $0c
$1d:9a46  a3 a6		 lda $a6,s
$1d:9a48  35 9e		 and $9e,x
$1d:9a4a  a2 2d		 ldx #$2d
$1d:9a4c  a9 19 8e	  lda #$8e19
$1d:9a4f  aa			tax
$1d:9a50  2d 9b 8b	  and $8b9b
$1d:9a53  74 22		 stz $22,x
$1d:9a55  da			phx
$1d:9a56  b8			clv
$1d:9a57  b7 82		 lda [$82],y
$1d:9a59  2d d1 8b	  and $8bd1
$1d:9a5c  74 a2		 stz $a2,x
$1d:9a5e  de 18 b7	  dec $b718,x
$1d:9a61  89 72 2b	  bit #$2b72
$1d:9a64  a0 5f		 ldy #$5f
$1d:9a66  07 82		 ora [$82]
$1d:9a68  29 a0 8a	  and #$8aa0
$1d:9a6b  75 19		 adc $19,x
$1d:9a6d  e4 c1		 cpx $c1
$1d:9a6f  15 d0		 ora $d0,x
$1d:9a71  31 83		 and ($83),y
$1d:9a73  c1 56		 cmp ($56,x)
$1d:9a75  e8			inx
$1d:9a76  55 b3		 eor $b3,x
$1d:9a78  75 66		 adc $66,x
$1d:9a7a  f0 6a		 beq $9ae6
$1d:9a7c  ea			nop
$1d:9a7d  da			phx
$1d:9a7e  9a			txs
$1d:9a7f  b6 a2		 ldx $a2,y
$1d:9a81  ad aa 56	  lda $56aa
$1d:9a84  8c 82 2d	  sty $2d82
$1d:9a87  11 8b		 ora ($8b),y
$1d:9a89  55 a2		 eor $a2,x
$1d:9a8b  d5 78		 cmp $78,x
$1d:9a8d  b4 ce		 ldy $ce,x
$1d:9a8f  2d 32 8b	  and $8b32
$1d:9a92  50 62		 bvc $9af6
$1d:9a94  d4 24		 pei ($24)
$1d:9a96  b8			clv
$1d:9a97  ec 84 23	  cpx $2384
$1d:9a9a  c2 8b		 rep #$8b
$1d:9a9c  5c 22 d7 18   jml $18d722
$1d:9aa0  b6 02		 ldx $02,y
$1d:9aa2  2d 81 8b	  and $8b81
$1d:9aa5  44 9d e3	  mvp $e3,$9d
$1d:9aa8  58			cli
$1d:9aa9  8b			phb
$1d:9aaa  56 62		 lsr $62,x
$1d:9aac  d3 08		 cmp ($08,s),y
$1d:9aae  b4 c6		 ldy $c6,x
$1d:9ab0  2d 43 0d	  and $0d43
$1d:9ab3  89 70 24	  bit #$2470
$1d:9ab6  d1 6d		 cmp ($6d),y
$1d:9ab8  9c 6a 6d	  stz $6d6a
$1d:9abb  16 93		 asl $93,x
$1d:9abd  c5 b8		 cmp $b8
$1d:9abf  91 a9		 sta ($a9),y
$1d:9ac1  b8			clv
$1d:9ac2  8c 22 d6	  sty $d622
$1d:9ac5  68			pla
$1d:9ac6  b5 9e		 lda $9e,x
$1d:9ac8  2d 76 8b	  and $8b76
$1d:9acb  5d e2 d5	  eor $d5e2,x
$1d:9ace  28			plp
$1d:9acf  b5 4e		 lda $4e,x
$1d:9ad1  2d 62 8b	  and $8b62
$1d:9ad4  58			cli
$1d:9ad5  e2 99		 sep #$99
$1d:9ad7  08			php
$1d:9ad8  a6 45		 ldx $45
$1d:9ada  32 24		 and ($24)
$1d:9adc  00 4c		 brk #$4c
$1d:9ade  0e 51 30	  asl $3051
$1d:9ae1  10 18		 bpl $9afb
$1d:9ae3  b5 a2		 lda $a2,x
$1d:9ae5  2d 69 8b	  and $8b69
$1d:9ae8  5e 22 d7	  lsr $d722,x
$1d:9aeb  90 c8		 bcc $9ab5
$1d:9aed  86 02		 stx $02
$1d:9aef  80 5b		 bra $9b4c
$1d:9af1  11 00		 ora ($00),y
$1d:9af3  51 84		 eor ($84),y
$1d:9af5  67 47		 adc [$47]
$1d:9af7  14 ad		 trb $ad
$1d:9af9  69 ee 36	  adc #$36ee
$1d:9afc  a8			tay
$1d:9afd  b4 fd		 ldy $fd,x
$1d:9aff  ee 2f 80	  inc $802f
$1d:9b02  bd 06 c1	  lda $c106,x
$1d:9b05  a6 28		 ldx $28
$1d:9b07  03 3b		 ora $3b,s
$1d:9b09  98			tya
$1d:9b0a  70 2f		 bvs $9b3b
$1d:9b0c  6f 71 ad 9d   adc $9dad71
$1d:9b10  46 d7		 lsr $d7
$1d:9b12  16 aa		 asl $aa,x
$1d:9b14  45 aa		 eor $aa
$1d:9b16  b1 6b		 lda ($6b),y
$1d:9b18  24 5a		 bit $5a
$1d:9b1a  cb			wai
$1d:9b1b  16 b9		 asl $b9,x
$1d:9b1d  45 ae		 eor $ae
$1d:9b1f  71 6c		 adc ($6c),y
$1d:9b21  14 5b		 trb $5b
$1d:9b23  07 50		 ora [$50]
$1d:9b25  e8			inx
$1d:9b26  d4 3a		 pei ($3a)
$1d:9b28  0a			asl a
$1d:9b29  72 81		 adc ($81)
$1d:9b2b  3b			tsc
$1d:9b2c  82 9e af	  brl $4acd
$1d:9b2f  27 88		 and [$88]
$1d:9b31  c8			iny
$1d:9b32  56 e5		 lsr $e5,x
$1d:9b34  da			phx
$1d:9b35  ea			nop
$1d:9b36  66 ba		 ror $ba
$1d:9b38  8b			phb
$1d:9b39  f2 ab		 sbc ($ab)
$1d:9b3b  2e 82 24	  rol $2482
$1d:9b3e  c7 28		 cmp [$28]
$1d:9b40  b2 c8		 lda ($c8)
$1d:9b42  d5 e2		 cmp $e2,x
$1d:9b44  88			dey
$1d:9b45  40			rti
$1d:9b46  e0 6e		 cpx #$6e
$1d:9b48  e2 db		 sep #$db
$1d:9b4a  98			tya
$1d:9b4b  b7 22		 lda [$22],y
$1d:9b4d  2d c9 8b	  and $8bc9
$1d:9b50  6e 9b e3	  ror $e39b
$1d:9b53  ca			dex
$1d:9b54  8b			phb
$1d:9b55  72 e2		 adc ($e2)
$1d:9b57  d5 c8		 cmp $c8,x
$1d:9b59  b5 76		 lda $76,x
$1d:9b5b  2d 10 8b	  and $8b10
$1d:9b5e  5b			tcd
$1d:9b5f  62 c9 80	  per $1c2b
$1d:9b62  ba			tsx
$1d:9b63  c5 a4		 cmp $a4
$1d:9b65  51 6c		 eor ($6c),y
$1d:9b67  2c 53 61	  bit $6153
$1d:9b6a  14 d8		 trb $d8
$1d:9b6c  c5 38		 cmp $38
$1d:9b6e  11 4e		 ora ($4e),y
$1d:9b70  0c 5a e8	  tsb $e85a
$1d:9b73  a1 1c		 lda ($1c,x)
$1d:9b75  22 94 22 d5   jsl $d52294
$1d:9b79  e8			inx
$1d:9b7a  b5 7e		 lda $7e,x
$1d:9b7c  2d 6e 79	  and $796e
$1d:9b7f  84 53		 sty $53
$1d:9b81  b1 14		 lda ($14),y
$1d:9b83  f4 05 ca	  pea $ca05
$1d:9b86  2d db 8b	  and $8bdb
$1d:9b89  76 62		 ror $62,x
$1d:9b8b  de b8 b7	  dec $b7b8,x
$1d:9b8e  a6 2d		 ldx $2d
$1d:9b90  da			phx
$1d:9b91  0f 8f a8 46   ora $46a88f
$1d:9b95  0a			asl a
$1d:9b96  f0 17		 beq $9baf
$1d:9b98  94 5a		 sty $5a,x
$1d:9b9a  19 16 8d	  ora $8d16,y
$1d:9b9d  c5 a3		 cmp $a3
$1d:9b9f  91 69		 sta ($69),y
$1d:9ba1  5c 5a 58 31   jml $31585a
$1d:9ba5  38			sec
$1d:9ba6  6c 5a 1c	  jmp ($1c5a)
$1d:9ba9  43 38		 eor $38,s
$1d:9bab  7c 5a 3d	  jmp ($3d5a,x)
$1d:9bae  56 87		 lsr $87,x
$1d:9bb0  55 a1		 eor $a1,x
$1d:9bb2  b5 62		 lda $62,x
$1d:9bb4  70 43		 bvs $9bf9
$1d:9bb6  e8			inx
$1d:9bb7  50 02		 bvc $9bbb
$1d:9bb9  b8			clv
$1d:9bba  13 ce		 ora ($ce,s),y
$1d:9bbc  39 56 8d	  and $8d56,y
$1d:9bbf  d5 a5		 cmp $a5,x
$1d:9bc1  95 69		 sta $69,x
$1d:9bc3  59 5c e1	  eor $e15c,y
$1d:9bc6  85 70		 sta $70
$1d:9bc8  8b			phb
$1d:9bc9  42 a2		 wdm #$a2
$1d:9bcb  d3 e8		 cmp ($e8,s),y
$1d:9bcd  b4 6a		 ldy $6a,x
$1d:9bcf  2d 4e 8b	  and $8b4e
$1d:9bd2  4e e2 d3	  lsr $d3e2
$1d:9bd5  c3 c8		 cmp $c8,s
$1d:9bd7  d3 62		 cmp ($62,s),y
$1d:9bd9  d1 d2		 cmp ($d2),y
$1d:9bdb  68			pla
$1d:9bdc  45 a5		 eor $a5
$1d:9bde  b1 69		 lda ($69),y
$1d:9be0  74 5a		 stz $5a,x
$1d:9be2  3e 85 19	  rol $1985,x
$1d:9be5  7c 5a 0f	  jmp ($0f5a,x)
$1d:9be8  56 97		 lsr $97,x
$1d:9bea  55 91		 eor $91,x
$1d:9bec  01 08		 ora ($08,x)
$1d:9bee  8b			phb
$1d:9bef  52 8a		 eor ($8a)
$1d:9bf1  63 1d		 adc $1d,s
$1d:9bf3  47 8c		 eor [$8c]
$1d:9bf5  b6 ad		 ldx $ad,y
$1d:9bf7  3c ab 4e	  bit $4eab,x
$1d:9bfa  ea			nop
$1d:9bfb  d4 d4		 pei ($d4)
$1d:9bfd  f8			sed
$1d:9bfe  cf aa d0 aa   cmp $aad0aa
$1d:9c02  b5 3a		 lda $3a,x
$1d:9c04  ac 74 0a	  ldy $0a74
$1d:9c07  5c 5a 99 16   jml $16995a
$1d:9c0b  90 45		 bcc $9c52
$1d:9c0d  a2 31		 ldx #$31
$1d:9c0f  4a			lsr a
$1d:9c10  6c 52 10	  jmp ($1052)
$1d:9c13  b9 18 3c	  lda $3c18,y
$1d:9c16  52 7a		 eor ($7a)
$1d:9c18  b9 43 f9	  lda $f943,y
$1d:9c1b  a2 05		 ldx #$05
$1d:9c1d  2e b1 f5	  rol $f5b1
$1d:9c20  e8			inx
$1d:9c21  55 18		 eor $18,x
$1d:9c23  04 be		 tsb $be
$1d:9c25  06 c0		 asl $c0
$1d:9c27  2e 09 8c	  rol $8c09
$1d:9c2a  13 a8		 ora ($a8,s),y
$1d:9c2c  b4 aa		 ldy $aa,x
$1d:9c2e  2d 12 59	  and $5912
$1d:9c31  88			dey
$1d:9c32  d8			cld
$1d:9c33  07 80		 ora [$80]
$1d:9c35  3c 13 28	  bit $2813,x
$1d:9c38  1a			inc a
$1d:9c39  c0 c6		 cpy #$c6
$1d:9c3b  44 11 8b	  mvp $8b,$11
$1d:9c3e  10 46		 bpl $9c86
$1d:9c40  31 14		 and ($14),y
$1d:9c42  97 ae		 sta [$ae],y
$1d:9c44  55 7c		 eor $7c,x
$1d:9c46  14 a6		 trb $a6
$1d:9c48  19 c5 c8	  ora $c8c5,y
$1d:9c4b  23 19		 and $19,s
$1d:9c4d  20 9c a0	  jsr $a09c
$1d:9c50  96 33		 stx $33,y
$1d:9c52  88			dey
$1d:9c53  b4 a4		 ldy $a4,x
$1d:9c55  a2 11		 ldx #$11
$1d:9c57  69 c9 54	  adc #$54c9
$1d:9c5a  22 d9 c8 b6   jsl $b6c8d9
$1d:9c5e  76 2d		 ror $2d,x
$1d:9c60  ac 8b 6b	  ldy $6b8b
$1d:9c63  62 d9 e8	  per $853f
$1d:9c66  b6 7e		 ldx $7e,y
$1d:9c68  2d ae 8b	  and $8bae
$1d:9c6b  6b			rtl
$1d:9c6c  e2 90		 sep #$90
$1d:9c6e  48			pha
$1d:9c6f  a4 1b		 ldy $1b
$1d:9c71  a8			tay
$1d:9c72  40			rti
$1d:9c73  08			php
$1d:9c74  24 62		 bit $62
$1d:9c76  03 18		 ora $18,s
$1d:9c78  c9 46 20	  cmp #$2046
$1d:9c7b  b1 8d		 lda ($8d),y
$1d:9c7d  0c 5a a1	  tsb $a15a
$1d:9c80  16 d2		 asl $d2,x
$1d:9c82  45 ac		 eor $ac
$1d:9c84  11 6d		 ora ($6d),y
$1d:9c86  a4 6a		 ldy $6a
$1d:9c88  a1 1a		 lda ($1a,x)
$1d:9c8a  d2 46		 cmp ($46)
$1d:9c8c  ac 11 ad	  ldy $ad11
$1d:9c8f  a2 1c		 ldx #$1c
$1d:9c91  44 c0 8c	  mvp $8c,$c0
$1d:9c94  0a			asl a
$1d:9c95  40			rti
$1d:9c96  ac 51 01	  ldy $0151
$1d:9c99  49 4a 84	  eor #$844a
$1d:9c9c  5b			tcd
$1d:9c9d  79 12 de	  adc $de12,y
$1d:9ca0  c5 b9		 cmp $b9
$1d:9ca2  91 2e		 sta ($2e),y
$1d:9ca4  6c 4b 7d	  jmp ($7d4b)
$1d:9ca7  16 df		 asl $df,x
$1d:9ca9  c4 b9		 cpy $b9
$1d:9cab  d1 6e		 cmp ($6e),y
$1d:9cad  7c 52 fd	  jmp ($fd52,x)
$1d:9cb0  54 40 0c	  mvn $0c,$40
$1d:9cb3  52 ff		 eor ($ff)
$1d:9cb5  14 80		 trb $80
$1d:9cb7  c5 20		 cmp $20
$1d:9cb9  51 4c		 eor ($4c),y
$1d:9cbb  72 2c		 adc ($2c)
$1d:9cbd  51 01		 eor ($01),y
$1d:9cbf  05 45		 ora $45
$1d:9cc1  8e 3d 26	  stx $263d
$1d:9cc4  d5 2e		 cmp $2e,x
$1d:9cc6  8d 4b a0	  sta $a04b
$1d:9cc9  9f 3e 84 49   sta $49843e,x
$1d:9ccd  40			rti
$1d:9cce  2a			rol a
$1d:9ccf  90 8b		 bcc $9c5c
$1d:9cd1  77 22		 adc [$22],y
$1d:9cd3  5d d8 b7	  eor $b7d8,x
$1d:9cd6  b2 2d		 lda ($2d)
$1d:9cd8  ed 89 77	  sbc $7789
$1d:9cdb  a2 dd		 ldx #$dd
$1d:9cdd  f8			sed
$1d:9cde  b7 ba		 lda [$ba],y
$1d:9ce0  2d ef 43	  and $43ef
$1d:9ce3  9a			txs
$1d:9ce4  28			plp
$1d:9ce5  08			php
$1d:9ce6  00 88		 brk #$88
$1d:9ce8  24 90		 bit $90
$1d:9cea  31 9a		 and ($9a),y
$1d:9cec  6a			ror a
$1d:9ced  8b			phb
$1d:9cee  34 60		 bit $60,x
$1d:9cf0  a7 cf		 lda [$cf]
$1d:9cf2  c3 52		 cmp $52,s
$1d:9cf4  f0 29		 beq $9d1f
$1d:9cf6  cf c1 12 f0   cmp $f012c1
$1d:9cfa  c7 2f		 cmp [$2f]
$1d:9cfc  91 cb		 sta ($cb),y
$1d:9cfe  eb			xba
$1d:9cff  bc f1 11	  ldy $11f1,x
$1d:9d02  cc 4c 73	  cpy $734c
$1d:9d05  15 1c		 ora $1c,x
$1d:9d07  c5 c7		 cmp $c7
$1d:9d09  31 91		 and ($91),y
$1d:9d0b  cc 6b ec	  cpy $ec6b
$1d:9d0e  a1 91		 lda ($91,x)
$1d:9d10  48			pha
$1d:9d11  64 56		 stz $56
$1d:9d13  19 24 86	  ora $8624,y
$1d:9d16  49 63 9f	  eor #$9f63
$1d:9d19  08			php
$1d:9d1a  e7 c6		 sbc [$c6]
$1d:9d1c  39 f2 8e	  and $8ef2,y
$1d:9d1f  7c e9 9f	  jmp ($9fe9,x)
$1d:9d22  48			pha
$1d:9d23  67 d2		 adc [$d2]
$1d:9d25  99 f5 86	  sta $86f5,y
$1d:9d28  7d 62 d0	  adc $d062,x
$1d:9d2b  b8			clv
$1d:9d2c  b4 46		 ldy $46,x
$1d:9d2e  2d 10 10	  and $1010
$1d:9d31  8c 48 3e	  sty $3e48
$1d:9d34  22 80 12 04   jsl $041280
$1d:9d38  80 42		 bra $9d7c
$1d:9d3a  22 02 14 00   jsl $001402
$1d:9d3e  c0 05		 cpy #$05
$1d:9d40  04 24		 tsb $24
$1d:9d42  21 81		 and ($81,x)
$1d:9d44  0b			phd
$1d:9d45  08			php
$1d:9d46  70 30		 bvs $9d78
$1d:9d48  28			plp
$1d:9d49  04 5b		 tsb $5b
$1d:9d4b  ec 4f 28	  cpx $284f
$1d:9d4e  b6 1c		 ldx $1c,y
$1d:9d50  9e 25 81	  stz $8125,x
$1d:9d53  ab			plb
$1d:9d54  74 6a		 stz $6a,x
$1d:9d56  dd 0a b7	  cmp $b70a,x
$1d:9d59  86 ad		 stx $ad
$1d:9d5b  e0 30		 cpx #$30
$1d:9d5d  84 58		 sty $58
$1d:9d5f  c0 1e		 cpy #$1e
$1d:9d61  08			php
$1d:9d62  b7 86		 lda [$86],y
$1d:9d64  19 fd 37	  ora $37fd,y
$1d:9d67  8f f8 e6 11   sta $11e6f8
$1d:9d6b  6f 24 5b 89   adc $895b24
$1d:9d6f  16 e1		 asl $e1,x
$1d:9d71  c5 b6		 cmp $b6
$1d:9d73  65 d0		 adc $d0
$1d:9d75  3f fa 43 d4   and $d443fa,x
$1d:9d79  3e b2 f6	  rol $f6b2,x
$1d:9d7c  1f b5 3d cb   ora $cb3db5,x
$1d:9d80  ef 6f 03 f8   sbc $f8036f
$1d:9d84  63 c5		 adc $c5,s
$1d:9d86  3e 3a f2	  rol $f23a,x
$1d:9d89  5f 97 3c db   eor $db3c97,x
$1d:9d8d  e7 ef		 sbc [$ef]
$1d:9d8f  47 fa		 eor [$fa]
$1d:9d91  83 d6		 sta $d6,s
$1d:9d93  3e c2 f6	  rol $f6c2,x
$1d:9d96  9f b9 3d eb   sta $eb3db9,x
$1d:9d9a  e0 6f		 cpx #$6f
$1d:9d9c  0b			phd
$1d:9d9d  f8			sed
$1d:9d9e  a3 c7		 lda $c7,s
$1d:9da0  3e 4a f2	  rol $f24a,x
$1d:9da3  df 9b 3c fb   cmp $fb3c9b,x
$1d:9da7  e8			inx
$1d:9da8  ef 4f fa c3   sbc $c3fa4f
$1d:9dac  d6 a5		 dec $a5,x
$1d:9dae  06 fb		 asl $fb
$1d:9db0  d1 be		 cmp ($be),y
$1d:9db2  f0 6f		 beq $9e23
$1d:9db4  c5 1b		 cmp $1b
$1d:9db6  f1 06		 sbc ($06),y
$1d:9db8  fc d1 bf	  jsr ($bfd1,x)
$1d:9dbb  30 6f		 bmi $9e2c
$1d:9dbd  d5 1b		 cmp $1b,x
$1d:9dbf  f5 04		 sbc $04,x
$1d:9dc1  ff d1 3f f8   sbc $f83fd1,x
$1d:9dc5  4f ff 13 ff   eor $ff13ff
$1d:9dc9  04 fe		 tsb $fe
$1d:9dcb  51 3f		 eor ($3f),y
$1d:9dcd  98			tya
$1d:9dce  4f e7 13 f9   eor $f913e7
$1d:9dd2  04 fd		 tsb $fd
$1d:9dd4  d1 3f		 cmp ($3f),y
$1d:9dd6  78			sei
$1d:9dd7  4f df 13 f6   eor $f613df
$1d:9ddb  00 08		 brk #$08
$1d:9ddd  81 40		 sta ($40,x)
$1d:9ddf  1d e9 12	  ora $12e9,x
$1d:9de2  91 44		 sta ($44),y
$1d:9de4  a4 6f		 ldy $6f
$1d:9de6  91 7c		 sta ($7c),y
$1d:9de8  04 ca		 tsb $ca
$1d:9dea  25 33		 and $33
$1d:9dec  00 88		 brk #$88
$1d:9dee  00 28		 brk #$28
$1d:9df0  51 2a		 eor ($2a),y
$1d:9df2  18			clc
$1d:9df3  24 68		 bit $68
$1d:9df5  51 aa		 eor ($aa),y
$1d:9df7  94 6a		 sty $6a,x
$1d:9df9  a7 12		 lda [$12]
$1d:9dfb  80 c4		 bra $9dc1
$1d:9dfd  ad 11 08	  lda $0811
$1d:9e00  00 5f		 brk #$5f
$1d:9e02  23 57		 and $57,s
$1d:9e04  4a			lsr a
$1d:9e05  d5 d2		 cmp $d2,x
$1d:9e07  35 62		 and $62,x
$1d:9e09  8d 58 c1	  sta $c158
$1d:9e0c  e0 13		 cpx #$13
$1d:9e0e  10 a0		 bpl $9db0
$1d:9e10  3e 02 d2	  rol $d202,x
$1d:9e13  11 17		 ora ($17),y
$1d:9e15  d0 5a		 bne $9e71
$1d:9e17  05 e4		 ora $e4
$1d:9e19  2b			pld
$1d:9e1a  08			php
$1d:9e1b  94 40		 sty $40,x
$1d:9e1d  6e 72 11	  ror $1172
$1d:9e20  68			pla
$1d:9e21  3d c6 43	  and $43c6,x
$1d:9e24  12 98		 ora ($98)
$1d:9e26  44 a6 21	  mvp $21,$a6
$1d:9e29  f7 08		 sbc [$08],y
$1d:9e2b  04 fc		 tsb $fc
$1d:9e2d  56 34		 lsr $34,x
$1d:9e2f  f0 bb		 beq $9dec
$1d:9e31  11 45		 ora ($45),y
$1d:9e33  f4 12 02	  pea $0212
$1d:9e36  28			plp
$1d:9e37  94 14		 sty $14,x
$1d:9e39  5e 32 02	  lsr $0232,x
$1d:9e3c  18			clc
$1d:9e3d  82 00 fc	  brl $9a40
$1d:9e40  01 20		 ora ($20,x)
$1d:9e42  a0 93		 ldy #$93
$1d:9e44  44 00 b0	  mvp $b0,$00
$1d:9e47  eb			xba
$1d:9e48  f4 3a ff	  pea $ff3a
$1d:9e4b  0e c7 43	  asl $43c7
$1d:9e4e  b1 f1		 lda ($f1),y
$1d:9e50  a9 f4 6b	  lda #$6bf4
$1d:9e53  57 1a		 eor [$1a],y
$1d:9e55  a7 46		 lda [$46]
$1d:9e57  b7 66		 lda [$66],y
$1d:9e59  77 04		 adc [$04],y
$1d:9e5b  01 d0		 ora ($d0,x)
$1d:9e5d  01 83		 ora ($83,x)
$1d:9e5f  12 a0		 ora ($a0)
$1d:9e61  22 c2 25 50   jsl $5025c2
$1d:9e65  89 54 45	  bit #$4554
$1d:9e68  e3 43		 sbc $43,s
$1d:9e6a  21 8d		 and ($8d,x)
$1d:9e6c  81 7a		 sta ($7a,x)
$1d:9e6e  21 20		 and ($20,x)
$1d:9e70  b0 a3		 bcs $9e15
$1d:9e72  4d a2 0c	  eor $0ca2
$1d:9e75  c1 0f		 cmp ($0f,x)
$1d:9e77  bc f0 22	  ldy $22f0,x
$1d:9e7a  11 aa		 ora ($aa),y
$1d:9e7c  63 56		 adc $56,s
$1d:9e7e  22 56 e6 0a   jsl $0ae656
$1d:9e82  ae 01 a4	  ldx $a401
$1d:9e85  67 71		 adc [$71]
$1d:9e87  2a			rol a
$1d:9e88  01 50		 ora ($50,x)
$1d:9e8a  12 40		 ora ($40)
$1d:9e8c  b8			clv
$1d:9e8d  04 90		 tsb $90
$1d:9e8f  2f 02 64 5f   and $5f6402
$1d:9e93  17 10		 ora [$10],y
$1d:9e95  0b			phd
$1d:9e96  04 ae		 tsb $ae
$1d:9e98  fa			plx
$1d:9e99  e8			inx
$1d:9e9a  d4 f6		 pei ($f6)
$1d:9e9c  35 be		 and $be,x
$1d:9e9e  8d 53 4a	  sta $4a53
$1d:9ea1  ed 8e 97	  sbc $978e
$1d:9ea4  43 a1		 eor $a1,s
$1d:9ea6  b8			clv
$1d:9ea7  e8			inx
$1d:9ea8  e4 3a		 cpx $3a
$1d:9eaa  3e 31 0e	  rol $0e31,x
$1d:9ead  70 c0		 bvs $9e6f
$1d:9eaf  23 fc		 and $fc,s
$1d:9eb1  e8			inx
$1d:9eb2  e0 3c		 cpx #$3c
$1d:9eb4  a1 d4		 lda ($d4,x)
$1d:9eb6  a8			tay
$1d:9eb7  75 2e		 adc $2e,x
$1d:9eb9  19 64 86	  ora $8664,y
$1d:9ebc  59 61 d3	  eor $d361,y
$1d:9ebf  a8			tay
$1d:9ec0  64 2e		 stz $2e
$1d:9ec2  35 a0		 and $a0,x
$1d:9ec4  8d 64 a3	  sta $a364
$1d:9ec7  5b			tcd
$1d:9ec8  08			php
$1d:9ec9  d6 40		 dec $40,x
$1d:9ecb  9e 3a 12	  stz $123a,x
$1d:9ece  98			tya
$1d:9ecf  ec 46 60	  cpx $6046
$1d:9ed2  9c 01 99	  stz $9901
$1d:9ed5  73 a1		 adc ($a1,s),y
$1d:9ed7  c3 d0		 cmp $d0,s
$1d:9ed9  1d 90 cc	  ora $cc90,x
$1d:9edc  e5 d8		 sbc $d8
$1d:9ede  e8			inx
$1d:9edf  69 ac e1	  adc #$e1ac
$1d:9ee2  b4 e1		 ldy $e1,x
$1d:9ee4  80 46		 bra $9f2c
$1d:9ee6  a1 d1		 lda ($d1,x)
$1d:9ee8  b8			clv
$1d:9ee9  74 aa		 stz $aa,x
$1d:9eeb  1d 2b 86	  ora $862b,x
$1d:9eee  59 a1 96	  eor $96a1,y
$1d:9ef1  78			sei
$1d:9ef2  64 2a		 stz $2a
$1d:9ef4  1d 3b 8d	  ora $8d3b,x
$1d:9ef7  70 23		 bvs $9f1c
$1d:9ef9  59 18 d5	  eor $d518,y
$1d:9efc  aa			tax
$1d:9efd  35 e7		 and $e7,x
$1d:9eff  47 8f		 eor [$8f]
$1d:9f01  05 26		 ora $26
$1d:9f03  36 b8		 rol $b8,x
$1d:9f05  75 66		 adc $66,x
$1d:9f07  1d 5b 87	  ora $875b,x
$1d:9f0a  4b			phk
$1d:9f0b  69 d1 3a	  adc #$3ad1
$1d:9f0e  75 6e		 adc $6e,x
$1d:9f10  9c a0 05	  stz $05a0
$1d:9f13  30 4b		 bmi $9f60
$1d:9f15  5a			phy
$1d:9f16  ec b5 f1	  cpx $f1b5
$1d:9f19  43 43		 eor $43,s
$1d:9f1b  d9 e1 0e	  cmp $0ee1,y
$1d:9f1e  9c d3 a7	  stz $a7d3
$1d:9f21  31 ab		 and ($ab),y
$1d:9f23  85 6a		 sta $6a
$1d:9f25  e1 1a		 sbc ($1a,x)
$1d:9f27  b8			clv
$1d:9f28  d6 ae		 dec $ae,x
$1d:9f2a  30 e8		 bmi $9f14
$1d:9f2c  ee 38 e4	  inc $e438
$1d:9f2f  10 96		 bpl $9ec7
$1d:9f31  78			sei
$1d:9f32  73 a3		 adc ($a3,s),y
$1d:9f34  f4 e8 ef	  pea $efe8
$1d:9f37  3a			dec a
$1d:9f38  1f 4e 84 d3   ora $d3844e,x
$1d:9f3c  a3 d8		 lda $d8,s
$1d:9f3e  ea			nop
$1d:9f3f  4b			phk
$1d:9f40  bc 21 d4	  ldy $d421,x
$1d:9f43  9e 75 26	  stz $2675,x
$1d:9f46  1d 1e a7	  ora $a71e,x
$1d:9f49  3e 06 1d	  rol $1d06,x
$1d:9f4c  75 87		 adc $87,x
$1d:9f4e  5d 86 63	  eor $6386,x
$1d:9f51  57 87		 eor [$87],y
$1d:9f53  52 29		 eor ($29)
$1d:9f55  d4 88		 pei ($88)
$1d:9f57  75 62		 adc $62,x
$1d:9f59  9c 0c 0b	  stz $0b0c
$1d:9f5c  b5 3a		 lda $3a,x
$1d:9f5e  eb			xba
$1d:9f5f  4e ab 9a	  lsr $9aab
$1d:9f62  46 8f		 lsr $8f
$1d:9f64  4e a3 c3	  lsr $c3a3
$1d:9f67  a5 f4		 lda $f4
$1d:9f69  e9 7e 3a	  sbc #$3a7e
$1d:9f6c  5d 0e af	  eor $af0e,x
$1d:9f6f  97 c5		 sta [$c5],y
$1d:9f71  f4 15 fe	  pea $fe15
$1d:9f74  74 b9		 stz $b9,x
$1d:9f76  de 01 51	  dec $5101,x
$1d:9f79  82 53 a8	  brl $47cf
$1d:9f7c  d0 e8		 bne $9f66
$1d:9f7e  a5 3a		 lda $3a
$1d:9f80  29 0c 83	  and #$830c
$1d:9f83  43 24		 eor $24,s
$1d:9f85  d1 c8		 cmp ($c8),y
$1d:9f87  b4 72		 ldy $72,x
$1d:9f89  6d 0e a3	  adc $a30e
$1d:9f8c  53 a0		 eor ($a0,s),y
$1d:9f8e  83 32		 sta $32,s
$1d:9f90  87 56		 sta [$56]
$1d:9f92  94 23		 sty $23,x
$1d:9f94  2c 52 84	  bit $8452
$1d:9f97  6a			ror a
$1d:9f98  e5 5a		 sbc $5a
$1d:9f9a  b9 46 ae	  lda $ae46,y
$1d:9f9d  75 ab		 adc $ab,x
$1d:9f9f  9a			txs
$1d:9fa0  9c 49 00	  stz $0049
$1d:9fa3  a6 09		 ldx $09
$1d:9fa5  66 3a		 ror $3a
$1d:9fa7  bc d1 19	  ldy $19d1,x
$1d:9faa  71 ec		 adc ($ec),y
$1d:9fac  1d 61 ce	  ora $ce61,x
$1d:9faf  30 04		 bmi $9fb5
$1d:9fb1  36 9d		 rol $9d,x
$1d:9fb3  2e 86 49	  rol $4986
$1d:9fb6  e1 92		 sbc ($92,x)
$1d:9fb8  88			dey
$1d:9fb9  64 de		 stz $de
$1d:9fbb  19 38 8e	  ora $8e38,y
$1d:9fbe  49 23 92	  eor #$9223
$1d:9fc1  58			cli
$1d:9fc2  e4 d2		 cpx $d2
$1d:9fc4  39 35 a6	  and $a635,y
$1d:9fc7  4a			lsr a
$1d:9fc8  29 92 7a	  and #$7a92
$1d:9fcb  64 e2		 stz $e2
$1d:9fcd  99 37 8a	  sta $8a37,y
$1d:9fd0  41 ea		 eor ($ea,x)
$1d:9fd2  90 78		 bcc $a04c
$1d:9fd4  a4 5e		 ldy $5e
$1d:9fd6  a8			tay
$1d:9fd7  8c 08 44	  sty $4408
$1d:9fda  52 11		 eor ($11)
$1d:9fdc  54 8c 45	  mvn $45,$8c
$1d:9fdf  23 0b		 and $0b,s
$1d:9fe1  de a8 40	  dec $40a8,x
$1d:9fe4  a2 10		 ldx #$10
$1d:9fe6  2a			rol a
$1d:9fe7  84 0e		 sty $0e
$1d:9fe9  21 03		 and ($03,x)
$1d:9feb  a7 41		 lda [$41]
$1d:9fed  61 d0		 adc ($d0,x)
$1d:9fef  5a			phy
$1d:9ff0  74 56		 stz $56,x
$1d:9ff2  1d 56 86	  ora $8656,x
$1d:9ff5  51 21		 eor ($21),y
$1d:9ff7  94 58		 sty $58,x
$1d:9ff9  65 52		 adc $52
$1d:9ffb  19 55 57	  ora $5755,y
$1d:9ffe  9d 5a 1d	  sta $1d5a,x
$1d:a001  15 4e		 ora $4e,x
$1d:a003  b4 3a		 ldy $3a,x
$1d:a005  1a			inc a
$1d:a006  cf 02 c8 c7   cmp $c7c802
$1d:a00a  e1 d1		 sbc ($d1,x)
$1d:a00c  9c 76 cc	  stz $cc76
$1d:a00f  96 5c		 stx $5c,y
$1d:a011  e6 d0		 inc $d0
$1d:a013  4a			lsr a
$1d:a014  4b			phk
$1d:a015  64 cf		 stz $cf
$1d:a017  26 a8		 rol $a8
$1d:a019  d6 92		 dec $92,x
$1d:a01b  fc 97 ee	  jsr ($ee97,x)
$1d:a01e  74 39		 stz $39,x
$1d:a020  aa			tax
$1d:a021  06 b0		 asl $b0
$1d:a023  09 8c 7b	  ora #$7b8c
$1d:a026  1c 12 08	  trb $0812
$1d:a029  cc 3b 67	  cpy $673b
$1d:a02c  ce 8f f3	  dec $f38f
$1d:a02f  a3 d4		 lda $d4,s
$1d:a031  ed 9e 39	  sbc $399e
$1d:a034  c4 01		 cpy $01
$1d:a036  20 87 04	  jsr $0487
$1d:a039  ca			dex
$1d:a03a  39 7b 17	  and $177b,y
$1d:a03d  ac 8a 39	  ldy $398a
$1d:a040  23 1c		 and $1c,s
$1d:a042  88			dey
$1d:a043  e0 26		 cpx #$26
$1d:a045  51 c9		 eor ($c9),y
$1d:a047  99 04 48	  sta $4804,y
$1d:a04a  01 42		 ora ($42,x)
$1d:a04c  8e 50 c9	  stx $c950
$1d:a04f  22 48 01 81   jsl $810148
$1d:a053  5d e3 97	  eor $97e3,x
$1d:a056  98			tya
$1d:a057  46 02		 lsr $02
$1d:a059  11 7d		 ora ($7d),y
$1d:a05b  17 84		 ora [$84],y
$1d:a05d  23 08		 and $08,s
$1d:a05f  4b			phk
$1d:a060  2c 46 1b	  bit $1b46
$1d:a063  91 86		 sta ($86),y
$1d:a065  84 5f		 sty $5f
$1d:a067  21 18		 and ($18,x)
$1d:a069  18			clc
$1d:a06a  46 0e		 lsr $0e
$1d:a06c  b8			clv
$1d:a06d  50 42		 bvc $a0b1
$1d:a06f  a0 0e		 ldy #$0e
$1d:a071  02 f2		 cop #$f2
$1d:a073  2f 11 d0 1e   and $1ed011
$1d:a077  08			php
$1d:a078  a8			tay
$1d:a079  03 00		 ora $00,s
$1d:a07b  88			dey
$1d:a07c  1d ce 42	  ora $42ce,x
$1d:a07f  35 34		 and $34,x
$1d:a081  60			rts
$1d:a082  4c 23 93	  jmp $9323
$1d:a085  13 38		 ora ($38,s),y
$1d:a087  df 61 1f 58   cmp $581f61,x
$1d:a08b  47 db		 eor [$db]
$1d:a08d  11 85		 ora ($85),y
$1d:a08f  e4 61		 cpx $61
$1d:a091  4d a0 6d	  eor $6da0
$1d:a094  08			php
$1d:a095  45 72		 eor $72
$1d:a097  11 5d		 ora ($5d),y
$1d:a099  84 5b		 sty $5b
$1d:a09b  21 16		 and ($16,x)
$1d:a09d  d4 28		 pei ($28)
$1d:a09f  8e 82 40	  stx $4082
$1d:a0a2  85 14		 sta $14
$1d:a0a4  82 8b c5	  brl $6632
$1d:a0a7  68			pla
$1d:a0a8  03 00		 ora $00,s
$1d:a0aa  24 02		 bit $02
$1d:a0ac  f8			sed
$1d:a0ad  a8			tay
$1d:a0ae  22 f1 20 28   jsl $2820f1
$1d:a0b2  16 1b		 asl $1b,x
$1d:a0b4  b8			clv
$1d:a0b5  47 15		 eor [$15]
$1d:a0b7  a0 13		 ldy #$13
$1d:a0b9  0a			asl a
$1d:a0ba  80 cb		 bra $a087
$1d:a0bc  1a			inc a
$1d:a0bd  84 72		 sty $72
$1d:a0bf  a2 2f		 ldx #$2f
$1d:a0c1  12 50		 ora ($50)
$1d:a0c3  0c 02 f0	  tsb $f002
$1d:a0c6  fd 3b d3	  sbc $d33b,x
$1d:a0c9  34 c1		 bit $c1,x
$1d:a0cb  80 0c		 bra $a0d9
$1d:a0cd  16 ef		 asl $ef,x
$1d:a0cf  ba			tsx
$1d:a0d0  18			clc
$1d:a0d1  0c 00 24	  tsb $2400
$1d:a0d4  7c 00 48	  jmp ($4800,x)
$1d:a0d7  d6 e2		 dec $e2,x
$1d:a0d9  94 04		 sty $04,x
$1d:a0db  a0 34		 ldy #$34
$1d:a0dd  81 f0		 sta ($f0,x)
$1d:a0df  0d 20 7e	  ora $7e20
$1d:a0e2  04 ca		 tsb $ca
$1d:a0e4  10 a8		 bpl $a08e
$1d:a0e6  08			php
$1d:a0e7  64 21		 stz $21
$1d:a0e9  58			cli
$1d:a0ea  1e 80 ef	  asl $ef80,x
$1d:a0ed  97 96		 sta [$96],y
$1d:a0ef  35 9a		 and $9a,x
$1d:a0f1  8d 67 63	  sta $6367
$1d:a0f4  5b			tcd
$1d:a0f5  a8			tay
$1d:a0f6  d6 6e		 dec $6e,x
$1d:a0f8  35 9c		 and $9c,x
$1d:a0fa  38			sec
$1d:a0fb  8e b2 35	  stx $35b2
$1d:a0fe  ad 3b 8e	  lda $8e3b
$1d:a101  7e 35 9e	  ror $9e35,x
$1d:a104  8d 6f e3	  sta $e36f
$1d:a107  5c 68 d6 f6   jml $f6d668
$1d:a10b  35 a6		 and $a6,x
$1d:a10d  8d 69 e3	  sta $e369
$1d:a110  5b			tcd
$1d:a111  c8			iny
$1d:a112  d7 26		 cmp [$26],y
$1d:a114  35 a8		 and $a8,x
$1d:a116  8d 6a 4b	  sta $4b6a
$1d:a119  be 68 6d	  ldx $6d68,y
$1d:a11c  54 6b 56	  mvn $56,$6b
$1d:a11f  73 1d		 adc ($1d,s),y
$1d:a121  dc 3b 15	  jml [$153b]
$1d:a124  0e c5 c3	  asl $c3c5
$1d:a127  b1 90		 lda ($90),y
$1d:a129  ec 6c 6b	  cpx $6b6c
$1d:a12c  5d 1a d7	  eor $d71a,x
$1d:a12f  c6 b7		 dec $b7
$1d:a131  c8			iny
$1d:a132  51 db		 eor ($db),y
$1d:a134  46 b6		 lsr $b6
$1d:a136  ec 31 e3	  cpx $e331
$1d:a139  c6 b7		 dec $b7
$1d:a13b  11 ad		 ora ($ad),y
$1d:a13d  cc 6b 90	  cpy $906b
$1d:a140  b5 04		 lda $04,x
$1d:a142  ef aa 23 97   sbc $9723aa
$1d:a146  1a			inc a
$1d:a147  ed 46 bb	  sbc $bb46
$1d:a14a  68			pla
$1d:a14b  f1 45		 sbc ($45),y
$1d:a14d  07 32		 ora [$32]
$1d:a14f  35 cd		 and $cd,x
$1d:a151  8d 73 98	  sta $9873
$1d:a154  23 de		 and $de,s
$1d:a156  8d 77 e3	  sta $e377
$1d:a159  5d 68 d7	  eor $d768,x
$1d:a15c  5e 35 e6	  lsr $e635,x
$1d:a15f  3e 8f 62	  rol $628f,x
$1d:a162  35 d9		 and $d9,x
$1d:a164  3d 8f a5	  and $a58f,x
$1d:a167  bb			tyx
$1d:a168  ea			nop
$1d:a169  86 f5		 stx $f5
$1d:a16b  46 bb		 lsr $bb
$1d:a16d  b1 af		 lda ($af),y
$1d:a16f  5c 6b db 1a   jml $1adb6b
$1d:a173  ee 0c 47	  inc $470c
$1d:a176  d8			cld
$1d:a177  35 3f		 and $3f,x
$1d:a179  78			sei
$1d:a17a  ec 7d d0	  cpx $d07d
$1d:a17d  ee 54 3b	  inc $3b54
$1d:a180  9f 0e f2 c3   sta $c3f20e,x
$1d:a184  ba			tsx
$1d:a185  af 72 87 6c   lda $6c8772
$1d:a189  a9 db 20	  lda #$20db
$1d:a18c  ef 97 9b a1   sbc $a19b97
$1d:a190  10 e8		 bpl $a17a
$1d:a192  c4 3c		 cpy $3c
$1d:a194  11 0f		 ora ($0f),y
$1d:a196  0c 43 a5	  tsb $a543
$1d:a199  10 e9		 bpl $a184
$1d:a19b  c4 3c		 cpy $3c
$1d:a19d  51 0f		 eor ($0f),y
$1d:a19f  1c 3b 2b	  trb $2b3b
$1d:a1a2  0e da c3	  asl $c3da
$1d:a1a5  b4 b0		 ldy $b0,x
$1d:a1a7  ee 2c 3b	  inc $3b2c
$1d:a1aa  2d 0e cb	  and $cb0e
$1d:a1ad  c3 b3		 cmp $b3,s
$1d:a1af  10 ec		 bpl $a19d
$1d:a1b1  cc 3b 85	  cpy $853b
$1d:a1b4  4e e1 0e	  lsr $0ee1
$1d:a1b7  c8			iny
$1d:a1b8  bf e9 e5 8c   lda $8ce5e9,x
$1d:a1bc  68			pla
$1d:a1bd  a3 19		 lda $19,s
$1d:a1bf  3a			dec a
$1d:a1c0  c7 0e		 cmp [$0e]
$1d:a1c2  a9 6f 58	  lda #$586f
$1d:a1c5  82 bc 22	  brl $c484
$1d:a1c8  9e 48 c7	  stz $c748,x
$1d:a1cb  0d 66 1d	  ora $1d66
$1d:a1ce  45 e0		 eor $e0
$1d:a1d0  2c 03 47	  bit $4703
$1d:a1d3  94 5e		 sty $5e,x
$1d:a1d5  0b			phd
$1d:a1d6  14 15		 trb $15
$1d:a1d8  e4 b1		 cpx $b1
$1d:a1da  08			php
$1d:a1db  a6 d2		 ldx $d2
$1d:a1dd  29 c4 59	  and #$59c4
$1d:a1e0  84 53		 sty $53
$1d:a1e2  04 d7		 tsb $d7
$1d:a1e4  1c a5 53	  trb $53a5
$1d:a1e7  48			pha
$1d:a1e8  bd 06 f9	  lda $f906,x
$1d:a1eb  45 3a		 eor $3a
$1d:a1ed  8e 70 65	  stx $6570
$1d:a1f0  8e 8c de	  stx $de8c
$1d:a1f3  38			sec
$1d:a1f4  73 98		 adc ($98,s),y
$1d:a1f6  fc 4d e7	  jsr ($e74d,x)
$1d:a1f9  f0 7a		 beq $a275
$1d:a1fb  9b			txy
$1d:a1fc  c8			iny
$1d:a1fd  1f 88 fa 2f   ora $2ffa88,x
$1d:a201  a1 dd		 lda ($dd,x)
$1d:a203  7e 69 df	  ror $df69,x
$1d:a206  0f 31 e0 31   ora $31e031
$1d:a20a  01 33		 ora ($33,x)
$1d:a20c  3c 17 c8	  bit $c817,x
$1d:a20f  6a			ror a
$1d:a210  63 20		 adc $20,s
$1d:a212  1e 31 f0	  asl $f031,x
$1d:a215  31 21		 and ($21),y
$1d:a217  ff 2f 70 20   sbc $20702f,x
$1d:a21b  bc 19 89	  ldy $8919,x
$1d:a21e  70 dc		 bvs $a1fc
$1d:a220  a3 10		 lda $10,s
$1d:a222  d3 d8		 cmp ($d8,s),y
$1d:a224  01 cb		 ora ($cb,x)
$1d:a226  b0 76		 bcs $a29e
$1d:a228  0f 09 7f c2   ora $c27f09
$1d:a22c  06 75		 asl $75
$1d:a22e  10 40		 bpl $a270
$1d:a230  9e cc 70	  stz $70cc,x
$1d:a233  28			plp
$1d:a234  31 f1		 and ($f1),y
$1d:a236  8f c3 31 1c   sta $1c31c3
$1d:a23a  25 84		 and $84
$1d:a23c  62 39 14	  per $b678
$1d:a23f  ff 55 3f d9   sbc $d93f55,x
$1d:a243  4f f7 53 fd   eor $fd53f7
$1d:a247  d8			cld
$1d:a248  59 02 a8	  eor $a802,y
$1d:a24b  16 40		 asl $40,x
$1d:a24d  ae 03 07	  ldx $0703
$1d:a250  ac 47 c0	  ldy $c047
$1d:a253  b5 b4		 lda $b4,x
$1d:a255  10 2c		 bpl $a283
$1d:a257  81 0c		 sta ($0c,x)
$1d:a259  1d 08 c1	  ora $c108,x
$1d:a25c  d8			cld
$1d:a25d  01 81		 ora ($81,x)
$1d:a25f  f1 cc		 sbc ($cc),y
$1d:a261  43 5e		 eor $5e,s
$1d:a263  e0 3b		 cpx #$3b
$1d:a265  2a			rol a
$1d:a266  c1 d8		 cmp ($d8,x)
$1d:a268  0e 40 f4	  asl $f440
$1d:a26b  16 3f		 asl $3f,x
$1d:a26d  f4 9e 22	  pea $229e
$1d:a270  3c 17 b9	  bit $b917,x
$1d:a273  bd 05 fe	  lda $fe05,x
$1d:a276  29 a0 22	  and #$22a0
$1d:a279  11 7b		 ora ($7b),y
$1d:a27b  c7 fe		 cmp [$fe]
$1d:a27d  50 f3		 bvc $a272
$1d:a27f  0f 9c bd 07   ora $07bd9c
$1d:a283  e9 4f 4e	  sbc #$4e4f
$1d:a286  b4 13		 ldy $13,x
$1d:a288  fb			xce
$1d:a289  44 fe e1	  mvp $e1,$fe
$1d:a28c  3f bc 4f eb   and $eb4fbc,x
$1d:a290  7d 93 ad	  adc $ad93,x
$1d:a293  06 fb		 asl $fb
$1d:a295  d1 be		 cmp ($be),y
$1d:a297  f0 6f		 beq $a308
$1d:a299  c5 1b		 cmp $1b
$1d:a29b  f1 06		 sbc ($06),y
$1d:a29d  fc d1 bf	  jsr ($bfd1,x)
$1d:a2a0  30 6f		 bmi $a311
$1d:a2a2  d5 1b		 cmp $1b,x
$1d:a2a4  f5 04		 sbc $04,x
$1d:a2a6  ff d1 3f f8   sbc $f83fd1,x
$1d:a2aa  4f ff 13 ff   eor $ff13ff
$1d:a2ae  04 fe		 tsb $fe
$1d:a2b0  51 3f		 eor ($3f),y
$1d:a2b2  98			tya
$1d:a2b3  4f e7 13 f9   eor $f913e7
$1d:a2b7  04 fd		 tsb $fd
$1d:a2b9  d1 3f		 cmp ($3f),y
$1d:a2bb  78			sei
$1d:a2bc  4f df 13 f6   eor $f613df
$1d:a2c0  5b			tcd
$1d:a2c1  0d b9 4e	  ora $4eb9
$1d:a2c4  2f 93 8c 34   and $348c93
$1d:a2c8  e3 21		 sbc $21,s
$1d:a2ca  38			sec
$1d:a2cb  d9 4e 3a	  cmp $3a4e,y
$1d:a2ce  93 8f		 sta ($8f,s),y
$1d:a2d0  b4 e2		 ldy $e2,x
$1d:a2d2  01 39		 ora ($39,x)
$1d:a2d4  85 4e		 sta $4e
$1d:a2d6  62 93 99	  per $3c6c
$1d:a2d9  b4 e6		 ldy $e6,x
$1d:a2db  a1 39		 lda ($39,x)
$1d:a2dd  b9 4e 71	  lda $714e,y
$1d:a2e0  93 9d		 sta ($9d,s),y
$1d:a2e2  74 e7		 stz $e7,x
$1d:a2e4  91 39		 sta ($39),y
$1d:a2e6  e9 4e 7b	  sbc #$7b4e
$1d:a2e9  93 9f		 sta ($9f,s),y
$1d:a2eb  34 e6		 bit $e6,x
$1d:a2ed  11 3a		 ora ($3a),y
$1d:a2ef  95 4e		 sta $4e,x
$1d:a2f1  a9 93 ab	  lda #$ab93
$1d:a2f4  74 eb		 stz $eb,x
$1d:a2f6  21 3a		 and ($3a,x)
$1d:a2f8  d9 4e ba	  cmp $ba4e,y
$1d:a2fb  93 a8		 sta ($a8,s),y
$1d:a2fd  b4 ee		 ldy $ee,x
$1d:a2ff  71 3b		 adc ($3b),y
$1d:a301  dd 4e fb	  cmp $fb4e,x
$1d:a304  93 bf		 sta ($bf,s),y
$1d:a306  f4 ee 41	  pea $41ee
$1d:a309  3c 99 4f	  bit $4f99,x
$1d:a30c  28			plp
$1d:a30d  93 ca		 sta ($ca,s),y
$1d:a30f  b4 f2		 ldy $f2,x
$1d:a311  d1 3c		 cmp ($3c),y
$1d:a313  bd 4f 36	  lda $364f,x
$1d:a316  93 ce		 sta ($ce,s),y
$1d:a318  34 f3		 bit $f3,x
$1d:a31a  b1 3c		 lda ($3c),y
$1d:a31c  f5 4f		 sbc $4f,x
$1d:a31e  3e 93 cf	  rol $cf93,x
$1d:a321  f4 f2 21	  pea $21f2
$1d:a324  3d 91 4f	  and $4f91,x
$1d:a327  66 93		 ror $93
$1d:a329  da			phx
$1d:a32a  34 f6		 bit $f6,x
$1d:a32c  f1 3d		 sbc ($3d),y
$1d:a32e  e5 4f		 sbc $4f
$1d:a330  7b			tdc
$1d:a331  93 df		 sta ($df,s),y
$1d:a333  f4 f6 41	  pea $41f6
$1d:a336  3e a1 4f	  rol $4fa1,x
$1d:a339  ac 93 eb	  ldy $eb93
$1d:a33c  74 fa		 stz $fa,x
$1d:a33e  f1 3e		 sbc ($3e),y
$1d:a340  c1 4f		 cmp ($4f,x)
$1d:a342  a0 f0		 ldy #$f0
$1d:a344  03 11		 ora $11,s
$1d:a346  63 27		 adc $27,s
$1d:a348  df ff f9 85   cmp $85f9ff,x
$1d:a34c  3c 06 87	  bit $8706,x
$1d:a34f  9a			txs
$1d:a350  4f cd 29 01   eor $0129cd
$1d:a354  33 09		 and ($09,s),y
$1d:a356  fd 35 08	  sbc $0835,x
$1d:a359  65 42		 adc $42
$1d:a35b  b7 10		 lda [$10],y
$1d:a35d  d0 a6		 bne $a305
$1d:a35f  90 38		 bcc $a399
$1d:a361  82 85 3f	  brl $e2e9
$1d:a364  8a			txa
$1d:a365  85 53		 sta $53
$1d:a367  b4 60		 ldy $60,x
$1d:a369  f8			sed
$1d:a36a  66 90		 ror $90
$1d:a36c  3c 93 0d	  bit $0d93,x
$1d:a36f  2a			rol a
$1d:a370  0c a5 64	  tsb $64a5
$1d:a373  b5 b0		 lda $b0,x
$1d:a375  f8			sed
$1d:a376  a6 20		 ldx $20
$1d:a378  c4 38		 cpy $38
$1d:a37a  9f b8 e2 79   sta $79e2b8,x
$1d:a37e  85 00		 sta $00
$1d:a380  fa			plx
$1d:a381  ce b0 4b	  dec $4bb0
$1d:a384  a6 90		 ldx $90
$1d:a386  14 a0		 trb $a0
$1d:a388  96 e0		 stx $e0,y
$1d:a38a  1f 05 06 06   ora $060605,x
$1d:a38e  20 fe 7f	  jsr $7ffe
$1d:a391  c2 20		 rep #$20
$1d:a393  25 41		 and $41
$1d:a395  08			php
$1d:a396  39 70 d2	  and $d270,y
$1d:a399  0f 50 50 a7   ora $a75050
$1d:a39d  e0 8c		 cpx #$8c
$1d:a39f  a4 56		 ldy $56
$1d:a3a1  8a			txa
$1d:a3a2  00 04		 brk #$04
$1d:a3a4  4a			lsr a
$1d:a3a5  50 48		 bvc $a3ef
$1d:a3a7  01 34		 ora ($34,x)
$1d:a3a9  0c 28 5d	  tsb $5d28
$1d:a3ac  07 7d		 ora [$7d]
$1d:a3ae  31 49		 and ($49),y
$1d:a3b0  fe 0c 34	  inc $340c,x
$1d:a3b3  a6 20		 ldx $20
$1d:a3b5  95 02		 sta $02,x
$1d:a3b7  d6 80		 dec $80,x
$1d:a3b9  00 c0		 brk #$c0
$1d:a3bb  e0 10		 cpx #$10
$1d:a3bd  27 30		 and [$30]
$1d:a3bf  a2 41		 ldx #$41
$1d:a3c1  3a			dec a
$1d:a3c2  89 90 7c	  bit #$7c90
$1d:a3c5  c4 3d		 cpy $3d
$1d:a3c7  cc 78 45	  cpy $4578
$1d:a3ca  a3 e8		 lda $e8,s
$1d:a3cc  16 8f		 asl $8f,x
$1d:a3ce  c3 00		 cmp $00,s
$1d:a3d0  3f 7c e0 61   and $61e07c,x
$1d:a3d4  70 fd		 bvs $a3d3
$1d:a3d6  b7 16		 lda [$16],y
$1d:a3d8  2f 41 0d a4   and $a40d41
$1d:a3dc  ce 82 9b	  dec $9b82
$1d:a3df  21 b0		 and ($b0,x)
$1d:a3e1  27 c1		 and [$c1]
$1d:a3e3  b6 0f		 ldx $0f,y
$1d:a3e5  74 71		 stz $71,x
$1d:a3e7  83 dd		 sta $dd,s
$1d:a3e9  1d 60 f7	  ora $f760,x
$1d:a3ec  47 99		 eor [$99]
$1d:a3ee  15 d1		 ora $d1,x
$1d:a3f0  b6 83		 ldx $83,y
$1d:a3f2  d0 71		 bne $a465
$1d:a3f4  a1 e4		 lda ($e4,x)
$1d:a3f6  1d 68 79	  ora $7968,x
$1d:a3f9  07 9b		 ora [$9b]
$1d:a3fb  7f 83 c2 3b   adc $3bc283,x
$1d:a3ff  40			rti
$1d:a400  2a			rol a
$1d:a401  0f c0 1a 83   ora $831ac0
$1d:a405  f0 0a		 beq $a411
$1d:a407  a2 34		 ldx #$34
$1d:a409  9b			txy
$1d:a40a  64 8d		 stz $8d
$1d:a40c  27 19		 and [$19]
$1d:a40e  23 49		 and $49,s
$1d:a410  d6 48		 dec $48,x
$1d:a412  d2 79		 cmp ($79)
$1d:a414  a0 fc		 ldy #$fc
$1d:a416  0c 24 7f	  tsb $7f24
$1d:a419  40			rti
$1d:a41a  29 20 48	  and #$4820
$1d:a41d  1a			inc a
$1d:a41e  48			pha
$1d:a41f  12 0a		 ora ($0a)
$1d:a421  94 15		 sty $15,x
$1d:a423  70 74		 bvs $a499
$1d:a425  fa			plx
$1d:a426  0a			asl a
$1d:a427  85 2d		 sta $2d
$1d:a429  6a			ror a
$1d:a42a  85 c3		 sta $c3
$1d:a42c  aa			tax
$1d:a42d  17 46		 ora [$46],y
$1d:a42f  f4 10 18	  pea $1810
$1d:a432  28			plp
$1d:a433  d1 86		 cmp ($86),y
$1d:a435  9b			txy
$1d:a436  f6 52		 inc $52,x
$1d:a438  ab			plb
$1d:a439  c1 86		 cmp ($86,x)
$1d:a43b  9e 26 52	  stz $5226,x
$1d:a43e  ad c1 86	  lda $86c1
$1d:a441  90 5a		 bcc $a49d
$1d:a443  13 0d		 ora ($0d,s),y
$1d:a445  17 e0		 ora [$e0],y
$1d:a447  cb			wai
$1d:a448  49 45 08	  eor #$0845
$1d:a44b  de 43 32	  dec $3243,x
$1d:a44e  a5 d0		 lda $d0
$1d:a450  80 a9		 bra $a3fb
$1d:a452  67 06		 adc [$06]
$1d:a454  2e 0c 18	  rol $180c
$1d:a457  b9 f0 11	  lda $11f0,y
$1d:a45a  96 c0		 stx $c0,y
$1d:a45c  12 ca		 ora ($ca)
$1d:a45e  20 09 91	  jsr $9109
$1d:a461  bc 83 68	  ldy $6883,x
$1d:a464  a2 01		 ldx #$01
$1d:a466  18			clc
$1d:a467  01 ca		 ora ($ca,x)
$1d:a469  03 00		 ora $00,s
$1d:a46b  16 d2		 asl $d2,x
$1d:a46d  88			dey
$1d:a46e  09 60 3d	  ora #$3d60
$1d:a471  a2 58		 ldx #$58
$1d:a473  12 f0		 ora ($f0)
$1d:a475  96 03		 stx $03,y
$1d:a477  bc 25 80	  ldy $8025,x
$1d:a47a  af 02 f0 43   lda $43f002
$1d:a47e  21 2a		 and ($2a,x)
$1d:a480  31 00		 and ($00),y
$1d:a482  16 40		 asl $40,x
$1d:a484  32 1a		 and ($1a)
$1d:a486  d0 0c		 bne $a494
$1d:a488  84 6c		 sty $6c
$1d:a48a  4b			phk
$1d:a48b  42 49		 wdm #$49
$1d:a48d  0d 50 b6	  ora $b650
$1d:a490  84 92		 sty $92
$1d:a492  11 e0		 ora ($e0),y
$1d:a494  a4 86		 ldy $86
$1d:a496  a8			tay
$1d:a497  9b			txy
$1d:a498  41 49		 eor ($49,x)
$1d:a49a  08			php
$1d:a49b  c9 ce 05	  cmp #$05ce
$1d:a49e  f2 dd		 sbc ($dd)
$1d:a4a0  d0 81		 bne $a423
$1d:a4a2  e9 d0 06	  sbc #$06d0
$1d:a4a5  2f fb fe 15   and $15fefb
$1d:a4a9  41 28		 eor ($28,x)
$1d:a4ab  07 50		 ora [$50]
$1d:a4ad  4a			lsr a
$1d:a4ae  01 34		 ora ($34,x)
$1d:a4b0  1a			inc a
$1d:a4b1  90 bd		 bcc $a470
$1d:a4b3  a0 43		 ldy #$43
$1d:a4b5  85 24		 sta $24
$1d:a4b7  80 bd		 bra $a476
$1d:a4b9  84 a8		 sty $a8
$1d:a4bb  59 20 eb	  eor $eb20,y
$1d:a4be  1f c3 ca 16   ora $16cac3,x
$1d:a4c2  5f d0 59 61   eor $6159d0,x
$1d:a4c6  f4 33 8f	  pea $8f33
$1d:a4c9  a0 8e		 ldy #$8e
$1d:a4cb  41 44		 eor ($44,x)
$1d:a4cd  3c b3 34	  bit $34b3,x
$1d:a4d0  20 6b a3	  jsr $a36b
$1d:a4d3  92 50		 sta ($50)
$1d:a4d5  d4 69		 pei ($69)
$1d:a4d7  39 50 1b	  and $1b50,y
$1d:a4da  8c 95 24	  sty $2495
$1d:a4dd  e3 25		 sbc $25,s
$1d:a4df  8b			phb
$1d:a4e0  39 c1 76	  and $76c1,y
$1d:a4e3  8e 70 58	  stx $5870
$1d:a4e6  92 08		 sta ($08)
$1d:a4e8  e0 14		 cpx #$14
$1d:a4ea  e6 b3		 inc $b3
$1d:a4ec  ec 14 02	  cpx $0214
$1d:a4ef  d3 00		 cmp ($00,s),y
$1d:a4f1  29 37 c1	  and #$c137
$1d:a4f4  da			phx
$1d:a4f5  97 f7		 sta [$f7],y
$1d:a4f7  53 ba		 eor ($ba,s),y
$1d:a4f9  41 da		 eor ($da,x)
$1d:a4fb  9e 87 52	  stz $5287,x
$1d:a4fe  b4 c1		 ldy $c1,x
$1d:a500  e6 8d		 inc $8d
$1d:a502  30 7d		 bmi $a581
$1d:a504  b3 4c		 lda ($4c,s),y
$1d:a506  00 a8		 brk #$a8
$1d:a508  d3 00		 cmp ($00,s),y
$1d:a50a  69 41 d0	  adc #$d041
$1d:a50d  47 35		 eor [$35]
$1d:a50f  a2 0d		 ldx #$0d
$1d:a511  52 94		 eor ($94)
$1d:a513  3c 5a f8	  bit $f85a,x
$1d:a516  f1 6e		 sbc ($6e),y
$1d:a518  84 4d		 sty $4d
$1d:a51a  21 82		 and ($82,x)
$1d:a51c  cd 12 a1	  cmp $a112
$1d:a51f  89 a2 41	  bit #$41a2
$1d:a522  10 47		 bpl $a56b
$1d:a524  9e a2 41	  stz $41a2,x
$1d:a527  5c 87 b3 a2   jml $a2b387
$1d:a52b  36 53		 rol $53,x
$1d:a52d  90 76		 bcc $a5a5
$1d:a52f  54 28 40	  mvn $40,$28
$1d:a532  9c 86 85	  stz $8586
$1d:a535  03 3a		 ora $3a,s
$1d:a537  25 5b		 and $5b
$1d:a539  ba			tsx
$1d:a53a  96 f1		 stx $f1,y
$1d:a53c  9b			txy
$1d:a53d  21 40		 and ($40,x)
$1d:a53f  9a			txs
$1d:a540  8b			phb
$1d:a541  52 11		 eor ($11)
$1d:a543  92 3c		 sta ($3c)
$1d:a545  14 a0		 trb $a0
$1d:a547  cb			wai
$1d:a548  4f 93 49 5a   eor $5a4993
$1d:a54c  2d 07 a2	  and $a207
$1d:a54f  bf 53 fd ff   lda $fffd53,x
$1d:a553  68			pla
$1d:a554  a3 c4		 lda $c4,s
$1d:a556  1b			tcs
$1d:a557  28			plp
$1d:a558  f1 87		 sbc ($87),y
$1d:a55a  4a			lsr a
$1d:a55b  3c 41 46	  bit $4641,x
$1d:a55e  40			rti
$1d:a55f  f4 6c 90	  pea $906c
$1d:a562  46 9d		 lsr $9d
$1d:a564  24 70		 bit $70
$1d:a566  20 28 52	  jsr $5228
$1d:a569  e8			inx
$1d:a56a  43 14		 eor $14,s
$1d:a56c  b3 8e		 lda ($8e,s),y
$1d:a56e  17 06		 ora [$06],y
$1d:a570  38			sec
$1d:a571  5c fd 09 6e   jml $6e09fd
$1d:a575  dc 09 fa	  jml [$fa09]
$1d:a578  dd a2 94	  cmp $94a2,x
$1d:a57b  05 bb		 ora $bb
$1d:a57d  53 0c		 eor ($0c,s),y
$1d:a57f  83 0f		 sta $0f,s
$1d:a581  44 1c 70	  mvp $70,$1c
$1d:a584  5c 71 08 04   jml $040871
$1d:a588  61 c8		 adc ($c8,x)
$1d:a58a  27 d0		 and [$d0]
$1d:a58c  3e 83 5c	  rol $5c83,x
$1d:a58f  00 a5		 brk #$a5
$1d:a591  08			php
$1d:a592  85 40		 sta $40
$1d:a594  80 a3		 bra $a539
$1d:a596  08			php
$1d:a597  80 48		 bra $a5e1
$1d:a599  1a			inc a
$1d:a59a  e0 7c		 cpx #$7c
$1d:a59c  18			clc
$1d:a59d  ba			tsx
$1d:a59e  02 e0		 cop #$e0
$1d:a5a0  e8			inx
$1d:a5a1  e3 29		 sbc $29,s
$1d:a5a3  84 89		 sty $89
$1d:a5a5  1e 29 9b	  asl $9b29,x
$1d:a5a8  56 12		 lsr $12,x
$1d:a5aa  38			sec
$1d:a5ab  a0 2a		 ldy #$2a
$1d:a5ad  f1 24		 sbc ($24),y
$1d:a5af  09 f7 e1	  ora #$e1f7
$1d:a5b2  88			dey
$1d:a5b3  f4 b0 25	  pea $25b0
$1d:a5b6  bc 56 2e	  ldy $2e56,x
$1d:a5b9  23 29		 and $29,s
$1d:a5bb  85 89		 sta $89
$1d:a5bd  65 ef		 adc $ef
$1d:a5bf  b5 65		 lda $65,x
$1d:a5c1  0d 89 9d	  ora $9d89
$1d:a5c4  e8			inx
$1d:a5c5  b1 87		 lda ($87),y
$1d:a5c7  23 d2		 and $d2,s
$1d:a5c9  48			pha
$1d:a5ca  ea			nop
$1d:a5cb  f0 b8		 beq $a585
$1d:a5cd  8d 8d 5e	  sta $5e8d
$1d:a5d0  12 61		 ora ($61)
$1d:a5d2  f7 93		 sbc [$93],y
$1d:a5d4  e2 50		 sep #$50
$1d:a5d6  5a			phy
$1d:a5d7  31 3e		 and ($3e),y
$1d:a5d9  83 01		 sta $01,s
$1d:a5db  c8			iny
$1d:a5dc  72 00		 adc ($00)
$1d:a5de  61 89		 adc ($89,x)
$1d:a5e0  f4 ce 6e	  pea $6ece
$1d:a5e3  70 91		 bvs $a576
$1d:a5e5  1a			inc a
$1d:a5e6  06 1e		 asl $1e
$1d:a5e8  96 fa		 stx $fa,y
$1d:a5ea  02 a1		 cop #$a1
$1d:a5ec  28			plp
$1d:a5ed  09 3f 1d	  ora #$1d3f
$1d:a5f0  03 28		 ora $28,s
$1d:a5f2  07 07		 ora [$07]
$1d:a5f4  60			rts
$1d:a5f5  49 78 e4	  eor #$e478
$1d:a5f8  44 40 38	  mvp $38,$40
$1d:a5fb  3b			tsc
$1d:a5fc  12 bb		 ora ($bb)
$1d:a5fe  de e4 c3	  dec $c3e4,x
$1d:a601  4b			phk
$1d:a602  13 2b		 ora ($2b,s),y
$1d:a604  d8			cld
$1d:a605  a3 04		 lda $04,s
$1d:a607  45 a4		 eor $a4
$1d:a609  91 cd		 sta ($cd),y
$1d:a60b  ec 51 83	  cpx $8351
$1d:a60e  22 d2 4c ec   jsl $ec4cd2
$1d:a612  38			sec
$1d:a613  bb			tyx
$1d:a614  b2 e0		 lda ($e0)
$1d:a616  ec 70 08	  cpx $0870
$1d:a619  8c 1e 01	  sty $011e
$1d:a61c  28			plp
$1d:a61d  1d 7b 14	  ora $147b,x
$1d:a620  94 e9		 sty $e9,x
$1d:a622  2a			rol a
$1d:a623  39 5c 0d	  and $0d5c,y
$1d:a626  78			sei
$1d:a627  92 c0		 sta ($c0)
$1d:a629  91 1d		 sta ($1d),y
$1d:a62b  42 e0		 wdm #$e0
$1d:a62d  c5 23		 cmp $23
$1d:a62f  a8			tay
$1d:a630  5c 4e 5e 13   jml $135e4e
$1d:a634  13 51		 ora ($51,s),y
$1d:a636  ab			plb
$1d:a637  02 5c		 cop #$5c
$1d:a639  b1 f0		 lda ($f0),y
$1d:a63b  98			tya
$1d:a63c  d3 18		 cmp ($18,s),y
$1d:a63e  c9 44 01	  cmp #$0144
$1d:a641  09 67 03	  ora #$0367
$1d:a644  01 07		 ora ($07,x)
$1d:a646  70 8b		 bvs $a5d3
$1d:a648  e8			inx
$1d:a649  60			rts
$1d:a64a  14 62		 trb $62
$1d:a64c  b7 99		 lda [$99],y
$1d:a64e  c5 c2		 cmp $c2
$1d:a650  66 f0		 ror $f0
$1d:a652  a4 2d		 ldy $2d
$1d:a654  c6 22		 dec $22
$1d:a656  76 a7		 ror $a7,x
$1d:a658  19 38 4a	  ora $4a38,y
$1d:a65b  02 ac		 cop #$ac
$1d:a65d  0a			asl a
$1d:a65e  53 37		 eor ($37,s),y
$1d:a660  d3 e3		 cmp ($e3,s),y
$1d:a662  64 81		 stz $81
$1d:a664  38			sec
$1d:a665  ce d9 04	  dec $04d9
$1d:a668  1f 7b 7c 2c   ora $2c7c7b,x
$1d:a66c  c5 2f		 cmp $2f
$1d:a66e  5d c5 a0	  eor $a0c5,x
$1d:a671  dd eb b8	  cmp $b8eb,x
$1d:a674  b5 22		 lda $22,x
$1d:a676  bd 26 30	  lda $3026,x
$1d:a679  30 58		 bmi $a6d3
$1d:a67b  41 20		 eor ($20,x)
$1d:a67d  90 88		 bcc $a607
$1d:a67f  47 19		 eor [$19]
$1d:a681  4c 44 f8	  jmp $f844
$1d:a684  1e da eb	  asl $ebda,x
$1d:a687  0d ac d0	  ora $d0ac
$1d:a68a  f5 f4		 sbc $f4,x
$1d:a68c  22 59 e7 e0   jsl $e0e759
$1d:a690  48			pha
$1d:a691  52 b0		 eor ($b0)
$1d:a693  5a			phy
$1d:a694  d3 cb		 cmp ($cb,s),y
$1d:a696  84 53		 sty $53
$1d:a698  26 32		 rol $32
$1d:a69a  08			php
$1d:a69b  a7 01		 lda [$01]
$1d:a69d  e5 a9		 sbc $a9
$1d:a69f  cb			wai
$1d:a6a0  0c a6 18	  tsb $18a6
$1d:a6a3  09 48 87	  ora #$8748
$1d:a6a6  5e a3 0c	  lsr $0ca3,x
$1d:a6a9  41 3b		 eor ($3b,x)
$1d:a6ab  cb			wai
$1d:a6ac  f1 8a		 sbc ($8a),y
$1d:a6ae  35 37		 and $37,x
$1d:a6b0  f3 ff		 sbc ($ff,s),y
$1d:a6b2  0c 80 2b	  tsb $2b80
$1d:a6b5  01 54		 ora ($54,x)
$1d:a6b7  01 f2		 ora ($f2,x)
$1d:a6b9  16 10		 asl $10,x
$1d:a6bb  b4 5c		 ldy $5c,x
$1d:a6bd  80 aa		 bra $a669
$1d:a6bf  f0 b8		 beq $a679
$1d:a6c1  75 93		 adc $93,x
$1d:a6c3  40			rti
$1d:a6c4  1e 30 ea	  asl $ea30,x
$1d:a6c7  1a			inc a
$1d:a6c8  c5 98		 cmp $98
$1d:a6ca  54 e0 e2	  mvn $e2,$e0
$1d:a6cd  b6 ae		 ldx $ae,y
$1d:a6cf  dc e8 f1	  jml [$f1e8]
$1d:a6d2  68			pla
$1d:a6d3  e3 95		 sbc $95,s
$1d:a6d5  e2 c1		 sep #$c1
$1d:a6d7  fe 38 4b	  inc $4b38,x
$1d:a6da  df 03 c8 39   cmp $39c803,x
$1d:a6de  8c 82 01	  sty $0182
$1d:a6e1  22 80 7f 96   jsl $967f80
$1d:a6e5  27 05		 and [$05]
$1d:a6e7  36 00		 rol $00,x
$1d:a6e9  fc 0e 61	  jsr ($610e,x)
$1d:a6ec  c0 46		 cpy #$46
$1d:a6ee  88			dey
$1d:a6ef  fc 09 e1	  jsr ($e109,x)
$1d:a6f2  44 80 c4	  mvp $c4,$80
$1d:a6f5  00 c3		 brk #$c3
$1d:a6f7  c4 46		 cpy $46
$1d:a6f9  84 22		 sty $22
$1d:a6fb  30 90		 bmi $a68d
$1d:a6fd  0f 22 34 23   ora $233422
$1d:a701  10 84		 bpl $a687
$1d:a703  80 79		 bra $a77e
$1d:a705  60			rts
$1d:a706  83 dd		 sta $dd,s
$1d:a708  29 97 08	  and #$0897
$1d:a70b  b0 04		 bcs $a711
$1d:a70d  c2 e1		 rep #$e1
$1d:a70f  14 40		 trb $40
$1d:a711  b5 e6		 lda $e6,x
$1d:a713  b5 22		 lda $22,x
$1d:a715  84 20		 sty $20
$1d:a717  0a			asl a
$1d:a718  70 63		 bvs $a77d
$1d:a71a  d9 c2 3c	  cmp $3cc2,y
$1d:a71d  08			php
$1d:a71e  23 58		 and $58,s
$1d:a720  82 40 94	  brl $3b63
$1d:a723  81 d7		 sta ($d7,x)
$1d:a725  33 12		 and ($12,s),y
$1d:a727  90 3b		 bcc $a764
$1d:a729  29 02 52	  and #$5202
$1d:a72c  87 9c		 sta [$9c]
$1d:a72e  cc 4a 50	  cpy $504a
$1d:a731  f4 a7 bd	  pea $bda7
$1d:a734  5e 3e 25	  lsr $253e,x
$1d:a737  9a			txs
$1d:a738  78			sei
$1d:a739  97 5e		 sta [$5e],y
$1d:a73b  cb			wai
$1d:a73c  a5 b0		 lda $b0
$1d:a73e  a9 05 0a	  lda #$0a05
$1d:a741  23 18		 and $18,s
$1d:a743  36 00		 rol $00,x
$1d:a745  55 02		 eor $02,x
$1d:a747  ac 1b 3c	  ldy $3c1b
$1d:a74a  00 51		 brk #$51
$1d:a74c  45 57		 eor $57
$1d:a74e  82 1c 78	  brl $1f6d
$1d:a751  74 74		 stz $74,x
$1d:a753  04 df		 tsb $df
$1d:a755  0e 8e 88	  asl $888e
$1d:a758  c5 e1		 cmp $e1
$1d:a75a  d1 d2		 cmp ($d2),y
$1d:a75c  1d fc 3a	  ora $3afc,x
$1d:a75f  3a			dec a
$1d:a760  64 67		 stz $67
$1d:a762  87 47		 sta [$47]
$1d:a764  50 a1		 bvc $a707
$1d:a766  f0 e8		 beq $a750
$1d:a768  ea			nop
$1d:a769  96 de		 stx $de,y
$1d:a76b  1d 1d 63	  ora $631d,x
$1d:a76e  2f c3 a3 ae   and $aea3c3
$1d:a772  70 78		 bvs $a7ec
$1d:a774  d0 79		 bne $a7ef
$1d:a776  cf 53 8c 3d   cmp $3d8c53
$1d:a77a  56 04		 lsr $04,x
$1d:a77c  03 38		 ora $38,s
$1d:a77e  47 6e		 eor [$6e]
$1d:a780  08			php
$1d:a781  04 18		 tsb $18
$1d:a783  44 03 d7	  mvp $d7,$03
$1d:a786  04 05		 tsb $05
$1d:a788  b0 8c		 bcs $a716
$1d:a78a  04 61		 tsb $61
$1d:a78c  03 05		 ora $05,s
$1d:a78e  04 12		 tsb $12
$1d:a790  09 08 84	  ora #$8408
$1d:a793  7f 43 e4 1c   adc $1ce443,x
$1d:a797  90 00		 bcc $a799
$1d:a799  08			php
$1d:a79a  81 40		 sta ($40,x)
$1d:a79c  1d e9 16	  ora $16e9,x
$1d:a79f  81 c5		 sta ($c5,x)
$1d:a7a1  a0 91		 ldy #$91
$1d:a7a3  68			pla
$1d:a7a4  9c 5a 29	  stz $295a
$1d:a7a7  16 82		 asl $82,x
$1d:a7a9  c5 a0		 cmp $a0
$1d:a7ab  d1 68		 cmp ($68),y
$1d:a7ad  ac 5a 2d	  ldy $2d5a
$1d:a7b0  02 fe		 cop #$fe
$1d:a7b2  81 d2		 sta ($d2,x)
$1d:a7b4  29 10 8a	  and #$8a10
$1d:a7b7  49 41 e7	  eor #$e741
$1d:a7ba  35 0b		 and $0b,x
$1d:a7bc  88			dey
$1d:a7bd  40			rti
$1d:a7be  03 89		 ora $89,s
$1d:a7c0  36 11		 rol $11,x
$1d:a7c2  8c 98 1e	  sty $1e98
$1d:a7c5  22 82 93 c5   jsl $c59382
$1d:a7c9  25 03		 and $03
$1d:a7cb  11 93		 ora ($93),y
$1d:a7cd  c4 a4		 cpy $a4
$1d:a7cf  71 29		 adc ($29),y
$1d:a7d1  24 4a		 bit $4a
$1d:a7d3  67 12		 adc [$12]
$1d:a7d5  9a			txs
$1d:a7d6  45 26		 eor $26
$1d:a7d8  23 f5		 and $f5,s
$1d:a7da  99 11 d2	  sta $d211,y
$1d:a7dd  1d 2e 87	  ora $872e,x
$1d:a7e0  4b			phk
$1d:a7e1  e1 d3		 sbc ($d3,x)
$1d:a7e3  e8			inx
$1d:a7e4  74 fe		 stz $fe,x
$1d:a7e6  21 40		 and ($40,x)
$1d:a7e8  88			dey
$1d:a7e9  54 0b 22	  mvn $22,$0b
$1d:a7ec  58			cli
$1d:a7ed  22 c0 16 10   jsl $1016c0
$1d:a7f1  c0 71		 cpy #$71
$1d:a7f3  6b			rtl
$1d:a7f4  04 5a		 tsb $5a
$1d:a7f6  c3 16		 cmp $16,s
$1d:a7f8  b8			clv
$1d:a7f9  45 ae		 eor $ae
$1d:a7fb  31 6b		 and ($6b),y
$1d:a7fd  1c 5a c5	  trb $c55a
$1d:a800  1a			inc a
$1d:a801  8c 1e c0	  sty $c01e
$1d:a804  ee 15 63	  inc $6315
$1d:a807  80 60		 bra $a869
$1d:a809  a2 d8		 ldx #$d8
$1d:a80b  38			sec
$1d:a80c  d5 06		 cmp $06,x
$1d:a80e  35 42		 and $42,x
$1d:a810  8d 54 63	  sta $6354
$1d:a813  55 28		 eor $28,x
$1d:a815  d5 0e		 cmp $0e,x
$1d:a817  35 44		 and $44,x
$1d:a819  8d 54 e3	  sta $e354
$1d:a81c  55 40		 eor $40,x
$1d:a81e  78			sei
$1d:a81f  c2 81		 rep #$81
$1d:a821  e3 1a		 sbc $1a,s
$1d:a823  3b			tsc
$1d:a824  94 5a		 sty $5a,x
$1d:a826  6b			rtl
$1d:a827  12 94		 ora ($94)
$1d:a829  9d d6 13	  sta $13d6,x
$1d:a82c  16 c0		 asl $c0,x
$1d:a82e  45 b0		 eor $b0
$1d:a830  27 32		 and [$32]
$1d:a832  8f 52 63 d4   sta $d46352
$1d:a836  a8			tay
$1d:a837  f5 66		 sbc $66,x
$1d:a839  3d 5a 8b	  and $8b5a,x
$1d:a83c  5c a2 d7 34   jml $34d7a2
$1d:a840  19 46 20	  ora $2046,y
$1d:a843  f1 86		 sbc ($86),y
$1d:a845  48			pha
$1d:a846  42 01		 wdm #$01
$1d:a848  e0 c9		 cpx #$c9
$1d:a84a  18			clc
$1d:a84b  48			pha
$1d:a84c  3c 2b 0c	  bit $0c2b,x
$1d:a84f  c1 66		 cmp ($66,x)
$1d:a851  99 f8 54	  sta $54f8,y
$1d:a854  24 e3		 bit $e3
$1d:a856  13 c1		 ora ($c1,s),y
$1d:a858  41 cf		 eor ($cf,x)
$1d:a85a  a3 90		 lda $90,s
$1d:a85c  8b			phb
$1d:a85d  64 62		 stz $62
$1d:a85f  da			phx
$1d:a860  08			php
$1d:a861  b6 86		 ldx $86,y
$1d:a863  2d 92 7b	  and $7b92
$1d:a866  8e 89 f6	  stx $f689
$1d:a869  2f 80 c9 be   and $bec980
$1d:a86d  c7 46		 cmp [$46]
$1d:a86f  cb			wai
$1d:a870  38			sec
$1d:a871  bb			tyx
$1d:a872  24 1a		 bit $1a
$1d:a874  64 c9		 stz $c9
$1d:a876  18			clc
$1d:a877  cb			wai
$1d:a878  6c 9a e4	  jmp ($e49a)
$1d:a87b  97 58		 sta [$58],y
$1d:a87d  54 59 40	  mvn $40,$59
$1d:a880  51 01		 eor ($01),y
$1d:a882  58			cli
$1d:a883  07 55		 ora [$55]
$1d:a885  34 41		 bit $41,x
$1d:a887  c3 88		 cmp $88,s
$1d:a889  4a			lsr a
$1d:a88a  62 93 58	  per $0120
$1d:a88d  a4 99		 ldy $99
$1d:a88f  36 33		 rol $33,x
$1d:a891  51 f8		 eor ($f8),y
$1d:a893  a7 02		 lda [$02]
$1d:a895  4b			phk
$1d:a896  18			clc
$1d:a897  85 c6		 sta $c6
$1d:a899  21 91		 and ($91,x)
$1d:a89b  88			dey
$1d:a89c  dc 62 39	  jml [$3962]
$1d:a89f  18			clc
$1d:a8a0  8e c6 23	  stx $23c6
$1d:a8a3  cd 73 66	  cmp $6673
$1d:a8a6  13 58		 ora ($58,s),y
$1d:a8a8  da			phx
$1d:a8a9  a4 d5		 ldy $d5
$1d:a8ab  01 39		 ora ($39,x)
$1d:a8ad  29 46 6b	  and #$6b46
$1d:a8b0  98			tya
$1d:a8b1  8e e6 23	  stx $23e6
$1d:a8b4  d9 88 6e	  cmp $6e88,y
$1d:a8b7  62 1c 43	  per $ebd6
$1d:a8ba  21 f8		 and ($f8,x)
$1d:a8bc  cd 89 64	  cmp $6489
$1d:a8bf  85 01		 sta $01
$1d:a8c1  f8			sed
$1d:a8c2  c9 e2 93	  cmp #$93e2
$1d:a8c5  88			dey
$1d:a8c6  a4 a2		 ldy $a2
$1d:a8c8  29 37 47	  and #$4737
$1d:a8cb  8a			txa
$1d:a8cc  50 12		 bvc $a8e0
$1d:a8ce  40			rti
$1d:a8cf  96 00		 stx $00,y
$1d:a8d1  e3 26		 sbc $26,s
$1d:a8d3  09 28 25	  ora #$2528
$1d:a8d6  73 4a		 adc ($4a,s),y
$1d:a8d8  04 9e		 tsb $9e
$1d:a8da  b1 0c		 lda ($0c),y
$1d:a8dc  ac 42 eb	  ldy $eb42
$1d:a8df  11 ca		 ora ($ca),y
$1d:a8e1  c4 6e		 cpy $6e
$1d:a8e3  3d 2a 8f	  and $8f2a,x
$1d:a8e6  4a			lsr a
$1d:a8e7  e3 d3		 sbc $d3,s
$1d:a8e9  a8			tay
$1d:a8ea  f4 ee 2d	  pea $2dee
$1d:a8ed  61 8b		 adc ($8b,x)
$1d:a8ef  60			rts
$1d:a8f0  4e a0 cb	  lsr $cba0
$1d:a8f3  1b			tcs
$1d:a8f4  98			tya
$1d:a8f5  9c 59 85	  stz $8559
$1d:a8f8  69 6b 8d	  adc #$8d6b
$1d:a8fb  e5 b6		 sbc $b6
$1d:a8fd  03 15		 ora $15,s
$1d:a8ff  53 12		 eor ($12,s),y
$1d:a901  70 13		 bvs $a916
$1d:a903  83 1a		 sta $1a,s
$1d:a905  a2 c6		 ldx #$c6
$1d:a907  a8			tay
$1d:a908  d1 aa		 cmp ($aa),y
$1d:a90a  ac 6a ad	  ldy $ad6a
$1d:a90d  1a			inc a
$1d:a90e  a3 c6		 lda $c6,s
$1d:a910  a9 11 aa	  lda #$aa11
$1d:a913  bc 6a b1	  ldy $b16a,x
$1d:a916  1a			inc a
$1d:a917  96 46		 stx $46,y
$1d:a919  a5 b1		 lda $b1
$1d:a91b  a9 e4 6a	  lda #$6ae4
$1d:a91e  7a			ply
$1d:a91f  ff e8 b5 a8   sbc $a8b5e8,x
$1d:a923  2e 37 a0	  rol $a037
$1d:a926  d8			cld
$1d:a927  fa			plx
$1d:a928  22 de 90 f9   jsl $f990de
$1d:a92c  fa			plx
$1d:a92d  a2 de		 ldx #$de
$1d:a92f  b1 39		 lda ($39),y
$1d:a931  46 ac		 lsr $ac
$1d:a933  b1 ab		 lda ($ab),y
$1d:a935  34 6a		 bit $6a,x
$1d:a937  eb			xba
$1d:a938  1a			inc a
$1d:a939  bb			tyx
$1d:a93a  46 ac		 lsr $ac
$1d:a93c  f1 ab		 sbc ($ab),y
$1d:a93e  44 4a ef	  mvp $ef,$4a
$1d:a941  12 bc		 ora ($bc)
$1d:a943  46 a9		 lsr $a9
$1d:a945  91 aa		 sta ($aa),y
$1d:a947  6c 6a b9	  jmp ($b96a)
$1d:a94a  1a			inc a
$1d:a94b  ae 8f ce	  ldx $ce8f
$1d:a94e  bd 1a af	  lda $af1a,x
$1d:a951  8f cc 8c 04   sta $048ccc
$1d:a955  60			rts
$1d:a956  97 46		 sta [$46],y
$1d:a958  a5 f1		 lda $f1
$1d:a95a  a9 f4 6a	  lda #$6af4
$1d:a95d  7f 1e 97 47   adc $47971e,x
$1d:a961  a5 f1		 lda $f1
$1d:a963  e9 f4 7a	  sbc #$7af4
$1d:a966  7f 16 c9 32   adc $32c916,x
$1d:a96a  45 94		 eor $94
$1d:a96c  19 18 b5	  ora $b518,y
$1d:a96f  b6 2d		 ldx $2d,y
$1d:a971  6e 0f 9d	  ror $9d0f
$1d:a974  bc e2 22	  ldy $22e2,x
$1d:a977  81 8c		 sta ($8c,x)
$1d:a979  1f c5 c6 47   ora $47c6c5,x
$1d:a97d  f3 88		 sbc ($88,s),y
$1d:a97f  65 23		 adc $23
$1d:a981  51 4b		 eor ($4b),y
$1d:a983  22 3d 23 17   jsl $17233d
$1d:a987  44 ba 45	  mvp $45,$ba
$1d:a98a  b2 91		 lda ($91)
$1d:a98c  6c ac 5b	  jmp ($5bac)
$1d:a98f  48			pha
$1d:a990  a3 15		 lda $15,s
$1d:a992  10 65		 bpl $a9f9
$1d:a994  94 65		 sty $65,x
$1d:a996  14 c4		 trb $c4
$1d:a998  c5 31		 cmp $31
$1d:a99a  51 4c		 eor ($4c),y
$1d:a99c  bc 53 31	  ldy $3153,x
$1d:a99f  14 c3		 trb $c3
$1d:a9a1  c5 31		 cmp $31
$1d:a9a3  0a			asl a
$1d:a9a4  f3 58		 sbc ($58,s),y
$1d:a9a6  02 40		 cop #$40
$1d:a9a8  16 80		 asl $80,x
$1d:a9aa  90 25		 bcc $a9d1
$1d:a9ac  90 24		 bcc $a9d2
$1d:a9ae  01 6c		 ora ($6c,x)
$1d:a9b0  49 00 60	  eor #$6000
$1d:a9b3  12 40		 ora ($40)
$1d:a9b5  17 40		 ora [$40],y
$1d:a9b7  c8			iny
$1d:a9b8  10 b9		 bpl $a973
$1d:a9ba  e1 22		 sbc ($22,x)
$1d:a9bc  d8			cld
$1d:a9bd  50 b9		 bvc $a978
$1d:a9bf  b9 83 0d	  lda $0d83,y
$1d:a9c2  12 bf		 ora ($bf)
$1d:a9c4  44 b1 b1	  mvp $b1,$b1
$1d:a9c7  2c e4 4b	  bit $4be4
$1d:a9ca  3b			tsc
$1d:a9cb  1a			inc a
$1d:a9cc  bf bd c7 1e   lda $1ec7bd,x
$1d:a9d0  fb			xce
$1d:a9d1  17 c2		 ora [$c2],y
$1d:a9d3  67 dd		 adc [$dd]
$1d:a9d5  e2 f0		 sep #$f0
$1d:a9d7  0c 70 2c	  tsb $2c70
$1d:a9da  23 5a		 and $5a,s
$1d:a9dc  e8			inx
$1d:a9dd  d6 fe		 dec $fe,x
$1d:a9df  25 5b		 and $5b
$1d:a9e1  89 52		 bit #$52
$1d:a9e3  e3 12		 sbc $12,s
$1d:a9e5  78			sei
$1d:a9e6  c4 e2		 cpy $e2
$1d:a9e8  31 28		 and ($28),y
$1d:a9ea  8c 4d c2	  sty $c24d
$1d:a9ed  e2 1c		 sep #$1c
$1d:a9ef  00 d0		 brk #$d0
$1d:a9f1  07 90		 ora [$90]
$1d:a9f3  38			sec
$1d:a9f4  31 2d		 and ($2d),y
$1d:a9f6  64 4b		 stz $4b
$1d:a9f8  5b			tcd
$1d:a9f9  12 de		 ora ($de)
$1d:a9fb  44 b7 b1	  mvp $b1,$b7
$1d:a9fe  2b			pld
$1d:a9ff  e8			inx
$1d:aa00  dc 71 83	  jml [$8371]
$1d:aa03  b0 07		 bcs $aa0c
$1d:aa05  8e be 35	  stx $35be
$1d:aa08  be 08 84	  ldx $8408,y
$1d:aa0b  6b			rtl
$1d:aa0c  16 45		 asl $45,x
$1d:aa0e  1b			tcs
$1d:aa0f  d8			cld
$1d:aa10  4c 23 5a	  jmp $5a23
$1d:aa13  e1 c9		 sbc ($c9,x)
$1d:aa15  46 b7		 lsr $b7
$1d:aa17  c2 75		 rep #$75
$1d:aa19  93 c4		 sta ($c4,s),y
$1d:aa1b  a0 43 11	  ldy #$1143
$1d:aa1e  31 86		 and ($86),y
$1d:aa20  f4 2e 62	  pea $622e
$1d:aa23  41 27		 eor ($27,x)
$1d:aa25  8d 2c 26	  sta $262c
$1d:aa28  36 b0		 rol $b0,x
$1d:aa2a  a8			tay
$1d:aa2b  13 c2		 ora ($c2,s),y
$1d:aa2d  34 12		 bit $12,x
$1d:aa2f  18			clc
$1d:aa30  17 f4		 ora [$f4],y
$1d:aa32  fe 84 f3	  inc $f384,x
$1d:aa35  de c6 ad	  dec $adc6,x
$1d:aa38  91 ac		 sta ($ac),y
$1d:aa3a  dc 6b 57	  jml [$576b]
$1d:aa3d  1a			inc a
$1d:aa3e  cc c6 b3	  cpy $b3c6
$1d:aa41  51 ad		 eor ($ad),y
$1d:aa43  cc 6b 75	  cpy $756b
$1d:aa46  1a			inc a
$1d:aa47  7e 36 a6	  ror $a636,x
$1d:aa4a  35 aa		 and $aa,x
$1d:aa4c  8d 6c 23	  sta $236c
$1d:aa4f  5b			tcd
$1d:aa50  18			clc
$1d:aa51  d7 02		 cmp [$02],y
$1d:aa53  35 c1		 and $c1,x
$1d:aa55  8d 6d a3	  sta $a36d
$1d:aa58  50 f5		 bvc $aa4f
$1d:aa5a  78			sei
$1d:aa5b  f0 96		 beq $a9f3
$1d:aa5d  22 b2 05 b0   jsl $b005b2
$1d:aa61  47 d6		 eor [$d6]
$1d:aa63  23 b7		 and $b7,s
$1d:aa65  8d 74 58	  sta $5874
$1d:aa68  22 b8 25 f0   jsl $f025b8
$1d:aa6c  31 01		 and ($01),y
$1d:aa6e  90 91		 bcc $aa01
$1d:aa70  f8			sed
$1d:aa71  a7 11		 lda [$11]
$1d:aa73  ae 91 2d	  ldx $2d91
$1d:aa76  94 4b		 sty $4b,x
$1d:aa78  67 12		 adc [$12]
$1d:aa7a  da			phx
$1d:aa7b  44 b6 b1	  mvp $b1,$b6
$1d:aa7e  ae 85 6b	  ldx $6b85
$1d:aa81  a1 1a		 lda ($1a,x)
$1d:aa83  f0 56		 beq $aadb
$1d:aa85  bc 0a f1	  ldy $f10a,x
$1d:aa88  78			sei
$1d:aa89  23 08		 and $08,s
$1d:aa8b  1f 09 d8 7f   ora $7fd809,x
$1d:aa8f  be ec 12	  ldx $12ec,y
$1d:aa92  2b			pld
$1d:aa93  02 59		 cop #$59
$1d:aa95  04 e4		 tsb $e4
$1d:aa97  26 11		 rol $11
$1d:aa99  2d 40 5c	  and $5c40
$1d:aa9c  46 81		 lsr $81
$1d:aa9e  bc 27 8d	  ldy $8d27,x
$1d:aaa1  3c 76 34	  bit $3476,x
$1d:aaa4  e7 19		 sbc [$19]
$1d:aaa6  38			sec
$1d:aaa7  ca			dex
$1d:aaa8  29 26 8a	  and #$8a26
$1d:aaab  49 45 e5	  eor #$e545
$1d:aaae  12 80		 ora ($80)
$1d:aab0  c4 b1		 cpy $b1
$1d:aab2  b1 28		 lda ($28),y
$1d:aab4  8c 4b 3a	  sty $3a4b
$1d:aab7  af 1e 19 04   lda $04191e
$1d:aabb  40			rti
$1d:aabc  01 a5		 ora ($a5,x)
$1d:aabe  7f 8b 08 34   adc $34088b,x
$1d:aac2  b1 4e		 lda ($4e),y
$1d:aac4  41 3c		 eor ($3c,x)
$1d:aac6  78			sei
$1d:aac7  e5 30		 sbc $30
$1d:aac9  85 74		 sta $74
$1d:aacb  a1 5d		 lda ($5d,x)
$1d:aacd  38			sec
$1d:aace  57 8a		 eor [$8a],y
$1d:aad0  15 e3		 ora $e3,x
$1d:aad2  8d 75 23	  sta $2375
$1d:aad5  5d 58 d7	  eor $d758,x
$1d:aad8  92 35		 sta ($35)
$1d:aada  e5 13		 sbc $13
$1d:aadc  9e 9a 25	  stz $259a,x
$1d:aadf  a7 8a		 lda [$8a]
$1d:aae1  44 0d e5	  mvp $e5,$0d
$1d:aae4  10 94		 bpl $aa7a
$1d:aae6  9c 5a 35	  stz $355a
$1d:aae9  e1 7e		 sbc ($7e,x)
$1d:aaeb  9f 86 29 c5   sta $c52986,x
$1d:aaef  43 a9		 eor $a9,s
$1d:aaf1  50 62		 bvc $ab55
$1d:aaf3  9c 64 98	  stz $9864
$1d:aaf6  cd 52 e3	  cmp $e352
$1d:aaf9  36 4d		 rol $4d,x
$1d:aafb  84 6b		 sty $6b
$1d:aafd  ad 1a eb	  lda $eb1a
$1d:ab00  c6 bc		 dec $bc
$1d:ab02  d1 af		 cmp ($af),y
$1d:ab04  3c 7b 93	  bit $937b,x
$1d:ab07  1e e5 47	  asl $47e5,x
$1d:ab0a  bb			tyx
$1d:ab0b  31 ee		 and ($ee),y
$1d:ab0d  d1 ce		 cmp ($ce),y
$1d:ab0f  8d e7 32	  sta $32e7
$1d:ab12  8c 72 d7	  sty $d772
$1d:ab15  e3 db		 sbc $db,s
$1d:ab17  4b			phk
$1d:ab18  8f d4 de 19   sta $19ded4
$1d:ab1c  4c f1 bc	  jmp $bcf1
$1d:ab1f  6f 8c f5 67   adc $67f58c
$1d:ab23  0b			phd
$1d:ab24  34 0e		 bit $0e,x
$1d:ab26  a2 ca 09	  ldx #$09ca
$1d:ab29  33 34		 and ($34,s),y
$1d:ab2b  66 a7		 ror $a7
$1d:ab2d  53 69		 eor ($69,s),y
$1d:ab2f  04 9e		 tsb $9e
$1d:ab31  29 b8 8a	  and #$8ab8
$1d:ab34  4a			lsr a
$1d:ab35  22 93 73 79   jsl $797393
$1d:ab39  53 24		 eor ($24,s),y
$1d:ab3b  50 c9		 bvc $ab06
$1d:ab3d  09 bc 9f	  ora #$9fbc
$1d:ab40  a0 fd 79	  ldy #$79fd
$1d:ab43  13 5c		 ora ($5c,s),y
$1d:ab45  d3 81		 cmp ($81,s),y
$1d:ab47  f6 17		 inc $17,x
$1d:ab49  8b			phb
$1d:ab4a  b8			clv
$1d:ab4b  03 08		 ora $08,s
$1d:ab4d  de 20 b0	  dec $b020,x
$1d:ab50  34 0a		 bit $0a,x
$1d:ab52  6c 75 28	  jmp ($2875)
$1d:ab55  67 30		 adc [$30]
$1d:ab57  4e 23 00	  lsr $0023
$1d:ab5a  e6 c3		 inc $c3
$1d:ab5c  39 d0 ce	  and $ced0,y
$1d:ab5f  ec 33 bc	  cpx $bc33
$1d:ab62  39 11 d0	  and $d011,y
$1d:ab65  77 b9		 adc [$b9],y
$1d:ab67  83 e2		 sta $e2,s
$1d:ab69  e7 8f		 sbc [$8f]
$1d:ab6b  47 bf		 eor [$bf]
$1d:ab6d  0c fa 0b	  tsb $0bfa
$1d:ab70  c7 b8		 cmp [$b8]
$1d:ab72  27 17		 and [$17]
$1d:ab74  82 3c 80	  brl $2bb3
$1d:ab77  40			rti
$1d:ab78  2e 32 8c	  rol $8c32
$1d:ab7b  42 0c		 wdm #$0c
$1d:ab7d  20 67 06	  jsr $0667
$1d:ab80  69 8d 0b	  adc #$0b8d
$1d:ab83  d8			cld
$1d:ab84  3b			tsc
$1d:ab85  3f 6c 33 dc   and $dc336c,x
$1d:ab89  45 11		 eor $11
$1d:ab8b  f0 7b		 beq $ac08
$1d:ab8d  90 62		 bcc $abf1
$1d:ab8f  4c 24 20	  jmp $2024
$1d:ab92  7b			tdc
$1d:ab93  ca			dex
$1d:ab94  65 0c		 adc $0c
$1d:ab96  f9 b2 c2	  sbc $c2b2,y
$1d:ab99  31 27		 and ($27),y
$1d:ab9b  8c 6e 23	  sty $236e
$1d:ab9e  12 84		 ora ($84)
$1d:aba0  c8			iny
$1d:aba1  09 c4 24	  ora #$24c4
$1d:aba4  10 a5		 bpl $ab4b
$1d:aba6  18			clc
$1d:aba7  25 d6		 and $d6
$1d:aba9  6e 6b 04	  ror $046b
$1d:abac  a8			tay
$1d:abad  c5 e3		 cmp $e3
$1d:abaf  11 98		 ora ($98),y
$1d:abb1  67 c2		 adc [$c2]
$1d:abb3  19 f1 19	  ora $19f1,y
$1d:abb6  9f c5 72 ff   sta $ff72c5,x
$1d:abba  20 39 2b	  jsr $2b39
$1d:abbd  c4 d4		 cpy $d4
$1d:abbf  0b			phd
$1d:abc0  42 2a		 wdm #$2a
$1d:abc2  06 79		 asl $79
$1d:abc4  26 06		 rol $06
$1d:abc6  d0 27		 bne $abef
$1d:abc8  8b			phb
$1d:abc9  68			pla
$1d:abca  3b			tsc
$1d:abcb  86 d1		 stx $d1
$1d:abcd  9a			txs
$1d:abce  c5 3e		 cmp $3e
$1d:abd0  a1 33		 lda ($33,x)
$1d:abd2  04 0a		 tsb $0a
$1d:abd4  54 32 91	  mvn $91,$32
$1d:abd7  a0 79 bd	  ldy #$bd79
$1d:abda  09 d0 0e	  ora #$0ed0
$1d:abdd  80 7a		 bra $ac59
$1d:abdf  1b			tcs
$1d:abe0  d4 d4		 pei ($d4)
$1d:abe2  80 58		 bra $ac3c
$1d:abe4  09 01 6c	  ora #$6c01
$1d:abe7  66 e5		 ror $e5
$1d:abe9  71 9c		 adc ($9c),y
$1d:abeb  16 c6		 asl $c6,x
$1d:abed  60			rts
$1d:abee  97 19		 sta [$19],y
$1d:abf0  02 ac		 cop #$ac
$1d:abf2  d3 01		 cmp ($01,s),y
$1d:abf4  38			sec
$1d:abf5  4d 8c c0	  eor $c08c
$1d:abf8  ae 25 c0	  ldx $c025
$1d:abfb  2e 00 48	  rol $4800
$1d:abfe  0b			phd
$1d:abff  09 20 80	  ora #$8020
$1d:ac02  0f fc a1 e6   ora $e6a1fc
$1d:ac06  1f 39 7a 0f   ora $0f7a39,x
$1d:ac0a  d2 9e		 cmp ($9e)
$1d:ac0c  a5 f5		 lda $f5
$1d:ac0e  b7 b1		 lda [$b1],y
$1d:ac10  fd b1 ee	  sbc $eeb1,x
$1d:ac13  9f 7d 78 2f   sta $2f787d,x
$1d:ac17  c3 9e		 cmp $9e,s
$1d:ac19  2d f1 f7	  and $f7f1
$1d:ac1c  93 fc		 sta ($fc,s),y
$1d:ac1e  c1 e7		 cmp ($e7,x)
$1d:ac20  1f 41 7a 4f   ora $4f7a41,x
$1d:ac24  d4 9f		 pei ($9f)
$1d:ac26  00 86		 brk #$86
$1d:ac28  7f a9 9f ec   adc $ec9fa9,x
$1d:ac2c  67 fb		 adc [$fb]
$1d:ac2e  99 fe 53	  sta $53fe,y
$1d:ac31  34 1b		 bit $1b,x
$1d:ac33  ef 46 fb c1   sbc $c1fb46
$1d:ac37  bf 14 6f c4   lda $c46f14,x
$1d:ac3b  1b			tcs
$1d:ac3c  f3 46		 sbc ($46,s),y
$1d:ac3e  fc c1 bf	  jsr ($bfc1,x)
$1d:ac41  54 6f d4	  mvn $d4,$6f
$1d:ac44  13 ff		 ora ($ff,s),y
$1d:ac46  44 ff e1	  mvp $e1,$ff
$1d:ac49  3f fc 4f fc   and $fc4ffc,x
$1d:ac4d  13 f9		 ora ($f9,s),y
$1d:ac4f  44 fe 61	  mvp $61,$fe
$1d:ac52  3f 9c 4f e4   and $e44f9c,x
$1d:ac56  13 f7		 ora ($f7,s),y
$1d:ac58  44 fd e1	  mvp $e1,$fd
$1d:ac5b  3f 7c 4f d8   and $d84f7c,x
$1d:ac5f  bf 0d aa 4e   lda $4eaa0d,x
$1d:ac63  2b			pld
$1d:ac64  d3 8b		 cmp ($8b,s),y
$1d:ac66  44 e2 e5	  mvp $e5,$e2
$1d:ac69  38			sec
$1d:ac6a  ca			dex
$1d:ac6b  4e 3a d3	  lsr $d33a
$1d:ac6e  88			dey
$1d:ac6f  c4 e6		 cpy $e6
$1d:ac71  45 39		 eor $39
$1d:ac73  a2 4e 70	  ldx #$704e
$1d:ac76  d3 9e		 cmp ($9e,s),y
$1d:ac78  44 e7 a5	  mvp $a5,$e7
$1d:ac7b  39 fa 4e	  and $4efa,y
$1d:ac7e  66 d3		 ror $d3
$1d:ac80  ab			plb
$1d:ac81  c4 eb		 cpy $eb
$1d:ac83  05 3a		 ora $3a
$1d:ac85  d2 4e		 cmp ($4e)
$1d:ac87  b8			clv
$1d:ac88  d3 af		 cmp ($af,s),y
$1d:ac8a  44 ea 15	  mvp $15,$ea
$1d:ac8d  3b			tsc
$1d:ac8e  ce 4e f9	  dec $f94e
$1d:ac91  d3 b8		 cmp ($b8,s),y
$1d:ac93  04 f2		 tsb $f2
$1d:ac95  65 3c		 adc $3c
$1d:ac97  a2 4f 2a	  ldx #$2a4f
$1d:ac9a  d3 cb		 cmp ($cb,s),y
$1d:ac9c  44 f3 55	  mvp $55,$f3
$1d:ac9f  3c ea 4f	  bit $4fea,x
$1d:aca2  3e d3 c8	  rol $c8d3,x
$1d:aca5  c4 f6		 cpy $f6
$1d:aca7  75 3d		 adc $3d,x
$1d:aca9  ae 4f 6f	  ldx $6f4f
$1d:acac  d3 dd		 cmp ($dd,s),y
$1d:acae  04 f7		 tsb $f7
$1d:acb0  85 3d		 sta $3d
$1d:acb2  f2 4f		 sbc ($4f)
$1d:acb4  60			rts
$1d:acb5  d3 e9		 cmp ($e9,s),y
$1d:acb7  04 fa		 tsb $fa
$1d:acb9  75 3e		 adc $3e,x
$1d:acbb  aa			tax
$1d:acbc  4f ae d3 e8   eor $e8d3ae
$1d:acc0  7c 00 88	  jmp ($8800,x)
$1d:acc3  58			cli
$1d:acc4  09 f7 ff	  ora #$fff7
$1d:acc7  fe 43 4e	  inc $4e43,x
$1d:acca  a1 29		 lda ($29,x)
$1d:accc  e5 13		 sbc $13
$1d:acce  f2 58		 sbc ($58)
$1d:acd0  41 c8		 eor ($c8,x)
$1d:acd2  83 01		 sta $01,s
$1d:acd4  24 09		 bit $09
$1d:acd6  85 33		 sta $33
$1d:acd8  86 85		 stx $85
$1d:acda  33 b6		 and ($b6,s),y
$1d:acdc  e0 94 26	  cpx #$2694
$1d:acdf  50 22		 bvc $ad03
$1d:ace1  a2 0d 35	  ldx #$350d
$1d:ace4  b3 f4		 lda ($f4,s),y
$1d:ace6  1f a5 3d 4b   ora $4b3da5,x
$1d:acea  88			dey
$1d:aceb  1f 59 7b 57   ora $577b59,x
$1d:acef  d6 9e		 dec $9e,x
$1d:acf1  43 23		 eor $23,s
$1d:acf3  28			plp
$1d:acf4  64 4b		 stz $4b
$1d:acf6  ca			dex
$1d:acf7  4b			phk
$1d:acf8  02 98		 cop #$98
$1d:acfa  04 53		 tsb $53
$1d:acfc  e0 18 50	  cpx #$5018
$1d:acff  bb			tyx
$1d:ad00  43 18		 eor $18,s
$1d:ad02  4e 53 07	  lsr $0753
$1d:ad05  6e 0e 7c	  ror $7c0e
$1d:ad08  95 eb		 sta $eb,x
$1d:ad0a  be 2c f9	  ldx $f92c,y
$1d:ad0d  f3 d1		 sbc ($d1,s),y
$1d:ad0f  be 6c 70	  ldx $706c,y
$1d:ad12  39 0b 43	  and $430b,y
$1d:ad15  22 0e 31 68   jsl $68310e
$1d:ad19  25 82		 and $82
$1d:ad1b  51 3f		 eor ($3f),y
$1d:ad1d  60			rts
$1d:ad1e  a5 2d		 lda $2d
$1d:ad20  90 ac		 bcc $acce
$1d:ad22  76 b7		 ror $b7,x
$1d:ad24  1c 9d 8e	  trb $8e9d
$1d:ad27  09 dc 74	  ora #$74dc
$1d:ad2a  fb			xce
$1d:ad2b  eb			xba
$1d:ad2c  cd 7c 09	  cmp $097c
$1d:ad2f  f1 67		 sbc ($67),y
$1d:ad31  8f 7d 5d 2d   sta $2d5d7d
$1d:ad35  b2 5e		 lda ($5e)
$1d:ad37  92 58		 sta ($58)
$1d:ad39  e0 1c 99	  cpx #$991c
$1d:ad3c  f9 c5 3e	  sbc $3ec5,y
$1d:ad3f  67 85		 adc [$85]
$1d:ad41  92 50		 sta ($50)
$1d:ad43  0e 29 4e	  asl $4e29
$1d:ad46  a0 36 c8	  ldy #$c836
$1d:ad49  46 47		 lsr $47
$1d:ad4b  72 11		 adc ($11)
$1d:ad4d  91 fc		 sta ($fc),y
$1d:ad4f  84 64		 sty $64
$1d:ad51  87 21		 sta [$21]
$1d:ad53  19 23 d9	  ora $d923,y
$1d:ad56  5a			phy
$1d:ad57  09 94 56	  ora #$5694
$1d:ad5a  82 85 15	  brl $c2e2
$1d:ad5d  a0 a9 45	  ldy #$45a9
$1d:ad60  68			pla
$1d:ad61  23 ca		 and $ca,s
$1d:ad63  0a			asl a
$1d:ad64  72 3b		 adc ($3b)
$1d:ad66  fd 01 ae	  sbc $ae01,x
$1d:ad69  99 46 f2	  sta $f246,y
$1d:ad6c  ea			nop
$1d:ad6d  5b			tcd
$1d:ad6e  cb			wai
$1d:ad6f  be 48 09	  ldx $0948,y
$1d:ad72  75 3a		 adc $3a,x
$1d:ad74  74 02		 stz $02,x
$1d:ad76  ea			nop
$1d:ad77  7a			ply
$1d:ad78  00 0a		 brk #$0a
$1d:ad7a  ff f0 86 ff   sbc $ff86f0,x
$1d:ad7e  42 0b		 wdm #$0b
$1d:ad80  12 a0		 ora ($a0)
$1d:ad82  8a			txa
$1d:ad83  7c e4 72	  jmp ($72e4,x)
$1d:ad86  71 c2		 adc ($c2),y
$1d:ad88  cf 09 1e 41   cmp $411e09
$1d:ad8c  4a			lsr a
$1d:ad8d  88			dey
$1d:ad8e  e1 6c		 sbc ($6c,x)
$1d:ad90  c6 8f		 dec $8f
$1d:ad92  7b			tdc
$1d:ad93  a4 12		 ldy $12
$1d:ad95  01 7b		 ora ($7b,x)
$1d:ad97  1c 1a 3c	  trb $3c1a
$1d:ad9a  35 b3		 and $b3,x
$1d:ad9c  f4 5a 65	  pea $655a
$1d:ad9f  d2 5b		 cmp ($5b)
$1d:ada1  ba			tsx
$1d:ada2  49 3a 25	  eor #$253a
$1d:ada5  3f 9f ff 22   and $22ff9f,x
$1d:ada9  48			pha
$1d:adaa  d8			cld
$1d:adab  20 99 46	  jsr $4699
$1d:adae  08			php
$1d:adaf  40			rti
$1d:adb0  28			plp
$1d:adb1  4c 5c 91	  jmp $915c
$1d:adb4  b5 1d		 lda $1d,x
$1d:adb6  12 4d		 ora ($4d)
$1d:adb8  11 80		 ora ($80),y
$1d:adba  53 5a		 eor ($5a,s),y
$1d:adbc  82 f1 24	  brl $d2b0
$1d:adbf  c9 3c 4a	  cmp #$4a3c
$1d:adc2  d2 f6		 cmp ($f6)
$1d:adc4  dc 63 d9	  jml [$d963]
$1d:adc7  d1 2c		 cmp ($2c),y
$1d:adc9  b1 f7		 lda ($f7),y
$1d:adcb  17 84		 ora [$84],y
$1d:adcd  f2 0c		 sbc ($0c)
$1d:adcf  72 3d		 adc ($3d)
$1d:add1  b5 08		 lda $08,x
$1d:add3  e4 48		 cpx $48
$1d:add5  90 2e		 bcc $ae05
$1d:add7  81 5f		 sta ($5f,x)
$1d:add9  cd 12 29	  cmp $2912
$1d:addc  03 af		 ora $af,s
$1d:adde  d0 86		 bne $ad66
$1d:ade0  21 07		 and ($07,x)
$1d:ade2  34 1f		 bit $1f,x
$1d:ade4  4a			lsr a
$1d:ade5  84 99		 sty $99
$1d:ade7  4f 72 81 61   eor $618172
$1d:adeb  54 34 ca	  mvn $ca,$34
$1d:adee  49 96 0b	  eor #$0b96
$1d:adf1  42 a1		 wdm #$a1
$1d:adf3  a5 d0		 lda $d0
$1d:adf5  52 0a		 eor ($0a)
$1d:adf7  74 14		 stz $14,x
$1d:adf9  82 bd 05	  brl $b3b9
$1d:adfc  20 b7 41	  jsr $41b7
$1d:adff  48			pha
$1d:ae00  2f d8 62 0a   and $0a62d8
$1d:ae04  74 18		 stz $18,x
$1d:ae06  82 bd 06	  brl $b4c6
$1d:ae09  20 b7 41	  jsr $41b7
$1d:ae0c  88			dey
$1d:ae0d  2f d0 62 0a   and $0a62d0
$1d:ae11  54 04 92	  mvn $92,$04
$1d:ae14  bc 81 24	  ldy $2481,x
$1d:ae17  b7 20		 lda [$20],y
$1d:ae19  49 2f d9	  eor #$d92f
$1d:ae1c  aa			tax
$1d:ae1d  15 e5		 ora $e5,x
$1d:ae1f  82 de 96	  brl $4500
$1d:ae22  0b			phd
$1d:ae23  96 58		 stx $58,y
$1d:ae25  2e c8 4c	  rol $4cc8
$1d:ae28  fc e5 82	  jsr ($82e5,x)
$1d:ae2b  fa			plx
$1d:ae2c  96 0b		 stx $0b,y
$1d:ae2e  06 a2		 asl $a2
$1d:ae30  26 52		 rol $52
$1d:ae32  45 44		 eor $44
$1d:ae34  4b			phk
$1d:ae35  b4 f8		 ldy $f8,x
$1d:ae37  c4 b5		 cpy $b5
$1d:ae39  a3 12		 lda $12,s
$1d:ae3b  dd 8c 4b	  cmp $4b8c,x
$1d:ae3e  92 35		 sta ($35)
$1d:ae40  2b			pld
$1d:ae41  7c 05 e8	  jmp ($e805,x)
$1d:ae44  df 01 ba 37   cmp $37ba01,x
$1d:ae48  c0 7e 8d	  cpy #$8d7e
$1d:ae4b  f0 23		 beq $ae70
$1d:ae4d  b0 84		 bcs $add3
$1d:ae4f  0a			asl a
$1d:ae50  28			plp
$1d:ae51  21 02		 and ($02,x)
$1d:ae53  ca			dex
$1d:ae54  08			php
$1d:ae55  40			rti
$1d:ae56  c2 82		 rep #$82
$1d:ae58  10 34		 bpl $ae8e
$1d:ae5a  a0 84 8e	  ldy #$8e84
$1d:ae5d  64 21		 stz $21
$1d:ae5f  23 d9		 and $d9,s
$1d:ae61  08			php
$1d:ae62  49 06 42	  eor #$4206
$1d:ae65  12 45		 ora ($45)
$1d:ae67  94 09		 sty $09,x
$1d:ae69  50 7a		 bvc $aee5
$1d:ae6b  ea			nop
$1d:ae6c  22 4c 15 25   jsl $25154c
$1d:ae70  ca			dex
$1d:ae71  a2 3d 53	  ldx #$533d
$1d:ae74  cc f2 57	  cpy $57f2
$1d:ae77  98			tya
$1d:ae78  d1 5f		 cmp ($5f),y
$1d:ae7a  a4 d5		 ldy $d5
$1d:ae7c  09 2d 14	  ora #$142d
$1d:ae7f  1e 94 8a	  asl $8a94,x
$1d:ae82  2b			pld
$1d:ae83  cc 9a a5	  cpy $a59a
$1d:ae86  6b			rtl
$1d:ae87  0b			phd
$1d:ae88  0b			phd
$1d:ae89  54 b0 e1	  mvn $e1,$b0
$1d:ae8c  e1 6a		 sbc ($6a,x)
$1d:ae8e  96 8c		 stx $8c,y
$1d:ae90  4c 30 34	  jmp $3430
$1d:ae93  31 df		 and ($df),y
$1d:ae95  e8			inx
$1d:ae96  04 34		 tsb $34
$1d:ae98  ca			dex
$1d:ae99  12 97		 ora ($97)
$1d:ae9b  52 4a		 eor ($4a)
$1d:ae9d  5d f5 01	  eor $01f5,x
$1d:aea0  aa			tax
$1d:aea1  48			pha
$1d:aea2  72 d6		 adc ($d6)
$1d:aea4  cf da a5 10   cmp $10a5da
$1d:aea8  80 46		 bra $aef0
$1d:aeaa  10 e2		 bpl $ae8e
$1d:aeac  71 03		 adc ($03),y
$1d:aeae  88			dey
$1d:aeaf  3d 41 fa	  and $fa41,x
$1d:aeb2  50 85		 bvc $ae39
$1d:aeb4  49 20 04	  eor #$0420
$1d:aeb7  e2 06		 sep #$06
$1d:aeb9  ff 40 01 ec   sbc $ec0140,x
$1d:aebd  d0 21		 bne $aee0
$1d:aebf  12 66		 ora ($66)
$1d:aec1  0c 45 1d	  tsb $1d45
$1d:aec4  f4 05 02	  pea $0205
$1d:aec7  50 11		 bvc $aeda
$1d:aec9  7e 80 09	  ror $0980,x
$1d:aecc  82 0d 18	  brl $c6dc
$1d:aecf  42 c4		 wdm #$c4
$1d:aed1  f8			sed
$1d:aed2  44 c9 06	  mvp $06,$c9
$1d:aed5  94 23		 sty $23,x
$1d:aed7  e0 c3 dc	  cpx #$dcc3
$1d:aeda  5e bb 4a	  lsr $4abb,x
$1d:aedd  13 08		 ora ($08,s),y
$1d:aedf  62 cc 67	  per $16ae
$1d:aee2  2d 81 f4	  and $f481
$1d:aee5  20 c8 00	  jsr $00c8
$1d:aee8  82 09 09	  brl $b7f4
$1d:aeeb  02 11		 cop #$11
$1d:aeed  42 30		 wdm #$30
$1d:aeef  43 9f		 eor $9f,s
$1d:aef1  81 01		 sta ($01,x)
$1d:aef3  9b			txy
$1d:aef4  37 84		 and [$84],y
$1d:aef6  62 01 ba	  per $68fa
$1d:aef9  15 04		 ora $04,x
$1d:aefb  20 4e 04	  jsr $044e
$1d:aefe  81 40		 sta ($40,x)
$1d:af00  80 64		 bra $af66
$1d:af02  20 10 c1	  jsr $c110
$1d:af05  98			tya
$1d:af06  40			rti
$1d:af07  a6 e3		 ldx $e3
$1d:af09  9f 25 0c d0   sta $d00c25,x
$1d:af0d  9c 94 42	  stz $4294
$1d:af10  a9 0d 82	  lda #$820d
$1d:af13  8c a6 17	  sty $17a6
$1d:af16  08			php
$1d:af17  28			plp
$1d:af18  c1 5a		 cmp ($5a,x)
$1d:af1a  cd e0 83	  cmp $83e0
$1d:af1d  b7 82		 lda [$82],y
$1d:af1f  8e 8e 34	  stx $348e
$1d:af22  90 30		 bcc $af54
$1d:af24  8d c2 08	  sta $08c2
$1d:af27  68			pla
$1d:af28  3a			dec a
$1d:af29  84 22		 sty $22
$1d:af2b  d4 07		 pei ($07)
$1d:af2d  05 60		 ora $60
$1d:af2f  c0 15 e3	  cpy #$e315
$1d:af32  00 90		 brk #$90
$1d:af34  2e 45 70	  rol $7045
$1d:af37  82 a2 44	  brl $f3dc
$1d:af3a  0c ba 05	  tsb $05ba
$1d:af3d  01 50		 ora ($50,x)
$1d:af3f  0b			phd
$1d:af40  28			plp
$1d:af41  28			plp
$1d:af42  4c d1 64	  jmp $64d1
$1d:af45  04 bb		 tsb $bb
$1d:af47  84 c6		 sty $c6
$1d:af49  16 b8		 asl $b8,x
$1d:af4b  e0 97 15	  cpx #$1597
$1d:af4e  05 15		 ora $15
$1d:af50  84 21		 sty $21
$1d:af52  e2 3e		 sep #$3e
$1d:af54  c6 60		 dec $60
$1d:af56  31 ca		 and ($ca),y
$1d:af58  58			cli
$1d:af59  cc 49 63	  cpy $6349
$1d:af5c  4d 25 8d	  eor $8d25
$1d:af5f  a4 96		 ldy $96
$1d:af61  38			sec
$1d:af62  6d 88 b2	  adc $b288
$1d:af65  a6 62		 ldx $62
$1d:af67  4a			lsr a
$1d:af68  9a			txs
$1d:af69  69 2a		 adc #$2a
$1d:af6b  6d 24 a9	  adc $a924
$1d:af6e  c3 ef		 cmp $ef,s
$1d:af70  28			plp
$1d:af71  94 33		 sty $33,x
$1d:af73  12 50		 ora ($50)
$1d:af75  d3 49		 cmp ($49,s),y
$1d:af77  43 69		 eor $69,s
$1d:af79  25 03		 and $03
$1d:af7b  c1 4f		 cmp ($4f,x)
$1d:af7d  43 18		 eor $18,s
$1d:af7f  18			clc
$1d:af80  c0 a9		 cpy #$a9
$1d:af82  33 77		 and ($77,s),y
$1d:af84  a2 02		 ldx #$02
$1d:af86  14 82		 trb $82
$1d:af88  f4 40 c3	  pea $c340
$1d:af8b  12 fe		 ora ($fe)
$1d:af8d  88			dey
$1d:af8e  18			clc
$1d:af8f  74 03		 stz $03,x
$1d:af91  f9 ff 55	  sbc $55ff,y
$1d:af94  82 ac 18	  brl $c843
$1d:af97  40			rti
$1d:af98  76 46		 ror $46,x
$1d:af9a  79 da e0	  adc $e0da,y
$1d:af9d  4c 2f 44	  jmp $442f
$1d:afa0  05 ea		 ora $ea
$1d:afa2  04 ad		 tsb $ad
$1d:afa4  f4 40 52	  pea $5240
$1d:afa7  9a			txs
$1d:afa8  de 88 1b	  dec $1b88,x
$1d:afab  db			stp
$1d:afac  af d1 03 4c   lda $4c03d1
$1d:afb0  0a			asl a
$1d:afb1  fa			plx
$1d:afb2  20 6d 82	  jsr $826d
$1d:afb5  af 44 0d 38   lda $380d44
$1d:afb9  7f e8 81 b7   adc $b781e8,x
$1d:afbd  40			rti
$1d:afbe  bf 7f f8 6a   lda $6af87f,x
$1d:afc2  19 ca 82	  ora $82ca,y
$1d:afc5  ac 18 45	  ldy $4518
$1d:afc8  20 ec 50	  jsr $50ec
$1d:afcb  88			dey
$1d:afcc  05 23		 ora $23
$1d:afce  04 6a		 tsb $6a
$1d:afd0  28			plp
$1d:afd1  c2 b1		 rep #$b1
$1d:afd3  60			rts
$1d:afd4  60			rts
$1d:afd5  f3 88		 sbc ($88,s),y
$1d:afd7  1f 4c 66 08   ora $08664c,x
$1d:afdb  40			rti
$1d:afdc  3c 94 22	  bit $2294,x
$1d:afdf  b0 69		 bcs $b04a
$1d:afe1  39 00 c0	  and $c000,y
$1d:afe4  d5 a1		 cmp $a1,x
$1d:afe6  04 07		 tsb $07
$1d:afe8  9c 60 fa	  stz $fa60
$1d:afeb  68			pla
$1d:afec  a0 50 24	  ldy #$2450
$1d:afef  41 4e		 eor ($4e,x)
$1d:aff1  03 02		 ora $02,s
$1d:aff3  53 02		 eor ($02,s),y
$1d:aff5  14 d0		 trb $d0
$1d:aff7  40			rti
$1d:aff8  82 03 97	  brl $46fe
$1d:affb  a0 d5 b2	  ldy #$b2d5
$1d:affe  89 0f 50	  bit #$500f
$1d:b001  d2 08		 cmp ($08)
$1d:b003  11 40		 ora ($40),y
$1d:b005  33 25		 and ($25,s),y
$1d:b007  af b1 a8 a8   lda $a8a8b1
$1d:b00b  70 b8		 bvs $afc5
$1d:b00d  07 f7		 ora [$f7]
$1d:b00f  fe db 64	  inc $64db,x
$1d:b012  10 40		 bpl $b054
$1d:b014  29 23 b0	  and #$b023
$1d:b017  26 09		 rol $09
$1d:b019  38			sec
$1d:b01a  28			plp
$1d:b01b  42 82		 wdm #$82
$1d:b01d  20 33 ec	  jsr $ec33
$1d:b020  87 c0		 sta [$c0]
$1d:b022  4e 23 40	  lsr $4023
$1d:b025  95 49		 sta $49,x
$1d:b027  4a			lsr a
$1d:b028  0e 20 ac	  asl $ac20
$1d:b02b  8e c5 5a	  stx $5ac5
$1d:b02e  04 02		 tsb $02
$1d:b030  56 80		 lsr $80,x
$1d:b032  71 05		 adc ($05),y
$1d:b034  40			rti
$1d:b035  4e 24 58	  lsr $5824
$1d:b038  9c 4c d0	  stz $d04c
$1d:b03b  27 91		 and [$91]
$1d:b03d  67 81		 adc [$81]
$1d:b03f  dc 4a e2	  jml [$e24a]
$1d:b042  3e 04 89	  rol $8904,x
$1d:b045  36 d2		 rol $d2,x
$1d:b047  02 e2		 cop #$e2
$1d:b049  2b			pld
$1d:b04a  04 09		 tsb $09
$1d:b04c  66 2e		 ror $2e
$1d:b04e  b0 b8		 bcs $b008
$1d:b050  0e cd 53	  asl $53cd
$1d:b053  b6 25		 ldx $25,y
$1d:b055  ca			dex
$1d:b056  5c 98 1e 2f   jml $2f1e98
$1d:b05a  1c 83 55	  trb $5583
$1d:b05d  34 0d		 bit $0d,x
$1d:b05f  cf 17 8e 49   cmp $498e17
$1d:b063  aa			tax
$1d:b064  9a			txs
$1d:b065  26 a8		 rol $a8
$1d:b067  c3 dc		 cmp $dc,s
$1d:b069  1f 42 79 20   ora $207942,x
$1d:b06d  a4 42		 ldy $42
$1d:b06f  ff 92 14 a6   sbc $a61492,x
$1d:b073  89 49 ee	  bit #$ee49
$1d:b076  d1 b2		 cmp ($b2),y
$1d:b078  2c 89 40	  bit $4089
$1d:b07b  17 47		 ora [$47],y
$1d:b07d  f1 aa		 sbc ($aa),y
$1d:b07f  76 cc		 ror $cc,x
$1d:b081  61 4b		 adc ($4b,x)
$1d:b083  b1 a3		 lda ($a3),y
$1d:b085  dd a3 94	  cmp $94a3,x
$1d:b088  30 a6		 bmi $b030
$1d:b08a  91 09		 sta ($09),y
$1d:b08c  ee d1 cb	  inc $cbd1
$1d:b08f  26 53		 rol $53
$1d:b091  4c a0 f7	  jmp $f7a0
$1d:b094  68			pla
$1d:b095  da			phx
$1d:b096  13 29		 ora ($29,s),y
$1d:b098  78			sei
$1d:b099  5e 7b 34	  lsr $347b,x
$1d:b09c  71 49		 adc ($49),y
$1d:b09e  94 cd		 sty $cd,x
$1d:b0a0  36 3d		 rol $3d,x
$1d:b0a2  9a			txs
$1d:b0a3  39 84 ca	  and $ca84,y
$1d:b0a6  6a			ror a
$1d:b0a7  1e 9e cd	  asl $cd9e,x
$1d:b0aa  1d d2 65	  ora $65d2,x
$1d:b0ad  39 41 0f	  and $0f41,y
$1d:b0b0  66 8e		 ror $8e
$1d:b0b2  31 32		 and ($32),y
$1d:b0b4  99 c1 67	  sta $67c1,y
$1d:b0b7  b3 47		 lda ($47,s),y
$1d:b0b9  1c 99 4c	  trb $4c99
$1d:b0bc  f1 23		 sbc ($23),y
$1d:b0be  d9 a3 bc	  cmp $bca3,y
$1d:b0c1  4c a7 30	  jmp $30a7
$1d:b0c4  c9 ec d1	  cmp #$d1ec
$1d:b0c7  df 17 53 9c   cmp $9c5317,x
$1d:b0cb  80 f1		 bra $b0be
$1d:b0cd  40			rti
$1d:b0ce  f0 20		 beq $b0f0
$1d:b0d0  90 08		 bcc $b0da
$1d:b0d2  22 c4 22 1c   jsl $1c22c4
$1d:b0d6  65 88		 adc $88
$1d:b0d8  38			sec
$1d:b0d9  86 2e		 stx $2e
$1d:b0db  de a8 3c	  dec $3ca8,x
$1d:b0de  03 84		 ora $84,s
$1d:b0e0  b1 38		 lda ($38),y
$1d:b0e2  7a			ply
$1d:b0e3  df d9 05 c4   cmp $c405d9,x
$1d:b0e7  66 d0		 ror $d0
$1d:b0e9  55 a0		 eor $a0,x
$1d:b0eb  69 54 f0	  adc #$f054
$1d:b0ee  35 05		 and $05,x
$1d:b0f0  32 11		 and ($11)
$1d:b0f2  0e 42 c4	  asl $c442
$1d:b0f5  13 20		 ora ($20,s),y
$1d:b0f7  b5 0e		 lda $0e,x
$1d:b0f9  4b			phk
$1d:b0fa  c3 d3		 cmp $d3,s
$1d:b0fc  03 e2		 ora $e2,s
$1d:b0fe  02 a7		 cop #$a7
$1d:b100  60			rts
$1d:b101  19 e1 d8	  ora $d8e1,y
$1d:b104  f2 01		 sbc ($01)
$1d:b106  6f b2 36 b5   adc $b536b2
$1d:b10a  4a			lsr a
$1d:b10b  f9 96 21	  sbc $2196,y
$1d:b10e  07 71		 ora [$71]
$1d:b110  84 43		 sty $43
$1d:b112  ac 59 f4	  ldy $f459
$1d:b115  c0 fa 0d	  cpy #$0dfa
$1d:b118  c9 d7 3a	  cmp #$3ad7
$1d:b11b  f8			sed
$1d:b11c  04 7d		 tsb $7d
$1d:b11e  48			pha
$1d:b11f  a6 00		 ldx $00
$1d:b121  08			php
$1d:b122  80 3b		 bra $b15f
$1d:b124  d6 79		 dec $79,x
$1d:b126  02 9e		 cop #$9e
$1d:b128  40			rti
$1d:b129  e7 91		 sbc [$91]
$1d:b12b  29 e4 4e	  and #$4ee4
$1d:b12e  79 04 9e	  adc $9e04,y
$1d:b131  41 67		 eor ($67,x)
$1d:b133  91 49		 sta ($49),y
$1d:b135  e4 56		 cpx $56
$1d:b137  79 06 9e	  adc $9e06,y
$1d:b13a  41 e7		 eor ($e7,x)
$1d:b13c  91 69		 sta ($69),y
$1d:b13e  e4 5e		 cpx $5e
$1d:b140  79 08 9e	  adc $9e08,y
$1d:b143  42 67		 wdm #$67
$1d:b145  91 89		 sta ($89),y
$1d:b147  e4 66		 cpx $66
$1d:b149  39 4e 8e	  and $8e4e,y
$1d:b14c  4f 03 23 3d   eor $3d2303
$1d:b150  8e 57 a3	  stx $a357
$1d:b153  94 f1		 sty $f1,x
$1d:b155  08			php
$1d:b156  cf 84 66 26   cmp $266684
$1d:b15a  09 fc 72	  ora #$72fc
$1d:b15d  41 1c		 eor ($1c,x)
$1d:b15f  90 c7		 bcc $b128
$1d:b161  26 11		 rol $11
$1d:b163  c9 8c 72	  cmp #$728c
$1d:b166  45 1c		 eor $1c
$1d:b168  91 c7		 sta ($c7),y
$1d:b16a  26 51		 rol $51
$1d:b16c  c9 9c 72	  cmp #$729c
$1d:b16f  49 1c 92	  eor #$921c
$1d:b172  c7 26		 cmp [$26]
$1d:b174  91 c9		 sta ($c9),y
$1d:b176  ac 72 4d	  ldy $4d72
$1d:b179  1c 93 c7	  trb $c793
$1d:b17c  26 d1		 rol $d1
$1d:b17e  c9 bc 72	  cmp #$72bc
$1d:b181  51 1c		 eor ($1c),y
$1d:b183  94 c7		 sty $c7,x
$1d:b185  27 11		 and [$11]
$1d:b187  c9 cc 72	  cmp #$72cc
$1d:b18a  9a			txs
$1d:b18b  17 10		 ora [$10],y
$1d:b18d  c0 d7 2b	  cpy #$2bd7
$1d:b190  91 c2		 sta ($c2),y
$1d:b192  f8			sed
$1d:b193  57 3b		 eor [$3b],y
$1d:b195  94 ce		 sty $ce,x
$1d:b197  e6 7a		 inc $7a
$1d:b199  b9 cc 8e	  lda $8ecc,y
$1d:b19c  6f bb 9b c8   adc $c89bbb
$1d:b1a0  e5 02		 sbc $02
$1d:b1a2  39 41 8e	  and $8e41,y
$1d:b1a5  54 23 95	  mvn $95,$23
$1d:b1a8  18			clc
$1d:b1a9  e5 0a		 sbc $0a
$1d:b1ab  39 43 8e	  and $8e43,y
$1d:b1ae  54 a3 95	  mvn $95,$a3
$1d:b1b1  38			sec
$1d:b1b2  e5 12		 sbc $12
$1d:b1b4  39 45 8e	  and $8e45,y
$1d:b1b7  55 23		 eor $23,x
$1d:b1b9  95 58		 sta $58,x
$1d:b1bb  e5 1a		 sbc $1a
$1d:b1bd  39 47 8e	  and $8e47,y
$1d:b1c0  55 a3		 eor $a3,x
$1d:b1c2  95 78		 sta $78,x
$1d:b1c4  e5 22		 sbc $22
$1d:b1c6  39 49 8e	  and $8e49,y
$1d:b1c9  56 23		 lsr $23,x
$1d:b1cb  95 98		 sta $98,x
$1d:b1cd  e5 30		 sbc $30
$1d:b1cf  ae 25 81	  ldx $8125
$1d:b1d2  31 91		 and ($91),y
$1d:b1d4  8c a3 97	  sty $97a3
$1d:b1d7  43 08		 eor $08,s
$1d:b1d9  2a			rol a
$1d:b1da  45 30		 eor $30
$1d:b1dc  16 08		 asl $08,x
$1d:b1de  e5 86		 sbc $86
$1d:b1e0  39 70 8e	  and $8e70,y
$1d:b1e3  5c 54 e2 b8   jml $b8e254
$1d:b1e7  6b			rtl
$1d:b1e8  d4 72		 pei ($72)
$1d:b1ea  d5 9c		 cmp $9c,x
$1d:b1ec  c5 a9		 cmp $a9
$1d:b1ee  c5 8c		 cmp $8c
$1d:b1f0  17 b5		 ora [$b5],y
$1d:b1f2  b9 e2 96	  lda $96e2,y
$1d:b1f5  f3 6f		 sbc ($6f,s),y
$1d:b1f7  4b			phk
$1d:b1f8  ad 7d 2e	  lda $2e7d
$1d:b1fb  2e 60 2c	  rol $2c60
$1d:b1fe  16 02		 asl $02,x
$1d:b200  39 81 8e	  and $8e81,y
$1d:b203  64 23		 stz $23
$1d:b205  99 17 79	  sta $7917,y
$1d:b208  e4 a3		 cpx $a3
$1d:b20a  99 36 3a	  sta $3a36,y
$1d:b20d  da			phx
$1d:b20e  d4 e2		 pei ($e2)
$1d:b210  cc 0c 5f	  cpy $5f0c
$1d:b213  71 8c		 adc ($8c),y
$1d:b215  4d 03 34	  eor $3403
$1d:b218  85 73		 sta $73
$1d:b21a  78			sei
$1d:b21b  19 08 e5	  ora $e508,y
$1d:b21e  9a			txs
$1d:b21f  b9 8d ee	  lda $ee8d,y
$1d:b222  6b			rtl
$1d:b223  84 23		 sty $23
$1d:b225  ce 72 8d	  dec $8d72
$1d:b228  78			sei
$1d:b229  52 33		 eor ($33)
$1d:b22b  d8			cld
$1d:b22c  e6 82		 inc $82
$1d:b22e  39 a1 8e	  and $8ea1,y
$1d:b231  60			rts
$1d:b232  a3 96		 lda $96,s
$1d:b234  38			sec
$1d:b235  e6 8a		 inc $8a
$1d:b237  39 a3 8e	  and $8ea3,y
$1d:b23a  59 63 96	  eor $9663,y
$1d:b23d  46 5a		 lsr $5a
$1d:b23f  57 18		 eor [$18],y
$1d:b241  40			rti
$1d:b242  08			php
$1d:b243  25 c3		 and $c3
$1d:b245  5a			phy
$1d:b246  82 a2 1a	  brl $cceb
$1d:b249  1c e7 33	  trb $33e7
$1d:b24c  b9 cc 14	  lda $14cc,y
$1d:b24f  8d 3c c2	  sta $c23c
$1d:b252  33 e0		 and ($e0,s),y
$1d:b254  e8			inx
$1d:b255  47 37		 eor [$37]
$1d:b257  e6 91		 inc $91
$1d:b259  de 47 2c	  dec $2c47,x
$1d:b25c  51 cb		 eor ($cb),y
$1d:b25e  94 72		 sty $72,x
$1d:b260  15 1c		 ora $1c,x
$1d:b262  85 c7		 sta $c7
$1d:b264  2e 71 cc	  rol $cc71
$1d:b267  1c 72 19	  trb $1972
$1d:b26a  1c 86 9b	  trb $9b86
$1d:b26d  ce 1d 1c	  dec $1c1d
$1d:b270  87 9d		 sta [$9d]
$1d:b272  ce 75 1c	  dec $1c75
$1d:b275  9d e7 35	  sta $35e7,x
$1d:b278  fd cd 7c	  sbc $7ccd,x
$1d:b27b  70 30		 bvs $b2ad
$1d:b27d  05 c0		 ora $c0
$1d:b27f  48			pha
$1d:b280  00 68		 brk #$68
$1d:b282  0b			phd
$1d:b283  c1 66		 cmp ($66,x)
$1d:b285  2e 86 70	  rol $7086
$1d:b288  34 19		 bit $19,x
$1d:b28a  d2 e8		 cmp ($e8)
$1d:b28c  77 29		 adc [$29],y
$1d:b28e  dd ca 6f	  cmp $6fca,x
$1d:b291  72 bf		 adc ($bf)
$1d:b293  dc 70 04	  jml [$0470]
$1d:b296  6a			ror a
$1d:b297  39 1b 8e	  and $8e1b,y
$1d:b29a  4a			lsr a
$1d:b29b  a3 92		 lda $92,s
$1d:b29d  b8			clv
$1d:b29e  e2 dc		 sep #$dc
$1d:b2a0  23 b1		 and $b1,s
$1d:b2a2  c9 64 72	  cmp #$7264
$1d:b2a5  5b			tcd
$1d:b2a6  1c 8f 47	  trb $478f
$1d:b2a9  23 f1		 and $f1,s
$1d:b2ab  c9 74 72	  cmp #$7274
$1d:b2ae  5f 1c a5 47   eor $47a51c,x
$1d:b2b2  29 71 ca	  and #$ca71
$1d:b2b5  d4 72		 pei ($72)
$1d:b2b7  b7 9c		 lda [$9c],y
$1d:b2b9  52 06		 eor ($06)
$1d:b2bb  76 39		 ror $39,x
$1d:b2bd  9d 4a 8b	  sta $8b4a,x
$1d:b2c0  50 53		 bvc $b315
$1d:b2c2  62 5a 09	  per $bc1f
$1d:b2c5  f3 7c		 sbc ($7c,s),y
$1d:b2c7  6b			rtl
$1d:b2c8  ad f0 ee	  lda $eef0
$1d:b2cb  4f 7b 95 e7   eor $e7957b
$1d:b2cf  48			pha
$1d:b2d0  8a			txa
$1d:b2d1  03 5c		 ora $5c,s
$1d:b2d3  ef 1c 77 73   sbc $73771c
$1d:b2d7  1b			tcs
$1d:b2d8  5c 48 02 90   jml $900248
$1d:b2dc  35 ec		 and $ec,x
$1d:b2de  f0 ce		 beq $b2ae
$1d:b2e0  3f c0 48 3d   and $3d48c0,x
$1d:b2e4  cc f2 64	  cpy $64f2
$1d:b2e7  0d 27 66	  ora $6627
$1d:b2ea  25 8e		 and $8e
$1d:b2ec  6a			ror a
$1d:b2ed  39 bb 8e	  and $8ebb,y
$1d:b2f0  6e a3 95	  ror $95a3
$1d:b2f3  d8			cld
$1d:b2f4  e5 f8		 sbc $f8
$1d:b2f6  c2 73		 rep #$73
$1d:b2f8  c8			iny
$1d:b2f9  e4 f6		 cpx $f6
$1d:b2fb  39 4e 0f	  and $0f4e,y
$1d:b2fe  83 a4		 sta $a4,s
$1d:b300  44 c0 26	  mvp $26,$c0
$1d:b303  05 40		 ora $40
$1d:b305  67 a3		 adc [$a3]
$1d:b307  9b			txy
$1d:b308  e1 88		 sbc ($88,x)
$1d:b30a  b4 81		 ldy $81,x
$1d:b30c  40			rti
$1d:b30d  0d 40 37	  ora $3740
$1d:b310  03 70		 ora $70,s
$1d:b312  07 02		 ora [$02]
$1d:b314  5b			tcd
$1d:b315  01 a8		 ora ($a8,x)
$1d:b317  bc 03 1a	  ldy $1a03,x
$1d:b31a  f3 1c		 sbc ($1c,s),y
$1d:b31c  74 70		 stz $70,x
$1d:b31e  2c 01 40	  bit $4001
$1d:b321  d5 14		 cmp $14,x
$1d:b323  c3 b9		 cmp $b9,s
$1d:b325  4f 73 80 6c   eor $6c8073
$1d:b329  cb			wai
$1d:b32a  03 dc		 ora $dc,s
$1d:b32c  0c 08 ac	  tsb $ac08
$1d:b32f  d5 03		 cmp $03,x
$1d:b331  5c c4 57 33   jml $3357c4
$1d:b335  c7 10		 cmp [$10]
$1d:b337  4b			phk
$1d:b338  8e 35 ea	  stx $ea35
$1d:b33b  11 cc		 ora ($cc),y
$1d:b33d  40			rti
$1d:b33e  0c 5e 81	  tsb $815e
$1d:b341  8f 24 91 24   sta $249124
$1d:b345  8d e0 01	  sta $01e0
$1d:b348  00 78		 brk #$78
$1d:b34a  85 80		 sta $80
$1d:b34c  20 01 00	  jsr $0001
$1d:b34f  9f 47 2d 11   sta $112d47,x
$1d:b353  cb			wai
$1d:b354  4a			lsr a
$1d:b355  6c 33 94	  jmp ($9433)
$1d:b358  ec e5 7b	  cpx $7be5
$1d:b35b  39 5f 4f	  and $4f5f,y
$1d:b35e  81 ac		 sta ($ac,x)
$1d:b360  95 23		 sta $23,x
$1d:b362  4c 11 86	  jmp $8611
$1d:b365  73 18		 adc ($18,s),y
$1d:b367  b1 01		 lda ($01),y
$1d:b369  08			php
$1d:b36a  8c 00 f8	  sty $f800
$1d:b36d  0d 20 18	  ora $1820
$1d:b370  06 bd		 asl $bd
$1d:b372  6e 39 ec	  ror $ec39
$1d:b375  e2 30		 sep #$30
$1d:b377  9e c0 8c	  stz $8cc0,x
$1d:b37a  42 a0		 wdm #$a0
$1d:b37c  25 08		 and $08
$1d:b37e  38			sec
$1d:b37f  09 80		 ora #$80
$1d:b381  4e 02 68	  lsr $6802
$1d:b384  2d ca 94	  and $94ca
$1d:b387  ee 4f 8a	  inc $8a4f
$1d:b38a  e2 58		 sep #$58
$1d:b38c  0a			asl a
$1d:b38d  f4 71 68	  pea $6871
$1d:b390  42 40		 wdm #$40
$1d:b392  c6 13		 dec $13
$1d:b394  47 33		 eor [$33]
$1d:b396  1c e5 47	  trb $47e5
$1d:b399  31 fd		 and ($fd),y
$1d:b39b  cc 41 1c	  cpy $1c41
$1d:b39e  33 98		 and ($98,s),y
$1d:b3a0  dc e1 30	  jml [$30e1]
$1d:b3a3  2b			pld
$1d:b3a4  bd cb f1	  lda $f1cb,x
$1d:b3a7  74 2b		 stz $2b,x
$1d:b3a9  8b			phb
$1d:b3aa  40			rti
$1d:b3ab  6a			ror a
$1d:b3ac  06 6e		 asl $6e
$1d:b3ae  39 9a 8e	  and $8e9a,y
$1d:b3b1  6a			ror a
$1d:b3b2  fb			xce
$1d:b3b3  96 8e		 stx $8e,y
$1d:b3b5  e5 e4		 sbc $e4
$1d:b3b7  32 2e		 and ($2e)
$1d:b3b9  c0 54		 cpy #$54
$1d:b3bb  2b			pld
$1d:b3bc  94 6b		 sty $6b,x
$1d:b3be  82 93 70	  brl $2454
$1d:b3c1  05 b9		 ora $b9
$1d:b3c3  e6 26		 inc $26
$1d:b3c5  60			rts
$1d:b3c6  5f 06 75 fe   eor $fe7506,x
$1d:b3ca  03 71		 ora $71,s
$1d:b3cc  77 01		 adc [$01],y
$1d:b3ce  88			dey
$1d:b3cf  0b			phd
$1d:b3d0  05 4d		 ora $4d
$1d:b3d2  79 8a 98	  adc $988a,y
$1d:b3d5  63 9b		 adc $9b,s
$1d:b3d7  c8			iny
$1d:b3d8  e7 32		 sbc [$32]
$1d:b3da  39 bf 27	  and $27bf,y
$1d:b3dd  81 a4		 sta ($a4,x)
$1d:b3df  6b			rtl
$1d:b3e0  f5 ca		 sbc $ca,x
$1d:b3e2  f2 9c		 sbc ($9c)
$1d:b3e4  2b			pld
$1d:b3e5  96 ca		 stx $ca,y
$1d:b3e7  e5 bc		 sbc $bc
$1d:b3e9  c2 42		 rep #$42
$1d:b3eb  75 ba		 adc $ba,x
$1d:b3ed  77 27		 adc [$27],y
$1d:b3ef  f1 cb		 sbc ($cb),y
$1d:b3f1  c6 70		 dec $70
$1d:b3f3  e4 3d		 cpx $3d
$1d:b3f5  cd e6 73	  cmp $73e6
$1d:b3f8  98			tya
$1d:b3f9  79 01 c8	  adc $c801,y
$1d:b3fc  47 2b		 eor [$2b]
$1d:b3fe  99 cb 61	  sta $61cb,y
$1d:b401  fc 23 86	  jsr ($8623,x)
$1d:b404  01 3f		 ora ($3f,x)
$1d:b406  82 1c a3	  brl $5725
$1d:b409  80 60		 bra $b46b
$1d:b40b  c7 bf		 cmp [$bf]
$1d:b40d  42 39		 wdm #$39
$1d:b40f  cb			wai
$1d:b410  ee 4f 09	  inc $094f
$1d:b413  27 3c		 and [$3c]
$1d:b415  43 8b		 eor $8b,s
$1d:b417  50 8d		 bvc $b3a6
$1d:b419  c0 28		 cpy #$28
$1d:b41b  21 40		 and ($40,x)
$1d:b41d  bc c6 fa	  ldy $fac6,x
$1d:b420  47 23		 eor [$23]
$1d:b422  a8			tay
$1d:b423  37 44		 and [$44],y
$1d:b425  ec 01 a0	  cpx $a001
$1d:b428  c7 57		 cmp [$57]
$1d:b42a  35 bd		 and $bd,x
$1d:b42c  c6 10		 dec $10
$1d:b42e  6b			rtl
$1d:b42f  86 a2		 stx $a2
$1d:b431  9a			txs
$1d:b432  07 60		 ora [$60]
$1d:b434  02 81		 cop #$81
$1d:b436  8c 1a d6	  sty $d61a
$1d:b439  88			dey
$1d:b43a  3d c0 4a	  and $4ac0,x
$1d:b43d  64 80		 stz $80
$1d:b43f  af e7 0e 01   lda $010ee7
$1d:b443  3f 6f 85 72   and $72856f,x
$1d:b447  7e 6f 0e	  ror $0e6f,x
$1d:b44a  e4 f9		 cpx $f9
$1d:b44c  d2 21		 cmp ($21)
$1d:b44e  e0 a6		 cpx #$a6
$1d:b450  99 c6 da	  sta $dac6,y
$1d:b453  83 14		 sta $14,s
$1d:b455  d0 26		 bne $b47d
$1d:b457  01 64		 ora ($64,x)
$1d:b459  04 20		 tsb $20
$1d:b45b  d7 77		 cmp [$77],y
$1d:b45d  33 9d		 and ($9d,s),y
$1d:b45f  ce 70 dc	  dec $dc70
$1d:b462  08			php
$1d:b463  a0 cd		 ldy #$cd
$1d:b465  00 48		 brk #$48
$1d:b467  a6 81		 ldx $81
$1d:b469  20 59 84	  jsr $8459
$1d:b46c  98			tya
$1d:b46d  0b			phd
$1d:b46e  c8			iny
$1d:b46f  ae 51 ca	  ldx $ca51
$1d:b472  66 70		 ror $70
$1d:b474  3c 08 40	  bit $4008,x
$1d:b477  a6 20		 ldx $20
$1d:b479  c9 06		 cmp #$06
$1d:b47b  26 c0		 rol $c0
$1d:b47d  4e 03 c0	  lsr $c003
$1d:b480  09 01		 ora #$01
$1d:b482  7f 7e 8b a8   adc $a88b7e,x
$1d:b486  2b			pld
$1d:b487  cf d1 2e 09   cmp $092ed1
$1d:b48b  04 56		 tsb $56
$1d:b48d  80 7e		 bra $b50d
$1d:b48f  0d 7f 73	  ora $737f
$1d:b492  7d 1c cf	  adc $cf1c,x
$1d:b495  23 c0		 and $c0,s
$1d:b497  9e 5d cc	  stz $cc5d,x
$1d:b49a  6a			ror a
$1d:b49b  9c 05 a2	  stz $a205
$1d:b49e  f0 16		 beq $b4b6
$1d:b4a0  e8			inx
$1d:b4a1  3d c6 dc	  and $dcc6,x
$1d:b4a4  63 00		 adc $00,s
$1d:b4a6  e8			inx
$1d:b4a7  83 81		 sta $81,s
$1d:b4a9  04 0b		 tsb $0b
$1d:b4ab  40			rti
$1d:b4ac  b3 9b		 lda ($9b,s),y
$1d:b4ae  d6 02		 dec $02,x
$1d:b4b0  77 18		 adc [$18],y
$1d:b4b2  84 72		 sty $72
$1d:b4b4  22 6f 3d 34   jsl $343d6f
$1d:b4b8  73 4f		 adc ($4f,s),y
$1d:b4ba  1c bb 47	  trb $47bb
$1d:b4bd  2e f1 cd	  rol $cdf1
$1d:b4c0  44 73 52	  mvp $52,$73
$1d:b4c3  4d 1e 74	  eor $741e
$1d:b4c6  73 38		 adc ($38,s),y
$1d:b4c8  cf 11 40 5b   cmp $5b4011
$1d:b4cc  fb			xce
$1d:b4cd  82 a2 1e	  brl $d372
$1d:b4d0  04 f1		 tsb $f1
$1d:b4d2  da			phx
$1d:b4d3  2f e0 13 00   and $0013e0
$1d:b4d7  c8			iny
$1d:b4d8  4a			lsr a
$1d:b4d9  e2 70		 sep #$70
$1d:b4db  2c 34 73	  bit $7334
$1d:b4de  0e 81 1d	  asl $1d81
$1d:b4e1  aa			tax
$1d:b4e2  04 78		 tsb $78
$1d:b4e4  b1 cd		 lda ($cd),y
$1d:b4e6  b4 73		 ldy $73,x
$1d:b4e8  6f 1c e3 47   adc $47e31c
$1d:b4ec  38			sec
$1d:b4ed  f1 cd		 sbc ($cd),y
$1d:b4ef  c4 73		 cpy $73
$1d:b4f1  73 1c		 adc ($1c,s),y
$1d:b4f3  e4 47		 cpx $47
$1d:b4f5  39 26 f6	  and $f626,y
$1d:b4f8  17 a3		 ora [$a3],y
$1d:b4fa  c4 4c		 cpy $4c
$1d:b4fc  80 0e		 bra $b50c
$1d:b4fe  00 70		 brk #$70
$1d:b500  5f 8c 23 3d   eor $3d238c,x
$1d:b504  30 88		 bmi $b48e
$1d:b506  f0 32		 beq $b53a
$1d:b508  d1 cc		 cmp ($cc),y
$1d:b50a  bc 73 83	  ldy $8373,x
$1d:b50d  1c c2 c7	  trb $c7c2
$1d:b510  3a			dec a
$1d:b511  91 ce		 sta ($ce),y
$1d:b513  ac 73 c9	  ldy $c973
$1d:b516  1c f2 c7	  trb $c7f2
$1d:b519  3a			dec a
$1d:b51a  d1 ce		 cmp ($ce),y
$1d:b51c  bc 73 cd	  ldy $cd73,x
$1d:b51f  1c f3 c7	  trb $c7f3
$1d:b522  3b			tsc
$1d:b523  11 ce		 ora ($ce),y
$1d:b525  cc 73 d1	  cpy $d173
$1d:b528  1c f4 c0	  trb $c0f4
$1d:b52b  01 fa		 ora ($fa,x)
$1d:b52d  81 1d		 sta ($1d,x)
$1d:b52f  94 73		 sty $73,x
$1d:b531  61 1c		 adc ($1c,x)
$1d:b533  e1 47		 sbc ($47,x)
$1d:b535  36 71		 rol $71,x
$1d:b537  cd a4 73	  cmp $73a4
$1d:b53a  87 1c		 sta [$1c]
$1d:b53c  e2 20		 sep #$20
$1d:b53e  47 e6		 eor [$e6]
$1d:b540  81 1e		 sta ($1e,x)
$1d:b542  d4 73		 pei ($73)
$1d:b544  e9 1c		 sbc #$1c
$1d:b546  fa			plx
$1d:b547  c7 3b		 cmp [$3b]
$1d:b549  71 ce		 adc ($ce),y
$1d:b54b  e4 73		 cpx $73
$1d:b54d  ed 1c fb	  sbc $fb1c
$1d:b550  c7 3b		 cmp [$3b]
$1d:b552  b1 ce		 lda ($ce),y
$1d:b554  f4 73 f1	  pea $f173
$1d:b557  1c fc c7	  trb $c7fc
$1d:b55a  3b			tsc
$1d:b55b  e8			inx
$1d:b55c  10 07		 bpl $b565
$1d:b55e  ff 02 39 94   sbc $943902,x
$1d:b562  8e 6c 63	  stx $636c
$1d:b565  9a			txs
$1d:b566  48			pha
$1d:b567  e6 54		 inc $54
$1d:b569  5e 3a 51	  lsr $513a,x
$1d:b56c  78			sei
$1d:b56d  a0 83		 ldy #$83
$1d:b56f  d5 1c		 cmp $1c,x
$1d:b571  fd 47 3f	  sbc $3f47,x
$1d:b574  71 cf		 adc ($cf),y
$1d:b576  5c 73 d9 1c   jml $1cd973
$1d:b57a  fe 47 3f	  inc $3f47,x
$1d:b57d  b1 cf		 lda ($cf),y
$1d:b57f  6c 73 dd	  jmp ($dd73)
$1d:b582  1c ff 47	  trb $47ff
$1d:b585  3f f1 cf 79   and $79cff1,x
$1d:b589  b4 c9		 ldy $c9,x
$1d:b58b  de 4f fe	  dec $fe4f,x
$1d:b58e  84 73		 sty $73
$1d:b590  a3 1c		 lda $1c,s
$1d:b592  f0 47		 beq $b5db
$1d:b594  3c 31 ce	  bit $ce31,x
$1d:b597  94 73		 sty $73,x
$1d:b599  a7 1c		 lda [$1c]
$1d:b59b  f1 47		 sbc ($47),y
$1d:b59d  3c 71 cb	  bit $cb71,x
$1d:b5a0  aa			tax
$1d:b5a1  27 da		 and [$da]
$1d:b5a3  3e 13 bf	  rol $bf13,x
$1d:b5a6  84 73		 sty $73
$1d:b5a8  e2 6d		 sep #$6d
$1d:b5aa  3f 93 07 c1   and $c10793,x
$1d:b5ae  3e 1a f1	  rol $f11a,x
$1d:b5b1  5f 8f 3c 9b   eor $9b3c8f,x
$1d:b5b5  e5 ef		 sbc $ef
$1d:b5b7  37 fa		 and [$fa],y
$1d:b5b9  03 d2		 ora $d2,s
$1d:b5bb  3e a2 f5	  rol $f5a2,x
$1d:b5be  9f b1 3d ab   sta $ab3db1,x
$1d:b5c2  ee 6f 7b	  inc $7b6f
$1d:b5c5  f8			sed
$1d:b5c6  23 c3		 and $c3,s
$1d:b5c8  3e 2a f1	  rol $f12a,x
$1d:b5cb  df 93 3c bb   cmp $bb3c93,x
$1d:b5cf  e6 ef		 inc $ef
$1d:b5d1  3f fa 43 d4   and $d443fa,x
$1d:b5d5  3e b2 f6	  rol $f6b2,x
$1d:b5d8  1f b5 3d ca   ora $ca3db5,x
$1d:b5dc  e0 02		 cpx #$02
$1d:b5de  07 00		 ora [$00]
$1d:b5e0  0e c8 64	  asl $64c8
$1d:b5e3  37 3a		 and [$3a],y
$1d:b5e5  0c ce 85	  tsb $85ce
$1d:b5e8  e6 19		 inc $19
$1d:b5ea  8c c3 cc	  sty $ccc3
$1d:b5ed  34 19		 bit $19,x
$1d:b5ef  87 a0		 sta [$a0]
$1d:b5f1  62 31 1b	  per $d125
$1d:b5f4  17 e0		 ora [$e0],y
$1d:b5f6  7e 1e 81	  ror $811e,x
$1d:b5f9  a0 d0		 ldy #$d0
$1d:b5fb  3d 03 30	  and $3003,x
$1d:b5fe  f2 17		 sbc ($17)
$1d:b600  79 fd de	  adc $defd,y
$1d:b603  b5 bc		 lda $bc,x
$1d:b605  d9 e8 7d	  cmp $7de8,y
$1d:b608  e0 5a		 cpx #$5a
$1d:b60a  f6 7b		 inc $7b,x
$1d:b60c  78			sei
$1d:b60d  5b			tcd
$1d:b60e  de 16 eb	  dec $eb16,x
$1d:b611  66 f8		 ror $f8
$1d:b613  71 88		 adc ($88),y
$1d:b615  10 8b		 bpl $b5a2
$1d:b617  ca			dex
$1d:b618  28			plp
$1d:b619  92 19		 sta ($19)
$1d:b61b  be 1b 22	  ldx $221b,y
$1d:b61e  41 cc		 eor ($cc,x)
$1d:b620  4e 27 3d	  lsr $3d27
$1d:b623  6e 39 16	  ror $1639
$1d:b626  5f 50 f9 4c   eor $4cf950,x
$1d:b62a  8e 44 e2	  stx $e244
$1d:b62d  87 60		 sta [$60]
$1d:b62f  d4 ec		 pei ($ec)
$1d:b631  b5 06		 lda $06,x
$1d:b633  c9 39		 cmp #$39
$1d:b635  16 7c		 asl $7c,x
$1d:b637  f9 49 82	  sbc $8249,y
$1d:b63a  46 7a		 lsr $7a
$1d:b63c  77 f4		 adc [$f4],y
$1d:b63e  38			sec
$1d:b63f  c5 84		 cmp $84
$1d:b641  9d c0 ba	  sta $bac0,x
$1d:b644  59 e5 93	  eor $93e5,y
$1d:b647  9d 83 65	  sta $6583,x
$1d:b64a  a9 d0		 lda #$d0
$1d:b64c  e6 b4		 inc $b4
$1d:b64e  42 50		 wdm #$50
$1d:b650  77 83		 adc [$83],y
$1d:b652  c0 f3		 cpy #$f3
$1d:b654  3b			tsc
$1d:b655  8c 9e 4f	  sty $4f9e
$1d:b658  33 a2		 and ($a2,s),y
$1d:b65a  cd 3e 47	  cmp $473e
$1d:b65d  44 00 3d	  mvp $3d,$00
$1d:b660  0e c3 17	  asl $17c3
$1d:b663  8b			phb
$1d:b664  77 f8		 adc [$f8],y
$1d:b666  01 76		 ora ($76,x)
$1d:b668  9c 2d d0	  stz $d02d
$1d:b66b  a0 37		 ldy #$37
$1d:b66d  60			rts
$1d:b66e  d7 da		 cmp [$da],y
$1d:b670  18			clc
$1d:b671  91 fa		 sta ($fa),y
$1d:b673  e6 12		 inc $12
$1d:b675  fe 99 80	  inc $8099,x
$1d:b678  1a			inc a
$1d:b679  e4 62		 cpx $62
$1d:b67b  1d 70 e8	  ora $e870,x
$1d:b67e  72 40		 adc ($40)
$1d:b680  e5 d5		 sbc $d5
$1d:b682  5b			tcd
$1d:b683  8e c7 9f	  stx $9fc7
$1d:b686  c5 62		 cmp $62
$1d:b688  9f e1 aa 76   sta $76aae1,x
$1d:b68c  86 c8		 stx $c8
$1d:b68e  ec 87 b0	  cpx $b087
$1d:b691  c9 64		 cmp #$64
$1d:b693  81 e0		 sta ($e0,x)
$1d:b695  e1 93		 sbc ($93,x)
$1d:b697  e1 a4		 sbc ($a4,x)
$1d:b699  69 1b		 adc #$1b
$1d:b69b  e9 ef		 sbc #$ef
$1d:b69d  3a			dec a
$1d:b69e  31 dd		 and ($dd),y
$1d:b6a0  71 a8		 adc ($a8),y
$1d:b6a2  46 53		 lsr $53
$1d:b6a4  ae 2f 21	  ldx $212f
$1d:b6a7  8c 58 c9	  sty $c958
$1d:b6aa  d8			cld
$1d:b6ab  71 18		 adc ($18),y
$1d:b6ad  82 b2 15	  brl $cc62
$1d:b6b0  c3 b8		 cmp $b8,s
$1d:b6b2  09 3c		 ora #$3c
$1d:b6b4  86 40		 stx $40
$1d:b6b6  02 be		 cop #$be
$1d:b6b8  4e 74 4c	  lsr $4c74
$1d:b6bb  34 4f		 bit $4f,x
$1d:b6bd  f5 04		 sbc $04,x
$1d:b6bf  87 77		 sta [$77]
$1d:b6c1  8f c8 15 10   sta $1015c8
$1d:b6c5  3d 03 05	  and $0503,x
$1d:b6c8  26 e4		 rol $e4
$1d:b6ca  6d a2 11	  adc $11a2
$1d:b6cd  18			clc
$1d:b6ce  83 fd		 sta $fd,s
$1d:b6d0  3c 82 93	  bit $9382,x
$1d:b6d3  92 6f		 sta ($6f)
$1d:b6d5  b7 fb		 lda [$fb],y
$1d:b6d7  e1 7a		 sbc ($7a,x)
$1d:b6d9  8a			txa
$1d:b6da  43 6c		 eor $6c,s
$1d:b6dc  3d 08 b8	  and $b808,x
$1d:b6df  4c 47 ef	  jmp $ef47
$1d:b6e2  24 26		 bit $26
$1d:b6e4  87 7c		 sta [$7c]
$1d:b6e6  26 24		 rol $24
$1d:b6e8  f7 e3		 sbc [$e3],y
$1d:b6ea  00 90		 brk #$90
$1d:b6ec  7e e7 80	  ror $80e7,x
$1d:b6ef  fe 84 c8	  inc $c884,x
$1d:b6f2  df 00 91 2e   cmp $2e9100,x
$1d:b6f6  54 9c 34	  mvn $34,$9c
$1d:b6f9  3c f3 6c	  bit $6cf3,x
$1d:b6fc  8a			txa
$1d:b6fd  8a			txa
$1d:b6fe  34 5d		 bit $5d,x
$1d:b700  7e b0 f4	  ror $f4b0,x
$1d:b703  18			clc
$1d:b704  e2 5b		 sep #$5b
$1d:b706  1c 48 41	  trb $4148
$1d:b709  3b			tsc
$1d:b70a  c4 d0		 cpy $d0
$1d:b70c  6b			rtl
$1d:b70d  89 ac		 bit #$ac
$1d:b70f  72 39		 adc ($39)
$1d:b711  10 0b		 bpl $b71e
$1d:b713  00 92		 brk #$92
$1d:b715  dc ef ac	  jml [$acef]
$1d:b718  fe 37 26	  inc $2637,x
$1d:b71b  99 14 d1	  sta $d114,y
$1d:b71e  9e 8f cb	  stz $cb8f,x
$1d:b721  8b			phb
$1d:b722  c5 aa		 cmp $aa
$1d:b724  45 54		 eor $54
$1d:b726  60			rts
$1d:b727  74 c9		 stz $c9,x
$1d:b729  e4 d6		 cpx $d6
$1d:b72b  e6 98		 inc $98
$1d:b72d  10 3b		 bpl $b76a
$1d:b72f  31 c7		 and ($c7),y
$1d:b731  6e a7 20	  ror $20a7
$1d:b734  a1 87		 lda ($87,x)
$1d:b736  05 ae		 ora $ae
$1d:b738  32 51		 and ($51)
$1d:b73a  01 82		 ora ($82,x)
$1d:b73c  15 46		 ora $46,x
$1d:b73e  31 66		 and ($66),y
$1d:b740  48			pha
$1d:b741  0c 80 8e	  tsb $8e80
$1d:b744  81 d0		 sta ($d0,x)
$1d:b746  69 a1		 adc #$a1
$1d:b748  08			php
$1d:b749  08			php
$1d:b74a  f0 82		 beq $b6ce
$1d:b74c  62 cb fb	  per $b31a
$1d:b74f  7f a7 47 26   adc $2647a7,x
$1d:b753  90 04		 bcc $b759
$1d:b755  7b			tdc
$1d:b756  a7 59		 lda [$59]
$1d:b758  f2 73		 sbc ($73)
$1d:b75a  81 e3		 sta ($e3,x)
$1d:b75c  26 23		 rol $23
$1d:b75e  47 92		 eor [$92]
$1d:b760  24 1f		 bit $1f
$1d:b762  44 c3 c5	  mvp $c5,$c3
$1d:b765  86 00		 stx $00
$1d:b767  c2 1e		 rep #$1e
$1d:b769  b9 21 fb	  lda $fb21,y
$1d:b76c  c4 00		 cpy $00
$1d:b76e  69 0f		 adc #$0f
$1d:b770  7c 30 98	  jmp ($9830,x)
$1d:b773  a0 23 05	  ldy #$0523
$1d:b776  d3 25		 cmp ($25,s),y
$1d:b778  92 c4		 sta ($c4)
$1d:b77a  e2 7d		 sep #$7d
$1d:b77c  8d fb c8	  sta $c8fb
$1d:b77f  e4 5e		 cpx $5e
$1d:b781  39 8c c4	  and $c48c,y
$1d:b784  eb			xba
$1d:b785  92 22		 sta ($22)
$1d:b787  12 8c		 ora ($8c)
$1d:b789  40			rti
$1d:b78a  d0 44		 bne $b7d0
$1d:b78c  35 90		 and $90,x
$1d:b78e  e8			inx
$1d:b78f  2c 8c 62	  bit $628c
$1d:b792  f8			sed
$1d:b793  8d b3 08	  sta $08b3
$1d:b796  c8			iny
$1d:b797  4f 90 c6 34   eor $34c690
$1d:b79b  8c a4 f8	  sty $f8a4
$1d:b79e  8c 43 c7	  sty $c743
$1d:b7a1  32 19		 and ($19)
$1d:b7a3  07 88		 ora [$88]
$1d:b7a5  24 45		 bit $45
$1d:b7a7  70 27		 bvs $b7d0
$1d:b7a9  34 2f		 bit $2f,x
$1d:b7ab  8a			txa
$1d:b7ac  80 b9		 bra $b767
$1d:b7ae  e9 f3		 sbc #$f3
$1d:b7b0  43 01		 eor $01,s
$1d:b7b2  b8			clv
$1d:b7b3  bc 9c 75	  ldy $759c,x
$1d:b7b6  a9 24		 lda #$24
$1d:b7b8  90 fc		 bcc $b7b6
$1d:b7ba  00 00		 brk #$00
$1d:b7bc  49 5b		 eor #$5b
$1d:b7be  bc 33 d6	  ldy $d633,x
$1d:b7c1  f8			sed
$1d:b7c2  b7 43		 lda [$43],y
$1d:b7c4  a3 17		 lda $17,s
$1d:b7c6  b7 2c		 lda [$2c],y
$1d:b7c8  92 dc		 sta ($dc)
$1d:b7ca  ff 05 88 d7   sbc $d78805,x
$1d:b7ce  2c 8b 62	  bit $628b
$1d:b7d1  62 15 b9	  per $70e9
$1d:b7d4  5e 6c 49	  lsr $496c,x
$1d:b7d7  5f f1 8a fc   eor $fc8af1,x
$1d:b7db  b8			clv
$1d:b7dc  ac 57 f5	  ldy $f557
$1d:b7df  e1 79		 sbc ($79,x)
$1d:b7e1  2c 91 cc	  bit $cc91
$1d:b7e4  41 f1		 eor ($f1,x)
$1d:b7e6  af c5 63 51   lda $5163c5
$1d:b7ea  40			rti
$1d:b7eb  1f a9 36 2d   ora $2d36a9,x
$1d:b7ef  54 02 fa	  mvn $fa,$02
$1d:b7f2  e8			inx
$1d:b7f3  e4 e2		 cpx $e2
$1d:b7f5  11 11		 ora ($11),y
$1d:b7f7  fd 6d f1	  sbc $f16d,x
$1d:b7fa  7b			tdc
$1d:b7fb  ed f9 3e	  sbc $3ef9
$1d:b7fe  b1 b9		 lda ($b9),y
$1d:b800  37 7e		 and [$7e],y
$1d:b802  62 f1 60	  per $18f6
$1d:b805  90 07		 bcc $b80e
$1d:b807  88			dey
$1d:b808  24 4e		 bit $4e
$1d:b80a  27 e5		 and [$e5]
$1d:b80c  c9 97		 cmp #$97
$1d:b80e  83 c9		 sta $c9,s
$1d:b810  ce 0f 87	  dec $870f
$1d:b813  3c fe a6	  bit $a6fe,x
$1d:b816  c2 51		 rep #$51
$1d:b818  51 f0		 eor ($f0),y
$1d:b81a  d2 35		 cmp ($35)
$1d:b81c  92 c5		 sta ($c5)
$1d:b81e  b9 c7 a1	  lda $a1c7,y
$1d:b821  d1 73		 cmp ($73),y
$1d:b823  12 c8		 ora ($c8)
$1d:b825  b3 ef		 lda ($ef,s),y
$1d:b827  d0 73		 bne $b89c
$1d:b829  ab			plb
$1d:b82a  a1 33		 lda ($33,x)
$1d:b82c  e0 d0 5f	  cpx #$5fd0
$1d:b82f  e2 f7		 sep #$f7
$1d:b831  f2 58		 sbc ($58)
$1d:b833  9c 4e 79	  stz $794e
$1d:b836  81 56		 sta ($56,x)
$1d:b838  ec 8e 45	  cpx $458e
$1d:b83b  e3 98		 sbc $98,s
$1d:b83d  c7 86		 cmp [$86]
$1d:b83f  e2 00		 sep #$00
$1d:b841  1b			tcs
$1d:b842  90 c6		 bcc $b80a
$1d:b844  04 77		 tsb $77
$1d:b846  10 21		 bpl $b869
$1d:b848  dc 80 47	  jml [$4780]
$1d:b84b  de 56 ef	  dec $ef56,x
$1d:b84e  f3 07		 sbc ($07,s),y
$1d:b850  9c 7d 05	  stz $057d
$1d:b853  e9 3f		 sbc #$3f
$1d:b855  52 48		 eor ($48)
$1d:b857  3f c4 1a b7   and $b71ac4,x
$1d:b85b  55 92		 eor $92,x
$1d:b85d  67 f1		 adc [$f1]
$1d:b85f  58			cli
$1d:b860  a7 7e		 lda [$7e]
$1d:b862  64 b2		 stz $b2
$1d:b864  4e fd c6	  lsr $c6fd
$1d:b867  bf f7 16 ef   lda $ef16f7,x
$1d:b86b  cc 6e 4d	  cpy $4d6e
$1d:b86e  df 98 b1 76   cmp $76b198,x
$1d:b872  e4 c7		 cpx $c7
$1d:b874  da			phx
$1d:b875  2d 0f eb	  and $eb0f
$1d:b878  c3 c0		 cmp $c0,s
$1d:b87a  3e 72 f4	  rol $f472,x
$1d:b87d  1f a5 3d 4b   ora $4b3da5,x
$1d:b881  e1 6f		 sbc ($6f,x)
$1d:b883  6b			rtl
$1d:b884  a0 b4		 ldy #$b4
$1d:b886  32 18		 and ($18)
$1d:b888  cc f2 c2	  cpy $c2f2
$1d:b88b  ad d8 8c	  lda $8cd8
$1d:b88e  43 c4		 eor $c4,s
$1d:b890  7a			ply
$1d:b891  5d 36 a1	  eor $a136,x
$1d:b894  01 0a		 ora ($0a,x)
$1d:b896  dd 90 c8	  cmp $c890,x
$1d:b899  7b			tdc
$1d:b89a  3c 9c 7e	  bit $7e9c,x
$1d:b89d  47 23		 eor [$23]
$1d:b89f  8d ed 09	  sta $09ed
$1d:b8a2  27 b5		 and [$b5]
$1d:b8a4  fe 01 1c	  inc $1c01,x
$1d:b8a7  c4 84		 cpy $84
$1d:b8a9  37 23		 and [$23],y
$1d:b8ab  91 fe		 sta ($fe),y
$1d:b8ad  84 ab		 sty $ab
$1d:b8af  fb			xce
$1d:b8b0  8c c4 eb	  sty $ebc4
$1d:b8b3  bb			tyx
$1d:b8b4  a1 32		 lda ($32,x)
$1d:b8b6  ee 14 93	  inc $9314
$1d:b8b9  b9 88 93	  lda $9388,y
$1d:b8bc  c4 e2		 cpy $e2
$1d:b8be  72 60		 adc ($60)
$1d:b8c0  a0 18		 ldy #$18
$1d:b8c2  1d de 01	  ora $01de,x
$1d:b8c5  40			rti
$1d:b8c6  38			sec
$1d:b8c7  d3 fc		 cmp ($fc,s),y
$1d:b8c9  0e 38 0f	  asl $0f38
$1d:b8cc  08			php
$1d:b8cd  84 45		 sty $45
$1d:b8cf  23 1b		 and $1b,s
$1d:b8d1  73 f0		 adc ($f0,s),y
$1d:b8d3  ef b7 ea 18   sbc $18eab7
$1d:b8d7  92 a3		 sta ($a3)
$1d:b8d9  87 d8		 sta [$d8]
$1d:b8db  1d 05 93	  ora $9305,x
$1d:b8de  04 84		 tsb $84
$1d:b8e0  3e 2b 2b	  rol $2b2b,x
$1d:b8e3  57 fe		 eor [$fe],y
$1d:b8e5  47 3c		 eor [$3c]
$1d:b8e7  fd 07 13	  sbc $1307,x
$1d:b8ea  00 83		 brk #$83
$1d:b8ec  a0 07		 ldy #$07
$1d:b8ee  1a			inc a
$1d:b8ef  e5 90		 sbc $90
$1d:b8f1  0c 4f 22	  tsb $224f
$1d:b8f4  cf e3 72 6e   cmp $6e72e3
$1d:b8f8  b1 e9		 lda ($e9),y
$1d:b8fa  74 de		 stz $de,x
$1d:b8fc  84 02		 sty $02
$1d:b8fe  2c fe 2f	  bit $2ffe
$1d:b901  16 47		 asl $47,x
$1d:b903  52 42		 eor ($42)
$1d:b905  79 72 79	  adc $7972,y
$1d:b908  30 7e		 bmi $b988
$1d:b90a  03 7f		 ora $7f,s
$1d:b90c  14 0f		 trb $0f
$1d:b90e  cc 96 4b	  cpy $4b96
$1d:b911  b9 dd 08	  lda $08dd,y
$1d:b914  91 3d		 sta ($3d),y
$1d:b916  3f ba fc 56   and $56fcba,x
$1d:b91a  36 27		 rol $27,x
$1d:b91c  13 93		 ora ($93,s),y
$1d:b91e  23 42		 and $42,s
$1d:b920  4e 5f 7c	  lsr $7c5f
$1d:b923  5a			phy
$1d:b924  07 1f		 ora [$1f]
$1d:b926  a0 6f		 ldy #$6f
$1d:b928  c1 68		 cmp ($68,x)
$1d:b92a  72 36		 adc ($36)
$1d:b92c  d1 08		 cmp ($08),y
$1d:b92e  8a			txa
$1d:b92f  46 0f		 lsr $0f
$1d:b931  a3 24		 lda $24,s
$1d:b933  df 6f d4 2d   cmp $2dd46f,x
$1d:b937  18			clc
$1d:b938  df a3 44 28   cmp $2844a3,x
$1d:b93c  0d 28 0e	  ora $0e28
$1d:b93f  0a			asl a
$1d:b940  bf 15 bf 93   lda $93bf15,x
$1d:b944  e8			inx
$1d:b945  be 81 c3	  ldx $c381,y
$1d:b948  19 fc 96	  ora $96fc,y
$1d:b94b  2f 13 89 cf   and $cf8913
$1d:b94f  38			sec
$1d:b950  62 df 16	  per $d032
$1d:b953  ae 64 72	  ldx $7264
$1d:b956  2f 1b e9 3b   and $3be91b
$1d:b95a  f6 20		 inc $20,x
$1d:b95c  ff bb 74 7a   sbc $7a74bb,x
$1d:b960  30 ef		 bmi $b951
$1d:b962  b7 20		 lda [$20],y
$1d:b964  87 f1		 sta [$f1]
$1d:b966  c8			iny
$1d:b967  18			clc
$1d:b968  c1 85		 cmp ($85,x)
$1d:b96a  e5 b2		 sbc $b2
$1d:b96c  d8			cld
$1d:b96d  80 05		 bra $b974
$1d:b96f  c5 22		 cmp $22
$1d:b971  79 0c 60	  adc $600c,y
$1d:b974  07 31		 ora [$31]
$1d:b976  18			clc
$1d:b977  8f 63 46 3c   sta $3c4663
$1d:b97b  9c 7e 46	  stz $467e
$1d:b97e  27 20		 and [$20]
$1d:b980  81 4f		 sta ($4f,x)
$1d:b982  ea			nop
$1d:b983  21 5f		 and ($5f,x)
$1d:b985  e0 81		 cpx #$81
$1d:b987  c2 78		 rep #$78
$1d:b989  6b			rtl
$1d:b98a  bb			tyx
$1d:b98b  8b			phb
$1d:b98c  27 ee		 and [$ee]
$1d:b98e  a7 46		 lda [$46]
$1d:b990  4f 13 60 cc   eor $cc6013
$1d:b994  99 5c 1d	  sta $1d5c,y
$1d:b997  1e 43 46	  asl $4643,x
$1d:b99a  f2 2d		 sbc ($2d)
$1d:b99c  0d b2 45	  ora $45b2
$1d:b99f  ca			dex
$1d:b9a0  53 9f		 eor ($9f,s),y
$1d:b9a2  c5 62		 cmp $62
$1d:b9a4  ba			tsx
$1d:b9a5  6f 0b c9 64   adc $64c90b
$1d:b9a9  a2 2f 0d	  ldx #$0d2f
$1d:b9ac  8c c7 c0	  sty $c0c7
$1d:b9af  38			sec
$1d:b9b0  42 b7		 wdm #$b7
$1d:b9b2  e0 8b f0	  cpx #$f08b
$1d:b9b5  1a			inc a
$1d:b9b6  19 61 86	  ora $8661,y
$1d:b9b9  63 62		 adc $62,s
$1d:b9bb  71 50		 adc ($50),y
$1d:b9bd  0d e2 df	  ora $dfe2
$1d:b9c0  f9 8d c9	  sbc $c98d,y
$1d:b9c3  f2 38		 sbc ($38)
$1d:b9c5  ca			dex
$1d:b9c6  28			plp
$1d:b9c7  f6 f9		 inc $f9,x
$1d:b9c9  71 78		 adc ($78),y
$1d:b9cb  b3 fe		 lda ($fe,s),y
$1d:b9cd  64 f1		 stz $f1
$1d:b9cf  47 f4		 eor [$f4]
$1d:b9d1  5b			tcd
$1d:b9d2  02 8c		 cop #$8c
$1d:b9d4  fc a0 d0	  jsr ($d0a0,x)
$1d:b9d7  3f 82 94 3b   and $3b9482,x
$1d:b9db  9d de 74	  sta $74de,x
$1d:b9de  4f 9e b4 2d   eor $2db49e
$1d:b9e2  79 74 39	  adc $3974,y
$1d:b9e5  12 78		 ora ($78)
$1d:b9e7  9b			txy
$1d:b9e8  04 64		 tsb $64
$1d:b9ea  dc 8f 57	  jml [$578f]
$1d:b9ed  cf c4 bf 19   cmp $19bfc4
$1d:b9f1  32 38		 and ($38)
$1d:b9f3  1c 2b ea	  trb $ea2b
$1d:b9f6  fb			xce
$1d:b9f7  b2 41		 lda ($41)
$1d:b9f9  d8			cld
$1d:b9fa  1d 1c 6f	  ora $6f1c,x
$1d:b9fd  21 be		 and ($be,x)
$1d:b9ff  b2 7f		 lda ($7f)
$1d:ba01  b3 14		 lda ($14,s),y
$1d:ba03  1b			tcs
$1d:ba04  e1 d1		 sbc ($d1,x)
$1d:ba06  c5 a1		 cmp $a1
$1d:ba08  0f b9 fd 80   ora $80fdb9
$1d:ba0c  3d 9b 9e	  and $9e9b,x
$1d:ba0f  84 1f		 sty $1f
$1d:ba11  27 39		 and [$39]
$1d:ba13  ec f0 04	  cpx $04f0
$1d:ba16  81 79		 sta ($79,x)
$1d:ba18  38			sec
$1d:ba19  e0 58 8b	  cpx #$8b58
$1d:ba1c  80 0a		 bra $ba28
$1d:ba1e  2c 05 8e	  bit $8e05
$1d:ba21  fa			plx
$1d:ba22  10 bb		 bpl $b9df
$1d:ba24  c0 58 1f	  cpy #$1f58
$1d:ba27  76 23		 ror $23,x
$1d:ba29  d8			cld
$1d:ba2a  23 08		 and $08,s
$1d:ba2c  84 46		 sty $46
$1d:ba2e  2e f6 7c	  rol $7cf6
$1d:ba31  87 b0		 sta [$b0]
$1d:ba33  66 1b		 ror $1b
$1d:ba35  ed ff 7d	  sbc $7dff
$1d:ba38  ec f9 1f	  cpx $1ff9
$1d:ba3b  fa			plx
$1d:ba3c  10 de		 bpl $ba1c
$1d:ba3e  cf 89 30 02   cmp $023089
$1d:ba42  c4 7b		 cpy $7b
$1d:ba44  86 68		 stx $68
$1d:ba46  28			plp
$1d:ba47  02 d4		 cop #$d4
$1d:ba49  18			clc
$1d:ba4a  60			rts
$1d:ba4b  f6 7c		 inc $7c,x
$1d:ba4d  61 40		 adc ($40,x)
$1d:ba4f  38			sec
$1d:ba50  ed f1 23	  sbc $23f1
$1d:ba53  52 8a		 eor ($8a)
$1d:ba55  cb			wai
$1d:ba56  e0 51 08	  cpx #$0851
$1d:ba59  89 4c 08	  bit #$084c
$1d:ba5c  d2 33		 cmp ($33)
$1d:ba5e  0d f9 8c	  ora $8cf9
$1d:ba61  07 de		 ora [$de]
$1d:ba63  e6 f7		 inc $f7
$1d:ba65  bf 82 3c 33   lda $333c82,x
$1d:ba69  e2 af		 sep #$af
$1d:ba6b  1d f9 98	  ora $98f9,x
$1d:ba6e  18			clc
$1d:ba6f  20 c4 08	  jsr $08c4
$1d:ba72  b9 c4 49	  lda $49c4,y
$1d:ba75  e6 86		 inc $86
$1d:ba77  16 88		 asl $88,x
$1d:ba79  35 03		 and $03,x
$1d:ba7b  be 54 12	  ldx $1254,y
$1d:ba7e  f9 97 08	  sbc $0897,y
$1d:ba81  de 7f f3	  dec $f37f,x
$1d:ba84  7a			ply
$1d:ba85  2d 87 b8	  and $b887
$1d:ba88  7f a5 b0 c4   adc $c4b0a5,x
$1d:ba8c  d1 f4		 cmp ($f4),y
$1d:ba8e  3e f5 67	  rol $67f5,x
$1d:ba91  af 7d 9d ed   lda $ed9d7d
$1d:ba95  fd 00 08	  sbc $0800,x
$1d:ba98  8c 40 1d	  sty $1d40
$1d:ba9b  e9 04		 sbc #$04
$1d:ba9d  85 bd		 sta $bd
$1d:ba9f  d2 31		 cmp ($31)
$1d:baa1  0d 7f a4	  ora $a47f
$1d:baa4  52 5f		 eor ($5f)
$1d:baa6  14 9e		 trb $9e
$1d:baa8  02 46		 cop #$46
$1d:baaa  7b			tdc
$1d:baab  04 84		 tsb $84
$1d:baad  03 c6		 ora $c6,s
$1d:baaf  12 13		 ora ($13)
$1d:bab1  18			clc
$1d:bab2  50 5c		 bvc $bb10
$1d:bab4  5f 85 0c 0f   eor $0f0c85,x
$1d:bab8  a4 52		 ldy $52
$1d:baba  76 07		 ror $07,x
$1d:babc  19 ec 52	  ora $52ec,y
$1d:babf  ad 18 88	  lda $8818
$1d:bac2  46 22		 lsr $22
$1d:bac4  31 87		 and ($87),y
$1d:bac6  70 48		 bvs $bb10
$1d:bac8  63 1f		 adc $1f,s
$1d:baca  b8			clv
$1d:bacb  c7 f2		 cmp [$f2]
$1d:bacd  31 28		 and ($28),y
$1d:bacf  8c 4a 63	  sty $634a
$1d:bad2  1f d8 c7 f8   ora $f8c7d8,x
$1d:bad6  76 7f		 ror $7f,x
$1d:bad8  78			sei
$1d:bad9  c7 e0		 cmp [$e0]
$1d:badb  76 7f		 ror $7f,x
$1d:badd  98			tya
$1d:bade  c7 e8		 cmp [$e8]
$1d:bae0  76 51		 ror $51,x
$1d:bae2  48			pha
$1d:bae3  34 72		 bit $72,x
$1d:bae5  a5 14		 lda $14
$1d:bae7  83 96		 sta $96,s
$1d:bae9  46 b4		 lsr $b4
$1d:baeb  07 1a		 ora [$1a]
$1d:baed  dc 52 b3	  jml [$b352]
$1d:baf0  14 b4		 trb $b4
$1d:baf2  45 2d		 eor $2d
$1d:baf4  a6 32		 ldx $32
$1d:baf6  8c 4c 23	  sty $234c
$1d:baf9  13 18		 ora ($18,s),y
$1d:bafb  c4 4a		 cpy $4a
$1d:bafd  31 13		 and ($13),y
$1d:baff  37 9c		 and [$9c],y
$1d:bb01  52 31		 eor ($31)
$1d:bb03  15 8c		 ora $8c,x
$1d:bb05  49 8f		 eor #$8f
$1d:bb07  e3 27		 sbc $27,s
$1d:bb09  41 8c		 eor ($8c,x)
$1d:bb0b  65 0e		 adc $0e
$1d:bb0d  31 a4		 and ($a4),y
$1d:bb0f  58			cli
$1d:bb10  47 2a		 eor [$2a]
$1d:bb12  25 71		 and $71
$1d:bb14  48			pha
$1d:bb15  04 1e		 tsb $1e
$1d:bb17  29 cb		 and #$cb
$1d:bb19  2c 8c 14	  bit $148c
$1d:bb1c  b2 11		 lda ($11)
$1d:bb1e  88			dey
$1d:bb1f  ba			tsx
$1d:bb20  7c 54 63	  jmp ($6354,x)
$1d:bb23  5c a0 45 23   jml $2345a0
$1d:bb27  ea			nop
$1d:bb28  72 8c		 adc ($8c)
$1d:bb2a  48			pha
$1d:bb2b  a3 12		 lda $12,s
$1d:bb2d  30 f9		 bmi $bb28
$1d:bb2f  c9 23		 cmp #$23
$1d:bb31  12 58		 ora ($58)
$1d:bb33  c7 36		 cmp [$36]
$1d:bb35  31 ce		 and ($ce),y
$1d:bb37  8e 54 23	  stx $2354
$1d:bb3a  94 15		 sty $15,x
$1d:bb3c  f9 18 c6	  sbc $c618,y
$1d:bb3f  b8			clv
$1d:bb40  a9 05		 lda #$05
$1d:bb42  48			pha
$1d:bb43  23 c5		 and $c5,s
$1d:bb45  30 09		 bmi $bb50
$1d:bb47  00 82		 brk #$82
$1d:bb49  c5 39		 cmp $39
$1d:bb4b  89 d1		 bit #$d1
$1d:bb4d  e8			inx
$1d:bb4e  a7 46		 lda [$46]
$1d:bb50  2c df 45	  bit $45df
$1d:bb53  38			sec
$1d:bb54  3f c1 ce 40   and $40cec1,x
$1d:bb58  51 8d		 eor ($8d),y
$1d:bb5a  c5 25		 cmp $25
$1d:bb5c  71 48		 adc ($48),y
$1d:bb5e  ed 52 36	  sbc $3652
$1d:bb61  ef 18 f5 52   sbc $52f518
$1d:bb65  57 1c		 eor [$1c],y
$1d:bb67  c0 47 28	  cpy #$2847
$1d:bb6a  4f f2 34 88   eor $8834f2
$1d:bb6e  a8			tay
$1d:bb6f  01 49		 ora ($49,x)
$1d:bb71  56 04		 lsr $04,x
$1d:bb73  b8			clv
$1d:bb74  38			sec
$1d:bb75  a7 a0		 lda [$a0]
$1d:bb77  f4 53 8d	  pea $8d53
$1d:bb7a  79 4e 59	  adc $594e,y
$1d:bb7d  47 a0		 eor [$a0]
$1d:bb7f  4b			phk
$1d:bb80  5d a1 94	  eor $94a1,x
$1d:bb83  79 04 bb	  adc $bb04,y
$1d:bb86  a9 2b		 lda #$2b
$1d:bb88  ea			nop
$1d:bb89  3e 05 66	  rol $6605,x
$1d:bb8c  3d c8 c7	  and $c7c8,x
$1d:bb8f  ae 31 ec	  ldx $ec31
$1d:bb92  59 9f b6	  eor $b69f,y
$1d:bb95  31 ee		 and ($ee),y
$1d:bb97  8c 77 e3	  sty $e377
$1d:bb9a  1e f5 98	  asl $98f5,x
$1d:bb9d  ff eb 95 1a   sbc $1a95eb,x
$1d:bba1  e5 04		 sbc $04
$1d:bba3  ae 55 8e	  ldx $8e55
$1d:bba6  8f 63 ad 58   sta $58ad63
$1d:bbaa  cb			wai
$1d:bbab  17 c1		 ora [$c1],y
$1d:bbad  4e 76 05	  lsr $0576
$1d:bbb0  68			pla
$1d:bbb1  c5 a3		 cmp $a3
$1d:bbb3  8e 80 38	  stx $3880
$1d:bbb6  0b			phd
$1d:bbb7  fc 70 31	  jsr ($3170,x)
$1d:bbba  cc 84 73	  cpy $7384
$1d:bbbd  23 1c		 and $1c,s
$1d:bbbf  c1 30		 cmp ($30,x)
$1d:bbc1  47 24		 eor [$24]
$1d:bbc3  c1 16		 cmp ($16,x)
$1d:bbc5  a0 41 90	  ldy #$9041
$1d:bbc8  e0 db 06	  cpx #$06db
$1d:bbcb  d9 b7 04	  cmp $04b7,y
$1d:bbce  ae 51 cb	  ldx $cb51
$1d:bbd1  11 64		 ora ($64),y
$1d:bbd3  68			pla
$1d:bbd4  09 d5		 ora #$d5
$1d:bbd6  b8			clv
$1d:bbd7  1a			inc a
$1d:bbd8  46 c2		 lsr $c2
$1d:bbda  6d 7b 04	  adc $047b
$1d:bbdd  73 41		 adc ($41,s),y
$1d:bbdf  1c d0 c7	  trb $c7d0
$1d:bbe2  36 07		 rol $07,x
$1d:bbe4  51 d1		 eor ($d1),y
$1d:bbe6  20 44 ec	  jsr $ec44
$1d:bbe9  08			php
$1d:bbea  20 fb 46	  jsr $46fb
$1d:bbed  3a			dec a
$1d:bbee  d1 cf		 cmp ($cf),y
$1d:bbf0  aa			tax
$1d:bbf1  34 f7		 bit $f7,x
$1d:bbf3  c8			iny
$1d:bbf4  d3 b9		 cmp ($b9,s),y
$1d:bbf6  26 47		 rol $47
$1d:bbf8  bb			tyx
$1d:bbf9  5c d0 27 de   jml $de27d0
$1d:bbfd  e2 69		 sep #$69
$1d:bbff  19 52 b4	  ora $b452,y
$1d:bc02  62 f1 cb	  per $87f6
$1d:bc05  84 62		 sty $62
$1d:bc07  31 1c		 and ($1c),y
$1d:bc09  b0 a3		 bcs $bbae
$1d:bc0b  c6 1c		 dec $1c
$1d:bc0d  8f 17 e8 1d   sta $1de817
$1d:bc11  81 70		 sta ($70,x)
$1d:bc13  10 e8		 bpl $bbfd
$1d:bc15  e5 4d		 sbc $4d
$1d:bc17  1a			inc a
$1d:bc18  48			pha
$1d:bc19  d2 cc		 cmp ($cc)
$1d:bc1b  75 80		 adc $80,x
$1d:bc1d  e7 96		 sbc [$96]
$1d:bc1f  8e 77 ab	  stx $ab77
$1d:bc22  95 38		 sta $38,x
$1d:bc24  e7 6d		 sbc [$6d]
$1d:bc26  1e 15 c8	  asl $c815,x
$1d:bc29  73 74		 adc ($74,s),y
$1d:bc2b  63 95		 adc $95,s
$1d:bc2d  cd 85 72	  cmp $7285
$1d:bc30  58			cli
$1d:bc31  1d 1e a8	  ora $a81e,x
$1d:bc34  34 72		 bit $72,x
$1d:bc36  c0 76 8e	  cpy #$8e76
$1d:bc39  0a			asl a
$1d:bc3a  06 39		 asl $39
$1d:bc3c  d5 7e		 cmp $7e,x
$1d:bc3e  80 dd		 bra $bc1d
$1d:bc40  11 e3		 ora ($e3),y
$1d:bc42  d4 46		 pei ($46)
$1d:bc44  95 70		 sta $70,x
$1d:bc46  94 68		 sty $68,x
$1d:bc48  d1 8c		 cmp ($8c),y
$1d:bc4a  c1 30		 cmp ($30,x)
$1d:bc4c  f1 88		 sbc ($88),y
$1d:bc4e  d4 13		 pei ($13)
$1d:bc50  2f 04 c4 41   and $41c404
$1d:bc54  31 30		 and ($30),y
$1d:bc56  4c c4 13	  jmp $13c4
$1d:bc59  33 04		 and ($04,s),y
$1d:bc5b  c5 47		 cmp $47
$1d:bc5d  2e 30 4c	  rol $4c30
$1d:bc60  d4 72		 pei ($72)
$1d:bc62  55 08		 eor $08,x
$1d:bc64  b3 c2		 lda ($c2,s),y
$1d:bc66  2f 90 88 09   and $098890
$1d:bc6a  bc 61 e7	  ldy $e761,x
$1d:bc6d  74 1e		 stz $1e,x
$1d:bc6f  81 1d		 sta ($1d,x)
$1d:bc71  0e e3 9b	  asl $9be3
$1d:bc74  84 58		 sty $58
$1d:bc76  ce 23 7d	  dec $7d23
$1d:bc79  47 8d		 eor [$8d]
$1d:bc7b  92 11		 sta ($11)
$1d:bc7d  7e 37 8d	  ror $8d37,x
$1d:bc80  ea			nop
$1d:bc81  11 02		 ora ($02),y
$1d:bc83  84 5f		 sty $5f
$1d:bc85  ce e2 8c	  dec $8ce2
$1d:bc88  04 60		 tsb $60
$1d:bc8a  5e e2 93	  lsr $93e2,x
$1d:bc8d  c8			iny
$1d:bc8e  a4 f6		 ldy $f6
$1d:bc90  29 2f		 and #$2f
$1d:bc92  55 84		 eor $84,x
$1d:bc94  22 e7 08 ba   jsl $ba08e7
$1d:bc98  42 30		 wdm #$30
$1d:bc9a  70 8c		 bvs $bc28
$1d:bc9c  22 24 73 89   jsl $897324
$1d:bca0  13 3c		 ora ($3c,s),y
$1d:bca2  12 68		 ora ($68)
$1d:bca4  0f 01 8b 84   ora $848b01
$1d:bca8  63 d1		 adc $d1,s
$1d:bcaa  e2 9e		 sep #$9e
$1d:bcac  04 b0		 tsb $b0
$1d:bcae  24 03		 bit $03
$1d:bcb0  19 08 c6	  ora $c608,y
$1d:bcb3  b2 47		 lda ($47)
$1d:bcb5  1c d9 13	  trb $13d9
$1d:bcb8  c0 5e		 cpy #$5e
$1d:bcba  db			stp
$1d:bcbb  e3 66		 sbc $66,s
$1d:bcbd  37 8a		 and [$8a],y
$1d:bcbf  50 12		 bvc $bcd3
$1d:bcc1  00 70		 brk #$70
$1d:bcc3  06 b1		 asl $b1
$1d:bcc5  35 81		 and $81,x
$1d:bcc7  b8			clv
$1d:bcc8  4b			phk
$1d:bcc9  82 4a 03	  brl $c016
$1d:bccc  b0 9b		 bcs $bc69
$1d:bcce  84 78		 sty $78
$1d:bcd0  03 90		 ora $90,s
$1d:bcd2  32 91		 and ($91)
$1d:bcd4  48			pha
$1d:bcd5  28			plp
$1d:bcd6  91 4a		 sta ($4a),y
$1d:bcd8  04 11		 tsb $11
$1d:bcda  12 30		 ora ($30)
$1d:bcdc  34 98		 bit $98,x
$1d:bcde  bc 89 b8	  ldy $b889,x
$1d:bce1  47 00		 eor [$00]
$1d:bce3  4f 03 30 8f   eor $8f3003
$1d:bce7  08			php
$1d:bce8  8c 06 b0	  sty $b006
$1d:bceb  35 80		 and $80,x
$1d:bced  f0 49		 beq $bd38
$1d:bcef  60			rts
$1d:bcf0  47 15		 eor [$15]
$1d:bcf2  92 39		 sta ($39)
$1d:bcf4  d0 23		 bne $bd19
$1d:bcf6  8f 82 39 e1   sta $e13982
$1d:bcfa  23 96		 and $96,s
$1d:bcfc  73 c1		 adc ($c1,s),y
$1d:bcfe  9c f0 c5	  stz $c5f0
$1d:bd01  32 71		 and ($71)
$1d:bd03  4c a4 53	  jmp $53a4
$1d:bd06  4d 14 d3	  eor $d314
$1d:bd09  95 cc		 sta $cc,x
$1d:bd0b  bc 1a 60	  ldy $601a,x
$1d:bd0e  38			sec
$1d:bd0f  a4 02		 ldy $02
$1d:bd11  03 08		 ora $08,s
$1d:bd13  81 12		 sta ($12,x)
$1d:bd15  cf a4 73 0c   cmp $0c73a4
$1d:bd19  e1 50		 sbc ($50,x)
$1d:bd1b  4e 65 dc	  lsr $dc65
$1d:bd1e  f1 f7		 sbc ($f7),y
$1d:bd20  3c 95 cf	  bit $cf95,x
$1d:bd23  2d 73 c5	  and $c573
$1d:bd26  1c 43 07	  trb $0743
$1d:bd29  8f 39 e4 ce   sta $cee439
$1d:bd2d  79 63 9e	  adc $9e63,y
$1d:bd30  48			pha
$1d:bd31  e7 97		 sbc [$97]
$1d:bd33  39 e2 ce	  and $cee2,y
$1d:bd36  78			sei
$1d:bd37  e2 9e		 sep #$9e
$1d:bd39  68			pla
$1d:bd3a  a7 9d		 lda [$9d]
$1d:bd3c  32 29		 and ($29)
$1d:bd3e  80 2e		 bra $bd6e
$1d:bd40  11 90		 ora ($90),y
$1d:bd42  7b			tdc
$1d:bd43  9e 5e e7	  stz $e75e,x
$1d:bd46  8a			txa
$1d:bd47  b9 e3 ae	  lda $aee3,y
$1d:bd4a  79 22 91	  adc $9122,y
$1d:bd4d  f8			sed
$1d:bd4e  a7 01		 lda [$01]
$1d:bd50  62 34 88	  per $4587
$1d:bd53  a7 06		 lda [$06]
$1d:bd55  29 c2		 and #$c2
$1d:bd57  8a			txa
$1d:bd58  5b			tcd
$1d:bd59  62 92 f8	  per $b5ee
$1d:bd5c  a5 16		 lda $16
$1d:bd5e  29 46		 and #$46
$1d:bd60  5e 8d 59	  lsr $598d,x
$1d:bd63  62 2b 80	  per $3d91
$1d:bd66  9d af 45	  sta $45af,x
$1d:bd69  74 1c		 stz $1c,x
$1d:bd6b  35 e8		 and $e8,x
$1d:bd6d  f4 e2 9c	  pea $9ce2
$1d:bd70  48			pha
$1d:bd71  a7 16		 lda [$16]
$1d:bd73  29 3c		 and #$3c
$1d:bd75  8a			txa
$1d:bd76  4f 62 9c 68   eor $689c62
$1d:bd7a  a7 1d		 lda [$1d]
$1d:bd7c  96 3d		 stx $3d,y
$1d:bd7e  75 f9		 adc $f9,x
$1d:bd80  b1 81		 lda ($81),y
$1d:bd82  8c 0b 00	  sty $000b
$1d:bd85  78			sei
$1d:bd86  46 c6		 lsr $c6
$1d:bd88  29 b2		 and #$b2
$1d:bd8a  77 9c		 adc [$9c],y
$1d:bd8c  d5 5e		 cmp $5e,x
$1d:bd8e  15 4e		 ora $4e,x
$1d:bd90  4d 53 73	  eor $7353
$1d:bd93  14 f4		 trb $f4
$1d:bd95  55 39		 eor $39,x
$1d:bd97  10 8b		 bpl $bd24
$1d:bd99  ac 23 e1	  ldy $e123
$1d:bd9c  08			php
$1d:bd9d  d7 42		 cmp [$42],y
$1d:bd9f  35 b1		 and $b1,x
$1d:bda1  40			rti
$1d:bda2  50 72		 bvc $be16
$1d:bda4  62 9c 88	  per $4643
$1d:bda7  a7 a4		 lda [$a4]
$1d:bda9  36 21		 rol $21,x
$1d:bdab  a0 ec		 ldy #$ec
$1d:bdad  45 3b		 eor $3b
$1d:bdaf  30 8b		 bmi $bd3c
$1d:bdb1  2c 23 55	  bit $5523
$1d:bdb4  08			php
$1d:bdb5  dc 42 37	  jml [$3742]
$1d:bdb8  41 91		 eor ($91,x)
$1d:bdba  e5 09		 sbc $09
$1d:bdbc  42 29		 wdm #$29
$1d:bdbe  da			phx
$1d:bdbf  84 6a		 sty $6a
$1d:bdc1  05 29		 ora $29
$1d:bdc3  08			php
$1d:bdc4  d4 8d		 pei ($8d)
$1d:bdc6  c0 12		 cpy #$12
$1d:bdc8  02 b0		 cop #$b0
$1d:bdca  03 84		 ora $84,s
$1d:bdcc  12 16		 ora ($16)
$1d:bdce  0d 00 38	  ora $3800
$1d:bdd1  0c c4 38	  tsb $38c4
$1d:bdd4  00 a1		 brk #$a1
$1d:bdd6  84 61		 sty $61
$1d:bdd8  b9 14 40	  lda $4014,y
$1d:bddb  99 fa 03	  sta $03fa,y
$1d:bdde  a0 4d		 ldy #$4d
$1d:bde0  28			plp
$1d:bde1  46 ae		 lsr $ae
$1d:bde3  11 0f		 ora ($0f),y
$1d:bde5  84 6e		 sty $6e
$1d:bde7  cd 20 1d	  cmp $1d20
$1d:bdea  1f 51 7c 7d   ora $7d7c51,x
$1d:bdee  50 8c		 bvc $bd7c
$1d:bdf0  ec 23 3d	  cpx $3d23
$1d:bdf3  08			php
$1d:bdf4  d6 42		 dec $42,x
$1d:bdf6  37 91		 and [$91],y
$1d:bdf8  4c 99 dc	  jmp $dc99
$1d:bdfb  14 60		 trb $60
$1d:bdfd  7b			tdc
$1d:bdfe  1c f9 e4	  trb $e4f9
$1d:be01  77 87		 adc [$87],y
$1d:be03  b0 8a		 bcs $bd8f
$1d:be05  4e 62 93	  lsr $9362
$1d:be08  a8			tay
$1d:be09  a5 26		 lda $26
$1d:be0b  29 4a		 and #$4a
$1d:be0d  8a			txa
$1d:be0e  69 aa		 adc #$aa
$1d:be10  83 20		 sta $20,s
$1d:be12  d3 d5		 cmp ($d5,s),y
$1d:be14  3b			tsc
$1d:be15  49 71		 eor #$71
$1d:be17  39 02 70	  and $7002,y
$1d:be1a  0e c1 bd	  asl $bdc1
$1d:be1d  34 a4		 bit $a4,x
$1d:be1f  22 f1 08 bc   jsl $bc08f1
$1d:be23  9e ce af	  stz $afce,x
$1d:be26  14 ac		 trb $ac
$1d:be28  3e 46 d1	  rol $d146,x
$1d:be2b  14 ac		 trb $ac
$1d:be2d  c5 2b		 cmp $2b
$1d:be2f  51 4b		 eor ($4b),y
$1d:be31  4c 52 d5	  jmp $d552
$1d:be34  14 ad		 trb $ad
$1d:be36  c5 2b		 cmp $2b
$1d:be38  91 4b		 sta ($4b),y
$1d:be3a  5c 52 d8 1b   jml $1bd852
$1d:be3e  1d 78 8c	  ora $8c78,x
$1d:be41  89 20		 bit #$20
$1d:be43  d1 06		 cmp ($06),y
$1d:be45  b8			clv
$1d:be46  ef ca 62 1e   sbc $1e62ca
$1d:be4a  00 f0		 brk #$f0
$1d:be4c  72 4d		 adc ($4d)
$1d:be4e  22 e8 1a 46   jsl $461ae8
$1d:be52  f4 92 07	  pea $0792
$1d:be55  b0 24		 bcs $be7b
$1d:be57  83 5c		 sta $5c,s
$1d:be59  57 80		 eor [$80],y
$1d:be5b  f8			sed
$1d:be5c  2d 8a ec	  and $ec8a
$1d:be5f  74 71		 stz $71,x
$1d:be61  4d 94 53	  eor $5394
$1d:be64  67 14		 adc [$14]
$1d:be66  d2 45		 cmp ($45)
$1d:be68  34 b1		 bit $b1,x
$1d:be6a  4d a4 53	  eor $53a4
$1d:be6d  6a			ror a
$1d:be6e  f7 3d		 sbc [$3d],y
$1d:be70  b4 53		 ldy $53,x
$1d:be72  6e d1 16	  ror $16d1
$1d:be75  f0 06		 beq $be7d
$1d:be77  89 a4		 bit #$a4
$1d:be79  05 20		 ora $20
$1d:be7b  6f 01 38 0a   adc $0a3801
$1d:be7f  82 25 12	  brl $d0a7
$1d:be82  90 4b		 bcc $becf
$1d:be84  c5 e3		 cmp $e3
$1d:be86  3b			tsc
$1d:be87  17 84		 ora [$84],y
$1d:be89  22 ee 5b 12   jsl $125bee
$1d:be8d  e0 c2		 cpx #$c2
$1d:be8f  3e 54 8c	  rol $8c54,x
$1d:be92  34 23		 bit $23,x
$1d:be94  e7 08		 sbc [$08]
$1d:be96  fa			plx
$1d:be97  10 cc		 bpl $be65
$1d:be99  78			sei
$1d:be9a  57 52		 eor [$52],y
$1d:be9c  08			php
$1d:be9d  8f 80 78 0e   sta $0e7880
$1d:bea1  82 ba c2	  brl $815e
$1d:bea4  2e d0 82	  rol $82d0
$1d:bea7  10 17		 bpl $bec0
$1d:bea9  80 a8		 bra $be53
$1d:beab  31 88		 and ($88),y
$1d:bead  69 9c		 adc #$9c
$1d:beaf  22 94 b8 a5   jsl $a5b894
$1d:beb3  32 29		 and ($29)
$1d:beb5  37 60		 and [$60],y
$1d:beb7  8c d9 76	  sty $76d9
$1d:beba  10 8a		 bpl $be46
$1d:bebc  24 22		 bit $22
$1d:bebe  65 08		 adc $08
$1d:bec0  f8			sed
$1d:bec1  42 3e		 wdm #$3e
$1d:bec3  30 89		 bmi $be4e
$1d:bec5  9c 22 68	  stz $6822
$1d:bec8  3f 0e 45 10   and $10450e,x
$1d:becc  ce 76 e8	  dec $e876
$1d:becf  a5 bc		 lda $bc
$1d:bed1  d2 33		 cmp ($33)
$1d:bed3  e8			inx
$1d:bed4  a5 36		 lda $36
$1d:bed6  29 4e		 and #$4e
$1d:bed8  33 8d		 and ($8d,s),y
$1d:beda  54 ce 75	  mvn $75,$ce
$1d:bedd  d8			cld
$1d:bede  a5 79		 lda $79
$1d:bee0  ee 75 f3	  inc $f375
$1d:bee3  48			pha
$1d:bee4  a9 82		 lda #$82
$1d:bee6  71 18		 adc ($18),y
$1d:bee8  aa			tax
$1d:bee9  19 c8 ce	  ora $cec8,y
$1d:beec  04 f3		 tsb $f3
$1d:beee  3c 11 80	  bit $8011,x
$1d:bef1  90 02		 bcc $bef5
$1d:bef3  67 3a		 adc [$3a]
$1d:bef5  69 a4		 adc #$a4
$1d:bef7  6b			rtl
$1d:bef8  27 11		 and [$11]
$1d:befa  7c 09 a4	  jmp ($a409,x)
$1d:befd  72 ab		 adc ($ab)
$1d:beff  14 33		 trb $33
$1d:bf01  9e 15 b6	  stz $b615,x
$1d:bf04  ab			plb
$1d:bf05  00 80		 brk #$80
$1d:bf07  3b			tsc
$1d:bf08  fc 01 e1	  jsr ($e101,x)
$1d:bf0b  1f 0b 0c 52   ora $520c0b,x
$1d:bf0f  7e 69 1a	  ror $1a69,x
$1d:bf12  79 9c 42	  adc $429c,y
$1d:bf15  de 3f f2	  dec $f23f,x
$1d:bf18  87 98		 sta [$98]
$1d:bf1a  7c e5 e8	  jmp ($e8e5,x)
$1d:bf1d  3f 4a 7a 97   and $977a4a,x
$1d:bf21  d6 de		 dec $de,x
$1d:bf23  c7 f6		 cmp [$f6]
$1d:bf25  c7 ba		 cmp [$ba]
$1d:bf27  7d f5 e0	  adc $e0f5,x
$1d:bf2a  bf 0e 78 b7   lda $b7780e,x
$1d:bf2e  c7 de		 cmp [$de]
$1d:bf30  4f f3 07 9c   eor $9c07f3
$1d:bf34  7d 05 e9	  adc $e905,x
$1d:bf37  3f 52 7a d7   and $d77a52,x
$1d:bf3b  d8			cld
$1d:bf3c  de d7 f7	  dec $f7d7,x
$1d:bf3f  41 80		 eor ($80,x)
$1d:bf41  03 07		 ora $07,s
$1d:bf43  00 15		 brk #$15
$1d:bf45  a2 d1		 ldx #$d1
$1d:bf47  af 97 db f5   lda $f5db97
$1d:bf4b  fd e2 d9	  sbc $d9e2,x
$1d:bf4e  0c 8d 36	  tsb $368d
$1d:bf51  9d 18 8c	  sta $8c18,x
$1d:bf54  c6 a3		 dec $a3
$1d:bf56  60			rts
$1d:bf57  16 cc		 asl $cc,x
$1d:bf59  66 70		 ror $70
$1d:bf5b  50 d8		 bvc $bf35
$1d:bf5d  30 46		 bmi $bfa5
$1d:bf5f  61 98		 adc ($98,x)
$1d:bf61  1c 54 56	  trb $5654
$1d:bf64  0d 02 81	  ora $8102
$1d:bf67  84 5e		 sty $5e
$1d:bf69  29 89		 and #$89
$1d:bf6b  c1 c7		 cmp ($c7,x)
$1d:bf6d  60			rts
$1d:bf6e  d0 a8		 bne $bf18
$1d:bf70  58			cli
$1d:bf71  45 e3		 eor $e3
$1d:bf73  98			tya
$1d:bf74  0c 5c 96	  tsb $965c
$1d:bf77  0d 04 82	  ora $8204
$1d:bf7a  84 5e		 sty $5e
$1d:bf7c  49 88		 eor #$88
$1d:bf7e  07 a4		 ora [$a4]
$1d:bf80  8a			txa
$1d:bf81  47 2a		 eor [$2a]
$1d:bf83  95 86		 sta $86,x
$1d:bf85  5c 34 60 f4   jml $f46034
$1d:bf89  16 98		 asl $98,x
$1d:bf8b  a8			tay
$1d:bf8c  cb			wai
$1d:bf8d  e8			inx
$1d:bf8e  3d 31 d1	  and $d131,x
$1d:bf91  9b			txy
$1d:bf92  d0 9a		 bne $bf2e
$1d:bf94  c4 d0		 cpy $d0
$1d:bf96  3f a1 77 cd   and $cd77a1,x
$1d:bf9a  de 7f f4	  dec $f47f,x
$1d:bf9d  87 a8		 sta [$a8]
$1d:bf9f  72 8b		 adc ($8b)
$1d:bfa1  46 be		 lsr $be
$1d:bfa3  5f 6f d7 f7   eor $f7d76f,x
$1d:bfa7  8b			phb
$1d:bfa8  64 32		 stz $32
$1d:bfaa  34 da		 bit $da,x
$1d:bfac  74 62		 stz $62,x
$1d:bfae  33 1a		 and ($1a,s),y
$1d:bfb0  8d 80 5b	  sta $5b80
$1d:bfb3  31 99		 and ($99),y
$1d:bfb5  27 85		 and [$85]
$1d:bfb7  9c 88 f0	  stz $f088
$1d:bfba  6b			rtl
$1d:bfbb  3b			tsc
$1d:bfbc  74 ac		 stz $ac,x
$1d:bfbe  41 28		 eor ($28,x)
$1d:bfc0  b1 2b		 lda ($2b),y
$1d:bfc2  48			pha
$1d:bfc3  23 4b		 and $4b,s
$1d:bfc5  d2 10		 cmp ($10)
$1d:bfc7  9e 4b 26	  stz $264b,x
$1d:bfca  28			plp
$1d:bfcb  36 69		 rol $69,x
$1d:bfcd  04 4f		 tsb $4f
$1d:bfcf  35 9b		 and $9b,x
$1d:bfd1  0c 78 a7	  tsb $a778
$1d:bfd4  c7 54		 cmp [$54]
$1d:bfd6  66 56		 ror $56
$1d:bfd8  69 51		 adc #$51
$1d:bfda  0e 51 44	  asl $4451
$1d:bfdd  6e 95 56	  ror $5695
$1d:bfe0  02 a2		 cop #$a2
$1d:bfe2  03 91		 ora $91,s
$1d:bfe4  28			plp
$1d:bfe5  86 aa		 stx $aa
$1d:bfe7  6d 28 34	  adc $3428
$1d:bfea  25 64		 and $64
$1d:bfec  07 22		 ora [$22]
$1d:bfee  59 11 f4	  eor $f411,y
$1d:bff1  94 c5		 sty $c5,x
$1d:bff3  02 81		 cop #$81
$1d:bff5  b1 41		 lda ($41),y
$1d:bff7  48			pha
$1d:bff8  44 d2 5b	  mvp $5b,$d2
$1d:bffb  14 2a		 trb $2a
$1d:bffd  16 d5		 asl $d5,x
$1d:bfff  05 a1		 ora $a1
$1d:c001  17 49		 ora [$49],y
$1d:c003  4c 50 48	  jmp $4850
$1d:c006  2b			pld
$1d:c007  94 14		 sty $14,x
$1d:c009  84 6d		 sty $6d
$1d:c00b  0a			asl a
$1d:c00c  2d 1a f9	  and $f91a
$1d:c00f  7d bf 5f	  adc $5fbf,x
$1d:c012  de 2d 90	  dec $902d,x
$1d:c015  c8			iny
$1d:c016  d3 69		 cmp ($69,s),y
$1d:c018  d1 88		 cmp ($88),y
$1d:c01a  cc 6a 36	  cpy $366a
$1d:c01d  01 6c		 ora ($6c,x)
$1d:c01f  c6 65		 dec $65
$1d:c021  9e 67 27	  stz $2767,x
$1d:c024  6e a9 c9	  ror $c9a9
$1d:c027  18			clc
$1d:c028  a0 ec		 ldy #$ec
$1d:c02a  15 78		 ora $78,x
$1d:c02c  9c 99 aa	  stz $aa99
$1d:c02f  0b			phd
$1d:c030  c6 39		 dec $39
$1d:c032  23 94		 and $94,s
$1d:c034  19 8d 06	  ora $068d,y
$1d:c037  91 48		 sta ($48),y
$1d:c039  e5 52		 sbc $52
$1d:c03b  b0 cd		 bcs $c00a
$1d:c03d  27 40		 and [$40]
$1d:c03f  1e 82 d6	  asl $d682,x
$1d:c042  56 80		 lsr $80,x
$1d:c044  7d 07 ac	  adc $ac07,x
$1d:c047  3d 01 7a	  and $7a01,x
$1d:c04a  13 59		 ora ($59,s),y
$1d:c04c  9a			txs
$1d:c04d  03 f4		 ora $f4,s
$1d:c04f  2e f9 bb	  rol $bbf9
$1d:c052  cf fe 90 f5   cmp $f590fe
$1d:c056  0f ac bd 87   ora $87bdac
$1d:c05a  ed 4f 72	  sbc $724f
$1d:c05d  fb			xce
$1d:c05e  db			stp
$1d:c05f  c0 fe		 cpy #$fe
$1d:c061  18			clc
$1d:c062  f1 4f		 sbc ($4f),y
$1d:c064  8e bc 97	  stx $97bc
$1d:c067  e5 cf		 sbc $cf
$1d:c069  36 f9		 rol $f9,x
$1d:c06b  fb			xce
$1d:c06c  d1 fe		 cmp ($fe),y
$1d:c06e  a0 f6		 ldy #$f6
$1d:c070  88			dey
$1d:c071  c2 5a		 rep #$5a
$1d:c073  24 f4		 bit $f4
$1d:c075  25 ea		 and $ea
$1d:c077  c0 60 df	  cpy #$df60
$1d:c07a  df e8 0c 59   cmp $590ce8,x
$1d:c07e  6e f4 76	  ror $76f4
$1d:c081  ea			nop
$1d:c082  82 48 10	  brl $d0cd
$1d:c085  6e df 7f	  ror $7fdf
$1d:c088  30 85		 bmi $c00f
$1d:c08a  41 be		 eor ($be,x)
$1d:c08c  1e 58 14	  asl $1458,x
$1d:c08f  0c ca 02	  tsb $02ca
$1d:c092  9a			txs
$1d:c093  85 42		 sta $42
$1d:c095  ce a0 f9	  dec $f9a0
$1d:c098  a8			tay
$1d:c099  24 15		 bit $15
$1d:c09b  0a			asl a
$1d:c09c  04 9f		 tsb $9f
$1d:c09e  0d 50 19	  ora $1950
$1d:c0a1  45 be		 eor $be
$1d:c0a3  3e f4 7f	  rol $7ff4,x
$1d:c0a6  88			dey
$1d:c0a7  27 f6		 and [$f6]
$1d:c0a9  6c 63 60	  jmp ($6063)
$1d:c0ac  87 cd		 sta [$cd]
$1d:c0ae  78			sei
$1d:c0af  cb			wai
$1d:c0b0  c1 77		 cmp ($77,x)
$1d:c0b2  a3 35		 lda $35,s
$1d:c0b4  59 82 ff	  eor $ff82,y
$1d:c0b7  42 ea		 wdm #$ea
$1d:c0b9  b7 04		 lda [$04],y
$1d:c0bb  1e 8e df	  asl $df8e,x
$1d:c0be  7f 78 3f c4   adc $c43f78,x
$1d:c0c2  1e 31 f2	  asl $f231,x
$1d:c0c5  17 94		 ora [$94],y
$1d:c0c7  fc c9 e7	  jsr ($e7c9,x)
$1d:c0ca  5f 43 7a 5f   eor $5f7a43,x
$1d:c0ce  d5 1e		 cmp $1e,x
$1d:c0d0  b9 f6 57	  lda $57f6,y
$1d:c0d3  82 82 6d	  brl $2e58
$1d:c0d6  37 6f		 and [$6f],y
$1d:c0d8  e0 28 1d	  cpx #$1d28
$1d:c0db  f8			sed
$1d:c0dc  0a			asl a
$1d:c0dd  07 fe		 ora [$fe]
$1d:c0df  02 81		 cop #$81
$1d:c0e1  9f 14 ba 61   sta $61ba14,x
$1d:c0e5  64 9e		 stz $9e
$1d:c0e7  e8			inx
$1d:c0e8  1d 09 64	  ora $6409,x
$1d:c0eb  b6 a7		 ldx $a7,y
$1d:c0ed  54 34 91	  mvn $91,$34
$1d:c0f0  1d 8e 2c	  ora $2c8e,x
$1d:c0f3  ff 43 8c 09   sbc $098c43,x
$1d:c0f7  d8			cld
$1d:c0f8  e2 c3		 sep #$c3
$1d:c0fa  76 38		 ror $38,x
$1d:c0fc  b1 bf		 lda ($bf),y
$1d:c0fe  d0 1e		 bne $c11e
$1d:c100  91 f1		 sta ($f1),y
$1d:c102  49 c0		 eor #$c0
$1d:c104  5c 4a 07 38   jml $38074a
$1d:c108  48			pha
$1d:c109  24 9e		 bit $9e
$1d:c10b  84 45		 sty $45
$1d:c10d  01 f8		 ora ($f8,x)
$1d:c10f  40			rti
$1d:c110  40			rti
$1d:c111  22 e3 30 08   jsl $0830e3
$1d:c115  95 40		 sta $40,x
$1d:c117  ce 10 90	  dec $9010
$1d:c11a  88			dey
$1d:c11b  bd 4c 22	  lda $224c,x
$1d:c11e  26 50		 rol $50
$1d:c120  58			cli
$1d:c121  e0 b3 c7	  cpx #$c7b3
$1d:c124  bf 4b a6 13   lda $13a64b,x
$1d:c128  f2 a7		 sbc ($a7)
$1d:c12a  54 2f e0	  mvn $e0,$2f
$1d:c12d  fb			xce
$1d:c12e  cf fe 90 f5   cmp $f590fe
$1d:c132  0f ac bd 87   ora $87bdac
$1d:c136  ed 4f 20	  sbc $204f
$1d:c139  be 0e 3a	  ldx $3a0e,y
$1d:c13c  15 28		 ora $28,x
$1d:c13e  a6 27		 ldx $27
$1d:c140  15 15		 ora $15,x
$1d:c142  0a			asl a
$1d:c143  94 73		 sty $73,x
$1d:c145  01 8b		 ora ($8b,x)
$1d:c147  92 be		 sta ($be)
$1d:c149  51 de		 eor ($de),y
$1d:c14b  92 4c		 sta ($4c)
$1d:c14d  44 b2 5a	  mvp $5a,$b2
$1d:c150  09 47		 ora #$47
$1d:c152  fa			plx
$1d:c153  43 30		 eor $30,s
$1d:c155  24 94		 bit $94
$1d:c157  0e 86 0a	  asl $0a86
$1d:c15a  1a			inc a
$1d:c15b  f1 42		 sbc ($42),y
$1d:c15d  4a			lsr a
$1d:c15e  3d 60 5e	  and $5e60,x
$1d:c161  80 58		 bra $c1bb
$1d:c163  a5 d3		 lda $d3
$1d:c165  09 e4		 ora #$e4
$1d:c167  15 8a		 ora $8a,x
$1d:c169  9d 50 be	  sta $be50,x
$1d:c16c  53 69		 eor ($69,s),y
$1d:c16e  b8			clv
$1d:c16f  3d 05 ac	  and $ac05,x
$1d:c172  e0 61 eb	  cpx #$eb61
$1d:c175  38			sec
$1d:c176  18			clc
$1d:c177  1a			inc a
$1d:c178  0e 0c 0e	  asl $0e0c
$1d:c17b  b3 81		 lda ($81,s),y
$1d:c17d  8d be 7e	  sta $7ebe
$1d:c180  f4 7f c0	  pea $c07f
$1d:c183  59 06 e0	  eor $e006,y
$1d:c186  41 60		 eor ($60,x)
$1d:c188  81 d0		 sta ($d0,x)
$1d:c18a  26 10		 rol $10
$1d:c18c  97 92		 sta [$92],y
$1d:c18e  95 d1		 sta $d1,x
$1d:c190  7f 02 74 5f   adc $5f7402,x
$1d:c194  c0 dd 1c	  cpy #$1cdd
$1d:c197  8c e0 07	  sty $07e0
$1d:c19a  7f 80 3c 23   adc $233c80,x
$1d:c19e  eb			xba
$1d:c19f  fb			xce
$1d:c1a0  17 b2		 ora [$b2],y
$1d:c1a2  fd 87 fe	  sbc $fe87,x
$1d:c1a5  50 f3		 bvc $c19a
$1d:c1a7  0f 9c bd 07   ora $07bd9c
$1d:c1ab  e9 4f		 sbc #$4f
$1d:c1ad  19 1c 0a	  ora $0a1c,y
$1d:c1b0  06 b1		 asl $b1
$1d:c1b2  c7 cf		 cmp [$cf]
$1d:c1b4  82 bc 37	  brl $f973
$1d:c1b7  e2 cf		 sep #$cf
$1d:c1b9  1e f9 3b	  asl $3bf9,x
$1d:c1bc  cb			wai
$1d:c1bd  fe 70 f3	  inc $f370,x
$1d:c1c0  a0 ba 81	  ldy #$81ba
$1d:c1c3  d5 70		 cmp $70,x
$1d:c1c5  18			clc
$1d:c1c6  54 2d 2a	  mvn $2a,$2d
$1d:c1c9  10 14		 bpl $c1df
$1d:c1cb  5c 42 60 90   jml $906042
$1d:c1cf  55 28		 eor $28,x
$1d:c1d1  42 53		 wdm #$53
$1d:c1d3  2c a3 06	  bit $06a3
$1d:c1d6  4a			lsr a
$1d:c1d7  2a			rol a
$1d:c1d8  55 46		 eor $46,x
$1d:c1da  16 75		 asl $75,x
$1d:c1dc  a2 59 d5	  ldx #$d559
$1d:c1df  26 b2		 rol $b2
$1d:c1e1  1b			tcs
$1d:c1e2  12 d1		 ora ($d1)
$1d:c1e4  1a			inc a
$1d:c1e5  60			rts
$1d:c1e6  a9 15		 lda #$15
$1d:c1e8  91 30		 sta ($30),y
$1d:c1ea  c3 fa		 cmp $fa,s
$1d:c1ec  b8			clv
$1d:c1ed  07 28		 ora [$28]
$1d:c1ef  30 c5		 bmi $c1b6
$1d:c1f1  52 2b		 eor ($2b)
$1d:c1f3  34 59		 bit $59,x
$1d:c1f5  ac 73 00	  ldy $0073
$1d:c1f8  27 c9		 and [$c9]
$1d:c1fa  26 20		 rol $20
$1d:c1fc  4f 90 cc 0a   eor $0acc90
$1d:c200  4c 17 88	  jmp $8817
$1d:c203  b4 48		 ldy $48,x
$1d:c205  a6 25		 ldx $25
$1d:c207  df e0 0f 08   cmp $080fe0,x
$1d:c20b  e8			inx
$1d:c20c  fe c5 a2	  inc $a2c5,x
$1d:c20f  3f b1 ef 93   and $93efb1,x
$1d:c213  bc bf e7	  ldy $e7bf,x
$1d:c216  0f 40 fa 4b   ora $4bfa40
$1d:c21a  a0 50 35	  ldy #$3550
$1d:c21d  24 e0		 bit $e0
$1d:c21f  e3 ab		 sbc $ab,s
$1d:c221  f6 80		 inc $80,x
$1d:c223  c2 a1		 rep #$a1
$1d:c225  62 60 80	  per $4288
$1d:c228  e2 e4		 sep #$e4
$1d:c22a  af 26 84 c1   lda $c18426
$1d:c22e  20 b0 90	  jsr $90b0
$1d:c231  40			rti
$1d:c232  60			rts
$1d:c233  a1 ac		 lda ($ac,x)
$1d:c235  65 18		 adc $18
$1d:c237  18			clc
$1d:c238  c0 31 51	  cpy #$5131
$1d:c23b  57 93		 eor [$93],y
$1d:c23d  09 11		 ora #$11
$1d:c23f  de e1 81	  dec $81e1,x
$1d:c242  fe 87 05	  inc $0587,x
$1d:c245  ff 02 44 07   sbc $074402,x
$1d:c249  f8			sed
$1d:c24a  83 ca		 sta $ca,s
$1d:c24c  38			sec
$1d:c24d  ff 0a 5d 31   sbc $315d0a,x
$1d:c251  02 8f		 cop #$8f
$1d:c253  53 80		 eor ($80,s),y
$1d:c255  93 c2		 sta ($c2,s),y
$1d:c257  a7 54		 lda [$54]
$1d:c259  48			pha
$1d:c25a  a1 64		 lda ($64,x)
$1d:c25c  e1 25		 sbc ($25,x)
$1d:c25e  f7 63		 sbc [$63],y
$1d:c260  2b			pld
$1d:c261  be 1c e8	  ldx $e81c,y
$1d:c264  ff 77 32 93   sbc $933277,x
$1d:c268  dc e2 a9	  jml [$a9e2]
$1d:c26b  fe 2c 15	  inc $152c,x
$1d:c26e  88			dey
$1d:c26f  e4 8f		 cpx $8f
$1d:c271  32 2c		 and ($2c)
$1d:c273  1d 9c e4	  ora $e49c,x
$1d:c276  80 35		 bra $c2ad
$1d:c278  78			sei
$1d:c279  d8			cld
$1d:c27a  16 81		 asl $81,x
$1d:c27c  5e 1b f4	  lsr $f41b,x
$1d:c27f  c9 7e		 cmp #$7e
$1d:c281  de 34 50	  dec $5034,x
$1d:c284  11 07		 ora ($07),y
$1d:c286  8c 72 02	  sty $0272
$1d:c289  7f 1a 22 e1   adc $e1221a,x
$1d:c28d  28			plp
$1d:c28e  87 f2		 sta [$f2]
$1d:c290  84 a3		 sty $a3
$1d:c292  c6 aa		 dec $aa
$1d:c294  b8			clv
$1d:c295  4a			lsr a
$1d:c296  aa			tax
$1d:c297  3c 8d 6c	  bit $6c8d,x
$1d:c29a  a6 f5		 ldx $f5
$1d:c29c  bf b2 3d b3   lda $b33db2,x
$1d:c2a0  e7 b3		 sbc [$b3]
$1d:c2a2  3f 04 2a 16   and $162a04,x
$1d:c2a6  ef 01 e2 c7   sbc $c7e201
$1d:c2aa  30 10		 bmi $c2bc
$1d:c2ac  94 70		 sty $70,x
$1d:c2ae  41 20		 eor ($20,x)
$1d:c2b0  af f0 1e 2c   lda $2c1ef0
$1d:c2b4  93 11		 sta ($11,s),y
$1d:c2b6  06 4f		 asl $4f
$1d:c2b8  1a			inc a
$1d:c2b9  79 a1 98	  adc $98a1,y
$1d:c2bc  17 70		 ora [$70],y
$1d:c2be  bb			tyx
$1d:c2bf  0c 78 91	  tsb $9178
$1d:c2c2  4c 48 3c	  jmp $3c48
$1d:c2c5  7f a1 38 7e   adc $7e38a1,x
$1d:c2c9  80 7f		 bra $c34a
$1d:c2cb  01 be		 ora ($be,x)
$1d:c2cd  1e f2 7e	  asl $7ef2,x
$1d:c2d0  3f 42 02 f4   and $f40242,x
$1d:c2d4  3a			dec a
$1d:c2d5  5d 31 0a	  eor $0a31,x
$1d:c2d8  84 d0		 sty $d0
$1d:c2da  84 9c		 sty $9c
$1d:c2dc  0e a7 54	  asl $54a7
$1d:c2df  4a			lsr a
$1d:c2e0  a1 74		 lda ($74,x)
$1d:c2e2  5b			tcd
$1d:c2e3  d6 2d		 dec $2d,x
$1d:c2e5  16 f5		 asl $f5,x
$1d:c2e7  8f 45 bd 64   sta $64bd45
$1d:c2eb  d1 70		 cmp ($70),y
$1d:c2ed  da			phx
$1d:c2ee  77 f1		 adc [$f1],y
$1d:c2f0  38			sec
$1d:c2f1  38			sec
$1d:c2f2  ea			nop
$1d:c2f3  7f 31 72 54   adc $547231,x
$1d:c2f7  fe 60 a1	  inc $a160,x
$1d:c2fa  a9 fc		 lda #$fc
$1d:c2fc  c5 45		 cmp $45
$1d:c2fe  53 f8		 eor ($f8,s),y
$1d:c300  ef f0 03 19   sbc $1903f0
$1d:c304  54 1e e7	  mvn $e7,$1e
$1d:c307  55 0f		 eor $0f,x
$1d:c309  f8			sed
$1d:c30a  c3 c8		 cmp $c8,s
$1d:c30c  3e 52 f3	  rol $f352,x
$1d:c30f  1f 9d 3d 65   ora $653d9d,x
$1d:c313  18			clc
$1d:c314  4c 2c 42	  jmp $422c
$1d:c317  23 12		 and $12,s
$1d:c319  89 b4		 bit #$b4
$1d:c31b  63 19		 adc $19,s
$1d:c31d  8d bc 5e	  sta $5ebc
$1d:c320  6f 57 b7 0c   adc $0cb757
$1d:c324  2c 71 f9	  bit $f971
$1d:c327  e0 df 0f	  cpx #$0fdf
$1d:c32a  78			sei
$1d:c32b  bf d0 aa 88   lda $88aad0,x
$1d:c32f  54 99 d4	  mvn $d4,$99
$1d:c332  a8			tay
$1d:c333  10 7a		 bpl $c3af
$1d:c335  05 49		 ora $49
$1d:c337  65 34		 adc $34
$1d:c339  0a			asl a
$1d:c33a  0d 22 83	  ora $8322
$1d:c33d  40			rti
$1d:c33e  59 49 94	  eor $9449,y
$1d:c341  3f 34 8a 1a   and $1a8a34,x
$1d:c345  ca			dex
$1d:c346  69 46		 adc #$46
$1d:c348  51 a5		 eor ($a5),y
$1d:c34a  2e 8d 12	  rol $128d
$1d:c34d  85 40		 sta $40
$1d:c34f  a1 15		 lda ($15,x)
$1d:c351  ee 1f 0e	  inc $0e1f
$1d:c354  52 0a		 eor ($0a)
$1d:c356  26 56		 rol $56
$1d:c358  7e be 88	  ror $88be,x
$1d:c35b  94 4e		 sty $4e,x
$1d:c35d  21 11		 and ($11,x)
$1d:c35f  67 d5		 adc [$d5]
$1d:c361  ea			nop
$1d:c362  f7 78		 sbc [$78],y
$1d:c364  bc b7 e9	  ldy $e9b7,x
$1d:c367  7d 91 cc	  adc $cc91,x
$1d:c36a  02 fb		 cop #$fb
$1d:c36c  24 98		 bit $98
$1d:c36e  85 f6		 sta $f6
$1d:c370  43 30		 eor $30,s
$1d:c372  2b			pld
$1d:c373  ec 8a 62	  cpx $628a
$1d:c376  49 32		 eor #$32
$1d:c378  fa			plx
$1d:c379  98			tya
$1d:c37a  08			php
$1d:c37b  1b			tcs
$1d:c37c  61 21		 adc ($21,x)
$1d:c37e  6f 13 f8 e3   adc $e3f813
$1d:c382  c9 3e		 cmp #$3e
$1d:c384  5a			phy
$1d:c385  f3 5f		 sbc ($5f,s),y
$1d:c387  bf 3d 1a 11   lda $111a3d,x
$1d:c38b  28			plp
$1d:c38c  9c 42 22	  stz $2242
$1d:c38f  cf 8c 36 1e   cmp $1e368c
$1d:c393  f5 7b		 sbc $7b,x
$1d:c395  bc 5e 5b	  ldy $5b5e,x
$1d:c398  f1 8e		 sbc ($8e),y
$1d:c39a  c7 fe		 cmp [$fe]
$1d:c39c  55 f8		 eor $f8,x
$1d:c39e  fd f0 77	  sbc $77f0,x
$1d:c3a1  87 fc		 sta [$fc]
$1d:c3a3  61 e4		 adc ($e4,x)
$1d:c3a5  1f 29 79 8f   ora $8f7929,x
$1d:c3a9  ce 9e 85	  dec $859e
$1d:c3ac  f4 b7 a9	  pea $a9b7
$1d:c3af  fd 71 ec	  sbc $ec71,x
$1d:c3b2  9f 6d 7b af   sta $af7b6d,x
$1d:c3b6  df 9e 0d f0   cmp $f00d9e,x
$1d:c3ba  f7 8b		 sbc [$8b],y
$1d:c3bc  fc 81 e5	  jsr ($e581,x)
$1d:c3bf  1f 31 79 cf   ora $cf7931,x
$1d:c3c3  d0 9e		 bne $c363
$1d:c3c5  95 f5		 sta $f5,x
$1d:c3c7  37 ad		 and [$ad],y
$1d:c3c9  fd 91 ed	  sbc $ed91,x
$1d:c3cc  9f 75 7b ef   sta $ef7b75,x
$1d:c3d0  c1 9e		 cmp ($9e,x)
$1d:c3d2  1d f1 77	  ora $77f1,x
$1d:c3d5  8f fc a1 e6   sta $e6a1fc
$1d:c3d9  1f 39 7a 0f   ora $0f7a39,x
$1d:c3dd  d2 9e		 cmp ($9e)
$1d:c3df  a5 f5		 lda $f5
$1d:c3e1  b7 b1		 lda [$b1],y
$1d:c3e3  fd b1 ee	  sbc $eeb1,x
$1d:c3e6  93 03		 sta ($03,s),y
$1d:c3e8  05 00		 ora $00
$1d:c3ea  0f fb bb fd   ora $fdbbfb
$1d:c3ee  ea			nop
$1d:c3ef  70 e9		 bvs $c3da
$1d:c3f1  c0 1c 68	  cpy #$681c
$1d:c3f4  00 71		 brk #$71
$1d:c3f6  7a			ply
$1d:c3f7  ac e6 37	  ldy $37e6
$1d:c3fa  36 0c		 rol $0c,x
$1d:c3fc  05 20		 ora $20
$1d:c3fe  30 20		 bmi $c420
$1d:c400  f6 91		 inc $91,x
$1d:c402  cf 85 01 50   cmp $500185
$1d:c406  14 08		 trb $08
$1d:c408  3d a5 f0	  and $f0a5,x
$1d:c40b  18			clc
$1d:c40c  c4 24		 cpy $24
$1d:c40e  74 42		 stz $42,x
$1d:c410  f7 81		 sbc [$81],y
$1d:c412  44 24 b2	  mvp $b2,$24
$1d:c415  62 58 6b	  per $2f70
$1d:c418  c5 f1		 cmp $f1
$1d:c41a  08			php
$1d:c41b  96 c3		 stx $c3,y
$1d:c41d  a7 73		 lda [$73]
$1d:c41f  bd b8 fe	  lda $feb8,x
$1d:c422  65 b3		 adc $b3
$1d:c424  a0 0b 02	  ldy #$020b
$1d:c427  c2 1c		 rep #$1c
$1d:c429  57 30		 eor [$30],y
$1d:c42b  50 85		 bvc $c3b2
$1d:c42d  0c 36 33	  tsb $3336
$1d:c430  72 40		 adc ($40)
$1d:c432  4d 43 24	  eor $2443
$1d:c435  24 31		 bit $31
$1d:c437  58			cli
$1d:c438  cf e0 31 a9   cmp $a931e0
$1d:c43c  e8			inx
$1d:c43d  a4 86		 ldy $86
$1d:c43f  85 11		 sta $11
$1d:c441  51 8c		 eor ($8c),y
$1d:c443  86 05		 stx $05
$1d:c445  19 51 94	  ora $9451,y
$1d:c448  48			pha
$1d:c449  28			plp
$1d:c44a  32 b2		 and ($b2)
$1d:c44c  68			pla
$1d:c44d  12 c2		 ora ($c2)
$1d:c44f  4e 58 02	  lsr $0258
$1d:c452  50 ad		 bvc $c401
$1d:c454  00 08		 brk #$08
$1d:c456  25 c1		 and $c1
$1d:c458  9d 9d 80	  sta $809d,x
$1d:c45b  d0 25		 bne $c482
$1d:c45d  b0 62		 bcs $c4c1
$1d:c45f  01 3e		 ora ($3e,x)
$1d:c461  8d 68 41	  sta $4168
$1d:c464  6f eb 6a 9b   adc $9b6aeb
$1d:c468  8e 72 20	  stx $2072
$1d:c46b  11 00		 ora ($00),y
$1d:c46d  59 16 41	  eor $4116,y
$1d:c470  22 08 b2 6c   jsl $6cb208
$1d:c474  84 44		 sty $44
$1d:c476  21 68		 and ($68,x)
$1d:c478  48			pha
$1d:c479  bc 24 10	  ldy $1024,x
$1d:c47c  11 9a		 ora ($9a),y
$1d:c47e  c6 05		 dec $05
$1d:c480  e2 bb		 sep #$bb
$1d:c482  05 b0		 ora $b0
$1d:c484  40			rti
$1d:c485  88			dey
$1d:c486  6b			rtl
$1d:c487  10 5d		 bpl $c4e6
$1d:c489  0b			phd
$1d:c48a  08			php
$1d:c48b  0e c2 33	  asl $33c2
$1d:c48e  53 c8		 eor ($c8,s),y
$1d:c490  c3 93		 cmp $93,s
$1d:c492  e5 22		 sbc $22
$1d:c494  fd 91 55	  sbc $5591,x
$1d:c497  b4 13		 ldy $13,x
$1d:c499  99 c4 39	  sta $39c4,y
$1d:c49c  ac 02 f1	  ldy $f102
$1d:c49f  39 9c 28	  and $289c,y
$1d:c4a2  d8			cld
$1d:c4a3  31 c3		 and ($c3),y
$1d:c4a5  68			pla
$1d:c4a6  2c 81 66	  bit $6681
$1d:c4a9  4b			phk
$1d:c4aa  32 96		 and ($96)
$1d:c4ac  1b			tcs
$1d:c4ad  42 49		 wdm #$49
$1d:c4af  3a			dec a
$1d:c4b0  60			rts
$1d:c4b1  8b			phb
$1d:c4b2  0c 52 68	  tsb $6852
$1d:c4b5  70 07		 bvs $c4be
$1d:c4b7  56 ed		 lsr $ed,x
$1d:c4b9  d1 81		 cmp ($81),y
$1d:c4bb  f7 87		 sbc [$87],y
$1d:c4bd  00 e0		 brk #$e0
$1d:c4bf  e0 05		 cpx #$05
$1d:c4c1  00 6a		 brk #$6a
$1d:c4c3  84 6c		 sty $6c
$1d:c4c5  28			plp
$1d:c4c6  c7 f1		 cmp [$f1]
$1d:c4c8  71 94		 adc ($94),y
$1d:c4ca  8c 48 c8	  sty $c848
$1d:c4cd  f0 67		 beq $c536
$1d:c4cf  1c bc 88	  trb $88bc
$1d:c4d2  c6 c1		 dec $c1
$1d:c4d4  50 da		 bvc $c4b0
$1d:c4d6  84 56		 sty $56
$1d:c4d8  70 b7		 bvs $c491
$1d:c4da  38			sec
$1d:c4db  73 20		 adc ($20,s),y
$1d:c4dd  98			tya
$1d:c4de  e6 c6		 inc $c6
$1d:c4e0  33 f8		 and ($f8,s),y
$1d:c4e2  36 09		 rol $09,x
$1d:c4e4  ae 6d 63	  ldx $636d
$1d:c4e7  47 84		 eor [$84]
$1d:c4e9  82 31 09	  brl $ce1d
$1d:c4ec  fe 8b c6	  inc $c68b,x
$1d:c4ef  12 2f		 ora ($2f)
$1d:c4f1  32 d8		 and ($d8)
$1d:c4f3  4e a4 f1	  lsr $f1a4
$1d:c4f6  09 2c		 ora #$2c
$1d:c4f8  98			tya
$1d:c4f9  7f 06 c0 97   adc $97c006,x
$1d:c4fd  8f 03 0c 4f   sta $4f0c03
$1d:c501  92 70		 sta ($70)
$1d:c503  3a			dec a
$1d:c504  c0 a4		 cpy #$a4
$1d:c506  06 07		 asl $07
$1d:c508  d7 6d		 cmp [$6d],y
$1d:c50a  c9 fe		 cmp #$fe
$1d:c50c  60			rts
$1d:c50d  b2 6f		 lda ($6f)
$1d:c50f  ce b5 a8	  dec $a8b5
$1d:c512  0f 38 f9 8b   ora $8bf938
$1d:c516  d6 7e		 dec $7e,x
$1d:c518  a4 9f		 ldy $9f
$1d:c51a  bb			tyx
$1d:c51b  bd 27 32	  lda $3227,x
$1d:c51e  f8			sed
$1d:c51f  08			php
$1d:c520  f0 5d		 beq $c57f
$1d:c522  e7 0e		 sbc [$0e]
$1d:c524  9c 4e 28	  stz $284e
$1d:c527  13 88		 ora ($88,s),y
$1d:c529  74 be		 stz $be,x
$1d:c52b  04 ac		 tsb $ac
$1d:c52d  00 08		 brk #$08
$1d:c52f  01 01		 ora ($01,x)
$1d:c531  e8			inx
$1d:c532  31 b9		 and ($b9),y
$1d:c534  b5 22		 lda $22,x
$1d:c536  6d 36 9b	  adc $9b36
$1d:c539  be 02 6a	  ldx $6a02,y
$1d:c53c  15 00		 ora $00,x
$1d:c53e  a0 3d		 ldy #$3d
$1d:c540  06 47		 asl $47
$1d:c542  3e a8 4f	  rol $4fa8,x
$1d:c545  a7 d3		 lda [$d3]
$1d:c547  f8			sed
$1d:c548  14 8a		 trb $8a
$1d:c54a  7a			ply
$1d:c54b  25 01		 and $01
$1d:c54d  20 3d 0a	  jsr $0a3d
$1d:c550  12 33		 ora ($33)
$1d:c552  19 04 06	  ora $0604,y
$1d:c555  30 33		 bmi $c58a
$1d:c557  28			plp
$1d:c558  53 d0		 eor ($d0,s),y
$1d:c55a  65 72		 adc $72
$1d:c55c  6d 7c 9a	  adc $9a7c
$1d:c55f  4d 27 04	  eor $0427
$1d:c562  04 94		 tsb $94
$1d:c564  8a			txa
$1d:c565  04 40		 tsb $40
$1d:c567  7f 8c ee 77   adc $77ee8c,x
$1d:c56b  b7 9d		 lda [$9d],y
$1d:c56d  81 81		 sta ($81,x)
$1d:c56f  f0 25		 beq $c596
$1d:c571  10 2a		 bpl $c59d
$1d:c573  03 bd		 ora $bd,s
$1d:c575  c1 02		 cmp ($02,x)
$1d:c577  ee 67 9e	  inc $9e67
$1d:c57a  18			clc
$1d:c57b  78			sei
$1d:c57c  02 a5		 cop #$a5
$1d:c57e  82 06 50	  brl $1587
$1d:c581  20 03 59	  jsr $5903
$1d:c584  01 8d		 ora ($8d,x)
$1d:c586  0a			asl a
$1d:c587  9e 22 c3	  stz $c322,x
$1d:c58a  19 0f f6	  ora $f60f,y
$1d:c58d  32 c3		 and ($c3)
$1d:c58f  28			plp
$1d:c590  90 fd		 bcc $c58f
$1d:c592  df 00 4a c0   cmp $c04a00,x
$1d:c596  41 17		 eor ($17,x)
$1d:c598  13 6f		 ora ($6f,s),y
$1d:c59a  ad 80 bd	  lda $bd80
$1d:c59d  12 11		 ora ($11)
$1d:c59f  ae db ce	  ldx $cedb
$1d:c5a2  52 a0		 eor ($a0)
$1d:c5a4  65 20		 adc $20
$1d:c5a6  21 ff		 and ($ff,x)
$1d:c5a8  51 23		 eor ($23),y
$1d:c5aa  39 8e 22	  and $228e,y
$1d:c5ad  c0 62		 cpy #$62
$1d:c5af  52 01		 eor ($01)
$1d:c5b1  c9 42		 cmp #$42
$1d:c5b3  81 83		 sta ($83,x)
$1d:c5b5  24 08		 bit $08
$1d:c5b7  09 08		 ora #$08
$1d:c5b9  08			php
$1d:c5ba  c0 49		 cpy #$49
$1d:c5bc  29 34		 and #$34
$1d:c5be  b0 1a		 bcs $c5da
$1d:c5c0  08			php
$1d:c5c1  a1 28		 lda ($28,x)
$1d:c5c3  89 58		 bit #$58
$1d:c5c5  0b			phd
$1d:c5c6  24 33		 bit $33
$1d:c5c8  19 c8 b0	  ora $b0c8,y
$1d:c5cb  0e 48 89	  asl $8948
$1d:c5ce  59 c8 d0	  eor $d0c8,y
$1d:c5d1  0e 48 79	  asl $7948
$1d:c5d4  59 c9 c1	  eor $c1c9,y
$1d:c5d7  91 2b		 sta ($2b),y
$1d:c5d9  b7 40		 lda [$40],y
$1d:c5db  31 5e		 and ($5e),y
$1d:c5dd  93 60		 sta ($60,s),y
$1d:c5df  35 07		 and $07,x
$1d:c5e1  48			pha
$1d:c5e2  ce 1f e4	  dec $e41f
$1d:c5e5  ff 11 08 46   sbc $460811,x
$1d:c5e9  d4 c1		 pei ($c1)
$1d:c5eb  08			php
$1d:c5ec  55 08		 eor $08,x
$1d:c5ee  3c 81 e2	  bit $e281,x
$1d:c5f1  21 09		 and ($09,x)
$1d:c5f3  1a			inc a
$1d:c5f4  d8			cld
$1d:c5f5  24 4b		 bit $4b
$1d:c5f7  a1 0f		 lda ($0f,x)
$1d:c5f9  90 7c		 bcc $c677
$1d:c5fb  40			rti
$1d:c5fc  22 f6 43 40   jsl $4043f6
$1d:c600  8b			phb
$1d:c601  88			dey
$1d:c602  02 c6		 cop #$c6
$1d:c604  72 1f		 adc ($1f)
$1d:c606  1b			tcs
$1d:c607  c8			iny
$1d:c608  a3 5f		 lda $5f,s
$1d:c60a  b7 d1		 lda [$d1],y
$1d:c60c  13 51		 ora ($51,s),y
$1d:c60e  87 3b		 sta [$3b]
$1d:c610  71 b0		 adc ($b0),y
$1d:c612  e1 9d		 sbc ($9d,x)
$1d:c614  f3 3a		 sbc ($3a,s),y
$1d:c616  23 0b		 and $0b,s
$1d:c618  c8			iny
$1d:c619  00 10		 brk #$10
$1d:c61b  fe 07 87	  inc $8707,x
$1d:c61e  80 69		 bra $c689
$1d:c620  b6 00		 ldx $00,y
$1d:c622  ff 00 78 c7   sbc $c77800,x
$1d:c626  35 a4		 and $a4,x
$1d:c628  0f 18 f8 8b   ora $8bf818
$1d:c62c  ce 7e 64	  dec $647e
$1d:c62f  f4 af a9	  pea $a9af
$1d:c632  bc af e8	  ldy $e8af,x
$1d:c635  85 fb		 sta $fb
$1d:c637  bb			tyx
$1d:c638  d2 73		 cmp ($73)
$1d:c63a  2f 80 af 05   and $05af80
$1d:c63e  de af 33	  dec $33af,x
$1d:c641  81 33		 sta ($33,x)
$1d:c643  05 de		 ora $de
$1d:c645  50 e9		 bvc $c630
$1d:c647  c0 44		 cpy #$44
$1d:c649  28			plp
$1d:c64a  13 88		 ora ($88,s),y
$1d:c64c  73 dc		 adc ($dc,s),y
$1d:c64e  82 00 14	  brl $da51
$1d:c651  07 a8		 ora [$a8]
$1d:c653  46 e6		 lsr $e6
$1d:c655  d3 6a		 cmp ($6a,s),y
$1d:c657  40			rti
$1d:c658  88			dey
$1d:c659  26 e0		 rol $e0
$1d:c65b  80 9a		 bra $c5f7
$1d:c65d  88			dey
$1d:c65e  89 ea		 bit #$ea
$1d:c660  12 39		 ora ($39)
$1d:c662  f4 fa a0	  pea $a0fa
$1d:c665  32 09		 and ($09)
$1d:c667  fc 06 35	  jsr ($3506,x)
$1d:c66a  3d 19 10	  and $1019,x
$1d:c66d  14 88		 trb $88
$1d:c66f  54 f5 22	  mvn $22,$f5
$1d:c672  94 46		 sty $46,x
$1d:c674  bf 7f 7d be   lda $be7d7f,x
$1d:c678  b4 85		 ldy $85,x
$1d:c67a  e7 2a		 sbc [$2a]
$1d:c67c  1f fe df 5a   ora $5adffe,x
$1d:c680  72 f3		 adc ($f3)
$1d:c682  1e c8 23	  asl $23c8,x
$1d:c685  10 98		 bpl $c61f
$1d:c687  4c 81 2f	  jmp $2f81
$1d:c68a  12 b9		 ora ($b9)
$1d:c68c  3f c2 4b 26   and $264bc2,x
$1d:c690  93 c4		 sta ($c4,s),y
$1d:c692  58			cli
$1d:c693  ea			nop
$1d:c694  0f 0a 0c bf   ora $bf0c0a
$1d:c698  ef 2d a0 ca   sbc $caa02d
$1d:c69c  e4 cd		 cpx $cd
$1d:c69e  73 d7		 adc ($d7,s),y
$1d:c6a0  c9 9f		 cmp #$9f
$1d:c6a2  c0 d5		 cpy #$d5
$1d:c6a4  19 65 06	  ora $0665,y
$1d:c6a7  1d 3b 73	  ora $733b,x
$1d:c6aa  9e de 76	  stz $76de,x
$1d:c6ad  02 45		 cop #$45
$1d:c6af  a0 ac		 ldy #$ac
$1d:c6b1  c2 15		 rep #$15
$1d:c6b3  2d 9d 3c	  and $3c9d
$1d:c6b6  81 de		 sta ($de,x)
$1d:c6b8  6d 61 93	  adc $9361
$1d:c6bb  c4 18		 cpy $18
$1d:c6bd  81 2c		 sta ($2c,x)
$1d:c6bf  7e 0c e2	  ror $e20c,x
$1d:c6c2  71 0e		 adc ($0e),y
$1d:c6c4  67 83		 adc [$83]
$1d:c6c6  9c 21 d2	  stz $d221
$1d:c6c9  f8			sed
$1d:c6ca  44 b5 cc	  mvp $cc,$b5
$1d:c6cd  01 10		 ora ($10,x)
$1d:c6cf  9c cd a3	  stz $a3cd
$1d:c6d2  8f c0 78 1c   sta $1c78c0
$1d:c6d6  41 f6		 eor ($f6,x)
$1d:c6d8  2f 11 9f 49   and $499f11
$1d:c6dc  04 2a		 tsb $2a
$1d:c6de  18			clc
$1d:c6df  01 09		 ora ($09,x)
$1d:c6e1  43 85		 eor $85,s
$1d:c6e3  08			php
$1d:c6e4  25 2d		 and $2d
$1d:c6e6  76 dd		 ror $dd,x
$1d:c6e8  de 43 84	  dec $8443,x
$1d:c6eb  1a			inc a
$1d:c6ec  bf dc 90 a9   lda $a990dc,x
$1d:c6f0  00 1f		 brk #$1f
$1d:c6f2  a9 3f		 lda #$3f
$1d:c6f4  c8			iny
$1d:c6f5  0e 69 68	  asl $6869
$1d:c6f8  70 3c		 bvs $c736
$1d:c6fa  01 e2		 ora ($e2,x)
$1d:c6fc  17 02		 ora [$02],y
$1d:c6fe  4a			lsr a
$1d:c6ff  44 26 b3	  mvp $b3,$26
$1d:c702  65 09		 adc $09
$1d:c704  cd c7 eb	  cmp $ebc7
$1d:c707  1a			inc a
$1d:c708  9e cf 96	  stz $96cf,x
$1d:c70b  27 3f		 and [$3f]
$1d:c70d  37 ac		 and [$ac],y
$1d:c70f  45 7e		 eor $7e
$1d:c711  d1 22		 cmp ($22),y
$1d:c713  02 01		 cop #$01
$1d:c715  41 9e		 eor ($9e,x)
$1d:c717  3a			dec a
$1d:c718  f6 79		 inc $79,x
$1d:c71a  02 c5		 cop #$c5
$1d:c71c  04 21		 tsb $21
$1d:c71e  40			rti
$1d:c71f  6f 8e dd be   adc $bedd8e
$1d:c723  61 10		 adc ($10,x)
$1d:c725  41 08		 eor ($08,x)
$1d:c727  dc 14 01	  jml [$0114]
$1d:c72a  37 78		 and [$78],y
$1d:c72c  38			sec
$1d:c72d  a4 25		 ldy $25
$1d:c72f  f2 25		 sbc ($25)
$1d:c731  80 4f		 bra $c782
$1d:c733  c0 0c 28	  cpy #$280c
$1d:c736  19 7c 24	  ora $247c,y
$1d:c739  20 32 08	  jsr $0832
$1d:c73c  0c 06 30	  tsb $3006
$1d:c73f  10 28		 bpl $c769
$1d:c741  50 e4		 bvc $c727
$1d:c743  25 6d		 and $6d
$1d:c745  32 93		 and ($93)
$1d:c747  c0 a0 51	  cpy #$51a0
$1d:c74a  09 2b		 ora #$2b
$1d:c74c  48			pha
$1d:c74d  9b			txy
$1d:c74e  20 e2 24	  jsr $24e2
$1d:c751  b0 05		 bcs $c758
$1d:c753  41 1e		 eor ($1e,x)
$1d:c755  2e 32 75	  rol $7532
$1d:c758  1a			inc a
$1d:c759  18			clc
$1d:c75a  04 a2		 tsb $a2
$1d:c75c  80 42		 bra $c7a0
$1d:c75e  51 a1		 eor ($a1),y
$1d:c760  80 6a		 bra $c7cc
$1d:c762  44 96 48	  mvp $48,$96
$1d:c765  82 58 08	  brl $cfc0
$1d:c768  a5 0e		 lda $0e
$1d:c76a  d9 7c 76	  cmp $767c,y
$1d:c76d  49 50		 eor #$50
$1d:c76f  42 0c		 wdm #$0c
$1d:c771  6d 4c 03	  adc $034c
$1d:c774  51 78		 eor ($78),y
$1d:c776  86 e3		 stx $e3
$1d:c778  e5 b9		 sbc $b9
$1d:c77a  8e 36 86	  stx $8636
$1d:c77d  73 23		 adc ($23,s),y
$1d:c77f  5b			tcd
$1d:c780  00 94		 brk #$94
$1d:c782  00 03		 brk #$03
$1d:c784  c0 f9 70	  cpy #$70f9
$1d:c787  64 87		 stz $87
$1d:c789  e2 1a		 sep #$1a
$1d:c78b  0a			asl a
$1d:c78c  4d 57 07	  eor $0757
$1d:c78f  b7 d6		 lda [$d6],y
$1d:c791  89 41		 bit #$41
$1d:c793  46 b1		 lsr $b1
$1d:c795  0d 76 dc	  ora $dc76
$1d:c798  82 41 02	  brl $c9dc
$1d:c79b  59 98 70	  eor $7098,y
$1d:c79e  48			pha
$1d:c79f  22 1f 01 49   jsl $49011f
$1d:c7a3  08			php
$1d:c7a4  08			php
$1d:c7a5  58			cli
$1d:c7a6  25 f1		 and $f1
$1d:c7a8  73 10		 adc ($10,s),y
$1d:c7aa  ec 47 62	  cpx $6247
$1d:c7ad  3c 56 fd	  bit $fd56,x
$1d:c7b0  40			rti
$1d:c7b1  1d e3 fd	  ora $fde3,x
$1d:c7b4  88			dey
$1d:c7b5  bd 02 43	  lda $4302,x
$1d:c7b8  ff 8c bd 06   sbc $06bd8c,x
$1d:c7bc  23 fd		 and $fd,s
$1d:c7be  77 90		 adc [$90],y
$1d:c7c0  0b			phd
$1d:c7c1  c2 7e		 rep #$7e
$1d:c7c3  24 f1		 bit $f1
$1d:c7c5  af 91 bc af   lda $afbc91
$1d:c7c9  e6 8f		 inc $8f
$1d:c7cb  3c fa 2b	  bit $2bfa,x
$1d:c7ce  d3 7e		 cmp ($7e,s),y
$1d:c7d0  ac f5 ef	  ldy $eff5
$1d:c7d3  b3 bd		 lda ($bd,s),y
$1d:c7d5  bf ef 0f 00   lda $000fef,x
$1d:c7d9  f8			sed
$1d:c7da  4b			phk
$1d:c7db  c4 7e		 cpy $7e
$1d:c7dd  34 f2		 bit $f2,x
$1d:c7df  2f 95 bc cf   and $cfbc95
$1d:c7e3  e7 8f		 sbc [$8f]
$1d:c7e5  44 fa 6b	  mvp $6b,$fa
$1d:c7e8  d5 7e		 cmp $7e,x
$1d:c7ea  bc f6 6f	  ldy $6ff6,x
$1d:c7ed  b7 ba		 lda [$ba],y
$1d:c7ef  03 01		 ora $01,s
$1d:c7f1  ff c0 61 0e   sbc $0e61c0,x
$1d:c7f5  f2 6f		 sbc ($6f)
$1d:c7f7  2c 09 fe	  bit $fe09
$1d:c7fa  31 07		 and ($07),y
$1d:c7fc  f9 3a 1d	  sbc $1d3a,y
$1d:c7ff  de 0f 31	  dec $310f,x
$1d:c802  77 83		 adc [$83],y
$1d:c804  e3 c1		 sbc $c1,s
$1d:c806  3e 1a f1	  rol $f11a,x
$1d:c809  5f 8f 0f fa   eor $fa0f8f,x
$1d:c80d  42 f1		 wdm #$f1
$1d:c80f  9f 99 3c eb   sta $eb3c99,x
$1d:c813  e6 10		 inc $10
$1d:c815  44 79 e7	  mvp $e7,$79
$1d:c818  d5 5e		 cmp $5e,x
$1d:c81a  bb			tyx
$1d:c81b  f7 5f		 sbc [$5f],y
$1d:c81d  bf 3c 1b e1   lda $e11b3c,x
$1d:c821  ef 17 f9 03   sbc $03f917
$1d:c825  ca			dex
$1d:c826  3e 62 f3	  rol $f362,x
$1d:c829  9f a1 3d 2b   sta $2b3da1,x
$1d:c82d  ea			nop
$1d:c82e  6f 5b fb 23   adc $23fb5b
$1d:c832  db			stp
$1d:c833  3e ea f7	  rol $f7ea,x
$1d:c836  df 83 3c 3b   cmp $3b3c83,x
$1d:c83a  e2 ef		 sep #$ef
$1d:c83c  1f f9 43 cc   ora $cc43f9,x
$1d:c840  3e 72 f4	  rol $f472,x
$1d:c843  1f a5 3d 4b   ora $4b3da5,x
$1d:c847  eb			xba
$1d:c848  6f 63 fb 63   adc $63fb63
$1d:c84c  db			stp
$1d:c84d  c7 01		 cmp [$01]
$1d:c84f  77 8c		 adc [$8c],y
$1d:c851  21 de		 and ($de,x)
$1d:c853  4d e5 81	  eor $81e5
$1d:c856  3f c6 20 ff   and $ff20c6,x
$1d:c85a  27 47		 and [$47]
$1d:c85c  be 7d bc	  ldx $bc7d,y
$1d:c85f  72 00		 adc ($00)
$1d:c861  78			sei
$1d:c862  46 21		 lsr $21
$1d:c864  41 49		 eor ($49,x)
$1d:c866  c0 c0 bf	  cpy #$bfc0
$1d:c869  b2 2c		 lda ($2c)
$1d:c86b  00 13		 brk #$13
$1d:c86d  c2 be		 rep #$be
$1d:c86f  46 f2		 lsr $f2
$1d:c871  bf 9a 3c f3   lda $f33c9a,x
$1d:c875  e8			inx
$1d:c876  af 4d fb 2f   lda $2ffb4d
$1d:c87a  db			stp
$1d:c87b  9f 00 00 08   sta $080000,x
$1d:c87f  80 3b		 bra $c8bc
$1d:c881  d6 11		 dec $11,x
$1d:c883  06 7b		 asl $7b
$1d:c885  ac a7 11	  ldy $11a7
$1d:c888  2b			pld
$1d:c889  84 4e		 sty $4e
$1d:c88b  61 13		 adc ($13,x)
$1d:c88d  a7 ba		 lda [$ba]
$1d:c88f  c5 de		 cmp $de
$1d:c891  e7 01		 sbc [$01]
$1d:c893  7b			tdc
$1d:c894  ac 0a 11	  ldy $110a
$1d:c897  03 0d		 ora $0d,s
$1d:c899  90 04		 bcc $c89f
$1d:c89b  04 69		 tsb $69
$1d:c89d  08			php
$1d:c89e  83 e2		 sta $e2,s
$1d:c8a0  20 54 89	  jsr $8954
$1d:c8a3  53 dc		 eor ($dc,s),y
$1d:c8a5  62 8f 70	  per $3937
$1d:c8a8  00 8c		 brk #$8c
$1d:c8aa  10 02		 bpl $c8ae
$1d:c8ac  23 41		 and $41,s
$1d:c8ae  84 0c		 sty $0c
$1d:c8b0  06 90		 asl $90
$1d:c8b2  3e 28 83	  rol $8328,x
$1d:c8b5  dc e2 2f	  jml [$2fe2]
$1d:c8b8  74 c4		 stz $c4,x
$1d:c8ba  4e 71 13	  lsr $1371
$1d:c8bd  ac 40 00	  ldy $0040
$1d:c8c0  44 e7 09	  mvp $09,$e7
$1d:c8c3  16 80		 asl $80,x
$1d:c8c5  8c e0 74	  sty $74e0
$1d:c8c8  88			dey
$1d:c8c9  4f 22 75 c8   eor $c87522
$1d:c8cd  2c 04 af	  bit $af04
$1d:c8d0  91 29		 sta ($29),y
$1d:c8d2  31 81		 and ($81),y
$1d:c8d4  3c 4a 03	  bit $034a,x
$1d:c8d7  c8			iny
$1d:c8d8  95 72		 sta $72,x
$1d:c8da  0f c0 70 21   ora $2170c0
$1d:c8de  b0 4a		 bcs $c92a
$1d:c8e0  8a			txa
$1d:c8e1  e5 48		 sbc $48
$1d:c8e3  22 0a 3c 60   jsl $603c0a
$1d:c8e7  84 50		 sty $50
$1d:c8e9  00 82		 brk #$82
$1d:c8eb  54 13 23	  mvn $23,$13
$1d:c8ee  15 10		 ora $10,x
$1d:c8f0  a0 6c 62	  ldy #$626c
$1d:c8f3  a2 73 05	  ldx #$0573
$1d:c8f6  20 78 03	  jsr $0378
$1d:c8f9  09 01 39	  ora #$3901
$1d:c8fc  90 8c		 bcc $c88a
$1d:c8fe  cb			wai
$1d:c8ff  8a			txa
$1d:c900  5d 71 20	  eor $2071,x
$1d:c903  9b			txy
$1d:c904  41 a2		 eor ($a2,x)
$1d:c906  c3 30		 cmp $30,s
$1d:c908  6d 92 6c	  adc $6c92
$1d:c90b  89 20 2d	  bit #$2d20
$1d:c90e  02 99		 cop #$99
$1d:c910  87 80		 sta [$80]
$1d:c912  a0 86 41	  ldy #$4186
$1d:c915  1c 83 d4	  trb $d483
$1d:c918  8d a0 43	  sta $43a0
$1d:c91b  24 e9		 bit $e9
$1d:c91d  09 cd 54	  ora #$54cd
$1d:c920  6a			ror a
$1d:c921  b3 4e		 lda ($4e,s),y
$1d:c923  1a			inc a
$1d:c924  5c 95 24 b3   jml $b32495
$1d:c928  27 59		 and [$59]
$1d:c92a  af 0d ca 03   lda $03ca0d
$1d:c92e  d1 4a		 cmp ($4a),y
$1d:c930  02 80		 cop #$80
$1d:c932  41 62		 eor ($62,x)
$1d:c934  04 05		 tsb $05
$1d:c936  e0 2a 81	  cpx #$812a
$1d:c939  10 0b		 bpl $c946
$1d:c93b  80 81		 bra $c8be
$1d:c93d  f2 25		 sbc ($25)
$1d:c93f  bc 89 e7	  ldy $e789,x
$1d:c942  22 77 c8 96   jsl $96c877
$1d:c946  72 02		 adc ($02)
$1d:c948  01 28		 ora ($28,x)
$1d:c94a  a4 49		 ldy $49
$1d:c94c  e9 13 85	  sbc #$8513
$1d:c94f  b8			clv
$1d:c950  c9 e1 12	  cmp #$12e1
$1d:c953  85 b8		 sta $b8
$1d:c955  ce 04 e6	  dec $e604
$1d:c958  f0 10		 beq $c96a
$1d:c95a  f9 91 81	  sbc $8191,y
$1d:c95d  f4 0b 40	  pea $400b
$1d:c960  13 02		 ora ($02,s),y
$1d:c962  71 07		 adc ($07),y
$1d:c964  46 6f		 lsr $6f
$1d:c966  40			rti
$1d:c967  48			pha
$1d:c968  07 c9		 ora [$c9]
$1d:c96a  c2 0f		 rep #$0f
$1d:c96c  90 e4		 bcc $c952
$1d:c96e  19 07 91	  ora $9107,y
$1d:c971  28			plp
$1d:c972  e4 1a		 cpx $1a
$1d:c974  00 a0		 brk #$a0
$1d:c976  13 8c		 ora ($8c,s),y
$1d:c978  44 9f 11	  mvp $11,$9f
$1d:c97b  28			plp
$1d:c97c  80 2b		 bra $c9a9
$1d:c97e  fd 81 ed	  sbc $ed81,x
$1d:c981  1f 71 7b cf   ora $cf7b71,x
$1d:c985  c0 9e 15	  cpy #$159e
$1d:c988  f1 37		 sbc ($37),y
$1d:c98a  8d fc 91	  sta $91fc
$1d:c98d  e5 9f		 sbc $9f
$1d:c98f  35 79		 and $79,x
$1d:c991  b8			clv
$1d:c992  71 10		 adc ($10),y
$1d:c994  6c 44 40	  jmp ($4044)
$1d:c997  fe 1c 88	  inc $881c,x
$1d:c99a  a4 22		 ldy $22
$1d:c99c  02 a1		 cop #$a1
$1d:c99e  08			php
$1d:c99f  42 18		 wdm #$18
$1d:c9a1  11 41		 ora ($41),y
$1d:c9a3  2b			pld
$1d:c9a4  84 4b		 sty $4b
$1d:c9a6  21 13		 and ($13,x)
$1d:c9a8  b8			clv
$1d:c9a9  44 f2 11	  mvp $11,$f2
$1d:c9ac  2d a4 49	  and $49a4
$1d:c9af  d1 22		 cmp ($22),y
$1d:c9b1  80 08		 bra $c9bb
$1d:c9b3  1d 22 5a	  ora $5a22,x
$1d:c9b6  9b			txy
$1d:c9b7  2a			rol a
$1d:c9b8  44 b2 91	  mvp $91,$b2
$1d:c9bb  2b			pld
$1d:c9bc  a4 4f		 ldy $4f
$1d:c9be  29 13 bc	  and #$bc13
$1d:c9c1  42 b8		 wdm #$b8
$1d:c9c3  27 98		 and [$98]
$1d:c9c5  89 5e 22	  bit #$225e
$1d:c9c8  58			cli
$1d:c9c9  7f 14 00 4b   adc $4b0014,x
$1d:c9cd  79 09 a1	  adc $a109,y
$1d:c9d0  a4 23		 ldy $23
$1d:c9d2  09 04 0a	  ora #$0a04
$1d:c9d5  a0 94 d2	  ldy #$d294
$1d:c9d8  27 54		 and [$54]
$1d:c9da  89 ca 3c	  bit #$3cca
$1d:c9dd  5a			phy
$1d:c9de  04 94		 tsb $94
$1d:c9e0  04 90		 tsb $90
$1d:c9e2  28			plp
$1d:c9e3  81 2c		 sta ($2c,x)
$1d:c9e5  0a			asl a
$1d:c9e6  60			rts
$1d:c9e7  4c 02 48	  jmp $4802
$1d:c9ea  14 c0		 trb $c0
$1d:c9ec  ac 06 80	  ldy $8006
$1d:c9ef  ab			plb
$1d:c9f0  41 1e		 eor ($1e,x)
$1d:c9f2  0b			phd
$1d:c9f3  31 77		 and ($77),y
$1d:c9f5  19 bb a9	  ora $a9bb,y
$1d:c9f8  12 aa		 ora ($aa)
$1d:c9fa  42 10		 wdm #$10
$1d:c9fc  01 02		 ora ($02,x)
$1d:c9fe  b3 15		 lda ($15,s),y
$1d:ca00  70 3b		 bvs $ca3d
$1d:ca02  89 64 08	  bit #$0864
$1d:ca05  00 5b		 brk #$5b
$1d:ca07  04 b5		 tsb $b5
$1d:ca09  06 33		 asl $33
$1d:ca0b  ce 42 f0	  dec $f042
$1d:ca0e  25 9c		 and $9c
$1d:ca10  80 90		 bra $c9a2
$1d:ca12  f2 1e		 sbc ($1e)
$1d:ca14  9e 3c f2	  stz $f23c,x
$1d:ca17  6f 97 ba 11   adc $11ba97
$1d:ca1b  60			rts
$1d:ca1c  84 58		 sty $58
$1d:ca1e  61 17		 adc ($17,x)
$1d:ca20  08			php
$1d:ca21  45 c6		 eor $c6
$1d:ca23  11 62		 ora ($62),y
$1d:ca25  84 58		 sty $58
$1d:ca27  e1 17		 sbc ($17,x)
$1d:ca29  28			plp
$1d:ca2a  45 ce		 eor $ce
$1d:ca2c  11 64		 ora ($64),y
$1d:ca2e  84 59		 sty $59
$1d:ca30  61 17		 adc ($17,x)
$1d:ca32  48			pha
$1d:ca33  45 d6		 eor $d6
$1d:ca35  11 66		 ora ($66),y
$1d:ca37  84 59		 sty $59
$1d:ca39  e1 17		 sbc ($17,x)
$1d:ca3b  68			pla
$1d:ca3c  45 de		 eor $de
$1d:ca3e  11 68		 ora ($68),y
$1d:ca40  84 5a		 sty $5a
$1d:ca42  61 17		 adc ($17,x)
$1d:ca44  88			dey
$1d:ca45  45 e6		 eor $e6
$1d:ca47  11 6a		 ora ($6a),y
$1d:ca49  84 5a		 sty $5a
$1d:ca4b  e1 17		 sbc ($17,x)
$1d:ca4d  a8			tay
$1d:ca4e  45 ec		 eor $ec
$1d:ca50  bf f8 08 46   lda $4608f8,x
$1d:ca54  06 11		 asl $11
$1d:ca56  90 84		 bcc $c9dc
$1d:ca58  64 61		 stz $61
$1d:ca5a  18			clc
$1d:ca5b  28			plp
$1d:ca5c  46 0e		 lsr $0e
$1d:ca5e  11 92		 ora ($92),y
$1d:ca60  84 64		 sty $64
$1d:ca62  e1 18		 sbc ($18,x)
$1d:ca64  48			pha
$1d:ca65  46 16		 lsr $16
$1d:ca67  11 94		 ora ($94),y
$1d:ca69  84 65		 sty $65
$1d:ca6b  61 18		 adc ($18,x)
$1d:ca6d  68			pla
$1d:ca6e  46 1e		 lsr $1e
$1d:ca70  11 96		 ora ($96),y
$1d:ca72  84 65		 sty $65
$1d:ca74  e1 18		 sbc ($18,x)
$1d:ca76  88			dey
$1d:ca77  46 26		 lsr $26
$1d:ca79  11 98		 ora ($98),y
$1d:ca7b  84 66		 sty $66
$1d:ca7d  61 18		 adc ($18,x)
$1d:ca7f  a8			tay
$1d:ca80  46 2e		 lsr $2e
$1d:ca82  11 9a		 ora ($9a),y
$1d:ca84  84 66		 sty $66
$1d:ca86  cb			wai
$1d:ca87  de a0 ef	  dec $efa0,x
$1d:ca8a  db			stp
$1d:ca8b  fc f5 0f	  jsr ($0ff5,x)
$1d:ca8e  f3 d4		 sbc ($d4,s),y
$1d:ca90  c2 35		 rep #$35
$1d:ca92  4f f3 d5 d2   eor $d2d5f3
$1d:ca96  35 6f		 and $6f,x
$1d:ca98  f2 a4		 sbc ($a4)
$1d:ca9a  6a			ror a
$1d:ca9b  a9 00 c0	  lda #$c000
$1d:ca9e  0c 10 18	  tsb $1810
$1d:caa1  5e fa 00	  lsr $00fa,x
$1d:caa4  2d b0 e4	  and $e4b0
$1d:caa7  78			sei
$1d:caa8  d0 8d		 bne $ca37
$1d:caaa  bc 23 71	  ldy $7123,x
$1d:caad  08			php
$1d:caae  e3 c2		 sbc $c2,s
$1d:cab0  39 10 8d	  and $8d10,y
$1d:cab3  cc 23 75	  cpy $7523
$1d:cab6  08			php
$1d:cab7  e4 c2		 cpx $c2
$1d:cab9  39 50 8d	  and $8d50,y
$1d:cabc  dd 23 77	  cmp $7723,x
$1d:cabf  08			php
$1d:cac0  e5 d2		 sbc $d2
$1d:cac2  0a			asl a
$1d:cac3  81 ba		 sta ($ba,x)
$1d:cac5  a4 6e		 ldy $6e
$1d:cac7  69 1c aa	  adc #$aa1c
$1d:caca  47 26		 eor [$26]
$1d:cacc  91 b8		 sta ($b8),y
$1d:cace  a4 6d		 ldy $6d
$1d:cad0  e9 1c 8a	  sbc #$8a1c
$1d:cad3  47 1e		 eor [$1e]
$1d:cad5  91 b6		 sta ($b6),y
$1d:cad7  a4 06		 ldy $06
$1d:cad9  83 8c		 sta $8c,s
$1d:cadb  67 07		 adc [$07]
$1d:cadd  fa			plx
$1d:cade  f9 21 1d	  sbc $1d21,y
$1d:cae1  58			cli
$1d:cae2  47 5a		 eor [$5a]
$1d:cae4  11 e5		 ora ($e5),y
$1d:cae6  84 79		 sty $79
$1d:cae8  a1 1d		 lda ($1d,x)
$1d:caea  78			sei
$1d:caeb  47 62		 eor [$62]
$1d:caed  11 e7		 ora ($e7),y
$1d:caef  84 7a		 sty $7a
$1d:caf1  21 1d		 and ($1d,x)
$1d:caf3  98			tya
$1d:caf4  47 6a		 eor [$6a]
$1d:caf6  11 e9		 ora ($e9),y
$1d:caf8  84 7a		 sty $7a
$1d:cafa  a1 1d		 lda ($1d,x)
$1d:cafc  ba			tsx
$1d:cafd  47 6e		 eor [$6e]
$1d:caff  11 eb		 ora ($eb),y
$1d:cb01  a4 25		 ldy $25
$1d:cb03  03 b5		 ora $b5,s
$1d:cb05  48			pha
$1d:cb06  ec d2 3d	  cpx $3dd2
$1d:cb09  54 8f 4d	  mvn $4d,$8f
$1d:cb0c  23 b1		 and $b1,s
$1d:cb0e  48			pha
$1d:cb0f  eb			xba
$1d:cb10  d2 3d		 cmp ($3d)
$1d:cb12  14 8f		 trb $8f
$1d:cb14  3d 23 ad	  and $ad23,x
$1d:cb17  48			pha
$1d:cb18  ea			nop
$1d:cb19  d2 3c		 cmp ($3c)
$1d:cb1b  d4 83		 pei ($83)
$1d:cb1d  e0 00 03	  cpx #$0300
$1d:cb20  e8			inx
$1d:cb21  ff 1b 64 23   sbc $23641b,x
$1d:cb25  eb			xba
$1d:cb26  08			php
$1d:cb27  fb			xce
$1d:cb28  42 2d		 wdm #$2d
$1d:cb2a  b0 8b		 bcs $cab7
$1d:cb2c  74 23		 stz $23,x
$1d:cb2e  ef 08 fc 42   sbc $42fc08
$1d:cb32  2d f0 8c	  and $8cf0
$1d:cb35  64 23		 stz $23
$1d:cb37  f3 08		 sbc ($08,s),y
$1d:cb39  fd 32 6a	  sbc $6a32,x
$1d:cb3c  90 d6		 bcc $cb14
$1d:cb3e  06 41		 asl $41
$1d:cb40  d2 3f		 cmp ($3f)
$1d:cb42  14 8f		 trb $8f
$1d:cb44  bd 23 19	  lda $1923,x
$1d:cb47  48			pha
$1d:cb48  b7 d2		 lda [$d2],y
$1d:cb4a  3e d4 8f	  rol $8fd4,x
$1d:cb4d  ad 22 dd	  lda $dd22
$1d:cb50  48			pha
$1d:cb51  5e 01 c8	  lsr $c801,x
$1d:cb54  2f 81 90 c4   and $c49081
$1d:cb58  3c 82 fb	  bit $fb82,x
$1d:cb5b  08			php
$1d:cb5c  bf 62 2f b8   lda $b82f62,x
$1d:cb60  8b			phb
$1d:cb61  f4 22 ff	  pea $ff22
$1d:cb64  08			php
$1d:cb65  ce 62 2f	  dec $2f62
$1d:cb68  f8			sed
$1d:cb69  8c e0 9d	  sty $9de0
$1d:cb6c  81 dd		 sta ($dd,x)
$1d:cb6e  48			pha
$1d:cb6f  ce 52 2f	  dec $2f52
$1d:cb72  fc 8c e7	  jsr ($e78c,x)
$1d:cb75  22 ff 48 bf   jsl $bf48ff
$1d:cb79  52 2f		 eor ($2f)
$1d:cb7b  bc 8b f7	  ldy $f78b,x
$1d:cb7e  21 f0		 and ($f0,x)
$1d:cb80  0f 40 5b 03   ora $035b40
$1d:cb84  d0 3e		 bne $cbc4
$1d:cb86  98			tya
$1d:cb87  8b			phb
$1d:cb88  6e 22 dd	  ror $dd22
$1d:cb8b  88			dey
$1d:cb8c  fa			plx
$1d:cb8d  e2 3e		 sep #$3e
$1d:cb8f  d8			cld
$1d:cb90  8b			phb
$1d:cb91  7e 23 19	  ror $1923,x
$1d:cb94  88			dey
$1d:cb95  fb			xce
$1d:cb96  e2 18		 sep #$18
$1d:cb98  40			rti
$1d:cb99  ca			dex
$1d:cb9a  1c 47 e7	  trb $e747
$1d:cb9d  11 fa		 ora ($fa),y
$1d:cb9f  0b			phd
$1d:cba0  33 24		 and ($24,s),y
$1d:cba2  b9 05 a0	  lda $a005,y
$1d:cba5  fc f2 31	  jsr ($31f2,x)
$1d:cba8  9c 8b 7f	  stz $7f8b
$1d:cbab  23 f1		 and $f1,s
$1d:cbad  c8			iny
$1d:cbae  fb			xce
$1d:cbaf  f2 2d		 sbc ($2d)
$1d:cbb1  dc 8b 6f	  jml [$6f8b]
$1d:cbb4  23 ed		 and $ed,s
$1d:cbb6  c8			iny
$1d:cbb7  5c 03 d0 3c   jml $3cd003
$1d:cbbb  8b			phb
$1d:cbbc  31 7a		 and ($7a),y
$1d:cbbe  07 97		 ora [$97]
$1d:cbc0  11 e6		 ora ($e6),y
$1d:cbc2  c4 75		 cpy $75
$1d:cbc4  71 1d		 adc ($1d),y
$1d:cbc6  6c 47 9f	  jmp ($9f47)
$1d:cbc9  11 e8		 ora ($e8),y
$1d:cbcb  c4 75		 cpy $75
$1d:cbcd  f1 1d		 sbc ($1d),y
$1d:cbcf  8c 47 a7	  sty $a747
$1d:cbd2  11 ea		 ora ($ea),y
$1d:cbd4  c4 76		 cpy $76
$1d:cbd6  71 1d		 adc ($1d),y
$1d:cbd8  ac 47 af	  ldy $af47
$1d:cbdb  91 eb		 sta ($eb),y
$1d:cbdd  c4 76		 cpy $76
$1d:cbdf  f9 09 40	  sbc $4009,y
$1d:cbe2  f5 72		 sbc $72,x
$1d:cbe4  3d 3c 8e	  and $8e3c,x
$1d:cbe7  d7 23		 cmp [$23],y
$1d:cbe9  b3 c8		 lda ($c8,s),y
$1d:cbeb  f4 72 3c	  pea $3c72
$1d:cbee  fc 8e c7	  jsr ($c78e,x)
$1d:cbf1  23 af		 and $af,s
$1d:cbf3  c8			iny
$1d:cbf4  f3 72		 sbc ($72,s),y
$1d:cbf6  3c bc 8e	  bit $8ebc,x
$1d:cbf9  b7 23		 lda [$23],y
$1d:cbfb  aa			tax
$1d:cbfc  16 6c		 asl $6c,x
$1d:cbfe  46 db		 lsr $db
$1d:cc00  11 c6		 ora ($c6),y
$1d:cc02  c4 3d		 cpy $3d
$1d:cc04  01 70		 ora ($70,x)
$1d:cc06  1c 7c 47	  trb $477c
$1d:cc09  23 11		 and $11,s
$1d:cc0b  b7 c4		 lda [$c4],y
$1d:cc0d  6e 31 1c	  ror $1c31
$1d:cc10  9c 47 2b	  stz $2b47
$1d:cc13  11 b9		 ora ($b9),y
$1d:cc15  c4 6e		 cpy $6e
$1d:cc17  b1 1c		 lda ($1c),y
$1d:cc19  be 47 2f	  ldx $2f47,y
$1d:cc1c  11 bb		 ora ($bb),y
$1d:cc1e  e4 35		 cpx $35
$1d:cc20  03 95		 ora $95,s
$1d:cc22  c8			iny
$1d:cc23  e4 f2		 cpx $f2
$1d:cc25  37 5c		 and [$5c],y
$1d:cc27  8d cf 21	  sta $21cf
$1d:cc2a  be 1c 7e	  ldx $7e1c,y
$1d:cc2d  46 e3		 lsr $e3
$1d:cc2f  91 b7		 sta ($b7),y
$1d:cc31  e4 71		 cpx $71
$1d:cc33  b9 1b 67	  lda $671b,y
$1d:cc36  48			pha
$1d:cc37  9d 04 e6	  sta $e604,x
$1d:cc3a  14 8d		 trb $8d
$1d:cc3c  54 23 54	  mvn $54,$23
$1d:cc3f  97 04		 sta [$04],y
$1d:cc41  48			pha
$1d:cc42  26 c1		 rol $c1
$1d:cc44  1a			inc a
$1d:cc45  03 31		 ora $31,s
$1d:cc47  d4 1c		 pei ($1c)
$1d:cc49  cf 53 88 7a   cmp $7a8853
$1d:cc4d  01 d0		 ora ($d0,x)
$1d:cc4f  b5 7c		 lda $7c,x
$1d:cc51  8d 59 cc	  sta $cc59
$1d:cc54  b9 0f 60	  lda $600f,y
$1d:cc57  d4 84		 pei ($84)
$1d:cc59  cc 04 67	  cpy $6704
$1d:cc5c  30 57		 bmi $ccb5
$1d:cc5e  b5 23		 lda $23,x
$1d:cc60  75 08		 adc $08,x
$1d:cc62  dd 52 39	  cmp $3952,x
$1d:cc65  50 86		 bvc $cbed
$1d:cc67  c0 32		 cpy #$32
$1d:cc69  81 b0		 sta ($b0,x)
$1d:cc6b  0c e0 6e	  tsb $6ee0
$1d:cc6e  06 5f		 asl $5f
$1d:cc70  91 96		 sta ($96),y
$1d:cc72  e4 61		 cpx $61
$1d:cc74  f9 18 6e	  sbc $6e18,y
$1d:cc77  46 57		 lsr $57
$1d:cc79  91 94		 sta ($94),y
$1d:cc7b  e4 61		 cpx $61
$1d:cc7d  79 18 4e	  adc $4e18,y
$1d:cc80  46 6f		 lsr $6f
$1d:cc82  91 9a		 sta ($9a),y
$1d:cc84  e4 62		 cpx $62
$1d:cc86  f9 18 ae	  sbc $ae18,y
$1d:cc89  46 67		 lsr $67
$1d:cc8b  91 98		 sta ($98),y
$1d:cc8d  e4 62		 cpx $62
$1d:cc8f  58			cli
$1d:cc90  40			rti
$1d:cc91  af 67 79 f9   lda $f97967
$1d:cc95  1e 22 fe	  asl $fe22,x
$1d:cc98  0e d5 23	  asl $23d5
$1d:cc9b  d5 08		 cmp $08,x
$1d:cc9d  4c 06 a8	  jmp $a806
$1d:cca0  12 9c		 ora ($9c)
$1d:cca2  8b			phb
$1d:cca3  bf 22 ed c8   lda $c8ed22,x
$1d:cca7  b3 f2		 lda ($f2,s),y
$1d:cca9  2c dc 8b	  bit $8bdc
$1d:ccac  af 22 e9 c8   lda $c8e922
$1d:ccb0  b2 f2		 lda ($f2)
$1d:ccb2  2c 9c 8b	  bit $8b9c
$1d:ccb5  df 22 f5 c8   cmp $c8f522,x
$1d:ccb9  b5 f2		 lda $f2,x
$1d:ccbb  2d 5c 8b	  and $8b5c
$1d:ccbe  cf 22 f1 c8   cmp $c8f122
$1d:ccc2  b4 f2		 ldy $f2,x
$1d:ccc4  2d 02 77	  and $7702
$1d:ccc7  fa			plx
$1d:ccc8  3c 46 d8	  bit $d846,x
$1d:cccb  25 85		 and $85
$1d:cccd  b7 b1		 lda [$b1],y
$1d:cccf  fd ad 94	  sbc $94ad,x
$1d:ccd2  8b			phb
$1d:ccd3  e0 54		 cpx #$54
$1d:ccd5  5d 02 d6	  eor $d602,x
$1d:ccd8  f7 ff		 sbc [$ff],y
$1d:ccda  84 3d		 sty $3d
$1d:ccdc  be 7c 85	  ldx $857c,y
$1d:ccdf  60			rts
$1d:cce0  f2 15		 sbc ($15)
$1d:cce2  02 16		 cop #$16
$1d:cce4  f1 ff		 sbc ($ff),y
$1d:cce6  94 3c		 sty $3c,x
$1d:cce8  44 9e 41	  mvp $41,$9e
$1d:cceb  68			pla
$1d:ccec  1a			inc a
$1d:cced  48			pha
$1d:ccee  ad e7 ff	  lda $ffe7
$1d:ccf1  48			pha
$1d:ccf2  7a			ply
$1d:ccf3  87 d6		 sta [$d6]
$1d:ccf5  5e c3 f6	  lsr $f6c3,x
$1d:ccf8  a7 b9		 lda [$b9]
$1d:ccfa  5c 03 04 00   jml $000403
$1d:ccfe  0c 80 3b	  tsb $3b80
$1d:cd01  fc 01 e1	  jsr ($e101,x)
$1d:cd04  1f 11 78 cf   ora $cf7811,x
$1d:cd08  c8			iny
$1d:cd09  9e 55 f3	  stz $f355,x
$1d:cd0c  37 9d		 and [$9d],y
$1d:cd0e  fd 11 e9	  sbc $e911,x
$1d:cd11  9f 55 7c 02   sta $027c55,x
$1d:cd15  09 04		 ora #$04
$1d:cd17  59 cc 16	  eor $16cc,y
$1d:cd1a  0d 02 80	  ora $8002
$1d:cd1d  c0 55		 cpy #$55
$1d:cd1f  8e cc 16	  stx $16cc
$1d:cd22  c9 2b		 cmp #$2b
$1d:cd24  1e 3b 01	  asl $013b,x
$1d:cd27  94 b6		 sty $b6,x
$1d:cd29  46 7a		 lsr $7a
$1d:cd2b  ac 9a 6c	  ldy $6c9a
$1d:cd2e  62 20 fb	  per $c851
$1d:cd31  05 64		 ora $64
$1d:cd33  d1 5f		 cmp ($5f),y
$1d:cd35  83 18		 sta $18,s
$1d:cd37  56 34		 lsr $34,x
$1d:cd39  1e 0d 0a	  asl $0a0d,x
$1d:cd3c  8c be e5	  sty $e5be
$1d:cd3f  b0 52		 bcs $cd93
$1d:cd41  40			rti
$1d:cd42  5c 36 12 41   jml $411236
$1d:cd46  21 1d		 and ($1d,x)
$1d:cd48  83 4d		 sta $4d,s
$1d:cd4a  1d 44 e9	  ora $e944,x
$1d:cd4d  36 72		 rol $72,x
$1d:cd4f  3a			dec a
$1d:cd50  00 92		 brk #$92
$1d:cd52  84 c9		 sty $c9
$1d:cd54  32 b2		 and ($b2)
$1d:cd56  b0 e2		 bcs $cd3a
$1d:cd58  f1 38		 sbc ($38),y
$1d:cd5a  a4 4d		 ldy $4d
$1d:cd5c  d6 4d		 dec $4d,x
$1d:cd5e  c6 a2		 dec $a2
$1d:cd60  c6 e3		 dec $e3
$1d:cd62  91 b3		 sta ($b3),y
$1d:cd64  a0 4a		 ldy #$4a
$1d:cd66  ff bc 69 64   sbc $6469bc,x
$1d:cd6a  51 ea		 eor ($ea),y
$1d:cd6c  8f c1 88 c6   sta $c688c1
$1d:cd70  e6 73		 inc $73
$1d:cd72  69 b4		 adc #$b4
$1d:cd74  d2 38		 cmp ($38)
$1d:cd76  05 48		 ora $48
$1d:cd78  c5 2a		 cmp $2a
$1d:cd7a  31 19		 and ($19),y
$1d:cd7c  88			dey
$1d:cd7d  4b			phk
$1d:cd7e  53 61		 eor ($61,s),y
$1d:cd80  37 8c		 and [$8c],y
$1d:cd82  41 60		 eor ($60,x)
$1d:cd84  8c 91 4a	  sty $4a91
$1d:cd87  05 2d		 ora $2d
$1d:cd89  2e 11 89	  rol $8911
$1d:cd8c  aa			tax
$1d:cd8d  6c 25 f1	  jmp ($f125)
$1d:cd90  02 39		 cop #$39
$1d:cd92  51 d7		 eor ($d7),y
$1d:cd94  00 fc		 brk #$fc
$1d:cd96  05 42		 ora $42
$1d:cd98  96 8a		 stx $8a,y
$1d:cd9a  8e a8 04	  stx $04a8
$1d:cd9d  b0 ae		 bcs $cd4d
$1d:cd9f  5c 50 2c 58   jml $582c50
$1d:cda3  8c 46 a8	  sty $a846
$1d:cda6  20 b1 a0	  jsr $a0b1
$1d:cda9  31 08		 and ($08),y
$1d:cdab  5a			phy
$1d:cdac  11 18		 ora ($18),y
$1d:cdae  7c 32 21	  jmp ($2132,x)
$1d:cdb1  12 a4		 ora ($a4)
$1d:cdb3  8b			phb
$1d:cdb4  06 90		 asl $90
$1d:cdb6  d4 21		 pei ($21)
$1d:cdb8  60			rts
$1d:cdb9  46 61		 lsr $61
$1d:cdbb  d0 d7		 bne $cd94
$1d:cdbd  78			sei
$1d:cdbe  4f 07 81 23   eor $238107
$1d:cdc2  9d ae 03	  sta $03ae,x
$1d:cdc5  a7 d3		 lda [$d3]
$1d:cdc7  7d 24 94	  adc $9424,x
$1d:cdca  ac 4d 31	  ldy $314d
$1d:cdcd  fb			xce
$1d:cdce  fd c1 47	  sbc $47c1,x
$1d:cdd1  20 2b 23	  jsr $232b
$1d:cdd4  90 05		 bcc $cddb
$1d:cdd6  00 fa		 brk #$fa
$1d:cdd8  32 d1		 and ($d1)
$1d:cdda  0c 4a 43	  tsb $434a
$1d:cddd  53 a9		 eor ($a9,s),y
$1d:cddf  84 c2		 sty $c2
$1d:cde1  49 0b		 eor #$0b
$1d:cde3  86 99		 stx $99
$1d:cde5  58			cli
$1d:cde6  62 27 b0	  per $7e10
$1d:cde9  a3 c3		 lda $c3,s
$1d:cdeb  47 c6		 eor [$c6]
$1d:cded  51 78		 eor ($78),y
$1d:cdef  b0 34		 bcs $ce25
$1d:cdf1  06 26		 asl $26
$1d:cdf3  cf 28 9c 52   cmp $529c28
$1d:cdf7  27 16		 and [$16]
$1d:cdf9  a0 8f		 ldy #$8f
$1d:cdfb  48			pha
$1d:cdfc  de 91 68	  dec $6891,x
$1d:cdff  dc 72 36	  jml [$3672]
$1d:ce02  00 00		 brk #$00
$1d:ce04  68			pla
$1d:ce05  45 cf		 eor $cf
$1d:ce07  00 41		 brk #$41
$1d:ce09  23 d8		 and $d8,s
$1d:ce0b  35 45		 and $45,x
$1d:ce0d  e0 0f		 cpx #$0f
$1d:ce0f  d0 88		 bne $cd99
$1d:ce11  a2 01		 ldx #$01
$1d:ce13  1e 27 b0	  asl $b027,x
$1d:ce16  00 92		 brk #$92
$1d:ce18  2c 9a 82	  bit $829a
$1d:ce1b  9f 10 00 25   sta $250010,x
$1d:ce1f  dc 14 2d	  jml [$2d14]
$1d:ce22  50 78		 bvc $ce9c
$1d:ce24  05 26		 ora $26
$1d:ce26  94 a9		 sty $a9,x
$1d:ce28  6a			ror a
$1d:ce29  52 fc		 eor ($fc)
$1d:ce2b  56 a3		 lsr $a3,x
$1d:ce2d  4b			phk
$1d:ce2e  5c b5 2d 84   jml $842db5
$1d:ce32  8a			txa
$1d:ce33  85 80		 sta $80
$1d:ce35  3b			tsc
$1d:ce36  da			phx
$1d:ce37  3a			dec a
$1d:ce38  54 47 7c	  mvn $7c,$47
$1d:ce3b  1b			tcs
$1d:ce3c  d1 de		 cmp ($de),y
$1d:ce3e  f1 72		 sbc ($72),y
$1d:ce40  c1 1e		 cmp ($1e,x)
$1d:ce42  01 de		 ora ($de,x)
$1d:ce44  f5 d5		 sbc $d5,x
$1d:ce46  11 22		 ora ($22),y
$1d:ce48  01 de		 ora ($de,x)
$1d:ce4a  f6 55		 inc $55,x
$1d:ce4c  91 2a		 sta ($2a),y
$1d:ce4e  40			rti
$1d:ce4f  3f 0c 22 54   and $54220c,x
$1d:ce53  00 be		 brk #$be
$1d:ce55  5a			phy
$1d:ce56  62 3d f2	  per $c096
$1d:ce59  73 c2		 adc ($c2,s),y
$1d:ce5b  a9 05		 lda #$05
$1d:ce5d  99 82 41	  sta $4182,y
$1d:ce60  60			rts
$1d:ce61  50 19		 bvc $ce7c
$1d:ce63  d9 26 10	  cmp $1026,y
$1d:ce66  c0 0a		 cpy #$0a
$1d:ce68  29 23		 and #$23
$1d:ce6a  a0 24		 ldy #$24
$1d:ce6c  b2 19		 lda ($19)
$1d:ce6e  12 41		 ora ($41)
$1d:ce70  81 23		 sta ($23,x)
$1d:ce72  21 90		 and ($90,x)
$1d:ce74  03 11		 ora $11,s
$1d:ce76  f0 4b		 beq $cec3
$1d:ce78  36 9e		 rol $9e,x
$1d:ce7a  81 61		 sta ($61,x)
$1d:ce7c  66 81		 ror $81
$1d:ce7e  54 62 dd	  mvn $dd,$62
$1d:ce81  14 10		 trb $10
$1d:ce83  21 b0		 and ($b0,x)
$1d:ce85  7d 90 28	  adc $2890,x
$1d:ce88  c1 24		 cmp ($24,x)
$1d:ce8a  aa			tax
$1d:ce8b  09 1a		 ora #$1a
$1d:ce8d  64 26		 stz $26
$1d:ce8f  b3 69		 lda ($69,s),y
$1d:ce91  b4 be		 ldy $be,x
$1d:ce93  20 b3 89	  jsr $89b3
$1d:ce96  0c c7 89	  tsb $89c7
$1d:ce99  c4 99		 cpy $99
$1d:ce9b  48			pha
$1d:ce9c  9d 8e b3	  sta $b38e,x
$1d:ce9f  58			cli
$1d:cea0  bc 4e 57	  ldy $574e,x
$1d:cea3  c5 e3		 cmp $e3
$1d:cea5  4b			phk
$1d:cea6  22 8e a7 88   jsl $88a78e
$1d:ceaa  c6 e6		 dec $e6
$1d:ceac  6f b0 9a 47   adc $479ab0
$1d:ceb0  1a			inc a
$1d:ceb1  42 c3		 wdm #$c3
$1d:ceb3  39 4a 24	  and $244a,y
$1d:ceb6  25 af		 and $af
$1d:ceb8  b0 9b		 bcs $ce55
$1d:ceba  c6 28		 dec $28
$1d:cebc  01 f0		 ora ($f0,x)
$1d:cebe  8a			txa
$1d:cebf  44 db 64	  mvp $64,$db
$1d:cec2  79 07 d1	  adc $d107,y
$1d:cec5  9e 02 37	  stz $3702,x
$1d:cec8  1c 8d 91	  trb $918d
$1d:cecb  c8			iny
$1d:cecc  7e c8 91	  ror $91c8,x
$1d:cecf  88			dey
$1d:ced0  15 c8		 ora $c8,x
$1d:ced2  9e e9 a0	  stz $a0e9,x
$1d:ced5  8c 19 c2	  sty $c219
$1d:ced8  95 10		 sta $10,x
$1d:ceda  2f c1 f4 09   and $09f4c1
$1d:cede  e1 4b		 sbc ($4b,x)
$1d:cee0  8c 3e 14	  sty $143e
$1d:cee3  ec 28 d0	  cpx $d028
$1d:cee6  33 90		 and ($90,s),y
$1d:cee8  21 67		 and ($67,x)
$1d:ceea  66 73		 ror $73
$1d:ceec  34 85		 bit $85,x
$1d:ceee  29 a6		 and #$a6
$1d:cef0  cf 80 3c 92   cmp $923c80
$1d:cef4  30 00		 bmi $cef6
$1d:cef6  10 f6		 bpl $ceee
$1d:cef8  23 c8		 and $c8,s
$1d:cefa  3f e1 e4 72   and $72e4e1,x
$1d:cefe  17 fb		 ora [$fb],y
$1d:cf00  4f 5f ea 67   eor $67ea5f
$1d:cf04  13 b8		 ora ($b8,s),y
$1d:cf06  c4 a9		 cpy $a9
$1d:cf08  34 13		 bit $13,x
$1d:cf0a  40			rti
$1d:cf0b  c6 a8		 dec $a8
$1d:cf0d  30 f8		 bmi $cf07
$1d:cf0f  62 dc 4c	  per $1bee
$1d:cf12  e2 fb		 sep #$fb
$1d:cf14  0a			asl a
$1d:cf15  49 e0		 eor #$e0
$1d:cf17  5e a1 0e	  lsr $0ea1,x
$1d:cf1a  86 b1		 stx $b1
$1d:cf1c  c2 44		 rep #$44
$1d:cf1e  b7 17		 lda [$17],y
$1d:cf20  a9 1f		 lda #$1f
$1d:cf22  41 f6		 eor ($f6,x)
$1d:cf24  43 82		 eor $82,s
$1d:cf26  64 05		 stz $05
$1d:cf28  7c 0c 28	  jmp ($280c,x)
$1d:cf2b  d0 05		 bne $cf32
$1d:cf2d  9b			txy
$1d:cf2e  8c e2 af	  sty $afe2
$1d:cf31  67 62		 adc [$62]
$1d:cf33  8f f5 6a 11   sta $116af5
$1d:cf37  50 32		 bvc $cf6b
$1d:cf39  55 41		 eor $41,x
$1d:cf3b  a1 14		 lda ($14,x)
$1d:cf3d  62 88 80	  per $4fc8
$1d:cf40  22 cf 63 92   jsl $9263cf
$1d:cf44  d1 df		 cmp ($df),y
$1d:cf46  a1 1c		 lda ($1c,x)
$1d:cf48  8b			phb
$1d:cf49  c4 e2		 cpy $e2
$1d:cf4b  91 32		 sta ($32),y
$1d:cf4d  a8			tay
$1d:cf4e  cf 1b a1 20   cmp $20a11b
$1d:cf52  80 d1		 bra $cf25
$1d:cf54  c1 a0		 cmp ($a0,x)
$1d:cf56  f1 08		 sbc ($08),y
$1d:cf58  dc 72 36	  jml [$3672]
$1d:cf5b  05 09		 ora $09
$1d:cf5d  e3 0c		 sbc $0c,s
$1d:cf5f  8a			txa
$1d:cf60  61 5f		 adc ($5f,x)
$1d:cf62  86 00		 stx $00
$1d:cf64  49 e8		 eor #$e8
$1d:cf66  35 46		 and $46,x
$1d:cf68  92 51		 sta ($51)
$1d:cf6a  cd c2 b8	  cmp $b8c2
$1d:cf6d  10 28		 bpl $cf97
$1d:cf6f  21 80		 and ($80,x)
$1d:cf71  40			rti
$1d:cf72  28			plp
$1d:cf73  b1 3f		 lda ($3f),y
$1d:cf75  4a			lsr a
$1d:cf76  60			rts
$1d:cf77  91 a7		 sta ($a7),y
$1d:cf79  4a			lsr a
$1d:cf7a  49 9a		 eor #$9a
$1d:cf7c  21 0f		 and ($0f,x)
$1d:cf7e  c5 4b		 cmp $4b
$1d:cf80  51 81		 eor ($81),y
$1d:cf82  d8			cld
$1d:cf83  ca			dex
$1d:cf84  22 8d 09 18   jsl $18098d
$1d:cf88  48			pha
$1d:cf89  63 12		 adc $12,s
$1d:cf8b  55 3a		 eor $3a,x
$1d:cf8d  26 c8		 rol $c8
$1d:cf8f  42 52		 wdm #$52
$1d:cf91  14 3a		 trb $3a
$1d:cf93  22 8e 00 ef   jsl $ef008e
$1d:cf97  0b			phd
$1d:cf98  3b			tsc
$1d:cf99  91 d1		 sta ($d1),y
$1d:cf9b  22 ef 08 10   jsl $1008ef
$1d:cf9f  c4 9e		 cpy $9e
$1d:cfa1  d3 1d		 cmp ($1d,s),y
$1d:cfa3  63 a0		 adc $a0,s
$1d:cfa5  4d 41 e8	  eor $e841
$1d:cfa8  d7 40		 cmp [$40],y
$1d:cfaa  5a			phy
$1d:cfab  89 60		 bit #$60
$1d:cfad  19 23 7f	  ora $7f23,y
$1d:cfb0  12 a8		 ora ($a8)
$1d:cfb2  fe 3f a0	  inc $a03f,x
$1d:cfb5  a8			tay
$1d:cfb6  19 4b bc	  ora $bc4b,y
$1d:cfb9  22 e2 28 0e   jsl $0e28e2
$1d:cfbd  1d 76 2f	  ora $2f76,x
$1d:cfc0  13 72		 ora ($72,s),y
$1d:cfc2  38			sec
$1d:cfc3  14 1d		 trb $1d
$1d:cfc5  e1 65		 sbc ($65,x)
$1d:cfc7  88			dey
$1d:cfc8  c6 d2		 dec $d2
$1d:cfca  41 ac		 eor ($ac,x)
$1d:cfcc  8f 47 f5 b1   sta $b1f547
$1d:cfd0  48			pha
$1d:cfd1  9a			txs
$1d:cfd2  a8			tay
$1d:cfd3  51 e3		 eor ($e3),y
$1d:cfd5  19 88 28	  ora $2888,y
$1d:cfd8  82 39 26	  brl $f614
$1d:cfdb  93 ad		 sta ($ad,s),y
$1d:cfdd  41 72		 eor ($72,x)
$1d:cfdf  49 f2		 eor #$f2
$1d:cfe1  8c 2c 82	  sty $822c
$1d:cfe4  30 b7		 bmi $cf9d
$1d:cfe6  06 28		 asl $28
$1d:cfe8  32 49		 and ($49)
$1d:cfea  5e 8c a0	  lsr $a08c,x
$1d:cfed  5b			tcd
$1d:cfee  83 28		 sta $28,s
$1d:cff0  e2 0b		 sep #$0b
$1d:cff2  fe 39 5b	  inc $5b39,x
$1d:cff5  ef 9e 38 f1   sbc $f1389e
$1d:cff9  f1 57		 sbc ($57),y
$1d:cffb  8e fd 08	  stx $08fd
$1d:cffe  08			php
$1d:cfff  53 4e		 eor ($4e,s),y
$1d:d001  81 57		 sta ($57,x)
$1d:d003  c2 3e		 rep #$3e
$1d:d005  19 f3 2f	  ora $2ff3,y
$1d:d008  92 0e		 sta ($0e)
$1d:d00a  26 83		 rol $83
$1d:d00c  d8			cld
$1d:d00d  dc 5c 8e	  jml [$8e5c]
$1d:d010  b1 48		 lda ($48),y
$1d:d012  9a			txs
$1d:d013  e0 e2 14	  cpx #$14e2
$1d:d016  08			php
$1d:d017  ba			tsx
$1d:d018  e4 e2		 cpx $e2
$1d:d01a  d1 c8		 cmp ($c8),y
$1d:d01c  db			stp
$1d:d01d  20 e3 14	  jsr $14e3
$1d:d020  88			dey
$1d:d021  8b			phb
$1d:d022  24 e2		 bit $e2
$1d:d024  4e a3 6c	  lsr $6ca3
$1d:d027  8d 02 32	  sta $3202
$1d:d02a  d9 38 d3	  cmp $d338,y
$1d:d02d  65 4e		 adc $4e
$1d:d02f  99 47 86	  sta $8647,y
$1d:d032  1d 60 e0	  ora $e060,x
$1d:d035  54 78 6a	  mvn $6a,$78
$1d:d038  0f 22 d0 e2   ora $e2d022
$1d:d03c  2b			pld
$1d:d03d  95 0a		 sta $0a,x
$1d:d03f  2d 41 87	  and $8741
$1d:d042  a3 aa		 lda $aa,s
$1d:d044  2b			pld
$1d:d045  41 a4		 eor ($a4,x)
$1d:d047  87 a0		 sta [$a0]
$1d:d049  70 54		 bvs $d09f
$1d:d04b  91 6b		 sta ($6b),y
$1d:d04d  1a			inc a
$1d:d04e  56 be		 lsr $be,x
$1d:d050  3d 11 41	  and $4111,x
$1d:d053  01 18		 ora ($18,x)
$1d:d055  76 04		 ror $04,x
$1d:d057  ec 25 80	  cpx $8025
$1d:d05a  78			sei
$1d:d05b  92 90		 sta ($90)
$1d:d05d  6c 67 a3	  jmp ($a367)
$1d:d060  1f 09 70 a0   ora $a07009,x
$1d:d064  53 36		 eor ($36,s),y
$1d:d066  0b			phd
$1d:d067  1d a2 ea	  ora $eaa2,x
$1d:d06a  52 3e		 eor ($3e)
$1d:d06c  0b			phd
$1d:d06d  5d a2 2b	  eor $2ba2,x
$1d:d070  52 16		 eor ($16)
$1d:d072  0b			phd
$1d:d073  9d a3 2c	  sta $2ca3,x
$1d:d076  52 89		 eor ($89)
$1d:d078  2f 65 aa 51   and $51aa65
$1d:d07c  a1 68		 lda ($68,x)
$1d:d07e  d4 9e		 pei ($9e)
$1d:d080  0f 01 80 3e   ora $3e8001
$1d:d084  06 8f		 asl $8f
$1d:d086  50 00		 bvc $d088
$1d:d088  37 f6		 and [$f6],y
$1d:d08a  a9 00 a8	  lda #$a800
$1d:d08d  7f ea 8f f0   adc $f08fea,x
$1d:d091  ac 54 c2	  ldy $c254
$1d:d094  4a			lsr a
$1d:d095  fa			plx
$1d:d096  0a			asl a
$1d:d097  cd 40 1c	  cmp $1c40
$1d:d09a  35 42		 and $42,x
$1d:d09c  13 c0		 ora ($c0,s),y
$1d:d09e  03 e2		 ora $e2,s
$1d:d0a0  1f 24 a3 0a   ora $0aa324,x
$1d:d0a4  d8			cld
$1d:d0a5  47 c4		 eor [$c4]
$1d:d0a7  3f 2a 7a 4d   and $4d7a2a,x
$1d:d0ab  05 66		 ora $66
$1d:d0ad  0d 03 15	  ora $1503
$1d:d0b0  56 a0		 lsr $a0,x
$1d:d0b2  21 90		 and ($90,x)
$1d:d0b4  41 18		 eor ($18,x)
$1d:d0b6  cc 85 63	  cpy $6385
$1d:d0b9  50 77		 bvc $d132
$1d:d0bb  94 86		 sty $86,x
$1d:d0bd  63 c4		 adc $c4,s
$1d:d0bf  e2 4c		 sep #$4c
$1d:d0c1  a4 52		 ldy $52
$1d:d0c3  48			pha
$1d:d0c4  c4 01		 cpy $01
$1d:d0c6  1e 15 3a	  asl $3a15,x
$1d:d0c9  3d 47 f6	  and $f647,x
$1d:d0cc  8d 07 b1	  sta $b107
$1d:d0cf  c0 64 30	  cpy #$3064
$1d:d0d2  05 d8		 ora $d8
$1d:d0d4  c5 2a		 cmp $2a
$1d:d0d6  75 95		 adc $95,x
$1d:d0d8  80 ac		 bra $d086
$1d:d0da  0e 52 bb	  asl $bb52
$1d:d0dd  28			plp
$1d:d0de  e4 5d		 cpx $5d
$1d:d0e0  58			cli
$1d:d0e1  21 20		 and ($20,x)
$1d:d0e3  60			rts
$1d:d0e4  90 28		 bcc $d10e
$1d:d0e6  17 63		 ora [$63],y
$1d:d0e8  18			clc
$1d:d0e9  a0 45 e2	  ldy #$e245
$1d:d0ec  71 48		 adc ($48),y
$1d:d0ee  99 d0 02	  sta $02d0,y
$1d:d0f1  e6 bb		 inc $bb
$1d:d0f3  14 13		 trb $13
$1d:d0f5  2e 81 04	  rol $0481
$1d:d0f8  f3 d1		 sbc ($d1,s),y
$1d:d0fa  32 20		 and ($20)
$1d:d0fc  9c 4a a7	  stz $a74a
$1d:d0ff  36 48		 rol $48,x
$1d:d101  a8			tay
$1d:d102  22 ce c3 00   jsl $00c3ce
$1d:d106  5a			phy
$1d:d107  15 48		 ora $48,x
$1d:d109  04 86		 tsb $86
$1d:d10b  73 ff		 adc ($ff,s),y
$1d:d10d  a7 40		 lda [$40]
$1d:d10f  94 28		 sty $28,x
$1d:d111  28			plp
$1d:d112  69 13 a0	  adc #$a013
$1d:d115  42 0e		 wdm #$0e
$1d:d117  68			pla
$1d:d118  41 f3		 eor ($f3,x)
$1d:d11a  9a			txs
$1d:d11b  14 72		 trb $72
$1d:d11d  6b			rtl
$1d:d11e  52 34		 eor ($34)
$1d:d120  29 28 c9	  and #$c928
$1d:d123  a1 fd		 lda ($fd,x)
$1d:d125  6d 1a ec	  adc $ec1a
$1d:d128  4b			phk
$1d:d129  28			plp
$1d:d12a  e8			inx
$1d:d12b  55 5f		 eor $5f,x
$1d:d12d  af 3d 9b ed   lda $ed9b3d
$1d:d131  ee 07 ac	  inc $ac07
$1d:d134  f5 0c		 sbc $0c,x
$1d:d136  70 14		 bvs $d14c
$1d:d138  30 0c		 bmi $d146
$1d:d13a  56 8e		 lsr $8e,x
$1d:d13c  96 30		 stx $30,y
$1d:d13e  30 97		 bmi $d0d7
$1d:d140  d6 8f		 dec $8f,x
$1d:d142  50 04		 bvc $d148
$1d:d144  18			clc
$1d:d145  5c 01 fc 7f   jml $7ffc01
$1d:d149  5a			phy
$1d:d14a  d8			cld
$1d:d14b  5d 91 ea	  eor $ea91,x
$1d:d14e  94 00		 sty $00,x
$1d:d150  c2 a7		 rep #$a7
$1d:d152  d9 4c 61	  cmp $614c,y
$1d:d155  64 6f		 stz $6f
$1d:d157  41 73		 eor ($73,x)
$1d:d159  cd be 7e	  cmp $7ebe
$1d:d15c  f6 f5		 inc $f5,x
$1d:d15e  cf 51 bd ff   cmp $ffbd51
$1d:d162  47 63		 eor [$63]
$1d:d164  2f db 37 fd   and $fd37db
$1d:d168  26 0f		 rol $0f
$1d:d16a  f4 02 08	  pea $0802
$1d:d16d  00 10		 brk #$10
$1d:d16f  d4 68		 pei ($68)
$1d:d171  32 fa		 and ($fa)
$1d:d173  88			dey
$1d:d174  db			stp
$1d:d175  ce 60 70	  dec $7060
$1d:d178  4c b5 c2	  jmp $c2b5
$1d:d17b  e7 72		 sbc [$72]
$1d:d17d  01 a8		 ora ($a8,x)
$1d:d17f  08			php
$1d:d180  6e 97 4c	  ror $4c97
$1d:d183  25 d2		 and $d2
$1d:d185  51 2a		 eor ($2a),y
$1d:d187  91 49		 sta ($49),y
$1d:d189  a5 b2		 lda $b2
$1d:d18b  e9 5c b2	  sbc #$b25c
$1d:d18e  3f 74 88 43   and $438874,x
$1d:d192  2e b7 5d	  rol $5db7
$1d:d195  fd d6 61	  sbc $61d6,x
$1d:d198  31 99		 and ($99),y
$1d:d19a  4c e6 b3	  jmp $b3e6
$1d:d19d  69 a4 de	  adc #$dea4
$1d:d1a0  4f 75 9d ce   eor $ce9d75
$1d:d1a4  c1 e1		 cmp ($e1,x)
$1d:d1a6  00 ba		 brk #$ba
$1d:d1a8  56 06		 lsr $06,x
$1d:d1aa  6b			rtl
$1d:d1ab  59 ba 52	  eor $52ba,y
$1d:d1ae  e9 70 38	  sbc #$3870
$1d:d1b1  0c 03 31	  tsb $3103
$1d:d1b4  b8			clv
$1d:d1b5  dc 0d 56	  jml [$560d]
$1d:d1b8  eb			xba
$1d:d1b9  53 a9		 eor ($a9,s),y
$1d:d1bb  dd 35 fc	  cmp $fc35,x
$1d:d1be  ad 79 0c	  lda $0c79
$1d:d1c1  48			pha
$1d:d1c2  60			rts
$1d:d1c3  56 11		 lsr $11,x
$1d:d1c5  d8			cld
$1d:d1c6  78			sei
$1d:d1c7  3c 17 5d	  bit $5d17,x
$1d:d1ca  bd 67 6e	  lda $6e67,x
$1d:d1cd  53 7b		 eor ($7b,s),y
$1d:d1cf  ac 03 7c	  ldy $7c03
$1d:d1d2  32 52		 and ($52)
$1d:d1d4  b2 f6		 lda ($f6)
$1d:d1d6  37 d7		 and [$d7],y
$1d:d1d8  51 9a		 eor ($9a),y
$1d:d1da  f2 b7		 sbc ($b7)
$1d:d1dc  bc b2 50	  ldy $50b2,x
$1d:d1df  d2 f9		 cmp ($f9)
$1d:d1e1  03 26		 ora $26,s
$1d:d1e3  e9 56 3a	  sbc #$3a56
$1d:d1e6  63 a1		 adc $a1,s
$1d:d1e8  26 84		 rol $84
$1d:d1ea  0c 08 d7	  tsb $d708
$1d:d1ed  2b			pld
$1d:d1ee  ba			tsx
$1d:d1ef  28			plp
$1d:d1f0  b2 f7		 lda ($f7)
$1d:d1f2  5d 72 c1	  eor $c172,x
$1d:d1f5  d3 47		 cmp ($47,s),y
$1d:d1f7  74 16		 stz $16,x
$1d:d1f9  83 01		 sta $01,s
$1d:d1fb  67 5a		 adc [$5a]
$1d:d1fd  bd 62 30	  lda $3062,x
$1d:d200  29 64 c0	  and #$c064
$1d:d203  cb			wai
$1d:d204  65 9a		 adc $9a
$1d:d206  04 d6		 tsb $d6
$1d:d208  2a			rol a
$1d:d209  ba			tsx
$1d:d20a  70 32		 bvs $d23e
$1d:d20c  c3 c0		 cmp $c0,s
$1d:d20e  cb			wai
$1d:d20f  e5 dc		 sbc $dc
$1d:d211  04 e6		 tsb $e6
$1d:d213  2a			rol a
$1d:d214  7b			tdc
$1d:d215  30 63		 bmi $d27a
$1d:d217  6e fc d0	  ror $d0fc
$1d:d21a  28			plp
$1d:d21b  59 4a 37	  eor $374a,y
$1d:d21e  05 28		 ora $28
$1d:d220  c1 21		 cmp ($21,x)
$1d:d222  80 f7		 bra $d21b
$1d:d224  a3 dd		 lda $dd,s
$1d:d226  22 01 81 60   jsl $608101
$1d:d22a  3c ee 79	  bit $79ee,x
$1d:d22d  75 8b		 adc $8b,x
$1d:d22f  45 27		 eor $27
$1d:d231  ec c1 66	  cpx $66c1
$1d:d234  83 94		 sta $94,s
$1d:d236  cd a2 e9	  cmp $e9a2
$1d:d239  14 e0		 trb $e0
$1d:d23b  8f d7 93 c9   sta $c993d7
$1d:d23f  67 83		 adc [$83]
$1d:d241  68			pla
$1d:d242  05 c6		 ora $c6
$1d:d244  4f 46 d8 52   eor $52d846
$1d:d248  f1 b8		 sbc ($b8),y
$1d:d24a  41 f1		 eor ($f1,x)
$1d:d24c  34 41		 bit $41,x
$1d:d24e  aa			tax
$1d:d24f  6e b0 26	  ror $26b0
$1d:d252  86 cc		 stx $cc
$1d:d254  5c 54 0a 0d   jml $0d0a54
$1d:d258  08			php
$1d:d259  aa			tax
$1d:d25a  83 d0		 sta $d0,s
$1d:d25c  fd 0f 8a	  sbc $8a0f,x
$1d:d25f  91 49		 sta ($49),y
$1d:d261  ab			plb
$1d:d262  19 4e e9	  ora $e94e,y
$1d:d265  57 81		 eor [$81],y
$1d:d267  03 41		 ora $41,s
$1d:d269  ac 35 4a	  ldy $4a35
$1d:d26c  4d 29 ae	  eor $ae29
$1d:d26f  77 5a		 adc [$5a],y
$1d:d271  7c 42 8f	  jmp ($8f42,x)
$1d:d274  75 70		 adc $70,x
$1d:d276  86 5d		 stx $5d
$1d:d278  04 29		 tsb $29
$1d:d27a  f1 cb		 sbc ($cb),y
$1d:d27c  8f 46 2d 3f   sta $3f2d46
$1d:d280  1f 12 49 e9   ora $e94912,x
$1d:d284  7d 02 69	  adc $6902,x
$1d:d287  a0 85 ce	  ldy #$ce85
$1d:d28a  6d c0 df	  adc $dfc0
$1d:d28d  0f 40 c4 29   ora $29c440
$1d:d291  21 31		 and ($31,x)
$1d:d293  0e 58 9a	  asl $9a58
$1d:d296  3b			tsc
$1d:d297  ee 8a fb	  inc $fb8a
$1d:d29a  07 02		 ora [$02]
$1d:d29c  4a			lsr a
$1d:d29d  11 fb		 ora ($fb),y
$1d:d29f  9e 41 2e	  stz $2e41,x
$1d:d2a2  03 a1		 ora $a1,s
$1d:d2a4  a5 e5		 lda $e5
$1d:d2a6  c0 64 c6	  cpy #$c664
$1d:d2a9  21 70		 and ($70,x)
$1d:d2ab  65 9d		 adc $9d
$1d:d2ad  e4 d5		 cpx $d5
$1d:d2af  23 21		 and $21,s
$1d:d2b1  74 5f		 stz $5f,x
$1d:d2b3  9b			txy
$1d:d2b4  be 27 0d	  ldx $0d27,y
$1d:d2b7  d3 a1		 cmp ($a1,s),y
$1d:d2b9  d0 09		 bne $d2c4
$1d:d2bb  37 41		 and [$41],y
$1d:d2bd  da			phx
$1d:d2be  06 10		 asl $10
$1d:d2c0  ba			tsx
$1d:d2c1  bb			tyx
$1d:d2c2  03 c0		 ora $c0,s
$1d:d2c4  54 33 b8	  mvn $b8,$33
$1d:d2c7  3b			tsc
$1d:d2c8  00 58		 brk #$58
$1d:d2ca  50 07		 bvc $d2d3
$1d:d2cc  60			rts
$1d:d2cd  3c 95 d8	  bit $d895,x
$1d:d2d0  29 70 81	  and #$8170
$1d:d2d3  d9 2c b6	  cmp $b62c,y
$1d:d2d6  4b			phk
$1d:d2d7  9d c8 c6	  sta $c6c8,x
$1d:d2da  b7 13		 lda [$13],y
$1d:d2dc  18			clc
$1d:d2dd  5d 22 10	  eor $1022,x
$1d:d2e0  c3 8d		 cmp $8d,s
$1d:d2e2  dd 62 d1	  cmp $d162,x
$1d:d2e5  44 0d dd	  mvp $dd,$0d
$1d:d2e8  28			plp
$1d:d2e9  94 54		 sty $54,x
$1d:d2eb  88			dey
$1d:d2ec  24 26		 bit $26
$1d:d2ee  ea			nop
$1d:d2ef  92 b4		 sta ($b4)
$1d:d2f1  98			tya
$1d:d2f2  23 ef		 and $ef,s
$1d:d2f4  79 bf df	  adc $dfbf,y
$1d:d2f7  c0 8c 8c	  cpy #$8c8c
$1d:d2fa  64 33		 stz $33
$1d:d2fc  08			php
$1d:d2fd  70 19		 bvs $d318
$1d:d2ff  e1 b4		 sbc ($b4,x)
$1d:d301  67 db		 adc [$db]
$1d:d303  4b			phk
$1d:d304  38			sec
$1d:d305  01 81		 ora ($81,x)
$1d:d307  aa			tax
$1d:d308  52 69		 eor ($69)
$1d:d30a  45 32		 eor $32
$1d:d30c  ab			plb
$1d:d30d  dd 69 7c	  cmp $7c69,x
$1d:d310  8e 4d d4	  stx $d44d
$1d:d313  66 34		 ror $34
$1d:d315  8a			txa
$1d:d316  4d 58 46	  eor $4658
$1d:d319  54 f2 e0	  mvn $e0,$f2
$1d:d31c  d5 cb		 cmp $cb,x
$1d:d31e  82 f1 9a	  brl $6e12
$1d:d321  5d 3c 34	  eor $343c,x
$1d:d324  34 b0		 bit $b0,x
$1d:d326  10 87		 bpl $d2af
$1d:d328  c4 38		 cpy $38
$1d:d32a  00 a3		 brk #$a3
$1d:d32c  7f 8b c8 5f   adc $5fc88b,x
$1d:d330  e3 96		 sbc $96,s
$1d:d332  0c f8 29	  tsb $29f8
$1d:d335  aa			tax
$1d:d336  15 1a		 ora $1a,x
$1d:d338  90 56		 bcc $d390
$1d:d33a  18			clc
$1d:d33b  33 01		 and ($01,s),y
$1d:d33d  05 94		 ora $94
$1d:d33f  30 df		 bmi $d320
$1d:d341  10 f1		 bpl $d334
$1d:d343  d9 45 0f	  cmp $0f45,y
$1d:d346  f1 17		 sbc ($17),y
$1d:d348  05 92		 ora $92
$1d:d34a  86 a9		 stx $a9
$1d:d34c  a3 c1		 lda $c1,s
$1d:d34e  58			cli
$1d:d34f  ca			dex
$1d:d350  60			rts
$1d:d351  29 a0 d0	  and #$d0a0
$1d:d354  df ef f7 6a   cmp $6af7ef,x
$1d:d358  09 aa dd	  ora #$ddaa
$1d:d35b  6c b6 42	  jmp ($42b6)
$1d:d35e  fc 9a 05	  jsr ($059a,x)
$1d:d361  c3 8d		 cmp $8d,s
$1d:d363  11 69		 ora ($69),y
$1d:d365  67 02		 adc [$02]
$1d:d367  00 ef		 brk #$ef
$1d:d369  f0 07		 beq $d372
$1d:d36b  84 7c		 sty $7c
$1d:d36d  45 f0		 eor $f0
$1d:d36f  0a			asl a
$1d:d370  c0 d4 eb	  cpy #$ebd4
$1d:d373  22 cf 12 35   jsl $3512cf
$1d:d377  67 11		 adc [$11]
$1d:d379  8c 2b 86	  sty $862b
$1d:d37c  24 97		 bit $97
$1d:d37e  39 0c 51	  and $510c,y
$1d:d381  9c 32 24	  stz $2432
$1d:d384  b9 c9 62	  lda $62c9,y
$1d:d387  ce e1 93	  dec $93e1
$1d:d38a  1d d7 4f	  ora $4fd7,x
$1d:d38d  95 cb		 sta $cb,x
$1d:d38f  1d 67 4c	  ora $4c67,x
$1d:d392  73 4a		 adc ($4a,s),y
$1d:d394  4f 5a fb 1b   eor $1bfb5a
$1d:d398  da			phx
$1d:d399  fe e8 f7	  inc $f7e8,x
$1d:d39c  cf 82 bc 37   cmp $37bc82
$1d:d3a0  e2 cf		 sep #$cf
$1d:d3a2  1e f9 3b	  asl $3bf9,x
$1d:d3a5  cb			wai
$1d:d3a6  fe 70 f4	  inc $f470,x
$1d:d3a9  0f a4 bd 47   ora $47bda4
$1d:d3ad  eb			xba
$1d:d3ae  4f 62 fb 5b   eor $5bfb62
$1d:d3b2  dc fe f8	  jml [$f8fe]
$1d:d3b5  f0 4f		 beq $d406
$1d:d3b7  86 bc		 stx $bc
$1d:d3b9  57 e3		 eor [$e3],y
$1d:d3bb  cf 26 f9 7b   cmp $7bf926
$1d:d3bf  cd fe 80	  cmp $80fe
$1d:d3c2  f4 8f a8	  pea $a88f
$1d:d3c5  bd 67 ec	  lda $ec67,x
$1d:d3c8  4f 6a fb 9b   eor $9bfb6a
$1d:d3cc  de fe 08	  dec $08fe,x
$1d:d3cf  f0 cf		 beq $d3a0
$1d:d3d1  8a			txa
$1d:d3d2  bc 77 e4	  ldy $e477,x
$1d:d3d5  cf 2e f9 bb   cmp $bbf92e
$1d:d3d9  cf fe 90 f5   cmp $f590fe
$1d:d3dd  0f ac bd 87   ora $87bdac
$1d:d3e1  ed 4f 72	  sbc $724f
$1d:d3e4  fb			xce
$1d:d3e5  db			stp
$1d:d3e6  c0 fe 18	  cpy #$18fe
$1d:d3e9  f1 24		 sbc ($24),y
$1d:d3eb  d6 06		 dec $06,x
$1d:d3ed  a3 e8		 lda $e8,s
$1d:d3ef  ac 56 45	  ldy $4556
$1d:d3f2  93 e8		 sta ($e8,s),y
$1d:d3f4  ac fc 07	  ldy $07fc
$1d:d3f7  53 59		 eor ($59,s),y
$1d:d3f9  c4 63		 cpy $63
$1d:d3fb  0a			asl a
$1d:d3fc  e1 89		 sbc ($89,x)
$1d:d3fe  25 ce		 and $ce
$1d:d400  43 14		 eor $14,s
$1d:d402  67 0c		 adc [$0c]
$1d:d404  89 2e 72	  bit #$722e
$1d:d407  58			cli
$1d:d408  b3 b8		 lda ($b8,s),y
$1d:d40a  64 c7		 stz $c7
$1d:d40c  75 58		 adc $58,x
$1d:d40e  e9 8d 40	  sbc #$408d
$1d:d411  f7 63		 sbc [$63],y
$1d:d413  51 1d		 eor ($1d),y
$1d:d415  c2 93		 rep #$93
$1d:d417  d6 be		 dec $be,x
$1d:d419  c6 f6		 dec $f6
$1d:d41b  bf ba 3d f3   lda $f33dba,x
$1d:d41f  e0 af 0d	  cpx #$0daf
$1d:d422  f8			sed
$1d:d423  b3 c7		 lda ($c7,s),y
$1d:d425  be 4e f2	  ldx $f24e,y
$1d:d428  ff 9c 3d 03   sbc $033d9c,x
$1d:d42c  e9 2f 51	  sbc #$512f
$1d:d42f  fa			plx
$1d:d430  d3 d8		 cmp ($d8,s),y
$1d:d432  be d6 f7	  ldx $f7d6,y
$1d:d435  3f be 3c 13   and $133cbe,x
$1d:d439  e1 af		 sbc ($af,x)
$1d:d43b  15 f8		 ora $f8,x
$1d:d43d  f3 c9		 sbc ($c9,s),y
$1d:d43f  be 5e f3	  ldx $f35e,y
$1d:d442  7f a0 3d 23   adc $233da0,x
$1d:d446  ea			nop
$1d:d447  2f 59 fb 13   and $13fb59
$1d:d44b  da			phx
$1d:d44c  be e6 f7	  ldx $f7e6,y
$1d:d44f  bf 82 3c 33   lda $333c82,x
$1d:d453  e2 af		 sep #$af
$1d:d455  1d f9 33	  ora $33f9,x
$1d:d458  cb			wai
$1d:d459  be 6e f3	  ldx $f36e,y
$1d:d45c  ff a4 3d 43   sbc $433da4,x
$1d:d460  eb			xba
$1d:d461  2f 61 fb 53   and $53fb61
$1d:d465  dc be f6	  jml [$f6be]
$1d:d468  f7 fb		 sbc [$fb],y
$1d:d46a  5d 30 97	  eor $9730,x
$1d:d46d  47 fc		 eor [$fc]
$1d:d46f  c3 20		 cmp $20,s
$1d:d471  17 5b		 ora [$5b],y
$1d:d473  ed d5 ff	  sbc $ffd5
$1d:d476  33 b0		 and ($b0,s),y
$1d:d478  78			sei
$1d:d479  5f 42 43 58   eor $584342,x
$1d:d47d  1a			inc a
$1d:d47e  8f a2 b1 59   sta $59b1a2
$1d:d482  7f 85 2e 01   adc $012e85,x
$1d:d486  01 be		 ora ($be,x)
$1d:d488  e6 38		 inc $38
$1d:d48a  dc 71 b8	  jml [$b871]
$1d:d48d  d6 7e		 dec $7e,x
$1d:d48f  03 a2		 ora $a2,s
$1d:d491  a9 c0		 lda #$c0
$1d:d493  35 f5		 and $f5,x
$1d:d495  9d 7f 3b	  sta $3b7f,x
$1d:d498  9f 59 c4 63   sta $63c459,x
$1d:d49c  0a			asl a
$1d:d49d  e1 89		 sbc ($89,x)
$1d:d49f  1d 8f 82	  ora $828f,x
$1d:d4a2  01 b7		 ora ($b7,x)
$1d:d4a4  ac ed fa	  ldy $faed
$1d:d4a7  dd 7a ce	  cmp $ce7a,x
$1d:d4aa  43 14		 eor $14,s
$1d:d4ac  67 0c		 adc [$0c]
$1d:d4ae  88			dey
$1d:d4af  ec 77 d0	  cpx $d077
$1d:d4b2  01 c8		 ora ($c8,x)
$1d:d4b4  56 1f		 lsr $1f,x
$1d:d4b6  e1 59		 sbc ($59,x)
$1d:d4b8  c9 62		 cmp #$62
$1d:d4ba  ce e1 93	  dec $93e1
$1d:d4bd  35 99		 and $99,x
$1d:d4bf  24 0e		 bit $0e
$1d:d4c1  42 35		 wdm #$35
$1d:d4c3  21 a8		 and ($a8,x)
$1d:d4c5  0e c7 91	  asl $91c7
$1d:d4c8  00 2b		 brk #$2b
$1d:d4ca  06 25		 asl $25
$1d:d4cc  07 36		 ora [$36]
$1d:d4ce  07 fe		 ora [$fe]
$1d:d4d0  d7 df		 cmp [$df],y
$1d:d4d2  fa			plx
$1d:d4d3  4e 09 e7	  lsr $e709
$1d:d4d6  7b			tdc
$1d:d4d7  be c0 19	  ldx $19c0,y
$1d:d4da  db			stp
$1d:d4db  18			clc
$1d:d4dc  1f e6 9e 0a   ora $0a9ee6,x
$1d:d4e0  bf b7 dc d0   lda $d0dcb7,x
$1d:d4e4  1a			inc a
$1d:d4e5  9b			txy
$1d:d4e6  58			cli
$1d:d4e7  15 2b		 ora $2b,x
$1d:d4e9  4f f2 f9 9c   eor $9cf9f2
$1d:d4ed  03 53		 ora $53,s
$1d:d4ef  a5 8f		 lda $8f
$1d:d4f1  81 fe		 sta ($fe,x)
$1d:d4f3  4e 84 79	  lsr $7984
$1d:d4f6  fb			xce
$1d:d4f7  fa			plx
$1d:d4f8  21 80		 and ($80,x)
$1d:d4fa  f1 af		 sbc ($af),y
$1d:d4fc  03 ca		 ora $ca,s
$1d:d4fe  18			clc
$1d:d4ff  fe 46 30	  inc $3046,x
$1d:d502  cf 2b b3 86   cmp $86b32b
$1d:d506  30 b2		 bmi $d4ba
$1d:d508  11 da		 ora ($da),y
$1d:d50a  0e 70 a7	  asl $a770
$1d:d50d  d7 05		 cmp [$05],y
$1d:d50f  e2 ee		 sep #$ee
$1d:d511  66 b0		 ror $b0
$1d:d513  8f d3 92 29   sta $2992d3
$1d:d517  7b			tdc
$1d:d518  05 86		 ora $86
$1d:d51a  c4 34		 cpy $34
$1d:d51c  86 b0		 stx $b0
$1d:d51e  d7 ec		 cmp [$ec],y
$1d:d520  76 71		 ror $71,x
$1d:d522  f9 0a 5e	  sbc $5e0a,y
$1d:d525  81 41		 sta ($41,x)
$1d:d527  a1 15		 lda ($15,x)
$1d:d529  6e 91 49	  ror $4991
$1d:d52c  ab			plb
$1d:d52d  19 62 c2	  ora $c262,y
$1d:d530  53 0a		 eor ($0a,s),y
$1d:d532  a5 26		 lda $26
$1d:d534  94 52		 sty $52,x
$1d:d536  02 98		 cop #$98
$1d:d538  22 52 c6 63   jsl $63c652
$1d:d53c  04 10		 tsb $10
$1d:d53e  98			tya
$1d:d53f  80 c6		 bra $d507
$1d:d541  08			php
$1d:d542  94 6b		 sty $6b,x
$1d:d544  0a			asl a
$1d:d545  48			pha
$1d:d546  50 b6		 bvc $d4fe
$1d:d548  82 14 ad	  brl $825f
$1d:d54b  a4 85		 ldy $85
$1d:d54d  4b			phk
$1d:d54e  02 f1		 cop #$f1
$1d:d550  41 08		 eor ($08,x)
$1d:d552  d2 4f		 cmp ($4f)
$1d:d554  88			dey
$1d:d555  86 6b		 stx $6b
$1d:d557  02 24		 cop #$24
$1d:d559  bd 7e a0	  lda $a07e,x
$1d:d55c  20 7b 0b	  jsr $0b7b
$1d:d55f  09 5f		 ora #$5f
$1d:d561  44 97 cf	  mvp $cf,$97
$1d:d564  e4 14		 cpx $14
$1d:d566  0f a2 21 11   ora $1121a2
$1d:d56a  07 e3		 ora [$e3]
$1d:d56c  f1 09		 sbc ($09),y
$1d:d56e  03 c8		 ora $c8,s
$1d:d570  58			cli
$1d:d571  47 f1		 eor [$f1]
$1d:d573  da			phx
$1d:d574  2d 23 40	  and $4023
$1d:d577  b5 22		 lda $22,x
$1d:d579  10 1c		 bpl $d597
$1d:d57b  64 2f		 stz $2f
$1d:d57d  29 f9		 and #$f9
$1d:d57f  f0 60		 beq $d5e1
$1d:d581  f4 b8 31	  pea $31b8
$1d:d584  5e f3 95	  lsr $95f3,x
$1d:d587  7c e9 5e	  jmp ($5ee9,x)
$1d:d58a  e1 1a		 sbc ($1a,x)
$1d:d58c  c8			iny
$1d:d58d  49 5f		 eor #$5f
$1d:d58f  d3 7e		 cmp ($7e,s),y
$1d:d591  ac f5 ef	  ldy $eff5
$1d:d594  b3 bd		 lda ($bd,s),y
$1d:d596  bd b6 1b	  lda $1bb6,x
$1d:d599  0d 8a a9	  ora $a98a
$1d:d59c  49 a5		 eor #$a5
$1d:d59e  58			cli
$1d:d59f  1d e2 82	  ora $82e2,x
$1d:d5a2  4b			phk
$1d:d5a3  1d 8e cf	  ora $cf8e,x
$1d:d5a6  48			pha
$1d:d5a7  a4 d5		 ldy $d5
$1d:d5a9  ab			plb
$1d:d5aa  ef f1 41 25   sbc $2541f1
$1d:d5ae  4c 1e 0f	  jmp $0f1e
$1d:d5b1  21 07		 and ($07,x)
$1d:d5b3  88			dey
$1d:d5b4  e1 1d		 sbc ($1d,x)
$1d:d5b6  c4 02		 cpy $02
$1d:d5b8  17 ad		 ora [$ad],y
$1d:d5ba  bc 84 0b	  ldy $0b84,x
$1d:d5bd  03 ef		 ora $ef,s
$1d:d5bf  27 fc		 and [$fc]
$1d:d5c1  02 0f		 cop #$0f
$1d:d5c3  53 83		 eor ($83,s),y
$1d:d5c5  14 6f		 trb $6f
$1d:d5c7  39 4f ce	  and $ce4f,y
$1d:d5ca  94 6e		 sty $6e,x
$1d:d5cc  11 ac		 ora ($ac),y
$1d:d5ce  84 94		 sty $94
$1d:d5d0  7d 2b ea	  adc $ea2b,x
$1d:d5d3  6f 5b fb 23   adc $23fb5b
$1d:d5d7  db			stp
$1d:d5d8  3e ea 20	  rol $20ea,x
$1d:d5db  00 08		 brk #$08
$1d:d5dd  81 40		 sta ($40,x)
$1d:d5df  1d e9 44	  ora $44e9,x
$1d:d5e2  86 d1		 stx $d1
$1d:d5e4  21 94		 and ($94,x)
$1d:d5e6  48			pha
$1d:d5e7  ed 12 39	  sbc $3912
$1d:d5ea  04 80		 tsb $80
$1d:d5ec  3f c2 89 1b   and $1b89c2,x
$1d:d5f0  a2 46 a2	  ldx #$a246
$1d:d5f3  d4 08		 pei ($08)
$1d:d5f5  b5 06		 lda $06,x
$1d:d5f7  2d 50 8b	  and $8b50
$1d:d5fa  54 62 d4	  mvn $d4,$62
$1d:d5fd  28			plp
$1d:d5fe  b5 0e		 lda $0e,x
$1d:d600  2d 52 8b	  and $8b52
$1d:d603  54 df e5	  mvn $e5,$df
$1d:d606  04 8d		 tsb $8d
$1d:d608  41 23		 eor ($23,x)
$1d:d60a  70 48		 bvs $d654
$1d:d60c  64 12		 stz $12
$1d:d60e  1b			tcs
$1d:d60f  04 7f		 tsb $7f
$1d:d611  04 76		 tsb $76
$1d:d613  09 0e		 ora #$0e
$1d:d615  82 4b e0	  brl $b663
$1d:d618  91 e1		 sta ($e1),y
$1d:d61a  48			pha
$1d:d61b  51 25		 eor ($25),y
$1d:d61d  74 49		 stz $49,x
$1d:d61f  55 12		 eor $12,x
$1d:d621  77 44		 adc [$44],y
$1d:d623  9d 3f ce	  sta $ce3f,x
$1d:d626  72 ff		 adc ($ff)
$1d:d628  08			php
$1d:d629  b5 82		 lda $82,x
$1d:d62b  2d 61 8b	  and $8b61
$1d:d62e  5c 22 d7 18   jml $18d722
$1d:d632  b5 8a		 lda $8a,x
$1d:d634  2d 63 8b	  and $8b63
$1d:d637  5c a2 d7 30   jml $30d7a2
$1d:d63b  b9 80 00	  lda $0080,y
$1d:d63e  78			sei
$1d:d63f  12 a8		 ora ($a8)
$1d:d641  24 ae		 bit $ae
$1d:d643  08			php
$1d:d644  36 09		 rol $09,x
$1d:d646  dc 5b 01	  jml [$015b]
$1d:d649  16 c0		 asl $c0,x
$1d:d64b  c5 b2		 cmp $b2
$1d:d64d  11 6c		 ora ($6c),y
$1d:d64f  8c 5b 05	  sty $055b
$1d:d652  16 c1		 asl $c1,x
$1d:d654  c5 b2		 cmp $b2
$1d:d656  51 6c		 eor ($6c),y
$1d:d658  9d 12 9b	  sta $9b12,x
$1d:d65b  44 a6 51	  mvp $51,$a6
$1d:d65e  2b			pld
$1d:d65f  b4 4a		 ldy $4a,x
$1d:d661  e5 12		 sbc $12
$1d:d663  97 44		 sta [$44],y
$1d:d665  a5 51		 lda $51
$1d:d667  2b			pld
$1d:d668  74 4a		 stz $4a,x
$1d:d66a  d5 12		 cmp $12,x
$1d:d66c  92 01		 sta ($01)
$1d:d66e  1a			inc a
$1d:d66f  cd 12 b0	  cmp $b012
$1d:d672  ff 3a bd 12   sbc $12bd3a,x
$1d:d676  ac 17 34	  ldy $3417
$1d:d679  70 55		 bvs $d6d0
$1d:d67b  df e2 80 04   cmp $0480e2,x
$1d:d67f  30 56		 bmi $d6d7
$1d:d681  60			rts
$1d:d682  94 a8		 sty $a8,x
$1d:d684  25 2e		 and $2e
$1d:d686  09 5a		 ora #$5a
$1d:d688  82 56 e0	  brl $b6e1
$1d:d68b  94 c8		 sty $c8,x
$1d:d68d  25 36		 and $36
$1d:d68f  09 5c		 ora #$5c
$1d:d691  82 1d 02	  brl $d8b1
$1d:d694  db			stp
$1d:d695  44 b6 51	  mvp $51,$b6
$1d:d698  2f a0 11 b5   and $b511a0
$1d:d69c  d1 2d		 cmp ($2d),y
$1d:d69e  4f f3 b4 d1   eor $d1b4f3
$1d:d6a2  2d 14 4b	  and $4b14
$1d:d6a5  cd 12 f1	  cmp $f112
$1d:d6a8  44 b3 d1	  mvp $d1,$b3
$1d:d6ab  2c d4 4b	  bit $4bd4
$1d:d6ae  bd 12 ed	  lda $ed12,x
$1d:d6b1  04 b3		 tsb $b3
$1d:d6b3  41 2c		 eor ($2c,x)
$1d:d6b5  f0 46		 beq $d6fd
$1d:d6b7  70 5d		 bvs $d716
$1d:d6b9  e0 96 88	  cpx #$8896
$1d:d6bc  25 a6		 and $a6
$1d:d6be  09 78		 ora #$78
$1d:d6c0  82 5e 60	  brl $3721
$1d:d6c3  8b			phb
$1d:d6c4  a0 b5 85	  ldy #$85b5
$1d:d6c7  ce d9 04	  dec $04d9
$1d:d6ca  b6 bf		 ldx $bf,y
$1d:d6cc  c6 fb		 dec $fb
$1d:d6ce  44 c6 8e	  mvp $8e,$c6
$1d:d6d1  47 3a		 eor [$3a]
$1d:d6d3  3d 17 b1	  and $b117,x
$1d:d6d6  6c 22 db	  jmp ($db22)
$1d:d6d9  11 c8		 ora ($c8),y
$1d:d6db  e2 06		 sep #$06
$1d:d6dd  e7 87		 sbc [$87]
$1d:d6df  27 ab		 and [$ab]
$1d:d6e1  90 01		 bcc $d6e4
$1d:d6e3  08			php
$1d:d6e4  02 30		 cop #$30
$1d:d6e6  cd bc 06	  cmp $06bc
$1d:d6e9  09 9d		 ora #$9d
$1d:d6eb  a2 6b 5e	  ldx #$5e6b
$1d:d6ee  23 bd		 and $bd,s
$1d:d6f0  7a			ply
$1d:d6f1  8e 8a 2d	  stx $2d8a
$1d:d6f4  a3 8b		 lda $8b,s
$1d:d6f6  6c a2 db	  jmp ($dba2)
$1d:d6f9  38			sec
$1d:d6fa  b3 d8		 lda ($d8,s),y
$1d:d6fc  b6 91		 ldx $91,y
$1d:d6fe  6d a8 fc	  adc $fca8
$1d:d701  f6 d1		 inc $d1,x
$1d:d703  6d b9 1c	  adc $1cb9
$1d:d706  f7 04		 sbc [$04],y
$1d:d708  71 e5		 adc ($e5),y
$1d:d70a  45 b9		 eor $b9
$1d:d70c  71 6e		 adc ($6e),y
$1d:d70e  d4 5b		 pei ($5b)
$1d:d710  b7 16		 lda [$16],y
$1d:d712  e4 45		 cpx $45
$1d:d714  b9 31 6e	  lda $6e31,y
$1d:d717  c4 5b		 cpy $5b
$1d:d719  b2 e3		 lda ($e3)
$1d:d71b  11 80		 ora ($80),y
$1d:d71d  c1 06		 cmp ($06,x)
$1d:d71f  81 46		 sta ($46,x)
$1d:d721  37 fa		 and [$fa],y
$1d:d723  03 d2		 ora $d2,s
$1d:d725  3e a2 f5	  rol $f5a2,x
$1d:d728  9f b1 3d ab   sta $ab3db1,x
$1d:d72c  ed e5 8a	  sbc $8ae5
$1d:d72f  3b			tsc
$1d:d730  82 03 14	  brl $eb36
$1d:d733  88			dey
$1d:d734  3b			tsc
$1d:d735  c6 05		 dec $05
$1d:d737  14 81		 trb $81
$1d:d739  c5 22		 cmp $22
$1d:d73b  51 48		 eor ($48),y
$1d:d73d  9c 52 09	  stz $0952
$1d:d740  14 82		 trb $82
$1d:d742  c5 00		 cmp $00
$1d:d744  61 15		 adc ($15,x)
$1d:d746  8a			txa
$1d:d747  41 a2		 eor ($a2,x)
$1d:d749  90 78		 bcc $d7c3
$1d:d74b  a4 5a		 ldy $5a
$1d:d74d  29 17		 and #$17
$1d:d74f  8a			txa
$1d:d750  42 22		 wdm #$22
$1d:d752  90 98		 bcc $d6ec
$1d:d754  a4 62		 ldy $62
$1d:d756  29 19		 and #$19
$1d:d758  a2 4b e8	  ldx #$e84b
$1d:d75b  92 ea		 sta ($ea)
$1d:d75d  24 fe		 bit $fe
$1d:d75f  89 3e		 bit #$3e
$1d:d761  82 4b 20	  brl $f7af
$1d:d764  92 d8		 sta ($d8)
$1d:d766  24 f2		 bit $f2
$1d:d768  09 3d		 ora #$3d
$1d:d76a  82 4b a0	  brl $77b8
$1d:d76d  92 f8		 sta ($f8)
$1d:d76f  20 78 27	  jsr $2778
$1d:d772  f0 8f		 beq $d703
$1d:d774  74 23		 stz $23,x
$1d:d776  df 08 ff 42   cmp $42ff08,x
$1d:d77a  3f f0 8b a8   and $a88bf0,x
$1d:d77e  dc 7c 03	  jml [$037c]
$1d:d781  b0 7f		 bcs $d802
$1d:d783  ab			plb
$1d:d784  f8			sed
$1d:d785  24 cf		 bit $cf
$1d:d787  91 9b		 sta ($9b),y
$1d:d789  45 26		 eor $26
$1d:d78b  ef 73 27 04   sbc $042773
$1d:d78f  4e 89 4f	  lsr $4f89
$1d:d792  a2 53 a8	  ldx #$a853
$1d:d795  95 fa		 sta $fa,x
$1d:d797  25 7a		 and $7a
$1d:d799  89 2d		 bit #$2d
$1d:d79b  a2 4b 28	  ldx #$284b
$1d:d79e  93 da		 sta ($da,s),y
$1d:d7a0  20 90 29	  jsr $2990
$1d:d7a3  d0 4a		 bne $d7ef
$1d:d7a5  7c 12 bd	  jmp ($bd12,x)
$1d:d7a8  04 af		 tsb $af
$1d:d7aa  bf c6 4b 14   lda $144bc6,x
$1d:d7ae  f8			sed
$1d:d7af  45 3e		 eor $3e
$1d:d7b1  38			sec
$1d:d7b2  8f f6 23 ff   sta $ff23f6
$1d:d7b6  88			dey
$1d:d7b7  f7 62		 sbc [$62],y
$1d:d7b9  3d f1 4e	  and $4ef1,x
$1d:d7bc  14 53		 trb $53
$1d:d7be  87 14		 sta [$14]
$1d:d7c0  e9 45		 sbc #$45
$1d:d7c2  3a			dec a
$1d:d7c3  64 71		 stz $71
$1d:d7c5  01 07		 ora ($07,x)
$1d:d7c7  52 29		 eor ($29)
$1d:d7c9  d5 e4		 cmp $e4,x
$1d:d7cb  7f f9 1f ee   adc $ee1ff9,x
$1d:d7cf  47 bf		 eor [$bf]
$1d:d7d1  91 ee		 sta ($ee),y
$1d:d7d3  a2 5b e8	  ldx #$e85b
$1d:d7d6  96 ea		 stx $ea,y
$1d:d7d8  25 fe		 and $fe
$1d:d7da  89 7e		 bit #$7e
$1d:d7dc  85 27		 sta $27
$1d:d7de  c2 17		 rep #$17
$1d:d7e0  0a			asl a
$1d:d7e1  d3 42		 cmp ($42,s),y
$1d:d7e3  b4 f0		 ldy $f0,x
$1d:d7e5  4b			phk
$1d:d7e6  74 12		 stz $12,x
$1d:d7e8  df 04 bf 41   cmp $41bf04,x
$1d:d7ec  2f f1 09 34   and $3409f1
$1d:d7f0  43 d3		 eor $d3,s
$1d:d7f2  10 fc		 bpl $d7f0
$1d:d7f4  44 3f 31	  mvp $31,$3f
$1d:d7f7  08			php
$1d:d7f8  14 42		 trb $42
$1d:d7fa  07 10		 ora [$10]
$1d:d7fc  fd 44 3f	  sbc $3f44,x
$1d:d7ff  71 4f		 adc ($4f),y
$1d:d801  14 53		 trb $53
$1d:d803  c7 14		 cmp [$14]
$1d:d805  f9 45 3e	  sbc $3e45,y
$1d:d808  71 4f		 adc ($4f),y
$1d:d80a  24 53		 bit $53
$1d:d80c  cb			wai
$1d:d80d  14 fa		 trb $fa
$1d:d80f  00 c7		 brk #$c7
$1d:d811  cc 01 1f	  cpy $1f01
$1d:d814  b4 53		 ldy $53,x
$1d:d816  ef 44 c7 d1   sbc $d1c744
$1d:d81a  31 d4		 and ($d4),y
$1d:d81c  4c fd 13	  jmp $13fd
$1d:d81f  3d 0a a3	  and $a30a,x
$1d:d822  c2 a9		 rep #$a9
$1d:d824  10 a9		 bpl $d7cf
$1d:d826  3c 2a 53	  bit $532a,x
$1d:d829  04 c7		 tsb $c7
$1d:d82b  41 31		 eor ($31,x)
$1d:d82d  f0 4c		 beq $d87b
$1d:d82f  f4 13 3f	  pea $3f13
$1d:d832  10 90		 bpl $d7c4
$1d:d834  44 31 71	  mvp $71,$31
$1d:d837  0c d4 43	  tsb $43d4
$1d:d83a  37 10		 and [$10],y
$1d:d83c  a2 44 24	  ldx #$2444
$1d:d83f  b1 0a		 lda ($0a),y
$1d:d841  a4 42		 ldy $42
$1d:d843  ab			plb
$1d:d844  14 e6		 trb $e6
$1d:d846  45 39		 eor $39
$1d:d848  b1 4e		 lda ($4e),y
$1d:d84a  e4 52		 cpx $52
$1d:d84c  2f 14 e7 45   and $45e714
$1d:d850  0e 41 18	  asl $1841
$1d:d853  8a			txa
$1d:d854  77 e1		 adc [$e1],y
$1d:d856  1f 51 d8 84   ora $84d851,x
$1d:d85a  06 89		 asl $89
$1d:d85c  af a2 6b a0   lda $a06ba2
$1d:d860  92 f0		 sta ($f0)
$1d:d862  d8			cld
$1d:d863  0e c8 76	  asl $76c8
$1d:d866  50 40		 bvc $d8a8
$1d:d868  d0 6b		 bne $d8d5
$1d:d86a  c3 65		 cmp $65,s
$1d:d86c  10 d5		 bpl $d843
$1d:d86e  44 35 71	  mvp $71,$35
$1d:d871  0d d4 43	  ora $43d4
$1d:d874  77 10		 adc [$10],y
$1d:d876  b2 44		 lda ($44)
$1d:d878  2c b1 0b	  bit $0bb1
$1d:d87b  a4 42		 ldy $42
$1d:d87d  6b			rtl
$1d:d87e  14 be		 trb $be
$1d:d880  45 33		 eor $33
$1d:d882  91 4c		 sta ($4c),y
$1d:d884  64 53		 stz $53
$1d:d886  59 14 cb	  eor $cb14,y
$1d:d889  c5 33		 cmp $33
$1d:d88b  11 4c		 ora ($4c),y
$1d:d88d  4c 53 32	  jmp $3253
$1d:d890  3f ea 47 82   and $8247ea,x
$1d:d894  91 f5		 sta ($f5),y
$1d:d896  2f 90 7c b1   and $b17c90
$1d:d89a  17 53		 ora [$53],y
$1d:d89c  58			cli
$1d:d89d  43 a4		 eor $a4,s
$1d:d89f  70 e9		 bvs $d88a
$1d:d8a1  24 3b		 bit $3b
$1d:d8a3  c3 0e		 cmp $0e,s
$1d:d8a5  d4 03		 pei ($03)
$1d:d8a7  d7 7f		 cmp [$7f],y
$1d:d8a9  48			pha
$1d:d8aa  f7 d2		 sbc [$d2],y
$1d:d8ac  3d d4 8f	  and $8fd4,x
$1d:d8af  fd 23 fd	  sbc $fd23,x
$1d:d8b2  0e 94 1c	  asl $1c94
$1d:d8b5  46 71		 lsr $71
$1d:d8b7  0e 9a 1b	  asl $1b9a
$1d:d8ba  c2 9c		 rep #$9c
$1d:d8bc  88			dey
$1d:d8bd  09 9d 39	  ora #$399d
$1d:d8c0  18			clc
$1d:d8c1  1b			tcs
$1d:d8c2  e8			inx
$1d:d8c3  74 8a		 stz $8a,x
$1d:d8c5  1d c4 87	  ora $87c4,x
$1d:d8c8  73 e1		 adc ($e1,s),y
$1d:d8ca  d2 14		 cmp ($14)
$1d:d8cc  c8			iny
$1d:d8cd  cc 61 d3	  cpy $d361
$1d:d8d0  2a			rol a
$1d:d8d1  74 8a		 stz $8a,x
$1d:d8d3  9d be a7	  sta $a7be,x
$1d:d8d6  73 e9		 adc ($e9,s),y
$1d:d8d8  c9 c0 98	  cmp #$98c0
$1d:d8db  43 a8		 eor $a8,s
$1d:d8dd  b0 ec		 bcs $d8cb
$1d:d8df  a4 3b		 ldy $3b
$1d:d8e1  2a			rol a
$1d:d8e2  13 18		 ora ($18,s),y
$1d:d8e4  78			sei
$1d:d8e5  4c 63 e1	  jmp $e163
$1d:d8e8  b0 a2		 bcs $d88c
$1d:d8ea  43 83		 eor $83,s
$1d:d8ec  61 44		 adc ($44,x)
$1d:d8ee  8f 53 b4 b0   sta $b0b453
$1d:d8f2  ec 35 3b	  cpx $3b35
$1d:d8f5  8b			phb
$1d:d8f6  0e cb 53	  asl $53cb
$1d:d8f9  b0 d0		 bcs $d8cb
$1d:d8fb  ed 2d 3b	  sbc $3b2d
$1d:d8fe  2d 0e 66	  and $660e
$1d:d901  06 91		 asl $91
$1d:d903  a2 09 b1	  ldx #$b109
$1d:d906  66 07		 ror $07
$1d:d908  9e 1d e8	  stz $e81d,x
$1d:d90b  87 7a		 sta [$7a]
$1d:d90d  a1 de		 lda ($de,x)
$1d:d90f  b6 38		 ldx $38,y
$1d:d911  53 b4		 eor ($b4,s),y
$1d:d913  8c b0 56	  sty $56b0
$1d:d916  84 52		 sty $52
$1d:d918  0d 14 e3	  ora $e314
$1d:d91b  45 22		 eor $22
$1d:d91d  d1 4e		 cmp ($4e),y
$1d:d91f  8b			phb
$1d:d920  bc 60 f1	  ldy $f160,x
$1d:d923  4e 83 d4	  lsr $d483
$1d:d926  61 11		 adc ($11,x)
$1d:d928  48			pha
$1d:d929  4c 53 81	  jmp $8153
$1d:d92c  14 e0		 trb $e0
$1d:d92e  b1 c7		 lda ($c7),y
$1d:d930  43 0e		 eor $0e,s
$1d:d932  d0 29		 bne $d95d
$1d:d934  44 14 0c	  mvp $0c,$14
$1d:d937  80 98		 bra $d8d1
$1d:d939  d3 81		 cmp ($81,s),y
$1d:d93b  80 d8		 bra $d915
$1d:d93d  0d 4c 3a	  ora $3a4c
$1d:d940  f7 0e		 sbc [$0e],y
$1d:d942  dc 9b ce	  jml [$ce9b]
$1d:d945  66 8d		 ror $8d
$1d:d947  0a			asl a
$1d:d948  76 a5		 ror $a5,x
$1d:d94a  d2 3b		 cmp ($3b)
$1d:d94c  9a			txs
$1d:d94d  75 ee		 adc $ee,x
$1d:d94f  28			plp
$1d:d950  50 0e		 bvc $d960
$1d:d952  3c 50 a8	  bit $a850,x
$1d:d955  1d 77 79	  ora $7977,x
$1d:d958  bf 1a 30 05   lda $05301a,x
$1d:d95c  08			php
$1d:d95d  46 f2		 lsr $f2
$1d:d95f  11 75		 ora ($75),y
$1d:d961  3b			tsc
$1d:d962  95 22		 sta $22,x
$1d:d964  eb			xba
$1d:d965  48			pha
$1d:d966  de 52 09	  dec $0952,x
$1d:d969  c1 f5		 cmp ($f5,x)
$1d:d96b  87 5e		 sta [$5e]
$1d:d96d  a1 d8		 lda ($d8,x)
$1d:d96f  58			cli
$1d:d970  76 29		 ror $29,x
$1d:d972  6a			ror a
$1d:d973  10 ec		 bpl $d961
$1d:d975  21 64		 and ($64,x)
$1d:d977  56 82		 lsr $82,x
$1d:d979  5f 0a 71 60   eor $60710a,x
$1d:d97d  32 94		 and ($94)
$1d:d97f  ec 53 fc	  cpx $fc53
$1d:d982  7d 91 42	  adc $4291,x
$1d:d985  20 9b d7	  jsr $d79b
$1d:d988  ac ff 6c	  ldy $6cff
$1d:d98b  47 d7		 eor [$d7]
$1d:d98d  11 e0		 ora ($e0),y
$1d:d98f  c4 6f		 cpy $6f
$1d:d991  31 17		 and ($17),y
$1d:d993  5e 47 83	  lsr $8347,x
$1d:d996  91 f5		 sta ($f5),y
$1d:d998  e4 23		 cpx $23
$1d:d99a  80 90		 bra $d92c
$1d:d99c  1e 04 b9	  asl $b904,x
$1d:d99f  f7 92		 sbc [$92],y
$1d:d9a1  e5 48		 sbc $48
$1d:d9a3  4f 19 34 31   eor $313419
$1d:d9a7  1f c2 68 45   ora $4568c2,x
$1d:d9ab  32 f1		 and ($f1)
$1d:d9ad  4f 6c 53 13   eor $13536c
$1d:d9b1  14 fe		 trb $fe
$1d:d9b3  91 d7		 sta ($d7),y
$1d:d9b5  ba			tsx
$1d:d9b6  4f 35 f0 22   eor $22f035
$1d:d9ba  01 10		 ora ($10,x)
$1d:d9bc  1d d4 59	  ora $59d4,x
$1d:d9bf  f7 52		 sbc [$52],y
$1d:d9c1  2d 88 4f	  and $4f88
$1d:d9c4  1f 21 48 a9   ora $a94821,x
$1d:d9c8  74 e4		 stz $e4,x
$1d:d9ca  7f 21 d1 17   adc $17d121,x
$1d:d9ce  78			sei
$1d:d9cf  63 9e		 adc $9e,s
$1d:d9d1  43 4e		 eor $4e,s
$1d:d9d3  7b			tdc
$1d:d9d4  0f 39 f4 30   ora $30f439
$1d:d9d8  07 ff		 ora [$ff]
$1d:d9da  83 b2		 sta $b2,s
$1d:d9dc  10 ac		 bpl $d98a
$1d:d9de  14 ba		 trb $ba
$1d:d9e0  52 04		 eor ($04)
$1d:d9e2  06 0e		 asl $0e
$1d:d9e4  f1 ff		 sbc ($ff),y
$1d:d9e6  94 3c		 sty $3c,x
$1d:d9e8  c3 e7		 cmp $e7,s
$1d:d9ea  2f 41 fa 53   and $53fa41
$1d:d9ee  d4 be		 pei ($be)
$1d:d9f0  b6 f6		 ldx $f6,y
$1d:d9f2  3f b6 3d d3   and $d33db6,x
$1d:d9f6  ef af 05 f8   sbc $f805af
$1d:d9fa  73 c5		 adc ($c5,s),y
$1d:d9fc  be 3e f2	  ldx $f23e,y
$1d:d9ff  7f 98 3c e3   adc $e33c98,x
$1d:da03  e8			inx
$1d:da04  2f 49 fa 93   and $93fa49
$1d:da08  d6 be		 dec $be,x
$1d:da0a  c6 f6		 dec $f6
$1d:da0c  bf ba 3d f3   lda $f33dba,x
$1d:da10  e0 af 0d	  cpx #$0daf
$1d:da13  f8			sed
$1d:da14  b3 c7		 lda ($c7,s),y
$1d:da16  be 4e f2	  ldx $f24e,y
$1d:da19  ff 9c 3d 03   sbc $033d9c,x
$1d:da1d  e9 2f 51	  sbc #$512f
$1d:da20  fa			plx
$1d:da21  d3 d8		 cmp ($d8,s),y
$1d:da23  be d6 f7	  ldx $f7d6,y
$1d:da26  3a			dec a
$1d:da27  80 00		 bra $da29
$1d:da29  08			php
$1d:da2a  80 3b		 bra $da67
$1d:da2c  d6 11		 dec $11,x
$1d:da2e  34 84		 bit $84,x
$1d:da30  49 21 13	  eor #$1321
$1d:da33  38			sec
$1d:da34  44 e6 11	  mvp $11,$e6
$1d:da37  25 84		 and $84
$1d:da39  49 a1 12	  eor #$12a1
$1d:da3c  98			tya
$1d:da3d  44 de 11	  mvp $11,$de
$1d:da40  28			plp
$1d:da41  01 8c		 ora ($8c,x)
$1d:da43  e1 fa		 sbc ($fa,x)
$1d:da45  2f a0 00 00   and $0000a0
$1d:da49  30 00		 bmi $da4b
$1d:da4b  81 18		 sta ($18,x)
$1d:da4d  0b			phd
$1d:da4e  88			dey
$1d:da4f  40			rti
$1d:da50  83 04		 sta $04,s
$1d:da52  02 08		 cop #$08
$1d:da54  c3 bd		 cmp $bd,s
$1d:da56  c1 00		 cmp ($00,x)
$1d:da58  06 00		 asl $00
$1d:da5a  60			rts
$1d:da5b  01 82		 ora ($82,x)
$1d:da5d  46 03		 lsr $03
$1d:da5f  17 e1		 ora [$e1],y
$1d:da61  40			rti
$1d:da62  61 10		 adc ($10,x)
$1d:da64  28			plp
$1d:da65  44 46 11	  mvp $11,$46
$1d:da68  12 7b		 ora ($7b)
$1d:da6a  88			dey
$1d:da6b  00 00		 brk #$00
$1d:da6d  80 04		 bra $da73
$1d:da6f  0b			phd
$1d:da70  44 22 d3	  mvp $d3,$22
$1d:da73  08			php
$1d:da74  bc 42 2f	  ldy $2f42,x
$1d:da77  20 73 95	  jsr $9573
$1d:da7a  42 25		 wdm #$25
$1d:da7c  61 73		 adc ($73,x)
$1d:da7e  0c 03 e0	  tsb $e003
$1d:da81  80 44		 bra $dac7
$1d:da83  fe 02 e1	  inc $e102,x
$1d:da86  4b			phk
$1d:da87  a1 12		 lda ($12,x)
$1d:da89  f8			sed
$1d:da8a  44 d6 11	  mvp $11,$d6
$1d:da8d  36 84		 rol $84,x
$1d:da8f  56 a1		 lsr $a1,x
$1d:da91  15 b8		 ora $b8,x
$1d:da93  44 86 11	  mvp $11,$86
$1d:da96  22 84 4c 61   jsl $614c84
$1d:da9a  13 28		 ora ($28,s),y
$1d:da9c  44 0e 11	  mvp $11,$0e
$1d:da9f  04 84		 tsb $84
$1d:daa1  44 e1 11	  mvp $11,$e1
$1d:daa4  48			pha
$1d:daa5  44 fc f6	  mvp $f6,$fc
$1d:daa8  34 f0		 bit $f0,x
$1d:daaa  b8			clv
$1d:daab  c7 21		 cmp [$21]
$1d:daad  11 d8		 ora ($d8),y
$1d:daaf  45 72		 eor $72
$1d:dab1  11 5d		 ora ($5d),y
$1d:dab3  84 53		 sty $53
$1d:dab5  21 14		 and ($14,x)
$1d:dab7  d4 d9		 pei ($d9)
$1d:dab9  9d 08 f8	  sta $f808,x
$1d:dabc  2e f7 87	  rol $87f7
$1d:dabf  42 21		 wdm #$21
$1d:dac1  f0 88		 beq $da4b
$1d:dac3  f4 22 3f	  pea $3f22
$1d:dac6  08			php
$1d:dac7  96 42		 stx $42,y
$1d:dac9  25 b0		 and $b0
$1d:dacb  89 e4 22	  bit #$22e4
$1d:dace  7a			ply
$1d:dacf  5f 50 c0 4f   eor $4fc050,x
$1d:dad3  91 e3		 sta ($e3),y
$1d:dad5  4e 49 8b	  lsr $8b49
$1d:dad8  40			rti
$1d:dad9  03 00		 ora $00,s
$1d:dadb  d4 00		 pei ($00)
$1d:dadd  c0 41 9b	  cpy #$9b41
$1d:dae0  e3 16		 sbc $16,s
$1d:dae2  71 8c		 adc ($8c),y
$1d:dae4  1d ce 31	  ora $31ce,x
$1d:dae7  77 58		 adc [$58],y
$1d:dae9  b8			clv
$1d:daea  00 10		 brk #$10
$1d:daec  0e 40 71	  asl $7140
$1d:daef  23 ec		 and $ec,s
$1d:daf1  8b			phb
$1d:daf2  00 58		 brk #$58
$1d:daf4  07 01		 ora [$01]
$1d:daf6  3e c0 0c	  rol $0cc0,x
$1d:daf9  4f b0 74 01   eor $0174b0
$1d:dafd  60			rts
$1d:dafe  1d 80 3e	  ora $3e80,x
$1d:db01  00 73		 brk #$73
$1d:db03  3e c8 7c	  rol $7cc8,x
$1d:db06  05 80		 ora $80
$1d:db08  12 11		 ora ($11)
$1d:db0a  68			pla
$1d:db0b  1c 01 09	  trb $0901
$1d:db0e  84 46		 sty $46
$1d:db10  a1 10		 lda ($10,x)
$1d:db12  a1 88		 lda ($88,x)
$1d:db14  8c 02 19	  sty $1902
$1d:db17  08			php
$1d:db18  8c 95 c4	  sty $c495
$1d:db1b  78			sei
$1d:db1c  06 e0		 asl $e0
$1d:db1e  1a			inc a
$1d:db1f  14 a2		 trb $a2
$1d:db21  91 19		 sta ($19),y
$1d:db23  a4 46		 ldy $46
$1d:db25  a9 03 40	  lda #$4003
$1d:db28  85 bf		 sta $bf
$1d:db2a  ce 36 4f	  dec $4f36
$1d:db2d  0a			asl a
$1d:db2e  40			rti
$1d:db2f  c0 27 24	  cpy #$2427
$1d:db32  90 2b		 bcc $db5f
$1d:db34  89 18 5f	  bit #$5f18
$1d:db37  e6 2c		 inc $2c
$1d:db39  03 00		 ora $00,s
$1d:db3b  d2 0b		 cmp ($0b)
$1d:db3d  02 4b		 cop #$4b
$1d:db3f  38			sec
$1d:db40  6c 22 bd	  jmp ($bd22)
$1d:db43  08			php
$1d:db44  af 8a 44 f0   lda $f0448a
$1d:db48  16 b1		 asl $b1,x
$1d:db4a  18			clc
$1d:db4b  ce 0f 62	  dec $620f
$1d:db4e  7a			ply
$1d:db4f  03 f1		 ora $f1,s
$1d:db51  1e 00 48	  asl $4800,x
$1d:db54  07 c0		 ora [$c0]
$1d:db56  3c 00 a8	  bit $a800,x
$1d:db59  0f 80 82 03   ora $038280
$1d:db5d  c0 0b 00	  cpy #$000b
$1d:db60  20 08 60	  jsr $6008
$1d:db63  0f 10 a8 02   ora $02a810
$1d:db67  04 fe		 tsb $fe
$1d:db69  27 81		 and [$81]
$1d:db6b  09 00 14	  ora #$1400
$1d:db6e  8f 22 0b 13   sta $130b22
$1d:db72  90 15		 bcc $db89
$1d:db74  c4 24		 cpy $24
$1d:db76  01 20		 ora ($20,x)
$1d:db78  5a			phy
$1d:db79  90 a2		 bcc $db1d
$1d:db7b  8e 24 c1	  stx $c124
$1d:db7e  00 88		 brk #$88
$1d:db80  ac 0c 82	  ldy $820c
$1d:db83  24 0b		 bit $0b
$1d:db85  9c c7 8c	  stz $8cc7
$1d:db88  2e 01 20	  rol $2001
$1d:db8b  39 0d 62	  and $620d,y
$1d:db8e  6c e2 95	  jmp ($95e2)
$1d:db91  c2 26		 rep #$26
$1d:db93  f0 89		 beq $db1e
$1d:db95  78			sei
$1d:db96  a4 d0		 ldy $d0
$1d:db98  c1 27		 cmp ($27,x)
$1d:db9a  14 95		 trb $95
$1d:db9c  20 2c 0c	  jsr $0c2c
$1d:db9f  e2 88		 sep #$88
$1d:dba1  21 45		 and ($45,x)
$1d:dba3  f4 0e 60	  pea $600e
$1d:dba6  92 a1		 sta ($a1)
$1d:dba8  44 d4 14	  mvp $14,$d4
$1d:dbab  98			tya
$1d:dbac  45 6a		 eor $6a
$1d:dbae  11 59		 ora ($59),y
$1d:dbb0  84 46		 sty $46
$1d:dbb2  10 66		 bpl $dc1a
$1d:dbb4  52 29		 eor ($29)
$1d:dbb6  a1 a4		 lda ($a4,x)
$1d:dbb8  66 62		 ror $62
$1d:dbba  53 93		 eor ($93,s),y
$1d:dbbc  21 44		 and ($44,x)
$1d:dbbe  18			clc
$1d:dbbf  04 02		 tsb $02
$1d:dbc1  12 21		 ora ($21)
$1d:dbc3  28			plp
$1d:dbc4  9f 41 7a 84   sta $847a41,x
$1d:dbc8  5e c4 22	  lsr $22c4,x
$1d:dbcb  26 20		 rol $20
$1d:dbcd  60			rts
$1d:dbce  09 06 00	  ora #$0006
$1d:dbd1  6f f4 07 a4   adc $a407f4
$1d:dbd5  7d 45 eb	  adc $eb45,x
$1d:dbd8  3f 62 7b 57   and $577b62,x
$1d:dbdc  dc de f7	  jml [$f7de]
$1d:dbdf  f0 47		 beq $dc28
$1d:dbe1  86 7c		 stx $7c
$1d:dbe3  55 e3		 eor $e3,x
$1d:dbe5  bf 26 79 77   lda $777926,x
$1d:dbe9  e3 9c		 sbc $9c,s
$1d:dbeb  08			php
$1d:dbec  e7 04		 sbc [$04]
$1d:dbee  de f8 08	  dec $08f8,x
$1d:dbf1  e6 04		 inc $04
$1d:dbf3  de 78 28	  dec $2878,x
$1d:dbf6  e6 0c		 inc $0c
$1d:dbf8  ce f9 08	  dec $08f9
$1d:dbfb  e6 46		 inc $46
$1d:dbfd  38			sec
$1d:dbfe  6e 02 f7	  ror $f702
$1d:dc01  a7 9a		 lda [$9a]
$1d:dc03  19 c0 86	  ora $86c0,y
$1d:dc06  70 55		 bvs $dc5d
$1d:dc08  ef 80 86 60   sbc $608680
$1d:dc0c  55 e7		 eor $e7,x
$1d:dc0e  82 86 60	  brl $3c97
$1d:dc11  d5 e7		 cmp $e7,x
$1d:dc13  90 86		 bcc $db9b
$1d:dc15  64 59		 stz $59
$1d:dc17  66 ae		 ror $ae
$1d:dc19  05 70		 ora $70
$1d:dc1b  68			pla
$1d:dc1c  21 9a		 and ($9a,x)
$1d:dc1e  18			clc
$1d:dc1f  66 c1		 ror $c1
$1d:dc21  a6 2b		 ldx $2b
$1d:dc23  c2 6a		 rep #$6a
$1d:dc25  13 10		 ora ($10,s),y
$1d:dc27  9a			txs
$1d:dc28  83 1c		 sta $1c,s
$1d:dc2a  c2 47		 rep #$47
$1d:dc2c  30 b1		 bmi $dbdf
$1d:dc2e  cc a4 73	  cpy $73a4
$1d:dc31  2b			pld
$1d:dc32  1c c3 47	  trb $47c3
$1d:dc35  38			sec
$1d:dc36  71 cc		 adc ($cc),y
$1d:dc38  b4 73		 ldy $73,x
$1d:dc3a  a7 0c		 lda [$0c]
$1d:dc3c  c2 43		 rep #$43
$1d:dc3e  30 b0		 bmi $dbf0
$1d:dc40  cc a4 33	  cpy $33a4
$1d:dc43  2b			pld
$1d:dc44  0c c3 43	  tsb $43c3
$1d:dc47  38			sec
$1d:dc48  70 cc		 bvs $dc16
$1d:dc4a  b4 33		 ldy $33,x
$1d:dc4c  a6 9e		 ldx $9e
$1d:dc4e  f3 07		 sbc ($07,s),y
$1d:dc50  69 23 9a	  adc #$9a23
$1d:dc53  68			pla
$1d:dc54  e6 d0		 inc $d0
$1d:dc56  62 2f c1	  per $9d88
$1d:dc59  7d 9e 92	  adc $929e,x
$1d:dc5c  19 a6 86	  ora $86a6,y
$1d:dc5f  6d 08 22	  adc $2208
$1d:dc62  0c 10 5f	  tsb $5f10
$1d:dc65  96 fd		 stx $fd,y
$1d:dc67  5a			phy
$1d:dc68  3c 42 08	  bit $0842,x
$1d:dc6b  f5 08		 sbc $08,x
$1d:dc6d  20 fb 13	  jsr $13fb
$1d:dc70  b1 c2		 lda ($c2),y
$1d:dc72  38			sec
$1d:dc73  90 83		 bcc $dbf8
$1d:dc75  f0 75		 beq $dcec
$1d:dc77  10 20		 bpl $dc99
$1d:dc79  5e f3 07	  lsr $07f3,x
$1d:dc7c  64 a1		 stz $a1
$1d:dc7e  99 38 66	  sta $6638,y
$1d:dc81  8a			txa
$1d:dc82  19 a3 86	  ora $86a3,y
$1d:dc85  79 a1 9a	  adc $9aa1,y
$1d:dc88  55 78		 eor $78,x
$1d:dc8a  ed 49 60	  sbc $6049
$1d:dc8d  fd 1d b0	  sbc $b01d,x
$1d:dc90  e4 21		 cpx $21
$1d:dc92  1e 68 46	  asl $4668,x
$1d:dc95  95 7e		 sta $7e,x
$1d:dc97  3b			tsc
$1d:dc98  58			cli
$1d:dc99  41 30		 eor ($30,x)
$1d:dc9b  61 1b		 adc ($1b,x)
$1d:dc9d  62 48 b9	  per $95e8
$1d:dca0  09 4c 1d	  ora #$1d4c
$1d:dca3  08			php
$1d:dca4  67 46		 adc [$46]
$1d:dca6  19 d2 86	  ora $86d2,y
$1d:dca9  78			sei
$1d:dcaa  a1 9b		 lda ($9b,x)
$1d:dcac  35 59		 and $59,x
$1d:dcae  ec 9b a2	  cpx $a29b
$1d:dcb1  e4 2e		 cpx $2e
$1d:dcb3  04 33		 tsb $33
$1d:dcb5  82 b3 1e	  brl $fb6b
$1d:dcb8  2a			rol a
$1d:dcb9  cc 7a b0	  cpy $b07a
$1d:dcbc  ce 31 24	  dec $2431
$1d:dcbf  7a			ply
$1d:dcc0  cc f0 61	  cpy $61f0
$1d:dcc3  8f 15 86 3d   sta $3d8615
$1d:dcc7  58			cli
$1d:dcc8  47 1a		 eor [$1a]
$1d:dcca  10 be		 bpl $dc8a
$1d:dccc  0e b4 21	  asl $21b4
$1d:dccf  4c 1e 08	  jmp $081e
$1d:dcd2  67 85		 adc [$85]
$1d:dcd4  ae 40 d0	  ldx $d040
$1d:dcd7  84 74		 sty $74
$1d:dcd9  21 1e		 and ($1e,x)
$1d:dcdb  08			php
$1d:dcdc  47 84		 eor [$84]
$1d:dcde  2e 2f e0	  rol $e02f
$1d:dce1  c9 42 32	  cmp #$3242
$1d:dce4  62 33 d1	  per $ae1a
$1d:dce7  42 15		 wdm #$15
$1d:dce9  c1 e4		 cmp ($e4,x)
$1d:dceb  86 79		 stx $79
$1d:dced  59 e5 1c	  eor $1ce5,y
$1d:dcf0  c2 47		 rep #$47
$1d:dcf2  30 a3		 bmi $dc97
$1d:dcf4  72 84		 adc ($84)
$1d:dcf6  79 21 1e	  adc $1e21,y
$1d:dcf9  50 f9		 bvc $dcf4
$1d:dcfb  43 30		 eor $30,s
$1d:dcfd  90 cc		 bcc $dccb
$1d:dcff  29 1c db	  and #$db1c
$1d:dd02  84 ec		 sty $ec
$1d:dd04  18			clc
$1d:dd05  47 46		 eor [$46]
$1d:dd07  10 16		 bpl $dd1f
$1d:dd09  0f 14 23 66   ora $662314
$1d:dd0d  2b			pld
$1d:dd0e  28			plp
$1d:dd0f  46 c8		 lsr $c8
$1d:dd11  ba			tsx
$1d:dd12  26 42		 rol $42
$1d:dd14  e0 42 0a	  cpx #$0a42
$1d:dd17  c0 6c ac	  cpy #$ac6c
$1d:dd1a  04 23		 tsb $23
$1d:dd1c  02 6b		 cop #$6b
$1d:dd1e  3c 14 23	  bit $2314,x
$1d:dd21  06 6b		 asl $6b
$1d:dd23  3c 84 23	  bit $2384,x
$1d:dd26  22 8b 31 01   jsl $01318b
$1d:dd2a  68			pla
$1d:dd2b  21 1a		 and ($1a,x)
$1d:dd2d  18			clc
$1d:dd2e  46 c0		 lsr $c0
$1d:dd30  2e 38 03	  rol $0338
$1d:dd33  e8			inx
$1d:dd34  88			dey
$1d:dd35  09 08 44	  ora #$4408
$1d:dd38  42 68		 wdm #$68
$1d:dd3a  27 d2		 and [$d2]
$1d:dd3c  19 f0 86	  ora $86f0,y
$1d:dd3f  7d 61 9f	  adc $9f61,x
$1d:dd42  18			clc
$1d:dd43  67 da		 adc [$da]
$1d:dd45  19 f2 26	  ora $26f2,y
$1d:dd48  8f cc 9a 11   sta $119acc
$1d:dd4c  cc 84 73	  cpy $7384
$1d:dd4f  23 0c		 and $0c,s
$1d:dd51  c9 43 05	  cmp #$0543
$1d:dd54  40			rti
$1d:dd55  6c 24 c1	  jmp ($c124)
$1d:dd58  08			php
$1d:dd59  08			php
$1d:dd5a  30 c5		 bmi $dd21
$1d:dd5c  86 36		 stx $36
$1d:dd5e  0c 70 6c	  tsb $6c70
$1d:dd61  0f 03 7b 7b   ora $7b7b03
$1d:dd65  f9 53 66	  sbc $6653,y
$1d:dd68  a4 10		 ldy $10
$1d:dd6a  b7 87		 lda [$87],y
$1d:dd6c  96 79		 stx $79,y
$1d:dd6e  88			dey
$1d:dd6f  9e 62 67	  stz $6762,x
$1d:dd72  99 89 e6	  sta $e689,y
$1d:dd75  66 79		 ror $79
$1d:dd77  8a			txa
$1d:dd78  9e 62 e7	  stz $e762,x
$1d:dd7b  99 a9 e6	  sta $e6a9,y
$1d:dd7e  6e 79 8c	  ror $8c79
$1d:dd81  9e 63 67	  stz $6763,x
$1d:dd84  99 c9 e6	  sta $e6c9,y
$1d:dd87  76 79		 ror $79,x
$1d:dd89  8e 9e 63	  stx $639e
$1d:dd8c  e7 99		 sbc [$99]
$1d:dd8e  e9 e6 7e	  sbc #$7ee6
$1d:dd91  51 44		 eor ($44),y
$1d:dd93  94 51		 sty $51,x
$1d:dd95  65 15		 adc $15
$1d:dd97  49 45 56	  eor #$5645
$1d:dd9a  51 46		 eor ($46),y
$1d:dd9c  94 51		 sty $51,x
$1d:dd9e  e5 15		 sbc $15
$1d:dda0  69 45 5e	  adc #$5e45
$1d:dda3  11 40		 ora ($40),y
$1d:dda5  84 50		 sty $50
$1d:dda7  61 15		 adc ($15,x)
$1d:dda9  08			php
$1d:ddaa  45 46		 eor $46
$1d:ddac  11 42		 ora ($42),y
$1d:ddae  84 50		 sty $50
$1d:ddb0  e1 15		 sbc ($15,x)
$1d:ddb2  28			plp
$1d:ddb3  45 4e		 eor $4e
$1d:ddb5  79 a8 9e	  adc $9ea8,y
$1d:ddb8  6a			ror a
$1d:ddb9  67 9b		 adc [$9b]
$1d:ddbb  89 e6 e6	  bit #$e6e6
$1d:ddbe  79 aa 9e	  adc $9eaa,y
$1d:ddc1  6a			ror a
$1d:ddc2  e7 9b		 sbc [$9b]
$1d:ddc4  a9 e6 ee	  lda #$eee6
$1d:ddc7  79 ac 9e	  adc $9eac,y
$1d:ddca  6b			rtl
$1d:ddcb  67 9b		 adc [$9b]
$1d:ddcd  c9 e6 f6	  cmp #$f6e6
$1d:ddd0  79 ae 9e	  adc $9eae,y
$1d:ddd3  6b			rtl
$1d:ddd4  e7 9b		 sbc [$9b]
$1d:ddd6  e9 e6 fe	  sbc #$fee6
$1d:ddd9  51 64		 eor ($64),y
$1d:dddb  94 59		 sty $59,x
$1d:dddd  65 17		 adc $17
$1d:dddf  49 45 d6	  eor #$d645
$1d:dde2  51 66		 eor ($66),y
$1d:dde4  94 59		 sty $59,x
$1d:dde6  e5 17		 sbc $17
$1d:dde8  69 45 de	  adc #$de45
$1d:ddeb  11 60		 ora ($60),y
$1d:dded  84 58		 sty $58
$1d:ddef  61 17		 adc ($17,x)
$1d:ddf1  08			php
$1d:ddf2  45 c6		 eor $c6
$1d:ddf4  11 62		 ora ($62),y
$1d:ddf6  84 58		 sty $58
$1d:ddf8  e1 17		 sbc ($17,x)
$1d:ddfa  28			plp
$1d:ddfb  45 ce		 eor $ce
$1d:ddfd  79 c8 9e	  adc $9ec8,y
$1d:de00  72 67		 adc ($67)
$1d:de02  9d 89 e7	  sta $e789,x
$1d:de05  66 79		 ror $79
$1d:de07  ca			dex
$1d:de08  9e 72 e7	  stz $e772,x
$1d:de0b  9d a9 e7	  sta $e7a9,x
$1d:de0e  6e 79 cc	  ror $cc79
$1d:de11  9e 73 67	  stz $6773,x
$1d:de14  9d c9 e7	  sta $e7c9,x
$1d:de17  76 79		 ror $79,x
$1d:de19  ce 9e 73	  dec $739e
$1d:de1c  e7 9d		 sbc [$9d]
$1d:de1e  e9 e7 7c	  sbc #$7ce7
$1d:de21  3d e2 0e	  and $0ee2,x
$1d:de24  f4 4f 3d	  pea $3d4f
$1d:de27  33 cf		 and ($cf,s),y
$1d:de29  c4 f3		 cpy $f3
$1d:de2b  f3 3c		 sbc ($3c,s),y
$1d:de2d  f5 4f		 sbc $4f,x
$1d:de2f  3d 73 cf	  and $cf73,x
$1d:de32  d4 f3		 pei ($f3)
$1d:de34  f7 3c		 sbc [$3c],y
$1d:de36  f6 4f		 inc $4f,x
$1d:de38  3d b3 cf	  and $cfb3,x
$1d:de3b  e4 f3		 cpx $f3
$1d:de3d  fb			xce
$1d:de3e  3c f7 4f	  bit $4ff7,x
$1d:de41  3d f3 cf	  and $cff3,x
$1d:de44  f4 f3 fe	  pea $fef3
$1d:de47  de f0 ff	  dec $fff0,x
$1d:de4a  8c 3c 83	  sty $833c
$1d:de4d  e5 2f		 sbc $2f
$1d:de4f  31 f9		 and ($f9),y
$1d:de51  d3 d0		 cmp ($d0,s),y
$1d:de53  be 96 f5	  ldx $f596,y
$1d:de56  3f ae 3d 93   and $933dae,x
$1d:de5a  ed af 75	  sbc $75af
$1d:de5d  88			dey
$1d:de5e  03 04		 ora $04,s
$1d:de60  00 0c		 brk #$0c
$1d:de62  af bb c2 52   lda $52c2bb
$1d:de66  f1 b8		 sbc ($b8),y
$1d:de68  ec 6a c0	  cpx $c06a
$1d:de6b  01 aa		 ora ($aa,x)
$1d:de6d  fc 4f ab	  jsr ($ab4f,x)
$1d:de70  ca			dex
$1d:de71  09 2f 70	  ora #$702f
$1d:de74  22 52 9b 17   jsl $179b52
$1d:de78  26 21		 rol $21
$1d:de7a  1b			tcs
$1d:de7b  b1 88		 lda ($88),y
$1d:de7d  ce 22 21	  dec $2122
$1d:de80  18			clc
$1d:de81  d8			cld
$1d:de82  3c 39 31	  bit $3139,x
$1d:de85  27 8a		 and [$8a]
$1d:de87  8c 09 e2	  sty $e209
$1d:de8a  02 00		 cop #$00
$1d:de8c  b0 ca		 bcs $de58
$1d:de8e  7f 50 b2 20   adc $20b250,x
$1d:de92  8f ce 16 2f   sta $2f16ce
$1d:de96  12 10		 ora ($10)
$1d:de98  6d 61 65	  adc $6561
$1d:de9b  41 24		 eor ($24,x)
$1d:de9d  a0 7c 46	  ldy #$467c
$1d:dea0  56 0f		 lsr $0f,x
$1d:dea2  0e a4 60	  asl $60a4
$1d:dea5  02 b1		 cop #$b1
$1d:dea7  93 88		 sta ($88,s),y
$1d:dea9  c6 83		 dec $83
$1d:deab  e0 11 8f	  cpx #$8f11
$1d:deae  e8			inx
$1d:deaf  48			pha
$1d:deb0  45 e2		 eor $e2
$1d:deb2  22 ab 19 7d   jsl $7d19ab
$1d:deb6  bd 23 84	  lda $8423,x
$1d:deb9  1c 11 08	  trb $0811
$1d:debc  00 01		 brk #$01
$1d:debe  2b			pld
$1d:debf  f5 47		 sbc $47,x
$1d:dec1  07 e8		 ora [$e8]
$1d:dec3  5f 38 9f 23   eor $239f38,x
$1d:dec7  a9 ea 61	  lda #$61ea
$1d:deca  08			php
$1d:decb  c4 76		 cpy $76
$1d:decd  a4 f3		 ldy $f3
$1d:decf  b1 7a		 lda ($7a),y
$1d:ded1  39 0d 12	  and $120d,y
$1d:ded4  20 8e d9	  jsr $d98e
$1d:ded7  7e 9e 7a	  ror $7a9e,x
$1d:deda  17 2d		 ora [$2d],y
$1d:dedc  90 83		 bcc $de61
$1d:dede  d1 31		 cmp ($31),y
$1d:dee0  9b			txy
$1d:dee1  b9 a5 27	  lda $27a5,y
$1d:dee4  34 8e		 bit $8e,x
$1d:dee6  57 e3		 eor [$e3],y
$1d:dee8  a7 44		 lda [$44]
$1d:deea  b0 21		 bcs $df0d
$1d:deec  8d 82 48	  sta $4882
$1d:deef  15 b1		 ora $b1,x
$1d:def1  a5 81		 lda $81
$1d:def3  32 2d		 and ($2d)
$1d:def5  82 4e 02	  brl $e146
$1d:def8  54 12 c1	  mvn $c1,$12
$1d:defb  29 7a 0a	  and #$0a7a
$1d:defe  a8			tay
$1d:deff  8d 46 2f	  sta $2f46
$1d:df02  1f c7 e8 bc   ora $bce8c7,x
$1d:df06  4d 21 2d	  eor $2d21
$1d:df09  90 fc		 bcc $df07
$1d:df0b  60			rts
$1d:df0c  90 82		 bcc $de90
$1d:df0e  09 32 08	  ora #$0832
$1d:df11  92 24		 sta ($24)
$1d:df13  f2 18		 sbc ($18)
$1d:df15  19 14 87	  ora $8714,y
$1d:df18  29 60 05	  and #$0560
$1d:df1b  04 6a		 tsb $6a
$1d:df1d  33 d4		 and ($d4,s),y
$1d:df1f  8c 1c 8c	  sty $8c1c
$1d:df22  12 00		 ora ($00)
$1d:df24  a0 09 00	  ldy #$0009
$1d:df27  61 42		 adc ($42,x)
$1d:df29  22 18 21 10   jsl $102118
$1d:df2d  c4 05		 cpy $05
$1d:df2f  a0 93 34	  ldy #$3493
$1d:df32  80 8a		 bra $debe
$1d:df34  c0 64 4f	  cpy #$4f64
$1d:df37  85 19		 sta $19
$1d:df39  90 bc		 bcc $def7
$1d:df3b  2c 47 40	  bit $4047
$1d:df3e  05 00		 ora $00
$1d:df40  14 41		 trb $41
$1d:df42  21 19		 and ($19,x)
$1d:df44  6d 8f e9	  adc $e98f
$1d:df47  c6 01		 dec $01
$1d:df49  18			clc
$1d:df4a  73 8e		 adc ($8e,s),y
$1d:df4c  d6 bf		 dec $bf,x
$1d:df4e  15 16		 ora $16,x
$1d:df50  80 8d		 bra $dedf
$1d:df52  45 a1		 eor $a1
$1d:df54  14 af		 trb $af
$1d:df56  ed 9f 44	  sbc $449f
$1d:df59  33 55		 and ($55,s),y
$1d:df5b  29 1a 85	  and #$851a
$1d:df5e  df 75 f5 c0   cmp $c0f575,x
$1d:df62  3f e9 6a 07   and $076ae9,x
$1d:df66  f9 3f 87	  sbc $873f,y
$1d:df69  f5 8a		 sbc $8a,x
$1d:df6b  08			php
$1d:df6c  f2 4a		 sbc ($4a)
$1d:df6e  12 4c		 ora ($4c)
$1d:df70  9a			txs
$1d:df71  64 e2		 stz $e2
$1d:df73  35 28		 and $28,x
$1d:df75  b7 d8		 lda [$d8],y
$1d:df77  cc 25 90	  cpy $9025
$1d:df7a  fd 42 ff	  sbc $ff42,x
$1d:df7d  04 40		 tsb $40
$1d:df7f  fd 0f cc	  sbc $cc0f,x
$1d:df82  7e 7b 58	  ror $587b,x
$1d:df85  5c 12 11 0b   jml $0b1112
$1d:df89  da			phx
$1d:df8a  b5 85		 lda $85,x
$1d:df8c  8a			txa
$1d:df8d  02 fc		 cop #$fc
$1d:df8f  5e 04 6a	  lsr $6a04,x
$1d:df92  32 b1		 and ($b1)
$1d:df94  07 f9		 ora [$f9]
$1d:df96  00 09		 brk #$09
$1d:df98  74 0c		 stz $0c,x
$1d:df9a  50 07		 bvc $dfa3
$1d:df9c  db			stp
$1d:df9d  50 43		 bvc $dfe2
$1d:df9f  f8			sed
$1d:dfa0  5d 9f 49	  eor $499f,x
$1d:dfa3  a5 09		 lda $09
$1d:dfa5  47 1d		 eor [$1d]
$1d:dfa7  05 84		 ora $84
$1d:dfa9  af d5 1c 2d   lda $2d1cd5
$1d:dfad  44 4f 91	  mvp $91,$4f
$1d:dfb0  c8			iny
$1d:dfb1  ea			nop
$1d:dfb2  7a			ply
$1d:dfb3  9c a4 4d	  stz $4da4
$1d:dfb6  5b			tcd
$1d:dfb7  17 23		 ora [$23],y
$1d:dfb9  fb			xce
$1d:dfba  c8			iny
$1d:dfbb  68			pla
$1d:dfbc  91 71		 sta ($71),y
$1d:dfbe  1a			inc a
$1d:dfbf  44 c5 06	  mvp $06,$c5
$1d:dfc2  c1 94		 cmp ($94,x)
$1d:dfc4  81 54		 sta ($54,x)
$1d:dfc6  71 51		 adc ($51),y
$1d:dfc8  18			clc
$1d:dfc9  c5 15		 cmp $15
$1d:dfcb  e8			inx
$1d:dfcc  5a			phy
$1d:dfcd  33 39		 and ($39,s),y
$1d:dfcf  0b			phd
$1d:dfd0  92 26		 sta ($26)
$1d:dfd2  aa			tax
$1d:dfd3  03 8a		 ora $8a,s
$1d:dfd5  1e 0d a4	  asl $a40d,x
$1d:dfd8  24 a0		 bit $a0
$1d:dfda  41 48		 eor ($48,x)
$1d:dfdc  30 9e		 bmi $df7c
$1d:dfde  84 32		 sty $32
$1d:dfe0  44 d8 34	  mvp $34,$d8
$1d:dfe3  85 bc		 sta $bc
$1d:dfe5  00 35		 brk #$35
$1d:dfe7  34 89		 bit $89,x
$1d:dfe9  c4 63		 cpy $63
$1d:dfeb  30 bc		 bmi $dfa9
$1d:dfed  19 3d 9f	  ora $9f3d,y
$1d:dff0  20 81 28	  jsr $2881
$1d:dff3  5c b8 be cf   jml $cfbeb8
$1d:dff7  91 49		 sta ($49),y
$1d:dff9  04 44		 tsb $44
$1d:dffb  7f 40 b3 5a   adc $5ab340,x
$1d:dfff  08			php
$1d:e000  4e 95 40	  lsr $4095
$1d:e003  5b			tcd
$1d:e004  21 2c		 and ($2c,x)
$1d:e006  1a			inc a
$1d:e007  4c 69 47	  jmp $4769
$1d:e00a  a2 02 4b	  ldx #$4b02
$1d:e00d  e4 ff		 cpx $ff
$1d:e00f  50 b6		 bvc $dfc7
$1d:e011  20 be 4d	  jsr $4dbe
$1d:e014  5c 41 c0 da   jml $dac041
$1d:e018  c2 da		 rep #$da
$1d:e01a  82 ff 34	  brl $151c
$1d:e01d  f1 00		 sbc ($00),y
$1d:e01f  a0 38 21	  ldy #$2138
$1d:e022  63 25		 adc $25,s
$1d:e024  90 44		 bcc $e06a
$1d:e026  10 45		 bpl $e06d
$1d:e028  1c 48 a7	  trb $a748
$1d:e02b  71 fe		 adc ($fe),y
$1d:e02d  a7 b0		 lda [$b0]
$1d:e02f  50 b8		 bvc $dfe9
$1d:e031  d9 56 25	  cmp $2556,y
$1d:e034  e9 39 4b	  sbc #$4b39
$1d:e037  04 63		 tsb $63
$1d:e039  be a4 12	  ldx $12a4,y
$1d:e03c  47 17		 eor [$17]
$1d:e03e  e4 7b		 cpx $7b
$1d:e040  2f 57 20 88   and $882057
$1d:e044  47 b2		 eor [$b2]
$1d:e046  7a			ply
$1d:e047  03 ac		 ora $ac,s
$1d:e049  88			dey
$1d:e04a  86 48		 stx $48
$1d:e04c  07 60		 ora [$60]
$1d:e04e  ff 79 47 b2   sbc $b24779,x
$1d:e052  29 a9 f0	  and #$f0a9
$1d:e055  54 20 4f	  mvn $4f,$20
$1d:e058  7e a7 ed	  ror $eda7,x
$1d:e05b  d8			cld
$1d:e05c  20 d1 5e	  jsr $5ed1
$1d:e05f  08			php
$1d:e060  0d 39 6b	  ora $6b39
$1d:e063  c1 0e		 cmp ($0e,x)
$1d:e065  8b			phb
$1d:e066  08			php
$1d:e067  22 a1 30 55   jsl $5530a1
$1d:e06b  04 40		 tsb $40
$1d:e06d  28			plp
$1d:e06e  11 43		 ora ($43),y
$1d:e070  da			phx
$1d:e071  ad 85 74	  lda $7485
$1d:e074  2e 65 7a	  rol $7a65
$1d:e077  08			php
$1d:e078  d0 5e		 bne $e0d8
$1d:e07a  eb			xba
$1d:e07b  19 6d 83	  ora $836d,y
$1d:e07e  fd 18 0a	  sbc $0a18,x
$1d:e081  0c 00 f0	  tsb $f000
$1d:e084  25 c4		 and $c4
$1d:e086  24 e1		 bit $e1
$1d:e088  c0 3f 08	  cpy #$083f
$1d:e08b  91 94		 sta ($94),y
$1d:e08d  46 7a		 lsr $7a
$1d:e08f  34 09		 bit $09,x
$1d:e091  22 10 80 0a   jsl $0a8010
$1d:e095  b2 48		 lda ($48)
$1d:e097  92 61		 sta ($61)
$1d:e099  0f 40 ef 35   ora $35ef40
$1d:e09d  10 8a		 bpl $e029
$1d:e09f  15 fc		 ora $fc,x
$1d:e0a1  2a			rol a
$1d:e0a2  f4 5c 20	  pea $205c
$1d:e0a5  34 97		 bit $97,x
$1d:e0a7  f2 89		 sbc ($89)
$1d:e0a9  15 d8		 ora $d8,x
$1d:e0ab  c4 1a		 cpy $1a
$1d:e0ad  51 14		 eor ($14),y
$1d:e0af  af b2 c5 40   lda $40c5b2
$1d:e0b3  6e 25 af	  ror $af25
$1d:e0b6  c6 db		 dec $db
$1d:e0b8  80 7a		 bra $e134
$1d:e0ba  0c 1c 2c	  tsb $2c1c
$1d:e0bd  c8			iny
$1d:e0be  cf e2 29 5a   cmp $5a29e2
$1d:e0c2  6c 15 e8	  jmp ($e815)
$1d:e0c5  83 48		 sta $48,s
$1d:e0c7  e3 f8		 sbc $f8,s
$1d:e0c9  46 30		 lsr $30
$1d:e0cb  50 30		 bvc $e0fd
$1d:e0cd  80 10		 bra $e0df
$1d:e0cf  8d aa 46	  sta $46aa
$1d:e0d2  02 37		 cop #$37
$1d:e0d4  b0 5d		 bcs $e133
$1d:e0d6  81 47		 sta ($47,x)
$1d:e0d8  fa			plx
$1d:e0d9  85 fe		 sta $fe
$1d:e0db  18			clc
$1d:e0dc  81 fa		 sta ($fa,x)
$1d:e0de  05 1b		 ora $1b
$1d:e0e0  fc f6 b0	  jsr ($b0f6,x)
$1d:e0e3  b8			clv
$1d:e0e4  24 22		 bit $22
$1d:e0e6  17 b5		 ora [$b5],y
$1d:e0e8  07 a0		 ora [$a0]
$1d:e0ea  42 d9		 wdm #$d9
$1d:e0ec  a4 81		 ldy $81
$1d:e0ee  78			sei
$1d:e0ef  c8			iny
$1d:e0f0  84 63		 sty $63
$1d:e0f2  29 f0 49	  and #$49f0
$1d:e0f5  40			rti
$1d:e0f6  c4 ab		 cpy $ab
$1d:e0f8  f1 52		 sbc ($52),y
$1d:e0fa  23 98		 and $98,s
$1d:e0fc  02 20		 cop #$20
$1d:e0fe  48			pha
$1d:e0ff  03 e8		 ora $e8,s
$1d:e101  94 d9		 sty $d9,x
$1d:e103  76 25		 ror $25,x
$1d:e105  c1 8e		 cmp ($8e,x)
$1d:e107  a1 1d		 lda ($1d,x)
$1d:e109  f4 28 a0	  pea $a028
$1d:e10c  47 98		 eor [$98]
$1d:e10e  28			plp
$1d:e10f  d2 48		 cmp ($48)
$1d:e111  9f 30 d0 84   sta $84d030,x
$1d:e115  99 74 6b	  sta $6b74,y
$1d:e118  05 59		 ora $59
$1d:e11a  9b			txy
$1d:e11b  00 ac		 brk #$ac
$1d:e11d  4f 17 b0 17   eor $17b017
$1d:e121  d0 8c		 bne $e0af
$1d:e123  e4 e2		 cpx $e2
$1d:e125  66 84		 ror $84
$1d:e127  54 24 c5	  mvn $c5,$24
$1d:e12a  d5 10		 cmp $10,x
$1d:e12c  b9 b4 8e	  lda $8eb4,y
$1d:e12f  b0 7b		 bcs $e1ac
$1d:e131  44 2c 12	  mvp $12,$2c
$1d:e134  c8			iny
$1d:e135  1e 09 58	  asl $5809,x
$1d:e138  2d 98 7e	  and $7e98
$1d:e13b  44 c4 3b	  mvp $3b,$c4
$1d:e13e  21 8d		 and ($8d,x)
$1d:e140  12 50		 ora ($50)
$1d:e142  89 05 84	  bit #$8405
$1d:e145  2a			rol a
$1d:e146  43 99		 eor $99,s
$1d:e148  14 10		 trb $10
$1d:e14a  f5 47		 sbc $47,x
$1d:e14c  e0 9d d5	  cpx #$d59d
$1d:e14f  8b			phb
$1d:e150  0f f4 08 20   ora $2008f4
$1d:e154  5c 0a 80 d6   jml $d6800a
$1d:e158  41 02		 eor ($02,x)
$1d:e15a  20 86 24	  jsr $2486
$1d:e15d  e6 41		 inc $41
$1d:e15f  82 24 82	  brl $6386
$1d:e162  c4 f0		 cpy $f0
$1d:e164  50 09		 bvc $e16f
$1d:e166  a8			tay
$1d:e167  46 26		 lsr $26
$1d:e169  06 56		 asl $56
$1d:e16b  c9 05 40	  cmp #$4005
$1d:e16e  ea			nop
$1d:e16f  21 65		 and ($65,x)
$1d:e171  75 90		 adc $90,x
$1d:e173  94 84		 sty $84,x
$1d:e175  ac f8 51	  ldy $51f8
$1d:e178  a3 80		 lda $80,s
$1d:e17a  4f fb c8 62   eor $62c8fb
$1d:e17e  82 22 b0	  brl $91a3
$1d:e181  4d 41 c1	  eor $c141
$1d:e184  a6 66		 ldx $66
$1d:e186  00 e4		 brk #$e4
$1d:e188  19 72 a5	  ora $a572,y
$1d:e18b  46 aa		 lsr $aa
$1d:e18d  31 34		 and ($34),y
$1d:e18f  20 a0 81	  jsr $81a0
$1d:e192  10 a7		 bpl $e13b
$1d:e194  f2 e5		 sbc ($e5)
$1d:e196  9d 41 24	  sta $2441,x
$1d:e199  25 85		 and $85
$1d:e19b  2c 94 51	  bit $5194
$1d:e19e  42 6a		 wdm #$6a
$1d:e1a0  b2 11		 lda ($11)
$1d:e1a2  a0 b0 16	  ldy #$16b0
$1d:e1a5  44 79 47	  mvp $47,$79
$1d:e1a8  b9 47 1f	  lda $1f47,y
$1d:e1ab  c1 ca		 cmp ($ca,x)
$1d:e1ad  fe 81 4c	  inc $4c81,x
$1d:e1b0  00 48		 brk #$48
$1d:e1b2  32 09		 and ($09)
$1d:e1b4  b0 40		 bcs $e1f6
$1d:e1b6  4a			lsr a
$1d:e1b7  c2 75		 rep #$75
$1d:e1b9  01 1b		 ora ($1b,x)
$1d:e1bb  28			plp
$1d:e1bc  d8			cld
$1d:e1bd  66 cf		 ror $cf
$1d:e1bf  b0 4a		 bcs $e20b
$1d:e1c1  92 54		 sta ($54)
$1d:e1c3  00 70		 brk #$70
$1d:e1c5  69 40 9c	  adc #$9c40
$1d:e1c8  ca			dex
$1d:e1c9  4f 64 23 83   eor $832364
$1d:e1cd  2a			rol a
$1d:e1ce  0c e0 ea	  tsb $eae0
$1d:e1d1  80 28		 bra $e1fb
$1d:e1d3  42 a0		 wdm #$a0
$1d:e1d5  4e 03 2a	  lsr $2a03
$1d:e1d8  de b1 60	  dec $60b1,x
$1d:e1db  7f 79 1e 88   adc $881e79,x
$1d:e1df  03 ca		 ora $ca,s
$1d:e1e1  bf 7f 0f 3b   lda $3b0f7f,x
$1d:e1e5  ca			dex
$1d:e1e6  c1 de		 cmp ($de,x)
$1d:e1e8  1f f1 87 90   ora $9087f1,x
$1d:e1ec  7c a5 e6	  jmp ($e6a5,x)
$1d:e1ef  3f 3a 7a 17   and $177a3a,x
$1d:e1f3  d2 de		 cmp ($de)
$1d:e1f5  a7 f5		 lda [$f5]
$1d:e1f7  c7 b2		 cmp [$b2]
$1d:e1f9  7d b5 ee	  adc $eeb5,x
$1d:e1fc  bf 7e 78 37   lda $37787e,x
$1d:e200  c3 de		 cmp $de,s
$1d:e202  2f f2 07 94   and $9407f2
$1d:e206  7c c5 e7	  jmp ($e7c5,x)
$1d:e209  3f 42 7a 57   and $577a42,x
$1d:e20d  d4 de		 pei ($de)
$1d:e20f  b7 f6		 lda [$f6],y
$1d:e211  47 b6		 eor [$b6]
$1d:e213  7d d5 ef	  adc $efd5,x
$1d:e216  bf 06 78 77   lda $777806,x
$1d:e21a  c5 de		 cmp $de
$1d:e21c  3f f2 87 98   and $9887f2,x
$1d:e220  7c e5 e8	  jmp ($e8e5,x)
$1d:e223  3f 4a 7a 97   and $977a4a,x
$1d:e227  d6 de		 dec $de,x
$1d:e229  c7 f6		 cmp [$f6]
$1d:e22b  c7 ba		 cmp [$ba]
$1d:e22d  4c 03 03	  jmp $0303
$1d:e230  00 09		 brk #$09
$1d:e232  fb			xce
$1d:e233  bb			tyx
$1d:e234  fd ea 70	  sbc $70ea,x
$1d:e237  e9 c0 1c	  sbc #$1cc0
$1d:e23a  68			pla
$1d:e23b  00 71		 brk #$71
$1d:e23d  7a			ply
$1d:e23e  ac e6 37	  ldy $37e6
$1d:e241  36 0c		 rol $0c,x
$1d:e243  05 20		 ora $20
$1d:e245  30 20		 bmi $e267
$1d:e247  f6 91		 inc $91,x
$1d:e249  cf 85 01 50   cmp $500185
$1d:e24d  14 08		 trb $08
$1d:e24f  3d a5 f0	  and $f0a5,x
$1d:e252  18			clc
$1d:e253  c4 24		 cpy $24
$1d:e255  74 42		 stz $42,x
$1d:e257  f7 81		 sbc [$81],y
$1d:e259  44 24 b2	  mvp $b2,$24
$1d:e25c  62 58 6b	  per $4db7
$1d:e25f  c5 f1		 cmp $f1
$1d:e261  08			php
$1d:e262  96 c3		 stx $c3,y
$1d:e264  a7 73		 lda [$73]
$1d:e266  bd b8 fe	  lda $feb8,x
$1d:e269  65 b3		 adc $b3
$1d:e26b  a0 0b 02	  ldy #$020b
$1d:e26e  c2 1c		 rep #$1c
$1d:e270  57 30		 eor [$30],y
$1d:e272  50 85		 bvc $e1f9
$1d:e274  0c 36 33	  tsb $3336
$1d:e277  72 40		 adc ($40)
$1d:e279  4d 43 24	  eor $2443
$1d:e27c  24 31		 bit $31
$1d:e27e  58			cli
$1d:e27f  cf e0 31 a9   cmp $a931e0
$1d:e283  e8			inx
$1d:e284  a4 86		 ldy $86
$1d:e286  85 11		 sta $11
$1d:e288  51 8c		 eor ($8c),y
$1d:e28a  86 05		 stx $05
$1d:e28c  19 51 94	  ora $9451,y
$1d:e28f  48			pha
$1d:e290  28			plp
$1d:e291  32 b2		 and ($b2)
$1d:e293  68			pla
$1d:e294  12 c2		 ora ($c2)
$1d:e296  4e 58 02	  lsr $0258
$1d:e299  50 ad		 bvc $e248
$1d:e29b  00 08		 brk #$08
$1d:e29d  25 c1		 and $c1
$1d:e29f  9d 9d 80	  sta $809d,x
$1d:e2a2  d0 25		 bne $e2c9
$1d:e2a4  b0 62		 bcs $e308
$1d:e2a6  01 3e		 ora ($3e,x)
$1d:e2a8  8d 68 41	  sta $4168
$1d:e2ab  68			pla
$1d:e2ac  03 6a		 ora $6a,s
$1d:e2ae  9b			txy
$1d:e2af  8e 72 20	  stx $2072
$1d:e2b2  11 00		 ora ($00),y
$1d:e2b4  59 16 41	  eor $4116,y
$1d:e2b7  22 08 b2 6c   jsl $6cb208
$1d:e2bb  84 44		 sty $44
$1d:e2bd  21 68		 and ($68,x)
$1d:e2bf  48			pha
$1d:e2c0  bc 24 10	  ldy $1024,x
$1d:e2c3  11 9a		 ora ($9a),y
$1d:e2c5  c6 05		 dec $05
$1d:e2c7  e2 bb		 sep #$bb
$1d:e2c9  05 b0		 ora $b0
$1d:e2cb  40			rti
$1d:e2cc  88			dey
$1d:e2cd  6b			rtl
$1d:e2ce  10 5d		 bpl $e32d
$1d:e2d0  0b			phd
$1d:e2d1  08			php
$1d:e2d2  0e c2 33	  asl $33c2
$1d:e2d5  53 c8		 eor ($c8,s),y
$1d:e2d7  c3 9c		 cmp $9c,s
$1d:e2d9  86 44		 stx $44
$1d:e2db  66 d0		 ror $d0
$1d:e2dd  4e 67 10	  lsr $1067
$1d:e2e0  e6 b0		 inc $b0
$1d:e2e2  0b			phd
$1d:e2e3  c4 e6		 cpy $e6
$1d:e2e5  70 a3		 bvs $e28a
$1d:e2e7  60			rts
$1d:e2e8  c7 0d		 cmp [$0d]
$1d:e2ea  a0 b2		 ldy #$b2
$1d:e2ec  05 99		 ora $99
$1d:e2ee  2c ca 58	  bit $58ca
$1d:e2f1  6d 09 24	  adc $2409
$1d:e2f4  e9 82		 sbc #$82
$1d:e2f6  2c 31 49	  bit $4931
$1d:e2f9  a1 c0		 lda ($c0,x)
$1d:e2fb  1d 5b b7	  ora $b75b,x
$1d:e2fe  46 03		 lsr $03
$1d:e300  ba			tsx
$1d:e301  e7 25		 sbc [$25]
$1d:e303  00 58		 brk #$58
$1d:e305  e3 bb		 sbc $bb,s
$1d:e307  59 de df	  eor $dfde,y
$1d:e30a  df bc e1 fe   cmp $fee1bc,x
$1d:e30e  34 07		 bit $07,x
$1d:e310  f9 00 92	  sbc $9200,y
$1d:e313  1d 36 07	  ora $0736,x
$1d:e316  8d 20 1e	  sta $1e20
$1d:e319  41 23		 eor ($23,x)
$1d:e31b  3f 84 f8 3e   and $3ef884,x
$1d:e31f  35 00		 and $00,x
$1d:e321  f9 08 8d	  sbc $8d08,y
$1d:e324  1e 12 08	  asl $0812,x
$1d:e327  c4 26		 cpy $26
$1d:e329  00 2f		 brk #$2f
$1d:e32b  18			clc
$1d:e32c  48			pha
$1d:e32d  bc cb 61	  ldy $61cb,x
$1d:e330  3a			dec a
$1d:e331  93 c4		 sta ($c4,s),y
$1d:e333  24 b2		 bit $b2
$1d:e335  61 fc		 adc ($fc,x)
$1d:e337  1b			tcs
$1d:e338  02 5e		 cop #$5e
$1d:e33a  3c 0c 31	  bit $310c,x
$1d:e33d  3e 49 c0	  rol $c049,x
$1d:e340  4c 02 90	  jmp $9002
$1d:e343  18			clc
$1d:e344  1f 5d b7 27   ora $27b75d,x
$1d:e348  f9 82 c9	  sbc $c982,y
$1d:e34b  bf 3a d6 a0   lda $a0d63a,x
$1d:e34f  3c e3 e6	  bit $e6e3,x
$1d:e352  2f 59 fa 92   and $92fa59
$1d:e356  7e ee f4	  ror $f4ee,x
$1d:e359  9c cb e0	  stz $e0cb
$1d:e35c  23 c1		 and $c1,s
$1d:e35e  77 9c		 adc [$9c],y
$1d:e360  3a			dec a
$1d:e361  71 38		 adc ($38),y
$1d:e363  a0 4e		 ldy #$4e
$1d:e365  21 d2		 and ($d2,x)
$1d:e367  f8			sed
$1d:e368  12 b0		 ora ($b0)
$1d:e36a  00 20		 brk #$20
$1d:e36c  04 07		 tsb $07
$1d:e36e  a0 c6		 ldy #$c6
$1d:e370  e6 d4		 inc $d4
$1d:e372  89 b4		 bit #$b4
$1d:e374  da			phx
$1d:e375  6e f8 09	  ror $09f8
$1d:e378  a8			tay
$1d:e379  54 02 80	  mvn $80,$02
$1d:e37c  f4 19 1c	  pea $1c19
$1d:e37f  fa			plx
$1d:e380  a1 3e		 lda ($3e,x)
$1d:e382  9f 4f e0 52   sta $52e04f,x
$1d:e386  29 e8		 and #$e8
$1d:e388  94 04		 sty $04,x
$1d:e38a  80 f4		 bra $e380
$1d:e38c  28			plp
$1d:e38d  48			pha
$1d:e38e  cc 64 10	  cpy $1064
$1d:e391  18			clc
$1d:e392  c0 cc		 cpy #$cc
$1d:e394  a1 4f		 lda ($4f,x)
$1d:e396  41 95		 eor ($95,x)
$1d:e398  c9 b5		 cmp #$b5
$1d:e39a  f2 69		 sbc ($69)
$1d:e39c  34 9c		 bit $9c,x
$1d:e39e  10 12		 bpl $e3b2
$1d:e3a0  52 28		 eor ($28)
$1d:e3a2  11 01		 ora ($01),y
$1d:e3a4  fe 33 b9	  inc $b933,x
$1d:e3a7  de de 76	  dec $76de,x
$1d:e3aa  06 07		 asl $07
$1d:e3ac  c0 94		 cpy #$94
$1d:e3ae  40			rti
$1d:e3af  a8			tay
$1d:e3b0  0e f7 04	  asl $04f7
$1d:e3b3  0b			phd
$1d:e3b4  b9 9e 78	  lda $789e,y
$1d:e3b7  61 e0		 adc ($e0,x)
$1d:e3b9  0a			asl a
$1d:e3ba  96 08		 stx $08,y
$1d:e3bc  19 40 80	  ora $8040,y
$1d:e3bf  0d 64 06	  ora $0664
$1d:e3c2  34 2a		 bit $2a,x
$1d:e3c4  78			sei
$1d:e3c5  8b			phb
$1d:e3c6  0c 64 30	  tsb $3064
$1d:e3c9  08			php
$1d:e3ca  cb			wai
$1d:e3cb  0c a2 43	  tsb $43a2
$1d:e3ce  f7 7c		 sbc [$7c],y
$1d:e3d0  01 2b		 ora ($2b,x)
$1d:e3d2  01 04		 ora ($04,x)
$1d:e3d4  5c 83 73 a5   jml $a57383
$1d:e3d8  41 e3		 eor ($e3,x)
$1d:e3da  91 c3		 sta ($c3),y
$1d:e3dc  dc 9c ca	  jml [$ca9c]
$1d:e3df  48			pha
$1d:e3e0  10 d3		 bpl $e3b5
$1d:e3e2  d5 1c		 cmp $1c,x
$1d:e3e4  ca			dex
$1d:e3e5  58			cli
$1d:e3e6  10 d9		 bpl $e3c1
$1d:e3e8  d8			cld
$1d:e3e9  03 5d		 ora $5d,s
$1d:e3eb  fb			xce
$1d:e3ec  b7 77		 lda [$77],y
$1d:e3ee  f0 9c		 beq $e38c
$1d:e3f0  93 60		 sta ($60,s),y
$1d:e3f2  84 50		 sty $50
$1d:e3f4  00 3f		 brk #$3f
$1d:e3f6  8e 73 1b	  stx $1b73
$1d:e3f9  55 82		 eor $82,x
$1d:e3fb  54 81 e2	  mvn $e2,$81
$1d:e3fe  0e 39 cc	  asl $cc39
$1d:e401  8d 76 0a	  sta $0a76
$1d:e404  52 0f		 eor ($0f)
$1d:e406  88			dey
$1d:e407  78			sei
$1d:e408  e7 32		 sbc [$32]
$1d:e40a  f8			sed
$1d:e40b  0a			asl a
$1d:e40c  d4 a1		 pei ($a1)
$1d:e40e  02 f1		 cop #$f1
$1d:e410  17 1a		 ora [$1a],y
$1d:e412  cc 20 4c	  cpy $4c20
$1d:e415  52 74		 eor ($74)
$1d:e417  82 70 47	  brl $2b8a
$1d:e41a  e5 b7		 sbc $b7
$1d:e41c  d6 ad		 dec $ad,x
$1d:e41e  53 5c		 eor ($5c,s),y
$1d:e420  6e 02 71	  ror $7102
$1d:e423  b0 e7		 bcs $e40c
$1d:e425  6f 2f 5d 06   adc $065d2f
$1d:e429  19 df 33	  ora $33df,y
$1d:e42c  a9 7b		 lda #$7b
$1d:e42e  28			plp
$1d:e42f  1e 40 00	  asl $0040,x
$1d:e432  87 f0		 sta [$f0]
$1d:e434  3c 3c 03	  bit $033c,x
$1d:e437  4d b0 07	  eor $07b0
$1d:e43a  f8			sed
$1d:e43b  03 c6		 ora $c6,s
$1d:e43d  39 ad 20	  and $20ad,y
$1d:e440  78			sei
$1d:e441  c7 c4		 cmp [$c4]
$1d:e443  5e 73 f3	  lsr $f373,x
$1d:e446  27 a5		 and [$a5]
$1d:e448  7d 4d e5	  adc $e54d,x
$1d:e44b  7f 44 2f dd   adc $dd2f44,x
$1d:e44f  de 93 99	  dec $9993,x
$1d:e452  7c 05 b8	  jmp ($b805,x)
$1d:e455  2e f5 79	  rol $79f5
$1d:e458  9c 09 98	  stz $9809
$1d:e45b  2e f2 87	  rol $87f2
$1d:e45e  4e 02 21	  lsr $2102
$1d:e461  40			rti
$1d:e462  9c 43 9e	  stz $9e43
$1d:e465  e4 10		 cpx $10
$1d:e467  00 a0		 brk #$a0
$1d:e469  3d 42 37	  and $3742,x
$1d:e46c  36 9b		 rol $9b,x
$1d:e46e  52 04		 eor ($04)
$1d:e470  41 37		 eor ($37,x)
$1d:e472  04 04		 tsb $04
$1d:e474  d4 44		 pei ($44)
$1d:e476  4f 50 91 cf   eor $cf9150
$1d:e47a  a7 d5		 lda [$d5]
$1d:e47c  01 90		 ora ($90,x)
$1d:e47e  4f e0 31 a9   eor $a931e0
$1d:e482  e8			inx
$1d:e483  c8			iny
$1d:e484  80 a4		 bra $e42a
$1d:e486  42 a7		 wdm #$a7
$1d:e488  a9 14		 lda #$14
$1d:e48a  ab			plb
$1d:e48b  ef b7 d6 90   sbc $90d6b7
$1d:e48f  bc a7 64	  ldy $64a7,x
$1d:e492  0e db eb	  asl $ebdb
$1d:e495  4e 5e 63	  lsr $635e
$1d:e498  d9 04 62	  cmp $6204,y
$1d:e49b  13 09		 ora ($09,s),y
$1d:e49d  90 25		 bcc $e4c4
$1d:e49f  e2 57		 sep #$57
$1d:e4a1  27 f8		 and [$f8]
$1d:e4a3  49 64		 eor #$64
$1d:e4a5  d2 78		 cmp ($78)
$1d:e4a7  8b			phb
$1d:e4a8  1d 41 e1	  ora $e141,x
$1d:e4ab  41 97		 eor ($97,x)
$1d:e4ad  fd e5 b4	  sbc $b4e5,x
$1d:e4b0  19 5c 99	  ora $995c,y
$1d:e4b3  ae 7a f9	  ldx $f97a
$1d:e4b6  33 f8		 and ($f8,s),y
$1d:e4b8  1a			inc a
$1d:e4b9  a3 2c		 lda $2c,s
$1d:e4bb  a0 c3		 ldy #$c3
$1d:e4bd  a7 6e		 lda [$6e]
$1d:e4bf  73 db		 adc ($db,s),y
$1d:e4c1  ce c0 48	  dec $48c0
$1d:e4c4  b4 15		 ldy $15,x
$1d:e4c6  98			tya
$1d:e4c7  42 a5		 wdm #$a5
$1d:e4c9  b3 a7		 lda ($a7,s),y
$1d:e4cb  90 3b		 bcc $e508
$1d:e4cd  cd ac 32	  cmp $32ac
$1d:e4d0  78			sei
$1d:e4d1  83 10		 sta $10,s
$1d:e4d3  25 8f		 and $8f
$1d:e4d5  c1 9c		 cmp ($9c,x)
$1d:e4d7  4e 21 cc	  lsr $cc21
$1d:e4da  f0 73		 beq $e54f
$1d:e4dc  84 3a		 sty $3a
$1d:e4de  5f 08 96 b9   eor $b99608,x
$1d:e4e2  80 22		 bra $e506
$1d:e4e4  13 99		 ora ($99,s),y
$1d:e4e6  b4 71		 ldy $71,x
$1d:e4e8  f8			sed
$1d:e4e9  0f 03 88 3e   ora $3e8803
$1d:e4ed  c5 e2		 cmp $e2
$1d:e4ef  33 e9		 and ($e9,s),y
$1d:e4f1  20 85 43	  jsr $4385
$1d:e4f4  00 21		 brk #$21
$1d:e4f6  28			plp
$1d:e4f7  70 a1		 bvs $e49a
$1d:e4f9  04 a5		 tsb $a5
$1d:e4fb  ae db bb	  ldx $bbdb
$1d:e4fe  c8			iny
$1d:e4ff  70 83		 bvs $e484
$1d:e501  57 fb		 eor [$fb],y
$1d:e503  92 15		 sta ($15)
$1d:e505  20 03 f5	  jsr $f503
$1d:e508  27 f9		 and [$f9]
$1d:e50a  01 cd		 ora ($cd,x)
$1d:e50c  2d 0e 07	  and $070e
$1d:e50f  80 3c		 bra $e54d
$1d:e511  42 e0		 wdm #$e0
$1d:e513  49 48		 eor #$48
$1d:e515  84 d6		 sty $d6
$1d:e517  6c a1 39	  jmp ($39a1)
$1d:e51a  b8			clv
$1d:e51b  fd 63 53	  sbc $5363,x
$1d:e51e  d9 f2 c4	  cmp $c4f2,y
$1d:e521  e7 e6		 sbc [$e6]
$1d:e523  f5 88		 sbc $88,x
$1d:e525  af da 24 40   lda $4024da
$1d:e529  40			rti
$1d:e52a  28			plp
$1d:e52b  33 c7		 and ($c7,s),y
$1d:e52d  5e cf 20	  lsr $20cf,x
$1d:e530  58			cli
$1d:e531  a0 84		 ldy #$84
$1d:e533  28			plp
$1d:e534  0d f1 db	  ora $dbf1
$1d:e537  b7 cc		 lda [$cc],y
$1d:e539  22 08 21 1b   jsl $1b2108
$1d:e53d  82 80 26	  brl $0bc0
$1d:e540  ef 07 14 84   sbc $841407
$1d:e544  be 44 b0	  ldx $b044,y
$1d:e547  09 f8		 ora #$f8
$1d:e549  01 85		 ora ($85,x)
$1d:e54b  03 2f		 ora $2f,s
$1d:e54d  84 84		 sty $84
$1d:e54f  06 41		 asl $41
$1d:e551  01 80		 ora ($80,x)
$1d:e553  c6 02		 dec $02
$1d:e555  05 0a		 ora $0a
$1d:e557  1c 84 ad	  trb $ad84
$1d:e55a  a6 52		 ldx $52
$1d:e55c  78			sei
$1d:e55d  14 0a		 trb $0a
$1d:e55f  21 25		 and ($25,x)
$1d:e561  69 13		 adc #$13
$1d:e563  64 1c		 stz $1c
$1d:e565  44 96 00	  mvp $00,$96
$1d:e568  a8			tay
$1d:e569  23 c5		 and $c5,s
$1d:e56b  c6 4e		 dec $4e
$1d:e56d  a3 43		 lda $43,s
$1d:e56f  00 94		 brk #$94
$1d:e571  50 08		 bvc $e57b
$1d:e573  4a			lsr a
$1d:e574  34 30		 bit $30,x
$1d:e576  0d 48 92	  ora $9248
$1d:e579  c9 10		 cmp #$10
$1d:e57b  4b			phk
$1d:e57c  01 14		 ora ($14,x)
$1d:e57e  a1 db		 lda ($db,x)
$1d:e580  2f 8e c9 2a   and $2ac98e
$1d:e584  08			php
$1d:e585  41 8d		 eor ($8d,x)
$1d:e587  a9 80		 lda #$80
$1d:e589  6a			ror a
$1d:e58a  2f 10 dc 7c   and $7cdc10
$1d:e58e  b7 31		 lda [$31],y
$1d:e590  c6 d0		 dec $d0
$1d:e592  ce 64 6b	  dec $6b64
$1d:e595  60			rts
$1d:e596  12 80		 ora ($80)
$1d:e598  00 78		 brk #$78
$1d:e59a  1f 2e 0c 90   ora $900c2e,x
$1d:e59e  fc 43 41	  jsr ($4143,x)
$1d:e5a1  49 aa		 eor #$aa
$1d:e5a3  e0 f6		 cpx #$f6
$1d:e5a5  fa			plx
$1d:e5a6  d1 28		 cmp ($28),y
$1d:e5a8  28			plp
$1d:e5a9  d6 21		 dec $21,x
$1d:e5ab  ae db 90	  ldx $90db
$1d:e5ae  48			pha
$1d:e5af  20 4b 33	  jsr $334b
$1d:e5b2  0e 09 04	  asl $0409
$1d:e5b5  43 e0		 eor $e0,s
$1d:e5b7  29 21		 and #$21
$1d:e5b9  01 0b		 ora ($0b,x)
$1d:e5bb  04 be		 tsb $be
$1d:e5bd  2e 62 1d	  rol $1d62
$1d:e5c0  88			dey
$1d:e5c1  ec 47 8a	  cpx $8a47
$1d:e5c4  e2 a0		 sep #$a0
$1d:e5c6  02 05		 cop #$05
$1d:e5c8  00 0a		 brk #$0a
$1d:e5ca  a2 d1		 ldx #$d1
$1d:e5cc  af 97 db f5   lda $f5db97
$1d:e5d0  fd e3 14	  sbc $14e3,x
$1d:e5d3  da			phx
$1d:e5d4  74 62		 stz $62,x
$1d:e5d6  33 1a		 and ($1a,s),y
$1d:e5d8  8d 80 63	  sta $6380
$1d:e5db  05 0d		 ora $0d
$1d:e5dd  83 04		 sta $04,s
$1d:e5df  6f 15 15 08   adc $081515
$1d:e5e3  e6 0e		 inc $0e
$1d:e5e5  3a			dec a
$1d:e5e6  11 cc		 ora ($cc),y
$1d:e5e8  5c 94 23 80   jml $802394
$1d:e5ec  f2 80		 sbc ($80)
$1d:e5ee  85 36		 sta $36
$1d:e5f0  12 24		 ora ($24)
$1d:e5f2  f1 af		 sbc ($af),y
$1d:e5f4  91 ac		 sta ($ac),y
$1d:e5f6  27 e6		 and [$e6]
$1d:e5f8  4f 48 99 4c   eor $4c9948
$1d:e5fc  cf f2 63 34   cmp $3463f2
$1d:e600  7f a8 20 a6   adc $a620a8,x
$1d:e604  77 eb		 adc [$eb],y
$1d:e606  fd f2 fa	  sbc $faf2,x
$1d:e609  ef 8c 86 46   sbc $46868c
$1d:e60d  35 1b		 and $1b,x
$1d:e60f  8c 46 5f	  sty $5f46
$1d:e612  f1 98		 sbc ($98),y
$1d:e614  cc b4 72	  cpy $72b4
$1d:e617  19 81 68	  ora $6881,y
$1d:e61a  e4 53		 cpx $53
$1d:e61c  12 d1		 ora ($d1)
$1d:e61e  c8			iny
$1d:e61f  e6 01		 inc $01
$1d:e621  a3 92		 lda $92,s
$1d:e623  4c 43 46	  jmp $4643
$1d:e626  57 42		 eor [$42],y
$1d:e628  1d b6 50	  ora $50b6,x
$1d:e62b  8b			phb
$1d:e62c  7c 7d ed	  jmp ($ed7d,x)
$1d:e62f  17 fe		 ora [$fe],y
$1d:e631  86 7c		 stx $7c
$1d:e633  54 ee a3	  mvn $a3,$ee
$1d:e636  3c 49 a8	  bit $a849,x
$1d:e639  50 de		 bvc $e619
$1d:e63b  17 a5		 ora [$a5],y
$1d:e63d  9c 1b 43	  stz $431b
$1d:e640  07 1d		 ora [$1d]
$1d:e642  30 d1		 bmi $e615
$1d:e644  fc 31 72	  jsr ($7231,x)
$1d:e647  53 fe		 eor ($fe,s),y
$1d:e649  60			rts
$1d:e64a  a1 a7		 lda ($a7,x)
$1d:e64c  fc c5 45	  jsr ($45c5,x)
$1d:e64f  4f f8 ef 93   eor $93eff8
$1d:e653  f9 bf da	  sbc $dabf,y
$1d:e656  02 47		 cop #$47
$1d:e658  28			plp
$1d:e659  14 0e		 trb $0e
$1d:e65b  02 0f		 cop #$0f
$1d:e65d  68			pla
$1d:e65e  49 5c		 eor #$5c
$1d:e660  a1 50		 lda ($50,x)
$1d:e662  b8			clv
$1d:e663  48			pha
$1d:e664  7d 96 62	  adc $6296,x
$1d:e667  b3 08		 lda ($08,s),y
$1d:e669  24 14		 bit $14
$1d:e66b  5c ec 31 7d   jml $7d31ec
$1d:e66f  41 1c		 eor ($1c,x)
$1d:e671  81 14		 sta ($14,x)
$1d:e673  57 26		 eor [$26],y
$1d:e675  7a			ply
$1d:e676  7f 43 e6 67   adc $67e643,x
$1d:e67a  37 12		 and [$12],y
$1d:e67c  1b			tcs
$1d:e67d  cc ee 8f	  cpy $8fee
$1d:e680  a5 42		 lda $42
$1d:e682  22 9d 81 e0   jsl $e0819d
$1d:e686  94 43		 sty $43,x
$1d:e688  bb			tyx
$1d:e689  07 c1		 ora [$c1]
$1d:e68b  4e ce 35	  lsr $35ce
$1d:e68e  3a			dec a
$1d:e68f  20 c9 63	  jsr $63c9
$1d:e692  98			tya
$1d:e693  01 8e		 ora ($8e,x)
$1d:e695  49 31		 eor #$31
$1d:e697  03 1c		 ora $1c,s
$1d:e699  86 60		 stx $60
$1d:e69b  46 39		 lsr $39
$1d:e69d  14 c4		 trb $c4
$1d:e69f  80 2d		 bra $e6ce
$1d:e6a1  f8			sed
$1d:e6a2  30 18		 bmi $e6bc
$1d:e6a4  14 0d		 trb $0d
$1d:e6a6  08			php
$1d:e6a7  48			pha
$1d:e6a8  75 06		 adc $06,x
$1d:e6aa  84 26		 sty $26
$1d:e6ac  15 0b		 ora $0b,x
$1d:e6ae  68			pla
$1d:e6af  92 5d		 sta ($5d)
$1d:e6b1  43 a3		 eor $a3,s
$1d:e6b3  04 82		 tsb $82
$1d:e6b5  a9 9c		 lda #$9c
$1d:e6b7  56 cb		 lsr $cb,x
$1d:e6b9  76 7d		 ror $7d,x
$1d:e6bb  c9 0d		 cmp #$0d
$1d:e6bd  41 ae		 eor ($ae,x)
$1d:e6bf  53 50		 eor ($50,s),y
$1d:e6c1  ea			nop
$1d:e6c2  31 20		 and ($20),y
$1d:e6c4  db			stp
$1d:e6c5  4d a2 7e	  eor $7ea2
$1d:e6c8  a2 8d		 ldx #$8d
$1d:e6ca  48			pha
$1d:e6cb  42 0d		 wdm #$0d
$1d:e6cd  45 9a		 eor $9a
$1d:e6cf  a5 85		 lda $85
$1d:e6d1  3a			dec a
$1d:e6d2  ea			nop
$1d:e6d3  05 56		 ora $56
$1d:e6d5  86 0e		 stx $0e
$1d:e6d7  3a			dec a
$1d:e6d8  73 72		 adc ($72,s),y
$1d:e6da  b1 e2		 lda ($e2),y
$1d:e6dc  e4 ae		 cpx $ae
$1d:e6de  38			sec
$1d:e6df  18			clc
$1d:e6e0  16 0a		 asl $0a,x
$1d:e6e2  1a			inc a
$1d:e6e3  f4 72 b1	  pea $b172
$1d:e6e6  e2 a2		 sep #$a2
$1d:e6e8  aa			tax
$1d:e6e9  37 23		 and [$23],y
$1d:e6eb  1b			tcs
$1d:e6ec  bd 8e 6c	  lda $6c8e,x
$1d:e6ef  ff 36 32 82   sbc $823236,x
$1d:e6f3  dd ac a1	  cmp $a1ac,x
$1d:e6f6  b8			clv
$1d:e6f7  24 2c		 bit $2c
$1d:e6f9  0a			asl a
$1d:e6fa  06 2e		 asl $2e
$1d:e6fc  52 c2		 eor ($c2)
$1d:e6fe  c2 a1		 rep #$a1
$1d:e700  63 e7		 adc $e7,s
$1d:e702  72 1c		 adc ($1c)
$1d:e704  12 0a		 ora ($0a)
$1d:e706  4e 74 ab	  lsr $ab74
$1d:e709  17 dd		 ora [$dd],y
$1d:e70b  48			pha
$1d:e70c  86 e8		 stx $e8
$1d:e70e  5a			phy
$1d:e70f  24 05		 bit $05
$1d:e711  fe 09 58	  inc $5809,x
$1d:e714  0a			asl a
$1d:e715  10 3c		 bpl $e753
$1d:e717  18			clc
$1d:e718  36 1e		 rol $1e,x
$1d:e71a  13 18		 ora ($18,s),y
$1d:e71c  b4 71		 ldy $71,x
$1d:e71e  26 a9		 rol $a9
$1d:e720  12 8e		 ora ($8e)
$1d:e722  60			rts
$1d:e723  1b			tcs
$1d:e724  44 81 78	  mvp $78,$81
$1d:e727  0c 93 10	  tsb $1093
$1d:e72a  f5 67		 sbc $67,x
$1d:e72c  72 43		 adc ($43)
$1d:e72e  30 2f		 bmi $e75f
$1d:e730  f8			sed
$1d:e731  20 94 53	  jsr $5394
$1d:e734  12 0f		 ora ($0f)
$1d:e736  87 cc		 sta [$cc]
$1d:e738  99 4c c2	  sta $c24c,y
$1d:e73b  40			rti
$1d:e73c  d5 3a		 cmp $3a,x
$1d:e73e  9a			txs
$1d:e73f  44 83 a3	  mvp $a3,$83
$1d:e742  02 81		 cop #$81
$1d:e744  8f e4 5a 30   sta $305ae4
$1d:e748  a8			tay
$1d:e749  59 3e 5f	  eor $5f3e,y
$1d:e74c  a3 04		 lda $04,s
$1d:e74e  82 b6 14	  brl $fc07
$1d:e751  93 0e		 sta ($0e,s),y
$1d:e753  d7 0e		 cmp [$0e],y
$1d:e755  11 0c		 ora ($0c),y
$1d:e757  94 08		 sty $08,x
$1d:e759  2a			rol a
$1d:e75a  38			sec
$1d:e75b  09 d8 96	  ora #$96d8
$1d:e75e  08			php
$1d:e75f  fa			plx
$1d:e760  30 b2		 bmi $e714
$1d:e762  0f d0 10 08   ora $0810d0
$1d:e766  db			stp
$1d:e767  0b			phd
$1d:e768  08			php
$1d:e769  75 10		 adc $10,x
$1d:e76b  6f 06 36 86   adc $863606
$1d:e76f  0e 3a d8	  asl $d83a
$1d:e772  36 03		 rol $03,x
$1d:e774  e2 e4		 sep #$e4
$1d:e776  af 49 72 8e   lda $8e7249
$1d:e77a  0a			asl a
$1d:e77b  1a			inc a
$1d:e77c  e5 19		 sbc $19
$1d:e77e  94 42		 sty $42,x
$1d:e780  23 12		 and $12,s
$1d:e782  89 85		 bit #$85
$1d:e784  4a			lsr a
$1d:e785  63 06		 adc $06,s
$1d:e787  c5 45		 cmp $45
$1d:e789  5c a3 3a bc   jml $bc3aa3
$1d:e78d  5e 6f 57	  lsr $576f,x
$1d:e790  b1 29		 lda ($29),y
$1d:e792  4e 60 ce	  lsr $ce60
$1d:e795  f1 72		 sbc ($72),y
$1d:e797  84 87		 sty $87
$1d:e799  21 91		 and ($91,x)
$1d:e79b  a2 d1		 ldx #$d1
$1d:e79d  af 97 db f5   lda $f5db97
$1d:e7a1  fe 60 fe	  inc $fe60,x
$1d:e7a4  49 4e		 eor #$4e
$1d:e7a6  63 33		 adc $33,s
$1d:e7a8  4d a7 46	  eor $46a7
$1d:e7ab  23 31		 and $31,s
$1d:e7ad  a8			tay
$1d:e7ae  dc e0 1c	  jml [$1ce0]
$1d:e7b1  8d c1 27	  sta $27c1
$1d:e7b4  a3 94		 lda $94,s
$1d:e7b6  03 e6		 ora $e6,s
$1d:e7b8  ec 12 fa	  cpx $fa12
$1d:e7bb  39 40 5e	  and $5e40,y
$1d:e7be  70 65		 bvs $e825
$1d:e7c0  e8			inx
$1d:e7c1  1b			tcs
$1d:e7c2  d1 fa		 cmp ($fa),y
$1d:e7c4  cc d0 7f	  cpy $7fd0
$1d:e7c7  b1 3f		 lda ($3f),y
$1d:e7c9  72 58		 adc ($58)
$1d:e7cb  a3 06		 lda $06,s
$1d:e7cd  66 9d		 ror $9d
$1d:e7cf  e3 fb		 sbc $fb,s
$1d:e7d1  39 fa 12	  and $12fa,y
$1d:e7d4  70 98		 bvs $e76e
$1d:e7d6  50 a9		 bvc $e781
$1d:e7d8  61 b0		 adc ($b0,x)
$1d:e7da  ec f4 0a	  cpx $0af4
$1d:e7dd  86 33		 stx $33
$1d:e7df  1a			inc a
$1d:e7e0  25 2c		 and $2c
$1d:e7e2  76 3d		 ror $3d,x
$1d:e7e4  be 82 50	  ldx $5082,y
$1d:e7e7  03 b4		 ora $b4,s
$1d:e7e9  1a			inc a
$1d:e7ea  03 09		 ora $09,s
$1d:e7ec  39 1b c1	  and $c11b,y
$1d:e7ef  a0 cf		 ldy #$cf
$1d:e7f1  92 42		 sta ($42)
$1d:e7f3  0c 1a 64	  tsb $641a
$1d:e7f6  d9 46 98	  cmp $9846,y
$1d:e7f9  4c 4a 47	  jmp $474a
$1d:e7fc  06 9d		 asl $9d
$1d:e7fe  3a			dec a
$1d:e7ff  51 d6		 eor ($d6),y
$1d:e801  13 93		 ora ($93,s),y
$1d:e803  11 c1		 ora ($c1),y
$1d:e805  a4 37		 ldy $37
$1d:e807  cb			wai
$1d:e808  ed fa ff	  sbc $fffa
$1d:e80b  90 c8		 bcc $e7d5
$1d:e80d  d1 68		 cmp ($68),y
$1d:e80f  d3 07		 cmp ($07,s),y
$1d:e811  d2 4a		 cmp ($4a)
$1d:e813  63 11		 adc $11,s
$1d:e815  98			tya
$1d:e816  d4 6f		 pei ($6f)
$1d:e818  31 99		 and ($99),y
$1d:e81a  a6 d3		 ldx $d3
$1d:e81c  a7 00		 lda [$00]
$1d:e81e  a4 78		 ldy $78
$1d:e820  1a			inc a
$1d:e821  55 83		 eor $83,x
$1d:e823  a2 f0		 ldx #$f0
$1d:e825  35 29		 and $29,x
$1d:e827  c0 a0		 cpy #$a0
$1d:e829  62 c2 78	  per $60ee
$1d:e82c  1a			inc a
$1d:e82d  d4 e1		 pei ($e1)
$1d:e82f  50 b7		 bvc $e7e8
$1d:e831  e3 b1		 sbc $b1,s
$1d:e833  4e 09 05	  lsr $0509
$1d:e836  06 0e		 asl $0e
$1d:e838  4c a1 b9	  jmp $b9a1
$1d:e83b  b3 04		 lda ($04,s),y
$1d:e83d  0a			asl a
$1d:e83e  91 5e		 sta ($5e),y
$1d:e840  67 53		 adc [$53]
$1d:e842  83 7e		 sta $7e,s
$1d:e844  cf 98 0a 30   cmp $300a98
$1d:e848  9a			txs
$1d:e849  61 b0		 adc ($b0,x)
$1d:e84b  f8			sed
$1d:e84c  4c 2b 45	  jmp $452b
$1d:e84f  04 69		 tsb $69
$1d:e851  8e c7 e3	  stx $e3c7
$1d:e854  31 ae		 and ($ae),y
$1d:e856  14 57		 trb $57
$1d:e858  a0 d4		 ldy #$d4
$1d:e85a  2c 76 4b	  bit $4b76
$1d:e85d  bd bd f4	  lda $f4bd,x
$1d:e860  39 6f ca	  and $ca6f,y
$1d:e863  bc c8 a1	  ldy $a1c8,x
$1d:e866  6b			rtl
$1d:e867  b6 56		 ldx $56,y
$1d:e869  ab			plb
$1d:e86a  75 cb		 adc $cb,x
$1d:e86c  4d aa c0	  eor $c0aa
$1d:e86f  af 49 b4 de   lda $deb449
$1d:e873  e7 74		 sbc [$74]
$1d:e875  ad 3d c2	  lda $c23d
$1d:e878  e3 72		 sbc $72,s
$1d:e87a  07 2b		 ora [$2b]
$1d:e87c  04 2d		 tsb $2d
$1d:e87e  b6 eb		 ldx $eb,y
$1d:e880  40			rti
$1d:e881  1c 2a 36	  trb $362a
$1d:e884  80 f3		 bra $e879
$1d:e886  83 02		 sta $02,s
$1d:e888  a2 17		 ldx #$17
$1d:e88a  0b			phd
$1d:e88b  45 44		 eor $44
$1d:e88d  3c e1 c0	  bit $c0e1,x
$1d:e890  a8			tay
$1d:e891  8d c6 a3	  sta $a3c6
$1d:e894  58			cli
$1d:e895  0f b4 ba bb   ora $bbbab4
$1d:e899  50 0e		 bvc $e8a9
$1d:e89b  05 02		 ora $02
$1d:e89d  91 65		 sta ($65),y
$1d:e89f  0f b4 7a 41   ora $417ab4
$1d:e8a3  16 ae		 asl $ae,x
$1d:e8a5  d7 8d		 cmp [$8d],y
$1d:e8a7  41 5f		 eor ($5f,x)
$1d:e8a9  0f b1 94 65   ora $6594b1
$1d:e8ad  d9 4c a6	  cmp $a64c,y
$1d:e8b0  54 dd 26	  mvn $26,$dd
$1d:e8b3  60			rts
$1d:e8b4  8b			phb
$1d:e8b5  49 e2		 eor #$e2
$1d:e8b7  c7 ea		 cmp [$ea]
$1d:e8b9  33 04		 and ($04,s),y
$1d:e8bb  7e 3c 8e	  ror $8e3c,x
$1d:e8be  b6 08		 ldx $08,y
$1d:e8c0  a7 b9		 lda [$b9]
$1d:e8c2  7b			tdc
$1d:e8c3  ec ef 4f	  cpx $4fef
$1d:e8c6  ee 5f 38	  inc $385f
$1d:e8c9  f0 1b		 beq $e8e6
$1d:e8cb  80 68		 bra $e935
$1d:e8cd  28			plp
$1d:e8ce  b4 62		 ldy $62,x
$1d:e8d0  02 58		 cop #$58
$1d:e8d2  46 e1		 lsr $e1
$1d:e8d4  5b			tcd
$1d:e8d5  ae 56 85	  ldx $8556
$1d:e8d8  41 4d		 eor ($4d,x)
$1d:e8da  a7 3e		 lda [$3e]
$1d:e8dc  54 8e 0f	  mvn $0f,$8e
$1d:e8df  50 ad		 bvc $e88e
$1d:e8e1  0e 82 59	  asl $5982
$1d:e8e4  2d 7c a8	  and $a87c
$1d:e8e7  f0 00		 beq $e8e9
$1d:e8e9  a1 68		 lda ($68,x)
$1d:e8eb  b6 db		 ldx $db,y
$1d:e8ed  94 cd		 sty $cd,x
$1d:e8ef  61 a8		 adc ($a8,x)
$1d:e8f1  da			phx
$1d:e8f2  02 a0		 cop #$a0
$1d:e8f4  49 15		 eor #$15
$1d:e8f6  33 56		 and ($56,s),y
$1d:e8f8  6a			ror a
$1d:e8f9  23 41		 and $41,s
$1d:e8fb  2c 8a 99	  bit $998a
$1d:e8fe  aa			tax
$1d:e8ff  f4 82 20	  pea $2082
$1d:e902  d0 2b		 bne $e92f
$1d:e904  d2 f5		 cmp ($f5)
$1d:e906  33 d7		 and ($d7,s),y
$1d:e908  ab			plb
$1d:e909  b5 e8		 lda $e8,x
$1d:e90b  bc 9e 11	  ldy $119e,x
$1d:e90e  1f 53 3e 53   ora $533e53,x
$1d:e912  2b			pld
$1d:e913  94 97		 sty $97,x
$1d:e915  99 9d 58	  sta $589d,y
$1d:e918  32 78		 and ($78)
$1d:e91a  b4 9c		 ldy $9c,x
$1d:e91c  e9 2a		 sbc #$2a
$1d:e91e  d0 8f		 bne $e8af
$1d:e920  c7 90		 cmp [$90]
$1d:e922  74 6e		 stz $6e,x
$1d:e924  04 9d		 tsb $9d
$1d:e926  2a			rol a
$1d:e927  fd 79 ec	  sbc $ec79,x
$1d:e92a  df 6f 70 03   cmp $03706f,x
$1d:e92e  04 00		 tsb $00
$1d:e930  0c 9f d1	  tsb $d19f
$1d:e933  67 ce		 adc [$ce]
$1d:e935  fa			plx
$1d:e936  bc 4f a8	  ldy $a84f,x
$1d:e939  b3 f7		 lda ($f7,s),y
$1d:e93b  fd 5e 1d	  sbc $1d5e,x
$1d:e93e  fe 00 f0	  inc $f000,x
$1d:e941  8e 74 87	  stx $8774
$1d:e944  e7 d3		 sbc [$d3]
$1d:e946  e7 72		 sbc [$72]
$1d:e948  08			php
$1d:e949  e7 c9		 sbc [$c9]
$1d:e94b  bc 40 09	  ldy $0940,x
$1d:e94e  e7 03		 sbc [$03]
$1d:e950  23 17		 and $17,s
$1d:e952  63 9b		 adc $9b,s
$1d:e954  cd eb 13	  cmp $13eb
$1d:e957  ab			plb
$1d:e958  9f b4 da 6d   sta $6ddab4,x
$1d:e95c  cb			wai
$1d:e95d  d7 04		 cmp [$04],y
$1d:e95f  80 de		 bra $e93f
$1d:e961  6f 45 fa 81   adc $81fa45
$1d:e965  13 d1		 ora ($d1,s),y
$1d:e967  05 79		 ora $79
$1d:e969  9c d7 31	  stz $31d7
$1d:e96c  42 5a		 wdm #$5a
$1d:e96e  c4 3b		 cpy $3b
$1d:e970  4e 76 44	  lsr $4476
$1d:e973  74 e4		 stz $e4,x
$1d:e975  7f 51 29 a8   adc $a82951,x
$1d:e979  d7 ac		 cmp [$ac],y
$1d:e97b  55 51		 eor $51,x
$1d:e97d  c8			iny
$1d:e97e  85 5f		 sta $5f
$1d:e980  8f 57 ec 47   sta $47ec57
$1d:e984  07 10		 ora [$10]
$1d:e986  f5 7b		 sbc $7b,x
$1d:e988  e8			inx
$1d:e989  b2 bc		 lda ($bc)
$1d:e98b  0b			phd
$1d:e98c  95 de		 sta $de,x
$1d:e98e  02 e4		 cop #$e4
$1d:e990  77 80		 adc [$80],y
$1d:e992  a1 5f		 lda ($5f,x)
$1d:e994  ea			nop
$1d:e995  ef f0 07 84   sbc $8407f0
$1d:e999  7b			tdc
$1d:e99a  91 d4		 sta ($d4),y
$1d:e99c  fd ac 43	  sbc $43ac,x
$1d:e99f  92 17		 sta ($17)
$1d:e9a1  15 89		 ora $89,x
$1d:e9a3  8b			phb
$1d:e9a4  c3 9a		 cmp $9a,s
$1d:e9a6  51 2e		 eor ($2e),y
$1d:e9a8  b0 5c		 bcs $ea06
$1d:e9aa  4a			lsr a
$1d:e9ab  27 78		 and [$78]
$1d:e9ad  bc 6d 0c	  ldy $0c6d,x
$1d:e9b0  25 b7		 and $b7
$1d:e9b2  2f 81 81 2f   and $2f8181
$1d:e9b6  57 ab		 eor [$ab],y
$1d:e9b8  dc 04 e4	  jml [$e404]
$1d:e9bb  37 93		 and [$93],y
$1d:e9bd  78			sei
$1d:e9be  1c 11 20	  trb $2011
$1d:e9c1  67 fa		 adc [$fa]
$1d:e9c3  d6 28		 dec $28,x
$1d:e9c5  89 23		 bit #$23
$1d:e9c7  10 3e		 bpl $ea07
$1d:e9c9  73 05		 adc ($05,s),y
$1d:e9cb  da			phx
$1d:e9cc  66 9f		 ror $9f
$1d:e9ce  27 11		 and [$11]
$1d:e9d0  2c 99 5e	  bit $5e99
$1d:e9d3  5d 4f bf	  eor $bf4f,x
$1d:e9d6  23 fa		 and $fa,s
$1d:e9d8  c2 26		 rep #$26
$1d:e9da  09 27 ff	  ora #$ff27
$1d:e9dd  bd ca 70	  lda $70ca,x
$1d:e9e0  d8			cld
$1d:e9e1  59 de ac	  eor $acde,y
$1d:e9e4  67 11		 adc [$11]
$1d:e9e6  0a			asl a
$1d:e9e7  00 d5		 brk #$d5
$1d:e9e9  e1 e0		 sbc ($e0,x)
$1d:e9eb  1f 09 57 db   ora $db5709,x
$1d:e9ef  92 67		 sta ($67)
$1d:e9f1  16 28		 asl $28,x
$1d:e9f3  a9 d7 93	  lda #$93d7
$1d:e9f6  f6 eb		 inc $eb,x
$1d:e9f8  19 c7 9a	  ora $9ac7,y
$1d:e9fb  53 5e		 eor ($5e,s),y
$1d:e9fd  c9 30 76	  cmp #$7630
$1d:ea00  e5 01		 sbc $01
$1d:ea02  da			phx
$1d:ea03  18			clc
$1d:ea04  d3 6e		 cmp ($6e,s),y
$1d:ea06  b0 02		 bcs $ea0a
$1d:ea08  68			pla
$1d:ea09  5e 6f 47	  lsr $476f,x
$1d:ea0c  00 bd		 brk #$bd
$1d:ea0e  c0 4e		 cpy #$4e
$1d:ea10  87 08		 sta [$08]
$1d:ea12  e7 75		 sbc [$75]
$1d:ea14  79 7f 78	  adc $787f,y
$1d:ea17  01 fe		 ora ($fe,x)
$1d:ea19  15 e1		 ora $e1,x
$1d:ea1b  c9 cc 66	  cmp #$66cc
$1d:ea1e  79 88 f4	  adc $f488,y
$1d:ea21  d6 21		 dec $21,x
$1d:ea23  d3 67		 cmp ($67,s),y
$1d:ea25  39 22 af	  and $af22,y
$1d:ea28  3e 04 88	  rol $8804,x
$1d:ea2b  3d 76 a5	  and $a576,x
$1d:ea2e  3f 89 df 57   and $57df89,x
$1d:ea32  7f 29 be 3d   adc $3dbe29,x
$1d:ea36  c6 24		 dec $24
$1d:ea38  ce 76 5c	  dec $5c76
$1d:ea3b  8e a7 dc	  stx $dca7
$1d:ea3e  8a			txa
$1d:ea3f  0f 21 46 06   ora $064621
$1d:ea43  c7 5a		 cmp [$5a]
$1d:ea45  fb			xce
$1d:ea46  0d 46 bc	  ora $bc46
$1d:ea49  8a			txa
$1d:ea4a  eb			xba
$1d:ea4b  d0 d5		 bne $ea22
$1d:ea4d  6a			ror a
$1d:ea4e  f5 4e		 sbc $4e,x
$1d:ea50  f1 23		 sbc ($23),y
$1d:ea52  33 34		 and ($34,s),y
$1d:ea54  21 34		 and ($34,x)
$1d:ea56  5d 83 fe	  eor $fe83,x
$1d:ea59  e1 41		 sbc ($41,x)
$1d:ea5b  d0 07		 bne $ea64
$1d:ea5d  d8			cld
$1d:ea5e  40			rti
$1d:ea5f  5f f4 ff 0f   eor $0ffff4,x
$1d:ea63  47 20		 eor [$20]
$1d:ea65  1e 9d 56	  asl $569d,x
$1d:ea68  f8			sed
$1d:ea69  f2 c7		 sbc ($c7)
$1d:ea6b  43 e7		 eor $e7,s
$1d:ea6d  a5 3f		 lda $3f
$1d:ea6f  d1 f2		 cmp ($f2),y
$1d:ea71  59 9c fb	  eor $fb9c,y
$1d:ea74  fc 29 04	  jsr ($0429,x)
$1d:ea77  e5 e4		 sbc $e4
$1d:ea79  e8			inx
$1d:ea7a  27 1a		 and [$1a]
$1d:ea7c  a9 c4 e0	  lda #$e0c4
$1d:ea7f  1e 45 f5	  asl $f545,x
$1d:ea82  cd ec 3d	  cmp $3dec
$1d:ea85  3a			dec a
$1d:ea86  2c eb fc	  bit $fceb
$1d:ea89  81 e9		 sta ($e9,x)
$1d:ea8b  d4 d1		 pei ($d1)
$1d:ea8d  ec 3d 5a	  cpx $5a3d
$1d:ea90  2d 29 ee	  and $ee29
$1d:ea93  1e 83 ea	  asl $ea83,x
$1d:ea96  24 90		 bit $90
$1d:ea98  84 27		 sty $27
$1d:ea9a  1a			inc a
$1d:ea9b  16 f9		 asl $f9,x
$1d:ea9d  37 c8		 and [$c8],y
$1d:ea9f  b2 2b		 lda ($2b)
$1d:eaa1  01 9c		 ora ($9c,x)
$1d:eaa3  69 df 64	  adc #$64df
$1d:eaa6  fb			xce
$1d:eaa7  23 48		 and $48,s
$1d:eaa9  4e 58 02	  lsr $0258
$1d:eaac  79 00 68	  adc $6800,y
$1d:eaaf  34 55		 bit $55,x
$1d:eab1  a0 0d		 ldy #$0d
$1d:eab3  01 9c		 ora ($9c,x)
$1d:eab5  07 05		 ora [$05]
$1d:eab7  c3 4c		 cmp $4c,s
$1d:eab9  16 60		 asl $60,x
$1d:eabb  b3 45		 lda ($45,s),y
$1d:eabd  da			phx
$1d:eabe  4a			lsr a
$1d:eabf  e1 ca		 sbc ($ca,x)
$1d:eac1  2f a4 1f be   and $be1fa4
$1d:eac5  a2 09		 ldx #$09
$1d:eac7  fb			xce
$1d:eac8  86 84		 stx $84
$1d:eaca  a3 41		 lda $41,s
$1d:eacc  7a			ply
$1d:eacd  75 7e		 adc $7e,x
$1d:eacf  c3 30		 cmp $30,s
$1d:ead1  50 a0		 bvc $ea73
$1d:ead3  cd 3a 9f	  cmp $9f3a
$1d:ead6  71 9b		 adc ($9b),y
$1d:ead8  91 18		 sta ($18),y
$1d:eada  c0 e5		 cpy #$e5
$1d:eadc  56 2a		 lsr $2a,x
$1d:eade  91 34		 sta ($34),y
$1d:eae0  8f bc 35 3f   sta $3f35bc
$1d:eae4  e8			inx
$1d:eae5  ce 0f b2	  dec $b20f
$1d:eae8  49 1e 52	  eor #$521e
$1d:eaeb  bc bd ab	  ldy $abbd,x
$1d:eaee  42 57		 wdm #$57
$1d:eaf0  9f 29 df e0   sta $e0df29,x
$1d:eaf4  0f 0f e2 fc   ora $fce20f
$1d:eaf8  33 39		 and ($39,s),y
$1d:eafa  9c d1 24	  stz $24d1
$1d:eafd  39 f0 28	  and $28f0,y
$1d:eb00  04 02		 tsb $02
$1d:eb02  07 ce		 ora [$ce]
$1d:eb04  e4 ec		 cpx $ec
$1d:eb06  e7 2d		 sbc [$2d]
$1d:eb08  70 9c		 bvs $eaa6
$1d:eb0a  4e 34 2f	  lsr $2f34
$1d:eb0d  47 d7		 eor [$d7]
$1d:eb0f  6a			ror a
$1d:eb10  68			pla
$1d:eb11  ba			tsx
$1d:eb12  2c ec e7	  bit $e7ec
$1d:eb15  64 f4		 stz $f4
$1d:eb17  90 78		 bcc $eb91
$1d:eb19  69 75 1a	  adc #$1a75
$1d:eb1c  f0 24		 beq $eb42
$1d:eb1e  f2 01		 sbc ($01)
$1d:eb20  82 13 a1	  brl $8c36
$1d:eb23  78			sei
$1d:eb24  6c c4 5e	  jmp ($5ec4)
$1d:eb27  33 f2		 and ($f2,s),y
$1d:eb29  27 95		 and [$95]
$1d:eb2b  7c cd e7	  jmp ($e7cd,x)
$1d:eb2e  7f 04 2f 2b   adc $2b2f04,x
$1d:eb32  96 91		 stx $91,y
$1d:eb34  c7 78		 cmp [$78]
$1d:eb36  67 d0		 adc [$d0]
$1d:eb38  56 ff		 lsr $ff,x
$1d:eb3a  0d 58 0a	  ora $0a58
$1d:eb3d  43 a3		 eor $a3,s
$1d:eb3f  b0 0f		 bcs $eb50
$1d:eb41  86 70		 stx $70
$1d:eb43  09 33 88	  ora #$8833
$1d:eb46  53 7c		 eor ($7c,s),y
$1d:eb48  5e 52 12	  lsr $1252,x
$1d:eb4b  20 0d 20	  jsr $200d
$1d:eb4e  88			dey
$1d:eb4f  02 be		 cop #$be
$1d:eb51  e0 d1		 cpx #$d1
$1d:eb53  3f e7 dc 17   and $17dce7,x
$1d:eb57  24 11		 bit $11
$1d:eb59  75 7e		 adc $7e,x
$1d:eb5b  c3 30		 cmp $30,s
$1d:eb5d  13 9f		 ora ($9f,s),y
$1d:eb5f  f4 32 0f	  pea $0f32
$1d:eb62  f2 ea		 sbc ($ea)
$1d:eb64  7d c8 60	  adc $60c8,x
$1d:eb67  27 ae		 and [$ae]
$1d:eb69  45 03		 eor $03
$1d:eb6b  d1 4a		 cmp ($4a),y
$1d:eb6d  0b			phd
$1d:eb6e  d0 cc		 bne $eb3c
$1d:eb70  3c e3 62	  bit $62e3,x
$1d:eb73  05 39		 ora $39
$1d:eb75  0c 29 84	  tsb $8429
$1d:eb78  63 0d		 adc $0d,s
$1d:eb7a  f9 31 82	  sbc $8231,y
$1d:eb7d  8b			phb
$1d:eb7e  d4 fd		 pei ($fd)
$1d:eb80  8f 51 07 e1   sta $e10751
$1d:eb84  49 9c 68	  eor #$689c
$1d:eb87  79 4c 1b	  adc $1b4c,y
$1d:eb8a  9c 69 f6	  stz $f669
$1d:eb8d  3a			dec a
$1d:eb8e  d6 8d		 dec $8d,x
$1d:eb90  4e 1b e1	  lsr $e11b
$1d:eb93  aa			tax
$1d:eb94  70 d5		 bvs $eb6b
$1d:eb96  17 60		 ora [$60],y
$1d:eb98  ef c3 bb 2c   sbc $2cbbc3
$1d:eb9c  5c f0 23 51   jml $5123f0
$1d:eba0  03 18		 ora $18,s
$1d:eba2  d4 d3		 pei ($d3)
$1d:eba4  04 46		 tsb $46
$1d:eba6  00 31		 brk #$31
$1d:eba8  91 4c		 sta ($4c),y
$1d:ebaa  90 a1		 bcc $eb4d
$1d:ebac  b5 5b		 lda $5b,x
$1d:ebae  38			sec
$1d:ebaf  ad 43 44	  lda $4443
$1d:ebb2  aa			tax
$1d:ebb3  30 bb		 bmi $eb70
$1d:ebb5  08			php
$1d:ebb6  cf fa 25 f0   cmp $f025fa
$1d:ebba  35 ae		 and $ae,x
$1d:ebbc  88			dey
$1d:ebbd  6f 41 32 15   adc $153241
$1d:ebc1  90 6f		 bcc $ec32
$1d:ebc3  cd 9e 80	  cmp $809e
$1d:ebc6  0e 52 fc	  asl $fc52
$1d:ebc9  3d ac 22	  and $22ac,x
$1d:ebcc  5f 8b 1c f6   eor $f61c8b,x
$1d:ebd0  3a			dec a
$1d:ebd1  d6 7e		 dec $7e,x
$1d:ebd3  4e 35 4d	  lsr $4d35
$1d:ebd6  fc a2 ec	  jsr ($eca2,x)
$1d:ebd9  28			plp
$1d:ebda  ba			tsx
$1d:ebdb  2d 22 00	  and $0022
$1d:ebde  3b			tsc
$1d:ebdf  5c c7 b8 f6   jml $f6b8c7
$1d:ebe3  f9 3b 39	  sbc $393b,y
$1d:ebe6  c9 de 50	  cmp #$50de
$1d:ebe9  01 c9		 ora ($c9,x)
$1d:ebeb  d7 6a		 cmp [$6a],y
$1d:ebed  5f f8 fd fd   eor $fdfdf8,x
$1d:ebf1  4a			lsr a
$1d:ebf2  1e 43 46	  asl $4643,x
$1d:ebf5  ab			plb
$1d:ebf6  50 37		 bvc $ec2f
$1d:ebf8  85 fc		 sta $fc
$1d:ebfa  91 e5		 sta ($e5),y
$1d:ebfc  94 17		 sty $17,x
$1d:ebfe  e1 b4		 sbc ($b4,x)
$1d:ec00  07 f8		 ora [$f8]
$1d:ec02  5d f3 77	  eor $77f3,x
$1d:ec05  f2 97		 sbc ($97)
$1d:ec07  f5 cb		 sbc $cb,x
$1d:ec09  56 86		 lsr $86,x
$1d:ec0b  c7 5a		 cmp [$5a]
$1d:ec0d  cf ac fc e2   cmp $e2fcac
$1d:ec11  71 aa		 adc ($aa),y
$1d:ec13  6f dc e2 00   adc $00e2dc
$1d:ec17  ef f0 07 84   sbc $8407f0
$1d:ec1b  7c 45 e3	  jmp ($e345,x)
$1d:ec1e  3f 22 79 57   and $577922,x
$1d:ec22  cc de 77	  cpy $77de
$1d:ec25  f4 47 a3	  pea $a347
$1d:ec28  d3 59		 cmp ($59,s),y
$1d:ec2a  02 47		 cop #$47
$1d:ec2c  8c 0f 58	  sty $580f
$1d:ec2f  8f 7e 47 45   sta $45477e
$1d:ec33  62 5c 84	  per $7092
$1d:ec36  bc 4d 65	  ldy $654d,x
$1d:ec39  ac 20 97	  ldy $9720
$1d:ec3c  a9 a1 9f	  lda #$9fa1
$1d:ec3f  ee 0f 78	  inc $780f
$1d:ec42  f8			sed
$1d:ec43  0b			phd
$1d:ec44  c2 7e		 rep #$7e
$1d:ec46  24 f1		 bit $f1
$1d:ec48  af 91 bc 9c   lda $9cbc91
$1d:ec4c  b4 59		 ldy $59,x
$1d:ec4e  f4 fc bf	  pea $bffc
$1d:ec51  45 e0		 eor $e0
$1d:ec53  9f cf 8d f4   sta $f48dcf,x
$1d:ec57  5e f3 7f	  lsr $7ff3,x
$1d:ec5a  a0 37 90	  ldy #$9037
$1d:ec5d  af c8 07 35   lda $3507c8
$1d:ec61  7f 90 0d a3   adc $a30d90,x
$1d:ec65  3f 20 10 16   and $161020,x
$1d:ec69  fe 40 1d	  inc $1d40,x
$1d:ec6c  de ff f0	  dec $f0ff,x
$1d:ec6f  87 88		 sta [$88]
$1d:ec71  7c 65 e4	  jmp ($e465,x)
$1d:ec74  3f 2a 79 97   and $97792a,x
$1d:ec78  ce de 87	  dec $87de
$1d:ec7b  f4 c7 aa	  pea $aac7
$1d:ec7e  7d 75 ec	  adc $ec75,x
$1d:ec81  bf 6e 7c 00   lda $007c6e,x
$1d:ec85  00 08		 brk #$08
$1d:ec87  80 3b		 bra $ecc4
$1d:ec89  d6 11		 dec $11,x
$1d:ec8b  50 7b		 bvc $ed08
$1d:ec8d  a4 32		 ldy $32
$1d:ec8f  c0 ff 1c	  cpy #$1cff
$1d:ec92  00 0c		 brk #$0c
$1d:ec94  68			pla
$1d:ec95  40			rti
$1d:ec96  55 8c		 eor $8c,x
$1d:ec98  c3 23		 cmp $23,s
$1d:ec9a  50 c9		 bvc $ec65
$1d:ec9c  08			php
$1d:ec9d  4c 40 84	  jmp $8440
$1d:eca0  14 28		 trb $28
$1d:eca2  b8			clv
$1d:eca3  44 64 10	  mvp $10,$64
$1d:eca6  c9 80 0c	  cmp #$0c80
$1d:eca9  e0 30 c8	  cpx #$c830
$1d:ecac  80 1c		 bra $ecca
$1d:ecae  e2 22		 sep #$22
$1d:ecb0  d3 10		 cmp ($10,s),y
$1d:ecb2  00 d1		 brk #$d1
$1d:ecb4  00 81		 brk #$81
$1d:ecb6  12 01		 ora ($01)
$1d:ecb8  98			tya
$1d:ecb9  10 20		 bpl $ecdb
$1d:ecbb  44 55 12	  mvp $12,$55
$1d:ecbe  14 60		 trb $60
$1d:ecc0  1e 21 00	  asl $0021,x
$1d:ecc3  2c 00 80	  bit $8000
$1d:ecc6  84 00		 sty $00
$1d:ecc8  5a			phy
$1d:ecc9  23 02		 and $02,s
$1d:eccb  65 00		 adc $00
$1d:eccd  b2 70		 lda ($70)
$1d:eccf  20 21 54	  jsr $5421
$1d:ecd2  50 62		 bvc $ed36
$1d:ecd4  08			php
$1d:ecd5  24 21		 bit $21
$1d:ecd7  05 08		 ora $08
$1d:ecd9  28			plp
$1d:ecda  56 54		 lsr $54,x
$1d:ecdc  b8			clv
$1d:ecdd  dd 13 62	  cmp $6213,x
$1d:ece0  20 05 02	  jsr $0205
$1d:ece3  11 91		 ora ($91),y
$1d:ece5  51 31		 eor ($31),y
$1d:ece7  cc 22 dc	  cpy $dc22
$1d:ecea  72 11		 adc ($11)
$1d:ecec  cc 2a dc	  cpy $dc2a
$1d:ecef  72 27		 adc ($27)
$1d:ecf1  95 c1		 sta $c1,x
$1d:ecf3  af c4 28 d7   lda $d728c4
$1d:ecf7  56 b8		 lsr $b8,x
$1d:ecf9  3e cc 10	  rol $10cc,x
$1d:ecfc  53 10		 eor ($10,s),y
$1d:ecfe  18			clc
$1d:ecff  63 1b		 adc $1b,s
$1d:ed01  00 00		 brk #$00
$1d:ed03  00 42		 brk #$42
$1d:ed05  08			php
$1d:ed06  02 c8		 cop #$c8
$1d:ed08  15 28		 ora $28,x
$1d:ed0a  e6 81		 inc $81
$1d:ed0c  76 7a		 ror $7a,x
$1d:ed0e  16 0a		 asl $0a,x
$1d:ed10  e4 d7		 cpx $d7
$1d:ed12  e2 70		 sep #$70
$1d:ed14  28			plp
$1d:ed15  1c 32 09	  trb $0932
$1d:ed18  0c 89 c3	  tsb $c389
$1d:ed1b  22 81 37 91   jsl $913781
$1d:ed1f  c3 24		 cmp $24,s
$1d:ed21  90 c9		 bcc $ecec
$1d:ed23  9c 32 69	  stz $6932
$1d:ed26  0c 92 89	  tsb $8992
$1d:ed29  c6 6a		 dec $6a
$1d:ed2b  2b			pld
$1d:ed2c  13 c1		 ora ($c1,s),y
$1d:ed2e  3d 01 08	  and $0801,x
$1d:ed31  18			clc
$1d:ed32  18			clc
$1d:ed33  66 08		 ror $08
$1d:ed35  6e 51 cc	  ror $cc51
$1d:ed38  93 0c		 sta ($0c,s),y
$1d:ed3a  07 e2		 ora [$e2]
$1d:ed3c  00 02		 brk #$02
$1d:ed3e  e1 3d		 sbc ($3d,x)
$1d:ed40  06 99		 asl $99
$1d:ed42  04 a6		 tsb $a6
$1d:ed44  40			rti
$1d:ed45  e9 91		 sbc #$91
$1d:ed47  4a			lsr a
$1d:ed48  64 4c		 stz $4c
$1d:ed4a  a6 d0		 ldx $d0
$1d:ed4c  ca			dex
$1d:ed4d  1c 32 88	  trb $8832
$1d:ed50  53 08		 eor ($08,s),y
$1d:ed52  65 52		 adc $52
$1d:ed54  19 45 33	  ora $3345,y
$1d:ed57  8d 54 d6	  sta $d654
$1d:ed5a  20 c2 b8	  jsr $b8c2
$1d:ed5d  35 42		 and $42,x
$1d:ed5f  11 00		 ora ($00),y
$1d:ed61  3b			tsc
$1d:ed62  a0 fd		 ldy #$fd
$1d:ed64  d3 80		 cmp ($80,s),y
$1d:ed66  1e 04 41	  asl $4104,x
$1d:ed69  3c 09 e0	  bit $e009,x
$1d:ed6c  34 c9		 bit $c9,x
$1d:ed6e  2a			rol a
$1d:ed6f  5c 66 a9 b1   jml $b1a966
$1d:ed73  92 53		 sta ($53)
$1d:ed75  24 74		 bit $74
$1d:ed77  c9 a5		 cmp #$a5
$1d:ed79  30 48		 bmi $edc3
$1d:ed7b  12 08		 ora ($08)
$1d:ed7d  64 c1		 stz $c1
$1d:ed7f  4e 63 42	  lsr $4263
$1d:ed82  18			clc
$1d:ed83  12 20		 ora ($20)
$1d:ed85  05 4c		 ora $4c
$1d:ed87  c0 47		 cpy #$47
$1d:ed89  20 05 8c	  jsr $8c05
$1d:ed8c  ee d4 ca	  inc $cad4
$1d:ed8f  2b			pld
$1d:ed90  5c 6a ad b1   jml $b1ad6a
$1d:ed94  31 05		 and ($05),y
$1d:ed96  0e 98 66	  asl $6698
$1d:ed99  00 f0		 brk #$f0
$1d:ed9b  2b			pld
$1d:ed9c  09 6c		 ora #$6c
$1d:ed9e  03 22		 ora $22,s
$1d:eda0  57 13		 eor [$13],y
$1d:eda2  a9 96		 lda #$96
$1d:eda4  48			pha
$1d:eda5  34 0c		 bit $0c,x
$1d:eda7  06 32		 asl $32
$1d:eda9  ea			nop
$1d:edaa  07 05		 ora [$05]
$1d:edac  fb			xce
$1d:edad  9c 00 e0	  stz $e000
$1d:edb0  09 02		 ora #$02
$1d:edb2  89 24		 bit #$24
$1d:edb4  52 19		 eor ($19)
$1d:edb6  11 26		 ora ($26),y
$1d:edb8  81 1c		 sta ($1c,x)
$1d:edba  52 40		 eor ($40)
$1d:edbc  ac 45 50	  ldy $5045
$1d:edbf  1c 0a e7	  trb $e70a
$1d:edc2  0c c1 0d	  tsb $0dc1
$1d:edc5  cf 02 37 12   cmp $123702
$1d:edc9  01 60		 ora ($60,x)
$1d:edcb  23 98		 and $98,s
$1d:edcd  47 59		 eor [$59]
$1d:edcf  93 0c		 sta ($0c,s),y
$1d:edd1  92 27		 sta ($27)
$1d:edd3  00 12		 brk #$12
$1d:edd5  00 90		 brk #$90
$1d:edd7  22 04 71 e8   jsl $e87104
$1d:eddb  17 d7		 ora [$d7],y
$1d:eddd  80 5f		 bra $ee3e
$1d:eddf  28			plp
$1d:ede0  e6 c2		 inc $c2
$1d:ede2  39 b1 28	  and $28b1,y
$1d:ede5  9e c8 9e	  stz $9ec8,x
$1d:ede8  bb			tyx
$1d:ede9  13 ba		 ora ($ba,s),y
$1d:edeb  33 d9		 and ($d9,s),y
$1d:eded  9e c6 d1	  stz $d1c6,x
$1d:edf0  37 07		 and [$07],y
$1d:edf2  81 36		 sta ($36,x)
$1d:edf4  3c 04 f8	  bit $f804,x
$1d:edf7  a6 04		 ldx $04
$1d:edf9  be be 08	  ldx $08be,y
$1d:edfc  c4 72		 cpy $72
$1d:edfe  31 1d		 and ($1d),y
$1d:ee00  57 9c		 eor [$9c],y
$1d:ee02  7a			ply
$1d:ee03  31 1f		 and ($1f),y
$1d:ee05  5b			tcd
$1d:ee06  95 61		 sta $61,x
$1d:ee08  7c 11 e5	  jmp ($e511,x)
$1d:ee0b  f9 c7 6b	  sbc $6bc7,y
$1d:ee0e  11 c6		 ora ($c6),y
$1d:ee10  39 40 19	  and $1940,y
$1d:ee13  fe de c5	  inc $c5de,x
$1d:ee16  79 56 25	  adc $2556,y
$1d:ee19  15 89		 ora $89,x
$1d:ee1b  3c 62 5b	  bit $5b62,x
$1d:ee1e  18			clc
$1d:ee1f  77 03		 adc [$03],y
$1d:ee21  e0 a0		 cpx #$a0
$1d:ee23  15 87		 ora $87,x
$1d:ee25  c0 80		 cpy #$80
$1d:ee27  41 8e		 eor ($8e,x)
$1d:ee29  51 87		 eor ($87),y
$1d:ee2b  b0 4a		 bcs $ee77
$1d:ee2d  1f a5 18 94   ora $9418a5,x
$1d:ee31  84 c1		 sty $c1
$1d:ee33  bd e1 e5	  lda $e5e1,x
$1d:ee36  ac 4d c5	  ldy $c54d
$1d:ee39  e3 47		 sbc $47,s
$1d:ee3b  19 8c 99	  ora $998c,y
$1d:ee3e  7a			ply
$1d:ee3f  33 65		 and ($65,s),y
$1d:ee41  e9 46		 sbc #$46
$1d:ee43  24 c3		 bit $c3
$1d:ee45  f1 1e		 sbc ($1e),y
$1d:ee47  04 dc		 tsb $dc
$1d:ee49  8e 34 72	  stx $7234
$1d:ee4c  58			cli
$1d:ee4d  ce 09 e2	  dec $e209
$1d:ee50  4c 10 f7	  jmp $f710
$1d:ee53  8a			txa
$1d:ee54  1a			inc a
$1d:ee55  ae 6f 1a	  ldx $1a6f
$1d:ee58  45 62		 eor $62
$1d:ee5a  cf 58 a3 2f   cmp $2fa358
$1d:ee5e  46 ac		 lsr $ac
$1d:ee60  3d 3a 30	  and $303a,x
$1d:ee63  fc 4f 81	  jsr ($814f,x)
$1d:ee66  57 43		 eor [$43],y
$1d:ee68  8d 9e 31	  sta $319e
$1d:ee6b  48			pha
$1d:ee6c  43 9a		 eor $9a,s
$1d:ee6e  38			sec
$1d:ee6f  29 05		 and #$05
$1d:ee71  ef 14 32 bc   sbc $bc3214
$1d:ee75  2e f5 8b	  rol $8bf5
$1d:ee78  45 63		 eor $63
$1d:ee7a  0f 18 97 46   ora $469718
$1d:ee7e  25 ef		 and $ef
$1d:ee80  72 ac		 adc ($ac)
$1d:ee82  4b			phk
$1d:ee83  eb			xba
$1d:ee84  0b			phd
$1d:ee85  80 00		 bra $ee87
$1d:ee87  15 de		 ora $de,x
$1d:ee89  31 58		 and ($58),y
$1d:ee8b  8c 2d 82	  sty $822d
$1d:ee8e  d0 c9		 bne $ee59
$1d:ee90  16 50		 asl $50,x
$1d:ee92  4e 5a 61	  lsr $615a
$1d:ee95  0c c0 43	  tsb $43c0
$1d:ee98  36 8d		 rol $8d,x
$1d:ee9a  71 e2		 adc ($e2),y
$1d:ee9c  36 4f		 rol $4f,x
$1d:ee9e  c7 0c		 cmp [$0c]
$1d:eea0  d9 b6 40	  cmp $40b6,y
$1d:eea3  da			phx
$1d:eea4  0e 72 ac	  asl $ac72
$1d:eea7  5e 16 a3	  lsr $a316,x
$1d:eeaa  1c 5a 8a	  trb $8a5a
$1d:eead  f0 63		 beq $ef12
$1d:eeaf  10 e8		 bpl $ee99
$1d:eeb1  c4 3e		 cpy $3e
$1d:eeb3  b0 c4		 bcs $ee79
$1d:eeb5  1a			inc a
$1d:eeb6  c3 f8		 cmp $f8,s
$1d:eeb8  1f 80 b6 0b   ora $0bb680,x
$1d:eebc  c3 2c		 cmp $2c,s
$1d:eebe  2b			pld
$1d:eebf  11 c8		 ora ($c8),y
$1d:eec1  c5 24		 cmp $24
$1d:eec3  1e 35 90	  asl $9035,x
$1d:eec6  98			tya
$1d:eec7  43 3c		 eor $3c,s
$1d:eec9  ce 50 4f	  dec $4f50
$1d:eecc  13 94		 ora ($94,s),y
$1d:eece  7c 81 b3	  jmp ($b381,x)
$1d:eed1  ea			nop
$1d:eed2  89 c0		 bit #$c0
$1d:eed4  46 c2		 lsr $c2
$1d:eed6  71 ea		 adc ($ea),y
$1d:eed8  36 44		 rol $44,x
$1d:eeda  70 4d		 bvs $ef29
$1d:eedc  e0 e9		 cpx #$e9
$1d:eede  89 c5		 bit #$c5
$1d:eee0  b4 04		 ldy $04,x
$1d:eee2  00 73		 brk #$73
$1d:eee4  01 21		 ora ($21,x)
$1d:eee6  28			plp
$1d:eee7  a4 f1		 ldy $f1
$1d:eee9  aa			tax
$1d:eeea  94 c5		 sty $c5,x
$1d:eeec  cc 1d 47	  cpy $471d
$1d:eeef  49 43		 eor #$43
$1d:eef1  3c a2 d1	  bit $d1a2,x
$1d:eef4  30 13		 bmi $ef09
$1d:eef6  60			rts
$1d:eef7  1b			tcs
$1d:eef8  00 48		 brk #$48
$1d:eefa  26 c2		 rol $c2
$1d:eefc  70 c6		 bvs $eec4
$1d:eefe  a2 d8		 ldx #$d8
$1d:ef00  0f 23 5d 45   ora $455d23
$1d:ef04  01 b3		 ora ($b3,x)
$1d:ef06  84 40		 sty $40
$1d:ef08  10 e8		 bpl $eef2
$1d:ef0a  31 41		 and ($41),y
$1d:ef0c  68			pla
$1d:ef0d  90 0c		 bcc $ef1b
$1d:ef0f  b6 6d		 ldx $6d,y
$1d:ef11  a0 72		 ldy #$72
$1d:ef13  01 f0		 ora ($f0,x)
$1d:ef15  bc a1 f2	  ldy $f2a1,x
$1d:ef18  8c 4f 63	  sty $634f
$1d:ef1b  13 e5		 ora ($e5,s),y
$1d:ef1d  79 cf 16	  adc $16cf,y
$1d:ef20  e3 4c		 sbc $4c,s
$1d:ef22  5d 8c e9	  eor $e98c,x
$1d:ef25  5e 2b 80	  lsr $802b,x
$1d:ef28  ad ac 46	  lda $46ac
$1d:ef2b  76 c5		 ror $c5,x
$1d:ef2d  15 c0		 ora $c0,x
$1d:ef2f  30 02		 bmi $ef33
$1d:ef31  96 c3		 stx $c3,y
$1d:ef33  36 00		 rol $00,x
$1d:ef35  32 81		 and ($81)
$1d:ef37  70 14		 bvs $ef4d
$1d:ef39  a8			tay
$1d:ef3a  c5 39		 cmp $39
$1d:ef3c  be 2c 60	  ldx $602c,y
$1d:ef3f  ad 37 dd	  lda $dd37
$1d:ef42  8c 0c 60	  sty $600c
$1d:ef45  58			cli
$1d:ef46  33 c0		 and ($c0,s),y
$1d:ef48  97 80		 sta [$80],y
$1d:ef4a  f0 06		 beq $ef52
$1d:ef4c  f0 2c		 beq $ef7a
$1d:ef4e  01 fc		 ora ($fc,x)
$1d:ef50  4b			phk
$1d:ef51  20 69 00	  jsr $0069
$1d:ef54  01 19		 ora ($19,x)
$1d:ef56  40			rti
$1d:ef57  be 26 f0	  ldx $f026,y
$1d:ef5a  34 82		 bit $82,x
$1d:ef5c  b7 98		 lda [$98],y
$1d:ef5e  73 28		 adc ($28,s),y
$1d:ef60  85 58		 sta $58
$1d:ef62  84 00		 sty $00
$1d:ef64  26 61		 rol $61
$1d:ef66  3f 8a 9a 3f   and $3f9a8a,x
$1d:ef6a  55 e0		 eor $e0,x
$1d:ef6c  4f c8 e5 58   eor $58e5c8
$1d:ef70  25 09		 and $09
$1d:ef72  3c a3 14	  bit $14a3,x
$1d:ef75  f2 b8		 sbc ($b8)
$1d:ef77  ac 00 b8	  ldy $b800
$1d:ef7a  79 8a 79	  adc $798a,y
$1d:ef7d  8c 1d e6	  sty $e61d
$1d:ef80  68			pla
$1d:ef81  27 d0		 and [$d0]
$1d:ef83  02 88		 cop #$88
$1d:ef85  e5 0b		 sbc $0b
$1d:ef87  c0 13		 cpy #$13
$1d:ef89  02 00		 cop #$00
$1d:ef8b  53 a0		 eor ($a0,s),y
$1d:ef8d  88			dey
$1d:ef8e  f4 cf aa	  pea $aacf
$1d:ef91  bd 77 ec	  lda $ec77,x
$1d:ef94  cf 6e fb bb   cmp $bbfb6e
$1d:ef98  df fe 10 f1   cmp $f110fe,x
$1d:ef9c  0f 8c bc 87   ora $87bc8c
$1d:efa0  e5 4f		 sbc $4f
$1d:efa2  32 f9		 and ($f9)
$1d:efa4  db			stp
$1d:efa5  d0 fe		 bne $efa5
$1d:efa7  98			tya
$1d:efa8  f5 4f		 sbc $4f,x
$1d:efaa  ae bd 97	  ldx $97bd
$1d:efad  ed cf 76	  sbc $76cf
$1d:efb0  fb			xce
$1d:efb1  fb			xce
$1d:efb2  c1 fe		 cmp ($fe,x)
$1d:efb4  20 f1 8f	  jsr $8ff1
$1d:efb7  90 bc		 bcc $ef75
$1d:efb9  a7 e6		 lda [$e6]
$1d:efbb  4f 3a fa 1b   eor $1bfa3a
$1d:efbf  d2 fe		 cmp ($fe)
$1d:efc1  a8			tay
$1d:efc2  f5 cf		 sbc $cf,x
$1d:efc4  b2 bd		 lda ($bd)
$1d:efc6  b7 ee		 lda [$ee],y
$1d:efc8  c0 02		 cpy #$02
$1d:efca  02 00		 cop #$00
$1d:efcc  04 a7		 tsb $a7
$1d:efce  4f ec d6 e8   eor $e8d6ec
$1d:efd2  cb			wai
$1d:efd3  cd 63 71	  cmp $7163
$1d:efd6  9a			txs
$1d:efd7  e4 66		 cpx $66
$1d:efd9  f1 66		 sbc ($66),y
$1d:efdb  bb			tyx
$1d:efdc  dd a3 32	  cmp $32a3,x
$1d:efdf  b7 e8		 lda [$e8],y
$1d:efe1  3c c4 0a	  bit $0ac4,x
$1d:efe4  76 ba		 ror $ba,x
$1d:efe6  f3 c8		 sbc ($c8,s),y
$1d:efe8  64 4f		 stz $4f
$1d:efea  36 7e		 rol $7e,x
$1d:efec  86 76		 stx $76
$1d:efee  ce 02 17	  dec $1702
$1d:eff1  9b			txy
$1d:eff2  3c c4 40	  bit $40c4,x
$1d:eff5  35 48		 and $48,x
$1d:eff7  cd 32 33	  cmp $3332
$1d:effa  1c 1a 88	  trb $881a
$1d:effd  cc 46 a1	  cpy $a146
$1d:f000  76 bb		 ror $bb,x
$1d:f002  0c 82 33	  tsb $3382
$1d:f005  2f b8 cd a4   and $a4cdb8
$1d:f009  43 b1		 eor $b1,s
$1d:f00b  79 88 8c	  adc $8c88,y
$1d:f00e  28			plp
$1d:f00f  80 51		 bra $f062
$1d:f011  b8			clv
$1d:f012  d6 ad		 dec $ad,x
$1d:f014  33 61		 and ($61,s),y
$1d:f016  a9 c7		 lda #$c7
$1d:f018  29 94		 and #$94
$1d:f01a  cb			wai
$1d:f01b  23 cc		 and $cc,s
$1d:f01d  2a			rol a
$1d:f01e  94 aa		 sty $aa,x
$1d:f020  cd 22 7a	  cmp $7a22
$1d:f023  f3 19		 sbc ($19,s),y
$1d:f025  63 cc		 adc $cc,s
$1d:f027  25 44		 and $44
$1d:f029  11 95		 ora ($95),y
$1d:f02b  5c 67 93 49   jml $499367
$1d:f02f  ec a8 62	  cpx $62a8
$1d:f032  32 a8		 and ($a8)
$1d:f034  e4 68		 cpx $68
$1d:f036  62 2f 30	  per $2068
$1d:f039  a4 cf		 ldy $cf
$1d:f03b  47 03		 eor [$03]
$1d:f03d  44 11 94	  mvp $94,$11
$1d:f040  72 3a		 adc ($3a)
$1d:f042  08			php
$1d:f043  2a			rol a
$1d:f044  60			rts
$1d:f045  14 46		 trb $46
$1d:f047  c0 32		 cpy #$32
$1d:f049  08			php
$1d:f04a  be 37 2b	  ldx $2b37,y
$1d:f04d  17 45		 ora [$45],y
$1d:f04f  13 cc		 ora ($cc,s),y
$1d:f051  46 80		 lsr $80
$1d:f053  6b			rtl
$1d:f054  08			php
$1d:f055  bc 7f 0b	  ldy $0b7f,x
$1d:f058  8d 8f c6	  sta $c68f
$1d:f05b  63 40		 adc $40,s
$1d:f05d  42 19		 wdm #$19
$1d:f05f  04 8a		 tsb $8a
$1d:f061  35 17		 and $17,x
$1d:f063  8f 49 ed b1   sta $b1ed49
$1d:f067  fa			plx
$1d:f068  c1 b4		 cmp ($b4,x)
$1d:f06a  16 65		 asl $65,x
$1d:f06c  5c 95 ca 97   jml $97ca95
$1d:f070  21 9e		 and ($9e,x)
$1d:f072  97 51		 sta [$51],y
$1d:f074  6b			rtl
$1d:f075  15 f2		 ora $f2,x
$1d:f077  42 0d		 wdm #$0d
$1d:f079  42 2f		 wdm #$2f
$1d:f07b  15 c0		 ora $c0,x
$1d:f07d  c1 a0		 cmp ($a0,x)
$1d:f07f  f4 da 76	  pea $76da
$1d:f082  0c ee 2b	  tsb $2bee
$1d:f085  22 95 61 f0   jsl $f06195
$1d:f089  d7 8c		 cmp [$8c],y
$1d:f08b  4d 96 bf	  eor $bf96
$1d:f08e  3f ab 89 92   and $9289ab,x
$1d:f092  e6 b9		 inc $b9
$1d:f094  0b			phd
$1d:f095  44 15 b4	  mvp $b4,$15
$1d:f098  17 0b		 ora [$0b],y
$1d:f09a  f5 fc		 sbc $fc,x
$1d:f09c  4c 29 91	  jmp $9129
$1d:f09f  7b			tdc
$1d:f0a0  85 61		 sta $61
$1d:f0a2  b4 15		 ldy $15,x
$1d:f0a4  5b			tcd
$1d:f0a5  83 ac		 sta $ac,s
$1d:f0a7  31 4a		 and ($4a),y
$1d:f0a9  22 5c 8c 1a   jsl $1a8c5c
$1d:f0ad  bf 89 bf dc   lda $dcbf89,x
$1d:f0b1  2f f7 fb dd   and $ddfbf7
$1d:f0b5  a1 a0		 lda ($a0,x)
$1d:f0b7  4e 70 b0	  lsr $b070
$1d:f0ba  53 70		 eor ($70,s),y
$1d:f0bc  76 00		 ror $00,x
$1d:f0be  c0 09		 cpy #$09
$1d:f0c0  87 06		 sta [$06]
$1d:f0c2  4c 26 b8	  jmp $b826
$1d:f0c5  49 f0		 eor #$f0
$1d:f0c7  77 5c		 adc [$5c],y
$1d:f0c9  b4 1a		 ldy $1a,x
$1d:f0cb  9b			txy
$1d:f0cc  3f ce e3 ec   and $ece3ce,x
$1d:f0d0  c1 02		 cmp ($02,x)
$1d:f0d2  8a			txa
$1d:f0d3  c1 59		 cmp ($59,x)
$1d:f0d5  81 6a		 sta ($6a,x)
$1d:f0d7  ae df f0	  ldx $f0df
$1d:f0da  75 7b		 adc $7b,x
$1d:f0dc  76 1e		 ror $1e,x
$1d:f0de  dd 54 8e	  cmp $8e54,x
$1d:f0e1  c3 a3		 cmp $a3,s
$1d:f0e3  ed 90 13	  sbc $1390
$1d:f0e6  0d 36 c7	  ora $c736
$1d:f0e9  37 b7		 and [$b7],y
$1d:f0eb  84 06		 sty $06
$1d:f0ed  3b			tsc
$1d:f0ee  22 8a b2 82   jsl $82b28a
$1d:f0f2  ff 4e c5 55   sbc $55c54e,x
$1d:f0f6  85 a1		 sta $a1
$1d:f0f8  80 bb		 bra $f0b5
$1d:f0fa  04 02		 tsb $02
$1d:f0fc  55 73		 eor $73,x
$1d:f0fe  64 84		 stz $84
$1d:f100  1a			inc a
$1d:f101  ca			dex
$1d:f102  3a			dec a
$1d:f103  0a			asl a
$1d:f104  f4 7b 1c	  pea $1c7b
$1d:f107  4b			phk
$1d:f108  03 58		 ora $58,s
$1d:f10a  aa			tax
$1d:f10b  46 5d		 lsr $5d
$1d:f10d  4e c4 8e	  lsr $8ec4
$1d:f110  c2 dd		 rep #$dd
$1d:f112  86 ce		 stx $ce
$1d:f114  96 c8		 stx $c8,y
$1d:f116  20 0b d0	  jsr $d00b
$1d:f119  ae d1 70	  ldx $70d1
$1d:f11c  76 6b		 ror $6b,x
$1d:f11e  74 8a		 stz $8a,x
$1d:f120  47 6f		 eor [$6f]
$1d:f122  3d 90 40	  and $4090,x
$1d:f125  2b			pld
$1d:f126  12 eb		 ora ($eb)
$1d:f128  2d 3a 6f	  and $6f3a
$1d:f12b  77 35		 adc [$35],y
$1d:f12d  84 89		 sty $89
$1d:f12f  a0 91 9a	  ldy #$9a91
$1d:f132  6c fa bf	  jmp ($bffa)
$1d:f135  83 44		 sta $44,s
$1d:f137  2b			pld
$1d:f138  50 42		 bvc $f17c
$1d:f13a  01 83		 ora ($83,x)
$1d:f13c  ab			plb
$1d:f13d  51 cb		 eor ($cb),y
$1d:f13f  41 76		 eor ($76,x)
$1d:f141  01 03		 ora ($03,x)
$1d:f143  fc c2 03	  jsr ($03c2,x)
$1d:f146  57 c3		 eor [$c3],y
$1d:f148  55 cd		 eor $cd,x
$1d:f14a  42 02		 wdm #$02
$1d:f14c  09 54		 ora #$54
$1d:f14e  66 5f		 ror $5f
$1d:f150  71 9b		 adc ($9b),y
$1d:f152  03 c6		 ora $c6,s
$1d:f154  df 87 b7 db   cmp $dbb787,x
$1d:f158  a3 94		 lda $94,s
$1d:f15a  c0 80 49	  cpy #$4980
$1d:f15d  1b			tcs
$1d:f15e  21 8b		 and ($8b,x)
$1d:f160  b4 cd		 ldy $cd,x
$1d:f162  94 eb		 sty $eb,x
$1d:f164  5c 8e 57 02   jml $02578e
$1d:f168  43 9f		 eor $9f,s
$1d:f16a  13 03		 ora ($03,s),y
$1d:f16c  44 18 a3	  mvp $a3,$18
$1d:f16f  17 c6		 ora [$c6],y
$1d:f171  e5 4d		 sbc $4d
$1d:f173  a0 33 03	  ldy #$0333
$1d:f176  88			dey
$1d:f177  53 a9		 eor ($a9,s),y
$1d:f179  f8			sed
$1d:f17a  0b			phd
$1d:f17b  71 f4		 adc ($f4),y
$1d:f17d  ad a0 30	  lda $30a0
$1d:f180  03 8a		 ora $8a,s
$1d:f182  04 31		 tsb $31
$1d:f184  55 eb		 eor $eb,x
$1d:f186  3b			tsc
$1d:f187  5c 0f e1 58   jml $58e10f
$1d:f18b  a2 db 6f	  ldx #$6fdb
$1d:f18e  b1 5c		 lda ($5c),y
$1d:f190  0c ba be	  tsb $beba
$1d:f193  75 0b		 adc $0b,x
$1d:f195  7c b2 44	  jmp ($44b2,x)
$1d:f198  f8			sed
$1d:f199  01 38		 ora ($38,x)
$1d:f19b  59 44 61	  eor $6144,y
$1d:f19e  27 a6		 and [$a6]
$1d:f1a0  d7 e8		 cmp [$e8],y
$1d:f1a2  f5 7b		 sbc $7b,x
$1d:f1a4  3c 66 37	  bit $3766,x
$1d:f1a7  2a			rol a
$1d:f1a8  c3 e3		 cmp $e3,s
$1d:f1aa  ca			dex
$1d:f1ab  e1 07		 sbc ($07,x)
$1d:f1ad  bf d1 5f 61   lda $615fd1,x
$1d:f1b1  4f 1d 04 aa   eor $aa041d
$1d:f1b5  57 1c		 eor [$1c],y
$1d:f1b7  8e 01 c2	  stx $c201
$1d:f1ba  4f 07 bf 55   eor $55bf07
$1d:f1be  48			pha
$1d:f1bf  c3 80		 cmp $80,s
$1d:f1c1  b3 dd		 lda ($dd,s),y
$1d:f1c3  a4 91		 ldy $91
$1d:f1c5  c6 a8		 dec $a8
$1d:f1c7  23 c2		 and $c2,s
$1d:f1c9  0f 79 b8 5f   ora $5fb879
$1d:f1cd  e9 a1		 sbc #$a1
$1d:f1cf  31 53		 and ($53),y
$1d:f1d1  04 6d		 tsb $6d
$1d:f1d3  cc 11 99	  cpy $9911
$1d:f1d6  3c b8 a6	  bit $a6b8,x
$1d:f1d9  17 eb		 ora [$eb],y
$1d:f1db  fd 3a 8f	  sbc $8f3a,x
$1d:f1de  88			dey
$1d:f1df  44 82 f0	  mvp $f0,$82
$1d:f1e2  2c 92 b8	  bit $b892
$1d:f1e5  cc ba 0f	  cpy $0fba
$1d:f1e8  70 39		 bvs $f223
$1d:f1ea  85 fe		 sta $fe
$1d:f1ec  7f 88 b7 5d   adc $5db788,x
$1d:f1f0  a8			tay
$1d:f1f1  8d 70 a2	  sta $a270
$1d:f1f4  00 01		 brk #$01
$1d:f1f6  00 16		 brk #$16
$1d:f1f8  5b			tcd
$1d:f1f9  f8			sed
$1d:f1fa  a4 33		 ldy $33
$1d:f1fc  a5 90		 lda $90
$1d:f1fe  8e 35 c1	  stx $c135
$1d:f201  8e 58 93	  stx $9358
$1d:f204  98			tya
$1d:f205  3e c1 2a	  rol $2ac1,x
$1d:f208  31 a7		 and ($a7),y
$1d:f20a  90 b9		 bcc $f1c5
$1d:f20c  81 aa		 sta ($aa,x)
$1d:f20e  15 84		 ora $84,x
$1d:f210  18			clc
$1d:f211  e7 70		 sbc [$70]
$1d:f213  11 c8		 ora ($c8),y
$1d:f215  db			stp
$1d:f216  70 16		 bvs $f22e
$1d:f218  e4 8b		 cpx $8b
$1d:f21a  08			php
$1d:f21b  3c 1c ca	  bit $ca1c,x
$1d:f21e  51 c9		 eor ($c9),y
$1d:f220  1d 71 32	  ora $3271,x
$1d:f223  0f f1 46 89   ora $8946f1
$1d:f227  d0 c9		 bne $f1f2
$1d:f229  61 2c		 adc ($2c,x)
$1d:f22b  5d 8b b8	  eor $b88b,x
$1d:f22e  90 67		 bcc $f297
$1d:f230  1a			inc a
$1d:f231  6c 28 00	  jmp ($0028)
$1d:f234  23 97		 and $97,s
$1d:f236  69 63		 adc #$63
$1d:f238  a5 25		 lda $25
$1d:f23a  f7 1c		 sbc [$1c],y
$1d:f23c  5e 53 05	  lsr $0553,x
$1d:f23f  69 9b		 adc #$9b
$1d:f241  46 53		 lsr $53
$1d:f243  22 ca 3b 8d   jsl $8d3bca
$1d:f247  6a			ror a
$1d:f248  f9 40 c1	  sbc $c140,y
$1d:f24b  52 27		 eor ($27)
$1d:f24d  a9 d0		 lda #$d0
$1d:f24f  3e 83 34	  rol $3483,x
$1d:f252  0b			phd
$1d:f253  61 64		 adc ($64,x)
$1d:f255  a4 d6		 ldy $d6
$1d:f257  64 d8		 stz $d8
$1d:f259  2a			rol a
$1d:f25a  84 f5		 sty $f5
$1d:f25c  90 2f		 bcc $f28d
$1d:f25e  70 9b		 bvs $f1fb
$1d:f260  4b			phk
$1d:f261  44 25 8b	  mvp $8b,$25
$1d:f264  a8			tay
$1d:f265  4d 24 b4	  eor $b424
$1d:f268  38			sec
$1d:f269  cd 32 88	  cmp $8832
$1d:f26c  07 0b		 ora [$0b]
$1d:f26e  4d 07 17	  eor $1707
$1d:f271  69 7c		 adc #$7c
$1d:f273  8c d6 98	  sty $98d6
$1d:f276  99 30 b8	  sta $b830,y
$1d:f279  52 1f		 eor ($1f)
$1d:f27b  20 09 09	  jsr $0909
$1d:f27e  35 22		 and $22,x
$1d:f280  86 1d		 stx $1d
$1d:f282  07 80		 ora [$80]
$1d:f284  ca			dex
$1d:f285  a5 f4		 lda $f4
$1d:f287  ac 5d f2	  ldy $f25d
$1d:f28a  97 74		 sta [$74],y
$1d:f28c  bd 50 a1	  lda $a150,x
$1d:f28f  e2 c0		 sep #$c0
$1d:f291  65 93		 adc $93
$1d:f293  dc 2b 56	  jml [$562b]
$1d:f296  2b			pld
$1d:f297  a5 87		 lda $87
$1d:f299  19 26 a8	  ora $a826,y
$1d:f29c  49 69		 eor #$69
$1d:f29e  8c b2 8b	  sty $8bb2
$1d:f2a1  d9 1f 21	  cmp $211f,y
$1d:f2a4  51 a9		 eor ($a9),y
$1d:f2a6  63 2f		 adc $2f,s
$1d:f2a8  54 89 a9	  mvn $a9,$89
$1d:f2ab  64 a5		 stz $a5
$1d:f2ad  51 78		 eor ($78),y
$1d:f2af  f8			sed
$1d:f2b0  fc 6b 75	  jsr ($756b,x)
$1d:f2b3  33 30		 and ($30,s),y
$1d:f2b5  07 05		 ora [$05]
$1d:f2b7  92 27		 sta ($27)
$1d:f2b9  d0 ac		 bne $f267
$1d:f2bb  3d c6 85	  and $85c6,x
$1d:f2be  48			pha
$1d:f2bf  15 11		 ora $11,x
$1d:f2c1  ac 91 a1	  ldy $a191
$1d:f2c4  4d 03 80	  eor $8003
$1d:f2c7  68			pla
$1d:f2c8  12 a5		 ora ($a5)
$1d:f2ca  2a			rol a
$1d:f2cb  78			sei
$1d:f2cc  01 f4		 ora ($f4,x)
$1d:f2ce  24 f0		 bit $f0
$1d:f2d0  6a			ror a
$1d:f2d1  f8			sed
$1d:f2d2  5c 03 60 02   jml $026003
$1d:f2d6  19 19 a4	  ora $a419,y
$1d:f2d9  2e 57 d8	  rol $d857
$1d:f2dc  6c 1a ff	  jmp ($ff1a)
$1d:f2df  63 a6		 adc $a6,s
$1d:f2e1  52 41		 eor ($41)
$1d:f2e3  a0 fe 11	  ldy #$11fe
$1d:f2e6  d9 61 b1	  cmp $b161,y
$1d:f2e9  f6 0a		 inc $0a,x
$1d:f2eb  6d 14 78	  adc $7814
$1d:f2ee  44 c0 01	  mvp $01,$c0
$1d:f2f1  0c 5e 2f	  tsb $2f5e
$1d:f2f4  8d 8f 56	  sta $568f
$1d:f2f7  20 f7 03	  jsr $03f7
$1d:f2fa  c9 0b		 cmp #$0b
$1d:f2fc  42 44		 wdm #$44
$1d:f2fe  8b			phb
$1d:f2ff  1b			tcs
$1d:f300  45 a2		 eor $a2
$1d:f302  b1 5d		 lda ($5d),y
$1d:f304  bc df c0	  ldy $c0df,x
$1d:f307  04 04		 tsb $04
$1d:f309  00 10		 brk #$10
$1d:f30b  c4 3b		 cpy $3b
$1d:f30d  fc 01 e1	  jsr ($e101,x)
$1d:f310  1f 11 78 cf   ora $cf7811,x
$1d:f314  c8			iny
$1d:f315  9e 55 f3	  stz $f355,x
$1d:f318  37 9d		 and [$9d],y
$1d:f31a  fd 11 e9	  sbc $e911,x
$1d:f31d  9f 55 7a ef   sta $ef7a55,x
$1d:f321  d9 9e dd	  cmp $dd9e,y
$1d:f324  f7 77		 sbc [$77],y
$1d:f326  bf fc 21 e2   lda $e221fc,x
$1d:f32a  1f 19 79 0f   ora $0f7919,x
$1d:f32e  ca			dex
$1d:f32f  9e 65 f3	  stz $f365,x
$1d:f332  b7 a1		 lda [$a1],y
$1d:f334  fd 31 ea	  sbc $ea31,x
$1d:f337  9f 5d 7b 2f   sta $2f7b5d,x
$1d:f33b  db			stp
$1d:f33c  9e ed f7	  stz $f7ed,x
$1d:f33f  f7 83		 sbc [$83],y
$1d:f341  fc 41 e3	  jsr ($e341,x)
$1d:f344  1f 21 79 4f   ora $4f7921,x
$1d:f348  cc 9e 75	  cpy $759e
$1d:f34b  f4 37 a5	  pea $a537
$1d:f34e  fb			xce
$1d:f34f  05 83		 ora $83
$1d:f351  c2 61		 rep #$61
$1d:f353  70 c9		 bvs $f31e
$1d:f355  78			sei
$1d:f356  c4 e2		 cpy $e2
$1d:f358  b1 78		 lda ($78),y
$1d:f35a  cc 6e 3b	  cpy $3b6e
$1d:f35d  1e 97 6c	  asl $6c97,x
$1d:f360  86 47		 stx $47
$1d:f362  25 93		 and $93
$1d:f364  ca			dex
$1d:f365  65 72		 adc $72
$1d:f367  d9 7e 7a	  cmp $7a7e,y
$1d:f36a  5d 73 19	  eor $1973,x
$1d:f36d  9c d6 6f	  stz $6fd6
$1d:f370  39 9d cf	  and $cf9d,y
$1d:f373  67 fa		 adc [$fa]
$1d:f375  e9 75 d0	  sbc #$d075
$1d:f378  68			pla
$1d:f379  74 59		 stz $59,x
$1d:f37b  c7 48		 cmp [$48]
$1d:f37d  69 b4 fd	  adc #$fdb4
$1d:f380  f4 bf bf	  pea $bfbf
$1d:f383  fc 21 e2	  jsr ($e221,x)
$1d:f386  1f 19 79 0f   ora $0f7919,x
$1d:f38a  ca			dex
$1d:f38b  9e 65 f3	  stz $f365,x
$1d:f38e  b7 a1		 lda [$a1],y
$1d:f390  fd 31 ea	  sbc $ea31,x
$1d:f393  9f 5d 7b 2f   sta $2f7b5d,x
$1d:f397  db			stp
$1d:f398  9e ed f7	  stz $f7ed,x
$1d:f39b  f7 83		 sbc [$83],y
$1d:f39d  fc 41 e3	  jsr ($e341,x)
$1d:f3a0  1f 21 79 4f   ora $4f7921,x
$1d:f3a4  cc 9e 75	  cpy $759e
$1d:f3a7  f4 37 a5	  pea $a537
$1d:f3aa  fd 51 eb	  sbc $eb51,x
$1d:f3ad  38			sec
$1d:f3ae  c1 60		 cmp ($60,x)
$1d:f3b0  f0 98		 beq $f34a
$1d:f3b2  5c 32 ce 31   jml $31ce32
$1d:f3b6  38			sec
$1d:f3b7  ac 5e 33	  ldy $335e
$1d:f3ba  1b			tcs
$1d:f3bb  8e c7 ac	  stx $acc7
$1d:f3be  db			stp
$1d:f3bf  21 91		 and ($91,x)
$1d:f3c1  c9 64 f2	  cmp #$f264
$1d:f3c4  99 5c b6	  sta $b65c,y
$1d:f3c7  5f 9e b3 f7   eor $f7b39e,x
$1d:f3cb  df 83 3c 3b   cmp $3b3c83,x
$1d:f3cf  e2 ef		 sep #$ef
$1d:f3d1  1f f9 43 cc   ora $cc43f9,x
$1d:f3d5  3e 72 f4	  rol $f472,x
$1d:f3d8  1f a5 3d 4b   ora $4b3da5,x
$1d:f3dc  eb			xba
$1d:f3dd  6f 63 fb 63   adc $63fb63
$1d:f3e1  dc b5 a8	  jml [$a8b5]
$1d:f3e4  d4 ea		 pei ($ea)
$1d:f3e6  b5 79		 lda $79,x
$1d:f3e8  cd 6e bb	  cmp $bb6e
$1d:f3eb  5f e7 72 ae   eor $ae72e7,x
$1d:f3ef  c3 63		 cmp $63,s
$1d:f3f1  b2 d9		 lda ($d9)
$1d:f3f3  ed 36 bb	  sbc $bb36
$1d:f3f6  6d bf bd	  adc $bdbf
$1d:f3f9  ca			dex
$1d:f3fa  db			stp
$1d:f3fb  9d d6 ef	  sta $efd6,x
$1d:f3fe  79 bd df	  adc $dfbd,y
$1d:f401  6f dc b1 c2   adc $c2b1dc
$1d:f405  e1 f1		 sbc ($f1,x)
$1d:f407  38			sec
$1d:f408  bc 67 2f	  ldy $2f67,x
$1d:f40b  8f 7c 9d e5   sta $e59d7c
$1d:f40f  ff 38 7a 07   sbc $077a38,x
$1d:f413  d2 5e		 cmp ($5e)
$1d:f415  a3 f5		 lda $f5,s
$1d:f417  a7 b1		 lda [$b1]
$1d:f419  7d ad ee	  adc $eead,x
$1d:f41c  7f 7c 78 27   adc $27787c,x
$1d:f420  c3 5e		 cmp $5e,s
$1d:f422  2b			pld
$1d:f423  f1 e7		 sbc ($e7),y
$1d:f425  93 7c		 sta ($7c,s),y
$1d:f427  bd e6 ff	  lda $ffe6,x
$1d:f42a  40			rti
$1d:f42b  7a			ply
$1d:f42c  47 d4		 eor [$d4]
$1d:f42e  5f 88 c1 60   eor $60c188,x
$1d:f432  f0 98		 beq $f3cc
$1d:f434  5c 32 92 31   jml $319232
$1d:f438  38			sec
$1d:f439  ac 5e 33	  ldy $335e
$1d:f43c  1b			tcs
$1d:f43d  8e c7 a9	  stx $a9c7
$1d:f440  1b			tcs
$1d:f441  21 91		 and ($91,x)
$1d:f443  c9 64		 cmp #$64
$1d:f445  f2 99		 sbc ($99)
$1d:f447  5c b6 5f 9e   jml $9e5fb6
$1d:f44b  a4 5c		 ldy $5c
$1d:f44d  c6 67		 dec $67
$1d:f44f  35 9b		 and $9b,x
$1d:f451  ce 67 73	  dec $7367
$1d:f454  d9 fe bb	  cmp $bbfe,y
$1d:f457  77 d4		 adc [$d4],y
$1d:f459  87 a0		 sta [$a0]
$1d:f45b  d0 e8		 bne $f445
$1d:f45d  b3 80		 lda ($80,s),y
$1d:f45f  50 d3		 bvc $f434
$1d:f461  69 fb		 adc #$fb
$1d:f463  ea			nop
$1d:f464  45 d4		 eor $d4
$1d:f466  6a			ror a
$1d:f467  75 5a		 adc $5a,x
$1d:f469  bc e6 b7	  ldy $b7e6,x
$1d:f46c  5d af f3	  eor $f3af,x
$1d:f46f  a9 17		 lda #$17
$1d:f471  61 b1		 adc ($b1,x)
$1d:f473  d9 6c f6	  cmp $f66c,y
$1d:f476  9b			txy
$1d:f477  5d b6 df	  eor $dfb6,x
$1d:f47a  de a4 6d	  dec $6da4,x
$1d:f47d  ce eb 77	  dec $77eb
$1d:f480  bc de ef	  ldy $efde,x
$1d:f483  b7 ea		 lda [$ea],y
$1d:f485  48			pha
$1d:f486  e1 70		 sbc ($70,x)
$1d:f488  f8			sed
$1d:f489  9c 5e 32	  stz $325e
$1d:f48c  93 cb		 sta ($cb,s),y
$1d:f48e  3e 6a f3	  rol $f36a,x
$1d:f491  df a3 3d 3b   cmp $3b3da3,x
$1d:f495  ea			nop
$1d:f496  ef 5f fb 43   sbc $43fb5f
$1d:f49a  dc 3e f2	  jml [$f23e]
$1d:f49d  f0 1f		 beq $f4be
$1d:f49f  85 3c		 sta $3c
$1d:f4a1  4b			phk
$1d:f4a2  e3 6f		 sbc $6f,s
$1d:f4a4  20 3e 0b	  jsr $0b3e
$1d:f4a7  07 84		 ora [$84]
$1d:f4a9  e0 61 30	  cpx #$3061
$1d:f4ac  b8			clv
$1d:f4ad  62 03 62	  per $56b3
$1d:f4b0  71 58		 adc ($58),y
$1d:f4b2  bc 67 23	  ldy $2367,x
$1d:f4b5  19 8d c7	  ora $c78d,y
$1d:f4b8  63 c8		 adc $c8,s
$1d:f4ba  09 90		 ora #$90
$1d:f4bc  c8			iny
$1d:f4bd  e4 b2		 cpx $b2
$1d:f4bf  79 4e 86	  adc $864e,y
$1d:f4c2  53 2b		 eor ($2b,s),y
$1d:f4c4  96 cb		 stx $cb,y
$1d:f4c6  f3 c8		 sbc ($c8,s),y
$1d:f4c8  07 98		 ora [$98]
$1d:f4ca  cc e6 b3	  cpy $b3e6
$1d:f4cd  79 c4 18	  adc $18c4,y
$1d:f4d0  67 73		 adc [$73]
$1d:f4d2  d9 fe b9	  cmp $b9fe,y
$1d:f4d5  00 f4		 brk #$f4
$1d:f4d7  1a			inc a
$1d:f4d8  1d 12 0c	  ora $0c12,x
$1d:f4db  50 61		 bvc $f53e
$1d:f4dd  a6 d3		 ldx $d3
$1d:f4df  f7 c8		 sbc [$c8],y
$1d:f4e1  07 a8		 ora [$a8]
$1d:f4e3  d4 ea		 pei ($ea)
$1d:f4e5  b5 68		 lda $68,x
$1d:f4e7  31 d6		 and ($d6),y
$1d:f4e9  eb			xba
$1d:f4ea  b5 fe		 lda $fe,x
$1d:f4ec  72 01		 adc ($01)
$1d:f4ee  ec 36 3b	  cpx $3b36
$1d:f4f1  2d 9e d3	  and $d39e
$1d:f4f4  83 b4		 sta $b4,s
$1d:f4f6  da			phx
$1d:f4f7  ed b6 fe	  sbc $feb6
$1d:f4fa  f2 02		 sbc ($02)
$1d:f4fc  6e 77 5b	  ror $5b77
$1d:f4ff  bd e7 27	  lda $27e7,x
$1d:f502  79 bd df	  adc $dfbd,y
$1d:f505  6f c8 0d c2   adc $c20dc8
$1d:f509  e1 f1		 sbc ($f1,x)
$1d:f50b  3a			dec a
$1d:f50c  3c 4e 2f	  bit $2f4e,x
$1d:f50f  18			clc
$1d:f510  81 ee		 sta ($ee,x)
$1d:f512  8f 7c f8 2b   sta $2bf87c
$1d:f516  c3 7e		 cmp $7e,s
$1d:f518  2c f1 ef	  bit $eff1
$1d:f51b  93 bc		 sta ($bc,s),y
$1d:f51d  bf e7 0f 40   lda $400fe7,x
$1d:f521  fa			plx
$1d:f522  4b			phk
$1d:f523  d4 7e		 pei ($7e)
$1d:f525  b4 f6		 ldy $f6,x
$1d:f527  2f b5 bd c5   and $c5bdb5
$1d:f52b  3a			dec a
$1d:f52c  0d 0e 8b	  ora $8b0e
$1d:f52f  38			sec
$1d:f530  f6 0d		 inc $0d,x
$1d:f532  36 9f		 rol $9f,x
$1d:f534  be e2 5d	  ldx $5de2,y
$1d:f537  46 a7		 lsr $a7
$1d:f539  55 ab		 eor $ab,x
$1d:f53b  ce 6b 75	  dec $756b
$1d:f53e  da			phx
$1d:f53f  ff 3b 89 76   sbc $76893b,x
$1d:f543  1b			tcs
$1d:f544  1d 96 cf	  ora $cf96,x
$1d:f547  69 b5		 adc #$b5
$1d:f549  db			stp
$1d:f54a  6d fd ee	  adc $eefd
$1d:f54d  26 dc		 rol $dc
$1d:f54f  ee b7 7b	  inc $7bb7
$1d:f552  cd ee fb	  cmp $fbee
$1d:f555  7e e2 8e	  ror $8ee2,x
$1d:f558  17 0f		 ora [$0f],y
$1d:f55a  89 c5		 bit #$c5
$1d:f55c  e3 38		 sbc $38,s
$1d:f55e  bc 95 e5	  ldy $e595,x
$1d:f561  bf 36 79 f7   lda $f77936,x
$1d:f565  d1 de		 cmp ($de),y
$1d:f567  9f f5 87 b0   sta $b087f5,x
$1d:f56b  7d a5 ee	  adc $eea5,x
$1d:f56e  3f 7a 78 17   and $17787a,x
$1d:f572  c2 de		 rep #$de
$1d:f574  27 f1		 and [$f1]
$1d:f576  c7 92		 cmp [$92]
$1d:f578  7c b5 e6	  jmp ($e6b5,x)
$1d:f57b  bf 3e 7a 37   lda $377a3e,x
$1d:f57f  d3 de		 cmp ($de,s),y
$1d:f581  af f6 07 b4   lda $b407f6
$1d:f585  7d c5 ef	  adc $efc5,x
$1d:f588  3f 02 78 1c   and $1c7802,x
$1d:f58c  30 58		 bmi $f5e6
$1d:f58e  3c 26 17	  bit $1726,x
$1d:f591  0c 07 8c	  tsb $8c07
$1d:f594  4e 2b 17	  lsr $172b
$1d:f597  8c c6 e3	  sty $e3c6
$1d:f59a  b1 e0		 lda ($e0),y
$1d:f59c  76 c8		 ror $c8,x
$1d:f59e  64 72		 stz $72
$1d:f5a0  59 3c a6	  eor $a63c,y
$1d:f5a3  57 2d		 eor [$2d],y
$1d:f5a5  97 e7		 sta [$e7],y
$1d:f5a7  81 d7		 sta ($d7,x)
$1d:f5a9  31 99		 and ($99),y
$1d:f5ab  cd 66 f3	  cmp $f366
$1d:f5ae  99 dc f6	  sta $f6dc,y
$1d:f5b1  7f ae 07 5d   adc $5d07ae,x
$1d:f5b5  06 87		 asl $87
$1d:f5b7  45 9c		 eor $9c
$1d:f5b9  2c 86 9b	  bit $9b86
$1d:f5bc  4f df 03 ae   eor $ae03df
$1d:f5c0  a3 53		 lda $53,s
$1d:f5c2  aa			tax
$1d:f5c3  d5 e7		 cmp $e7,x
$1d:f5c5  35 ba		 and $ba,x
$1d:f5c7  ed 7f 9c	  sbc $9c7f
$1d:f5ca  0e bb 0d	  asl $0dbb
$1d:f5cd  8e cb 67	  stx $67cb
$1d:f5d0  b4 da		 ldy $da,x
$1d:f5d2  ed b6 fe	  sbc $feb6
$1d:f5d5  f0 3b		 beq $f612
$1d:f5d7  6e 77 5b	  ror $5b77
$1d:f5da  bd e6 f7	  lda $f7e6,x
$1d:f5dd  7d bf 03	  adc $03bf,x
$1d:f5e0  c7 0b		 cmp [$0b]
$1d:f5e2  87 c4		 sta [$c4]
$1d:f5e4  e2 f1		 sep #$f1
$1d:f5e6  80 fe		 bra $f5e6
$1d:f5e8  ad f5 f7	  lda $f7f5
$1d:f5eb  b3 fd		 lda ($fd,s),y
$1d:f5ed  c1 ef		 cmp ($ef,x)
$1d:f5ef  1f 01 78 4f   ora $4f7801,x
$1d:f5f3  c4 9e		 cpy $9e
$1d:f5f5  35 f2		 and $f2,x
$1d:f5f7  37 95		 and [$95],y
$1d:f5f9  fc d1 e7	  jsr ($e7d1,x)
$1d:f5fc  9f 45 7a 6f   sta $6f7a45,x
$1d:f600  d5 9e		 cmp $9e,x
$1d:f602  bd f6 77	  lda $77f6,x
$1d:f605  b7 fd		 lda [$fd],y
$1d:f607  e1 e0		 sbc ($e0,x)
$1d:f609  1f 09 78 8f   ora $8f7809,x
$1d:f60d  c6 9e		 dec $9e
$1d:f60f  45 f2		 eor $f2
$1d:f611  b7 99		 lda [$99],y
$1d:f613  fc f1 e8	  jsr ($e8f1,x)
$1d:f616  9f 4d 7a af   sta $af7a4d,x
$1d:f61a  d7 9e		 cmp [$9e],y
$1d:f61c  cd f6 f7	  cmp $f7f6
$1d:f61f  00 03		 brk #$03
$1d:f621  03 00		 ora $00,s
$1d:f623  09 f4		 ora #$f4
$1d:f625  3b			tsc
$1d:f626  fc 01 e1	  jsr ($e101,x)
$1d:f629  1f 11 78 cf   ora $cf7811,x
$1d:f62d  c8			iny
$1d:f62e  9f e8 ec 15   sta $15ece8,x
$1d:f632  4c b9 e5	  jmp $e5b9
$1d:f635  17 37		 ora [$37],y
$1d:f637  59 d3 92	  eor $92d3,y
$1d:f63a  7e 55 f5	  ror $f555,x
$1d:f63d  af b1 bd af   lda $afbdb1
$1d:f641  ee 8f 77	  inc $778f
$1d:f644  1c 69 fe	  trb $fe69
$1d:f647  af b5 89 46   lda $4689b5
$1d:f64b  a0 71		 ldy #$71
$1d:f64d  60			rts
$1d:f64e  88			dey
$1d:f64f  c1 00		 cmp ($00,x)
$1d:f651  c8			iny
$1d:f652  10 0a		 bpl $f65e
$1d:f654  04 6a		 tsb $6a
$1d:f656  17 1e		 ora [$1e],y
$1d:f658  10 8c		 bpl $f5e6
$1d:f65a  30 0c		 bmi $f668
$1d:f65c  82 00 a4	  brl $9a5f
$1d:f65f  46 a1		 lsr $a1
$1d:f661  ff dc a6 57   sbc $57a6dc,x
$1d:f665  73 0d		 adc ($0d,s),y
$1d:f667  03 24		 ora $24,s
$1d:f669  3e a1 5b	  rol $5ba1,x
$1d:f66c  8d 44 e0	  sta $e044
$1d:f66f  d0 68		 bne $f6d9
$1d:f671  3e ca 73	  rol $73ca,x
$1d:f674  12 7d		 ora ($7d)
$1d:f676  99 00 20	  sta $2000,y
$1d:f679  ef f1 d5 6a   sbc $6ad5f1
$1d:f67d  f5 ba		 sbc $ba,x
$1d:f67f  bd 63 ed	  lda $ed63,x
$1d:f682  61 ee		 adc ($ee,x)
$1d:f684  e1 89		 sbc ($89,x)
$1d:f686  50 6b		 bvc $f6f3
$1d:f688  04 54		 tsb $54
$1d:f68a  1c 90 e0	  trb $e090
$1d:f68d  ec 03 50	  cpx $5003
$1d:f690  06 88		 asl $88
$1d:f692  14 47		 trb $47
$1d:f694  e0 5f		 cpx #$5f
$1d:f696  48			pha
$1d:f697  a8			tay
$1d:f698  44 28 01	  mvp $01,$28
$1d:f69b  42 02		 wdm #$02
$1d:f69d  98			tya
$1d:f69e  bc 2c 31	  ldy $312c,x
$1d:f6a1  d1 08		 cmp ($08),y
$1d:f6a3  52 04		 eor ($04)
$1d:f6a5  8a			txa
$1d:f6a6  60			rts
$1d:f6a7  28			plp
$1d:f6a8  44 25 48	  mvp $48,$25
$1d:f6ab  27 42		 and [$42]
$1d:f6ad  46 ad		 lsr $ad
$1d:f6af  8e a1 51	  stx $51a1
$1d:f6b2  1e 85 60	  asl $6085,x
$1d:f6b5  ea			nop
$1d:f6b6  21 00		 and ($00,x)
$1d:f6b8  2f a4 14 82   and $8214a4
$1d:f6bc  27 42		 and [$42]
$1d:f6be  10 01		 bpl $f6c1
$1d:f6c0  bd e1 eb	  lda $ebe1,x
$1d:f6c3  92 87		 sta ($87)
$1d:f6c5  d4 4b		 pei ($4b)
$1d:f6c7  e8			inx
$1d:f6c8  d5 2b		 cmp $2b,x
$1d:f6ca  01 d4		 ora ($d4,x)
$1d:f6cc  48			pha
$1d:f6cd  00 67		 brk #$67
$1d:f6cf  47 7c		 eor [$7c]
$1d:f6d1  2b			pld
$1d:f6d2  10 b0		 bpl $f684
$1d:f6d4  87 82		 sta [$82]
$1d:f6d6  44 91 a1	  mvp $a1,$91
$1d:f6d9  17 a1		 ora [$a1],y
$1d:f6db  40			rti
$1d:f6dc  44 8a 65	  mvp $65,$8a
$1d:f6df  d9 83 48	  cmp $4883,y
$1d:f6e2  4c 8b 90	  jmp $908b
$1d:f6e5  8f 00 33 28   sta $283300
$1d:f6e9  7a			ply
$1d:f6ea  9c 67 31	  stz $3167
$1d:f6ed  2b			pld
$1d:f6ee  02 14		 cop #$14
$1d:f6f0  c8			iny
$1d:f6f1  65 17		 adc $17
$1d:f6f3  84 42		 sty $42
$1d:f6f5  5c 83 59 8e   jml $8e5983
$1d:f6f9  c7 a3		 cmp [$a3]
$1d:f6fb  c2 b0		 rep #$b0
$1d:f6fd  29 94 7e	  and #$7e94
$1d:f700  13 08		 ora ($08,s),y
$1d:f702  1e 0d 46	  asl $460d,x
$1d:f705  a1 51		 lda ($51,x)
$1d:f707  ad 2d 08	  lda $082d
$1d:f70a  be 15 b2	  ldx $b215,y
$1d:f70d  51 c1		 eor ($c1),y
$1d:f70f  a7 10		 lda [$10]
$1d:f711  68			pla
$1d:f712  3d 62 0b	  and $0b62,x
$1d:f715  06 3a		 asl $3a
$1d:f717  8c 1c b4	  sty $b41c
$1d:f71a  71 a3		 adc ($a3),y
$1d:f71c  f0 43		 beq $f761
$1d:f71e  dd 24 85	  cmp $8524,x
$1d:f721  08			php
$1d:f722  79 28 fd	  adc $fd28,y
$1d:f725  1e 84 08	  asl $0884,x
$1d:f728  56 07		 lsr $07,x
$1d:f72a  a0 8f 08	  ldy #$088f
$1d:f72d  95 04		 sta $04,x
$1d:f72f  b4 67		 ldy $67,x
$1d:f731  e0 40 9a	  cpx #$9a40
$1d:f734  3c 89 46	  bit $4689,x
$1d:f737  1b			tcs
$1d:f738  02 40		 cop #$40
$1d:f73a  24 e8		 bit $e8
$1d:f73c  56 05		 lsr $05,x
$1d:f73e  80 51		 bra $f791
$1d:f740  d1 98		 cmp ($98),y
$1d:f742  92 74		 sta ($74)
$1d:f744  70 03		 bvs $f749
$1d:f746  88			dey
$1d:f747  30 e9		 bmi $f732
$1d:f749  1e 0f 0f	  asl $0f0f,x
$1d:f74c  00 f8		 brk #$f8
$1d:f74e  4b			phk
$1d:f74f  c4 7e		 cpy $7e
$1d:f751  34 f2		 bit $f2,x
$1d:f753  2f 95 bc cf   and $cfbc95
$1d:f757  e7 8f		 sbc [$8f]
$1d:f759  44 fa 6b	  mvp $6b,$fa
$1d:f75c  d5 7e		 cmp $7e,x
$1d:f75e  bc f6 6f	  ldy $6ff6,x
$1d:f761  b7 bd		 lda [$bd],y
$1d:f763  c2 11		 rep #$11
$1d:f765  a8			tay
$1d:f766  7d 82 1b	  adc $1b82,x
$1d:f769  1a			inc a
$1d:f76a  79 05 61	  adc $6105,y
$1d:f76d  ea			nop
$1d:f76e  2f 60 70 8c   and $8c7060
$1d:f772  4a			lsr a
$1d:f773  82 f9 27	  brl $1f6f
$1d:f776  99 3b 39	  sta $393b,y
$1d:f779  c2 80		 rep #$80
$1d:f77b  2f 09 f8 91   and $91f809
$1d:f77f  a3 51		 lda $51,s
$1d:f781  27 f1		 and [$f1]
$1d:f783  3c 9a 2b	  bit $2b9a,x
$1d:f786  16 8b		 asl $8b,x
$1d:f788  50 22		 bvc $f7ac
$1d:f78a  c1 f8		 cmp ($f8,x)
$1d:f78c  b0 c7		 bcs $f755
$1d:f78e  63 d1		 adc $d1,s
$1d:f790  ea			nop
$1d:f791  44 79 f6	  mvp $f6,$79
$1d:f794  4f 34 a8 54   eor $54a834
$1d:f798  4f 25 1a 81   eor $811a25
$1d:f79c  96 c2		 stx $c2,y
$1d:f79e  2e f9 28	  rol $28f9
$1d:f7a1  9c 1a 0d	  stz $0d1a
$1d:f7a4  38			sec
$1d:f7a5  45 0c		 eor $0c
$1d:f7a7  6a			ror a
$1d:f7a8  16 6b		 asl $6b,x
$1d:f7aa  08			php
$1d:f7ab  fb			xce
$1d:f7ac  d0 9f		 bne $f74d
$1d:f7ae  62 4d 02	  per $f9fe
$1d:f7b1  68			pla
$1d:f7b2  3c 82 13	  bit $1382,x
$1d:f7b5  08			php
$1d:f7b6  84 8e		 sty $8e
$1d:f7b8  5c 40 4a 20   jml $204a40
$1d:f7bc  84 58		 sty $58
$1d:f7be  27 31		 and [$31]
$1d:f7c0  27 54		 and [$54]
$1d:f7c2  1e 86 a4	  asl $a486,x
$1d:f7c5  a5 84		 lda $84
$1d:f7c7  38			sec
$1d:f7c8  a2 c6 28	  ldx #$28c6
$1d:f7cb  c6 84		 dec $84
$1d:f7cd  ca			dex
$1d:f7ce  a9 dc 6c	  lda #$6cdc
$1d:f7d1  4b			phk
$1d:f7d2  52 11		 eor ($11)
$1d:f7d4  02 c9		 cop #$c9
$1d:f7d6  44 ea 32	  mvp $32,$ea
$1d:f7d9  05 12		 ora $12
$1d:f7db  0d 90 56	  ora $5690
$1d:f7de  0f 86 3f 84   ora $843f86
$1d:f7e2  5e c1 15	  lsr $15c1,x
$1d:f7e5  82 03 84	  brl $7beb
$1d:f7e8  12 d0		 ora ($d0)
$1d:f7ea  b8			clv
$1d:f7eb  fd 66 3b	  sbc $3b66,x
$1d:f7ee  0c 0b 3a	  tsb $3a0b
$1d:f7f1  6c 01 2c	  jmp ($2c01)
$1d:f7f4  09 4a 02	  ora #$024a
$1d:f7f7  08			php
$1d:f7f8  16 48		 asl $48,x
$1d:f7fa  f8			sed
$1d:f7fb  5a			phy
$1d:f7fc  42 48		 wdm #$48
$1d:f7fe  08			php
$1d:f7ff  4d 5a b1	  eor $b15a
$1d:f802  b1 05		 lda ($05),y
$1d:f804  84 15		 sty $15
$1d:f806  a0 d2 c4	  ldy #$c4d2
$1d:f809  e0 ff 78	  cpx #$78ff
$1d:f80c  2b			pld
$1d:f80d  54 1a 41	  mvn $41,$1a
$1d:f810  07 61		 ora [$61]
$1d:f812  22 78 7d e1   jsl $e17d78
$1d:f816  41 71		 eor ($71,x)
$1d:f818  03 40		 ora $40,s
$1d:f81a  9a			txs
$1d:f81b  a4 cf		 ldy $cf
$1d:f81d  08			php
$1d:f81e  72 54		 adc ($54)
$1d:f820  dc 04 e5	  jml [$e504]
$1d:f823  26 f8		 rol $f8
$1d:f825  b9 61 6b	  lda $6b61,y
$1d:f828  ec 6f 6b	  cpx $6b6f
$1d:f82b  fb			xce
$1d:f82c  79 23 ce	  adc $ce23,y
$1d:f82f  fd c6 59	  sbc $59c6,x
$1d:f832  f5 36		 sbc $36,x
$1d:f834  50 05		 bvc $f83b
$1d:f836  63 62		 adc $62,s
$1d:f838  db			stp
$1d:f839  0c 76 3c	  tsb $3c76
$1d:f83c  23 35		 and $35,s
$1d:f83e  68			pla
$1d:f83f  f6 e3		 inc $e3,x
$1d:f841  2d 97 10	  and $1097
$1d:f844  cd 5b 29	  cmp $295b
$1d:f847  95 e8		 sta $e8,x
$1d:f849  0c ab 38	  tsb $38ab
$1d:f84c  80 01		 bra $f84f
$1d:f84e  91 74		 sta ($74),y
$1d:f850  46 20		 lsr $20
$1d:f852  46 11		 lsr $11
$1d:f854  90 e7		 bcc $f83d
$1d:f856  6c f0 f1	  jmp ($f1f0)
$1d:f859  90 71		 bcc $f8cc
$1d:f85b  7a			ply
$1d:f85c  1b			tcs
$1d:f85d  3d 39 54	  and $5439,x
$1d:f860  8a			txa
$1d:f861  63 12		 adc $12,s
$1d:f863  d8			cld
$1d:f864  ef 09 07 d1   sbc $d10709
$1d:f868  18			clc
$1d:f869  11 18		 ora ($18),y
$1d:f86b  51 03		 eor ($03),y
$1d:f86d  d0 dc		 bne $f84b
$1d:f86f  eb			xba
$1d:f870  8a			txa
$1d:f871  61 b9		 adc ($b9,x)
$1d:f873  e2 71		 sep #$71
$1d:f875  0e a3 a6	  asl $a6a3
$1d:f878  2f 1e cc e8   and $e8cc1e
$1d:f87c  3b			tsc
$1d:f87d  33 c1		 and ($c1,s),y
$1d:f87f  6c cf a0	  jmp ($a0cf)
$1d:f882  6f 22 1d 17   adc $171d22
$1d:f886  c8			iny
$1d:f887  a6 5a		 ldx $5a
$1d:f889  f5 29		 sbc $29,x
$1d:f88b  14 c5		 trb $c5
$1d:f88d  1e a3 27	  asl $27a3,x
$1d:f890  2f 8e 51 85   and $85518e
$1d:f894  46 f0		 lsr $f0
$1d:f896  89 e7		 bit #$e7
$1d:f898  b3 fa		 lda ($fa,s),y
$1d:f89a  86 94		 stx $94
$1d:f89c  44 8d e1	  mvp $e1,$8d
$1d:f89f  65 b3		 adc $b3
$1d:f8a1  ec 5c 51	  cpx $515c
$1d:f8a4  1e 77 ac	  asl $ac77,x
$1d:f8a7  7e 00 f8	  ror $f800,x
$1d:f8aa  4b			phk
$1d:f8ab  3e a5 c4	  rol $c4a5,x
$1d:f8ae  1a			inc a
$1d:f8af  93 78		 sta ($78,s),y
$1d:f8b1  1b			tcs
$1d:f8b2  c1 f0		 cmp ($f0,x)
$1d:f8b4  b8			clv
$1d:f8b5  fd 86 38	  sbc $3886,x
$1d:f8b8  1e 11 68	  asl $6811,x
$1d:f8bb  b4 10		 ldy $10,x
$1d:f8bd  0e d9 7d	  asl $7dd9
$1d:f8c0  c6 58		 dec $58
$1d:f8c2  3e 0e f0	  rol $f00e,x
$1d:f8c5  86 01		 stx $01
$1d:f8c7  d8			cld
$1d:f8c8  ce 1f f3	  dec $f31f
$1d:f8cb  40			rti
$1d:f8cc  74 7f		 stz $7f,x
$1d:f8ce  30 d0		 bmi $f8a0
$1d:f8d0  3b			tsc
$1d:f8d1  6e 60 b0	  ror $b060
$1d:f8d4  68			pla
$1d:f8d5  34 1f		 bit $1f,x
$1d:f8d7  65 05		 adc $05
$1d:f8d9  8a			txa
$1d:f8da  0d dc 6c	  ora $6cdc
$1d:f8dd  1a			inc a
$1d:f8de  ad 5e b7	  lda $b75e
$1d:f8e1  57 ac		 eor [$ac],y
$1d:f8e3  1b			tcs
$1d:f8e4  be d3 63	  ldx $63d3,y
$1d:f8e7  12 a0		 ora ($a0)
$1d:f8e9  d6 27		 dec $27,x
$1d:f8eb  31 2f		 and ($2f),y
$1d:f8ed  41 22		 eor ($22,x)
$1d:f8ef  12 01		 ora ($01)
$1d:f8f1  60			rts
$1d:f8f2  38			sec
$1d:f8f3  09 62		 ora #$62
$1d:f8f5  e2 a1		 sep #$a1
$1d:f8f7  40			rti
$1d:f8f8  34 55		 bit $55,x
$1d:f8fa  86 3a		 stx $3a
$1d:f8fc  ef 02 c5 42   sbc $42c502
$1d:f900  21 2a		 and ($2a,x)
$1d:f902  40			rti
$1d:f903  34 55		 bit $55,x
$1d:f905  8e a1 51	  stx $51a1
$1d:f908  a8			tay
$1d:f909  3e 17 64	  rol $6417,x
$1d:f90c  60			rts
$1d:f90d  32 00		 and ($00)
$1d:f90f  be 17 3e	  ldx $3e17,y
$1d:f912  46 03		 lsr $03
$1d:f914  95 d9		 sta $d9,x
$1d:f916  c0 c0		 cpy #$c0
$1d:f918  62 13 ac	  per $a52e
$1d:f91b  3b			tsc
$1d:f91c  bd ff e1	  lda $e1ff,x
$1d:f91f  0f 10 f8 cb   ora $cbf810
$1d:f923  c8			iny
$1d:f924  7e 54 f3	  ror $f354,x
$1d:f927  2f 9d bd 0f   and $0fbd9d
$1d:f92b  e9 8f		 sbc #$8f
$1d:f92d  54 fa eb	  mvn $eb,$fa
$1d:f930  d9 7e dc	  cmp $dc7e,y
$1d:f933  f8			sed
$1d:f934  00 02		 brk #$02
$1d:f936  05 00		 ora $00
$1d:f938  0a			asl a
$1d:f939  a2 d1		 ldx #$d1
$1d:f93b  af 97 db f5   lda $f5db97
$1d:f93f  fd e2 59	  sbc $59e2,x
$1d:f942  0c 8b bc	  tsb $bc8b
$1d:f945  a9 b4		 lda #$b4
$1d:f947  e8			inx
$1d:f948  c4 66		 cpy $66
$1d:f94a  35 1b		 and $1b,x
$1d:f94c  00 96		 brk #$96
$1d:f94e  63 32		 adc $32,s
$1d:f950  ff 2c 14 36   sbc $36142c,x
$1d:f954  0c 11 58	  tsb $5811
$1d:f957  66 04		 ror $04
$1d:f959  1e 58 a8	  asl $a858,x
$1d:f95c  a8			tay
$1d:f95d  45 a2		 eor $a2
$1d:f95f  98			tya
$1d:f960  90 f9		 bcc $f95b
$1d:f962  60			rts
$1d:f963  e3 a1		 sbc $a1,s
$1d:f965  16 8e		 asl $8e,x
$1d:f967  60			rts
$1d:f968  05 e3		 ora $e3
$1d:f96a  92 c5		 sta ($c5)
$1d:f96c  c9 42		 cmp #$42
$1d:f96e  2d 24 c4	  and $c424
$1d:f971  0f c7 34 0f   ora $0f34c7
$1d:f975  08			php
$1d:f976  14 0c		 trb $0c
$1d:f978  22 93 69 bc   jsl $bc6993
$1d:f97c  b2 5a		 lda ($5a)
$1d:f97e  1d 28 54	  ora $5428,x
$1d:f981  2c 22 c1	  bit $c122
$1d:f984  12 17		 ora ($17)
$1d:f986  84 12		 sty $12
$1d:f988  0a			asl a
$1d:f989  63 a1		 adc $a1,s
$1d:f98b  fc 04 50	  jsr ($5004,x)
$1d:f98e  1f 01 14 0f   ora $0f1401,x
$1d:f992  94 8a		 sty $8a,x
$1d:f994  47 2a		 eor [$2a]
$1d:f996  95 99		 sta $99,x
$1d:f998  e0 2e		 cpx #$2e
$1d:f99a  c7 98		 cmp [$98]
$1d:f99c  14 a2		 trb $a2
$1d:f99e  26 07		 rol $07
$1d:f9a0  26 98		 rol $98
$1d:f9a2  92 49		 sta ($49)
$1d:f9a4  84 56		 sty $56
$1d:f9a6  fd 7f c8	  sbc $c87f,x
$1d:f9a9  64 68		 stz $68
$1d:f9ab  b4 6b		 ldy $6b,x
$1d:f9ad  e5 f5		 sbc $f5
$1d:f9af  de 0f 52	  dec $520f,x
$1d:f9b2  78			sei
$1d:f9b3  84 6a		 sty $6a
$1d:f9b5  37 98		 and [$98],y
$1d:f9b7  cc d3 69	  cpy $69d3
$1d:f9ba  d1 88		 cmp ($88),y
$1d:f9bc  cb			wai
$1d:f9bd  fc 00 a4	  jsr ($a400,x)
$1d:f9c0  01 05		 ora ($05,x)
$1d:f9c2  8e 2c c1	  stx $c12c
$1d:f9c5  83 8c		 sta $8c,s
$1d:f9c7  30 c9		 bmi $f992
$1d:f9c9  b4 ad		 ldy $ad,x
$1d:f9cb  a6 19		 ldx $19
$1d:f9cd  b7 15		 lda [$15],y
$1d:f9cf  b8			clv
$1d:f9d0  c0 cc		 cpy #$cc
$1d:f9d2  13 69		 ora ($69,s),y
$1d:f9d4  bc b2 5a	  ldy $5ab2,x
$1d:f9d7  66 48		 ror $48
$1d:f9d9  14 0c		 trb $0c
$1d:f9db  3a			dec a
$1d:f9dc  48			pha
$1d:f9dd  38			sec
$1d:f9de  85 42		 sta $42
$1d:f9e0  d8			cld
$1d:f9e1  60			rts
$1d:f9e2  83 a8		 sta $a8,s
$1d:f9e4  24 14		 bit $14
$1d:f9e6  7a			ply
$1d:f9e7  09 1c		 ora #$1c
$1d:f9e9  26 91		 rol $91
$1d:f9eb  7e 8b b1	  ror $b18b,x
$1d:f9ee  22 91 ca a5   jsl $a5ca91
$1d:f9f2  6c 12 0a	  jmp ($0a12)
$1d:f9f5  c3 3d		 cmp $3d,s
$1d:f9f7  04 b0		 tsb $b0
$1d:f9f9  df 41 ac 0c   cmp $0cac41,x
$1d:f9fd  c8			iny
$1d:f9fe  bb			tyx
$1d:f9ff  04 14		 tsb $14
$1d:fa01  10 83		 bpl $f986
$1d:fa03  65 02		 adc $02
$1d:fa05  70 e9		 bvs $f9f0
$1d:fa07  41 18		 eor ($18,x)
$1d:fa09  40			rti
$1d:fa0a  4c 4a b9	  jmp $b94a
$1d:fa0d  41 98		 eor ($98,x)
$1d:fa0f  42 4c		 wdm #$4c
$1d:fa11  41 01		 eor ($01,x)
$1d:fa13  0d 13 25	  ora $2513
$1d:fa16  08			php
$1d:fa17  67 09		 adc [$09]
$1d:fa19  15 13		 ora $13,x
$1d:fa1b  be 2c ef	  ldx $ef2c,y
$1d:fa1e  ab			plb
$1d:fa1f  31 05		 and ($05),y
$1d:fa21  88			dey
$1d:fa22  15 63		 ora $63,x
$1d:fa24  76 0f		 ror $0f,x
$1d:fa26  c1 25		 cmp ($25,x)
$1d:fa28  05 fe		 ora $fe
$1d:fa2a  00 72		 brk #$72
$1d:fa2c  4e 05 c0	  lsr $c005
$1d:fa2f  b3 f0		 lda ($f0,s),y
$1d:fa31  6f e9 b2 e8   adc $e8b2e9
$1d:fa35  83 ad		 sta $ad,s
$1d:fa37  aa			tax
$1d:fa38  82 ac 34	  brl $2ee7
$1d:fa3b  60			rts
$1d:fa3c  70 0f		 bvs $fa4d
$1d:fa3e  38			sec
$1d:fa3f  a8			tay
$1d:fa40  c2 e0		 rep #$e0
$1d:fa42  17 10		 ora [$10],y
$1d:fa44  42 1c		 wdm #$1c
$1d:fa46  d0 26		 bne $fa6e
$1d:fa48  0f 05 80 90   ora $908005
$1d:fa4c  d0 c6		 bne $fa14
$1d:fa4e  0d 84 14	  ora $1484
$1d:fa51  81 4d		 sta ($4d,x)
$1d:fa53  0e 60 e8	  asl $e860
$1d:fa56  43 0b		 eor $0b,s
$1d:fa58  10 c1		 bpl $fa1b
$1d:fa5a  74 67		 stz $67,x
$1d:fa5c  91 7b		 sta ($7b),y
$1d:fa5e  d9 a4 40	  cmp $40a4,y
$1d:fa61  ec ba 15	  cpx $15ba
$1d:fa64  58			cli
$1d:fa65  1e 44 2e	  asl $2e44,x
$1d:fa68  c3 f6		 cmp $f6,s
$1d:fa6a  13 f8		 ora ($f8,s),y
$1d:fa6c  e3 00		 sbc $00,s
$1d:fa6e  ce 6f 50	  dec $506f
$1d:fa71  b3 97		 lda ($97,s),y
$1d:fa73  fd 1e 54	  sbc $541e,x
$1d:fa76  43 ae		 eor $ae,s
$1d:fa78  d5 48		 cmp $48,x
$1d:fa7a  b0 13		 bcs $fa8f
$1d:fa7c  00 79		 brk #$79
$1d:fa7e  c0 42		 cpy #$42
$1d:fa80  ee 15 00	  inc $0015
$1d:fa83  f9 99 d8	  sbc $d899,y
$1d:fa86  32 53		 and ($53)
$1d:fa88  69 bc b2	  adc #$b2bc
$1d:fa8b  5a			phy
$1d:fa8c  8f 34 78 9a   sta $9a7834
$1d:fa90  48			pha
$1d:fa91  03 43		 ora $43,s
$1d:fa93  90 6a		 bcc $faff
$1d:fa95  00 06		 brk #$06
$1d:fa97  91 20		 sta ($20),y
$1d:fa99  e1 00		 sbc ($00,x)
$1d:fa9b  0b			phd
$1d:fa9c  b3 c5		 lda ($c5,s),y
$1d:fa9e  b2 40		 lda ($40)
$1d:faa0  17 6f		 ora [$6f],y
$1d:faa2  8b			phb
$1d:faa3  ff c2 02 51   sbc $5102c2,x
$1d:faa7  6a			ror a
$1d:faa8  5d 30 b6	  eor $b630,x
$1d:faab  01 f2		 ora ($f2,x)
$1d:faad  30 b5		 bmi $fa64
$1d:faaf  4e a8 6b	  lsr $6ba8
$1d:fab2  01 7c		 ora ($7c,x)
$1d:fab4  84 8d		 sty $8d
$1d:fab6  52 4c		 eor ($4c)
$1d:fab8  f1 1c		 sbc ($1c),y
$1d:faba  20 30 c5	  jsr $c530
$1d:fabd  61 09		 adc ($09,x)
$1d:fabf  49 09 dd	  eor #$dd09
$1d:fac2  99 22 df	  sta $df22,y
$1d:fac5  11 d8		 ora ($d8),y
$1d:fac7  ff 51 28 ef   sbc $ef2851,x
$1d:facb  14 19		 trb $19
$1d:facd  25 9c		 and $9c
$1d:facf  7e 29 32	  ror $3229,x
$1d:fad2  11 12		 ora ($12),y
$1d:fad4  29 94 26	  and #$2694
$1d:fad7  97 94		 sta [$94],y
$1d:fad9  15 85		 ora $85,x
$1d:fadb  da			phx
$1d:fadc  6d 37 96	  adc $9637
$1d:fadf  4b			phk
$1d:fae0  46 e1		 lsr $e1
$1d:fae2  1c c0 10	  trb $10c0
$1d:fae5  62 ce 37	  per $32b6
$1d:fae8  19 26 20	  ora $2026,y
$1d:faeb  8e c3 70	  stx $70c3
$1d:faee  b1 41		 lda ($41),y
$1d:faf0  bf 70 68 66   lda $666870,x
$1d:faf4  05 c6		 ora $c6
$1d:faf6  a3 71		 lda $71,s
$1d:faf8  a2 12		 ldx #$12
$1d:fafa  46 29		 lsr $29
$1d:fafc  89 69 aa	  bit #$aa69
$1d:faff  04 6a		 tsb $6a
$1d:fb01  ab			plb
$1d:fb02  a1 7e		 lda ($7e,x)
$1d:fb04  cb			wai
$1d:fb05  4c c1 a1	  jmp $a1c1
$1d:fb08  4b			phk
$1d:fb09  a6 13		 ldx $13
$1d:fb0b  c2 02		 rep #$02
$1d:fb0d  53 70		 eor ($70,s),y
$1d:fb0f  e8			inx
$1d:fb10  54 ea 85	  mvn $85,$ea
$1d:fb13  f0 84		 beq $fa99
$1d:fb15  98			tya
$1d:fb16  dc 5a 0d	  jml [$0d5a]
$1d:fb19  67 01		 adc [$01]
$1d:fb1b  9b			txy
$1d:fb1c  f5 1a		 sbc $1a,x
$1d:fb1e  aa			tax
$1d:fb1f  ba			tsx
$1d:fb20  10 6a		 bpl $fb8c
$1d:fb22  2d 8d 84	  and $848d
$1d:fb25  41 c1		 eor ($c1,x)
$1d:fb27  73 27		 adc ($27,s),y
$1d:fb29  f4 8e 64	  pea $648e
$1d:fb2c  80 36		 bra $fb64
$1d:fb2e  c3 8c		 cmp $8c,s
$1d:fb30  9b			txy
$1d:fb31  40			rti
$1d:fb32  7d 84 c1	  adc $c184,x
$1d:fb35  12 01		 ora ($01)
$1d:fb37  1b			tcs
$1d:fb38  04 74		 tsb $74
$1d:fb3a  4e b2 15	  lsr $15b2
$1d:fb3d  85 a1		 sta $a1
$1d:fb3f  83 8e		 sta $8e,s
$1d:fb41  b1 4c		 lda ($4c),y
$1d:fb43  de f8 b9	  dec $b9f8,x
$1d:fb46  2a			rol a
$1d:fb47  01 90		 ora ($90,x)
$1d:fb49  49 82 86	  eor #$8682
$1d:fb4c  8c d0 a6	  sty $a6d0
$1d:fb4f  47 72		 eor [$72]
$1d:fb51  c5 45		 cmp $45
$1d:fb53  48			pha
$1d:fb54  68			pla
$1d:fb55  63 23		 adc $23,s
$1d:fb57  b9 3b c8	  lda $c83b,y
$1d:fb5a  e1 4f		 sbc ($4f,x)
$1d:fb5c  f3 01		 sbc ($01,s),y
$1d:fb5e  30 32		 bmi $fb92
$1d:fb60  4e ac 1f	  lsr $1fac
$1d:fb63  61 bb		 adc ($bb,x)
$1d:fb65  0b			phd
$1d:fb66  fc 80 f2	  jsr ($f280,x)
$1d:fb69  29 1c aa	  and #$aa1c
$1d:fb6c  57 06		 eor [$06],y
$1d:fb6e  c9 13 e1	  cmp #$e113
$1d:fb71  ba			tsx
$1d:fb72  00 f1		 brk #$f1
$1d:fb74  cd 17 e1	  cmp $e117
$1d:fb77  da			phx
$1d:fb78  01 f2		 ora ($f2,x)
$1d:fb7a  37 a9		 and [$a9],y
$1d:fb7c  20 63 98	  jsr $9863
$1d:fb7f  07 79		 ora [$79]
$1d:fb81  0f d4 90 32   ora $3290d4
$1d:fb85  4c 43 fc	  jmp $fc43
$1d:fb88  b0 98		 bcs $fb22
$1d:fb8a  58			cli
$1d:fb8b  84 46		 sty $46
$1d:fb8d  25 13		 and $13
$1d:fb8f  68			pla
$1d:fb90  96 1b		 stx $1b,y
$1d:fb92  0e cf 2c	  asl $2ccf
$1d:fb95  66 36		 ror $36
$1d:fb97  f1 79		 sbc ($79),y
$1d:fb99  bd 5e dc	  lda $dc5e,x
$1d:fb9c  25 8e		 and $8e
$1d:fb9e  c7 b7		 cmp [$b7]
$1d:fba0  c8			iny
$1d:fba1  e4 f0		 cpx $f0
$1d:fba3  98			tya
$1d:fba4  0a			asl a
$1d:fba5  18			clc
$1d:fba6  57 20		 eor [$20],y
$1d:fba8  62 81 51	  per $4d2c
$1d:fbab  32 40		 and ($40)
$1d:fbad  e4 61		 cpx $61
$1d:fbaf  32 24		 and ($24)
$1d:fbb1  1a			inc a
$1d:fbb2  64 1e		 stz $1e
$1d:fbb4  86 23		 stx $23
$1d:fbb6  22 41 aa 40   jsl $40aa41
$1d:fbba  ee c7 64	  inc $64c7
$1d:fbbd  7e a1 8a	  ror $8aa1,x
$1d:fbc0  01 a8		 ora ($a8,x)
$1d:fbc2  72 80		 adc ($80)
$1d:fbc4  ea			nop
$1d:fbc5  3f e0 5b f8   and $f85be0,x
$1d:fbc9  0c 9c 1a	  tsb $1a9c
$1d:fbcc  45 23		 eor $23
$1d:fbce  95 4a		 sta $4a,x
$1d:fbd0  c8			iny
$1d:fbd1  b1 9b		 lda ($9b),y
$1d:fbd3  0e 0e 0a	  asl $0a0e
$1d:fbd6  1a			inc a
$1d:fbd7  55 a3		 eor $a3,x
$1d:fbd9  68			pla
$1d:fbda  62 a2 a6	  per $a27f
$1d:fbdd  5a			phy
$1d:fbde  3e 86 0e	  rol $0e86,x
$1d:fbe1  3a			dec a
$1d:fbe2  2f 63 e8 12   and $12e863
$1d:fbe6  cb			wai
$1d:fbe7  17 25		 ora [$25],y
$1d:fbe9  17 b1		 ora [$b1],y
$1d:fbeb  34 22		 bit $22,x
$1d:fbed  51 3c		 eor ($3c),y
$1d:fbef  36 1f		 rol $1f,x
$1d:fbf1  09 85 88	  ora #$8885
$1d:fbf4  44 59 e0	  mvp $e0,$59
$1d:fbf7  d5 26		 cmp $26,x
$1d:fbf9  88			dey
$1d:fbfa  5e af 78	  lsr $78af,x
$1d:fbfd  ec 7e 33	  cpx $337e
$1d:fc00  1b			tcs
$1d:fc01  78			sei
$1d:fc02  bc b7 c1	  ldy $c1b7,x
$1d:fc05  ca			dex
$1d:fc06  4e 10 17	  lsr $1710
$1d:fc09  94 da		 sty $da,x
$1d:fc0b  6f 2c 96 8b   adc $8b962c
$1d:fc0f  d9 fd e0	  cmp $e0fd,y
$1d:fc12  ff 37 82 05   sbc $058237,x
$1d:fc16  02 50		 cop #$50
$1d:fc18  91 40		 sta ($40),y
$1d:fc1a  94 28		 sty $28,x
$1d:fc1c  50 25		 bvc $fc43
$1d:fc1e  0b			phd
$1d:fc1f  1a			inc a
$1d:fc20  44 a6 2d	  mvp $2d,$a6
$1d:fc23  88			dey
$1d:fc24  ee ff 3f	  inc $3fff
$1d:fc27  fa			plx
$1d:fc28  43 c4		 eor $c4,s
$1d:fc2a  5e b2 f6	  lsr $f6b2,x
$1d:fc2d  1f b5 3d cb   ora $cb3db5,x
$1d:fc31  ef 6f 03 f8   sbc $f8036f
$1d:fc35  63 c5		 adc $c5,s
$1d:fc37  3e 3a f2	  rol $f23a,x
$1d:fc3a  5f 97 3c db   eor $db3c97,x
$1d:fc3e  e7 ef		 sbc [$ef]
$1d:fc40  47 fa		 eor [$fa]
$1d:fc42  83 d6		 sta $d6,s
$1d:fc44  3e c2 f6	  rol $f6c2,x
$1d:fc47  9f b9 20 02   sta $0220b9,x
$1d:fc4b  03 00		 ora $00,s
$1d:fc4d  06 80		 asl $80
$1d:fc4f  3b			tsc
$1d:fc50  eb			xba
$1d:fc51  a9 a9 77	  lda #$77a9
$1d:fc54  db			stp
$1d:fc55  ef c1 9e 1d   sbc $1d9ec1
$1d:fc59  f1 77		 sbc ($77),y
$1d:fc5b  8f fc 9f 50   sta $509ffc
$1d:fc5f  58			cli
$1d:fc60  29 3d b4	  and #$b43d
$1d:fc63  50 68		 bvc $fccd
$1d:fc65  04 1c		 tsb $1c
$1d:fc67  d4 52		 pei ($52)
$1d:fc69  12 7a		 ora ($7a)
$1d:fc6b  ed 35 7b	  sbc $7b35
$1d:fc6e  5d b4 86	  eor $86b4,x
$1d:fc71  45 60		 eor $60
$1d:fc73  b0 d8		 bcs $fc4d
$1d:fc75  8f ed b3 e7   sta $e7b3ed
$1d:fc79  f2 fc		 sbc ($fc)
$1d:fc7b  9d cb 45	  sta $45cb,x
$1d:fc7e  a6 ca		 ldx $ca
$1d:fc80  8f 7e 07 2c   sta $2c077e
$1d:fc84  d8			cld
$1d:fc85  17 0b		 ora [$0b],y
$1d:fc87  3d c8 9e	  and $9ec8,x
$1d:fc8a  bb			tyx
$1d:fc8b  ad de b7	  lda $b7de
$1d:fc8e  98			tya
$1d:fc8f  6c 0b c5	  jmp ($c50b)
$1d:fc92  e6 f4		 inc $f4
$1d:fc94  4f 4e 0f 0b   eor $0b0f4e
$1d:fc98  87 b9		 sta [$b9]
$1d:fc9a  ef f1 36 18   sbc $1836f1
$1d:fc9e  0c 0e 08	  tsb $080e
$1d:fca1  9e 7c 8e	  stz $8e7c,x
$1d:fca4  4f 2b 59 d3   eor $d3592b
$1d:fca8  ed 41 77	  sbc $7741
$1d:fcab  1d dc 4f	  ora $4fdc,x
$1d:fcae  88			dey
$1d:fcaf  9e 7d 0e	  stz $0e7d,x
$1d:fcb2  8f 4b af b1   sta $b1af4b
$1d:fcb6  54 87 8f	  mvn $8f,$87
$1d:fcb9  cb			wai
$1d:fcba  91 c5		 sta ($c5),y
$1d:fcbc  13 b1		 ora ($b1,s),y
$1d:fcbe  f9 e0 df	  sbc $dfe0,y
$1d:fcc1  0f 78 bf c8   ora $c8bf78
$1d:fcc5  1e 50 d8	  asl $d850,x
$1d:fcc8  94 58		 sty $58,x
$1d:fcca  a1 55		 lda ($55,x)
$1d:fccc  f8			sed
$1d:fccd  5c 32 1b 0e   jml $0e1b32
$1d:fcd1  87 d7		 sta [$d7]
$1d:fcd3  f7 b0		 sbc [$b0],y
$1d:fcd5  03 b0		 ora $b0,s
$1d:fcd7  2b			pld
$1d:fcd8  ce c7 64	  dec $64c7
$1d:fcdb  93 d0		 sta ($d0,s),y
$1d:fcdd  a8			tay
$1d:fcde  71 1a		 adc ($1a),y
$1d:fce0  c7 16		 cmp [$16]
$1d:fce2  a1 c5		 lda ($c5,x)
$1d:fce4  8b			phb
$1d:fce5  c7 e3		 cmp [$e3]
$1d:fce7  ea			nop
$1d:fce8  f1 d5		 sbc ($d5),y
$1d:fcea  5b			tcd
$1d:fceb  20 50 38	  jsr $3850
$1d:fcee  24 42		 bit $42
$1d:fcf0  23 cd		 and $cd,s
$1d:fcf2  89 d4 a2	  bit #$a2d4
$1d:fcf5  b4 ae		 ldy $ae,x
$1d:fcf7  72 bc		 adc ($bc)
$1d:fcf9  76 57		 ror $57,x
$1d:fcfb  4b			phk
$1d:fcfc  6d ba df	  adc $dfba
$1d:fcff  18			clc
$1d:fd00  8c c6 a3	  sty $a3c6
$1d:fd03  71 c8		 adc ($c8),y
$1d:fd05  ed 12 72	  sbc $7212
$1d:fd08  8b			phb
$1d:fd09  1b			tcs
$1d:fd0a  dd f2 eb	  cmp $ebf2,x
$1d:fd0d  76 bb		 ror $bb,x
$1d:fd0f  d1 33		 cmp ($33),y
$1d:fd11  73 dd		 adc ($dd,s),y
$1d:fd13  35 12		 and $12,x
$1d:fd15  8b			phb
$1d:fd16  4c a2 a6	  jmp $a6a2
$1d:fd19  c7 07		 cmp [$07]
$1d:fd1b  bc fb df	  ldy $dffb,x
$1d:fd1e  af f4 c9 f5   lda $f5c9f4
$1d:fd22  2e 7f 3e	  rol $3e7f
$1d:fd25  a5 53		 lda $53
$1d:fd27  68			pla
$1d:fd28  9d 63 40	  sta $4063,x
$1d:fd2b  62 f0 95	  per $931e
$1d:fd2e  9c 36 1e	  stz $1e36
$1d:fd31  a9 46 a9	  lda #$a946
$1d:fd34  d1 e8		 cmp ($e8),y
$1d:fd36  d4 ba		 pei ($ba)
$1d:fd38  ad 32 ac	  lda $ac32
$1d:fd3b  cd 1c 66	  cmp $661c
$1d:fd3e  37 1d		 and [$1d],y
$1d:fd40  8f d7 d2 36   sta $36d2d7
$1d:fd44  f2 0d		 sbc ($0d)
$1d:fd46  7d 4e a9	  adc $a94e,x
$1d:fd49  4a			lsr a
$1d:fd4a  9c 9a 17	  stz $179a
$1d:fd4d  b1 d9		 lda ($d9),y
$1d:fd4f  e0 76		 cpx #$76
$1d:fd51  fa			plx
$1d:fd52  7d af 1b	  adc $1baf,x
$1d:fd55  90 3d		 bcc $fd94
$1d:fd57  59 23 41	  eor $4123,y
$1d:fd5a  f8			sed
$1d:fd5b  3c 3c 0f	  bit $0f3c,x
$1d:fd5e  1e 97 cf	  asl $cf97,x
$1d:fd61  c7 a0		 cmp [$a0]
$1d:fd63  cc 81 80	  cpy $8081
$1d:fd66  68			pla
$1d:fd67  2f 6f bb df   and $dfbb6f
$1d:fd6b  98			tya
$1d:fd6c  e3 b9		 sbc $b9,s
$1d:fd6e  02 83		 cop #$83
$1d:fd70  3c 34 24	  bit $2434,x
$1d:fd73  22 66 68 2f   jsl $2f6866
$1d:fd77  46 be		 lsr $be
$1d:fd79  76 1c		 ror $1c,x
$1d:fd7b  5d f1 a0	  eor $a0f1,x
$1d:fd7e  e5 32		 sbc $32
$1d:fd80  a0 da		 ldy #$da
$1d:fd82  08			php
$1d:fd83  90 d0		 bcc $fd55
$1d:fd85  13 13		 ora ($13,s),y
$1d:fd87  42 42		 wdm #$42
$1d:fd89  b4 26		 ldy $26,x
$1d:fd8b  84 d7		 sty $d7
$1d:fd8d  d0 1d		 bne $fdac
$1d:fd8f  c9 a8 77	  cmp #$77a8
$1d:fd92  27 a3		 and [$a3]
$1d:fd94  d0 2a		 bne $fdc0
$1d:fd96  52 82		 eor ($82)
$1d:fd98  8e 19 da	  stx $da19
$1d:fd9b  be 82 42	  ldx $4282,y
$1d:fd9e  9e 5a 55	  stz $555a,x
$1d:fda1  a0 43		 ldy #$43
$1d:fda3  e2 93		 sep #$93
$1d:fda5  d6 be		 dec $be,x
$1d:fda7  c6 f6		 dec $f6
$1d:fda9  bf 94 53 27   lda $275394,x
$1d:fdad  94 ca		 sty $ca,x
$1d:fdaf  e5 b2		 sbc $b2
$1d:fdb1  fe af 46	  inc $46af,x
$1d:fdb4  fe 51 e8	  inc $e851,x
$1d:fdb7  f4 eb e4	  pea $e4eb
$1d:fdba  7e 62 88	  ror $8862,x
$1d:fdbd  4c 9f e3	  jmp $e39f
$1d:fdc0  01 3c		 ora ($3c,x)
$1d:fdc2  b6 64		 ldx $64,y
$1d:fdc4  f2 b0		 sbc ($b0)
$1d:fdc6  9f 59 45 3d   sta $3d4559,x
$1d:fdca  60			rts
$1d:fdcb  c5 98		 cmp $98
$1d:fdcd  7b			tdc
$1d:fdce  3a			dec a
$1d:fdcf  be b1 29	  ldx $29b1,y
$1d:fdd2  7b			tdc
$1d:fdd3  35 d2		 and $d2,x
$1d:fdd5  b2 89		 lda ($89)
$1d:fdd7  ce 04 e7	  dec $e704
$1d:fdda  d5 13		 cmp $13,x
$1d:fddc  07 57		 ora [$57]
$1d:fdde  ec 0e 61	  cpx $610e
$1d:fde1  39 09 c3	  and $c309,y
$1d:fde4  d7 f4		 cmp [$f4],y
$1d:fde6  34 a4		 bit $a4,x
$1d:fde8  e0 4a		 cpx #$4a
$1d:fdea  bd 5e f0	  lda $f05e,x
$1d:fded  35 89		 and $89,x
$1d:fdef  07 d5		 ora [$d5]
$1d:fdf1  e3 0f		 sbc $0f,s
$1d:fdf3  96 00		 stx $00,y
$1d:fdf5  34 01		 bit $01,x
$1d:fdf7  39 7d 5c	  and $5c7d,y
$1d:fdfa  71 09		 adc ($09),y
$1d:fdfc  13 09		 ora ($09,s),y
$1d:fdfe  79 84 08	  adc $0884,y
$1d:fe01  7c 95 1f	  jmp ($1f95,x)
$1d:fe04  ad 3d 8b	  lda $8b3d
$1d:fe07  ed 6f 71	  sbc $716f
$1d:fe0a  d7 63		 cmp [$63],y
$1d:fe0c  b3 c0		 lda ($c0,s),y
$1d:fe0e  ed f4 fb	  sbc $fbf4
$1d:fe11  5e 3d 7d	  lsr $7d3d,x
$1d:fe14  23 d5		 and $d5,s
$1d:fe16  92 27		 sta ($27)
$1d:fe18  9f 83 c3 c0   sta $c0c383,x
$1d:fe1c  f1 e9		 sbc ($e9),y
$1d:fe1e  7c fc 7a	  jmp ($7afc,x)
$1d:fe21  0c c8 18	  tsb $18c8
$1d:fe24  04 f2		 tsb $f2
$1d:fe26  f6 fb		 inc $fb,x
$1d:fe28  bd f9 8e	  lda $8ef9,x
$1d:fe2b  3b			tsc
$1d:fe2c  ec 28 33	  cpx $3328
$1d:fe2f  c2 7a		 rep #$7a
$1d:fe31  42 33		 wdm #$33
$1d:fe33  f4 9a 4d	  pea $4d9a
$1d:fe36  3a			dec a
$1d:fe37  bd e8 d7	  lda $d7e8,x
$1d:fe3a  ce c3 8b	  dec $8bc3
$1d:fe3d  be ae 4e	  ldx $4eae,y
$1d:fe40  aa			tax
$1d:fe41  35 ac		 and $ac,x
$1d:fe43  e4 a6		 cpx $a6
$1d:fe45  54 1b 41	  mvn $41,$1b
$1d:fe48  10 e7		 bpl $fe31
$1d:fe4a  b3 55		 lda ($55,s),y
$1d:fe4c  ba			tsx
$1d:fe4d  bd 76 62	  lda $6276,x
$1d:fe50  70 48		 bvs $fe9a
$1d:fe52  56 86		 lsr $86,x
$1d:fe54  b9 9e a7	  lda $a79e,y
$1d:fe57  d7 08		 cmp [$08],y
$1d:fe59  c1 af		 cmp ($af,x)
$1d:fe5b  a0 1c 13	  ldy #$131c
$1d:fe5e  51 a4		 eor ($a4),y
$1d:fe60  1a			inc a
$1d:fe61  0d 6f 3b	  ora $3b6f
$1d:fe64  e8			inx
$1d:fe65  f4 0a 97	  pea $970a
$1d:fe68  43 66		 eor $66,s
$1d:fe6a  b3 69		 lda ($69,s),y
$1d:fe6c  eb			xba
$1d:fe6d  79 ea e8	  adc $e8ea,y
$1d:fe70  e1 92		 sbc ($92,x)
$1d:fe72  27 66		 and [$66]
$1d:fe74  d1 fa		 cmp ($fa),y
$1d:fe76  09 0a 79	  ora #$790a
$1d:fe79  69 56 81	  adc #$8156
$1d:fe7c  0f 8a 4f 5a   ora $5a4f8a
$1d:fe80  fb			xce
$1d:fe81  1b			tcs
$1d:fe82  da			phx
$1d:fe83  fe 49 4b	  inc $4b49,x
$1d:fe86  45 a6		 eor $a6
$1d:fe88  d5 6b		 cmp $6b,x
$1d:fe8a  b6 40		 ldx $40,y
$1d:fe8c  a0 70 43	  ldy #$4370
$1d:fe8f  cb			wai
$1d:fe90  5c 2e 37 2b   jml $2b372e
$1d:fe94  9d d2 db	  sta $dbd2,x
$1d:fe97  6e b7 9e	  ror $9eb7
$1d:fe9a  5a			phy
$1d:fe9b  f1 79		 sbc ($79),y
$1d:fe9d  bd 5e ef	  lda $ef5e,x
$1d:fea0  97 5b		 sta [$5b],y
$1d:fea2  b5 dc		 lda $dc,x
$1d:fea4  f2 d8		 sbc ($d8)
$1d:fea6  0c 0e 0b	  tsb $0b0e
$1d:fea9  07 bc		 ora [$bc]
$1d:feab  be df af	  ldx $afdf,y
$1d:feae  e7 96		 sbc [$96]
$1d:feb0  c4 62		 cpy $62
$1d:feb2  7c 58 bc	  jmp ($bc58,x)
$1d:feb5  26 17		 rol $17
$1d:feb7  0d 87 0e	  ora $0e87
$1d:feba  80 dd		 bra $fe99
$1d:febc  32 19		 and ($19)
$1d:febe  1c 56 2f	  trb $2f56
$1d:fec1  19 8d c7	  ora $c78d,y
$1d:fec4  63 c6		 adc $c6,s
$1d:fec6  ec 37 68	  cpx $6837
$1d:fec9  f1 1d		 sbc ($1d),y
$1d:fecb  e2 51		 sep #$51
$1d:fecd  60			rts
$1d:fece  e8			inx
$1d:fecf  49 24 b2	  eor #$b224
$1d:fed2  61 ba		 adc ($ba,x)
$1d:fed4  d7 e1		 cmp [$e1],y
$1d:fed6  70 c8		 bvs $fea0
$1d:fed8  6c 3a 1f	  jmp ($1f3a)
$1d:fedb  2c 96 cb	  bit $cb96
$1d:fede  a5 e3		 lda $e3
$1d:fee0  74 b1		 stz $b1,x
$1d:fee2  d9 24 f4	  cmp $f424,y
$1d:fee5  2a			rol a
$1d:fee6  1c 46 69	  trb $6946
$1d:fee9  35 9b		 and $9b,x
$1d:feeb  4d e2 f1	  eor $f1e2
$1d:feee  f8			sed
$1d:feef  f8			sed
$1d:fef0  dc 5e 47	  jml [$475e]
$1d:fef3  10 88		 bpl $fe7d
$1d:fef5  d0 e2		 bne $fed9
$1d:fef7  71 48		 adc ($48),y
$1d:fef9  ad 2b 9c	  lda $9c2b
$1d:fefc  37 10		 and [$10],y
$1d:fefe  11 c6		 ora ($c6),y
$1d:ff00  23 31		 and $31,s
$1d:ff02  a8			tay
$1d:ff03  dc 72 3b	  jml [$3b72]
$1d:ff06  44 9c a2	  mvp $a2,$9c
$1d:ff09  c4 24		 cpy $24
$1d:ff0b  74 4c		 stz $4c,x
$1d:ff0d  dc f7 4d	  jml [$4df7]
$1d:ff10  44 a2 d3	  mvp $d3,$a2
$1d:ff13  28			plp
$1d:ff14  a9 b1 11	  lda #$11b1
$1d:ff17  1d 32 7d	  ora $7d32,x
$1d:ff1a  4b			phk
$1d:ff1b  9f cf a9 54   sta $54a9cf,x
$1d:ff1f  da			phx
$1d:ff20  27 58		 and [$58]
$1d:ff22  3a			dec a
$1d:ff23  03 23		 ora $23,s
$1d:ff25  aa			tax
$1d:ff26  51 aa		 eor ($aa),y
$1d:ff28  74 7a		 stz $7a,x
$1d:ff2a  35 2e		 and $2e,x
$1d:ff2c  ab			plb
$1d:ff2d  4c ab 33	  jmp $33ab
$1d:ff30  44 86 5a	  mvp $5a,$86
$1d:ff33  fa			plx
$1d:ff34  46 de		 lsr $de
$1d:ff36  41 af		 eor ($af,x)
$1d:ff38  a9 d5 29	  lda #$29d5
$1d:ff3b  53 90		 eor ($90,s),y
$1d:ff3d  e8			inx
$1d:ff3e  00 02		 brk #$02
$1d:ff40  02 00		 cop #$00
$1d:ff42  04 9f		 tsb $9f
$1d:ff44  49 60 0f	  eor #$0f60
$1d:ff47  1b			tcs
$1d:ff48  8e bc 72	  stx $72bc
$1d:ff4b  00 f0		 brk #$f0
$1d:ff4d  d8			cld
$1d:ff4e  04 9c		 tsb $9c
$1d:ff50  01 b2		 ora ($b2,x)
$1d:ff52  f0 06		 beq $ff5a
$1d:ff54  cd e4 cf	  cmp $cfe4
$1d:ff57  1c 9f cb	  trb $cb9f
$1d:ff5a  9e 39 2d	  stz $2d39,x
$1d:ff5d  9b			txy
$1d:ff5e  3f f5 df a4   and $a4dff5,x
$1d:ff62  0d 80 14	  ora $1480
$1d:ff65  36 00		 rol $00,x
$1d:ff67  60			rts
$1d:ff68  f7 86		 sbc [$86],y
$1d:ff6a  87 fc		 sta [$fc]
$1d:ff6c  61 ed		 adc ($ed,x)
$1d:ff6e  0d 86 c7	  ora $c786
$1d:ff71  a0 ed		 ldy #$ed
$1d:ff73  0d 87 b4	  ora $b487
$1d:ff76  32 0d		 and ($0d)
$1d:ff78  17 68		 ora [$68],y
$1d:ff7a  64 3a		 stz $3a
$1d:ff7c  3e d0 b8	  rol $b8d0,x
$1d:ff7f  2c 5a 2a	  bit $2a5a
$1d:ff82  e3 d8		 sbc $d8,s
$1d:ff84  2b			pld
$1d:ff85  87 9a		 sta [$9a]
$1d:ff87  1a			inc a
$1d:ff88  f2 f0		 sbc ($f0)
$1d:ff8a  1f 85 3c 4b   ora $4b3c85,x
$1d:ff8e  ee 6a 83	  inc $836a
$1d:ff91  34 36		 bit $36,x
$1d:ff93  1c 63 c5	  trb $c563
$1d:ff96  00 11		 brk #$11
$1d:ff98  36 3c		 rol $3c,x
$1d:ff9a  63 a9		 adc $a9,s
$1d:ff9c  fc b8 c7	  jsr ($c7b8,x)
$1d:ff9f  92 d9		 sta ($d9)
$1d:ffa1  b4 74		 ldy $74,x
$1d:ffa3  c7 72		 cmp [$72]
$1d:ffa5  69 f4 94	  adc #$94f4
$1d:ffa8  c7 6f		 cmp [$6f]
$1d:ffaa  0d 80 00	  ora $0080
$1d:ffad  36 00		 rol $00,x
$1d:ffaf  10 d8		 bpl $ff89
$1d:ffb1  04 9c		 tsb $9c
$1d:ffb3  c7 b2		 cmp [$b2]
$1d:ffb5  f5 9e		 sbc $9e,x
$1d:ffb7  cd e4 cb	  cmp $cbe4
$1d:ffba  3c 77 f8	  bit $f877,x
$1d:ffbd  03 63		 ora $63,s
$1d:ffbf  a1 0d		 lda ($0d,x)
$1d:ffc1  20 68 38	  jsr $3868
$1d:ffc4  04 1a		 tsb $1a
$1d:ffc6  1f f1 86 98   ora $9886f1,x
$1d:ffca  06 0e		 asl $0e
$1d:ffcc  60			rts
$1d:ffcd  d8			cld
$1d:ffce  79 83 20	  adc $2083,y
$1d:ffd1  d1 73		 cmp ($73),y
$1d:ffd3  06 43		 asl $43
$1d:ffd5  a3 e6		 lda $e6,s
$1d:ffd7  0b			phd
$1d:ffd8  82 c5 a2	  brl $a2a0
$1d:ffdb  a6 0b		 ldx $0b
$1d:ffdd  86 c7		 stx $c7
$1d:ffdf  a0 a6		 ldy #$a6
$1d:ffe1  0d 86 b4	  ora $b486
$1d:ffe4  36 0c		 rol $0c,x
$1d:ffe6  d0 d8		 bne $ffc0
$1d:ffe8  73 43		 adc ($43,s),y
$1d:ffea  06 00		 asl $00
$1d:ffec  44 d8 f3	  mvp $f3,$d8
$1d:ffef  8f de 9e 05   sta $059ede
$1d:fff3  f0 b7		 beq $ffac
$1d:fff5  89 fd ce	  bit #$cefd
$1d:fff8  a0 7f		 ldy #$7f
$1d:fffa  40			rti
$1d:fffb  00 00		 brk #$00
$1d:fffd  00 00		 brk #$00
$1d:ffff  00 02		 brk #$02
