; Soul Blazer (SNES) - Bank $1b
; Disassembled from ROM
; File offset: $0d8000-$0dffff
; CPU address: $1b:$8000-$1b:$ffff
;===========================================================

.bank $1b
.org $8000

$1b:8000  04 05		 tsb $05
$1b:8002  00 14		 brk #$14
$1b:8004  c8			iny
$1b:8005  64 36		 stz $36
$1b:8007  3a			dec a
$1b:8008  1c c6 87	  trb $87c6
$1b:800b  33 a1		 and ($a1,s),y
$1b:800d  c4 6b		 cpy $6b
$1b:800f  60			rts
$1b:8010  0f 93 c4 62   ora $62c493
$1b:8014  37 3f		 and [$3f],y
$1b:8016  8d 03 d4	  sta $d403
$1b:8019  33 39		 and ($39,s),y
$1b:801b  0d 2b e5	  ora $e52b
$1b:801e  1d e3 f7	  ora $f7e3,x
$1b:8021  79 d7 24	  adc $24d7,y
$1b:8024  00 1e		 brk #$1e
$1b:8026  f0 1d		 beq $8045
$1b:8028  72 24		 adc ($24)
$1b:802a  9b			txy
$1b:802b  cf 6e ed e8   cmp $e8ed6e
$1b:802f  3b			tsc
$1b:8030  ce 6e 54	  dec $546e
$1b:8033  54 91 af	  mvn $af,$91
$1b:8036  69 04 38	  adc #$3804
$1b:8039  5b			tcd
$1b:803a  ae 11 04	  ldx $0411
$1b:803d  37 a4		 and [$a4],y
$1b:803f  90 1c		 bcc $805d
$1b:8041  08			php
$1b:8042  fc ca 2e	  jsr ($2eca,x)
$1b:8045  38			sec
$1b:8046  02 7e		 cop #$7e
$1b:8048  17 00		 ora [$00],y
$1b:804a  bf bb 53 7f   lda $7f53bb,x
$1b:804e  a0 3d 23	  ldy #$233d
$1b:8051  ea			nop
$1b:8052  2f 28 97 f4   and $f49728
$1b:8056  a2 a4 fc	  ldx #$fca4
$1b:8059  f7 77		 sbc [$77],y
$1b:805b  09 f9 e4	  ora #$e4f9
$1b:805e  e7 02		 sbc [$02]
$1b:8060  51 e9		 eor ($e9),y
$1b:8062  e0 5f 0b	  cpx #$0b5f
$1b:8065  78			sei
$1b:8066  8a			txa
$1b:8067  72 9c		 adc ($9c)
$1b:8069  c2 51		 rep #$51
$1b:806b  0c c8 6a	  tsb $6ac8
$1b:806e  02 22		 cop #$22
$1b:8070  ce 43 7f	  dec $7f43
$1b:8073  6b			rtl
$1b:8074  b0 1a		 bcs $8090
$1b:8076  82 c8 c4	  brl $4541
$1b:8079  45 a4		 eor $a4
$1b:807b  f6 2c		 inc $2c,x
$1b:807d  a3 2a		 lda $2a,s
$1b:807f  22 1d 61 52   jsl $52611d
$1b:8083  73 a5		 adc ($a5,s),y
$1b:8085  02 ea		 cop #$ea
$1b:8087  71 4e		 adc ($4e),y
$1b:8089  af a5 30 16   lda $1630a5
$1b:808d  63 40		 adc $40,s
$1b:808f  85 04		 sta $04
$1b:8091  20 22 06	  jsr $0622
$1b:8094  0f a0 d6 94   ora $94d6a0
$1b:8098  09 0e 09	  ora #$090e
$1b:809b  50 43		 bvc $80e0
$1b:809d  9c 3f 30	  stz $303f
$1b:80a0  7f 2d 1e 6d   adc $6d1e2d,x
$1b:80a4  48			pha
$1b:80a5  d0 6c		 bne $8113
$1b:80a7  da			phx
$1b:80a8  3c 84 51	  bit $5184,x
$1b:80ab  0e 80 0e	  asl $0e80
$1b:80ae  c9 7f 5d	  cmp #$5d7f
$1b:80b1  c6 7e		 dec $7e
$1b:80b3  c4 db		 cpy $db
$1b:80b5  fa			plx
$1b:80b6  22 f7 ff 84   jsl $84fff7
$1b:80ba  3c 3d 7b	  bit $7b3d,x
$1b:80bd  de 6e 56	  dec $566e,x
$1b:80c0  01 94		 ora ($94,x)
$1b:80c2  e6 0b		 inc $0b
$1b:80c4  c8			iny
$1b:80c5  3c 9e dd	  bit $dd9e,x
$1b:80c8  a9 bc 33	  lda #$33bc
$1b:80cb  90 df		 bcc $80ac
$1b:80cd  d9 00 43	  cmp $4300,y
$1b:80d0  c0 33 1d	  cpy #$1d33
$1b:80d3  e8			inx
$1b:80d4  fc 0f e1	  jsr ($e10f,x)
$1b:80d7  a4 f6		 ldy $f6
$1b:80d9  13 c8		 ora ($c8,s),y
$1b:80db  3c 19 c2	  bit $c219,x
$1b:80de  a0 17 43	  ldy #$4317
$1b:80e1  6a			ror a
$1b:80e2  8f 0d 61 50   sta $50610d
$1b:80e6  51 e6		 eor ($e6),y
$1b:80e8  5c 1e 2f 54   jml $542f1e
$1b:80ec  a2 3d 43	  ldx #$433d
$1b:80ef  79 07 80	  adc $8007,y
$1b:80f2  c6 3e		 dec $3e
$1b:80f4  d4 d0		 pei ($d0)
$1b:80f6  18			clc
$1b:80f7  47 30		 eor [$30]
$1b:80f9  7f 23 49 ff   adc $ff4923,x
$1b:80fd  50 80		 bvc $807f
$1b:80ff  51 13		 eor ($13),y
$1b:8101  f8			sed
$1b:8102  24 04		 bit $04
$1b:8104  f2 99		 sbc ($99)
$1b:8106  bc de ae	  ldy $aede,x
$1b:8109  01 a3		 ora ($a3,x)
$1b:810b  4f 82 80 4d   eor $4d8082
$1b:810f  28			plp
$1b:8110  1e a3 d9	  asl $d9a3,x
$1b:8113  13 41		 ora ($41,s),y
$1b:8115  7e 83 62	  ror $6283,x
$1b:8118  29 87 bb	  and #$bb87
$1b:811b  b8			clv
$1b:811c  ce 32 e9	  dec $e932
$1b:811f  11 c4		 ora ($c4),y
$1b:8121  c6 1e		 dec $1e
$1b:8123  4e 74 4d	  lsr $4d74
$1b:8126  be 5c f2	  ldx $f25c,y
$1b:8129  f0 95		 beq $80c0
$1b:812b  c4 a6		 cpy $a6
$1b:812d  1e 4e 38	  asl $384e,x
$1b:8130  7b			tdc
$1b:8131  df fe 10 f2   cmp $f210fe,x
$1b:8135  4a			lsr a
$1b:8136  30 d8		 bmi $8110
$1b:8138  26 45		 rol $45
$1b:813a  b2 66		 lda ($66)
$1b:813c  8f f5 ae 22   sta $22aef5
$1b:8140  a3 35		 lda $35,s
$1b:8142  93 74		 sta ($74,s),y
$1b:8144  79 ee 71	  adc $71ee,y
$1b:8147  6a			ror a
$1b:8148  99 ec 9d	  sta $9dec,y
$1b:814b  a1 c8		 lda ($c8,x)
$1b:814d  e3 6d		 sbc $6d,s
$1b:814f  50 20		 bvc $8171
$1b:8151  e5 32		 sbc $32
$1b:8153  21 f5		 and ($f5,x)
$1b:8155  a2 1d 72	  ldx #$721d
$1b:8158  62 21 c0	  per $417c
$1b:815b  a8			tay
$1b:815c  5e de f4	  lsr $f4de,x
$1b:815f  63 be		 adc $be,s
$1b:8161  5c 7e a7 15   jml $15a77e
$1b:8165  0c 7d 53	  tsb $537d
$1b:8168  6b			rtl
$1b:8169  66 34		 ror $34
$1b:816b  09 54 2e	  ora #$2e54
$1b:816e  b2 59		 lda ($59)
$1b:8170  73 06		 adc ($06,s),y
$1b:8172  d5 d1		 cmp $d1,x
$1b:8174  e6 d6		 inc $d6
$1b:8176  ab			plb
$1b:8177  ab			plb
$1b:8178  80 34		 bra $81ae
$1b:817a  c1 ce		 cmp ($ce,x)
$1b:817c  41 38		 eor ($38,x)
$1b:817e  25 09		 and $09
$1b:8180  74 02		 stz $02,x
$1b:8182  72 5a		 adc ($5a)
$1b:8184  0f 68 99 05   ora $059968
$1b:8188  2b			pld
$1b:8189  c8			iny
$1b:818a  8d 1d 85	  sta $851d
$1b:818d  e2 e5		 sep #$e5
$1b:818f  80 88		 bra $8119
$1b:8191  f5 de		 sbc $de,x
$1b:8193  2a			rol a
$1b:8194  38			sec
$1b:8195  12 b1		 ora ($b1)
$1b:8197  68			pla
$1b:8198  22 27 52 7d   jsl $7d5227
$1b:819c  11 24		 ora ($24),y
$1b:819e  4a			lsr a
$1b:819f  e3 98		 sbc $98,s
$1b:81a1  c9 04		 cmp #$04
$1b:81a3  58			cli
$1b:81a4  b2 25		 lda ($25)
$1b:81a6  71 cd		 adc ($cd),y
$1b:81a8  f9 fd 80	  sbc $80fd,y
$1b:81ab  83 33		 sta $33,s
$1b:81ad  9b			txy
$1b:81ae  f0 4e		 beq $81fe
$1b:81b0  62 18 33	  per $b4cb
$1b:81b3  b9 8f 08	  lda $088f,y
$1b:81b6  c8			iny
$1b:81b7  02 83		 cop #$83
$1b:81b9  7b			tdc
$1b:81ba  b0 fc		 bcs $81b8
$1b:81bc  87 24		 sta [$24]
$1b:81be  57 72		 eor [$72],y
$1b:81c0  80 12		 bra $81d4
$1b:81c2  0c af 2f	  tsb $2faf
$1b:81c5  2b			pld
$1b:81c6  37 87		 and [$87],y
$1b:81c8  53 8a		 eor ($8a,s),y
$1b:81ca  92 62		 sta ($62)
$1b:81cc  da			phx
$1b:81cd  66 34		 ror $34
$1b:81cf  0a			asl a
$1b:81d0  10 52		 bpl $8224
$1b:81d2  02 84		 cop #$84
$1b:81d4  71 41		 adc ($41),y
$1b:81d6  10 26		 bpl $81fe
$1b:81d8  92 98		 sta ($98)
$1b:81da  96 80		 stx $80,y
$1b:81dc  a2 11 00	  ldx #$0011
$1b:81df  8f 47 47 9b   sta $9b4747
$1b:81e3  60			rts
$1b:81e4  b0 c0		 bcs $81a6
$1b:81e6  07 84		 ora [$84]
$1b:81e8  cf 84 00 b3   cmp $b30084
$1b:81ec  6c e0 22	  jmp ($22e0)
$1b:81ef  81 77		 sta ($77,x)
$1b:81f1  f6 da		 inc $da,x
$1b:81f3  21 11		 and ($11,x)
$1b:81f5  db			stp
$1b:81f6  bf c2 22 01   lda $0122c2,x
$1b:81fa  00 3a		 brk #$3a
$1b:81fc  72 24		 adc ($24)
$1b:81fe  9b			txy
$1b:81ff  ed fc 94	  sbc $94fc
$1b:8202  1e 1b f0	  asl $f01b,x
$1b:8205  88			dey
$1b:8206  05 d3		 ora $d3
$1b:8208  91 1a		 sta ($1a),y
$1b:820a  fe cc 62	  inc $62cc,x
$1b:820d  41 f0		 eor ($f0,x)
$1b:820f  94 ca		 sty $ca,x
$1b:8211  04 ca		 tsb $ca
$1b:8213  1f 09 40 88   ora $884009,x
$1b:8217  a6 72		 ldx $72
$1b:8219  a9 58		 lda #$58
$1b:821b  dd 05 eb	  cmp $eb05,x
$1b:821e  31 8a		 and ($8a),y
$1b:8220  44 c9 08	  mvp $08,$c9
$1b:8223  3f 61 98 3b   and $3b9861,x
$1b:8227  d4 80		 pei ($80)
$1b:8229  b1 60		 lda ($60),y
$1b:822b  39 80 c0	  and $c080,y
$1b:822e  5e b2 d8	  lsr $d8b2,x
$1b:8231  f4 62 32	  pea $3262
$1b:8234  78			sei
$1b:8235  10 98		 bpl $81cf
$1b:8237  0b			phd
$1b:8238  d4 4c		 pei ($4c)
$1b:823a  3f d1 30 15   and $1530d1,x
$1b:823e  88			dey
$1b:823f  60			rts
$1b:8240  83 83		 sta $83,s
$1b:8242  9d 23 1e	  sta $1e23,x
$1b:8245  4e 48 38	  lsr $3848
$1b:8248  aa			tax
$1b:8249  31 cb		 and ($cb),y
$1b:824b  4a			lsr a
$1b:824c  8c 53 3a	  sty $3a53
$1b:824f  01 82		 ora ($82,x)
$1b:8251  2e 8c 43	  rol $438c
$1b:8254  b2 9e		 lda ($9e)
$1b:8256  42 3e		 wdm #$3e
$1b:8258  8c 31 bb	  sty $bb31
$1b:825b  0d c6 72	  ora $72c6
$1b:825e  57 3e		 eor [$3e],y
$1b:8260  97 23		 sta [$23],y
$1b:8262  8d ed f6	  sta $f6ed
$1b:8265  ed 75 b0	  sbc $b075
$1b:8268  08			php
$1b:8269  06 b3		 asl $b3
$1b:826b  d9 e4 e3	  cmp $e3e4,y
$1b:826e  9a			txs
$1b:826f  8d e8 5a	  sta $5ae8
$1b:8272  57 c8		 eor [$c8],y
$1b:8274  69 1f		 adc #$1f
$1b:8276  83 be		 sta $be,s
$1b:8278  df ef 8f a0   cmp $a08fef,x
$1b:827c  f4 8e b2	  pea $b28e
$1b:827f  1c 26 03	  trb $0326
$1b:8282  30 02		 bmi $8286
$1b:8284  3f b7 bd 3a   and $3abdb7,x
$1b:8288  10 33		 bpl $82bd
$1b:828a  e0 de a1	  cpx #$a1de
$1b:828d  15 10		 ora $10,x
$1b:828f  57 53		 eor [$53],y
$1b:8291  8b			phb
$1b:8292  c5 42		 cmp $42
$1b:8294  80 c6		 bra $825c
$1b:8296  73 1a		 adc ($1a,s),y
$1b:8298  0c c1 3d	  tsb $3dc1
$1b:829b  c1 04		 cmp ($04,x)
$1b:829d  5d 0d 01	  eor $010d,x
$1b:82a0  3e b4 79	  rol $79b4,x
$1b:82a3  b3 e0		 lda ($e0,s),y
$1b:82a5  17 e9		 ora [$e9],y
$1b:82a7  12 44		 ora ($44)
$1b:82a9  fa			plx
$1b:82aa  e5 72		 sbc $72
$1b:82ac  39 68 e8	  and $e868,y
$1b:82af  04 0f		 tsb $0f
$1b:82b1  0f 91 c4 47   ora $47c491
$1b:82b5  56 53		 lsr $53,x
$1b:82b7  17 c8		 ora [$c8],y
$1b:82b9  c4 73		 cpy $73
$1b:82bb  0b			phd
$1b:82bc  f3 9c		 sbc ($9c,s),y
$1b:82be  c9 f2		 cmp #$f2
$1b:82c0  32 1e		 and ($1e)
$1b:82c2  c2 7c		 rep #$7c
$1b:82c4  e9 17 62	  sbc #$6217
$1b:82c7  ce 09 5c	  dec $5c09
$1b:82ca  e0 44 da	  cpx #$da44
$1b:82cd  c6 59		 dec $59
$1b:82cf  0c c9 e2	  tsb $e2c9
$1b:82d2  db			stp
$1b:82d3  5c e9 64 1d   jml $1d64e9
$1b:82d7  f6 48		 inc $48,x
$1b:82d9  18			clc
$1b:82da  87 5d		 sta [$5d]
$1b:82dc  e3 25		 sbc $25,s
$1b:82de  81 8c		 sta ($8c,x)
$1b:82e0  77 c0		 adc [$c0],y
$1b:82e2  38			sec
$1b:82e3  11 82		 ora ($82),y
$1b:82e5  aa			tax
$1b:82e6  71 47		 adc ($47),y
$1b:82e8  f3 d5		 sbc ($d5,s),y
$1b:82ea  34 09		 bit $09,x
$1b:82ec  b0 4a		 bcs $8338
$1b:82ee  04 55		 tsb $55
$1b:82f0  02 81		 cop #$81
$1b:82f2  1e 04 b4	  asl $b404,x
$1b:82f5  05 f3		 ora $f3
$1b:82f7  32 81		 and ($81)
$1b:82f9  80 89		 bra $8284
$1b:82fb  83 9b		 sta $9b,s
$1b:82fd  37 d6		 and [$d6],y
$1b:82ff  ac 9a 07	  ldy $079a
$1b:8302  ef 46 5f 2b   sbc $2b5f46
$1b:8306  90 8c		 bcc $8294
$1b:8308  ce 1f 23	  dec $231f
$1b:830b  7a			ply
$1b:830c  af 18 64 8a   lda $8a6418
$1b:8310  27 23		 and [$23]
$1b:8312  57 96		 eor [$96],y
$1b:8314  f7 cc		 sbc [$cc],y
$1b:8316  db			stp
$1b:8317  00 89		 brk #$89
$1b:8319  79 38 ef	  adc $ef38,y
$1b:831c  f5 f2		 sbc $f2,x
$1b:831e  ba			tsx
$1b:831f  c0 22 1f	  cpy #$1f22
$1b:8322  d6 14		 dec $14,x
$1b:8324  af 7d 3d 5a   lda $5a3d7d
$1b:8328  cf 63 08 60   cmp $600863
$1b:832c  19 4e 62	  ora $624e,y
$1b:832f  dc f9 b9	  jml [$b9f9]
$1b:8332  58			cli
$1b:8333  06 91		 asl $91
$1b:8335  f6 79		 inc $79,x
$1b:8337  c7 d8		 cmp [$d8]
$1b:8339  33 cb		 and ($cb,s),y
$1b:833b  6b			rtl
$1b:833c  9d 7c 9f	  sta $9f7c,x
$1b:833f  58			cli
$1b:8340  12 43		 ora ($43)
$1b:8342  73 26		 adc ($26,s),y
$1b:8344  00 80		 brk #$80
$1b:8346  bb			tyx
$1b:8347  cf 91 f7 77   cmp $77f791
$1b:834b  3b			tsc
$1b:834c  82 51 2e	  brl $b1a0
$1b:834f  03 e8		 ora $e8,s
$1b:8351  5c e0 09 1f   jml $1f09e0
$1b:8355  27 3a		 and [$3a]
$1b:8357  27 cf		 and [$cf]
$1b:8359  13 1f		 ora ($1f,s),y
$1b:835b  53 8a		 eor ($8a,s),y
$1b:835d  4c 07 c8	  jmp $c807
$1b:8360  b0 cc		 bcs $832e
$1b:8362  6e 59 8d	  ror $8d59
$1b:8365  01 6c		 ora ($6c,x)
$1b:8367  07 e4		 ora [$e4]
$1b:8369  53 31		 eor ($31,s),y
$1b:836b  40			rti
$1b:836c  97 07		 sta [$07],y
$1b:836e  30 4f		 bmi $83bf
$1b:8370  9d 1e 6c	  sta $6c1e,x
$1b:8373  f6 23		 inc $23,x
$1b:8375  f2 eb		 sbc ($eb)
$1b:8377  44 3a e2	  mvp $e2,$3a
$1b:837a  62 7a 3f	  per $c2f7
$1b:837d  7a			ply
$1b:837e  31 df		 and ($df),y
$1b:8380  1b			tcs
$1b:8381  13 bd		 ora ($bd,s),y
$1b:8383  04 0b		 tsb $0b
$1b:8385  ed 01 18	  sbc $1801
$1b:8388  0c 20 03	  tsb $0320
$1b:838b  a3 51		 lda $51,s
$1b:838d  20 c8 a0	  jsr $a0c8
$1b:8390  0a			asl a
$1b:8391  06 70		 asl $70
$1b:8393  11 0c		 ora ($0c),y
$1b:8395  55 f4		 eor $f4,x
$1b:8397  52 25		 eor ($25)
$1b:8399  fd a0 c7	  sbc $c7a0,x
$1b:839c  91 27		 sta ($27),y
$1b:839e  89 bc 66	  bit #$66bc
$1b:83a1  4d c8 7f	  eor $7fc8
$1b:83a4  74 42		 stz $42,x
$1b:83a6  22 0f cd f6   jsl $f6cd0f
$1b:83aa  fc 3f 8b	  jsr ($8b3f,x)
$1b:83ad  27 59		 and [$59]
$1b:83af  2f 17 fb c5   and $c5fb17
$1b:83b3  20 d9 b0	  jsr $b0d9
$1b:83b6  4a			lsr a
$1b:83b7  16 50		 asl $50,x
$1b:83b9  dc c6 6c	  jml [$6cc6]
$1b:83bc  df a9 95 42   cmp $4295a9,x
$1b:83c0  fa			plx
$1b:83c1  39 b9 b9	  and $b9b9,y
$1b:83c4  5c a7 33 7a   jml $7a33a7
$1b:83c8  a3 34		 lda $34,s
$1b:83ca  fa			plx
$1b:83cb  6d 73 b9	  adc $b973
$1b:83ce  c7 0a		 cmp [$0a]
$1b:83d0  ab			plb
$1b:83d1  d3 6b		 cmp ($6b,s),y
$1b:83d3  a5 70		 lda $70
$1b:83d5  32 fd		 and ($fd)
$1b:83d7  36 ba		 rol $ba,x
$1b:83d9  dd 63 09	  cmp $0963,x
$1b:83dc  9a			txs
$1b:83dd  06 bf		 asl $bf
$1b:83df  e9 3c 4e	  sbc #$4e3c
$1b:83e2  27 26		 and [$26]
$1b:83e4  e4 71		 cpx $71
$1b:83e6  99 a5 00	  sta $00a5,y
$1b:83e9  d2 62		 cmp ($62)
$1b:83eb  f9 18 8f	  sbc $8f18,y
$1b:83ee  67 21		 adc [$21]
$1b:83f0  fe 4f 42	  inc $424f,x
$1b:83f3  d2 c0		 cmp ($c0)
$1b:83f5  35 98		 and $98,x
$1b:83f7  ae 4e 27	  ldx $274e
$1b:83fa  3d 10 88	  and $8810,x
$1b:83fd  83 c7		 sta $c7,s
$1b:83ff  ae f5 4c	  ldx $4cf5
$1b:8402  97 27		 sta [$27],y
$1b:8404  23 9e		 and $9e,s
$1b:8406  df 6f c3 e3   cmp $e3c36f,x
$1b:840a  df 02 c3 4d   cmp $4dc302,x
$1b:840e  3d bf d0	  and $d0bf,x
$1b:8411  bb			tyx
$1b:8412  71 47		 adc ($47),y
$1b:8414  eb			xba
$1b:8415  d5 04		 cmp $04,x
$1b:8417  29 81 c3	  and #$c381
$1b:841a  0a			asl a
$1b:841b  50 6d		 bvc $848a
$1b:841d  00 21		 brk #$21
$1b:841f  73 66		 adc ($66,s),y
$1b:8421  f6 d5		 inc $d5,x
$1b:8423  86 51		 stx $51
$1b:8425  21 20		 and ($20,x)
$1b:8427  a3 3f		 lda $3f,s
$1b:8429  c8			iny
$1b:842a  68			pla
$1b:842b  f7 a9		 sbc [$a9],y
$1b:842d  f4 e6 e5	  pea $e5e6
$1b:8430  51 0a		 eor ($0a),y
$1b:8432  d4 1f		 pei ($1f)
$1b:8434  77 73		 adc [$73],y
$1b:8436  b8			clv
$1b:8437  16 0c		 asl $0c,x
$1b:8439  ea			nop
$1b:843a  61 5a		 adc ($5a,x)
$1b:843c  83 e4		 sta $e4,s
$1b:843e  e7 44		 sbc [$44]
$1b:8440  f9 e0 71	  sbc $71e0,y
$1b:8443  14 bf		 trb $bf
$1b:8445  93 8e		 sta ($8e,s),y
$1b:8447  f3 01		 sbc ($01,s),y
$1b:8449  b8			clv
$1b:844a  ae 63 ac	  ldx $ac63
$1b:844d  13 06		 ora ($06,s),y
$1b:844f  35 34		 and $34,x
$1b:8451  4c 5e 7e	  jmp $7e5e
$1b:8454  5c 5f 22 dc   jml $dc225f
$1b:8458  ff 1b 7f 5b   sbc $5b7f1b,x
$1b:845c  93 17		 sta ($17,s),y
$1b:845e  7f 95 bb 3e   adc $3ebb95,x
$1b:8462  8b			phb
$1b:8463  07 fe		 ora [$fe]
$1b:8465  1e c1 ff	  asl $ffc1,x
$1b:8468  e1 0f		 sbc ($0f,x)
$1b:846a  10 f8		 bpl $8464
$1b:846c  cb			wai
$1b:846d  c8			iny
$1b:846e  7e 54 f3	  ror $f354,x
$1b:8471  2f 9d bd 0f   and $0fbd9d
$1b:8475  e9 8f 54	  sbc #$548f
$1b:8478  fa			plx
$1b:8479  eb			xba
$1b:847a  d9 65 00	  cmp $0065,y
$1b:847d  d6 7b		 dec $7b,x
$1b:847f  3d af 27	  and $27af,x
$1b:8482  ef 46 3b f0   sbc $f03b46
$1b:8486  0d 23 c6	  ora $c623
$1b:8489  5e 42 ef	  lsr $ef42,x
$1b:848c  3f 77 70 2a   and $2a7077,x
$1b:8490  00 86		 brk #$86
$1b:8492  00 17		 brk #$17
$1b:8494  93 9d		 sta ($9d,s),y
$1b:8496  13 89		 ora ($89,s),y
$1b:8498  f3 c1		 sbc ($c1,s),y
$1b:849a  33 e4		 and ($e4,s),y
$1b:849c  e3 f2		 sbc $f2,s
$1b:849e  39 1c 60	  and $601c,y
$1b:84a1  cd 75 a2	  cmp $a275
$1b:84a4  11 0e		 ora ($0e),y
$1b:84a6  b8			clv
$1b:84a7  26 5f		 rol $5f
$1b:84a9  62 fd 00	  per $85a9
$1b:84ac  cc bc 8f	  cpy $8fbc
$1b:84af  fa			plx
$1b:84b0  4a			lsr a
$1b:84b1  90 2c		 bcc $84df
$1b:84b3  80 3c		 bra $84f1
$1b:84b5  e3 e8		 sbc $e8,s
$1b:84b7  2f 49 e7 53   and $53e749
$1b:84bb  8a			txa
$1b:84bc  c2 a7		 rep #$a7
$1b:84be  78			sei
$1b:84bf  66 34		 ror $34
$1b:84c1  0d 1a 4f	  ora $4f1a
$1b:84c4  83 4a		 sta $4a,s
$1b:84c6  f3 1b		 sbc ($1b,s),y
$1b:84c8  5d 6a c1	  eor $c16a,x
$1b:84cb  9d e9 b5	  sta $b5e9,x
$1b:84ce  d2 a8		 cmp ($a8)
$1b:84d0  19 fe 5e	  ora $5efe,y
$1b:84d3  ee e3 bf	  inc $bfe3
$1b:84d6  3c 9c e7	  bit $e79c,x
$1b:84d9  fe 79 38	  inc $3879,x
$1b:84dc  e0 fd eb	  cpx #$ebfd
$1b:84df  3f f3 db de   and $dedbf3,x
$1b:84e3  77 f8		 adc [$f8],y
$1b:84e5  28			plp
$1b:84e6  fb			xce
$1b:84e7  84 66		 sty $66
$1b:84e9  0c 2c 4f	  tsb $4f2c
$1b:84ec  9e f7 5f	  stz $5ff7,x
$1b:84ef  70 a5		 bvs $8496
$1b:84f1  39 1c 67	  and $671c,y
$1b:84f4  ea			nop
$1b:84f5  f9 07 29	  sbc $2907,y
$1b:84f8  10 eb		 bpl $84e5
$1b:84fa  bd d5 1c	  lda $1cd5,x
$1b:84fd  04 a3		 tsb $a3
$1b:84ff  8c 77 d0	  sty $d077
$1b:8502  f4 53 2f	  pea $2f53
$1b:8505  ea			nop
$1b:8506  61 7a		 adc ($7a,x)
$1b:8508  a6 00		 ldx $00
$1b:850a  ea			nop
$1b:850b  71 58		 adc ($58),y
$1b:850d  66 bf		 ror $bf
$1b:850f  4c c1 40	  jmp $40c1
$1b:8512  1c 6c d0	  trb $d06c
$1b:8515  3d 01 80	  and $8001,x
$1b:8518  1a			inc a
$1b:8519  6a			ror a
$1b:851a  df 42 99 29   cmp $299942,x
$1b:851e  04 f2		 tsb $f2
$1b:8520  10 08		 bpl $852a
$1b:8522  06 93		 asl $93
$1b:8524  25 c9		 and $c9
$1b:8526  c8			iny
$1b:8527  e7 8c		 sbc [$8c]
$1b:8529  a4 66		 ldy $66
$1b:852b  37 c0		 and [$c0],y
$1b:852d  6b			rtl
$1b:852e  31 5c		 and ($5c),y
$1b:8530  9c 4e 78	  stz $784e
$1b:8533  ea			nop
$1b:8534  43 63		 eor $63,s
$1b:8536  7c 2a 14	  jmp ($142a,x)
$1b:8539  80 74		 bra $85af
$1b:853b  95 20		 sta $20,x
$1b:853d  9d 29 48	  sta $4829,x
$1b:8540  00 5b		 brk #$5b
$1b:8542  d2 38		 cmp ($38)
$1b:8544  73 71		 adc ($71,s),y
$1b:8546  b9 9c 66	  lda $669c,y
$1b:8549  78			sei
$1b:854a  00 80		 brk #$80
$1b:854c  04 dd		 tsb $dd
$1b:854e  e8			inx
$1b:854f  77 84		 adc [$84],y
$1b:8551  fa			plx
$1b:8552  01 87		 ora ($87,x)
$1b:8554  08			php
$1b:8555  06 1d		 asl $1d
$1b:8557  cf 73 fd 49   cmp $49fd73
$1b:855b  eb			xba
$1b:855c  f2 ee		 sbc ($ee)
$1b:855e  fc 8b d7	  jsr ($d78b,x)
$1b:8561  f1 f9		 sbc ($f9),y
$1b:8563  fc 50 59	  jsr ($5950,x)
$1b:8566  f7 48		 sbc [$48],y
$1b:8568  e7 c1		 sbc [$c1]
$1b:856a  5e 00 03	  lsr $0300,x
$1b:856d  ee 3f d7	  inc $d73f
$1b:8570  8a			txa
$1b:8571  bf 5e 70 3c   lda $3c705e,x
$1b:8575  16 e0		 asl $e0,x
$1b:8577  ca			dex
$1b:8578  17 13		 ora [$13],y
$1b:857a  3e c2 4f	  rol $4fc2,x
$1b:857d  13 6d		 ora ($6d,s),y
$1b:857f  13 41		 ora ($41,s),y
$1b:8581  73 00		 adc ($00,s),y
$1b:8583  b0 74		 bcs $85f9
$1b:8585  25 b9		 and $b9
$1b:8587  de 36 fe	  dec $fe36,x
$1b:858a  b7 26		 lda [$26],y
$1b:858c  2e ef 2b	  rol $2bef
$1b:858f  76 7c		 ror $7c,x
$1b:8591  36 0e		 rol $0e,x
$1b:8593  fc 15 83	  jsr ($8315,x)
$1b:8596  bf c0 1e 11   lda $111ec0,x
$1b:859a  f1 94		 sbc ($94),y
$1b:859c  e3 79		 sbc $79,s
$1b:859e  2b			pld
$1b:859f  22 f2 71 f9   jsl $f971f2
$1b:85a3  1c 65 91	  trb $9165
$1b:85a6  f9 71 7c	  sbc $7c71,y
$1b:85a9  82 7e 64	  brl $ea2a
$1b:85ac  cb			wai
$1b:85ad  da			phx
$1b:85ae  5d f3 77	  eor $77f3,x
$1b:85b1  9f fd 20 ac   sta $ac20fd,x
$1b:85b5  a0 43 87	  ldy #$8743
$1b:85b8  73 5f		 adc ($5f,s),y
$1b:85ba  92 e4		 sta ($e4)
$1b:85bc  2d c1 6e	  and $6ec1
$1b:85bf  1d d4 a0	  ora $a0d4,x
$1b:85c2  36 47		 rol $47,x
$1b:85c4  9f dd e7 44   sta $44e7dd,x
$1b:85c8  f1 5c		 sbc ($5c),y
$1b:85ca  86 38		 stx $38
$1b:85cc  33 c6		 and ($c6,s),y
$1b:85ce  4d c8 74	  eor $74c8
$1b:85d1  0f ab c7 e2   ora $e2c7ab
$1b:85d5  76 83		 ror $83,x
$1b:85d7  54 9a c3	  mvn $c3,$9a
$1b:85da  d0 6b		 bne $8647
$1b:85dc  17 ad		 ora [$ad],y
$1b:85de  b6 3d		 ldx $3d,y
$1b:85e0  0f 27 ee 00   ora $00ee27
$1b:85e4  f1 ce		 sbc ($ce),y
$1b:85e6  a2 1c 38	  ldx #$381c
$1b:85e9  af 1a c5 7b   lda $7bc51a
$1b:85ed  36 b9		 rol $b9,x
$1b:85ef  07 8d		 ora [$8d]
$1b:85f1  64 82		 stz $82
$1b:85f3  21 88		 and ($88,x)
$1b:85f5  78			sei
$1b:85f6  d7 9f		 cmp [$9f],y
$1b:85f8  f3 b5		 sbc ($b5,s),y
$1b:85fa  fd 3c 6b	  sbc $6b3c,x
$1b:85fd  58			cli
$1b:85fe  11 0d		 ora ($0d),y
$1b:8600  6b			rtl
$1b:8601  c6 b4		 dec $b4
$1b:8603  81 10		 sta ($10,x)
$1b:8605  d2 8d		 cmp ($8d)
$1b:8607  3d e3 3c	  and $3ce3,x
$1b:860a  c4 38		 cpy $38
$1b:860c  6f 5e 3a 82   adc $823a5e
$1b:8610  f4 9f a9	  pea $a99f
$1b:8613  3d 6b ec	  and $ec6b,x
$1b:8616  6f 6b fb e9   adc $e9fb6b
$1b:861a  78			sei
$1b:861b  a7 10		 lda [$10]
$1b:861d  e2 ff		 sep #$ff
$1b:861f  f8			sed
$1b:8620  af 53 6f 16   lda $166f53
$1b:8624  63 14		 adc $14,s
$1b:8626  21 0c		 and ($0c,x)
$1b:8628  86 83		 stx $83
$1b:862a  30 04		 bmi $8630
$1b:862c  18			clc
$1b:862d  3e 81 bc	  rol $bc81,x
$1b:8630  5a			phy
$1b:8631  0c 91 04	  tsb $0491
$1b:8634  31 00		 and ($00),y
$1b:8636  52 cc		 eor ($cc)
$1b:8638  43 f3		 eor $f3,s
$1b:863a  0d e2 cd	  ora $cde2
$1b:863d  f9 c8 21	  sbc $21c8,y
$1b:8640  fa			plx
$1b:8641  cd 89 0a	  cmp $0a89
$1b:8644  0d 9b 2d	  ora $2d9b
$1b:8647  e4 39		 cpx $39
$1b:8649  bc 9a 40	  ldy $409a,x
$1b:864c  08			php
$1b:864d  69 46		 adc #$46
$1b:864f  93 bd		 sta ($bd,s),y
$1b:8651  de 9c 43	  dec $439c,x
$1b:8654  9b			txy
$1b:8655  95 ca		 sta $ca,x
$1b:8657  73 09		 adc ($09,s),y
$1b:8659  e0 4f		 cpx #$4f
$1b:865b  06 f7		 asl $f7
$1b:865d  9a			txs
$1b:865e  fc f9 e8	  jsr ($e8f9,x)
$1b:8661  df 4f 7a bf   cmp $bf7a4f,x
$1b:8665  d8			cld
$1b:8666  1e d1 f6	  asl $f6d1,x
$1b:8669  fd ca 66	  sbc $66ca,x
$1b:866c  11 68		 ora ($68),y
$1b:866e  87 5d		 sta [$5d]
$1b:8670  be 5c 57	  ldx $575c,y
$1b:8673  c9 bb		 cmp #$bb
$1b:8675  c2 59		 rep #$59
$1b:8677  1e 8c 77	  asl $778c,x
$1b:867a  db			stp
$1b:867b  e5 a0		 sbc $a0
$1b:867d  83 e8		 sta $e8,s
$1b:867f  33 1a		 and ($1a,s),y
$1b:8681  0d 04 02	  ora $0204
$1b:8684  2a			rol a
$1b:8685  51 00		 eor ($00),y
$1b:8687  90 37		 bcc $86c0
$1b:8689  cb			wai
$1b:868a  31 0f		 and ($0f),y
$1b:868c  06 06		 asl $06
$1b:868e  63 31		 adc $31,s
$1b:8690  00 e3		 brk #$e3
$1b:8692  04 5b		 tsb $5b
$1b:8694  37 06		 and [$06],y
$1b:8696  cd 8a c6	  cmp $c68a
$1b:8699  01 d7		 ora ($d7,x)
$1b:869b  08			php
$1b:869c  b4 02		 ldy $02,x
$1b:869e  1c df 3e	  trb $3edf
$1b:86a1  f8			sed
$1b:86a2  c7 5b		 cmp [$5b]
$1b:86a4  f0 4a		 beq $86f0
$1b:86a6  dd e9 a4	  cmp $a4e9,x
$1b:86a9  db			stp
$1b:86aa  f0 12		 beq $86be
$1b:86ac  1e e7 70	  asl $70e7,x
$1b:86af  68			pla
$1b:86b0  8d f3 ff	  sta $fff3
$1b:86b3  fb			xce
$1b:86b4  7c 9c e8	  jmp ($e89c,x)
$1b:86b7  9f 3d bf e9   sta $e9bf3d,x
$1b:86bb  ff 58 7b 07   sbc $077b58,x
$1b:86bf  da			phx
$1b:86c0  5e de 9f	  lsr $9fde,x
$1b:86c3  69 a4		 adc #$a4
$1b:86c5  c2 25		 rep #$25
$1b:86c7  ed da e7	  sbc $e7da
$1b:86ca  60			rts
$1b:86cb  1a			inc a
$1b:86cc  cf 63 d4 df   cmp $dfd463
$1b:86d0  e9 b5 d2	  sbc #$d2b5
$1b:86d3  c0 34 9e	  cpy #$9e34
$1b:86d6  ce 28 3c	  dec $3c28
$1b:86d9  de a9 ad	  dec $ada9,x
$1b:86dc  7e 0e 63	  ror $630e,x
$1b:86df  40			rti
$1b:86e0  1f 1c 53 f8   ora $f8531c,x
$1b:86e4  11 20		 ora ($20),y
$1b:86e6  09 3e a0	  ora #$a03e
$1b:86e9  80 b4		 bra $869f
$1b:86eb  19 27 f1	  ora $f127,y
$1b:86ee  86 8a		 stx $8a
$1b:86f0  0f 9b 1f 97   ora $971f9b
$1b:86f4  9c 6a 80	  stz $806a
$1b:86f7  b1 87		 lda ($87),y
$1b:86f9  b7 8d		 lda [$8d],y
$1b:86fb  fa			plx
$1b:86fc  83 a1		 sta $a1,s
$1b:86fe  d1 c1		 cmp ($c1),y
$1b:8700  b7 bc		 lda [$bc],y
$1b:8702  dc ab 78	  jml [$78ab]
$1b:8705  01 a1		 ora ($a1,x)
$1b:8707  ee 3e 08	  inc $083e
$1b:870a  28			plp
$1b:870b  60			rts
$1b:870c  10 e7		 bpl $86f5
$1b:870e  c9 3f 05	  cmp #$053f
$1b:8711  16 43		 asl $43,x
$1b:8713  a1 36		 lda ($36,x)
$1b:8715  91 ac		 sta ($ac),y
$1b:8717  41 a1		 eor ($a1,x)
$1b:8719  e4 e3		 cpx $e3
$1b:871b  f2 38		 sbc ($38)
$1b:871d  ce f3 6f	  dec $6ff3
$1b:8720  7a			ply
$1b:8721  7f d6 1e c1   adc $c11ed6,x
$1b:8725  f6 97		 inc $97,x
$1b:8727  b8			clv
$1b:8728  e4 00		 cpx $00
$1b:872a  20 80 3b	  jsr $3b80
$1b:872d  fc 01 e1	  jsr ($e101,x)
$1b:8730  1f 11 78 cf   ora $cf7811,x
$1b:8734  c8			iny
$1b:8735  9e 55 f3	  stz $f355,x
$1b:8738  37 9d		 and [$9d],y
$1b:873a  fd 11 e9	  sbc $e911,x
$1b:873d  9f 55 7a ef   sta $ef7a55,x
$1b:8741  d9 9e dd	  cmp $dd9e,y
$1b:8744  f7 77		 sbc [$77],y
$1b:8746  bf fc 21 e2   lda $e221fc,x
$1b:874a  1f 19 79 0f   ora $0f7919,x
$1b:874e  ca			dex
$1b:874f  9e 65 f3	  stz $f365,x
$1b:8752  b7 a1		 lda [$a1],y
$1b:8754  fd 31 ea	  sbc $ea31,x
$1b:8757  9f 5d 7b 2f   sta $2f7b5d,x
$1b:875b  db			stp
$1b:875c  9e ed f7	  stz $f7ed,x
$1b:875f  f7 83		 sbc [$83],y
$1b:8761  fc 41 e3	  jsr ($e341,x)
$1b:8764  1f 21 79 4f   ora $4f7921,x
$1b:8768  cc 9e 75	  cpy $759e
$1b:876b  f3 f3		 sbc ($f3,s),y
$1b:876d  7c ec 77	  jmp ($77ec,x)
$1b:8770  3b			tsc
$1b:8771  0d 16 71	  ora $7116
$1b:8774  20 8f c6	  jsr $c68f
$1b:8777  20 f0 73	  jsr $73f0
$1b:877a  f1 ee		 sbc ($ee),y
$1b:877c  e6 7f		 inc $7f
$1b:877e  bd 9c 43	  lda $439c,x
$1b:8781  c6 a3		 dec $a3
$1b:8783  0e 54 c6	  asl $c654
$1b:8786  72 7e		 adc ($7e)
$1b:8788  3d fc d9	  and $d9fc,x
$1b:878b  5e 18 99	  lsr $9918,x
$1b:878e  b4 27		 ldy $27,x
$1b:8790  ed 11 f3	  sbc $f311
$1b:8793  79 cf c7	  adc $c7cf,y
$1b:8796  ef e6 af c2   sbc $c2afe6
$1b:879a  44 c2 3f	  mvp $3f,$c2
$1b:879d  79 f8 fb	  adc $fbf8,y
$1b:87a0  b9 9e fe	  lda $fe9e,y
$1b:87a3  6e 83 9e	  ror $9e83
$1b:87a6  a8			tay
$1b:87a7  63 e9		 adc $e9,s
$1b:87a9  18			clc
$1b:87aa  7e 39 f8	  ror $f839,x
$1b:87ad  fb			xce
$1b:87ae  99 8c e4	  sta $e48c,y
$1b:87b1  62 49 58	  per $dffd
$1b:87b4  92 76		 sta ($76)
$1b:87b6  28			plp
$1b:87b7  8e 00 3f	  stx $3f00
$1b:87ba  1d de cc	  ora $ccde,x
$1b:87bd  ef 08 8b c8   sbc $c88b08
$1b:87c1  68			pla
$1b:87c2  53 c9		 eor ($c9,s),y
$1b:87c4  e1 f8		 sbc ($f8,x)
$1b:87c6  e3 91		 sbc $91,s
$1b:87c8  87 f8		 sta [$f8]
$1b:87ca  41 00		 eor ($00,x)
$1b:87cc  43 02		 eor $02,s
$1b:87ce  9e 4f 9f	  stz $9f4f,x
$1b:87d1  49 10 98	  eor #$9810
$1b:87d4  48			pha
$1b:87d5  22 16 07 98   jsl $980716
$1b:87d9  40			rti
$1b:87da  6f d7 f3 f1   adc $f1f3d7
$1b:87de  c1 e0		 cmp ($e0,x)
$1b:87e0  cf 1c f7 73   cmp $73f71c
$1b:87e4  05 e1		 ora $e1
$1b:87e6  11 f7		 ora ($f7),y
$1b:87e8  7c e1 90	  jmp ($90e1,x)
$1b:87eb  28			plp
$1b:87ec  64 38		 stz $38
$1b:87ee  34 a1		 bit $a1,x
$1b:87f0  f0 80		 beq $8772
$1b:87f2  85 81		 sta $81
$1b:87f4  ec ee f0	  cpx $f0ee
$1b:87f7  ab			plb
$1b:87f8  bc bc 06	  ldy $06bc,x
$1b:87fb  40			rti
$1b:87fc  30 8e		 bmi $878c
$1b:87fe  3a			dec a
$1b:87ff  bd 74 53	  lda $5374,x
$1b:8802  f2 00		 sbc ($00)
$1b:8804  94 e9		 sty $e9,x
$1b:8806  14 81		 trb $81
$1b:8808  30 09		 bmi $8813
$1b:880a  85 c1		 sta $c1
$1b:880c  74 7f		 stz $7f,x
$1b:880e  0f 02 7c 22   ora $227c02
$1b:8812  0a			asl a
$1b:8813  21 c0		 and ($c0,x)
$1b:8815  5f c3 29 18   eor $1829c3,x
$1b:8819  88			dey
$1b:881a  2b			pld
$1b:881b  c2 10		 rep #$10
$1b:881d  b2 1a		 lda ($1a)
$1b:881f  46 43		 lsr $43
$1b:8821  b0 2a		 bcs $884d
$1b:8823  3f ed e6 fb   and $fbe6ed,x
$1b:8827  79 a2 4e	  adc $4ea2,y
$1b:882a  60			rts
$1b:882b  93 99		 sta ($99,s),y
$1b:882d  44 46 22	  mvp $22,$46
$1b:8830  2a			rol a
$1b:8831  3f 1f 0b cd   and $cd0b1f,x
$1b:8835  c4 91		 cpy $91
$1b:8837  71 24		 adc ($24),y
$1b:8839  9d 89 47	  sta $4789,x
$1b:883c  43 e0		 eor $e0,s
$1b:883e  2a			rol a
$1b:883f  3f c5 c2 f9   and $f9c2c5,x
$1b:8843  78			sei
$1b:8844  7b			tdc
$1b:8845  84 8a		 sty $8a
$1b:8847  39 01 8f	  and $8f01,y
$1b:884a  47 91		 eor [$91]
$1b:884c  52 8a		 eor ($8a)
$1b:884e  8b			phb
$1b:884f  3d 19 fe	  and $fe19,x
$1b:8852  14 1c		 trb $1c
$1b:8854  f5 67		 sbc $67,x
$1b:8856  0d 41 c3	  ora $c341
$1b:8859  71 c5		 adc ($c5),y
$1b:885b  46 6f		 lsr $6f
$1b:885d  68			pla
$1b:885e  15 f2		 ora $f2,x
$1b:8860  f8			sed
$1b:8861  0a			asl a
$1b:8862  b2 3c		 lda ($3c)
$1b:8864  04 57		 tsb $57
$1b:8866  f9 fc 65	  sbc $65fc,y
$1b:8869  1d c1 30	  ora $30c1,x
$1b:886c  09 61 4b	  ora #$4b61
$1b:886f  84 06		 sty $06
$1b:8871  fc a9 41	  jsr ($41a9,x)
$1b:8874  fb			xce
$1b:8875  25 d8		 and $d8
$1b:8877  5e d4 19	  lsr $19d4,x
$1b:887a  f4 fd 94	  pea $94fd
$1b:887d  77 fa		 adc [$fa],y
$1b:887f  30 85		 bmi $8806
$1b:8881  04 a1		 tsb $a1
$1b:8883  77 65		 adc [$65],y
$1b:8885  1c 72 30	  trb $3072
$1b:8888  7f 08 22 08   adc $082208,x
$1b:888c  60			rts
$1b:888d  53 c9		 eor ($c9,s),y
$1b:888f  f3 28		 sbc ($28,s),y
$1b:8891  e0 f0 64	  cpx #$64f0
$1b:8894  78			sei
$1b:8895  40			rti
$1b:8896  6c c9 30	  jmp ($30c9)
$1b:8899  13 b3		 ora ($b3,s),y
$1b:889b  84 2f		 sty $2f
$1b:889d  d6 c8		 dec $c8,x
$1b:889f  95 b2		 sta $b2,x
$1b:88a1  32 76		 and ($76)
$1b:88a3  71 ff		 adc ($ff),y
$1b:88a5  7e f2 7d	  ror $7df2,x
$1b:88a8  bc 9d 43	  ldy $439d,x
$1b:88ab  07 40		 ora [$40]
$1b:88ad  62 0f 0c	  per $94bf
$1b:88b0  d4 76		 pei ($76)
$1b:88b2  fa			plx
$1b:88b3  75 be		 adc $be,x
$1b:88b5  8d 21 69	  sta $6921
$1b:88b8  1d 9c 35	  ora $359c,x
$1b:88bb  e6 a2		 inc $a2
$1b:88bd  50 85		 bvc $8844
$1b:88bf  f0 a5		 beq $8866
$1b:88c1  e2 34		 sep #$34
$1b:88c3  99 43 21	  sta $2143,y
$1b:88c6  30 68		 bmi $8930
$1b:88c8  2c 09 42	  bit $4209
$1b:88cb  17 f3		 ora [$f3],y
$1b:88cd  92 dc		 sta ($dc)
$1b:88cf  41 83		 eor ($83,x)
$1b:88d1  02 80		 cop #$80
$1b:88d3  c3 d2		 cmp $d2,s
$1b:88d5  02 e3		 cop #$e3
$1b:88d7  a3 fb		 lda $fb,s
$1b:88d9  20 c2 38	  jsr $38c2
$1b:88dc  da			phx
$1b:88dd  f3 51		 sbc ($51,s),y
$1b:88df  7e 3a 1f	  ror $1f3a,x
$1b:88e2  0f 04 43 c1   ora $c14304
$1b:88e6  20 e0 15	  jsr $15e0
$1b:88e9  43 80		 eor $80,s
$1b:88eb  ea			nop
$1b:88ec  3b			tsc
$1b:88ed  fd fa fd	  sbc $fdfa,x
$1b:88f0  7c 51 81	  jmp ($8151,x)
$1b:88f3  8c ad 8e	  sty $8ead
$1b:88f6  a3 8f		 lda $8f,s
$1b:88f8  47 27		 eor [$27]
$1b:88fa  d2 c8		 cmp ($c8)
$1b:88fc  94 b2		 sty $b2,x
$1b:88fe  52 d6		 eor ($d6)
$1b:8900  18			clc
$1b:8901  38			sec
$1b:8902  ab			plb
$1b:8903  dd 45 38	  cmp $3845,x
$1b:8906  98			tya
$1b:8907  23 c2		 and $c2,s
$1b:8909  11 30		 ora ($30),y
$1b:890b  5a			phy
$1b:890c  c5 fa		 cmp $fa
$1b:890e  49 37		 eor #$37
$1b:8910  91 ca		 sta ($ca),y
$1b:8912  e2 11		 sep #$11
$1b:8914  28			plp
$1b:8915  64 32		 stz $32
$1b:8917  07 03		 ora [$03]
$1b:8919  75 1d		 adc $1d,x
$1b:891b  b2 91		 lda ($91)
$1b:891d  cc c4 62	  cpy $62c4
$1b:8920  22 0f 50 b0   jsl $b0500f
$1b:8924  60			rts
$1b:8925  30 0e		 bmi $8935
$1b:8927  a3 5f		 lda $5f,s
$1b:8929  7b			tdc
$1b:892a  3f dc 1e ee   and $ee1edc,x
$1b:892e  b9 fc d8	  lda $d8fc,y
$1b:8931  82 94 49	  brl $d2c8
$1b:8934  dc ec 75	  jml [$75ec]
$1b:8937  72 2a		 adc ($2a)
$1b:8939  e5 71		 sbc $71
$1b:893b  34 77		 bit $77,x
$1b:893d  0b			phd
$1b:893e  00 7c		 brk #$7c
$1b:8940  08			php
$1b:8941  74 0f		 stz $0f,x
$1b:8943  60			rts
$1b:8944  3b			tsc
$1b:8945  17 c2		 ora [$c2],y
$1b:8947  ff 60 4a 80   sbc $804a60,x
$1b:894b  96 0f		 stx $0f,y
$1b:894d  fc 2f 6a	  jsr ($6a2f,x)
$1b:8950  4c da 73	  jmp $73da
$1b:8953  06 80		 asl $80
$1b:8955  89 84		 bit #$84
$1b:8957  5e c0 30	  lsr $30c0,x
$1b:895a  bb			tyx
$1b:895b  92 bc		 sta ($bc)
$1b:895d  f7 85		 sbc [$85],y
$1b:895f  32 84		 and ($84)
$1b:8961  5c 2f 97 84   jml $84972f
$1b:8965  f8			sed
$1b:8966  44 ad 8a	  mvp $8a,$ad
$1b:8969  30 8c		 bmi $88f7
$1b:896b  9e 3c b2	  stz $b23c,x
$1b:896e  9f fe da fc   sta $fcdafe,x
$1b:8972  24 8c		 bit $8c
$1b:8974  23 ff		 and $ff,s
$1b:8976  96 ac		 stx $ac,y
$1b:8978  ee c2 f6	  inc $f6c2
$1b:897b  13 f2		 ora ($f2,s),y
$1b:897d  8c 23 84	  sty $8423
$1b:8980  21 21		 and ($21,x)
$1b:8982  81 7e		 sta ($7e,x)
$1b:8984  c1 43		 cmp ($43,x)
$1b:8986  77 b0		 adc [$b0],y
$1b:8988  5c 1f 46 43   jml $43461f
$1b:898c  0b			phd
$1b:898d  81 68		 sta ($68,x)
$1b:898f  ef d3 c9 f8   sbc $f8c9d3
$1b:8993  28			plp
$1b:8994  9c ce 93	  stz $93ce
$1b:8997  82 ce 51	  brl $db68
$1b:899a  27 73		 and [$73]
$1b:899c  b1 d1		 lda ($d1),y
$1b:899e  dd ac 97	  cmp $97ac,x
$1b:89a1  cb			wai
$1b:89a2  44 52 d0	  mvp $d0,$52
$1b:89a5  9d 04 e8	  sta $e804,x
$1b:89a8  06 53		 asl $53
$1b:89aa  ff da 2f 86   sbc $862fda,x
$1b:89ae  0a			asl a
$1b:89af  f8			sed
$1b:89b0  a3 2b		 lda $2b,s
$1b:89b2  60			rts
$1b:89b3  e8			inx
$1b:89b4  e7 8b		 sbc [$8b]
$1b:89b6  01 81		 ora ($81,x)
$1b:89b8  4f 14 e0 d7   eor $d7e014
$1b:89bc  62 88 14	  per $9e47
$1b:89bf  40			rti
$1b:89c0  aa			tax
$1b:89c1  55 09		 eor $09,x
$1b:89c3  04 42		 tsb $42
$1b:89c5  41 20		 eor ($20,x)
$1b:89c7  a0 22		 ldy #$22
$1b:89c9  c1 5e		 cmp ($5e,x)
$1b:89cb  50 89		 bvc $8956
$1b:89cd  82 4c 20	  brl $aa1c
$1b:89d0  37 eb		 and [$eb],y
$1b:89d2  f8			sed
$1b:89d3  e8			inx
$1b:89d4  c7 44		 cmp [$44]
$1b:89d6  fb			xce
$1b:89d7  24 38		 bit $38
$1b:89d9  22 c2 80 9a   jsl $9a80c2
$1b:89dd  75 a7		 adc $a7,x
$1b:89df  b1 7d		 lda ($7d),y
$1b:89e1  ad ee 7f	  lda $7fee
$1b:89e4  7c 78 27	  jmp ($2778,x)
$1b:89e7  c3 5e		 cmp $5e,s
$1b:89e9  2b			pld
$1b:89ea  f1 e7		 sbc ($e7),y
$1b:89ec  93 7c		 sta ($7c,s),y
$1b:89ee  bd e6 ff	  lda $ffe6,x
$1b:89f1  40			rti
$1b:89f2  7a			ply
$1b:89f3  47 d4		 eor [$d4]
$1b:89f5  5e b3 f6	  lsr $f6b3,x
$1b:89f8  27 b5		 and [$b5]
$1b:89fa  7d cd ef	  adc $efcd,x
$1b:89fd  7f 04 78 67   adc $677804,x
$1b:8a01  c5 5e		 cmp $5e
$1b:8a03  3b			tsc
$1b:8a04  f2 67		 sbc ($67)
$1b:8a06  97 7c		 sta [$7c],y
$1b:8a08  dd e7 ff	  cmp $ffe7,x
$1b:8a0b  48			pha
$1b:8a0c  7a			ply
$1b:8a0d  87 d6		 sta [$d6]
$1b:8a0f  5e c3 f6	  lsr $f6c3,x
$1b:8a12  a7 b9		 lda [$b9]
$1b:8a14  7d ed e0	  adc $e0ed,x
$1b:8a17  7f 0c 78 a7   adc $a7780c,x
$1b:8a1b  c7 5e		 cmp [$5e]
$1b:8a1d  4b			phk
$1b:8a1e  f2 e7		 sbc ($e7)
$1b:8a20  9b			txy
$1b:8a21  7c fd e8	  jmp ($e8fd,x)
$1b:8a24  ff 50 7a c7   sbc $c77a50,x
$1b:8a28  d8			cld
$1b:8a29  5e d3 f7	  lsr $f7d3,x
$1b:8a2c  27 bd		 and [$bd]
$1b:8a2e  7c 0d e1	  jmp ($e10d,x)
$1b:8a31  7f 14 78 e7   adc $e77814,x
$1b:8a35  c9 5e		 cmp #$5e
$1b:8a37  5b			tcd
$1b:8a38  f3 67		 sbc ($67,s),y
$1b:8a3a  9f 7d 1d e9   sta $e91d7d,x
$1b:8a3e  ff 58 7b 07   sbc $077b58,x
$1b:8a42  da			phx
$1b:8a43  5e e3 f7	  lsr $f7e3,x
$1b:8a46  a7 81		 lda [$81]
$1b:8a48  7c 2d e2	  jmp ($e22d,x)
$1b:8a4b  7f 1c 79 27   adc $27791c,x
$1b:8a4f  cb			wai
$1b:8a50  5e 6b f3	  lsr $f36b,x
$1b:8a53  e7 a3		 sbc [$a3]
$1b:8a55  7d 3d ea	  adc $ea3d,x
$1b:8a58  ff 60 7b 47   sbc $477b60,x
$1b:8a5c  dc 5e f3	  jml [$f35e]
$1b:8a5f  f0 27		 beq $8a88
$1b:8a61  85 7c		 sta $7c
$1b:8a63  4d e3 7f	  eor $7fe3
$1b:8a66  24 79		 bit $79
$1b:8a68  67 cd		 adc [$cd]
$1b:8a6a  5e 7b f4	  lsr $f47b,x
$1b:8a6d  67 a7		 adc [$a7]
$1b:8a6f  7d 5d eb	  adc $eb5d,x
$1b:8a72  ff 68 7b 87   sbc $877b68,x
$1b:8a76  de 5e 03	  dec $035e,x
$1b:8a79  f0 a7		 beq $8a22
$1b:8a7b  89 7c		 bit #$7c
$1b:8a7d  6d e4 7f	  adc $7fe4
$1b:8a80  2c 79 a7	  bit $a779
$1b:8a83  cf 5e 8b f4   cmp $f48b5e
$1b:8a87  e7 ab		 sbc [$ab]
$1b:8a89  7d 7d ec	  adc $ec7d,x
$1b:8a8c  ff 70 7b c7   sbc $c77b70,x
$1b:8a90  c0 5e		 cpy #$5e
$1b:8a92  13 f1		 ora ($f1,s),y
$1b:8a94  27 8d		 and [$8d]
$1b:8a96  7c 8d e5	  jmp ($e58d,x)
$1b:8a99  7f 34 79 e7   adc $e77934,x
$1b:8a9d  d1 5e		 cmp ($5e),y
$1b:8a9f  9b			txy
$1b:8aa0  f5 67		 sbc $67,x
$1b:8aa2  af 7d 9d ed   lda $ed9d7d
$1b:8aa6  ff 78 78 07   sbc $077878,x
$1b:8aaa  c2 5e		 rep #$5e
$1b:8aac  23 f1		 and $f1,s
$1b:8aae  a7 91		 lda [$91]
$1b:8ab0  7c ad e6	  jmp ($e6ad,x)
$1b:8ab3  7f 3c 7a 27   adc $277a3c,x
$1b:8ab7  d3 5e		 cmp ($5e,s),y
$1b:8ab9  ab			plb
$1b:8aba  f5 e7		 sbc $e7,x
$1b:8abc  b3 7d		 lda ($7d,s),y
$1b:8abe  bd ee ff	  lda $ffee,x
$1b:8ac1  00 78		 brk #$78
$1b:8ac3  47 c4		 eor [$c4]
$1b:8ac5  5e 33 f2	  lsr $f233,x
$1b:8ac8  27 95		 and [$95]
$1b:8aca  7c cd e7	  jmp ($e7cd,x)
$1b:8acd  7f 44 7a 67   adc $677a44,x
$1b:8ad1  d5 5e		 cmp $5e,x
$1b:8ad3  bb			tyx
$1b:8ad4  f6 67		 inc $67,x
$1b:8ad6  b7 7d		 lda [$7d],y
$1b:8ad8  dd ef ff	  cmp $ffef,x
$1b:8adb  08			php
$1b:8adc  78			sei
$1b:8add  87 c6		 sta [$c6]
$1b:8adf  5e 43 f2	  lsr $f243,x
$1b:8ae2  a7 99		 lda [$99]
$1b:8ae4  7c ed e7	  jmp ($e7ed,x)
$1b:8ae7  f6 83		 inc $83,x
$1b:8ae9  c0 23 f0	  cpy #$f023
$1b:8aec  79 c5 e2	  adc $e2c5,y
$1b:8aef  c1 70		 cmp ($70,x)
$1b:8af1  b0 78		 bcs $8b6b
$1b:8af3  38			sec
$1b:8af4  09 92		 ora #$92
$1b:8af6  e0 40 24	  cpx #$2440
$1b:8af9  1c 08 87	  trb $8708
$1b:8afc  83 f1		 sta $f1,s
$1b:8afe  30 9c		 bmi $8a9c
$1b:8b00  4c 27 f1	  jmp $f127
$1b:8b03  b8			clv
$1b:8b04  fa			plx
$1b:8b05  a8			tay
$1b:8b06  4f e5 01 83   eor $8301e5
$1b:8b0a  41 d6		 eor ($d6,x)
$1b:8b0c  81 00		 sta ($00,x)
$1b:8b0e  df cd 97 24   cmp $2497cd,x
$1b:8b12  7f 38 0b 10   adc $100b38,x
$1b:8b16  af b7 9f ff   lda $ff9fb7
$1b:8b1a  f7 ff		 sbc [$ff],y
$1b:8b1c  cd 3f 95	  cmp $953f
$1b:8b1f  03 01		 ora $01,s
$1b:8b21  c0 6a 0f	  cpy #$0f6a
$1b:8b24  df cf ff f7   cmp $f7ffcf,x
$1b:8b28  ff f3 87 f2   sbc $f287f3,x
$1b:8b2c  82 46 23	  brl $ae75
$1b:8b2f  8e 41 ef	  stx $ef41
$1b:8b32  e7 bf		 sbc [$bf]
$1b:8b34  fd ef ff	  sbc $ffef,x
$1b:8b37  62 05 3c	  per $c73f
$1b:8b3a  8c d9 a2	  sty $a2d9
$1b:8b3d  36 6b		 rol $6b,x
$1b:8b3f  bb			tyx
$1b:8b40  d0 6f		 bne $8bb1
$1b:8b42  f6 eb		 inc $eb,x
$1b:8b44  fd d9 ea	  sbc $ead9,x
$1b:8b47  0e 30 82	  asl $8230
$1b:8b4a  4e 24 8e	  lsr $8e24
$1b:8b4d  43 02		 eor $02,s
$1b:8b4f  a3 bd		 lda $bd,s
$1b:8b51  d6 85		 dec $85,x
$1b:8b53  06 87		 asl $87
$1b:8b55  43 01		 eor $01,s
$1b:8b57  f1 06		 sbc ($06),y
$1b:8b59  82 47 a3	  brl $2ea3
$1b:8b5c  91 f8		 sta ($f8),y
$1b:8b5e  34 08		 bit $08,x
$1b:8b60  3c 01 e0	  bit $e001,x
$1b:8b63  8e 0a c2	  stx $c20a
$1b:8b66  7d 2c 1b	  adc $1b2c,x
$1b:8b69  85 ba		 sta $ba
$1b:8b6b  98			tya
$1b:8b6c  3b			tsc
$1b:8b6d  08			php
$1b:8b6e  0d fa 7f	  ora $7ffa
$1b:8b71  40			rti
$1b:8b72  88			dey
$1b:8b73  25 85		 and $85
$1b:8b75  2e 17 eb	  rol $eb17
$1b:8b78  e5 fc		 sbc $fc
$1b:8b7a  2c 2e f5	  bit $f52e
$1b:8b7d  23 15		 and $15,s
$1b:8b7f  b1 ea		 lda ($ea),y
$1b:8b81  43 f0		 eor $f0,s
$1b:8b83  78			sei
$1b:8b84  95 da		 sta $da,x
$1b:8b86  08			php
$1b:8b87  1d 00 e8	  ora $e800,x
$1b:8b8a  43 21		 eor $21,s
$1b:8b8c  00 d9		 brk #$d9
$1b:8b8e  b3 4d		 lda ($4d,s),y
$1b:8b90  a4 83		 ldy $83
$1b:8b92  70 25		 bvs $8bb9
$1b:8b94  83 be		 sta $be,s
$1b:8b96  1e a6 be	  asl $bea6,x
$1b:8b99  44 7d 5f	  mvp $5f,$7d
$1b:8b9c  e7 fc		 sbc [$fc]
$1b:8b9e  09 07		 ora #$07
$1b:8ba0  03 c0		 ora $c0,s
$1b:8ba2  a4 3f		 ldy $3f
$1b:8ba4  fa			plx
$1b:8ba5  ac 3c 1c	  ldy $1c3c
$1b:8ba8  4c 47 2a	  jmp $2a47
$1b:8bab  29 0d		 and #$0d
$1b:8bad  89 46		 bit #$46
$1b:8baf  d6 81		 dec $81,x
$1b:8bb1  11 8c		 ora ($8c),y
$1b:8bb3  c4 73		 cpy $73
$1b:8bb5  31 0c		 and ($0c),y
$1b:8bb7  c4 42		 cpy $42
$1b:8bb9  09 09		 ora #$09
$1b:8bbb  5f 94 36 13   eor $133694,x
$1b:8bbf  8d 63 0f	  sta $0f63
$1b:8bc2  b7 93		 lda [$93],y
$1b:8bc4  fd f4 e2	  sbc $e2f4,x
$1b:8bc7  22 18 48 c6   jsl $c64818
$1b:8bcb  6a			ror a
$1b:8bcc  09 86		 ora #$86
$1b:8bce  82 61 e0	  brl $6c32
$1b:8bd1  58			cli
$1b:8bd2  38			sec
$1b:8bd3  0f 87 82 db   ora $db8287
$1b:8bd7  08			php
$1b:8bd8  14 10		 trb $10
$1b:8bda  5e 10 c8	  lsr $c810,x
$1b:8bdd  84 62		 sty $62
$1b:8bdf  21 30		 and ($30,x)
$1b:8be1  90 7c		 bcc $8c5f
$1b:8be3  2c 1f 0f	  bit $0f1f
$1b:8be6  07 e3		 ora [$e3]
$1b:8be8  e1 00		 sbc ($00,x)
$1b:8bea  77 ec		 adc [$ec],y
$1b:8bec  06 0c		 asl $0c
$1b:8bee  ff 18 74 3e   sbc $3e7418,x
$1b:8bf2  1d 1f 8b	  ora $8b1f,x
$1b:8bf5  01 c2		 ora ($c2,x)
$1b:8bf7  6f 26 05 84   adc $840526
$1b:8bfb  0a			asl a
$1b:8bfc  f9 39 a3	  sbc $a339,y
$1b:8bff  20 d8 b2	  jsr $b2d8
$1b:8c02  07 d9		 ora [$d9]
$1b:8c04  22 19 1c 20   jsl $201c19
$1b:8c08  5f cd c8 49   eor $49c8cd,x
$1b:8c0c  cb			wai
$1b:8c0d  69 3f		 adc #$3f
$1b:8c0f  a0 44 05	  ldy #$0544
$1b:8c12  0a			asl a
$1b:8c13  1b			tcs
$1b:8c14  0b			phd
$1b:8c15  f5 80		 sbc $80,x
$1b:8c17  7f c1 fa bf   adc $bffac1,x
$1b:8c1b  db			stp
$1b:8c1c  83 a0		 sta $a0,s
$1b:8c1e  83 03		 sta $03,s
$1b:8c20  79 0d 5a	  adc $5a0d,y
$1b:8c23  ff 7e 2f 84   sbc $842f7e,x
$1b:8c27  12 30		 ora ($30)
$1b:8c29  81 08		 sta ($08,x)
$1b:8c2b  e2 11		 sep #$11
$1b:8c2d  df e7 06 83   cmp $8306e7,x
$1b:8c31  a5 1e		 lda $1e
$1b:8c33  23 62		 and $62,s
$1b:8c35  4f 84 4a c9   eor $c94a84
$1b:8c39  76 b2		 ror $b2,x
$1b:8c3b  5f 2d 0a 70   eor $700a2d,x
$1b:8c3f  bc 5c 2f	  ldy $2f5c,x
$1b:8c42  97 82		 sta [$82],y
$1b:8c44  18			clc
$1b:8c45  2b			pld
$1b:8c46  c8			iny
$1b:8c47  8a			txa
$1b:8c48  84 52		 sty $52
$1b:8c4a  a0 60		 ldy #$60
$1b:8c4c  d7 e1		 cmp [$e1],y
$1b:8c4e  20 e3 f9	  jsr $f9e3
$1b:8c51  f8			sed
$1b:8c52  ff ff 7b 1c   sbc $1c7bff,x
$1b:8c56  77 6c		 adc [$6c],y
$1b:8c58  b0 90		 bcs $8bea
$1b:8c5a  d1 99		 cmp ($99),y
$1b:8c5c  e0 13		 cpx #$13
$1b:8c5e  2b			pld
$1b:8c5f  fd da ff	  sbc $ffda,x
$1b:8c62  56 bf		 lsr $bf,x
$1b:8c64  d7 af		 cmp [$af],y
$1b:8c66  f4 e2 fb	  pea $fbe2
$1b:8c69  8d 14 1f	  sta $1f14
$1b:8c6c  4e b3 70	  lsr $70b3
$1b:8c6f  7b			tdc
$1b:8c70  c7 cc		 cmp [$cc]
$1b:8c72  44 44 15	  mvp $15,$44
$1b:8c75  58			cli
$1b:8c76  5f a7 93 f8   eor $f893a7,x
$1b:8c7a  74 01		 stz $01,x
$1b:8c7c  8e 11 04	  stx $0411
$1b:8c7f  1d 1b f0	  ora $f01b,x
$1b:8c82  f2 12		 sbc ($12)
$1b:8c84  1e 11 3c	  asl $3c11,x
$1b:8c87  bc dc 42	  ldy $42dc,x
$1b:8c8a  a8			tay
$1b:8c8b  7b			tdc
$1b:8c8c  39 05 90	  and $9005,y
$1b:8c8f  fc 74 24	  jsr ($2474,x)
$1b:8c92  9d b2 f9	  sta $f9b2,x
$1b:8c95  7f cc 85 da   adc $da85cc,x
$1b:8c99  34 8d		 bit $8d,x
$1b:8c9b  69 3e		 adc #$3e
$1b:8c9d  54 a9 a4	  mvn $a4,$a9
$1b:8ca0  fa			plx
$1b:8ca1  69 3c		 adc #$3c
$1b:8ca3  9c 4f 07	  stz $074f
$1b:8ca6  48			pha
$1b:8ca7  a0 14		 ldy #$14
$1b:8ca9  f8			sed
$1b:8caa  35 c2		 and $c2,x
$1b:8cac  fc 74 19	  jsr ($1974,x)
$1b:8caf  f4 f0 f2	  pea $f2f0
$1b:8cb2  10 1b		 bpl $8ccf
$1b:8cb4  f5 e6		 sbc $e6,x
$1b:8cb6  0d 02 86	  ora $8602
$1b:8cb9  43 92		 eor $92,s
$1b:8cbb  82 37 48	  brl $d4f5
$1b:8cbe  04 0e		 tsb $0e
$1b:8cc0  07 0c		 ora [$0c]
$1b:8cc2  86 44		 stx $44
$1b:8cc4  26 72		 rol $72
$1b:8cc6  39 bc 92	  and $92bc,y
$1b:8cc9  d9 48 54	  cmp $5448,y
$1b:8ccc  95 03		 sta $03,x
$1b:8cce  01 90		 ora ($90,x)
$1b:8cd0  b0 5a		 bcs $8d2c
$1b:8cd2  22 1d cc 47   jsl $47cc1d
$1b:8cd6  b2 91		 lda ($91)
$1b:8cd8  6e 82 41	  ror $4182
$1b:8cdb  97 43		 sta [$43],y
$1b:8cdd  00 5f		 brk #$5f
$1b:8cdf  fb			xce
$1b:8ce0  43 dc		 eor $dc,s
$1b:8ce2  3e f2 f7	  rol $f7f2,x
$1b:8ce5  c1 a2		 cmp ($a2,x)
$1b:8ce7  c2 7f		 rep #$7f
$1b:8ce9  06 83		 asl $83
$1b:8ceb  c1 a2		 cmp ($a2,x)
$1b:8ced  12 08		 ora ($08)
$1b:8cef  85 80		 sta $80
$1b:8cf1  22 02 70 0a   jsl $0a7002
$1b:8cf5  85 fa		 sta $fa
$1b:8cf7  d9 7f 22	  cmp $227f,y
$1b:8cfa  0b			phd
$1b:8cfb  fe 83 63	  inc $6383,x
$1b:8cfe  60			rts
$1b:8cff  80 c0		 bra $8cc1
$1b:8d01  a0 30 61	  ldy #$6130
$1b:8d04  88			dey
$1b:8d05  03 40		 ora $40,s
$1b:8d07  1a			inc a
$1b:8d08  13 f9		 ora ($f9,s),y
$1b:8d0a  b0 6f		 bcs $8d7b
$1b:8d0c  c7 85		 cmp [$85]
$1b:8d0e  0f 82 46 e0   ora $e04682
$1b:8d12  e7 a3		 sbc [$a3]
$1b:8d14  bf df af f1   lda $f1afdf,x
$1b:8d18  04 e8		 tsb $e8
$1b:8d1a  be 1e 7f	  ldx $7f1e,y
$1b:8d1d  3a			dec a
$1b:8d1e  bf 8f 04 1f   lda $1f048f,x
$1b:8d22  ef 81 82 26   sbc $268281
$1b:8d26  8a			txa
$1b:8d27  01 0c		 ora ($0c,x)
$1b:8d29  84 15		 sty $15
$1b:8d2b  48			pha
$1b:8d2c  ff c6 f8 b9   sbc $b9f8c6,x
$1b:8d30  d8			cld
$1b:8d31  ae d6 4b	  ldx $4bd6
$1b:8d34  e5 a2		 sbc $a2
$1b:8d36  09 08 82	  ora #$8208
$1b:8d39  46 16		 lsr $16
$1b:8d3b  21 1c		 and ($1c,x)
$1b:8d3d  5a			phy
$1b:8d3e  3c 01 7e	  bit $7e01,x
$1b:8d41  ff ff f7 ff   sbc $fff7ff,x
$1b:8d45  b6 cb		 ldx $cb,y
$1b:8d47  05 fc		 ora $fc
$1b:8d49  5f af 87 b6   eor $b687af,x
$1b:8d4d  5f a4 fa 78   eor $78faa4,x
$1b:8d51  db			stp
$1b:8d52  c6 cf		 dec $cf
$1b:8d54  4f e7 ce bd   eor $bdcee7
$1b:8d58  b6 5f		 ldx $5f,y
$1b:8d5a  ee cd df	  inc $dfcd
$1b:8d5d  b0 2f		 bcs $8d8e
$1b:8d5f  ca			dex
$1b:8d60  19 08 5a	  ora $5a08,y
$1b:8d63  91 67		 sta ($67),y
$1b:8d65  8d a0 49	  sta $49a0
$1b:8d68  25 fc		 and $fc
$1b:8d6a  2a			rol a
$1b:8d6b  41 52		 eor ($52,x)
$1b:8d6d  4b			phk
$1b:8d6e  f9 66 0f	  sbc $0f66,y
$1b:8d71  ff b4 3f cb   sbc $cb3fb4,x
$1b:8d75  f4 f0 7f	  pea $7ff0
$1b:8d78  4a			lsr a
$1b:8d79  b0 2e		 bcs $8da9
$1b:8d7b  d0 e4		 bne $8d61
$1b:8d7d  2f d0 c8 74   and $74c8d0
$1b:8d81  31 7f		 and ($7f),y
$1b:8d83  0a			asl a
$1b:8d84  8f 5c fb 2b   sta $2bfb5c
$1b:8d88  db			stp
$1b:8d89  7e ec f7	  ror $f7ec,x
$1b:8d8c  ef 83 bc 3f   sbc $3fbc83
$1b:8d90  e3 0f		 sbc $0f,s
$1b:8d92  20 f9 4b	  jsr $4bf9
$1b:8d95  cc 7e 74	  cpy $747e
$1b:8d98  f4 2f a5	  pea $a52f
$1b:8d9b  bd 4f eb	  lda $eb4f,x
$1b:8d9e  8f 64 fb 6b   sta $6bfb64
$1b:8da2  dd 7e fc	  cmp $fc7e,x
$1b:8da5  f0 6f		 beq $8e16
$1b:8da7  87 bc		 sta [$bc]
$1b:8da9  5f e4 0f 28   eor $280fe4,x
$1b:8dad  f9 8b ce	  sbc $ce8b,y
$1b:8db0  7e 84 f4	  ror $f484,x
$1b:8db3  af a9 bd 6f   lda $6fbda9
$1b:8db7  ec 8f 6c	  cpx $6c8f
$1b:8dba  fb			xce
$1b:8dbb  ab			plb
$1b:8dbc  df 7e 0c f0   cmp $f00c7e,x
$1b:8dc0  ef 8b bc 7f   sbc $7fbc8b
$1b:8dc4  e5 0f		 sbc $0f
$1b:8dc6  30 f9		 bmi $8dc1
$1b:8dc8  cb			wai
$1b:8dc9  d0 7e		 bne $8e49
$1b:8dcb  94 f5		 sty $f5,x
$1b:8dcd  2f ad bd 8f   and $8fbdad
$1b:8dd1  ed 8f 74	  sbc $748f
$1b:8dd4  fb			xce
$1b:8dd5  eb			xba
$1b:8dd6  c1 7e		 cmp ($7e,x)
$1b:8dd8  1c f1 6f	  trb $6ff1
$1b:8ddb  8f bc 9f e6   sta $e69fbc
$1b:8ddf  0f 38 fa 0b   ora $0bfa38
$1b:8de3  d2 7e		 cmp ($7e)
$1b:8de5  a4 f5		 ldy $f5
$1b:8de7  af b1 bd af   lda $afbdb1
$1b:8deb  ee 8f 7c	  inc $7c8f
$1b:8dee  f8			sed
$1b:8def  2b			pld
$1b:8df0  c3 7e		 cmp $7e,s
$1b:8df2  2c f1 ef	  bit $eff1
$1b:8df5  93 bc		 sta ($bc,s),y
$1b:8df7  bf e7 0f 40   lda $400fe7,x
$1b:8dfb  fa			plx
$1b:8dfc  4b			phk
$1b:8dfd  d4 7e		 pei ($7e)
$1b:8dff  b4 f6		 ldy $f6,x
$1b:8e01  2f b5 bd cf   and $cfbdb5
$1b:8e05  ef 8f 04 f8   sbc $f8048f
$1b:8e09  6b			rtl
$1b:8e0a  c5 7e		 cmp $7e
$1b:8e0c  3c f2 6f	  bit $6ff2,x
$1b:8e0f  97 bc		 sta [$bc],y
$1b:8e11  df e8 0f 48   cmp $480fe8,x
$1b:8e15  fa			plx
$1b:8e16  8b			phb
$1b:8e17  d6 7e		 dec $7e,x
$1b:8e19  c4 f6		 cpy $f6
$1b:8e1b  af b9 bd ef   lda $efbdb9
$1b:8e1f  e0 8f 0c	  cpx #$0c8f
$1b:8e22  f8			sed
$1b:8e23  ab			plb
$1b:8e24  c7 7e		 cmp [$7e]
$1b:8e26  4c f2 ef	  jmp $eff2
$1b:8e29  9b			txy
$1b:8e2a  bc ff e9	  ldy $e9ff,x
$1b:8e2d  0f 50 fa cb   ora $cbfa50
$1b:8e31  d8			cld
$1b:8e32  7e d4 f7	  ror $f7d4,x
$1b:8e35  2f bd bc 0f   and $0fbcbd
$1b:8e39  e1 8f		 sbc ($8f,x)
$1b:8e3b  14 f8		 trb $f8
$1b:8e3d  eb			xba
$1b:8e3e  c9 7e 5c	  cmp #$5c7e
$1b:8e41  f3 6f		 sbc ($6f,s),y
$1b:8e43  9f bd 1f ea   sta $ea1fbd,x
$1b:8e47  0f 58 fb 0b   ora $0bfb58
$1b:8e4b  da			phx
$1b:8e4c  7e e4 80	  ror $80e4,x
$1b:8e4f  2e 10 ac	  rol $ac10
$1b:8e52  4e 2c 53	  lsr $532c
$1b:8e55  8b			phb
$1b:8e56  64 e2		 stz $e2
$1b:8e58  ed 38 c8	  sbc $c838
$1b:8e5b  4e 35 53	  lsr $5335
$1b:8e5e  8e 24 e3	  stx $e324
$1b:8e61  9d 38 ec	  sta $ec38,x
$1b:8e64  4e 3c 53	  lsr $533c
$1b:8e67  8f e4 e2 2d   sta $2de2e4
$1b:8e6b  39 98 4e	  and $4e98,y
$1b:8e6e  67 53		 adc [$53]
$1b:8e70  9a			txs
$1b:8e71  24 e6		 bit $e6
$1b:8e73  9d 39 b4	  sta $b439,x
$1b:8e76  4e 70 53	  lsr $5370
$1b:8e79  9c e4 e7	  stz $e7e4
$1b:8e7c  4d 39 d8	  eor $d839
$1b:8e7f  4e 77 53	  lsr $5377
$1b:8e82  9e a4 e7	  stz $e7a4,x
$1b:8e85  dd 39 84	  cmp $8439,x
$1b:8e88  4e a2 53	  lsr $53a2
$1b:8e8b  a8			tay
$1b:8e8c  e4 ea		 cpx $ea
$1b:8e8e  4d 3a ac	  eor $ac3a
$1b:8e91  4e b1 53	  lsr $53b1
$1b:8e94  ad e4 eb	  lda $ebe4
$1b:8e97  8d 3a e8	  sta $e83a
$1b:8e9a  4e bb 53	  lsr $53bb
$1b:8e9d  a8			tay
$1b:8e9e  64 ee		 stz $ee
$1b:8ea0  7d 3b b8	  adc $b83b,x
$1b:8ea3  4e ef 53	  lsr $53ef
$1b:8ea6  bc e4 ef	  ldy $efe4,x
$1b:8ea9  cd 3b 80	  cmp $803b
$1b:8eac  4f 24 53 ca   eor $ca5324
$1b:8eb0  24 f2		 bit $f2
$1b:8eb2  cd 3c 80	  cmp $803c
$1b:8eb5  11 cf		 ora ($cf),y
$1b:8eb7  11 3c		 ora ($3c),y
$1b:8eb9  ff ff c8 e9   sbc $e9c8ff,x
$1b:8ebd  30 9e		 bmi $8e5d
$1b:8ebf  93 db		 sta ($db,s),y
$1b:8ec1  b0 58		 bcs $8f1b
$1b:8ec3  18			clc
$1b:8ec4  29 1c 60	  and #$601c
$1b:8ec7  24 c1		 bit $c1
$1b:8ec9  82 19 8f	  brl $1de5
$1b:8ecc  80 6c		 bra $8f3a
$1b:8ece  5f c1 38 4c   eor $4c38c1,x
$1b:8ed2  a4 4f		 ldy $4f
$1b:8ed4  02 b8		 cop #$b8
$1b:8ed6  1b			tcs
$1b:8ed7  48			pha
$1b:8ed8  9e 16 84	  stz $8416,x
$1b:8edb  32 e8		 and ($e8)
$1b:8edd  0c 46 4f	  tsb $4f46
$1b:8ee0  23 08		 and $08,s
$1b:8ee2  1b			tcs
$1b:8ee3  40			rti
$1b:8ee4  9e 50 99	  stz $9950,x
$1b:8ee7  f2 85		 sbc ($85)
$1b:8ee9  27 53		 and [$53]
$1b:8eeb  e2 7b		 sep #$7b
$1b:8eed  63 96		 adc $96,s
$1b:8eef  0f 36 9f 93   ora $939f36
$1b:8ef3  db			stp
$1b:8ef4  68			pla
$1b:8ef5  c4 13		 cpy $13
$1b:8ef7  2a			rol a
$1b:8ef8  2e 40 da	  rol $da40
$1b:8efb  9c 66 c2	  stz $c266
$1b:8efe  ff 96 02 7f   sbc $7f0296,x
$1b:8f02  46 18		 lsr $18
$1b:8f04  21 d2		 and ($d2,x)
$1b:8f06  b2 f2		 lda ($f2)
$1b:8f08  5b			tcd
$1b:8f09  e3 38		 sbc $38,s
$1b:8f0b  c9 e4		 cmp #$e4
$1b:8f0d  cd 05 0a	  cmp $0a05
$1b:8f10  79 41 8b	  adc $8b41,y
$1b:8f13  16 a0		 asl $a0,x
$1b:8f15  13 da		 ora ($da,s),y
$1b:8f17  72 1c		 adc ($1c)
$1b:8f19  7f 08 71 f1   adc $f17108,x
$1b:8f1d  34 12		 bit $12,x
$1b:8f1f  78			sei
$1b:8f20  41 c4		 eor ($c4,x)
$1b:8f22  0a			asl a
$1b:8f23  3d 23 48	  and $4823,x
$1b:8f26  5c 48 8b a9   jml $a98b48
$1b:8f2a  18			clc
$1b:8f2b  08			php
$1b:8f2c  f5 05		 sbc $05,x
$1b:8f2e  e0 3d		 cpx #$3d
$1b:8f30  21 38		 and ($38,x)
$1b:8f32  46 68		 lsr $68
$1b:8f34  25 f4		 and $f4
$1b:8f36  a8			tay
$1b:8f37  8e 9c 72	  stx $729c
$1b:8f3a  03 d0		 ora $d0,s
$1b:8f3c  13 96		 ora ($96,s),y
$1b:8f3e  b0 f0		 bcs $8f30
$1b:8f40  be 41 d0	  ldx $d041,y
$1b:8f43  87 d2		 sta [$d2]
$1b:8f45  2b			pld
$1b:8f46  42 13		 wdm #$13
$1b:8f48  b6 f5		 ldx $f5,y
$1b:8f4a  24 f7		 bit $f7
$1b:8f4c  3a			dec a
$1b:8f4d  18			clc
$1b:8f4e  ed 92 20	  sbc $2092
$1b:8f51  4d 4a 6a	  eor $6a4a
$1b:8f54  c1 70		 cmp ($70,x)
$1b:8f56  a9 21		 lda #$21
$1b:8f58  1e a2 6c	  asl $6ca2,x
$1b:8f5b  0b			phd
$1b:8f5c  e9 f5		 sbc #$f5
$1b:8f5e  65 2c		 adc $2c
$1b:8f60  ed 4c ea	  sbc $ea4c
$1b:8f63  50 3c		 bvc $8fa1
$1b:8f65  a6 ad		 ldx $ad
$1b:8f67  c8			iny
$1b:8f68  be 35 30	  ldx $3035,y
$1b:8f6b  87 d2		 sta [$d2]
$1b:8f6d  29 44		 and #$44
$1b:8f6f  13 b6		 ora ($b6,s),y
$1b:8f71  f1 fc		 sbc ($fc),y
$1b:8f73  f6 ba		 inc $ba,x
$1b:8f75  28			plp
$1b:8f76  9c 21 6f	  stz $6f21
$1b:8f79  85 81		 sta $81
$1b:8f7b  a2 ce		 ldx #$ce
$1b:8f7d  99 44 26	  sta $2644,y
$1b:8f80  a0 8d		 ldy #$8d
$1b:8f82  b0 81		 bcs $8f05
$1b:8f84  c5 19		 cmp $19
$1b:8f86  80 55		 bra $8fdd
$1b:8f88  04 60		 tsb $60
$1b:8f8a  13 60		 ora ($60,s),y
$1b:8f8c  38			sec
$1b:8f8d  07 53		 ora [$53]
$1b:8f8f  f6 24		 inc $24,x
$1b:8f91  34 98		 bit $98,x
$1b:8f93  15 5a		 ora $5a,x
$1b:8f95  67 45		 adc [$45]
$1b:8f97  0e a1 94	  asl $94a1
$1b:8f9a  02 a8		 cop #$a8
$1b:8f9c  55 00		 eor $00,x
$1b:8f9e  9b			txy
$1b:8f9f  04 40		 tsb $40
$1b:8fa1  3a			dec a
$1b:8fa2  9a			txs
$1b:8fa3  aa			tax
$1b:8fa4  2b			pld
$1b:8fa5  95 10		 sta $10,x
$1b:8fa7  ed f0 33	  sbc $33f0
$1b:8faa  2a			rol a
$1b:8fab  5c 02 a8 87   jml $87a802
$1b:8faf  07 fb		 ora [$fb]
$1b:8fb1  4b			phk
$1b:8fb2  e8			inx
$1b:8fb3  cf f6 c1 ac   cmp $acc1f6
$1b:8fb7  9f bc b2 10   sta $10b2bc,x
$1b:8fbb  aa			tax
$1b:8fbc  2c 40 3a	  bit $3a40
$1b:8fbf  94 ba		 sty $ba,x
$1b:8fc1  30 b5		 bmi $8f78
$1b:8fc3  1a			inc a
$1b:8fc4  ed 67 68	  sbc $6867
$1b:8fc7  2b			pld
$1b:8fc8  9c 02 a8	  stz $a802
$1b:8fcb  d7 00		 cmp [$00],y
$1b:8fcd  9b			txy
$1b:8fce  2e c0 3a	  rol $3ac0
$1b:8fd1  9a			txs
$1b:8fd2  66 c1		 ror $c1
$1b:8fd4  ac c0 12	  ldy $12c0
$1b:8fd7  dc 26 82	  jml [$8226]
$1b:8fda  86 41		 stx $41
$1b:8fdc  f6 80		 inc $80,x
$1b:8fde  90 22		 bcc $9002
$1b:8fe0  b3 14		 lda ($14,s),y
$1b:8fe2  1a			inc a
$1b:8fe3  29 08		 and #$08
$1b:8fe5  a3 a4		 lda $a4,s
$1b:8fe7  50 76		 bvc $905f
$1b:8fe9  d3 9a		 cmp ($9a,s),y
$1b:8feb  3b			tsc
$1b:8fec  45 09		 eor $09
$1b:8fee  60			rts
$1b:8fef  fb			xce
$1b:8ff0  41 d8		 eor ($d8,x)
$1b:8ff2  2c da c6	  bit $c6da
$1b:8ff5  5c 18 4a fc   jml $fc4a18
$1b:8ff9  f0 d4		 beq $8fcf
$1b:8ffb  73 4a		 adc ($4a,s),y
$1b:8ffd  6c 0e 0a	  jmp ($0a0e)
$1b:9000  6f 6e 99 70   adc $70996e
$1b:9004  5c 24 bf 0e   jml $0ebf24
$1b:9008  c4 f5		 cpy $f5
$1b:900a  ca			dex
$1b:900b  0b			phd
$1b:900c  30 fc		 bmi $900a
$1b:900e  7f ed 73 e4   adc $e473ed,x
$1b:9012  99 7f 13	  sta $137f,y
$1b:9015  0b			phd
$1b:9016  fe 4c 29	  inc $294c,x
$1b:9019  74 13		 stz $13,x
$1b:901b  28			plp
$1b:901c  5f 04 ca 39   eor $39ca04,x
$1b:9020  41 32		 eor ($32,x)
$1b:9022  90 25		 bcc $9049
$1b:9024  c2 c1		 rep #$c1
$1b:9026  17 02		 ora [$02],y
$1b:9028  5d 08 79	  eor $7908,x
$1b:902b  7c e2 b4	  jmp ($b4e2,x)
$1b:902e  24 5a		 bit $5a
$1b:9030  53 5b		 eor ($5b,s),y
$1b:9032  8b			phb
$1b:9033  85 a1		 sta $a1
$1b:9035  22 59 b6 d7   jsl $d7b659
$1b:9039  3a			dec a
$1b:903a  1a			inc a
$1b:903b  2d 37 ad	  and $ad37
$1b:903e  c5 fb		 cmp $fb
$1b:9040  17 06		 ora [$06],y
$1b:9042  0a			asl a
$1b:9043  d6 50		 dec $50,x
$1b:9045  8a			txa
$1b:9046  3f 40 22 80   and $802240,x
$1b:904a  50 08		 bvc $9054
$1b:904c  a0 34		 ldy #$34
$1b:904e  89 a8		 bit #$a8
$1b:9050  db			stp
$1b:9051  02 6a		 cop #$6a
$1b:9053  3f 40 66 80   and $806640,x
$1b:9057  50 19		 bvc $9072
$1b:9059  a0 34		 ldy #$34
$1b:905b  99 60 f1	  sta $f160,y
$1b:905e  42 aa		 wdm #$aa
$1b:9060  3f 40 aa 80   and $80aa40,x
$1b:9064  50 2a		 bvc $9090
$1b:9066  a0 34		 ldy #$34
$1b:9068  96 e1		 stx $e1,y
$1b:906a  10 3c		 bpl $90a8
$1b:906c  0b			phd
$1b:906d  2c 0f 25	  bit $250f
$1b:9070  06 04		 asl $04
$1b:9072  0c 22 01	  tsb $0122
$1b:9075  09 42		 ora #$42
$1b:9077  1a			inc a
$1b:9078  20 0a a5	  jsr $a50a
$1b:907b  08			php
$1b:907c  84 40		 sty $40
$1b:907e  4f 21 00 83   eor $830021
$1b:9082  c0 52		 cpy #$52
$1b:9084  c3 40		 cmp $40,s
$1b:9086  42 8a		 wdm #$8a
$1b:9088  24 23		 bit $23
$1b:908a  2c f0 4d	  bit $4df0
$1b:908d  82 90 68	  brl $f920
$1b:9090  87 72		 sta [$72]
$1b:9092  89 1f		 bit #$1f
$1b:9094  2e 16 8a	  rol $8a16
$1b:9097  48			pha
$1b:9098  5a			phy
$1b:9099  44 e0 f0	  mvp $f0,$e0
$1b:909c  48			pha
$1b:909d  8a			txa
$1b:909e  64 99		 stz $99
$1b:90a0  c2 a0		 rep #$a0
$1b:90a2  26 08		 rol $08
$1b:90a4  29 8d b8	  and #$b88d
$1b:90a7  2a			rol a
$1b:90a8  e3 68		 sbc $68,s
$1b:90aa  01 f6		 ora ($f6,x)
$1b:90ac  a1 48		 lda ($48,x)
$1b:90ae  a4 85		 ldy $85
$1b:90b0  32 52		 and ($52)
$1b:90b2  06 b3		 asl $b3
$1b:90b4  06 91		 asl $91
$1b:90b6  01 c1		 ora ($c1,x)
$1b:90b8  b0 4f		 bcs $9109
$1b:90ba  90 53		 bcc $910f
$1b:90bc  18			clc
$1b:90bd  50 55		 bvc $9114
$1b:90bf  c6 98		 dec $98
$1b:90c1  13 f4		 ora ($f4,s),y
$1b:90c3  c2 20		 rep #$20
$1b:90c5  48			pha
$1b:90c6  b3 84		 lda ($84,s),y
$1b:90c8  12 c9		 ora ($c9)
$1b:90ca  2a			rol a
$1b:90cb  10 08		 bpl $90d5
$1b:90cd  9a			txs
$1b:90ce  64 c7		 stz $c7
$1b:90d0  e0 d8		 cpx #$d8
$1b:90d2  24 38		 bit $38
$1b:90d4  29 8c 98	  and #$988c
$1b:90d7  2a			rol a
$1b:90d8  e5 12		 sbc $12
$1b:90da  d4 29		 pei ($29)
$1b:90dc  4e 0f c3	  lsr $c30f
$1b:90df  82 a4 8e	  brl $1f86
$1b:90e2  05 14		 ora $14
$1b:90e4  4c 99 dc	  jmp $dc99
$1b:90e7  02 1e		 cop #$1e
$1b:90e9  e9 21 2d	  sbc #$2d21
$1b:90ec  42 46		 wdm #$46
$1b:90ee  49 09 1c	  eor #$1c09
$1b:90f1  9c 1e 05	  stz $051e
$1b:90f4  15 68		 ora $68,x
$1b:90f6  9a			txs
$1b:90f7  bc 1b 05	  ldy $051b,x
$1b:90fa  09 26 a2	  ora #$a226
$1b:90fd  f0 43		 beq $9142
$1b:90ff  ca			dex
$1b:9100  ed 43 89	  sbc $8943
$1b:9103  a8			tay
$1b:9104  00 c6		 brk #$c6
$1b:9106  2a			rol a
$1b:9107  52 83		 eor ($83)
$1b:9109  95 c2		 sta $c2,x
$1b:910b  09 04 84	  ora #$8404
$1b:910e  40			rti
$1b:910f  62 c5 70	  per $01d7
$1b:9112  06 02		 asl $02
$1b:9114  f0 e0		 beq $90f6
$1b:9116  d0 26		 bne $913e
$1b:9118  1b			tcs
$1b:9119  16 c1		 asl $c1,x
$1b:911b  9b			txy
$1b:911c  50 b6		 bvc $90d4
$1b:911e  d2 42		 cmp ($42)
$1b:9120  c6 a3		 dec $a3
$1b:9122  05 81		 ora $81
$1b:9124  8e 02 2e	  stx $2e02
$1b:9127  e9 28 5b	  sbc #$5b28
$1b:912a  b9 03 c2	  lda $c203,y
$1b:912d  8e 56 6d	  stx $6d56
$1b:9130  42 9b		 wdm #$9b
$1b:9132  49 0a 5e	  eor #$5e0a
$1b:9135  04 02		 tsb $02
$1b:9137  07 05		 ora [$05]
$1b:9139  3e 84 61	  rol $6184,x
$1b:913c  d2 48		 cmp ($48)
$1b:913e  43 79		 eor $79,s
$1b:9140  02 2e		 cop #$2e
$1b:9142  3f ff f0 01   and $01f0ff,x
$1b:9146  2a			rol a
$1b:9147  4c 1a 0d	  jmp $0d1a
$1b:914a  a4 5d		 ldy $5d
$1b:914c  89 14 a0	  bit #$a014
$1b:914f  04 a1		 tsb $a1
$1b:9151  64 4a		 stz $4a
$1b:9153  6d 61 4a	  adc $4a61
$1b:9156  20 6e 94	  jsr $946e
$1b:9159  2d 22 00	  and $0022
$1b:915c  d0 73		 bne $91d1
$1b:915e  04 69		 tsb $69
$1b:9160  22 0b 30 4e   jsl $4e300b
$1b:9164  0d 09 73	  ora $7309
$1b:9167  ef b7 44 a4   sbc $a444b7
$1b:916b  2d 20 90	  and $9020
$1b:916e  b4 b9		 ldy $b9,x
$1b:9170  c1 e0		 cmp ($e0,x)
$1b:9172  91 b4		 sta ($b4),y
$1b:9174  f9 35 05	  sbc $0535,y
$1b:9177  4c 41 e3	  jmp $e341
$1b:917a  50 80		 bvc $90fc
$1b:917c  97 91		 sta [$91],y
$1b:917e  29 0a 48	  and #$480a
$1b:9181  24 29		 bit $29
$1b:9183  9e 90 39	  stz $3990,x
$1b:9186  03 5c		 ora $5c,s
$1b:9188  c1 a0		 cmp ($a0,x)
$1b:918a  a6 22		 ldx $22
$1b:918c  79 a8 40	  adc $40a8,y
$1b:918f  ac c6 40	  ldy $40c6
$1b:9192  3e a1 98	  rol $98a1,x
$1b:9195  10 60		 bpl $91f7
$1b:9197  8a			txa
$1b:9198  18			clc
$1b:9199  62 60 d5	  per $66fc
$1b:919c  68			pla
$1b:919d  3d 15 a2	  and $a215,x
$1b:91a0  8a			txa
$1b:91a1  ea			nop
$1b:91a2  05 0e		 ora $0e
$1b:91a4  4c 10 6b	  jmp $6b10
$1b:91a7  5e 20 2b	  lsr $2b20,x
$1b:91aa  44 4a 8e	  mvp $8e,$4a
$1b:91ad  05 26		 ora $26
$1b:91af  50 d6		 bvc $9187
$1b:91b1  81 c0		 sta ($c0,x)
$1b:91b3  a6 0c		 ldx $0c
$1b:91b5  92 45		 sta ($45)
$1b:91b7  04 c4		 tsb $c4
$1b:91b9  72 4a		 adc ($4a)
$1b:91bb  ad 25 02	  lda $0225
$1b:91be  ed 20 a7	  sbc $a720
$1b:91c1  84 91		 sty $91
$1b:91c3  1f d2 46 01   ora $0146d2,x
$1b:91c7  08			php
$1b:91c8  24 12		 bit $12
$1b:91ca  11 01		 ora ($01),y
$1b:91cc  92 00		 sta ($00)
$1b:91ce  41 b4		 eor ($b4,x)
$1b:91d0  09 83 83	  ora #$8383
$1b:91d3  40			rti
$1b:91d4  93 ec		 sta ($ec,s),y
$1b:91d6  4c 05 4d	  jmp $4d05
$1b:91d9  42 d6		 wdm #$d6
$1b:91db  c9 0b 90	  cmp #$900b
$1b:91de  80 42		 bra $9222
$1b:91e0  0b			phd
$1b:91e1  03 84		 ora $84,s
$1b:91e3  40			rti
$1b:91e4  e6 8c		 inc $8c
$1b:91e6  52 85		 eor ($85)
$1b:91e8  b2 91		 lda ($91)
$1b:91ea  f4 26 a5	  pea $a526
$1b:91ed  6d 21 51	  adc $5121
$1b:91f0  56 c2		 lsr $c2,x
$1b:91f2  c7 03		 cmp [$03]
$1b:91f4  01 b3		 ora ($b3,x)
$1b:91f6  80 ce		 bra $91c6
$1b:91f8  ca			dex
$1b:91f9  76 3b		 ror $3b,x
$1b:91fb  ac 95 46	  ldy $4695
$1b:91fe  09 d0 1c	  ora #$1cd0
$1b:9201  8d 01 2a	  sta $2a01
$1b:9204  2c 20 9a	  bit $9a20
$1b:9207  ac 49 84	  ldy $8449
$1b:920a  13 67		 ora ($67,s),y
$1b:920c  09 26 35	  ora #$3526
$1b:920f  b0 c3		 bcs $91d4
$1b:9211  44 85 8e	  mvp $8e,$85
$1b:9214  d0 e4		 bne $91fa
$1b:9216  04 32		 tsb $32
$1b:9218  83 c1		 sta $c1,s
$1b:921a  24 cb		 bit $cb
$1b:921c  12 3f		 ora ($3f)
$1b:921e  84 9c		 sty $9c
$1b:9220  a2 4f		 ldx #$4f
$1b:9222  a3 2d		 lda $2d,s
$1b:9224  00 07		 brk #$07
$1b:9226  86 89		 stx $89
$1b:9228  0a			asl a
$1b:9229  1d a2 a8	  ora $a8a2,x
$1b:922c  0f 67 03 9b   ora $9b0367
$1b:9230  a0 8e		 ldy #$8e
$1b:9232  07 38		 ora [$38]
$1b:9234  28			plp
$1b:9235  90 74		 bcc $92ab
$1b:9237  cb			wai
$1b:9238  40			rti
$1b:9239  24 81		 bit $81
$1b:923b  42 1b		 wdm #$1b
$1b:923d  12 11		 ora ($11)
$1b:923f  28			plp
$1b:9240  25 12		 and $12
$1b:9242  2c 25 25	  bit $2525
$1b:9245  12 54		 ora ($54)
$1b:9247  04 e4		 tsb $e4
$1b:9249  78			sei
$1b:924a  4e f1 21	  lsr $21f1
$1b:924d  9a			txs
$1b:924e  39 1f a2	  and $a21f,y
$1b:9251  5f 56 b5 42   eor $42b556,x
$1b:9255  a5 4e		 lda $4e
$1b:9257  43 85		 eor $85,s
$1b:9259  4a			lsr a
$1b:925a  dd 67 02	  cmp $0267,x
$1b:925d  9d 3c 8c	  sta $8c3c,x
$1b:9260  50 04		 bvc $9266
$1b:9262  32 62		 and ($62)
$1b:9264  ea			nop
$1b:9265  70 1a		 bvs $9281
$1b:9267  d5 09		 cmp $09,x
$1b:9269  71 a4		 adc ($a4),y
$1b:926b  25 d4		 and $d4
$1b:926d  70 78		 bvs $92e7
$1b:926f  14 ec		 trb $ec
$1b:9271  e8			inx
$1b:9272  45 f1		 eor $f1
$1b:9274  7c 94 25	  jmp ($2594,x)
$1b:9277  1c 86 d1	  trb $d186
$1b:927a  67 aa		 adc [$aa]
$1b:927c  79 20 69	  adc $6920,y
$1b:927f  d1 19		 cmp ($19),y
$1b:9281  04 06		 tsb $06
$1b:9283  58			cli
$1b:9284  88			dey
$1b:9285  18			clc
$1b:9286  39 b4 ca	  and $cab4,y
$1b:9289  02 05		 cop #$05
$1b:928b  73 f2		 adc ($f2,s),y
$1b:928d  05 12		 ora $12
$1b:928f  16 8b		 asl $8b,x
$1b:9291  10 f0		 bpl $9283
$1b:9293  c2 e5		 rep #$e5
$1b:9295  a2 33		 ldx #$33
$1b:9297  81 cf		 sta ($cf,x)
$1b:9299  9b			txy
$1b:929a  c7 03		 cmp [$03]
$1b:929c  9f a3 0a 16   sta $160aa3,x
$1b:92a0  91 46		 sta ($46),y
$1b:92a2  40			rti
$1b:92a3  8f d4 fc 90   sta $90fcd4
$1b:92a7  50 aa		 bvc $9253
$1b:92a9  2b			pld
$1b:92aa  92 15		 sta ($15)
$1b:92ac  2e 19 04	  rol $0419
$1b:92af  0e 0a 27	  asl $270a
$1b:92b2  09 7a 30	  ora #$307a
$1b:92b5  86 a6		 stx $a6
$1b:92b7  18			clc
$1b:92b8  13 ae		 ora ($ae,s),y
$1b:92ba  93 14		 sta ($14,s),y
$1b:92bc  62 45 71	  per $0404
$1b:92bf  a0 ad		 ldy #$ad
$1b:92c1  8e 03 50	  stx $5003
$1b:92c4  81 0e		 sta ($0e,x)
$1b:92c6  44 46 34	  mvp $34,$46
$1b:92c9  23 57		 and $57,s
$1b:92cb  a7 b8		 lda [$b8]
$1b:92cd  2e 90 b0	  rol $b090
$1b:92d0  f1 c1		 sbc ($c1),y
$1b:92d2  e0 95		 cpx #$95
$1b:92d4  11 31		 ora ($31),y
$1b:92d6  16 c4		 asl $c4,x
$1b:92d8  5a			phy
$1b:92d9  4c 83 1b	  jmp $1b83
$1b:92dc  03 3f		 ora $3f,s
$1b:92de  89 09 0a	  bit #$0a09
$1b:92e1  27 a4		 and [$a4]
$1b:92e3  28			plp
$1b:92e4  ac 90 3a	  ldy $3a90
$1b:92e7  91 78		 sta ($78),y
$1b:92e9  d2 80		 cmp ($80)
$1b:92eb  2d 27 c9	  and $c927
$1b:92ee  8d 80 01	  sta $0180
$1b:92f1  00 44		 brk #$44
$1b:92f3  24 24		 bit $24
$1b:92f5  20 5a 42	  jsr $425a
$1b:92f8  e1 a1		 sbc ($a1,x)
$1b:92fa  95 ce		 sta $ce,x
$1b:92fc  03 53		 ora $53,s
$1b:92fe  2f 1b 30 05   and $05301b
$1b:9302  a4 84		 ldy $84
$1b:9304  03 59		 ora $59,s
$1b:9306  b6 44		 ldx $44,y
$1b:9308  76 ab		 ror $ab,x
$1b:930a  24 29		 bit $29
$1b:930c  0a			asl a
$1b:930d  0c 97 e9	  tsb $e997
$1b:9310  0a			asl a
$1b:9311  63 1a		 adc $1a,s
$1b:9313  30 28		 bmi $933d
$1b:9315  82 62 01	  brl $947a
$1b:9318  8b			phb
$1b:9319  54 e0 55	  mvn $55,$e0
$1b:931c  41 31		 eor ($31,x)
$1b:931e  84 81		 sty $81
$1b:9320  3b			tsc
$1b:9321  e7 62		 sbc [$62]
$1b:9323  59 54 25	  eor $2554,y
$1b:9326  7e 90 96	  ror $9690,x
$1b:9329  32 40		 and ($40)
$1b:932b  aa			tax
$1b:932c  a5 e3		 lda $e3
$1b:932e  25 00		 and $00
$1b:9330  34 a1		 bit $a1,x
$1b:9332  26 a4		 rol $a4
$1b:9334  2b			pld
$1b:9335  8a			txa
$1b:9336  ad 4f 55	  lda $554f
$1b:9339  09 a3 0f	  ora #$0fa3
$1b:933c  92 8e		 sta ($8e)
$1b:933e  ff 28 44 06   sbc $064428,x
$1b:9342  ac 96 05	  ldy $0596
$1b:9345  e0 c0		 cpx #$c0
$1b:9347  6a			ror a
$1b:9348  e4 c0		 cpx $c0
$1b:934a  68			pla
$1b:934b  81 5c		 sta ($5c,x)
$1b:934d  ce 42 e1	  dec $e142
$1b:9350  73 45		 adc ($45,s),y
$1b:9352  42 ce		 wdm #$ce
$1b:9354  a9 0b 3e	  lda #$3e0b
$1b:9357  24 0e		 bit $0e
$1b:9359  90 84		 bcc $92df
$1b:935b  38			sec
$1b:935c  1d 61 16	  ora $1661,x
$1b:935f  50 b4		 bvc $9315
$1b:9361  82 31 c4	  brl $5795
$1b:9364  52 a6		 eor ($a6)
$1b:9366  84 82		 sty $82
$1b:9368  bf d0 ea 90   lda $90ead0,x
$1b:936c  a3 e0		 lda $e0,s
$1b:936e  c0 e0		 cpy #$e0
$1b:9370  a1 10		 lda ($10,x)
$1b:9372  a2 a2		 ldx #$a2
$1b:9374  c8			iny
$1b:9375  3e 6e 21	  rol $216e,x
$1b:9378  67 ac		 adc [$ac]
$1b:937a  80 5f		 bra $93db
$1b:937c  50 88		 bvc $9306
$1b:937e  85 24		 sta $24
$1b:9380  fc 04 e0	  jsr ($e004,x)
$1b:9383  0a			asl a
$1b:9384  0d 00 e0	  ora $e000
$1b:9387  51 83		 eor ($83),y
$1b:9389  79 88 80	  adc $8088,y
$1b:938c  d0 06		 bne $9394
$1b:938e  80 69		 bra $93f9
$1b:9390  8d 82 08	  sta $0882
$1b:9393  2d 14 00	  and $0014
$1b:9396  60			rts
$1b:9397  0b			phd
$1b:9398  40			rti
$1b:9399  04 e1		 tsb $e1
$1b:939b  14 84		 trb $84
$1b:939d  70 5a		 bvs $93f9
$1b:939f  76 21		 ror $21,x
$1b:93a1  9d 47 dd	  sta $dd47,x
$1b:93a4  c0 a1		 cpy #$a1
$1b:93a6  98			tya
$1b:93a7  d0 91		 bne $933a
$1b:93a9  23 45		 and $45,s
$1b:93ab  54 89 05	  mvn $05,$89
$1b:93ae  91 26		 sta ($26),y
$1b:93b0  06 42		 asl $42
$1b:93b2  89 40 2c	  bit #$2c40
$1b:93b5  83 33		 sta $33,s
$1b:93b7  85 0e		 sta $0e
$1b:93b9  49 ac 11	  eor #$11ac
$1b:93bc  e0 42		 cpx #$42
$1b:93be  c1 c3		 cmp ($c3,x)
$1b:93c0  e0 1a		 cpx #$1a
$1b:93c2  08			php
$1b:93c3  04 59		 tsb $59
$1b:93c5  e8			inx
$1b:93c6  10 08		 bpl $93d0
$1b:93c8  48			pha
$1b:93c9  7c 22 c7	  jmp ($c722,x)
$1b:93cc  90 5c		 bcc $942a
$1b:93ce  8c 22 1d	  sty $1d22
$1b:93d1  59 0f 88	  eor $880f,y
$1b:93d4  68			pla
$1b:93d5  19 60 9c	  ora $9c60,y
$1b:93d8  17 b0		 ora [$b0],y
$1b:93da  41 f0		 eor ($f0,x)
$1b:93dc  43 a1		 eor $a1,s
$1b:93de  84 c5		 sty $c5
$1b:93e0  a0 1a		 ldy #$1a
$1b:93e2  07 d8		 ora [$d8]
$1b:93e4  c0 5b		 cpy #$5b
$1b:93e6  e1 a1		 sbc ($a1,x)
$1b:93e8  55 19		 eor $19,x
$1b:93ea  dc 01 2e	  jml [$2e01]
$1b:93ed  ba			tsx
$1b:93ee  18			clc
$1b:93ef  ba			tsx
$1b:93f0  f9 22 ec	  sbc $ec22,y
$1b:93f3  54 87 b3	  mvn $b3,$87
$1b:93f6  10 14		 bpl $940c
$1b:93f8  0d 43 84	  ora $8443
$1b:93fb  36 81		 rol $81,x
$1b:93fd  aa			tax
$1b:93fe  30 f8		 bmi $93f8
$1b:9400  06 49		 asl $49
$1b:9402  d2 63		 cmp ($63)
$1b:9404  f9 5d 0c	  sbc $0c5d,y
$1b:9407  61 7c		 adc ($7c,x)
$1b:9409  91 86		 sta ($86),y
$1b:940b  2a			rol a
$1b:940c  44 19 88	  mvp $88,$19
$1b:940f  42 06		 wdm #$06
$1b:9411  a1 1b		 lda ($1b,x)
$1b:9413  c3 08		 cmp $08,s
$1b:9415  1a			inc a
$1b:9416  25 98		 and $98
$1b:9418  65 20		 adc $20
$1b:941a  83 21		 sta $21,s
$1b:941c  57 54		 eor [$54],y
$1b:941e  3a			dec a
$1b:941f  14 bc		 trb $bc
$1b:9421  03 f8		 ora $f8,s
$1b:9423  af 46 2c b7   lda $b72c46
$1b:9427  18			clc
$1b:9428  88			dey
$1b:9429  5c 21 d4 a2   jml $a2d421
$1b:942d  a0 2c		 ldy #$2c
$1b:942f  82 1d 00	  brl $944f
$1b:9432  d8			cld
$1b:9433  28			plp
$1b:9434  c1 e8		 cmp ($e8,x)
$1b:9436  30 8e		 bmi $93c6
$1b:9438  82 0c 90	  brl $2447
$1b:943b  01 e0		 ora ($e0,x)
$1b:943d  71 0c		 adc ($0c),y
$1b:943f  42 0d		 wdm #$0d
$1b:9441  10 da		 bpl $941d
$1b:9443  16 6d		 asl $6d,x
$1b:9445  f4 06 8f	  pea $8f06
$1b:9448  3c be c9	  bit $c9be,x
$1b:944b  06 c2		 asl $c2
$1b:944d  90 84		 bcc $93d3
$1b:944f  39 83 a4	  and $a483,y
$1b:9452  91 02		 sta ($02),y
$1b:9454  e0 39		 cpx #$39
$1b:9456  83 a6		 sta $a6,s
$1b:9458  91 4e		 sta ($4e),y
$1b:945a  21 67		 and ($67,x)
$1b:945c  a1 b0		 lda ($b0,x)
$1b:945e  b5 51		 lda $51,x
$1b:9460  c5 47		 cmp $47
$1b:9462  80 b2		 bra $9416
$1b:9464  26 58		 rol $58
$1b:9466  2e 1f c4	  rol $c41f
$1b:9469  83 4e		 sta $4e,s
$1b:946b  a2 29		 ldx #$29
$1b:946d  3c 89 14	  bit $1489,x
$1b:9470  e2 a4		 sep #$a4
$1b:9472  41 44		 eor ($44,x)
$1b:9474  25 c0		 and $c0
$1b:9476  30 22		 bmi $949a
$1b:9478  c0 17		 cpy #$17
$1b:947a  80 a4		 bra $9420
$1b:947c  1b			tcs
$1b:947d  01 48		 ora ($48,x)
$1b:947f  45 a3		 eor $a3
$1b:9481  80 0e		 bra $9491
$1b:9483  f8			sed
$1b:9484  b8			clv
$1b:9485  6c 43 2a	  jmp ($2a43)
$1b:9488  8b			phb
$1b:9489  c0 1e		 cpy #$1e
$1b:948b  c0 26		 cpy #$26
$1b:948d  75 48		 adc $48,x
$1b:948f  59 06 47	  eor $4706,y
$1b:9492  0a			asl a
$1b:9493  2a			rol a
$1b:9494  33 95		 and ($95,s),y
$1b:9496  1e c0 33	  asl $33c0,x
$1b:9499  28			plp
$1b:949a  3e 08 72	  rol $7208,x
$1b:949d  30 88		 bmi $9427
$1b:949f  7c 03 40	  jmp ($4003,x)
$1b:94a2  d7 18		 cmp [$18],y
$1b:94a4  02 28		 cop #$28
$1b:94a6  34 23		 bit $23,x
$1b:94a8  9f 16 8a 14   sta $148a16,x
$1b:94ac  05 87		 ora $87
$1b:94ae  92 4a		 sta ($4a)
$1b:94b0  78			sei
$1b:94b1  b4 70		 ldy $70,x
$1b:94b3  8a			txa
$1b:94b4  94 ca		 sty $ca,x
$1b:94b6  37 8c		 and [$8c],y
$1b:94b8  44 cb 00	  mvp $00,$cb
$1b:94bb  01 0b		 ora ($0b,x)
$1b:94bd  34 36		 bit $36,x
$1b:94bf  00 82		 brk #$82
$1b:94c1  0b			phd
$1b:94c2  87 40		 sta [$40]
$1b:94c4  10 4c		 bpl $9512
$1b:94c6  d0 f0		 bne $94b8
$1b:94c8  05 89		 ora $89
$1b:94ca  ac 1b 46	  ldy $461b
$1b:94cd  65 c1		 adc $c1
$1b:94cf  5b			tcd
$1b:94d0  49 b2		 eor #$b2
$1b:94d2  70 b3		 bvs $9487
$1b:94d4  70 5d		 bvs $9533
$1b:94d6  41 d2		 eor ($d2,x)
$1b:94d8  58			cli
$1b:94d9  03 3c		 ora $3c,s
$1b:94db  1d 41 d3	  ora $d341,x
$1b:94de  77 a7		 adc [$a7],y
$1b:94e0  11 99		 ora ($99),y
$1b:94e2  ed d1 f1	  sbc $f1d1
$1b:94e5  38			sec
$1b:94e6  53 a8		 eor ($a8,s),y
$1b:94e8  e8			inx
$1b:94e9  4f 23 bd 38   eor $38bd23
$1b:94ed  ab			plb
$1b:94ee  03 8c		 ora $8c,s
$1b:94f0  c0 3f		 cpy #$3f
$1b:94f2  1f f3 d2 36   ora $36d2f3,x
$1b:94f6  01 60		 ora ($60,x)
$1b:94f8  10 9a		 bpl $9494
$1b:94fa  d2 f8		 cmp ($f8)
$1b:94fc  98			tya
$1b:94fd  c1 4e		 cmp ($4e,x)
$1b:94ff  81 19		 sta ($19,x)
$1b:9501  ce 98 d2	  dec $d298
$1b:9504  36 8d		 rol $8d,x
$1b:9506  31 c7		 and ($c7),y
$1b:9508  6c ef 17	  jmp ($17ef)
$1b:950b  80 42		 bra $954f
$1b:950d  36 ab		 rol $ab,x
$1b:950f  01 26		 ora ($26,x)
$1b:9511  0f 59 12 4e   ora $4e1259
$1b:9515  a0 eb		 ldy #$eb
$1b:9517  ac 06 23	  ldy $2306
$1b:951a  00 8b		 brk #$8b
$1b:951c  b4 94		 ldy $94,x
$1b:951e  bc 10 16	  ldy $1610,x
$1b:9521  30 c1		 bmi $94e4
$1b:9523  d1 02		 cmp ($02),y
$1b:9525  63 08		 adc $08,s
$1b:9527  7c 03 cc	  jmp ($cc03,x)
$1b:952a  ef 18 0a dc   sbc $dc0a18
$1b:952e  3c ee 10	  bit $10ee,x
$1b:9531  6b			rtl
$1b:9532  0a			asl a
$1b:9533  8e 4c c2	  stx $c24c
$1b:9536  b1 28		 lda ($28),y
$1b:9538  0c 21 6e	  tsb $6e21
$1b:953b  1f 63 10 c0   ora $c01063,x
$1b:953f  16 e1		 asl $e1,x
$1b:9541  f7 28		 sbc [$28],y
$1b:9543  98			tya
$1b:9544  04 18		 tsb $18
$1b:9546  44 01 08	  mvp $08,$01
$1b:9549  30 fc		 bmi $9547
$1b:954b  56 83		 lsr $83,x
$1b:954d  46 a0		 lsr $a0
$1b:954f  3c 8a 13	  bit $138a,x
$1b:9552  47 7c		 eor [$7c]
$1b:9554  82 2c 60	  brl $f583
$1b:9557  35 6a		 and $6a,x
$1b:9559  10 fc		 bpl $9557
$1b:955b  57 81		 eor [$81],y
$1b:955d  57 03		 eor [$03],y
$1b:955f  83 f0		 sta $f0,s
$1b:9561  4a			lsr a
$1b:9562  a1 44		 lda ($44,x)
$1b:9564  1f 88 48 60   ora $604888,x
$1b:9568  80 04		 bra $956e
$1b:956a  05 00		 ora $00
$1b:956c  14 cb		 trb $cb
$1b:956e  68			pla
$1b:956f  de 01 41	  dec $4101,x
$1b:9572  78			sei
$1b:9573  2e 5b ee	  rol $ee5b
$1b:9576  fc 0d 26	  jsr ($260d,x)
$1b:9579  2f 3d 9e a4   and $a49e3d
$1b:957d  80 40		 bra $95bf
$1b:957f  04 58		 tsb $58
$1b:9581  cd 5b f0	  cmp $f05b
$1b:9584  b2 7a		 lda ($7a)
$1b:9586  6d 35 44	  adc $4435
$1b:9589  22 01 22 ca   jsl $ca2201
$1b:958d  02 cf		 cop #$cf
$1b:958f  2f 89 10 ae   and $ae1089
$1b:9593  43 2a		 eor $2a,s
$1b:9595  0b			phd
$1b:9596  2e ef 6b	  rol $6bef
$1b:9599  55 fb		 eor $fb,x
$1b:959b  c5 0c		 cmp $0c
$1b:959d  c7 11		 cmp [$11]
$1b:959f  8a			txa
$1b:95a0  cc 0a 8c	  cpy $8c0a
$1b:95a3  3e b8 81	  rol $81b8,x
$1b:95a6  39 3b c8	  and $c83b,y
$1b:95a9  3e 03 34	  rol $3403,x
$1b:95ac  19 86 63	  ora $6386,y
$1b:95af  3a			dec a
$1b:95b0  04 1c		 tsb $1c
$1b:95b2  f0 bc		 beq $9570
$1b:95b4  08			php
$1b:95b5  68			pla
$1b:95b6  21 0d		 and ($0d,x)
$1b:95b8  16 94		 asl $94,x
$1b:95ba  28			plp
$1b:95bb  3a			dec a
$1b:95bc  62 79 15	  per $ab38
$1b:95bf  48			pha
$1b:95c0  e8			inx
$1b:95c1  c1 f0		 cmp ($f0,x)
$1b:95c3  c8			iny
$1b:95c4  a0 4f		 ldy #$4f
$1b:95c6  51 89		 eor ($89),y
$1b:95c8  d0 20		 bne $95ea
$1b:95ca  4f 49 9b c7   eor $c79b49
$1b:95ce  63 bb		 adc $bb,s
$1b:95d0  89 10		 bit #$10
$1b:95d2  c7 63		 cmp [$63]
$1b:95d4  c7 01		 cmp [$01]
$1b:95d6  8d 4a 0e	  sta $0e4a
$1b:95d9  3b			tsc
$1b:95da  2d ac 50	  and $50ac
$1b:95dd  07 75		 ora [$75]
$1b:95df  40			rti
$1b:95e0  19 61 00	  ora $0061,y
$1b:95e3  12 45		 ora ($45)
$1b:95e5  40			rti
$1b:95e6  2f c1 57 91   and $9157c1
$1b:95ea  3c 47 28	  bit $2847,x
$1b:95ed  af 71 42 ab   lda $ab4271
$1b:95f1  fd 9e 85	  sbc $859e,x
$1b:95f4  f1 c8		 sbc ($c8),y
$1b:95f6  76 fb		 ror $fb,x
$1b:95f8  ab			plb
$1b:95f9  c8			iny
$1b:95fa  16 86		 asl $86,x
$1b:95fc  58			cli
$1b:95fd  98			tya
$1b:95fe  34 12		 bit $12,x
$1b:9600  60			rts
$1b:9601  2f 63 17 9e   and $9e1763
$1b:9605  cf 52 41 40   cmp $404152
$1b:9609  bd 8c 99	  lda $998c,x
$1b:960c  b4 2a		 ldy $2a,x
$1b:960e  26 d0		 rol $d0
$1b:9610  5e ce 81	  lsr $81ce,x
$1b:9613  0e 02 c0	  asl $c002
$1b:9616  5e ce ab	  lsr $abce,x
$1b:9619  65 8a		 adc $8a
$1b:961b  1e 03 f0	  asl $f003,x
$1b:961e  5f a0 3f 2c   eor $2c3fa0,x
$1b:9622  b6 5c		 ldx $5c,y
$1b:9624  58			cli
$1b:9625  22 c0 06 08   jsl $0806c0
$1b:9629  28			plp
$1b:962a  c1 41		 cmp ($41,x)
$1b:962c  9f 1e 08 f0   sta $f0081e,x
$1b:9630  03 82		 ora $82,s
$1b:9632  1a			inc a
$1b:9633  30 d0		 bmi $9605
$1b:9635  69 c9		 adc #$c9
$1b:9637  46 5a		 lsr $5a
$1b:9639  33 7c		 and ($7c,s),y
$1b:963b  e4 4f		 cpx $4f
$1b:963d  ee 2b 21	  inc $212b
$1b:9640  60			rts
$1b:9641  77 31		 adc [$31],y
$1b:9643  c9 01		 cmp #$01
$1b:9645  47 9e		 eor [$9e]
$1b:9647  3c b4 7d	  bit $7db4,x
$1b:964a  dd 62 80	  cmp $8062,x
$1b:964d  53 e4		 eor ($e4,s),y
$1b:964f  48			pha
$1b:9650  56 6c		 lsr $6c,x
$1b:9652  e8			inx
$1b:9653  75 23		 adc $23,x
$1b:9655  c1 6e		 cmp ($6e,x)
$1b:9657  ce 8b 64	  dec $648b
$1b:965a  2c cc cb	  bit $cbcc
$1b:965d  68			pla
$1b:965e  81 f1		 sta ($f1,x)
$1b:9660  9b			txy
$1b:9661  49 19		 eor #$19
$1b:9663  00 07		 brk #$07
$1b:9665  f0 bf		 beq $9626
$1b:9667  22 92 95 07   jsl $079592
$1b:966b  19 ab 5f	  ora $5fab,y
$1b:966e  91 89		 sta ($89),y
$1b:9670  4b			phk
$1b:9671  e3 94		 sbc $94,s
$1b:9673  05 19		 ora $19
$1b:9675  28			plp
$1b:9676  d5 81		 cmp $81,x
$1b:9678  a0 d4		 ldy #$d4
$1b:967a  64 32		 stz $32
$1b:967c  a0 a3		 ldy #$a3
$1b:967e  5e 08 bc	  lsr $bc08,x
$1b:9681  b5 5b		 lda $5b,x
$1b:9683  2c c0 a5	  bit $a5c0
$1b:9686  15 47		 ora $47,x
$1b:9688  fd 56 08	  sbc $0856,x
$1b:968b  a0 32		 ldy #$32
$1b:968d  cf 32 17 aa   cmp $aa1732
$1b:9691  f0 33		 beq $96c6
$1b:9693  19 d0 11	  ora $11d0,y
$1b:9696  aa			tax
$1b:9697  8d 54 5a	  sta $5a54
$1b:969a  2d 28 48	  and $4828
$1b:969d  c9 ee		 cmp #$ee
$1b:969f  2f 52 fb e8   and $e8fb52
$1b:96a3  32 28		 and ($28)
$1b:96a5  93 27		 sta ($27,s),y
$1b:96a7  c6 35		 dec $35
$1b:96a9  d4 65		 pei ($65)
$1b:96ab  f7 24		 sbc [$24],y
$1b:96ad  0e b3 bb	  asl $bbb3
$1b:96b0  ac d6 0b	  ldy $0bd6
$1b:96b3  d7 43		 cmp [$43],y
$1b:96b5  a9 1c		 lda #$1c
$1b:96b7  51 98		 eor ($98),y
$1b:96b9  76 59		 ror $59,x
$1b:96bb  0e df 75	  asl $75df
$1b:96be  be 59 96	  ldx $9659,y
$1b:96c1  7b			tdc
$1b:96c2  66 85		 ror $85
$1b:96c4  28			plp
$1b:96c5  9a			txs
$1b:96c6  34 d1		 bit $d1,x
$1b:96c8  e7 01		 sbc [$01]
$1b:96ca  46 ee		 lsr $ee
$1b:96cc  f7 ff		 sbc [$ff],y
$1b:96ce  84 3c		 sty $3c
$1b:96d0  43 e2		 eor $e2,s
$1b:96d2  ea			nop
$1b:96d3  d1 8f		 cmp ($8f),y
$1b:96d5  c2 82		 rep #$82
$1b:96d7  3f 1c b0 b9   and $b9b01c,x
$1b:96db  b3 c4		 lda ($c4,s),y
$1b:96dd  f0 a4		 beq $9683
$1b:96df  93 c3		 sta ($c3,s),y
$1b:96e1  18			clc
$1b:96e2  ea			nop
$1b:96e3  7d 31 7c	  adc $7c31,x
$1b:96e6  2a			rol a
$1b:96e7  25 f0		 and $f0
$1b:96e9  ca			dex
$1b:96ea  3a			dec a
$1b:96eb  9d 26 8b	  sta $8b26,x
$1b:96ee  94 65		 sty $65,x
$1b:96f0  96 44		 stx $44,y
$1b:96f2  fe 1a 85	  inc $851a,x
$1b:96f5  38			sec
$1b:96f6  ba			tsx
$1b:96f7  9d c2 38	  sta $38c2,x
$1b:96fa  f3 98		 sbc ($98,s),y
$1b:96fc  32 51		 and ($51)
$1b:96fe  96 5d		 stx $5d,y
$1b:9700  dd 66 5b	  cmp $5b66,x
$1b:9703  2e 83 a6	  rol $a683
$1b:9706  58			cli
$1b:9707  69 32		 adc #$32
$1b:9709  e7 3a		 sbc [$3a]
$1b:970b  4e 8f 69	  lsr $698f
$1b:970e  47 e9		 eor [$e9]
$1b:9710  49 57		 eor #$57
$1b:9712  93 0f		 sta ($0f,s),y
$1b:9714  15 9e		 ora $9e,x
$1b:9716  dd bc b0	  cmp $b0bc,x
$1b:9719  fd 14 20	  sbc $2014,x
$1b:971c  73 10		 adc ($10,s),y
$1b:971e  78			sei
$1b:971f  d0 74		 bne $9795
$1b:9721  98			tya
$1b:9722  b2 81		 lda ($81)
$1b:9724  e7 b3		 sbc [$b3]
$1b:9726  ec 30 ce	  cpx $ce30
$1b:9729  93 cb		 sta ($cb,s),y
$1b:972b  49 93		 eor #$93
$1b:972d  30 1e		 bmi $974d
$1b:972f  9b			txy
$1b:9730  4f 8a d5 69   eor $69d58a
$1b:9734  4b			phk
$1b:9735  e4 e1		 cpx $e1
$1b:9737  12 0d		 ora ($0d)
$1b:9739  ac 47 15	  ldy $1547
$1b:973c  a1 cc		 lda ($cc,x)
$1b:973e  95 13		 sta $13,x
$1b:9740  52 71		 eor ($71)
$1b:9742  11 f9		 ora ($f9),y
$1b:9744  64 31		 stz $31
$1b:9746  a9 00		 lda #$00
$1b:9748  32 96		 and ($96)
$1b:974a  3c 82 2c	  bit $2c82,x
$1b:974d  10 2e		 bpl $977d
$1b:974f  00 64		 brk #$64
$1b:9751  36 67		 rol $67,x
$1b:9753  53 28		 eor ($28,s),y
$1b:9755  09 79		 ora #$79
$1b:9757  0e 80 20	  asl $2080
$1b:975a  1c 61 e8	  trb $e861
$1b:975d  09 8a		 ora #$8a
$1b:975f  d4 11		 pei ($11)
$1b:9761  80 e5		 bra $9748
$1b:9763  0f 54 07 24   ora $240754
$1b:9767  54 0a 83	  mvn $83,$0a
$1b:976a  3e 72 13	  rol $1372,x
$1b:976d  79 62 8d	  adc $8d62,y
$1b:9770  e0 41		 cpx #$41
$1b:9772  0d 10 e8	  ora $e810
$1b:9775  34 ea		 bit $ea,x
$1b:9777  7a			ply
$1b:9778  29 89		 and #$89
$1b:977a  6c 0e 63	  jmp ($630e)
$1b:977d  b0 2e		 bcs $97ad
$1b:977f  07 f4		 ora [$f4]
$1b:9781  be a6 b0	  ldx $b0a6,y
$1b:9784  54 28 01	  mvn $01,$28
$1b:9787  01 85		 ora ($85,x)
$1b:9789  ac 7c 87	  ldy $877c
$1b:978c  75 f2		 adc $f2,x
$1b:978e  0e f7 77	  asl $77f7
$1b:9791  ae 8f 47	  ldx $478f
$1b:9794  96 78		 stx $78,y
$1b:9796  b0 3c		 bcs $97d4
$1b:9798  01 e1		 ora ($e1,x)
$1b:979a  41 44		 eor ($44,x)
$1b:979c  06 ad		 asl $ad
$1b:979e  de ba 44	  dec $44ba,x
$1b:97a1  30 e7		 bmi $978a
$1b:97a3  a9 29		 lda #$29
$1b:97a5  80 10		 bra $97b7
$1b:97a7  ba			tsx
$1b:97a8  58			cli
$1b:97a9  74 d5		 stz $d5,x
$1b:97ab  15 18		 ora $18,x
$1b:97ad  08			php
$1b:97ae  5d 16 58	  eor $5816,x
$1b:97b1  94 98		 sty $98,x
$1b:97b3  bb			tyx
$1b:97b4  d5 74		 cmp $74,x
$1b:97b6  78			sei
$1b:97b7  a1 fe		 lda ($fe,x)
$1b:97b9  ff 5b 00 41   sbc $41005b,x
$1b:97bd  82 de 2f	  brl $c79e
$1b:97c0  c8			iny
$1b:97c1  9b			txy
$1b:97c2  47 9e		 eor [$9e]
$1b:97c4  67 86		 adc [$86]
$1b:97c6  47 23		 eor [$23]
$1b:97c8  a8			tay
$1b:97c9  27 06		 and [$06]
$1b:97cb  c4 42		 cpy $42
$1b:97cd  f9 bc 73	  sbc $73bc,y
$1b:97d0  94 0b		 sty $0b,x
$1b:97d2  d2 f8		 cmp ($f8)
$1b:97d4  1c b3 80	  trb $80b3
$1b:97d7  09 f0		 ora #$f0
$1b:97d9  96 43		 stx $43,y
$1b:97db  fc 11 91	  jsr ($9111,x)
$1b:97de  94 1d		 sty $1d,x
$1b:97e0  d6 50		 dec $50,x
$1b:97e2  3b			tsc
$1b:97e3  d0 22		 bne $9807
$1b:97e5  cf eb d1 e8   cmp $e8d1eb
$1b:97e9  e8			inx
$1b:97ea  20 f0 07	  jsr $07f0
$1b:97ed  83 e9		 sta $e9,s
$1b:97ef  32 c1		 and ($c1)
$1b:97f1  20 cf 67	  jsr $67cf
$1b:97f4  a9 21		 lda #$21
$1b:97f6  f0 cf		 beq $97c7
$1b:97f8  63 18		 adc $18,s
$1b:97fa  29 a4		 and #$a4
$1b:97fc  c5 e7		 cmp $e7
$1b:97fe  b4 da		 ldy $da,x
$1b:9800  6a			ror a
$1b:9801  88			dey
$1b:9802  bc 34 d9	  ldy $d934,x
$1b:9805  41 32		 eor ($32,x)
$1b:9807  e4 f4		 cpx $f4
$1b:9809  c8			iny
$1b:980a  b2 c4		 lda ($c4)
$1b:980c  9f d8 d2 27   sta $27d2d8,x
$1b:9810  b2 c5		 lda ($c5)
$1b:9812  23 d8		 and $d8,s
$1b:9814  f2 28		 sbc ($28)
$1b:9816  d0 fe		 bne $9816
$1b:9818  90 a1		 bcc $97bb
$1b:981a  12 24		 ora ($24)
$1b:981c  f4 22 b9	  pea $b922
$1b:981f  78			sei
$1b:9820  48			pha
$1b:9821  24 55		 bit $55
$1b:9823  73 77		 adc ($77,s),y
$1b:9825  98			tya
$1b:9826  83 41		 sta $41,s
$1b:9828  91 c8		 sta ($c8),y
$1b:982a  e6 8c		 inc $8c
$1b:982c  b5 98		 lda $98,x
$1b:982e  c6 e3		 dec $e3
$1b:9830  b1 d9		 lda ($d9),y
$1b:9832  c3 b4		 cmp $b4,s
$1b:9834  99 03 2c	  sta $2c03,y
$1b:9837  f8			sed
$1b:9838  62 61 9d	  per $359c
$1b:983b  18			clc
$1b:983c  b2 79		 lda ($79)
$1b:983e  93 14		 sta ($14,s),y
$1b:9840  0a			asl a
$1b:9841  4b			phk
$1b:9842  37 8e		 and [$8e],y
$1b:9844  35 13		 and $13,x
$1b:9846  42 99		 wdm #$99
$1b:9848  46 e1		 lsr $e1
$1b:984a  9a			txs
$1b:984b  0e 8f 2c	  asl $2c8f
$1b:984e  5d 03 a0	  eor $a003,x
$1b:9851  65 b4		 adc $b4
$1b:9853  60			rts
$1b:9854  f0 08		 beq $985e
$1b:9856  03 90		 ora $90,s
$1b:9858  69 39		 adc #$39
$1b:985a  ec f6 7d	  cpx $7df6
$1b:985d  06 19		 asl $19
$1b:985f  d1 00		 cmp ($00),y
$1b:9861  07 c3		 ora [$c3]
$1b:9863  18			clc
$1b:9864  a6 2a		 ldx $2a
$1b:9866  8e 9b 4d	  stx $4d9b
$1b:9869  a7 c5		 lda [$c5]
$1b:986b  6a			ror a
$1b:986c  b4 a3		 ldy $a3,x
$1b:986e  00 17		 brk #$17
$1b:9870  86 51		 stx $51
$1b:9872  4c 47 f3	  jmp $f347
$1b:9875  3f a2 94 f1   and $f194a2,x
$1b:9879  04 f1		 tsb $f1
$1b:987b  67 81		 adc [$81]
$1b:987d  3c 7f af	  bit $af7f,x
$1b:9880  44 27 91	  mvp $91,$27
$1b:9883  1c 09 e4	  trb $e409
$1b:9886  84 44		 sty $44
$1b:9888  79 a3 e4	  adc $e4a3,y
$1b:988b  bf 24 ac c4   lda $c4ac24,x
$1b:988f  3d 10 7f	  and $7f10,x
$1b:9892  26 a3		 rol $a3
$1b:9894  47 f1		 eor [$f1]
$1b:9896  ff b3 2c f0   sbc $f02cb3,x
$1b:989a  d4 e2		 pei ($e2)
$1b:989c  b4 2c		 ldy $2c,x
$1b:989e  f1 cc		 sbc ($cc),y
$1b:98a0  e6 89		 inc $89
$1b:98a2  47 dc		 eor [$dc]
$1b:98a4  c7 63		 cmp [$63]
$1b:98a6  b1 e2		 lda ($e2),y
$1b:98a8  30 c6		 bmi $9870
$1b:98aa  b8			clv
$1b:98ab  01 be		 ora ($be,x)
$1b:98ad  19 c1 59	  ora $59c1,y
$1b:98b0  00 40		 brk #$40
$1b:98b2  ee 5b 30	  inc $305b
$1b:98b5  91 77		 sta ($77),y
$1b:98b7  7b			tdc
$1b:98b8  47 61		 eor [$61]
$1b:98ba  77 82		 adc [$82],y
$1b:98bc  9c f2 f9	  stz $f9f2
$1b:98bf  1c 93 d0	  trb $d093
$1b:98c2  48			pha
$1b:98c3  a2 fa		 ldx #$fa
$1b:98c5  27 98		 and [$98]
$1b:98c7  e6 dc		 inc $dc
$1b:98c9  01 9c		 ora ($9c,x)
$1b:98cb  7a			ply
$1b:98cc  8b			phb
$1b:98cd  f5 5e		 sbc $5e,x
$1b:98cf  80 25		 bra $98f6
$1b:98d1  30 59		 bmi $992c
$1b:98d3  3b			tsc
$1b:98d4  cf 3b 9e 1a   cmp $1a9e3b
$1b:98d8  9e 7d f8	  stz $f87d,x
$1b:98db  ba			tsx
$1b:98dc  2d 2e 98	  and $982e
$1b:98df  8a			txa
$1b:98e0  7a			ply
$1b:98e1  71 62		 adc ($62),y
$1b:98e3  94 69		 sty $69,x
$1b:98e5  de 19 13	  dec $1319,x
$1b:98e8  09 6a		 ora #$6a
$1b:98ea  01 81		 ora ($81,x)
$1b:98ec  a0 30		 ldy #$30
$1b:98ee  9e 90 2c	  stz $2c90,x
$1b:98f1  0d f1 70	  ora $70f1
$1b:98f4  83 c4		 sta $c4,s
$1b:98f6  5c a2 e7 0c   jml $0ce7a2
$1b:98fa  b6 b3		 ldx $b3,y
$1b:98fc  59 dd 40	  eor $40dd,y
$1b:98ff  06 58		 asl $58
$1b:9901  40			rti
$1b:9902  67 f2		 adc [$f2]
$1b:9904  6e 0b b1	  ror $b10b
$1b:9907  db			stp
$1b:9908  63 96		 adc $96,s
$1b:990a  47 b0		 eor [$b0]
$1b:990c  84 9b		 sty $9b
$1b:990e  63 a4		 adc $a4,s
$1b:9910  47 a0		 eor [$a0]
$1b:9912  3d 15 70	  and $7015,x
$1b:9915  a5 e7		 lda $e7
$1b:9917  79 81 01	  adc $0181,y
$1b:991a  79 3a 0d	  adc $0d3a,y
$1b:991d  42 a4		 wdm #$a4
$1b:991f  fb			xce
$1b:9920  b9 8d 8a	  lda $8a8d,y
$1b:9923  ac 5e 4c	  ldy $4c5e
$1b:9926  0f 15 49 bc   ora $bc4915
$1b:992a  98			tya
$1b:992b  3e 2d 93	  rol $932d,x
$1b:992e  02 43		 cop #$43
$1b:9930  fb			xce
$1b:9931  d3 26		 cmp ($26,s),y
$1b:9933  f4 f0 2f	  pea $2ff0
$1b:9936  a3 d7		 lda $d7,s
$1b:9938  61 8a		 adc ($8a,x)
$1b:993a  c9 10		 cmp #$10
$1b:993c  37 1d		 and [$1d],y
$1b:993e  9c 18 e6	  stz $e618
$1b:9941  b3 58		 lda ($58,s),y
$1b:9943  9e 52 42	  stz $4252,x
$1b:9946  e8			inx
$1b:9947  d1 e1		 cmp ($e1),y
$1b:9949  41 47		 eor ($47,x)
$1b:994b  aa			tax
$1b:994c  04 0b		 tsb $0b
$1b:994e  83 8b		 sta $8b,s
$1b:9950  cf 67 a9 2a   cmp $2aa967
$1b:9954  00 50		 brk #$50
$1b:9956  96 31		 stx $31,y
$1b:9958  96 04		 stx $04,y
$1b:995a  c1 c9		 cmp ($c9,x)
$1b:995c  e9 b4		 sbc #$b4
$1b:995e  d5 15		 cmp $15,x
$1b:9960  80 2c		 bra $998e
$1b:9962  4b			phk
$1b:9963  29 96		 and #$96
$1b:9965  4c 83 58	  jmp $5883
$1b:9968  09 a0		 ora #$a0
$1b:996a  c0 5c		 cpy #$5c
$1b:996c  86 75		 stx $75
$1b:996e  46 39		 lsr $39
$1b:9970  fc 48 74	  jsr ($7448,x)
$1b:9973  1a			inc a
$1b:9974  0b			phd
$1b:9975  aa			tax
$1b:9976  d2 ac		 cmp ($ac)
$1b:9978  c7 4f		 cmp [$4f]
$1b:997a  8a			txa
$1b:997b  ed 30 1b	  sbc $1b30
$1b:997e  41 91		 eor ($91,x)
$1b:9980  74 8e		 stz $8e,x
$1b:9982  a3 12		 lda $12,s
$1b:9984  d0 02		 bne $9988
$1b:9986  7c e5 8f	  jmp ($8fe5,x)
$1b:9989  e0 c6		 cpx #$c6
$1b:998b  12 05		 ora ($05)
$1b:998d  7d dd e2	  adc $e2dd,x
$1b:9990  02 b7		 cop #$b7
$1b:9992  ff bc 28 39   sbc $3928bc,x
$1b:9996  cb			wai
$1b:9997  a0 d1		 ldy #$d1
$1b:9999  ff 5e 01 b1   sbc $b1015e,x
$1b:999d  38			sec
$1b:999e  be 91 3e	  ldx $3e91,y
$1b:99a1  01 fb		 ora ($fb,x)
$1b:99a3  d2 2b		 cmp ($2b)
$1b:99a5  c1 df		 cmp ($df,x)
$1b:99a7  6a			ror a
$1b:99a8  c0 c5		 cpy #$c5
$1b:99aa  17 f1		 ora [$f1],y
$1b:99ac  5a			phy
$1b:99ad  0e f1 29	  asl $29f1
$1b:99b0  47 77		 eor [$77]
$1b:99b2  b4 7e		 ldy $7e,x
$1b:99b4  f3 7f		 sbc ($7f,s),y
$1b:99b6  a8			tay
$1b:99b7  3c 23 29	  bit $2923,x
$1b:99ba  cf 46 87 77   cmp $778746
$1b:99be  59 96 5e	  eor $5e96,y
$1b:99c1  80 44		 bra $9a07
$1b:99c3  32 da		 and ($da)
$1b:99c5  c7 78		 cmp [$78]
$1b:99c7  3c 01 0e	  bit $0e01,x
$1b:99ca  c2 1b		 rep #$1b
$1b:99cc  5e 0b 46	  lsr $460b,x
$1b:99cf  5b			tcd
$1b:99d0  44 03 05	  mvp $05,$03
$1b:99d3  94 03		 sty $03,x
$1b:99d5  fa			plx
$1b:99d6  83 a3		 sta $a3,s
$1b:99d8  78			sei
$1b:99d9  80 0c		 bra $99e7
$1b:99db  72 da		 adc ($da)
$1b:99dd  31 f8		 and ($f8),y
$1b:99df  10 01		 bpl $99e2
$1b:99e1  ae 34 9c	  ldx $9c34
$1b:99e4  f6 7b		 inc $7b,x
$1b:99e6  3e b0 0c	  rol $0cb0,x
$1b:99e9  e9 40		 sbc #$40
$1b:99eb  09 e1		 ora #$e1
$1b:99ed  8c 03 15	  sty $1503
$1b:99f0  47 4d		 eor [$4d]
$1b:99f2  a6 d3		 ldx $d3
$1b:99f4  e2 74		 sep #$74
$1b:99f6  5a			phy
$1b:99f7  53 00		 eor ($00,s),y
$1b:99f9  17 c3		 ora [$c3],y
$1b:99fb  28			plp
$1b:99fc  06 25		 asl $25
$1b:99fe  78			sei
$1b:99ff  1b			tcs
$1b:9a00  d9 a2 9f	  cmp $9fa2,y
$1b:9a03  d6 f8		 dec $f8,x
$1b:9a05  20 14 08	  jsr $0814
$1b:9a08  86 f9		 stx $f9
$1b:9a0a  59 1a 01	  eor $011a,y
$1b:9a0d  d1 1e		 cmp ($1e),y
$1b:9a0f  d1 44		 cmp ($44),y
$1b:9a11  ff a4 3d 83   sbc $833da4,x
$1b:9a15  83 94		 sta $94,s
$1b:9a17  10 86		 bpl $999f
$1b:9a19  ab			plb
$1b:9a1a  06 b9		 asl $b9
$1b:9a1c  3d 20 ad	  and $ad20,x
$1b:9a1f  98			tya
$1b:9a20  ea			nop
$1b:9a21  fe 76 ba	  inc $ba76,x
$1b:9a24  bf b8 96 4f   lda $4f96b8,x
$1b:9a28  23 5b		 and $5b,s
$1b:9a2a  b3 b1		 lda ($b1,s),y
$1b:9a2c  00 ae		 brk #$ae
$1b:9a2e  3e 71 bf	  rol $bf71,x
$1b:9a31  ba			tsx
$1b:9a32  07 2d		 ora [$2d]
$1b:9a34  a3 36		 lda $36,s
$1b:9a36  01 ac		 ora ($ac,x)
$1b:9a38  36 7f		 rol $7f,x
$1b:9a3a  1d 99 b8	  ora $b899,x
$1b:9a3d  02 c5		 cop #$c5
$1b:9a3f  9d cf 1e	  sta $1ecf,x
$1b:9a42  c7 49		 cmp [$49]
$1b:9a44  8b			phb
$1b:9a45  ec 7c bb	  cpx $bb7c
$1b:9a48  27 b0		 and [$b0]
$1b:9a4a  cf b1 c3 45   cmp $45c3b1
$1b:9a4e  a5 d3		 lda $d3
$1b:9a50  22 c7 49 93   jsl $9349c7
$1b:9a54  f0 7c		 beq $9ad2
$1b:9a56  bc 28 b0	  ldy $b028,x
$1b:9a59  d3 ab		 cmp ($ab,s),y
$1b:9a5b  d8			cld
$1b:9a5c  0a			asl a
$1b:9a5d  4c 05 d0	  jmp $d005
$1b:9a60  64 55		 stz $55
$1b:9a62  62 35 26	  per $c09a
$1b:9a65  93 63		 sta ($63,s),y
$1b:9a67  71 cb		 adc ($cb),y
$1b:9a69  c0 0a		 cpy #$0a
$1b:9a6b  82 ac 98	  brl $331a
$1b:9a6e  27 92		 and [$92]
$1b:9a70  35 06		 and $06,x
$1b:9a72  b3 59		 lda ($59,s),y
$1b:9a74  a4 cd		 ldy $cd
$1b:9a76  af 03 b8 bc   lda $bcb803
$1b:9a7a  16 91		 asl $91,x
$1b:9a7c  67 05		 adc [$05]
$1b:9a7e  64 cd		 stz $cd
$1b:9a80  0d 67 75	  ora $7567
$1b:9a83  c0 2e		 cpy #$2e
$1b:9a85  23 17		 and $17,s
$1b:9a87  08			php
$1b:9a88  58			cli
$1b:9a89  56 93		 lsr $93,x
$1b:9a8b  8f c5 30 0b   sta $0b30c5
$1b:9a8f  50 aa		 bvc $9a3b
$1b:9a91  26 51		 rol $51
$1b:9a93  1d 43 12	  ora $1243,x
$1b:9a96  d0 17		 bne $9aaf
$1b:9a98  e0 2e		 cpx #$2e
$1b:9a9a  8d b6 25	  sta $25b6
$1b:9a9d  51 74		 eor ($74),y
$1b:9a9f  96 5c		 stx $5c,y
$1b:9aa1  d2 2e		 cmp ($2e)
$1b:9aa3  93 32		 sta ($32,s),y
$1b:9aa5  89 48		 bit #$48
$1b:9aa7  cb			wai
$1b:9aa8  2c af 12	  bit $12af
$1b:9aab  91 89		 sta ($89),y
$1b:9aad  00 b6		 brk #$b6
$1b:9aaf  82 ce 0e	  brl $a980
$1b:9ab2  0d 07 46	  ora $4607
$1b:9ab5  74 11		 stz $11,x
$1b:9ab7  20 98 00	  jsr $0098
$1b:9aba  c2 04		 rep #$04
$1b:9abc  b2 a4		 lda ($a4)
$1b:9abe  a1 01		 lda ($01,x)
$1b:9ac0  0a			asl a
$1b:9ac1  19 8c e9	  ora $e98c,y
$1b:9ac4  c0 71		 cpy #$71
$1b:9ac6  83 60		 sta $60,s
$1b:9ac8  57 8d		 eor [$8d],y
$1b:9aca  45 28		 eor $28
$1b:9acc  09 50		 ora #$50
$1b:9ace  d1 69		 cmp ($69),y
$1b:9ad0  50 03		 bvc $9ad5
$1b:9ad2  94 0d		 sty $0d,x
$1b:9ad4  16 25		 asl $25,x
$1b:9ad6  63 03		 adc $03,s
$1b:9ad8  51 0e		 eor ($0e),y
$1b:9ada  0b			phd
$1b:9adb  06 51		 asl $51
$1b:9add  46 d3		 lsr $d3
$1b:9adf  66 c9		 ror $c9
$1b:9ae1  8f 03 32 e3   sta $e33203
$1b:9ae5  71 41		 adc ($41),y
$1b:9ae7  83 c0		 sta $c0,s
$1b:9ae9  6e 6c f6	  ror $f66c
$1b:9aec  13 0b		 ora ($0b,s),y
$1b:9aee  3e c7 02	  rol $02c7,x
$1b:9af1  96 1e		 stx $1e,y
$1b:9af3  df 75 9e c2   cmp $c29e75,x
$1b:9af7  c0 cc		 cpy #$cc
$1b:9af9  e2 71		 sep #$71
$1b:9afb  24 46		 bit $46
$1b:9afd  17 93		 ora [$93],y
$1b:9aff  34 12		 bit $12,x
$1b:9b01  c8			iny
$1b:9b02  d5 87		 cmp $87,x
$1b:9b04  f9 19 84	  sbc $8419,y
$1b:9b07  be 22 54	  ldx $5422,y
$1b:9b0a  4b			phk
$1b:9b0b  09 d4		 ora #$d4
$1b:9b0d  8d e4 36	  sta $36e4
$1b:9b10  37 f8		 and [$f8],y
$1b:9b12  21 0c		 and ($0c,x)
$1b:9b14  fe 44 63	  inc $6344,x
$1b:9b17  49 a6		 eor #$a6
$1b:9b19  cb			wai
$1b:9b1a  43 a9		 eor $a9,s
$1b:9b1c  4a			lsr a
$1b:9b1d  81 58		 sta ($58,x)
$1b:9b1f  b1 58		 lda ($58),y
$1b:9b21  92 f9		 sta ($f9)
$1b:9b23  64 36		 stz $36
$1b:9b25  5a			phy
$1b:9b26  2c 19 7c	  bit $7c19
$1b:9b29  0c c5 89	  tsb $89c5
$1b:9b2c  27 aa		 and [$aa]
$1b:9b2e  3d cb ea	  and $eacb,x
$1b:9b31  5f 1f e9 7c   eor $7ce91f,x
$1b:9b35  cd fe 80	  cmp $80fe
$1b:9b38  75 32		 adc $32,x
$1b:9b3a  66 55		 ror $55
$1b:9b3c  e5 92		 sbc $92
$1b:9b3e  d9 2b cd	  cmp $cd2b,y
$1b:9b41  5e 58 e5	  lsr $e558,x
$1b:9b44  f8			sed
$1b:9b45  77 17		 adc [$17],y
$1b:9b47  e2 c1		 sep #$c1
$1b:9b49  70 e8		 bvs $9b33
$1b:9b4b  6b			rtl
$1b:9b4c  3b			tsc
$1b:9b4d  ac f1 68	  ldy $68f1
$1b:9b50  b8			clv
$1b:9b51  11 80		 ora ($80),y
$1b:9b53  8c af 12	  sty $12af
$1b:9b56  b8			clv
$1b:9b57  68			pla
$1b:9b58  55 e5		 eor $e5,x
$1b:9b5a  9a			txs
$1b:9b5b  09 1b		 ora #$1b
$1b:9b5d  08			php
$1b:9b5e  71 e6		 adc ($e6),y
$1b:9b60  30 c6		 bmi $9b28
$1b:9b62  b0 0b		 bcs $9b6f
$1b:9b64  38			sec
$1b:9b65  fb			xce
$1b:9b66  26 e0		 rol $e0
$1b:9b68  65 b2		 adc $b2
$1b:9b6a  e5 30		 sbc $30
$1b:9b6c  ca			dex
$1b:9b6d  e5 9a		 sbc $9a
$1b:9b6f  25 96		 and $96
$1b:9b71  75 8e		 adc $8e,x
$1b:9b73  8f 46 11 03   sta $031146
$1b:9b77  18			clc
$1b:9b78  3e 8d d4	  rol $d48d,x
$1b:9b7b  79 e1 78	  adc $78e1,y
$1b:9b7e  67 c2		 adc [$c2]
$1b:9b80  62 26 7d	  per $18a9
$1b:9b83  30 fc		 bmi $9b81
$1b:9b85  34 e2		 bit $e2,x
$1b:9b87  3a			dec a
$1b:9b88  47 a7		 eor [$a7]
$1b:9b8a  6f ba e7 63   adc $63e7ba
$1b:9b8e  fa			plx
$1b:9b8f  11 78		 ora ($78),y
$1b:9b91  4b			phk
$1b:9b92  05 ff		 ora $ff
$1b:9b94  28			plp
$1b:9b95  7a			ply
$1b:9b96  07 1e		 ora [$1e]
$1b:9b98  a4 f8		 ldy $f8
$1b:9b9a  57 51		 eor [$51],y
$1b:9b9c  81 88		 sta ($88,x)
$1b:9b9e  00 00		 brk #$00
$1b:9ba0  a3 75		 lda $75,s
$1b:9ba2  18			clc
$1b:9ba3  64 03		 stz $03
$1b:9ba5  02 19		 cop #$19
$1b:9ba7  46 cf		 lsr $cf
$1b:9ba9  a2 d2		 ldx #$d2
$1b:9bab  00 f1		 brk #$f1
$1b:9bad  bc 4f e5	  ldy $e54f,x
$1b:9bb0  e3 80		 sbc $80,s
$1b:9bb2  ef 0f f8 c3   sbc $c3f80f
$1b:9bb6  c8			iny
$1b:9bb7  3e 52 f3	  rol $f352,x
$1b:9bba  1f 9d 3d 0b   ora $0b3d9d,x
$1b:9bbe  e9 6f		 sbc #$6f
$1b:9bc0  53 fa		 eor ($fa,s),y
$1b:9bc2  e3 d9		 sbc $d9,s
$1b:9bc4  3e da f6	  rol $f6da,x
$1b:9bc7  f0 ec		 beq $9bb5
$1b:9bc9  b1 0f		 lda ($0f),y
$1b:9bcb  08			php
$1b:9bcc  d9 37 85	  cmp $8537,y
$1b:9bcf  e0 3f		 cpx #$3f
$1b:9bd1  d7 81		 cmp [$81],y
$1b:9bd3  ff de 02 fc   sbc $fc02de,x
$1b:9bd7  4c 56 28	  jmp $2856
$1b:9bda  1e cf c4	  asl $c4cf,x
$1b:9bdd  c4 e2		 cpy $e2
$1b:9bdf  43 e6		 eor $e6,s
$1b:9be1  27 10		 and [$10]
$1b:9be3  63 0c		 adc $0c,s
$1b:9be5  99 f8 8f	  sta $8ff8,y
$1b:9be8  08			php
$1b:9be9  1e 79 73	  asl $7379,x
$1b:9bec  cd be 7e	  cmp $7ebe
$1b:9bef  f4 7f a8	  pea $a87f
$1b:9bf2  3d 63 ec	  and $ec63,x
$1b:9bf5  2f 69 fb 7a   and $7afb69
$1b:9bf9  33 39		 and ($39,s),y
$1b:9bfb  9d 4e 2b	  sta $2b4e,x
$1b:9bfe  42 ef		 wdm #$ef
$1b:9c00  0c cb 79	  tsb $79cb
$1b:9c03  bb			tyx
$1b:9c04  98			tya
$1b:9c05  ec 7e 27	  cpx $277e
$1b:9c08  21 8d		 and ($8d,x)
$1b:9c0a  c7 63		 cmp [$63]
$1b:9c0c  9b			txy
$1b:9c0d  cd dd cb	  cmp $cbdd
$1b:9c10  65 f1		 adc $f1
$1b:9c12  59 8c ae	  eor $ae8c,y
$1b:9c15  5b			tcd
$1b:9c16  58			cli
$1b:9c17  de 6f be	  dec $be6f,x
$1b:9c1a  93 2e		 sta ($2e,s),y
$1b:9c1c  02 0c		 cop #$0c
$1b:9c1e  ae af ee	  ldx $eeaf
$1b:9c21  de 6d 18	  dec $186d,x
$1b:9c24  41 34		 eor ($34,x)
$1b:9c26  6d e6 cf	  adc $cfe6
$1b:9c29  67 b3		 adc [$b3]
$1b:9c2b  e0 20		 cpx #$20
$1b:9c2d  ce 8f c1	  dec $c18f
$1b:9c30  bc da 6d	  ldy $6dda,x
$1b:9c33  36 9f		 rol $9f,x
$1b:9c35  15 aa		 ora $aa,x
$1b:9c37  d2 93		 cmp ($93)
$1b:9c39  c1 bc		 cmp ($bc,x)
$1b:9c3b  d8			cld
$1b:9c3c  92 fa		 sta ($fa)
$1b:9c3e  b7 bc		 lda [$bc],y
$1b:9c40  ef e8 8f 4c   sbc $4c8fe8
$1b:9c44  fa			plx
$1b:9c45  ab			plb
$1b:9c46  d7 7e		 cmp [$7e],y
$1b:9c48  cc f6 ef	  cpy $eff6
$1b:9c4b  97 d8		 sta [$d8],y
$1b:9c4d  ca			dex
$1b:9c4e  d8			cld
$1b:9c4f  a7 fb		 lda [$fb]
$1b:9c51  7f dd 3e fa   adc $fa3edd,x
$1b:9c55  cc 50 27	  cpy $2750
$1b:9c58  c3 5e		 cmp $5e,s
$1b:9c5a  2b			pld
$1b:9c5b  f1 e7		 sbc ($e7),y
$1b:9c5d  b7 83		 lda [$83],y
$1b:9c5f  fa			plx
$1b:9c60  50 dc		 bvc $9c3e
$1b:9c62  4f fc 9e f9   eor $f99efc
$1b:9c66  07 da		 ora [$da]
$1b:9c68  e2 31		 sep #$31
$1b:9c6a  09 04		 ora #$04
$1b:9c6c  cc 12 d5	  cpy $d512
$1b:9c6f  24 0a		 bit $0a
$1b:9c71  04 45		 tsb $45
$1b:9c73  33 fd		 and ($fd,s),y
$1b:9c75  93 4c		 sta ($4c,s),y
$1b:9c77  82 f4 9f	  brl $3c6e
$1b:9c7a  a8			tay
$1b:9c7b  0f fa ca 30   ora $30cafa
$1b:9c7f  f0 0e		 beq $9c8f
$1b:9c81  ad 4e 2c	  lda $2c4e
$1b:9c84  93 8b		 sta ($8b,s),y
$1b:9c86  74 e2		 stz $e2,x
$1b:9c88  f1 38		 sbc ($38),y
$1b:9c8a  c1 4e		 cmp ($4e,x)
$1b:9c8c  31 93		 and ($93),y
$1b:9c8e  8c b4 e3	  sty $e3b4
$1b:9c91  41 38		 eor ($38,x)
$1b:9c93  d5 4e		 cmp $4e,x
$1b:9c95  36 93		 rol $93,x
$1b:9c97  8e b4 e3	  stx $e3b4
$1b:9c9a  f1 38		 sbc ($38),y
$1b:9c9c  8d 4e 64	  sta $644e
$1b:9c9f  93 99		 sta ($99,s),y
$1b:9ca1  74 e6		 stz $e6,x
$1b:9ca3  71 39		 adc ($39),y
$1b:9ca5  a1 4e		 lda ($4e,x)
$1b:9ca7  69 93		 adc #$93
$1b:9ca9  9a			txs
$1b:9caa  b4 e6		 ldy $e6,x
$1b:9cac  c1 39		 cmp ($39,x)
$1b:9cae  b5 4e		 lda $4e,x
$1b:9cb0  6e 93 9c	  ror $9c93
$1b:9cb3  b4 e7		 ldy $e7,x
$1b:9cb5  71 39		 adc ($39),y
$1b:9cb7  ed 4e 7f	  sbc $7f4e
$1b:9cba  93 98		 sta ($98,s),y
$1b:9cbc  f4 ea 81	  pea $81ea
$1b:9cbf  3a			dec a
$1b:9cc0  a5 4e		 lda $4e
$1b:9cc2  ab			plb
$1b:9cc3  93 ad		 sta ($ad,s),y
$1b:9cc5  f4 eb a1	  pea $a1eb
$1b:9cc8  3a			dec a
$1b:9cc9  ed 4e bc	  sbc $bc4e
$1b:9ccc  93 af		 sta ($af,s),y
$1b:9cce  74 eb		 stz $eb,x
$1b:9cd0  f1 3a		 sbc ($3a),y
$1b:9cd2  81 4e		 sta ($4e,x)
$1b:9cd4  e2 93		 sep #$93
$1b:9cd6  b8			clv
$1b:9cd7  f4 ee 81	  pea $81ee
$1b:9cda  3b			tsc
$1b:9cdb  c9 4e		 cmp #$4e
$1b:9cdd  f4 93 bd	  pea $bd93
$1b:9ce0  b4 ef		 ldy $ef,x
$1b:9ce2  b1 3b		 lda ($3b),y
$1b:9ce4  f9 4e e0	  sbc $e04e,y
$1b:9ce7  04 93		 tsb $93
$1b:9ce9  8e 4f 3f	  stx $3f4f
$1b:9cec  ff f2 4a 55   sbc $554af2,x
$1b:9cf0  0a			asl a
$1b:9cf1  0f 9a 28 3e   ora $3e289a
$1b:9cf5  3e 7a 65	  rol $657a,x
$1b:9cf8  f8			sed
$1b:9cf9  05 4e		 ora $4e
$1b:9cfb  7c 51 68	  jmp ($6851,x)
$1b:9cfe  89 bb		 bit #$bb
$1b:9d00  c9 21		 cmp #$21
$1b:9d02  ea			nop
$1b:9d03  46 0c		 lsr $0c
$1b:9d05  1c 92 30	  trb $3092
$1b:9d08  18			clc
$1b:9d09  07 9e		 ora [$9e]
$1b:9d0b  78			sei
$1b:9d0c  a3 44		 lda $44,s
$1b:9d0e  58			cli
$1b:9d0f  28			plp
$1b:9d10  d2 76		 cmp ($76)
$1b:9d12  b2 5b		 lda ($5b)
$1b:9d14  2a			rol a
$1b:9d15  81 4a		 sta ($4a,x)
$1b:9d17  20 6d 06	  jsr $066d
$1b:9d1a  2f b3 95 42   and $4295b3
$1b:9d1e  45 12		 eor $12
$1b:9d20  e7 2c		 sbc [$2c]
$1b:9d22  84 a2		 sty $a2
$1b:9d24  49 f0		 eor #$f0
$1b:9d26  73 a4		 adc ($a4,s),y
$1b:9d28  1a			inc a
$1b:9d29  7c e7 49	  jmp ($49e7,x)
$1b:9d2c  12 09		 ora ($09)
$1b:9d2e  f0 88		 beq $9cb8
$1b:9d30  27 ae		 and [$ae]
$1b:9d32  cf ca 2d 52   cmp $522dca
$1b:9d36  a0 14		 ldy #$14
$1b:9d38  5a			phy
$1b:9d39  3c 1a 78	  bit $781a,x
$1b:9d3c  60			rts
$1b:9d3d  91 f7		 sta ($f7),y
$1b:9d3f  62 47 ef	  per $8c89
$1b:9d42  09 1f		 ora #$1f
$1b:9d44  37 41		 and [$41],y
$1b:9d46  3c b5 62	  bit $62b5,x
$1b:9d49  84 a1		 sty $a1
$1b:9d4b  62 58 28	  per $c5a6
$1b:9d4e  d2 57		 cmp ($57)
$1b:9d50  41 31		 eor ($31,x)
$1b:9d52  e5 8c		 sbc $8c
$1b:9d54  ac 2c d4	  ldy $d42c
$1b:9d57  2a			rol a
$1b:9d58  83 35		 sta $35,s
$1b:9d5a  3d 08 c5	  and $c508,x
$1b:9d5d  45 b4		 eor $b4
$1b:9d5f  80 c0		 bra $9d21
$1b:9d61  61 b2		 adc ($b2,x)
$1b:9d63  2f 83 9d 31   and $319d83
$1b:9d67  2a			rol a
$1b:9d68  e5 56		 sbc $56
$1b:9d6a  b6 b0		 ldx $b0,y
$1b:9d6c  c0 e0		 cpy #$e0
$1b:9d6e  f0 39		 beq $9da9
$1b:9d70  a7 29		 lda [$29]
$1b:9d72  a0 ac		 ldy #$ac
$1b:9d74  f6 fa		 inc $fa,x
$1b:9d76  01 85		 ora ($85,x)
$1b:9d78  3a			dec a
$1b:9d79  81 90		 sta ($90,x)
$1b:9d7b  4e a6 71	  lsr $71a6
$1b:9d7e  e4 af		 cpx $af
$1b:9d80  16 ea		 asl $ea,x
$1b:9d82  0b			phd
$1b:9d83  85 7e		 sta $7e
$1b:9d85  95 23		 sta $23,x
$1b:9d87  50 8b		 bvc $9d14
$1b:9d89  ca			dex
$1b:9d8a  ea			nop
$1b:9d8b  14 50		 trb $50
$1b:9d8d  9b			txy
$1b:9d8e  66 08		 ror $08
$1b:9d90  4f dd 30 0c   eor $0c30dd
$1b:9d94  7c 5e 71	  jmp ($715e,x)
$1b:9d97  ca			dex
$1b:9d98  18			clc
$1b:9d99  e5 29		 sbc $29
$1b:9d9b  b4 31		 ldy $31,x
$1b:9d9d  68			pla
$1b:9d9e  43 c5		 eor $c5,s
$1b:9da0  e7 2d		 sbc [$2d]
$1b:9da2  a2 42		 ldx #$42
$1b:9da4  c5 e7		 cmp $e7
$1b:9da6  a8			tay
$1b:9da7  a1 c6		 lda ($c6,x)
$1b:9da9  45 e7		 eor $e7
$1b:9dab  ee a1 c3	  inc $c3a1
$1b:9dae  45 e7		 eor $e7
$1b:9db0  77 a1		 adc [$a1],y
$1b:9db2  b8			clv
$1b:9db3  48			pha
$1b:9db4  5e 15 ea	  lsr $ea15,x
$1b:9db7  24 24		 bit $24
$1b:9db9  b8			clv
$1b:9dba  b1 72		 lda ($72),y
$1b:9dbc  a2 98		 ldx #$98
$1b:9dbe  d8			cld
$1b:9dbf  72 86		 adc ($86)
$1b:9dc1  10 8a		 bpl $9d4d
$1b:9dc3  9b			txy
$1b:9dc4  14 f6		 trb $f6
$1b:9dc6  85 10		 sta $10
$1b:9dc8  92 97		 sta ($97)
$1b:9dca  14 6e		 trb $6e
$1b:9dcc  c4 70		 cpy $70
$1b:9dce  1c b0 b5	  trb $b5b0
$1b:9dd1  b4 94		 ldy $94,x
$1b:9dd3  41 6b		 eor ($6b,x)
$1b:9dd5  77 18		 adc [$18],y
$1b:9dd7  cf 06 a2 8b   cmp $8ba206
$1b:9ddb  5a			phy
$1b:9ddc  98			tya
$1b:9ddd  da			phx
$1b:9dde  7b			tdc
$1b:9ddf  7b			tdc
$1b:9de0  68			pla
$1b:9de1  ff 82 e1 ec   sbc $ece182,x
$1b:9de5  51 61		 eor ($61),y
$1b:9de7  02 f3		 cop #$f3
$1b:9de9  7b			tdc
$1b:9dea  80 b4		 bra $9da0
$1b:9dec  20 70 0f	  jsr $0f70
$1b:9def  f0 b8		 beq $9da9
$1b:9df1  64 b4		 stz $b4
$1b:9df3  61 68		 adc ($68,x)
$1b:9df5  09 51		 ora #$51
$1b:9df7  da			phx
$1b:9df8  00 d4		 brk #$d4
$1b:9dfa  c9 05		 cmp #$05
$1b:9dfc  14 26		 trb $26
$1b:9dfe  db			stp
$1b:9dff  56 d0		 lsr $d0,x
$1b:9e01  90 52		 bcc $9e55
$1b:9e03  b1 42		 lda ($42),y
$1b:9e05  64 87		 stz $87
$1b:9e07  c1 90		 cmp ($90,x)
$1b:9e09  38			sec
$1b:9e0a  ea			nop
$1b:9e0b  34 19		 bit $19,x
$1b:9e0d  92 63		 sta ($63)
$1b:9e0f  d0 64		 bne $9e75
$1b:9e11  90 14		 bcc $9e27
$1b:9e13  37 14		 and [$14],y
$1b:9e15  68			pla
$1b:9e16  0b			phd
$1b:9e17  24 58		 bit $58
$1b:9e19  e0 4d		 cpx #$4d
$1b:9e1b  42 78		 wdm #$78
$1b:9e1d  13 41		 ora ($41,s),y
$1b:9e1f  92 50		 sta ($50)
$1b:9e21  22 e0 93 f9   jsl $f993e0
$1b:9e25  6a			ror a
$1b:9e26  86 50		 stx $50
$1b:9e28  63 b1		 adc $b1,s
$1b:9e2a  75 19		 adc $19,x
$1b:9e2c  21 d4		 and ($d4,x)
$1b:9e2e  05 09		 ora $09
$1b:9e30  3c 8f 64	  bit $648f,x
$1b:9e33  93 44		 sta ($44,s),y
$1b:9e35  79 00 d0	  adc $d000,y
$1b:9e38  6a			ror a
$1b:9e39  00 34		 brk #$34
$1b:9e3b  c4 ab		 cpy $ab
$1b:9e3d  15 56		 ora $56,x
$1b:9e3f  da			phx
$1b:9e40  ca			dex
$1b:9e41  11 fc		 ora ($fc),y
$1b:9e43  21 e8		 and ($e8,x)
$1b:9e45  93 84		 sta ($84,s),y
$1b:9e47  91 86		 sta ($86),y
$1b:9e49  08			php
$1b:9e4a  32 36		 and ($36)
$1b:9e4c  3a			dec a
$1b:9e4d  35 40		 and $40,x
$1b:9e4f  fe 12 f3	  inc $f312,x
$1b:9e52  c2 b1		 rep #$b1
$1b:9e54  d2 9e		 cmp ($9e)
$1b:9e56  46 18		 lsr $18
$1b:9e58  83 48		 sta $48,s
$1b:9e5a  e3 c3		 sbc $c3,s
$1b:9e5c  05 5e		 ora $5e
$1b:9e5e  82 24 bb	  brl $5985
$1b:9e61  d4 03		 pei ($03)
$1b:9e63  f9 3c c2	  sbc $c23c,y
$1b:9e66  40			rti
$1b:9e67  89 17 98	  bit #$9817
$1b:9e6a  3c c0 7e	  bit $7ec0,x
$1b:9e6d  30 18		 bmi $9e87
$1b:9e6f  3c 56 07	  bit $0756,x
$1b:9e72  33 68		 and ($68,s),y
$1b:9e74  84 22		 sty $22
$1b:9e76  00 1c		 brk #$1c
$1b:9e78  1a			inc a
$1b:9e79  20 64 61	  jsr $6164
$1b:9e7c  11 09		 ora ($09),y
$1b:9e7e  18			clc
$1b:9e7f  7c 85 43	  jmp ($4385,x)
$1b:9e82  44 27 93	  mvp $93,$27
$1b:9e85  cc 49 e2	  cpy $e249
$1b:9e88  0d 23 18	  ora $1823
$1b:9e8b  44 60 07	  mvp $07,$60
$1b:9e8e  72 09		 adc ($09)
$1b:9e90  90 84		 bcc $9e16
$1b:9e92  20 10 b8	  jsr $b810
$1b:9e95  04 1e		 tsb $1e
$1b:9e97  21 32		 and ($32,x)
$1b:9e99  0f 84 0e 11   ora $110e84
$1b:9e9d  14 0e		 trb $0e
$1b:9e9f  94 2a		 sty $2a,x
$1b:9ea1  02 5b		 cop #$5b
$1b:9ea3  11 a0		 ora ($a0),y
$1b:9ea5  40			rti
$1b:9ea6  85 02		 sta $02
$1b:9ea8  43 00		 eor $00,s
$1b:9eaa  c8			iny
$1b:9eab  42 8a		 wdm #$8a
$1b:9ead  82 65 26	  brl $c515
$1b:9eb0  38			sec
$1b:9eb1  03 c8		 ora $c8,s
$1b:9eb3  a4 11		 ldy $11
$1b:9eb5  70 10		 bvs $9ec7
$1b:9eb7  c2 17		 rep #$17
$1b:9eb9  a1 17		 lda ($17,x)
$1b:9ebb  4d 81 0e	  eor $0e81
$1b:9ebe  a1 25		 lda ($25,x)
$1b:9ec0  0f 30 99 60   ora $609930
$1b:9ec4  53 41		 eor ($41,s),y
$1b:9ec6  22 0c 81 9d   jsl $9d810c
$1b:9eca  0e 9e 85	  asl $859e
$1b:9ecd  23 6a		 and $6a,s
$1b:9ecf  bc 4a 3a	  ldy $3a4a,x
$1b:9ed2  10 50		 bpl $9f24
$1b:9ed4  f8			sed
$1b:9ed5  0d 4a 1b	  ora $1b4a
$1b:9ed8  04 5d		 tsb $5d
$1b:9eda  83 98		 sta $98,s
$1b:9edc  42 c0		 wdm #$c0
$1b:9ede  1f 01 00 41   ora $410001,x
$1b:9ee2  a1 f0		 lda ($f0,x)
$1b:9ee4  a0 f9 41	  ldy #$41f9
$1b:9ee7  62 10 b7	  per $55fa
$1b:9eea  88			dey
$1b:9eeb  b6 02		 ldx $02,y
$1b:9eed  3c db b8	  bit $b8db,x
$1b:9ef0  73 a4		 adc ($a4,s),y
$1b:9ef2  e1 c2		 sbc ($c2,x)
$1b:9ef4  e0 78 9c	  cpx #$9c78
$1b:9ef7  41 ee		 eor ($ee,x)
$1b:9ef9  30 78		 bmi $9f73
$1b:9efb  08			php
$1b:9efc  7c 4e 60	  jmp ($604e,x)
$1b:9eff  d7 c7		 cmp [$c7],y
$1b:9f01  59 3a 4a	  eor $4a3a,y
$1b:9f04  02 ee		 cop #$ee
$1b:9f06  16 a8		 asl $a8,x
$1b:9f08  42 04		 wdm #$04
$1b:9f0a  a0 f6 06	  ldy #$06f6
$1b:9f0d  a8			tay
$1b:9f0e  c2 5f		 rep #$5f
$1b:9f10  82 29 30	  brl $cf3c
$1b:9f13  24 85		 bit $85
$1b:9f15  48			pha
$1b:9f16  7a			ply
$1b:9f17  61 81		 adc ($81,x)
$1b:9f19  6a			ror a
$1b:9f1a  84 04		 sty $04
$1b:9f1c  3c 84 71	  bit $7184,x
$1b:9f1f  13 88		 ora ($88,s),y
$1b:9f21  02 a0		 cop #$a0
$1b:9f23  e0 d6 0e	  cpx #$0ed6
$1b:9f26  63 1c		 adc $1c,s
$1b:9f28  61 d0		 adc ($d0,x)
$1b:9f2a  88			dey
$1b:9f2b  d3 e0		 cmp ($e0,s),y
$1b:9f2d  94 81		 sty $81,x
$1b:9f2f  1b			tcs
$1b:9f30  78			sei
$1b:9f31  94 5a		 sty $5a,x
$1b:9f33  01 18		 ora ($18,x)
$1b:9f35  7c 12 c8	  jmp ($c812,x)
$1b:9f38  23 2f		 and $2f,s
$1b:9f3a  f3 6d		 sbc ($6d,s),y
$1b:9f3c  32 48		 and ($48)
$1b:9f3e  1c 87 0c	  trb $0c87
$1b:9f41  75 20		 adc $20,x
$1b:9f43  48			pha
$1b:9f44  00 09		 brk #$09
$1b:9f46  ff ff b1 7e   sbc $7eb1ff,x
$1b:9f4a  01 2c		 ora ($2c,x)
$1b:9f4c  5e 7b 36	  lsr $367b,x
$1b:9f4f  25 cd		 and $cd
$1b:9f51  8b			phb
$1b:9f52  82 b2 99	  brl $3907
$1b:9f55  50 30		 bvc $9f87
$1b:9f57  d8			cld
$1b:9f58  44 b5 5c	  mvp $5c,$b5
$1b:9f5b  42 90		 wdm #$90
$1b:9f5d  79 94 22	  adc $2294,y
$1b:9f60  2b			pld
$1b:9f61  00 af		 brk #$af
$1b:9f63  29 c8 6e	  and #$6ec8
$1b:9f66  15 f0		 ora $f0,x
$1b:9f68  87 88		 sta [$88]
$1b:9f6a  50 5c		 bvc $9fc8
$1b:9f6c  54 e5 39	  mvn $39,$e5
$1b:9f6f  0a			asl a
$1b:9f70  42 9e		 wdm #$9e
$1b:9f72  33 49		 and ($49,s),y
$1b:9f74  e0 e9 27	  cpx #$27e9
$1b:9f77  ad 83 90	  lda $9083
$1b:9f7a  3e 95 6e	  rol $6e95,x
$1b:9f7d  00 32		 brk #$32
$1b:9f7f  88			dey
$1b:9f80  50 19		 bvc $9f9b
$1b:9f82  23 07		 and $07,s
$1b:9f84  88			dey
$1b:9f85  42 2a		 wdm #$2a
$1b:9f87  e5 62		 sbc $62
$1b:9f89  84 44		 sty $44
$1b:9f8b  28			plp
$1b:9f8c  4c 90 83	  jmp $8390
$1b:9f8f  c0 52 43	  cpy #$4352
$1b:9f92  42 57		 wdm #$57
$1b:9f94  8a			txa
$1b:9f95  2c 2a 49	  bit $492a
$1b:9f98  52 50		 eor ($50)
$1b:9f9a  0a			asl a
$1b:9f9b  70 a3		 bvs $9f40
$1b:9f9d  10 0a		 bpl $9fa9
$1b:9f9f  9a			txs
$1b:9fa0  54 95 c2	  mvn $c2,$95
$1b:9fa3  9c 17 b8	  stz $b817
$1b:9fa6  47 df		 eor [$df]
$1b:9fa8  4a			lsr a
$1b:9fa9  72 00		 adc ($00)
$1b:9fab  19 43 d0	  ora $d043,y
$1b:9fae  c2 9e		 rep #$9e
$1b:9fb0  18			clc
$1b:9fb1  3a			dec a
$1b:9fb2  34 01		 bit $01,x
$1b:9fb4  43 0f		 eor $0f,s
$1b:9fb6  80 51		 bra $a009
$1b:9fb8  0a			asl a
$1b:9fb9  c4 8a		 cpy $8a
$1b:9fbb  0a			asl a
$1b:9fbc  18			clc
$1b:9fbd  24 57		 bit $57
$1b:9fbf  76 d5		 ror $d5,x
$1b:9fc1  24 30		 bit $30
$1b:9fc3  c0 e0 d1	  cpy #$d1e0
$1b:9fc6  18			clc
$1b:9fc7  33 4c		 and ($4c,s),y
$1b:9fc9  a0 2d 81	  ldy #$812d
$1b:9fcc  4e 04 21	  lsr $2104
$1b:9fcf  12 34		 ora ($34)
$1b:9fd1  34 e0		 bit $e0,x
$1b:9fd3  c4 4e		 cpy $4e
$1b:9fd5  cf 07 64 02   cmp $026407
$1b:9fd9  60			rts
$1b:9fda  21 50		 and ($50,x)
$1b:9fdc  ea			nop
$1b:9fdd  32 c4		 and ($c4)
$1b:9fdf  21 30		 and ($30,x)
$1b:9fe1  00 f0		 brk #$f0
$1b:9fe3  51 d0		 eor ($d0),y
$1b:9fe5  e3 08		 sbc $08,s
$1b:9fe7  89 41 aa	  bit #$aa41
$1b:9fea  cf e2 42 1c   cmp $1c42e2
$1b:9fee  1e 04 a7	  asl $a704,x
$1b:9ff1  48			pha
$1b:9ff2  4a			lsr a
$1b:9ff3  b9 20 4b	  lda $4b20,y
$1b:9ff6  56 08		 lsr $08,x
$1b:9ff8  c2 04		 rep #$04
$1b:9ffa  ec 0c d3	  cpx $d30c
$1b:9ffd  84 5c		 sty $5c
$1b:9fff  94 69		 sty $69,x
$1b:a001  72 4e		 adc ($4e)
$1b:a003  12 4b		 ora ($4b)
$1b:a005  15 de		 ora $de,x
$1b:a007  52 48		 eor ($48)
$1b:a009  33 19		 and ($19,s),y
$1b:a00b  0b			phd
$1b:a00c  e7 0f		 sbc [$0f]
$1b:a00e  84 58		 sty $58
$1b:a010  90 61		 bcc $a073
$1b:a012  08			php
$1b:a013  65 04		 adc $04
$1b:a015  22 c6 a6 28   jsl $28a6c6
$1b:a019  bc 02 e6	  ldy $e602,x
$1b:a01c  db			stp
$1b:a01d  25 88		 and $88
$1b:a01f  55 1b		 eor $1b,x
$1b:a021  7e 94 47	  ror $4794,x
$1b:a024  91 17		 sta ($17),y
$1b:a026  c4 0e		 cpy $0e
$1b:a028  0a			asl a
$1b:a029  31 1e		 and ($1e),y
$1b:a02b  92 a8		 sta ($a8)
$1b:a02d  47 a4		 eor [$a4]
$1b:a02f  b1 10		 lda ($10),y
$1b:a031  29 2e 04	  and #$042e
$1b:a034  0b			phd
$1b:a035  04 e8		 tsb $e8
$1b:a037  54 01 69	  mvn $69,$01
$1b:a03a  95 00		 sta $00,x
$1b:a03c  63 0b		 adc $0b,s
$1b:a03e  22 98 87 41   jsl $418798
$1b:a042  74 5d		 stz $5d,x
$1b:a044  91 c8		 sta ($c8),y
$1b:a046  cc 4a 7e	  cpy $7e4a
$1b:a049  c7 b0		 cmp [$b0]
$1b:a04b  18			clc
$1b:a04c  c2 ae		 rep #$ae
$1b:a04e  fa			plx
$1b:a04f  5f ff fd 96   eor $96fdff,x
$1b:a053  50 34		 bvc $a089
$1b:a055  c2 52		 rep #$52
$1b:a057  18			clc
$1b:a058  42 a9		 wdm #$a9
$1b:a05a  08			php
$1b:a05b  05 95		 ora $95
$1b:a05d  06 0f		 asl $0f
$1b:a05f  60			rts
$1b:a060  87 42		 sta [$42]
$1b:a062  47 e8		 eor [$e8]
$1b:a064  c7 62		 cmp [$62]
$1b:a066  6e 52 8b	  ror $8b52
$1b:a069  81 03		 sta ($03,x)
$1b:a06b  82 98 3c	  brl $dd06
$1b:a06e  9d 74 c5	  sta $c574,x
$1b:a071  d9 20 d8	  cmp $d820,y
$1b:a074  8b			phb
$1b:a075  01 e1		 ora ($e1,x)
$1b:a077  86 42		 stx $42
$1b:a079  ec e5 52	  cpx $52e5
$1b:a07c  29 53 f2	  and #$f253
$1b:a07f  61 2b		 adc ($2b,x)
$1b:a081  72 82		 adc ($82)
$1b:a083  45 31		 eor $31
$1b:a085  0b			phd
$1b:a086  73 86		 adc ($86,s),y
$1b:a088  66 20		 ror $20
$1b:a08a  81 e1		 sta ($e1,x)
$1b:a08c  8b			phb
$1b:a08d  40			rti
$1b:a08e  9c e0 09	  stz $09e0
$1b:a091  3c 00 20	  bit $2000,x
$1b:a094  84 01		 sty $01
$1b:a096  82 5b 90	  brl $30f4
$1b:a099  a0 31 28	  ldy #$2831
$1b:a09c  d0 1a		 bne $a0b8
$1b:a09e  00 04		 brk #$04
$1b:a0a0  68			pla
$1b:a0a1  02 c3		 cop #$c3
$1b:a0a3  cc 81 08	  cpy $0881
$1b:a0a6  1e 20 b1	  asl $b120,x
$1b:a0a9  44 c4 19	  mvp $19,$c4
$1b:a0ac  6e 50 28	  ror $2850
$1b:a0af  ab			plb
$1b:a0b0  80 e1		 bra $a093
$1b:a0b2  50 d7		 bvc $a08b
$1b:a0b4  39 c5 20	  and $20c5,y
$1b:a0b7  6e e4 87	  ror $87e4
$1b:a0ba  bd 4e 13	  lda $134e,x
$1b:a0bd  06 c2		 asl $c2
$1b:a0bf  25 09		 and $09
$1b:a0c1  92 18		 sta ($18)
$1b:a0c3  a4 a0		 ldy $a0
$1b:a0c5  87 2e		 sta [$2e]
$1b:a0c7  03 08		 ora $08,s
$1b:a0c9  82 c4 9c	  brl $3d90
$1b:a0cc  02 61		 cop #$61
$1b:a0ce  08			php
$1b:a0cf  6c 29 ce	  jmp ($ce29)
$1b:a0d2  26 10		 rol $10
$1b:a0d4  8b			phb
$1b:a0d5  c0 1d c2	  cpy #$c21d
$1b:a0d8  c6 27		 dec $27
$1b:a0da  a8			tay
$1b:a0db  b1 82		 lda ($82),y
$1b:a0dd  0f 08 c3 25   ora $25c308
$1b:a0e1  06 02		 asl $02
$1b:a0e3  4e 10 c9	  lsr $c910
$1b:a0e6  c8			iny
$1b:a0e7  da			phx
$1b:a0e8  4e c6 18	  lsr $18c6
$1b:a0eb  1c 43 40	  trb $4043
$1b:a0ee  f6 28		 inc $28,x
$1b:a0f0  5c 23 44 fd   jml $fd4423
$1b:a0f4  28			plp
$1b:a0f5  9c 23 50	  stz $5023
$1b:a0f8  04 25		 tsb $25
$1b:a0fa  48			pha
$1b:a0fb  82 ca 37	  brl $d8c8
$1b:a0fe  00 dc		 brk #$dc
$1b:a100  01 09		 ora ($09,x)
$1b:a102  6e 28 90	  ror $9028
$1b:a105  0a			asl a
$1b:a106  04 02		 tsb $02
$1b:a108  37 88		 and [$88],y
$1b:a10a  60			rts
$1b:a10b  92 a0		 sta ($a0)
$1b:a10d  33 14		 and ($14,s),y
$1b:a10f  45 69		 eor $69
$1b:a111  b3 84		 lda ($84,s),y
$1b:a113  a7 63		 lda [$63]
$1b:a115  d3 4e		 cmp ($4e,s),y
$1b:a117  99 fc 34	  sta $34fc,y
$1b:a11a  84 a4		 sty $a4
$1b:a11c  d4 84		 pei ($84)
$1b:a11e  8a			txa
$1b:a11f  01 17		 ora ($17,x)
$1b:a121  63 a4		 adc $a4,s
$1b:a123  3d 9c 90	  and $909c,x
$1b:a126  46 70		 lsr $70
$1b:a128  14 8a		 trb $8a
$1b:a12a  48			pha
$1b:a12b  dc 84 f8	  jml [$f884]
$1b:a12e  41 5d		 eor ($5d,x)
$1b:a130  24 9f		 bit $9f
$1b:a132  08			php
$1b:a133  6c 1f 4c	  jmp ($4c1f)
$1b:a136  82 28 a3	  brl $4461
$1b:a139  dc 11 21	  jml [$2111]
$1b:a13c  08			php
$1b:a13d  4f 84 71 8e   eor $8e7184
$1b:a141  23 30		 and $30,s
$1b:a143  84 45		 sty $45
$1b:a145  19 c2 33	  ora $33c2,y
$1b:a148  08			php
$1b:a149  9c 25 aa	  stz $aa25
$1b:a14c  92 18		 sta ($18)
$1b:a14e  07 fb		 ora [$fb]
$1b:a150  fe 92 28	  inc $2892,x
$1b:a153  2a			rol a
$1b:a154  5c a0 30 eb   jml $eb30a0
$1b:a158  43 c9		 eor $c9,s
$1b:a15a  2d 4a 52	  and $524a
$1b:a15d  7e 8a 94	  ror $948a,x
$1b:a160  80 83		 bra $a0e5
$1b:a162  04 53		 tsb $53
$1b:a164  0c 46 0c	  tsb $0c46
$1b:a167  6f 22 4c 40   adc $404c22
$1b:a16b  d2 e5		 cmp ($e5)
$1b:a16d  02 86		 cop #$86
$1b:a16f  96 96		 stx $96,y
$1b:a171  d8			cld
$1b:a172  b4 08		 ldy $08,x
$1b:a174  19 4c 0c	  ora $0c4c,y
$1b:a177  e2 0f		 sep #$0f
$1b:a179  29 01 32	  and #$3201
$1b:a17c  05 62		 ora $62
$1b:a17e  8a			txa
$1b:a17f  27 60		 and [$60]
$1b:a181  43 a0		 eor $a0,s
$1b:a183  16 e3		 asl $e3,x
$1b:a185  48			pha
$1b:a186  c2 60		 rep #$60
$1b:a188  11 63		 ora ($63),y
$1b:a18a  41 42		 eor ($42,x)
$1b:a18c  61 10		 adc ($10,x)
$1b:a18e  e3 79		 sbc $79,s
$1b:a190  42 62		 wdm #$62
$1b:a192  40			rti
$1b:a193  c0 3b 9a	  cpy #$9a3b
$1b:a196  7c 02 a9	  jmp ($a902,x)
$1b:a199  07 42		 ora [$42]
$1b:a19b  90 58		 bcc $a1f5
$1b:a19d  38			sec
$1b:a19e  06 93		 asl $93
$1b:a1a0  88			dey
$1b:a1a1  72 20		 adc ($20)
$1b:a1a3  40			rti
$1b:a1a4  12 72		 ora ($72)
$1b:a1a6  85 08		 sta $08
$1b:a1a8  e2 31		 sep #$31
$1b:a1aa  08			php
$1b:a1ab  47 61		 eor [$61]
$1b:a1ad  ce 4f 21	  dec $214f
$1b:a1b0  77 14		 adc [$14],y
$1b:a1b2  62 01 c9	  per $6ab6
$1b:a1b5  73 90		 adc ($90,s),y
$1b:a1b7  00 5d		 brk #$5d
$1b:a1b9  c2 00		 rep #$00
$1b:a1bb  08			php
$1b:a1bc  e3 45		 sbc $45,s
$1b:a1be  4a			lsr a
$1b:a1bf  64 65		 stz $65
$1b:a1c1  08			php
$1b:a1c2  67 08		 adc [$08]
$1b:a1c4  30 50		 bmi $a216
$1b:a1c6  48			pha
$1b:a1c7  47 29		 eor [$29]
$1b:a1c9  ce 0a 50	  dec $500a
$1b:a1cc  82 44 3b	  brl $dd13
$1b:a1cf  2e 70 6a	  rol $6a70
$1b:a1d2  84 50		 sty $50
$1b:a1d4  02 70		 cop #$70
$1b:a1d6  91 88		 sta ($88),y
$1b:a1d8  82 84 f4	  brl $965f
$1b:a1db  4d 24 38	  eor $3824
$1b:a1de  03 68		 ora $68,s
$1b:a1e0  a2 2d		 ldx #$2d
$1b:a1e2  f0 43		 beq $a227
$1b:a1e4  0b			phd
$1b:a1e5  00 3d		 brk #$3d
$1b:a1e7  02 d1		 cop #$d1
$1b:a1e9  84 46		 sty $46
$1b:a1eb  40			rti
$1b:a1ec  24 1b		 bit $1b
$1b:a1ee  02 d8		 cop #$d8
$1b:a1f0  7a			ply
$1b:a1f1  c5 a4		 cmp $a4
$1b:a1f3  3f 74 b0 0a   and $0ab074,x
$1b:a1f7  40			rti
$1b:a1f8  46 11		 lsr $11
$1b:a1fa  1e 31 25	  asl $2531,x
$1b:a1fd  38			sec
$1b:a1fe  85 0f		 sta $0f
$1b:a200  30 bb		 bmi $a1bd
$1b:a202  41 83		 eor ($83,x)
$1b:a204  60			rts
$1b:a205  74 28		 stz $28,x
$1b:a207  87 1d		 sta [$1d]
$1b:a209  b2 88		 lda ($88)
$1b:a20b  00 70		 brk #$70
$1b:a20d  9f a9 10 4f   sta $4f10a9,x
$1b:a211  20 fd 17	  jsr $17fd
$1b:a214  89 e4		 bit #$e4
$1b:a216  1f b2 f1 3c   ora $3cf1b2,x
$1b:a21a  43 d2		 eor $d2,s
$1b:a21c  88			dey
$1b:a21d  20 01 86	  jsr $8601
$1b:a220  c0 1a		 cpy #$1a
$1b:a222  09 5c		 ora #$5c
$1b:a224  83 aa		 sta $aa,s
$1b:a226  e5 7a		 sbc $7a
$1b:a228  1f c6 02 78   ora $7802c6,x
$1b:a22c  d1 04		 cmp ($04),y
$1b:a22e  b6 0b		 ldx $0b,y
$1b:a230  bb			tyx
$1b:a231  1f db 1e 72   ora $721edb,x
$1b:a235  48			pha
$1b:a236  87 59		 sta [$59]
$1b:a238  56 c8		 lsr $c8,x
$1b:a23a  21 5a		 and ($5a,x)
$1b:a23c  82 1c c2	  brl $645b
$1b:a23f  3a			dec a
$1b:a240  6a			ror a
$1b:a241  65 1a		 adc $1a
$1b:a243  44 7a e7	  mvp $e7,$7a
$1b:a246  a6 59		 ldx $59
$1b:a248  8c 45 7c	  sty $7c45
$1b:a24b  40			rti
$1b:a24c  90 84		 bcc $a1d2
$1b:a24e  ad c8 10	  lda $10c8
$1b:a251  06 c0		 asl $c0
$1b:a253  63 19		 adc $19,s
$1b:a255  cc 01 87	  cpy $8701
$1b:a258  19 21 a2	  ora $a221,y
$1b:a25b  20 1b 79	  jsr $791b
$1b:a25e  06 59		 asl $59
$1b:a260  84 0a		 sty $0a
$1b:a262  0c f5 0d	  tsb $0df5
$1b:a265  5c 10 62 78   jml $786210
$1b:a269  c7 8a		 cmp [$8a]
$1b:a26b  6b			rtl
$1b:a26c  00 01		 brk #$01
$1b:a26e  07 80		 ora [$80]
$1b:a270  ac 86 80	  ldy $8086
$1b:a273  3f 3d e2 d4   and $d4e23d,x
$1b:a277  98			tya
$1b:a278  02 bc		 cop #$bc
$1b:a27a  16 fc		 asl $fc,x
$1b:a27c  41 06		 eor ($06,x)
$1b:a27e  09 8e		 ora #$8e
$1b:a280  1b			tcs
$1b:a281  a6 79		 ldx $79
$1b:a283  5c 4c 0f 29   jml $290f4c
$1b:a287  b8			clv
$1b:a288  e8			inx
$1b:a289  62 1a d1	  per $73a6
$1b:a28c  c8			iny
$1b:a28d  ac 07 7e	  ldy $7e07
$1b:a290  d8			cld
$1b:a291  67 3e		 adc [$3e]
$1b:a293  a8			tay
$1b:a294  91 5e		 sta ($5e),y
$1b:a296  7b			tdc
$1b:a297  d0 49		 bne $a2e2
$1b:a299  2e 43 7c	  rol $7c43
$1b:a29c  63 14		 adc $14,s
$1b:a29e  b8			clv
$1b:a29f  35 40		 and $40,x
$1b:a2a1  76 90		 ror $90,x
$1b:a2a3  36 c0		 rol $c0,x
$1b:a2a5  0f cb cc af   ora $afcccb
$1b:a2a9  20 c8 7f	  jsr $7fc8
$1b:a2ac  54 e2 3f	  mvn $3f,$e2
$1b:a2af  1f 23 e8 d2   ora $d2e823,x
$1b:a2b3  e1 fe		 sbc ($fe,x)
$1b:a2b5  ff b4 c8 8e   sbc $8ec8b4,x
$1b:a2b9  2f a1 87 73   and $7387a1
$1b:a2bd  95 c7		 sta $c7,x
$1b:a2bf  06 dd		 asl $dd
$1b:a2c1  a9 ca		 lda #$ca
$1b:a2c3  1d 00 f7	  ora $f700,x
$1b:a2c6  3e 8e 3f	  rol $3f8e,x
$1b:a2c9  00 ff		 brk #$ff
$1b:a2cb  99 70 f4	  sta $f470,y
$1b:a2ce  72 83		 adc ($83)
$1b:a2d0  93 20		 sta ($20,s),y
$1b:a2d2  7c de 70	  jmp ($70de,x)
$1b:a2d5  18			clc
$1b:a2d6  39 d9 e5	  and $e5d9,y
$1b:a2d9  40			rti
$1b:a2da  01 8a		 ora ($8a,x)
$1b:a2dc  18			clc
$1b:a2dd  5e 0a 10	  lsr $100a,x
$1b:a2e0  08			php
$1b:a2e1  42 8c		 wdm #$8c
$1b:a2e3  21 d6		 and ($d6,x)
$1b:a2e5  86 a1		 stx $a1
$1b:a2e7  26 43		 rol $43
$1b:a2e9  98			tya
$1b:a2ea  33 06		 and ($06,s),y
$1b:a2ec  48			pha
$1b:a2ed  0a			asl a
$1b:a2ee  03 da		 ora $da,s
$1b:a2f0  a3 08		 lda $08,s
$1b:a2f2  44 31 cc	  mvp $cc,$31
$1b:a2f5  6c 80 14	  jmp ($1480)
$1b:a2f8  07 b1		 ora [$b1]
$1b:a2fa  00 a6		 brk #$a6
$1b:a2fc  44 81 23	  mvp $23,$81
$1b:a2ff  8e 1a da	  stx $da1a
$1b:a302  10 40		 bpl $a344
$1b:a304  c0 2d		 cpy #$2d
$1b:a306  c9 01		 cmp #$01
$1b:a308  8e 40 23	  stx $2340
$1b:a30b  10 0f		 bpl $a31c
$1b:a30d  83 38		 sta $38,s
$1b:a30f  d4 62		 pei ($62)
$1b:a311  eb			xba
$1b:a312  05 c0		 ora $c0
$1b:a314  3a			dec a
$1b:a315  06 20		 asl $20
$1b:a317  a3 17		 lda $17,s
$1b:a319  40			rti
$1b:a31a  b2 40		 lda ($40)
$1b:a31c  4a			lsr a
$1b:a31d  63 02		 adc $02,s
$1b:a31f  7b			tdc
$1b:a320  07 df		 ora [$df]
$1b:a322  ff 21 80 46   sbc $468021,x
$1b:a326  d2 02		 cmp ($02)
$1b:a328  62 04 58	  per $fb2f
$1b:a32b  41 d1		 eor ($d1,x)
$1b:a32d  c2 c7		 rep #$c7
$1b:a32f  08			php
$1b:a330  5b			tcd
$1b:a331  68			pla
$1b:a332  14 83		 trb $83
$1b:a334  0d 83 5b	  ora $5b83
$1b:a337  0e 63 08	  asl $0863
$1b:a33a  2b			pld
$1b:a33b  05 b5		 ora $b5
$1b:a33d  a8			tay
$1b:a33e  24 f0		 bit $f0
$1b:a340  80 49		 bra $a38b
$1b:a342  97 03		 sta [$03],y
$1b:a344  0f 89 c0 33   ora $33c089
$1b:a348  0a			asl a
$1b:a349  30 34		 bmi $a37f
$1b:a34b  84 2e		 sty $2e
$1b:a34d  10 6d		 bpl $a3bc
$1b:a34f  14 50		 trb $50
$1b:a351  40			rti
$1b:a352  e2 18		 sep #$18
$1b:a354  81 ed		 sta ($ed,x)
$1b:a356  9b			txy
$1b:a357  84 9b		 sty $9b
$1b:a359  e5 e9		 sbc $e9
$1b:a35b  22 99 11 00   jsl $001199
$1b:a35f  82 ab 23	  brl $c70d
$1b:a362  30 01		 bmi $a365
$1b:a364  81 56		 sta ($56,x)
$1b:a366  32 47		 and ($47)
$1b:a368  b9 aa c8	  lda $c8aa,y
$1b:a36b  00 82		 brk #$82
$1b:a36d  11 75		 ora ($75),y
$1b:a36f  07 cc		 ora [$cc]
$1b:a371  08			php
$1b:a372  0d 31 80	  ora $8031
$1b:a375  35 80		 and $80,x
$1b:a377  8b			phb
$1b:a378  0f a7 4e 2b   ora $2b4ea7
$1b:a37c  13 8b		 ora ($8b,s),y
$1b:a37e  14 e2		 trb $e2
$1b:a380  d9 38 c7	  cmp $c738,y
$1b:a383  4e 36 13	  lsr $1336
$1b:a386  8e 94 e3	  stx $e394
$1b:a389  b9 38 f3	  lda $f338,y
$1b:a38c  4e 3e 13	  lsr $133e
$1b:a38f  88			dey
$1b:a390  94 e6		 sty $e6,x
$1b:a392  69 39		 adc #$39
$1b:a394  ab			plb
$1b:a395  4e 6c 13	  lsr $136c
$1b:a398  9b			txy
$1b:a399  54 e6 e9	  mvn $e9,$e6
$1b:a39c  39 cb 4e	  and $4ecb,y
$1b:a39f  77 13		 adc [$13],y
$1b:a3a1  9e d4 e7	  stz $e7d4,x
$1b:a3a4  d9 39 8f	  cmp $8f39,y
$1b:a3a7  4e a5 13	  lsr $13a5
$1b:a3aa  a9 94		 lda #$94
$1b:a3ac  ea			nop
$1b:a3ad  79 3a a3	  adc $a33a,y
$1b:a3b0  4e aa 13	  lsr $13aa
$1b:a3b3  ab			plb
$1b:a3b4  94 eb		 sty $eb,x
$1b:a3b6  29 3a		 and #$3a
$1b:a3b8  db			stp
$1b:a3b9  4e ba 13	  lsr $13ba
$1b:a3bc  a8			tay
$1b:a3bd  14 ee		 trb $ee
$1b:a3bf  49 3b		 eor #$3b
$1b:a3c1  97 4e		 sta [$4e],y
$1b:a3c3  e8			inx
$1b:a3c4  13 bb		 ora ($bb,s),y
$1b:a3c6  14 ee		 trb $ee
$1b:a3c8  d9 3b d7	  cmp $d73b,y
$1b:a3cb  4e e6 01	  lsr $01e6
$1b:a3ce  d0 9e		 bne $a36e
$1b:a3d0  40			rti
$1b:a3d1  07 a7		 ora [$a7]
$1b:a3d3  5c 9e 7f ff   jml $ff7f9e
$1b:a3d7  e3 d4		 sbc $d4,s
$1b:a3d9  ca			dex
$1b:a3da  11 1f		 ora ($1f),y
$1b:a3dc  8a			txa
$1b:a3dd  44 18 38	  mvp $38,$18
$1b:a3e0  f4 60 24	  pea $2460
$1b:a3e3  21 2d		 and ($2d,x)
$1b:a3e5  a7 84		 lda [$84]
$1b:a3e7  c4 a6		 cpy $a6
$1b:a3e9  16 85		 asl $85,x
$1b:a3eb  cf 4b 28 45   cmp $45284b
$1b:a3ef  02 68		 cop #$68
$1b:a3f1  1f 52 6b 3d   ora $3d6b52,x
$1b:a3f5  3e e5 60	  rol $60e5,x
$1b:a3f8  f4 64 52	  pea $5264
$1b:a3fb  2b			pld
$1b:a3fc  82 7d 2f	  brl $d37c
$1b:a3ff  68			pla
$1b:a400  c1 50		 cmp ($50,x)
$1b:a402  d6 5c		 dec $5c,x
$1b:a404  f4 23 d4	  pea $d423
$1b:a407  d9 af 9f	  cmp $9faf,y
$1b:a40a  e4 be		 cpx $be
$1b:a40c  79 8c f8	  adc $f88c,y
$1b:a40f  b2 cc		 lda ($cc)
$1b:a411  70 2d		 bvs $a440
$1b:a413  a5 36		 lda $36
$1b:a415  7c df cb	  jmp ($cbdf,x)
$1b:a418  83 71		 sta $71,s
$1b:a41a  48			pha
$1b:a41b  a0 d1		 ldy #$d1
$1b:a41d  03 ea		 ora $ea,s
$1b:a41f  64 dd		 stz $dd
$1b:a421  c6 05		 dec $05
$1b:a423  8d eb 70	  sta $70eb
$1b:a426  c8			iny
$1b:a427  a4 db		 ldy $db
$1b:a429  04 fa		 tsb $fa
$1b:a42b  79 c5 4a	  adc $4ac5,y
$1b:a42e  29 68		 and #$68
$1b:a430  1c fd a6	  trb $a6fd
$1b:a433  d1 f2		 cmp ($f2),y
$1b:a435  13 d4		 ora ($d4,s),y
$1b:a437  08			php
$1b:a438  4f 81 21 0b   eor $0b2181
$1b:a43c  9d 09 60	  sta $6009,x
$1b:a43f  ef 4d 21 a9   sbc $a9214d
$1b:a443  4d 2d c0	  eor $c02d
$1b:a446  30 2b		 bmi $a473
$1b:a448  4c 0a a0	  jmp $a00a
$1b:a44b  11 4e		 ora ($4e),y
$1b:a44d  e2 31		 sep #$31
$1b:a44f  51 6d		 eor ($6d),y
$1b:a451  f8			sed
$1b:a452  30 1b		 bmi $a46f
$1b:a454  4c 8b e0	  jmp $e08b
$1b:a457  33 48		 and ($48,s),y
$1b:a459  a5 01		 lda $01
$1b:a45b  4f 93 7a 01   eor $017a93
$1b:a45f  0c 29 e4	  tsb $e429
$1b:a462  53 ad		 eor ($ad,s),y
$1b:a464  50 19		 bvc $a47f
$1b:a466  29 76		 and #$76
$1b:a468  63 0c		 adc $0c,s
$1b:a46a  bc 8a 79	  ldy $798a,x
$1b:a46d  95 b0		 sta $b0,x
$1b:a46f  b2 d1		 lda ($d1)
$1b:a471  c6 8e		 dec $8e
$1b:a473  18			clc
$1b:a474  9f b7 16 3e   sta $3e16b7,x
$1b:a478  45 3d		 eor $3d
$1b:a47a  e3 18		 sbc $18,s
$1b:a47c  48			pha
$1b:a47d  a9 fb		 lda #$fb
$1b:a47f  05 3c		 ora $3c
$1b:a481  ea			nop
$1b:a482  82 43 6b	  brl $0fc8
$1b:a485  58			cli
$1b:a486  79 e0 b4	  adc $b4e0,y
$1b:a489  21 4b		 and ($4b,x)
$1b:a48b  6e c6 42	  ror $42c6
$1b:a48e  6b			rtl
$1b:a48f  41 38		 eor ($38,x)
$1b:a491  1a			inc a
$1b:a492  d3 0e		 cmp ($0e,s),y
$1b:a494  46 5d		 lsr $5d
$1b:a496  c1 19		 cmp ($19,x)
$1b:a498  7a			ply
$1b:a499  81 e1		 sta ($e1,x)
$1b:a49b  46 a0		 lsr $a0
$1b:a49d  c4 11		 cpy $11
$1b:a49f  a9 2f		 lda #$2f
$1b:a4a1  34 2d		 bit $2d,x
$1b:a4a3  80 d0		 bra $a475
$1b:a4a5  b8			clv
$1b:a4a6  a1 e1		 lda ($e1,x)
$1b:a4a8  8a			txa
$1b:a4a9  48			pha
$1b:a4aa  76 0b		 ror $0b,x
$1b:a4ac  74 fd		 stz $fd,x
$1b:a4ae  22 96 73 43   jsl $437396
$1b:a4b2  5b			tcd
$1b:a4b3  a5 e2		 lda $e2
$1b:a4b5  86 5f		 stx $5f
$1b:a4b7  41 58		 eor ($58,x)
$1b:a4b9  6d d3 42	  adc $42d3
$1b:a4bc  2b			pld
$1b:a4bd  2f 42 b1 63   and $63b142
$1b:a4c1  34 41		 bit $41,x
$1b:a4c3  48			pha
$1b:a4c4  40			rti
$1b:a4c5  c5 67		 cmp $67
$1b:a4c7  4a			lsr a
$1b:a4c8  a2 2f		 ldx #$2f
$1b:a4ca  d3 12		 cmp ($12,s),y
$1b:a4cc  c6 5e		 dec $5e
$1b:a4ce  43 19		 eor $19,s
$1b:a4d0  60			rts
$1b:a4d1  f4 56 7e	  pea $7e56
$1b:a4d4  33 40		 and ($40,s),y
$1b:a4d6  52 10		 eor ($10)
$1b:a4d8  f1 59		 sbc ($59),y
$1b:a4da  d1 a8		 cmp ($a8),y
$1b:a4dc  af 14 b8 3e   lda $3eb814
$1b:a4e0  15 ee		 ora $ee,x
$1b:a4e2  d9 aa 28	  cmp $28aa,y
$1b:a4e5  a5 b8		 lda $b8
$1b:a4e7  81 03		 sta ($03,x)
$1b:a4e9  08			php
$1b:a4ea  93 dc		 sta ($dc,s),y
$1b:a4ec  02 68		 cop #$68
$1b:a4ee  f7 07		 sbc [$07],y
$1b:a4f0  7b			tdc
$1b:a4f1  7b			tdc
$1b:a4f2  9f 0a 19 07   sta $07190a,x
$1b:a4f6  8a			txa
$1b:a4f7  46 28		 lsr $28
$1b:a4f9  c3 76		 cmp $76,s
$1b:a4fb  08			php
$1b:a4fc  b5 0a		 lda $0a,x
$1b:a4fe  8c 1b 6b	  sty $6b1b
$1b:a501  7d 1e 28	  adc $281e,x
$1b:a504  13 33		 ora ($33,s),y
$1b:a506  08			php
$1b:a507  04 c2		 tsb $c2
$1b:a509  02 66		 cop #$66
$1b:a50b  35 aa		 and $aa,x
$1b:a50d  1a			inc a
$1b:a50e  60			rts
$1b:a50f  c7 05		 cmp [$05]
$1b:a511  d4 39		 pei ($39)
$1b:a513  b0 44		 bcs $a559
$1b:a515  25 e1		 and $e1
$1b:a517  33 dd		 and ($dd,s),y
$1b:a519  d0 99		 bne $a4b4
$1b:a51b  e9 8f		 sbc #$8f
$1b:a51d  a3 33		 lda $33,s
$1b:a51f  d1 47		 cmp ($47),y
$1b:a521  11 f4		 ora ($f4),y
$1b:a523  f7 af		 sbc [$af],y
$1b:a525  f1 3a		 sbc ($3a),y
$1b:a527  cb			wai
$1b:a528  d4 f1		 pei ($f1)
$1b:a52a  91 96		 sta ($96),y
$1b:a52c  53 47		 eor ($47,s),y
$1b:a52e  85 b9		 sta $b9
$1b:a530  b4 7e		 ldy $7e,x
$1b:a532  8e b0 7a	  stx $7ab0
$1b:a535  a3 cc		 lda $cc,s
$1b:a537  1c ac 4f	  trb $4fac
$1b:a53a  6b			rtl
$1b:a53b  61 60		 adc ($60,x)
$1b:a53d  4e 60 59	  lsr $5960
$1b:a540  21 28		 and ($28,x)
$1b:a542  0a			asl a
$1b:a543  52 9b		 eor ($9b)
$1b:a545  3e 14 e5	  rol $e514,x
$1b:a548  c2 7c		 rep #$7c
$1b:a54a  5d 28 84	  eor $8428,x
$1b:a54d  02 41		 cop #$41
$1b:a54f  00 ff		 brk #$ff
$1b:a551  7f c9 a0 4d   adc $4da0c9,x
$1b:a555  08			php
$1b:a556  31 f0		 and ($f0),y
$1b:a558  e1 cf		 sbc ($cf,x)
$1b:a55a  62 84 43	  per $e8e1
$1b:a55d  61 34		 adc ($34,x)
$1b:a55f  08			php
$1b:a560  14 02		 trb $02
$1b:a562  0f 01 31 8d   ora $8d3101
$1b:a566  08			php
$1b:a567  c0 31 58	  cpy #$5831
$1b:a56a  0d 40 cc	  ora $cc40
$1b:a56d  47 11		 eor [$11]
$1b:a56f  36 84		 rol $84,x
$1b:a571  16 07		 asl $07,x
$1b:a573  16 80		 asl $80,x
$1b:a575  5b			tcd
$1b:a576  70 44		 bvs $a5bc
$1b:a578  b2 5e		 lda ($5e)
$1b:a57a  87 f4		 sta [$f4]
$1b:a57c  a4 70		 ldy $70
$1b:a57e  52 c1		 eor ($c1)
$1b:a580  c3 0c		 cmp $0c,s
$1b:a582  c0 60 18	  cpy #$1860
$1b:a585  64 22		 stz $22
$1b:a587  86 66		 stx $66
$1b:a589  24 d8		 bit $d8
$1b:a58b  9b			txy
$1b:a58c  4a			lsr a
$1b:a58d  29 00 a9	  and #$a900
$1b:a590  99 89 52	  sta $5289,y
$1b:a593  26 d1		 rol $d1
$1b:a595  26 92		 rol $92
$1b:a597  25 0e		 and $0e
$1b:a599  80 59		 bra $a5f4
$1b:a59b  28			plp
$1b:a59c  6c 10 b0	  jmp ($b010)
$1b:a59f  50 d8		 bvc $a579
$1b:a5a1  05 1a		 ora $1a
$1b:a5a3  04 59		 tsb $59
$1b:a5a5  04 29		 tsb $29
$1b:a5a7  31 c0		 and ($c0),y
$1b:a5a9  a6 4c		 ldx $4c
$1b:a5ab  71 2c		 adc ($2c),y
$1b:a5ad  8c 4d ec	  sty $ec4d
$1b:a5b0  0d e1 85	  ora $85e1
$1b:a5b3  c2 28		 rep #$28
$1b:a5b5  29 61 84	  and #$8461
$1b:a5b8  c6 c4		 dec $c4
$1b:a5ba  80 74		 bra $a630
$1b:a5bc  08			php
$1b:a5bd  44 05 de	  mvp $de,$05
$1b:a5c0  16 d6		 asl $d6,x
$1b:a5c2  7f b8 10 b0   adc $b010b8,x
$1b:a5c6  0e 81 3d	  asl $3d81
$1b:a5c9  84 26		 sty $26
$1b:a5cb  00 ef		 brk #$ef
$1b:a5cd  13 d8		 ora ($d8,s),y
$1b:a5cf  40			rti
$1b:a5d0  61 0f		 adc ($0f,x)
$1b:a5d2  61 59		 adc ($59,x)
$1b:a5d4  9c 78 84	  stz $8478
$1b:a5d7  25 32		 and $32
$1b:a5d9  81 b0		 sta ($b0,x)
$1b:a5db  51 80		 eor ($80),y
$1b:a5dd  70 c8		 bvs $a5a7
$1b:a5df  0d 10 e8	  ora $e810
$1b:a5e2  10 48		 bpl $a62c
$1b:a5e4  24 55		 bit $55
$1b:a5e6  00 2f		 brk #$2f
$1b:a5e8  a2 14 4b	  ldx #$4b14
$1b:a5eb  24 98		 bit $98
$1b:a5ed  04 a1		 tsb $a1
$1b:a5ef  01 e8		 ora ($e8,x)
$1b:a5f1  1e c2 0f	  asl $0fc2,x
$1b:a5f4  02 21		 cop #$21
$1b:a5f6  92 0e		 sta ($0e)
$1b:a5f8  98			tya
$1b:a5f9  09 0c 63	  ora #$630c
$1b:a5fc  9c 32 01	  stz $0132
$1b:a5ff  48			pha
$1b:a600  4b			phk
$1b:a601  09 b3 cf	  ora #$cfb3
$1b:a604  ab			plb
$1b:a605  4a			lsr a
$1b:a606  42 98		 wdm #$98
$1b:a608  a0 10 c4	  ldy #$c410
$1b:a60b  fc 08 3b	  jsr ($3b08,x)
$1b:a60e  04 e1		 tsb $e1
$1b:a610  d2 01		 cmp ($01)
$1b:a612  98			tya
$1b:a613  c2 20		 rep #$20
$1b:a615  d1 0b		 cmp ($0b),y
$1b:a617  00 cc		 brk #$cc
$1b:a619  20 f0 15	  jsr $15f0
$1b:a61c  d0 d0		 bne $a5ee
$1b:a61e  16 e3		 asl $e3,x
$1b:a620  0e 84 5c	  asl $5c84
$1b:a623  17 a4		 ora [$a4],y
$1b:a625  c8			iny
$1b:a626  16 21		 asl $21,x
$1b:a628  45 a0		 eor $a0
$1b:a62a  18			clc
$1b:a62b  95 e9		 sta $e9,x
$1b:a62d  35 85		 and $85,x
$1b:a62f  88			dey
$1b:a630  2a			rol a
$1b:a631  4f 91 2d 92   eor $922d91
$1b:a635  c6 bd		 dec $bd
$1b:a637  4b			phk
$1b:a638  1b			tcs
$1b:a639  11 2e		 ora ($2e),y
$1b:a63b  6c b4 b9	  jmp ($b9b4)
$1b:a63e  b4 bd		 ldy $bd,x
$1b:a640  c7 09		 cmp [$09]
$1b:a642  24 87		 bit $87
$1b:a644  49 12 65	  eor #$6512
$1b:a647  0e 80 59	  asl $5980
$1b:a64a  9c c7 1d	  stz $1dc7
$1b:a64d  73 2c		 adc ($2c,s),y
$1b:a64f  0d 26 70	  ora $7026
$1b:a652  dc 53 80	  jml [$8053]
$1b:a655  20 50 68	  jsr $6850
$1b:a658  6c 22 f8	  jmp ($f822)
$1b:a65b  93 28		 sta ($28,s),y
$1b:a65d  6c 02 c2	  jmp ($c202)
$1b:a660  85 32		 sta $32
$1b:a662  07 91		 ora [$91]
$1b:a664  c2 0a		 rep #$0a
$1b:a666  54 0b e9	  mvn $e9,$0b
$1b:a669  5d 2c 85	  eor $852c,x
$1b:a66c  e5 4d		 sbc $4d
$1b:a66e  80 a0		 bra $a610
$1b:a670  a0 8e e6	  ldy #$e68e
$1b:a673  17 0c		 ora [$0c],y
$1b:a675  1a			inc a
$1b:a676  11 64		 ora ($64),y
$1b:a678  7a			ply
$1b:a679  93 74		 sta ($74,s),y
$1b:a67b  0a			asl a
$1b:a67c  c0 13 08	  cpy #$0813
$1b:a67f  03 74		 ora $74,s
$1b:a681  0f 24 84 b1   ora $b18424
$1b:a685  a9 25 49	  lda #$4925
$1b:a688  fe 09 b0	  inc $b009,x
$1b:a68b  70 04		 bvs $a691
$1b:a68d  20 36 37	  jsr $3736
$1b:a690  c7 00		 cmp [$00]
$1b:a692  c2 55		 rep #$55
$1b:a694  02 1f		 cop #$1f
$1b:a696  33 1b		 and ($1b,s),y
$1b:a698  0b			phd
$1b:a699  12 1a		 ora ($1a)
$1b:a69b  33 32		 and ($32,s),y
$1b:a69d  d8			cld
$1b:a69e  5a			phy
$1b:a69f  07 76		 ora [$76]
$1b:a6a1  e2 cb		 sep #$cb
$1b:a6a3  51 90		 eor ($90),y
$1b:a6a5  e3 50		 sbc $50,s
$1b:a6a7  0f f7 fc 50   ora $50fcf7
$1b:a6ab  50 51		 bvc $a6fe
$1b:a6ad  69 c2 20	  adc #$20c2
$1b:a6b0  c9 d2 12	  cmp #$12d2
$1b:a6b3  86 01		 stx $01
$1b:a6b5  fc 10 78	  jsr ($7810,x)
$1b:a6b8  08			php
$1b:a6b9  98			tya
$1b:a6ba  68			pla
$1b:a6bb  49 e1 57	  eor #$57e1
$1b:a6be  06 40		 asl $40
$1b:a6c0  52 43		 eor ($43)
$1b:a6c2  41 18		 eor ($18,x)
$1b:a6c4  08			php
$1b:a6c5  43 d4		 eor $d4,s
$1b:a6c7  c0 23 3c	  cpy #$3c23
$1b:a6ca  18			clc
$1b:a6cb  a5 30		 lda $30
$1b:a6cd  63 04		 adc $04,s
$1b:a6cf  c9 8d d3	  cmp #$d38d
$1b:a6d2  26 3e		 rol $3e
$1b:a6d4  b8			clv
$1b:a6d5  18			clc
$1b:a6d6  6d 21 4f	  adc $4f21
$1b:a6d9  20 81 c1	  jsr $c181
$1b:a6dc  44 a1 86	  mvp $86,$a1
$1b:a6df  7f 02 18 15   adc $151802,x
$1b:a6e3  c1 96		 cmp ($96,x)
$1b:a6e5  7f 02 b4 63   adc $63b402,x
$1b:a6e9  21 35		 and ($35,x)
$1b:a6eb  7f 24 1c 42   adc $421c24,x
$1b:a6ef  00 01		 brk #$01
$1b:a6f1  83 c0		 sta $c0,s
$1b:a6f3  30 30		 bmi $a725
$1b:a6f5  20 00 25	  jsr $2500
$1b:a6f8  6d 50 4a	  adc $4a50
$1b:a6fb  62 80 aa	  per $517e
$1b:a6fe  c4 7c		 cpy $7c
$1b:a700  69 7d 29	  adc #$297d
$1b:a703  02 a0		 cop #$a0
$1b:a705  f0 8a		 beq $a691
$1b:a707  ef 6d ab 18   sbc $18ab6d
$1b:a70b  70 8c		 bvs $a699
$1b:a70d  ab			plb
$1b:a70e  3e 24 1d	  rol $1d24,x
$1b:a711  06 6d		 asl $6d
$1b:a713  d0 c3		 bne $a6d8
$1b:a715  a2 ca 1f	  ldx #$1fca
$1b:a718  00 cb		 brk #$cb
$1b:a71a  a4 ac		 ldy $ac
$1b:a71c  1f 98 80 f2   ora $f28098,x
$1b:a720  66 12		 ror $12
$1b:a722  47 1d		 eor [$1d]
$1b:a724  80 7f		 bra $a7a5
$1b:a726  d3 51		 cmp ($51,s),y
$1b:a728  0c 80 6b	  tsb $6b80
$1b:a72b  a0 87 e2	  ldy #$e287
$1b:a72e  86 63		 stx $63
$1b:a730  8f e2 4b 81   sta $814be2
$1b:a734  90 40		 bcc $a776
$1b:a736  20 90 48	  jsr $4890
$1b:a739  64 23		 stz $23
$1b:a73b  5a			phy
$1b:a73c  5d 22 d7	  eor $d722,x
$1b:a73f  9a			txs
$1b:a740  d8			cld
$1b:a741  f4 a7 31	  pea $31a7
$1b:a744  82 44 33	  brl $da8b
$1b:a747  23 33		 and $33,s
$1b:a749  42 eb		 wdm #$eb
$1b:a74b  fc 14 87	  jsr ($8714,x)
$1b:a74e  8c 1a 8c	  sty $8c1a
$1b:a751  20 ec 1b	  jsr $1bec
$1b:a754  d6 b8		 dec $b8,x
$1b:a756  41 e0		 eor ($e0,x)
$1b:a758  2c 31 01	  bit $0131
$1b:a75b  0c 22 1b	  tsb $1b22
$1b:a75e  07 d6		 ora [$d6]
$1b:a760  27 01		 and [$01]
$1b:a762  f4 0d 11	  pea $110d
$1b:a765  a2 30 06	  ldx #$0630
$1b:a768  29 00 df	  and #$df00
$1b:a76b  35 09		 and $09,x
$1b:a76d  be 1b f4	  ldx $f41b,y
$1b:a770  e0 2b 3e	  cpx #$3e2b
$1b:a773  19 8a a0	  ora $a08a,y
$1b:a776  30 3d		 bmi $a7b5
$1b:a778  a3 ee		 lda $ee,s
$1b:a77a  2a			rol a
$1b:a77b  8d 99 0d	  sta $0d99
$1b:a77e  66 10		 ror $10
$1b:a780  55 19		 eor $19,x
$1b:a782  c2 e1		 rep #$e1
$1b:a784  c5 62		 cmp $62
$1b:a786  81 c2		 sta ($c2,x)
$1b:a788  25 d0		 and $d0
$1b:a78a  23 d0		 and $d0,s
$1b:a78c  c2 e0		 rep #$e0
$1b:a78e  13 e2		 ora ($e2,s),y
$1b:a790  21 10		 and ($10,x)
$1b:a792  42 bc		 wdm #$bc
$1b:a794  80 22		 bra $a7b8
$1b:a796  40			rti
$1b:a797  5b			tcd
$1b:a798  9d 27 20	  sta $2027,x
$1b:a79b  17 28		 ora [$28],y
$1b:a79d  14 0f		 trb $0f
$1b:a79f  42 b3		 wdm #$b3
$1b:a7a1  0e 02 00	  asl $0002
$1b:a7a4  e2 1a		 sep #$1a
$1b:a7a6  02 cd		 cop #$cd
$1b:a7a8  8d 4d 66	  sta $664d
$1b:a7ab  1c 27 48	  trb $4827
$1b:a7ae  c2 21		 rep #$21
$1b:a7b0  11 0d		 ora ($0d),y
$1b:a7b2  93 88		 sta ($88,s),y
$1b:a7b4  00 e0		 brk #$e0
$1b:a7b6  8e 10 d1	  stx $d110
$1b:a7b9  40			rti
$1b:a7ba  23 1a		 and $1a,s
$1b:a7bc  24 89		 bit $89
$1b:a7be  27 06		 and [$06]
$1b:a7c0  88			dey
$1b:a7c1  53 08		 eor ($08,s),y
$1b:a7c3  79 77 d4	  adc $d477,y
$1b:a7c6  c2 71		 rep #$71
$1b:a7c8  25 35		 and $35
$1b:a7ca  a0 98 34	  ldy #$3498
$1b:a7cd  01 50		 ora ($50,x)
$1b:a7cf  84 25		 sty $25
$1b:a7d1  8a			txa
$1b:a7d2  02 f6		 cop #$f6
$1b:a7d4  04 e9		 tsb $e9
$1b:a7d6  05 41		 ora $41
$1b:a7d8  46 4d		 lsr $4d
$1b:a7da  f1 6d		 sbc ($6d),y
$1b:a7dc  89 d4 e3	  bit #$e3d4
$1b:a7df  e2 e5		 sep #$e5
$1b:a7e1  10 81		 bpl $a764
$1b:a7e3  4c 55 21	  jmp $2155
$1b:a7e6  c4 29		 cpy $29
$1b:a7e8  13 bc		 ora ($bc,s),y
$1b:a7ea  36 88		 rol $88,x
$1b:a7ec  a2 80 45	  ldx #$4580
$1b:a7ef  f4 69 f3	  pea $f369
$1b:a7f2  0a			asl a
$1b:a7f3  02 60		 cop #$60
$1b:a7f5  4f 1f c6 45   eor $45c61f
$1b:a7f9  26 cd		 rol $cd
$1b:a7fb  22 9b 34 c2   jsl $c2349b
$1b:a7ff  05 50		 ora $50
$1b:a801  8a			txa
$1b:a802  0c 23 7c	  tsb $7c23
$1b:a805  72 ec		 adc ($ec)
$1b:a807  81 82		 sta ($82,x)
$1b:a809  de 30 a1	  dec $a130,x
$1b:a80c  04 80		 tsb $80
$1b:a80e  34 4c		 bit $4c,x
$1b:a810  3f 17 8b b1   and $b18b17,x
$1b:a814  07 02		 ora [$02]
$1b:a816  12 01		 ora ($01)
$1b:a818  e9 b8		 sbc #$b8
$1b:a81a  08			php
$1b:a81b  e0 84 c1	  cpx #$c184
$1b:a81e  19 80 88	  ora $8880,y
$1b:a821  23 70		 and $70,s
$1b:a823  0f e7 fc 44   ora $44fce7
$1b:a827  0c b0 70	  tsb $70b0
$1b:a82a  83 68		 sta $68,s
$1b:a82c  4f 61 a8 04   eor $04a861
$1b:a830  0a			asl a
$1b:a831  d0 74		 bne $a8a7
$1b:a833  cf 31 8c 1e   cmp $1e8c31
$1b:a837  c3 56		 cmp $56,s
$1b:a839  e5 08		 sbc $08
$1b:a83b  84 20		 sty $20
$1b:a83d  f6 1a		 inc $1a,x
$1b:a83f  97 28		 sta [$28],y
$1b:a841  46 0f		 lsr $0f
$1b:a843  43 aa		 eor $aa,s
$1b:a845  69 94		 adc #$94
$1b:a847  22 0f a5 66   jsl $66a50f
$1b:a84b  13 78		 ora ($78,s),y
$1b:a84d  34 83		 bit $83,x
$1b:a84f  21 11		 and ($11,x)
$1b:a851  04 71		 tsb $71
$1b:a853  5f 45 70 dc   eor $dc7045,x
$1b:a857  33 08		 and ($08,s),y
$1b:a859  ae 1b 96	  ldx $961b
$1b:a85c  99 15 c3	  sta $c315,y
$1b:a85f  74 be		 stz $be,x
$1b:a861  38			sec
$1b:a862  43 10		 eor $10,s
$1b:a864  5c 63 08 73   jml $730863
$1b:a868  8b			phb
$1b:a869  70 61		 bvs $a8cc
$1b:a86b  0e 01 80	  asl $8001
$1b:a86e  c5 ca		 cmp $ca
$1b:a870  e0 cb 15	  cpx #$15cb
$1b:a873  5f c0 39 0c   eor $0c39c0,x
$1b:a877  c4 e4		 cpy $e4
$1b:a879  b4 d3		 ldy $d3,x
$1b:a87b  94 be		 sty $be,x
$1b:a87d  77 1a		 adc [$1a],y
$1b:a87f  b7 15		 lda [$15],y
$1b:a881  8e ae af	  stx $afae
$1b:a884  80 76		 bra $a8fc
$1b:a886  1f a9 d9 02   ora $02d9a9,x
$1b:a88a  27 68		 and [$68]
$1b:a88c  17 e1		 ora [$e1],y
$1b:a88e  ca			dex
$1b:a88f  fc 3c 06	  jsr ($063c,x)
$1b:a892  61 00		 adc ($00,x)
$1b:a894  81 a2		 sta ($a2,x)
$1b:a896  c5 18		 cmp $18
$1b:a898  10 51		 bpl $a8eb
$1b:a89a  08			php
$1b:a89b  07 02		 ora [$02]
$1b:a89d  47 00		 eor [$00]
$1b:a89f  f5 22		 sbc $22,x
$1b:a8a1  44 fc 11	  mvp $11,$fc
$1b:a8a4  3f 36 11 68   and $681136,x
$1b:a8a8  30 09		 bmi $a8b3
$1b:a8aa  1f a1 82 52   ora $5282a1,x
$1b:a8ae  08			php
$1b:a8af  1f 93 08 8b   ora $8b0893,x
$1b:a8b3  18			clc
$1b:a8b4  a4 5f		 ldy $5f
$1b:a8b6  78			sei
$1b:a8b7  a5 f5		 lda $f5
$1b:a8b9  b0 fb		 bcs $a8b6
$1b:a8bb  17 44		 ora [$44],y
$1b:a8bd  c5 0f		 cmp $0f
$1b:a8bf  22 e9 57 44   jsl $4457e9
$1b:a8c3  cc 0f 42	  cpy $420f
$1b:a8c6  40			rti
$1b:a8c7  5a			phy
$1b:a8c8  45 44		 eor $44
$1b:a8ca  6b			rtl
$1b:a8cb  fa			plx
$1b:a8cc  dc 3d cb	  jml [$cb3d]
$1b:a8cf  a4 f1		 ldy $f1
$1b:a8d1  3a			dec a
$1b:a8d2  d3 c0		 cmp ($c0,s),y
$1b:a8d4  f9 4f 03	  sbc $034f,y
$1b:a8d7  3d 8e 80	  and $808e,x
$1b:a8da  8c 03 48	  sty $4803
$1b:a8dd  1b			tcs
$1b:a8de  41 5c		 eor ($5c,x)
$1b:a8e0  47 31		 eor [$31]
$1b:a8e2  82 c0 e0	  brl $89a5
$1b:a8e5  91 0d		 sta ($0d),y
$1b:a8e7  da			phx
$1b:a8e8  5c 09 01 0c   jml $0c0109
$1b:a8ec  84 72		 sty $72
$1b:a8ee  c9 a5		 cmp #$a5
$1b:a8f0  14 80		 trb $80
$1b:a8f2  76 c7		 ror $c7,x
$1b:a8f4  02 c4		 cop #$c4
$1b:a8f6  08			php
$1b:a8f7  a7 31		 lda [$31]
$1b:a8f9  2e 0c 40	  rol $400c
$1b:a8fc  2f 8d 10 b8   and $b8108d
$1b:a900  30 88		 bmi $a88a
$1b:a902  67 70		 adc [$70]
$1b:a904  c4 46		 cpy $46
$1b:a906  d1 34		 cmp ($34),y
$1b:a908  88			dey
$1b:a909  ec bf 64	  cpx $64bf
$1b:a90c  06 82		 asl $82
$1b:a90e  41 20		 eor ($20,x)
$1b:a910  64 b2		 stz $b2
$1b:a912  43 84		 eor $84,s
$1b:a914  2c a4 48	  bit $48a4
$1b:a917  70 89		 bvs $a8a2
$1b:a919  96 56		 stx $56,y
$1b:a91b  27 cd		 and [$cd]
$1b:a91d  31 1a		 and ($1a),y
$1b:a91f  7c 0d 27	  jmp ($270d,x)
$1b:a922  0b			phd
$1b:a923  ee 9c 0d	  inc $0d9c
$1b:a926  5a			phy
$1b:a927  07 75		 ora [$75]
$1b:a929  1f bc 0e 0a   ora $0a0ebc,x
$1b:a92d  4a			lsr a
$1b:a92e  36 30		 rol $30,x
$1b:a930  14 4d		 trb $4d
$1b:a932  8c 05 8f	  sty $8f05
$1b:a935  34 f9		 bit $f9,x
$1b:a937  ea			nop
$1b:a938  e0 50 64	  cpx #$6450
$1b:a93b  49 81		 eor #$81
$1b:a93d  41 20		 eor ($20,x)
$1b:a93f  60			rts
$1b:a940  50 4b		 bvc $a98d
$1b:a942  fa			plx
$1b:a943  a3 d0		 lda $d0,s
$1b:a945  41 17		 eor ($17,x)
$1b:a947  6d 02 04	  adc $0402
$1b:a94a  50 40		 bvc $a98c
$1b:a94c  d9 14 38	  cmp $3814,y
$1b:a94f  40			rti
$1b:a950  21 f4		 and ($f4,x)
$1b:a952  c1 d0		 cmp ($d0,x)
$1b:a954  c2 20		 rep #$20
$1b:a956  f0 8a		 beq $a8e2
$1b:a958  6c 09 06	  jmp ($0609)
$1b:a95b  10 12		 bpl $a96f
$1b:a95d  68			pla
$1b:a95e  d0 a0		 bne $a900
$1b:a960  2d a0 42	  and $42a0
$1b:a963  04 98		 tsb $98
$1b:a965  a0 08 11	  ldy #$1108
$1b:a968  8b			phb
$1b:a969  0e a1 a8	  asl $a8a1
$1b:a96c  10 08		 bpl $a976
$1b:a96e  71 20		 adc ($20),y
$1b:a970  e0 d0 8a	  cpx #$8ad0
$1b:a973  e1 40		 sbc ($40,x)
$1b:a975  1b			tcs
$1b:a976  80 77		 bra $a9ef
$1b:a978  0a			asl a
$1b:a979  ec 08 b0	  cpx $b008
$1b:a97c  30 62		 bmi $a9e0
$1b:a97e  e0 96 00	  cpx #$0096
$1b:a981  c3 60		 cmp $60,s
$1b:a983  60			rts
$1b:a984  38			sec
$1b:a985  24 24		 bit $24
$1b:a987  fc 34 27	  jsr ($2734,x)
$1b:a98a  88			dey
$1b:a98b  40			rti
$1b:a98c  4e e2 57	  lsr $57e2
$1b:a98f  02 c0		 cop #$c0
$1b:a991  21 49		 and ($49,x)
$1b:a993  ec 51 e1	  cpx $e151
$1b:a996  d3 96		 cmp ($96,s),y
$1b:a998  04 e0		 tsb $e0
$1b:a99a  18			clc
$1b:a99b  c3 61		 cmp $61,s
$1b:a99d  43 21		 eor $21,s
$1b:a99f  53 d6		 eor ($d6,s),y
$1b:a9a1  01 43		 ora ($43,x)
$1b:a9a3  a0 11 c4	  ldy #$c411
$1b:a9a6  09 ba c1	  ora #$c1ba
$1b:a9a9  10 6b		 bpl $aa16
$1b:a9ab  7a			ply
$1b:a9ac  2c 04 3b	  bit $3b04
$1b:a9af  14 42		 trb $42
$1b:a9b1  16 52		 asl $52,x
$1b:a9b3  2b			pld
$1b:a9b4  45 b4		 eor $b4
$1b:a9b6  4e d1 69	  lsr $69d1
$1b:a9b9  8a			txa
$1b:a9ba  cf dd c3 40   cmp $40c3dd
$1b:a9be  64 43		 stz $43
$1b:a9c0  65 00		 adc $00
$1b:a9c2  5e bf 5e	  lsr $5ebf,x
$1b:a9c5  73 1e		 adc ($1e,s),y
$1b:a9c7  44 df ff	  mvp $ff,$df
$1b:a9ca  ff b9 49 32   sbc $3249b9,x
$1b:a9ce  0c 12 86	  tsb $8612
$1b:a9d1  86 8e		 stx $8e
$1b:a9d3  1b			tcs
$1b:a9d4  08			php
$1b:a9d5  9e 30 0a	  stz $0a30,x
$1b:a9d8  1b			tcs
$1b:a9d9  00 95		 brk #$95
$1b:a9db  0c 06 41	  tsb $4106
$1b:a9de  00 8d		 brk #$8d
$1b:a9e0  c0 3f 9f	  cpy #$9f3f
$1b:a9e3  f4 00 39	  pea $3900
$1b:a9e6  c2 14		 rep #$14
$1b:a9e8  d7 08		 cmp [$08],y
$1b:a9ea  c2 94		 rep #$94
$1b:a9ec  20 fa 57	  jsr $57fa
$1b:a9ef  48			pha
$1b:a9f0  44 21 08	  mvp $08,$21
$1b:a9f3  f0 d2		 beq $a9c7
$1b:a9f5  3a			dec a
$1b:a9f6  42 11		 wdm #$11
$1b:a9f8  10 87		 bpl $a981
$1b:a9fa  c0 35 09	  cpy #$0935
$1b:a9fd  22 4e 86 a5   jsl $a5864e
$1b:aa01  d2 08		 cmp ($08)
$1b:aa03  d0 4e		 bne $aa53
$1b:aa05  86 a9		 stx $a9
$1b:aa07  d2 08		 cmp ($08)
$1b:aa09  c0 4e 86	  cpy #$864e
$1b:aa0c  ad d2 31	  lda $31d2
$1b:aa0f  75 50		 adc $50,x
$1b:aa11  4e 53 24	  lsr $2453
$1b:aa14  aa			tax
$1b:aa15  0d 3a 64	  ora $643a
$1b:aa18  91 e1		 sta ($e1),y
$1b:aa1a  b7 57		 lda [$57],y
$1b:aa1c  12 3c		 ora ($3c)
$1b:aa1e  36 d0		 rol $d0,x
$1b:aa20  4f f2 14 62   eor $6214f2
$1b:aa24  88			dey
$1b:aa25  35 84		 and $84,x
$1b:aa27  0a			asl a
$1b:aa28  c5 2a		 cmp $2a
$1b:aa2a  0a			asl a
$1b:aa2b  52 8b		 eor ($8b)
$1b:aa2d  37 45		 and [$45],y
$1b:aa2f  5a			phy
$1b:aa30  4e 81 94	  lsr $9481
$1b:aa33  3b			tsc
$1b:aa34  49 bc 13	  eor #$13bc
$1b:aa37  84 c8		 sty $c8
$1b:aa39  95 c2		 sta $c2,x
$1b:aa3b  11 29		 ora ($29),y
$1b:aa3d  1e 83 84	  asl $8483,x
$1b:aa40  20 29 72	  jsr $7229
$1b:aa43  74 00		 stz $00,x
$1b:aa45  18			clc
$1b:aa46  12 23		 ora ($23)
$1b:aa48  06 4a		 asl $4a
$1b:aa4a  02 78		 cop #$78
$1b:aa4c  5a			phy
$1b:aa4d  5a			phy
$1b:aa4e  ef f0 07 84   sbc $8407f0
$1b:aa52  4f b0 e6 77   eor $77e6b0
$1b:aa56  0a			asl a
$1b:aa57  a1 c5		 lda ($c5,x)
$1b:aa59  1a			inc a
$1b:aa5a  05 e2		 ora $e2
$1b:aa5c  5f 81 f4 20   eor $20f481,x
$1b:aa60  22 51 84 57   jsl $578451
$1b:aa64  a0 86 c1	  ldy #$c186
$1b:aa67  6f 05 ba 08   adc $08ba05
$1b:aa6b  03 06		 ora $06,s
$1b:aa6d  00 12		 brk #$12
$1b:aa6f  80 3b		 bra $aaac
$1b:aa71  cf 37 9c ce   cmp $ce9c37
$1b:aa75  bb			tyx
$1b:aa76  d1 f0		 cmp ($f0),y
$1b:aa78  af 5f 03 78   lda $78035f
$1b:aa7c  5c ed b6 db   jml $dbb6ed
$1b:aa80  60			rts
$1b:aa81  3c ad 96	  bit $96ad,x
$1b:aa84  d0 a8		 bne $aa2e
$1b:aa86  8c c2 db	  sty $dbc2
$1b:aa89  68			pla
$1b:aa8a  80 8f		 bra $aa1b
$1b:aa8c  00 1e		 brk #$1e
$1b:aa8e  23 b1		 and $b1,s
$1b:aa90  98			tya
$1b:aa91  f3 26		 sbc ($26,s),y
$1b:aa93  43 c1		 eor $c1,s
$1b:aa95  24 10		 bit $10
$1b:aa97  3c 6d 56	  bit $566d,x
$1b:aa9a  e1 e0		 sbc ($e0,x)
$1b:aa9c  e9 c9 07	  sbc #$07c9
$1b:aa9f  6f 1f 14 74   adc $74141f
$1b:aaa3  78			sei
$1b:aaa4  10 81		 bpl $aa27
$1b:aaa6  e0 60 70	  cpx #$7060
$1b:aaa9  18			clc
$1b:aaaa  13 50		 ora ($50,s),y
$1b:aaac  60			rts
$1b:aaad  30 04		 bmi $aab3
$1b:aaaf  f2 24		 sbc ($24)
$1b:aab1  16 22		 asl $22,x
$1b:aab3  fe 78 43	  inc $4378,x
$1b:aab6  79 e9 a0	  adc $a0e9,y
$1b:aab9  38			sec
$1b:aaba  63 c2		 adc $c2,s
$1b:aabc  9f 90 78 18   sta $187890,x
$1b:aac0  74 3c		 stz $3c,x
$1b:aac2  c5 ce		 cmp $ce
$1b:aac4  92 7e		 sta ($7e)
$1b:aac6  2a			rol a
$1b:aac7  e9 c8 10	  sbc #$10c8
$1b:aaca  ce 7e 2b	  dec $2b7e
$1b:aacd  29 88 16	  and #$1688
$1b:aad0  b7 5d		 lda [$5d],y
$1b:aad2  51 0e		 eor ($0e),y
$1b:aad4  31 6f		 and ($6f),y
$1b:aad6  54 05 10	  mvn $10,$05
$1b:aad9  21 97		 and ($97,x)
$1b:aadb  1f 83 0c 5b   ora $5b0c83,x
$1b:aadf  ef c1 9f 00   sbc $009fc1
$1b:aae3  b6 8c		 ldx $8c,y
$1b:aae5  c0 1d 65	  cpy #$651d
$1b:aae8  41 b4		 eor ($b4,x)
$1b:aaea  83 a8		 sta $a8,s
$1b:aaec  a6 43		 ldx $43
$1b:aaee  2a			rol a
$1b:aaef  39 95 ac	  and $ac95,y
$1b:aaf2  89 e0 e8	  bit #$e8e0
$1b:aaf5  c5 93		 cmp $93
$1b:aaf7  c8			iny
$1b:aaf8  65 37		 adc $37
$1b:aafa  f3 79		 sbc ($79,s),y
$1b:aafc  14 e5		 trb $e5
$1b:aafe  b0 18		 bcs $ab18
$1b:ab00  5b			tcd
$1b:ab01  79 4a 03	  adc $034a,y
$1b:ab04  e0 d8 0c	  cpx #$0cd8
$1b:ab07  22 04 22 a0   jsl $a02204
$1b:ab0b  e5 b4		 sbc $b4
$1b:ab0d  20 41 3e	  jsr $3e41
$1b:ab10  65 35		 adc $35
$1b:ab12  56 04		 lsr $04,x
$1b:ab14  21 5c		 and ($5c,x)
$1b:ab16  38			sec
$1b:ab17  55 e0		 eor $e0,x
$1b:ab19  29 16 d4	  and #$d416
$1b:ab1c  81 17		 sta ($17,x)
$1b:ab1e  60			rts
$1b:ab1f  20 46 2c	  jsr $2c46
$1b:ab22  0e 48 ea	  asl $ea48
$1b:ab25  48			pha
$1b:ab26  31 18		 and ($18),y
$1b:ab28  34 09		 bit $09,x
$1b:ab2a  50 43		 bvc $ab6f
$1b:ab2c  c9 17 b7	  cmp #$b717
$1b:ab2f  61 ef		 adc ($ef,x)
$1b:ab31  e0 ef 7f	  cpx #$7fef
$1b:ab34  f8			sed
$1b:ab35  43 c4		 eor $c4,s
$1b:ab37  3e 32 f2	  rol $f232,x
$1b:ab3a  1f 95 3c c7   ora $c73c95,x
$1b:ab3e  96 d4		 stx $d4,y
$1b:ab40  e8			inx
$1b:ab41  18			clc
$1b:ab42  e9 58 30	  sbc #$3058
$1b:ab45  1b			tcs
$1b:ab46  4b			phk
$1b:ab47  9c 98 c2	  stz $c298
$1b:ab4a  e7 0b		 sbc [$0b]
$1b:ab4c  62 0c ad	  per $585b
$1b:ab4f  c8			iny
$1b:ab50  42 63		 wdm #$63
$1b:ab52  13 44		 ora ($44,s),y
$1b:ab54  74 ed		 stz $ed,x
$1b:ab56  11 51		 ora ($51),y
$1b:ab58  95 ad		 sta $ad,x
$1b:ab5a  36 89		 rol $89,x
$1b:ab5c  61 c0		 adc ($c0,x)
$1b:ab5e  e0 60 30	  cpx #$3060
$1b:ab61  16 e0		 asl $e0,x
$1b:ab63  45 4f		 eor $4f
$1b:ab65  c4 b4		 cpy $b4
$1b:ab67  0c 0e 03	  tsb $030e
$1b:ab6a  11 7f		 ora ($7f),y
$1b:ab6c  bf e2 d6 c0   lda $c0d6e2,x
$1b:ab70  a9 46 20	  lda #$2046
$1b:ab73  33 d3		 and ($d3,s),y
$1b:ab75  0a			asl a
$1b:ab76  b6 08		 ldx $08,y
$1b:ab78  b3 2f		 lda ($2f,s),y
$1b:ab7a  22 b4 63 1a   jsl $1a63b4
$1b:ab7e  d7 69		 cmp [$69],y
$1b:ab80  11 1b		 ora ($1b),y
$1b:ab82  56 1f		 lsr $1f,x
$1b:ab84  79 bc c7	  adc $c7bc,y
$1b:ab87  e0 f0 58	  cpx #$58f0
$1b:ab8a  35 b0		 and $b0,x
$1b:ab8c  1f 86 cb 40   ora $40cb86,x
$1b:ab90  9f 2e 42 e9   sta $e9422e,x
$1b:ab94  75 8e		 adc $8e,x
$1b:ab96  ad 83 4c	  lda $4c83
$1b:ab99  fd 37 90	  sbc $9037,x
$1b:ab9c  5a			phy
$1b:ab9d  b4 e0		 ldy $e0,x
$1b:ab9f  64 80		 stz $80
$1b:aba1  c5 22		 cmp $22
$1b:aba3  6f f3 04 80   adc $8004f3
$1b:aba7  18			clc
$1b:aba8  81 81		 sta ($81,x)
$1b:abaa  ac cf 73	  ldy $73cf
$1b:abad  dd e7 17	  cmp $17e7,x
$1b:abb0  89 eb 2e	  bit #$2eeb
$1b:abb3  57 3d		 eor [$3d],y
$1b:abb5  6c 52 2d	  jmp ($2d52)
$1b:abb8  1b			tcs
$1b:abb9  16 98		 asl $98,x
$1b:abbb  08			php
$1b:abbc  22 31 b8 e5   jsl $e5b831
$1b:abc0  c2 e2		 rep #$e2
$1b:abc2  45 08		 eor $08
$1b:abc4  94 40		 sty $40,x
$1b:abc6  5a			phy
$1b:abc7  b1 98		 lda ($98),y
$1b:abc9  84 60		 sty $60
$1b:abcb  8e 05 50	  stx $5005
$1b:abce  8d 46 07	  sta $0746
$1b:abd1  ad 18 88	  lda $8818
$1b:abd4  11 c0		 ora ($c0),y
$1b:abd6  ca			dex
$1b:abd7  04 bf		 tsb $bf
$1b:abd9  2e 79 b7	  rol $b779
$1b:abdc  cf d7 25 90   cmp $9025d7
$1b:abe0  ca			dex
$1b:abe1  a5 4e		 lda $4e
$1b:abe3  f3 a4		 sbc ($a4,s),y
$1b:abe5  6a			ror a
$1b:abe6  6f 37 8b c5   adc $c58b37
$1b:abea  ea			nop
$1b:abeb  41 01		 eor ($01,x)
$1b:abed  d3 5b		 cmp ($5b,s),y
$1b:abef  e0 2f f3	  cpx #$f32f
$1b:abf2  a0 45 ef	  ldy #$ef45
$1b:abf5  77 6b		 adc [$6b],y
$1b:abf7  bd f2 02	  lda $02f2,x
$1b:abfa  ca			dex
$1b:abfb  25 7a		 and $7a
$1b:abfd  46 75		 lsr $75
$1b:abff  c1 74		 cmp ($74,x)
$1b:ac01  06 02		 asl $02
$1b:ac03  fd 27 c1	  sbc $c127,x
$1b:ac06  65 65		 adc $65
$1b:ac08  10 30		 bpl $ac3a
$1b:ac0a  2d 74 9b	  and $9b74
$1b:ac0d  43 28		 eor $28,s
$1b:ac0f  6d 30 0a	  adc $0a30
$1b:ac12  2d ab 0f	  and $0fab
$1b:ac15  7f 65 14 56   adc $561465,x
$1b:ac19  83 54		 sta $54,s
$1b:ac1b  80 ff		 bra $ac1c
$1b:ac1d  6d d6 b8	  adc $b8d6
$1b:ac20  05 36		 ora $36
$1b:ac22  d5 86		 cmp $86,x
$1b:ac24  bf e9 b4 ef   lda $efb4e9,x
$1b:ac28  70 8b		 bvs $abb5
$1b:ac2a  52 6a		 eor ($6a)
$1b:ac2c  96 e0		 stx $e0,y
$1b:ac2e  08			php
$1b:ac2f  be 82 3b	  ldx $3b82,y
$1b:ac32  6e c6 6b	  ror $6bc6
$1b:ac35  40			rti
$1b:ac36  24 04		 bit $04
$1b:ac38  10 b0		 bpl $abea
$1b:ac3a  02 4a		 cop #$4a
$1b:ac3c  03 cd		 ora $cd,s
$1b:ac3e  8e 45 e2	  stx $e245
$1b:ac41  61 30		 adc ($30,x)
$1b:ac43  0a			asl a
$1b:ac44  04 21		 tsb $21
$1b:ac46  ec 55 d8	  cpx $d855
$1b:ac49  be b3 3d	  ldx $3db3,y
$1b:ac4c  18			clc
$1b:ac4d  88			dey
$1b:ac4e  c6 e2		 dec $e2
$1b:ac50  54 19 e3	  mvn $e3,$19
$1b:ac53  28			plp
$1b:ac54  e8			inx
$1b:ac55  f4 88 8c	  pea $8c88
$1b:ac58  73 3d		 adc ($3d,s),y
$1b:ac5a  10 4a		 bpl $aca6
$1b:ac5c  04 68		 tsb $68
$1b:ac5e  28			plp
$1b:ac5f  0f 70 5e 81   ora $815e70
$1b:ac63  24 28		 bit $28
$1b:ac65  11 93		 ora ($93),y
$1b:ac67  e0 0f c2	  cpx #$c20f
$1b:ac6a  30 42		 bmi $acae
$1b:ac6c  00 28		 brk #$28
$1b:ac6e  04 05		 tsb $05
$1b:ac70  ee 13 b8	  inc $b813
$1b:ac73  8a			txa
$1b:ac74  30 09		 bmi $ac7f
$1b:ac76  ec dc 18	  cpx $18dc
$1b:ac79  45 1c		 eor $1c
$1b:ac7b  b8			clv
$1b:ac7c  a4 44		 ldy $44
$1b:ac7e  24 09		 bit $09
$1b:ac80  b1 4e		 lda ($4e),y
$1b:ac82  84 ca		 sty $ca
$1b:ac84  1b			tcs
$1b:ac85  71 ec		 adc ($ec),y
$1b:ac87  a4 72		 ldy $72
$1b:ac89  48			pha
$1b:ac8a  c4 95		 cpy $95
$1b:ac8c  da			phx
$1b:ac8d  8c a1 92	  sty $92a1
$1b:ac90  44 33 cf	  mvp $cf,$33
$1b:ac93  70 90		 bvs $ac25
$1b:ac95  b2 84		 lda ($84)
$1b:ac97  6c 4c a2	  jmp ($a24c)
$1b:ac9a  90 4a		 bcc $ace6
$1b:ac9c  9d 4a ec	  sta $ec4a,x
$1b:ac9f  13 31		 ora ($31,s),y
$1b:aca1  89 80 ae	  bit #$ae80
$1b:aca4  2d 19 2b	  and $2b19
$1b:aca7  8a			txa
$1b:aca8  9c db 26	  stz $26db
$1b:acab  a7 2b		 lda [$2b]
$1b:acad  fb			xce
$1b:acae  bd 70 96	  lda $9670,x
$1b:acb1  e8			inx
$1b:acb2  ad 3a 00	  lda $003a
$1b:acb5  fb			xce
$1b:acb6  17 7b		 ora [$7b],y
$1b:acb8  61 49		 adc ($49,x)
$1b:acba  01 5f		 ora ($5f,x)
$1b:acbc  7d ce 3c	  adc $3cce,x
$1b:acbf  ec 36 b7	  cpx $b736
$1b:acc2  d9 73 b0	  cmp $b073,y
$1b:acc5  58			cli
$1b:acc6  cd e6 f3	  cmp $f3e6
$1b:acc9  1f 83 6c 94   ora $946c83,x
$1b:accd  55 f6		 eor $f6,x
$1b:accf  5c f8 ec 56   jml $56ecf8
$1b:acd3  e9 75 8e	  sbc #$8e75
$1b:acd6  ff 61 16 e2   sbc $e21661,x
$1b:acda  c0 06 8f	  cpy #$8f06
$1b:acdd  9f 17 18 94   sta $941817,x
$1b:ace1  06 26		 asl $26
$1b:ace3  dc 11 52	  jml [$5211]
$1b:ace6  44 75 f7	  mvp $f7,$75
$1b:ace9  2b			pld
$1b:acea  9e b6 2d	  stz $2db6,x
$1b:aced  1b			tcs
$1b:acee  8b			phb
$1b:acef  c4 e2		 cpy $e2
$1b:acf1  91 61		 sta ($61),y
$1b:acf3  59 c6 62	  eor $62c6,y
$1b:acf6  37 0b		 and [$0b],y
$1b:acf8  8c 6e 25	  sty $256e
$1b:acfb  10 88		 bpl $ac85
$1b:acfd  e7 b3		 sbc [$b3]
$1b:acff  d5 e2		 cmp $e2,x
$1b:ad01  5a			phy
$1b:ad02  46 4c		 lsr $4c
$1b:ad04  40			rti
$1b:ad05  91 08		 sta ($08),y
$1b:ad07  c4 64		 cpy $64
$1b:ad09  d0 16		 bne $ad21
$1b:ad0b  62 db c6	  per $73e9
$1b:ad0e  0c a7 12	  tsb $12a7
$1b:ad11  b4 9b		 ldy $9b,x
$1b:ad13  32 35		 and ($35)
$1b:ad15  54 45 89	  mvn $89,$45
$1b:ad18  fe aa 82	  inc $82aa,x
$1b:ad1b  a1 95		 lda ($95,x)
$1b:ad1d  49 12 32	  eor #$3212
$1b:ad20  1a			inc a
$1b:ad21  10 b8		 bpl $acdb
$1b:ad23  49 10 43	  eor #$4310
$1b:ad26  25 91		 and $91
$1b:ad28  c9 13 01	  cmp #$0113
$1b:ad2b  25 b7		 and $b7
$1b:ad2d  af 0e f3 78   lda $78f30e
$1b:ad31  bc 5e 82	  ldy $825e,x
$1b:ad34  e1 d7		 sbc ($d7,x)
$1b:ad36  4c 05 51	  jmp $5105
$1b:ad39  f0 0b		 beq $ad46
$1b:ad3b  d1 d3		 cmp ($d3),y
$1b:ad3d  de ee d7	  dec $d7ee,x
$1b:ad40  7b			tdc
$1b:ad41  e6 9c		 inc $9c
$1b:ad43  2e 12 a9	  rol $a912
$1b:ad46  50 5c		 bvc $ada4
$1b:ad48  0b			phd
$1b:ad49  47 00		 eor [$00]
$1b:ad4b  ae d2 29	  ldx $29d2
$1b:ad4e  16 a2		 asl $a2,x
$1b:ad50  09 be 88	  ora #$88be
$1b:ad53  58			cli
$1b:ad54  36 5a		 rol $5a,x
$1b:ad56  05 00		 ora $00
$1b:ad58  60			rts
$1b:ad59  76 f6		 ror $f6,x
$1b:ad5b  78			sei
$1b:ad5c  60			rts
$1b:ad5d  70 0e		 bvs $ad6d
$1b:ad5f  f9 1b 06	  sbc $061b,y
$1b:ad62  2a			rol a
$1b:ad63  ff 7f 7f a5   sbc $a57f7f,x
$1b:ad67  ab			plb
$1b:ad68  11 bd		 ora ($bd),y
$1b:ad6a  de e2 70	  dec $70e2,x
$1b:ad6d  18			clc
$1b:ad6e  80 e8		 bra $ad58
$1b:ad70  07 89		 ora [$89]
$1b:ad72  e4 13		 cpx $13
$1b:ad74  ec 38 b0	  cpx $b038
$1b:ad77  46 c8		 lsr $c8
$1b:ad79  ff 38 ee 18   sbc $18ee38,x
$1b:ad7d  6d 4f 20	  adc $204f
$1b:ad80  b5 0d		 lda $0d,x
$1b:ad82  7a			ply
$1b:ad83  03 8e		 ora $8e,s
$1b:ad85  23 dc		 and $dc,s
$1b:ad87  5d 9e 18	  eor $189e,x
$1b:ad8a  c1 c5		 cmp ($c5,x)
$1b:ad8c  01 01		 ora ($01,x)
$1b:ad8e  ca			dex
$1b:ad8f  18			clc
$1b:ad90  3c 16 0c	  bit $0c16,x
$1b:ad93  cc 4e f5	  cpy $f54e
$1b:ad96  67 83		 adc [$83]
$1b:ad98  3c 2d c7	  bit $c72d,x
$1b:ad9b  62 0f aa	  per $57ad
$1b:ad9e  64 52		 stz $52
$1b:ada0  c5 83		 cmp $83
$1b:ada2  c1 bb		 cmp ($bb,x)
$1b:ada4  d2 2f		 cmp ($2f)
$1b:ada6  13 8a		 ora ($8a,s),y
$1b:ada8  44 e0 20	  mvp $20,$e0
$1b:adab  a1 67		 lda ($67,x)
$1b:adad  80 7d		 bra $ae2c
$1b:adaf  22 31 b8 e4   jsl $e4b831
$1b:adb3  6e 2f 08	  ror $082f
$1b:adb6  4b			phk
$1b:adb7  0e 99 de	  asl $de99
$1b:adba  91 98		 sta ($98),y
$1b:adbc  84 62		 sty $62
$1b:adbe  21 40		 and ($40,x)
$1b:adc0  5a			phy
$1b:adc1  94 51		 sty $51,x
$1b:adc3  7e ad 70	  ror $70ad,x
$1b:adc6  8c 35 01	  sty $0135
$1b:adc9  8c 31 cd	  sty $cd31
$1b:adcc  32 a0		 and ($a0)
$1b:adce  de 09 80	  dec $8009,x
$1b:add1  c0 e0 70	  cpy #$70e0
$1b:add4  0f b0 7d 83   ora $837db0
$1b:add8  30 40		 bmi $ae1a
$1b:adda  83 01		 sta $01,s
$1b:addc  15 90		 ora $90,x
$1b:adde  d8			cld
$1b:addf  f1 6b		 sbc ($6b),y
$1b:ade1  91 7e		 sta ($7e),y
$1b:ade3  86 28		 stx $28
$1b:ade5  6c e1 20	  jmp ($20e1)
$1b:ade8  0c 50 c3	  tsb $c350
$1b:adeb  c3 6d		 cmp $6d,s
$1b:aded  8d c7 63	  sta $63c7
$1b:adf0  ce ec 6c	  dec $6cec
$1b:adf3  1c 7e 0d	  trb $0d7e
$1b:adf6  2c 38 62	  bit $6238
$1b:adf9  a8			tay
$1b:adfa  97 93		 sta [$93],y
$1b:adfc  1a			inc a
$1b:adfd  cd 0f eb	  cmp $eb0f
$1b:ae00  bc 01 4f	  ldy $4f01,x
$1b:ae03  7f c4 be 08   adc $08bec4,x
$1b:ae07  4d 42 4f	  eor $4f42
$1b:ae0a  3e a6 0b	  rol $0ba6,x
$1b:ae0d  19 bc de	  ora $debc,y
$1b:ae10  16 03		 asl $03,x
$1b:ae12  06 9f		 asl $9f
$1b:ae14  03 ea		 ora $ea,s
$1b:ae16  c0 62 b7	  cpy #$b762
$1b:ae19  4b			phk
$1b:ae1a  ac 76 03	  ldy $0376
$1b:ae1d  fd b7 40	  sbc $40b7,x
$1b:ae20  53 eb		 eor ($eb,s),y
$1b:ae22  a7 58		 lda [$58]
$1b:ae24  16 9c		 asl $9c,x
$1b:ae26  f0 11		 beq $ae39
$1b:ae28  4d 32 c0	  eor $c032
$1b:ae2b  96 c1		 stx $c1,y
$1b:ae2d  13 d6		 ora ($d6,s),y
$1b:ae2f  5c ae 7a d8   jml $d87aae
$1b:ae33  a4 4e		 ldy $4e
$1b:ae35  2d 1c 8b	  and $8b1c
$1b:ae38  b4 08		 ldy $08,x
$1b:ae3a  f0 11		 beq $ae4d
$1b:ae3c  b8			clv
$1b:ae3d  e5 c2		 sbc $c2
$1b:ae3f  e2 df		 sep #$df
$1b:ae41  08			php
$1b:ae42  dc 4a 31	  jml [$314a]
$1b:ae45  11 70		 ora ($70),y
$1b:ae47  14 5c		 trb $5c
$1b:ae49  2c 0c 83	  bit $830c
$1b:ae4c  3c 09 e0	  bit $e009,x
$1b:ae4f  17 e1		 ora [$e1],y
$1b:ae51  5e 80 40	  lsr $4080,x
$1b:ae54  02 41		 cop #$41
$1b:ae56  aa			tax
$1b:ae57  58			cli
$1b:ae58  86 ad		 stx $ad
$1b:ae5a  6c 0f 52	  jmp ($520f)
$1b:ae5d  8a			txa
$1b:ae5e  d9 9f a2	  cmp $a29f,y
$1b:ae61  56 0d		 lsr $0d,x
$1b:ae63  ee f4 ec	  inc $ecf4
$1b:ae66  40			rti
$1b:ae67  52 af		 eor ($af)
$1b:ae69  83 4d		 sta $4d,s
$1b:ae6b  08			php
$1b:ae6c  78			sei
$1b:ae6d  10 39		 bpl $aea8
$1b:ae6f  87 5d		 sta [$5d]
$1b:ae71  0c 27 81	  tsb $8127
$1b:ae74  b5 8b		 lda $8b,x
$1b:ae76  66 ff		 ror $ff
$1b:ae78  85 0b		 sta $0b
$1b:ae7a  80 f3		 bra $ae6f
$1b:ae7c  45 76		 eor $76
$1b:ae7e  58			cli
$1b:ae7f  21 e5		 and ($e5,x)
$1b:ae81  63 40		 adc $40,s
$1b:ae83  e2 2c		 sep #$2c
$1b:ae85  a2 48		 ldx #$48
$1b:ae87  31 00		 and ($00),y
$1b:ae89  79 38 f0	  adc $f038,y
$1b:ae8c  29 0b		 and #$0b
$1b:ae8e  05 78		 ora $78
$1b:ae90  38			sec
$1b:ae91  e4 a1		 cpx $a1
$1b:ae93  01 c9		 ora ($c9,x)
$1b:ae95  aa			tax
$1b:ae96  0f d0 03 92   ora $9203d0
$1b:ae9a  80 30		 bra $aecc
$1b:ae9c  60			rts
$1b:ae9d  72 8b		 adc ($8b)
$1b:ae9f  46 df		 lsr $df
$1b:aea1  83 01		 sta $01,s
$1b:aea3  b7 81		 lda [$81],y
$1b:aea5  c8			iny
$1b:aea6  0e 2f 00	  asl $002f
$1b:aea9  a0 c4		 ldy #$c4
$1b:aeab  01 83		 ora ($83,x)
$1b:aead  01 fe		 ora ($fe,x)
$1b:aeaf  81 c9		 sta ($c9,x)
$1b:aeb1  14 0b		 trb $0b
$1b:aeb3  81 a4		 sta ($a4,x)
$1b:aeb5  c6 17		 dec $17
$1b:aeb7  84 d4		 sty $d4
$1b:aeb9  38			sec
$1b:aeba  a4 4e		 ldy $4e
$1b:aebc  29 16		 and #$16
$1b:aebe  a0 b2		 ldy #$b2
$1b:aec0  8d da 35	  sta $35da
$1b:aec3  da			phx
$1b:aec4  45 22		 eor $22
$1b:aec6  33 10		 and ($10,s),y
$1b:aec8  8c 44 28	  sty $2844
$1b:aecb  11 17		 ora ($17),y
$1b:aecd  b0 c6		 bcs $ae95
$1b:aecf  1d a3 65	  ora $65a3,x
$1b:aed2  a0 3e		 ldy #$3e
$1b:aed4  41 f8		 eor ($f8,x)
$1b:aed6  2f 40 7e 0c   and $0c7e40
$1b:aeda  41 df		 eor ($df,x)
$1b:aedc  e0 0f		 cpx #$0f
$1b:aede  08			php
$1b:aedf  f8			sed
$1b:aee0  8b			phb
$1b:aee1  c6 7e		 dec $7e
$1b:aee3  44 f2 af	  mvp $af,$f2
$1b:aee6  99 bc ef	  sta $efbc,y
$1b:aee9  e8			inx
$1b:aeea  8f 4c fa ab   sta $abfa4c
$1b:aeee  d7 7e		 cmp [$7e],y
$1b:aef0  d6 16		 dec $16,x
$1b:aef2  b0 5c		 bcs $af50
$1b:aef4  2e 2d 61	  rol $612d
$1b:aef7  8d 44 19	  sta $1944
$1b:aefa  40			rti
$1b:aefb  f1 1a		 sbc ($1a),y
$1b:aefd  04 5d		 tsb $5d
$1b:aeff  ae 0f 10	  ldx $100f
$1b:af02  6e 0c 4a	  ror $4a0c
$1b:af05  30 da		 bmi $aee1
$1b:af07  00 08		 brk #$08
$1b:af09  d2 1b		 cmp ($1b)
$1b:af0b  42 f1		 wdm #$f1
$1b:af0d  b6 50		 ldx $50,y
$1b:af0f  80 7c		 bra $af8d
$1b:af11  25 ed		 and $ed
$1b:af13  c1 92		 cmp ($92,x)
$1b:af15  c8			iny
$1b:af16  a4 82		 ldy $82
$1b:af18  99 9d 6a	  sta $6a9d,y
$1b:af1b  20 25 60	  jsr $6025
$1b:af1e  bc de 2f	  ldy $2fde,x
$1b:af21  17 a9		 ora [$a9],y
$1b:af23  20 79 27	  jsr $2779
$1b:af26  14 0b		 trb $0b
$1b:af28  55 be		 eor $be,x
$1b:af2a  03 7b		 ora $7b,s
$1b:af2c  bb			tyx
$1b:af2d  5d ef 90	  eor $90ef,x
$1b:af30  12 40		 ora ($40)
$1b:af32  3c 0a 73	  bit $730a,x
$1b:af35  48			pha
$1b:af36  8e 95 82	  stx $8295
$1b:af39  2b			pld
$1b:af3a  74 ba		 stz $ba,x
$1b:af3c  c7 4c		 cmp [$4c]
$1b:af3e  e0 5f		 cpx #$5f
$1b:af40  68			pla
$1b:af41  0d b8 f2	  ora $f2b8
$1b:af44  45 60		 eor $60
$1b:af46  37 aa		 and [$aa],y
$1b:af48  18			clc
$1b:af49  0f 07 fd 3f   ora $3ffd07
$1b:af4d  46 9d		 lsr $9d
$1b:af4f  12 77		 ora ($77)
$1b:af51  d3 7b		 cmp ($7b,s),y
$1b:af53  5b			tcd
$1b:af54  a1 07		 lda ($07,x)
$1b:af56  92 b7		 sta ($b7)
$1b:af58  42 4b		 wdm #$4b
$1b:af5a  eb			xba
$1b:af5b  17 89		 ora [$89],y
$1b:af5d  c5 0f		 cmp $0f
$1b:af5f  25 7d		 and $7d
$1b:af61  c9 9b		 cmp #$9b
$1b:af63  d6 23		 dec $23,x
$1b:af65  1b			tcs
$1b:af66  8e 6b ee	  stx $ee6b
$1b:af69  57 38		 eor [$38],y
$1b:af6b  be 57 22	  ldx $2257,y
$1b:af6e  5f 58 cc 70   eor $70cc58,x
$1b:af72  4e 04 a0	  lsr $a004
$1b:af75  a0 64		 ldy #$64
$1b:af77  32 0c		 and ($0c)
$1b:af79  70 77		 bvs $aff2
$1b:af7b  8c 5a 38	  sty $385a
$1b:af7e  d7 08		 cmp [$08],y
$1b:af80  95 26		 sta $26,x
$1b:af82  93 18		 sta ($18,s),y
$1b:af84  af 40 20 0d   lda $0d2040
$1b:af88  70 7f		 bvs $b009
$1b:af8a  88			dey
$1b:af8b  98			tya
$1b:af8c  06 61		 asl $61
$1b:af8e  1a			inc a
$1b:af8f  a0 d0		 ldy #$d0
$1b:af91  62 16 67	  per $16aa
$1b:af94  e8			inx
$1b:af95  0c c4 68	  tsb $68c4
$1b:af98  43 40		 eor $40,s
$1b:af9a  7c 28 40	  jmp ($4028,x)
$1b:af9d  a3 00		 lda $00,s
$1b:af9f  4f 0a 9d 7c   eor $7c9d0a
$1b:afa3  37 93		 and [$93],y
$1b:afa5  cb			wai
$1b:afa6  75 7c		 adc $7c,x
$1b:afa8  19 52 53	  ora $5352,y
$1b:afab  b8			clv
$1b:afac  5a			phy
$1b:afad  e8			inx
$1b:afae  c1 d5		 cmp ($d5,x)
$1b:afb0  92 c8		 sta ($c8)
$1b:afb2  24 32		 bit $32
$1b:afb4  08			php
$1b:afb5  0e 98 b4	  asl $b498
$1b:afb8  14 e7		 trb $e7
$1b:afba  e8			inx
$1b:afbb  19 80 de	  ora $de80,y
$1b:afbe  29 70		 and #$70
$1b:afc0  4b			phk
$1b:afc1  84 21		 sty $21
$1b:afc3  2e 25 c1	  rol $c125
$1b:afc6  3a			dec a
$1b:afc7  0d b8 e8	  ora $e8b8
$1b:afca  47 42		 eor [$42]
$1b:afcc  8b			phb
$1b:afcd  1b			tcs
$1b:afce  07 4f		 ora [$4f]
$1b:afd0  7d 84 a4	  adc $a484,x
$1b:afd3  46 fc		 lsr $fc
$1b:afd5  69 0d		 adc #$0d
$1b:afd7  39 68 28	  and $2868,y
$1b:afda  34 67		 bit $67,x
$1b:afdc  e8			inx
$1b:afdd  24 49		 bit $49
$1b:afdf  22 65 91 a4   jsl $a49165
$1b:afe3  d3 9f		 cmp ($9f,s),y
$1b:afe5  a1 95		 lda ($95,x)
$1b:afe7  c9 e4		 cmp #$e4
$1b:afe9  f8			sed
$1b:afea  1c 1e 16	  trb $161e
$1b:afed  4f 29 09 3c   eor $3c0929
$1b:aff1  8a			txa
$1b:aff2  6c b2 2e	  jmp ($2eb2)
$1b:aff5  d0 e4		 bne $afdb
$1b:aff7  72 79		 adc ($79)
$1b:aff9  59 0c 8e	  eor $8e0c,y
$1b:affc  49 2a		 eor #$2a
$1b:affe  11 65		 ora ($65),y
$1b:b000  59 31 43	  eor $4331,y
$1b:b003  21 d0		 and ($d0,x)
$1b:b005  e8			inx
$1b:b006  f4 97 e1	  pea $e197
$1b:b009  91 ca		 sta ($ca),y
$1b:b00b  45 a8		 eor $a8
$1b:b00d  2b			pld
$1b:b00e  b4 5f		 ldy $5f,x
$1b:b010  87 0d		 sta [$0d]
$1b:b012  be 59 1a	  ldx $1a59,y
$1b:b015  0d 25 56	  ora $5625
$1b:b018  50 1c		 bvc $b036
$1b:b01a  16 0e		 asl $0e,x
$1b:b01c  03 ff		 ora $ff,s
$1b:b01e  80 5f		 bra $b07f
$1b:b020  ef f8 fc 73   sbc $73fcf8
$1b:b024  b5 10		 lda $10,x
$1b:b026  66 f4		 ror $f4
$1b:b028  0c 68 08	  tsb $0868
$1b:b02b  60			rts
$1b:b02c  11 48		 ora ($48),y
$1b:b02e  98			tya
$1b:b02f  2c 35 f6	  bit $f635
$1b:b032  a4 48		 ldy $48
$1b:b034  bd 03 0b	  lda $0b03,x
$1b:b037  6e 04 0c	  ror $0c04
$1b:b03a  72 37		 adc ($37)
$1b:b03c  10 8d		 bpl $afcb
$1b:b03e  d2 22		 cmp ($22)
$1b:b040  f1 36		 sbc ($36),y
$1b:b042  c8			iny
$1b:b043  05 06		 ora $06
$1b:b045  03 8a		 ora $8a,s
$1b:b047  2e a5 02	  rol $02a5
$1b:b04a  22 43 0a 4c   jsl $4c0a43
$1b:b04e  03 1f		 ora $1f,s
$1b:b050  a7 c3		 lda [$c3]
$1b:b052  df c9 a9 48   cmp $48a9c9,x
$1b:b056  8c 94 c0	  sty $c094
$1b:b059  46 07		 lsr $07
$1b:b05b  41 c6		 eor ($c6,x)
$1b:b05d  0a			asl a
$1b:b05e  6a			ror a
$1b:b05f  03 cd		 ora $cd,s
$1b:b061  8a			txa
$1b:b062  02 04		 cop #$04
$1b:b064  77 1a		 adc [$1a],y
$1b:b066  cc f7 3f	  cpy $3ff7
$1b:b069  5a			phy
$1b:b06a  29 a8		 and #$a8
$1b:b06c  e1 98		 sbc ($98,x)
$1b:b06e  23 63		 and $63,s
$1b:b070  94 92		 sty $92,x
$1b:b072  10 06		 bpl $b07a
$1b:b074  78			sei
$1b:b075  2a			rol a
$1b:b076  03 b0		 ora $b0,s
$1b:b078  44 01 21	  mvp $21,$01
$1b:b07b  20 90 c8	  jsr $c890
$1b:b07e  24 70		 bit $70
$1b:b080  19 24 62	  ora $6224,y
$1b:b083  4a			lsr a
$1b:b084  03 08		 ora $08,s
$1b:b086  81 d8		 sta ($d8,x)
$1b:b088  23 0f		 and $0f,s
$1b:b08a  91 7f		 sta ($7f),y
$1b:b08c  1c 86 03	  trb $0386
$1b:b08f  a7 42		 lda [$42]
$1b:b091  2a			rol a
$1b:b092  78			sei
$1b:b093  21 09		 and ($09,x)
$1b:b095  e0 fe		 cpx #$fe
$1b:b097  80 49		 bra $b0e2
$1b:b099  2a			rol a
$1b:b09a  ba			tsx
$1b:b09b  74 f0		 stz $f0,x
$1b:b09d  60			rts
$1b:b09e  70 38		 bvs $b0d8
$1b:b0a0  0c 0d b9	  tsb $b90d
$1b:b0a3  48			pha
$1b:b0a4  e0 72		 cpx #$72
$1b:b0a6  67 92		 adc [$92]
$1b:b0a8  56 19		 lsr $19,x
$1b:b0aa  e9 20		 sbc #$20
$1b:b0ac  95 4a		 sta $4a,x
$1b:b0ae  a4 29		 ldy $29
$1b:b0b0  92 d3		 sta ($d3)
$1b:b0b2  33 95		 and ($95,s),y
$1b:b0b4  e9 e0		 sbc #$e0
$1b:b0b6  5f 0b 78 9f   eor $9f780b,x
$1b:b0ba  c7 1e		 cmp [$1e]
$1b:b0bc  49 f2		 eor #$f2
$1b:b0be  d7 9a		 cmp [$9a],y
$1b:b0c0  fc f9 e8	  jsr ($e8f9,x)
$1b:b0c3  df 4f 7a bf   cmp $bf7a4f,x
$1b:b0c7  d8			cld
$1b:b0c8  1e d1 f7	  asl $f7d1,x
$1b:b0cb  17 bc		 ora [$bc],y
$1b:b0cd  fc 09 e1	  jsr ($e109,x)
$1b:b0d0  5f 13 78 df   eor $df7813,x
$1b:b0d4  c9 1e		 cmp #$1e
$1b:b0d6  59 f3 57	  eor $57f3,y
$1b:b0d9  9e fd 19	  stz $19fd,x
$1b:b0dc  e9 df		 sbc #$df
$1b:b0de  57 7a		 eor [$7a],y
$1b:b0e0  ff da 1e e1   sbc $e11eda,x
$1b:b0e4  f7 53		 sbc [$53],y
$1b:b0e6  40			rti
$1b:b0e7  60			rts
$1b:b0e8  31 48		 and ($48),y
$1b:b0ea  0b			phd
$1b:b0eb  aa			tax
$1b:b0ec  a2 f1		 ldx #$f1
$1b:b0ee  69 c4		 adc #$c4
$1b:b0f0  5d d5 51	  eor $51d5,x
$1b:b0f3  18			clc
$1b:b0f4  d4 e6		 pei ($e6)
$1b:b0f6  80 ea		 bra $b0e2
$1b:b0f8  f1 7f		 sbc ($7f),y
$1b:b0fa  90 3c		 bcc $b138
$1b:b0fc  a3 e6		 lda $e6,s
$1b:b0fe  2f 39 fa 13   and $13fa39
$1b:b102  d2 be		 cmp ($be)
$1b:b104  a6 f5		 ldx $f5
$1b:b106  bf b2 3d b3   lda $b33db2,x
$1b:b10a  ee af 7d	  inc $7daf
$1b:b10d  f8			sed
$1b:b10e  33 c3		 and ($c3,s),y
$1b:b110  be 2e f1	  ldx $f12e,y
$1b:b113  ff 94 3c c3   sbc $c33c94,x
$1b:b117  e7 2f		 sbc [$2f]
$1b:b119  41 fa		 eor ($fa,x)
$1b:b11b  53 d4		 eor ($d4,s),y
$1b:b11d  be b6 f6	  ldx $f6b6,y
$1b:b120  3f b6 3d d3   and $d33db6,x
$1b:b124  ef af 05 f8   sbc $f805af
$1b:b128  73 c5		 adc ($c5,s),y
$1b:b12a  be 3e f2	  ldx $f23e,y
$1b:b12d  7f 98 3c e3   adc $e33c98,x
$1b:b131  e8			inx
$1b:b132  2f 49 fa 93   and $93fa49
$1b:b136  d6 be		 dec $be,x
$1b:b138  c6 f6		 dec $f6
$1b:b13a  bf ba 10 1e   lda $1e10ba,x
$1b:b13e  00 4e		 brk #$4e
$1b:b140  2e 0d ff	  rol $ff0d
$1b:b143  e0 b8		 cpx #$b8
$1b:b145  03 00		 ora $00,s
$1b:b147  0e ff e0	  asl $e0ff
$1b:b14a  b8			clv
$1b:b14b  03 00		 ora $00,s
$1b:b14d  0f ff f1 b8   ora $b8f1ff
$1b:b151  07 00		 ora [$00]
$1b:b153  10 ff		 bpl $b154
$1b:b155  e0 b8		 cpx #$b8
$1b:b157  00 f0		 brk #$f0
$1b:b159  11 ff		 ora ($ff),y
$1b:b15b  e0 b8		 cpx #$b8
$1b:b15d  03 c0		 ora $c0,s
$1b:b15f  18			clc
$1b:b160  00 00		 brk #$00
$1b:b162  2f 32 65 7f   and $7f6532
$1b:b166  98			tya
$1b:b167  b2 cb		 lda ($cb)
$1b:b169  e5 fc		 sbc $fc
$1b:b16b  19 32 4c	  ora $4c32,y
$1b:b16e  65 72		 adc $72
$1b:b170  7f 8c 98 a5   adc $a5988c,x
$1b:b174  b2 bf		 lda ($bf)
$1b:b176  cb			wai
$1b:b177  d8			cld
$1b:b178  e5 f2		 sbc $f2
$1b:b17a  fc 67 06	  jsr ($0667,x)
$1b:b17d  00 10		 brk #$10
$1b:b17f  02 10		 cop #$10
$1b:b181  0a			asl a
$1b:b182  10 ff		 bpl $b183
$1b:b184  00 02		 brk #$02
$1b:b186  10 00		 bpl $b188
$1b:b188  00 1a		 brk #$1a
$1b:b18a  10 9f		 bpl $b12b
$1b:b18c  10 a7		 bpl $b135
$1b:b18e  11 d5		 ora ($d5),y
$1b:b190  11 22		 ora ($22),y
$1b:b192  13 28		 ora ($28,s),y
$1b:b194  14 0d		 trb $0d
$1b:b196  15 85		 ora $85,x
$1b:b198  15 fa		 ora $fa,x
$1b:b19a  05 ea		 ora $ea
$1b:b19c  00 e0		 brk #$e0
$1b:b19e  04 e7		 tsb $e7
$1b:b1a0  18			clc
$1b:b1a1  ed 6e e5	  sbc $e56e
$1b:b1a4  ff e1 0a f5   sbc $f50ae1,x
$1b:b1a8  80 7f		 bra $b229
$1b:b1aa  7f f7 03 aa   adc $aa03f7,x
$1b:b1ae  00 e3		 brk #$e3
$1b:b1b0  60			rts
$1b:b1b1  1e 20 60	  asl $6020,x
$1b:b1b4  7a			ply
$1b:b1b5  b2 60		 lda ($60)
$1b:b1b7  68			pla
$1b:b1b8  c8			iny
$1b:b1b9  60			rts
$1b:b1ba  7b			tdc
$1b:b1bb  ad 60 68	  lda $6860
$1b:b1be  c8			iny
$1b:b1bf  60			rts
$1b:b1c0  7a			ply
$1b:b1c1  b2 60		 lda ($60)
$1b:b1c3  68			pla
$1b:b1c4  c8			iny
$1b:b1c5  60			rts
$1b:b1c6  7b			tdc
$1b:b1c7  ad 30 6b	  lda $6b30
$1b:b1ca  c8			iny
$1b:b1cb  30 7b		 bmi $b248
$1b:b1cd  ab			plb
$1b:b1ce  60			rts
$1b:b1cf  a9 60		 lda #$60
$1b:b1d1  68			pla
$1b:b1d2  c8			iny
$1b:b1d3  c8			iny
$1b:b1d4  60			rts
$1b:b1d5  7b			tdc
$1b:b1d6  a7 a9		 lda [$a9]
$1b:b1d8  a6 60		 ldx $60
$1b:b1da  68			pla
$1b:b1db  c8			iny
$1b:b1dc  60			rts
$1b:b1dd  78			sei
$1b:b1de  c8			iny
$1b:b1df  ed 7d 60	  sbc $607d
$1b:b1e2  7d a7 30	  adc $30a7,x
$1b:b1e5  ae 18 ab	  ldx $ab18
$1b:b1e8  ae 60 a9	  ldx $a960
$1b:b1eb  b0 aa		 bcs $b197
$1b:b1ed  30 ac		 bmi $b19b
$1b:b1ef  b0 60		 bcs $b251
$1b:b1f1  5b			tcd
$1b:b1f2  b2 60		 lda ($60)
$1b:b1f4  68			pla
$1b:b1f5  c8			iny
$1b:b1f6  60			rts
$1b:b1f7  7d ac 30	  adc $30ac,x
$1b:b1fa  c8			iny
$1b:b1fb  18			clc
$1b:b1fc  b0 18		 bcs $b216
$1b:b1fe  7b			tdc
$1b:b1ff  b3 60		 lda ($60,s),y
$1b:b201  b2 30		 lda ($30)
$1b:b203  6d c8 18	  adc $18c8
$1b:b206  7d ae 18	  adc $18ae,x
$1b:b209  7b			tdc
$1b:b20a  ab			plb
$1b:b20b  60			rts
$1b:b20c  7d ac 30	  adc $30ac,x
$1b:b20f  6d c8 18	  adc $18c8
$1b:b212  7d b0 18	  adc $18b0,x
$1b:b215  7b			tdc
$1b:b216  b3 60		 lda ($60,s),y
$1b:b218  7a			ply
$1b:b219  b2 60		 lda ($60)
$1b:b21b  68			pla
$1b:b21c  c8			iny
$1b:b21d  00 ea		 brk #$ea
$1b:b21f  f4 e0 03	  pea $03e0
$1b:b222  ed b4 e1	  sbc $e1b4
$1b:b225  0a			asl a
$1b:b226  06 5f		 asl $5f
$1b:b228  af 12 5d bb   lda $bb5d12
$1b:b22c  48			pha
$1b:b22d  c9 06		 cmp #$06
$1b:b22f  5f ab 12 5d   eor $5d12ab,x
$1b:b233  b7 18		 lda [$18],y
$1b:b235  c9 06		 cmp #$06
$1b:b237  5f a8 12 5d   eor $5d12a8,x
$1b:b23b  b4 06		 ldy $06,x
$1b:b23d  5f ab 12 5d   eor $5d12ab,x
$1b:b241  b7 06		 lda [$06],y
$1b:b243  5f a6 12 5d   eor $5d12a6,x
$1b:b247  b2 48		 lda ($48)
$1b:b249  c9 06		 cmp #$06
$1b:b24b  5f ad 12 5d   eor $5d12ad,x
$1b:b24f  b9 48 c9	  lda $c948,y
$1b:b252  06 5f		 asl $5f
$1b:b254  af 12 5d bb   lda $bb5d12
$1b:b258  48			pha
$1b:b259  c9 06		 cmp #$06
$1b:b25b  5f ab 12 5d   eor $5d12ab,x
$1b:b25f  b7 18		 lda [$18],y
$1b:b261  c9 06		 cmp #$06
$1b:b263  5f a8 12 5d   eor $5d12a8,x
$1b:b267  b4 06		 ldy $06,x
$1b:b269  5f ab 12 5d   eor $5d12ab,x
$1b:b26d  b7 06		 lda [$06],y
$1b:b26f  5f a6 12 5d   eor $5d12a6,x
$1b:b273  b2 48		 lda ($48)
$1b:b275  c9 60		 cmp #$60
$1b:b277  c9 06		 cmp #$06
$1b:b279  5f ae 12 5d   eor $5d12ae,x
$1b:b27d  ba			tsx
$1b:b27e  48			pha
$1b:b27f  c9 06		 cmp #$06
$1b:b281  5f a9 12 5d   eor $5d12a9,x
$1b:b285  b5 18		 lda $18,x
$1b:b287  c9 06		 cmp #$06
$1b:b289  5f a6 12 5d   eor $5d12a6,x
$1b:b28d  b2 06		 lda ($06)
$1b:b28f  5f a9 12 5d   eor $5d12a9,x
$1b:b293  b5 06		 lda $06,x
$1b:b295  5f a4 12 5d   eor $5d12a4,x
$1b:b299  b0 48		 bcs $b2e3
$1b:b29b  c9 06		 cmp #$06
$1b:b29d  5f ab 12 5d   eor $5d12ab,x
$1b:b2a1  b7 48		 lda [$48],y
$1b:b2a3  c9 06		 cmp #$06
$1b:b2a5  5f a0 12 5d   eor $5d12a0,x
$1b:b2a9  ac 06 5f	  ldy $5f06
$1b:b2ac  a4 12		 ldy $12
$1b:b2ae  5d b0 06	  eor $06b0,x
$1b:b2b1  5f a6 12 5d   eor $5d12a6,x
$1b:b2b5  b2 06		 lda ($06)
$1b:b2b7  5f a9 12 5d   eor $5d12a9,x
$1b:b2bb  b5 06		 lda $06,x
$1b:b2bd  5f a6 12 5d   eor $5d12a6,x
$1b:b2c1  b2 06		 lda ($06)
$1b:b2c3  5f a9 12 5d   eor $5d12a9,x
$1b:b2c7  b5 06		 lda $06,x
$1b:b2c9  5f ac 12 5d   eor $5d12ac,x
$1b:b2cd  b8			clv
$1b:b2ce  06 5f		 asl $5f
$1b:b2d0  b0 12		 bcs $b2e4
$1b:b2d2  5d bc 06	  eor $06bc,x
$1b:b2d5  5f af 12 5d   eor $5d12af,x
$1b:b2d9  bb			tyx
$1b:b2da  48			pha
$1b:b2db  c9 06		 cmp #$06
$1b:b2dd  5f ab 12 5d   eor $5d12ab,x
$1b:b2e1  b7 48		 lda [$48],y
$1b:b2e3  c9 e3		 cmp #$e3
$1b:b2e5  0c 46 40	  tsb $4046
$1b:b2e8  ea			nop
$1b:b2e9  00 e0		 brk #$e0
$1b:b2eb  00 ed		 brk #$ed
$1b:b2ed  8c 60 c9	  sty $c960
$1b:b2f0  c9 48		 cmp #$48
$1b:b2f2  c9 0c		 cmp #$0c
$1b:b2f4  ab			plb
$1b:b2f5  a9 18		 lda #$18
$1b:b2f7  a9 ab		 lda #$ab
$1b:b2f9  30 c9		 bmi $b2c4
$1b:b2fb  60			rts
$1b:b2fc  c9 c9		 cmp #$c9
$1b:b2fe  48			pha
$1b:b2ff  c9 0c		 cmp #$0c
$1b:b301  ab			plb
$1b:b302  a9 18		 lda #$18
$1b:b304  a9 ab		 lda #$ab
$1b:b306  30 c9		 bmi $b2d1
$1b:b308  60			rts
$1b:b309  c9 c9		 cmp #$c9
$1b:b30b  48			pha
$1b:b30c  c9 0c		 cmp #$0c
$1b:b30e  ab			plb
$1b:b30f  a9 18		 lda #$18
$1b:b311  a9 ab		 lda #$ab
$1b:b313  30 c9		 bmi $b2de
$1b:b315  60			rts
$1b:b316  c9 c9		 cmp #$c9
$1b:b318  48			pha
$1b:b319  c9 0c		 cmp #$0c
$1b:b31b  ab			plb
$1b:b31c  a9 18		 lda #$18
$1b:b31e  a9 ab		 lda #$ab
$1b:b320  30 c9		 bmi $b2eb
$1b:b322  e4 ea		 cpx $ea
$1b:b324  00 00		 brk #$00
$1b:b326  ea			nop
$1b:b327  f4 e0 01	  pea $01e0
$1b:b32a  ed 5a e1	  sbc $e15a
$1b:b32d  0a			asl a
$1b:b32e  60			rts
$1b:b32f  7d a1 a1	  adc $a1a1,x
$1b:b332  9d a9 a1	  sta $a1a9,x
$1b:b335  a1 9d		 lda ($9d,x)
$1b:b337  30 a9		 bmi $b2e2
$1b:b339  9d 60 a0	  sta $a060,x
$1b:b33c  a0 a0		 ldy #$a0
$1b:b33e  a0 a0		 ldy #$a0
$1b:b340  a0 9f		 ldy #$9f
$1b:b342  93 99		 sta ($99,s),y
$1b:b344  a5 a4		 lda $a4
$1b:b346  98			tya
$1b:b347  99 a5 a4	  sta $a4a5,y
$1b:b34a  98			tya
$1b:b34b  99 a5 a4	  sta $a4a5,y
$1b:b34e  98			tya
$1b:b34f  99 a5 a4	  sta $a4a5,y
$1b:b352  98			tya
$1b:b353  00 e0		 brk #$e0
$1b:b355  02 ea		 cop #$ea
$1b:b357  f4 ed 91	  pea $91ed
$1b:b35a  e1 0a		 sbc ($0a,x)
$1b:b35c  18			clc
$1b:b35d  3d ad 18	  and $18ad,x
$1b:b360  3b			tsc
$1b:b361  b4 b9		 ldy $b9,x
$1b:b363  18			clc
$1b:b364  3a			dec a
$1b:b365  b4 18		 ldy $18,x
$1b:b367  3d bb 18	  and $18bb,x
$1b:b36a  3b			tsc
$1b:b36b  b4 b9		 ldy $b9,x
$1b:b36d  18			clc
$1b:b36e  3a			dec a
$1b:b36f  b4 18		 ldy $18,x
$1b:b371  3d a9 18	  and $18a9,x
$1b:b374  3b			tsc
$1b:b375  b0 b5		 bcs $b32c
$1b:b377  18			clc
$1b:b378  3a			dec a
$1b:b379  b0 18		 bcs $b393
$1b:b37b  3d b7 18	  and $18b7,x
$1b:b37e  3b			tsc
$1b:b37f  b0 b5		 bcs $b336
$1b:b381  18			clc
$1b:b382  3a			dec a
$1b:b383  b0 18		 bcs $b39d
$1b:b385  3d ad 18	  and $18ad,x
$1b:b388  3b			tsc
$1b:b389  b4 b9		 ldy $b9,x
$1b:b38b  18			clc
$1b:b38c  3a			dec a
$1b:b38d  b4 18		 ldy $18,x
$1b:b38f  3d bb 18	  and $18bb,x
$1b:b392  3b			tsc
$1b:b393  b4 b9		 ldy $b9,x
$1b:b395  18			clc
$1b:b396  3a			dec a
$1b:b397  b4 18		 ldy $18,x
$1b:b399  3d a9 18	  and $18a9,x
$1b:b39c  3b			tsc
$1b:b39d  b0 b5		 bcs $b354
$1b:b39f  18			clc
$1b:b3a0  3a			dec a
$1b:b3a1  b0 18		 bcs $b3bb
$1b:b3a3  3d b7 18	  and $18b7,x
$1b:b3a6  3b			tsc
$1b:b3a7  b9 bc 18	  lda $18bc,y
$1b:b3aa  3a			dec a
$1b:b3ab  c1 18		 cmp ($18,x)
$1b:b3ad  3d ac 18	  and $18ac,x
$1b:b3b0  3b			tsc
$1b:b3b1  b3 b8		 lda ($b8,s),y
$1b:b3b3  18			clc
$1b:b3b4  3a			dec a
$1b:b3b5  b3 18		 lda ($18,s),y
$1b:b3b7  3d ba 18	  and $18ba,x
$1b:b3ba  3b			tsc
$1b:b3bb  b3 b8		 lda ($b8,s),y
$1b:b3bd  18			clc
$1b:b3be  3a			dec a
$1b:b3bf  b3 18		 lda ($18,s),y
$1b:b3c1  3d ac 18	  and $18ac,x
$1b:b3c4  3b			tsc
$1b:b3c5  b3 b8		 lda ($b8,s),y
$1b:b3c7  18			clc
$1b:b3c8  3a			dec a
$1b:b3c9  b3 18		 lda ($18,s),y
$1b:b3cb  3d ba 18	  and $18ba,x
$1b:b3ce  3b			tsc
$1b:b3cf  b3 b8		 lda ($b8,s),y
$1b:b3d1  18			clc
$1b:b3d2  3a			dec a
$1b:b3d3  b3 18		 lda ($18,s),y
$1b:b3d5  3d ac 18	  and $18ac,x
$1b:b3d8  3b			tsc
$1b:b3d9  b3 b8		 lda ($b8,s),y
$1b:b3db  18			clc
$1b:b3dc  3a			dec a
$1b:b3dd  b3 18		 lda ($18,s),y
$1b:b3df  3d ba 18	  and $18ba,x
$1b:b3e2  3b			tsc
$1b:b3e3  b3 b8		 lda ($b8,s),y
$1b:b3e5  18			clc
$1b:b3e6  3a			dec a
$1b:b3e7  b3 18		 lda ($18,s),y
$1b:b3e9  3d ab 18	  and $18ab,x
$1b:b3ec  3b			tsc
$1b:b3ed  b2 b7		 lda ($b7)
$1b:b3ef  18			clc
$1b:b3f0  3a			dec a
$1b:b3f1  b2 18		 lda ($18)
$1b:b3f3  3d b9 18	  and $18b9,x
$1b:b3f6  3b			tsc
$1b:b3f7  b2 bb		 lda ($bb)
$1b:b3f9  18			clc
$1b:b3fa  3a			dec a
$1b:b3fb  b2 ed		 lda ($ed)
$1b:b3fd  a0 ea		 ldy #$ea
$1b:b3ff  00 18		 brk #$18
$1b:b401  3d 99 18	  and $1899,x
$1b:b404  3b			tsc
$1b:b405  a0 a5		 ldy #$a5
$1b:b407  18			clc
$1b:b408  3a			dec a
$1b:b409  a0 18		 ldy #$18
$1b:b40b  3d a7 18	  and $18a7,x
$1b:b40e  3b			tsc
$1b:b40f  a0 a5		 ldy #$a5
$1b:b411  18			clc
$1b:b412  3a			dec a
$1b:b413  a0 18		 ldy #$18
$1b:b415  3d 98 18	  and $1898,x
$1b:b418  3b			tsc
$1b:b419  9f a4 18 3a   sta $3a18a4,x
$1b:b41d  9f 18 3d a6   sta $a63d18,x
$1b:b421  18			clc
$1b:b422  3b			tsc
$1b:b423  9f a7 18 3a   sta $3a18a7,x
$1b:b427  9f 18 3d 99   sta $993d18,x
$1b:b42b  18			clc
$1b:b42c  3b			tsc
$1b:b42d  a0 a5		 ldy #$a5
$1b:b42f  18			clc
$1b:b430  3a			dec a
$1b:b431  a0 18		 ldy #$18
$1b:b433  3d a7 18	  and $18a7,x
$1b:b436  3b			tsc
$1b:b437  a0 a5		 ldy #$a5
$1b:b439  18			clc
$1b:b43a  3a			dec a
$1b:b43b  a0 18		 ldy #$18
$1b:b43d  3d 98 18	  and $1898,x
$1b:b440  3b			tsc
$1b:b441  9f a4 18 3a   sta $3a18a4,x
$1b:b445  9f 18 3d a6   sta $a63d18,x
$1b:b449  18			clc
$1b:b44a  3b			tsc
$1b:b44b  9f a7 18 3a   sta $3a18a7,x
$1b:b44f  9f 18 3d 99   sta $993d18,x
$1b:b453  18			clc
$1b:b454  3b			tsc
$1b:b455  a0 a5		 ldy #$a5
$1b:b457  18			clc
$1b:b458  3a			dec a
$1b:b459  a0 18		 ldy #$18
$1b:b45b  3d a7 18	  and $18a7,x
$1b:b45e  3b			tsc
$1b:b45f  a0 a5		 ldy #$a5
$1b:b461  18			clc
$1b:b462  3a			dec a
$1b:b463  a0 18		 ldy #$18
$1b:b465  3d 98 18	  and $1898,x
$1b:b468  3b			tsc
$1b:b469  9f a4 18 3a   sta $3a18a4,x
$1b:b46d  9f 18 3d a6   sta $a63d18,x
$1b:b471  18			clc
$1b:b472  3b			tsc
$1b:b473  9f a7 18 3a   sta $3a18a7,x
$1b:b477  9f 18 3d 99   sta $993d18,x
$1b:b47b  18			clc
$1b:b47c  3b			tsc
$1b:b47d  a0 a5		 ldy #$a5
$1b:b47f  18			clc
$1b:b480  3a			dec a
$1b:b481  a0 18		 ldy #$18
$1b:b483  3d a7 18	  and $18a7,x
$1b:b486  3b			tsc
$1b:b487  a0 a5		 ldy #$a5
$1b:b489  18			clc
$1b:b48a  3a			dec a
$1b:b48b  a0 18		 ldy #$18
$1b:b48d  3d 98 18	  and $1898,x
$1b:b490  3b			tsc
$1b:b491  9f a4 18 3a   sta $3a18a4,x
$1b:b495  9f 18 3d a6   sta $a63d18,x
$1b:b499  18			clc
$1b:b49a  3b			tsc
$1b:b49b  9f a7 18 3a   sta $3a18a7,x
$1b:b49f  9f 00 ea f4   sta $f4ea00,x
$1b:b4a3  e0 03		 cpx #$03
$1b:b4a5  ed 78 e1	  sbc $e178
$1b:b4a8  08			php
$1b:b4a9  0c c9 06	  tsb $06c9
$1b:b4ac  5f af 12 5d   eor $5d12af,x
$1b:b4b0  bb			tyx
$1b:b4b1  48			pha
$1b:b4b2  c9 06		 cmp #$06
$1b:b4b4  5f ab 12 5d   eor $5d12ab,x
$1b:b4b8  b7 18		 lda [$18],y
$1b:b4ba  c9 06		 cmp #$06
$1b:b4bc  5f a8 12 5d   eor $5d12a8,x
$1b:b4c0  b4 06		 ldy $06,x
$1b:b4c2  5f ab 12 5d   eor $5d12ab,x
$1b:b4c6  b7 06		 lda [$06],y
$1b:b4c8  5f a6 12 5d   eor $5d12a6,x
$1b:b4cc  b2 48		 lda ($48)
$1b:b4ce  c9 06		 cmp #$06
$1b:b4d0  5f ad 12 5d   eor $5d12ad,x
$1b:b4d4  b9 48 c9	  lda $c948,y
$1b:b4d7  06 5f		 asl $5f
$1b:b4d9  af 12 5d bb   lda $bb5d12
$1b:b4dd  48			pha
$1b:b4de  c9 06		 cmp #$06
$1b:b4e0  5f ab 12 5d   eor $5d12ab,x
$1b:b4e4  b7 18		 lda [$18],y
$1b:b4e6  c9 06		 cmp #$06
$1b:b4e8  5f a8 12 5d   eor $5d12a8,x
$1b:b4ec  b4 06		 ldy $06,x
$1b:b4ee  5f ab 12 5d   eor $5d12ab,x
$1b:b4f2  b7 06		 lda [$06],y
$1b:b4f4  5f a6 12 5d   eor $5d12a6,x
$1b:b4f8  b2 48		 lda ($48)
$1b:b4fa  c9 60		 cmp #$60
$1b:b4fc  c9 06		 cmp #$06
$1b:b4fe  5f ae 12 5d   eor $5d12ae,x
$1b:b502  ba			tsx
$1b:b503  48			pha
$1b:b504  c9 06		 cmp #$06
$1b:b506  5f a9 12 5d   eor $5d12a9,x
$1b:b50a  b5 18		 lda $18,x
$1b:b50c  c9 06		 cmp #$06
$1b:b50e  5f a6 12 5d   eor $5d12a6,x
$1b:b512  b2 06		 lda ($06)
$1b:b514  5f a9 12 5d   eor $5d12a9,x
$1b:b518  b5 06		 lda $06,x
$1b:b51a  5f a4 12 5d   eor $5d12a4,x
$1b:b51e  b0 48		 bcs $b568
$1b:b520  c9 06		 cmp #$06
$1b:b522  5f ab 12 5d   eor $5d12ab,x
$1b:b526  b7 48		 lda [$48],y
$1b:b528  c9 06		 cmp #$06
$1b:b52a  5f a0 12 5d   eor $5d12a0,x
$1b:b52e  ac 06 5f	  ldy $5f06
$1b:b531  a4 12		 ldy $12
$1b:b533  5d b0 06	  eor $06b0,x
$1b:b536  5f a6 12 5d   eor $5d12a6,x
$1b:b53a  b2 06		 lda ($06)
$1b:b53c  5f a9 12 5d   eor $5d12a9,x
$1b:b540  b5 06		 lda $06,x
$1b:b542  5f a6 12 5d   eor $5d12a6,x
$1b:b546  b2 06		 lda ($06)
$1b:b548  5f a9 12 5d   eor $5d12a9,x
$1b:b54c  b5 06		 lda $06,x
$1b:b54e  5f ac 12 5d   eor $5d12ac,x
$1b:b552  b8			clv
$1b:b553  06 5f		 asl $5f
$1b:b555  b0 12		 bcs $b569
$1b:b557  5d bc 06	  eor $06bc,x
$1b:b55a  5f af 12 5d   eor $5d12af,x
$1b:b55e  bb			tyx
$1b:b55f  48			pha
$1b:b560  c9 06		 cmp #$06
$1b:b562  5f ab 12 5d   eor $5d12ab,x
$1b:b566  b7 48		 lda [$48],y
$1b:b568  c9 e3		 cmp #$e3
$1b:b56a  0c 46 40	  tsb $4046
$1b:b56d  ea			nop
$1b:b56e  00 e0		 brk #$e0
$1b:b570  00 60		 brk #$60
$1b:b572  c9 c9		 cmp #$c9
$1b:b574  48			pha
$1b:b575  c9 0c		 cmp #$0c
$1b:b577  ab			plb
$1b:b578  a9 18		 lda #$18
$1b:b57a  a9 ab		 lda #$ab
$1b:b57c  30 c9		 bmi $b547
$1b:b57e  60			rts
$1b:b57f  c9 c9		 cmp #$c9
$1b:b581  48			pha
$1b:b582  c9 0c		 cmp #$0c
$1b:b584  ab			plb
$1b:b585  a9 18		 lda #$18
$1b:b587  a9 ab		 lda #$ab
$1b:b589  30 c9		 bmi $b554
$1b:b58b  60			rts
$1b:b58c  c9 c9		 cmp #$c9
$1b:b58e  48			pha
$1b:b58f  c9 0c		 cmp #$0c
$1b:b591  ab			plb
$1b:b592  a9 18		 lda #$18
$1b:b594  a9 ab		 lda #$ab
$1b:b596  30 c9		 bmi $b561
$1b:b598  60			rts
$1b:b599  c9 c9		 cmp #$c9
$1b:b59b  48			pha
$1b:b59c  c9 0c		 cmp #$0c
$1b:b59e  ab			plb
$1b:b59f  a9 18		 lda #$18
$1b:b5a1  a9 ab		 lda #$ab
$1b:b5a3  24 c9		 bit $c9
$1b:b5a5  e4 00		 cpx $00
$1b:b5a7  e0 02		 cpx #$02
$1b:b5a9  ea			nop
$1b:b5aa  00 ed		 brk #$ed
$1b:b5ac  96 e1		 stx $e1,y
$1b:b5ae  0b			phd
$1b:b5af  60			rts
$1b:b5b0  c9 c9		 cmp #$c9
$1b:b5b2  c9 08		 cmp #$08
$1b:b5b4  3f a1 08 3d   and $3d08a1,x
$1b:b5b8  a3 a4		 lda $a4,s
$1b:b5ba  06 3f		 asl $3f
$1b:b5bc  a6 06		 ldx $06
$1b:b5be  3d a8 a9	  and $a9a8,x
$1b:b5c1  ab			plb
$1b:b5c2  ad af 06	  lda $06af
$1b:b5c5  3c b0 06	  bit $06b0,x
$1b:b5c8  3b			tsc
$1b:b5c9  b2 06		 lda ($06)
$1b:b5cb  3c b4 06	  bit $06b4,x
$1b:b5ce  3b			tsc
$1b:b5cf  b5 06		 lda $06,x
$1b:b5d1  3a			dec a
$1b:b5d2  b7 06		 lda [$06],y
$1b:b5d4  39 b9 60	  and $60b9,y
$1b:b5d7  c9 c9		 cmp #$c9
$1b:b5d9  c9 08		 cmp #$08
$1b:b5db  3f a1 08 3d   and $3d08a1,x
$1b:b5df  a3 a4		 lda $a4,s
$1b:b5e1  06 3f		 asl $3f
$1b:b5e3  a6 06		 ldx $06
$1b:b5e5  3d a8 a9	  and $a9a8,x
$1b:b5e8  ab			plb
$1b:b5e9  ad af 06	  lda $06af
$1b:b5ec  3c b0 06	  bit $06b0,x
$1b:b5ef  3b			tsc
$1b:b5f0  b2 06		 lda ($06)
$1b:b5f2  3c b4 06	  bit $06b4,x
$1b:b5f5  3b			tsc
$1b:b5f6  b5 06		 lda $06,x
$1b:b5f8  3a			dec a
$1b:b5f9  b7 06		 lda [$06],y
$1b:b5fb  39 b8 60	  and $60b8,y
$1b:b5fe  c9 c9		 cmp #$c9
$1b:b600  c9 08		 cmp #$08
$1b:b602  3f a0 08 3d   and $3d08a0,x
$1b:b606  a2 a4		 ldx #$a4
$1b:b608  08			php
$1b:b609  3f a6 08 3d   and $3d08a6,x
$1b:b60d  a7 a9		 lda [$a9]
$1b:b60f  ae 08 3c	  ldx $3c08
$1b:b612  b0 08		 bcs $b61c
$1b:b614  3b			tsc
$1b:b615  b2 06		 lda ($06)
$1b:b617  3c b3 06	  bit $06b3,x
$1b:b61a  3b			tsc
$1b:b61b  b5 06		 lda $06,x
$1b:b61d  3a			dec a
$1b:b61e  b7 06		 lda [$06],y
$1b:b620  39 b8 60	  and $60b8,y
$1b:b623  c9 c9		 cmp #$c9
$1b:b625  c9 08		 cmp #$08
$1b:b627  3f 9f 08 3d   and $3d089f,x
$1b:b62b  a1 a3		 lda ($a3,x)
$1b:b62d  08			php
$1b:b62e  3f a4 08 3d   and $3d08a4,x
$1b:b632  a6 a8		 ldx $a8
$1b:b634  06 a9		 asl $a9
$1b:b636  ad 06 3c	  lda $3c06
$1b:b639  ae 06 3b	  ldx $3b06
$1b:b63c  b0 06		 bcs $b644
$1b:b63e  3c b2 06	  bit $06b2,x
$1b:b641  3b			tsc
$1b:b642  b4 06		 ldy $06,x
$1b:b644  3a			dec a
$1b:b645  b5 06		 lda $06,x
$1b:b647  39 b7 e3	  and $e3b7,y
$1b:b64a  0c 46 40	  tsb $4046
$1b:b64d  ed 73 e0	  sbc $e073
$1b:b650  00 ea		 brk #$ea
$1b:b652  00 60		 brk #$60
$1b:b654  c9 c9		 cmp #$c9
$1b:b656  48			pha
$1b:b657  c9 0c		 cmp #$0c
$1b:b659  5d a6 a4	  eor $a4a6,x
$1b:b65c  18			clc
$1b:b65d  a4 a6		 ldy $a6
$1b:b65f  30 c9		 bmi $b62a
$1b:b661  60			rts
$1b:b662  c9 c9		 cmp #$c9
$1b:b664  48			pha
$1b:b665  c9 0c		 cmp #$0c
$1b:b667  a6 a4		 ldx $a4
$1b:b669  18			clc
$1b:b66a  a4 a6		 ldy $a6
$1b:b66c  30 c9		 bmi $b637
$1b:b66e  60			rts
$1b:b66f  c9 c9		 cmp #$c9
$1b:b671  48			pha
$1b:b672  c9 0c		 cmp #$0c
$1b:b674  a6 a4		 ldx $a4
$1b:b676  18			clc
$1b:b677  a4 a6		 ldy $a6
$1b:b679  30 c9		 bmi $b644
$1b:b67b  60			rts
$1b:b67c  c9 c9		 cmp #$c9
$1b:b67e  48			pha
$1b:b67f  c9 0c		 cmp #$0c
$1b:b681  a6 a4		 ldx $a4
$1b:b683  18			clc
$1b:b684  a4 a6		 ldy $a6
$1b:b686  30 c9		 bmi $b651
$1b:b688  e4 ea		 cpx $ea
$1b:b68a  00 00		 brk #$00
$1b:b68c  ea			nop
$1b:b68d  00 e0		 brk #$e0
$1b:b68f  04 ed		 tsb $ed
$1b:b691  46 e1		 lsr $e1
$1b:b693  07 e3		 ora [$e3]
$1b:b695  60			rts
$1b:b696  1e 20 0c	  asl $0c20,x
$1b:b699  c9 60		 cmp #$60
$1b:b69b  7a			ply
$1b:b69c  b2 60		 lda ($60)
$1b:b69e  68			pla
$1b:b69f  c8			iny
$1b:b6a0  60			rts
$1b:b6a1  7b			tdc
$1b:b6a2  ad 60 68	  lda $6860
$1b:b6a5  c8			iny
$1b:b6a6  60			rts
$1b:b6a7  7a			ply
$1b:b6a8  b2 60		 lda ($60)
$1b:b6aa  68			pla
$1b:b6ab  c8			iny
$1b:b6ac  60			rts
$1b:b6ad  7b			tdc
$1b:b6ae  ad 30 6b	  lda $6b30
$1b:b6b1  c8			iny
$1b:b6b2  30 7b		 bmi $b72f
$1b:b6b4  ab			plb
$1b:b6b5  60			rts
$1b:b6b6  a9 60		 lda #$60
$1b:b6b8  68			pla
$1b:b6b9  c8			iny
$1b:b6ba  c8			iny
$1b:b6bb  60			rts
$1b:b6bc  7b			tdc
$1b:b6bd  a7 a9		 lda [$a9]
$1b:b6bf  a6 60		 ldx $60
$1b:b6c1  68			pla
$1b:b6c2  c8			iny
$1b:b6c3  60			rts
$1b:b6c4  78			sei
$1b:b6c5  c8			iny
$1b:b6c6  ed 50 60	  sbc $6050
$1b:b6c9  7d a7 30	  adc $30a7,x
$1b:b6cc  ae 18 ab	  ldx $ab18
$1b:b6cf  ae 60 a9	  ldx $a960
$1b:b6d2  b0 aa		 bcs $b67e
$1b:b6d4  30 ac		 bmi $b682
$1b:b6d6  b0 60		 bcs $b738
$1b:b6d8  5b			tcd
$1b:b6d9  b2 60		 lda ($60)
$1b:b6db  68			pla
$1b:b6dc  c8			iny
$1b:b6dd  60			rts
$1b:b6de  7d ac 30	  adc $30ac,x
$1b:b6e1  c8			iny
$1b:b6e2  18			clc
$1b:b6e3  b0 18		 bcs $b6fd
$1b:b6e5  7b			tdc
$1b:b6e6  b3 60		 lda ($60,s),y
$1b:b6e8  b2 30		 lda ($30)
$1b:b6ea  6d c8 18	  adc $18c8
$1b:b6ed  7d ae 18	  adc $18ae,x
$1b:b6f0  7b			tdc
$1b:b6f1  ab			plb
$1b:b6f2  60			rts
$1b:b6f3  7d ac 30	  adc $30ac,x
$1b:b6f6  6d c8 18	  adc $18c8
$1b:b6f9  7d b0 18	  adc $18b0,x
$1b:b6fc  7b			tdc
$1b:b6fd  b3 60		 lda ($60,s),y
$1b:b6ff  b2 54		 lda ($54)
$1b:b701  68			pla
$1b:b702  c8			iny
$1b:b703  00 e0		 brk #$e0
$1b:b705  02 ea		 cop #$ea
$1b:b707  00 ed		 brk #$ed
$1b:b709  55 e1		 eor $e1,x
$1b:b70b  09 66		 ora #$66
$1b:b70d  c9 60		 cmp #$60
$1b:b70f  c9 c9		 cmp #$c9
$1b:b711  08			php
$1b:b712  3f a1 08 3d   and $3d08a1,x
$1b:b716  a3 a4		 lda $a4,s
$1b:b718  06 3f		 asl $3f
$1b:b71a  a6 06		 ldx $06
$1b:b71c  3d a8 a9	  and $a9a8,x
$1b:b71f  ab			plb
$1b:b720  ad 06 3c	  lda $3c06
$1b:b723  af 06 3b b0   lda $b03b06
$1b:b727  b2 06		 lda ($06)
$1b:b729  3c b4 06	  bit $06b4,x
$1b:b72c  3b			tsc
$1b:b72d  b5 06		 lda $06,x
$1b:b72f  3a			dec a
$1b:b730  b7 06		 lda [$06],y
$1b:b732  39 b9 60	  and $60b9,y
$1b:b735  c9 c9		 cmp #$c9
$1b:b737  c9 08		 cmp #$08
$1b:b739  3f a1 08 3d   and $3d08a1,x
$1b:b73d  a3 a4		 lda $a4,s
$1b:b73f  06 3f		 asl $3f
$1b:b741  a6 06		 ldx $06
$1b:b743  3d a8 a9	  and $a9a8,x
$1b:b746  ab			plb
$1b:b747  ad af 06	  lda $06af
$1b:b74a  3c b0 06	  bit $06b0,x
$1b:b74d  3b			tsc
$1b:b74e  b2 06		 lda ($06)
$1b:b750  3c b4 06	  bit $06b4,x
$1b:b753  3b			tsc
$1b:b754  b5 06		 lda $06,x
$1b:b756  3a			dec a
$1b:b757  b7 06		 lda [$06],y
$1b:b759  39 b8 60	  and $60b8,y
$1b:b75c  c9 c9		 cmp #$c9
$1b:b75e  c9 08		 cmp #$08
$1b:b760  3f a0 08 3d   and $3d08a0,x
$1b:b764  a2 a4		 ldx #$a4
$1b:b766  08			php
$1b:b767  3f a6 08 3d   and $3d08a6,x
$1b:b76b  a7 a9		 lda [$a9]
$1b:b76d  ae 08 3c	  ldx $3c08
$1b:b770  b0 08		 bcs $b77a
$1b:b772  3b			tsc
$1b:b773  b2 06		 lda ($06)
$1b:b775  3c b3 06	  bit $06b3,x
$1b:b778  3b			tsc
$1b:b779  b5 06		 lda $06,x
$1b:b77b  3a			dec a
$1b:b77c  b7 06		 lda [$06],y
$1b:b77e  39 b8 60	  and $60b8,y
$1b:b781  c9 c9		 cmp #$c9
$1b:b783  c9 08		 cmp #$08
$1b:b785  3f 9f 08 3d   and $3d089f,x
$1b:b789  a1 a3		 lda ($a3,x)
$1b:b78b  08			php
$1b:b78c  3f a4 08 3d   and $3d08a4,x
$1b:b790  a6 a8		 ldx $a8
$1b:b792  06 a9		 asl $a9
$1b:b794  ad 06 3c	  lda $3c06
$1b:b797  ae 06 3b	  ldx $3b06
$1b:b79a  b0 06		 bcs $b7a2
$1b:b79c  3c b2 06	  bit $06b2,x
$1b:b79f  3b			tsc
$1b:b7a0  b4 06		 ldy $06,x
$1b:b7a2  3a			dec a
$1b:b7a3  b5 06		 lda $06,x
$1b:b7a5  39 b7 ea	  and $eab7,y
$1b:b7a8  0c ed 3c	  tsb $3ced
$1b:b7ab  e0 00		 cpx #$00
$1b:b7ad  60			rts
$1b:b7ae  c9 c9		 cmp #$c9
$1b:b7b0  48			pha
$1b:b7b1  c9 0c		 cmp #$0c
$1b:b7b3  5d a6 a4	  eor $a4a6,x
$1b:b7b6  18			clc
$1b:b7b7  a4 a6		 ldy $a6
$1b:b7b9  30 c9		 bmi $b784
$1b:b7bb  60			rts
$1b:b7bc  c9 c9		 cmp #$c9
$1b:b7be  48			pha
$1b:b7bf  c9 0c		 cmp #$0c
$1b:b7c1  a6 a4		 ldx $a4
$1b:b7c3  18			clc
$1b:b7c4  a4 a6		 ldy $a6
$1b:b7c6  30 c9		 bmi $b791
$1b:b7c8  60			rts
$1b:b7c9  c9 c9		 cmp #$c9
$1b:b7cb  48			pha
$1b:b7cc  c9 0c		 cmp #$0c
$1b:b7ce  a6 a4		 ldx $a4
$1b:b7d0  18			clc
$1b:b7d1  a4 a6		 ldy $a6
$1b:b7d3  30 c9		 bmi $b79e
$1b:b7d5  60			rts
$1b:b7d6  c9 c9		 cmp #$c9
$1b:b7d8  48			pha
$1b:b7d9  c9 0c		 cmp #$0c
$1b:b7db  a6 a4		 ldx $a4
$1b:b7dd  18			clc
$1b:b7de  a4 a6		 ldy $a6
$1b:b7e0  2a			rol a
$1b:b7e1  c9 ea		 cmp #$ea
$1b:b7e3  00 00		 brk #$00
$1b:b7e5  00 14		 brk #$14
$1b:b7e7  00 34		 brk #$34
$1b:b7e9  2c 53 73	  bit $7353
$1b:b7ec  ce 76 e9	  dec $e976
$1b:b7ef  76 1f		 ror $1f,x
$1b:b7f1  77 3a		 adc [$3a],y
$1b:b7f3  77 7b		 adc [$7b],y
$1b:b7f5  7b			tdc
$1b:b7f6  ba			tsx
$1b:b7f7  7b			tdc
$1b:b7f8  1e 7e 67	  asl $677e,x
$1b:b7fb  80 82		 bra $b77f
$1b:b7fd  80 02		 bra $b801
$1b:b7ff  00 fd		 brk #$fd
$1b:b801  0f 7b 96 00   ora $00967b
$1b:b805  00 05		 brk #$05
$1b:b807  1b			tcs
$1b:b808  1c 1d 1e	  trb $1e1d
$1b:b80b  1f 00 08 81   ora $810800,x
$1b:b80f  40			rti
$1b:b810  1d e9 9e	  ora $9ee9,x
$1b:b813  d0 67		 bne $b87c
$1b:b815  b4 39		 ldy $39,x
$1b:b817  28			plp
$1b:b818  03 ec		 ora $ec,s
$1b:b81a  23 da		 and $da,s
$1b:b81c  28			plp
$1b:b81d  93 f8		 sta ($f8,s),y
$1b:b81f  36 40		 rol $40,x
$1b:b821  10 00		 bpl $b823
$1b:b823  8e 8c 02	  stx $028c
$1b:b826  3b			tsc
$1b:b827  38			sec
$1b:b828  f5 51		 sbc $51,x
$1b:b82a  f2 00		 sbc ($00)
$1b:b82c  32 8f		 and ($8f)
$1b:b82e  70 a3		 bvs $b7d3
$1b:b830  d5 60		 cmp $60,x
$1b:b832  18			clc
$1b:b833  3f 44 34 1b   and $1b3444,x
$1b:b837  07 e8		 ora [$e8]
$1b:b839  ec de e1	  cpx $e1de
$1b:b83c  1e e1 80	  asl $80e1,x
$1b:b83f  46 aa		 lsr $aa
$1b:b841  27 1d		 and [$1d]
$1b:b843  88			dey
$1b:b844  2c aa 56	  bit $56aa
$1b:b847  58			cli
$1b:b848  95 ae		 sta $ae,x
$1b:b84a  a5 75		 lda $75
$1b:b84c  89 5e		 bit #$5e
$1b:b84e  e2 57		 sep #$57
$1b:b850  38			sec
$1b:b851  94 24		 sty $24,x
$1b:b853  7e 31 98	  ror $9831,x
$1b:b856  77 ce		 adc [$ce],y
$1b:b858  1d f4 87	  ora $87f4,x
$1b:b85b  7d 61 df	  adc $df61,x
$1b:b85e  68			pla
$1b:b85f  97 ca		 sta [$ca],y
$1b:b861  25 f0		 and $f0
$1b:b863  27 8f		 and [$8f]
$1b:b865  c4 a2		 cpy $a2
$1b:b867  a5 00		 lda $00
$1b:b869  b5 c4		 lda $c4,x
$1b:b86b  a1 03		 lda ($03,x)
$1b:b86d  d1 8c		 cmp ($8c),y
$1b:b86f  18			clc
$1b:b870  46 cc		 lsr $cc
$1b:b872  65 1b		 adc $1b
$1b:b874  b4 38		 ldy $38,x
$1b:b876  de 14 e8	  dec $e814,x
$1b:b879  75 72		 adc $72,x
$1b:b87b  1d 4c a7	  ora $a74c,x
$1b:b87e  1c 82 1f	  trb $1f82
$1b:b881  0e a7 c3	  asl $c3a7
$1b:b884  ab			plb
$1b:b885  e7 31		 sbc [$31]
$1b:b887  ae e3 ab	  ldx $abe3
$1b:b88a  98			tya
$1b:b88b  ea			nop
$1b:b88c  ec 3a bc	  cpx $bc3a
$1b:b88f  7d 0c 75	  adc $750c,x
$1b:b892  7b			tdc
$1b:b893  1c 7e 09	  trb $097e
$1b:b896  e2 04		 sep #$04
$1b:b898  21 d4		 and ($d4,x)
$1b:b89a  d8			cld
$1b:b89b  76 a5		 ror $a5,x
$1b:b89d  0e 14 e9	  asl $e914
$1b:b8a0  e5 3b		 sbc $3b
$1b:b8a2  53 4e		 eor ($4e,s),y
$1b:b8a4  a6 97		 ldx $97
$1b:b8a6  c6 0e		 dec $0e
$1b:b8a8  3d 18 ba	  and $ba18,x
$1b:b8ab  84 4d		 sty $4d
$1b:b8ad  40			rti
$1b:b8ae  a6 0b		 ldx $0b
$1b:b8b0  b2 0c		 lda ($0c)
$1b:b8b2  21 d1		 and ($d1,x)
$1b:b8b4  c8			iny
$1b:b8b5  74 7a		 stz $7a,x
$1b:b8b7  1d 47 87	  ora $8747,x
$1b:b8ba  47 51		 eor [$51]
$1b:b8bc  a1 4e		 lda ($4e,x)
$1b:b8be  5b			tcd
$1b:b8bf  04 7e		 tsb $7e
$1b:b8c1  1d 38 a7	  ora $a738,x
$1b:b8c4  4e 16 a0	  lsr $a016
$1b:b8c7  bb			tyx
$1b:b8c8  13 b8		 ora ($b8,s),y
$1b:b8ca  1c 82 9a	  trb $9a82
$1b:b8cd  9d 05 f8	  sta $f805,x
$1b:b8d0  43 b5		 eor $b5,s
$1b:b8d2  10 e9		 bpl $b8bd
$1b:b8d4  62 14 29	  per $e1eb
$1b:b8d7  da			phx
$1b:b8d8  86 08		 stx $08
$1b:b8da  22 c2 9d 2c   jsl $2c9dc2
$1b:b8de  8a			txa
$1b:b8df  76 22		 ror $22,x
$1b:b8e1  94 18		 sty $18,x
$1b:b8e3  a7 a1		 lda [$a1]
$1b:b8e5  c2 35		 rep #$35
$1b:b8e7  2a			rol a
$1b:b8e8  a7 9b		 lda [$9b]
$1b:b8ea  29 52 ea	  and #$ea52
$1b:b8ed  79 a1 90	  adc $90a1,y
$1b:b8f0  47 79		 eor [$79]
$1b:b8f2  45 2f		 eor $2f
$1b:b8f4  cf 13 f7 3c   cmp $3cf713
$1b:b8f8  4e fe ff	  lsr $fffe
$1b:b8fb  27 d9		 and [$d9]
$1b:b8fd  01 cf		 ora ($cf,x)
$1b:b8ff  bc ef 5f	  ldy $5fef,x
$1b:b902  74 50		 stz $50,x
$1b:b904  32 2e		 and ($2e)
$1b:b906  f5 a4		 sbc $a4,x
$1b:b908  88			dey
$1b:b909  c7 bc		 cmp [$bc]
$1b:b90b  0f 4a a6 2e   ora $2ea64a
$1b:b90f  29 e7 17	  and #$17e7
$1b:b912  8f a6 1d c0   sta $c01da6
$1b:b916  87 70		 sta [$70]
$1b:b918  61 dd		 adc ($dd,x)
$1b:b91a  08			php
$1b:b91b  77 46		 adc [$46],y
$1b:b91d  25 80		 and $80
$1b:b91f  89 60 62	  bit #$6260
$1b:b922  59 08 96	  eor $9608,y
$1b:b925  46 1d		 lsr $1d
$1b:b927  82 87 4a	  brl $03b1
$1b:b92a  a1 d9		 lda ($d9,x)
$1b:b92c  28			plp
$1b:b92d  74 ea		 stz $ea,x
$1b:b92f  2d 26 8b	  and $8b26
$1b:b932  4a			lsr a
$1b:b933  e2 d3		 sep #$d3
$1b:b935  68			pla
$1b:b936  b4 ee		 ldy $ee,x
$1b:b938  25 53		 and $53
$1b:b93a  2b			pld
$1b:b93b  84 7a		 sty $7a
$1b:b93d  ac 5b 08	  ldy $085b
$1b:b940  94 02		 sty $02,x
$1b:b942  3d 55 2f	  and $2f55,x
$1b:b945  99 61 36	  sta $3661,y
$1b:b948  11 47		 ora ($47),y
$1b:b94a  a0 1c		 ldy #$1c
$1b:b94c  0c 5e 3d	  tsb $3d5e
$1b:b94f  c1 78		 cmp ($78,x)
$1b:b951  f7 62		 sbc [$62],y
$1b:b953  94 23		 sty $23,x
$1b:b955  c8			iny
$1b:b956  38			sec
$1b:b957  c4 fc		 cpy $fc
$1b:b959  0e 00 41	  asl $4100
$1b:b95c  02 00		 cop #$00
$1b:b95e  3b			tsc
$1b:b95f  a2 f1		 ldx #$f1
$1b:b961  ed 8b c7	  sbc $c78b
$1b:b964  b4 57		 ldy $57,x
$1b:b966  3e 11 6c	  rol $6c11,x
$1b:b969  22 9c 40 c9   jsl $c9409c
$1b:b96d  27 c7		 and [$c7]
$1b:b96f  8a			txa
$1b:b970  a1 3e		 lda ($3e,x)
$1b:b972  2c 4a c1	  bit $c14a
$1b:b975  12 b0		 ora ($b0)
$1b:b977  c4 ae		 cpy $ae
$1b:b979  11 2b		 ora ($2b),y
$1b:b97b  8a			txa
$1b:b97c  bc e8 b1	  ldy $b1e8,x
$1b:b97f  2a			rol a
$1b:b980  32 1c		 and ($1c)
$1b:b982  d0 83		 bne $b907
$1b:b984  16 a5		 asl $a5,x
$1b:b986  45 a9		 eor $a9
$1b:b988  71 6a		 adc ($6a),y
$1b:b98a  d4 5a		 pei ($5a)
$1b:b98c  b7 16		 lda [$16],y
$1b:b98e  94 d5		 sty $d5,x
$1b:b990  a5 31		 lda $31
$1b:b992  69 cd 5a	  adc #$5acd
$1b:b995  73 16		 adc ($16,s),y
$1b:b997  92 55		 sta ($55)
$1b:b999  a4 91		 ldy $91
$1b:b99b  69 a5 5a	  adc #$5aa5
$1b:b99e  69 16 9a	  adc #$9a16
$1b:b9a1  d5 a6		 cmp $a6,x
$1b:b9a3  ad b3 92	  lda $92b3
$1b:b9a6  d5 a4		 cmp $a4,x
$1b:b9a8  ad b2 43	  lda $43b2
$1b:b9ab  8d 01 86	  sta $8601
$1b:b9ae  35 01		 and $01,x
$1b:b9b0  98			tya
$1b:b9b1  d0 06		 bne $b9b9
$1b:b9b3  63 50		 adc $50,s
$1b:b9b5  8a			txa
$1b:b9b6  78			sei
$1b:b9b7  62 9d 98	  per $5257
$1b:b9ba  a7 b6		 lda [$b6]
$1b:b9bc  29 eb 8f	  and #$8feb
$1b:b9bf  48			pha
$1b:b9c0  23 d2		 and $d2,s
$1b:b9c2  18			clc
$1b:b9c3  f4 c2 3d	  pea $3dc2
$1b:b9c6  31 8f		 and ($8f),y
$1b:b9c8  48			pha
$1b:b9c9  a3 d2		 lda $d2,s
$1b:b9cb  38			sec
$1b:b9cc  b4 ca		 ldy $ca,x
$1b:b9ce  2d 33 27	  and $2733
$1b:b9d1  85 58		 sta $58
$1b:b9d3  a0 13		 ldy #$13
$1b:b9d5  6a			ror a
$1b:b9d6  b4 da		 ldy $da,x
$1b:b9d8  25 2d		 and $2d
$1b:b9da  89 4b a2	  bit #$a24b
$1b:b9dd  53 d8		 eor ($d8,s),y
$1b:b9df  94 fa		 sty $fa,x
$1b:b9e1  a5 2e		 lda $2e
$1b:b9e3  a9 4b 6a	  lda #$6a4b
$1b:b9e6  42 60		 wdm #$60
$1b:b9e8  9e c5 22	  stz $22c5,x
$1b:b9eb  11 48		 ora ($48),y
$1b:b9ed  8b			phb
$1b:b9ee  0c 7d 28	  tsb $287d
$1b:b9f1  71 f3		 adc ($f3),y
$1b:b9f3  8c cc 00	  sty $00cc
$1b:b9f6  5e 01 e9	  lsr $e901,x
$1b:b9f9  9f 00 88 07   sta $078800,x
$1b:b9fd  c0 18		 cpy #$18
$1b:b9ff  05 0d		 ora $0d
$1b:ba01  86 3d		 stx $3d
$1b:ba03  a8			tay
$1b:ba04  b7 52		 lda [$52],y
$1b:ba06  ad d4 cb	  lda $cbd4
$1b:ba09  75 3a		 adc $3a,x
$1b:ba0b  dd 48 a1	  cmp $a148,x
$1b:ba0e  78			sei
$1b:ba0f  3a			dec a
$1b:ba10  b1 4f		 lda ($4f),y
$1b:ba12  24 53		 bit $53
$1b:ba14  cb			wai
$1b:ba15  54 ea d5	  mvn $d5,$ea
$1b:ba18  3a			dec a
$1b:ba19  95 43		 sta $43,x
$1b:ba1b  30 79		 bmi $ba96
$1b:ba1d  21 90		 and ($90,x)
$1b:ba1f  48			pha
$1b:ba20  a7 78		 lda [$78]
$1b:ba22  de 06 f1	  dec $f106,x
$1b:ba25  f7 2a		 sbc [$2a],y
$1b:ba27  40			rti
$1b:ba28  de 51 2e	  dec $2e51,x
$1b:ba2b  94 4b		 sty $4b,x
$1b:ba2d  a7 12		 lda [$12]
$1b:ba2f  f1 44		 sbc ($44),y
$1b:ba31  bc 67 32	  ldy $3267,x
$1b:ba34  3a			dec a
$1b:ba35  92 2d		 sta ($2d)
$1b:ba37  a2 dc		 ldx #$dc
$1b:ba39  68			pla
$1b:ba3a  b7 1d		 lda [$1d],y
$1b:ba3c  2e 59 4f	  rol $4f59
$1b:ba3f  26 53		 rol $53
$1b:ba41  cb			wai
$1b:ba42  94 ea		 sty $ea,x
$1b:ba44  65 3a		 adc $3a
$1b:ba46  bd 4f 2f	  lda $2f4f,x
$1b:ba49  53 c9		 eor ($c9,s),y
$1b:ba4b  d4 53		 pei ($53)
$1b:ba4d  07 52		 ora [$52]
$1b:ba4f  3d 24 af	  and $af24,x
$1b:ba52  49 23 d3	  eor #$d323
$1b:ba55  4a			lsr a
$1b:ba56  f4 d2 3d	  pea $3dd2
$1b:ba59  35 af		 and $af,x
$1b:ba5b  4d 56 67	  eor $6756
$1b:ba5e  25 af		 and $af
$1b:ba60  49 56 65	  eor #$6556
$1b:ba63  ce 9f e3	  dec $e39f
$1b:ba66  a7 f4		 lda [$f4]
$1b:ba68  e9 fc 3a	  sbc #$3afc
$1b:ba6b  7e 73 3e	  ror $3e73,x
$1b:ba6e  f1 c4		 sbc ($c4),y
$1b:ba70  21 d8		 and ($d8,x)
$1b:ba72  9a			txs
$1b:ba73  76 26		 ror $26,x
$1b:ba75  3d c2 8f	  and $8fc2,x
$1b:ba78  55 a2		 eor $a2,x
$1b:ba7a  56 66		 lsr $66,x
$1b:ba7c  f8			sed
$1b:ba7d  57 ab		 eor [$ab],y
$1b:ba7f  31 ea		 and ($ea),y
$1b:ba81  cc 3a d9	  cpy $d93a
$1b:ba84  0e b6 c3	  asl $c3b6
$1b:ba87  af 90 eb ec   lda $eceb90
$1b:ba8b  3b			tsc
$1b:ba8c  05 0e		 ora $0e
$1b:ba8e  c1 c3		 cmp ($c3,x)
$1b:ba90  b2 50		 lda ($50)
$1b:ba92  ec 9c 3b	  cpx $3b9c
$1b:ba95  09 0e c2	  ora #$c20e
$1b:ba98  c3 b2		 cmp $b2,s
$1b:ba9a  90 ec		 bcc $ba88
$1b:ba9c  ad 3b 0b	  lda $0b3b
$1b:ba9f  4e c2 53	  lsr $53c2
$1b:baa2  9f c0 fc 0c   sta $0cfcc0,x
$1b:baa6  34 3b		 bit $3b,x
$1b:baa8  0f 0e cb 43   ora $43cb0e
$1b:baac  b2 e3		 lda ($e3)
$1b:baae  71 a0		 adc ($a0),y
$1b:bab0  45 3d		 eor $3d
$1b:bab2  51 4a		 eor ($4a),y
$1b:bab4  83 5c		 sta $5c,s
$1b:bab6  6d ed d0	  adc $d0ed
$1b:bab9  8f 6c 1b e3   sta $e31b6c
$1b:babd  6b			rtl
$1b:babe  71 9e		 adc ($9e),y
$1b:bac0  32 1d		 and ($1d)
$1b:bac2  8d 87 67	  sta $6787
$1b:bac5  21 d9		 and ($d9,x)
$1b:bac7  d8			cld
$1b:bac8  b5 a0		 lda $a0,x
$1b:baca  5e 36 91	  lsr $9136,x
$1b:bacd  98			tya
$1b:bace  c0 a2		 cpy #$a2
$1b:bad0  d0 38		 bne $bb0a
$1b:bad2  b4 50		 ldy $50,x
$1b:bad4  6e 38 9a	  ror $9a38
$1b:bad7  b3 68		 lda ($68,s),y
$1b:bad9  c7 e2		 cmp [$e2]
$1b:badb  1a			inc a
$1b:badc  2a			rol a
$1b:badd  bc 5b 49	  ldy $495b,x
$1b:bae0  16 d2		 asl $d2,x
$1b:bae2  c5 b6		 cmp $b6
$1b:bae4  91 6d		 sta ($6d),y
$1b:bae6  ac 4a 88	  ldy $884a
$1b:bae9  57 08		 eor [$08],y
$1b:baeb  b5 bc		 lda $bc,x
$1b:baed  92 11		 sta ($11)
$1b:baef  6d 34 5b	  adc $5b34
$1b:baf2  4f 16 db 45   eor $45db16
$1b:baf6  b6 e9		 ldx $e9,y
$1b:baf8  73 eb		 adc ($eb,s),y
$1b:bafa  45 ba		 eor $ba
$1b:bafc  f3 49		 sbc ($49,s),y
$1b:bafe  25 d2		 and $d2
$1b:bb00  49 34 9a	  eor #$9a34
$1b:bb03  5d 0e 61	  eor $610e,x
$1b:bb06  35 ba		 and $ba,x
$1b:bb08  4d 4e 65	  eor $654e
$1b:bb0b  12 87		 ora ($87)
$1b:bb0d  44 a9 d1	  mvp $d1,$a9
$1b:bb10  2a			rol a
$1b:bb11  e4 4a		 cpx $4a
$1b:bb13  5b			tcd
$1b:bb14  52 41		 eor ($41)
$1b:bb16  04 3e		 tsb $3e
$1b:bb18  a5 2d		 lda $2d
$1b:bb1a  89 57 e3	  bit #$e357
$1b:bb1d  48			pha
$1b:bb1e  01 8d		 ora ($8d,x)
$1b:bb20  57 23		 eor [$23],y
$1b:bb22  48			pha
$1b:bb23  61 8d		 adc ($8d,x)
$1b:bb25  43 eb		 eor $eb,s
$1b:bb27  52 d8		 eor ($d8)
$1b:bb29  d5 7e		 cmp $7e,x
$1b:bb2b  2d 0e 8b	  and $8b0e
$1b:bb2e  53 a2		 eor ($a2,s),y
$1b:bb30  d5 c8		 cmp $c8,x
$1b:bb32  b4 b6		 ldy $b6,x
$1b:bb34  ac a2 08	  ldy $08a2
$1b:bb37  7d 5a 5b	  adc $5b5a,x
$1b:bb3a  16 af		 asl $af,x
$1b:bb3c  cb			wai
$1b:bb3d  b7 92		 lda [$92],y
$1b:bb3f  ed ec bb	  sbc $bbec
$1b:bb42  59 2e d6	  eor $d62e,y
$1b:bb45  e7 b4		 sbc [$b4]
$1b:bb47  10 ed		 bpl $bb36
$1b:bb49  cc 4a 01	  cpy $014a
$1b:bb4c  0e e4 43	  asl $43e4
$1b:bb4f  b7 90		 lda [$90],y
$1b:bb51  ed ec 3b	  sbc $3bec
$1b:bb54  93 4e		 sta ($4e,s),y
$1b:bb56  62 06 e7	  per $a25f
$1b:bb59  3d a1 a7	  and $a7a1,x
$1b:bb5c  72 17		 adc ($17)
$1b:bb5e  61 9a		 adc ($9a,x)
$1b:bb60  4a			lsr a
$1b:bb61  04 f6		 tsb $f6
$1b:bb63  35 1e		 and $1e,x
$1b:bb65  8d 51 eb	  sta $eb51
$1b:bb68  53 dc		 eor ($dc,s),y
$1b:bb6a  d5 7e		 cmp $7e,x
$1b:bb6c  b5 47		 lda $47,x
$1b:bb6e  8d 47 f2	  sta $f247
$1b:bb71  ca			dex
$1b:bb72  40			rti
$1b:bb73  9e c5 a3	  stz $a3c5,x
$1b:bb76  d1 6a		 cmp ($6a),y
$1b:bb78  3d 5a 7b	  and $7b5a,x
$1b:bb7b  96 af		 stx $af,y
$1b:bb7d  d5 a8		 cmp $a8,x
$1b:bb7f  f1 68		 sbc ($68),y
$1b:bb81  fc 33 d8	  jsr ($d833,x)
$1b:bb84  ef 48 a7 ba   sbc $baa748
$1b:bb88  28			plp
$1b:bb89  f9 2e f0	  sbc $f02e,y
$1b:bb8c  5c 48 40 1c   jml $1c4048
$1b:bb90  0a			asl a
$1b:bb91  b3 fc		 lda ($fc,s),y
$1b:bb93  49 47 12	  eor #$1247
$1b:bb96  92 54		 sta ($54)
$1b:bb98  a4 98		 ldy $98
$1b:bb9a  ee 6e 3b	  inc $3b6e
$1b:bb9d  9d 0e e6	  sta $e60e,x
$1b:bba0  c3 b9		 cmp $b9,s
$1b:bba2  d9 29 27	  cmp $2729,y
$1b:bba5  4a			lsr a
$1b:bba6  49 4e e7	  eor #$e74e
$1b:bba9  c4 bd		 cpy $bd
$1b:bbab  f4 ee fe	  pea $feee
$1b:bbae  4b			phk
$1b:bbaf  df 52 f7 c3   cmp $c3f752,x
$1b:bbb3  b9 fd 21	  lda $21fd,y
$1b:bbb6  40			rti
$1b:bbb7  77 e2		 adc [$e2],y
$1b:bbb9  90 41		 bcc $bbfc
$1b:bbbb  79 be 00	  adc $00be,y
$1b:bbbe  60			rts
$1b:bbbf  5d e1 bc	  eor $bce1,x
$1b:bbc2  8d 90 60	  sta $6090
$1b:bbc5  18			clc
$1b:bbc6  a8			tay
$1b:bbc7  a5 62		 lda $62
$1b:bbc9  29 e8 8a	  and #$8ae8
$1b:bbcc  77 62		 adc [$62],y
$1b:bbce  9d 88 a7	  sta $a788,x
$1b:bbd1  73 29		 adc ($29,s),y
$1b:bbd3  8a			txa
$1b:bbd4  ca			dex
$1b:bbd5  56 32		 lsr $32,x
$1b:bbd7  48			pha
$1b:bbd8  40			rti
$1b:bbd9  9e c4 a3	  stz $a3c4,x
$1b:bbdc  d1 2a		 cmp ($2a),y
$1b:bbde  3d 4a 7b	  and $7b4a,x
$1b:bbe1  92 af		 sta ($af)
$1b:bbe3  d4 a8		 pei ($a8)
$1b:bbe5  f1 26		 sbc ($26),y
$1b:bbe7  f0 45		 beq $bc2e
$1b:bbe9  4d e3 05	  eor $05e3
$1b:bbec  39 84 3b	  and $3b84,y
$1b:bbef  14 77		 trb $77
$1b:bbf1  1f 44 3b d3   ora $d33b44,x
$1b:bbf5  0e ec 43	  asl $43ec
$1b:bbf8  bb			tyx
$1b:bbf9  38			sec
$1b:bbfa  ec 52 0c	  cpx $0c52
$1b:bbfd  29 d8 b4	  and #$b4d8
$1b:bc00  08			php
$1b:bc01  21 c4		 and ($c4,x)
$1b:bc03  fc 48 80	  jsr ($8048,x)
$1b:bc06  3e 02 20	  rol $2002,x
$1b:bc09  10 02		 bpl $bc0d
$1b:bc0b  7b			tdc
$1b:bc0c  5e d9 ec	  lsr $ecd9,x
$1b:bc0f  7d 69 73	  adc $7369,x
$1b:bc12  f5 29		 sbc $29,x
$1b:bc14  42 25		 wdm #$25
$1b:bc16  62 89 58	  per $14a2
$1b:bc19  e2 57		 sep #$57
$1b:bc1b  25 79		 and $79
$1b:bc1d  ae 0e a4	  ldx $a40e
$1b:bc20  be 0b 13	  ldx $130b,y
$1b:bc23  04 56		 tsb $56
$1b:bc25  80 b4		 bra $bbdb
$1b:bc27  0b			phd
$1b:bc28  22 cc 6e 95   jsl $956ecc
$1b:bc2c  26 50		 rol $50
$1b:bc2e  5c ea 57 46   jml $4657ea
$1b:bc32  88			dey
$1b:bc33  44 ac d1	  mvp $d1,$ac
$1b:bc36  2b			pld
$1b:bc37  2c 4a ed	  bit $ed4a
$1b:bc3a  12 ba		 ora ($ba)
$1b:bc3c  d4 9b		 pei ($9b)
$1b:bc3e  41 66		 eor ($66,x)
$1b:bc40  a9 5d 5b	  lda #$5b5d
$1b:bc43  63 77		 adc $77,s
$1b:bc45  59 8a c8	  eor $c88a,y
$1b:bc48  1d 04 f0	  ora $f004,x
$1b:bc4b  46 b0		 lsr $b0
$1b:bc4d  3e 11 b0	  rol $b011,x
$1b:bc50  0d 80 6e	  ora $6e80
$1b:bc53  03 70		 ora $70,s
$1b:bc55  19 40 d8	  ora $d840,y
$1b:bc58  06 a0		 asl $a0
$1b:bc5a  5d aa 4e	  eor $4eaa,x
$1b:bc5d  20 b2 54	  jsr $54b2
$1b:bc60  81 c0		 sta ($c0,x)
$1b:bc62  d4 06		 pei ($06)
$1b:bc64  d0 2d		 bne $bc93
$1b:bc66  01 c8		 ora ($c8,x)
$1b:bc68  0f 61 6f 8b   ora $8b6f61
$1b:bc6c  48			pha
$1b:bc6d  1c 80 d2	  trb $d280
$1b:bc70  0b			phd
$1b:bc71  b8			clv
$1b:bc72  a4 16		 ldy $16
$1b:bc74  23 44		 and $44,s
$1b:bc76  8b			phb
$1b:bc77  5a			phy
$1b:bc78  05 e3		 ora $e3
$1b:bc7a  69 18 a0	  adc #$a018
$1b:bc7d  bc 6f 11	  ldy $116f,x
$1b:bc80  6b			rtl
$1b:bc81  c8			iny
$1b:bc82  bc 08 68	  ldy $6808,x
$1b:bc85  3f 28 a5 4a   and $4aa528,x
$1b:bc89  a9 52 ca	  lda #$ca52
$1b:bc8c  54 ba 95	  mvn $95,$ba
$1b:bc8f  28			plp
$1b:bc90  b4 de		 ldy $de,x
$1b:bc92  ad 37 2b	  lda $2b37
$1b:bc95  9c 9c be	  stz $be9c
$1b:bc98  19 63 10	  ora $1063,y
$1b:bc9b  c5 a5		 cmp $a5
$1b:bc9d  06 70		 asl $70
$1b:bc9f  cb			wai
$1b:bca0  1a			inc a
$1b:bca1  85 ae		 sta $ae
$1b:bca3  36 b6		 rol $b6,x
$1b:bca5  d8			cld
$1b:bca6  de d6 23	  dec $23d6,x
$1b:bca9  67 3b		 adc [$3b]
$1b:bcab  9b			txy
$1b:bcac  e0 af		 cpx #$af
$1b:bcae  48			pha
$1b:bcaf  31 63		 and ($63),y
$1b:bcb1  15 a9		 ora $a9,x
$1b:bcb3  16 15		 asl $15,x
$1b:bcb5  6c 44 59	  jmp ($5944)
$1b:bcb8  20 28 f0	  jsr $f028
$1b:bcbb  8f 55 23 db   sta $db2355
$1b:bcbf  18			clc
$1b:bcc0  f6 ca		 inc $ca,x
$1b:bcc2  3d b3 8f	  and $8fb3,x
$1b:bcc5  68			pla
$1b:bcc6  a3 da		 lda $da,s
$1b:bcc8  34 d9		 bit $d9,x
$1b:bcca  25 42		 and $42
$1b:bccc  ad 6f 48	  lda $486f
$1b:bccf  8d be 25	  sta $25be
$1b:bcd2  0e 89 53	  asl $5389
$1b:bcd5  a2 55		 ldx #$55
$1b:bcd7  c8			iny
$1b:bcd8  95 32		 sta $32,x
$1b:bcda  a4 b2		 ldy $b2
$1b:bcdc  08			php
$1b:bcdd  7c 4a 9f	  jmp ($9f4a,x)
$1b:bce0  12 af		 ora ($af)
$1b:bce2  ac c6 bb	  ldy $bbc6
$1b:bce5  92 ae		 sta ($ae)
$1b:bce7  64 ab		 stz $ab
$1b:bce9  b1 2a		 lda ($2a),y
$1b:bceb  f2 f4		 sbc ($f4)
$1b:bced  32 55		 and ($55)
$1b:bcef  ec 92 f8	  cpx $f892
$1b:bcf2  27 8c		 and [$8c]
$1b:bcf4  10 89		 bpl $bc7f
$1b:bcf6  53 62		 eor ($62,s),y
$1b:bcf8  5a			phy
$1b:bcf9  96 38		 stx $38,y
$1b:bcfb  54 a7 95	  mvn $95,$a7
$1b:bcfe  2d 4d 4a	  and $4a4d
$1b:bd01  9b			txy
$1b:bd02  56 e7		 lsr $e7,x
$1b:bd04  c4 bd		 cpy $bd
$1b:bd06  f5 6e		 sbc $6e,x
$1b:bd08  fe 4b df	  inc $df4b,x
$1b:bd0b  52 f7		 eor ($f7)
$1b:bd0d  c5 b9		 cmp $b9
$1b:bd0f  fd 27 40	  sbc $4027,x
$1b:bd12  39 01 68	  and $6801,y
$1b:bd15  11 c8		 ora ($c8),y
$1b:bd17  94 7a		 sty $7a,x
$1b:bd19  25 47		 and $47
$1b:bd1b  89 47 59	  bit #$5947
$1b:bd1e  a1 52		 lda ($52,x)
$1b:bd20  7b			tdc
$1b:bd21  04 7e		 tsb $7e
$1b:bd23  25 38		 and $38
$1b:bd25  a9 4e 1e	  lda #$1e4e
$1b:bd28  a0 fb		 ldy #$fb
$1b:bd2a  1a			inc a
$1b:bd2b  72 dc		 adc ($dc)
$1b:bd2d  69 ad d0	  adc #$d0ad
$1b:bd30  89 54 c1	  bit #$c154
$1b:bd33  e1 1e		 sbc ($1e,x)
$1b:bd35  ab			plb
$1b:bd36  47 aa		 eor [$aa]
$1b:bd38  e8			inx
$1b:bd39  71 d7		 adc ($d7),y
$1b:bd3b  21 c7		 and ($c7,x)
$1b:bd3d  7d 16 e6	  adc $e616,x
$1b:bd40  c5 b9		 cmp $b9
$1b:bd42  d9 29 27	  cmp $2729,y
$1b:bd45  4a			lsr a
$1b:bd46  49 12 92	  eor #$9212
$1b:bd49  54 a4 99	  mvn $99,$a4
$1b:bd4c  6e 6e 5b	  ror $5b6e
$1b:bd4f  9d 14 ec	  sta $ec14,x
$1b:bd52  45 3b		 eor $3b
$1b:bd54  31 4f		 and ($4f),y
$1b:bd56  44 53 d2	  mvp $d2,$53
$1b:bd59  2f 1e d8 cc   and $ccd81e
$1b:bd5d  7d 62 f3	  adc $f362,x
$1b:bd60  f5 0f		 sbc $0f,x
$1b:bd62  4c 74 04	  jmp $0474
$1b:bd65  42 c5		 wdm #$c5
$1b:bd67  13 c4		 ora ($c4,s),y
$1b:bd69  68			pla
$1b:bd6a  9d 9c a6	  sta $a69c,x
$1b:bd6d  28			plp
$1b:bd6e  b6 15		 ldx $15,y
$1b:bd70  4c 58 c4	  jmp $c458
$1b:bd73  0b			phd
$1b:bd74  e2 36		 sep #$36
$1b:bd76  23 00		 and $00,s
$1b:bd78  0d 03 17	  ora $1703
$1b:bd7b  10 cc		 bpl $bd49
$1b:bd7d  54 33 06	  mvn $06,$33
$1b:bd80  f2 c8		 sbc ($c8)
$1b:bd82  66 4e		 ror $4e
$1b:bd84  e1 10		 sbc ($10,x)
$1b:bd86  3d 0c 5b	  and $5b0c,x
$1b:bd89  13 56		 ora ($56,s),y
$1b:bd8b  c4 84		 cpy $84
$1b:bd8d  c6 ac		 dec $ac
$1b:bd8f  7f 1b 78 4c   adc $4c781b,x
$1b:bd93  76 03		 ror $03,x
$1b:bd95  75 ed		 adc $ed,x
$1b:bd97  0b			phd
$1b:bd98  d4 8c		 pei ($8c)
$1b:bd9a  65 b1		 adc $b1
$1b:bd9c  a8			tay
$1b:bd9d  93 c5		 sta ($c5,s),y
$1b:bd9f  4c 03 c6	  jmp $c603
$1b:bda2  1a			inc a
$1b:bda3  05 08		 ora $08
$1b:bda5  5e 6b 60	  lsr $606b,x
$1b:bda8  1b			tcs
$1b:bda9  12 d8		 ora ($d8)
$1b:bdab  06 84		 asl $84
$1b:bdad  b6 01		 ldx $01,y
$1b:bdaf  93 10		 sta ($10,s),y
$1b:bdb1  8a			txa
$1b:bdb2  5f 12 b2 44   eor $44b212,x
$1b:bdb6  ad 71 2b	  lda $2b71
$1b:bdb9  a4 4a		 ldy $4a
$1b:bdbb  f6 5f		 inc $5f,x
$1b:bdbd  3a			dec a
$1b:bdbe  09 14		 ora #$14
$1b:bdc0  cc 00 44	  cpy $4400
$1b:bdc3  0a			asl a
$1b:bdc4  0c 4a 1c	  tsb $1c4a
$1b:bdc7  07 08		 ora [$08]
$1b:bdc9  95 72		 sta $72,x
$1b:bdcb  2d cc 04	  and $04cc
$1b:bdce  8c 3e ad	  sty $ad3e
$1b:bdd1  cc 89 57	  cpy $5789
$1b:bdd4  f2 55		 sbc ($55)
$1b:bdd6  cc b3 f0	  cpy $f0b3
$1b:bdd9  23 d1		 and $d1,s
$1b:bddb  2a			rol a
$1b:bddc  3f 5b 99 92   and $92995b,x
$1b:bde0  af d4 a8 f1   lda $f1a8d4
$1b:bde4  28			plp
$1b:bde5  ff 5a 7f 96   sbc $967f5a,x
$1b:bde9  9f d5 a7 f1   sta $f1a7d5,x
$1b:bded  69 fc		 adc #$fc
$1b:bdef  3b			tsc
$1b:bdf0  99 4e e6	  sta $e64e,y
$1b:bdf3  63 b9		 adc $b9,s
$1b:bdf5  9c ee 64	  stz $64ee
$1b:bdf8  4a			lsr a
$1b:bdf9  dc 1f 48	  jml [$481f]
$1b:bdfc  34 04		 bit $04,x
$1b:bdfe  4e 91 48	  lsr $4891
$1b:be01  54 52 17	  mvn $17,$52
$1b:be04  14 8d		 trb $8d
$1b:be06  45 23		 eor $23
$1b:be08  71 68		 adc ($68),y
$1b:be0a  94 5a		 sty $5a,x
$1b:be0c  27 16		 and [$16]
$1b:be0e  86 45		 stx $45
$1b:be10  a1 b1		 lda ($b1,x)
$1b:be12  48			pha
$1b:be13  64 50		 stz $50
$1b:be15  7c 71 6c	  jmp ($6c71,x)
$1b:be18  d4 5b		 pei ($5b)
$1b:be1a  37 16		 and [$16],y
$1b:be1c  d5 45		 cmp $45,x
$1b:be1e  b5 71		 lda $71,x
$1b:be20  6d d4 5b	  adc $5bd4
$1b:be23  77 16		 adc [$16],y
$1b:be25  e5 45		 sbc $45
$1b:be27  b9 71 48	  lda $4871,y
$1b:be2a  15 53		 ora $53,x
$1b:be2c  71 14		 adc ($14),y
$1b:be2e  8b			phb
$1b:be2f  45 20		 eor $20
$1b:be31  c5 72		 cmp $72
$1b:be33  2c 8c 0a	  bit $0a8c
$1b:be36  31 cc		 and ($cc),y
$1b:be38  ac 73 33	  ldy $3373
$1b:be3b  1c ce c7	  trb $c7ce
$1b:be3e  31 ce		 and ($ce),y
$1b:be40  34 07		 bit $07,x
$1b:be42  58			cli
$1b:be43  d2 22		 cmp ($22)
$1b:be45  54 43 b8	  mvn $b8,$43
$1b:be48  57 ab		 eor [$ab],y
$1b:be4a  31 e3		 and ($e3),y
$1b:be4c  e0 55		 cpx #$55
$1b:be4e  23 dc		 and $dc,s
$1b:be50  38			sec
$1b:be51  f6 ca		 inc $ca,x
$1b:be53  3d 55 8f	  and $8f55,x
$1b:be56  68			pla
$1b:be57  90 a2		 bcc $bdfb
$1b:be59  84 1a		 sty $1a
$1b:be5b  b6 22		 ldx $22,y
$1b:be5d  2d 88 87	  and $8788
$1b:be60  63 a9		 adc $a9,s
$1b:be62  d8			cld
$1b:be63  e4 78		 cpx $78
$1b:be65  55 ad		 eor $ad,x
$1b:be67  e9 30		 sbc #$30
$1b:be69  87 67		 sta [$67]
$1b:be6b  e2 56		 sep #$56
$1b:be6d  c8			iny
$1b:be6e  95 b6		 sta $b6,x
$1b:be70  25 7c		 and $7c
$1b:be72  89 5f		 bit #$5f
$1b:be74  62 58 c8	  per $86cf
$1b:be77  96 36		 stx $36,y
$1b:be79  25 9c		 and $9c
$1b:be7b  89 67		 bit #$67
$1b:be7d  69 c9		 adc #$c9
$1b:be7f  20 58 0a	  jsr $0a58
$1b:be82  bc 21 1f	  ldy $1f21,x
$1b:be85  ea			nop
$1b:be86  47 fb		 eor [$fb]
$1b:be88  11 fe		 ora ($fe),y
$1b:be8a  e4 7f		 cpx $7f
$1b:be8c  95 e1		 sta $e1,x
$1b:be8e  4e 4d 02	  lsr $024d
$1b:be91  48			pha
$1b:be92  2d f0 6f	  and $6ff0
$1b:be95  bd 1b ef	  lda $ef1b,x
$1b:be98  06 fc		 asl $fc
$1b:be9a  51 bf		 eor ($bf),y
$1b:be9c  10 6f		 bpl $bf0d
$1b:be9e  cd 1b f3	  cmp $f31b
$1b:bea1  06 fd		 asl $fd
$1b:bea3  51 bf		 eor ($bf),y
$1b:bea5  50 4f		 bvc $bef6
$1b:bea7  fd 13 ff	  sbc $ff13,x
$1b:beaa  84 ff		 sty $ff
$1b:beac  f1 3f		 sbc ($3f),y
$1b:beae  f0 4f		 beq $beff
$1b:beb0  e5 13		 sbc $13
$1b:beb2  f9 84 fe	  sbc $fe84,y
$1b:beb5  71 3f		 adc ($3f),y
$1b:beb7  90 4f		 bcc $bf08
$1b:beb9  dd 13 f7	  cmp $f713,x
$1b:bebc  84 fd		 sty $fd
$1b:bebe  f1 3f		 sbc ($3f),y
$1b:bec0  60			rts
$1b:bec1  00 08		 brk #$08
$1b:bec3  81 40		 sta ($40,x)
$1b:bec5  1d e9 10	  ora $10e9,x
$1b:bec8  80 bd		 bra $be87
$1b:beca  d6 60		 dec $60,x
$1b:becc  ff 17 c3 4c   sbc $4cc317,x
$1b:bed0  41 63		 eor ($63,x)
$1b:bed2  40			rti
$1b:bed3  7b			tdc
$1b:bed4  88			dey
$1b:bed5  40			rti
$1b:bed6  9f 01 41 0b   sta $0b4101,x
$1b:beda  94 23		 sty $23,x
$1b:bedc  d9 08 f6	  cmp $f608,y
$1b:bedf  c2 3e		 rep #$3e
$1b:bee1  90 88		 bcc $be6b
$1b:bee3  e4 23		 cpx $23
$1b:bee5  57 08		 eor [$08],y
$1b:bee7  e4 c2		 cpx $c2
$1b:bee9  37 70		 and [$70],y
$1b:beeb  8e cc 40	  stx $40cc
$1b:beee  5e 00 00	  lsr $0000,x
$1b:bef1  08			php
$1b:bef2  10 00		 bpl $bef4
$1b:bef4  22 21 73 08   jsl $087321
$1b:bef8  14 80		 trb $80
$1b:befa  16 21		 asl $21,x
$1b:befc  82 06 04	  brl $c305
$1b:beff  86 21		 stx $21
$1b:bf01  d7 88		 cmp [$88],y
$1b:bf03  76 22		 ror $22,x
$1b:bf05  19 88 86	  ora $8688,y
$1b:bf08  86 21		 stx $21
$1b:bf0a  86 88		 stx $88
$1b:bf0c  68			pla
$1b:bf0d  22 19 62 a8   jsl $a86219
$1b:bf11  08			php
$1b:bf12  cc 48 5c	  cpy $5c48
$1b:bf15  b8			clv
$1b:bf16  46 a6		 lsr $a6
$1b:bf18  11 db		 ora ($db),y
$1b:bf1a  84 6e		 sty $6e
$1b:bf1c  69 d0 aa	  adc #$aad0
$1b:bf1f  74 2e		 stz $2e,x
$1b:bf21  9d 1a a7	  sta $a71a,x
$1b:bf24  46 e1		 lsr $e1
$1b:bf26  d0 a8		 bne $bed0
$1b:bf28  74 2e		 stz $2e,x
$1b:bf2a  1d 1a 87	  ora $871a,x
$1b:bf2d  1d 82 0d	  ora $0d82,x
$1b:bf30  0e 83 c3	  asl $c383
$1b:bf33  a2 d0 e8	  ldx #$e8d0
$1b:bf36  bc 3a 8d	  ldy $8d3a,x
$1b:bf39  0e a3 c3	  asl $c3a3
$1b:bf3c  aa			tax
$1b:bf3d  d0 ea		 bne $bf29
$1b:bf3f  bc 3a 05	  ldy $053a,x
$1b:bf42  0e 81 c3	  asl $c381
$1b:bf45  a2 50 e8	  ldx #$e850
$1b:bf48  9c 3a 09	  stz $093a
$1b:bf4b  0e 82 c3	  asl $c382
$1b:bf4e  a2 90 e8	  ldx #$e890
$1b:bf51  ac 3a 45	  ldy $453a
$1b:bf54  0e 91 c3	  asl $c391
$1b:bf57  a6 50		 ldx $50
$1b:bf59  e9 9c 3a	  sbc #$3a9c
$1b:bf5c  49 0e 92	  eor #$920e
$1b:bf5f  c3 a6		 cmp $a6,s
$1b:bf61  90 e9		 bcc $bf4c
$1b:bf63  ad 3a 55	  lda $553a
$1b:bf66  4e 95 d3	  lsr $d395
$1b:bf69  a7 54		 lda [$54]
$1b:bf6b  e9 dc 3a	  sbc #$3adc
$1b:bf6e  55 0e		 eor $0e,x
$1b:bf70  95 c3		 sta $c3,x
$1b:bf72  a7 50		 lda [$50]
$1b:bf74  e5 b0		 sbc $b0
$1b:bf76  49 a1 d2	  eor #$d2a1
$1b:bf79  78			sei
$1b:bf7a  74 da		 stz $da,x
$1b:bf7c  1d 37 88	  ora $8837,x
$1b:bf7f  42 22		 wdm #$22
$1b:bf81  10 98		 bpl $bf1b
$1b:bf83  84 62		 sty $62
$1b:bf85  21 19		 and ($19,x)
$1b:bf87  a9 52 e1	  lda #$e152
$1b:bf8a  d4 98		 pei ($98)
$1b:bf8c  95 69		 sta $69,x
$1b:bf8e  56 34		 lsr $34,x
$1b:bf90  c8			iny
$1b:bf91  93 40		 sta ($40,s),y
$1b:bf93  26 71		 rol $71
$1b:bf95  2a			rol a
$1b:bf96  dc 3a 85	  jml [$853a]
$1b:bf99  0e a1 c3	  asl $c3a1
$1b:bf9c  aa			tax
$1b:bf9d  50 ea		 bvc $bf89
$1b:bf9f  9c 3a 89	  stz $893a
$1b:bfa2  0e a2 c3	  asl $c3a2
$1b:bfa5  aa			tax
$1b:bfa6  90 ea		 bcc $bf92
$1b:bfa8  a8			tay
$1b:bfa9  15 de		 ora $de,x
$1b:bfab  4b			phk
$1b:bfac  12 fa		 ora ($fa)
$1b:bfae  c4 be		 cpy $be
$1b:bfb0  d1 20		 cmp ($20),y
$1b:bfb2  18			clc
$1b:bfb3  44 e2 5f	  mvp $5f,$e2
$1b:bfb6  da			phx
$1b:bfb7  90 00		 bcc $bfb9
$1b:bfb9  22 91 24 f0   jsl $f02491
$1b:bfbd  52 1c		 eor ($1c)
$1b:bfbf  e3 58		 sbc $58,s
$1b:bfc1  87 56		 sta [$56]
$1b:bfc3  5c 23 4d 87   jml $874d23
$1b:bfc7  57 21		 eor [$21],y
$1b:bfc9  d5 dc		 cmp $dc,x
$1b:bfcb  75 7b		 adc $7b,x
$1b:bfcd  1c 1e 0a	  trb $0a1e
$1b:bfd0  76 3a		 ror $3a,x
$1b:bfd2  9b			txy
$1b:bfd3  8e ac 73	  stx $73ac
$1b:bfd6  84 01		 sty $01
$1b:bfd8  48			pha
$1b:bfd9  e7 53		 sbc [$53]
$1b:bfdb  93 81		 sta ($81,s),y
$1b:bfdd  14 87		 trb $87
$1b:bfdf  c5 23		 cmp $23
$1b:bfe1  d1 48		 cmp ($48),y
$1b:bfe3  f8			sed
$1b:bfe4  cc c6 04	  cpy $04c6
$1b:bfe7  30 29		 bmi $c012
$1b:bfe9  f4 52 7e	  pea $7e52
$1b:bfec  33 39		 and ($39,s),y
$1b:bfee  74 52		 stz $52,x
$1b:bff0  5e 2f 12	  lsr $122f,x
$1b:bff3  70 0d		 bvs $c002
$1b:bff5  02 be		 cop #$be
$1b:bff7  33 12		 and ($12,s),y
$1b:bff9  30 26		 bmi $c021
$1b:bffb  c2 9f		 rep #$9f
$1b:bffd  10 90		 bpl $bf8f
$1b:bfff  44 31 11	  mvp $11,$31
$1b:c002  08			php
$1b:c003  85 43		 sta $43
$1b:c005  13 10		 ora ($10,s),y
$1b:c007  cc 44 24	  cpy $2444
$1b:c00a  31 03		 and ($03),y
$1b:c00c  30 44		 bmi $c052
$1b:c00e  49 ea 46	  eor #$46ea
$1b:c011  22 d1 13 88   jsl $8813d1
$1b:c015  64 53		 stz $53
$1b:c017  91 ba		 sta ($ba),y
$1b:c019  ca			dex
$1b:c01a  7a			ply
$1b:c01b  11 d3		 ora ($d3),y
$1b:c01d  48			pha
$1b:c01e  74 21		 stz $21,x
$1b:c020  a6 d0		 ldx $d0
$1b:c022  2f 8a 50 0c   and $0c508a
$1b:c026  60			rts
$1b:c027  90 03		 bcc $c02c
$1b:c029  10 1a		 bpl $c045
$1b:c02b  08			php
$1b:c02c  c0 09 60	  cpy #$6009
$1b:c02f  31 81		 and ($81),y
$1b:c031  a0 33 24	  ldy #$2433
$1b:c034  f3 22		 sbc ($22,s),y
$1b:c036  21 18		 and ($18,x)
$1b:c038  09 88 42	  ora #$4288
$1b:c03b  09 c0 d5	  ora #$d5c0
$1b:c03e  65 03		 adc $03
$1b:c040  10 77		 bpl $c0b9
$1b:c042  8a			txa
$1b:c043  50 14		 bvc $c059
$1b:c045  8c fa 08	  sty $08fa
$1b:c048  ec 4a 79	  cpx $794a
$1b:c04b  12 9e		 ora ($9e)
$1b:c04d  c4 b7		 cpy $b7
$1b:c04f  d1 2d		 cmp ($2d),y
$1b:c051  fc 53 1d	  jsr ($1d53,x)
$1b:c054  14 c7		 trb $c7
$1b:c056  c5 33		 cmp $33
$1b:c058  d1 4c		 cmp ($4c),y
$1b:c05a  fc 4a e1	  jsr ($e14a,x)
$1b:c05d  52 b0		 eor ($b0)
$1b:c05f  44 b0 15	  mvp $15,$b0
$1b:c062  2b			pld
$1b:c063  84 49		 sty $49
$1b:c065  e0 0f 60	  cpx #$600f
$1b:c068  7a			ply
$1b:c069  06 02		 asl $02
$1b:c06b  24 f2		 bit $f2
$1b:c06d  07 90		 ora [$90]
$1b:c06f  3d 86 25	  and $2586,x
$1b:c072  62 89 58	  per $18fe
$1b:c075  f2 40		 sbc ($40)
$1b:c077  a0 04 00	  ldy #$0004
$1b:c07a  20 2e c0	  jsr $c02e
$1b:c07d  b0 89		 bcs $c008
$1b:c07f  59 a2 57	  eor $57a2,y
$1b:c082  58			cli
$1b:c083  95 d2		 sta $d2,x
$1b:c085  25 65		 and $65
$1b:c087  c9 5c e2	  cmp #$e25c
$1b:c08a  41 e0		 eor ($e0,x)
$1b:c08c  ba			tsx
$1b:c08d  64 84		 stz $84
$1b:c08f  41 73		 eor ($73,x)
$1b:c091  8b			phb
$1b:c092  59 df a1	  eor $a1df,y
$1b:c095  16 9b		 asl $9b,x
$1b:c097  45 ae		 eor $ae
$1b:c099  ef f0 7e 8b   sbc $8b7ef0
$1b:c09d  c0 46 a6	  cpy #$a646
$1b:c0a0  f8			sed
$1b:c0a1  38			sec
$1b:c0a2  96 40		 stx $40,y
$1b:c0a4  82 30 10	  brl $d0d7
$1b:c0a7  68			pla
$1b:c0a8  02 c4		 cop #$c4
$1b:c0aa  18			clc
$1b:c0ab  39 2b 26	  and $262b,y
$1b:c0ae  4b			phk
$1b:c0af  04 0b		 tsb $0b
$1b:c0b1  1b			tcs
$1b:c0b2  24 4a		 bit $4a
$1b:c0b4  a1 92		 lda ($92,x)
$1b:c0b6  b9 16 46	  lda $4616,y
$1b:c0b9  e6 5d		 inc $5d
$1b:c0bb  11 11		 ora ($11),y
$1b:c0bd  bc c2 2d	  ldy $2dc2,x
$1b:c0c0  68			pla
$1b:c0c1  8b			phb
$1b:c0c2  5e 22 d1	  lsr $d122,x
$1b:c0c5  77 99		 adc [$99],y
$1b:c0c7  8c 06 a5	  sty $a506
$1b:c0ca  90 7e		 bcc $c14a
$1b:c0cc  8c 04 ee	  sty $ee04
$1b:c0cf  0f 33 c9 44   ora $44c933
$1b:c0d3  b2 20		 lda ($20)
$1b:c0d5  74 03		 stz $03,x
$1b:c0d7  88			dey
$1b:c0d8  20 30 a9	  jsr $a930
$1b:c0db  11 c1		 ora ($c1),y
$1b:c0dd  54 8a c0	  mvn $c0,$8a
$1b:c0e0  1a			inc a
$1b:c0e1  0a			asl a
$1b:c0e2  8a			txa
$1b:c0e3  5c 44 02 21   jml $210244
$1b:c0e7  10 f0		 bpl $c0d9
$1b:c0e9  4b			phk
$1b:c0ea  4b			phk
$1b:c0eb  29 12 ca	  and #$ca12
$1b:c0ee  44 b2 75	  mvp $75,$b2
$1b:c0f1  2b			pld
$1b:c0f2  8c 4b 03	  sty $034b
$1b:c0f5  92 a8		 sta ($a8)
$1b:c0f7  c4 ac		 cpy $ac
$1b:c0f9  2b			pld
$1b:c0fa  91 c0		 sta ($c0),y
$1b:c0fc  d4 ac		 pei ($ac)
$1b:c0fe  3d 24 e0	  and $e024,x
$1b:c101  5c 57 e1 0e   jml $0ee157
$1b:c105  c0 53 ae	  cpy #$ae53
$1b:c108  10 ec		 bpl $c0f6
$1b:c10a  94 39		 sty $39,x
$1b:c10c  0c 1d 48	  tsb $481d
$1b:c10f  97 96		 sta [$96],y
$1b:c111  25 e4		 and $e4
$1b:c113  89 75 61	  bit #$6175
$1b:c116  d7 58		 cmp [$58],y
$1b:c118  75 d2		 adc $d2,x
$1b:c11a  1d 65 c7	  ora $c765,x
$1b:c11d  19 84 82	  ora $8284,y
$1b:c120  74 18		 stz $18,x
$1b:c122  b5 a4		 lda $a4,x
$1b:c124  32 11		 and ($11)
$1b:c126  6b			rtl
$1b:c127  c8			iny
$1b:c128  74 2a		 stz $2a,x
$1b:c12a  58			cli
$1b:c12b  18			clc
$1b:c12c  93 10		 sta ($10,s),y
$1b:c12e  16 82		 asl $82,x
$1b:c130  f5 17		 sbc $17,x
$1b:c132  91 bb		 sta ($bb),y
$1b:c134  c1 86		 cmp ($86,x)
$1b:c136  2c 40 c0	  bit $c040
$1b:c139  c3 b2		 cmp $b2,s
$1b:c13b  90 ec		 bcc $c129
$1b:c13d  9d 3a e3	  sta $e33a,x
$1b:c140  0e 78 03	  asl $0378
$1b:c143  50 62		 bvc $c1a7
$1b:c145  4d 01 8b	  eor $8b01
$1b:c148  4f b1 d7 20   eor $20d7b1
$1b:c14c  c8			iny
$1b:c14d  dc e2 12	  jml [$12e2]
$1b:c150  08			php
$1b:c151  84 36		 sty $36
$1b:c153  20 23 07	  jsr $0723
$1b:c156  30 5a		 bmi $c1b2
$1b:c158  a2 d6 b5	  ldx #$b5d6
$1b:c15b  99 53 b2	  sta $b253,y
$1b:c15e  14 e3		 trb $e3
$1b:c160  40			rti
$1b:c161  4f 85 e0 c7   eor $c7e085
$1b:c165  08			php
$1b:c166  70 d8		 bvs $c140
$1b:c168  32 11		 and ($11)
$1b:c16a  68			pla
$1b:c16b  f8			sed
$1b:c16c  5c 21 cc 60   jml $60cc21
$1b:c170  63 00		 adc $00,s
$1b:c172  b8			clv
$1b:c173  2c 31 69	  bit $6931
$1b:c176  78			sei
$1b:c177  2c 08 e1	  bit $e108
$1b:c17a  d0 c4		 bne $c140
$1b:c17c  c4 33		 cpy $33
$1b:c17e  11 0a		 ora ($0a),y
$1b:c180  04 43		 tsb $43
$1b:c182  33 4e		 and ($4e,s),y
$1b:c184  b2 36		 lda ($36)
$1b:c186  40			rti
$1b:c187  66 36		 ror $36
$1b:c189  48			pha
$1b:c18a  a5 fa		 lda $fa
$1b:c18c  29 6e 30	  and #$306e
$1b:c18f  89 80 0c	  bit #$0c80
$1b:c192  01 6f		 ora ($6f,x)
$1b:c194  30 8d		 bmi $c123
$1b:c196  fe 21 01	  inc $0121,x
$1b:c199  88			dey
$1b:c19a  54 4d e2	  mvn $e2,$4d
$1b:c19d  74 41		 stz $41,x
$1b:c19f  10 1d		 bpl $c1be
$1b:c1a1  0a			asl a
$1b:c1a2  a0 7f 4c	  ldy #$4c7f
$1b:c1a5  81 c8		 sta ($c8,x)
$1b:c1a7  90 c8		 bcc $c171
$1b:c1a9  54 04 10	  mvn $10,$04
$1b:c1ac  4c 22 14	  jmp $1422
$1b:c1af  a4 5a		 ldy $5a
$1b:c1b1  22 cd 3c 88   jsl $883ccd
$1b:c1b5  83 e8		 sta $e8,s
$1b:c1b7  1f 12 3a a7   ora $a73a12,x
$1b:c1bb  45 09		 eor $09
$1b:c1bd  22 45 0c 6c   jsl $6c0c45
$1b:c1c1  33 4a		 and ($4a,s),y
$1b:c1c3  12 50		 ora ($50)
$1b:c1c5  8e 01 41	  stx $4101
$1b:c1c8  60			rts
$1b:c1c9  85 42		 sta $42
$1b:c1cb  5a			phy
$1b:c1cc  9f 2e 84 c1   sta $c1842e,x
$1b:c1d0  c6 0d		 dec $0d
$1b:c1d2  f3 39		 sbc ($39,s),y
$1b:c1d4  0d 4b 01	  ora $014b
$1b:c1d7  52 b8		 eor ($b8)
$1b:c1d9  44 ac 6e	  mvp $6e,$ac
$1b:c1dc  f0 89		 beq $c167
$1b:c1de  5c 1e a2 32   jml $32a21e
$1b:c1e2  0b			phd
$1b:c1e3  cc 4a e7	  cpy $e74a
$1b:c1e6  12 ba		 ora ($ba)
$1b:c1e8  0a			asl a
$1b:c1e9  c3 24		 cmp $24,s
$1b:c1eb  00 0b		 brk #$0b
$1b:c1ed  14 4b		 trb $4b
$1b:c1ef  09 92 c2	  ora #$c292
$1b:c1f2  44 b2 a0	  mvp $a0,$b2
$1b:c1f5  d1 b8		 cmp ($b8),y
$1b:c1f7  8a			txa
$1b:c1f8  ca			dex
$1b:c1f9  21 6d		 and ($6d,x)
$1b:c1fb  0b			phd
$1b:c1fc  8d f4 36	  sta $36f4
$1b:c1ff  25 40		 and $40
$1b:c201  6d 00 80	  adc $8000
$1b:c204  93 00		 sta ($00,s),y
$1b:c206  e4 07		 cpx $07
$1b:c208  61 6c		 adc ($6c,x)
$1b:c20a  6a			ror a
$1b:c20b  5b			tcd
$1b:c20c  0a			asl a
$1b:c20d  97 06		 sta [$06],y
$1b:c20f  a5 c0		 lda $c0
$1b:c211  a9 74 6a	  lda #$6a74
$1b:c214  5d 0a 97	  eor $970a,x
$1b:c217  86 a5		 stx $a5
$1b:c219  e0 89 74	  cpx #$7489
$1b:c21c  22 5d 18 90   jsl $90185d
$1b:c220  f8			sed
$1b:c221  3c 31 2d	  bit $2d31,x
$1b:c224  84 4b		 sty $4b
$1b:c226  63 12		 adc $12,s
$1b:c228  e0 44 86	  cpx #$8644
$1b:c22b  80 32		 bra $c25f
$1b:c22d  0f 80 d4 78   ora $78d480
$1b:c231  31 2f		 and ($2f),y
$1b:c233  81 1c		 sta ($1c,x)
$1b:c235  4a			lsr a
$1b:c236  c1 c0		 cmp ($c0,x)
$1b:c238  8b			phb
$1b:c239  5f a2 d6 e8   eor $e8d6a2,x
$1b:c23d  b5 b2		 lda $b2,x
$1b:c23f  2d 7c 2f	  and $2f7c
$1b:c242  8d bc c6	  sta $c6bc
$1b:c245  30 c1		 bmi $c208
$1b:c247  88			dey
$1b:c248  8c 00 a8	  sty $a800
$1b:c24b  23 91		 and $91,s
$1b:c24d  1c 07 80	  trb $8007
$1b:c250  76 04		 ror $04,x
$1b:c252  11 20		 ora ($20),y
$1b:c254  01 18		 ora ($18,x)
$1b:c256  07 c0		 ora [$c0]
$1b:c258  4a			lsr a
$1b:c259  02 d1		 cop #$d1
$1b:c25b  c0 a0 11	  cpy #$11a0
$1b:c25e  2d a2 3c	  and $3ca2
$1b:c261  78			sei
$1b:c262  95 2d		 sta $2d,x
$1b:c264  a5 0a		 lda $0a
$1b:c266  01 52		 ora ($52,x)
$1b:c268  e2 26		 sep #$26
$1b:c26a  42 29		 wdm #$29
$1b:c26c  7e 8a 5b	  ror $5b8a,x
$1b:c26f  a2 96 f8	  ldx #$f896
$1b:c272  a5 fd		 lda $fd
$1b:c274  3e 38 35	  rol $3538,x
$1b:c277  08			php
$1b:c278  98			tya
$1b:c279  03 57		 ora $57,s
$1b:c27b  16 e4		 asl $e4,x
$1b:c27d  c5 b7		 cmp $b7
$1b:c27f  71 6e		 adc ($6e),y
$1b:c281  cc 5b b7	  cpy $b75b
$1b:c284  52 ed		 eor ($ed)
$1b:c286  2b			pld
$1b:c287  c2 a5		 rep #$a5
$1b:c289  aa			tax
$1b:c28a  a9 72 aa	  lda #$aa72
$1b:c28d  cb			wai
$1b:c28e  c0 ed 55	  cpy #$55ed
$1b:c291  b7 71		 lda [$71],y
$1b:c293  2d 34 4b	  and $4b34
$1b:c296  4e 8f 04	  lsr $048f
$1b:c299  79 0f c7	  adc $c70f,y
$1b:c29c  8a			txa
$1b:c29d  43 01		 eor $01,s
$1b:c29f  78			sei
$1b:c2a0  ed 06 63	  sbc $6306
$1b:c2a3  c5 8a		 cmp $8a
$1b:c2a5  6c 94 23	  jmp ($2394)
$1b:c2a8  c2 4f		 rep #$4f
$1b:c2aa  8a			txa
$1b:c2ab  80 36		 bra $c2e3
$1b:c2ad  6a			ror a
$1b:c2ae  11 e1		 ora ($e1),y
$1b:c2b0  c5 b9		 cmp $b9
$1b:c2b2  71 6d		 adc ($6d),y
$1b:c2b4  4a			lsr a
$1b:c2b5  dc 22 db	  jml [$db22]
$1b:c2b8  95 98		 sta $98,x
$1b:c2ba  54 b7 4e	  mvn $4e,$b7
$1b:c2bd  f0 5f		 beq $c31e
$1b:c2bf  82 f4 2a	  brl $edb6
$1b:c2c2  cf c0 dd 55   cmp $55ddc0
$1b:c2c6  bb			tyx
$1b:c2c7  71 2d		 adc ($2d),y
$1b:c2c9  43 1c		 eor $1c,s
$1b:c2cb  19 67 b5	  ora $b567,y
$1b:c2ce  20 8b 50	  jsr $508b
$1b:c2d1  07 80		 ora [$80]
$1b:c2d3  32 0d		 and ($0d)
$1b:c2d5  a8			tay
$1b:c2d6  d4 5b		 pei ($5b)
$1b:c2d8  c9 a4 52	  cmp #$52a4
$1b:c2db  9b			txy
$1b:c2dc  a8			tay
$1b:c2dd  14 80		 trb $80
$1b:c2df  ee 0f 5a	  inc $5a0f
$1b:c2e2  c4 70		 cpy $70
$1b:c2e4  62 f1 f5	  per $b8d8
$1b:c2e7  55 bd		 eor $bd,x
$1b:c2e9  46 11		 lsr $11
$1b:c2eb  bf 2f c7 d6   lda $d6c72f,x
$1b:c2ef  41 03		 eor ($03,x)
$1b:c2f1  08			php
$1b:c2f2  54 b4 d5	  mvn $d5,$b4
$1b:c2f5  2d 40 2d	  and $2d40
$1b:c2f8  5a			phy
$1b:c2f9  4c 1a 06	  jmp $061a
$1b:c2fc  e0 c4 30	  cpx #$30c4
$1b:c2ff  d1 0c		 cmp ($0c),y
$1b:c301  4c 43 4b	  jmp $4b43
$1b:c304  10 d0		 bpl $c2d6
$1b:c306  c4 31		 cpy $31
$1b:c308  11 0c		 ora ($0c),y
$1b:c30a  3c 43 e3	  bit $e343,x
$1b:c30d  10 cb		 bpl $c2da
$1b:c30f  ac c5 60	  ldy $60c5
$1b:c312  0f 00 dd b0   ora $b0dd00
$1b:c316  42 ad		 wdm #$ad
$1b:c318  c9 62 85	  cmp #$8562
$1b:c31b  5b			tcd
$1b:c31c  b3 14		 lda ($14,s),y
$1b:c31e  f4 d5 3d	  pea $3dd5
$1b:c321  2a			rol a
$1b:c322  b2 89		 lda ($89)
$1b:c324  0c 06 25	  tsb $2506
$1b:c327  f1 43		 sbc ($43),y
$1b:c329  80 fc		 bra $c327
$1b:c32b  22 5f 24 88   jsl $88245f
$1b:c32f  e6 4c		 inc $4c
$1b:c331  e1 d0		 sbc ($d0,x)
$1b:c333  cb			wai
$1b:c334  44 33 1d	  mvp $1d,$33
$1b:c337  0c 34 4b	  tsb $4b34
$1b:c33a  47 0e		 eor [$0e]
$1b:c33c  a4 c4		 ldy $c4
$1b:c33e  b4 50		 ldy $50,x
$1b:c340  e9 a4 3a	  sbc #$3aa4
$1b:c343  99 52 50	  sta $5052,y
$1b:c346  04 ce		 tsb $ce
$1b:c348  a5 a2		 lda $a2
$1b:c34a  79 8b c0	  adc $c08b,y
$1b:c34d  0e 41 db	  asl $db41
$1b:c350  00 85		 brk #$85
$1b:c352  5b			tcd
$1b:c353  52 05		 eor ($05)
$1b:c355  0a			asl a
$1b:c356  b6 e6		 ldx $e6,y
$1b:c358  21 ea		 and ($ea,x)
$1b:c35a  a8			tay
$1b:c35b  7a			ply
$1b:c35c  93 61		 sta ($61,s),y
$1b:c35e  10 cc		 bpl $c32c
$1b:c360  a1 c7		 lda ($c7,x)
$1b:c362  56 8b		 lsr $8b,x
$1b:c364  23 b8		 and $b8,s
$1b:c366  24 57		 bit $57
$1b:c368  af 10 ec 30   lda $30ec10
$1b:c36c  ca			dex
$1b:c36d  a5 2a		 lda $2a
$1b:c36f  a9 4a ea	  lda #$ea4a
$1b:c372  53 aa		 eor ($aa,s),y
$1b:c374  94 ee		 sty $ee,x
$1b:c376  25 2a		 and $2a
$1b:c378  89 4a e2	  bit #$e24a
$1b:c37b  53 a8		 eor ($a8,s),y
$1b:c37d  94 ec		 sty $ec,x
$1b:c37f  6a			ror a
$1b:c380  27 20		 and [$20]
$1b:c382  c1 8d		 cmp ($8d,x)
$1b:c384  40			rti
$1b:c385  ee 24 23	  inc $2324
$1b:c388  88			dey
$1b:c389  7a			ply
$1b:c38a  6a			ror a
$1b:c38b  1e 96 19	  asl $1996,x
$1b:c38e  f5 a2		 sbc $a2,x
$1b:c390  5b			tcd
$1b:c391  08			php
$1b:c392  97 9a		 sta [$9a],y
$1b:c394  25 c0		 and $c0
$1b:c396  a9 6c 2a	  lda #$2a6c
$1b:c399  5d 6a 90	  eor $906a,x
$1b:c39c  38			sec
$1b:c39d  3c c6 71	  bit $71c6,x
$1b:c3a0  31 07		 and ($07),y
$1b:c3a2  9e 21 e8	  stz $e821,x
$1b:c3a5  89 49 a2	  bit #$a249
$1b:c3a8  52 78		 eor ($78)
$1b:c3aa  94 da		 sty $da,x
$1b:c3ac  25 37		 and $37
$1b:c3ae  89 41 a2	  bit #$a241
$1b:c3b1  50 78		 bvc $c42b
$1b:c3b3  94 5a		 sty $5a,x
$1b:c3b5  25 17		 and $17
$1b:c3b7  89 74 a2	  bit #$a274
$1b:c3ba  5d 38 97	  eor $9738,x
$1b:c3bd  8a			txa
$1b:c3be  25 e3		 and $e3
$1b:c3c0  89 75 22	  bit #$2275
$1b:c3c3  5d 58 97	  eor $9758,x
$1b:c3c6  92 25		 sta ($25)
$1b:c3c8  e5 81		 sbc $81
$1b:c3ca  40			rti
$1b:c3cb  00 e0		 brk #$e0
$1b:c3cd  3f 1f 30 44   and $44301f,x
$1b:c3d1  28			plp
$1b:c3d2  50 00		 bvc $c3d4
$1b:c3d4  a8			tay
$1b:c3d5  12 42		 ora ($42)
$1b:c3d7  21 b7		 and ($b7,x)
$1b:c3d9  6c 8a 68	  jmp ($688a)
$1b:c3dc  1a			inc a
$1b:c3dd  c5 b8		 cmp $b8
$1b:c3df  4d 9c 0a	  eor $0a9c
$1b:c3e2  25 03		 and $03
$1b:c3e4  89 18 c2	  bit #$c218
$1b:c3e7  27 12		 and [$12]
$1b:c3e9  82 44 a0	  brl $6430
$1b:c3ec  b1 28		 lda ($28),y
$1b:c3ee  a4 4a		 ldy $4a
$1b:c3f0  2a			rol a
$1b:c3f1  37 11		 and [$11],y
$1b:c3f3  b0 0f		 bcs $c404
$1b:c3f5  00 74		 brk #$74
$1b:c3f7  03 40		 ora $40,s
$1b:c3f9  1d 00 e0	  ora $e000,x
$1b:c3fc  3c a7 b3	  bit $b3a7,x
$1b:c3ff  f2 54		 sbc ($54)
$1b:c401  8e 48 32	  stx $3248
$1b:c404  0f 2c 43 0c   ora $0c432c
$1b:c408  19 1e 38	  ora $381e,y
$1b:c40b  74 02		 stz $02,x
$1b:c40d  e1 d0		 sbc ($d0,x)
$1b:c40f  2a			rol a
$1b:c410  00 70		 brk #$70
$1b:c412  39 11 29	  and $2911,y
$1b:c415  14 4a		 trb $4a
$1b:c417  47 12		 eor [$12]
$1b:c419  99 44 a6	  sta $a644,y
$1b:c41c  71 29		 adc ($29),y
$1b:c41e  24 4a		 bit $4a
$1b:c420  4b			phk
$1b:c421  12 9a		 ora ($9a)
$1b:c423  44 a6 b1	  mvp $b1,$a6
$1b:c426  28			plp
$1b:c427  8f 48 d8 10   sta $10d848
$1b:c42b  15 78		 ora $78,x
$1b:c42d  99 82 20	  sta $2082,y
$1b:c430  b9 18 0c	  lda $0c18,y
$1b:c433  3a			dec a
$1b:c434  87 16		 sta [$16]
$1b:c436  d6 c3		 dec $c3,x
$1b:c438  ab			plb
$1b:c439  90 ea		 bcc $c425
$1b:c43b  ed 5b 59	  sbc $595b
$1b:c43e  16 d6		 asl $d6,x
$1b:c440  53 aa		 eor ($aa,s),y
$1b:c442  ec b0 0b	  cpx $0bb0
$1b:c445  9f c6 21 a1   sta $a121c6,x
$1b:c449  0b			phd
$1b:c44a  8e 81 a6	  stx $a681
$1b:c44d  51 2a		 eor ($2a),y
$1b:c44f  14 4a		 trb $4a
$1b:c451  87 12		 sta [$12]
$1b:c453  a9 44 aa	  lda #$aa44
$1b:c456  71 2a		 adc ($2a),y
$1b:c458  24 4a		 bit $4a
$1b:c45a  8b			phb
$1b:c45b  12 aa		 ora ($aa)
$1b:c45d  44 aa b1	  mvp $b1,$aa
$1b:c460  08			php
$1b:c461  0d 40 34	  ora $3440
$1b:c464  01 80		 ora ($80,x)
$1b:c466  78			sei
$1b:c467  01 58		 ora ($58,x)
$1b:c469  20 2e f0	  jsr $f02e
$1b:c46c  c8			iny
$1b:c46d  62 21 de	  per $a291
$1b:c470  f8			sed
$1b:c471  74 1d		 stz $1d,x
$1b:c473  fe 31 78	  inc $7831,x
$1b:c476  87 3a		 sta [$3a]
$1b:c478  21 cf		 and ($cf,x)
$1b:c47a  03 9b		 ora $9b,s
$1b:c47c  60			rts
$1b:c47d  b3 0d		 lda ($0d,s),y
$1b:c47f  53 c3		 eor ($c3,s),y
$1b:c481  84 c7		 sty $c7
$1b:c483  2e 57 1e	  rol $1e57
$1b:c486  30 6c		 bmi $c4f4
$1b:c488  a2 5b 68	  ldx #$685b
$1b:c48b  97 46		 sta [$46],y
$1b:c48d  25 c5		 and $c5
$1b:c48f  89 78 7a	  bit #$7a78
$1b:c492  0f 84 0a 00   ora $000a84
$1b:c496  c8			iny
$1b:c497  0b			phd
$1b:c498  80 f4		 bra $c48e
$1b:c49a  18			clc
$1b:c49b  74 9a		 stz $9a,x
$1b:c49d  1d ee 87	  ora $87ee,x
$1b:c4a0  4d 88 21	  eor $2188
$1b:c4a3  10 ef		 bpl $c494
$1b:c4a5  44 3b f1	  mvp $f1,$3b
$1b:c4a8  0f 99 2c 52   ora $522c99
$1b:c4ac  04 9a		 tsb $9a
$1b:c4ae  07 c0		 ora [$c0]
$1b:c4b0  34 08		 bit $08,x
$1b:c4b2  6c 05 66	  jmp ($6605)
$1b:c4b5  6b			rtl
$1b:c4b6  06 2a		 asl $2a
$1b:c4b8  21 8b		 and ($8b,x)
$1b:c4ba  88			dey
$1b:c4bb  66 a2		 ror $a2
$1b:c4bd  19 b8 d7	  ora $d7b8,y
$1b:c4c0  32 35		 and ($35)
$1b:c4c2  cd 8d 77	  cmp $778d
$1b:c4c5  23 5d		 and $5d,s
$1b:c4c7  d8			cld
$1b:c4c8  d6 f2		 dec $f2,x
$1b:c4ca  35 bd		 and $bd,x
$1b:c4cc  3b			tsc
$1b:c4cd  99 c0 8f	  sta $8fc0,y
$1b:c4d0  02 07		 cop #$07
$1b:c4d2  32 40		 and ($40)
$1b:c4d4  c4 b5		 cpy $b5
$1b:c4d6  d1 2d		 cmp ($2d),y
$1b:c4d8  7c 4b 7d	  jmp ($7d4b,x)
$1b:c4db  12 df		 ora ($df)
$1b:c4dd  c5 b1		 cmp $b1
$1b:c4df  91 6c		 sta ($6c),y
$1b:c4e1  6c 5b 39	  jmp ($395b)
$1b:c4e4  16 ce		 asl $ce,x
$1b:c4e6  cc 2f 73	  cpy $732f
$1b:c4e9  0b			phd
$1b:c4ea  d5 c2		 cmp $c2,x
$1b:c4ec  e3 30		 sbc $30,s
$1b:c4ee  c0 92 cc	  cpy #$cc92
$1b:c4f1  98			tya
$1b:c4f2  35 2b		 and $2b,x
$1b:c4f4  1c 49 60	  trb $6049
$1b:c4f7  1f 35 98 46   ora $469835,x
$1b:c4fb  3f d5 8f f6   and $f68fd5,x
$1b:c4ff  63 fd		 adc $fd,s
$1b:c501  d8			cld
$1b:c502  ff 54 b6 15   sbc $15b654,x
$1b:c506  2d b5 4b	  and $4bb5
$1b:c509  81 52		 sta ($52,x)
$1b:c50b  e2 c1		 sep #$c1
$1b:c50d  be f4 6f	  ldx $6ff4,y
$1b:c510  bc 1b f1	  ldy $f11b,x
$1b:c513  46 fc		 lsr $fc
$1b:c515  41 bf		 eor ($bf,x)
$1b:c517  34 6f		 bit $6f,x
$1b:c519  cc 1b f5	  cpy $f51b
$1b:c51c  46 fd		 lsr $fd
$1b:c51e  41 3f		 eor ($3f,x)
$1b:c520  f4 4f fe	  pea $fe4f
$1b:c523  13 ff		 ora ($ff,s),y
$1b:c525  c4 ff		 cpy $ff
$1b:c527  c1 3f		 cmp ($3f,x)
$1b:c529  94 4f		 sty $4f,x
$1b:c52b  e6 13		 inc $13
$1b:c52d  f9 c4 fe	  sbc $fec4,y
$1b:c530  41 3f		 eor ($3f,x)
$1b:c532  74 4f		 stz $4f,x
$1b:c534  de 13 f7	  dec $f713,x
$1b:c537  c4 fd		 cpy $fd
$1b:c539  80 c5		 bra $c500
$1b:c53b  0e b6 4e	  asl $4eb6
$1b:c53e  2e d3 8c	  rol $8cd3
$1b:c541  04 e3		 tsb $e3
$1b:c543  15 38		 ora $38,x
$1b:c545  ce 4e 35	  dec $354e
$1b:c548  d3 8e		 cmp ($8e,s),y
$1b:c54a  04 e3		 tsb $e3
$1b:c54c  a5 38		 lda $38
$1b:c54e  f2 4e		 sbc ($4e)
$1b:c550  3e d3 88	  rol $88d3,x
$1b:c553  c4 e6		 cpy $e6
$1b:c555  55 39		 eor $39,x
$1b:c557  a6 4e		 ldx $4e
$1b:c559  6b			rtl
$1b:c55a  d3 9c		 cmp ($9c,s),y
$1b:c55c  04 e7		 tsb $e7
$1b:c55e  25 39		 and $39
$1b:c560  ce 4e 74	  dec $744e
$1b:c563  d3 9d		 cmp ($9d,s),y
$1b:c565  84 e7		 sty $e7
$1b:c567  a5 39		 lda $39
$1b:c569  f2 4e		 sbc ($4e)
$1b:c56b  60			rts
$1b:c56c  d3 a8		 cmp ($a8,s),y
$1b:c56e  c4 e8		 cpy $e8
$1b:c570  38			sec
$1b:c571  14 c9		 trb $c9
$1b:c573  d5 ba		 cmp $ba,x
$1b:c575  75 80		 adc $80,x
$1b:c577  9d 68 a7	  sta $a768,x
$1b:c57a  5b			tcd
$1b:c57b  49 d7 5a	  eor #$5ad7
$1b:c57e  75 e8		 adc $e8,x
$1b:c580  9d 7c a7	  sta $a77c,x
$1b:c583  50 49		 bvc $c5ce
$1b:c585  dd 5a 77	  cmp $775a,x
$1b:c588  70 9d		 bvs $c527
$1b:c58a  de a7 78	  dec $78a7,x
$1b:c58d  c9 df 7a	  cmp #$7adf
$1b:c590  77 f8		 adc [$f8],y
$1b:c592  9d c0 a7	  sta $a7c0,x
$1b:c595  91 49		 sta ($49),y
$1b:c597  e5 9a		 sbc $9a
$1b:c599  79 80 9e	  adc $9e80,y
$1b:c59c  68			pla
$1b:c59d  a7 9a		 lda [$9a]
$1b:c59f  c9 e6 da	  cmp #$dae6
$1b:c5a2  79 c8 9e	  adc $9ec8,y
$1b:c5a5  76 a7		 ror $a7,x
$1b:c5a7  9e c9 e7	  stz $e7c9,x
$1b:c5aa  fa			plx
$1b:c5ab  79 08 9e	  adc $9e08,y
$1b:c5ae  c4 a7		 cpy $a7
$1b:c5b0  b2 49		 lda ($49)
$1b:c5b2  ec da 7b	  cpx $7bda
$1b:c5b5  07 80		 ora [$80]
$1b:c5b7  17 0a		 ora [$0a],y
$1b:c5b9  91 3d		 sta ($3d),y
$1b:c5bb  ff ff cb 69   sbc $69cbff,x
$1b:c5bf  72 31		 adc ($31)
$1b:c5c1  3e 70 c4	  rol $c470,x
$1b:c5c4  30 32		 bmi $c5f8
$1b:c5c6  e0 c0 8c	  cpx #$8cc0
$1b:c5c9  02 79		 cop #$79
$1b:c5cb  4a			lsr a
$1b:c5cc  e9 d9 7f	  sbc #$7fd9
$1b:c5cf  df f3 58 22   cmp $2258f3,x
$1b:c5d3  d3 0e		 cmp ($0e,s),y
$1b:c5d5  76 34		 ror $34,x
$1b:c5d7  78			sei
$1b:c5d8  1c c9 3a	  trb $3ac9
$1b:c5db  9b			txy
$1b:c5dc  13 12		 ora ($12,s),y
$1b:c5de  c0 60 1c	  cpy #$1c60
$1b:c5e1  62 d1 ac	  per $72b5
$1b:c5e4  c3 b6		 cmp $b6,s
$1b:c5e6  62 53 18	  per $de3c
$1b:c5e9  46 a7		 lsr $a7
$1b:c5eb  cc 14 97	  cpy $9714
$1b:c5ee  cf 8c 64 63   cmp $63648c
$1b:c5f2  02 e0		 cop #$e0
$1b:c5f4  5b			tcd
$1b:c5f5  99 02 d5	  sta $d502,y
$1b:c5f8  2c 1b 40	  bit $401b
$1b:c5fb  cb			wai
$1b:c5fc  84 bd		 sty $bd
$1b:c5fe  08			php
$1b:c5ff  29 70 fe	  and #$fe70
$1b:c602  13 d8		 ora ($d8,s),y
$1b:c604  79 70 e0	  adc $e070,y
$1b:c607  b3 e2		 lda ($e2,s),y
$1b:c609  e1 18		 sbc ($18,x)
$1b:c60b  c1 f6		 cmp ($f6,x)
$1b:c60d  0d 52 58	  ora $5852
$1b:c610  93 ec		 sta ($ec,s),y
$1b:c612  1e ac 63	  asl $63ac,x
$1b:c615  66 78		 ror $78
$1b:c617  3b			tsc
$1b:c618  52 88		 eor ($88)
$1b:c61a  0e 5a cb	  asl $cb5a
$1b:c61d  f0 d6		 beq $c5f5
$1b:c61f  60			rts
$1b:c620  2f 00 2a 18   and $182a00
$1b:c624  c0 5e 02	  cpy #$025e
$1b:c627  96 31		 stx $31,y
$1b:c629  b3 84		 lda ($84,s),y
$1b:c62b  1d a9 98	  ora $98a9,x
$1b:c62e  07 2e		 ora [$2e]
$1b:c630  b5 f8		 lda $f8,x
$1b:c632  2d 52 31	  and $3152
$1b:c635  83 54		 sta $54,s
$1b:c637  96 60		 stx $60,y
$1b:c639  61 22		 adc ($22,x)
$1b:c63b  eb			xba
$1b:c63c  05 d2		 ora $d2
$1b:c63e  05 00		 ora $00
$1b:c640  e1 38		 sbc ($38,x)
$1b:c642  95 4e		 sta $4e,x
$1b:c644  08			php
$1b:c645  74 47		 stz $47,x
$1b:c647  80 88		 bra $c5d1
$1b:c649  3a			dec a
$1b:c64a  ee 25 05	  inc $0525
$1b:c64d  84 ca		 sty $ca
$1b:c64f  7e 4d 4f	  ror $4f4d,x
$1b:c652  63 20		 adc $20,s
$1b:c654  c4 41		 cpy $41
$1b:c656  0f 53 18 2c   ora $2c1853
$1b:c65a  15 a0		 ora $a0,x
$1b:c65c  17 65		 ora [$65],y
$1b:c65e  6b			rtl
$1b:c65f  55 67		 eor $67,x
$1b:c661  e1 70		 sbc ($70,x)
$1b:c663  81 88		 sta ($88,x)
$1b:c665  86 09		 stx $09
$1b:c667  00 db		 brk #$db
$1b:c669  cf da 68 cf   cmp $cf68da
$1b:c66d  06 9a		 asl $9a
$1b:c66f  61 9b		 adc ($9b,x)
$1b:c671  4e 17 66	  lsr $6617
$1b:c674  78			sei
$1b:c675  29 d8 2e	  and #$2ed8
$1b:c678  8b			phb
$1b:c679  f0 97		 beq $c612
$1b:c67b  50 09		 bvc $c686
$1b:c67d  a9 e8 53	  lda #$53e8
$1b:c680  2c 2c 1c	  bit $1c2c
$1b:c683  6b			rtl
$1b:c684  f0 0a		 beq $c690
$1b:c686  82 fd 82	  brl $4986
$1b:c689  ad 51 a0	  lda $a051
$1b:c68c  34 53		 bit $53,x
$1b:c68e  f9 ff d9	  sbc $d9ff,y
$1b:c691  d0 07		 bne $c69a
$1b:c693  68			pla
$1b:c694  37 01		 and [$01],y
$1b:c696  da			phx
$1b:c697  60			rts
$1b:c698  88			dey
$1b:c699  4e bf 61	  lsr $61bf
$1b:c69c  b8			clv
$1b:c69d  3d 50 4a	  and $4a50,x
$1b:c6a0  8b			phb
$1b:c6a1  f0 58		 beq $c6fb
$1b:c6a3  04 aa		 tsb $aa
$1b:c6a5  82 f5 4f	  brl $169d
$1b:c6a8  20 39 60	  jsr $6039
$1b:c6ab  e7 61		 sbc [$61]
$1b:c6ad  38			sec
$1b:c6ae  91 f4		 sta ($f4),y
$1b:c6b0  17 ec		 ora [$ec],y
$1b:c6b2  7d 6a 6d	  adc $6d6a,x
$1b:c6b5  05 a2		 ora $a2
$1b:c6b7  43 f0		 eor $f0,s
$1b:c6b9  0c 06 be	  tsb $be06
$1b:c6bc  82 a3 44	  brl $0b62
$1b:c6bf  f8			sed
$1b:c6c0  28			plp
$1b:c6c1  d2 fc		 cmp ($fc)
$1b:c6c3  aa			tax
$1b:c6c4  71 3b		 adc ($3b),y
$1b:c6c6  27 c0		 and [$c0]
$1b:c6c8  ee c2 76	  inc $76c2
$1b:c6cb  a4 d0		 ldy $d0
$1b:c6cd  84 e1		 sty $e1
$1b:c6cf  01 04		 ora ($04,x)
$1b:c6d1  1c 9a 84	  trb $849a
$1b:c6d4  e1 27		 sbc ($27,x)
$1b:c6d6  08			php
$1b:c6d7  39 c1 be	  and $bec1,y
$1b:c6da  83 f0		 sta $f0,s
$1b:c6dc  cc d0 dc	  cpy $dcd0
$1b:c6df  25 fe		 and $fe
$1b:c6e1  7c 28 60	  jmp ($6028,x)
$1b:c6e4  1f 29 02 04   ora $040229,x
$1b:c6e8  2c 10 21	  bit $2110
$1b:c6eb  b0 60		 bcs $c74d
$1b:c6ed  42 c2		 wdm #$c2
$1b:c6ef  01 0b		 ora ($0b,x)
$1b:c6f1  0a			asl a
$1b:c6f2  04 2c		 tsb $2c
$1b:c6f4  30 10		 bmi $c706
$1b:c6f6  28			plp
$1b:c6f7  f0 87		 beq $c680
$1b:c6f9  a0 0d ce	  ldy #$ce0d
$1b:c6fc  04 54		 tsb $54
$1b:c6fe  81 93		 sta ($93,x)
$1b:c700  17 c0		 ora [$c0],y
$1b:c702  c2 7f		 rep #$7f
$1b:c704  8b			phb
$1b:c705  79 5c 21	  adc $215c,y
$1b:c708  c0 74 1a	  cpy #$1a74
$1b:c70b  3c 0d e0	  bit $e00d,x
$1b:c70e  df 4f a0 01   cmp $01a04f,x
$1b:c712  7e c0 05	  ror $05c0,x
$1b:c715  fc 00 17	  jsr ($1700,x)
$1b:c718  f4 00 57	  pea $5700
$1b:c71b  bb			tyx
$1b:c71c  3d fc 11	  and $11fc,x
$1b:c71f  e4 18		 cpx $18
$1b:c721  37 81		 and [$81],y
$1b:c723  15 33		 ora $33,x
$1b:c725  a4 c5		 ldy $c5
$1b:c727  b9 9e 04	  lda $049e,y
$1b:c72a  be 97 62	  ldx $6297,y
$1b:c72d  10 9c		 bpl $c6cb
$1b:c72f  40			rti
$1b:c730  e2 55		 sep #$55
$1b:c732  a5 50		 lda $50
$1b:c734  99 c1 ea	  sta $eac1,y
$1b:c737  46 72		 lsr $72
$1b:c739  53 82		 eor ($82,s),y
$1b:c73b  3d 14 e0	  and $e014,x
$1b:c73e  97 45		 sta [$45],y
$1b:c740  38			sec
$1b:c741  29 d1 4e	  and #$4ed1
$1b:c744  0a			asl a
$1b:c745  f4 53 82	  pea $8253
$1b:c748  dd 04 b0	  cmp $b004,x
$1b:c74b  bf 45 38 31   lda $313845,x
$1b:c74f  c8			iny
$1b:c750  06 50		 asl $50
$1b:c752  62 02 c2	  per $8957
$1b:c755  08			php
$1b:c756  02 cb		 cop #$cb
$1b:c758  67 b8		 adc [$b8]
$1b:c75a  35 52		 and $52,x
$1b:c75c  7c 5c 59	  jmp ($595c,x)
$1b:c75f  13 28		 ora ($28,s),y
$1b:c761  60			rts
$1b:c762  6c e3 d7	  jmp ($d7e3)
$1b:c765  50 e0		 bvc $c747
$1b:c767  ac e3 e5	  ldy $e5e3
$1b:c76a  50 dc		 bvc $c748
$1b:c76c  e9 f4 a1	  sbc #$a1f4
$1b:c76f  c2 59		 rep #$59
$1b:c771  c7 1e		 cmp [$1e]
$1b:c773  a2 39 5a	  ldx #$5a39
$1b:c776  90 8e		 bcc $c706
$1b:c778  7f f2 38 58   adc $5838f2,x
$1b:c77c  64 f9		 stz $f9
$1b:c77e  04 b8		 tsb $b8
$1b:c780  29 53 46	  and #$4653
$1b:c783  a2 50 08	  ldx #$0850
$1b:c786  2a			rol a
$1b:c787  d0 02		 bne $c78b
$1b:c789  0b			phd
$1b:c78a  34 7d		 bit $7d,x
$1b:c78c  92 84		 sta ($84)
$1b:c78e  1f 29 4b a2   ora $a24b29,x
$1b:c792  bb			tyx
$1b:c793  d9 9e 4a	  cmp $4a9e,y
$1b:c796  d2 6b		 cmp ($6b)
$1b:c798  92 45		 sta ($45)
$1b:c79a  33 0e		 and ($0e,s),y
$1b:c79c  a7 fd		 lda [$fd]
$1b:c79e  36 06		 rol $06,x
$1b:c7a0  3e 70 11	  rol $1170,x
$1b:c7a3  b8			clv
$1b:c7a4  57 28		 eor [$28],y
$1b:c7a6  c0 12 0f	  cpy #$0f12
$1b:c7a9  80 1c		 bra $c7c7
$1b:c7ab  1f e8 0d 0b   ora $0b0de8,x
$1b:c7af  f8			sed
$1b:c7b0  20 c6 e0	  jsr $e0c6
$1b:c7b3  19 07 f9	  ora $f907,y
$1b:c7b6  03 40		 ora $40,s
$1b:c7b8  e0 1a 20	  cpx #$201a
$1b:c7bb  40			rti
$1b:c7bc  87 c0		 sta [$c0]
$1b:c7be  52 4d		 eor ($4d)
$1b:c7c0  32 88		 and ($88)
$1b:c7c2  0e 04 6e	  asl $6e04
$1b:c7c5  8d b4 38	  sta $38b4
$1b:c7c8  18			clc
$1b:c7c9  e7 c5		 sbc [$c5]
$1b:c7cb  e4 4e		 cpx $4e
$1b:c7cd  f8			sed
$1b:c7ce  21 83		 and ($83,x)
$1b:c7d0  dd c3 06	  cmp $06c3,x
$1b:c7d3  3a			dec a
$1b:c7d4  fb			xce
$1b:c7d5  b8			clv
$1b:c7d6  61 08		 adc ($08,x)
$1b:c7d8  af 77 0c 29   lda $290c77
$1b:c7dc  3f ee e1 90   and $90e1ee,x
$1b:c7e0  1d 05 6f	  ora $6f05,x
$1b:c7e3  f2 26		 sbc ($26)
$1b:c7e5  4f 85 06 80   eor $800685
$1b:c7e9  de f1 80	  dec $80f1,x
$1b:c7ec  d0 9e		 bne $c78c
$1b:c7ee  7e 30 19	  ror $1930,x
$1b:c7f1  20 23 c0	  jsr $c023
$1b:c7f4  83 26		 sta $26,s
$1b:c7f6  0e f8 10	  asl $10f8
$1b:c7f9  68			pla
$1b:c7fa  83 2f		 sta $2f,s
$1b:c7fc  02 0d		 cop #$0d
$1b:c7fe  18			clc
$1b:c7ff  8f e0 41 94   sta $9441e0
$1b:c803  17 3c		 ora [$3c],y
$1b:c805  08			php
$1b:c806  32 a3		 and ($a3)
$1b:c808  8f 81 06 90   sta $900681
$1b:c80c  86 f0		 stx $f0
$1b:c80e  20 d2 a0	  jsr $a0d2
$1b:c811  9f df fc 2e   sta $2efcdf,x
$1b:c815  01 0c		 ora ($0c,x)
$1b:c817  80 7f		 bra $c898
$1b:c819  3f ef c4 5f   and $5fc4ef,x
$1b:c81d  1d dd 6c	  ora $6cdd,x
$1b:c820  2b			pld
$1b:c821  50 85		 bvc $c7a8
$1b:c823  40			rti
$1b:c824  3f cb 8a f8   and $f88acb,x
$1b:c828  08			php
$1b:c829  ce 30 23	  dec $2330
$1b:c82c  58			cli
$1b:c82d  18			clc
$1b:c82e  10 61		 bpl $c891
$1b:c830  10 18		 bpl $c84a
$1b:c832  7d 98 aa	  adc $aa98,x
$1b:c835  70 8b		 bvs $c7c2
$1b:c837  01 54		 ora ($54,x)
$1b:c839  a1 10		 lda ($10,x)
$1b:c83b  0b			phd
$1b:c83c  80 8c		 bra $c7ca
$1b:c83e  e2 e5		 sep #$e5
$1b:c840  51 71		 eor ($71),y
$1b:c842  bc 0e 1a	  ldy $1a0e,x
$1b:c845  ee 5b 13	  inc $135b
$1b:c848  d9 2e 4d	  cmp $4d2e,y
$1b:c84b  a3 8d		 lda $8d,s
$1b:c84d  32 d5		 and ($d5)
$1b:c84f  cf 96 47 b2   cmp $b24796
$1b:c853  5d 1b 4a	  eor $4a1b,x
$1b:c856  ca			dex
$1b:c857  03 d1		 ora $d1,s
$1b:c859  41 5e		 eor ($5e,x)
$1b:c85b  25 0a		 and $0a
$1b:c85d  88			dey
$1b:c85e  5d 8f e7	  eor $e78f,x
$1b:c861  12 7a		 ora ($7a)
$1b:c863  83 a4		 sta $a4,s
$1b:c865  62 50 8b	  per $53b8
$1b:c868  3b			tsc
$1b:c869  c4 84		 cpy $84
$1b:c86b  a0 c4 01	  ldy #$01c4
$1b:c86e  e9 42		 sbc #$42
$1b:c870  9f 8d 0d 25   sta $250d8d,x
$1b:c874  c4 30		 cpy $30
$1b:c876  ac b1 40	  ldy $40b1
$1b:c879  c0 3a 46	  cpy #$463a
$1b:c87c  28			plp
$1b:c87d  64 48		 stz $48
$1b:c87f  e1 ad		 sbc ($ad,x)
$1b:c881  61 81		 adc ($81,x)
$1b:c883  f6 7d		 inc $7d,x
$1b:c885  01 33		 ora ($33,x)
$1b:c887  e2 43		 sep #$43
$1b:c889  b0 30		 bcs $c8bb
$1b:c88b  79 50 08	  adc $0850,y
$1b:c88e  4c 75 20	  jmp $2075
$1b:c891  41 04		 eor ($04,x)
$1b:c893  cf 20 3c 4d   cmp $4d3c20
$1b:c897  00 f8		 brk #$f8
$1b:c899  86 43		 stx $43
$1b:c89b  40			rti
$1b:c89c  10 e0		 bpl $c87e
$1b:c89e  d8			cld
$1b:c89f  f2 43		 sbc ($43)
$1b:c8a1  c4 d1		 cpy $d1
$1b:c8a3  0f 88 fc 0f   ora $0ffc88
$1b:c8a7  84 3c		 sty $3c
$1b:c8a9  80 f4		 bra $c89f
$1b:c8ab  1b			tcs
$1b:c8ac  f3 94		 sbc ($94,s),y
$1b:c8ae  75 a6		 adc $a6,x
$1b:c8b0  91 e4		 sta ($e4),y
$1b:c8b2  50 38		 bvc $c8ec
$1b:c8b4  6b			rtl
$1b:c8b5  e1 24		 sbc ($24,x)
$1b:c8b7  ad c5 40	  lda $40c5
$1b:c8ba  82 28 61	  brl $29e5
$1b:c8bd  ae 94 8a	  ldx $8a94
$1b:c8c0  bc 12 21	  ldy $2112,x
$1b:c8c3  0d bb 70	  ora $70bb
$1b:c8c6  02 c5		 cop #$c5
$1b:c8c8  1d bb 98	  ora $98bb,x
$1b:c8cb  8a			txa
$1b:c8cc  11 15		 ora ($15),y
$1b:c8ce  b3 98		 lda ($98,s),y
$1b:c8d0  81 5e		 sta ($5e,x)
$1b:c8d2  32 87		 and ($87)
$1b:c8d4  fa			plx
$1b:c8d5  93 0e		 sta ($0e,s),y
$1b:c8d7  1c 0c 48	  trb $480c
$1b:c8da  b0 4d		 bcs $c929
$1b:c8dc  63 c6		 adc $c6,s
$1b:c8de  84 8b		 sty $8b
$1b:c8e0  1b			tcs
$1b:c8e1  c4 ba		 cpy $ba
$1b:c8e3  30 e3		 bmi $c8c8
$1b:c8e5  08			php
$1b:c8e6  89 86		 bit #$86
$1b:c8e8  42 22		 wdm #$22
$1b:c8ea  52 61		 eor ($61)
$1b:c8ec  c2 85		 rep #$85
$1b:c8ee  e9 12		 sbc #$12
$1b:c8f0  1b			tcs
$1b:c8f1  24 42		 bit $42
$1b:c8f3  14 61		 trb $61
$1b:c8f5  38			sec
$1b:c8f6  44 49 32	  mvp $32,$49
$1b:c8f9  6f d0 34 08   adc $0834d0
$1b:c8fd  98			tya
$1b:c8fe  63 04		 adc $04,s
$1b:c900  55 03		 eor $03,x
$1b:c902  01 6c		 ora ($6c,x)
$1b:c904  fe 62 a4	  inc $a462,x
$1b:c907  31 00		 and ($00),y
$1b:c909  c8			iny
$1b:c90a  fa			plx
$1b:c90b  07 c1		 ora [$c1]
$1b:c90d  86 35		 stx $35
$1b:c90f  ae 12 e4	  ldx $e412
$1b:c912  31 91		 and ($91),y
$1b:c914  70 81		 bvs $c897
$1b:c916  44 95 0e	  mvp $0e,$95
$1b:c919  94 03		 sty $03,x
$1b:c91b  f9 ff 8a	  sbc $8aff,y
$1b:c91e  35 a5		 and $a5,x
$1b:c920  d0 7c		 bne $c99e
$1b:c922  47 72		 eor [$72]
$1b:c924  75 1c		 adc $1c,x
$1b:c926  0c f8 06	  tsb $06f8
$1b:c929  ac 2b 85	  ldy $852b
$1b:c92c  f0 0e		 beq $c93c
$1b:c92e  b3 7c		 lda ($7c,s),y
$1b:c930  03 c8		 ora $c8,s
$1b:c932  8e 21 14	  stx $1421
$1b:c935  83 c2		 sta $c2,s
$1b:c937  7e 0b d1	  ror $d10b,x
$1b:c93a  86 16		 stx $16
$1b:c93c  c3 e2		 cmp $e2,s
$1b:c93e  a2 18 21	  ldx #$2118
$1b:c941  6c 3e 4f	  jmp ($4f3e)
$1b:c944  f1 7c		 sbc ($7c),y
$1b:c946  41 21		 eor ($21,x)
$1b:c948  42 02		 wdm #$02
$1b:c94a  52 20		 eor ($20)
$1b:c94c  b8			clv
$1b:c94d  16 3c		 asl $3c,x
$1b:c94f  d2 4c		 cmp ($4c)
$1b:c951  60			rts
$1b:c952  0d c1 21	  ora $21c1
$1b:c955  45 82		 eor $82
$1b:c957  52 21		 eor ($21)
$1b:c959  98			tya
$1b:c95a  99 d0 be	  sta $bed0,y
$1b:c95d  c8			iny
$1b:c95e  a5 7f		 lda $7f
$1b:c960  8c 49 f7	  sty $f749
$1b:c963  10 48		 bpl $c9ad
$1b:c965  24 02		 bit $02
$1b:c967  15 88		 ora $88,x
$1b:c969  81 37		 sta ($37,x)
$1b:c96b  46 11		 lsr $11
$1b:c96d  02 cc		 cop #$cc
$1b:c96f  40			rti
$1b:c970  81 82		 sta ($82,x)
$1b:c972  e3 0c		 sbc $0c,s
$1b:c974  33 8c		 and ($8c,s),y
$1b:c976  04 03		 tsb $03
$1b:c978  15 6a		 ora $6a,x
$1b:c97a  5c 37 50 e3   jml $e35037
$1b:c97e  38			sec
$1b:c97f  2e e1 d4	  rol $d4e1
$1b:c982  4a			lsr a
$1b:c983  a0 78 24	  ldy #$2478
$1b:c986  4d ef 70	  eor $70ef
$1b:c989  bd 4b 8c	  lda $8c4b,x
$1b:c98c  e0 7b 97	  cpx #$977b
$1b:c98f  51 3f		 eor ($3f),y
$1b:c991  81 e0		 sta ($e0,x)
$1b:c993  91 77		 sta ($77),y
$1b:c995  ba			tsx
$1b:c996  b7 c1		 lda [$c1],y
$1b:c998  fa			plx
$1b:c999  0a			asl a
$1b:c99a  a0 87 e9	  ldy #$e987
$1b:c99d  9c 65 05	  stz $0565
$1b:c9a0  70 a4		 bvs $c946
$1b:c9a2  35 d0		 and $d0,x
$1b:c9a4  90 77		 bcc $ca1d
$1b:c9a6  7a			ply
$1b:c9a7  a8			tay
$1b:c9a8  80 1c		 bra $c9c6
$1b:c9aa  04 05		 tsb $05
$1b:c9ac  6f 04 26 11   adc $112604
$1b:c9b0  c8			iny
$1b:c9b1  71 94		 adc ($94),y
$1b:c9b3  46 01		 lsr $01
$1b:c9b5  d8			cld
$1b:c9b6  75 14		 adc $14,x
$1b:c9b8  02 13		 cop #$13
$1b:c9ba  b6 75		 ldx $75,y
$1b:c9bc  14 22		 trb $22
$1b:c9be  03 c6		 ora $c6,s
$1b:c9c0  30 ab		 bmi $c96d
$1b:c9c2  e2 61		 sep #$61
$1b:c9c4  50 6d		 bvc $ca33
$1b:c9c6  39 f4 e1	  and $e1f4,y
$1b:c9c9  08			php
$1b:c9ca  34 80		 bit $80,x
$1b:c9cc  22 b0 22 0d   jsl $0d22b0
$1b:c9d0  d2 88		 cmp ($88)
$1b:c9d2  72 5c		 adc ($5c)
$1b:c9d4  67 08		 adc [$08]
$1b:c9d6  ec a8 25	  cpx $25a8
$1b:c9d9  49 e6		 eor #$e6
$1b:c9db  84 5d		 sty $5d
$1b:c9dd  89 1c		 bit #$1c
$1b:c9df  21 b0		 and ($b0,x)
$1b:c9e1  42 59		 wdm #$59
$1b:c9e3  9e 88 e0	  stz $e088,x
$1b:c9e6  a7 ef		 lda [$ef]
$1b:c9e8  47 b9		 eor [$b9]
$1b:c9ea  30 15		 bmi $ca01
$1b:c9ec  07 e6		 ora [$e6]
$1b:c9ee  1b			tcs
$1b:c9ef  8a			txa
$1b:c9f0  ac 22 1f	  ldy $1f22
$1b:c9f3  40			rti
$1b:c9f4  87 aa		 sta [$aa]
$1b:c9f6  87 d0		 sta [$d0]
$1b:c9f8  25 f0		 and $f0
$1b:c9fa  d4 7a		 pei ($7a)
$1b:c9fc  88			dey
$1b:c9fd  29 f5		 and #$f5
$1b:c9ff  20 89 e8	  jsr $e889
$1b:ca02  12 13		 ora ($13)
$1b:ca04  09 03		 ora #$03
$1b:ca06  04 1d		 tsb $1d
$1b:ca08  e6 00		 inc $00
$1b:ca0a  30 80		 bmi $c98c
$1b:ca0c  88			dey
$1b:ca0d  90 e8		 bcc $c9f7
$1b:ca0f  04 61		 tsb $61
$1b:ca11  fe 7f e1	  inc $e17f,x
$1b:ca14  90 04		 bcc $ca1a
$1b:ca16  50 22		 bvc $ca3a
$1b:ca18  00 a2		 brk #$a2
$1b:ca1a  40			rti
$1b:ca1b  32 02		 and ($02)
$1b:ca1d  0b			phd
$1b:ca1e  cc 60 12	  cpy $1260
$1b:ca21  02 60		 cop #$60
$1b:ca23  fe 3f e9	  inc $e93f,x
$1b:ca26  f0 4f		 beq $ca77
$1b:ca28  80 e4		 bra $ca0e
$1b:ca2a  9d 41 00	  sta $0041,x
$1b:ca2d  b4 02		 ldy $02,x
$1b:ca2f  41 5a		 eor ($5a,x)
$1b:ca31  2a			rol a
$1b:ca32  f0 a1		 beq $c9d5
$1b:ca34  27 49		 and [$49]
$1b:ca36  3e 0b 94	  rol $940b,x
$1b:ca39  82 39 52	  brl $1c75
$1b:ca3c  d4 b1		 pei ($b1)
$1b:ca3e  36 58		 rol $58,x
$1b:ca40  50 9c		 bvc $c9de
$1b:ca42  c2 ea		 rep #$ea
$1b:ca44  0c 52 c4	  tsb $c452
$1b:ca47  9b			txy
$1b:ca48  02 b8		 cop #$b8
$1b:ca4a  f2 88		 sbc ($88)
$1b:ca4c  ea			nop
$1b:ca4d  99 a9 aa	  sta $aaa9,y
$1b:ca50  6a			ror a
$1b:ca51  27 29		 and [$29]
$1b:ca53  b6 9c		 ldx $9c,y
$1b:ca55  a7 17		 lda [$17]
$1b:ca57  94 47		 sty $47,x
$1b:ca59  d8			cld
$1b:ca5a  cd 4f 63	  cmp $634f
$1b:ca5d  51 3d		 eor ($3d),y
$1b:ca5f  cd b4 f7	  cmp $f7b4
$1b:ca62  03 0e		 ora $0e,s
$1b:ca64  4f 00 ff 29   eor $29ff00
$1b:ca68  0e 16 95	  asl $9516
$1b:ca6b  18			clc
$1b:ca6c  c4 36		 cpy $36
$1b:ca6e  21 0c		 and ($0c,x)
$1b:ca70  4e 0c 62	  lsr $620c
$1b:ca73  2b			pld
$1b:ca74  08			php
$1b:ca75  a6 12		 ldx $12
$1b:ca77  ca			dex
$1b:ca78  3b			tsc
$1b:ca79  00 c6		 brk #$c6
$1b:ca7b  2a			rol a
$1b:ca7c  41 42		 eor ($42,x)
$1b:ca7e  05 60		 ora $60
$1b:ca80  c7 96		 cmp [$96]
$1b:ca82  48			pha
$1b:ca83  9e 14 f2	  stz $f214,x
$1b:ca86  c9 12 02	  cmp #$0212
$1b:ca89  1e 2f 06	  asl $062f,x
$1b:ca8c  40			rti
$1b:ca8d  c5 6b		 cmp $6b
$1b:ca8f  8b			phb
$1b:ca90  13 8a		 ora ($8a,s),y
$1b:ca92  d7 85		 cmp [$85],y
$1b:ca94  e1 08		 sbc ($08,x)
$1b:ca96  84 44		 sty $44
$1b:ca98  20 b7 d2	  jsr $d2b7
$1b:ca9b  59 44 21	  eor $2144,y
$1b:ca9e  b7 c2		 lda [$c2],y
$1b:caa0  c9 21 c2	  cmp #$c221
$1b:caa3  fe 4b 11	  inc $114b,x
$1b:caa6  cf c3 c1 82   cmp $82c1c3
$1b:caaa  4e 1a 7a	  lsr $7a1a
$1b:caad  98			tya
$1b:caae  8b			phb
$1b:caaf  a2 0c 02	  ldx #$020c
$1b:cab2  d9 63 16	  cmp $1663,y
$1b:cab5  84 4f		 sty $4f
$1b:cab7  15 a1		 ora $a1,x
$1b:cab9  12 05		 ora ($05)
$1b:cabb  fc 47 2f	  jsr ($2f47,x)
$1b:cabe  41 fa		 eor ($fa,x)
$1b:cac0  50 92		 bvc $ca54
$1b:cac2  44 41 08	  mvp $08,$41
$1b:cac5  4a			lsr a
$1b:cac6  48			pha
$1b:cac7  20 f1 18	  jsr $18f1
$1b:caca  bc 23 3c	  ldy $3c23,x
$1b:cacd  91 07		 sta ($07),y
$1b:cacf  e0 47 e0	  cpx #$e047
$1b:cad2  1a			inc a
$1b:cad3  e4 88		 cpx $88
$1b:cad5  44 60 ef	  mvp $ef,$60
$1b:cad8  e0 cf 82	  cpx #$82cf
$1b:cadb  08			php
$1b:cadc  0a			asl a
$1b:cadd  1a			inc a
$1b:cade  f3 71		 sbc ($71,s),y
$1b:cae0  c5 d9		 cmp $d9
$1b:cae2  e9 17 6b	  sbc #$6b17
$1b:cae5  03 7c		 ora $7c,s
$1b:cae7  a1 e8		 lda ($e8,x)
$1b:cae9  94 87		 sty $87,x
$1b:caeb  a4 01		 ldy $01
$1b:caed  b0 50		 bcs $cb3f
$1b:caef  76 e9		 ror $e9,x
$1b:caf1  3b			tsc
$1b:caf2  ec 14 59	  cpx $5914
$1b:caf5  e5 68		 sbc $68
$1b:caf7  04 4b		 tsb $4b
$1b:caf9  5c ad 07 e1   jml $e107ad
$1b:cafd  67 ca		 adc [$ca]
$1b:caff  a4 13		 ldy $13
$1b:cb01  16 49		 asl $49,x
$1b:cb03  86 e0		 stx $e0
$1b:cb05  66 e2		 ror $e2
$1b:cb07  7a			ply
$1b:cb08  20 14 a1	  jsr $a114
$1b:cb0b  e4 b0		 cpx $b0
$1b:cb0d  c7 90		 cmp [$90]
$1b:cb0f  c6 22		 dec $22
$1b:cb11  90 cc		 bcc $cadf
$1b:cb13  e0 90 a3	  cpx #$a390
$1b:cb16  90 4d		 bcc $cb65
$1b:cb18  60			rts
$1b:cb19  90 06		 bcc $cb21
$1b:cb1b  a1 18		 lda ($18,x)
$1b:cb1d  84 67		 sty $67
$1b:cb1f  54 44 f7	  mvn $f7,$44
$1b:cb22  0d 68 ac	  ora $ac68
$1b:cb25  a1 f1		 lda ($f1,x)
$1b:cb27  1c 48 ac	  trb $ac48
$1b:cb2a  a2 f0 9c	  ldx #$9cf0
$1b:cb2d  cb			wai
$1b:cb2e  5c 85 81 0d   jml $0d8185
$1b:cb32  0b			phd
$1b:cb33  14 42		 trb $42
$1b:cb35  11 2c		 ora ($2c),y
$1b:cb37  0e 93 24	  asl $2493
$1b:cb3a  25 c2		 and $c2
$1b:cb3c  42 84		 wdm #$84
$1b:cb3e  27 80		 and [$80]
$1b:cb40  56 4d		 lsr $4d,x
$1b:cb42  70 8f		 bvs $cad3
$1b:cb44  af 88 5a 13   lda $135a88
$1b:cb48  d4 37		 pei ($37)
$1b:cb4a  0b			phd
$1b:cb4b  41 30		 eor ($30,x)
$1b:cb4d  24 e0		 bit $e0
$1b:cb4f  16 82		 asl $82,x
$1b:cb51  7c 49 c0	  jmp ($c049,x)
$1b:cb54  d0 05		 bne $cb5b
$1b:cb56  30 81		 bmi $cad9
$1b:cb58  09 5a 24	  ora #$245a
$1b:cb5b  e0 4e 82	  cpx #$824e
$1b:cb5e  d0 42		 bne $cba2
$1b:cb60  44 bb 13	  mvp $13,$bb
$1b:cb63  18			clc
$1b:cb64  30 3d		 bmi $cba3
$1b:cb66  a2 2e 27	  ldx #$272e
$1b:cb69  6b			rtl
$1b:cb6a  57 eb		 eor [$eb],y
$1b:cb6c  ff 1a 32 8f   sbc $8f321a,x
$1b:cb70  e3 fe		 sbc $fe,s
$1b:cb72  ad 03 60	  lda $6003
$1b:cb75  40			rti
$1b:cb76  da			phx
$1b:cb77  80 93		 bra $cb0c
$1b:cb79  2e 7b 50	  rol $507b
$1b:cb7c  20 d0 62	  jsr $62d0
$1b:cb7f  e1 bd		 sbc ($bd,x)
$1b:cb81  08			php
$1b:cb82  bc 04 bf	  ldy $bf04,x
$1b:cb85  6a			ror a
$1b:cb86  06 fc		 asl $fc
$1b:cb88  be 88 11	  ldx $1188,y
$1b:cb8b  7a			ply
$1b:cb8c  12 04		 ora ($04)
$1b:cb8e  3f 9f f2 d0   and $d0f29f,x
$1b:cb92  47 20		 eor [$20]
$1b:cb94  1f 6f f8 c0   ora $c0f86f,x
$1b:cb98  15 a0		 ora $a0,x
$1b:cb9a  57 16		 eor [$16],y
$1b:cb9c  a0 42 a0	  ldy #$a042
$1b:cb9f  1b			tcs
$1b:cba0  e4 f1		 cpx $f1
$1b:cba2  41 60		 eor ($60,x)
$1b:cba4  aa			tax
$1b:cba5  43 50		 eor $50,s
$1b:cba7  82 90 00	  brl $cc3a
$1b:cbaa  f8			sed
$1b:cbab  0e b8 4e	  asl $4eb8
$1b:cbae  2f 53 8c 24   and $248c53
$1b:cbb2  e3 1d		 sbc $1d,s
$1b:cbb4  38			sec
$1b:cbb5  d0 4e		 bne $cc05
$1b:cbb7  36 53		 rol $53,x
$1b:cbb9  8e 24 e3	  stx $e324
$1b:cbbc  9d 38 ec	  sta $ec38,x
$1b:cbbf  4e 3c 53	  lsr $533c
$1b:cbc2  8f a4 e2 0d   sta $0de2a4
$1b:cbc6  39 8c 4e	  and $4e8c,y
$1b:cbc9  65 53		 adc $53
$1b:cbcb  99 e4 e6	  sta $e6e4,y
$1b:cbce  9d 39 ac	  sta $ac39,x
$1b:cbd1  4e 6c 53	  lsr $536c
$1b:cbd4  9b			txy
$1b:cbd5  64 e6		 stz $e6
$1b:cbd7  fd 39 c8	  sbc $c839,x
$1b:cbda  4e 74 53	  lsr $5374
$1b:cbdd  9d 64 e7	  sta $e764,x
$1b:cbe0  9d 39 f8	  sta $f839,x
$1b:cbe3  4e 62 53	  lsr $5362
$1b:cbe6  a9 a4 ea	  lda #$eaa4
$1b:cbe9  7d 3a a4	  adc $a43a,x
$1b:cbec  4e b5 53	  lsr $53b5
$1b:cbef  a8			tay
$1b:cbf0  64 ee		 stz $ee
$1b:cbf2  dd 3b c4	  cmp $c43b,x
$1b:cbf5  4e f9 53	  lsr $53f9
$1b:cbf8  bf 24 ee 4d   lda $4dee24,x
$1b:cbfc  3c b4 4f	  bit $4fb4,x
$1b:cbff  35 53		 and $53,x
$1b:cc01  cf 64 f2 5d   cmp $5df264
$1b:cc05  3d b8 4f	  and $4fb8,x
$1b:cc08  6f 53 dc 24   adc $24dc53
$1b:cc0c  f7 1d		 sbc [$1d],y
$1b:cc0e  3d cc 4f	  and $4fcc,x
$1b:cc11  75 53		 adc $53,x
$1b:cc13  dd e4 f7	  cmp $f7e4,x
$1b:cc16  9d 3d f0	  sta $f03d,x
$1b:cc19  4f 64 53 eb   eor $eb5364
$1b:cc1d  64 fa		 stz $fa
$1b:cc1f  ed 3e c0	  sbc $c03e
$1b:cc22  4f b1 53 ec   eor $ec53b1
$1b:cc26  a4 fb		 ldy $fb
$1b:cc28  3d 3e 81	  and $813e,x
$1b:cc2b  c0 0c 05	  cpy #$050c
$1b:cc2e  a8			tay
$1b:cc2f  9f 7f ff e5   sta $e5ff7f,x
$1b:cc33  f4 f7 19	  pea $19f7
$1b:cc36  9e 69 3f	  stz $3f69,x
$1b:cc39  33 81		 and ($81,s),y
$1b:cc3b  80 a0		 bra $cbdd
$1b:cc3d  86 41		 stx $41
$1b:cc3f  3e a7 2c	  rol $2ca7,x
$1b:cc42  cc 26 02	  cpy $0226
$1b:cc45  fe 7f cd	  inc $cd7f,x
$1b:cc48  e0 8f 48	  cpx #$488f
$1b:cc4b  89 e8 d2	  bit #$d2e8
$1b:cc4e  60			rts
$1b:cc4f  77 25		 adc [$25],y
$1b:cc51  0a			asl a
$1b:cc52  54 0f 43	  mvn $43,$0f
$1b:cc55  07 30		 ora [$30]
$1b:cc57  1e 05 60	  asl $6005,x
$1b:cc5a  fc 75 83	  jsr ($8375,x)
$1b:cc5d  c3 68		 cmp $68,s
$1b:cc5f  06 70		 asl $70
$1b:cc61  80 9f		 bra $cc02
$1b:cc63  8d 72 0d	  sta $0d72
$1b:cc66  14 d2		 trb $d2
$1b:cc68  1e 85 a2	  asl $a285,x
$1b:cc6b  46 70		 lsr $70
$1b:cc6d  6b			rtl
$1b:cc6e  a1 9c		 lda ($9c,x)
$1b:cc70  1b			tcs
$1b:cc71  ec 93 06	  cpx $0693
$1b:cc74  18			clc
$1b:cc75  3d 53 d4	  and $d453,x
$1b:cc78  e0 56 88	  cpx #$8856
$1b:cc7b  3e d1 a2	  rol $a2d1,x
$1b:cc7e  00 34		 brk #$34
$1b:cc80  51 93		 eor ($93),y
$1b:cc82  34 03		 bit $03,x
$1b:cc84  29 29 67	  and #$6729
$1b:cc87  1b			tcs
$1b:cc88  44 83 e4	  mvp $e4,$83
$1b:cc8b  d1 21		 cmp ($21),y
$1b:cc8d  39 2f 52	  and $522f,y
$1b:cc90  b4 3a		 ldy $3a,x
$1b:cc92  7d 70 e9	  adc $e970,x
$1b:cc95  fc cc e5	  jsr ($e5cc,x)
$1b:cc98  68			pla
$1b:cc99  81 0c		 sta ($0c,x)
$1b:cc9b  00 e9		 brk #$e9
$1b:cc9d  84 67		 sty $67
$1b:cc9f  28			plp
$1b:cca0  a4 09		 ldy $09
$1b:cca2  a0 e3 4e	  ldy #$4ee3
$1b:cca5  53 38		 eor ($38,s),y
$1b:cca7  d3 e4		 cmp ($e4,s),y
$1b:cca9  57 03		 eor [$03],y
$1b:ccab  fa			plx
$1b:ccac  40			rti
$1b:ccad  a8			tay
$1b:ccae  2b			pld
$1b:ccaf  16 df		 asl $df,x
$1b:ccb1  a3 85		 lda $85,s
$1b:ccb3  68			pla
$1b:ccb4  50 28		 bvc $ccde
$1b:ccb6  04 16		 tsb $16
$1b:ccb8  84 9b		 sty $9b
$1b:ccba  49 9d 05	  eor #$059d
$1b:ccbd  36 97		 rol $97,x
$1b:ccbf  95 52		 sta $52,x
$1b:ccc1  a5 db		 lda $db
$1b:ccc3  fd ff 50	  sbc $50ff,x
$1b:ccc6  a3 04		 lda $04,s
$1b:ccc8  15 28		 ora $28,x
$1b:ccca  c1 05		 cmp ($05,x)
$1b:cccc  8a			txa
$1b:cccd  34 41		 bit $41,x
$1b:cccf  2e 8d 10	  rol $108d
$1b:ccd2  1f 02 84 9c   ora $9c8402,x
$1b:ccd6  24 a9		 bit $a9
$1b:ccd8  27 09		 and [$09]
$1b:ccda  2c 49 c2	  bit $c249
$1b:ccdd  49 74 4f	  eor #$4f74
$1b:cce0  83 8d		 sta $8d,s
$1b:cce2  00 64		 brk #$64
$1b:cce4  a9 20 19	  lda #$1920
$1b:cce7  2c 48 06	  bit $0648
$1b:ccea  49 72 28	  eor #$2872
$1b:cced  a5 2e		 lda $2e
$1b:ccef  84 21		 sty $21
$1b:ccf1  6a			ror a
$1b:ccf2  ad 0c b2	  lda $b20c
$1b:ccf5  10 31		 bpl $cd28
$1b:ccf7  21 db		 and ($db,x)
$1b:ccf9  a8			tay
$1b:ccfa  43 74		 eor $74,s
$1b:ccfc  c8			iny
$1b:ccfd  8f 97 68 3e   sta $3e6897
$1b:cd01  5e f2 88	  lsr $88f2,x
$1b:cd04  ff 9f f2 68   sbc $68f29f,x
$1b:cd08  00 c8		 brk #$c8
$1b:cd0a  96 45		 stx $45,y
$1b:cd0c  74 22		 stz $22,x
$1b:cd0e  81 7d		 sta ($7d,x)
$1b:cd10  08			php
$1b:cd11  a0 57 41	  ldy #$4157
$1b:cd14  e8			inx
$1b:cd15  17 d0		 ora [$d0],y
$1b:cd17  7a			ply
$1b:cd18  05 74		 ora $74
$1b:cd1a  14 81		 trb $81
$1b:cd1c  7d 05 24	  adc $2405,x
$1b:cd1f  24 28		 bit $28
$1b:cd21  20 f0 4f	  jsr $4ff0
$1b:cd24  f4 9d 03	  pea $039d
$1b:cd27  6e 27 40	  ror $4027
$1b:cd2a  bb			tyx
$1b:cd2b  89 d0 2a	  bit #$2ad0
$1b:cd2e  81 7d		 sta ($7d,x)
$1b:cd30  0a			asl a
$1b:cd31  a0 47 c2	  ldy #$c247
$1b:cd34  2b			pld
$1b:cd35  0f 59 2a 85   ora $852a59
$1b:cd39  b0 12		 bcs $cd4d
$1b:cd3b  05 aa		 ora $aa
$1b:cd3d  86 d1		 stx $d1
$1b:cd3f  40			rti
$1b:cd40  08			php
$1b:cd41  3e d3 0c	  rol $0cd3,x
$1b:cd44  02 50		 cop #$50
$1b:cd46  88			dey
$1b:cd47  3e d3 44	  rol $44d3,x
$1b:cd4a  02 51		 cop #$51
$1b:cd4c  08			php
$1b:cd4d  3e d3 7c	  rol $7cd3,x
$1b:cd50  02 51		 cop #$51
$1b:cd52  88			dey
$1b:cd53  3a			dec a
$1b:cd54  50 42		 bvc $cd98
$1b:cd56  0e 94 08	  asl $0894
$1b:cd59  83 a5		 sta $a5,s
$1b:cd5b  00 20		 brk #$20
$1b:cd5d  e9 4a ad	  sbc #$ad4a
$1b:cd60  0d 2e 10	  ora $102e
$1b:cd63  14 82		 trb $82
$1b:cd65  ba			tsx
$1b:cd66  52 11		 eor ($11)
$1b:cd68  43 2e		 eor $2e,s
$1b:cd6a  b1 6c		 lda ($6c),y
$1b:cd6c  bf bf ff d7   lda $d7ffbf,x
$1b:cd70  fe 56 6c	  inc $6c56,x
$1b:cd73  13 c8		 ora ($c8,s),y
$1b:cd75  3f 40 fa 9f   and $9ffa40,x
$1b:cd79  e3 e2		 sbc $e2,s
$1b:cd7b  bc 81 1b	  ldy $1b81,x
$1b:cd7e  8d 10 3e	  sta $3e10
$1b:cd81  a3 34		 lda $34,s
$1b:cd83  0f a9 06 4a   ora $4a06a9
$1b:cd87  09 6d 8b	  ora #$8b6d
$1b:cd8a  20 d9 4e	  jsr $4ed9
$1b:cd8d  d1 b1		 cmp ($b1),y
$1b:cd8f  4b			phk
$1b:cd90  2c fd 0f	  bit $0ffd
$1b:cd93  b1 b0		 lda ($b0),y
$1b:cd95  d1 60		 cmp ($60),y
$1b:cd97  d9 43 30	  cmp $3043,y
$1b:cd9a  36 50		 rol $50,x
$1b:cd9c  66 0d		 ror $0d
$1b:cd9e  94 55		 sty $55,x
$1b:cda0  83 65		 sta $65,s
$1b:cda2  16 60		 asl $60,x
$1b:cda4  d9 48 43	  cmp $4348,y
$1b:cda7  a1 61		 lda ($61,x)
$1b:cda9  4e 81 5b	  lsr $5b81
$1b:cdac  a7 d9		 lda [$d9]
$1b:cdae  b0 bf		 bcs $cd6f
$1b:cdb0  86 c2		 stx $c2
$1b:cdb2  9e c1 b2	  stz $b2c1,x
$1b:cdb5  8d 7f 74	  sta $747f
$1b:cdb8  78			sei
$1b:cdb9  44 98 24	  mvp $24,$98
$1b:cdbc  8b			phb
$1b:cdbd  09 75 11	  ora #$1175
$1b:cdc0  82 03 d0	  brl $9dc6
$1b:cdc3  5b			tcd
$1b:cdc4  85 28		 sta $28
$1b:cdc6  bc b5 f2	  ldy $f2b5,x
$1b:cdc9  f0 a8		 beq $cd73
$1b:cdcb  c0 7c 17	  cpy #$177c
$1b:cdce  43 72		 eor $72,s
$1b:cdd0  97 50		 sta [$50],y
$1b:cdd2  7a			ply
$1b:cdd3  06 54		 asl $54
$1b:cdd5  1e 81 b4	  asl $b481,x
$1b:cdd8  9d a4 75	  sta $75a4,x
$1b:cddb  02 aa		 cop #$aa
$1b:cddd  1c 40 ba	  trb $ba40
$1b:cde0  4b			phk
$1b:cde1  72 32		 adc ($32)
$1b:cde3  93 44		 sta ($44,s),y
$1b:cde5  8d a4 39	  sta $39a4
$1b:cde8  03 9a		 ora $9a,s
$1b:cdea  2c c9 3e	  bit $3ec9
$1b:cded  86 34		 stx $34
$1b:cdef  61 92		 adc ($92,x)
$1b:cdf1  35 07		 and $07,x
$1b:cdf3  20 95 63	  jsr $6395
$1b:cdf6  da			phx
$1b:cdf7  0f 80 7a 18   ora $187a80
$1b:cdfb  97 12		 sta [$12],y
$1b:cdfd  e9 51 cb	  sbc #$cb51
$1b:ce00  c1 47		 cmp ($47,x)
$1b:ce02  2b			pld
$1b:ce03  87 d1		 sta [$d1]
$1b:ce05  c6 3e		 dec $3e
$1b:ce07  07 c8		 ora [$c8]
$1b:ce09  36 71		 rol $71,x
$1b:ce0b  98			tya
$1b:ce0c  0e 94 66	  asl $6694
$1b:ce0f  03 c5		 ora $c5,s
$1b:ce11  1a			inc a
$1b:ce12  a0 f9 42	  ldy #$42f9
$1b:ce15  da			phx
$1b:ce16  09 fc 2c	  ora #$2cfc
$1b:ce19  b0 70		 bcs $ce8b
$1b:ce1b  a1 f7		 lda ($f7,x)
$1b:ce1d  4b			phk
$1b:ce1e  8f 1c a2 97   sta $97a21c
$1b:ce22  5a			phy
$1b:ce23  b6 70		 ldx $70,y
$1b:ce25  7c d1 c0	  jmp ($c0d1,x)
$1b:ce28  5d e0 05	  eor $05e0,x
$1b:ce2b  23 28		 and $28,s
$1b:ce2d  21 d3		 and ($d3,x)
$1b:ce2f  f2 d8		 sbc ($d8)
$1b:ce31  14 79		 trb $79
$1b:ce33  33 00		 and ($00,s),y
$1b:ce35  de 09 94	  dec $9409,x
$1b:ce38  9c 21 0d	  stz $0d21
$1b:ce3b  9a			txs
$1b:ce3c  07 72		 ora [$72]
$1b:ce3e  55 a5		 eor $a5,x
$1b:ce40  dd 08 68	  cmp $6808,x
$1b:ce43  f2 41		 sbc ($41)
$1b:ce45  82 f5 36	  brl $053d
$1b:ce48  c7 07		 cmp [$07]
$1b:ce4a  32 81		 and ($81)
$1b:ce4c  f5 a0		 sbc $a0,x
$1b:ce4e  a6 a5		 ldx $a5
$1b:ce50  6f a2 c4 03   adc $03c4a2
$1b:ce54  a8			tay
$1b:ce55  65 00		 adc $00
$1b:ce57  ea			nop
$1b:ce58  20 c1 ee	  jsr $eec1
$1b:ce5b  89 f0 7b	  bit #$7bf0
$1b:ce5e  a1 e4		 lda ($e4,x)
$1b:ce60  91 e4		 sta ($e4),y
$1b:ce62  63 20		 adc $20,s
$1b:ce64  8a			txa
$1b:ce65  30 c9		 bmi $ce30
$1b:ce67  c2 81		 rep #$81
$1b:ce69  14 58		 trb $58
$1b:ce6b  90 4f		 bcc $cebc
$1b:ce6d  c4 9e		 cpy $9e
$1b:ce6f  d3 23		 cmp ($23,s),y
$1b:ce71  da			phx
$1b:ce72  40			rti
$1b:ce73  a0 1d 96	  ldy #$961d
$1b:ce76  62 ff bf	  per $8e78
$1b:ce79  f0 aa		 beq $ce25
$1b:ce7b  31 8c		 and ($8c),y
$1b:ce7d  8d 20 d8	  sta $d820
$1b:ce80  09 d9 b1	  ora #$b1d9
$1b:ce83  4b			phk
$1b:ce84  e1 6c		 sbc ($6c,x)
$1b:ce86  36 29		 rol $29,x
$1b:ce88  a4 33		 ldy $33
$1b:ce8a  a6 c1		 ldx $c1
$1b:ce8c  7b			tdc
$1b:ce8d  a7 38		 lda [$38]
$1b:ce8f  d8			cld
$1b:ce90  2d 80 88	  and $8880
$1b:ce93  40			rti
$1b:ce94  23 0d		 and $0d,s
$1b:ce96  81 4c		 sta ($4c,x)
$1b:ce98  82 64 1e	  brl $ecff
$1b:ce9b  e0 29 18	  cpx #$1829
$1b:ce9e  43 60		 eor $60,s
$1b:cea0  a0 50 64	  ldy #$6450
$1b:cea3  c0 43 1b	  cpy #$1b43
$1b:cea6  01 07		 ora ($07,x)
$1b:cea8  52 82		 eor ($82)
$1b:ceaa  c0 93 1f	  cpy #$1f93
$1b:cead  00 90		 brk #$90
$1b:ceaf  3e 05 50	  rol $5005,x
$1b:ceb2  11 08		 ora ($08),y
$1b:ceb4  e2 98		 sep #$98
$1b:ceb6  e2 11		 sep #$11
$1b:ceb8  d4 e1		 pei ($e1)
$1b:ceba  c5 d3		 cmp $d3
$1b:cebc  94 65		 sty $65,x
$1b:cebe  02 f8		 cop #$f8
$1b:cec0  29 00 ca	  and #$ca00
$1b:cec3  10 f8		 bpl $cebd
$1b:cec5  72 c8		 adc ($c8)
$1b:cec7  de c4 de	  dec $dec4,x
$1b:ceca  f8			sed
$1b:cecb  04 89		 tsb $89
$1b:cecd  e3 ab		 sbc $ab,s
$1b:cecf  51 80		 eor ($80),y
$1b:ced1  45 93		 eor $93
$1b:ced3  8a			txa
$1b:ced4  5f 08 0a 94   eor $940a08,x
$1b:ced8  15 c1		 ora $c1,x
$1b:ceda  04 25		 tsb $25
$1b:cedc  0c 26 01	  tsb $0126
$1b:cedf  0e 87 a9	  asl $a987
$1b:cee2  05 36		 ora $36
$1b:cee4  09 b6 82	  ora #$82b6
$1b:cee7  8c 06 10	  sty $1006
$1b:ceea  a8			tay
$1b:ceeb  09 20 e0	  ora #$e020
$1b:ceee  5a			phy
$1b:ceef  23 1e		 and $1e,s
$1b:cef1  47 8c		 eor [$8c]
$1b:cef3  46 04		 lsr $04
$1b:cef5  3c 12 e0	  bit $e012,x
$1b:cef8  36 06		 rol $06,x
$1b:cefa  1a			inc a
$1b:cefb  61 28		 adc ($28,x)
$1b:cefd  34 28		 bit $28,x
$1b:ceff  ce 2b bf	  dec $bf2b
$1b:cf02  19 83 c0	  ora $c083,y
$1b:cf05  15 a6		 ora $a6,x
$1b:cf07  f0 05		 beq $cf0e
$1b:cf09  a1 bc		 lda ($bc,x)
$1b:cf0b  04 e5		 tsb $e5
$1b:cf0d  f2 67		 sbc ($67)
$1b:cf0f  80 b4		 bra $cec5
$1b:cf11  49 16 0d	  eor #$0d16
$1b:cf14  73 49		 adc ($49,s),y
$1b:cf16  7a			ply
$1b:cf17  a4 61		 ldy $61
$1b:cf19  02 f1		 cop #$f1
$1b:cf1b  77 04		 adc [$04],y
$1b:cf1d  42 1c		 wdm #$1c
$1b:cf1f  8b			phb
$1b:cf20  46 80		 lsr $80
$1b:cf22  ad fe 01	  lda $01fe
$1b:cf25  28			plp
$1b:cf26  65 7b		 adc $7b
$1b:cf28  6e 05 e2	  ror $e205
$1b:cf2b  a8			tay
$1b:cf2c  28			plp
$1b:cf2d  52 9d		 eor ($9d)
$1b:cf2f  21 ed		 and ($ed,x)
$1b:cf31  81 20		 sta ($20,x)
$1b:cf33  da			phx
$1b:cf34  a4 0a		 ldy $0a
$1b:cf36  c1 2a		 cmp ($2a,x)
$1b:cf38  6c 18 54	  jmp ($5418)
$1b:cf3b  89 e2 58	  bit #$58e2
$1b:cf3e  04 58		 tsb $58
$1b:cf40  36 c0		 rol $c0,x
$1b:cf42  ca			dex
$1b:cf43  6d b0 36	  adc $36b0
$1b:cf46  74 10		 stz $10,x
$1b:cf48  fa			plx
$1b:cf49  94 02		 sty $02,x
$1b:cf4b  a8			tay
$1b:cf4c  41 0a		 eor ($0a,x)
$1b:cf4e  a1 10		 lda ($10,x)
$1b:cf50  8f 95 41 0c   sta $0c4195
$1b:cf54  65 50		 adc $50
$1b:cf56  46 99		 lsr $99
$1b:cf58  54 09 5f	  mvn $5f,$09
$1b:cf5b  00 b0		 brk #$b0
$1b:cf5d  17 5d		 ora [$5d],y
$1b:cf5f  52 65		 eor ($65)
$1b:cf61  50 58		 bvc $cfbb
$1b:cf63  19 ca c1	  ora $c1ca,y
$1b:cf66  0b			phd
$1b:cf67  42 43		 wdm #$43
$1b:cf69  c2 7f		 rep #$7f
$1b:cf6b  ec 4b 1f	  cpx $1f4b
$1b:cf6e  02 c5		 cop #$c5
$1b:cf70  10 d6		 bpl $cf48
$1b:cf72  92 f3		 sta ($f3)
$1b:cf74  90 86		 bcc $cefc
$1b:cf76  be c8 6b	  ldx $6bc8,y
$1b:cf79  18			clc
$1b:cf7a  4b			phk
$1b:cf7b  b4 c6		 ldy $c6,x
$1b:cf7d  a6 d5		 ldx $d5
$1b:cf7f  21 f0		 and ($f0,x)
$1b:cf81  98			tya
$1b:cf82  04 88		 tsb $88
$1b:cf84  50 44		 bvc $cfca
$1b:cf86  b8			clv
$1b:cf87  3c c2 48	  bit $48c2,x
$1b:cf8a  78			sei
$1b:cf8b  54 b8 1b	  mvn $1b,$b8
$1b:cf8e  86 01		 stx $01
$1b:cf90  14 a3		 trb $a3
$1b:cf92  31 80		 and ($80),y
$1b:cf94  2a			rol a
$1b:cf95  23 40		 and $40,s
$1b:cf97  a0 0d c6	  ldy #$c60d
$1b:cf9a  21 04		 and ($04,x)
$1b:cf9c  a3 70		 lda $70,s
$1b:cf9e  0d c2 41	  ora $41c2
$1b:cfa1  1c 04 04	  trb $0404
$1b:cfa4  1c 11 48	  trb $4811
$1b:cfa7  05 01		 ora $01
$1b:cfa9  e0 10 c2	  cpx #$c210
$1b:cfac  a0 23 0a	  ldy #$0a23
$1b:cfaf  15 0e		 ora $0e,x
$1b:cfb1  2b			pld
$1b:cfb2  01 c4		 ora ($c4,x)
$1b:cfb4  61 f0		 adc ($f0,x)
$1b:cfb6  92 e9		 sta ($e9)
$1b:cfb8  08			php
$1b:cfb9  bc 66 14	  ldy $1466,x
$1b:cfbc  81 b1		 sta ($b1,x)
$1b:cfbe  10 42		 bpl $d002
$1b:cfc0  90 44		 bcc $d006
$1b:cfc2  4b			phk
$1b:cfc3  41 2c		 eor ($2c,x)
$1b:cfc5  07 05		 ora [$05]
$1b:cfc7  68			pla
$1b:cfc8  1e 81 37	  asl $3781,x
$1b:cfcb  cb			wai
$1b:cfcc  de 29 ab	  dec $ab29,x
$1b:cfcf  30 d9		 bmi $cfaa
$1b:cfd1  2c c3 d4	  bit $d4c3
$1b:cfd4  b3 20		 lda ($20,s),y
$1b:cfd6  d2 cc		 cmp ($cc)
$1b:cfd8  4b			phk
$1b:cfd9  4b			phk
$1b:cfda  02 61		 cop #$61
$1b:cfdc  e1 0a		 sbc ($0a,x)
$1b:cfde  40			rti
$1b:cfdf  88			dey
$1b:cfe0  47 03		 eor [$03]
$1b:cfe2  43 08		 eor $08,s
$1b:cfe4  4e 04 75	  lsr $7504
$1b:cfe7  5b			tcd
$1b:cfe8  eb			xba
$1b:cfe9  e1 b4		 sbc ($b4,x)
$1b:cfeb  1f 12 d0 83   ora $83d012,x
$1b:cfef  4a			lsr a
$1b:cff0  42 29		 wdm #$29
$1b:cff2  29 09 14	  and #$1409
$1b:cff5  6e fb b9	  ror $b9fb
$1b:cff8  3f 9f f8 63   and $63f89f,x
$1b:cffc  d4 56		 pei ($56)
$1b:cffe  89 03 7c	  bit #$7c03
$1b:d001  8a			txa
$1b:d002  d0 6d		 bne $d071
$1b:d004  e4 72		 cpx $72
$1b:d006  49 85 fc	  eor #$fc85
$1b:d009  90 70		 bcc $d07b
$1b:d00b  0c 7c 00	  tsb $007c
$1b:d00e  75 e8		 adc $e8,x
$1b:d010  50 cf		 bvc $cfe1
$1b:d012  13 93		 ora ($93,s),y
$1b:d014  5c 55 4d f1   jml $f14d55
$1b:d018  73 d6		 adc ($d6,s),y
$1b:d01a  83 9f		 sta $9f,s
$1b:d01c  27 26		 and [$26]
$1b:d01e  bc aa 9b	  ldy $9baa,x
$1b:d021  f3 f9		 sbc ($f9,s),y
$1b:d023  c8			iny
$1b:d024  1f 2a 24 02   ora $02242a,x
$1b:d028  39 46 39	  and $3946,y
$1b:d02b  c4 e3		 cpy $e3
$1b:d02d  88			dey
$1b:d02e  77 89		 adc [$89],y
$1b:d030  07 08		 ora [$08]
$1b:d032  f7 2c		 sbc [$2c],y
$1b:d034  4e 01 fe	  lsr $fe01
$1b:d037  51 7a		 eor ($7a),y
$1b:d039  cc 79 eb	  cpy $eb79
$1b:d03c  74 ef		 stz $ef,x
$1b:d03e  af 93 de c5   lda $c5de93
$1b:d042  4f f9 ff d0   eor $d0fff9
$1b:d046  c3 6e		 cmp $6e,s
$1b:d048  27 25		 and [$25]
$1b:d04a  f8			sed
$1b:d04b  aa			tax
$1b:d04c  98			tya
$1b:d04d  e6 67		 inc $67
$1b:d04f  b1 c7		 lda ($c7),y
$1b:d051  18			clc
$1b:d052  b7 4c		 lda [$4c],y
$1b:d054  e2 f9		 sep #$f9
$1b:d056  31 ac		 and ($ac),y
$1b:d058  54 ce b4	  mvn $b4,$ce
$1b:d05b  8e 2b 00	  stx $002b
$1b:d05e  fd ff da	  sbc $daff,x
$1b:d061  a5 01		 lda $01
$1b:d063  27 8b		 and [$8b]
$1b:d065  48			pha
$1b:d066  69 4d		 adc #$4d
$1b:d068  21 89		 and ($89,x)
$1b:d06a  91 de		 sta ($de),y
$1b:d06c  04 4f		 tsb $4f
$1b:d06e  14 60		 trb $60
$1b:d070  d3 09		 cmp ($09,s),y
$1b:d072  e0 8c		 cpx #$8c
$1b:d074  2a			rol a
$1b:d075  65 01		 adc $01
$1b:d077  0c 11 72	  tsb $7211
$1b:d07a  e5 c1		 sbc $c1
$1b:d07c  df a1 4e 27   cmp $274ea1,x
$1b:d080  82 14 50	  brl $2097
$1b:d083  e0 74		 cpx #$74
$1b:d085  18			clc
$1b:d086  d9 72 e1	  cmp $e172,y
$1b:d089  6f d0 b5 13   adc $13b5d0
$1b:d08d  c1 42		 cmp ($42,x)
$1b:d08f  2a			rol a
$1b:d090  30 3a		 bmi $d0cc
$1b:d092  0c 7c b9	  tsb $b97c
$1b:d095  70 f7		 bvs $d08e
$1b:d097  e8			inx
$1b:d098  5b			tcd
$1b:d099  09 e0		 ora #$e0
$1b:d09b  bd 15 f8	  lda $f815,x
$1b:d09e  50 0c		 bvc $d0ac
$1b:d0a0  a1 11		 lda ($11,x)
$1b:d0a2  2e 74 b0	  rol $b074
$1b:d0a5  da			phx
$1b:d0a6  92 c3		 sta ($c3)
$1b:d0a8  a0 af		 ldy #$af
$1b:d0aa  42 3a		 wdm #$3a
$1b:d0ac  b2 58		 lda ($58)
$1b:d0ae  30 7c		 bmi $d12c
$1b:d0b0  50 a1		 bvc $d053
$1b:d0b2  10 97		 bpl $d04b
$1b:d0b4  3c c9 ec	  bit $ecc9,x
$1b:d0b7  27 41		 and [$41]
$1b:d0b9  83 c2		 sta $c2,s
$1b:d0bb  21 13		 and ($13,x)
$1b:d0bd  e7 99		 sbc [$99]
$1b:d0bf  01 04		 ora ($04,x)
$1b:d0c1  00 4b		 brk #$4b
$1b:d0c3  50 9f		 bvc $d064
$1b:d0c5  bc cc 26	  ldy $26cc,x
$1b:d0c8  14 02		 trb $02
$1b:d0ca  80 2d		 bra $d0f9
$1b:d0cc  48			pha
$1b:d0cd  88			dey
$1b:d0ce  4b			phk
$1b:d0cf  73 29		 adc ($29,s),y
$1b:d0d1  16 2a		 asl $2a,x
$1b:d0d3  08			php
$1b:d0d4  50 3c		 bvc $d112
$1b:d0d6  55 10		 eor $10,x
$1b:d0d8  46 82		 lsr $82
$1b:d0da  34 19		 bit $19,x
$1b:d0dc  1b			tcs
$1b:d0dd  94 35		 sty $35,x
$1b:d0df  50 41		 bvc $d122
$1b:d0e1  cf b9 43 94   cmp $9443b9
$1b:d0e5  4d f7 90	  eor $90f7
$1b:d0e8  fa			plx
$1b:d0e9  86 22		 stx $22
$1b:d0eb  1f fd 60 c5   ora $c560fd,x
$1b:d0ef  35 94		 and $94,x
$1b:d0f1  43 c7		 eor $c7,s
$1b:d0f3  b9 43 98	  lda $9843,y
$1b:d0f6  31 4e		 and ($4e),y
$1b:d0f8  62 4d 52	  per $2348
$1b:d0fb  88			dey
$1b:d0fc  a0 48		 ldy #$48
$1b:d0fe  0f b0 62 43   ora $4362b0
$1b:d102  20 f6 71	  jsr $71f6
$1b:d105  04 65		 tsb $65
$1b:d107  18			clc
$1b:d108  11 43		 ora ($43),y
$1b:d10a  c8			iny
$1b:d10b  61 18		 adc ($18,x)
$1b:d10d  01 99		 ora ($99,x)
$1b:d10f  42 20		 wdm #$20
$1b:d111  19 01 11	  ora $1101,y
$1b:d114  b4 1a		 ldy $1a,x
$1b:d116  06 d9		 asl $d9
$1b:d118  66 e0		 ror $e0
$1b:d11a  86 43		 stx $43
$1b:d11c  60			rts
$1b:d11d  e2 20		 sep #$20
$1b:d11f  c8			iny
$1b:d120  6c 5c f6	  jmp ($f65c)
$1b:d123  d8			cld
$1b:d124  5e 03 81	  lsr $8103,x
$1b:d127  3a			dec a
$1b:d128  0e 7f 0d	  asl $0d7f
$1b:d12b  9b			txy
$1b:d12c  f4 fe 00	  pea $00fe
$1b:d12f  34 f8		 bit $f8,x
$1b:d131  82 bc 84	  brl $55f0
$1b:d134  38			sec
$1b:d135  20 fa 64	  jsr $64fa
$1b:d138  84 de		 sty $de
$1b:d13a  5a			phy
$1b:d13b  32 10		 and ($10)
$1b:d13d  9a			txs
$1b:d13e  03 64		 ora $64,s
$1b:d140  42 4d		 wdm #$4d
$1b:d142  99 27 c8	  sta $c827,y
$1b:d145  43 c2		 eor $c2,s
$1b:d147  0f a7 48 cb   ora $cb48a7
$1b:d14b  e9 93		 sbc #$93
$1b:d14d  3d 9f c8	  and $c89f,x
$1b:d150  84 9f		 sty $9f
$1b:d152  38			sec
$1b:d153  07 ff		 ora [$ff]
$1b:d155  ff 0f 75 bc   sbc $bc750f,x
$1b:d159  15 48		 ora $48,x
$1b:d15b  10 38		 bpl $d195
$1b:d15d  1a			inc a
$1b:d15e  9c 30 8a	  stz $8a30
$1b:d161  40			rti
$1b:d162  80 c1		 bra $d125
$1b:d164  61 10		 adc ($10,x)
$1b:d166  86 d8		 stx $d8
$1b:d168  c0 20		 cpy #$20
$1b:d16a  d0 c8		 bne $d134
$1b:d16c  26 15		 rol $15
$1b:d16e  c8			iny
$1b:d16f  30 08		 bmi $d179
$1b:d171  4c 1d d2	  jmp $d21d
$1b:d174  30 51		 bmi $d1c7
$1b:d176  00 44		 brk #$44
$1b:d178  1d 21 fe	  ora $fe21,x
$1b:d17b  ff a4 4a 08   sbc $084aa4,x
$1b:d17f  cf 66 f0 40   cmp $40f066
$1b:d183  21 8d		 and ($8d,x)
$1b:d185  b1 6b		 lda ($6b),y
$1b:d187  84 22		 sty $22
$1b:d189  08			php
$1b:d18a  e2 38		 sep #$38
$1b:d18c  24 21		 bit $21
$1b:d18e  d2 70		 cmp ($70)
$1b:d190  18			clc
$1b:d191  5b			tcd
$1b:d192  a4 5b		 ldy $5b
$1b:d194  c1 0c		 cmp ($0c,x)
$1b:d196  80 3a		 bra $d1d2
$1b:d198  46 01		 lsr $01
$1b:d19a  17 53		 ora [$53],y
$1b:d19c  0b			phd
$1b:d19d  e5 1a		 sbc $1a
$1b:d19f  83 00		 sta $00,s
$1b:d1a1  87 b5		 sta [$b5]
$1b:d1a3  c1 b6		 cmp ($b6,x)
$1b:d1a5  30 88		 bmi $d12f
$1b:d1a7  3b			tsc
$1b:d1a8  b0 1b		 bcs $d1c5
$1b:d1aa  63 04		 adc $04,s
$1b:d1ac  85 bc		 sta $bc
$1b:d1ae  c1 e0		 cmp ($e0,x)
$1b:d1b0  50 a7		 bvc $d159
$1b:d1b2  28			plp
$1b:d1b3  3a			dec a
$1b:d1b4  45 94		 eor $94
$1b:d1b6  10 27		 bpl $d1df
$1b:d1b8  41 40		 eor ($40,x)
$1b:d1ba  22 30 08 ab   jsl $ab0830
$1b:d1be  36 1d		 rol $1d,x
$1b:d1c0  a1 0d		 lda ($0d,x)
$1b:d1c2  6d 14 18	  adc $1814
$1b:d1c5  20 10 57	  jsr $5710
$1b:d1c8  11 3b		 ora ($3b),y
$1b:d1ca  80 a2		 bra $d16e
$1b:d1cc  47 10		 eor [$10]
$1b:d1ce  85 c0		 sta $c0
$1b:d1d0  8a			txa
$1b:d1d1  43 09		 eor $09,s
$1b:d1d3  52 04		 eor ($04)
$1b:d1d5  34 50		 bit $50,x
$1b:d1d7  51 22		 eor ($22),y
$1b:d1d9  e0 ac		 cpx #$ac
$1b:d1db  40			rti
$1b:d1dc  64 d0		 stz $d0
$1b:d1de  a0 f8		 ldy #$f8
$1b:d1e0  36 c6		 rol $c6,x
$1b:d1e2  0a			asl a
$1b:d1e3  df 00 91 40   cmp $409100,x
$1b:d1e7  61 30		 adc ($30,x)
$1b:d1e9  57 79		 eor [$79],y
$1b:d1eb  05 c0		 ora $c0
$1b:d1ed  14 05		 trb $05
$1b:d1ef  21 27		 and ($27,x)
$1b:d1f1  80 99		 bra $d18c
$1b:d1f3  0a			asl a
$1b:d1f4  a0 01		 ldy #$01
$1b:d1f6  0f fb e9 4c   ora $4ce9fb
$1b:d1fa  01 07		 ora ($07,x)
$1b:d1fc  66 06		 ror $06
$1b:d1fe  51 96		 eor ($96),y
$1b:d200  4c e1 a0	  jmp $a0e1
$1b:d203  33 0a		 and ($0a,s),y
$1b:d205  01 94		 ora ($94,x)
$1b:d207  e0 32		 cpx #$32
$1b:d209  c6 0e		 dec $0e
$1b:d20b  dd 0c 00	  cmp $000c,x
$1b:d20e  00 08		 brk #$08
$1b:d210  81 40		 sta ($40,x)
$1b:d212  1d e9 18	  ora $18e9,x
$1b:d215  90 46		 bcc $d25d
$1b:d217  24 31		 bit $31
$1b:d219  89 84		 bit #$84
$1b:d21b  62 62 f9	  per $cb80
$1b:d21e  17 c0		 ora [$c0],y
$1b:d220  3f 82 61 16   and $166182,x
$1b:d224  c6 45		 dec $45
$1b:d226  a5 b1		 lda $b1
$1b:d228  6b			rtl
$1b:d229  64 5a		 stz $5a
$1b:d22b  db			stp
$1b:d22c  16 96		 asl $96,x
$1b:d22e  45 b1		 eor $b1
$1b:d230  f1 6b		 sbc ($6b),y
$1b:d232  74 5a		 stz $5a,x
$1b:d234  df 16 85 45   cmp $458516,x
$1b:d238  a1 b1		 lda ($b1,x)
$1b:d23a  69 54		 adc #$54
$1b:d23c  5a			phy
$1b:d23d  17 16		 ora [$16],y
$1b:d23f  86 06		 stx $06
$1b:d241  46 39		 lsr $39
$1b:d243  16 8e		 asl $8e,x
$1b:d245  87 c6		 sta [$c6]
$1b:d247  1f 16 87 45   ora $458716,x
$1b:d24b  a5 ef		 lda $ef
$1b:d24d  71 91		 adc ($91),y
$1b:d24f  be c6 66	  ldx $66c6,y
$1b:d252  f7 39		 sbc [$39],y
$1b:d254  90 d4		 bcc $d22a
$1b:d256  c6 40		 dec $40
$1b:d258  3c 18 b5	  bit $b518,x
$1b:d25b  f2 2d		 sbc ($2d)
$1b:d25d  7d 8b 4b	  adc $4b8b,x
$1b:d260  a2 d8		 ldx #$d8
$1b:d262  d8			cld
$1b:d263  b5 fa		 lda $fa,x
$1b:d265  2d 7f 8b	  and $8b7f
$1b:d268  63 a2		 adc $a2,s
$1b:d26a  d2 b8		 cmp ($b8)
$1b:d26c  b4 6a		 ldy $6a,x
$1b:d26e  2d 1b 0d	  and $0d1b
$1b:d271  89 58		 bit #$58
$1b:d273  39 51 6e	  and $6e51,y
$1b:d276  5c 5b b5 16   jml $16b55b
$1b:d27a  ed c5 a3	  sbc $a3c5
$1b:d27d  d1 68		 cmp ($68),y
$1b:d27f  f9 2c 45	  sbc $452c,y
$1b:d282  c0 fa		 cpy #$fa
$1b:d284  09 13		 ora #$13
$1b:d286  f4 47 80	  pea $8047
$1b:d289  00 21		 brk #$21
$1b:d28b  b0 1d		 bcs $d2aa
$1b:d28d  88			dey
$1b:d28e  e4 07		 cpx $07
$1b:d290  c1 8b		 cmp ($8b,x)
$1b:d292  67 22		 adc [$22]
$1b:d294  d9 d8 b6	  cmp $b6d8,y
$1b:d297  b2 2d		 lda ($2d)
$1b:d299  ad 8b 67	  lda $678b
$1b:d29c  a2 d9		 ldx #$d9
$1b:d29e  f1 18		 sbc ($18),y
$1b:d2a0  eb			xba
$1b:d2a1  ca			dex
$1b:d2a2  e3 3b		 sbc $3b,s
$1b:d2a4  8b			phb
$1b:d2a5  52 a2		 eor ($a2)
$1b:d2a7  d4 b0		 pei ($b0)
$1b:d2a9  78			sei
$1b:d2aa  82 82 79	  brl $4c2f
$1b:d2ad  16 9e		 asl $9e,x
$1b:d2af  c5 a7		 cmp $a7
$1b:d2b1  c6 91		 dec $91
$1b:d2b3  a7 45		 lda [$45]
$1b:d2b5  a9 ef		 lda #$ef
$1b:d2b7  75 1b		 adc $1b,x
$1b:d2b9  00 01		 brk #$01
$1b:d2bb  07 80		 ora [$80]
$1b:d2bd  30 49		 bmi $d308
$1b:d2bf  a4 7b		 ldy $7b
$1b:d2c1  19 1e 96	  ora $961e,y
$1b:d2c4  c7 ad		 cmp [$ad]
$1b:d2c6  91 eb		 sta ($eb),y
$1b:d2c8  6c 7a 59	  jmp ($597a)
$1b:d2cb  1e c7 c7	  asl $c7c7,x
$1b:d2ce  ad d1 e0	  lda $e0d1
$1b:d2d1  b0 56		 bcs $d329
$1b:d2d3  a2 d4		 ldx #$d4
$1b:d2d5  d8			cld
$1b:d2d6  b5 6e		 lda $6e,x
$1b:d2d8  2d 5d 8b	  and $8b5d
$1b:d2db  53 1b		 eor ($1b,s),y
$1b:d2dd  23 5c		 and $5c,s
$1b:d2df  6e 9d 7e	  ror $7e9d
$1b:d2e2  2c e4 0a	  bit $0ae4
$1b:d2e5  f0 dd		 beq $d2c4
$1b:d2e7  66 a7		 ror $a7
$1b:d2e9  75 92		 adc $92,x
$1b:d2eb  9b			txy
$1b:d2ec  d6 49		 dec $49,x
$1b:d2ee  1e be 47	  asl $47be,x
$1b:d2f1  af b1 e9 74   lda $74e9b1
$1b:d2f5  7b			tdc
$1b:d2f6  1b			tcs
$1b:d2f7  1e bf 47	  asl $47bf,x
$1b:d2fa  af f1 ec 74   lda $74ecf1
$1b:d2fe  7a			ply
$1b:d2ff  57 1e		 eor [$1e],y
$1b:d301  85 47		 sta $47
$1b:d303  a1 b1		 lda ($b1,x)
$1b:d305  e9 54		 sbc #$54
$1b:d307  7a			ply
$1b:d308  17 1e		 ora [$1e],y
$1b:d30a  86 06		 stx $06
$1b:d30c  46 39		 lsr $39
$1b:d30e  1e 8e 87	  asl $878e,x
$1b:d311  c6 1f		 dec $1f
$1b:d313  1e 87 47	  asl $4787,x
$1b:d316  8d c1 40	  sta $40c1
$1b:d319  8c 50 63	  sty $6350
$1b:d31c  15 08		 ora $08,x
$1b:d31e  c5 46		 cmp $46
$1b:d320  31 42		 and ($42),y
$1b:d322  8c 50 e3	  sty $e350
$1b:d325  15 28		 ora $28,x
$1b:d327  c5 4c		 cmp $4c
$1b:d329  6e 51 cf	  ror $cf51
$1b:d32c  9d 73 e7	  sta $e773,x
$1b:d32f  1e ce 47	  asl $47ce,x
$1b:d332  b3 b1		 lda ($b1,s),y
$1b:d334  ed 64 7b	  sbc $7b64
$1b:d337  5b			tcd
$1b:d338  1e cf 47	  asl $47cf,x
$1b:d33b  b3 e2		 lda ($e2,s),y
$1b:d33d  31 d7		 and ($d7),y
$1b:d33f  c7 a3		 cmp [$a3]
$1b:d341  51 e8		 eor ($e8),y
$1b:d343  d8			cld
$1b:d344  6c 65 71	  jmp ($7165)
$1b:d347  88			dey
$1b:d348  2c 62 0d	  bit $0d62
$1b:d34b  18			clc
$1b:d34c  8a			txa
$1b:d34d  c6 22		 dec $22
$1b:d34f  d1 e3		 cmp ($e3),y
$1b:d351  38			sec
$1b:d352  47 c1		 eor [$c1]
$1b:d354  63 2f		 adc $2f,s
$1b:d356  67 8c		 adc [$8c]
$1b:d358  1e 3d 3c	  asl $3c3d,x
$1b:d35b  8f 45 ce 22   sta $22ce45
$1b:d35f  ca			dex
$1b:d360  03 b0		 ora $b0,s
$1b:d362  4f 63 d4 c8   eor $c8d463
$1b:d366  f4 9e 3d	  pea $3d9e
$1b:d369  5c 8f 4d d0   jml $d04d8f
$1b:d36d  23 4d		 and $4d,s
$1b:d36f  42 8d		 wdm #$8d
$1b:d371  76 3d		 ror $3d,x
$1b:d373  68			pla
$1b:d374  8f 5a 63 d7   sta $d7635a
$1b:d378  88			dey
$1b:d379  f5 e4		 sbc $e4,x
$1b:d37b  ae 33 b8	  ldx $b833
$1b:d37e  f5 2a		 sbc $2a,x
$1b:d380  3d 4b 67	  and $674b,x
$1b:d383  8b			phb
$1b:d384  28			plp
$1b:d385  0e 80 7e	  asl $7e80
$1b:d388  09 f1		 ora #$f1
$1b:d38a  a4 69		 ldy $69
$1b:d38c  d1 ea		 cmp ($ea),y
$1b:d38e  7c 6b e0	  jmp ($e06b,x)
$1b:d391  af 0c f7 7b   lda $7bf70c
$1b:d395  3d df 57	  and $57df,x
$1b:d398  84 7b		 sty $7b
$1b:d39a  de b7 1f	  dec $1fb7,x
$1b:d39d  72 e5		 adc ($e5)
$1b:d39f  16 2c		 asl $2c,x
$1b:d3a1  b7 1c		 lda [$1c],y
$1b:d3a3  44 7b 13	  mvp $13,$7b
$1b:d3a6  1e cc 47	  asl $47cc,x
$1b:d3a9  b3 31		 lda ($31,s),y
$1b:d3ab  ea			nop
$1b:d3ac  d2 24		 cmp ($24)
$1b:d3ae  6b			rtl
$1b:d3af  68			pla
$1b:d3b0  d1 40		 cmp ($40),y
$1b:d3b2  02 28		 cop #$28
$1b:d3b4  10 80		 bpl $d336
$1b:d3b6  de 2a fa	  dec $fa2a,x
$1b:d3b9  0c 6b d0	  tsb $d06b
$1b:d3bc  e8			inx
$1b:d3bd  44 3a 13	  mvp $13,$3a
$1b:d3c0  0e 8c 43	  asl $438c
$1b:d3c3  a3 31		 lda $31,s
$1b:d3c5  e8			inx
$1b:d3c6  44 7a 13	  mvp $13,$7a
$1b:d3c9  1e 8c 47	  asl $478c,x
$1b:d3cc  a3 31		 lda $31,s
$1b:d3ce  68			pla
$1b:d3cf  44 5a 13	  mvp $13,$5a
$1b:d3d2  16 32		 asl $32,x
$1b:d3d4  84 64		 sty $64
$1b:d3d6  5e 11 49	  lsr $4911,x
$1b:d3d9  f8			sed
$1b:d3da  cc 01 20	  cpy $2001
$1b:d3dd  09 1a		 ora #$1a
$1b:d3df  08			php
$1b:d3e0  24 46		 bit $46
$1b:d3e2  c2 09		 rep #$09
$1b:d3e4  1a			inc a
$1b:d3e5  90 34		 bcc $d41b
$1b:d3e7  e8			inx
$1b:d3e8  60			rts
$1b:d3e9  91 a9		 sta ($a9),y
$1b:d3eb  83 4c		 sta $4c,s
$1b:d3ed  38			sec
$1b:d3ee  30 e9		 bmi $d3d9
$1b:d3f0  44 3a 53	  mvp $53,$3a
$1b:d3f3  0e 9c 43	  asl $439c
$1b:d3f6  a7 31		 lda [$31]
$1b:d3f8  e9 44		 sbc #$44
$1b:d3fa  7a			ply
$1b:d3fb  53 1e		 eor ($1e,s),y
$1b:d3fd  9c 47 a7	  stz $a747
$1b:d400  31 69		 and ($69),y
$1b:d402  44 5a 53	  mvp $53,$5a
$1b:d405  16 9c		 asl $9c,x
$1b:d407  45 a7		 eor $a7
$1b:d409  20 d3 a8	  jsr $a8d3
$1b:d40c  05 46		 ora $46
$1b:d40e  80 11		 bra $d421
$1b:d410  22 9a 06 c0   jsl $c0069a
$1b:d414  4a			lsr a
$1b:d415  01 70		 ora ($70,x)
$1b:d417  10 91		 bpl $d3aa
$1b:d419  55 41		 eor $41,x
$1b:d41b  83 0e		 sta $0e,s
$1b:d41d  a4 43		 ldy $43
$1b:d41f  a9 30		 lda #$30
$1b:d421  ea			nop
$1b:d422  c4 3a		 cpy $3a
$1b:d424  b3 1e		 lda ($1e,s),y
$1b:d426  a4 47		 ldy $47
$1b:d428  a9 31		 lda #$31
$1b:d42a  ea			nop
$1b:d42b  c4 7a		 cpy $7a
$1b:d42d  b3 16		 lda ($16,s),y
$1b:d42f  a4 45		 ldy $45
$1b:d431  a9 31		 lda #$31
$1b:d433  6a			ror a
$1b:d434  c4 5a		 cpy $5a
$1b:d436  b2 4f		 lda ($4f)
$1b:d438  20 59 17	  jsr $1759
$1b:d43b  d0 ba		 bne $d3f7
$1b:d43d  81 b2		 sta ($b2,x)
$1b:d43f  27 a0		 and [$a0]
$1b:d441  54 0a aa	  mvn $aa,$0a
$1b:d444  26 12		 rol $12
$1b:d446  8a			txa
$1b:d447  01 c8		 ora ($c8,x)
$1b:d449  1a			inc a
$1b:d44a  61 81		 adc ($81,x)
$1b:d44c  59 a0 44	  eor $44a0,y
$1b:d44f  23 9f		 and $9f,s
$1b:d451  3a			dec a
$1b:d452  e7 cc		 sbc [$cc]
$1b:d454  1e 44 b4	  asl $b444,x
$1b:d457  24 a0		 bit $a0
$1b:d459  7c 8b 64	  jmp ($648b,x)
$1b:d45c  55 52		 eor $52,x
$1b:d45e  71 51		 adc ($51),y
$1b:d460  49 63		 eor #$63
$1b:d462  55 43		 eor $43,x
$1b:d464  9d 51 ea	  sta $ea51,x
$1b:d467  29 82		 and #$82
$1b:d469  ab			plb
$1b:d46a  46 2a		 lsr $2a
$1b:d46c  e8			inx
$1b:d46d  74 7e		 stz $7e,x
$1b:d46f  9d 1d 86	  sta $861d,x
$1b:d472  33 a2		 and ($a2,s),y
$1b:d474  fa			plx
$1b:d475  47 24		 eor [$24]
$1b:d477  c5 f2		 cmp $f2
$1b:d479  0e 81 64	  asl $6481
$1b:d47c  22 d2 c8 b4   jsl $b4c8d2
$1b:d480  b6 2d		 ldx $2d,y
$1b:d482  60			rts
$1b:d483  8b			phb
$1b:d484  58			cli
$1b:d485  41 e4		 eor ($e4,x)
$1b:d487  5b			tcd
$1b:d488  10 32		 bpl $d4bc
$1b:d48a  3f 02 88 ff   and $ff8802,x
$1b:d48e  5a			phy
$1b:d48f  33 bd		 and ($bd,s),y
$1b:d491  66 c9		 ror $c9
$1b:d493  f4 0e 8b	  pea $8b0e
$1b:d496  20 84 85	  jsr $8584
$1b:d499  90 8b		 bcc $d426
$1b:d49b  64 62		 stz $62
$1b:d49d  d5 c8		 cmp $c8,x
$1b:d49f  b5 76		 lda $76,x
$1b:d4a1  2d 70 8b	  and $8b70
$1b:d4a4  5c 62 d8 08   jml $08d862
$1b:d4a8  b6 06		 ldx $06,y
$1b:d4aa  29 84		 and #$84
$1b:d4ac  8a			txa
$1b:d4ad  61 4e		 adc ($4e,x)
$1b:d4af  23 84		 and $84,s
$1b:d4b1  8b			phb
$1b:d4b2  58			cli
$1b:d4b3  a2 d6		 ldx #$d6
$1b:d4b5  38			sec
$1b:d4b6  b5 ca		 lda $ca,x
$1b:d4b8  2d 73 8a	  and $8a73
$1b:d4bb  60			rts
$1b:d4bc  a2 98		 ldx #$98
$1b:d4be  38			sec
$1b:d4bf  a6 4a		 ldx $4a
$1b:d4c1  29 93		 and #$93
$1b:d4c3  8a			txa
$1b:d4c4  59 22 96	  eor $9622,y
$1b:d4c7  58			cli
$1b:d4c8  a5 d2		 lda $d2
$1b:d4ca  29 75		 and #$75
$1b:d4cc  8a			txa
$1b:d4cd  59 a2 96	  eor $96a2,y
$1b:d4d0  78			sei
$1b:d4d1  a5 da		 lda $da
$1b:d4d3  29 77		 and #$77
$1b:d4d5  aa			tax
$1b:d4d6  65 0e		 adc $0e
$1b:d4d8  28			plp
$1b:d4d9  6f 5c a4 5b   adc $5ba45c
$1b:d4dd  0d 16 c3	  ora $c316
$1b:d4e0  c5 b2		 cmp $b2
$1b:d4e2  d1 6c		 cmp ($6c),y
$1b:d4e4  bc 5b 41	  ldy $415b,x
$1b:d4e7  16 d0		 asl $d0,x
$1b:d4e9  c5 b6		 cmp $b6
$1b:d4eb  11 6d		 ora ($6d),y
$1b:d4ed  8c 5b 45	  sty $455b
$1b:d4f0  16 d1		 asl $d1,x
$1b:d4f2  c5 b6		 cmp $b6
$1b:d4f4  51 6d		 eor ($6d),y
$1b:d4f6  9c 5b 49	  stz $495b
$1b:d4f9  16 d2		 asl $d2,x
$1b:d4fb  c5 b6		 cmp $b6
$1b:d4fd  91 6d		 sta ($6d),y
$1b:d4ff  ac 5b 4d	  ldy $4d5b
$1b:d502  16 d3		 asl $d3,x
$1b:d504  c5 b6		 cmp $b6
$1b:d506  d1 6d		 cmp ($6d),y
$1b:d508  b9 bd 5d	  lda $5dbd,y
$1b:d50b  00 70		 brk #$70
$1b:d50d  20 a0 35	  jsr $35a0
$1b:d510  98			tya
$1b:d511  e0 09		 cpx #$09
$1b:d513  83 4b		 sta $4b,s
$1b:d515  84 4b		 sty $4b
$1b:d517  91 12		 sta ($12),y
$1b:d519  e4 c4		 cpx $c4
$1b:d51b  bb			tyx
$1b:d51c  11 2e		 ora ($2e),y
$1b:d51e  cd 4b 93	  cmp $934b
$1b:d521  52 e4		 eor ($e4)
$1b:d523  54 9e c0	  mvn $c0,$9e
$1b:d526  f4 0e 34	  pea $340e
$1b:d529  4b			phk
$1b:d52a  8f 12 eb 44   sta $44eb12
$1b:d52e  ba			tsx
$1b:d52f  f1 2d		 sbc ($2d),y
$1b:d531  44 4b 53	  mvp $53,$4b
$1b:d534  12 dc		 ora ($dc)
$1b:d536  44 b7 25	  mvp $25,$b7
$1b:d539  d0 ac		 bne $d4e7
$1b:d53b  50 1b		 bvc $d558
$1b:d53d  65 1c		 adc $1c
$1b:d53f  82 05 c2	  brl $9747
$1b:d542  29 12		 and #$12
$1b:d544  0b			phd
$1b:d545  84 7b		 sty $7b
$1b:d547  81 1e		 sta ($1e,x)
$1b:d549  e0 c7		 cpx #$c7
$1b:d54b  ba			tsx
$1b:d54c  11 ee		 ora ($ee),y
$1b:d54e  89 1c		 bit #$1c
$1b:d550  0b			phd
$1b:d551  a1 18		 lda ($18,x)
$1b:d553  aa			tax
$1b:d554  45 35		 eor $35
$1b:d556  d1 0e		 cmp ($0e),y
$1b:d558  14 43		 trb $43
$1b:d55a  87 10		 sta [$10]
$1b:d55c  e9 44		 sbc #$44
$1b:d55e  3a			dec a
$1b:d55f  71 49		 adc ($49),y
$1b:d561  04 52		 tsb $52
$1b:d563  43 14		 eor $14,s
$1b:d565  98			tya
$1b:d566  45 26		 eor $26
$1b:d568  23 91		 and $91,s
$1b:d56a  1c 00 f8	  trb $f800
$1b:d56d  26 10		 rol $10
$1b:d56f  ec 64 3a	  cpx $3a64
$1b:d572  5b			tcd
$1b:d573  0e b6 43	  asl $43b6
$1b:d576  ad b0 e9	  lda $e9b0
$1b:d579  64 3b		 stz $3b
$1b:d57b  1f 0e b7 43   ora $43b70e,x
$1b:d57f  ad f0 e8	  lda $e8f0
$1b:d582  54 3a 1b	  mvn $1b,$3a
$1b:d585  0e 95 43	  asl $4395
$1b:d588  a1 70		 lda ($70,x)
$1b:d58a  e8			inx
$1b:d58b  61 64		 adc ($64,x)
$1b:d58d  63 90		 adc $90,s
$1b:d58f  e8			inx
$1b:d590  e9 7c		 sbc #$7c
$1b:d592  61 f0		 adc ($f0,x)
$1b:d594  e3 58		 sbc $58,s
$1b:d596  4b			phk
$1b:d597  c6 e3		 dec $e3
$1b:d599  23 1d		 and $1d,s
$1b:d59b  8c cc 6e	  sty $6ecc
$1b:d59e  73 23		 adc ($23,s),y
$1b:d5a0  a9 9c		 lda #$9c
$1b:d5a2  80 f8		 bra $d59c
$1b:d5a4  30 eb		 bmi $d591
$1b:d5a6  e4 3a		 cpx $3a
$1b:d5a8  fb			xce
$1b:d5a9  0e 97 43	  asl $4397
$1b:d5ac  b1 b0		 lda ($b0),y
$1b:d5ae  eb			xba
$1b:d5af  f4 3a ff	  pea $ff3a
$1b:d5b2  0e c7 43	  asl $43c7
$1b:d5b5  a5 70		 lda $70
$1b:d5b7  e8			inx
$1b:d5b8  d4 3a		 pei ($3a)
$1b:d5ba  36 5b		 rol $5b,x
$1b:d5bc  14 b0		 trb $b0
$1b:d5be  72 a1		 adc ($a1)
$1b:d5c0  dc b8 77	  jml [$77b8]
$1b:d5c3  6a			ror a
$1b:d5c4  1d db 87	  ora $87db,x
$1b:d5c7  47 a1		 eor [$a1]
$1b:d5c9  d1 f4		 cmp ($f4),y
$1b:d5cb  58			cli
$1b:d5cc  9b			txy
$1b:d5cd  80 74		 bra $d643
$1b:d5cf  12 21		 ora ($21)
$1b:d5d1  e8			inx
$1b:d5d2  9f 00 80 47   sta $478000,x
$1b:d5d6  60			rts
$1b:d5d7  5b			tcd
$1b:d5d8  12 c8		 ora ($c8)
$1b:d5da  17 83		 ora [$83],y
$1b:d5dc  0e ce 43	  asl $43ce
$1b:d5df  b3 b0		 lda ($b0,s),y
$1b:d5e1  ed 64 3b	  sbc $3b64
$1b:d5e4  5b			tcd
$1b:d5e5  0e cf 43	  asl $43cf
$1b:d5e8  b3 e6		 lda ($e6,s),y
$1b:d5ea  31 d7		 and ($d7),y
$1b:d5ec  a5 c6		 lda $c6
$1b:d5ee  77 0e		 adc [$0e],y
$1b:d5f0  a5 43		 lda $43
$1b:d5f2  a9 64		 lda #$64
$1b:d5f4  f1 25		 sbc ($25),y
$1b:d5f6  04 f2		 tsb $f2
$1b:d5f8  1d 3d 87	  ora $873d,x
$1b:d5fb  4f 95 23 4e   eor $4e2395
$1b:d5ff  87 53		 sta [$53]
$1b:d601  c6 ea		 dec $ea
$1b:d603  76 02		 ror $02,x
$1b:d605  02 1f		 cop #$1f
$1b:d607  00 e0		 brk #$e0
$1b:d609  93 48		 sta ($48,s),y
$1b:d60b  d7 c0		 cmp [$c0],y
$1b:d60d  0e 18 ee	  asl $ee18
$1b:d610  f6 3b		 inc $3b,x
$1b:d612  be 07 08	  ldx $0807,y
$1b:d615  77 bc		 adc [$bc],y
$1b:d617  1e 3e e8	  asl $e83e,x
$1b:d61a  75 6a		 adc $6a,x
$1b:d61c  1d 4d 87	  ora $874d,x
$1b:d61f  56 e1		 lsr $e1,x
$1b:d621  d5 d8		 cmp $d8,x
$1b:d623  75 30		 adc $30,x
$1b:d625  32 35		 and ($35)
$1b:d627  c0 e9		 cpy #$e9
$1b:d629  d7 c4		 cmp [$c4],y
$1b:d62b  63 5e		 adc $5e,s
$1b:d62d  3b			tsc
$1b:d62e  ac d5 6e	  ldy $6ed5
$1b:d631  b2 55		 lda ($55)
$1b:d633  7a			ply
$1b:d634  c9 02		 cmp #$02
$1b:d636  28			plp
$1b:d637  09 60		 ora #$60
$1b:d639  78			sei
$1b:d63a  e8			inx
$1b:d63b  21 da		 and ($da,x)
$1b:d63d  18			clc
$1b:d63e  76 c2		 ror $c2,x
$1b:d640  1d b1 87	  ora $87b1,x
$1b:d643  68			pla
$1b:d644  a1 da		 lda ($da,x)
$1b:d646  38			sec
$1b:d647  76 ca		 ror $ca,x
$1b:d649  1d b3 87	  ora $87b3,x
$1b:d64c  69 21		 adc #$21
$1b:d64e  da			phx
$1b:d64f  58			cli
$1b:d650  76 d2		 ror $d2,x
$1b:d652  1d b5 c7	  ora $c7b5,x
$1b:d655  6f 31 db d8   adc $d8db31
$1b:d659  76 f2		 ror $f2,x
$1b:d65b  1d bd c7	  ora $c7bd,x
$1b:d65e  6f b1 db f8   adc $f8dbb1
$1b:d662  76 fa		 ror $fa,x
$1b:d664  1d bf 8b	  ora $8bbf,x
$1b:d667  70 22		 bvs $d68b
$1b:d669  dc 18 b7	  jml [$b718]
$1b:d66c  42 2d		 wdm #$2d
$1b:d66e  d1 87		 cmp ($87),y
$1b:d670  70 21		 bvs $d693
$1b:d672  dc 18 77	  jml [$7718]
$1b:d675  42 1d		 wdm #$1d
$1b:d677  d1 ab		 cmp ($ab),y
$1b:d679  78			sei
$1b:d67a  22 de 0a b7   jsl $b70ade
$1b:d67e  8a			txa
$1b:d67f  2d e2 8d	  and $8de2
$1b:d682  6a			ror a
$1b:d683  a3 5a		 lda $5a,s
$1b:d685  b8			clv
$1b:d686  d6 ea		 dec $ea,x
$1b:d688  35 bb		 and $bb,x
$1b:d68a  8c 50 a3	  sty $a350
$1b:d68d  14 78		 trb $78
$1b:d68f  c5 5a		 cmp $5a
$1b:d691  31 57		 and ($57),y
$1b:d693  87 69		 sta [$69]
$1b:d695  a1 da		 lda ($da,x)
$1b:d697  78			sei
$1b:d698  76 da		 ror $da,x
$1b:d69a  1d b7 8f	  ora $8fb7,x
$1b:d69d  4b			phk
$1b:d69e  23 d0		 and $d0,s
$1b:d6a0  78			sei
$1b:d6a1  f4 f2 3d	  pea $3df2
$1b:d6a4  17 58		 ora [$58],y
$1b:d6a6  8c b5 6a	  sty $6ab5
$1b:d6a9  33 d8		 and ($d8,s),y
$1b:d6ab  b5 aa		 lda $aa,x
$1b:d6ad  2d 6b 8b	  and $8b6b
$1b:d6b0  5e a2 d7	  lsr $d7a2,x
$1b:d6b3  b8			clv
$1b:d6b4  f7 11		 sbc [$11],y
$1b:d6b6  8e 3d 46	  stx $463d
$1b:d6b9  58			cli
$1b:d6ba  f1 2b		 sbc ($2b),y
$1b:d6bc  dc 56 58	  jml [$5856]
$1b:d6bf  57 ba		 eor [$ba],y
$1b:d6c1  b1 ee		 lda ($ee),y
$1b:d6c3  2b			pld
$1b:d6c4  44 7a ad	  mvp $ad,$7a
$1b:d6c7  52 63		 eor ($63)
$1b:d6c9  8b			phb
$1b:d6ca  58			cli
$1b:d6cb  1a			inc a
$1b:d6cc  80 d2		 bra $d6a0
$1b:d6ce  06 c0		 asl $c0
$1b:d6d0  35 81		 and $81,x
$1b:d6d2  ac 14 c8	  ldy $c814
$1b:d6d5  f4 9e 3d	  pea $3d9e
$1b:d6d8  5c 8f 4d de   jml $de4d8f
$1b:d6dc  23 4d		 and $4d,s
$1b:d6de  7a			ply
$1b:d6df  8d 76 2d	  sta $2d76
$1b:d6e2  8a			txa
$1b:d6e3  8b			phb
$1b:d6e4  62 e2 d9	  per $b0c9
$1b:d6e7  a8			tay
$1b:d6e8  b6 6d		 ldx $6d,y
$1b:d6ea  26 40		 rol $40
$1b:d6ec  77 48		 adc [$48],y
$1b:d6ee  10 51		 bpl $d741
$1b:d6f0  62 98 50	  per $278b
$1b:d6f3  f9 e1 2a	  sbc $2ae1,y
$1b:d6f6  82 41 11	  brl $e83a
$1b:d6f9  94 5b		 sty $5b,x
$1b:d6fb  99 16 e6	  sta $e616,y
$1b:d6fe  c5 b9		 cmp $b9
$1b:d700  d1 6e		 cmp ($6e),y
$1b:d702  7d 53 8b	  adc $8b53,x
$1b:d705  14 e2		 trb $e2
$1b:d707  d5 3a		 cmp $3a,x
$1b:d709  b1 41		 lda ($41),y
$1b:d70b  e0 7a		 cpx #$7a
$1b:d70d  a3 14		 lda $14,s
$1b:d70f  38			sec
$1b:d710  a7 ae		 lda [$ae]
$1b:d712  31 53		 and ($53),y
$1b:d714  1f 9e 55 4a   ora $4a559e,x
$1b:d718  09 f1		 ora #$f1
$1b:d71a  a1 c6		 lda ($c6,x)
$1b:d71c  2a			rol a
$1b:d71d  4a			lsr a
$1b:d71e  50 8d		 bvc $d6ad
$1b:d720  70 23		 bvs $d745
$1b:d722  5c 18 d7 42   jml $42d718
$1b:d726  35 d1		 and $d1,x
$1b:d728  8d 79 23	  sta $2379
$1b:d72b  5e 58 d7	  lsr $d758,x
$1b:d72e  9b			txy
$1b:d72f  2d dd 2f	  and $2fdd
$1b:d732  a4 6a		 ldy $6a
$1b:d734  27 18		 and [$18]
$1b:d736  a0 46		 ldy #$46
$1b:d738  28			plp
$1b:d739  b1 8a		 lda ($8a),y
$1b:d73b  a4 62		 ldy $62
$1b:d73d  ab			plb
$1b:d73e  56 f1		 lsr $f1,x
$1b:d740  c5 bc		 cmp $bc
$1b:d742  75 6f		 adc $6f,x
$1b:d744  0c 5b c2	  tsb $c25b
$1b:d747  77 33		 adc [$33],y
$1b:d749  c5 1f		 cmp $1f
$1b:d74b  08			php
$1b:d74c  f8			sed
$1b:d74d  31 af		 and ($af),y
$1b:d74f  44 6b d3	  mvp $d3,$6b
$1b:d752  1a			inc a
$1b:d753  8b			phb
$1b:d754  a6 c2		 ldx $c2
$1b:d756  30 6e		 bmi $d7c6
$1b:d758  03 70		 ora $70,s
$1b:d75a  45 14		 eor $14
$1b:d75c  60			rts
$1b:d75d  9b			txy
$1b:d75e  1f 3c 6b e0   ora $e06b3c,x
$1b:d762  ab			plb
$1b:d763  08			php
$1b:d764  74 b2		 stz $b2,x
$1b:d766  1d 07 87	  ora $8707,x
$1b:d769  4f 21 d1 75   eor $75d121
$1b:d76d  88			dey
$1b:d76e  cb			wai
$1b:d76f  56 a3		 lsr $a3,x
$1b:d771  3d 8f 68	  and $688f,x
$1b:d774  23 da		 and $da,s
$1b:d776  18			clc
$1b:d777  f6 c2		 inc $c2,x
$1b:d779  3d b1 8f	  and $8fb1,x
$1b:d77c  68			pla
$1b:d77d  a3 da		 lda $da,s
$1b:d77f  38			sec
$1b:d780  f6 ca		 inc $ca,x
$1b:d782  3d b3 8f	  and $8fb3,x
$1b:d785  69 23		 adc #$23
$1b:d787  da			phx
$1b:d788  58			cli
$1b:d789  f6 d2		 inc $d2,x
$1b:d78b  3d b5 8f	  and $8fb5,x
$1b:d78e  69 a3		 adc #$a3
$1b:d790  da			phx
$1b:d791  78			sei
$1b:d792  f6 da		 inc $da,x
$1b:d794  3d b7 aa	  and $aab7,x
$1b:d797  40			rti
$1b:d798  aa			tax
$1b:d799  90 1e		 bcc $d7b9
$1b:d79b  a3 80		 lda $80,s
$1b:d79d  63 90		 adc $90,s
$1b:d79f  2c a7 77	  bit $77a7
$1b:d7a2  38			sec
$1b:d7a3  e8			inx
$1b:d7a4  18			clc
$1b:d7a5  75 32		 adc $32,x
$1b:d7a7  1d 27 87	  ora $8727,x
$1b:d7aa  57 21		 eor [$21],y
$1b:d7ac  d3 77		 cmp ($77,s),y
$1b:d7ae  88			dey
$1b:d7af  d3 5e		 cmp ($5e,s),y
$1b:d7b1  a3 5d		 lda $5d,s
$1b:d7b3  8e 40 df	  stx $df40
$1b:d7b6  e8			inx
$1b:d7b7  5f 48 f4 40   eor $40f448,x
$1b:d7bb  0e a0 65	  asl $65a0
$1b:d7be  cf 40 73 8e   cmp $8e7340
$1b:d7c2  60			rts
$1b:d7c3  81 87		 sta ($87,x)
$1b:d7c5  ca			dex
$1b:d7c6  39 04 8e	  and $8e04,y
$1b:d7c9  39 82 08	  and $0882,y
$1b:d7cc  1f 18 80 bc   ora $bc8018,x
$1b:d7d0  22 9f 18 a7   jsl $a7189f
$1b:d7d4  c8			iny
$1b:d7d5  4e 23 86	  lsr $8623
$1b:d7d8  18			clc
$1b:d7d9  01 00		 ora ($00,x)
$1b:d7db  b1 b1		 lda ($b1),y
$1b:d7dd  cc 74 73	  cpy $7374
$1b:d7e0  3b			tsc
$1b:d7e1  1c cf 45	  trb $45cf
$1b:d7e4  20 31 48	  jsr $4831
$1b:d7e7  11 3c		 ora ($3c),y
$1b:d7e9  32 90		 and ($90)
$1b:d7eb  25 39		 and $39
$1b:d7ed  03 45		 ora $45,s
$1b:d7ef  58			cli
$1b:d7f0  0a			asl a
$1b:d7f1  81 cf		 sta ($cf,x)
$1b:d7f3  44 63 d0	  mvp $d0,$63
$1b:d7f6  42 ba		 wdm #$ba
$1b:d7f8  18			clc
$1b:d7f9  c2 29		 rep #$29
$1b:d7fb  dc 8a 77	  jml [$778a]
$1b:d7fe  62 9e c8	  per $a09f
$1b:d801  a7 b6		 lda [$b6]
$1b:d803  31 f0		 and ($f0),y
$1b:d805  3b			tsc
$1b:d806  84 50		 sty $50
$1b:d808  68			pla
$1b:d809  27 b6		 and [$b6]
$1b:d80b  3b			tsc
$1b:d80c  94 63		 sty $63,x
$1b:d80e  e3 18		 sbc $18,s
$1b:d810  43 07		 eor $07,s
$1b:d812  72 31		 adc ($31)
$1b:d814  dd 8c 7b	  cmp $7b8c,x
$1b:d817  23 1e		 and $1e,s
$1b:d819  d8			cld
$1b:d81a  e7 ce		 sbc [$ce]
$1b:d81c  39 f4 4b	  and $4bf4,y
$1b:d81f  92 2c		 sta ($2c)
$1b:d821  d1 82		 cmp ($82),y
$1b:d823  5d 15 41	  eor $4115,x
$1b:d826  c1 3f		 cmp ($3f,x)
$1b:d828  b4 4f		 ldy $4f,x
$1b:d82a  ee 13 fb	  inc $fb13
$1b:d82d  c4 fe		 cpy $fe
$1b:d82f  c2 3f		 rep #$3f
$1b:d831  d4 8f		 pei ($8f)
$1b:d833  f6 23		 inc $23,x
$1b:d835  fd c8 ff	  sbc $ffc8,x
$1b:d838  46 28		 lsr $28
$1b:d83a  51 8a		 eor ($8a),y
$1b:d83c  1c 62 a5	  trb $a562
$1b:d83f  18			clc
$1b:d840  ab			plb
$1b:d841  c1 be		 cmp ($be,x)
$1b:d843  f4 6f bc	  pea $bc6f
$1b:d846  1b			tcs
$1b:d847  f1 46		 sbc ($46),y
$1b:d849  fc 41 bf	  jsr ($bf41,x)
$1b:d84c  34 6f		 bit $6f,x
$1b:d84e  cc 1b f5	  cpy $f51b
$1b:d851  46 fd		 lsr $fd
$1b:d853  41 3f		 eor ($3f,x)
$1b:d855  f4 4f fe	  pea $fe4f
$1b:d858  13 ff		 ora ($ff,s),y
$1b:d85a  c4 ff		 cpy $ff
$1b:d85c  c1 3f		 cmp ($3f,x)
$1b:d85e  94 4f		 sty $4f,x
$1b:d860  e6 13		 inc $13
$1b:d862  f9 c4 fe	  sbc $fec4,y
$1b:d865  41 3f		 eor ($3f,x)
$1b:d867  74 4f		 stz $4f,x
$1b:d869  de 13 f7	  dec $f713,x
$1b:d86c  c4 fd		 cpy $fd
$1b:d86e  80 02		 bra $d872
$1b:d870  07 00		 ora [$00]
$1b:d872  0e e3 3b	  asl $3be3
$1b:d875  fc 01 e0	  jsr ($e001,x)
$1b:d878  fc a1 ca	  jsr ($caa1,x)
$1b:d87b  c4 21		 cpy $21
$1b:d87d  44 dc f4	  mvp $f4,$dc
$1b:d880  f7 db		 sbc [$db],y
$1b:d882  9d f6 fc	  sta $fcf6,x
$1b:d885  1e 75 6a	  asl $6a75,x
$1b:d888  b5 46		 lda $46,x
$1b:d88a  a3 3a		 lda $3a,s
$1b:d88c  e5 f7		 sbc $f7
$1b:d88e  b9 9c be	  lda $be9c,y
$1b:d891  67 1c		 adc [$1c]
$1b:d893  1e 76 3b	  asl $3b76,x
$1b:d896  1d 47 fb	  ora $fb47,x
$1b:d899  3a			dec a
$1b:d89a  07 9d		 ora [$9d]
$1b:d89c  60			rts
$1b:d89d  1e 75 7a	  asl $7a75,x
$1b:d8a0  bc ce 67	  ldy $67ce,x
$1b:d8a3  42 22		 wdm #$22
$1b:d8a5  cf 27 93 c8   cmp $c89327
$1b:d8a9  30 06		 bmi $d8b1
$1b:d8ab  e0 4a 02	  cpx #$024a
$1b:d8ae  60			rts
$1b:d8af  ed 89 44	  sbc $4489
$1b:d8b2  54 1d 1e	  mvn $1e,$1d
$1b:d8b5  8f 40 e0 1c   sta $1ce040
$1b:d8b9  0f 3f d8 ee   ora $eed83f
$1b:d8bd  1e 6f b7	  asl $b76f,x
$1b:d8c0  f7 da		 sbc [$da],y
$1b:d8c2  3a			dec a
$1b:d8c3  4e 37 af	  lsr $af37
$1b:d8c6  d8			cld
$1b:d8c7  77 3f		 adc [$3f],y
$1b:d8c9  b7 3b		 lda [$3b],y
$1b:d8cb  9f c6 dc 0a   sta $0adcc6,x
$1b:d8cf  4a			lsr a
$1b:d8d0  b1 ef		 lda ($ef),y
$1b:d8d2  3b			tsc
$1b:d8d3  87 df		 sta [$df]
$1b:d8d5  dc 77 0f	  jml [$0f77]
$1b:d8d8  a9 28 38	  lda #$3828
$1b:d8db  1e 61 d0	  asl $d061,x
$1b:d8de  a1 59		 lda ($59,x)
$1b:d8e0  3a			dec a
$1b:d8e1  35 8f		 and $8f,x
$1b:d8e3  31 28		 and ($28),y
$1b:d8e5  6b			rtl
$1b:d8e6  07 61		 ora [$61]
$1b:d8e8  4c 92 34	  jmp $3492
$1b:d8eb  6b			rtl
$1b:d8ec  1e 45 91	  asl $9145,x
$1b:d8ef  70 7f		 bvs $d970
$1b:d8f1  be 3f 1f	  ldx $1f3f,y
$1b:d8f4  99 90 1d	  sta $1d90,y
$1b:d8f7  c5 70		 cmp $70
$1b:d8f9  fb			xce
$1b:d8fa  89 43 c2	  bit #$c243
$1b:d8fd  e1 f4		 sbc ($f4,x)
$1b:d8ff  9a			txs
$1b:d900  e1 d6		 sbc ($d6,x)
$1b:d902  6b			rtl
$1b:d903  87 13		 sta [$13]
$1b:d905  8a			txa
$1b:d906  af 19 48 3c   lda $3c4819
$1b:d90a  39 43 50	  and $5043,y
$1b:d90d  73 9f		 adc ($9f,s),y
$1b:d90f  33 9a		 and ($9a,s),y
$1b:d911  0f f7 ff 82   ora $82fff7
$1b:d915  5e 91 77	  lsr $7791,x
$1b:d918  a4 02		 ldy $02
$1b:d91a  5a			phy
$1b:d91b  87 2b		 sta [$2b]
$1b:d91d  13 04		 ora ($04,s),y
$1b:d91f  ee c7 77	  inc $77c7
$1b:d922  b1 82		 lda ($82),y
$1b:d924  5a			phy
$1b:d925  73 51		 adc ($51,s),y
$1b:d927  1b			tcs
$1b:d928  04 ee		 tsb $ee
$1b:d92a  af 77 ab 8b   lda $8bab77
$1b:d92e  68			pla
$1b:d92f  6c 33 a0	  jmp ($a033)
$1b:d932  4b			phk
$1b:d933  50 66		 bvc $d99b
$1b:d935  65 63		 adc $63
$1b:d937  a1 02		 lda ($02,x)
$1b:d939  5b			tcd
$1b:d93a  91 c9		 sta ($c9),y
$1b:d93c  e4 c1		 cpx $c1
$1b:d93e  4d 03 c9	  eor $c903
$1b:d941  04 b7		 tsb $b7
$1b:d943  43 a3		 eor $a3,s
$1b:d945  d1 9a		 cmp ($9a),y
$1b:d947  c2 a1		 rep #$a1
$1b:d949  71 ee		 adc ($ee),y
$1b:d94b  88			dey
$1b:d94c  26 67		 rol $67
$1b:d94e  a7 90		 lda [$90]
$1b:d950  93 02		 sta ($02,s),y
$1b:d952  6a			ror a
$1b:d953  12 79		 ora ($79)
$1b:d955  08			php
$1b:d956  62 33 d3	  per $ac8c
$1b:d959  be ae f5	  ldx $f5ae,y
$1b:d95c  ff b4 3a b1   sbc $b13ab4,x
$1b:d960  e4 fe		 cpx $fe
$1b:d962  82 47 71	  brl $4aac
$1b:d965  d4 df		 pei ($df)
$1b:d967  6f c1 69 58   adc $5869c1
$1b:d96b  f7 4a		 sbc [$4a],y
$1b:d96d  9f 43 c0 f6   sta $f6c043,x
$1b:d971  7b			tdc
$1b:d972  78			sei
$1b:d973  ef a5 f3 56   sbc $56f3a5
$1b:d977  1d a5 ef	  ora $efa5,x
$1b:d97a  fa			plx
$1b:d97b  84 89		 sty $89
$1b:d97d  f4 1a 9e	  pea $9e1a
$1b:d980  df 5b 8a fa   cmp $fa8a5b,x
$1b:d984  1f 5f b3 9d   ora $9db35f,x
$1b:d988  cf 7d 1e c7   cmp $c71e7d
$1b:d98c  7b			tdc
$1b:d98d  de e6 bb	  dec $bbe6,x
$1b:d990  4b			phk
$1b:d991  cf fd 0c a7   cmp $a70cfd
$1b:d995  63 b3		 adc $b3,s
$1b:d997  da			phx
$1b:d998  7b			tdc
$1b:d999  07 4f		 ora [$4f]
$1b:d99b  7d c5 0b	  adc $0bc5,x
$1b:d99e  87 0b		 sta [$0b]
$1b:d9a0  72 44		 adc ($44)
$1b:d9a2  07 c8		 ora [$c8]
$1b:d9a4  78			sei
$1b:d9a5  3c 3e 20	  bit $203e,x
$1b:d9a8  30 7d		 bmi $da27
$1b:d9aa  be de 6f	  ldx $6fde,y
$1b:d9ad  b7 dc		 lda [$dc],y
$1b:d9af  ac 1f 60	  ldy $601f
$1b:d9b2  40			rti
$1b:d9b3  ed 7c 3b	  sbc $3b7c
$1b:d9b6  71 30		 adc ($30),y
$1b:d9b8  15 c3		 ora $c3,x
$1b:d9ba  c8			iny
$1b:d9bb  64 2f		 stz $2f
$1b:d9bd  b0 a0		 bcs $d95f
$1b:d9bf  4b			phk
$1b:d9c0  e2 16		 sep #$16
$1b:d9c2  02 b9		 cop #$b9
$1b:d9c4  16 08		 asl $08,x
$1b:d9c6  30 25		 bmi $d9ed
$1b:d9c8  f1 e1		 sbc ($e1),y
$1b:d9ca  70 fa		 bvs $d9c6
$1b:d9cc  5d 2e ba	  eor $ba2e,x
$1b:d9cf  10 7b		 bpl $da4c
$1b:d9d1  bd 2e 20	  lda $202e,x
$1b:d9d4  88			dey
$1b:d9d5  0b			phd
$1b:d9d6  e3 ca		 sbc $ca,s
$1b:d9d8  e5 f7		 sbc $f7
$1b:d9da  bb			tyx
$1b:d9db  dd f4 a0	  cmp $a0f4,x
$1b:d9de  a4 c3		 ldy $c3
$1b:d9e0  98			tya
$1b:d9e1  32 02		 and ($02)
$1b:d9e3  f8			sed
$1b:d9e4  be 8b 70	  ldx $708b,y
$1b:d9e7  4a			lsr a
$1b:d9e8  07 b8		 ora [$b8]
$1b:d9ea  12 8b		 ora ($8b)
$1b:d9ec  d1 e9		 cmp ($e9),y
$1b:d9ee  f5 6a		 sbc $6a,x
$1b:d9f0  5f 23 c0 f7   eor $f7c023,x
$1b:d9f4  ff 4a 63 e7   sbc $e7634a,x
$1b:d9f8  04 07		 tsb $07
$1b:d9fa  c0 4c		 cpy #$4c
$1b:d9fc  00 82		 brk #$82
$1b:d9fe  31 09		 and ($09),y
$1b:da00  cc 17 60	  cpy $6017
$1b:da03  28			plp
$1b:da04  11 b0		 ora ($b0),y
$1b:da06  0a			asl a
$1b:da07  08			php
$1b:da08  e4 2c		 cpx $2c
$1b:da0a  91 0b		 sta ($0b),y
$1b:da0c  90 59		 bcc $da67
$1b:da0e  10 42		 bpl $da52
$1b:da10  83 0d		 sta $0d,s
$1b:da12  47 98		 eor [$98]
$1b:da14  22 60 a4 84   jsl $84a460
$1b:da18  c2 a1		 rep #$a1
$1b:da1a  70 c7		 bvs $d9e3
$1b:da1c  92 3c		 sta ($3c)
$1b:da1e  bc 07 74	  ldy $7407,x
$1b:da21  39 58 86	  and $8658,y
$1b:da24  68			pla
$1b:da25  80 20		 bra $da47
$1b:da27  9c d4 46	  stz $46d4
$1b:da2a  23 56		 and $56,s
$1b:da2c  1a			inc a
$1b:da2d  80 c4		 bra $d9f3
$1b:da2f  aa			tax
$1b:da30  33 a1		 and ($a1,s),y
$1b:da32  72 d5		 adc ($d5)
$1b:da34  c8			iny
$1b:da35  a0 38		 ldy #$38
$1b:da37  b2 8b		 lda ($8b)
$1b:da39  0f 46 83 33   ora $338346
$1b:da3d  30 cd		 bmi $da0c
$1b:da3f  08			php
$1b:da40  04 1c		 tsb $1c
$1b:da42  8a			txa
$1b:da43  75 3b		 adc $3b,x
$1b:da45  91 c9		 sta ($c9),y
$1b:da47  a7 72		 lda [$72]
$1b:da49  4e 00 73	  lsr $7300
$1b:da4c  13 90		 ora ($90,s),y
$1b:da4e  00 86		 brk #$86
$1b:da50  b1 58		 lda ($58),y
$1b:da52  e8			inx
$1b:da53  74 50		 stz $50,x
$1b:da55  4a			lsr a
$1b:da56  82 00 10	  brl $ea59
$1b:da59  d8			cld
$1b:da5a  2c 08 f1	  bit $f108
$1b:da5d  49 a2 48	  eor #$48a2
$1b:da60  4f e4 d4 15   eor $15d4e4
$1b:da64  1a			inc a
$1b:da65  3b			tsc
$1b:da66  8d 43 d0	  sta $d043
$1b:da69  58			cli
$1b:da6a  2a			rol a
$1b:da6b  8f 25 52 a4   sta $a45225
$1b:da6f  9d f6 3b	  sta $3bf6,x
$1b:da72  3d 9e d2	  and $d29e,x
$1b:da75  92 bd		 sta ($bd)
$1b:da77  7e ce 77	  ror $77ce,x
$1b:da7a  3c 22 1c	  bit $1c22,x
$1b:da7d  ae 5f 79	  ldx $795f
$1b:da80  ee 1b 0f	  inc $0f1b
$1b:da83  7b			tdc
$1b:da84  c8			iny
$1b:da85  6b			rtl
$1b:da86  1e 7f af	  asl $af7f,x
$1b:da89  6f 73 d3 ea   adc $ead373
$1b:da8d  6f b7 ea 31   adc $31eab7
$1b:da91  00 82		 brk #$82
$1b:da93  b0 2b		 bcs $dac0
$1b:da95  1e ff b0	  asl $b0ff,x
$1b:da98  44 3e de	  mvp $de,$3e
$1b:da9b  cf af 1d 46   cmp $461daf
$1b:da9f  3e f0 68	  rol $68f0,x
$1b:daa2  bc 03 ed	  ldy $ed03,x
$1b:daa5  e7 0a		 sbc [$0a]
$1b:daa7  07 9d		 ora [$9d]
$1b:daa9  e4 4f		 cpx $4f
$1b:daab  03 08		 ora $08,s
$1b:daad  20 70 83	  jsr $8370
$1b:dab0  49 c2 de	  eor #$dec2
$1b:dab3  79 78 7d	  adc $7d78,y
$1b:dab6  22 10 71 38   jsl $387110
$1b:daba  aa			tax
$1b:dabb  d0 20		 bne $dadd
$1b:dabd  01 1c		 ora ($1c,x)
$1b:dabf  79 5b 0e	  adc $0e5b,y
$1b:dac2  63 dc		 adc $dc,s
$1b:dac4  0a			asl a
$1b:dac5  41 cc		 eor ($cc,x)
$1b:dac7  e6 bd		 inc $bd
$1b:dac9  04 a2		 tsb $a2
$1b:dacb  05 81		 ora $81
$1b:dacd  56 19		 lsr $19,x
$1b:dacf  89 15 85	  bit #$8515
$1b:dad2  43 95		 eor $95,s
$1b:dad4  9c 42 88	  stz $8842
$1b:dad7  65 99		 adc $99
$1b:dad9  cd 45 02	  cmp $0245
$1b:dadc  13 a3		 ora ($a3,s),y
$1b:dade  af 9b 54 e6   lda $e6549b
$1b:dae2  28			plp
$1b:dae3  07 40		 ora [$40]
$1b:dae5  12 0c		 ora ($0c)
$1b:dae7  50 06		 bvc $daef
$1b:dae9  04 05		 tsb $05
$1b:daeb  b0 2a		 bcs $db17
$1b:daed  69 ee 05	  adc #$05ee
$1b:daf0  40			rti
$1b:daf1  40			rti
$1b:daf2  0f f5 5a ca   ora $ca5af5
$1b:daf6  5e 4a 95	  lsr $954a,x
$1b:daf9  06 66		 asl $66
$1b:dafb  ea			nop
$1b:dafc  1a			inc a
$1b:dafd  17 1b		 ora [$1b],y
$1b:daff  c1 f3		 cmp ($f3,x)
$1b:db01  f9 f8 8d	  sbc $8df8,y
$1b:db04  64 38		 stz $38
$1b:db06  18			clc
$1b:db07  2c 15 2a	  bit $2a15
$1b:db0a  3b			tsc
$1b:db0b  5f 9f f7 6e   eor $6ef79f,x
$1b:db0f  f4 59 54	  pea $5459
$1b:db12  a9 fa 7f	  lda #$7ffa
$1b:db15  30 19		 bmi $db30
$1b:db17  76 3b		 ror $3b,x
$1b:db19  3d a0 a0	  and $a0a0,x
$1b:db1c  1b			tcs
$1b:db1d  08			php
$1b:db1e  20 76 07	  jsr $0776
$1b:db21  78			sei
$1b:db22  78			sei
$1b:db23  5e 62 1c	  lsr $1c62,x
$1b:db26  70 a8		 bvs $dad0
$1b:db28  6d 7c 20	  adc $207c
$1b:db2b  31 16		 and ($16),y
$1b:db2d  50 08		 bvc $db37
$1b:db2f  6c 02 50	  jmp ($5002)
$1b:db32  17 78		 ora [$78],y
$1b:db34  7d 86 ef	  adc $ef86,x
$1b:db37  e8			inx
$1b:db38  f4 fa 7d	  pea $7dfa
$1b:db3b  41 41		 eor ($41,x)
$1b:db3d  38			sec
$1b:db3e  01 cc		 ora ($cc,x)
$1b:db40  4d 85 f0	  eor $f085
$1b:db43  15 87		 ora $87,x
$1b:db45  c8			iny
$1b:db46  28			plp
$1b:db47  28			plp
$1b:db48  00 41		 brk #$41
$1b:db4a  89 b0 83	  bit #$83b0
$1b:db4d  46 05		 lsr $05
$1b:db4f  11 28		 ora ($28),y
$1b:db51  05 c0		 ora $c0
$1b:db53  30 29		 bmi $db7e
$1b:db55  61 4c		 adc ($4c,x)
$1b:db57  10 64		 bpl $dbbd
$1b:db59  5d e8 8f	  eor $8fe8,x
$1b:db5c  31 39		 and ($39),y
$1b:db5e  83 d1		 sta $d1,s
$1b:db60  1e 63 73	  asl $7363,x
$1b:db63  5c d0 08 d7   jml $d708d0
$1b:db67  4a			lsr a
$1b:db68  4b			phk
$1b:db69  11 b9		 ora ($b9),y
$1b:db6b  19 45 b6	  ora $b645,y
$1b:db6e  73 9a		 adc ($9a,s),y
$1b:db70  8b			phb
$1b:db71  c4 27		 cpy $27
$1b:db73  48			pha
$1b:db74  d2 e4		 cmp ($e4)
$1b:db76  be 4d df	  ldx $df4d,y
$1b:db79  1d 10 49	  ora $4910,x
$1b:db7c  bb			tyx
$1b:db7d  e0 2a		 cpx #$2a
$1b:db7f  b4 19		 ldy $19,x
$1b:db81  98			tya
$1b:db82  84 28		 sty $28
$1b:db84  41 59		 eor ($59,x)
$1b:db86  e4 72		 cpx $72
$1b:db88  69 cf d1	  adc #$d1cf
$1b:db8b  0a			asl a
$1b:db8c  c7 43		 cmp [$43]
$1b:db8e  a3 60		 lda $60,s
$1b:db90  06 88		 asl $88
$1b:db92  56 54		 lsr $54,x
$1b:db94  84 45		 sty $45
$1b:db96  a7 21		 lda [$21]
$1b:db98  15 7d		 ora $7d,x
$1b:db9a  3c 31 a0	  bit $a031,x
$1b:db9d  aa			tax
$1b:db9e  fa			plx
$1b:db9f  3d 3e ad	  and $ad3e,x
$1b:dba2  4e d1 0a	  lsr $0ad1
$1b:dba5  1b			tcs
$1b:dba6  9f ee fb 69   sta $69fbee,x
$1b:dbaa  aa			tax
$1b:dbab  4f 02 10 35   eor $351002
$1b:dbaf  ba			tsx
$1b:dbb0  cd 3e c7	  cmp $c73e
$1b:dbb3  60			rts
$1b:dbb4  95 0e		 sta $0e,x
$1b:dbb6  5c 8b 99 b0   jml $b0998b
$1b:dbba  d9 37 81	  cmp $8137,y
$1b:dbbd  28			plp
$1b:dbbe  1c cd 9e	  trb $9ecd
$1b:dbc1  bd a0 2d	  lda $2da0,x
$1b:dbc4  20 5f 89	  jsr $895f
$1b:dbc7  39 d4 a8	  and $a8d4,y
$1b:dbca  e8			inx
$1b:dbcb  06 f0		 asl $f0
$1b:dbcd  78			sei
$1b:dbce  3c 3e 25	  bit $253e,x
$1b:dbd1  93 a9		 sta ($a9,s),y
$1b:dbd3  c8			iny
$1b:dbd4  e2 8c		 sep #$8c
$1b:dbd6  5f 53 3a cc   eor $cc3a53,x
$1b:dbda  b8			clv
$1b:dbdb  c8			iny
$1b:dbdc  11 55		 ora ($55),y
$1b:dbde  0e d7 e7	  asl $e7d7
$1b:dbe1  f3 68		 sbc ($68,s),y
$1b:dbe3  9e b3 72	  stz $72b3,x
$1b:dbe6  91 17		 sta ($17),y
$1b:dbe8  bc a5 c1	  ldy $c1a5,x
$1b:dbeb  34 0a		 bit $0a,x
$1b:dbed  31 7c		 and ($7c),y
$1b:dbef  b5 81		 lda $81,x
$1b:dbf1  76 22		 ror $22,x
$1b:dbf3  23 40		 and $40,s
$1b:dbf5  83 d4		 sta $d4,s
$1b:dbf7  78			sei
$1b:dbf8  d4 39		 pei ($39)
$1b:dbfa  58			cli
$1b:dbfb  c6 68		 dec $68
$1b:dbfd  8a			txa
$1b:dbfe  80 9c		 bra $db9c
$1b:dc00  d4 48		 pei ($48)
$1b:dc02  33 3a		 and ($3a,s),y
$1b:dc04  1f 79 3f e8   ora $e83f79,x
$1b:dc08  33 33		 and ($33,s),y
$1b:dc0a  8b			phb
$1b:dc0b  55 aa		 eor $aa,x
$1b:dc0d  33 3a		 and ($3a,s),y
$1b:dc0f  12 a0		 ora ($a0)
$1b:dc11  39 1c 94	  and $941c,y
$1b:dc14  02 c1		 cop #$c1
$1b:dc16  6c 74 28	  jmp ($2874)
$1b:dc19  2f 25 50 1d   and $1d5025
$1b:dc1d  0e 8a 41	  asl $418a
$1b:dc20  66 b6		 ror $b6
$1b:dc22  38			sec
$1b:dc23  1c 7b a2	  trb $a27b
$1b:dc26  ed 24 f2	  sbc $f224
$1b:dc29  cf 6c 70 b9   cmp $b9706c
$1b:dc2d  32 7a		 and ($7a)
$1b:dc2f  78			sei
$1b:dc30  d0 9a		 bne $dbcc
$1b:dc32  7e 1a 18	  ror $181a,x
$1b:dc35  ad a9 1d	  lda $1da9
$1b:dc38  36 5e		 rol $5e,x
$1b:dc3a  bc c8 dc	  ldy $dcc8,x
$1b:dc3d  6e 46 a5	  ror $a546
$1b:dc40  26 eb		 rol $eb
$1b:dc42  36 53		 rol $53,x
$1b:dc44  6b			rtl
$1b:dc45  e1 06		 sbc ($06,x)
$1b:dc47  9b			txy
$1b:dc48  d4 03		 pei ($03)
$1b:dc4a  c4 0e		 cpy $0e
$1b:dc4c  17 7a		 ora [$7a],y
$1b:dc4e  ca			dex
$1b:dc4f  65 2f		 adc $2f
$1b:dc51  22 79 08 a8   jsl $a80879
$1b:dc55  05 a1		 ora $a1
$1b:dc57  b8			clv
$1b:dc58  d5 70		 cmp $70,x
$1b:dc5a  a6 33		 ldx $33
$1b:dc5c  11 7a		 ora ($7a),y
$1b:dc5e  fc 2c 1e	  jsr ($1e2c,x)
$1b:dc61  7f 6f 03 65   adc $65036f,x
$1b:dc65  ca			dex
$1b:dc66  95 4a		 sta $4a,x
$1b:dc68  8b			phb
$1b:dc69  e7 56		 sbc [$56]
$1b:dc6b  ab			plb
$1b:dc6c  02 83		 cop #$83
$1b:dc6e  cf ce e7 bc   cmp $bce7ce
$1b:dc72  c5 f6		 cmp $f6
$1b:dc74  05 01		 ora $01
$1b:dc76  9d d8 ec	  sta $ecd8,x
$1b:dc79  7c 6f 5f	  jmp ($5f6f,x)
$1b:dc7c  b3 ea		 lda ($ea,s),y
$1b:dc7e  f7 17		 sbc [$17],y
$1b:dc80  b0 8e		 bcs $dc10
$1b:dc82  54 60 1e	  mvn $1e,$60
$1b:dc85  d7 b8		 cmp [$b8],y
$1b:dc87  d8			cld
$1b:dc88  08			php
$1b:dc89  f2 32		 sbc ($32)
$1b:dc8b  32 3b		 and ($3b)
$1b:dc8d  90 00		 bcc $dc8f
$1b:dc8f  a4 43		 ldy $43
$1b:dc91  68			pla
$1b:dc92  18			clc
$1b:dc93  01 08		 ora ($08,x)
$1b:dc95  b8			clv
$1b:dc96  5d bd 50	  eor $50bd,x
$1b:dc99  e4 aa		 cpx $aa
$1b:dc9b  f5 71		 sbc $71,x
$1b:dc9d  7a			ply
$1b:dc9e  f2 b7		 sbc ($b7)
$1b:dca0  bb			tyx
$1b:dca1  2a			rol a
$1b:dca2  0c cd 34	  tsb $34cd
$1b:dca5  5a			phy
$1b:dca6  9e df 0f	  stz $0fdf,x
$1b:dca9  89 c5 04	  bit #$04c5
$1b:dcac  1f 22 0a aa   ora $aa0a22,x
$1b:dcb0  1e 46 c7	  asl $c746,x
$1b:dcb3  7b			tdc
$1b:dcb4  cb			wai
$1b:dcb5  e6 73		 inc $73
$1b:dcb7  41 07		 eor ($07,x)
$1b:dcb9  d0 9a		 bne $dc55
$1b:dcbb  c2 a1		 rep #$a1
$1b:dcbd  71 ee		 adc ($ee),y
$1b:dcbf  80 28		 bra $dce9
$1b:dcc1  c1 09		 cmp ($09,x)
$1b:dcc3  3d 5d 84	  and $845d,x
$1b:dcc6  99 ce 0f	  sta $0fce,y
$1b:dcc9  b2 7c		 lda ($7c)
$1b:dccb  24 25		 bit $25
$1b:dccd  76 10		 ror $10,x
$1b:dccf  c6 29		 dec $29
$1b:dcd1  b4 8a		 ldy $8a,x
$1b:dcd3  b0 d8		 bcs $dcad
$1b:dcd5  67 73		 adc [$73]
$1b:dcd7  c8			iny
$1b:dcd8  e3 71		 sbc $71,s
$1b:dcda  b9 1b ba	  lda $ba1b,y
$1b:dcdd  5f 0b 44 78   eor $78440b,x
$1b:dce1  6d 59 e1	  adc $e159
$1b:dce4  b6 3b		 ldx $3b,y
$1b:dce6  78			sei
$1b:dce7  87 c6		 sta [$c6]
$1b:dce9  58			cli
$1b:dcea  fc 72 4b	  jsr ($4b72,x)
$1b:dced  3e 80 c2	  rol $c280,x
$1b:dcf0  e5 cd		 sbc $cd
$1b:dcf2  fe bf 06	  inc $06bf,x
$1b:dcf5  ae fc 07	  ldx $07fc
$1b:dcf8  ca			dex
$1b:dcf9  be 52 84	  ldx $8452,y
$1b:dcfc  30 04		 bmi $dd02
$1b:dcfe  15 f2		 ora $f2,x
$1b:dd00  5e ee f9	  lsr $f9ee,x
$1b:dd03  4e 8a 83	  lsr $838a
$1b:dd06  56 d0		 lsr $d0,x
$1b:dd08  b9 f6 57	  lda $57f6,y
$1b:dd0b  a1 0e		 lda ($0e,x)
$1b:dd0d  b0 02		 bcs $dd11
$1b:dd0f  47 80		 eor [$80]
$1b:dd11  c2 61		 rep #$61
$1b:dd13  50 b8		 bvc $dccd
$1b:dd15  67 1b		 adc [$1b]
$1b:dd17  53 db		 eor ($db,s),y
$1b:dd19  dc f4 f7	  jml [$f7f4]
$1b:dd1c  c0 11		 cpy #$11
$1b:dd1e  ed ea 9f	  sbc $9fea
$1b:dd21  29 b1 de	  and #$deb1
$1b:dd24  f2 fb		 sbc ($fb)
$1b:dd26  dc c0 88	  jml [$88c0]
$1b:dd29  77 b7		 adc [$b7],y
$1b:dd2b  bb			tyx
$1b:dd2c  27 ca		 and [$ca]
$1b:dd2e  3b			tsc
$1b:dd2f  f8			sed
$1b:dd30  3f e3 0f 6e   and $6e0fe3,x
$1b:dd34  99 1b ca	  sta $ca1b,y
$1b:dd37  fe 68 f3	  inc $f368,x
$1b:dd3a  cf 50 e5 69   cmp $69e550
$1b:dd3e  a2 77		 ldx #$77
$1b:dd40  a4 69		 ldy $69
$1b:dd42  0c 33 9a	  tsb $9a33
$1b:dd45  8a			txa
$1b:dd46  a8			tay
$1b:dd47  b8			clv
$1b:dd48  dc 20 09	  jml [$0920]
$1b:dd4b  7f 77 dc 55   adc $55dc77,x
$1b:dd4f  43 72		 eor $72,s
$1b:dd51  82 25 22	  brl $ff79
$1b:dd54  ef 73 78 d4   sbc $d47873
$1b:dd58  19 9b 28	  ora $289b,y
$1b:dd5b  92 28		 sta ($28)
$1b:dd5d  91 2e		 sta ($2e),y
$1b:dd5f  47 25		 eor [$25]
$1b:dd61  b2 4c		 lda ($4c)
$1b:dd63  f8			sed
$1b:dd64  e8			inx
$1b:dd65  74 5d		 stz $5d,x
$1b:dd67  24 84		 bit $84
$1b:dd69  19 1c 6e	  ora $6e1c,y
$1b:dd6c  37 23		 and [$23],y
$1b:dd6e  77 c3		 adc [$c3],y
$1b:dd70  c3 c0		 cmp $c0,s
$1b:dd72  3e 12 f1	  rol $f112,x
$1b:dd75  1f 8d 3c 8b   ora $8b3c8d,x
$1b:dd79  e5 6c		 sbc $6c
$1b:dd7b  fe 95 4e	  inc $4e95,x
$1b:dd7e  ad 9d 2e	  lda $2e9d
$1b:dd81  2a			rol a
$1b:dd82  08			php
$1b:dd83  4b			phk
$1b:dd84  e5 4f		 sbc $4f
$1b:dd86  b7 15		 lda [$15],y
$1b:dd88  46 56		 lsr $56
$1b:dd8a  8f 0a b2 48   sta $48b20a
$1b:dd8e  51 e2		 eor ($e2),y
$1b:dd90  96 2a		 stx $2a,y
$1b:dd92  27 19		 and [$19]
$1b:dd94  74 13		 stz $13,x
$1b:dd96  bb			tyx
$1b:dd97  1a			inc a
$1b:dd98  88			dey
$1b:dd99  57 46		 eor [$46],y
$1b:dd9b  a6 09		 ldx $09
$1b:dd9d  d2 78		 cmp ($78)
$1b:dd9f  aa			tax
$1b:dda0  ea			nop
$1b:dda1  20 ab aa	  jsr $aaab
$1b:dda4  0d 56 53	  ora $5356
$1b:dda7  35 f8		 and $f8,x
$1b:dda9  2c 42 ae	  bit $ae42
$1b:ddac  bf 16 29 d0   lda $d02916,x
$1b:ddb0  b8			clv
$1b:ddb1  dc 8e 47	  jml [$478e]
$1b:ddb4  25 9e		 and $9e
$1b:ddb6  2d 10 6a	  and $6a10
$1b:ddb9  13 40		 ora ($40,s),y
$1b:ddbb  78			sei
$1b:ddbc  dd 0e 8b	  cmp $8b0e,x
$1b:ddbf  7e f8 d3	  ror $d3f8,x
$1b:ddc2  9d 66 e7	  sta $e766,x
$1b:ddc5  7d db ed	  adc $eddb,x
$1b:ddc8  f0 fa		 beq $ddc4
$1b:ddca  5d 2e be	  eor $be2e,x
$1b:ddcd  a3 71		 lda $71,s
$1b:ddcf  b9 e9 f4	  lda $f4e9,y
$1b:ddd2  f7 d3		 sbc [$d3],y
$1b:ddd4  bd 87 2f	  lda $2f87,x
$1b:ddd7  99 bd de	  sta $debd,y
$1b:ddda  f2 fb		 sbc ($fb)
$1b:dddc  dd ee fe	  cmp $feee,x
$1b:dddf  c3 80		 cmp $80,s
$1b:dde1  05 1e		 ora $1e
$1b:dde3  67 e6		 adc [$e6]
$1b:dde5  00 10		 brk #$10
$1b:dde7  1a			inc a
$1b:dde8  c1 7c		 cmp ($7c,x)
$1b:ddea  77 1d		 adc [$1d],y
$1b:ddec  b0 a1		 bcs $dd8f
$1b:ddee  71 82		 adc ($82),y
$1b:ddf0  05 00		 ora $00
$1b:ddf2  e1 6d		 sbc ($6d,x)
$1b:ddf4  35 5c		 and $5c,x
$1b:ddf6  6e 07 bf	  ror $bf07
$1b:ddf9  58			cli
$1b:ddfa  26 00		 rol $00
$1b:ddfc  ea			nop
$1b:ddfd  fb			xce
$1b:ddfe  76 1b		 ror $1b,x
$1b:de00  2e 37 af	  rol $af37
$1b:de03  d8			cld
$1b:de04  1f 37 80 8a   ora $8a8037,x
$1b:de08  82 01 c6	  brl $a40c
$1b:de0b  0a			asl a
$1b:de0c  06 a4		 asl $a4
$1b:de0e  7e 42 a0	  ror $a042,x
$1b:de11  00 08		 brk #$08
$1b:de13  d4 08		 pei ($08)
$1b:de15  85 b1		 sta $b1
$1b:de17  27 91		 and [$91]
$1b:de19  48			pha
$1b:de1a  43 e6		 eor $e6,s
$1b:de1c  45 1e		 eor $1e
$1b:de1e  c7 67		 cmp [$67]
$1b:de20  b4 45		 ldy $45,x
$1b:de22  00 a0		 brk #$a0
$1b:de24  17 d6		 ora [$d6],y
$1b:de26  c1 c6		 cmp ($c6,x)
$1b:de28  f0 78		 beq $dea2
$1b:de2a  7c 46 b9	  jmp ($b946,x)
$1b:de2d  0a			asl a
$1b:de2e  06 d7		 asl $d7
$1b:de30  c3 b7		 cmp $b7,s
$1b:de32  3d e7 fd	  and $fde7,x
$1b:de35  14 16		 trb $16
$1b:de37  03 b0		 ora $b0,s
$1b:de39  1f fc e0 c8   ora $c8e0fc,x
$1b:de3d  8e f4 7a	  stx $7af4
$1b:de40  7d 46 b8	  adc $b846,x
$1b:de43  24 0e		 bit $0e
$1b:de45  b7 59		 lda [$59],y
$1b:de47  a7 35		 lda [$35]
$1b:de49  c1 60		 cmp ($60,x)
$1b:de4b  f5 e6		 sbc $e6,x
$1b:de4d  80 34		 bra $de83
$1b:de4f  81 24		 sta ($24,x)
$1b:de51  3a			dec a
$1b:de52  7b			tdc
$1b:de53  e1 28		 sbc ($28,x)
$1b:de55  6c 77 bc	  jmp ($bc77)
$1b:de58  1f 1b e0 3f   ora $3fe01b,x
$1b:de5c  bd cd ee	  lda $eecd,x
$1b:de5f  c8			iny
$1b:de60  9e 1d e2	  stz $e21d,x
$1b:de63  88			dey
$1b:de64  92 03		 sta ($03)
$1b:de66  87 d2		 sta [$d2]
$1b:de68  04 0f		 tsb $0f
$1b:de6a  10 54		 bpl $dec0
$1b:de6c  1c f1 60	  trb $60f1
$1b:de6f  95 8f		 sta $8f,x
$1b:de71  bc 18 12	  ldy $1218,x
$1b:de74  88			dey
$1b:de75  a5 80		 lda $80
$1b:de77  22 09 d0 22   jsl $22d009
$1b:de7b  88			dey
$1b:de7c  9c d2 c1	  stz $c1d2
$1b:de7f  c5 08		 cmp $08
$1b:de81  18			clc
$1b:de82  96 39		 stx $39,y
$1b:de84  a3 0d		 lda $0d,s
$1b:de86  13 90		 ora ($90,s),y
$1b:de88  8e 89 2a	  stx $2a89
$1b:de8b  56 f7		 lsr $f7,x
$1b:de8d  80 1e		 bra $dead
$1b:de8f  07 7c		 ora [$7c]
$1b:de91  96 09		 stx $09,y
$1b:de93  5d 59 00	  eor $0059,x
$1b:de96  30 05		 bmi $de9d
$1b:de98  58			cli
$1b:de99  3d c7 cd	  and $cdc7,x
$1b:de9c  e3 ee		 sbc $ee,s
$1b:de9e  29 82 77	  and #$7782
$1b:dea1  57 48		 eor [$48],y
$1b:dea3  0a			asl a
$1b:dea4  10 38		 bpl $dede
$1b:dea6  40			rti
$1b:dea7  71 eb		 adc ($eb),y
$1b:dea9  ff f8 82 f0   sbc $f082f8,x
$1b:dead  a8			tay
$1b:deae  a7 c9		 lda [$c9]
$1b:deb0  08			php
$1b:deb1  1c a0 b8	  trb $b8a0
$1b:deb4  f7 e4		 sbc [$e4],y
$1b:deb6  5c c1 f8 4c   jml $4cf8c1
$1b:deba  d5 e4		 cmp $e4,x
$1b:debc  e1 25		 sbc ($25,x)
$1b:debe  bf b2 3d b3   lda $b33db2,x
$1b:dec2  ee a2 00	  inc $00a2
$1b:dec5  08			php
$1b:dec6  81 40		 sta ($40,x)
$1b:dec8  1d e9 2e	  ora $2ee9,x
$1b:decb  9a			txs
$1b:decc  4b			phk
$1b:decd  a6 b2		 ldx $b2
$1b:decf  ea			nop
$1b:ded0  1c ba 09	  trb $09ba
$1b:ded3  6e 9a db	  ror $db9a
$1b:ded6  a6 96		 ldx $96
$1b:ded8  e7 f0		 sbc [$f0]
$1b:deda  50 df		 bvc $debb
$1b:dedc  e7 1d		 sbc [$1d]
$1b:dede  b7 47		 lda [$47],y
$1b:dee0  1e e6 0e	  asl $0ee6,x
$1b:dee3  08			php
$1b:dee4  ec ba 7c	  cpx $7cba
$1b:dee7  f9 19 9b	  sbc $9b19,y
$1b:deea  f4 21 db	  pea $db21
$1b:deed  f9 76 9c	  sbc $9c76,y
$1b:def0  3e 1a ed	  rol $ed1a,x
$1b:def3  3c bb 50	  bit $50bb,x
$1b:def6  23 11		 and $11,s
$1b:def8  40			rti
$1b:def9  c2 a2		 rep #$a2
$1b:defb  10 e8		 bpl $dee5
$1b:defd  54 3a 81	  mvn $81,$3a
$1b:df00  0e 8d 43	  asl $438d
$1b:df03  a5 22		 lda $22
$1b:df05  f1 9c		 sbc ($9c),y
$1b:df07  c3 a6		 cmp $a6,s
$1b:df09  10 a8		 bpl $deb3
$1b:df0b  8c 2a 41	  sty $412a
$1b:df0e  0a			asl a
$1b:df0f  90 8b		 bcc $de9c
$1b:df11  c2 15		 rep #$15
$1b:df13  12 20		 ora ($20)
$1b:df15  89 08 08	  bit #$0808
$1b:df18  c0 46 02	  cpy #$0246
$1b:df1b  62 14 0a	  per $e932
$1b:df1e  41 4a		 eor ($4a,x)
$1b:df20  22 11 08 09   jsl $090811
$1b:df24  00 4e		 brk #$4e
$1b:df26  28			plp
$1b:df27  a1 04		 lda ($04,x)
$1b:df29  64 94		 stz $94
$1b:df2b  a9 21 6c	  lda #$6c21
$1b:df2e  4d 41 10	  eor $1041
$1b:df31  37 8c		 and [$8c],y
$1b:df33  50 e6		 bvc $df1b
$1b:df35  26 e2		 rol $e2
$1b:df37  8a			txa
$1b:df38  0f 40 66 03   ora $036640
$1b:df3c  f1 90		 sbc ($90),y
$1b:df3e  a0 cc 98	  ldy #$98cc
$1b:df41  28			plp
$1b:df42  31 98		 and ($98),y
$1b:df44  17 46		 ora [$46],y
$1b:df46  40			rti
$1b:df47  83 23		 sta $23,s
$1b:df49  78			sei
$1b:df4a  a4 8c		 ldy $8c
$1b:df4c  82 28 24	  brl $0377
$1b:df4f  95 42		 sta $42,x
$1b:df51  a5 70		 lda $70
$1b:df53  e9 d4 3a	  sbc #$3ad4
$1b:df56  77 3a		 adc [$3a],y
$1b:df58  e1 ce		 sbc ($ce,x)
$1b:df5a  b6 73		 ldx $73,y
$1b:df5c  ad a5 e9	  lda $e9a5
$1b:df5f  70 0b		 bvs $df6c
$1b:df61  c2 5c		 rep #$5c
$1b:df63  16 c6		 asl $c6,x
$1b:df65  75 b2		 adc $b2,x
$1b:df67  9d 70 67	  sta $6770,x
$1b:df6a  5c 2c d4 66   jml $66d42c
$1b:df6e  35 45		 and $45,x
$1b:df70  87 58		 sta [$58]
$1b:df72  23 53		 and $53,s
$1b:df74  78			sei
$1b:df75  75 41		 adc $41,x
$1b:df77  a3 74		 lda $74,s
$1b:df79  78			sei
$1b:df7a  b4 0e		 ldy $0e,x
$1b:df7c  2d a0 73	  and $73a0
$1b:df7f  94 3b		 sty $3b,x
$1b:df81  a1 0e		 lda ($0e,x)
$1b:df83  9b			txy
$1b:df84  e3 9e		 sbc $9e,s
$1b:df86  00 d2		 brk #$d2
$1b:df88  06 b0		 asl $b0
$1b:df8a  74 5e		 stz $5e,x
$1b:df8c  a3 d1		 lda $d1,s
$1b:df8e  8b			phb
$1b:df8f  52 22		 eor ($22)
$1b:df91  d4 9c		 pei ($9c)
$1b:df93  b5 22		 lda $22,x
$1b:df95  ad 59 97	  lda $9759
$1b:df98  4d 25 d3	  eor $d325
$1b:df9b  59 75 0e	  eor $0e75,y
$1b:df9e  5d 04 b7	  eor $b704,x
$1b:dfa1  4d 6d d3	  eor $d36d
$1b:dfa4  4b			phk
$1b:dfa5  70 38		 bvs $dfdf
$1b:dfa7  28			plp
$1b:dfa8  60			rts
$1b:dfa9  f3 8e		 sbc ($8e,s),y
$1b:dfab  db			stp
$1b:dfac  a3 8e		 lda $8e,s
$1b:dfae  71 ab		 adc ($ab),y
$1b:dfb0  b9 c4 48	  lda $48c4,y
$1b:dfb3  4e e0 a0	  lsr $a0e0
$1b:dfb6  43 b4		 eor $b4,s
$1b:dfb8  2e 70 ab	  rol $ab70
$1b:dfbb  55 a2		 eor $a2,x
$1b:dfbd  d5 a8		 cmp $a8,x
$1b:dfbf  b5 2a		 lda $2a,x
$1b:dfc1  39 f6 8e	  and $8ef6,y
$1b:dfc4  6f 47 23 f6   adc $f62347
$1b:dfc8  00 83		 brk #$83
$1b:dfca  9c 6b 6e	  stz $6e6b
$1b:dfcd  71 aa		 adc ($aa),y
$1b:dfcf  f5 a9		 sbc $a9,x
$1b:dfd1  55 6a		 eor $6a,x
$1b:dfd3  a4 5a		 ldy $5a
$1b:dfd5  b0 35		 bcs $e00c
$1b:dfd7  0a			asl a
$1b:dfd8  b5 4c		 lda $4c,x
$1b:dfda  9a			txs
$1b:dfdb  00 50		 brk #$50
$1b:dfdd  7f 88 c8 09   adc $09c888,x
$1b:dfe1  02 23		 cop #$23
$1b:dfe3  22 88 c0 e3   jsl $e3c088
$1b:dfe7  9a			txs
$1b:dfe8  68			pla
$1b:dfe9  e4 2e		 cpx $2e
$1b:dfeb  39 e6 8e	  and $8ee6,y
$1b:dfee  46 cb		 lsr $cb
$1b:dff0  a3 4a		 lda $4a,s
$1b:dff2  15 8c		 ora $8c,x
$1b:dff4  c2 2d		 rep #$2d
$1b:dff6  4b			phk
$1b:dff7  73 81		 adc ($81,s),y
$1b:dff9  d4 0e		 pei ($0e)
$1b:dffb  a2 30 13	  ldx #$1330
$1b:dffe  99 8d 02	  sta $028d,y
$1b:e001  97 4e		 sta [$4e],y
$1b:e003  3a			dec a
$1b:e004  10 90		 bpl $df96
$1b:e006  4f 63 40 8b   eor $8b4063
$1b:e00a  54 c9 20	  mvn $20,$c9
$1b:e00d  7b			tdc
$1b:e00e  2a			rol a
$1b:e00f  b0 d0		 bcs $dfe1
$1b:e011  10 40		 bpl $e053
$1b:e013  94 20		 sty $20,x
$1b:e015  00 a4		 brk #$a4
$1b:e017  ca			dex
$1b:e018  9d 13 87	  sta $8713,x
$1b:e01b  4c a9 d2	  jmp $d2a9
$1b:e01e  38			sec
$1b:e01f  75 09		 adc $09,x
$1b:e021  5e 31 35	  lsr $3531,x
$1b:e024  98			tya
$1b:e025  ad 02 62	  lda $6202
$1b:e028  b9 08 75	  lda $7508,y
$1b:e02b  05 7a		 ora $7a
$1b:e02d  73 26		 adc ($26,s),y
$1b:e02f  18			clc
$1b:e030  d0 97		 bne $dfc9
$1b:e032  e3 b0		 sbc $b0,s
$1b:e034  61 8f		 adc ($8f,x)
$1b:e036  01 7e		 ora ($7e,x)
$1b:e038  30 a6		 bmi $dfe0
$1b:e03a  18			clc
$1b:e03b  c6 a1		 dec $a1
$1b:e03d  d2 96		 cmp ($96)
$1b:e03f  48			pha
$1b:e040  ce 56 a1	  dec $a156
$1b:e043  0a			asl a
$1b:e044  90 42		 bcc $e088
$1b:e046  b2 07		 lda ($07)
$1b:e048  b1 d0		 lda ($d0),y
$1b:e04a  c3 26		 cmp $26,s
$1b:e04c  d0 ca		 bne $e018
$1b:e04e  34 32		 bit $32,x
$1b:e050  89 90 b4	  bit #$b490
$1b:e053  3c c1 e2	  bit $e2c1,x
$1b:e056  1d 0b 53	  ora $530b,x
$1b:e059  ec 1e e3	  cpx $e31e
$1b:e05c  36 e8		 rol $e8,x
$1b:e05e  3d 8a 4d	  and $4d8a,x
$1b:e061  0c 83 81	  tsb $8183
$1b:e064  56 2f		 lsr $2f,x
$1b:e066  0c 8b 02	  tsb $028b
$1b:e069  44 14 10	  mvp $10,$14
$1b:e06c  60			rts
$1b:e06d  c8			iny
$1b:e06e  86 0a		 stx $0a
$1b:e070  12 13		 ora ($13)
$1b:e072  18			clc
$1b:e073  cb			wai
$1b:e074  9c a1 51	  stz $51a1
$1b:e077  07 48		 ora [$48]
$1b:e079  3c 42 21	  bit $2142,x
$1b:e07c  67 79		 adc [$79]
$1b:e07e  80 c4		 bra $e044
$1b:e080  22 16 91 ba   jsl $ba9116
$1b:e084  54 06 41	  mvn $41,$06
$1b:e087  46 1f		 lsr $1f
$1b:e089  8b			phb
$1b:e08a  e0 5e e2	  cpx #$e25e
$1b:e08d  00 10		 brk #$10
$1b:e08f  38			sec
$1b:e090  86 80		 stx $80
$1b:e092  9c 57 d7	  stz $d757
$1b:e095  b8			clv
$1b:e096  85 00		 sta $00
$1b:e098  b0 01		 bcs $e09b
$1b:e09a  20 8c 02	  jsr $028c
$1b:e09d  46 10		 lsr $10
$1b:e09f  f1 19		 sbc ($19),y
$1b:e0a1  bb			tyx
$1b:e0a2  bc 68 ae	  ldy $ae68,x
$1b:e0a5  f0 88		 beq $e02f
$1b:e0a7  3d 81 e4	  and $e481,x
$1b:e0aa  31 0b		 and ($0b),y
$1b:e0ac  51 dc		 eor ($dc),y
$1b:e0ae  1e 23 36	  asl $3623,x
$1b:e0b1  a8			tay
$1b:e0b2  3d 81 e0	  and $e081,x
$1b:e0b5  04 62		 tsb $62
$1b:e0b7  78			sei
$1b:e0b8  1a			inc a
$1b:e0b9  04 86		 tsb $86
$1b:e0bb  22 70 01 90   jsl $900170
$1b:e0bf  16 00		 asl $00,x
$1b:e0c1  d4 10		 pei ($10)
$1b:e0c3  7e 64 9c	  ror $9c64,x
$1b:e0c6  7e 27 e0	  ror $e027,x
$1b:e0c9  22 13 c0 28   jsl $28c013
$1b:e0cd  ef 71 9b c5   sbc $c59b71
$1b:e0d1  2c b5 45	  bit $45b5
$1b:e0d4  80 ab		 bra $e081
$1b:e0d6  c1 5e		 cmp ($5e,x)
$1b:e0d8  36 65		 rol $65,x
$1b:e0da  98			tya
$1b:e0db  d9 a9 d2	  cmp $d2a9,y
$1b:e0de  fa			plx
$1b:e0df  74 ba		 stz $ba,x
$1b:e0e1  1d 6e 87	  ora $876e,x
$1b:e0e4  4f e1 d9 98   eor $98d9e1
$1b:e0e8  75 3e		 adc $3e,x
$1b:e0ea  1d 5e 87	  ora $875e,x
$1b:e0ed  57 e1		 eor [$e1],y
$1b:e0ef  57 ea		 eor [$ea],y
$1b:e0f1  55 fa		 eor $fa,x
$1b:e0f3  15 8e		 ora $8e,x
$1b:e0f5  a5 63		 lda $63
$1b:e0f7  a1 57		 lda ($57,x)
$1b:e0f9  0a			asl a
$1b:e0fa  55 c2		 eor $c2,x
$1b:e0fc  15 80		 ora $80,x
$1b:e0fe  a5 60		 lda $60
$1b:e100  05 62		 ora $62
$1b:e102  2c 0b 95	  bit $950b
$1b:e105  2a			rol a
$1b:e106  e5 0e		 sbc $0e
$1b:e108  bd c3 af	  lda $afc3,x
$1b:e10b  91 2c		 sta ($2c),y
$1b:e10d  5c 4b 18 6b   jml $6b184b
$1b:e111  19 b4 b2	  ora $b2b4,y
$1b:e114  d7 2c		 cmp [$2c],y
$1b:e116  b6 12		 ldx $12,y
$1b:e118  ca			dex
$1b:e119  d9 6c 7a	  cmp $7a6c,y
$1b:e11c  b5 b2		 lda $b2,x
$1b:e11e  d7 4e		 cmp [$4e],y
$1b:e120  be 3a 47	  ldx $473a,y
$1b:e123  1a			inc a
$1b:e124  0b			phd
$1b:e125  0d 74 07	  ora $0774
$1b:e128  5d 02 97	  eor $9702,x
$1b:e12b  49 65 d0	  eor #$d065
$1b:e12e  19 74 3c	  ora $3c74,y
$1b:e131  22 21 20 80   jsl $802021
$1b:e135  b1 c5		 lda ($c5),y
$1b:e137  90 0c		 bcc $e145
$1b:e139  c0 cd 01	  cpy #$01cd
$1b:e13c  c2 9d		 rep #$9d
$1b:e13e  7b			tdc
$1b:e13f  a9 63 2a	  lda #$2a63
$1b:e142  58			cli
$1b:e143  b8			clv
$1b:e144  74 b2		 stz $b2,x
$1b:e146  1d 2d 87	  ora $872d,x
$1b:e149  4f 21 d9 41   eor $41d921
$1b:e14d  88			dey
$1b:e14e  8c 82 7a	  sty $7a82
$1b:e151  35 2a		 and $2a,x
$1b:e153  70 c0		 bvs $e115
$1b:e155  27 b4		 and [$b4]
$1b:e157  e9 e4 32	  sbc #$32e4
$1b:e15a  00 47		 brk #$47
$1b:e15c  4a			lsr a
$1b:e15d  d6 c4		 dec $c4,x
$1b:e15f  9e 11 ad	  stz $ad11,x
$1b:e162  a5 6b		 lda $6b
$1b:e164  86 25		 stx $25
$1b:e166  06 58		 asl $58
$1b:e168  89 05 8e	  bit #$8e05
$1b:e16b  65 80		 adc $80
$1b:e16d  af 96 cc b0   lda $b0cc96
$1b:e171  0c 10 9a	  tsb $9a10
$1b:e174  4b			phk
$1b:e175  a1 92		 lda ($92,x)
$1b:e177  e8			inx
$1b:e178  e3 08		 sbc $08,s
$1b:e17a  0d e7 43	  ora $43e7
$1b:e17d  97 43		 sta [$43],y
$1b:e17f  41 fd		 eor ($fd,x)
$1b:e181  6e 82 cb	  ror $cb82
$1b:e184  a2 b6 e8	  ldx #$e8b6
$1b:e187  ac ba 45	  ldy $45ba
$1b:e18a  6e 91 4b	  ror $4b91
$1b:e18d  a0 a9 32	  ldy #$32a9
$1b:e190  8b			phb
$1b:e191  40			rti
$1b:e192  d3 e1		 cmp ($e1,s),y
$1b:e194  0e 98 28	  asl $2898
$1b:e197  c0 de 33	  cpy #$33de
$1b:e19a  53 d8		 eor ($d8,s),y
$1b:e19c  c1 21		 cmp ($21,x)
$1b:e19e  d9 86 38	  cmp $3886,y
$1b:e1a1  e2 0b		 sep #$0b
$1b:e1a3  a5 4e		 lda $4e
$1b:e1a5  58			cli
$1b:e1a6  00 98		 brk #$98
$1b:e1a8  16 84		 asl $84,x
$1b:e1aa  c0 4c db	  cpy #$db4c
$1b:e1ad  1c 71 54	  trb $5471
$1b:e1b0  ec 50 7c	  cpx $7c50
$1b:e1b3  cd 43 0c	  cmp $0c43
$1b:e1b6  bc c3 2f	  ldy $2fc3,x
$1b:e1b9  4d 72 85	  eor $8572
$1b:e1bc  48			pha
$1b:e1bd  1b			tcs
$1b:e1be  e1 0e		 sbc ($0e,x)
$1b:e1c0  ba			tsx
$1b:e1c1  c3 ae		 cmp $ae,s
$1b:e1c3  cd f3 bb	  cmp $bbf3
$1b:e1c6  43 ae		 eor $ae,s
$1b:e1c8  eb			xba
$1b:e1c9  33 5f		 and ($5f,s),y
$1b:e1cb  1a			inc a
$1b:e1cc  f4 97 a3	  pea $a397
$1b:e1cf  78			sei
$1b:e1d0  63 8e		 adc $8e,s
$1b:e1d2  25 96		 and $96
$1b:e1d4  0c 70 a7	  tsb $a770
$1b:e1d7  5e 19 a1	  lsr $a119,x
$1b:e1da  4e c4 c3	  lsr $c3c4
$1b:e1dd  21 50		 and ($50,x)
$1b:e1df  c9 4c 32	  cmp #$324c
$1b:e1e2  35 0c		 and $0c,x
$1b:e1e4  9c c7 b0	  stz $b0c7
$1b:e1e7  75 ec		 adc $ec,x
$1b:e1e9  1c 7b 27	  trb $277b
$1b:e1ec  5e c9 c3	  lsr $c3c9,x
$1b:e1ef  b0 b0		 bcs $e1a1
$1b:e1f1  ec 34 3b	  cpx $3b34
$1b:e1f4  2b			pld
$1b:e1f5  0e cb 08	  asl $08cb
$1b:e1f8  47 0e		 eor [$0e]
$1b:e1fa  25 1c		 and $1c
$1b:e1fc  bc 2b 31	  ldy $312b,x
$1b:e1ff  0a			asl a
$1b:e200  cc c2 b1	  cpy $b1c2
$1b:e203  10 ac		 bpl $e1b1
$1b:e205  d0 c4		 bne $e1cb
$1b:e207  29 43 00	  and #$0043
$1b:e20a  cd 52 86	  cmp $8652
$1b:e20d  84 40		 sty $40
$1b:e20f  4c d9 1c	  jmp $1cd9
$1b:e212  19 64 31	  ora $3164,y
$1b:e215  11 90		 ora ($90),y
$1b:e217  10 06		 bpl $e21f
$1b:e219  5d a7 97	  eor $97a7,x
$1b:e21c  6a			ror a
$1b:e21d  12 65		 ora ($65)
$1b:e21f  0c 8c 43	  tsb $438c
$1b:e222  23 30		 and $30,s
$1b:e224  c8			iny
$1b:e225  44 32 12	  mvp $12,$32
$1b:e228  63 33		 adc $33,s
$1b:e22a  00 8c		 brk #$8c
$1b:e22c  cc 7c 63	  cpy $637c
$1b:e22f  d2 1e		 cmp ($1e)
$1b:e231  8d e0 92	  sta $92e0
$1b:e234  20 41 23	  jsr $2341
$1b:e237  85 28		 sta $28
$1b:e239  14 71		 trb $71
$1b:e23b  cd 24 73	  cmp $7324
$1b:e23e  45 1c		 eor $1c
$1b:e240  de c7 34	  dec $34c7,x
$1b:e243  69 51 d2	  adc #$d251
$1b:e246  a4 47		 ldy $47
$1b:e248  9b			txy
$1b:e249  0c 9b c3	  tsb $c39b
$1b:e24c  28			plp
$1b:e24d  f0 ca		 beq $e219
$1b:e24f  2a			rol a
$1b:e250  7c d4 00	  jmp ($00d4,x)
$1b:e253  a0 0a 2f	  ldy #$2f0a
$1b:e256  b8			clv
$1b:e257  b8			clv
$1b:e258  3a			dec a
$1b:e259  ed 3e bb	  sbc $bb3e
$1b:e25c  51 1a		 eor ($1a),y
$1b:e25e  d8			cld
$1b:e25f  c6 b6		 dec $b6
$1b:e261  51 ad		 eor ($ad),y
$1b:e263  a4 6b		 ldy $6b
$1b:e265  89 5a d8	  bit #$d85a
$1b:e268  d6 b6		 dec $b6,x
$1b:e26a  55 a5		 eor $a5,x
$1b:e26c  f0 2f		 beq $e29d
$1b:e26e  03 69		 ora $69,s
$1b:e270  9a			txs
$1b:e271  e2 46		 sep #$46
$1b:e273  b8			clv
$1b:e274  6b			rtl
$1b:e275  d0 85		 bne $e1fc
$1b:e277  44 21 d3	  mvp $d3,$21
$1b:e27a  76 78		 ror $78,x
$1b:e27c  d1 5a		 cmp ($5a),y
$1b:e27e  28			plp
$1b:e27f  cf 04 a8 dd   cmp $dda804
$1b:e283  23 9c		 and $9c,s
$1b:e285  68			pla
$1b:e286  e6 11		 inc $11
$1b:e288  be 69 20	  ldx $2069,y
$1b:e28b  c2 2f		 rep #$2f
$1b:e28d  ca			dex
$1b:e28e  35 c1		 and $c1,x
$1b:e290  8d 71 59	  sta $5971
$1b:e293  60			rts
$1b:e294  c9 1d ac	  cmp #$ac1d
$1b:e297  6b			rtl
$1b:e298  85 da		 sta $da
$1b:e29a  5f 03 30 1e   eor $1e3003,x
$1b:e29e  84 ba		 sty $ba
$1b:e2a0  05 c0		 ora $c0
$1b:e2a2  3d 03 85	  and $8503,x
$1b:e2a5  18			clc
$1b:e2a6  a2 46 28	  ldx #$2846
$1b:e2a9  d1 89		 cmp ($89),y
$1b:e2ab  b0 4c		 bcs $e2f9
$1b:e2ad  42 40		 wdm #$40
$1b:e2af  10 00		 bpl $e2b1
$1b:e2b1  a1 4d		 lda ($4d,x)
$1b:e2b3  e3 14		 sbc $14,s
$1b:e2b5  78			sei
$1b:e2b6  c5 14		 cmp $14
$1b:e2b8  3e 62 00	  rol $0062,x
$1b:e2bb  10 05		 bpl $e2c2
$1b:e2bd  15 6e		 ora $6e,x
$1b:e2bf  6f c3 64 88   adc $8864c3
$1b:e2c3  30 6f		 bmi $e334
$1b:e2c5  5b			tcd
$1b:e2c6  11 f8		 ora ($f8),y
$1b:e2c8  4e b6 97	  lsr $97b6
$1b:e2cb  ae 1c 32	  ldx $321c
$1b:e2ce  15 0c		 ora $0c,x
$1b:e2d0  8f c3 23 50   sta $5023c3
$1b:e2d4  c8			iny
$1b:e2d5  f1 24		 sbc ($24),y
$1b:e2d7  65 24		 adc $24
$1b:e2d9  d1 9c		 cmp ($9c),y
$1b:e2db  ad cc 18	  lda $18cc
$1b:e2de  30 ee		 bmi $e2ce
$1b:e2e0  84 3b		 sty $3b
$1b:e2e2  a3 8e		 lda $8e,s
$1b:e2e4  30 0c		 bmi $e2f2
$1b:e2e6  5a			phy
$1b:e2e7  51 56		 eor ($56),y
$1b:e2e9  9c 45 a7	  stz $a745
$1b:e2ec  15 69		 ora $69,x
$1b:e2ee  44 33 e5	  mvp $e5,$33
$1b:e2f1  0c db c3	  tsb $c3db
$1b:e2f4  3e 10 cf	  rol $cf10,x
$1b:e2f7  a9 bc 7e	  lda #$7ebc
$1b:e2fa  67 31		 adc [$31]
$1b:e2fc  f8			sed
$1b:e2fd  c3 36		 cmp $36,s
$1b:e2ff  c7 11		 cmp [$11]
$1b:e301  fa			plx
$1b:e302  1d 47 55	  ora $5547,x
$1b:e305  0c d5 c3	  tsb $c3d5
$1b:e308  3a			dec a
$1b:e309  d0 ce		 bne $e2d9
$1b:e30b  bc 3b a7	  ldy $a73b,x
$1b:e30e  0e ea 24	  asl $24ea
$1b:e311  47 a6		 eor [$a6]
$1b:e313  ef 68 71 80   sbc $807168
$1b:e317  3a			dec a
$1b:e318  46 31		 lsr $31
$1b:e31a  e9 19 ca	  sbc #$ca19
$1b:e31d  1d 40 87	  ora $8740,x
$1b:e320  4c 22 96	  jmp $9622
$1b:e323  6a			ror a
$1b:e324  a2 c0 55	  ldx #$55c0
$1b:e327  e1 0c		 sbc ($0c,x)
$1b:e329  8b			phb
$1b:e32a  43 3c		 eor $3c,s
$1b:e32c  30 c8		 bmi $e2f6
$1b:e32e  34 33		 bit $33,x
$1b:e330  c5 4c		 cmp $4c
$1b:e332  f1 43		 sbc ($43),y
$1b:e334  20 f4 c5	  jsr $c5f4
$1b:e337  d0 45		 bne $e37e
$1b:e339  d8			cld
$1b:e33a  66 c0		 ror $c0
$1b:e33c  15 d9		 ora $d9,x
$1b:e33e  2d ca 2d	  and $2dca
$1b:e341  a9 ab 6a	  lda #$6aab
$1b:e344  60			rts
$1b:e345  50 06		 bvc $e34d
$1b:e347  d8			cld
$1b:e348  43 a0		 eor $a0,s
$1b:e34a  14 ee		 trb $ee
$1b:e34c  ab			plb
$1b:e34d  7c fc ae	  jmp ($aefc,x)
$1b:e350  71 6f		 adc ($6f),y
$1b:e352  0a			asl a
$1b:e353  3c 5e 07	  bit $075e,x
$1b:e356  1c d1 c7	  trb $c7d1
$1b:e359  34 51		 bit $51,x
$1b:e35b  ce 34 73	  dec $7334
$1b:e35e  8e f7 1d	  stx $1df7
$1b:e361  2b			pld
$1b:e362  ec f4 8f	  cpx $8ff4
$1b:e365  94 97		 sty $97,x
$1b:e367  4d 25 d0	  eor $d025
$1b:e36a  c9 74 72	  cmp #$7274
$1b:e36d  5d 0e 07	  eor $070e,x
$1b:e370  9d 0e 5d	  sta $5d0e,x
$1b:e373  0d 8b 59	  ora $598b
$1b:e376  a1 d6		 lda ($d6,x)
$1b:e378  1a			inc a
$1b:e379  b0 80		 bcs $e2fb
$1b:e37b  2c 50 eb	  bit $eb50
$1b:e37e  25 3a		 and $3a
$1b:e380  c3 0e		 cmp $0e,s
$1b:e382  b1 d3		 lda ($d3),y
$1b:e384  ac 50 cd	  ldy $cd50
$1b:e387  f4 33 79	  pea $7933
$1b:e38a  0c a2 43	  tsb $43a2
$1b:e38d  26 c2		 rol $c2
$1b:e38f  f1 df		 sbc ($df),y
$1b:e391  8d 46 8b	  sta $8b46
$1b:e394  14 dc		 trb $dc
$1b:e396  2e 42 a9	  rol $a942
$1b:e399  b9 5e 95	  lda $955e,y
$1b:e39c  50 80		 bvc $e31e
$1b:e39e  1e 08 a6	  asl $a608,x
$1b:e3a1  e6 1d		 inc $1d
$1b:e3a3  d8			cld
$1b:e3a4  87 6d		 sta [$6d]
$1b:e3a6  e1 de		 sbc ($de,x)
$1b:e3a8  88			dey
$1b:e3a9  76 ea		 ror $ea,x
$1b:e3ab  1d f2 a7	  ora $a7f2,x
$1b:e3ae  76 29		 ror $29,x
$1b:e3b0  db			stp
$1b:e3b1  aa			tax
$1b:e3b2  77 a0		 adc [$a0],y
$1b:e3b4  3e 3b b1	  rol $b13b,x
$1b:e3b7  18			clc
$1b:e3b8  f2 e1		 sbc ($e1)
$1b:e3ba  d7 3a		 cmp [$3a],y
$1b:e3bc  76 ee		 ror $ee,x
$1b:e3be  1d db a7	  ora $a7db,x
$1b:e3c1  72 c6		 adc ($c6)
$1b:e3c3  a3 46		 lda $46,s
$1b:e3c5  86 73		 stx $73
$1b:e3c7  21 9c		 and ($9c,x)
$1b:e3c9  e1 a8		 sbc ($a8,x)
$1b:e3cb  d1 ce		 cmp ($ce),y
$1b:e3cd  63 cf		 adc $cf,s
$1b:e3cf  8a			txa
$1b:e3d0  59 48 60	  eor $6048,y
$1b:e3d3  43 02		 eor $02,s
$1b:e3d5  68			pla
$1b:e3d6  13 42		 ora ($42,s),y
$1b:e3d8  a8			tay
$1b:e3d9  80 12		 bra $e3ed
$1b:e3db  68			pla
$1b:e3dc  f2 61		 sbc ($61)
$1b:e3de  dc a8 77	  jml [$77a8]
$1b:e3e1  66 1d		 ror $1d
$1b:e3e3  da			phx
$1b:e3e4  a7 72		 lda [$72]
$1b:e3e6  a9 dc 9a	  lda #$9adc
$1b:e3e9  72 58		 adc ($58)
$1b:e3eb  3b			tsc
$1b:e3ec  21 f1		 and ($f1,x)
$1b:e3ee  c7 88		 cmp [$88]
$1b:e3f0  c7 d3		 cmp [$d3]
$1b:e3f2  0e f5 d3	  asl $d3f5
$1b:e3f5  b1 f0		 lda ($f0),y
$1b:e3f7  ef 55 3b d2   sbc $d23b55
$1b:e3fb  31 11		 and ($11),y
$1b:e3fd  80 0d		 bra $e40c
$1b:e3ff  82 89 0e	  brl $f28b
$1b:e402  96 ad		 stx $ad,y
$1b:e404  c7 e9		 cmp [$e9]
$1b:e406  0e fa 8c	  asl $8cfa
$1b:e409  ca			dex
$1b:e40a  59 71 b6	  eor $b671,y
$1b:e40d  5c 63 13 68   jml $681363
$1b:e411  c5 1e		 cmp $1e
$1b:e413  31 cc		 and ($cc),y
$1b:e415  8c 73 e1	  sty $e173
$1b:e418  dc 84 88	  jml [$8884]
$1b:e41b  95 05		 sta $05,x
$1b:e41d  2e 3c 82	  rol $823c
$1b:e420  d9 f7 a2	  cmp $a2f7,y
$1b:e423  dd f8 b7	  cmp $b7f8,x
$1b:e426  ba			tsx
$1b:e427  2d e3 ab	  and $abe3
$1b:e42a  77 ea		 adc [$ea],y
$1b:e42c  dd ea b7	  cmp $b7ea,x
$1b:e42f  be 2d e4	  ldx $e42d,y
$1b:e432  38			sec
$1b:e433  88			dey
$1b:e434  d8			cld
$1b:e435  0e c1 cc	  asl $ccc1
$1b:e438  5b			tcd
$1b:e439  85 3a		 sta $3a
$1b:e43b  58			cli
$1b:e43c  bb			tyx
$1b:e43d  0a			asl a
$1b:e43e  75 46		 adc $46,x
$1b:e440  1d 91 7f	  ora $7f91,x
$1b:e443  8e 4a 9d	  stx $9d4a
$1b:e446  92 87		 sta ($87)
$1b:e448  57 1f		 eor [$1f],y
$1b:e44a  e2 08		 sep #$08
$1b:e44c  00 30		 brk #$30
$1b:e44e  00 02		 brk #$02
$1b:e450  ba			tsx
$1b:e451  0d 1a ec	  ora $ec1a
$1b:e454  5b			tcd
$1b:e455  d9 16 f6	  cmp $f616,y
$1b:e458  c3 b1		 cmp $b1,s
$1b:e45a  30 ec		 bmi $e448
$1b:e45c  55 5b		 eor $5b,x
$1b:e45e  db			stp
$1b:e45f  56 f6		 lsr $f6,x
$1b:e461  53 b1		 eor ($b1,s),y
$1b:e463  54 ec 4c	  mvn $4c,$ec
$1b:e466  6b			rtl
$1b:e467  63 1a		 adc $1a,s
$1b:e469  d9 46 b6	  cmp $b646,y
$1b:e46c  b1 ae		 lda ($ae),y
$1b:e46e  11 fc		 ora ($fc),y
$1b:e470  6c ac 32	  jmp ($32ac)
$1b:e473  87 3e		 sta [$3e]
$1b:e475  81 70		 sta ($70,x)
$1b:e477  0f e0 fa c3   ora $c3fae0
$1b:e47b  b0 43		 bcs $e4c0
$1b:e47d  f1 00		 sbc ($00),y
$1b:e47f  15 30		 ora $30,x
$1b:e481  7e 20 82	  ror $8220,x
$1b:e484  20 05 34	  jsr $3405
$1b:e487  1e 4e 30	  asl $304e,x
$1b:e48a  eb			xba
$1b:e48b  3b			tsc
$1b:e48c  03 b9		 ora $b9,s
$1b:e48e  16 ee		 asl $ee,x
$1b:e490  c5 bc		 cmp $bc
$1b:e492  ee d0 ab	  inc $abd0
$1b:e495  77 6a		 adc [$6a],y
$1b:e497  dd c8 76	  cmp $76c8,x
$1b:e49a  7a			ply
$1b:e49b  1d 9f 87	  ora $879f,x
$1b:e49e  6b			rtl
$1b:e49f  a1 da		 lda ($da,x)
$1b:e4a1  f8			sed
$1b:e4a2  76 06		 ror $06,x
$1b:e4a4  9d 81 87	  sta $8781,x
$1b:e4a7  5f e9 d7 f8   eor $f8d7e9,x
$1b:e4ab  67 ca		 adc [$ca]
$1b:e4ad  19 f3 19	  ora $19f3,y
$1b:e4b0  98			tya
$1b:e4b1  00 80		 brk #$80
$1b:e4b3  04 08		 tsb $08
$1b:e4b5  40			rti
$1b:e4b6  01 04		 ora ($04,x)
$1b:e4b8  80 20		 bra $e4da
$1b:e4ba  31 cd		 and ($cd),y
$1b:e4bc  1c 73 44	  trb $4473
$1b:e4bf  99 14 c0	  sta $c014,y
$1b:e4c2  61 23		 adc ($23,x)
$1b:e4c4  97 45		 sta [$45],y
$1b:e4c6  08			php
$1b:e4c7  e1 21		 sbc ($21,x)
$1b:e4c9  d9 c8 76	  cmp $76c8,y
$1b:e4cc  76 1d		 ror $1d,x
$1b:e4ce  ac 87 6b	  ldy $6b87
$1b:e4d1  60			rts
$1b:e4d2  9f da 27 f7   sta $f727da,x
$1b:e4d6  09 fd e2	  ora #$e2fd
$1b:e4d9  7f 62 9f ea   adc $ea9f62,x
$1b:e4dd  a7 fb		 lda [$fb]
$1b:e4df  29 fe ea	  and #$eafe
$1b:e4e2  7f a1 96 f5   adc $f596a1,x
$1b:e4e6  fa			plx
$1b:e4e7  41 be		 eor ($be,x)
$1b:e4e9  f4 6f bc	  pea $bc6f
$1b:e4ec  1b			tcs
$1b:e4ed  f1 46		 sbc ($46),y
$1b:e4ef  fc 41 bf	  jsr ($bf41,x)
$1b:e4f2  34 6f		 bit $6f,x
$1b:e4f4  cc 1b f5	  cpy $f51b
$1b:e4f7  46 fd		 lsr $fd
$1b:e4f9  41 3f		 eor ($3f,x)
$1b:e4fb  f4 4f fe	  pea $fe4f
$1b:e4fe  13 ff		 ora ($ff,s),y
$1b:e500  c4 ff		 cpy $ff
$1b:e502  c1 3f		 cmp ($3f,x)
$1b:e504  94 4f		 sty $4f,x
$1b:e506  e6 13		 inc $13
$1b:e508  f9 c4 fe	  sbc $fec4,y
$1b:e50b  41 3f		 eor ($3f,x)
$1b:e50d  74 4f		 stz $4f,x
$1b:e50f  de 13 f7	  dec $f713,x
$1b:e512  c4 fd		 cpy $fd
$1b:e514  80 04		 bra $e51a
$1b:e516  05 00		 ora $00
$1b:e518  14 9c		 trb $9c
$1b:e51a  4e 35 6f	  lsr $6f35
$1b:e51d  0b			phd
$1b:e51e  9c 42 68	  stz $6842
$1b:e521  bb			tyx
$1b:e522  00 0d		 brk #$0d
$1b:e524  4e 21 40	  lsr $4021
$1b:e527  1c 9c ec	  trb $ec9c
$1b:e52a  b9 02 1b	  lda $1b02,y
$1b:e52d  d4 6b		 pei ($6b)
$1b:e52f  c4 38		 cpy $38
$1b:e531  1f 3e af 28   ora $28af3e,x
$1b:e535  8a			txa
$1b:e536  e2 f3		 sep #$f3
$1b:e538  e4 e6		 cpx $e6
$1b:e53a  36 3a		 rol $3a,x
$1b:e53c  d2 b2		 cmp ($b2)
$1b:e53e  87 cf		 sta [$cf]
$1b:e540  93 b3		 sta ($b3,s),y
$1b:e542  9c ea 8c	  stz $8cea
$1b:e545  ca			dex
$1b:e546  4f 4d 76 a6   eor $a6764d
$1b:e54a  7a			ply
$1b:e54b  77 52		 adc [$52],y
$1b:e54d  fb			xce
$1b:e54e  4f 7c e8 84   eor $84e87c
$1b:e552  37 ba		 and [$ba],y
$1b:e554  21 4f		 and ($4f,x)
$1b:e556  fe 90 f5	  inc $f590,x
$1b:e559  0f ac bd 87   ora $87bdac
$1b:e55d  5a			phy
$1b:e55e  b9 c3 bc	  lda $bcc3,y
$1b:e561  9e 80 c7	  stz $c780,x
$1b:e564  60			rts
$1b:e565  99 e8 b3	  sta $b3e8,y
$1b:e568  b3 87		 lda ($87,s),y
$1b:e56a  be 69 40	  ldx $4069,y
$1b:e56d  ce 31 36	  dec $3631
$1b:e570  24 87		 bit $87
$1b:e572  d1 ab		 cmp ($ab),y
$1b:e574  1c ae 57	  trb $57ae
$1b:e577  71 85		 adc ($85),y
$1b:e579  7a			ply
$1b:e57a  dc ce 68	  jml [$68ce]
$1b:e57d  e5 7a		 sbc $7a
$1b:e57f  a9 ce		 lda #$ce
$1b:e581  84 44		 sty $44
$1b:e583  3a			dec a
$1b:e584  07 81		 ora [$81]
$1b:e586  bb			tyx
$1b:e587  ca			dex
$1b:e588  7a			ply
$1b:e589  60			rts
$1b:e58a  3c d8 00	  bit $00d8,x
$1b:e58d  8e c7 3d	  stx $3dc7
$1b:e590  67 97		 adc [$97]
$1b:e592  53 46		 eor ($46,s),y
$1b:e594  76 83		 ror $83,x
$1b:e596  00 0f		 brk #$0f
$1b:e598  c1 25		 cmp ($25,x)
$1b:e59a  26 f0		 rol $f0
$1b:e59c  d3 ec		 cmp ($ec,s),y
$1b:e59e  75 aa		 adc $aa,x
$1b:e5a0  29 37		 and #$37
$1b:e5a2  82 c0 0b	  brl $f165
$1b:e5a5  e0 b3		 cpx #$b3
$1b:e5a7  82 bb 15	  brl $fb65
$1b:e5aa  d8			cld
$1b:e5ab  10 ad		 bpl $e55a
$1b:e5ad  5f 73 7b df   eor $df7b73,x
$1b:e5b1  c7 08		 cmp [$08]
$1b:e5b3  bf e9 ec e2   lda $e2ece9,x
$1b:e5b7  71 3c		 adc ($3c),y
$1b:e5b9  9e 5b 6d	  stz $6d5b,x
$1b:e5bc  a2 37		 ldx #$37
$1b:e5be  0f 86 7a 7f   ora $7f7a86
$1b:e5c2  3f b7 5b 86   and $865bb7,x
$1b:e5c6  6f 3d 9c 69   adc $699c3d
$1b:e5ca  a7 d3		 lda [$d3]
$1b:e5cc  eb			xba
$1b:e5cd  7d bc 86	  adc $86bc,x
$1b:e5d0  e3 f0		 sbc $f0,s
$1b:e5d2  d0 f5		 bne $e5c9
$1b:e5d4  7d 7c 82	  adc $827c,x
$1b:e5d7  92 16		 sta ($16)
$1b:e5d9  87 ab		 sta [$ab]
$1b:e5db  ab			plb
$1b:e5dc  28			plp
$1b:e5dd  07 53		 ora [$53]
$1b:e5df  d8			cld
$1b:e5e0  83 03		 sta $03,s
$1b:e5e2  19 f2 3f	  ora $3ff2,y
$1b:e5e5  a8			tay
$1b:e5e6  30 a2		 bmi $e58a
$1b:e5e8  e8			inx
$1b:e5e9  b3 85		 lda ($85,s),y
$1b:e5eb  a2 39		 ldx #$39
$1b:e5ed  39 bc 34	  and $34bc,y
$1b:e5f0  87 2b		 sta [$2b]
$1b:e5f2  e5 23		 sbc $23
$1b:e5f4  f7 5b		 sbc [$5b],y
$1b:e5f6  b1 4f		 lda ($4f),y
$1b:e5f8  e6 aa		 inc $aa
$1b:e5fa  72 af		 adc ($af)
$1b:e5fc  c0 7f		 cpy #$7f
$1b:e5fe  3f 3d bf ef   and $efbf3d,x
$1b:e602  0f 7f 5b 2b   ora $2b5b7f
$1b:e606  a7 93		 lda [$93]
$1b:e608  c9 c4		 cmp #$c4
$1b:e60a  e1 9d		 sbc ($9d,x)
$1b:e60c  53 f9		 eor ($f9,s),y
$1b:e60e  fe 74 45	  inc $4574,x
$1b:e611  73 e9		 adc ($e9,s),y
$1b:e613  f6 94		 inc $94,x
$1b:e615  45 7e		 eor $7e
$1b:e617  be 4e 80	  ldx $804e,y
$1b:e61a  44 0c 99	  mvp $99,$0c
$1b:e61d  f6 14		 inc $14,x
$1b:e61f  07 56		 ora [$56]
$1b:e621  62 11 0b	  per $f135
$1b:e624  72 39		 adc ($39)
$1b:e626  39 bd 85	  and $85bd,y
$1b:e629  14 e4		 trb $e4
$1b:e62b  1a			inc a
$1b:e62c  21 8b		 and ($8b,x)
$1b:e62e  72 3a		 adc ($3a)
$1b:e630  9a			txs
$1b:e631  33 91		 and ($91,s),y
$1b:e633  90 5b		 bcc $e690
$1b:e635  94 8f		 sty $8f,x
$1b:e637  2e e1 bc	  rol $bce1
$1b:e63a  36 6b		 rol $6b,x
$1b:e63c  e0 7f		 cpx #$7f
$1b:e63e  1e b7 63	  asl $63b7,x
$1b:e641  ad cc e6	  lda $e6cc
$1b:e644  73 46		 adc ($46,s),y
$1b:e646  f0 d7		 beq $e61f
$1b:e648  6a			ror a
$1b:e649  44 69 aa	  mvp $aa,$69
$1b:e64c  9c ab c2	  stz $c2ab
$1b:e64f  73 b2		 adc ($b2,s),y
$1b:e651  4a			lsr a
$1b:e652  c1 4c		 cmp ($4c,x)
$1b:e654  b5 1a		 lda $1a,x
$1b:e656  f5 2c		 sbc $2c,x
$1b:e658  03 09		 ora $09,s
$1b:e65a  67 40		 adc [$40]
$1b:e65c  c2 61		 rep #$61
$1b:e65e  d3 0c		 cmp ($0c,s),y
$1b:e660  5e 20 c6	  lsr $c620,x
$1b:e663  95 98		 sta $98,x
$1b:e665  bc 85 af	  ldy $af85,x
$1b:e668  0e ff 00	  asl $00ff
$1b:e66b  78			sei
$1b:e66c  47 ff		 eor [$ff]
$1b:e66e  a2 3f		 ldx #$3f
$1b:e670  0a			asl a
$1b:e671  79 17 ca	  adc $ca17,y
$1b:e674  de 67 f3	  dec $f367,x
$1b:e677  c7 a2		 cmp [$a2]
$1b:e679  7d 35 ea	  adc $ea35,x
$1b:e67c  bf 5e 7b b3   lda $b37b5e,x
$1b:e680  df be 0e f0   cmp $f00ebe,x
$1b:e684  ff 8c 3c 83   sbc $833c8c,x
$1b:e688  e5 2f		 sbc $2f
$1b:e68a  31 fb		 and ($fb),y
$1b:e68c  28			plp
$1b:e68d  67 a7		 adc [$a7]
$1b:e68f  84 37		 sty $37
$1b:e691  c4 e1		 cpy $e1
$1b:e693  12 1a		 ora ($1a)
$1b:e695  b9 de ac	  lda $acde,y
$1b:e698  ff 39 ed 85   sbc $85ed39,x
$1b:e69c  17 d3		 ora [$d3],y
$1b:e69e  45 3f		 eor $3f
$1b:e6a0  ce 99 36	  dec $3699
$1b:e6a3  1e a4 f4	  asl $f4a4,x
$1b:e6a6  b7 c7		 lda [$c7],y
$1b:e6a8  a9 ea e4	  lda #$e4ea
$1b:e6ab  1c cc e8	  trb $e8cc
$1b:e6ae  7a			ply
$1b:e6af  8d 7b 84	  sta $847b
$1b:e6b2  57 d2		 eor [$d2],y
$1b:e6b4  b9 16 65	  lda $6516,y
$1b:e6b7  b2 4a		 lda ($4a)
$1b:e6b9  75 6c		 adc $6c,x
$1b:e6bb  5f bb df c1   eor $c1dfbb,x
$1b:e6bf  1e 19 f1	  asl $f119,x
$1b:e6c2  57 8e		 eor [$8e],y
$1b:e6c4  fc 95 93	  jsr ($9395,x)
$1b:e6c7  d2 d8		 cmp ($d8)
$1b:e6c9  93 ed		 sta ($ed,s),y
$1b:e6cb  14 25		 trb $25
$1b:e6cd  b2 2e		 lda ($2e)
$1b:e6cf  31 ac		 and ($ac),y
$1b:e6d1  21 34		 and ($34,x)
$1b:e6d3  5d 59 b4	  eor $b459,x
$1b:e6d6  0d 81 38	  ora $3881
$1b:e6d9  3a			dec a
$1b:e6da  b4 2a		 ldy $2a,x
$1b:e6dc  8b			phb
$1b:e6dd  45 55		 eor $55
$1b:e6df  86 8b		 stx $8b
$1b:e6e1  3a			dec a
$1b:e6e2  84 65		 sty $65
$1b:e6e4  c8			iny
$1b:e6e5  a3 cb		 lda $cb,s
$1b:e6e7  4a			lsr a
$1b:e6e8  94 66		 sty $66,x
$1b:e6ea  4a			lsr a
$1b:e6eb  72 76		 adc ($76)
$1b:e6ed  73 94		 adc ($94,s),y
$1b:e6ef  ac 2b cb	  ldy $cb2b
$1b:e6f2  5d a9 52	  eor $52a9,x
$1b:e6f5  fa			plx
$1b:e6f6  d9 ba b6	  cmp $b6ba,y
$1b:e6f9  c6 06		 dec $06
$1b:e6fb  75 17		 adc $17,x
$1b:e6fd  0a			asl a
$1b:e6fe  b2 76		 lda ($76)
$1b:e700  42 b0		 wdm #$b0
$1b:e702  9d df e0	  sta $e0df,x
$1b:e705  0f 08 f8 8a   ora $8af808
$1b:e709  cd e5 38	  cmp $38e5
$1b:e70c  d0 ac		 bne $e6ba
$1b:e70e  43 40		 eor $40,s
$1b:e710  94 03		 sty $03,x
$1b:e712  79 a0 04	  adc $04a0,y
$1b:e715  fe 05 43	  inc $4305,x
$1b:e718  3f 91 fc 12   and $12fc91,x
$1b:e71c  00 90		 brk #$90
$1b:e71e  1c e2 c4	  trb $c4e2
$1b:e721  33 66		 and ($66,s),y
$1b:e723  f2 48		 sbc ($48)
$1b:e725  06 74		 asl $74
$1b:e727  de 7a 4e	  dec $4e7a,x
$1b:e72a  47 53		 eor [$53]
$1b:e72c  46 78		 lsr $78
$1b:e72e  4d 2a b8	  eor $b82a
$1b:e731  91 f0		 sta ($f0),y
$1b:e733  b2 04		 lda ($04)
$1b:e735  c8			iny
$1b:e736  cd a6 fa	  cmp $faa6
$1b:e739  c9 bc d9	  cmp #$d9bc
$1b:e73c  48			pha
$1b:e73d  3c 8e af	  bit $af8e,x
$1b:e740  ad 84 0a	  lda $0a84
$1b:e743  01 50		 ora ($50,x)
$1b:e745  0d 3a 9f	  ora $9f3a
$1b:e748  37 50		 and [$50],y
$1b:e74a  0f 53 d8 9d   ora $9dd853
$1b:e74e  25 b8		 and $b8
$1b:e750  cd ea d5	  cmp $d5ea
$1b:e753  75 88		 adc $88,x
$1b:e755  ad c4 8c	  lda $8cc4
$1b:e758  1e b5 f8	  asl $f8b5,x
$1b:e75b  a9 81 44	  lda #$4481
$1b:e75e  2a			rol a
$1b:e75f  20 55 16	  jsr $1655
$1b:e762  cf d8 99 05   cmp $0599d8
$1b:e766  58			cli
$1b:e767  26 45		 rol $45
$1b:e769  c4 4b		 cpy $4b
$1b:e76b  b1 d7		 lda ($d7),y
$1b:e76d  10 c5		 bpl $e734
$1b:e76f  96 42		 stx $42,y
$1b:e771  87 19		 sta [$19]
$1b:e773  8a			txa
$1b:e774  6c 87 0e	  jmp ($0e87)
$1b:e777  ef f0 07 f2   sbc $f207f0
$1b:e77b  3f a1 3f 02   and $023fa1,x
$1b:e77f  78			sei
$1b:e780  d7 c8		 cmp [$c8],y
$1b:e782  de 57 f3	  dec $f357,x
$1b:e785  47 9e		 eor [$9e]
$1b:e787  7d 15 8b	  adc $8b15,x
$1b:e78a  75 4f		 adc $4f,x
$1b:e78c  a6 82		 ldx $82
$1b:e78e  71 ab		 adc ($ab),y
$1b:e790  63 2a		 adc $2a,s
$1b:e792  3d 33 7b	  and $7b33,x
$1b:e795  0a			asl a
$1b:e796  2b			pld
$1b:e797  59 53 e7	  eor $e753,y
$1b:e79a  d4 d1		 pei ($d1)
$1b:e79c  b5 9d		 lda $9d,x
$1b:e79e  10 a9		 bpl $e749
$1b:e7a0  a0 9e		 ldy #$9e
$1b:e7a2  a3 ca		 lda $ca,s
$1b:e7a4  75 6c		 adc $6c,x
$1b:e7a6  77 c2		 adc [$c2],y
$1b:e7a8  7c f9 0e	  jmp ($0ef9,x)
$1b:e7ab  fc 06 d4	  jsr ($d406,x)
$1b:e7ae  e3 43		 sbc $43,s
$1b:e7b0  ca			dex
$1b:e7b1  e5 77		 sbc $77
$1b:e7b3  03 d5		 ora $d5,s
$1b:e7b5  a7 d6		 lda [$d6]
$1b:e7b7  e6 73		 inc $73
$1b:e7b9  40			rti
$1b:e7ba  e9 9c ce	  sbc #$ce9c
$1b:e7bd  75 49		 adc $49,x
$1b:e7bf  f1 77		 sbc ($77),y
$1b:e7c1  c2 dc		 rep #$dc
$1b:e7c3  51 e2		 eor ($e2),y
$1b:e7c5  ef 70 2a 97   sbc $972a70
$1b:e7c9  ec b9 e6	  cpx $e6b9
$1b:e7cc  df 3f 7c f5   cmp $f57c3f,x
$1b:e7d0  5e c9 85	  lsr $85c9,x
$1b:e7d3  d5 ce		 cmp $ce,x
$1b:e7d5  35 73		 and $73,x
$1b:e7d7  bd 59 24	  lda $2459,x
$1b:e7da  27 2b		 and [$2b]
$1b:e7dc  73 04		 adc ($04,s),y
$1b:e7de  8b			phb
$1b:e7df  a4 7d		 ldy $7d
$1b:e7e1  34 5d		 bit $5d,x
$1b:e7e3  16 75		 asl $75,x
$1b:e7e5  8c 89 c1	  sty $c189
$1b:e7e8  67 8f		 adc [$8f]
$1b:e7ea  a9 a6 1a	  lda #$1aa6
$1b:e7ed  56 33		 lsr $33,x
$1b:e7ef  db			stp
$1b:e7f0  01 81		 ora ($81,x)
$1b:e7f2  c9 d7 6a	  cmp #$6ad7
$1b:e7f5  56 e4		 lsr $e4,x
$1b:e7f7  e9 40 e0	  sbc #$e040
$1b:e7fa  f2 76		 sbc ($76)
$1b:e7fc  6c 63 4c	  jmp ($4c63)
$1b:e7ff  9f 55 fe 4f   sta $4ffe55,x
$1b:e803  39 ea 75	  and $75ea,y
$1b:e806  79 5c ae	  adc $ae5c,y
$1b:e809  5e 82 70	  lsr $7082,x
$1b:e80c  05 77		 ora $77
$1b:e80e  88			dey
$1b:e80f  66 36		 ror $36
$1b:e811  3a			dec a
$1b:e812  dc f8 91	  jml [$91f8]
$1b:e815  9d 81 d5	  sta $d581,x
$1b:e818  01 0e		 ora ($0e,x)
$1b:e81a  a9 8a 89	  lda #$898a
$1b:e81d  93 ea		 sta ($ea,s),y
$1b:e81f  3c 89 6a	  bit $6a89,x
$1b:e822  89 91 9c	  bit #$9c91
$1b:e825  68			pla
$1b:e826  79 40 27	  adc $2740,y
$1b:e829  2c 1e 9f	  bit $9f1e
$1b:e82c  5a			phy
$1b:e82d  f2 77		 sbc ($77)
$1b:e82f  41 90		 eor ($90,x)
$1b:e831  40			rti
$1b:e832  bf 6a f1 37   lda $37f16a,x
$1b:e836  d1 d4		 cmp ($d4),y
$1b:e838  8b			phb
$1b:e839  f4 9b 32	  pea $329b
$1b:e83c  82 2c 9f	  brl $876b
$1b:e83f  93 a0		 sta ($a0,s),y
$1b:e841  9c ea d8	  stz $d8ea
$1b:e844  35 c9		 and $c9,x
$1b:e846  cd ec 28	  cmp $28ec
$1b:e849  ad 1a ea	  lda $ea1a
$1b:e84c  68			pla
$1b:e84d  da			phx
$1b:e84e  38			sec
$1b:e84f  0f 1e a7 b1   ora $b1a71e
$1b:e853  de c1 10	  dec $10c1,x
$1b:e856  d9 fa df	  cmp $dffa,y
$1b:e859  24 00		 bit $00
$1b:e85b  73 78		 adc ($78,s),y
$1b:e85d  3c c6 6d	  bit $6dc6,x
$1b:e860  37 d6		 and [$d6],y
$1b:e862  4d e6 c1	  eor $c1e6
$1b:e865  41 7c		 eor ($7c,x)
$1b:e867  87 f4		 sta [$f4]
$1b:e869  fe 01 01	  inc $0101,x
$1b:e86c  08			php
$1b:e86d  0d 3a 9f	  ora $9f3a
$1b:e870  37 0f		 and [$0f],y
$1b:e872  99 bc 1f	  sta $1fbc,y
$1b:e875  e0 27 19	  cpx #$1927
$1b:e878  bd 5a ae	  lda $ae5a,x
$1b:e87b  19 19 bf	  ora $bf19,y
$1b:e87e  57 d6		 eor [$d6],y
$1b:e880  7f 07 98 85   adc $859807,x
$1b:e884  44 24 21	  mvp $21,$24
$1b:e887  20 78 89	  jsr $8978
$1b:e88a  bc 39 44	  ldy $4439,x
$1b:e88d  f2 ee		 sbc ($ee)
$1b:e88f  72 3a		 adc ($3a)
$1b:e891  a4 f3		 ldy $f3
$1b:e893  e5 72		 sbc $72
$1b:e895  f4 1b 1d	  pea $1d1b
$1b:e898  69 7c 33	  adc #$337c
$1b:e89b  39 a7 e0	  and $e0a7,y
$1b:e89e  66 0b		 ror $0b
$1b:e8a0  e4 5f		 cpx $5f
$1b:e8a2  0c fc e7	  tsb $e7fc
$1b:e8a5  54 6f 1d	  mvn $1d,$6f
$1b:e8a8  93 f0		 sta ($f0,s),y
$1b:e8aa  4d e6 70	  eor $70e6
$1b:e8ad  05 91		 ora $91
$1b:e8af  6a			ror a
$1b:e8b0  35 e0		 and $e0,x
$1b:e8b2  c1 58		 cmp ($58,x)
$1b:e8b4  aa			tax
$1b:e8b5  8c 67 a7	  sty $a767
$1b:e8b8  34 47		 bit $47,x
$1b:e8ba  12 68		 ora ($68)
$1b:e8bc  d0 4c		 bne $e90a
$1b:e8be  9d 44 48	  sta $4844,x
$1b:e8c1  a4 ea		 ldy $ea
$1b:e8c3  73 ab		 adc ($ab,s),y
$1b:e8c5  5f 82 8e 9c   eor $9c8e82,x
$1b:e8c9  25 a2		 and $a2
$1b:e8cb  ce 25 61	  dec $6125
$1b:e8ce  9e 7a 45	  stz $457a,x
$1b:e8d1  2c 20 c5	  bit $c520
$1b:e8d4  e3 67		 sbc $67,s
$1b:e8d6  31 78		 and ($78),y
$1b:e8d8  db			stp
$1b:e8d9  bf c0 04 56   lda $5604c0,x
$1b:e8dd  52 79		 eor ($79)
$1b:e8df  03 cc		 ora $cc,s
$1b:e8e1  cc c5 f1	  cpy $f1c5
$1b:e8e4  7f 99 d9 ce   adc $ced999,x
$1b:e8e8  40			rti
$1b:e8e9  2f 44 3b 2c   and $2c3b44
$1b:e8ed  4c 84 69	  jmp $6984
$1b:e8f0  96 27		 stx $27,y
$1b:e8f2  ba			tsx
$1b:e8f3  69 4b fe	  adc #$fe4b
$1b:e8f6  70 fe		 bvs $e8f6
$1b:e8f8  47 f5		 eor [$f5]
$1b:e8fa  07 e9		 ora [$e9]
$1b:e8fc  49 9c 68	  eor #$689c
$1b:e8ff  44 a3 cb	  mvp $cb,$a3
$1b:e902  d0 4e		 bne $e952
$1b:e904  16 ef		 asl $ef,x
$1b:e906  a7 1e		 lda [$1e]
$1b:e908  06 b7		 asl $b7
$1b:e90a  33 9f		 and ($9f,s),y
$1b:e90c  63 3c		 adc $3c,s
$1b:e90e  e5 be		 sbc $be
$1b:e910  1a			inc a
$1b:e911  a2 38 37	  ldx #$3738
$1b:e914  c1 4e		 cmp ($4e,x)
$1b:e916  c1 70		 cmp ($70,x)
$1b:e918  ea			nop
$1b:e919  7a			ply
$1b:e91a  94 6d		 sty $6d,x
$1b:e91c  3d 07 b1	  and $b107,x
$1b:e91f  d1 4b		 cmp ($4b),y
$1b:e921  c8			iny
$1b:e922  01 92		 ora ($92,x)
$1b:e924  78			sei
$1b:e925  b0 45		 bcs $e96c
$1b:e927  84 4f		 sty $4f
$1b:e929  64 5f		 stz $5f
$1b:e92b  8e b5 a2	  stx $a2b5
$1b:e92e  0d 10 6a	  ora $6a10
$1b:e931  00 99		 brk #$99
$1b:e933  74 f9		 stz $f9,x
$1b:e935  97 18		 sta [$18],y
$1b:e937  0f c9 ca 82   ora $82cac9
$1b:e93b  b0 26		 bcs $e963
$1b:e93d  04 f4		 tsb $f4
$1b:e93f  9e cf 82	  stz $82cf,x
$1b:e942  27 84		 and [$84]
$1b:e944  e1 50		 sbc ($50,x)
$1b:e946  aa			tax
$1b:e947  85 2e		 sta $2e
$1b:e949  f9 bb a7	  sbc $a7bb,y
$1b:e94c  26 fd		 rol $fd
$1b:e94e  d4 25		 pei ($25)
$1b:e950  95 0d		 sta $0d,x
$1b:e952  e9 7f 3c	  sbc #$3c7f
$1b:e955  7b			tdc
$1b:e956  27 c1		 and [$c1]
$1b:e958  06 0e		 asl $0e
$1b:e95a  47 a7		 eor [$a7]
$1b:e95c  81 7c		 sta ($7c,x)
$1b:e95e  1c dc a0	  trb $a0dc
$1b:e961  f8			sed
$1b:e962  77 3a		 adc [$3a],y
$1b:e964  a1 f1		 lda ($f1,x)
$1b:e966  12 18		 ora ($18)
$1b:e968  88			dey
$1b:e969  76 3a		 ror $3a,x
$1b:e96b  dc ce 6b	  jml [$6bce]
$1b:e96e  93 98		 sta ($98,s),y
$1b:e970  17 80		 ora [$80],y
$1b:e972  d4 86		 pei ($86)
$1b:e974  25 38		 and $38
$1b:e976  d5 4e		 cmp $4e,x
$1b:e978  34 3c		 bit $3c,x
$1b:e97a  9d 00 fc	  sta $fc00,x
$1b:e97d  48			pha
$1b:e97e  c4 42		 cpy $42
$1b:e980  2d 59 2d	  and $2d59
$1b:e983  4a			lsr a
$1b:e984  e0 50 38	  cpx #$3850
$1b:e987  4d 17 45	  eor $4517
$1b:e98a  9c e4 e6	  stz $e6e4
$1b:e98d  f6 14		 inc $14,x
$1b:e98f  5c ec e0 be   jml $bee0ec
$1b:e993  90 a3		 bcc $e938
$1b:e995  00 69		 brk #$69
$1b:e997  3a			dec a
$1b:e998  9a			txs
$1b:e999  33 28		 and ($28,s),y
$1b:e99b  69 67 06	  adc #$0667
$1b:e99e  f4 d9 03	  pea $03d9
$1b:e9a1  93 93		 sta ($93,s),y
$1b:e9a3  b3 9c		 lda ($9c,s),y
$1b:e9a5  9f d3 5e 80   sta $805ed3,x
$1b:e9a9  5d 75 a1	  eor $a175,x
$1b:e9ac  1e 87 f4	  asl $f487,x
$1b:e9af  fe a1 a6	  inc $a6a1,x
$1b:e9b2  75 6c		 adc $6c,x
$1b:e9b4  58			cli
$1b:e9b5  82 55 16	  brl $000d
$1b:e9b8  25 a1		 and $a1
$1b:e9ba  12 27		 ora ($27)
$1b:e9bc  2c 88 0b	  bit $0b88
$1b:e9bf  f4 d3 8d	  pea $8dd3
$1b:e9c2  57 3f		 eor [$3f],y
$1b:e9c4  38			sec
$1b:e9c5  67 a4		 adc [$a4]
$1b:e9c7  e6 73		 inc $73
$1b:e9c9  aa			tax
$1b:e9ca  70 1b		 bvs $e9e7
$1b:e9cc  98			tya
$1b:e9cd  9c 24 0e	  stz $0e24
$1b:e9d0  54 30 cf	  mvn $cf,$30
$1b:e9d3  7c ef a2	  jmp ($a2ef,x)
$1b:e9d6  77 b6		 adc [$b6],y
$1b:e9d8  bb			tyx
$1b:e9d9  52 f9		 eor ($f9)
$1b:e9db  c7 bb		 cmp [$bb]
$1b:e9dd  30 11		 bmi $e9f0
$1b:e9df  8a			txa
$1b:e9e0  00 76		 brk #$76
$1b:e9e2  68			pla
$1b:e9e3  23 68		 and $68,s
$1b:e9e5  1a			inc a
$1b:e9e6  e0 f9 49	  cpx #$49f9
$1b:e9e9  c6 a8		 dec $a8
$1b:e9eb  7e 0e 24	  ror $240e,x
$1b:e9ee  1c ae ae	  trb $aeae
$1b:e9f1  70 38		 bvs $ea2b
$1b:e9f3  02 9a		 cop #$9a
$1b:e9f5  3e 8c ea	  rol $ea8c,x
$1b:e9f8  19 d1 c2	  ora $c2d1,y
$1b:e9fb  99 10 be	  sta $be10,y
$1b:e9fe  1a			inc a
$1b:e9ff  53 15		 eor ($15,s),y
$1b:ea01  85 60		 sta $60
$1b:ea03  f2 c0		 sbc ($c0)
$1b:ea05  76 3c		 ror $3c,x
$1b:ea07  fa			plx
$1b:ea08  2b			pld
$1b:ea09  c3 67		 cmp $67,s
$1b:ea0b  cb			wai
$1b:ea0c  d0 18		 bne $ea26
$1b:ea0e  af 5b 99 1b   lda $1b995b
$1b:ea12  b1 91		 lda ($91),y
$1b:ea14  08			php
$1b:ea15  c2 a2		 rep #$a2
$1b:ea17  b0 31		 bcs $ea4a
$1b:ea19  3c a9 40	  bit $40a9,x
$1b:ea1c  73 d9		 adc ($d9,s),y
$1b:ea1e  c0 14 0a	  cpy #$0a14
$1b:ea21  00 50		 brk #$50
$1b:ea23  19 c4 f5	  ora $f5c4,y
$1b:ea26  20 60 40	  jsr $4060
$1b:ea29  cf 1b c0 de   cmp $dec01b
$1b:ea2d  1a			inc a
$1b:ea2e  23 08		 and $08,s
$1b:ea30  f2 58		 sbc ($58)
$1b:ea32  22 22 09 c6   jsl $c60922
$1b:ea36  98			tya
$1b:ea37  2e 67 11	  rol $1167
$1b:ea3a  0f 88 20 b4   ora $b42088
$1b:ea3e  3c 81 b8	  bit $b881,x
$1b:ea41  bf cb 93 9b   lda $9b93cb,x
$1b:ea45  0b			phd
$1b:ea46  9e 73 91	  stz $9173,x
$1b:ea49  d4 fd		 pei ($fd)
$1b:ea4b  ab			plb
$1b:ea4c  cf a9 a3 0b   cmp $0ba3a9
$1b:ea50  9e 90 6e	  stz $6e90,x
$1b:ea53  69 11 e5	  adc #$e511
$1b:ea56  17 e5		 ora [$e5],y
$1b:ea58  80 5b		 bra $eab5
$1b:ea5a  1d 69 be	  ora $be69,x
$1b:ea5d  1a			inc a
$1b:ea5e  05 39		 ora $39
$1b:ea60  6f 82 02 11   adc $110282
$1b:ea64  61 3d		 adc ($3d,x)
$1b:ea66  80 23		 bra $ea8b
$1b:ea68  fd 41 eb	  sbc $eb41,x
$1b:ea6b  1f 61 7b 3a   ora $3a7b61,x
$1b:ea6f  7f 6c ed 1d   adc $1ded6c,x
$1b:ea73  90 4c		 bcc $eac1
$1b:ea75  1e 90 4b	  asl $4b90,x
$1b:ea78  27 98		 and [$98]
$1b:ea7a  4e 00 a0	  lsr $a000
$1b:ea7d  32 20		 and ($20)
$1b:ea7f  28			plp
$1b:ea80  0b			phd
$1b:ea81  80 78		 bra $eafb
$1b:ea83  20 31 cf	  jsr $cf31
$1b:ea86  10 4f		 bpl $ead7
$1b:ea88  3a			dec a
$1b:ea89  0d 12 60	  ora $6012
$1b:ea8c  bf 02 71 a6   lda $a67102,x
$1b:ea90  20 9e 94	  jsr $949e
$1b:ea93  1a			inc a
$1b:ea94  26 c0		 rol $c0
$1b:ea96  04 16		 tsb $16
$1b:ea98  84 ae		 sty $ae
$1b:ea9a  61 01		 adc ($01,x)
$1b:ea9c  e4 e6		 cpx $e6
$1b:ea9e  c2 e7		 rep #$e7
$1b:eaa0  9c 1b 98	  stz $981b
$1b:eaa3  80 7a		 bra $eb1f
$1b:eaa5  9a			txs
$1b:eaa6  30 b9		 bmi $ea61
$1b:eaa8  e9 06 ed	  sbc #$ed06
$1b:eaab  d5 e5		 cmp $e5,x
$1b:eaad  18			clc
$1b:eaae  0f b8 39 0f   ora $0f39b8
$1b:eab2  e9 28 f9	  sbc #$f928
$1b:eab5  39 8d 8e	  and $8e8d,y
$1b:eab8  b4 e2		 ldy $e2,x
$1b:eaba  19 9c d0	  ora $d09c,y
$1b:eabd  dd c6 01	  cmp $01c6,x
$1b:eac0  aa			tax
$1b:eac1  9c ea 86	  stz $86ea
$1b:eac4  aa			tax
$1b:eac5  6c 20 80	  jmp ($8020)
$1b:eac8  88			dey
$1b:eac9  c7 42		 cmp [$42]
$1b:eacb  60			rts
$1b:eacc  2e 58 c0	  rol $c058
$1b:eacf  1f cd a7 38   ora $38a7cd,x
$1b:ead3  9e 7c 1a	  stz $1a7c,x
$1b:ead6  d3 95		 cmp ($95,s),y
$1b:ead8  a8			tay
$1b:ead9  20 85 6a	  jsr $6a85
$1b:eadc  2f e5 7a c8   and $c87ae5
$1b:eae0  40			rti
$1b:eae1  9a			txs
$1b:eae2  7e de 85	  ror $85de,x
$1b:eae5  ff ac 0e 70   sbc $700eac,x
$1b:eae9  05 01		 ora $01
$1b:eaeb  90 ce		 bcc $eabb
$1b:eaed  40			rti
$1b:eaee  a0 9e 6c	  ldy #$6c9e
$1b:eaf1  f1 44		 sbc ($44),y
$1b:eaf3  f3 a9		 sbc ($a9,s),y
$1b:eaf5  d1 4e		 cmp ($4e),y
$1b:eaf7  0a			asl a
$1b:eaf8  4c 74 c5	  jmp $c574
$1b:eafb  13 d2		 ora ($d2,s),y
$1b:eafd  87 4a		 sta [$4a]
$1b:eaff  72 0a		 adc ($0a)
$1b:eb01  00 50		 brk #$50
$1b:eb03  21 90		 and ($90,x)
$1b:eb05  f8			sed
$1b:eb06  59 b0 b9	  eor $b9b0,y
$1b:eb09  e7 10		 sbc [$10]
$1b:eb0b  ed d4 d1	  sbc $d1d4
$1b:eb0e  85 cf		 sta $cf
$1b:eb10  48			pha
$1b:eb11  89 0d 61	  bit #$610d
$1b:eb14  e8			inx
$1b:eb15  fa			plx
$1b:eb16  a9 72 4b	  lda #$4b72
$1b:eb19  87 70		 sta [$70]
$1b:eb1b  b0 13		 bcs $eb30
$1b:eb1d  0d 62 2c	  ora $2c62
$1b:eb20  f3 0a		 sbc ($0a,s),y
$1b:eb22  73 cd		 adc ($cd,s),y
$1b:eb24  15 d9		 ora $d9,x
$1b:eb26  5e 2b 81	  lsr $812b,x
$1b:eb29  9c 0d 90	  stz $900d
$1b:eb2c  d8			cld
$1b:eb2d  4f 01 11 8e   eor $8e1101
$1b:eb31  84 c2		 sty $c2
$1b:eb33  5c b1 00 bf   jml $bf00b1
$1b:eb37  d7 4e		 cmp [$4e],y
$1b:eb39  71 3c		 adc ($3c),y
$1b:eb3b  f8			sed
$1b:eb3c  35 a7		 and $a7,x
$1b:eb3e  2b			pld
$1b:eb3f  50 41		 bvc $eb82
$1b:eb41  12 d4		 ora ($d4)
$1b:eb43  1f ca f4 87   ora $87f4ca,x
$1b:eb47  06 b7		 asl $b7
$1b:eb49  7e 00 ef	  ror $ef00,x
$1b:eb4c  f0 07		 beq $eb55
$1b:eb4e  84 7c		 sty $7c
$1b:eb50  45 e3		 eor $e3
$1b:eb52  3f 22 79 57   and $577922,x
$1b:eb56  cc de 77	  cpy $77de
$1b:eb59  f4 47 a6	  pea $a647
$1b:eb5c  7d 55 eb	  adc $eb55,x
$1b:eb5f  bf 66 7b 77   lda $777b66,x
$1b:eb63  c0 03 05	  cpy #$0503
$1b:eb66  00 0f		 brk #$0f
$1b:eb68  80 3b		 bra $eba5
$1b:eb6a  fc 01 e1	  jsr ($e101,x)
$1b:eb6d  1f 11 78 cf   ora $cf7811,x
$1b:eb71  c8			iny
$1b:eb72  9e 55 f3	  stz $f355,x
$1b:eb75  37 9d		 and [$9d],y
$1b:eb77  fd 11 e9	  sbc $e911,x
$1b:eb7a  9f 55 7a ef   sta $ef7a55,x
$1b:eb7e  d9 9e dd	  cmp $dd9e,y
$1b:eb81  f7 3b		 sbc [$3b],y
$1b:eb83  d1 63		 cmp ($63),y
$1b:eb85  11 07		 ora ($07),y
$1b:eb87  c8			iny
$1b:eb88  c4 5c		 cpy $5c
$1b:eb8a  ed 02 92	  sbc $9202
$1b:eb8d  3e 8a 21	  rol $218a,x
$1b:eb90  19 00 34	  ora $3400,y
$1b:eb93  06 03		 asl $03
$1b:eb95  20 90 86	  jsr $8690
$1b:eb98  42 45		 wdm #$45
$1b:eb9a  24 73		 bit $73
$1b:eb9c  8c 12 0b	  sty $0b12
$1b:eb9f  06 0b		 asl $0b
$1b:eba1  0c a4 2e	  tsb $2ea4
$1b:eba4  02 92		 cop #$92
$1b:eba6  0a			asl a
$1b:eba7  18			clc
$1b:eba8  ca			dex
$1b:eba9  46 18		 lsr $18
$1b:ebab  28			plp
$1b:ebac  08			php
$1b:ebad  04 74		 tsb $74
$1b:ebaf  90 b0		 bcc $eb61
$1b:ebb1  1f e8 a9 0a   ora $0aa9e8,x
$1b:ebb5  02 28		 cop #$28
$1b:ebb7  51 49		 eor ($49),y
$1b:ebb9  45 a0		 eor $a0
$1b:ebbb  11 7d		 ora ($7d),y
$1b:ebbd  64 7a		 stz $7a
$1b:ebbf  3f ad 89 c5   and $c589ad,x
$1b:ebc3  0d 0b 41	  ora $410b
$1b:ebc6  7b			tdc
$1b:ebc7  84 72		 sty $72
$1b:ebc9  4d 27 8d	  eor $8d27
$1b:ebcc  c7 23		 cmp [$23]
$1b:ebce  71 73		 adc ($73),y
$1b:ebd0  a8			tay
$1b:ebd1  1d 40 fa	  ora $fa40,x
$1b:ebd4  14 98		 trb $98
$1b:ebd6  05 36		 ora $36
$1b:ebd8  30 82		 bmi $eb5c
$1b:ebda  07 d0		 ora [$d0]
$1b:ebdc  c4 50		 cpy $50
$1b:ebde  83 1c		 sta $1c,s
$1b:ebe0  89 52 4f	  bit #$4f52
$1b:ebe3  c3 10		 cmp $10,s
$1b:ebe5  41 03		 eor ($03,x)
$1b:ebe7  e4 63		 cpx $63
$1b:ebe9  2f a2 8d 23   and $238da2
$1b:ebed  5a			phy
$1b:ebee  94 96		 sty $96,x
$1b:ebf0  07 c9		 ora [$c9]
$1b:ebf2  27 1e		 and [$1e]
$1b:ebf4  96 a6		 stx $a6,y
$1b:ebf6  15 a8		 ora $a8,x
$1b:ebf8  2a			rol a
$1b:ebf9  ca			dex
$1b:ebfa  15 19		 ora $19,x
$1b:ebfc  48			pha
$1b:ebfd  ab			plb
$1b:ebfe  10 57		 bpl $ec57
$1b:ec00  63 3c		 adc $3c,s
$1b:ec02  8e 82 01	  stx $0182
$1b:ec05  45 33		 eor $33
$1b:ec07  c8			iny
$1b:ec08  0a			asl a
$1b:ec09  e0 62 51	  cpx #$5162
$1b:ec0c  85 b8		 sta $b8
$1b:ec0e  29 c1 44	  and #$44c1
$1b:ec11  2a			rol a
$1b:ec12  c0 8c c2	  cpy #$c28c
$1b:ec15  d7 23		 cmp [$23],y
$1b:ec17  1a			inc a
$1b:ec18  88			dey
$1b:ec19  29 c1 6e	  and #$6ec1
$1b:ec1c  09 21 4e	  ora #$4e21
$1b:ec1f  04 46		 tsb $46
$1b:ec21  1a			inc a
$1b:ec22  b8			clv
$1b:ec23  19 2c 8a	  ora $8a2c,y
$1b:ec26  48			pha
$1b:ec27  f5 59		 sbc $59,x
$1b:ec29  e4 92		 cpx $92
$1b:ec2b  19 21 90	  ora $9021,y
$1b:ec2e  48			pha
$1b:ec2f  4b			phk
$1b:ec30  43 23		 eor $23,s
$1b:ec32  0a			asl a
$1b:ec33  02 48		 cop #$48
$1b:ec35  64 b0		 stz $b0
$1b:ec37  1a			inc a
$1b:ec38  3c 34 82	  bit $8234,x
$1b:ec3b  d2 19		 cmp ($19)
$1b:ec3d  54 aa 40	  mvn $40,$aa
$1b:ec40  7b			tdc
$1b:ec41  0a			asl a
$1b:ec42  3c 30 f6	  bit $f630,x
$1b:ec45  08			php
$1b:ec46  82 89 99	  brl $85d2
$1b:ec49  16 8f		 asl $8f,x
$1b:ec4b  0d 45 82	  ora $8245
$1b:ec4e  60			rts
$1b:ec4f  90 c8		 bcc $ec19
$1b:ec51  75 0a		 adc $0a,x
$1b:ec53  3c 31 36	  bit $3631,x
$1b:ec56  0a			asl a
$1b:ec57  82 88 44	  brl $30e2
$1b:ec5a  63 71		 adc $71,s
$1b:ec5c  c3 39		 cmp $39,s
$1b:ec5e  55 a1		 eor $a1,x
$1b:ec60  b1 88		 lda ($88),y
$1b:ec62  d1 90		 cmp ($90),y
$1b:ec64  0e 23 19	  asl $1923
$1b:ec67  39 11 c8	  and $c811,y
$1b:ec6a  22 30 e8 84   jsl $84e830
$1b:ec6e  4a			lsr a
$1b:ec6f  20 c9 13	  jsr $13c9
$1b:ec72  28			plp
$1b:ec73  1c 49 6a	  trb $6a49
$1b:ec76  11 98		 ora ($98),y
$1b:ec78  79 bc 5b	  adc $5bbc,y
$1b:ec7b  22 75 16 48   jsl $481675
$1b:ec7f  b1 40		 lda ($40),y
$1b:ec81  fa			plx
$1b:ec82  67 12		 adc [$12]
$1b:ec84  43 02		 eor $02,s
$1b:ec86  48			pha
$1b:ec87  91 88		 sta ($88),y
$1b:ec89  72 c9		 adc ($c9)
$1b:ec8b  2c 86 40	  bit $4086
$1b:ec8e  c1 09		 cmp ($09,x)
$1b:ec90  1c 90 e2	  trb $e290
$1b:ec93  68			pla
$1b:ec94  c1 90		 cmp ($90,x)
$1b:ec96  40			rti
$1b:ec97  5a			phy
$1b:ec98  08			php
$1b:ec99  c1 29		 cmp ($29,x)
$1b:ec9b  0c 8a 49	  tsb $498a
$1b:ec9e  0b			phd
$1b:ec9f  68			pla
$1b:eca0  04 a5		 tsb $a5
$1b:eca2  a0 ad 02	  ldy #$02ad
$1b:eca5  26 84		 rol $84
$1b:eca7  01 df		 ora ($df,x)
$1b:eca9  e0 0f 02	  cpx #$020f
$1b:ecac  94 1e		 sty $1e,x
$1b:ecae  0d 07 02	  ora $0207
$1b:ecb1  d4 09		 pei ($09)
$1b:ecb3  a0 30 30	  ldy #$3030
$1b:ecb6  2c c7 5a	  bit $5ac7
$1b:ecb9  05 03		 ora $03
$1b:ecbb  82 41 60	  brl $4cff
$1b:ecbe  d0 21		 bne $ece1
$1b:ecc0  7a			ply
$1b:ecc1  b8			clv
$1b:ecc2  5c 5f 11 48   jml $48115f
$1b:ecc6  99 64 49	  sta $4964,y
$1b:ecc9  cb			wai
$1b:ecca  56 8f		 lsr $8f,x
$1b:eccc  47 f8		 eor [$f8]
$1b:ecce  f1 c8		 sbc ($c8),y
$1b:ecd0  d9 a4 62	  cmp $62a4,y
$1b:ecd3  e0 54 a2	  cpx #$a254
$1b:ecd6  c9 a4 f1	  cmp #$f1a4
$1b:ecd9  25 20		 and $20
$1b:ecdb  50 a8		 bvc $ec85
$1b:ecdd  74 28		 stz $28,x
$1b:ecdf  88			dey
$1b:ece0  15 29		 ora $29,x
$1b:ece2  a7 60		 lda [$60]
$1b:ece4  8d 44 29	  sta $2944
$1b:ece7  88			dey
$1b:ece8  22 37 cd 10   jsl $10cd37
$1b:ecec  e4 47		 cpx $47
$1b:ecee  ff 48 7a 87   sbc $877a48,x
$1b:ecf2  c4 63		 cpy $63
$1b:ecf4  24 3b		 bit $3b
$1b:ecf6  04 96		 tsb $96
$1b:ecf8  41 21		 eor ($21,x)
$1b:ecfa  14 8a		 trb $8a
$1b:ecfc  f9 06 a1	  sbc $a106,y
$1b:ecff  2a			rol a
$1b:ed00  95 11		 sta $11,x
$1b:ed02  c6 2a		 dec $2a
$1b:ed04  c3 11		 cmp $11,s
$1b:ed06  a8			tay
$1b:ed07  48			pha
$1b:ed08  1c c1 21	  trb $21c1
$1b:ed0b  90 c8		 bcc $ecd5
$1b:ed0d  e4 87		 cpx $87
$1b:ed0f  90 3c		 bcc $ed4d
$1b:ed11  84 94		 sty $94
$1b:ed13  8e 03 53	  stx $5303
$1b:ed16  23 94		 and $94,s
$1b:ed18  85 b2		 sta $b2
$1b:ed1a  12 02		 ora ($02)
$1b:ed1c  38			sec
$1b:ed1d  8d 44 8c	  sta $8c44
$1b:ed20  e1 02		 sbc ($02,x)
$1b:ed22  7f b8 5d 85   adc $855db8,x
$1b:ed26  fe 18 2f	  inc $2f18,x
$1b:ed29  e8			inx
$1b:ed2a  97 c0		 sta [$c0],y
$1b:ed2c  0d 13 8a	  ora $8a13
$1b:ed2f  11 e6		 ora ($e6),y
$1b:ed31  28			plp
$1b:ed32  5f 08 dc 72   eor $72dc08,x
$1b:ed36  2e 5f 08	  rol $085f
$1b:ed39  a4 ba		 ldy $ba
$1b:ed3b  27 2e		 and [$2e]
$1b:ed3d  36 0c		 rol $0c,x
$1b:ed3f  5a			phy
$1b:ed40  38			sec
$1b:ed41  6f 07 c8 44   adc $44c807
$1b:ed45  4d e0 82	  eor $82e0
$1b:ed48  23 e0		 and $e0,s
$1b:ed4a  ae 01 f2	  ldx $f201
$1b:ed4d  0f a0 8c be   ora $be8ca0
$1b:ed51  45 18		 eor $18
$1b:ed53  71 86		 adc ($86),y
$1b:ed55  40			rti
$1b:ed56  3e 80 fe	  rol $fe80,x
$1b:ed59  29 33 88	  and #$8833
$1b:ed5c  52 9f		 eor ($9f)
$1b:ed5e  40			rti
$1b:ed5f  8b			phb
$1b:ed60  ba			tsx
$1b:ed61  5a			phy
$1b:ed62  67 5f		 adc [$5f]
$1b:ed64  22 8b 6a 52   jsl $526a8b
$1b:ed68  53 69		 eor ($69,s),y
$1b:ed6a  6a			ror a
$1b:ed6b  61 63		 adc ($63,x)
$1b:ed6d  a2 a0 04	  ldx #$04a0
$1b:ed70  79 47 86	  adc $8647,y
$1b:ed73  11 b2		 ora ($b2),y
$1b:ed75  8f 0d 25 e3   sta $e3250d
$1b:ed79  f6 43		 inc $43,x
$1b:ed7b  08			php
$1b:ed7c  0e 33 51	  asl $5133
$1b:ed7f  c4 c3		 cpy $c3
$1b:ed81  2c 36 13	  bit $1336
$1b:ed84  d9 46 e2	  cmp $e246,y
$1b:ed87  e3 71		 sbc $71,s
$1b:ed89  06 8c		 asl $8c
$1b:ed8b  59 04 31	  eor $3104,y
$1b:ed8e  a5 99		 lda $99
$1b:ed90  44 48 e2	  mvp $e2,$48
$1b:ed93  fd 08 b5	  sbc $b508,x
$1b:ed96  25 90		 and $90
$1b:ed98  4b			phk
$1b:ed99  42 8c		 wdm #$8c
$1b:ed9b  b3 c2		 lda ($c2,s),y
$1b:ed9d  81 57		 sta ($57,x)
$1b:ed9f  86 c4		 stx $c4
$1b:eda1  a8			tay
$1b:eda2  2e c1 2a	  rol $2ac1
$1b:eda5  22 d0 29 15   jsl $1529d0
$1b:eda9  78			sei
$1b:edaa  64 68		 stz $68
$1b:edac  c0 0b 80	  cpy #$800b
$1b:edaf  32 23		 and ($23)
$1b:edb1  4c 28 15	  jmp $1528
$1b:edb4  63 71		 adc $71,s
$1b:edb6  2e 44 aa	  rol $aa44
$1b:edb9  6e 30 a4	  ror $a430
$1b:edbc  44 61 c7	  mvp $c7,$61
$1b:edbf  f1 31		 sbc ($31),y
$1b:edc1  4c 66 1e	  jmp $1e66
$1b:edc4  8f 39 2c 82   sta $822c39
$1b:edc8  43 20		 eor $20,s
$1b:edca  91 c9		 sta ($c9),y
$1b:edcc  0f 42 9d 19   ora $199d42
$1b:edd0  e2 d8		 sep #$d8
$1b:edd2  24 22		 bit $22
$1b:edd4  44 5b 84	  mvp $84,$5b
$1b:edd7  ed 5a 31	  sbc $315a
$1b:edda  77 a8		 adc [$a8],y
$1b:eddc  ff 40 4b 15   sbc $154b40,x
$1b:ede0  4e 8d 02	  lsr $028d
$1b:ede3  2e 36 00	  rol $0036
$1b:ede6  23 45		 and $45,s
$1b:ede8  55 a1		 eor $a1,x
$1b:edea  00 77		 brk #$77
$1b:edec  94 75		 sty $75,x
$1b:edee  c8			iny
$1b:edef  91 67		 sta ($67),y
$1b:edf1  78			sei
$1b:edf2  51 5d		 eor ($5d),y
$1b:edf4  f0 eb		 beq $ede1
$1b:edf6  0a			asl a
$1b:edf7  33 bc		 and ($bc,s),y
$1b:edf9  29 ae f3	  and #$f3ae
$1b:edfc  70 80		 bvs $ed7e
$1b:edfe  18			clc
$1b:edff  e9 cf c6	  sbc #$c6cf
$1b:ee02  a2 92		 ldx #$92
$1b:ee04  00 82		 brk #$82
$1b:ee06  54 68 24	  mvn $24,$68
$1b:ee09  14 1c		 trb $1c
$1b:ee0b  94 d2		 sty $d2,x
$1b:ee0d  c0 14		 cpy #$14
$1b:ee0f  46 25		 lsr $25
$1b:ee11  49 a7 d1	  eor #$d1a7
$1b:ee14  e2 21		 sep #$21
$1b:ee16  f4 44 02	  pea $0244
$1b:ee19  14 63		 trb $63
$1b:ee1b  54 1a 7c	  mvn $7c,$1a
$1b:ee1e  06 48		 asl $48
$1b:ee20  2f 65 88 c4   and $c48865
$1b:ee24  a7 8d		 lda [$8d]
$1b:ee26  31 77		 and ($77),y
$1b:ee28  94 28		 sty $28,x
$1b:ee2a  f2 04		 sbc ($04)
$1b:ee2c  63 26		 adc $26,s
$1b:ee2e  03 a0		 ora $a0,s
$1b:ee30  1e 07 24	  asl $2407,x
$1b:ee33  8c 15 8c	  sty $8c15
$1b:ee36  98			tya
$1b:ee37  0c 50 78	  tsb $7850
$1b:ee3a  22 e0 a2 12   jsl $12a2e0
$1b:ee3e  56 29		 lsr $29,x
$1b:ee40  3c 19 6a	  bit $6a19,x
$1b:ee43  2c 53 08	  bit $0853
$1b:ee46  3b			tsc
$1b:ee47  a0 8f		 ldy #$8f
$1b:ee49  8a			txa
$1b:ee4a  24 15		 bit $15
$1b:ee4c  3b			tsc
$1b:ee4d  17 8c		 ora [$8c],y
$1b:ee4f  68			pla
$1b:ee50  14 07		 trb $07
$1b:ee52  a1 2a		 lda ($2a,x)
$1b:ee54  0c 80 94	  tsb $9480
$1b:ee57  81 31		 sta ($31,x)
$1b:ee59  36 0d		 rol $0d,x
$1b:ee5b  7e a3 62	  ror $62a3,x
$1b:ee5e  74 19		 stz $19,x
$1b:ee60  dc 0c c5	  jml [$c50c]
$1b:ee63  18			clc
$1b:ee64  a5 c6		 lda $c6
$1b:ee66  0e e3 1a	  asl $1ae3
$1b:ee69  88			dey
$1b:ee6a  52 e2		 eor ($e2)
$1b:ee6c  07 80		 ora [$80]
$1b:ee6e  2b			pld
$1b:ee6f  11 1c		 ora ($1c),y
$1b:ee71  48			pha
$1b:ee72  e3 12		 sbc $12,s
$1b:ee74  3b			tsc
$1b:ee75  8b			phb
$1b:ee76  bd 4f 01	  lda $014f,x
$1b:ee79  4a			lsr a
$1b:ee7a  7c 90 18	  jmp ($1890,x)
$1b:ee7d  80 2a		 bra $eea9
$1b:ee7f  f6 00		 inc $00,x
$1b:ee81  56 3e		 lsr $3e,x
$1b:ee83  0c 3b 20	  tsb $203b
$1b:ee86  85 90		 sta $90
$1b:ee88  21 4c		 and ($4c,x)
$1b:ee8a  6a			ror a
$1b:ee8b  92 54		 sta ($54)
$1b:ee8d  c0 48		 cpy #$48
$1b:ee8f  52 88		 eor ($88)
$1b:ee91  5c 12 e2 1a   jml $1ae212
$1b:ee95  f1 6e		 sbc ($6e),y
$1b:ee97  c7 3d		 cmp [$3d]
$1b:ee99  5b			tcd
$1b:ee9a  b2 dc		 lda ($dc)
$1b:ee9c  cf 98 7c 5d   cmp $5d7c98
$1b:eea0  64 7a		 stz $7a
$1b:eea2  3f ad 8a 1a   and $1a8aad,x
$1b:eea6  d1 ae		 cmp ($ae),y
$1b:eea8  51 68		 eor ($68),y
$1b:eeaa  e4 9a		 cpx $9a
$1b:eeac  4e ed 08	  lsr $08ed
$1b:eeaf  ba			tsx
$1b:eeb0  c4 a2		 cpy $a2
$1b:eeb2  ce 72 25	  dec $2572
$1b:eeb5  83 18		 sta $18,s
$1b:eeb7  03 e1		 ora $e1,s
$1b:eeb9  40			rti
$1b:eeba  8b			phb
$1b:eebb  c4 cf		 cpy $cf
$1b:eebd  61 12		 adc ($12,x)
$1b:eebf  79 13 ec	  adc $ec13,y
$1b:eec2  18			clc
$1b:eec3  c0 24		 cpy #$24
$1b:eec5  0a			asl a
$1b:eec6  44 46 36	  mvp $36,$46
$1b:eec9  db			stp
$1b:eeca  08			php
$1b:eecb  93 a8		 sta ($a8,s),y
$1b:eecd  59 20 dc	  eor $dc20,y
$1b:eed0  03 59		 ora $59,s
$1b:eed2  c5 a2		 cmp $a2
$1b:eed4  30 e8		 bmi $eebe
$1b:eed6  d5 00		 cmp $00,x
$1b:eed8  62 2e b1	  per $a009
$1b:eedb  5a			phy
$1b:eedc  94 5a		 sty $5a,x
$1b:eede  83 19		 sta $19,s
$1b:eee0  87 bb		 sta [$bb]
$1b:eee2  c4 5e		 cpy $5e
$1b:eee4  51 16		 eor ($16),y
$1b:eee6  29 44		 and #$44
$1b:eee8  a9 2f		 lda #$2f
$1b:eeea  d6 8c		 dec $8c,x
$1b:eeec  46 5a		 lsr $5a
$1b:eeee  a5 1a		 lda $1a
$1b:eef0  06 4b		 asl $4b
$1b:eef2  94 83		 sty $83,x
$1b:eef4  65 25		 adc $25
$1b:eef6  92 08		 sta ($08)
$1b:eef8  71 62		 adc ($62),y
$1b:eefa  12 41		 ora ($41)
$1b:eefc  95 42		 sta $42,x
$1b:eefe  d6 23		 dec $23,x
$1b:ef00  21 91		 and ($91,x)
$1b:ef02  14 40		 trb $40
$1b:ef04  4c 93 c9	  jmp $c993
$1b:ef07  24 35		 bit $35
$1b:ef09  5e 92 39	  lsr $3992,x
$1b:ef0c  23 94		 and $94,s
$1b:ef0e  a4 b0		 ldy $b0
$1b:ef10  1a			inc a
$1b:ef11  3c 31 26	  bit $2631,x
$1b:ef14  d2 09		 cmp ($09)
$1b:ef16  54 aa 42	  mvn $42,$aa
$1b:ef19  b1 0a		 lda ($0a),y
$1b:ef1b  39 b8 3f	  and $3fb8,y
$1b:ef1e  aa			tax
$1b:ef1f  4a			lsr a
$1b:ef20  3e 82 55	  rol $5582,x
$1b:ef23  92 28		 sta ($28)
$1b:ef25  8d 15 14	  sta $1415
$1b:ef28  aa			tax
$1b:ef29  c5 3c		 cmp $3c
$1b:ef2b  8b			phb
$1b:ef2c  37 56		 and [$56],y
$1b:ef2e  94 4e		 sty $4e,x
$1b:ef30  28			plp
$1b:ef31  d1 03		 cmp ($03),y
$1b:ef33  89 4a		 bit #$4a
$1b:ef35  f8			sed
$1b:ef36  bc 69 64	  ldy $6469,x
$1b:ef39  5a			phy
$1b:ef3a  1d 14 8b	  ora $8b14,x
$1b:ef3d  3c 81 c2	  bit $c281,x
$1b:ef40  11 76		 ora ($76),y
$1b:ef42  88			dey
$1b:ef43  45 a6		 eor $a6
$1b:ef45  73 69		 adc ($69,s),y
$1b:ef47  b4 d2		 ldy $d2,x
$1b:ef49  25 0f		 and $0f
$1b:ef4b  80 3b		 bra $ef88
$1b:ef4d  c6 8b		 dec $8b
$1b:ef4f  18			clc
$1b:ef50  a4 08		 ldy $08
$1b:ef52  44 44 14	  mvp $14,$44
$1b:ef55  a7 c0		 lda [$c0]
$1b:ef57  bb			tyx
$1b:ef58  c6 14		 dec $14
$1b:ef5a  14 0a		 trb $0a
$1b:ef5c  00 c4		 brk #$c4
$1b:ef5e  46 41		 lsr $41
$1b:ef60  4b			phk
$1b:ef61  7b			tdc
$1b:ef62  8b			phb
$1b:ef63  bc 65 05	  ldy $0565,x
$1b:ef66  10 7a		 bpl $efe2
$1b:ef68  8d 29 ee	  sta $ee29
$1b:ef6b  4f d3 8e 9d   eor $9d8ed3
$1b:ef6f  04 88		 tsb $88
$1b:ef71  14 b0		 trb $b0
$1b:ef73  d1 83		 cmp ($83),y
$1b:ef75  8a			txa
$1b:ef76  2e ab 17	  rol $17ab
$1b:ef79  b1 86		 lda ($86),y
$1b:ef7b  d6 8a		 dec $8a,x
$1b:ef7d  22 08 08 4c   jsl $4c0808
$1b:ef81  06 ea		 asl $ea
$1b:ef83  ef 1a 69 0c   sbc $0c691a
$1b:ef87  60			rts
$1b:ef88  32 19		 and ($19)
$1b:ef8a  01 5d		 ora ($5d,x)
$1b:ef8c  1d e1 02	  ora $02e1,x
$1b:ef8f  98			tya
$1b:ef90  24 61		 bit $61
$1b:ef92  92 02		 sta ($02)
$1b:ef94  01 62		 ora ($62,x)
$1b:ef96  05 72		 ora $72
$1b:ef98  c5 63		 cmp $63
$1b:ef9a  b1 28		 lda ($28),y
$1b:ef9c  54 40 4b	  mvn $4b,$40
$1b:ef9f  c0 b0		 cpy #$b0
$1b:efa1  d9 2c 26	  cmp $262c,y
$1b:efa4  88			dey
$1b:efa5  41 17		 eor ($17,x)
$1b:efa7  de c2 c4	  dec $c4c2,x
$1b:efaa  51 80		 eor ($80),y
$1b:efac  b4 42		 ldy $42,x
$1b:efae  8f 60 52 83   sta $835260
$1b:efb2  05 5e		 ora $5e
$1b:efb4  22 e3 36 9a   jsl $9a36e3
$1b:efb8  1b			tcs
$1b:efb9  4a			lsr a
$1b:efba  9a			txs
$1b:efbb  f9 08 8b	  sbc $8b08,y
$1b:efbe  85 56		 sta $56
$1b:efc0  a2 f1		 ldx #$f1
$1b:efc2  28			plp
$1b:efc3  83 d8		 sta $d8,s
$1b:efc5  d8			cld
$1b:efc6  87 1b		 sta [$1b]
$1b:efc8  5f a0 1c 86   eor $861ca0,x
$1b:efcc  c9 1a		 cmp #$1a
$1b:efce  04 80		 tsb $80
$1b:efd0  60			rts
$1b:efd1  22 51 89 34   jsl $348951
$1b:efd5  9d ae 14	  sta $14ae,x
$1b:efd8  00 b0		 brk #$b0
$1b:efda  36 42		 rol $42,x
$1b:efdc  24 d7		 bit $d7
$1b:efde  01 40		 ora ($40,x)
$1b:efe0  46 a2		 lsr $a2
$1b:efe2  0f 60 78 05   ora $057860
$1b:efe6  21 c8		 and ($c8,x)
$1b:efe8  0d 40 77	  ora $7740
$1b:efeb  8b			phb
$1b:efec  c0 1e		 cpy #$1e
$1b:efee  91 18		 sta ($18),y
$1b:eff0  7f 8b 5c 00   adc $005c8b,x
$1b:eff4  9d 25 90	  sta $9025,x
$1b:eff7  4a			lsr a
$1b:eff8  a5 52		 lda $52
$1b:effa  19 14 90	  ora $9014,y
$1b:effd  36 52		 rol $52,x
$1b:efff  52 b9		 eor ($b9)
$1b:f001  18			clc
$1b:f002  d6 48		 dec $48,x
$1b:f004  0c 13 1a	  tsb $1a13
$1b:f007  a6 12		 ldx $12
$1b:f009  46 4b		 lsr $4b
$1b:f00b  04 42		 tsb $42
$1b:f00d  a2 16		 ldx #$16
$1b:f00f  2a			rol a
$1b:f010  4e 34 c2	  lsr $c234
$1b:f013  26 0a		 rol $0a
$1b:f015  2b			pld
$1b:f016  3a			dec a
$1b:f017  22 2f f5 30   jsl $30f52f
$1b:f01b  91 59		 sta ($59),y
$1b:f01d  c1 7e		 cmp ($7e,x)
$1b:f01f  8a			txa
$1b:f020  c1 15		 cmp ($15,x)
$1b:f022  9c 9e 0e	  stz $0e9e
$1b:f025  7a			ply
$1b:f026  65 74		 adc $74
$1b:f028  75 9a		 adc $9a,x
$1b:f02a  c6 73		 dec $73
$1b:f02c  14 89		 trb $89
$1b:f02e  af d1 00 71   lda $7100d1
$1b:f032  48			pha
$1b:f033  b4 e2		 ldy $e2,x
$1b:f035  39 1b 67	  and $671b,y
$1b:f038  a4 5d		 ldy $5d
$1b:f03a  80 31		 bra $f06d
$1b:f03c  68			pla
$1b:f03d  e4 4a		 cpx $4a
$1b:f03f  72 30		 adc ($30)
$1b:f041  21 81		 and ($81,x)
$1b:f043  3f 41 9e 01   and $019e41,x
$1b:f047  40			rti
$1b:f048  8d 33 80	  sta $8033
$1b:f04b  3e 6e 71	  rol $716e,x
$1b:f04e  89 4b		 bit #$4b
$1b:f050  66 d3		 ror $d3
$1b:f052  69 bc		 adc #$bc
$1b:f054  6a			ror a
$1b:f055  1c 23 08	  trb $0823
$1b:f058  c5 28		 cmp $28
$1b:f05a  50 03		 bvc $f05f
$1b:f05c  b0 11		 bcs $f06f
$1b:f05e  84 d5		 sty $d5
$1b:f060  f4 12 f8	  pea $f812
$1b:f063  94 3e		 sty $3e,x
$1b:f065  20 f0 0a	  jsr $0af0
$1b:f068  5b			tcd
$1b:f069  cc 45 00	  cpy $0045
$1b:f06c  f8			sed
$1b:f06d  87 88		 sta [$88]
$1b:f06f  81 6d		 sta ($6d,x)
$1b:f071  e4 41		 cpx $41
$1b:f073  66 85		 ror $85
$1b:f075  87 f2		 sta [$f2]
$1b:f077  ab			plb
$1b:f078  0d 88 49	  ora $4988
$1b:f07b  64 32		 stz $32
$1b:f07d  09 0c		 ora #$0c
$1b:f07f  8a			txa
$1b:f080  48			pha
$1b:f081  03 09		 ora $09,s
$1b:f083  2c c7 89	  bit $89c7
$1b:f086  c4 99		 cpy $99
$1b:f088  51 e1		 eor ($e1),y
$1b:f08a  93 a8		 sta ($a8,s),y
$1b:f08c  ea			nop
$1b:f08d  90 ca		 bcc $f059
$1b:f08f  20 80 3a	  jsr $3a80
$1b:f092  3c 36 71	  bit $7136,x
$1b:f095  1d 57 d4	  ora $d457,x
$1b:f098  5a			phy
$1b:f099  1d 39 8b	  ora $8b39,x
$1b:f09c  a5 59		 lda $59
$1b:f09e  74 54		 stz $54,x
$1b:f0a0  18			clc
$1b:f0a1  7c e2 22	  jmp ($22e2,x)
$1b:f0a4  70 1f		 bvs $f0c5
$1b:f0a6  e9 d9		 sbc #$d9
$1b:f0a8  a9 27		 lda #$27
$1b:f0aa  e0 9f		 cpx #$9f
$1b:f0ac  2c e6 82	  bit $82e6
$1b:f0af  8d 13 80	  sta $8013
$1b:f0b2  21 cd		 and ($cd,x)
$1b:f0b4  b2 0d		 lda ($0d)
$1b:f0b6  91 a4		 sta ($a4),y
$1b:f0b8  a7 45		 lda [$45]
$1b:f0ba  00 71		 brk #$71
$1b:f0bc  46 d8		 lsr $d8
$1b:f0be  3a			dec a
$1b:f0bf  09 58		 ora #$58
$1b:f0c1  54 08 ba	  mvn $ba,$08
$1b:f0c4  e0 18		 cpx #$18
$1b:f0c6  c0 eb		 cpy #$eb
$1b:f0c8  07 88		 ora [$88]
$1b:f0ca  c6 97		 dec $97
$1b:f0cc  85 48		 sta $48
$1b:f0ce  7a			ply
$1b:f0cf  93 fc		 sta ($fc,s),y
$1b:f0d1  06 24		 asl $24
$1b:f0d3  cb			wai
$1b:f0d4  2f ec 01 e1   and $e101ec
$1b:f0d8  e0 1f		 cpx #$1f
$1b:f0da  09 78		 ora #$78
$1b:f0dc  8f c6 9e 45   sta $459ec6
$1b:f0e0  f2 b7		 sbc ($b7)
$1b:f0e2  99 fc f1	  sta $f1fc,y
$1b:f0e5  e8			inx
$1b:f0e6  9f 4d 7a af   sta $af7a4d,x
$1b:f0ea  d7 9e		 cmp [$9e],y
$1b:f0ec  cd f6 f7	  cmp $f7f6
$1b:f0ef  b8			clv
$1b:f0f0  ca			dex
$1b:f0f1  57 c5		 eor [$c5],y
$1b:f0f3  e3 4b		 sbc $4b,s
$1b:f0f5  20 1a c8	  jsr $c81a
$1b:f0f8  f4 7f 5b	  pea $5b7f
$1b:f0fb  01 80		 ora ($80,x)
$1b:f0fd  b8			clv
$1b:f0fe  ce 67 36	  dec $3667
$1b:f101  9b			txy
$1b:f102  4d 20 11	  eor $1120
$1b:f105  c9 34		 cmp #$34
$1b:f107  9e 36 fd	  stz $fd36,x
$1b:f10a  59 68 14	  eor $1468,y
$1b:f10d  25 f0		 and $f0
$1b:f10f  08			php
$1b:f110  c0 28		 cpy #$28
$1b:f112  22 12 9a 3b   jsl $3b9a12
$1b:f116  8c e6 a0	  sty $a0e6
$1b:f119  50 9b		 bvc $f0b6
$1b:f11b  c0 22		 cpy #$22
$1b:f11d  00 a0		 brk #$a0
$1b:f11f  8c 40 6b	  sty $6b40
$1b:f122  60			rts
$1b:f123  fc a3 d4	  jsr ($d4a3,x)
$1b:f126  03 fb		 ora $fb,s
$1b:f128  59 07 e3	  eor $e307,y
$1b:f12b  f5 44		 sbc $44,x
$1b:f12d  8e e3 50	  stx $50e3
$1b:f130  a1 c8		 lda ($c8,x)
$1b:f132  25 52		 and $52
$1b:f134  a9 1b		 lda #$1b
$1b:f136  8d 44 86	  sta $8644
$1b:f139  e3 90		 sbc $90,s
$1b:f13b  a1 b8		 lda ($b8,x)
$1b:f13d  e5 09		 sbc $09
$1b:f13f  e9 5f		 sbc #$5f
$1b:f141  53 7a		 eor ($7a,s),y
$1b:f143  de e6 3c	  dec $3ce6,x
$1b:f146  4e 24 ca	  lsr $ca24
$1b:f149  00 e8		 brk #$e8
$1b:f14b  48			pha
$1b:f14c  0d 4a a5	  ora $a54a
$1b:f14f  21 91		 and ($91,x)
$1b:f151  40			rti
$1b:f152  24 91		 bit $91
$1b:f154  88			dey
$1b:f155  84 95		 sty $95
$1b:f157  c8			iny
$1b:f158  2e 81 ad	  rol $ad81
$1b:f15b  d4 2a		 pei ($2a)
$1b:f15d  15 42		 ora $42,x
$1b:f15f  f0 40		 beq $f1a1
$1b:f161  64 32		 stz $32
$1b:f163  07 80		 ora [$80]
$1b:f165  17 4c		 ora [$4c],y
$1b:f167  00 15		 brk #$15
$1b:f169  0a			asl a
$1b:f16a  d0 0c		 bne $f178
$1b:f16c  6a			ror a
$1b:f16d  4f f1 09 0b   eor $0b09f1
$1b:f171  a0 2a		 ldy #$2a
$1b:f173  3f b0 00 c0   and $c000b0,x
$1b:f177  07 a0		 ora [$a0]
$1b:f179  1f 40 69 88   ora $886940,x
$1b:f17d  84 9a		 sty $9a
$1b:f17f  00 f1		 brk #$f1
$1b:f181  ac 02 d2	  ldy $d202
$1b:f184  b1 53		 lda ($53),y
$1b:f186  94 bb		 sty $bb,x
$1b:f188  82 03 53	  brl $448e
$1b:f18b  23 84		 and $84,s
$1b:f18d  06 2a		 asl $2a
$1b:f18f  e8			inx
$1b:f190  12 40		 ora ($40)
$1b:f192  82 84 14	  brl $0619
$1b:f195  11 48		 ora ($48),y
$1b:f197  99 5c 22	  sta $225c,y
$1b:f19a  ce 85 31	  dec $3185
$1b:f19d  79 cf d0	  adc $d0cf,y
$1b:f1a0  9e 95 f5	  stz $f595,x
$1b:f1a3  37 ad		 and [$ad],y
$1b:f1a5  fd 91 ed	  sbc $ed91,x
$1b:f1a8  9f 75 10 00   sta $001075,x
$1b:f1ac  08			php
$1b:f1ad  81 40		 sta ($40,x)
$1b:f1af  1d e9 10	  ora $10e9,x
$1b:f1b2  81 c4		 sta ($c4,x)
$1b:f1b4  20 91 08	  jsr $0891
$1b:f1b7  9c 42 28	  stz $2842
$1b:f1ba  f7 58		 sbc [$58],y
$1b:f1bc  b4 62		 ldy $62,x
$1b:f1be  0f 18 84 46   ora $468418
$1b:f1c2  22 f1 88 c4   jsl $c488f1
$1b:f1c6  6a			ror a
$1b:f1c7  15 1a		 ora $1a,x
$1b:f1c9  85 c6		 sta $c6
$1b:f1cb  82 61 1b	  brl $0d2f
$1b:f1ce  8d 56 02	  sta $0256
$1b:f1d1  2a			rol a
$1b:f1d2  10 0a		 bpl $f1de
$1b:f1d4  c8			iny
$1b:f1d5  4d 44 46	  eor $4644
$1b:f1d8  f7 38		 sbc [$38],y
$1b:f1da  a8			tay
$1b:f1db  14 1e		 trb $1e
$1b:f1dd  e3 06		 sbc $06,s
$1b:f1df  01 90		 ora ($90,x)
$1b:f1e1  dc c6 82	  jml [$82c6]
$1b:f1e4  07 18		 ora [$18]
$1b:f1e6  48			pha
$1b:f1e7  2c 63 31	  bit $3163
$1b:f1ea  aa			tax
$1b:f1eb  54 6a 97	  mvn $97,$6a
$1b:f1ee  1a			inc a
$1b:f1ef  ad 46 ab	  lda $ab46
$1b:f1f2  71 aa		 adc ($aa),y
$1b:f1f4  41 45		 eor ($45,x)
$1b:f1f6  4a			lsr a
$1b:f1f7  01 49		 ora ($49,x)
$1b:f1f9  29 a9		 and #$a9
$1b:f1fb  88			dey
$1b:f1fc  c5 eb		 cmp $eb
$1b:f1fe  14 03		 trb $03
$1b:f200  8c a0 16	  sty $16a0
$1b:f203  33 89		 and ($89,s),y
$1b:f205  87 c4		 sta [$c4]
$1b:f207  fe 11 8f	  inc $8f11,x
$1b:f20a  82 0c 41	  brl $3319
$1b:f20d  01 29		 ora ($29,x)
$1b:f20f  05 8c		 ora $8c
$1b:f211  e6 35		 inc $35
$1b:f213  2a			rol a
$1b:f214  8d 4a e3	  sta $e34a
$1b:f217  53 a8		 eor ($a8,s),y
$1b:f219  d4 ee		 pei ($ee)
$1b:f21b  35 7a		 and $7a,x
$1b:f21d  8d 5e e3	  sta $e35e
$1b:f220  58			cli
$1b:f221  a8			tay
$1b:f222  d6 2e		 dec $2e,x
$1b:f224  a5 b1		 lda $b1
$1b:f226  89 6c		 bit #$6c
$1b:f228  ea			nop
$1b:f229  5c 1a 97 02   jml $02971a
$1b:f22d  31 5e		 and ($5e),y
$1b:f22f  ac 57 a3	  ldy $a357
$1b:f232  16 ea		 asl $ea,x
$1b:f234  c5 ba		 cmp $ba
$1b:f236  31 68		 and ($68),y
$1b:f238  04 8d		 tsb $8d
$1b:f23a  e0 1a		 cpx #$1a
$1b:f23c  00 71		 brk #$71
$1b:f23e  b4 82		 ldy $82,x
$1b:f240  c9 5e		 cmp #$5e
$1b:f242  6b			rtl
$1b:f243  c4 5d		 cpy $5d
$1b:f245  02 d0		 cop #$d0
$1b:f247  2f 35 8c 4d   and $4d8c35
$1b:f24b  63 10		 adc $10,s
$1b:f24d  cf 08 c6 21   cmp $21c608
$1b:f251  aa			tax
$1b:f252  39 86 88	  and $8886,y
$1b:f255  36 42		 rol $42,x
$1b:f257  a5 d1		 lda $d1
$1b:f259  a9 74		 lda #$74
$1b:f25b  2a			rol a
$1b:f25c  5e 18 97	  lsr $9718,x
$1b:f25f  0e b1 5f	  asl $5fb1
$1b:f262  8c 57 eb	  sty $eb57
$1b:f265  16 f8		 asl $f8,x
$1b:f267  c3 b0		 cmp $b0,s
$1b:f269  17 09		 ora [$09],y
$1b:f26b  79 23 8a	  adc $8a23,y
$1b:f26e  c9 98		 cmp #$98
$1b:f270  44 f6 46	  mvp $46,$f6
$1b:f273  20 5a ef	  jsr $ef5a
$1b:f276  59 bb d6	  eor $d6bb,y
$1b:f279  6a			ror a
$1b:f27a  f5 ab		 sbc $ab,x
$1b:f27c  bd 6a a7	  lda $a76a,x
$1b:f27f  59 a9 d6	  eor $d6a9,y
$1b:f282  6e 74 16	  ror $1674
$1b:f285  0d 5c 6a	  ora $6a5c
$1b:f288  f9 9a 8f	  sbc $8f9a,y
$1b:f28b  c6 a1		 dec $a1
$1b:f28d  d1 a8		 cmp ($a8),y
$1b:f28f  7d 6a 3f	  adc $3f6a,x
$1b:f292  5a			phy
$1b:f293  be 56 84	  ldx $8456,y
$1b:f296  c1 0e		 cmp ($0e,x)
$1b:f298  88			dey
$1b:f299  44 a2 12	  mvp $12,$a2
$1b:f29c  28			plp
$1b:f29d  84 0a		 sty $0a
$1b:f29f  21 01		 and ($01,x)
$1b:f2a1  17 88		 ora [$88],y
$1b:f2a3  d0 06		 bne $f2ab
$1b:f2a5  40			rti
$1b:f2a6  36 41		 rol $41,x
$1b:f2a8  a0 bd		 ldy #$bd
$1b:f2aa  ce d4 c5	  dec $c5d4
$1b:f2ad  0b			phd
$1b:f2ae  d6 ee		 dec $ee,x
$1b:f2b0  f5 ba		 sbc $ba,x
$1b:f2b2  bd 72 ef	  lda $ef72,x
$1b:f2b5  5c a9 d6 ea   jml $ead6a9
$1b:f2b9  75 bb		 adc $bb,x
$1b:f2bb  9d 15 83	  sta $8315,x
$1b:f2be  97 1a		 sta [$1a],y
$1b:f2c0  8f 46 84 41   sta $418446
$1b:f2c4  2e 8d 4b	  rol $4b8d
$1b:f2c7  fb			xce
$1b:f2c8  42 80		 wdm #$80
$1b:f2ca  8f 56 a5 f5   sta $f5a556
$1b:f2ce  a9 70		 lda #$70
$1b:f2d0  bc c6 40	  ldy $40c6,x
$1b:f2d3  30 03		 bmi $f2d8
$1b:f2d5  b8			clv
$1b:f2d6  44 62 12	  mvp $12,$62
$1b:f2d9  08			php
$1b:f2da  84 84		 sty $84
$1b:f2dc  f6 67		 inc $67,x
$1b:f2de  82 3d 01	  brl $f41e
$1b:f2e1  dc 0f c8	  jml [$c80f]
$1b:f2e4  7c 04 41	  jmp ($4104,x)
$1b:f2e7  5f a2 19 e8   eor $e819a2,x
$1b:f2eb  86 3a		 stx $3a
$1b:f2ed  21 ae		 and ($ae,x)
$1b:f2ef  8d 4f a3	  sta $a34f
$1b:f2f2  53 f8		 eor ($f8,s),y
$1b:f2f4  d5 3a		 cmp $3a,x
$1b:f2f6  35 4f		 and $4f,x
$1b:f2f8  ad 4f eb	  lda $eb4f
$1b:f2fb  53 ea		 eor ($ea,s),y
$1b:f2fd  d2 98		 cmp ($98)
$1b:f2ff  29 d1		 and #$d1
$1b:f301  2a			rol a
$1b:f302  84 4a		 sty $4a
$1b:f304  a3 12		 lda $12,s
$1b:f306  b0 44		 bcs $f34c
$1b:f308  ac 31 2a	  ldy $2a31
$1b:f30b  94 4a		 sty $4a,x
$1b:f30d  a7 12		 lda [$12]
$1b:f30f  b1 44		 lda ($44),y
$1b:f311  ac 71 2a	  ldy $2a71
$1b:f314  a4 4a		 ldy $4a
$1b:f316  ab			plb
$1b:f317  12 b2		 ora ($b2)
$1b:f319  44 ac ab	  mvp $ab,$ac
$1b:f31c  d1 5e		 cmp ($5e),y
$1b:f31e  02 f0		 cop #$f0
$1b:f320  4e eb e5	  lsr $e5eb
$1b:f323  6a			ror a
$1b:f324  89 e9		 bit #$e9
$1b:f326  22 51 08 24   jsl $240851
$1b:f32a  42 26		 wdm #$26
$1b:f32c  2f 18 19 c4   and $c41918
$1b:f330  e2 91		 sep #$91
$1b:f332  2b			pld
$1b:f333  84 4a		 sty $4a
$1b:f335  e3 12		 sbc $12,s
$1b:f337  c0 44		 cpy #$44
$1b:f339  b0 31		 bcs $f36c
$1b:f33b  2b			pld
$1b:f33c  94 4a		 sty $4a,x
$1b:f33e  e7 12		 sbc [$12]
$1b:f340  c1 44		 cmp ($44,x)
$1b:f342  b0 71		 bcs $f3b5
$1b:f344  2b			pld
$1b:f345  a4 4a		 ldy $4a
$1b:f347  eb			xba
$1b:f348  12 c2		 ora ($c2)
$1b:f34a  44 b0 af	  mvp $af,$b0
$1b:f34d  51 79		 eor ($79),y
$1b:f34f  03 c8		 ora $c8,s
$1b:f351  1e c3 92	  asl $92c3,x
$1b:f354  02 06		 cop #$06
$1b:f356  0b			phd
$1b:f357  24 00		 bit $00
$1b:f359  07 90		 ora [$90]
$1b:f35b  3e 81 ec	  rol $ec81,x
$1b:f35e  18			clc
$1b:f35f  37 38		 and [$38],y
$1b:f361  b8			clv
$1b:f362  99 c4 0e	  sta $0ec4,y
$1b:f365  c2 c8		 rep #$c8
$1b:f367  44 b2 31	  mvp $31,$b2
$1b:f36a  2d 04 4b	  and $4b04
$1b:f36d  43 12		 eor $12,s
$1b:f36f  c9 44		 cmp #$44
$1b:f371  b2 71		 lda ($71)
$1b:f373  2d 14 4b	  and $4b14
$1b:f376  47 12		 eor [$12]
$1b:f378  ca			dex
$1b:f379  44 b2 b1	  mvp $b1,$b2
$1b:f37c  2d 24 4b	  and $4b24
$1b:f37f  4a			lsr a
$1b:f380  ff 10 20 01   sbc $012010,x
$1b:f384  00 00		 brk #$00
$1b:f386  19 20 88	  ora $8820,y
$1b:f389  e8			inx
$1b:f38a  82 a6 3a	  brl $2e33
$1b:f38d  07 b0		 ora [$b0]
$1b:f38f  0f 80 70 57   ora $577080
$1b:f393  68			pla
$1b:f394  95 de		 sta $de,x
$1b:f396  24 f8		 bit $f8
$1b:f398  2b			pld
$1b:f399  34 4a		 bit $4a,x
$1b:f39b  cf 0e de 43   cmp $43de0e
$1b:f39f  b7 b0		 lda [$b0],y
$1b:f3a1  ee 64 3b	  inc $3b64
$1b:f3a4  9b			txy
$1b:f3a5  0e df 43	  asl $43df
$1b:f3a8  b7 f0		 lda [$f0],y
$1b:f3aa  ee 74 3b	  inc $3b74
$1b:f3ad  9f 0e ed 43   sta $43ed0e,x
$1b:f3b1  bb			tyx
$1b:f3b2  70 ef		 bvs $f3a3
$1b:f3b4  54 3b d7	  mvn $d7,$3b
$1b:f3b7  14 ce		 trb $ce
$1b:f3b9  45 33		 eor $33
$1b:f3bb  b1 4d		 lda ($4d),y
$1b:f3bd  64 53		 stz $53
$1b:f3bf  5a			phy
$1b:f3c0  87 1c		 sta [$1c]
$1b:f3c2  62 2c 32	  per $25f1
$1b:f3c5  89 20		 bit #$20
$1b:f3c7  93 45		 sta ($45,s),y
$1b:f3c9  24 f1		 bit $f1
$1b:f3cb  49 b4		 eor #$b4
$1b:f3cd  51 1c		 eor ($1c),y
$1b:f3cf  09 82		 ora #$82
$1b:f3d1  46 12		 lsr $12
$1b:f3d3  81 26		 sta ($26,x)
$1b:f3d5  f0 ee		 beq $f3c5
$1b:f3d7  e4 3b		 cpx $3b
$1b:f3d9  bb			tyx
$1b:f3da  0e f6 43	  asl $43f6
$1b:f3dd  bd b0 ee	  lda $eeb0,x
$1b:f3e0  f4 3b bf	  pea $bf3b
$1b:f3e3  0e f7 43	  asl $43f7
$1b:f3e6  bd f1 44	  lda $44f1,x
$1b:f3e9  41 a5		 eor ($a5,x)
$1b:f3eb  42 21		 wdm #$21
$1b:f3ed  f4 88 7d	  pea $7d88
$1b:f3f0  58			cli
$1b:f3f1  e5 14		 sbc $14
$1b:f3f3  fe e5 31	  inc $31e5,x
$1b:f3f6  f1 4b		 sbc ($4b),y
$1b:f3f8  fc 51 a4	  jsr ($a451,x)
$1b:f3fb  09 80		 ora #$80
$1b:f3fd  45 02		 eor $02
$1b:f3ff  71 93		 adc ($93),y
$1b:f401  81 37		 sta ($37,x)
$1b:f403  5f 8a a8 e2   eor $e2a88a,x
$1b:f407  db			stp
$1b:f408  28			plp
$1b:f409  b6 c6		 ldx $c6,y
$1b:f40b  2d c0 8b	  and $8bc0
$1b:f40e  70 6a		 bvs $f47a
$1b:f410  cf 20 d9 d5   cmp $d5d920
$1b:f414  9e c0 f4	  stz $f4c0,x
$1b:f417  0d a4 5b	  ora $5ba4
$1b:f41a  6b			rtl
$1b:f41b  16 e2		 asl $e2,x
$1b:f41d  45 b8		 eor $b8
$1b:f41f  b1 4e		 lda ($4e),y
$1b:f421  a0 84		 ldy #$84
$1b:f423  a2 9e		 ldx #$9e
$1b:f425  51 38		 eor ($38),y
$1b:f427  45 3a		 eor $3a
$1b:f429  b1 4f		 lda ($4f),y
$1b:f42b  20 b4 1a	  jsr $1ab4
$1b:f42e  ea			nop
$1b:f42f  e6 20		 inc $20
$1b:f431  d3 38		 cmp ($38,s),y
$1b:f433  8e 2d d0	  stx $d02d
$1b:f436  8b			phb
$1b:f437  74 62		 stz $62,x
$1b:f439  dc 28 b7	  jml [$b728]
$1b:f43c  86 ad		 stx $ad
$1b:f43e  d1 ab		 cmp ($ab),y
$1b:f440  74 2a		 stz $2a,x
$1b:f442  de 18 b7	  dec $b718,x
$1b:f445  0c 1e 00	  tsb $001e
$1b:f448  98			tya
$1b:f449  05 80		 ora $80
$1b:f44b  54 07 e4	  mvn $e4,$07
$1b:f44e  13 30		 ora ($30,s),y
$1b:f450  41 93		 eor ($93,x)
$1b:f452  4e 44 4b	  lsr $4b44
$1b:f455  38			sec
$1b:f456  91 65		 sta ($65),y
$1b:f458  22 d8 68 b6   jsl $b668d8
$1b:f45c  5e 2d b9	  lsr $b92d,x
$1b:f45f  ab			plb
$1b:f460  6a			ror a
$1b:f461  22 d9 63 88   jsl $8863d9
$1b:f465  e9 a2		 sbc #$a2
$1b:f467  da			phx
$1b:f468  73 b8		 adc ($b8,s),y
$1b:f46a  e1 e2		 sbc ($e2,x)
$1b:f46c  c7 60		 cmp [$60]
$1b:f46e  e4 c5		 cpx $c5
$1b:f470  38			sec
$1b:f471  d1 4e		 cmp ($4e),y
$1b:f473  3c 53 6d	  bit $6d53,x
$1b:f476  14 db		 trb $db
$1b:f478  c5 1b		 cmp $1b
$1b:f47a  04 ec		 tsb $ec
$1b:f47c  06 f0		 asl $f0
$1b:f47e  3a			dec a
$1b:f47f  11 2c		 ora ($2c),y
$1b:f481  4d a4 60	  eor $60a4
$1b:f484  18			clc
$1b:f485  b4 32		 ldy $32,x
$1b:f487  db			stp
$1b:f488  9e b7 20	  stz $20b7,x
$1b:f48b  e6 3c		 inc $3c
$1b:f48d  84 59		 sty $59
$1b:f48f  a2 06		 ldx #$06
$1b:f491  2d b8 cb	  and $cbb8
$1b:f494  72 62		 adc ($62)
$1b:f496  cb			wai
$1b:f497  20 e4 f5	  jsr $f5e4
$1b:f49a  aa			tax
$1b:f49b  f5 6d		 sbc $6d,x
$1b:f49d  c1 ec		 cmp ($ec,x)
$1b:f49f  3a			dec a
$1b:f4a0  d5 65		 cmp $65,x
$1b:f4a2  f8			sed
$1b:f4a3  d5 f2		 cmp $f2,x
$1b:f4a5  d5 6a		 cmp $6a,x
$1b:f4a7  b6 9a		 ldx $9a,y
$1b:f4a9  29 47		 and #$47
$1b:f4ab  aa			tax
$1b:f4ac  51 da		 eor ($da),y
$1b:f4ae  e6 18		 inc $18
$1b:f4b0  01 50		 ora ($50,x)
$1b:f4b2  e5 31		 sbc $31
$1b:f4b4  88			dey
$1b:f4b5  f1 73		 sbc ($73),y
$1b:f4b7  06 b1		 asl $b1
$1b:f4b9  ca			dex
$1b:f4ba  0a			asl a
$1b:f4bb  f0 ab		 beq $f468
$1b:f4bd  66 56		 ror $56
$1b:f4bf  63 a9		 adc $a9,s
$1b:f4c1  8b			phb
$1b:f4c2  75 a2		 adc $a2,x
$1b:f4c4  dd 78 b7	  cmp $b778,x
$1b:f4c7  9a			txs
$1b:f4c8  2d e7 8b	  and $8be7
$1b:f4cb  66 58		 ror $58
$1b:f4cd  22 f6 0e 4e   jsl $4e0ef6
$1b:f4d1  5b			tcd
$1b:f4d2  4c d4 0a	  jmp $0ad4
$1b:f4d5  b5 5f		 lda $5f,x
$1b:f4d7  ac ca 0a	  ldy $0aca
$1b:f4da  b7 5b		 lda [$5b],y
$1b:f4dc  4d 96 65	  eor $6596
$1b:f4df  05 5e		 ora $5e
$1b:f4e1  29 46		 and #$46
$1b:f4e3  aa			tax
$1b:f4e4  51 82		 eor ($82),y
$1b:f4e6  e5 18		 sbc $18
$1b:f4e8  f8			sed
$1b:f4e9  07 c2		 ora [$c2]
$1b:f4eb  21 25		 and ($25,x)
$1b:f4ed  11 83		 ora ($83),y
$1b:f4ef  9c dc 83	  stz $83dc
$1b:f4f2  56 ec		 lsr $ec,x
$1b:f4f4  be c2 ad	  ldx $adc2,y
$1b:f4f7  e9 7e		 sbc #$7e
$1b:f4f9  8b			phb
$1b:f4fa  f8			sed
$1b:f4fb  1f 80 fc 27   ora $27fc80,x
$1b:f4ff  f0 0c		 beq $f50d
$1b:f501  06 2c		 asl $2c
$1b:f503  34 16		 bit $16,x
$1b:f505  48			pha
$1b:f506  3c 41 6a	  bit $6a41,x
$1b:f509  0b			phd
$1b:f50a  f0 ab		 beq $f4b7
$1b:f50c  3f 81 64 0f   and $0f6481,x
$1b:f510  20 24 01	  jsr $0124
$1b:f513  30 09		 bmi $f51e
$1b:f515  80 f6		 bra $f50d
$1b:f517  02 60		 cop #$60
$1b:f519  3f 80 bc 31   and $31bc80,x
$1b:f51d  0e 34 43	  asl $4334
$1b:f520  8f 10 db 44   sta $44db10
$1b:f524  36 f1		 rol $f1,x
$1b:f526  2c 34 4b	  bit $4b34
$1b:f529  2f 12 dc d4   and $d4dc12
$1b:f52d  b5 11		 lda $11,x
$1b:f52f  2c b1 c4	  bit $c4b1
$1b:f532  74 d1		 stz $d1,x
$1b:f534  2d 39 dc	  and $dc39
$1b:f537  70 f1		 bvs $f52a
$1b:f539  23 b0		 and $b0,s
$1b:f53b  72 62		 adc ($62)
$1b:f53d  5e 7a 96	  lsr $967a,x
$1b:f540  65 12		 adc $12
$1b:f542  3a			dec a
$1b:f543  98			tya
$1b:f544  92 30		 sta ($30)
$1b:f546  3c f1 24	  bit $24f1,x
$1b:f549  70 cc		 bvs $f517
$1b:f54b  ae 53 2b	  ldx $2b53
$1b:f54e  9c cb 05	  stz $05cb
$1b:f551  32 c1		 and ($c1)
$1b:f553  c4 b6		 cpy $b6
$1b:f555  11 2d		 ora ($2d),y
$1b:f557  8c 4b 81	  sty $814b
$1b:f55a  12 e0		 ora ($e0)
$1b:f55c  d4 b6		 pei ($b6)
$1b:f55e  35 2d		 and $2d,x
$1b:f560  85 49		 sta $49
$1b:f562  4c 1c 0c	  jmp $0c1c
$1b:f565  91 d0		 sta ($d0),y
$1b:f567  37 07		 and [$07],y
$1b:f569  31 e4		 and ($e4),y
$1b:f56b  1a			inc a
$1b:f56c  c8			iny
$1b:f56d  ce 51 2d	  dec $2d51
$1b:f570  c6 49		 dec $49
$1b:f572  0c 1c 84	  tsb $841c
$1b:f575  28			plp
$1b:f576  74 aa		 stz $aa,x
$1b:f578  eb			xba
$1b:f579  11 d3		 ora ($d3),y
$1b:f57b  74 aa		 stz $aa,x
$1b:f57d  cb			wai
$1b:f57e  f1 ab		 sbc ($ab),y
$1b:f580  e4 aa		 cpx $aa
$1b:f582  d5 2d		 cmp $2d,x
$1b:f584  34 cb		 bit $cb,x
$1b:f586  25 32		 and $32
$1b:f588  c9 cc		 cmp #$cc
$1b:f58a  b4 53		 ldy $53,x
$1b:f58c  2d 1c 4b	  and $4b1c
$1b:f58f  a1 12		 lda ($12,x)
$1b:f591  e8			inx
$1b:f592  c4 bc		 cpy $bc
$1b:f594  11 2f		 ora ($2f),y
$1b:f596  0d 4b a3	  ora $a34b
$1b:f599  52 e8		 eor ($e8)
$1b:f59b  54 9c c1	  mvn $c1,$9c
$1b:f59e  e0 57		 cpx #$57
$1b:f5a0  8e 64 e6	  stx $e664
$1b:f5a3  28			plp
$1b:f5a4  e0 eb		 cpx #$eb
$1b:f5a6  44 ba f1	  mvp $f1,$ba
$1b:f5a9  2f 32 1c 11   and $111c32
$1b:f5ad  e0 c1		 cpx #$c1
$1b:f5af  14 70		 trb $70
$1b:f5b1  72 72		 adc ($72)
$1b:f5b3  5a			phy
$1b:f5b4  6a			ror a
$1b:f5b5  95 5a		 sta $5a,x
$1b:f5b7  a5 57		 lda $57
$1b:f5b9  e9 32		 sbc #$32
$1b:f5bb  82 ad d2	  brl $c86b
$1b:f5be  d3 64		 cmp ($64,s),y
$1b:f5c0  99 41 57	  sta $5741,y
$1b:f5c3  89 6d		 bit #$6d
$1b:f5c5  22 5b 58 97   jsl $97585b
$1b:f5c9  12 25		 ora ($25)
$1b:f5cb  c5 88		 cmp $88
$1b:f5cd  75 22		 adc $22,x
$1b:f5cf  10 48		 bpl $f619
$1b:f5d1  84 4e		 sty $4e
$1b:f5d3  21 e5		 and ($e5,x)
$1b:f5d5  88			dey
$1b:f5d6  40			rti
$1b:f5d7  e2 1d		 sep #$1d
$1b:f5d9  58			cli
$1b:f5da  87 92		 sta [$92]
$1b:f5dc  21 14		 and ($14,x)
$1b:f5de  a9 76		 lda #$76
$1b:f5e0  5f 61 52 f4   eor $f45261,x
$1b:f5e4  bf 45 24 0f   lda $0f2445,x
$1b:f5e8  c0 7e		 cpy #$7e
$1b:f5ea  12 48		 ora ($48)
$1b:f5ec  06 03		 asl $03
$1b:f5ee  12 1a		 ora ($1a)
$1b:f5f0  0a			asl a
$1b:f5f1  c4 11		 cpy $11
$1b:f5f3  22 c4 02 50   jsl $5002c4
$1b:f5f7  24 81		 bit $81
$1b:f5f9  88			dey
$1b:f5fa  19 91 38	  ora $3891,y
$1b:f5fd  88			dey
$1b:f5fe  a0 48		 ldy #$48
$1b:f600  11 42		 ora ($42),y
$1b:f602  b9 8b 06	  lda $068b,y
$1b:f605  25 05		 and $05
$1b:f607  89 54		 bit #$54
$1b:f609  62 56 08	  per $fe62
$1b:f60c  95 86		 sta $86,x
$1b:f60e  25 54		 and $54
$1b:f610  a9 1c		 lda #$1c
$1b:f612  02 c9		 cop #$c9
$1b:f614  12 b2		 ora ($b2)
$1b:f616  c4 22		 cpy $22
$1b:f618  51 09		 eor ($09),y
$1b:f61a  12 04		 ora ($04)
$1b:f61c  60			rts
$1b:f61d  27 f3		 and [$f3]
$1b:f61f  81 1f		 sta ($1f,x)
$1b:f621  c5 00		 cmp $00
$1b:f623  08			php
$1b:f624  c0 46		 cpy #$46
$1b:f626  0c 72 61	  tsb $6172
$1b:f629  1c 98 c7	  trb $c798
$1b:f62c  28			plp
$1b:f62d  11 c9		 ora ($c9),y
$1b:f62f  1a			inc a
$1b:f630  5c e4 89 d7   jml $d789e4
$1b:f634  a0 c4		 ldy #$c4
$1b:f636  b2 11		 lda ($11)
$1b:f638  2c 8e 48	  bit $488e
$1b:f63b  f4 1a 18	  pea $181a
$1b:f63e  96 52		 stx $52,y
$1b:f640  25 95		 and $95
$1b:f642  89 69		 bit #$69
$1b:f644  3a			dec a
$1b:f645  50 54		 bvc $f69b
$1b:f647  79 a0 81	  adc $81a0,y
$1b:f64a  00 08		 brk #$08
$1b:f64c  60			rts
$1b:f64d  41 13		 eor ($13,x)
$1b:f64f  19 a0 29	  ora $29a0,y
$1b:f652  71 52		 adc ($52),y
$1b:f654  02 71		 cop #$71
$1b:f656  93 81		 sta ($81,s),y
$1b:f658  41 4e		 eor ($4e,x)
$1b:f65a  8a			txa
$1b:f65b  a9 0f		 lda #$0f
$1b:f65d  41 97		 eor ($97,x)
$1b:f65f  89 6e		 bit #$6e
$1b:f661  6a			ror a
$1b:f662  5a			phy
$1b:f663  88			dey
$1b:f664  96 58		 stx $58,y
$1b:f666  f2 2f		 sbc ($2f)
$1b:f668  60			rts
$1b:f669  e4 c4		 cpx $c4
$1b:f66b  b6 51		 ldx $51,y
$1b:f66d  2d 8c 4b	  and $4b8c
$1b:f670  81 12		 sta ($12,x)
$1b:f672  e0 c4		 cpx #$c4
$1b:f674  27 91		 and [$91]
$1b:f676  09 0c		 ora #$0c
$1b:f678  42 19		 wdm #$19
$1b:f67a  10 86		 bpl $f602
$1b:f67c  a7 45		 lda [$45]
$1b:f67e  48			pha
$1b:f67f  0a			asl a
$1b:f680  44 6d 13	  mvp $13,$6d
$1b:f683  98			tya
$1b:f684  83 4c		 sta $4c,s
$1b:f686  e2 38		 sep #$38
$1b:f688  b4 16		 ldy $16,x
$1b:f68a  2d 97 8b	  and $8b97
$1b:f68d  6e 6a da	  ror $da6a
$1b:f690  88			dey
$1b:f691  b6 5a		 ldx $5a,y
$1b:f693  ac 30 01	  ldy $0130
$1b:f696  b0 3f		 bcs $f6d7
$1b:f698  83 a1		 sta $a1,s
$1b:f69a  12 e8		 ora ($e8)
$1b:f69c  c4 b8		 cpy $b8
$1b:f69e  51 2f		 eor ($2f),y
$1b:f6a0  0c 42 41	  tsb $4142
$1b:f6a3  10 9e		 bpl $f643
$1b:f6a5  82 d5 44	  brl $3b7d
$1b:f6a8  c1 24		 cmp ($24,x)
$1b:f6aa  08			php
$1b:f6ab  20 79 a4	  jsr $a479
$1b:f6ae  71 03		 adc ($03),y
$1b:f6b0  78			sei
$1b:f6b1  44 41 64	  mvp $64,$41
$1b:f6b4  47 10		 eor [$10]
$1b:f6b6  51 9d		 eor ($9d),y
$1b:f6b8  44 18 11	  mvp $11,$18
$1b:f6bb  d8			cld
$1b:f6bc  84 72		 sty $72
$1b:f6be  a0 4a		 ldy #$4a
$1b:f6c0  08			php
$1b:f6c1  85 40		 sta $40
$1b:f6c3  ec 47 02	  cpx $0247
$1b:f6c6  24 01		 bit $01
$1b:f6c8  d9 a2 31	  cmp $31a2,y
$1b:f6cb  6d 84 5b	  adc $5b84
$1b:f6ce  63 16		 adc $16,s
$1b:f6d0  e0 45		 cpx #$45
$1b:f6d2  b8			clv
$1b:f6d3  35 6d		 and $6d,x
$1b:f6d5  8d 5b 61	  sta $615b
$1b:f6d8  56 53		 lsr $53,x
$1b:f6da  00 10		 brk #$10
$1b:f6dc  23 91		 and $91,s
$1b:f6de  28			plp
$1b:f6df  ec 4a 59	  cpx $594a
$1b:f6e2  12 96		 ora ($96)
$1b:f6e4  ac cd 64	  ldy $64cd
$1b:f6e7  11 c3		 ora ($c3),y
$1b:f6e9  78			sei
$1b:f6ea  92 81		 sta ($81)
$1b:f6ec  28			plp
$1b:f6ed  88			dey
$1b:f6ee  81 06		 sta ($06,x)
$1b:f6f0  85 4a		 sta $4a
$1b:f6f2  18			clc
$1b:f6f3  b1 76		 lda ($76),y
$1b:f6f5  81 47		 sta ($47,x)
$1b:f6f7  22 dd 08 b7   jsl $b708dd
$1b:f6fb  46 2d		 lsr $2d
$1b:f6fd  e0 8b		 cpx #$8b
$1b:f6ff  78			sei
$1b:f700  6a			ror a
$1b:f701  dd 1a b7	  cmp $b71a,x
$1b:f704  42 ac		 wdm #$ac
$1b:f706  e6 0f		 inc $0f
$1b:f708  02 ec		 cop #$ec
$1b:f70a  96 aa		 stx $aa,y
$1b:f70c  b4 05		 ldy $05,x
$1b:f70e  81 2c		 sta ($2c,x)
$1b:f710  01 68		 ora ($68,x)
$1b:f712  14 c8		 trb $c8
$1b:f714  95 35		 sta $35,x
$1b:f716  6a			ror a
$1b:f717  60			rts
$1b:f718  60			rts
$1b:f719  a6 42		 ldx $42
$1b:f71b  3a			dec a
$1b:f71c  70 8e		 bvs $f6ac
$1b:f71e  94 23		 sty $23,x
$1b:f720  c7 08		 cmp [$08]
$1b:f722  f1 04		 sbc ($04),y
$1b:f724  44 20 01	  mvp $01,$20
$1b:f727  60			rts
$1b:f728  f1 c5		 sbc ($c5),y
$1b:f72a  2f e1 f3 c7   and $c7f3e1
$1b:f72e  c4 b2		 cpy $b2
$1b:f730  91 2c		 sta ($2c),y
$1b:f732  ac 4b 48	  ldy $484b
$1b:f735  cf 08 85 fe   cmp $fe8508
$1b:f739  21 8f		 and ($8f,x)
$1b:f73b  88			dey
$1b:f73c  6b			rtl
$1b:f73d  e2 19		 sep #$19
$1b:f73f  f8			sed
$1b:f740  a6 da		 ldx $da
$1b:f742  29 d8		 and #$d8
$1b:f744  8a			txa
$1b:f745  71 a2		 adc ($a2),y
$1b:f747  9e 81 b8	  stz $b881,x
$1b:f74a  ed c7 66	  sbc $66c7
$1b:f74d  3c 0e 38	  bit $380e,x
$1b:f750  dc a1 55	  jml [$55a1]
$1b:f753  c8			iny
$1b:f754  95 32		 sta $32,x
$1b:f756  15 5d		 ora $5d,x
$1b:f758  85 5b		 sta $5b
$1b:f75a  61 53		 adc ($53,x)
$1b:f75c  28			plp
$1b:f75d  54 ce 15	  mvn $15,$ce
$1b:f760  42 89		 wdm #$89
$1b:f762  58			cli
$1b:f763  61 54		 adc ($54,x)
$1b:f765  38			sec
$1b:f766  55 12		 eor $12,x
$1b:f768  25 62		 and $62
$1b:f76a  89 58		 bit #$58
$1b:f76c  e1 53		 sbc ($53,x)
$1b:f76e  48			pha
$1b:f76f  54 d6 25	  mvn $25,$d6
$1b:f772  64 85		 stz $85
$1b:f774  51 62		 eor ($62),y
$1b:f776  5a			phy
$1b:f777  f8			sed
$1b:f778  96 7c		 stx $7c,y
$1b:f77a  e2 43		 sep #$43
$1b:f77c  b5 ec		 lda $ec,x
$1b:f77e  74 24		 stz $24,x
$1b:f780  a7 f0		 lda [$f0]
$1b:f782  8c 7c 10	  sty $107c
$1b:f785  60			rts
$1b:f786  3b			tsc
$1b:f787  62 88 df	  per $d712
$1b:f78a  61 56		 adc ($56,x)
$1b:f78c  c8			iny
$1b:f78d  56 36		 lsr $36,x
$1b:f78f  29 fd		 and #$fd
$1b:f791  ca			dex
$1b:f792  63 c3		 adc $c3,s
$1b:f794  e5 08		 sbc $08
$1b:f796  f9 42 3e	  sbc $3e42,y
$1b:f799  6c b1 88	  jmp ($88b1)
$1b:f79c  c4 24		 cpy $24
$1b:f79e  aa			tax
$1b:f79f  71 81		 adc ($81),y
$1b:f7a1  44 20 3d	  mvp $3d,$20
$1b:f7a4  6f 0e 5b c3   adc $c35b0e
$1b:f7a8  16 f3		 asl $f3,x
$1b:f7aa  45 bc		 eor $bc
$1b:f7ac  f1 8f		 sbc ($8f),y
$1b:f7ae  f5 63		 sbc $63,x
$1b:f7b0  fd 98 ff	  sbc $ff98,x
$1b:f7b3  76 3f		 ror $3f,x
$1b:f7b5  d1 6c		 cmp ($6c),y
$1b:f7b7  b4 5b		 ldy $5b,x
$1b:f7b9  2f 16 fb 65   and $65fb16
$1b:f7bd  b1 f0		 lda ($f0),y
$1b:f7bf  6f bd 1b ef   adc $ef1bbd
$1b:f7c3  06 fc		 asl $fc
$1b:f7c5  51 bf		 eor ($bf),y
$1b:f7c7  10 6f		 bpl $f838
$1b:f7c9  cd 1b f3	  cmp $f31b
$1b:f7cc  06 fd		 asl $fd
$1b:f7ce  51 bf		 eor ($bf),y
$1b:f7d0  50 4f		 bvc $f821
$1b:f7d2  fd 13 ff	  sbc $ff13,x
$1b:f7d5  84 ff		 sty $ff
$1b:f7d7  f1 3f		 sbc ($3f),y
$1b:f7d9  f0 4f		 beq $f82a
$1b:f7db  e5 13		 sbc $13
$1b:f7dd  f9 84 fe	  sbc $fe84,y
$1b:f7e0  71 3f		 adc ($3f),y
$1b:f7e2  90 4f		 bcc $f833
$1b:f7e4  dd 13 f7	  cmp $f713,x
$1b:f7e7  84 fd		 sty $fd
$1b:f7e9  f1 3f		 sbc ($3f),y
$1b:f7eb  60			rts
$1b:f7ec  04 05		 tsb $05
$1b:f7ee  00 14		 brk #$14
$1b:f7f0  b3 3b		 lda ($3b,s),y
$1b:f7f2  cb			wai
$1b:f7f3  f5 59		 sbc $59,x
$1b:f7f5  77 9b		 adc [$9b],y
$1b:f7f7  bc af ef	  ldy $efaf,x
$1b:f7fa  f2 fa		 sbc ($fa)
$1b:f7fc  58			cli
$1b:f7fd  5f e6 06 70   eor $7006e6,x
$1b:f801  27 85		 and [$85]
$1b:f803  7c 4c f8	  jmp ($f84c,x)
$1b:f806  7c 69 00	  jmp ($0069,x)
$1b:f809  30 f7		 bmi $f802
$1b:f80b  ac 60 fc	  ldy $fc60
$1b:f80e  c8			iny
$1b:f80f  05 14		 ora $14
$1b:f811  80 14		 bra $f827
$1b:f813  00 9e		 brk #$9e
$1b:f815  24 f5		 bit $f5
$1b:f817  2a			rol a
$1b:f818  99 7f 28	  sta $287f,y
$1b:f81b  72 b3		 adc ($b3)
$1b:f81d  88			dey
$1b:f81e  d1 0e		 cmp ($0e),y
$1b:f820  02 75		 cop #$75
$1b:f822  32 80		 and ($80)
$1b:f824  4e 6a 28	  lsr $286a
$1b:f827  11 9d		 ora ($9d),y
$1b:f829  20 05 0a	  jsr $0a05
$1b:f82c  67 ef		 adc [$ef]
$1b:f82e  47 b7		 eor [$b7]
$1b:f830  f5 11		 sbc $11,x
$1b:f832  ea			nop
$1b:f833  95 a0		 sta $a0,x
$1b:f835  cc d8 23	  cpy $23d8
$1b:f838  42 60		 wdm #$60
$1b:f83a  0b			phd
$1b:f83b  14 ca		 trb $ca
$1b:f83d  01 08		 ora ($08,x)
$1b:f83f  a7 42		 lda [$42]
$1b:f841  1a			inc a
$1b:f842  46 d1		 lsr $d1
$1b:f844  42 80		 wdm #$80
$1b:f846  4a			lsr a
$1b:f847  2b			pld
$1b:f848  11 07		 ora ($07),y
$1b:f84a  11 b8		 ora ($b8),y
$1b:f84c  4e 61 00	  lsr $0061
$1b:f84f  fd 0d 63	  sbc $630d,x
$1b:f852  e8			inx
$1b:f853  50 01		 bvc $f856
$1b:f855  a8			tay
$1b:f856  0d 25 f4	  ora $f425
$1b:f859  24 50		 bit $50
$1b:f85b  fa			plx
$1b:f85c  11 62		 ora ($62),y
$1b:f85e  f4 50 27	  pea $2750
$1b:f861  d0 15		 bne $f878
$1b:f863  b3 e8		 lda ($e8,s),y
$1b:f865  70 33		 bvs $f89a
$1b:f867  e1 17		 sbc ($17,x)
$1b:f869  d2 f4		 cmp ($f4)
$1b:f86b  90 34		 bcc $f8a1
$1b:f86d  a0 5e		 ldy #$5e
$1b:f86f  ef 77 d2 39   sbc $39d277
$1b:f873  ab			plb
$1b:f874  d1 28		 cmp ($28),y
$1b:f876  18			clc
$1b:f877  bc 5e 08	  ldy $085e,x
$1b:f87a  ae 6a f2	  ldx $f26a
$1b:f87d  53 81		 eor ($81,s),y
$1b:f87f  57 12		 eor [$12],y
$1b:f881  45 83		 eor $83
$1b:f883  c1 e1		 cmp ($e1,x)
$1b:f885  4e e6 bf	  lsr $bfe6
$1b:f888  46 61		 lsr $61
$1b:f88a  0d d5 a4	  ora $a4d5
$1b:f88d  8d d1 1b	  sta $1bd1
$1b:f890  ac a1 c4	  ldy $c4a1
$1b:f893  6e d0 1b	  ror $1bd0
$1b:f896  b4 46		 ldy $46,x
$1b:f898  26 b1		 rol $b1
$1b:f89a  29 c2		 and #$c2
$1b:f89c  1d d7 fe	  ora $fed7,x
$1b:f89f  22 11 82 0c   jsl $0c8211
$1b:f8a3  4c 54 65	  jmp $6554
$1b:f8a6  04 28		 tsb $28
$1b:f8a8  98			tya
$1b:f8a9  09 ec		 ora #$ec
$1b:f8ab  2f 14 09 3e   and $3e0914
$1b:f8af  30 04		 bmi $f8b5
$1b:f8b1  78			sei
$1b:f8b2  d1 14		 cmp ($14),y
$1b:f8b4  04 94		 tsb $94
$1b:f8b6  3f e2 ec be   and $beece2,x
$1b:f8ba  de ef 63	  dec $63ef,x
$1b:f8bd  f7 20		 sbc [$20],y
$1b:f8bf  84 16		 sty $16
$1b:f8c1  f6 69		 inc $69,x
$1b:f8c3  43 4a		 eor $4a,s
$1b:f8c5  15 c2		 ora $c2,x
$1b:f8c7  0a			asl a
$1b:f8c8  51 82		 eor ($82),y
$1b:f8ca  c2 e1		 rep #$e1
$1b:f8cc  70 78		 bvs $f946
$1b:f8ce  33 7b		 and ($7b,s),y
$1b:f8d0  9c 42 d7	  stz $d742
$1b:f8d3  83 56		 sta $56,s
$1b:f8d5  86 8f		 stx $8f
$1b:f8d7  36 82		 rol $82,x
$1b:f8d9  6d 23 30	  adc $3023
$1b:f8dc  eb			xba
$1b:f8dd  36 64		 rol $64,x
$1b:f8df  93 7e		 sta ($7e,s),y
$1b:f8e1  99 86 f8	  sta $f886,y
$1b:f8e4  57 a1		 eor [$a1],y
$1b:f8e6  27 3d		 and [$3d]
$1b:f8e8  5b			tcd
$1b:f8e9  f0 09		 beq $f8f4
$1b:f8eb  5d 11 63	  eor $6311,x
$1b:f8ee  95 19		 sta $19,x
$1b:f8f0  d6 33		 dec $33,x
$1b:f8f2  0f 8d 71 83   ora $83718d
$1b:f8f6  88			dey
$1b:f8f7  ef 43 b1 6c   sbc $6cb143
$1b:f8fb  13 46		 ora ($46,s),y
$1b:f8fd  9d 04 e1	  sta $e104,x
$1b:f900  c8			iny
$1b:f901  a0 3c		 ldy #$3c
$1b:f903  c2 6e		 rep #$6e
$1b:f905  1f ea 1c ac   ora $ac1cea,x
$1b:f909  62 f4 45	  per $3f00
$1b:f90c  e8			inx
$1b:f90d  df 67 35 12   cmp $123567,x
$1b:f911  0b			phd
$1b:f912  ce 97 a3	  dec $a397
$1b:f915  82 20 75	  brl $6e38
$1b:f918  06 66		 asl $66
$1b:f91a  61 12		 adc ($12,x)
$1b:f91c  2c 61 61	  bit $6161
$1b:f91f  07 02		 ora [$02]
$1b:f921  20 15 5a	  jsr $5a15
$1b:f924  ed 56 5e	  sbc $5e56
$1b:f927  94 a2		 sty $a2,x
$1b:f929  20 81 12	  jsr $1281
$1b:f92c  00 ce		 brk #$ce
$1b:f92e  ec 76 fb	  cpx $fb76
$1b:f931  1a			inc a
$1b:f932  f4 a2 31	  pea $31a2
$1b:f935  34 88		 bit $88,x
$1b:f937  a1 4d		 lda ($4d,x)
$1b:f939  32 02		 and ($02)
$1b:f93b  57 30		 eor [$30],y
$1b:f93d  0c ee ae	  tsb $aeee
$1b:f940  a9 01 2b	  lda #$2b01
$1b:f943  9c 0c e0	  stz $e00c
$1b:f946  02 57		 cop #$57
$1b:f948  40			rti
$1b:f949  1c 42 60	  trb $6042
$1b:f94c  25 74		 and $74
$1b:f94e  81 c4		 sta ($c4,x)
$1b:f950  e7 01		 sbc [$01]
$1b:f952  ff 46 95 61   sbc $619546,x
$1b:f956  ac 71 37	  ldy $3771
$1b:f959  89 b6 ca	  bit #$cab6
$1b:f95c  c0 25		 cpy #$25
$1b:f95e  40			rti
$1b:f95f  0a			asl a
$1b:f960  8b			phb
$1b:f961  02 b0		 cop #$b0
$1b:f963  0b			phd
$1b:f964  b0 7f		 bcs $f9e5
$1b:f966  88			dey
$1b:f967  3c 03 e2	  bit $e203,x
$1b:f96a  2f 29 f8 d3   and $d3f829
$1b:f96e  cc b5 05	  cpy $05b5
$1b:f971  bd de ef	  lda $efde,x
$1b:f974  a9 21 d6	  lda #$d621
$1b:f977  24 86		 bit $86
$1b:f979  da			phx
$1b:f97a  93 04		 sta ($04,s),y
$1b:f97c  78			sei
$1b:f97d  e2 f1		 sep #$f1
$1b:f97f  78			sei
$1b:f980  25 10		 and $10
$1b:f982  a8			tay
$1b:f983  4b			phk
$1b:f984  fa			plx
$1b:f985  a3 04		 lda $04,s
$1b:f987  fd aa 01	  sbc $01aa,x
$1b:f98a  5c 32 ac 1e   jml $1eac32
$1b:f98e  0f 0a c2 1b   ora $1bc20a
$1b:f992  5b			tcd
$1b:f993  14 f0		 trb $f0
$1b:f995  a6 69		 ldx $69
$1b:f997  35 63		 and $63,x
$1b:f999  52 a7		 eor ($a7)
$1b:f99b  35 17		 and $17,x
$1b:f99d  ab			plb
$1b:f99e  bb			tyx
$1b:f99f  ef fa fd d7   sbc $d7fdfa
$1b:f9a3  e7 3f		 sbc [$3f]
$1b:f9a5  1a			inc a
$1b:f9a6  83 33		 sta $33,s
$1b:f9a8  1a			inc a
$1b:f9a9  bb			tyx
$1b:f9aa  50 e1		 bvc $f98d
$1b:f9ac  04 40		 tsb $40
$1b:f9ae  80 c0		 bra $f970
$1b:f9b0  a0 70		 ldy #$70
$1b:f9b2  42 20		 wdm #$20
$1b:f9b4  c2 1a		 rep #$1a
$1b:f9b6  87 28		 sta [$28]
$1b:f9b8  88			dey
$1b:f9b9  4c 21 30	  jmp $3021
$1b:f9bc  a8			tay
$1b:f9bd  5c 30 a8 05   jml $05a830
$1b:f9c1  c0 6a 1c	  cpy #$1c6a
$1b:f9c4  46 27		 lsr $27
$1b:f9c6  38			sec
$1b:f9c7  2b			pld
$1b:f9c8  91 90		 sta ($90),y
$1b:f9ca  0d 80 d4	  ora $d480
$1b:f9cd  62 b9 35	  per $2f89
$1b:f9d0  28			plp
$1b:f9d1  ee d7 bb	  inc $bbd7
$1b:f9d4  dd f5 1e	  cmp $1ef5,x
$1b:f9d7  57 d8		 eor [$d8],y
$1b:f9d9  29 e1		 and #$e1
$1b:f9db  56 48		 lsr $48,x
$1b:f9dd  b6 14		 ldx $14,y
$1b:f9df  c7 9e		 cmp [$9e]
$1b:f9e1  53 07		 eor ($07,s),y
$1b:f9e3  83 c2		 sta $c2,s
$1b:f9e5  af cb 0b 35   lda $350bcb
$1b:f9e9  3c 6c f4	  bit $f46c,x
$1b:f9ec  f1 ed		 sbc ($ed),y
$1b:f9ee  94 a8		 sty $a8,x
$1b:f9f0  ce a0 11	  dec $11a0
$1b:f9f3  41 78		 eor ($78,x)
$1b:f9f5  bc 99 dc	  ldy $dc99,x
$1b:f9f8  50 0a		 bvc $fa04
$1b:f9fa  1c ae 57	  trb $57ae
$1b:f9fd  44 6d b3	  mvp $b3,$6d
$1b:fa00  fc a7 3f	  jsr ($3fa7,x)
$1b:fa03  d7 78		 cmp [$78],y
$1b:fa05  5f 12 00 17   eor $170012,x
$1b:fa09  37 f9		 and [$f9],y
$1b:fa0b  0d 06 85	  ora $8506
$1b:fa0e  84 60		 sty $60
$1b:fa10  00 9c		 brk #$9c
$1b:fa12  c4 a0		 cpy $a0
$1b:fa14  42 32		 wdm #$32
$1b:fa16  72 34		 adc ($34)
$1b:fa18  84 6a		 sty $6a
$1b:fa1a  45 b1		 eor $b1
$1b:fa1c  98			tya
$1b:fa1d  36 d8		 rol $d8,x
$1b:fa1f  8a			txa
$1b:fa20  46 b1		 lsr $b1
$1b:fa22  9c 36 d8	  stz $d836
$1b:fa25  aa			tax
$1b:fa26  ba			tsx
$1b:fa27  3c d9 9d	  bit $9dd9,x
$1b:fa2a  5b			tcd
$1b:fa2b  6b			rtl
$1b:fa2c  59 b3 1d	  eor $1db3,y
$1b:fa2f  d5 b6		 cmp $b6,x
$1b:fa31  b6 1b		 ldx $1b,y
$1b:fa33  fa			plx
$1b:fa34  1d 4f fe	  ora $fe4f,x
$1b:fa37  90 f5		 bcc $fa2e
$1b:fa39  0f 96 8b 19   ora $198b96
$1b:fa3d  87 c6		 sta [$c6]
$1b:fa3f  b2 01		 lda ($01)
$1b:fa41  8e 43 76	  stx $7643
$1b:fa44  7b			tdc
$1b:fa45  3a			dec a
$1b:fa46  fd 40 62	  sbc $6240,x
$1b:fa49  e8			inx
$1b:fa4a  10 33		 bpl $fa7f
$1b:fa4c  b7 1e		 lda [$1e],y
$1b:fa4e  32 e2		 and ($e2)
$1b:fa50  df ed f6 f9   cmp $f9f6ed,x
$1b:fa54  7b			tdc
$1b:fa55  bd df 67	  lda $67df,x
$1b:fa58  35 10		 and $10,x
$1b:fa5a  b1 4e		 lda ($4e),y
$1b:fa5c  8b			phb
$1b:fa5d  43 21		 eor $21,s
$1b:fa5f  c2 e1		 rep #$e1
$1b:fa61  30 78		 bmi $fadb
$1b:fa63  3c 28 56	  bit $5628,x
$1b:fa66  17 e9		 ora [$e9],y
$1b:fa68  41 99		 eor ($99,x)
$1b:fa6a  8d 8a 84	  sta $848a
$1b:fa6d  de 78 41	  dec $4178,x
$1b:fa70  15 1b		 ora $1b,x
$1b:fa72  cf 28 88 15   cmp $158828
$1b:fa76  8a			txa
$1b:fa77  60			rts
$1b:fa78  40			rti
$1b:fa79  1c d9 7c	  trb $7cd9
$1b:fa7c  b4 91		 ldy $91,x
$1b:fa7e  18			clc
$1b:fa7f  99 98 a7	  sta $a798,y
$1b:fa82  04 01		 tsb $01
$1b:fa84  b3 1b		 lda ($1b,s),y
$1b:fa86  cb			wai
$1b:fa87  f4 dc 85	  pea $85dc
$1b:fa8a  39 fd 0e	  and $0efd,y
$1b:fa8d  be 86 f4	  ldx $f486,y
$1b:fa90  bf aa 17 0f   lda $0f17aa,x
$1b:fa94  8d 60 06	  sta $0660
$1b:fa97  1e f4 b5	  asl $b5f4,x
$1b:fa9a  88			dey
$1b:fa9b  a3 31		 lda $31,s
$1b:fa9d  5a			phy
$1b:fa9e  de b5 7a	  dec $7ab5,x
$1b:faa1  c3 83		 cmp $83,s
$1b:faa3  6c 0e 2f	  jmp ($2f0e)
$1b:faa6  01 f8		 ora ($f8,x)
$1b:faa8  53 de		 eor ($de,s),y
$1b:faaa  be 26 f2	  ldx $f226,y
$1b:faad  3f 96 3c 73   and $733c96,x
$1b:fab1  e6 a8		 inc $a8
$1b:fab3  b4 df		 ldy $df,x
$1b:fab5  2f 97 bb ed   and $edbb97
$1b:fab9  b5 2e		 lda $2e,x
$1b:fabb  36 c3		 rol $c3,x
$1b:fabd  72 5c		 adc ($5c)
$1b:fabf  70 98		 bvs $fa59
$1b:fac1  4c 1e 17	  jmp $171e
$1b:fac4  60			rts
$1b:fac5  a7 1b		 lda [$1b]
$1b:fac7  a1 b9		 lda ($b9,x)
$1b:fac9  0e 26 81	  asl $8126
$1b:facc  14 09		 trb $09
$1b:face  ca			dex
$1b:facf  4f ea b1 6f   eor $6fb1ea
$1b:fad3  e9 bd 56	  sbc #$56bd
$1b:fad6  2d 2a 69	  and $692a
$1b:fad9  69 ed 21	  adc #$21ed
$1b:fadc  30 a8		 bmi $fa86
$1b:fade  5c 30 ef 0f   jml $0fef30
$1b:fae2  5f 03 7c 27   eor $277c03,x
$1b:fae6  fa			plx
$1b:fae7  09 f1 57	  ora #$57f1
$1b:faea  8e fc 99	  stx $99fc
$1b:faed  e5 dd		 sbc $dd
$1b:faef  d1 e6		 cmp ($e6),y
$1b:faf1  f3 65		 sbc ($65,s),y
$1b:faf3  fb			xce
$1b:faf4  ac d9 ac	  ldy $acd9
$1b:faf7  c5 fb		 cmp $fb
$1b:faf9  b0 df		 bcs $fada
$1b:fafb  ef e8 ff 50   sbc $50ffe8
$1b:faff  79 86 71	  adc $7186,y
$1b:fb02  98			tya
$1b:fb03  7c 69 7f	  jmp ($7f69,x)
$1b:fb06  22 85 ef 2e   jsl $2eef85
$1b:fb0a  b4 e6		 ldy $e6,x
$1b:fb0c  a2 f8 29	  ldx #$29f8
$1b:fb0f  d3 bb		 cmp ($bb,s),y
$1b:fb11  df fe e0 5a   cmp $5ae0fe,x
$1b:fb15  0c ce 67	  tsb $67ce
$1b:fb18  fd 14 05	  sbc $0514,x
$1b:fb1b  0a			asl a
$1b:fb1c  f8			sed
$1b:fb1d  5d 6a 1c	  eor $1c6a,x
$1b:fb20  ac 70 54	  ldy $5470
$1b:fb23  4c 20 3f	  jmp $3f20
$1b:fb26  c8			iny
$1b:fb27  18			clc
$1b:fb28  2e 72 3a	  rol $3a72
$1b:fb2b  e1 33		 sbc ($33,x)
$1b:fb2d  66 f4		 ror $f4
$1b:fb2f  d2 09		 cmp ($09)
$1b:fb31  c4 f0		 cpy $f0
$1b:fb33  34 28		 bit $28,x
$1b:fb35  05 98		 ora $98
$1b:fb37  fe 9f a8	  inc $a89f,x
$1b:fb3a  42 1c		 wdm #$1c
$1b:fb3c  29 c8 71	  and #$71c8
$1b:fb3f  80 2b		 bra $fb6c
$1b:fb41  41 1e		 eor ($1e,x)
$1b:fb43  7f 49 44 42   adc $424449,x
$1b:fb47  21 58		 and ($58,x)
$1b:fb49  4c 04 c1	  jmp $c104
$1b:fb4c  1c f1 18	  trb $18f1
$1b:fb4f  9c 4e 52	  stz $524e
$1b:fb52  a8			tay
$1b:fb53  09 c2 39	  ora #$39c2
$1b:fb56  dc 23 31	  jml [$3123]
$1b:fb59  70 96		 bvs $faf1
$1b:fb5b  37 1b		 and [$1b],y
$1b:fb5d  87 5f		 sta [$5f]
$1b:fb5f  83 00		 sta $00,s
$1b:fb61  2f 4e 11 95   and $95114e
$1b:fb65  38			sec
$1b:fb66  52 28		 eor ($28)
$1b:fb68  ce 58 04	  dec $0458
$1b:fb6b  a5 d9		 lda $d9
$1b:fb6d  23 02		 and $02,s
$1b:fb6f  5d 1b bb	  eor $bb1b,x
$1b:fb72  df fe db cb   cmp $cbdbfe,x
$1b:fb76  ed f2 f7	  sbc $f7f2
$1b:fb79  7b			tdc
$1b:fb7a  0f 85 b6 d8   ora $d8b685
$1b:fb7e  4f 6c 2e 13   eor $132e6c
$1b:fb82  07 83		 ora [$83]
$1b:fb84  17 86		 ora [$86],y
$1b:fb86  c2 e8		 rep #$e8
$1b:fb88  db			stp
$1b:fb89  ca			dex
$1b:fb8a  c0 5a 6f	  cpy #$6f5a
$1b:fb8d  a2 51 22	  ldx #$2251
$1b:fb90  c0 bc 30	  cpy #$30bc
$1b:fb93  a3 51		 lda $51,s
$1b:fb95  b0 0e		 bcs $fba5
$1b:fb97  74 8b		 stz $8b,x
$1b:fb99  06 ff		 asl $ff
$1b:fb9b  40			rti
$1b:fb9c  79 90 8c	  adc $8c90,y
$1b:fb9f  be a6 f5	  ldx $f5a6,y
$1b:fba2  bf b5 a1 a4   lda $a4a1b5,x
$1b:fba6  2a			rol a
$1b:fba7  5a			phy
$1b:fba8  b9 bb cd	  lda $cdbb,y
$1b:fbab  40			rti
$1b:fbac  f6 30		 inc $30,x
$1b:fbae  00 4a		 brk #$4a
$1b:fbb0  e5 74		 sbc $74
$1b:fbb2  46 7c		 lsr $7c
$1b:fbb4  55 c2		 eor $c2,x
$1b:fbb6  01 51		 ora ($51,x)
$1b:fbb8  a8			tay
$1b:fbb9  ce 99 f1	  dec $f199
$1b:fbbc  39 09 80	  and $8009,y
$1b:fbbf  4f c4 86 a2   eor $a286c4
$1b:fbc3  51 07		 eor ($07),y
$1b:fbc5  50 66		 bvc $fc2d
$1b:fbc7  65 11		 adc $11
$1b:fbc9  a1 33		 lda ($33,x)
$1b:fbcb  e2 10		 sep #$10
$1b:fbcd  60			rts
$1b:fbce  1a			inc a
$1b:fbcf  74 21		 stz $21,x
$1b:fbd1  9f 12 88 81   sta $818812,x
$1b:fbd5  c4 2c		 cpy $2c
$1b:fbd7  13 04		 ora ($04,s),y
$1b:fbd9  fa			plx
$1b:fbda  4a			lsr a
$1b:fbdb  5d a3 11	  eor $11a3,x
$1b:fbde  cf c4 e2 75   cmp $75e2c4
$1b:fbe2  89 c3 3d	  bit #$3dc3
$1b:fbe5  3f ae d2 c4   and $c4d2ae,x
$1b:fbe9  b4 d5		 ldy $d5,x
$1b:fbeb  a4 32		 ldy $32
$1b:fbed  a7 69		 lda [$69]
$1b:fbef  64 52		 stz $52
$1b:fbf1  50 d5		 bvc $fbc8
$1b:fbf3  3c ca 8b	  bit $8bca,x
$1b:fbf6  74 30		 stz $30,x
$1b:fbf8  0b			phd
$1b:fbf9  56 b2		 lsr $b2,x
$1b:fbfb  f7 7c		 sbc [$7c],y
$1b:fbfd  bd df 58	  lda $58df,x
$1b:fc00  80 c8		 bra $fbca
$1b:fc02  0b			phd
$1b:fc03  62 f8 ee	  per $eafe
$1b:fc06  56 bc		 lsr $bc,x
$1b:fc08  1e 13 07	  asl $0713,x
$1b:fc0b  85 6a		 sta $6a
$1b:fc0d  03 60		 ora $60,s
$1b:fc0f  2e 8c e3	  rol $e38c
$1b:fc12  71 7a		 adc ($7a),y
$1b:fc14  d4 61		 pei ($61)
$1b:fc16  30 a8		 bmi $fbc0
$1b:fc18  5c 31 d7 ef   jml $efd731
$1b:fc1c  cf 73 35 0e   cmp $0e3573
$1b:fc20  57 2b		 eor [$2b],y
$1b:fc22  a2 09		 ldx #$09
$1b:fc24  44 54 2e	  mvp $2e,$54
$1b:fc27  64 9c		 stz $9c
$1b:fc29  d4 6a		 pei ($6a)
$1b:fc2b  33 a1		 and ($a1,s),y
$1b:fc2d  a8			tay
$1b:fc2e  8e 84 5f	  stx $5f84
$1b:fc31  e4 0f		 cpx $0f
$1b:fc33  28			plp
$1b:fc34  c4 cc		 cpy $cc
$1b:fc36  d6 04		 dec $04,x
$1b:fc38  eb			xba
$1b:fc39  ab			plb
$1b:fc3a  1e c0 9d	  asl $9dc0,x
$1b:fc3d  53 bb		 eor ($bb,s),y
$1b:fc3f  1f 9a c6 4e   ora $4ec69a,x
$1b:fc43  11 49		 ora ($49),y
$1b:fc45  16 85		 asl $85,x
$1b:fc47  10 5e		 bpl $fca7
$1b:fc49  e4 69		 cpx $69
$1b:fc4b  16 51		 asl $51,x
$1b:fc4d  0e 55 7b	  asl $7b55
$1b:fc50  bd 5d 3d	  lda $3d5d,x
$1b:fc53  55 19		 eor $19,x
$1b:fc55  dd dc 9a	  cmp $9adc,x
$1b:fc58  54 13 58	  mvn $58,$13
$1b:fc5b  9a			txs
$1b:fc5c  c6 84		 dec $84
$1b:fc5e  c1 41		 cmp ($41,x)
$1b:fc60  08			php
$1b:fc61  42 1a		 wdm #$1a
$1b:fc63  36 21		 rol $21,x
$1b:fc65  09 44 41	  ora #$4144
$1b:fc68  c5 40		 cmp $40
$1b:fc6a  b9 98 c0	  lda $c098,y
$1b:fc6d  23 2e		 and $2e,s
$1b:fc6f  f9 7c 0d	  sbc $0d7c,y
$1b:fc72  f3 fb		 sbc ($fb,s),y
$1b:fc74  7d be 3b	  adc $3bbe,x
$1b:fc77  e6 55		 inc $55
$1b:fc79  84 90		 sty $90
$1b:fc7b  e1 70		 sbc ($70,x)
$1b:fc7d  94 47		 sty $47,x
$1b:fc7f  7c 4a 4e	  jmp ($4e4a,x)
$1b:fc82  25 3a		 and $3a
$1b:fc84  38			sec
$1b:fc85  8a			txa
$1b:fc86  44 83 e2	  mvp $e2,$83
$1b:fc89  0a			asl a
$1b:fc8a  0b			phd
$1b:fc8b  d8			cld
$1b:fc8c  34 05		 bit $05,x
$1b:fc8e  e4 59		 cpx $59
$1b:fc90  21 78		 and ($78,x)
$1b:fc92  cc 70 98	  cpy $9870
$1b:fc95  30 e8		 bmi $fc7f
$1b:fc97  0f d3 fa 46   ora $46fad3
$1b:fc9b  29 50 ad	  and #$ad50
$1b:fc9e  98			tya
$1b:fc9f  25 42		 and $42
$1b:fca1  40			rti
$1b:fca2  85 e0		 sta $e0
$1b:fca4  76 cd		 ror $cd,x
$1b:fca6  a5 c0		 lda $c0
$1b:fca8  12 d9		 ora ($d9)
$1b:fcaa  c2 53		 rep #$53
$1b:fcac  07 7a		 ora [$7a]
$1b:fcae  8b			phb
$1b:fcaf  ca			dex
$1b:fcb0  23 13		 and $13,s
$1b:fcb2  cf c4 e7 08   cmp $08e7c4
$1b:fcb6  89 03 06	  bit #$0603
$1b:fcb9  25 de		 and $de
$1b:fcbb  e9 f4 c8	  sbc #$c8f4
$1b:fcbe  bb			tyx
$1b:fcbf  dc ce 20	  jml [$20ce]
$1b:fcc2  61 cc		 adc ($cc,x)
$1b:fcc4  bb			tyx
$1b:fcc5  dc ee 20	  jml [$20ee]
$1b:fcc8  61 d0		 adc ($d0,x)
$1b:fcca  bb			tyx
$1b:fccb  dd 0e 8d	  cmp $8d0e,x
$1b:fcce  58			cli
$1b:fccf  03 0d		 ora $0d,s
$1b:fcd1  80 0c		 bra $fcdf
$1b:fcd3  15 80		 ora $80,x
$1b:fcd5  7b			tdc
$1b:fcd6  de c7 81	  dec $81c7,x
$1b:fcd9  ac b6 3d	  ldy $3db6
$1b:fcdc  27 06		 and [$06]
$1b:fcde  4c 0b ad	  jmp $ad0b
$1b:fce1  d1 e9		 cmp ($e9),y
$1b:fce3  2e c7 2d	  rol $2dc7
$1b:fce6  1b			tcs
$1b:fce7  f4 4d a0	  pea $a04d
$1b:fcea  ff 49 48 25   sbc $254849,x
$1b:fcee  4f a0 0f 4f   eor $4f0fa0
$1b:fcf2  e8			inx
$1b:fcf3  5b			tcd
$1b:fcf4  45 16		 eor $16
$1b:fcf6  31 00		 and ($00),y
$1b:fcf8  09 0e e0	  ora #$e00e
$1b:fcfb  82 01 12	  brl $0eff
$1b:fcfe  3d 7a 2f	  and $2f7a,x
$1b:fd01  d3 9e		 cmp ($9e,s),y
$1b:fd03  ad f5 f7	  lda $f7f5
$1b:fd06  b3 fc		 lda ($fc,s),y
$1b:fd08  95 bb		 sta $bb,x
$1b:fd0a  08			php
$1b:fd0b  5c 1a 38 f3   jml $f3381a
$1b:fd0f  9a			txs
$1b:fd10  c5 62		 cmp $62
$1b:fd12  1b			tcs
$1b:fd13  0e 87 80	  asl $8087
$1b:fd16  e6 b1		 inc $b1
$1b:fd18  60			rts
$1b:fd19  8a			txa
$1b:fd1a  c5 a2		 cmp $a2
$1b:fd1c  e1 39		 sbc ($39,x)
$1b:fd1e  b0 56		 bcs $fd76
$1b:fd20  21 71		 and ($71,x)
$1b:fd22  e8			inx
$1b:fd23  f8			sed
$1b:fd24  8e 5f e1	  stx $e15f
$1b:fd27  0b			phd
$1b:fd28  93 49		 sta ($49,s),y
$1b:fd2a  c6 72		 dec $72
$1b:fd2c  2f 18 64 1c   and $1c6418
$1b:fd30  87 20		 sta [$20]
$1b:fd32  f0 70		 beq $fda4
$1b:fd34  60			rts
$1b:fd35  7c 1c 18	  jmp ($181c,x)
$1b:fd38  ff 03 0f 9c   sbc $9c0f03,x
$1b:fd3c  b3 58		 lda ($58,s),y
$1b:fd3e  51 db		 eor ($db),y
$1b:fd40  59 c7 5c	  eor $5cc7,y
$1b:fd43  1b			tcs
$1b:fd44  05 70		 ora $70
$1b:fd46  72 c3		 adc ($c3)
$1b:fd48  5b			tcd
$1b:fd49  dd 6a d6	  cmp $d66a,x
$1b:fd4c  5f 2f 77 d7   eor $d7772f,x
$1b:fd50  88			dey
$1b:fd51  5b			tcd
$1b:fd52  5e 41 00	  lsr $0041,x
$1b:fd55  a1 2e		 lda ($2e,x)
$1b:fd57  c2 11		 rep #$11
$1b:fd59  4e b9 6c	  lsr $6cb9
$1b:fd5c  30 98		 bmi $fcf6
$1b:fd5e  3c 28 04	  bit $0428,x
$1b:fd61  36 00		 rol $00,x
$1b:fd63  20 7e 02	  jsr $027e
$1b:fd66  ec 25 07	  cpx $0725
$1b:fd69  00 38		 brk #$38
$1b:fd6b  21 c0		 and ($c0,x)
$1b:fd6d  a6 0b		 ldx $0b
$1b:fd6f  b0 88		 bcs $fcf9
$1b:fd71  9c 02 52	  stz $5202
$1b:fd74  aa			tax
$1b:fd75  79 c1 70	  adc $70c1,y
$1b:fd78  a0 1f f5	  ldy #$f51f
$1b:fd7b  55 83		 eor $83,x
$1b:fd7d  81 9e		 sta ($9e,x)
$1b:fd7f  74 39		 stz $39,x
$1b:fd81  59 18 15	  eor $1518,y
$1b:fd84  4a			lsr a
$1b:fd85  70 39		 bvs $fdc0
$1b:fd87  cd 44 ac	  cmp $ac44
$1b:fd8a  08			php
$1b:fd8b  a4 27		 ldy $27
$1b:fd8d  f5 f5		 sbc $f5,x
$1b:fd8f  e0 2f 20	  cpx #$202f
$1b:fd92  a0 cc ce	  ldy #$cecc
$1b:fd95  c1 00		 cmp ($00,x)
$1b:fd97  b4 bc		 ldy $bc,x
$1b:fd99  46 f3		 lsr $f3
$1b:fd9b  85 b5		 sta $b5
$1b:fd9d  80 40		 bra $fddf
$1b:fd9f  04 10		 tsb $10
$1b:fda1  84 28		 sty $28
$1b:fda3  c0 2e 20	  cpy #$202e
$1b:fda6  11 c0		 ora ($c0),y
$1b:fda8  ac d2 51	  ldy $51d2
$1b:fdab  10 4b		 bpl $fdf8
$1b:fdad  02 bb		 cop #$bb
$1b:fdaf  d3 5e		 cmp ($5e,s),y
$1b:fdb1  df d1 02 38   cmp $3802d1,x
$1b:fdb5  a2 0b 1c	  ldx #$1c0b
$1b:fdb8  6d 8a af	  adc $af8a
$1b:fdbb  55 aa		 eor $aa,x
$1b:fdbd  7a			ply
$1b:fdbe  0b			phd
$1b:fdbf  eb			xba
$1b:fdc0  d8			cld
$1b:fdc1  15 b2		 ora $b2,x
$1b:fdc3  8a			txa
$1b:fdc4  0c 28 18	  tsb $1828
$1b:fdc7  15 fe		 ora $fe,x
$1b:fdc9  0b			phd
$1b:fdca  f0 c3		 beq $fd8f
$1b:fdcc  d8			cld
$1b:fdcd  1c 9e 46	  trb $469e
$1b:fdd0  f2 bf		 sbc ($bf)
$1b:fdd2  9a			txs
$1b:fdd3  3c f3 e8	  bit $e8f3,x
$1b:fdd6  af 4d fa b3   lda $b3fa4d
$1b:fdda  d7 be		 cmp [$be],y
$1b:fddc  ce f0 b6	  dec $b6f0
$1b:fddf  ca			dex
$1b:fde0  83 13		 sta $13,s
$1b:fde2  08			php
$1b:fde3  84 53		 sty $53
$1b:fde5  a1 12		 lda ($12,x)
$1b:fde7  90 c4		 bcc $fdad
$1b:fde9  c4 22		 cpy $22
$1b:fdeb  15 88		 ora $88,x
$1b:fded  87 f5		 sta [$f5]
$1b:fdef  c5 31		 cmp $31
$1b:fdf1  38			sec
$1b:fdf2  9d 62 26	  sta $2662,x
$1b:fdf5  ef a7 50 58   sbc $5850a7
$1b:fdf9  05 82		 ora $82
$1b:fdfb  e2 aa		 sep #$aa
$1b:fdfd  c0 f0 46	  cpy #$46f0
$1b:fe00  38			sec
$1b:fe01  ea			nop
$1b:fe02  20 7c 0f	  jsr $0f7c
$1b:fe05  d1 df		 cmp ($df),y
$1b:fe07  03 f4		 ora $f4,s
$1b:fe09  ff db 04 b0   sbc $b004db,x
$1b:fe0d  eb			xba
$1b:fe0e  3b			tsc
$1b:fe0f  a1 17		 lda ($17,x)
$1b:fe11  dc 4a ff	  jml [$ff4a]
$1b:fe14  4f fb 89 e6   eor $e689fb
$1b:fe18  2e 0f 57	  rol $570f
$1b:fe1b  63 fe		 adc $fe,s
$1b:fe1d  97 01		 sta [$01],y
$1b:fe1f  7c be ff	  jmp ($ffbe,x)
$1b:fe22  4e 8e b8	  lsr $b88e
$1b:fe25  2c 26 15	  bit $1526
$1b:fe28  06 00		 asl $00
$1b:fe2a  02 02		 cop #$02
$1b:fe2c  00 04		 brk #$04
$1b:fe2e  8d 3b c2	  sta $c23b
$1b:fe31  24 f1		 bit $f1
$1b:fe33  b8			clv
$1b:fe34  1c 5a 80	  trb $805a
$1b:fe37  01 a8		 ora ($a8,x)
$1b:fe39  d4 2e		 pei ($2e)
$1b:fe3b  3d 48 08	  and $0848,x
$1b:fe3e  d4 6a		 pei ($6a)
$1b:fe40  1f 08 84 88   ora $888408,x
$1b:fe44  6a			ror a
$1b:fe45  25 41		 and $41
$1b:fe47  84 d8		 sty $d8
$1b:fe49  aa			tax
$1b:fe4a  35 01		 and $01,x
$1b:fe4c  9b			txy
$1b:fe4d  56 e1		 lsr $e1,x
$1b:fe4f  01 f1		 ora ($f1,x)
$1b:fe51  b0 41		 bcs $fe94
$1b:fe53  6a			ror a
$1b:fe54  f0 62		 beq $feb8
$1b:fe56  22 c1 c5 c5   jsl $c5c5c1
$1b:fe5a  58			cli
$1b:fe5b  86 bb		 stx $bb
$1b:fe5d  c4 a8		 cpy $a8
$1b:fe5f  82 00 1f	  brl $1d62
$1b:fe62  95 79		 sta $79,x
$1b:fe64  fe 26 62	  inc $6226,x
$1b:fe67  82 46 ab	  brl $a9b0
$1b:fe6a  e4 e5		 cpx $e5
$1b:fe6c  08			php
$1b:fe6d  01 d8		 ora ($d8,x)
$1b:fe6f  a1 85		 lda ($85,x)
$1b:fe71  c7 10		 cmp [$10]
$1b:fe73  19 48 4d	  ora $4d48,y
$1b:fe76  ad 0f 11	  lda $110f
$1b:fe79  15 81		 ora $81,x
$1b:fe7b  26 27		 rol $27
$1b:fe7d  e8			inx
$1b:fe7e  80 22		 bra $fea2
$1b:fe80  7d 35 43	  adc $4335,x
$1b:fe83  42 a9		 wdm #$a9
$1b:fe85  2a			rol a
$1b:fe86  e2 27		 sep #$27
$1b:fe88  06 6b		 asl $6b
$1b:fe8a  14 50		 trb $50
$1b:fe8c  b8			clv
$1b:fe8d  e5 46		 sbc $46
$1b:fe8f  36 84		 rol $84,x
$1b:fe91  6a			ror a
$1b:fe92  24 ef		 bit $ef
$1b:fe94  52 d0		 eor ($d0)
$1b:fe96  7b			tdc
$1b:fe97  7d 1e cf	  adc $cf1e,x
$1b:fe9a  47 ba		 eor [$ba]
$1b:fe9c  2d 40 7f	  and $7f40
$1b:fe9f  a9 ac		 lda #$ac
$1b:fea1  3d 1e af	  and $af1e,x
$1b:fea4  58			cli
$1b:fea5  28			plp
$1b:fea6  23 d4		 and $d4,s
$1b:fea8  80 7a		 bra $ff24
$1b:feaa  9e c1 f4	  stz $f4c1,x
$1b:fead  0f d0 f4 21   ora $21f4d0
$1b:feb1  89 0c		 bit #$0c
$1b:feb3  be 8f 6f	  ldx $6f8f,y
$1b:feb6  af d9 ed 10   lda $10edd9
$1b:feba  29 84		 and #$84
$1b:febc  27 31		 and [$31]
$1b:febe  2f 47 d4 54   and $54d447
$1b:fec2  01 e0		 ora ($e0,x)
$1b:fec4  b1 b1		 lda ($b1),y
$1b:fec6  86 b6		 stx $b6
$1b:fec8  88			dey
$1b:fec9  3d 4f db	  and $db4f,x
$1b:fecc  52 f7		 eor ($f7)
$1b:fece  06 88		 asl $88
$1b:fed0  41 5a		 eor ($5a,x)
$1b:fed2  c1 07		 cmp ($07,x)
$1b:fed4  4c 0c 56	  jmp $560c
$1b:fed7  2d c0 fb	  and $fbc0
$1b:feda  70 41		 bvs $ff1d
$1b:fedc  00 99		 brk #$99
$1b:fede  25 21		 and $21
$1b:fee0  56 63		 lsr $63,x
$1b:fee2  b1 ee		 lda ($ee),y
$1b:fee4  47 c3		 eor [$c3]
$1b:fee6  92 18		 sta ($18)
$1b:fee8  05 49		 ora $49
$1b:feea  2d 10 48	  and $4810
$1b:feed  85 f6		 sta $f6
$1b:feef  19 32 a4	  ora $a432,y
$1b:fef2  0b			phd
$1b:fef3  01 16		 ora ($16,x)
$1b:fef5  8b			phb
$1b:fef6  9d 66 c2	  sta $c266,x
$1b:fef9  68			pla
$1b:fefa  08			php
$1b:fefb  f4 7d 0b	  pea $0b7d
$1b:fefe  21 f6		 and ($f6,x)
$1b:ff00  4c 34 01	  jmp $0134
$1b:ff03  61 23		 adc ($23,x)
$1b:ff05  71 20		 adc ($20),y
$1b:ff07  13 45		 ora ($45,s),y
$1b:ff09  6b			rtl
$1b:ff0a  46 f2		 lsr $f2
$1b:ff0c  28			plp
$1b:ff0d  13 85		 ora ($85,s),y
$1b:ff0f  60			rts
$1b:ff10  e3 62		 sbc $62,s
$1b:ff12  89 50		 bit #$50
$1b:ff14  51 e3		 eor ($e3),y
$1b:ff16  55 8b		 eor $8b,x
$1b:ff18  3d 16 2f	  and $2f16,x
$1b:ff1b  08			php
$1b:ff1c  31 8a		 and ($8a),y
$1b:ff1e  80 2b		 bra $ff4b
$1b:ff20  b1 e0		 lda ($e0),y
$1b:ff22  22 c7 e1 2e   jsl $2ee1c7
$1b:ff26  f1 58		 sbc ($58),y
$1b:ff28  53 f8		 eor ($f8,s),y
$1b:ff2a  95 f5		 sta $f5,x
$1b:ff2c  00 07		 brk #$07
$1b:ff2e  bd 89 ae	  lda $ae89,x
$1b:ff31  6f e1 1c 2d   adc $2d1ce1
$1b:ff35  81 c0		 sta ($c0,x)
$1b:ff37  2e a0 07	  rol $07a0
$1b:ff3a  0f cc 92 87   ora $8792cc
$1b:ff3e  05 39		 ora $39
$1b:ff40  87 bc		 sta [$bc]
$1b:ff42  b2 88		 lda ($88)
$1b:ff44  05 8d		 ora $8d
$1b:ff46  44 e0 d1	  mvp $d1,$e0
$1b:ff49  43 51		 eor $51,s
$1b:ff4b  96 18		 stx $18,y
$1b:ff4d  fe 66 52	  inc $5266,x
$1b:ff50  8a			txa
$1b:ff51  c5 a2		 cmp $a2
$1b:ff53  cf d0 84 fa   cmp $fa84d0
$1b:ff57  7d 1e df	  adc $df1e,x
$1b:ff5a  47 b9		 eor [$b9]
$1b:ff5c  de 0b 80	  dec $800b,x
$1b:ff5f  ac c7 63	  ldy $63c7
$1b:ff62  d1 e0		 cmp ($e0),y
$1b:ff64  68			pla
$1b:ff65  42 3d		 wdm #$3d
$1b:ff67  1e 8f 5f	  asl $5f8f,x
$1b:ff6a  b3 d0		 lda ($d0,s),y
$1b:ff6c  5b			tcd
$1b:ff6d  26 22		 rol $22
$1b:ff6f  fa			plx
$1b:ff70  d2 23		 cmp ($23)
$1b:ff72  e8			inx
$1b:ff73  4a			lsr a
$1b:ff74  10 59		 bpl $ffcf
$1b:ff76  53 e0		 eor ($e0,s),y
$1b:ff78  a2 0f 63	  ldx #$630f
$1b:ff7b  fc 1a e2	  jsr ($e21a,x)
$1b:ff7e  c7 44		 cmp [$44]
$1b:ff80  88			dey
$1b:ff81  fa			plx
$1b:ff82  bd 66 f1	  lda $f166,x
$1b:ff85  9c 35 97	  stz $9735
$1b:ff88  d1 ea		 cmp ($ea),y
$1b:ff8a  50 02		 bvc $ff8e
$1b:ff8c  8c 0f e1	  sty $e10f
$1b:ff8f  12 73		 ora ($73)
$1b:ff91  29 a0		 and #$a0
$1b:ff93  9e 2a 5c	  stz $5c2a,x
$1b:ff96  03 c0		 ora $c0,s
$1b:ff98  9e 06 07	  stz $0706,x
$1b:ff9b  16 aa		 asl $aa,x
$1b:ff9d  80 c6		 bra $ff65
$1b:ff9f  08			php
$1b:ffa0  74 1b		 stz $1b,x
$1b:ffa2  04 e6		 tsb $e6
$1b:ffa4  24 68		 bit $68
$1b:ffa6  18			clc
$1b:ffa7  5c 7a ba 13   jml $13ba7a
$1b:ffab  18			clc
$1b:ffac  63 e5		 adc $e5,s
$1b:ffae  ce a2 56	  dec $56a2
$1b:ffb1  30 53		 bmi $0006
$1b:ffb3  57 d4		 eor [$d4],y
$1b:ffb5  c5 60		 cmp $60
$1b:ffb7  af 06 6a 00   lda $006a06
$1b:ffbb  26 f1		 rol $f1
$1b:ffbd  bd 31 ca	  lda $ca31,x
$1b:ffc0  a4 48		 ldy $48
$1b:ffc2  86 a8		 stx $a8
$1b:ffc4  55 ce		 eor $ce,x
$1b:ffc6  63 14		 adc $14,s
$1b:ffc8  7c bb c9	  jmp ($c9bb,x)
$1b:ffcb  c1 67		 cmp ($67,x)
$1b:ffcd  15 8b		 ora $8b,x
$1b:ffcf  24 5a		 bit $5a
$1b:ffd1  2e 7b 2a	  rol $2a7b
$1b:ffd4  cc 76 3c	  cpy $3c76
$1b:ffd7  a1 68		 lda ($68,x)
$1b:ffd9  f8			sed
$1b:ffda  2c 86 64	  bit $6486
$1b:ffdd  af 73 e0 98   lda $98e073
$1b:ffe1  c9 7e		 cmp #$7e
$1b:ffe3  f5 34		 sbc $34,x
$1b:ffe5  68			pla
$1b:ffe6  4e 20 cc	  lsr $cc20
$1b:ffe9  fa			plx
$1b:ffea  3c 04 49	  bit $4904,x
$1b:ffed  bd 6e c0	  lda $c06e,x
$1b:fff0  f4 57 a6	  pea $a657
$1b:fff3  fd 59 eb	  sbc $eb59,x
$1b:fff6  df 67 7b 7f   cmp $7f7b67,x
$1b:fffa  40			rti
$1b:fffb  00 00		 brk #$00
$1b:fffd  00 00		 brk #$00
$1b:ffff  00 04		 brk #$04
