; Soul Blazer (SNES) - Bank $12
; Disassembled from ROM
; File offset: $090000-$097fff
; CPU address: $12:$8000-$12:$ffff
;===========================================================

.bank $12
.org $8000

$12:8000  00 20		 brk #$20
$12:8002  80 3b		 bra $803f
$12:8004  fd fd 9c	  sbc $9cfd,x
$12:8007  79 c6 a6	  adc $a6c6,y
$12:800a  dd 5a e1	  cmp $e15a,x
$12:800d  cb			wai
$12:800e  33 36		 and ($36,s),y
$12:8010  2e 5e d6	  rol $d65e
$12:8013  cd cb 9e	  cmp $9ecb
$12:8016  7f df c3 10   adc $10c3df,x
$12:801a  80 4f		 bra $806b
$12:801c  20 17 e1	  jsr $e117
$12:801f  10 c6		 bpl $7fe7
$12:8021  1f c7 cf 98   ora $98cfc7,x
$12:8025  75 e7		 adc $e7,x
$12:8027  1e 68 ff	  asl $ff68,x
$12:802a  56 63		 lsr $63,x
$12:802c  aa			tax
$12:802d  b4 72		 ldy $72,x
$12:802f  ac de fa	  ldy $fade
$12:8032  ce 66 82	  dec $8266
$12:8035  fe 48 74	  inc $7448,x
$12:8038  02 2f		 cop #$2f
$12:803a  00 8e		 brk #$8e
$12:803c  c0 27 c4	  cpy #$c427
$12:803f  a1 f5		 lda ($f5,x)
$12:8041  c6 bb		 dec $bb
$12:8043  13 5d		 ora ($5d,s),y
$12:8045  dd e6 8d	  cmp $8de6,x
$12:8048  af d3 76 76   lda $7676d3
$12:804c  bc fb 56	  ldy $56fb,x
$12:804f  6a			ror a
$12:8050  d7 91		 cmp [$91],y
$12:8052  82 11 06	  brl $8666
$12:8055  0c 20 17	  tsb $1720
$12:8058  f1 41		 sbc ($41),y
$12:805a  4c 43 fa	  jmp $fa43
$12:805d  83 fd		 sta $fd,s
$12:805f  21 97		 and ($97,x)
$12:8061  bc 57 b6	  ldy $b657,x
$12:8064  35 ae		 and $ae,x
$12:8066  ed dc ed	  sbc $eddc
$12:8069  39 d8 a7	  and $a7d8,y
$12:806c  8e 1e fe	  stx $fe1e
$12:806f  08			php
$12:8070  19 a8 60	  ora $60a8,y
$12:8073  e8			inx
$12:8074  41 c3		 eor ($c3,x)
$12:8076  40			rti
$12:8077  3c 70 0f	  bit $0f70,x
$12:807a  84 03		 sty $03
$12:807c  7f c0 ac d9   adc $d9acc0,x
$12:8080  b5 53		 lda $53,x
$12:8082  7a			ply
$12:8083  ac 6b af	  ldy $af6b
$12:8086  18			clc
$12:8087  c7 c4		 cmp [$c4]
$12:8089  25 73		 and $73
$12:808b  4a			lsr a
$12:808c  af b9 fc 18   lda $18fcb9
$12:8090  08			php
$12:8091  07 02		 ora [$02]
$12:8093  01 e0		 ora ($e0,x)
$12:8095  52 1a		 eor ($1a)
$12:8097  8c 1f c1	  sty $c11f
$12:809a  77 c4		 adc [$c4],y
$12:809c  7a			ply
$12:809d  e3 9d		 sbc $9d,s
$12:809f  69 4e ce	  adc #$ce4e
$12:80a2  f9 5b e6	  sbc $e65b,y
$12:80a5  5a			phy
$12:80a6  f9 9b 7b	  sbc $7b9b,y
$12:80a9  c0 bc 1f	  cpy #$1fbc
$12:80ac  cc be 05	  cpy $05be
$12:80af  f2 6f		 sbc ($6f)
$12:80b1  e8			inx
$12:80b2  12 de		 ora ($de)
$12:80b4  97 5b		 sta [$5b],y
$12:80b6  fb			xce
$12:80b7  2b			pld
$12:80b8  f7 73		 sbc [$73],y
$12:80ba  2c f3 5c	  bit $5cf3
$12:80bd  35 2f		 and $2f,x
$12:80bf  d8			cld
$12:80c0  0f 07 f2 08   ora $08f207
$12:80c4  41 bc		 eor ($bc,x)
$12:80c6  17 83		 ora [$83],y
$12:80c8  21 f5		 and ($f5,x)
$12:80ca  3d b6 ac	  and $acb6,x
$12:80cd  e4 d2		 cpx $d2
$12:80cf  f1 a0		 sbc ($a0),y
$12:80d1  e0 28 40	  cpx #$4028
$12:80d4  7e 9f d8	  ror $d89f,x
$12:80d7  17 fa		 ora [$fa],y
$12:80d9  01 fc		 ora ($fc,x)
$12:80db  52 0b		 eor ($0b)
$12:80dd  dd a1 00	  cmp $00a1,x
$12:80e0  e1 88		 sbc ($88,x)
$12:80e2  46 21		 lsr $21
$12:80e4  91 8a		 sta ($8a),y
$12:80e6  84 12		 sty $12
$12:80e8  1d 0c 90	  ora $900c,x
$12:80eb  c2 a5		 rep #$a5
$12:80ed  90 59		 bcc $8148
$12:80ef  44 40 3e	  mvp $3e,$40
$12:80f2  13 c8		 ora ($c8,s),y
$12:80f4  05 f2		 ora $f2
$12:80f6  01 76		 ora ($76,x)
$12:80f8  84 5f		 sty $5f
$12:80fa  e0 17 b8	  cpx #$b817
$12:80fd  24 f6		 bit $f6
$12:80ff  05 00		 ora $00
$12:8101  80 8b		 bra $808e
$12:8103  82 0b 03	  brl $8411
$12:8106  81 41		 sta ($41,x)
$12:8108  e0 b0 68	  cpx #$68b0
$12:810b  54 12 09	  mvn $09,$12
$12:810e  08			php
$12:810f  8c 42 20	  sty $2042
$12:8112  30 08		 bmi $811c
$12:8114  14 05		 trb $05
$12:8116  0a			asl a
$12:8117  48			pha
$12:8118  50 3f		 bvc $8159
$12:811a  01 84		 ora ($84,x)
$12:811c  23 8c		 and $8c,s
$12:811e  a0 18 0c	  ldy #$0c18
$12:8121  06 07		 asl $07
$12:8123  04 18		 tsb $18
$12:8125  04 1e		 tsb $1e
$12:8127  07 0a		 ora [$0a]
$12:8129  86 43		 stx $43
$12:812b  a0 51 41	  ldy #$4151
$12:812e  f9 20 44	  sbc $4420,y
$12:8131  6a			ror a
$12:8132  10 08		 bpl $813c
$12:8134  5c 10 fc 11   jml $11fc10
$12:8138  60			rts
$12:8139  78			sei
$12:813a  14 c2		 trb $c2
$12:813c  03 04		 ora $04,s
$12:813e  81 40		 sta ($40,x)
$12:8140  e0 f0 c1	  cpx #$c1f0
$12:8143  98			tya
$12:8144  42 e1		 wdm #$e1
$12:8146  b0 f8		 bcs $8140
$12:8148  b4 14		 ldy $14,x
$12:814a  7e 06 30	  ror $3006,x
$12:814d  83 10		 sta $10,s
$12:814f  86 1b		 stx $1b
$12:8151  02 34		 cop #$34
$12:8153  94 5c		 sty $5c,x
$12:8155  7c 63 30	  jmp ($3063,x)
$12:8158  49 04 1a	  eor #$1a04
$12:815b  0d 08 20	  ora $2008
$12:815e  84 2e		 sty $2e
$12:8160  3b			tsc
$12:8161  0d 3f 91	  ora $913f
$12:8164  14 0c		 trb $0c
$12:8166  a0 83 08	  ldy #$0883
$12:8169  54 14 d2	  mvn $d2,$14
$12:816c  11 d2		 ora ($d2),y
$12:816e  89 40 4a	  bit #$4a40
$12:8171  65 03		 adc $03
$12:8173  83 43		 sta $43,s
$12:8175  20 f0 78	  jsr $78f0
$12:8178  6c 72 16	  jmp ($1672)
$12:817b  7f 23 1a 12   adc $121a23,x
$12:817f  40			rti
$12:8180  92 11		 sta ($11)
$12:8182  f2 70		 sbc ($70)
$12:8184  9c 40 80	  stz $8040
$12:8187  05 80		 ora $80
$12:8189  19 04 3d	  ora $3d04,y
$12:818c  4e 30 e8	  lsr $e830
$12:818f  6b			rtl
$12:8190  04 90		 tsb $90
$12:8192  64 65		 stz $65
$12:8194  02 48		 cop #$48
$12:8196  1a			inc a
$12:8197  41 9a		 eor ($9a,x)
$12:8199  15 49		 ora $49,x
$12:819b  9f 2b 8d 32   sta $328d2b,x
$12:819f  f8			sed
$12:81a0  f9 3c 73	  sbc $733c,y
$12:81a3  6f ed af c9   adc $c9afed
$12:81a7  44 83 e4	  mvp $e4,$83
$12:81aa  bc 78 dc	  ldy $dc78,x
$12:81ad  14 c7		 trb $c7
$12:81af  e1 0c		 sbc ($0c,x)
$12:81b1  fe 46 3f	  inc $3f46,x
$12:81b4  06 30		 asl $30
$12:81b6  66 87		 ror $87
$12:81b8  e2 01		 sep #$01
$12:81ba  0c 87 f2	  tsb $f287
$12:81bd  2e 5c c8	  rol $c85c
$12:81c0  7e db 7d	  ror $7ddb,x
$12:81c3  8b			phb
$12:81c4  cb			wai
$12:81c5  ed f1 db	  sbc $dbf1
$12:81c8  59 9e 6f	  eor $6f9e,y
$12:81cb  c1 ac		 cmp ($ac,x)
$12:81cd  8f df 70 9f   sta $9f70df
$12:81d1  08			php
$12:81d2  05 06		 ora $06
$12:81d4  01 60		 ora ($60,x)
$12:81d6  b0 60		 bcs $8238
$12:81d8  2f db 0a 7c   and $7c0adb
$12:81dc  03 fe		 ora $fe,s
$12:81de  2b			pld
$12:81df  0f 24 9f b7   ora $b79f24
$12:81e3  3c ee 48	  bit $48ee,x
$12:81e6  f5 77		 sbc $77,x
$12:81e8  7a			ply
$12:81e9  a7 b7		 lda [$b7]
$12:81eb  75 44		 adc $44,x
$12:81ed  d2 df		 cmp ($df)
$12:81ef  2d bc 58	  and $58bc
$12:81f2  c3 38		 cmp $38,s
$12:81f4  08			php
$12:81f5  06 ae		 asl $ae
$12:81f7  06 09		 asl $09
$12:81f9  4c a0 1d	  jmp $1da0
$12:81fc  69 87 da	  adc #$da87
$12:81ff  67 49		 adc [$49]
$12:8201  d1 e5		 cmp ($e5),y
$12:8203  3e 7a b9	  rol $b97a,x
$12:8206  c6 56		 dec $56
$12:8208  99 66 9f	  sta $9f66,y
$12:820b  72 6e		 adc ($6e)
$12:820d  ee 90 86	  inc $8690
$12:8210  b3 05		 lda ($05,s),y
$12:8212  d2 1c		 cmp ($1c)
$12:8214  78			sei
$12:8215  07 8e		 ora [$8e]
$12:8217  01 c1		 ora ($c1,x)
$12:8219  80 60		 bra $827b
$12:821b  20 15 dc	  jsr $dc15
$12:821e  56 9e		 lsr $9e,x
$12:8220  89 57 c2	  bit #$c257
$12:8223  7a			ply
$12:8224  a9 b4 d8	  lda #$d8b4
$12:8227  5c 6a 6d b5   jml $b56d6a
$12:822b  e6 5e		 inc $5e
$12:822d  71 02		 adc ($02),y
$12:822f  10 05		 bpl $8236
$12:8231  80 2c		 bra $825f
$12:8233  36 08		 rol $08,x
$12:8235  41 35		 eor ($35,x)
$12:8237  82 84 a5	  brl $27be
$12:823a  7d af 9c	  adc $9caf,x
$12:823d  33 5f		 and ($5f,s),y
$12:823f  70 e5		 bvs $8226
$12:8241  d3 3c		 cmp ($3c,s),y
$12:8243  ba			tsx
$12:8244  6f 5e 8a b5   adc $b58a5e
$12:8248  43 d6		 eor $d6,s
$12:824a  ce 60 84	  dec $8460
$12:824d  03 98		 ora $98,s
$12:824f  40			rti
$12:8250  07 e1		 ora [$e1]
$12:8252  1c 80 6f	  trb $6f80
$12:8255  20 1d e1	  jsr $e11d
$12:8258  58			cli
$12:8259  fd e1 1d	  sbc $1de1,x
$12:825c  d9 d6 9e	  cmp $9ed6,y
$12:825f  e9 ab a6	  sbc #$a6ab
$12:8262  65 eb		 adc $eb
$12:8264  1c f9 a0	  trb $a0f9
$12:8267  b0 08		 bcs $8271
$12:8269  08			php
$12:826a  3f 05 28 48   and $482805,x
$12:826e  08			php
$12:826f  06 2c		 asl $2c
$12:8271  16 75		 asl $75,x
$12:8273  b7 bd		 lda [$bd],y
$12:8275  df ef ec 89   cmp $89ecef,x
$12:8279  41 a1		 eor ($a1,x)
$12:827b  b1 38		 lda ($38),y
$12:827d  54 06 0b	  mvn $0b,$06
$12:8280  08			php
$12:8281  81 41		 sta ($41,x)
$12:8283  30 b0		 bmi $8235
$12:8285  28			plp
$12:8286  16 07		 asl $07,x
$12:8288  83 80		 sta $80,s
$12:828a  9f 40 4c 60   sta $604c40,x
$12:828e  21 2c		 and ($2c,x)
$12:8290  78			sei
$12:8291  98			tya
$12:8292  4c e4 a6	  jmp $a6e4
$12:8295  09 cc 42	  ora #$42cc
$12:8298  23 20		 and $20,s
$12:829a  91 48		 sta ($48),y
$12:829c  69 52 79	  adc #$7952
$12:829f  55 73		 eor $73,x
$12:82a1  91 70		 sta ($70),y
$12:82a3  a0 60 23	  ldy #$2360
$12:82a6  b0 09		 bcs $82b1
$12:82a8  cc 02 77	  cpy $7702
$12:82ab  00 9b		 brk #$9b
$12:82ad  c0 2d f0	  cpy #$f02d
$12:82b0  0b			phd
$12:82b1  f2 00		 sbc ($00)
$12:82b3  78			sei
$12:82b4  0a			asl a
$12:82b5  80 53		 bra $830a
$12:82b7  84 aa		 sty $aa
$12:82b9  75 30		 adc $30,x
$12:82bb  a2 44 26	  ldx #$2644
$12:82be  16 48		 asl $48,x
$12:82c0  34 93		 bit $93,x
$12:82c2  c3 46		 cmp $46,s
$12:82c4  89 f0 a3	  bit #$a3f0
$12:82c7  d0 09		 bne $82d2
$12:82c9  74 42		 stz $42,x
$12:82cb  7d 00 af	  adc $af00,x
$12:82ce  48			pha
$12:82cf  2e c4 40	  rol $40c4
$12:82d2  a0 7d d6	  ldy #$d67d
$12:82d5  01 00		 ora ($00,x)
$12:82d7  80 c5		 bra $829e
$12:82d9  a7 51		 lda [$51]
$12:82db  c8			iny
$12:82dc  34 a2		 bit $a2,x
$12:82de  4b			phk
$12:82df  28			plp
$12:82e0  ba			tsx
$12:82e1  ce 23 15	  dec $1523
$12:82e4  1a			inc a
$12:82e5  5f 47 45 b1   eor $b14547,x
$12:82e9  8b			phb
$12:82ea  c2 27		 rep #$27
$12:82ec  f0 09		 beq $82f7
$12:82ee  7c 41 06	  jmp ($0641,x)
$12:82f1  17 f8		 ora [$f8],y
$12:82f3  05 7e		 ora $7e
$12:82f5  41 df		 eor ($df,x)
$12:82f7  90 6f		 bcc $8368
$12:82f9  e8			inx
$12:82fa  10 08		 bpl $8304
$12:82fc  ac ee 3f	  ldy $3fee
$12:82ff  0c 94 dc	  tsb $dc94
$12:8302  e7 d1		 sbc [$d1]
$12:8304  ba			tsx
$12:8305  b7 b2		 lda [$b2],y
$12:8307  ed 01 d9	  sbc $d901
$12:830a  7d bc 91	  adc $91bc,x
$12:830d  58			cli
$12:830e  52 04		 eor ($04)
$12:8310  25 b1		 and $b1
$12:8312  24 39		 bit $39
$12:8314  2f 43 77 44   and $447743
$12:8318  6e 84 3e	  ror $3e84
$12:831b  35 22		 and $22,x
$12:831d  87 47		 sta [$47]
$12:831f  26 d6		 rol $d6
$12:8321  09 d4 7a	  ora #$7ad4
$12:8324  99 41 aa	  sta $aa41,y
$12:8327  60			rts
$12:8328  26 b5		 rol $b5
$12:832a  5f 88 84 10   eor $108488,x
$12:832e  a0 81 0b	  ldy #$0b81
$12:8331  dc 11 12	  jml [$1211]
$12:8334  15 79		 ora $79,x
$12:8336  46 de		 lsr $de
$12:8338  91 f7		 sta ($f7),y
$12:833a  84 46		 sty $46
$12:833c  a1 b2		 lda ($b2,x)
$12:833e  d8			cld
$12:833f  da			phx
$12:8340  40			rti
$12:8341  25 d3		 and $d3
$12:8343  3a			dec a
$12:8344  b4 8e		 ldy $8e,x
$12:8346  2d 63 f5	  and $f563
$12:8349  d1 a5		 cmp ($a5),y
$12:834b  bc 61 08	  ldy $0861,x
$12:834e  20 41 c2	  jsr $c241
$12:8351  48			pha
$12:8352  70 43		 bvs $8397
$12:8354  82 a4 15	  brl $98fb
$12:8357  21 eb		 and ($eb,x)
$12:8359  b3 da		 lda ($da,s),y
$12:835b  a3 9d		 lda $9d,s
$12:835d  99 05 b6	  sta $b605,y
$12:8360  cb			wai
$12:8361  ad e4 58	  lda $58e4
$12:8364  af bc ae 57   lda $57aebc
$12:8368  5b			tcd
$12:8369  9e 21 07	  stz $0721,x
$12:836c  59 67 60	  eor $6067,y
$12:836f  50 8f		 bvc $8300
$12:8371  be 03 ff	  ldx $ff03,y
$12:8374  35 ff		 and $ff,x
$12:8376  c8			iny
$12:8377  3c 75 79	  bit $7975,x
$12:837a  bf 4a 1d 2c   lda $2c1d4a,x
$12:837e  99 ea 66	  sta $66ea,y
$12:8381  35 99		 and $99,x
$12:8383  d5 4f		 cmp $4f,x
$12:8385  9f 4c 9e 49   sta $499e4c,x
$12:8389  e3 f0		 sbc $f0,s
$12:838b  8f fc 07 ff   sta $ff07fc
$12:838f  c0 bf d1	  cpy #$d1bf
$12:8392  b0 f0		 bcs $8384
$12:8394  4f a4 83 c1   eor $c183a4
$12:8398  83 c0		 sta $c0,s
$12:839a  70 38		 bvs $83d4
$12:839c  1a			inc a
$12:839d  ab			plb
$12:839e  77 56		 adc [$56],y
$12:83a0  77 ae		 adc [$ae],y
$12:83a2  b8			clv
$12:83a3  f5 e5		 sbc $e5,x
$12:83a5  1d 59 b7	  ora $b759,x
$12:83a8  92 53		 sta ($53)
$12:83aa  9b			txy
$12:83ab  b6 eb		 ldx $eb,y
$12:83ad  2c 31 18	  bit $1831
$12:83b0  01 01		 ora ($01,x)
$12:83b2  21 10		 and ($10,x)
$12:83b4  02 f8		 cop #$f8
$12:83b6  12 4a		 ora ($4a)
$12:83b8  bf 60 dd 71   lda $71dd60,x
$12:83bc  69 db 2a	  adc #$2adb
$12:83bf  cf 56 5b 84   cmp $845b56
$12:83c3  b1 7b		 lda ($7b),y
$12:83c5  b1 b5		 lda ($b5),y
$12:83c7  3f 94 37 00   and $003794,x
$12:83cb  40			rti
$12:83cc  18			clc
$12:83cd  0c 02 45	  tsb $4502
$12:83d0  00 b9		 brk #$b9
$12:83d2  c0 07 e1	  cpy #$e107
$12:83d5  20 20 0e	  jsr $0e20
$12:83d8  5e db ed	  lsr $eddb,x
$12:83db  fa			plx
$12:83dc  56 a2		 lsr $a2,x
$12:83de  dc 68 54	  jml [$5468]
$12:83e1  b7 17		 lda [$17],y
$12:83e3  d6 8c		 dec $8c,x
$12:83e5  cb			wai
$12:83e6  e6 1d		 inc $1d
$12:83e8  bf 64 0a 01   lda $010a64,x
$12:83ec  03 80		 ora $80,s
$12:83ee  78			sei
$12:83ef  60			rts
$12:83f0  1f 18 07 c2   ora $c20718,x
$12:83f4  01 e0		 ora ($e0,x)
$12:83f6  80 70		 bra $8468
$12:83f8  08			php
$12:83f9  03 55		 ora $55,s
$12:83fb  c4 ee		 cpy $ee
$12:83fd  b9 7d 38	  lda $387d,y
$12:8400  14 b6		 trb $b6
$12:8402  9d 9a ce	  sta $ce9a,x
$12:8405  db			stp
$12:8406  7e 7f d8	  ror $d87f,x
$12:8409  1d 9b f3	  ora $f39b,x
$12:840c  fe 80 7d	  inc $7d80,x
$12:840f  20 1f c8	  jsr $c81f
$12:8412  06 c2		 asl $c2
$12:8414  01 60		 ora ($60,x)
$12:8416  20 2a bb	  jsr $bb2a
$12:8419  d7 fe		 cmp [$fe],y
$12:841b  d0 f7		 bne $8414
$12:841d  0f bc bd fd   ora $fdbdbc
$12:8421  36 0e		 rol $0e,x
$12:8423  06 42		 asl $42
$12:8425  c1 40		 cmp ($40,x)
$12:8427  98			tya
$12:8428  64 21		 stz $21
$12:842a  16 4e		 asl $4e,x
$12:842c  16 82		 asl $82,x
$12:842e  d1 55		 cmp ($55),y
$12:8430  9b			txy
$12:8431  65 a1		 adc $a1
$12:8433  e8			inx
$12:8434  32 fc		 and ($fc)
$12:8436  28			plp
$12:8437  87 ff		 sta [$ff]
$12:8439  00 f7		 brk #$f7
$12:843b  c4 3e		 cpy $3e
$12:843d  f0 81		 beq $83c0
$12:843f  38			sec
$12:8440  43 60		 eor $60,s
$12:8442  18			clc
$12:8443  28			plp
$12:8444  26 1e		 rol $1e
$12:8446  05 02		 ora $02
$12:8448  c0 f0 4c	  cpy #$4cf0
$12:844b  21 40		 and ($40,x)
$12:844d  32 84		 and ($84)
$12:844f  4a			lsr a
$12:8450  03 9f		 ora $9f,s
$12:8452  80 63		 bra $84b7
$12:8454  e0 1c 72	  cpx #$721c
$12:8457  10 f8		 bpl $8451
$12:8459  e0 16 98	  cpx #$9816
$12:845c  04 da		 tsb $da
$12:845e  01 9b		 ora ($9b,x)
$12:8460  80 70		 bra $84d2
$12:8462  f2 33		 sbc ($33)
$12:8464  9c 84 93	  stz $9384
$12:8467  31 8b		 and ($8b),y
$12:8469  c6 51		 dec $51
$12:846b  b0 7c		 bcs $84e9
$12:846d  3a			dec a
$12:846e  0d 6a 4f	  ora $4f6a
$12:8471  15 87		 ora $87,x
$12:8473  fe e0 1f	  inc $1fe0,x
$12:8476  d8			cld
$12:8477  02 7c		 cop #$7c
$12:8479  3b			tsc
$12:847a  f0 0e		 beq $848a
$12:847c  79 18 44	  adc $4418,y
$12:847f  e1 3f		 sbc ($3f,x)
$12:8481  80 4d		 bra $84d0
$12:8483  64 19		 stz $19
$12:8485  0d 2d 13	  ora $132d
$12:8488  c3 a2		 cmp $a2,s
$12:848a  50 05		 bvc $8491
$12:848c  02 01		 cop #$01
$12:848e  e4 f1		 cpx $f1
$12:8490  51 32		 eor ($32),y
$12:8492  f6 29		 inc $29,x
$12:8494  ff 03 7f 40   sbc $407f03,x
$12:8498  fb			xce
$12:8499  c0 36 f4	  cpy #$f436
$12:849c  01 38		 ora ($38,x)
$12:849e  09 c1 06	  ora #$06c1
$12:84a1  08			php
$12:84a2  30 98		 bmi $843c
$12:84a4  59 b8 9f	  eor $9fb8,y
$12:84a7  69 77 d3	  adc #$d377
$12:84aa  5f 74 b8 79   eor $79b874,x
$12:84ae  be 16 6d	  ldx $6d16,y
$12:84b1  bd 8a 4b	  lda $4b8a,x
$12:84b4  72 bf		 adc ($bf)
$12:84b6  e0 10 e4	  cpx #$e410
$12:84b9  a1 44		 lda ($44,x)
$12:84bb  59 7b 79	  eor $797b,y
$12:84be  32 0a		 and ($0a)
$12:84c0  4a			lsr a
$12:84c1  c4 3b		 cpy $3b
$12:84c3  3b			tsc
$12:84c4  0e 46 86	  asl $8646
$12:84c7  23 b0		 and $b0,s
$12:84c9  90 ec		 bcc $84b7
$12:84cb  34 13		 bit $13,x
$12:84cd  01 48		 ora ($48,x)
$12:84cf  5b			tcd
$12:84d0  f2 0c		 sbc ($0c)
$12:84d2  10 30		 bpl $8504
$12:84d4  87 b6		 sta [$b6]
$12:84d6  21 f9		 and ($f9,x)
$12:84d8  80 32		 bra $850c
$12:84da  4b			phk
$12:84db  99 86 af	  sta $af86,y
$12:84de  61 30		 adc ($30,x)
$12:84e0  d4 ce		 pei ($ce)
$12:84e2  84 32		 sty $32
$12:84e4  39 88 ee	  and $ee88,y
$12:84e7  42 33		 wdm #$33
$12:84e9  14 8a		 trb $8a
$12:84eb  c5 21		 cmp $21
$12:84ed  0e 46 30	  asl $3046
$12:84f0  71 90		 adc ($90),y
$12:84f2  94 1d		 sty $1d,x
$12:84f4  24 ee		 bit $ee
$12:84f6  f7 ff		 sbc [$ff],y
$12:84f8  84 3c		 sty $3c
$12:84fa  3d 7d 28	  and $287d,x
$12:84fd  df 56 6d f3   cmp $f36d56,x
$12:8501  86 6b		 stx $6b
$12:8503  ae 33 5c	  ldx $5c33
$12:8506  df 47 39 6a   cmp $6a3947,x
$12:850a  fb			xce
$12:850b  67 2c		 adc [$2c]
$12:850d  72 48		 adc ($48)
$12:850f  04 20		 tsb $20
$12:8511  3c 76 08	  bit $0876,x
$12:8514  05 8e		 ora $8e
$12:8516  01 01		 ora ($01,x)
$12:8518  0f 0f 3a 7f   ora $7f3a0f
$12:851c  b5 b8		 lda $b8,x
$12:851e  d6 b8		 dec $b8,x
$12:8520  da			phx
$12:8521  9b			txy
$12:8522  95 5b		 sta $5b,x
$12:8524  61 aa		 adc ($aa,x)
$12:8526  ed dd 71	  sbc $71dd
$12:8529  4a			lsr a
$12:852a  10 0f		 bpl $853b
$12:852c  04 3a		 tsb $3a
$12:852e  01 3f		 ora ($3f,x)
$12:8530  80 47		 bra $8579
$12:8532  e0 10 f8	  cpx #$f810
$12:8535  04 10		 tsb $10
$12:8537  3c 7f 68	  bit $687f,x
$12:853a  ae b7 b7	  ldx $b7b7
$12:853d  da			phx
$12:853e  f3 46		 sbc ($46,s),y
$12:8540  ac da af	  ldy $afda
$12:8543  b7 76		 lda [$76],y
$12:8545  97 76		 sta [$76],y
$12:8547  ec eb ee	  cpx $eeeb
$12:854a  04 12		 tsb $12
$12:854c  25 86		 and $86
$12:854e  04 94		 tsb $94
$12:8550  33 08		 and ($08,s),y
$12:8552  04 80		 tsb $80
$12:8554  3c 39 bc	  bit $bc39,x
$12:8557  e5 ae		 sbc $ae
$12:8559  99 e5 91	  sta $91e5,y
$12:855c  55 78		 eor $78,x
$12:855e  db			stp
$12:855f  5a			phy
$12:8560  35 aa		 and $aa,x
$12:8562  9b			txy
$12:8563  95 cd		 sta $cd,x
$12:8565  c3 be		 cmp $be,s
$12:8567  44 70 d8	  mvp $d8,$70
$12:856a  40			rti
$12:856b  3b			tsc
$12:856c  10 0f		 bpl $857d
$12:856e  c2 90		 rep #$90
$12:8570  54 20 47	  mvn $47,$20
$12:8573  02 59		 cop #$59
$12:8575  2c 3d 83	  bit $833d
$12:8578  ed 2f 71	  sbc $712f
$12:857b  fb			xce
$12:857c  d3 df		 cmp ($df,s),y
$12:857e  cf d3 b0 56   cmp $56b0d3
$12:8582  a7 91		 lda [$91]
$12:8584  a8			tay
$12:8585  34 d2		 bit $d2,x
$12:8587  1f 8d be d9   ora $d9be8d,x
$12:858b  3c f9 ac	  bit $acf9,x
$12:858e  e7 37		 sbc [$37]
$12:8590  e0 5d 02	  cpx #$025d
$12:8593  e8			inx
$12:8594  4f a0 37 f8   eor $f837a0
$12:8598  07 f6		 ora [$f6]
$12:859a  05 e7		 ora $e7
$12:859c  8c 67 ec	  sty $ec67
$12:859f  05 d0		 ora $d0
$12:85a1  c0 40 28	  cpy #$2840
$12:85a4  02 f0		 cop #$f0
$12:85a6  80 4a		 bra $85f2
$12:85a8  22 15 6c 67   jsl $676c15
$12:85ac  23 ef		 and $ef,s
$12:85ae  b5 bf		 lda $bf,x
$12:85b0  e7 33		 sbc [$33]
$12:85b2  88			dey
$12:85b3  50 f0		 bvc $85a5
$12:85b5  40			rti
$12:85b6  23 10		 and $10,s
$12:85b8  0b			phd
$12:85b9  f0 80		 beq $853b
$12:85bb  43 e5		 eor $e5,s
$12:85bd  9c b1 ea	  stz $eab1
$12:85c0  ab			plb
$12:85c1  75 2d		 adc $2d,x
$12:85c3  a5 23		 lda $23
$12:85c5  a1 a0		 lda ($a0,x)
$12:85c7  e0 0c 85	  cpx #$850c
$12:85ca  fc 7f b8	  jsr ($b87f,x)
$12:85cd  27 da		 and [$da]
$12:85cf  11 d8		 ora ($d8),y
$12:85d1  90 10		 bcc $85e3
$12:85d3  40			rti
$12:85d4  ae d5 19	  ldx $19d5
$12:85d7  1e 8a 23	  asl $238a,x
$12:85da  19 a0 52	  ora $52a0,y
$12:85dd  26 12		 rol $12
$12:85df  b8			clv
$12:85e0  e4 4a		 cpx $4a
$12:85e2  1d 04 81	  ora $8104,x
$12:85e5  e8			inx
$12:85e6  68			pla
$12:85e7  1f 72 f0 40   ora $40f072,x
$12:85eb  2f a4 41 9f   and $9f41a4
$12:85ef  c0 23 d0	  cpy #$d023
$12:85f2  1c 7c 03	  trb $037c
$12:85f5  e7 00		 sbc [$00]
$12:85f7  ba			tsx
$12:85f8  4c e9 72	  jmp $72e9
$12:85fb  1a			inc a
$12:85fc  84 e6		 sty $e6
$12:85fe  7b			tdc
$12:85ff  18			clc
$12:8600  90 45		 bcc $8647
$12:8602  23 d0		 and $d0,s
$12:8604  cc 04 2a	  cpy $2a04
$12:8607  17 86		 ora [$86],y
$12:8609  16 87		 asl $87,x
$12:860b  ae 21 fd	  ldx $fd21
$12:860e  13 04		 ora ($04,s),y
$12:8610  00 c2		 brk #$c2
$12:8612  1b			tcs
$12:8613  e8			inx
$12:8614  06 ee		 asl $ee
$12:8616  09 df 17	  ora #$17df
$12:8619  04 42		 tsb $42
$12:861b  f1 30		 sbc ($30),y
$12:861d  b0 4a		 bcs $8669
$12:861f  29 12 08	  and #$0812
$12:8622  84 e2		 sty $e2
$12:8624  61 18		 adc ($18,x)
$12:8626  9e 46 20	  stz $2046,x
$12:8629  91 03		 sta ($03),y
$12:862b  18			clc
$12:862c  7e 20 1e	  ror $1e20,x
$12:862f  88			dey
$12:8630  87 b2		 sta [$b2]
$12:8632  21 7c		 and ($7c,x)
$12:8634  80 31		 bra $8667
$12:8636  ca			dex
$12:8637  6d 08 a8	  adc $a808
$12:863a  52 33		 eor ($33)
$12:863c  14 8a		 trb $8a
$12:863e  06 23		 asl $23
$12:8640  81 88		 sta ($88,x)
$12:8642  c4 0b		 cpy $0b
$12:8644  c3 00		 cmp $00,s
$12:8646  57 2f		 eor [$2f],y
$12:8648  e3 78		 sbc $78,s
$12:864a  7b			tdc
$12:864b  0e 23 e4	  asl $e423
$12:864e  3a			dec a
$12:864f  07 80		 ora [$80]
$12:8651  ff e7 ef 83   sbc $83efe7,x
$12:8655  bc 3d bf	  ldy $bf3d,x
$12:8658  f1 7a		 sbc ($7a),y
$12:865a  dd ee fd	  cmp $fdee,x
$12:865d  de ee ab	  dec $abee,x
$12:8660  55 55		 eor $55,x
$12:8662  aa			tax
$12:8663  87 9b		 sta [$9b]
$12:8665  11 00		 ora ($00),y
$12:8667  91 40		 sta ($40),y
$12:8669  07 c1		 ora [$c1]
$12:866b  aa			tax
$12:866c  26 08		 rol $08
$12:866e  f8			sed
$12:866f  3d c2 e0	  and $e0c2,x
$12:8672  2a			rol a
$12:8673  0d df 11	  ora $11df
$12:8676  dd 91 0f	  cmp $0f91,x
$12:8679  00 aa		 brk #$aa
$12:867b  45 fa		 eor $fa
$12:867d  30 69		 bmi $86e8
$12:867f  b4 44		 ldy $44,x
$12:8681  1c 54 3f	  trb $3f54
$12:8684  5c 23 ee 95   jml $95ee23
$12:8688  03 db		 ora $db,s
$12:868a  42 20		 wdm #$20
$12:868c  11 48		 ora ($48),y
$12:868e  44 8a 28	  mvp $28,$8a
$12:8691  a5 05		 lda $05
$12:8693  18			clc
$12:8694  23 52		 and $52,s
$12:8696  41 df		 eor ($df,x)
$12:8698  3a			dec a
$12:8699  dc 82 01	  jml [$0182]
$12:869c  50 60		 bvc $86fe
$12:869e  89 fc 20	  bit #$20fc
$12:86a1  88			dey
$12:86a2  b9 48 0a	  lda $0a48,y
$12:86a5  5c 53 8a 7f   jml $7f8a53
$12:86a9  35 18		 and $18,x
$12:86ab  a8			tay
$12:86ac  84 dd		 sty $dd
$12:86ae  e7 f5		 sbc [$f5]
$12:86b0  a0 1f da	  ldy #$da1f
$12:86b3  45 cf		 eor $cf
$12:86b5  e4 fe		 cpx $fe
$12:86b7  b5 56		 lda $56,x
$12:86b9  cd 46 c2	  cmp $c246
$12:86bc  41 c0		 eor ($c0,x)
$12:86be  45 37		 eor $37
$12:86c0  ee 09 ee	  inc $ee09
$12:86c3  88			dey
$12:86c4  6e 28 1f	  ror $1f28
$12:86c7  08			php
$12:86c8  06 00		 asl $00
$12:86ca  fe 73 3f	  inc $3f73,x
$12:86cd  9d a6 2f	  sta $2fa6,x
$12:86d0  2d 8f 4d	  and $4d8f
$12:86d3  a7 39		 lda [$39]
$12:86d5  5f 6d b7 3d   eor $3db76d,x
$12:86d9  54 ec 68	  mvn $68,$ec
$12:86dc  38			sec
$12:86dd  1f 38 62 40   ora $406238,x
$12:86e1  a7 fc		 lda [$fc]
$12:86e3  0f ec 08 86   ora $8608ec
$12:86e7  1d c9 07	  ora $07c9,x
$12:86ea  82 01 41	  brl $c7ee
$12:86ed  c0 74 3c	  cpy #$3c74
$12:86f0  15 1e		 ora $1e,x
$12:86f2  f7 66		 sbc [$66],y
$12:86f4  73 12		 adc ($12,s),y
$12:86f6  87 69		 sta [$69]
$12:86f8  78			sei
$12:86f9  74 de		 stz $de,x
$12:86fb  76 ca		 ror $ca,x
$12:86fd  fd e7 80	  sbc $80e7,x
$12:8700  7e 60 1d	  ror $1d60,x
$12:8703  f9 07 e6	  sbc $e607,y
$12:8706  0d be 80	  ora $80be
$12:8709  90 c3		 bcc $86ce
$12:870b  9f 30 ff 40   sta $40ff30,x
$12:870f  6d db 19	  adc $19db
$12:8712  2f 76 ab 36   and $36ab76
$12:8716  a9 77 72	  lda #$7277
$12:8719  de 3a a6	  dec $a63a,x
$12:871c  3a			dec a
$12:871d  a9 38 90	  lda #$9038
$12:8720  50 08		 bvc $872a
$12:8722  60			rts
$12:8723  47 0b		 eor [$0b]
$12:8725  bc 20 c6	  ldy $c620,x
$12:8728  04 30		 tsb $30
$12:872a  ff 40 3f 90   sbc $903f40,x
$12:872e  0b			phd
$12:872f  06 03		 asl $03
$12:8731  85 81		 sta $81
$12:8733  0b			phd
$12:8734  86 42		 stx $42
$12:8736  41 48		 eor ($48,x)
$12:8738  ea			nop
$12:8739  79 75 72	  adc $7275,y
$12:873c  da			phx
$12:873d  f4 26 0b	  pea $0b26
$12:8740  05 81		 ora $81
$12:8742  f1 e0		 sbc ($e0),y
$12:8744  1f 18 00 94   ora $940018,x
$12:8748  3b			tsc
$12:8749  d2 0f		 cmp ($0f)
$12:874b  7c 42 ff	  jmp ($ff42,x)
$12:874e  00 ce		 brk #$ce
$12:8750  c0 b9 e1	  cpy #$e1b9
$12:8753  90 8a		 bcc $86df
$12:8755  46 a1		 lsr $a1
$12:8757  90 28		 bcc $8781
$12:8759  45 32		 eor $32
$12:875b  0d 01 92	  ora $9201
$12:875e  49 a0 71	  eor #$71a0
$12:8761  18			clc
$12:8762  1c 4a 13	  trb $134a
$12:8765  36 84		 rol $84,x
$12:8767  4f a0 15 b8   eor $b815a0
$12:876b  22 a4 2f b0   jsl $b02fa4
$12:876f  29 fc 03	  and #$03fc
$12:8772  7f 00 cf 86   adc $86cf00,x
$12:8776  52 01		 eor ($01)
$12:8778  10 69		 bpl $87e3
$12:877a  8b			phb
$12:877b  60			rts
$12:877c  24 11		 bit $11
$12:877e  09 84 40	  ora #$4084
$12:8781  52 02		 eor ($02)
$12:8783  90 c8		 bcc $874d
$12:8785  38			sec
$12:8786  87 61		 sta [$61]
$12:8788  00 98		 brk #$98
$12:878a  3a			dec a
$12:878b  06 70		 asl $70
$12:878d  ce 57 a7	  dec $a757
$12:8790  81 7c		 sta ($7c,x)
$12:8792  2d ec e5	  and $e5ec
$12:8795  91 48		 sta ($48),y
$12:8797  b1 18		 lda ($18),y
$12:8799  80 f3		 bra $878e
$12:879b  51 20		 eor ($20),y
$12:879d  11 18		 ora ($18),y
$12:879f  07 76		 ora [$76]
$12:87a1  01 77		 ora ($77,x)
$12:87a3  80 21		 bra $87c6
$12:87a5  c0 87 15	  cpy #$1587
$12:87a8  5d 54 8b	  eor $8b54,x
$12:87ab  ba			tsx
$12:87ac  42 2a		 wdm #$2a
$12:87ae  27 ff		 and [$ff]
$12:87b0  55 ff		 eor $ff,x
$12:87b2  aa			tax
$12:87b3  ff f7 7f f2   sbc $f27ff7,x
$12:87b7  1d 10 c8	  ora $c810,x
$12:87ba  aa			tax
$12:87bb  51 12		 eor ($12),y
$12:87bd  c2 fb		 rep #$fb
$12:87bf  cb			wai
$12:87c0  c0 6d 13	  cpy #$136d
$12:87c3  fe 90 c6	  inc $c690,x
$12:87c6  05 fd		 ora $fd
$12:87c8  82 fe 92	  brl $1ac9
$12:87cb  60			rts
$12:87cc  68			pla
$12:87cd  66 b0		 ror $b0
$12:87cf  40			rti
$12:87d0  a0 10 78	  ldy #$7810
$12:87d3  12 8c		 ora ($8c)
$12:87d5  11 2c		 ora ($2c),y
$12:87d7  71 6d		 adc ($6d),y
$12:87d9  d1 eb		 cmp ($eb),y
$12:87db  a0 2a ba	  ldy #$ba2a
$12:87de  ae fd cf	  ldx $cffd
$12:87e1  35 08		 and $08,x
$12:87e3  80 45		 bra $882a
$12:87e5  1c 82 8c	  trb $8c82
$12:87e8  37 7a		 and [$7a],y
$12:87ea  dd ef fd	  cmp $fdef,x
$12:87ed  de ee ab	  dec $abee,x
$12:87f0  55 55		 eor $55,x
$12:87f2  aa			tax
$12:87f3  8c db 01	  sty $01db
$12:87f6  08			php
$12:87f7  91 13		 sta ($13),y
$12:87f9  82 01 aa	  brl $31fd
$12:87fc  3f f8 7b b6   and $b67bf8,x
$12:8800  73 ca		 adc ($ca,s),y
$12:8802  cd 9f 25	  cmp $259f
$12:8805  71 f6		 adc ($f6),y
$12:8807  67 27		 adc [$27]
$12:8809  ff 0e ec 87   sbc $87ec0e,x
$12:880d  c7 03		 cmp [$03]
$12:880f  8e 47 f8	  stx $f847
$12:8812  10 0c		 bpl $8820
$12:8814  fc 02 1f	  jsr ($1f02,x)
$12:8817  00 c1		 brk #$c1
$12:8819  c0 3e 70	  cpy #$703e
$12:881c  0f f4 01 30   ora $3001f4
$12:8820  1e 38 04	  asl $0438,x
$12:8823  e7 f1		 sbc [$f1]
$12:8825  e7 cc		 sbc [$cc]
$12:8827  5f f9 fd 99   eor $99fdf9,x
$12:882b  f5 ce		 sbc $ce,x
$12:882d  9f 66 f0 ff   sta $fff066,x
$12:8831  20 1f 7e	  jsr $7e1f
$12:8834  3c 1c 0c	  bit $0c1c,x
$12:8837  10 0e		 bpl $8847
$12:8839  7a			ply
$12:883a  64 77		 stz $77
$12:883c  f0 08		 beq $8846
$12:883e  fc 02 7f	  jsr ($7f02,x)
$12:8841  00 e4		 brk #$e4
$12:8843  40			rti
$12:8844  33 d7		 and ($d7,s),y
$12:8846  9e 9f b2	  stz $b29f,x
$12:8849  e3 81		 sbc $81,s
$12:884b  af 77 fa 33   lda $33fa77
$12:884f  cb			wai
$12:8850  9f bf 89 3f   sta $3f89bf,x
$12:8854  c7 fc		 cmp [$fc]
$12:8856  ff 09 91 24   sbc $249109,x
$12:885a  84 82		 sty $82
$12:885c  01 03		 ora ($03,x)
$12:885e  80 78		 bra $88d8
$12:8860  20 05 b0	  jsr $b005
$12:8863  43 85		 eor $85,s
$12:8865  cf 87 1a 8f   cmp $8f1a87
$12:8869  70 7f		 bvs $88ea
$12:886b  f3 cf		 sbc ($cf,s),y
$12:886d  1e 7e f9	  asl $f97e,x
$12:8870  3e 83 fe	  rol $fe83,x
$12:8873  e7 91		 sbc [$91]
$12:8875  9f 0c f2 01   sta $01f20c,x
$12:8879  e1 61		 sbc ($61,x)
$12:887b  0a			asl a
$12:887c  14 0b		 trb $0b
$12:887e  62 6a 14	  per $9ceb
$12:8881  18			clc
$12:8882  2b			pld
$12:8883  bd 7f ed	  lda $ed7f,x
$12:8886  0f 6f 5f bf   ora $bf5f6f
$12:888a  ff 7f bf d7   sbc $d7bf7f,x
$12:888e  f3 f5		 sbc ($f5,s),y
$12:8890  3b			tsc
$12:8891  1d 52 2d	  ora $2d52,x
$12:8894  65 80		 adc $80
$12:8896  ca			dex
$12:8897  e1 19		 sbc ($19,x)
$12:8899  9c c2 04	  stz $04c2
$12:889c  2f f8 08 ff   and $ff08f8
$12:88a0  83 07		 sta $07,s
$12:88a2  fc f4 7f	  jsr ($7ff4,x)
$12:88a5  ff df ff bf   sbc $bfffdf,x
$12:88a9  fe cf ff	  inc $ffcf,x
$12:88ac  07 17		 ora [$17]
$12:88ae  e7 f3		 sbc [$f3]
$12:88b0  f0 fa		 beq $88ac
$12:88b2  f9 bd 90	  sbc $90bd,y
$12:88b5  9d 04 d6	  sta $d604,x
$12:88b8  01 99		 ora ($99,x)
$12:88ba  8c a0 41	  sty $41a0
$12:88bd  02 1f		 cop #$1f
$12:88bf  98			tya
$12:88c0  37 ca		 and [$ca],y
$12:88c2  1f e3 8f c7   ora $c78fe3,x
$12:88c6  c1 c3		 cmp ($c3,x)
$12:88c8  e6 07		 inc $07
$12:88ca  18			clc
$12:88cb  38			sec
$12:88cc  2f d7 e8 d6   and $d6e8d7
$12:88d0  66 17		 ror $17
$12:88d2  25 ea		 and $ea
$12:88d4  47 ac		 eor [$ac]
$12:88d6  30 50		 bmi $8928
$12:88d8  f9 20 42	  sbc $4220,y
$12:88db  fd 81 8c	  sbc $8c81,x
$12:88de  79 f8 1f	  adc $1ff8,y
$12:88e1  ff 0f ff f4   sbc $f4ff0f,x
$12:88e5  2e 5d fc	  rol $fc5d
$12:88e8  ff 5d ce d5   sbc $d5ce5d,x
$12:88ec  4c 6a 11	  jmp $116a
$12:88ef  eb			xba
$12:88f0  89 00 d0	  bit #$d000
$12:88f3  21 3f		 and ($3f,x)
$12:88f5  e0 43 be	  cpx #$be43
$12:88f8  24 92		 bit $92
$12:88fa  17 27		 ora [$27],y
$12:88fc  3f 9f 37 83   and $83379f,x
$12:8900  e1 2d		 sbc ($2d,x)
$12:8902  1a			inc a
$12:8903  9f 15 3a 81   sta $813a15,x
$12:8907  37 20		 and [$20],y
$12:8909  1f 3e 61 07   ora $07613e,x
$12:890d  fc 44 3f	  jsr ($3f44,x)
$12:8910  f1 c2		 sbc ($c2),y
$12:8912  a0 03 8f	  ldy #$8f03
$12:8915  fd fe fc	  sbc $fcfe,x
$12:8918  fe 3e 3f	  inc $3f3e,x
$12:891b  3e 5f 1f	  rol $1f5f,x
$12:891e  61 0a		 adc ($0a,x)
$12:8920  94 f8		 sty $f8,x
$12:8922  23 62		 and $62,s
$12:8924  01 ff		 ora ($ff,x)
$12:8926  40			rti
$12:8927  7f 10 7f 84   adc $847f10,x
$12:892b  3f 81 3f 1f   and $1f3f81,x
$12:892f  00 a4		 brk #$a4
$12:8931  b9 70 4a	  lda $4a70,y
$12:8934  ad 12 07	  lda $0712
$12:8937  a8			tay
$12:8938  82 d4 70	  brl $fa0f
$12:893b  32 69		 and ($69)
$12:893d  24 6a		 bit $6a
$12:893f  05 48		 ora $48
$12:8941  e8			inx
$12:8942  cc 41 c1	  cpy $c141
$12:8945  bb			tyx
$12:8946  ff c5 ff f8   sbc $f8ffc5,x
$12:894a  ef ff 60 94   sbc $9460ff
$12:894e  3b			tsc
$12:894f  7f fc 3b ff   adc $ff3bfc,x
$12:8953  4a			lsr a
$12:8954  98			tya
$12:8955  cb			wai
$12:8956  39 12 88	  and $8812,y
$12:8959  94 93		 sty $93,x
$12:895b  c1 2b		 cmp ($2b,x)
$12:895d  cc 73 62	  cpy $6273
$12:8960  32 58		 and ($58)
$12:8962  34 10		 bit $10,x
$12:8964  0e 00 a1	  asl $a100
$12:8967  fe 2a 86	  inc $862a,x
$12:896a  0e 2c 1f	  asl $1f2c
$12:896d  c7 fd		 cmp [$fd]
$12:896f  0e 1a 88	  asl $881a
$12:8972  85 72		 sta $72
$12:8974  37 09		 and [$09],y
$12:8976  d1 e9		 cmp ($e9),y
$12:8978  a9 31 18	  lda #$1831
$12:897b  24 53		 bit $53
$12:897d  e5 20		 sbc $20
$12:897f  8c f2 66	  sty $66f2
$12:8982  c3 30		 cmp $30,s
$12:8984  f3 ff		 sbc ($ff,s),y
$12:8986  eb			xba
$12:8987  9f ff 87 ff   sta $ff87ff,x
$12:898b  f7 ff		 sbc [$ff],y
$12:898d  87 ff		 sta [$ff]
$12:898f  e0 c1 f1	  cpx #$f1c1
$12:8992  ed 49 32	  sbc $3249
$12:8995  93 19		 sta ($19,s),y
$12:8997  24 2a		 bit $2a
$12:8999  17 a0		 ora [$a0],y
$12:899b  c2 44		 rep #$44
$12:899d  24 10		 bit $10
$12:899f  5a			phy
$12:89a0  27 2a		 and [$2a]
$12:89a2  85 b5		 sta $b5
$12:89a4  19 87 3b	  ora $3b87,y
$12:89a7  ff f1 55 0f   sbc $0f55f1,x
$12:89ab  3f ff f2 ff   and $fff2ff,x
$12:89af  af 82 11 ff   lda $ff1182
$12:89b3  f9 fc 3c	  sbc $3cfc,y
$12:89b6  d1 eb		 cmp ($eb),y
$12:89b8  cf 9f 8f be   cmp $be8f9f
$12:89bc  8f 79 f9 7c   sta $7cf979
$12:89c0  ce 64 f3	  dec $f364
$12:89c3  f9 e3 87	  sbc $87e3,y
$12:89c6  c0 20 30	  cpy #$3020
$12:89c9  0f 04 02 fd   ora $fd0204
$12:89cd  00 8f		 brk #$8f
$12:89cf  99 02 01	  sta $0102,y
$12:89d2  03 21		 ora $21,s
$12:89d4  0c ff f1	  tsb $f1ff
$12:89d7  63 8f		 adc $8f,s
$12:89d9  e6 33		 inc $33
$12:89db  fc 7f c5	  jsr ($c57f,x)
$12:89de  83 01		 sta $01,s
$12:89e0  3f 9f e0 33   and $33e09f,x
$12:89e4  f6 3f		 inc $3f,x
$12:89e6  07 e0		 ora [$e0]
$12:89e8  1a			inc a
$12:89e9  10 0b		 bpl $89f6
$12:89eb  f9 80 50	  sbc $5080,y
$12:89ee  21 c0		 and ($c0,x)
$12:89f0  80 58		 bra $8a4a
$12:89f2  20 11 c8	  jsr $c811
$12:89f5  07 e2		 ora [$e2]
$12:89f7  7f e6 cc 4f   adc $4fcce6,x
$12:89fb  bf 39 38 7f   lda $7f3839,x
$12:89ff  93 c7		 sta ($c7,s),y
$12:8a01  89 fc 4e	  bit #$4efc
$12:8a04  b8			clv
$12:8a05  fd c9 dc	  sbc $dcc9,x
$12:8a08  fe 01 87	  inc $8701,x
$12:8a0b  37 01		 and [$01],y
$12:8a0d  80 48		 bra $8a57
$12:8a0f  e1 07		 sbc ($07,x)
$12:8a11  20 0c e2	  jsr $e20c
$12:8a14  01 cf		 ora ($cf,x)
$12:8a16  86 5c		 stx $5c
$12:8a18  e9 d6 4f	  sbc #$4fd6
$12:8a1b  1f 66 7d 6e   ora $6e7d66,x
$12:8a1f  f8			sed
$12:8a20  6c e8 74	  jmp ($74e8)
$12:8a23  dc 7d 9b	  jml [$9b7d]
$12:8a26  c3 f4		 cmp $f4,s
$12:8a28  80 6f		 bra $8a99
$12:8a2a  90 c6		 bcc $89f2
$12:8a2c  67 0f		 adc [$0f]
$12:8a2e  e4 03		 cpx $03
$12:8a30  e6 46		 inc $46
$12:8a32  1c 1d ff	  trb $ff1d
$12:8a35  b5 27		 lda $27,x
$12:8a37  be 40 e2	  ldx $e240,y
$12:8a3a  b0 2a		 bcs $8a66
$12:8a3c  1d 03 a5	  ora $a503,x
$12:8a3f  d0 de		 bne $8a1f
$12:8a41  7f 25 bf d3   adc $d3bf25,x
$12:8a45  21 99		 and ($99,x)
$12:8a47  46 81		 lsr $81
$12:8a49  bf e8 4b ff   lda $ff4be8,x
$12:8a4d  90 3f		 bcc $8a8e
$12:8a4f  ec 0b 8f	  cpx $8f0b
$12:8a52  c0 fc fe	  cpy #$fefc
$12:8a55  2f 9f c9 7f   and $7fc99f
$12:8a59  fd 5e 1d	  sbc $1d5e,x
$12:8a5c  59 5e f2	  eor $f25e,y
$12:8a5f  07 2e		 ora [$2e]
$12:8a61  80 ce		 bra $8a31
$12:8a63  3f 10 6f f4   and $f46f10,x
$12:8a67  0d 80 a6	  ora $a680
$12:8a6a  42 e5		 wdm #$e5
$12:8a6c  7f be 78 cd   adc $cd78be,x
$12:8a70  84 03		 sty $03
$12:8a72  8d 29 95	  sta $9529
$12:8a75  64 2c		 stz $2c
$12:8a77  31 cc		 and ($cc),y
$12:8a79  85 a6		 sta $a6
$12:8a7b  2d e5 80	  and $80e5
$12:8a7e  b0 0e		 bcs $8a8e
$12:8a80  21 ff		 and ($ff,x)
$12:8a82  bf 87 c0 10   lda $10c087,x
$12:8a86  3f bf fe d7   and $d7febf,x
$12:8a8a  97 89		 sta [$89],y
$12:8a8c  92 69		 sta ($69)
$12:8a8e  61 55		 adc ($55,x)
$12:8a90  28			plp
$12:8a91  66 d6		 ror $d6
$12:8a93  55 2b		 eor $2b,x
$12:8a95  88			dey
$12:8a96  61 a7		 adc ($a7,x)
$12:8a98  5a			phy
$12:8a99  4a			lsr a
$12:8a9a  c3 b4		 cmp $b4,s
$12:8a9c  23 1f		 and $1f,s
$12:8a9e  fb			xce
$12:8a9f  e0 20 7b	  cpx #$7b20
$12:8aa2  e0 81 fe	  cpx #$fe81
$12:8aa5  82 06 97	  brl $21ae
$12:8aa8  ce db 5e	  dec $5edb
$12:8aab  a7 70		 lda [$70]
$12:8aad  89 3f 4a	  bit #$4a3f
$12:8ab0  53 61		 eor ($61,s),y
$12:8ab2  cf c0 ec d1   cmp $d1ecc0
$12:8ab6  8c 4d da	  sty $da4d
$12:8ab9  63 ff		 adc $ff,s
$12:8abb  7f 84 13 ff   adc $ff1384,x
$12:8abf  0c ff e7	  tsb $e7ff
$12:8ac2  bf ff c0 41   lda $41c0ff,x
$12:8ac6  cd 60 f9	  cmp $f960
$12:8ac9  5c c4 87 89   jml $8987c4
$12:8acd  2b			pld
$12:8ace  8c 51 be	  sty $be51
$12:8ad1  36 8b		 rol $8b,x
$12:8ad3  1c d2 17	  trb $17d2
$12:8ad6  69 cb 7e	  adc #$7ecb
$12:8ad9  3f f6 0f fb   and $fb0ff6,x
$12:8add  8c 20 ff	  sty $ff20
$12:8ae0  f8			sed
$12:8ae1  7f ff 3e 08   adc $083eff,x
$12:8ae5  3a			dec a
$12:8ae6  f4 02 d3	  pea $d302
$12:8ae9  e1 97		 sbc ($97,x)
$12:8aeb  e7 31		 sbc [$31]
$12:8aed  b2 3d		 lda ($3d)
$12:8aef  5d 3f 17	  eor $173f,x
$12:8af2  33 b4		 and ($b4,s),y
$12:8af4  64 24		 stz $24
$12:8af6  dd 81 68	  cmp $6881,x
$12:8af9  47 9d		 eor [$9d]
$12:8afb  83 c0		 sta $c0,s
$12:8afd  ff fc 09 0b   sbc $0b09fc,x
$12:8b01  3e 80 55	  rol $5580,x
$12:8b04  7e 3b 9d	  ror $9d3b,x
$12:8b07  35 22		 and $22,x
$12:8b09  21 37		 and ($37,x)
$12:8b0b  a4 6b		 ldy $6b
$12:8b0d  ea			nop
$12:8b0e  f1 6f		 sbc ($6f),y
$12:8b10  45 57		 eor $57
$12:8b12  40			rti
$12:8b13  2d 08 73	  and $7308
$12:8b16  18			clc
$12:8b17  3f fe 04 30   and $3004fe,x
$12:8b1b  97 c0		 sta [$c0],y
$12:8b1d  10 52		 bpl $8b71
$12:8b1f  b8			clv
$12:8b20  e4 a7		 cpx $a7
$12:8b22  25 85		 and $85
$12:8b24  80 71		 bra $8b97
$12:8b26  3f 96 9c 3e   and $3e9c96,x
$12:8b2a  12 11		 ora ($11)
$12:8b2c  19 82 53	  ora $5382,y
$12:8b2f  24 01		 bit $01
$12:8b31  f0 11		 beq $8b44
$12:8b33  87 f8		 sta [$f8]
$12:8b35  c4 2e		 cpy $2e
$12:8b37  b2 71		 lda ($71)
$12:8b39  84 7f		 sty $7f
$12:8b3b  ff aa 8e d5   sbc $d58eaa,x
$12:8b3f  25 56		 and $56
$12:8b41  3e 04 93	  rol $9304,x
$12:8b44  79 c8 f3	  adc $f3c8,y
$12:8b47  e5 69		 sbc $69
$12:8b49  1c 28 04	  trb $0428
$12:8b4c  9b			txy
$12:8b4d  1c 1f 08	  trb $081f
$12:8b50  ef fe 7f ff   sbc $ff7ffe
$12:8b54  a1 a0		 lda ($a0,x)
$12:8b56  86 7c		 stx $7c
$12:8b58  08			php
$12:8b59  1b			tcs
$12:8b5a  8f fe 55 94   sta $9455fe
$12:8b5e  e2 c0		 sep #$c0
$12:8b60  a1 13		 lda ($13,x)
$12:8b62  89 4f 1f	  bit #$1f4f
$12:8b65  87 30		 sta [$30]
$12:8b67  8a			txa
$12:8b68  62 f9 78	  per $0464
$12:8b6b  09 45 02	  ora #$0245
$12:8b6e  f0 28		 beq $8b98
$12:8b70  1e 3b 18	  asl $183b,x
$12:8b73  c3 e0		 cmp $e0,s
$12:8b75  65 03		 adc $03
$12:8b77  48			pha
$12:8b78  6d 61 54	  adc $5461
$12:8b7b  dc 87 42	  jml [$4287]
$12:8b7e  45 24		 eor $24
$12:8b80  88			dey
$12:8b81  42 fc		 wdm #$fc
$12:8b83  d6 ac		 dec $ac,x
$12:8b85  a5 13		 lda $13
$12:8b87  31 22		 and ($22),y
$12:8b89  8a			txa
$12:8b8a  31 cb		 and ($cb),y
$12:8b8c  83 ff		 sta $ff,s
$12:8b8e  f1 ff		 sbc ($ff),y
$12:8b90  e2 08		 sep #$08
$12:8b92  21 52		 and ($52,x)
$12:8b94  81 7c		 sta ($7c,x)
$12:8b96  38			sec
$12:8b97  33 99		 and ($99,s),y
$12:8b99  64 3f		 stz $3f
$12:8b9b  6f b8 9f 79   adc $799fb8
$12:8b9f  f8			sed
$12:8ba0  f3 eb		 sbc ($eb,s),y
$12:8ba2  e6 0e		 inc $0e
$12:8ba4  67 3e		 adc [$3e]
$12:8ba6  c7 fc		 cmp [$fc]
$12:8ba8  7f d0 0f 84   adc $840fd0,x
$12:8bac  02 81		 cop #$81
$12:8bae  00 83		 brk #$83
$12:8bb0  c0 20 30	  cpy #$3020
$12:8bb3  0f 04 01 b6   ora $b60104
$12:8bb7  04 70		 tsb $70
$12:8bb9  d9 f3 ff	  cmp $fff3,y
$12:8bbc  d1 92		 cmp ($92),y
$12:8bbe  80 e1		 bra $8ba1
$12:8bc0  fc 70 0d	  jsr ($0d70,x)
$12:8bc3  e3 58		 sbc $58,s
$12:8bc5  27 ff		 and [$ff]
$12:8bc7  9f 3c 02 01   sta $01023c,x
$12:8bcb  18			clc
$12:8bcc  80 0f		 bra $8bdd
$12:8bce  c1 8c		 cmp ($8c,x)
$12:8bd0  54 32 f8	  mvn $f8,$32
$12:8bd3  12 06		 ora ($06)
$12:8bd5  67 0e		 adc [$0e]
$12:8bd7  9e 70 f7	  stz $f770,x
$12:8bda  f7 8f		 sbc [$8f],y
$12:8bdc  ce 05 82	  dec $8205
$12:8bdf  19 3b e5	  ora $e53b,y
$12:8be2  9e 3d 9c	  stz $9c3d,x
$12:8be5  c7 8f		 cmp [$8f]
$12:8be7  c2 1f		 rep #$1f
$12:8be9  00 9f		 brk #$9f
$12:8beb  c0 33 d0	  cpy #$d033
$12:8bee  0e 01 00	  asl $0001
$12:8bf1  47 e1		 eor [$e1]
$12:8bf3  7f 80 66 6f   adc $6f6680,x
$12:8bf7  1e 2e 1c	  asl $1c2e,x
$12:8bfa  ce 79 9b	  dec $9b79
$12:8bfd  f3 8e		 sbc ($8e,s),y
$12:8bff  42 e7		 wdm #$e7
$12:8c01  f0 c6		 beq $8bc9
$12:8c03  5f 3f 1c 02   eor $021c3f,x
$12:8c07  28			plp
$12:8c08  77 10		 adc [$10],y
$12:8c0a  c2 45		 rep #$45
$12:8c0c  08			php
$12:8c0d  fa			plx
$12:8c0e  00 60		 brk #$60
$12:8c10  70 0e		 bvs $8c20
$12:8c12  fc 03 0f	  jsr ($0f03,x)
$12:8c15  7f e8 cb ef   adc $efcbe8,x
$12:8c19  10 78		 bpl $8c93
$12:8c1b  f4 07 17	  pea $1707
$12:8c1e  80 e0		 bra $8c00
$12:8c20  f0 3e		 beq $8c60
$12:8c22  9f 4d f7 f8   sta $f8f74d,x
$12:8c26  08			php
$12:8c27  a8			tay
$12:8c28  c1 41		 cmp ($41,x)
$12:8c2a  84 2c		 sty $2c
$12:8c2c  8c 34 5a	  sty $5a34
$12:8c2f  07 47		 ora [$47]
$12:8c31  a1 b8		 lda ($b8,x)
$12:8c33  fc 47 bf	  jsr ($bf47,x)
$12:8c36  d4 7d		 pei ($7d)
$12:8c38  fa			plx
$12:8c39  c4 37		 cpy $37
$12:8c3b  10 79		 bpl $8cb6
$12:8c3d  74 06		 stz $06,x
$12:8c3f  81 bf		 sta ($bf,x)
$12:8c41  e8			inx
$12:8c42  4b			phk
$12:8c43  ff 10 7f f4   sbc $f47f10,x
$12:8c47  05 7e		 ora $7e
$12:8c49  db			stp
$12:8c4a  9a			txs
$12:8c4b  d6 d7		 dec $d7,x
$12:8c4d  61 ca		 adc ($ca,x)
$12:8c4f  fc 79 a3	  jsr ($a379,x)
$12:8c52  f9 78 47	  sbc $4778,y
$12:8c55  02 03		 cop #$03
$12:8c57  51 c1		 eor ($c1),y
$12:8c59  7d f8 9e	  adc $9ef8,x
$12:8c5c  7f fd 3f ff   adc $ff3ffd,x
$12:8c60  07 73		 ora [$73]
$12:8c62  9e 03 ff	  stz $ff03,x
$12:8c65  e1 ff		 sbc ($ff,x)
$12:8c67  fe ff f0	  inc $f0ff,x
$12:8c6a  bf 9d ab 1b   lda $1bab9d,x
$12:8c6e  68			pla
$12:8c6f  ba			tsx
$12:8c70  d6 f4		 dec $f4,x
$12:8c72  32 6c		 and ($6c)
$12:8c74  3f 5a 07 01   and $01075a,x
$12:8c78  9b			txy
$12:8c79  4d ad bf	  eor $bfad
$12:8c7c  cf ff cf ff   cmp $ffcfff
$12:8c80  8f ff c7 ff   sta $ffc7ff
$12:8c84  f7 bf		 sbc [$bf],y
$12:8c86  f8			sed
$12:8c87  a1 26		 lda ($26,x)
$12:8c89  90 bf		 bcc $8c4a
$12:8c8b  37 82		 and [$82],y
$12:8c8d  5b			tcd
$12:8c8e  9d c5 d8	  sta $d8c5,x
$12:8c91  3a			dec a
$12:8c92  5b			tcd
$12:8c93  8f 46 7a d5   sta $d57a46
$12:8c97  df da fb c5   cmp $c5fbda,x
$12:8c9b  00 25		 brk #$25
$12:8c9d  0e 17 ff	  asl $ff17
$12:8ca0  e1 ff		 sbc ($ff,x)
$12:8ca2  0f 80 a1 30   ora $30a180
$12:8ca6  73 cf		 adc ($cf,s),y
$12:8ca8  b7 0f		 lda [$0f],y
$12:8caa  4c d3 08	  jmp $08d3
$12:8cad  04 8e		 tsb $8e
$12:8caf  03 96		 ora $96,s
$12:8cb1  88			dey
$12:8cb2  6c 60 13	  jmp ($1360)
$12:8cb5  ae 08 a0	  ldx $a008
$12:8cb8  27 9f		 and [$9f]
$12:8cba  fa			plx
$12:8cbb  00 10		 brk #$10
$12:8cbd  e2 7e		 sep #$7e
$12:8cbf  fe 78 a0	  inc $a078,x
$12:8cc2  68			pla
$12:8cc3  f3 8d		 sbc ($8d,s),y
$12:8cc5  66 4f		 ror $4f
$12:8cc7  5d 61 ca	  eor $ca61,x
$12:8cca  c3 34		 cmp $34,s
$12:8ccc  b6 3a		 ldx $3a,y
$12:8cce  4f 83 f5 70   eor $70f583
$12:8cd2  9d 11 c6	  sta $c611,x
$12:8cd5  fe 24 18	  inc $1824,x
$12:8cd8  1f ff 80 44   ora $4480ff,x
$12:8cdc  5c 25 ef 47   jml $47ef25
$12:8ce0  5c ad 68 f8   jml $f868ad
$12:8ce4  70 4a		 bvs $8d30
$12:8ce6  8d 83 05	  sta $0583
$12:8ce9  01 88		 ora ($88,x)
$12:8ceb  c0 fe		 cpy #$fe
$12:8ced  32 31		 and ($31)
$12:8cef  41 07		 eor ($07,x)
$12:8cf1  c3 f0		 cmp $f0,s
$12:8cf3  4e 00 10	  lsr $1000
$12:8cf6  c3 c4		 cmp $c4,s
$12:8cf8  83 a4		 sta $a4,s
$12:8cfa  a3 cf		 lda $cf,s
$12:8cfc  36 12		 rol $12,x
$12:8cfe  2c ec 97	  bit $97ec
$12:8d01  31 42		 and ($42),y
$12:8d03  c0 c2		 cpy #$c2
$12:8d05  26 92		 rol $92
$12:8d07  ce 9f 0e	  dec $0e9f
$12:8d0a  01 38		 ora ($38,x)
$12:8d0c  31 1d		 and ($1d),y
$12:8d0e  f8			sed
$12:8d0f  50 3c		 bvc $8d4d
$12:8d11  30 21		 bmi $8d34
$12:8d13  c2 7a		 rep #$7a
$12:8d15  f1 4d		 sbc ($4d),y
$12:8d17  15 17		 ora $17,x
$12:8d19  01 99		 ora ($99,x)
$12:8d1b  82 51 b2	  brl $3f6f
$12:8d1e  19 4b 3c	  ora $3c4b,y
$12:8d21  0e b9 10	  asl $10b9
$12:8d24  e4 c8		 cpx $c8
$12:8d26  0c 46 85	  tsb $8546
$12:8d29  05 58		 ora $58
$12:8d2b  66 3f		 ror $3f
$12:8d2d  fa			plx
$12:8d2e  0f fc 1b ff   ora $ff1bfc
$12:8d32  aa			tax
$12:8d33  e6 62		 inc $62
$12:8d35  6a			ror a
$12:8d36  da			phx
$12:8d37  2a			rol a
$12:8d38  0d 17 15	  ora $1517
$12:8d3b  28			plp
$12:8d3c  89 49 fc	  bit #$fc49
$12:8d3f  12 18		 ora ($18)
$12:8d41  ce 66 0d	  dec $0d66
$12:8d44  30 ff		 bmi $8d45
$12:8d46  b7 c0		 lda [$c0],y
$12:8d48  ca			dex
$12:8d49  04 50		 tsb $50
$12:8d4b  fe 89 05	  inc $0589,x
$12:8d4e  da			phx
$12:8d4f  06 50		 asl $50
$12:8d51  d6 58		 dec $58,x
$12:8d53  64 91		 stz $91
$12:8d55  ca			dex
$12:8d56  66 0f		 ror $0f
$12:8d58  29 49 79	  and #$7949
$12:8d5b  84 8a		 sty $8a
$12:8d5d  75 66		 adc $66,x
$12:8d5f  c0 c7 20	  cpy #$20c7
$12:8d62  11 e4		 ora ($e4),y
$12:8d64  20 99 42	  jsr $4299
$12:8d67  7c 7f 0f	  jmp ($0f7f,x)
$12:8d6a  ff 14 c8 77   sbc $77c814,x
$12:8d6e  ec 7f 8e	  cpx $8e7f
$12:8d71  f9 df f1	  sbc $f1df,y
$12:8d74  cc 3e 15	  cpy $153e
$12:8d77  ba			tsx
$12:8d78  3e ce e1	  rol $e1ce,x
$12:8d7b  ec c8 4d	  cpx $4dc8
$12:8d7e  bc f0 f8	  ldy $f8f0,x
$12:8d81  05 fe		 ora $fe
$12:8d83  01 fc		 ora ($fc,x)
$12:8d85  32 8e		 and ($8e)
$12:8d87  fe 00 3f	  inc $3f00,x
$12:8d8a  0c 7c 03	  tsb $037c
$12:8d8d  f1 00		 sbc ($00),y
$12:8d8f  bf 62 6c f1   lda $f16c62,x
$12:8d93  ec 66 0e	  cpx $0e66
$12:8d96  63 70		 adc $70,s
$12:8d98  e1 cc		 sbc ($cc,x)
$12:8d9a  f3 31		 sbc ($31,s),y
$12:8d9c  ee 7f c6	  inc $c67f
$12:8d9f  6d c1 26	  adc $26c1
$12:8da2  87 f8		 sta [$f8]
$12:8da4  80 24		 bra $8dca
$12:8da6  b0 86		 bcs $8d2e
$12:8da8  40			rti
$12:8da9  3c 10 08	  bit $0810,x
$12:8dac  09 20 6e	  ora #$6e20
$12:8daf  7f cc e5 c3   adc $c3e5cc,x
$12:8db3  f3 c7		 sbc ($c7,s),y
$12:8db5  d3 ce		 cmp ($ce,s),y
$12:8db7  a7 3c		 lda [$3c]
$12:8db9  7c 0d 07	  jmp ($070d,x)
$12:8dbc  99 2f bc	  sta $bc2f,y
$12:8dbf  79 a7 e4	  adc $e4a7,y
$12:8dc2  81 e0		 sta ($e0,x)
$12:8dc4  40			rti
$12:8dc5  38			sec
$12:8dc6  50 08		 bvc $8dd0
$12:8dc8  fc 02 7d	  jsr ($7d02,x)
$12:8dcb  00 88		 brk #$88
$12:8dcd  40			rti
$12:8dce  3c 24 60	  bit $6024,x
$12:8dd1  b9 f3 e7	  lda $e7f3,y
$12:8dd4  f9 cc 1e	  sbc $1ecc,y
$12:8dd7  82 c1 1e	  brl $ac9b
$12:8dda  8f f1 3f 7c   sta $7c3ff1
$12:8dde  f9 f4 e6	  sbc $e6f4,y
$12:8de1  0f f0 65 89   ora $8965f0
$12:8de5  04 10		 tsb $10
$12:8de7  e0 69 05	  cpx #$0569
$12:8dea  40			rti
$12:8deb  18			clc
$12:8dec  41 94		 eor ($94,x)
$12:8dee  00 90		 brk #$90
$12:8df0  a2 ef fc	  ldx #$fcef
$12:8df3  11 f9		 ora ($f9),y
$12:8df5  b4 27		 ldy $27,x
$12:8df7  1f 80 ec f6   ora $f6ec80,x
$12:8dfb  2f 1f 89 38   and $38891f
$12:8dff  08			php
$12:8e00  17 e7		 ora [$e7],y
$12:8e02  c0 e0 5c	  cpy #$5ce0
$12:8e05  3e 12 6f	  rol $6f12,x
$12:8e08  f4 1c 04	  pea $041c
$12:8e0b  34 ba		 bit $ba,x
$12:8e0d  05 c6		 ora $c6
$12:8e0f  e1 f4		 sbc ($f4,x)
$12:8e11  fa			plx
$12:8e12  67 bf		 adc [$bf]
$12:8e14  d0 ff		 bne $8e15
$12:8e16  ff a6 3f 18   sbc $183fa6,x
$12:8e1a  83 d3		 sta $d3,s
$12:8e1c  a8			tay
$12:8e1d  24 70		 bit $70
$12:8e1f  25 84		 and $84
$12:8e21  2c d4 2b	  bit $2bd4
$12:8e24  f2 f0		 sbc ($f0)
$12:8e26  78			sei
$12:8e27  36 1f		 rol $1f,x
$12:8e29  0f 07 9a c7   ora $c79a07
$12:8e2d  dc ac 7f	  jml [$7fac]
$12:8e30  77 57		 adc [$57],y
$12:8e32  dd af ee	  cmp $eeaf,x
$12:8e35  df ff fd 7f   cmp $7ffdff,x
$12:8e39  fa			plx
$12:8e3a  af b0 7f ed   lda $ed7fb0
$12:8e3e  a7 ff		 lda [$ff]
$12:8e40  b7 fd		 lda [$fd],y
$12:8e42  d9 be 7d	  cmp $7dbe,y
$12:8e45  3f 3e bf 8f   and $8fbf3e,x
$12:8e49  4b			phk
$12:8e4a  c3 ed		 cmp $ed,s
$12:8e4c  26 72		 rol $72
$12:8e4e  5b			tcd
$12:8e4f  e0 30 43	  cpx #$4330
$12:8e52  ef cf ff e0   sbc $e0ffcf
$12:8e56  ff fb bf be   sbc $bebffb,x
$12:8e5a  6f ff dd ff   adc $ffddff
$12:8e5e  be 42 fe	  ldx $fe42,y
$12:8e61  2e 0f ff	  rol $ff0f
$12:8e64  7b			tdc
$12:8e65  ff 7d 0f d0   sbc $d00f7d,x
$12:8e69  7c fa 3e	  jmp ($3efa,x)
$12:8e6c  3c bf 87	  bit $87bf,x
$12:8e6f  b1 e7		 lda ($e7),y
$12:8e71  cb			wai
$12:8e72  7b			tdc
$12:8e73  eb			xba
$12:8e74  3b			tsc
$12:8e75  f8			sed
$12:8e76  57 c7		 eor [$c7],y
$12:8e78  45 ce		 eor $ce
$12:8e7a  a5 64		 lda $64
$12:8e7c  43 f5		 eor $f5,s
$12:8e7e  f1 ff		 sbc ($ff),y
$12:8e80  f8			sed
$12:8e81  07 81		 ora [$81]
$12:8e83  be cb ff	  ldx $ffcb,y
$12:8e86  fd 7f ff	  sbc $ff7f,x
$12:8e89  c7 fe		 cmp [$fe]
$12:8e8b  dd ff cb	  cmp $cbff,x
$12:8e8e  fb			xce
$12:8e8f  fd 91 fd	  sbc $fd91,x
$12:8e92  16 70		 asl $70,x
$12:8e94  7d 83 70	  adc $7083,x
$12:8e97  9b			txy
$12:8e98  46 68		 lsr $68
$12:8e9a  b3 89		 lda ($89,s),y
$12:8e9c  af 3b 9d 97   lda $979d3b
$12:8ea0  89 e7 fd	  bit #$fde7
$12:8ea3  b5 f8		 lda $f8,x
$12:8ea5  bc ff db	  ldy $dbff,x
$12:8ea8  9f 0f c6 fd   sta $fdc60f,x
$12:8eac  14 76		 trb $76
$12:8eae  c8			iny
$12:8eaf  07 5a		 ora [$5a]
$12:8eb1  13 21		 ora ($21,s),y
$12:8eb3  86 46		 stx $46
$12:8eb5  b8			clv
$12:8eb6  1c 29 9c	  trb $9c29
$12:8eb9  5e 19 29	  lsr $2919,x
$12:8ebc  ab			plb
$12:8ebd  6a			ror a
$12:8ebe  ac 98 03	  ldy $0398
$12:8ec1  60			rts
$12:8ec2  fc ff f3	  jsr ($f3ff,x)
$12:8ec5  ff fc 33 ff   sbc $ff33fc,x
$12:8ec9  00 ff		 brk #$ff
$12:8ecb  af c2 3f ff   lda $ff3fc2
$12:8ecf  c6 d0		 dec $d0
$12:8ed1  aa			tax
$12:8ed2  92 0c		 sta ($0c)
$12:8ed4  4c 3e 9d	  jmp $9d3e
$12:8ed7  71 b2		 adc ($b2),y
$12:8ed9  60			rts
$12:8eda  aa			tax
$12:8edb  10 bf		 bpl $8e9c
$12:8edd  5d 9b 4f	  eor $4f9b,x
$12:8ee0  98			tya
$12:8ee1  62 81 34	  per $c365
$12:8ee4  3e 0c a1	  rol $a10c,x
$12:8ee7  64 84		 stz $84
$12:8ee9  11 98		 ora ($98),y
$12:8eeb  23 70		 and $70,s
$12:8eed  92 50		 sta ($50)
$12:8eef  fa			plx
$12:8ef0  32 c9		 and ($c9)
$12:8ef2  24 42		 bit $42
$12:8ef4  85 c3		 sta $c3
$12:8ef6  c2 5a		 rep #$5a
$12:8ef8  34 51		 bit $51,x
$12:8efa  1b			tcs
$12:8efb  5d 1a ad	  eor $ad1a,x
$12:8efe  8c 5f 87	  sty $875f
$12:8f01  0f ff ef ff   ora $ffefff
$12:8f05  cf 3f f1 06   cmp $06f13f
$12:8f09  40			rti
$12:8f0a  e0 7f fe	  cpx #$fe7f
$12:8f0d  3f fd 8b 33   and $338bfd,x
$12:8f11  0c b0 59	  tsb $59b0
$12:8f14  20 f8 5c	  jsr $5cf8
$12:8f17  c6 42		 dec $42
$12:8f19  c1 55		 cmp ($55,x)
$12:8f1b  93 53		 sta ($53,s),y
$12:8f1d  70 15		 bvs $8f34
$12:8f1f  2b			pld
$12:8f20  84 1f		 sty $1f
$12:8f22  fe 9e 03	  inc $039e,x
$12:8f25  a8			tay
$12:8f26  58			cli
$12:8f27  19 02 75	  ora $7502,y
$12:8f2a  02 68		 cop #$68
$12:8f2c  63 ff		 adc $ff,s
$12:8f2e  fb			xce
$12:8f2f  8a			txa
$12:8f30  3f f6 05 d7   and $d705f6,x
$12:8f34  80 40		 bra $8f76
$12:8f36  a0 15 0a	  ldy #$0a15
$12:8f39  87 f7		 sta [$f7]
$12:8f3b  fb			xce
$12:8f3c  af ff c1 59   lda $59c1ff
$12:8f40  02 3f		 cop #$3f
$12:8f42  4a			lsr a
$12:8f43  86 bc		 stx $bc
$12:8f45  62 03 e2	  per $714b
$12:8f48  93 82		 sta ($82,s),y
$12:8f4a  82 ff 94	  brl $244c
$12:8f4d  b5 ff		 lda $ff,x
$12:8f4f  a0 3a f8	  ldy #$f83a
$12:8f52  04 14		 tsb $14
$12:8f54  6c 3f af	  jmp ($af3f)
$12:8f57  d0 fd		 bne $8f56
$12:8f59  88			dey
$12:8f5a  69 fa 82	  adc #$82fa
$12:8f5d  f6 3b		 inc $3b,x
$12:8f5f  1f bf dd bf   ora $bfddbf,x
$12:8f63  fe 4a 0d	  inc $0d4a,x
$12:8f66  45 5c		 eor $5c
$12:8f68  62 84 f0	  per $7fef
$12:8f6b  74 81		 stz $81,x
$12:8f6d  7e a1 f0	  ror $f0a1,x
$12:8f70  0a			asl a
$12:8f71  2d 03 f1	  and $f103
$12:8f74  f8			sed
$12:8f75  56 81		 lsr $81,x
$12:8f77  3c 20 3f	  bit $3f20,x
$12:8f7a  f2 99		 sbc ($99)
$12:8f7c  7c 3e 1b	  jmp ($1b3e,x)
$12:8f7f  af d0 7c 0b   lda $0b7cd0
$12:8f83  f1 02		 sbc ($02),y
$12:8f85  fe d9 f3	  inc $f3d9,x
$12:8f88  1d d8 04	  ora $04d8,x
$12:8f8b  22 11 db ed   jsl $eddb11
$12:8f8f  fd ff fa	  sbc $faff,x
$12:8f92  2f fc 23 ef   and $ef23fc
$12:8f96  00 5f		 brk #$5f
$12:8f98  8c 8a 44	  sty $448a
$12:8f9b  b9 09 21	  lda $2109,y
$12:8f9e  10 59		 bpl $8ff9
$12:8fa0  25 2a		 and $2a
$12:8fa2  ea			nop
$12:8fa3  f7 cb		 sbc [$cb],y
$12:8fa5  03 48		 ora $48,s
$12:8fa7  a4 0a		 ldy $0a
$12:8fa9  c2 ef		 rep #$ef
$12:8fab  ff 90 ff f0   sbc $f0ff90,x
$12:8faf  97 b5		 sta [$b5],y
$12:8fb1  f8			sed
$12:8fb2  48			pha
$12:8fb3  24 05		 bit $05
$12:8fb5  d0 db		 bne $8f92
$12:8fb7  b2 14		 lda ($14)
$12:8fb9  8a			txa
$12:8fba  1a			inc a
$12:8fbb  af a6 6f c7   lda $c76fa6
$12:8fbf  6d c7 5b	  adc $5bc7
$12:8fc2  2e 1b 0e	  rol $0e1b
$12:8fc5  07 06		 ora [$06]
$12:8fc7  03 0a		 ora $0a,s
$12:8fc9  85 ca		 sta $ca
$12:8fcb  e7 62		 sbc [$62]
$12:8fcd  b0 fe		 bcs $8fcd
$12:8fcf  7f fe 1f fc   adc $fc1ffe,x
$12:8fd3  01 10		 ora ($10,x)
$12:8fd5  60			rts
$12:8fd6  3f e8 5f d2   and $d25fe8,x
$12:8fda  77 c4		 adc [$c4],y
$12:8fdc  ed 79 ad	  sbc $ad79
$12:8fdf  b8			clv
$12:8fe0  3c 5c 12	  bit $125c,x
$12:8fe3  a9 50 d1	  lda #$d150
$12:8fe6  78			sei
$12:8fe7  21 1e		 and ($1e,x)
$12:8fe9  8e 86 c2	  stx $c286
$12:8fec  61 f0		 adc ($f0,x)
$12:8fee  4c 83 24	  jmp $2483
$12:8ff1  aa			tax
$12:8ff2  1a			inc a
$12:8ff3  ff 04 7f d1   sbc $d17f04,x
$12:8ff7  17 f8		 ora [$f8],y
$12:8ff9  43 c5		 eor $c5,s
$12:8ffb  61 99		 adc ($99,x)
$12:8ffd  bf 69 73 36   lda $367369,x
$12:9001  5f 37 6a 79   eor $796a37,x
$12:9005  38			sec
$12:9006  80 41		 bra $9049
$12:9008  20 95 9a	  jsr $9a95
$12:900b  cd 8e e6	  cmp $e68e
$12:900e  d7 0b		 cmp [$0b],y
$12:9010  f7 fe		 sbc [$fe],y
$12:9012  30 c8		 bmi $8fdc
$12:9014  38			sec
$12:9015  27 ee		 and [$ee]
$12:9017  b3 a6		 lda ($a6,s),y
$12:9019  b9 e3 24	  lda $24e3,y
$12:901c  d4 4a		 pei ($4a)
$12:901e  46 23		 lsr $23
$12:9020  6b			rtl
$12:9021  3c aa 57	  bit $57aa,x
$12:9024  36 5f		 rol $5f,x
$12:9026  af 66 f2 b9   lda $b9f266
$12:902a  dc b9 7c	  jml [$7cb9]
$12:902d  b0 9f		 bcs $8fce
$12:902f  b5 e8		 lda $e8,x
$12:9031  4f 38 75 cd   eor $cd7538
$12:9035  1f ea 0b fc   ora $fc0bea,x
$12:9039  81 f7		 sta ($f7,x)
$12:903b  24 7f		 bit $7f
$12:903d  28			plp
$12:903e  6e b6 c3	  ror $c3b6
$12:9041  2b			pld
$12:9042  8d c6 60	  sta $60c6
$12:9045  d5 6a		 cmp $6a,x
$12:9047  06 8e		 asl $8e
$12:9049  47 06		 eor [$06]
$12:904b  83 c5		 sta $c5,s
$12:904d  62 f0 e8	  per $7940
$12:9050  74 78		 stz $78,x
$12:9052  90 02		 bcc $9056
$12:9054  21 a0		 and ($a0,x)
$12:9056  6f e4 7d c8   adc $c87de4
$12:905a  3f e2 2f e8   and $e82fe2,x
$12:905e  87 7c		 sta [$7c]
$12:9060  62 d4 fa	  per $8b37
$12:9063  ae ce 25	  ldx $25ce
$12:9066  09 d5 61	  ora #$61d5
$12:9069  b2 d9		 lda ($d9)
$12:906b  1c ce 60	  trb $60ce
$12:906e  72 0c		 adc ($0c)
$12:9070  10 df		 bpl $9051
$12:9072  ff e1 ff f8   sbc $f8ffe1,x
$12:9076  3f ff 03 7f   and $7f03ff,x
$12:907a  c8			iny
$12:907b  5b			tcd
$12:907c  f3 16		 sbc ($16,s),y
$12:907e  72 48		 adc ($48)
$12:9080  08			php
$12:9081  c3 5b		 cmp $5b,s
$12:9083  93 94		 sta ($94,s),y
$12:9085  d2 36		 cmp ($36)
$12:9087  f2 3e		 sbc ($3e)
$12:9089  5e 72 59	  lsr $5972,x
$12:908c  42 98		 wdm #$98
$12:908e  69 6a 56	  adc #$566a
$12:9091  8a			txa
$12:9092  9f 9a ff ff   sta $ffff9a,x
$12:9096  fb			xce
$12:9097  ff f8 02 21   sbc $2102f8,x
$12:909b  98			tya
$12:909c  ff e8 7f fc   sbc $fc7fe8,x
$12:90a0  3f ff f1 ff   and $fff1ff,x
$12:90a4  b7 63		 lda [$63],y
$12:90a6  a7 33		 lda [$33]
$12:90a8  0e 14 92	  asl $9214
$12:90ab  93 3d		 sta ($3d,s),y
$12:90ad  de d0 b3	  dec $b3d0,x
$12:90b0  51 9a		 eor ($9a),y
$12:90b2  ae 32 d5	  ldx $d532
$12:90b5  24 f8		 bit $f8
$12:90b7  b0 84		 bcs $903d
$12:90b9  86 1f		 stx $1f
$12:90bb  e7 f8		 sbc [$f8]
$12:90bd  7f fc ff f8   adc $f8fffc,x
$12:90c1  1f fe 3f ff   ora $ff3ffe,x
$12:90c5  ac c8 7a	  ldy $7ac8
$12:90c8  b4 69		 ldy $69,x
$12:90ca  94 52		 sty $52,x
$12:90cc  13 98		 ora ($98,s),y
$12:90ce  a2 58 f5	  ldx #$f558
$12:90d1  71 cd		 adc ($cd),y
$12:90d3  2d 1a ed	  and $ed1a
$12:90d6  78			sei
$12:90d7  72 84		 adc ($84)
$12:90d9  e3 ff		 sbc $ff,s
$12:90db  08			php
$12:90dc  51 0e		 eor ($0e),y
$12:90de  7d cc 2c	  adc $2ccc,x
$12:90e1  d0 c0		 bne $90a3
$12:90e3  7f ec 19 99   adc $9919ec,x
$12:90e7  45 1f		 eor $1f
$12:90e9  29 08 a8	  and #$a808
$12:90ec  d8			cld
$12:90ed  b4 3c		 ldy $3c,x
$12:90ef  ce 8c eb	  dec $eb8c
$12:90f2  35 84		 and $84,x
$12:90f4  e8			inx
$12:90f5  cc 20 c8	  cpy $c820
$12:90f8  21 80		 and ($80,x)
$12:90fa  83 07		 sta $07,s
$12:90fc  e1 ff		 sbc ($ff,x)
$12:90fe  fe 7f d7	  inc $d77f,x
$12:9101  e0 a1 0d	  cpx #$0da1
$12:9104  85 3c		 sta $3c
$12:9106  ce 15 f8	  dec $f815
$12:9109  04 16		 tsb $16
$12:910b  01 a0		 ora ($a0,x)
$12:910d  d0 7d		 bne $918c
$12:910f  3e 8e 70	  rol $708e,x
$12:9112  d6 b9		 dec $b9,x
$12:9114  c1 06		 cmp ($06,x)
$12:9116  04 03		 tsb $03
$12:9118  19 84 2d	  ora $2d84,y
$12:911b  3a			dec a
$12:911c  04 a1		 tsb $a1
$12:911e  cf 7f a0 bf   cmp $bfa07f
$12:9122  fa			plx
$12:9123  86 bf		 stx $bf
$12:9125  f7 04		 sbc [$04],y
$12:9127  c7 c0		 cmp [$c0]
$12:9129  25 32		 and $32
$12:912b  0b			phd
$12:912c  85 c3		 sta $c3
$12:912e  ed f6 ff	  sbc $fff6
$12:9131  08			php
$12:9132  c0 80 bd	  cpy #$bd80
$12:9135  f8			sed
$12:9136  01 5c		 ora ($5c,x)
$12:9138  21 30		 and ($30,x)
$12:913a  0a			asl a
$12:913b  85 43		 sta $43
$12:913d  fb			xce
$12:913e  fd d7 ff	  sbc $ffd7,x
$12:9141  ca			dex
$12:9142  20 2f 43	  jsr $432f
$12:9145  68			pla
$12:9146  eb			xba
$12:9147  ff b0 21 fb   sbc $fb21b0,x
$12:914b  0f cb 5e 34   ora $345ecb
$12:914f  13 78		 ora ($78,s),y
$12:9151  7e bf 40	  ror $40bf,x
$12:9154  70 28		 bvs $917e
$12:9156  91 e4		 sta ($e4),y
$12:9158  08			php
$12:9159  04 9b		 tsb $9b
$12:915b  21 fb		 and ($fb,x)
$12:915d  35 c3		 and $c3,x
$12:915f  ef 00 e9 12   sbc $12e900
$12:9163  86 9b		 stx $9b
$12:9165  4d 73 86	  eor $8673
$12:9168  95 07		 sta $07,x
$12:916a  34 dd		 bit $dd,x
$12:916c  90 fd		 bcc $916b
$12:916e  33 f6		 and ($f6,s),y
$12:9170  05 88		 ora $88
$12:9172  69 60 10	  adc #$1060
$12:9175  88			dey
$12:9176  45 6a		 eor $6a
$12:9178  b4 3b		 ldy $3b,x
$12:917a  0c aa 0d	  tsb $0daa
$12:917d  e1 1f		 sbc ($1f,x)
$12:917f  7a			ply
$12:9180  d2 ed		 cmp ($ed)
$12:9182  6e b7 5a	  ror $5ab7
$12:9185  15 0a		 ora $0a,x
$12:9187  19 0c ec	  ora $ec0c,y
$12:918a  56 36		 lsr $36,x
$12:918c  3d 1f 6f	  and $6f1f,x
$12:918f  cb			wai
$12:9190  b5 e7		 lda $e7,x
$12:9192  92 77		 sta ($77)
$12:9194  ee b8 aa	  inc $aab8
$12:9197  16 f6		 asl $f6,x
$12:9199  19 f3 cc	  ora $ccf3,y
$12:919c  79 fc 03	  adc $03fc,y
$12:919f  b0 04		 bcs $91a5
$12:91a1  1e 83 c1	  asl $c183,x
$12:91a4  d3 e9		 cmp ($e9,s),y
$12:91a6  63 71		 adc $71,s
$12:91a8  13 a9		 ora ($a9,s),y
$12:91aa  0f 9e 0b d7   ora $d70b9e
$12:91ae  82 fa 21	  brl $b3ab
$12:91b1  77 5c		 adc [$5c],y
$12:91b3  1f 82 3f d1   ora $d13f82,x
$12:91b7  97 e1		 sta [$e1],y
$12:91b9  ef f1 ff ff   sbc $fffff1
$12:91bd  ec 4c 3f	  cpx $3f4c
$12:91c0  70 40		 bvs $9202
$12:91c2  ec b6 5a	  cpx $5ab6
$12:91c5  5d 2d 87	  eor $872d,x
$12:91c8  43 d8		 eor $d8,s
$12:91ca  f4 7d bf	  pea $bf7d
$12:91cd  55 df		 eor $df,x
$12:91cf  f5 9b		 sbc $9b,x
$12:91d1  ff b4 bd ec   sbc $ecbdb4,x
$12:91d5  a9 b2 5e	  lda #$5eb2
$12:91d8  d7 07		 cmp [$07],y
$12:91da  fd f0 ff	  sbc $fff0,x
$12:91dd  ff 01 0b b3   sbc $b30b01,x
$12:91e1  d9 e5 72	  cmp $72e5,y
$12:91e4  92 a9		 sta ($a9)
$12:91e6  4c 56 2f	  jmp $2f56
$12:91e9  42 a0		 wdm #$a0
$12:91eb  ef a1 3a 9a   sbc $9a3aa1
$12:91ef  77 4a		 adc [$4a],y
$12:91f1  2e 77 0c	  rol $0c77
$12:91f4  9d be 4f	  sta $4fbe,x
$12:91f7  df 85 ff e7   cmp $e7ff85,x
$12:91fb  e2 a1		 sep #$a1
$12:91fd  15 87		 ora $87,x
$12:91ff  bf ff 2c 96   lda $962cff,x
$12:9203  66 b3		 ror $b3
$12:9205  58			cli
$12:9206  69 24		 adc #$24
$12:9208  d7 a1		 cmp [$a1],y
$12:920a  da			phx
$12:920b  f2 75		 sbc ($75)
$12:920d  bd 1e df	  lda $df1e,x
$12:9210  8d 27 e3	  sta $e327
$12:9213  2c e9 c6	  bit $c6e9
$12:9216  7c fc 33	  jmp ($33fc,x)
$12:9219  60			rts
$12:921a  82 0b fc	  brl $8e28
$12:921d  8a			txa
$12:921e  1f 86 43 b1   ora $b14386,x
$12:9222  68			pla
$12:9223  d7 5c		 cmp [$5c],y
$12:9225  a2 b7 a9	  ldx #$a9b7
$12:9228  ed 6f 97	  sbc $976f
$12:922b  7d b6 0a	  adc $0ab6,x
$12:922e  82 ff 60	  brl $f330
$12:9231  47 01		 eor [$01]
$12:9233  19 c1 05	  ora $05c1,y
$12:9236  6d 88 ed	  adc $ed88
$12:9239  7e 59 48	  ror $4859,x
$12:923c  67 d7		 adc [$d7]
$12:923e  27 f7		 and [$f7]
$12:9240  b4 55		 ldy $55,x
$12:9242  e4 fb		 cpx $fb
$12:9244  bc e6 a6	  ldy $a6e6,x
$12:9247  26 8b		 rol $8b
$12:9249  08			php
$12:924a  7f fe 06 c0   adc $c006fe,x
$12:924e  1c ff ff	  trb $ffff
$12:9251  f1 ff		 sbc ($ff),y
$12:9253  4f 83 b0 3a   eor $3ab083
$12:9257  b4 6f		 ldy $6f,x
$12:9259  be 8e bb	  ldx $bb8e,y
$12:925c  04 ba		 tsb $ba
$12:925e  74 e7		 stz $e7,x
$12:9260  5d 4b 54	  eor $544b,x
$12:9263  4e b5 cc	  lsr $ccb5
$12:9266  ad 6d e7	  lda $e76d
$12:9269  0c c1 c1	  tsb $c1c1
$12:926c  ff f1 e6 c1   sbc $c1e6f1,x
$12:9270  23 84		 and $84,s
$12:9272  c1 98		 cmp ($98,x)
$12:9274  35 7e		 and $7e,x
$12:9276  a5 5a		 lda $5a
$12:9278  77 38		 adc [$38],y
$12:927a  e3 6c		 sbc $6c,s
$12:927c  e6 1a		 inc $1a
$12:927e  ce ee de	  dec $deee
$12:9281  33 4b		 and ($4b,s),y
$12:9283  93 75		 sta ($75,s),y
$12:9285  21 32		 and ($32,x)
$12:9287  82 31 f3	  brl $85bb
$12:928a  d8			cld
$12:928b  43 02		 eor $02,s
$12:928d  66 0b		 ror $0b
$12:928f  34 26		 bit $26,x
$12:9291  50 ee		 bvc $9281
$12:9293  6c 0f 53	  jmp ($530f)
$12:9296  9d d6 d0	  sta $d0d6,x
$12:9299  b7 33		 lda [$33],y
$12:929b  8a			txa
$12:929c  ae 8f 53	  ldx $538f
$12:929f  00 eb		 brk #$eb
$12:92a1  63 20		 adc $20,s
$12:92a3  2c c1 bf	  bit $bfc1
$12:92a6  00 87		 brk #$87
$12:92a8  8e 0a 36	  stx $360a
$12:92ab  68			pla
$12:92ac  41 3f		 eor ($3f,x)
$12:92ae  f6 2c		 inc $2c,x
$12:92b0  ef 5e 11 0d   sbc $0d115e
$12:92b4  80 76		 bra $932c
$12:92b6  3b			tsc
$12:92b7  1f bf dc 9c   ora $9cdcbf,x
$12:92bb  10 43		 bpl $9300
$12:92bd  f1 90		 sbc ($90),y
$12:92bf  48			pha
$12:92c0  3e 5f 21	  rol $215f,x
$12:92c3  d8			cld
$12:92c4  0b			phd
$12:92c5  c0 16 5d	  cpy #$5d16
$12:92c8  ff fc 37 ff   sbc $ff37fc,x
$12:92cc  20 ef fc	  jsr $fcef
$12:92cf  a1 b9		 lda ($b9,x)
$12:92d1  f8			sed
$12:92d2  05 16		 ora $16
$12:92d4  81 f8		 sta ($f8,x)
$12:92d6  fc 5f c7	  jsr ($c75f,x)
$12:92d9  c6 3f		 dec $3f
$12:92db  2b			pld
$12:92dc  05 83		 ora $83
$12:92de  75 fa		 adc $fa,x
$12:92e0  83 b3		 sta $b3,s
$12:92e2  07 43		 ora [$43]
$12:92e4  a0 f2 79	  ldy #$79f2
$12:92e7  15 a1		 ora $a1,x
$12:92e9  bd 17 3d	  lda $3d17,x
$12:92ec  7e 01 1b	  ror $1b01,x
$12:92ef  2f b1 08 e1   and $e108b1
$12:92f3  f0 09		 beq $92fe
$12:92f5  4c 82 e1	  jmp $e182
$12:92f8  70 bb		 bvs $92b5
$12:92fa  5d 89 e1	  eor $e189,x
$12:92fd  8d ff ca	  sta $caff
$12:9300  3b			tsc
$12:9301  fd a8 2b	  sbc $2ba8,x
$12:9304  30 3b		 bmi $9341
$12:9306  f0 0c		 beq $9314
$12:9308  7c 03 12	  jmp ($1203,x)
$12:930b  84 7d		 sty $7d
$12:930d  9d 31 98	  sta $9831,x
$12:9310  15 11		 ora $11,x
$12:9312  f8			sed
$12:9313  e9 34		 sbc #$34
$12:9315  9e ff 7f	  stz $7fff,x
$12:9318  f7 ff		 sbc [$ff],y
$12:931a  b4 01		 ldy $01,x
$12:931c  00 a5		 brk #$a5
$12:931e  20 15 b8	  jsr $b815
$12:9321  04 40		 tsb $40
$12:9323  be 75 bd	  ldx $bd75,y
$12:9326  21 b0		 and ($b0,x)
$12:9328  25 23		 and $23
$12:932a  f1 ab		 sbc ($ab),y
$12:932c  55 af		 eor $af,x
$12:932e  f7 fe		 sbc [$fe],y
$12:9330  ef ff 10 be   sbc $be10ff
$12:9334  70 d8		 bvs $930e
$12:9336  60			rts
$12:9337  0b			phd
$12:9338  e7 e1		 sbc [$e1]
$12:933a  ff e4 fd f6   sbc $f6fde4,x
$12:933e  dc fe be	  jml [$befe]
$12:9341  37 77		 and [$77],y
$12:9343  87 e7		 sta [$e7]
$12:9345  2f f7 5f df   and $df5ff7
$12:9349  bf e6 24 17   lda $1724e6,x
$12:934d  fd c2 fc	  sbc $fcc2,x
$12:9350  f9 6f 7e	  sbc $7e6f,y
$12:9353  ab			plb
$12:9354  bf 17 fd 5e   lda $5efd17,x
$12:9358  fe fe 9f	  inc $9ffe,x
$12:935b  be 57 df	  ldx $df57,y
$12:935e  3e e7 bf	  rol $bfe7,x
$12:9361  fa			plx
$12:9362  77 fc		 adc [$fc],y
$12:9364  db			stp
$12:9365  7f fb df fb   adc $fbdffb,x
$12:9369  a7 fe		 lda [$fe]
$12:936b  eb			xba
$12:936c  fa			plx
$12:936d  d6 7e		 dec $7e,x
$12:936f  b6 7f		 ldx $7f,y
$12:9371  cf 8f f9 ff   cmp $fff98f
$12:9375  d4 fc		 pei ($fc)
$12:9377  3f ce 5f 0b   and $0b5fce,x
$12:937b  cf eb 62 f5   cmp $f562eb
$12:937f  6a			ror a
$12:9380  7c 9a 9f	  jmp ($9f9a,x)
$12:9383  8b			phb
$12:9384  db			stp
$12:9385  f6 f6		 inc $f6,x
$12:9387  e7 30		 sbc [$30]
$12:9389  4b			phk
$12:938a  81 34		 sta ($34,x)
$12:938c  09 a1		 ora #$a1
$12:938e  bf 33 0d fc   lda $fc0d33,x
$12:9392  d4 37		 pei ($37)
$12:9394  af 96 b7 e1   lda $e1b796
$12:9398  e9 f8		 sbc #$f8
$12:939a  76 bc		 ror $bc,x
$12:939c  1a			inc a
$12:939d  df 8f 5b d5   cmp $d55b8f,x
$12:93a1  c1 fc		 cmp ($fc,x)
$12:93a3  72 fe		 adc ($fe)
$12:93a5  0b			phd
$12:93a6  b0 40		 bcs $93e8
$12:93a8  20 f8 0f	  jsr $0ff8
$12:93ab  e8			inx
$12:93ac  6b			rtl
$12:93ad  0d ef ff	  ora $ffef
$12:93b0  cd df a4	  cmp $a4df
$12:93b3  79 f9 57	  adc $57f9,y
$12:93b6  0d ad e2	  ora $e2ad
$12:93b9  77 7c		 adc [$7c],y
$12:93bb  be 4f d0	  ldx $d04f,y
$12:93be  0a			asl a
$12:93bf  9f 76 c0 6c   sta $6cc076,x
$12:93c3  f8			sed
$12:93c4  1d e8 f7	  ora $f7e8,x
$12:93c7  9f 83 b9 80   sta $80b983,x
$12:93cb  76 a8		 ror $a8,x
$12:93cd  9b			txy
$12:93ce  9d d5 2f	  sta $2fd5,x
$12:93d1  0c 9e 27	  tsb $279e
$12:93d4  78			sei
$12:93d5  38			sec
$12:93d6  0a			asl a
$12:93d7  71 ff		 adc ($ff),y
$12:93d9  a2 7f dc	  ldx #$dc7f
$12:93dc  01 4a		 ora ($4a,x)
$12:93de  a4 55		 ldy $55
$12:93e0  be dd 59	  ldx $59dd,y
$12:93e3  2f 4b 95 f5   and $f5954b
$12:93e7  d8			cld
$12:93e8  ec a2 35	  cpx $35a2
$12:93eb  3a			dec a
$12:93ec  66 a7		 ror $a7
$12:93ee  23 88		 and $88,s
$12:93f0  fb			xce
$12:93f1  f9 bf 3f	  sbc $3fbf,y
$12:93f4  8f fc f7 ff   sta $fff7fc
$12:93f8  0e ff c3	  asl $c3ff
$12:93fb  ff e9 e0 bf   sbc $bfe0e9,x
$12:93ff  7f f3 b9 ba   adc $bab9f3,x
$12:9403  b5 32		 lda $32,x
$12:9405  ab			plb
$12:9406  26 cd		 rol $cd
$12:9408  47 29		 eor [$29]
$12:940a  93 ed		 sta ($ed,s),y
$12:940c  77 06		 adc [$06],y
$12:940e  73 38		 adc ($38,s),y
$12:9410  a7 e1		 lda [$e1]
$12:9412  70 f7		 bvs $940b
$12:9414  f4 f0 38	  pea $38f0
$12:9417  c3 c0		 cmp $c0,s
$12:9419  8d 00 30	  sta $3000
$12:941c  f1 ff		 sbc ($ff),y
$12:941e  f0 2f		 beq $944f
$12:9420  fe 4b c9	  inc $c94b,x
$12:9423  d5 e5		 cmp $e5,x
$12:9425  56 67		 lsr $67,x
$12:9427  19 68 6f	  ora $6f68,y
$12:942a  b7 33		 lda [$33],y
$12:942c  94 eb		 sty $eb,x
$12:942e  e9 6e		 sbc #$6e
$12:9430  7b			tdc
$12:9431  7c 63 8c	  jmp ($8c63,x)
$12:9434  27 9f		 and [$9f]
$12:9436  f8			sed
$12:9437  3f fe 07 ff   and $ff07fe,x
$12:943b  83 7f		 sta $7f,s
$12:943d  fd 00 61	  sbc $6100,x
$12:9440  35 85		 and $85,x
$12:9442  56 67		 lsr $67,x
$12:9444  2d cf 54	  and $54cf
$12:9447  fc 79 58	  jsr ($5879,x)
$12:944a  ce af b9	  dec $b9af
$12:944d  5a			phy
$12:944e  9e 5d 70	  stz $705d,x
$12:9451  77 da		 adc [$da],y
$12:9453  63 a4		 adc $a4,s
$12:9455  0d 61 fc	  ora $fc61
$12:9458  ff f8 99 82   sbc $8299f8,x
$12:945c  06 2c		 asl $2c
$12:945e  1f ff 5b de   ora $de5bff,x
$12:9462  d6 dc		 dec $dc,x
$12:9464  f2 d8		 sbc ($d8)
$12:9466  6c ad ce	  jmp ($cead)
$12:9469  d5 16		 cmp $16,x
$12:946b  d7 41		 cmp [$41],y
$12:946d  7a			ply
$12:946e  b0 2b		 bcs $949b
$12:9470  4e 04 0c	  lsr $0c04
$12:9473  57 9f		 eor [$9f],y
$12:9475  fc 23 ff	  jsr ($ff23,x)
$12:9478  01 12		 ora ($12,x)
$12:947a  0e 3f ff	  asl $ff3f
$12:947d  de 27 07	  dec $0727,x
$12:9480  12 d3		 ora ($d3)
$12:9482  ba			tsx
$12:9483  d9 56 32	  cmp $3256,y
$12:9486  78			sei
$12:9487  fd 65 c3	  sbc $c365,x
$12:948a  91 8d		 sta ($8d),y
$12:948c  8d c8 69	  sta $69c8
$12:948f  b8			clv
$12:9490  c1 28		 cmp ($28,x)
$12:9492  71 3f		 adc ($3f),y
$12:9494  fe 71 60	  inc $6071,x
$12:9497  8a			txa
$12:9498  c3 e5		 cmp $e5,s
$12:949a  ff e0 7f e1   sbc $e17fe0,x
$12:949e  9f 3b 56 c2   sta $c2563b,x
$12:94a2  a9 d9		 lda #$d9
$12:94a4  d2 f4		 cmp ($f4)
$12:94a6  a5 3c		 lda $3c
$12:94a8  1d b5 ef	  ora $efb5,x
$12:94ab  b3 c4		 lda ($c4,s),y
$12:94ad  db			stp
$12:94ae  dc 6d 5d	  jml [$5d6d]
$12:94b1  84 58		 sty $58
$12:94b3  48			pha
$12:94b4  dd 03 fe	  cmp $fe03,x
$12:94b7  21 0c		 and ($0c,x)
$12:94b9  f9 cc 22	  sbc $22cc,y
$12:94bc  30 80		 bmi $943e
$12:94be  2b			pld
$12:94bf  fd 81 ed	  sbc $ed81,x
$12:94c2  1f 6f 57 4f   ora $4f576f,x
$12:94c6  cf b6 e7 c7   cmp $c7e7b6
$12:94ca  7f c4 30 9d   adc $9d30c4,x
$12:94ce  ff e9 ff ff   sbc $ffffe9,x
$12:94d2  ef ff ef fb   sbc $fbefff
$12:94d6  ff bf f6 99   sbc $99f6bf,x
$12:94da  9f ab 63 e4   sta $e463ab,x
$12:94de  3c fc df	  bit $dffc,x
$12:94e1  9f 6f c3 c1   sta $c1c36f,x
$12:94e5  fd ef 7e	  sbc $7eef,x
$12:94e8  7e 9f bd	  ror $bd9f,x
$12:94eb  ff df af e5   sbc $e5afdf,x
$12:94ef  af fb b6 fc   lda $fcb6fb
$12:94f3  7d 3f 1e	  adc $1e3f,x
$12:94f6  7f d7 d7 f1   adc $f1d7d7,x
$12:94fa  53 f6		 eor ($f6,s),y
$12:94fc  6a			ror a
$12:94fd  bb			tyx
$12:94fe  85 f0		 sta $f0
$12:9500  52 81		 eor ($81)
$12:9502  7c 9f 60	  jmp ($609f,x)
$12:9505  48			pha
$12:9506  48			pha
$12:9507  ba			tsx
$12:9508  60			rts
$12:9509  2f f6 d5 20   and $20d5f6
$12:950d  5f d0 a0 f7   eor $f7a0d0,x
$12:9511  0f ed fe f4   ora $f4feed
$12:9515  ff ef ff ab   sbc $abffef,x
$12:9519  e3 c4		 sbc $c4,s
$12:951b  fd ea be	  sbc $beea,x
$12:951e  fe 2f bf	  inc $bf2f,x
$12:9521  7f cf 42 f7   adc $f742cf,x
$12:9525  c9 f9		 cmp #$f9
$12:9527  75 9c		 adc $9c,x
$12:9529  7f fc ff b4   adc $b4fffc,x
$12:952d  f9 fe 7a	  sbc $7afe,y
$12:9530  7f 9f 9f ce   adc $ce9f9f,x
$12:9534  b3 f7		 lda ($f7,s),y
$12:9536  7c fd 1f	  jmp ($1ffd,x)
$12:9539  3f 0f ef cb   and $cbef0f,x
$12:953d  fb			xce
$12:953e  e7 fe		 sbc [$fe]
$12:9540  92 c8		 sta ($c8)
$12:9542  ea			nop
$12:9543  77 1e		 adc [$1e],y
$12:9545  e7 12		 sbc [$12]
$12:9547  db			stp
$12:9548  26 f2		 rol $f2
$12:954a  f6 75		 inc $75,x
$12:954c  b4 ed		 ldy $ed,x
$12:954e  64 c3		 stz $c3
$12:9550  51 ce		 eor ($ce),y
$12:9552  90 77		 bcc $95cb
$12:9554  ee 18 fe	  inc $fe18
$12:9557  1c fe 3f	  trb $3ffe
$12:955a  ff 9f 7f fe   sbc $fe7f9f,x
$12:955e  1f fe 07 fe   ora $fe07fe,x
$12:9562  1d f1 b6	  ora $b6f1,x
$12:9565  c3 b6		 cmp $b6,s
$12:9567  92 3b		 sta ($3b)
$12:9569  4d 23 a5	  eor $a523
$12:956c  9e 92 6f	  stz $6f92,x
$12:956f  39 14 88	  and $8814,y
$12:9572  9d 9a d3	  sta $d39a,x
$12:9575  f0 64		 beq $95db
$12:9577  96 23		 stx $23,y
$12:9579  ef 1e f0 cf   sbc $cff01e
$12:957d  78			sei
$12:957e  70 bf		 bvs $953f
$12:9580  bc 03 fe	  ldy $fe03,x
$12:9583  eb			xba
$12:9584  0a			asl a
$12:9585  d5 22		 cmp $22,x
$12:9587  43 06		 eor $06,s
$12:9589  e5 69		 sbc $69
$12:958b  e4 99		 cpx $99
$12:958d  8e cc 7f	  stx $7fcc
$12:9590  23 e0		 and $e0,s
$12:9592  aa			tax
$12:9593  4c 66 dc	  jmp $dc66
$12:9596  2a			rol a
$12:9597  26 fd		 rol $fd
$12:9599  d6 0c		 dec $0c,x
$12:959b  50 2b		 bvc $95c8
$12:959d  87 81		 sta [$81]
$12:959f  d8			cld
$12:95a0  30 ef		 bmi $9591
$12:95a2  fc 07 ff	  jsr ($ff07,x)
$12:95a5  eb			xba
$12:95a6  99 5b a9	  sta $a95b,y
$12:95a9  5a			phy
$12:95aa  59 1f 4e	  eor $4e1f,y
$12:95ad  d9 aa c9	  cmp $c9aa,y
$12:95b0  d6 b9		 dec $b9,x
$12:95b2  95 a9		 sta $a9,x
$12:95b4  95 b7		 sta $b7,x
$12:95b6  89 1c		 bit #$1c
$12:95b8  ff cc 7f e9   sbc $e97fcc,x
$12:95bc  e2 be		 sep #$be
$12:95be  7f e6 1f f8   adc $f81fe6,x
$12:95c2  17 f6		 ora [$f6],y
$12:95c4  07 ff		 ora [$ff]
$12:95c6  ba			tsx
$12:95c7  cb			wai
$12:95c8  b5 d7		 lda $d7,x
$12:95ca  1a			inc a
$12:95cb  66 33		 ror $33
$12:95cd  93 f0		 sta ($f0,s),y
$12:95cf  c9 47		 cmp #$47
$12:95d1  ab			plb
$12:95d2  37 9d		 and [$9d],y
$12:95d4  de 0b 75	  dec $750b,x
$12:95d7  26 62		 rol $62
$12:95d9  81 fc		 sta ($fc,x)
$12:95db  3e 6e c1	  rol $c16e,x
$12:95de  72 85		 adc ($85)
$12:95e0  e7 0c		 sbc [$0c]
$12:95e2  27 0e		 and [$0e]
$12:95e4  0f ff 13 0c   ora $0c13ff
$12:95e8  db			stp
$12:95e9  76 b4		 ror $b4,x
$12:95eb  57 1e		 eor [$1e],y
$12:95ed  d7 33		 cmp [$33],y
$12:95ef  ed 33 9f	  sbc $9f33
$12:95f2  43 2f		 eor $2f,s
$12:95f4  35 0e		 and $0e,x
$12:95f6  b6 09		 ldx $09,y
$12:95f8  92 1e		 sta ($1e)
$12:95fa  13 f8		 ora ($f8,s),y
$12:95fc  cf ff f0 c7   cmp $c7f0ff
$12:9600  60			rts
$12:9601  d0 37		 bne $963a
$12:9603  e0 d0		 cpx #$d0
$12:9605  d6 e2		 dec $e2,x
$12:9607  75 77		 adc $77,x
$12:9609  2a			rol a
$12:960a  56 13		 lsr $13,x
$12:960c  93 f8		 sta ($f8,s),y
$12:960e  d4 c1		 pei ($c1)
$12:9610  f5 71		 sbc $71,x
$12:9612  ca			dex
$12:9613  bc 93 77	  ldy $7793,x
$12:9616  31 b8		 and ($b8),y
$12:9618  ff bf 89 f1   sbc $f189bf,x
$12:961c  83 80		 sta $80,s
$12:961e  8f f1 ff 65   sta $65fff1
$12:9622  85 b2		 sta $b2
$12:9624  4b			phk
$12:9625  59 a7 75	  eor $75a7,y
$12:9628  71 16		 adc ($16),y
$12:962a  2a			rol a
$12:962b  06 f7		 asl $f7
$12:962d  b1 b2		 lda ($b2),y
$12:962f  bd 76 b8	  lda $b876,x
$12:9632  f6 bc		 inc $bc,x
$12:9634  c4 48		 cpy $48
$12:9636  d4 2e		 pei ($2e)
$12:9638  b0 c0		 bcs $95fa
$12:963a  01 87		 ora ($87,x)
$12:963c  fa			plx
$12:963d  64 14		 stz $14
$12:963f  28			plp
$12:9640  40			rti
$12:9641  15 fe		 ora $fe,x
$12:9643  c0 f6		 cpy #$f6
$12:9645  8f b7 ab d7   sta $d7abb7
$12:9649  f7 b7		 sbc [$b7],y
$12:964b  ff ff df fd   sbc $fddfff,x
$12:964f  4f fb 89 f9   eor $f989fb
$12:9653  f4 fc ee	  pea $eefc
$12:9656  5f fb 4b cc   eor $cc4bfb,x
$12:965a  1f fb cd ff   ora $ffcdfb,x
$12:965e  ef bf f5 df   sbc $dff5bf
$12:9662  f5 ed		 sbc $ed,x
$12:9664  e4 3a		 cpx $3a
$12:9666  df f5 f7 fd   cmp $fdf7f5,x
$12:966a  98			tya
$12:966b  54 83 ff	  mvn $ff,$83
$12:966e  7a			ply
$12:966f  bf 8b af e3   lda $e3af8b,x
$12:9673  f9 f8 d4	  sbc $d4f8,y
$12:9676  7f 2e df cb   adc $cbdf2e,x
$12:967a  9f f3 e9 f9   sta $f9e9f3,x
$12:967e  ee a2 c1	  inc $c1a2
$12:9681  ff b2 ef fd   sbc $fdefb2,x
$12:9685  3b			tsc
$12:9686  7f 97 b7 e9   adc $e9b797,x
$12:968a  ef f6 ff bd   sbc $bdfff6
$12:968e  db			stp
$12:968f  f7 ba		 sbc [$ba],y
$12:9691  ff e6 5f fd   sbc $fd5fe6,x
$12:9695  ff ce c3 f5   sbc $f5c3ce,x
$12:9699  b1 fb		 lda ($fb),y
$12:969b  36 7f		 rol $7f,x
$12:969d  6f 4f c7 d9   adc $d9c74f
$12:96a1  eb			xba
$12:96a2  7e 7e 9f	  ror $9f7e,x
$12:96a5  bf cf db 7f   lda $7fdbcf,x
$12:96a9  f6 db		 inc $db,x
$12:96ab  9f c7 f7 9e   sta $9ef7c7,x
$12:96af  c3 d7		 cmp $d7,s
$12:96b1  ff ba fb fb   sbc $fbfbba,x
$12:96b5  de 7e 7f	  dec $7f7e,x
$12:96b8  df 66 5e f9   cmp $f95e66,x
$12:96bc  0e ee 8f	  asl $8fee
$12:96bf  6d 8a c4	  adc $c48a
$12:96c2  b5 72		 lda $72,x
$12:96c4  39 ac e6	  and $e6ac,y
$12:96c7  53 cb		 eor ($cb,s),y
$12:96c9  ad 52 7a	  lda $7a52
$12:96cc  74 c9		 stz $c9,x
$12:96ce  c7 1e		 cmp [$1e]
$12:96d0  c7 9f		 cmp [$9f]
$12:96d2  87 ff		 sta [$ff]
$12:96d4  e3 9f		 sbc $9f,s
$12:96d6  fe 0f fa	  inc $fa0f,x
$12:96d9  11 f7		 ora ($f7),y
$12:96db  a3 ef		 lda $ef,s
$12:96dd  e7 e1		 sbc [$e1]
$12:96df  80 bb		 bra $969c
$12:96e1  da			phx
$12:96e2  b0 f3		 bcs $96d7
$12:96e4  69 86		 adc #$86
$12:96e6  af 35 a6 b6   lda $b6a635
$12:96ea  49 75		 eor #$75
$12:96ec  3b			tsc
$12:96ed  ae 97 5e	  ldx $5e97
$12:96f0  76 3e		 ror $3e,x
$12:96f2  2e 7f fe	  rol $fe7f
$12:96f5  c9 ff		 cmp #$ff
$12:96f7  88			dey
$12:96f8  7f e4 3d ef   adc $ef3de4,x
$12:96fc  17 f7		 ora [$f7],y
$12:96fe  f8			sed
$12:96ff  18			clc
$12:9700  0b			phd
$12:9701  c6 6a		 dec $6a
$12:9703  1d 67 b0	  ora $b067,x
$12:9706  ee 35 15	  inc $1535
$12:9709  d8			cld
$12:970a  5e cb 59	  lsr $59cb,x
$12:970d  eb			xba
$12:970e  a9 da		 lda #$da
$12:9710  21 9f		 and ($9f,x)
$12:9712  0f fb b4 33   ora $33b4fb
$12:9716  df fa 3f fe   cmp $fe3ffa,x
$12:971a  0f ff cf df   ora $dfcfff
$12:971e  e7 9f		 sbc [$9f]
$12:9720  f7 f8		 sbc [$f8],y
$12:9722  65 fa		 adc $fa
$12:9724  7a			ply
$12:9725  d8			cld
$12:9726  4d b6 69	  eor $69b6
$12:9729  a6 c1		 ldx $c1
$12:972b  5b			tcd
$12:972c  74 9b		 stz $9b,x
$12:972e  ab			plb
$12:972f  46 df		 lsr $df
$12:9731  17 aa		 ora [$aa],y
$12:9733  b3 c3		 lda ($c3,s),y
$12:9735  3f f1 1f f4   and $f41ff1,x
$12:9739  13 f7		 ora ($f7,s),y
$12:973b  01 ff		 ora ($ff,x)
$12:973d  f0 ff		 beq $973e
$12:973f  ff 7f fd f3   sbc $f3fd7f,x
$12:9743  ff 1f ff f2   sbc $f2ff1f,x
$12:9747  61 1b		 adc ($1b,x)
$12:9749  5c 9e ab 39   jml $39ab9e
$12:974d  b3 a1		 lda ($a1,s),y
$12:974f  6e 64 bc	  ror $bc64
$12:9752  dc 66 96	  jml [$9666]
$12:9755  4b			phk
$12:9756  da			phx
$12:9757  a6 32		 ldx $32
$12:9759  43 1f		 eor $1f,s
$12:975b  7f bf ff ff   adc $ffffbf,x
$12:975f  bf fe 17 fe   lda $fe17fe,x
$12:9763  19 f3 91	  ora $91f3,y
$12:9766  77 f0		 adc [$f0],y
$12:9768  1f ff 6c 17   ora $176cff,x
$12:976c  5d c8 95	  eor $95c8,x
$12:976f  47 b1		 eor [$b1]
$12:9771  b8			clv
$12:9772  38			sec
$12:9773  ee b3 4f	  inc $4fb3
$12:9776  c3 d4		 cmp $d4,s
$12:9778  4e 6c 5f	  lsr $5f6c
$12:977b  08			php
$12:977c  10 30		 bpl $97ae
$12:977e  48			pha
$12:977f  a0 43		 ldy #$43
$12:9781  08			php
$12:9782  1f fe 01 ff   ora $ff01fe,x
$12:9786  5f 81 a4 37   eor $37a481,x
$12:978a  b0 ad		 bcs $9739
$12:978c  5e 77 bb	  lsr $bb77,x
$12:978f  63 ac		 adc $ac,s
$12:9791  e6 2c		 inc $2c
$12:9793  f4 38 de	  pea $de38
$12:9796  65 76		 adc $76
$12:9798  15 58		 ora $58,x
$12:979a  11 a4		 ora ($a4),y
$12:979c  2f ce 01 f3   and $f301ce
$12:97a0  ff c9 a1 18   sbc $18a1c9,x
$12:97a4  f3 b2		 sbc ($b2,s),y
$12:97a6  ca			dex
$12:97a7  d7 67		 cmp [$67],y
$12:97a9  dc c4 7b	  jml [$7bc4]
$12:97ac  b4 8b		 ldy $8b,x
$12:97ae  f6 93		 inc $93,x
$12:97b0  77 91		 adc [$91],y
$12:97b2  b6 5a		 ldx $5a,y
$12:97b4  39 7e 0f	  and $0f7e,y
$12:97b7  4c 76 c1	  jmp $c176
$12:97ba  9f 80 ff b0   sta $b0ff80,x
$12:97be  c2 61		 rep #$61
$12:97c0  b0 21		 bcs $97e3
$12:97c2  85 fe		 sta $fe
$12:97c4  1f e3 40 2b   ora $2b40e3,x
$12:97c8  fd 81 ed	  sbc $ed81,x
$12:97cb  1f 6f 57 df   ora $df576f,x
$12:97cf  f3 b1		 sbc ($b1,s),y
$12:97d1  fd fb be	  sbc $befb,x
$12:97d4  76 ef		 ror $ef,x
$12:97d6  be 9f 9f	  ldx $9f9f,y
$12:97d9  63 ef		 adc $ef,s
$12:97db  e5 ff		 sbc $ff
$12:97dd  73 5f		 adc ($5f,s),y
$12:97df  da			phx
$12:97e0  08			php
$12:97e1  5f f7 ee ec   eor $eceef7,x
$12:97e5  fb			xce
$12:97e6  3e 7b 5f	  rol $5f7b,x
$12:97e9  df ce ff 69   cmp $69ffce,x
$12:97ed  fb			xce
$12:97ee  ef bf 3e df   sbc $df3ebf
$12:97f2  f7 7b		 sbc [$7b],y
$12:97f4  de ff ef	  dec $efff,x
$12:97f7  5f d2 e7 fc   eor $fce7d2,x
$12:97fb  cf 7f 7b bf   cmp $bf7b7f
$12:97ff  ff cf ff e7   sbc $e7ffcf,x
$12:9803  ff fb fe e7   sbc $e7fefb,x
$12:9807  2f fe 31 07   and $0731fe
$12:980b  7f 9f ff ef   adc $efff9f,x
$12:980f  fb			xce
$12:9810  f3 fe		 sbc ($fe,s),y
$12:9812  fd 7f 7e	  sbc $7e7f,x
$12:9815  f7 df		 sbc [$df],y
$12:9817  19 86 b7	  ora $b786,y
$12:981a  bc 3e ec	  ldy $ec3e,x
$12:981d  ef cf 83 bb   sbc $bb83cf
$12:9821  bc ec f6	  ldy $f6ec,x
$12:9824  d7 9f		 cmp [$9f],y
$12:9826  c5 f6		 cmp $f6
$12:9828  f7 fd		 sbc [$fd],y
$12:982a  de 7f e7	  dec $e77f,x
$12:982d  5f d1 f7 79   eor $79f7d1,x
$12:9831  7f 7e bf ef   adc $efbf7e,x
$12:9835  6b			rtl
$12:9836  fb			xce
$12:9837  fd fd bf	  sbc $bffd,x
$12:983a  82 ee 52	  brl $eb2b
$12:983d  00 70		 brk #$70
$12:983f  26 c0		 rol $c0
$12:9841  7d b3 9e	  adc $9eb3,x
$12:9844  0f 72 29 55   ora $552972
$12:9848  b8			clv
$12:9849  e1 b9		 sbc ($b9,x)
$12:984b  90 9d		 bcc $97ea
$12:984d  34 46		 bit $46,x
$12:984f  13 c7		 ora ($c7,s),y
$12:9851  e3 db		 sbc $db,s
$12:9853  3d ff ef	  and $efff,x
$12:9856  ff 8f ff 8e   sbc $8eff8f,x
$12:985a  ff c4 3f f0   sbc $f03fc4,x
$12:985e  0f fc 07 fd   ora $fd07fc
$12:9862  c7 9c		 cmp [$9c]
$12:9864  7b			tdc
$12:9865  e2 1b		 sep #$1b
$12:9867  bc 36 da	  ldy $da36,x
$12:986a  63 65		 adc $65,s
$12:986c  86 56		 stx $56
$12:986e  b8			clv
$12:986f  d1 69		 cmp ($69),y
$12:9871  97 2b		 sta [$2b],y
$12:9873  97 31		 sta [$31],y
$12:9875  fa			plx
$12:9876  62 af 57	  per $f028
$12:9879  ff f9 44 07   sbc $0744f9,x
$12:987d  20 3d 08	  jsr $083d
$12:9880  6f ff 89 3f   adc $3f89ff
$12:9884  f8			sed
$12:9885  43 ff		 eor $ff,s
$12:9887  50 5d		 bvc $98e6
$12:9889  96 8e		 stx $8e,y
$12:988b  d1 ce		 cmp ($ce),y
$12:988d  da			phx
$12:988e  59 69 f2	  eor $f269,y
$12:9891  8d bd 37	  sta $37bd
$12:9894  9b			txy
$12:9895  83 94		 sta $94,s
$12:9897  ee 2c b4	  inc $b42c
$12:989a  3a			dec a
$12:989b  1f f3 1d f1   ora $f11df3,x
$12:989f  e2 7e		 sep #$7e
$12:98a1  fe 1f f5	  inc $f51f,x
$12:98a4  f8			sed
$12:98a5  37 c2		 and [$c2],y
$12:98a7  8e c6 19	  stx $19c6
$12:98aa  94 4a		 sty $4a,x
$12:98ac  bb			tyx
$12:98ad  c8			iny
$12:98ae  94 d1		 sty $d1,x
$12:98b0  28			plp
$12:98b1  55 99		 eor $99,x
$12:98b3  a4 4a		 ldy $4a
$12:98b5  71 a5		 adc ($a5),y
$12:98b7  c3 54		 cmp $54,s
$12:98b9  6c 30 87	  jmp ($8730)
$12:98bc  38			sec
$12:98bd  4c 3f f8	  jmp $f83f
$12:98c0  2f fd 03 7f   and $7f03fd
$12:98c4  0c ff f0	  tsb $f0ff
$12:98c7  bf fe 0f f8   lda $f80ffe,x
$12:98cb  14 32		 trb $32
$12:98cd  14 2d		 trb $2d
$12:98cf  ae 4e cb	  ldx $cb4e
$12:98d2  2e cd 50	  rol $50cd
$12:98d5  a5 38		 lda $38
$12:98d7  ed 66 e2	  sbc $e266
$12:98da  ad 67 f5	  lda $f567
$12:98dd  63 7c		 adc $7c,s
$12:98df  3f fb 7f fe   and $fe7ffb,x
$12:98e3  3f ff 9e ff   and $ff9eff,x
$12:98e7  ee 02 40	  inc $4002
$12:98ea  ff e1 ff 10   sbc $10ffe1,x
$12:98ee  ff 86 92 eb   sbc $eb9286,x
$12:98f2  95 f4		 sta $f4,x
$12:98f4  52 a0		 eor ($a0)
$12:98f6  3a			dec a
$12:98f7  ad 45 97	  lda $9745
$12:98fa  b3 64		 lda ($64,s),y
$12:98fc  8b			phb
$12:98fd  60			rts
$12:98fe  75 34		 adc $34,x
$12:9900  3e 9f e1	  rol $e19f,x
$12:9903  58			cli
$12:9904  2a			rol a
$12:9905  c0 ab		 cpy #$ab
$12:9907  ff e0 df f8   sbc $f8dfe0,x
$12:990b  47 ff		 eor [$ff]
$12:990d  23 7e		 and $7e,s
$12:990f  e1 cf		 sbc ($cf,x)
$12:9911  25 57		 and $57
$12:9913  2b			pld
$12:9914  5e 23 55	  lsr $5523,x
$12:9917  37 d0		 and [$d0],y
$12:9919  f0 25		 beq $9940
$12:991b  5a			phy
$12:991c  6a			ror a
$12:991d  55 73		 eor $73,x
$12:991f  0f a7 ad c7   ora $c7ada7
$12:9923  3f bf ff a7   and $a7ffbf,x
$12:9927  ff 80 c6 19   sbc $19c680,x
$12:992b  0f 7c 4a 18   ora $184a7c
$12:992f  7b			tdc
$12:9930  c4 7f		 cpy $7f
$12:9932  c1 9d		 cmp ($9d,x)
$12:9934  c1 e6		 cmp ($e6,x)
$12:9936  ef 15 6a 77   sbc $776a15
$12:993a  aa			tax
$12:993b  13 d6		 ora ($d6,s),y
$12:993d  8b			phb
$12:993e  74 a8		 stz $a8,x
$12:9940  79 9c 4d	  adc $4d9c,y
$12:9943  9b			txy
$12:9944  c4 df		 cpy $df
$12:9946  08			php
$12:9947  3f fe 83 bf   and $bf83fe,x
$12:994b  84 7d		 sty $7d
$12:994d  fc df 99	  jsr ($99df,x)
$12:9950  df f3 0b 7e   cmp $7e0bf3,x
$12:9954  f0 47		 beq $999d
$12:9956  e0 0a		 cpx #$0a
$12:9958  ff 60 7b 47   sbc $477b60,x
$12:995c  dc 54 00	  jml [$0054]
$12:995f  20 80 3b	  jsr $3b80
$12:9962  c6 07		 dec $07
$12:9964  00 82		 brk #$82
$12:9966  40			rti
$12:9967  e1 70		 sbc ($70,x)
$12:9969  78			sei
$12:996a  34 3a		 bit $3a,x
$12:996c  01 09		 ora ($09,x)
$12:996e  84 41		 sty $41
$12:9970  dd e4 f2	  cmp $f2e4,x
$12:9973  17 f0		 ora [$f0],y
$12:9975  43 e0		 eor $e0,s
$12:9977  30 f8		 bmi $9971
$12:9979  30 20		 bmi $999b
$12:997b  5d e5 c0	  eor $c0e5,x
$12:997e  80 64		 bra $99e4
$12:9980  3c 16 8a	  bit $8a16,x
$12:9983  84 a2		 sty $a2
$12:9985  a1 b0		 lda ($b0,x)
$12:9987  bc 7a 3c	  ldy $3c7a,x
$12:998a  0f f3 09 87   ora $8709f3
$12:998e  c3 01		 cmp $01,s
$12:9990  f8			sed
$12:9991  d0 7e		 bne $9a11
$12:9993  3c 1f 8f	  bit $8f1f,x
$12:9996  87 e2		 sta [$e2]
$12:9998  47 1f		 eor [$1f]
$12:999a  93 cf		 sta ($cf,s),y
$12:999c  e2 52		 sep #$52
$12:999e  f9 ec 2a	  sbc $2aec,y
$12:99a1  7f 0f 9b c7   adc $c79b0f,x
$12:99a5  ef 14 f8 fc   sbc $fcf814
$12:99a9  92 0f		 sta ($0f)
$12:99ab  3f 18 84 aa   and $aa8418,x
$12:99af  7f 0a 8f d8   adc $d88f0a,x
$12:99b3  ab			plb
$12:99b4  f6 8a		 inc $8a,x
$12:99b6  7c de 8f	  jmp ($8fde,x)
$12:99b9  58			cli
$12:99ba  b2 68		 lda ($68)
$12:99bc  30 16		 bmi $99d4
$12:99be  0f 04 63 c1   ora $c16304
$12:99c2  fe c0 7e	  inc $7ec0,x
$12:99c5  f5 54		 sbc $54,x
$12:99c7  9c ce a2	  stz $a2ce
$12:99ca  71 9d		 adc ($9d),y
$12:99cc  90 70		 bcc $9a3e
$12:99ce  3c 12 0f	  bit $0f12,x
$12:99d1  06 83		 asl $83
$12:99d3  c1 80		 cmp ($80,x)
$12:99d5  e0 41		 cpx #$41
$12:99d7  3d db 6d	  and $6ddb,x
$12:99da  7d 5e df	  adc $df5e,x
$12:99dd  62 a3 bf	  per $5983
$12:99e0  d0 16		 bne $99f8
$12:99e2  10 b8		 bpl $999c
$12:99e4  7c 0e 3f	  jmp ($3f0e,x)
$12:99e7  02 8f		 cop #$8f
$12:99e9  c5 63		 cmp $63
$12:99eb  cf f5 07 00   cmp $0007f5
$12:99ef  38			sec
$12:99f0  23 e8		 and $e8,s
$12:99f2  93 77		 sta ($77,s),y
$12:99f4  91 94		 sta ($94),y
$12:99f6  3c 09 60	  bit $6009,x
$12:99f9  a0 5c		 ldy #$5c
$12:99fb  2a			rol a
$12:99fc  17 0d		 ora [$0d],y
$12:99fe  86 c1		 stx $c1
$12:9a00  1e 90 00	  asl $0090,x
$12:9a03  f0 19		 beq $9a1e
$12:9a05  00 4c		 brk #$4c
$12:9a07  1f 0a 07 c2   ora $c2070a,x
$12:9a0b  7f 3c 8c 4c   adc $4c8c3c,x
$12:9a0f  e4 51		 cpx $51
$12:9a11  b8			clv
$12:9a12  04 62		 tsb $62
$12:9a14  23 1f		 and $1f,s
$12:9a16  8b			phb
$12:9a17  43 e5		 eor $e5,s
$12:9a19  73 7a		 adc ($7a,s),y
$12:9a1b  14 3a		 trb $3a
$12:9a1d  09 38		 ora #$38
$12:9a1f  80 4f		 bra $9a70
$12:9a21  21 13		 and ($13,x)
$12:9a23  78			sei
$12:9a24  c4 5e		 cpy $5e
$12:9a26  3f 18 8f c7   and $c78f18,x
$12:9a2a  a1 d0		 lda ($d0,x)
$12:9a2c  e9 8c		 sbc #$8c
$12:9a2e  03 f1		 ora $f1,s
$12:9a30  50 a8		 bvc $99da
$12:9a32  7a			ply
$12:9a33  38			sec
$12:9a34  1f 08 04 c3   ora $c30408,x
$12:9a38  61 c0		 adc ($c0,x)
$12:9a3a  98			tya
$12:9a3b  7c 25 17	  jmp ($1725,x)
$12:9a3e  88			dey
$12:9a3f  64 f2		 stz $f2
$12:9a41  81 38		 sta ($38,x)
$12:9a43  b0 46		 bcs $9a8b
$12:9a45  2c 19 09	  bit $0919
$12:9a48  87 43		 sta [$43]
$12:9a4a  e0 d9		 cpx #$d9
$12:9a4c  06 b0		 asl $b0
$12:9a4e  4c 02 61	  jmp $6102
$12:9a51  38			sec
$12:9a52  95 ca		 sta $ca,x
$12:9a54  96 83		 stx $83,y
$12:9a56  1b			tcs
$12:9a57  8b			phb
$12:9a58  c3 63		 cmp $63,s
$12:9a5a  f0 68		 beq $9ac4
$12:9a5c  f4 d6 19	  pea $19d6
$12:9a5f  2f a6 42 26   and $2642a6
$12:9a63  8c 35 8e	  sty $8e35
$12:9a66  4b			phk
$12:9a67  61 97		 adc ($97,x)
$12:9a69  38			sec
$12:9a6a  04 cd		 tsb $cd
$12:9a6c  be 1a 8d	  ldx $8d1a,y
$12:9a6f  42 78		 wdm #$78
$12:9a71  1a			inc a
$12:9a72  c1 d0		 cmp ($d0,x)
$12:9a74  b0 7c		 bcs $9af2
$12:9a76  1a			inc a
$12:9a77  61 90		 adc ($90,x)
$12:9a79  90 7a		 bcc $9af5
$12:9a7b  20 92 0a	  jsr $0a92
$12:9a7e  c4 83		 cpy $83
$12:9a80  b0 e5		 bcs $9a67
$12:9a82  3b			tsc
$12:9a83  85 a2		 sta $a2
$12:9a85  c1 dc		 cmp ($dc,x)
$12:9a87  67 04		 adc [$04]
$12:9a89  11 3e		 ora ($3e),y
$12:9a8b  62 f5 93	  per $2e83
$12:9a8e  c7 27		 cmp [$27]
$12:9a90  f1 41		 sbc ($41),y
$12:9a92  7d 2f c1	  adc $c12f,x
$12:9a95  7e 22 f9	  ror $f922,x
$12:9a98  a8			tay
$12:9a99  48			pha
$12:9a9a  39 17 01	  and $0117,y
$12:9a9d  7d 40 2e	  adc $2e40,x
$12:9aa0  0d f0 4f	  ora $4ff0
$12:9aa3  9c 0e 17	  stz $170e
$12:9aa6  0f 8a 47 63   ora $63478a
$12:9aaa  91 58		 sta ($58),y
$12:9aac  74 5a		 stz $5a,x
$12:9aae  07 1f		 ora [$1f]
$12:9ab0  37 a4		 and [$a4],y
$12:9ab2  02 1f		 cop #$1f
$12:9ab4  02 8f		 cop #$8f
$12:9ab6  a1 c2		 lda ($c2,x)
$12:9ab8  13 1f		 ora ($1f,s),y
$12:9aba  84 1f		 sty $1f
$12:9abc  93 80		 sta ($80,s),y
$12:9abe  17 08		 ora [$08],y
$12:9ac0  83 50		 sta $50,s
$12:9ac2  3f 19 0f c7   and $c70f19,x
$12:9ac6  83 f0		 sta $f0,s
$12:9ac8  67 37		 adc [$37]
$12:9aca  68			pla
$12:9acb  7c 14 a2	  jmp ($a214,x)
$12:9ace  9e 05 50	  stz $5005,x
$12:9ad1  c0 a0		 cpy #$a0
$12:9ad3  22 e0 84 c0   jsl $c084e0
$12:9ad7  e1 e8		 sbc ($e8,x)
$12:9ad9  60			rts
$12:9ada  86 c6		 stx $c6
$12:9adc  63 d1		 adc $d1,s
$12:9ade  78			sei
$12:9adf  f4 fe 1e	  pea $1efe
$12:9ae2  67 18		 adc [$18]
$12:9ae4  3a			dec a
$12:9ae5  14 21		 trb $21
$12:9ae7  90 36		 bcc $9b1f
$12:9ae9  28			plp
$12:9aea  47 23		 eor [$23]
$12:9aec  f3 f8		 sbc ($f8,s),y
$12:9aee  f9 78 28	  sbc $2878,y
$12:9af1  16 09		 asl $09,x
$12:9af3  03 44		 ora $44,s
$12:9af5  3c 1a 0f	  bit $0f1a,x
$12:9af8  02 8c		 cop #$8c
$12:9afa  78			sei
$12:9afb  18			clc
$12:9afc  0c 07 52	  tsb $5207
$12:9aff  21 60		 and ($60,x)
$12:9b01  c0 48		 cpy #$48
$12:9b03  12 81		 ora ($81)
$12:9b05  80 6f		 bra $9b76
$12:9b07  85 01		 sta $01
$12:9b09  c0 10		 cpy #$10
$12:9b0b  0b			phd
$12:9b0c  c5 00		 cmp $00
$12:9b0e  3a			dec a
$12:9b0f  10 98		 bpl $9aa9
$12:9b11  7c 12 16	  jmp ($1612,x)
$12:9b14  88			dey
$12:9b15  0b			phd
$12:9b16  fc 0e 7b	  jsr ($7b0e,x)
$12:9b19  23 89		 and $89,s
$12:9b1b  46 6a		 lsr $6a
$12:9b1d  b5 c8		 lda $c8,x
$12:9b1f  7c cd de	  jmp ($decd,x)
$12:9b22  10 a4		 bpl $9ac8
$12:9b24  30 30		 bmi $9b56
$12:9b26  82 0f 42	  brl $dd38
$12:9b29  b1 db		 lda ($db),y
$12:9b2b  6e b2 ab	  ror $abb2
$12:9b2e  b5 46		 lda $46,x
$12:9b30  c5 d8		 cmp $d8
$12:9b32  fc 60 3f	  jsr ($3f60,x)
$12:9b35  17 cd		 ora [$cd],y
$12:9b37  07 ff		 ora [$ff]
$12:9b39  c1 de		 cmp ($de,x)
$12:9b3b  f1 49		 sbc ($49),y
$12:9b3d  39 9d 58	  and $589d,y
$12:9b40  ed f2 cd	  sbc $cdf2
$12:9b43  c8			iny
$12:9b44  fc 6a 3f	  jsr ($3f6a,x)
$12:9b47  1a			inc a
$12:9b48  0f 86 03 e1   ora $e10386
$12:9b4c  21 f1		 and ($f1,x)
$12:9b4e  f6 fa		 inc $fa,x
$12:9b50  f2 a9		 sbc ($a9)
$12:9b52  bf 17 47 72   lda $724717,x
$12:9b56  83 4d		 sta $4d,s
$12:9b58  20 75 8a	  jsr $8a75
$12:9b5b  7d ea 0f	  adc $0fea,x
$12:9b5e  74 86		 stz $86,x
$12:9b60  44 a1 d1	  mvp $d1,$a1
$12:9b63  98			tya
$12:9b64  3c 7a 03	  bit $037a,x
$12:9b67  3e a0 de	  rol $dea0,x
$12:9b6a  e0 93		 cpx #$93
$12:9b6c  04 20		 tsb $20
$12:9b6e  20 c6 02	  jsr $02c6
$12:9b71  67 3a		 adc [$3a]
$12:9b73  6d d2 3d	  adc $3dd2
$12:9b76  60			rts
$12:9b77  e7 fc		 sbc [$fc]
$12:9b79  75 f7		 adc $f7,x
$12:9b7b  2e 0e eb	  rol $eb0e
$12:9b7e  59 10 96	  eor $9610,y
$12:9b81  48			pha
$12:9b82  39 9e 0b	  and $0b9e,y
$12:9b85  a6 0b		 ldx $0b
$12:9b87  cf 90 87 78   cmp $788790
$12:9b8b  21 90		 and ($90,x)
$12:9b8d  05 88		 ora $88
$12:9b8f  36 06		 rol $06,x
$12:9b91  21 00		 and ($00,x)
$12:9b93  88			dey
$12:9b94  42 a3		 wdm #$a3
$12:9b96  b0 58		 bcs $9bf0
$12:9b98  dc 5e 1b	  jml [$1b5e]
$12:9b9b  1e 8a c4	  asl $c48a,x
$12:9b9e  e3 f1		 sbc $f1,s
$12:9ba0  18			clc
$12:9ba1  dc 22 10	  jml [$1022]
$12:9ba4  4a			lsr a
$12:9ba5  08			php
$12:9ba6  0c 7e 07	  tsb $077e
$12:9ba9  1f 86 c7 e0   ora $e0c786,x
$12:9bad  b1 f8		 lda ($f8),y
$12:9baf  3a			dec a
$12:9bb0  00 23		 brk #$23
$12:9bb2  70 03		 bvs $9bb7
$12:9bb4  e0 ec		 cpx #$ec
$12:9bb6  2e 14 0d	  rol $0d14
$12:9bb9  87 42		 sta [$42]
$12:9bbb  c1 f0		 cmp ($f0,x)
$12:9bbd  a8			tay
$12:9bbe  64 3e		 stz $3e
$12:9bc0  11 0d		 ora ($0d),y
$12:9bc2  83 44		 sta $44,s
$12:9bc4  09 42		 ora #$42
$12:9bc6  24 14		 bit $14
$12:9bc8  a0 50		 ldy #$50
$12:9bca  3e 1c 01	  rol $011c,x
$12:9bcd  20 6c 20	  jsr $206c
$12:9bd0  09 c1		 ora #$c1
$12:9bd2  a6 58		 ldx $58
$12:9bd4  2b			pld
$12:9bd5  96 0a		 stx $0a,y
$12:9bd7  cd 42 a3	  cmp $a342
$12:9bda  18			clc
$12:9bdb  b0 c1		 bcs $9b9e
$12:9bdd  e7 30		 sbc [$30]
$12:9bdf  08			php
$12:9be0  f9 18 63	  sbc $6318,y
$12:9be3  f2 05		 sbc ($05)
$12:9be5  f8			sed
$12:9be6  4b			phk
$12:9be7  e2 12		 sep #$12
$12:9be9  78			sei
$12:9bea  c4 62		 cpy $62
$12:9bec  0e 04 02	  asl $0204
$12:9bef  51 63		 eor ($63),y
$12:9bf1  21 1e		 and ($1e,x)
$12:9bf3  08			php
$12:9bf4  27 c2		 and [$c2]
$12:9bf6  11 bc		 ora ($bc),y
$12:9bf8  6a			ror a
$12:9bf9  07 43		 ora [$43]
$12:9bfb  71 20		 adc ($20),y
$12:9bfd  e8			inx
$12:9bfe  50 3c		 bvc $9c3c
$12:9c00  09 f0		 ora #$f0
$12:9c02  82 7e 20	  brl $bc83
$12:9c05  9f 48 43 4c   sta $4c4348,x
$12:9c09  25 1d		 and $1d
$12:9c0b  0e 82 6c	  asl $6c82
$12:9c0e  e1 72		 sbc ($72,x)
$12:9c10  8a			txa
$12:9c11  bc 02 ef	  ldy $ef02,x
$12:9c14  00 b7		 brk #$b7
$12:9c16  c4 e5		 cpy $e5
$12:9c18  f0 c8		 beq $9be2
$12:9c1a  bc 01 92	  ldy $9201,x
$12:9c1d  55 76		 eor $76,x
$12:9c1f  10 c3		 bpl $9be4
$12:9c21  e2 10		 sep #$10
$12:9c23  c8			iny
$12:9c24  9c 4e 19	  stz $194e
$12:9c27  0e 25 1e	  asl $1e25
$12:9c2a  c2 09		 rep #$09
$12:9c2c  b0 84		 bcs $9bb2
$12:9c2e  65 22		 adc $22
$12:9c30  1b			tcs
$12:9c31  cf 86 61 3e   cmp $3e6186
$12:9c35  06 81		 asl $81
$12:9c37  25 03		 and $03
$12:9c39  84 bd		 sty $bd
$12:9c3b  11 07		 ora ($07),y
$12:9c3d  20 06 40	  jsr $4006
$12:9c40  50 92		 bvc $9bd4
$12:9c42  89 9c		 bit #$9c
$12:9c44  8e 37 0b	  stx $0b37
$12:9c47  8b			phb
$12:9c48  46 21		 lsr $21
$12:9c4a  e7 10		 sbc [$10]
$12:9c4c  81 43		 sta ($43,x)
$12:9c4e  a6 b0		 ldx $b0
$12:9c50  49 7d		 eor #$7d
$12:9c52  32 01		 and ($01)
$12:9c54  3c 85 cd	  bit $cd85,x
$12:9c57  e3 e4		 sbc $e4,s
$12:9c59  30 8f		 bmi $9bea
$12:9c5b  43 e1		 eor $e1,s
$12:9c5d  93 18		 sta ($18,s),y
$12:9c5f  05 ee		 ora $ee
$12:9c61  01 33		 ora ($33,x)
$12:9c63  a0 4a		 ldy #$4a
$12:9c65  33 18		 and ($18,s),y
$12:9c67  89 87		 bit #$87
$12:9c69  83 20		 sta $20,s
$12:9c6b  52 04		 eor ($04)
$12:9c6d  88			dey
$12:9c6e  60			rts
$12:9c6f  3c 09 a0	  bit $a009,x
$12:9c72  f4 41 20	  pea $2041
$12:9c75  17 8d		 ora [$8d],y
$12:9c77  07 60		 ora [$60]
$12:9c79  4c 02 60	  jmp $6002
$12:9c7c  f0 58		 beq $9cd6
$12:9c7e  23 10		 and $10,s
$12:9c80  0e e0 78	  asl $78e0
$12:9c83  61 10		 adc ($10,x)
$12:9c85  f8			sed
$12:9c86  6c 2a 2f	  jmp ($2f2a)
$12:9c89  1a			inc a
$12:9c8a  87 c7		 sta [$c7]
$12:9c8c  e0 e0		 cpx #$e0
$12:9c8e  90 80		 bcc $9c10
$12:9c90  9e 80 54	  stz $5480,x
$12:9c93  10 c8		 bpl $9c5d
$12:9c95  7c 2a 1f	  jmp ($1f2a,x)
$12:9c98  1b			tcs
$12:9c99  21 8c		 and ($8c,x)
$12:9c9b  3e 1e 79	  rol $791e,x
$12:9c9e  04 48		 tsb $48
$12:9ca0  87 46		 sta [$46]
$12:9ca2  c1 f8		 cmp ($f8,x)
$12:9ca4  f8			sed
$12:9ca5  4e 2a 1f	  lsr $1f2a
$12:9ca8  8e 85 e1	  stx $e185
$12:9cab  b0 12		 bcs $9cbf
$12:9cad  88			dey
$12:9cae  84 40		 sty $40
$12:9cb0  3a			dec a
$12:9cb1  29 f2		 and #$f2
$12:9cb3  c0 28		 cpy #$28
$12:9cb5  0e 01 38	  asl $3801
$12:9cb8  80 44		 bra $9cfe
$12:9cba  2f d4 6b dd   and $dd6bd4
$12:9cbe  02 67		 cop #$67
$12:9cc0  30 a9		 bmi $9c6b
$12:9cc2  c3 2e		 cmp $2e,s
$12:9cc4  70 29		 bvs $9cef
$12:9cc6  dc 06 0b	  jml [$0b06]
$12:9cc9  00 81		 brk #$81
$12:9ccb  c0 27		 cpy #$27
$12:9ccd  34 09		 bit $09,x
$12:9ccf  fd 02 9f	  sbc $9f02,x
$12:9cd2  30 99		 bmi $9c6d
$12:9cd4  c3 21		 cmp $21,s
$12:9cd6  b0 28		 bcs $9d00
$12:9cd8  34 05		 bit $05,x
$12:9cda  7a			ply
$12:9cdb  02 a0		 cop #$a0
$12:9cdd  e6 41		 inc $41
$12:9cdf  3c 90 cb	  bit $cb90,x
$12:9ce2  04 22		 tsb $22
$12:9ce4  21 30		 and ($30,x)
$12:9ce6  8e 50 31	  stx $3150
$12:9ce9  18			clc
$12:9cea  0b			phd
$12:9ceb  85 00		 sta $00
$12:9ced  36 1f		 rol $1f,x
$12:9cef  01 28		 ora ($28,x)
$12:9cf1  42 04		 wdm #$04
$12:9cf3  21 cc		 and ($cc,x)
$12:9cf5  98			tya
$12:9cf6  6e 28 17	  ror $1728
$12:9cf9  0c 06 00	  tsb $0006
$12:9cfc  54 34 99	  mvn $99,$34
$12:9cff  bc b2 07	  ldy $07b2,x
$12:9d02  78			sei
$12:9d03  83 d6		 sta $d6,s
$12:9d05  a0 f4		 ldy #$f4
$12:9d07  49 64		 eor #$64
$12:9d09  4a			lsr a
$12:9d0a  1d 19 83	  ora $8319,x
$12:9d0d  c7 a0		 cmp [$a0]
$12:9d0f  32 7a		 and ($7a)
$12:9d11  05 ce		 ora $ce
$12:9d13  09 78		 ora #$78
$12:9d15  81 ab		 sta ($ab,x)
$12:9d17  02 26		 cop #$26
$12:9d19  8b			phb
$12:9d1a  37 68		 and [$68],y
$12:9d1c  dd 23 56	  cmp $5623,x
$12:9d1f  0e 7f c3	  asl $c37f
$12:9d22  5b			tcd
$12:9d23  70 e0		 bvs $9d05
$12:9d25  ee b5 91	  inc $91b5
$12:9d28  09 64		 ora #$64
$12:9d2a  83 99		 sta $99,s
$12:9d2c  e0 b8		 cpx #$b8
$12:9d2e  60			rts
$12:9d2f  fc f9 08	  jsr ($08f9,x)
$12:9d32  7f 80 f0 05   adc $05f080,x
$12:9d36  e0 6e		 cpx #$6e
$12:9d38  87 01		 sta [$01]
$12:9d3a  3a			dec a
$12:9d3b  11 0a		 ora ($0a),y
$12:9d3d  3c fe 95	  bit $95fe,x
$12:9d40  7f 92 56 ef   adc $ef5692,x
$12:9d44  71 5b		 adc ($5b),y
$12:9d46  f8			sed
$12:9d47  d8			cld
$12:9d48  27 ff		 and [$ff]
$12:9d4a  1c f4 fe	  trb $fef4
$12:9d4d  91 0f		 sta ($0f),y
$12:9d4f  bf d3 af f5   lda $f5afd3,x
$12:9d53  51 b8		 eor ($b8),y
$12:9d55  4f fb fb fe   eor $fefbfb
$12:9d59  06 7e		 asl $7e
$12:9d5b  dd 8e d8	  cmp $d88e,x
$12:9d5e  72 01		 adc ($01)
$12:9d60  45 a0		 eor $a0
$12:9d62  d8			cld
$12:9d63  64 3a		 stz $3a
$12:9d65  0d 50 05	  ora $0550
$12:9d68  18			clc
$12:9d69  28			plp
$12:9d6a  f6 14		 inc $14,x
$12:9d6c  0e 84 80	  asl $8084
$12:9d6f  b1 28		 lda ($28),y
$12:9d71  d0 80		 bne $9cf3
$12:9d73  c0 63		 cpy #$63
$12:9d75  f1 3b		 sbc ($3b),y
$12:9d77  95 f7		 sta $f7,x
$12:9d79  83 c3		 sta $c3,s
$12:9d7b  c1 de		 cmp ($de,x)
$12:9d7d  7f c5 96 86   adc $8696c5,x
$12:9d81  c0 27		 cpy #$27
$12:9d83  d0 0b		 bne $9d90
$12:9d85  e1 65		 sbc ($65,x)
$12:9d87  9d 40 da	  sta $da40,x
$12:9d8a  09 87		 ora #$87
$12:9d8c  ab			plb
$12:9d8d  37 e5		 and [$e5],y
$12:9d8f  88			dey
$12:9d90  da			phx
$12:9d91  eb			xba
$12:9d92  65 94		 adc $94
$12:9d94  88			dey
$12:9d95  44 31 13	  mvp $13,$31
$12:9d98  81 38		 sta ($38,x)
$12:9d9a  09 43		 ora #$43
$12:9d9c  08			php
$12:9d9d  dd 02 cc	  cmp $cc02,x
$12:9da0  40			rti
$12:9da1  fc 10 4a	  jsr ($4a10,x)
$12:9da4  ce 19 61	  dec $6119
$12:9da7  28			plp
$12:9da8  a0 c1		 ldy #$c1
$12:9daa  df 9d 64 59   cmp $59649d,x
$12:9dae  6f 06 83 e1   adc $e18306
$12:9db2  88			dey
$12:9db3  b8			clv
$12:9db4  34 26		 bit $26,x
$12:9db6  01 f0		 ora ($f0,x)
$12:9db8  80 37		 bra $9df1
$12:9dba  88			dey
$12:9dbb  12 11		 ora ($11)
$12:9dbd  e8			inx
$12:9dbe  04 1e		 tsb $1e
$12:9dc0  21 06		 and ($06,x)
$12:9dc2  8a			txa
$12:9dc3  77 fe		 adc [$fe],y
$12:9dc5  76 7e		 ror $7e,x
$12:9dc7  c4 12		 cpy $12
$12:9dc9  16 a0		 asl $a0,x
$12:9dcb  28			plp
$12:9dcc  3c 02 3f	  bit $3f02,x
$12:9dcf  00 8d		 brk #$8d
$12:9dd1  c0 3f		 cpy #$3f
$12:9dd3  9f 8f f7 f2   sta $f2f78f,x
$12:9dd7  21 07		 and ($07,x)
$12:9dd9  f0 42		 beq $9e1d
$12:9ddb  3b			tsc
$12:9ddc  11 8f		 ora ($8f),y
$12:9dde  45 c2		 eor $c2
$12:9de0  81 38		 sta ($38,x)
$12:9de2  a0 4c		 ldy #$4c
$12:9de4  30 16		 bmi $9dfc
$12:9de6  09 07		 ora #$07
$12:9de8  02 41		 cop #$41
$12:9dea  e0 fc		 cpx #$fc
$12:9dec  42 2d		 wdm #$2d
$12:9dee  10 8b		 bpl $9d7b
$12:9df0  c4 23		 cpy $23
$12:9df2  71 08		 adc ($08),y
$12:9df4  d8			cld
$12:9df5  40			rti
$12:9df6  2c 10 00	  bit $0010
$12:9df9  e0 0a		 cpx #$0a
$12:9dfb  80 c0		 bra $9dbd
$12:9dfd  16 1e		 asl $1e,x
$12:9dff  06 f3		 asl $f3
$12:9e01  85 09		 sta $09
$12:9e03  8e 0d 42	  stx $420d
$12:9e06  03 0f		 ora $0f,s
$12:9e08  84 41		 sty $41
$12:9e0a  e1 8f		 sbc ($8f,x)
$12:9e0c  e1 f0		 sbc ($f0,x)
$12:9e0e  78			sei
$12:9e0f  3c 7e 00	  bit $007e,x
$12:9e12  28			plp
$12:9e13  01 41		 ora ($41,x)
$12:9e15  56 10		 lsr $10,x
$12:9e17  78			sei
$12:9e18  43 d0		 eor $d0,s
$12:9e1a  1d 21 c0	  ora $c021,x
$12:9e1d  88			dey
$12:9e1e  78			sei
$12:9e1f  26 1e		 rol $1e
$12:9e21  0a			asl a
$12:9e22  87 83		 sta [$83]
$12:9e24  21 f0		 and ($f0,x)
$12:9e26  d8			cld
$12:9e27  5c 34 13 0e   jml $0e1334
$12:9e2b  83 78		 sta $78,s
$12:9e2d  26 0e		 rol $0e
$12:9e2f  a1 13		 lda ($13,x)
$12:9e31  82 5c 2e	  brl $cc90
$12:9e34  17 0f		 ora [$0f],y
$12:9e36  85 c2		 sta $c2
$12:9e38  c1 e0		 cmp ($e0,x)
$12:9e3a  81 40		 sta ($40,x)
$12:9e3c  60			rts
$12:9e3d  90 28		 bcc $9e67
$12:9e3f  64 16		 stz $16
$12:9e41  17 0b		 ora [$0b],y
$12:9e43  82 c3 a2	  brl $4109
$12:9e46  51 58		 eor ($58),y
$12:9e48  74 1e		 stz $1e,x
$12:9e4a  1a			inc a
$12:9e4b  03 00		 ora $00,s
$12:9e4d  09 43		 ora #$43
$12:9e4f  e1 47		 sbc ($47,x)
$12:9e51  70 80		 bvs $9dd3
$12:9e53  c3 a0		 cmp $a0,s
$12:9e55  71 f8		 adc ($f8),y
$12:9e57  3c fa 0d	  bit $0dfa,x
$12:9e5a  40			rti
$12:9e5b  14 84		 trb $84
$12:9e5d  83 01		 sta $01,s
$12:9e5f  e0 e0		 cpx #$e0
$12:9e61  13 c7		 ora ($c7,s),y
$12:9e63  01 40		 ora ($40,x)
$12:9e65  c8			iny
$12:9e66  64 3d		 stz $3d
$12:9e68  10 8b		 bpl $9df5
$12:9e6a  06 00		 asl $00
$12:9e6c  36 2a		 rol $2a,x
$12:9e6e  21 15		 and ($15,x)
$12:9e70  08			php
$12:9e71  64 28		 stz $28
$12:9e73  0e b0 37	  asl $37b0
$12:9e76  84 1c		 sty $1c
$12:9e78  e4 10		 cpx $10
$12:9e7a  68			pla
$12:9e7b  4c 36 0d	  jmp $0d36
$12:9e7e  0f 88 45 e0   ora $e04588
$12:9e82  b0 19		 bcs $9e9d
$12:9e84  54 8c fe	  mvn $fe,$8c
$12:9e87  90 95		 bcc $9e1e
$12:9e89  b8			clv
$12:9e8a  20 c0 08	  jsr $08c0
$12:9e8d  10 98		 bpl $9e27
$12:9e8f  fc 0d 1e	  jsr ($1e0d,x)
$12:9e92  54 02 08	  mvn $08,$02
$12:9e95  78			sei
$12:9e96  15 42		 ora $42,x
$12:9e98  19 0e 07	  ora $070e,y
$12:9e9b  41 1e		 eor ($1e,x)
$12:9e9d  0a			asl a
$12:9e9e  01 20		 ora ($20,x)
$12:9ea0  03 8c		 ora $8c,s
$12:9ea2  83 61		 sta $61,s
$12:9ea4  b0 c0		 bcs $9e66
$12:9ea6  6e 30 11	  ror $1130
$12:9ea9  b8			clv
$12:9eaa  34 72		 bit $72,x
$12:9eac  07 18		 ora [$18]
$12:9eae  83 c7		 sta $c7,s
$12:9eb0  a0 f0		 ldy #$f0
$12:9eb2  98			tya
$12:9eb3  11 fc		 ora ($fc),y
$12:9eb5  4f e3 04 57   eor $5704e3
$12:9eb9  02 04		 cop #$04
$12:9ebb  50 41		 bvc $9efe
$12:9ebd  02 7f		 cop #$7f
$12:9ebf  83 e4		 sta $e4,s
$12:9ec1  f1 91		 sbc ($91),y
$12:9ec3  08			php
$12:9ec4  e7 c3		 sbc [$c3]
$12:9ec6  79 78 eb	  adc $eb78,y
$12:9ec9  4d 3c 51	  eor $513c
$12:9ecc  8b			phb
$12:9ecd  e4 02		 cpx $02
$12:9ecf  79 00 86	  adc $8600,y
$12:9ed2  40			rti
$12:9ed3  22 16 0b 84   jsl $840b16
$12:9ed7  02 f1		 cop #$f1
$12:9ed9  00 9a		 brk #$9a
$12:9edb  42 23		 wdm #$23
$12:9edd  00 85		 brk #$85
$12:9edf  7c 94 22	  jmp ($2294,x)
$12:9ee2  51 04		 eor ($04),y
$12:9ee4  ae 0a 60	  ldx $600a
$12:9ee7  fe 12 88	  inc $8812,x
$12:9eea  85 72		 sta $72
$12:9eec  40			rti
$12:9eed  29 7a		 and #$7a
$12:9eef  02 3c		 cop #$3c
$12:9ef1  0a			asl a
$12:9ef2  22 94 1c 07   jsl $071c94
$12:9ef6  01 30		 ora ($30,x)
$12:9ef8  18			clc
$12:9ef9  02 78		 cop #$78
$12:9efb  40			rti
$12:9efc  2c 06 01	  bit $0106
$12:9eff  72 17		 adc ($17)
$12:9f01  02 00		 cop #$00
$12:9f03  5d 03 f8	  eor $f803,x
$12:9f06  4d ff 51	  eor $51ff
$12:9f09  fb			xce
$12:9f0a  17 8a		 ora [$8a],y
$12:9f0c  3f fd 81 4f   and $4f81fd,x
$12:9f10  d8			cld
$12:9f11  61 01		 adc ($01,x)
$12:9f13  00 84		 brk #$84
$12:9f15  04 f8		 tsb $f8
$12:9f17  07 f2		 ora [$f2]
$12:9f19  5f 82 0c 50   eor $500c82,x
$12:9f1d  89 b6		 bit #$b6
$12:9f1f  87 f8		 sta [$f8]
$12:9f21  30 f2		 bmi $9f15
$12:9f23  ef 4f 4e 29   sbc $294e4f
$12:9f27  eb			xba
$12:9f28  8e 6b e1	  stx $e16b
$12:9f2b  1e c8 07	  asl $07c8,x
$12:9f2e  c0 9e		 cpy #$9e
$12:9f30  1c 0c c7	  trb $c70c
$12:9f33  63 a1		 adc $a1,s
$12:9f35  78			sei
$12:9f36  f6 7e		 inc $7e,x
$12:9f38  23 90		 and $90,s
$12:9f3a  0f 44 41 3a   ora $3a4144
$12:9f3e  0b			phd
$12:9f3f  f0 fd		 beq $9f3e
$12:9f41  67 77		 adc [$77]
$12:9f43  39 5a 97	  and $975a,y
$12:9f46  2f 47 66 e9   and $e96647
$12:9f4a  cd 3c 71	  cmp $713c
$12:9f4d  c0 d8		 cpy #$d8
$12:9f4f  3f 02 c3 80   and $80c302,x
$12:9f53  b2 e0		 lda ($e0)
$12:9f55  a7 78		 lda [$78]
$12:9f57  48			pha
$12:9f58  d6 02		 dec $02,x
$12:9f5a  10 29		 bpl $9f85
$12:9f5c  5b			tcd
$12:9f5d  c6 02		 dec $02
$12:9f5f  e1 c0		 sbc ($c0,x)
$12:9f61  b0 78		 bcs $9fdb
$12:9f63  36 16		 rol $16,x
$12:9f65  04 e8		 tsb $e8
$12:9f67  1a			inc a
$12:9f68  c9 f8		 cmp #$f8
$12:9f6a  05 d0		 ora $d0
$12:9f6c  34 81		 bit $81,x
$12:9f6e  94 2c		 sty $2c,x
$12:9f70  02 97		 cop #$97
$12:9f72  9c 4f e9	  stz $e94f
$12:9f75  d3 1b		 cmp ($1b,s),y
$12:9f77  fc 01 e6	  jsr ($e601,x)
$12:9f7a  13 d8		 ora ($d8,s),y
$12:9f7c  1c 32 07	  trb $0732
$12:9f7f  03 64		 ora $64,s
$12:9f81  11 18		 ora ($18),y
$12:9f83  17 64		 ora [$64],y
$12:9f85  88			dey
$12:9f86  07 d8		 ora [$d8]
$12:9f88  3e cc aa	  rol $aacc,x
$12:9f8b  1a			inc a
$12:9f8c  8d 87 73	  sta $7387
$12:9f8f  a1 5c		 lda ($5c,x)
$12:9f91  f0 4f		 beq $9fe2
$12:9f93  38			sec
$12:9f94  0c f0 32	  tsb $32f0
$12:9f97  81 30		 sta ($30,x)
$12:9f99  df e2 88 14   cmp $1488e2,x
$12:9f9d  e8			inx
$12:9f9e  06 ce		 asl $ce
$12:9fa0  19 04 9e	  ora $9e04,y
$12:9fa3  c1 6f		 cmp ($6f,x)
$12:9fa5  50 bb		 bvc $9f62
$12:9fa7  f4 0e a7	  pea $a70e
$12:9faa  3c a3 bb	  bit $bba3,x
$12:9fad  c0 0a		 cpy #$0a
$12:9faf  67 b0		 adc [$b0]
$12:9fb1  82 32 08	  brl $a7e6
$12:9fb4  ee 13 e1	  inc $e113
$12:9fb7  21 f8		 and ($f8,x)
$12:9fb9  25 1d		 and $1d
$12:9fbb  0f e4 00 a6   ora $a600e4
$12:9fbf  1f 81 4a 39   ora $394a81,x
$12:9fc3  02 e1		 cop #$e1
$12:9fc5  00 98		 brk #$98
$12:9fc7  39 9d 10	  and $109d,y
$12:9fca  31 e9		 and ($e9),y
$12:9fcc  34 ba		 bit $ba,x
$12:9fce  41 1c		 eor ($1c,x)
$12:9fd0  39 04 42	  and $4204,y
$12:9fd3  79 19 9c	  adc $9c19,y
$12:9fd6  41 a3		 eor ($a3,x)
$12:9fd8  10 88		 bpl $9f62
$12:9fda  3c 02 33	  bit $3302,x
$12:9fdd  20 8f a0	  jsr $a08f
$12:9fe0  06 5f		 asl $5f
$12:9fe2  10 93		 bpl $9f77
$12:9fe4  46 63		 lsr $63
$12:9fe6  30 63		 bmi $a04b
$12:9fe8  e8			inx
$12:9fe9  36 c3		 rol $c3,x
$12:9feb  d1 08		 cmp ($08),y
$12:9fed  d8			cld
$12:9fee  40			rti
$12:9fef  32 10		 and ($10)
$12:9ff1  8e 04 43	  stx $4304
$12:9ff4  81 f0		 sta ($f0,x)
$12:9ff6  f4 09 c3	  pea $c309
$12:9ff9  01 c0		 ora ($c0,x)
$12:9ffb  13 89		 ora ($89,s),y
$12:9ffd  5c 3e 10 8f   jml $8f103e
$12:a001  44 42 11	  mvp $11,$42
$12:a004  f0 14		 beq $a01a
$12:a006  03 6c		 ora $6c,s
$12:a008  ab			plb
$12:a009  f4 78 fc	  pea $fc78
$12:a00c  8e 3c 80	  stx $803c
$12:a00f  1a			inc a
$12:a010  bd 46 cf	  lda $cf46,x
$12:a013  2e 9c 42	  rol $429c
$12:a016  21 f0		 and ($f0,x)
$12:a018  09 dc		 ora #$dc
$12:a01a  0e b9 20	  asl $20b9
$12:a01d  af b0 86 5d   lda $5d86b0
$12:a021  11 88		 ora ($88),y
$12:a023  c3 91		 cmp $91,s
$12:a025  65 d0		 adc $d0
$12:a027  ca			dex
$12:a028  54 22 96	  mvn $96,$22
$12:a02b  88			dey
$12:a02c  85 f2		 sta $f2
$12:a02e  f1 a8		 sbc ($a8),y
$12:a030  c0 18		 cpy #$18
$12:a032  81 3a		 sta ($3a,x)
$12:a034  18			clc
$12:a035  08			php
$12:a036  05 a2		 ora $a2
$12:a038  09 e8		 ora #$e8
$12:a03a  82 79 23	  brl $c3b6
$12:a03d  18			clc
$12:a03e  0b			phd
$12:a03f  85 c1		 sta $c1
$12:a041  38			sec
$12:a042  26 38		 rol $38
$12:a044  81 40		 sta ($40,x)
$12:a046  a0 8f		 ldy #$8f
$12:a048  70 86		 bvs $9fd0
$12:a04a  41 a1		 eor ($a1,x)
$12:a04c  d0 b8		 bne $a006
$12:a04e  d9 a1 20	  cmp $20a1,y
$12:a051  30 38		 bmi $a08b
$12:a053  1c 1e 07	  trb $071e
$12:a056  0f 80 c3 e0   ora $e0c380
$12:a05a  91 f3		 sta ($f3),y
$12:a05c  1c 48 24	  trb $2448
$12:a05f  05 b0		 ora $b0
$12:a061  c8			iny
$12:a062  64 0d		 stz $0d
$12:a064  09 80		 ora #$80
$12:a066  74 00		 stz $00,x
$12:a068  9c 3c 02	  stz $023c
$12:a06b  a0 b0		 ldy #$b0
$12:a06d  2a			rol a
$12:a06e  50 d0		 bvc $a040
$12:a070  b1 f8		 lda ($f8),y
$12:a072  84 be		 sty $be
$12:a074  10 63		 bpl $a0d9
$12:a076  a0 d0		 ldy #$d0
$12:a078  18			clc
$12:a079  00 c7		 brk #$c7
$12:a07b  50 88		 bvc $a005
$12:a07d  44 fc 9d	  mvp $9d,$fc
$12:a080  6d 90 26	  adc $2690
$12:a083  85 be		 sta $be
$12:a085  11 23		 ora ($23),y
$12:a087  86 4c		 stx $4c
$12:a089  e7 d3		 sbc [$d3]
$12:a08b  38			sec
$12:a08c  44 5e 5f	  mvp $5f,$5e
$12:a08f  31 9f		 and ($9f),y
$12:a091  c5 27		 cmp $27
$12:a093  14 f7		 trb $f7
$12:a095  30 40		 bmi $a0d7
$12:a097  2e 90 48	  rol $4890
$12:a09a  3c 1e 6f	  bit $6f1e,x
$12:a09d  30 43		 bmi $a0e2
$12:a09f  12 14		 ora ($14)
$12:a0a1  17 a1		 ora [$a1],y
$12:a0a3  e0 90		 cpx #$90
$12:a0a5  66 2c		 ror $2c
$12:a0a7  19 cf 06	  ora $06cf,y
$12:a0aa  22 41 d8 fc   jsl $fcd841
$12:a0ae  46 3e		 lsr $3e
$12:a0b0  16 4b		 asl $4b,x
$12:a0b2  e5 23		 sbc $23
$12:a0b4  e1 18		 sbc ($18,x)
$12:a0b6  80 57		 bra $a10f
$12:a0b8  28			plp
$12:a0b9  1d ce 07	  ora $07ce,x
$12:a0bc  70 ce		 bvs $a08c
$12:a0be  31 84		 and ($84),y
$12:a0c0  c8			iny
$12:a0c1  5c 2d 96 09   jml $09962d
$12:a0c5  ec ea 3f	  cpx $3fea
$12:a0c8  37 8f		 and [$8f],y
$12:a0ca  c2 a3		 rep #$a3
$12:a0cc  b0 a9		 bcs $a077
$12:a0ce  84 a3		 sty $a3
$12:a0d0  8b			phb
$12:a0d1  97 f4		 sta [$f4],y
$12:a0d3  6b			rtl
$12:a0d4  f5 3a		 sbc $3a,x
$12:a0d6  f8			sed
$12:a0d7  3c fe 1f	  bit $1ffe,x
$12:a0da  3f 8d 47 e3   and $e3478d,x
$12:a0de  53 fb		 eor ($fb,s),y
$12:a0e0  44 3e cf	  mvp $cf,$3e
$12:a0e3  08			php
$12:a0e4  a7 c4		 lda [$c4]
$12:a0e6  19 60 2b	  ora $2b60,y
$12:a0e9  0e 05 83	  asl $8305
$12:a0ec  80 e8		 bra $a0d6
$12:a0ee  0c 05 82	  tsb $8205
$12:a0f1  41 50		 eor ($50,x)
$12:a0f3  a0 6e		 ldy #$6e
$12:a0f5  38			sec
$12:a0f6  19 0a 02	  ora $020a,y
$12:a0f9  38			sec
$12:a0fa  30 0d		 bmi $a109
$12:a0fc  00 14		 brk #$14
$12:a0fe  0c c3 01	  tsb $01c3
$12:a101  38			sec
$12:a102  c0 6e		 cpy #$6e
$12:a104  20 1b 8c	  jsr $8c1b
$12:a107  01 49		 ora ($49,x)
$12:a109  a0 70		 ldy #$70
$12:a10b  38			sec
$12:a10c  24 10		 bit $10
$12:a10e  b6 11		 ldx $11,y
$12:a110  88			dey
$12:a111  81 49		 sta ($49,x)
$12:a113  e0 70		 cpx #$70
$12:a115  b8			clv
$12:a116  7c 5e 3f	  jmp ($3f5e,x)
$12:a119  07 8f		 ora [$8f]
$12:a11b  95 12		 sta $12,x
$12:a11d  a1 50		 lda ($50,x)
$12:a11f  c4 05		 cpy $05
$12:a121  c6 b1		 dec $b1
$12:a123  58			cli
$12:a124  b8			clv
$12:a125  5e 08 aa	  lsr $aa08,x
$12:a128  7e 0f c0	  ror $c00f,x
$12:a12b  9c 34 1f	  stz $1f34
$12:a12e  8c 07 e1	  sty $e107
$12:a131  f0 10		 beq $a143
$12:a133  b4 10		 ldy $10,x
$12:a135  42 20		 wdm #$20
$12:a137  90 08		 bcc $a141
$12:a139  14 3a		 trb $3a
$12:a13b  25 15		 and $15
$12:a13d  8a			txa
$12:a13e  cf a6 53 d3   cmp $d353a6
$12:a142  38			sec
$12:a143  43 e1		 eor $e1,s
$12:a145  90 f8		 bcc $a13f
$12:a147  42 34		 wdm #$34
$12:a149  20 30 08	  jsr $0830
$12:a14c  54 02 7f	  mvn $7f,$02
$12:a14f  3f bf 4f bc   and $bc4fbf,x
$12:a153  10 0a		 bpl $a15f
$12:a155  02 3c		 cop #$3c
$12:a157  1a			inc a
$12:a158  e1 60		 sbc ($60,x)
$12:a15a  a0 70		 ldy #$70
$12:a15c  22 1d 0a 06   jsl $060a1d
$12:a160  03 50		 ora $50,s
$12:a162  24 02		 bit $02
$12:a164  f8			sed
$12:a165  bb			tyx
$12:a166  81 dc		 sta ($dc,x)
$12:a168  52 08		 eor ($08)
$12:a16a  00 78		 brk #$78
$12:a16c  3f 80 70 18   and $187080,x
$12:a170  02 0c		 cop #$0c
$12:a172  21 d0		 and ($d0,x)
$12:a174  18			clc
$12:a175  14 1a		 trb $1a
$12:a177  1f 10 8b c0   ora $c08b10,x
$12:a17b  a0 72		 ldy #$72
$12:a17d  88			dey
$12:a17e  18			clc
$12:a17f  84 21		 sty $21
$12:a181  d0 e8		 bne $a16b
$12:a183  6c 32 1a	  jmp ($1a32)
$12:a186  21 18		 and ($18,x)
$12:a188  44 02 79	  mvp $79,$02
$12:a18b  00 be		 brk #$be
$12:a18d  c0 49		 cpy #$49
$12:a18f  e1 c0		 sbc ($c0,x)
$12:a191  90 70		 bcc $a203
$12:a193  04 23		 tsb $23
$12:a195  80 c0		 bra $a157
$12:a197  64 2a		 stz $2a
$12:a199  1c 0d 05	  trb $050d
$12:a19c  43 41		 eor $41,s
$12:a19e  20 49 09	  jsr $0949
$12:a1a1  3c 09 e3	  bit $e309,x
$12:a1a4  00 d0		 brk #$d0
$12:a1a6  40			rti
$12:a1a7  3b			tsc
$12:a1a8  1c 0e e7	  trb $e70e
$12:a1ab  02 05		 cop #$05
$12:a1ad  01 8f		 ora ($8f,x)
$12:a1af  46 a0		 lsr $a0
$12:a1b1  b1 b8		 lda ($b8),y
$12:a1b3  7c 2e 15	  jmp ($152e,x)
$12:a1b6  05 81		 ora $81
$12:a1b8  43 62		 eor $62,s
$12:a1ba  91 78		 sta ($78),y
$12:a1bc  7c 1c 42	  jmp ($421c,x)
$12:a1bf  11 a8		 ora ($a8),y
$12:a1c1  ec 72 3e	  cpx $3e72
$12:a1c4  44 02 20	  mvp $20,$02
$12:a1c7  2e 01 12	  rol $1201
$12:a1ca  13 82		 ora ($82,s),y
$12:a1cc  80 58		 bra $a226
$12:a1ce  04 80		 tsb $80
$12:a1d0  51 04		 eor ($04),y
$12:a1d2  d8			cld
$12:a1d3  60			rts
$12:a1d4  14 e1		 trb $e1
$12:a1d6  c0 c8		 cpy #$c8
$12:a1d8  64 3d		 stz $3d
$12:a1da  10 8b		 bpl $a167
$12:a1dc  06 01		 asl $01
$12:a1de  24 0d		 bit $0d
$12:a1e0  f2 a0		 sbc ($a0)
$12:a1e2  60			rts
$12:a1e3  15 20		 ora $20,x
$12:a1e5  56 0f		 lsr $0f,x
$12:a1e7  84 02		 sty $02
$12:a1e9  23 11		 and $11,s
$12:a1eb  89 44 e3	  bit #$e344
$12:a1ee  d1 d8		 cmp ($d8),y
$12:a1f0  7a			ply
$12:a1f1  d0 20		 bne $a213
$12:a1f3  b0 e8		 bcs $a1dd
$12:a1f5  2c 4e 2f	  bit $2f4e
$12:a1f8  01 81		 ora ($81,x)
$12:a1fa  c3 a3		 cmp $a3,s
$12:a1fc  f0 c8		 beq $a1c6
$12:a1fe  fc 0e 3f	  jsr ($3f0e,x)
$12:a201  07 8f		 ora [$8f]
$12:a203  c3 61		 cmp $61,s
$12:a205  f0 d8		 beq $a1df
$12:a207  fc 5e 0f	  jsr ($0f5e,x)
$12:a20a  03 3f		 ora $3f,s
$12:a20c  0b			phd
$12:a20d  6c 3e 17	  jmp ($173e)
$12:a210  0f 06 c3 c0   ora $c0c306
$12:a214  51 0a		 eor ($0a),y
$12:a216  06 43		 asl $43
$12:a218  a0 64		 ldy #$64
$12:a21a  0f 87 c2 c1   ora $c1c287
$12:a21e  f0 0f		 beq $a22f
$12:a220  07 00		 ora [$00]
$12:a222  40			rti
$12:a223  1e 01 08	  asl $0801,x
$12:a226  74 38		 stz $38,x
$12:a228  09 70 b9	  ora #$b970
$12:a22b  c3 24		 cmp $24,s
$12:a22d  70 e9		 bvs $a218
$12:a22f  9c e2 2f	  stz $2fe2
$12:a232  2f 9c c7 e9   and $e9c79c
$12:a236  17 c9		 ora [$c9],y
$12:a238  3c 62 db	  bit $db62,x
$12:a23b  00 ba		 brk #$ba
$12:a23d  41 2e		 eor ($2e,x)
$12:a23f  e7 20		 sbc [$20]
$12:a241  80 4c		 bra $a28f
$12:a243  26 13		 rol $13
$12:a245  89 c4 6e	  bit #$6ec4
$12:a248  31 67		 and ($67),y
$12:a24a  80 5f		 bra $a2ab
$12:a24c  e0 15		 cpx #$15
$12:a24e  d8			cld
$12:a24f  05 6e		 ora $6e
$12:a251  81 7b		 sta ($7b,x)
$12:a253  80 54		 bra $a2a9
$12:a255  e0 13		 cpx #$13
$12:a257  b8			clv
$12:a258  44 76 08	  mvp $08,$76
$12:a25b  be 12 60	  ldx $6012,y
$12:a25e  cf cc 06 be   cmp $be06cc
$12:a262  03 f0		 ora $f0,s
$12:a264  a1 86		 lda ($86,x)
$12:a266  6d 00 b7	  adc $b700
$12:a269  40			rti
$12:a26a  23 84		 and $84,s
$12:a26c  e1 be		 sbc ($be,x)
$12:a26e  c8			iny
$12:a26f  25 30		 and $30
$12:a271  08			php
$12:a272  f4 09 7c	  pea $7c09
$12:a275  04 d0		 tsb $d0
$12:a277  3f 91 84 23   and $238491,x
$12:a27b  e8			inx
$12:a27c  61 80		 adc ($80,x)
$12:a27e  9a			txs
$12:a27f  c7 29		 cmp [$29]
$12:a281  60			rts
$12:a282  ee 41 3b	  inc $3b41
$12:a285  10 0f		 bpl $a296
$12:a287  64 13		 stz $13
$12:a289  c9 00 fc	  cmp #$fc00
$12:a28c  44 03 81	  mvp $81,$03
$12:a28f  c0 80		 cpy #$80
$12:a291  67 13		 adc [$13]
$12:a293  01 00		 ora ($00,x)
$12:a295  fe 28 05	  inc $0528,x
$12:a298  42 1e		 wdm #$1e
$12:a29a  05 40		 ora $40
$12:a29c  83 c2		 sta $c2,s
$12:a29e  cf 7b 99 43   cmp $43997b
$12:a2a2  e9 57 dc	  sbc #$dc57
$12:a2a5  16 7a		 asl $7a,x
$12:a2a7  df 00 ed 40   cmp $40ed00,x
$12:a2ab  37 50		 and [$50],y
$12:a2ad  0d be 00	  ora $00be
$12:a2b0  84 13		 sty $13
$12:a2b2  f9 fc 7a	  sbc $7afc,y
$12:a2b5  3d 61 80	  and $8061,x
$12:a2b8  7f d8 c6 7f   adc $7fc6d8,x
$12:a2bc  06 72		 asl $72
$12:a2be  c1 20		 cmp ($20,x)
$12:a2c0  50 e8		 bvc $a2aa
$12:a2c2  03 60		 ora $60,s
$12:a2c4  19 cd 06	  ora $06cd,y
$12:a2c7  82 3f 82	  brl $2509
$12:a2ca  02 e7		 cop #$e7
$12:a2cc  03 59		 ora $59,s
$12:a2ce  43 22		 eor $22,s
$12:a2d0  90 28		 bcc $a2fa
$12:a2d2  f4 24 10	  pea $1024
$12:a2d5  10 a8		 bpl $a27f
$12:a2d7  bc 6e 1f	  ldy $1f6e,x
$12:a2da  1f 83 43 c1   ora $c14383,x
$12:a2de  e1 0b		 sbc ($0b,x)
$12:a2e0  8f c2 63 f0   sta $f063c2
$12:a2e4  c8			iny
$12:a2e5  7c 2a 1f	  jmp ($1f2a,x)
$12:a2e8  1a			inc a
$12:a2e9  8f 82 02 1e   sta $1e0282
$12:a2ed  fc 19 04	  jsr ($0419,x)
$12:a2f0  e0 8c		 cpx #$8c
$12:a2f2  1f 8f c5 c3   ora $c3c58f,x
$12:a2f6  f1 48		 sbc ($48),y
$12:a2f8  f8			sed
$12:a2f9  6c 28 18	  jmp ($1828)
$12:a2fc  08			php
$12:a2fd  05 02		 ora $02
$12:a2ff  81 c0		 sta ($c0,x)
$12:a301  fc 07 c1	  jsr ($c107,x)
$12:a304  48			pha
$12:a305  41 f1		 eor ($f1,x)
$12:a307  f8			sed
$12:a308  60			rts
$12:a309  38			sec
$12:a30a  14 00		 trb $00
$12:a30c  70 47		 bvs $a355
$12:a30e  8e 21 1d	  stx $1d21
$12:a311  3a			dec a
$12:a312  4b			phk
$12:a313  14 10		 trb $10
$12:a315  3b			tsc
$12:a316  00 48		 brk #$48
$12:a318  87 21		 sta [$21]
$12:a31a  29 2a 32	  and #$322a
$12:a31d  51 d5		 eor ($d5),y
$12:a31f  46 0f		 lsr $0f
$12:a321  77 a3		 adc [$a3],y
$12:a323  c9 20 76	  cmp #$7620
$12:a326  fa			plx
$12:a327  05 3c		 ora $3c
$12:a329  88			dey
$12:a32a  11 08		 ora ($08),y
$12:a32c  b4 00		 ldy $00,x
$12:a32e  7a			ply
$12:a32f  17 b8		 ora [$b8],y
$12:a331  1c ee 07	  trb $07ee
$12:a334  7c 22 09	  jmp ($0922,x)
$12:a337  14 1f		 trb $1f
$12:a339  80 fc		 bra $a337
$12:a33b  18			clc
$12:a33c  06 62		 asl $62
$12:a33e  81 6c		 sta ($6c,x)
$12:a340  c0 5c		 cpy #$5c
$12:a342  20 17 48	  jsr $4817
$12:a345  05 f2		 ora $f2
$12:a347  11 28		 ora ($28),y
$12:a349  80 0a		 bra $a355
$12:a34b  86 01		 stx $01
$12:a34d  bc c0 20	  ldy $20c0,x
$12:a350  c0 c6		 cpy #$c6
$12:a352  5f 05 30 aa   eor $aa3005,x
$12:a356  8a			txa
$12:a357  1d 26 87	  ora $8726,x
$12:a35a  c8			iny
$12:a35b  23 f2		 and $f2,s
$12:a35d  08			php
$12:a35e  ec 42 78	  cpx $7842
$12:a361  b6 08		 ldx $08,y
$12:a363  7c 41 10	  jmp ($1041,x)
$12:a366  31 95		 and ($95),y
$12:a368  90 ac		 bcc $a316
$12:a36a  c2 5f		 rep #$5f
$12:a36c  10 62		 bpl $a3d0
$12:a36e  84 40		 sty $40
$12:a370  16 50		 asl $50,x
$12:a372  0e 44 22	  asl $2244
$12:a375  d1 00		 cmp ($00),y
$12:a377  d8			cld
$12:a378  46 30		 lsr $30
$12:a37a  12 0e		 ora ($0e)
$12:a37c  c5 c3		 cmp $c3
$12:a37e  b0 92		 bcs $a312
$12:a380  00 f0		 brk #$f0
$12:a382  29 8a 11	  and #$118a
$12:a385  e0 8c 76	  cpx #$768c
$12:a388  24 18		 bit $18
$12:a38a  0b			phd
$12:a38b  05 83		 ora $83
$12:a38d  00 1b		 brk #$1b
$12:a38f  07 65		 ora [$65]
$12:a391  40			rti
$12:a392  a0 d0 08	  ldy #$08d0
$12:a395  64 12		 stz $12
$12:a397  38			sec
$12:a398  ec 88 0c	  cpx $0c88
$12:a39b  1e 07 0f	  asl $0f07,x
$12:a39e  81 91		 sta ($91,x)
$12:a3a0  c1 d8		 cmp ($d8,x)
$12:a3a2  f4 0a 04	  pea $040a
$12:a3a5  82 40 c8	  brl $6be8
$12:a3a8  07 64		 ora [$64]
$12:a3aa  27 03		 and [$03]
$12:a3ac  81 e0		 sta ($e0,x)
$12:a3ae  f0 7c		 beq $a42c
$12:a3b0  2d f0 8a	  and $8af0
$12:a3b3  3d 0e 17	  and $170e,x
$12:a3b6  38			sec
$12:a3b7  8e 4b 20	  stx $204b
$12:a3ba  90 c8		 bcc $a384
$12:a3bc  8c 5e 49	  sty $495e
$12:a3bf  20 af d0	  jsr $d0af
$12:a3c2  12 61		 ora ($61)
$12:a3c4  3f 81 9f 42   and $429f81,x
$12:a3c8  67 30		 adc [$30]
$12:a3ca  81 c0		 sta ($c0,x)
$12:a3cc  21 10		 and ($10,x)
$12:a3ce  00 70		 brk #$70
$12:a3d0  21 c3		 and ($c3,x)
$12:a3d2  e1 30		 sbc ($30,x)
$12:a3d4  e4 60		 cpx $60
$12:a3d6  37 92		 and [$92],y
$12:a3d8  08			php
$12:a3d9  44 83 81	  mvp $81,$83
$12:a3dc  f8			sed
$12:a3dd  8c 77 29	  sty $2977
$12:a3e0  90 cf		 bcc $a3b1
$12:a3e2  41 20		 eor ($20,x)
$12:a3e4  7f 98 0e e4   adc $e40e98,x
$12:a3e8  00 c6		 brk #$c6
$12:a3ea  01 70		 ora ($70,x)
$12:a3ec  96 43		 stx $43,y
$12:a3ee  14 e0		 trb $e0
$12:a3f0  a3 07		 lda $07,s
$12:a3f2  65 7d		 adc $7d
$12:a3f4  22 9e 89 03   jsl $03899e
$12:a3f8  b2 89		 lda ($89)
$12:a3fa  20 fe 08	  jsr $08fe
$12:a3fd  1c 12 13	  trb $1312
$12:a400  06 83		 asl $83
$12:a402  c3 20		 cmp $20,s
$12:a404  50 48		 bvc $a44e
$12:a406  2c 3e 23	  bit $233e
$12:a409  16 86		 asl $86,x
$12:a40b  c1 e6		 cmp ($e6,x)
$12:a40d  8c b1 87	  sty $87b1
$12:a410  c3 a1		 cmp $a1,s
$12:a412  f0 c8		 beq $a3dc
$12:a414  58			cli
$12:a415  98			tya
$12:a416  61 30		 adc ($30,x)
$12:a418  09 dc 0e	  ora #$0edc
$12:a41b  ff 0f f0 40   sbc $40f00f,x
$12:a41f  34 14		 bit $14,x
$12:a421  06 a8		 asl $a8
$12:a423  40			rti
$12:a424  0f c1 40 88   ora $8840c1
$12:a428  74 16		 stz $16,x
$12:a42a  21 58		 and ($58,x)
$12:a42c  6a			ror a
$12:a42d  84 83		 sty $83
$12:a42f  40			rti
$12:a430  56 08		 lsr $08,x
$12:a432  03 74		 ora $74,s
$12:a434  1d 60 7e	  ora $7e60,x
$12:a437  0d c6 02	  ora $02c6
$12:a43a  f9 00 8b	  sbc $8b00,y
$12:a43d  c6 e9		 dec $e9
$12:a43f  f4 f9 35	  pea $35f9
$12:a442  be 07 64	  ldx $6407,y
$12:a445  8c dd a6	  sty $a6dd
$12:a448  f6 c9		 inc $c9,x
$12:a44a  95 11		 sta $11,x
$12:a44c  2e 11 ab	  rol $ab11
$12:a44f  fd 3e 7f	  sbc $7f3e,x
$12:a452  6f 8f d8 22   adc $22d88f
$12:a456  17 f8		 ora [$f8],y
$12:a458  75 be		 adc $be,x
$12:a45a  d9 6b b0	  cmp $b06b,y
$12:a45d  1b			tcs
$12:a45e  9a			txs
$12:a45f  05 06		 ora $06
$12:a461  82 c3 21	  brl $c627
$12:a464  51 a8		 eor ($a8),y
$12:a466  3c 5d f6	  bit $f65d,x
$12:a469  06 e4		 asl $e4
$12:a46b  80 a3		 bra $a410
$12:a46d  82 01 05	  brl $a971
$12:a470  24 09		 bit $09
$12:a472  24 04		 bit $04
$12:a474  6d 40 b0	  adc $b040
$12:a477  68			pla
$12:a478  26 16		 rol $16
$12:a47a  09 82 e0	  ora #$e082
$12:a47d  0c c2 1f	  tsb $1fc2
$12:a480  36 38		 rol $38,x
$12:a482  30 c9		 bmi $a44d
$12:a484  5e 10 08	  lsr $0810,x
$12:a487  85 82		 sta $82
$12:a489  03 46		 ora $46,s
$12:a48b  8e 42 e1	  stx $e142
$12:a48e  30 48		 bmi $a4d8
$12:a490  7c 12 05	  jmp ($0512,x)
$12:a493  01 83		 ora ($83,x)
$12:a495  40			rti
$12:a496  20 86 70	  jsr $7086
$12:a499  b8			clv
$12:a49a  40			rti
$12:a49b  6c 30 18	  jmp ($1830)
$12:a49e  24 04		 bit $04
$12:a4a0  0a			asl a
$12:a4a1  04 41		 tsb $41
$12:a4a3  81 01		 sta ($01,x)
$12:a4a5  c1 62		 cmp ($62,x)
$12:a4a7  1c 05 78	  trb $7805
$12:a4aa  48			pha
$12:a4ab  30 1a		 bmi $a4c7
$12:a4ad  01 60		 ora ($60,x)
$12:a4af  50 16		 bvc $a4c7
$12:a4b1  40			rti
$12:a4b2  b7 0a		 lda [$0a],y
$12:a4b4  02 98		 cop #$98
$12:a4b6  78			sei
$12:a4b7  06 20		 asl $20
$12:a4b9  28			plp
$12:a4ba  03 0c		 ora $0c,s
$12:a4bc  16 40		 asl $40,x
$12:a4be  c5 20		 cmp $20
$12:a4c0  f9 40 60	  sbc $6040,y
$12:a4c3  70 c5		 bvs $a48a
$12:a4c5  00 42		 brk #$42
$12:a4c7  e0 50 b9	  cpx #$b950
$12:a4ca  ac 06 48	  ldy $4806
$12:a4cd  05 00		 ora $00
$12:a4cf  f9 40 d0	  sbc $d040,y
$12:a4d2  80 06		 bra $a4da
$12:a4d4  08			php
$12:a4d5  3c 02 7b	  bit $7b02,x
$12:a4d8  02 9f		 cop #$9f
$12:a4da  1f 84 b0 1e   ora $1eb084,x
$12:a4de  05 88		 ora $88
$12:a4e0  40			rti
$12:a4e1  2c 0c 20	  bit $200c
$12:a4e4  61 08		 adc ($08,x)
$12:a4e6  a8			tay
$12:a4e7  44 67 a0	  mvp $a0,$67
$12:a4ea  c0 29 81	  cpy #$8129
$12:a4ed  02 29		 cop #$29
$12:a4ef  50 63		 bvc $a554
$12:a4f1  94 43		 sty $43,x
$12:a4f3  c7 20		 cmp [$20]
$12:a4f5  d2 cf		 cmp ($cf)
$12:a4f7  a1 70		 lda ($70,x)
$12:a4f9  a8			tay
$12:a4fa  2c 36 08	  bit $0836
$12:a4fd  86 11		 stx $11
$12:a4ff  70 3b		 bvs $a53c
$12:a501  03 a0		 ora $a0,s
$12:a503  2a			rol a
$12:a504  11 f0		 ora ($f0),y
$12:a506  40			rti
$12:a507  85 c0		 sta $c0
$12:a509  3e 05 f0	  rol $f005,x
$12:a50c  93 c2		 sta ($c2,s),y
$12:a50e  c0 2d 1e	  cpy #$1e2d
$12:a511  07 43		 ora [$43]
$12:a513  21 70		 and ($70,x)
$12:a515  f0 48		 beq $a55f
$12:a517  2f 06 d4 f0   and $f0d406
$12:a51b  39 02 61	  and $6102,y
$12:a51e  e0 b8 40	  cpx #$40b8
$12:a521  25 11		 and $11
$12:a523  09 c6 02	  ora #$02c6
$12:a526  29 1c 89	  and #$891c
$12:a529  47 a3		 eor [$a3]
$12:a52b  31 f8		 and ($f8),y
$12:a52d  1c 4e 11	  trb $114e
$12:a530  18			clc
$12:a531  83 43		 sta $43,s
$12:a533  a0 b0 32	  ldy #$32b0
$12:a536  38			sec
$12:a537  40			rti
$12:a538  e3 f0		 sbc $f0,s
$12:a53a  18			clc
$12:a53b  fc 02 3f	  jsr ($3f02,x)
$12:a53e  0c 8f c1	  tsb $c18f
$12:a541  c0 01 0f	  cpy #$0f01
$12:a544  80 41		 bra $a587
$12:a546  c8			iny
$12:a547  c2 5c		 rep #$5c
$12:a549  1e 07 03	  asl $0307,x
$12:a54c  01 90		 ora ($90,x)
$12:a54e  90 4c		 bcc $a59c
$12:a550  0a			asl a
$12:a551  20 5a 18	  jsr $185a
$12:a554  07 c3		 ora [$c3]
$12:a556  e1 b0		 sbc ($b0,x)
$12:a558  f8			sed
$12:a559  4c 3e 16	  jmp $163e
$12:a55c  0f 87 03 e0   ora $e00387
$12:a560  57 04		 eor [$04],y
$12:a562  e9 5d e0	  sbc #$e05d
$12:a565  72 b8		 adc ($b8)
$12:a567  44 22 71	  mvp $71,$22
$12:a56a  14 96		 trb $96
$12:a56c  4c 66 f4	  jmp $f466
$12:a56f  ca			dex
$12:a570  04 de		 tsb $de
$12:a572  01 6d		 ora ($6d,x)
$12:a574  80 5f		 bra $a5d5
$12:a576  e0 77 70	  cpx #$7077
$12:a579  58			cli
$12:a57a  40			rti
$12:a57b  26 73		 rol $73
$12:a57d  08			php
$12:a57e  44 02 7e	  mvp $7e,$02
$12:a581  3e 02 50	  rol $5002,x
$12:a584  ed 20 1d	  sbc $1d20
$12:a587  c8			iny
$12:a588  27 62		 and [$62]
$12:a58a  01 ec		 ora ($ec,x)
$12:a58c  82 79 20	  brl $c608
$12:a58f  1f 88 83 0c   ora $0c8388,x
$12:a593  bf 85 80 2f   lda $2f8085,x
$12:a597  19 84 1a	  ora $1a84,y
$12:a59a  80 d4		 bra $a570
$12:a59c  12 80		 ora ($80)
$12:a59e  61 35		 adc ($35,x)
$12:a5a0  92 c9		 sta ($c9)
$12:a5a2  04 e2		 tsb $e2
$12:a5a4  81 60		 sta ($60,x)
$12:a5a6  8c 76 2c	  sty $2c76
$12:a5a9  85 21		 sta $21
$12:a5ab  b6 16		 ldx $16,y
$12:a5ad  03 00		 ora $00,s
$12:a5af  c3 25		 cmp $25,s
$12:a5b1  71 18		 adc ($18),y
$12:a5b3  48			pha
$12:a5b4  be 16 c8	  ldx $c816,y
$12:a5b7  7d 66 0d	  adc $0d66,x
$12:a5ba  1b			tcs
$12:a5bb  80 5e		 bra $a61b
$12:a5bd  e0 15 38	  cpx #$3815
$12:a5c0  04 8e		 tsb $8e
$12:a5c2  01 19		 ora ($19,x)
$12:a5c4  21 0d		 and ($0d,x)
$12:a5c6  fa			plx
$12:a5c7  1d 79 25	  ora $2579,x
$12:a5ca  09 24 09	  ora #$0924
$12:a5cd  20 02 02	  jsr $0202
$12:a5d0  18			clc
$12:a5d1  32 83		 and ($83)
$12:a5d3  d9 80 ba	  cmp $ba80,y
$12:a5d6  40			rti
$12:a5d7  36 10		 rol $10,x
$12:a5d9  0d e4 03	  ora $03e4
$12:a5dc  29 00 c4	  and #$c400
$12:a5df  40			rti
$12:a5e0  26 05		 rol $05
$12:a5e2  c1 be		 cmp ($be,x)
$12:a5e4  22 8c ca 42   jsl $42ca8c
$12:a5e8  80 41		 bra $a62b
$12:a5ea  83 32		 sta $32,s
$12:a5ec  22 11 08 c4   jsl $c40811
$12:a5f0  42 39		 wdm #$39
$12:a5f2  38			sec
$12:a5f3  9b			txy
$12:a5f4  cf 19 d0 d6   cmp $d6d019
$12:a5f8  09 04 62	  ora #$6204
$12:a5fb  71 04		 adc ($04),y
$12:a5fd  83 cb		 sta $cb,s
$12:a5ff  e2 30		 sep #$30
$12:a601  78			sei
$12:a602  64 82		 stz $82
$12:a604  37 04		 and [$04],y
$12:a606  8d c5 61	  sta $61c5
$12:a609  91 d8		 sta ($d8),y
$12:a60b  0c 2a 01	  tsb $012a
$12:a60e  0c 74 04	  tsb $0474
$12:a611  e1 50		 sbc ($50,x)
$12:a613  30 48		 bmi $a65d
$12:a615  54 7a 37	  mvn $37,$7a
$12:a618  1e 8f c3	  asl $c38f,x
$12:a61b  21 ef		 and ($ef,x)
$12:a61d  d0 a0		 bne $a5bf
$12:a61f  44 2a 11	  mvp $11,$2a
$12:a622  8f 07 a3 41   sta $41a307
$12:a626  88			dey
$12:a627  f8			sed
$12:a628  4e 19 20	  lsr $2019
$12:a62b  cc 23 49	  cpy $4923
$12:a62e  3a			dec a
$12:a62f  02 e0		 cop #$e0
$12:a631  cc 78 1c	  cpy $1c78
$12:a634  02 0d		 cop #$0d
$12:a636  00 8e		 brk #$8e
$12:a638  41 a7		 eor ($a7,x)
$12:a63a  d0 12		 bne $a64e
$12:a63c  48			pha
$12:a63d  4f a0 51 d8   eor $d851a0
$12:a641  2a			rol a
$12:a642  ac 05 e0	  ldy $e005
$12:a645  2f 18 0c 05   and $050c18
$12:a649  58			cli
$12:a64a  30 28		 bmi $a674
$12:a64c  0c 16 04	  tsb $0416
$12:a64f  ac 1c 05	  ldy $051c
$12:a652  03 01		 ora $01,s
$12:a654  b0 e0		 bcs $a636
$12:a656  6e 0a 83	  ror $830a
$12:a659  f8			sed
$12:a65a  e0 14		 cpx #$14
$12:a65c  c1 96		 cmp ($96,x)
$12:a65e  88			dey
$12:a65f  30 31		 bmi $a692
$12:a661  b2 b0		 lda ($b0)
$12:a663  21 f0		 and ($f0,x)
$12:a665  18			clc
$12:a666  74 76		 stz $76,x
$12:a668  53 2e		 eor ($2e,s),y
$12:a66a  52 a0		 eor ($a0)
$12:a66c  30 08		 bmi $a676
$12:a66e  a5 1c		 lda $1c
$12:a670  80 4b		 bra $a6bd
$12:a672  9d 00 cc	  sta $cc00,x
$12:a675  72 e0		 adc ($e0)
$12:a677  50 2c		 bvc $a6a5
$12:a679  14 0b		 trb $0b
$12:a67b  86 82		 stx $82
$12:a67d  61 c0		 adc ($c0,x)
$12:a67f  9c 76 2b	  stz $2b76
$12:a682  1b			tcs
$12:a683  0d c0 64	  ora $64c0
$12:a686  b0 10		 bcs $a698
$12:a688  0c 82 e8	  tsb $e882
$12:a68b  28			plp
$12:a68c  00 10		 brk #$10
$12:a68e  ac 48 37	  ldy $3748
$12:a691  14 00		 trb $00
$12:a693  e0 42		 cpx #$42
$12:a695  21 10		 and ($10,x)
$12:a697  78			sei
$12:a698  7c 16 0d	  jmp ($0d16,x)
$12:a69b  15 38		 ora $38,x
$12:a69d  84 1a		 sty $1a
$12:a69f  6f 16 96 cb   adc $cb9616
$12:a6a3  80 60		 bra $a705
$12:a6a5  3d 00 e0	  and $e000,x
$12:a6a8  41 a1		 eor ($a1,x)
$12:a6aa  10 e1		 bpl $a68d
$12:a6ac  80 c5		 bra $a673
$12:a6ae  a1 08		 lda ($08,x)
$12:a6b0  33 a0		 and ($a0,s),y
$12:a6b2  54 30 1d	  mvn $1d,$30
$12:a6b5  88			dey
$12:a6b6  00 64		 brk #$64
$12:a6b8  3f 0d 61 0c   and $0c610d,x
$12:a6bc  81 ac		 sta ($ac,x)
$12:a6be  37 10		 and [$10],y
$12:a6c0  08			php
$12:a6c1  c3 80		 cmp $80,s
$12:a6c3  5c 9d 01 81   jml $81019d
$12:a6c7  c0 a0		 cpy #$a0
$12:a6c9  d0 28		 bne $a6f3
$12:a6cb  74 1e		 stz $1e,x
$12:a6cd  17 0b		 ora [$0b],y
$12:a6cf  8b			phb
$12:a6d0  bb			tyx
$12:a6d1  5c f8 68 57   jml $5768f8
$12:a6d5  50 81		 bvc $a658
$12:a6d7  44 24 1e	  mvp $1e,$24
$12:a6da  09 05		 ora #$05
$12:a6dc  01 08		 ora ($08,x)
$12:a6de  ea			nop
$12:a6df  10 31		 bpl $a712
$12:a6e1  97 81		 sta [$81],y
$12:a6e3  c9 32		 cmp #$32
$12:a6e5  f9 81 e4	  sbc $e481,y
$12:a6e8  35 fb		 and $fb,x
$12:a6ea  04 2c		 tsb $2c
$12:a6ec  74 3c		 stz $3c,x
$12:a6ee  04 a0		 tsb $a0
$12:a6f0  a8			tay
$12:a6f1  0b			phd
$12:a6f2  67 d1		 adc [$d1]
$12:a6f4  18			clc
$12:a6f5  4e 87 aa	  lsr $aa87
$12:a6f8  34 85		 bit $85,x
$12:a6fa  88			dey
$12:a6fb  b4 38		 ldy $38,x
$12:a6fd  d4 11		 pei ($11)
$12:a6ff  46 28		 lsr $28
$12:a701  23 05		 and $05,s
$12:a703  98			tya
$12:a704  0c c0 1e	  tsb $1ec0
$12:a707  86 7f		 stx $7f
$12:a709  c1 0f		 cmp ($0f,x)
$12:a70b  b0 73		 bcs $a780
$12:a70d  c1 86		 cmp ($86,x)
$12:a70f  4a			lsr a
$12:a710  12 60		 ora ($60)
$12:a712  c8			iny
$12:a713  38			sec
$12:a714  16 01		 asl $01,x
$12:a716  64 f9		 stz $f9
$12:a718  22 8d 50 f0   jsl $f0508d
$12:a71c  44 39 53	  mvp $53,$39
$12:a71f  a0 63		 ldy #$63
$12:a721  46 21		 lsr $21
$12:a723  86 a0		 stx $a0
$12:a725  8f 1b 14 18   sta $18141b
$12:a729  d4 fa		 pei ($fa)
$12:a72b  80 ec		 bra $a719
$12:a72d  1c 95 30	  trb $3095
$12:a730  b0 12		 bcs $a744
$12:a732  80 18		 bra $a74c
$12:a734  c7 32		 cmp [$32]
$12:a736  2e 87 c9	  rol $c987
$12:a739  5c e6 a1 36   jml $36a1e6
$12:a73d  0c 22 0c	  tsb $0c22
$12:a740  24 0a		 bit $0a
$12:a742  00 a8		 brk #$a8
$12:a744  30 0f		 bmi $a755
$12:a746  10 78		 bpl $a7c0
$12:a748  8c 00 5a	  sty $5a00
$12:a74b  0f 52 7a a0   ora $a07a52
$12:a74f  a4 8b		 ldy $8b
$12:a751  60			rts
$12:a752  0c 28 3c	  tsb $3c28
$12:a755  02 1e		 cop #$1e
$12:a757  10 08		 bpl $a761
$12:a759  44 02 11	  mvp $11,$02
$12:a75c  0b			phd
$12:a75d  8d 42 63	  sta $6342
$12:a760  51 b8		 eor ($b8),y
$12:a762  62 e0 43	  per $eb45
$12:a765  e6 11		 inc $11
$12:a767  08			php
$12:a768  24 00		 bit $00
$12:a76a  3c 01 e4	  bit $e401,x
$12:a76d  08			php
$12:a76e  c4 06		 cpy $06
$12:a770  24 1f		 bit $1f
$12:a772  61 2b		 adc ($2b,x)
$12:a774  07 c9		 ora [$c9]
$12:a776  f2 5c		 sbc ($5c)
$12:a778  09 03		 ora #$03
$12:a77a  28			plp
$12:a77b  7e 12 00	  ror $0012,x
$12:a77e  5a			phy
$12:a77f  13 94		 ora ($94,s),y
$12:a781  b0 08		 bcs $a78b
$12:a783  b0 0f		 bcs $a794
$12:a785  a4 06		 ldy $06
$12:a787  03 02		 ora $02,s
$12:a789  3b			tsc
$12:a78a  84 1a		 sty $1a
$12:a78c  09 06		 ora #$06
$12:a78e  8c 46 8d	  sty $8d46
$12:a791  cf 03 84 c3   cmp $c38403
$12:a795  d1 21		 cmp ($21),y
$12:a797  05 5e		 ora $5e
$12:a799  bd 02 c1	  lda $c102,x
$12:a79c  50 a8		 bvc $a746
$12:a79e  60			rts
$12:a79f  30 1e		 bmi $a7bf
$12:a7a1  8f 41 8d 78   sta $788d41
$12:a7a5  19 0f 86	  ora $860f,y
$12:a7a8  83 e1		 sta $e1,s
$12:a7aa  78			sei
$12:a7ab  fc 44 3f	  jsr ($3f44,x)
$12:a7ae  03 f7		 ora $f7,s
$12:a7b0  81 40		 sta ($40,x)
$12:a7b2  60			rts
$12:a7b3  b0 a7		 bcs $a75c
$12:a7b5  50 45		 bvc $a7fc
$12:a7b7  83 ec		 sta $ec,s
$12:a7b9  87 08		 sta [$08]
$12:a7bb  14 1e		 trb $1e
$12:a7bd  02 8a		 cop #$8a
$12:a7bf  04 73		 tsb $73
$12:a7c1  a6 c2		 ldx $c2
$12:a7c3  21 30		 and ($30,x)
$12:a7c5  a0 50		 ldy #$50
$12:a7c7  31 18		 and ($18),y
$12:a7c9  84 7b		 sty $7b
$12:a7cb  a9 43		 lda #$43
$12:a7cd  e1 b8		 sbc ($b8,x)
$12:a7cf  fc 5c 3f	  jsr ($3f5c,x)
$12:a7d2  10 98		 bpl $a76c
$12:a7d4  bb			tyx
$12:a7d5  bc 22 91	  ldy $9122,x
$12:a7d8  b8			clv
$12:a7d9  f4 39 74	  pea $7439
$12:a7dc  10 48		 bpl $a826
$12:a7de  5c 36 0f 06   jml $060f36
$12:a7e2  81 1b		 sta ($1b,x)
$12:a7e4  d5 6e		 cmp $6e,x
$12:a7e6  0f b0 86 c0   ora $c086b0
$12:a7ea  e1 f0		 sbc ($f0,x)
$12:a7ec  18			clc
$12:a7ed  3d 02 20	  and $2002,x
$12:a7f0  0f 0d 06 83   ora $83060d
$12:a7f4  a0 96		 ldy #$96
$12:a7f6  0d 05 03	  ora $0305
$12:a7f9  01 20		 ora ($20,x)
$12:a7fb  c0 50		 cpy #$50
$12:a7fd  0a			asl a
$12:a7fe  82 55 0a	  brl $b256
$12:a801  81 50		 sta ($50,x)
$12:a803  70 16		 bvs $a81b
$12:a805  0f 05 83 81   ora $818305
$12:a809  e0 c0		 cpx #$c0
$12:a80b  70 21		 bvs $a82e
$12:a80d  f7 08		 sbc [$08],y
$12:a80f  55 9b		 eor $9b,x
$12:a811  9b			txy
$12:a812  03 06		 ora $06,s
$12:a814  87 82		 sta [$82]
$12:a816  40			rti
$12:a817  1d 05 81	  ora $8105,x
$12:a81a  6c 38 16	  jmp ($1638)
$12:a81d  12 a0		 ora ($a0)
$12:a81f  42 3c		 wdm #$3c
$12:a821  10 73		 bpl $a896
$12:a823  48			pha
$12:a824  1a			inc a
$12:a825  41 60		 eor ($60,x)
$12:a827  5c 89 e6 22   jml $22e689
$12:a82b  51 66		 eor ($66),y
$12:a82d  a6 61		 ldx $61
$12:a82f  38			sec
$12:a830  10 a8		 bpl $a7da
$12:a832  44 18 0c	  mvp $0c,$18
$12:a835  09 41		 ora #$41
$12:a837  8d 41 b9	  sta $b941
$12:a83a  10 4c		 bpl $a888
$12:a83c  74 82		 stz $82,x
$12:a83e  1d c0 2c	  ora $2cc0,x
$12:a841  81 9c		 sta ($9c,x)
$12:a843  92 81		 sta ($81)
$12:a845  0a			asl a
$12:a846  83 7b		 sta $7b,s
$12:a848  64 74		 stz $74
$12:a84a  18			clc
$12:a84b  3a			dec a
$12:a84c  bd e0 1e	  lda $1ee0,x
$12:a84f  12 40		 ora ($40)
$12:a851  42 38		 wdm #$38
$12:a853  07 49		 ora [$49]
$12:a855  c4 4b		 cpy $4b
$12:a857  2d 14 8c	  and $8c14
$12:a85a  27 30		 and [$30]
$12:a85c  b2 10		 lda ($10)
$12:a85e  82 c0 96	  brl $3f21
$12:a861  42 09		 wdm #$09
$12:a863  00 e5		 brk #$e5
$12:a865  41 b1		 eor ($b1,x)
$12:a867  12 48		 ora ($48)
$12:a869  67 02		 adc [$02]
$12:a86b  1c 68 33	  trb $3368
$12:a86e  39 43 e2	  and $e243,y
$12:a871  1a			inc a
$12:a872  fd 80 c4	  sbc $c480,x
$12:a875  21 b6		 and ($b6,x)
$12:a877  3e 09 d0	  rol $d009,x
$12:a87a  46 e5		 lsr $e5
$12:a87c  f0 f0		 beq $a86e
$12:a87e  54 3c 1a	  mvn $1a,$3c
$12:a881  1e 05 80	  asl $8005,x
$12:a884  88			dey
$12:a885  22 50 23 97   jsl $972350
$12:a889  82 19 ce	  brl $76a5
$12:a88c  91 61		 sta ($61),y
$12:a88e  24 96		 bit $96
$12:a890  ca			dex
$12:a891  40			rti
$12:a892  b4 0e		 ldy $0e,x
$12:a894  a8			tay
$12:a895  a5 08		 lda $08
$12:a897  62 78 20	  per $c912
$12:a89a  18			clc
$12:a89b  69 03		 adc #$03
$12:a89d  28			plp
$12:a89e  4e a7 40	  lsr $40a7
$12:a8a1  77 f0		 adc [$f0],y
$12:a8a3  58			cli
$12:a8a4  00 17		 brk #$17
$12:a8a6  33 86		 and ($86,s),y
$12:a8a8  4b			phk
$12:a8a9  e3 93		 sbc $93,s
$12:a8ab  b8			clv
$12:a8ac  e4 9e		 cpx $9e
$12:a8ae  11 1f		 ora ($1f),y
$12:a8b0  80 1d		 bra $a8cf
$12:a8b2  11 c2		 ora ($c2),y
$12:a8b4  11 c1		 ora ($c1),y
$12:a8b6  00 c2		 brk #$c2
$12:a8b8  22 07 56 85   jsl $855607
$12:a8bc  c6 27		 dec $27
$12:a8be  70 c1		 bvs $a881
$12:a8c0  88			dey
$12:a8c1  03 d2		 ora $d2,s
$12:a8c3  0d 08 0e	  ora $0e08
$12:a8c6  90 fd		 bcc $a8c5
$12:a8c8  04 2d		 tsb $2d
$12:a8ca  d8			cld
$12:a8cb  98			tya
$12:a8cc  6a			ror a
$12:a8cd  2c 1f 88	  bit $881f
$12:a8d0  01 4c		 ora ($4c,x)
$12:a8d2  3e 10 0c	  rol $0c10,x
$12:a8d5  01 d4		 ora ($d4,x)
$12:a8d7  e6 10		 inc $10
$12:a8d9  0b			phd
$12:a8da  00 99		 brk #$99
$12:a8dc  c5 67		 cmp $67
$12:a8de  0f 83 c5 e2   ora $e2c583
$12:a8e2  71 f8		 adc ($f8),y
$12:a8e4  74 46		 stz $46,x
$12:a8e6  3f 08 df e2   and $e2df08,x
$12:a8ea  ef b0 bb 7c   sbc $7cbbb0
$12:a8ee  52 2d		 eor ($2d)
$12:a8f0  1f 85 c7 e2   ora $e2c785,x
$12:a8f4  b1 f8		 lda ($f8),y
$12:a8f6  bc 66 0f	  ldy $0f66,x
$12:a8f9  09 b3		 ora #$b3
$12:a8fb  c3 fc		 cmp $fc,s
$12:a8fd  f0 ff		 beq $a8fe
$12:a8ff  9c 1f 61	  stz $611f
$12:a902  f0 e0		 beq $a8e4
$12:a904  74 11		 stz $11,x
$12:a906  e3 30		 sbc $30,s
$12:a908  e8			inx
$12:a909  40			rti
$12:a90a  3b			tsc
$12:a90b  58			cli
$12:a90c  2a			rol a
$12:a90d  e6 03		 inc $03
$12:a90f  59 10 e0	  eor $e010,y
$12:a912  7c 34 1f	  jmp ($1f34,x)
$12:a915  0a			asl a
$12:a916  87 c3		 sta [$c3]
$12:a918  a1 30		 lda ($30,x)
$12:a91a  5d 87 b3	  eor $b387,x
$12:a91d  c1 ee		 cmp ($ee,x)
$12:a91f  f0 77		 beq $a998
$12:a921  b8			clv
$12:a922  11 88		 ora ($88),y
$12:a924  d4 0e		 pei ($0e)
$12:a926  2f 17 8f c3   and $c38f17
$12:a92a  e2 f1		 sep #$f1
$12:a92c  e8			inx
$12:a92d  4d 7e b1	  eor $b17e
$12:a930  3f 81 c9 60   and $60c981,x
$12:a934  70 53		 bvs $a989
$12:a936  a0 21		 ldy #$21
$12:a938  02 3e		 cop #$3e
$12:a93a  76 04		 ror $04,x
$12:a93c  38			sec
$12:a93d  49 e1		 eor #$e1
$12:a93f  37 78		 and [$78],y
$12:a941  7d ee 0f	  adc $0fee,x
$12:a944  a0 d0		 ldy #$d0
$12:a946  60			rts
$12:a947  3a			dec a
$12:a948  1f 04 80 29   ora $298004,x
$12:a94c  02 01		 cop #$01
$12:a94e  d4 8a		 pei ($8a)
$12:a950  7e 30 14	  ror $1430,x
$12:a953  8c 05 63	  sty $6305
$12:a956  f1 e0		 sbc ($e0),y
$12:a958  52 07		 eor ($07)
$12:a95a  c2 21		 rep #$21
$12:a95c  f0 53		 beq $a9b1
$12:a95e  87 a2		 sta [$a2]
$12:a960  41 dc		 eor ($dc,x)
$12:a962  f0 6f		 beq $a9d3
$12:a964  38			sec
$12:a965  06 54		 asl $54
$12:a967  80 c0		 bra $a929
$12:a969  e0 50		 cpx #$50
$12:a96b  68			pla
$12:a96c  14 3a		 trb $3a
$12:a96e  0f 0b 85 c5   ora $c5850b
$12:a972  cc ad 01	  cpy $01ad
$12:a975  03 08		 ora $08,s
$12:a977  2a			rol a
$12:a978  4b			phk
$12:a979  21 40		 and ($40,x)
$12:a97b  c0 48		 cpy #$48
$12:a97d  14 e1		 trb $e1
$12:a97f  40			rti
$12:a980  31 39		 and ($39),y
$12:a982  64 1d		 stz $1d
$12:a984  c0 ee		 cpy #$ee
$12:a986  0f 00 2a 77   ora $772a00
$12:a98a  fb			xce
$12:a98b  08			php
$12:a98c  7c 42 6f	  jmp ($6f42,x)
$12:a98f  28			plp
$12:a990  32 c5		 and ($c5)
$12:a992  41 c2		 eor ($c2,x)
$12:a994  1e 0e 00	  asl $000e,x
$12:a997  b6 7f		 ldx $7f,y
$12:a999  51 af		 eor ($af),y
$12:a99b  04 43		 tsb $43
$12:a99d  b0 3e		 bcs $a9dd
$12:a99f  98			tya
$12:a9a0  a4 3a		 ldy $3a
$12:a9a2  3d 0e 83	  and $830e,x
$12:a9a5  43 81		 eor $81,s
$12:a9a7  6d 30 90	  adc $9030
$12:a9aa  07 83		 ora [$83]
$12:a9ac  1f 90 9f 8b   ora $8b9f90,x
$12:a9b0  5c 9a 08 80   jml $80089a
$12:a9b4  b8			clv
$12:a9b5  0b			phd
$12:a9b6  40			rti
$12:a9b7  5b			tcd
$12:a9b8  42 c1		 wdm #$c1
$12:a9ba  2c 82 3e	  bit $3e82
$12:a9bd  8c e4 0b	  sty $0be4
$12:a9c0  88			dey
$12:a9c1  78			sei
$12:a9c2  e0 60		 cpx #$60
$12:a9c4  f1 84		 sbc ($84),y
$12:a9c6  7d 12 48	  adc $4812,x
$12:a9c9  16 91		 asl $91,x
$12:a9cb  88			dey
$12:a9cc  40			rti
$12:a9cd  78			sei
$12:a9ce  3c 51 2f	  bit $2f51,x
$12:a9d1  c4 3b		 cpy $3b
$12:a9d3  89 26 05	  bit #$0526
$12:a9d6  a1 b4		 lda ($b4,x)
$12:a9d8  1c c1 1c	  trb $1cc1
$12:a9db  37 04		 and [$04],y
$12:a9dd  3a			dec a
$12:a9de  09 08 02	  ora #$0208
$12:a9e1  04 1d		 tsb $1d
$12:a9e3  70 30		 bvs $aa15
$12:a9e5  f6 a8		 inc $a8,x
$12:a9e7  46 20		 lsr $20
$12:a9e9  f1 68		 sbc ($68),y
$12:a9eb  0c 4a 37	  tsb $374a
$12:a9ee  0c 12 83	  tsb $8312
$12:a9f1  fd 1e 20	  sbc $201e,x
$12:a9f4  ee 07 f0	  inc $f007
$12:a9f7  3f 91 e2 d1   and $d1e291,x
$12:a9fb  18			clc
$12:a9fc  b4 46		 ldy $46,x
$12:a9fe  24 c0		 bit $c0
$12:aa00  80 3a		 bra $aa3c
$12:aa02  31 cb		 and ($cb),y
$12:aa04  80 9a		 bra $a9a0
$12:aa06  1f 01 dc 26   ora $26dc01,x
$12:aa0a  0c b0 f0	  tsb $f0b0
$12:aa0d  2f a4 66 0d   and $0d66a4
$12:aa11  31 63		 and ($63),y
$12:aa13  94 3a		 sty $3a,x
$12:aa15  18			clc
$12:aa16  fe 72 71	  inc $7172,x
$12:aa19  82 82 05	  brl $af9e
$12:aa1c  00 82		 brk #$82
$12:aa1e  30 1b		 bmi $aa3b
$12:aa20  5f 3b f3 c7   eor $c7f33b,x
$12:aa24  2a			rol a
$12:aa25  7c f9 47	  jmp ($47f9,x)
$12:aa28  5f d3 7f 94   eor $947fd3,x
$12:aa2c  5e 21 71	  lsr $7121,x
$12:aa2f  a3 d8		 lda $d8,s
$12:aa31  76 20		 ror $20,x
$12:aa33  7d ce 07	  adc $07ce,x
$12:aa36  3f 81 e7 f4   and $f4e781,x
$12:aa3a  78			sei
$12:aa3b  3c f6 7b	  bit $7bf6,x
$12:aa3e  01 98		 ora ($98,x)
$12:aa40  0c c1 18	  tsb $18c1
$12:aa43  8d 40 e2	  sta $e240
$12:aa46  f1 78		 sbc ($78),y
$12:aa48  fc 3e 2f	  jsr ($2f3e,x)
$12:aa4b  be c4 fd	  ldx $fdc4,y
$12:aa4e  f1 17		 sbc ($17),y
$12:aa50  78			sei
$12:aa51  5f 26 af 05   eor $05af26,x
$12:aa55  8f c3 a3 e9   sta $e9a3c3
$12:aa59  30 88		 bmi $a9e3
$12:aa5b  c7 ec		 cmp [$ec]
$12:aa5d  f0 95		 beq $a9f4
$12:aa5f  38			sec
$12:aa60  79 e1 fb	  adc $fbe1,y
$12:aa63  38			sec
$12:aa64  3d 7e 81	  and $817e,x
$12:aa67  32 86		 and ($86)
$12:aa69  c3 63		 cmp $63,s
$12:aa6b  d0 78		 bne $aae5
$12:aa6d  fc 26 3e	  jsr ($3e26,x)
$12:aa70  f7 03		 sbc [$03],y
$12:aa72  d9 4e 20	  cmp $204e,y
$12:aa75  f3 f8		 sbc ($f8,s),y
$12:aa77  fb			xce
$12:aa78  08			php
$12:aa79  21 e1		 and ($e1,x)
$12:aa7b  50 83		 bvc $aa00
$12:aa7d  bc 41 16	  ldy $1641,x
$12:aa80  5f 48 27 63   eor $632748,x
$12:aa84  c1 60		 cmp ($60,x)
$12:aa86  f8			sed
$12:aa87  48			pha
$12:aa88  3a			dec a
$12:aa89  1a			inc a
$12:aa8a  06 a0		 asl $a0
$12:aa8c  4c 34 1b	  jmp $1b34
$12:aa8f  06 d8		 asl $d8
$12:aa91  4e 38 1f	  lsr $1f38
$12:aa94  8f 83 88 38   sta $388883
$12:aa98  12 01		 ora ($01)
$12:aa9a  90 12		 bcc $aaae
$12:aa9c  42 80		 wdm #$80
$12:aa9e  ea			nop
$12:aa9f  18			clc
$12:aaa0  5c 5e 12 f0   jml $f0125e
$12:aaa4  18			clc
$12:aaa5  e4 2e		 cpx $2e
$12:aaa7  13 0f		 ora ($0f,s),y
$12:aaa9  82 31 84	  brl $2edd
$12:aaac  ab			plb
$12:aaad  45 64		 eor $64
$12:aaaf  a0 44		 ldy #$44
$12:aab1  01 e1		 ora ($e1,x)
$12:aab3  60			rts
$12:aab4  98			tya
$12:aab5  64 30		 stz $30
$12:aab7  16 09		 asl $09,x
$12:aab9  06 03		 asl $03
$12:aabb  40			rti
$12:aabc  48			pha
$12:aabd  21 a8		 and ($a8,x)
$12:aabf  92 06		 sta ($06)
$12:aac1  c0 48		 cpy #$48
$12:aac3  17 58		 ora [$58],y
$12:aac5  13 8a		 ora ($8a,s),y
$12:aac7  35 c6		 and $c6,x
$12:aac9  ad 51 b1	  lda $b151
$12:aacc  b6 3a		 ldx $3a,y
$12:aace  0c 1e 80	  tsb $801e
$12:aad1  29 48 04	  and #$0448
$12:aad4  07 c1		 ora [$c1]
$12:aad6  41 90		 eor ($90,x)
$12:aad8  78			sei
$12:aad9  21 1e		 and ($1e,x)
$12:aadb  08			php
$12:aadc  3e 00 06	  rol $0600,x
$12:aadf  bd 89 76	  lda $7689,x
$12:aae2  52 4d		 eor ($4d)
$12:aae4  60			rts
$12:aae5  a7 60		 lda [$60]
$12:aae7  03 82		 ora $82,s
$12:aae9  03 4e		 ora $4e,s
$12:aaeb  44 1b 89	  mvp $89,$1b
$12:aaee  08			php
$12:aaef  c6 39		 dec $39
$12:aaf1  84 06		 sty $06
$12:aaf3  d4 7e		 pei ($7e)
$12:aaf5  c4 2b		 cpy $2b
$12:aaf7  cd 0a 83	  cmp $830a
$12:aafa  43 60		 eor $60,s
$12:aafc  70 17		 bvs $ab15
$12:aafe  e2 d0		 sep #$d0
$12:ab00  24 16		 bit $16
$12:ab02  11 f0		 ora ($f0),y
$12:ab04  0f 42 10 fb   ora $fb1042
$12:ab08  6e 04 c3	  ror $c304
$12:ab0b  b1 28		 lda ($28),y
$12:ab0d  cc 4b ac	  cpy $ac4b
$12:ab10  94 6c		 sty $6c,x
$12:ab12  07 38		 ora [$38]
$12:ab14  06 91		 asl $91
$12:ab16  e8			inx
$12:ab17  77 1a		 adc [$1a],y
$12:ab19  1c 5f 0c	  trb $0c5f
$12:ab1c  24 a2		 bit $a2
$12:ab1e  18			clc
$12:ab1f  56 59		 lsr $59,x
$12:ab21  d4 98		 pei ($98)
$12:ab23  5e 14 da	  lsr $da14,x
$12:ab26  1e 06 ce	  asl $ce06,x
$12:ab29  25 02		 and $02
$12:ab2b  38			sec
$12:ab2c  07 00		 ora [$00]
$12:ab2e  8e 1c 1f	  stx $1f1c
$12:ab31  00 fc		 brk #$fc
$12:ab33  28			plp
$12:ab34  12 82		 ora ($82)
$12:ab36  28			plp
$12:ab37  07 d1		 ora [$d1]
$12:ab39  96 32		 stx $32,y
$12:ab3b  ec 04 82	  cpx $8204
$12:ab3e  c1 40		 cmp ($40,x)
$12:ab40  2a			rol a
$12:ab41  c7 31		 cmp [$31]
$12:ab43  74 46		 stz $46,x
$12:ab45  49 85 cf	  eor #$cf85
$12:ab48  27 71		 and [$71]
$12:ab4a  89 bc 32	  bit #$32bc
$12:ab4d  3e 87 68	  rol $6887,x
$12:ab50  04 f2		 tsb $f2
$12:ab52  01 18		 ora ($18,x)
$12:ab54  82 43 1a	  brl $c59a
$12:ab57  ec 3b 18	  cpx $183b
$12:ab5a  1c 42 17	  trb $1742
$12:ab5d  1c 8d c3	  trb $c38d
$12:ab60  02 60		 cop #$60
$12:ab62  ef 28 a0 0c   sbc $0ca028
$12:ab66  40			rti
$12:ab67  64 03		 stz $03
$12:ab69  00 18		 brk #$18
$12:ab6b  3f db 91 70   and $7091db,x
$12:ab6f  cc 58 3f	  cpy $3f58
$12:ab72  10 0f		 bpl $ab83
$12:ab74  83 20		 sta $20,s
$12:ab76  57 a0		 eor [$a0],y
$12:ab78  6a			ror a
$12:ab79  2b			pld
$12:ab7a  84 01		 sty $01
$12:ab7c  6e 04 2d	  ror $2d04
$12:ab7f  94 48		 sty $48,x
$12:ab81  1c 81 10	  trb $1081
$12:ab84  29 89 2d	  and #$2d89
$12:ab87  8a			txa
$12:ab88  c1 10		 cmp ($10,x)
$12:ab8a  2b			pld
$12:ab8b  44 a6 35	  mvp $35,$a6
$12:ab8e  77 82		 adc [$82],y
$12:ab90  58			cli
$12:ab91  e3 97		 sbc $97,s
$12:ab93  78			sei
$12:ab94  c4 fe		 cpy $fe
$12:ab96  01 0f		 ora ($0f,x)
$12:ab98  7d 1c 12	  adc $121c,x
$12:ab9b  01 08		 ora ($08,x)
$12:ab9d  89 27 82	  bit #$8227
$12:aba0  01 1c		 ora ($1c,x)
$12:aba2  6b			rtl
$12:aba3  b7 b2		 lda [$b2],y
$12:aba5  77 27		 adc [$27],y
$12:aba7  ee 58 fb	  inc $fb58
$12:abaa  f3 88		 sbc ($88,s),y
$12:abac  bc 26 3f	  ldy $3f26,x
$12:abaf  08			php
$12:abb0  8c 42 e3	  sty $e342
$12:abb3  49 b0 ec	  eor #$ecb0
$12:abb6  60			rts
$12:abb7  ff 9e 0f ff   sbc $ff0f9e,x
$12:abbb  c2 6f		 rep #$6f
$12:abbd  38			sec
$12:abbe  88			dey
$12:abbf  45 de		 eor $de
$12:abc1  e0 7f		 cpx #$7f
$12:abc3  03 f8		 ora $f8,s
$12:abc5  5b			tcd
$12:abc6  37 82		 and [$82],y
$12:abc8  f0 c8		 beq $ab92
$12:abca  78			sei
$12:abcb  24 1d		 bit $1d
$12:abcd  0d 07 c2	  ora $c207
$12:abd0  41 30		 eor ($30,x)
$12:abd2  d0 6c		 bne $ac40
$12:abd4  17 61		 ora [$61],y
$12:abd6  30 c0		 bmi $ab98
$12:abd8  0f c0 6e 1c   ora $1c6ec0
$12:abdc  07 20		 ora [$20]
$12:abde  b9 82 80	  lda $8082,y
$12:abe1  ca			dex
$12:abe2  1d c6 e3	  ora $e3c6,x
$12:abe5  39 d8 f6	  and $f6d8,y
$12:abe8  7e 3b 9e	  ror $9e3b,x
$12:abeb  4e b4 3b	  lsr $3bb4
$12:abee  a9 0e ff	  lda #$ff0e
$12:abf1  68			pla
$12:abf2  25 9d		 and $9d
$12:abf4  0a			asl a
$12:abf5  c7 e3		 cmp [$e3]
$12:abf7  f9 fc ee	  sbc $eefc,y
$12:abfa  7f 23 9f cf   adc $cf9f23,x
$12:abfe  74 b9		 stz $b9,x
$12:ac00  ce 1c ef	  dec $ef1c
$12:ac03  66 79		 ror $79
$12:ac05  92 06		 sta ($06)
$12:ac07  a3 80		 lda $80,s
$12:ac09  c0 15		 cpy #$15
$12:ac0b  21 0b		 and ($0b,x)
$12:ac0d  83 c2		 sta $c2,s
$12:ac0f  20 f1 58	  jsr $58f1
$12:ac12  59 1a 15	  eor $151a,y
$12:ac15  20 f7 14	  jsr $14f7
$12:ac18  42 8d		 wdm #$8d
$12:ac1a  43 90		 eor $90,s
$12:ac1c  b8			clv
$12:ac1d  0e 07 a3	  asl $a307
$12:ac20  e1 04		 sbc ($04,x)
$12:ac22  84 12		 sty $12
$12:ac24  58			cli
$12:ac25  2a			rol a
$12:ac26  0c 90 0a	  tsb $0a90
$12:ac29  84 20		 sty $20
$12:ac2b  2a			rol a
$12:ac2c  00 45		 brk #$45
$12:ac2e  85 41		 sta $41
$12:ac30  61 90		 adc ($90,x)
$12:ac32  38			sec
$12:ac33  a4 2e		 ldy $2e
$12:ac35  3c f5 04	  bit $04f5,x
$12:ac38  42 c1		 wdm #$c1
$12:ac3a  60			rts
$12:ac3b  10 30		 bpl $ac6d
$12:ac3d  60			rts
$12:ac3e  8f 99 86 11   sta $118699
$12:ac42  0f 00 6c 22   ora $226c00
$12:ac46  1f 80 d8 00   ora $00d880,x
$12:ac4a  19 86 01	  ora $0186,y
$12:ac4d  50 fc		 bvc $ac4b
$12:ac4f  05 04		 ora $04
$12:ac51  60			rts
$12:ac52  44 90 86	  mvp $86,$90
$12:ac55  c0 c7		 cpy #$c7
$12:ac57  21 1d		 and ($1d,x)
$12:ac59  81 c7		 sta ($c7,x)
$12:ac5b  a0 11		 ldy #$11
$12:ac5d  a5 48		 lda $48
$12:ac5f  1b			tcs
$12:ac60  95 0a		 sta $0a,x
$12:ac62  4f 40 83 c1   eor $c18340
$12:ac66  82 29 98	  brl $4492
$12:ac69  f8			sed
$12:ac6a  7c 3c 01	  jmp ($013c,x)
$12:ac6d  e0 ca		 cpx #$ca
$12:ac6f  7c 34 9f	  jmp ($9f34,x)
$12:ac72  c0 7b		 cpy #$7b
$12:ac74  30 c0		 bmi $ac36
$12:ac76  28			plp
$12:ac77  1f 08 47 f3   ora $f34708,x
$12:ac7b  81 91		 sta ($91,x)
$12:ac7d  bf 71 af b7   lda $b7af71,x
$12:ac81  cf fd f3 dd   cmp $ddf3fd
$12:ac85  fe a2 6e	  inc $6ea2,x
$12:ac88  a8			tay
$12:ac89  95 49		 sta $49,x
$12:ac8b  c4 e2		 cpy $e2
$12:ac8d  01 56		 ora ($56,x)
$12:ac8f  be 55 6f	  ldx $6f55,y
$12:ac92  bf ff ff 5b   lda $5bffff,x
$12:ac96  8d c6 ff	  sta $ffc6
$12:ac99  5b			tcd
$12:ac9a  2f 8b c0 88   and $88c08b
$12:ac9e  44 15 eb	  mvp $eb,$15
$12:aca1  aa			tax
$12:aca2  ff 5f 38 d3   sbc $d3385f,x
$12:aca6  8b			phb
$12:aca7  e0 c8		 cpx #$c8
$12:aca9  57 e9		 eor [$e9],y
$12:acab  92 63		 sta ($63)
$12:acad  83 5c		 sta $5c,s
$12:acaf  2f 8c d0 7f   and $7fd08c
$12:acb3  c4 82		 cpy $82
$12:acb5  01 30		 ora ($30,x)
$12:acb7  98			tya
$12:acb8  4e 2e 15	  lsr $152e
$12:acbb  ca			dex
$12:acbc  c3 b6		 cmp $b6,s
$12:acbe  62 16 08	  per $b4d7
$12:acc1  85 02		 sta $02
$12:acc3  71 3b		 adc ($3b),y
$12:acc5  82 5e e0	  brl $8d26
$12:acc8  97 f8		 sta [$f8],y
$12:acca  05 de		 ora $de
$12:accc  11 3f		 ora ($3f),y
$12:acce  80 43		 bra $ad13
$12:acd0  c9 c8 8e	  cmp #$8ec8
$12:acd3  04 70		 tsb $70
$12:acd5  43 a0		 eor $a0,s
$12:acd7  11 c7		 ora ($c7),y
$12:acd9  6c 07 42	  jmp ($4207)
$12:acdc  0f 07 84 26   ora $268407
$12:ace0  41 d8		 eor ($d8,x)
$12:ace2  0e c0 98	  asl $98c0
$12:ace5  48			pha
$12:ace6  26 02		 rol $02
$12:ace8  e4 80		 cpx $80
$12:acea  0d 8c 12	  ora $128c
$12:aced  00 90		 brk #$90
$12:acef  0d 97 03	  ora $0397
$12:acf2  85 26		 sta $26
$12:acf4  93 c1		 sta ($c1,s),y
$12:acf6  e3 f0		 sbc $f0,s
$12:acf8  78			sei
$12:acf9  bc 1a 2f	  ldy $2f1a,x
$12:acfc  0d 8d 06	  ora $068d
$12:acff  cf 85 00 93   cmp $930085
$12:ad03  c2 22		 rep #$22
$12:ad05  f0 48		 beq $ad4f
$12:ad07  d9 a4 21	  cmp $21a4,y
$12:ad0a  11 30		 ora ($30),y
$12:ad0c  e8			inx
$12:ad0d  40			rti
$12:ad0e  a0 30		 ldy #$30
$12:ad10  b8			clv
$12:ad11  1c 06 03	  trb $0306
$12:ad14  03 85		 ora $85,s
$12:ad16  46 61		 lsr $61
$12:ad18  5b			tcd
$12:ad19  68			pla
$12:ad1a  0f bd ee 01   ora $01eebd
$12:ad1e  d1 82		 cmp ($82),y
$12:ad20  41 a1		 eor ($a1,x)
$12:ad22  d0 f8		 bne $ad1c
$12:ad24  64 1a		 stz $1a
$12:ad26  75 04		 adc $04,x
$12:ad28  fc 40 7a	  jsr ($7a40,x)
$12:ad2b  10 0d		 bpl $ad3a
$12:ad2d  85 c2		 sta $c2
$12:ad2f  81 60		 sta ($60,x)
$12:ad31  c0 3d		 cpy #$3d
$12:ad33  c2 40		 rep #$40
$12:ad35  91 0e		 sta ($0e),y
$12:ad37  06 02		 asl $02
$12:ad39  81 80		 sta ($80,x)
$12:ad3b  e0 3d		 cpx #$3d
$12:ad3d  c7 21		 cmp [$21]
$12:ad3f  10 e0		 bpl $ad21
$12:ad41  14 82		 trb $82
$12:ad43  01 80		 ora ($80,x)
$12:ad45  0e 85 00	  asl $0085
$12:ad48  a4 07		 ldy $07
$12:ad4a  e3 0e		 sbc $0e,s
$12:ad4c  8c ca 65	  sty $65ca
$12:ad4f  45 a6		 eor $a6
$12:ad51  c8			iny
$12:ad52  64 b1		 stz $b1
$12:ad54  84 48		 sty $48
$12:ad56  09 96 09	  ora #$0996
$12:ad59  36 99		 rol $99,x
$12:ad5b  5f e3 53 f8   eor $f853e3,x
$12:ad5f  2c fe 07	  bit $07fe
$12:ad62  1f 76 c5 c2   ora $c2c576,x
$12:ad66  e1 48		 sbc ($48,x)
$12:ad68  a4 44		 ldy $44
$12:ad6a  22 02 96 a0   jsl $a09602
$12:ad6e  26 c3		 rol $c3
$12:ad70  e1 b0		 sbc ($b0,x)
$12:ad72  fc 78 3e	  jsr ($3e78,x)
$12:ad75  11 e8		 ora ($e8),y
$12:ad77  04 7a		 tsb $7a
$12:ad79  03 1b		 ora $1b,s
$12:ad7b  83 43		 sta $43,s
$12:ad7d  e2 f0		 sep #$f0
$12:ad7f  14 30		 trb $30
$12:ad81  41 e0		 eor ($e0,x)
$12:ad83  70 73		 bvs $adf8
$12:ad85  b0 40		 bcs $adc7
$12:ad87  0e a0 21	  asl $21a0
$12:ad8a  02 d8		 cop #$d8
$12:ad8c  17 02		 ora [$02],y
$12:ad8e  1e 07 01	  asl $0107,x
$12:ad91  98			tya
$12:ad92  40			rti
$12:ad93  e0 79		 cpx #$79
$12:ad95  4f 87 82 71   eor $718287
$12:ad99  9c f2 78	  stz $78f2
$12:ad9c  11 a1		 ora ($a1),y
$12:ad9e  e0 b0		 cpx #$b0
$12:ada0  26 41		 rol $41
$12:ada2  4a			lsr a
$12:ada3  3f 08 44 e2   and $e24408,x
$12:ada7  09 e4		 ora #$e4
$12:ada9  e0 74		 cpx #$74
$12:adab  3a			dec a
$12:adac  16 00		 asl $00,x
$12:adae  c0 78		 cpy #$78
$12:adb0  38			sec
$12:adb1  09 90		 ora #$90
$12:adb3  c0 47		 cpy #$47
$12:adb5  60			rts
$12:adb6  71 c8		 adc ($c8),y
$12:adb8  14 32		 trb $32
$12:adba  26 f1		 rol $f1
$12:adbc  08			php
$12:adbd  71 c8		 adc ($c8),y
$12:adbf  20 90 50	  jsr $5090
$12:adc2  68			pla
$12:adc3  40			rti
$12:adc4  1f c0 71 08   ora $0871c0,x
$12:adc8  9c 42 0f	  stz $0f42
$12:adcb  06 03		 asl $03
$12:adcd  84 14		 sty $14
$12:adcf  18			clc
$12:add0  2c 31 84	  bit $8431
$12:add3  03 c2		 ora $c2,s
$12:add5  01 f8		 ora ($f8,x)
$12:add7  ee 49 3c	  inc $3c49
$12:adda  10 0d		 bpl $ade9
$12:addc  03 9c		 ora $9c,s
$12:adde  54 e1 08	  mvn $08,$e1
$12:ade1  f8			sed
$12:ade2  07 c3		 ora [$c3]
$12:ade4  f0 22		 beq $ae08
$12:ade6  11 38		 ora ($38),y
$12:ade8  50 05		 bvc $adef
$12:adea  82 c2 08	  brl $b6af
$12:aded  cc 1e 19	  cpy $191e
$12:adf0  17 83		 ora [$83],y
$12:adf2  c7 e0		 cmp [$e0]
$12:adf4  f0 e8		 beq $adde
$12:adf6  59 c0 1f	  eor $1fc0,y
$12:adf9  60			rts
$12:adfa  c2 12		 rep #$12
$12:adfc  48			pha
$12:adfd  45 62		 eor $62
$12:adff  f1 f8		 sbc ($f8),y
$12:ae01  fc 3a 1d	  jsr ($1d3a,x)
$12:ae04  0f 05 08 00   ora $000805
$12:ae08  60			rts
$12:ae09  11 cf		 ora ($cf),y
$12:ae0b  25 83		 and $83
$12:ae0d  a1 c0		 lda ($c0,x)
$12:ae0f  f8			sed
$12:ae10  70 3c		 bvs $ae4e
$12:ae12  1a			inc a
$12:ae13  03 30		 ora $30,s
$12:ae15  06 c5		 asl $c5
$12:ae17  84 16		 sty $16
$12:ae19  4e 05 43	  lsr $4305
$12:ae1c  a0 60 0f	  ldy #$0f60
$12:ae1f  02 94		 cop #$94
$12:ae21  45 60		 eor $60
$12:ae23  c0 2c 8d	  cpy #$8d2c
$12:ae26  fb			xce
$12:ae27  8d 7d 9c	  sta $9c7d
$12:ae2a  7f ea 98 2f   adc $2f98ea,x
$12:ae2e  f5 13		 sbc $13,x
$12:ae30  fd 38 be	  sbc $be38,x
$12:ae33  35 46		 and $46,x
$12:ae35  ad 7c aa	  lda $aa7c
$12:ae38  df 7f ff fd   cmp $fdff7f,x
$12:ae3c  d7 1b		 cmp [$1b],y
$12:ae3e  8d fe be	  sta $befe
$12:ae41  5f 1b a4 af   eor $afa41b,x
$12:ae45  2b			pld
$12:ae46  e7 fe		 sbc [$fe]
$12:ae48  f9 ee ff	  sbc $ffee,y
$12:ae4b  5b			tcd
$12:ae4c  37 57		 and [$57],y
$12:ae4e  cb			wai
$12:ae4f  64 42		 stz $42
$12:ae51  70 be		 bvs $ae11
$12:ae53  56 b0		 lsr $b0,x
$12:ae55  35 81		 and $81,x
$12:ae57  92 13		 sta ($13)
$12:ae59  89 c3		 bit #$c3
$12:ae5b  2c 23 f8	  bit $f823
$12:ae5e  cb			wai
$12:ae5f  bf 9f 07 eb   lda $eb079f,x
$12:ae63  c0 7a 67	  cpy #$677a
$12:ae66  de f8 ff	  dec $fff8,x
$12:ae69  32 1f		 and ($1f)
$12:ae6b  0a			asl a
$12:ae6c  84 c1		 sty $c1
$12:ae6e  b1 16		 lda ($16),y
$12:ae70  48			pha
$12:ae71  2f aa d3 86   and $86d3aa
$12:ae75  b4 e9		 ldy $e9,x
$12:ae77  ad be 2a	  lda $2abe
$12:ae7a  66 02		 ror $02
$12:ae7c  10 4e		 bpl $aecc
$12:ae7e  05 59		 ora $59
$12:ae80  2a			rol a
$12:ae81  c5 34		 cmp $34
$12:ae83  0a			asl a
$12:ae84  91 36		 sta ($36),y
$12:ae86  08			php
$12:ae87  6d 82 c2	  adc $c282
$12:ae8a  6a			ror a
$12:ae8b  35 58		 and $58,x
$12:ae8d  4e 2e 17	  lsr $172e
$12:ae90  4a			lsr a
$12:ae91  c4 ff		 cpy $ff
$12:ae93  79 db aa	  adc $aadb,y
$12:ae96  5b			tcd
$12:ae97  e7 b3		 sbc [$b3]
$12:ae99  98			tya
$12:ae9a  f4 26 3d	  pea $3d26
$12:ae9d  0b			phd
$12:ae9e  82 58 22	  brl $d0f9
$12:aea1  14 08		 trb $08
$12:aea3  c6 82		 dec $82
$12:aea5  b9 54 90	  lda $9054,y
$12:aea8  48			pha
$12:aea9  e3 f0		 sbc $f0,s
$12:aeab  38			sec
$12:aeac  ec 12 31	  cpx $3112
$12:aeaf  00 83		 brk #$83
$12:aeb1  3b			tsc
$12:aeb2  02 a1		 cop #$a1
$12:aeb4  30 f8		 bmi $aeae
$12:aeb6  5c 3c 11 09   jml $09113c
$12:aeba  01 4c		 ora ($4c,x)
$12:aebc  30 12		 bmi $aed0
$12:aebe  0e 06 82	  asl $8206
$12:aec1  81 00		 sta ($00,x)
$12:aec3  66 04		 ror $04
$12:aec5  c2 01		 rep #$01
$12:aec7  70 66		 bvs $af2f
$12:aec9  07 c0		 ora [$c0]
$12:aecb  34 25		 bit $25,x
$12:aecd  e0 12 04	  cpx #$0412
$12:aed0  22 11 07 87   jsl $870711
$12:aed4  c1 60		 cmp ($60,x)
$12:aed6  d1 58		 cmp ($58),y
$12:aed8  74 76		 stz $76,x
$12:aeda  0d 37 8b	  ora $8b37
$12:aedd  4b			phk
$12:aede  65 d1		 adc $d1
$12:aee0  f8			sed
$12:aee1  04 1d		 tsb $1d
$12:aee3  56 30		 lsr $30,x
$12:aee5  68			pla
$12:aee6  44 38 9a	  mvp $9a,$38
$12:aee9  10 08		 bpl $aef3
$12:aeeb  b4 22		 ldy $22,x
$12:aeed  5c cc 1b 06   jml $061bcc
$12:aef1  c3 a1		 cmp $a1,s
$12:aef3  38			sec
$12:aef4  c0 5e 3f	  cpy #$3f5e
$12:aef7  10 04		 bpl $aefd
$12:aef9  a9 7c		 lda #$7c
$12:aefb  04 80		 tsb $80
$12:aefd  61 16		 adc ($16,x)
$12:aeff  e8			inx
$12:af00  5e 02 24	  lsr $2402,x
$12:af03  a4 58		 ldy $58
$12:af05  54 7a 05	  mvn $05,$7a
$12:af08  0e 24 04	  asl $0424
$12:af0b  be e7 7f	  ldx $7fe7,y
$12:af0e  bb			tyx
$12:af0f  c7 5f		 cmp [$5f]
$12:af11  61 0f		 adc ($0f,x)
$12:af13  82 41 a1	  brl $5057
$12:af16  b1 f8		 lda ($f8),y
$12:af18  0c 3e 3d	  tsb $3d3e
$12:af1b  17 bf		 ora [$bf],y
$12:af1d  5d ef d7	  eor $d7ef,x
$12:af20  f8			sed
$12:af21  f4 7e 39	  pea $397e
$12:af24  1f 8c 47 a6   ora $a6478c,x
$12:af28  13 0d		 ora ($0d,s),y
$12:af2a  07 c0		 ora [$c0]
$12:af2c  ae 1c 0f	  ldx $0f1c
$12:af2f  85 43		 sta $43
$12:af31  c0 59 00	  cpy #$0059
$12:af34  89 35		 bit #$35
$12:af36  41 34		 eor ($34,x)
$12:af38  2d 41 e0	  and $e041
$12:af3b  15 40		 ora $40,x
$12:af3d  34 b7		 bit $b7,x
$12:af3f  e8			inx
$12:af40  05 09		 ora $09
$12:af42  e4 af		 cpx $af
$12:af44  10 7e		 bpl $afc4
$12:af46  7b			tdc
$12:af47  bb			tyx
$12:af48  c3 de		 cmp $de,s
$12:af4a  10 f1		 bpl $af3d
$12:af4c  0e 75 3c	  asl $3c75
$12:af4f  da			phx
$12:af50  ad 34 1b	  lda $1b34
$12:af53  d5 c8		 cmp $c8,x
$12:af55  b7 72		 lda [$72],y
$12:af57  3c d1 8e	  bit $8ed1,x
$12:af5a  85 c3		 sta $c3
$12:af5c  c0 95 0b	  cpy #$0b95
$12:af5f  c6 1a		 dec $1a
$12:af61  a1 06		 lda ($06,x)
$12:af63  fe 43 bf	  inc $bf43,x
$12:af66  9c ef a7	  stz $a7ef
$12:af69  0a			asl a
$12:af6a  40			rti
$12:af6b  2d 24 e8	  and $e824
$12:af6e  0b			phd
$12:af6f  46 21		 lsr $21
$12:af71  30 90		 bmi $af03
$12:af73  46 26		 lsr $26
$12:af75  90 89		 bcc $af00
$12:af77  bc 3e f5	  ldy $f53e,x
$12:af7a  07 bf		 ora [$bf]
$12:af7c  88			dey
$12:af7d  51 3e		 eor ($3e),y
$12:af7f  30 39		 bmi $afba
$12:af81  c4 12		 cpy $12
$12:af83  30 89		 bmi $af0e
$12:af85  01 69		 ora ($69,x)
$12:af87  40			rti
$12:af88  a0 f0 78	  ldy #$78f0
$12:af8b  fd 32 ff	  sbc $ff32,x
$12:af8e  0f 99 e5 f5   ora $f5e599
$12:af92  d6 ee		 dec $ee,x
$12:af94  fe 9b 3e	  inc $3e9b,x
$12:af97  2d 04 90	  and $9004
$12:af9a  c0 14 60	  cpy #$6014
$12:af9d  6e 0a 7a	  ror $7a0a
$12:afa0  90 6b		 bcc $b00d
$12:afa2  e2 13		 sep #$13
$12:afa4  d8			cld
$12:afa5  7e 3b df	  ror $df3b,x
$12:afa8  dd fe 67	  cmp $67fe,x
$12:afab  2d b9 97	  and $97b9
$12:afae  6c 6b ff	  jmp ($ff6b)
$12:afb1  91 69		 sta ($69),y
$12:afb3  76 23		 ror $23,x
$12:afb5  11 af		 ora ($af),y
$12:afb7  cd ff ff	  cmp $ffff
$12:afba  7e fc b2	  ror $b2fc,x
$12:afbd  42 7f		 wdm #$7f
$12:afbf  ff 10 9e 03   sbc $039e10,x
$12:afc3  81 f8		 sta ($f8,x)
$12:afc5  e8			inx
$12:afc6  77 3c		 adc [$3c],y
$12:afc8  9e 4b 87	  stz $874b,x
$12:afcb  c2 99		 rep #$99
$12:afcd  dc 16 84	  jml [$8416]
$12:afd0  82 40 db	  brl $8b13
$12:afd3  06 a8		 asl $a8
$12:afd5  68			pla
$12:afd6  3f 9d 8f e5   and $e58f9d,x
$12:afda  33 f9		 and ($f9,s),y
$12:afdc  60			rts
$12:afdd  fe 08 5a	  inc $5a08,x
$12:afe0  21 10		 and ($10,x)
$12:afe2  8c 4c 27	  sty $274c
$12:afe5  93 89		 sta ($89,s),y
$12:afe7  bd f0 42	  lda $42f0,x
$12:afea  f1 09		 sbc ($09),y
$12:afec  00 20		 brk #$20
$12:afee  23 17		 and $17,s
$12:aff0  88			dey
$12:aff1  20 85 a3	  jsr $a385
$12:aff4  11 89		 ora ($89),y
$12:aff6  c4 62		 cpy $62
$12:aff8  e9 34		 sbc #$34
$12:affa  f0 5e		 beq $b05a
$12:affc  07 cd		 ora [$cd]
$12:affe  08			php
$12:afff  88			dey
$12:b000  09 c2		 ora #$c2
$12:b002  09 38		 ora #$38
$12:b004  9c 51 1d	  stz $1d51
$12:b007  f3 18		 sbc ($18,s),y
$12:b009  86 46		 stx $46
$12:b00b  20 f2 87	  jsr $87f2
$12:b00e  fc 05 80	  jsr ($8005,x)
$12:b011  50 12		 bvc $b025
$12:b013  88			dey
$12:b014  a6 f2		 ldx $f2
$12:b016  81 ec		 sta ($ec,x)
$12:b018  88			dey
$12:b019  3b			tsc
$12:b01a  83 f1		 sta $f1,s
$12:b01c  00 f0		 brk #$f0
$12:b01e  3f d8 ae 05   and $05aed8,x
$12:b022  50 31		 bvc $b055
$12:b024  fa			plx
$12:b025  34 e0		 bit $e0,x
$12:b027  17 f8		 ora [$f8],y
$12:b029  04 9e		 tsb $9e
$12:b02b  40			rti
$12:b02c  71 83		 adc ($83),y
$12:b02e  c8			iny
$12:b02f  7f a0 11 e3   adc $e311a0,x
$12:b033  45 ff		 eor $ff
$12:b035  d9 c0 ce	  cmp $cec0,y
$12:b038  44 a3 27	  mvp $27,$a3
$12:b03b  4e 03 00	  lsr $0003
$12:b03e  8f c0 20 71   sta $7120c0
$12:b042  85 a8		 sta $a8
$12:b044  40			rti
$12:b045  61 b0		 adc ($b0,x)
$12:b047  98			tya
$12:b048  34 3a		 bit $3a,x
$12:b04a  16 13		 asl $13,x
$12:b04c  28			plp
$12:b04d  1a			inc a
$12:b04e  c8			iny
$12:b04f  56 61		 lsr $61,x
$12:b051  0e 80 41	  asl $4180
$12:b054  e1 50		 sbc ($50,x)
$12:b056  78			sei
$12:b057  39 5c 38	  and $385c,y
$12:b05a  11 0f		 ora ($0f),y
$12:b05c  04 c3		 tsb $c3
$12:b05e  01 30		 ora ($30,x)
$12:b060  a0 5c 30	  ldy #$305c
$12:b063  1e 0d 05	  asl $050d,x
$12:b066  03 41		 ora $41,s
$12:b068  60			rts
$12:b069  f8			sed
$12:b06a  40			rti
$12:b06b  2e 10 0d	  rol $0d10
$12:b06e  84 01		 sty $01
$12:b070  be 0e 30	  ldx $300e,y
$12:b073  b0 34		 bcs $b0a9
$12:b075  02 41		 cop #$41
$12:b077  80 e0		 bra $b059
$12:b079  04 c2		 tsb $c2
$12:b07b  fd 00 a1	  sbc $a100,x
$12:b07e  3c 95 e2	  bit $e295,x
$12:b081  0f cf 19 8b   ora $8b19cf
$12:b085  c7 c0		 cmp [$c0]
$12:b087  5e 13 f2	  lsr $f213,x
$12:b08a  1f 95 3c 4e   ora $4e3c95,x
$12:b08e  f1 e9		 sbc ($e9),y
$12:b090  94 12		 sty $12,x
$12:b092  71 4b		 adc ($4b),y
$12:b094  9b			txy
$12:b095  df a0 77 f8   cmp $f877a0,x
$12:b099  05 e0		 ora $e0
$12:b09b  4e 70 19	  lsr $1970
$12:b09e  84 0e		 sty $0e
$12:b0a0  70 71		 bvs $b113
$12:b0a2  08			php
$12:b0a3  02 10		 cop #$10
$12:b0a5  04 eb		 tsb $eb
$12:b0a7  26 8f		 rol $8f
$12:b0a9  f8			sed
$12:b0aa  3b			tsc
$12:b0ab  fd 5f 54	  sbc $545f,x
$12:b0ae  7f c3 fd 87   adc $87fdc3,x
$12:b0b2  45 61		 eor $61
$12:b0b4  f1 e8		 sbc ($e8),y
$12:b0b6  0c 1e 01	  tsb $011e
$12:b0b9  df 62 0c 29   cmp $290c62,x
$12:b0bd  7e 30 f5	  ror $f530,x
$12:b0c0  38			sec
$12:b0c1  c0 d8 61	  cpy #$61d8
$12:b0c4  00 c6		 brk #$c6
$12:b0c6  d7 ea		 cmp [$ea],y
$12:b0c8  fb			xce
$12:b0c9  7f 4e 7f 67   adc $677f4e,x
$12:b0cd  0f e7 c0 2b   ora $2bc0e7
$12:b0d1  18			clc
$12:b0d2  07 28		 ora [$28]
$12:b0d4  3b			tsc
$12:b0d5  82 7f 7f	  brl $3057
$12:b0d8  c4 4f		 cpy $4f
$12:b0da  ec 71 ff	  cpx $ff71
$12:b0dd  9c 3f e0	  stz $e03f
$12:b0e0  d9 0c 03	  cmp $030c,y
$12:b0e3  28			plp
$12:b0e4  0f 61 c4 e4   ora $e4c461
$12:b0e8  6b			rtl
$12:b0e9  35 15		 and $15,x
$12:b0eb  cf 84 63 c0   cmp $c06384
$12:b0ef  bb			tyx
$12:b0f0  01 3a		 ora ($3a,x)
$12:b0f2  6c 3f 15	  jmp ($153f)
$12:b0f5  0f c4 01 76   ora $7601c4
$12:b0f9  1e 01 3b	  asl $3b01,x
$12:b0fc  57 7a		 eor [$7a],y
$12:b0fe  1c 7a 6d	  trb $6d7a
$12:b101  b6 7f		 ldx $7f,y
$12:b103  2e 8e c3	  rol $c38e
$12:b106  a1 90		 lda ($90,x)
$12:b108  78			sei
$12:b109  4c 0e 0d	  jmp $0d0e
$12:b10c  19 83 74	  ora $7483,y
$12:b10f  e4 14		 cpx $14
$12:b111  39 fc 8e	  and $8efc,y
$12:b114  3a			dec a
$12:b115  6e 08 0c	  ror $0c08
$12:b118  3a			dec a
$12:b119  11 00		 ora ($00),y
$12:b11b  82 1e c7	  brl $783c
$12:b11e  a9 66		 lda #$66
$12:b120  d5 69		 cmp $69,x
$12:b122  a0 5e ee	  ldy #$ee5e
$12:b125  45 bb		 eor $bb
$12:b127  91 66		 sta ($66),y
$12:b129  ac 44 3e	  ldy $3e44
$12:b12c  1e 07 10	  asl $1007,x
$12:b12f  5e 30 dd	  lsr $dd30,x
$12:b132  0c 37 f3	  tsb $f337
$12:b135  15 7c		 ora $7c,x
$12:b137  c5 5d		 cmp $5d
$12:b139  20 4e 63	  jsr $634e
$12:b13c  e0 45 66	  cpx #$6645
$12:b13f  93 08		 sta ($08,s),y
$12:b141  8c 66 17	  sty $1766
$12:b144  13 87		 ora ($87,s),y
$12:b146  c6 d4		 dec $d4
$12:b148  e1 09		 sbc ($09,x)
$12:b14a  80 bf		 bra $b10b
$12:b14c  06 6f		 asl $6f
$12:b14e  08			php
$12:b14f  88			dey
$12:b150  43 e1		 eor $e1,s
$12:b152  10 78		 bpl $b1cc
$12:b154  64 0c		 stz $0c
$12:b156  8a			txa
$12:b157  00 96		 brk #$96
$12:b159  f5 79		 sbc $79,x
$12:b15b  b4 de		 ldy $de,x
$12:b15d  af 45 bb 10   lda $10bb45
$12:b161  18			clc
$12:b162  78			sei
$12:b163  87 1a		 sta [$1a]
$12:b165  f9 ee 31	  sbc $31ee,y
$12:b168  80 9d		 bra $b107
$12:b16a  a5 32		 lda $32
$12:b16c  c8			iny
$12:b16d  74 ba		 stz $ba,x
$12:b16f  67 13		 adc [$13]
$12:b171  1b			tcs
$12:b172  84 7a		 sty $7a
$12:b174  0f 0e 87 8e   ora $8e870e
$12:b178  ca			dex
$12:b179  5f 10 96 c4   eor $c49610,x
$12:b17d  88			dey
$12:b17e  25 00		 and $00
$12:b180  83 c2		 sta $c2,s
$12:b182  20 c4 b2	  jsr $b2c4
$12:b185  73 b4		 adc ($b4,s),y
$12:b187  12 09		 ora ($09)
$12:b189  02 43		 cop #$43
$12:b18b  04 0a		 tsb $0a
$12:b18d  01 01		 ora ($01,x)
$12:b18f  47 bc		 eor [$bc]
$12:b191  0d 34 30	  ora $3034
$12:b194  14 f0		 trb $f0
$12:b196  42 e1		 wdm #$e1
$12:b198  90 c8		 bcc $b162
$12:b19a  7c c2 1d	  jmp ($1dc2,x)
$12:b19d  7e 81 5f	  ror $5f81,x
$12:b1a0  60			rts
$12:b1a1  37 48		 and [$48],y
$12:b1a3  7c c4 f2	  jmp ($f2c4,x)
$12:b1a6  10 01		 bpl $b1a9
$12:b1a8  c0 2c 02	  cpy #$022c
$12:b1ab  02 c2		 cop #$c2
$12:b1ad  04 d8		 tsb $d8
$12:b1af  af 81 92 30   lda $309281
$12:b1b3  0a			asl a
$12:b1b4  07 83		 ora [$83]
$12:b1b6  01 e0		 ora ($e0,x)
$12:b1b8  dc 70 37	  jml [$3770]
$12:b1bb  8d 41 fe	  sta $fe41
$12:b1be  40			rti
$12:b1bf  03 a0		 ora $a0,s
$12:b1c1  69 34		 adc #$34
$12:b1c3  7b			tdc
$12:b1c4  70 20		 bvs $b1e6
$12:b1c6  18			clc
$12:b1c7  04 90		 tsb $90
$12:b1c9  00 04		 brk #$04
$12:b1cb  10 00		 bpl $b1cd
$12:b1cd  40			rti
$12:b1ce  86 e8		 stx $e8
$12:b1d0  bd fe f8	  lda $f8fe,x
$12:b1d3  6e 5b 39	  ror $395b
$12:b1d6  9d de c9	  sta $c9de,x
$12:b1d9  24 4f		 bit $4f
$12:b1db  83 86		 sta $86,s
$12:b1dd  bc 41 e4	  ldy $e441,x
$12:b1e0  8f 94 91 3c   sta $3c9194
$12:b1e4  07 df		 ora [$df]
$12:b1e6  a3 02		 lda $02,s
$12:b1e8  18			clc
$12:b1e9  61 00		 adc ($00,x)
$12:b1eb  02 f1		 cop #$f1
$12:b1ed  07 a0		 ora [$a0]
$12:b1ef  e5 e3		 sbc $e3
$12:b1f1  90 d1		 bcc $b1c4
$12:b1f3  49 03		 eor #$03
$12:b1f5  c8			iny
$12:b1f6  44 9e e8	  mvp $e8,$9e
$12:b1f9  b4 7c		 ldy $7c,x
$12:b1fb  72 10		 adc ($10)
$12:b1fd  dd 06 80	  cmp $8006,x
$12:b200  40			rti
$12:b201  d1 d8		 cmp ($d8),y
$12:b203  7c 94 92	  jmp ($9294,x)
$12:b206  02 90		 cop #$90
$12:b208  f3 08		 sbc ($08,s),y
$12:b20a  1a			inc a
$12:b20b  36 49		 rol $49,x
$12:b20d  0f d4 97 45   ora $4597d4
$12:b211  a3 f3		 lda $f3,s
$12:b213  8c 1c 92	  sty $921c
$12:b216  1f 79 2b c4   ora $c42b79,x
$12:b21a  0b			phd
$12:b21b  e5 a1		 sbc $a1
$12:b21d  1a			inc a
$12:b21e  1c 54 38	  trb $3854
$12:b221  7e 71 f8	  ror $f871,x
$12:b224  68			pla
$12:b225  5e 64 47	  lsr $4764,x
$12:b228  08			php
$12:b229  d0 f4		 bne $b21f
$12:b22b  10 41		 bpl $b26e
$12:b22d  a1 f2		 lda ($f2,x)
$12:b22f  3f c3 46 83   and $8346c3,x
$12:b233  38			sec
$12:b234  6f ba 3b ee   adc $ee3bba
$12:b238  86 a2		 stx $a2
$12:b23a  41 1e		 eor ($1e,x)
$12:b23c  3e f8 b4	  rol $b4f8,x
$12:b23f  99 ea 12	  sta $12ea,y
$12:b242  71 49		 adc ($49),y
$12:b244  26 c1		 rol $c1
$12:b246  3c 71 5f	  bit $5f71,x
$12:b249  2b			pld
$12:b24a  d4 3c		 pei ($3c)
$12:b24c  a2 93 c8	  ldx #$c893
$12:b24f  68			pla
$12:b250  a2 3e 38	  ldx #$383e
$12:b253  8a			txa
$12:b254  fc 22 59	  jsr ($5922,x)
$12:b257  cc f4 4f	  cpy $4ff4
$12:b25a  c6 c8		 dec $c8
$12:b25c  2c c6 b7	  bit $b7c6
$12:b25f  38			sec
$12:b260  cf bc 93 3b   cmp $3b93bc
$12:b264  c1 04		 cmp ($04,x)
$12:b266  09 47		 ora #$47
$12:b268  bc bd e8	  ldy $e8bd,x
$12:b26b  1f a9 11 5c   ora $5c11a9,x
$12:b26f  1f ba 38 21   ora $2138ba,x
$12:b273  42 00		 wdm #$00
$12:b275  08			php
$12:b276  51 34		 eor ($34),y
$12:b278  22 96 d1 97   jsl $97d196
$12:b27c  40			rti
$12:b27d  4a			lsr a
$12:b27e  ba			tsx
$12:b27f  25 c0		 and $c0
$12:b281  e8			inx
$12:b282  0e 02 30	  asl $3002
$12:b285  11 c1		 ora ($c1),y
$12:b287  90 05		 bcc $b28e
$12:b289  70 28		 bvs $b2b3
$12:b28b  c1 1a		 cmp ($1a,x)
$12:b28d  8a			txa
$12:b28e  74 09		 stz $09,x
$12:b290  60			rts
$12:b291  52 31		 eor ($31)
$12:b293  0a			asl a
$12:b294  46 d3		 lsr $d3
$12:b296  60			rts
$12:b297  6b			rtl
$12:b298  02 80		 cop #$80
$12:b29a  9b			txy
$12:b29b  db			stp
$12:b29c  dc 9d 03	  jml [$039d]
$12:b29f  e0 08 00	  cpx #$0008
$12:b2a2  c8			iny
$12:b2a3  23 80		 and $80,s
$12:b2a5  3b			tsc
$12:b2a6  84 68		 sty $68
$12:b2a8  4e 08 72	  lsr $7208
$12:b2ab  32 0a		 and ($0a)
$12:b2ad  e0 51 01	  cpx #$0151
$12:b2b0  16 87		 asl $87,x
$12:b2b2  47 cc		 eor [$cc]
$12:b2b4  a2 a4 05	  ldx #$05a4
$12:b2b7  28			plp
$12:b2b8  45 83		 eor $83
$12:b2ba  e1 91		 sbc ($91,x)
$12:b2bc  19 04 57	  ora $5704,y
$12:b2bf  cb			wai
$12:b2c0  e5 19		 sbc $19
$12:b2c2  0c 54 38	  tsb $3854
$12:b2c5  31 5d		 and ($5d),y
$12:b2c7  76 bf		 ror $bf,x
$12:b2c9  33 e3		 and ($e3,s),y
$12:b2cb  61 04		 adc ($04,x)
$12:b2cd  46 22		 lsr $22
$12:b2cf  c2 16		 rep #$16
$12:b2d1  39 af c3	  and $c3af,y
$12:b2d4  26 e3		 rol $e3
$12:b2d6  86 90		 stx $90
$12:b2d8  b3 f8		 lda ($f8,s),y
$12:b2da  09 40		 ora #$40
$12:b2dc  c3 77		 cmp $77,s
$12:b2de  f8			sed
$12:b2df  3f 0e 48 48   and $48480e,x
$12:b2e3  12 81		 ora ($81)
$12:b2e5  27 08		 and [$08]
$12:b2e7  d6 05		 dec $05,x
$12:b2e9  e0 8e 95	  cpx #$958e
$12:b2ec  cd 38 87	  cmp $8738
$12:b2ef  c2 f7		 rep #$f7
$12:b2f1  15 cc		 ora $cc,x
$12:b2f3  8c c6 40	  sty $40c6
$12:b2f6  43 89		 eor $89,s
$12:b2f8  5a			phy
$12:b2f9  ce e2 46	  dec $46e2
$12:b2fc  5d 10 7c	  eor $7c10,x
$12:b2ff  c8			iny
$12:b300  91 a0		 sta ($a0),y
$12:b302  37 a1		 and [$a1],y
$12:b304  57 0c		 eor [$0c],y
$12:b306  81 1c		 sta ($1c,x)
$12:b308  1a			inc a
$12:b309  04 6a		 tsb $6a
$12:b30b  38			sec
$12:b30c  85 01		 sta $01
$12:b30e  28			plp
$12:b30f  c3 a1		 cmp $a1,s
$12:b311  d1 f2		 cmp ($f2),y
$12:b313  18			clc
$12:b314  43 62		 eor $62,s
$12:b316  c9 f0 8b	  cmp #$8bf0
$12:b319  87 c2		 sta [$c2]
$12:b31b  3a			dec a
$12:b31c  2f 10 e2 45   and $45e210
$12:b320  7c ab 60	  jmp ($60ab,x)
$12:b323  0f 8e 40 54   ora $54408e
$12:b327  1e 35 fa	  asl $fa35,x
$12:b32a  44 58 c0	  mvp $c0,$58
$12:b32d  bf 1c c6 b7   lda $b7c61c,x
$12:b331  5c e2 bc 93   jml $93bce2
$12:b335  37 f5		 and [$f5],y
$12:b337  c0 05 de	  cpy #$de05
$12:b33a  67 33		 adc [$33]
$12:b33c  b9 71 80	  lda $8071,y
$12:b33f  0a			asl a
$12:b340  45 e0		 eor $e0
$12:b342  92 27		 sta ($27)
$12:b344  b1 3e		 lda ($3e),y
$12:b346  c9 5c 40	  cmp #$405c
$12:b349  f2 7b		 sbc ($7b)
$12:b34b  11 00		 ora ($00),y
$12:b34d  5f a0 6b 2f   eor $2f6ba0,x
$12:b351  7e 8e 35	  ror $358e,x
$12:b354  96 0b		 stx $0b,y
$12:b356  8c 34 36	  sty $3634
$12:b359  a1 b1		 lda ($b1,x)
$12:b35b  f7 09		 sbc [$09],y
$12:b35d  89 f4 62	  bit #$62f4
$12:b360  f4 8e 09	  pea $098e
$12:b363  88			dey
$12:b364  36 41		 rol $41,x
$12:b366  e2 d0		 sep #$d0
$12:b368  7e 46 88	  ror $8846,x
$12:b36b  1b			tcs
$12:b36c  1d 08 a8	  ora $a808,x
$12:b36f  34 68		 bit $68,x
$12:b371  e1 d0		 sbc ($d0,x)
$12:b373  8d 4c 34	  sta $344c
$12:b376  31 6f		 and ($6f),y
$12:b378  30 74		 bmi $b3ee
$12:b37a  e1 b1		 sbc ($b1,x)
$12:b37c  b1 32		 lda ($32),y
$12:b37e  c3 3c		 cmp $3c,s
$12:b380  e6 30		 inc $30
$12:b382  38			sec
$12:b383  90 d4		 bcc $b359
$12:b385  ca			dex
$12:b386  20 7c 28	  jsr $287c
$12:b389  d1 d0		 cmp ($d0),y
$12:b38b  3d d1 a2	  and $a2d1,x
$12:b38e  29 ab 06	  and #$06ab
$12:b391  19 e4 30	  ora $30e4,y
$12:b394  07 b8		 ora [$b8]
$12:b396  7e 31 69	  ror $6931,x
$12:b399  30 5c		 bmi $b3f7
$12:b39b  24 e7		 bit $e7
$12:b39d  a2 f2		 ldx #$f2
$12:b39f  7b			tdc
$12:b3a0  f2 30		 sbc ($30)
$12:b3a2  d5 88		 cmp $88,x
$12:b3a4  c5 7c		 cmp $7c
$12:b3a6  a1 70		 lda ($70,x)
$12:b3a8  f2 c3		 sbc ($c3)
$12:b3aa  5f a1 a4 f2   eor $f2a4a1,x
$12:b3ae  6b			rtl
$12:b3af  f3 3e		 sbc ($3e,s),y
$12:b3b1  36 09		 rol $09,x
$12:b3b3  44 b3 99	  mvp $99,$b3
$12:b3b6  e8			inx
$12:b3b7  9f 8e 23 11   sta $11238e,x
$12:b3bb  65 06		 adc $06
$12:b3bd  bf 27 9c 68   lda $689c27,x
$12:b3c1  db			stp
$12:b3c2  3f 9a 39 9a   and $9a399a,x
$12:b3c6  d6 b4		 dec $b4,x
$12:b3c8  73 29		 adc ($29,s),y
$12:b3ca  ad 47 06	  lda $0647
$12:b3cd  81 00		 sta ($00,x)
$12:b3cf  21 10		 and ($10,x)
$12:b3d1  d0 04		 bne $b3d7
$12:b3d3  01 62		 ora ($62,x)
$12:b3d5  26 a0		 rol $a0
$12:b3d7  47 00		 eor [$00]
$12:b3d9  82 c3 da	  brl $8e9f
$12:b3dc  9b			txy
$12:b3dd  00 fe		 brk #$fe
$12:b3df  07 4b		 ora [$4b]
$12:b3e1  cc 51 05	  cpy $0551
$12:b3e4  88			dey
$12:b3e5  14 c0		 trb $c0
$12:b3e7  a4 25		 ldy $25
$12:b3e9  21 27		 and ($27,x)
$12:b3eb  10 82		 bpl $b36f
$12:b3ed  0b			phd
$12:b3ee  86 21		 stx $21
$12:b3f0  f3 16		 sbc ($16,s),y
$12:b3f2  98			tya
$12:b3f3  64 59		 stz $59
$12:b3f5  e3 dd		 sbc $dd,s
$12:b3f7  f3 13		 sbc ($13,s),y
$12:b3f9  50 c0		 bvc $b3bb
$12:b3fb  ac 22 37	  ldy $3722
$12:b3fe  37 bf		 and [$bf],y
$12:b400  46 a8		 lsr $a8
$12:b402  71 e8		 adc ($e8),y
$12:b404  38			sec
$12:b405  ab			plb
$12:b406  5d af cd	  eor $cdaf,x
$12:b409  80 e1		 bra $b3ec
$12:b40b  e4 2e		 cpx $2e
$12:b40d  f0 ca		 beq $b3d9
$12:b40f  bc ad c4	  ldy $c4ad,x
$12:b412  1a			inc a
$12:b413  12 60		 ora ($60)
$12:b415  04 43		 tsb $43
$12:b417  42 13		 wdm #$13
$12:b419  0d 01 2c	  ora $2c01
$12:b41c  9c 42 92	  stz $9242
$12:b41f  b0 f5		 bcs $b416
$12:b421  45 a3		 eor $a3
$12:b423  e2 cc		 sep #$cc
$12:b425  8a			txa
$12:b426  f9 45 86	  sbc $8645,y
$12:b429  d7 41		 cmp [$41],y
$12:b42b  3c 04 40	  bit $4004,x
$12:b42e  66 ee		 ror $ee
$12:b430  13 20		 ora ($20,s),y
$12:b432  c8			iny
$12:b433  73 c9		 adc ($c9,s),y
$12:b435  b6 3a		 ldx $3a,y
$12:b437  53 0b		 eor ($0b,s),y
$12:b439  92 94		 sta ($94)
$12:b43b  72 2b		 adc ($2b)
$12:b43d  24 6d		 bit $6d
$12:b43f  91 f8		 sta ($f8),y
$12:b441  89 40 c2	  bit #$c240
$12:b444  47 02		 eor [$02]
$12:b446  94 4b		 sty $4b,x
$12:b448  44 d1 36	  mvp $36,$d1
$12:b44b  61 b7		 adc ($b7,x)
$12:b44d  b4 05		 ldy $05,x
$12:b44f  79 ad 6e	  adc $6ead,y
$12:b452  b9 df 79	  lda $79df,y
$12:b455  47 e8		 eor [$e8]
$12:b457  18			clc
$12:b458  0b			phd
$12:b459  41 a1		 eor ($a1,x)
$12:b45b  d0 04		 bne $b461
$12:b45d  c1 02		 cmp ($02,x)
$12:b45f  47 c2		 eor [$c2]
$12:b461  28			plp
$12:b462  d2 30		 cmp ($30)
$12:b464  97 04		 sta [$04],y
$12:b466  84 a6		 sty $a6
$12:b468  40			rti
$12:b469  a0 ed		 ldy #$ed
$12:b46b  03 42		 ora $42,s
$12:b46d  cf 1e ea f0   cmp $f0ea1e
$12:b471  8a			txa
$12:b472  14 1c		 trb $1c
$12:b474  23 07		 and $07,s
$12:b476  90 74		 bcc $b4ec
$12:b478  40			rti
$12:b479  09 00 59	  ora #$5900
$12:b47c  21 69		 and ($69,x)
$12:b47e  09 e0 40	  ora #$40e0
$12:b481  06 12		 asl $12
$12:b483  2e 94 3e	  rol $3e94
$12:b486  5a			phy
$12:b487  21 02		 and ($02,x)
$12:b489  1f 09 bd ba   ora $babd09,x
$12:b48d  fc d8 0a	  jsr ($0ad8,x)
$12:b490  1e 25 af	  asl $af25,x
$12:b493  ca			dex
$12:b494  bc 73 df	  ldy $df73,x
$12:b497  a1 45		 lda ($45,x)
$12:b499  0e 84 26	  asl $2684
$12:b49c  41 21		 eor ($21,x)
$12:b49e  58			cli
$12:b49f  87 9c		 sta [$9c]
$12:b4a1  9f 90 c0 f0   sta $f0c090,x
$12:b4a5  35 90		 and $90,x
$12:b4a7  4d 01 01	  eor $0101
$12:b4aa  11 dc		 ora ($dc),y
$12:b4ac  37 cd		 and [$cd],y
$12:b4ae  e6 28		 inc $28
$12:b4b0  02 48		 cop #$48
$12:b4b2  0a			asl a
$12:b4b3  22 50 12 69   jsl $691250
$12:b4b7  a4 a0		 ldy $a0
$12:b4b9  b8			clv
$12:b4ba  69 29 36	  adc #$3629
$12:b4bd  71 30		 adc ($30),y
$12:b4bf  ce 3b a3	  dec $a33b
$12:b4c2  30 ee		 bmi $b4b2
$12:b4c4  84 c3		 sty $c3
$12:b4c6  c5 73		 cmp $73
$12:b4c8  61 91		 adc ($91,x)
$12:b4ca  44 13 86	  mvp $86,$13
$12:b4cd  71 0d		 adc ($0d),y
$12:b4cf  10 c0		 bpl $b491
$12:b4d1  34 42		 bit $42,x
$12:b4d3  f4 16 8b	  pea $8b16
$12:b4d6  7e 46 00	  ror $0046,x
$12:b4d9  2d 0f 3c	  and $3c0f
$12:b4dc  35 bf		 and $bf,x
$12:b4de  4d f0 77	  eor $77f0
$12:b4e1  86 81		 stx $81
$12:b4e3  e5 a7		 sbc $a7
$12:b4e5  12 d0		 ora ($d0)
$12:b4e7  10 08		 bpl $b4f1
$12:b4e9  2a			rol a
$12:b4ea  20 10 07	  jsr $0710
$12:b4ed  a1 c5		 lda ($c5,x)
$12:b4ef  c3 de		 cmp $de,s
$12:b4f1  2f f6 01 b0   and $b001f6
$12:b4f5  cd 80 43	  cmp $4380
$12:b4f8  ec 2e 1a	  cpx $1a2e
$12:b4fb  c6 47		 dec $47
$12:b4fd  9c 5c e3	  stz $e35c
$12:b500  e7 9b		 sbc [$9b]
$12:b502  74 d9		 stz $d9,x
$12:b504  e8			inx
$12:b505  df 5f 7b bb   cmp $bb7b5f,x
$12:b509  df ff a1 62   cmp $62a1ff,x
$12:b50d  36 80		 rol $80,x
$12:b50f  00 90		 brk #$90
$12:b511  d8			cld
$12:b512  b4 7c		 ldy $7c,x
$12:b514  44 81 65	  mvp $65,$81
$12:b517  86 c5		 stx $c5
$12:b519  7c a3 24	  jmp ($24a3,x)
$12:b51c  11 18		 ora ($18),y
$12:b51e  7c 58 8c	  jmp ($8c58,x)
$12:b521  32 31		 and ($31)
$12:b523  fc ba 54	  jsr ($54ba,x)
$12:b526  a3 e6		 lda $e6,s
$12:b528  2e f3 20	  rol $20f3
$12:b52b  81 76		 sta ($76,x)
$12:b52d  28			plp
$12:b52e  22 40 89 fc   jsl $fc8940
$12:b532  98			tya
$12:b533  72 8e		 adc ($8e)
$12:b535  e3 77		 sbc $77,s
$12:b537  a3 fd		 lda $fd,s
$12:b539  61 8c		 adc ($8c,x)
$12:b53b  ee 57 0b	  inc $0b57
$12:b53e  c3 c0		 cmp $c0,s
$12:b540  3d a1 4a	  and $4aa1,x
$12:b543  1e 80 24	  asl $2480,x
$12:b546  22 e1 09 08   jsl $0809e1
$12:b54a  e8			inx
$12:b54b  c7 62		 cmp [$62]
$12:b54d  ac 31 38	  ldy $3831
$12:b550  92 8c		 sta ($8c)
$12:b552  96 2a		 stx $2a,y
$12:b554  c3 1b		 cmp $1b,s
$12:b556  a2 9f		 ldx #$9f
$12:b558  c8			iny
$12:b559  de 57 f5	  dec $f557,x
$12:b55c  d3 a8		 cmp ($a8,s),y
$12:b55e  85 00		 sta $00
$12:b560  0a			asl a
$12:b561  20 43 0a	  jsr $0a43
$12:b564  88			dey
$12:b565  17 f8		 ora [$f8],y
$12:b567  8b			phb
$12:b568  f3 67		 sbc ($67,s),y
$12:b56a  ab			plb
$12:b56b  7d 3d ec	  adc $ec3d,x
$12:b56e  fa			plx
$12:b56f  5d 90 06	  eor $0690,x
$12:b572  e1 b0		 sbc ($b0,x)
$12:b574  cf 3b b6 83   cmp $83b63b
$12:b578  e0 fd		 cpx #$fd
$12:b57a  10 58		 bpl $b5d4
$12:b57c  43 74		 eor $74,s
$12:b57e  01 01		 ora ($01,x)
$12:b580  09 23 f4	  ora #$f423
$12:b583  56 16		 lsr $16,x
$12:b585  1d f1 77	  ora $77f1,x
$12:b588  9f 89 10 68   sta $681089,x
$12:b58c  82 f3 13	  brl $c982
$12:b58f  4d 43 25	  eor $2543
$12:b592  df 37 61 31   cmp $316137,x
$12:b596  0e 5a c1	  asl $c15a
$12:b599  93 61		 sta ($61,s),y
$12:b59b  0f ed 1b e7   ora $e71bed
$12:b59f  ef 67 f7 9c   sbc $9cf767
$12:b5a3  81 70		 sta ($70,x)
$12:b5a5  df 7b be d2   cmp $d2be7b,x
$12:b5a9  20 fe 16	  jsr $16fe
$12:b5ac  8d 03 4d	  sta $4d03
$12:b5af  22 29 12 29   jsl $291229
$12:b5b3  9b			txy
$12:b5b4  f9 d3 e9	  sbc $e9d3,y
$12:b5b7  a2 7f		 ldx #$7f
$12:b5b9  12 bc		 ora ($bc)
$12:b5bb  08			php
$12:b5bc  52 ef		 eor ($ef)
$12:b5be  01 e8		 ora ($e8,x)
$12:b5c0  10 f3		 bpl $b5b5
$12:b5c2  40			rti
$12:b5c3  42 d7		 wdm #$d7
$12:b5c5  86 3b		 stx $3b
$12:b5c7  c6 2d		 dec $2d
$12:b5c9  1f 40 cf 91   ora $91cf40,x
$12:b5cd  86 11		 stx $11
$12:b5cf  5f 2a 46 51   eor $51462a,x
$12:b5d3  e2 f1		 sep #$f1
$12:b5d5  b4 ff		 ldy $ff,x
$12:b5d7  40			rti
$12:b5d8  17 fe		 ora [$fe],y
$12:b5da  d0 f6		 bne $b5d2
$12:b5dc  f5 98		 sbc $98,x
$12:b5de  80 21		 bra $b601
$12:b5e0  a3 74		 lda $74,s
$12:b5e2  7b			tdc
$12:b5e3  53 ca		 eor ($ca,s),y
$12:b5e5  bc ce f2	  ldy $f2ce,x
$12:b5e8  11 00		 ora ($00),y
$12:b5ea  70 5e		 bvs $b64a
$12:b5ec  24 22		 bit $22
$12:b5ee  13 10		 ora ($10,s),y
$12:b5f0  68			pla
$12:b5f1  de d0 fc	  dec $fcd0,x
$12:b5f4  32 07		 and ($07)
$12:b5f6  94 7c		 sty $7c,x
$12:b5f8  bd 4a 0d	  lda $0d4a,x
$12:b5fb  86 c7		 stx $c7
$12:b5fd  e1 b1		 sbc ($b1,x)
$12:b5ff  63 fd		 adc $fd,s
$12:b601  f9 61 b1	  sbc $b161,y
$12:b604  54 7e 27	  mvn $27,$7e
$12:b607  fc 03 8d	  jsr ($8d03,x)
$12:b60a  ef 67 fb 7b   sbc $7bfb67
$12:b60e  00 74		 brk #$74
$12:b610  12 03		 ora ($03)
$12:b612  6f 07 c9 e3   adc $e3c907
$12:b616  be 60 81	  ldx $8160,y
$12:b619  08			php
$12:b61a  08			php
$12:b61b  40			rti
$12:b61c  0f b6 37 41   ora $4137b6
$12:b620  7b			tdc
$12:b621  c9 be		 cmp #$be
$12:b623  5e e5 77	  lsr $77e5,x
$12:b626  c5 a3		 cmp $a3
$12:b628  e7 fb		 sbc [$fb]
$12:b62a  86 c5		 stx $c5
$12:b62c  7c a8 fb	  jmp ($fba8,x)
$12:b62f  4f 7a bb 5b   eor $5bbb7a
$12:b633  de cf f6	  dec $f6cf,x
$12:b636  f6 1b		 inc $1b,x
$12:b638  af cd 0c f3   lda $f30ccd
$12:b63c  87 85		 sta [$85]
$12:b63e  69 2f		 adc #$2f
$12:b640  dd 7e 20	  cmp $207e,x
$12:b643  04 04		 tsb $04
$12:b645  46 28		 lsr $28
$12:b647  27 e9		 and [$e9]
$12:b649  3d 08 dc	  and $dc08,x
$12:b64c  cf d1 31 d8   cmp $d831d1
$12:b650  f7 c9		 sbc [$c9],y
$12:b652  de ae c7	  dec $c7ae,x
$12:b655  e8			inx
$12:b656  45 a3		 eor $a3
$12:b658  f0 d3		 beq $b62d
$12:b65a  fc bf 42	  jsr ($42bf,x)
$12:b65d  2b			pld
$12:b65e  e5 86		 sbc $86
$12:b660  a3 e6		 lda $e6,s
$12:b662  19 e4 37	  ora $37e4,y
$12:b665  ea			nop
$12:b666  7b			tdc
$12:b667  74 9e		 stz $9e,x
$12:b669  46 f7		 lsr $f7
$12:b66b  b3 fd		 lda ($fd,s),y
$12:b66d  bd 94 e7	  lda $e794,x
$12:b670  78			sei
$12:b671  c5 32		 cmp $32
$12:b673  d0 0c		 bne $b681
$12:b675  ee ee 8d	  inc $8dee
$12:b678  f4 fa be	  pea $befa
$12:b67b  09 df		 ora #$df
$12:b67d  e0 0f		 cpx #$0f
$12:b67f  08			php
$12:b680  ac 50 1e	  ldy $1e50
$12:b683  42 94		 wdm #$94
$12:b685  11 f8		 ora ($f8),y
$12:b687  d1 09		 cmp ($09),y
$12:b689  04 3e		 tsb $3e
$12:b68b  bf d0 e0 7a   lda $7ae0d0,x
$12:b68f  a4 09		 ldy $09
$12:b691  fb			xce
$12:b692  97 08		 sta [$08],y
$12:b694  90 30		 bcc $b6c6
$12:b696  d2 22		 cmp ($22)
$12:b698  9e 80 ba	  stz $ba80,x
$12:b69b  30 d8		 bmi $b675
$12:b69d  42 d4		 wdm #$d4
$12:b69f  06 92		 asl $92
$12:b6a1  7f 08 4a 08   adc $084a08,x
$12:b6a5  f2 f0		 sbc ($f0)
$12:b6a7  d3 d0		 cmp ($d0,s),y
$12:b6a9  9e 86 ea	  stz $ea86,x
$12:b6ac  80 08		 bra $b6b6
$12:b6ae  4c 5a 4c	  jmp $4c5a
$12:b6b1  15 09		 ora $09,x
$12:b6b3  3a			dec a
$12:b6b4  e4 8e		 cpx $8e
$12:b6b6  41 0d		 eor ($0d,x)
$12:b6b8  be a4 02	  ldx $02a4,y
$12:b6bb  11 15		 ora ($15),y
$12:b6bd  83 85		 sta $85,s
$12:b6bf  42 0c		 wdm #$0c
$12:b6c1  a8			tay
$12:b6c2  28			plp
$12:b6c3  6e 42 11	  ror $1142
$12:b6c6  11 f1		 ora ($f1),y
$12:b6c8  f3 b9		 sbc ($b9,s),y
$12:b6ca  fe 38 94	  inc $9438,x
$12:b6cd  03 3d		 ora $3d,s
$12:b6cf  13 f1		 ora ($f1,s),y
$12:b6d1  b2 0b		 lda ($0b)
$12:b6d3  31 ad		 and ($ad),y
$12:b6d5  ce 67 58	  dec $5867
$12:b6d8  21 9c		 and ($9c,x)
$12:b6da  ce 40 1a	  dec $1a40
$12:b6dd  60			rts
$12:b6de  d6 3c		 dec $3c,x
$12:b6e0  93 3b		 sta ($3b,s),y
$12:b6e2  c1 28		 cmp ($28,x)
$12:b6e4  09 1a		 ora #$1a
$12:b6e6  37 b3		 and [$b3],y
$12:b6e8  d8			cld
$12:b6e9  1a			inc a
$12:b6ea  1f 63 bf c0   ora $c0bf63,x
$12:b6ee  1a			inc a
$12:b6ef  3b			tsc
$12:b6f0  78			sei
$12:b6f1  a0 90		 ldy #$90
$12:b6f3  c5 04		 cmp $04
$12:b6f5  22 f1 9b 98   jsl $989bf1
$12:b6f9  44 7f a5	  mvp $a5,$7f
$12:b6fc  97 2b		 sta [$2b],y
$12:b6fe  f9 a3 c6	  sbc $c6a3,y
$12:b701  0e 90 51	  asl $5190
$12:b704  7a			ply
$12:b705  42 17		 wdm #$17
$12:b707  61 14		 adc ($14,x)
$12:b709  86 c5		 stx $c5
$12:b70b  a1 d1		 lda ($d1,x)
$12:b70d  f5 00		 sbc $00,x
$12:b70f  8b			phb
$12:b710  ce 13 08	  dec $0813
$12:b713  c8			iny
$12:b714  a9 c2		 lda #$c2
$12:b716  2b			pld
$12:b717  19 8c a9	  ora $a98c,y
$12:b71a  c1 42		 cmp ($42,x)
$12:b71c  03 c0		 ora $c0,s
$12:b71e  ea			nop
$12:b71f  d3 b5		 cmp ($b5,s),y
$12:b721  da			phx
$12:b722  fc cf 8d	  jsr ($8dcf,x)
$12:b725  84 11		 sty $11
$12:b727  18			clc
$12:b728  8b			phb
$12:b729  08			php
$12:b72a  e1 52		 sbc ($52,x)
$12:b72c  99 52 fc	  sta $fc52,y
$12:b72f  32 6e		 and ($6e)
$12:b731  65 69		 adc $69
$12:b733  8e 75 9b	  stx $9b75
$12:b736  f2 a0		 sbc ($a0)
$12:b738  59 05 85	  eor $8505,y
$12:b73b  e2 40		 sep #$40
$12:b73d  f3 77		 sbc ($77,s),y
$12:b73f  f8			sed
$12:b740  03 46		 ora $46,s
$12:b742  ea			nop
$12:b743  7e c3 bf	  ror $bfc3,x
$12:b746  8d 7c 8d	  sta $8d7c
$12:b749  e5 7f		 sbc $7f
$12:b74b  34 79		 bit $79,x
$12:b74d  e6 d2		 inc $d2
$12:b74f  86 83		 stx $83
$12:b751  68			pla
$12:b752  a4 36		 ldy $36
$12:b754  2d 0e 87	  and $870e
$12:b757  47 e1		 eor [$e1]
$12:b759  b0 d5		 bcs $b730
$12:b75b  18			clc
$12:b75c  43 61		 eor $61,s
$12:b75e  1d 54 a0	  ora $a054,x
$12:b761  aa			tax
$12:b762  42 2b		 wdm #$2b
$12:b764  19 5b 02	  ora $025b,y
$12:b767  a4 21		 ldy $21
$12:b769  b9 08 44	  lda $4408,y
$12:b76c  26 57		 rol $57
$12:b76e  11 60		 ora ($60),y
$12:b770  07 8d		 ora [$8d]
$12:b772  86 0c		 stx $0c
$12:b774  04 cc		 tsb $cc
$12:b776  6b			rtl
$12:b777  75 d2		 adc $d2,x
$12:b779  b7 14		 lda [$14],y
$12:b77b  34 03		 bit $03,x
$12:b77d  24 cd		 bit $cd
$12:b77f  fd 70 25	  sbc $2570,x
$12:b782  28			plp
$12:b783  d9 68 06	  cmp $0668,y
$12:b786  77 2e		 adc [$2e],y
$12:b788  85 37		 sta $37
$12:b78a  7f 80 34 fc   adc $fc3480,x
$12:b78e  a1 6f		 lda ($6f,x)
$12:b790  13 f8		 ora ($f8,s),y
$12:b792  e2 7f		 sep #$7f
$12:b794  23 4f		 and $4f,s
$12:b796  2a			rol a
$12:b797  bf 54 7f 2a   lda $2a7f54,x
$12:b79b  a0 4d		 ldy #$4d
$12:b79d  81 ba		 sta ($ba,x)
$12:b79f  d5 a1		 cmp $a1,x
$12:b7a1  0c 57 8a	  tsb $8a57
$12:b7a4  88			dey
$12:b7a5  16 22		 asl $22,x
$12:b7a7  86 48		 stx $48
$12:b7a9  4a			lsr a
$12:b7aa  34 13		 bit $13,x
$12:b7ac  40			rti
$12:b7ad  b2 18		 lda ($18)
$12:b7af  6c 5a 4c	  jmp ($4c5a)
$12:b7b2  57 09		 eor [$09],y
$12:b7b4  3a			dec a
$12:b7b5  6c 11 81	  jmp ($8111)
$12:b7b8  75 84		 adc $84,x
$12:b7ba  64 51		 stz $51
$12:b7bc  40			rti
$12:b7bd  8a			txa
$12:b7be  08			php
$12:b7bf  ac 1c ae	  ldy $ae1c
$12:b7c2  10 64		 bpl $b828
$12:b7c4  58			cli
$12:b7c5  42 74		 wdm #$74
$12:b7c7  97 dd		 sta [$dd],y
$12:b7c9  7e 67 c6	  ror $c667,x
$12:b7cc  c1 28		 cmp ($28,x)
$12:b7ce  94 03		 sty $03,x
$12:b7d0  3d 13 85	  and $8513,x
$12:b7d3  73 b9		 adc ($b9,s),y
$12:b7d5  fe 38 8e	  inc $8e38,x
$12:b7d8  bf 26 e2 48   lda $48e226,x
$12:b7dc  03 a4		 ora $a4,s
$12:b7de  33 ac		 and ($ac,s),y
$12:b7e0  b0 68		 bcs $b84a
$12:b7e2  83 3f		 sta $3f,s
$12:b7e4  9b			txy
$12:b7e5  28			plp
$12:b7e6  d7 16		 cmp [$16],y
$12:b7e8  89 e6		 bit #$e6
$12:b7ea  b5 ae		 lda $ae,x
$12:b7ec  fc ca 6b	  jsr ($6bca,x)
$12:b7ef  60			rts
$12:b7f0  10 dd		 bpl $b7cf
$12:b7f2  06 85		 asl $85
$12:b7f4  14 01		 trb $01
$12:b7f6  10 d0		 bpl $b7c8
$12:b7f8  04 01		 tsb $01
$12:b7fa  62 50 80	  per $384d
$12:b7fd  78			sei
$12:b7fe  08			php
$12:b7ff  2e 12 1f	  rol $1f12
$12:b802  d0 f7		 bne $b7fb
$12:b804  83 c2		 sta $c2,s
$12:b806  88			dey
$12:b807  51 98		 eor ($98),y
$12:b809  6c 04 9e	  jmp ($9e04)
$12:b80c  34 c3		 bit $c3,x
$12:b80e  13 97		 ora ($97,s),y
$12:b810  00 9c		 brk #$9c
$12:b812  46 2a		 lsr $2a
$12:b814  1f 09 87 ce   ora $ce8709,x
$12:b818  5e 83 f5	  lsr $f583,x
$12:b81b  24 17		 bit $17
$12:b81d  88			dey
$12:b81e  a2 4a		 ldx #$4a
$12:b820  b0 2c		 bcs $b84e
$12:b822  20 b9 a1	  jsr $a1b9
$12:b825  03 79		 ora $79,s
$12:b827  84 c2		 sty $c2
$12:b829  1c 53 ae	  trb $ae53
$12:b82c  d7 e6		 cmp [$e6],y
$12:b82e  c0 ca		 cpy #$ca
$12:b830  f3 1c		 sbc ($1c,s),y
$12:b832  ec a6 54	  cpx $54a6
$12:b835  ef 0c ab ca   sbc $caab0c
$12:b839  dc 40 40	  jml [$4040]
$12:b83c  0d 06 86	  ora $8606
$12:b83f  1b			tcs
$12:b840  a1 09		 lda ($09,x)
$12:b842  86 80		 stx $80
$12:b844  76 50		 ror $50,x
$12:b846  18			clc
$12:b847  0c 08 81	  tsb $8108
$12:b84a  41 f0		 eor ($f0,x)
$12:b84c  07 90		 ora [$90]
$12:b84e  85 62		 sta $62
$12:b850  d1 f7		 cmp ($f7),y
$12:b852  08			php
$12:b853  40			rti
$12:b854  5c 60 21 78   jml $782160
$12:b858  ac 64 58	  ldy $5864
$12:b85b  30 21		 bmi $b87e
$12:b85d  84 08		 sty $08
$12:b85f  44 7b 63	  mvp $63,$7b
$12:b862  a1 16		 lda ($16,x)
$12:b864  d9 28 47	  cmp $4728,y
$12:b867  a0 1f		 ldy #$1f
$12:b869  f1 87		 sbc ($87),y
$12:b86b  90 7d		 bcc $b8ea
$12:b86d  34 0b		 bit $0b,x
$12:b86f  24 2d		 bit $2d
$12:b871  31 28		 and ($28),y
$12:b873  18			clc
$12:b874  48			pha
$12:b875  dd 04 e8	  cmp $e804,x
$12:b878  23 a9		 and $a9,s
$12:b87a  78			sei
$12:b87b  0c b1 3f	  tsb $3fb1
$12:b87e  83 2c		 sta $2c,s
$12:b880  1c 30 7f	  trb $7f30
$12:b883  09 58		 ora #$58
$12:b885  0a			asl a
$12:b886  1e 01 9a	  asl $9a01,x
$12:b889  d6 eb		 dec $eb,x
$12:b88b  a5 6f		 lda $6f
$12:b88d  0a			asl a
$12:b88e  ca			dex
$12:b88f  3f 41 00 5a   and $5a0041,x
$12:b893  0d 0e 80	  ora $800e
$12:b896  26 0d		 rol $0d
$12:b898  65 28		 adc $28
$12:b89a  59 30 97	  eor $9730,y
$12:b89d  06 d3		 asl $d3
$12:b89f  88			dey
$12:b8a0  41 e8		 eor ($e8,x)
$12:b8a2  50 30		 bvc $b8d4
$12:b8a4  bf 04 05 af   lda $af0504,x
$12:b8a8  08			php
$12:b8a9  61 64		 adc ($64,x)
$12:b8ab  d1 20		 cmp ($20),y
$12:b8ad  58			cli
$12:b8ae  77 c5		 adc [$c5],y
$12:b8b0  de 3f f4	  dec $f43f,x
$12:b8b3  08			php
$12:b8b4  24 01		 bit $01
$12:b8b6  64 85		 stz $85
$12:b8b8  a4 71		 ldy $71
$12:b8ba  01 c0		 ora ($c0,x)
$12:b8bc  18			clc
$12:b8bd  48			pha
$12:b8be  6a			ror a
$12:b8bf  47 08		 eor [$08]
$12:b8c1  24 b1		 bit $b1
$12:b8c3  3a			dec a
$12:b8c4  0e 09 46	  asl $4609
$12:b8c7  86 bf		 stx $bf
$12:b8c9  36 02		 rol $02,x
$12:b8cb  48			pha
$12:b8cc  00 24		 brk #$24
$12:b8ce  33 bc		 and ($bc,s),y
$12:b8d0  ee 7b c4	  inc $c47b
$12:b8d3  35 f9		 and $f9,x
$12:b8d5  57 8e		 eor [$8e],y
$12:b8d7  34 4b		 bit $4b,x
$12:b8d9  41 a1		 eor ($a1,x)
$12:b8db  09 90		 ora #$90
$12:b8dd  48			pha
$12:b8de  61 b0		 adc ($b0,x)
$12:b8e0  08			php
$12:b8e1  01 ff		 ora ($ff,x)
$12:b8e3  03 a0		 ora $a0,s
$12:b8e5  d1 a1		 cmp ($a1),y
$12:b8e7  59 07 f9	  eor $f907,y
$12:b8ea  5e 14 52	  lsr $5214,x
$12:b8ed  8c 8f 4a	  sty $4a8f
$12:b8f0  8b			phb
$12:b8f1  4d 31 39	  eor $3931
$12:b8f4  70 5a		 bvs $b950
$12:b8f6  20 61 c2	  jsr $c261
$12:b8f9  ff 9c 3d 03   sbc $033d9c,x
$12:b8fd  84 f1		 sty $f1
$12:b8ff  49 71		 eor #$71
$12:b901  44 d1 60	  mvp $60,$d1
$12:b904  59 41 7b	  eor $7b41,y
$12:b907  0b			phd
$12:b908  d0 7a		 bne $b984
$12:b90a  30 96		 bmi $b8a2
$12:b90c  fc 8b 06	  jsr ($068b,x)
$12:b90f  01 0d		 ora ($0d,x)
$12:b911  86 c0		 stx $c0
$12:b913  60			rts
$12:b914  50 88		 bvc $b89e
$12:b916  4b			phk
$12:b917  c9 e0		 cmp #$e0
$12:b919  0f 00 84 bd   ora $bd8400
$12:b91d  00 07		 brk #$07
$12:b91f  0f f1 08 54   ora $5408f1
$12:b923  20 1f a0	  jsr $a01f
$12:b926  ee 7f 10	  inc $107f
$12:b929  8b			phb
$12:b92a  58			cli
$12:b92b  28			plp
$12:b92c  c1 40		 cmp ($40,x)
$12:b92e  e9 20		 sbc #$20
$12:b930  68			pla
$12:b931  9a			txs
$12:b932  66 2a		 ror $2a
$12:b934  2f 79 ff 5f   and $5fff79
$12:b938  c2 81		 rep #$81
$12:b93a  f3 97		 sbc ($97,s),y
$12:b93c  a8			tay
$12:b93d  fd 69 ec	  sbc $ec69,x
$12:b940  58			cli
$12:b941  81 03		 sta ($03,x)
$12:b943  42 02		 wdm #$02
$12:b945  ef a7 91 00   sbc $0091a7
$12:b949  61 e4		 adc ($e4,x)
$12:b94b  00 20		 brk #$20
$12:b94d  12 48		 ora ($48)
$12:b94f  04 5e		 tsb $5e
$12:b951  01 0d		 ora ($0d,x)
$12:b953  8b			phb
$12:b954  47 c4		 eor [$c4]
$12:b956  48			pha
$12:b957  41 37		 eor ($37,x)
$12:b959  78			sei
$12:b95a  43 62		 eor $62,s
$12:b95c  b1 91		 lda ($91),y
$12:b95e  92 08		 sta ($08)
$12:b960  8c 3e 21	  sty $213e
$12:b963  16 19		 asl $19,x
$12:b965  18			clc
$12:b966  3e 82 24	  rol $2482,x
$12:b969  f2 02		 sbc ($02)
$12:b96b  8e 13 f8	  stx $f813
$12:b96e  3e 34 44	  rol $4434,x
$12:b971  15 0b		 ora $0b,x
$12:b973  c6 89		 dec $89
$12:b975  4c 49 c5	  jmp $c549
$12:b978  10 fe		 bpl $b978
$12:b97a  49 3a		 eor #$3a
$12:b97c  07 8a		 ora [$8a]
$12:b97e  4a			lsr a
$12:b97f  cb			wai
$12:b980  e2 a2		 sep #$a2
$12:b982  f4 9f b5	  pea $b59f
$12:b985  24 00		 bit $00
$12:b987  2b			pld
$12:b988  f0 78		 beq $ba02
$12:b98a  48			pha
$12:b98b  70 40		 bvs $b9cd
$12:b98d  12 bf		 ora ($bf)
$12:b98f  00 50		 brk #$50
$12:b991  99 38 74	  sta $7438,y
$12:b994  63 b1		 adc $b1,s
$12:b996  3e 18 9c	  rol $9c18,x
$12:b999  49 46		 eor #$46
$12:b99b  4b			phk
$12:b99c  13 61		 ora ($61,s),y
$12:b99e  40			rti
$12:b99f  46 e8		 lsr $e8
$12:b9a1  77 93		 adc [$93],y
$12:b9a3  17 93		 ora [$93],y
$12:b9a5  e9 7e		 sbc #$7e
$12:b9a7  25 0e		 and $0e
$12:b9a9  a2 a0		 ldx #$a0
$12:b9ab  24 98		 bit $98
$12:b9ad  54 5a 6a	  mvn $6a,$5a
$12:b9b0  45 d1		 eor $d1
$12:b9b2  60			rts
$12:b9b3  f9 04 7e	  sbc $7e04,y
$12:b9b6  23 7c		 and $7c,s
$12:b9b8  fc 29 1a	  jsr ($1a29,x)
$12:b9bb  36 8a		 rol $8a,x
$12:b9bd  c3 d4		 cmp $d4,s
$12:b9bf  39 02 05	  and $0502,y
$12:b9c2  93 c1		 sta ($c1,s),y
$12:b9c4  a1 b0		 lda ($b0,x)
$12:b9c6  08			php
$12:b9c7  01 34		 ora ($34,x)
$12:b9c9  1f f2 fc 12   ora $12fcf2,x
$12:b9cd  76 3f		 ror $3f,x
$12:b9cf  44 21 a6	  mvp $a6,$21
$12:b9d2  ec 0e f8	  cpx $f80e
$12:b9d5  38			sec
$12:b9d6  68			pla
$12:b9d7  85 19		 sta $19
$12:b9d9  1e 95 12	  asl $1295,x
$12:b9dc  98			tya
$12:b9dd  62 72 e0	  per $9a52
$12:b9e0  93 c4		 sta ($c4,s),y
$12:b9e2  c5 65		 cmp $65
$12:b9e4  fe 17 81	  inc $8117,x
$12:b9e7  c7 cc		 cmp [$cc]
$12:b9e9  59 08 31	  eor $3108,y
$12:b9ec  42 6f		 wdm #$6f
$12:b9ee  cd 9e bd	  cmp $bd9e
$12:b9f1  f4 68 43	  pea $4368
$12:b9f4  68			pla
$12:b9f5  b4 d7		 ldy $d7,x
$12:b9f7  93 d1		 sta ($d1,s),y
$12:b9f9  61 b0		 adc ($b0,x)
$12:b9fb  17 7e		 ora [$7e],y
$12:b9fd  c2 5d		 rep #$5d
$12:b9ff  fb			xce
$12:ba00  08			php
$12:ba01  77 88		 adc [$88],y
$12:ba03  84 df		 sty $df
$12:ba05  60			rts
$12:ba06  21 20		 and ($20,x)
$12:ba08  69 10		 adc #$10
$12:ba0a  91 7e		 sta ($7e),y
$12:ba0c  03 24		 ora $24,s
$12:ba0e  17 8a		 ora [$8a],y
$12:ba10  bc 08 52	  ldy $5208,x
$12:ba13  2f 18 0c 08   and $080c18
$12:ba17  86 05		 stx $05
$12:ba19  27 1f		 and [$1f]
$12:ba1b  f8			sed
$12:ba1c  c1 4e		 cmp ($4e,x)
$12:ba1e  0c 2f 18	  tsb $182f
$12:ba21  b4 7d		 ldy $7d,x
$12:ba23  03 22		 ora $22,s
$12:ba25  f1 8a		 sbc ($8a),y
$12:ba27  c6 52		 dec $52
$12:ba29  32 6f		 and ($6f)
$12:ba2b  f5 7f		 sbc $7f,x
$12:ba2d  b0 3d		 bcs $ba6c
$12:ba2f  a3 ed		 lda $ed,s
$12:ba31  ea			nop
$12:ba32  29 84		 and #$84
$12:ba34  36 89		 rol $89,x
$12:ba36  4c 79 c5	  jmp $c579
$12:ba39  10 86		 bpl $b9c1
$12:ba3b  0f 1c 31 00   ora $00311c
$12:ba3f  07 0a		 ora [$0a]
$12:ba41  40			rti
$12:ba42  01 01		 ora ($01,x)
$12:ba44  13 3f		 ora ($3f,s),y
$12:ba46  40			rti
$12:ba47  44 00 f1	  mvp $f1,$00
$12:ba4a  38			sec
$12:ba4b  38			sec
$12:ba4c  00 0f		 brk #$0f
$12:ba4e  00 63		 brk #$63
$12:ba50  a3 29		 lda $29,s
$12:ba52  3b			tsc
$12:ba53  c2 12		 rep #$12
$12:ba55  1f 02 84 8f   ora $8f8402,x
$12:ba59  f9 41 b0	  sbc $b041,y
$12:ba5c  d8			cld
$12:ba5d  fc 36 2c	  jsr ($2c36,x)
$12:ba60  7f b8 cc 36   adc $36ccb8,x
$12:ba64  2a			rol a
$12:ba65  8f c3 7e b7   sta $b77ec3
$12:ba69  bd 7f ed	  lda $ed7f,x
$12:ba6c  0f 6f 5c 36   ora $365c6f
$12:ba70  8b			phb
$12:ba71  4d 78 bd	  eor $bd78
$12:ba74  14 74		 trb $74
$12:ba76  10 17		 bpl $ba8f
$12:ba78  7e 1b 45	  ror $451b,x
$12:ba7b  e1 83		 sbc ($83,x)
$12:ba7d  00 a2		 brk #$a2
$12:ba7f  88			dey
$12:ba80  01 f4		 ora ($f4,x)
$12:ba82  02 45		 cop #$45
$12:ba84  86 96		 stx $96
$12:ba86  81 52		 sta ($52,x)
$12:ba88  46 e8		 lsr $e8
$12:ba8a  36 01		 rol $01,x
$12:ba8c  7f a0 46 d0   adc $d046a0,x
$12:ba90  16 81		 asl $81,x
$12:ba92  42 47		 wdm #$47
$12:ba94  fc 9f e8	  jsr ($e89f,x)
$12:ba97  6c 5a 3e	  jmp ($3e5a)
$12:ba9a  7f b8 6c 56   adc $566cb8,x
$12:ba9e  32 8f		 and ($8f)
$12:baa0  b4 f7		 ldy $f7,x
$12:baa2  37 bd		 and [$bd],y
$12:baa4  7f ed 0f 6f   adc $6f0fed,x
$12:baa8  58			cli
$12:baa9  b8			clv
$12:baaa  28			plp
$12:baab  94 c7		 sty $c7,x
$12:baad  93 d1		 sta ($d1,s),y
$12:baaf  1b			tcs
$12:bab0  c0 1e 07	  cpy #$071e
$12:bab3  8e 0c c1	  stx $c10c
$12:bab6  e3 e2		 sbc $e2,s
$12:bab8  11 7d		 ora ($7d),y
$12:baba  80 99		 bra $ba55
$12:babc  01 a4		 ora ($a4,x)
$12:babe  a6 23		 ldx $23
$12:bac0  73 3f		 adc ($3f,s),y
$12:bac2  44 c1 4a	  mvp $4a,$c1
$12:bac5  e1 81		 sbc ($81,x)
$12:bac7  1b			tcs
$12:bac8  42 02		 wdm #$02
$12:baca  4f 71 e7 b7   eor $b7e771
$12:bace  81 43		 sta ($43,x)
$12:bad0  d1 68		 cmp ($68),y
$12:bad2  fc 34 ff	  jsr ($ff34,x)
$12:bad5  2d e0 8a	  and $8ae0
$12:bad8  c6 61		 dec $61
$12:bada  a8			tay
$12:badb  f9 36 fa	  sbc $fa36,y
$12:bade  b7 d7		 lda [$d7],y
$12:bae0  de cf f6	  dec $f6cf,x
$12:bae3  f6 72		 inc $72,x
$12:bae5  ba			tsx
$12:bae6  1b			tcs
$12:bae7  8d cf 0f	  sta $0fcf
$12:baea  8d 00 ce	  sta $ce00
$12:baed  f1 f9		 sbc ($f9),y
$12:baef  af 84 e5 74   lda $74e584
$12:baf3  5e 23 be	  lsr $be23,x
$12:baf6  7a			ply
$12:baf7  86 ff		 stx $ff
$12:baf9  9a			txs
$12:bafa  e9 5e		 sbc #$5e
$12:bafc  93 c5		 sta ($c5,s),y
$12:bafe  9b			txy
$12:baff  c9 d8		 cmp #$d8
$12:bb01  ec 87 c3	  cpx $c387
$12:bb04  87 bc		 sta [$bc]
$12:bb06  02 97		 cop #$97
$12:bb08  e8			inx
$12:bb09  52 52		 eor ($52)
$12:bb0b  ed c8 bc	  sbc $bcc8
$12:bb0e  44 64 f7	  mvp $f7,$64
$12:bb11  01 49		 ora ($49,x)
$12:bb13  fd b6 db	  sbc $dbb6,x
$12:bb16  9e 98 c8	  stz $c898,x
$12:bb19  f7 a2		 sbc [$a2],y
$12:bb1b  80 80		 bra $ba9d
$12:bb1d  12 4a		 ora ($4a)
$12:bb1f  f9 ca a5	  sbc $a5ca,y
$12:bb22  ee 08 73	  inc $7308
$12:bb25  fa			plx
$12:bb26  27 87		 and [$87]
$12:bb28  dc a4 19	  jml [$19a4]
$12:bb2b  68			pla
$12:bb2c  01 18		 ora ($18,x)
$12:bb2e  65 8d		 adc $8d
$12:bb30  e1 2e		 sbc ($2e,x)
$12:bb32  8f f6 a7 0b   sta $0ba7f6
$12:bb36  e2 99		 sep #$99
$12:bb38  0b			phd
$12:bb39  56 f8		 lsr $f8,x
$12:bb3b  03 48		 ora $48,s
$12:bb3d  4b			phk
$12:bb3e  79 b7 3c	  adc $3cb7,y
$12:bb41  04 8f		 tsb $8f
$12:bb43  03 0d		 ora $0d,s
$12:bb45  32 0e		 and ($0e)
$12:bb47  ef 81 b9 dd   sbc $ddb981
$12:bb4b  1e 03 4b	  asl $4b03,x
$12:bb4e  ca			dex
$12:bb4f  bd e0 21	  lda $21e0,x
$12:bb52  38			sec
$12:bb53  74 19		 stz $19,x
$12:bb55  65 f8		 adc $f8
$12:bb57  9f ec fa 20   sta $20faec,x
$12:bb5b  38			sec
$12:bb5c  79 fb ae	  adc $aefb,y
$12:bb5f  02 11		 cop #$11
$12:bb61  09 c7		 ora #$c7
$12:bb63  41 cc		 eor ($cc,x)
$12:bb65  a1 06		 lda ($06,x)
$12:bb67  86 aa		 stx $aa
$12:bb69  01 30		 ora ($30,x)
$12:bb6b  1c 5c 35	  trb $355c
$12:bb6e  f7 01		 sbc [$01],y
$12:bb70  ea			nop
$12:bb71  f5 62		 sbc $62,x
$12:bb73  64 26		 stz $26
$12:bb75  50 90		 bvc $bb07
$12:bb77  aa			tax
$12:bb78  05 50		 ora $50
$12:bb7a  19 08 44	  ora $4408,y
$12:bb7d  46 15		 lsr $15
$12:bb7f  ce e7 c4	  dec $c4e7
$12:bb82  62 50 0c	  per $c7d5
$12:bb85  f4 4f c6	  pea $c64f
$12:bb88  c8			iny
$12:bb89  2c c6 b7	  bit $b7c6
$12:bb8c  39 9d 60	  and $609d,y
$12:bb8f  86 73		 stx $73
$12:bb91  39 00 69	  and $6900,y
$12:bb94  83 58		 sta $58,s
$12:bb96  f2 4c		 sbc ($4c)
$12:bb98  ef 3c 83 bf   sbc $bf833c
$12:bb9c  03 28		 ora $28,s
$12:bb9e  19 07 ec	  ora $ec07,y
$12:bba1  4b			phk
$12:bba2  80 56		 bra $bbfa
$12:bba4  3c 11 c8	  bit $c811,x
$12:bba7  4b			phk
$12:bba8  87 20		 sta [$20]
$12:bbaa  79 01 d1	  adc $d101,y
$12:bbad  1a			inc a
$12:bbae  c8			iny
$12:bbaf  3c 87 90	  bit $9087,x
$12:bbb2  97 8a		 sta [$8a],y
$12:bbb4  88			dey
$12:bbb5  52 42		 eor ($42)
$12:bbb7  f3 3c		 sbc ($3c,s),y
$12:bbb9  84 78		 sty $78
$12:bbbb  7c 84 a5	  jmp ($a584,x)
$12:bbbe  7e 88 e4	  ror $e488,x
$12:bbc1  89 4c		 bit #$4c
$12:bbc3  7d 01 40	  adc $4001,x
$12:bbc6  12 53		 ora ($53)
$12:bbc8  9b			txy
$12:bbc9  2c 32 94	  bit $9432
$12:bbcc  00 8e		 brk #$8e
$12:bbce  12 c2		 ora ($c2)
$12:bbd0  20 8a 47	  jsr $478a
$12:bbd3  95 ab		 sta $ab,x
$12:bbd5  e6 e9		 inc $e9
$12:bbd7  77 1b		 adc [$1b],y
$12:bbd9  9e 92 00	  stz $0092,x
$12:bbdc  4e 24 1f	  lsr $1f24
$12:bbdf  0c ff 03	  tsb $03ff
$12:bbe2  73 c3		 adc ($c3,s),y
$12:bbe4  cf ff 52 81   cmp $8152ff
$12:bbe8  c0 40		 cpy #$40
$12:bbea  82 08 08	  brl $c3f5
$12:bbed  81 23		 sta ($23,x)
$12:bbef  c3 f1		 cmp $f1,s
$12:bbf1  3f dc 58 b4   and $b458dc,x
$12:bbf5  66 33		 ror $33
$12:bbf7  0d e2 70	  ora $70e2
$12:bbfa  77 3c		 adc [$3c],y
$12:bbfc  98			tya
$12:bbfd  c6 a7		 dec $a7
$12:bbff  f5 09		 sbc $09,x
$12:bc01  84 64		 sty $64
$12:bc03  61 b0		 adc ($b0,x)
$12:bc05  d8			cld
$12:bc06  ac 86 42	  ldy $4286
$12:bc09  b2 0e		 lda ($0e)
$12:bc0b  26 7f		 rol $7f
$12:bc0d  91 10		 sta ($10),y
$12:bc0f  a1 fe		 lda ($fe,x)
$12:bc11  b5 da		 lda $da,x
$12:bc13  fc cf 8d	  jsr ($8dcf,x)
$12:bc16  84 11		 sty $11
$12:bc18  18			clc
$12:bc19  8b			phb
$12:bc1a  08			php
$12:bc1b  a1 51		 lda ($51,x)
$12:bc1d  09 4e		 ora #$4e
$12:bc1f  dd 7e 19	  cmp $197e,x
$12:bc22  37 32		 and [$32],y
$12:bc24  b4 c3		 ldy $c3,x
$12:bc26  3b			tsc
$12:bc27  18			clc
$12:bc28  94 ca		 sty $ca,x
$12:bc2a  99 f6 cc	  sta $ccf6,y
$12:bc2d  09 52		 ora #$52
$12:bc2f  68			pla
$12:bc30  1d f8 12	  ora $12f8,x
$12:bc33  b0 33		 bcs $bc68
$12:bc35  01 28		 ora ($28,x)
$12:bc37  a6 86		 ldx $86
$12:bc39  e0 97		 cpx #$97
$12:bc3b  0f 9f f5 2f   ora $2ff59f
$12:bc3f  12 17		 ora ($17)
$12:bc41  d8			cld
$12:bc42  95 11		 sta $11,x
$12:bc44  e1 21		 sbc ($21,x)
$12:bc46  1e 84 50	  asl $5084,x
$12:bc49  b2 f3		 lda ($f3)
$12:bc4b  b0 8f		 bcs $bbdc
$12:bc4d  8c 70 b1	  sty $b170
$12:bc50  e1 18		 sbc ($18,x)
$12:bc52  a2 80		 ldx #$80
$12:bc54  58			cli
$12:bc55  a2 c2		 ldx #$c2
$12:bc57  46 01		 lsr $01
$12:bc59  d0 00		 bne $bc5b
$12:bc5b  62 66 03	  per $bfc4
$12:bc5e  98			tya
$12:bc5f  08			php
$12:bc60  c0 f4		 cpy #$f4
$12:bc62  5a			phy
$12:bc63  5d c6 eb	  eor $ebc6,x
$12:bc66  a4 85		 ldy $85
$12:bc68  0d 5f 37	  ora $375f
$12:bc6b  4b			phk
$12:bc6c  ca			dex
$12:bc6d  17 02		 ora [$02],y
$12:bc6f  28			plp
$12:bc70  11 61		 ora ($61),y
$12:bc72  c3 cf		 cmp $cf,s
$12:bc74  ff 52 a3 c0   sbc $c0a352,x
$12:bc78  dc a5 03	  jml [$03a5]
$12:bc7b  f5 a9		 sbc $a9,x
$12:bc7d  8c 6e 37	  sty $376e
$12:bc80  3c 2e 2c	  bit $2c2e,x
$12:bc83  5a			phy
$12:bc84  32 a6		 and ($a6)
$12:bc86  08			php
$12:bc87  6f 13 fd c5   adc $c5fd13
$12:bc8b  c3 48		 cmp $48,s
$12:bc8d  e8			inx
$12:bc8e  71 0e		 adc ($0e),y
$12:bc90  56 7f		 lsr $7f,x
$12:bc92  8b			phb
$12:bc93  0d 8a c8	  ora $c88a
$12:bc96  56 c1		 lsr $c1,x
$12:bc98  0d 5c 86	  ora $865c
$12:bc9b  42 11		 wdm #$11
$12:bc9d  09 95		 ora #$95
$12:bc9f  c4 22		 cpy $22
$12:bca1  31 1f		 and ($1f),y
$12:bca3  1b			tcs
$12:bca4  0c 18 20	  tsb $2018
$12:bca7  c2 2c		 rep #$2c
$12:bca9  c6 b7		 dec $b7
$12:bcab  5d 2b 8c	  eor $8c2b,x
$12:bcae  38			sec
$12:bcaf  9d a2 19	  sta $19a2,x
$12:bcb2  26 68		 rol $68
$12:bcb4  c4 1a		 cpy $1a
$12:bcb6  38			sec
$12:bcb7  64 07		 stz $07
$12:bcb9  79 f1 a0	  adc $a0f1,y
$12:bcbc  19 de 3a	  ora $3ade,y
$12:bcbf  68			pla
$12:bcc0  37 3d		 and [$3d],y
$12:bcc2  0d c8 55	  ora $55c8
$12:bcc5  39 bb e7	  and $e7bb,y
$12:bcc8  b8			clv
$12:bcc9  6f df 43 d1   adc $d143df
$12:bccd  7f 33 d9 7a   adc $7ad933,x
$12:bcd1  5b			tcd
$12:bcd2  93 5a		 sta ($5a,s),y
$12:bcd4  01 4b		 ora ($4b,x)
$12:bcd6  7b			tdc
$12:bcd7  c0 ec		 cpy #$ec
$12:bcd9  76 45		 ror $45,x
$12:bcdb  60			rts
$12:bcdc  48			pha
$12:bcdd  0a			asl a
$12:bcde  b0 04		 bcs $bce4
$12:bce0  2a			rol a
$12:bce1  ef 52 14 83   sbc $831452
$12:bce5  ec 1f 60	  cpx $601f
$12:bce8  60			rts
$12:bce9  0d 30 04	  ora $0430
$12:bcec  34 fc		 bit $fc,x
$12:bcee  dd e0 dc	  cmp $dce0,x
$12:bcf1  fa			plx
$12:bcf2  9c 9d b7	  stz $b79d
$12:bcf5  34 da		 bit $da,x
$12:bcf7  3f 93 f0 11   and $11f093,x
$12:bcfb  8f 75 4b e4   sta $e44b75
$12:bcff  5f 09 e4 7b   eor $7be409,x
$12:bd03  12 30		 ora ($30)
$12:bd05  ee cb 41	  inc $41cb
$12:bd08  f7 2e		 sbc [$2e],y
$12:bd0a  8c b0 c6	  sty $c6b0
$12:bd0d  3c dd 29	  bit $29dd,x
$12:bd10  18			clc
$12:bd11  72 fc		 adc ($fc)
$12:bd13  4f fd 4c ba   eor $ba4cfd
$12:bd17  1c ad 59	  trb $59ad
$12:bd1a  d0 14		 bne $bd30
$12:bd1c  21 c3		 and ($c3,x)
$12:bd1e  cb			wai
$12:bd1f  1d c6 1b	  ora $1bc6,x
$12:bd22  80 91		 bra $bcb5
$12:bd24  e2 2e		 sep #$2e
$12:bd26  79 f0 d0	  adc $d0f0,y
$12:bd29  70 f3		 bvs $bd1e
$12:bd2b  ea			nop
$12:bd2c  b0 43		 bcs $bd71
$12:bd2e  1e 1a 13	  asl $131a,x
$12:bd31  88			dey
$12:bd32  bd e1 f8	  lda $f8e1,x
$12:bd35  89 40		 bit #$40
$12:bd37  5c 84 5a 0e   jml $0e5a84
$12:bd3b  67 08		 adc [$08]
$12:bd3d  36 02		 rol $02,x
$12:bd3f  13 08		 ora ($08,s),y
$12:bd41  c4 5d		 cpy $5d
$12:bd43  61 19		 adc ($19,x)
$12:bd45  18			clc
$12:bd46  6a			ror a
$12:bd47  c4 62		 cpy $62
$12:bd49  b2 13		 lda ($13)
$12:bd4b  38			sec
$12:bd4c  48			pha
$12:bd4d  70 1e		 bvs $bd6d
$12:bd4f  af 56 22 fb   lda $fb2256
$12:bd53  af cc f8 d8   lda $d8f8cc
$12:bd57  25 12		 and $12
$12:bd59  80 67		 bra $bdc2
$12:bd5b  a2 70		 ldx #$70
$12:bd5d  ae 77 3e	  ldx $3e77
$12:bd60  23 11		 and $11,s
$12:bd62  d7 e4		 cmp [$e4],y
$12:bd64  dc 49 00	  jml [$0049]
$12:bd67  74 86		 stz $86,x
$12:bd69  75 96		 adc $96,x
$12:bd6b  0d 10 67	  ora $6710
$12:bd6e  f3 65		 sbc ($65,s),y
$12:bd70  1a			inc a
$12:bd71  e2 d1		 sep #$d1
$12:bd73  3c d6 b5	  bit $b5d6,x
$12:bd76  df 99 4d 6c   cmp $6c4d99,x
$12:bd7a  03 07		 ora $07,s
$12:bd7c  de ef 60	  dec $60ef,x
$12:bd7f  c2 6f		 rep #$6f
$12:bd81  84 84		 sty $84
$12:bd83  40			rti
$12:bd84  22 d0 e1 0c   jsl $0ce1d0
$12:bd88  45 d5		 eor $d5
$12:bd8a  41 00		 eor ($00,x)
$12:bd8c  87 90		 sta [$90]
$12:bd8e  80 63		 bra $bdf3
$12:bd90  18			clc
$12:bd91  00 f0		 brk #$f0
$12:bd93  0c 30 5d	  tsb $5d30
$12:bd96  d0 11		 bne $bda9
$12:bd98  79 fe 8c	  adc $8cfe,y
$12:bd9b  80 63		 bra $be00
$12:bd9d  02 4c		 cop #$4c
$12:bd9f  1a			inc a
$12:bda0  06 ae		 asl $ae
$12:bda2  64 13		 stz $13
$12:bda4  40			rti
$12:bda5  8f 4c f2 5a   sta $5af24c
$12:bda9  73 ba		 adc ($ba,s),y
$12:bdab  8b			phb
$12:bdac  88			dey
$12:bdad  ee 49 23	  inc $2349
$12:bdb0  1d ca 28	  ora $28ca,x
$12:bdb3  49 2d 48	  eor #$482d
$12:bdb6  a4 ec		 ldy $ec
$12:bdb8  29 34 af	  and #$af34
$12:bdbb  d4 c9		 pei ($c9)
$12:bdbd  64 34		 stz $34
$12:bdbf  99 99 74	  sta $7499,y
$12:bdc2  62 b5 0a	  per $c87a
$12:bdc5  8e c6 a3	  stx $a3c6
$12:bdc8  52 fd		 eor ($fd)
$12:bdca  4e 98 43	  lsr $4398
$12:bdcd  51 9d		 eor ($9d),y
$12:bdcf  93 46		 sta ($46,s),y
$12:bdd1  1b			tcs
$12:bdd2  0d c1 34	  ora $34c1
$12:bdd5  83 0d		 sta $0d,s
$12:bdd7  23 c3		 and $c3,s
$12:bdd9  b4 85		 ldy $85,x
$12:bddb  a6 21		 ldx $21
$12:bddd  e0 86		 cpx #$86
$12:bddf  93 42		 sta ($42,s),y
$12:bde1  10 e2		 bpl $bdc5
$12:bde3  9d 76 bf	  sta $bf76,x
$12:bde6  36 06		 rol $06,x
$12:bde8  57 98		 eor [$98],y
$12:bdea  67 62		 adc [$62]
$12:bdec  12 99		 ora ($99)
$12:bdee  53 bc		 eor ($bc,s),y
$12:bdf0  32 af		 and ($af)
$12:bdf2  28			plp
$12:bdf3  8c 3f 41	  sty $413f
$12:bdf6  c4 18		 cpy $18
$12:bdf8  5c 18 49 b0   jml $b04918
$12:bdfc  92 08		 sta ($08)
$12:bdfe  44 06 03	  mvp $03,$06
$12:be01  02 c0		 cop #$c0
$12:be03  b4 00		 ldy $00,x
$12:be05  44 d8 40	  mvp $40,$d8
$12:be08  f8			sed
$12:be09  38			sec
$12:be0a  80 42		 bra $be4e
$12:be0c  f1 68		 sbc ($68),y
$12:be0e  c9 34 20	  cmp #$2034
$12:be11  2e 30 10	  rol $1030
$12:be14  bc 56 42	  ldy $4256,x
$12:be17  5d 08 14	  eor $1408,x
$12:be1a  08			php
$12:be1b  61 0d		 adc ($0d,x)
$12:be1d  00 1e		 brk #$1e
$12:be1f  60			rts
$12:be20  e8			inx
$12:be21  45 b6		 eor $b6
$12:be23  4a			lsr a
$12:be24  11 e8		 ora ($e8),y
$12:be26  07 ec		 ora [$ec]
$12:be28  d9 83 af	  cmp $af83,y
$12:be2b  25 aa		 and $aa
$12:be2d  68			pla
$12:be2e  16 48		 asl $48,x
$12:be30  d1 0c		 cmp ($0c),y
$12:be32  32 74		 and ($74)
$12:be34  cf 40 c2 4c   cmp $4cc240
$12:be38  03 8c		 ora $8c,s
$12:be3a  11 a5		 ora ($a5),y
$12:be3c  87 c1		 sta [$c1]
$12:be3e  34 95		 bit $95,x
$12:be40  78			sei
$12:be41  10 83		 bpl $bdc6
$12:be43  e9 37 01	  sbc #$0137
$12:be46  c3 01		 cmp $01,s
$12:be48  f0 95		 beq $bddf
$12:be4a  c4 00		 cpy $00
$12:be4c  4e f1 0c	  lsr $0cf1
$12:be4f  d6 b7		 dec $b7,x
$12:be51  5d 2b 8c	  eor $8c2b,x
$12:be54  3c 67 28	  bit $2867,x
$12:be57  fd 08 14	  sbc $1408,x
$12:be5a  83 0b		 sta $0b,s
$12:be5c  83 09		 sta $09,s
$12:be5e  3e 11 c4	  rol $c411,x
$12:be61  10 8c		 bpl $bdef
$12:be63  29 4a 11	  and #$114a
$12:be66  65 02		 adc $02
$12:be68  c7 2e		 cmp [$2e]
$12:be6a  40			rti
$12:be6b  a7 21		 lda [$21]
$12:be6d  e0 c4		 cpx #$c4
$12:be6f  c8			iny
$12:be70  50 52		 bvc $bec4
$12:be72  e1 04		 sbc ($04,x)
$12:be74  05 0e		 ora $0e
$12:be76  c5 3c		 cmp $3c
$12:be78  03 0b		 ora $0b,s
$12:be7a  26 89		 rol $89
$12:be7c  02 c3		 cop #$c3
$12:be7e  a2 50		 ldx #$50
$12:be80  b1 6f		 lda ($6f),y
$12:be82  8f be 04 d1   sta $d104be
$12:be86  08			php
$12:be87  b4 65		 ldy $65,x
$12:be89  64 85		 stz $85
$12:be8b  a4 71		 ldy $71
$12:be8d  01 00		 ora ($00,x)
$12:be8f  22 ac 33 25   jsl $2533ac
$12:be93  23 84		 and $84,s
$12:be95  16 00		 asl $00,x
$12:be97  d3 6c		 cmp ($6c,s),y
$12:be99  32 74		 and ($74)
$12:be9b  53 a0		 eor ($a0,s),y
$12:be9d  e0 94		 cpx #$94
$12:be9f  68			pla
$12:bea0  6b			rtl
$12:bea1  f3 60		 sbc ($60,s),y
$12:bea3  24 80		 bit $80
$12:bea5  02 43		 cop #$43
$12:bea7  3b			tsc
$12:bea8  ce e7 bc	  dec $bce7
$12:beab  43 5f		 eor $5f,s
$12:bead  95 78		 sta $78,x
$12:beaf  e4 27		 cpx $27
$12:beb1  0b			phd
$12:beb2  83 08		 sta $08,s
$12:beb4  bf 7b bd 00   lda $00bd7b,x
$12:beb8  80 17		 bra $bed1
$12:beba  c2 1c		 rep #$1c
$12:bebc  21 88		 and ($88,x)
$12:bebe  b8			clv
$12:bebf  74 21		 stz $21,x
$12:bec1  38			sec
$12:bec2  80 e8		 bra $beac
$12:bec4  0c 6a 10	  tsb $106a
$12:bec7  30 d8		 bmi $bea1
$12:bec9  10 c3		 bpl $be8e
$12:becb  ca			dex
$12:becc  25 fa		 and $fa
$12:bece  c5 94		 cmp $94
$12:bed0  58			cli
$12:bed1  5e 3f a3	  lsr $a33f,x
$12:bed4  91 0d		 sta ($0d),y
$12:bed6  e6 70		 inc $70
$12:bed8  71 43		 adc ($43),y
$12:beda  a2 42 50	  ldx #$5042
$12:bedd  01 40		 ora ($40,x)
$12:bedf  41 d0		 eor ($d0,x)
$12:bee1  fd 8e cc	  sbc $cc8e,x
$12:bee4  4f 0a a4 d2   eor $d2a40a
$12:bee8  69 b0 9a	  adc #$9ab0
$12:beeb  4d 7f 53	  eor $537f
$12:beee  65 98		 adc $98
$12:bef0  cd c3 a3	  cmp $a3c3
$12:bef3  89 aa cf	  bit #$cfaa
$12:bef6  27 9b		 and [$9b]
$12:bef8  19 e4 f7	  ora $f7e4,y
$12:befb  f5 3e		 sbc $3e,x
$12:befd  61 8c		 adc ($8c,x)
$12:beff  fc 5a 38	  jsr ($385a,x)
$12:bf02  7c 13 44	  jmp ($4413,x)
$12:bf05  b0 d2		 bcs $bed9
$12:bf07  36 81		 rol $81,x
$12:bf09  43 43		 eor $43,s
$12:bf0b  a3 09		 lda $09,s
$12:bf0d  6f ce 06 00   adc $0006ce
$12:bf11  ed 08 6e	  sbc $6e08
$12:bf14  02 03		 cop #$03
$12:bf16  02 6f		 cop #$6f
$12:bf18  83 c9		 sta $c9,s
$12:bf1a  dd e2 e0	  cmp $e0e2,x
$12:bf1d  a8			tay
$12:bf1e  4b			phk
$12:bf1f  bc 21 b8	  ldy $b821,x
$12:bf22  30 94		 bmi $beb8
$12:bf24  61 21		 adc ($21,x)
$12:bf26  10 08		 bpl $bf30
$12:bf28  b4 38		 ldy $38,x
$12:bf2a  43 11		 eor $11,s
$12:bf2c  70 08		 bvs $bf36
$12:bf2e  40			rti
$12:bf2f  21 ee		 and ($ee,x)
$12:bf31  d1 18		 cmp ($18),y
$12:bf33  bb			tyx
$12:bf34  c4 05		 cpy $05
$12:bf36  fa			plx
$12:bf37  2e e0 f0	  rol $f0e0
$12:bf3a  0c 07 f4	  tsb $f407
$12:bf3d  63 52		 adc $52,s
$12:bf3f  5a			phy
$12:bf40  98			tya
$12:bf41  d8			cld
$12:bf42  d2 25		 cmp ($25)
$12:bf44  d4 31		 pei ($31)
$12:bf46  02 8d		 cop #$8d
$12:bf48  8d be 3e	  sta $3ebe
$12:bf4b  24 21		 bit $21
$12:bf4d  1a			inc a
$12:bf4e  49 06 28	  eor #$2806
$12:bf51  df 84 27 fd   cmp $fd2784,x
$12:bf55  61 ec		 adc ($ec,x)
$12:bf57  1c 81 42	  trb $4281
$12:bf5a  21 30		 and ($30,x)
$12:bf5c  17 7d		 ora [$7d],y
$12:bf5e  3c 88 03	  bit $0388,x
$12:bf61  10 18		 bpl $bf7b
$12:bf63  10 08		 bpl $bf6d
$12:bf65  30 b8		 bmi $bf1f
$12:bf67  30 92		 bmi $befb
$12:bf69  e1 00		 sbc ($00,x)
$12:bf6b  44 f0 0c	  mvp $0c,$f0
$12:bf6e  0c 5a 32	  tsb $325a
$12:bf71  22 48 68 48   jsl $486848
$12:bf75  a0 50 8c	  ldy #$8c50
$12:bf78  0c 56 42	  tsb $4256
$12:bf7b  32 41		 and ($41)
$12:bf7d  11 87		 ora ($87),y
$12:bf7f  c6 1a		 dec $1a
$12:bf81  42 51		 wdm #$51
$12:bf83  91 83		 sta ($83),y
$12:bf85  c3 1d		 cmp $1d,s
$12:bf87  0e 29 4c	  asl $4c29
$12:bf8a  5c 1a 18 86   jml $86181a
$12:bf8e  40			rti
$12:bf8f  98			tya
$12:bf90  a0 1e 18	  ldy #$181e
$12:bf93  83 15		 sta $15,s
$12:bf95  bc 00 e3	  ldy $e300,x
$12:bf98  82 f0 38	  brl $f88b
$12:bf9b  c3 98		 cmp $98,s
$12:bf9d  8f f4 e6 23   sta $23e6f4
$12:bfa1  79 34 df	  adc $df34,y
$12:bfa4  16 db		 asl $db,x
$12:bfa6  02 f9		 cop #$f9
$12:bfa8  7e a9 ec	  ror $eca9,x
$12:bfab  33 c5		 and ($c5,s),y
$12:bfad  ba			tsx
$12:bfae  48			pha
$12:bfaf  df 0c 94 3f   cmp $3f940c,x
$12:bfb3  c7 e9		 cmp [$e9]
$12:bfb5  d2 50		 cmp ($50)
$12:bfb7  01 78		 ora ($78,x)
$12:bfb9  03 05		 ora $05,s
$12:bfbb  e1 21		 sbc ($21,x)
$12:bfbd  c1 00		 cmp ($00,x)
$12:bfbf  4b			phk
$12:bfc0  e8			inx
$12:bfc1  01 43		 ora ($43,x)
$12:bfc3  85 c1		 sta $c1
$12:bfc5  84 db		 sty $db
$12:bfc7  08			php
$12:bfc8  0a			asl a
$12:bfc9  00 98		 brk #$98
$12:bfcb  8e 8c 76	  stx $768c
$12:bfce  24 20		 bit $20
$12:bfd0  c0 1f c0	  cpy #$c01f
$12:bfd3  4e 24 a3	  lsr $a324
$12:bfd6  25 88		 and $88
$12:bfd8  a8			tay
$12:bfd9  5f 20 37 32   eor $323720,x
$12:bfdd  13 0b		 ora ($0b,s),y
$12:bfdf  06 2d		 asl $2d
$12:bfe1  0e 28 44	  asl $4428
$12:bfe4  5c 78 10 88   jml $881078
$12:bfe8  7b			tdc
$12:bfe9  89 5c 47	  bit #$475c
$12:bfec  80 7d		 bra $c06b
$12:bfee  01 7f		 ora ($7f,x)
$12:bff0  0b			phd
$12:bff1  bc 4d 02	  ldy $024d,x
$12:bff4  f8			sed
$12:bff5  fe b1 ed	  inc $edb1,x
$12:bff8  d0 4a		 bne $c044
$12:bffa  20 f0 4b	  jsr $4bf0
$12:bffd  e0 e9 0f	  cpx #$0fe9
$12:c000  6a			ror a
$12:c001  51 d1		 eor ($d1),y
$12:c003  a5 56		 lda $56
$12:c005  73 ab		 adc ($ab,s),y
$12:c007  b0 4f		 bcs $c058
$12:c009  87 a6		 sta [$a6]
$12:c00b  59 49 b4	  eor $b449,y
$12:c00e  9d 46 96	  sta $9646,x
$12:c011  62 f0 b4	  per $7504
$12:c014  68			pla
$12:c015  9a			txs
$12:c016  10 22		 bpl $c03a
$12:c018  68			pla
$12:c019  1b			tcs
$12:c01a  41 e0		 eor ($e0,x)
$12:c01c  d8			cld
$12:c01d  18			clc
$12:c01e  04 00		 tsb $00
$12:c020  9a			txs
$12:c021  0f f9 7e 0c   ora $0c7ef9
$12:c025  27 0b		 and [$0b]
$12:c027  83 08		 sta $08,s
$12:c029  c4 35		 cpy $35
$12:c02b  fa			plx
$12:c02c  38			sec
$12:c02d  e2 85		 sep #$85
$12:c02f  3f 42 05 88   and $880542,x
$12:c033  7e 80 c6	  ror $c680,x
$12:c036  a1 03		 lda ($03,x)
$12:c038  0d 84 8c	  ora $8c84
$12:c03b  02 70		 cop #$70
$12:c03d  fd 09 c9	  sbc $c909,x
$12:c040  45 07		 eor $07
$12:c042  89 40 7e	  bit #$7e40
$12:c045  85 07		 sta $07
$12:c047  f4 62 32	  pea $3262
$12:c04a  62 2d 15	  per $d57a
$12:c04d  a4 43		 ldy $43
$12:c04f  d3 5a		 cmp ($5a,s),y
$12:c051  ab			plb
$12:c052  50 31		 bvc $c085
$12:c054  63 11		 adc $11,s
$12:c056  17 85		 ora [$85],y
$12:c058  20 a4 4d	  jsr $4da4
$12:c05b  35 7e		 and $7e,x
$12:c05d  8e 32 8e	  stx $8e32
$12:c060  62 33 bb	  per $7b96
$12:c063  42 75		 wdm #$75
$12:c065  8c 45 c5	  sty $c545
$12:c068  cc 07 49	  cpy $4907
$12:c06b  8d 38 b2	  sta $b238
$12:c06e  e5 09		 sbc $09
$12:c070  ea			nop
$12:c071  b6 23		 ldx $23,y
$12:c073  d3 28		 cmp ($28,s),y
$12:c075  95 b2		 sta $b2,x
$12:c077  0d c1 6e	  ora $6ec1
$12:c07a  04 3e		 tsb $3e
$12:c07c  00 72		 brk #$72
$12:c07e  9c 04 05	  stz $0504
$12:c081  de 2e b3	  dec $b32e,x
$12:c084  75 26		 adc $26,x
$12:c086  02 12		 cop #$12
$12:c088  ef 0a a4 d3   sbc $d3a40a
$12:c08c  65 b0		 adc $b0
$12:c08e  d9 cd 7f	  cmp $7fcd,y
$12:c091  53 60		 eor ($60,s),y
$12:c093  98			tya
$12:c094  cd f0 10	  cmp $10f0
$12:c097  88			dey
$12:c098  04 56		 tsb $56
$12:c09a  ab			plb
$12:c09b  3c da 6c	  bit $6cda,x
$12:c09e  76 b3		 ror $b3,x
$12:c0a0  df d4 f8 46   cmp $46f8d4,x
$12:c0a4  33 f0		 and ($f0,s),y
$12:c0a6  68			pla
$12:c0a7  c3 61		 cmp $61,s
$12:c0a9  b8			clv
$12:c0aa  21 90		 and ($90,x)
$12:c0ac  e1 a4		 sbc ($a4,x)
$12:c0ae  78			sei
$12:c0af  71 91		 adc ($91),y
$12:c0b1  87 82		 sta [$82]
$12:c0b3  1a			inc a
$12:c0b4  0d 08 41	  ora $4108
$12:c0b7  0a			asl a
$12:c0b8  47 e3		 eor [$e3]
$12:c0ba  01 81		 ora ($81,x)
$12:c0bc  10 c0		 bpl $c07e
$12:c0be  a4 e3		 ldy $e3
$12:c0c0  ff 18 06 0c   sbc $0c0618,x
$12:c0c4  e5 42		 sbc $42
$12:c0c6  f1 8b		 sbc ($8b),y
$12:c0c8  46 50		 lsr $50
$12:c0ca  32 2f		 and ($2f)
$12:c0cc  18			clc
$12:c0cd  ac 85 23	  ldy $2385
$12:c0d0  22 f1 50 58   jsl $5850f1
$12:c0d4  2c 16 1e	  bit $1e16
$12:c0d7  c1 f6		 cmp ($f6,x)
$12:c0d9  97 b7		 sta [$b7],y
$12:c0db  a4 a6		 ldy $a6
$12:c0dd  18			clc
$12:c0de  80 30		 bra $c110
$12:c0e0  3c e2 01	  bit $01e2,x
$12:c0e3  08			php
$12:c0e4  84 bc		 sty $bc
$12:c0e6  40			rti
$12:c0e7  04 cf		 tsb $cf
$12:c0e9  d0 76		 bne $c161
$12:c0eb  81 08		 sta ($08,x)
$12:c0ed  31 14		 and ($14),y
$12:c0ef  8a			txa
$12:c0f0  4e c2 92	  lsr $92c2
$12:c0f3  13 2a		 ora ($2a,s),y
$12:c0f5  57 ea		 eor [$ea],y
$12:c0f7  65 49		 adc $49
$12:c0f9  99 94 83	  sta $8394,y
$12:c0fc  13 50		 ora ($50,s),y
$12:c0fe  a8			tay
$12:c0ff  ec 6a 22	  cpx $226a
$12:c102  32 a9		 and ($a9)
$12:c104  7e a7 55	  ror $55a7,x
$12:c107  19 d9 08	  ora $08d9,y
$12:c10a  30 f8		 bmi $c104
$12:c10c  21 92		 and ($92,x)
$12:c10e  e1 a4		 sbc ($a4,x)
$12:c110  63 11		 adc $11,s
$12:c112  31 d1		 and ($d1),y
$12:c114  8c 9d e1	  sty $e19d
$12:c117  09 0f 81	  ora #$810f
$12:c11a  42 47		 wdm #$47
$12:c11c  fd 83 37	  sbc $3783,x
$12:c11f  ec 66 1b	  cpx $1b66
$12:c122  16 3f		 asl $3f,x
$12:c124  dc 86 1b	  jml [$1b86]
$12:c127  15 47		 ora $47,x
$12:c129  e2 7f		 sep #$7f
$12:c12b  40			rti
$12:c12c  4e b7 f6	  lsr $f6b7
$12:c12f  47 b6		 eor [$b6]
$12:c131  7c 04 50	  jmp ($5004,x)
$12:c134  f0 50		 beq $c186
$12:c136  3c 5e 01	  bit $015e,x
$12:c139  80 28		 bra $c163
$12:c13b  83 bc		 sta $bc,s
$12:c13d  1d 60 fa	  ora $fa60,x
$12:c140  06 f2		 asl $f2
$12:c142  e0 08		 cpx #$08
$12:c144  a1 0f		 lda ($0f,x)
$12:c146  aa			tax
$12:c147  4d 26 bf	  eor $bf26
$12:c14a  a9 b4		 lda #$b4
$12:c14c  d3 61		 cmp ($61,s),y
$12:c14e  34 0a		 bit $0a,x
$12:c150  8c dd f8	  sty $f8dd
$12:c153  10 88		 bpl $c0dd
$12:c155  ad 56 79	  lda $7956
$12:c158  3d fd 4f	  and $4ffd,x
$12:c15b  a7 9b		 lda [$9b]
$12:c15d  19 e0 94	  ora $94e0,y
$12:c160  67 f8		 adc [$f8]
$12:c162  02 90		 cop #$90
$12:c164  60			rts
$12:c165  85 e1		 sta $e1
$12:c167  86 91		 stx $91
$12:c169  e1 c5		 sbc ($c5,x)
$12:c16b  e2 35		 sep #$35
$12:c16d  2c 31 b0	  bit $b031
$12:c170  0c b0 65	  tsb $65b0
$12:c173  48			pha
$12:c174  11 94		 ora ($94),y
$12:c176  05 a0		 ora $a0
$12:c178  50 91		 bvc $c10b
$12:c17a  ff 60 cd fb   sbc $fbcd60,x
$12:c17e  0d 8b 46	  ora $468b
$12:c181  4f f7 0d 8a   eor $8a0df7
$12:c185  c8			iny
$12:c186  51 f6		 eor ($f6),y
$12:c188  9e e8 02	  stz $02e8,x
$12:c18b  bf d8 1e d1   lda $d11ed8,x
$12:c18f  f6 f5		 inc $f5,x
$12:c191  40			rti
$12:c192  b1 10		 lda ($10),y
$12:c194  0f d3 c8 f1   ora $f1c8d3
$12:c198  73 0f		 adc ($0f,s),y
$12:c19a  d4 01		 pei ($01)
$12:c19c  f6 30		 inc $30,x
$12:c19e  87 80		 sta [$80]
$12:c1a0  3e c5 f4	  rol $f4c5,x
$12:c1a3  60			rts
$12:c1a4  63 84		 adc $84,s
$12:c1a6  e2 29		 sep #$29
$12:c1a8  14 9a		 trb $9a
$12:c1aa  4d 2b f5	  eor $f52b
$12:c1ad  32 a4		 and ($a4)
$12:c1af  ec 02 e3	  cpx $e302
$12:c1b2  33 7e		 and ($7e,s),y
$12:c1b4  8e 26 a1	  stx $a126
$12:c1b7  51 a8		 eor ($a8),y
$12:c1b9  d4 bf		 pei ($bf)
$12:c1bb  53 aa		 eor ($aa,s),y
$12:c1bd  8e c4 4e	  stx $4ec4
$12:c1c0  33 b0		 and ($b0,s),y
$12:c1c2  68			pla
$12:c1c3  e1 f0		 sbc ($f0,x)
$12:c1c5  43 10		 eor $10,s
$12:c1c7  c3 48		 cmp $48,s
$12:c1c9  c6 04		 dec $04
$12:c1cb  31 05		 and ($05),y
$12:c1cd  70 97		 bvs $c166
$12:c1cf  ef 02 fb 08   sbc $08fb02
$12:c1d3  11 b4		 ora ($b4),y
$12:c1d5  20 24 f7	  jsr $f724
$12:c1d8  26 08		 rol $08
$12:c1da  ff b0 66 fa   sbc $fa66b0,x
$12:c1de  57 0c		 eor [$0c],y
$12:c1e0  5a			phy
$12:c1e1  33 0d		 and ($0d,s),y
$12:c1e3  3f cb ec 22   and $22eccb,x
$12:c1e7  b2 18		 lda ($18)
$12:c1e9  6a			ror a
$12:c1ea  3e 5f 61	  rol $615f,x
$12:c1ed  0d 4f d8	  ora $d84f
$12:c1f0  19 d6 be	  ora $bed6,y
$12:c1f3  c6 f6		 dec $f6
$12:c1f5  bf 81 93 95   lda $959381,x
$12:c1f9  d0 dc		 bne $c1d7
$12:c1fb  6e 78 7c	  ror $7c78
$12:c1fe  68			pla
$12:c1ff  06 77		 asl $77
$12:c201  8f c0 ed 72   sta $72edc0
$12:c205  b8			clv
$12:c206  0f 20 dc 72   ora $72dc20
$12:c20a  ba			tsx
$12:c20b  2f 11 df 3d   and $3ddf11
$12:c20f  43 7e		 eor $7e,s
$12:c211  fb			xce
$12:c212  0d d3 ec	  ora $ecd3
$12:c215  fa			plx
$12:c216  4f 16 dc f6   eor $f6dc16
$12:c21a  9f 63 da ec   sta $ecda63,x
$12:c21e  76 43		 ror $43,x
$12:c220  e1 c3		 sbc ($c3,x)
$12:c222  de 01 63	  dec $6301,x
$12:c225  72 2f		 adc ($2f)
$12:c227  11 19		 ora ($19),y
$12:c229  3d db 6d	  and $6ddb,x
$12:c22c  b9 e9 8c	  lda $8ce9,y
$12:c22f  8f 7a 08 5b   sta $5b087a
$12:c233  e7 2a		 sbc [$2a]
$12:c235  97 b8		 sta [$b8],y
$12:c237  21 a8		 and ($a8,x)
$12:c239  68			pla
$12:c23a  c9 e1		 cmp #$e1
$12:c23c  f7 29		 sbc [$29],y
$12:c23e  06 58		 asl $58
$12:c240  8b			phb
$12:c241  3f da 9c 2f   and $2f9cda,x
$12:c245  8a			txa
$12:c246  64 37		 stz $37
$12:c248  c9 f2		 cmp #$f2
$12:c24a  ae 78 09	  ldx $0978
$12:c24d  1e 06 1a	  asl $1a06,x
$12:c250  64 1d		 stz $1d
$12:c252  d8			cld
$12:c253  21 39		 and ($39,x)
$12:c255  57 bc		 eor [$bc],y
$12:c257  04 27		 tsb $27
$12:c259  0e 83 2c	  asl $2c83
$12:c25c  bf 13 fd 9f   lda $9ffd13,x
$12:c260  7d 8e 7e	  adc $7e8e,x
$12:c263  eb			xba
$12:c264  80 84		 bra $c1ea
$12:c266  42 71		 wdm #$71
$12:c268  d0 77		 bne $c2e1
$12:c26a  a8			tay
$12:c26b  41 a1		 eor ($a1,x)
$12:c26d  aa			tax
$12:c26e  80 4c		 bra $c2bc
$12:c270  07 17		 ora [$17]
$12:c272  0d 7d c0	  ora $c07d
$12:c275  7a			ply
$12:c276  bd 58 99	  lda $9958,x
$12:c279  0b			phd
$12:c27a  d4 24		 pei ($24)
$12:c27c  2a			rol a
$12:c27d  81 54		 sta ($54,x)
$12:c27f  06 42		 asl $42
$12:c281  11 11		 ora ($11),y
$12:c283  85 73		 sta $73
$12:c285  b9 f1 18	  lda $18f1,y
$12:c288  94 03		 sty $03,x
$12:c28a  3d 13 f1	  and $f113,x
$12:c28d  b2 0b		 lda ($0b)
$12:c28f  31 ad		 and ($ad),y
$12:c291  ce 67 58	  dec $5867
$12:c294  21 9c		 and ($9c,x)
$12:c296  ce 40 1a	  dec $1a40
$12:c299  60			rts
$12:c29a  d6 3c		 dec $3c,x
$12:c29c  93 3b		 sta ($3b,s),y
$12:c29e  c7 29		 cmp [$29]
$12:c2a0  da			phx
$12:c2a1  0c 8f 05	  tsb $058f
$12:c2a4  ea			nop
$12:c2a5  02 d1		 cop #$d1
$12:c2a7  e8			inx
$12:c2a8  0e 8d fc	  asl $fc8d
$12:c2ab  5c 11 88 8b   jml $8b8811
$12:c2af  83 a2		 sta $a2,s
$12:c2b1  5a			phy
$12:c2b2  30 70		 bmi $c324
$12:c2b4  01 cb		 ora ($cb,x)
$12:c2b6  b4 2d		 ldy $2d,x
$12:c2b8  1e 90 01	  asl $0190,x
$12:c2bb  03 e2		 ora $e2,s
$12:c2bd  09 2e		 ora #$2e
$12:c2bf  57 68		 eor [$68],y
$12:c2c1  f2 7d		 sbc ($7d)
$12:c2c3  8e c8 d0	  stx $d0c8
$12:c2c6  1f 07 d7 e5   ora $e5d707,x
$12:c2ca  1a			inc a
$12:c2cb  50 14		 bvc $c2e1
$12:c2cd  06 a0		 asl $a0
$12:c2cf  04 97		 tsb $97
$12:c2d1  5b			tcd
$12:c2d2  af 05 08 18   lda $180805
$12:c2d6  b4 0f		 ldy $0f,x
$12:c2d8  40			rti
$12:c2d9  19 2e ff	  ora $ff2e,y
$12:c2dc  58			cli
$12:c2dd  7e a0 65	  ror $65a0,x
$12:c2e0  ed 77 e9	  sbc $e977
$12:c2e3  6f 02 16 80   adc $801602
$12:c2e7  3c 5f 29	  bit $295f,x
$12:c2ea  f7 10		 sbc [$10],y
$12:c2ec  57 32		 eor [$32],y
$12:c2ee  f7 7f		 sbc [$7f],y
$12:c2f0  a9 e7		 lda #$e7
$12:c2f2  c2 23		 rep #$23
$12:c2f4  9f fe a5 00   sta $00a5fe,x
$12:c2f8  30 5c		 bmi $c356
$12:c2fa  b8			clv
$12:c2fb  2d 2e 47	  and $472e
$12:c2fe  87 e2		 sta [$e2]
$12:c300  7f b8 b1 68   adc $68b1b8,x
$12:c304  cc 66 1b	  cpy $1b66
$12:c307  c4 04		 cpy $04
$12:c309  87 26		 sta [$26]
$12:c30b  31 a9		 and ($a9),y
$12:c30d  fb			xce
$12:c30e  c2 61		 rep #$61
$12:c310  19 18 6c	  ora $6c18,y
$12:c313  36 2b		 rol $2b,x
$12:c315  21 90		 and ($90,x)
$12:c317  ac 83 89	  ldy $8983
$12:c31a  9f e4 44 28   sta $2844e4,x
$12:c31e  75 3d		 adc $3d,x
$12:c320  76 bf		 ror $bf,x
$12:c322  33 e3		 and ($e3,s),y
$12:c324  61 04		 adc ($04,x)
$12:c326  46 22		 lsr $22
$12:c328  c2 28		 rep #$28
$12:c32a  54 42 53	  mvn $53,$42
$12:c32d  b7 5f		 lda [$5f],y
$12:c32f  86 4d		 stx $4d
$12:c331  cc ad 30	  cpy $30ad
$12:c334  ce c6 25	  dec $25c6
$12:c337  32 a6		 and ($a6)
$12:c339  7d b3 02	  adc $02b3,x
$12:c33c  55 b9		 eor $b9,x
$12:c33e  08			php
$12:c33f  87 6b		 sta [$6b]
$12:c341  84 13		 sty $13
$12:c343  0d d0 50	  ora $50d0
$12:c346  0a			asl a
$12:c347  05 b8		 ora $b8
$12:c349  0a			asl a
$12:c34a  07 00		 ora [$00]
$12:c34c  48			pha
$12:c34d  0f 30 dc 6e   ora $6edc30
$12:c351  ba			tsx
$12:c352  00 50		 brk #$50
$12:c354  38			sec
$12:c355  97 41		 sta [$41],y
$12:c357  de 03 a0	  dec $a003,x
$12:c35a  79 81 d0	  adc $d081,y
$12:c35d  90 04		 bcc $c363
$12:c35f  75 04		 adc $04,x
$12:c361  00 00		 brk #$00
$12:c363  53 a4		 eor ($a4,s),y
$12:c365  08			php
$12:c366  4e 97 5d	  lsr $5d97
$12:c369  e0 7d		 cpx #$7d
$12:c36b  8e cf 68	  stx $68cf
$12:c36e  6a			ror a
$12:c36f  07 13		 ora [$13]
$12:c371  eb			xba
$12:c372  00 10		 brk #$10
$12:c374  d4 05		 pei ($05)
$12:c376  f5 ef		 sbc $ef,x
$12:c378  84 0c		 sty $0c
$12:c37a  30 05		 bmi $c381
$12:c37c  51 0d		 eor ($0d),y
$12:c37e  14 15		 trb $15
$12:c380  f2 00		 sbc ($00)
$12:c382  1a			inc a
$12:c383  22 8b c0 c2   jsl $c2c08b
$12:c387  ad ca a5	  lda $a5ca
$12:c38a  de c4 19	  dec $19c4,x
$12:c38d  f7 82		 sbc [$82],y
$12:c38f  84 0f		 sty $0f
$12:c391  3f fd 4a 88   and $884afd,x
$12:c395  a8			tay
$12:c396  73 f5		 adc ($f5,s),y
$12:c398  3d 4c 60	  and $604c,x
$12:c39b  42 3c		 wdm #$3c
$12:c39d  58			cli
$12:c39e  b4 65		 ldy $65,x
$12:c3a0  4c 10 de	  jmp $de10
$12:c3a3  27 fb		 and [$fb]
$12:c3a5  8b			phb
$12:c3a6  86 91		 stx $91
$12:c3a8  d0 e2		 bne $c38c
$12:c3aa  1c ac ff	  trb $ffac
$12:c3ad  16 1b		 asl $1b,x
$12:c3af  15 90		 ora $90,x
$12:c3b1  ad 82 1a	  lda $1a82
$12:c3b4  b9 0c 84	  lda $840c,y
$12:c3b7  22 13 2b 88   jsl $882b13
$12:c3bb  44 62 3e	  mvp $3e,$62
$12:c3be  36 18		 rol $18,x
$12:c3c0  30 41		 bmi $c403
$12:c3c2  84 59		 sty $59
$12:c3c4  8d 6e ba	  sta $ba6e
$12:c3c7  57 18		 eor [$18],y
$12:c3c9  71 3b		 adc ($3b),y
$12:c3cb  44 32 4c	  mvp $4c,$32
$12:c3ce  d1 88		 cmp ($88),y
$12:c3d0  34 70		 bit $70,x
$12:c3d2  32 5b		 and ($5b)
$12:c3d4  8e d7 0f	  stx $0fd7
$12:c3d7  8d 00 ce	  sta $ce00
$12:c3da  f1 c6		 sbc ($c6),y
$12:c3dc  01 b9		 ora ($b9,x)
$12:c3de  07 03		 ora [$03]
$12:c3e0  bc c9 61	  ldy $61c9,x
$12:c3e3  be 7b 86	  ldx $867b,y
$12:c3e6  fd f4 3d	  sbc $3df4,x
$12:c3e9  11 88		 ora ($88),y
$12:c3eb  16 88		 asl $88,x
$12:c3ed  96 0f		 stx $0f,y
$12:c3ef  65 e9		 adc $e9
$12:c3f1  3f a7 7b c0   and $c07ba7,x
$12:c3f5  ec 76 45	  cpx $4576
$12:c3f8  60			rts
$12:c3f9  ef 81 48 1b   sbc $1b4881
$12:c3fd  80 dc		 bra $c3db
$12:c3ff  06 94		 asl $94
$12:c401  e1 ef		 sbc ($ef,x)
$12:c403  06 e7		 asl $e7
$12:c405  d4 e4		 pei ($e4)
$12:c407  ed 81 ea	  sbc $ea81
$12:c40a  46 3d		 lsr $3d
$12:c40c  d5 2f		 cmp $2f,x
$12:c40e  91 7c		 sta ($7c),y
$12:c410  1f c6 ec b4   ora $b4ecc6,x
$12:c414  1f 72 e8 3b   ora $3be872,x
$12:c418  d4 8c		 pei ($8c)
$12:c41a  39 7e 27	  and $277e,y
$12:c41d  fe a6 6d	  inc $6da6,x
$12:c420  50 08		 bvc $c42a
$12:c422  65 8e		 adc $8e
$12:c424  e3 0d		 sbc $0d,s
$12:c426  c0 48		 cpy #$48
$12:c428  f1 17		 sbc ($17),y
$12:c42a  3c fb c0	  bit $c0fb,x
$12:c42d  73 ea		 adc ($ea,s),y
$12:c42f  b0 43		 bcs $c474
$12:c431  1e 1a 13	  asl $131a,x
$12:c434  88			dey
$12:c435  bd e1 f8	  lda $f8e1,x
$12:c438  89 40 5c	  bit #$5c40
$12:c43b  84 5a		 sty $5a
$12:c43d  0e 17 08	  asl $0817
$12:c440  36 02		 rol $02,x
$12:c442  13 08		 ora ($08,s),y
$12:c444  c4 5d		 cpy $5d
$12:c446  61 19		 adc ($19,x)
$12:c448  18			clc
$12:c449  6a			ror a
$12:c44a  c4 62		 cpy $62
$12:c44c  b2 10		 lda ($10)
$12:c44e  b8			clv
$12:c44f  48			pha
$12:c450  70 1e		 bvs $c470
$12:c452  af 56 22 fb   lda $fb2256
$12:c456  af cc f8 d8   lda $d8f8cc
$12:c45a  25 12		 and $12
$12:c45c  80 67		 bra $c4c5
$12:c45e  a2 70		 ldx #$70
$12:c460  ae 77 3e	  ldx $3e77
$12:c463  23 11		 and $11,s
$12:c465  d7 e4		 cmp [$e4],y
$12:c467  dc 49 00	  jml [$0049]
$12:c46a  74 86		 stz $86,x
$12:c46c  75 96		 adc $96,x
$12:c46e  0d 10 67	  ora $6710
$12:c471  f3 65		 sbc ($65,s),y
$12:c473  1a			inc a
$12:c474  e2 d1		 sep #$d1
$12:c476  3c d6 b5	  bit $b5d6,x
$12:c479  df 99 4d 6e   cmp $6e4d99,x
$12:c47d  db			stp
$12:c47e  07 de		 ora [$de]
$12:c480  ef 60 c2 6f   sbc $6fc260
$12:c484  84 84		 sty $84
$12:c486  5f 21 f6 8b   eor $8bf621,x
$12:c48a  bd fe ec	  lda $ecfe,x
$12:c48d  22 5b 4a a8   jsl $a84a5b
$12:c491  03 e1		 ora $e1,s
$12:c493  5a			phy
$12:c494  94 0c		 sty $0c,x
$12:c496  9e b7 80	  stz $80b7,x
$12:c499  0f 0d 8a 51   ora $518a0d
$12:c49d  a8			tay
$12:c49e  d4 4a		 pei ($4a)
$12:c4a0  20 90 42	  jsr $4290
$12:c4a3  11 58		 ora ($58),y
$12:c4a5  c5 a5		 cmp $a5
$12:c4a7  6a			ror a
$12:c4a8  f9 6a 75	  sbc $756a,y
$12:c4ab  32 82		 and ($82)
$12:c4ad  a8			tay
$12:c4ae  14 8a		 trb $8a
$12:c4b0  d7 80		 cmp [$80],y
$12:c4b2  80 8b		 bra $c43f
$12:c4b4  c7 e5		 cmp [$e5]
$12:c4b6  aa			tax
$12:c4b7  d5 15		 cmp $15,x
$12:c4b9  48			pha
$12:c4ba  c6 23		 dec $23
$12:c4bc  c0 17		 cpy #$17
$12:c4be  09 04 0e	  ora #$0e04
$12:c4c1  4e 4c 00	  lsr $004c
$12:c4c4  f0 da		 beq $c4a0
$12:c4c6  a5 04		 lda $04
$12:c4c8  70 41		 bvs $c50b
$12:c4ca  02 0c		 cop #$0c
$12:c4cc  8b			phb
$12:c4cd  62 4e 1a	  per $df1e
$12:c4d0  c1 ca		 cmp ($ca,x)
$12:c4d2  2b			pld
$12:c4d3  27 d2		 and [$d2]
$12:c4d5  b6 58		 ldx $58,y
$12:c4d7  6f f6 05 12   adc $1205f6
$12:c4db  db			stp
$12:c4dc  49 a5 48	  eor #$48a5
$12:c4df  a4 ec		 ldy $ec
$12:c4e1  29 34 aa	  and #$aa34
$12:c4e4  5c c9 64 34   jml $3464c9
$12:c4e8  99 99 74	  sta $7499,y
$12:c4eb  62 b5 0a	  per $cfa3
$12:c4ee  8e c6 a3	  stx $a3c6
$12:c4f1  52 a9		 eor ($a9)
$12:c4f3  ce 98 43	  dec $4398
$12:c4f6  51 9d		 eor ($9d),y
$12:c4f8  93 46		 sta ($46,s),y
$12:c4fa  1b			tcs
$12:c4fb  0d c1 34	  ora $34c1
$12:c4fe  83 0d		 sta $0d,s
$12:c500  23 c3		 and $c3,s
$12:c502  b4 85		 ldy $85,x
$12:c504  a6 29		 ldx $29
$12:c506  e0 86		 cpx #$86
$12:c508  93 42		 sta ($42,s),y
$12:c50a  10 e2		 bpl $c4ee
$12:c50c  9d 76 bf	  sta $bf76,x
$12:c50f  36 06		 rol $06,x
$12:c511  57 98		 eor [$98],y
$12:c513  67 62		 adc [$62]
$12:c515  12 99		 ora ($99)
$12:c517  53 bc		 eor ($bc,s),y
$12:c519  32 af		 and ($af)
$12:c51b  28			plp
$12:c51c  8c 3f 41	  sty $413f
$12:c51f  c4 18		 cpy $18
$12:c521  5c 18 49 b0   jml $b04918
$12:c525  9d 58 44	  sta $4458,x
$12:c528  06 03		 asl $03
$12:c52a  02 c0		 cop #$c0
$12:c52c  b4 00		 ldy $00,x
$12:c52e  44 d8 40	  mvp $40,$d8
$12:c531  f8			sed
$12:c532  38			sec
$12:c533  80 42		 bra $c577
$12:c535  f1 68		 sbc ($68),y
$12:c537  c9 34 20	  cmp #$2034
$12:c53a  2e 30 10	  rol $1030
$12:c53d  bc 56 42	  ldy $4256,x
$12:c540  5d 08 14	  eor $1408,x
$12:c543  08			php
$12:c544  61 0d		 adc ($0d,x)
$12:c546  00 1e		 brk #$1e
$12:c548  60			rts
$12:c549  e8			inx
$12:c54a  45 b6		 eor $b6
$12:c54c  4a			lsr a
$12:c54d  11 e8		 ora ($e8),y
$12:c54f  07 ec		 ora [$ec]
$12:c551  d9 83 af	  cmp $af83,y
$12:c554  25 aa		 and $aa
$12:c556  68			pla
$12:c557  16 48		 asl $48,x
$12:c559  d1 0c		 cmp ($0c),y
$12:c55b  32 74		 and ($74)
$12:c55d  cf 40 c2 4c   cmp $4cc240
$12:c561  03 8c		 ora $8c,s
$12:c563  11 a5		 ora ($a5),y
$12:c565  87 c1		 sta [$c1]
$12:c567  34 95		 bit $95,x
$12:c569  78			sei
$12:c56a  0b			phd
$12:c56b  f0 0f		 beq $c57c
$12:c56d  0a			asl a
$12:c56e  fc 1c 30	  jsr ($301c,x)
$12:c571  1f 09 5c 40   ora $405c09,x
$12:c575  04 ef		 tsb $ef
$12:c577  10 cd		 bpl $c546
$12:c579  6b			rtl
$12:c57a  75 d2		 adc $d2,x
$12:c57c  b8			clv
$12:c57d  c3 c6		 cmp $c6,s
$12:c57f  72 8f		 adc ($8f)
$12:c581  d0 81		 bne $c504
$12:c583  75 70		 adc $70,x
$12:c585  b8			clv
$12:c586  30 93		 bmi $c51b
$12:c588  e1 11		 sbc ($11,x)
$12:c58a  e1 08		 sbc ($08,x)
$12:c58c  c2 94		 rep #$94
$12:c58e  a1 16		 lda ($16,x)
$12:c590  50 2c		 bvc $c5be
$12:c592  72 e4		 adc ($e4)
$12:c594  0a			asl a
$12:c595  72 1e		 adc ($1e)
$12:c597  0c 4c 85	  tsb $854c
$12:c59a  05 2b		 ora $2b
$12:c59c  f0 40		 beq $c5de
$12:c59e  50 ec		 bvc $c58c
$12:c5a0  53 c0		 eor ($c0,s),y
$12:c5a2  30 b2		 bmi $c556
$12:c5a4  68			pla
$12:c5a5  90 2c		 bcc $c5d3
$12:c5a7  3a			dec a
$12:c5a8  25 0b		 and $0b
$12:c5aa  16 f8		 asl $f8,x
$12:c5ac  fb			xce
$12:c5ad  e0 4d 10	  cpx #$104d
$12:c5b0  8b			phb
$12:c5b1  46 56		 lsr $56
$12:c5b3  48			pha
$12:c5b4  5a			phy
$12:c5b5  47 10		 eor [$10]
$12:c5b7  10 02		 bpl $c5bb
$12:c5b9  2a			rol a
$12:c5ba  c3 32		 cmp $32,s
$12:c5bc  52 38		 eor ($38)
$12:c5be  41 60		 eor ($60,x)
$12:c5c0  0d 36 c3	  ora $c336
$12:c5c3  27 45		 and [$45]
$12:c5c5  3a			dec a
$12:c5c6  0e 09 46	  asl $4609
$12:c5c9  86 bf		 stx $bf
$12:c5cb  36 02		 rol $02,x
$12:c5cd  48			pha
$12:c5ce  00 24		 brk #$24
$12:c5d0  33 bc		 and ($bc,s),y
$12:c5d2  ee 7b c4	  inc $c47b
$12:c5d5  35 f9		 and $f9,x
$12:c5d7  57 8e		 eor [$8e],y
$12:c5d9  42 70		 wdm #$70
$12:c5db  b8			clv
$12:c5dc  30 8b		 bmi $c569
$12:c5de  f7 bb		 sbc [$bb],y
$12:c5e0  d0 0d		 bne $c5ef
$12:c5e2  b4 23		 ldy $23,x
$12:c5e4  11 68		 ora ($68),y
$12:c5e6  bb			tyx
$12:c5e7  df ee c2 22   cmp $22c2ee,x
$12:c5eb  d4 0a		 pei ($0a)
$12:c5ed  42 d3		 wdm #$d3
$12:c5ef  00 be		 brk #$be
$12:c5f1  42 71		 wdm #$71
$12:c5f3  15 eb		 ora $eb,x
$12:c5f5  f7 6c		 sbc [$6c],y
$12:c5f7  64 37		 stz $37
$12:c5f9  ef 9e a4 72   sbc $72a49e
$12:c5fd  15 f1		 ora $f1,x
$12:c5ff  68			pla
$12:c600  07 c2		 ora [$c2]
$12:c602  cd 7e 81	  cmp $817e
$12:c605  f7 60		 sbc [$60],y
$12:c607  63 61		 adc $61,s
$12:c609  d5 12		 cmp $12,x
$12:c60b  42 ce		 wdm #$ce
$12:c60d  2d 08 16	  and $1608
$12:c610  22 dd 7e ee   jsl $ee7edd
$12:c614  14 84		 trb $84
$12:c616  ac 76 f1	  ldy $f176
$12:c619  e9 57 85	  sbc #$8557
$12:c61c  22 56 11 99   jsl $991156
$12:c620  0f 04 5e 1e   ora $1e5e04
$12:c624  81 c8		 sta ($c8,x)
$12:c626  95 84		 sta $84,x
$12:c628  86 44		 stx $44
$12:c62a  c1 0f		 cmp ($0f,x)
$12:c62c  87 c0		 sta [$c0]
$12:c62e  92 25		 sta ($25)
$12:c630  61 29		 adc ($29,x)
$12:c632  91 70		 sta ($70),y
$12:c634  61 38		 adc ($38,x)
$12:c636  8a			txa
$12:c637  e1 59		 sbc ($59,x)
$12:c639  0a			asl a
$12:c63a  c5 5d		 cmp $5d
$12:c63c  1e 95 b2	  asl $b295,x
$12:c63f  cb			wai
$12:c640  7f b2 28 96   adc $9628b2,x
$12:c644  da			phx
$12:c645  4d 2a a4	  eor $a42a
$12:c648  d2 69		 cmp ($69)
$12:c64a  b0 9a		 bcs $c5e6
$12:c64c  4d 69 73	  eor $7369
$12:c64f  65 98		 adc $98
$12:c651  cd c7 a3	  cmp $a3c7
$12:c654  89 aa cf	  bit #$cfaa
$12:c657  27 9b		 and [$9b]
$12:c659  19 e4 f6	  ora $f6e4,y
$12:c65c  a7 3e		 lda [$3e]
$12:c65e  61 8c		 adc ($8c,x)
$12:c660  fc 5a 38	  jsr ($385a,x)
$12:c663  7c 13 44	  jmp ($4413,x)
$12:c666  b0 d2		 bcs $c63a
$12:c668  36 81		 rol $81,x
$12:c66a  43 47		 eor $47,s
$12:c66c  a3 09		 lda $09,s
$12:c66e  6f ce 04 5a   adc $5a04ce
$12:c672  17 c8		 ora [$c8],y
$12:c674  6e 02 03	  ror $0302
$12:c677  02 6f		 cop #$6f
$12:c679  83 c9		 sta $c9,s
$12:c67b  dd e2 e0	  cmp $e0e2,x
$12:c67e  a8			tay
$12:c67f  4b			phk
$12:c680  bc 21 b8	  ldy $b821,x
$12:c683  30 94		 bmi $c619
$12:c685  61 21		 adc ($21,x)
$12:c687  17 c8		 ora [$c8],y
$12:c689  7d a0 c6	  adc $c6a0,x
$12:c68c  17 6b		 ora [$6b],y
$12:c68e  bd fc 48	  lda $48fc,x
$12:c691  26 30		 rol $30
$12:c693  b4 80		 ldy $80,x
$12:c695  40			rti
$12:c696  3e 1e 03	  rol $031e,x
$12:c699  99 a1 83	  sta $83a1,y
$12:c69c  e6 73		 inc $73
$12:c69e  0a			asl a
$12:c69f  eb			xba
$12:c6a0  c4 03		 cpy $03
$12:c6a2  e1 e8		 sbc ($e8,x)
$12:c6a4  41 98		 eor ($98,x)
$12:c6a6  dc 50 41	  jml [$4150]
$12:c6a9  67 16		 adc [$16]
$12:c6ab  95 b9		 sta $b9,x
$12:c6ad  25 16		 and $16
$12:c6af  fc 00 78	  jsr ($7800,x)
$12:c6b2  6b			rtl
$12:c6b3  dd be dd	  cmp $ddbe,x
$12:c6b6  f8			sed
$12:c6b7  44 02 20	  mvp $20,$02
$12:c6ba  bf 18 80 78   lda $788018,x
$12:c6be  02 e1		 cop #$e1
$12:c6c0  b3 40		 lda ($40,s),y
$12:c6c2  e0 63 91	  cpx #$9163
$12:c6c5  19 09 c8	  ora $c809,y
$12:c6c8  09 80 1e	  ora #$1e80
$12:c6cb  1b			tcs
$12:c6cc  77 73		 adc [$73],y
$12:c6ce  b8			clv
$12:c6cf  49 12 10	  eor #$1012
$12:c6d2  a0 80 b8	  ldy #$b880
$12:c6d5  02 e1		 cop #$e1
$12:c6d7  af 14 a0 78   lda $78a014
$12:c6db  76 63		 ror $63,x
$12:c6dd  14 13		 trb $13
$12:c6df  10 e5		 bpl $c6c6
$12:c6e1  05 c4		 ora $c4
$12:c6e3  41 45		 eor ($45,x)
$12:c6e5  7c da 65	  jmp ($65da,x)
$12:c6e8  28			plp
$12:c6e9  3e 21 9c	  rol $9c21,x
$12:c6ec  6f dd de e9   adc $e9dedd
$12:c6f0  1c 04 40	  trb $4004
$12:c6f3  8c 18 14	  sty $1418
$12:c6f6  22 13 01 77   jsl $770113
$12:c6fa  d3 c8		 cmp ($c8,s),y
$12:c6fc  80 31		 bra $c72f
$12:c6fe  01 81		 ora ($81,x)
$12:c700  00 83		 brk #$83
$12:c702  0b			phd
$12:c703  83 09		 sta $09,s
$12:c705  2e 10 04	  rol $0410
$12:c708  4f 00 c0 c5   eor $c5c000
$12:c70c  a3 22		 lda $22,s
$12:c70e  24 86		 bit $86
$12:c710  84 8a		 sty $8a
$12:c712  05 08		 ora $08
$12:c714  c0 c5 64	  cpy #$64c5
$12:c717  23 24		 and $24,s
$12:c719  11 18		 ora ($18),y
$12:c71b  7c 61 a4	  jmp ($a461,x)
$12:c71e  25 19		 and $19
$12:c720  18			clc
$12:c721  08			php
$12:c722  31 16		 and ($16),y
$12:c724  8b			phb
$12:c725  b5 de		 lda $de,x
$12:c727  fe 53 6b	  inc $6b53,x
$12:c72a  48			pha
$12:c72b  34 31		 bit $31,x
$12:c72d  15 a9		 ora $a9,x
$12:c72f  41 8e		 eor ($8e,x)
$12:c731  2b			pld
$12:c732  64 f1		 stz $f1
$12:c734  b1 4a		 lda ($4a),y
$12:c736  14 a2		 trb $a2
$12:c738  63 13		 adc $13,s
$12:c73a  a1 58		 lda ($58,x)
$12:c73c  de 01 88	  dec $8801,x
$12:c73f  b5 7c		 lda $7c,x
$12:c741  96 a2		 stx $a2,y
$12:c743  63 04		 adc $04,s
$12:c745  19 da c5	  ora $c5da,y
$12:c748  e0 61 0f	  cpx #$0f61
$12:c74b  93 14		 sta ($14,s),y
$12:c74d  50 e2		 bvc $c731
$12:c74f  94 2a		 sty $2a,x
$12:c751  d9 fc 4e	  cmp $4efc,y
$12:c754  40			rti
$12:c755  63 8b		 adc $8b,s
$12:c757  19 3c 6d	  ora $6d3c,y
$12:c75a  52 88		 eor ($88)
$12:c75c  21 e1		 and ($e1,x)
$12:c75e  16 63		 asl $63,x
$12:c760  6b			rtl
$12:c761  2f aa 0d 0d   and $0d0daa
$12:c765  8c 97 55	  sty $5597
$12:c768  59 07 c1	  eor $c107,y
$12:c76b  62 86 33	  per $faf4
$12:c76e  5e 08 bc	  lsr $bc08,x
$12:c771  01 82		 ora ($82,x)
$12:c773  f0 90		 beq $c705
$12:c775  e0 80 25	  cpx #$2580
$12:c778  f4 00 a1	  pea $a100
$12:c77b  c2 e0		 rep #$e0
$12:c77d  c2 6d		 rep #$6d
$12:c77f  84 57		 sty $57
$12:c781  80 4c		 bra $c7cf
$12:c783  47 46		 eor [$46]
$12:c785  3b			tsc
$12:c786  12 10		 ora ($10)
$12:c788  60			rts
$12:c789  07 e0		 ora [$e0]
$12:c78b  27 12		 and [$12]
$12:c78d  51 92		 eor ($92),y
$12:c78f  c4 54		 cpy $54
$12:c791  2f 90 1b 99   and $991b90
$12:c795  09 85 83	  ora #$8385
$12:c798  16 b4		 asl $b4,x
$12:c79a  5d ef f7	  eor $f7ef,x
$12:c79d  62 8a da	  per $a22a
$12:c7a0  47 81		 eor [$81]
$12:c7a2  08			php
$12:c7a3  87 d7		 sta [$d7]
$12:c7a5  af c6 17 af   lda $af17c6
$12:c7a9  e0 1f 41	  cpx #$411f
$12:c7ac  0f b3 2d c6   ora $c62db3
$12:c7b0  fd db ed	  sbc $eddb,x
$12:c7b3  df 96 e3 67   cmp $67e396,x
$12:c7b7  2e 17 c1	  rol $c117
$12:c7ba  8e 37 e8	  stx $e837
$12:c7bd  1c 0f e6	  trb $e60f
$12:c7c0  c7 1b		 cmp [$1b]
$12:c7c2  78			sei
$12:c7c3  b0 61		 bcs $c826
$12:c7c5  fe 06 b8	  inc $b806,x
$12:c7c8  df bb 9d cf   cmp $cf9dbb,x
$12:c7cc  9b			txy
$12:c7cd  5c 4d 60 f9   jml $f9604d
$12:c7d1  03 78		 ora $78,s
$12:c7d3  18			clc
$12:c7d4  48			pha
$12:c7d5  ea			nop
$12:c7d6  26 11		 rol $11
$12:c7d8  3d 82 34	  and $3482,x
$12:c7db  6d c7 12	  adc $12c7
$12:c7de  42 81		 wdm #$81
$12:c7e0  dc 91 60	  jml [$6091]
$12:c7e3  5d 1f 02	  eor $021f,x
$12:c7e6  04 92		 tsb $92
$12:c7e8  a2 81 13	  ldx #$1381
$12:c7eb  59 fa 12	  eor $12fa,y
$12:c7ee  24 75		 bit $75
$12:c7f0  04 b9		 tsb $b9
$12:c7f2  1e ce dc	  asl $dcce,x
$12:c7f5  61 25		 adc ($25,x)
$12:c7f7  a8			tay
$12:c7f8  98			tya
$12:c7f9  45 16		 eor $16
$12:c7fb  50 20		 bvc $c81d
$12:c7fd  08			php
$12:c7fe  1b			tcs
$12:c7ff  41 e0		 eor ($e0,x)
$12:c801  d8			cld
$12:c802  18			clc
$12:c803  05 f0		 ora $f0
$12:c805  5a			phy
$12:c806  0f f9 7e 0c   ora $0c7ef9
$12:c80a  27 0b		 and [$0b]
$12:c80c  83 08		 sta $08,s
$12:c80e  c4 35		 cpy $35
$12:c810  fa			plx
$12:c811  38			sec
$12:c812  82 85 3f	  brl $079a
$12:c815  42 05		 wdm #$05
$12:c817  88			dey
$12:c818  ad 4a 06	  lda $064a
$12:c81b  4f 5b 0e 95   eor $950e5b
$12:c81f  8a			txa
$12:c820  51 04		 eor ($04),y
$12:c822  19 04 10	  ora $1004,y
$12:c825  86 52		 stx $52
$12:c827  8b			phb
$12:c828  18			clc
$12:c829  34 71		 bit $71,x
$12:c82b  16 a1		 asl $a1,x
$12:c82d  94 5a		 sty $5a,x
$12:c82f  c3 a4		 cmp $a4,s
$12:c831  31 05		 and ($05),y
$12:c833  c0 8c 80	  cpy #$808c
$12:c836  c6 43		 dec $43
$12:c838  c1 27		 cmp ($27,x)
$12:c83a  85 8b		 sta $8b
$12:c83c  e4 c1		 cpx $c1
$12:c83e  19 41 c8	  ora $c841,y
$12:c841  c9 82 1f	  cmp #$1f82
$12:c844  0b			phd
$12:c845  57 c9		 eor [$c9],y
$12:c847  a2 27 60	  ldx #$6027
$12:c84a  41 91		 eor ($91,x)
$12:c84c  70 45		 bvs $c893
$12:c84e  ff 8c 20 81   sbc $81208c,x
$12:c852  8d c9 85	  sta $85c9
$12:c855  ac a1 1c	  ldy $1ca1
$12:c858  a0 b8 58	  ldy #$58b8
$12:c85b  da			phx
$12:c85c  d2 0a		 cmp ($0a)
$12:c85e  0d 88 32	  ora $3288
$12:c861  83 e2		 sta $e2,s
$12:c863  10 a1		 bpl $c806
$12:c865  78			sei
$12:c866  37 c8		 and [$c8],y
$12:c868  7f 88 f0 17   adc $17f088,x
$12:c86c  e7 a1		 sbc [$a1]
$12:c86e  7c cf 01	  jmp ($01cf,x)
$12:c871  5d c0 40	  eor $40c0,x
$12:c874  5d e1 6c	  eor $6ce1,x
$12:c877  44 05 92	  mvp $92,$05
$12:c87a  cb			wai
$12:c87b  7f 02 0a 20   adc $200a02,x
$12:c87f  2d b8 08	  and $08b8
$12:c882  4b			phk
$12:c883  bc 2a 93	  ldy $932a,x
$12:c886  4d 96 c3	  eor $c396
$12:c889  67 35		 adc [$35]
$12:c88b  a5 cd		 lda $cd
$12:c88d  82 63 37	  brl $fff3
$12:c890  c0 42 2f	  cpy #$2f42
$12:c893  91 5a		 sta ($5a),y
$12:c895  ac f3 69	  ldy $69f3
$12:c898  b1 da		 lda ($da),y
$12:c89a  cf 6a 73 e1   cmp $e1736a
$12:c89e  18			clc
$12:c89f  cf c1 a3 0d   cmp $0da3c1
$12:c8a3  86 e0		 stx $e0
$12:c8a5  86 43		 stx $43
$12:c8a7  86 91		 stx $91
$12:c8a9  e1 c6		 sbc ($c6,x)
$12:c8ab  46 1e		 lsr $1e
$12:c8ad  08			php
$12:c8ae  68			pla
$12:c8af  34 21		 bit $21,x
$12:c8b1  04 29		 tsb $29
$12:c8b3  1f 8c 06 04   ora $04068c,x
$12:c8b7  4d 02 93	  eor $9302
$12:c8ba  8f fc 60 18   sta $1860fc
$12:c8be  33 95		 and ($95,s),y
$12:c8c0  0b			phd
$12:c8c1  c6 2d		 dec $2d
$12:c8c3  19 40 c8	  ora $c840,y
$12:c8c6  bc 62 b2	  ldy $b262,x
$12:c8c9  14 8c		 trb $8c
$12:c8cb  8b			phb
$12:c8cc  c5 41		 cmp $41
$12:c8ce  77 3b		 adc [$3b],y
$12:c8d0  8d ca e0	  sta $e0ca
$12:c8d3  b0 ab		 bcs $c880
$12:c8d5  dd e6 f5	  cmp $f5e6,x
$12:c8d8  78			sei
$12:c8d9  60			rts
$12:c8da  55 d5		 eor $d5,x
$12:c8dc  9f b7 d6 fe   sta $fed6b7,x
$12:c8e0  96 c3		 stx $c3,y
$12:c8e2  11 58		 ora ($58),y
$12:c8e4  94 3c		 sty $3c,x
$12:c8e6  e2 b3		 sep #$b3
$12:c8e8  08			php
$12:c8e9  84 e2		 sty $e2
$12:c8eb  2d 96 0b	  and $0b96
$12:c8ee  0d fc 06	  ora $06fc
$12:c8f1  d6 d8		 dec $d8,x
$12:c8f3  4b			phk
$12:c8f4  c0 29		 cpy #$29
$12:c8f6  14 9d		 trb $9d
$12:c8f8  85 24		 sta $24
$12:c8fa  26 54		 rol $54
$12:c8fc  aa			tax
$12:c8fd  5c ca 93 33   jml $3393ca
$12:c901  29 06		 and #$06
$12:c903  26 a1		 rol $a1
$12:c905  51 d8		 eor ($d8),y
$12:c907  d4 44		 pei ($44)
$12:c909  65 52		 adc $52
$12:c90b  a9 ce		 lda #$ce
$12:c90d  aa			tax
$12:c90e  33 b0		 and ($b0,s),y
$12:c910  78			sei
$12:c911  61 f0		 adc ($f0,x)
$12:c913  43 25		 eor $25,s
$12:c915  c3 48		 cmp $48,s
$12:c917  c6 22		 dec $22
$12:c919  63 a3		 adc $a3,s
$12:c91b  19 3b c2	  ora $c23b,y
$12:c91e  12 1f		 ora ($1f)
$12:c920  02 84		 cop #$84
$12:c922  8f fb 06 6f   sta $6f06fb
$12:c926  d8			cld
$12:c927  cc 36 2c	  cpy $2c36
$12:c92a  7f b9 0c 36   adc $360cb9,x
$12:c92e  2a			rol a
$12:c92f  8f c4 fe dc   sta $dcfec4
$12:c933  6e 57 05	  ror $0557
$12:c936  7d de 6f	  adc $6fde,x
$12:c939  57 85		 eor [$85],y
$12:c93b  fd dd 59	  sbc $59dd,x
$12:c93e  fb			xce
$12:c93f  7d 6f ec	  adc $ec6f,x
$12:c942  3e b9 7e	  rol $7eb9,x
$12:c945  78			sei
$12:c946  8f 73 b8 f1   sta $f1b873
$12:c94a  2a			rol a
$12:c94b  ee 00 a2	  inc $a200
$12:c94e  10 fb		 bpl $c94b
$12:c950  65 96		 adc $96
$12:c952  ff 64 00 ad   sbc $ad0064,x
$12:c956  b7 00		 lda [$00],y
$12:c958  6d 08 7d	  adc $7d08
$12:c95b  52 69		 eor ($69)
$12:c95d  35 a5		 and $a5,x
$12:c95f  cd a6 9b	  cmp $9ba6
$12:c962  09 a0		 ora #$a0
$12:c964  54 66 ef	  mvn $ef,$66
$12:c967  c0 84		 cpy #$84
$12:c969  45 6a		 eor $6a
$12:c96b  b3 c9		 lda ($c9,s),y
$12:c96d  ed 4e 7d	  sbc $7d4e
$12:c970  3c d8 cf	  bit $cfd8,x
$12:c973  04 a3		 tsb $a3
$12:c975  3f c0 14 83   and $8314c0,x
$12:c979  04 2f		 tsb $2f
$12:c97b  0c 34 8f	  tsb $8f34
$12:c97e  0e 2f 11	  asl $112f
$12:c981  a9 61		 lda #$61
$12:c983  83 a0		 sta $a0,s
$12:c985  6d 01 fe	  adc $fe01
$12:c988  40			rti
$12:c989  8d a0 2d	  sta $2da0
$12:c98c  02 84		 cop #$84
$12:c98e  8f fb 06 6f   sta $6f06fb
$12:c992  d8			cld
$12:c993  6c 5a 32	  jmp ($325a)
$12:c996  7f b8 6c 56   adc $566cb8,x
$12:c99a  42 8f		 wdm #$8f
$12:c99c  b4 f7		 ldy $f7,x
$12:c99e  5c ae 17 15   jml $1517ae
$12:c9a2  7d de af	  adc $afde,x
$12:c9a5  17 95		 ora [$95],y
$12:c9a7  fd dd 59	  sbc $59dd,x
$12:c9aa  fb			xce
$12:c9ab  7d 6f ec	  adc $ec6f,x
$12:c9ae  0b			phd
$12:c9af  11 58		 ora ($58),y
$12:c9b1  94 3c		 sty $3c,x
$12:c9b3  9e b3 00	  stz $00b3,x
$12:c9b6  be 42 31	  ldx $3142,y
$12:c9b9  16 cb		 asl $cb,x
$12:c9bb  0d fe c0	  ora $c0fe
$12:c9be  02 5b		 cop #$5b
$12:c9c0  6b			rtl
$12:c9c1  f4 21 38	  pea $3821
$12:c9c4  8a			txa
$12:c9c5  45 26		 eor $26
$12:c9c7  93 4a		 sta ($4a,s),y
$12:c9c9  a5 cc		 lda $cc
$12:c9cb  a9 3b		 lda #$3b
$12:c9cd  00 b8		 brk #$b8
$12:c9cf  cc df a3	  cpy $a3df
$12:c9d2  89 a8		 bit #$a8
$12:c9d4  54 6a 35	  mvn $35,$6a
$12:c9d7  2a			rol a
$12:c9d8  9c ea a3	  stz $a3ea
$12:c9db  b1 13		 lda ($13),y
$12:c9dd  8c ec 1a	  sty $1aec
$12:c9e0  38			sec
$12:c9e1  7c 10 c4	  jmp ($c410,x)
$12:c9e4  30 d2		 bmi $c9b8
$12:c9e6  31 81		 and ($81),y
$12:c9e8  0c 42 1a	  tsb $1a42
$12:c9eb  fd 13 15	  sbc $1513,x
$12:c9ee  60			rts
$12:c9ef  41 a1		 eor ($a1,x)
$12:c9f1  02 35		 cop #$35
$12:c9f3  84 04		 sty $04
$12:c9f5  9e e4 c1	  stz $c1e4,x
$12:c9f8  1f f6 0c df   ora $df0cf6,x
$12:c9fc  43 c1		 eor $c1,s
$12:c9fe  8b			phb
$12:c9ff  46 61		 lsr $61
$12:ca01  a7 f9		 lda [$f9]
$12:ca03  06 84		 asl $84
$12:ca05  56 43		 lsr $43,x
$12:ca07  0d 47 c8	  ora $c847
$12:ca0a  34 21		 bit $21,x
$12:ca0c  a9 fb		 lda #$fb
$12:ca0e  06 85		 asl $85
$12:ca10  c2 e3		 rep #$e3
$12:ca12  72 57		 adc ($57)
$12:ca14  cd d2 e7	  cmp $e7d2
$12:ca17  78			sei
$12:ca18  bc de 97	  ldy $97de,x
$12:ca1b  f5 7b		 sbc $7b,x
$12:ca1d  ba			tsx
$12:ca1e  b3 f6		 lda ($f6,s),y
$12:ca20  fa			plx
$12:ca21  df d0 00 20   cmp $2000d0,x
$12:ca25  80 3b		 bra $ca62
$12:ca27  d6 07		 dec $07,x
$12:ca29  00 86		 brk #$86
$12:ca2b  40			rti
$12:ca2c  e1 10		 sbc ($10,x)
$12:ca2e  78			sei
$12:ca2f  84 3d		 sty $3d
$12:ca31  de cf 61	  dec $61cf,x
$12:ca34  7f 03 f8 23   adc $23f803,x
$12:ca38  ee f6 c0	  inc $c0f6
$12:ca3b  40			rti
$12:ca3c  2c 18 09	  bit $0918
$12:ca3f  07 02		 ora [$02]
$12:ca41  21 e0		 and ($e0,x)
$12:ca43  7f b8 5c 03   adc $035cb8,x
$12:ca47  c0 1e		 cpy #$1e
$12:ca49  0f 83 bf c0   ora $c0bf83
$12:ca4d  1e 11 f1	  asl $f111,x
$12:ca50  17 8b		 ora [$8b],y
$12:ca52  ca			dex
$12:ca53  08			php
$12:ca54  3a			dec a
$12:ca55  12 49		 ora ($49)
$12:ca57  8b			phb
$12:ca58  d8			cld
$12:ca59  f4 83 e7	  pea $e783
$12:ca5c  2d 94 23	  and $2394
$12:ca5f  e0 9b		 cpx #$9b
$12:ca61  01 fb		 ora ($fb,x)
$12:ca63  8b			phb
$12:ca64  0b			phd
$12:ca65  f0 ab		 beq $ca12
$12:ca67  12 22		 ora ($22)
$12:ca69  c3 21		 cmp $21,s
$12:ca6b  70 c8		 bvs $ca35
$12:ca6d  dc 16 37	  jml [$3716]
$12:ca70  14 85		 trb $85
$12:ca72  90 ed		 bcc $ca61
$12:ca74  94 45		 sty $45,x
$12:ca76  33 c0		 and ($c0,s),y
$12:ca78  78			sei
$12:ca79  28			plp
$12:ca7a  1e 09 06	  asl $0609,x
$12:ca7d  c2 41		 rep #$41
$12:ca7f  30 e8		 bmi $ca69
$12:ca81  17 90		 ora [$90],y
$12:ca83  50 74		 bvc $caf9
$12:ca85  0f 87 00 5c   ora $5c0087
$12:ca89  02 e6		 cop #$e6
$12:ca8b  3d 23 31	  and $3123,x
$12:ca8e  9e 9e 56	  stz $569e,x
$12:ca91  0a			asl a
$12:ca92  06 80		 asl $80
$12:ca94  56 12		 lsr $12,x
$12:ca96  0f 86 81 3c   ora $3c8186
$12:ca9a  c6 86		 dec $86
$12:ca9c  77 4c		 adc [$4c],y
$12:ca9e  12 3f		 ora ($3f)
$12:caa0  0b			phd
$12:caa1  8b			phb
$12:caa2  c2 62		 rep #$62
$12:caa4  e8			inx
$12:caa5  19 65 41	  ora $4165,y
$12:caa8  fc 38 0d	  jsr ($0d38,x)
$12:caab  74 75		 stz $75,x
$12:caad  89 41 5c	  bit #$5c41
$12:cab0  fa			plx
$12:cab1  9f 39 bc 62   sta $62bc39,x
$12:cab5  37 34		 and [$34],y
$12:cab7  37 d4		 and [$d4],y
$12:cab9  02 78		 cop #$78
$12:cabb  8b			phb
$12:cabc  13 7c		 ora ($7c,s),y
$12:cabe  f6 26		 inc $26,x
$12:cac0  1b			tcs
$12:cac1  0a			asl a
$12:cac2  c1 fe		 cmp ($fe,x)
$12:cac4  ef 0a b0 81   sbc $81b00a
$12:cac8  40			rti
$12:cac9  a1 10		 lda ($10,x)
$12:cacb  82 78 44	  brl $0f46
$12:cace  e2 70		 sep #$70
$12:cad0  48			pha
$12:cad1  3c 4e 2f	  bit $2f4e,x
$12:cad4  0f 8f c1 e3   ora $e3c18f
$12:cad8  f0 18		 beq $caf2
$12:cada  1c 1e 1e	  trb $1e1e
$12:cadd  c2 08		 rep #$08
$12:cadf  64 7e		 stz $7e
$12:cae1  37 1f		 and [$1f],y
$12:cae3  5d 94 5e	  eor $5e94,x
$12:cae6  3f 80 c0 48   and $48c080,x
$12:caea  24 04		 bit $04
$12:caec  f0 c8		 beq $cab6
$12:caee  64 28		 stz $28
$12:caf0  1c 0c 87	  trb $870c
$12:caf3  43 c0		 eor $c0,s
$12:caf5  6a			ror a
$12:caf6  2c 07 03	  bit $0307
$12:caf9  c0 e2		 cpy #$e2
$12:cafb  0b			phd
$12:cafc  07 c3		 ora [$c3]
$12:cafe  61 f0		 adc ($f0,x)
$12:cb00  6d 97 43	  adc $4397
$12:cb03  e1 10		 sbc ($10,x)
$12:cb05  87 c5		 sta [$c5]
$12:cb07  21 71		 and ($71,x)
$12:cb09  b8			clv
$12:cb0a  20 ec 20	  jsr $20ec
$12:cb0d  f0 d8		 beq $cae7
$12:cb0f  54 16 17	  mvn $17,$16
$12:cb12  07 82		 ora [$82]
$12:cb14  c0 c9		 cpy #$c9
$12:cb16  24 39		 bit $39
$12:cb18  06 68		 asl $68
$12:cb1a  43 61		 eor $61,s
$12:cb1c  e0 70		 cpx #$70
$12:cb1e  61 04		 adc ($04,x)
$12:cb20  1e 0f 10	  asl $100f,x
$12:cb23  f0 54		 beq $cb79
$12:cb25  34 1b		 bit $1b,x
$12:cb27  0a			asl a
$12:cb28  06 83		 asl $83
$12:cb2a  a1 c0		 lda ($c0,x)
$12:cb2c  b0 68		 bcs $cb96
$12:cb2e  02 80		 cop #$80
$12:cb30  56 0c		 lsr $0c,x
$12:cb32  01 b4		 ora ($b4,x)
$12:cb34  7e 06 90	  ror $9006,x
$12:cb37  76 85		 ror $85,x
$12:cb39  81 c8		 sta ($c8,x)
$12:cb3b  0e 21 e0	  asl $e021
$12:cb3e  70 1d		 bvs $cb5d
$12:cb40  e0 2f		 cpx #$2f
$12:cb42  28			plp
$12:cb43  d4 14		 pei ($14)
$12:cb45  90 10		 bcc $cb57
$12:cb47  72 7a		 adc ($7a)
$12:cb49  00 04		 brk #$04
$12:cb4b  7e 63 75	  ror $7563,x
$12:cb4e  07 81		 ora [$81]
$12:cb50  3c 82 61	  bit $6182,x
$12:cb53  e0 80		 cpx #$80
$12:cb55  70 14		 bvs $cb6b
$12:cb57  a8			tay
$12:cb58  20 12 f9	  jsr $f912
$12:cb5b  95 d6		 sta $d6,x
$12:cb5d  1d 01 86	  ora $8601,x
$12:cb60  c1 a1		 cmp ($a1,x)
$12:cb62  f0 e8		 beq $cb4c
$12:cb64  7c 2a 2b	  jmp ($2b2a,x)
$12:cb67  1a			inc a
$12:cb68  87 47		 sta [$47]
$12:cb6a  e0 b0		 cpx #$b0
$12:cb6c  e5 28		 sbc $28
$12:cb6e  c3 ce		 cmp $ce,s
$12:cb70  45 0b		 eor $0b
$12:cb72  87 b1		 sta [$b1]
$12:cb74  c1 10		 cmp ($10,x)
$12:cb76  0c 20 52	  tsb $5220
$12:cb79  84 23		 sty $23
$12:cb7b  e1 58		 sbc ($58,x)
$12:cb7d  d0 7e		 bne $cbfd
$12:cb7f  03 e6		 ora $e6,s
$12:cb81  d7 02		 cmp [$02],y
$12:cb83  d1 a4		 cmp ($a4),y
$12:cb85  c1 40		 cmp ($40,x)
$12:cb87  42 21		 wdm #$21
$12:cb89  16 81		 asl $81,x
$12:cb8b  68			pla
$12:cb8c  9e 20 f5	  stz $f520,x
$12:cb8f  28			plp
$12:cb90  14 16		 trb $16
$12:cb92  02 fe		 cop #$fe
$12:cb94  02 d1		 cop #$d1
$12:cb96  c1 80		 cmp ($80,x)
$12:cb98  87 05		 sta [$05]
$12:cb9a  83 c0		 sta $c0,s
$12:cb9c  d7 0a		 cmp [$0a],y
$12:cb9e  0f 0d 00 58   ora $58000d
$12:cba2  70 14		 bvs $cbb8
$12:cba4  08			php
$12:cba5  00 78		 brk #$78
$12:cba7  0b			phd
$12:cba8  4a			lsr a
$12:cba9  25 24		 and $24
$12:cbab  c8			iny
$12:cbac  60			rts
$12:cbad  1b			tcs
$12:cbae  0b			phd
$12:cbaf  09 8f		 ora #$8f
$12:cbb1  c5 a1		 cmp $a1
$12:cbb3  d1 88		 cmp ($88),y
$12:cbb5  38			sec
$12:cbb6  dd c7 c3	  cmp $c3c7,x
$12:cbb9  01 22		 ora ($22,x)
$12:cbbb  49 68		 eor #$68
$12:cbbd  2a			rol a
$12:cbbe  16 0a		 asl $0a,x
$12:cbc0  84 82		 sty $82
$12:cbc2  e1 80		 sbc ($80,x)
$12:cbc4  2b			pld
$12:cbc5  bb			tyx
$12:cbc6  5c 3e 01 f0   jml $f0013e
$12:cbca  32 c1		 and ($c1)
$12:cbcc  68			pla
$12:cbcd  20 91 b8	  jsr $b891
$12:cbd0  69 d0		 adc #$d0
$12:cbd2  62 83 01	  per $cd58
$12:cbd5  2d 24 22	  and $2224
$12:cbd8  3e 83 44	  rol $4483,x
$12:cbdb  59 36 d1	  eor $d136,y
$12:cbde  9e 0a 80	  stz $800a,x
$12:cbe1  b0 05		 bcs $cbe8
$12:cbe3  d9 bc 22	  cmp $22bc,y
$12:cbe6  30 e0		 bmi $cbc8
$12:cbe8  2a			rol a
$12:cbe9  00 4c		 brk #$4c
$12:cbeb  0d 95 9e	  ora $9e95
$12:cbee  49 e5		 eor #$e5
$12:cbf0  d1 78		 cmp ($78),y
$12:cbf2  1c 7e 37	  trb $377e
$12:cbf5  14 84		 trb $84
$12:cbf7  c7 a1		 cmp [$a1]
$12:cbf9  b1 c8		 lda ($c8),y
$12:cbfb  9c 22 6e	  stz $6e22
$12:cbfe  d6 09		 dec $09,x
$12:cc00  e4 02		 cpx $02
$12:cc02  7f 10 8b c6   adc $c68b10,x
$12:cc06  23 71		 and $71,s
$12:cc08  c8			iny
$12:cc09  ec be 19	  cpx $19be
$12:cc0c  77 40		 adc [$40],y
$12:cc0e  85 02		 sta $02
$12:cc10  f1 c8		 sbc ($c8),y
$12:cc12  f4 74 03	  pea $0374
$12:cc15  e1 b0		 sbc ($b0,x)
$12:cc17  08			php
$12:cc18  83 88		 sta $88,s
$12:cc1a  2e 19 09	  rol $0919
$12:cc1d  07 62		 ora [$62]
$12:cc1f  09 00		 ora #$00
$12:cc21  bc 40 3f	  ldy $3f40,x
$12:cc24  11 0e		 ora ($0e),y
$12:cc26  84 c3		 sty $c3
$12:cc28  61 70		 adc ($70,x)
$12:cc2a  b8			clv
$12:cc2b  7a			ply
$12:cc2c  2c 1d c5	  bit $c51d
$12:cc2f  08			php
$12:cc30  41 20		 eor ($20,x)
$12:cc32  70 d8		 bvs $cc0c
$12:cc34  33 0c		 and ($0c,s),y
$12:cc36  21 f0		 and ($f0,x)
$12:cc38  78			sei
$12:cc39  3c 06 0d	  bit $0d06,x
$12:cc3c  01 81		 ora ($81,x)
$12:cc3e  b6 89		 ldx $89,y
$12:cc40  64 10		 stz $10
$12:cc42  58			cli
$12:cc43  7c 05 ea	  jmp ($ea05,x)
$12:cc46  50 75		 bvc $ccbd
$12:cc48  d0 c0		 bne $cc0a
$12:cc4a  99 61 80	  sta $8061,y
$12:cc4d  2a			rol a
$12:cc4e  83 8c		 sta $8c,s
$12:cc50  3c 1c 0e	  bit $0e1c,x
$12:cc53  00 9c		 brk #$9c
$12:cc55  70 01		 bvs $cc58
$12:cc57  92 69		 sta ($69)
$12:cc59  05 00		 ora $00
$12:cc5b  4c 02 62	  jmp $6202
$12:cc5e  e0 36		 cpx #$36
$12:cc60  85 b4		 sta $b4
$12:cc62  0d a3 82	  ora $82a3
$12:cc65  41 22		 eor ($22,x)
$12:cc67  11 08		 ora ($08),y
$12:cc69  24 72		 bit $72
$12:cc6b  01 10		 ora ($10,x)
$12:cc6d  8a			txa
$12:cc6e  45 e2		 eor $e2
$12:cc70  b1 e1		 lda ($e1),y
$12:cc72  59 c0 e2	  eor $e2c0,y
$12:cc75  10 f8		 bpl $cc6f
$12:cc77  e0 10		 cpx #$10
$12:cc79  62 f0 80	  per $4d6c
$12:cc7c  28			plp
$12:cc7d  12 ca		 ora ($ca)
$12:cc7f  81 40		 sta ($40,x)
$12:cc81  7a			ply
$12:cc82  85 02		 sta $02
$12:cc84  e0 f9		 cpx #$f9
$12:cc86  0a			asl a
$12:cc87  87 42		 sta [$42]
$12:cc89  a0 60		 ldy #$60
$12:cc8b  00 81		 brk #$81
$12:cc8d  60			rts
$12:cc8e  0a			asl a
$12:cc8f  21 70		 and ($70,x)
$12:cc91  12 0f		 ora ($0f)
$12:cc93  42 40		 wdm #$40
$12:cc95  51 02		 eor ($02),y
$12:cc97  59 41 a0	  eor $a041,y
$12:cc9a  d0 80		 bne $cc1c
$12:cc9c  60			rts
$12:cc9d  44 09 62	  mvp $62,$09
$12:cca0  f5 08		 sbc $08,x
$12:cca2  c0 bc		 cpy #$bc
$12:cca4  e0 30		 cpx #$30
$12:cca6  88			dey
$12:cca7  38			sec
$12:cca8  34 63		 bit $63,x
$12:ccaa  e0 50		 cpx #$50
$12:ccac  8c 31 80	  sty $8031
$12:ccaf  d0 2d		 bne $ccde
$12:ccb1  50 90		 bvc $cc43
$12:ccb3  0b			phd
$12:ccb4  00 70		 brk #$70
$12:ccb6  93 02		 sta ($02,s),y
$12:ccb8  79 c0 24	  adc $24c0,y
$12:ccbb  1c 01 68	  trb $6801
$12:ccbe  fc 05 21	  jsr ($2105,x)
$12:ccc1  30 6b		 bmi $cd2e
$12:ccc3  01 bc		 ora ($bc,x)
$12:ccc5  e0 b0		 cpx #$b0
$12:ccc7  58			cli
$12:ccc8  00 d4		 brk #$d4
$12:ccca  23 11		 and $11,s
$12:cccc  58			cli
$12:cccd  ec 32 2a	  cpx $2a32
$12:ccd0  6f 56 60 12   adc $126056
$12:ccd4  06 0b		 asl $0b
$12:ccd6  1a			inc a
$12:ccd7  84 bf		 sty $bf
$12:ccd9  8c 22 84	  sty $8422
$12:ccdc  f0 1a		 beq $ccf8
$12:ccde  81 bd		 sta ($bd,x)
$12:cce0  04 28		 tsb $28
$12:cce2  69 08		 adc #$08
$12:cce4  40			rti
$12:cce5  78			sei
$12:cce6  3f 09 d6 82   and $82d609,x
$12:ccea  40			rti
$12:cceb  21 50		 and ($50,x)
$12:cced  28			plp
$12:ccee  21 38		 and ($38,x)
$12:ccf0  09 c6		 ora #$c6
$12:ccf2  4f 28 3c 0e   eor $0e3c28
$12:ccf6  1b			tcs
$12:ccf7  04 1a		 tsb $1a
$12:ccf9  82 6e 60	  brl $2d6a
$12:ccfc  1a			inc a
$12:ccfd  0c 05 00	  tsb $0005
$12:cd00  c6 06		 dec $06
$12:cd02  e5 28		 sbc $28
$12:cd04  8e 02 c1	  stx $c102
$12:cd07  40			rti
$12:cd08  2a			rol a
$12:cd09  81 54		 sta ($54,x)
$12:cd0b  28			plp
$12:cd0c  16 03		 asl $03,x
$12:cd0e  10 f0		 bpl $cd00
$12:cd10  28			plp
$12:cd11  1e 0a 5e	  asl $5e0a,x
$12:cd14  96 fd		 stx $fd,y
$12:cd16  8f 9d 57 e7   sta $e7579d
$12:cd1a  b3 c7		 lda ($c7,s),y
$12:cd1c  81 60		 sta ($60,x)
$12:cd1e  20 16 18	  jsr $1816
$12:cd21  0f 7e 3f ff   ora $ff3f7e
$12:cd25  8f df e3 f3   sta $f3e3df
$12:cd29  79 f9 3c	  adc $3cf9,y
$12:cd2c  23 f0		 and $f0,s
$12:cd2e  09 b4		 ora #$b4
$12:cd30  3f 9f 7f c6   and $c67f9f,x
$12:cd34  77 e3		 adc [$e3],y
$12:cd36  1b			tcs
$12:cd37  fe c5 ff	  inc $ffc5,x
$12:cd3a  29 bb		 and #$bb
$12:cd3c  27 84		 and [$84]
$12:cd3e  fe 7f 7f	  inc $7f7f,x
$12:cd41  bf ff c4 a7   lda $a7c4ff,x
$12:cd45  bf ff 89 02   lda $0289ff,x
$12:cd49  05 01		 ora $01
$12:cd4b  42 84		 wdm #$84
$12:cd4d  3a			dec a
$12:cd4e  0b			phd
$12:cd4f  0b			phd
$12:cd50  82 92 02	  brl $cfe5
$12:cd53  0d 01 8b	  ora $8b01
$12:cd56  41 e3		 eor ($e3,x)
$12:cd58  ab			plb
$12:cd59  e2 5e		 sep #$5e
$12:cd5b  02 20		 cop #$20
$12:cd5d  21 a7		 and ($a7,x)
$12:cd5f  40			rti
$12:cd60  8d 42 e7	  sta $e742
$12:cd63  f0 fb		 beq $cd60
$12:cd65  f4 1a c1	  pea $c11a
$12:cd68  80 34		 bra $cd9e
$12:cd6a  06 83		 asl $83
$12:cd6c  81 e0		 sta ($e0,x)
$12:cd6e  00 83		 brk #$83
$12:cd70  9c 28 0d	  stz $0d28
$12:cd73  90 56		 bcc $cdcb
$12:cd75  03 c4		 ora $c4,s
$12:cd77  8b			phb
$12:cd78  e9 20		 sbc #$20
$12:cd7a  c0 5e		 cpy #$5e
$12:cd7c  28			plp
$12:cd7d  1f c8 04 b6   ora $b604c8,x
$12:cd81  81 0d		 sta ($0d,x)
$12:cd83  90 56		 bcc $cddb
$12:cd85  e2 17		 sep #$17
$12:cd87  b8			clv
$12:cd88  e4 ce		 cpx $ce
$12:cd8a  07 1d		 ora [$1d]
$12:cd8c  5d 88 7c	  eor $7c88,x
$12:cd8f  68			pla
$12:cd90  15 f9		 ora $f9,x
$12:cd92  04 be		 tsb $be
$12:cd94  21 23		 and ($23,x)
$12:cd96  8e 47 20	  stx $2047
$12:cd99  70 35		 bvs $cdd0
$12:cd9b  89 da		 bit #$da
$12:cd9d  20 96 08	  jsr $0896
$12:cda0  46 d2		 lsr $d2
$12:cda2  21 bc		 and ($bc,x)
$12:cda4  b8			clv
$12:cda5  66 30		 ror $30
$12:cda7  17 06		 ora [$06],y
$12:cda9  d8			cld
$12:cdaa  b8			clv
$12:cdab  c3 f1		 cmp $f1,s
$12:cdad  04 fa		 tsb $fa
$12:cdaf  42 3d		 wdm #$3d
$12:cdb1  11 0c		 ora ($0c),y
$12:cdb3  45 c2		 eor $c2
$12:cdb5  e1 80		 sbc ($80,x)
$12:cdb7  01 82		 ora ($82,x)
$12:cdb9  ab			plb
$12:cdba  a3 f1		 lda $f1,s
$12:cdbc  05 d8		 ora $d8
$12:cdbe  2b			pld
$12:cdbf  a9 7c		 lda #$7c
$12:cdc1  11 09		 ora ($09),y
$12:cdc3  02 ba		 cop #$ba
$12:cdc5  be 11 06	  ldx $0611,y
$12:cdc8  d8			cld
$12:cdc9  34 d9		 bit $d9,x
$12:cdcb  16 4c		 asl $4c,x
$12:cdcd  b1 84		 lda ($84),y
$12:cdcf  42 a3		 wdm #$a3
$12:cdd1  b0 d8		 bcs $cdab
$12:cdd3  9c 5e 1b	  stz $1b5e
$12:cdd6  0a			asl a
$12:cdd7  1a			inc a
$12:cdd8  04 1e		 tsb $1e
$12:cdda  0a			asl a
$12:cddb  89 38		 bit #$38
$12:cddd  0c 7e 07	  tsb $077e
$12:cde0  1f 86 80 82   ora $828086,x
$12:cde4  1e 06 08	  asl $0806,x
$12:cde7  39 ec 8a	  and $8aec,y
$12:cdea  41 70		 eor ($70,x)
$12:cdec  b0 64		 bcs $ce52
$12:cdee  3a			dec a
$12:cdef  16 0d		 asl $0d,x
$12:cdf1  01 68		 ora ($68,x)
$12:cdf3  38			sec
$12:cdf4  14 05		 trb $05
$12:cdf6  4a			lsr a
$12:cdf7  7c 0b 81	  jmp ($810b,x)
$12:cdfa  60			rts
$12:cdfb  11 07		 ora ($07),y
$12:cdfd  80 4c		 bra $ce4b
$12:cdff  1c 04 d9	  trb $d904
$12:ce02  40			rti
$12:ce03  23 90		 and $90,s
$12:ce05  48			pha
$12:ce06  b4 2a		 ldy $2a,x
$12:ce08  3f 01 8e c0   and $c08e01,x
$12:ce0c  90 e1		 bcc $cdef
$12:ce0e  0d 81 43	  ora $4381
$12:ce11  e0 07		 cpx #$07
$12:ce13  b0 82		 bcs $cd97
$12:ce15  46 e0		 lsr $e0
$12:ce17  51 d8		 eor ($d8),y
$12:ce19  0c 79 74	  tsb $7479
$12:ce1c  04 51		 tsb $51
$12:ce1e  1d 80 ec	  ora $ec80,x
$12:ce21  6c 15 0f	  jmp ($0f15)
$12:ce24  06 c0		 asl $c0
$12:ce26  1e 12 06	  asl $0612,x
$12:ce29  d8			cld
$12:ce2a  78			sei
$12:ce2b  2c 18 02	  bit $0218
$12:ce2e  c8			iny
$12:ce2f  26 c2		 rol $c2
$12:ce31  81 b0		 sta ($b0,x)
$12:ce33  4c 03 68	  jmp $6803
$12:ce36  0c 67 e0	  tsb $e067
$12:ce39  34 8f		 bit $8f,x
$12:ce3b  02 05		 cop #$05
$12:ce3d  1f 84 c3 de   ora $dec384,x
$12:ce41  81 15		 sta ($15,x)
$12:ce43  8d 43 a3	  sta $a343
$12:ce46  f0 58		 beq $cea0
$12:ce48  70 ac		 bvs $cdf6
$12:ce4a  a1 71		 lda ($71,x)
$12:ce4c  c8			iny
$12:ce4d  6c 3a 15	  jmp ($153a)
$12:ce50  0f 8d c7 d0   ora $d0c78d
$12:ce54  c0 06		 cpy #$06
$12:ce56  01 59		 ora ($59,x)
$12:ce58  7d 32 95	  adc $9532,x
$12:ce5b  8d 05 63	  sta $6305
$12:ce5e  61 90		 adc ($90,x)
$12:ce60  fc 42 3e	  jsr ($3e42,x)
$12:ce63  1e 88 84	  asl $8488,x
$12:ce66  e1 94		 sbc ($94,x)
$12:ce68  39 4b 46	  and $464b,y
$12:ce6b  02 f9		 cop #$f9
$12:ce6d  80 bc		 bra $ce2b
$12:ce6f  70 27		 bvs $ce98
$12:ce71  1c 0d c4	  trb $c40d
$12:ce74  02 f1		 cop #$f1
$12:ce76  00 4d		 brk #$4d
$12:ce78  8c 22 07	  sty $0722
$12:ce7b  05 98		 ora $98
$12:ce7d  c0 ef		 cpy #$ef
$12:ce7f  10 6b		 bpl $ceec
$12:ce81  f4 16 78	  pea $7816
$12:ce84  49 11		 eor #$11
$12:ce86  58			cli
$12:ce87  c3 20		 cmp $20,s
$12:ce89  90 f8		 bcc $ce83
$12:ce8b  18			clc
$12:ce8c  28			plp
$12:ce8d  20 30 07	  jsr $0730
$12:ce90  d1 8a		 cmp ($8a),y
$12:ce92  c6 40		 dec $40
$12:ce94  5c 0c 06 02   jml $02060c
$12:ce98  41 c0		 eor ($c0,x)
$12:ce9a  f0 50		 beq $ceec
$12:ce9c  2c 06 d0	  bit $d006
$12:ce9f  15 95		 ora $95,x
$12:cea1  82 81 e0	  brl $af25
$12:cea4  2e 08 ac	  rol $ac08
$12:cea7  03 48		 ora $48,s
$12:cea9  2b			pld
$12:ceaa  09 fc		 ora #$fc
$12:ceac  d6 0a		 dec $0a,x
$12:ceae  46 08		 lsr $08
$12:ceb0  64 0e		 stz $0e
$12:ceb2  3d 21 8c	  and $8c21,x
$12:ceb5  4b			phk
$12:ceb6  62 84 60	  per $2f3d
$12:ceb9  15 84		 ora $84,x
$12:cebb  ba			tsx
$12:cebc  7f 26 93 c7   adc $c79326,x
$12:cec0  a3 d1		 lda $d1,s
$12:cec2  c0 18		 cpy #$18
$12:cec4  47 8e		 eor [$8e]
$12:cec6  c0 c8		 cpy #$c8
$12:cec8  36 28		 rol $28,x
$12:ceca  40			rti
$12:cecb  a0 50		 ldy #$50
$12:cecd  10 98		 bpl $ce67
$12:cecf  42 42		 wdm #$42
$12:ced1  41 1d		 eor ($1d,x)
$12:ced3  b3 7f		 lda ($7f,s),y
$12:ced5  e1 5f		 sbc ($5f,x)
$12:ced7  26 29		 rol $29
$12:ced9  40			rti
$12:ceda  98			tya
$12:cedb  c0 3a		 cpy #$3a
$12:cedd  08			php
$12:cede  60			rts
$12:cedf  10 3e		 bpl $cf1f
$12:cee1  f7 7f		 sbc [$7f],y
$12:cee3  bf de 5d 46   lda $465dde,x
$12:cee7  95 50		 sta $50,x
$12:cee9  23 72		 and $72,s
$12:ceeb  08			php
$12:ceec  dc 42 f7	  jml [$f742]
$12:ceef  1c 99 c0	  trb $c099
$12:cef2  e3 b0		 sbc $b0,s
$12:cef4  46 18		 lsr $18
$12:cef6  4e 68 13	  lsr $1368
$12:cef9  fa			plx
$12:cefa  05 7e		 ora $7e
$12:cefc  41 6f		 eor ($6f,x)
$12:cefe  88			dey
$12:ceff  48			pha
$12:cf00  e3 91		 sbc $91,s
$12:cf02  c8			iny
$12:cf03  1b			tcs
$12:cf04  1c b6 10	  trb $10b6
$12:cf07  4e c4 12	  lsr $12c4
$12:cf0a  c1 08		 cmp ($08,x)
$12:cf0c  b8			clv
$12:cf0d  44 37 97	  mvp $97,$37
$12:cf10  0c c6 02	  tsb $02c6
$12:cf13  e1 40		 sbc ($40,x)
$12:cf15  71 87		 adc ($87),y
$12:cf17  e2 08		 sep #$08
$12:cf19  5f 0f a4 23   eor $23a40f,x
$12:cf1d  d9 10 c4	  cmp $c410,y
$12:cf20  5c 2e 18 07   jml $07182e
$12:cf24  39 40 98	  and $9840,y
$12:cf27  e0 c5		 cpx #$c5
$12:cf29  08			php
$12:cf2a  0d 42 a3	  ora $a342
$12:cf2d  20 b8 40	  jsr $40b8
$12:cf30  24 0b		 bit $0b
$12:cf32  b2 81		 lda ($81)
$12:cf34  c1 20		 cmp ($20,x)
$12:cf36  30 e8		 bmi $cf20
$12:cf38  0c 40 ec	  tsb $ec40
$12:cf3b  f0 09		 beq $cf46
$12:cf3d  12 3c		 ora ($3c)
$12:cf3f  68			pla
$12:cf40  29 31		 and #$31
$12:cf42  80 50		 bra $cf94
$12:cf44  63 93		 adc $93,s
$12:cf46  e8			inx
$12:cf47  44 71 1a	  mvp $1a,$71
$12:cf4a  29 e1		 and #$e1
$12:cf4c  a0 a4		 ldy #$a4
$12:cf4e  81 24		 sta ($24,x)
$12:cf50  13 e9		 ora ($e9,s),y
$12:cf52  f4 01 38	  pea $3801
$12:cf55  30 0a		 bmi $cf61
$12:cf57  7d 23 2f	  adc $2f23,x
$12:cf5a  90 d3		 bcc $cf2f
$12:cf5c  ec 21 f1	  cpx $f121
$12:cf5f  8b			phb
$12:cf60  75 e7		 adc $e7,x
$12:cf62  59 73 a6	  eor $a673,y
$12:cf65  4f 23 53 5a   eor $5a5323
$12:cf69  44 c3 21	  mvp $21,$c3
$12:cf6c  68			pla
$12:cf6d  d8			cld
$12:cf6e  53 23		 eor ($23,s),y
$12:cf70  1e 5b c7	  asl $c75b,x
$12:cf73  96 e1		 stx $e1,y
$12:cf75  67 9d		 adc [$9d]
$12:cf77  c0 26		 cpy #$26
$12:cf79  30 ef		 bmi $cf6a
$12:cf7b  24 93		 bit $93
$12:cf7d  a5 12		 lda $12
$12:cf7f  e5 46		 sbc $46
$12:cf81  bc 13 0f	  ldy $0f13,x
$12:cf84  64 f2		 stz $f2
$12:cf86  d5 9c		 cmp $9c,x
$12:cf88  b2 5e		 lda ($5e)
$12:cf8a  36 15		 rol $15,x
$12:cf8c  89 24		 bit #$24
$12:cf8e  62 25 2c	  per $fbb6
$12:cf91  8d 59 26	  sta $2659
$12:cf94  14 e9		 trb $e9
$12:cf96  e5 3a		 sbc $3a
$12:cf98  39 cc dc	  and $dccc,y
$12:cf9b  40			rti
$12:cf9c  23 1e		 and $1e,s
$12:cf9e  08			php
$12:cf9f  7c 40 8a	  jmp ($8a40,x)
$12:cfa2  1e 78 45	  asl $4578,x
$12:cfa5  0e 09 47	  asl $4709
$12:cfa8  b2 44		 lda ($44)
$12:cfaa  ee 15 fb	  inc $fb15
$12:cfad  5c ae ef 30   jml $30efae
$12:cfb1  80 1e		 bra $cfd1
$12:cfb3  03 d1		 ora $d1,s
$12:cfb5  10 b0		 bpl $cf67
$12:cfb7  46 28		 lsr $28
$12:cfb9  75 8a		 adc $8a,x
$12:cfbb  bd 22 d1	  lda $d122,x
$12:cfbe  60			rts
$12:cfbf  bb			tyx
$12:cfc0  d8			cld
$12:cfc1  20 00 f1	  jsr $f100
$12:cfc4  a7 c4		 lda [$c4]
$12:cfc6  3d f1 0b	  and $0bf1,x
$12:cfc9  3b			tsc
$12:cfca  d0 2c		 bne $cff8
$12:cfcc  90 77		 bcc $d045
$12:cfce  c0 44		 cpy #$44
$12:cfd0  01 e4		 ora ($e4,x)
$12:cfd2  78			sei
$12:cfd3  0f 84 02 d1   ora $d10284
$12:cfd7  10 a0		 bpl $cf79
$12:cfd9  56 00		 lsr $00,x
$12:cfdb  e1 17		 sbc ($17,x)
$12:cfdd  84 03		 sty $03
$12:cfdf  cb			wai
$12:cfe0  c1 10		 cmp ($10,x)
$12:cfe2  01 87		 ora ($87,x)
$12:cfe4  32 41		 and ($41)
$12:cfe6  8c a0 73	  sty $73a0
$12:cfe9  28			plp
$12:cfea  19 48 c0	  ora $c048,y
$12:cfed  3c 83 c0	  bit $c083,x
$12:cff0  3e 09 64	  rol $6409,x
$12:cff3  42 1d		 wdm #$1d
$12:cff5  30 c7		 bmi $cfbe
$12:cff7  4c 3a 92	  jmp $923a
$12:cffa  48			pha
$12:cffb  7c 02 2f	  jmp ($2f02,x)
$12:cffe  18			clc
$12:cfff  b3 c1		 lda ($c1,s),y
$12:d001  3c 10 3b	  bit $3b10,x
$12:d004  84 42		 sty $42
$12:d006  61 50		 adc ($50,x)
$12:d008  9c 4a 23	  stz $234a
$12:d00b  f1 00		 sbc ($00),y
$12:d00d  78			sei
$12:d00e  4e 20 16	  lsr $1620
$12:d011  38			sec
$12:d012  c7 8e		 cmp [$8e]
$12:d014  39 70 87	  and $8770,y
$12:d017  dc 2d f2	  jml [$f22d]
$12:d01a  89 39		 bit #$39
$12:d01c  78			sei
$12:d01d  2e f1 87	  rol $87f1
$12:d020  98			tya
$12:d021  14 c2		 trb $c2
$12:d023  01 03		 ora ($03,x)
$12:d025  88			dey
$12:d026  1d c6 31	  ora $31c6,x
$12:d029  08			php
$12:d02a  2e 85 e0	  rol $e085
$12:d02d  04 3e		 tsb $3e
$12:d02f  38			sec
$12:d030  c5 8e		 cmp $8e
$12:d032  39 10 77	  and $7710,y
$12:d035  84 3e		 sty $3e
$12:d037  11 07		 ora ($07),y
$12:d039  2f 07 02 01   and $010207
$12:d03d  d0 98		 bne $cfd7
$12:d03f  72 29		 adc ($29)
$12:d041  10 4c		 bpl $d08f
$12:d043  04 7a		 tsb $7a
$12:d045  20 97 09	  jsr $0997
$12:d048  e4 83		 cpx $83
$12:d04a  c9 1c		 cmp #$1c
$12:d04c  07 83		 ora [$83]
$12:d04e  fc 31 13	  jsr ($1331,x)
$12:d051  0c 65 c2	  tsb $c265
$12:d054  3d e0 53	  and $53e0,x
$12:d057  84 b3		 sty $b3
$12:d059  81 14		 sta ($14,x)
$12:d05b  82 40 e0	  brl $b09e
$12:d05e  10 78		 bpl $d0d8
$12:d060  04 1a		 tsb $1a
$12:d062  09 06		 ora #$06
$12:d064  81 43		 sta ($43,x)
$12:d066  60			rts
$12:d067  10 18		 bpl $d081
$12:d069  04 32		 tsb $32
$12:d06b  07 07		 ora [$07]
$12:d06d  17 0c		 ora [$0c],y
$12:d06f  05 72		 ora $72
$12:d071  10 12		 bpl $d085
$12:d073  78			sei
$12:d074  43 56		 eor $56,s
$12:d076  c1 02		 cmp ($02,x)
$12:d078  81 40		 sta ($40,x)
$12:d07a  21 30		 and ($30,x)
$12:d07c  14 78		 trb $78
$12:d07e  78			sei
$12:d07f  3c 12 09	  bit $0912,x
$12:d082  06 02		 asl $02
$12:d084  41 c0		 eor ($c0,x)
$12:d086  6b			rtl
$12:d087  0f 83 00 32   ora $320083
$12:d08b  09 02		 ora #$02
$12:d08d  38			sec
$12:d08e  5a			phy
$12:d08f  c1 e0		 cmp ($e0,x)
$12:d091  19 03 98	  ora $9803,y
$12:d094  70 18		 bvs $d0ae
$12:d096  06 d8		 asl $d8
$12:d098  2b			pld
$12:d099  c1 de		 cmp ($de,x)
$12:d09b  2b			pld
$12:d09c  90 59		 bcc $d0f7
$12:d09e  04 02		 tsb $02
$12:d0a0  1f 01 83 40   ora $408301,x
$12:d0a4  61 6b		 adc ($6b,x)
$12:d0a6  b0 80		 bcs $d028
$12:d0a8  1d 02 0a	  ora $0a02,x
$12:d0ab  3f 08 3c 3a   and $3a3c08,x
$12:d0af  03 0e		 ora $0e,s
$12:d0b1  80 43		 bra $d0f6
$12:d0b3  a0 90		 ldy #$90
$12:d0b5  c8			iny
$12:d0b6  65 02		 adc $02
$12:d0b8  81 88		 sta ($88,x)
$12:d0ba  75 06		 adc $06,x
$12:d0bc  12 39		 ora ($39)
$12:d0be  14 88		 trb $88
$12:d0c0  05 c6		 ora $c6
$12:d0c2  81 60		 sta ($60,x)
$12:d0c4  72 86		 adc ($86)
$12:d0c6  42 41		 wdm #$41
$12:d0c8  48			pha
$12:d0c9  52 05		 eor ($05)
$12:d0cb  d2 39		 cmp ($39)
$12:d0cd  ec 88 78	  cpx $7888
$12:d0d0  04 e1		 tsb $e1
$12:d0d2  60			rts
$12:d0d3  6e 02 e0	  ror $e002
$12:d0d6  62 f0 68	  per $39c9
$12:d0d9  9c 02 4d	  stz $4d02
$12:d0dc  70 a7		 bvs $d085
$12:d0de  58			cli
$12:d0df  01 20		 ora ($20,x)
$12:d0e1  be 08 3b	  ldx $3b08,y
$12:d0e4  04 20		 tsb $20
$12:d0e6  c9 e0		 cmp #$e0
$12:d0e8  88			dey
$12:d0e9  47 2e		 eor [$2e]
$12:d0eb  d7 9b		 cmp [$9b],y
$12:d0ed  75 84		 adc $84,x
$12:d0ef  0e 0f b0	  asl $b00f
$12:d0f2  80 c2		 bra $d0b6
$12:d0f4  34 0d		 bit $0d,x
$12:d0f6  60			rts
$12:d0f7  80 7c		 bra $d175
$12:d0f9  3e 04 20	  rol $2004,x
$12:d0fc  d8			cld
$12:d0fd  60			rts
$12:d0fe  27 18		 and [$18]
$12:d100  09 86		 ora #$86
$12:d102  22 31 c8 70   jsl $70c831
$12:d106  89 48		 bit #$48
$12:d108  14 01		 trb $01
$12:d10a  c0 2a		 cpy #$2a
$12:d10c  01 fc		 ora ($fc,x)
$12:d10e  2f 11 8e c4   and $c48e11
$12:d112  61 3e		 adc ($3e,x)
$12:d114  10 88		 bpl $d09e
$12:d116  45 e2		 eor $e2
$12:d118  81 aa		 sta ($aa,x)
$12:d11a  c1 42		 cmp ($42,x)
$12:d11c  26 15		 rol $15
$12:d11e  8a			txa
$12:d11f  46 4b		 lsr $4b
$12:d121  05 54		 ora $54
$12:d123  aa			tax
$12:d124  1b			tcs
$12:d125  c6 61		 dec $61
$12:d127  40			rti
$12:d128  82 1f 02	  brl $d34a
$12:d12b  61 c6		 adc ($c6,x)
$12:d12d  a4 79		 ldy $79
$12:d12f  b0 56		 bcs $d187
$12:d131  ca			dex
$12:d132  a4 a1		 ldy $a1
$12:d134  7e 53 39	  ror $3953,x
$12:d137  ec 11 8a	  cpx $8a11
$12:d13a  10 f8		 bpl $d134
$12:d13c  44 1e 13	  mvp $13,$1e
$12:d13f  06 1e		 asl $1e
$12:d141  81 fc		 sta ($fc,x)
$12:d143  17 01		 ora [$01],y
$12:d145  04 9d		 tsb $9d
$12:d147  ad 82 07	  lda $0782
$12:d14a  0c 04 0b	  tsb $0b04
$12:d14d  e4 67		 cpx $67
$12:d14f  33 69		 and ($69,s),y
$12:d151  ac ba 57	  ldy $57ba
$12:d154  04 85		 tsb $85
$12:d156  c2 a1		 rep #$a1
$12:d158  b0 65		 bcs $d1bf
$12:d15a  a8			tay
$12:d15b  40			rti
$12:d15c  e0 50		 cpx #$50
$12:d15e  68			pla
$12:d15f  24 c2		 bit $c2
$12:d161  1d 20 04	  ora $0420,x
$12:d164  92 7c		 sta ($7c)
$12:d166  40			rti
$12:d167  21 0c		 and ($0c,x)
$12:d169  1d 0c e3	  ora $e30c,x
$12:d16c  b1 58		 lda ($58),y
$12:d16e  f4 6a 28	  pea $286a
$12:d171  1a			inc a
$12:d172  0d 05 83	  ora $8305
$12:d175  80 d5		 bra $d14c
$12:d177  0c 06 03	  tsb $0306
$12:d17a  81 40		 sta ($40,x)
$12:d17c  8c 78 21	  sty $2178
$12:d17f  01 d0		 ora ($d0,x)
$12:d181  f0 50		 beq $d1d3
$12:d183  13 e2		 ora ($e2,s),y
$12:d185  e5 0b		 sbc $0b
$12:d187  01 80		 ora ($80,x)
$12:d189  61 d1		 adc ($d1,x)
$12:d18b  f8			sed
$12:d18c  24 3a		 bit $3a
$12:d18e  07 04		 ora [$04]
$12:d190  89 c2 a7	  bit #$a7c2
$12:d193  f0 e9		 beq $d17e
$12:d195  9c 02 6f	  stz $6f02
$12:d198  04 8f		 tsb $8f
$12:d19a  c0 1f		 cpy #$1f
$12:d19c  a0 c2		 ldy #$c2
$12:d19e  06 28		 asl $28
$12:d1a0  31 49		 and ($49),y
$12:d1a2  96 23		 stx $23,y
$12:d1a4  b0 7f		 bcs $d225
$12:d1a6  04 2e		 tsb $2e
$12:d1a8  17 17		 ora [$17],y
$12:d1aa  77 84		 adc [$84],y
$12:d1ac  3e 3d 05	  rol $053d,x
$12:d1af  87 46		 sta [$46]
$12:d1b1  d4 63		 pei ($63)
$12:d1b3  31 85		 and ($85),y
$12:d1b5  0e c2 2e	  asl $2ec2
$12:d1b8  fe 18 f0	  inc $f018,x
$12:d1bb  01 58		 ora ($58,x)
$12:d1bd  a1 fc		 lda ($fc,x)
$12:d1bf  d2 6e		 cmp ($6e)
$12:d1c1  3b			tsc
$12:d1c2  9f 8f c5 03   sta $03c58f,x
$12:d1c6  c1 b0		 cmp ($b0,x)
$12:d1c8  a0 66		 ldy #$66
$12:d1ca  34 1f		 bit $1f,x
$12:d1cc  88			dey
$12:d1cd  00 ec		 brk #$ec
$12:d1cf  25 90		 and $90
$12:d1d1  ce e4 73	  dec $73e4
$12:d1d4  f0 df		 beq $d1b5
$12:d1d6  07 40		 ora [$40]
$12:d1d8  b9 49 cc	  lda $cc49,y
$12:d1db  31 18		 and ($18),y
$12:d1dd  6c 39 ea	  jmp ($ea39)
$12:d1e0  13 37		 ora ($37,s),y
$12:d1e2  b0 ce		 bcs $d1b2
$12:d1e4  5f c3 07 27   eor $2707c3,x
$12:d1e8  84 39		 sty $39
$12:d1ea  54 10 a8	  mvn $a8,$10
$12:d1ed  23 14		 and $14,s
$12:d1ef  97 a0		 sta [$a0],y
$12:d1f1  4a			lsr a
$12:d1f2  28			plp
$12:d1f3  94 4e		 sty $4e,x
$12:d1f5  1b			tcs
$12:d1f6  1e 8d c2	  asl $c28d,x
$12:d1f9  a6 b0		 ldx $b0
$12:d1fb  e9 ec 18	  sbc #$18ec
$12:d1fe  aa			tax
$12:d1ff  51 98		 eor ($98),y
$12:d201  04 4e		 tsb $4e
$12:d203  18			clc
$12:d204  25 03		 and $03
$12:d206  18			clc
$12:d207  2a			rol a
$12:d208  81 8e		 sta ($8e,x)
$12:d20a  46 71		 lsr $71
$12:d20c  81 4a		 sta ($4a,x)
$12:d20e  26 97		 rol $97
$12:d210  8f 25 62 c0   sta $c06225
$12:d214  3b			tsc
$12:d215  2f 82 60 5c   and $5c6082
$12:d219  41 3c		 eor ($3c,x)
$12:d21b  e6 73		 inc $73
$12:d21d  21 98		 and ($98,x)
$12:d21f  02 52		 cop #$52
$12:d221  12 8e		 ora ($8e)
$12:d223  07 07		 ora [$07]
$12:d225  79 04 62	  adc $6204,y
$12:d228  1f 3c 83 4f   ora $4f833c,x
$12:d22c  e0 33		 cpx #$33
$12:d22e  c8			iny
$12:d22f  24 66		 bit $66
$12:d231  13 0f		 ora ($0f,s),y
$12:d233  2e 04 0d	  rol $0d04
$12:d236  80 10		 bra $d248
$12:d238  18			clc
$12:d239  03 0c		 ora $0c,s
$12:d23b  15 a2		 ora $a2,x
$12:d23d  8c 17 38	  sty $3817
$12:d240  f0 30		 beq $d272
$12:d242  18			clc
$12:d243  0a			asl a
$12:d244  06 03		 asl $03
$12:d246  c1 80		 cmp ($80,x)
$12:d248  b0 35		 bcs $d27f
$12:d24a  07 81		 ora [$81]
$12:d24c  00 51		 brk #$51
$12:d24e  83 6c		 sta $6c,s
$12:d250  94 75		 sty $75,x
$12:d252  32 9f		 and ($9f)
$12:d254  48			pha
$12:d255  a6 91		 ldx $91
$12:d257  28			plp
$12:d258  ec ee f9	  cpx $f9ee
$12:d25b  3f 80 3d c1   and $c13d80,x
$12:d25f  7a			ply
$12:d260  0c 30 9d	  tsb $9d30
$12:d263  4e 66 13	  lsr $1366
$12:d266  9b			txy
$12:d267  02 92		 cop #$92
$12:d269  64 12		 stz $12
$12:d26b  08			php
$12:d26c  05 83		 ora $83
$12:d26e  41 a0		 eor ($a0,x)
$12:d270  d8			cld
$12:d271  48			pha
$12:d272  39 15 0d	  and $0d15,y
$12:d275  47 82		 eor [$82]
$12:d277  51 30		 eor ($30),y
$12:d279  4c 84 83	  jmp $8384
$12:d27c  81 60		 sta ($60,x)
$12:d27e  c0 68		 cpy #$68
$12:d280  28			plp
$12:d281  12 01		 ora ($01)
$12:d283  20 40 22	  jsr $2240
$12:d286  0d e1 43	  ora $43e1
$12:d289  8c 2c d4	  sty $d42c
$12:d28c  11 88		 ora ($88),y
$12:d28e  0c c5 6c	  tsb $6cc5
$12:d291  10 c8		 bpl $d25b
$12:d293  3d 12 b7	  and $b712,x
$12:d296  5c 7b 84 2d   jml $2d847b
$12:d29a  5a			phy
$12:d29b  30 18		 bmi $d2b5
$12:d29d  34 28		 bit $28,x
$12:d29f  d8			cld
$12:d2a0  33 80		 and ($80,s),y
$12:d2a2  70 1b		 bvs $d2bf
$12:d2a4  06 21		 asl $21
$12:d2a6  c8			iny
$12:d2a7  84 7e		 sty $7e
$12:d2a9  26 1f		 rol $1f
$12:d2ab  8b			phb
$12:d2ac  c7 c1		 cmp [$c1]
$12:d2ae  2e 49 d0	  rol $d049
$12:d2b1  45 86		 eor $86
$12:d2b3  62 31 b8	  per $8ae7
$12:d2b6  8c 76 23	  sty $2376
$12:d2b9  0a			asl a
$12:d2ba  3a			dec a
$12:d2bb  81 33		 sta ($33,x)
$12:d2bd  02 07		 cop #$07
$12:d2bf  32 9e		 and ($9e)
$12:d2c1  c5 17		 cmp $17
$12:d2c3  a1 0f		 lda ($0f,x)
$12:d2c5  84 c1		 sty $c1
$12:d2c7  a0 cc		 ldy #$cc
$12:d2c9  52 39		 eor ($39)
$12:d2cb  0c 12 77	  tsb $7712
$12:d2ce  03 8e		 ora $8e,s
$12:d2d0  40			rti
$12:d2d1  61 cf		 adc ($cf,x)
$12:d2d3  a0 21		 ldy #$21
$12:d2d5  81 1c		 sta ($1c,x)
$12:d2d7  63 1e		 adc $1e,s
$12:d2d9  09 85 03	  ora #$0385
$12:d2dc  c0 20		 cpy #$20
$12:d2de  00 f8		 brk #$f8
$12:d2e0  07 c0		 ora [$c0]
$12:d2e2  56 44		 lsr $44,x
$12:d2e4  81 f8		 sta ($f8,x)
$12:d2e6  35 80		 and $80,x
$12:d2e8  b4 2a		 ldy $2a,x
$12:d2ea  82 15 8b	  brl $5e02
$12:d2ed  dc 3b f0	  jml [$f03b]
$12:d2f0  0e cc 26	  asl $26cc
$12:d2f3  53 20		 eor ($20,s),y
$12:d2f5  94 d0		 sty $d0,x
$12:d2f7  17 21		 ora [$21],y
$12:d2f9  49 7c 0d	  eor #$0d7c
$12:d2fc  fe 01 ff	  inc $ff01,x
$12:d2ff  2c 0a f4	  bit $f40a
$12:d302  2d 2c 83	  and $832c
$12:d305  16 81		 asl $81,x
$12:d307  5c 3e d0 09   jml $09d03e
$12:d30b  b4 82		 ldy $82,x
$12:d30d  51 08		 eor ($08),y
$12:d30f  94 41		 sty $41,x
$12:d311  1b			tcs
$12:d312  21 24		 and ($24,x)
$12:d314  68			pla
$12:d315  0f f2 01 fe   ora $fe01f2
$12:d319  80 47		 bra $d362
$12:d31b  a0 0d		 ldy #$0d
$12:d31d  d0 96		 bne $d2b5
$12:d31f  3a			dec a
$12:d320  0c cc f0	  tsb $f0cc
$12:d323  f8			sed
$12:d324  3c 62 0f	  bit $0f62,x
$12:d327  08			php
$12:d328  7d 83 c1	  adc $c183,x
$12:d32b  c6 41		 dec $41
$12:d32d  00 84		 brk #$84
$12:d32f  4c 21 17	  jmp $1721
$12:d332  08			php
$12:d333  11 0c		 ora ($0c),y
$12:d335  20 70 d8	  jsr $d870
$12:d338  3c 0e 1f	  bit $1f0e,x
$12:d33b  0a			asl a
$12:d33c  82 c6 63	  brl $3705
$12:d33f  d1 78		 cmp ($78),y
$12:d341  f4 fc f0	  pea $f0fc
$12:d344  04 00		 tsb $00
$12:d346  83 81		 sta $81,s
$12:d348  84 f0		 sty $f0
$12:d34a  10 78		 bpl $d3c4
$12:d34c  e4 7e		 cpx $7e
$12:d34e  7f 1f b8 40   adc $40b81f,x
$12:d352  2c 18 04	  bit $0418
$12:d355  d8			cld
$12:d356  26 c3		 rol $c3
$12:d358  41 c0		 eor ($c0,x)
$12:d35a  a0 19		 ldy #$19
$12:d35c  43 81		 eor $81,s
$12:d35e  80 c0		 bra $d320
$12:d360  75 22		 adc $22,x
$12:d362  0a			asl a
$12:d363  d1 54		 cmp ($54),y
$12:d365  2c 82 01	  bit $0182
$12:d368  78			sei
$12:d369  a0 7a		 ldy #$7a
$12:d36b  20 86 68	  jsr $6886
$12:d36e  81 c2		 sta ($c2,x)
$12:d370  10 e0		 bpl $d352
$12:d372  87 07		 sta [$07]
$12:d374  74 43		 stz $43,x
$12:d376  22 11 89 04   jsl $048911
$12:d37a  72 c0		 adc ($c0)
$12:d37c  0f 08 2c 0a   ora $0a2c08
$12:d380  1d 05 84	  ora $8405,x
$12:d383  c1 84		 cmp ($84,x)
$12:d385  81 17		 sta ($17,x)
$12:d387  88			dey
$12:d388  41 60		 eor ($60,x)
$12:d38a  32 a9		 and ($a9)
$12:d38c  18			clc
$12:d38d  7d e0 d0	  adc $d0e0,x
$12:d390  88			dey
$12:d391  0c 7e 13	  tsb $137e
$12:d394  1f 81 8b c0   ora $c08b81,x
$12:d398  84 14		 sty $14
$12:d39a  0f 02 50 30   ora $305002
$12:d39e  16 01		 asl $01,x
$12:d3a0  b8			clv
$12:d3a1  58			cli
$12:d3a2  38			sec
$12:d3a3  1d 0a 00	  ora $000a,x
$12:d3a6  fc 54 00	  jsr ($0054,x)
$12:d3a9  42 31		 wdm #$31
$12:d3ab  88			dey
$12:d3ac  6c 30 1b	  jmp ($1b30)
$12:d3af  8c 04 1a	  sty $1a04
$12:d3b2  03 0c		 ora $0c,s
$12:d3b4  84 43		 sty $43
$12:d3b6  60			rts
$12:d3b7  30 28		 bmi $d3e1
$12:d3b9  14 12		 trb $12
$12:d3bb  1f 1b 8a cb   ora $cb8a1b,x
$12:d3bf  a4 f6		 ldy $f6
$12:d3c1  4b			phk
$12:d3c2  33 d4		 and ($d4,s),y
$12:d3c4  15 e1		 ora $e1,x
$12:d3c6  0d 81 09	  ora $0981
$12:d3c9  02 07		 cop #$07
$12:d3cb  01 85		 ora ($85,x)
$12:d3cd  c0 e3		 cpy #$e3
$12:d3cf  f0 78		 beq $d449
$12:d3d1  fc 1a 81	  jsr ($811a,x)
$12:d3d4  60			rts
$12:d3d5  80 48		 bra $d41f
$12:d3d7  2c 1e 0d	  bit $0d1e
$12:d3da  02 a0		 cop #$a0
$12:d3dc  2c 11 0e	  bit $0e11
$12:d3df  87 63		 sta [$63]
$12:d3e1  31 0c		 and ($0c),y
$12:d3e3  86 0b		 stx $0b
$12:d3e5  c8			iny
$12:d3e6  84 0d		 sty $0d
$12:d3e8  00 d0		 brk #$d0
$12:d3ea  39 81 2e	  and $2e81,y
$12:d3ed  10 0f		 bpl $d3fe
$12:d3ef  81 60		 sta ($60,x)
$12:d3f1  18			clc
$12:d3f2  02 b1		 cop #$b1
$12:d3f4  08			php
$12:d3f5  54 0e 0b	  mvn $0b,$0e
$12:d3f8  05 82		 ora $82
$12:d3fa  43 a3		 eor $a3,s
$12:d3fc  51 f9		 eor ($f9),y
$12:d3fe  6c bc c8	  jmp ($c8bc)
$12:d401  50 48		 bvc $d44b
$12:d403  1c 2d f2	  trb $f22d
$12:d406  05 80		 ora $80
$12:d408  62 04 3e	  per $120f
$12:d40b  3d 0e a0	  and $a00e,x
$12:d40e  0d 81 a0	  ora $a081
$12:d411  3a			dec a
$12:d412  0d 03 4c	  ora $4c03
$12:d415  1a			inc a
$12:d416  41 20		 eor ($20,x)
$12:d418  f8			sed
$12:d419  64 33		 stz $33
$12:d41b  09 e0 6f	  ora #$6fe0
$12:d41e  96 81		 stx $81,y
$12:d420  26 0e		 rol $0e
$12:d422  61 33		 adc ($33,x)
$12:d424  03 40		 ora $40,s
$12:d426  1d e4 4e	  ora $4ee4,x
$12:d429  08			php
$12:d42a  72 d4		 adc ($d4)
$12:d42c  20 70 78	  jsr $7870
$12:d42f  7c 46 2d	  jmp ($2d46,x)
$12:d432  07 3f		 ora [$3f]
$12:d434  00 cc		 brk #$cc
$12:d436  21 10		 and ($10,x)
$12:d438  e8			inx
$12:d439  09 0c 0e	  ora #$0e0c
$12:d43c  e0 66		 cpx #$66
$12:d43e  08			php
$12:d43f  4a			lsr a
$12:d440  28			plp
$12:d441  20 60 f4	  jsr $f460
$12:d444  0b			phd
$12:d445  89 5c 3c	  bit #$3c5c
$12:d448  19 0e 85	  ora $850e,y
$12:d44b  e3 f0		 sbc $f0,s
$12:d44d  1f 41 38 09   ora $093841,x
$12:d451  c3 00		 cmp $00,s
$12:d453  90 0e		 bcc $d463
$12:d455  01 a4		 ora ($a4,x)
$12:d457  19 61 09	  ora $0961,y
$12:d45a  04 0b		 tsb $0b
$12:d45c  fc 8e ad	  jsr ($ad8e,x)
$12:d45f  06 01		 asl $01
$12:d461  00 cc		 brk #$cc
$12:d463  0e af f8	  asl $f8af
$12:d466  51 8a		 eor ($8a),y
$12:d468  4b			phk
$12:d469  ce b3 05	  dec $05b3
$12:d46c  90 49		 bcc $d4b7
$12:d46e  60			rts
$12:d46f  11 5b		 ora ($5b),y
$12:d471  04 d7		 tsb $d7
$12:d473  81 10		 sta ($10,x)
$12:d475  e0 5a		 cpx #$5a
$12:d477  3c ff 09	  bit $09ff,x
$12:d47a  7d 82 be	  adc $be82,x
$12:d47d  b1 05		 lda ($05),y
$12:d47f  88			dey
$12:d480  5d 60 1f	  eor $1f60,x
$12:d483  58			cli
$12:d484  07 56		 ora [$56]
$12:d486  01 df		 ora ($df,x)
$12:d488  64 0c		 stz $0c
$12:d48a  fe 01 40	  inc $4001,x
$12:d48d  84 52		 sty $52
$12:d48f  20 15 08	  jsr $0815
$12:d492  65 62		 adc $62
$12:d494  0d 10 83	  ora $8310
$12:d497  4a			lsr a
$12:d498  b9 d1 ef	  lda $efd1,y
$12:d49b  44 33 e8	  mvp $e8,$33
$12:d49e  d1 06		 cmp ($06),y
$12:d4a0  88			dey
$12:d4a1  57 20		 eor [$20],y
$12:d4a3  15 e8		 ora $e8,x
$12:d4a5  05 5a		 ora $5a
$12:d4a7  01 f6		 ora ($f6,x)
$12:d4a9  74 0a		 stz $0a,x
$12:d4ab  3c 22 77	  bit $7722,x
$12:d4ae  48			pha
$12:d4af  3c 62 47	  bit $4762,x
$12:d4b2  18			clc
$12:d4b3  9d c5 e1	  sta $e1c5,x
$12:d4b6  91 f9		 sta ($f9),y
$12:d4b8  a4 f2		 ldy $f2
$12:d4ba  c7 60		 cmp [$60]
$12:d4bc  68			pla
$12:d4bd  05 52		 ora $52
$12:d4bf  11 2f		 ora ($2f),y
$12:d4c1  80 4d		 bra $d510
$12:d4c3  e6 00		 inc $00
$12:d4c5  40			rti
$12:d4c6  8e 47 21	  stx $2147
$12:d4c9  ef 70 80 5d   sbc $5d8070
$12:d4cd  e0 17		 cpx #$17
$12:d4cf  ea			nop
$12:d4d0  35 ee		 and $ee,x
$12:d4d2  81 33		 sta ($33,x)
$12:d4d4  98			tya
$12:d4d5  54 e1 97	  mvn $97,$e1
$12:d4d8  38			sec
$12:d4d9  14 ee		 trb $ee
$12:d4db  03 05		 ora $05,s
$12:d4dd  17 0c		 ora [$0c],y
$12:d4df  e6 81		 inc $81
$12:d4e1  3f a0 53 e6   and $e653a0,x
$12:d4e5  13 38		 ora ($38,s),y
$12:d4e7  64 36		 stz $36
$12:d4e9  05 06		 ora $06
$12:d4eb  80 87		 bra $d474
$12:d4ed  40			rti
$12:d4ee  90 1c		 bcc $d50c
$12:d4f0  c8			iny
$12:d4f1  27 92		 and [$92]
$12:d4f3  18			clc
$12:d4f4  fc 08 80	  jsr ($8008,x)
$12:d4f7  18			clc
$12:d4f8  28			plp
$12:d4f9  18			clc
$12:d4fa  8c 05 c0	  sty $c005
$12:d4fd  9e 10 0f	  stz $0f10,x
$12:d500  84 20		 sty $20
$12:d502  7e 1f 48	  ror $481f,x
$12:d505  47 32		 eor [$32]
$12:d507  61 b8		 adc ($b8,x)
$12:d509  a0 5c		 ldy #$5c
$12:d50b  0d 20 7e	  ora $7e20
$12:d50e  1a			inc a
$12:d50f  85 7e		 sta $7e
$12:d511  61 3f		 adc ($3f,x)
$12:d513  96 4f		 stx $4f,y
$12:d515  e0 70		 cpx #$70
$12:d517  f8			sed
$12:d518  44 7e 6f	  mvp $6f,$7e
$12:d51b  33 b3		 and ($b3,s),y
$12:d51d  d8			cld
$12:d51e  25 36		 and $36
$12:d520  8a			txa
$12:d521  fc 81 9a	  jsr ($9a81,x)
$12:d524  00 b0		 brk #$b0
$12:d526  83 9f		 sta $9f,s
$12:d528  86 18		 stx $18
$12:d52a  62 1a bc	  per $9147
$12:d52d  02 bf		 cop #$bf
$12:d52f  47 8f		 eor [$8f]
$12:d531  c8			iny
$12:d532  e3 d2		 sbc $d2,s
$12:d534  08			php
$12:d535  fc 82 af	  jsr ($af82,x)
$12:d538  51 b3		 eor ($b3),y
$12:d53a  cb			wai
$12:d53b  a7 10		 lda [$10]
$12:d53d  88			dey
$12:d53e  7c 02 77	  jmp ($7702,x)
$12:d541  03 ae		 ora $ae,s
$12:d543  48			pha
$12:d544  0b			phd
$12:d545  e0 5f		 cpx #$5f
$12:d547  09 74 46	  ora #$4674
$12:d54a  23 0e		 and $0e,s
$12:d54c  32 97		 and ($97)
$12:d54e  43 29		 eor $29,s
$12:d550  50 8a		 bvc $d4dc
$12:d552  5a			phy
$12:d553  22 17 cb c6   jsl $c6cb17
$12:d557  a3 01		 lda $01,s
$12:d559  30 80		 bmi $d4db
$12:d55b  0f 40 96 16   ora $169640
$12:d55f  88			dey
$12:d560  27 a0		 and [$a0]
$12:d562  60			rts
$12:d563  11 81		 ora ($81),y
$12:d565  d0 12		 bne $d579
$12:d567  40			rti
$12:d568  7a			ply
$12:d569  0a			asl a
$12:d56a  a2 88		 ldx #$88
$12:d56c  54 22 b5	  mvn $b5,$22
$12:d56f  5a			phy
$12:d570  25 92		 and $92
$12:d572  e9 74 ac	  sbc #$ac74
$12:d575  47 25		 eor [$25]
$12:d577  f0 f8		 beq $d571
$12:d579  f4 08 ca	  pea $ca08
$12:d57c  16 f8		 asl $f8,x
$12:d57e  05 a8		 ora $a8
$12:d580  fc 10 08	  jsr ($0810,x)
$12:d583  dc 00 c2	  jml [$c200]
$12:d586  11 38		 ora ($38),y
$12:d588  04 05		 tsb $05
$12:d58a  18			clc
$12:d58b  34 8a		 bit $8a,x
$12:d58d  64 82		 stz $82
$12:d58f  49 94 ce	  eor #$ce94
$12:d592  35 02		 and $02,x
$12:d594  69 70 f4	  adc #$f470
$12:d597  78			sei
$12:d598  3e 0a 81	  rol $810a,x
$12:d59b  da			phx
$12:d59c  40			rti
$12:d59d  3b			tsc
$12:d59e  89 e0 80	  bit #$80e0
$12:d5a1  5c 20 1f 88   jml $881f20
$12:d5a5  06 41		 asl $41
$12:d5a7  54 75 0a	  mvn $0a,$75
$12:d5aa  82 bc 24	  brl $fa69
$12:d5ad  be 5a 2f	  ldx $2f5a,y
$12:d5b0  96 a9		 stx $a9,y
$12:d5b2  54 a5 c3	  mvn $c3,$a5
$12:d5b5  e7 91		 sbc [$91]
$12:d5b7  c3 e8		 cmp $e8,s
$12:d5b9  4b			phk
$12:d5ba  d7 c3		 cmp [$c3],y
$12:d5bc  5a			phy
$12:d5bd  80 4e		 bra $d60d
$12:d5bf  98			tya
$12:d5c0  42 61		 wdm #$61
$12:d5c2  01 59		 ora ($59,x)
$12:d5c4  47 23		 eor [$23]
$12:d5c6  8c f0 94	  sty $94f0
$12:d5c9  4b			phk
$12:d5ca  a5 92		 lda $92
$12:d5cc  ec 26 52	  cpx $5226
$12:d5cf  d9 f8 ec	  cmp $ecf8,y
$12:d5d2  74 07		 stz $07,x
$12:d5d4  a1 e0		 lda ($e0,x)
$12:d5d6  6f 0f 52 01   adc $01520f
$12:d5da  d8			cld
$12:d5db  80 5e		 bra $d63b
$12:d5dd  07 c1		 ora [$c1]
$12:d5df  00 90		 brk #$90
$12:d5e1  23 06		 and $06,s
$12:d5e3  65 73		 adc $73
$12:d5e5  90 58		 bcc $d63f
$12:d5e7  21 5c		 and ($5c,x)
$12:d5e9  a9 96 c9	  lda #$c996
$12:d5ec  68			pla
$12:d5ed  17 89		 ora [$89],y
$12:d5ef  e2 e4		 sep #$e4
$12:d5f1  21 d0		 and ($d0,x)
$12:d5f3  28			plp
$12:d5f4  7c 0e bf	  jmp ($bf0e,x)
$12:d5f7  00 ba		 brk #$ba
$12:d5f9  c0 2d		 cpy #$2d
$12:d5fb  ac 41 35	  ldy $3541
$12:d5fe  83 24		 sta $24,s
$12:d600  81 e1		 sta ($e1,x)
$12:d602  28			plp
$12:d603  96 64		 stx $64,y
$12:d605  32 d9		 and ($d9)
$12:d607  4c f5 72	  jmp $72f5
$12:d60a  b8			clv
$12:d60b  d7 2f		 cmp [$2f],y
$12:d60d  06 00		 asl $00
$12:d60f  3e 02 30	  rol $3002,x
$12:d612  b6 38		 ldx $38,y
$12:d614  87 60		 sta [$60]
$12:d616  e6 58		 inc $58
$12:d618  10 2c		 bpl $d646
$12:d61a  20 33 09	  jsr $0933
$12:d61d  8d 82 c3	  sta $c382
$12:d620  00 b0		 brk #$b0
$12:d622  2a			rol a
$12:d623  8c 14 10	  sty $1014
$12:d626  48			pha
$12:d627  0c 7a 63	  tsb $637a
$12:d62a  00 3b		 brk #$3b
$12:d62c  39 b8 dd	  and $ddb8,y
$12:d62f  a5 20		 lda $20
$12:d631  72 80		 adc ($80)
$12:d633  ac 8f c5	  ldy $c58f
$12:d636  08			php
$12:d637  80 4c		 bra $d685
$12:d639  12 ce		 ora ($ce)
$12:d63b  77 08		 adc [$08],y
$12:d63d  fd 02 3f	  sbc $3f02,x
$12:d640  7f 90 57 d6   adc $d65790,x
$12:d644  40			rti
$12:d645  48			pha
$12:d646  15 b8		 ora $b8,x
$12:d648  3b			tsc
$12:d649  00 12		 brk #$12
$12:d64b  00 90		 brk #$90
$12:d64d  24 80		 bit $80
$12:d64f  ac 05 60	  ldy $6005
$12:d652  78			sei
$12:d653  0a			asl a
$12:d654  03 b0		 ora $b0,s
$12:d656  61 9f		 adc ($9f,x)
$12:d658  08			php
$12:d659  27 c3		 and [$c3]
$12:d65b  f9 08 fa	  sbc $fa08,y
$12:d65e  34 80		 bit $80,x
$12:d660  50 2d		 bvc $d68f
$12:d662  70 5e		 bvs $d6c2
$12:d664  01 a4		 ora ($a4,x)
$12:d666  0d 20 29	  ora $2920
$12:d669  05 10		 ora $10
$12:d66b  28			plp
$12:d66c  82 19 00	  brl $d688
$12:d66f  82 22 15	  brl $eb94
$12:d672  78			sei
$12:d673  11 78		 ora ($78),y
$12:d675  c4 7e		 cpy $7e
$12:d677  61 3f		 adc ($3f,x)
$12:d679  9a			txs
$12:d67a  42 66		 wdm #$66
$12:d67c  73 a9		 adc ($a9,s),y
$12:d67e  49 e5		 eor #$e5
$12:d680  21 11		 and ($11,x)
$12:d682  08			php
$12:d683  04 e2		 tsb $e2
$12:d685  09 38		 ora #$38
$12:d687  90 4b		 bcc $d6d4
$12:d689  e7 13		 sbc [$13]
$12:d68b  73 ca		 adc ($ca,s),y
$12:d68d  44 21 10	  mvp $10,$21
$12:d690  79 c4 fe	  adc $fec4,y
$12:d693  61 0f		 adc ($0f,x)
$12:d695  7d 01 c0	  adc $c001,x
$12:d698  00 0b		 brk #$0b
$12:d69a  08			php
$12:d69b  98			tya
$12:d69c  01 c2		 ora ($c2,x)
$12:d69e  49 28		 eor #$28
$12:d6a0  80 43		 bra $d6e5
$12:d6a2  dd 8d c0	  cmp $c08d,x
$12:d6a5  90 78		 bcc $d71f
$12:d6a7  22 1f 0a c4   jsl $c40a1f
$12:d6ab  e3 30		 sbc $30,s
$12:d6ad  ec 64 d0	  cpx $d064
$12:d6b0  cc 28 13	  cpy $1328
$12:d6b3  83 40		 sta $40,s
$12:d6b5  9e 8e 0e	  stz $0e8e,x
$12:d6b8  54 08 44	  mvn $44,$08
$12:d6bb  3e 29 18	  rol $1829,x
$12:d6be  99 46 66	  sta $6646,y
$12:d6c1  6e c6 51	  ror $51c6
$12:d6c4  04 12		 tsb $12
$12:d6c6  37 02		 and [$02],y
$12:d6c8  9e af 85	  stz $85af,x
$12:d6cb  10 a5		 bpl $d672
$12:d6cd  51 8c		 eor ($8c),y
$12:d6cf  4e e6 05	  lsr $05e6
$12:d6d2  b0 76		 bcs $d74a
$12:d6d4  38			sec
$12:d6d5  10 a7		 bpl $d67e
$12:d6d7  e6 b1		 inc $b1
$12:d6d9  18			clc
$12:d6da  30 d8		 bmi $d6b4
$12:d6dc  76 11		 ror $11,x
$12:d6de  09 80		 ora #$80
$12:d6e0  f9 c8 a7	  sbc $a7c8,y
$12:d6e3  f0 c0		 beq $d6a5
$12:d6e5  5e 08 29	  lsr $2908,x
$12:d6e8  0e 80 47	  asl $4780
$12:d6eb  a0 d3		 ldy #$d3
$12:d6ed  28			plp
$12:d6ee  24 92		 bit $92
$12:d6f0  5d 0e 97	  eor $970e,x
$12:d6f3  0f da 0c 48   ora $480cda
$12:d6f7  09 f3		 ora #$f3
$12:d6f9  24 c8		 bit $c8
$12:d6fb  0a			asl a
$12:d6fc  b5 08		 lda $08,x
$12:d6fe  e4 1a		 cpx $1a
$12:d700  4d 0b 8d	  eor $8d0b
$12:d703  c7 cf		 cmp [$cf]
$12:d705  f0 c7		 beq $d6ce
$12:d707  08			php
$12:d708  1c f5 d6	  trb $d6f5
$12:d70b  0c fa 94	  tsb $94fa
$12:d70e  c6 aa		 dec $aa
$12:d710  77 76		 adc [$76],y
$12:d712  fd 42 26	  sbc $2642,x
$12:d715  f4 0b fc	  pea $fc0b
$12:d718  4a			lsr a
$12:d719  a5 52		 lda $52
$12:d71b  b9 5d 26	  lda $265d,y
$12:d71e  95 88		 sta $88,x
$12:d720  e4 be		 cpx $be
$12:d722  1f 1a 83 15   ora $15831a,x
$12:d726  40			rti
$12:d727  90 16		 bcc $d73f
$12:d729  d8			cld
$12:d72a  04 b6		 tsb $b6
$12:d72c  01 1b		 ora ($1b,x)
$12:d72e  36 8c		 rol $8c,x
$12:d730  4e 01 01	  lsr $0101
$12:d733  3f c4 0e 0d   and $0d0ec4,x
$12:d737  0f 2c 04 02   ora $02042c
$12:d73b  3f 09 8f c1   and $c18f09,x
$12:d73f  db			stp
$12:d740  c9 03		 cmp #$03
$12:d742  80 0e		 bra $d752
$12:d744  00 70		 brk #$70
$12:d746  24 93		 bit $93
$12:d748  49 9f		 eor #$9f
$12:d74a  43 e1		 eor $e1,s
$12:d74c  28			plp
$12:d74d  dc 4e 35	  jml [$354e]
$12:d750  17 0b		 ora [$0b],y
$12:d752  47 03		 eor [$03]
$12:d754  f0 4f		 beq $d7a5
$12:d756  45 58		 eor $58
$12:d758  50 3f		 bvc $d799
$12:d75a  06 70		 asl $70
$12:d75c  c8			iny
$12:d75d  7e 22 05	  ror $0522,x
$12:d760  e4 1a		 cpx $1a
$12:d762  0c 2e 1f	  tsb $1f2e
$12:d765  03 8f		 ora $8f,s
$12:d767  c0 a3		 cpy #$a3
$12:d769  f1 58		 sbc ($58),y
$12:d76b  f0 ff		 beq $d76c
$12:d76d  d4 85		 pei ($85)
$12:d76f  80 e0		 bra $d751
$12:d771  78			sei
$12:d772  12 c1		 ora ($c1)
$12:d774  40			rti
$12:d775  b8			clv
$12:d776  54 2e 1b	  mvn $1b,$2e
$12:d779  0d 82 3d	  ora $3d82
$12:d77c  20 1e 05	  jsr $051e
$12:d77f  28			plp
$12:d780  60			rts
$12:d781  3e 0a 90	  rol $900a,x
$12:d784  a0 7c		 ldy #$7c
$12:d786  1d ed 01	  ora $01ed,x
$12:d789  81 c0		 sta ($c0,x)
$12:d78b  a1 70		 lda ($70,x)
$12:d78d  c3 b0		 cmp $b0,s
$12:d78f  37 a2		 and [$a2],y
$12:d791  07 04		 ora [$04]
$12:d793  87 c0		 sta [$c0]
$12:d795  61 e3		 adc ($e3,x)
$12:d797  d5 48		 cmp $48,x
$12:d799  96 02		 stx $02,y
$12:d79b  41 20		 eor ($20,x)
$12:d79d  a0 70		 ldy #$70
$12:d79f  36 0a		 rol $0a,x
$12:d7a1  e7 49		 sbc [$49]
$12:d7a3  94 83		 sty $83,x
$12:d7a5  c1 c0		 cmp ($c0,x)
$12:d7a7  f8			sed
$12:d7a8  1d 41 90	  ora $9041,x
$12:d7ab  11 38		 ora ($38),y
$12:d7ad  54 fe 1d	  mvn $1d,$fe
$12:d7b0  33 12		 and ($12,s),y
$12:d7b2  09 38		 ora #$38
$12:d7b4  03 60		 ora $60,s
$12:d7b6  38			sec
$12:d7b7  08			php
$12:d7b8  20 00 4e	  jsr $4e00
$12:d7bb  41 0c		 eor ($0c,x)
$12:d7bd  84 0b		 sty $0b
$12:d7bf  92 15		 sta ($15)
$12:d7c1  09 3a		 ora #$3a
$12:d7c3  8c 1a 3b	  sty $3b1a
$12:d7c6  02 99		 cop #$99
$12:d7c8  bd 0c 9c	  lda $9c0c,x
$12:d7cb  10 88		 bpl $d755
$12:d7cd  38			sec
$12:d7ce  e0 20		 cpx #$20
$12:d7d0  d0 08		 bne $d7da
$12:d7d2  10 09		 bpl $d7dd
$12:d7d4  f4 13 8e	  pea $8e13
$12:d7d7  87 e3		 sta [$e3]
$12:d7d9  41 50		 eor ($50,x)
$12:d7db  ec 78 0b	  cpx $0b78
$12:d7de  c0 5e		 cpy #$5e
$12:d7e0  05 70		 ora $70
$12:d7e2  19 02 51	  ora $5102,y
$12:d7e5  c8			iny
$12:d7e6  fc 46 2a	  jsr ($2a46,x)
$12:d7e9  11 05		 ora ($05),y
$12:d7eb  fb			xce
$12:d7ec  c0 22		 cpy #$22
$12:d7ee  52 98		 eor ($98)
$12:d7f0  24 32		 bit $32
$12:d7f2  35 07		 and $07,x
$12:d7f4  0b			phd
$12:d7f5  94 e5		 sty $e5,x
$12:d7f7  f4 73 89	  pea $8973
$12:d7fa  bc 32 06	  ldy $0632,x
$12:d7fd  fd 00 19	  sbc $1900,x
$12:d800  41 80		 eor ($80,x)
$12:d802  65 00		 adc $00
$12:d804  84 ae		 sty $ae
$12:d806  02 12		 cop #$12
$12:d808  1e 08 e4	  asl $e408,x
$12:d80b  16 7b		 asl $7b,x
$12:d80d  06 0b		 asl $0b
$12:d80f  94 65		 sty $65,x
$12:d811  8c 10 f0	  sty $f010
$12:d814  f8			sed
$12:d815  07 c2		 ora [$c2]
$12:d817  0b			phd
$12:d818  02 11		 cop #$11
$12:d81a  81 95		 sta ($95,x)
$12:d81c  27 19		 and [$19]
$12:d81e  8c 04 e2	  sty $e204
$12:d821  b1 68		 lda ($68),y
$12:d823  bc 70 06	  ldy $0670,x
$12:d826  ec 38 01	  cpx $0138
$12:d829  f8			sed
$12:d82a  5e 33 04	  lsr $0433,x
$12:d82d  58			cli
$12:d82e  9d 4d 2d	  sta $2d4d,x
$12:d831  d1 cf		 cmp ($cf),y
$12:d833  1c f3 cf	  trb $cff3
$12:d836  14 fd		 trb $fd
$12:d838  c3 3c		 cmp $3c,s
$12:d83a  f0 4e		 beq $d88a
$12:d83c  7c 22 fd	  jmp ($fd22,x)
$12:d83f  00 9b		 brk #$9b
$12:d841  41 a3		 eor ($a3,x)
$12:d843  d0 68		 bne $d8ad
$12:d845  60			rts
$12:d846  78			sei
$12:d847  1c a3 18	  trb $18a3
$12:d84a  88			dey
$12:d84b  4c 1c a3	  jmp $a31c
$12:d84e  1e 8f 5b	  asl $5b8f,x
$12:d851  a6 52		 ldx $52
$12:d853  59 f6 af	  eor $aff6,y
$12:d856  6d fe 81	  adc $81fe
$12:d859  fe 60 3f	  inc $3f60,x
$12:d85c  38			sec
$12:d85d  12 f4		 ora ($f4)
$12:d85f  20 53 c9	  jsr $c953
$12:d862  d4 63		 pei ($63)
$12:d864  fd 30 a3	  sbc $a330,x
$12:d867  19 8d 86	  ora $868d,y
$12:d86a  0a			asl a
$12:d86b  c0 8b		 cpy #$8b
$12:d86d  cc ef d3	  cpy $d3ef
$12:d870  9f 6c 7f e7   sta $e77f6c,x
$12:d874  1f f7 cc 33   ora $33ccf7,x
$12:d878  f1 09		 sbc ($09),y
$12:d87a  fc 81 7a	  jsr ($7a81,x)
$12:d87d  10 09		 bpl $d888
$12:d87f  fc ee 07	  jsr ($07ee,x)
$12:d882  1f 80 c6 15   ora $15c680,x
$12:d886  83 60		 sta $60,s
$12:d888  a0 27		 ldy #$27
$12:d88a  45 90		 eor $90
$12:d88c  13 89		 ora ($89,s),y
$12:d88e  16 cb		 asl $cb,x
$12:d890  89 fc		 bit #$fc
$12:d892  dd f5 e5	  cmp $e5f5,x
$12:d895  3d 7d dd	  and $dd7d,x
$12:d898  f6 71		 inc $71,x
$12:d89a  ff c9 df 4b   sbc $4bdfc9,x
$12:d89e  c1 4c		 cmp ($4c,x)
$12:d8a0  ff 44 bf d5   sbc $d5bf44,x
$12:d8a4  4f f8 94 3f   eor $3f94f8
$12:d8a8  c2 83		 rep #$83
$12:d8aa  2d 04 1a	  and $1a04
$12:d8ad  3f 0f 8e 42   and $428e0f,x
$12:d8b1  a3 f0		 lda $f0,s
$12:d8b3  b8			clv
$12:d8b4  f4 2e 3b	  pea $3b2e
$12:d8b7  14 84		 trb $84
$12:d8b9  31 44		 and ($44),y
$12:d8bb  b6 04		 ldx $04,y
$12:d8bd  01 80		 ora ($80,x)
$12:d8bf  90 0e		 bcc $d8cf
$12:d8c1  01 1c		 ora ($1c,x)
$12:d8c3  62 04 43	  per $1bca
$12:d8c6  e1 b0		 sbc ($b0,x)
$12:d8c8  a8			tay
$12:d8c9  7a			ply
$12:d8ca  2b			pld
$12:d8cb  1f 0f c7 82   ora $82c70f,x
$12:d8cf  e1 00		 sbc ($00,x)
$12:d8d1  c0 16		 cpy #$16
$12:d8d3  81 58		 sta ($58,x)
$12:d8d5  13 0f		 ora ($0f,s),y
$12:d8d7  85 43		 sta $43
$12:d8d9  e1 d8		 sbc ($d8,x)
$12:d8db  fc 19 03	  jsr ($0319,x)
$12:d8de  e0 9b		 cpx #$9b
$12:d8e0  02 e0		 cop #$e0
$12:d8e2  17 06		 ora [$06],y
$12:d8e4  15 1d		 ora $1d,x
$12:d8e6  82 c6 e2	  brl $bbaf
$12:d8e9  f0 d8		 beq $d8c3
$12:d8eb  f4 56 27	  pea $2756
$12:d8ee  1f 88 c6 c7   ora $c7c688,x
$12:d8f2  84 45		 sty $45
$12:d8f4  00 10		 brk #$10
$12:d8f6  47 63		 eor [$63]
$12:d8f8  f0 d8		 beq $d8d2
$12:d8fa  fc 1d 00	  jsr ($001d,x)
$12:d8fd  11 b6		 ora ($b6),y
$12:d8ff  21 6c		 and ($6c,x)
$12:d901  2e 17 0c	  rol $0c17
$12:d904  07 42		 ora [$42]
$12:d906  c0 60		 cpy #$60
$12:d908  0c 87 c2	  tsb $c287
$12:d90b  21 b0		 and ($b0,x)
$12:d90d  90 48		 bcc $d957
$12:d90f  19 82 50	  ora $5082,y
$12:d912  0f 85 c3 e0   ora $e0c385
$12:d916  94 0e		 sty $0e,x
$12:d918  07 c3		 ora [$c3]
$12:d91a  01 b0		 ora ($b0,x)
$12:d91c  80 27		 bra $d945
$12:d91e  06 2f		 asl $2f
$12:d920  79 bd fd	  adc $fdbd,y
$12:d923  f4 77 f8	  pea $f877
$12:d926  cc de df	  cpy $dfde
$12:d929  70 9f		 bvs $d8ca
$12:d92b  8f c6 0e bc   sta $bc0ec6
$12:d92f  0b			phd
$12:d930  fc 3f fe	  jsr ($fe3f,x)
$12:d933  c1 19		 cmp ($19,x)
$12:d935  fc 0e f6	  jsr ($f60e,x)
$12:d938  1f 00 70 03   ora $037000,x
$12:d93c  03 b1		 ora $b1,s
$12:d93e  3c df 77	  bit $77df,x
$12:d941  b1 9f		 lda ($9f),y
$12:d943  e9 87		 sbc #$87
$12:d945  63 d9		 adc $d9,s
$12:d947  1c fc 27	  trb $27fc
$12:d94a  c2 00		 rep #$00
$12:d94c  0b			phd
$12:d94d  0e 07 f3	  asl $f307
$12:d950  c1 fe		 cmp ($fe,x)
$12:d952  70 8f		 bvs $d8e3
$12:d954  e3 01		 sbc $01,s
$12:d956  bc 64 8c	  ldy $8c64,x
$12:d959  c0 18		 cpy #$18
$12:d95b  20 c0 81	  jsr $81c0
$12:d95e  40			rti
$12:d95f  a0 70		 ldy #$70
$12:d961  18			clc
$12:d962  19 f8 21	  ora $21f8,y
$12:d965  f0 78		 beq $d9df
$12:d967  1c 3d f6	  trb $f63d
$12:d96a  0f 03 01 8c   ora $8c0103
$12:d96e  1e 0f 0f	  asl $0f0f,x
$12:d971  87 c7		 sta [$c7]
$12:d973  c1 62		 cmp ($62,x)
$12:d975  ed 33 48	  sbc $4833
$12:d978  d0 20		 bne $d99a
$12:d97a  1e 0e 06	  asl $060e,x
$12:d97d  43 c1		 eor $c1,s
$12:d97f  d0 f0		 bne $d971
$12:d981  03 d7		 ora $d7,s
$12:d983  01 e0		 ora ($e0,x)
$12:d985  f0 19		 beq $d9a0
$12:d987  c0 52		 cpy #$52
$12:d989  47 e0		 eor [$e0]
$12:d98b  7a			ply
$12:d98c  0c 06 08	  tsb $0806
$12:d98f  f8			sed
$12:d990  38			sec
$12:d991  bc 3e 2b	  ldy $2b3e,x
$12:d994  0f 80 bd 40   ora $40bd80
$12:d998  09 20		 ora #$20
$12:d99a  d4 85		 pei ($85)
$12:d99c  0d 42 11	  ora $1142
$12:d99f  04 8f		 tsb $8f
$12:d9a1  c1 87		 cmp ($87,x)
$12:d9a3  e2 f5		 sep #$f5
$12:d9a5  17 78		 ora [$78],y
$12:d9a7  c3 a0		 cmp $a0,s
$12:d9a9  03 e0		 ora $e0,s
$12:d9ab  8d c5 c0	  sta $c0c5
$12:d9ae  e0 07		 cpx #$07
$12:d9b0  00 18		 brk #$18
$12:d9b2  37 43		 and [$43],y
$12:d9b4  3d e1 ff	  and $ffe1,x
$12:d9b7  b0 86		 bcs $d93f
$12:d9b9  79 ff 80	  adc $80ff,y
$12:d9bc  7f e0 3f ef   adc $ef3fe0,x
$12:d9c0  3c 63 81	  bit $8163,x
$12:d9c3  c0 39		 cpy #$39
$12:d9c5  82 06 9d	  brl $76ce
$12:d9c8  e1 20		 sbc ($20,x)
$12:d9ca  3f 87 c3 f1   and $f1c387,x
$12:d9ce  f8			sed
$12:d9cf  e2 7b		 sep #$7b
$12:d9d1  a8			tay
$12:d9d2  1f 09 c7 c3   ora $c3c709,x
$12:d9d6  11 70		 ora ($70),y
$12:d9d8  77 87		 adc [$87],y
$12:d9da  83 c0		 sta $c0,s
$12:d9dc  2d 04 a8	  and $a804
$12:d9df  7f bf c9 50   adc $50c9bf,x
$12:d9e3  54 93 bc	  mvn $bc,$93
$12:d9e6  47 e1		 eor [$e1]
$12:d9e8  04 83		 tsb $83
$12:d9ea  c1 86		 cmp ($86,x)
$12:d9ec  a1 07		 lda ($07,x)
$12:d9ee  87 4c		 sta [$4c]
$12:d9f0  ef f0 0b ea   sbc $ea0bf0
$12:d9f4  c0 60		 cpy #$60
$12:d9f6  10 58		 bpl $da50
$12:d9f8  20 18 60	  jsr $6018
$12:d9fb  d0 f8		 bne $d9f5
$12:d9fd  75 ee		 adc $ee,x
$12:d9ff  77 7b		 adc [$7b],y
$12:da01  bd a6 42	  lda $42a6,x
$12:da04  80 17		 bra $da1d
$12:da06  0c 02 64	  tsb $6402
$12:da09  38			sec
$12:da0a  0d 21 69	  ora $6921
$12:da0d  8e 00 5c	  stx $5c00
$12:da10  01 50		 ora ($50,x)
$12:da12  57 83		 eor [$83],y
$12:da14  7d 0f e0	  adc $e00f,x
$12:da17  7f 08 0c 3a   adc $3a0c08,x
$12:da1b  19 06 8d	  ora $8d06,y
$12:da1e  c1 7c		 cmp ($7c,x)
$12:da20  d0 af		 bne $d9d1
$12:da22  7c 43 cf	  jmp ($cf43,x)
$12:da25  10 fb		 bpl $da22
$12:da27  c0 23		 cpy #$23
$12:da29  f2 02		 sbc ($02)
$12:da2b  48			pha
$12:da2c  11 c2		 ora ($c2),y
$12:da2e  1d 0e 8e	  ora $8e0e,x
$12:da31  c7 23		 cmp [$23]
$12:da33  00 71		 brk #$71
$12:da35  9c 46 26	  stz $2646
$12:da38  10 03		 bpl $da3d
$12:da3a  e8			inx
$12:da3b  4f d4 00 79   eor $7900d4
$12:da3f  00 a2		 brk #$a2
$12:da41  f8			sed
$12:da42  cf 20 81 12   cmp $128120
$12:da46  48			pha
$12:da47  30 40		 bmi $da89
$12:da49  4c c9 d0	  jmp $d0c9
$12:da4c  a0 4c		 ldy #$4c
$12:da4e  30 9b		 bmi $d9eb
$12:da50  0b			phd
$12:da51  94 23		 sty $23,x
$12:da53  ed 08 f9	  sbc $f908
$12:da56  42 3f		 wdm #$3f
$12:da58  50 0f		 bvc $da69
$12:da5a  64 41		 stz $41
$12:da5c  52 57		 eor ($57)
$12:da5e  8f c6 72 39   sta $3972c6
$12:da62  0c 23 89	  tsb $8923
$12:da65  18			clc
$12:da66  23 02		 and $02,s
$12:da68  65 87		 adc $87
$12:da6a  bf 00 ac 25   lda $25ac00,x
$12:da6e  50 2e		 bvc $da9e
$12:da70  79 38 ef	  adc $ef38,y
$12:da73  f3 fd		 sbc ($fd,s),y
$12:da75  fd 7e bf	  sbc $bf7e,x
$12:da78  2f d0 44 36   and $3644d0
$12:da7c  f4 fe dc	  pea $dcfe
$12:da7f  f0 9c		 beq $da1d
$12:da81  5c 0f ff 83   jml $83ff0f
$12:da85  ff f0 0f 90   sbc $900ff0,x
$12:da89  80 6f		 bra $dafa
$12:da8b  97 c1		 sta [$c1],y
$12:da8d  00 6f		 brk #$6f
$12:da8f  bf f7 f4 a1   lda $a1f4f7,x
$12:da93  cf d2 82 8f   cmp $8f82d2
$12:da97  25 0d		 and $0d
$12:da99  31 42		 and ($42),y
$12:da9b  1f 1f a7 5f   ora $5fa71f,x
$12:da9f  70 f7		 bvs $da98
$12:daa1  bc 3d ff	  ldy $ff3d,x
$12:daa4  9f 37 d0 5f   sta $5fd037,x
$12:daa8  f4 f7 f8	  pea $f8f7
$12:daab  3c 1d fe	  bit $fe1d,x
$12:daae  17 f4		 ora [$f4],y
$12:dab0  a8			tay
$12:dab1  28			plp
$12:dab2  5d da 1f	  eor $1fda,x
$12:dab5  0f 87 73 fd   ora $fd7387
$12:dab9  f1 ff		 sbc ($ff),y
$12:dabb  76 7f		 ror $7f,x
$12:dabd  d3 d6		 cmp ($d6,s),y
$12:dabf  c0 ff		 cpy #$ff
$12:dac1  7f cc f2 ff   adc $fff2cc,x
$12:dac5  7f 94 31 15   adc $153194,x
$12:dac9  87 c7		 sta [$c7]
$12:dacb  60			rts
$12:dacc  f1 18		 sbc ($18),y
$12:dace  7c 0e 1f	  jmp ($1f0e,x)
$12:dad1  13 8d		 ora ($8d,s),y
$12:dad3  c6 62		 dec $62
$12:dad5  b0 c8		 bcs $da9f
$12:dad7  dc 5e 26	  jml [$265e]
$12:dada  c1 07		 cmp ($07,x)
$12:dadc  f8			sed
$12:dadd  c5 c0		 cmp $c0
$12:dadf  60			rts
$12:dae0  f6 08		 inc $08,x
$12:dae2  74 46		 stz $46,x
$12:dae4  3f 19 58 85   and $855819,x
$12:dae8  03 c0		 ora $c0,s
$12:daea  0f 08 87 c3   ora $c38708
$12:daee  21 e0		 and ($e0,x)
$12:daf0  c8			iny
$12:daf1  68			pla
$12:daf2  26 14		 rol $14
$12:daf4  0b			phd
$12:daf5  06 c3		 asl $c3
$12:daf7  a1 90		 lda ($90,x)
$12:daf9  68			pla
$12:dafa  83 44		 sta $44,s
$12:dafc  3c 1d 0f	  bit $0f1d,x
$12:daff  07 03		 ora [$03]
$12:db01  c1 80		 cmp ($80,x)
$12:db03  f0 40		 beq $db45
$12:db05  3e 13 0f	  rol $0f13,x
$12:db08  07 c2		 ora [$c2]
$12:db0a  0b			phd
$12:db0b  0f 80 bd 82   ora $82bd80
$12:db0f  3e f7 18	  rol $18f7,x
$12:db12  2b			pld
$12:db13  ec a1 2b	  cpx $2ba1
$12:db16  10 01		 bpl $db19
$12:db18  0c 3c 0c	  tsb $0c3c
$12:db1b  50 10		 bvc $db2d
$12:db1d  59 45 63	  eor $6345,y
$12:db20  b0 18		 bcs $db3a
$12:db22  1c 1a 07	  trb $071a
$12:db25  0b			phd
$12:db26  5f 84 3c 18   eor $183c84,x
$12:db2a  11 58		 ora ($58),y
$12:db2c  5c 46 0f 01   jml $010f46
$12:db30  83 c0		 sta $c0,s
$12:db32  d5 e0		 cmp $e0,x
$12:db34  b0 01		 bcs $db37
$12:db36  f1 19		 sbc ($19),y
$12:db38  54 9e 04	  mvn $04,$9e
$12:db3b  f6 79		 inc $79,x
$12:db3d  84 74		 sty $74
$12:db3f  e0 05		 cpx #$05
$12:db41  e1 2f		 sbc ($2f,x)
$12:db43  e4 03		 cpx $03
$12:db45  00 8f		 brk #$8f
$12:db47  0e 06 03	  asl $0306
$12:db4a  40			rti
$12:db4b  cf 0f 05 83   cmp $83050f
$12:db4f  c1 50		 cmp ($50,x)
$12:db51  d0 5c		 bne $dbaf
$12:db53  30 09		 bmi $db5e
$12:db55  e2 4b		 sep #$4b
$12:db57  0a			asl a
$12:db58  94 43		 sty $43,x
$12:db5a  e4 d1		 cpx $d1
$12:db5c  0a			asl a
$12:db5d  44 de 1f	  mvp $1f,$de
$12:db60  08			php
$12:db61  21 84		 and ($84,x)
$12:db63  02 21		 cop #$21
$12:db65  00 5b		 brk #$5b
$12:db67  ad fe fe	  lda $fefe
$12:db6a  04 08		 tsb $08
$12:db6c  c4 7e		 cpy $7e
$12:db6e  20 b6 7e	  jsr $7eb6
$12:db71  bd 83 fb	  lda $fb83,x
$12:db74  b3 a9		 lda ($a9,s),y
$12:db76  cf e5 71 78   cmp $7871e5
$12:db7a  b4 3d		 ldy $3d,x
$12:db7c  ae 10 58	  ldx $5810
$12:db7f  74 02		 stz $02,x
$12:db81  1d ff ff	  ora $ffff,x
$12:db84  df db e0 e0   cmp $e0e0db,x
$12:db88  0b			phd
$12:db89  fc fe 7e	  jsr ($7efe,x)
$12:db8c  65 48		 adc $48
$12:db8e  64 1a		 stz $1a
$12:db90  05 06		 ora $06
$12:db92  8e c0 bf	  stx $bfc0
$12:db95  2f 41 ff c0   and $c0ff41
$12:db99  3f b0 08 ba   and $ba08b0,x
$12:db9d  c8			iny
$12:db9e  21 f0		 and ($f0,x)
$12:dba0  60			rts
$12:dba1  0b			phd
$12:dba2  c3 a0		 cmp $a0,s
$12:dba4  d0 c8		 bne $db6e
$12:dba6  04 fa		 tsb $fa
$12:dba8  01 01		 ora ($01,x)
$12:dbaa  80 f8		 bra $dba4
$12:dbac  e0 0f		 cpx #$0f
$12:dbae  90 0a		 bcc $dbba
$12:dbb0  a0 4c		 ldy #$4c
$12:dbb2  7f f1 e4 70   adc $70e4f1,x
$12:dbb6  08			php
$12:dbb7  e7 01		 sbc [$01]
$12:dbb9  70 a0		 bvs $db5b
$12:dbbb  4c 32 90	  jmp $9032
$12:dbbe  8f 34 43 dd   sta $dd4334
$12:dbc2  00 df		 brk #$df
$12:dbc4  50 3f		 bvc $dc05
$12:dbc6  d0 0f		 bne $dbd7
$12:dbc8  e4 03		 cpx $03
$12:dbca  f0 3f		 beq $dc0b
$12:dbcc  1b			tcs
$12:dbcd  c5 e2		 cmp $e2
$12:dbcf  71 38		 adc ($38),y
$12:dbd1  b8			clv
$12:dbd2  4c 2c 0b	  jmp $0b2c
$12:dbd5  73 62		 adc ($62,s),y
$12:dbd7  80 34		 bra $dc0d
$12:dbd9  20 10 c2	  jsr $c210
$12:dbdc  a1 14		 lda ($14,x)
$12:dbde  c4 a4		 cpy $a4
$12:dbe0  51 c2		 eor ($c2),y
$12:dbe2  a1 98		 lda ($98,x)
$12:dbe4  5e fc df	  lsr $dffc,x
$12:dbe7  0c 0c 02	  tsb $020c
$12:dbea  fd 2c bf	  sbc $bf2c,x
$12:dbed  1c c0 e2	  trb $e2c0
$12:dbf0  38			sec
$12:dbf1  13 78		 ora ($78,s),y
$12:dbf3  2d c0 ec	  and $ecc0
$12:dbf6  01 54		 ora ($54,x)
$12:dbf8  3b			tsc
$12:dbf9  0a			asl a
$12:dbfa  dc 66 f1	  jml [$f166]
$12:dbfd  89 dc		 bit #$dc
$12:dbff  52 69		 eor ($69)
$12:dc01  2b			pld
$12:dc02  91 47		 sta ($47),y
$12:dc04  e0 71		 cpx #$71
$12:dc06  f8			sed
$12:dc07  dc 52 13	  jml [$1352]
$12:dc0a  1e 2b 8c	  asl $8c2b,x
$12:dc0d  e1 3e		 sbc ($3e,x)
$12:dc0f  10 89		 bpl $db9a
$12:dc11  a2 38		 ldx #$38
$12:dc13  22 11 78 e4   jsl $e47811
$12:dc17  6e 3d 1d	  ror $1d3d
$12:dc1a  2a			rol a
$12:dc1b  06 1e		 asl $1e
$12:dc1d  ff af af fb   sbc $fbafaf,x
$12:dc21  e3 fd		 sbc $fd,s
$12:dc23  d9 fe f6	  cmp $f6fe,y
$12:dc26  ff 9b bf e0   sbc $e0bf9b,x
$12:dc2a  ef fc 09 fb   sbc $fb09fc
$12:dc2e  88			dey
$12:dc2f  57 f7		 eor [$f7],y
$12:dc31  f9 ff 33	  sbc $33ff,y
$12:dc34  c3 bb		 cmp $bb,s
$12:dc36  fe f2 ff	  inc $fff2,x
$12:dc39  be ad 21	  ldx $21ad,y
$12:dc3c  f0 ff		 beq $dc3d
$12:dc3e  a0 7f		 ldy #$7f
$12:dc40  c0 f8		 cpy #$f8
$12:dc42  37 f2		 and [$f2],y
$12:dc44  13 0f		 ora ($0f,s),y
$12:dc46  8c c7 e1	  sty $e1c7
$12:dc49  31 b8		 and ($b8),y
$12:dc4b  2c 1e 2d	  bit $2d1e
$12:dc4e  15 8f		 ora $8f,x
$12:dc50  43 84		 eor $84,s
$12:dc52  41 13		 eor ($13,x)
$12:dc54  80 45		 bra $dc9b
$12:dc56  63 af		 adc $af,s
$12:dc58  f0 8b		 beq $dbe5
$12:dc5a  a6 02		 ldx $02
$12:dc5c  3f 0b 8f 40   and $408f0b,x
$12:dc60  61 e5		 adc ($e5,x)
$12:dc62  21 80		 and ($80,x)
$12:dc64  48			pha
$12:dc65  3c 13 0f	  bit $0f13,x
$12:dc68  84 83		 sty $83
$12:dc6a  61 40		 adc ($40,x)
$12:dc6c  e8			inx
$12:dc6d  7c 28 1e	  jmp ($1e28,x)
$12:dc70  0e 06 42	  asl $4206
$12:dc73  40			rti
$12:dc74  1b			tcs
$12:dc75  0a			asl a
$12:dc76  85 c0		 sta $c0
$12:dc78  3e 01 60	  rol $6001,x
$12:dc7b  d8			cld
$12:dc7c  09 06		 ora #$06
$12:dc7e  61 f0		 adc ($f0,x)
$12:dc80  b0 0a		 bcs $dc8c
$12:dc82  c6 37		 dec $37
$12:dc84  1d 79 84	  ora $8479,x
$12:dc87  56 0f		 lsr $0f,x
$12:dc89  06 82		 asl $82
$12:dc8b  c3 a0		 cmp $a0,s
$12:dc8d  d1 b8		 cmp ($b8),y
$12:dc8f  04 5e		 tsb $5e
$12:dc91  08			php
$12:dc92  fb			xce
$12:dc93  00 0a		 brk #$0a
$12:dc95  2a			rol a
$12:dc96  81 de		 sta ($de,x)
$12:dc98  09 d0		 ora #$d0
$12:dc9a  84 27		 sty $27
$12:dc9c  82 01 b0	  brl $8ca0
$12:dc9f  b8			clv
$12:dca0  04 c2		 tsb $c2
$12:dca2  a1 c0		 lda ($c0,x)
$12:dca4  f0 06		 beq $dcac
$12:dca6  17 61		 ora [$61],y
$12:dca8  00 10		 brk #$10
$12:dcaa  b0 3c		 bcs $dce8
$12:dcac  05 64		 ora $64
$12:dcae  2b			pld
$12:dcaf  08			php
$12:dcb0  ac 5c de	  ldy $de5c
$12:dcb3  11 b8		 ora ($b8),y
$12:dcb5  bc 2c 68	  ldy $682c,x
$12:dcb8  10 d8		 bpl $dc92
$12:dcba  e4 36		 cpx $36
$12:dcbc  21 0c		 and ($0c,x)
$12:dcbe  8a			txa
$12:dcbf  bb			tyx
$12:dcc0  c2 3e		 rep #$3e
$12:dcc2  7f 24 23 47   adc $472324,x
$12:dcc6  87 a1		 sta [$a1]
$12:dcc8  c0 88 74	  cpy #$7488
$12:dccb  04 41		 tsb $41
$12:dccd  a0 e0 74	  ldy #$74e0
$12:dcd0  2c 1b 0d	  bit $0d1b
$12:dcd3  00 6c		 brk #$6c
$12:dcd5  30 1a		 bmi $dcf1
$12:dcd7  0f 87 c3 c0   ora $c0c387
$12:dcdb  a0 15 23	  ldy #$2315
$12:dcde  5c 3e 06 f0   jml $f0063e
$12:dce2  01 01		 ora ($01,x)
$12:dce4  d4 a2		 pei ($a2)
$12:dce6  b0 d8		 bcs $dcc0
$12:dce8  dc 3e 0b	  jml [$0b3e]
$12:dceb  09 89 c5	  ora #$c589
$12:dcee  90 31		 bcc $dd21
$12:dcf0  1d 46 0c	  ora $0c46,x
$12:dcf3  32 3d		 and ($3d)
$12:dcf5  50 49		 bvc $dd40
$12:dcf7  1f 02 c1 50   ora $50c102,x
$12:dcfb  4c 07 82	  jmp $8207
$12:dcfe  a1 20		 lda ($20,x)
$12:dd00  d8			cld
$12:dd01  74 14		 stz $14,x
$12:dd03  30 ad		 bmi $dcb2
$12:dd05  07 10		 ora [$10]
$12:dd07  58			cli
$12:dd08  3e 10 08	  rol $0810,x
$12:dd0b  74 76		 stz $76,x
$12:dd0d  0d 36 89	  ora $8936
$12:dd10  f7 24		 sbc [$24],y
$12:dd12  3f e8 0f fe   and $fe0fe8,x
$12:dd16  00 f9		 brk #$f9
$12:dd18  08			php
$12:dd19  ec 09 08	  cpx $0809
$12:dd1c  10 f8		 bpl $dd16
$12:dd1e  7c be 3f	  jmp ($3fbe,x)
$12:dd21  33 81		 and ($81,s),y
$12:dd23  c0 40 e2	  cpy #$e240
$12:dd26  06 08		 asl $08
$12:dd28  1c 03 cf	  trb $cf03
$12:dd2b  18			clc
$12:dd2c  9f 40 3c 30   sta $303c40,x
$12:dd30  1b			tcs
$12:dd31  fc 00 2a	  jsr ($2a00,x)
$12:dd34  9e 27 c0	  stz $c027,x
$12:dd37  07 c5		 ora [$c5]
$12:dd39  1a			inc a
$12:dd3a  18			clc
$12:dd3b  01 29		 ora ($29,x)
$12:dd3d  e0 70 10	  cpx #$1070
$12:dd40  18			clc
$12:dd41  04 22		 tsb $22
$12:dd43  e1 80		 sbc ($80,x)
$12:dd45  b8			clv
$12:dd46  67 2d		 adc [$2d]
$12:dd48  1b			tcs
$12:dd49  ea			nop
$12:dd4a  86 7b		 stx $7b
$12:dd4c  81 7e		 sta ($7e,x)
$12:dd4e  80 6f		 bra $ddbf
$12:dd50  a0 1f c8	  ldy #$c81f
$12:dd53  07 e0		 ora [$e0]
$12:dd55  7e 2e 20	  ror $202e,x
$12:dd58  f4 1a 03	  pea $031a
$12:dd5b  c0 d4 06	  cpy #$06d4
$12:dd5e  a0 60 20	  ldy #$2060
$12:dd61  10 c8		 bpl $dd2b
$12:dd63  04 42		 tsb $42
$12:dd65  38			sec
$12:dd66  4f a2 f0 43   eor $43f0a2
$12:dd6a  0b			phd
$12:dd6b  d7 00		 cmp [$00],y
$12:dd6d  37 8c		 and [$8c],y
$12:dd6f  62 30 71	  per $4ea2
$12:dd72  18			clc
$12:dd73  3f 13 f9 c0   and $c0f913,x
$12:dd77  8f e5 3b 66   sta $663be5
$12:dd7b  f2 38		 sbc ($38)
$12:dd7d  8a			txa
$12:dd7e  10 63		 bpl $dde3
$12:dd80  63 e0		 adc $e0,s
$12:dd82  7d 09 bd	  adc $bd09,x
$12:dd85  a3 90		 lda $90,s
$12:dd87  4e 07 ff	  lsr $ff07
$12:dd8a  87 18		 sta [$18]
$12:dd8c  a4 77		 ldy $77
$12:dd8e  cf ec 89 03   cmp $0389ec
$12:dd92  a0 3e 41	  ldy #$413e
$12:dd95  16 07		 asl $07,x
$12:dd97  f3 81		 sbc ($81,s),y
$12:dd99  c1 a1		 cmp ($a1,x)
$12:dd9b  f0 b0		 beq $dd4d
$12:dd9d  08			php
$12:dd9e  47 23		 eor [$23]
$12:dda0  51 d8		 eor ($d8),y
$12:dda2  2a			rol a
$12:dda3  9c 16 07	  stz $0716
$12:dda6  00 87		 brk #$87
$12:dda8  b1 42		 lda ($42),y
$12:ddaa  03 1f		 ora $1f,s
$12:ddac  64 84		 stz $84
$12:ddae  0e 3e 7f	  asl $7f3e
$12:ddb1  3c 07 00	  bit $0007,x
$12:ddb4  8c 16 0c	  sty $0c16
$12:ddb7  04 43		 tsb $43
$12:ddb9  61 70		 adc ($70,x)
$12:ddbb  a0 6c 19	  ldy #$196c
$12:ddbe  e9 00 f0	  sbc #$f000
$12:ddc1  60			rts
$12:ddc2  08			php
$12:ddc3  c1 f0		 cmp ($f0,x)
$12:ddc5  80 7c		 bra $de43
$12:ddc7  30 1f		 bmi $dde8
$12:ddc9  06 70		 asl $70
$12:ddcb  33 81		 and ($81,s),y
$12:ddcd  8c 10 77	  sty $7710
$12:ddd0  a2 b1 02	  ldx #$02b1
$12:ddd3  10 7f		 bpl $de54
$12:ddd5  40			rti
$12:ddd6  03 e4		 ora $e4,s
$12:ddd8  24 0d		 bit $0d
$12:ddda  e0 6f 07	  cpx #$076f
$12:dddd  42 40		 wdm #$40
$12:dddf  15 0f		 ora $0f,x
$12:dde1  04 03		 tsb $03
$12:dde3  80 e3		 bra $ddc8
$12:dde5  1b			tcs
$12:dde6  00 7d		 brk #$7d
$12:dde8  20 12 00	  jsr $0012
$12:ddeb  02 bb		 cop #$bb
$12:dded  c9 e2 cc	  cmp #$cce2
$12:ddf0  40			rti
$12:ddf1  1e 78 4a	  asl $4a78,x
$12:ddf4  43 64		 eor $64,s
$12:ddf6  6f 01 1d 28   adc $281d01
$12:ddfa  4a			lsr a
$12:ddfb  1f 02 89 c5   ora $c58902,x
$12:ddff  22 f0 48 ba   jsl $ba48f0
$12:de03  20 54 e1	  jsr $e154
$12:de06  1f 82 31 82   ora $823182,x
$12:de0a  39 1e 86	  and $861e,y
$12:de0d  47 21		 eor [$21]
$12:de0f  88			dey
$12:de10  35 7f		 and $7f,x
$12:de12  96 c3		 stx $c3,y
$12:de14  21 d0		 and ($d0,x)
$12:de16  75 85		 adc $85,x
$12:de18  01 d4		 ora ($d4,x)
$12:de1a  01 90		 ora ($90,x)
$12:de1c  0c 91 74	  tsb $7491
$12:de1f  7e 01 f0	  ror $f001,x
$12:de22  31 d1		 and ($d1),y
$12:de24  ec 22 62	  cpx $6222
$12:de27  e5 78		 sbc $78
$12:de29  93 f4		 sta ($f4,s),y
$12:de2b  10 64		 bpl $de91
$12:de2d  00 ae		 brk #$ae
$12:de2f  85 01		 sta $01
$12:de31  22 01 12 49   jsl $491201
$12:de35  a1 5c		 lda ($5c,x)
$12:de37  2c 0d f5	  bit $f50d
$12:de3a  13 b4		 ora ($b4,s),y
$12:de3c  1a			inc a
$12:de3d  05 0a		 ora $0a
$12:de3f  86 45		 stx $45
$12:de41  61 1f		 adc ($1f,x)
$12:de43  b8			clv
$12:de44  07 fe		 ora [$fe]
$12:de46  01 fd		 ora ($fd,x)
$12:de48  81 3d		 sta ($3d,x)
$12:de4a  c0 66 30	  cpy #$3066
$12:de4d  f8			sed
$12:de4e  34 38		 bit $38,x
$12:de50  04 08		 tsb $08
$12:de52  30 83		 bmi $ddd7
$12:de54  41 20		 eor ($20,x)
$12:de56  c6 93		 dec $93
$12:de58  9f 9a c7 c6   sta $c6c79a,x
$12:de5c  f6 10		 inc $10,x
$12:de5e  aa			tax
$12:de5f  04 c7		 tsb $c7
$12:de61  ff 1f 59 81   sbc $81591f,x
$12:de65  06 68		 asl $68
$12:de67  13 0e		 ora ($0e,s),y
$12:de69  86 83		 stx $83
$12:de6b  39 20 e7	  and $e720,y
$12:de6e  44 06 a1	  mvp $a1,$06
$12:de71  ee 1c 04	  inc $041c
$12:de74  03 79		 ora $79,s
$12:de76  40			rti
$12:de77  fc 7e 2e	  jsr ($2e7e,x)
$12:de7a  1f 0b 85 c2   ora $c2850b,x
$12:de7e  60			rts
$12:de7f  45 32		 eor $32
$12:de81  20 18 41	  jsr $4118
$12:de84  84 11		 sty $11
$12:de86  04 08		 tsb $08
$12:de88  44 23 86	  mvp $86,$23
$12:de8b  b1 60		 lda ($60),y
$12:de8d  12 0c		 ora ($0c)
$12:de8f  23 88		 and $88,s
$12:de91  22 41 19 38   jsl $381941
$12:de95  4a			lsr a
$12:de96  e3 c0		 sbc $c0,s
$12:de98  8f c0 e7 1d   sta $1de7c0
$12:de9c  8f 3c 72 08   sta $08723c
$12:dea0  eb			xba
$12:dea1  08			php
$12:dea2  c4 61		 cpy $61
$12:dea4  d6 5f		 dec $5f,x
$12:dea6  88			dey
$12:dea7  07 7c		 ora [$7c]
$12:dea9  f0 10		 beq $debb
$12:deab  08			php
$12:deac  da			phx
$12:dead  08			php
$12:deae  5d 29 c4	  eor $c429,x
$12:deb1  42 84		 wdm #$84
$12:deb3  ff b9 e4 8c   sbc $8ce4b9,x
$12:deb7  41 ce		 eor ($ce,x)
$12:deb9  ec f7 0e	  cpx $0ef7
$12:debc  c2 10		 rep #$10
$12:debe  d0 ed		 bne $dead
$12:dec0  0f 8a c3 a2   ora $a2c38a
$12:dec4  b1 78		 lda ($78),y
$12:dec6  7c 6e 0f	  jmp ($0f6e,x)
$12:dec9  0c 89 c4	  tsb $c489
$12:decc  e3 11		 sbc $11,s
$12:dece  08			php
$12:decf  c4 22		 cpy $22
$12:ded1  11 0d		 ora ($0d),y
$12:ded3  8f af c0 42   sta $42c0af
$12:ded7  10 f8		 bpl $ded1
$12:ded9  fc 1c e0	  jsr ($e01c,x)
$12:dedc  08			php
$12:dedd  52 84		 eor ($84)
$12:dedf  78			sei
$12:dee0  2a			rol a
$12:dee1  0c f0 e8	  tsb $e8f0
$12:dee4  78			sei
$12:dee5  36 1c		 rol $1c,x
$12:dee7  0b			phd
$12:dee8  06 43		 asl $43
$12:deea  21 30		 and ($30,x)
$12:deec  88			dey
$12:deed  4c 24 12	  jmp $1224
$12:def0  0b			phd
$12:def1  07 c1		 ora [$c1]
$12:def3  be 0e 20	  ldx $200e,y
$12:def6  f0 7c		 beq $df74
$12:def8  38			sec
$12:def9  1f 0c 06 c2   ora $c2060c,x
$12:defd  01 30		 ora ($30,x)
$12:deff  80 48		 bra $df49
$12:df01  3d fd f0	  and $f0fd,x
$12:df04  78			sei
$12:df05  4e 22 13	  lsr $1322
$12:df08  f8			sed
$12:df09  ff be 3f e0   sbc $e03fbe,x
$12:df0d  8f f9 e1 1e   sta $1ee1f9
$12:df11  f1 50		 sbc ($50),y
$12:df13  f0 20		 beq $df35
$12:df15  1c f0 00	  trb $00f0
$12:df18  81 49		 sta ($49,x)
$12:df1a  02 08		 cop #$08
$12:df1c  10 fb		 bpl $df19
$12:df1e  fe ff 90	  inc $90ff,x
$12:df21  08			php
$12:df22  e4 23		 cpx $23
$12:df24  f9 f8 fb	  sbc $fbf8,y
$12:df27  fe 20 ff	  inc $ff20,x
$12:df2a  8a			txa
$12:df2b  3e c3 ee	  rol $eec3,x
$12:df2e  aa			tax
$12:df2f  18			clc
$12:df30  1c 03 e6	  trb $e603
$12:df33  20 11 29	  jsr $2911
$12:df36  7e c5 43	  ror $43c5,x
$12:df39  7f ef cb fb   adc $fbcbef,x
$12:df3d  f7 8e		 sbc [$8e],y
$12:df3f  3d 83 b1	  and $b183,x
$12:df42  20 ec 0d	  jsr $0dec
$12:df45  40			rti
$12:df46  66 17		 ror $17
$12:df48  de 78 15	  dec $1578,x
$12:df4b  38			sec
$12:df4c  e4 43		 cpx $43
$12:df4e  04 97		 tsb $97
$12:df50  f7 f7		 sbc [$f7],y
$12:df52  f4 fd c7	  pea $c7fd
$12:df55  7c 70 58	  jmp ($5870,x)
$12:df58  dc 12 36	  jml [$3612]
$12:df5b  55 02		 eor $02,x
$12:df5d  98			tya
$12:df5e  5f 7e 62 54   eor $54627e,x
$12:df62  f1 99		 sbc ($99),y
$12:df64  0c 52 5f	  tsb $5f52
$12:df67  fe 03 68	  inc $6803,x
$12:df6a  1e 24 fd	  asl $fd24,x
$12:df6d  0f fb d8 43   ora $43d8fb
$12:df71  00 97		 brk #$97
$12:df73  00 19		 brk #$19
$12:df75  00 c0		 brk #$c0
$12:df77  9a			txs
$12:df78  00 54		 brk #$54
$12:df7a  ff c0 e1 81   sbc $81e1c0,x
$12:df7e  40			rti
$12:df7f  09 08 74	  ora #$7408
$12:df82  3f e1 61 7c   and $7c61e1,x
$12:df86  00 7c		 brk #$7c
$12:df88  04 64		 tsb $64
$12:df8a  23 01		 and $01,s
$12:df8c  58			cli
$12:df8d  09 52 71	  ora #$7152
$12:df90  c7 bc		 cmp [$bc]
$12:df92  f3 e6		 sbc ($e6,s),y
$12:df94  1c fb 78	  trb $78fb
$12:df97  c8			iny
$12:df98  46 e4		 lsr $e4
$12:df9a  35 00		 and $00,x
$12:df9c  4a			lsr a
$12:df9d  10 62		 bpl $e001
$12:df9f  39 e3 9e	  and $9ee3,y
$12:dfa2  fc e1 9f	  jsr ($9fe1,x)
$12:dfa5  3f a9 48 4a   and $4a48a9,x
$12:dfa9  e4 55		 cpx $55
$12:dfab  01 4a		 ora ($4a,x)
$12:dfad  18			clc
$12:dfae  62 4e 30	  per $0fff
$12:dfb1  19 ff 7f	  ora $7fff,y
$12:dfb4  61 4f		 adc ($4f,x)
$12:dfb6  7a			ply
$12:dfb7  80 60		 bra $e019
$12:dfb9  34 f5		 bit $f5,x
$12:dfbb  f3 d8		 sbc ($d8,s),y
$12:dfbd  0f d1 82 c4   ora $c482d1
$12:dfc1  b0 f2		 bcs $dfb5
$12:dfc3  14 07		 trb $07
$12:dfc5  f9 fb 87	  sbc $87fb,y
$12:dfc8  7c 6b df	  jmp ($df6b,x)
$12:dfcb  14 e8		 trb $e8
$12:dfcd  79 bf 29	  adc $29bf,y
$12:dfd0  b0 2f		 bcs $e001
$12:dfd2  a3 85		 lda $85,s
$12:dfd4  94 61		 sty $61,x
$12:dfd6  af af e8 ea   lda $eae8af
$12:dfda  7e c8 06	  ror $06c8,x
$12:dfdd  c6 91		 dec $91
$12:dfdf  e2 88		 sep #$88
$12:dfe1  fe 28 fa	  inc $fa28,x
$12:dfe4  ba			tsx
$12:dfe5  de 92 91	  dec $9192,x
$12:dfe8  80 a0		 bra $df8a
$12:dfea  70 21		 bvs $e00d
$12:dfec  9c 08 fe	  stz $fe08
$12:dfef  3e a1 9f	  rol $9fa1,x
$12:dff2  20 04 03	  jsr $0304
$12:dff5  01 44		 ora ($44,x)
$12:dff7  21 87		 and ($87,x)
$12:dff9  9b			txy
$12:dffa  d3 87		 cmp ($87,s),y
$12:dffc  c4 57		 cpy $57
$12:dffe  a0 38 f9	  ldy #$f938
$12:e001  87 9e		 sta [$9e]
$12:e003  11 1d		 ora ($1d),y
$12:e005  f1 55		 sbc ($55),y
$12:e007  60			rts
$12:e008  5e 78 84	  lsr $8478,x
$12:e00b  0c bc 17	  tsb $17bc
$12:e00e  08			php
$12:e00f  1f e3 e7 08   ora $08e7e3,x
$12:e013  70 84		 bvs $df99
$12:e015  06 05		 asl $05
$12:e017  03 f4		 ora $f4,s
$12:e019  18			clc
$12:e01a  c3 79		 cmp $79,s
$12:e01c  53 dd		 eor ($dd,s),y
$12:e01e  51 5f		 eor ($5f),y
$12:e020  21 af		 and ($af,x)
$12:e022  ab			plb
$12:e023  bf 43 51 58   lda $585143,x
$12:e027  fd c0 fe	  sbc $fec0,x
$12:e02a  74 0e		 stz $0e,x
$12:e02c  9c 33 af	  stz $af33
$12:e02f  08			php
$12:e030  62 8a 08	  per $e8bd
$12:e033  70 14		 bvs $e049
$12:e035  7c 05 73	  jmp ($7305,x)
$12:e038  9f 10 8e 7a   sta $7a8e10,x
$12:e03c  e1 de		 sbc ($de,x)
$12:e03e  1a			inc a
$12:e03f  ee 88 36	  inc $3688
$12:e042  55 7a		 eor $7a,x
$12:e044  c6 b6		 dec $b6
$12:e046  25 2f		 and $2f
$12:e048  c0 7a 62	  cpy #$627a
$12:e04b  46 71		 lsr $71
$12:e04d  a1 1a		 lda ($1a,x)
$12:e04f  44 50 1a	  mvp $1a,$50
$12:e052  08			php
$12:e053  0f eb a3 2a   ora $2aa3eb
$12:e057  38			sec
$12:e058  87 9e		 sta [$9e]
$12:e05a  3f ee 8f 78   and $788fee,x
$12:e05e  62 3f a8	  per $88a0
$12:e061  17 a6		 ora [$a6],y
$12:e063  05 e4		 ora $e4
$12:e065  86 79		 stx $79
$12:e067  63 7c		 adc $7c,s
$12:e069  08			php
$12:e06a  10 24		 bpl $e090
$12:e06c  60			rts
$12:e06d  3c 08 77	  bit $7708,x
$12:e070  02 3a		 cop #$3a
$12:e072  05 2e		 ora $2e
$12:e074  0c 11 68	  tsb $6811
$12:e077  00 f0		 brk #$f0
$12:e079  0e 86 9b	  asl $9b86
$12:e07c  57 af		 eor [$af],y
$12:e07e  88			dey
$12:e07f  45 68		 eor $68
$12:e081  5b			tcd
$12:e082  5a			phy
$12:e083  84 1c		 sty $1c
$12:e085  3c 26 90	  bit $9026,x
$12:e088  34 8d		 bit $8d,x
$12:e08a  40			rti
$12:e08b  c6 09		 dec $09
$12:e08d  f2 0f		 sbc ($0f)
$12:e08f  87 fe		 sta [$fe]
$12:e091  3e 2f 03	  rol $032f,x
$12:e094  b8			clv
$12:e095  69 eb fb	  adc #$fbeb
$12:e098  8a			txa
$12:e099  3c ff 8f	  bit $8fff,x
$12:e09c  38			sec
$12:e09d  e7 cc		 sbc [$cc]
$12:e09f  39 e8 31	  and $31e8,y
$12:e0a2  00 3b		 brk #$3b
$12:e0a4  24 bf		 bit $bf
$12:e0a6  ff 8f b2 58   sbc $58b28f,x
$12:e0aa  52 a0		 eor ($a0)
$12:e0ac  b4 0f		 ldy $0f,x
$12:e0ae  e7 8f		 sbc [$8f]
$12:e0b0  79 f3 86	  adc $86f3,y
$12:e0b3  7c d4 e2	  jmp ($e2d4,x)
$12:e0b6  20 75 08	  jsr $0875
$12:e0b9  28			plp
$12:e0ba  42 e1		 wdm #$e1
$12:e0bc  cf bc 71 ec   cmp $ec71bc
$12:e0c0  1d 89 07	  ora $0789,x
$12:e0c3  60			rts
$12:e0c4  66 03		 ror $03
$12:e0c6  10 97		 bpl $e05f
$12:e0c8  f7 ef		 sbc [$ef],y
$12:e0ca  fd f6 58	  sbc $58f6,x
$12:e0cd  20 c3 8e	  jsr $8ec3
$12:e0d0  42 37		 wdm #$37
$12:e0d2  fa			plx
$12:e0d3  43 7e		 eor $7e,s
$12:e0d5  71 df		 adc ($df),y
$12:e0d7  1c 16 37	  trb $3716
$12:e0da  04 8d		 tsb $8d
$12:e0dc  94 c0		 sty $c0,x
$12:e0de  a2 1f 4f	  ldx #$4f1f
$12:e0e1  df f7 f6 eb   cmp $ebf6f7,x
$12:e0e5  2f 19 88 c3   and $c38819
$12:e0e9  e9 e2 86	  sbc #$86e2
$12:e0ec  fb			xce
$12:e0ed  e0 1b f7	  cpx #$f71b
$12:e0f0  90 bc		 bcc $e0ae
$12:e0f2  42 4f		 wdm #$4f
$12:e0f4  df 9c 71 c6   cmp $c6719c,x
$12:e0f8  a0 c9 27	  ldy #$27c9
$12:e0fb  fc 10 c3	  jsr ($c310,x)
$12:e0fe  0f 70 fb c0   ora $c0fb70
$12:e102  3f c1 21 08   and $0821c1,x
$12:e106  83 44		 sta $44,s
$12:e108  23 9e		 and $9e,s
$12:e10a  32 a8		 and ($a8)
$12:e10c  0a			asl a
$12:e10d  c8			iny
$12:e10e  3f 06 30 18   and $183006,x
$12:e112  85 bf		 sta $bf
$12:e114  be 2f 0b	  ldx $0b2f,y
$12:e117  cf 3c f6 03   cmp $03f63c
$12:e11b  30 19		 bmi $e136
$12:e11d  81 ec		 sta ($ec,x)
$12:e11f  00 ec		 brk #$ec
$12:e121  41 42		 eor ($42,x)
$12:e123  68			pla
$12:e124  14 43		 trb $43
$12:e126  eb			xba
$12:e127  fb			xce
$12:e128  27 84		 and [$84]
$12:e12a  f7 e6		 sbc [$e6],y
$12:e12c  9b			txy
$12:e12d  02 b8		 cop #$b8
$12:e12f  15 c1		 ora $c1,x
$12:e131  36 02		 rol $02,x
$12:e133  76 30		 ror $30,x
$12:e135  a0 a4 0e	  ldy #$0ea4
$12:e138  a1 ff		 lda ($ff,x)
$12:e13a  8f 9c 43 cf   sta $cf439c
$12:e13e  08			php
$12:e13f  9c 41 e5	  stz $e541
$12:e142  f1 f9		 sbc ($f9),y
$12:e144  84 43		 sty $43
$12:e146  80 fd		 bra $e145
$12:e148  06 03		 asl $03
$12:e14a  93 43		 sta ($43,s),y
$12:e14c  9f 00 06 02   sta $020600,x
$12:e150  54 3f ff	  mvn $ff,$3f
$12:e153  84 88		 sty $88
$12:e155  79 e2 11	  adc $11e2,y
$12:e158  cf 07 d3 f1   cmp $f1d307
$12:e15c  0c 84 40	  tsb $4084
$12:e15f  c3 a0		 cmp $a0,s
$12:e161  e0 77 08	  cpx #$0877
$12:e164  7c c1 83	  jmp ($83c1,x)
$12:e167  f2 80		 sbc ($80)
$12:e169  cc 28 1e	  cpy $1e28
$12:e16c  cc 04 ea	  cpy $ea04
$12:e16f  2b			pld
$12:e170  f9 c2 4b	  sbc $4bc2,y
$12:e173  2a			rol a
$12:e174  3a			dec a
$12:e175  4a			lsr a
$12:e176  1c 0e 21	  trb $210e
$12:e179  c7 8c		 cmp [$8c]
$12:e17b  61 eb		 adc ($eb,x)
$12:e17d  18			clc
$12:e17e  0a			asl a
$12:e17f  9f 02 1f 00   sta $001f02,x
$12:e183  a7 c0		 lda [$c0]
$12:e185  3a			dec a
$12:e186  f0 0f		 beq $e197
$12:e188  fc 02 27	  jsr ($2702,x)
$12:e18b  97 a0		 sta [$a0],y
$12:e18d  43 21		 eor $21,s
$12:e18f  5e e8 05	  lsr $05e8,x
$12:e192  72 51		 adc ($51)
$12:e194  97 d8		 sta [$d8],y
$12:e196  ee 60 54	  inc $5460
$12:e199  5c 16 02 01   jml $010216
$12:e19d  63 cc		 adc $cc,s
$12:e19f  5c 70 50 3c   jml $3c5070
$12:e1a3  86 0e		 stx $0e
$12:e1a5  e1 00		 sbc ($00,x)
$12:e1a7  b5 40		 lda $40,x
$12:e1a9  2e ce e0	  rol $e0ce
$12:e1ac  80 60		 bra $e20e
$12:e1ae  3c f0 09	  bit $09f0,x
$12:e1b1  05 66		 ora $66
$12:e1b3  67 0c		 adc [$0c]
$12:e1b5  b9 c5 73	  lda $73c5,y
$12:e1b8  dc 09 25	  jml [$2509]
$12:e1bb  02 13		 cop #$13
$12:e1bd  06 a3		 asl $a3
$12:e1bf  02 82		 cop #$82
$12:e1c1  21 80		 and ($80,x)
$12:e1c3  a3 70		 lda $70,s
$12:e1c5  23 f8		 and $f8,s
$12:e1c7  0a			asl a
$12:e1c8  74 02		 stz $02,x
$12:e1ca  ce f4 08	  dec $08f4
$12:e1cd  04 7e		 tsb $7e
$12:e1cf  01 46		 ora ($46,x)
$12:e1d1  bb			tyx
$12:e1d2  e2 21		 sep #$21
$12:e1d4  d6 09		 dec $09,x
$12:e1d6  7c 46 71	  jmp ($7146,x)
$12:e1d9  2a			rol a
$12:e1da  da			phx
$12:e1db  c0 a7 f0	  cpy #$f0a7
$12:e1de  08			php
$12:e1df  24 0a		 bit $0a
$12:e1e1  01 10		 ora ($10,x)
$12:e1e3  bd e0 20	  lda $20e0,x
$12:e1e6  39 28 0f	  and $0f28,y
$12:e1e9  eb			xba
$12:e1ea  83 16		 sta $16,s
$12:e1ec  80 76		 bra $e264
$12:e1ee  e0 13 b8	  cpx #$b813
$12:e1f1  06 1d		 asl $1d
$12:e1f3  3a			dec a
$12:e1f4  1e fa fd	  asl $fdfa,x
$12:e1f7  d2 11		 cmp ($11)
$12:e1f9  28			plp
$12:e1fa  80 4f		 bra $e24b
$12:e1fc  e8			inx
$12:e1fd  1e ac 8d	  asl $8dac,x
$12:e200  56 01		 lsr $01,x
$12:e202  a4 ac		 ldy $ac
$12:e204  52 64		 eor ($64)
$12:e206  00 10		 brk #$10
$12:e208  c0 57 c7	  cpy #$c757
$12:e20b  e1 80		 sbc ($80,x)
$12:e20d  a4 11		 ldy $11
$12:e20f  c4 4a		 cpy $4a
$12:e211  1f e8 05 a6   ora $a605e8,x
$12:e215  2b			pld
$12:e216  1a			inc a
$12:e217  d3 46		 cmp ($46,s),y
$12:e219  27 92		 and [$92]
$12:e21b  0f b4 03 4b   ora $4b03b4
$12:e21f  4b			phk
$12:e220  e9 c2		 sbc #$c2
$12:e222  20 14 08	  jsr $0814
$12:e225  84 02		 sty $02
$12:e227  03 e2		 ora $e2,s
$12:e229  51 87		 eor ($87),y
$12:e22b  0e 31 01	  asl $0131
$12:e22e  8d 0b 80	  sta $800b
$12:e231  96 35		 stx $35,y
$12:e233  a4 e8		 ldy $e8
$12:e235  00 00		 brk #$00
$12:e237  20 80 3b	  jsr $3b80
$12:e23a  fd fd 9e	  sbc $9efd,x
$12:e23d  ec be 2a	  cpx $2abe
$12:e240  ab			plb
$12:e241  bd bb 44	  lda $44bb,x
$12:e244  b7 b6		 lda [$b6],y
$12:e246  6e 9e be	  ror $be9e
$12:e249  f5 d6		 sbc $d6,x
$12:e24b  d6 ff		 dec $ff,x
$12:e24d  fa			plx
$12:e24e  9f fc 37 7e   sta $7e37fc,x
$12:e252  41 ff		 eor ($ff,x)
$12:e254  80 6f		 bra $e2c5
$12:e256  e8			inx
$12:e257  1f 78 40 8c   ora $8c4078,x
$12:e25b  3f f8 40 e8   and $e840f8,x
$12:e25f  c2 b5		 rep #$b5
$12:e261  b5 7d		 lda $7d,x
$12:e263  df 5e 6f 6d   cmp $6d6f5e,x
$12:e267  ca			dex
$12:e268  f7 ed		 sbc [$ed],y
$12:e26a  bb			tyx
$12:e26b  bf de ba a7   lda $a7bade,x
$12:e26f  fe 14 8c	  inc $8c14,x
$12:e272  17 ff		 ora [$ff],y
$12:e274  03 bf		 ora $bf,s
$12:e276  e0 7b f3	  cpx #$f37b
$12:e279  1f fc 07 ff   ora $ff07fc,x
$12:e27d  02 ff		 cop #$ff
$12:e27f  d4 b9		 pei ($b9)
$12:e281  72 fd		 adc ($fd)
$12:e283  9d ea 7f	  sta $7fea,x
$12:e286  fd b7 7b	  sbc $7bb7,x
$12:e289  7b			tdc
$12:e28a  7f eb ff f7   adc $f7ffeb,x
$12:e28e  bd dd ff	  lda $ffdd,x
$12:e291  ff a2 04 10   sbc $1004a2,x
$12:e295  ff 40 ff 91   sbc $91ff40,x
$12:e299  3f e4 0c c4   and $c40ce4,x
$12:e29d  32 3f		 and ($3f)
$12:e29f  e4 07		 cpx $07
$12:e2a1  fd fb fd	  sbc $fdfb,x
$12:e2a4  ef f7 f7 7f   sbc $7ff7f7
$12:e2a8  fc 5f ef	  jsr ($ef5f,x)
$12:e2ab  af bf c7 7f   lda $7fc7bf
$12:e2af  b9 7a ff	  lda $ff7a,y
$12:e2b2  7a			ply
$12:e2b3  7f 04 ff d0   adc $d0ff04,x
$12:e2b7  05 22		 ora $22
$12:e2b9  28			plp
$12:e2ba  22 60 08 87   jsl $870860
$12:e2be  fe 8e 1e	  inc $1e8e,x
$12:e2c1  ff 7f f7 af   sbc $aff77f,x
$12:e2c5  bb			tyx
$12:e2c6  f5 ff		 sbc $ff,x
$12:e2c8  fe bc ef	  inc $efbc,x
$12:e2cb  df bf ff fb   cmp $fbffbf,x
$12:e2cf  a4 07		 ldy $07
$12:e2d1  ff db ff c1   sbc $c1ffdb,x
$12:e2d5  ff e9 70 c0   sbc $c070e9,x
$12:e2d9  a9 85 3c	  lda #$3c85
$12:e2dc  28			plp
$12:e2dd  e0 fd a4	  cpx #$a4fd
$12:e2e0  47 56		 eor [$56]
$12:e2e2  a2 0f df	  ldx #$df0f
$12:e2e5  d7 eb		 cmp [$eb],y
$12:e2e7  ae 5c 82	  ldx $825c
$12:e2ea  c0 ff f8	  cpy #$f8ff
$12:e2ed  b5 10		 lda $10,x
$12:e2ef  fc 7f fa	  jsr ($fa7f,x)
$12:e2f2  06 40		 asl $40
$12:e2f4  fd f9 7f	  sbc $7ff9,x
$12:e2f7  b9 27 d7	  lda $d727,y
$12:e2fa  17 eb		 ora [$eb],y
$12:e2fc  fe b3 c3	  inc $c3b3,x
$12:e2ff  9f b4 ff d2   sta $d2ffb4,x
$12:e303  7c fd fe	  jmp ($fefd,x)
$12:e306  1a			inc a
$12:e307  28			plp
$12:e308  55 21		 eor $21,x
$12:e30a  e1 ff		 sbc ($ff,x)
$12:e30c  b7 c0		 lda [$c0],y
$12:e30e  58			cli
$12:e30f  14 9f		 trb $9f
$12:e311  ff 1d 1c 10   sbc $101c1d,x
$12:e315  0e 3c 02	  asl $023c
$12:e318  79 00 f1	  adc $f100,y
$12:e31b  c0 21 d0	  cpy #$d021
$12:e31e  0e 0c 02	  asl $020c
$12:e321  e6 0d		 inc $0d
$12:e323  07 e0		 ora [$e0]
$12:e325  0a			asl a
$12:e326  45 ff		 eor $ff
$12:e328  5c 0e 04 3a   jml $3a040e
$12:e32c  1d f1 f8	  ora $f8f1,x
$12:e32f  c1 e0		 cmp ($e0,x)
$12:e331  e0 f0 fc	  cpx #$fcf0
$12:e334  7e 27 f3	  ror $f327,x
$12:e337  f7 70		 sbc [$70],y
$12:e339  70 27		 bvs $e362
$12:e33b  e1 21		 sbc ($21,x)
$12:e33d  87 41		 sta [$41]
$12:e33f  ff 01 f0 fc   sbc $fcf001,x
$12:e343  41 e7		 eor ($e7,x)
$12:e345  fc 04 10	  jsr ($1004,x)
$12:e348  4e 67 3e	  lsr $3e67
$12:e34b  7f fc e3 ff   adc $ffe3fc,x
$12:e34f  4f 41 0f 8e   eor $8e0f41
$12:e353  38			sec
$12:e354  82 11 70	  brl $5368
$12:e357  71 87		 adc ($87),y
$12:e359  64 43		 stz $43
$12:e35b  f2 a7		 sbc ($a7)
$12:e35d  97 58		 sta [$58],y
$12:e35f  dd c5 df	  cmp $dfc5,x
$12:e362  47 7a		 eor [$7a]
$12:e364  77 37		 adc [$37],y
$12:e366  39 85 7a	  and $7a85,y
$12:e369  e6 77		 inc $77
$12:e36b  79 7c de	  adc $de7c,y
$12:e36e  9f b7 b7 b3   sta $b3b7b7,x
$12:e372  c0 17 eb	  cpy #$eb17
$12:e375  01 b0		 ora ($b0,x)
$12:e377  c0 68 30	  cpy #$3068
$12:e37a  16 60		 asl $60,x
$12:e37c  76 ff		 ror $ff,x
$12:e37e  6e e0 df	  ror $dfe0
$12:e381  ef da 03 ff   sbc $ff03da
$12:e385  be ff 7b	  ldx $7bff,y
$12:e388  fd ff f7	  sbc $f7ff,x
$12:e38b  fe 08 3b	  inc $3b08,x
$12:e38e  1a			inc a
$12:e38f  02 74		 cop #$74
$12:e391  e0 5f f9	  cpx #$f95f
$12:e394  00 ec		 brk #$ec
$12:e396  7f 30 0a 32   adc $320a30,x
$12:e39a  bc 2c e3	  ldy $e32c,x
$12:e39d  90 ce		 bcc $e36d
$12:e39f  df af df fc   cmp $fcdfaf,x
$12:e3a3  46 3f		 lsr $3f
$12:e3a5  ef ff 83 41   sbc $4183ff
$12:e3a9  8d d1 70	  sta $70d1
$12:e3ac  37 0e		 and [$0e],y
$12:e3ae  06 01		 asl $01
$12:e3b0  4f c0 4b 3b   eor $3b4bc0
$12:e3b4  fd c9 fe	  sbc $fec9,x
$12:e3b7  06 fd		 asl $fd
$12:e3b9  66 ff		 ror $ff
$12:e3bb  fe 3f ef	  inc $ef3f,x
$12:e3be  d0 7c		 bne $e43c
$12:e3c0  04 c2		 tsb $c2
$12:e3c2  60			rts
$12:e3c3  6e a8 7f	  ror $7fa8
$12:e3c6  fe 7f ff	  inc $ff7f,x
$12:e3c9  e3 f1		 sbc $f1,s
$12:e3cb  ec 16 0e	  cpx $0e16
$12:e3ce  87 43		 sta [$43]
$12:e3d0  fd fe 8f	  sbc $8ffe,x
$12:e3d3  9a			txs
$12:e3d4  d6 71		 dec $71,x
$12:e3d6  00 cf		 brk #$cf
$12:e3d8  c0 25 f0	  cpy #$f025
$12:e3db  08			php
$12:e3dc  09 b8 c3	  ora #$c3b8
$12:e3df  61 47		 adc ($47,x)
$12:e3e1  a3 e8		 lda $e8,s
$12:e3e3  74 20		 stz $20,x
$12:e3e5  90 81		 bcc $e368
$12:e3e7  c0 e1 90	  cpy #$90e1
$12:e3ea  ff 9f fe 39   sbc $39fe9f,x
$12:e3ee  fc 04 86	  jsr ($8604,x)
$12:e3f1  e2 01		 sep #$01
$12:e3f3  5e 56 09	  lsr $0956,x
$12:e3f6  78			sei
$12:e3f7  3e 04 a1	  rol $a104,x
$12:e3fa  81 c0		 sta ($c0,x)
$12:e3fc  06 21		 asl $21
$12:e3fe  f0 f8		 beq $e3f8
$12:e400  70 38		 bvs $e43a
$12:e402  19 ef f4	  ora $f4ef,y
$12:e405  13 f9		 ora ($f9,s),y
$12:e407  78			sei
$12:e408  fc 60 30	  jsr ($3060,x)
$12:e40b  02 b3		 cop #$b3
$12:e40d  37 01		 and [$01],y
$12:e40f  20 4d a1	  jsr $a14d
$12:e412  07 80		 ora [$80]
$12:e414  5f d5 83 c0   eor $c083d5,x
$12:e418  ff df d1 60   sbc $60d1df,x
$12:e41c  56 18		 lsr $18,x
$12:e41e  6c 3e 61	  jmp ($613e)
$12:e421  3f 84 43 e0   and $e04384,x
$12:e425  46 d0		 lsr $d0
$12:e427  80 1f		 bra $e448
$12:e429  00 ca		 brk #$ca
$12:e42b  9c 03 40	  stz $4003
$12:e42e  97 85		 sta [$85],y
$12:e430  c8			iny
$12:e431  6a			ror a
$12:e432  f8			sed
$12:e433  58			cli
$12:e434  6a			ror a
$12:e435  b8			clv
$12:e436  68			pla
$12:e437  9f f8 8f ff   sta $ff8ff8,x
$12:e43b  55 ff		 eor $ff,x
$12:e43d  aa			tax
$12:e43e  ff fd df fd   sbc $fddffd,x
$12:e442  da			phx
$12:e443  f8			sed
$12:e444  17 de		 ora [$de],y
$12:e446  dc 27 7d	  jml [$7d27]
$12:e449  b8			clv
$12:e44a  3f bb dd fb   and $fbddbb,x
$12:e44e  fd f5 5a	  sbc $5af5,x
$12:e451  aa			tax
$12:e452  ad 57 11	  lda $1157
$12:e455  88			dey
$12:e456  91 48		 sta ($48),y
$12:e458  95 c5		 sta $c5,x
$12:e45a  dd 91 7d	  cmp $7d91,x
$12:e45d  e1 01		 sbc ($01,x)
$12:e45f  61 d5		 adc ($d5,x)
$12:e461  62 2e f2	  per $d692
$12:e464  2e eb 30	  rol $30eb
$12:e467  8f e0 1c 18   sta $181ce0
$12:e46b  06 22		 asl $22
$12:e46d  01 55		 ora ($55,x)
$12:e46f  80 6a		 bra $e4db
$12:e471  99 86 3f	  sta $3f86,y
$12:e474  f2 64		 sbc ($64)
$12:e476  c6 3c		 dec $3c
$12:e478  ee fc f0	  inc $f0fc
$12:e47b  78			sei
$12:e47c  3b			tsc
$12:e47d  7b			tdc
$12:e47e  73 79		 adc ($79,s),y
$12:e480  fd ff 67	  sbc $67ff,x
$12:e483  65 80		 adc $80
$12:e485  9f c7 03 81   sta $8103c7,x
$12:e489  e0 f0 7c	  cpx #$7cf0
$12:e48c  28			plp
$12:e48d  71 f8		 adc ($f8),y
$12:e48f  a2 c6 cf	  ldx #$cfc6
$12:e492  98			tya
$12:e493  ec c9 b5	  cpx $b5c9
$12:e496  f5 5a		 sbc $5a,x
$12:e498  de d2 8f	  dec $8fd2,x
$12:e49b  98			tya
$12:e49c  d3 25		 cmp ($25,s),y
$12:e49e  42 1f		 wdm #$1f
$12:e4a0  f3 ba		 sbc ($ba,s),y
$12:e4a2  60			rts
$12:e4a3  30 f0		 bmi $e495
$12:e4a5  08			php
$12:e4a6  fc 02 7f	  jsr ($7f02,x)
$12:e4a9  00 bf		 brk #$bf
$12:e4ab  c8			iny
$12:e4ac  2f ec f0 a0   and $a0f0ec
$12:e4b0  7f e1 1f ff   adc $ff1fe1,x
$12:e4b4  34 67		 bit $67,x
$12:e4b6  77 c4		 adc [$c4],y
$12:e4b8  fe c4 ba	  inc $bac4,x
$12:e4bb  d2 9b		 cmp ($9b)
$12:e4bd  d6 17		 dec $17,x
$12:e4bf  57 54		 eor [$54],y
$12:e4c1  fa			plx
$12:e4c2  c2 be		 rep #$be
$12:e4c4  f0 a8		 beq $e46e
$12:e4c6  0f 86 01 f8   ora $f80186
$12:e4ca  80 7f		 bra $e54b
$12:e4cc  20 1f e6	  jsr $e61f
$12:e4cf  28			plp
$12:e4d0  ba			tsx
$12:e4d1  d0 01		 bne $e4d4
$12:e4d3  ad ee 9c	  lda $9cee
$12:e4d6  4f e1 b0 e8   eor $e8b0e1
$12:e4da  dc 73 69	  jml [$6973]
$12:e4dd  cc 98 4c	  cpy $4c98
$12:e4e0  20 30 11	  jsr $1130
$12:e4e3  80 75		 bra $e55a
$12:e4e5  3d 9c 08	  and $089c,x
$12:e4e8  07 c2		 ora [$c2]
$12:e4ea  01 e0		 ora ($e0,x)
$12:e4ec  80 40		 bra $e52e
$12:e4ee  e0 1c f6	  cpx #$f61c
$12:e4f1  39 81 40	  and $4081,y
$12:e4f4  da			phx
$12:e4f5  14 0e		 trb $0e
$12:e4f7  07 4e		 ora [$4e]
$12:e4f9  67 a6		 adc [$a6]
$12:e4fb  ef d5 2d 96   sbc $962dd5
$12:e4ff  8c c5 fe	  sty $fec5
$12:e502  ff 3c 9e 28   sbc $289e3c,x
$12:e506  8a			txa
$12:e507  18			clc
$12:e508  eb			xba
$12:e509  1c 1c 02	  trb $021c
$12:e50c  0f 00 c0 40   ora $40c000
$12:e510  38			sec
$12:e511  70 09		 bvs $e51c
$12:e513  e4 fd		 cpx $fd
$12:e515  f2 4e		 sbc ($4e)
$12:e517  b0 81		 bcs $e49a
$12:e519  c0 c3 61	  cpy #$61c3
$12:e51c  18			clc
$12:e51d  8f c1 e0 ef   sta $efe0c1
$12:e521  f0 64		 beq $e587
$12:e523  23 10		 and $10,s
$12:e525  05 60		 ora $60
$12:e527  03 06		 ora $06,s
$12:e529  10 4e		 bpl $e579
$12:e52b  3f 1c ff fc   and $fcff1c,x
$12:e52f  c6 7f		 dec $7f
$12:e531  0c 87 fe	  tsb $fe87
$12:e534  ff f0 df ec   sbc $ecdff0,x
$12:e538  ff ff c3 e1   sbc $e1c3ff,x
$12:e53c  8a			txa
$12:e53d  41 d6		 eor ($d6,x)
$12:e53f  0f f2 75 84   ora $8475f2
$12:e543  09 d6 33	  ora #$33d6
$12:e546  c8			iny
$12:e547  04 d2		 tsb $d2
$12:e549  69 9a cd	  adc #$cd9a
$12:e54c  15 c2		 ora $c2,x
$12:e54e  c9 fc cc	  cmp #$ccfc
$12:e551  66 1d		 ror $1d
$12:e553  60			rts
$12:e554  8c 0c 7f	  sty $7f0c
$12:e557  ff 97 00 b2   sbc $b20097,x
$12:e55b  8d 0a 01	  sta $010a
$12:e55e  67 6d		 adc [$6d]
$12:e560  0c 39 d4	  tsb $d439
$12:e563  78			sei
$12:e564  0c 06 33	  tsb $3306
$12:e567  f9 50 b8	  sbc $b850,y
$12:e56a  3a			dec a
$12:e56b  cb			wai
$12:e56c  e1 f0		 sbc ($f0,x)
$12:e56e  f2 7f		 sbc ($7f)
$12:e570  11 21		 ora ($21),y
$12:e572  7f 02 0e 3d   adc $3d0e02,x
$12:e576  b4 70		 ldy $70,x
$12:e578  f0 20		 beq $e59a
$12:e57a  a2 43 dd	  ldx #$dd43
$12:e57d  11 dd		 ora ($dd),y
$12:e57f  d1 2a		 cmp ($2a),y
$12:e581  ba			tsx
$12:e582  ad 55 56	  lda $5655
$12:e585  23 ee		 and $ee,s
$12:e587  a2 6e da	  ldx #$da6e
$12:e58a  1a			inc a
$12:e58b  43 1d		 eor $1d,s
$12:e58d  57 ff		 eor [$ff],y
$12:e58f  bb			tyx
$12:e590  ff bb ff da   sbc $daffbb,x
$12:e594  80 eb		 bra $e581
$12:e596  06 a9		 asl $a9
$12:e598  0c c5 7c	  tsb $7cc5
$12:e59b  ad 51 6a	  lda $6a51
$12:e59e  0b			phd
$12:e59f  50 bf		 bvc $e560
$12:e5a1  90 3b		 bcc $e5de
$12:e5a3  0e 7a 0f	  asl $0f7a
$12:e5a6  f8			sed
$12:e5a7  cc 59 f8	  cpy $f859
$12:e5aa  02 10		 cop #$10
$12:e5ac  21 90		 and ($90,x)
$12:e5ae  d8			cld
$12:e5af  73 d9		 adc ($d9,s),y
$12:e5b1  ef c7 e2 cf   sbc $cfe2c7
$12:e5b5  67 9f		 adc [$9f]
$12:e5b7  96 c1		 stx $c1,y
$12:e5b9  d8			cld
$12:e5ba  77 fc		 adc [$fc],y
$12:e5bc  06 72		 asl $72
$12:e5be  c6 89		 dec $89
$12:e5c0  0b			phd
$12:e5c1  8e 39 ea	  stx $ea39
$12:e5c4  11 cf		 ora ($cf),y
$12:e5c6  1b			tcs
$12:e5c7  f4 92 21	  pea $2192
$12:e5ca  63 b1		 adc $b1,s
$12:e5cc  b6 c3		 ldx $c3,y
$12:e5ce  1d 8e 02	  ora $028e,x
$12:e5d1  87 8f		 sta [$8f]
$12:e5d3  c6 d4		 dec $d4
$12:e5d5  0d f8 bb	  ora $bbf8
$12:e5d8  41 20		 eor ($20,x)
$12:e5da  3f c5 e9 40   and $40e9c5,x
$12:e5de  7f c5 30 81   adc $8130c5,x
$12:e5e2  ff 20 5f d2   sbc $d25f20,x
$12:e5e6  c9 3a 8b	  cmp #$8b3a
$12:e5e9  fc 63 1f	  jsr ($1f63,x)
$12:e5ec  e1 9d		 sbc ($9d,x)
$12:e5ee  7f 7f f3 79   adc $79f37f,x
$12:e5f2  3a			dec a
$12:e5f3  88			dey
$12:e5f4  de 3f d3	  dec $d33f,x
$12:e5f7  d8			cld
$12:e5f8  7e 4f e7	  ror $e74f,x
$12:e5fb  fd 42 89	  sbc $8942,x
$12:e5fe  fc be 3f	  jsr ($3fbe,x)
$12:e601  1d 5c b3	  ora $b35c,x
$12:e604  0d 1b e4	  ora $e41b
$12:e607  d3 a3		 cmp ($a3,s),y
$12:e609  3d 6b 5e	  and $5e6b,x
$12:e60c  bf 6f 54 ea   lda $ea546f,x
$12:e610  4b			phk
$12:e611  2c f9 8a	  bit $8af9
$12:e614  87 fe		 sta [$fe]
$12:e616  c1 ff		 cmp ($ff,x)
$12:e618  98			tya
$12:e619  7f e4 17 f8   adc $f817e4,x
$12:e61d  85 fe		 sta $fe
$12:e61f  11 3f		 ora ($3f),y
$12:e621  81 c7		 sta ($c7,x)
$12:e623  f0 18		 beq $e63d
$12:e625  7e ec 8a	  ror $8aec,x
$12:e628  1f f2 dc dd   ora $dddcf2,x
$12:e62c  b6 df		 ldx $df,y
$12:e62e  dd 55 76	  cmp $7655,x
$12:e631  8b			phb
$12:e632  ba			tsx
$12:e633  cd f9 3c	  cmp $3cf9
$12:e636  d1 96		 cmp ($96),y
$12:e638  fa			plx
$12:e639  ff 98 a3 fc   sbc $fca398,x
$12:e63d  80 7e		 bra $e6bd
$12:e63f  20 3e 15	  jsr $153e
$12:e642  fa			plx
$12:e643  b4 21		 ldy $21,x
$12:e645  bf b1 38 fc   lda $fc38b1,x
$12:e649  82 7f 0d	  brl $f3cb
$12:e64c  87 c1		 sta [$c1]
$12:e64e  a0 d3 89	  ldy #$89d3
$12:e651  fc 7e 3f	  jsr ($3f7e,x)
$12:e654  c0 ff cf	  cpy #$cfff
$12:e657  38			sec
$12:e658  7e 08 07	  ror $0708,x
$12:e65b  02 01		 cop #$01
$12:e65d  f0 80		 beq $e5df
$12:e65f  7e 40 02	  ror $0240,x
$12:e662  ff 06 f9 78   sbc $78f906,x
$12:e666  3f f0 cf e6   and $e6cff0,x
$12:e66a  03 00		 ora $00,s
$12:e66c  ec 00 98	  cpx $9800
$12:e66f  7e 3f 10	  ror $103f,x
$12:e672  7f ff b3 e7   adc $e7b3ff,x
$12:e676  00 80		 brk #$80
$12:e678  40			rti
$12:e679  e0 17 f8	  cpx #$f817
$12:e67c  03 78		 ora $78,s
$12:e67e  04 61		 tsb $61
$12:e680  07 0f		 ora [$0f]
$12:e682  80 a8		 bra $e62c
$12:e684  65 92		 adc $92
$12:e686  f8			sed
$12:e687  d4 56		 pei ($56)
$12:e689  79 e3 b2	  adc $b2e3,y
$12:e68c  c7 f1		 cmp [$f1]
$12:e68e  f6 fd		 inc $fd,x
$12:e690  95 ca		 sta $ca,x
$12:e692  7f bf f5 fb   adc $fbf5bf,x
$12:e696  e5 fd		 sbc $fd
$12:e698  08			php
$12:e699  87 bf		 sta [$bf]
$12:e69b  c1 1f		 cmp ($1f,x)
$12:e69d  12 04		 ora ($04)
$12:e69f  43 ff		 eor $ff,s
$12:e6a1  0d ff d0	  ora $d0ff
$12:e6a4  08			php
$12:e6a5  c3 60		 cmp $60,s
$12:e6a7  f0 5e		 beq $e707
$12:e6a9  f3 5d		 sbc ($5d,s),y
$12:e6ab  2f 6d 8f ff   and $ff8f6d
$12:e6af  de ff 7c	  dec $7cff,x
$12:e6b2  ce 63 66	  dec $6663
$12:e6b5  b3 90		 lda ($90,s),y
$12:e6b7  c2 35		 rep #$35
$12:e6b9  e5 84		 sbc $84
$12:e6bb  7d c4 81	  adc $81c4,x
$12:e6be  01 ff		 ora ($ff,x)
$12:e6c0  c1 1b		 cmp ($1b,x)
$12:e6c2  c1 ff		 cmp ($ff,x)
$12:e6c4  cc 7f f9	  cpy $f97f
$12:e6c7  9c ff 84	  stz $84ff
$12:e6ca  42 11		 wdm #$11
$12:e6cc  f0 2d		 beq $e6fb
$12:e6ce  05 f2		 ora $f2
$12:e6d0  ff 26 d3 fe   sbc $fed326,x
$12:e6d4  bf fb ff ff   lda $fffffb,x
$12:e6d8  3e 60 41	  rol $4160,x
$12:e6db  01 20		 ora ($20,x)
$12:e6dd  40			rti
$12:e6de  ff 98 1f f5   sbc $f51f98,x
$12:e6e2  60			rts
$12:e6e3  d4 22		 pei ($22)
$12:e6e5  40			rti
$12:e6e6  45 1a		 eor $1a
$12:e6e8  40			rti
$12:e6e9  f3 f6		 sbc ($f6,s),y
$12:e6eb  0b			phd
$12:e6ec  3f e3 17 8c   and $8c17e3,x
$12:e6f0  15 1a		 ora $1a,x
$12:e6f2  7d ee 10	  adc $10ee,x
$12:e6f5  0d 1d 73	  ora $731d
$12:e6f8  ab			plb
$12:e6f9  2a			rol a
$12:e6fa  57 87		 eor [$87],y
$12:e6fc  ae 29 f7	  ldx $f729
$12:e6ff  84 76		 sty $76
$12:e701  e4 8d		 cpx $8d
$12:e703  e0 5b 82	  cpx #$825b
$12:e706  7f 03 e1 c7   adc $c7e103,x
$12:e70a  9c 66 ef	  stz $ef66
$12:e70d  91 9f		 sta ($9f),y
$12:e70f  f4 b7 f5	  pea $f5b7
$12:e712  11 ff		 ora ($ff),y
$12:e714  6a			ror a
$12:e715  ea			nop
$12:e716  9c 39 e6	  stz $e639
$12:e719  9e b0 bf	  stz $bfb0,x
$12:e71c  e8			inx
$12:e71d  77 c6		 adc [$c6],y
$12:e71f  1f f0 8f f8   ora $f88ff0,x
$12:e723  13 21		 ora ($21,s),y
$12:e725  bf a0 3d c1   lda $c13da0,x
$12:e729  1e 5f 1f	  asl $1f5f,x
$12:e72c  8f c3 e1 e0   sta $e0e1c3
$12:e730  f0 58		 beq $e78a
$12:e732  2c 14 00	  bit $0014
$12:e735  38			sec
$12:e736  8a			txa
$12:e737  8d 1e 68	  sta $681e
$12:e73a  50 83		 bvc $e6bf
$12:e73c  fe e1 7f	  inc $7fe1,x
$12:e73f  78			sei
$12:e740  4f de 2f ef   eor $ef2fde
$12:e744  2d 80 7c	  and $7c80
$12:e747  bf 9f cf c7   lda $c7cf9f,x
$12:e74b  e0 02 00	  cpx #$0002
$12:e74e  12 48		 ora ($48)
$12:e750  36 02		 rol $02,x
$12:e752  ff 80 ff f0   sbc $f0ff80,x
$12:e756  37 e3		 and [$e3],y
$12:e758  b0 0f		 bcs $e769
$12:e75a  a1 6c		 lda ($6c,x)
$12:e75c  2f e4 71 9f   and $9f71e4
$12:e760  92 c5		 sta ($c5)
$12:e762  1a			inc a
$12:e763  17 01		 ora [$01],y
$12:e765  20 7f f7	  jsr $f77f
$12:e768  df fa f1 50   cmp $50f1fa,x
$12:e76c  63 df		 adc $df,s
$12:e76e  f9 e2 3c	  sbc $3ce2,y
$12:e771  17 fc		 ora [$fc],y
$12:e773  8f 18 0f fe   sta $fe0f18
$12:e777  0f ff 86 ff   ora $ff86ff
$12:e77b  e1 47		 sbc ($47,x)
$12:e77d  21 82		 and ($82,x)
$12:e77f  17 be		 ora [$be],y
$12:e781  5d ff 8f	  eor $8fff,x
$12:e784  ff fa ff ff   sbc $fffffa,x
$12:e788  5f ff cf ff   eor $ffcfff,x
$12:e78c  d2 ff		 cmp ($ff)
$12:e78e  e9 3f fc	  sbc #$fc3f
$12:e791  11 fb		 ora ($fb),y
$12:e793  c2 25		 rep #$25
$12:e795  06 fc		 asl $fc
$12:e797  c6 7c		 dec $7c
$12:e799  d2 6e		 cmp ($6e)
$12:e79b  fc bf bf	  jsr ($bfbf,x)
$12:e79e  4f df ef ef   eor $efefdf
$12:e7a2  e4 41		 cpx $41
$12:e7a4  ff fe 7f 20   sbc $207ffe,x
$12:e7a8  30 e0		 bmi $e78a
$12:e7aa  31 c7		 and ($c7),y
$12:e7ac  01 80		 ora ($80,x)
$12:e7ae  46 84		 lsr $84
$12:e7b0  63 cf		 adc $cf,s
$12:e7b2  24 ed		 bit $ed
$12:e7b4  d6 b7		 dec $b7,x
$12:e7b6  bb			tyx
$12:e7b7  db			stp
$12:e7b8  f3 54		 sbc ($54,s),y
$12:e7ba  2f 9f ff 97   and $97ff9f
$12:e7be  f7 49		 sbc [$49],y
$12:e7c0  fb			xce
$12:e7c1  f3 f9		 sbc ($f9,s),y
$12:e7c3  f8			sed
$12:e7c4  7c 3c 0e	  jmp ($0e3c,x)
$12:e7c7  05 12		 ora $12
$12:e7c9  50 17		 bvc $e7e2
$12:e7cb  48			pha
$12:e7cc  c0 e0 7b	  cpy #$7be0
$12:e7cf  9c c3 bf	  stz $bfc3
$12:e7d2  2c f0 07	  bit $07f0
$12:e7d5  fe 6c 6e	  inc $6e6c,x
$12:e7d8  60			rts
$12:e7d9  fc f9 c3	  jsr ($c3f9,x)
$12:e7dc  03 f9		 ora $f9,s
$12:e7de  18			clc
$12:e7df  9c 0b f2	  stz $f20b
$12:e7e2  71 c7		 adc ($c7),y
$12:e7e4  1f e3 2c 25   ora $252ce3,x
$12:e7e8  33 98		 and ($98,s),y
$12:e7ea  64 3e		 stz $3e
$12:e7ec  2d 19 c4	  and $c419
$12:e7ef  fd ab 9b	  sbc $9bab,x
$12:e7f2  d6 f8		 dec $f8,x
$12:e7f4  4b			phk
$12:e7f5  a7 f8		 lda [$f8]
$12:e7f7  0b			phd
$12:e7f8  fc e7 8d	  jsr ($8de7,x)
$12:e7fb  0f f8 33 c3   ora $c333f8
$12:e7ff  c1 1f		 cmp ($1f,x)
$12:e801  81 7f		 sta ($7f,x)
$12:e803  e3 1f		 sbc $1f,s
$12:e805  fe 07 fd	  inc $fd07,x
$12:e808  c6 12		 dec $12
$12:e80a  09 04 32	  ora #$3204
$12:e80d  19 83 c1	  ora $c183,y
$12:e810  d1 6f		 cmp ($6f),y
$12:e812  d1 98		 cmp ($98),y
$12:e814  2d 9f 2f	  and $2f9f
$12:e817  aa			tax
$12:e818  9b			txy
$12:e819  e0 6f d2	  cpx #$d26f
$12:e81c  0e f8 80	  asl $80f8
$12:e81f  30 77		 bmi $e898
$12:e821  cb			wai
$12:e822  e6 0c		 inc $0c
$12:e824  d2 18		 cmp ($18)
$12:e826  8b			phb
$12:e827  fd 03 ff	  sbc $ff03,x
$12:e82a  35 9b		 and $9b,x
$12:e82c  6b			rtl
$12:e82d  b7 fd		 lda [$fd],y
$12:e82f  7e fd cf	  ror $cffd,x
$12:e832  ff 23 ff c4   sbc $c4ff23,x
$12:e836  7f f2 25 80   adc $8025f2,x
$12:e83a  f2 20		 sbc ($20)
$12:e83c  14 08		 trb $08
$12:e83e  04 81		 tsb $81
$12:e840  ca			dex
$12:e841  4a			lsr a
$12:e842  45 4e		 eor $4e
$12:e844  0c 02 7f	  tsb $7f02
$12:e847  c0 c7 fc	  cpy #$fcc7
$12:e84a  32 ff		 and ($ff)
$12:e84c  8a			txa
$12:e84d  5f f3 3b fe   eor $fe3bf3,x
$12:e851  a6 ff		 ldx $ff
$12:e853  94 92		 sty $92,x
$12:e855  a4 3b		 ldy $3b
$12:e857  f7 fe		 sbc [$fe],y
$12:e859  ad ff 92	  lda $92ff
$12:e85c  7f e9 49 c1   adc $c149e9,x
$12:e860  82 2b c9	  brl $b18e
$12:e863  38			sec
$12:e864  0b			phd
$12:e865  fd bc 7f	  sbc $7fbc,x
$12:e868  ff 8f 01 68   sbc $68018f,x
$12:e86c  84 ab		 sty $ab
$12:e86e  ff 07 ff cf   sbc $cfff07,x
$12:e872  ff f7 f6 f7   sbc $f7f6f7,x
$12:e876  c7 bd		 cmp [$bd]
$12:e878  f1 bf		 sbc ($bf),y
$12:e87a  7c 97 bf	  jmp ($bf97,x)
$12:e87d  28			plp
$12:e87e  ef a0 42 89   sbc $8942a0
$12:e882  bf a0 06 87   lda $8706a0,x
$12:e886  c0 1f 1e	  cpy #$1e1f
$12:e889  00 8c		 brk #$8c
$12:e88b  c9 e0 29	  cmp #$29e0
$12:e88e  2d 07 7f	  and $7f07
$12:e891  c1 df		 cmp ($df,x)
$12:e893  b7 f4		 lda [$f4],y
$12:e895  36 dc		 rol $dc,x
$12:e897  fb			xce
$12:e898  3f 7f 1f ff   and $ff1f7f,x
$12:e89c  97 7f		 sta [$7f],y
$12:e89e  ea			nop
$12:e89f  9f f8 f8 fc   sta $fcf8f8,x
$12:e8a3  62 11 05	  per $edb7
$12:e8a6  26 40		 rol $40
$12:e8a8  7f de 28 ec   adc $ec28de,x
$12:e8ac  53 d7		 eor ($d7,s),y
$12:e8ae  0a			asl a
$12:e8af  fb			xce
$12:e8b0  d2 36		 cmp ($36)
$12:e8b2  fb			xce
$12:e8b3  ca			dex
$12:e8b4  1f fc be 3f   ora $3fbefc,x
$12:e8b8  ef f4 72 39   sbc $3972f4
$12:e8bc  08			php
$12:e8bd  84 2a		 sty $2a
$12:e8bf  23 e1		 and $e1,s
$12:e8c1  0f 9a 7e f7   ora $f77e9a
$12:e8c5  7f ca 4f fb   adc $fb4fca,x
$12:e8c9  23 fe		 and $fe,s
$12:e8cb  83 fe		 sta $fe,s
$12:e8cd  0b			phd
$12:e8ce  e5 0f		 sbc $0f
$12:e8d0  87 c0		 sta [$c0]
$12:e8d2  e0 6a 6b	  cpx #$6b6a
$12:e8d5  48			pha
$12:e8d6  1f 02 7f e0   ora $e07f02,x
$12:e8da  8f 9c c0 be   sta $bec09c
$12:e8de  49 f4 9f	  eor #$9ff4
$12:e8e1  cf c7 e0 83   cmp $83e0c7
$12:e8e5  0b			phd
$12:e8e6  5f fe 2b ff   eor $ff2bfe,x
$12:e8ea  7b			tdc
$12:e8eb  84 47		 sty $47
$12:e8ed  ff 84 bf d8   sbc $d8bf84,x
$12:e8f1  33 f3		 and ($f3,s),y
$12:e8f3  fe 03 76	  inc $7603,x
$12:e8f6  85 20		 sta $20
$12:e8f8  23 04		 and $04,s
$12:e8fa  08			php
$12:e8fb  56 3c		 lsr $3c,x
$12:e8fd  f3 0e		 sbc ($0e,s),y
$12:e8ff  7c e3 ee	  jmp ($eee3,x)
$12:e902  75 08		 adc $08,x
$12:e904  27 ee		 and [$ee]
$12:e906  71 c7		 adc ($c7),y
$12:e908  4c 82 3c	  jmp $3c82
$12:e90b  20 f0 74	  jsr $74f0
$12:e90e  18			clc
$12:e90f  37 c1		 and [$c1],y
$12:e911  0a			asl a
$12:e912  08			php
$12:e913  50 6f		 bvc $e984
$12:e915  82 a4 3f	  brl $28bc
$12:e918  ff f9 8f c1   sbc $c18ff9,x
$12:e91c  df 9f 38 63   cmp $63389f,x
$12:e920  ff 23 97 c0   sbc $c09723,x
$12:e924  7e 5f 30	  ror $305f,x
$12:e927  61 fc		 adc ($fc,x)
$12:e929  cd dd 85	  cmp $85dd
$12:e92c  f8			sed
$12:e92d  c5 21		 cmp $21
$12:e92f  fd 73 e8	  sbc $e873,x
$12:e932  24 f1		 bit $f1
$12:e934  a3 f7		 lda $f7,s
$12:e936  eb			xba
$12:e937  ee d0 2b	  inc $2bd0
$12:e93a  a6 f6		 ldx $f6
$12:e93c  02 5f		 cop #$5f
$12:e93e  0d fc 1f	  ora $1ffc
$12:e941  7f 1f 2b b2   adc $b22b1f,x
$12:e945  41 3d		 eor ($3d,x)
$12:e947  f1 0e		 sbc ($0e),y
$12:e949  bc a0 ea	  ldy $eaa0,x
$12:e94c  09 07 39	  ora #$3907
$12:e94f  11 f2		 ora ($f2),y
$12:e951  7f a7 c9 3f   adc $3fc9a7,x
$12:e955  8c 0b fb	  sty $fb0b
$12:e958  07 50		 ora [$50]
$12:e95a  87 fe		 sta [$fe]
$12:e95c  41 df		 eor ($df,x)
$12:e95e  a8			tay
$12:e95f  29 c0 fe	  and #$fec0
$12:e962  18			clc
$12:e963  4f fc a3 ff   eor $ffa3fc
$12:e967  04 3f		 tsb $3f
$12:e969  8a			txa
$12:e96a  cc 8f c6	  cpy $c68f
$12:e96d  3f d9 c7 1e   and $1ec7d9,x
$12:e971  89 bb cd	  bit #$cdbb
$12:e974  5f 5a 60 a2   eor $a2605a,x
$12:e978  08			php
$12:e979  8f fa 73 c6   sta $c673fa
$12:e97d  e7 cc		 sbc [$cc]
$12:e97f  38			sec
$12:e980  fc 7c 1e	  jsr ($1e7c,x)
$12:e983  0e 02 e3	  asl $e302
$12:e986  31 fa		 and ($fa),y
$12:e988  9e de 3d	  stz $3dde,x
$12:e98b  e1 b6		 sbc ($b6,x)
$12:e98d  e7 b3		 sbc [$b3]
$12:e98f  d7 f3		 cmp [$f3],y
$12:e991  3b			tsc
$12:e992  ff fc 3e 1c   sbc $1c3efc,x
$12:e996  06 00		 asl $00
$12:e998  7e 18 0b	  ror $0b18,x
$12:e99b  fe 12 f7	  inc $f712,x
$12:e99e  91 b7		 sta ($b7),y
$12:e9a0  66 ac		 ror $ac
$12:e9a2  bb			tyx
$12:e9a3  5a			phy
$12:e9a4  56 ee		 lsr $ee,x
$12:e9a6  88			dey
$12:e9a7  7f 00 c8 0f   adc $0fc800,x
$12:e9ab  fa			plx
$12:e9ac  55 ff		 eor $ff,x
$12:e9ae  07 84		 ora [$84]
$12:e9b0  a7 ed		 lda [$ed]
$12:e9b2  82 be 9d	  brl $8773
$12:e9b5  c2 d7		 rep #$d7
$12:e9b7  94 ef		 sty $ef,x
$12:e9b9  c8			iny
$12:e9ba  0f 20 bf e8   ora $e8bf20
$12:e9be  ff 82 df 90   sbc $90df82,x
$12:e9c2  df d0 0f 70   cmp $700fd0,x
$12:e9c6  5e e8 1f	  lsr $1fe8,x
$12:e9c9  f3 03		 sbc ($03,s),y
$12:e9cb  7e c2 de	  ror $dec2,x
$12:e9ce  b9 73 41	  lda $4173,y
$12:e9d1  b8			clv
$12:e9d2  7a			ply
$12:e9d3  e2 83		 sep #$83
$12:e9d5  b0 fb		 bcs $e9d2
$12:e9d7  c2 0b		 rep #$0b
$12:e9d9  dd fc 81	  cmp $81fc,x
$12:e9dc  86 c3		 stx $c3
$12:e9de  a3 32		 lda $32,s
$12:e9e0  d9 5c eb	  cmp $eb5c,y
$12:e9e3  dd fa a7	  cmp $a7fa,x
$12:e9e6  fe 53 fe	  inc $fe53,x
$12:e9e9  c3 de		 cmp $de,s
$12:e9eb  20 70 37	  jsr $3770
$12:e9ee  48			pha
$12:e9ef  43 14		 eor $14,s
$12:e9f1  43 20		 eor $20,s
$12:e9f3  2f 31 6c 70   and $706c31
$12:e9f7  77 cc		 adc [$cc],y
$12:e9f9  65 cf		 adc $cf
$12:e9fb  11 77		 ora ($77),y
$12:e9fd  ec c9 ba	  cpx $bac9
$12:ea00  92 bf		 sta ($bf)
$12:ea02  dc 11 fe	  jml [$fe11]
$12:ea05  57 cb		 eor [$cb],y
$12:ea07  e5 c1		 sbc $c1
$12:ea09  8a			txa
$12:ea0a  32 06		 and ($06)
$12:ea0c  48			pha
$12:ea0d  bb			tyx
$12:ea0e  49 1e 10	  eor #$101e
$12:ea11  6f c9 bc 0d   adc $0dbcc9
$12:ea15  e1 17		 sbc ($17,x)
$12:ea17  f4 6b ea	  pea $ea6b
$12:ea1a  05 b1		 ora $b1
$12:ea1c  ff a7 c2 03   sbc $03c2a7,x
$12:ea20  01 2f		 ora ($2f,x)
$12:ea22  46 e7		 lsr $e7
$12:ea24  30 ef		 bmi $ea15
$12:ea26  bc cd 9e	  ldy $9ecd,x
$12:ea29  00 ff		 brk #$ff
$12:ea2b  b8			clv
$12:ea2c  0e ff 3e	  asl $3eff
$12:ea2f  0f cb 7c 3c   ora $3c7ccb
$12:ea33  3e d7 f8	  rol $f8d7,x
$12:ea36  f8			sed
$12:ea37  a4 a7		 ldy $a7
$12:ea39  13 e1		 ora ($e1,s),y
$12:ea3b  7d 6e 37	  adc $376e,x
$12:ea3e  d3 ee		 cmp ($ee,s),y
$12:ea40  08			php
$12:ea41  fe e8 3d	  inc $3de8,x
$12:ea44  bf df ff fd   lda $fdffdf,x
$12:ea48  bf de ff bf   lda $bfffde,x
$12:ea4c  a5 10		 lda $10
$12:ea4e  bf ff 7b dd   lda $dd7bff,x
$12:ea52  d2 88		 cmp ($88)
$12:ea54  2f 82 03 fe   and $fe0382
$12:ea58  a1 b5		 lda ($b5,x)
$12:ea5a  86 07		 stx $07
$12:ea5c  fe 6b 84	  inc $846b,x
$12:ea5f  8f f8 61 0d   sta $0d61f8
$12:ea63  2d 6b dd	  and $dd6b
$12:ea66  57 9e		 eor [$9e],y
$12:ea68  f9 ff 75	  sbc $75ff,y
$12:ea6b  e8			inx
$12:ea6c  f6 af		 inc $af,x
$12:ea6e  6f 4d a5 46   adc $46a54d
$12:ea72  f6 fe		 inc $fe,x
$12:ea74  ad ec 03	  lda $03ec
$12:ea77  7b			tdc
$12:ea78  04 de		 tsb $de
$12:ea7a  c8			iny
$12:ea7b  3f f0 ad fd   and $fdadf0,x
$12:ea7f  29 ba 15	  and #$15ba
$12:ea82  bd 37 fe	  lda $fe37,x
$12:ea85  05 e4		 ora $e4
$12:ea87  8d f7 e7	  sta $e7f7
$12:ea8a  f7 df		 sbc [$df],y
$12:ea8c  ed af df	  sbc $dfaf
$12:ea8f  bf bf ee ef   lda $efeebf,x
$12:ea93  75 6e		 adc $6e,x
$12:ea95  ff b6 fd 40   sbc $40fdb6,x
$12:ea99  9f e0 2f f0   sta $f02fe0,x
$12:ea9d  2f fc 41 ba   and $ba41fc
$12:eaa1  2b			pld
$12:eaa2  e0 42 03	  cpx #$0342
$12:eaa5  78			sei
$12:eaa6  36 b5		 rol $b5,x
$12:eaa8  eb			xba
$12:eaa9  ff af fd ad   sbc $adfdaf,x
$12:eaad  d8			cld
$12:eaae  d7 b5		 cmp [$b5],y
$12:eab0  b5 9e		 lda $9e,x
$12:eab2  f6 ee		 inc $ee,x
$12:eab4  57 d5		 eor [$d5],y
$12:eab6  fb			xce
$12:eab7  73 f6		 adc ($f6,s),y
$12:eab9  b1 4d		 lda ($4d),y
$12:eabb  bc 8b ef	  ldy $ef8b,x
$12:eabe  a0 fb c4	  ldy #$c4fb
$12:eac1  3f b0 bf fc   and $fcbfb0,x
$12:eac5  23 f7		 and $f7,s
$12:eac7  00 f9		 brk #$f9
$12:eac9  e0 b7 f5	  cpx #$f5b7
$12:eacc  3f dd 5e d7   and $d75edd,x
$12:ead0  bd 9f de	  lda $de9f,x
$12:ead3  75 dd		 adc $dd,x
$12:ead5  9a			txs
$12:ead6  d6 b6		 dec $b6,x
$12:ead8  b7 ec		 lda [$ec],y
$12:eada  f7 d6		 sbc [$d6],y
$12:eadc  3f f1 36 f8   and $f836f1,x
$12:eae0  ca			dex
$12:eae1  6f fa 96 48   adc $4896fa
$12:eae5  39 c6 91	  and $91c6,y
$12:eae8  ff a0 6d af   sbc $af6da0,x
$12:eaec  f1 cf		 sbc ($cf),y
$12:eaee  fc 99 58	  jsr ($5899,x)
$12:eaf1  3a			dec a
$12:eaf2  0b			phd
$12:eaf3  fe 16 f5	  inc $f516,x
$12:eaf6  ca			dex
$12:eaf7  9a			txs
$12:eaf8  ff 60 50 07   sbc $075060,x
$12:eafc  fe c7 fc	  inc $fcc7,x
$12:eaff  16 7f		 asl $7f,x
$12:eb01  c0 44 32	  cpy #$3244
$12:eb04  f7 8a		 sbc [$8a],y
$12:eb06  7e c2 ff	  ror $ffc2,x
$12:eb09  80 e7		 bra $eaf2
$12:eb0b  cc 15 80	  cpy $8015
$12:eb0e  ff e5 60 8b   sbc $8b60e5,x
$12:eb12  97 fd		 sta [$fd],y
$12:eb14  01 fe		 ora ($fe,x)
$12:eb16  c0 c7 60	  cpy #$60c7
$12:eb19  ff ef 84 3f   sbc $3f84ef,x
$12:eb1d  91 38		 sta ($38),y
$12:eb1f  d0 d8		 bne $eaf9
$12:eb21  79 54 ad	  adc $ad54,y
$12:eb24  ae d7 fe	  ldx $fed7
$12:eb27  59 37 f8	  eor $f837,y
$12:eb2a  41 e0		 eor ($e0,x)
$12:eb2c  11 e8		 ora ($e8),y
$12:eb2e  04 d6		 tsb $d6
$12:eb30  01 4a		 ora ($4a,x)
$12:eb32  04 3c		 tsb $3c
$12:eb34  be 61 17	  ldx $1761,y
$12:eb37  8c 75 fb	  sty $fb75
$12:eb3a  1b			tcs
$12:eb3b  7d c7 3f	  adc $3fc7,x
$12:eb3e  a1 ef		 lda ($ef,x)
$12:eb40  f8			sed
$12:eb41  77 fc		 adc [$fc],y
$12:eb43  0f f0 e0 40   ora $40e0f0
$12:eb47  0f c1 20 80   ora $8020c1
$12:eb4b  50 10		 bvc $eb5d
$12:eb4d  82 ff 29	  brl $154f
$12:eb50  c7 fe		 cmp [$fe]
$12:eb52  31 ff		 and ($ff),y
$12:eb54  94 7f		 sty $7f,x
$12:eb56  e2 0e		 sep #$0e
$12:eb58  91 17		 sta ($17),y
$12:eb5a  02 54		 cop #$54
$12:eb5c  05 c2		 ora $c2
$12:eb5e  ff d9 f7 06   sbc $06f7d9,x
$12:eb62  c3 9e		 cmp $9e,s
$12:eb64  e3 4f		 sbc $4f,s
$12:eb66  fa			plx
$12:eb67  d3 fe		 cmp ($fe,s),y
$12:eb69  5c fe c7 9f   jml $9fc7fe
$12:eb6d  9a			txs
$12:eb6e  72 ed		 adc ($ed)
$12:eb70  79 4e 0f	  adc $0f4e,y
$12:eb73  07 01		 ora [$01]
$12:eb75  80 7f		 bra $ebf6
$12:eb77  a3 04		 lda $04,s
$12:eb79  38			sec
$12:eb7a  1c 06 08	  trb $0806
$12:eb7d  bd 07 81	  lda $8107,x
$12:eb80  3f 90 77 fb   and $fb7790,x
$12:eb84  9e 3b 17	  stz $173b,x
$12:eb87  f7 53		 sbc [$53],y
$12:eb89  fe a4 ef	  inc $efa4,x
$12:eb8c  8b			phb
$12:eb8d  25 3f		 and $3f
$12:eb8f  9f c7 e3 f0   sta $f0e3c7,x
$12:eb93  38			sec
$12:eb94  1c 06 02	  trb $0206
$12:eb97  ff 2d ce 67   sbc $67ce2d,x
$12:eb9b  77 9b		 adc [$9b],y
$12:eb9d  78			sei
$12:eb9e  96 ff		 stx $ff,y
$12:eba0  3e f7 4b	  rol $4bf7,x
$12:eba3  3c 06 cf	  bit $cf06,x
$12:eba6  03 00		 ora $00,s
$12:eba8  9c 1c 0e	  stz $0e1c
$12:ebab  8f 70 7c 2b   sta $2b7c70
$12:ebaf  dc bf e1	  jml [$e1bf]
$12:ebb2  b0 bf		 bcs $eb73
$12:ebb4  c7 eb		 cmp [$eb]
$12:ebb6  e2 07		 sep #$07
$12:ebb8  15 16		 ora $16,x
$12:ebba  e3 7c		 sbc $7c,s
$12:ebbc  2f 0f c0 c8   and $c8c00f
$12:ebc0  7b			tdc
$12:ebc1  03 62		 ora $62,s
$12:ebc3  db			stp
$12:ebc4  76 f6		 ror $f6,x
$12:ebc6  f3 ea		 sbc ($ea,s),y
$12:ebc8  08			php
$12:ebc9  fc 60 24	  jsr ($2460,x)
$12:ebcc  30 8f		 bmi $eb5d
$12:ebce  40			rti
$12:ebcf  61 d0		 adc ($d0,x)
$12:ebd1  18			clc
$12:ebd2  14 05		 trb $05
$12:ebd4  ce 17 ae	  dec $ae17
$12:ebd7  a7 3e		 lda [$3e]
$12:ebd9  5b			tcd
$12:ebda  da			phx
$12:ebdb  9f db f2 63   sta $63f2db,x
$12:ebdf  c0 ed 7b	  cpy #$7bed
$12:ebe2  7f 7e 6f 5f   adc $5f6f7e,x
$12:ebe6  de fd c1	  dec $c1fd,x
$12:ebe9  b7 e6		 lda [$e6],y
$12:ebeb  2f f8 a9 ff   and $ffa9f8
$12:ebef  08			php
$12:ebf0  ca			dex
$12:ebf1  11 ff		 ora ($ff),y
$12:ebf3  04 3f		 tsb $3f
$12:ebf5  e0 6b 0f	  cpx #$0f6b
$12:ebf8  fd 17 77	  sbc $7717,x
$12:ebfb  55 ef		 eor $ef,x
$12:ebfd  ed 39 fb	  sbc $fb39
$12:ec00  af ff 23 ef   lda $ef23ff
$12:ec04  48			pha
$12:ec05  b7 ed		 lda [$ed],y
$12:ec07  25 fd		 and $fd
$12:ec09  8f fc 04 fe   sta $fe04fc
$12:ec0d  1f ec 27 fb   ora $fb27ec,x
$12:ec11  15 fc		 ora $fc,x
$12:ec13  c0 7f 20	  cpy #$207f
$12:ec16  1f c9 2f e2   ora $e22fc9,x
$12:ec1a  19 02 ff	  ora $ff02,y
$12:ec1d  e2 ae		 sep #$ae
$12:ec1f  b3 18		 lda ($18,s),y
$12:ec21  74 32		 stz $32,x
$12:ec23  1f 30 9c 58   ora $589c30,x
$12:ec27  6e 38 3f	  ror $3f38
$12:ec2a  1c 0b c7	  trb $c70b
$12:ec2d  04 fd		 tsb $fd
$12:ec2f  f4 65 d3	  pea $d365
$12:ec32  fe 01 ac	  inc $ac01,x
$12:ec35  27 1c		 and [$1c]
$12:ec37  7b			tdc
$12:ec38  8e 3b c7	  stx $c73b
$12:ec3b  1c 55 84	  trb $8455
$12:ec3e  1b			tcs
$12:ec3f  f3 4b		 sbc ($4b,s),y
$12:ec41  fb			xce
$12:ec42  cb			wai
$12:ec43  bb			tyx
$12:ec44  f9 ac f5	  sbc $f5ac,y
$12:ec47  92 f9		 sta ($f9)
$12:ec49  c8			iny
$12:ec4a  fc 40 30	  jsr ($3040,x)
$12:ec4d  10 f8		 bpl $ec47
$12:ec4f  7c 8f b9	  jmp ($b98f,x)
$12:ec52  07 fc		 ora [$fc]
$12:ec54  7f e0 19 eb   adc $eb19e0,x
$12:ec58  0d f3 07	  ora $07f3
$12:ec5b  f8			sed
$12:ec5c  83 e0		 sta $e0,s
$12:ec5e  2f e6 b0 9e   and $9eb0e6
$12:ec62  cf b4 9d fc   cmp $fc9db4
$12:ec66  cd a6 a9	  cmp $a9a6
$12:ec69  fb			xce
$12:ec6a  de ef b4	  dec $b4ef,x
$12:ec6d  55 39		 eor $39,x
$12:ec6f  9f 36 85 e3   sta $e38536,x
$12:ec73  51 83		 eor ($83),y
$12:ec75  0c 21 3f	  tsb $3f21
$12:ec78  68			pla
$12:ec79  1f f2 81 ff   ora $ff81f2,x
$12:ec7d  86 7f		 stx $7f
$12:ec7f  fc 31 e5	  jsr ($e531,x)
$12:ec82  68			pla
$12:ec83  52 bd		 eor ($bd)
$12:ec85  d9 5b cf	  cmp $cf5b,y
$12:ec88  f3 6b		 sbc ($6b,s),y
$12:ec8a  e8			inx
$12:ec8b  9a			txs
$12:ec8c  f7 74		 sbc [$74],y
$12:ec8e  7e ec cf	  ror $cfec,x
$12:ec91  f6 15		 inc $15,x
$12:ec93  ff ca fb a2   sbc $a2fbca,x
$12:ec97  3f d8 17 f7   and $f717d8,x
$12:ec9b  04 01		 tsb $01
$12:ec9d  0f fe 03 ff   ora $ff03fe
$12:eca1  88			dey
$12:eca2  ff c2 1f a1   sbc $a11fc2,x
$12:eca6  2b			pld
$12:eca7  fa			plx
$12:eca8  ea			nop
$12:eca9  fe bd 5f	  inc $5fbd,x
$12:ecac  dc ce b9	  jml [$b9ce]
$12:ecaf  4d bb eb	  eor $ebbb
$12:ecb2  fa			plx
$12:ecb3  97 bd		 sta [$bd],y
$12:ecb5  36 d6		 rol $d6,x
$12:ecb7  94 7f		 sty $7f,x
$12:ecb9  23 f8		 and $f8,s
$12:ecbb  5f d9 61 81   eor $8161d9,x
$12:ecbf  61 87		 adc ($87,x)
$12:ecc1  fe 44 c3	  inc $c344,x
$12:ecc4  0e ac ff	  asl $ffac
$12:ecc7  e7 0f		 sbc [$0f]
$12:ecc9  fb			xce
$12:ecca  43 bf		 eor $bf,s
$12:eccc  70 7f		 bvs $ed4d
$12:ecce  ec 0f f3	  cpx $f30f
$12:ecd1  05 ff		 ora $ff
$12:ecd3  c0 ff d0	  cpy #$d0ff
$12:ecd6  38			sec
$12:ecd7  05 fe		 ora $fe
$12:ecd9  01 1f		 ora ($1f,x)
$12:ecdb  80 c7		 bra $eca4
$12:ecdd  e0 12 f2	  cpx #$f212
$12:ece0  08			php
$12:ece1  40			rti
$12:ece2  a9 f0		 lda #$f0
$12:ece4  08			php
$12:ece5  b9 14 3b	  lda $3b14,y
$12:ece8  dd f9 af	  cmp $aff9,x
$12:eceb  db			stp
$12:ecec  d5 1d		 cmp $1d,x
$12:ecee  b9 73 75	  lda $7573,y
$12:ecf1  75 6b		 adc $6b,x
$12:ecf3  ee ab b7	  inc $b7ab
$12:ecf6  a5 df		 lda $df
$12:ecf8  56 64		 lsr $64,x
$12:ecfa  1f f8 4f f9   ora $f94ff8,x
$12:ecfe  5a			phy
$12:ecff  1f 70 60 0a   ora $0a6070,x
$12:ed03  82 11 f7	  brl $e417
$12:ed06  80 7d		 bra $ed85
$12:ed08  e2 0c		 sep #$0c
$12:ed0a  30 fd		 bmi $ed09
$12:ed0c  c1 3a		 cmp ($3a,x)
$12:ed0e  da			phx
$12:ed0f  9e 2c bb	  stz $bb2c,x
$12:ed12  79 d5 c1	  adc $c1d5,y
$12:ed15  d5 b7		 cmp $b7,x
$12:ed17  be fe be	  ldx $befe,y
$12:ed1a  f7 1f		 sbc [$1f],y
$12:ed1c  00 d7		 brk #$d7
$12:ed1e  8a			txa
$12:ed1f  83 01		 sta $01,s
$12:ed21  6f 88 00 c3   adc $c30088
$12:ed25  af 28 ff e1   lda $e1ff28
$12:ed29  41 a1		 eor ($a1,x)
$12:ed2b  57 d4		 eor [$d4],y
$12:ed2d  f5 74		 sbc $74,x
$12:ed2f  7b			tdc
$12:ed30  d8			cld
$12:ed31  f7 ee		 sbc [$ee],y
$12:ed33  ab			plb
$12:ed34  d5 d7		 cmp $d7,x
$12:ed36  fa			plx
$12:ed37  76 58		 ror $58,x
$12:ed39  ee ae 82	  inc $82ae
$12:ed3c  ae 21 0f	  ldx $0f21
$12:ed3f  bc 27 7f	  ldy $7f27,x
$12:ed42  54 ff c4	  mvn $c4,$ff
$12:ed45  7f f8 1f de   adc $de1ff8,x
$12:ed49  13 bf		 ora ($bf,s),y
$12:ed4b  a0 32 87	  ldy #$8732
$12:ed4e  5e 15 55	  lsr $5515,x
$12:ed51  91 46		 sta ($46),y
$12:ed53  f5 97		 sbc $97,x
$12:ed55  5e c6 b6	  lsr $b6c6,x
$12:ed58  8f 57 9e fd   sta $fd9e57
$12:ed5c  f5 15		 sbc $15,x
$12:ed5e  ff 05 7a 41   sbc $417a05,x
$12:ed62  77 c4		 adc [$c4],y
$12:ed64  6f e8 1f d8   adc $d81fe8
$12:ed68  17 be		 ora [$be],y
$12:ed6a  22 27 0f f4   jsl $f40f27
$12:ed6e  03 fa		 ora $fa,s
$12:ed70  c4 01		 cpy $01
$12:ed72  c0 41 c6	  cpy #$c641
$12:ed75  77 07		 adc [$07],y
$12:ed77  80 43		 bra $edbc
$12:ed79  c8			iny
$12:ed7a  75 b1		 adc $b1,x
$12:ed7c  b9 bb f3	  lda $f3bb,y
$12:ed7f  e7 0c		 sbc [$0c]
$12:ed81  7f e4 62 70   adc $7062e4,x
$12:ed85  0f b9 cc e3   ora $e3ccb9
$12:ed89  8e 1f be	  stx $be1f
$12:ed8c  34 f7		 bit $f7,x
$12:ed8e  e9 39		 sbc #$39
$12:ed90  f4 46 7f	  pea $7f46
$12:ed93  13 9e		 ora ($9e,s),y
$12:ed95  c0 d4 3f	  cpy #$3fd4
$12:ed98  35 81		 and $81,x
$12:ed9a  c8			iny
$12:ed9b  6e 63 1f	  ror $1f63
$12:ed9e  38			sec
$12:ed9f  07 9e		 ora [$9e]
$12:eda1  01 c7		 ora ($c7,x)
$12:eda3  80 69		 bra $ee0e
$12:eda5  c8			iny
$12:eda6  83 27		 sta $27,s
$12:eda8  24 0d		 bit $0d
$12:edaa  9e 01 d8	  stz $d801,x
$12:edad  fb			xce
$12:edae  fe be fa	  inc $fabe,x
$12:edb1  ad bf f7	  lda $f7bf
$12:edb4  cf d6 f6 d7   cmp $d7f6d6
$12:edb8  bd 7d 6e	  lda $6e7d,x
$12:edbb  5e cb ff	  lsr $ffcb,x
$12:edbe  0f f8 17 c2   ora $c217f8
$12:edc2  9e 60 18	  stz $1860,x
$12:edc5  ff 80 ce 12   sbc $12ce80,x
$12:edc9  7f c2 08 27   adc $2708c2,x
$12:edcd  fe 0b fe	  inc $fe0b,x
$12:edd0  92 ff		 sta ($ff)
$12:edd2  a0 b7 ec	  ldy #$ecb7
$12:edd5  36 d5		 rol $d5,x
$12:edd7  9f fc 93 bd   sta $bd93fc,x
$12:eddb  21 d5		 and ($d5,x)
$12:eddd  dd fe 12	  cmp $12fe,x
$12:ede0  af a4 b3 e1   lda $e1b3a4
$12:ede4  25 fc		 and $fc
$12:ede6  49 ff		 eor #$ff
$12:ede8  91 3f		 sta ($3f),y
$12:edea  f4 17 69	  pea $6917
$12:eded  4b			phk
$12:edee  36 82		 rol $82,x
$12:edf0  35 24		 and $24,x
$12:edf2  1d f4 6b	  ora $6bf4,x
$12:edf5  27 97		 and [$97]
$12:edf7  be 9e 6d	  ldx $6d9e,y
$12:edfa  fe ff ad	  inc $adff,x
$12:edfd  f7 f6		 sbc [$f6],y
$12:edff  ff ba 5d d9   sbc $d95dba,x
$12:ee03  37 e3		 and [$e3],y
$12:ee05  b3 25		 lda ($25,s),y
$12:ee07  d5 d6		 cmp $d6,x
$12:ee09  e4 5e		 cpx $5e
$12:ee0b  3a			dec a
$12:ee0c  07 fe		 ora [$fe]
$12:ee0e  11 ff		 ora ($ff),y
$12:ee10  80 ff		 bra $ee11
$12:ee12  a4 3f		 ldy $3f
$12:ee14  e8			inx
$12:ee15  57 d6		 eor [$d6],y
$12:ee17  1b			tcs
$12:ee18  f2 fd		 sbc ($fd)
$12:ee1a  c1 3c		 cmp ($3c,x)
$12:ee1c  71 cf		 adc ($cf),y
$12:ee1e  0f 62 01 2c   ora $2c0162
$12:ee22  c0 d5 a1	  cpy #$a1d5
$12:ee25  37 7b		 and [$7b],y
$12:ee27  56 ff		 lsr $ff,x
$12:ee29  69 7d		 adc #$7d
$12:ee2b  b7 f0		 lda [$f0],y
$12:ee2d  3f d0 1e 34   and $341ed0,x
$12:ee31  ff a7 ff 94   sbc $94ffa7,x
$12:ee35  7f f0 ff 84   adc $84fff0,x
$12:ee39  c0 7e a0	  cpy #$a07e
$12:ee3c  11 08		 ora ($08),y
$12:ee3e  03 b0		 ora $b0,s
$12:ee40  21 19		 and ($19,x)
$12:ee42  77 70		 adc [$70],y
$12:ee44  4a			lsr a
$12:ee45  ff f9 4b 7f   sbc $7f4bf9,x
$12:ee49  2a			rol a
$12:ee4a  ac 98 0f	  ldy $0f98
$12:ee4d  ac 1a ff	  ldy $ff1a
$12:ee50  40			rti
$12:ee51  b0 7f		 bcs $eed2
$12:ee53  fe e9 e0	  inc $e0e9,x
$12:ee56  46 8c		 lsr $8c
$12:ee58  85 d8		 sta $d8
$12:ee5a  50 0c		 bvc $ee68
$12:ee5c  03 b8		 ora $b8,s
$12:ee5e  e5 5f		 sbc $5f
$12:ee60  e7 a8		 sbc [$a8]
$12:ee62  5a			phy
$12:ee63  b4 c9		 ldy $c9,x
$12:ee65  82 fd 41	  brl $3065
$12:ee68  9f e4 dd 04   sta $04dde4,x
$12:ee6c  c0 44 5d	  cpy #$5d44
$12:ee6f  82 ec 08	  brl $f75e
$12:ee72  0c 02 a5	  tsb $a502
$12:ee75  f3 76		 sbc ($76,s),y
$12:ee77  05 bf		 ora $bf
$12:ee79  b7 b7		 lda [$b7],y
$12:ee7b  db			stp
$12:ee7c  53 b5		 eor ($b5,s),y
$12:ee7e  29 80		 and #$80
$12:ee80  fa			plx
$12:ee81  43 6d		 eor $6d,s
$12:ee83  74 c8		 stz $c8,x
$12:ee85  62 78 7b	  per $6a00
$12:ee88  72 4d		 adc ($4d)
$12:ee8a  b5 25		 lda $25,x
$12:ee8c  d6 50		 dec $50,x
$12:ee8e  28			plp
$12:ee8f  06 40		 asl $40
$12:ee91  da			phx
$12:ee92  1d 3e de	  ora $de3e,x
$12:ee95  b7 57		 lda [$57],y
$12:ee97  7c ba ea	  jmp ($eaba,x)
$12:ee9a  af d9 3e ad   lda $ad3ed9
$12:ee9e  eb			xba
$12:ee9f  1f 70 ff e8   ora $e8ff70,x
$12:eea3  a5 9d		 lda $9d
$12:eea5  3b			tsc
$12:eea6  f6 05		 inc $05,x
$12:eea8  30 5b		 bmi $ef05
$12:eeaa  f8			sed
$12:eeab  85 ad		 sta $ad
$12:eead  d0 3f		 bne $eeee
$12:eeaf  43 30		 eor $30,s
$12:eeb1  55 7e		 eor $7e,x
$12:eeb3  75 dc		 adc $dc,x
$12:eeb5  5d db cf	  eor $cfdb,x
$12:eeb8  ba			tsx
$12:eeb9  f3 ee		 sbc ($ee,s),y
$12:eebb  34 f7		 bit $f7,x
$12:eebd  ae bd f2	  ldx $f2bd
$12:eec0  77 d6		 adc [$d6],y
$12:eec2  61 03		 adc ($03,x)
$12:eec4  08			php
$12:eec5  60			rts
$12:eec6  57 ec		 eor [$ec],y
$12:eec8  15 f3		 ora $f3,x
$12:eeca  00 83		 brk #$83
$12:eecc  1c 05 ff	  trb $ff05
$12:eecf  01 ff		 ora ($ff,x)
$12:eed1  aa			tax
$12:eed2  ec eb bc	  cpx $bceb
$12:eed5  bd b7 bf	  lda $bfb7,x
$12:eed8  75 ef		 adc $ef,x
$12:eeda  9c 6b cf	  stz $cf6b
$12:eedd  43 bb		 eor $bb,s
$12:eedf  7c 02 00	  jmp ($0002,x)
$12:eee2  6f c8 40 85   adc $8540c8
$12:eee6  5f 21 0c 60   eor $600c21,x
$12:eeea  45 80		 eor $80
$12:eeec  64 3f		 stz $3f
$12:eeee  10 7f		 bpl $ef6f
$12:eef0  9c 3f db	  stz $db3f
$12:eef3  1f ed cf f5   ora $f5cfed,x
$12:eef7  f5 fe		 sbc $fe,x
$12:eef9  ac f7 5f	  ldy $5ff7
$12:eefc  6f ff 06 43   adc $4306ff
$12:ef00  1f 00 8f c0   ora $c08f00,x
$12:ef04  2f f0 09 f8   and $f809f0
$12:ef08  10 20		 bpl $ef2a
$12:ef0a  57 f8		 eor [$f8],y
$12:ef0c  80 64		 bra $ef72
$12:ef0e  7f 75 5d ed   adc $ed5d75,x
$12:ef12  5f a7 ae ff   eor $ffaea7,x
$12:ef16  f0 7d		 beq $ef95
$12:ef18  f5 0e		 sbc $0e,x
$12:ef1a  b9 e8 27	  lda $27e8,y
$12:ef1d  1a			inc a
$12:ef1e  db			stp
$12:ef1f  b2 7d		 lda ($7d)
$12:ef21  2f 94 07 28   and $280794
$12:ef25  7f a8 4a b2   adc $b24aa8,x
$12:ef29  d8			cld
$12:ef2a  dc dd f9	  jml [$f9dd]
$12:ef2d  f3 86		 sbc ($86,s),y
$12:ef2f  3f f2 31 39   and $3931f2,x
$12:ef33  07 84		 ora [$84]
$12:ef35  6c 24 31	  jmp ($3124)
$12:ef38  f9 cc 5e	  sbc $5ecc,y
$12:ef3b  71 27		 adc ($27),y
$12:ef3d  9c 59 77	  stz $7759
$12:ef40  13 8e		 ora ($8e,s),y
$12:ef42  30 7c		 bmi $efc0
$12:ef44  78			sei
$12:ef45  82 31 e0	  brl $cf79
$12:ef48  4c 78 10	  jmp $1078
$12:ef4b  1e 04 0e	  asl $0e04,x
$12:ef4e  01 b9		 ora ($b9,x)
$12:ef50  8c 6e 73	  sty $736e
$12:ef53  03 1a		 ora $1a,s
$12:ef55  b3 c0		 lda ($c0,s),y
$12:ef57  07 f9		 ora [$f9]
$12:ef59  00 aa		 brk #$aa
$12:ef5b  ea			nop
$12:ef5c  b4 9d		 ldy $9d,x
$12:ef5e  4e 85 cb	  lsr $cb85
$12:ef61  e5 a5		 sbc $a5
$12:ef63  ba			tsx
$12:ef64  f3 e5		 sbc ($e5,s),y
$12:ef66  f4 e8 7e	  pea $7ee8
$12:ef69  1b			tcs
$12:ef6a  1e 50 0d	  asl $0d50,x
$12:ef6d  75 47		 adc $47,x
$12:ef6f  a9 2b		 lda #$2b
$12:ef71  f9 43 7e	  sbc $7e43,y
$12:ef74  b0 af		 bcs $ef25
$12:ef76  7c 42 9f	  jmp ($9f42,x)
$12:ef79  b0 c7		 bcs $ef42
$12:ef7b  dc 21 14	  jml [$1421]
$12:ef7e  6d 76 80	  adc $8076
$12:ef81  a6 5a		 ldx $5a
$12:ef83  db			stp
$12:ef84  e9 65		 sbc #$65
$12:ef86  29 db		 and #$db
$12:ef88  13 0a		 ora ($0a,s),y
$12:ef8a  7f 60 46 94   adc $944660,x
$12:ef8e  63 82		 adc $82,s
$12:ef90  3d 7d e8	  and $e87d,x
$12:ef93  f4 4f 37	  pea $374f
$12:ef96  bd 3c ea	  lda $ea3c,x
$12:ef99  80 fd		 bra $ef98
$12:ef9b  aa			tax
$12:ef9c  0f bf df 55   ora $55dfbf
$12:efa0  62 e9 29	  per $198c
$12:efa3  fd 04 80	  sbc $8004,x
$12:efa6  5e b0 9a	  lsr $9ab0,x
$12:efa9  7b			tdc
$12:efaa  47 73		 eor [$73]
$12:efac  54 4e 09	  mvn $09,$4e
$12:efaf  14 88		 trb $88
$12:efb1  9c 12 02	  stz $0212
$12:efb4  70 40		 bvs $eff6
$12:efb6  20 30 08	  jsr $0830
$12:efb9  84 03		 sty $03
$12:efbb  13 77		 ora ($77,s),y
$12:efbd  54 07 75	  mvn $75,$07
$12:efc0  50 50		 bvc $f012
$12:efc2  04 80		 tsb $80
$12:efc4  6f f8 1e b8   adc $b81ef8
$12:efc8  63 5c		 adc $5c,s
$12:efca  a4 12		 ldy $12
$12:efcc  08			php
$12:efcd  4c 25 c0	  jmp $c025
$12:efd0  2e 01 72	  rol $7201
$12:efd3  a2 e8 3e	  ldx #$3ee8
$12:efd6  ce e3 48	  dec $48e3
$12:efd9  05 6a		 ora $6a
$12:efdb  cd 16 cb	  cmp $cb16
$12:efde  13 83		 ora ($83,s),y
$12:efe0  41 a0		 eor ($a0,x)
$12:efe2  9b			txy
$12:efe3  69 5f		 adc #$5f
$12:efe5  e9 81		 sbc #$81
$12:efe7  80 5a		 bra $f043
$12:efe9  55 03		 eor $03,x
$12:efeb  5f ff c9 3b   eor $3bc9ff,x
$12:efef  69 00		 adc #$00
$12:eff1  fc c1 f4	  jsr ($f4c1,x)
$12:eff4  f6 0b		 inc $0b,x
$12:eff6  f4 07 ad	  pea $ad07
$12:eff9  dd 27 04	  cmp $0427,x
$12:effc  12 09		 ora ($09)
$12:effe  10 c8		 bpl $efc8
$12:f000  3f ca 31 00   and $0031ca,x
$12:f004  c0 37 81	  cpy #$8137
$12:f007  60			rts
$12:f008  76 ff		 ror $ff,x
$12:f00a  ff 6f f7 fe   sbc $fef76f,x
$12:f00e  ff ee f7 ff   sbc $fff7ee,x
$12:f012  ff e7 bf f5   sbc $f5bfe7,x
$12:f016  7d f9 f6	  adc $f6f9,x
$12:f019  b8			clv
$12:f01a  bd fd a4	  lda $a4fd,x
$12:f01d  11 20		 ora ($20),y
$12:f01f  34 0f		 bit $0f,x
$12:f021  fc 0f f9	  jsr ($f90f,x)
$12:f024  07 fc		 ora [$fc]
$12:f026  43 fe		 eor $fe,s
$12:f028  13 ff		 ora ($ff,s),y
$12:f02a  05 ff		 ora $ff
$12:f02c  00 4f		 brk #$4f
$12:f02e  05 40		 ora $40
$12:f030  6f f7 f7 3f   adc $3ff7f7
$12:f034  be de 9f	  ldx $9fde,y
$12:f037  6d d8 fa	  adc $fad8
$12:f03a  e6 94		 inc $94
$12:f03c  ad e9 7d	  lda $7de9
$12:f03f  21 1f		 and ($1f,x)
$12:f041  fd 85 3f	  sbc $3f85,x
$12:f044  fd 03 ff	  sbc $ff03,x
$12:f047  3c 06 8d	  bit $8d06,x
$12:f04a  e6 e2		 inc $e2
$12:f04c  5b			tcd
$12:f04d  37 9f		 and [$9f],y
$12:f04f  4d 4d d7	  eor $d74d
$12:f052  13 f5		 ora ($f5,s),y
$12:f054  ed 6b f5	  sbc $f56b
$12:f057  95 be		 sta $be,x
$12:f059  fe d7 cd	  inc $cdd7,x
$12:f05c  19 f6 44	  ora $44f6,y
$12:f05f  ff 98 3f ec   sbc $ec3f98,x
$12:f063  0b			phd
$12:f064  fb			xce
$12:f065  82 ff e2	  brl $d367
$12:f068  10 83		 bpl $efed
$12:f06a  95 92		 sta $92,x
$12:f06c  f9 75 3e	  sbc $3e75,y
$12:f06f  df 6f af 6d   cmp $6daf6f,x
$12:f073  f5 a4		 sbc $a4,x
$12:f075  5e ec d5	  lsr $d5ec,x
$12:f078  db			stp
$12:f079  9f bb 6b 4a   sta $4a6bbb,x
$12:f07d  f2 c6		 sbc ($c6)
$12:f07f  bd b1 2f	  lda $2fb1,x
$12:f082  7c 43 ef	  jmp ($ef43,x)
$12:f085  08			php
$12:f086  bd e1 0d	  lda $0de1,x
$12:f089  a1 ff		 lda ($ff,x)
$12:f08b  91 3b		 sta ($3b),y
$12:f08d  c2 19		 rep #$19
$12:f08f  cc ca 65	  cpy $65ca
$12:f092  29 36		 and #$36
$12:f094  9d 5b d4	  sta $d45b,x
$12:f097  3f f9 2b 6e   and $6e2bf9,x
$12:f09b  da			phx
$12:f09c  93 f7		 sta ($f7,s),y
$12:f09e  d6 73		 dec $73,x
$12:f0a0  26 79		 rol $79
$12:f0a2  4b			phk
$12:f0a3  5d a7 2d	  eor $2da7,x
$12:f0a6  eb			xba
$12:f0a7  8a			txa
$12:f0a8  03 d3		 ora $d3,s
$12:f0aa  ff a4 da dc   sbc $dcdaa4,x
$12:f0ae  f7 b7		 sbc [$b7],y
$12:f0b0  bc ed ef	  ldy $efed,x
$12:f0b3  bb			tyx
$12:f0b4  3b			tsc
$12:f0b5  7a			ply
$12:f0b6  8b			phb
$12:f0b7  d0 2b		 bne $f0e4
$12:f0b9  7c da 1f	  jmp ($1fda,x)
$12:f0bc  c6 13		 dec $13
$12:f0be  e1 80		 sbc ($80,x)
$12:f0c0  f0 60		 beq $f122
$12:f0c2  38			sec
$12:f0c3  10 21		 bpl $f0e6
$12:f0c5  e8			inx
$12:f0c6  60			rts
$12:f0c7  3b			tsc
$12:f0c8  98			tya
$12:f0c9  0d 97 71	  ora $7197
$12:f0cc  61 dc		 adc ($dc,x)
$12:f0ce  5a			phy
$12:f0cf  77 17		 adc [$17],y
$12:f0d1  90 a0		 bcc $f073
$12:f0d3  66 27		 ror $27
$12:f0d5  21 81		 and ($81,x)
$12:f0d7  dc e6 20	  jml [$20e6]
$12:f0da  70 08		 bvs $f0e4
$12:f0dc  38			sec
$12:f0dd  80 e4		 bra $f0c3
$12:f0df  f0 0b		 beq $f0ec
$12:f0e1  38			sec
$12:f0e2  a0 c3 a0	  ldy #$a0c3
$12:f0e5  2f c1 4a 0f   and $0f4ac1
$12:f0e9  e3 fd		 sbc $fd,s
$12:f0eb  01 27		 ora ($27,x)
$12:f0ed  87 f5		 sta [$f5]
$12:f0ef  14 10		 trb $10
$12:f0f1  2f d4 1f f9   and $f91fd4
$12:f0f5  07 fa		 ora [$fa]
$12:f0f7  43 3f		 eor $3f,s
$12:f0f9  10 88		 bpl $f083
$12:f0fb  01 7c		 ora ($7c,x)
$12:f0fd  e0 25 f3	  cpx #$f325
$12:f100  0f 97 ff ff   ora $ffff97
$12:f104  c7 e3		 cmp [$e3]
$12:f106  e0 f0 66	  cpx #$66f0
$12:f109  f0 83		 beq $f08e
$12:f10b  7f e0 3f f6   adc $f63fe0,x
$12:f10f  50 50		 bvc $f161
$12:f111  ef e5 f0 9c   sbc $9cf0e5
$12:f115  40			rti
$12:f116  2f 85 f4 2f   and $2ff485
$12:f11a  8e 02 01	  stx $0102
$12:f11d  9f f0 47 fc   sta $fc47f0,x
$12:f121  1e ff 86	  asl $86ff,x
$12:f124  5f 31 23 f6   eor $f62331,x
$12:f128  46 ff		 lsr $ff
$12:f12a  89 90		 bit #$90
$12:f12c  e5 ff		 sbc $ff
$12:f12e  0b			phd
$12:f12f  e9 60		 sbc #$60
$12:f131  80 44		 bra $f177
$12:f133  10 8b		 bpl $f0c0
$12:f135  5f f8 eb fe   eor $feebf8,x
$12:f139  70 ef		 bvs $f12a
$12:f13b  fb			xce
$12:f13c  5c 6d f7 08   jml $08f76d
$12:f140  7e 27 0d	  ror $0d27,x
$12:f143  de e8 39	  dec $39e8,x
$12:f146  d5 d0		 cmp $d0,x
$12:f148  37 fc		 and [$fc],y
$12:f14a  06 3e		 asl $3e
$12:f14c  e1 de		 sbc ($de,x)
$12:f14e  90 fd		 bcc $f14d
$12:f150  fe 35 1f	  inc $1f35,x
$12:f153  8c af f7	  sty $f7af
$12:f156  8d bf d4	  sta $d4bf
$12:f159  a5 f3		 lda $f3
$12:f15b  08			php
$12:f15c  fe c7 7d	  inc $7dc7,x
$12:f15f  79 fb 7d	  adc $7dfb,y
$12:f162  e1 1f		 sbc ($1f,x)
$12:f164  18			clc
$12:f165  77 ee		 adc [$ee],y
$12:f167  08			php
$12:f168  c7 29		 cmp [$29]
$12:f16a  ff 03 7f 40   sbc $407f03,x
$12:f16e  5f 87 cf ff   eor $ffcf87,x
$12:f172  de ef 6f	  dec $6fef,x
$12:f175  7f fe 77 80   adc $8077fe,x
$12:f179  77 f3		 adc [$f3],y
$12:f17b  3f ff f7 f7   and $f7f7ff,x
$12:f17f  7f 54 37 04   adc $043754,x
$12:f183  85 7e		 sta $7e
$12:f185  72 05		 adc ($05)
$12:f187  f8			sed
$12:f188  c0 bf a6	  cpy #$a6bf
$12:f18b  e0 97 fb	  cpx #$fb97
$12:f18e  fe bf dc	  inc $dcbf,x
$12:f191  76 ff		 ror $ff,x
$12:f193  f3 ff		 sbc ($ff,s),y
$12:f195  d9 ff ed	  cmp $edff,y
$12:f198  fd 1f d4	  sbc $d41f,x
$12:f19b  37 7f		 and [$7f],y
$12:f19d  ea			nop
$12:f19e  88			dey
$12:f19f  02 83		 cop #$83
$12:f1a1  fe ec 15	  inc $15ec,x
$12:f1a4  f8			sed
$12:f1a5  e5 2d		 sbc $2d
$12:f1a7  75 dd		 adc $dd,x
$12:f1a9  57 ff		 eor [$ff],y
$12:f1ab  55 9b		 eor $9b,x
$12:f1ad  fd 74 fb	  sbc $fb74,x
$12:f1b0  d7 ff		 cmp [$ff],y
$12:f1b2  cd 3a f3	  cmp $f33a
$12:f1b5  9e f1 df	  stz $dff1,x
$12:f1b8  70 df		 bvs $f199
$12:f1ba  58			cli
$12:f1bb  d6 be		 dec $be,x
$12:f1bd  f6 e4		 inc $e4,x
$12:f1bf  00 38		 brk #$38
$12:f1c1  1e 43 03	  asl $0343,x
$12:f1c4  fe 81 ff	  inc $ff81,x
$12:f1c7  a0 ff c8	  ldy #$c8ff
$12:f1ca  ff c3 ff 2b   sbc $2bffc3,x
$12:f1ce  ec 4d fe	  cpx $fe4d
$12:f1d1  d5 df		 cmp $df,x
$12:f1d3  b6 2f		 ldx $2f,y
$12:f1d5  f2 10		 sbc ($10)
$12:f1d7  0d de f5	  ora $f5de
$12:f1da  de 1a 1f	  dec $1f1a,x
$12:f1dd  ed af f9	  sbc $f9af
$12:f1e0  13 ff		 ora ($ff,s),y
$12:f1e2  55 7f		 eor $7f,x
$12:f1e4  98			tya
$12:f1e5  3f e7 af f1   and $f1afe7,x
$12:f1e9  b7 33		 lda [$33],y
$12:f1eb  87 a3		 sta [$a3]
$12:f1ed  6f fc b5 ff   adc $ffb5fc
$12:f1f1  fc 9f fd	  jsr ($fd9f,x)
$12:f1f4  67 fd		 adc [$fd]
$12:f1f6  e6 1f		 inc $1f
$12:f1f8  57 80		 eor [$80],y
$12:f1fa  7f fb 5f ff   adc $ff5ffb,x
$12:f1fe  df ff be 6f   cmp $6fbeff,x
$12:f202  ec 06 02	  cpx $0206
$12:f205  07 03		 ora [$03]
$12:f207  87 43		 sta [$43]
$12:f209  f3 19		 sbc ($19,s),y
$12:f20b  cb			wai
$12:f20c  05 e3		 ora $e3
$12:f20e  81 f8		 sta ($f8,x)
$12:f210  80 60		 bra $f272
$12:f212  21 f0		 and ($f0,x)
$12:f214  fc 05 fe	  jsr ($fe05,x)
$12:f217  07 fc		 ora [$fc]
$12:f219  87 fc		 sta [$fc]
$12:f21b  33 96		 and ($96,s),y
$12:f21d  3b			tsc
$12:f21e  c6 1f		 dec $1f
$12:f220  f1 07		 sbc ($07),y
$12:f222  4f 82 8c 27   eor $278c82
$12:f226  93 fe		 sta ($fe,s),y
$12:f228  81 08		 sta ($08,x)
$12:f22a  20 30 c8	  jsr $c830
$12:f22d  7c c2 71	  jmp ($71c2,x)
$12:f230  61 b8		 adc ($b8,x)
$12:f232  e0 fc 70	  cpx #$70fc
$12:f235  2f 1b a4 00   and $00a41b
$12:f239  81 01		 sta ($01,x)
$12:f23b  ff 28 c2 71   sbc $71c228,x
$12:f23f  c7 b8		 cmp [$b8]
$12:f241  e3 bc		 sbc $bc,s
$12:f243  71 c6		 adc ($c6),y
$12:f245  58			cli
$12:f246  7f fd fe f6   adc $f6fefd,x
$12:f24a  78			sei
$12:f24b  75 fe		 adc $fe,x
$12:f24d  fe 7f bf	  inc $bf7f,x
$12:f250  af ff bb eb   lda $ebbbff
$12:f254  ea			nop
$12:f255  fe fd 36	  inc $36fd,x
$12:f258  88			dey
$12:f259  ff f8 ee 01   sbc $01eef8,x
$12:f25d  f1 b6		 sbc ($b6),y
$12:f25f  43 ff		 eor $ff,s
$12:f261  83 ff		 sta $ff,s
$12:f263  f6 ff		 inc $ff,x
$12:f265  fc fa 0b	  jsr ($0bfa,x)
$12:f268  bc 68 fd	  ldy $fd68,x
$12:f26b  fa			plx
$12:f26c  ff fe fe f7   sbc $f7fefe,x
$12:f270  17 d8		 ora [$d8],y
$12:f272  ef 60 2f f0   sbc $f02f60
$12:f276  df c1 f7 f1   cmp $f1f7c1,x
$12:f27a  fd fc fd	  sbc $fdfc,x
$12:f27d  f2 82		 sbc ($82)
$12:f27f  42 fe		 wdm #$fe
$12:f281  40			rti
$12:f282  fe 70 ff	  inc $ff70,x
$12:f285  74 7b		 stz $7b,x
$12:f287  b9 3c da	  lda $da3c,y
$12:f28a  dd 77 f7	  cmp $f777,x
$12:f28d  f8			sed
$12:f28e  00 7d		 brk #$7d
$12:f290  60			rts
$12:f291  30 08		 bmi $f29b
$12:f293  1c 02 14	  trb $1402
$12:f296  1f 10 79 2f   ora $2f7910,x
$12:f29a  c3 9f		 cmp $9f,s
$12:f29c  f0 8b		 beq $f229
$12:f29e  c6 31		 dec $31
$12:f2a0  78			sei
$12:f2a1  ca			dex
$12:f2a2  2d 1b ab	  and $ab1b
$12:f2a5  d6 0f		 dec $0f,x
$12:f2a7  b7 82		 lda [$82],y
$12:f2a9  01 70		 ora ($70,x)
$12:f2ab  80 6e		 bra $f31b
$12:f2ad  20 12 88	  jsr $8812
$12:f2b0  07 c2		 ora [$c2]
$12:f2b2  20 4f 0f	  jsr $0f4f
$12:f2b5  cc 67 9b	  cpy $9b67
$12:f2b8  3d e3 af	  and $afe3,x
$12:f2bb  c2 7f		 rep #$7f
$12:f2bd  a3 bf		 lda $bf,s
$12:f2bf  e8			inx
$12:f2c0  15 81		 ora $81,x
$12:f2c2  00 2f		 brk #$2f
$12:f2c4  84 1a		 sty $1a
$12:f2c6  01 02		 ora ($02,x)
$12:f2c8  0f b4 02 99   ora $9902b4
$12:f2cc  7c ca fd	  jmp ($fdca,x)
$12:f2cf  63 df		 adc $df,s
$12:f2d1  e9 af fe	  sbc #$feaf
$12:f2d4  55 ff		 eor $ff,x
$12:f2d6  9c 7f e2	  stz $e27f
$12:f2d9  9f f9 03 a8   sta $a803f9,x
$12:f2dd  05 42		 ora $42
$12:f2df  27 04		 and [$04]
$12:f2e1  24 4c		 bit $4c
$12:f2e3  e7 94		 sbc [$94]
$12:f2e5  ba			tsx
$12:f2e6  66 c3		 ror $c3
$12:f2e8  ef 6c ff e5   sbc $e5ff6c
$12:f2ec  3f f0 4f fc   and $fc4ff0,x
$12:f2f0  41 30		 eor ($30,x)
$12:f2f2  3c 08 06	  bit $0608,x
$12:f2f5  c2 01		 rep #$01
$12:f2f7  08			php
$12:f2f8  42 4f		 wdm #$4f
$12:f2fa  fc 5c 71	  jsr ($715c,x)
$12:f2fd  ff 07 9f f1   sbc $f19f07,x
$12:f301  b9 df 59	  lda $59df,y
$12:f304  bc f6 1f	  ldy $1ff6,x
$12:f307  0a			asl a
$12:f308  12 28		 ora ($28)
$12:f30a  10 08		 bpl $f314
$12:f30c  c4 02		 cpy $02
$12:f30e  3c ae 55	  bit $55ae,x
$12:f311  78			sei
$12:f312  7e 20 fe	  ror $fe20,x
$12:f315  78			sei
$12:f316  fe 62 f1	  inc $f162,x
$12:f319  60			rts
$12:f31a  23 82		 and $82,s
$12:f31c  12 60		 ora ($60)
$12:f31e  eb			xba
$12:f31f  40			rti
$12:f320  80 75		 bra $f397
$12:f322  ef 1f b8 67   sbc $67b81f
$12:f326  bf 23 fe e1   lda $e1fe23,x
$12:f32a  ff fc 9f ff   sbc $ff9ffc,x
$12:f32e  e7 ff		 sbc [$ff]
$12:f330  fd ff ff	  sbc $ffff,x
$12:f333  e1 6f		 sbc ($6f,x)
$12:f335  5a			phy
$12:f336  2a			rol a
$12:f337  ef 27 6f e4   sbc $e46f27
$12:f33b  ed ff 3c	  sbc $3cff
$12:f33e  ff ef eb ec   sbc $ecebef,x
$12:f342  81 a3		 sta ($a3,x)
$12:f344  b7 ff		 lda [$ff],y
$12:f346  fb			xce
$12:f347  7f fd bf fe   adc $febffd,x
$12:f34b  77 ff		 adc [$ff],y
$12:f34d  9b			txy
$12:f34e  ff fa ff fa   sbc $fafffa,x
$12:f352  50 69		 bvc $f3bd
$12:f354  83 4f		 sta $4f,s
$12:f356  be 0d 1f	  ldx $1f0d,y
$12:f359  7f ff f7 3d   adc $3df7ff,x
$12:f35d  ef ed 7f f5   sbc $f57fed
$12:f361  7f fd ff ff   adc $fffffd,x
$12:f365  6f ff ef c7   adc $c7efff
$12:f369  22 29 09 cf   jsl $cf0929
$12:f36d  ff 2a 33 af   sbc $af332a,x
$12:f371  ef 4f ef cb   sbc $cbef4f
$12:f375  fd 69 bd	  sbc $bd69,x
$12:f378  f9 7f be	  sbc $be7f,y
$12:f37b  3f eb 4d f5   and $f54deb,x
$12:f37f  c5 fb		 cmp $fb
$12:f381  fa			plx
$12:f382  ff 87 7f c1   sbc $c17f87,x
$12:f386  df f0 ef f8   cmp $f8eff0,x
$12:f38a  06 41		 asl $41
$12:f38c  f1 57		 sbc ($57),y
$12:f38e  f0 17		 beq $f3a7
$12:f390  fc 07 ff	  jsr ($ff07,x)
$12:f393  5f 77 af fd   eor $fdaf77,x
$12:f397  7b			tdc
$12:f398  f7 ba		 sbc [$ba],y
$12:f39a  be a7 77	  ldx $77a7,y
$12:f39d  57 79		 eor [$79],y
$12:f39f  87 f7		 sta [$f7]
$12:f3a1  4f ff b6 ff   eor $ffb6ff
$12:f3a5  e4 ff		 cpx $ff
$12:f3a7  f8			sed
$12:f3a8  af fe 27 ff   lda $ff27fe
$12:f3ac  80 a0		 bra $f34e
$12:f3ae  c7 03		 cmp [$03]
$12:f3b0  ff 0f 05 b7   sbc $b7050f,x
$12:f3b4  4f df ee ef   eor $efeedf
$12:f3b8  76 fd		 ror $fd,x
$12:f3ba  7f 34 7f f7   adc $f77f34,x
$12:f3be  27 fb		 and [$fb]
$12:f3c0  d3 fd		 cmp ($fd,s),y
$12:f3c2  39 df 3f	  and $3fdf,y
$12:f3c5  7f 41 df c1   adc $c1df41,x
$12:f3c9  7f f1 1f f9   adc $f91ff1,x
$12:f3cd  07 7e		 ora [$7e]
$12:f3cf  41 ff		 eor ($ff,x)
$12:f3d1  a8			tay
$12:f3d2  7b			tdc
$12:f3d3  f4 46 01	  pea $0146
$12:f3d6  cd fd 95	  cmp $95fd
$12:f3d9  e1 db		 sbc ($db,x)
$12:f3db  59 0f ed	  eor $ed0f,y
$12:f3de  6c 40 c0	  jmp ($c040)
$12:f3e1  ff 60 17 e3   sbc $e31760,x
$12:f3e5  c0 61 8f	  cpy #$8f61
$12:f3e8  83 c1		 sta $c1,s
$12:f3ea  f0 f8		 beq $f3e4
$12:f3ec  7e 3f 1f	  ror $1f3f,x
$12:f3ef  ef f7 ef ab   sbc $abeff7
$12:f3f3  f7 f5		 sbc [$f5],y
$12:f3f5  fe f6 bf	  inc $bff6,x
$12:f3f8  b9 07 ee	  lda $ee07,y
$12:f3fb  9b			txy
$12:f3fc  ff d1 7f af   sbc $af7fd1,x
$12:f400  bf 9c b7 47   lda $47b79c,x
$12:f404  ff e3 ff ec   sbc $ecffe3,x
$12:f408  7f f2 4f fd   adc $fd4ff2,x
$12:f40c  27 ff		 and [$ff]
$12:f40e  a2 ff df	  ldx #$dfff
$12:f411  3f f9 00 68   and $6800f9,x
$12:f415  40			rti
$12:f416  1d e1 fd	  ora $fde1,x
$12:f419  81 fc		 sta ($fc,x)
$12:f41b  61 fe		 adc ($fe,x)
$12:f41d  c8			iny
$12:f41e  fb			xce
$12:f41f  dc 39 13	  jml [$1339]
$12:f422  fe 24 fe	  inc $fe24,x
$12:f425  00 ff		 brk #$ff
$12:f427  db			stp
$12:f428  c7 ff		 cmp [$ff]
$12:f42a  f8			sed
$12:f42b  bd 00 90	  lda $9000,x
$12:f42e  df bf f2 cf   cmp $cff2bf,x
$12:f432  fd 43 ff	  sbc $ff43,x
$12:f435  0c 77 83	  tsb $8377
$12:f438  ff 6d 5e b8   sbc $b85e6d,x
$12:f43c  ff fe 5d ff   sbc $ff5dfe,x
$12:f440  8f 7f c3 21   sta $21c37f
$12:f444  04 ff		 tsb $ff
$12:f446  c2 07		 rep #$07
$12:f448  03 14		 ora $14,s
$12:f44a  7f ec c3 fe   adc $fec3ec,x
$12:f44e  0f 0b f9 40   ora $40f90b
$12:f452  7e 9f ff	  ror $ff9f,x
$12:f455  c7 fe		 cmp [$fe]
$12:f457  a9 ff d0	  lda #$d0ff
$12:f45a  07 be		 ora [$be]
$12:f45c  21 ff		 and ($ff,x)
$12:f45e  b0 3b		 bcs $f49b
$12:f460  c8			iny
$12:f461  e5 0f		 sbc $0f
$12:f463  fd 9e 7f	  sbc $7f9e,x
$12:f466  ea			nop
$12:f467  5d 3b 8f	  eor $8f3b,x
$12:f46a  c6 7b		 dec $7b
$12:f46c  fd bd fe	  sbc $febd,x
$12:f46f  eb			xba
$12:f470  df f9 07 fc   cmp $fc07f9,x
$12:f474  3a			dec a
$12:f475  52 c8		 eor ($c8)
$12:f477  04 3a		 tsb $3a
$12:f479  01 02		 ora ($02,x)
$12:f47b  80 41		 bra $f4be
$12:f47d  1f eb 39 fc   ora $fc39eb,x
$12:f481  cc fe 71	  cpy $71fe
$12:f484  9f cc ff ff   sta $ffffcc,x
$12:f488  2b			pld
$12:f489  fd c5 bf	  sbc $bfc5,x
$12:f48c  f2 8f		 sbc ($8f)
$12:f48e  fc 19 78	  jsr ($7819,x)
$12:f491  10 08		 bpl $f49b
$12:f493  64 01		 stz $01
$12:f495  7e 0f f0	  ror $f00f,x
$12:f498  53 b7		 eor ($b7,s),y
$12:f49a  1f 8f bf df   ora $dfbf8f,x
$12:f49e  fe bf fe	  inc $febf,x
$12:f4a1  5f ff 40 e0   eor $e040ff,x
$12:f4a5  74 0f		 stz $0f,x
$12:f4a7  fc e2 01	  jsr ($01e2,x)
$12:f4aa  40			rti
$12:f4ab  7f df ff 7f   adc $7fffdf,x
$12:f4af  ff db bc 46   sbc $46bcdb,x
$12:f4b3  77 ff		 adc [$ff],y
$12:f4b5  4c 84 6e	  jmp $6e84
$12:f4b8  ff 9b ff 8c   sbc $8cff9b,x
$12:f4bc  c1 de		 cmp ($de,x)
$12:f4be  3f 77 78 94   and $947877,x
$12:f4c2  c0 a6 15	  cpy #$15a6
$12:f4c5  bf fa d4 00   lda $00d4fa,x
$12:f4c9  07 be		 ora [$be]
$12:f4cb  78			sei
$12:f4cc  8e ef ff	  stx $ffef
$12:f4cf  db			stp
$12:f4d0  ff d5 bf ef   sbc $efbfd5,x
$12:f4d4  c0 0f 9b	  cpy #$9b0f
$12:f4d7  c0 1f e1	  cpy #$e11f
$12:f4da  fb			xce
$12:f4db  ff f7 c3 e3   sbc $e3c3f7,x
$12:f4df  fe ef ff	  inc $ffef,x
$12:f4e2  ba			tsx
$12:f4e3  df ef b7 f8   cmp $f8b7ef,x
$12:f4e7  28			plp
$12:f4e8  1a			inc a
$12:f4e9  ff ff bf fd   sbc $fdbfff,x
$12:f4ed  ff fe 8e c3   sbc $c38efe,x
$12:f4f1  fc 3e 12	  jsr ($123e,x)
$12:f4f4  10 90		 bpl $f486
$12:f4f6  8f f8 4b 1c   sta $1c4bf8
$12:f4fa  97 ee		 sta [$ee],y
$12:f4fc  db			stp
$12:f4fd  ff d9 7a eb   sbc $eb7ad9,x
$12:f501  bb			tyx
$12:f502  fa			plx
$12:f503  9f f4 70 01   sta $0170f4,x
$12:f507  a0 bf e4	  ldy #$e4bf
$12:f50a  bf f6 92 98   lda $9892f6,x
$12:f50e  7f e8 3f f8   adc $f83fe8,x
$12:f512  9f ff 5a 5b   sta $5b5aff,x
$12:f516  21 c8		 and ($c8,x)
$12:f518  7f f8 fe ff   adc $fffef8,x
$12:f51c  6f fd a6 1f   adc $1fa6fd
$12:f520  d1 50		 cmp ($50),y
$12:f522  c9 c5 42	  cmp #$42c5
$12:f525  6f 0e bf fc   adc $fcbf0e
$12:f529  e6 1f		 inc $1f
$12:f52b  83 b1		 sta $b1,s
$12:f52d  c1 c5		 cmp ($c5,x)
$12:f52f  43 63		 eor $63,s
$12:f531  bf cc 27 f1   lda $f127cc,x
$12:f535  88			dey
$12:f536  fc 22 1f	  jsr ($1f22,x)
$12:f539  09 87 c2	  ora #$c287
$12:f53c  a1 d1		 lda ($d1,x)
$12:f53e  e8			inx
$12:f53f  f4 f2 79	  pea $79f2
$12:f542  80 80		 bra $f4c4
$12:f544  70 20		 bvs $f566
$12:f546  1e 08 07	  asl $0708,x
$12:f549  c1 48		 cmp ($48,x)
$12:f54b  3f 18 07 86   and $860718,x
$12:f54f  01 c3		 ora ($c3,x)
$12:f551  80 66		 bra $f5b9
$12:f553  3f 13 0f 82   and $820f13,x
$12:f557  c4 2e		 cpy $2e
$12:f559  1f 08 44 22   ora $224408,x
$12:f55d  0c b9 18	  tsb $18b9
$12:f560  64 32		 stz $32
$12:f562  0f 00 87 b0   ora $b08700
$12:f566  0f ef 00 fc   ora $fc00ef
$12:f56a  b2 07		 lda ($07)
$12:f56c  e7 00		 sbc [$00]
$12:f56e  d8			cld
$12:f56f  7c 3b 1f	  jmp ($1f3b,x)
$12:f572  89 64 f2	  bit #$f264
$12:f575  71 38		 adc ($38),y
$12:f577  88			dey
$12:f578  35 c6		 and $c6,x
$12:f57a  41 20		 eor ($20,x)
$12:f57c  80 30		 bra $f5ae
$12:f57e  05 7e		 ora $7e
$12:f580  0a			asl a
$12:f581  d0 e3		 bne $f566
$12:f583  c0 3d ee	  cpy #$ee3d
$12:f586  61 ef		 adc ($ef,x)
$12:f588  c0 3f f0	  cpy #$f03f
$12:f58b  06 d0		 asl $d0
$12:f58d  62 e0 f2	  per $e870
$12:f590  28			plp
$12:f591  0e a3 89	  asl $89a3
$12:f594  05 83		 ora $83
$12:f596  48			pha
$12:f597  a2 1d 09	  ldx #$091d
$12:f59a  84 06		 sty $06
$12:f59c  04 1f		 tsb $1f
$12:f59e  0f 80 7c 63   ora $637c80
$12:f5a2  e8			inx
$12:f5a3  41 0f		 eor ($0f,x)
$12:f5a5  86 3c		 stx $3c
$12:f5a7  3e 81 1f	  rol $1f81,x
$12:f5aa  0f 53 f4 1f   ora $1ff453
$12:f5ae  60			rts
$12:f5af  f9 07 b8	  sbc $b807,y
$12:f5b2  3d 41 e6	  and $e641,x
$12:f5b5  10 88		 bpl $f53f
$12:f5b7  24 57		 bit $57
$12:f5b9  4c 09 44	  jmp $4409
$12:f5bc  28			plp
$12:f5bd  01 40		 ora ($40,x)
$12:f5bf  10 1f		 bpl $f5e0
$12:f5c1  3f fd e3 ff   and $ffe3fd,x
$12:f5c5  40			rti
$12:f5c6  ff e0 1d a0   sbc $a01de0,x
$12:f5ca  50 32		 bvc $f5fe
$12:f5cc  ba			tsx
$12:f5cd  97 f5		 sta [$f5],y
$12:f5cf  12 06		 ora ($06)
$12:f5d1  f2 0f		 sbc ($0f)
$12:f5d3  46 7c		 lsr $7c
$12:f5d5  fe 7b f4	  inc $f47b,x
$12:f5d8  2b			pld
$12:f5d9  fe ff bf	  inc $bfff,x
$12:f5dc  bf 6a 44 3b   lda $3b446a,x
$12:f5e0  7e fe fa	  ror $fafe,x
$12:f5e3  59 7e 3f	  eor $3f7e,y
$12:f5e6  1f 0a 84 78   ora $78840a,x
$12:f5ea  7c 3c 3a	  jmp ($3a3c,x)
$12:f5ed  9c 71 ea	  stz $ea71
$12:f5f0  b1 0f		 lda ($0f),y
$12:f5f2  17 ec		 ora [$ec],y
$12:f5f4  3c 7f 7f	  bit $7f7f,x
$12:f5f7  ff ad 70 21   sbc $2170ad,x
$12:f5fb  e3 fd		 sbc $fd,s
$12:f5fd  ef d6 a7 f7   sbc $f7a7d6
$12:f601  5d 8c f3	  eor $f38c,x
$12:f604  ff 66 f3 de   sbc $def366,x
$12:f608  bf 7d 6f fe   lda $fe6f7d,x
$12:f60c  8b			phb
$12:f60d  ff 04 28 0b   sbc $0b2804,x
$12:f611  f8			sed
$12:f612  0b			phd
$12:f613  e1 18		 sbc ($18,x)
$12:f615  80 41		 bra $f658
$12:f617  0b			phd
$12:f618  f3 bf		 sbc ($bf,s),y
$12:f61a  b5 ff		 lda $ff,x
$12:f61c  e3 5b		 sbc $5b,s
$12:f61e  fb			xce
$12:f61f  56 ff		 lsr $ff,x
$12:f621  81 db		 sta ($db,x)
$12:f623  da			phx
$12:f624  76 f5		 ror $f5,x
$12:f626  bc fe 9f	  ldy $9ffe,x
$12:f629  3f 6b 2f ff   and $ff2f6b,x
$12:f62d  c6 ff		 dec $ff
$12:f62f  fa			plx
$12:f630  ef fe 0b ff   sbc $ff0bfe
$12:f634  90 ff		 bcc $f635
$12:f636  f2 7f		 sbc ($7f)
$12:f638  fe 3f ff	  inc $ff3f,x
$12:f63b  15 62		 ora $62,x
$12:f63d  13 bf		 ora ($bf,s),y
$12:f63f  fe d7 ff	  inc $ffd7,x
$12:f642  62 ff c8	  per $bf44
$12:f645  7f f0 9d fd   adc $fd9df0,x
$12:f649  0f 9f 91 ff   ora $ff919f
$12:f64d  e0 f7 6b	  cpx #$6bf7
$12:f650  63 25		 adc $25,s
$12:f652  84 af		 sty $af
$12:f654  ff 07 ff e8   sbc $e8ff07,x
$12:f658  ff fc 7f ff   sbc $ff7ffc,x
$12:f65c  f7 fb		 sbc [$fb],y
$12:f65e  fc fe 7f	  jsr ($7ffe,x)
$12:f661  bf c7 42 fe   lda $fe42c7,x
$12:f665  ff ff 9f ff   sbc $ff9fff,x
$12:f669  d0 bc		 bne $f627
$12:f66b  3f c3 b0 ff   and $ffb0c3,x
$12:f66f  0e 48 8c	  asl $8c48
$12:f672  5f 82 58 7e   eor $7e5882,x
$12:f676  7e ff 9f	  ror $9fff,x
$12:f679  f9 44 87	  sbc $8744,y
$12:f67c  20 57 44	  jsr $4457
$12:f67f  f8			sed
$12:f680  7e 4c 26	  ror $264c,x
$12:f683  2f 03 3a 39   and $393a03
$12:f687  0a			asl a
$12:f688  11 08		 ora ($08),y
$12:f68a  85 42		 sta $42
$12:f68c  a0 b0 58	  ldy #$58b0
$12:f68f  3c 1e 1d	  bit $1d1e,x
$12:f692  0e 8f c7	  asl $c78f
$12:f695  db			stp
$12:f696  c0 de 0f	  cpy #$0fde
$12:f699  bc 03 eb	  ldy $eb03,x
$12:f69c  00 fd		 brk #$fd
$12:f69e  40			rti
$12:f69f  3f 10 0f 8c   and $8c0f10,x
$12:f6a3  03 c1		 ora $c1,s
$12:f6a5  00 ec		 brk #$ec
$12:f6a7  ed d1 f3	  sbc $f3d1
$12:f6aa  f7 4d		 sbc [$4d],y
$12:f6ac  84 05		 sty $05
$12:f6ae  3e 78 15	  rol $1578,x
$12:f6b1  29 f0 55	  and #$55f0
$12:f6b4  62 9b 22	  per $1952
$12:f6b7  78			sei
$12:f6b8  ac 9d 56	  ldy $569d
$12:f6bb  5e 16 19	  lsr $1916,x
$12:f6be  97 c1		 sta [$c1],y
$12:f6c0  92 54		 sta ($54)
$12:f6c2  8b			phb
$12:f6c3  c4 5e		 cpy $5e
$12:f6c5  3f 09 87 c2   and $c28709,x
$12:f6c9  21 f2		 and ($f2,x)
$12:f6cb  89 7d 42	  bit #$427d
$12:f6ce  bf e0 ff cf   lda $cfffe0,x
$12:f6d2  e7 f8		 sbc [$f8]
$12:f6d4  74 60		 stz $60,x
$12:f6d6  fc 1c 43	  jsr ($431c,x)
$12:f6d9  d0 80		 bne $f65b
$12:f6db  68			pla
$12:f6dc  0d e3 c0	  ora $c0e3
$12:f6df  80 50		 bra $f731
$12:f6e1  24 10		 bit $10
$12:f6e3  18			clc
$12:f6e4  15 22		 ora $22,x
$12:f6e6  71 04		 adc ($04),y
$12:f6e8  81 1c		 sta ($1c,x)
$12:f6ea  42 53		 wdm #$53
$12:f6ec  2e 38 85	  rol $8538
$12:f6ef  12 4c		 ora ($4c)
$12:f6f1  35 2c		 and $2c,x
$12:f6f3  38			sec
$12:f6f4  d4 bf		 pei ($bf)
$12:f6f6  fd 01 a8	  sbc $a801,x
$12:f6f9  94 40		 sty $40,x
$12:f6fb  e2 1c		 sep #$1c
$12:f6fd  29 21 c4	  and #$c421
$12:f700  26 50		 rol $50
$12:f702  e7 79		 sbc [$79]
$12:f704  68			pla
$12:f705  38			sec
$12:f706  11 08		 ora ($08),y
$12:f708  40			rti
$12:f709  1c 0f c0	  trb $c00f
$12:f70c  07 0e		 ora [$0e]
$12:f70e  08			php
$12:f70f  10 c4		 bpl $f6d5
$12:f711  24 6f		 bit $6f
$12:f713  18			clc
$12:f714  15 00		 ora $00,x
$12:f716  de 31 28	  dec $2831,x
$12:f719  71 c4		 adc ($c4),y
$12:f71b  4d e2 04	  eor $04e2
$12:f71e  30 28		 bmi $f748
$12:f720  f8			sed
$12:f721  47 ea		 eor [$ea]
$12:f723  6f 2b 45 c2   adc $c2452b
$12:f727  01 01		 ora ($01,x)
$12:f729  80 48		 bra $f773
$12:f72b  20 86 f2	  jsr $f286
$12:f72e  1f 18 0d 09   ora $090d18,x
$12:f732  2d 20 1c	  and $1c20
$12:f735  84 06		 sty $06
$12:f737  20 5a 3a	  jsr $3a5a
$12:f73a  c4 e0		 cpy $e0
$12:f73c  62 02 90	  per $8741
$12:f73f  ef 99 1c 06   sbc $061c99
$12:f743  45 a1		 eor $a1
$12:f745  3a			dec a
$12:f746  8e cb 82	  stx $82cb
$12:f749  39 27 68	  and $6827,y
$12:f74c  0f 5a 1e 64   ora $641e5a
$12:f750  7d 05 46	  adc $4605,x
$12:f753  a1 a3		 lda ($a3,x)
$12:f755  f8			sed
$12:f756  c3 be		 cmp $be,s
$12:f758  70 cb		 bvs $f725
$12:f75a  6c 0b 1f	  jmp ($1f0b)
$12:f75d  80 bb		 bra $f71a
$12:f75f  7c 24 3f	  jmp ($3f24,x)
$12:f762  15 99		 ora $99,x
$12:f764  03 80		 ora $80,s
$12:f766  1c 16 fc	  trb $fc16
$12:f769  86 3e		 stx $3e
$12:f76b  e1 f6		 sbc ($f6,x)
$12:f76d  84 ac		 sty $ac
$12:f76f  c2 11		 rep #$11
$12:f771  f9 d7 57	  sbc $57d7,y
$12:f774  fa			plx
$12:f775  92 fb		 sta ($fb)
$12:f777  94 37		 sty $37,x
$12:f779  5b			tcd
$12:f77a  82 e7 f4	  brl $ec64
$12:f77d  29 df 0c	  and #$0cdf
$12:f780  35 c3		 and $c3,x
$12:f782  f3 06		 sbc ($06,s),y
$12:f784  61 95		 adc ($95,x)
$12:f786  ff 01 af a8   sbc $a8af01,x
$12:f78a  77 e4		 adc [$e4],y
$12:f78c  1f e8 0b 2c   ora $2c0be8,x
$12:f790  3b			tsc
$12:f791  f2 bf		 sbc ($bf)
$12:f793  fe 37 df	  inc $df37,x
$12:f796  15 f7		 ora $f7,x
$12:f798  cc 7e 78	  cpy $787e
$12:f79b  cf f7 47 ff   cmp $ff47f7
$12:f79f  d4 ff		 pei ($ff)
$12:f7a1  fe 31 7f	  inc $7f31,x
$12:f7a4  fe 7f ff	  inc $ff7f,x
$12:f7a7  0b			phd
$12:f7a8  ff d1 91 87   sbc $8791d1,x
$12:f7ac  a1 ff		 lda ($ff,x)
$12:f7ae  fb			xce
$12:f7af  7f ff 3f ff   adc $ff3fff,x
$12:f7b3  dc 34 54	  jml [$5434]
$12:f7b6  1f ba b7 fe   ora $feb7ba,x
$12:f7ba  d9 bf a6	  cmp $a6bf,y
$12:f7bd  53 f7		 eor ($f7,s),y
$12:f7bf  3f b9 2f fe   and $fe2fb9,x
$12:f7c3  e7 b9		 sbc [$b9]
$12:f7c5  ff d7 ff ff   sbc $ffffd7,x
$12:f7c9  3f fd b7 ff   and $ffb7fd,x
$12:f7cd  0e ff c2	  asl $c2ff
$12:f7d0  7f f7 15 58   adc $5815f7,x
$12:f7d4  ff 7f 83 00   sbc $00837f,x
$12:f7d8  ff 7f bf 5f   sbc $5fbf7f,x
$12:f7dc  ef d8 b8 3f   sbc $3fb8d8
$12:f7e0  ff af ef e7   sbc $e7efaf,x
$12:f7e4  f1 fd		 sbc ($fd),y
$12:f7e6  fd 7f 3f	  sbc $3f7f,x
$12:f7e9  7f ef c9 0c   adc $0cc9ef,x
$12:f7ed  1f a0 47 22   ora $2247a0,x
$12:f7f1  20 1c 84	  jsr $841c
$12:f7f4  a2 30 32	  ldx #$3230
$12:f7f7  a8			tay
$12:f7f8  c1 e0		 cmp ($e0,x)
$12:f7fa  f0 f8		 beq $f7f4
$12:f7fc  7c fe 7e	  jmp ($7efe,x)
$12:f7ff  e1 02		 sbc ($02,x)
$12:f801  70 13		 bvs $f816
$12:f803  83 f8		 sta $f8,s
$12:f805  64 1f		 stz $1f
$12:f807  c4 03		 cpy $03
$12:f809  e0 9a 19	  cpx #$199a
$12:f80c  f4 fb 1f	  pea $1ffb
$12:f80f  8f e1 f0 f9   sta $f9f0e1
$12:f813  bc fd f6	  ldy $f6fd,x
$12:f816  ff f4 0c 17   sbc $170cf4,x
$12:f81a  d0 25		 bne $f841
$12:f81c  82 e1 00	  brl $f900
$12:f81f  9e 40 26	  stz $2640,x
$12:f822  10 0a		 bpl $f82e
$12:f824  02 70		 cop #$70
$12:f826  51 4d		 eor ($4d),y
$12:f828  80 c0		 bra $f7ea
$12:f82a  62 31 1a	  per $125e
$12:f82d  4d 25 72	  eor $7225
$12:f830  b9 ae d7	  lda $d7ae,y
$12:f833  6e b7 4e	  ror $4eb7
$12:f836  13 80		 ora ($80,s),y
$12:f838  5d e0 15	  eor $15e0,x
$12:f83b  b8			clv
$12:f83c  06 8e		 asl $8e
$12:f83e  01 51		 ora ($51,x)
$12:f840  80 51		 bra $f893
$12:f842  51 43		 eor ($43),y
$12:f844  0a			asl a
$12:f845  85 47		 sta $47
$12:f847  23 90		 and $90,s
$12:f849  e8			inx
$12:f84a  74 d2		 stz $d2,x
$12:f84c  69 7e bf	  adc #$bf7e
$12:f84f  73 b9		 adc ($b9,s),y
$12:f851  d3 c9		 cmp ($c9,s),y
$12:f853  e3 84		 sbc $84,s
$12:f855  3e b0 0f	  rol $0fb0,x
$12:f858  1c 03 e3	  trb $e303
$12:f85b  00 e5		 brk #$e5
$12:f85d  c0 30 30	  cpy #$3030
$12:f860  09 8c 03	  ora #$038c
$12:f863  86 8a		 stx $8a
$12:f865  3e 07 02	  rol $0207,x
$12:f868  4d e6 87	  eor $87e6
$12:f86b  ff e2 5f 2b   sbc $2b5fe2,x
$12:f86f  0f 85 a6 09   ora $09a685
$12:f873  f2 9f		 sbc ($9f)
$12:f875  c0 23 28	  cpy #$2823
$12:f878  a1 86		 lda ($86,x)
$12:f87a  c0 23 ce	  cpy #$ce23
$12:f87d  21 c6		 and ($c6,x)
$12:f87f  ef 8b c1 8d   sbc $8dc18b
$12:f883  c6 c5		 dec $c5
$12:f885  f2 f2		 sbc ($f2)
$12:f887  ea			nop
$12:f888  ff 1b f3 38   sbc $38f31b,x
$12:f88c  71 84		 adc ($84),y
$12:f88e  02 80		 cop #$80
$12:f890  9f 1b 97 fe   sta $fe971b,x
$12:f894  d0 9f		 bne $f835
$12:f896  1f 84 3e 7c   ora $7c3e84,x
$12:f89a  7f 0f fe 77   adc $77fe0f,x
$12:f89e  37 43		 and [$43],y
$12:f8a0  df ea 74 bc   cmp $bc74ea,x
$12:f8a4  4e 36 9b	  lsr $9b36
$12:f8a7  4b			phk
$12:f8a8  da			phx
$12:f8a9  fe e4 6d	  inc $6de4,x
$12:f8ac  d6 3b		 dec $3b,x
$12:f8ae  fd 81 3e	  sbc $3e81,x
$12:f8b1  35 2f		 and $2f,x
$12:f8b3  fc e7 ff	  jsr ($ffe7,x)
$12:f8b6  58			cli
$12:f8b7  4f 8c 9b b3   eor $b39b8c
$12:f8bb  7f c0 5d 7f   adc $7f5dc0,x
$12:f8bf  dc cf 6e	  jml [$6ecf]
$12:f8c2  f3 7b		 sbc ($7b,s),y
$12:f8c4  53 ab		 eor ($ab,s),y
$12:f8c6  4f 27 74 9f   eor $9f7427
$12:f8ca  bc e3 90	  ldy $90e3,x
$12:f8cd  8a			txa
$12:f8ce  16 c0		 asl $c0,x
$12:f8d0  7f e8 5f fd   adc $fd5fe8,x
$12:f8d4  41 f8		 eor ($f8,x)
$12:f8d6  3f d0 3f e4   and $e43fd0,x
$12:f8da  23 ee		 and $ee,s
$12:f8dc  a0 0f 57	  ldy #$570f
$12:f8df  d6 15		 dec $15,x
$12:f8e1  ea			nop
$12:f8e2  ab			plb
$12:f8e3  f5 f1		 sbc $f1,x
$12:f8e5  b0 f8		 bcs $f8df
$12:f8e7  36 1b		 rol $1b,x
$12:f8e9  95 4e		 sta $4e,x
$12:f8eb  f2 66		 sbc ($66)
$12:f8ed  e4 93		 cpx $93
$12:f8ef  c0 48 65	  cpy #$6548
$12:f8f2  6f f2 8f fd   adc $fd8ff2
$12:f8f6  c3 ff		 cmp $ff,s
$12:f8f8  79 ff cc	  adc $ccff,y
$12:f8fb  7f f8 0b fc   adc $fc0bf8,x
$12:f8ff  f3 87		 sbc ($87,s),y
$12:f901  5c d2 7c ff   jml $ff7cd2
$12:f905  b2 de		 lda ($de)
$12:f907  f7 cb		 sbc [$cb],y
$12:f909  fb			xce
$12:f90a  55 ab		 eor $ab,x
$12:f90c  4e e7 9d	  lsr $9de7
$12:f90f  59 5e 63	  eor $635e,y
$12:f912  f1 04		 sbc ($04),y
$12:f914  fd c0 7f	  sbc $7fc0,x
$12:f917  ca			dex
$12:f918  01 22		 ora ($22,x)
$12:f91a  0b			phd
$12:f91b  78			sei
$12:f91c  09 21 f8	  ora #$f821
$12:f91f  83 c7		 sta $c7,s
$12:f921  6f a8 f0 8f   adc $8ff0a8
$12:f925  df d2 69 3f   cmp $3f69d2,x
$12:f929  bf ff ff f7   lda $f7ffff,x
$12:f92d  dc 1a 7c	  jml [$7c1a]
$12:f930  2f ea 22 c3   and $c322ea
$12:f934  df f1 f7 fd   cmp $fdf7f1,x
$12:f938  fa			plx
$12:f939  74 23		 stz $23,x
$12:f93b  97 c5		 sta [$c5],y
$12:f93d  7d 23 c2	  adc $c223,x
$12:f940  f9 83 5f	  sbc $5f83,y
$12:f943  d2 84		 cmp ($84)
$12:f945  07 a1		 ora [$a1]
$12:f947  1b			tcs
$12:f948  8d f3 39	  sta $39f3
$12:f94b  9f 8f c7 9c   sta $9cc78f,x
$12:f94f  0c 3c c9	  tsb $c93c
$12:f952  9c fd 12	  stz $12fd
$12:f955  10 0f		 bpl $f966
$12:f957  24 02		 bit $02
$12:f959  67 00		 adc [$00]
$12:f95b  83 8f		 sta $8f,s
$12:f95d  45 cc		 eor $cc
$12:f95f  9a			txs
$12:f960  0d 05 42	  ora $4205
$12:f963  a1 70		 lda ($70,x)
$12:f965  b8			clv
$12:f966  7b			tdc
$12:f967  ff fd 7f 7c   sbc $7c7ffd,x
$12:f96b  63 cf		 adc $cf,s
$12:f96d  3e e0 b6	  rol $b6e0,x
$12:f970  02 bf		 cop #$bf
$12:f972  00 d7		 brk #$d7
$12:f974  c0 31 ee	  cpy #$ee31
$12:f977  67 1e		 adc [$1e]
$12:f979  84 32		 sty $32
$12:f97b  19 36 9b	  ora $9b36,y
$12:f97e  5a			phy
$12:f97f  2f 1d ff fc   and $fcff1d
$12:f983  7f ff 2b ef   adc $ef2bff,x
$12:f987  dc 31 ff	  jml [$ff31]
$12:f98a  c8			iny
$12:f98b  1f ce 01 c9   ora $c901ce,x
$12:f98f  80 61		 bra $f9f2
$12:f991  c0 92 ec	  cpy #$ec92
$12:f994  08			php
$12:f995  3c 1e 3e	  bit $3e1e,x
$12:f998  17 0f		 ora [$0f],y
$12:f99a  ff 3b ff 60   sbc $60ff3b,x
$12:f99e  45 0c		 eor $0c
$12:f9a0  3f e0 d8 0f   and $0fd8e0,x
$12:f9a4  c4 03		 cpy $03
$12:f9a6  c0 04 94	  cpy #$9404
$12:f9a9  e8			inx
$12:f9aa  27 41		 and [$41]
$12:f9ac  38			sec
$12:f9ad  19 9f fd	  ora $fd9f,y
$12:f9b0  13 ff		 ora ($ff,s),y
$12:f9b2  a0 6c 0f	  ldy #$0f6c
$12:f9b5  8e 38 24	  stx $2438
$12:f9b8  b7 60		 lda [$60],y
$12:f9ba  fa			plx
$12:f9bb  ff fa 2f ff   sbc $ff2ffa,x
$12:f9bf  17 ff		 ora [$ff],y
$12:f9c1  2a			rol a
$12:f9c2  fb			xce
$12:f9c3  e3 3e		 sbc $3e,s
$12:f9c5  71 ff		 adc ($ff),y
$12:f9c7  05 ff		 ora $ff
$12:f9c9  00 fd		 brk #$fd
$12:f9cb  02 ff		 cop #$ff
$12:f9cd  13 c9		 ora ($c9,s),y
$12:f9cf  5a			phy
$12:f9d0  01 50		 ora ($50,x)
$12:f9d2  9b			txy
$12:f9d3  7f e1 3f ff   adc $ff3fe1,x
$12:f9d7  00 5c		 brk #$5c
$12:f9d9  0f df f0 fc   ora $fcf0df
$12:f9dd  7d bf c6	  adc $c6bf,x
$12:f9e0  f0 f1		 beq $f9d3
$12:f9e2  ff fa 7f fc   sbc $fc7ffa,x
$12:f9e6  3f ff 15 7f   and $7f15ff,x
$12:f9ea  e0 4f dc	  cpx #$dc4f
$12:f9ed  a1 01		 lda ($01,x)
$12:f9ef  51 67		 eor ($67),y
$12:f9f1  c2 79		 rep #$79
$12:f9f3  3c 87 43	  bit $4387,x
$12:f9f6  86 21		 stx $21
$12:f9f8  0b			phd
$12:f9f9  85 8c		 sta $8c
$12:f9fb  42 05		 wdm #$05
$12:f9fd  02 82		 cop #$82
$12:f9ff  41 21		 eor ($21,x)
$12:fa01  f0 0e		 beq $fa11
$12:fa03  1c 03 e2	  trb $e203
$12:fa06  40			rti
$12:fa07  1f a1 00 7f   ora $7f00a1,x
$12:fa0b  b0 0f		 bcs $fa1c
$12:fa0d  dc 00 00	  jml [$0000]
$12:fa10  08			php
$12:fa11  81 40		 sta ($40,x)
$12:fa13  1d e9 10	  ora $10e9,x
$12:fa16  88			dey
$12:fa17  bd d6 02	  lda $02d6,x
$12:fa1a  ff 17 c2 e4   sbc $e4c217,x
$12:fa1e  20 20 b0	  jsr $b020
$12:fa21  7b			tdc
$12:fa22  8c 48 1e	  sty $1e48
$12:fa25  55 00		 eor $00,x
$12:fa27  90 85		 bcc $f9ae
$12:fa29  ce 04 ff	  dec $ff04
$12:fa2c  00 b9		 brk #$b9
$12:fa2e  3f c4 40 01   and $0140c4,x
$12:fa32  46 91		 lsr $91
$12:fa34  03 50		 ora $50,s
$12:fa36  1a			inc a
$12:fa37  32 28		 and ($28)
$12:fa39  84 0e		 sty $0e
$12:fa3b  21 04		 and ($04,x)
$12:fa3d  88			dey
$12:fa3e  44 e2 11	  mvp $11,$e2
$12:fa41  42 19		 wdm #$19
$12:fa43  90 08		 bcc $fa4d
$12:fa45  84 04		 sty $04
$12:fa47  00 23		 brk #$23
$12:fa49  21 10		 and ($10,x)
$12:fa4b  0a			asl a
$12:fa4c  04 f8		 tsb $f8
$12:fa4e  09 0b dc	  ora #$dc0b
$12:fa51  64 65		 stz $65
$12:fa53  f5 31		 sbc $31,x
$12:fa55  13 e0		 ora ($e0,s),y
$12:fa57  8d c8 6e	  sta $6ec8
$12:fa5a  83 52		 sta $52,s
$12:fa5c  21 06		 and ($06,x)
$12:fa5e  1d 2e 87	  ora $872e,x
$12:fa61  43 e1		 eor $e1,s
$12:fa63  d0 c8		 bne $fa2d
$12:fa65  74 34		 stz $34,x
$12:fa67  be 43 b3	  ldx $b343,y
$12:fa6a  08			php
$12:fa6b  11 88		 ora ($88),y
$12:fa6d  22 54 e9 7d   jsl $7de954
$12:fa71  3a			dec a
$12:fa72  1d 4e 85	  ora $854e,x
$12:fa75  d3 a3		 cmp ($a3,s),y
$12:fa77  d9 28 bd	  cmp $bd28,y
$12:fa7a  4a			lsr a
$12:fa7b  2b			pld
$12:fa7c  92 83		 sta ($83)
$12:fa7e  ab			plb
$12:fa7f  c2 25		 rep #$25
$12:fa81  15 58		 ora $58,x
$12:fa83  87 4a		 sta [$4a]
$12:fa85  21 92		 and ($92,x)
$12:fa87  08			php
$12:fa88  82 c8 23	  brl $1e53
$12:fa8b  0c 11 84	  tsb $8411
$12:fa8e  44 a0 f5	  mvp $f5,$a0
$12:fa91  28			plp
$12:fa92  32 cc		 and ($cc)
$12:fa94  3a			dec a
$12:fa95  50 68		 bvc $faff
$12:fa97  93 38		 sta ($38,s),y
$12:fa99  21 19		 and ($19,x)
$12:fa9b  26 50		 rol $50
$12:fa9d  31 86		 and ($86),y
$12:fa9f  24 b6		 bit $b6
$12:faa1  08			php
$12:faa2  bf 49 70 01   lda $017049,x
$12:faa6  11 a9		 ora ($a9),y
$12:faa8  45 a2		 eor $a2
$12:faaa  4e 40 8c	  lsr $8c40
$12:faad  34 41		 bit $41,x
$12:faaf  c6 31		 dec $31
$12:fab1  88			dey
$12:fab2  f4 3a 3d	  pea $3d3a
$12:fab5  0f 8f 3c c2   ora $c23c8f
$12:fab9  3e ef 19	  rol $19ef,x
$12:fabc  7b			tdc
$12:fabd  cc 61 79	  cpy $7961
$12:fac0  e9 66 7a	  sbc #$7a66
$12:fac3  5b			tcd
$12:fac4  52 81		 eor ($81)
$12:fac6  44 a0 2f	  mvp $2f,$a0
$12:fac9  f2 02		 sbc ($02)
$12:facb  80 15		 bra $fae2
$12:facd  e0 51 e9	  cpx #$e951
$12:fad0  73 c4		 adc ($c4,s),y
$12:fad2  61 91		 adc ($91,x)
$12:fad4  e8			inx
$12:fad5  6b			rtl
$12:fad6  bc 63 6f	  ldy $6f63,x
$12:fad9  b2 8f		 lda ($8f)
$12:fadb  47 23		 eor [$23]
$12:fadd  d1 d0		 cmp ($d0),y
$12:fadf  d9 3f c3	  cmp $c33f,y
$12:fae2  bd 2b 05	  lda $052b,x
$12:fae5  a0 c4 00	  ldy #$00c4
$12:fae8  65 50		 adc $50
$12:faea  51 01		 eor ($01),y
$12:faec  c1 14		 cmp ($14,x)
$12:faee  04 80		 tsb $80
$12:faf0  1c f4 ac	  trb $acf4
$12:faf3  22 84 f5 80   jsl $80f584
$12:faf7  b7 ca		 lda [$ca],y
$12:faf9  3d 2c af	  and $af2c,x
$12:fafc  0e 80 c0	  asl $c080
$12:faff  52 b8		 eor ($b8)
$12:fb01  f4 b4 3e	  pea $3eb4
$12:fb04  b3 f2		 lda ($f2,s),y
$12:fb06  fa			plx
$12:fb07  1b			tcs
$12:fb08  44 50 53	  mvp $53,$50
$12:fb0b  e7 a8		 sbc [$a8]
$12:fb0d  d2 e3		 cmp ($e3)
$12:fb0f  d4 c4		 pei ($c4)
$12:fb11  39 d7 e3	  and $e3d7,y
$12:fb14  d6 f8		 dec $f8,x
$12:fb16  f5 36		 sbc $36,x
$12:fb18  3d 4e 89	  and $894e,x
$12:fb1b  40			rti
$12:fb1c  12 e1		 ora ($e1)
$12:fb1e  1e af 26	  asl $26af,x
$12:fb21  45 28		 eor $28
$12:fb23  29 f3 b7	  and #$b7f3
$12:fb26  26 46		 rol $46
$12:fb28  78			sei
$12:fb29  97 0a		 sta [$0a],y
$12:fb2b  f4 3e bd	  pea $bd3e
$12:fb2e  0e af 47	  asl $47af
$12:fb31  eb			xba
$12:fb32  c9 b0 58	  cmp #$58b0
$12:fb35  04 ba		 tsb $ba
$12:fb37  bd 0d af	  lda $af0d,x
$12:fb3a  43 3b		 eor $3b,s
$12:fb3c  d2 de		 cmp ($de)
$12:fb3e  f4 b0 06	  pea $06b0
$12:fb41  15 28		 ora $28,x
$12:fb43  0a			asl a
$12:fb44  fc e0 2c	  jsr ($2ce0,x)
$12:fb47  56 0a		 lsr $0a,x
$12:fb49  85 7a		 sta $7a
$12:fb4b  5e b1 18	  lsr $18b1,x
$12:fb4e  5a			phy
$12:fb4f  d4 63		 pei ($63)
$12:fb51  b5 e8		 lda $e8,x
$12:fb53  e2 ec		 sep #$ec
$12:fb55  ab			plb
$12:fb56  d1 b6		 cmp ($b6),y
$12:fb58  ca			dex
$12:fb59  13 c1		 ora ($c1,s),y
$12:fb5b  92 8e		 sta ($8e)
$12:fb5d  f4 2a 82	  pea $822a
$12:fb60  fc 47 42	  jsr ($4247,x)
$12:fb63  c5 31		 cmp $31
$12:fb65  d0 33		 bne $fb9a
$12:fb67  04 be		 tsb $be
$12:fb69  55 e9		 eor $e9,x
$12:fb6b  69 95		 adc #$95
$12:fb6d  ab			plb
$12:fb6e  cc 20 57	  cpy $5720
$12:fb71  05 b8		 ora $b8
$12:fb73  3e 33 ca	  rol $ca33,x
$12:fb76  f5 3a		 sbc $3a,x
$12:fb78  bd 4d 13	  lda $134d,x
$12:fb7b  9b			txy
$12:fb7c  80 96		 bra $fb14
$12:fb7e  81 3e		 sta ($3e,x)
$12:fb80  07 a9		 ora [$a9]
$12:fb82  90 1d		 bcc $fba1
$12:fb84  05 3f		 ora $3f
$12:fb86  5a			phy
$12:fb87  80 7c		 bra $fc05
$12:fb89  08			php
$12:fb8a  e5 5e		 sbc $5e
$12:fb8c  26 85		 rol $85
$12:fb8e  be bd 5f	  ldx $5fbd,y
$12:fb91  13 9d		 ora ($9d,s),y
$12:fb93  32 bd		 and ($bd)
$12:fb95  4b			phk
$12:fb96  2b			pld
$12:fb97  9c f6 bd	  stz $bdf6
$12:fb9a  4f 2f 94 78   eor $78942f
$12:fb9e  cc 13 d3	  cpy $d313
$12:fba1  39 44 24	  and $2444,y
$12:fba4  71 08		 adc ($08),y
$12:fba6  bc 42 22	  ldy $2242,x
$12:fba9  6f 00 b9 05   adc $05b900
$12:fbad  ca			dex
$12:fbae  21 18		 and ($18,x)
$12:fbb0  39 8a 08	  and $088a,y
$12:fbb3  79 d2 de	  adc $ded2,y
$12:fbb6  73 08		 adc ($08,s),y
$12:fbb8  34 55		 bit $55,x
$12:fbba  2d 09 cc	  and $cc09
$12:fbbd  60			rts
$12:fbbe  91 08		 sta ($08),y
$12:fbc0  9c 42 28	  stz $2842
$12:fbc3  93 13		 sta ($13,s),y
$12:fbc5  a0 40 d2	  ldy #$d240
$12:fbc8  22 92 04 e0   jsl $e00492
$12:fbcc  1d 01 28	  ora $2801,x
$12:fbcf  89 20		 bit #$20
$12:fbd1  88			dey
$12:fbd2  c5 a6		 cmp $a6
$12:fbd4  d1 6a		 cmp ($6a),y
$12:fbd6  b4 5a		 ldy $5a,x
$12:fbd8  8d 16 b3	  sta $b316
$12:fbdb  1c c2 29	  trb $29c2
$12:fbde  24 40		 bit $40
$12:fbe0  95 4a		 sta $4a,x
$12:fbe2  4b			phk
$12:fbe3  52 83		 eor ($83)
$12:fbe5  74 8f		 stz $8f,x
$12:fbe7  41 26		 eor ($26,x)
$12:fbe9  89 41		 bit #$41
$12:fbeb  a2 4c 60	  ldx #$604c
$12:fbee  93 64		 sta ($64,s),y
$12:fbf0  8f 43 d2 93   sta $93d243
$12:fbf4  74 a4		 stz $a4,x
$12:fbf6  bd 28 36	  lda $3628,x
$12:fbf9  49 8c		 eor #$8c
$12:fbfb  11 0c		 ora ($0c),y
$12:fbfd  93 20		 sta ($20,s),y
$12:fbff  10 05		 bpl $fc06
$12:fc01  21 70		 and ($70,x)
$12:fc03  85 41		 sta $41
$12:fc05  8c 12 17	  sty $1712
$12:fc08  3a			dec a
$12:fc09  43 9d		 eor $9d,s
$12:fc0b  e1 0f		 sbc ($0f,x)
$12:fc0d  87 47		 sta [$47]
$12:fc0f  a1 d1		 lda ($d1,x)
$12:fc11  f7 78		 sbc [$78],y
$12:fc13  cb			wai
$12:fc14  de 63 0b	  dec $0b63,x
$12:fc17  77 8c		 adc [$8c],y
$12:fc19  6d e6 33	  adc $33e6
$12:fc1c  f8			sed
$12:fc1d  74 72		 stz $72,x
$12:fc1f  1d 1d 87	  ora $871d,x
$12:fc22  4f 9e a1 4e   eor $4ea19e
$12:fc26  87 d3		 sta [$d3]
$12:fc28  a1 d1		 lda ($d1,x)
$12:fc2a  6d bc 5b	  adc $5bbc
$12:fc2d  9a			txs
$12:fc2e  07 38		 ora [$38]
$12:fc30  64 3a		 stz $3a
$12:fc32  1b			tcs
$12:fc33  18			clc
$12:fc34  a8			tay
$12:fc35  46 2a		 lsr $2a
$12:fc37  31 8b		 and ($8b),y
$12:fc39  04 42		 tsb $42
$12:fc3b  c3 18		 cmp $18,s
$12:fc3d  a9 07		 lda #$07
$12:fc3f  c0 4a 36	  cpy #$364a
$12:fc42  00 79		 brk #$79
$12:fc44  53 81		 eor ($81,s),y
$12:fc46  c1 1e		 cmp ($1e,x)
$12:fc48  07 8c		 ora [$8c]
$12:fc4a  ba			tsx
$12:fc4b  9d 0d a7	  sta $a70d,x
$12:fc4e  43 29		 eor $29,s
$12:fc50  d1 da		 cmp ($da),y
$12:fc52  74 70		 stz $70,x
$12:fc54  66 33		 ror $33
$12:fc56  e8			inx
$12:fc57  d5 6e		 cmp $6e,x
$12:fc59  b5 5b		 lda $5b,x
$12:fc5b  8d 5a eb	  sta $eb5a
$12:fc5e  56 b8		 lsr $b8,x
$12:fc60  a4 a6		 ldy $a6
$12:fc62  a9 19		 lda #$19
$12:fc64  27 94		 and [$94]
$12:fc66  5a			phy
$12:fc67  ef 16 bc 45   sbc $45bc16
$12:fc6b  b8			clv
$12:fc6c  11 6e		 ora ($6e),y
$12:fc6e  0c 62 e1	  tsb $e162
$12:fc71  10 b8		 bpl $fc2b
$12:fc73  87 c8		 sta [$c8]
$12:fc75  c2 37		 rep #$37
$12:fc77  01 39		 ora ($39,x)
$12:fc79  57 a1		 eor [$a1],y
$12:fc7b  f5 e0		 sbc $e0,x
$12:fc7d  91 81		 sta ($81),y
$12:fc7f  02 3d		 cop #$3d
$12:fc81  0f 39 94 42   ora $429439
$12:fc85  03 10		 ora $10,s
$12:fc87  81 37		 sta ($37,x)
$12:fc89  ca			dex
$12:fc8a  29 80 8a	  and #$8a80
$12:fc8d  60			rts
$12:fc8e  62 99 08	  per $052a
$12:fc91  a6 46		 ldx $46
$12:fc93  21 82		 and ($82,x)
$12:fc95  88			dey
$12:fc96  60			rts
$12:fc97  db			stp
$12:fc98  41 10		 eor ($10,x)
$12:fc9a  c9 c4 26	  cmp #$26c4
$12:fc9d  69 74 8c	  adc #$8c74
$12:fca0  54 d3 e0	  mvn $e0,$d3
$12:fca3  97 3a		 sta [$3a],y
$12:fca5  1a			inc a
$12:fca6  9c 13 e5	  stz $e513
$12:fca9  50 6c		 bvc $fd17
$12:fcab  83 88		 sta $88,s
$12:fcad  1c 04 de	  trb $de04
$12:fcb0  05 91		 ora $91
$12:fcb2  c5 3d		 cmp $3d
$12:fcb4  51 4f		 eor ($4f),y
$12:fcb6  5c 53 71 14   jml $147153
$12:fcba  d0 30		 bne $fcec
$12:fcbc  ea			nop
$12:fcbd  69 b7 9a	  adc #$9ab7
$12:fcc0  73 63		 adc ($63,s),y
$12:fcc2  5f 08 94 01   eor $019408,x
$12:fcc6  ae 7f 16	  ldx $167f
$12:fcc9  ea			nop
$12:fcca  45 3c		 eor $3c
$12:fccc  51 4f		 eor ($4f),y
$12:fcce  1b			tcs
$12:fccf  9c a2 db	  stz $dba2
$12:fcd2  08			php
$12:fcd3  b6 c6		 ldx $c6,y
$12:fcd5  2c 5c 18	  bit $185c
$12:fcd8  b7 4a		 lda [$4a],y
$12:fcda  2d d3 79	  and $79d3
$12:fcdd  9f 42 2d d1   sta $d12d42,x
$12:fce1  8b			phb
$12:fce2  78			sei
$12:fce3  22 de 17 f9   jsl $f917de
$12:fce7  ef a2 db f7   sbc $f7dba2
$12:fceb  f9 80 0b	  sbc $0b80,y
$12:fcee  64 17		 stz $17
$12:fcf0  1e 10 6c	  asl $6c10,x
$12:fcf3  43 01		 eor $01,s
$12:fcf5  b3 0d		 lda ($0d,s),y
$12:fcf7  8f 0c 2e 3b   sta $3b2e0c
$12:fcfb  b0 d8		 bcs $fcd5
$12:fcfd  ef 22 de 28   sbc $28de22
$12:fd01  b3 b8		 lda ($b8,s),y
$12:fd03  06 03		 asl $03
$12:fd05  14 e2		 trb $e2
$12:fd07  45 38		 eor $38
$12:fd09  a3 72		 lda $72,s
$12:fd0b  ca			dex
$12:fd0c  75 08		 adc $08,x
$12:fd0e  00 3f		 brk #$3f
$12:fd10  0c a7 54	  tsb $54a7
$12:fd13  7e 7d 52	  ror $527d,x
$12:fd16  0c 91 08	  tsb $0891
$12:fd19  98			tya
$12:fd1a  44 c6 26	  mvp $26,$c6
$12:fd1d  19 00 1b	  ora $1b00,y
$12:fd20  20 d9 08	  jsr $08d9
$12:fd23  b6 dc		 ldx $dc,y
$12:fd25  e6 06		 inc $06
$12:fd27  f5 e6		 sbc $e6,x
$12:fd29  1b			tcs
$12:fd2a  d7 9b		 cmp [$9b],y
$12:fd2c  14 62		 trb $62
$12:fd2e  06 e1		 asl $e1
$12:fd30  a6 3b		 ldx $3b
$12:fd32  74 3a		 stz $3a,x
$12:fd34  f3 10		 sbc ($10,s),y
$12:fd36  ea			nop
$12:fd37  86 06		 stx $06
$12:fd39  00 30		 brk #$30
$12:fd3b  01 10		 ora ($10,x)
$12:fd3d  31 6b		 and ($6b),y
$12:fd3f  e4 5a		 cpx $5a
$12:fd41  fb			xce
$12:fd42  16 c6		 asl $c6,x
$12:fd44  45 b1		 eor $b1
$12:fd46  b1 6e		 lda ($6e),y
$12:fd48  e1 c4		 sbc ($c4,x)
$12:fd4a  7d 91 6d	  adc $6d91,x
$12:fd4d  c1 c4		 cmp ($c4,x)
$12:fd4f  7b			tdc
$12:fd50  91 6d		 sta ($6d),y
$12:fd52  ca			dex
$12:fd53  cc 0e 23	  cpy $230e
$12:fd56  dd 5d 8f	  cmp $8f5d,x
$12:fd59  b6 1c		 ldx $1c,y
$12:fd5b  c7 08		 cmp [$08]
$12:fd5d  79 ec a2	  adc $a2ec,y
$12:fd60  de b9 b2	  dec $b2b9,x
$12:fd63  e8			inx
$12:fd64  66 cb		 ror $cb
$12:fd66  40			rti
$12:fd67  68			pla
$12:fd68  03 08		 ora $08,s
$12:fd6a  66 de		 ror $de
$12:fd6c  d8			cld
$12:fd6d  b7 1a		 lda [$1a],y
$12:fd6f  2d e6 8b	  and $8be6
$12:fd72  75 96		 adc $96,x
$12:fd74  21 56		 and ($56,x)
$12:fd76  f3 55		 sbc ($55,s),y
$12:fd78  b8			clv
$12:fd79  d5 27		 cmp $27,x
$12:fd7b  30 75		 bmi $fdf2
$12:fd7d  a2 db a7	  ldx #$a7db
$12:fd80  78			sei
$12:fd81  f1 e2		 sbc ($e2),y
$12:fd83  dc 87 79	  jml [$7987]
$12:fd86  f2 62		 sbc ($62)
$12:fd88  dc a7 79	  jml [$79a7]
$12:fd8b  f2 ea		 sbc ($ea)
$12:fd8d  dc b7 79	  jml [$79b7]
$12:fd90  55 b9		 eor $b9,x
$12:fd92  55 67		 eor $67,x
$12:fd94  e0 02 0b	  cpx #$0b02
$12:fd97  91 56		 sta ($56),y
$12:fd99  7a			ply
$12:fd9a  06 6e		 asl $6e
$12:fd9c  2d 7b 8b	  and $8b7b
$12:fd9f  6a			ror a
$12:fda0  e2 d8		 sep #$d8
$12:fda2  b0 c8		 bcs $fd6c
$12:fda4  86 00		 stx $00
$12:fda6  3c 01 c0	  bit $c001,x
$12:fda9  cf 45 b3 f1   cmp $f1b345
$12:fdad  69 3c 5a	  adc #$5a3c
$12:fdb0  51 16		 eor ($16),y
$12:fdb2  eb			xba
$12:fdb3  c5 bb		 cmp $bb
$12:fdb5  11 6f		 ora ($6f),y
$12:fdb7  3c 5b d1	  bit $d15b,x
$12:fdba  16 ec		 asl $ec,x
$12:fdbc  c5 bb		 cmp $bb
$12:fdbe  51 6f		 eor ($6f),y
$12:fdc0  48			pha
$12:fdc1  ec 7b 75	  cpx $757b
$12:fdc4  6e dc 5b	  ror $5bdc
$12:fdc7  6b			rtl
$12:fdc8  16 db		 asl $db,x
$12:fdca  55 bb		 eor $bb,x
$12:fdcc  55 61		 eor $61,x
$12:fdce  c0 0f		 cpy #$0f
$12:fdd0  06 ad		 asl $ad
$12:fdd2  d8			cld
$12:fdd3  ab			plb
$12:fdd4  75 ea		 adc $ea,x
$12:fdd6  de 8a b0	  dec $b08a,x
$12:fdd9  d0 05		 bne $fde0
$12:fddb  84 2c		 sty $2c
$12:fddd  2c bc 5b	  bit $5bbc
$12:fde0  31 16		 and ($16),y
$12:fde2  d3 c5		 cmp ($c5,s),y
$12:fde4  b5 02		 lda $02,x
$12:fde6  b3 d7		 lda ($d7,s),y
$12:fde8  45 b5		 eor $b5
$12:fdea  ec 70 8b	  cpx $8b70
$12:fded  79 21 d1	  adc $d121,y
$12:fdf0  ec b7 96	  cpx $96b7
$12:fdf3  a5 10		 lda $10
$12:fdf5  38			sec
$12:fdf6  8c b0 ea	  sty $eab0
$12:fdf9  07 10		 ora [$10]
$12:fdfb  89 44 0e	  bit #$0e44
$12:fdfe  a1 1e		 lda ($1e,x)
$12:fe00  96 9c		 stx $9c,y
$12:fe02  42 3d		 wdm #$3d
$12:fe04  0f 41 8c 7e   ora $7e8c41
$12:fe08  2d 0a 89	  and $890a
$12:fe0b  44 4e a1	  mvp $a1,$4e
$12:fe0e  92 80		 sta ($80)
$12:fe10  c5 b3		 cmp $b3
$12:fe12  91 6b		 sta ($6b),y
$12:fe14  ec 5b 59	  cpx $595b
$12:fe17  16 c6		 asl $c6,x
$12:fe19  c5 af		 cmp $af
$12:fe1b  d1 6b		 cmp ($6b),y
$12:fe1d  fc 5b 18	  jsr ($185b,x)
$12:fe20  9d 1b e4	  sta $e41b,x
$12:fe23  5b			tcd
$12:fe24  3a			dec a
$12:fe25  a3 1d		 lda $1d,s
$12:fe27  69 bc 7c	  adc #$7cbc
$12:fe2a  a7 30		 lda [$30]
$12:fe2c  47 84		 eor [$84]
$12:fe2e  52 33		 eor ($33)
$12:fe30  14 94		 trb $94
$12:fe32  ad cd 74	  lda $74cd
$12:fe35  10 95		 bpl $fdcc
$12:fe37  f9 2c 41	  sbc $412c,y
$12:fe3a  12 08		 ora ($08)
$12:fe3c  f0 46		 beq $fe84
$12:fe3e  84 4a		 sty $4a
$12:fe40  42 8f		 wdm #$8f
$12:fe42  19 11 f4	  ora $f411,y
$12:fe45  54 05 8e	  mvn $8e,$05
$12:fe48  8b			phb
$12:fe49  63 c3		 adc $c3,s
$12:fe4b  22 1a 01 20   jsl $20011a
$12:fe4f  09 01 30	  ora #$3001
$12:fe52  0a			asl a
$12:fe53  a0 4e		 ldy #$4e
$12:fe55  06 b7		 asl $b7
$12:fe57  1d 2c 8b	  ora $8b2c,x
$12:fe5a  46 a2		 lsr $a2
$12:fe5c  49 60 95	  eor #$9560
$12:fe5f  2d ca a1	  and $a1ca
$12:fe62  02 88		 cop #$88
$12:fe64  40			rti
$12:fe65  57 e4		 eor [$e4],y
$12:fe67  fd 08 84	  sbc $8408,x
$12:fe6a  09 e2 19	  ora #$19e2
$12:fe6d  e4 30		 cpx $30
$12:fe6f  4a			lsr a
$12:fe70  9e 63 ba	  stz $ba63,x
$12:fe73  07 88		 ora [$88]
$12:fe75  d0 06		 bne $fe7d
$12:fe77  81 dc		 sta ($dc,x)
$12:fe79  0b			phd
$12:fe7a  8f b0 36 15   sta $1536b0
$12:fe7e  6d 9c 5b	  adc $5b9c
$12:fe81  65 56		 adc $56
$12:fe83  e1 c5		 sbc ($c5,x)
$12:fe85  b8			clv
$12:fe86  43 b1		 eor $b1,s
$12:fe88  f4 44 a4	  pea $a444
$12:fe8b  15 29		 ora $29,x
$12:fe8d  02 bc		 cop #$bc
$12:fe8f  0e a0 b3	  asl $b3a0
$12:fe92  1f 22 0c 59   ora $590c22,x
$12:fe96  40			rti
$12:fe97  88			dey
$12:fe98  08			php
$12:fe99  fc 53 70	  jsr ($7053,x)
$12:fe9c  3f 1f 51 0c   and $0c511f,x
$12:fea0  48			pha
$12:fea1  04 40		 tsb $40
$12:fea3  15 78		 ora $78,x
$12:fea5  c2 96		 rep #$96
$12:fea7  63 1a		 adc $1a,s
$12:fea9  8f 1c c1 94   sta $94c11c
$12:fead  1b			tcs
$12:feae  78			sei
$12:feaf  b7 30		 lda [$30],y
$12:feb1  a2 2c a0	  ldx #$a02c
$12:feb4  8d 43 91	  sta $9143
$12:feb7  c1 d0		 cmp ($d0,x)
$12:feb9  8b			phb
$12:feba  74 4b		 stz $4b,x
$12:febc  65 96		 adc $96
$12:febe  b1 f5		 lda ($f5),y
$12:fec0  ac 75 6f	  ldy $6f75
$12:fec3  40			rti
$12:fec4  a4 0d		 ldy $0d
$12:fec6  e1 96		 sbc ($96,x)
$12:fec8  b9 9c c7	  lda $c79c,y
$12:fecb  d2 79		 cmp ($79)
$12:fecd  03 88		 ora $88,s
$12:fecf  09 c9 02	  ora #$02c9
$12:fed2  37 61		 and [$61],y
$12:fed4  39 22 40	  and $4022,y
$12:fed7  de 07 b2	  dec $b207,x
$12:feda  af 43 eb c5   lda $c5eb43
$12:fede  00 2e		 brk #$2e
$12:fee0  0f 3a 5b ce   ora $ce5b3a
$12:fee4  96 54		 stx $54,y
$12:fee6  b4 2a		 ldy $2a,x
$12:fee8  30 4f		 bmi $ff39
$12:feea  8c ad 46	  sty $46ad
$12:feed  51 08		 eor ($08),y
$12:feef  8c e2 6f	  sty $6fe2
$12:fef2  38			sec
$12:fef3  aa			tax
$12:fef4  4e 28 f3	  lsr $f328
$12:fef7  85 b8		 sta $b8
$12:fef9  4e 67 14	  lsr $1467
$12:fefc  89 c5 26	  bit #$26c5
$12:feff  71 3a		 adc ($3a),y
$12:ff01  57 8d		 eor [$8d],y
$12:ff03  2a			rol a
$12:ff04  71 55		 adc ($55),y
$12:ff06  8d 4d 23	  sta $234d
$12:ff09  53 58		 eor ($58,s),y
$12:ff0b  d5 12		 cmp $12,x
$12:ff0d  35 45		 and $45,x
$12:ff0f  8d 5e 63	  sta $635e
$12:ff12  57 a8		 eor [$a8],y
$12:ff14  d6 26		 dec $26,x
$12:ff16  35 8a		 and $8a,x
$12:ff18  8d 4c 23	  sta $234c
$12:ff1b  53 18		 eor ($18,s),y
$12:ff1d  d5 02		 cmp $02,x
$12:ff1f  35 41		 and $41,x
$12:ff21  9b			txy
$12:ff22  49 e6 d2	  eor #$d2e6
$12:ff25  86 f9		 stx $f9
$12:ff27  f4 26 dd	  pea $dd26
$12:ff2a  19 b6 fa	  ora $fab6,y
$12:ff2d  6d bf 9d	  adc $9dbf
$12:ff30  59 27 55	  eor $5527,y
$12:ff33  79 d5 d2	  adc $d2d5,y
$12:ff36  75 67		 adc $67,x
$12:ff38  9c 56 27	  stz $2756
$12:ff3b  15 99		 ora $99,x
$12:ff3d  c5 a2		 cmp $a2
$12:ff3f  71 69		 adc ($69),y
$12:ff41  9d 56 a7	  sta $a756,x
$12:ff44  56 59		 lsr $59,x
$12:ff46  d5 aa		 cmp $aa,x
$12:ff48  75 75		 adc $75,x
$12:ff4a  33 9d		 and ($9d,s),y
$12:ff4c  8a			txa
$12:ff4d  2d 72 8d	  and $8d72
$12:ff50  66 63		 ror $63
$12:ff52  59 a8 d6	  eor $d6a8,y
$12:ff55  a6 35		 ldx $35
$12:ff57  aa			tax
$12:ff58  6b			rtl
$12:ff59  8c c9 b6	  sty $b6c9
$12:ff5c  34 29		 bit $29,x
$12:ff5e  b7 4a		 lda [$4a],y
$12:ff60  6d d3 9b	  adc $9bd3
$12:ff63  70 26		 bvs $ff8b
$12:ff65  dc 17 39	  jml [$3917]
$12:ff68  ba			tsx
$12:ff69  06 b1		 asl $b1
$12:ff6b  ef ac 77 c5   sbc $c577ac
$12:ff6f  e6 36		 inc $36
$12:ff71  8e 78 fc	  stx $fc78
$12:ff74  b3 1e		 lda ($1e,s),y
$12:ff76  e2 38		 sep #$38
$12:ff78  f7 89		 sbc [$89],y
$12:ff7a  7b			tdc
$12:ff7b  ce 2d 81	  dec $812d
$12:ff7e  ec a2 50	  cpx $50a2
$12:ff81  03 18		 ora $18,s
$12:ff83  20 c8 c6	  jsr $c6c8
$12:ff86  51 8e		 eor ($8e),y
$12:ff88  7c 63 be	  jmp ($be63,x)
$12:ff8b  6f 33 b4 7b   adc $7bb433
$12:ff8f  cf e7 ce 43   cmp $43cee7
$12:ff93  8f 79 17 be   sta $be1779
$12:ff97  e4 d8		 cpx $d8
$12:ff99  65 3a		 adc $3a
$12:ff9b  8a			txa
$12:ff9c  00 4f		 brk #$4f
$12:ff9e  95 53		 sta $53,x
$12:ffa0  7b			tdc
$12:ffa1  14 de		 trb $de
$12:ffa3  a9 c8		 lda #$c8
$12:ffa5  ce 5d 28	  dec $285d
$12:ffa8  bc 4a 43	  ldy $434a,x
$12:ffab  14 ff		 trb $ff
$12:ffad  55 3f		 eor $3f,x
$12:ffaf  d9 4f f7	  cmp $f74f,y
$12:ffb2  53 fd		 eor ($fd,s),y
$12:ffb4  10 8c		 bpl $ff42
$12:ffb6  44 24 31	  mvp $31,$24
$12:ffb9  08			php
$12:ffba  8c 42 47	  sty $4742
$12:ffbd  06 fb		 asl $fb
$12:ffbf  d1 be		 cmp ($be),y
$12:ffc1  f0 6f		 beq $0032
$12:ffc3  c5 1b		 cmp $1b
$12:ffc5  f1 06		 sbc ($06),y
$12:ffc7  fc d1 bf	  jsr ($bfd1,x)
$12:ffca  30 6f		 bmi $003b
$12:ffcc  d5 1b		 cmp $1b,x
$12:ffce  f5 04		 sbc $04,x
$12:ffd0  ff d1 3f f8   sbc $f83fd1,x
$12:ffd4  4f ff 13 ff   eor $ff13ff
$12:ffd8  04 fe		 tsb $fe
$12:ffda  51 3f		 eor ($3f),y
$12:ffdc  98			tya
$12:ffdd  4f e7 13 f9   eor $f913e7
$12:ffe1  04 fd		 tsb $fd
$12:ffe3  d1 3f		 cmp ($3f),y
$12:ffe5  78			sei
$12:ffe6  4f df 13 f6   eor $f613df
$12:ffea  38			sec
$12:ffeb  35 bb		 and $bb,x
$12:ffed  e0 4f		 cpx #$4f
$12:ffef  2a			rol a
$12:fff0  f9 9b ce	  sbc $ce9b,y
$12:fff3  fe 88 f4	  inc $f488,x
$12:fff6  cf aa bd 76   cmp $76bdaa
$12:fffa  40			rti
$12:fffb  00 e0		 brk #$e0
$12:fffd  78			sei
$12:fffe  1c 00 00	  trb $0000
