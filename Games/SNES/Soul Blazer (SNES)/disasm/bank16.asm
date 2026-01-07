; Soul Blazer (SNES) - Bank $16
; Disassembled from ROM
; File offset: $0b0000-$0b7fff
; CPU address: $16:$8000-$16:$ffff
;===========================================================

.bank $16
.org $8000

$16:8000  04 10		 tsb $10
$16:8002  00 40		 brk #$40
$16:8004  83 bb		 sta $bb,s
$16:8006  fc 01 e1	  jsr ($e101,x)
$16:8009  1f 11 78 cf   ora $cf7811,x
$16:800d  c8			iny
$16:800e  9e 55 f3	  stz $f355,x
$16:8011  37 9d		 and [$9d],y
$16:8013  fd 11 e9	  sbc $e911,x
$16:8016  9f 55 7a ef   sta $ef7a55,x
$16:801a  d9 9e dd	  cmp $dd9e,y
$16:801d  f7 77		 sbc [$77],y
$16:801f  be 62 91	  ldx $9162,y
$16:8022  41 05		 eor ($05,x)
$16:8024  8b			phb
$16:8025  e6 6a		 inc $6a
$16:8027  5a			phy
$16:8028  cd 46 a7	  cmp $a746
$16:802b  5a			phy
$16:802c  0f ad 56 bb   ora $bb56ad
$16:8030  5d ab 07	  eor $07ab,x
$16:8033  d5 2e		 cmp $2e,x
$16:8035  1b			tcs
$16:8036  0e a4 80	  asl $80a4
$16:8039  a6 a0		 ldx $a0
$16:803b  3b			tsc
$16:803c  98			tya
$16:803d  24 f6		 bit $f6
$16:803f  62 58 0a	  per $8a9a
$16:8042  5c 32 28 3e   jml $3e2832
$16:8046  68			pla
$16:8047  1d 16 72	  ora $7216,x
$16:804a  68			pla
$16:804b  0a			asl a
$16:804c  64 16		 stz $16
$16:804e  43 4a		 eor $4a,s
$16:8050  29 94		 and #$94
$16:8052  2a			rol a
$16:8053  c1 0a		 cmp ($0a,x)
$16:8055  85 c1		 sta $c1
$16:8057  4e ea 63	  lsr $63ea
$16:805a  28			plp
$16:805b  95 86		 sta $86,x
$16:805d  25 13		 and $13
$16:805f  3b			tsc
$16:8060  c4 10		 cpy $10
$16:8062  ec 13 73	  cpx $7313
$16:8065  bb			tyx
$16:8066  1f 4a 06 86   ora $86064a,x
$16:806a  09 c2		 ora #$c2
$16:806c  56 8e		 lsr $8e,x
$16:806e  c5 22		 cmp $22
$16:8070  90 48		 bcc $80ba
$16:8072  26 f2		 rol $f2
$16:8074  09 1a		 ora #$1a
$16:8076  ad 56 c1	  lda $c156
$16:8079  20 92 47	  jsr $4792
$16:807c  23 53		 and $53,s
$16:807e  38			sec
$16:807f  d4 6d		 pei ($6d)
$16:8081  74 0b		 stz $0b,x
$16:8083  50 7c		 bvc $8101
$16:8085  84 66		 sty $66
$16:8087  34 d2		 bit $d2,x
$16:8089  18			clc
$16:808a  eb			xba
$16:808b  e4 63		 cpx $63
$16:808d  31 b8		 and ($b8),y
$16:808f  2c 62 38	  bit $3862
$16:8092  f9 a3 b0	  sbc $b0a3,y
$16:8095  46 21		 lsr $21
$16:8097  2d fa 27	  and $27fa
$16:809a  94 f1		 sty $f1,x
$16:809c  df b5 12 82   cmp $8212b5,x
$16:80a0  c2 8e		 rep #$8e
$16:80a2  62 17 20	  per $a0bc
$16:80a5  7a			ply
$16:80a6  c2 e2		 rep #$e2
$16:80a8  48			pha
$16:80a9  31 13		 and ($13),y
$16:80ab  90 7d		 bcc $812a
$16:80ad  8e e0 94	  stx $94e0
$16:80b0  24 a0		 bit $a0
$16:80b2  50 47		 bvc $80fb
$16:80b4  e4 ff		 cpx $ff
$16:80b6  03 b0		 ora $b0,s
$16:80b8  7e 54 84	  ror $8454,x
$16:80bb  a4 09		 ldy $09
$16:80bd  89 3c a7	  bit #$a73c
$16:80c0  c7 58		 cmp [$58]
$16:80c2  9c 97 ca	  stz $ca97
$16:80c5  8c 85 83	  sty $8385
$16:80c8  77 9f		 adc [$9f],y
$16:80ca  fd 21 ea	  sbc $ea21,x
$16:80cd  1f 66 84 82   ora $828466,x
$16:80d1  6f 20 65 82   adc $826520
$16:80d5  88			dey
$16:80d6  d6 a3		 dec $a3,x
$16:80d8  20 92 47	  jsr $4792
$16:80db  23 53		 and $53,s
$16:80dd  38			sec
$16:80de  d4 6d		 pei ($6d)
$16:80e0  68			pla
$16:80e1  8c 51 68	  sty $6851
$16:80e4  84 74		 sty $74
$16:80e6  20 31 96	  jsr $9631
$16:80e9  88			dey
$16:80ea  31 86		 and ($86),y
$16:80ec  0a			asl a
$16:80ed  f0 c2		 beq $80b1
$16:80ef  30 00		 bmi $80f1
$16:80f1  34 2a		 bit $2a,x
$16:80f3  41 a1		 eor ($a1,x)
$16:80f5  81 38		 sta ($38,x)
$16:80f7  1e 06 2a	  asl $2a06,x
$16:80fa  11 38		 ora ($38),y
$16:80fc  40			rti
$16:80fd  5c 0e 66 39   jml $39660e
$16:8101  24 24		 bit $24
$16:8103  08			php
$16:8104  ea			nop
$16:8105  23 90		 and $90,s
$16:8107  c4 42		 cpy $42
$16:8109  80 01		 bra $810c
$16:810b  55 12		 eor $12,x
$16:810d  8d 04 24	  sta $2404
$16:8110  8a			txa
$16:8111  2a			rol a
$16:8112  8c 42 49	  sty $4942
$16:8115  be 5e f3	  ldx $f35e,y
$16:8118  7f a0 3d 23   adc $233da0,x
$16:811c  ea			nop
$16:811d  36 91		 rol $91,x
$16:811f  09 01 3b	  ora #$3b01
$16:8122  71 88		 adc ($88),y
$16:8124  e4 75		 cpx $75
$16:8126  3b			tsc
$16:8127  12 29		 ora ($29)
$16:8129  04 dd		 tsb $dd
$16:812b  76 49		 ror $49,x
$16:812d  e7 65		 sbc [$65]
$16:812f  04 ce		 tsb $ce
$16:8131  34 cc		 bit $cc,x
$16:8133  10 33		 bpl $8168
$16:8135  41 07		 eor ($07,x)
$16:8137  46 ec		 lsr $ec
$16:8139  88			dey
$16:813a  19 28 df	  ora $df28,y
$16:813d  51 0b		 eor ($0b),y
$16:813f  55 18		 eor $18,x
$16:8141  33 c3		 and ($c3,s),y
$16:8143  be f4 32	  ldx $32f4,y
$16:8146  08			php
$16:8147  89 89 f2	  bit #$f289
$16:814a  80 61		 bra $81ad
$16:814c  28			plp
$16:814d  8c 4e 0b	  sty $0b4e
$16:8150  21 88		 and ($88,x)
$16:8152  82 41 ec	  brl $6d96
$16:8155  22 51 52 40   jsl $405251
$16:8159  18			clc
$16:815a  4b			phk
$16:815b  f6 60		 inc $60,x
$16:815d  12 fc		 ora ($fc)
$16:815f  4d e6 87	  eor $87e6
$16:8162  b3 99		 lda ($99,s),y
$16:8164  4d d4 6b	  eor $6bd4
$16:8167  38			sec
$16:8168  3d 2c e2	  and $e22c,x
$16:816b  40			rti
$16:816c  a2 19		 ldx #$19
$16:816e  19 dd e3	  ora $e3dd,y
$16:8171  31 a5		 and ($a5),y
$16:8173  89 46 ce	  bit #$ce46
$16:8176  e8			inx
$16:8177  a5 01		 lda $01
$16:8179  7b			tdc
$16:817a  9a			txs
$16:817b  09 60 11	  ora #$1160
$16:817e  b5 fd		 lda $fd,x
$16:8180  bc 42 32	  ldy $3242,x
$16:8183  cf d7 5d 89   cmp $895dd7
$16:8187  bd f9 e0	  lda $e0f9,x
$16:818a  df 0f 78 bf   cmp $bf780f,x
$16:818e  a1 44		 lda ($44,x)
$16:8190  f1 81		 sbc ($81),y
$16:8192  0d 26 24	  ora $2426
$16:8195  5f 18 08 d1   eor $d10818,x
$16:8199  a4 12		 ldy $12
$16:819b  48			pha
$16:819c  4a			lsr a
$16:819d  04 47		 tsb $47
$16:819f  ae b0 18	  ldx $18b0
$16:81a2  e9 be 85	  sbc #$85be
$16:81a5  e4 7f		 cpx $7f
$16:81a7  f4 87 8f	  pea $8f87
$16:81aa  32 40		 and ($40)
$16:81ac  bf 03 68 0b   lda $0b6803,x
$16:81b0  e4 f8		 cpx $f8
$16:81b2  07 c1		 ora [$c1]
$16:81b4  75 f3		 adc $f3,x
$16:81b6  8f c6 6f 23   sta $236fc6
$16:81ba  76 64		 ror $64,x
$16:81bc  66 36		 ror $36
$16:81be  2f 28 21 3c   and $3c2128
$16:81c2  8a			txa
$16:81c3  49 0b 00	  eor #$000b
$16:81c6  14 0c		 trb $0c
$16:81c8  be 46 24	  ldx $2446,y
$16:81cb  0f 19 2c 0d   ora $0d2c19
$16:81cf  ef 19 17 e9   sbc $e91719
$16:81d3  99 08 9e	  sta $9e08,y
$16:81d6  55 d9		 eor $d9,x
$16:81d8  19 57 01	  ora $0157,y
$16:81db  a0 bf		 ldy #$bf
$16:81dd  d8			cld
$16:81de  cb			wai
$16:81df  3f d4 be b6   and $b6bed4,x
$16:81e3  f6 3f		 inc $3f,x
$16:81e5  b6 3c		 ldx $3c,y
$16:81e7  00 70		 brk #$70
$16:81e9  59 12 14	  eor $1412,y
$16:81ec  26 e8		 rol $e8
$16:81ee  59 1b 84	  eor $841b,y
$16:81f1  72 35		 adc ($35)
$16:81f3  33 4a		 and ($4a,s),y
$16:81f5  c9 5e 81	  cmp #$815e
$16:81f8  7e 91 34	  ror $3491,x
$16:81fb  c8			iny
$16:81fc  d2 30		 cmp ($30)
$16:81fe  43 51		 eor $51,s
$16:8200  a8			tay
$16:8201  b7 a2		 lda [$a2],y
$16:8203  a5 ac		 lda $ac
$16:8205  d4 6a		 pei ($6a)
$16:8207  75 a3		 adc $a3,x
$16:8209  9a			txs
$16:820a  d5 6b		 cmp $6b,x
$16:820c  b5 da		 lda $da,x
$16:820e  b1 cd		 lda ($cd),y
$16:8210  52 e1		 eor ($e1)
$16:8212  91 4a		 sta ($4a),y
$16:8214  49 66 c3	  eor #$c366
$16:8217  e0 68		 cpx #$68
$16:8219  f3 cf		 sbc ($cf,s),y
$16:821b  b7 a3		 lda [$a3],y
$16:821d  2d 66 7b	  and $7b66
$16:8220  05 9c		 ora $9c
$16:8222  47 80		 eor [$80]
$16:8224  76 5f		 ror $5f,x
$16:8226  7b			tdc
$16:8227  3f da 85 04   and $0485da,x
$16:822b  85 40		 sta $40
$16:822d  9a			txs
$16:822e  99 0b 82	  sta $820b,y
$16:8231  87 f2		 sta [$f2]
$16:8233  17 20		 ora [$20],y
$16:8235  53 00		 eor ($00,s),y
$16:8237  84 a0		 sty $a0
$16:8239  82 88 0c	  brl $8ec4
$16:823c  03 50		 ora $50,s
$16:823e  60			rts
$16:823f  6d 4d 85	  adc $854d
$16:8242  87 fc		 sta [$fc]
$16:8244  61 ee		 adc ($ee,x)
$16:8246  05 2b		 ora $2b
$16:8248  83 9c		 sta $9c,s
$16:824a  a3 2d		 lda $2d,s
$16:824c  45 81		 eor $81
$16:824e  c4 8c		 cpy $8c
$16:8250  e1 01		 sbc ($01,x)
$16:8252  75 f9		 adc $f9,x
$16:8254  b3 cf		 lda ($cf,s),y
$16:8256  be fe e6	  ldx $e6fe,y
$16:8259  a3 05		 lda $05,s
$16:825b  80 2e		 bra $828b
$16:825d  2d 4f 65	  and $654f
$16:8260  fb			xce
$16:8261  51 8a		 eor ($8a),y
$16:8263  c4 59		 cpy $59
$16:8265  37 6f		 and [$6f],y
$16:8267  b9 89 d1	  lda $d189,y
$16:826a  46 71		 lsr $71
$16:826c  33 da		 and ($da,s),y
$16:826e  5c 03 e2 99   jml $99e203
$16:8272  90 ff		 bcc $8273
$16:8274  29 c0 7e	  and #$7ec0
$16:8277  2a			rol a
$16:8278  99 5b 81	  sta $815b,y
$16:827b  3c 57 3e	  bit $3e57,x
$16:827e  64 f3		 stz $f3
$16:8280  af a1 bd 2f   lda $2fbda1
$16:8284  ea			nop
$16:8285  8f 5c fb 2b   sta $2bfb5c
$16:8289  db			stp
$16:828a  7d 04 7f	  adc $7f04,x
$16:828d  83 6f		 sta $6f,s
$16:828f  dc ec 06	  jml [$06ec]
$16:8292  18			clc
$16:8293  13 d1		 ora ($d1,s),y
$16:8295  e0 71		 cpx #$71
$16:8297  20 b1 40	  jsr $40b1
$16:829a  5e 8f 0b	  lsr $0b8f,x
$16:829d  82 89 86	  brl $0929
$16:82a0  30 45		 bmi $82e7
$16:82a2  88			dey
$16:82a3  5c 80 6c 32   jml $326c80
$16:82a7  41 5c		 eor ($5c,x)
$16:82a9  46 63		 lsr $63
$16:82ab  44 62 8e	  mvp $8e,$62
$16:82ae  bd 3c b9	  lda $b93c,x
$16:82b1  e6 df		 inc $df
$16:82b3  3f 7a 3f d4   and $d43f7a,x
$16:82b7  1e b1 f6	  asl $f6b1,x
$16:82ba  17 b3		 ora [$b3],y
$16:82bc  a4 15		 ldy $15
$16:82be  2e 49 0a	  rol $0a49
$16:82c1  80 6e		 bra $8331
$16:82c3  06 26		 asl $26
$16:82c5  2a			rol a
$16:82c6  90 0e		 bcc $82d6
$16:82c8  41 21		 eor ($21,x)
$16:82ca  42 00		 wdm #$00
$16:82cc  70 00		 bvs $82ce
$16:82ce  16 1e		 asl $1e,x
$16:82d0  a0 30		 ldy #$30
$16:82d2  07 b8		 ora [$b8]
$16:82d4  01 62		 ora ($62,x)
$16:82d6  17 05		 ora [$05],y
$16:82d8  82 81 84	  brl $075c
$16:82db  6b			rtl
$16:82dc  f2 41		 sbc ($41)
$16:82de  be 46 63	  ldx $6346,y
$16:82e1  51 d1		 eor ($d1),y
$16:82e3  c5 82		 cmp $82
$16:82e5  e4 e1		 cpx $e1
$16:82e7  e8			inx
$16:82e8  1f 49 7a 8f   ora $8f7a49,x
$16:82ec  d6 9e		 dec $9e,x
$16:82ee  c5 f7		 cmp $f7
$16:82f0  26 8b		 rol $8b
$16:82f2  c8			iny
$16:82f3  64 2d		 stz $2d
$16:82f5  6a			ror a
$16:82f6  68			pla
$16:82f7  d8			cld
$16:82f8  17 e4		 ora [$e4],y
$16:82fa  12 09		 ora ($09)
$16:82fc  1b			tcs
$16:82fd  8a			txa
$16:82fe  8c a1 1a	  sty $1aa1
$16:8301  8d b8 b6	  sta $b6b8
$16:8304  16 e2		 asl $e2,x
$16:8306  08			php
$16:8307  54 09 a9	  mvn $a9,$09
$16:830a  52 18		 eor ($18)
$16:830c  8b			phb
$16:830d  e6 84		 inc $84
$16:830f  85 24		 sta $24
$16:8311  71 d0		 adc ($d0),y
$16:8313  d4 63		 pei ($63)
$16:8315  b1 d7		 lda ($d7),y
$16:8317  27 a3		 and [$a3]
$16:8319  7d 3d ea	  adc $ea3d,x
$16:831c  ff 60 7b 47   sbc $477b60,x
$16:8320  dc 5e 0c	  jml [$0c5e]
$16:8323  68			pla
$16:8324  1c 4a 24	  trb $244a
$16:8327  3b			tsc
$16:8328  c8			iny
$16:8329  2c 15 ff	  bit $ff15
$16:832c  ee ba 3c	  inc $3cba
$16:832f  0b			phd
$16:8330  af c7 fe 50   lda $50fec7
$16:8334  f3 0f		 sbc ($0f,s),y
$16:8336  9c bd 07	  stz $07bd
$16:8339  e9 4f 52	  sbc #$524f
$16:833c  fa			plx
$16:833d  db			stp
$16:833e  d8			cld
$16:833f  fe d8 f1	  inc $f1d8,x
$16:8342  11 c4		 ora ($c4),y
$16:8344  a0 2d		 ldy #$2d
$16:8346  ec 8c 42	  cpx $428c
$16:8349  5b			tcd
$16:834a  d9 24 00	  cmp $0024,y
$16:834d  6c 76 3a	  jmp ($3a76)
$16:8350  de f1 8f	  dec $8ff1,x
$16:8353  c1 21		 cmp ($21,x)
$16:8355  44 40 81	  mvp $81,$40
$16:8358  3d 26 07	  and $0726,x
$16:835b  12 2a		 ora ($2a)
$16:835d  03 c2		 ora $c2,s
$16:835f  a1 70		 lda ($70,x)
$16:8361  58			cli
$16:8362  2b			pld
$16:8363  fe cc 7e	  inc $7ecc,x
$16:8366  74 f4		 stz $f4,x
$16:8368  2e c8 24	  rol $24c8
$16:836b  00 fb		 brk #$fb
$16:836d  8c c6 a3	  sty $a3c6
$16:8370  41 ff		 eor ($ff,x)
$16:8372  63 7b		 adc $7b,s
$16:8374  5f d1 be ea   eor $eabed1,x
$16:8378  f7 df		 sbc [$df],y
$16:837a  a8			tay
$16:837b  3d 62 6b	  and $6b62,x
$16:837e  50 6f		 bvc $83ef
$16:8380  79 13 ca	  adc $ca13,y
$16:8383  be 66 f3	  ldx $f366,y
$16:8386  bf a2 3d 33   lda $333da2,x
$16:838a  ea			nop
$16:838b  af 5d fb 33   lda $33fb5d
$16:838f  db			stp
$16:8390  bf 00 77 f8   lda $f87700,x
$16:8394  03 85		 ora $85,s
$16:8396  65 48		 adc $48
$16:8398  a0 85		 ldy #$85
$16:839a  86 78		 stx $78
$16:839c  eb			xba
$16:839d  46 f0		 lsr $f0
$16:839f  41 21		 eor ($21,x)
$16:83a1  53 d9		 eor ($d9,s),y
$16:83a3  88			dey
$16:83a4  98			tya
$16:83a5  67 d0		 adc [$d0]
$16:83a7  a8			tay
$16:83a8  13 b4		 ora ($b4,s),y
$16:83aa  84 61		 sty $61
$16:83ac  03 89		 ora $89,s
$16:83ae  51 67		 eor ($67),y
$16:83b0  23 61		 and $61,s
$16:83b2  a3 44		 lda $44,s
$16:83b4  a0 22		 ldy #$22
$16:83b6  b0 00		 bcs $83b8
$16:83b8  00 cc		 brk #$cc
$16:83ba  22 70 52 22   jsl $225270
$16:83be  48			pha
$16:83bf  62 23 b0	  per $33e5
$16:83c2  00 04		 brk #$04
$16:83c4  2c 88 a4	  bit $a488
$16:83c7  42 8c		 wdm #$8c
$16:83c9  42 49		 wdm #$49
$16:83cb  fe 60 f3	  inc $f360,x
$16:83ce  8f a0 ba 40   sta $40baa0
$16:83d2  a2 19		 ldx #$19
$16:83d4  1c 16 44	  trb $4416
$16:83d7  a4 22		 ldy $22
$16:83d9  58			cli
$16:83da  00 02		 brk #$02
$16:83dc  33 1a		 and ($1a,s),y
$16:83de  59 0c 6d	  eor $6d0c,y
$16:83e1  18			clc
$16:83e2  11 c5		 ora ($c5),y
$16:83e4  a8			tay
$16:83e5  91 00		 sta ($00),y
$16:83e7  1e 90 74	  asl $7490,x
$16:83ea  88			dey
$16:83eb  23 41		 and $41,s
$16:83ed  8a			txa
$16:83ee  0a			asl a
$16:83ef  21 5f		 and ($5f,x)
$16:83f1  d2 c4		 cmp ($c4)
$16:83f3  97 f4		 sta [$f4],y
$16:83f5  1b			tcs
$16:83f6  47 87		 eor [$87]
$16:83f8  bf ad d9 c0   lda $c0d9ad,x
$16:83fc  ff 10 78 c7   sbc $c77810,x
$16:8400  c8			iny
$16:8401  5e 53 f3	  lsr $f353,x
$16:8404  27 bf		 and [$bf]
$16:8406  a2 14		 ldx #$14
$16:8408  8f 07 f5 c4   sta $c4f507
$16:840c  93 e0		 sta ($e0,s),y
$16:840e  fe b8 2a	  inc $2ab8,x
$16:8411  bc 1f d7	  ldy $d71f,x
$16:8414  20 5f 83	  jsr $835f
$16:8417  fa			plx
$16:8418  e3 4c		 sbc $4c,s
$16:841a  f0 67		 beq $8483
$16:841c  14 75		 trb $75
$16:841e  d6 31		 dec $31,x
$16:8420  98			tya
$16:8421  dc 16 31	  jml [$3116]
$16:8424  1c 3f 91	  trb $913f
$16:8427  fc 5c 67	  jsr ($675c,x)
$16:842a  0b			phd
$16:842b  6e 04 24	  ror $2404
$16:842e  01 af		 ora ($af,x)
$16:8430  df 07 78 7f   cmp $7f7807,x
$16:8434  c6 1e		 dec $1e
$16:8436  41 f2		 eor ($f2,x)
$16:8438  97 98		 sta [$98],y
$16:843a  fc e9 e8	  jsr ($e8e9,x)
$16:843d  5f 4b 7a 9f   eor $9f7a4b,x
$16:8441  d7 1e		 cmp [$1e],y
$16:8443  be 38 d4	  ldx $d438,y
$16:8446  ce 34 d1	  dec $d134
$16:8449  08			php
$16:844a  ec 1d 7c	  cpx $7c1d
$16:844d  f0 76		 beq $84c5
$16:844f  fa			plx
$16:8450  2f bd ed e0   and $e0edbd
$16:8454  7f 0c 78 a7   adc $a7780c,x
$16:8458  c7 5e		 cmp [$5e]
$16:845a  4b			phk
$16:845b  f2 e7		 sbc ($e7)
$16:845d  9b			txy
$16:845e  7c fd e8	  jmp ($e8fd,x)
$16:8461  ff 50 7a c7   sbc $c77a50,x
$16:8465  d8			cld
$16:8466  5e d3 f7	  lsr $f7d3,x
$16:8469  05 41		 ora $41
$16:846b  de 25 0b	  dec $0b25,x
$16:846e  82 c6 21	  brl $a637
$16:8471  2f 13 77 f8   and $f87713
$16:8475  03 c2		 ora $c2,s
$16:8477  3e 22 d8	  rol $d822,x
$16:847a  51 04		 eor ($04),y
$16:847c  84 c5		 sty $c5
$16:847e  02 15		 cop #$15
$16:8480  a1 43		 lda ($43,x)
$16:8482  cc 3e 72	  cpy $723e
$16:8485  f4 1f a5	  pea $a51f
$16:8488  3d 4b eb	  and $eb4b,x
$16:848b  6f 63 fb 63   adc $63fb63
$16:848f  db			stp
$16:8490  c6 2c		 dec $2c
$16:8492  21 09		 and ($09,x)
$16:8494  88			dey
$16:8495  e1 e5		 sbc ($e5,x)
$16:8497  e0 3f		 cpx #$3f
$16:8499  0a			asl a
$16:849a  78			sei
$16:849b  97 a0		 sta [$a0],y
$16:849d  90 a2		 bcc $8441
$16:849f  31 0a		 and ($0a),y
$16:84a1  c9 bc 50	  cmp #$50bc
$16:84a4  28			plp
$16:84a5  3c 0e 24	  bit $240e,x
$16:84a8  56 28		 lsr $28,x
$16:84aa  9c 16 43	  stz $4316
$16:84ad  11 6f		 ora ($6f),y
$16:84af  14 04		 trb $04
$16:84b1  54 26 66	  mvn $66,$26
$16:84b4  6f 10 b8 0c   adc $0cb810
$16:84b8  be 76 2d	  ldx $2d76,y
$16:84bb  f6 ce		 inc $ce,x
$16:84bd  77 bf		 adc [$bf],y
$16:84bf  37 46		 and [$46],y
$16:84c1  be 77 b3	  ldx $b377,y
$16:84c4  d3 69		 cmp ($69,s),y
$16:84c6  b6 5b		 ldx $5b,y
$16:84c8  73 7b		 adc ($7b,s),y
$16:84ca  6b			rtl
$16:84cb  d3 42		 cmp ($42,s),y
$16:84cd  a9 1d a9	  lda #$a91d
$16:84d0  bd b7 ca	  lda $cab7,x
$16:84d3  93 56		 sta ($56,s),y
$16:84d5  fe fd c0	  inc $c0fd,x
$16:84d8  51 d1		 eor ($d1),y
$16:84da  50 e2		 bvc $84be
$16:84dc  72 ab		 adc ($ab)
$16:84de  93 d9		 sta ($d9,s),y
$16:84e0  13 c8		 ora ($c8,s),y
$16:84e2  52 4b		 eor ($4b)
$16:84e4  66 19		 ror $19
$16:84e6  a9 3c 9e	  lda #$9e3c
$16:84e9  c6 ef		 dec $ef
$16:84eb  f1 30		 sbc ($30),y
$16:84ed  91 44		 sta ($44),y
$16:84ef  a0 63		 ldy #$63
$16:84f1  82 1b 11	  brl $960f
$16:84f4  54 4c 06	  mvn $06,$4c
$16:84f7  1b			tcs
$16:84f8  63 a8		 adc $a8,s
$16:84fa  9c 0c 36	  stz $360c
$16:84fd  41 40		 eor ($40,x)
$16:84ff  29 80 ce	  and #$ce80
$16:8502  84 80		 sty $80
$16:8504  63 31		 adc $31,s
$16:8506  b3 c1		 lda ($c1,s),y
$16:8508  63 07		 adc $07,s
$16:850a  33 2b		 and ($2b,s),y
$16:850c  64 8c		 stz $8c
$16:850e  6a			ror a
$16:850f  81 31		 sta ($31,x)
$16:8511  2f 1c 66 37   and $37661c
$16:8515  20 60 18	  jsr $1860
$16:8518  8c 62 65	  sty $6562
$16:851b  f2 41		 sbc ($41)
$16:851d  04 69		 tsb $69
$16:851f  a0 a9		 ldy #$a9
$16:8521  c1 30		 cmp ($30,x)
$16:8523  01 00		 ora ($00,x)
$16:8525  5e a4 e3	  lsr $e3a4,x
$16:8528  32 20		 and ($20)
$16:852a  48			pha
$16:852b  62 25 01	  per $8653
$16:852e  52 ca		 eor ($ca)
$16:8530  78			sei
$16:8531  94 89		 sty $89,x
$16:8533  04 21		 tsb $21
$16:8535  8c 16 77	  sty $7716
$16:8538  b7 60		 lda [$60],y
$16:853a  bc 0d 1c	  ldy $1c0d,x
$16:853d  04 40		 tsb $40
$16:853f  d3 6d		 cmp ($6d,s),y
$16:8541  58			cli
$16:8542  2e cb 22	  rol $22cb
$16:8545  29 3c 7d	  and #$7d3c
$16:8548  fd 4c 16	  sbc $164c,x
$16:854b  03 f8		 ora $f8,s
$16:854d  63 c5		 adc $c5,s
$16:854f  3e 3a f2	  rol $f23a,x
$16:8552  5f 97 11 44   eor $441197,x
$16:8556  05 4a		 ora $4a
$16:8558  58			cli
$16:8559  11 52		 ora ($52),y
$16:855b  9d a0 70	  sta $70a0,x
$16:855e  04 27		 tsb $27
$16:8560  d9 9c 21	  cmp $219c,y
$16:8563  67 72		 adc [$72]
$16:8565  02 a4		 cop #$a4
$16:8567  51 ca		 eor ($ca),y
$16:8569  cb			wai
$16:856a  03 80		 ora $80,s
$16:856c  ae 44 e6	  ldx $e644
$16:856f  0a			asl a
$16:8570  f6 40		 inc $40,x
$16:8572  0b			phd
$16:8573  24 50		 bit $50
$16:8575  60			rts
$16:8576  af 66 b1 b4   lda $b4b166
$16:857a  85 b2		 sta $b2
$16:857c  8d 58 77	  sta $7758
$16:857f  7c 12 14	  jmp ($1412,x)
$16:8582  01 26		 ora ($26,x)
$16:8584  a8			tay
$16:8585  b4 80		 ldy $80,x
$16:8587  02 50		 cop #$50
$16:8589  08			php
$16:858a  1c 48 22	  trb $2248
$16:858d  51 36		 eor ($36),y
$16:858f  80 48		 bra $85d9
$16:8591  62 21 12	  per $97b5
$16:8594  6a			ror a
$16:8595  30 85		 bmi $851c
$16:8597  83 fe		 sta $fe,s
$16:8599  30 a9		 bmi $8544
$16:859b  01 30		 ora ($30,x)
$16:859d  05 f5		 ora $f5
$16:859f  24 8e		 bit $8e
$16:85a1  46 a3		 lsr $a3
$16:85a3  4d 40 26	  eor $2640
$16:85a6  09 30 24	  ora #$2430
$16:85a9  6d 00 91	  adc $9100
$16:85ac  16 c2		 asl $c2,x
$16:85ae  0e 6c 08	  asl $086c
$16:85b1  04 64		 tsb $64
$16:85b3  ba			tsx
$16:85b4  07 11		 ora [$11]
$16:85b6  8d b4 06	  sta $06b4
$16:85b9  39 1d 36	  and $361d,y
$16:85bc  11 ff		 ora ($ff),y
$16:85be  d2 1e		 cmp ($1e)
$16:85c0  6c 00 00	  jmp ($0000)
$16:85c3  01 8e		 ora ($8e,x)
$16:85c5  04 fa		 tsb $fa
$16:85c7  60			rts
$16:85c8  80 05		 bra $85cf
$16:85ca  8e 02 91	  stx $9102
$16:85cd  45 a1		 eor $a1
$16:85cf  ba			tsx
$16:85d0  64 60		 stz $60
$16:85d2  cc a7 32	  cpy $32a7
$16:85d5  19 a0 59	  ora $59a0,y
$16:85d8  6a			ror a
$16:85d9  a1 16		 lda ($16,x)
$16:85db  90 ef		 bcc $85cc
$16:85dd  b4 cf		 ldy $cf,x
$16:85df  93 85		 sta ($85,s),y
$16:85e1  42 92		 wdm #$92
$16:85e3  20 ff 06	  jsr $06ff
$16:85e6  90 e2		 bcc $85ca
$16:85e8  72 af		 adc ($af)
$16:85ea  92 ca		 sta ($ca)
$16:85ec  44 a2 49	  mvp $49,$a2
$16:85ef  10 07		 bpl $85f8
$16:85f1  83 10		 sta $10,s
$16:85f3  b6 39		 ldx $39,y
$16:85f5  f0 48		 beq $863f
$16:85f7  65 31		 adc $31
$16:85f9  a3 d1		 lda $d1,s
$16:85fb  80 0d		 bra $860a
$16:85fd  1b			tcs
$16:85fe  63 3a		 adc $3a,s
$16:8600  da			phx
$16:8601  15 04		 ora $04,x
$16:8603  43 05		 eor $05,s
$16:8605  42 30		 wdm #$30
$16:8607  82 44 0c	  brl $924e
$16:860a  26 43		 rol $43
$16:860c  53 88		 eor ($88,s),y
$16:860e  24 40		 bit $40
$16:8610  e2 65		 sep #$65
$16:8612  35 3e		 and $3e,x
$16:8614  f1 7f		 sbc ($7f),y
$16:8616  8f de 8f f5   sta $f58fde
$16:861a  07 ac		 ora [$ac]
$16:861c  7d 85 ed	  adc $ed85,x
$16:861f  3f 6f 46 9b   and $9b466f,x
$16:8623  6b			rtl
$16:8624  05 8c		 ora $8c
$16:8626  42 4b		 wdm #$4b
$16:8628  e7 07		 sbc [$07]
$16:862a  85 8e		 sta $8e
$16:862c  0b			phd
$16:862d  3c 3c 07	  bit $073c,x
$16:8630  90 42		 bcc $8674
$16:8632  a1 4d		 lda ($4d,x)
$16:8634  e1 85		 sbc ($85,x)
$16:8636  3e 8c 78	  rol $788c,x
$16:8639  32 18		 and ($18)
$16:863b  8c 4a 24	  sty $244a
$16:863e  de 18 94	  dec $9418,x
$16:8641  4c 67 2d	  jmp $2d67
$16:8644  e1 0d		 sbc ($0d,x)
$16:8646  bc 88 89	  ldy $8988,x
$16:8649  23 32		 and $32,s
$16:864b  92 47		 sta ($47)
$16:864d  0a			asl a
$16:864e  b0 44		 bcs $8694
$16:8650  38			sec
$16:8651  e9 bc		 sbc #$bc
$16:8653  0a			asl a
$16:8654  8e de 52	  stx $52de
$16:8657  b7 c1		 lda [$c1],y
$16:8659  e0 80		 cpx #$80
$16:865b  40			rti
$16:865c  3c 91 7d	  bit $7d91,x
$16:865f  e0 61		 cpx #$61
$16:8661  40			rti
$16:8662  44 91 7d	  mvp $7d,$91
$16:8665  a0 80		 ldy #$80
$16:8667  a5 2f		 lda $2f
$16:8669  b4 0c		 ldy $0c,x
$16:866b  34 a5		 bit $a5,x
$16:866d  f6 05		 inc $05,x
$16:866f  32 bf		 and ($bf)
$16:8671  06 40		 asl $40
$16:8673  af c8 c4 71   lda $71c4c8
$16:8677  9f b0 90 70   sta $7090b0,x
$16:867b  bb			tyx
$16:867c  42 00		 wdm #$00
$16:867e  0a			asl a
$16:867f  57 90		 eor [$90],y
$16:8681  bb			tyx
$16:8682  fc 00 83	  jsr ($8300,x)
$16:8685  24 92		 bit $92
$16:8687  3f 5d ba 04   and $04ba5d,x
$16:868b  e4 80		 cpx $80
$16:868d  48			pha
$16:868e  dd 64 c6	  cmp $c664,x
$16:8691  01 90		 ora ($90,x)
$16:8693  95 12		 sta $12,x
$16:8695  36 30		 rol $30,x
$16:8697  d5 b8		 cmp $b8,x
$16:8699  bb			tyx
$16:869a  42 14		 wdm #$14
$16:869c  45 b9		 eor $b9
$16:869e  0c 46 25	  tsb $2546
$16:86a1  13 23		 ora ($23,s),y
$16:86a3  53 a5		 eor ($a5,s),y
$16:86a5  07 0a		 ora [$0a]
$16:86a7  a8			tay
$16:86a8  10 b0		 bpl $865a
$16:86aa  c8			iny
$16:86ab  ca			dex
$16:86ac  43 02		 eor $02,s
$16:86ae  1c 1b fc	  trb $fc1b
$16:86b1  84 e1		 sty $e1
$16:86b3  1b			tcs
$16:86b4  31 0c		 and ($0c),y
$16:86b6  05 10		 ora $10
$16:86b8  61 61		 adc ($61,x)
$16:86ba  0e 01 79	  asl $7901
$16:86bd  60			rts
$16:86be  23 81		 and $81,s
$16:86c0  13 04		 ora ($04,s),y
$16:86c2  76 3a		 ror $3a,x
$16:86c4  6d 51 b1	  adc $b151
$16:86c7  a8			tay
$16:86c8  84 d8		 sty $d8
$16:86ca  c3 63		 cmp $63,s
$16:86cc  8d 1a a0	  sta $a01a
$16:86cf  6c eb 37	  jmp ($37eb)
$16:86d2  85 3b		 sta $3b
$16:86d4  02 00		 cop #$00
$16:86d6  ef 08 c8 a0   sbc $a0c808
$16:86da  07 e2		 ora [$e2]
$16:86dc  91 18		 sta ($18),y
$16:86de  cb			wai
$16:86df  bc 5d e2	  ldy $e25d,x
$16:86e2  6c 51 90	  jmp ($9051)
$16:86e5  bf d0 05 03   lda $0305d0,x
$16:86e9  82 82 3b	  brl $c26e
$16:86ec  04 a8		 tsb $a8
$16:86ee  0e 76 85	  asl $8576
$16:86f1  41 e0		 eor ($e0,x)
$16:86f3  71 21		 adc ($21),y
$16:86f5  88			dey
$16:86f6  9f c4 c2 43   sta $43c2c4,x
$16:86fa  11 37		 ora ($37),y
$16:86fc  31 05		 and ($05),y
$16:86fe  87 fe		 sta [$fe]
$16:8700  50 f3		 bvc $86f5
$16:8702  0f 9c bd 07   ora $07bd9c
$16:8706  e9 4b		 sbc #$4b
$16:8708  91 a4		 sta ($a4),y
$16:870a  b2 33		 lda ($33)
$16:870c  1b			tcs
$16:870d  90 30		 bcc $873f
$16:870f  a8			tay
$16:8710  36 0f		 rol $0f,x
$16:8712  21 69		 and ($69,x)
$16:8714  48			pha
$16:8715  3d 1b f0	  and $f01b,x
$16:8718  0c 17 8f	  tsb $8f17
$16:871b  bf a9 cf 0e   lda $0ecfa9,x
$16:871f  a1 50		 lda ($50,x)
$16:8721  0c 28 3e	  tsb $3e28
$16:8724  70 20		 bvs $8746
$16:8726  b3 c4		 lda ($c4,s),y
$16:8728  85 e7		 sta $e7
$16:872a  01 0b		 ora ($0b,x)
$16:872c  3a			dec a
$16:872d  68			pla
$16:872e  e3 10		 sbc $10,s
$16:8730  90 b0		 bcc $86e2
$16:8732  c1 03		 cmp ($03,x)
$16:8734  e0 3c		 cpx #$3c
$16:8736  b8			clv
$16:8737  18			clc
$16:8738  bc 22 63	  ldy $6322,x
$16:873b  da			phx
$16:873c  50 49		 bvc $8787
$16:873e  93 ce		 sta ($ce,s),y
$16:8740  be 86 f4	  ldx $f486,y
$16:8743  bd 48 a4	  lda $a448,x
$16:8746  89 53		 bit #$53
$16:8748  91 a7		 sta ($a7),y
$16:874a  ca			dex
$16:874b  40			rti
$16:874c  bf 19 24 72   lda $722419,x
$16:8750  3a			dec a
$16:8751  16 18		 asl $18,x
$16:8753  cc 6d 7e	  cpy $7e6d
$16:8756  51 a8		 eor ($a8),y
$16:8758  eb			xba
$16:8759  3c 82 a7	  bit $a782,x
$16:875c  19 8d 36	  ora $368d,y
$16:875f  c4 1f		 cpy $1f
$16:8761  00 2c		 brk #$2c
$16:8763  1e 22 90	  asl $9022,x
$16:8766  1d f9 21	  ora $21f9,x
$16:8769  88			dey
$16:876a  a9 05		 lda #$05
$16:876c  aa			tax
$16:876d  63 c9		 adc $c9,s
$16:876f  09 78		 ora #$78
$16:8771  8f 21 44 10   sta $104421
$16:8775  73 84		 adc ($84,s),y
$16:8777  29 52		 and #$52
$16:8779  c0 d0		 cpy #$d0
$16:877b  89 14		 bit #$14
$16:877d  41 8e		 eor ($8e,x)
$16:877f  11 28		 ora ($28),y
$16:8781  9a			txs
$16:8782  7c b5 fb	  jmp ($fbb5,x)
$16:8785  74 f2		 stz $f2,x
$16:8787  31 c1		 and ($c1),y
$16:8789  3c 9b ed	  bit $ed9b,x
$16:878c  96 10		 stx $10,y
$16:878e  bf 9a 6d 81   lda $816d9a,x
$16:8792  7e b5 fb	  ror $fbb5,x
$16:8795  3d 36 98	  and $9836,x
$16:8798  bf 47 c0 46   lda $46c047,x
$16:879c  84 89		 sty $89
$16:879e  7e 4c 70	  ror $704c,x
$16:87a1  5d 1a 6c	  eor $6c1a,x
$16:87a4  a3 11		 lda $11,s
$16:87a6  c6 d8		 dec $d8
$16:87a8  b1 c1		 lda ($c1),y
$16:87aa  94 2a		 sty $2a,x
$16:87ac  61 4d		 adc ($4d,x)
$16:87ae  8c 90 60	  sty $6090
$16:87b1  8d a1 8d	  sta $8da1
$16:87b4  a6 4e		 ldx $4e
$16:87b6  35 1d		 and $1d,x
$16:87b8  10 a3		 bpl $875d
$16:87ba  04 00		 tsb $00
$16:87bc  e0 8b		 cpx #$8b
$16:87be  27 fb		 and [$fb]
$16:87c0  35 c7		 and $c7,x
$16:87c2  7c 8c 1d	  jmp ($1d8c,x)
$16:87c5  31 04		 and ($04),y
$16:87c7  48			pha
$16:87c8  22 07 32 79   jsl $793207
$16:87cc  bf 10 ae 5a   lda $5aae10,x
$16:87d0  fc 26 ce	  jsr ($ce26,x)
$16:87d3  76 0c		 ror $0c,x
$16:87d5  02 42		 cop #$42
$16:87d7  82 0b 60	  brl $e7e5
$16:87da  9c 14 72	  stz $7214
$16:87dd  1a			inc a
$16:87de  48			pha
$16:87df  34 61		 bit $61,x
$16:87e1  d6 04		 dec $04,x
$16:87e3  88			dey
$16:87e4  a5 03		 lda $03
$16:87e6  ca			dex
$16:87e7  27 64		 and [$64]
$16:87e9  6a			ror a
$16:87ea  0d 61 1a	  ora $1a61
$16:87ed  18			clc
$16:87ee  4d b8 94	  eor $94b8
$16:87f1  4a			lsr a
$16:87f2  b1 a6		 lda ($a6),y
$16:87f4  d8			cld
$16:87f5  6f d1 41 b7   adc $b741d1
$16:87f9  4d 91 d5	  eor $d591
$16:87fc  b6 40		 ldx $40,y
$16:87fe  a0 d9		 ldy #$d9
$16:8800  19 24 da	  ora $da24,y
$16:8803  28			plp
$16:8804  5a			phy
$16:8805  4e fa bb	  lsr $bbfa
$16:8808  d7 fe		 cmp [$fe],y
$16:880a  d0 f6		 bne $8802
$16:880c  f5 c0		 sbc $c0,x
$16:880e  1d fe 00	  ora $00fe,x
$16:8811  e8			inx
$16:8812  38			sec
$16:8813  44 69 14	  mvp $14,$69
$16:8816  10 b0		 bpl $87c8
$16:8818  cf 02 24 0f   cmp $0f2402
$16:881c  28			plp
$16:881d  25 82		 and $82
$16:881f  7b			tdc
$16:8820  31 13		 and ($13),y
$16:8822  0c fa c1	  tsb $c1fa
$16:8825  02 0e		 cop #$0e
$16:8827  94 12		 sty $12,x
$16:8829  15 03		 ora $03,x
$16:882b  b0 d1		 bcs $87fe
$16:882d  67 23		 adc [$23]
$16:882f  61 a3		 adc ($a3,x)
$16:8831  58			cli
$16:8832  60			rts
$16:8833  30 a8		 bmi $87dd
$16:8835  10 00		 bpl $8837
$16:8837  20 71 28	  jsr $2871
$16:883a  9c dc c2	  stz $c2dc
$16:883d  04 52		 tsb $52
$16:883f  9b			txy
$16:8840  c4 62		 cpy $62
$16:8842  50 10		 bvc $8854
$16:8844  00 42		 brk #$42
$16:8846  c8			iny
$16:8847  a1 38		 lda ($38,x)
$16:8849  82 c6 26	  brl $af12
$16:884c  b3 62		 lda ($62,s),y
$16:884e  91 c2		 sta ($c2),y
$16:8850  49 e6		 eor #$e6
$16:8852  62 08 c4	  per $4c5d
$16:8855  3e 3c 62	  rol $623c,x
$16:8858  32 f0		 and ($f0)
$16:885a  cc 88 85	  cpy $8588
$16:885d  18			clc
$16:885e  8f c5 cc 45   sta $45ccc5
$16:8862  37 9a		 and [$9a],y
$16:8864  13 c4		 ora ($c4,s),y
$16:8866  a8			tay
$16:8867  08			php
$16:8868  37 9c		 and [$9c],y
$16:886a  17 99		 ora [$99],y
$16:886c  06 a5		 asl $a5
$16:886e  d3 90		 cmp ($90,s),y
$16:8870  28			plp
$16:8871  86 47		 stx $47
$16:8873  05 91		 ora $91
$16:8875  29 0a		 and #$0a
$16:8877  43 11		 eor $11,s
$16:8879  00 04		 brk #$04
$16:887b  66 34		 ror $34
$16:887d  b2 18		 lda ($18)
$16:887f  d9 94 23	  cmp $2394,y
$16:8882  8b			phb
$16:8883  51 31		 eor ($31),y
$16:8885  00 3d		 brk #$3d
$16:8887  20 e5 10	  jsr $10e5
$16:888a  2e 83 14	  rol $1483
$16:888d  14 42		 trb $42
$16:888f  bf a5 89 2f   lda $2f89a5,x
$16:8893  db			stp
$16:8894  2f 6e 64 80   and $80646e
$16:8898  6d 1e 1e	  adc $1e1e
$16:889b  fe b7 67	  inc $67b7,x
$16:889e  03 fc		 ora $fc,s
$16:88a0  41 e3		 eor ($e3,x)
$16:88a2  1f 21 79 4f   ora $4f7921,x
$16:88a6  cc 9e fe	  cpy $fe9e
$16:88a9  88			dey
$16:88aa  55 82		 eor $82,x
$16:88ac  14 fe		 trb $fe
$16:88ae  b8			clv
$16:88af  95 86		 sta $86,x
$16:88b1  24 fe		 bit $fe
$16:88b3  b8			clv
$16:88b4  2c de 0a	  bit $0ade
$16:88b7  fe b9 05	  inc $05b9,x
$16:88ba  02 40		 cop #$40
$16:88bc  fe b8 d3	  inc $d3b8,x
$16:88bf  3c 19 c5	  bit $c519,x
$16:88c2  1d 75 0c	  ora $0c75,x
$16:88c5  66 37		 ror $37
$16:88c7  05 8c		 ora $8c
$16:88c9  47 0f		 eor [$0f]
$16:88cb  e4 7f		 cpx $7f
$16:88cd  17 19		 ora [$19],y
$16:88cf  c2 f2		 rep #$f2
$16:88d1  f6 e8		 inc $e8,x
$16:88d3  48			pha
$16:88d4  03 5f		 ora $5f,s
$16:88d6  be 0e f0	  ldx $f00e,y
$16:88d9  ff 8c 3c 83   sbc $833c8c,x
$16:88dd  e5 2f		 sbc $2f
$16:88df  31 f9		 and ($f9),y
$16:88e1  d3 d0		 cmp ($d0,s),y
$16:88e3  be 96 f5	  ldx $f596,y
$16:88e6  3f ae 3d 7c   and $7c3dae,x
$16:88ea  71 a9		 adc ($a9),y
$16:88ec  9c 69 a2	  stz $a269
$16:88ef  11 d8		 ora ($d8),y
$16:88f1  3a			dec a
$16:88f2  f9 e0 ed	  sbc $ede0,y
$16:88f5  f4 5f 7b	  pea $7b5f
$16:88f8  db			stp
$16:88f9  c0 fe 0f	  cpy #$0ffe
$16:88fc  58			cli
$16:88fd  2e bf 67	  rol $67bf
$16:8900  3b			tsc
$16:8901  da			phx
$16:8902  c2 61		 rep #$61
$16:8904  50 27		 bvc $892d
$16:8906  0b			phd
$16:8907  41 77		 eor ($77,x)
$16:8909  da			phx
$16:890a  6d 36 fe	  adc $fe36
$16:890d  23 12		 and $12,s
$16:890f  80 c2		 bra $88d3
$16:8911  87 03		 sta [$03]
$16:8913  02 0e		 cop #$0e
$16:8915  96 27		 stx $27,y
$16:8917  2b			pld
$16:8918  a6 d9		 ldx $d9
$16:891a  4e c6 82	  lsr $82c6
$16:891d  48			pha
$16:891e  18			clc
$16:891f  08			php
$16:8920  74 a0		 stz $a0,x
$16:8922  bb			tyx
$16:8923  1c f9 08	  trb $08f9
$16:8926  8a			txa
$16:8927  e5 09		 sbc $09
$16:8929  26 99		 rol $99
$16:892b  40			rti
$16:892c  06 22		 asl $22
$16:892e  65 32		 adc $32
$16:8930  e1 eb		 sbc ($eb,x)
$16:8932  f6 e6		 inc $e6,x
$16:8934  3b			tsc
$16:8935  10 86		 bpl $88bd
$16:8937  cb			wai
$16:8938  2f b3 32 c8   and $c832b3
$16:893c  c4 76		 cpy $76
$16:893e  06 55		 asl $55
$16:8940  35 99		 and $99,x
$16:8942  04 4c		 tsb $4c
$16:8944  a3 94		 lda $94,s
$16:8946  db			stp
$16:8947  10 83		 bpl $88cc
$16:8949  29 9e 2e	  and #$2e9e
$16:894c  19 48 b4	  ora $b448,y
$16:894f  db			stp
$16:8950  52 88		 eor ($88)
$16:8952  4e b6 92	  lsr $92b6
$16:8955  42 e2		 wdm #$e2
$16:8957  94 85		 sty $85,x
$16:8959  6c 05 00	  jmp ($0005)
$16:895c  8c 47 23	  sty $2347
$16:895f  a5 d5		 lda $d5
$16:8961  28			plp
$16:8962  84 16		 sty $16
$16:8964  45 20		 eor $20
$16:8966  9b			txy
$16:8967  ae c0 58	  ldx $58c0
$16:896a  4d ff 14	  eor $14ff
$16:896d  1c 2f 2f	  trb $2f2f
$16:8970  6e 6d 80	  ror $806d
$16:8973  a5 1e		 lda $1e
$16:8975  3e 02 f0	  rol $f002,x
$16:8978  9f 89 2e 14   sta $142e89,x
$16:897c  41 28		 eor ($28,x)
$16:897e  5b			tcd
$16:897f  24 21		 bit $21
$16:8981  30 21		 bmi $89a4
$16:8983  59 c0 e2	  eor $e2c0,y
$16:8986  51 58		 eor ($58),y
$16:8988  b4 4a		 ldy $4a,x
$16:898a  25 13		 and $13
$16:898c  82 c8 62	  brl $ec57
$16:898f  30 17		 bmi $89a8
$16:8991  01 c2		 ora ($c2,x)
$16:8993  e3 10		 sbc $10,s
$16:8995  f8			sed
$16:8996  f3 40		 sbc ($40,s),y
$16:8998  c9 00 5b	  cmp #$5b00
$16:899b  cc 61 a9	  cpy $a961
$16:899e  64 31		 stz $31
$16:89a0  f8			sed
$16:89a1  bb			tyx
$16:89a2  40			rti
$16:89a3  e6 f3		 inc $f3
$16:89a5  47 01		 eor [$01]
$16:89a7  cc a6 ed	  cpy $eda6
$16:89aa  03 68		 ora $68,s
$16:89ac  84 e0		 sty $e0
$16:89ae  d4 b3		 pei ($b3)
$16:89b0  89 02 88	  bit #$8802
$16:89b3  64 66		 stz $66
$16:89b5  77 8c		 adc [$8c],y
$16:89b7  c6 96		 dec $96
$16:89b9  25 1b		 and $1b
$16:89bb  33 b8		 and ($b8,s),y
$16:89bd  84 c6		 sty $c6
$16:89bf  a0 b7 f6	  ldy #$f6b7
$16:89c2  47 9a		 eor [$9a]
$16:89c4  50 58		 bvc $8a1e
$16:89c6  4d 04 12	  eor $1204
$16:89c9  3b			tsc
$16:89ca  cb			wai
$16:89cb  c0 7e 14	  cpy #$147e
$16:89ce  f1 2f		 sbc ($2f),y
$16:89d0  41 21		 eor ($21,x)
$16:89d2  50 ab		 bvc $897f
$16:89d4  01 18		 ora ($18,x)
$16:89d6  1c c0 e9	  trb $e9c0
$16:89d9  48			pha
$16:89da  14 1e		 trb $1e
$16:89dc  07 12		 ora [$12]
$16:89de  89 58 4a	  bit #$4a58
$16:89e1  c1 13		 cmp ($13,x)
$16:89e3  82 c8 62	  brl $ecae
$16:89e6  2d b2 80	  and $80b2
$16:89e9  b5 49		 lda $49,x
$16:89eb  22 ad b2 17   jsl $17b2ad
$16:89ef  03 98		 ora $98,s
$16:89f1  67 06		 adc [$06]
$16:89f3  9d 34 86	  sta $8634,x
$16:89f6  fb			xce
$16:89f7  67 3b		 adc [$3b]
$16:89f9  df 9b a3 5f   cmp $5fa39b,x
$16:89fd  3b			tsc
$16:89fe  d9 e9 b4	  cmp $b4e9,y
$16:8a01  db			stp
$16:8a02  2d ba 3d	  and $3dba
$16:8a05  b5 e9		 lda $e9,x
$16:8a07  a1 54		 lda ($54,x)
$16:8a09  8e d5 1e	  stx $1ed5
$16:8a0c  db			stp
$16:8a0d  e5 49		 sbc $49
$16:8a0f  ab			plb
$16:8a10  7f 7e 8f 28   adc $288f7e,x
$16:8a14  e9 d0 71	  sbc #$71d0
$16:8a17  39 55 c9	  and $c955,y
$16:8a1a  ec 91 e4	  cpx $e491
$16:8a1d  29 14 40	  and #$4014
$16:8a20  ae 10 66	  ldx $6610
$16:8a23  a8			tay
$16:8a24  f2 7b		 sbc ($7b)
$16:8a26  1b			tcs
$16:8a27  bf c5 e2 45   lda $45e2c5,x
$16:8a2b  12 81		 ora ($81)
$16:8a2d  8e 08 6c	  stx $6c08
$16:8a30  45 51		 eor $51
$16:8a32  30 18		 bmi $8a4c
$16:8a34  6d 90 a2	  adc $a290
$16:8a37  90 30		 bcc $8a69
$16:8a39  d9 58 21	  cmp $2158,y
$16:8a3c  45 30		 eor $30
$16:8a3e  19 d5 86	  ora $86d5,y
$16:8a41  24 63		 bit $63
$16:8a43  31 b3		 and ($b3),y
$16:8a45  cd e3 07	  cmp $07e3
$16:8a48  33 1b		 and ($1b,s),y
$16:8a4a  3c e0 c0	  bit $c0e0,x
$16:8a4d  52 31		 eor ($31)
$16:8a4f  aa			tax
$16:8a50  04 c4		 tsb $c4
$16:8a52  86 06		 stx $06
$16:8a54  01 8c		 ora ($8c,x)
$16:8a56  c6 e4		 dec $e4
$16:8a58  0c 03 11	  tsb $1103
$16:8a5b  8c 4c fe	  sty $fe4c
$16:8a5e  48			pha
$16:8a5f  20 8d 34	  jsr $348d
$16:8a62  15 38		 ora $38,x
$16:8a64  26 00		 rol $00
$16:8a66  20 0b d4	  jsr $d40b
$16:8a69  9c 66 44	  stz $4466
$16:8a6c  09 0c 44	  ora #$440c
$16:8a6f  a0 2a 59	  ldy #$592a
$16:8a72  4f 12 91 20   eor $209112
$16:8a76  89 b2 9d	  bit #$9db2
$16:8a79  ed d8 2f	  sbc $2fd8
$16:8a7c  03 47		 ora $47,s
$16:8a7e  01 10		 ora ($10,x)
$16:8a80  34 db		 bit $db,x
$16:8a82  56 0b		 lsr $0b,x
$16:8a84  a6 cc		 ldx $cc
$16:8a86  0c ef 7f	  tsb $7fef
$16:8a89  7f 23 05 9f   adc $9f0523,x
$16:8a8d  cd 97 b7	  cmp $b797
$16:8a90  04 7c		 tsb $7c
$16:8a92  45 e3		 eor $e3
$16:8a94  3f 22 79 56   and $567922,x
$16:8a98  d4 40		 pei ($40)
$16:8a9a  04 a5		 tsb $a5
$16:8a9c  81 01		 sta ($01,x)
$16:8a9e  29 da 0e	  and #$0eda
$16:8aa1  20 42 7d	  jsr $7d42
$16:8aa4  99 c2 16	  sta $16c2,y
$16:8aa7  77 20		 adc [$20],y
$16:8aa9  2a			rol a
$16:8aaa  45 1c		 eor $1c
$16:8aac  ac b0 71	  ldy $71b0
$16:8aaf  04 2a		 tsb $2a
$16:8ab1  c1 0a		 cmp ($0a,x)
$16:8ab3  39 0a bd	  and $bd0a,y
$16:8ab6  90 03		 bcc $8abb
$16:8ab8  61 89		 adc ($89,x)
$16:8aba  20 85 3e	  jsr $3e85
$16:8abd  33 79		 and ($79,s),y
$16:8abf  a2 d0 59	  ldx #$59d0
$16:8ac2  e4 91		 cpx $91
$16:8ac4  24 f8		 bit $f8
$16:8ac6  ce 16 64	  dec $6416
$16:8ac9  df 24 89 aa   cmp $aa8924,x
$16:8acd  4e 0e d5	  lsr $d50e
$16:8ad0  14 92		 trb $92
$16:8ad2  c1 17		 cmp ($17,x)
$16:8ad4  60			rts
$16:8ad5  01 17		 ora ($17,x)
$16:8ad7  b1 80		 lda ($80),y
$16:8ad9  46 c1		 lsr $c1
$16:8adb  00 81		 brk #$81
$16:8add  b2 c2		 lda ($c2)
$16:8adf  25 15		 and $15
$16:8ae1  8b			phb
$16:8ae2  44 d3 e0	  mvp $e0,$d3
$16:8ae5  80 16		 bra $8afd
$16:8ae7  58			cli
$16:8ae8  58			cli
$16:8ae9  5a			phy
$16:8aea  85 18		 sta $18
$16:8aec  87 c7		 sta [$c7]
$16:8aee  9a			txs
$16:8aef  c4 d6		 cpy $d6
$16:8af1  30 fe		 bmi $8af1
$16:8af3  ce 03 f7	  dec $f703
$16:8af6  20 26 03	  jsr $0326
$16:8af9  50 a4		 bvc $8a9f
$16:8afb  31 f8		 and ($f8),y
$16:8afd  b8			clv
$16:8afe  98			tya
$16:8aff  e4 91		 cpx $91
$16:8b01  c8			iny
$16:8b02  d4 69		 pei ($69)
$16:8b04  68			pla
$16:8b05  04 c1		 tsb $c1
$16:8b07  26 04		 rol $04
$16:8b09  8d 3e 12	  sta $123e
$16:8b0c  22 d8 2a ca   jsl $ca2ad8
$16:8b10  32 5d		 and ($5d)
$16:8b12  03 88		 ora $88,s
$16:8b14  c6 d4		 dec $d4
$16:8b16  03 1c		 ora $1c,s
$16:8b18  8e aa c8	  stx $c8aa
$16:8b1b  ff e9 0f 36   sbc $360fe9,x
$16:8b1f  00 00		 brk #$00
$16:8b21  1e c6 bd	  asl $bdc6,x
$16:8b24  07 da		 ora [$da]
$16:8b26  84 00		 sty $00
$16:8b28  2c 6c d0	  bit $d06c
$16:8b2b  48			pha
$16:8b2c  9a			txs
$16:8b2d  d0 dc		 bne $8b0b
$16:8b2f  c2 f9		 rep #$f9
$16:8b31  57 22		 eor [$22],y
$16:8b33  31 eb		 and ($eb),y
$16:8b35  19 8c 33	  ora $338c,y
$16:8b38  09 a0 59	  ora #$59a0
$16:8b3b  6a			ror a
$16:8b3c  a1 12		 lda ($12,x)
$16:8b3e  80 ef		 bra $8b2f
$16:8b40  b4 cf		 ldy $cf,x
$16:8b42  93 85		 sta ($85,s),y
$16:8b44  42 95		 wdm #$95
$16:8b46  e1 60		 sbc ($60,x)
$16:8b48  52 96		 eor ($96)
$16:8b4a  27 2a		 and [$2a]
$16:8b4c  f9 2c a4	  sbc $a42c,y
$16:8b4f  4a			lsr a
$16:8b50  24 af		 bit $af
$16:8b52  0b			phd
$16:8b53  0b			phd
$16:8b54  0c f6 39	  tsb $39f6
$16:8b57  f0 48		 beq $8ba1
$16:8b59  65 31		 adc $31
$16:8b5b  a3 a0		 lda $a0,s
$16:8b5d  57 84		 eor [$84],y
$16:8b5f  dd a6 bb	  cmp $bba6,x
$16:8b62  19 d6 d0	  ora $d0d6,y
$16:8b65  ae 2a f0	  ldx $f02a
$16:8b68  9c 34 d4	  stz $d434
$16:8b6b  ae 46 10	  ldx $1046
$16:8b6e  57 81		 eor [$81],y
$16:8b70  84 e6		 sty $e6
$16:8b72  e6 13		 inc $13
$16:8b74  90 1c		 bcc $8b92
$16:8b76  41 5e		 eor ($5e,x)
$16:8b78  07 13		 ora [$13]
$16:8b7a  99 9c 4e	  sta $4e9c,y
$16:8b7d  34 7d		 bit $7d,x
$16:8b7f  e5 10		 sbc $10
$16:8b81  52 28		 eor ($28)
$16:8b83  27 2a		 and [$2a]
$16:8b85  58			cli
$16:8b86  84 f6		 sty $f6
$16:8b88  62 82 a6	  per $320d
$16:8b8b  08			php
$16:8b8c  51 67		 eor ($67),y
$16:8b8e  29 2a 68	  and #$682a
$16:8b91  ba			tsx
$16:8b92  85 53		 sta $53
$16:8b94  fe b0 f6	  inc $f6b0,x
$16:8b97  0f b4 6f 4d   ora $4d6fb4
$16:8b9b  b5 82		 lda $82,x
$16:8b9d  c6 21		 dec $21
$16:8b9f  25 f3		 and $f3
$16:8ba1  83 a8		 sta $a8,s
$16:8ba3  0f 3c 3d 07   ora $073d3c
$16:8ba7  90 58		 bcc $8c01
$16:8ba9  21 46		 and ($46,x)
$16:8bab  b1 b0		 lda ($b0),y
$16:8bad  34 1a		 bit $1a,x
$16:8baf  43 11		 eor $11,s
$16:8bb1  b0 c4		 bcs $8b77
$16:8bb3  8d 63 61	  sta $6163
$16:8bb6  89 8d 1e	  bit #$1e8d
$16:8bb9  6f 05 35 88   adc $883505
$16:8bbd  90 03		 bcc $8bc2
$16:8bbf  6b			rtl
$16:8bc0  22 90 4e 09   jsl $094e90
$16:8bc4  24 34		 bit $34
$16:8bc6  39 04 dc	  and $dc04,y
$16:8bc9  6a			ror a
$16:8bca  12 48		 ora ($48)
$16:8bcc  e1 65		 sbc ($65,x)
$16:8bce  08			php
$16:8bcf  c7 33		 cmp [$33]
$16:8bd1  23 0c		 and $0c,s
$16:8bd3  74 de		 stz $de,x
$16:8bd5  05 47		 ora $47
$16:8bd7  0b			phd
$16:8bd8  09 7c 8a	  ora #$8a7c
$16:8bdb  8f 41 37 84   sta $843741
$16:8bdf  f1 ea		 sbc ($ea),y
$16:8be1  25 40		 and $40
$16:8be3  82 42 8f	  brl $1b28
$16:8be6  27 31		 and [$31]
$16:8be8  3f 84 fa 04   and $04fa84,x
$16:8bec  64 28		 stz $28
$16:8bee  1c 49 12	  trb $1249
$16:8bf1  73 94		 adc ($94,s),y
$16:8bf3  78			sei
$16:8bf4  51 a0		 eor ($a0),y
$16:8bf6  2f 71 82 34   and $348271
$16:8bfa  20 04 0f	  jsr $0f04
$16:8bfd  71 81		 adc ($81),y
$16:8bff  86 a1		 stx $a1
$16:8c01  44 6d 09	  mvp $09,$6d
$16:8c04  59 48 c8	  eor $c848,y
$16:8c07  13 ed		 ora ($ed,s),y
$16:8c09  32 9b		 and ($9b)
$16:8c0b  a7 8e		 lda [$8e]
$16:8c0d  38			sec
$16:8c0e  af 79 c2 79   lda $79c279
$16:8c12  20 ae f0	  jsr $f0ae
$16:8c15  8c 42 60	  sty $6042
$16:8c18  10 b7		 bpl $8bd1
$16:8c1a  78			sei
$16:8c1b  bb			tyx
$16:8c1c  d1 df		 cmp ($df),y
$16:8c1e  e0 04 91	  cpx #$9104
$16:8c21  48			pha
$16:8c22  02 e1		 cop #$e1
$16:8c24  37 90		 and [$90],y
$16:8c26  49 1f a7	  eor #$a71f
$16:8c29  37 9a		 and [$9a],y
$16:8c2b  01 02		 ora ($02,x)
$16:8c2d  31 1c		 and ($1c),y
$16:8c2f  8d 46 a6	  sta $a646
$16:8c32  62 80 8e	  per $1ab5
$16:8c35  c0 24 6f	  cpy #$6f24
$16:8c38  f0 9c		 beq $8bd6
$16:8c3a  42 60		 wdm #$60
$16:8c3c  e2 50		 sep #$50
$16:8c3e  19 80 e1	  ora $e180,y
$16:8c41  23 60		 and $60,s
$16:8c43  02 1a		 cop #$1a
$16:8c45  48			pha
$16:8c46  14 40		 trb $40
$16:8c48  41 60		 eor ($60,x)
$16:8c4a  22 dc 86 23   jsl $2386dc
$16:8c4e  61 89		 adc ($89,x)
$16:8c50  91 a8		 sta ($a8),y
$16:8c52  40			rti
$16:8c53  24 12		 bit $12
$16:8c55  1c 24 4d	  trb $4d24
$16:8c58  fe 01 60	  inc $6001,x
$16:8c5b  9c 48 c0	  stz $c048
$16:8c5e  41 0a		 eor ($0a,x)
$16:8c60  81 0e		 sta ($0e,x)
$16:8c62  0d fe 42	  ora $42fe
$16:8c65  70 8d		 bvs $8bf4
$16:8c67  98			tya
$16:8c68  82 25 01	  brl $8d90
$16:8c6b  44 18 58	  mvp $58,$18
$16:8c6e  43 80		 eor $80,s
$16:8c70  5e 44 c0	  lsr $c044,x
$16:8c73  0e 04 4c	  asl $4c04
$16:8c76  11 d8		 ora ($d8),y
$16:8c78  e9 b5 46	  sbc #$46b5
$16:8c7b  c6 a2		 dec $a2
$16:8c7d  13 63		 ora ($63,s),y
$16:8c7f  0d 8e 34	  ora $348e
$16:8c82  6a			ror a
$16:8c83  99 a0 e1	  sta $e1a0,y
$16:8c86  4d aa 32	  eor $32aa
$16:8c89  08			php
$16:8c8a  53 b0		 eor ($b0,s),y
$16:8c8c  20 0e f0	  jsr $f00e
$16:8c8f  8c 8a 00	  sty $008a
$16:8c92  7e 29 11	  ror $1129,x
$16:8c95  8c bb c5	  sty $c5bb
$16:8c98  de 26 c5	  dec $c526,x
$16:8c9b  1b			tcs
$16:8c9c  0b			phd
$16:8c9d  bc 69 18	  ldy $1869,x
$16:8ca0  20 81 a0	  jsr $a081
$16:8ca3  06 48		 asl $48
$16:8ca5  10 3a		 bpl $8ce1
$16:8ca7  96 23		 stx $23,y
$16:8ca9  0c 21 29	  tsb $2921
$16:8cac  59 04 25	  eor $2504,y
$16:8caf  62 13 a9	  per $35c5
$16:8cb2  64 31		 stz $31
$16:8cb4  c3 12		 cmp $12,s
$16:8cb6  13 10		 ora ($10,s),y
$16:8cb8  c4 ea		 cpy $ea
$16:8cba  58			cli
$16:8cbb  a8			tay
$16:8cbc  61 04		 adc ($04,x)
$16:8cbe  62 97 72	  per $ff58
$16:8cc1  21 10		 and ($10,x)
$16:8cc3  48			pha
$16:8cc4  7e 85 18	  ror $1885,x
$16:8cc7  27 f9		 and [$f9]
$16:8cc9  83 ce		 sta $ce,s
$16:8ccb  3e 82 f4	  rol $f482,x
$16:8cce  9f a9 2e ea   sta $ea2ea9,x
$16:8cd2  c1 bc		 cmp ($bc,x)
$16:8cd4  b6 4b		 ldx $4b,y
$16:8cd6  22 d1 b0 10   jsl $10b0d1
$16:8cda  b7 ee		 lda [$ee],y
$16:8cdc  01 0b		 ora ($0b,x)
$16:8cde  90 3c		 bcc $8d1c
$16:8ce0  42 6e		 wdm #$6e
$16:8ce2  f1 17		 sbc ($17),y
$16:8ce4  99 48 c2	  sta $c248,y
$16:8ce7  c1 00		 cmp ($00,x)
$16:8ce9  8d 00 06	  sta $0600
$16:8cec  66 00		 ror $00
$16:8cee  58			cli
$16:8cef  db			stp
$16:8cf0  f4 30 40	  pea $4030
$16:8cf3  f4 9e 40	  pea $409e
$16:8cf6  20 0d f1	  jsr $f10d
$16:8cf9  85 bf		 sta $bf
$16:8cfb  43 0c		 eor $0c,s
$16:8cfd  1f 3c 3e 04   ora $043e3c,x
$16:8d01  2e d8 e1	  rol $e1d8
$16:8d04  79 e3 c4	  adc $c4e3,y
$16:8d07  ce ba 38	  dec $38ba
$16:8d0a  a6 14		 ldx $14
$16:8d0c  4c 30 48	  jmp $4830
$16:8d0f  54 28 79	  mvn $79,$28
$16:8d12  70 38		 bvs $8d4c
$16:8d14  94 4a		 sty $4a,x
$16:8d16  26 3d		 rol $3d
$16:8d18  a0 e0		 ldy #$e0
$16:8d1a  9a			txs
$16:8d1b  84 bf		 sty $bf
$16:8d1d  e4 07		 cpx $07
$16:8d1f  99 4d cd	  sta $cd4d,y
$16:8d22  7e 8c f4	  ror $f48c,x
$16:8d25  ed bf 05	  sbc $05bf
$16:8d28  fa			plx
$16:8d29  17 55		 ora [$55],y
$16:8d2b  f9 5d 88	  sbc $885d,y
$16:8d2e  a5 19		 lda $19
$16:8d30  8d bd 4b	  sta $4bbd
$16:8d33  22 cf 3c 9b   jsl $9b3ccf
$16:8d37  b8			clv
$16:8d38  03 01		 ora $01,s
$16:8d3a  19 00 10	  ora $1000,y
$16:8d3d  64 5b		 stz $5b
$16:8d3f  e6 17		 inc $17
$16:8d41  07 3a		 ora [$3a]
$16:8d43  48			pha
$16:8d44  99 a1 24	  sta $24a1,y
$16:8d47  84 85		 sty $85
$16:8d49  c4 f2		 cpy $f2
$16:8d4b  91 88		 sta ($88),y
$16:8d4d  4c 62 38	  jmp $3862
$16:8d50  db			stp
$16:8d51  08			php
$16:8d52  eb			xba
$16:8d53  d1 e4		 cmp ($e4),y
$16:8d55  31 17		 and ($17),y
$16:8d57  e8			inx
$16:8d58  39 0c 76	  and $760c,y
$16:8d5b  4f 85 08 a2   eor $a20885
$16:8d5f  25 03		 and $03
$16:8d61  b1 0b		 lda ($0b),y
$16:8d63  9c 0a 5a	  stz $5a0a
$16:8d66  15 60		 ora $60,x
$16:8d68  85 15		 sta $15
$16:8d6a  c2 14		 rep #$14
$16:8d6c  17 60		 ora [$60],y
$16:8d6e  68			pla
$16:8d6f  44 ac 31	  mvp $31,$ac
$16:8d72  27 60		 and [$60]
$16:8d74  44 a2 62	  mvp $62,$a2
$16:8d77  92 d7		 sta ($d7)
$16:8d79  ed c5 24	  sbc $24c5
$16:8d7c  8a			txa
$16:8d7d  07 60		 ora [$60]
$16:8d7f  0a			asl a
$16:8d80  53 7d		 eor ($7d,s),y
$16:8d82  b2 c2		 lda ($c2)
$16:8d84  0a			asl a
$16:8d85  44 70 06	  mvp $06,$70
$16:8d88  47 d3		 eor [$d3]
$16:8d8a  6c 05 26	  jmp ($2605)
$16:8d8d  64 5d		 stz $5d
$16:8d8f  7e cf 4d	  ror $4dcf,x
$16:8d92  a6 3f		 ldx $3f
$16:8d94  d1 f0		 cmp ($f0),y
$16:8d96  11 a0		 ora ($a0),y
$16:8d98  ef 19 04 dd   sbc $dd0419
$16:8d9c  d8			cld
$16:8d9d  0b			phd
$16:8d9e  a3 4d		 lda $4d,s
$16:8da0  93 fc		 sta ($fc,s),y
$16:8da2  a6 6e		 ldx $6e
$16:8da4  c0 65 0a	  cpy #$0a65
$16:8da7  98			tya
$16:8da8  53 62		 eor ($62,s),y
$16:8daa  f2 07		 sbc ($07)
$16:8dac  21 b6		 and ($b6,x)
$16:8dae  86 36		 stx $36
$16:8db0  99 30 10	  sta $1030,y
$16:8db3  04 51		 tsb $51
$16:8db5  82 04 70	  brl $fdbc
$16:8db8  45 92		 eor $92
$16:8dba  d0 1b		 bne $8dd7
$16:8dbc  e6 d6		 inc $d6
$16:8dbe  2d f2 30	  and $30f2
$16:8dc1  74 d0		 stz $d0,x
$16:8dc3  a7 78		 lda [$78]
$16:8dc5  10 80		 bpl $8d47
$16:8dc7  8c 84 f1	  sty $f184
$16:8dca  7e 19 48	  ror $4819,x
$16:8dcd  0a			asl a
$16:8dce  c7 af		 cmp [$af]
$16:8dd0  c2 6c		 rep #$6c
$16:8dd2  e7 60		 sbc [$60]
$16:8dd4  c0 2f 98	  cpy #$982f
$16:8dd7  19 36 09	  ora $0936,y
$16:8dda  c1 47		 cmp ($47,x)
$16:8ddc  10 e0		 bpl $8dbe
$16:8dde  f7 c1		 sbc [$c1],y
$16:8de0  a3 46		 lda $46,s
$16:8de2  a8			tay
$16:8de3  20 85 28	  jsr $2885
$16:8de6  2e 51 3b	  rol $3b51
$16:8de9  23 50		 and $50,s
$16:8deb  6b			rtl
$16:8dec  08			php
$16:8ded  d0 c2		 bne $8db1
$16:8def  6d c4 a2	  adc $a2c4
$16:8df2  55 8d		 eor $8d,x
$16:8df4  36 c3		 rol $c3,x
$16:8df6  7e 8a 0d	  ror $0d8a,x
$16:8df9  ba			tsx
$16:8dfa  6c 8e ad	  jmp ($ad8e)
$16:8dfd  b2 05		 lda ($05)
$16:8dff  06 c8		 asl $c8
$16:8e01  c9 26 d1	  cmp #$d126
$16:8e04  42 d2		 wdm #$d2
$16:8e06  77 d5		 adc [$d5],y
$16:8e08  de bf f6	  dec $f6bf,x
$16:8e0b  87 b7		 sta [$b7]
$16:8e0d  ae 00 ef	  ldx $ef00
$16:8e10  f0 07		 beq $8e19
$16:8e12  41 c2		 eor ($c2,x)
$16:8e14  23 48		 and $48,s
$16:8e16  a0 85 86	  ldy #$8685
$16:8e19  78			sei
$16:8e1a  11 20		 ora ($20),y
$16:8e1c  79 41 2c	  adc $2c41,y
$16:8e1f  13 d9		 ora ($d9,s),y
$16:8e21  88			dey
$16:8e22  98			tya
$16:8e23  67 d6		 adc [$d6]
$16:8e25  08			php
$16:8e26  10 74		 bpl $8e9c
$16:8e28  a0 90 a8	  ldy #$a890
$16:8e2b  1d 86 8b	  ora $8b86,x
$16:8e2e  98			tya
$16:8e2f  cc ce 67	  cpy $67ce
$16:8e32  34 6b		 bit $6b,x
$16:8e34  0c 06 15	  tsb $1506
$16:8e37  02 00		 cop #$00
$16:8e39  04 0e		 tsb $0e
$16:8e3b  25 13		 and $13
$16:8e3d  9b			txy
$16:8e3e  e3 34		 sbc $34,s
$16:8e40  5a			phy
$16:8e41  3b			tsc
$16:8e42  51 84		 eor ($84),y
$16:8e44  26 f1		 rol $f1
$16:8e46  18			clc
$16:8e47  94 04		 sty $04,x
$16:8e49  00 10		 brk #$10
$16:8e4b  bc e5 aa	  ldy $aae5,x
$16:8e4e  71 18		 adc ($18),y
$16:8e50  88			dey
$16:8e51  4d 66 d1	  eor $d166
$16:8e54  08			php
$16:8e55  2c e2 0b	  bit $0be2
$16:8e58  72 84		 adc ($84)
$16:8e5a  93 c7		 sta ($c7,s),y
$16:8e5c  49 05 82	  eor #$8205
$16:8e5f  c8			iny
$16:8e60  b0 70		 bcs $8ed2
$16:8e62  f8			sed
$16:8e63  f1 8c		 sbc ($8c),y
$16:8e65  0c 61 a4	  tsb $a461
$16:8e68  2f 0c ca 6e   and $6eca0c
$16:8e6c  63 09		 adc $09,s
$16:8e6e  0e 2e 3f	  asl $3f2e
$16:8e71  17 2c		 ora [$2c],y
$16:8e73  81 8c		 sta ($8c,x)
$16:8e75  26 f3		 rol $f3
$16:8e77  42 78		 wdm #$78
$16:8e79  96 c0		 stx $c0,y
$16:8e7b  c6 05		 dec $05
$16:8e7d  50 34		 bvc $8eb3
$16:8e7f  91 68		 sta ($68),y
$16:8e81  0b			phd
$16:8e82  c4 88		 cpy $88
$16:8e84  34 92		 bit $92,x
$16:8e86  46 0b		 lsr $0b
$16:8e88  c5 20		 cmp $20
$16:8e8a  51 0c		 eor ($0c),y
$16:8e8c  8c c8 0a	  sty $0ac8
$16:8e8f  42 90		 wdm #$90
$16:8e91  c4 40		 cpy $40
$16:8e93  01 19		 ora ($19,x)
$16:8e95  8d 2c 86	  sta $862c
$16:8e98  36 85		 rol $85,x
$16:8e9a  08			php
$16:8e9b  e2 d4		 sep #$d4
$16:8e9d  4c 60 0f	  jmp $0f60
$16:8ea0  48			pha
$16:8ea1  3c 2e 19	  bit $192e,x
$16:8ea4  14 84		 trb $84
$16:8ea6  b1 41		 lda ($41),y
$16:8ea8  44 2b fa	  mvp $fa,$2b
$16:8eab  58			cli
$16:8eac  92 fd		 sta ($fd)
$16:8eae  a1 b0		 lda ($b0,x)
$16:8eb0  e6 48		 inc $48
$16:8eb2  06 d1		 asl $d1
$16:8eb4  e1 ef		 sbc ($ef,x)
$16:8eb6  eb			xba
$16:8eb7  76 70		 ror $70,x
$16:8eb9  3f c4 1e 31   and $311ec4,x
$16:8ebd  f2 17		 sbc ($17)
$16:8ebf  94 fc		 sty $fc,x
$16:8ec1  c9 ef e8	  cmp #$e8ef
$16:8ec4  85 58		 sta $58
$16:8ec6  21 4f		 and ($4f,x)
$16:8ec8  eb			xba
$16:8ec9  89 58 62	  bit #$6258
$16:8ecc  4f eb 82 cd   eor $cd82eb
$16:8ed0  e0 af		 cpx #$af
$16:8ed2  eb			xba
$16:8ed3  90 50		 bcc $8f25
$16:8ed5  24 0f		 bit $0f
$16:8ed7  eb			xba
$16:8ed8  8d 33 c1	  sta $c133
$16:8edb  9c 51 d7	  stz $d751
$16:8ede  50 c6		 bvc $8ea6
$16:8ee0  63 70		 adc $70,s
$16:8ee2  c8			iny
$16:8ee3  a4 70		 ldy $70
$16:8ee5  fe 47 f1	  inc $f147,x
$16:8ee8  71 9c		 adc ($9c),y
$16:8eea  2e 1b 0e	  rol $0e1b
$16:8eed  84 80		 sty $80
$16:8eef  35 fb		 and $fb,x
$16:8ef1  e0 ef		 cpx #$ef
$16:8ef3  0f f8 c3 c8   ora $c8c3f8
$16:8ef7  3e 52 f3	  rol $f352,x
$16:8efa  1f 9d 3d 0b   ora $0b3d9d,x
$16:8efe  e9 6f 51	  sbc #$516f
$16:8f01  d4 82		 pei ($82)
$16:8f03  41 37		 eor ($37,x)
$16:8f05  90 48		 bcc $8f4f
$16:8f07  d4 73		 pei ($73)
$16:8f09  1c a2 4c	  trb $4ca2
$16:8f0c  e3 51		 sbc $51,s
$16:8f0e  b5 1a		 lda $1a,x
$16:8f10  46 98		 lsr $98
$16:8f12  c0 d1		 cpy #$d1
$16:8f14  08			php
$16:8f15  ec 19 d2	  cpx $d219
$16:8f18  11 95		 ora ($95),y
$16:8f1a  1a			inc a
$16:8f1b  35 81		 and $81,x
$16:8f1d  be 4d 51	  ldx $514d,y
$16:8f20  83 a8		 sta $a8,s
$16:8f22  fd f3 e0	  sbc $e0f3,x
$16:8f25  af 58 14 16   lda $161458
$16:8f29  a9 63 a6	  lda #$a663
$16:8f2c  d3 61		 cmp ($61,s),y
$16:8f2e  30 a8		 bmi $8ed8
$16:8f30  13 7c		 ora ($7c,s),y
$16:8f32  c3 a5		 cmp $a5,s
$16:8f34  4e 96 8c	  lsr $8c96
$16:8f37  82 d9 74	  brl $0413
$16:8f3a  80 c2		 bra $8efe
$16:8f3c  87 03		 sta [$03]
$16:8f3e  02 0e		 cop #$0e
$16:8f40  95 4e		 sta $4e,x
$16:8f42  b6 23		 ldx $23,y
$16:8f44  01 18		 ora ($18,x)
$16:8f46  0d 40 90	  ora $9040
$16:8f49  30 10		 bmi $8f5b
$16:8f4b  e9 10 02	  sbc #$0210
$16:8f4e  b3 5b		 lda ($5b,s),y
$16:8f50  19 09 54	  ora $5409,y
$16:8f53  ad a4 d3	  lda $d3a4
$16:8f56  28			plp
$16:8f57  05 38		 ora $38
$16:8f59  86 44		 stx $44
$16:8f5b  31 2e		 and ($2e),y
$16:8f5d  1d 52 ab	  ora $ab52,x
$16:8f60  05 ae		 ora $ae
$16:8f62  95 64		 sta $64,x
$16:8f64  42 16		 wdm #$16
$16:8f66  2a			rol a
$16:8f67  b0 88		 bcs $8ef1
$16:8f69  4c ef 5c	  jmp $5cef
$16:8f6c  2a			rol a
$16:8f6d  a9 61 8a	  lda #$8a61
$16:8f70  42 43		 wdm #$43
$16:8f72  1a			inc a
$16:8f73  d5 60		 cmp $60,x
$16:8f75  84 0a		 sty $0a
$16:8f77  60			rts
$16:8f78  84 93		 sty $93
$16:8f7a  50 a8		 bvc $8f24
$16:8f7c  34 f2		 bit $f2,x
$16:8f7e  00 56		 brk #$56
$16:8f80  2c 92 45	  bit $4592
$16:8f83  62 14 4a	  per $d99a
$16:8f86  bc 60 18	  ldy $1860,x
$16:8f89  c4 72		 cpy $72
$16:8f8b  3a			dec a
$16:8f8c  5d 52 00	  eor $0052,x
$16:8f8f  59 24 52	  eor $5224,y
$16:8f92  09 ba ec	  ora #$ecba
$16:8f95  05 84		 ora $84
$16:8f97  df f1 41 c2   cmp $c241f1,x
$16:8f9b  e1 b0		 sbc ($b0,x)
$16:8f9d  e6 d8		 inc $d8
$16:8f9f  0a			asl a
$16:8fa0  51 e3		 eor ($e3),y
$16:8fa2  e0 2f		 cpx #$2f
$16:8fa4  09 f8 92	  ora #$92f8
$16:8fa7  e1 44		 sbc ($44,x)
$16:8fa9  12 85		 ora ($85)
$16:8fab  c3 22		 cmp $22,s
$16:8fad  90 98		 bcc $8f47
$16:8faf  10 ac		 bpl $8f5d
$16:8fb1  e0 71		 cpx #$71
$16:8fb3  28			plp
$16:8fb4  ac 5b 35	  ldy $355b
$16:8fb7  9b			txy
$16:8fb8  89 c1 64	  bit #$64c1
$16:8fbb  31 18		 and ($18),y
$16:8fbd  0b			phd
$16:8fbe  b0 e1		 bcs $8fa1
$16:8fc0  71 88		 adc ($88),y
$16:8fc2  7c 7b 45	  jmp ($457b,x)
$16:8fc5  a3 63		 lda $63,s
$16:8fc7  92 b0		 sta ($b0)
$16:8fc9  8b			phb
$16:8fca  c3 83		 cmp $83,s
$16:8fcc  31 05		 and ($05),y
$16:8fce  a5 a0		 lda $a0
$16:8fd0  58			cli
$16:8fd1  c3 52		 cmp $52,s
$16:8fd3  dc 63 f1	  jml [$f163]
$16:8fd6  7b			tdc
$16:8fd7  8b			phb
$16:8fd8  40			rti
$16:8fd9  a6 f3		 ldx $f3
$16:8fdb  47 61		 eor [$61]
$16:8fdd  cc a6 ed	  cpy $eda6
$16:8fe0  03 64		 ora $64,s
$16:8fe2  04 e0		 tsb $e0
$16:8fe4  d4 b3		 pei ($b3)
$16:8fe6  89 02 88	  bit #$8802
$16:8fe9  64 66		 stz $66
$16:8feb  77 8c		 adc [$8c],y
$16:8fed  c6 96		 dec $96
$16:8fef  25 1b		 and $1b
$16:8ff1  33 b8		 and ($b8,s),y
$16:8ff3  84 c4		 sty $c4
$16:8ff5  a0 b7		 ldy #$b7
$16:8ff7  f6 47		 inc $47,x
$16:8ff9  9a			txs
$16:8ffa  50 58		 bvc $9054
$16:8ffc  4d 04 12	  eor $1204
$16:8fff  3b			tsc
$16:9000  cb			wai
$16:9001  c0 7e		 cpy #$7e
$16:9003  14 f1		 trb $f1
$16:9005  2f 41 21 50   and $502141
$16:9009  ab			plb
$16:900a  01 18		 ora ($18,x)
$16:900c  21 70		 and ($70,x)
$16:900e  c8			iny
$16:900f  a4 24		 ldy $24
$16:9011  8e 50 28	  stx $2850
$16:9014  3c 0e 25	  bit $250e,x
$16:9017  12 b0		 ora ($b0)
$16:9019  95 82		 sta $82,x
$16:901b  27 05		 and [$05]
$16:901d  90 c4		 bcc $8fe3
$16:901f  4a			lsr a
$16:9020  e5 01		 sbc $01
$16:9022  6a			ror a
$16:9023  92 45		 sta ($45)
$16:9025  92 20		 sta ($20)
$16:9027  e9 06 a9	  sbc #$a906
$16:902a  4e 20 b5	  lsr $b520
$16:902d  4a			lsr a
$16:902e  bd 5a aa	  lda $aa5a,x
$16:9031  76 23		 ror $23,x
$16:9033  92 29		 sta ($29)
$16:9035  c2 9d		 rep #$9d
$16:9037  2d 96 d7	  and $d796
$16:903a  8d 64 72	  sta $7264
$16:903d  4a			lsr a
$16:903e  a5 5a		 lda $5a
$16:9040  c7 4d		 cmp [$4d]
$16:9042  a6 d8		 ldx $d8
$16:9044  8f a2 71 4a   sta $4a71a2
$16:9048  a5 8d		 lda $8d
$16:904a  16 0a		 asl $0a,x
$16:904c  91 af		 sta ($af),y
$16:904e  a3 da		 lda $da,s
$16:9050  ba			tsx
$16:9051  9b			txy
$16:9052  05 c1		 ora $c1
$16:9054  57 a4		 eor [$a4],y
$16:9056  0b			phd
$16:9057  f0 92		 beq $8feb
$16:9059  1c c9 14	  trb $14c9
$16:905c  2a			rol a
$16:905d  92 a7		 sta ($a7)
$16:905f  ba			tsx
$16:9060  ca			dex
$16:9061  3a			dec a
$16:9062  84 1a		 sty $1a
$16:9064  9d 6d 70	  sta $706d,x
$16:9067  76 26		 ror $26,x
$16:9069  79 0a 45	  adc $450a,y
$16:906c  10 6a		 bpl $90d8
$16:906e  92 1a		 sta ($1a)
$16:9070  24 18		 bit $18
$16:9072  5e 4f 93	  lsr $934f,x
$16:9075  77 f8		 adc [$f8],y
$16:9077  bc 48 a1	  ldy $a148,x
$16:907a  42 28		 wdm #$28
$16:907c  18			clc
$16:907d  e0 86 c4	  cpx #$c486
$16:9080  55 0a		 eor $0a,x
$16:9082  19 80 c3	  ora $c380,y
$16:9085  6c 65 34	  jmp ($3465)
$16:9088  90 86		 bcc $9010
$16:908a  c8			iny
$16:908b  2c 05 30	  bit $3005
$16:908e  3a			dec a
$16:908f  98			tya
$16:9090  e1 4c		 sbc ($4c,x)
$16:9092  00 63		 brk #$63
$16:9094  35 81		 and $81,x
$16:9096  86 ca		 stx $ca
$16:9098  6e 82 61	  ror $6182
$16:909b  c2 ce		 rep #$ce
$16:909d  12 45		 ora ($45)
$16:909f  23 47		 and $47,s
$16:90a1  a0 4c 21	  ldy #$214c
$16:90a4  46 30		 lsr $30
$16:90a6  49 0c 66	  eor #$660c
$16:90a9  36 bf		 rol $bf,x
$16:90ab  41 18		 eor ($18,x)
$16:90ad  44 a2 64	  mvp $64,$a2
$16:90b0  73 8c		 adc ($8c,s),y
$16:90b2  c6 9a		 dec $9a
$16:90b4  0a			asl a
$16:90b5  af 30 c1 38   lda $38c130
$16:90b9  19 cc 12	  ora $12cc,y
$16:90bc  18			clc
$16:90bd  88			dey
$16:90be  a0 94 d0	  ldy #$d094
$16:90c1  66 47		 ror $47
$16:90c3  01 41		 ora ($41,x)
$16:90c5  0c 65 56	  tsb $5665
$16:90c8  aa			tax
$16:90c9  b0 5e		 bcs $9129
$16:90cb  06 8e		 asl $8e
$16:90cd  02 20		 cop #$20
$16:90cf  4b			phk
$16:90d0  6b			rtl
$16:90d1  cc 17 31	  cpy $3117
$16:90d4  98			tya
$16:90d5  25 1e		 and $1e
$16:90d7  9e fe 78	  stz $78fe,x
$16:90da  64 51		 stz $51
$16:90dc  86 8f		 stx $8f
$16:90de  e6 86		 inc $86
$16:90e0  c3 82		 cmp $82,s
$16:90e2  3e 22 f1	  rol $f122,x
$16:90e5  9f 91 3c ab   sta $ab3c91,x
$16:90e9  6a			ror a
$16:90ea  20 02 54	  jsr $5402
$16:90ed  9d 62 2f	  sta $2f62,x
$16:90f0  e9 5f 9a	  sbc #$9a5f
$16:90f3  13 ec		 ora ($ec,s),y
$16:90f5  ce 10 b3	  dec $b310
$16:90f8  b9 01 52	  lda $5201,y
$16:90fb  28			plp
$16:90fc  e5 65		 sbc $65
$16:90fe  83 88		 sta $88,s
$16:9100  21 56		 and ($56,x)
$16:9102  08			php
$16:9103  51 c8		 eor ($c8),y
$16:9105  55 ed		 eor $ed,x
$16:9107  21 40		 and ($40,x)
$16:9109  85 86		 sta $86
$16:910b  24 82		 bit $82
$16:910d  14 f8		 trb $f8
$16:910f  cd e6 8b	  cmp $8be6
$16:9112  41 67		 eor ($67,x)
$16:9114  92 84		 sta ($84)
$16:9116  93 e3		 sta ($e3,s),y
$16:9118  38			sec
$16:9119  59 93 7c	  eor $7c93,y
$16:911c  92 26		 sta ($26)
$16:911e  a9 38 3b	  lda #$3b38
$16:9121  54 52 4b	  mvn $4b,$52
$16:9124  04 5d		 tsb $5d
$16:9126  80 04		 bra $912c
$16:9128  5e c6 01	  lsr $01c6,x
$16:912b  1b			tcs
$16:912c  04 02		 tsb $02
$16:912e  07 12		 ora [$12]
$16:9130  cd 66 e2	  cmp $e266
$16:9133  b1 68		 lda ($68),y
$16:9135  9a			txs
$16:9136  80 18		 bra $9150
$16:9138  e2 cb		 sep #$cb
$16:913a  0b			phd
$16:913b  0b			phd
$16:913c  10 31		 bpl $916f
$16:913e  9a			txs
$16:913f  2d 1c 3e	  and $3e1c
$16:9142  3d 10 6b	  and $6b10,x
$16:9145  13 3c		 ora ($3c,s),y
$16:9147  9a			txs
$16:9148  85 18		 sta $18
$16:914a  12 00		 ora ($00)
$16:914c  9d 5c 20	  sta $205c,x
$16:914f  c4 0c		 cpy $0c
$16:9151  e4 8b		 cpx $8b
$16:9153  06 24		 asl $24
$16:9155  0b			phd
$16:9156  48			pha
$16:9157  9c e4 04	  stz $04e4
$16:915a  c0 62 06	  cpy #$0662
$16:915d  92 43		 sta ($43)
$16:915f  71 8f		 adc ($8f),y
$16:9161  c5 ee		 cmp $ee
$16:9163  2d 62 92	  and $9262
$16:9166  47 23		 eor [$23]
$16:9168  51 a6		 eor ($a6),y
$16:916a  20 13 04	  jsr $0413
$16:916d  98			tya
$16:916e  12 35		 ora ($35)
$16:9170  00 48		 brk #$48
$16:9172  8b			phb
$16:9173  60			rts
$16:9174  ab			plb
$16:9175  28			plp
$16:9176  c9 74 0e	  cmp #$0e74
$16:9179  23 1b		 and $1b,s
$16:917b  50 0c		 bvc $9189
$16:917d  72 3a		 adc ($3a)
$16:917f  ab			plb
$16:9180  23 ff		 and $ff,s
$16:9182  a4 3c		 ldy $3c
$16:9184  d8			cld
$16:9185  00 00		 brk #$00
$16:9187  7b			tdc
$16:9188  1a			inc a
$16:9189  f4 1f 6a	  pea $6a1f
$16:918c  10 00		 bpl $918e
$16:918e  b1 b3		 lda ($b3),y
$16:9190  41 22		 eor ($22,x)
$16:9192  6b			rtl
$16:9193  41 c6		 eor ($c6,x)
$16:9195  39 89 f2	  and $f289,y
$16:9198  a5 f0		 lda $f0
$16:919a  c6 34		 dec $34
$16:919c  c1 8d		 cmp ($8d,x)
$16:919e  a6 61		 ldx $61
$16:91a0  34 0b		 bit $0b,x
$16:91a2  2d 54 22	  and $2254
$16:91a5  30 1a		 bmi $91c1
$16:91a7  ed 35 f2	  sbc $f235
$16:91aa  70 a8		 bvs $9154
$16:91ac  52 bc		 eor ($bc)
$16:91ae  2c 0a 52	  bit $520a
$16:91b1  a9 d6 e5	  lda #$e5d6
$16:91b4  a0 a1 ad	  ldy #$ada1
$16:91b7  44 a2 4a	  mvp $4a,$a2
$16:91ba  f0 b0		 beq $916c
$16:91bc  ad 48 0e	  lda $0e48
$16:91bf  15 8a		 ora $8a,x
$16:91c1  dd 36 b5	  cmp $b536,x
$16:91c4  64 64		 stz $64
$16:91c6  02 bc		 cop #$bc
$16:91c8  26 e3		 rol $e3
$16:91ca  65 0c		 adc $0c
$16:91cc  80 78		 bra $9246
$16:91ce  44 03 38	  mvp $38,$03
$16:91d1  12 29		 ora ($29)
$16:91d3  5c 8c 20 af   jml $af208c
$16:91d7  03 09		 ora $09,s
$16:91d9  cd cc 27	  cmp $27cc
$16:91dc  20 38 82	  jsr $8238
$16:91df  bc 0e 27	  ldy $270e,x
$16:91e2  33 38		 and ($38,s),y
$16:91e4  9c 68 fb	  stz $fb68
$16:91e7  ca			dex
$16:91e8  20 a4 50	  jsr $50a4
$16:91eb  4e 54 b1	  lsr $b154
$16:91ee  09 ec c5	  ora #$c5ec
$16:91f1  04 32		 tsb $32
$16:91f3  64 11		 stz $11
$16:91f5  21 09		 and ($09,x)
$16:91f7  82 14 59	  brl $eb0e
$16:91fa  ca			dex
$16:91fb  48			pha
$16:91fc  64 c9		 stz $c9
$16:91fe  22 4a 13 44   jsl $44134a
$16:9202  18			clc
$16:9203  c7 26		 cmp [$26]
$16:9205  12 9a		 ora ($9a)
$16:9207  94 53		 sty $53,x
$16:9209  fe b0 f9	  inc $f9b0,x
$16:920c  2c 8a 52	  bit $528a
$16:920f  d3 09		 cmp ($09,s),y
$16:9211  2c a1 ae	  bit $aea1
$16:9214  4d 51 80	  eor $8051
$16:9217  69 e6 11	  adc #$11e6
$16:921a  89 63 8c	  bit #$8c63
$16:921d  26 12		 rol $12
$16:921f  a7 39		 lda [$39]
$16:9221  39 46 9b	  and $9b46,y
$16:9224  5f 5a 04 24   eor $24045a,x
$16:9228  be 70 76	  ldx $7670,y
$16:922b  01 d6		 ora ($d6,x)
$16:922d  45 a0		 eor $a0
$16:922f  f2 0b		 sbc ($0b)
$16:9231  04 28		 tsb $28
$16:9233  d6 36		 dec $36,x
$16:9235  06 01		 asl $01
$16:9237  8a			txa
$16:9238  06 43		 asl $43
$16:923a  11 b0		 ora ($b0),y
$16:923c  c4 8d		 cpy $8d
$16:923e  63 61		 adc $61,s
$16:9240  89 8d 1e	  bit #$1e8d
$16:9243  6e ce 03	  ror $03ce
$16:9246  58			cli
$16:9247  09 00 16	  ora #$1600
$16:924a  b2 29		 lda ($29)
$16:924c  04 e0		 tsb $e0
$16:924e  92 43		 sta ($43)
$16:9250  43 90		 eor $90,s
$16:9252  4d c6 c1	  eor $c1c6
$16:9255  24 8e		 bit $8e
$16:9257  16 50		 asl $50,x
$16:9259  8c 73 32	  sty $3273
$16:925c  30 c7		 bmi $9225
$16:925e  4d e0 54	  eor $54e0
$16:9261  70 b0		 bvs $9213
$16:9263  97 c8		 sta [$c8],y
$16:9265  a8			tay
$16:9266  f4 13 78	  pea $7813
$16:9269  4f 1e a2 54   eor $54a21e
$16:926d  08			php
$16:926e  24 28		 bit $28
$16:9270  f2 73		 sbc ($73)
$16:9272  13 f8		 ora ($f8,s),y
$16:9274  4f a0 46 42   eor $4246a0
$16:9278  81 c4		 sta ($c4,x)
$16:927a  91 27		 sta ($27),y
$16:927c  39 47 85	  and $8547,y
$16:927f  1a			inc a
$16:9280  02 f7		 cop #$f7
$16:9282  18			clc
$16:9283  20 29 96	  jsr $9629
$16:9286  63 09		 adc $09,s
$16:9288  7b			tdc
$16:9289  8c 0c 35	  sty $350c
$16:928c  0a			asl a
$16:928d  23 4c		 and $4c,s
$16:928f  42 c6		 wdm #$c6
$16:9291  86 41		 stx $41
$16:9293  28			plp
$16:9294  67 84		 adc [$84]
$16:9296  96 13		 stx $13,y
$16:9298  00 80		 brk #$80
$16:929a  41 e6		 eor ($e6,x)
$16:929c  42 93		 wdm #$93
$16:929e  8c 47 25	  sty $2547
$16:92a1  4d f0 98	  eor $98f0
$16:92a4  69 5a 83	  adc #$835a
$16:92a7  0b			phd
$16:92a8  6c 93 70	  jmp ($7093)
$16:92ab  21 2e		 and ($2e,x)
$16:92ad  a3 80		 lda $80,s
$16:92af  39 d1 e2	  and $e2d1,y
$16:92b2  4e ff 00	  lsr $00ff
$16:92b5  24 8a		 bit $8a
$16:92b7  40			rti
$16:92b8  17 01		 ora [$01],y
$16:92ba  f8			sed
$16:92bb  49 1f a7	  eor #$a71f
$16:92be  37 9a		 and [$9a],y
$16:92c0  01 01		 ora ($01,x)
$16:92c2  ba			tsx
$16:92c3  11 a8		 ora ($a8),y
$16:92c5  d1 3c		 cmp ($3c),y
$16:92c7  63 b0		 adc $b0,s
$16:92c9  09 1b 64	  ora #$641b
$16:92cc  27 10		 and [$10]
$16:92ce  97 30		 sta [$30],y
$16:92d0  3b			tsc
$16:92d1  42 0e		 wdm #$0e
$16:92d3  38			sec
$16:92d4  48			pha
$16:92d5  db			stp
$16:92d6  ac 86 92	  ldy $9286
$16:92d9  e7 17		 sbc [$17]
$16:92db  68			pla
$16:92dc  58			cli
$16:92dd  08			php
$16:92de  b7 21		 lda [$21],y
$16:92e0  88			dey
$16:92e1  d8			cld
$16:92e2  62 64 6a	  per $fd49
$16:92e5  10 09		 bpl $92f0
$16:92e7  04 87		 tsb $87
$16:92e9  09 13 6c	  ora #$6c13
$16:92ec  80 58		 bra $9346
$16:92ee  27 12		 and [$12]
$16:92f0  37 68		 and [$68],y
$16:92f2  42 a0		 wdm #$a0
$16:92f4  43 83		 eor $83,s
$16:92f6  6d 1c 6a	  adc $6a1c
$16:92f9  36 62		 rol $62,x
$16:92fb  08			php
$16:92fc  94 05		 sty $05,x
$16:92fe  10 61		 bpl $9361
$16:9300  61 0e		 adc ($0e,x)
$16:9302  01 79		 ora ($79,x)
$16:9304  13 00		 ora ($00,s),y
$16:9306  38			sec
$16:9307  16 e8		 asl $e8,x
$16:9309  47 63		 eor [$63]
$16:930b  a6 d5		 ldx $d5
$16:930d  1b			tcs
$16:930e  1a			inc a
$16:930f  88			dey
$16:9310  4d 8c 36	  eor $368c
$16:9313  38			sec
$16:9314  d1 aa		 cmp ($aa),y
$16:9316  66 83		 ror $83
$16:9318  85 36		 sta $36
$16:931a  a8			tay
$16:931b  c8			iny
$16:931c  21 4e		 and ($4e,x)
$16:931e  c0 80 3b	  cpy #$3b80
$16:9321  c2 32		 rep #$32
$16:9323  28			plp
$16:9324  01 f8		 ora ($f8,x)
$16:9326  a4 46		 ldy $46
$16:9328  32 ef		 and ($ef)
$16:932a  17 78		 ora [$78],y
$16:932c  9b			txy
$16:932d  14 6c		 trb $6c
$16:932f  2e f1 a4	  rol $a4f1
$16:9332  60			rts
$16:9333  82 06 80	  brl $133c
$16:9336  19 20 40	  ora $4020,y
$16:9339  ea			nop
$16:933a  58			cli
$16:933b  8c 30 84	  sty $8430
$16:933e  a5 69		 lda $69
$16:9340  10 95		 bpl $92d7
$16:9342  88			dey
$16:9343  4e a5 90	  lsr $90a5
$16:9346  c7 66		 cmp [$66]
$16:9348  33 38		 and ($38,s),y
$16:934a  ec 70 98	  cpx $9870
$16:934d  86 25		 stx $25
$16:934f  3f a9 62 ad   and $ad62a9,x
$16:9353  5a			phy
$16:9354  0d 0d ab	  ora $ab0d
$16:9357  3b			tsc
$16:9358  2b			pld
$16:9359  86 45		 stx $45
$16:935b  25 64		 and $64
$16:935d  11 95		 ora ($95),y
$16:935f  d1 c7		 cmp ($c7),y
$16:9361  e1 0c		 sbc ($0c,x)
$16:9363  28			plp
$16:9364  8e 90 8c	  stx $8c90
$16:9367  64 71		 stz $71
$16:9369  bf 93 c6 ff   lda $ffc693,x
$16:936d  79 bc df	  adc $dfbc,y
$16:9370  88			dey
$16:9371  c4 51		 cpy $51
$16:9373  08			php
$16:9374  a5 de		 lda $de
$16:9376  f8			sed
$16:9377  4f 1b e5 a2   eor $a2e51b
$16:937b  d7 80		 cmp [$80],y
$16:937d  33 2d		 and ($2d,s),y
$16:937f  bc dd 37	  ldy $37dd,x
$16:9382  73 53		 adc ($53,s),y
$16:9384  dc 2e 67	  jml [$672e]
$16:9387  51 4b		 eor ($4b),y
$16:9389  a2 39 91	  ldx #$9139
$16:938c  22 99 7b dd   jsl $dd7b99
$16:9390  ea			nop
$16:9391  f5 7d		 sbc $7d,x
$16:9393  4b			phk
$16:9394  aa			tax
$16:9395  74 ae		 stz $ae,x
$16:9397  ac 1a bd	  ldy $bd1a
$16:939a  e5 b2		 sbc $b2
$16:939c  59 16 8d	  eor $8d16,y
$16:939f  80 85		 bra $9326
$16:93a1  bf 70 08 5c   lda $5c0870,x
$16:93a5  81 e2		 sta ($e2,x)
$16:93a7  13 77		 ora ($77,s),y
$16:93a9  88			dey
$16:93aa  bc ca 46	  ldy $46ca,x
$16:93ad  16 08		 asl $08,x
$16:93af  04 68		 tsb $68
$16:93b1  00 33		 brk #$33
$16:93b3  30 02		 bmi $93b7
$16:93b5  c6 df		 dec $df
$16:93b7  a1 82		 lda ($82,x)
$16:93b9  07 a4		 ora [$a4]
$16:93bb  f2 01		 sbc ($01)
$16:93bd  00 6f		 brk #$6f
$16:93bf  8c 2d fa	  sty $fa2d
$16:93c2  18			clc
$16:93c3  60			rts
$16:93c4  f9 e1 f0	  sbc $f0e1,y
$16:93c7  21 76		 and ($76,x)
$16:93c9  97 59		 sta [$59],y
$16:93cb  71 d9		 adc ($d9),y
$16:93cd  8c ce 3b	  sty $3bce
$16:93d0  1e 26 79	  asl $7926,x
$16:93d3  7c 22 57	  jmp ($5722,x)
$16:93d6  a0 d0 e7	  ldy #$e7d0
$16:93d9  70 a2		 bvs $937d
$16:93db  61 82		 adc ($82,x)
$16:93dd  42 a1		 wdm #$a1
$16:93df  41 c1		 eor ($c1,x)
$16:93e1  32 14		 and ($14)
$16:93e3  33 48		 and ($48,s),y
$16:93e5  45 28		 eor $28
$16:93e7  1c 4a 25	  trb $254a
$16:93ea  13 7e		 ora ($7e,s),y
$16:93ec  85 e1		 sta $e1
$16:93ee  4a			lsr a
$16:93ef  51 42		 eor ($42),y
$16:93f1  29 07 04	  and #$0407
$16:93f4  d4 25		 pei ($25)
$16:93f6  f0 b7		 beq $93af
$16:93f8  98			tya
$16:93f9  b4 c2		 ldy $c2,x
$16:93fb  d3 29		 cmp ($29,s),y
$16:93fd  b9 ad 17	  lda $17ad,y
$16:9400  42 64		 wdm #$64
$16:9402  49 c2 2f	  eor #$2fc2
$16:9405  4d 4a 91	  eor $914a
$16:9408  12 21		 ora ($21)
$16:940a  c2 df		 rep #$df
$16:940c  82 fd 0b	  brl $a00c
$16:940f  d5 f6		 cmp $f6,x
$16:9411  ea			nop
$16:9412  c1 02		 cmp ($02,x)
$16:9414  a1 c6		 lda ($c6,x)
$16:9416  63 6f		 adc $6f,s
$16:9418  52 c8		 eor ($c8)
$16:941a  b3 cf		 lda ($cf,s),y
$16:941c  26 ee		 rol $ee
$16:941e  00 c0		 brk #$c0
$16:9420  46 40		 lsr $40
$16:9422  04 19		 tsb $19
$16:9424  16 f9		 asl $f9,x
$16:9426  85 c1		 sta $c1
$16:9428  ce 92 26	  dec $2692
$16:942b  68			pla
$16:942c  49 21 21	  eor #$2121
$16:942f  71 3c		 adc ($3c),y
$16:9431  a4 62		 ldy $62
$16:9433  13 18		 ora ($18,s),y
$16:9435  8e 36 c2	  stx $c236
$16:9438  3a			dec a
$16:9439  f4 79 0c	  pea $0c79
$16:943c  45 fa		 eor $fa
$16:943e  0e 43 1d	  asl $1d43
$16:9441  90 60		 bcc $94a3
$16:9443  c1 ec		 cmp ($ec,x)
$16:9445  89 40 ec	  bit #$ec40
$16:9448  05 e2		 ora $e2
$16:944a  15 60		 ora $60,x
$16:944c  85 15		 sta $15
$16:944e  c2 14		 rep #$14
$16:9450  37 60		 and [$60],y
$16:9452  68			pla
$16:9453  44 ac 31	  mvp $31,$ac
$16:9456  27 60		 and [$60]
$16:9458  44 a2 61	  mvp $61,$a2
$16:945b  82 aa 55	  brl $ea08
$16:945e  43 04		 eor $04,s
$16:9460  8a			txa
$16:9461  07 60		 ora [$60]
$16:9463  06 12		 asl $12
$16:9465  9d 62 ab	  sta $ab62,x
$16:9468  06 05		 asl $05
$16:946a  34 06		 bit $06,x
$16:946c  46 ae		 lsr $ae
$16:946e  cb			wai
$16:946f  65 a1		 adc $a1
$16:9471  83 32		 sta $32,s
$16:9473  2d 52 c7	  and $c752
$16:9476  4d a6 9f	  eor $9fa6
$16:9479  e8			inx
$16:947a  f8			sed
$16:947b  32 d7		 and ($d7)
$16:947d  78			sei
$16:947e  c8			iny
$16:947f  26 ee		 rol $ee
$16:9481  c0 5d 1d	  cpy #$1d5d
$16:9484  4e b6 8d	  lsr $8db6
$16:9487  07 f9		 ora [$f9]
$16:9489  4c dd 80	  jmp $80dd
$16:948c  ca			dex
$16:948d  15 30		 ora $30,x
$16:948f  d3 8f		 cmp ($8f,s),y
$16:9491  a0 f2 07	  ldy #$07f2
$16:9494  21 b6		 and ($b6,x)
$16:9496  86 36		 stx $36
$16:9498  0b			phd
$16:9499  0a			asl a
$16:949a  e2 34		 sep #$34
$16:949c  00 40		 brk #$40
$16:949e  11 46		 ora ($46),y
$16:94a0  08			php
$16:94a1  42 ea		 wdm #$ea
$16:94a3  95 7b		 sta $7b,x
$16:94a5  19 f4 16	  ora $16f4,y
$16:94a8  80 df		 bra $9489
$16:94aa  36 b1		 rol $b1,x
$16:94ac  53 91		 eor ($91,s),y
$16:94ae  a0 8d		 ldy #$8d
$16:94b0  08			php
$16:94b1  53 bc		 eor ($bc,s),y
$16:94b3  08			php
$16:94b4  40			rti
$16:94b5  46 40		 lsr $40
$16:94b7  68			pla
$16:94b8  5d 1f 81	  eor $811f,x
$16:94bb  12 7f		 ora ($7f)
$16:94bd  81 48		 sta ($48,x)
$16:94bf  0a			asl a
$16:94c0  c7 54		 cmp [$54]
$16:94c2  ab			plb
$16:94c3  23 05		 and $05,s
$16:94c5  1c 42 83	  trb $8342
$16:94c8  6d 1a 70	  adc $701a
$16:94cb  4d e6 69	  eor $69e6
$16:94ce  27 59		 and [$59]
$16:94d0  03 10		 ora $10,s
$16:94d2  0c 81 a3	  tsb $a381
$16:94d5  3e aa 68	  rol $68aa,x
$16:94d8  05 0a		 ora $0a
$16:94da  8d 40 bb	  sta $bb40
$16:94dd  06 8a		 asl $8a
$16:94df  ad 55 54	  lda $5455
$16:94e2  a1 19		 lda ($19,x)
$16:94e4  a5 b5		 lda $b5
$16:94e6  e4 50		 cpx $50
$16:94e8  55 57		 eor $57,x
$16:94ea  82 56 6a	  brl $ff43
$16:94ed  6d 88 14	  adc $1488
$16:94f0  16 20		 asl $20,x
$16:94f2  59 1a 19	  eor $191a,y
$16:94f5  1f a6 58 44   ora $4458a6,x
$16:94f9  fa			plx
$16:94fa  6b			rtl
$16:94fb  d5 7e		 cmp $7e,x
$16:94fd  bc f0 68	  ldy $68f0,x
$16:9500  00 00		 brk #$00
$16:9502  20 9f cf	  jsr $cf9f
$16:9505  e0 10		 cpx #$10
$16:9507  07 80		 ora [$80]
$16:9509  bc 42 0f	  ldy $0f42,x
$16:950c  07 86		 ora [$86]
$16:950e  43 21		 eor $21,s
$16:9510  0f c0 78 13   ora $1378c0
$16:9514  c0 1e		 cpy #$1e
$16:9516  01 38		 ora ($38,x)
$16:9518  80 4c		 bra $9566
$16:951a  e0 13		 cpx #$13
$16:951c  70 50		 bvs $956e
$16:951e  ff ff ef 10   sbc $10efff,x
$16:9522  08			php
$16:9523  0b			phd
$16:9524  c4 38		 cpy $38
$16:9526  74 3f		 stz $3f,x
$16:9528  35 1a		 and $1a,x
$16:952a  48			pha
$16:952b  1c 00 81	  trb $8100
$16:952e  04 00		 tsb $00
$16:9530  20 13 c8	  jsr $c813
$16:9533  06 66		 asl $66
$16:9535  01 db		 ora ($db,x)
$16:9537  15 0f		 ora $0f,x
$16:9539  f3 f8		 sbc ($f8,s),y
$16:953b  f1 01		 sbc ($01),y
$16:953d  80 41		 bra $9580
$16:953f  1e 21 e0	  asl $e021,x
$16:9542  d0 5c		 bne $95a0
$16:9544  24 11		 bit $11
$16:9546  01 e0		 ora ($e0,x)
$16:9548  0c 08 60	  tsb $6008
$16:954b  03 00		 ora $00,s
$16:954d  8e 40 39	  stx $3940
$16:9550  90 0f		 bcc $9561
$16:9552  61 28		 adc ($28,x)
$16:9554  6c 16 0c	  jmp ($0c16)
$16:9557  86 42		 stx $42
$16:9559  91 08		 sta ($08),y
$16:955b  92 41		 sta ($41)
$16:955d  22 70 39 24   jsl $243970
$16:9561  82 c5 70	  brl $0629
$16:9564  b4 d6		 ldy $d6,x
$16:9566  2c 10 0c	  bit $0c10
$16:9569  85 83		 sta $83
$16:956b  91 30		 sta ($30),y
$16:956d  f2 46		 sbc ($46)
$16:956f  3e 70 ce	  rol $ce70,x
$16:9572  e4 0f		 cpx $0f
$16:9574  1d 01 db	  ora $db01,x
$16:9577  bd 08 dc	  lda $dc08,x
$16:957a  b8			clv
$16:957b  0c 05 02	  tsb $0205
$16:957e  80 ed		 bra $956d
$16:9580  03 7c		 ora $7c,s
$16:9582  c0 28		 cpy #$28
$16:9584  18			clc
$16:9585  09 07		 ora #$07
$16:9587  01 e8		 ora ($e8,x)
$16:9589  5c 0e 01 e4   jml $e4010e
$16:958d  12 ac		 ora ($ac)
$16:958f  f4 2a 01	  pea $012a
$16:9592  e0 11		 cpx #$11
$16:9594  60			rts
$16:9595  a6 53		 ldx $53
$16:9597  74 ae		 stz $ae,x
$16:9599  7d e8 41	  adc $41e8,x
$16:959c  00 f6		 brk #$f6
$16:959e  d7 b6		 cmp [$b6],y
$16:95a0  31 4d		 and ($4d),y
$16:95a2  0c 43 63	  tsb $6343
$16:95a5  10 f2		 bpl $9599
$16:95a7  d5 34		 cmp $34,x
$16:95a9  2d 41 7a	  and $7a41
$16:95ac  0d fa 95	  ora $95fa
$16:95af  7e a7 39	  ror $39a7,x
$16:95b2  06 14		 asl $14
$16:95b4  e2 0a		 sep #$0a
$16:95b6  f3 94		 sbc ($94,s),y
$16:95b8  10 c2		 bpl $957c
$16:95ba  ef 78 0b e8   sbc $e80b78
$16:95be  1f a0 fa 20   ora $20faa0,x
$16:95c2  04 d0		 tsb $d0
$16:95c4  1d ea 89	  ora $89ea,x
$16:95c7  04 48		 tsb $48
$16:95c9  69 b3		 adc #$b3
$16:95cb  d5 c9		 cmp $c9,x
$16:95cd  57 01		 eor [$01],y
$16:95cf  24 02		 bit $02
$16:95d1  01 0b		 ora ($0b,x)
$16:95d3  90 5c		 bcc $9631
$16:95d5  67 d0		 adc [$d0]
$16:95d7  1f fc 2e 0d   ora $0d2efc,x
$16:95db  1f 8d 43 62   ora $62438d,x
$16:95df  d0 f8		 bne $95d9
$16:95e1  04 6a		 tsb $6a
$16:95e3  39 31 87	  and $8731,y
$16:95e6  5f e6 b5 ea   eor $eab5e6,x
$16:95ea  5c 00 6a 11   jml $116a00
$16:95ee  f8			sed
$16:95ef  04 79		 tsb $79
$16:95f1  0c 12 19	  tsb $1912
$16:95f4  f5 02		 sbc $02,x
$16:95f6  ff 00 bf c8   sbc $c8bf00,x
$16:95fa  2f e7 90 e5   and $e590e7
$16:95fe  66 ab		 ror $ab
$16:9600  da			phx
$16:9601  1e ec f3	  asl $f3ec,x
$16:9604  7d 60 bc	  adc $bc60,x
$16:9607  46 ab		 lsr $ab
$16:9609  d2 2d		 cmp ($2d)
$16:960b  d5 60		 cmp $60,x
$16:960d  30 10		 bmi $961f
$16:960f  4e f4 03	  lsr $03f4
$16:9612  7f 02 ff c0   adc $c0ff02,x
$16:9616  6f f8 4b f7   adc $f74bf8
$16:961a  06 7f		 asl $7f
$16:961c  00 fd		 brk #$fd
$16:961e  33 c0		 and ($c0,s),y
$16:9620  32 1b		 and ($1b)
$16:9622  f9 f9 cc	  sbc $ccf9,y
$16:9625  34 12		 bit $12,x
$16:9627  03 b9		 ora $b9,s
$16:9629  1c c1 be	  trb $bec1
$16:962c  37 f0		 and [$f0],y
$16:962e  70 d0		 bvs $9600
$16:9630  24 15		 bit $15
$16:9632  f4 39 4f	  pea $4f39
$16:9635  e8			inx
$16:9636  0c f0 66	  tsb $66f0
$16:9639  8a			txa
$16:963a  4c 59 2a	  jmp $2a59
$16:963d  8f 36 52 aa   sta $aa5236
$16:9641  05 50		 ora $50
$16:9643  49 1f		 eor #$1f
$16:9645  51 6b		 eor ($6b),y
$16:9647  ec 3f 3f	  cpx $3f3f
$16:964a  cf 8f f2 13   cmp $13f28f
$16:964e  0c 6b 93	  tsb $936b
$16:9651  4c 1f 03	  jmp $031f
$16:9654  fe 80 40	  inc $4080,x
$16:9657  9c 61 08	  stz $0861
$16:965a  f9 39 cb	  sbc $cb39,y
$16:965d  f0 e6		 beq $9645
$16:965f  07 78		 ora [$78]
$16:9661  c2 61		 rep #$61
$16:9663  10 b8		 bpl $961d
$16:9665  44 3a 11	  mvp $11,$3a
$16:9668  0c 84 46	  tsb $4684
$16:966b  61 10		 adc ($10,x)
$16:966d  a8			tay
$16:966e  44 de 00	  mvp $00,$de
$16:9671  ff c8 24 93   sbc $9324c8,x
$16:9675  48			pha
$16:9676  10 19		 bpl $9691
$16:9678  2c 92 4f	  bit $4f92
$16:967b  24 d3		 bit $d3
$16:967d  49 25 81	  eor #$8125
$16:9680  41 ed		 eor ($ed,x)
$16:9682  c0 03		 cpy #$03
$16:9684  f9 00 88	  sbc $8800,y
$16:9687  54 22 1d	  mvn $1d,$22
$16:968a  08			php
$16:968b  86 42		 stx $42
$16:968d  20 36 01	  jsr $0136
$16:9690  88			dey
$16:9691  0d 4b d9	  ora $d94b
$16:9694  00 1f		 brk #$1f
$16:9696  e5 22		 sbc $22
$16:9698  89 4c a2	  bit #$a24c
$16:969b  14 82		 trb $82
$16:969d  9b			txy
$16:969e  45 aa		 eor $aa
$16:96a0  d1 6e		 cmp ($6e),y
$16:96a2  b4 5f		 ldy $5f,x
$16:96a4  2d 14 b8	  and $b814
$16:96a7  1b			tcs
$16:96a8  b8			clv
$16:96a9  01 7c		 ora ($7c,x)
$16:96ab  b7 46		 lda [$46],y
$16:96ad  47 cc		 eor [$cc]
$16:96af  46 24		 lsr $24
$16:96b1  90 4c		 bcc $96ff
$16:96b3  96 0b		 stx $0b,y
$16:96b5  11 c0		 ora ($c0),y
$16:96b7  c7 71		 cmp [$71]
$16:96b9  b5 d6		 lda $d6,x
$16:96bb  69 74 5a	  adc #$5a74
$16:96be  7d 16 cc	  adc $cc16,x
$16:96c1  58			cli
$16:96c2  3c 91 8b	  bit $8b91,x
$16:96c5  94 32		 sty $32,x
$16:96c7  71 06		 adc ($06),y
$16:96c9  9e 40 3b	  stz $3b40,x
$16:96cc  84 03		 sty $03
$16:96ce  c0 23		 cpy #$23
$16:96d0  fa			plx
$16:96d1  80 9f		 bra $9672
$16:96d3  a8			tay
$16:96d4  02 b0		 cop #$b0
$16:96d6  15 fe		 ora $fe,x
$16:96d8  be cd cc	  ldx $cccd,y
$16:96db  23 c3		 and $c3,s
$16:96dd  50 67		 bvc $9746
$16:96df  83 3c		 sta $3c,s
$16:96e1  bd 35 8d	  lda $8d35,x
$16:96e4  4c 63 67	  jmp $6763
$16:96e7  02 a3		 cop #$a3
$16:96e9  57 a1		 eor [$a1],y
$16:96eb  d5 e6		 cmp $e6,x
$16:96ed  f8			sed
$16:96ee  37 c6		 and [$c6],y
$16:96f0  fd 06 71	  sbc $7106,x
$16:96f3  0d 32 bd	  ora $bd32
$16:96f6  01 80		 ora ($80,x)
$16:96f8  4c 67 33	  jmp $3367
$16:96fb  98			tya
$16:96fc  c5 76		 cmp $76
$16:96fe  11 3d		 ora ($3d),y
$16:9700  88			dey
$16:9701  42 e0		 wdm #$e0
$16:9703  31 78		 and ($78),y
$16:9705  54 9a 20	  mvn $20,$9a
$16:9708  ef 08 0c e2   sbc $e20c08
$16:970c  87 7c		 sta [$7c]
$16:970e  90 de		 bcc $96ee
$16:9710  a8			tay
$16:9711  37 a8		 and [$a8],y
$16:9713  bc 42 1f	  ldy $1f42,x
$16:9716  0c 8d 44	  tsb $448d
$16:9719  69 d7 4b	  adc #$4bd7
$16:971c  d5 5b		 cmp $5b,x
$16:971e  59 98 90	  eor $9098,y
$16:9721  48			pha
$16:9722  34 18		 bit $18,x
$16:9724  0a			asl a
$16:9725  85 03		 sta $03
$16:9727  51 90		 eor ($90),y
$16:9729  b2 42		 lda ($42)
$16:972b  20 1f e0	  jsr $e01f
$16:972e  f8			sed
$16:972f  70 af		 bvs $96e0
$16:9731  d6 8c		 dec $8c,x
$16:9733  42 7c		 wdm #$7c
$16:9735  2c 18 0d	  bit $0d18
$16:9738  85 c2		 sta $c2
$16:973a  b1 88		 lda ($88),y
$16:973c  97 c6		 sta [$c6],y
$16:973e  a0 f0		 ldy #$f0
$16:9740  a8			tay
$16:9741  cc 42 05	  cpy $0542
$16:9744  02 5f		 cop #$5f
$16:9746  35 02		 and $02,x
$16:9748  ff 10 8f c0   sbc $c08f10,x
$16:974c  a3 71		 lda $71,s
$16:974e  18			clc
$16:974f  90 d5		 bcc $9726
$16:9751  b9 94 41	  lda $4194,y
$16:9754  e8			inx
$16:9755  ab			plb
$16:9756  ab			plb
$16:9757  99 c0 50	  sta $50c0,y
$16:975a  09 84 17	  ora #$1784
$16:975d  cd 80 80	  cmp $8080
$16:9760  7f e0 1c 04   adc $041ce0,x
$16:9764  70 4f		 bvs $97b5
$16:9766  f9 66 40	  sbc $4066,y
$16:9769  a7 70		 lda [$70]
$16:976b  2a			rol a
$16:976c  bd aa 8c	  lda $8caa,x
$16:976f  02 ff		 cop #$ff
$16:9771  7f 3f 82 b4   adc $b4823f,x
$16:9775  67 ef		 adc [$ef]
$16:9777  00 80		 brk #$80
$16:9779  4b			phk
$16:977a  91 42		 sta ($42),y
$16:977c  cc 03 88	  cpy $8803
$16:977f  23 8a		 and $8a,s
$16:9781  71 87		 adc ($87),y
$16:9783  c0 ce		 cpy #$ce
$16:9785  30 35		 bmi $97bc
$16:9787  4b			phk
$16:9788  49 40 3f	  eor #$3f40
$16:978b  e7 10		 sbc [$10]
$16:978d  48			pha
$16:978e  91 c4		 sta ($c4),y
$16:9790  38			sec
$16:9791  f0 0d		 beq $97a0
$16:9793  da			phx
$16:9794  a8			tay
$16:9795  51 ed		 eor ($ed),y
$16:9797  96 c0		 stx $c0,y
$16:9799  e0 73		 cpx #$73
$16:979b  98			tya
$16:979c  1d 56 d3	  ora $d356,x
$16:979f  44 9f 64	  mvp $64,$9f
$16:97a2  08			php
$16:97a3  58			cli
$16:97a4  e0 15		 cpx #$15
$16:97a6  d6 50		 dec $50,x
$16:97a8  bb			tyx
$16:97a9  c0 e2		 cpy #$e2
$16:97ab  0f f1 fe 5c   ora $5cfef1
$16:97af  61 d0		 adc ($d0,x)
$16:97b1  3b			tsc
$16:97b2  84 0f		 sty $0f
$16:97b4  51 d3		 eor ($d3),y
$16:97b6  c4 07		 cpy $07
$16:97b8  c0 40		 cpy #$40
$16:97ba  30 01		 bmi $97bd
$16:97bc  b0 08		 bcs $97c6
$16:97be  03 1d		 ora $1d,s
$16:97c0  00 bb		 brk #$bb
$16:97c2  3a			dec a
$16:97c3  86 39		 stx $39
$16:97c5  08			php
$16:97c6  88			dey
$16:97c7  42 20		 wdm #$20
$16:97c9  90 f8		 bcc $97c3
$16:97cb  4c 18 d8	  jmp $d818
$16:97ce  30 78		 bmi $9848
$16:97d0  3c 32 1b	  bit $1b32,x
$16:97d3  08			php
$16:97d4  9b			txy
$16:97d5  c0 1f		 cpy #$1f
$16:97d7  e1 38		 sbc ($38,x)
$16:97d9  43 0a		 eor $0a,s
$16:97db  1c 00 61	  trb $6100
$16:97de  33 00		 and ($00,s),y
$16:97e0  0c ba 49	  tsb $49ba
$16:97e3  28			plp
$16:97e4  92 78		 sta ($78)
$16:97e6  b8			clv
$16:97e7  fc 48 19	  jsr ($1948,x)
$16:97ea  b0 78		 bcs $9864
$16:97ec  74 3f		 stz $3f,x
$16:97ee  35 1a		 and $1a,x
$16:97f0  49 db 80	  eor #$80db
$16:97f3  07 c2		 ora [$c2]
$16:97f5  78			sei
$16:97f6  70 13		 bvs $980b
$16:97f8  88			dey
$16:97f9  08			php
$16:97fa  c3 32		 cmp $32,s
$16:97fc  20 1b 85	  jsr $851b
$16:97ff  c2 c1		 rep #$c1
$16:9801  50 32		 bvc $9835
$16:9803  07 62		 ora [$62]
$16:9805  11 28		 ora ($28),y
$16:9807  9c 4e 3d	  stz $3d4e
$16:980a  11 8e		 ora ($8e),y
$16:980c  c7 22		 cmp [$22]
$16:980e  f1 8c		 sbc ($8c),y
$16:9810  80 6f		 bra $9881
$16:9812  04 43		 tsb $43
$16:9814  fc 8c 77	  jsr ($778c,x)
$16:9817  23 11		 and $11,s
$16:9819  c8			iny
$16:981a  c6 b2		 dec $b2
$16:981c  11 8c		 ora ($8c),y
$16:981e  84 75		 sty $75
$16:9820  68			pla
$16:9821  be 5a 29	  ldx $295a,y
$16:9824  48			pha
$16:9825  24 b6		 bit $b6
$16:9827  59 dc 66	  eor $66dc,y
$16:982a  03 01		 ora $01,s
$16:982c  91 c8		 sta ($c8),y
$16:982e  68			pla
$16:982f  77 1d		 adc [$1d],y
$16:9831  d4 00		 pei ($00)
$16:9833  be 5d a8	  ldx $a85d,y
$16:9836  07 99		 ora [$99]
$16:9838  cc 3d e7	  cpy $e73d
$16:983b  40			rti
$16:983c  c5 a2		 cmp $a2
$16:983e  d3 e8		 cmp ($e8,s),y
$16:9840  b5 5a		 lda $5a,x
$16:9842  2d 9e 37	  and $379e
$16:9845  81 c8		 sta ($c8,x)
$16:9847  72 c7		 adc ($c7)
$16:9849  61 f6		 adc ($f6,x)
$16:984b  40			rti
$16:984c  0f f9 c0 47   ora $47c0f9
$16:9850  ed 02 00	  sbc $0002
$16:9853  9f c5 77 af   sta $af77c5,x
$16:9857  b7 d7		 lda [$d7],y
$16:9859  5a			phy
$16:985a  fa			plx
$16:985b  c3 bf		 cmp $bf,s
$16:985d  70 66		 bvs $98c5
$16:985f  98			tya
$16:9860  7f 60 4d 52   adc $524d60,x
$16:9864  6b			rtl
$16:9865  84 12		 sty $12
$16:9867  bd 00 70	  lda $7000,x
$16:986a  04 79		 tsb $79
$16:986c  c6 6e		 dec $6e
$16:986e  02 af		 cop #$af
$16:9870  49 e2 0e	  eor #$0ee2
$16:9873  f0 99		 beq $980e
$16:9875  c2 22		 rep #$22
$16:9877  30 70		 bmi $98e9
$16:9879  58			cli
$16:987a  4d a0 33	  eor $33a0
$16:987d  a8			tay
$16:987e  0c 7e 01	  tsb $017e
$16:9881  1b			tcs
$16:9882  88			dey
$16:9883  46 62		 lsr $62
$16:9885  04 90		 tsb $90
$16:9887  87 c1		 sta [$c1]
$16:9889  e1 f0		 sbc ($f0,x)
$16:988b  30 28		 bmi $98b5
$16:988d  41 e0		 eor ($e0,x)
$16:988f  6b			rtl
$16:9890  e0 f2		 cpx #$f2
$16:9892  42 3f		 wdm #$3f
$16:9894  90 8f		 bcc $9825
$16:9896  a4 62		 ldy $62
$16:9898  f1 e0		 sbc ($e0),y
$16:989a  e6 10		 inc $10
$16:989c  83 80		 sta $80,s
$16:989e  19 0f c4	  ora $c40f,y
$16:98a1  00 6a		 brk #$6a
$16:98a3  19 88 c0	  ora $c088,y
$16:98a6  e0 3e		 cpx #$3e
$16:98a8  02 50		 cop #$50
$16:98aa  e0 09		 cpx #$09
$16:98ac  43 c1		 eor $c1,s
$16:98ae  e0 5f		 cpx #$5f
$16:98b0  04 3e		 tsb $3e
$16:98b2  1b			tcs
$16:98b3  3b			tsc
$16:98b4  9b			txy
$16:98b5  45 61		 eor $61
$16:98b7  50 f8		 bvc $98b1
$16:98b9  05 5a		 ora $5a
$16:98bb  b1 79		 lda ($79),y
$16:98bd  8b			phb
$16:98be  7f ad bb fc   adc $fcbbad,x
$16:98c2  d0 b8		 bne $987c
$16:98c4  20 13 f8	  jsr $f813
$16:98c7  04 69		 tsb $69
$16:98c9  7c 12 1b	  jmp ($1b12,x)
$16:98cc  f6 03		 inc $03,x
$16:98ce  ff 00 ff d0   sbc $d0ff00,x
$16:98d2  09 41 00	  ora #$0041
$16:98d5  c0 60		 cpy #$60
$16:98d7  20 b9 de	  jsr $deb9
$16:98da  f4 83 59	  pea $5983
$16:98dd  5c af 48 ab   jml $ab48af
$16:98e1  93 8b		 sta ($8b,s),y
$16:98e3  16 21		 asl $21,x
$16:98e5  7c 38 08	  jmp ($0838,x)
$16:98e8  16 7e		 asl $7e,x
$16:98ea  01 be		 ora ($be,x)
$16:98ec  81 5f		 sta ($5f,x)
$16:98ee  b0 37		 bcs $9927
$16:98f0  f0 d0		 beq $98c2
$16:98f2  51 35		 eor ($35),y
$16:98f4  dd 1a 89	  cmp $891a,x
$16:98f7  bc 3b 35	  ldy $353b,x
$16:98fa  1e ed 47	  asl $47ed,x
$16:98fd  af 51 e9 9c   lda $9ce951
$16:9901  87 ab		 sta [$ab]
$16:9903  51 97		 eor ($97),y
$16:9905  40			rti
$16:9906  0f f9 c5 a2   ora $a2c5f9
$16:990a  51 68		 eor ($68),y
$16:990c  94 da		 sty $da,x
$16:990e  25 76		 and $76
$16:9910  89 75 a2	  bit #$a275
$16:9913  59 52 43	  eor $4352,y
$16:9916  55 a2		 eor $a2,x
$16:9918  6e e0 09	  ror $09e0
$16:991b  fc d1 e8	  jsr ($e8d1,x)
$16:991e  96 01		 stx $01,y
$16:9920  b2 d1		 lda ($d1)
$16:9922  6e b4 5a	  ror $5ab4
$16:9925  ed 16 99	  sbc $9916
$16:9928  64 32		 stz $32
$16:992a  ad 15 76	  lda $7615
$16:992d  00 bf		 brk #$bf
$16:992f  cc 5e 21	  cpy $215e
$16:9932  9e 19 bc	  stz $bc19,x
$16:9935  46 ef		 lsr $ef
$16:9937  11 eb		 ora ($eb),y
$16:9939  c4 72		 cpy $72
$16:993b  da			phx
$16:993c  43 ab		 eor $ab,s
$16:993e  c4 5d		 cpy $5d
$16:9940  a0 0d		 ldy #$0d
$16:9942  fc 8d 42	  jsr ($428d,x)
$16:9945  21 90		 and ($90,x)
$16:9947  88			dey
$16:9948  c4 22		 cpy $22
$16:994a  21 08		 and ($08,x)
$16:994c  82 43 e1	  brl $7a92
$16:994f  30 61		 bmi $99b2
$16:9951  68			pla
$16:9952  cf e6 f0 07   cmp $07f0e6
$16:9956  fa			plx
$16:9957  4e 08 22	  lsr $2208
$16:995a  42 01		 wdm #$01
$16:995c  68			pla
$16:995d  4b			phk
$16:995e  64 90		 stz $90
$16:9960  69 24 b2	  adc #$b224
$16:9963  49 28 92	  eor #$9228
$16:9966  78			sei
$16:9967  b8			clv
$16:9968  fc 48 18	  jsr ($1848,x)
$16:996b  b4 3f		 ldy $3f,x
$16:996d  ff fe dc 00   sbc $00dcfe,x
$16:9971  3e 93 c2	  rol $c293,x
$16:9974  58			cli
$16:9975  0a			asl a
$16:9976  04 be		 tsb $be
$16:9978  17 08		 ora [$08],y
$16:997a  c4 02		 cpy $02
$16:997c  20 32 2b	  jsr $2b32
$16:997f  87 83		 sta [$83]
$16:9981  c0 4f		 cpy #$4f
$16:9983  08			php
$16:9984  07 c3		 ora [$c3]
$16:9986  f9 ec 84	  sbc $84ec,y
$16:9989  7b			tdc
$16:998a  20 04 12	  jsr $1204
$16:998d  8e 40 3f	  stx $3f40
$16:9990  84 81		 sty $81
$16:9992  30 07		 bmi $999b
$16:9994  a2 b3		 ldx #$b3
$16:9996  48			pha
$16:9997  a2 77		 ldx #$77
$16:9999  28			plp
$16:999a  9e 44 80	  stz $8044,x
$16:999d  51 64		 eor ($64),y
$16:999f  b6 59		 ldx $59,y
$16:99a1  dc 67 03	  jml [$0367]
$16:99a4  81 db		 sta ($db,x)
$16:99a6  a8			tay
$16:99a7  17 75		 ora [$75],y
$16:99a9  00 ed		 brk #$ed
$16:99ab  40			rti
$16:99ac  3c d0 0b	  bit $0bd0,x
$16:99af  f4 03 2d	  pea $2d03
$16:99b2  96 f3		 stx $f3,y
$16:99b4  59 a0 d0	  eor $d0a0,y
$16:99b7  6c 36 1a	  jmp ($1a36)
$16:99ba  0d c6 d3	  ora $d3c6
$16:99bd  59 a4 d1	  eor $d1a4,y
$16:99c0  6b			rtl
$16:99c1  b4 5a		 ldy $5a,x
$16:99c3  d9 00 ce	  cmp $ce00,y
$16:99c6  12 06		 ora ($06)
$16:99c8  f8			sed
$16:99c9  26 1e		 rol $1e
$16:99cb  e1 08		 sbc ($08,x)
$16:99cd  f8			sed
$16:99ce  08			php
$16:99cf  fd a0 40	  sbc $40a0,x
$16:99d2  13 f8		 ora ($f8,s),y
$16:99d4  ae f5 f6	  ldx $f6f5
$16:99d7  fe 60 cc	  inc $cc60,x
$16:99da  f0 fe		 beq $99da
$16:99dc  c0 9a		 cpy #$9a
$16:99de  61 f5		 adc ($f5,x)
$16:99e0  85 34		 sta $34
$16:99e2  c9 a6 10	  cmp #$10a6
$16:99e5  0a			asl a
$16:99e6  f3 7c		 sbc ($7c,s),y
$16:99e8  ea			nop
$16:99e9  cd f5 ad	  cmp $adf5
$16:99ec  2f 93 00 8e   and $8e0093
$16:99f0  0c 02 3c	  tsb $3c02
$16:99f3  34 91		 bit $91,x
$16:99f5  ca			dex
$16:99f6  e6 a3		 inc $a3
$16:99f8  80 8e		 bra $9988
$16:99fa  00 03		 brk #$03
$16:99fc  e0 27		 cpx #$27
$16:99fe  90 2f		 bcc $9a2f
$16:9a00  f2 b5		 sbc ($b5)
$16:9a02  93 e5		 sta ($e5,s),y
$16:9a04  d4 a5		 pei ($a5)
$16:9a06  eb			xba
$16:9a07  f2 cf		 sbc ($cf)
$16:9a09  fa			plx
$16:9a0a  e0 47		 cpx #$47
$16:9a0c  f0 17		 beq $9a25
$16:9a0e  f8			sed
$16:9a0f  5c 9a 61 32   jml $32619a
$16:9a13  8b			phb
$16:9a14  41 1b		 eor ($1b,x)
$16:9a16  c0 36		 cpy #$36
$16:9a18  6c 86 fe	  jmp ($fe86)
$16:9a1b  0b			phd
$16:9a1c  36 90		 rol $90,x
$16:9a1e  cd a4 b2	  cmp $b2a4
$16:9a21  61 b3		 adc ($b3,x)
$16:9a23  74 32		 stz $32,x
$16:9a25  8f 31 7a 80   sta $807a31
$16:9a29  d9 e8 41	  cmp $41e8,y
$16:9a2c  e0 c0		 cpx #$c0
$16:9a2e  50 0a		 bvc $9a3a
$16:9a30  60			rts
$16:9a31  54 7e 9d	  mvn $9d,$7e
$16:9a34  47 a3		 eor [$a3]
$16:9a36  51 e0		 eor ($e0),y
$16:9a38  9c 87 97	  stz $9787
$16:9a3b  5b			tcd
$16:9a3c  e9 53 bc	  sbc #$bc53
$16:9a3f  54 c1 68	  mvn $68,$c1
$16:9a42  4b			phk
$16:9a43  a0 07		 ldy #$07
$16:9a45  f4 92 40	  pea $4092
$16:9a48  26 30		 rol $30
$16:9a4a  09 f9 70	  ora #$70f9
$16:9a4d  6c b4 4a	  jmp ($4ab4)
$16:9a50  2d 12 0a	  and $0a12
$16:9a53  92 1d		 sta ($1d)
$16:9a55  6d b3 93	  adc $93b3
$16:9a58  38			sec
$16:9a59  c5 cc		 cmp $cc
$16:9a5b  20 1f fd	  jsr $fd1f
$16:9a5e  dc 01 3e	  jml [$3e01]
$16:9a61  99 38 07	  sta $0738,y
$16:9a64  1d 3a 05	  ora $053a,x
$16:9a67  c1 d3		 cmp ($d3,x)
$16:9a69  68			pla
$16:9a6a  a4 5a		 ldy $5a
$16:9a6c  28			plp
$16:9a6d  12 c8		 ora ($c8)
$16:9a6f  62 fb 69	  per $046d
$16:9a72  2e 72 8b	  rol $8b72
$16:9a75  98			tya
$16:9a76  55 05		 eor $05,x
$16:9a78  76 00		 ror $00,x
$16:9a7a  bf 4a 4c 02   lda $024c4a,x
$16:9a7e  c7 00		 cmp [$00]
$16:9a80  bf 97 07 97   lda $970797,x
$16:9a84  88			dey
$16:9a85  c5 e2		 cmp $e2
$16:9a87  21 6d		 and ($6d,x)
$16:9a89  21 ad		 and ($ad,x)
$16:9a8b  f6 32		 inc $32,x
$16:9a8d  77 08		 adc [$08],y
$16:9a8f  bd 82 03	  lda $0382,x
$16:9a92  fe bb 40	  inc $40bb,x
$16:9a95  1b			tcs
$16:9a96  e8			inx
$16:9a97  46 0c		 lsr $0c
$16:9a99  74 03		 stz $03,x
$16:9a9b  fc 11 48	  jsr ($4811,x)
$16:9a9e  04 0e		 tsb $0e
$16:9aa0  0f 05 86 40   ora $408605
$16:9aa4  23 90		 and $90,s
$16:9aa6  c8			iny
$16:9aa7  fc 3a 35	  jsr ($353a,x)
$16:9aaa  0d 8a 3b	  ora $3b8a
$16:9aad  54 08 30	  mvn $30,$08
$16:9ab0  c8			iny
$16:9ab1  64 36		 stz $36
$16:9ab3  18			clc
$16:9ab4  05 07		 ora $07
$16:9ab6  69 60 38	  adc #$3860
$16:9ab9  14 0b		 trb $0b
$16:9abb  04 02		 tsb $02
$16:9abd  e1 60		 sbc ($60,x)
$16:9abf  f8			sed
$16:9ac0  78			sei
$16:9ac1  36 16		 rol $16,x
$16:9ac3  0a			asl a
$16:9ac4  83 b5		 sta $b5,s
$16:9ac6  0a			asl a
$16:9ac7  80 54		 bra $9b1d
$16:9ac9  0b			phd
$16:9aca  00 a4		 brk #$a4
$16:9acc  4a			lsr a
$16:9acd  81 d6		 sta ($d6,x)
$16:9acf  db			stp
$16:9ad0  61 a0		 adc ($a0,x)
$16:9ad2  d6 6a		 dec $6a,x
$16:9ad4  37 1b		 and [$1b],y
$16:9ad6  cd 66 e3	  cmp $e366
$16:9ad9  71 86		 adc ($86),y
$16:9adb  61 76		 adc ($76,x)
$16:9add  8b			phb
$16:9ade  5d ad 90	  eor $90ad,x
$16:9ae1  0f e1 00 2c   ora $2c00e1
$16:9ae5  17 c2		 ora [$c2],y
$16:9ae7  20 f7 28	  jsr $28f7
$16:9aea  1c c2 50	  trb $50c2
$16:9aed  d0 e8		 bne $9ad7
$16:9aef  32 39		 and ($39)
$16:9af1  0c 62 33	  tsb $3362
$16:9af4  04 82		 tsb $82
$16:9af6  40			rti
$16:9af7  a0 50		 ldy #$50
$16:9af9  18			clc
$16:9afa  0b			phd
$16:9afb  b4 a7		 ldy $a7,x
$16:9afd  d0 08		 bne $9b07
$16:9aff  f4 02 0e	  pea $0e02
$16:9b02  04 12		 tsb $12
$16:9b04  d1 bc		 cmp ($bc),y
$16:9b06  07 2d		 ora [$2d]
$16:9b08  16 38		 asl $38,x
$16:9b0a  06 5b		 asl $5b
$16:9b0c  2c 36 08	  bit $0836
$16:9b0f  31 dc		 and ($dc),y
$16:9b11  47 01		 eor [$01]
$16:9b13  26 93		 rol $93
$16:9b15  7b			tdc
$16:9b16  20 07 f0	  jsr $f007
$16:9b19  1f 86 70 80   ora $807086,x
$16:9b1d  50 09		 bvc $9b28
$16:9b1f  e3 dc		 sbc $dc,s
$16:9b21  20 1c 04	  jsr $041c
$16:9b24  7c d0 38	  jmp ($38d0,x)
$16:9b27  05 d0		 ora $d0
$16:9b29  a0 27		 ldy #$27
$16:9b2b  a5 55		 lda $55
$16:9b2d  eb			xba
$16:9b2e  bf 2e 87 ee   lda $ee872e,x
$16:9b32  0d fd 81	  ora $81fd
$16:9b35  7e 5a 02	  ror $025a,x
$16:9b38  d1 0f		 cmp ($0f),y
$16:9b3a  6c 4b ff	  jmp ($ff4b)
$16:9b3d  00 6a		 brk #$6a
$16:9b3f  84 02		 sty $02
$16:9b41  9d 00 af	  sta $af00,x
$16:9b44  38			sec
$16:9b45  4d c0 94	  eor $94c0
$16:9b48  e8			inx
$16:9b49  1c 09 de	  trb $de09
$16:9b4c  11 8b		 ora ($8b),y
$16:9b4e  80 6c		 bra $9bbc
$16:9b50  3f b5 09 dc   and $dc09b5,x
$16:9b54  44 c6 12	  mvp $12,$c6
$16:9b57  68			pla
$16:9b58  91 90		 sta ($90),y
$16:9b5a  60			rts
$16:9b5b  70 bb		 bvs $9b18
$16:9b5d  94 0f		 sty $0f,x
$16:9b5f  f9 01 f9	  sbc $f901,y
$16:9b62  51 ee		 eor ($ee),y
$16:9b64  11 f8		 ora ($f8),y
$16:9b66  a4 6a		 ldy $6a
$16:9b68  23 d8		 and $d8,s
$16:9b6a  d8			cld
$16:9b6b  5c 3a 16 0a   jml $0a163a
$16:9b6f  06 03		 asl $03
$16:9b71  01 e0		 ora ($e0,x)
$16:9b73  c0 54		 cpy #$54
$16:9b75  28			plp
$16:9b76  1a			inc a
$16:9b77  8c 85 92	  sty $9285
$16:9b7a  11 00		 ora ($00),y
$16:9b7c  fc 40 3e	  jsr ($3e40,x)
$16:9b7f  11 0f		 ora ($0f),y
$16:9b81  82 68 ac	  brl $47ec
$16:9b84  18			clc
$16:9b85  00 80		 brk #$80
$16:9b87  56 31		 lsr $31,x
$16:9b89  11 08		 ora ($08),y
$16:9b8b  e4 3a		 cpx $3a
$16:9b8d  19 14 86	  ora $8614,y
$16:9b90  4d 0c 41	  eor $410c
$16:9b93  02 83		 cop #$83
$16:9b95  c0 62		 cpy #$62
$16:9b97  f0 a9		 beq $9b42
$16:9b99  34 42		 bit $42,x
$16:9b9b  41 3c		 eor ($3c,x)
$16:9b9d  89 47 24	  bit #$2447
$16:9ba0  33 e8		 and ($e8,s),y
$16:9ba2  4c f8 00	  jmp $00f8
$16:9ba5  30 08		 bmi $9baf
$16:9ba7  7c 30 1a	  jmp ($1a30,x)
$16:9baa  1a			inc a
$16:9bab  59 de fb	  eor $fbde,y
$16:9bae  59 9a 83	  eor $839a,y
$16:9bb1  74 2a		 stz $2a,x
$16:9bb3  1a			inc a
$16:9bb4  00 c2		 brk #$c2
$16:9bb6  e0 2f		 cpx #$2f
$16:9bb8  f8			sed
$16:9bb9  1b			tcs
$16:9bba  fe c2 dd	  inc $ddc2,x
$16:9bbd  f2 81		 sbc ($81)
$16:9bbf  60			rts
$16:9bc0  28			plp
$16:9bc1  02 94		 cop #$94
$16:9bc3  f0 05		 beq $9bca
$16:9bc5  02 fe		 cop #$fe
$16:9bc7  be a9 fc	  ldx $fca9,y
$16:9bca  01 01		 ora ($01,x)
$16:9bcc  ed b0 43	  sbc $43b0
$16:9bcf  fa			plx
$16:9bd0  17 d5		 ora [$d5],y
$16:9bd2  3e a1 68	  rol $68a1,x
$16:9bd5  2c 0a 03	  bit $030a
$16:9bd8  fe 50 d3	  inc $d350,x
$16:9bdb  4a			lsr a
$16:9bdc  d4 23		 pei ($23)
$16:9bde  13 84		 ora ($84,s),y
$16:9be0  44 21 03	  mvp $03,$21
$16:9be3  30 85		 bmi $9b6a
$16:9be5  c5 a3		 cmp $a3
$16:9be7  f0 28		 beq $9c11
$16:9be9  60			rts
$16:9bea  e0 20		 cpx #$20
$16:9bec  04 90		 tsb $90
$16:9bee  7d 83 ec	  adc $ec83,x
$16:9bf1  20 30 28	  jsr $2830
$16:9bf4  8c 42 02	  sty $0242
$16:9bf7  02 05		 cop #$05
$16:9bf9  09 e4 24	  ora #$24e4
$16:9bfc  03 e0		 ora $e0,s
$16:9bfe  a8			tay
$16:9bff  58			cli
$16:9c00  34 1d		 bit $1d,x
$16:9c02  0f 86 00 d2   ora $d20086
$16:9c06  1c 08 06	  trb $0608
$16:9c09  02 00		 cop #$00
$16:9c0b  1b			tcs
$16:9c0c  00 d8		 brk #$d8
$16:9c0e  07 02		 ora [$02]
$16:9c10  21 10		 and ($10,x)
$16:9c12  50 b6		 bvc $9bca
$16:9c14  93 4d		 sta ($4d,s),y
$16:9c16  a4 d0		 ldy $d0
$16:9c18  77 f3		 adc [$f3],y
$16:9c1a  38			sec
$16:9c1b  1c 1f 0f	  trb $0f1f
$16:9c1e  03 c1		 ora $c1,s
$16:9c20  c4 c4		 cpy $c4
$16:9c22  f3 f1		 sbc ($f1,s),y
$16:9c24  29 1d 6e	  and #$6e1d
$16:9c27  01 5f		 ora ($5f,x)
$16:9c29  80 59		 bra $9c84
$16:9c2b  e0 77		 cpx #$77
$16:9c2d  f2 20		 sbc ($20)
$16:9c2f  dd e0 3e	  cmp $3ee0,x
$16:9c32  98			tya
$16:9c33  0f 74 12 85   ora $851274
$16:9c37  3f 2f 44 5a   and $5a442f,x
$16:9c3b  2d 0c 86	  and $860c
$16:9c3e  17 a8		 ora [$a8],y
$16:9c40  e4 10		 cpx $10
$16:9c42  42 f5		 wdm #$f5
$16:9c44  e2 20		 sep #$20
$16:9c46  94 4c		 sty $4c,x
$16:9c48  62 3c 20	  per $bc87
$16:9c4b  98			tya
$16:9c4c  44 a8 60	  mvp $60,$a8
$16:9c4f  10 27		 bpl $9c78
$16:9c51  cc c6 73	  cpy $73c6
$16:9c54  14 21		 trb $21
$16:9c56  8c c2 29	  sty $29c2
$16:9c59  4c bd eb	  jmp $ebbd
$16:9c5c  bf 5f 07 fd   lda $fd075f,x
$16:9c60  9c 33 d8	  stz $d833
$16:9c63  13 4c		 ora ($4c,s),y
$16:9c65  27 ed		 and [$ed]
$16:9c67  21 6b		 and ($6b,x)
$16:9c69  83 5c		 sta $5c,s
$16:9c6b  20 15 e8	  jsr $e815
$16:9c6e  04 39		 tsb $39
$16:9c70  c2 31		 rep #$31
$16:9c72  e7 09		 sbc [$09]
$16:9c74  b8			clv
$16:9c75  82 09 27	  brl $c381
$16:9c78  88			dey
$16:9c79  c9 e2 13	  cmp #$13e2
$16:9c7c  38			sec
$16:9c7d  44 46 0f	  mvp $0f,$46
$16:9c80  33 80		 and ($80,s),y
$16:9c82  4d a0 33	  eor $33a0
$16:9c85  a8			tay
$16:9c86  0c 7e 01	  tsb $017e
$16:9c89  1b			tcs
$16:9c8a  88			dey
$16:9c8b  46 62		 lsr $62
$16:9c8d  11 c8		 ora ($c8),y
$16:9c8f  c4 3e		 cpy $3e
$16:9c91  0f 0f 81 81   ora $81810f
$16:9c95  42 0f		 wdm #$0f
$16:9c97  03 5f		 ora $5f,s
$16:9c99  07 92		 ora [$92]
$16:9c9b  11 fc		 ora ($fc),y
$16:9c9d  84 7d		 sty $7d
$16:9c9f  23 17		 and $17,s
$16:9ca1  8f 07 32 01   sta $013207
$16:9ca5  3c e0 06	  bit $06e0,x
$16:9ca8  43 f1		 eor $f1,s
$16:9caa  00 ec		 brk #$ec
$16:9cac  42 33		 wdm #$33
$16:9cae  11 89		 ora ($89),y
$16:9cb0  c4 e3		 cpy $e3
$16:9cb2  e0 25 0e	  cpx #$0e25
$16:9cb5  00 94		 brk #$94
$16:9cb7  3c 1e 05	  bit $051e,x
$16:9cba  f0 3c		 beq $9cf8
$16:9cbc  41 e3		 eor ($e3,x)
$16:9cbe  e0 2b b2	  cpx #$b22b
$16:9cc1  52 02		 eor ($02)
$16:9cc3  35 e8		 and $e8,x
$16:9cc5  80 56		 bra $9d1d
$16:9cc7  31 02		 and ($02),y
$16:9cc9  1a			inc a
$16:9cca  88			dey
$16:9ccb  40			rti
$16:9ccc  20 46 f0	  jsr $f046
$16:9ccf  37 11		 and [$11],y
$16:9cd1  c4 57		 cpy $57
$16:9cd3  c8			iny
$16:9cd4  73 23		 adc ($23,s),y
$16:9cd6  fa			plx
$16:9cd7  1e 5a 0d	  asl $0d5a,x
$16:9cda  00 84		 brk #$84
$16:9cdc  43 22		 eor $22,s
$16:9cde  11 85		 ora ($85),y
$16:9ce0  f3 23		 sbc ($23,s),y
$16:9ce2  c6 0d		 dec $0d
$16:9ce4  0c 86 46	  tsb $4686
$16:9ce7  12 cf		 ora ($cf)
$16:9ce9  1c 9c 41	  trb $419c
$16:9cec  8f 0a 79 49   sta $49790a
$16:9cf0  e4 f1		 cpx $f1
$16:9cf2  42 0b		 wdm #$0b
$16:9cf4  3a			dec a
$16:9cf5  4b			phk
$16:9cf6  b2 8c		 lda ($8c)
$16:9cf8  14 00		 trb $00
$16:9cfa  71 26		 adc ($26),y
$16:9cfc  7c 28 41	  jmp ($4128,x)
$16:9cff  0a			asl a
$16:9d00  d0 38		 bne $9d3a
$16:9d02  3c 16 19	  bit $1916,x
$16:9d05  08			php
$16:9d06  53 04		 eor ($04,s),y
$16:9d08  5a			phy
$16:9d09  4d 1f 93	  eor $931f
$16:9d0c  c7 4f		 cmp [$4f]
$16:9d0e  28			plp
$16:9d0f  4c 08 3c	  jmp $3c08
$16:9d12  02 13		 cop #$13
$16:9d14  00 50		 brk #$50
$16:9d16  83 05		 sta $05,s
$16:9d18  30 1c		 bmi $9d36
$16:9d1a  0a			asl a
$16:9d1b  05 82		 ora $82
$16:9d1d  41 30		 eor ($30,x)
$16:9d1f  80 5c		 bra $9d7d
$16:9d21  26 1f		 rol $1f
$16:9d23  0b			phd
$16:9d24  c5 40		 cmp $40
$16:9d26  f2 98		 sbc ($98)
$16:9d28  08			php
$16:9d29  07 00		 ora [$00]
$16:9d2b  48			pha
$16:9d2c  33 09		 and ($09,s),y
$16:9d2e  86 c0		 stx $c0
$16:9d30  30 07		 bmi $9d39
$16:9d32  93 48		 sta ($48,s),y
$16:9d34  84 0a		 sty $0a
$16:9d36  31 04		 and ($04),y
$16:9d38  93 c7		 sta ($c7,s),y
$16:9d3a  e8			inx
$16:9d3b  f7 fc		 sbc [$fc],y
$16:9d3d  18			clc
$16:9d3e  bd 92 20	  lda $2092,x
$16:9d41  a6 09		 ldx $09
$16:9d43  f4 1a fc	  pea $fc1a
$16:9d46  c2 6b		 rep #$6b
$16:9d48  c5 e3		 cmp $e3
$16:9d4a  f9 b4 c3	  sbc $c3b4,y
$16:9d4d  5e a0 73	  lsr $73a0,x
$16:9d50  20 28 2c	  jsr $2c28
$16:9d53  de f1 00	  dec $00f1,x
$16:9d56  fe 1a 86	  inc $861a,x
$16:9d59  01 20		 ora ($20,x)
$16:9d5b  88			dey
$16:9d5c  48			pha
$16:9d5d  21 11		 and ($11,x)
$16:9d5f  04 90		 tsb $90
$16:9d61  24 82		 bit $82
$16:9d63  21 08		 and ($08,x)
$16:9d65  38			sec
$16:9d66  01 b8		 ora ($b8,x)
$16:9d68  42 e1		 wdm #$e1
$16:9d6a  30 52		 bmi $9dbe
$16:9d6c  84 21		 sty $21
$16:9d6e  0a			asl a
$16:9d6f  2a			rol a
$16:9d70  50 15		 bvc $9d87
$16:9d72  81 3d		 sta ($3d,x)
$16:9d74  21 10		 and ($10,x)
$16:9d76  63 c8		 adc $c8,s
$16:9d78  40			rti
$16:9d79  0e 80 71	  asl $7180
$16:9d7c  03 e0		 ora $e0,s
$16:9d7e  93 ca		 sta ($ca,s),y
$16:9d80  1d 0e 41	  ora $410e,x
$16:9d83  84 41		 sty $41
$16:9d85  4e 28 b2	  lsr $b228
$16:9d88  82 40 e0	  brl $7dcb
$16:9d8b  51 98		 eor ($98),y
$16:9d8d  dc 86 39	  jml [$3986]
$16:9d90  40			rti
$16:9d91  9e 40 22	  stz $2240,x
$16:9d94  30 1b		 bmi $9db1
$16:9d96  3d 9e 7d	  and $7d9e,x
$16:9d99  7f 82 37 02   adc $023782,x
$16:9d9d  09 1a 82	  ora #$821a
$16:9da0  4f 60 56 f8   eor $f85660
$16:9da4  85 ba		 sta $ba
$16:9da6  20 f8 06	  jsr $06f8
$16:9da9  62 89 41	  per $df35
$16:9dac  a8			tay
$16:9dad  b8			clv
$16:9dae  0f 83 31 9c   ora $9c3183
$16:9db2  de ad 18	  dec $18ad,x
$16:9db5  04 29		 tsb $29
$16:9db7  26 0e		 rol $0e
$16:9db9  98			tya
$16:9dba  3b			tsc
$16:9dbb  02 fc		 cop #$fc
$16:9dbd  0e c0 0e	  asl $0ec0
$16:9dc0  f0 ff		 beq $9dc1
$16:9dc2  45 22		 eor $22
$16:9dc4  10 c8		 bpl $9d8e
$16:9dc6  45 92		 eor $92
$16:9dc8  d9 86 b8	  cmp $b886,y
$16:9dcb  40			rti
$16:9dcc  be 10 2a	  ldx $2a10,y
$16:9dcf  24 1b		 bit $1b
$16:9dd1  39 9f 4b	  and $4b9f,y
$16:9dd4  11 e0		 ora ($e0),y
$16:9dd6  2d 11 0f	  and $0f11
$16:9dd9  a4 23		 ldy $23
$16:9ddb  79 40 dc	  adc $dc40,y
$16:9dde  50 2c		 bvc $9e0c
$16:9de0  0c c3 3a	  tsb $3ac3
$16:9de3  14 1a		 trb $1a
$16:9de5  04 32		 tsb $32
$16:9de7  05 f8		 ora $f8
$16:9de9  41 3f		 eor ($3f,x)
$16:9deb  0c c2 65	  tsb $65c2
$16:9dee  84 72		 sty $72
$16:9df0  01 0c		 ora ($0c,x)
$16:9df2  2b			pld
$16:9df3  01 a0		 ora ($a0,x)
$16:9df5  f9 f5 f3	  sbc $f3f5,y
$16:9df8  7d 63 eb	  adc $eb63,x
$16:9dfb  f0 09		 beq $9e06
$16:9dfd  01 fd		 ora ($fd,x)
$16:9dff  a1 e8		 lda ($e8,x)
$16:9e01  83 fe		 sta $fe,s
$16:9e03  7f 91 ed f8   adc $f8ed91,x
$16:9e07  fd 26 4a	  sbc $4a26,x
$16:9e0a  01 01		 ora ($01,x)
$16:9e0c  4f b7 f1 50   eor $50f1b7
$16:9e10  71 fd		 adc ($fd),y
$16:9e12  fa			plx
$16:9e13  bf 20 14 05   lda $051420,x
$16:9e17  fb			xce
$16:9e18  47 d9		 eor [$d9]
$16:9e1a  07 f9		 ora [$f9]
$16:9e1c  fe 33 db	  inc $db33,x
$16:9e1f  e3 f4		 sbc $f4,s
$16:9e21  6c 94 02	  jmp ($0294)
$16:9e24  04 df		 tsb $df
$16:9e26  6f c3 a0 e4   adc $e4a0c3
$16:9e2a  d1 a8		 cmp ($a8),y
$16:9e2c  c8			iny
$16:9e2d  2c 21 90	  bit $9021
$16:9e30  a8			tay
$16:9e31  34 36		 bit $36,x
$16:9e33  07 07		 ora [$07]
$16:9e35  80 c0		 bra $9df7
$16:9e37  a0 2a 02	  ldy #$022a
$16:9e3a  89 c4 21	  bit #$21c4
$16:9e3d  65 50		 adc $50
$16:9e3f  50 00		 bvc $9e41
$16:9e41  1d 77 12	  ora $1277,x
$16:9e44  0e 44 40	  asl $4044
$16:9e47  86 12		 stx $12
$16:9e49  89 87 42	  bit #$4287
$16:9e4c  d1 f0		 cmp ($f0),y
$16:9e4e  a0 48 28	  ldy #$2848
$16:9e51  1c 08 00	  trb $0008
$16:9e54  74 3c		 stz $3c,x
$16:9e56  02 01		 cop #$01
$16:9e58  c0 50 31	  cpy #$3150
$16:9e5b  10 8c		 bpl $9de9
$16:9e5d  00 90		 brk #$90
$16:9e5f  00 e3		 brk #$e3
$16:9e61  8f 87 d9 3c   sta $3cd987
$16:9e65  fc 29 f7	  jsr ($f729,x)
$16:9e68  f6 07		 inc $07,x
$16:9e6a  3b			tsc
$16:9e6b  2d 80 1c	  and $1c80
$16:9e6e  fc 11 03	  jsr ($0311,x)
$16:9e71  18			clc
$16:9e72  01 8a		 ora ($8a,x)
$16:9e74  0c 6d 00	  tsb $006d
$16:9e77  39 c0 a0	  and $a0c0,y
$16:9e7a  74 4e		 stz $4e,x
$16:9e7c  3e e7 fd	  rol $fde7,x
$16:9e7f  03 fe		 ora $fe,s
$16:9e81  7c a1 80	  jmp ($80a1,x)
$16:9e84  74 fe		 stz $fe,x
$16:9e86  40			rti
$16:9e87  27 04		 and [$04]
$16:9e89  43 86		 eor $86,s
$16:9e8b  16 14		 asl $14,x
$16:9e8d  0e 54 08	  asl $0854
$16:9e90  1c 8a 89	  trb $898a
$16:9e93  04 30		 tsb $30
$16:9e95  90 1d		 bcc $9eb4
$16:9e97  68			pla
$16:9e98  74 3b		 stz $3b,x
$16:9e9a  35 9a		 and $9a,x
$16:9e9c  79 3c 34	  adc $343c,y
$16:9e9f  cc 02 11	  cpy $1102
$16:9ea2  70 82		 bvs $9e26
$16:9ea4  01 01		 ora ($01,x)
$16:9ea6  e4 03		 cpx $03
$16:9ea8  85 a0		 sta $a0
$16:9eaa  50 2f		 bvc $9edb
$16:9eac  17 83		 ora [$83],y
$16:9eae  38			sec
$16:9eaf  41 15		 eor ($15,x)
$16:9eb1  22 45 08 0c   jsl $0c0845
$16:9eb5  fe 0b 0c	  inc $0c0b,x
$16:9eb8  83 bd		 sta $bd,s
$16:9eba  02 09		 cop #$09
$16:9ebc  1f 80 47 60   ora $604780,x
$16:9ec0  11 c8		 ora ($c8),y
$16:9ec2  04 3c		 tsb $3c
$16:9ec4  86 30		 stx $30
$16:9ec6  36 04		 rol $04,x
$16:9ec8  b8			clv
$16:9ec9  03 89		 ora $89,s
$16:9ecb  48			pha
$16:9ecc  da			phx
$16:9ecd  17 86		 ora [$86],y
$16:9ecf  f5 02		 sbc $02,x
$16:9ed1  dc e0 ae	  jml [$aee0]
$16:9ed4  38			sec
$16:9ed5  29 2e 1a	  and #$1a2e
$16:9ed8  75 fc		 adc $fc,x
$16:9eda  db			stp
$16:9edb  40			rti
$16:9edc  3f ce 01 2f   and $2f01ce,x
$16:9ee0  85 f1		 sta $f1
$16:9ee2  cc 37 80	  cpy $8037
$16:9ee5  38			sec
$16:9ee6  c1 26		 cmp ($26,x)
$16:9ee8  53 6a		 eor ($6a,s),y
$16:9eea  1c e3 03	  trb $03e3
$16:9eed  78			sei
$16:9eee  80 c8		 bra $9eb8
$16:9ef0  a0 7c ee	  ldy #$ee7c
$16:9ef3  7d f1 c2	  adc $c2f1,x
$16:9ef6  17 c4		 ora [$c4],y
$16:9ef8  b8			clv
$16:9ef9  4d 21 17	  eor $1721
$16:9efc  a8			tay
$16:9efd  27 7a		 and [$7a]
$16:9eff  41 dc		 eor ($dc,x)
$16:9f01  90 4c		 bcc $9f4f
$16:9f03  0f 6b 7e 80   ora $807e6b
$16:9f07  50 82		 bvc $9e8b
$16:9f09  4a			lsr a
$16:9f0a  11 00		 ora ($00),y
$16:9f0c  e7 c0		 sbc [$c0]
$16:9f0e  3f 7f f8 3f   and $3ff87f,x
$16:9f12  f2 1f		 sbc ($1f)
$16:9f14  18			clc
$16:9f15  83 cc		 sta $cc,s
$16:9f17  26 92		 rol $92
$16:9f19  89 74 e6	  bit #$e674
$16:9f1c  2d 33 8a	  and $8a33
$16:9f1f  49 97 e5	  eor #$e597
$16:9f22  07 5e		 ora [$5e]
$16:9f24  04 02		 tsb $02
$16:9f26  2e 64 08	  rol $0864
$16:9f29  01 a0		 ora ($a0,x)
$16:9f2b  23 04		 and $04,s
$16:9f2d  a0 84 7e	  ldy #$7e84
$16:9f30  a0 5f c8	  ldy #$c85f
$16:9f33  17 b2		 ora [$b2],y
$16:9f35  47 2e		 eor [$2e]
$16:9f37  91 75		 sta ($75),y
$16:9f39  7e 10 c8	  ror $c810,x
$16:9f3c  e4 0e		 cpx $0e
$16:9f3e  1b			tcs
$16:9f3f  f6 69		 inc $69,x
$16:9f41  0b			phd
$16:9f42  94 3b		 sty $3b,x
$16:9f44  90 0e		 bcc $9f54
$16:9f46  e9 10 59	  sbc #$5910
$16:9f49  65 df		 adc $df
$16:9f4b  af e0 28 1f   lda $1f28e0
$16:9f4f  fa			plx
$16:9f50  07 06		 ora [$06]
$16:9f52  87 cf		 sta [$cf]
$16:9f54  a7 f0		 lda [$f0]
$16:9f56  aa			tax
$16:9f57  1c 0a 86	  trb $860a
$16:9f5a  02 ff		 cop #$ff
$16:9f5c  0f 90 40 27   ora $274090
$16:9f60  f3 f4		 sbc ($f4,s),y
$16:9f62  08			php
$16:9f63  40			rti
$16:9f64  c1 21		 cmp ($21,x)
$16:9f66  2f 44 0b b4   and $b40b44
$16:9f6a  3f 1f a7 68   and $68a71f,x
$16:9f6e  7a			ply
$16:9f6f  22 fc 1f 05   jsl $051ffc
$16:9f73  07 f1		 ora [$f1]
$16:9f75  c1 9a		 cmp ($9a,x)
$16:9f77  43 60		 eor $60,s
$16:9f79  90 0f		 bcc $9f8a
$16:9f7b  ff f1 7c 1f   sbc $1f7cf1,x
$16:9f7f  ff fa 74 3c   sbc $3c74fa,x
$16:9f83  04 30		 tsb $30
$16:9f85  fd aa 05	  sbc $05aa,x
$16:9f88  da			phx
$16:9f89  1b			tcs
$16:9f8a  fd fe 03	  sbc $03fe,x
$16:9f8d  01 ff		 ora ($ff,x)
$16:9f8f  c0 60 f0	  cpy #$f060
$16:9f92  f9 ec fe	  sbc $feec,y
$16:9f95  97 40		 sta [$40],y
$16:9f97  ba			tsx
$16:9f98  04 e8		 tsb $e8
$16:9f9a  47 e8		 eor [$e8]
$16:9f9c  10 0b		 bpl $9fa9
$16:9f9e  fd fd 82	  sbc $82fd,x
$16:9fa1  10 7b		 bpl $a01e
$16:9fa3  04 02		 tsb $02
$16:9fa5  be c8 17	  ldx $17c8,y
$16:9fa8  68			pla
$16:9fa9  7c 7e 8a	  jmp ($8a7e,x)
$16:9fac  00 e8		 brk #$e8
$16:9fae  cb			wai
$16:9faf  b0 7c		 bcs $a02d
$16:9fb1  0c 1f c3	  tsb $c31f
$16:9fb4  07 68		 ora [$68]
$16:9fb6  8d c2 20	  sta $20c2
$16:9fb9  3f ef c1 b4   and $b4c1ef,x
$16:9fbd  3f cf c0 ff   and $ffc0cf,x
$16:9fc1  70 21		 bvs $9fe4
$16:9fc3  d0 02		 bne $9fc7
$16:9fc5  f8			sed
$16:9fc6  17 c0		 ora [$c0],y
$16:9fc8  3c 50 d8	  bit $d850,x
$16:9fcb  1c 2a 05	  trb $052a
$16:9fce  04 86		 tsb $86
$16:9fd0  41 21		 eor ($21,x)
$16:9fd2  f0 b8		 beq $9f8c
$16:9fd4  3c 56 19	  bit $1956,x
$16:9fd7  0b			phd
$16:9fd8  26 81		 rol $81
$16:9fda  28			plp
$16:9fdb  61 a4		 adc ($a4,x)
$16:9fdd  01 0f		 ora ($0f,x)
$16:9fdf  11 04		 ora ($04),y
$16:9fe1  87 e1		 sta [$e1]
$16:9fe3  60			rts
$16:9fe4  c0 68 0e	  cpy #$0e68
$16:9fe7  21 60		 and ($60,x)
$16:9fe9  a0 78 34	  ldy #$3478
$16:9fec  07 b0		 ora [$b0]
$16:9fee  b0 68		 bcs $a058
$16:9ff0  10 e0		 bpl $9fd2
$16:9ff2  10 01		 bpl $9ff5
$16:9ff4  00 e0		 brk #$e0
$16:9ff6  1d 86 25	  ora $2586,x
$16:9ff9  0e 03 b0	  asl $b003
$16:9ffc  dd a4 49	  cmp $49a4,x
$16:9fff  08			php
$16:a000  14 62		 trb $62
$16:a002  09 27 8f	  ora #$8f27
$16:a005  d1 c5		 cmp ($c5),y
$16:a007  f0 37		 beq $a040
$16:a009  07 f0		 ora [$f0]
$16:a00b  4f 86 e0 2e   eor $2ee086
$16:a00f  6b			rtl
$16:a010  c5 e3		 cmp $e3
$16:a012  f9 b4 c3	  sbc $c3b4,y
$16:a015  5e 80 a8	  lsr $a880,x
$16:a018  51 68		 eor ($68),y
$16:a01a  07 f2		 ora [$f2]
$16:a01c  01 10		 ora ($10,x)
$16:a01e  86 42		 stx $42
$16:a020  2c 96 cc	  bit $cc96
$16:a023  35 c2		 and $c2,x
$16:a025  05 f0		 ora $f0
$16:a027  81 51		 sta ($51,x)
$16:a029  20 d9 cc	  jsr $ccd9
$16:a02c  ff ef ff 10   sbc $10ffef,x
$16:a030  80 42		 bra $a074
$16:a032  22 16 88 87   jsl $878816
$16:a036  d2 11		 cmp ($11)
$16:a038  bc a0 6e	  ldy $6ea0,x
$16:a03b  02 a0		 cop #$a0
$16:a03d  cc 17 b0	  cpy $b017
$16:a040  02 42		 cop #$42
$16:a042  1d 0a 83	  ora $830a,x
$16:a045  3d 02 00	  and $0002,x
$16:a048  97 1f		 sta [$1f],y
$16:a04a  c1 c0		 cmp ($c0,x)
$16:a04c  21 00		 and ($00,x)
$16:a04e  01 4b		 ora ($4b,x)
$16:a050  91 1c		 sta ($1c),y
$16:a052  86 e0		 stx $e0
$16:a054  eb			xba
$16:a055  18			clc
$16:a056  a1 bf		 lda ($bf,x)
$16:a058  13 e0		 ora ($e0,s),y
$16:a05a  7f e6 70 1f   adc $1f70e6,x
$16:a05e  c4 6c		 cpy $6c
$16:a060  10 23		 bpl $a085
$16:a062  80 26		 bra $a08a
$16:a064  49 9c 4f	  eor #$4f9c
$16:a067  e0 8e 00	  cpx #$008e
$16:a06a  05 4e		 ora $4e
$16:a06c  90 a8		 bcc $a016
$16:a06e  3c 16 1d	  bit $1d16,x
$16:a071  14 87		 trb $87
$16:a073  c6 60		 dec $60
$16:a075  b1 68		 lda ($68),y
$16:a077  7c 72 1f	  jmp ($1f72,x)
$16:a07a  1b			tcs
$16:a07b  82 c9 a5	  brl $4647
$16:a07e  b0 08		 bcs $a088
$16:a080  7b			tdc
$16:a081  fc 63 f0	  jsr ($f063,x)
$16:a084  28			plp
$16:a085  f8			sed
$16:a086  0c 20 31	  tsb $3120
$16:a089  f8			sed
$16:a08a  2c 7e 4b	  bit $4b7e
$16:a08d  1f d0 70 28   ora $2870d0,x
$16:a091  1e 0c 86	  asl $860c,x
$16:a094  82 61 00	  brl $a0f8
$16:a097  e8			inx
$16:a098  78			sei
$16:a099  2e 1e 0d	  rol $0d1e
$16:a09c  85 03		 sta $03
$16:a09e  91 68		 sta ($68),y
$16:a0a0  80 78		 bra $a11a
$16:a0a2  03 e1		 ora $e1,s
$16:a0a4  40			rti
$16:a0a5  f8			sed
$16:a0a6  70 3e		 bvs $a0e6
$16:a0a8  10 01		 bpl $a0ab
$16:a0aa  30 88		 bmi $a034
$16:a0ac  c2 90		 rep #$90
$16:a0ae  26 08		 rol $08
$16:a0b0  05 fa		 ora $fa
$16:a0b2  01 42		 ora ($42,x)
$16:a0b4  19 28 c4	  ora $c428,y
$16:a0b7  07 9e		 ora [$9e]
$16:a0b9  5f 94 b9 93   eor $93b994,x
$16:a0bd  65 42		 adc $42
$16:a0bf  06 92		 asl $92
$16:a0c1  2a			rol a
$16:a0c2  14 0d		 trb $0d
$16:a0c4  e0 10 c8	  cpx #$c810
$16:a0c7  64 7e		 stz $7e
$16:a0c9  1d 1a 86	  ora $861a,x
$16:a0cc  c5 22		 cmp $22
$16:a0ce  e6 d4		 inc $d4
$16:a0d0  39 01 a0	  and $a001,y
$16:a0d3  21 90		 and ($90,x)
$16:a0d5  d8			cld
$16:a0d6  62 14 10	  per $b0ed
$16:a0d9  a0 54 2c	  ldy #$2c54
$16:a0dc  00 40		 brk #$40
$16:a0de  2c 16 0f	  bit $0f16
$16:a0e1  80 68		 bra $a14b
$16:a0e3  2c 15 0e	  bit $0e15
$16:a0e6  83 35		 sta $35,s
$16:a0e8  12 41		 ora ($41)
$16:a0ea  00 4b		 brk #$4b
$16:a0ec  02 58		 cop #$58
$16:a0ee  14 a0		 trb $a0
$16:a0f0  a5 03		 lda $03
$16:a0f2  7f a0 3d 23   adc $233da0,x
$16:a0f6  ea			nop
$16:a0f7  2b			pld
$16:a0f8  84 c6		 sty $c6
$16:a0fa  21 11		 and ($11,x)
$16:a0fc  88			dey
$16:a0fd  24 72		 bit $72
$16:a0ff  27 0f		 and [$0f]
$16:a101  8c 41 e1	  sty $e141
$16:a104  e5 43		 sbc $43
$16:a106  83 bf		 sta $bf,s
$16:a108  85 8a		 sta $8a
$16:a10a  11 08		 ora ($08),y
$16:a10c  81 3d		 sta ($3d,x)
$16:a10e  a4 13		 ldy $13
$16:a110  00 78		 brk #$78
$16:a112  50 2e		 bvc $a142
$16:a114  19 0f 04	  ora $040f,y
$16:a117  c3 81		 cmp $81,s
$16:a119  e0 2a 1f	  cpx #$1f2a
$16:a11c  00 3c		 brk #$3c
$16:a11e  2a			rol a
$16:a11f  50 02		 bvc $a123
$16:a121  c5 ff		 cmp $ff
$16:a123  07 8f		 ora [$8f]
$16:a125  87 d9		 sta [$d9]
$16:a127  3c fc 29	  bit $29fc,x
$16:a12a  f7 fe		 sbc [$fe],y
$16:a12c  07 37		 ora [$37]
$16:a12e  84 15		 sty $15
$16:a130  0a			asl a
$16:a131  fd 06 f0	  sbc $f006,x
$16:a134  44 23 10	  mvp $10,$23
$16:a137  08			php
$16:a138  09 98 8d	  ora #$8d98
$16:a13b  a7 32		 lda [$32]
$16:a13d  81 c0		 sta ($c0,x)
$16:a13f  a0 74 4e	  ldy #$4e74
$16:a142  3e e7 fd	  rol $fde7,x
$16:a145  02 fe		 cop #$fe
$16:a147  ff 88 a5 00   sbc $00a588,x
$16:a14b  fe 17 86	  inc $8617,x
$16:a14e  70 b2		 bvs $a102
$16:a150  03 28		 ora $28,s
$16:a152  c0 4b 47	  cpy #$474b
$16:a155  07 fe		 ora [$fe]
$16:a157  3d 86 21	  and $2186,x
$16:a15a  6f 8d fc a1   adc $a1fc8d
$16:a15e  3f 78 0f fe   and $fe0f78,x
$16:a162  09 7f 62	  ora #$627f
$16:a165  0b			phd
$16:a166  fc 1f 21	  jsr ($211f,x)
$16:a169  04 80		 tsb $80
$16:a16b  41 a0		 eor ($a0,x)
$16:a16d  10 e8		 bpl $a157
$16:a16f  00 e8		 brk #$e8
$16:a171  bf 50 2f e4   lda $e42f50,x
$16:a175  0b			phd
$16:a176  d9 22 94	  cmp $9422,y
$16:a179  48			pha
$16:a17a  b9 3e 2f	  lda $2f3e,y
$16:a17d  bc 4b eb	  ldy $eb4b,x
$16:a180  02 fd		 cop #$fd
$16:a182  17 8f		 ora [$8f],y
$16:a184  b8			clv
$16:a185  a2 18 e3	  ldx #$e318
$16:a188  18			clc
$16:a189  15 07		 ora $07,x
$16:a18b  fb			xce
$16:a18c  ff 9b ca cf   sbc $cfca9b,x
$16:a190  10 f2		 bpl $a184
$16:a192  46 3f		 lsr $3f
$16:a194  c7 80		 cmp [$80]
$16:a196  89 5d d0	  bit #$d05d
$16:a199  a0 7e 54	  ldy #$547e
$16:a19c  08			php
$16:a19d  21 c1		 and ($c1,x)
$16:a19f  52 04		 eor ($04)
$16:a1a1  30 86		 bmi $a129
$16:a1a3  42 11		 wdm #$11
$16:a1a5  e5 ed		 sbc $ed
$16:a1a7  91 4b		 sta ($4b),y
$16:a1a9  a4 5d		 ldy $5d
$16:a1ab  5f 87 f2 19   eor $19f287,x
$16:a1af  ff 80 fd 93   sbc $93fd80,x
$16:a1b3  cb			wai
$16:a1b4  dd 41 09	  cmp $0941,x
$16:a1b7  fc 20 50	  jsr ($5020,x)
$16:a1ba  08			php
$16:a1bb  bc ee 77	  ldy $77ee,x
$16:a1be  24 a9		 bit $a9
$16:a1c0  db			stp
$16:a1c1  e4 11		 cpx $11
$16:a1c3  b9 5c 62	  lda $625c,y
$16:a1c6  73 1c		 adc ($1c,s),y
$16:a1c8  8c 42 e1	  sty $e142
$16:a1cb  50 69		 bvc $a236
$16:a1cd  bc 3e 69	  ldy $693e,x
$16:a1d0  3a			dec a
$16:a1d1  b5 d8		 lda $d8,x
$16:a1d3  14 e1		 trb $e1
$16:a1d5  1f 03 0c 2e   ora $2e0c03,x
$16:a1d9  09 06 80	  ora #$8006
$16:a1dc  f4 37 1b	  pea $1b37
$16:a1df  8a			txa
$16:a1e0  46 53		 lsr $53
$16:a1e2  d9 68 d8	  cmp $d868,y
$16:a1e5  76 22		 ror $22,x
$16:a1e7  19 8a 84	  ora $848a,y
$16:a1ea  c3 41		 cmp $41,s
$16:a1ec  a0 e0 76	  ldy #$76e0
$16:a1ef  3c 15 8d	  bit $8d15,x
$16:a1f2  c6 b2		 dec $b2
$16:a1f4  19 70 80	  ora $8070,y
$16:a1f7  74 24		 stz $24,x
$16:a1f9  02 70		 cop #$70
$16:a1fb  d0 50		 bne $a24d
$16:a1fd  38			sec
$16:a1fe  06 c0		 asl $c0
$16:a200  94 48		 sty $48,x
$16:a202  23 11		 and $11,s
$16:a204  0e 47 62	  asl $6247
$16:a207  19 e0 82	  ora $82e0,y
$16:a20a  78			sei
$16:a20b  20 b8 a8	  jsr $a8b8
$16:a20e  74 ee		 stz $ee,x
$16:a210  7d 10 80	  adc $8010,x
$16:a213  48			pha
$16:a214  20 11 01	  jsr $0111
$16:a217  40			rti
$16:a218  fa			plx
$16:a219  22 17 8c 05   jsl $058c17
$16:a21d  c7 01		 cmp [$01]
$16:a21f  c1 45		 cmp ($45,x)
$16:a221  08			php
$16:a222  fc 51 61	  jsr ($6151,x)
$16:a225  46 9d		 lsr $9d
$16:a227  60			rts
$16:a228  db			stp
$16:a229  a1 f3		 lda ($f3,x)
$16:a22b  80 f2		 bra $a21f
$16:a22d  61 ac		 adc ($ac,x)
$16:a22f  d0 66		 bne $a297
$16:a231  84 c2		 sty $c2
$16:a233  01 38		 ora ($38,x)
$16:a235  80 5f		 bra $a296
$16:a237  20 1f e3	  jsr $e31f
$16:a23a  40			rti
$16:a23b  fc 88 41	  jsr ($4188,x)
$16:a23e  08			php
$16:a23f  8a			txa
$16:a240  c3 23		 cmp $23,s
$16:a242  70 68		 bvs $a2ac
$16:a244  64 48		 stz $48
$16:a246  0e 0c 52	  asl $520c
$16:a249  60			rts
$16:a24a  84 16		 sty $16
$16:a24c  04 c1		 tsb $c1
$16:a24e  08			php
$16:a24f  8c 41 06	  sty $0641
$16:a252  0b			phd
$16:a253  f0 43		 beq $a298
$16:a255  a1 0c		 lda ($0c,x)
$16:a257  2a			rol a
$16:a258  16 0d		 asl $0d,x
$16:a25a  87 02		 sta [$02]
$16:a25c  c1 90		 cmp ($90,x)
$16:a25e  f8			sed
$16:a25f  40			rti
$16:a260  3c 10 01	  bit $0110,x
$16:a263  68			pla
$16:a264  60			rts
$16:a265  20 14 0c	  jsr $0c14
$16:a268  02 74		 cop #$74
$16:a26a  22 0a 31 43   jsl $43310a
$16:a26e  b9 c0 63	  lda $63c0,y
$16:a271  50 68		 bvc $a2db
$16:a273  6c 4c ef	  jmp ($ef4c)
$16:a276  8a			txa
$16:a277  59 48 7a	  eor $7a48,y
$16:a27a  87 18		 sta [$18]
$16:a27c  e4 0d		 cpx $0d
$16:a27e  08			php
$16:a27f  2c 04 f4	  bit $f404
$16:a282  10 b8		 bpl $a23c
$16:a284  39 c4 21	  and $21c4,y
$16:a287  66 10		 ror $10
$16:a289  78			sei
$16:a28a  10 08		 bpl $a294
$16:a28c  58			cli
$16:a28d  e4 81		 cpx $81
$16:a28f  03 d8		 ora $d8,s
$16:a291  31 c9		 and ($c9),y
$16:a293  a6 15		 ldx $15
$16:a295  0a			asl a
$16:a296  04 83		 tsb $83
$16:a298  e1 80		 sbc ($80,x)
$16:a29a  f8			sed
$16:a29b  34 43		 bit $43,x
$16:a29d  40			rti
$16:a29e  63 06		 adc $06,s
$16:a2a0  60			rts
$16:a2a1  98			tya
$16:a2a2  c3 60		 cmp $60,s
$16:a2a4  c7 36		 cmp [$36]
$16:a2a6  e8			inx
$16:a2a7  70 1d		 bvs $a2c6
$16:a2a9  51 00		 eor ($00),y
$16:a2ab  81 46		 sta ($46,x)
$16:a2ad  20 92 78	  jsr $7892
$16:a2b0  fd 1c 5f	  sbc $5f1c,x
$16:a2b3  00 30		 brk #$30
$16:a2b5  30 84		 bmi $a23b
$16:a2b7  f8			sed
$16:a2b8  0a			asl a
$16:a2b9  8c 72 bc	  sty $bc72
$16:a2bc  5e 3f 9b	  lsr $9b3f,x
$16:a2bf  4c 35 e9	  jmp $e935
$16:a2c2  02 0e		 cop #$0e
$16:a2c4  79 bc 40	  adc $40bc,y
$16:a2c7  3f 8a 20 86   and $86208a,x
$16:a2cb  42 2c		 wdm #$2c
$16:a2cd  96 cc		 stx $cc,y
$16:a2cf  35 c2		 and $c2,x
$16:a2d1  05 f0		 ora $f0
$16:a2d3  81 51		 sta ($51,x)
$16:a2d5  20 d9 cc	  jsr $ccd9
$16:a2d8  ff ef fe c6   sbc $c6feef,x
$16:a2dc  08			php
$16:a2dd  44 42 d1	  mvp $d1,$42
$16:a2e0  10 fa		 bpl $a2dc
$16:a2e2  42 37		 wdm #$37
$16:a2e4  94 0d		 sty $0d,x
$16:a2e6  c5 02		 cmp $02
$16:a2e8  c0 cc 18	  cpy #$18cc
$16:a2eb  64 11		 stz $11
$16:a2ed  98			tya
$16:a2ee  10 e8		 bpl $a2d8
$16:a2f0  54 1a 04	  mvn $04,$1a
$16:a2f3  90 04		 bcc $a2f9
$16:a2f5  b8			clv
$16:a2f6  fe 0e 01	  inc $010e,x
$16:a2f9  08			php
$16:a2fa  47 02		 eor [$02]
$16:a2fc  60			rts
$16:a2fd  80 46		 bra $a345
$16:a2ff  03 0f		 ora $0f,s
$16:a301  b3 30		 lda ($30,s),y
$16:a303  22 86 fc 4f   jsl $4ffc86
$16:a307  81 ff		 sta ($ff,x)
$16:a309  9d 65 02	  sta $0265,x
$16:a30c  06 04		 asl $04
$16:a30e  15 aa		 ora $aa,x
$16:a310  09 92 03	  ora #$0392
$16:a313  a0 2c 1a	  ldy #$1a2c
$16:a316  a0 a7 48	  ldy #$48a7
$16:a319  53 5c		 eor ($5c,s),y
$16:a31b  21 d1		 and ($d1,x)
$16:a31d  48			pha
$16:a31e  7c 66 0b	  jmp ($0b66,x)
$16:a321  16 87		 asl $87,x
$16:a323  c7 21		 cmp [$21]
$16:a325  f1 b7		 sbc ($b7),y
$16:a327  b0 43		 bcs $a36c
$16:a329  60			rts
$16:a32a  10 f7		 bpl $a323
$16:a32c  f8			sed
$16:a32d  c7 e0		 cmp [$e0]
$16:a32f  51 f0		 eor ($f0),y
$16:a331  18			clc
$16:a332  40			rti
$16:a333  63 f0		 adc $f0,s
$16:a335  50 50		 bvc $a387
$16:a337  e8			inx
$16:a338  38			sec
$16:a339  14 0f		 trb $0f
$16:a33b  06 43		 asl $43
$16:a33d  41 30		 eor ($30,x)
$16:a33f  80 74		 bra $a3b5
$16:a341  3c 17 0f	  bit $0f17,x
$16:a344  06 c2		 asl $c2
$16:a346  81 d0		 sta ($d0,x)
$16:a348  b8			clv
$16:a349  40			rti
$16:a34a  3c 01 f0	  bit $f001,x
$16:a34d  a0 7c 38	  ldy #$387c
$16:a350  1f 08 00 98   ora $980008,x
$16:a354  44 61 50	  mvp $50,$61
$16:a357  f0 7d		 beq $a3d6
$16:a359  ff 90 ff c4   sbc $c4ff90,x
$16:a35d  7e 61 1f	  ror $1f61,x
$16:a360  99 ac 02	  sta $02ac,y
$16:a363  0d 12 84	  ora $8412
$16:a366  44 a0 91	  mvp $91,$a0
$16:a369  47 18		 eor [$18]
$16:a36b  41 df		 eor ($df,x)
$16:a36d  e2 a1		 sep #$a1
$16:a36f  08			php
$16:a370  72 80		 adc ($80)
$16:a372  54 20 9f	  mvn $9f,$20
$16:a375  0f 84 cf 41   ora $41cf84
$16:a379  20 a0 50	  jsr $50a0
$16:a37c  30 18		 bmi $a396
$16:a37e  06 72		 asl $72
$16:a380  c0 38 05	  cpy #$0538
$16:a383  e1 2b		 sbc ($2b,x)
$16:a385  3b			tsc
$16:a386  38			sec
$16:a387  e0 30 38	  cpx #$3830
$16:a38a  14 1a		 trb $1a
$16:a38c  03 07		 ora $07,s
$16:a38e  87 40		 sta [$40]
$16:a390  93 e1		 sta ($e1,s),y
$16:a392  06 87		 asl $87
$16:a394  42 c8		 wdm #$c8
$16:a396  20 6e 27	  jsr $276e
$16:a399  00 bf		 brk #$bf
$16:a39b  89 06		 bit #$06
$16:a39d  4e 01 2a	  lsr $2a01
$16:a3a0  81 7c		 sta ($7c,x)
$16:a3a2  7c 18 09	  jmp ($0918,x)
$16:a3a5  02 54		 cop #$54
$16:a3a7  41 e0		 eor ($e0,x)
$16:a3a9  57 66		 eor [$66],y
$16:a3ab  68			pla
$16:a3ac  08			php
$16:a3ad  00 da		 brk #$da
$16:a3af  8d 40 39	  sta $3940
$16:a3b2  e2 0c		 sep #$0c
$16:a3b4  10 76		 bpl $a42c
$16:a3b6  56 04		 lsr $04,x
$16:a3b8  97 a8		 sta [$a8],y
$16:a3ba  ea			nop
$16:a3bb  13 18		 ora ($18,s),y
$16:a3bd  84 46		 sty $46
$16:a3bf  20 91 c8	  jsr $c891
$16:a3c2  9c 3e 31	  stz $313e
$16:a3c5  07 87		 ora [$87]
$16:a3c7  c4 0d		 cpy $0d
$16:a3c9  44 41 02	  mvp $02,$41
$16:a3cc  08			php
$16:a3cd  2c 00 dc	  bit $dc00
$16:a3d0  10 87		 bpl $a359
$16:a3d2  88			dey
$16:a3d3  46 0d		 lsr $0d
$16:a3d5  45 20		 eor $20
$16:a3d7  98			tya
$16:a3d8  03 c2		 ora $c2,s
$16:a3da  81 70		 sta ($70,x)
$16:a3dc  c8			iny
$16:a3dd  78			sei
$16:a3de  26 0d		 rol $0d
$16:a3e0  b0 2d		 bcs $a40f
$16:a3e2  79 a8 af	  adc $afa8,y
$16:a3e5  f8			sed
$16:a3e6  3c 7c 3e	  bit $3e7c,x
$16:a3e9  c9 e7		 cmp #$e7
$16:a3eb  e0 cf ff	  cpx #$ffcf
$16:a3ee  d0 19		 bne $a409
$16:a3f0  f2 2c		 sbc ($2c)
$16:a3f2  ef d0 6f 04   sbc $046fd0
$16:a3f6  40			rti
$16:a3f7  14 67		 trb $67
$16:a3f9  00 45		 brk #$45
$16:a3fb  9c c8 e4	  stz $e4c8
$16:a3fe  10 3a		 bpl $a43a
$16:a400  27 1e		 and [$1e]
$16:a402  73 7e		 adc ($7e,s),y
$16:a404  c3 fe		 cmp $fe,s
$16:a406  39 d3 01	  and $01d3,y
$16:a409  31 7f		 and ($7f),y
$16:a40b  0b			phd
$16:a40c  c3 38		 cmp $38,s
$16:a40e  67 8c		 adc [$8c]
$16:a410  32 19		 and ($19)
$16:a412  b8			clv
$16:a413  dc 3e cf	  jml [$cf3e]
$16:a416  f8			sed
$16:a417  f6 18		 inc $18,x
$16:a419  85 b2		 sta $b2
$16:a41b  31 f6		 and ($f6),y
$16:a41d  84 fe		 sty $fe
$16:a41f  e0 1f 91	  cpx #$911f
$16:a422  70 14		 bvs $a438
$16:a424  41 fc		 eor ($fc,x)
$16:a426  2c 90 7f	  bit $7f90
$16:a429  84 19		 sty $19
$16:a42b  0c 70 48	  tsb $4870
$16:a42e  07 ea		 ora [$ea]
$16:a430  05 ec		 ora $ec
$16:a432  81 7f		 sta ($7f,x)
$16:a434  24 53		 bit $53
$16:a436  89 17		 bit #$17
$16:a438  77 e5		 adc [$e5],y
$16:a43a  eb			xba
$16:a43b  80 7d		 bra $a4ba
$16:a43d  e0 1f e2	  cpx #$e21f
$16:a440  f1 f7		 sbc ($f7),y
$16:a442  14 43		 trb $43
$16:a444  0c 80 47	  tsb $4780
$16:a447  20 00 a2	  jsr $a200
$16:a44a  fd ff cd	  sbc $cdff,x
$16:a44d  e5 67		 sbc $67
$16:a44f  88			dey
$16:a450  7b			tdc
$16:a451  e3 3f		 sbc $3f,s
$16:a453  38			sec
$16:a454  47 fa		 eor [$fa]
$16:a456  05 7f		 ora $7f
$16:a458  23 09		 and $09,s
$16:a45a  fd 10 e0	  sbc $e010,x
$16:a45d  ff 01 d0 0e   sbc $0ed001,x
$16:a461  82 19 08	  brl $ac7d
$16:a464  47 87		 eor [$87]
$16:a466  f1 20		 sbc ($20),y
$16:a468  12 28		 ora ($28)
$16:a46a  cd 0a 33	  cmp $330a
$16:a46d  c2 a7		 rep #$a7
$16:a46f  c9 3c d8	  cmp #$d83c
$16:a472  8f b2 79 77   sta $7779b2
$16:a476  90 09		 bcc $a481
$16:a478  e4 03		 cpx $03
$16:a47a  31 00		 and ($00),y
$16:a47c  2d 04 5e	  and $5e04
$16:a47f  26 71		 rol $71
$16:a481  08			php
$16:a482  dc 5e 41	  jml [$415e]
$16:a485  3b			tsc
$16:a486  95 c6		 sta $c6,x
$16:a488  27 31		 and [$31]
$16:a48a  c8			iny
$16:a48b  c4 2e		 cpy $2e
$16:a48d  15 06		 ora $06,x
$16:a48f  8b			phb
$16:a490  9c 42 0d	  stz $0d42
$16:a493  1b			tcs
$16:a494  8c 4f 26	  sty $264f
$16:a497  11 f8		 ora ($f8),y
$16:a499  00 1c		 brk #$1c
$16:a49b  21 70		 and ($70,x)
$16:a49d  48			pha
$16:a49e  34 07		 bit $07,x
$16:a4a0  91 b8		 sta ($b8),y
$16:a4a2  d2 53		 cmp ($53)
$16:a4a4  32 1e		 and ($1e)
$16:a4a6  0b			phd
$16:a4a7  46 c3		 lsr $c3
$16:a4a9  b1 10		 lda ($10),y
$16:a4ab  cc 54 26	  cpy $2654
$16:a4ae  1a			inc a
$16:a4af  0d 07 03	  ora $0307
$16:a4b2  b1 e8		 lda ($e8),y
$16:a4b4  a6 6b		 ldx $6b
$16:a4b6  34 10		 bit $10,x
$16:a4b8  0b			phd
$16:a4b9  84 03		 sty $03
$16:a4bb  a1 20		 lda ($20,x)
$16:a4bd  13 86		 ora ($86,s),y
$16:a4bf  82 81 c0	  brl $6543
$16:a4c2  23 0d		 and $0d,s
$16:a4c4  fa			plx
$16:a4c5  01 42		 ora ($42,x)
$16:a4c7  19 28 c4	  ora $c428,y
$16:a4ca  07 9e		 ora [$9e]
$16:a4cc  2e f2 f7	  rol $f7f2
$16:a4cf  45 21		 eor $21
$16:a4d1  90 b8		 bcc $a48b
$16:a4d3  c4 26		 cpy $26
$16:a4d5  31 08		 and ($08),y
$16:a4d7  8c 41 23	  sty $2341
$16:a4da  8f 01 83 b1   sta $b18301
$16:a4de  41 82		 eor ($82,x)
$16:a4e0  48			pha
$16:a4e1  12 60		 ora ($60)
$16:a4e3  84 42		 sty $42
$16:a4e5  20 4c 2a	  jsr $2a4c
$16:a4e8  85 83		 sta $83
$16:a4ea  41 30		 eor ($30,x)
$16:a4ec  90 24		 bcc $a512
$16:a4ee  86 81		 stx $81
$16:a4f0  70 09		 bvs $a4fb
$16:a4f2  84 c3		 sty $c3
$16:a4f4  81 e0		 sta ($e0,x)
$16:a4f6  80 60		 bra $a558
$16:a4f8  20 02 d0	  jsr $d002
$16:a4fb  50 92		 bvc $a48f
$16:a4fd  7c 11 28	  jmp ($2811,x)
$16:a500  6f f4 07 a4   adc $a407f4
$16:a504  7d 45 70	  adc $7045,x
$16:a507  58			cli
$16:a508  64 0e		 stz $0e
$16:a50a  19 0d 81	  ora $810d,y
$16:a50d  40			rti
$16:a50e  e0 2b f0	  cpx #$f02b
$16:a511  8b			phb
$16:a512  be 06 26	  ldx $2606,y
$16:a515  c6 15		 dec $15
$16:a517  f8			sed
$16:a518  43 60		 eor $60,s
$16:a51a  10 28		 bpl $a544
$16:a51c  64 1e		 stz $1e
$16:a51e  10 bd		 bpl $a4dd
$16:a520  05 e8		 ora $e8
$16:a522  3c c2 81	  bit $81c2,x
$16:a525  60			rts
$16:a526  c0 58 02	  cpy #$0258
$16:a529  00 9f		 brk #$9f
$16:a52b  04 f8		 tsb $f8
$16:a52d  74 03		 stz $03,x
$16:a52f  03 90		 ora $90,s
$16:a531  53 0a		 eor ($0a,s),y
$16:a533  7c 2c 0a	  jmp ($0a2c,x)
$16:a536  60			rts
$16:a537  b0 70		 bcs $a5a9
$16:a539  24 0d		 bit $0d
$16:a53b  d0 6e		 bne $a5ab
$16:a53d  80 40		 bra $a57f
$16:a53f  20 10 67	  jsr $6710
$16:a542  7e 40 5f	  ror $5f40,x
$16:a545  da			phx
$16:a546  a0 00 7e	  ldy #$7e00
$16:a549  33 40		 and ($40,s),y
$16:a54b  3f 90 08 63   and $630890,x
$16:a54f  c0 20 4b	  cpy #$4b20
$16:a552  e5 5f		 sbc $5f
$16:a554  84 2a		 sty $2a
$16:a556  30 6e		 bmi $a5c6
$16:a558  16 30		 asl $30,x
$16:a55a  01 9e		 ora ($9e,x)
$16:a55c  0a			asl a
$16:a55d  73 00		 adc ($00,s),y
$16:a55f  92 b8		 sta ($b8)
$16:a561  d1 a2		 cmp ($a2),y
$16:a563  0c d0 11	  tsb $11d0
$16:a566  d5 01		 cmp $01,x
$16:a568  be 0c b2	  ldx $b20c,y
$16:a56b  c0 41 30	  cpy #$3041
$16:a56e  10 6c		 bpl $a5dc
$16:a570  14 3b		 trb $3b
$16:a572  14 b5		 trb $b5
$16:a574  0c 27 c1	  tsb $c127
$16:a577  5e 68 01	  lsr $0168,x
$16:a57a  40			rti
$16:a57b  84 10		 sty $10
$16:a57d  5e 0c a1	  lsr $a10c,x
$16:a580  57 a0		 eor [$a0],y
$16:a582  78			sei
$16:a583  a0 d8 48	  ldy #$48d8
$16:a586  1e 05 7a	  asl $7a05,x
$16:a589  c6 e0		 dec $e0
$16:a58b  7f 93 2c a1   adc $a12c93,x
$16:a58f  50 78		 bvc $a609
$16:a591  2c 3a 29	  bit $293a
$16:a594  0f 8c c1 62   ora $62c18c
$16:a598  d0 f8		 bne $a592
$16:a59a  e4 3e		 cpx $3e
$16:a59c  36 f6		 rol $f6,x
$16:a59e  08			php
$16:a59f  ea			nop
$16:a5a0  20 50 e1	  jsr $e150
$16:a5a3  1f 81 47 c0   ora $c04781,x
$16:a5a7  61 01		 adc ($01,x)
$16:a5a9  8f c1 63 f1   sta $f163c1
$16:a5ad  58			cli
$16:a5ae  7e 80 a0	  ror $a080,x
$16:a5b1  1e 0c 82	  asl $820c,x
$16:a5b4  74 7a		 stz $7a,x
$16:a5b6  1e 0b 87	  asl $870b,x
$16:a5b9  83 61		 sta $61,s
$16:a5bb  40			rti
$16:a5bc  e8			inx
$16:a5bd  28			plp
$16:a5be  40			rti
$16:a5bf  d6 34		 dec $34,x
$16:a5c1  0f 87 01 7c   ora $7c0187
$16:a5c5  02 61		 cop #$61
$16:a5c7  11 80		 ora ($80),y
$16:a5c9  8c 0d c1	  sty $c10d
$16:a5cc  7e 80 50	  ror $5080,x
$16:a5cf  86 4a		 stx $4a
$16:a5d1  31 01		 and ($01),y
$16:a5d3  e7 ac		 sbc [$ac]
$16:a5d5  04 63		 tsb $63
$16:a5d7  e6 1f		 inc $1f
$16:a5d9  74 84		 stz $84,x
$16:a5db  06 39		 asl $39
$16:a5dd  60			rts
$16:a5de  f1 df		 sbc ($df),y
$16:a5e0  f0 73		 beq $a655
$16:a5e2  30 48		 bmi $a62c
$16:a5e4  51 dc		 eor ($dc),y
$16:a5e6  6d 1c 80	  adc $801c
$16:a5e9  5f e0 77 78   eor $7877e0,x
$16:a5ed  5c e1 be d7   jml $d7bee1
$16:a5f1  8b			phb
$16:a5f2  c7 f3		 cmp [$f3]
$16:a5f4  69 86 bd	  adc #$bd86
$16:a5f7  40			rti
$16:a5f8  e6 4e		 inc $4e
$16:a5fa  90 31		 bcc $a62d
$16:a5fc  3d e2 01	  and $01e2,x
$16:a5ff  fc 55 09	  jsr ($0955,x)
$16:a602  bd 6f 97	  lda $976f,x
$16:a605  0c 1c fc	  tsb $fc1c
$16:a608  f4 14 19	  pea $1914
$16:a60b  7d 9c fe	  adc $fe9c,x
$16:a60e  d7 c4		 cmp [$c4],y
$16:a610  40			rti
$16:a611  cd e1 71	  cmp $71e1
$16:a614  82 69 24	  brl $ca80
$16:a617  bd a0 aa	  lda $aaa0,x
$16:a61a  a3 8d		 lda $8d,s
$16:a61c  42 22		 wdm #$22
$16:a61e  b0 c8		 bcs $a5e8
$16:a620  dc 3e 2f	  jml [$2f3e]
$16:a623  00 7a		 brk #$7a
$16:a625  84 3e		 sty $3e
$16:a627  09 07 26	  ora #$2607
$16:a62a  8c 16 04	  sty $0416
$16:a62d  de 28 60	  dec $6028,x
$16:a630  10 61		 bpl $a693
$16:a632  0c e3 d8	  tsb $d8e3
$16:a635  48			pha
$16:a636  2a			rol a
$16:a637  16 0d		 asl $0d,x
$16:a639  87 83		 sta [$83]
$16:a63b  60			rts
$16:a63c  27 09		 and [$09]
$16:a63e  07 82		 ora [$82]
$16:a640  01 c0		 ora ($c0,x)
$16:a642  26 8d		 rol $8d
$16:a644  03 01		 ora $01,s
$16:a646  80 26		 bra $a66e
$16:a648  8d 80 3c	  sta $3c80
$16:a64b  0c e5 89	  tsb $89e5
$16:a64e  bb			tyx
$16:a64f  8e 27 07	  stx $0727
$16:a652  8f c0 06 e1   sta $e106c0
$16:a656  0f 80 3e c2   ora $c23e80
$16:a65a  1b			tcs
$16:a65b  02 7f		 cop #$7f
$16:a65d  90 25		 bcc $a684
$16:a65f  1a			inc a
$16:a660  45 90		 eor $90
$16:a662  07 2f		 ora [$2f]
$16:a664  42 00		 wdm #$00
$16:a666  57 00		 eor [$00],y
$16:a668  d8			cld
$16:a669  78			sei
$16:a66a  28			plp
$16:a66b  16 0c		 asl $0c,x
$16:a66d  00 7d		 brk #$7d
$16:a66f  8c e5 20	  sty $20e5
$16:a672  7f 04 32 77   adc $773204,x
$16:a676  0f 92 42 e5   ora $e54292
$16:a67a  91 b7		 sta ($b7),y
$16:a67c  bb			tyx
$16:a67d  0b			phd
$16:a67e  c2 21		 rep #$21
$16:a680  00 8a		 brk #$8a
$16:a682  40			rti
$16:a683  20 80 67	  jsr $6780
$16:a686  2f 06 e3 c1   and $c1e306
$16:a68a  48			pha
$16:a68b  d0 5a		 bne $a6e7
$16:a68d  36 05		 rol $05,x
$16:a68f  70 2e		 bvs $a6bf
$16:a691  80 6c		 bra $a6ff
$16:a693  89 e0 81	  bit #$81e0
$16:a696  0a			asl a
$16:a697  80 98		 bra $a631
$16:a699  4d 64 df	  eor $df64
$16:a69c  88			dey
$16:a69d  44 0a 1b	  mvp $1b,$0a
$16:a6a0  01 85		 ora ($85,x)
$16:a6a2  8f 05 f6 4d   sta $4df605
$16:a6a6  22 02 84 38   jsl $388402
$16:a6aa  74 2c		 stz $2c,x
$16:a6ac  92 72		 sta ($72)
$16:a6ae  18			clc
$16:a6af  84 30		 sty $30
$16:a6b1  11 0c		 ora ($0c),y
$16:a6b3  04 23		 tsb $23
$16:a6b5  01 06		 ora ($06,x)
$16:a6b7  c1 63		 cmp ($63,x)
$16:a6b9  3f 0a d6 8c   and $8cd60a,x
$16:a6bd  40			rti
$16:a6be  23 80		 and $80,s
$16:a6c0  41 83		 eor ($83,x)
$16:a6c2  40			rti
$16:a6c3  24 f3		 bit $f3
$16:a6c5  ba			tsx
$16:a6c6  5d 92 27	  eor $2792,x
$16:a6c9  0f 90 46 e5   ora $e54690
$16:a6cd  71 89		 adc ($89),y
$16:a6cf  cc 72 31	  cpy $3172
$16:a6d2  0b			phd
$16:a6d3  85 41		 sta $41
$16:a6d5  a6 f2		 ldx $f2
$16:a6d7  fb			xce
$16:a6d8  25 a9		 and $a9
$16:a6da  72 0e		 adc ($0e)
$16:a6dc  90 1b		 bcc $a6f9
$16:a6de  94 2e		 sty $2e,x
$16:a6e0  09 06 80	  ora #$8006
$16:a6e3  f4 32 1e	  pea $1e32
$16:a6e6  09 82 58	  ora #$5882
$16:a6e9  29 1b 8e	  and #$8e1b
$16:a6ec  44 43 31	  mvp $31,$43
$16:a6ef  50 98		 bvc $a689
$16:a6f1  68			pla
$16:a6f2  34 1c		 bit $1c,x
$16:a6f4  0e 80 44	  asl $4480
$16:a6f7  38			sec
$16:a6f8  1b			tcs
$16:a6f9  09 85 e2	  ora #$e285
$16:a6fc  31 d0		 and ($d0),y
$16:a6fe  90 09		 bcc $a709
$16:a700  c3 40		 cmp $40,s
$16:a702  9a			txs
$16:a703  3b			tsc
$16:a704  f4 02 84	  pea $8402
$16:a707  32 51		 and ($51)
$16:a709  88			dey
$16:a70a  0f 3c 5d e5   ora $e55d3c
$16:a70e  ee 89 4c	  inc $4c89
$16:a711  e6 10		 inc $10
$16:a713  fb			xce
$16:a714  f4 0a fb	  pea $fb0a
$16:a717  03 9d		 ora $9d,s
$16:a719  c1 17		 cmp ($17,x)
$16:a71b  ec e5 08	  cpx $08e5
$16:a71e  0b			phd
$16:a71f  90 60		 bcc $a781
$16:a721  ce d0 71	  dec $71d0
$16:a724  1c 0a 07	  trb $070a
$16:a727  44 e3 ee	  mvp $ee,$e3
$16:a72a  7f d0 3f e7   adc $e73fd0,x
$16:a72e  c8			iny
$16:a72f  fe 4e 41	  inc $414e,x
$16:a732  fe 40 27	  inc $2740,x
$16:a735  08			php
$16:a736  43 86		 eor $86,s
$16:a738  26 14		 rol $14
$16:a73a  df e8 0f 48   cmp $480fe8,x
$16:a73e  fa			plx
$16:a73f  8a			txa
$16:a740  e1 70		 sbc ($70,x)
$16:a742  88			dey
$16:a743  2c 36 05	  bit $0536
$16:a746  07 06		 ora [$06]
$16:a748  04 16		 tsb $16
$16:a74a  1d 11 85	  ora $8511,x
$16:a74d  3e 42 3b	  rol $3b42,x
$16:a750  0a			asl a
$16:a751  83 b3		 sta $b3,s
$16:a753  81 80		 sta ($80,x)
$16:a755  6c 30 82	  jmp ($8230)
$16:a758  82 0f 41	  brl $e86a
$16:a75b  20 a0 78	  jsr $78a0
$16:a75e  30 14		 bmi $a774
$16:a760  08			php
$16:a761  05 00		 ora $00
$16:a763  22 11 0d 00   jsl $000d11
$16:a767  64 2e		 stz $2e
$16:a769  1a			inc a
$16:a76a  0e 02 b0	  asl $b002
$16:a76d  70 02		 bvs $a771
$16:a76f  21 56		 and ($56,x)
$16:a771  80 50		 bra $a7c3
$16:a773  45 02		 eor $02
$16:a775  ff 07 79 40   sbc $407907,x
$16:a779  5f e0 e6 08   eor $08e6e0,x
$16:a77d  0c 4a 18	  tsb $184a
$16:a780  f9 08 78	  sbc $7808,y
$16:a783  b8			clv
$16:a784  40			rti
$16:a785  29 0e 80	  and #$800e
$16:a788  40			rti
$16:a789  c1 02		 cmp ($02,x)
$16:a78b  1f 00 78 d8   ora $d87800,x
$16:a78f  30 1c		 bmi $a7ad
$16:a791  02 b0		 cop #$b0
$16:a793  d8			cld
$16:a794  03 25		 ora $25,s
$16:a796  e0 27 08	  cpx #$0827
$16:a799  94 84		 sty $84,x
$16:a79b  24 2b		 bit $2b
$16:a79d  41 79		 eor ($79,x)
$16:a79f  41 21		 eor ($21,x)
$16:a7a1  90 38		 bcc $a7db
$16:a7a3  3c 14 ec	  bit $ec14,x
$16:a7a6  10 83		 bpl $a72b
$16:a7a8  d8			cld
$16:a7a9  0f c0 7e 44   ora $447ec0
$16:a7ad  b0 56		 bcs $a805
$16:a7af  81 2c		 sta ($2c,x)
$16:a7b1  0d e4 1f	  ora $1fe4
$16:a7b4  02 7b		 cop #$7b
$16:a7b6  14 c6		 trb $c6
$16:a7b8  40			rti
$16:a7b9  9b			txy
$16:a7ba  02 f8		 cop #$f8
$16:a7bc  17 d8		 ora [$d8],y
$16:a7be  46 08		 lsr $08
$16:a7c0  f2 82		 sbc ($82)
$16:a7c2  40			rti
$16:a7c3  21 90		 and ($90,x)
$16:a7c5  88			dey
$16:a7c6  34 09		 bit $09,x
$16:a7c8  5e 0b 54	  lsr $540b,x
$16:a7cb  80 46		 bra $a813
$16:a7cd  e0 ce 40	  cpx #$40ce
$16:a7d0  58			cli
$16:a7d1  03 09		 ora $09,s
$16:a7d3  d7 62		 cmp [$62],y
$16:a7d5  ea			nop
$16:a7d6  37 40		 and [$40],y
$16:a7d8  42 a1		 wdm #$a1
$16:a7da  00 52		 brk #$52
$16:a7dc  02 83		 cop #$83
$16:a7de  79 09 20	  adc $2009,y
$16:a7e1  83 27		 sta $27,s
$16:a7e3  49 21 c2	  eor #$c221
$16:a7e6  15 07		 ora $07,x
$16:a7e8  82 43 e2	  brl $8a2e
$16:a7eb  b0 e8		 bcs $a7d5
$16:a7ed  b4 3e		 ldy $3e,x
$16:a7ef  33 05		 and ($05,s),y
$16:a7f1  7b			tdc
$16:a7f2  84 a2		 sty $a2
$16:a7f4  5e 86 13	  lsr $1386,x
$16:a7f7  f9 47 c0	  sbc $c047,y
$16:a7fa  a1 02		 lda ($02,x)
$16:a7fc  03 0c		 ora $0c,s
$16:a7fe  84 0c		 sty $0c
$16:a800  05 00		 ora $00
$16:a802  e0 70 3c	  cpx #$3c70
$16:a805  15 0f		 ora $0f,x
$16:a807  06 43		 asl $43
$16:a809  41 30		 eor ($30,x)
$16:a80b  80 74		 bra $a881
$16:a80d  3c 12 8f	  bit $8f12,x
$16:a810  42 18		 wdm #$18
$16:a812  53 e5		 eor ($e5,s),y
$16:a814  f0 a0		 beq $a7b6
$16:a816  7c 38 1f	  jmp ($1f38,x)
$16:a819  01 28		 ora ($28,x)
$16:a81b  42 3e		 wdm #$3e
$16:a81d  1f f8 06 de   ora $de06f8,x
$16:a821  f5 c5		 sbc $c5,x
$16:a823  a8			tay
$16:a824  61 68		 adc ($68,x)
$16:a826  1c 7a 16	  trb $167a
$16:a829  54 68 03	  mvn $03,$68
$16:a82c  41 43		 eor ($43,x)
$16:a82e  0d fa 55	  ora $55fa
$16:a831  7e 9d 5f	  ror $5f9d,x
$16:a834  a7 04		 lda [$04]
$16:a836  21 21		 and ($21,x)
$16:a838  93 79		 sta ($79,s),y
$16:a83a  4a			lsr a
$16:a83b  be 5e 6f	  ldx $6f5e,y
$16:a83e  ad 5b d7	  lda $d75b
$16:a841  1c fb c6	  trb $c6fb
$16:a844  26 f1		 rol $f1
$16:a846  89 7c 40	  bit #$407c
$16:a849  ea			nop
$16:a84a  47 70		 eor [$70]
$16:a84c  84 13		 sty $13
$16:a84e  80 9c		 bra $a7ec
$16:a850  11 e4		 ora ($e4),y
$16:a852  1c 7b 23	  trb $237b
$16:a855  1f 48 47 91   ora $914748,x
$16:a859  20 29 10	  jsr $1029
$16:a85c  da			phx
$16:a85d  52 3f		 eor ($3f)
$16:a85f  90 04		 bcc $a865
$16:a861  88			dey
$16:a862  40			rti
$16:a863  27 10		 and [$10]
$16:a865  0b			phd
$16:a866  c2 84		 rep #$84
$16:a868  d4 08		 pei ($08)
$16:a86a  a0 05 7f	  ldy #$7f05
$16:a86d  af b3 d7 5a   lda $5ad7b3
$16:a871  fa			plx
$16:a872  c3 bf		 cmp $bf,s
$16:a874  70 69		 bvs $a8df
$16:a876  dc 1a 7b	  jml [$7b1a]
$16:a879  02 6a		 cop #$6a
$16:a87b  93 5c		 sta ($5c,s),y
$16:a87d  20 95 e8	  jsr $e895
$16:a880  03 80		 ora $80,s
$16:a882  10 93		 bpl $a817
$16:a884  14 05		 trb $05
$16:a886  84 22		 sty $22
$16:a888  25 09		 and $09
$16:a88a  8c c2 23	  sty $23c2
$16:a88d  f0 c0		 beq $a84f
$16:a88f  70 43		 bvs $a8d4
$16:a891  c7 e2		 cmp [$e2]
$16:a893  fb			xce
$16:a894  08			php
$16:a895  3c 02 0c	  bit $0c02,x
$16:a898  02 12		 cop #$12
$16:a89a  9b			txy
$16:a89b  54 20 1d	  mvn $1d,$20
$16:a89e  08			php
$16:a89f  06 c2		 asl $c2
$16:a8a1  41 10		 eor ($10,x)
$16:a8a3  90 6c		 bcc $a911
$16:a8a5  34 1d		 bit $1d,x
$16:a8a7  0a			asl a
$16:a8a8  07 80		 ora [$80]
$16:a8aa  7e 21 b0	  ror $b021,x
$16:a8ad  0d 87 00	  ora $0087
$16:a8b0  44 23 e0	  mvp $e0,$23
$16:a8b3  90 14		 bcc $a8c9
$16:a8b5  ce 3b 0a	  dec $0a3b
$16:a8b8  77 84		 adc [$84],y
$16:a8ba  5e 01 1a	  lsr $1a01,x
$16:a8bd  84 c5		 sty $c5
$16:a8bf  21 f1		 and ($f1,x)
$16:a8c1  e8			inx
$16:a8c2  0b			phd
$16:a8c3  e4 a0		 cpx $a0
$16:a8c5  af a1 7d 80   lda $807da1
$16:a8c9  16 2e		 asl $2e,x
$16:a8cb  1a			inc a
$16:a8cc  0b			phd
$16:a8cd  84 80		 sty $80
$16:a8cf  22 01 10 f8   jsl $f81001
$16:a8d3  48			pha
$16:a8d4  2a			rol a
$16:a8d5  12 0f		 ora ($0f)
$16:a8d7  86 83		 stx $83
$16:a8d9  40			rti
$16:a8da  26 11		 rol $11
$16:a8dc  28			plp
$16:a8dd  07 e2		 ora [$e2]
$16:a8df  c0 fa 08	  cpy #$08fa
$16:a8e2  c4 5e		 cpy $5e
$16:a8e4  21 1f		 and ($1f,x)
$16:a8e6  88			dey
$16:a8e7  44 e2 10	  mvp $10,$e2
$16:a8ea  88			dey
$16:a8eb  c4 4e		 cpy $4e
$16:a8ed  1e fb 20	  asl $20fb,x
$16:a8f0  08			php
$16:a8f1  10 49		 bpl $a93c
$16:a8f3  fe 4b e4	  inc $e44b,x
$16:a8f6  f0 4c		 beq $a944
$16:a8f8  3a			dec a
$16:a8f9  11 0f		 ora ($0f),y
$16:a8fb  84 43		 sty $43
$16:a8fd  20 15 09	  jsr $0915
$16:a900  86 43		 stx $43
$16:a902  c0 1b 23	  cpy #$231b
$16:a905  0a			asl a
$16:a906  08			php
$16:a907  49 7c b0	  eor #$b07c
$16:a90a  48			pha
$16:a90b  04 2a		 tsb $2a
$16:a90d  08			php
$16:a90e  b2 75		 lda ($75)
$16:a910  62 30 62	  per $0b43
$16:a913  1c 88 48	  trb $4888
$16:a916  64 62		 stz $62
$16:a918  05 04		 ora $04
$16:a91a  8c c0 a0	  sty $a0c0
$16:a91d  ad 90 03	  lda $0390
$16:a920  34 70		 bit $70,x
$16:a922  04 30		 tsb $30
$16:a924  27 40		 and [$40]
$16:a926  9f c2 25 3d   sta $3d25c2,x
$16:a92a  ab			plb
$16:a92b  da			phx
$16:a92c  e3 70		 sbc $70,s
$16:a92e  49 04 6e	  eor #$6e04
$16:a931  57 18		 eor [$18],y
$16:a933  9c c7 23	  stz $23c7
$16:a936  10 b8		 bpl $a8f0
$16:a938  54 1a 6b	  mvn $6b,$1a
$16:a93b  0f bb df d6   ora $d6dfbb
$16:a93f  20 e5 01	  jsr $01e5
$16:a942  d8			cld
$16:a943  0e c2 17	  asl $17c2
$16:a946  04 83		 tsb $83
$16:a948  40			rti
$16:a949  72 17		 adc ($17)
$16:a94b  8e a6 b3	  stx $b3a6
$16:a94e  61 40		 adc ($40,x)
$16:a950  b4 6c		 ldy $6c,x
$16:a952  3b			tsc
$16:a953  11 0c		 ora ($0c),y
$16:a955  c5 42		 cmp $42
$16:a957  60			rts
$16:a958  5c 0e 05 63   jml $63050e
$16:a95c  c1 dc		 cmp ($dc,x)
$16:a95e  fe 40 34	  inc $3440,x
$16:a961  17 02		 ora [$02],y
$16:a963  a0 14 82	  ldy #$8214
$16:a966  41 a0		 eor ($a0,x)
$16:a968  a0 29 c3	  ldy #$c329
$16:a96b  cf 22 c3 d0   cmp $d0c322
$16:a96f  bc b2 01	  ldy $01b2,x
$16:a972  98			tya
$16:a973  61 68		 adc ($68,x)
$16:a975  1a			inc a
$16:a976  5b			tcd
$16:a977  00 e4		 brk #$e4
$16:a979  39 a7 70	  and $70a7,y
$16:a97c  bf 4e 2f d1   lda $d12f4e,x
$16:a980  a2 10 ce	  ldx #$ce10
$16:a983  88			dey
$16:a984  47 32		 eor [$32]
$16:a986  bf 37 58 ad   lda $ad5837,x
$16:a98a  e8			inx
$16:a98b  85 93		 sta $93
$16:a98d  c6 0d		 dec $0d
$16:a98f  e1 2f		 sbc ($2f,x)
$16:a991  88			dey
$16:a992  1c c2 57	  trb $57c2
$16:a995  14 39		 trb $39
$16:a997  91 cc		 sta ($cc),y
$16:a999  20 11 e3	  jsr $e311
$16:a99c  f9 c6 8f	  sbc $8fc6,y
$16:a99f  eb			xba
$16:a9a0  16 11		 asl $11,x
$16:a9a2  00 88		 brk #$88
$16:a9a4  3e 90 84	  rol $8490,x
$16:a9a7  98			tya
$16:a9a8  24 49		 bit $49
$16:a9aa  1e 50 0b	  asl $0b50,x
$16:a9ad  c4 02		 cpy $02
$16:a9af  70 a1		 bvs $a952
$16:a9b1  15 02		 ora $02,x
$16:a9b3  28			plp
$16:a9b4  82 20 5e	  brl $07d7
$16:a9b7  f5 f6		 sbc $f6,x
$16:a9b9  ce 60 cc	  dec $cc60
$16:a9bc  f0 9e		 beq $a95c
$16:a9be  c0 9a 61	  cpy #$619a
$16:a9c1  35 85		 and $85,x
$16:a9c3  34 c9		 bit $c9,x
$16:a9c5  a6 08		 ldx $08
$16:a9c7  76 3f		 ror $3f,x
$16:a9c9  b0 00		 bcs $a9cb
$16:a9cb  20 80 3b	  jsr $3b80
$16:a9ce  da			phx
$16:a9cf  61 20		 adc ($20,x)
$16:a9d1  b0 4c		 bcs $aa1f
$16:a9d3  2f 50 89 73   and $738950
$16:a9d7  c1 e0		 cmp ($e0,x)
$16:a9d9  16 08		 asl $08,x
$16:a9db  05 ea		 ora $ea
$16:a9dd  01 2e		 ora ($2e,x)
$16:a9df  88			dey
$16:a9e0  3b			tsc
$16:a9e1  dc 2f e2	  jml [$e22f]
$16:a9e4  8f 77 94 04   sta $049477
$16:a9e8  5b			tcd
$16:a9e9  d1 e8		 cmp ($e8),y
$16:a9eb  04 85		 tsb $85
$16:a9ed  de 30 78	  dec $7830,x
$16:a9f0  3c 1a 1d	  bit $1d1a,x
$16:a9f3  18			clc
$16:a9f4  9c 58 fc	  stz $fc58
$16:a9f7  1d fe 01	  ora $01fe,x
$16:a9fa  3c 2f f0	  bit $f02f,x
$16:a9fd  08			php
$16:a9fe  1c 18 7a	  trb $7a18
$16:aa01  30 58		 bmi $aa5b
$16:aa03  04 5e		 tsb $5e
$16:aa05  01 5c		 ora ($5c,x)
$16:aa07  80 68		 bra $aa71
$16:aa09  1d e1 80	  ora $80e1,x
$16:aa0c  c0 50 28	  cpy #$2850
$16:aa0f  1a			inc a
$16:aa10  0f 07 03 c1   ora $c10307
$16:aa14  30 98		 bmi $a9ae
$16:aa16  77 23		 adc [$23],y
$16:aa18  9e e8 7b	  stz $7be8,x
$16:aa1b  bc 4e 21	  ldy $214e,x
$16:aa1e  c0 36 8d	  cpy #$8d36
$16:aa21  02 01		 cop #$01
$16:aa23  d0 80		 bne $a9a5
$16:aa25  4a			lsr a
$16:aa26  20 11 22	  jsr $2211
$16:aa29  1d c7 b4	  ora $b4c7,x
$16:aa2c  db			stp
$16:aa2d  e1 6d		 sbc ($6d,x)
$16:aa2f  c3 20		 cmp $20,s
$16:aa31  1c 41 6c	  trb $6c41
$16:aa34  c1 16		 cmp ($16,x)
$16:aa36  ea			nop
$16:aa37  b3 f3		 lda ($f3,s),y
$16:aa39  f9 21 c2	  sbc $c221,y
$16:aa3c  80 84		 bra $a9c2
$16:aa3e  04 20		 tsb $20
$16:aa40  33 e1		 and ($e1,s),y
$16:aa42  b6 2d		 ldx $2d,y
$16:aa44  c7 1b		 cmp [$1b]
$16:aa46  b4 0e		 ldy $0e,x
$16:aa48  1a			inc a
$16:aa49  ac 01 96	  ldy $9601
$16:aa4c  42 9e		 wdm #$9e
$16:aa4e  cb			wai
$16:aa4f  0f 8d ce 2d   ora $2dce8d
$16:aa53  fe 0d fe	  inc $fe0d,x
$16:aa56  03 fe		 ora $fe,s
$16:aa58  62 08 12	  per $bc63
$16:aa5b  48			pha
$16:aa5c  e0 70 08	  cpx #$0870
$16:aa5f  a4 02		 ldy $02
$16:aa61  a0 87 18	  ldy #$1887
$16:aa64  07 c2		 ora [$c2]
$16:aa66  01 18		 ora ($18,x)
$16:aa68  82 52 7f	  brl $29bd
$16:aa6b  fa			plx
$16:aa6c  cc 7f de	  cpy $de7f
$16:aa6f  0f fd 80 ff   ora $ff80fd
$16:aa73  a0 01 d0	  ldy #$d001
$16:aa76  17 85		 ora [$85],y
$16:aa78  e1 10		 sbc ($10,x)
$16:aa7a  14 88		 trb $88
$16:aa7c  05 52		 ora $52
$16:aa7e  01 09		 ora ($09,x)
$16:aa80  80 08		 bra $aa8a
$16:aa82  00 cc		 brk #$cc
$16:aa84  0c f6 39	  tsb $39f6
$16:aa87  07 03		 ora [$03]
$16:aa89  41 e0		 eor ($e0,x)
$16:aa8b  e8			inx
$16:aa8c  7c 2e 17	  jmp ($172e,x)
$16:aa8f  07 64		 ora [$64]
$16:aa91  e0 10 e3	  cpx #$e310
$16:aa94  a0 01 cc	  ldy #$cc01
$16:aa97  0e 03 07	  asl $0703
$16:aa9a  80 43		 bra $aadf
$16:aa9c  80 91		 bra $aa2f
$16:aa9e  02 7d		 cop #$7d
$16:aaa0  84 12		 sty $12
$16:aaa2  08			php
$16:aaa3  0e 29 03	  asl $0329
$16:aaa6  5c ca a0 6a   jml $6aa0ca
$16:aaaa  06 01		 asl $01
$16:aaac  a4 85		 ldy $85
$16:aaae  d4 49		 pei ($49)
$16:aab0  96 57		 stx $57,y
$16:aab2  fb			xce
$16:aab3  03 da		 ora $da,s
$16:aab5  3e de a8	  rol $a8de,x
$16:aab8  a4 da		 ldy $da
$16:aaba  69 76 94	  adc #$9476
$16:aabd  5b			tcd
$16:aabe  a6 96		 ldx $96
$16:aac0  69 65 9a	  adc #$9a65
$16:aac3  31 3c		 and ($3c),y
$16:aac5  37 94		 and [$94],y
$16:aac7  da			phx
$16:aac8  11 76		 ora ($76),y
$16:aaca  84 5b		 sty $5b
$16:aacc  a2 0f 80	  ldx #$800f
$16:aacf  7c 2b 7a	  jmp ($7a2b,x)
$16:aad2  12 41		 ora ($41)
$16:aad4  20 88 4c	  jsr $4c88
$16:aad7  20 01 c0	  jsr $c001
$16:aada  08			php
$16:aadb  c0 74 62	  cpy #$6274
$16:aade  12 08		 ora ($08)
$16:aae0  1c 0e 0d	  trb $0d0e
$16:aae3  06 86		 asl $86
$16:aae5  c3 23		 cmp $23,s
$16:aae7  71 89		 adc ($89),y
$16:aae9  bc c2 5f	  ldy $5fc2,x
$16:aaec  20 ae d0	  jsr $d0ae
$16:aaef  2f 34 04 40   and $400434
$16:aaf3  40			rti
$16:aaf4  20 b0 04	  jsr $04b0
$16:aaf7  70 45		 bvs $ab3e
$16:aaf9  20 12 81	  jsr $8112
$16:aafc  60			rts
$16:aafd  40			rti
$16:aafe  2c 06 f0	  bit $f006
$16:ab01  bf c0 3f e5   lda $e53fc0,x
$16:ab05  0b			phd
$16:ab06  4b			phk
$16:ab07  83 7b		 sta $7b,s
$16:ab09  3e f0 7f	  rol $7ff0,x
$16:ab0c  f1 4b		 sbc ($4b),y
$16:ab0e  21 10		 and ($10,x)
$16:ab10  08			php
$16:ab11  08			php
$16:ab12  32 be		 and ($be)
$16:ab14  7f f9 fc ff   adc $fffcf9,x
$16:ab18  bf 1f f3 c1   lda $c1f31f,x
$16:ab1c  fe 70 3f	  inc $3f70,x
$16:ab1f  d4 0b		 pei ($0b)
$16:ab21  f1 00		 sbc ($00),y
$16:ab23  fe 03 02	  inc $0203,x
$16:ab26  25 00		 and $00
$16:ab28  e7 c0		 sbc [$c0]
$16:ab2a  24 d0		 bit $d0
$16:ab2c  08			php
$16:ab2d  c4 02		 cpy $02
$16:ab2f  19 00 82	  ora $8200,y
$16:ab32  2a			rol a
$16:ab33  45 52		 eor $52
$16:ab35  10 d8		 bpl $ab0f
$16:ab37  0c 2e 0d	  tsb $0d2e
$16:ab3a  07 81		 ora [$81]
$16:ab3c  45 e2		 eor $e2
$16:ab3e  33 59		 and ($59,s),y
$16:ab40  34 b2		 bit $b2,x
$16:ab42  09 2d 8e	  ora #$8e2d
$16:ab45  c7 21		 cmp [$21]
$16:ab47  b0 08		 bcs $ab51
$16:ab49  5c 12 0f 00   jml $000f12
$16:ab4d  8b			phb
$16:ab4e  c0 26 b0	  cpy #$b026
$16:ab51  29 64 4e	  and #$4e64
$16:ab54  5b			tcd
$16:ab55  13 8e		 ora ($8e,s),y
$16:ab57  40			rti
$16:ab58  c1 85		 cmp ($85,x)
$16:ab5a  40			rti
$16:ab5b  e0 60 30	  cpx #$3060
$16:ab5e  1c 06 a0	  trb $a006
$16:ab61  34 c2		 bit $c2,x
$16:ab63  d1 40		 cmp ($40),y
$16:ab65  b4 03		 ldy $03,x
$16:ab67  0b			phd
$16:ab68  80 5f		 bra $abc9
$16:ab6a  06 98		 asl $98
$16:ab6c  34 83		 bit $83,x
$16:ab6e  01 68		 ora ($68,x)
$16:ab70  75 08		 adc $08,x
$16:ab72  dc 2b f4	  jml [$f42b]
$16:ab75  00 62		 brk #$62
$16:ab77  20 81 04	  jsr $0481
$16:ab7a  0c e1 24	  tsb $24e1
$16:ab7d  00 a4		 brk #$a4
$16:ab7f  0c 32 5b	  tsb $5b32
$16:ab82  22 7a 7e e0   jsl $e07e7a
$16:ab86  1e 78 06	  asl $0678,x
$16:ab89  3c c3 80	  bit $80c3,x
$16:ab8c  c5 29		 cmp $29
$16:ab8e  d8			cld
$16:ab8f  fb			xce
$16:ab90  7d 17 8d	  adc $8d17,x
$16:ab93  c4 e3		 cpy $e3
$16:ab95  e9 3c ed	  sbc #$ed3c
$16:ab98  47 bf		 eor [$bf]
$16:ab9a  b1 bf		 lda ($bf),y
$16:ab9c  42 58		 wdm #$58
$16:ab9e  23 df		 and $df,s
$16:aba0  c8			iny
$16:aba1  f8			sed
$16:aba2  04 6a		 tsb $6a
$16:aba4  10 08		 bpl $abae
$16:aba6  84 02		 sty $02
$16:aba8  55 00		 eor $00,x
$16:abaa  82 c0 23	  brl $cf6d
$16:abad  30 08		 bmi $abb7
$16:abaf  9a			txs
$16:abb0  94 20		 sty $20,x
$16:abb2  51 e8		 eor ($e8),y
$16:abb4  24 f2		 bit $f2
$16:abb6  99 78 c4	  sta $c478,y
$16:abb9  7e 23 1f	  ror $1f23,x
$16:abbc  18			clc
$16:abbd  87 8e		 sta [$8e]
$16:abbf  d3 ef		 cmp ($ef,s),y
$16:abc1  ef 77 e1 51   sbc $51e177
$16:abc5  48			pha
$16:abc6  a4 a2		 ldy $a2
$16:abc8  b1 20		 lda ($20),y
$16:abca  d4 54		 pei ($54)
$16:abcc  2e 38 0e	  rol $0e38
$16:abcf  14 86		 trb $86
$16:abd1  4b			phk
$16:abd2  42 80		 wdm #$80
$16:abd4  6f 48 27 40   adc $402748
$16:abd8  a0 70 60	  ldy #$6070
$16:abdb  18			clc
$16:abdc  7f 0e ff 0d   adc $0dff0e,x
$16:abe0  fc 86 86	  jsr ($8686,x)
$16:abe3  41 20		 eor ($20,x)
$16:abe5  98			tya
$16:abe6  18			clc
$16:abe7  1e 13 5b	  asl $5b13,x
$16:abea  12 da		 ora ($da)
$16:abec  52 3d		 eor ($3d)
$16:abee  31 22		 and ($22),y
$16:abf0  08			php
$16:abf1  41 23		 eor ($23,x)
$16:abf3  90 0b		 bcc $ac00
$16:abf5  84 83		 sty $83
$16:abf7  c1 40		 cmp ($40,x)
$16:abf9  71 83		 adc ($83),y
$16:abfb  88			dey
$16:abfc  1a			inc a
$16:abfd  80 41		 bra $ac40
$16:abff  18			clc
$16:ac00  24 62		 bit $62
$16:ac02  41 50		 eor ($50,x)
$16:ac04  d0 25		 bne $ac2b
$16:ac06  03 00		 ora $00,s
$16:ac08  e1 26		 sbc ($26,x)
$16:ac0a  67 b7		 adc [$b7]
$16:ac0c  7d dd ef	  adc $efdd,x
$16:ac0f  fe 98 03	  inc $0398,x
$16:ac12  c2 11		 rep #$11
$16:ac14  3a			dec a
$16:ac15  90 4e		 bcc $ac65
$16:ac17  a0 59 fa	  ldy #$fa59
$16:ac1a  2f 7f 4d ff   and $ff4d7f
$16:ac1e  91 df		 sta ($df),y
$16:ac20  62 12 00	  per $ac35
$16:ac23  f8			sed
$16:ac24  46 24		 lsr $24
$16:ac26  53 08		 eor ($08,s),y
$16:ac28  56 2a		 lsr $2a,x
$16:ac2a  2b			pld
$16:ac2b  4d c9 6b	  eor $6bc9
$16:ac2e  aa			tax
$16:ac2f  32 9a		 and ($9a)
$16:ac31  a6 8f		 ldx $8f
$16:ac33  01 c3		 ora ($c3,x)
$16:ac35  c0 40 e0	  cpy #$e040
$16:ac38  10 78		 bpl $acb2
$16:ac3a  04 19		 tsb $19
$16:ac3c  60			rts
$16:ac3d  0f f4 65 93   ora $9365f4
$16:ac41  20 60 83	  jsr $8360
$16:ac44  95 f7		 sta $f7,x
$16:ac46  c0 3b 90	  cpy #$903b
$16:ac49  0c c0 3c	  tsb $3cc0
$16:ac4c  64 0f		 stz $0f
$16:ac4e  ff 2f 27 fc   sbc $fc272f,x
$16:ac52  dc 37 f8	  jml [$f837]
$16:ac55  04 fe		 tsb $fe
$16:ac57  01 1f		 ora ($1f,x)
$16:ac59  80 43		 bra $ac9e
$16:ac5b  c6 82		 dec $82
$16:ac5d  33 03		 and ($03,s),y
$16:ac5f  f7 7f		 sbc [$7f],y
$16:ac61  11 c7		 ora ($c7),y
$16:ac63  fe 37 0f	  inc $0f37,x
$16:ac66  90 86		 bcc $abee
$16:ac68  49 df 83	  eor #$83df
$16:ac6b  c5 61		 cmp $61
$16:ac6d  33 b8		 and ($b8,s),y
$16:ac6f  2c ca 29	  bit $29ca
$16:ac72  12 82		 ora ($82)
$16:ac74  c4 a1		 cpy $a1
$16:ac76  71 88		 adc ($88),y
$16:ac78  24 32		 bit $32
$16:ac7a  02 af		 cop #$af
$16:ac7c  08			php
$16:ac7d  54 ee 0d	  mvn $0d,$ee
$16:ac80  32 87		 and ($87)
$16:ac82  c4 98		 cpy $98
$16:ac84  83 18		 sta $18,s
$16:ac86  83 c3		 sta $c3,s
$16:ac88  20 63 50	  jsr $5063
$16:ac8b  d4 7f		 pei ($7f)
$16:ac8d  2c 1e 4a	  bit $4a1e
$16:ac90  e7 13		 sbc [$13]
$16:ac92  a9 c4 94	  lda #$94c4
$16:ac95  4b			phk
$16:ac96  2a			rol a
$16:ac97  15 8a		 ora $8a,x
$16:ac99  05 c3		 ora $c3
$16:ac9b  01 c0		 ora ($c0,x)
$16:ac9d  47 87		 eor [$87]
$16:ac9f  92 31		 sta ($31)
$16:aca1  c4 9c		 cpy $9c
$16:aca3  38			sec
$16:aca4  c2 59		 rep #$59
$16:aca6  d0 ac		 bne $ac54
$16:aca8  68			pla
$16:aca9  1b			tcs
$16:acaa  82 9e f7	  brl $a44b
$16:acad  f7 47		 sbc [$47],y
$16:acaf  9f de 1e c3   sta $c31ede,x
$16:acb3  b8			clv
$16:acb4  0b			phd
$16:acb5  d0 f2		 bne $aca9
$16:acb7  03 72		 ora $72,s
$16:acb9  65 80		 adc $80
$16:acbb  b4 07		 ldy $07,x
$16:acbd  f5 07		 sbc $07,x
$16:acbf  83 fb		 sta $fb,s
$16:acc1  23 ff		 and $ff,s
$16:acc3  a8			tay
$16:acc4  ef f6 37 e5   sbc $e537f6
$16:acc8  85 fc		 sta $fc
$16:acca  23 fc		 and $fc,s
$16:accc  a8			tay
$16:accd  bf d6 5d ee   lda $ee5dd6,x
$16:acd1  9e c0 21	  stz $21c0,x
$16:acd4  10 08		 bpl $acde
$16:acd6  94 02		 sty $02,x
$16:acd8  0b			phd
$16:acd9  00 8a		 brk #$8a
$16:acdb  8f c6 54 65   sta $6554c6
$16:acdf  0e 07 bb	  asl $bb07
$16:ace2  79 bf e8	  adc $e8bf,y
$16:ace5  7f f7 7c 7b   adc $7b7cf7,x
$16:ace9  be 3a 9b	  ldx $9b3a,y
$16:acec  bc ce 5f	  ldy $5fce,x
$16:acef  2f 3f 9f 9f   and $9f9f3f
$16:acf3  8e 03 7a	  stx $7a03
$16:acf6  83 72		 sta $72,s
$16:acf8  60			rts
$16:acf9  3b			tsc
$16:acfa  a8			tay
$16:acfb  05 d2		 ora $d2
$16:acfd  01 4a		 ora ($4a,x)
$16:acff  80 66		 bra $ad67
$16:ad01  e0 16 68	  cpx #$6816
$16:ad04  07 36		 ora [$36]
$16:ad06  3f fc b9 7b   and $7bb9fc,x
$16:ad0a  bf d0 7d bc   lda $bc7dd0,x
$16:ad0e  f2 fd		 sbc ($fd)
$16:ad10  00 b8		 brk #$b8
$16:ad12  44 26 10	  mvp $10,$26
$16:ad15  0e e7 63	  asl $63e7
$16:ad18  39 60 b1	  and $b160,y
$16:ad1b  63 20		 adc $20,s
$16:ad1d  d0 19		 bne $ad38
$16:ad1f  a5 22		 lda $22
$16:ad21  01 80		 ora ($80,x)
$16:ad23  88			dey
$16:ad24  60			rts
$16:ad25  20 1c 08	  jsr $081c
$16:ad28  c6 80		 dec $80
$16:ad2a  7e 57 0f	  ror $0f57,x
$16:ad2d  00 ff		 brk #$ff
$16:ad2f  2c 0a a0	  bit $a00a
$16:ad32  62 fb 5b	  per $0930
$16:ad35  dc fe f8	  jml [$f8fe]
$16:ad38  f1 f9		 sbc ($f9),y
$16:ad3a  d0 ef		 bne $ad2b
$16:ad3c  f1 39		 sbc ($39),y
$16:ad3e  fc aa 5d	  jsr ($5daa,x)
$16:ad41  14 8d		 trb $8d
$16:ad43  cd a7 3b	  cmp $3ba7
$16:ad46  4d df 57	  eor $57df
$16:ad49  b7 59		 lda [$59],y
$16:ad4b  af d2 a6 b1   lda $b1a6d2
$16:ad4f  a9 24 82	  lda #$8224
$16:ad52  37 00		 and [$00],y
$16:ad54  92 40		 sta ($40)
$16:ad56  2a			rol a
$16:ad57  d0 0a		 bne $ad63
$16:ad59  a4 02		 ldy $02
$16:ad5b  6b			rtl
$16:ad5c  00 d4		 brk #$d4
$16:ad5e  bf bc 7f e5   lda $e57fbc,x
$16:ad62  0f 30 f9 cb   ora $cbf930
$16:ad66  d0 7e		 bne $ade6
$16:ad68  94 f0		 sty $f0,x
$16:ad6a  06 c3		 asl $c3
$16:ad6c  20 31 28	  jsr $2831
$16:ad6f  1c 9e 0f	  trb $0f9e
$16:ad72  00 81		 brk #$81
$16:ad74  c0 17 40	  cpy #$4017
$16:ad77  00 38		 brk #$38
$16:ad79  74 02		 stz $02,x
$16:ad7b  39 06 98	  and $9806,y
$16:ad7e  40			rti
$16:ad7f  60			rts
$16:ad80  30 28		 bmi $adaa
$16:ad82  14 14		 trb $14
$16:ad84  18			clc
$16:ad85  31 88		 and ($88),y
$16:ad87  04 c3		 tsb $c3
$16:ad89  01 f0		 ora ($f0,x)
$16:ad8b  80 78		 bra $ae05
$16:ad8d  26 1f		 rol $1f
$16:ad8f  08			php
$16:ad90  87 f3		 sta [$f3]
$16:ad92  cd fe 06	  cmp $06fe
$16:ad95  04 22		 tsb $22
$16:ad97  21 10		 and ($10,x)
$16:ad99  90 48		 bcc $ade3
$16:ad9b  3a			dec a
$16:ad9c  14 0d		 trb $0d
$16:ad9e  06 02		 asl $02
$16:ada0  c1 08		 cmp ($08,x)
$16:ada2  ca			dex
$16:ada3  65 2d		 adc $2d
$16:ada5  00 0d		 brk #$0d
$16:ada7  b0 29		 bcs $add2
$16:ada9  b2 81		 lda ($81)
$16:adab  20 80 ae	  jsr $ae80
$16:adae  c6 08		 dec $08
$16:adb0  a6 90		 ldx $90
$16:adb2  79 41 e0	  adc $e041,y
$16:adb5  21 38		 and ($38,x)
$16:adb7  81 c1		 sta ($c1,x)
$16:adb9  f0 f0		 beq $adab
$16:adbb  5d b6 07	  eor $07b6,x
$16:adbe  a1 8b		 lda ($8b,x)
$16:adc0  d2 c3		 cmp ($c3)
$16:adc2  e6 d2		 inc $d2
$16:adc4  e8			inx
$16:adc5  d4 7b		 pei ($7b)
$16:adc7  01 04		 ora ($04,x)
$16:adc9  e3 d1		 sbc $d1,s
$16:adcb  fc f2 7f	  jsr ($7ff2,x)
$16:adce  e4 37		 cpx $37
$16:add0  f5 01		 sbc $01,x
$16:add2  ea			nop
$16:add3  c2 b4		 rep #$b4
$16:add5  d0 89		 bne $ad60
$16:add7  d4 13		 pei ($13)
$16:add9  c1 24		 cmp ($24,x)
$16:addb  e6 ff		 inc $ff
$16:addd  ff 3d ff de   sbc $deff3d,x
$16:ade1  bf c7 98 f1   lda $f198c7,x
$16:ade5  c7 fd		 cmp [$fd]
$16:ade7  b1 9b		 lda ($9b),y
$16:ade9  ac 76 ef	  ldy $ef76
$16:adec  3f e0 73 78   and $7873e0,x
$16:adf0  1d 1f 05	  ora $051f,x
$16:adf3  ab			plb
$16:adf4  51 34		 eor ($34),y
$16:adf6  8d 41 23	  sta $2341
$16:adf9  0b			phd
$16:adfa  c0 89 c0	  cpy #$c089
$16:adfd  20 5e 6e	  jsr $6e5e
$16:ae00  3f 7f 3f 3f   and $3f3f7f,x
$16:ae04  9f d4 2e 1a   sta $1a2ed4,x
$16:ae08  ef 75 e7 f1   sbc $f1e775
$16:ae0c  e7 f0		 sbc [$f0]
$16:ae0e  5f e6 10 0c   eor $0c10e6,x
$16:ae12  d4 02		 pei ($02)
$16:ae14  4f 00 e4 c0   eor $c0e400
$16:ae18  31 f0		 and ($f0),y
$16:ae1a  09 8d 03	  ora #$038d
$16:ae1d  4d 00 cc	  eor $cc00
$16:ae20  4e 37 17	  lsr $1737
$16:ae23  cf e6 ce ff   cmp $ffcee6
$16:ae27  9c cf ce	  stz $cecf
$16:ae2a  60			rts
$16:ae2b  37 f8		 and [$f8],y
$16:ae2d  07 fd		 ora [$fd]
$16:ae2f  30 70		 bmi $aea1
$16:ae31  0b			phd
$16:ae32  1c 03 67	  trb $6703
$16:ae35  00 f6		 brk #$f6
$16:ae37  40			rti
$16:ae38  38			sec
$16:ae39  d0 0c		 bne $ae47
$16:ae3b  03 bd		 ora $bd,s
$16:ae3d  b8			clv
$16:ae3e  1c 09 c7	  trb $c709
$16:ae41  e3 81		 sbc $81,s
$16:ae43  fe 9d cf	  inc $cf9d,x
$16:ae46  f8			sed
$16:ae47  70 3f		 bvs $ae88
$16:ae49  dc 0f fa	  jml [$fa0f]
$16:ae4c  1f 07 79 03   ora $037907,x
$16:ae50  83 81		 sta $81,s
$16:ae52  00 ed		 brk #$ed
$16:ae54  40			rti
$16:ae55  27 a1		 and [$a1]
$16:ae57  21 81		 and ($81,x)
$16:ae59  3b			tsc
$16:ae5a  d1 50		 cmp ($50),y
$16:ae5c  14 06		 trb $06
$16:ae5e  18			clc
$16:ae5f  40			rti
$16:ae60  32 18		 and ($18)
$16:ae62  08			php
$16:ae63  82 a1 55	  brl $0407
$16:ae66  00 c6		 brk #$c6
$16:ae68  0f 06 02 60   ora $600206
$16:ae6c  dc 00 a5	  jml [$a500]
$16:ae6f  40			rti
$16:ae70  60			rts
$16:ae71  50 38		 bvc $aeab
$16:ae73  24 1d		 bit $1d
$16:ae75  df 50 31 78   cmp $783150,x
$16:ae79  41 ed		 eor ($ed,x)
$16:ae7b  76 d8		 ror $d8,x
$16:ae7d  dc 76 17	  jml [$1776]
$16:ae80  0d 86 c3	  ora $c386
$16:ae83  e2 b1		 sep #$b1
$16:ae85  7f 7f ae ed   adc $edae7f,x
$16:ae89  e1 fc		 sbc ($fc,x)
$16:ae8b  66 e0		 ror $e0
$16:ae8d  01 e0		 ora ($e0,x)
$16:ae8f  f5 c0		 sbc $c0,x
$16:ae91  2f 70 09 ac   and $ac0970
$16:ae95  02 53		 cop #$53
$16:ae97  e0 f8		 cpx #$f8
$16:ae99  78			sei
$16:ae9a  3d 3f 1f	  and $1f3f,x
$16:ae9d  b3 ba		 lda ($ba,s),y
$16:ae9f  47 3e		 eor [$3e]
$16:aea1  a9 48		 lda #$48
$16:aea3  14 0a		 trb $0a
$16:aea5  09 06		 ora #$06
$16:aea7  87 43		 sta [$43]
$16:aea9  a3 91		 lda $91,s
$16:aeab  c9 c4		 cmp #$c4
$16:aead  e2 e1		 sep #$e1
$16:aeaf  70 f4		 bvs $aea5
$16:aeb1  78			sei
$16:aeb2  09 c4		 ora #$c4
$16:aeb4  cb			wai
$16:aeb5  18			clc
$16:aeb6  64 02		 stz $02
$16:aeb8  11 00		 ora ($00),y
$16:aeba  76 84		 ror $84,x
$16:aebc  a2 01		 ldx #$01
$16:aebe  50 20		 bvc $aee0
$16:aec0  79 ff de	  adc $deff,y
$16:aec3  71 05		 adc ($05),y
$16:aec5  83 40		 sta $40,s
$16:aec7  a0 a0		 ldy #$a0
$16:aec9  08			php
$16:aeca  66 8a		 ror $8a
$16:aecc  78			sei
$16:aecd  20 50 18	  jsr $1850
$16:aed0  7c 0a 3d	  jmp ($3d0a,x)
$16:aed3  05 9e		 ora $9e
$16:aed5  e3 7f		 sbc $7f,s
$16:aed7  31 7f		 and ($7f),y
$16:aed9  fd 73 ff	  sbc $ff73,x
$16:aedc  60			rts
$16:aedd  f7 ec		 sbc [$ec],y
$16:aedf  7f f0 58 54   adc $5458f0,x
$16:aee3  2a			rol a
$16:aee4  2b			pld
$16:aee5  14 95		 trb $95
$16:aee7  ea			nop
$16:aee8  6a			ror a
$16:aee9  55 3d		 eor $3d,x
$16:aeeb  24 12		 bit $12
$16:aeed  a7 03		 lda [$03]
$16:aeef  ae 43 76	  ldx $7643
$16:aef2  58			cli
$16:aef3  e9 fe		 sbc #$fe
$16:aef5  b3 df		 lda ($df,s),y
$16:aef7  50 ef		 bvc $aee8
$16:aef9  d0 ef		 bne $aeea
$16:aefb  f0 7f		 beq $af7c
$16:aefd  fc 7b f7	  jsr ($f77b,x)
$16:af00  79 f7 f9	  adc $f9f7,y
$16:af03  b3 d0		 lda ($d0,s),y
$16:af05  8b			phb
$16:af06  9c 87 bd	  stz $bd87
$16:af09  56 d4		 lsr $d4,x
$16:af0b  d6 b4		 dec $b4,x
$16:af0d  96 4c		 stx $4c,y
$16:af0f  ce 6a c3	  dec $c36a
$16:af12  69 c3		 adc #$c3
$16:af14  61 a3		 adc ($a3,x)
$16:af16  30 0e		 bmi $af26
$16:af18  04 03		 tsb $03
$16:af1a  00 06		 brk #$06
$16:af1c  0c 03 d4	  tsb $d403
$16:af1f  68			pla
$16:af20  1c 0e 06	  trb $060e
$16:af23  03 81		 ora $81,s
$16:af25  40			rti
$16:af26  7c 03 c4	  jmp ($c403,x)
$16:af29  9e 22 f8	  stz $f822,x
$16:af2c  07 a8		 ora [$a8]
$16:af2e  25 00		 and $00
$16:af30  00 00		 brk #$00
$16:af32  ff 0f 64 10   sbc $10640f,x
$16:af36  c8			iny
$16:af37  02 2c		 cop #$2c
$16:af39  0f 6c ae 75   ora $75ae6c
$16:af3d  35 9e		 and $9e,x
$16:af3f  46 e3		 lsr $e3
$16:af41  10 58		 bpl $af9b
$16:af43  24 6e		 bit $6e
$16:af45  03 1c		 ora $1c,s
$16:af47  89 cd		 bit #$cd
$16:af49  60			rts
$16:af4a  32 89		 and ($89)
$16:af4c  1c 02 49	  trb $4902
$16:af4f  00 83		 brk #$83
$16:af51  40			rti
$16:af52  4b			phk
$16:af53  61 1b		 adc ($1b,x)
$16:af55  88			dey
$16:af56  c5 23		 cmp $23
$16:af58  51 99		 eor ($99),y
$16:af5a  7c a2 79	  jmp ($79a2,x)
$16:af5d  33 e7		 and ($e7,s),y
$16:af5f  de 32 ff	  dec $ff32,x
$16:af62  cf fc e3 3f   cmp $3fe3fc
$16:af66  60			rts
$16:af67  a1 f0		 lda ($f0,x)
$16:af69  30 78		 bmi $afe3
$16:af6b  03 c8		 ora $c8,s
$16:af6d  40			rti
$16:af6e  fc 1f c3	  jsr ($c31f,x)
$16:af71  f8			sed
$16:af72  fe 3f 15	  inc $153f,x
$16:af75  09 85		 ora #$85
$16:af77  03 40		 ora $40,s
$16:af79  ff 17 78 48   sbc $487817,x
$16:af7d  3f f0 04 7e   and $7e04f0,x
$16:af81  27 bb		 and [$bb]
$16:af83  fb			xce
$16:af84  01 ff		 ora ($ff,x)
$16:af86  40			rti
$16:af87  16 20		 asl $20,x
$16:af89  95 98		 sta $98,x
$16:af8b  14 02		 trb $02
$16:af8d  02 c1		 cop #$c1
$16:af8f  12 13		 ora ($13)
$16:af91  bd 41 f4	  lda $f441,x
$16:af94  40			rti
$16:af95  d0 6b		 bne $b002
$16:af97  05 81		 ora $81
$16:af99  b2 3a		 lda ($3a)
$16:af9b  09 04		 ora #$04
$16:af9d  41 e4		 eor ($e4,x)
$16:af9f  00 e2		 brk #$e2
$16:afa1  05 83		 ora $83
$16:afa3  50 34		 bvc $afd9
$16:afa5  0e 91 a0	  asl $a091
$16:afa8  41 20		 eor ($20,x)
$16:afaa  f0 08		 beq $afb4
$16:afac  1c 0a 06	  trb $060a
$16:afaf  c2 18		 rep #$18
$16:afb1  3c 22 1f	  bit $1f22,x
$16:afb4  02 85		 cop #$85
$16:afb6  c1 61		 cmp ($61,x)
$16:afb8  10 78		 bpl $b032
$16:afba  3c 0c 02	  bit $020c,x
$16:afbd  10 28		 bpl $afe7
$16:afbf  0c 06 0b	  tsb $0b06
$16:afc2  02 87		 cop #$87
$16:afc4  98			tya
$16:afc5  42 13		 wdm #$13
$16:afc7  06 84		 asl $84
$16:afc9  7d 30 bf	  adc $bf30,x
$16:afcc  6e 3d ef	  ror $ef3d
$16:afcf  27 3f		 and [$3f]
$16:afd1  e7 ee		 sbc [$ee]
$16:afd3  6c 32 0f	  jmp ($0f32)
$16:afd6  01 f4		 ora ($f4,x)
$16:afd8  2a			rol a
$16:afd9  77 0c		 adc [$0c],y
$16:afdb  8e 6b 81	  stx $816b
$16:afde  c9 ac		 cmp #$ac
$16:afe0  77 33		 adc [$33],y
$16:afe2  15 9b		 ora $9b,x
$16:afe4  44 3a 41	  mvp $41,$3a
$16:afe7  c7 e0		 cmp [$e0]
$16:afe9  49 3a		 eor #$3a
$16:afeb  1a			inc a
$16:afec  40			rti
$16:afed  28			plp
$16:afee  00 42		 brk #$42
$16:aff0  0d 07 8c	  ora $8c07
$16:aff3  c7 e6		 cmp [$e6]
$16:aff5  f3 bb		 sbc ($bb,s),y
$16:aff7  55 da		 eor $da,x
$16:aff9  5d 32 98	  eor $9832,x
$16:affc  ce 19 42	  dec $4219
$16:afff  c2 06		 rep #$06
$16:b001  00 42		 brk #$42
$16:b003  60			rts
$16:b004  11 68		 ora ($68),y
$16:b006  04 a6		 tsb $a6
$16:b008  01 4f		 ora ($4f,x)
$16:b00a  83 75		 sta $75,s
$16:b00c  33 1c		 and ($1c,s),y
$16:b00e  0a			asl a
$16:b00f  c7 03		 cmp [$03]
$16:b011  79 80 bf	  adc $bf80,y
$16:b014  40			rti
$16:b015  0a			asl a
$16:b016  a1 f8		 lda ($f8,x)
$16:b018  2c 0f 81	  bit $810f
$16:b01b  94 0e		 sty $0e,x
$16:b01d  a0 90 38	  ldy #$3890
$16:b020  45 cc		 eor $cc
$16:b022  0e 60 34	  asl $3460
$16:b025  f9 eb d9	  sbc $d9eb,y
$16:b028  43 09		 eor $09,s
$16:b02a  87 c1		 sta [$c1]
$16:b02c  a1 71		 lda ($71,x)
$16:b02e  18			clc
$16:b02f  f4 32 2f	  pea $2f32
$16:b032  1b			tcs
$16:b033  86 c5		 stx $c5
$16:b035  63 70		 adc $70,s
$16:b037  b8			clv
$16:b038  b5 1a		 lda $1a,x
$16:b03a  38			sec
$16:b03b  45 18		 eor $18
$16:b03d  34 02		 bit $02,x
$16:b03f  23 00		 and $00,s
$16:b041  86 40		 stx $40
$16:b043  23 70		 and $70,s
$16:b045  08			php
$16:b046  a4 82		 ldy $82
$16:b048  11 60		 ora ($60),y
$16:b04a  90 da		 bcc $b026
$16:b04c  b3 dc		 lda ($dc,s),y
$16:b04e  d9 ec 77	  cmp $77ec,y
$16:b051  f9 7d fe	  sbc $fe7d,y
$16:b054  fe bf 7c	  inc $7cbf,x
$16:b057  6e 1c ee	  ror $ee1c
$16:b05a  07 66		 ora [$66]
$16:b05c  93 c0		 sta ($c0,s),y
$16:b05e  ad b0 0e	  lda $0eb0
$16:b061  74 02		 stz $02,x
$16:b063  35 00		 and $00,x
$16:b065  b9 c0 30	  lda $30c0,y
$16:b068  90 01		 bcc $b06b
$16:b06a  f0 71		 beq $b0dd
$16:b06c  60			rts
$16:b06d  19 af f4	  ora $f4af,y
$16:b070  cf f7 ce cf   cmp $cfcef7
$16:b074  fe 6d 79	  inc $796d,x
$16:b077  be e4 f3	  ldx $f3e4,y
$16:b07a  4d 7e b9	  eor $b97e
$16:b07d  ff ed be f9   sbc $f9beed,x
$16:b081  94 06		 sty $06,x
$16:b083  15 04		 ora $04,x
$16:b085  80 e4		 bra $b06b
$16:b087  20 16 c8	  jsr $c816
$16:b08a  07 4e		 ora [$4e]
$16:b08c  01 a5		 ora ($a5,x)
$16:b08e  80 54		 bra $b0e4
$16:b090  e0 15 5e	  cpx #$5e15
$16:b093  06 03		 asl $03
$16:b095  c1 e0		 cmp ($e0,x)
$16:b097  b0 78		 bcs $b111
$16:b099  38			sec
$16:b09a  1c 0d 86	  trb $860d
$16:b09d  c2 e1		 rep #$e1
$16:b09f  70 90		 bvs $b031
$16:b0a1  48			pha
$16:b0a2  1e a1 80	  asl $80a1,x
$16:b0a5  31 0d		 and ($0d),y
$16:b0a7  00 cc		 brk #$cc
$16:b0a9  1b			tcs
$16:b0aa  08			php
$16:b0ab  05 80		 ora $80
$16:b0ad  be 3d 03	  ldx $033d,y
$16:b0b0  3f 87 7c 4c   and $4c7c87,x
$16:b0b4  d0 11		 bne $b0c7
$16:b0b6  b0 8a		 bcs $b042
$16:b0b8  74 92		 stz $92,x
$16:b0ba  77 b9		 adc [$b9],y
$16:b0bc  2d ca 11	  and $11ca
$16:b0bf  ed 80 5f	  sbc $5f80
$16:b0c2  a9 57 e8	  lda #$e857
$16:b0c5  16 e2		 asl $e2,x
$16:b0c7  01 bc		 ora ($bc,x)
$16:b0c9  8a			txa
$16:b0ca  67 22		 adc [$22]
$16:b0cc  93 19		 sta ($19,s),y
$16:b0ce  25 1e		 and $1e
$16:b0d0  93 5d		 sta ($5d,s),y
$16:b0d2  a1 7b		 lda ($7b,x)
$16:b0d4  3d 9a 0d	  and $0d9a,x
$16:b0d7  17 43		 ora [$43],y
$16:b0d9  a9 d8 ec	  lda #$ecd8
$16:b0dc  7e 3b 14	  ror $143b,x
$16:b0df  1c 00 3b	  trb $3b00
$16:b0e2  2c 18 0e	  bit $0e18
$16:b0e5  00 36		 brk #$36
$16:b0e7  fe 02 6f	  inc $6f02,x
$16:b0ea  4f 67 fd 5c   eor $5cfd67
$16:b0ee  b7 f8		 lda [$f8],y
$16:b0f0  05 75		 ora $75
$16:b0f2  70 31		 bvs $b125
$16:b0f4  d4 f7		 pei ($f7)
$16:b0f6  e8			inx
$16:b0f7  24 1e		 bit $1e
$16:b0f9  06 85		 asl $85
$16:b0fb  80 41		 bra $b13e
$16:b0fd  7d 90 48	  adc $4890,x
$16:b100  04 0d		 tsb $0d
$16:b102  7d 70 c8	  adc $c870,x
$16:b105  04 3e		 tsb $3e
$16:b107  09 06 81	  ora #$8106
$16:b10a  2f a2 0f 44   and $440fa2
$16:b10e  83 c1		 sta $c1,s
$16:b110  02 21		 cop #$21
$16:b112  0b			phd
$16:b113  84 43		 sty $43
$16:b115  e1 10		 sbc ($10,x)
$16:b117  78			sei
$16:b118  04 2e		 tsb $2e
$16:b11a  01 05		 ora ($05,x)
$16:b11c  82 60 28	  brl $d97f
$16:b11f  18			clc
$16:b120  20 20 42	  jsr $4220
$16:b123  1d c1 02	  ora $02c1,x
$16:b126  81 42		 sta ($42,x)
$16:b128  21 10		 and ($10,x)
$16:b12a  e8			inx
$16:b12b  70 a0		 bvs $b0cd
$16:b12d  2a			rol a
$16:b12e  75 8f		 adc $8f,x
$16:b130  df e2 f3 78   cmp $78f3e2,x
$16:b134  be df 2d	  ldx $2ddf,y
$16:b137  f7 e9		 sbc [$e9],y
$16:b139  bc fa 35	  ldy $35fa,x
$16:b13c  1e 8c c7	  asl $c78c,x
$16:b13f  e0 db 08	  cpx #$08db
$16:b142  3c 22 07	  bit $0722,x
$16:b145  a4 80		 ldy $80
$16:b147  6c 84 63	  jmp ($6384)
$16:b14a  54 80 4a	  mvn $4a,$80
$16:b14d  c4 60		 cpy $60
$16:b14f  81 04		 sta ($04,x)
$16:b151  08			php
$16:b152  78			sei
$16:b153  0a			asl a
$16:b154  42 8f		 wdm #$8f
$16:b156  0e 42 08	  asl $0842
$16:b159  50 68		 bvc $b1c3
$16:b15b  81 03		 sta ($03,x)
$16:b15d  27 9d		 and [$9d]
$16:b15f  7c fc d2	  jmp ($d2fc,x)
$16:b162  e8			inx
$16:b163  d5 12		 cmp $12,x
$16:b165  31 0c		 and ($0c),y
$16:b167  8a			txa
$16:b168  4a			lsr a
$16:b169  21 b2		 and ($b2,x)
$16:b16b  58			cli
$16:b16c  3c 2e 1d	  bit $1d2e,x
$16:b16f  06 86		 asl $86
$16:b171  43 21		 eor $21,s
$16:b173  17 88		 ora [$88],y
$16:b175  0d c2 10	  ora $10c2
$16:b178  4a			lsr a
$16:b179  09 44 16	  ora #$1644
$16:b17c  7b			tdc
$16:b17d  0a			asl a
$16:b17e  85 41		 sta $41
$16:b180  20 82 90	  jsr $9082
$16:b183  80 47		 bra $b1cc
$16:b185  a3 b7		 lda $b7,s
$16:b187  9b			txy
$16:b188  fe 23 df	  inc $df23,x
$16:b18b  b5 f3		 lda $f3,x
$16:b18d  7f a9 9f 38   adc $389fa9,x
$16:b191  fd be 3b	  sbc $3bbe,x
$16:b194  1c 8b c0	  trb $c08b
$16:b197  2e d6 0b	  rol $0bd6
$16:b19a  4f 83 f1 f1   eor $f1f183
$16:b19e  ff 78 fd 14   sbc $14fd78,x
$16:b1a2  0a			asl a
$16:b1a3  1c 0e 0f	  trb $0f0e
$16:b1a6  0f 8f fa 7d   ora $7dfa8f
$16:b1aa  fe cf 9f	  inc $9fcf,x
$16:b1ad  e4 32		 cpx $32
$16:b1af  11 ff		 ora ($ff),y
$16:b1b1  cd ff eb	  cmp $ebff
$16:b1b4  fb			xce
$16:b1b5  a7 5c		 lda [$5c]
$16:b1b7  71 df		 adc ($df),y
$16:b1b9  18			clc
$16:b1ba  06 c6		 asl $c6
$16:b1bc  01 cc		 ora ($cc,x)
$16:b1be  f0 46		 beq $b206
$16:b1c0  7c 12 08	  jmp ($0812,x)
$16:b1c3  04 e6		 tsb $e6
$16:b1c5  01 75		 ora ($75,x)
$16:b1c7  80 73		 bra $b23c
$16:b1c9  b0 18		 bcs $b1e3
$16:b1cb  ee 07 03	  inc $0307
$16:b1ce  c1 e0		 cmp ($e0,x)
$16:b1d0  b0 78		 bcs $b24a
$16:b1d2  3e 1f 0b	  rol $0b1f,x
$16:b1d5  87 c3		 sta [$c3]
$16:b1d7  71 f8		 adc ($f8),y
$16:b1d9  ec 7e 3f	  cpx $3f7e
$16:b1dc  9f c8 05 80   sta $8005c8,x
$16:b1e0  a0 37 08	  ldy #$0837
$16:b1e3  06 82		 asl $82
$16:b1e5  01 58		 ora ($58,x)
$16:b1e7  02 8f		 cop #$8f
$16:b1e9  52 01		 eor ($01)
$16:b1eb  b8			clv
$16:b1ec  3f 78 7b 60   and $607b78,x
$16:b1f0  22 e0 17 80   jsl $8017e0
$16:b1f4  92 87		 sta ($87)
$16:b1f6  e2 3e		 sep #$3e
$16:b1f8  02 18		 cop #$18
$16:b1fa  87 96		 sta [$96]
$16:b1fc  c9 04		 cmp #$04
$16:b1fe  be 54 23	  ldx $2354,y
$16:b201  10 8e		 bpl $b191
$16:b203  44 03 b1	  mvp $b1,$03
$16:b206  98			tya
$16:b207  98			tya
$16:b208  4c 09 82	  jmp $8209
$16:b20b  0d 0d 07	  ora $070d
$16:b20e  73 b1		 adc ($b1,s),y
$16:b210  e0 e0		 cpx #$e0
$16:b212  6e 30 1c	  ror $1c30
$16:b215  0f 44 02 a0   ora $a00244
$16:b219  5b			tcd
$16:b21a  23 77		 and $77,s
$16:b21c  9f fd 21 e9   sta $e921fd,x
$16:b220  eb			xba
$16:b221  8c c0 23	  sty $23c0
$16:b224  0b			phd
$16:b225  01 88		 ora ($88,x)
$16:b227  2d 0d 75	  and $750d
$16:b22a  e4 c1		 cpx $c1
$16:b22c  d0 48		 bne $b276
$16:b22e  38			sec
$16:b22f  14 06		 trb $06
$16:b231  8a			txa
$16:b232  36 08		 rol $08,x
$16:b234  98			tya
$16:b235  2d c0 90	  and $90c0
$16:b238  2f a5 b8 4f   and $4fb8a5
$16:b23c  1f 7f 54 0a   ora $0a547f,x
$16:b240  01 0b		 ora ($0b,x)
$16:b242  80 42		 bra $b286
$16:b244  61 10		 adc ($10,x)
$16:b246  c8			iny
$16:b247  44 2a 15	  mvp $15,$2a
$16:b24a  05 82		 ora $82
$16:b24c  40			rti
$16:b24d  81 e0		 sta ($e0,x)
$16:b24f  12 08		 ora ($08)
$16:b251  2c 3a 05	  bit $053a
$16:b254  07 85		 ora [$85]
$16:b256  c0 e1		 cpy #$e1
$16:b258  30 38		 bmi $b292
$16:b25a  3c 06 0f	  bit $0f06,x
$16:b25d  00 81		 brk #$81
$16:b25f  93 02		 sta ($02,s),y
$16:b261  19 0f 86	  ora $860f,y
$16:b264  c3 a0		 cmp $a0,s
$16:b266  f0 68		 beq $b2d0
$16:b268  34 1e		 bit $1e,x
$16:b26a  06 37		 asl $37
$16:b26c  18			clc
$16:b26d  0c 05 ba	  tsb $ba05
$16:b270  31 48		 and ($48),y
$16:b272  04 16		 tsb $16
$16:b274  00 11		 brk #$11
$16:b276  00 78		 brk #$78
$16:b278  10 80		 bpl $b1fa
$16:b27a  78			sei
$16:b27b  00 f0		 brk #$f0
$16:b27d  80 e3		 bra $b262
$16:b27f  20 18 08	  jsr $0818
$16:b282  04 83		 tsb $83
$16:b284  01 d0		 ora ($d0,x)
$16:b286  80 7c		 bra $b304
$16:b288  20 17 8c	  jsr $8c17
$16:b28b  06 e3		 asl $e3
$16:b28d  81 d8		 sta ($d8,x)
$16:b28f  f0 3f		 beq $b2d0
$16:b291  94 a2		 sty $a2,x
$16:b293  05 10		 ora $10
$16:b295  6e 01 a0	  ror $a001
$16:b298  8d fe 7e	  sta $7efe
$16:b29b  c8			iny
$16:b29c  42 3c		 wdm #$3c
$16:b29e  20 f1 28	  jsr $28f1
$16:b2a1  1c 8a 07	  trb $078a
$16:b2a4  0c 81 c4	  tsb $c481
$16:b2a7  47 60		 eor [$60]
$16:b2a9  29 08		 and #$08
$16:b2ab  1c 22 00	  trb $0022
$16:b2ae  18			clc
$16:b2af  08			php
$16:b2b0  f4 16 7d	  pea $7d16
$16:b2b3  09 86		 ora #$86
$16:b2b5  c0 a3		 cpy #$a3
$16:b2b7  f0 68		 beq $b321
$16:b2b9  ec 28 54	  cpx $5428
$16:b2bc  11 38		 ora ($38),y
$16:b2be  7c 1e 3d	  jmp ($3d1e,x)
$16:b2c1  17 9e		 ora [$9e],y
$16:b2c3  47 ed		 eor [$ed]
$16:b2c5  13 ff		 ora ($ff,s),y
$16:b2c7  05 17		 ora $17
$16:b2c9  83 8e		 sta $8e,s
$16:b2cb  83 47		 sta $47,s
$16:b2cd  21 91		 and ($91,x)
$16:b2cf  f5 f8		 sbc $f8,x
$16:b2d1  cf e3 f5 c9   cmp $c9f5e3
$16:b2d5  e4 a3		 cpx $a3
$16:b2d7  91 44		 sta ($44),y
$16:b2d9  c7 42		 cmp [$42]
$16:b2db  23 91		 and $91,s
$16:b2dd  09 c6		 ora #$c6
$16:b2df  7e c1 fb	  ror $fbc1,x
$16:b2e2  a2 76		 ldx #$76
$16:b2e4  ec 99 99	  cpx $9999
$16:b2e7  34 66		 bit $66,x
$16:b2e9  4d 1a 93	  eor $931a
$16:b2ec  c2 a6		 rep #$a6
$16:b2ee  f0 b9		 beq $b2a9
$16:b2f0  be 03 3f	  ldx $3f03,y
$16:b2f3  80 fd		 bra $b2f2
$16:b2f5  c0 23		 cpy #$23
$16:b2f7  70 0a		 bvs $b303
$16:b2f9  cc 03 33	  cpy $3303
$16:b2fc  00 8d		 brk #$8d
$16:b2fe  28			plp
$16:b2ff  00 86		 brk #$86
$16:b301  15 ce		 ora $ce,x
$16:b303  e5 bb		 sbc $bb
$16:b305  dd 66 f3	  cmp $f366,x
$16:b308  58			cli
$16:b309  bc 57 0f	  ldy $0f57,x
$16:b30c  83 dc		 sta $dc,s
$16:b30e  a6 05		 ldx $05
$16:b310  70 97		 bvs $b2a9
$16:b312  40			rti
$16:b313  2a			rol a
$16:b314  90 0a		 bcc $b320
$16:b316  d0 04		 bne $b31c
$16:b318  6c 50 0b	  jmp ($0b50)
$16:b31b  00 24		 brk #$24
$16:b31d  64 07		 stz $07
$16:b31f  e3 82		 sbc $82,s
$16:b321  0b			phd
$16:b322  82 09 0c	  brl $bf2e
$16:b325  23 98		 and $98,s
$16:b327  38			sec
$16:b328  c2 82		 rep #$82
$16:b32a  24 10		 bit $10
$16:b32c  d3 9f		 cmp ($9f,s),y
$16:b32e  90 d4		 bcc $b304
$16:b330  18			clc
$16:b331  82 d0 64	  brl $1804
$16:b334  37 03		 and [$03],y
$16:b336  09 80 0f	  ora #$0f80
$16:b339  80 7c		 bra $b3b7
$16:b33b  e1 04		 sbc ($04,x)
$16:b33d  2d 11 7e	  and $7e11
$16:b340  20 85 cc	  jsr $cc85
$16:b343  3c 7a 27	  bit $277a,x
$16:b346  d3 5e		 cmp ($5e,s),y
$16:b348  ab			plb
$16:b349  f5 e7		 sbc $e7,x
$16:b34b  b3 7d		 lda ($7d,s),y
$16:b34d  bd ee ff	  lda $ffee,x
$16:b350  00 78		 brk #$78
$16:b352  47 c4		 eor [$c4]
$16:b354  5e 33 f2	  lsr $f233,x
$16:b357  fc 5b 2e	  jsr ($2e5b,x)
$16:b35a  13 49		 ora ($49,s),y
$16:b35c  84 42		 sty $42
$16:b35e  31 08		 and ($08),y
$16:b360  86 43		 stx $43
$16:b362  21 d0		 and ($d0,x)
$16:b364  38			sec
$16:b365  19 28 f4	  ora $f428,y
$16:b368  10 0a		 bpl $b374
$16:b36a  84 02		 sty $02
$16:b36c  41 00		 eor ($00,x)
$16:b36e  8c 40 20	  sty $2040
$16:b371  90 08		 bcc $b37b
$16:b373  08			php
$16:b374  fb			xce
$16:b375  cf 7e 4d 08   cmp $084d7e
$16:b379  0c 09 20	  tsb $2009
$16:b37c  24 3a		 bit $3a
$16:b37e  49 64 02	  eor #$0264
$16:b381  51 18		 eor ($18),y
$16:b383  bc 4e 2a	  ldy $2a4e,x
$16:b386  13 0c		 ora ($0c,s),y
$16:b388  85 42		 sta $42
$16:b38a  c1 20		 cmp ($20,x)
$16:b38c  c0 50		 cpy #$50
$16:b38e  24 12		 bit $12
$16:b390  0e 02 e8	  asl $e802
$16:b393  25 16		 and $16
$16:b395  0b			phd
$16:b396  85 02		 sta $02
$16:b398  a1 a0		 lda ($a0,x)
$16:b39a  c0 70		 cpy #$70
$16:b39c  34 1a		 bit $1a,x
$16:b39e  05 e0		 ora $e0
$16:b3a0  60			rts
$16:b3a1  17 21		 ora [$21],y
$16:b3a3  2b			pld
$16:b3a4  9b			txy
$16:b3a5  c2 e2		 rep #$e2
$16:b3a7  ed 12 89	  sbc $8912
$16:b3aa  47 a0		 eor [$a0]
$16:b3ac  50 e8		 bvc $b396
$16:b3ae  33 68		 and ($68,s),y
$16:b3b0  60			rts
$16:b3b1  12 98		 ora ($98)
$16:b3b3  04 29		 tsb $29
$16:b3b5  c2 71		 rep #$71
$16:b3b7  38			sec
$16:b3b8  01 68		 ora ($68,x)
$16:b3ba  20 c6 70	  jsr $70c6
$16:b3bd  98			tya
$16:b3be  7c 1d e1	  jmp ($e11d,x)
$16:b3c1  b0 79		 bcs $b43c
$16:b3c3  0e 83 c0	  asl $c083
$16:b3c6  f8			sed
$16:b3c7  0b			phd
$16:b3c8  05 82		 ora $82
$16:b3ca  81 40		 sta ($40,x)
$16:b3cc  31 89		 and ($89),y
$16:b3ce  90 0c		 bcc $b3dc
$16:b3d0  00 60		 brk #$60
$16:b3d2  0d 84 01	  ora $0184
$16:b3d5  fc 0f e0	  jsr ($e00f,x)
$16:b3d8  b0 40		 bcs $b41a
$16:b3da  22 10 08 94   jsl $940810
$16:b3de  4a			lsr a
$16:b3df  6f 14 9a c0   adc $c09a14
$16:b3e3  e2 f0		 sep #$f0
$16:b3e5  18			clc
$16:b3e6  6c 1a 39	  jmp ($391a)
$16:b3e9  04 8e		 tsb $8e
$16:b3eb  04 06		 tsb $06
$16:b3ed  01 37		 ora ($37,x)
$16:b3ef  80 4d		 bra $b43e
$16:b3f1  60			rts
$16:b3f2  51 78		 eor ($78),y
$16:b3f4  04 36		 tsb $36
$16:b3f6  05 1c		 ora $1c
$16:b3f8  81 8a		 sta ($8a,x)
$16:b3fa  c2 41		 rep #$41
$16:b3fc  e8			inx
$16:b3fd  80 72		 bra $b471
$16:b3ff  32 19		 and ($19)
$16:b401  0e 87 42	  asl $4287
$16:b404  81 d0		 sta ($d0,x)
$16:b406  d0 7c		 bne $b484
$16:b408  3a			dec a
$16:b409  1d 88 c4	  ora $c488,x
$16:b40c  73 d1		 adc ($d1,s),y
$16:b40e  10 e4		 bpl $b3f4
$16:b410  2d 02 c1	  and $c102
$16:b413  d0 90		 bne $b3a5
$16:b415  11 43		 ora ($43),y
$16:b417  e1 00		 sbc ($00,x)
$16:b419  ec 48 23	  cpx $2348
$16:b41c  9e 08 04	  stz $0408,x
$16:b41f  30 9e		 bmi $b3bf
$16:b421  91 0a		 sta ($0a),y
$16:b423  e4 12		 cpx $12
$16:b425  b9 40 fc	  lda $fc40,y
$16:b428  e8			inx
$16:b429  bf 70 48 44   lda $444870,x
$16:b42d  20 be 06	  jsr $06be
$16:b430  21 8c		 and ($8c,x)
$16:b432  51 21		 eor ($21),y
$16:b434  95 0a		 sta $0a,x
$16:b436  8e a3 65	  stx $65a3
$16:b439  49 40		 eor #$40
$16:b43b  69 f7		 adc #$f7
$16:b43d  d1 99		 cmp ($99),y
$16:b43f  07 46		 ora [$46]
$16:b441  6c 3d 19	  jmp ($193d)
$16:b444  eb			xba
$16:b445  ef 67 fb 83   sbc $83fb67
$16:b449  d3 61		 cmp ($61,s),y
$16:b44b  01 81		 ora ($81,x)
$16:b44d  c0 20		 cpy #$20
$16:b44f  90 08		 bcc $b459
$16:b451  4c 06 15	  jmp $1506
$16:b454  02 82		 cop #$82
$16:b456  94 01		 sty $01,x
$16:b458  30 6f		 bmi $b4c9
$16:b45a  50 4e		 bvc $b4aa
$16:b45c  84 32		 sty $32
$16:b45e  05 0c		 ora $0c
$16:b460  82 c0 20	  brl $d523
$16:b463  c9 92		 cmp #$92
$16:b465  c0 60		 cpy #$60
$16:b467  28			plp
$16:b468  1c 0d 0f	  trb $0f0d
$16:b46b  84 30		 sty $30
$16:b46d  16 3b		 asl $3b,x
$16:b46f  1e 9e 4e	  asl $4e9e,x
$16:b472  98			tya
$16:b473  3c 04 02	  bit $0204,x
$16:b476  80 23		 bra $b49b
$16:b478  1a			inc a
$16:b479  0c 03 63	  tsb $6303
$16:b47c  00 ad		 brk #$ad
$16:b47e  26 c2		 rol $c2
$16:b480  31 18		 and ($18),y
$16:b482  bc 5e 3d	  ldy $3d5e,x
$16:b485  1d 8e 46	  ora $468e,x
$16:b488  e2 71		 sep #$71
$16:b48a  f8			sed
$16:b48b  f8			sed
$16:b48c  7c 04 c0	  jmp ($c004,x)
$16:b48f  98			tya
$16:b490  39 84 02	  and $0284,y
$16:b493  d1 00		 cmp ($00),y
$16:b495  e4 40		 cpx $40
$16:b497  24 02		 bit $02
$16:b499  31 d0		 and ($d0),y
$16:b49b  24 d6		 bit $d6
$16:b49d  45 00		 eor $00
$16:b49f  82 c0 62	  brl $1762
$16:b4a2  b0 38		 bcs $b4dc
$16:b4a4  fc 42 36	  jsr ($3642,x)
$16:b4a7  50 78		 bvc $b521
$16:b4a9  14 56		 trb $56
$16:b4ab  05 1f		 ora $1f
$16:b4ad  80 17		 bra $b4c6
$16:b4af  84 48		 sty $48
$16:b4b1  1c 04 d0	  trb $d004
$16:b4b4  d4 22		 pei ($22)
$16:b4b6  17 09		 ora [$09],y
$16:b4b8  07 e2		 ora [$e2]
$16:b4ba  21 d8		 and ($d8,x)
$16:b4bc  a8			tay
$16:b4bd  56 0e		 lsr $0e,x
$16:b4bf  0b			phd
$16:b4c0  00 b8		 brk #$b8
$16:b4c2  40			rti
$16:b4c3  3f 10 0e c4   and $c40e10,x
$16:b4c7  82 b0 4e	  brl $037a
$16:b4ca  64 af		 stz $af
$16:b4cc  ba			tsx
$16:b4cd  9b			txy
$16:b4ce  81 40		 sta ($40,x)
$16:b4d0  0a			asl a
$16:b4d1  82 c8 16	  brl $cb9c
$16:b4d4  00 ea		 brk #$ea
$16:b4d6  60			rts
$16:b4d7  a0 09		 ldy #$09
$16:b4d9  44 e4 4e	  mvp $4e,$e4
$16:b4dc  a5 82		 lda $82
$16:b4de  43 19		 eor $19,s
$16:b4e0  e1 08		 sbc ($08,x)
$16:b4e2  69 8b		 adc #$8b
$16:b4e4  a9 c1		 lda #$c1
$16:b4e6  c4 fe		 cpy $fe
$16:b4e8  26 b2		 rol $b2
$16:b4ea  ad 61 e4	  lda $e461
$16:b4ed  ef 0b 85 c6   sbc $c6850b
$16:b4f1  e1 d3		 sbc ($d3,x)
$16:b4f3  e8			inx
$16:b4f4  ac d2 3d	  ldy $3dd2
$16:b4f7  35 88		 and $88,x
$16:b4f9  cd 21 53	  cmp $5321
$16:b4fc  e8			inx
$16:b4fd  0c 3e 01	  tsb $013e
$16:b500  07 8d		 ora [$8d]
$16:b502  c1 03		 cmp ($03,x)
$16:b504  41 34		 eor ($34,x)
$16:b506  85 cd		 sta $cd
$16:b508  61 62		 adc ($62,x)
$16:b50a  30 0d		 bmi $b519
$16:b50c  19 14 21	  ora $2114,y
$16:b50f  98			tya
$16:b510  88			dey
$16:b511  65 43		 adc $43
$16:b513  39 f0 8c	  and $8cf0,y
$16:b516  50 32		 bvc $b54a
$16:b518  9a			txs
$16:b519  89 c5		 bit #$c5
$16:b51b  01 0e		 ora ($0e,x)
$16:b51d  1c 08 67	  trb $6708
$16:b520  c0 7e		 cpy #$7e
$16:b522  19 cf 04	  ora $04cf,y
$16:b525  63 c1		 adc $c1,s
$16:b527  94 f0		 sty $f0,x
$16:b529  4e 38 17	  lsr $1738
$16:b52c  0c 07 02	  tsb $0207
$16:b52f  01 25		 ora ($25,x)
$16:b531  ef e9 3f d8   sbc $d83fe9
$16:b535  2f f6 22 f9   and $f922f6
$16:b539  90 be		 bcc $b4f9
$16:b53b  44 fd f2	  mvp $f2,$fd
$16:b53e  6f fd 97 bd   adc $bd97fd
$16:b542  55 c5		 eor $c5,x
$16:b544  6d 29 5d	  adc $5d29
$16:b547  29 65		 and #$65
$16:b549  72 41		 adc ($41)
$16:b54b  54 94 52	  mvn $52,$94
$16:b54e  34 b2		 bit $b2,x
$16:b550  8e 95 43	  stx $4395
$16:b553  1a			inc a
$16:b554  f2 8b		 sbc ($8b)
$16:b556  17 8f		 ora [$8f],y
$16:b558  f3 06		 sbc ($06,s),y
$16:b55a  e7 cc		 sbc [$cc]
$16:b55c  1e 53 42	  asl $4253,x
$16:b55f  80 7e		 bra $b5df
$16:b561  60			rts
$16:b562  1c f8 a4	  trb $a4f8
$16:b565  72 6d		 adc ($6d)
$16:b567  2e b6 df	  rol $dfb6
$16:b56a  6b			rtl
$16:b56b  36 7d		 rol $7d,x
$16:b56d  f7 06		 sbc [$06],y
$16:b56f  ff 80 f1 c7   sbc $c7f180,x
$16:b573  3f 10 78 1c   and $1c7810,x
$16:b577  4a			lsr a
$16:b578  01 15		 ora ($15,x)
$16:b57a  80 4a		 bra $b5c6
$16:b57c  a0 15		 ldy #$15
$16:b57e  98			tya
$16:b57f  06 fa		 asl $fa
$16:b581  01 7f		 ora ($7f,x)
$16:b583  80 78		 bra $b5fd
$16:b585  e0 1f		 cpx #$1f
$16:b587  82 68 48	  brl $fdf2
$16:b58a  20 18 0c	  jsr $0c18
$16:b58d  07 83		 ora [$83]
$16:b58f  c1 70		 cmp ($70,x)
$16:b591  f8			sed
$16:b592  66 2f		 ror $2f
$16:b594  1e c4 80	  asl $80c4,x
$16:b597  73 89		 adc ($89,s),y
$16:b599  a1 60		 lda ($60,x)
$16:b59b  79 16 01	  adc $0116,y
$16:b59e  80 39		 bra $b5d9
$16:b5a0  08			php
$16:b5a1  07 a2		 ora [$a2]
$16:b5a3  01 34		 ora ($34,x)
$16:b5a5  78			sei
$16:b5a6  fb			xce
$16:b5a7  cb			wai
$16:b5a8  61 b0		 adc ($b0,x)
$16:b5aa  c8			iny
$16:b5ab  dc 62 16	  jml [$1662]
$16:b5ae  f2 17		 sbc ($17)
$16:b5b0  88			dey
$16:b5b1  4d e6 11	  eor $11e6
$16:b5b4  79 84 de	  adc $de84,y
$16:b5b7  21 00		 and ($00,x)
$16:b5b9  85 40		 sta $40
$16:b5bb  23 90		 and $90,s
$16:b5bd  08			php
$16:b5be  20 0c 62	  jsr $620c
$16:b5c1  90 09		 bcc $b5cc
$16:b5c3  c4 02		 cpy $02
$16:b5c5  11 00		 ora ($00),y
$16:b5c7  94 65		 sty $65,x
$16:b5c9  62 9d 38	  per $ee69
$16:b5cc  87 fe		 sta [$fe]
$16:b5ce  00 13		 brk #$13
$16:b5d0  88			dey
$16:b5d1  05 aa		 ora $aa
$16:b5d3  01 2c		 ora ($2c,x)
$16:b5d5  6f d7 80 5c   adc $5c80d7
$16:b5d9  bf 05 68 0d   lda $0d6805,x
$16:b5dd  84 6e		 sty $6e
$16:b5df  0d fe 89	  ora $89fe
$16:b5e2  cf e1 b2 d8   cmp $d8b2e1
$16:b5e6  ac c6 27	  ldy $27c6
$16:b5e9  13 85		 ora ($85,s),y
$16:b5eb  46 e2		 lsr $e2
$16:b5ed  d1 38		 cmp ($38),y
$16:b5ef  bd 4e 13	  lda $134e,x
$16:b5f2  7b			tdc
$16:b5f3  9f c0 25 b1   sta $b125c0,x
$16:b5f7  29 8c		 and #$8c
$16:b5f9  3a			dec a
$16:b5fa  26 f0		 rol $f0
$16:b5fc  08			php
$16:b5fd  21 94		 and ($94,x)
$16:b5ff  2a			rol a
$16:b600  70 cb		 bvs $b5cd
$16:b602  dc 13 41	  jml [$4113]
$16:b605  88			dey
$16:b606  d8			cld
$16:b607  66 28		 ror $28
$16:b609  1d 89 07	  ora $0789,x
$16:b60c  cb			wai
$16:b60d  01 f6		 ora ($f6,x)
$16:b60f  e0 7f		 cpx #$7f
$16:b611  35 1b		 and $1b,x
$16:b613  cc c6 73	  cpy $73c6
$16:b616  11 70		 ora ($70),y
$16:b618  cc 58 0e	  cpy $0e58
$16:b61b  83 00		 sta $00,s
$16:b61d  fb			xce
$16:b61e  40			rti
$16:b61f  3f 90 0d e5   and $e50d90,x
$16:b623  03 38		 ora $38,s
$16:b625  c1 34		 cmp ($34,x)
$16:b627  97 a8		 sta [$a8],y
$16:b629  fd be b0	  sbc $b0be,x
$16:b62c  18			clc
$16:b62d  04 0d		 tsb $0d
$16:b62f  bf 4b c0 81   lda $81c04b,x
$16:b633  2f 01 58 d4   and $d45801
$16:b637  08			php
$16:b638  06 0f		 asl $0f
$16:b63a  03 8f		 ora $8f,s
$16:b63c  81 97		 sta ($97,x)
$16:b63e  c1 a2		 cmp ($a2,x)
$16:b640  f8			sed
$16:b641  18			clc
$16:b642  16 16		 asl $16,x
$16:b644  15 1a		 ora $1a,x
$16:b646  92 47		 sta ($47)
$16:b648  a0 17		 ldy #$17
$16:b64a  0a			asl a
$16:b64b  05 be		 ora $be
$16:b64d  bf 7b a3 cd   lda $cda37b,x
$16:b651  3d f3 0e	  and $0ef3,x
$16:b654  7e bf a1	  ror $a1bf,x
$16:b657  fc c1 c7	  jsr ($c7c1,x)
$16:b65a  e0 13		 cpx #$13
$16:b65c  c8			iny
$16:b65d  24 02		 bit $02
$16:b65f  dd 00 bd	  cmp $bd00,x
$16:b662  c8			iny
$16:b663  3a			dec a
$16:b664  90 0d		 bcc $b673
$16:b666  84 03		 sty $03
$16:b668  5e 88 11	  lsr $1188,x
$16:b66b  52 78		 eor ($78)
$16:b66d  2f 9f c8 7f   and $7fc89f
$16:b671  fe 07 ff	  inc $ff07,x
$16:b674  e0 7f		 cpx #$7f
$16:b676  f0 18		 beq $b690
$16:b678  05 61		 ora $61
$16:b67a  f0 20		 beq $b69c
$16:b67c  17 88		 ora [$88],y
$16:b67e  04 39		 tsb $39
$16:b680  7a			ply
$16:b681  22 60 56 4f   jsl $4f5660
$16:b685  03 81		 ora $81,s
$16:b687  f0 f8		 beq $b681
$16:b689  2b			pld
$16:b68a  2c 40 1c	  bit $1c40
$16:b68d  0a			asl a
$16:b68e  66 ff		 ror $ff
$16:b690  1f ff a7 7b   ora $7ba7ff,x
$16:b694  a7 3f		 lda [$3f]
$16:b696  9c bf 7e	  stz $7ebf
$16:b699  df ff dd ee   cmp $eeddff,x
$16:b69d  e6 73		 inc $73
$16:b69f  38			sec
$16:b6a0  86 b3		 stx $b3
$16:b6a2  01 76		 ora ($76,x)
$16:b6a4  a0 6c		 ldy #$6c
$16:b6a6  6c 18 ec	  jmp ($ec18)
$16:b6a9  05 d2		 ora $d2
$16:b6ab  81 88		 sta ($88,x)
$16:b6ad  c0 5d		 cpy #$5d
$16:b6af  60			rts
$16:b6b0  1c cb b7	  trb $b7cb
$16:b6b3  e7 77		 sbc [$77]
$16:b6b5  bc f4 fd	  ldy $fdf4,x
$16:b6b8  b9 9f 3d	  lda $3d9f,y
$16:b6bb  3f e7 65 fd   and $fd65e7,x
$16:b6bf  ed 7f fd	  sbc $fd7f
$16:b6c2  bf f8 05 da   lda $da05f8,x
$16:b6c6  01 5b		 ora ($5b,x)
$16:b6c8  80 5a		 bra $b724
$16:b6ca  4d a1 00	  eor $00a1
$16:b6cd  d3 c0		 cmp ($c0,s),y
$16:b6cf  32 50		 and ($50)
$16:b6d1  0e 54 03	  asl $0354
$16:b6d4  4b			phk
$16:b6d5  75 c5		 adc $c5,x
$16:b6d7  d2 be		 cmp ($be)
$16:b6d9  bb			tyx
$16:b6da  1b			tcs
$16:b6db  f7 72		 sbc [$72],y
$16:b6dd  7f 4f 28 0d   adc $0d284f,x
$16:b6e1  97 fb		 sta [$fb],y
$16:b6e3  b6 df		 ldx $df,y
$16:b6e5  40			rti
$16:b6e6  0d 81 4a	  ora $4a81
$16:b6e9  80 6c		 bra $b757
$16:b6eb  60			rts
$16:b6ec  1d c8 05	  ora $05c8,x
$16:b6ef  1e 01 89	  asl $8901,x
$16:b6f2  80 58		 bra $b74c
$16:b6f4  a0 1d		 ldy #$1d
$16:b6f6  5c 5f df c3   jml $c3df5f
$16:b6fa  ff bc 7f e5   sbc $e57fbc,x
$16:b6fe  de f9 bf	  dec $bff9,x
$16:b701  df 33 f9 ec   cmp $ecf933,x
$16:b705  7e 3d 1f	  ror $1f3d,x
$16:b708  88			dey
$16:b709  06 2a		 asl $2a
$16:b70b  01 e1		 ora ($e1,x)
$16:b70d  80 56		 bra $b765
$16:b70f  20 13 68	  jsr $6813
$16:b712  04 a5		 tsb $a5
$16:b714  12 3d		 ora ($3d)
$16:b716  08			php
$16:b717  05 b0		 ora $b0
$16:b719  94 38		 sty $38,x
$16:b71b  01 d8		 ora ($d8,x)
$16:b71d  50 38		 bvc $b757
$16:b71f  01 50		 ora ($50,x)
$16:b721  0a			asl a
$16:b722  85 c2		 sta $c2
$16:b724  e1 10		 sbc ($10,x)
$16:b726  88			dey
$16:b727  0b			phd
$16:b728  cc 40 14	  cpy $1440
$16:b72b  01 28		 ora ($28,x)
$16:b72d  d8			cld
$16:b72e  20 19 08	  jsr $0819
$16:b731  04 82		 tsb $82
$16:b733  6f 10 77 84   adc $847710
$16:b737  5e 60 f3	  lsr $f360,x
$16:b73a  09 b4		 ora #$b4
$16:b73c  c2 2d		 rep #$2d
$16:b73e  10 87		 bpl $b6c7
$16:b740  46 21		 lsr $21
$16:b742  91 88		 sta ($88),y
$16:b744  04 a1		 tsb $a1
$16:b746  fe 30 80	  inc $8030,x
$16:b749  18			clc
$16:b74a  80 01		 bra $b74d
$16:b74c  fc 02 f1	  jsr ($f102,x)
$16:b74f  3f 01 f8 2f   and $2ff801,x
$16:b753  f0 0b		 beq $b760
$16:b755  dc 02 e7	  jml [$e702]
$16:b758  00 b8		 brk #$b8
$16:b75a  ba			tsx
$16:b75b  45 d4		 eor $d4
$16:b75d  01 ee		 ora ($ee,x)
$16:b75f  f8			sed
$16:b760  40			rti
$16:b761  2e 01 ef	  rol $ef01
$16:b764  1f 54 9e ff   ora $ff9e54,x
$16:b768  0a			asl a
$16:b769  bf 4c af d1   lda $d1af4c,x
$16:b76d  79 f4 12	  adc $12f4,y
$16:b770  39 02 83	  and $8302,y
$16:b773  40			rti
$16:b774  e0 f0		 cpx #$f0
$16:b776  08			php
$16:b777  18			clc
$16:b778  4c 2f d0	  jmp $d02f
$16:b77b  13 08		 ora ($08,s),y
$16:b77d  4f a0 31 c8   eor $c831a0
$16:b781  1c 1a 02	  trb $021a
$16:b784  5c 16 58 67   jml $675816
$16:b788  a5 94		 lda $94
$16:b78a  ed 65 3b	  sbc $3b65
$16:b78d  31 6e		 and ($6e),y
$16:b78f  d4 53		 pei ($53)
$16:b791  2b			pld
$16:b792  11 cf		 ora ($cf),y
$16:b794  02 f8		 cop #$f8
$16:b796  3c 19 eb	  bit $eb19,x
$16:b799  05 3b		 ora $3b
$16:b79b  e0 81		 cpx #$81
$16:b79d  0b			phd
$16:b79e  77 c2		 adc [$c2],y
$16:b7a0  99 f0 3d	  sta $3df0,y
$16:b7a3  18			clc
$16:b7a4  fa			plx
$16:b7a5  e0 30		 cpx #$30
$16:b7a7  18			clc
$16:b7a8  11 b4		 ora ($b4),y
$16:b7aa  12 15		 ora ($15)
$16:b7ac  00 81		 brk #$81
$16:b7ae  26 c2		 rol $c2
$16:b7b0  0f 02 87 c0   ora $c08702
$16:b7b4  23 f0		 and $f0,s
$16:b7b6  49 fc 22	  eor #$22fc
$16:b7b9  ff 9f fb c6   sbc $c6fb9f,x
$16:b7bd  bf b3 cf 7c   lda $7ccfb3,x
$16:b7c1  14 b2		 trb $b2
$16:b7c3  10 98		 bpl $b75d
$16:b7c5  4c 5a 2f	  jmp $2f5a
$16:b7c8  28			plp
$16:b7c9  96 54		 stx $54,y
$16:b7cb  f6 34		 inc $34,x
$16:b7cd  2a			rol a
$16:b7ce  86 af		 stx $af
$16:b7d0  cb			wai
$16:b7d1  0a			asl a
$16:b7d2  c3 ff		 cmp $ff,s
$16:b7d4  e3 bf		 sbc $bf,s
$16:b7d6  79 9f be	  adc $be9f,y
$16:b7d9  cd df e3	  cmp $e3df
$16:b7dc  ed e1 9e	  sbc $9ee1
$16:b7df  f8			sed
$16:b7e0  8f 7e 87 bf   sta $bf877e
$16:b7e4  da			phx
$16:b7e5  52 7a		 eor ($7a)
$16:b7e7  12 3d		 ora ($3d)
$16:b7e9  05 36		 ora $36
$16:b7eb  a1 8a		 lda ($8a,x)
$16:b7ed  d1 c7		 cmp ($c7),y
$16:b7ef  29 bb 2c	  and #$2cbb
$16:b7f2  ad aa 35	  lda $35aa
$16:b7f5  a4 bb		 ldy $bb
$16:b7f7  e2 2f		 sep #$2f
$16:b7f9  18			clc
$16:b7fa  78			sei
$16:b7fb  e7 8f		 sbc [$8f]
$16:b7fd  9b			txy
$16:b7fe  f3 9b		 sbc ($9b,s),y
$16:b800  7e 6f 3f	  ror $3f6f,x
$16:b803  ea			nop
$16:b804  75 fe		 adc $fe,x
$16:b806  e6 13		 inc $13
$16:b808  0b			phd
$16:b809  bc 02 f1	  ldy $f102,x
$16:b80c  00 8e		 brk #$8e
$16:b80e  40			rti
$16:b80f  39 b6 0c	  and $0cb6,y
$16:b812  b4 03		 ldy $03,x
$16:b814  73 00		 adc ($00,s),y
$16:b816  c7 40		 cmp [$40]
$16:b818  3e 73 cf	  rol $cf73,x
$16:b81b  ff 3e 7f 36   sbc $367f3e,x
$16:b81f  e7 72		 sbc [$72]
$16:b821  fe ff 9f	  inc $9fff,x
$16:b824  fd 7b bf	  sbc $bf7b,x
$16:b827  37 fb		 and [$fb],y
$16:b829  c4 7e		 cpy $7e
$16:b82b  30 09		 bmi $b836
$16:b82d  e4 03		 cpx $03
$16:b82f  97 00		 sta [$00],y
$16:b831  9a			txs
$16:b832  c0 39		 cpy #$39
$16:b834  40			rti
$16:b835  91 b7		 sta ($b7),y
$16:b837  40			rti
$16:b838  25 70		 and $70
$16:b83a  08			php
$16:b83b  94 f3		 sty $f3,x
$16:b83d  f9 fe ff	  sbc $fffe,y
$16:b840  4e 67 24	  lsr $2467
$16:b843  d0 c0		 bne $b805
$16:b845  0d c7 80	  ora $80c7
$16:b848  3b			tsc
$16:b849  18			clc
$16:b84a  04 c2		 tsb $c2
$16:b84c  00 8b		 brk #$8b
$16:b84e  0e 32 64	  asl $6432
$16:b851  08			php
$16:b852  a3 80		 lda $80,s
$16:b854  24 8f		 bit $8f
$16:b856  03 87		 ora $87,s
$16:b858  c3 bf		 cmp $bf,s
$16:b85a  ff fc de 6f   sbc $6fdefc,x
$16:b85e  67 b6		 adc [$b6]
$16:b860  87 53		 sta [$53]
$16:b862  c7 e7		 cmp [$e7]
$16:b864  39 fc 0a	  and $0afc,y
$16:b867  f8			sed
$16:b868  f8			sed
$16:b869  37 90		 and [$90],y
$16:b86b  8a			txa
$16:b86c  54 03 b3	  mvn $b3,$03
$16:b86f  01 a9		 ora ($a9,x)
$16:b871  c4 f7		 cpy $f7
$16:b873  f1 fb		 sbc ($fb),y
$16:b875  fc 33 79	  jsr ($7933,x)
$16:b878  10 98		 bpl $b812
$16:b87a  7f cd e3 54   adc $54e3cd,x
$16:b87e  aa			tax
$16:b87f  6a			ror a
$16:b880  35 55		 and $55,x
$16:b882  0e c7 a3	  asl $a3c7
$16:b885  f1 fa		 sbc ($fa),y
$16:b887  88			dey
$16:b888  79 13 21	  adc $2113,y
$16:b88b  59 80 4b	  eor $4b80,y
$16:b88e  20 1b ac	  jsr $ac1b
$16:b891  07 5b		 ora [$5b]
$16:b893  8d ec f7	  sta $f7ec
$16:b896  75 3e		 adc $3e,x
$16:b898  de 09 a4	  dec $a409,x
$16:b89b  83 b5		 sta $b5,s
$16:b89d  de 87 c3	  dec $c387,x
$16:b8a0  e0 f0		 cpx #$f0
$16:b8a2  78			sei
$16:b8a3  1c 0d 5c	  trb $5c0d
$16:b8a6  04 71		 tsb $71
$16:b8a8  4d 94 a6	  eor $a694
$16:b8ab  00 08		 brk #$08
$16:b8ad  08			php
$16:b8ae  54 02 09	  mvn $09,$02
$16:b8b1  00 81		 brk #$81
$16:b8b3  40			rti
$16:b8b4  13 07		 ora ($07,s),y
$16:b8b6  6c be 4f	  jmp ($4fbe)
$16:b8b9  27 91		 and [$91]
$16:b8bb  c8			iny
$16:b8bc  e4 32		 cpx $32
$16:b8be  19 04 53	  ora $5304,y
$16:b8c1  02 65		 cop #$65
$16:b8c3  35 10		 and $10,x
$16:b8c5  0a			asl a
$16:b8c6  c2 04		 rep #$04
$16:b8c8  62 90 08	  per $c15b
$16:b8cb  42 94		 wdm #$94
$16:b8cd  59 7e dc	  eor $dc7e,y
$16:b8d0  f8			sed
$16:b8d1  04 61		 tsb $61
$16:b8d3  de 30 88	  dec $8830,x
$16:b8d6  44 11 6a	  mvp $6a,$11
$16:b8d9  10 c5		 bpl $b8a0
$16:b8db  28			plp
$16:b8dc  2d cd 8c	  and $8ccd
$16:b8df  0c 60 7c	  tsb $7c60
$16:b8e2  01 1c		 ora ($1c,x)
$16:b8e4  00 84		 brk #$84
$16:b8e6  b8			clv
$16:b8e7  1a			inc a
$16:b8e8  00 38		 brk #$38
$16:b8ea  42 5e		 wdm #$5e
$16:b8ec  1f a7 c0 32   ora $32c0a7,x
$16:b8f0  01 2e		 ora ($2e,x)
$16:b8f2  10 38		 bpl $b92c
$16:b8f4  14 2e		 trb $2e
$16:b8f6  09 0e		 ora #$0e
$16:b8f8  80 46		 bra $b940
$16:b8fa  a1 51		 lda ($51,x)
$16:b8fc  b1 81		 lda ($81),y
$16:b8fe  c0 20		 cpy #$20
$16:b900  70 08		 bvs $b90a
$16:b902  5c 00 74 30   jml $307400
$16:b906  48			pha
$16:b907  da			phx
$16:b908  98			tya
$16:b909  28			plp
$16:b90a  14 0b		 trb $0b
$16:b90c  04 82		 tsb $82
$16:b90e  c1 00		 cmp ($00,x)
$16:b910  90 40		 bcc $b952
$16:b912  01 e1		 ora ($e1,x)
$16:b914  68			pla
$16:b915  90 7e		 bcc $b995
$16:b917  0e e0 0f	  asl $0fe0
$16:b91a  02 a0		 cop #$a0
$16:b91c  15 16		 ora $16,x
$16:b91e  01 f8		 ora ($f8,x)
$16:b920  80 76		 bra $b998
$16:b922  0a			asl a
$16:b923  c0 6f		 cpy #$6f
$16:b925  f3 f6		 sbc ($f6,s),y
$16:b927  41 20		 eor ($20,x)
$16:b929  f0 c8		 beq $b8f3
$16:b92b  7c 3a 1f	  jmp ($1f3a,x)
$16:b92e  09 4a		 ora #$4a
$16:b930  0c 0e 1f	  tsb $1f0e
$16:b933  16 8f		 asl $8f,x
$16:b935  45 a3		 eor $a3
$16:b937  f0 58		 beq $b991
$16:b939  14 0c		 trb $0c
$16:b93b  18			clc
$16:b93c  10 58		 bpl $b996
$16:b93e  04 25		 tsb $25
$16:b940  4a			lsr a
$16:b941  30 25		 bmi $b968
$16:b943  18			clc
$16:b944  c5 27		 cmp $27
$16:b946  1f fb 8f 7f   ora $7f8ffb,x
$16:b94a  c5 bf		 cmp $bf
$16:b94c  ea			nop
$16:b94d  f7 f1		 sbc [$f1],y
$16:b94f  98			tya
$16:b950  fb			xce
$16:b951  85 de		 sta $de
$16:b953  7d fd e5	  adc $e5fd,x
$16:b956  4e b5 55	  lsr $55b5
$16:b959  5a			phy
$16:b95a  ae 2b 15	  ldx $152b
$16:b95d  15 8a		 ora $8a,x
$16:b95f  ca			dex
$16:b960  a0 b7		 ldy #$b7
$16:b962  28			plp
$16:b963  16 36		 asl $36,x
$16:b965  01 31		 ora ($31,x)
$16:b967  80 71		 bra $b9da
$16:b969  70 d7		 bvs $b942
$16:b96b  e8			inx
$16:b96c  df ce 65 ef   cmp $ef65ce,x
$16:b970  87 ff		 sta [$ff]
$16:b972  e4 3f		 cpx $3f
$16:b974  f8			sed
$16:b975  2f f7 63 ff   and $ff63f7
$16:b979  e5 5e		 sbc $5e
$16:b97b  a6 94		 ldx $94
$16:b97d  9a			txs
$16:b97e  86 93		 stx $93
$16:b980  51 46		 eor ($46),y
$16:b982  b0 66		 bcs $b9ea
$16:b984  f5 95		 sbc $95,x
$16:b986  2b			pld
$16:b987  26 6f		 rol $6f
$16:b989  71 47		 adc ($47),y
$16:b98b  b4 45		 ldy $45,x
$16:b98d  67 7f		 adc [$7f]
$16:b98f  be f7 fa	  ldx $faf7,y
$16:b992  6d fe e6	  adc $e6fe
$16:b995  7f 3e 9f cf   adc $cf9f3e,x
$16:b999  c7 e3		 cmp [$e3]
$16:b99b  d9 ec fa	  cmp $faec,y
$16:b99e  7d 20 12	  adc $1220,x
$16:b9a1  c8			iny
$16:b9a2  07 42		 ora [$42]
$16:b9a4  01 34		 ora ($34,x)
$16:b9a6  80 73		 bra $ba1b
$16:b9a8  a0 17		 ldy #$17
$16:b9aa  08			php
$16:b9ab  00 c0		 brk #$c0
$16:b9ad  00 41		 brk #$41
$16:b9af  68			pla
$16:b9b0  ec 7e 2d	  cpx $2d7e
$16:b9b3  17 89		 ora [$89],y
$16:b9b5  c4 e2		 cpy $e2
$16:b9b7  31 18		 and ($18),y
$16:b9b9  84 0c		 sty $0c
$16:b9bb  80 32		 bra $b9ef
$16:b9bd  80 20		 bra $b9df
$16:b9bf  94 40		 sty $40,x
$16:b9c1  23 10		 and $10,s
$16:b9c3  00 c3		 brk #$c3
$16:b9c5  40			rti
$16:b9c6  3c 1e 01	  bit $011e,x
$16:b9c9  3b			tsc
$16:b9ca  06 54		 asl $54
$16:b9cc  a8			tay
$16:b9cd  03 1b		 ora $1b,s
$16:b9cf  ae 70 3a	  ldx $3a70
$16:b9d2  1c 01 78	  trb $7801
$16:b9d5  70 0a		 bvs $b9e1
$16:b9d7  46 55		 lsr $55
$16:b9d9  0b			phd
$16:b9da  06 c2		 asl $c2
$16:b9dc  01 20		 ora ($20,x)
$16:b9de  1f 8f 02 01   ora $01028f,x
$16:b9e2  a0 80		 ldy #$80
$16:b9e4  50 24		 bvc $ba0a
$16:b9e6  1a			inc a
$16:b9e7  09 07		 ora #$07
$16:b9e9  02 a1		 cop #$a1
$16:b9eb  10 e0		 bpl $b9cd
$16:b9ed  48			pha
$16:b9ee  31 14		 and ($14),y
$16:b9f0  0c 81 90	  tsb $9081
$16:b9f3  06 31		 asl $31
$16:b9f5  20 94 58	  jsr $5894
$16:b9f8  37 14		 and [$14],y
$16:b9fa  81 8e		 sta ($8e,x)
$16:b9fc  a4 fc		 ldy $fc
$16:b9fe  63 30		 adc $30,s
$16:ba00  28			plp
$16:ba01  14 3a		 trb $3a
$16:ba03  08			php
$16:ba04  b2 18		 lda ($18)
$16:ba06  04 12		 tsb $12
$16:ba08  01 01		 ora ($01,x)
$16:ba0a  5c 8c 22 05   jml $05228c
$16:ba0e  00 5b		 brk #$5b
$16:ba10  03 04		 ora $04,s
$16:ba12  97 0a		 sta [$0a],y
$16:ba14  19 2a 03	  ora $032a,y
$16:ba17  48			pha
$16:ba18  00 21		 brk #$21
$16:ba1a  80 e0		 bra $b9fc
$16:ba1c  60			rts
$16:ba1d  0a			asl a
$16:ba1e  81 e8		 sta ($e8,x)
$16:ba20  84 6e		 sty $6e
$16:ba22  1a			inc a
$16:ba23  02 e0		 cop #$e0
$16:ba25  10 10		 bpl $ba37
$16:ba27  19 00 60	  ora $6000,y
$16:ba2a  1e 88 06	  asl $0688,x
$16:ba2d  e1 a8		 sbc ($a8,x)
$16:ba2f  0e ff 00	  asl $00ff
$16:ba32  78			sei
$16:ba33  47 c3		 eor [$c3]
$16:ba35  d5 04		 cmp $04,x
$16:ba37  88			dey
$16:ba38  c0 e2		 cpy #$e2
$16:ba3a  70 c8		 bvs $ba04
$16:ba3c  f4 0e 3c	  pea $3c0e
$16:ba3f  b1 08		 lda ($08),y
$16:ba41  1c 3e 01	  trb $013e
$16:ba44  03 14		 ora $14,s
$16:ba46  04 46		 tsb $46
$16:ba48  1c 32 18	  trb $1832
$16:ba4b  09 0c		 ora #$0c
$16:ba4d  21 d0		 and ($d0,x)
$16:ba4f  11 d1		 ora ($d1),y
$16:ba51  ba			tsx
$16:ba52  03 71		 ora $71,s
$16:ba54  a0 d8		 ldy #$d8
$16:ba56  78			sei
$16:ba57  26 11		 rol $11
$16:ba59  0e c6 42	  asl $42c6
$16:ba5c  b1 20		 lda ($20),y
$16:ba5e  9c 40 3e	  stz $3e40
$16:ba61  02 80		 cop #$80
$16:ba63  76 86		 ror $86,x
$16:ba65  c2 81		 rep #$81
$16:ba67  30 e0		 bmi $ba49
$16:ba69  76 3c		 ror $3c,x
$16:ba6b  15 8f		 ora $8f,x
$16:ba6d  04 e3		 tsb $e3
$16:ba6f  80 5c		 bra $bacd
$16:ba71  11 42		 ora ($42),y
$16:ba73  c0 60		 cpy #$60
$16:ba75  31 58		 and ($58),y
$16:ba77  34 b6		 bit $b6,x
$16:ba79  1d 4e 87	  ora $874e,x
$16:ba7c  e4 e3		 cpx $e3
$16:ba7e  81 e6		 sta ($e6,x)
$16:ba80  8c 41 66	  sty $6641
$16:ba83  10 5b		 bpl $bae0
$16:ba85  84 5b		 sty $5b
$16:ba87  81 13		 sta ($13,x)
$16:ba89  8e c7 a3	  stx $a3c7
$16:ba8c  71 c8		 adc ($c8),y
$16:ba8e  b4 67		 ldy $67,x
$16:ba90  3b			tsc
$16:ba91  e3 fd		 sbc $fd,s
$16:ba93  c1 fd		 cmp ($fd,x)
$16:ba95  71 7f		 adc ($7f),y
$16:ba97  94 3f		 sty $3f,x
$16:ba99  f3 07		 sbc ($07,s),y
$16:ba9b  80 42		 bra $badf
$16:ba9d  47 63		 eor [$63]
$16:ba9f  06 80		 asl $80
$16:baa1  67 60		 adc [$60]
$16:baa3  1f a8 07 ae   ora $ae07a8,x
$16:baa7  01 f2		 ora ($f2,x)
$16:baa9  80 7e		 bra $bb29
$16:baab  7b			tdc
$16:baac  73 b9		 adc ($b9,s),y
$16:baae  af de f3 ff   lda $fff3de
$16:bab2  e7 f3		 sbc [$f3]
$16:bab4  fb			xce
$16:bab5  ff ff 5f ef   sbc $ef5fff,x
$16:bab9  fb			xce
$16:baba  fd 9b 7f	  sbc $7f9b,x
$16:babd  a0 1d		 ldy #$1d
$16:babf  58			cli
$16:bac0  04 b6		 tsb $b6
$16:bac2  01 49		 ora ($49,x)
$16:bac4  80 6d		 bra $bb33
$16:bac6  a0 15		 ldy #$15
$16:bac8  18			clc
$16:bac9  06 b2		 asl $b2
$16:bacb  01 da		 ora ($da,x)
$16:bacd  80 4d		 bra $bb1c
$16:bacf  7a			ply
$16:bad0  3d df d7	  and $d7df,x
$16:bad3  eb			xba
$16:bad4  f9 fc ff	  sbc $fffc,y
$16:bad7  35 47		 and $47,x
$16:bad9  ff ff 6a 85   sbc $856aff,x
$16:badd  7a			ply
$16:bade  bd 18 d3	  lda $d318,x
$16:bae1  40			rti
$16:bae2  2c b0 09	  bit $09b0
$16:bae5  9c 03 b3	  stz $b303
$16:bae8  00 f6		 brk #$f6
$16:baea  c0 39		 cpy #$39
$16:baec  90 08		 bcc $baf6
$16:baee  6c 03 53	  jmp ($5303)
$16:baf1  78			sei
$16:baf2  bc 6e 37	  ldy $376e,x
$16:baf5  02 80		 cop #$80
$16:baf7  e6 4e		 inc $4e
$16:baf9  37 97		 and [$97],y
$16:bafb  0f e7 03 f1   ora $f103e7
$16:baff  80 fc		 bra $bafd
$16:bb01  0a			asl a
$16:bb02  03 09		 ora $09,s
$16:bb04  00 a2		 brk #$a2
$16:bb06  40			rti
$16:bb07  3f 17 cb e7   and $e7cb17,x
$16:bb0b  e3 f1		 sbc $f1,s
$16:bb0d  f0 f8		 beq $bb07
$16:bb0f  70 38		 bvs $bb49
$16:bb11  18			clc
$16:bb12  0c 02 78	  tsb $7802
$16:bb15  23 10		 and $10,s
$16:bb17  79 04 7e	  adc $7e04,y
$16:bb1a  81 3f		 sta ($3f,x)
$16:bb1c  0a			asl a
$16:bb1d  86 02		 stx $02
$16:bb1f  fe 19 24	  inc $2419,x
$16:bb22  f0 47		 beq $bb6b
$16:bb24  e0 13		 cpx #$13
$16:bb26  f8			sed
$16:bb27  05 fc		 ora $fc
$16:bb29  48			pha
$16:bb2a  3f f1 41 c1   and $c141f1,x
$16:bb2e  e0 f1		 cpx #$f1
$16:bb30  88			dey
$16:bb31  c4 9e		 cpy $9e
$16:bb33  41 5f		 eor ($5f,x)
$16:bb35  a0 0d		 ldy #$0d
$16:bb37  43 7f		 eor $7f,s
$16:bb39  80 1c		 bra $bb57
$16:bb3b  91 b8		 sta ($b8),y
$16:bb3d  03 e8		 ora $e8,s
$16:bb3f  23 41		 and $41,s
$16:bb41  28			plp
$16:bb42  64 2a		 stz $2a
$16:bb44  15 0c		 ora $0c,x
$16:bb46  86 c2		 stx $c2
$16:bb48  61 70		 adc ($70,x)
$16:bb4a  b8			clv
$16:bb4b  02 43		 cop #$43
$16:bb4d  c1 e0		 cmp ($e0,x)
$16:bb4f  05 96		 ora $96
$16:bb51  82 41 60	  brl $1b95
$16:bb54  80 70		 bra $bbc6
$16:bb56  24 18		 bit $18
$16:bb58  03 08		 ora $08,s
$16:bb5a  93 82		 sta ($82,s),y
$16:bb5c  01 20		 ora ($20,x)
$16:bb5e  80 50		 bra $bbb0
$16:bb60  10 0a		 bpl $bb6c
$16:bb62  75 f4		 adc $f4,x
$16:bb64  37 a5		 and [$a5],y
$16:bb66  fd 3c 90	  sbc $903c,x
$16:bb69  88			dey
$16:bb6a  64 12		 stz $12
$16:bb6c  1f 02 8d c2   ora $c28d02,x
$16:bb70  63 30		 adc $30,s
$16:bb72  a8			tay
$16:bb73  dc 02 1f	  jml [$1f02]
$16:bb76  00 80		 brk #$80
$16:bb78  8f c2 18 b9   sta $b918c2
$16:bb7c  18			clc
$16:bb7d  dc 12 33	  jml [$3312]
$16:bb80  06 61		 asl $61
$16:bb82  82 e8 e0	  brl $9c6d
$16:bb85  12 8d		 ora ($8d)
$16:bb87  c5 43		 cmp $43
$16:bb89  b1 90		 lda ($90),y
$16:bb8b  cc 58 21	  cpy $2158
$16:bb8e  1d 0c c6	  ora $c60c,x
$16:bb91  83 61		 sta $61,s
$16:bb93  00 f0		 brk #$f0
$16:bb95  0f c3 71 40   ora $4071c3
$16:bb99  ec 48 1a	  cpx $1a48
$16:bb9c  83 f0		 sta $f0,s
$16:bb9e  6a			ror a
$16:bb9f  06 c2		 asl $c2
$16:bba1  80 dc		 bra $bb7f
$16:bba3  17 6f		 ora [$6f],y
$16:bba5  bf bc 7e 10   lda $107ebc,x
$16:bba9  1c 1c 06	  trb $061c
$16:bbac  8b			phb
$16:bbad  83 91		 sta $91,s
$16:bbaf  57 a5		 eor [$a5],y
$16:bbb1  92 c0		 sta ($c0)
$16:bbb3  0b			phd
$16:bbb4  e0 e0		 cpx #$e0
$16:bbb6  14 49		 trb $49
$16:bbb8  04 0a		 tsb $0a
$16:bbba  21 24		 and ($24,x)
$16:bbbc  06 a4		 asl $a4
$16:bbbe  06 27		 asl $27
$16:bbc0  10 8d		 bpl $bb4f
$16:bbc2  44 23 10	  mvp $10,$23
$16:bbc5  89 6c		 bit #$6c
$16:bbc7  c6 7f		 dec $7f
$16:bbc9  02 9b		 cop #$9b
$16:bbcb  40			rti
$16:bbcc  e1 cb		 sbc ($cb,x)
$16:bbce  c0 89		 cpy #$89
$16:bbd0  c0 23		 cpy #$23
$16:bbd2  50 08		 bvc $bbdc
$16:bbd4  c4 02		 cpy $02
$16:bbd6  5b			tcd
$16:bbd7  10 9f		 bpl $bb78
$16:bbd9  c0 26		 cpy #$26
$16:bbdb  d0 11		 bne $bbee
$16:bbdd  f0 8b		 beq $bb6a
$16:bbdf  80 dc		 bra $bbbd
$16:bbe1  59 0d 07	  eor $070d,y
$16:bbe4  c2 81		 rep #$81
$16:bbe6  60			rts
$16:bbe7  c0 48		 cpy #$48
$16:bbe9  30 1a		 bmi $bc05
$16:bbeb  02 82		 cop #$82
$16:bbed  c0 3e		 cpy #$3e
$16:bbef  10 02		 bpl $bbf3
$16:bbf1  d0 f0		 bne $bbe3
$16:bbf3  34 14		 bit $14,x
$16:bbf5  0c bc 62	  tsb $62bc
$16:bbf8  4f 38 97 cc   eor $cc9738
$16:bbfc  0e 61 4a	  asl $4a61
$16:bbff  ba			tsx
$16:bc00  d6 ac		 dec $ac,x
$16:bc02  b5 2b		 lda $2b,x
$16:bc04  69 ec		 adc #$ec
$16:bc06  30 11		 bmi $bc19
$16:bc08  7c 04 1e	  jmp ($1e04,x)
$16:bc0b  01 2f		 ora ($2f,x)
$16:bc0d  41 8c		 eor ($8c,x)
$16:bc0f  28			plp
$16:bc10  84 35		 sty $35
$16:bc12  24 58		 bit $58
$16:bc14  73 26		 adc ($26,s),y
$16:bc16  77 6c		 adc [$6c],y
$16:bc18  ce d2 9f	  dec $9fd2
$16:bc1b  8b			phb
$16:bc1c  bb			tyx
$16:bc1d  e4 6f		 cpx $6f
$16:bc1f  f1 cf		 sbc ($cf),y
$16:bc21  fc ff ff	  jsr ($ffff,x)
$16:bc24  bf ff c0 39   lda $39c0ff,x
$16:bc28  90 0b		 bcc $bc35
$16:bc2a  b4 03		 ldy $03,x
$16:bc2c  69 00		 adc #$00
$16:bc2e  c5 40		 cmp $40
$16:bc30  32 24		 and ($24)
$16:bc32  41 9b		 eor ($9b,x)
$16:bc34  40			rti
$16:bc35  37 79		 and [$79],y
$16:bc37  af f7 3b fd   lda $fd3bf7
$16:bc3b  6b			rtl
$16:bc3c  fc cf bf	  jsr ($bfcf,x)
$16:bc3f  79 bf c7	  adc $c7bf,y
$16:bc42  6f f1 fb fc   adc $fcfbf1
$16:bc46  2f 02 01 9b   and $9b0102
$16:bc4a  80 63		 bra $bcaf
$16:bc4c  60			rts
$16:bc4d  74 f8		 stz $f8,x
$16:bc4f  1c ae 07	  trb $07ae
$16:bc52  17 80		 ora [$80],y
$16:bc54  65 20		 adc $20
$16:bc56  1d 48 05	  ora $0548,x
$16:bc59  92 bf		 sta ($bf)
$16:bc5b  5e 8e c7	  lsr $c78e,x
$16:bc5e  73 51		 adc ($51,s),y
$16:bc60  ae 8e 43	  ldx $438e
$16:bc63  a9 14		 lda #$14
$16:bc65  d6 4b		 dec $4b,x
$16:bc67  25 12		 and $12
$16:bc69  89 c4		 bit #$c4
$16:bc6b  e2 01		 sep #$01
$16:bc6d  a8			tay
$16:bc6e  80 f8		 bra $bc68
$16:bc70  b0 3e		 bcs $bcb0
$16:bc72  4e 0f ba	  lsr $ba0f
$16:bc75  01 28		 ora ($28,x)
$16:bc77  80 54		 bra $bccd
$16:bc79  20 15 82	  jsr $8215
$16:bc7c  88			dey
$16:bc7d  70 2c		 bvs $bcab
$16:bc7f  12 0f		 ora ($0f)
$16:bc81  06 03		 asl $03
$16:bc83  81 e0		 sta ($e0,x)
$16:bc85  b0 16		 bcs $bc9d
$16:bc87  41 e0		 eor ($e0,x)
$16:bc89  01 b2		 ora ($b2,x)
$16:bc8b  a8			tay
$16:bc8c  48			pha
$16:bc8d  0b			phd
$16:bc8e  41 80		 eor ($80,x)
$16:bc90  2c 81 44	  bit $4481
$16:bc93  24 12		 bit $12
$16:bc95  00 db		 brk #$db
$16:bc97  84 bc		 sty $bc
$16:bc99  3d 37 bb	  and $bb37,x
$16:bc9c  dd cc 62	  cmp $62cc,x
$16:bc9f  33 19		 and ($19,s),y
$16:bca1  8c 84 6e	  sty $6e84
$16:bca4  20 83 b9	  jsr $b983
$16:bca7  8b			phb
$16:bca8  82 01 21	  brl $ddac
$16:bcab  80 48		 bra $bcf5
$16:bcad  e0 13		 cpx #$13
$16:bcaf  08			php
$16:bcb0  00 24		 brk #$24
$16:bcb2  20 24 90	  jsr $9024
$16:bcb5  01 00		 ora ($00,x)
$16:bcb7  7b			tdc
$16:bcb8  5f 41 a0 0f   eor $0fa041,x
$16:bcbc  54 1d 04	  mvn $04,$1d
$16:bcbf  10 08		 bpl $bcc9
$16:bcc1  7c 3c de	  jmp ($de3c,x)
$16:bcc4  10 38		 bpl $bcfe
$16:bcc6  18			clc
$16:bcc7  79 61 70	  adc $7061,y
$16:bcca  f8			sed
$16:bccb  64 00		 stz $00
$16:bccd  f0 10		 beq $bcdf
$16:bccf  98			tya
$16:bcd0  04 10		 tsb $10
$16:bcd2  3c 85 00	  bit $0085,x
$16:bcd5  e0 70		 cpx #$70
$16:bcd7  00 40		 brk #$40
$16:bcd9  4f 8e 02 34   eor $34028e
$16:bcdd  94 7e		 sty $7e,x
$16:bcdf  b4 f5		 ldy $f5,x
$16:bce1  f3 ce		 sbc ($ce,s),y
$16:bce3  27 14		 and [$14]
$16:bce5  4a			lsr a
$16:bce6  26 eb		 rol $eb
$16:bce8  04 d3		 tsb $d3
$16:bcea  26 88		 rol $88
$16:bcec  33 c1		 and ($c1,s),y
$16:bcee  96 70		 stx $70,y
$16:bcf0  0b			phd
$16:bcf1  e3 88		 sbc $88,s
$16:bcf3  db			stp
$16:bcf4  86 cc		 stx $cc
$16:bcf6  14 90		 trb $90
$16:bcf8  a4 83		 ldy $83
$16:bcfa  81 60		 sta ($60,x)
$16:bcfc  a0 48		 ldy #$48
$16:bcfe  22 12 69 c4   jsl $c46912
$16:bd02  72 38		 adc ($38)
$16:bd04  ee 24 61	  inc $6124
$16:bd07  d8			cld
$16:bd08  2c 0c c0	  bit $c00c
$16:bd0b  93 40		 sta ($40,s),y
$16:bd0d  22 8c c0 81   jsl $81c08c
$16:bd11  c0 60		 cpy #$60
$16:bd13  21 10		 and ($10,x)
$16:bd15  81 c1		 sta ($c1,x)
$16:bd17  a0 50		 ldy #$50
$16:bd19  28			plp
$16:bd1a  75 a2		 adc $a2,x
$16:bd1c  20 db 33	  jsr $33db
$16:bd1f  c1 13		 cmp ($13,x)
$16:bd21  02 0d		 cop #$0d
$16:bd23  00 81		 brk #$81
$16:bd25  43 01		 eor $01,s
$16:bd27  21 28		 and ($28,x)
$16:bd29  82 c3 60	  brl $1def
$16:bd2c  91 f8		 sta ($f8),y
$16:bd2e  54 7a 07	  mvn $07,$7a
$16:bd31  1e 82 47	  asl $4782,x
$16:bd34  20 70 f1	  jsr $f170
$16:bd37  09 43		 ora #$43
$16:bd39  60			rts
$16:bd3a  51 f8		 eor ($f8),y
$16:bd3c  04 7a		 tsb $7a
$16:bd3e  02 43		 cop #$43
$16:bd40  01 c2		 ora ($c2,x)
$16:bd42  c0 28		 cpy #$28
$16:bd44  1f 0d 06 d3   ora $d3060d,x
$16:bd48  a9 1c		 lda #$1c
$16:bd4a  90 73		 bcc $bdbf
$16:bd4c  24 1c		 bit $1c
$16:bd4e  8a			txa
$16:bd4f  84 63		 sty $63
$16:bd51  01 e0		 ora ($e0,x)
$16:bd53  66 07		 ror $07
$16:bd55  c2 01		 rep #$01
$16:bd57  b4 a0		 ldy $a0,x
$16:bd59  47 3c		 eor [$3c]
$16:bd5b  1c cf 87	  trb $87cf
$16:bd5e  23 e1		 and $e1,s
$16:bd60  18			clc
$16:bd61  f0 17		 beq $bd7a
$16:bd63  06 01		 asl $01
$16:bd65  30 a7		 bmi $bd0e
$16:bd67  c9 2b		 cmp #$2b
$16:bd69  f2 5a		 sbc ($5a)
$16:bd6b  fc b6 bf	  jsr ($bfb6,x)
$16:bd6e  29 ad		 and #$ad
$16:bd70  d2 6f		 cmp ($6f)
$16:bd72  75 9b		 adc $9b,x
$16:bd74  dd 6e f6	  cmp $f66e,x
$16:bd77  6e 08 04	  ror $0408
$16:bd7a  92 01		 sta ($01)
$16:bd7c  25 80		 and $80
$16:bd7e  4a			lsr a
$16:bd7f  60			rts
$16:bd80  12 d8		 ora ($d8)
$16:bd82  05 36		 ora $36
$16:bd84  01 51		 ora ($51,x)
$16:bd86  80 54		 bra $bddc
$16:bd88  f7 5f		 sbc [$5f],y
$16:bd8a  ab			plb
$16:bd8b  9f da e5 f0   sta $f0e5da,x
$16:bd8f  b0 9a		 bcs $bd2b
$16:bd91  83 c1		 sta $c1,s
$16:bd93  a0 4c		 ldy #$4c
$16:bd95  9c 03 4b	  stz $4b03
$16:bd98  02 b2		 cop #$b2
$16:bd9a  40			rti
$16:bd9b  ec 10 1b	  cpx $1b10
$16:bd9e  84 01		 sty $01
$16:bda0  3c 05 c0	  bit $c005,x
$16:bda3  03 04		 ora $04,s
$16:bda5  03 71		 ora $71,s
$16:bda7  b8			clv
$16:bda8  aa			tax
$16:bda9  55 26		 eor $26,x
$16:bdab  51 ec		 eor ($ec),y
$16:bdad  6c 1c 24	  jmp ($241c)
$16:bdb0  30 38		 bmi $bdea
$16:bdb2  3a			dec a
$16:bdb3  d8			cld
$16:bdb4  1b			tcs
$16:bdb5  c1 44		 cmp ($44,x)
$16:bdb7  82 6a 22	  brl $e024
$16:bdba  50 de		 bvc $bd9a
$16:bdbc  a4 08		 ldy $08
$16:bdbe  52 10		 eor ($10)
$16:bdc0  08			php
$16:bdc1  28			plp
$16:bdc2  ec 20 f0	  cpx $f020
$16:bdc5  4b			phk
$16:bdc6  85 c3		 sta $c3
$16:bdc8  e1 f0		 sbc ($f0,x)
$16:bdca  4b			phk
$16:bdcb  0f 83 80 d7   ora $d78083
$16:bdcf  22 70 00 81   jsl $810070
$16:bdd3  3c 12 03	  bit $0312,x
$16:bdd6  60			rts
$16:bdd7  a7 80		 lda [$80]
$16:bdd9  0c 0d d1	  tsb $d10d
$16:bddc  76 7b		 ror $7b,x
$16:bdde  f7 cd		 sbc [$cd],y
$16:bde0  83 10		 sta $10,s
$16:bde2  80 5c		 bra $be40
$16:bde4  a4 17		 ldy $17
$16:bde6  48			pha
$16:bde7  a5 72		 lda $72
$16:bde9  49 66		 eor #$66
$16:bdeb  84 4b		 sty $4b
$16:bded  a2 93		 ldx #$93
$16:bdef  f0 81		 beq $bd72
$16:bdf1  c0 2e		 cpy #$2e
$16:bdf3  90 0a		 bcc $bdff
$16:bdf5  e4 82		 cpx $82
$16:bdf7  cd 18 97	  cmp $9718
$16:bdfa  44 03 c1	  mvp $c1,$03
$16:bdfd  08			php
$16:bdfe  bd c6 af	  lda $afc6,x
$16:be01  72 af		 adc ($af)
$16:be03  1d 6b 87	  ora $876b,x
$16:be06  24 f3		 bit $f3
$16:be08  c6 2f		 dec $2f
$16:be0a  c0 e2		 cpy #$e2
$16:be0c  bd c1 07	  lda $07c1,x
$16:be0f  e1 e3		 sbc ($e3,x)
$16:be11  8e 70 e7	  stx $e770
$16:be14  83 85		 sta $85,s
$16:be16  00 9b		 brk #$9b
$16:be18  78			sei
$16:be19  26 1c		 rol $1c
$16:be1b  08			php
$16:be1c  47 c0		 eor [$c0]
$16:be1e  ae 10 4f	  ldx $4f10
$16:be21  c1 6c		 cmp ($6c,x)
$16:be23  09 e9		 ora #$e9
$16:be25  f0 80		 beq $bda7
$16:be27  17 80		 ora [$80],y
$16:be29  bc 1f c3	  ldy $c31f,x
$16:be2c  50 93		 bvc $bdc1
$16:be2e  cf 81 30 98   cmp $983081
$16:be32  72 21		 adc ($21)
$16:be34  1e 88 47	  asl $4788,x
$16:be37  d2 08		 cmp ($08)
$16:be39  7b			tdc
$16:be3a  02 6b		 cop #$6b
$16:be3c  19 40 ca	  ora $ca40,y
$16:be3f  80 16		 bra $be57
$16:be41  9e 70 f8	  stz $f870,x
$16:be44  7f f9 e4 f0   adc $f0e4f9,x
$16:be48  03 29		 ora $29,s
$16:be4a  c0 e1		 cpy #$e1
$16:be4c  c0 23		 cpy #$23
$16:be4e  00 14		 brk #$14
$16:be50  82 c0 e3	  brl $a213
$16:be53  72 7b		 adc ($7b)
$16:be55  36 7b		 rol $7b,x
$16:be57  f8			sed
$16:be58  6d 45 79	  adc $7945
$16:be5b  c0 23		 cpy #$23
$16:be5d  70 0b		 bvs $be6a
$16:be5f  22 31 27 10   jsl $102731
$16:be63  0a			asl a
$16:be64  24 e3		 bit $e3
$16:be66  05 7c		 ora $7c
$16:be68  69 93		 adc #$93
$16:be6a  44 19 e0	  mvp $e0,$19
$16:be6d  cd 2b e4	  cmp $e42b
$16:be70  03 fc		 ora $fc,s
$16:be72  e2 37		 sep #$37
$16:be74  08			php
$16:be75  36 c8		 rol $c8,x
$16:be77  00 20		 brk #$20
$16:be79  80 3b		 bra $beb6
$16:be7b  c6 03		 dec $03
$16:be7d  02 81		 cop #$81
$16:be7f  c1 a0		 cmp ($a0,x)
$16:be81  50 6c		 bvc $beef
$16:be83  34 1b		 bit $1b,x
$16:be85  0f 00 a2 c0   ora $c0a200
$16:be89  dd e5 02	  cmp $02e5,x
$16:be8c  80 c1		 bra $be4f
$16:be8e  80 85		 bra $be15
$16:be90  81 80		 sta ($80,x)
$16:be92  70 21		 bvs $beb5
$16:be94  76 37		 ror $37,x
$16:be96  79 60 30	  adc $3060,y
$16:be99  1c 0a 00	  trb $000a
$16:be9c  54 30 00	  mvn $00,$30
$16:be9f  b0 80		 bcs $be21
$16:bea1  58			cli
$16:bea2  32 00		 and ($00)
$16:bea4  f3 80		 sbc ($80,s),y
$16:bea6  06 00		 asl $00
$16:bea8  30 70		 bmi $bf1a
$16:beaa  0d 80 78	  ora $7880
$16:bead  dd e1 41	  cmp $41e1,x
$16:beb0  81 50		 sta ($50,x)
$16:beb2  e0 d2		 cpx #$d2
$16:beb4  28			plp
$16:beb5  34 9a		 bit $9a,x
$16:beb7  0d 17 17	  ora $1717
$16:beba  a0 08		 ldy #$08
$16:bebc  28			plp
$16:bebd  30 62		 bmi $bf21
$16:bebf  30 58		 bmi $bf19
$16:bec1  60			rts
$16:bec2  d2 18		 cmp ($18)
$16:bec4  04 c0		 tsb $c0
$16:bec6  5e 81 38	  lsr $3881,x
$16:bec9  27 a8		 and [$a8]
$16:becb  91 c5		 sta ($c5),y
$16:becd  e7 01		 sbc [$01]
$16:becf  80 c0		 bra $be91
$16:bed1  ce c1 02	  dec $02c1
$16:bed4  01 84		 ora ($84,x)
$16:bed6  0e 0e 6f	  asl $6f0e
$16:bed9  48			pha
$16:beda  03 f8		 ora $f8,s
$16:bedc  1f c0 7a 18   ora $187ac0,x
$16:bee0  04 10		 tsb $10
$16:bee2  5e 74 2a	  lsr $2a74,x
$16:bee5  07 8a		 ora [$8a]
$16:bee7  41 44		 eor ($44,x)
$16:bee9  80 49		 bra $bf34
$16:beeb  24 14		 bit $14
$16:beed  8b			phb
$16:beee  07 c2		 ora [$c2]
$16:bef0  10 ef		 bpl $bee1
$16:bef2  2a			rol a
$16:bef3  06 0a		 asl $0a
$16:bef5  41 c2		 eor ($c2,x)
$16:bef7  80 79		 bra $bf72
$16:bef9  a4 1c		 ldy $1c
$16:befb  4b			phk
$16:befc  06 32		 asl $32
$16:befe  30 9e		 bmi $be9e
$16:bf00  33 8c		 and ($8c,s),y
$16:bf02  c2 cd		 rep #$cd
$16:bf04  ca			dex
$16:bf05  84 58		 sty $58
$16:bf07  7a			ply
$16:bf08  b9 68 14	  lda $1468,y
$16:bf0b  0f 04 82 81   ora $818204
$16:bf0f  00 90		 brk #$90
$16:bf11  c8			iny
$16:bf12  28			plp
$16:bf13  36 06		 rol $06,x
$16:bf15  7a			ply
$16:bf16  e0 24		 cpx #$24
$16:bf18  01 b0		 ora ($b0,x)
$16:bf1a  6b			rtl
$16:bf1b  87 06		 sta [$06]
$16:bf1d  c1 83		 cmp ($83,x)
$16:bf1f  17 a4		 ora [$a4],y
$16:bf21  42 03		 wdm #$03
$16:bf23  11 81		 ora ($81),y
$16:bf25  c6 e1		 dec $e1
$16:bf27  71 d8		 adc ($d8),y
$16:bf29  9c 3c da	  stz $da3c
$16:bf2c  d1 08		 cmp ($08),y
$16:bf2e  1c 42 17	  trb $1742
$16:bf31  10 89		 bpl $bebc
$16:bf33  a7 81		 lda [$81]
$16:bf35  5c bc 0e 04   jml $040ebc
$16:bf39  82 00 17	  brl $d63c
$16:bf3c  06 c8		 asl $c8
$16:bf3e  48			pha
$16:bf3f  34 00		 bit $00,x
$16:bf41  f5 0b		 sbc $0b,x
$16:bf43  87 80		 sta [$80]
$16:bf45  4e 5a 06	  lsr $065a
$16:bf48  c8			iny
$16:bf49  0b			phd
$16:bf4a  d9 6c 6f	  cmp $6f6c,y
$16:bf4d  70 18		 bvs $bf67
$16:bf4f  3a			dec a
$16:bf50  10 c0		 bpl $bf12
$16:bf52  e0 2f		 cpx #$2f
$16:bf54  60			rts
$16:bf55  ab			plb
$16:bf56  13 dc		 ora ($dc,s),y
$16:bf58  4c b1 88	  jmp $88b1
$16:bf5b  c2 c8		 rep #$c8
$16:bf5d  23 8b		 and $8b,s
$16:bf5f  20 8c 13	  jsr $138c
$16:bf62  8a			txa
$16:bf63  04 ca		 tsb $ca
$16:bf65  03 98		 ora $98,s
$16:bf67  9c c0 e6	  stz $e6c0
$16:bf6a  06 f0		 asl $f0
$16:bf6c  27 01		 and [$01]
$16:bf6e  c0 0e		 cpy #$0e
$16:bf70  62 c4 18	  per $d837
$16:bf73  54 02 1d	  mvn $1d,$02
$16:bf76  0a			asl a
$16:bf77  85 40		 sta $40
$16:bf79  a3 50		 lda $50,s
$16:bf7b  bd 44 2f	  lda $2f44,x
$16:bf7e  d7 af		 cmp [$af],y
$16:bf80  d3 cb		 cmp ($cb,s),y
$16:bf82  d8			cld
$16:bf83  a3 0c		 lda $0c,s
$16:bf85  86 c0		 stx $c0
$16:bf87  14 61		 trb $61
$16:bf89  14 80		 trb $80
$16:bf8b  4d 38 1d	  eor $1d38
$16:bf8e  08			php
$16:bf8f  02 ac		 cop #$ac
$16:bf91  30 0a		 bmi $bf9d
$16:bf93  c0 c0		 cpy #$c0
$16:bf95  6c 3a 1b	  jmp ($1b3a)
$16:bf98  0f 06 a2 e1   ora $e1a206
$16:bf9c  6d dc 4a	  adc $4adc
$16:bf9f  fb			xce
$16:bfa0  b9 bf 72	  lda $72bf,y
$16:bfa3  bc 28 13	  ldy $1328,x
$16:bfa6  09 83		 ora #$83
$16:bfa8  d0 01		 bne $bfab
$16:bfaa  a3 04		 lda $04,s
$16:bfac  1d 82 38	  ora $3882,x
$16:bfaf  4d e4 74	  eor $74e4
$16:bfb2  12 18		 ora ($18)
$16:bfb4  42 11		 wdm #$11
$16:bfb6  20 1b 0a	  jsr $0a1b
$16:bfb9  04 e0		 tsb $e0
$16:bfbb  86 0d		 stx $0d
$16:bfbd  e0 6f		 cpx #$6f
$16:bfbf  02 24		 cop #$24
$16:bfc1  21 0d		 and ($0d,x)
$16:bfc3  81 6f		 sta ($6f,x)
$16:bfc5  0c 02 55	  tsb $5502
$16:bfc8  05 8c		 ora $8c
$16:bfca  45 21		 eor $21
$16:bfcc  d0 28		 bne $bff6
$16:bfce  5c 32 1f 00   jml $001f32
$16:bfd2  83 8c		 sta $8c,s
$16:bfd4  8e 1b 31	  stx $311b
$16:bfd7  8a			txa
$16:bfd8  44 e0 48	  mvp $48,$e0
$16:bfdb  f0 86		 beq $bf63
$16:bfdd  0b			phd
$16:bfde  db			stp
$16:bfdf  41 40		 eor ($40,x)
$16:bfe1  90 50		 bcc $c033
$16:bfe3  3c 18 09	  bit $0918,x
$16:bfe6  07 03		 ora [$03]
$16:bfe8  c1 e0		 cmp ($e0,x)
$16:bfea  e0 50		 cpx #$50
$16:bfec  2c 04 31	  bit $3104
$16:bfef  0d 85 03	  ora $0385
$16:bff2  00 bf		 brk #$bf
$16:bff4  02 b0		 cop #$b0
$16:bff6  1b			tcs
$16:bff7  42 40		 wdm #$40
$16:bff9  1b			tcs
$16:bffa  25 20		 and $20
$16:bffc  44 e1 50	  mvp $50,$e1
$16:bfff  58			cli
$16:c000  54 1a 13	  mvn $13,$1a
$16:c003  07 87		 ora [$87]
$16:c005  c3 a0		 cmp $a0,s
$16:c007  f0 47		 beq $c050
$16:c009  b8			clv
$16:c00a  3e 82 37	  rol $3782,x
$16:c00d  13 86		 ora ($86,s),y
$16:c00f  c0 60		 cpy #$60
$16:c011  d0 18		 bne $c02b
$16:c013  1c 11 24	  trb $2411
$16:c016  10 80		 bpl $bf98
$16:c018  31 88		 and ($88),y
$16:c01a  43 61		 eor $61,s
$16:c01c  50 d0		 bvc $bfee
$16:c01e  19 c0 2e	  ora $2ec0,y
$16:c021  06 91		 asl $91
$16:c023  13 00		 ora ($00,s),y
$16:c025  34 70		 bit $70,x
$16:c027  17 08		 ora [$08],y
$16:c029  80 98		 bra $bfc3
$16:c02b  30 02		 bmi $c02f
$16:c02d  a3 7d		 lda $7d,s
$16:c02f  9c 2e 0a	  stz $0a2e
$16:c032  45 08		 eor $08
$16:c034  3b			tsc
$16:c035  e4 19		 cpx $19
$16:c037  60			rts
$16:c038  07 48		 ora [$48]
$16:c03a  7c 21 96	  jmp ($9621,x)
$16:c03d  30 60		 bmi $c09f
$16:c03f  3b			tsc
$16:c040  3e 82 a1	  rol $a182,x
$16:c043  20 88 48	  jsr $4888
$16:c046  36 1c		 rol $1c,x
$16:c048  0f 84 c3 c1   ora $c1c384
$16:c04c  70 f8		 bvs $c046
$16:c04e  3e 8e 60	  rol $608e,x
$16:c051  54 0e 01	  mvn $01,$0e
$16:c054  6c 58 61	  jmp ($6158)
$16:c057  70 03		 bvs $c05c
$16:c059  a3 e4		 lda $e4,s
$16:c05b  0e 20 71	  asl $7120
$16:c05e  08			php
$16:c05f  3c 19 68	  bit $6819,x
$16:c062  0f 94 23 01   ora $012394
$16:c066  d4 d0		 pei ($d0)
$16:c068  80 f9		 bra $c063
$16:c06a  48			pha
$16:c06b  07 8a		 ora [$8a]
$16:c06d  01 54		 ora ($54,x)
$16:c06f  90 42		 bcc $c0b3
$16:c071  25 09		 and $09
$16:c073  f0 2b		 beq $c0a0
$16:c075  80 8c		 bra $c003
$16:c077  5f 43 10 83   eor $831043,x
$16:c07b  4c 39 93	  jmp $9339
$16:c07e  8e 41 6c	  stx $6c41
$16:c081  80 e8		 bra $c06b
$16:c083  b6 16		 ldx $16,y
$16:c085  28			plp
$16:c086  40			rti
$16:c087  a0 ab		 ldy #$ab
$16:c089  50 21		 bvc $c0ac
$16:c08b  04 0e		 tsb $0e
$16:c08d  03 01		 ora $01,s
$16:c08f  35 04		 and $04,x
$16:c091  0c ee 30	  tsb $30ee
$16:c094  22 20 bf 0a   jsl $0abf20
$16:c098  04 77		 tsb $77
$16:c09a  1f 00 94 6c   ora $6c9400,x
$16:c09e  18			clc
$16:c09f  0b			phd
$16:c0a0  07 00		 ora [$00]
$16:c0a2  26 38		 rol $38
$16:c0a4  07 2a		 ora [$2a]
$16:c0a6  19 80 1e	  ora $1e80,y
$16:c0a9  24 f0		 bit $f0
$16:c0ab  35 03		 and $03,x
$16:c0ad  64 e3		 stz $e3
$16:c0af  f0 88		 beq $c039
$16:c0b1  73 c0		 adc ($c0,s),y
$16:c0b3  60			rts
$16:c0b4  50 68		 bvc $c11e
$16:c0b6  49 d1		 eor #$d1
$16:c0b8  61 11		 adc ($11,x)
$16:c0ba  08			php
$16:c0bb  1c 2d f8	  trb $f82d
$16:c0be  10 b1		 bpl $c071
$16:c0c0  88			dey
$16:c0c1  2f c0 d4 72   and $72d4c0
$16:c0c5  0d 00 3c	  ora $3c00
$16:c0c8  34 05		 bit $05,x
$16:c0ca  20 a0 28	  jsr $28a0
$16:c0cd  42 c1		 wdm #$c1
$16:c0cf  e0 d0		 cpx #$d0
$16:c0d1  48			pha
$16:c0d2  15 40		 ora $40,x
$16:c0d4  55 05		 eor $05,x
$16:c0d6  50 28		 bvc $c100
$16:c0d8  c0 c6		 cpy #$c6
$16:c0da  40			rti
$16:c0db  e0 a0		 cpx #$a0
$16:c0dd  08			php
$16:c0de  41 04		 eor ($04,x)
$16:c0e0  10 08		 bpl $c0ea
$16:c0e2  54 02 1d	  mvn $1d,$02
$16:c0e5  08			php
$16:c0e6  82 c1 9e	  brl $5faa
$16:c0e9  a0 f5		 ldy #$f5
$16:c0eb  05 a0		 ora $a0
$16:c0ed  40			rti
$16:c0ee  4f 80 c2 08   eor $08c280
$16:c0f2  64 2e		 stz $2e
$16:c0f4  09 05		 ora #$05
$16:c0f6  5f 0a fc 18   eor $18fc0a,x
$16:c0fa  c5 af		 cmp $af
$16:c0fc  df e7 f7 f3   cmp $f3f7e7,x
$16:c100  ff fd ff fe   sbc $fefffd,x
$16:c104  94 0b		 sty $0b,x
$16:c106  fe fe ff	  inc $fffe,x
$16:c109  df af fb cc   cmp $ccfbaf,x
$16:c10d  00 60		 brk #$60
$16:c10f  17 50		 ora [$50],y
$16:c111  e0 14		 cpx #$14
$16:c113  02 5c		 cop #$5c
$16:c115  08			php
$16:c116  84 03		 sty $03
$16:c118  95 f7		 sta $f7,x
$16:c11a  f3 7e		 sbc ($7e,s),y
$16:c11c  fe 5f df	  inc $df5f,x
$16:c11f  cf fb fb fe   cmp $fefbfb
$16:c123  ff ff 56 81   sbc $8156ff,x
$16:c127  fd fa b9	  sbc $b9fa,x
$16:c12a  d9 f8 10	  cmp $10f8,y
$16:c12d  24 50		 bit $50
$16:c12f  9c 41 4e	  stz $4e41
$16:c132  1d 0c 07	  ora $070c,x
$16:c135  c3 20		 cmp $20,s
$16:c137  25 06		 and $06
$16:c139  b1 48		 lda ($48),y
$16:c13b  24 16		 bit $16
$16:c13d  0b			phd
$16:c13e  02 9c		 cop #$9c
$16:c140  66 15		 ror $15
$16:c142  09 06		 ora #$06
$16:c144  01 c8		 ora ($c8,x)
$16:c146  65 50		 adc $50
$16:c148  6f 0b 10 81   adc $81100b
$16:c14c  61 06		 adc ($06,x)
$16:c14e  1a			inc a
$16:c14f  83 e0		 sta $e0,s
$16:c151  11 a1		 ora ($a1),y
$16:c153  05 1d		 ora $1d
$16:c155  90 d0		 bcc $c127
$16:c157  20 30 60	  jsr $6030
$16:c15a  21 b0		 and ($b0,x)
$16:c15c  82 16 fe	  brl $bf75
$16:c15f  3c 06 01	  bit $0106,x
$16:c162  aa			tax
$16:c163  1d 4a 86	  ora $864a,x
$16:c166  12 01		 ora ($01)
$16:c168  c4 80		 cpy $80
$16:c16a  5d 32 0c	  eor $0c32,x
$16:c16d  22 c2 41 29   jsl $2941c2
$16:c171  18			clc
$16:c172  ca			dex
$16:c173  46 72		 lsr $72
$16:c175  21 d4		 and ($d4,x)
$16:c177  88			dey
$16:c178  45 36		 eor $36
$16:c17a  19 46 0a	  ora $0a46,y
$16:c17d  bd 1d 7e	  lda $7e1d,x
$16:c180  80 38		 bra $c1ba
$16:c182  5f a0 4c 9a   eor $9a4ca0,x
$16:c186  a1 a8		 lda ($a8,x)
$16:c188  90 72		 bcc $c1fc
$16:c18a  09 cd		 ora #$cd
$16:c18c  00 a4		 brk #$a4
$16:c18e  62 2a 19	  per $dabb
$16:c191  88			dey
$16:c192  87 e2		 sta [$e2]
$16:c194  41 28		 eor ($28,x)
$16:c196  61 24		 adc ($24,x)
$16:c198  06 06		 asl $06
$16:c19a  76 08		 ror $08,x
$16:c19c  d4 6a		 pei ($6a)
$16:c19e  23 13		 and $13,s
$16:c1a0  89 ab		 bit #$ab
$16:c1a2  41 88		 eor ($88,x)
$16:c1a4  60			rts
$16:c1a5  e0 3e		 cpx #$3e
$16:c1a7  84 0a		 sty $0a
$16:c1a9  33 1b		 and ($1b,s),y
$16:c1ab  84 46		 sty $46
$16:c1ad  21 0c		 and ($0c,x)
$16:c1af  22 6b 07 82   jsl $82076b
$16:c1b3  41 40		 eor ($40,x)
$16:c1b5  55 02		 eor $02,x
$16:c1b7  58			cli
$16:c1b8  2c 1f 04	  bit $041f
$16:c1bb  72 3a		 adc ($3a)
$16:c1bd  43 81		 eor $81,s
$16:c1bf  00 4a		 brk #$4a
$16:c1c1  87 01		 sta [$01]
$16:c1c3  bc 08 d4	  ldy $d408,x
$16:c1c6  2f 84 32 1b   and $1b3284
$16:c1ca  09 85		 ora #$85
$16:c1cc  ae 02 15	  ldx $1502
$16:c1cf  0a			asl a
$16:c1d0  86 c3		 stx $c3
$16:c1d2  cb			wai
$16:c1d3  e5 08		 sbc $08
$16:c1d5  84 40		 sty $40
$16:c1d7  61 90		 adc ($90,x)
$16:c1d9  f8			sed
$16:c1da  23 1c		 and $1c,s
$16:c1dc  21 d0		 and ($d0,x)
$16:c1de  56 38		 lsr $38,x
$16:c1e0  17 d1		 ora [$d1],y
$16:c1e2  27 0c		 and [$0c]
$16:c1e4  f5 52		 sbc $52,x
$16:c1e6  39 04 e0	  and $e004,y
$16:c1e9  47 34		 eor [$34]
$16:c1eb  3a			dec a
$16:c1ec  89 c4		 bit #$c4
$16:c1ee  ce a2 36	  dec $36a2
$16:c1f1  04 20		 tsb $20
$16:c1f3  bf 48 be 9c   lda $9cbe48,x
$16:c1f7  0e 04 81	  asl $8104
$16:c1fa  30 09		 bmi $c205
$16:c1fc  20 4c 06	  jsr $064c
$16:c1ff  80 aa		 bra $c1ab
$16:c201  01 13		 ora ($13,x)
$16:c203  0b			phd
$16:c204  87 80		 sta [$80]
$16:c206  4e 5a 04	  lsr $045a
$16:c209  b8			clv
$16:c20a  03 19		 ora $19,s
$16:c20c  ec a3 07	  cpx $07a3
$16:c20f  04 18		 tsb $18
$16:c211  2d 83 e1	  and $e183
$16:c214  c0 0b		 cpy #$0b
$16:c216  2b			pld
$16:c217  7c 13 22	  jmp ($2213,x)
$16:c21a  63 02		 adc $02,s
$16:c21c  b9 0a 0d	  lda $0d0a,y
$16:c21f  ea			nop
$16:c220  10 a8		 bpl $c1ca
$16:c222  5c 0a 0a 08   jml $080a0a
$16:c226  07 b8		 ora [$b8]
$16:c228  1d d6 0d	  ora $0dd6,x
$16:c22b  0b			phd
$16:c22c  82 41 55	  brl $1770
$16:c22f  ca			dex
$16:c230  df 2e ff de   cmp $deff2e,x
$16:c234  af fb 9b ff   lda $ff9bfb
$16:c238  62 bf ec	  per $aefa
$16:c23b  6c 7f 4b	  jmp ($4b7f)
$16:c23e  bf 91 d7 e8   lda $e8d791,x
$16:c242  1f ec 44 03   ora $0344ec,x
$16:c246  89 00		 bit #$00
$16:c248  f1 40		 sbc ($40),y
$16:c24a  3e 30 08	  rol $0830,x
$16:c24d  c5 83		 cmp $83
$16:c24f  79 40 af	  adc $af40,y
$16:c252  60			rts
$16:c253  21 d0		 and ($d0,x)
$16:c255  1f a7 93 eb   ora $eb93a7,x
$16:c259  d5 e9		 cmp $e9,x
$16:c25b  e4 fa		 cpx $fa
$16:c25d  f5 7a		 sbc $7a,x
$16:c25f  75 26		 adc $26,x
$16:c261  a5 58		 lda $58
$16:c263  9d cf af	  sta $afcf,x
$16:c266  37 f8		 and [$f8],y
$16:c268  d4 06		 pei ($06)
$16:c26a  53 02		 eor ($02,s),y
$16:c26c  b5 c1		 lda $c1,x
$16:c26e  34 f0		 bit $f0,x
$16:c270  8d 44 5b	  sta $5b44
$16:c273  31 27		 and ($27),y
$16:c275  dd 50 6e	  cmp $6e50,x
$16:c278  18			clc
$16:c279  0f 03 98 30   ora $309803
$16:c27d  1b			tcs
$16:c27e  06 78		 asl $78
$16:c280  3a			dec a
$16:c281  00 ba		 brk #$ba
$16:c283  06 31		 asl $31
$16:c285  31 86		 and ($86),y
$16:c287  02 c1		 cop #$c1
$16:c289  80 b8		 bra $c243
$16:c28b  68			pla
$16:c28c  22 05 31 73   jsl $733105
$16:c290  2c 2a 0b	  bit $0b2a
$16:c293  18			clc
$16:c294  8a			txa
$16:c295  43 a0		 eor $a0,s
$16:c297  50 b8		 bvc $c251
$16:c299  64 3e		 stz $3e
$16:c29b  01 07		 ora ($07,x)
$16:c29d  19 1c 36	  ora $361c,y
$16:c2a0  03 14		 ora $14,s
$16:c2a2  89 c0		 bit #$c0
$16:c2a4  88			dey
$16:c2a5  e1 0c		 sbc ($0c,x)
$16:c2a7  42 b6		 wdm #$b6
$16:c2a9  92 a1		 sta ($a1)
$16:c2ab  24 a0		 bit $a0
$16:c2ad  7d 32 13	  adc $1332,x
$16:c2b0  0e 07 c3	  asl $c307
$16:c2b3  c1 c0		 cmp ($c0,x)
$16:c2b5  a0 58		 ldy #$58
$16:c2b7  06 43		 asl $43
$16:c2b9  60			rts
$16:c2ba  8a			txa
$16:c2bb  54 32 98	  mvn $98,$32
$16:c2be  88			dey
$16:c2bf  e4 23		 cpx $23
$16:c2c1  99 04 f2	  sta $f204,y
$16:c2c4  48			pha
$16:c2c5  03 64		 ora $64,s
$16:c2c7  fe 08 9b	  inc $9b08,x
$16:c2ca  bc 21 50	  ldy $5021,x
$16:c2cd  68			pla
$16:c2ce  4c 1e 1f	  jmp $1f1e
$16:c2d1  0e 83 c1	  asl $c183
$16:c2d4  1e e0 85	  asl $85e0,x
$16:c2d7  08			php
$16:c2d8  dc 4d fe	  jml [$fe4d]
$16:c2db  10 63		 bpl $c340
$16:c2dd  e8			inx
$16:c2de  41 20		 eor ($20,x)
$16:c2e0  10 e8		 bpl $c2ca
$16:c2e2  40			rti
$16:c2e3  18			clc
$16:c2e4  e9 18		 sbc #$18
$16:c2e6  0d 45 83	  ora $8345
$16:c2e9  11 e0		 ora ($e0),y
$16:c2eb  27 87		 and [$87]
$16:c2ed  a2 41		 ldx #$41
$16:c2ef  e0 80		 cpx #$80
$16:c2f1  35 81		 and $81,x
$16:c2f3  0a			asl a
$16:c2f4  1a			inc a
$16:c2f5  02 88		 cop #$88
$16:c2f7  4a			lsr a
$16:c2f8  38			sec
$16:c2f9  12 8d		 ora ($8d)
$16:c2fb  04 a2		 tsb $a2
$16:c2fd  21 38		 and ($38,x)
$16:c2ff  88			dey
$16:c300  46 21		 lsr $21
$16:c302  08			php
$16:c303  41 8a		 eor ($8a,x)
$16:c305  c4 e3		 cpy $e3
$16:c307  b1 b8		 lda ($b8),y
$16:c309  a4 6e		 ldy $6e
$16:c30b  2f 10 89 9a   and $9a8910
$16:c30f  42 30		 wdm #$30
$16:c311  07 28		 ora [$28]
$16:c313  fc 20 fe	  jsr ($fe20,x)
$16:c316  11 18		 ora ($18),y
$16:c318  51 a8		 eor ($a8),y
$16:c31a  0d 40 a6	  ora $a640
$16:c31d  08			php
$16:c31e  83 90		 sta $90,s
$16:c320  6a			ror a
$16:c321  12 08		 ora ($08)
$16:c323  84 83		 sty $83
$16:c325  60			rts
$16:c326  16 09		 asl $09,x
$16:c328  87 82		 sta [$82]
$16:c32a  e1 f0		 sbc ($f0,x)
$16:c32c  03 98		 ora $98,s
$16:c32e  54 24 1c	  mvn $1c,$24
$16:c331  02 d8		 cop #$d8
$16:c333  cc 20 17	  cpy $1720
$16:c336  00 3a		 brk #$3a
$16:c338  43 e1		 eor $e1,s
$16:c33a  10 d8		 bpl $c314
$16:c33c  5c 26 1f 0f   jml $0f1f26
$16:c340  86 41		 stx $41
$16:c342  60			rts
$16:c343  6f 94 03 03   adc $030394
$16:c347  dc 21 64	  jml [$6421]
$16:c34a  60			rts
$16:c34b  86 42		 stx $42
$16:c34d  21 60		 and ($60,x)
$16:c34f  74 f0		 stz $f0,x
$16:c351  23 86		 and $86,s
$16:c353  31 28		 and ($28),y
$16:c355  0a			asl a
$16:c356  83 3c		 sta $3c,s
$16:c358  1d 60 07	  ora $0760,x
$16:c35b  40			rti
$16:c35c  a8			tay
$16:c35d  4e 39 05	  lsr $0539
$16:c360  b2 03		 lda ($03)
$16:c362  a4 09		 ldy $09
$16:c364  70 30		 bvs $c396
$16:c366  68			pla
$16:c367  14 16		 trb $16
$16:c369  0e 43 08	  asl $0843
$16:c36c  34 0e		 bit $0e,x
$16:c36e  03 01		 ora $01,s
$16:c370  64 84		 stz $84
$16:c372  0e 06 ed	  asl $ed06
$16:c375  12 20		 ora ($20)
$16:c377  bf 09 de 0c   lda $0cde09,x
$16:c37b  d2 51		 cmp ($51)
$16:c37d  85 83		 sta $83
$16:c37f  01 60		 ora ($60,x)
$16:c381  e0 04		 cpx #$04
$16:c383  c7 00		 cmp [$00]
$16:c385  e5 4b		 sbc $4b
$16:c387  00 38		 brk #$38
$16:c389  a8			tay
$16:c38a  0d 91 6c	  ora $6c91
$16:c38d  98			tya
$16:c38e  00 1d		 brk #$1d
$16:c390  e5 02		 sbc $02
$16:c392  83 42		 sta $42,s
$16:c394  60			rts
$16:c395  eb			xba
$16:c396  90 00		 bcc $c398
$16:c398  08			php
$16:c399  b0 9f		 bcs $c33a
$16:c39b  40			rti
$16:c39c  c2 08		 rep #$08
$16:c39e  70 14		 bvs $c3b4
$16:c3a0  19 29 20	  ora $2029,y
$16:c3a3  d0 33		 bne $c3d8
$16:c3a5  c3 40		 cmp $40,s
$16:c3a7  52 0a		 eor ($0a)
$16:c3a9  04 83		 tsb $83
$16:c3ab  81 a0		 sta ($a0,x)
$16:c3ad  b0 68		 bcs $c417
$16:c3af  24 0c		 bit $0c
$16:c3b1  90 2a		 bcc $c3dd
$16:c3b3  83 24		 sta $24,s
$16:c3b5  14 60		 trb $60
$16:c3b7  63 20		 adc $20,s
$16:c3b9  90 50		 bcc $c40b
$16:c3bb  04 21		 tsb $21
$16:c3bd  00 02		 brk #$02
$16:c3bf  00 0c		 brk #$0c
$16:c3c1  45 c2		 eor $c2
$16:c3c3  fc 13 cf	  jsr ($cf13,x)
$16:c3c6  b2 4a		 lda ($4a)
$16:c3c8  b7 f1		 lda [$f1],y
$16:c3ca  ae fe 6a	  ldx $6afe
$16:c3cd  7f 5c a5 ff   adc $ffa55c,x
$16:c3d1  ab			plb
$16:c3d2  3f f2 c7 ee   and $eec7f2,x
$16:c3d6  b0 f9		 bcs $c3d1
$16:c3d8  cc 1d f0	  cpy $f01d
$16:c3db  10 98		 bpl $c375
$16:c3dd  34 16		 bit $16,x
$16:c3df  10 7e		 bpl $c45f
$16:c3e1  8f 1e 5e 43   sta $435e1e
$16:c3e5  85 da		 sta $da
$16:c3e7  79 72 bf	  adc $bf72,y
$16:c3ea  69 9d		 adc #$9d
$16:c3ec  d2 2f		 cmp ($2f)
$16:c3ee  58			cli
$16:c3ef  a7 54		 lda [$54]
$16:c3f1  2b			pld
$16:c3f2  96 0c		 stx $0c,y
$16:c3f4  45 83		 eor $83
$16:c3f6  15 70		 ora $70,x
$16:c3f8  d5 44		 cmp $44,x
$16:c3fa  14 81		 trb $81
$16:c3fc  88			dey
$16:c3fd  29 10		 and #$10
$16:c3ff  a4 a8		 ldy $a8
$16:c401  02 60		 cop #$60
$16:c403  31 93		 and ($93),y
$16:c405  34 55		 bit $55,x
$16:c407  46 d7		 lsr $d7
$16:c409  67 15		 adc [$15]
$16:c40b  40			rti
$16:c40c  46 21		 lsr $21
$16:c40e  06 1a		 asl $1a
$16:c410  83 e0		 sta $e0,s
$16:c412  07 21		 ora [$21]
$16:c414  0d 1d 99	  ora $991d
$16:c417  c4 20		 cpy $20
$16:c419  c0 43		 cpy #$43
$16:c41b  55 04		 eor $04,x
$16:c41d  2c 76 78	  bit $7876
$16:c420  0c 07 02	  tsb $0207
$16:c423  80 15		 bra $c43a
$16:c425  06 68		 asl $68
$16:c427  19 40 30	  ora $3040,y
$16:c42a  2d c3 68	  and $68c3
$16:c42d  80 60		 bra $c48f
$16:c42f  c2 42		 rep #$42
$16:c431  ef 47 98 00   sbc $009847
$16:c435  82 15 0a	  brl $ce4d
$16:c438  39 89 dc	  and $dc89,y
$16:c43b  c0 63		 cpy #$63
$16:c43d  05 51		 ora $51
$16:c43f  04 3a		 tsb $3a
$16:c441  1b			tcs
$16:c442  04 82		 tsb $82
$16:c444  41 df		 eor ($df,x)
$16:c446  60			rts
$16:c447  10 f1		 bpl $c43a
$16:c449  0f bc 46 03   ora $0346bc
$16:c44d  03 3b		 ora $3b,s
$16:c44f  04 08		 tsb $08
$16:c451  68			pla
$16:c452  07 60		 ora [$60]
$16:c454  77 20		 adc [$20],y
$16:c456  f0 10		 beq $c468
$16:c458  82 34 08	  brl $cc8f
$16:c45b  3c 12 10	  bit $1012,x
$16:c45e  a4 36		 ldy $36
$16:c460  80 78		 bra $c4da
$16:c462  24 14		 bit $14
$16:c464  08			php
$16:c465  04 a2		 tsb $a2
$16:c467  51 40		 eor ($40),y
$16:c469  b0 7c		 bcs $c4e7
$16:c46b  22 08 f3 c0   jsl $c0f308
$16:c46f  48			pha
$16:c470  1a			inc a
$16:c471  61 e0		 adc ($e0,x)
$16:c473  98			tya
$16:c474  76 2d		 ror $2d,x
$16:c476  98			tya
$16:c477  c8			iny
$16:c478  94 49		 sty $49,x
$16:c47a  b4 67		 ldy $67,x
$16:c47c  4f 42 a1 f5   eor $f5a142
$16:c480  24 09		 bit $09
$16:c482  60			rts
$16:c483  b0 25		 bcs $c4aa
$16:c485  49 a2		 eor #$a2
$16:c487  71 06		 adc ($06),y
$16:c489  88			dey
$16:c48a  34 02		 bit $02,x
$16:c48c  81 a0		 sta ($a0,x)
$16:c48e  52 92		 eor ($92)
$16:c490  94 2c		 sty $2c,x
$16:c492  18			clc
$16:c493  08			php
$16:c494  82 78 d6	  brl $9b0f
$16:c497  28			plp
$16:c498  b5 02		 lda $02,x
$16:c49a  68			pla
$16:c49b  40			rti
$16:c49c  e0 8f		 cpx #$8f
$16:c49e  05 42		 ora $42
$16:c4a0  1b			tcs
$16:c4a1  f4 21 10	  pea $1021
$16:c4a4  c7 7a		 cmp [$7a]
$16:c4a6  70 38		 bvs $c4e0
$16:c4a8  0e 01 32	  asl $3201
$16:c4ab  03 40		 ora $40,s
$16:c4ad  34 00		 bit $00,x
$16:c4af  f5 70		 sbc $70,x
$16:c4b1  07 80		 ora [$80]
$16:c4b3  4e 5a 04	  lsr $045a
$16:c4b6  b8			clv
$16:c4b7  3c 26 27	  bit $2726,x
$16:c4ba  13 3e		 ora ($3e,s),y
$16:c4bc  a2 04		 ldx #$04
$16:c4be  91 61		 sta ($61),y
$16:c4c0  0b			phd
$16:c4c1  84 42		 sty $42
$16:c4c3  e3 0e		 sbc $0e,s
$16:c4c5  d6 e0		 dec $e0,x
$16:c4c7  05 bc		 ora $bc
$16:c4c9  4e d1 e8	  lsr $e8d1
$16:c4cc  e0 1c		 cpx #$1c
$16:c4ce  e0 11		 cpx #$11
$16:c4d0  f6 40		 inc $40,x
$16:c4d2  1b			tcs
$16:c4d3  c5 7a		 cmp $7a
$16:c4d5  51 c4		 eor ($c4),y
$16:c4d7  02 c7		 cop #$c7
$16:c4d9  63 88		 adc $88,s
$16:c4db  53 81		 eor ($81,s),y
$16:c4dd  c3 c8		 cmp $c8,s
$16:c4df  c0 08		 cpy #$08
$16:c4e1  14 b7		 trb $b7
$16:c4e3  bb			tyx
$16:c4e4  d6 71		 dec $71,x
$16:c4e6  40			rti
$16:c4e7  f8			sed
$16:c4e8  09 c5		 ora #$c5
$16:c4ea  cc 09 e6	  cpy $e609
$16:c4ed  c0 27		 cpy #$27
$16:c4ef  b6 f1		 ldx $f1,y
$16:c4f1  38			sec
$16:c4f2  73 03		 adc ($03,s),y
$16:c4f4  98			tya
$16:c4f5  3f 05 40 9c   and $9c4005,x
$16:c4f9  5e 0b 60	  lsr $600b,x
$16:c4fc  55 05		 eor $05,x
$16:c4fe  61 38		 adc ($38,x)
$16:c500  12 71		 ora ($71)
$16:c502  b8			clv
$16:c503  70 1c		 bvs $c521
$16:c505  2a			rol a
$16:c506  1b			tcs
$16:c507  0d 81 44	  ora $4481
$16:c50a  a2 e9		 ldx #$e9
$16:c50c  10 48		 bpl $c556
$16:c50e  90 c4		 bcc $c4d4
$16:c510  a9 b4		 lda #$b4
$16:c512  99 9c c2	  sta $c29c,y
$16:c515  14 77		 trb $77
$16:c517  05 b5		 ora $b5
$16:c519  d8			cld
$16:c51a  28			plp
$16:c51b  06 81		 asl $81
$16:c51d  f0 70		 beq $c58f
$16:c51f  28			plp
$16:c520  16 01		 asl $01,x
$16:c522  88			dey
$16:c523  c4 2a		 cpy $2a
$16:c525  1e 0b 06	  asl $060b,x
$16:c528  01 ba		 ora ($ba,x)
$16:c52a  5e 09 00	  lsr $0009,x
$16:c52d  6c 8f 01	  jmp ($018f)
$16:c530  01 87		 ora ($87,x)
$16:c532  c1 21		 cmp ($21,x)
$16:c534  24 80		 bit $80
$16:c536  80 0d		 bra $c545
$16:c538  42 0f		 wdm #$0f
$16:c53a  04 04		 tsb $04
$16:c53c  94 16		 sty $16,x
$16:c53e  0a			asl a
$16:c53f  39 08 1c	  and $1c08,y
$16:c542  10 88		 bpl $c4cc
$16:c544  50 01		 bvc $c547
$16:c546  d1 af		 cmp ($af),y
$16:c548  c4 28		 cpy $28
$16:c54a  32 0e		 and ($0e)
$16:c54c  00 5d		 brk #$5d
$16:c54e  8a			txa
$16:c54f  20 b5 36	  jsr $36b5
$16:c552  e8			inx
$16:c553  78			sei
$16:c554  05 29		 ora $29
$16:c556  01 81		 ora ($81,x)
$16:c558  c1 48		 cmp ($48,x)
$16:c55a  61 07		 adc ($07,x)
$16:c55c  49 c2		 eor #$c2
$16:c55e  54 12 a1	  mvn $a1,$12
$16:c561  01 83		 ora ($83,x)
$16:c563  1e 14 12	  asl $1214,x
$16:c566  37 00		 and [$00],y
$16:c568  f0 40		 beq $c5aa
$16:c56a  36 1c		 rol $1c,x
$16:c56c  0f 84 c3 c1   ora $c1c384
$16:c570  70 58		 bvs $c5ca
$16:c572  80 24		 bra $c598
$16:c574  a6 1c		 ldx $1c
$16:c576  02 a8		 cop #$a8
$16:c578  37 46		 and [$46],y
$16:c57a  60			rts
$16:c57b  8e 10 4a	  stx $4a10
$16:c57e  40			rti
$16:c57f  8e 38 2f	  stx $2f38
$16:c582  04 0e		 tsb $0e
$16:c584  c4 14		 cpy $14
$16:c586  c0 93		 cpy #$93
$16:c588  ab			plb
$16:c589  86 40		 stx $40
$16:c58b  44 6a 67	  mvp $67,$6a
$16:c58e  81 40		 sta ($40,x)
$16:c590  e1 b0		 sbc ($b0,x)
$16:c592  88			dey
$16:c593  34 22		 bit $22,x
$16:c595  03 07		 ora $07,s
$16:c597  17 84		 ora [$84],y
$16:c599  1a			inc a
$16:c59a  07 01		 ora [$01]
$16:c59c  80 b2		 bra $c550
$16:c59e  42 17		 wdm #$17
$16:c5a0  0b			phd
$16:c5a1  87 3c		 sta [$3c]
$16:c5a3  82 13 0b	  brl $d0b9
$16:c5a6  86 41		 stx $41
$16:c5a8  47 41		 eor [$41]
$16:c5aa  03 77		 ora $77,s
$16:c5ac  80 98		 bra $c546
$16:c5ae  41 c3		 eor ($c3,x)
$16:c5b0  60			rts
$16:c5b1  a0 68		 ldy #$68
$16:c5b3  38			sec
$16:c5b4  0e 10 70	  asl $7010
$16:c5b7  9b			txy
$16:c5b8  24 e8		 bit $e8
$16:c5ba  0e 21 27	  asl $2721
$16:c5bd  89 3c		 bit #$3c
$16:c5bf  5d a5 1f	  eor $1fa5,x
$16:c5c2  88			dey
$16:c5c3  42 a2		 wdm #$a2
$16:c5c5  47 10		 eor [$10]
$16:c5c7  8b			phb
$16:c5c8  44 60 c6	  mvp $c6,$60
$16:c5cb  f0 7e		 beq $c64b
$16:c5cd  0c 4e 27	  tsb $274e
$16:c5d0  1c 88 43	  trb $4388
$16:c5d3  a2 31		 ldx #$31
$16:c5d5  38			sec
$16:c5d6  84 26		 sty $26
$16:c5d8  31 08		 and ($08),y
$16:c5da  84 c1		 sty $c1
$16:c5dc  20 a0 df	  jsr $dfa0
$16:c5df  64 8c		 stz $8c
$16:c5e1  80 45		 bra $c628
$16:c5e3  66 b8		 ror $b8
$16:c5e5  7d 81 2c	  adc $2c81,x
$16:c5e8  21 cf		 and ($cf,x)
$16:c5ea  c1 38		 cmp ($38,x)
$16:c5ec  bc 02 0a	  ldy $0a02,x
$16:c5ef  f7 08		 sbc [$08],y
$16:c5f1  71 7c		 adc ($7c),y
$16:c5f3  bf f9 2e 95   lda $952ef9,x
$16:c5f7  4b			phk
$16:c5f8  a4 97		 ldy $97
$16:c5fa  0a			asl a
$16:c5fb  96 02		 stx $02,y
$16:c5fd  ff bf ff 97   sbc $97ffbf,x
$16:c601  8a			txa
$16:c602  db			stp
$16:c603  00 d6		 brk #$d6
$16:c605  c0 25		 cpy #$25
$16:c607  aa			tax
$16:c608  41 35		 eor ($35,x)
$16:c60a  26 09		 rol $09
$16:c60c  24 14		 bit $14
$16:c60e  9a			txs
$16:c60f  5d 29 68	  eor $6829,x
$16:c612  14 da		 trb $da
$16:c614  74 1f		 stz $1f,x
$16:c616  f1 fb		 sbc ($fb),y
$16:c618  fe ab 8b	  inc $8bab,x
$16:c61b  6d 00 da	  adc $da00
$16:c61e  c0 36		 cpy #$36
$16:c620  90 0d		 bcc $c62f
$16:c622  8a			txa
$16:c623  20 4d 75	  jsr $754d
$16:c626  80 c0		 bra $c5e8
$16:c628  48			pha
$16:c629  24 17		 bit $17
$16:c62b  06 75		 asl $75
$16:c62d  18			clc
$16:c62e  00 b6		 brk #$b6
$16:c630  1f 03 93 8e   ora $8e9303,x
$16:c634  c2 06		 rep #$06
$16:c636  f8			sed
$16:c637  14 40		 trb $40
$16:c639  9f 89 12 0f   sta $0f1289,x
$16:c63d  d0 7e		 bne $c6bd
$16:c63f  90 a0		 bcc $c5e1
$16:c641  8a			txa
$16:c642  21 40		 and ($40,x)
$16:c644  31 01		 and ($01),y
$16:c646  8c 1d 61	  sty $611d
$16:c649  20 d0 13	  jsr $13d0
$16:c64c  87 81		 sta [$81]
$16:c64e  40			rti
$16:c64f  0e 89 88	  asl $8889
$16:c652  43 02		 eor $02,s
$16:c654  65 03		 adc $03
$16:c656  28			plp
$16:c657  1b			tcs
$16:c658  71 f6		 adc ($f6),y
$16:c65a  48			pha
$16:c65b  63 00		 adc $00,s
$16:c65d  c1 84		 cmp ($84,x)
$16:c65f  02 20		 cop #$20
$16:c661  1b			tcs
$16:c662  01 18		 ora ($18,x)
$16:c664  85 14		 sta $14
$16:c666  9e 5e 0a	  stz $0a5e,x
$16:c669  00 a8		 brk #$a8
$16:c66b  84 aa		 sty $aa
$16:c66d  f0 f0		 beq $c65f
$16:c66f  0f c0 2c 01   ora $012cc0
$16:c673  4d 08 89	  eor $8908
$16:c676  a9 0d		 lda #$0d
$16:c678  ca			dex
$16:c679  5f 02 f8 44   eor $44f802,x
$16:c67d  16 c3		 asl $c3,x
$16:c67f  08			php
$16:c680  38			sec
$16:c681  02 ec		 cop #$ec
$16:c683  56 0b		 lsr $0b,x
$16:c685  30 5b		 bmi $c6e2
$16:c687  0c 62 11	  tsb $1162
$16:c68a  08			php
$16:c68b  82 33 8a	  brl $50c1
$16:c68e  00 d3		 brk #$d3
$16:c690  86 86		 stx $86
$16:c692  b4 c0		 ldy $c0,x
$16:c694  5a			phy
$16:c695  f0 28		 beq $c6bf
$16:c697  10 b6		 bpl $c64f
$16:c699  de e2 70	  dec $70e2,x
$16:c69c  28			plp
$16:c69d  24 12		 bit $12
$16:c69f  c7 63		 cmp [$63]
$16:c6a1  be df 2e	  ldx $2edf,y
$16:c6a4  f7 19		 sbc [$19],y
$16:c6a6  7c 9e 7f	  jmp ($7f9e,x)
$16:c6a9  2f af d3 ef   and $efd3af
$16:c6ad  f5 f6		 sbc $f6,x
$16:c6af  a0 d8		 ldy #$d8
$16:c6b1  e0 77		 cpx #$77
$16:c6b3  f8			sed
$16:c6b4  7d fe 3f	  adc $3ffe,x
$16:c6b7  3f 13 84 fe   and $fe8413,x
$16:c6bb  fe 2b 07	  inc $072b,x
$16:c6be  e6 be		 inc $be
$16:c6c0  bc e0 56	  ldy $56e0,x
$16:c6c3  02 98		 cop #$98
$16:c6c5  9c 02 0b	  stz $0b02
$16:c6c8  04 8f		 tsb $8f
$16:c6ca  c7 27		 cmp [$27]
$16:c6cc  d1 c3		 cmp ($c3),y
$16:c6ce  81 a4		 sta ($a4,x)
$16:c6d0  c1 26		 cmp ($26,x)
$16:c6d2  10 78		 bpl $c74c
$16:c6d4  04 7e		 tsb $7e
$16:c6d6  00 2e		 brk #$2e
$16:c6d8  0f fc 12 0a   ora $0a12fc
$16:c6dc  84 18		 sty $18
$16:c6de  09 bc		 ora #$bc
$16:c6e0  21 c7		 and ($c7,x)
$16:c6e2  41 38		 eor ($38,x)
$16:c6e4  94 16		 sty $16,x
$16:c6e6  04 72		 tsb $72
$16:c6e8  12 c0		 ora ($c0)
$16:c6ea  20 02 1c	  jsr $1c02
$16:c6ed  7f 4d fd fd   adc $fdfd4d,x
$16:c6f1  1e 3f f4	  asl $f43f,x
$16:c6f4  7b			tdc
$16:c6f5  7f f2 58 08   adc $0858f2,x
$16:c6f9  02 7c		 cop #$7c
$16:c6fb  06 c0		 asl $c0
$16:c6fd  9f 6b 6c 03   sta $036c6b,x
$16:c701  f7 fc		 sbc [$fc],y
$16:c703  57 8f		 eor [$8f],y
$16:c705  f5 5e		 sbc $5e,x
$16:c707  df fa 4a 04   cmp $044afa,x
$16:c70b  86 c0		 stx $c0
$16:c70d  bf 6d b4 02   lda $02b46d,x
$16:c711  41 20		 eor ($20,x)
$16:c713  1b			tcs
$16:c714  13 3c		 ora ($3c,s),y
$16:c716  2e 0c e6	  rol $e60c
$16:c719  e0 29		 cpx #$29
$16:c71b  09 be		 ora #$be
$16:c71d  3f 06 fa 41   and $41fa06,x
$16:c721  a0 b0		 ldy #$b0
$16:c723  57 78		 eor [$78],y
$16:c725  40			rti
$16:c726  e1 30		 sbc ($30,x)
$16:c728  a8			tay
$16:c729  3b			tsc
$16:c72a  c4 07		 cpy $07
$16:c72c  81 04		 sta ($04,x)
$16:c72e  7d 84 06	  adc $0684,x
$16:c731  02 3e		 cop #$3e
$16:c733  08			php
$16:c734  18			clc
$16:c735  7c 21 c5	  jmp ($c521,x)
$16:c738  80 7f		 bra $c7b9
$16:c73a  81 f8		 sta ($f8,x)
$16:c73c  0f c1 a0 e8   ora $e8a0c1
$16:c740  56 37		 lsr $37,x
$16:c742  15 0b		 ora $0b,x
$16:c744  07 22		 ora [$22]
$16:c746  51 70		 eor ($70),y
$16:c748  a8			tay
$16:c749  6c 30 1a	  jmp ($1a30)
$16:c74c  0c 84 82	  tsb $8284
$16:c74f  21 c0		 and ($c0,x)
$16:c751  e0 6a		 cpx #$6a
$16:c753  31 16		 and ($16),y
$16:c755  0c 04 42	  tsb $4204
$16:c758  71 80		 adc ($80),y
$16:c75a  e8			inx
$16:c75b  07 c3		 ora [$c3]
$16:c75d  80 28		 bra $c787
$16:c75f  0e 84 0e	  asl $0e84
$16:c762  02 03		 cop #$03
$16:c764  07 7b		 ora [$7b]
$16:c766  3b			tsc
$16:c767  c0 d0		 cpy #$d0
$16:c769  0c 13 00	  tsb $0013
$16:c76c  39 7c 34	  and $347c,y
$16:c76f  10 0f		 bpl $c780
$16:c771  c4 63		 cpy $63
$16:c773  61 d0		 adc ($d0,x)
$16:c775  a0 68		 ldy #$68
$16:c777  02 64		 cop #$64
$16:c779  53 0b		 eor ($0b,s),y
$16:c77b  82 7c 38	  brl $fffa
$16:c77e  10 88		 bpl $c708
$16:c780  40			rti
$16:c781  7c 34 18	  jmp ($1834,x)
$16:c784  0b			phd
$16:c785  00 90		 brk #$90
$16:c787  60			rts
$16:c788  1d 08 06	  ora $0608,x
$16:c78b  01 ee		 ora ($ee,x)
$16:c78d  10 48		 bpl $c7d7
$16:c78f  33 f0		 and ($f0,s),y
$16:c791  21 30		 and ($30,x)
$16:c793  b7 b8		 lda [$b8],y
$16:c795  c0 4f		 cpy #$4f
$16:c797  21 01		 and ($01,x)
$16:c799  82 31 00	  brl $c7cd
$16:c79c  5e 27 d0	  lsr $d027,x
$16:c79f  87 92		 sta [$92]
$16:c7a1  c5 7e		 cmp $7e
$16:c7a3  30 28		 bmi $c7cd
$16:c7a5  35 82		 and $82,x
$16:c7a7  a1 90		 lda ($90,x)
$16:c7a9  d8			cld
$16:c7aa  64 34		 stz $34
$16:c7ac  14 8b		 trb $8b
$16:c7ae  40			rti
$16:c7af  5c 26 1c 04   jml $041c26
$16:c7b3  c8			iny
$16:c7b4  70 22		 bvs $c7d8
$16:c7b6  18			clc
$16:c7b7  0e 07 c3	  asl $c307
$16:c7ba  a1 e0		 lda ($e0,x)
$16:c7bc  e0 64		 cpx #$64
$16:c7be  3f 02 70 2f   and $2f7002,x
$16:c7c2  81 7c		 sta ($7c,x)
$16:c7c4  24 13		 bit $13
$16:c7c6  08			php
$16:c7c7  64 02		 stz $02
$16:c7c9  25 10		 and $10
$16:c7cb  30 84		 bmi $c751
$16:c7cd  12 24		 ora ($24)
$16:c7cf  7e 03 f0	  ror $f003,x
$16:c7d2  43 21		 eor $21,s
$16:c7d4  0b			phd
$16:c7d5  b0 5d		 bcs $c834
$16:c7d7  04 42		 tsb $42
$16:c7d9  1d 08 8b	  ora $8b08,x
$16:c7dc  44 95 e0	  mvp $e0,$95
$16:c7df  c6 15		 dec $15
$16:c7e1  a0 2d		 ldy #$2d
$16:c7e3  01 6e		 ora ($6e,x)
$16:c7e5  4c f8 20	  jmp $20f8
$16:c7e8  0b			phd
$16:c7e9  3f 1b 67 03   and $03671b,x
$16:c7ed  79 89 0c	  adc $0c89,y
$16:c7f0  1b			tcs
$16:c7f1  84 f9		 sty $f9
$16:c7f3  52 38		 eor ($38)
$16:c7f5  11 c1		 ora ($c1),y
$16:c7f7  f0 b7		 beq $c7b0
$16:c7f9  fa			plx
$16:c7fa  fd 7e 9f	  sbc $9f7e,x
$16:c7fd  3f 97 eb f4   and $f4eb97,x
$16:c801  f1 78		 sbc ($78),y
$16:c803  8c 36 19	  sty $1936
$16:c806  13 89		 ora ($89,s),y
$16:c808  93 42		 sta ($42,s),y
$16:c80a  7f 7f 0f 84   adc $840f7f,x
$16:c80e  7e 7f 1f	  ror $1f7f,x
$16:c811  df c3 e3 f0   cmp $f0e3c3,x
$16:c815  34 30		 bit $30,x
$16:c817  07 05		 ora [$05]
$16:c819  f2 cf		 sbc ($cf)
$16:c81b  72 02		 adc ($02)
$16:c81d  04 18		 tsb $18
$16:c81f  1a			inc a
$16:c820  00 d0		 brk #$d0
$16:c822  45 08		 eor $08
$16:c824  1c 40 81	  trb $8140
$16:c827  07 24		 ora [$24]
$16:c829  8c 3e 99	  sty $993e
$16:c82c  0c d0 48	  tsb $48d0
$16:c82f  01 a1		 ora ($a1,x)
$16:c831  ae 87 71	  ldx $7187
$16:c834  b8			clv
$16:c835  c9 c0		 cmp #$c0
$16:c837  b0 14		 bcs $c84d
$16:c839  86 01		 stx $01
$16:c83b  fc 80 78	  jsr ($7880,x)
$16:c83e  20 1c d8	  jsr $d81c
$16:c841  07 fa		 ora [$fa]
$16:c843  01 f6		 ora ($f6,x)
$16:c845  54 89 88	  mvn $88,$89
$16:c848  38			sec
$16:c849  10 48		 bpl $c893
$16:c84b  2c 3a 03	  bit $033a
$16:c84e  05 44		 ora $44
$16:c850  18			clc
$16:c851  1d 20 b0	  ora $b020,x
$16:c854  28			plp
$16:c855  0c 38 fe	  tsb $fe38
$16:c858  27 76		 and [$76]
$16:c85a  80 64		 bra $c8c0
$16:c85c  91 e6		 sta ($e6),y
$16:c85e  0d 0f ff	  ora $ff0f
$16:c861  ff 5d cf 9e   sbc $9ecf5d,x
$16:c865  63 a5		 adc $a5,s
$16:c867  9d fb 6c	  sta $6cfb,x
$16:c86a  01 3e		 ora ($3e,x)
$16:c86c  49 61		 eor #$61
$16:c86e  80 73		 bra $c8e3
$16:c870  e6 18		 inc $18
$16:c872  eb			xba
$16:c873  8c 02 41	  sty $4102
$16:c876  49 57		 eor #$57
$16:c878  9a			txs
$16:c879  54 b7 53	  mvn $53,$b7
$16:c87c  cf 9c e3 65   cmp $65e39c
$16:c880  7d db 40	  adc $40db,x
$16:c883  17 e4		 ora [$e4],y
$16:c885  a5 29		 lda $29
$16:c887  e7 0e		 sbc [$0e]
$16:c889  71 c7		 adc ($c7),y
$16:c88b  80 60		 bra $c8ed
$16:c88d  a4 12		 ldy $12
$16:c88f  0b			phd
$16:c890  82 b4 24	  brl $ed47
$16:c893  18			clc
$16:c894  06 a9		 asl $a9
$16:c896  8f 8a 40 6a   sta $6a408a
$16:c89a  0f 83 7c 1b   ora $1b7c83
$16:c89e  40			rti
$16:c89f  e5 21		 sbc $21
$16:c8a1  f1 41		 sbc ($41),y
$16:c8a3  e0 ae		 cpx #$ae
$16:c8a5  f0 83		 beq $c82a
$16:c8a7  1c c0 de	  trb $dec0
$16:c8aa  10 64		 bpl $c910
$16:c8ac  48			pha
$16:c8ad  13 00		 ora ($00,s),y
$16:c8af  7a			ply
$16:c8b0  27 40		 and [$40]
$16:c8b2  00 0c		 brk #$0c
$16:c8b4  08			php
$16:c8b5  7a			ply
$16:c8b6  10 60		 bpl $c918
$16:c8b8  40			rti
$16:c8b9  0f 8a e1 50   ora $50e18a
$16:c8bd  07 86		 ora [$86]
$16:c8bf  c3 a1		 cmp $a1,s
$16:c8c1  d0 88		 bne $c84b
$16:c8c3  74 26		 stz $26,x
$16:c8c5  0e 01 80	  asl $8001
$16:c8c8  4c 1c c1	  jmp $c11c
$16:c8cb  d0 0f		 bne $c8dc
$16:c8cd  84 03		 sty $03
$16:c8cf  a1 20		 lda ($20,x)
$16:c8d1  0e 84 c0	  asl $c084
$16:c8d4  50 03		 bvc $c8d9
$16:c8d6  e2 81		 sep #$81
$16:c8d8  9f c2 09 04   sta $0409c2,x
$16:c8dc  83 0c		 sta $0c,s
$16:c8de  c9 e0		 cmp #$e0
$16:c8e0  08			php
$16:c8e1  80 7d		 bra $c960
$16:c8e3  80 0c		 bra $c8f1
$16:c8e5  0e 40 3c	  asl $3c40
$16:c8e8  02 19		 cop #$19
$16:c8ea  3b			tsc
$16:c8eb  82 0c 3d	  brl $05fa
$16:c8ee  1b			tcs
$16:c8ef  05 43		 ora $43
$16:c8f1  41 90		 eor ($90,x)
$16:c8f3  c8			iny
$16:c8f4  6c 22 13	  jmp ($1322)
$16:c8f7  02 a8		 cop #$a8
$16:c8f9  04 03		 tsb $03
$16:c8fb  01 c0		 ora ($c0,x)
$16:c8fd  0d 80 7c	  ora $7c80
$16:c900  38			sec
$16:c901  06 00		 asl $00
$16:c903  f8			sed
$16:c904  18			clc
$16:c905  cb			wai
$16:c906  01 f0		 ora ($f0,x)
$16:c908  98			tya
$16:c909  06 c1		 asl $c1
$16:c90b  10 10		 bpl $c91d
$16:c90d  48			pha
$16:c90e  3c 11 0e	  bit $0e11,x
$16:c911  2f 80 25 88   and $882580
$16:c915  18			clc
$16:c916  60			rts
$16:c917  00 51		 brk #$51
$16:c919  1b			tcs
$16:c91a  81 ec		 sta ($ec,x)
$16:c91c  81 46		 sta ($46,x)
$16:c91e  dd 0e 04	  cmp $040e,x
$16:c921  43 e1		 eor $e1,s
$16:c923  10 70		 bpl $c995
$16:c925  07 00		 ora [$00]
$16:c927  30 06		 bmi $c92f
$16:c929  b1 98		 lda ($98),y
$16:c92b  07 04		 ora [$04]
$16:c92d  4a			lsr a
$16:c92e  25 50		 and $50
$16:c930  4d 92 6c	  eor $6c92
$16:c933  1d 47 20	  ora $2047,x
$16:c936  88			dey
$16:c937  42 27		 wdm #$27
$16:c939  12 f8		 ora ($f8)
$16:c93b  82 cc 25	  brl $ef0a
$16:c93e  11 08		 ora ($08),y
$16:c940  04 fd		 tsb $fd
$16:c942  72 14		 adc ($14)
$16:c944  08			php
$16:c945  04 82		 tsb $82
$16:c947  01 27		 ora ($27,x)
$16:c949  69 82		 adc #$82
$16:c94b  f8			sed
$16:c94c  58			cli
$16:c94d  a1 3f		 lda ($3f,x)
$16:c94f  64 94		 stz $94
$16:c951  02 11		 cop #$11
$16:c953  10 90		 bpl $c8e5
$16:c955  4e 3d 11	  lsr $113d
$16:c958  06 98		 asl $98
$16:c95a  2d c7 f0	  and $f0c7
$16:c95d  d9 08 23	  cmp $2308,y
$16:c960  38			sec
$16:c961  20 1c 88	  jsr $881c
$16:c964  43 7c		 eor $7c,s
$16:c966  1c 65 f8	  trb $f865
$16:c969  74 90		 stz $90,x
$16:c96b  f8			sed
$16:c96c  27 12		 and [$12]
$16:c96e  8a			txa
$16:c96f  24 42		 bit $42
$16:c971  a8			tay
$16:c972  ef 0a a5 11   sbc $11a50a
$16:c976  e0 0f		 cpx #$0f
$16:c978  00 77		 brk #$77
$16:c97a  0c e2 f9	  tsb $f9e2
$16:c97d  44 b6 51	  mvp $51,$b6
$16:c980  2f 8f f0 80   and $80f08f
$16:c984  2e 01 70	  rol $7001
$16:c987  03 e0		 ora $e0,s
$16:c989  88			dey
$16:c98a  03 c2		 ora $c2,s
$16:c98c  11 0c		 ora ($0c),y
$16:c98e  80 42		 bra $c9d2
$16:c990  a0 42		 ldy #$42
$16:c992  81 88		 sta ($88,x)
$16:c994  4e a3 52	  lsr $52a3
$16:c997  68			pla
$16:c998  a0 f8		 ldy #$f8
$16:c99a  23 01		 and $01,s
$16:c99c  21 09		 and ($09,x)
$16:c99e  84 38		 sty $38
$16:c9a0  4c 2d d2	  jmp $d22d
$16:c9a3  42 04		 wdm #$04
$16:c9a5  32 11		 and ($11)
$16:c9a7  1e 8c 40	  asl $408c,x
$16:c9aa  a0 04		 ldy #$04
$16:c9ac  c0 81		 cpy #$81
$16:c9ae  aa			tax
$16:c9af  52 1e		 eor ($1e)
$16:c9b1  3f 18 f8 fc   and $fcf818,x
$16:c9b5  cf 20 79 01   cmp $017920
$16:c9b9  a8			tay
$16:c9ba  2f 82 41 0c   and $0c4182
$16:c9be  86 47		 stx $47
$16:c9c0  0a			asl a
$16:c9c1  a3 80		 lda $80,s
$16:c9c3  6f 0e e0 b2   adc $b2e00e
$16:c9c7  0b			phd
$16:c9c8  d0 b0		 bne $c97a
$16:c9ca  09 06		 ora #$06
$16:c9cc  79 00 de	  adc $de00,y
$16:c9cf  40			rti
$16:c9d0  3b			tsc
$16:c9d1  10 0f		 bpl $c9e2
$16:c9d3  e4 03		 cpx $03
$16:c9d5  ff 1f 8e 40   sbc $408e1f,x
$16:c9d9  4a			lsr a
$16:c9da  a1 00		 lda ($00,x)
$16:c9dc  39 81 db	  and $db81,y
$16:c9df  cf cb 30 e9   cmp $e930cb
$16:c9e3  d4 7a		 pei ($7a)
$16:c9e5  71 0c		 adc ($0c),y
$16:c9e7  94 4b		 sty $4b,x
$16:c9e9  25 00		 and $00
$16:c9eb  c9 60		 cmp #$60
$16:c9ed  2f ff f8 05   and $05f8ff
$16:c9f1  fc 48 12	  jsr ($1248,x)
$16:c9f4  09 64		 ora #$64
$16:c9f6  02 da		 cop #$da
$16:c9f8  a2 33		 ldx #$33
$16:c9fa  f2 70		 sbc ($70)
$16:c9fc  e9 b4		 sbc #$b4
$16:c9fe  5a			phy
$16:c9ff  6d 06 92	  adc $9206
$16:ca02  b4 08		 ldy $08,x
$16:ca04  05 26		 ora $26
$16:ca06  03 fe		 ora $fe,s
$16:ca08  4d 87 f9	  eor $f987
$16:ca0b  1c 18 2d	  trb $2d18
$16:ca0e  94 03		 sty $03,x
$16:ca10  6c c2 33	  jmp ($33c2)
$16:ca13  f2 7e		 sbc ($7e)
$16:ca15  27 18		 and [$18]
$16:ca17  00 30		 brk #$30
$16:ca19  81 c1		 sta ($c1,x)
$16:ca1b  ad ee 29	  lda $29ee
$16:ca1e  80 8e		 bra $c9ae
$16:ca20  05 e6		 ora $e6
$16:ca22  22 f0 82 41   jsl $4182f0
$16:ca26  89 c2		 bit #$c2
$16:ca28  4f 01 c8 00   eor $00c801
$16:ca2c  c8			iny
$16:ca2d  94 10		 sty $10,x
$16:ca2f  48			pha
$16:ca30  1c 09 e6	  trb $e609
$16:ca33  0e 21 2c	  asl $2c21
$16:ca36  80 4c		 bra $ca84
$16:ca38  cc 01 40	  cpy $4001
$16:ca3b  e0 16		 cpx #$16
$16:ca3d  40			rti
$16:ca3e  20 a1 81	  jsr $81a1
$16:ca41  14 08		 trb $08
$16:ca43  78			sei
$16:ca44  9e 64 f5	  stz $f564,x
$16:ca47  18			clc
$16:ca48  20 dc 1f	  jsr $1fdc
$16:ca4b  a1 0f		 lda ($0f,x)
$16:ca4d  2d 80 c1	  and $c180
$16:ca50  41 21		 eor ($21,x)
$16:ca52  05 81		 ora $81
$16:ca54  03 50		 ora $50,s
$16:ca56  22 a1 a3 f0   jsl $f0a3a1
$16:ca5a  48			pha
$16:ca5b  04 3c		 tsb $3c
$16:ca5d  ef 30 60 03   sbc $036030
$16:ca61  40			rti
$16:ca62  ee 0f 43	  inc $430f
$16:ca65  71 1c		 adc ($1c),y
$16:ca67  0c e6 08	  tsb $08e6
$16:ca6a  61 01		 adc ($01,x)
$16:ca6c  19 39 05	  ora $0539,y
$16:ca6f  84 13		 sty $13
$16:ca71  42 73		 wdm #$73
$16:ca73  25 08		 and $08
$16:ca75  c6 5e		 dec $5e
$16:ca77  8c 85 be	  sty $be85
$16:ca7a  21 cf		 and ($cf,x)
$16:ca7c  a8			tay
$16:ca7d  61 ee		 adc ($ee,x)
$16:ca7f  17 78		 ora [$78],y
$16:ca81  7f ff 01 ff   adc $ff01ff,x
$16:ca85  80 4c		 bra $cad3
$16:ca87  20 05 e0	  jsr $e005
$16:ca8a  d0 30		 bne $cabc
$16:ca8c  07 7f		 ora [$7f]
$16:ca8e  30 d8		 bmi $ca68
$16:ca90  2f 05 c4 52   and $52c405
$16:ca94  c8			iny
$16:ca95  87 ba		 sta [$ba]
$16:ca97  21 e4		 and ($e4,x)
$16:ca99  8b			phb
$16:ca9a  68			pla
$16:ca9b  27 dd		 and [$dd]
$16:ca9d  ef 07 f2 01   sbc $01f207
$16:caa1  fe 80 46	  inc $4680,x
$16:caa4  20 10 a6	  jsr $a610
$16:caa7  f1 40		 sbc ($40),y
$16:caa9  bb			tyx
$16:caaa  51 a8		 eor ($a8),y
$16:caac  d4 01		 pei ($01)
$16:caae  ce 0e a6	  dec $a60e
$16:cab1  9c 44 25	  stz $2544
$16:cab4  19 29 45	  ora $4529,y
$16:cab7  f1 d4		 sbc ($d4),y
$16:cab9  e6 c1		 inc $c1
$16:cabb  c9 5b		 cmp #$5b
$16:cabd  2f 98 23 62   and $622398
$16:cac1  4b			phk
$16:cac2  a3 13		 lda $13,s
$16:cac4  c7 90		 cmp [$90]
$16:cac6  3e 68 3f	  rol $3f68,x
$16:cac9  e2 fd		 sep #$fd
$16:cacb  3d b9 b1	  and $b1b9,x
$16:cace  21 b0		 and ($b0,x)
$16:cad0  08			php
$16:cad1  3a			dec a
$16:cad2  31 8d		 and ($8d),y
$16:cad4  89 3f		 bit #$3f
$16:cad6  80 73		 bra $cb4b
$16:cad8  e0 17		 cpx #$17
$16:cada  f2 80		 sbc ($80)
$16:cadc  99 e6 2d	  sta $2de6,y
$16:cadf  14 92		 trb $92
$16:cae1  c8			iny
$16:cae2  af 77 4b f5   lda $f54b77
$16:cae6  e3 f9		 sbc $f9,s
$16:cae8  6c d6 5d	  jmp ($5dd6)
$16:caeb  0c e5 08	  tsb $08e5
$16:caee  80 47		 bra $cb37
$16:caf0  a0 50		 ldy #$50
$16:caf2  f8			sed
$16:caf3  21 44		 and ($44,x)
$16:caf5  88			dey
$16:caf6  00 a4		 brk #$a4
$16:caf8  1e 05 02	  asl $0205,x
$16:cafb  01 40		 ora ($40,x)
$16:cafd  90 70		 bcc $cb6f
$16:caff  36 1f		 rol $1f,x
$16:cb01  88			dey
$16:cb02  27 b2		 and [$b2]
$16:cb04  55 ca		 eor $ca,x
$16:cb06  a2 96		 ldx #$96
$16:cb08  09 1e		 ora #$1e
$16:cb0a  25 83		 and $83
$16:cb0c  88			dey
$16:cb0d  40			rti
$16:cb0e  27 90		 and [$90]
$16:cb10  42 c2		 wdm #$c2
$16:cb12  cf 22 94 ac   cmp $ac9422
$16:cb16  a6 27		 ldx $27
$16:cb18  2b			pld
$16:cb19  89 de		 bit #$de
$16:cb1b  ef 4b 0d 3c   sbc $3c0d4b
$16:cb1f  84 5f		 sty $5f
$16:cb21  99 03 42	  sta $4203,y
$16:cb24  5f ba dc 22   eor $22dcba,x
$16:cb28  ab			plb
$16:cb29  af 65 94 7e   lda $7e9465
$16:cb2d  31 0a		 and ($0a),y
$16:cb2f  87 42		 sta [$42]
$16:cb31  a0 d1		 ldy #$d1
$16:cb33  48			pha
$16:cb34  dc 32 37	  jml [$3732]
$16:cb37  08			php
$16:cb38  82 3c c2	  brl $8d77
$16:cb3b  17 07		 ora [$07],y
$16:cb3d  88			dey
$16:cb3e  44 20 d0	  mvp $d0,$20
$16:cb41  10 08		 bpl $cb4b
$16:cb43  40			rti
$16:cb44  e3 10		 sbc $10,s
$16:cb46  08			php
$16:cb47  dc 0e 0f	  jml [$0f0e]
$16:cb4a  01 28		 ora ($28,x)
$16:cb4c  84 1f		 sty $1f
$16:cb4e  c1 20		 cmp ($20,x)
$16:cb50  d0 58		 bne $cbaa
$16:cb52  34 1c		 bit $1c,x
$16:cb54  0a			asl a
$16:cb55  86 c2		 stx $c2
$16:cb57  c1 b0		 cmp ($b0,x)
$16:cb59  90 50		 bcc $cbab
$16:cb5b  02 60		 cop #$60
$16:cb5d  13 02		 ora ($02,s),y
$16:cb5f  e8			inx
$16:cb60  50 12		 bvc $cb74
$16:cb62  20 8e 09	  jsr $098e
$16:cb65  84 03		 sty $03
$16:cb67  60			rts
$16:cb68  22 11 50 c6   jsl $c65011
$16:cb6c  a3 d1		 lda $d1,s
$16:cb6e  57 b0		 eor [$b0],y
$16:cb70  c0 20		 cpy #$20
$16:cb72  8f d0 84 c1   sta $c184d0
$16:cb76  e1 90		 sbc ($90,x)
$16:cb78  38			sec
$16:cb79  1c 22 2d	  trb $2d22
$16:cb7c  11 02		 ora ($02),y
$16:cb7e  a1 94		 lda ($94,x)
$16:cb80  51 23		 eor ($23),y
$16:cb82  04 86		 tsb $86
$16:cb84  04 40		 tsb $40
$16:cb86  2a			rol a
$16:cb87  42 00		 wdm #$00
$16:cb89  09 82		 ora #$82
$16:cb8b  58			cli
$16:cb8c  2c 18 0c	  bit $0c18
$16:cb8f  00 64		 brk #$64
$16:cb91  0b			phd
$16:cb92  80 26		 bra $cbba
$16:cb94  71 20		 adc ($20),y
$16:cb96  50 2c		 bvc $cbc4
$16:cb98  10 38		 bpl $cbd2
$16:cb9a  74 02		 stz $02,x
$16:cb9c  19 06 85	  ora $8506,y
$16:cb9f  43 e1		 eor $e1,s
$16:cba1  0f 16 83 be   ora $be8316
$16:cba5  42 17		 wdm #$17
$16:cba7  0a			asl a
$16:cba8  84 a8		 sty $a8
$16:cbaa  40			rti
$16:cbab  02 d8		 cop #$d8
$16:cbad  0b			phd
$16:cbae  04 02		 tsb $02
$16:cbb0  c1 e0		 cmp ($e0,x)
$16:cbb2  c0 03		 cpy #$03
$16:cbb4  e0 ac		 cpx #$ac
$16:cbb6  05 60		 ora $60
$16:cbb8  c0 34		 cpy #$34
$16:cbba  c6 80		 dec $80
$16:cbbc  22 50 f8 3f   jsl $3ff850
$16:cbc0  c2 49		 rep #$49
$16:cbc2  20 95 d9	  jsr $d995
$16:cbc5  66 b7		 ror $b7
$16:cbc7  19 f5 fe	  ora $fef5,y
$16:cbca  39 3e 80	  and $803e,y
$16:cbcd  47 03		 eor [$03]
$16:cbcf  e1 0c		 sbc ($0c,x)
$16:cbd1  8e 47 a7	  stx $a747
$16:cbd4  d1 eb		 cmp ($eb),y
$16:cbd6  fc 3a ff	  jsr ($ff3a,x)
$16:cbd9  00 64		 brk #$64
$16:cbdb  02 f0		 cop #$f0
$16:cbdd  ea			nop
$16:cbde  93 8d		 sta ($8d,s),y
$16:cbe0  56 4a		 lsr $4a,x
$16:cbe2  a9 44		 lda #$44
$16:cbe4  be 4e 2f	  ldx $2f4e,y
$16:cbe7  90 06		 bcc $cbef
$16:cbe9  c8			iny
$16:cbea  4e 14 83	  lsr $8314
$16:cbed  38			sec
$16:cbee  c1 7f		 cmp ($7f,x)
$16:cbf0  a2 0d		 ldx #$0d
$16:cbf2  d2 73		 cmp ($73)
$16:cbf4  2c e2 21	  bit $21e2
$16:cbf7  54 94 5f	  mvn $5f,$94
$16:cbfa  1e 20 d6	  asl $d620,x
$16:cbfd  09 44		 ora #$44
$16:cbff  a2 70		 ldx #$70
$16:cc01  fa			plx
$16:cc02  29 c5		 and #$c5
$16:cc04  b2 88		 lda ($88)
$16:cc06  02 00		 cop #$00
$16:cc08  08			php
$16:cc09  3f c2 20 b0   and $b020c2,x
$16:cc0d  00 50		 brk #$50
$16:cc0f  a3 02		 lda $02,s
$16:cc11  08			php
$16:cc12  fb			xce
$16:cc13  06 c8		 asl $c8
$16:cc15  51 1d		 eor ($1d),y
$16:cc17  e2 ff		 sep #$ff
$16:cc19  07 d1		 ora [$d1]
$16:cc1b  36 82		 rol $82,x
$16:cc1d  70 02		 bvs $cc21
$16:cc1f  0b			phd
$16:cc20  e0 18		 cpx #$18
$16:cc22  55 e2		 eor $e2,x
$16:cc24  0a			asl a
$16:cc25  17 31		 ora [$31],y
$16:cc27  41 a0		 eor ($a0,x)
$16:cc29  d0 38		 bne $cc63
$16:cc2b  1c c2 61	  trb $61c2
$16:cc2e  20 90 40	  jsr $4090
$16:cc31  a0 43		 ldy #$43
$16:cc33  30 17		 bmi $cc4c
$16:cc35  24 02		 bit $02
$16:cc37  07 00		 ora [$00]
$16:cc39  99 c0 25	  sta $25c0,y
$16:cc3c  d0 08		 bne $cc46
$16:cc3e  b9 2c 54	  lda $542c,y
$16:cc41  83 05		 sta $05,s
$16:cc43  80 c4		 bra $cc09
$16:cc45  60			rts
$16:cc46  2d f0 b0	  and $b0f0
$16:cc49  48			pha
$16:cc4a  16 21		 asl $21,x
$16:cc4c  90 16		 bcc $cc64
$16:cc4e  94 fe		 sty $fe,x
$16:cc50  01 cf		 ora ($cf,x)
$16:cc52  80 67		 bra $ccbb
$16:cc54  e0 17		 cpx #$17
$16:cc56  88			dey
$16:cc57  07 86		 ora [$86]
$16:cc59  01 d0		 ora ($d0,x)
$16:cc5b  80 76		 bra $ccd3
$16:cc5d  2e d3 e8	  rol $e8d3
$16:cc60  ec f6 1f	  cpx $1ff6
$16:cc63  1e 87 c0	  asl $c087,x
$16:cc66  20 e4 51	  jsr $51e4
$16:cc69  2b			pld
$16:cc6a  01 ec		 ora ($ec,x)
$16:cc6c  a0 4e		 ldy #$4e
$16:cc6e  68			pla
$16:cc6f  52 0f		 eor ($0f)
$16:cc71  df d1 fd f8   cmp $f8fdd1,x
$16:cc75  fe 3b 15	  inc $153b,x
$16:cc78  8f 47 b6 fb   sta $fbb647
$16:cc7c  3b			tsc
$16:cc7d  bd 47 e7	  lda $e747,x
$16:cc80  91 e8		 sta ($e8),y
$16:cc82  04 7a		 tsb $7a
$16:cc84  11 0e		 ora ($0e),y
$16:cc86  3b			tsc
$16:cc87  09 dc		 ora #$dc
$16:cc89  10 21		 bpl $ccac
$16:cc8b  04 73		 tsb $73
$16:cc8d  1f fb fd ff   ora $fffdfb,x
$16:cc91  f3 d9		 sbc ($d9,s),y
$16:cc93  bf fb db f7   lda $f7dbfb,x
$16:cc97  0e 78 e6	  asl $e678
$16:cc9a  42 b0		 wdm #$b0
$16:cc9c  a0 ad		 ldy #$ad
$16:cc9e  5f ec 0d 82   eor $820dec,x
$16:cca2  42 e0		 wdm #$e0
$16:cca4  70 88		 bvs $cc2e
$16:cca6  5b			tcd
$16:cca7  c8			iny
$16:cca8  a1 84		 lda ($84,x)
$16:ccaa  60			rts
$16:ccab  3a			dec a
$16:ccac  84 30		 sty $30
$16:ccae  52 10		 eor ($10)
$16:ccb0  b8			clv
$16:ccb1  24 30		 bit $30
$16:ccb3  02 4f		 cop #$4f
$16:ccb5  c0 04		 cpy #$04
$16:ccb7  03 00		 ora $00,s
$16:ccb9  a8			tay
$16:ccba  1a			inc a
$16:ccbb  0c 04 83	  tsb $8304
$16:ccbe  40			rti
$16:ccbf  12 2b		 ora ($2b)
$16:ccc1  06 02		 asl $02
$16:ccc3  01 e0		 ora ($e0,x)
$16:ccc5  2c 03 f8	  bit $f803
$16:ccc8  34 14		 bit $14,x
$16:ccca  0b			phd
$16:cccb  00 84		 brk #$84
$16:cccd  8b			phb
$16:ccce  00 28		 brk #$28
$16:ccd0  06 01		 asl $01
$16:ccd2  3c 42 1f	  bit $1f42,x
$16:ccd5  08			php
$16:ccd6  23 04		 and $04,s
$16:ccd8  0d f0 10	  ora $10f0
$16:ccdb  c7 d9		 cmp [$d9]
$16:ccdd  3f 40 0a 30   and $300a40,x
$16:cce1  80 48		 bra $cd2b
$16:cce3  8e c9 80	  stx $80c9
$16:cce6  61 10		 adc ($10,x)
$16:cce8  f0 48		 beq $cd32
$16:ccea  03 21		 ora $21,s
$16:ccec  80 0c		 bra $ccfa
$16:ccee  05 80		 ora $80
$16:ccf0  36 42		 rol $42,x
$16:ccf2  60			rts
$16:ccf3  12 8c		 ora ($8c)
$16:ccf5  80 52		 bra $cd49
$16:ccf7  25 b2		 and $b2
$16:ccf9  60			rts
$16:ccfa  1c 22 09	  trb $0922
$16:ccfd  0a			asl a
$16:ccfe  83 42		 sta $42,s
$16:cd00  e0 ee		 cpx #$ee
$16:cd02  f0 7a		 beq $cd7e
$16:cd04  b4 0e		 ldy $0e,x
$16:cd06  0f 01 51 90   ora $905101
$16:cd0a  00 40		 brk #$40
$16:cd0c  e9 20		 sbc #$20
$16:cd0e  07 87		 ora [$87]
$16:cd10  01 22		 ora ($22,x)
$16:cd12  00 f0		 brk #$f0
$16:cd14  0a			asl a
$16:cd15  b6 03		 ldx $03,y
$16:cd17  81 00		 sta ($00,x)
$16:cd19  50 10		 bvc $cd2b
$16:cd1b  80 44		 bra $cd61
$16:cd1d  ec c2 59	  cpx $59c2
$16:cd20  fa			plx
$16:cd21  dc 54 21	  jml [$2154]
$16:cd24  90 58		 bcc $cd7e
$16:cd26  3b			tsc
$16:cd27  1c 8c 20	  trb $208c
$16:cd2a  e0 8f		 cpx #$8f
$16:cd2c  c3 5c		 cmp $5c,s
$16:cd2e  47 c1		 eor [$c1]
$16:cd30  10 68		 bpl $cd9a
$16:cd32  3b			tsc
$16:cd33  9c a0 10	  stz $10a0
$16:cd36  a8			tay
$16:cd37  04 e2		 tsb $e2
$16:cd39  50 ef		 bvc $cd2a
$16:cd3b  06 02		 asl $02
$16:cd3d  4e 22 1d	  lsr $1d22
$16:cd40  6d d5 13	  adc $13d5
$16:cd43  ac de 06	  ldy $06de
$16:cd46  f3 c0		 sbc ($c0,s),y
$16:cd48  35 4f		 and $4f,x
$16:cd4a  d0 79		 bne $cdc5
$16:cd4c  2c 42 71	  bit $7142
$16:cd4f  6c aa 5b	  jmp ($5baa)
$16:cd52  37 4a		 and [$4a],y
$16:cd54  d9 80 51	  cmp $5180,y
$16:cd57  30 4f		 bmi $cda8
$16:cd59  c0 25		 cpy #$25
$16:cd5b  94 3e		 sty $3e,x
$16:cd5d  1d 06 80	  ora $8006,x
$16:cd60  43 a0		 eor $a0,s
$16:cd62  10 68		 bpl $cdcc
$16:cd64  34 22		 bit $22,x
$16:cd66  01 13		 ora ($13,x)
$16:cd68  81 c4		 sta ($c4,x)
$16:cd6a  60			rts
$16:cd6b  22 31 97 9f   jsl $9f9731
$16:cd6f  04 fa		 tsb $fa
$16:cd71  12 e8		 ora ($e8)
$16:cd73  04 f9		 tsb $f9
$16:cd75  6e 33 98	  ror $9833
$16:cd78  04 ea		 tsb $ea
$16:cd7a  05 02		 ora $02
$16:cd7c  0d d0 8c	  ora $8cd0
$16:cd7f  74 4a		 stz $4a,x
$16:cd81  50 28		 bvc $cdab
$16:cd83  e5 fa		 sbc $fa
$16:cd85  01 42		 ora ($42,x)
$16:cd87  39 29 c4	  and $c429,y
$16:cd8a  0f 9e 6e f4   ora $f46e9e
$16:cd8e  f7 c0		 sbc [$c0],y
$16:cd90  20 30 18	  jsr $1830
$16:cd93  24 10		 bit $10
$16:cd95  66 0b		 ror $0b
$16:cd97  30 58		 bmi $cdf1
$16:cd99  82 ad 5b	  brl $2949
$16:cd9c  81 03		 sta ($03,x)
$16:cd9e  17 03		 ora [$03],y
$16:cda0  0c 17 48	  tsb $4817
$16:cda3  37 08		 and [$08],y
$16:cda5  44 52 39	  mvp $39,$52
$16:cda8  14 66		 trb $66
$16:cdaa  8b			phb
$16:cdab  5c 23 8c e1   jml $e18c23
$16:cdaf  66 8c		 ror $8c
$16:cdb1  51 c0		 eor ($c0),y
$16:cdb3  30 08		 bmi $cdbd
$16:cdb5  e3 44		 sbc $44,s
$16:cdb7  5b			tcd
$16:cdb8  66 a7		 ror $a7
$16:cdba  96 00		 stx $00,y
$16:cdbc  ca			dex
$16:cdbd  65 8a		 adc $8a
$16:cdbf  0c 88 4f	  tsb $4f88
$16:cdc2  1a			inc a
$16:cdc3  81 1a		 sta ($1a,x)
$16:cdc5  1f 85 82 91   ora $918285,x
$16:cdc9  c0 e4		 cpy #$e4
$16:cdcb  70 2a		 bvs $cdf7
$16:cdcd  01 60		 ora ($60,x)
$16:cdcf  94 6e		 sty $6e,x
$16:cdd1  38			sec
$16:cdd2  0e 60 9f	  asl $9f60
$16:cdd5  41 2f		 eor ($2f,x)
$16:cdd7  f0 0e		 beq $cde7
$16:cdd9  04 e0		 tsb $e0
$16:cddb  4a			lsr a
$16:cddc  52 88		 eor ($88)
$16:cdde  87 03		 sta [$03]
$16:cde0  80 aa		 bra $cd8c
$16:cde2  78			sei
$16:cde3  0c 0a 02	  tsb $020a
$16:cde6  c4 06		 cpy $06
$16:cde8  42 be		 wdm #$be
$16:cdea  0d 92 4b	  ora $4b92
$16:cded  10 94		 bpl $cd83
$16:cdef  40			rti
$16:cdf0  26 90		 rol $90
$16:cdf2  0a			asl a
$16:cdf3  f7 03		 sbc [$03],y
$16:cdf5  21 80		 and ($80,x)
$16:cdf7  2a			rol a
$16:cdf8  86 80		 stx $80
$16:cdfa  ac 15 0b	  ldy $0b15
$16:cdfd  86 02		 stx $02
$16:cdff  71 10		 adc ($10),y
$16:ce01  be 42 3f	  ldx $3f42,y
$16:ce04  d0 0c		 bne $ce12
$16:ce06  01 74		 ora ($74,x)
$16:ce08  0c c3 50	  tsb $50c3
$16:ce0b  90 60		 bcc $ce6d
$16:ce0d  30 08		 bmi $ce17
$16:ce0f  78			sei
$16:ce10  b8			clv
$16:ce11  dc 68 94	  jml [$9468]
$16:ce14  08			php
$16:ce15  8c c4 df	  sty $dfc4
$16:ce18  13 eb		 ora ($eb,s),y
$16:ce1a  fc ee f7	  jsr ($f7ee,x)
$16:ce1d  0e 9f c2	  asl $c29f
$16:ce20  a0 10		 ldy #$10
$16:ce22  c8			iny
$16:ce23  04 5e		 tsb $5e
$16:ce25  61 27		 adc ($27,x)
$16:ce27  b0 59		 bcs $ce82
$16:ce29  ac 1a 8b	  ldy $8b1a
$16:ce2c  07 92		 ora [$92]
$16:ce2e  29 dc		 and #$dc
$16:ce30  b0 43		 bcs $ce75
$16:ce32  a0 91		 ldy #$91
$16:ce34  e8			inx
$16:ce35  14 fe		 trb $fe
$16:ce37  01 63		 ora ($63,x)
$16:ce39  8e 58 a3	  stx $a358
$16:ce3c  96 06		 stx $06,y
$16:ce3e  98			tya
$16:ce3f  42 2c		 wdm #$2c
$16:ce41  16 0a		 asl $0a,x
$16:ce43  04 43		 tsb $43
$16:ce45  91 58		 sta ($58),y
$16:ce47  d3 d7		 cmp ($d7,s),y
$16:ce49  e9 f3		 sbc #$f3
$16:ce4b  0e 7e c3	  asl $c37e
$16:ce4e  9f 30 84 2e   sta $2e8430,x
$16:ce52  87 41		 sta [$41]
$16:ce54  00 d3		 brk #$d3
$16:ce56  c0 17		 cpy #$17
$16:ce58  e1 a0		 sbc ($a0,x)
$16:ce5a  90 31		 bcc $ce8d
$16:ce5c  9a			txs
$16:ce5d  0d 10 a2	  ora $a210
$16:ce60  5d b5 1d	  eor $1db5,x
$16:ce63  6f 34 63 c9   adc $c96334
$16:ce67  18			clc
$16:ce68  6a			ror a
$16:ce69  84 81		 sty $81
$16:ce6b  b4 28		 ldy $28,x
$16:ce6d  f0 c5		 beq $ce34
$16:ce6f  40			rti
$16:ce70  a1 4e		 lda ($4e,x)
$16:ce72  20 84 39	  jsr $3984
$16:ce75  41 d0		 eor ($d0,x)
$16:ce77  80 92		 bra $ce0b
$16:ce79  eb			xba
$16:ce7a  7f a2 1b a1   adc $a11ba2,x
$16:ce7e  50 3d		 bvc $cebd
$16:ce80  d0 64		 bne $cee6
$16:ce82  46 30		 lsr $30
$16:ce84  c1 51		 cmp ($51,x)
$16:ce86  22 10 00 3b   jsl $3b0010
$16:ce8a  0a			asl a
$16:ce8b  c2 71		 rep #$71
$16:ce8d  00 a2		 brk #$a2
$16:ce8f  51 27		 eor ($27),y
$16:ce91  13 8a		 ora ($8a,s),y
$16:ce93  04 a2		 tsb $a2
$16:ce95  81 68		 sta ($68,x)
$16:ce97  08			php
$16:ce98  00 4c		 brk #$4c
$16:ce9a  2f 91 0b e4   and $e40b91
$16:ce9e  00 26		 brk #$26
$16:cea0  04 30		 tsb $30
$16:cea2  a8			tay
$16:cea3  02 0c		 cop #$0c
$16:cea5  2e 1b ad	  rol $ad1b
$16:cea8  84 12		 sty $12
$16:ceaa  01 26		 ora ($26,x)
$16:ceac  81 0c		 sta ($0c,x)
$16:ceae  c2 41		 rep #$41
$16:ceb0  00 81		 brk #$81
$16:ceb2  40			rti
$16:ceb3  24 28		 bit $28
$16:ceb5  71 80		 adc ($80),y
$16:ceb7  6f a0 13 68   adc $6813a0
$16:cebb  05 d8		 ora $d8
$16:cebd  8a			txa
$16:cebe  36 68		 rol $68,x
$16:cec0  05 9c		 ora $9c
$16:cec2  96 27		 stx $27,y
$16:cec4  43 88		 eor $88,s
$16:cec6  01 c0		 ora ($c0,x)
$16:cec8  e8			inx
$16:cec9  7c 8e 41	  jmp ($418e,x)
$16:cecc  c5 4a		 cmp $4a
$16:cece  c9 c0 2e	  cmp #$2ec0
$16:ced1  00 9c		 brk #$9c
$16:ced3  2f d0 0a 11   and $110ad0
$16:ced7  c9 4e 20	  cmp #$204e
$16:ceda  7c f1 30	  jmp ($30f1,x)
$16:cedd  9c 7d 05	  stz $057d
$16:cee0  e9 3f 61	  sbc #$613f
$16:cee3  f3 b8		 sbc ($b8,s),y
$16:cee5  22 8e e0 86   jsl $86e08e
$16:cee9  34 c1		 bit $c1,x
$16:ceeb  ac 2d 07	  ldy $072d
$16:ceee  8e 39 c1	  stx $c139
$16:cef1  ac 30 88	  ldy $8830
$16:cef4  2c 12 af	  bit $af12
$16:cef7  44 d7 ea	  mvp $ea,$d7
$16:cefa  3b			tsc
$16:cefb  bd 69 0c	  lda $0c69,x
$16:cefe  90 4e		 bcc $cf4e
$16:cf00  10 18		 bpl $cf1a
$16:cf02  1c 82 4f	  trb $4f82
$16:cf05  38			sec
$16:cf06  9e 4a 2d	  stz $2d4a,x
$16:cf09  97 0f		 sta [$0f],y
$16:cf0b  c5 83		 cmp $83
$16:cf0d  ed c2 f3	  sbc $f3c2
$16:cf10  40			rti
$16:cf11  e0 70 08	  cpx #$0870
$16:cf14  1c 42 6f	  trb $6f42
$16:cf17  f0 8c		 beq $cea5
$16:cf19  66 37		 ror $37
$16:cf1b  1d 89 86	  ora $8689,x
$16:cf1e  e3 09		 sbc $09,s
$16:cf20  34 f2		 bit $f2,x
$16:cf22  79 20 91	  adc $9120,y
$16:cf25  8f e4 00 38   sta $3800e4
$16:cf29  10 0d		 bpl $cf38
$16:cf2b  05 02		 ora $02
$16:cf2d  61 10		 adc ($10,x)
$16:cf2f  a0 71 21	  ldy #$2171
$16:cf32  1e c8 c3	  asl $c3c8,x
$16:cf35  a0 3f 90	  ldy #$903f
$16:cf38  1f e8 28 60   ora $6028e8,x
$16:cf3c  35 3a		 and $3a,x
$16:cf3e  84 0e		 sty $0e
$16:cf40  13 26		 ora ($26,s),y
$16:cf42  84 c1		 sty $c1
$16:cf44  61 95		 adc ($95,x)
$16:cf46  0a			asl a
$16:cf47  ed 0a ae	  sbc $ae0a
$16:cf4a  f9 18 04	  sbc $0418,y
$16:cf4d  82 e1 70	  brl $4031
$16:cf50  bc d4 2b	  ldy $2bd4,x
$16:cf53  37 2b		 and [$2b],y
$16:cf55  f5 8a		 sbc $8a,x
$16:cf57  ff 60 bb fa   sbc $fabb60,x
$16:cf5b  27 13		 and [$13]
$16:cf5d  0b			phd
$16:cf5e  86 e2		 stx $e2
$16:cf60  91 69		 sta ($69),y
$16:cf62  84 dc		 sty $dc
$16:cf64  3b			tsc
$16:cf65  be 49 b4	  ldx $b449,y
$16:cf68  23 f5		 and $f5,s
$16:cf6a  00 e7		 brk #$e7
$16:cf6c  42 21		 wdm #$21
$16:cf6e  14 0c		 trb $0c
$16:cf70  05 06		 ora $06
$16:cf72  13 90		 ora ($90,s),y
$16:cf74  cc c0 3b	  cpy $3bc0
$16:cf77  b0 99		 bcs $cf12
$16:cf79  fc 17 ff	  jsr ($ff17,x)
$16:cf7c  01 e7		 ora ($e7,x)
$16:cf7e  c0 e1 c0	  cpy #$c0e1
$16:cf81  90 82		 bcc $cf05
$16:cf83  41 24		 eor ($24,x)
$16:cf85  92 48		 sta ($48)
$16:cf87  14 ba		 trb $ba
$16:cf89  13 1b		 ora ($1b,s),y
$16:cf8b  82 45 dc	  brl $abd3
$16:cf8e  e3 0e		 sbc $0e,s
$16:cf90  05 84		 ora $84
$16:cf92  8e 4f 03	  stx $034f
$16:cf95  93 c0		 sta ($c0,s),y
$16:cf97  65 f2		 adc $f2
$16:cf99  49 fc a2	  eor #$a2fc
$16:cf9c  7f 20 9e 7e   adc $7e9e20,x
$16:cfa0  23 1b		 and $1b,s
$16:cfa2  0b			phd
$16:cfa3  c7 a2		 cmp [$a2]
$16:cfa5  21 d0		 and ($d0,x)
$16:cfa7  a0 64 2c	  ldy #$2c64
$16:cfaa  1e 0c 84	  asl $840c,x
$16:cfad  03 e0		 ora $e0,s
$16:cfaf  9b			txy
$16:cfb0  18			clc
$16:cfb1  05 82		 ora $82
$16:cfb3  41 10		 eor ($10,x)
$16:cfb5  21 05		 and ($05,x)
$16:cfb7  81 40		 sta ($40,x)
$16:cfb9  10 04		 bpl $cfbf
$16:cfbb  d1 c2		 cmp ($c2),y
$16:cfbd  26 0a		 rol $0a
$16:cfbf  f3 9c		 sbc ($9c,s),y
$16:cfc1  41 e7		 eor ($e7,x)
$16:cfc3  f2 f8		 sbc ($f8)
$16:cfc5  84 a1		 sty $a1
$16:cfc7  46 11		 lsr $11
$16:cfc9  09 02 fc	  ora #$fc02
$16:cfcc  e4 eb		 cpx $eb
$16:cfce  f2 21		 sbc ($21)
$16:cfd0  03 28		 ora $28,s
$16:cfd2  a3 0c		 lda $0c,s
$16:cfd4  f3 9c		 sbc ($9c,s),y
$16:cfd6  70 3f		 bvs $d017
$16:cfd8  09 30 5d	  ora #$5d30
$16:cfdb  91 7c		 sta ($7c),y
$16:cfdd  1b			tcs
$16:cfde  e5 c8		 sbc $c8
$16:cfe0  6f 94 01 d2   adc $d20194
$16:cfe4  53 89		 eor ($89,s),y
$16:cfe6  43 b8		 eor $b8,s
$16:cfe8  20 14 49	  jsr $4914
$16:cfeb  45 f2		 eor $f2
$16:cfed  09 38 ae	  ora #$ae38
$16:cff0  40			rti
$16:cff1  2f 8f 11 51   and $51118f
$16:cff5  84 e2		 sty $e2
$16:cff7  71 7c		 adc ($7c),y
$16:cff9  a2 01 02	  ldx #$0201
$16:cffc  f8			sed
$16:cffd  01 01		 ora ($01,x)
$16:cfff  f8			sed
$16:d000  02 89		 cop #$89
$16:d002  e0 01 01	  cpx #$0101
$16:d005  c9 6e b5	  cmp #$b56e
$16:d008  4f b0 05 1a   eor $1a05b0
$16:d00c  f0 5f		 beq $d06d
$16:d00e  c3 aa		 cmp $aa,s
$16:d010  03 00		 ora $00,s
$16:d012  29 20 14	  and #$1420
$16:d015  1a			inc a
$16:d016  0e 87 02	  asl $0287
$16:d019  a3 01		 lda $01,s
$16:d01b  a3 3a		 lda $3a,s
$16:d01d  06 c7		 asl $c7
$16:d01f  00 d9		 brk #$d9
$16:d021  c0 26 30	  cpy #$3026
$16:d024  08			php
$16:d025  c1 fc		 cmp ($fc,x)
$16:d027  87 45		 sta [$45]
$16:d029  98			tya
$16:d02a  cc 64 32	  cpy $3264
$16:d02d  0a			asl a
$16:d02e  60			rts
$16:d02f  8a			txa
$16:d030  40			rti
$16:d031  20 2f e1	  jsr $e12f
$16:d034  05 1f		 ora $1f
$16:d036  69 36 3f	  adc #$3f36
$16:d039  c8			iny
$16:d03a  07 7e		 ora [$7e]
$16:d03c  01 67		 ora ($67,x)
$16:d03e  80 7e		 bra $d0be
$16:d040  20 11 f0	  jsr $f011
$16:d043  51 5f		 eor ($5f),y
$16:d045  a0 14 23	  ldy #$2314
$16:d048  92 9c		 sta ($9c)
$16:d04a  40			rti
$16:d04b  f9 e6 ef	  sbc $efe6,y
$16:d04e  4f 7a 43 d4   eor $d4437a
$16:d052  3e b2 f6	  rol $f6b2,x
$16:d055  f5 44		 sbc $44,x
$16:d057  23 b0		 and $b0,s
$16:d059  28			plp
$16:d05a  5c a6 47 f3   jml $f347a6
$16:d05e  8a			txa
$16:d05f  7e 61 33	  ror $3361,x
$16:d062  e8			inx
$16:d063  13 a4		 ora ($a4,s),y
$16:d065  a0 51 f8	  ldy #$f851
$16:d068  24 3e		 bit $3e
$16:d06a  29 37 84	  and #$8437
$16:d06d  47 20		 eor [$20]
$16:d06f  d0 f8		 bne $d069
$16:d071  09 28 a0	  ora #$a028
$16:d074  10 78		 bpl $d0ee
$16:d076  94 22		 sty $22,x
$16:d078  35 12		 and $12,x
$16:d07a  8d 7e 20	  sta $207e
$16:d07d  9f 28 84 3c   sta $3c8428,x
$16:d081  7c 03 a2	  jmp ($a203,x)
$16:d084  8d 41 23	  sta $2341
$16:d087  de 5f fc	  dec $fc5f,x
$16:d08a  0a			asl a
$16:d08b  0d 0c 8e	  ora $8e0c
$16:d08e  7c 0d 40	  jmp ($400d,x)
$16:d091  ec 19 04	  cpx $0419
$16:d094  8c ac 10	  sty $10ac
$16:d097  c8			iny
$16:d098  2c fa 02	  bit $02fa
$16:d09b  35 08		 and $08,x
$16:d09d  64 11		 stz $11
$16:d09f  d2 54		 cmp ($54)
$16:d0a1  0b			phd
$16:d0a2  19 58 20	  ora $2058,y
$16:d0a5  50 72		 bvc $d119
$16:d0a7  b0 82		 bcs $d02b
$16:d0a9  40			rti
$16:d0aa  88			dey
$16:d0ab  0e c1 80	  asl $80c1
$16:d0ae  e1 60		 sbc ($60,x)
$16:d0b0  90 88		 bcc $d03a
$16:d0b2  dd 8a ed	  cmp $ed8a,x
$16:d0b5  04 a7		 tsb $a7
$16:d0b7  62 27 f2	  per $c2e1
$16:d0ba  07 49		 ora [$49]
$16:d0bc  42 b1		 wdm #$b1
$16:d0be  fb			xce
$16:d0bf  2d d6 13	  and $13d6
$16:d0c2  cd 88 c6	  cmp $c688
$16:d0c5  4c 37 1c	  jmp $1c37
$16:d0c8  0f 00 ac e5   ora $e5ac00
$16:d0cc  10 08		 bpl $d0d6
$16:d0ce  25 da		 and $da
$16:d0d0  23 3b		 and $3b,s
$16:d0d2  84 4f		 sty $4f
$16:d0d4  20 97 f2	  jsr $f297
$16:d0d7  30 3b		 bmi $d114
$16:d0d9  06 29		 asl $29
$16:d0db  3c 89 c5	  bit $c589,x
$16:d0de  e1 11		 sbc ($11,x)
$16:d0e0  98			tya
$16:d0e1  24 30		 bit $30
$16:d0e3  92 27		 sta ($27)
$16:d0e5  a3 90		 lda $90,s
$16:d0e7  50 05		 bvc $d0ee
$16:d0e9  c1 0c		 cmp ($0c,x)
$16:d0eb  d4 67		 pei ($67)
$16:d0ed  e4 19		 cpx $19
$16:d0ef  fb			xce
$16:d0f0  04 32		 tsb $32
$16:d0f2  10 e9		 bpl $d0dd
$16:d0f4  3a			dec a
$16:d0f5  05 02		 ora $02
$16:d0f7  c1 50		 cmp ($50,x)
$16:d0f9  fc 28 42	  jsr ($4228,x)
$16:d0fc  01 60		 ora ($60,x)
$16:d0fe  14 a4		 trb $a4
$16:d100  02 71		 cop #$71
$16:d102  20 ac 58	  jsr $58ac
$16:d105  37 1e		 and [$1e],y
$16:d107  0a			asl a
$16:d108  de 1f f3	  dec $f31f,x
$16:d10b  a3 ff		 lda $ff,s
$16:d10d  71 67		 adc ($67),y
$16:d10f  d2 38		 cmp ($38)
$16:d111  14 e2		 trb $e2
$16:d113  71 78		 adc ($78),y
$16:d115  ac 76 33	  ldy $3376
$16:d118  19 f8 dc	  ora $dcf8,y
$16:d11b  62 31 1e	  per $ef4f
$16:d11e  64 0c		 stz $0c
$16:d120  e4 74		 cpx $74
$16:d122  6e c1 fe	  ror $fec1
$16:d125  35 83		 and $83,x
$16:d127  f1 f6		 sbc ($f6),y
$16:d129  fa			plx
$16:d12a  41 78		 eor ($78,x)
$16:d12c  11 f6		 ora ($f6),y
$16:d12e  83 3e		 sta $3e,s
$16:d130  82 1f 06	  brl $d752
$16:d133  8d c0 7e	  sta $7ec0
$16:d136  31 15		 and ($15),y
$16:d138  7c 69 7f	  jmp ($7f69,x)
$16:d13b  dc 15 e0	  jml [$e015]
$16:d13e  41 57		 eor ($57,x)
$16:d140  f5 1f		 sbc $1f,x
$16:d142  8c 4e 8b	  sty $8b4e
$16:d145  83 10		 sta $10,s
$16:d147  37 85		 and [$85],y
$16:d149  e3 81		 sbc $81,s
$16:d14b  74 c4		 stz $c4,x
$16:d14d  5b			tcd
$16:d14e  a9 50 fa	  lda #$fa50
$16:d151  9f 6e 04 9a   sta $9a046e,x
$16:d155  19 84 82	  ora $8284,y
$16:d158  a1 50		 lda ($50,x)
$16:d15a  cc 44 36	  cpy $3644
$16:d15d  52 2f		 eor ($2f)
$16:d15f  8c 06 48	  sty $4806
$16:d162  71 08		 adc ($08),y
$16:d164  04 1a		 tsb $1a
$16:d166  71 21		 adc ($21),y
$16:d168  ac d9 b7	  ldy $b7d9
$16:d16b  de 0a fe	  dec $fe0a,x
$16:d16e  0d 70 1f	  ora $1f70
$16:d171  a5 d8		 lda $d8
$16:d173  48			pha
$16:d174  60			rts
$16:d175  93 f9		 sta ($f9,s),y
$16:d177  c5 f9		 cmp $f9
$16:d179  84 39		 sty $39
$16:d17b  b8			clv
$16:d17c  dc 71 90	  jml [$9071]
$16:d17f  31 a8		 and ($a8),y
$16:d181  c4 e1		 cpy $e1
$16:d183  ce 0d 06	  dec $060d
$16:d186  ff 7c bf 7f   sbc $7fbf7c,x
$16:d18a  28			plp
$16:d18b  50 74		 bvc $d201
$16:d18d  9c 2b 02	  stz $022b
$16:d190  82 c0 60	  brl $3253
$16:d193  a2 c1 4e	  ldx #$4ec1
$16:d196  04 22		 tsb $22
$16:d198  11 10		 ora ($10),y
$16:d19a  88			dey
$16:d19b  48			pha
$16:d19c  64 10		 stz $10
$16:d19e  18			clc
$16:d19f  0c 2a 14	  tsb $142a
$16:d1a2  73 08		 adc ($08,s),y
$16:d1a4  20 b4 21	  jsr $21b4
$16:d1a7  e7 21		 sbc [$21]
$16:d1a9  80 c8		 bra $d173
$16:d1ab  20 70 18	  jsr $1870
$16:d1ae  14 2a		 trb $2a
$16:d1b0  08			php
$16:d1b1  7c 18 86	  jmp ($8618,x)
$16:d1b4  07 02		 ora [$02]
$16:d1b6  7d 0a 84	  adc $840a,x
$16:d1b9  43 81		 eor $81,s
$16:d1bb  c0 67 ac	  cpy #$ac67
$16:d1be  03 03		 ora $03,s
$16:d1c0  06 82		 asl $82
$16:d1c2  4e 22 1e	  lsr $1e22
$16:d1c5  04 b3		 tsb $b3
$16:d1c7  a5 cc		 lda $cc
$16:d1c9  e6 09		 inc $09
$16:d1cb  70 8c		 bvs $d159
$16:d1cd  1c 42 10	  trb $1042
$16:d1d0  7d 08 d4	  adc $d408,x
$16:d1d3  49 2e 32	  eor #$322e
$16:d1d6  00 88		 brk #$88
$16:d1d8  40			rti
$16:d1d9  2e 10 8a	  rol $8a10
$16:d1dc  84 23		 sty $23
$16:d1de  21 04		 and ($04,x)
$16:d1e0  8c 44 a1	  sty $a144
$16:d1e3  8a			txa
$16:d1e4  6b			rtl
$16:d1e5  6d fa 5d	  adc $5dfa
$16:d1e8  2f ee 2e ff   and $ff2eee
$16:d1ec  a9 a8 ee	  lda #$eea8
$16:d1ef  00 40		 brk #$40
$16:d1f1  33 80		 and ($80,s),y
$16:d1f3  1e 40 43	  asl $4340,x
$16:d1f6  02 10		 cop #$10
$16:d1f8  8a			txa
$16:d1f9  5d a8 10	  eor $10a8,x
$16:d1fc  0e 00 c0	  asl $c000
$16:d1ff  70 18		 bvs $d219
$16:d201  01 54		 ora ($54,x)
$16:d203  90 87		 bcc $d18c
$16:d205  00 31		 brk #$31
$16:d207  05 33		 ora $33
$16:d209  9b			txy
$16:d20a  40			rti
$16:d20b  da			phx
$16:d20c  10 68		 bpl $d276
$16:d20e  12 80		 ora ($80)
$16:d210  02 ce		 cop #$ce
$16:d212  53 18		 eor ($18,s),y
$16:d214  11 f4		 ora ($f4),y
$16:d216  02 c0		 cop #$c0
$16:d218  16 94		 asl $94,x
$16:d21a  b9 c6 0f	  lda $0fc6,y
$16:d21d  62 71 a4	  per $7691
$16:d220  58			cli
$16:d221  ba			tsx
$16:d222  d9 d6 50	  cmp $50d6,y
$16:d225  68			pla
$16:d226  c4 16		 cpy $16
$16:d228  34 91		 bit $91,x
$16:d22a  98			tya
$16:d22b  04 7e		 tsb $7e
$16:d22d  31 1f		 and ($1f),y
$16:d22f  8d 51 64	  sta $6451
$16:d232  ba			tsx
$16:d233  3b			tsc
$16:d234  34 97		 bit $97,x
$16:d236  4d 48 bd	  eor $bd48
$16:d239  d0 31		 bne $d26c
$16:d23b  90 2c		 bcc $d269
$16:d23d  37 3e		 and [$3e],y
$16:d23f  91 78		 sta ($78),y
$16:d241  98			tya
$16:d242  5f 24 5d ea   eor $ea5d24,x
$16:d246  07 7b		 ora [$7b]
$16:d248  01 b7		 ora ($b7,x)
$16:d24a  99 de e1	  sta $e1de,y
$16:d24d  17 98		 ora [$98],y
$16:d24f  04 c1		 tsb $c1
$16:d251  d6 32		 dec $32,x
$16:d253  19 a4 5e	  ora $5ea4,y
$16:d256  33 ee		 and ($ee,s),y
$16:d258  8f c0 bf a6   sta $a6bfc0
$16:d25c  b1 80		 lda ($80),y
$16:d25e  fc 05 23	  jsr ($2305,x)
$16:d261  db			stp
$16:d262  88			dey
$16:d263  43 a1		 eor $a1,s
$16:d265  02 90		 cop #$90
$16:d267  fe 7f 3f	  inc $3f7f,x
$16:d26a  d0 2f		 bne $d29b
$16:d26c  fc 06 1e	  jsr ($1e06,x)
$16:d26f  29 1a 1c	  and #$1c1a
$16:d272  8b			phb
$16:d273  4b			phk
$16:d274  64 91		 stz $91
$16:d276  ad 26 f1	  lda $f126
$16:d279  24 ee		 bit $ee
$16:d27b  50 98		 bvc $d215
$16:d27d  75 02		 adc $02,x
$16:d27f  84 5c		 sty $5c
$16:d281  a1 1f		 lda ($1f,x)
$16:d283  28			plp
$16:d284  44 0b f8	  mvp $f8,$0b
$16:d287  d7 62		 cmp [$62],y
$16:d289  99 15 41	  sta $4115,y
$16:d28c  cb			wai
$16:d28d  32 6d		 and ($6d)
$16:d28f  0d 8a 4b	  ora $4b8a
$16:d292  a4 5a		 ldy $5a
$16:d294  c5 fa		 cmp $fa
$16:d296  41 da		 eor ($da,x)
$16:d298  a2 77 30	  ldx #$3077
$16:d29b  40			rti
$16:d29c  5a			phy
$16:d29d  27 98		 and [$98]
$16:d29f  5b			tcd
$16:d2a0  dc ec 83	  jml [$83ec]
$16:d2a3  2e 05 01	  rol $0105
$16:d2a6  26 98		 rol $98
$16:d2a8  0c 05 00	  tsb $0005
$16:d2ab  e8			inx
$16:d2ac  16 03		 asl $03,x
$16:d2ae  90 e0		 bcc $d290
$16:d2b0  0f 40 85 24   ora $248540
$16:d2b4  20 1d 15	  jsr $151d
$16:d2b7  27 e9		 and [$e9]
$16:d2b9  e8			inx
$16:d2ba  0f 84 22 11   ora $112284
$16:d2be  03 2c		 ora $2c,s
$16:d2c0  02 78		 cop #$78
$16:d2c2  e0 70 34	  cpx #$3470
$16:d2c5  f0 e3		 beq $d2aa
$16:d2c7  a1 18		 lda ($18,x)
$16:d2c9  78			sei
$16:d2ca  17 05		 ora [$05],y
$16:d2cc  18			clc
$16:d2cd  28			plp
$16:d2ce  00 98		 brk #$98
$16:d2d0  40			rti
$16:d2d1  e1 89		 sbc ($89,x)
$16:d2d3  e8			inx
$16:d2d4  94 42		 sty $42,x
$16:d2d6  22 11 0a 25   jsl $250a11
$16:d2da  11 3c		 ora ($3c),y
$16:d2dc  a8			tay
$16:d2dd  40			rti
$16:d2de  e0 42 2e	  cpx #$2e42
$16:d2e1  11 08		 ora ($08),y
$16:d2e3  75 12		 adc $12,x
$16:d2e5  70 9e		 bvs $d285
$16:d2e7  00 2a		 brk #$2a
$16:d2e9  00 4e		 brk #$4e
$16:d2eb  2e 0d ff	  rol $ff0d
$16:d2ee  e0 b8 03	  cpx #$03b8
$16:d2f1  c0 0e ff	  cpy #$ff0e
$16:d2f4  e0 b8 01	  cpx #$01b8
$16:d2f7  80 0f		 bra $d308
$16:d2f9  ff e8 b8 03   sbc $03b8e8,x
$16:d2fd  d0 10		 bne $d30f
$16:d2ff  ff e0 b8 03   sbc $03b8e0,x
$16:d303  d4 11		 pei ($11)
$16:d305  ff e0 b8 06   sbc $06b8e0,x
$16:d309  15 12		 ora $12,x
$16:d30b  ff e0 b8 07   sbc $07b8e0,x
$16:d30f  a8			tay
$16:d310  13 ff		 ora ($ff,s),y
$16:d312  e0 b8 07	  cpx #$07b8
$16:d315  a8			tay
$16:d316  18			clc
$16:d317  00 00		 brk #$00
$16:d319  2f 32 65 7f   and $7f6532
$16:d31d  98			tya
$16:d31e  b2 cb		 lda ($cb)
$16:d320  e5 fc		 sbc $fc
$16:d322  19 32 4c	  ora $4c32,y
$16:d325  65 72		 adc $72
$16:d327  7f 8c 98 a5   adc $a5988c,x
$16:d32b  b2 bf		 lda ($bf)
$16:d32d  cb			wai
$16:d32e  d8			cld
$16:d32f  e5 f2		 sbc $f2
$16:d331  fc b4 13	  jsr ($13b4,x)
$16:d334  00 10		 brk #$10
$16:d336  02 10		 cop #$10
$16:d338  0a			asl a
$16:d339  10 ff		 bpl $d33a
$16:d33b  00 02		 brk #$02
$16:d33d  10 00		 bpl $d33f
$16:d33f  00 1a		 brk #$1a
$16:d341  10 f9		 bpl $d33c
$16:d343  12 c5		 ora ($c5)
$16:d345  14 9e		 trb $9e
$16:d347  17 ff		 ora [$ff],y
$16:d349  18			clc
$16:d34a  b4 1b		 ldy $1b,x
$16:d34c  15 1e		 ora $1e,x
$16:d34e  e8			inx
$16:d34f  20 fa 04	  jsr $04fa
$16:d352  ea			nop
$16:d353  00 e0		 brk #$e0
$16:d355  00 e7		 brk #$e7
$16:d357  23 ed		 and $ed,s
$16:d359  a0 e5 fa	  ldy #$fae5
$16:d35c  e1 0b		 sbc ($0b,x)
$16:d35e  f5 80		 sbc $80,x
$16:d360  7f 7f f7 03   adc $03f77f,x
$16:d364  aa			tax
$16:d365  00 e3		 brk #$e3
$16:d367  30 46		 bmi $d3af
$16:d369  40			rti
$16:d36a  0c 5f 98	  tsb $985f
$16:d36d  0c 5d 9e	  tsb $9e5d
$16:d370  a1 a7		 lda ($a7,x)
$16:d372  a1 98		 lda ($98,x)
$16:d374  9f a2 a8 a2   sta $a2a8a2,x
$16:d378  9f 0c 5f 98   sta $985f0c,x
$16:d37c  0c 5d 9e	  tsb $9e5d
$16:d37f  a1 a7		 lda ($a7,x)
$16:d381  a1 98		 lda ($98,x)
$16:d383  9f a2 0c 5b   sta $5b0ca2,x
$16:d387  a8			tay
$16:d388  0c 59 ae	  tsb $ae59
$16:d38b  0c 57 b4	  tsb $b457
$16:d38e  ea			nop
$16:d38f  ff 0c 5f 98   sbc $985f0c,x
$16:d393  0c 5d 9e	  tsb $9e5d
$16:d396  a1 a7		 lda ($a7,x)
$16:d398  a1 98		 lda ($98,x)
$16:d39a  9f a2 a8 a2   sta $a2a8a2,x
$16:d39e  9f 0c 5f a4   sta $a45f0c,x
$16:d3a2  0c 5d aa	  tsb $aa5d
$16:d3a5  ad b3 ad	  lda $adb3
$16:d3a8  a4 ab		 ldy $ab
$16:d3aa  ae 0c 5b	  ldx $5b0c
$16:d3ad  b4 0c		 ldy $0c,x
$16:d3af  59 ba 0c	  eor $0cba,y
$16:d3b2  57 c0		 eor [$c0],y
$16:d3b4  ea			nop
$16:d3b5  00 ea		 brk #$ea
$16:d3b7  05 0c		 ora $0c
$16:d3b9  5f 98 0c 5d   eor $5d0c98,x
$16:d3bd  9e a1 a7	  stz $a7a1,x
$16:d3c0  a1 98		 lda ($98,x)
$16:d3c2  9f a2 a8 a2   sta $a2a8a2,x
$16:d3c6  9f 0c 5f a4   sta $a45f0c,x
$16:d3ca  0c 5d aa	  tsb $aa5d
$16:d3cd  ad b3 ad	  lda $adb3
$16:d3d0  a4 ab		 ldy $ab
$16:d3d2  ae 0c 5b	  ldx $5b0c
$16:d3d5  b4 0c		 ldy $0c,x
$16:d3d7  59 ba 0c	  eor $0cba,y
$16:d3da  57 c0		 eor [$c0],y
$16:d3dc  ea			nop
$16:d3dd  00 ea		 brk #$ea
$16:d3df  06 0c		 asl $0c
$16:d3e1  5f 98 0c 5d   eor $5d0c98,x
$16:d3e5  9e a1 a7	  stz $a7a1,x
$16:d3e8  a1 98		 lda ($98,x)
$16:d3ea  9f a2 a8 a2   sta $a2a8a2,x
$16:d3ee  9f 0c 5f a4   sta $a45f0c,x
$16:d3f2  0c 5d aa	  tsb $aa5d
$16:d3f5  ad b3 ad	  lda $adb3
$16:d3f8  a4 ab		 ldy $ab
$16:d3fa  ae 0c 5b	  ldx $5b0c
$16:d3fd  b4 0c		 ldy $0c,x
$16:d3ff  59 ba 0c	  eor $0cba,y
$16:d402  57 c0		 eor [$c0],y
$16:d404  ea			nop
$16:d405  00 ea		 brk #$ea
$16:d407  fe 0c 5f	  inc $5f0c,x
$16:d40a  98			tya
$16:d40b  0c 5d 9e	  tsb $9e5d
$16:d40e  a1 a7		 lda ($a7,x)
$16:d410  a1 98		 lda ($98,x)
$16:d412  9f a2 a8 a2   sta $a2a8a2,x
$16:d416  9f 0c 5f a4   sta $a45f0c,x
$16:d41a  0c 5d aa	  tsb $aa5d
$16:d41d  ad b3 ad	  lda $adb3
$16:d420  a4 ab		 ldy $ab
$16:d422  ae 0c 5b	  ldx $5b0c
$16:d425  b4 0c		 ldy $0c,x
$16:d427  59 ba 0c	  eor $0cba,y
$16:d42a  57 c0		 eor [$c0],y
$16:d42c  ea			nop
$16:d42d  00 ea		 brk #$ea
$16:d42f  fd 0c 5f	  sbc $5f0c,x
$16:d432  98			tya
$16:d433  0c 5d 9e	  tsb $9e5d
$16:d436  a1 a7		 lda ($a7,x)
$16:d438  a1 98		 lda ($98,x)
$16:d43a  9f a2 a8 a2   sta $a2a8a2,x
$16:d43e  9f 0c 5f a4   sta $a45f0c,x
$16:d442  0c 5d aa	  tsb $aa5d
$16:d445  ad b3 ad	  lda $adb3
$16:d448  a4 ab		 ldy $ab
$16:d44a  ae 0c 5b	  ldx $5b0c
$16:d44d  b4 0c		 ldy $0c,x
$16:d44f  59 ba 0c	  eor $0cba,y
$16:d452  57 c0		 eor [$c0],y
$16:d454  ea			nop
$16:d455  00 ea		 brk #$ea
$16:d457  ff 0c 5f 98   sbc $985f0c,x
$16:d45b  0c 5d 9e	  tsb $9e5d
$16:d45e  a1 a7		 lda ($a7,x)
$16:d460  a1 98		 lda ($98,x)
$16:d462  9f a2 a8 a2   sta $a2a8a2,x
$16:d466  9f 0c 5f a4   sta $a45f0c,x
$16:d46a  0c 5d aa	  tsb $aa5d
$16:d46d  ad b3 ad	  lda $adb3
$16:d470  a4 ab		 ldy $ab
$16:d472  ae 0c 5b	  ldx $5b0c
$16:d475  b4 0c		 ldy $0c,x
$16:d477  59 ba 0c	  eor $0cba,y
$16:d47a  57 c0		 eor [$c0],y
$16:d47c  ea			nop
$16:d47d  00 ea		 brk #$ea
$16:d47f  03 0c		 ora $0c,s
$16:d481  5f 98 0c 5d   eor $5d0c98,x
$16:d485  9e a1 a7	  stz $a7a1,x
$16:d488  a1 98		 lda ($98,x)
$16:d48a  9f a2 a8 a2   sta $a2a8a2,x
$16:d48e  9f 0c 5f a4   sta $a45f0c,x
$16:d492  0c 5d aa	  tsb $aa5d
$16:d495  ad b3 ad	  lda $adb3
$16:d498  a4 ab		 ldy $ab
$16:d49a  ae 0c 5b	  ldx $5b0c
$16:d49d  b4 0c		 ldy $0c,x
$16:d49f  59 ba 0c	  eor $0cba,y
$16:d4a2  57 c0		 eor [$c0],y
$16:d4a4  ea			nop
$16:d4a5  00 0c		 brk #$0c
$16:d4a7  5f 98 0c 5d   eor $5d0c98,x
$16:d4ab  9e a1 a7	  stz $a7a1,x
$16:d4ae  a1 98		 lda ($98,x)
$16:d4b0  9f a2 a8 a2   sta $a2a8a2,x
$16:d4b4  9f 0c 5f a4   sta $a45f0c,x
$16:d4b8  0c 5d aa	  tsb $aa5d
$16:d4bb  ad b3 ad	  lda $adb3
$16:d4be  a4 ab		 ldy $ab
$16:d4c0  ae 0c 5b	  ldx $5b0c
$16:d4c3  b4 0c		 ldy $0c,x
$16:d4c5  59 ba 0c	  eor $0cba,y
$16:d4c8  57 c0		 eor [$c0],y
$16:d4ca  ea			nop
$16:d4cb  00 ea		 brk #$ea
$16:d4cd  ff 0c 5f 98   sbc $985f0c,x
$16:d4d1  0c 5d 9e	  tsb $9e5d
$16:d4d4  a1 a7		 lda ($a7,x)
$16:d4d6  a1 98		 lda ($98,x)
$16:d4d8  9f a2 a8 a2   sta $a2a8a2,x
$16:d4dc  9f 0c 5f a4   sta $a45f0c,x
$16:d4e0  0c 5d aa	  tsb $aa5d
$16:d4e3  ad b3 ad	  lda $adb3
$16:d4e6  a4 ab		 ldy $ab
$16:d4e8  ae 0c 5b	  ldx $5b0c
$16:d4eb  b4 0c		 ldy $0c,x
$16:d4ed  59 ba 0c	  eor $0cba,y
$16:d4f0  57 c0		 eor [$c0],y
$16:d4f2  ea			nop
$16:d4f3  00 ea		 brk #$ea
$16:d4f5  05 0c		 ora $0c
$16:d4f7  5f 98 0c 5d   eor $5d0c98,x
$16:d4fb  9e a1 a7	  stz $a7a1,x
$16:d4fe  a1 98		 lda ($98,x)
$16:d500  9f a2 a8 a2   sta $a2a8a2,x
$16:d504  9f 0c 5f a4   sta $a45f0c,x
$16:d508  0c 5d aa	  tsb $aa5d
$16:d50b  ad b3 ad	  lda $adb3
$16:d50e  a4 ab		 ldy $ab
$16:d510  ae 0c 5b	  ldx $5b0c
$16:d513  b4 0c		 ldy $0c,x
$16:d515  59 ba 0c	  eor $0cba,y
$16:d518  57 c0		 eor [$c0],y
$16:d51a  ea			nop
$16:d51b  00 ea		 brk #$ea
$16:d51d  06 0c		 asl $0c
$16:d51f  5f 98 0c 5d   eor $5d0c98,x
$16:d523  9e a1 a7	  stz $a7a1,x
$16:d526  a1 98		 lda ($98,x)
$16:d528  9f a2 a8 a2   sta $a2a8a2,x
$16:d52c  9f 0c 5f a4   sta $a45f0c,x
$16:d530  0c 5d aa	  tsb $aa5d
$16:d533  ad b3 ad	  lda $adb3
$16:d536  a4 ab		 ldy $ab
$16:d538  ae 0c 5b	  ldx $5b0c
$16:d53b  b4 0c		 ldy $0c,x
$16:d53d  59 ba 0c	  eor $0cba,y
$16:d540  57 c0		 eor [$c0],y
$16:d542  ea			nop
$16:d543  00 ea		 brk #$ea
$16:d545  fe 0c 5f	  inc $5f0c,x
$16:d548  98			tya
$16:d549  0c 5d 9e	  tsb $9e5d
$16:d54c  a1 a7		 lda ($a7,x)
$16:d54e  a1 98		 lda ($98,x)
$16:d550  9f a2 a8 a2   sta $a2a8a2,x
$16:d554  9f 0c 5f a4   sta $a45f0c,x
$16:d558  0c 5d aa	  tsb $aa5d
$16:d55b  ad b3 ad	  lda $adb3
$16:d55e  a4 ab		 ldy $ab
$16:d560  ae b4 ba	  ldx $bab4
$16:d563  c0 ea 00	  cpy #$00ea
$16:d566  ea			nop
$16:d567  fd 0c 5f	  sbc $5f0c,x
$16:d56a  98			tya
$16:d56b  0c 5d 9e	  tsb $9e5d
$16:d56e  a1 a7		 lda ($a7,x)
$16:d570  a1 98		 lda ($98,x)
$16:d572  9f a2 a8 a2   sta $a2a8a2,x
$16:d576  9f 0c 5f a4   sta $a45f0c,x
$16:d57a  0c 5d aa	  tsb $aa5d
$16:d57d  ad b3 ad	  lda $adb3
$16:d580  a4 ab		 ldy $ab
$16:d582  ae 0c 5b	  ldx $5b0c
$16:d585  b4 0c		 ldy $0c,x
$16:d587  59 ba 0c	  eor $0cba,y
$16:d58a  57 c0		 eor [$c0],y
$16:d58c  ea			nop
$16:d58d  00 ea		 brk #$ea
$16:d58f  ff 0c 5f 98   sbc $985f0c,x
$16:d593  0c 5d 9e	  tsb $9e5d
$16:d596  a1 a7		 lda ($a7,x)
$16:d598  a1 98		 lda ($98,x)
$16:d59a  9f a2 a8 a2   sta $a2a8a2,x
$16:d59e  9f 0c 5f a4   sta $a45f0c,x
$16:d5a2  0c 5d aa	  tsb $aa5d
$16:d5a5  ad b3 ad	  lda $adb3
$16:d5a8  a4 ab		 ldy $ab
$16:d5aa  ae 0c 5b	  ldx $5b0c
$16:d5ad  b4 0c		 ldy $0c,x
$16:d5af  59 ba 0c	  eor $0cba,y
$16:d5b2  57 c0		 eor [$c0],y
$16:d5b4  ea			nop
$16:d5b5  00 ea		 brk #$ea
$16:d5b7  03 0c		 ora $0c,s
$16:d5b9  5f 98 0c 5d   eor $5d0c98,x
$16:d5bd  9e a1 a7	  stz $a7a1,x
$16:d5c0  a1 98		 lda ($98,x)
$16:d5c2  9f a2 a8 a2   sta $a2a8a2,x
$16:d5c6  9f 0c 5f a4   sta $a45f0c,x
$16:d5ca  0c 5d aa	  tsb $aa5d
$16:d5cd  ad b3 ad	  lda $adb3
$16:d5d0  a4 ab		 ldy $ab
$16:d5d2  ae 0c 5b	  ldx $5b0c
$16:d5d5  b4 0c		 ldy $0c,x
$16:d5d7  59 ba 0c	  eor $0cba,y
$16:d5da  57 c0		 eor [$c0],y
$16:d5dc  ea			nop
$16:d5dd  00 ea		 brk #$ea
$16:d5df  07 0c		 ora [$0c]
$16:d5e1  5f 98 0c 5d   eor $5d0c98,x
$16:d5e5  9e a1 a7	  stz $a7a1,x
$16:d5e8  a1 98		 lda ($98,x)
$16:d5ea  9f a2 a8 a2   sta $a2a8a2,x
$16:d5ee  9f 0c 5f a4   sta $a45f0c,x
$16:d5f2  0c 5d aa	  tsb $aa5d
$16:d5f5  ad b3 ad	  lda $adb3
$16:d5f8  a4 ab		 ldy $ab
$16:d5fa  ae 0c 5b	  ldx $5b0c
$16:d5fd  b4 0c		 ldy $0c,x
$16:d5ff  59 ba 0c	  eor $0cba,y
$16:d602  57 c0		 eor [$c0],y
$16:d604  ea			nop
$16:d605  00 ea		 brk #$ea
$16:d607  06 0c		 asl $0c
$16:d609  5f 98 0c 5d   eor $5d0c98,x
$16:d60d  9e a1 a7	  stz $a7a1,x
$16:d610  a1 98		 lda ($98,x)
$16:d612  9f a2 a8 a2   sta $a2a8a2,x
$16:d616  9f 0c 5f a4   sta $a45f0c,x
$16:d61a  0c 5d aa	  tsb $aa5d
$16:d61d  ad b3 ad	  lda $adb3
$16:d620  a4 ab		 ldy $ab
$16:d622  ae 0c 5b	  ldx $5b0c
$16:d625  b4 0c		 ldy $0c,x
$16:d627  59 ba 0c	  eor $0cba,y
$16:d62a  57 c0		 eor [$c0],y
$16:d62c  ea			nop
$16:d62d  00 00		 brk #$00
$16:d62f  ea			nop
$16:d630  00 e0		 brk #$e0
$16:d632  02 ed		 cop #$ed
$16:d634  b4 e1		 ldy $e1,x
$16:d636  0a			asl a
$16:d637  e3 30		 sbc $30,s
$16:d639  46 40		 lsr $40
$16:d63b  18			clc
$16:d63c  c9 24 5d	  cmp #$5d24
$16:d63f  af 18 c9 18   lda $18c918
$16:d643  5b			tcd
$16:d644  af c9 c9 24   lda $24c9c9
$16:d648  5d af 18	  eor $18af,x
$16:d64b  c9 0c a9	  cmp #$a90c
$16:d64e  0c 5b af	  tsb $af5b
$16:d651  18			clc
$16:d652  c9 c9 24	  cmp #$24c9
$16:d655  5d ae 18	  eor $18ae,x
$16:d658  c9 18 5b	  cmp #$5b18
$16:d65b  ae c9 c9	  ldx $c9c9
$16:d65e  24 5d		 bit $5d
$16:d660  ae 18 c9	  ldx $c918
$16:d663  0c a8 0c	  tsb $0ca8
$16:d666  5b			tcd
$16:d667  ae 18 c9	  ldx $c918
$16:d66a  0c c9 18	  tsb $18c9
$16:d66d  c9 24 5d	  cmp #$5d24
$16:d670  b5 18		 lda $18,x
$16:d672  c9 0c 5b	  cmp #$5b0c
$16:d675  b5 18		 lda $18,x
$16:d677  c9 c9 24	  cmp #$24c9
$16:d67a  5d b5 18	  eor $18b5,x
$16:d67d  c9 0c af	  cmp #$af0c
$16:d680  0c 5b b5	  tsb $b55b
$16:d683  18			clc
$16:d684  c9 c9 24	  cmp #$24c9
$16:d687  5d b6 18	  eor $18b6,x
$16:d68a  c9 18 5b	  cmp #$5b18
$16:d68d  b6 c9		 ldx $c9,y
$16:d68f  c9 24 5d	  cmp #$5d24
$16:d692  b6 18		 ldx $18,y
$16:d694  c9 0c b0	  cmp #$b00c
$16:d697  0c 5b b6	  tsb $b65b
$16:d69a  18			clc
$16:d69b  c9 ea 04	  cmp #$04ea
$16:d69e  c9 24 5d	  cmp #$5d24
$16:d6a1  b6 18		 ldx $18,y
$16:d6a3  c9 18 5b	  cmp #$5b18
$16:d6a6  b6 c9		 ldx $c9,y
$16:d6a8  c9 24 5d	  cmp #$5d24
$16:d6ab  b6 18		 ldx $18,y
$16:d6ad  c9 0c b0	  cmp #$b00c
$16:d6b0  0c 5b b6	  tsb $b65b
$16:d6b3  18			clc
$16:d6b4  c9 ea ff	  cmp #$ffea
$16:d6b7  c9 24 5d	  cmp #$5d24
$16:d6ba  b6 18		 ldx $18,y
$16:d6bc  c9 18 5b	  cmp #$5b18
$16:d6bf  b6 c9		 ldx $c9,y
$16:d6c1  c9 24 5d	  cmp #$5d24
$16:d6c4  b6 18		 ldx $18,y
$16:d6c6  c9 0c b0	  cmp #$b00c
$16:d6c9  0c 5b b6	  tsb $b65b
$16:d6cc  18			clc
$16:d6cd  c9 ea 02	  cmp #$02ea
$16:d6d0  c9 24 5d	  cmp #$5d24
$16:d6d3  b6 18		 ldx $18,y
$16:d6d5  c9 18 5b	  cmp #$5b18
$16:d6d8  b6 c9		 ldx $c9,y
$16:d6da  c9 24 5d	  cmp #$5d24
$16:d6dd  b6 18		 ldx $18,y
$16:d6df  c9 0c b0	  cmp #$b00c
$16:d6e2  0c 5b b6	  tsb $b65b
$16:d6e5  18			clc
$16:d6e6  c9 ea 04	  cmp #$04ea
$16:d6e9  c9 24 5d	  cmp #$5d24
$16:d6ec  b6 18		 ldx $18,y
$16:d6ee  c9 18 5b	  cmp #$5b18
$16:d6f1  b6 c9		 ldx $c9,y
$16:d6f3  c9 24 5d	  cmp #$5d24
$16:d6f6  b6 18		 ldx $18,y
$16:d6f8  c9 0c b0	  cmp #$b00c
$16:d6fb  0c 5b b6	  tsb $b65b
$16:d6fe  18			clc
$16:d6ff  c9 ea fd	  cmp #$fdea
$16:d702  c9 24 5d	  cmp #$5d24
$16:d705  b6 18		 ldx $18,y
$16:d707  c9 18 5b	  cmp #$5b18
$16:d70a  b6 c9		 ldx $c9,y
$16:d70c  c9 24 5d	  cmp #$5d24
$16:d70f  b6 18		 ldx $18,y
$16:d711  c9 0c b0	  cmp #$b00c
$16:d714  0c 5b b6	  tsb $b65b
$16:d717  18			clc
$16:d718  c9 ea ff	  cmp #$ffea
$16:d71b  c9 24 5d	  cmp #$5d24
$16:d71e  b6 18		 ldx $18,y
$16:d720  c9 18 5b	  cmp #$5b18
$16:d723  b6 c9		 ldx $c9,y
$16:d725  c9 24 5d	  cmp #$5d24
$16:d728  b6 18		 ldx $18,y
$16:d72a  c9 0c b0	  cmp #$b00c
$16:d72d  0c 5b b6	  tsb $b65b
$16:d730  18			clc
$16:d731  c9 ea fa	  cmp #$faea
$16:d734  c9 24 5d	  cmp #$5d24
$16:d737  b6 18		 ldx $18,y
$16:d739  c9 18 5b	  cmp #$5b18
$16:d73c  b6 c9		 ldx $c9,y
$16:d73e  c9 24 5d	  cmp #$5d24
$16:d741  b6 18		 ldx $18,y
$16:d743  c9 0c b0	  cmp #$b00c
$16:d746  0c 5b b6	  tsb $b65b
$16:d749  18			clc
$16:d74a  c9 ea 01	  cmp #$01ea
$16:d74d  c9 24 5d	  cmp #$5d24
$16:d750  b6 18		 ldx $18,y
$16:d752  c9 18 5b	  cmp #$5b18
$16:d755  b6 c9		 ldx $c9,y
$16:d757  c9 24 5d	  cmp #$5d24
$16:d75a  b6 18		 ldx $18,y
$16:d75c  c9 0c b0	  cmp #$b00c
$16:d75f  0c 5b b6	  tsb $b65b
$16:d762  18			clc
$16:d763  c9 ea 04	  cmp #$04ea
$16:d766  c9 24 5d	  cmp #$5d24
$16:d769  b6 18		 ldx $18,y
$16:d76b  c9 18 5b	  cmp #$5b18
$16:d76e  b6 c9		 ldx $c9,y
$16:d770  c9 24 5d	  cmp #$5d24
$16:d773  b6 18		 ldx $18,y
$16:d775  c9 0c b0	  cmp #$b00c
$16:d778  0c 5b b6	  tsb $b65b
$16:d77b  18			clc
$16:d77c  c9 ea ff	  cmp #$ffea
$16:d77f  c9 24 5d	  cmp #$5d24
$16:d782  b6 18		 ldx $18,y
$16:d784  c9 18 5b	  cmp #$5b18
$16:d787  b6 c9		 ldx $c9,y
$16:d789  c9 24 5d	  cmp #$5d24
$16:d78c  b6 18		 ldx $18,y
$16:d78e  c9 0c b0	  cmp #$b00c
$16:d791  0c 5b b6	  tsb $b65b
$16:d794  18			clc
$16:d795  c9 ea 02	  cmp #$02ea
$16:d798  c9 24 5d	  cmp #$5d24
$16:d79b  b6 18		 ldx $18,y
$16:d79d  c9 18 5b	  cmp #$5b18
$16:d7a0  b6 c9		 ldx $c9,y
$16:d7a2  c9 24 5d	  cmp #$5d24
$16:d7a5  b6 18		 ldx $18,y
$16:d7a7  c9 0c b0	  cmp #$b00c
$16:d7aa  0c 5b b6	  tsb $b65b
$16:d7ad  18			clc
$16:d7ae  c9 ea f8	  cmp #$f8ea
$16:d7b1  c9 24 5d	  cmp #$5d24
$16:d7b4  b6 18		 ldx $18,y
$16:d7b6  c9 18 5b	  cmp #$5b18
$16:d7b9  b6 c9		 ldx $c9,y
$16:d7bb  c9 24 5d	  cmp #$5d24
$16:d7be  b6 18		 ldx $18,y
$16:d7c0  c9 0c b0	  cmp #$b00c
$16:d7c3  0c 5b b6	  tsb $b65b
$16:d7c6  18			clc
$16:d7c7  c9 ea 04	  cmp #$04ea
$16:d7ca  c9 24 5d	  cmp #$5d24
$16:d7cd  b6 18		 ldx $18,y
$16:d7cf  c9 18 5b	  cmp #$5b18
$16:d7d2  b6 c9		 ldx $c9,y
$16:d7d4  c9 24 5d	  cmp #$5d24
$16:d7d7  b6 18		 ldx $18,y
$16:d7d9  c9 0c b0	  cmp #$b00c
$16:d7dc  0c 5b b6	  tsb $b65b
$16:d7df  18			clc
$16:d7e0  c9 ea ff	  cmp #$ffea
$16:d7e3  c9 24 5d	  cmp #$5d24
$16:d7e6  b6 18		 ldx $18,y
$16:d7e8  c9 18 5b	  cmp #$5b18
$16:d7eb  b6 c9		 ldx $c9,y
$16:d7ed  c9 24 5d	  cmp #$5d24
$16:d7f0  b6 18		 ldx $18,y
$16:d7f2  c9 0c b0	  cmp #$b00c
$16:d7f5  0c 5b b6	  tsb $b65b
$16:d7f8  18			clc
$16:d7f9  c9 00 ea	  cmp #$ea00
$16:d7fc  00 e0		 brk #$e0
$16:d7fe  01 ed		 ora ($ed,x)
$16:d800  a5 e1		 lda $e1
$16:d802  0a			asl a
$16:d803  e3 18		 sbc $18,s
$16:d805  46 7f		 lsr $7f
$16:d807  18			clc
$16:d808  4e 97 18	  lsr $1897
$16:d80b  4d 97 0c	  eor $0c97
$16:d80e  1d 97 18	  ora $1897,x
$16:d811  4d 97 97	  eor $9797
$16:d814  0c 97 0c	  tsb $0c97
$16:d817  4b			phk
$16:d818  9d 18 4e	  sta $4e18,x
$16:d81b  97 18		 sta [$18],y
$16:d81d  4d 97 0c	  eor $0c97
$16:d820  1d 97 18	  ora $1897,x
$16:d823  4d 97 97	  eor $9797
$16:d826  0c 97 0c	  tsb $0c97
$16:d829  4b			phk
$16:d82a  9d ea ff	  sta $ffea,x
$16:d82d  18			clc
$16:d82e  4e 97 18	  lsr $1897
$16:d831  4d 97 0c	  eor $0c97
$16:d834  1d 97 18	  ora $1897,x
$16:d837  4d 97 97	  eor $9797
$16:d83a  0c 97 0c	  tsb $0c97
$16:d83d  4b			phk
$16:d83e  9d 18 4e	  sta $4e18,x
$16:d841  97 18		 sta [$18],y
$16:d843  4d 97 0c	  eor $0c97
$16:d846  1d 97 18	  ora $1897,x
$16:d849  4d 97 97	  eor $9797
$16:d84c  0c 97 0c	  tsb $0c97
$16:d84f  4b			phk
$16:d850  9d ea 00	  sta $00ea,x
$16:d853  ea			nop
$16:d854  f9 18 4e	  sbc $4e18,y
$16:d857  97 18		 sta [$18],y
$16:d859  4d 97 0c	  eor $0c97
$16:d85c  1d 97 18	  ora $1897,x
$16:d85f  4d 97 97	  eor $9797
$16:d862  0c 97 0c	  tsb $0c97
$16:d865  4b			phk
$16:d866  9d 18 4e	  sta $4e18,x
$16:d869  97 18		 sta [$18],y
$16:d86b  4d 97 0c	  eor $0c97
$16:d86e  1d 97 18	  ora $1897,x
$16:d871  4d 97 97	  eor $9797
$16:d874  0c 97 0c	  tsb $0c97
$16:d877  4b			phk
$16:d878  9d ea 00	  sta $00ea,x
$16:d87b  ea			nop
$16:d87c  fa			plx
$16:d87d  18			clc
$16:d87e  4e 97 18	  lsr $1897
$16:d881  4d 97 0c	  eor $0c97
$16:d884  1d 97 18	  ora $1897,x
$16:d887  4d 97 97	  eor $9797
$16:d88a  0c 97 0c	  tsb $0c97
$16:d88d  4b			phk
$16:d88e  9d 18 4e	  sta $4e18,x
$16:d891  97 18		 sta [$18],y
$16:d893  4d 97 0c	  eor $0c97
$16:d896  1d 97 18	  ora $1897,x
$16:d899  4d 97 97	  eor $9797
$16:d89c  0c 97 0c	  tsb $0c97
$16:d89f  4b			phk
$16:d8a0  9d ea 00	  sta $00ea,x
$16:d8a3  ea			nop
$16:d8a4  fe 18 4e	  inc $4e18,x
$16:d8a7  97 18		 sta [$18],y
$16:d8a9  4d 97 0c	  eor $0c97
$16:d8ac  1d 97 18	  ora $1897,x
$16:d8af  4d 97 97	  eor $9797
$16:d8b2  0c 97 0c	  tsb $0c97
$16:d8b5  4b			phk
$16:d8b6  9d 18 4e	  sta $4e18,x
$16:d8b9  97 18		 sta [$18],y
$16:d8bb  4d 97 0c	  eor $0c97
$16:d8be  1d 97 18	  ora $1897,x
$16:d8c1  4d 97 97	  eor $9797
$16:d8c4  0c 97 0c	  tsb $0c97
$16:d8c7  4b			phk
$16:d8c8  9d ea 00	  sta $00ea,x
$16:d8cb  ea			nop
$16:d8cc  fd 18 4e	  sbc $4e18,x
$16:d8cf  97 18		 sta [$18],y
$16:d8d1  4d 97 0c	  eor $0c97
$16:d8d4  1d 97 18	  ora $1897,x
$16:d8d7  4d 97 97	  eor $9797
$16:d8da  0c 97 0c	  tsb $0c97
$16:d8dd  4b			phk
$16:d8de  9d 18 4e	  sta $4e18,x
$16:d8e1  97 18		 sta [$18],y
$16:d8e3  4d 97 0c	  eor $0c97
$16:d8e6  1d 97 18	  ora $1897,x
$16:d8e9  4d 97 97	  eor $9797
$16:d8ec  0c 97 0c	  tsb $0c97
$16:d8ef  4b			phk
$16:d8f0  9d ea 00	  sta $00ea,x
$16:d8f3  ea			nop
$16:d8f4  ff 18 4e 97   sbc $974e18,x
$16:d8f8  18			clc
$16:d8f9  4d 97 0c	  eor $0c97
$16:d8fc  1d 97 18	  ora $1897,x
$16:d8ff  4d 97 97	  eor $9797
$16:d902  0c 97 0c	  tsb $0c97
$16:d905  4b			phk
$16:d906  9d 18 4e	  sta $4e18,x
$16:d909  97 18		 sta [$18],y
$16:d90b  4d 97 0c	  eor $0c97
$16:d90e  1d 97 18	  ora $1897,x
$16:d911  4d 97 97	  eor $9797
$16:d914  0c 97 0c	  tsb $0c97
$16:d917  4b			phk
$16:d918  9d ea 00	  sta $00ea,x
$16:d91b  ea			nop
$16:d91c  03 18		 ora $18,s
$16:d91e  4e 97 18	  lsr $1897
$16:d921  4d 97 0c	  eor $0c97
$16:d924  1d 97 18	  ora $1897,x
$16:d927  4d 97 97	  eor $9797
$16:d92a  0c 97 0c	  tsb $0c97
$16:d92d  4b			phk
$16:d92e  9d 18 4e	  sta $4e18,x
$16:d931  97 18		 sta [$18],y
$16:d933  4d 97 0c	  eor $0c97
$16:d936  1d 97 18	  ora $1897,x
$16:d939  4d 97 97	  eor $9797
$16:d93c  0c 97 0c	  tsb $0c97
$16:d93f  4b			phk
$16:d940  9d ea 00	  sta $00ea,x
$16:d943  ea			nop
$16:d944  00 18		 brk #$18
$16:d946  4e 97 18	  lsr $1897
$16:d949  4d 97 0c	  eor $0c97
$16:d94c  1d 97 18	  ora $1897,x
$16:d94f  4d 97 97	  eor $9797
$16:d952  0c 97 0c	  tsb $0c97
$16:d955  4b			phk
$16:d956  9d 18 4e	  sta $4e18,x
$16:d959  97 18		 sta [$18],y
$16:d95b  4d 97 0c	  eor $0c97
$16:d95e  1d 97 18	  ora $1897,x
$16:d961  4d 97 97	  eor $9797
$16:d964  0c 97 0c	  tsb $0c97
$16:d967  4b			phk
$16:d968  9d ea 00	  sta $00ea,x
$16:d96b  ea			nop
$16:d96c  ff 18 4e 97   sbc $974e18,x
$16:d970  18			clc
$16:d971  4d 97 0c	  eor $0c97
$16:d974  1d 97 18	  ora $1897,x
$16:d977  4d 97 97	  eor $9797
$16:d97a  0c 97 0c	  tsb $0c97
$16:d97d  4b			phk
$16:d97e  9d 18 4e	  sta $4e18,x
$16:d981  97 18		 sta [$18],y
$16:d983  4d 97 0c	  eor $0c97
$16:d986  1d 97 18	  ora $1897,x
$16:d989  4d 97 97	  eor $9797
$16:d98c  0c 97 0c	  tsb $0c97
$16:d98f  4b			phk
$16:d990  9d ea 00	  sta $00ea,x
$16:d993  ea			nop
$16:d994  f9 18 4e	  sbc $4e18,y
$16:d997  97 18		 sta [$18],y
$16:d999  4d 97 0c	  eor $0c97
$16:d99c  1d 97 18	  ora $1897,x
$16:d99f  4d 97 97	  eor $9797
$16:d9a2  0c 97 0c	  tsb $0c97
$16:d9a5  4b			phk
$16:d9a6  9d 18 4e	  sta $4e18,x
$16:d9a9  97 18		 sta [$18],y
$16:d9ab  4d 97 0c	  eor $0c97
$16:d9ae  1d 97 18	  ora $1897,x
$16:d9b1  4d 97 97	  eor $9797
$16:d9b4  0c 97 0c	  tsb $0c97
$16:d9b7  4b			phk
$16:d9b8  9d ea 00	  sta $00ea,x
$16:d9bb  ea			nop
$16:d9bc  fa			plx
$16:d9bd  18			clc
$16:d9be  4e 97 18	  lsr $1897
$16:d9c1  4d 97 0c	  eor $0c97
$16:d9c4  1d 97 18	  ora $1897,x
$16:d9c7  4d 97 97	  eor $9797
$16:d9ca  0c 97 0c	  tsb $0c97
$16:d9cd  4b			phk
$16:d9ce  9d 18 4e	  sta $4e18,x
$16:d9d1  97 18		 sta [$18],y
$16:d9d3  4d 97 0c	  eor $0c97
$16:d9d6  1d 97 18	  ora $1897,x
$16:d9d9  4d 97 97	  eor $9797
$16:d9dc  0c 97 0c	  tsb $0c97
$16:d9df  4b			phk
$16:d9e0  9d ea 00	  sta $00ea,x
$16:d9e3  ea			nop
$16:d9e4  fe 18 4e	  inc $4e18,x
$16:d9e7  97 18		 sta [$18],y
$16:d9e9  4d 97 0c	  eor $0c97
$16:d9ec  1d 97 18	  ora $1897,x
$16:d9ef  4d 97 97	  eor $9797
$16:d9f2  0c 97 0c	  tsb $0c97
$16:d9f5  4b			phk
$16:d9f6  9d 18 4e	  sta $4e18,x
$16:d9f9  97 18		 sta [$18],y
$16:d9fb  4d 97 0c	  eor $0c97
$16:d9fe  1d 97 18	  ora $1897,x
$16:da01  4d 97 97	  eor $9797
$16:da04  0c 97 0c	  tsb $0c97
$16:da07  4b			phk
$16:da08  9d ea 00	  sta $00ea,x
$16:da0b  ea			nop
$16:da0c  fd 18 4e	  sbc $4e18,x
$16:da0f  97 18		 sta [$18],y
$16:da11  4d 97 0c	  eor $0c97
$16:da14  1d 97 18	  ora $1897,x
$16:da17  4d 97 97	  eor $9797
$16:da1a  0c 97 0c	  tsb $0c97
$16:da1d  4b			phk
$16:da1e  9d 18 4e	  sta $4e18,x
$16:da21  97 18		 sta [$18],y
$16:da23  4d 97 0c	  eor $0c97
$16:da26  1d 97 18	  ora $1897,x
$16:da29  4d 97 97	  eor $9797
$16:da2c  0c 97 0c	  tsb $0c97
$16:da2f  4b			phk
$16:da30  9d ea 00	  sta $00ea,x
$16:da33  ea			nop
$16:da34  ff 18 4e 97   sbc $974e18,x
$16:da38  18			clc
$16:da39  4d 97 0c	  eor $0c97
$16:da3c  1d 97 18	  ora $1897,x
$16:da3f  4d 97 97	  eor $9797
$16:da42  0c 97 0c	  tsb $0c97
$16:da45  4b			phk
$16:da46  9d 18 4e	  sta $4e18,x
$16:da49  97 18		 sta [$18],y
$16:da4b  4d 97 0c	  eor $0c97
$16:da4e  1d 97 18	  ora $1897,x
$16:da51  4d 97 97	  eor $9797
$16:da54  0c 97 0c	  tsb $0c97
$16:da57  4b			phk
$16:da58  9d ea 00	  sta $00ea,x
$16:da5b  ea			nop
$16:da5c  f7 18		 sbc [$18],y
$16:da5e  4e 97 18	  lsr $1897
$16:da61  4d 97 0c	  eor $0c97
$16:da64  1d 97 18	  ora $1897,x
$16:da67  4d 97 97	  eor $9797
$16:da6a  0c 97 0c	  tsb $0c97
$16:da6d  4b			phk
$16:da6e  9d 18 4e	  sta $4e18,x
$16:da71  97 18		 sta [$18],y
$16:da73  4d 97 0c	  eor $0c97
$16:da76  1d 97 18	  ora $1897,x
$16:da79  4d 97 97	  eor $9797
$16:da7c  0c 97 0c	  tsb $0c97
$16:da7f  4b			phk
$16:da80  9d ea 00	  sta $00ea,x
$16:da83  ea			nop
$16:da84  fb			xce
$16:da85  18			clc
$16:da86  4e 97 18	  lsr $1897
$16:da89  4d 97 0c	  eor $0c97
$16:da8c  1d 97 18	  ora $1897,x
$16:da8f  4d 97 97	  eor $9797
$16:da92  0c 97 0c	  tsb $0c97
$16:da95  4b			phk
$16:da96  9d 18 4e	  sta $4e18,x
$16:da99  97 18		 sta [$18],y
$16:da9b  4d 97 0c	  eor $0c97
$16:da9e  1d 97 18	  ora $1897,x
$16:daa1  4d 97 97	  eor $9797
$16:daa4  0c 97 0c	  tsb $0c97
$16:daa7  4b			phk
$16:daa8  9d ea 00	  sta $00ea,x
$16:daab  ea			nop
$16:daac  fa			plx
$16:daad  18			clc
$16:daae  4e 97 18	  lsr $1897
$16:dab1  4d 97 0c	  eor $0c97
$16:dab4  1d 97 18	  ora $1897,x
$16:dab7  4d 97 97	  eor $9797
$16:daba  0c 97 0c	  tsb $0c97
$16:dabd  4b			phk
$16:dabe  9d 18 4e	  sta $4e18,x
$16:dac1  97 18		 sta [$18],y
$16:dac3  4d 97 0c	  eor $0c97
$16:dac6  1d 97 18	  ora $1897,x
$16:dac9  4d 97 97	  eor $9797
$16:dacc  0c 97 0c	  tsb $0c97
$16:dacf  4b			phk
$16:dad0  9d ea 00	  sta $00ea,x
$16:dad3  00 ea		 brk #$ea
$16:dad5  00 e0		 brk #$e0
$16:dad7  02 ed		 cop #$ed
$16:dad9  9b			txy
$16:dada  e1 0a		 sbc ($0a,x)
$16:dadc  e3 30		 sbc $30,s
$16:dade  46 40		 lsr $40
$16:dae0  18			clc
$16:dae1  c9 24 5d	  cmp #$5d24
$16:dae4  a9 18 c9	  lda #$c918
$16:dae7  18			clc
$16:dae8  5b			tcd
$16:dae9  a9 c9 c9	  lda #$c9c9
$16:daec  24 5d		 bit $5d
$16:daee  a9 30 c9	  lda #$c930
$16:daf1  18			clc
$16:daf2  c9 c9 24	  cmp #$24c9
$16:daf5  a8			tay
$16:daf6  18			clc
$16:daf7  c9 18 5b	  cmp #$5b18
$16:dafa  a8			tay
$16:dafb  c9 c9 24	  cmp #$24c9
$16:dafe  5d a8 30	  eor $30a8,x
$16:db01  c9 18 c9	  cmp #$c918
$16:db04  0c c9 18	  tsb $18c9
$16:db07  c9 24 af	  cmp #$af24
$16:db0a  18			clc
$16:db0b  c9 0c 5b	  cmp #$5b0c
$16:db0e  af 18 c9 c9   lda $c9c918
$16:db12  24 5d		 bit $5d
$16:db14  af 30 c9 18   lda $18c930
$16:db18  c9 c9 24	  cmp #$24c9
$16:db1b  b0 18		 bcs $db35
$16:db1d  c9 18 5b	  cmp #$5b18
$16:db20  b0 c9		 bcs $daeb
$16:db22  c9 24 5d	  cmp #$5d24
$16:db25  b0 30		 bcs $db57
$16:db27  c9 18 c9	  cmp #$c918
$16:db2a  ea			nop
$16:db2b  04 c9		 tsb $c9
$16:db2d  24 b0		 bit $b0
$16:db2f  18			clc
$16:db30  c9 18 5b	  cmp #$5b18
$16:db33  b0 c9		 bcs $dafe
$16:db35  c9 24 5d	  cmp #$5d24
$16:db38  b0 30		 bcs $db6a
$16:db3a  c9 18 c9	  cmp #$c918
$16:db3d  ea			nop
$16:db3e  ff c9 24 b0   sbc $b024c9,x
$16:db42  18			clc
$16:db43  c9 18 5b	  cmp #$5b18
$16:db46  b0 c9		 bcs $db11
$16:db48  c9 24 5d	  cmp #$5d24
$16:db4b  b0 30		 bcs $db7d
$16:db4d  c9 18 c9	  cmp #$c918
$16:db50  ea			nop
$16:db51  02 c9		 cop #$c9
$16:db53  24 b0		 bit $b0
$16:db55  18			clc
$16:db56  c9 18 5b	  cmp #$5b18
$16:db59  b0 c9		 bcs $db24
$16:db5b  c9 24 5d	  cmp #$5d24
$16:db5e  b0 30		 bcs $db90
$16:db60  c9 18 c9	  cmp #$c918
$16:db63  ea			nop
$16:db64  04 c9		 tsb $c9
$16:db66  24 b0		 bit $b0
$16:db68  18			clc
$16:db69  c9 18 5b	  cmp #$5b18
$16:db6c  b0 c9		 bcs $db37
$16:db6e  c9 24 5d	  cmp #$5d24
$16:db71  b0 30		 bcs $dba3
$16:db73  c9 18 c9	  cmp #$c918
$16:db76  ea			nop
$16:db77  fd c9 24	  sbc $24c9,x
$16:db7a  b0 18		 bcs $db94
$16:db7c  c9 18 5b	  cmp #$5b18
$16:db7f  b0 c9		 bcs $db4a
$16:db81  c9 24 5d	  cmp #$5d24
$16:db84  b0 30		 bcs $dbb6
$16:db86  c9 18 c9	  cmp #$c918
$16:db89  ea			nop
$16:db8a  ff c9 24 b0   sbc $b024c9,x
$16:db8e  18			clc
$16:db8f  c9 18 5b	  cmp #$5b18
$16:db92  b0 c9		 bcs $db5d
$16:db94  c9 24 5d	  cmp #$5d24
$16:db97  b0 30		 bcs $dbc9
$16:db99  c9 18 c9	  cmp #$c918
$16:db9c  ea			nop
$16:db9d  fa			plx
$16:db9e  c9 24 b0	  cmp #$b024
$16:dba1  18			clc
$16:dba2  c9 18 5b	  cmp #$5b18
$16:dba5  b0 c9		 bcs $db70
$16:dba7  c9 24 5d	  cmp #$5d24
$16:dbaa  b0 30		 bcs $dbdc
$16:dbac  c9 18 c9	  cmp #$c918
$16:dbaf  ea			nop
$16:dbb0  01 c9		 ora ($c9,x)
$16:dbb2  24 b0		 bit $b0
$16:dbb4  18			clc
$16:dbb5  c9 18 5b	  cmp #$5b18
$16:dbb8  b0 c9		 bcs $db83
$16:dbba  c9 24 5d	  cmp #$5d24
$16:dbbd  b0 30		 bcs $dbef
$16:dbbf  c9 18 c9	  cmp #$c918
$16:dbc2  ea			nop
$16:dbc3  04 c9		 tsb $c9
$16:dbc5  24 b0		 bit $b0
$16:dbc7  18			clc
$16:dbc8  c9 18 5b	  cmp #$5b18
$16:dbcb  b0 c9		 bcs $db96
$16:dbcd  c9 24 5d	  cmp #$5d24
$16:dbd0  b0 30		 bcs $dc02
$16:dbd2  c9 18 c9	  cmp #$c918
$16:dbd5  ea			nop
$16:dbd6  ff c9 24 b0   sbc $b024c9,x
$16:dbda  18			clc
$16:dbdb  c9 18 5b	  cmp #$5b18
$16:dbde  b0 c9		 bcs $dba9
$16:dbe0  c9 24 5d	  cmp #$5d24
$16:dbe3  b0 30		 bcs $dc15
$16:dbe5  c9 18 c9	  cmp #$c918
$16:dbe8  ea			nop
$16:dbe9  02 c9		 cop #$c9
$16:dbeb  24 b0		 bit $b0
$16:dbed  18			clc
$16:dbee  c9 18 5b	  cmp #$5b18
$16:dbf1  b0 c9		 bcs $dbbc
$16:dbf3  c9 24 5d	  cmp #$5d24
$16:dbf6  b0 30		 bcs $dc28
$16:dbf8  c9 18 c9	  cmp #$c918
$16:dbfb  ea			nop
$16:dbfc  f8			sed
$16:dbfd  c9 24 b0	  cmp #$b024
$16:dc00  18			clc
$16:dc01  c9 18 5b	  cmp #$5b18
$16:dc04  b0 c9		 bcs $dbcf
$16:dc06  c9 24 5d	  cmp #$5d24
$16:dc09  b0 30		 bcs $dc3b
$16:dc0b  c9 18 c9	  cmp #$c918
$16:dc0e  ea			nop
$16:dc0f  04 c9		 tsb $c9
$16:dc11  24 b0		 bit $b0
$16:dc13  18			clc
$16:dc14  c9 18 5b	  cmp #$5b18
$16:dc17  b0 c9		 bcs $dbe2
$16:dc19  c9 24 5d	  cmp #$5d24
$16:dc1c  b0 30		 bcs $dc4e
$16:dc1e  c9 18 c9	  cmp #$c918
$16:dc21  ea			nop
$16:dc22  ff c9 24 b0   sbc $b024c9,x
$16:dc26  18			clc
$16:dc27  c9 18 5b	  cmp #$5b18
$16:dc2a  b0 c9		 bcs $dbf5
$16:dc2c  c9 24 5d	  cmp #$5d24
$16:dc2f  b0 30		 bcs $dc61
$16:dc31  c9 18 c9	  cmp #$c918
$16:dc34  00 ea		 brk #$ea
$16:dc36  00 ed		 brk #$ed
$16:dc38  91 e1		 sta ($e1),y
$16:dc3a  0b			phd
$16:dc3b  0c 5d cc	  tsb $cc5d
$16:dc3e  cc c9 cc	  cpy $ccc9
$16:dc41  ea			nop
$16:dc42  05 cc		 ora $cc
$16:dc44  ea			nop
$16:dc45  00 cc		 brk #$cc
$16:dc47  cc c9 cc	  cpy $ccc9
$16:dc4a  c9 ea 05	  cmp #$05ea
$16:dc4d  cc ea 00	  cpy $00ea
$16:dc50  cc cc c9	  cpy $c9cc
$16:dc53  cc ea 05	  cpy $05ea
$16:dc56  cc ea 00	  cpy $00ea
$16:dc59  cc cc c9	  cpy $c9cc
$16:dc5c  cc c9 ea	  cpy $eac9
$16:dc5f  05 cc		 ora $cc
$16:dc61  ea			nop
$16:dc62  00 cc		 brk #$cc
$16:dc64  cc c9 cc	  cpy $ccc9
$16:dc67  ea			nop
$16:dc68  05 cc		 ora $cc
$16:dc6a  ea			nop
$16:dc6b  00 cc		 brk #$cc
$16:dc6d  cc c9 cc	  cpy $ccc9
$16:dc70  c9 ea 05	  cmp #$05ea
$16:dc73  cc ea 00	  cpy $00ea
$16:dc76  cc cc c9	  cpy $c9cc
$16:dc79  cc ea 05	  cpy $05ea
$16:dc7c  cc ea 00	  cpy $00ea
$16:dc7f  cc cc c9	  cpy $c9cc
$16:dc82  cc c9 ea	  cpy $eac9
$16:dc85  05 cc		 ora $cc
$16:dc87  ea			nop
$16:dc88  00 cc		 brk #$cc
$16:dc8a  cc c9 cc	  cpy $ccc9
$16:dc8d  ea			nop
$16:dc8e  05 cc		 ora $cc
$16:dc90  ea			nop
$16:dc91  00 cc		 brk #$cc
$16:dc93  cc c9 cc	  cpy $ccc9
$16:dc96  c9 ea 05	  cmp #$05ea
$16:dc99  cc ea 00	  cpy $00ea
$16:dc9c  cc cc c9	  cpy $c9cc
$16:dc9f  cc ea 05	  cpy $05ea
$16:dca2  cc ea 00	  cpy $00ea
$16:dca5  cc cc c9	  cpy $c9cc
$16:dca8  cc c9 ea	  cpy $eac9
$16:dcab  05 cc		 ora $cc
$16:dcad  ea			nop
$16:dcae  00 cc		 brk #$cc
$16:dcb0  cc c9 cc	  cpy $ccc9
$16:dcb3  ea			nop
$16:dcb4  05 cc		 ora $cc
$16:dcb6  ea			nop
$16:dcb7  00 cc		 brk #$cc
$16:dcb9  cc c9 cc	  cpy $ccc9
$16:dcbc  c9 ea 05	  cmp #$05ea
$16:dcbf  cc ea 00	  cpy $00ea
$16:dcc2  cc cc c9	  cpy $c9cc
$16:dcc5  cc ea 05	  cpy $05ea
$16:dcc8  cc ea 00	  cpy $00ea
$16:dccb  cc cc c9	  cpy $c9cc
$16:dcce  cc c9 ea	  cpy $eac9
$16:dcd1  05 cc		 ora $cc
$16:dcd3  ea			nop
$16:dcd4  00 cc		 brk #$cc
$16:dcd6  cc c9 cc	  cpy $ccc9
$16:dcd9  ea			nop
$16:dcda  05 cc		 ora $cc
$16:dcdc  ea			nop
$16:dcdd  00 cc		 brk #$cc
$16:dcdf  cc c9 cc	  cpy $ccc9
$16:dce2  c9 ea 05	  cmp #$05ea
$16:dce5  cc ea 00	  cpy $00ea
$16:dce8  cc cc c9	  cpy $c9cc
$16:dceb  cc ea 05	  cpy $05ea
$16:dcee  cc ea 00	  cpy $00ea
$16:dcf1  cc cc c9	  cpy $c9cc
$16:dcf4  cc c9 ea	  cpy $eac9
$16:dcf7  05 cc		 ora $cc
$16:dcf9  ea			nop
$16:dcfa  00 cc		 brk #$cc
$16:dcfc  cc c9 cc	  cpy $ccc9
$16:dcff  ea			nop
$16:dd00  05 cc		 ora $cc
$16:dd02  ea			nop
$16:dd03  00 cc		 brk #$cc
$16:dd05  cc c9 cc	  cpy $ccc9
$16:dd08  c9 ea 05	  cmp #$05ea
$16:dd0b  cc ea 00	  cpy $00ea
$16:dd0e  cc cc c9	  cpy $c9cc
$16:dd11  cc ea 05	  cpy $05ea
$16:dd14  cc ea 00	  cpy $00ea
$16:dd17  cc cc c9	  cpy $c9cc
$16:dd1a  cc c9 ea	  cpy $eac9
$16:dd1d  05 cc		 ora $cc
$16:dd1f  ea			nop
$16:dd20  00 cc		 brk #$cc
$16:dd22  cc c9 cc	  cpy $ccc9
$16:dd25  ea			nop
$16:dd26  05 cc		 ora $cc
$16:dd28  ea			nop
$16:dd29  00 cc		 brk #$cc
$16:dd2b  cc c9 cc	  cpy $ccc9
$16:dd2e  c9 ea 05	  cmp #$05ea
$16:dd31  cc ea 00	  cpy $00ea
$16:dd34  cc cc c9	  cpy $c9cc
$16:dd37  cc ea 05	  cpy $05ea
$16:dd3a  cc ea 00	  cpy $00ea
$16:dd3d  cc cc c9	  cpy $c9cc
$16:dd40  cc c9 ea	  cpy $eac9
$16:dd43  05 cc		 ora $cc
$16:dd45  ea			nop
$16:dd46  00 cc		 brk #$cc
$16:dd48  cc c9 cc	  cpy $ccc9
$16:dd4b  ea			nop
$16:dd4c  05 cc		 ora $cc
$16:dd4e  ea			nop
$16:dd4f  00 cc		 brk #$cc
$16:dd51  cc c9 cc	  cpy $ccc9
$16:dd54  c9 ea 05	  cmp #$05ea
$16:dd57  cc ea 00	  cpy $00ea
$16:dd5a  cc cc c9	  cpy $c9cc
$16:dd5d  cc ea 05	  cpy $05ea
$16:dd60  cc ea 00	  cpy $00ea
$16:dd63  cc cc c9	  cpy $c9cc
$16:dd66  cc c9 ea	  cpy $eac9
$16:dd69  05 cc		 ora $cc
$16:dd6b  ea			nop
$16:dd6c  00 cc		 brk #$cc
$16:dd6e  cc c9 cc	  cpy $ccc9
$16:dd71  ea			nop
$16:dd72  05 cc		 ora $cc
$16:dd74  ea			nop
$16:dd75  00 cc		 brk #$cc
$16:dd77  cc c9 cc	  cpy $ccc9
$16:dd7a  c9 ea 05	  cmp #$05ea
$16:dd7d  cc ea 00	  cpy $00ea
$16:dd80  cc cc c9	  cpy $c9cc
$16:dd83  cc ea 05	  cpy $05ea
$16:dd86  cc ea 00	  cpy $00ea
$16:dd89  cc cc c9	  cpy $c9cc
$16:dd8c  cc c9 ea	  cpy $eac9
$16:dd8f  05 cc		 ora $cc
$16:dd91  ea			nop
$16:dd92  00 cc		 brk #$cc
$16:dd94  cc c9 cc	  cpy $ccc9
$16:dd97  ea			nop
$16:dd98  05 cc		 ora $cc
$16:dd9a  ea			nop
$16:dd9b  00 cc		 brk #$cc
$16:dd9d  cc c9 cc	  cpy $ccc9
$16:dda0  c9 ea 05	  cmp #$05ea
$16:dda3  cc ea 00	  cpy $00ea
$16:dda6  cc cc c9	  cpy $c9cc
$16:dda9  cc ea 05	  cpy $05ea
$16:ddac  cc ea 00	  cpy $00ea
$16:ddaf  cc cc c9	  cpy $c9cc
$16:ddb2  cc c9 ea	  cpy $eac9
$16:ddb5  05 cc		 ora $cc
$16:ddb7  ea			nop
$16:ddb8  00 cc		 brk #$cc
$16:ddba  cc c9 cc	  cpy $ccc9
$16:ddbd  ea			nop
$16:ddbe  05 cc		 ora $cc
$16:ddc0  ea			nop
$16:ddc1  00 cc		 brk #$cc
$16:ddc3  cc c9 cc	  cpy $ccc9
$16:ddc6  c9 ea 05	  cmp #$05ea
$16:ddc9  cc ea 00	  cpy $00ea
$16:ddcc  cc cc c9	  cpy $c9cc
$16:ddcf  cc ea 05	  cpy $05ea
$16:ddd2  cc ea 00	  cpy $00ea
$16:ddd5  cc cc c9	  cpy $c9cc
$16:ddd8  cc c9 ea	  cpy $eac9
$16:dddb  05 cc		 ora $cc
$16:dddd  ea			nop
$16:ddde  00 cc		 brk #$cc
$16:dde0  cc c9 cc	  cpy $ccc9
$16:dde3  ea			nop
$16:dde4  05 cc		 ora $cc
$16:dde6  ea			nop
$16:dde7  00 cc		 brk #$cc
$16:dde9  cc c9 cc	  cpy $ccc9
$16:ddec  c9 ea 05	  cmp #$05ea
$16:ddef  cc ea 00	  cpy $00ea
$16:ddf2  cc cc c9	  cpy $c9cc
$16:ddf5  cc ea 05	  cpy $05ea
$16:ddf8  cc ea 00	  cpy $00ea
$16:ddfb  cc cc c9	  cpy $c9cc
$16:ddfe  cc c9 ea	  cpy $eac9
$16:de01  05 cc		 ora $cc
$16:de03  ea			nop
$16:de04  00 cc		 brk #$cc
$16:de06  cc c9 cc	  cpy $ccc9
$16:de09  ea			nop
$16:de0a  05 cc		 ora $cc
$16:de0c  ea			nop
$16:de0d  00 cc		 brk #$cc
$16:de0f  cc c9 cc	  cpy $ccc9
$16:de12  c9 ea 05	  cmp #$05ea
$16:de15  cc ea 00	  cpy $00ea
$16:de18  cc cc c9	  cpy $c9cc
$16:de1b  cc ea 05	  cpy $05ea
$16:de1e  cc ea 00	  cpy $00ea
$16:de21  cc cc c9	  cpy $c9cc
$16:de24  cc c9 ea	  cpy $eac9
$16:de27  05 cc		 ora $cc
$16:de29  ea			nop
$16:de2a  00 cc		 brk #$cc
$16:de2c  cc c9 cc	  cpy $ccc9
$16:de2f  ea			nop
$16:de30  05 cc		 ora $cc
$16:de32  ea			nop
$16:de33  00 cc		 brk #$cc
$16:de35  cc c9 cc	  cpy $ccc9
$16:de38  c9 ea 05	  cmp #$05ea
$16:de3b  cc ea 00	  cpy $00ea
$16:de3e  cc cc c9	  cpy $c9cc
$16:de41  cc ea 05	  cpy $05ea
$16:de44  cc ea 00	  cpy $00ea
$16:de47  cc cc c9	  cpy $c9cc
$16:de4a  cc c9 ea	  cpy $eac9
$16:de4d  05 cc		 ora $cc
$16:de4f  ea			nop
$16:de50  00 cc		 brk #$cc
$16:de52  cc c9 cc	  cpy $ccc9
$16:de55  ea			nop
$16:de56  05 cc		 ora $cc
$16:de58  ea			nop
$16:de59  00 cc		 brk #$cc
$16:de5b  cc c9 cc	  cpy $ccc9
$16:de5e  c9 ea 05	  cmp #$05ea
$16:de61  cc ea 00	  cpy $00ea
$16:de64  cc cc c9	  cpy $c9cc
$16:de67  cc ea 05	  cpy $05ea
$16:de6a  cc ea 00	  cpy $00ea
$16:de6d  cc cc c9	  cpy $c9cc
$16:de70  cc c9 ea	  cpy $eac9
$16:de73  05 cc		 ora $cc
$16:de75  ea			nop
$16:de76  00 cc		 brk #$cc
$16:de78  cc c9 cc	  cpy $ccc9
$16:de7b  ea			nop
$16:de7c  05 cc		 ora $cc
$16:de7e  ea			nop
$16:de7f  00 cc		 brk #$cc
$16:de81  cc c9 cc	  cpy $ccc9
$16:de84  c9 ea 05	  cmp #$05ea
$16:de87  cc ea 00	  cpy $00ea
$16:de8a  cc cc c9	  cpy $c9cc
$16:de8d  cc ea 05	  cpy $05ea
$16:de90  cc ea 00	  cpy $00ea
$16:de93  cc cc c9	  cpy $c9cc
$16:de96  cc c9 ea	  cpy $eac9
$16:de99  05 cc		 ora $cc
$16:de9b  ea			nop
$16:de9c  00 cc		 brk #$cc
$16:de9e  cc c9 cc	  cpy $ccc9
$16:dea1  ea			nop
$16:dea2  05 cc		 ora $cc
$16:dea4  ea			nop
$16:dea5  00 cc		 brk #$cc
$16:dea7  cc c9 cc	  cpy $ccc9
$16:deaa  c9 ea 05	  cmp #$05ea
$16:dead  cc ea 00	  cpy $00ea
$16:deb0  cc cc c9	  cpy $c9cc
$16:deb3  cc ea 05	  cpy $05ea
$16:deb6  cc ea 00	  cpy $00ea
$16:deb9  cc cc c9	  cpy $c9cc
$16:debc  cc c9 ea	  cpy $eac9
$16:debf  05 cc		 ora $cc
$16:dec1  ea			nop
$16:dec2  00 cc		 brk #$cc
$16:dec4  cc c9 cc	  cpy $ccc9
$16:dec7  ea			nop
$16:dec8  05 cc		 ora $cc
$16:deca  ea			nop
$16:decb  00 cc		 brk #$cc
$16:decd  cc c9 cc	  cpy $ccc9
$16:ded0  c9 ea 05	  cmp #$05ea
$16:ded3  cc ea 00	  cpy $00ea
$16:ded6  cc cc c9	  cpy $c9cc
$16:ded9  cc ea 05	  cpy $05ea
$16:dedc  cc ea 00	  cpy $00ea
$16:dedf  cc cc c9	  cpy $c9cc
$16:dee2  cc c9 ea	  cpy $eac9
$16:dee5  05 cc		 ora $cc
$16:dee7  ea			nop
$16:dee8  00 00		 brk #$00
$16:deea  ea			nop
$16:deeb  00 ed		 brk #$ed
$16:deed  c3 18		 cmp $18,s
$16:deef  5d ca cb	  eor $cbca,x
$16:def2  0c ca 18	  tsb $18ca
$16:def5  ca			dex
$16:def6  cb			wai
$16:def7  ea			nop
$16:def8  fc 0c cb	  jsr ($cb0c,x)
$16:defb  ea			nop
$16:defc  00 ca		 brk #$ca
$16:defe  18			clc
$16:deff  ca			dex
$16:df00  cb			wai
$16:df01  0c ca 18	  tsb $18ca
$16:df04  ca			dex
$16:df05  0c cb ea	  tsb $eacb
$16:df08  fe cb ea	  inc $eacb,x
$16:df0b  fc cb ea	  jsr ($eacb,x)
$16:df0e  fa			plx
$16:df0f  cb			wai
$16:df10  ea			nop
$16:df11  00 18		 brk #$18
$16:df13  ca			dex
$16:df14  cb			wai
$16:df15  0c ca 18	  tsb $18ca
$16:df18  ca			dex
$16:df19  cb			wai
$16:df1a  ea			nop
$16:df1b  fc 0c cb	  jsr ($cb0c,x)
$16:df1e  ea			nop
$16:df1f  00 ca		 brk #$ca
$16:df21  18			clc
$16:df22  ca			dex
$16:df23  cb			wai
$16:df24  0c ca 18	  tsb $18ca
$16:df27  ca			dex
$16:df28  0c cb ea	  tsb $eacb
$16:df2b  fc 18 cb	  jsr ($cb18,x)
$16:df2e  ea			nop
$16:df2f  00 0c		 brk #$0c
$16:df31  ca			dex
$16:df32  18			clc
$16:df33  ca			dex
$16:df34  cb			wai
$16:df35  0c ca 18	  tsb $18ca
$16:df38  ca			dex
$16:df39  cb			wai
$16:df3a  ea			nop
$16:df3b  fc 0c cb	  jsr ($cb0c,x)
$16:df3e  ea			nop
$16:df3f  00 ca		 brk #$ca
$16:df41  18			clc
$16:df42  ca			dex
$16:df43  cb			wai
$16:df44  0c ca 18	  tsb $18ca
$16:df47  ca			dex
$16:df48  0c cb ea	  tsb $eacb
$16:df4b  fe cb ea	  inc $eacb,x
$16:df4e  fc cb ea	  jsr ($eacb,x)
$16:df51  fa			plx
$16:df52  cb			wai
$16:df53  ea			nop
$16:df54  00 18		 brk #$18
$16:df56  ca			dex
$16:df57  cb			wai
$16:df58  0c ca 18	  tsb $18ca
$16:df5b  ca			dex
$16:df5c  cb			wai
$16:df5d  ea			nop
$16:df5e  fc 0c cb	  jsr ($cb0c,x)
$16:df61  ea			nop
$16:df62  00 ca		 brk #$ca
$16:df64  18			clc
$16:df65  ca			dex
$16:df66  cb			wai
$16:df67  0c ca 18	  tsb $18ca
$16:df6a  ca			dex
$16:df6b  0c cb ea	  tsb $eacb
$16:df6e  fc 18 cb	  jsr ($cb18,x)
$16:df71  ea			nop
$16:df72  00 0c		 brk #$0c
$16:df74  ca			dex
$16:df75  18			clc
$16:df76  ca			dex
$16:df77  cb			wai
$16:df78  0c ca 18	  tsb $18ca
$16:df7b  ca			dex
$16:df7c  cb			wai
$16:df7d  ea			nop
$16:df7e  fc 0c cb	  jsr ($cb0c,x)
$16:df81  ea			nop
$16:df82  00 ca		 brk #$ca
$16:df84  18			clc
$16:df85  ca			dex
$16:df86  cb			wai
$16:df87  0c ca 18	  tsb $18ca
$16:df8a  ca			dex
$16:df8b  0c cb ea	  tsb $eacb
$16:df8e  fe cb ea	  inc $eacb,x
$16:df91  fc cb ea	  jsr ($eacb,x)
$16:df94  fa			plx
$16:df95  cb			wai
$16:df96  ea			nop
$16:df97  00 18		 brk #$18
$16:df99  ca			dex
$16:df9a  cb			wai
$16:df9b  0c ca 18	  tsb $18ca
$16:df9e  ca			dex
$16:df9f  cb			wai
$16:dfa0  ea			nop
$16:dfa1  fc 0c cb	  jsr ($cb0c,x)
$16:dfa4  ea			nop
$16:dfa5  00 ca		 brk #$ca
$16:dfa7  18			clc
$16:dfa8  ca			dex
$16:dfa9  cb			wai
$16:dfaa  0c ca 18	  tsb $18ca
$16:dfad  ca			dex
$16:dfae  0c cb ea	  tsb $eacb
$16:dfb1  fc 18 cb	  jsr ($cb18,x)
$16:dfb4  ea			nop
$16:dfb5  00 0c		 brk #$0c
$16:dfb7  ca			dex
$16:dfb8  18			clc
$16:dfb9  ca			dex
$16:dfba  cb			wai
$16:dfbb  0c ca 18	  tsb $18ca
$16:dfbe  ca			dex
$16:dfbf  cb			wai
$16:dfc0  ea			nop
$16:dfc1  fc 0c cb	  jsr ($cb0c,x)
$16:dfc4  ea			nop
$16:dfc5  00 ca		 brk #$ca
$16:dfc7  18			clc
$16:dfc8  ca			dex
$16:dfc9  cb			wai
$16:dfca  0c ca 18	  tsb $18ca
$16:dfcd  ca			dex
$16:dfce  0c cb ea	  tsb $eacb
$16:dfd1  fe cb ea	  inc $eacb,x
$16:dfd4  fc cb ea	  jsr ($eacb,x)
$16:dfd7  fa			plx
$16:dfd8  cb			wai
$16:dfd9  ea			nop
$16:dfda  00 18		 brk #$18
$16:dfdc  ca			dex
$16:dfdd  cb			wai
$16:dfde  0c ca 18	  tsb $18ca
$16:dfe1  ca			dex
$16:dfe2  cb			wai
$16:dfe3  ea			nop
$16:dfe4  fc 0c cb	  jsr ($cb0c,x)
$16:dfe7  ea			nop
$16:dfe8  00 ca		 brk #$ca
$16:dfea  18			clc
$16:dfeb  ca			dex
$16:dfec  cb			wai
$16:dfed  0c ca 18	  tsb $18ca
$16:dff0  ca			dex
$16:dff1  0c cb ea	  tsb $eacb
$16:dff4  fc 18 cb	  jsr ($cb18,x)
$16:dff7  ea			nop
$16:dff8  00 0c		 brk #$0c
$16:dffa  ca			dex
$16:dffb  18			clc
$16:dffc  ca			dex
$16:dffd  cb			wai
$16:dffe  0c ca 18	  tsb $18ca
$16:e001  ca			dex
$16:e002  cb			wai
$16:e003  ea			nop
$16:e004  fc 0c cb	  jsr ($cb0c,x)
$16:e007  ea			nop
$16:e008  00 ca		 brk #$ca
$16:e00a  18			clc
$16:e00b  ca			dex
$16:e00c  cb			wai
$16:e00d  0c ca 18	  tsb $18ca
$16:e010  ca			dex
$16:e011  0c cb ea	  tsb $eacb
$16:e014  fe cb ea	  inc $eacb,x
$16:e017  fc cb ea	  jsr ($eacb,x)
$16:e01a  fa			plx
$16:e01b  cb			wai
$16:e01c  ea			nop
$16:e01d  00 18		 brk #$18
$16:e01f  ca			dex
$16:e020  cb			wai
$16:e021  0c ca 18	  tsb $18ca
$16:e024  ca			dex
$16:e025  cb			wai
$16:e026  ea			nop
$16:e027  fc 0c cb	  jsr ($cb0c,x)
$16:e02a  ea			nop
$16:e02b  00 ca		 brk #$ca
$16:e02d  18			clc
$16:e02e  ca			dex
$16:e02f  cb			wai
$16:e030  0c ca 18	  tsb $18ca
$16:e033  ca			dex
$16:e034  0c cb ea	  tsb $eacb
$16:e037  fc 18 cb	  jsr ($cb18,x)
$16:e03a  ea			nop
$16:e03b  00 0c		 brk #$0c
$16:e03d  ca			dex
$16:e03e  18			clc
$16:e03f  ca			dex
$16:e040  cb			wai
$16:e041  0c ca 18	  tsb $18ca
$16:e044  ca			dex
$16:e045  cb			wai
$16:e046  ea			nop
$16:e047  fc 0c cb	  jsr ($cb0c,x)
$16:e04a  ea			nop
$16:e04b  00 ca		 brk #$ca
$16:e04d  18			clc
$16:e04e  ca			dex
$16:e04f  cb			wai
$16:e050  0c ca 18	  tsb $18ca
$16:e053  ca			dex
$16:e054  0c cb ea	  tsb $eacb
$16:e057  fe cb ea	  inc $eacb,x
$16:e05a  fc cb ea	  jsr ($eacb,x)
$16:e05d  fa			plx
$16:e05e  cb			wai
$16:e05f  ea			nop
$16:e060  00 18		 brk #$18
$16:e062  ca			dex
$16:e063  cb			wai
$16:e064  0c ca 18	  tsb $18ca
$16:e067  ca			dex
$16:e068  cb			wai
$16:e069  ea			nop
$16:e06a  fc 0c cb	  jsr ($cb0c,x)
$16:e06d  ea			nop
$16:e06e  00 ca		 brk #$ca
$16:e070  18			clc
$16:e071  ca			dex
$16:e072  cb			wai
$16:e073  0c ca 18	  tsb $18ca
$16:e076  ca			dex
$16:e077  0c cb ea	  tsb $eacb
$16:e07a  fc 18 cb	  jsr ($cb18,x)
$16:e07d  ea			nop
$16:e07e  00 0c		 brk #$0c
$16:e080  ca			dex
$16:e081  18			clc
$16:e082  ca			dex
$16:e083  cb			wai
$16:e084  0c ca 18	  tsb $18ca
$16:e087  ca			dex
$16:e088  cb			wai
$16:e089  ea			nop
$16:e08a  fc 0c cb	  jsr ($cb0c,x)
$16:e08d  ea			nop
$16:e08e  00 ca		 brk #$ca
$16:e090  18			clc
$16:e091  ca			dex
$16:e092  cb			wai
$16:e093  0c ca 18	  tsb $18ca
$16:e096  ca			dex
$16:e097  0c cb ea	  tsb $eacb
$16:e09a  fe cb ea	  inc $eacb,x
$16:e09d  fc cb ea	  jsr ($eacb,x)
$16:e0a0  fa			plx
$16:e0a1  cb			wai
$16:e0a2  ea			nop
$16:e0a3  00 18		 brk #$18
$16:e0a5  ca			dex
$16:e0a6  cb			wai
$16:e0a7  0c ca 18	  tsb $18ca
$16:e0aa  ca			dex
$16:e0ab  cb			wai
$16:e0ac  ea			nop
$16:e0ad  fc 0c cb	  jsr ($cb0c,x)
$16:e0b0  ea			nop
$16:e0b1  00 ca		 brk #$ca
$16:e0b3  18			clc
$16:e0b4  ca			dex
$16:e0b5  cb			wai
$16:e0b6  0c ca 18	  tsb $18ca
$16:e0b9  ca			dex
$16:e0ba  0c cb ea	  tsb $eacb
$16:e0bd  fc 18 cb	  jsr ($cb18,x)
$16:e0c0  ea			nop
$16:e0c1  00 0c		 brk #$0c
$16:e0c3  ca			dex
$16:e0c4  18			clc
$16:e0c5  ca			dex
$16:e0c6  cb			wai
$16:e0c7  0c ca 18	  tsb $18ca
$16:e0ca  ca			dex
$16:e0cb  cb			wai
$16:e0cc  ea			nop
$16:e0cd  fc 0c cb	  jsr ($cb0c,x)
$16:e0d0  ea			nop
$16:e0d1  00 ca		 brk #$ca
$16:e0d3  18			clc
$16:e0d4  ca			dex
$16:e0d5  cb			wai
$16:e0d6  0c ca 18	  tsb $18ca
$16:e0d9  ca			dex
$16:e0da  0c cb ea	  tsb $eacb
$16:e0dd  fe cb ea	  inc $eacb,x
$16:e0e0  fc cb ea	  jsr ($eacb,x)
$16:e0e3  fa			plx
$16:e0e4  cb			wai
$16:e0e5  ea			nop
$16:e0e6  00 18		 brk #$18
$16:e0e8  ca			dex
$16:e0e9  cb			wai
$16:e0ea  0c ca 18	  tsb $18ca
$16:e0ed  ca			dex
$16:e0ee  cb			wai
$16:e0ef  ea			nop
$16:e0f0  fc 0c cb	  jsr ($cb0c,x)
$16:e0f3  ea			nop
$16:e0f4  00 ca		 brk #$ca
$16:e0f6  18			clc
$16:e0f7  ca			dex
$16:e0f8  cb			wai
$16:e0f9  0c ca 18	  tsb $18ca
$16:e0fc  ca			dex
$16:e0fd  0c cb ea	  tsb $eacb
$16:e100  fc 18 cb	  jsr ($cb18,x)
$16:e103  ea			nop
$16:e104  00 0c		 brk #$0c
$16:e106  ca			dex
$16:e107  18			clc
$16:e108  ca			dex
$16:e109  cb			wai
$16:e10a  0c ca 18	  tsb $18ca
$16:e10d  ca			dex
$16:e10e  cb			wai
$16:e10f  ea			nop
$16:e110  fc 0c cb	  jsr ($cb0c,x)
$16:e113  ea			nop
$16:e114  00 ca		 brk #$ca
$16:e116  18			clc
$16:e117  ca			dex
$16:e118  cb			wai
$16:e119  0c ca 18	  tsb $18ca
$16:e11c  ca			dex
$16:e11d  0c cb ea	  tsb $eacb
$16:e120  fe cb ea	  inc $eacb,x
$16:e123  fc cb ea	  jsr ($eacb,x)
$16:e126  fa			plx
$16:e127  cb			wai
$16:e128  ea			nop
$16:e129  00 18		 brk #$18
$16:e12b  ca			dex
$16:e12c  cb			wai
$16:e12d  0c ca 18	  tsb $18ca
$16:e130  ca			dex
$16:e131  cb			wai
$16:e132  ea			nop
$16:e133  fc 0c cb	  jsr ($cb0c,x)
$16:e136  ea			nop
$16:e137  00 ca		 brk #$ca
$16:e139  18			clc
$16:e13a  ca			dex
$16:e13b  cb			wai
$16:e13c  0c ca 18	  tsb $18ca
$16:e13f  ca			dex
$16:e140  0c cb ea	  tsb $eacb
$16:e143  fc 18 cb	  jsr ($cb18,x)
$16:e146  ea			nop
$16:e147  00 0c		 brk #$0c
$16:e149  ca			dex
$16:e14a  00 ea		 brk #$ea
$16:e14c  00 e0		 brk #$e0
$16:e14e  00 ed		 brk #$ed
$16:e150  78			sei
$16:e151  e1 09		 sbc ($09,x)
$16:e153  e3 30		 sbc $30,s
$16:e155  46 40		 lsr $40
$16:e157  06 c9		 asl $c9
$16:e159  0c 5f 98	  tsb $985f
$16:e15c  0c 5d 9e	  tsb $9e5d
$16:e15f  a1 a7		 lda ($a7,x)
$16:e161  a1 98		 lda ($98,x)
$16:e163  9f a2 a8 a2   sta $a2a8a2,x
$16:e167  9f 0c 5f 98   sta $985f0c,x
$16:e16b  0c 5d 9e	  tsb $9e5d
$16:e16e  a1 a7		 lda ($a7,x)
$16:e170  a1 98		 lda ($98,x)
$16:e172  9f a2 0c 5b   sta $5b0ca2,x
$16:e176  a8			tay
$16:e177  0c 59 ae	  tsb $ae59
$16:e17a  0c 57 b4	  tsb $b457
$16:e17d  ea			nop
$16:e17e  ff 0c 5f 98   sbc $985f0c,x
$16:e182  0c 5d 9e	  tsb $9e5d
$16:e185  a1 a7		 lda ($a7,x)
$16:e187  a1 98		 lda ($98,x)
$16:e189  9f a2 a8 a2   sta $a2a8a2,x
$16:e18d  9f 0c 5f a4   sta $a45f0c,x
$16:e191  0c 5d aa	  tsb $aa5d
$16:e194  ad b3 ad	  lda $adb3
$16:e197  a4 ab		 ldy $ab
$16:e199  ae 0c 5b	  ldx $5b0c
$16:e19c  b4 0c		 ldy $0c,x
$16:e19e  59 ba 0c	  eor $0cba,y
$16:e1a1  57 c0		 eor [$c0],y
$16:e1a3  ea			nop
$16:e1a4  00 ea		 brk #$ea
$16:e1a6  05 0c		 ora $0c
$16:e1a8  5f 98 0c 5d   eor $5d0c98,x
$16:e1ac  9e a1 a7	  stz $a7a1,x
$16:e1af  a1 98		 lda ($98,x)
$16:e1b1  9f a2 a8 a2   sta $a2a8a2,x
$16:e1b5  9f 0c 5f a4   sta $a45f0c,x
$16:e1b9  0c 5d aa	  tsb $aa5d
$16:e1bc  ad b3 ad	  lda $adb3
$16:e1bf  a4 ab		 ldy $ab
$16:e1c1  ae 0c 5b	  ldx $5b0c
$16:e1c4  b4 0c		 ldy $0c,x
$16:e1c6  59 ba 0c	  eor $0cba,y
$16:e1c9  57 c0		 eor [$c0],y
$16:e1cb  ea			nop
$16:e1cc  00 ea		 brk #$ea
$16:e1ce  06 0c		 asl $0c
$16:e1d0  5f 98 0c 5d   eor $5d0c98,x
$16:e1d4  9e a1 a7	  stz $a7a1,x
$16:e1d7  a1 98		 lda ($98,x)
$16:e1d9  9f a2 a8 a2   sta $a2a8a2,x
$16:e1dd  9f 0c 5f a4   sta $a45f0c,x
$16:e1e1  0c 5d aa	  tsb $aa5d
$16:e1e4  ad b3 ad	  lda $adb3
$16:e1e7  a4 ab		 ldy $ab
$16:e1e9  ae 0c 5b	  ldx $5b0c
$16:e1ec  b4 0c		 ldy $0c,x
$16:e1ee  59 ba 0c	  eor $0cba,y
$16:e1f1  57 c0		 eor [$c0],y
$16:e1f3  ea			nop
$16:e1f4  00 ea		 brk #$ea
$16:e1f6  fe 0c 5f	  inc $5f0c,x
$16:e1f9  98			tya
$16:e1fa  0c 5d 9e	  tsb $9e5d
$16:e1fd  a1 a7		 lda ($a7,x)
$16:e1ff  a1 98		 lda ($98,x)
$16:e201  9f a2 a8 a2   sta $a2a8a2,x
$16:e205  9f 0c 5f a4   sta $a45f0c,x
$16:e209  0c 5d aa	  tsb $aa5d
$16:e20c  ad b3 ad	  lda $adb3
$16:e20f  a4 ab		 ldy $ab
$16:e211  ae 0c 5b	  ldx $5b0c
$16:e214  b4 0c		 ldy $0c,x
$16:e216  59 ba 0c	  eor $0cba,y
$16:e219  57 c0		 eor [$c0],y
$16:e21b  ea			nop
$16:e21c  00 ea		 brk #$ea
$16:e21e  fd 0c 5f	  sbc $5f0c,x
$16:e221  98			tya
$16:e222  0c 5d 9e	  tsb $9e5d
$16:e225  a1 a7		 lda ($a7,x)
$16:e227  a1 98		 lda ($98,x)
$16:e229  9f a2 a8 a2   sta $a2a8a2,x
$16:e22d  9f 0c 5f a4   sta $a45f0c,x
$16:e231  0c 5d aa	  tsb $aa5d
$16:e234  ad b3 ad	  lda $adb3
$16:e237  a4 ab		 ldy $ab
$16:e239  ae 0c 5b	  ldx $5b0c
$16:e23c  b4 0c		 ldy $0c,x
$16:e23e  59 ba 0c	  eor $0cba,y
$16:e241  57 c0		 eor [$c0],y
$16:e243  ea			nop
$16:e244  00 ea		 brk #$ea
$16:e246  ff 0c 5f 98   sbc $985f0c,x
$16:e24a  0c 5d 9e	  tsb $9e5d
$16:e24d  a1 a7		 lda ($a7,x)
$16:e24f  a1 98		 lda ($98,x)
$16:e251  9f a2 a8 a2   sta $a2a8a2,x
$16:e255  9f 0c 5f a4   sta $a45f0c,x
$16:e259  0c 5d aa	  tsb $aa5d
$16:e25c  ad b3 ad	  lda $adb3
$16:e25f  a4 ab		 ldy $ab
$16:e261  ae 0c 5b	  ldx $5b0c
$16:e264  b4 0c		 ldy $0c,x
$16:e266  59 ba 0c	  eor $0cba,y
$16:e269  57 c0		 eor [$c0],y
$16:e26b  ea			nop
$16:e26c  00 ea		 brk #$ea
$16:e26e  03 0c		 ora $0c,s
$16:e270  5f 98 0c 5d   eor $5d0c98,x
$16:e274  9e a1 a7	  stz $a7a1,x
$16:e277  a1 98		 lda ($98,x)
$16:e279  9f a2 a8 a2   sta $a2a8a2,x
$16:e27d  9f 0c 5f a4   sta $a45f0c,x
$16:e281  0c 5d aa	  tsb $aa5d
$16:e284  ad b3 ad	  lda $adb3
$16:e287  a4 ab		 ldy $ab
$16:e289  ae 0c 5b	  ldx $5b0c
$16:e28c  b4 0c		 ldy $0c,x
$16:e28e  59 ba 0c	  eor $0cba,y
$16:e291  57 c0		 eor [$c0],y
$16:e293  ea			nop
$16:e294  00 0c		 brk #$0c
$16:e296  5f 98 0c 5d   eor $5d0c98,x
$16:e29a  9e a1 a7	  stz $a7a1,x
$16:e29d  a1 98		 lda ($98,x)
$16:e29f  9f a2 a8 a2   sta $a2a8a2,x
$16:e2a3  9f 0c 5f a4   sta $a45f0c,x
$16:e2a7  0c 5d aa	  tsb $aa5d
$16:e2aa  ad b3 ad	  lda $adb3
$16:e2ad  a4 ab		 ldy $ab
$16:e2af  ae 0c 5b	  ldx $5b0c
$16:e2b2  b4 0c		 ldy $0c,x
$16:e2b4  59 ba 0c	  eor $0cba,y
$16:e2b7  57 c0		 eor [$c0],y
$16:e2b9  ea			nop
$16:e2ba  00 ea		 brk #$ea
$16:e2bc  ff 0c 5f 98   sbc $985f0c,x
$16:e2c0  0c 5d 9e	  tsb $9e5d
$16:e2c3  a1 a7		 lda ($a7,x)
$16:e2c5  a1 98		 lda ($98,x)
$16:e2c7  9f a2 a8 a2   sta $a2a8a2,x
$16:e2cb  9f 0c 5f a4   sta $a45f0c,x
$16:e2cf  0c 5d aa	  tsb $aa5d
$16:e2d2  ad b3 ad	  lda $adb3
$16:e2d5  a4 ab		 ldy $ab
$16:e2d7  ae 0c 5b	  ldx $5b0c
$16:e2da  b4 0c		 ldy $0c,x
$16:e2dc  59 ba 0c	  eor $0cba,y
$16:e2df  57 c0		 eor [$c0],y
$16:e2e1  ea			nop
$16:e2e2  00 ea		 brk #$ea
$16:e2e4  05 0c		 ora $0c
$16:e2e6  5f 98 0c 5d   eor $5d0c98,x
$16:e2ea  9e a1 a7	  stz $a7a1,x
$16:e2ed  a1 98		 lda ($98,x)
$16:e2ef  9f a2 a8 a2   sta $a2a8a2,x
$16:e2f3  9f 0c 5f a4   sta $a45f0c,x
$16:e2f7  0c 5d aa	  tsb $aa5d
$16:e2fa  ad b3 ad	  lda $adb3
$16:e2fd  a4 ab		 ldy $ab
$16:e2ff  ae 0c 5b	  ldx $5b0c
$16:e302  b4 0c		 ldy $0c,x
$16:e304  59 ba 0c	  eor $0cba,y
$16:e307  57 c0		 eor [$c0],y
$16:e309  ea			nop
$16:e30a  00 ea		 brk #$ea
$16:e30c  06 0c		 asl $0c
$16:e30e  5f 98 0c 5d   eor $5d0c98,x
$16:e312  9e a1 a7	  stz $a7a1,x
$16:e315  a1 98		 lda ($98,x)
$16:e317  9f a2 a8 a2   sta $a2a8a2,x
$16:e31b  9f 0c 5f a4   sta $a45f0c,x
$16:e31f  0c 5d aa	  tsb $aa5d
$16:e322  ad b3 ad	  lda $adb3
$16:e325  a4 ab		 ldy $ab
$16:e327  ae 0c 5b	  ldx $5b0c
$16:e32a  b4 0c		 ldy $0c,x
$16:e32c  59 ba 0c	  eor $0cba,y
$16:e32f  57 c0		 eor [$c0],y
$16:e331  ea			nop
$16:e332  00 ea		 brk #$ea
$16:e334  fe 0c 5f	  inc $5f0c,x
$16:e337  98			tya
$16:e338  0c 5d 9e	  tsb $9e5d
$16:e33b  a1 a7		 lda ($a7,x)
$16:e33d  a1 98		 lda ($98,x)
$16:e33f  9f a2 a8 a2   sta $a2a8a2,x
$16:e343  9f 0c 5f a4   sta $a45f0c,x
$16:e347  0c 5d aa	  tsb $aa5d
$16:e34a  ad b3 ad	  lda $adb3
$16:e34d  a4 ab		 ldy $ab
$16:e34f  ae b4 ba	  ldx $bab4
$16:e352  c0 ea 00	  cpy #$00ea
$16:e355  ea			nop
$16:e356  fd 0c 5f	  sbc $5f0c,x
$16:e359  98			tya
$16:e35a  0c 5d 9e	  tsb $9e5d
$16:e35d  a1 a7		 lda ($a7,x)
$16:e35f  a1 98		 lda ($98,x)
$16:e361  9f a2 a8 a2   sta $a2a8a2,x
$16:e365  9f 0c 5f a4   sta $a45f0c,x
$16:e369  0c 5d aa	  tsb $aa5d
$16:e36c  ad b3 ad	  lda $adb3
$16:e36f  a4 ab		 ldy $ab
$16:e371  ae 0c 5b	  ldx $5b0c
$16:e374  b4 0c		 ldy $0c,x
$16:e376  59 ba 0c	  eor $0cba,y
$16:e379  57 c0		 eor [$c0],y
$16:e37b  ea			nop
$16:e37c  00 ea		 brk #$ea
$16:e37e  ff 0c 5f 98   sbc $985f0c,x
$16:e382  0c 5d 9e	  tsb $9e5d
$16:e385  a1 a7		 lda ($a7,x)
$16:e387  a1 98		 lda ($98,x)
$16:e389  9f a2 a8 a2   sta $a2a8a2,x
$16:e38d  9f 0c 5f a4   sta $a45f0c,x
$16:e391  0c 5d aa	  tsb $aa5d
$16:e394  ad b3 ad	  lda $adb3
$16:e397  a4 ab		 ldy $ab
$16:e399  ae 0c 5b	  ldx $5b0c
$16:e39c  b4 0c		 ldy $0c,x
$16:e39e  59 ba 0c	  eor $0cba,y
$16:e3a1  57 c0		 eor [$c0],y
$16:e3a3  ea			nop
$16:e3a4  00 ea		 brk #$ea
$16:e3a6  03 0c		 ora $0c,s
$16:e3a8  5f 98 0c 5d   eor $5d0c98,x
$16:e3ac  9e a1 a7	  stz $a7a1,x
$16:e3af  a1 98		 lda ($98,x)
$16:e3b1  9f a2 a8 a2   sta $a2a8a2,x
$16:e3b5  9f 0c 5f a4   sta $a45f0c,x
$16:e3b9  0c 5d aa	  tsb $aa5d
$16:e3bc  ad b3 ad	  lda $adb3
$16:e3bf  a4 ab		 ldy $ab
$16:e3c1  ae 0c 5b	  ldx $5b0c
$16:e3c4  b4 0c		 ldy $0c,x
$16:e3c6  59 ba 0c	  eor $0cba,y
$16:e3c9  57 c0		 eor [$c0],y
$16:e3cb  ea			nop
$16:e3cc  00 ea		 brk #$ea
$16:e3ce  07 0c		 ora [$0c]
$16:e3d0  5f 98 0c 5d   eor $5d0c98,x
$16:e3d4  9e a1 a7	  stz $a7a1,x
$16:e3d7  a1 98		 lda ($98,x)
$16:e3d9  9f a2 a8 a2   sta $a2a8a2,x
$16:e3dd  9f 0c 5f a4   sta $a45f0c,x
$16:e3e1  0c 5d aa	  tsb $aa5d
$16:e3e4  ad b3 ad	  lda $adb3
$16:e3e7  a4 ab		 ldy $ab
$16:e3e9  ae 0c 5b	  ldx $5b0c
$16:e3ec  b4 0c		 ldy $0c,x
$16:e3ee  59 ba 0c	  eor $0cba,y
$16:e3f1  57 c0		 eor [$c0],y
$16:e3f3  ea			nop
$16:e3f4  00 ea		 brk #$ea
$16:e3f6  06 0c		 asl $0c
$16:e3f8  5f 98 0c 5d   eor $5d0c98,x
$16:e3fc  9e a1 a7	  stz $a7a1,x
$16:e3ff  a1 98		 lda ($98,x)
$16:e401  9f a2 a8 a2   sta $a2a8a2,x
$16:e405  9f 0c 5f a4   sta $a45f0c,x
$16:e409  0c 5d aa	  tsb $aa5d
$16:e40c  ad b3 ad	  lda $adb3
$16:e40f  a4 ab		 ldy $ab
$16:e411  ae 0c 5b	  ldx $5b0c
$16:e414  b4 0c		 ldy $0c,x
$16:e416  59 ba 06	  eor $06ba,y
$16:e419  57 c0		 eor [$c0],y
$16:e41b  ea			nop
$16:e41c  00 00		 brk #$00
$16:e41e  e0 03 ed	  cpx #$ed03
$16:e421  8c e1 0a	  sty $0ae1
$16:e424  0c 5f 98	  tsb $985f
$16:e427  0c 5d 9e	  tsb $9e5d
$16:e42a  a1 a7		 lda ($a7,x)
$16:e42c  a1 98		 lda ($98,x)
$16:e42e  9f a2 a8 a2   sta $a2a8a2,x
$16:e432  9f 0c 5f 98   sta $985f0c,x
$16:e436  0c 5d 9e	  tsb $9e5d
$16:e439  a1 a7		 lda ($a7,x)
$16:e43b  a1 98		 lda ($98,x)
$16:e43d  9f a2 0c 5b   sta $5b0ca2,x
$16:e441  a8			tay
$16:e442  0c 59 ae	  tsb $ae59
$16:e445  0c 57 b4	  tsb $b457
$16:e448  ea			nop
$16:e449  ff 0c 5f 98   sbc $985f0c,x
$16:e44d  0c 5d 9e	  tsb $9e5d
$16:e450  a1 a7		 lda ($a7,x)
$16:e452  a1 98		 lda ($98,x)
$16:e454  9f a2 a8 a2   sta $a2a8a2,x
$16:e458  9f 0c 5f a4   sta $a45f0c,x
$16:e45c  0c 5d aa	  tsb $aa5d
$16:e45f  ad b3 ad	  lda $adb3
$16:e462  a4 ab		 ldy $ab
$16:e464  ae 0c 5b	  ldx $5b0c
$16:e467  b4 0c		 ldy $0c,x
$16:e469  59 ba 0c	  eor $0cba,y
$16:e46c  57 c0		 eor [$c0],y
$16:e46e  ea			nop
$16:e46f  00 ea		 brk #$ea
$16:e471  05 0c		 ora $0c
$16:e473  5f 98 0c 5d   eor $5d0c98,x
$16:e477  9e a1 a7	  stz $a7a1,x
$16:e47a  a1 98		 lda ($98,x)
$16:e47c  9f a2 a8 a2   sta $a2a8a2,x
$16:e480  9f 0c 5f a4   sta $a45f0c,x
$16:e484  0c 5d aa	  tsb $aa5d
$16:e487  ad b3 ad	  lda $adb3
$16:e48a  a4 ab		 ldy $ab
$16:e48c  ae 0c 5b	  ldx $5b0c
$16:e48f  b4 0c		 ldy $0c,x
$16:e491  59 ba 0c	  eor $0cba,y
$16:e494  57 c0		 eor [$c0],y
$16:e496  ea			nop
$16:e497  00 ea		 brk #$ea
$16:e499  06 0c		 asl $0c
$16:e49b  5f 98 0c 5d   eor $5d0c98,x
$16:e49f  9e a1 a7	  stz $a7a1,x
$16:e4a2  a1 98		 lda ($98,x)
$16:e4a4  9f a2 a8 a2   sta $a2a8a2,x
$16:e4a8  9f 0c 5f a4   sta $a45f0c,x
$16:e4ac  0c 5d aa	  tsb $aa5d
$16:e4af  ad b3 ad	  lda $adb3
$16:e4b2  a4 ab		 ldy $ab
$16:e4b4  ae 0c 5b	  ldx $5b0c
$16:e4b7  b4 0c		 ldy $0c,x
$16:e4b9  59 ba 0c	  eor $0cba,y
$16:e4bc  57 c0		 eor [$c0],y
$16:e4be  ea			nop
$16:e4bf  00 ea		 brk #$ea
$16:e4c1  fe 0c 5f	  inc $5f0c,x
$16:e4c4  98			tya
$16:e4c5  0c 5d 9e	  tsb $9e5d
$16:e4c8  a1 a7		 lda ($a7,x)
$16:e4ca  a1 98		 lda ($98,x)
$16:e4cc  9f a2 a8 a2   sta $a2a8a2,x
$16:e4d0  9f 0c 5f a4   sta $a45f0c,x
$16:e4d4  0c 5d aa	  tsb $aa5d
$16:e4d7  ad b3 ad	  lda $adb3
$16:e4da  a4 ab		 ldy $ab
$16:e4dc  ae 0c 5b	  ldx $5b0c
$16:e4df  b4 0c		 ldy $0c,x
$16:e4e1  59 ba 0c	  eor $0cba,y
$16:e4e4  57 c0		 eor [$c0],y
$16:e4e6  ea			nop
$16:e4e7  00 ea		 brk #$ea
$16:e4e9  fd 0c 5f	  sbc $5f0c,x
$16:e4ec  98			tya
$16:e4ed  0c 5d 9e	  tsb $9e5d
$16:e4f0  a1 a7		 lda ($a7,x)
$16:e4f2  a1 98		 lda ($98,x)
$16:e4f4  9f a2 a8 a2   sta $a2a8a2,x
$16:e4f8  9f 0c 5f a4   sta $a45f0c,x
$16:e4fc  0c 5d aa	  tsb $aa5d
$16:e4ff  ad b3 ad	  lda $adb3
$16:e502  a4 ab		 ldy $ab
$16:e504  ae 0c 5b	  ldx $5b0c
$16:e507  b4 0c		 ldy $0c,x
$16:e509  59 ba 0c	  eor $0cba,y
$16:e50c  57 c0		 eor [$c0],y
$16:e50e  ea			nop
$16:e50f  00 ea		 brk #$ea
$16:e511  ff 0c 5f 98   sbc $985f0c,x
$16:e515  0c 5d 9e	  tsb $9e5d
$16:e518  a1 a7		 lda ($a7,x)
$16:e51a  a1 98		 lda ($98,x)
$16:e51c  9f a2 a8 a2   sta $a2a8a2,x
$16:e520  9f 0c 5f a4   sta $a45f0c,x
$16:e524  0c 5d aa	  tsb $aa5d
$16:e527  ad b3 ad	  lda $adb3
$16:e52a  a4 ab		 ldy $ab
$16:e52c  ae 0c 5b	  ldx $5b0c
$16:e52f  b4 0c		 ldy $0c,x
$16:e531  59 ba 0c	  eor $0cba,y
$16:e534  57 c0		 eor [$c0],y
$16:e536  ea			nop
$16:e537  00 ea		 brk #$ea
$16:e539  03 0c		 ora $0c,s
$16:e53b  5f 98 0c 5d   eor $5d0c98,x
$16:e53f  9e a1 a7	  stz $a7a1,x
$16:e542  a1 98		 lda ($98,x)
$16:e544  9f a2 a8 a2   sta $a2a8a2,x
$16:e548  9f 0c 5f a4   sta $a45f0c,x
$16:e54c  0c 5d aa	  tsb $aa5d
$16:e54f  ad b3 ad	  lda $adb3
$16:e552  a4 ab		 ldy $ab
$16:e554  ae 0c 5b	  ldx $5b0c
$16:e557  b4 0c		 ldy $0c,x
$16:e559  59 ba 0c	  eor $0cba,y
$16:e55c  57 c0		 eor [$c0],y
$16:e55e  ea			nop
$16:e55f  00 0c		 brk #$0c
$16:e561  5f 98 0c 5d   eor $5d0c98,x
$16:e565  9e a1 a7	  stz $a7a1,x
$16:e568  a1 98		 lda ($98,x)
$16:e56a  9f a2 a8 a2   sta $a2a8a2,x
$16:e56e  9f 0c 5f a4   sta $a45f0c,x
$16:e572  0c 5d aa	  tsb $aa5d
$16:e575  ad b3 ad	  lda $adb3
$16:e578  a4 ab		 ldy $ab
$16:e57a  ae 0c 5b	  ldx $5b0c
$16:e57d  b4 0c		 ldy $0c,x
$16:e57f  59 ba 0c	  eor $0cba,y
$16:e582  57 c0		 eor [$c0],y
$16:e584  ea			nop
$16:e585  00 ea		 brk #$ea
$16:e587  ff 0c 5f 98   sbc $985f0c,x
$16:e58b  0c 5d 9e	  tsb $9e5d
$16:e58e  a1 a7		 lda ($a7,x)
$16:e590  a1 98		 lda ($98,x)
$16:e592  9f a2 a8 a2   sta $a2a8a2,x
$16:e596  9f 0c 5f a4   sta $a45f0c,x
$16:e59a  0c 5d aa	  tsb $aa5d
$16:e59d  ad b3 ad	  lda $adb3
$16:e5a0  a4 ab		 ldy $ab
$16:e5a2  ae 0c 5b	  ldx $5b0c
$16:e5a5  b4 0c		 ldy $0c,x
$16:e5a7  59 ba 0c	  eor $0cba,y
$16:e5aa  57 c0		 eor [$c0],y
$16:e5ac  ea			nop
$16:e5ad  00 ea		 brk #$ea
$16:e5af  05 0c		 ora $0c
$16:e5b1  5f 98 0c 5d   eor $5d0c98,x
$16:e5b5  9e a1 a7	  stz $a7a1,x
$16:e5b8  a1 98		 lda ($98,x)
$16:e5ba  9f a2 a8 a2   sta $a2a8a2,x
$16:e5be  9f 0c 5f a4   sta $a45f0c,x
$16:e5c2  0c 5d aa	  tsb $aa5d
$16:e5c5  ad b3 ad	  lda $adb3
$16:e5c8  a4 ab		 ldy $ab
$16:e5ca  ae 0c 5b	  ldx $5b0c
$16:e5cd  b4 0c		 ldy $0c,x
$16:e5cf  59 ba 0c	  eor $0cba,y
$16:e5d2  57 c0		 eor [$c0],y
$16:e5d4  ea			nop
$16:e5d5  00 ea		 brk #$ea
$16:e5d7  06 0c		 asl $0c
$16:e5d9  5f 98 0c 5d   eor $5d0c98,x
$16:e5dd  9e a1 a7	  stz $a7a1,x
$16:e5e0  a1 98		 lda ($98,x)
$16:e5e2  9f a2 a8 a2   sta $a2a8a2,x
$16:e5e6  9f 0c 5f a4   sta $a45f0c,x
$16:e5ea  0c 5d aa	  tsb $aa5d
$16:e5ed  ad b3 ad	  lda $adb3
$16:e5f0  a4 ab		 ldy $ab
$16:e5f2  ae 0c 5b	  ldx $5b0c
$16:e5f5  b4 0c		 ldy $0c,x
$16:e5f7  59 ba 0c	  eor $0cba,y
$16:e5fa  57 c0		 eor [$c0],y
$16:e5fc  ea			nop
$16:e5fd  00 ea		 brk #$ea
$16:e5ff  fe 0c 5f	  inc $5f0c,x
$16:e602  98			tya
$16:e603  0c 5d 9e	  tsb $9e5d
$16:e606  a1 a7		 lda ($a7,x)
$16:e608  a1 98		 lda ($98,x)
$16:e60a  9f a2 a8 a2   sta $a2a8a2,x
$16:e60e  9f 0c 5f a4   sta $a45f0c,x
$16:e612  0c 5d aa	  tsb $aa5d
$16:e615  ad b3 ad	  lda $adb3
$16:e618  a4 ab		 ldy $ab
$16:e61a  ae b4 ba	  ldx $bab4
$16:e61d  c0 ea 00	  cpy #$00ea
$16:e620  ea			nop
$16:e621  fd 0c 5f	  sbc $5f0c,x
$16:e624  98			tya
$16:e625  0c 5d 9e	  tsb $9e5d
$16:e628  a1 a7		 lda ($a7,x)
$16:e62a  a1 98		 lda ($98,x)
$16:e62c  9f a2 a8 a2   sta $a2a8a2,x
$16:e630  9f 0c 5f a4   sta $a45f0c,x
$16:e634  0c 5d aa	  tsb $aa5d
$16:e637  ad b3 ad	  lda $adb3
$16:e63a  a4 ab		 ldy $ab
$16:e63c  ae 0c 5b	  ldx $5b0c
$16:e63f  b4 0c		 ldy $0c,x
$16:e641  59 ba 0c	  eor $0cba,y
$16:e644  57 c0		 eor [$c0],y
$16:e646  ea			nop
$16:e647  00 ea		 brk #$ea
$16:e649  ff 0c 5f 98   sbc $985f0c,x
$16:e64d  0c 5d 9e	  tsb $9e5d
$16:e650  a1 a7		 lda ($a7,x)
$16:e652  a1 98		 lda ($98,x)
$16:e654  9f a2 a8 a2   sta $a2a8a2,x
$16:e658  9f 0c 5f a4   sta $a45f0c,x
$16:e65c  0c 5d aa	  tsb $aa5d
$16:e65f  ad b3 ad	  lda $adb3
$16:e662  a4 ab		 ldy $ab
$16:e664  ae 0c 5b	  ldx $5b0c
$16:e667  b4 0c		 ldy $0c,x
$16:e669  59 ba 0c	  eor $0cba,y
$16:e66c  57 c0		 eor [$c0],y
$16:e66e  ea			nop
$16:e66f  00 ea		 brk #$ea
$16:e671  03 0c		 ora $0c,s
$16:e673  5f 98 0c 5d   eor $5d0c98,x
$16:e677  9e a1 a7	  stz $a7a1,x
$16:e67a  a1 98		 lda ($98,x)
$16:e67c  9f a2 a8 a2   sta $a2a8a2,x
$16:e680  9f 0c 5f a4   sta $a45f0c,x
$16:e684  0c 5d aa	  tsb $aa5d
$16:e687  ad b3 ad	  lda $adb3
$16:e68a  a4 ab		 ldy $ab
$16:e68c  ae 0c 5b	  ldx $5b0c
$16:e68f  b4 0c		 ldy $0c,x
$16:e691  59 ba 0c	  eor $0cba,y
$16:e694  57 c0		 eor [$c0],y
$16:e696  ea			nop
$16:e697  00 ea		 brk #$ea
$16:e699  07 0c		 ora [$0c]
$16:e69b  5f 98 0c 5d   eor $5d0c98,x
$16:e69f  9e a1 a7	  stz $a7a1,x
$16:e6a2  a1 98		 lda ($98,x)
$16:e6a4  9f a2 a8 a2   sta $a2a8a2,x
$16:e6a8  9f 0c 5f a4   sta $a45f0c,x
$16:e6ac  0c 5d aa	  tsb $aa5d
$16:e6af  ad b3 ad	  lda $adb3
$16:e6b2  a4 ab		 ldy $ab
$16:e6b4  ae 0c 5b	  ldx $5b0c
$16:e6b7  b4 0c		 ldy $0c,x
$16:e6b9  59 ba 0c	  eor $0cba,y
$16:e6bc  57 c0		 eor [$c0],y
$16:e6be  ea			nop
$16:e6bf  00 ea		 brk #$ea
$16:e6c1  06 0c		 asl $0c
$16:e6c3  5f 98 0c 5d   eor $5d0c98,x
$16:e6c7  9e a1 a7	  stz $a7a1,x
$16:e6ca  a1 98		 lda ($98,x)
$16:e6cc  9f a2 a8 a2   sta $a2a8a2,x
$16:e6d0  9f 0c 5f a4   sta $a45f0c,x
$16:e6d4  0c 5d aa	  tsb $aa5d
$16:e6d7  ad b3 ad	  lda $adb3
$16:e6da  a4 ab		 ldy $ab
$16:e6dc  ae 0c 5b	  ldx $5b0c
$16:e6df  b4 0c		 ldy $0c,x
$16:e6e1  59 ba 0c	  eor $0cba,y
$16:e6e4  57 c0		 eor [$c0],y
$16:e6e6  ea			nop
$16:e6e7  00 00		 brk #$00
$16:e6e9  00 1c		 brk #$1c
$16:e6eb  00 34		 brk #$34
$16:e6ed  2c 53 73	  bit $7353
$16:e6f0  6e 73 67	  ror $6773
$16:e6f3  89 9d 89	  bit #$899d
$16:e6f6  b8			clv
$16:e6f7  89 e7 8d	  bit #$8de7
$16:e6fa  b4 9c		 ldy $9c,x
$16:e6fc  b4 9c		 ldy $9c,x
$16:e6fe  87 a5		 sta [$a5]
$16:e700  87 a5		 sta [$a5]
$16:e702  ec a9 ec	  cpx $eca9
$16:e705  a9 d6 b3	  lda #$b3d6
$16:e708  d6 b3		 dec $b3,x
$16:e70a  02 00		 cop #$00
$16:e70c  fd 0f b8	  sbc $b80f,x
$16:e70f  b6 00		 ldx $00,y
$16:e711  00 07		 brk #$07
$16:e713  1f 14 11 0f   ora $0f1114,x
$16:e717  18			clc
$16:e718  19 1a 00	  ora $001a,y
$16:e71b  20 81 40	  jsr $4081
$16:e71e  a0 90 48	  ldy #$4890
$16:e721  2c 16 02	  bit $0216
$16:e724  f5 68		 sbc $68,x
$16:e726  1c 01 fe	  trb $fe01
$16:e729  30 10		 bmi $e73b
$16:e72b  13 bf		 ora ($bf,s),y
$16:e72d  8b			phb
$16:e72e  01 80		 ora ($80,x)
$16:e730  7f 93 fc 2a   adc $2afc93,x
$16:e734  15 08		 ora $08,x
$16:e736  05 02		 ora $02
$16:e738  21 d0		 and ($d0,x)
$16:e73a  07 8d		 ora [$8d]
$16:e73c  02 81		 cop #$81
$16:e73e  c0 c0 09	  cpy #$09c0
$16:e741  04 20		 tsb $20
$16:e743  11 00		 ora ($00),y
$16:e745  8a			txa
$16:e746  c4 22		 cpy $22
$16:e748  10 91		 bpl $e6db
$16:e74a  a8			tay
$16:e74b  c2 21		 rep #$21
$16:e74d  8f 10 a2 5d   sta $5da210
$16:e751  85 e7		 sta $e7
$16:e753  20 94 4c	  jsr $4c94
$16:e756  23 13		 and $13,s
$16:e758  08			php
$16:e759  61 20		 adc ($20,x)
$16:e75b  23 10		 and $10,s
$16:e75d  68			pla
$16:e75e  40			rti
$16:e75f  4d 1f e4	  eor $e41f
$16:e762  11 00		 ora ($00),y
$16:e764  8b			phb
$16:e765  17 a9		 ora [$a9],y
$16:e767  fc 10 a8	  jsr ($a810,x)
$16:e76a  3c 12 1b	  bit $1b12,x
$16:e76d  31 95		 and ($95),y
$16:e76f  4d 21 fb	  eor $fb21
$16:e772  7c 7c ca	  jmp ($ca7c,x)
$16:e775  5d 32 97	  eor $9732,x
$16:e778  83 06		 sta $06,s
$16:e77a  1f 02 87 c1   ora $c18702,x
$16:e77e  23 f3		 and $f3,s
$16:e780  08			php
$16:e781  7a			ply
$16:e782  1c 22 30	  trb $3022
$16:e785  f8			sed
$16:e786  04 7c		 tsb $7c
$16:e788  24 1a		 bit $1a
$16:e78a  01 28		 ora ($28,x)
$16:e78c  70 29		 bvs $e7b7
$16:e78e  1d 8b 07	  ora $078b,x
$16:e791  c3 45		 cmp $45,s
$16:e793  b2 b4		 lda ($b4)
$16:e795  5e 3b 1e	  lsr $1e3b,x
$16:e798  81 00		 sta ($00,x)
$16:e79a  f8			sed
$16:e79b  24 0a		 bit $0a
$16:e79d  20 f8 40	  jsr $40f8
$16:e7a0  3e 14 0f	  rol $0f14,x
$16:e7a3  86 01		 stx $01
$16:e7a5  4c 26 f4	  jmp $f426
$16:e7a8  88			dey
$16:e7a9  c2 8e		 rep #$8e
$16:e7ab  e1 37		 sbc ($37,x)
$16:e7ad  87 d4		 sta [$d4]
$16:e7af  a9 c7 df	  lda #$dfc7
$16:e7b2  47 2d		 eor [$2d]
$16:e7b4  03 a0		 ora $a0,s
$16:e7b6  97 0d		 sta [$0d],y
$16:e7b8  46 e2		 lsr $e2
$16:e7ba  c9 74 4e	  cmp #$4e74
$16:e7bd  fa			plx
$16:e7be  b9 4e be	  lda $be4e,y
$16:e7c1  86 f4		 stx $f4
$16:e7c3  bf aa 16 01   lda $0116aa,x
$16:e7c7  00 a0		 brk #$a0
$16:e7c9  60			rts
$16:e7ca  1c 61 a0	  trb $a061
$16:e7cd  e0 54 2c	  cpx #$2c54
$16:e7d0  1e ef 97	  asl $97ef,x
$16:e7d3  5a			phy
$16:e7d4  f1 cf		 sbc ($cf),y
$16:e7d6  9e 0b c2	  stz $c20b,x
$16:e7d9  01 c0		 ora ($c0,x)
$16:e7db  20 8f 81	  jsr $818f
$16:e7de  56 10		 lsr $10,x
$16:e7e0  1f e6 02 fd   ora $fd02e6,x
$16:e7e4  80 bf		 bra $e7a5
$16:e7e6  8f c4 9e 72   sta $729ec4
$16:e7ea  09 01 4e	  ora #$4e01
$16:e7ed  09 e5 40	  ora #$40e5
$16:e7f0  6f 81 50 a2   adc $a25081
$16:e7f4  04 f6		 tsb $f6
$16:e7f6  17 84		 ora [$84],y
$16:e7f8  1a			inc a
$16:e7f9  0d 08 84	  ora $8408
$16:e7fc  44 62 26	  mvp $26,$62
$16:e7ff  f9 80 42	  sbc $4280,y
$16:e802  20 d1 48	  jsr $48d1
$16:e805  71 ec		 adc ($ec),y
$16:e807  2c 1a 02	  bit $021a
$16:e80a  08			php
$16:e80b  0d 4b cd	  ora $cd4b
$16:e80e  f8			sed
$16:e80f  ed df 39	  sbc $39df
$16:e812  b3 61		 lda ($61,s),y
$16:e814  fc 40 3f	  jsr ($3f40,x)
$16:e817  c4 d0		 cpy $d0
$16:e819  26 c1		 rol $c1
$16:e81b  e4 2b		 cpx $2b
$16:e81d  15 83		 ora $83,x
$16:e81f  c8			iny
$16:e820  4b			phk
$16:e821  2c 66 f8	  bit $f866
$16:e824  80 8f		 bra $e7b5
$16:e826  c6 42		 dec $42
$16:e828  6e 58 c4	  ror $c458
$16:e82b  63 a1		 adc $a1,s
$16:e82d  d0 2b		 bne $e85a
$16:e82f  85 00		 sta $00
$16:e831  62 06 92	  per $7a3a
$16:e834  69 14 02	  adc #$0214
$16:e837  21 08		 and ($08,x)
$16:e839  90 46		 bcc $e881
$16:e83b  2a			rol a
$16:e83c  13 0d		 ora ($0d,s),y
$16:e83e  05 c2		 ora $c2
$16:e840  01 03		 ora ($03,x)
$16:e842  82 3c 02	  brl $ea81
$16:e845  05 09		 ora $09
$16:e847  83 c2		 sta $c2,s
$16:e849  1e c3 0a	  asl $0ac3,x
$16:e84c  82 c3 60	  brl $4912
$16:e84f  4c 92 80	  jmp $8092
$16:e852  40			rti
$16:e853  59 20 ff	  eor $ff20,y
$16:e856  38			sec
$16:e857  14 02		 trb $02
$16:e859  0f 20 d0 50   ora $50d020
$16:e85d  30 01		 bmi $e860
$16:e85f  10 90		 bpl $e7f1
$16:e861  70 02		 bvs $e865
$16:e863  a4 10		 ldy $10
$16:e865  0b			phd
$16:e866  03 79		 ora $79,s
$16:e868  43 ea		 eor $ea,s
$16:e86a  69 0e 05	  adc #$050e
$16:e86d  06 fd		 asl $fd
$16:e86f  00 87		 brk #$87
$16:e871  c4 23		 cpy $23
$16:e873  71 28		 adc ($28),y
$16:e875  dc 40 64	  jml [$6440]
$16:e878  10 f8		 bpl $e872
$16:e87a  ac 2a 29	  ldy $292a
$16:e87d  0b			phd
$16:e87e  44 81 60	  mvp $60,$81
$16:e881  5e 60 f3	  lsr $f360,x
$16:e884  00 f9		 brk #$f9
$16:e886  41 41		 eor ($41,x)
$16:e888  a0 28 43	  ldy #$4328
$16:e88b  48			pha
$16:e88c  04 48		 tsb $48
$16:e88e  22 0a 40 2f   jsl $2f400a
$16:e892  6e 02 21	  ror $2102
$16:e895  2f ac 59 e5   and $e559ac
$16:e899  13 73		 ora ($73,s),y
$16:e89b  78			sei
$16:e89c  42 26		 wdm #$26
$16:e89e  f1 d9		 sbc ($d9),y
$16:e8a0  14 9e		 trb $9e
$16:e8a2  91 21		 sta ($21),y
$16:e8a4  e3 40		 sbc $40,s
$16:e8a6  23 f2		 and $f2,s
$16:e8a8  09 fc c1	  ora #$c1fc
$16:e8ab  04 23		 tsb $23
$16:e8ad  10 43		 bpl $e8f2
$16:e8af  89 38 20	  bit #$2038
$16:e8b2  39 0f 44	  and $440f,y
$16:e8b5  53 d9		 eor ($d9,s),y
$16:e8b7  28			plp
$16:e8b8  ec 4c 39	  cpx $394c
$16:e8bb  10 0f		 bpl $e8cc
$16:e8bd  c4 43		 cpy $43
$16:e8bf  d1 a8		 cmp ($a8),y
$16:e8c1  a2 52 30	  ldx #$3052
$16:e8c4  d0 0f		 bne $e8d5
$16:e8c6  84 23		 sty $23
$16:e8c8  f1 18		 sbc ($18),y
$16:e8ca  51 0c		 eor ($0c),y
$16:e8cc  03 c0		 ora $c0,s
$16:e8ce  a7 3a		 lda [$3a]
$16:e8d0  05 42		 ora $42
$16:e8d2  df 18 93 da   cmp $da9318,x
$16:e8d6  2e e6 f0	  rol $f0e6
$16:e8d9  82 4e cf	  brl $b82a
$16:e8dc  21 2f		 and ($2f,x)
$16:e8de  a0 49 b8	  ldy #$b849
$16:e8e1  30 08		 bmi $e8eb
$16:e8e3  fd 81 05	  sbc $0581,x
$16:e8e6  50 2c		 bvc $e914
$16:e8e8  a7 b1		 lda [$b1]
$16:e8ea  32 12		 and ($12)
$16:e8ec  ce e2 64	  dec $64e2
$16:e8ef  12 e0		 ora ($e0)
$16:e8f1  95 0b		 sta $0b,x
$16:e8f3  46 13		 lsr $13
$16:e8f5  90 3f		 bcc $e936
$16:e8f7  0f 84 31 45   ora $453184
$16:e8fb  1c 03 6b	  trb $6b03
$16:e8fe  45 25		 eor $25
$16:e900  67 70		 adc [$70]
$16:e902  8d 49 65	  sta $6549
$16:e905  d4 19		 pei ($19)
$16:e907  2f 09 7e 08   and $087e09
$16:e90b  1b			tcs
$16:e90c  82 a3 d1	  brl $bab2
$16:e90f  32 12		 and ($12)
$16:e911  04 a0		 tsb $a0
$16:e913  fa			plx
$16:e914  20 89 dd	  jsr $dd89
$16:e917  2e 8f 26	  rol $268f
$16:e91a  6d e6 8c	  adc $8ce6
$16:e91d  de 30 f6	  dec $f630,x
$16:e920  8d bc e7	  sta $e7bc
$16:e923  ed 56 ed	  sbc $ed56
$16:e926  44 ad 98	  mvp $98,$ad
$16:e929  1c 36 02	  trb $0236
$16:e92c  ff 00 ff 48   sbc $48ff00,x
$16:e930  3f 17 0f 85   and $850f17,x
$16:e934  c2 e1		 rep #$e1
$16:e936  21 2f		 and ($2f,x)
$16:e938  1f 1a 83 00   ora $00831a,x
$16:e93c  ff 94 4b 03   sbc $034b94,x
$16:e940  7e bf 40	  ror $40bf,x
$16:e943  24 12		 bit $12
$16:e945  02 50		 cop #$50
$16:e947  54 27 10	  mvn $10,$27
$16:e94a  12 51		 ora ($51)
$16:e94c  92 83		 sta ($83)
$16:e94e  01 00		 ora ($00,x)
$16:e950  a0 12 86	  ldy #$8612
$16:e953  41 60		 eor ($60,x)
$16:e955  e0 3b 03	  cpx #$033b
$16:e958  f1 80		 sbc ($80),y
$16:e95a  fe 74 2b	  inc $2b74,x
$16:e95d  90 c2		 bcc $e921
$16:e95f  51 da		 eor ($da),y
$16:e961  23 9c		 and $9c,s
$16:e963  09 e1 9c	  ora #$9ce1
$16:e966  0d a2 83	  ora $83a2
$16:e969  24 18		 bit $18
$16:e96b  f9 e3 1f	  sbc $1fe3,y
$16:e96e  a8			tay
$16:e96f  28			plp
$16:e970  cd 2c db	  cmp $db2c
$16:e973  8c 97 b2	  sty $b297
$16:e976  c3 66		 cmp $66,s
$16:e978  1f c2 21 38   ora $3821c2,x
$16:e97c  34 f2		 bit $f2,x
$16:e97e  89 40 ff	  bit #$ff40
$16:e981  90 cf		 bcc $e952
$16:e983  87 e2		 sta [$e2]
$16:e985  b1 06		 lda ($06),y
$16:e987  6f 04 02 87   adc $870204
$16:e98b  30 44		 bmi $e9d1
$16:e98d  2b			pld
$16:e98e  05 b6		 ora $b6
$16:e990  16 cc		 asl $cc,x
$16:e992  e6 c2		 inc $c2
$16:e994  61 10		 adc ($10,x)
$16:e996  60			rts
$16:e997  be 00 d6	  ldx $d600,y
$16:e99a  4c 19 82	  jmp $8219
$16:e99d  40			rti
$16:e99e  e1 30		 sbc ($30,x)
$16:e9a0  78			sei
$16:e9a1  24 3e		 bit $3e
$16:e9a3  33 0e		 and ($0e,s),y
$16:e9a5  92 45		 sta ($45)
$16:e9a7  e9 b3 ed	  sbc #$edb3
$16:e9aa  9d b3 bb	  sta $bbb3,x
$16:e9ad  63 80		 adc $80,s
$16:e9af  41 e0		 eor ($e0,x)
$16:e9b1  10 f0		 bpl $e9a3
$16:e9b3  08			php
$16:e9b4  c7 e5		 cmp [$e5]
$16:e9b6  13 f9		 ora ($f9,s),y
$16:e9b8  04 fe		 tsb $fe
$16:e9ba  43 3f		 eor $3f,s
$16:e9bc  91 cf		 sta ($cf),y
$16:e9be  e8			inx
$16:e9bf  18			clc
$16:e9c0  0d 07 02	  ora $0207
$16:e9c3  81 e0		 sta ($e0,x)
$16:e9c5  a8			tay
$16:e9c6  70 39		 bvs $ea01
$16:e9c8  1d 09 e6	  ora $e609,x
$16:e9cb  83 55		 sta $55,s
$16:e9cd  44 bf 61	  mvp $61,$bf
$16:e9d0  20 07 20	  jsr $2007
$16:e9d3  f0 08		 beq $e9dd
$16:e9d5  42 41		 wdm #$41
$16:e9d7  f0 94		 beq $e96d
$16:e9d9  2e 43 c1	  rol $c143
$16:e9dc  38			sec
$16:e9dd  e8			inx
$16:e9de  6e 39 10	  ror $1039
$16:e9e1  c7 85		 cmp [$85]
$16:e9e3  e7 5f		 sbc [$5f]
$16:e9e5  df 40 d0 04   cmp $04d040,x
$16:e9e9  53 80		 eor ($80,s),y
$16:e9eb  18			clc
$16:e9ec  3b			tsc
$16:e9ed  d0 79		 bne $ea68
$16:e9ef  c4 a0		 cpy $a0
$16:e9f1  29 45 e8	  and #$e845
$16:e9f4  1b			tcs
$16:e9f5  e2 80		 sep #$80
$16:e9f7  e0 7c 01	  cpx #$017c
$16:e9fa  e8			inx
$16:e9fb  10 c2		 bpl $e9bf
$16:e9fd  79 16 f0	  adc $f016,y
$16:ea00  21 40		 and ($40,x)
$16:ea02  ed e8 74	  sbc $74e8
$16:ea05  37 a7		 and [$a7],y
$16:ea07  22 0e f1 08   jsl $08f10e
$16:ea0b  44 19 66	  mvp $66,$19
$16:ea0e  2b			pld
$16:ea0f  20 5c 0c	  jsr $0c5c
$16:ea12  16 06		 asl $06,x
$16:ea14  95 08		 sta $08,x
$16:ea16  0a			asl a
$16:ea17  fc 98 2a	  jsr ($2a98,x)
$16:ea1a  be 09 37	  ldx $3709,y
$16:ea1d  02 40		 cop #$40
$16:ea1f  d0 9b		 bne $e9bc
$16:ea21  06 80		 asl $80
$16:ea23  df 4a b4 87   cmp $87b44a,x
$16:ea27  41 e2		 eor ($e2,x)
$16:ea29  10 98		 bpl $e9c3
$16:ea2b  84 2e		 sty $2e
$16:ea2d  21 1f		 and ($1f,x)
$16:ea2f  7b			tdc
$16:ea30  84 4a		 sty $4a
$16:ea32  1f 54 a7 a5   ora $a5a754,x
$16:ea36  42 0d		 wdm #$0d
$16:ea38  00 82		 brk #$82
$16:ea3a  00 45		 brk #$45
$16:ea3c  2a			rol a
$16:ea3d  10 26		 bpl $ea65
$16:ea3f  70 00		 bvs $ea41
$16:ea41  06 8d		 asl $8d
$16:ea43  80 a0		 bra $e9e5
$16:ea45  04 1d		 tsb $1d
$16:ea47  0a			asl a
$16:ea48  09 05 6f	  ora #$6f05
$16:ea4b  d8			cld
$16:ea4c  44 24 1e	  mvp $1e,$24
$16:ea4f  02 88		 cop #$88
$16:ea51  54 2c 1e	  mvn $1e,$2c
$16:ea54  cf 87 5a f1   cmp $f15a87
$16:ea58  cf 9e 1b c4   cmp $c41b9e
$16:ea5c  c0 06 01	  cpy #$0106
$16:ea5f  c0 7c 20	  cpy #$207c
$16:ea62  1f cc 05 fb   ora $fb05cc,x
$16:ea66  01 7f		 ora ($7f,x)
$16:ea68  37 c4		 and [$c4],y
$16:ea6a  18			clc
$16:ea6b  02 10		 cop #$10
$16:ea6d  09 04 81	  ora #$8104
$16:ea70  bf 92 08 80   lda $800892,x
$16:ea74  a5 e8		 lda $e8
$16:ea76  05 90		 ora $90
$16:ea78  84 42		 sty $42
$16:ea7a  22 06 e7 7f   jsl $7fe706
$16:ea7e  92 cc		 sta ($cc)
$16:ea80  22 90 e3 d8   jsl $d8e390
$16:ea84  37 47		 and [$47],y
$16:ea86  80 35		 bra $eabd
$16:ea88  2f 47 c3 bd   and $bdc347
$16:ea8c  78			sei
$16:ea8d  e5 8f		 sbc $8f
$16:ea8f  9f 03 f0 83   sta $83f003,x
$16:ea93  7e 09 78	  ror $7809,x
$16:ea96  b8			clv
$16:ea97  f6 4f		 inc $4f,x
$16:ea99  96 c2		 stx $c2,y
$16:ea9b  31 18		 and ($18),y
$16:ea9d  67 ec		 adc [$ec]
$16:ea9f  02 2b		 cop #$2b
$16:eaa1  2f a6 55 e6   and $e655a6
$16:eaa5  72 fa		 adc ($fa)
$16:eaa7  4d 3e 4f	  eor $4f3e
$16:eaaa  27 6e		 and [$6e]
$16:eaac  81 64		 sta ($64,x)
$16:eaae  a9 b1 d8	  lda #$d8b1
$16:eab1  6c 76 0f	  jmp ($0f76)
$16:eab4  17 81		 ora [$81],y
$16:eab6  c0 c4 85	  cpy #$85c4
$16:eab9  01 17		 ora ($17,x)
$16:eabb  0d c3 91	  ora $91c3
$16:eabe  64 ea		 stz $ea
$16:eac0  66 3d		 ror $3d
$16:eac2  12 4f		 ora ($4f)
$16:eac4  25 22		 and $22
$16:eac6  91 30		 sta ($30),y
$16:eac8  98			tya
$16:eac9  1d c0 b6	  ora $b6c0,x
$16:eacc  16 4b		 asl $4b,x
$16:eace  85 82		 sta $82
$16:ead0  e1 c0		 sbc ($c0,x)
$16:ead2  e8			inx
$16:ead3  60			rts
$16:ead4  04 a0		 tsb $a0
$16:ead6  74 11		 stz $11,x
$16:ead8  39 55 6d	  and $6d55,y
$16:eadb  f0 c8		 beq $eaa5
$16:eadd  bb			tyx
$16:eade  cc 26 33	  cpy $3326
$16:eae1  7c 46 2e	  jmp ($2e46,x)
$16:eae4  05 02		 ora $02
$16:eae6  2e 84 34	  rol $3484
$16:eae9  7a			ply
$16:eaea  00 05		 brk #$05
$16:eaec  37 04		 and [$04],y
$16:eaee  14 c0		 trb $c0
$16:eaf0  77 4e		 adc [$4e],y
$16:eaf2  65 83		 adc $83
$16:eaf4  a0 13 08	  ldy #$0813
$16:eaf7  87 42		 sta [$42]
$16:eaf9  45 a2		 eor $a2
$16:eafb  35 81		 and $81,x
$16:eafd  ec 3c 1e	  cpx $1e3c
$16:eb00  01 08		 ora ($08,x)
$16:eb02  08			php
$16:eb03  4b			phk
$16:eb04  11 80		 ora ($80),y
$16:eb06  3f 02 88 1a   and $1a8802,x
$16:eb0a  0c 26 01	  tsb $0126
$16:eb0d  30 06		 bmi $eb15
$16:eb0f  c0 36 41	  cpy #$4136
$16:eb12  b2 40		 lda ($40)
$16:eb14  70 98		 bvs $eaae
$16:eb16  cf 82 7d f6   cmp $f67d82
$16:eb1a  81 c1		 sta ($c1,x)
$16:eb1c  60			rts
$16:eb1d  63 90		 adc $90,s
$16:eb1f  81 40		 sta ($40,x)
$16:eb21  16 63		 asl $63,x
$16:eb23  01 82		 ora ($82,x)
$16:eb25  c1 17		 cmp ($17,x)
$16:eb27  20 39 00	  jsr $0039
$16:eb2a  30 2d		 bmi $eb59
$16:eb2c  c1 84		 cmp ($84,x)
$16:eb2e  00 a3		 brk #$a3
$16:eb30  70 1d		 bvs $eb4f
$16:eb32  43 20		 eor $20,s
$16:eb34  26 0c		 rol $0c
$16:eb36  86 41		 stx $41
$16:eb38  32 62		 and ($62)
$16:eb3a  70 13		 bvs $eb4f
$16:eb3c  08			php
$16:eb3d  9c 32 02	  stz $0232
$16:eb40  a1 e0		 lda ($e0,x)
$16:eb42  38			sec
$16:eb43  c5 44		 cmp $44
$16:eb45  95 9a		 sta $9a,x
$16:eb47  54 ca 69	  mvn $69,$ca
$16:eb4a  04 24		 tsb $24
$16:eb4c  04 26		 tsb $26
$16:eb4e  13 11		 ora ($11,s),y
$16:eb50  84 44		 sty $44
$16:eb52  08			php
$16:eb53  e0 59 18	  cpx #$1859
$16:eb56  24 e1		 bit $e1
$16:eb58  f2 13		 sbc ($13)
$16:eb5a  88			dey
$16:eb5b  03 ec		 ora $ec,s
$16:eb5d  8d 92 9e	  sta $9e92
$16:eb60  f5 13		 sbc $13,x
$16:eb62  f2 66		 sbc ($66)
$16:eb64  de 68 cd	  dec $cd68,x
$16:eb67  e3 0f		 sbc $0f,s
$16:eb69  68			pla
$16:eb6a  db			stp
$16:eb6b  ce 7e d4	  dec $d47e
$16:eb6e  6e c4 4a	  ror $4ac4
$16:eb71  d9 81 c3	  cmp $c381,y
$16:eb74  60			rts
$16:eb75  2f f0 0f f4   and $f40ff0
$16:eb79  83 f1		 sta $f1,s
$16:eb7b  70 f8		 bvs $eb75
$16:eb7d  5c 2e 12 05   jml $05122e
$16:eb81  11 f1		 ora ($f1),y
$16:eb83  a8			tay
$16:eb84  30 0f		 bmi $eb95
$16:eb86  f9 44 b0	  sbc $b044,y
$16:eb89  37 eb		 and [$eb],y
$16:eb8b  f4 19 96	  pea $9619
$16:eb8e  73 86		 adc ($86,s),y
$16:eb90  33 a8		 and ($a8,s),y
$16:eb92  8e 41 60	  stx $6041
$16:eb95  e0 3a 03	  cpx #$033a
$16:eb98  f1 63		 sbc ($63),y
$16:eb9a  cf e4 21 90   cmp $9021e4
$16:eb9e  c4 b0		 cpy $b0
$16:eba0  bf 42 d1 1c   lda $1cd142,x
$16:eba4  e0 4f 14	  cpx #$144f
$16:eba7  55 ad		 eor $ad,x
$16:eba9  ab			plb
$16:ebaa  7d e1 17	  adc $17e1,x
$16:ebad  ec 08 d4	  cpx $d408
$16:ebb0  27 1f		 and [$1f]
$16:ebb2  79 47 a7	  adc $a747,y
$16:ebb5  25 ec		 and $ec
$16:ebb7  b0 d9		 bcs $eb92
$16:ebb9  87 e3		 sta [$e3]
$16:ebbb  ff 90 7f 88   sbc $887f90,x
$16:ebbf  a5 16		 lda $16
$16:ebc1  62 9f 82	  per $6e63
$16:ebc4  c1 08		 cmp ($08,x)
$16:ebc6  e2 40		 sep #$40
$16:ebc8  4a			lsr a
$16:ebc9  43 07		 eor $07,s
$16:ebcb  ff 43 be 1f   sbc $1fbe43,x
$16:ebcf  00 68		 brk #$68
$16:ebd1  d8			cld
$16:ebd2  1f 61 30 81   ora $813061,x
$16:ebd6  83 49		 sta $49,s
$16:ebd8  54 66 d1	  mvn $d1,$66
$16:ebdb  90 51		 bcc $ec2e
$16:ebdd  38			sec
$16:ebde  81 31		 sta ($31,x)
$16:ebe0  e0 60 2e	  cpx #$2e60
$16:ebe3  14 09		 trb $09
$16:ebe5  87 83		 sta [$83]
$16:ebe7  a0 fb 09	  ldy #$09fb
$16:ebea  04 63		 tsb $63
$16:ebec  a1 38		 lda ($38,x)
$16:ebee  d0 5c		 bne $ec4c
$16:ebf0  18			clc
$16:ebf1  20 ca 30	  jsr $30ca
$16:ebf4  68			pla
$16:ebf5  c3 a3		 cmp $a3,s
$16:ebf7  f3 19		 sbc ($19,s),y
$16:ebf9  fd 42 df	  sbc $df42,x
$16:ebfc  28			plp
$16:ebfd  af d9 62 f1   lda $f162d9
$16:ec01  89 44 be	  bit #$be44
$16:ec04  6d 26 9c	  adc $9c26
$16:ec07  40			rti
$16:ec08  23 f0		 and $f0,s
$16:ec0a  09 fc 01	  ora #$01fc
$16:ec0d  40			rti
$16:ec0e  17 f9		 ora [$f9],y
$16:ec10  45 fe		 eor $fe
$16:ec12  4f 3f 98 cf   eor $cf983f
$16:ec16  a5 72		 lda $72
$16:ec18  d7 7f		 cmp [$7f],y
$16:ec1a  80 36		 bra $ec52
$16:ec1c  46 49		 lsr $49
$16:ec1e  41 af		 eor ($af,x)
$16:ec20  a0 da 0d	  ldy #$0dda
$16:ec23  01 81		 ora ($81,x)
$16:ec25  c1 20		 cmp ($20,x)
$16:ec27  b0 28		 bcs $ec51
$16:ec29  13 25		 ora ($25,s),y
$16:ec2b  09 67 00	  ora #$0067
$16:ec2e  83 98		 sta $98,s
$16:ec30  45 86		 eor $86
$16:ec32  8c 62 27	  sty $2762
$16:ec35  84 38		 sty $38
$16:ec37  e2 71		 sep #$71
$16:ec39  e8			inx
$16:ec3a  14 76		 trb $76
$16:ec3c  0f 18 3d 83   ora $833d18
$16:ec40  20 50 0d	  jsr $0d50
$16:ec43  02 30		 cop #$30
$16:ec45  9d 81 ae	  sta $ae81,x
$16:ec48  4d 90 e0	  eor $e090
$16:ec4b  6e 28 1b	  ror $1b28
$16:ec4e  8d 05 61	  sta $6105
$16:ec51  36 0d		 rol $0d,x
$16:ec53  30 6a		 bmi $ecbf
$16:ec55  06 01		 asl $01
$16:ec57  ac 1c 06	  ldy $061c
$16:ec5a  a8			tay
$16:ec5b  40			rti
$16:ec5c  28			plp
$16:ec5d  10 0f		 bpl $ec6e
$16:ec5f  02 ac		 cop #$ac
$16:ec61  0a			asl a
$16:ec62  81 82		 sta ($82,x)
$16:ec64  c1 50		 cmp ($50,x)
$16:ec66  15 40		 ora $40,x
$16:ec68  42 36		 wdm #$36
$16:ec6a  78			sei
$16:ec6b  44 a2 43	  mvp $43,$a2
$16:ec6e  ef 21 19 50   sbc $501921
$16:ec72  16 60		 asl $60,x
$16:ec74  54 09 24	  mvn $24,$09
$16:ec77  90 85		 bcc $ebfe
$16:ec79  43 00		 eor $00,s
$16:ec7b  5f 04 59 44   eor $445904,x
$16:ec7f  18			clc
$16:ec80  02 a0		 cop #$a0
$16:ec82  51 28		 eor ($28),y
$16:ec84  8b			phb
$16:ec85  80 79		 bra $ed00
$16:ec87  83 64		 sta $64,s
$16:ec89  8a			txa
$16:ec8a  80 d1		 bra $ec5d
$16:ec8c  38			sec
$16:ec8d  05 1a		 ora $1a
$16:ec8f  01 22		 ora ($22,x)
$16:ec91  74 0a		 stz $0a,x
$16:ec93  e0 20		 cpx #$20
$16:ec95  80 c0		 bra $ec57
$16:ec97  82 44 22	  brl $0ede
$16:ec9a  0f 14 c8 64   ora $64c814
$16:ec9e  17 60		 ora [$60],y
$16:eca0  69 58		 adc #$58
$16:eca2  04 22		 tsb $22
$16:eca4  01 10		 ora ($10,x)
$16:eca6  72 2b		 adc ($2b)
$16:eca8  4c a1 02	  jmp $02a1
$16:ecab  50 5c		 bvc $ed09
$16:ecad  1a			inc a
$16:ecae  e0 16		 cpx #$16
$16:ecb0  64 56		 stz $56
$16:ecb2  00 68		 brk #$68
$16:ecb4  09 c0		 ora #$c0
$16:ecb6  12 4b		 ora ($4b)
$16:ecb8  42 81		 wdm #$81
$16:ecba  c0 e1		 cpy #$e1
$16:ecbc  90 c0		 bcc $ec7e
$16:ecbe  88			dey
$16:ecbf  2e c1 66	  rol $66c1
$16:ecc2  0b			phd
$16:ecc3  30 4f		 bmi $ed14
$16:ecc5  8a			txa
$16:ecc6  84 18		 sty $18
$16:ecc8  9a			txs
$16:ecc9  ac 0f 9d	  ldy $9d0f
$16:eccc  b3 25		 lda ($25,s),y
$16:ecce  5e aa 6f	  lsr $6faa,x
$16:ecd1  24 59		 bit $59
$16:ecd3  ea			nop
$16:ecd4  a5 2e		 lda $2e
$16:ecd6  03 4f		 ora $4f,s
$16:ecd8  90 d9		 bcc $ecb3
$16:ecda  cd c5 21	  cmp $21c5
$16:ecdd  fb			xce
$16:ecde  e0 ee		 cpx #$ee
$16:ece0  f8			sed
$16:ece1  1b			tcs
$16:ece2  bd 02 6f	  lda $6f02,x
$16:ece5  43 9d		 eor $9d,s
$16:ece7  59 e3 cb	  eor $cbe3,y
$16:ecea  80 54		 bra $ed40
$16:ecec  06 c3		 asl $c3
$16:ecee  81 28		 sta ($28,x)
$16:ecf0  98			tya
$16:ecf1  45 23		 eor $23
$16:ecf3  1e af 65	  asl $65af,x
$16:ecf6  f7 fd		 sbc [$fd],y
$16:ecf8  3c ff ae	  bit $aeff,x
$16:ecfb  05 22		 ora $22
$16:ecfd  1f 0e 07 e3   ora $e3070e,x
$16:ed01  c1 fc		 cmp ($fc,x)
$16:ed03  88			dey
$16:ed04  7f 20 1f cc   adc $cc1f20,x
$16:ed08  05 f2		 ora $f2
$16:ed0a  38			sec
$16:ed0b  ea			nop
$16:ed0c  02 88		 cop #$88
$16:ed0e  40			rti
$16:ed0f  e0 50		 cpx #$50
$16:ed11  18			clc
$16:ed12  24 0e		 bit $0e
$16:ed14  11 07		 ora ($07),y
$16:ed16  5c 84 4a 1e   jml $1e4a84
$16:ed1a  36 11		 rol $11,x
$16:ed1c  38			sec
$16:ed1d  43 0b		 eor $0b,s
$16:ed1f  ef 03 9c 40   sbc $409c03
$16:ed23  29 13		 and #$13
$16:ed25  0d 81 64	  ora $6481
$16:ed28  64 1c		 stz $1c
$16:ed2a  08			php
$16:ed2b  87 83		 sta [$83]
$16:ed2d  a1 20		 lda ($20,x)
$16:ed2f  a4 7c		 ldy $7c
$16:ed31  06 c2		 asl $c2
$16:ed33  25 0d		 and $0d
$16:ed35  84 03		 sty $03
$16:ed37  00 e5		 brk #$e5
$16:ed39  34 88		 bit $88,x
$16:ed3b  70 29		 bvs $ed66
$16:ed3d  f7 8b		 sbc [$8b],y
$16:ed3f  f5 f6		 sbc $f6,x
$16:ed41  7f 39 94 cb   adc $cb9439,x
$16:ed45  a1 90		 lda ($90,x)
$16:ed47  d9 9c cc	  cmp $cc9c,y
$16:ed4a  22 10 98 4d   jsl $4d9810
$16:ed4e  be d9 7c	  ldx $7cd9,y
$16:ed51  bf cf 27 e2   lda $e227cf,x
$16:ed55  20 1d 01	  jsr $011d
$16:ed58  0c 04 a1	  tsb $a104
$16:ed5b  06 80		 asl $80
$16:ed5d  3b			tsc
$16:ed5e  d2 a3		 cmp ($a3)
$16:ed60  56 a0		 lsr $a0,x
$16:ed62  50 60		 bvc $edc4
$16:ed64  90 49		 bcc $edaf
$16:ed66  24 90		 bit $90
$16:ed68  a6 0f		 ldx $0f
$16:ed6a  f6 22		 inc $22,x
$16:ed6c  80 2c		 bra $ed9a
$16:ed6e  20 6b f1	  jsr $f16b
$16:ed71  83 03		 sta $03,s
$16:ed73  40			rti
$16:ed74  63 e5		 adc $e5,s
$16:ed76  fa			plx
$16:ed77  15 86		 ora $86,x
$16:ed79  83 41		 sta $41,s
$16:ed7b  08			php
$16:ed7c  05 81		 ora $81
$16:ed7e  57 d8		 eor [$d8],y
$16:ed80  ad 06 8c	  lda $8c06
$16:ed83  c9 23		 cmp #$23
$16:ed85  76 58		 ror $58,x
$16:ed87  df 16 77 06   cmp $067716,x
$16:ed8b  ec c4 e3	  cpx $e3c4
$16:ed8e  90 14		 bcc $eda4
$16:ed90  70 2f		 bvs $edc1
$16:ed92  82 0f 00	  brl $eda4
$16:ed95  93 c0		 sta ($c0,s),y
$16:ed97  2c f0 0f	  bit $0ff0
$16:ed9a  3c 03 8f	  bit $8f03,x
$16:ed9d  00 89		 brk #$89
$16:ed9f  81 41		 sta ($41,x)
$16:eda1  7e 16 0c	  ror $0c16,x
$16:eda4  c4 93		 cpy $93
$16:eda6  b1 a6		 lda ($a6),y
$16:eda8  ec 68 fb	  cpx $fb68
$16:edab  96 0c		 stx $0c,y
$16:edad  df 22 71 80   cmp $807122,x
$16:edb1  bc 40 1b	  ldy $1b40,x
$16:edb4  c1 e0		 cmp ($e0,x)
$16:edb6  80 79		 bra $ee31
$16:edb8  20 1e 64	  jsr $641e
$16:edbb  28			plp
$16:edbc  f8			sed
$16:edbd  e0 1c		 cpx #$1c
$16:edbf  87 48		 sta [$48]
$16:edc1  c0 21		 cpy #$21
$16:edc3  50 a8		 bvc $ed6d
$16:edc5  94 48		 sty $48,x
$16:edc7  12 10		 ora ($10)
$16:edc9  c8			iny
$16:edca  40			rti
$16:edcb  34 11		 bit $11,x
$16:edcd  80 19		 bra $ede8
$16:edcf  08			php
$16:edd0  14 0a		 trb $0a
$16:edd2  28			plp
$16:edd3  b4 08		 ldy $08,x
$16:edd5  04 38		 tsb $38
$16:edd7  18			clc
$16:edd8  28			plp
$16:edd9  00 15		 brk #$15
$16:eddb  92 30		 sta ($30)
$16:eddd  22 51 05 d9   jsl $d90551
$16:ede1  34 52		 bit $52,x
$16:ede3  02 8c		 cop #$8c
$16:ede5  10 68		 bpl $ee4f
$16:ede7  40			rti
$16:ede8  81 02		 sta ($02,x)
$16:edea  2b			pld
$16:edeb  04 60		 tsb $60
$16:eded  91 8d		 sta ($8d),y
$16:edef  a6 2e		 ldx $2e
$16:edf1  43 0c		 eor $0c,s
$16:edf3  84 0c		 sty $0c
$16:edf5  56 4e		 lsr $4e,x
$16:edf7  21 62		 and ($62,x)
$16:edf9  93 1d		 sta ($1d,s),y
$16:edfb  08			php
$16:edfc  cc 51 03	  cpy $0351
$16:edff  60			rts
$16:ee00  50 28		 bvc $ee2a
$16:ee02  06 c0		 asl $c0
$16:ee04  88			dey
$16:ee05  44 0d 81	  mvp $81,$0d
$16:ee08  20 0f 08	  jsr $080f
$16:ee0b  8b			phb
$16:ee0c  a4 02		 ldy $02
$16:ee0e  11 0d		 ora ($0d),y
$16:ee10  93 ac		 sta ($ac,s),y
$16:ee12  83 00		 sta $00,s
$16:ee14  18			clc
$16:ee15  11 04		 ora ($04),y
$16:ee17  e0 09		 cpx #$09
$16:ee19  e2 17		 sep #$17
$16:ee1b  00 b8		 brk #$b8
$16:ee1d  0c c0 6e	  tsb $6ec0
$16:ee20  c2 4e		 rep #$4e
$16:ee22  0d 84 61	  ora $6184
$16:ee25  68			pla
$16:ee26  10 38		 bpl $ee60
$16:ee28  34 05		 bit $05,x
$16:ee2a  ca			dex
$16:ee2b  70 19		 bvs $ee46
$16:ee2d  04 7e		 tsb $7e
$16:ee2f  21 0f		 and ($0f,x)
$16:ee31  80 20		 bra $ee53
$16:ee33  80 06		 bra $ee3b
$16:ee35  0e 10 6e	  asl $6e10
$16:ee38  02 28		 cop #$28
$16:ee3a  7b			tdc
$16:ee3b  bb			tyx
$16:ee3c  ee 66 ee	  inc $ee66
$16:ee3f  c5 1d		 cmp $1d
$16:ee41  a0 6f		 ldy #$6f
$16:ee43  f0 37		 beq $ee7c
$16:ee45  e4 a8		 cpx $a8
$16:ee47  62 2e fb	  per $e978
$16:ee4a  0a			asl a
$16:ee4b  7e 02 fb	  ror $fb02,x
$16:ee4e  80 be		 bra $ee0e
$16:ee50  40			rti
$16:ee51  3c 50 0e	  bit $0e50,x
$16:ee54  04 03		 tsb $03
$16:ee56  83 00		 sta $00,s
$16:ee58  b0 40		 bcs $ee9a
$16:ee5a  37 10		 and [$10],y
$16:ee5c  0c e4 4e	  tsb $4ee4
$16:ee5f  1f 07 8f c5   ora $c58f07,x
$16:ee63  a1 d1		 lda ($d1,x)
$16:ee65  48			pha
$16:ee66  64 9a		 stz $9a
$16:ee68  3d 63 8f	  and $8f63,x
$16:ee6b  f0 27		 beq $ee94
$16:ee6d  f1 4e		 sbc ($4e),y
$16:ee6f  da			phx
$16:ee70  0c 61 f0	  tsb $f061
$16:ee73  18			clc
$16:ee74  fc 0e 3f	  jsr ($3f0e,x)
$16:ee77  11 97		 ora ($97),y
$16:ee79  c4 2f		 cpy $2f
$16:ee7b  f1 0f		 sbc ($0f),y
$16:ee7d  9c 43 99	  stz $9943
$16:ee80  c8			iny
$16:ee81  f8			sed
$16:ee82  68			pla
$16:ee83  37 12		 and [$12],y
$16:ee85  89 86		 bit #$86
$16:ee87  a2 61		 ldx #$61
$16:ee89  64 bc		 stz $bc
$16:ee8b  71 bf		 adc ($bf),y
$16:ee8d  10 3f		 bpl $eece
$16:ee8f  e4 a1		 cpx $a1
$16:ee91  7c 1f 0a	  jmp ($0a1f,x)
$16:ee94  07 c3		 ora [$c3]
$16:ee96  81 f8		 sta ($f8,x)
$16:ee98  e0 5e		 cpx #$5e
$16:ee9a  31 1f		 and ($1f),y
$16:ee9c  48			pha
$16:ee9d  47 fa		 eor [$fa]
$16:ee9f  11 cf		 ora ($cf),y
$16:eea1  84 4c		 sty $4c
$16:eea3  c9 64		 cmp #$64
$16:eea5  ef 54 50 40   sbc $405054
$16:eea9  e0 30		 cpx #$30
$16:eeab  67 7c		 adc [$7c]
$16:eead  bd 91 de	  lda $de91,x
$16:eeb0  d7 f9		 cmp [$f9],y
$16:eeb2  37 67		 and [$67],y
$16:eeb4  65 7d		 adc $7d
$16:eeb6  e3 ce		 sbc $ce,s
$16:eeb8  1d f3 3e	  ora $3ef3,x
$16:eebb  80 7f		 bra $ef3c
$16:eebd  c5 62		 cmp $62
$16:eebf  4b			phk
$16:eec0  18			clc
$16:eec1  a4 52		 ldy $52
$16:eec3  61 3c		 adc ($3c,x)
$16:eec5  a0 7e		 ldy #$7e
$16:eec7  20 1f c8	  jsr $c81f
$16:eeca  27 ee		 and [$ee]
$16:eecc  53 d6		 eor ($d6,s),y
$16:eece  0a			asl a
$16:eecf  14 22		 trb $22
$16:eed1  39 00 9e	  and $9e00,y
$16:eed4  40			rti
$16:eed5  2f 0d f0 80   and $80f00d
$16:eed9  7d 20 1e	  adc $1e20,x
$16:eedc  f3 33		 sbc ($33,s),y
$16:eede  c1 a0		 cmp ($a0,x)
$16:eee0  90 a8		 bcc $ee8a
$16:eee2  64 0a		 stz $0a
$16:eee4  35 e4		 and $e4,x
$16:eee6  27 c4		 and [$c4]
$16:eee8  02 1c		 cop #$1c
$16:eeea  69 18		 adc #$18
$16:eeec  d3 04		 cmp ($04,s),y
$16:eeee  20 70 43	  jsr $4370
$16:eef1  88			dey
$16:eef2  3f 46 06 4f   and $4f0646,x
$16:eef6  73 c0		 adc ($c0,s),y
$16:eef8  1e 00 1d	  asl $1d00,x
$16:eefb  0e 00 d0	  asl $d000
$16:eefe  70 24		 bvs $ef24
$16:ef00  18			clc
$16:ef01  05 50		 ora $50
$16:ef03  70 09		 bvs $ef0e
$16:ef05  ee 98 04	  inc $0498
$16:ef08  c0 60		 cpy #$60
$16:ef0a  09 ee		 ora #$ee
$16:ef0c  53 38		 eor ($38,s),y
$16:ef0e  14 0a		 trb $0a
$16:ef10  11 08		 ora ($08),y
$16:ef12  ae 50 35	  ldx $3550
$16:ef15  18			clc
$16:ef16  89 01		 bit #$01
$16:ef18  3d 41 c0	  and $c041,x
$16:ef1b  fe 02 20	  inc $2002,x
$16:ef1e  4c 20 1b	  jmp $1b20
$16:ef21  05 a0		 ora $a0
$16:ef23  c1 20		 cmp ($20,x)
$16:ef25  94 0a		 sty $0a,x
$16:ef27  06 01		 asl $01
$16:ef29  4c 70 33	  jmp $3370
$16:ef2c  c4 39		 cpy $39
$16:ef2e  36 02		 rol $02,x
$16:ef30  0e 19 02	  asl $0219
$16:ef33  f4 5a 60	  pea $605a
$16:ef36  a7 88		 lda [$88]
$16:ef38  64 02		 stz $02
$16:ef3a  30 0a		 bmi $ef46
$16:ef3c  11 30		 ora ($30),y
$16:ef3e  44 22 0f	  mvp $0f,$22
$16:ef41  d6 94		 dec $94,x
$16:ef43  4a			lsr a
$16:ef44  09 e8		 ora #$e8
$16:ef46  fa			plx
$16:ef47  04 c2		 tsb $c2
$16:ef49  3f a5 68 0c   and $0c68a5,x
$16:ef4d  80 88		 bra $eed7
$16:ef4f  4b			phk
$16:ef50  24 12		 bit $12
$16:ef52  e9 11		 sbc #$11
$16:ef54  82 01 20	  brl $0f58
$16:ef57  c9 06		 cmp #$06
$16:ef59  48			pha
$16:ef5a  3d 42 29	  and $2942,x
$16:ef5d  14 a0		 trb $a0
$16:ef5f  3f 8c a2 12   and $12a28c,x
$16:ef63  21 f1		 and ($f1,x)
$16:ef65  c2 19		 rep #$19
$16:ef67  42 5d		 wdm #$5d
$16:ef69  46 48		 lsr $48
$16:ef6b  30 8d		 bmi $eefa
$16:ef6d  0d 06 cf	  ora $cf06
$16:ef70  02 87		 cop #$87
$16:ef72  fa			plx
$16:ef73  03 67		 ora $67,s
$16:ef75  c0 58 30	  cpy #$3058
$16:ef78  0a			asl a
$16:ef79  79 e3 09	  adc $09e3,y
$16:ef7c  04 4a		 tsb $4a
$16:ef7e  84 23		 sty $23
$16:ef80  85 43		 sta $43
$16:ef82  a0 b0 b8	  ldy #$b8b0
$16:ef85  14 16		 trb $16
$16:ef87  02 dc		 cop #$dc
$16:ef89  78			sei
$16:ef8a  4c 1e 11	  jmp $111e
$16:ef8d  07 82		 ora [$82]
$16:ef8f  36 e6		 rol $e6,x
$16:ef91  a1 70		 lda ($70,x)
$16:ef93  90 54		 bcc $efe9
$16:ef95  2c 1a 02	  bit $021a
$16:ef98  9a			txs
$16:ef99  01 4b		 ora ($4b,x)
$16:ef9b  21 e0		 and ($e0,x)
$16:ef9d  6f 84 83 81   adc $818384
$16:efa1  40			rti
$16:efa2  c0 0b 9e	  cpy #$9e0b
$16:efa5  ff 50 d7 cc   sbc $ccd750,x
$16:efa9  39 f0 0f	  and $0ff0,y
$16:efac  fb			xce
$16:efad  bc 23 12	  ldy $1223,x
$16:efb0  78			sei
$16:efb1  34 24		 bit $24,x
$16:efb3  e2 77		 sep #$77
$16:efb5  03 12		 ora $12,s
$16:efb7  c7 e0		 cmp [$e0]
$16:efb9  10 77		 bpl $f032
$16:efbb  70 b9		 bvs $ef76
$16:efbd  83 ff		 sta $ff,s
$16:efbf  40			rti
$16:efc0  df ec 39 f8   cmp $f839ec,x
$16:efc4  6f cc 0f f9   adc $f90fcc
$16:efc8  08			php
$16:efc9  fb			xce
$16:efca  dd b1 2e	  cmp $2eb1,x
$16:efcd  f0 55		 beq $f024
$16:efcf  8b			phb
$16:efd0  58			cli
$16:efd1  3e 08 e0	  rol $e008,x
$16:efd4  7a			ply
$16:efd5  8f e2 01 76   sta $7601e2
$16:efd9  ef 48 43 20   sbc $204348
$16:efdd  f5 11		 sbc $11,x
$16:efdf  a0 c0		 ldy #$c0
$16:efe1  7f d8 6b cf   adc $cf6bd8,x
$16:efe5  82 31 00	  brl $f019
$16:efe8  ef c0 16 cc   sbc $cc16c0
$16:efec  f6 01		 inc $01,x
$16:efee  40			rti
$16:efef  78			sei
$16:eff0  3e 10 cc	  rol $cc10,x
$16:eff3  55 d2		 eor $d2,x
$16:eff5  1d f0 29	  ora $29f0,x
$16:eff8  84 9b		 sty $9b
$16:effa  80 a4		 bra $efa0
$16:effc  51 30		 eor ($30),y
$16:effe  62 a0 10	  per $00a1
$16:f001  e3 18		 sbc $18,s
$16:f003  c9 94		 cmp #$94
$16:f005  74 41		 stz $41,x
$16:f007  08			php
$16:f008  0c 18 16	  tsb $1618
$16:f00b  07 70		 ora [$70]
$16:f00d  81 43		 sta ($43,x)
$16:f00f  54 ae fe	  mvn $fe,$ae
$16:f012  27 f0		 and [$f0]
$16:f014  2d 9b 81	  and $819b
$16:f017  80 b0		 bra $efc9
$16:f019  13 41		 ora ($41,s),y
$16:f01b  2e 14 0d	  rol $0d14
$16:f01e  81 b1		 sta ($b1,x)
$16:f020  dc c4 e6	  jml [$e6c4]
$16:f023  0e 04 d2	  asl $d204
$16:f026  09 9d		 ora #$9d
$16:f028  c0 d4		 cpy #$d4
$16:f02a  2a			rol a
$16:f02b  10 98		 bpl $efc5
$16:f02d  4c 0a 04	  jmp $040a
$16:f030  ea			nop
$16:f031  4d c4 02	  eor $02c4
$16:f034  7d 00 87	  adc $8700,x
$16:f037  c0 0f		 cpy #$0f
$16:f039  00 fe		 brk #$fe
$16:f03b  27 52		 and [$52]
$16:f03d  60			rts
$16:f03e  f0 6a		 beq $f0aa
$16:f040  43 c0		 eor $c0,s
$16:f042  50 28		 bvc $f06c
$16:f044  10 48		 bpl $f08e
$16:f046  22 dd 8d 91   jsl $918ddd
$16:f04a  44 a2 44	  mvp $44,$a2
$16:f04d  a2 52		 ldx #$52
$16:f04f  79 3a 18	  adc $183a,y
$16:f052  58			cli
$16:f053  eb			xba
$16:f054  19 80 1f	  ora $1f80,y
$16:f057  a1 24		 lda ($24,x)
$16:f059  74 09		 stz $09,x
$16:f05b  44 a1 b2	  mvp $b2,$a1
$16:f05e  07 22		 ora [$22]
$16:f060  6c 84 42	  jmp ($4284)
$16:f063  20 aa 35	  jsr $35aa
$16:f066  39 9a 82	  and $829a,y
$16:f069  40			rti
$16:f06a  70 39		 bvs $f0a5
$16:f06c  3c 86 63	  bit $6386,x
$16:f06f  31 8f		 and ($8f),y
$16:f071  47 8d		 eor [$8d]
$16:f073  90 34		 bcc $f0a9
$16:f075  03 30		 ora $30,s
$16:f077  31 e0		 and ($e0),y
$16:f079  e4 11		 cpx $11
$16:f07b  48			pha
$16:f07c  a6 8b		 ldx $8b
$16:f07e  45 5c		 eor $5c
$16:f080  ae 05 50	  ldx $5005
$16:f083  9e 0f 70	  stz $700f,x
$16:f086  84 40		 sty $40
$16:f088  23 82		 and $82,s
$16:f08a  23 42		 and $42,s
$16:f08c  04 c2		 tsb $c2
$16:f08e  00 5f		 brk #$5f
$16:f090  04 20		 tsb $20
$16:f092  44 3c 10	  mvp $10,$3c
$16:f095  0f 80 84 28   ora $288480
$16:f099  18			clc
$16:f09a  0d 05 00	  ora $0005
$16:f09d  ee 16 0c	  inc $0c16
$16:f0a0  04 4c		 tsb $4c
$16:f0a2  e0 01		 cpx #$01
$16:f0a4  c1 51		 cmp ($51,x)
$16:f0a6  aa			tax
$16:f0a7  b0 02		 bcs $f0ab
$16:f0a9  81 03		 sta ($03,x)
$16:f0ab  86 fc		 stx $fc
$16:f0ad  a0 3f		 ldy #$3f
$16:f0af  ef 9c 32 19   sbc $19329c
$16:f0b3  02 86		 cop #$86
$16:f0b5  c0 a0		 cpy #$a0
$16:f0b7  e8			inx
$16:f0b8  d0 21		 bne $f0db
$16:f0ba  14 11		 trb $11
$16:f0bc  d4 6a		 pei ($6a)
$16:f0be  00 50		 brk #$50
$16:f0c0  03 78		 ora $78,s
$16:f0c2  1f 03 02 80   ora $800203,x
$16:f0c6  c1 60		 cmp ($60,x)
$16:f0c8  70 78		 bvs $f142
$16:f0ca  1c 2e 09	  trb $092e
$16:f0cd  09 83		 ora #$83
$16:f0cf  c2 a0		 rep #$a0
$16:f0d1  d0 d8		 bne $f0ab
$16:f0d3  24 56		 bit $56
$16:f0d5  18			clc
$16:f0d6  9a			txs
$16:f0d7  14 c8		 trb $c8
$16:f0d9  26 42		 rol $42
$16:f0db  1f 00 85 c0   ora $c08500,x
$16:f0df  61 f0		 adc ($f0,x)
$16:f0e1  38			sec
$16:f0e2  74 0e		 stz $0e,x
$16:f0e4  3c 75 09	  bit $0975,x
$16:f0e7  05 03		 ora $03
$16:f0e9  c1 c0		 cmp ($c0,x)
$16:f0eb  e8			inx
$16:f0ec  48			pha
$16:f0ed  32 1e		 and ($1e)
$16:f0ef  0a			asl a
$16:f0f0  85 83		 sta $83
$16:f0f2  61 20		 adc ($20,x)
$16:f0f4  d4 1a		 pei ($1a)
$16:f0f6  43 81		 eor $81,s
$16:f0f8  80 38		 bra $f132
$16:f0fa  01 c0		 ora ($c0,x)
$16:f0fc  60			rts
$16:f0fd  1d 0c 01	  ora $010c,x
$16:f100  c8			iny
$16:f101  2e 1c 0b	  rol $0b1c
$16:f104  c0 78		 cpy #$78
$16:f106  b0 14		 bcs $f11c
$16:f108  ca			dex
$16:f109  06 f2		 asl $f2
$16:f10b  01 fc		 ora ($fc,x)
$16:f10d  7b			tdc
$16:f10e  87 02		 sta [$02]
$16:f110  71 60		 adc ($60),y
$16:f112  ce 19 0d	  dec $0d19
$16:f115  14 46		 trb $46
$16:f117  42 10		 wdm #$10
$16:f119  85 80		 sta $80
$16:f11b  89 2a e1	  bit #$e12a
$16:f11e  82 60 c1	  brl $b281
$16:f121  f4 a9 15	  pea $15a9
$16:f124  02 19		 cop #$19
$16:f126  02 39		 cop #$39
$16:f128  10 87		 bpl $f0b1
$16:f12a  43 13		 eor $13,s
$16:f12c  61 03		 adc ($03,x)
$16:f12e  80 aa		 bra $f0da
$16:f130  80 20		 bra $f152
$16:f132  c8			iny
$16:f133  00 5f		 brk #$5f
$16:f135  01 90		 ora ($90,x)
$16:f137  13 a2		 ora ($a2,s),y
$16:f139  9e 18 c4	  stz $c418,x
$16:f13c  72 05		 adc ($05)
$16:f13e  0e 80 a6	  asl $a680
$16:f141  c5 5e		 cmp $5e
$16:f143  03 e4		 ora $e4,s
$16:f145  8e 18 c6	  stx $c618
$16:f148  1c 9a 38	  trb $389a
$16:f14b  0b			phd
$16:f14c  24 20		 bit $20
$16:f14e  91 b8		 sta ($b8),y
$16:f150  2c 6a 0f	  bit $0f6a
$16:f153  18			clc
$16:f154  3a			dec a
$16:f155  94 9e		 sty $9e,x
$16:f157  31 26		 and ($26),y
$16:f159  ac af d5	  ldy $d5af
$16:f15c  04 92		 tsb $92
$16:f15e  78			sei
$16:f15f  05 9d		 ora $9d
$16:f161  d2 16		 cmp ($16)
$16:f163  0e c4 83	  asl $83c4
$16:f166  b1 a0		 lda ($a0),y
$16:f168  ac 78 23	  ldy $2378
$16:f16b  0f b0 a2 6e   ora $6ea2b0
$16:f16f  34 9d		 bit $9d,x
$16:f171  a0 58		 ldy #$58
$16:f173  b8			clv
$16:f174  89 44 96	  bit #$9644
$16:f177  48			pha
$16:f178  06 98		 asl $98
$16:f17a  1f 52 88 05   ora $058852,x
$16:f17e  51 76		 eor ($76),y
$16:f180  0a			asl a
$16:f181  fc be 03	  jsr ($03be,x)
$16:f184  ea			nop
$16:f185  a1 00		 lda ($00,x)
$16:f187  a4 4c		 ldy $4c
$16:f189  03 f6		 ora $f6,s
$16:f18b  db			stp
$16:f18c  0b			phd
$16:f18d  c4 0a		 cpy $0a
$16:f18f  05 10		 ora $10
$16:f191  24 03		 bit $03
$16:f193  cf c4 31 c0   cmp $c031c4
$16:f197  e0 42		 cpx #$42
$16:f199  21 02		 and ($02,x)
$16:f19b  a1 81		 lda ($81,x)
$16:f19d  04 40		 tsb $40
$16:f19f  dc 10 58	  jml [$5810]
$16:f1a2  2c 12 08	  bit $0812
$16:f1a5  fe f1 7f	  inc $7ff1,x
$16:f1a8  90 3e		 bcc $f1e8
$16:f1aa  01 20		 ora ($20,x)
$16:f1ac  90 3c		 bcc $f1ea
$16:f1ae  48			pha
$16:f1af  3a			dec a
$16:f1b0  0e f0 73	  asl $73f0
$16:f1b3  25 02		 and $02
$16:f1b5  00 12		 brk #$12
$16:f1b7  00 f2		 brk #$f2
$16:f1b9  17 0a		 ora [$0a],y
$16:f1bb  17 0b		 ora [$0b],y
$16:f1bd  21 7b		 and ($7b,x)
$16:f1bf  7e fc 1e	  ror $1efc,x
$16:f1c2  08			php
$16:f1c3  c4 60		 cpy $60
$16:f1c5  b2 4e		 lda ($4e)
$16:f1c7  f0 0c		 beq $f1d5
$16:f1c9  80 64		 bra $f22f
$16:f1cb  10 1d		 bpl $f1ea
$16:f1cd  14 86		 trb $86
$16:f1cf  45 e1		 eor $e1
$16:f1d1  eb			xba
$16:f1d2  14 83		 trb $83
$16:f1d4  c7 e4		 cmp [$e4]
$16:f1d6  f1 f9		 sbc ($f9),y
$16:f1d8  35 6e		 and $6e,x
$16:f1da  07 1f		 ora [$1f]
$16:f1dc  80 30		 bra $f20e
$16:f1de  1a			inc a
$16:f1df  1f 00 97 c0   ora $c09700,x
$16:f1e3  2c f6 89	  bit $89f6
$16:f1e6  84 a2		 sty $a2
$16:f1e8  61 a8		 adc ($a8,x)
$16:f1ea  d8			cld
$16:f1eb  7a			ply
$16:f1ec  3e 0d 50	  rol $500d,x
$16:f1ef  e0 76		 cpx #$76
$16:f1f1  28			plp
$16:f1f2  9d 8d 27	  sta $278d,x
$16:f1f5  6b			rtl
$16:f1f6  81 b8		 sta ($b8,x)
$16:f1f8  e0 7e		 cpx #$7e
$16:f1fa  28			plp
$16:f1fb  1f 88 03 90   ora $900388,x
$16:f1ff  64 1f		 stz $1f
$16:f201  09 07 d2	  ora #$d207
$16:f204  01 e6		 ora ($e6,x)
$16:f206  80 47		 bra $f24f
$16:f208  1d e3 0c	  ora $0ce3,x
$16:f20b  40			rti
$16:f20c  79 1d f0	  adc $f01d,y
$16:f20f  96 3e		 stx $3e,y
$16:f211  04 fe		 tsb $fe
$16:f213  21 ee		 and ($ee,x)
$16:f215  80 7f		 bra $f296
$16:f217  e8			inx
$16:f218  9b			txy
$16:f219  bc 25 0d	  ldy $0d25,x
$16:f21c  34 00		 bit $00,x
$16:f21e  c2 80		 rep #$80
$16:f220  70 20		 bvs $f242
$16:f222  05 61		 ora $61
$16:f224  80 51		 bra $f277
$16:f226  03 e2		 ora $e2,s
$16:f228  5c 27 80 47   jml $478027
$16:f22c  a2 10		 ldx #$10
$16:f22e  f8			sed
$16:f22f  64 0e		 stz $0e
$16:f231  00 36		 brk #$36
$16:f233  18			clc
$16:f234  0a			asl a
$16:f235  68			pla
$16:f236  20 c5 d3	  jsr $d3c5
$16:f239  2b			pld
$16:f23a  03 d1		 ora $d1,s
$16:f23c  13 c0		 ora ($c0,s),y
$16:f23e  9e de 04	  stz $04de,x
$16:f241  81 05		 sta ($05,x)
$16:f243  de 58 d7	  dec $d758,x
$16:f246  06 7d		 asl $7d
$16:f248  81 8f		 sta ($8f,x)
$16:f24a  40			rti
$16:f24b  63 cc		 adc $cc,s
$16:f24d  90 80		 bcc $f1cf
$16:f24f  c3 a0		 cmp $a0,s
$16:f251  70 c1		 bvs $f214
$16:f253  e8			inx
$16:f254  f9 60 1c	  sbc $1c60,y
$16:f257  18			clc
$16:f258  06 04		 asl $04
$16:f25a  9a			txs
$16:f25b  69 e0 1b	  adc #$1be0
$16:f25e  04 06		 tsb $06
$16:f260  4f 58 91 d7   eor $d79158
$16:f264  34 3d		 bit $3d,x
$16:f266  89 07 62	  bit #$6207
$16:f269  81 b0		 sta ($b0,x)
$16:f26b  c0 5c		 cpy #$5c
$16:f26d  12 e0		 ora ($e0)
$16:f26f  6d 0c 06	  adc $060c
$16:f272  9f 01 a3 80   sta $80a301,x
$16:f276  68			pla
$16:f277  60			rts
$16:f278  1a			inc a
$16:f279  08			php
$16:f27a  05 00		 ora $00
$16:f27c  42 22		 wdm #$22
$16:f27e  20 c0 44	  jsr $44c0
$16:f281  22 14 4b 66   jsl $664b14
$16:f285  0a			asl a
$16:f286  51 7c		 eor ($7c),y
$16:f288  eb			xba
$16:f289  77 ab		 adc [$ab],y
$16:f28b  94 c8		 sty $c8,x
$16:f28d  40			rti
$16:f28e  fd 22 15	  sbc $1522,x
$16:f291  4a			lsr a
$16:f292  a7 5a		 lda [$5a]
$16:f294  01 fe		 ora ($fe,x)
$16:f296  90 7f		 bcc $f317
$16:f298  a6 17		 ldx $17
$16:f29a  c5 e2		 cmp $e2
$16:f29c  df 28 97 c9   cmp $c99728,x
$16:f2a0  c7 1b		 cmp [$1b]
$16:f2a2  8d ba c1	  sta $c1ba
$16:f2a5  71 b0		 adc ($b0),y
$16:f2a7  44 04 aa	  mvp $aa,$04
$16:f2aa  40			rti
$16:f2ab  19 41 fe	  ora $fe41,y
$16:f2ae  80 71		 bra $f321
$16:f2b0  a0 0d		 ldy #$0d
$16:f2b2  b0 6d		 bcs $f321
$16:f2b4  98			tya
$16:f2b5  1c b2 19	  trb $19b2
$16:f2b8  08			php
$16:f2b9  4c 26 81	  jmp $8126
$16:f2bc  40			rti
$16:f2bd  57 84		 eor [$84],y
$16:f2bf  18			clc
$16:f2c0  7c 85 f1	  jmp ($f185,x)
$16:f2c3  7f 39 24 a0   adc $a02439,x
$16:f2c7  32 09		 and ($09)
$16:f2c9  03 e4		 ora $e4,s
$16:f2cb  20 90 45	  jsr $4590
$16:f2ce  78			sei
$16:f2cf  70 38		 bvs $f309
$16:f2d1  10 48		 bpl $f31b
$16:f2d3  00 7c		 brk #$7c
$16:f2d5  17 40		 ora [$40],y
$16:f2d7  44 0c 01	  mvp $01,$0c
$16:f2da  7e df 21	  ror $21df,x
$16:f2dd  30 98		 bmi $f277
$16:f2df  42 a1		 wdm #$a1
$16:f2e1  45 fc		 eor $fc
$16:f2e3  82 97 d6	  brl $c97d
$16:f2e6  05 02		 ora $02
$16:f2e8  32 00		 and ($00)
$16:f2ea  64 25		 stz $25
$16:f2ec  12 8b		 ora ($8b)
$16:f2ee  05 80		 ora $80
$16:f2f0  9a			txs
$16:f2f1  6e e1 10	  ror $10e1
$16:f2f4  e6 00		 inc $00
$16:f2f6  e2 23		 sep #$23
$16:f2f8  34 87		 bit $87,x
$16:f2fa  c3 c7		 cmp $c7,s
$16:f2fc  78			sei
$16:f2fd  0f 40 98 14   ora $149840
$16:f301  40			rti
$16:f302  a2 01		 ldx #$01
$16:f304  90 8c		 bcc $f292
$16:f306  46 3c		 lsr $3c
$16:f308  1e 03 f7	  asl $f703,x
$16:f30b  c0 3c		 cpy #$3c
$16:f30d  91 bf		 sta ($bf),y
$16:f30f  04 7f		 tsb $7f
$16:f311  21 0f		 and ($0f,x)
$16:f313  88			dey
$16:f314  2d 06 13	  and $1306
$16:f317  06 85		 asl $85
$16:f319  c1 17		 cmp ($17,x)
$16:f31b  60			rts
$16:f31c  ae 08 07	  ldx $0708
$16:f31f  00 e0		 brk #$e0
$16:f321  00 e4		 brk #$e4
$16:f323  80 40		 bra $f365
$16:f325  d9 61 27	  cmp $2761,y
$16:f328  ec 33 c3	  cpx $c333
$16:f32b  53 50		 eor ($50,s),y
$16:f32d  94 74		 sty $74,x
$16:f32f  29 1b		 and #$1b
$16:f331  0c 85 81	  tsb $8185
$16:f334  b2 15		 lda ($15)
$16:f336  0d 04 03	  ora $0304
$16:f339  4f 00 d1 c0   eor $c0d100
$16:f33d  34 30		 bit $30,x
$16:f33f  09 01		 ora #$01
$16:f341  d8			cld
$16:f342  18			clc
$16:f343  22 ea 23 51   jsl $5123ea
$16:f347  86 c2		 stx $c2
$16:f349  d1 68		 cmp ($68),y
$16:f34b  ee 73 2f	  inc $2f73
$16:f34e  7e 3d e7	  ror $e73d,x
$16:f351  40			rti
$16:f352  d4 45		 pei ($45)
$16:f354  a0 4e		 ldy #$4e
$16:f356  06 42		 asl $42
$16:f358  01 30		 ora ($30,x)
$16:f35a  80 47		 bra $f3a3
$16:f35c  20 12 f3	  jsr $f312
$16:f35f  50 e4		 bvc $f345
$16:f361  32 07		 and ($07)
$16:f363  30 e0		 bmi $f345
$16:f365  70 2c		 bvs $f393
$16:f367  96 c8		 stx $c8,y
$16:f369  9a			txs
$16:f36a  c8			iny
$16:f36b  33 f0		 and ($f0,s),y
$16:f36d  89 f1		 bit #$f1
$16:f36f  68			pla
$16:f370  0b			phd
$16:f371  41 70		 eor ($70,x)
$16:f373  04 09		 tsb $09
$16:f375  9c 1d 00	  stz $001d
$16:f378  6a			ror a
$16:f379  0c 09 a8	  tsb $a809
$16:f37c  cb			wai
$16:f37d  21 b0		 and ($b0,x)
$16:f37f  d8			cld
$16:f380  76 23		 ror $23,x
$16:f382  16 88		 asl $88,x
$16:f384  43 d4		 eor $d4,s
$16:f386  25 13		 and $13
$16:f388  83 52		 sta $52,s
$16:f38a  3a			dec a
$16:f38b  01 38		 ora ($38,x)
$16:f38d  1f 78 05 be   ora $be0578,x
$16:f391  01 07		 ora ($07,x)
$16:f393  42 3c		 wdm #$3c
$16:f395  16 4b		 asl $4b,x
$16:f397  9e ff 48	  stz $48ff,x
$16:f39a  27 d4		 and [$d4]
$16:f39c  0b			phd
$16:f39d  f1 41		 sbc ($41),y
$16:f39f  60			rts
$16:f3a0  10 22		 bpl $f3c4
$16:f3a2  80 bb		 bra $f35f
$16:f3a4  81 88		 sta ($88,x)
$16:f3a6  85 51		 sta $51
$16:f3a8  82 c9 e4	  brl $d874
$16:f3ab  ef 50 86 43   sbc $438650
$16:f3af  27 03		 and [$03]
$16:f3b1  e5 33		 sbc $33
$16:f3b3  84 60		 sty $60
$16:f3b5  04 38		 tsb $38
$16:f3b7  32 61		 and ($61)
$16:f3b9  c0 a0		 cpy #$a0
$16:f3bb  51 84		 eor ($84),y
$16:f3bd  38			sec
$16:f3be  30 43		 bmi $f403
$16:f3c0  80 f5		 bra $f3b7
$16:f3c2  00 98		 brk #$98
$16:f3c4  50 05		 bvc $f3cb
$16:f3c6  24 9f		 bit $9f
$16:f3c8  93 6b		 sta ($6b,s),y
$16:f3ca  14 0a		 trb $0a
$16:f3cc  89 44		 bit #$44
$16:f3ce  a3 7b		 lda $7b,s
$16:f3d0  a0 16		 ldy #$16
$16:f3d2  e8			inx
$16:f3d3  02 fd		 cop #$fd
$16:f3d5  e8			inx
$16:f3d6  90 05		 bcc $f3dd
$16:f3d8  e1 42		 sbc ($42,x)
$16:f3da  21 11		 and ($11,x)
$16:f3dc  88			dey
$16:f3dd  84 92		 sty $92
$16:f3df  79 38 b6	  adc $b638,y
$16:f3e2  5d 2e 14	  eor $142e,x
$16:f3e5  88			dey
$16:f3e6  64 c2		 stz $c2
$16:f3e8  3d 08 83	  and $8308,x
$16:f3eb  33 81		 and ($81,s),y
$16:f3ed  0c 33 48	  tsb $4833
$16:f3f0  05 f2		 ora $f2
$16:f3f2  11 7c		 ora ($7c),y
$16:f3f4  98			tya
$16:f3f5  5e 20 13	  lsr $1320,x
$16:f3f8  c8			iny
$16:f3f9  04 39		 tsb $39
$16:f3fb  7e 90 14	  ror $1490,x
$16:f3fe  80 40		 bra $f440
$16:f400  49 a1		 eor #$a1
$16:f402  0d 81 47	  ora $4781
$16:f405  9e a0 ef	  stz $efa0,x
$16:f408  68			pla
$16:f409  19 30 61	  ora $6130,y
$16:f40c  b0 08		 bcs $f416
$16:f40e  f2 fc		 sbc ($fc)
$16:f410  ae 10 0d	  ldx $0d10
$16:f413  05 82		 ora $82
$16:f415  81 e4		 sta ($e4,x)
$16:f417  c2 53		 rep #$53
$16:f419  38			sec
$16:f41a  90 cf		 bcc $f3eb
$16:f41c  64 71		 stz $71
$16:f41e  7e 61 30	  ror $3061,x
$16:f421  23 87		 and $87,s
$16:f423  92 01		 sta ($01)
$16:f425  cc 14 8f	  cpy $8f14
$16:f428  f0 1e		 beq $f448
$16:f42a  fe 04 e0	  inc $e004,x
$16:f42d  70 a0		 bvs $f3cf
$16:f42f  de 48 60	  dec $6048,x
$16:f432  7d c4 c0	  adc $c0c4,x
$16:f435  6b			rtl
$16:f436  0e 34 03	  asl $0334
$16:f439  d8			cld
$16:f43a  2f a2 50 78   and $7850a2
$16:f43e  07 d8		 ora [$d8]
$16:f440  4a			lsr a
$16:f441  02 71		 cop #$71
$16:f443  c0 a0 d0	  cpy #$d0a0
$16:f446  78			sei
$16:f447  7c 3e 19	  jmp ($193e,x)
$16:f44a  07 8f		 ora [$8f]
$16:f44c  c2 62		 rep #$62
$16:f44e  f0 74		 beq $f4c4
$16:f450  a0 af c1	  ldy #$c1af
$16:f453  bc 10 f8	  ldy $f810,x
$16:f456  00 f8		 brk #$f8
$16:f458  23 f0		 and $f0,s
$16:f45a  08			php
$16:f45b  bb			tyx
$16:f45c  84 24		 sty $24
$16:f45e  0b			phd
$16:f45f  f4 c0 60	  pea $60c0
$16:f462  38			sec
$16:f463  1c 0f 87	  trb $870f
$16:f466  c3 51		 cmp $51,s
$16:f468  e8			inx
$16:f469  b4 7a		 ldy $7a,x
$16:f46b  16 29		 asl $29,x
$16:f46d  80 24		 bra $f493
$16:f46f  8f c2 01 e8   sta $e801c2
$16:f473  88			dey
$16:f474  2a			rol a
$16:f475  c2 0b		 rep #$0b
$16:f477  02 57		 cop #$57
$16:f479  83 dc		 sta $dc,s
$16:f47b  16 65		 asl $65,x
$16:f47d  0c 81 c4	  tsb $c481
$16:f480  a1 90		 lda ($90,x)
$16:f482  c8			iny
$16:f483  80 14		 bra $f499
$16:f485  5f cc 3e 05   eor $053ecc,x
$16:f489  f0 40		 beq $f4cb
$16:f48b  24 1c		 bit $1c
$16:f48d  0d 01 68	  ora $6801
$16:f490  68			pla
$16:f491  03 90		 ora $90,s
$16:f493  c0 4c 38	  cpy #$384c
$16:f496  14 89		 trb $89
$16:f498  84 c2		 sty $c2
$16:f49a  11 00		 ora ($00),y
$16:f49c  52 83		 eor ($83)
$16:f49e  80 94		 bra $f434
$16:f4a0  25 30		 and $30
$16:f4a2  80 37		 bra $f4db
$16:f4a4  81 10		 sta ($10,x)
$16:f4a6  17 48		 ora [$48],y
$16:f4a8  3e fe 41	  rol $41fe,x
$16:f4ab  ff 80 5e e0   sbc $e05e80,x
$16:f4af  13 f4		 ora ($f4,s),y
$16:f4b1  40			rti
$16:f4b2  a1 42		 lda ($42,x)
$16:f4b4  01 8b		 ora ($8b,x)
$16:f4b6  6a			ror a
$16:f4b7  02 84		 cop #$84
$16:f4b9  60			rts
$16:f4ba  8c 35 50	  sty $5035
$16:f4bd  85 33		 sta $33
$16:f4bf  ff 08 fd c1   sbc $c1fd08,x
$16:f4c3  3b			tsc
$16:f4c4  f0 0f		 beq $f4d5
$16:f4c6  fc 13 ff	  jsr ($ff13,x)
$16:f4c9  80 7a		 bra $f545
$16:f4cb  04 fe		 tsb $fe
$16:f4cd  81 47		 sta ($47,x)
$16:f4cf  01 92		 ora ($92,x)
$16:f4d1  39 58 66	  and $6658,y
$16:f4d4  79 08 84	  adc $8408,y
$16:f4d7  7e 4f 27	  ror $274f,x
$16:f4da  82 cf 5f	  brl $54ac
$16:f4dd  26 c2		 rol $c2
$16:f4df  15 28		 ora $28,x
$16:f4e1  58			cli
$16:f4e2  11 80		 ora ($80),y
$16:f4e4  72 01		 adc ($01)
$16:f4e6  24 7f		 bit $7f
$16:f4e8  a2 1f ee	  ldx #$ee1f
$16:f4eb  07 f8		 ora [$f8]
$16:f4ed  9e 11 8f	  stz $8f11,x
$16:f4f0  f4 08 a8	  pea $a808
$16:f4f3  1e 01 24	  asl $2401,x
$16:f4f6  b0 d6		 bcs $f4ce
$16:f4f8  4d 06 f4	  eor $f406
$16:f4fb  42 2a		 wdm #$2a
$16:f4fd  15 09		 ora $09,x
$16:f4ff  00 8d		 brk #$8d
$16:f501  ef 30 05 48   sbc $480530
$16:f505  68			pla
$16:f506  04 92		 tsb $92
$16:f508  75 08		 adc $08,x
$16:f50a  f4 7a 0b	  pea $0b7a
$16:f50d  05 3d		 ora $3d
$16:f50f  92 55		 sta ($55)
$16:f511  1a			inc a
$16:f512  60			rts
$16:f513  7b			tdc
$16:f514  02 2c		 cop #$2c
$16:f516  a5 4e		 lda $4e
$16:f518  4b			phk
$16:f519  20 97 c0	  jsr $c097
$16:f51c  22 90 49 94   jsl $944990
$16:f520  ca			dex
$16:f521  3f 1f 84 3b   and $3b841f,x
$16:f525  04 f6		 tsb $f6
$16:f527  09 40 b7	  ora #$b740
$16:f52a  c0 33 70	  cpy #$7033
$16:f52d  0c 6a 92	  tsb $926a
$16:f530  60			rts
$16:f531  50 25		 bvc $f558
$16:f533  e8			inx
$16:f534  44 22 08	  mvp $08,$22
$16:f537  d2 52		 cmp ($52)
$16:f539  68			pla
$16:f53a  dc 67 b0	  jml [$b067]
$16:f53d  28			plp
$16:f53e  ec 8a 15	  cpx $158a
$16:f541  15 17		 ora $17,x
$16:f543  04 06		 tsb $06
$16:f545  06 3b		 asl $3b
$16:f547  28			plp
$16:f548  04 5a		 tsb $5a
$16:f54a  01 34		 ora ($34,x)
$16:f54c  80 47		 bra $f595
$16:f54e  20 0b e2	  jsr $e20b
$16:f551  7d 1d b3	  adc $b31d,x
$16:f554  b9 c4 de	  lda $dec4,y
$16:f557  70 24		 bvs $f57d
$16:f559  85 b1		 sta $b1
$16:f55b  2e 0e 00	  rol $000e
$16:f55e  7e 07 b0	  ror $b007,x
$16:f561  fe 40 3b	  inc $3b40,x
$16:f564  90 0e		 bcc $f574
$16:f566  22 38 08 02   jsl $020838
$16:f56a  3d 20 70	  and $7020,x
$16:f56d  f3 37		 sbc ($37,s),y
$16:f56f  9c 49 64	  stz $6449
$16:f572  03 c8		 ora $c8,s
$16:f574  17 be		 ora [$be],y
$16:f576  64 00		 stz $00
$16:f578  28			plp
$16:f579  02 85		 cop #$85
$16:f57b  b7 77		 lda [$77],y
$16:f57d  86 25		 stx $25
$16:f57f  04 f6		 tsb $f6
$16:f581  48			pha
$16:f582  06 c0		 asl $c0
$16:f584  1a			inc a
$16:f585  4f f1 04 c6   eor $c604f1
$16:f589  81 64		 sta ($64,x)
$16:f58b  14 a4		 trb $a4
$16:f58d  12 39		 ora ($39)
$16:f58f  06 87		 asl $87
$16:f591  40			rti
$16:f592  60			rts
$16:f593  ed 50 4a	  sbc $4a50
$16:f596  b4 fa		 ldy $fa,x
$16:f598  c7 4f		 cmp [$4f]
$16:f59a  a0 c1 e1	  ldy #$e1c1
$16:f59d  10 a8		 bpl $f547
$16:f59f  6b			rtl
$16:f5a0  e4 20		 cpx $20
$16:f5a2  70 75		 bvs $f619
$16:f5a4  79 79 3c	  adc $3c79,y
$16:f5a7  9c 4e 26	  stz $264e
$16:f5aa  13 08		 ora ($08,s),y
$16:f5ac  e0 8f a4	  cpx #$a48f
$16:f5af  63 99		 adc $99,s
$16:f5b1  38			sec
$16:f5b2  4a			lsr a
$16:f5b3  08			php
$16:f5b4  6c 38 1c	  jmp ($1c38)
$16:f5b7  00 c0		 brk #$c0
$16:f5b9  b4 c6		 ldy $c6,x
$16:f5bb  03 06		 ora $06,s
$16:f5bd  81 c1		 sta ($c1,x)
$16:f5bf  20 f0 a8	  jsr $a8f0
$16:f5c2  1c 1a 1f	  trb $1f1a
$16:f5c5  09 38 8c	  ora #$8c38
$16:f5c8  29 14 0f	  and #$0f14
$16:f5cb  a0 45 04	  ldy #$0445
$16:f5ce  1e 09 0f	  asl $0f09,x
$16:f5d1  80 31		 bra $f604
$16:f5d3  86 03		 stx $03
$16:f5d5  0f 38 87 83   ora $838738
$16:f5d9  81 30		 sta ($30,x)
$16:f5db  f0 68		 beq $f645
$16:f5dd  2c 16 8f	  bit $8f16
$16:f5e0  06 72		 asl $72
$16:f5e2  a1 d4		 lda ($d4,x)
$16:f5e4  90 6e		 bcc $f654
$16:f5e6  38			sec
$16:f5e7  1b			tcs
$16:f5e8  80 b1		 bra $f59b
$16:f5ea  7c 22 0e	  jmp ($0e22,x)
$16:f5ed  20 fc 4b	  jsr $4bfc
$16:f5f0  3e 19 cf	  rol $cf19,x
$16:f5f3  47 63		 eor [$63]
$16:f5f5  c1 b0		 cmp ($b0,x)
$16:f5f7  dc 25 53	  jml [$5325]
$16:f5fa  40			rti
$16:f5fb  d3 1d		 cmp ($1d,s),y
$16:f5fd  57 8b		 eor [$8b],y
$16:f5ff  2d f0 84	  and $84f0
$16:f602  de 55 64	  dec $6455,x
$16:f605  28			plp
$16:f606  0a			asl a
$16:f607  04 02		 tsb $02
$16:f609  21 00		 and ($00,x)
$16:f60b  8e 31 c6	  stx $c631
$16:f60e  0c 95 38	  tsb $3895
$16:f611  80 4c		 bra $f65f
$16:f613  73 99		 adc ($99,s),y
$16:f615  cc 5e 2e	  cpy $2e5e
$16:f618  d1 6c		 cmp ($6c),y
$16:f61a  d8			cld
$16:f61b  7d d2 a8	  adc $a8d2,x
$16:f61e  48			pha
$16:f61f  02 40		 cop #$40
$16:f621  5d 20 11	  eor $1120,x
$16:f624  38			sec
$16:f625  04 21		 tsb $21
$16:f627  2a			rol a
$16:f628  73 09		 adc ($09,s),y
$16:f62a  85 c2		 sta $c2
$16:f62c  81 98		 sta ($98,x)
$16:f62e  c4 60		 cpy $60
$16:f630  30 f4		 bmi $f626
$16:f632  2a			rol a
$16:f633  14 0e		 trb $0e
$16:f635  fe 95 49	  inc $4995,x
$16:f638  84 02		 sty $02
$16:f63a  e1 00		 sbc ($00,x)
$16:f63c  bc 40 27	  ldy $2740,x
$16:f63f  a9 58 80	  lda #$8058
$16:f642  4e 27 1c	  lsr $1c27
$16:f645  1e 0c 1a	  asl $1a0c,x
$16:f648  0c 17 04	  tsb $0417
$16:f64b  ac 4f a0	  ldy $a04f
$16:f64e  1f 80 10 a5   ora $a51080,x
$16:f652  50 b6		 bvc $f60a
$16:f654  10 a8		 bpl $f5fe
$16:f656  52 ac		 eor ($ac)
$16:f658  a0 6c 00	  ldy #$006c
$16:f65b  4a			lsr a
$16:f65c  9c 06 01	  stz $0106
$16:f65f  04 26		 tsb $26
$16:f661  3c 05 0a	  bit $0a05,x
$16:f664  10 0a		 bpl $f670
$16:f666  85 42		 sta $42
$16:f668  08			php
$16:f669  87 1f		 sta [$1f]
$16:f66b  c7 e3		 cmp [$e3]
$16:f66d  19 8c 77	  ora $778c,y
$16:f670  a6 00		 ldx $00
$16:f672  c2 a4		 rep #$a4
$16:f674  70 30		 bvs $f6a6
$16:f676  b4 32		 ldy $32,x
$16:f678  19 13 88	  ora $8813,y
$16:f67b  4a			lsr a
$16:f67c  e4 72		 cpx $72
$16:f67e  89 41 85	  bit #$8541
$16:f681  8f c0 0b 00   sta $000bc0
$16:f685  48			pha
$16:f686  01 c1		 ora ($c1,x)
$16:f688  16 c0		 asl $c0,x
$16:f68a  b0 8e		 bcs $f61a
$16:f68c  8a			txa
$16:f68d  82 07 38	  brl $2e97
$16:f690  5f 2c 3a 01   eor $013a2c,x
$16:f694  1f 73 0c f1   ora $f10c73,x
$16:f698  98			tya
$16:f699  72 09		 adc ($09)
$16:f69b  00 bd		 brk #$bd
$16:f69d  38			sec
$16:f69e  1c 0c 46	  trb $460c
$16:f6a1  20 26 08	  jsr $0826
$16:f6a4  d2 a0		 cmp ($a0)
$16:f6a6  29 05 4a	  and #$4a05
$16:f6a9  13 82		 ora ($82,s),y
$16:f6ab  30 a9		 bmi $f656
$16:f6ad  42 80		 wdm #$80
$16:f6af  03 05		 ora $05,s
$16:f6b1  20 29 55	  jsr $5529
$16:f6b4  6e 14 4a	  ror $4a14
$16:f6b7  21 32		 and ($32,x)
$16:f6b9  51 a3		 eor ($a3),y
$16:f6bb  08			php
$16:f6bc  45 3c		 eor $3c
$16:f6be  0a			asl a
$16:f6bf  05 07		 ora $07
$16:f6c1  83 c3		 sta $c3,s
$16:f6c3  61 f1		 adc ($f1,x)
$16:f6c5  e7 38		 sbc [$38]
$16:f6c7  20 16 05	  jsr $0516
$16:f6ca  01 83		 ora ($83,x)
$16:f6cc  b2 04		 lda ($04)
$16:f6ce  7c 97 0b	  jmp ($0b97,x)
$16:f6d1  80 4c		 bra $f71f
$16:f6d3  82 60 f9	  brl $f036
$16:f6d6  0f 07 81 52   ora $528107
$16:f6da  9a			txs
$16:f6db  0b			phd
$16:f6dc  05 03		 ora $03
$16:f6de  c1 80		 cmp ($80,x)
$16:f6e0  a0 70 a0	  ldy #$a070
$16:f6e3  de 48 62	  dec $6248,x
$16:f6e6  34 a0		 bit $a0,x
$16:f6e8  50 68		 bvc $f752
$16:f6ea  3c 3e 1f	  bit $1f3e,x
$16:f6ed  0c 83 c7	  tsb $c783
$16:f6f0  e1 71		 sbc ($71,x)
$16:f6f2  78			sei
$16:f6f3  34 64		 bit $64,x
$16:f6f5  82 50 66	  brl $5d48
$16:f6f8  40			rti
$16:f6f9  9b			txy
$16:f6fa  81 ce		 sta ($ce,x)
$16:f6fc  11 79		 ora ($79),y
$16:f6fe  04 e6		 tsb $e6
$16:f700  c0 a7 42	  cpy #$42a7
$16:f703  ca			dex
$16:f704  68			pla
$16:f705  3c 17 0f	  bit $0f17,x
$16:f708  82 3d 60	  brl $5748
$16:f70b  1c 08 01	  trb $0108
$16:f70e  78			sei
$16:f70f  0b			phd
$16:f710  c0 9e 08	  cpy #$089e
$16:f713  34 2e		 bit $2e,x
$16:f715  1b			tcs
$16:f716  03 83		 ora $83,s
$16:f718  42 61		 wdm #$61
$16:f71a  30 e8		 bmi $f704
$16:f71c  51 e4		 eor ($e4),y
$16:f71e  22 f6 ab bd   jsl $bdabf6
$16:f722  76 c5		 ror $c5,x
$16:f724  06 87		 asl $87
$16:f726  40			rti
$16:f727  d6 00		 dec $00,x
$16:f729  3b			tsc
$16:f72a  06 28		 asl $28
$16:f72c  c7 e3		 cmp [$e3]
$16:f72e  f7 fb		 sbc [$fb],y
$16:f730  fd 9e cf	  sbc $cf9e,x
$16:f733  30 f4		 bmi $f729
$16:f735  76 3d		 ror $3d,x
$16:f737  1b			tcs
$16:f738  06 88		 asl $88
$16:f73a  3f 43 f1 f8   and $f8f143,x
$16:f73e  f4 74 3d	  pea $3d74
$16:f741  93 4e		 sta ($4e,s),y
$16:f743  66 c3		 ror $c3
$16:f745  71 e0		 adc ($e0),y
$16:f747  f4 70 3b	  pea $3b70
$16:f74a  12 89		 ora ($89)
$16:f74c  c3 60		 cmp $60,s
$16:f74e  1b			tcs
$16:f74f  01 fc		 ora ($fc,x)
$16:f751  fe 7b 3d	  inc $3d7b,x
$16:f754  94 3b		 sty $3b,x
$16:f756  fc 03 ff	  jsr ($ff03,x)
$16:f759  00 ff		 brk #$ff
$16:f75b  3c 45 e4	  bit $e445,x
$16:f75e  0f 00 42 81   ora $814200
$16:f762  01 40		 ora ($40,x)
$16:f764  91 08		 sta ($08),y
$16:f766  bf 83 c2 01   lda $01c283,x
$16:f76a  3f 92 04 84   and $840492,x
$16:f76e  2e 28 50	  rol $5028
$16:f771  81 a9		 sta ($a9,x)
$16:f773  41 4a		 eor ($4a,x)
$16:f775  14 00		 trb $00
$16:f777  24 be		 bit $be
$16:f779  46 ff		 lsr $ff
$16:f77b  0a			asl a
$16:f77c  bd c1 af	  lda $afc1,x
$16:f77f  cf 91 0d 13   cmp $130d91
$16:f783  f4 e0 80	  pea $80e0
$16:f786  29 b8 7e	  and #$7eb8
$16:f789  20 1f c8	  jsr $c81f
$16:f78c  27 f2		 and [$f2]
$16:f78e  a1 7c		 lda ($7c,x)
$16:f790  80 7e		 bra $f810
$16:f792  20 3f 15	  jsr $153f
$16:f795  20 81 14	  jsr $1481
$16:f798  b8			clv
$16:f799  f0 0a		 beq $f7a5
$16:f79b  b5 1b		 lda $1b,x
$16:f79d  51 88		 eor ($88),y
$16:f79f  4a			lsr a
$16:f7a0  85 42		 sta $42
$16:f7a2  a0 04 69	  ldy #$6904
$16:f7a5  c9 38 10	  cmp #$1038
$16:f7a8  03 20		 ora $20,s
$16:f7aa  02 3c		 cop #$3c
$16:f7ac  0a			asl a
$16:f7ad  05 39		 ora $39
$16:f7af  3f 80 12 7f   and $7f1280,x
$16:f7b3  90 08		 bcc $f7bd
$16:f7b5  30 92		 bmi $f749
$16:f7b7  9f a7 03 81   sta $8103a7,x
$16:f7bb  c2 21		 rep #$21
$16:f7bd  12 09		 ora ($09)
$16:f7bf  04 16		 tsb $16
$16:f7c1  0b			phd
$16:f7c2  40			rti
$16:f7c3  a0 1c c0	  ldy #$c01c
$16:f7c6  09 10 20	  ora #$2010
$16:f7c9  70 40		 bvs $f80b
$16:f7cb  22 00 47 82   jsl $824700
$16:f7cf  41 22		 eor ($22,x)
$16:f7d1  0c d8 58	  tsb $58d8
$16:f7d4  13 28		 ora ($28,s),y
$16:f7d6  d0 ad		 bne $f785
$16:f7d8  07 83		 ora [$83]
$16:f7da  c6 23		 dec $23
$16:f7dc  0b			phd
$16:f7dd  70 5b		 bvs $f83a
$16:f7df  82 ec 0c	  brl $04ce
$16:f7e2  06 ff		 asl $ff
$16:f7e4  95 a8		 sta $a8,x
$16:f7e6  64 32		 stz $32
$16:f7e8  0d 90 5a	  ora $5a90
$16:f7eb  83 fd		 sta $fd,s
$16:f7ed  97 d2		 sta [$d2],y
$16:f7ef  60			rts
$16:f7f0  38			sec
$16:f7f1  fc 5a 7b	  jsr ($7b5a,x)
$16:f7f4  36 8e		 rol $8e,x
$16:f7f6  cf a1 51 d7   cmp $d751a1
$16:f7fa  a0 18 0e	  ldy #$0e18
$16:f7fd  01 16		 ora ($16,x)
$16:f7ff  80 4d		 bra $f84e
$16:f801  a0 13 e8	  ldy #$e813
$16:f804  00 d8		 brk #$d8
$16:f806  a0 30 32	  ldy #$3230
$16:f809  40			rti
$16:f80a  18			clc
$16:f80b  01 f6		 ora ($f6,x)
$16:f80d  36 0e		 rol $0e,x
$16:f80f  07 82		 ora [$82]
$16:f811  01 c0		 ora ($c0,x)
$16:f813  0f 35 b3 b9   ora $b9b335
$16:f817  ec ce 79	  cpx $79ce
$16:f81a  21 9c		 and ($9c,x)
$16:f81c  09 26 82	  ora #$8226
$16:f81f  c0 1d 15	  cpy #$151d
$16:f822  f0 c2		 beq $f7e6
$16:f824  63 30		 adc $30,s
$16:f826  d8			cld
$16:f827  ec 06 1e	  cpx $1e06
$16:f82a  39 40 d1	  and $d140,y
$16:f82d  57 68		 eor [$68],y
$16:f82f  d1 f9		 cmp ($f9),y
$16:f831  14 be		 trb $be
$16:f833  60			rts
$16:f834  a0 08 34	  ldy #$3408
$16:f837  3e 1d 1f	  rol $1f1d,x
$16:f83a  80 93		 bra $f7cf
$16:f83c  07 d1		 ora [$d1]
$16:f83e  e8			inx
$16:f83f  e4 72		 cpx $72
$16:f841  16 a0		 asl $a0,x
$16:f843  93 21		 sta ($21,s),y
$16:f845  ca			dex
$16:f846  7a			ply
$16:f847  22 1e 89 84   jsl $84891e
$16:f84b  62 e1 08	  per $012f
$16:f84e  0a			asl a
$16:f84f  01 d5		 ora ($d5,x)
$16:f851  6c d0 98	  jmp ($98d0)
$16:f854  bc 3d 62	  ldy $623d,x
$16:f857  10 78		 bpl $f8d1
$16:f859  fc 3e 3e	  jsr ($3e3e,x)
$16:f85c  89 09 62	  bit #$6209
$16:f85f  e8			inx
$16:f860  56 81		 lsr $81,x
$16:f862  0f 81 9d 02   ora $029d81
$16:f866  3e c4 7f	  rol $7fc4,x
$16:f869  74 5b		 stz $5b,x
$16:f86b  15 f6		 ora $f6,x
$16:f86d  cf 78 23 1e   cmp $1e2378
$16:f871  09 c7 02	  ora #$02c7
$16:f874  c0 6b 10	  cpy #$106b
$16:f877  f8			sed
$16:f878  7d bc df	  adc $dfbc,x
$16:f87b  6e 31 50	  ror $5031
$16:f87e  0a			asl a
$16:f87f  92 1a		 sta ($1a)
$16:f881  3a			dec a
$16:f882  84 02		 sty $02
$16:f884  f9 60 af	  sbc $af60,y
$16:f887  50 24		 bvc $f8ad
$16:f889  92 09		 sta ($09)
$16:f88b  8c c4 72	  sty $72c4
$16:f88e  95 88		 sta $88,x
$16:f890  04 72		 tsb $72
$16:f892  01 3f		 ora ($3f,x)
$16:f894  62 0c 38	  per $30a3
$16:f897  b4 64		 ldy $64,x
$16:f899  f0 98		 beq $f833
$16:f89b  4c 22 11	  jmp $1122
$16:f89e  88			dey
$16:f89f  94 7e		 sty $7e,x
$16:f8a1  51 2b		 eor ($2b),y
$16:f8a3  a6 53		 ldx $53
$16:f8a5  0b			phd
$16:f8a6  45 10		 eor $10
$16:f8a8  2d 09 60	  and $6009
$16:f8ab  a2 90 09	  ldx #$0990
$16:f8ae  98			tya
$16:f8af  88			dey
$16:f8b0  eb			xba
$16:f8b1  14 0f		 trb $0f
$16:f8b3  e6 02		 inc $02
$16:f8b5  e1 00		 sbc ($00,x)
$16:f8b7  de 61 e8	  dec $e861,x
$16:f8ba  14 08		 trb $08
$16:f8bc  9c cc 46	  stz $46cc
$16:f8bf  53 87		 eor ($87,s),y
$16:f8c1  b0 40		 bcs $f903
$16:f8c3  3f 10 0b c0   and $c00b10,x
$16:f8c7  20 61 8a	  jsr $8a61
$16:f8ca  a3 07		 lda $07,s
$16:f8cc  24 23		 bit $23
$16:f8ce  f1 b1		 sbc ($b1),y
$16:f8d0  f8			sed
$16:f8d1  c1 bf		 cmp ($bf,x)
$16:f8d3  c4 e8		 cpy $e8
$16:f8d5  83 83		 sta $83,s
$16:f8d7  15 54		 ora $54,x
$16:f8d9  48			pha
$16:f8da  b2 55		 lda ($55)
$16:f8dc  01 34		 ora ($34,x)
$16:f8de  23 04		 and $04,s
$16:f8e0  e8			inx
$16:f8e1  55 0c		 eor $0c,x
$16:f8e3  f0 90		 beq $f875
$16:f8e5  2a			rol a
$16:f8e6  a2 bb 5d	  ldx #$5dbb
$16:f8e9  b8			clv
$16:f8ea  0e 70 4b	  asl $4b70
$16:f8ed  f9 fa b2	  sbc $b2fa,y
$16:f8f0  19 0c 06	  ora $060c,y
$16:f8f3  22 81 77 82   jsl $827781
$16:f8f7  ff 64 1f f2   sbc $f21f64,x
$16:f8fb  73 08		 adc ($08,s),y
$16:f8fd  c2 11		 rep #$11
$16:f8ff  00 81		 brk #$81
$16:f901  1f a9 92 16   ora $1692a9,x
$16:f905  f8			sed
$16:f906  87 de		 sta [$de]
$16:f908  09 fc 29	  ora #$29fc
$16:f90b  2b			pld
$16:f90c  90 58		 bcc $f966
$16:f90e  e5 03		 sbc $03
$16:f910  27 28		 and [$28]
$16:f912  ec 28 14	  cpx $1428
$16:f915  89 04 fd	  bit #$fd04
$16:f918  7a			ply
$16:f919  11 85		 ora ($85),y
$16:f91b  f3 9f		 sbc ($9f,s),y
$16:f91d  a8			tay
$16:f91e  76 18		 ror $18,x
$16:f920  00 a8		 brk #$a8
$16:f922  a1 82		 lda ($82,x)
$16:f924  31 18		 and ($18),y
$16:f926  92 49		 sta ($49)
$16:f928  00 58		 brk #$58
$16:f92a  7d a8 34	  adc $34a8,x
$16:f92d  1a			inc a
$16:f92e  09 04 43	  ora #$4304
$16:f931  10 f0		 bpl $f923
$16:f933  19 61 12	  ora $1261,y
$16:f936  76 0c		 ror $0c,x
$16:f938  25 ae		 and $ae
$16:f93a  30 a3		 bmi $f8df
$16:f93c  f4 c0 e0	  pea $e0c0
$16:f93f  63 b0		 adc $b0,s
$16:f941  84 36		 sty $36
$16:f943  01 0c		 ora ($0c,x)
$16:f945  6c b0 83	  jmp ($83b0)
$16:f948  c0 25 87	  cpy #$8725
$16:f94b  c1 88		 cmp ($88,x)
$16:f94d  a1 8c		 lda ($8c,x)
$16:f94f  76 11		 ror $11,x
$16:f951  48			pha
$16:f952  a4 41		 ldy $41
$16:f954  d2 10		 cmp ($10)
$16:f956  0b			phd
$16:f957  15 88		 ora $88,x
$16:f959  76 8e		 ror $8e,x
$16:f95b  d0 6c		 bne $f9c9
$16:f95d  04 85		 tsb $85
$16:f95f  0c 30 18	  tsb $1830
$16:f962  05 0d		 ora $0d
$16:f964  c0 30 78	  cpy #$7830
$16:f967  38			sec
$16:f968  6c 24 12	  jmp ($1224)
$16:f96b  07 a8		 ora [$a8]
$16:f96d  50 a8		 bvc $f917
$16:f96f  41 54		 eor ($54,x)
$16:f971  11 b2		 ora ($b2),y
$16:f973  2c 07 80	  bit $8007
$16:f976  d8			cld
$16:f977  09 24 7e	  ora #$7e24
$16:f97a  2d 0f 85	  and $850f
$16:f97d  c1 e0		 cmp ($e0,x)
$16:f97f  85 90		 sta $90
$16:f981  11 ac		 ora ($ac),y
$16:f983  7e 01 0f	  ror $0f01,x
$16:f986  33 0b		 and ($0b,s),y
$16:f988  b5 8f		 lda $8f,x
$16:f98a  20 18 08	  jsr $0818
$16:f98d  36 1a		 rol $1a,x
$16:f98f  31 f8		 and ($f8),y
$16:f991  f0 78		 beq $fa0b
$16:f993  28			plp
$16:f994  1c 0d 05	  trb $050d
$16:f997  82 f1 18	  brl $128b
$16:f99a  8f 41 8f 21   sta $218f41
$16:f99e  86 80		 stx $80
$16:f9a0  7e 20 de	  ror $de20,x
$16:f9a3  08			php
$16:f9a4  e7 02		 sbc [$02]
$16:f9a6  71 60		 adc ($60),y
$16:f9a8  8e 46 07	  stx $0746
$16:f9ab  20 c0 09	  jsr $09c0
$16:f9ae  fc 01 e1	  jsr ($e101,x)
$16:f9b1  4b			phk
$16:f9b2  f0 7f		 beq $fa33
$16:f9b4  ec 9a 4f	  cpx $4f9a
$16:f9b7  14 9b		 trb $9b
$16:f9b9  c2 27		 rep #$27
$16:f9bb  f8			sed
$16:f9bc  0d fe 03	  ora $03fe
$16:f9bf  7d 40 bf	  adc $bf40,x
$16:f9c2  be c8 d6	  ldx $d6c8,y
$16:f9c5  05 e4		 ora $e4
$16:f9c7  45 81		 eor $81
$16:f9c9  3d 5e 00	  and $005e,x
$16:f9cc  1a			inc a
$16:f9cd  0b			phd
$16:f9ce  fc 04 64	  jsr ($6404,x)
$16:f9d1  2f 11 60 80   and $806011
$16:f9d5  f7 e0		 sbc [$e0],y
$16:f9d7  1f e2 79 70   ora $7079e2,x
$16:f9db  3f d7 62 80   and $8062d7,x
$16:f9df  7f 20 1f 01   adc $011f20,x
$16:f9e3  ff c0 27 b0   sbc $b027c0,x
$16:f9e7  5d 46 20	  eor $2046,x
$16:f9ea  5c 1d 0e 82   jml $820e1d
$16:f9ee  7d af 50	  adc $50af,x
$16:f9f1  0b			phd
$16:f9f2  81 6c		 sta ($6c,x)
$16:f9f4  64 09		 stz $09
$16:f9f6  f7 b5		 sbc [$b5],y
$16:f9f8  da			phx
$16:f9f9  e2 11		 sep #$11
$16:f9fb  08			php
$16:f9fc  2c 14 c9	  bit $c914
$16:f9ff  10 46		 bpl $fa47
$16:fa01  00 c0		 brk #$c0
$16:fa03  8c 93 08	  sty $0893
$16:fa06  ef c0 ff f0   sbc $f0ffc0
$16:fa0a  05 92		 ora $92
$16:fa0c  0e 3d 34	  asl $343d
$16:fa0f  6b			rtl
$16:fa10  80 68		 bra $fa7a
$16:fa12  32 eb		 and ($eb)
$16:fa14  d3 45		 cmp ($45,s),y
$16:fa16  07 68		 ora [$68]
$16:fa18  7b			tdc
$16:fa19  87 21		 sta [$21]
$16:fa1b  10 89		 bpl $f9a6
$16:fa1d  84 c1		 sty $c1
$16:fa1f  22 06 48 98   jsl $984806
$16:fa23  2f fc 1e 09   and $091efc
$16:fa27  30 81		 bmi $f9aa
$16:fa29  c0 cc		 cpy #$cc
$16:fa2b  8c a1 08	  sty $08a1
$16:fa2e  3a			dec a
$16:fa2f  8a			txa
$16:fa30  e1 50		 sbc ($50,x)
$16:fa32  a3 68		 lda $68,s
$16:fa34  24 42		 bit $42
$16:fa36  19 0c 1a	  ora $1a0c,y
$16:fa39  b4 c6		 ldy $c6,x
$16:fa3b  01 1c		 ora ($1c,x)
$16:fa3d  50 08		 bvc $fa47
$16:fa3f  d9 e0 10	  cmp $10e0,y
$16:fa42  68			pla
$16:fa43  35 8e		 and $8e,x
$16:fa45  c6 51		 dec $51
$16:fa47  28			plp
$16:fa48  b4 5a		 ldy $5a,x
$16:fa4a  08			php
$16:fa4b  9f 04 d0 d0   sta $d0d004,x
$16:fa4f  53 43		 eor ($43,s),y
$16:fa51  20 41 0c	  jsr $0c41
$16:fa54  20 c8 b0	  jsr $b0c8
$16:fa57  28			plp
$16:fa58  10 3c		 bpl $fa96
$16:fa5a  24 12		 bit $12
$16:fa5c  0a			asl a
$16:fa5d  05 00		 ora $00
$16:fa5f  6a			ror a
$16:fa60  18			clc
$16:fa61  cc 60 3c	  cpy $3c60
$16:fa64  02 74		 cop #$74
$16:fa66  a8			tay
$16:fa67  f5 cf		 sbc $cf,x
$16:fa69  96 52		 stx $52,y
$16:fa6b  fd 00 a1	  sbc $a100,x
$16:fa6e  34 95		 bit $95,x
$16:fa70  a2 0d		 ldx #$0d
$16:fa72  cf 80 00 00   cmp $000080
$16:fa76  08			php
$16:fa77  81 40		 sta ($40,x)
$16:fa79  1d e9 10	  ora $10e9,x
$16:fa7c  88			dey
$16:fa7d  bd d6 02	  lda $02d6,x
$16:fa80  ff 17 c2 e4   sbc $e4c217,x
$16:fa84  20 20 b0	  jsr $b020
$16:fa87  7b			tdc
$16:fa88  8c 48 1e	  sty $1e48
$16:fa8b  55 00		 eor $00,x
$16:fa8d  90 85		 bcc $fa14
$16:fa8f  ce 04 ff	  dec $ff04
$16:fa92  00 b9		 brk #$b9
$16:fa94  3f c4 40 01   and $0140c4,x
$16:fa98  46 91		 lsr $91
$16:fa9a  03 50		 ora $50,s
$16:fa9c  1a			inc a
$16:fa9d  32 28		 and ($28)
$16:fa9f  84 0e		 sty $0e
$16:faa1  21 04		 and ($04,x)
$16:faa3  88			dey
$16:faa4  44 e2 11	  mvp $11,$e2
$16:faa7  42 19		 wdm #$19
$16:faa9  90 08		 bcc $fab3
$16:faab  84 04		 sty $04
$16:faad  00 23		 brk #$23
$16:faaf  21 10		 and ($10,x)
$16:fab1  0a			asl a
$16:fab2  04 f8		 tsb $f8
$16:fab4  09 0b dc	  ora #$dc0b
$16:fab7  64 65		 stz $65
$16:fab9  f5 31		 sbc $31,x
$16:fabb  13 e0		 ora ($e0,s),y
$16:fabd  8d c8 6e	  sta $6ec8
$16:fac0  83 52		 sta $52,s
$16:fac2  21 10		 and ($10,x)
$16:fac4  10 46		 bpl $fb0c
$16:fac6  60			rts
$16:fac7  dd 44 37	  cmp $3744,x
$16:faca  7d 04 d0	  adc $d004,x
$16:facd  26 03		 rol $03
$16:facf  75 50		 adc $50,x
$16:fad1  ac 10 c6	  ldy $c610
$16:fad4  d1 50		 cmp ($50),y
$16:fad6  e6 10		 inc $10
$16:fad8  41 42		 eor ($42,x)
$16:fada  36 8c		 rol $8c,x
$16:fadc  75 ba		 adc $ba,x
$16:fade  1d 0a c7	  ora $c70a,x
$16:fae1  41 f1		 eor ($f1,x)
$16:fae3  d2 78		 cmp ($78)
$16:fae5  74 25		 stz $25,x
$16:fae7  62 32 0c	  per $071c
$16:faea  74 42		 stz $42,x
$16:faec  9c b2 0b	  stz $0bb2
$16:faef  7e 3a 51	  ror $513a,x
$16:faf2  8e 84 43	  stx $4384
$16:faf5  a0 f0		 ldy #$f0
$16:faf7  e8			inx
$16:faf8  2c 3a 2f	  bit $2f3a
$16:fafb  0e 8a c3	  asl $c38a
$16:fafe  a0 d0		 ldy #$d0
$16:fb00  e6 30		 inc $30
$16:fb02  45 a1		 eor $a1
$16:fb04  d1 86		 cmp ($86),y
$16:fb06  38			sec
$16:fb07  ad 82 dd	  lda $dd82
$16:fb0a  8e ae c3	  stx $c3ae
$16:fb0d  a4 10		 ldy $10
$16:fb0f  e8			inx
$16:fb10  84 3a		 sty $3a
$16:fb12  33 0e		 and ($0e,s),y
$16:fb14  8d 43 a5	  sta $a543
$16:fb17  0d 10 a7	  ora $a710
$16:fb1a  5b			tcd
$16:fb1b  61 d4		 adc ($d4,x)
$16:fb1d  b8			clv
$16:fb1e  f4 3a 3d	  pea $3d3a
$16:fb21  0f 8f 3c c2   ora $c23c8f
$16:fb25  3f 02 80 57   and $578002,x
$16:fb29  a1 af		 lda ($af,x)
$16:fb2b  70 8f		 bvs $fabc
$16:fb2d  53 b3		 eor ($b3,s),y
$16:fb2f  d4 cc		 pei ($cc)
$16:fb31  f5 36		 sbc $36,x
$16:fb33  a5 02		 lda $02
$16:fb35  89 40 5f	  bit #$5f40
$16:fb38  e4 05		 cpx $05
$16:fb3a  00 2b		 brk #$2b
$16:fb3c  c0 a3		 cpy #$a3
$16:fb3e  cf a2 a7 bd   cmp $bda7a2
$16:fb42  c1 f6		 cmp ($f6,x)
$16:fb44  35 e7		 and $e7,x
$16:fb46  d9 47 ab	  cmp $ab47,y
$16:fb49  e1 94		 sbc ($94,x)
$16:fb4b  7f 87 7a 56   adc $567a87,x
$16:fb4f  0b			phd
$16:fb50  41 88		 eor ($88,x)
$16:fb52  00 ca		 brk #$ca
$16:fb54  a1 12		 lda ($12,x)
$16:fb56  48			pha
$16:fb57  91 04		 sta ($04),y
$16:fb59  c8			iny
$16:fb5a  07 9e		 ora [$9e]
$16:fb5c  95 84		 sta $84,x
$16:fb5e  50 9e		 bvc $fafe
$16:fb60  a0 c0		 ldy #$c0
$16:fb62  90 10		 bcc $fb74
$16:fb64  02 3d		 cop #$3d
$16:fb66  4c af 0c	  jmp $0caf
$16:fb69  80 c0		 bra $fb2b
$16:fb6b  52 b8		 eor ($b8)
$16:fb6d  f5 34		 sbc $34,x
$16:fb6f  3e 9d e8	  rol $e89d,x
$16:fb72  69 7d 0d	  adc #$0d7d
$16:fb75  a0 27		 ldy #$27
$16:fb77  2c f3 e8	  bit $e8f3
$16:fb7a  63 57		 adc $57,s
$16:fb7c  a8			tay
$16:fb7d  d5 ee		 cmp $ee,x
$16:fb7f  35 8a		 and $8a,x
$16:fb81  8d 62 e3	  sta $e362
$16:fb84  57 c8		 eor [$c8],y
$16:fb86  d5 f6		 cmp $f6,x
$16:fb88  35 8c		 and $8c,x
$16:fb8a  8d 63 63	  sta $6363
$16:fb8d  59 a8 d6	  eor $d6a8,y
$16:fb90  6e 35 aa	  ror $aa35
$16:fb93  8d 6a e3	  sta $e36a
$16:fb96  59 c8 d6	  eor $d6c8,y
$16:fb99  76 35		 ror $35,x
$16:fb9b  ac 8d 6b	  ldy $6b8d
$16:fb9e  62 1d 68	  per $63be
$16:fba1  87 5e		 sta [$5e]
$16:fba3  21 e6		 and ($e6,x)
$16:fba5  88			dey
$16:fba6  79 e2 12	  adc $12e2,y
$16:fba9  38			sec
$16:fbaa  65 b8		 adc $b8
$16:fbac  8e 32 36	  stx $3632
$16:fbaf  f9 ae 06	  sbc $06ae,y
$16:fbb2  19 4b 20	  ora $204b,y
$16:fbb5  ae ea 21	  ldx $21ea
$16:fbb8  bb			tyx
$16:fbb9  a8			tay
$16:fbba  56 22		 lsr $22,x
$16:fbbc  16 82		 asl $82,x
$16:fbbe  38			sec
$16:fbbf  c1 22		 cmp ($22,x)
$16:fbc1  11 38		 ora ($38),y
$16:fbc3  84 51		 sty $51
$16:fbc5  a6 24		 ldx $24
$16:fbc7  80 81		 bra $fb4a
$16:fbc9  b4 45		 ldy $45,x
$16:fbcb  a4 0d		 ldy $0d
$16:fbcd  c0 24		 cpy #$24
$16:fbcf  03 51		 ora $51,s
$16:fbd1  1a			inc a
$16:fbd2  41 11		 eor ($11,x)
$16:fbd4  8b			phb
$16:fbd5  4c 22 d3	  jmp $d322
$16:fbd8  18			clc
$16:fbd9  b5 02		 lda $02,x
$16:fbdb  2d 41 89	  and $8941
$16:fbde  74 22		 stz $22,x
$16:fbe0  5d 18 97	  eor $9718,x
$16:fbe3  82 25 e1	  brl $dd0b
$16:fbe6  a7 5b		 lda [$5b]
$16:fbe8  29 d0 6e	  and #$6ed0
$16:fbeb  74 42		 stz $42,x
$16:fbed  9d 26 87	  sta $8726,x
$16:fbf0  41 a1		 eor ($a1,x)
$16:fbf2  d5 c8		 cmp $c8,x
$16:fbf4  74 9b		 stz $9b,x
$16:fbf6  1c 04 08	  trb $0804
$16:fbf9  87 3a		 sta [$3a]
$16:fbfb  4d ce b6	  eor $b6ce
$16:fbfe  73 a0		 adc ($a0,s),y
$16:fc00  d8			cld
$16:fc01  e0 30		 cpx #$30
$16:fc03  44 31 c1	  mvp $c1,$31
$16:fc06  60			rts
$16:fc07  ae 54 39	  ldx $3954
$16:fc0a  91 0d		 sta ($0d),y
$16:fc0c  e5 43		 sbc $43
$16:fc0e  79 10 e6	  adc $e610,y
$16:fc11  45 38		 eor $38
$16:fc13  31 4e		 and ($4e),y
$16:fc15  14 53		 trb $53
$16:fc17  8b			phb
$16:fc18  14 e3		 trb $e3
$16:fc1a  44 26 51	  mvp $51,$26
$16:fc1d  09 9c 42	  ora #$429c
$16:fc20  85 10		 sta $10
$16:fc22  a2 0b		 ldx #$0b
$16:fc24  ce 68 35	  dec $3568
$16:fc27  7a			ply
$16:fc28  18			clc
$16:fc29  bd 68 71	  lda $7168,x
$16:fc2c  ad f4 6b	  lda $6bf4
$16:fc2f  7f 1a f9 46   adc $46f91a,x
$16:fc33  b9 e4 f5	  lda $f5e4,y
$16:fc36  f9 93 cf	  sbc $cf93,y
$16:fc39  9c 5d 0a	  stz $0a5d
$16:fc3c  d6 fe		 dec $fe,x
$16:fc3e  b5 be		 lda $be,x
$16:fc40  ad 19 83	  lda $8319
$16:fc43  e4 2f		 cpx $2f
$16:fc45  11 e0		 ora ($e0),y
$16:fc47  0d 08 6c	  ora $6c08
$16:fc4a  03 c0		 ora $c0,s
$16:fc4c  1e 10 d8	  asl $d810,x
$16:fc4f  08			php
$16:fc50  48			pha
$16:fc51  36 09		 rol $09,x
$16:fc53  b0 ec		 bcs $fc41
$16:fc55  68			pla
$16:fc56  d1 ae		 cmp ($ae),y
$16:fc58  f5 6b		 sbc $6b,x
$16:fc5a  13 1a		 ora ($1a,s),y
$16:fc5c  f7 56		 sbc [$56],y
$16:fc5e  b3 31		 lda ($31,s),y
$16:fc60  a4 90		 ldy $90
$16:fc62  77 d2		 adc [$d2],y
$16:fc64  65 5a		 adc $5a
$16:fc66  ef a4 4a 35   sbc $354aa4
$16:fc6a  ef 4b 85 6b   sbc $6b854b
$16:fc6e  bc a3 23	  ldy $23a3,x
$16:fc71  7a			ply
$16:fc72  a1 89		 lda ($89,x)
$16:fc74  64 c4		 stz $c4
$16:fc76  a3 43		 lda $43,s
$16:fc78  ae 4e 25	  ldx $254e
$16:fc7b  f0 89		 beq $fc06
$16:fc7d  7c 4b 64	  jmp ($644b,x)
$16:fc80  cf 23 59 54   cmp $545923
$16:fc84  be 35 2f	  ldx $2f35,y
$16:fc87  83 6d		 sta $6d,s
$16:fc89  8b			phb
$16:fc8a  64 6f		 stz $6f
$16:fc8c  33 e4		 and ($e4,s),y
$16:fc8e  1d 90 e9	  ora $e990,x
$16:fc91  04 60		 tsb $60
$16:fc93  88			dey
$16:fc94  83 cb		 sta $cb,s
$16:fc96  21 23		 and ($23,x)
$16:fc98  a8			tay
$16:fc99  44 82 28	  mvp $28,$82
$16:fc9c  9f 34 b0 29   sta $29b034,x
$16:fca0  90 48		 bcc $fcea
$16:fca2  31 4e		 and ($4e),y
$16:fca4  a4 53		 ldy $53
$16:fca6  aa			tax
$16:fca7  2f 3f 20 dc   and $dc203f
$16:fcab  7c a3 b1	  jmp ($b1a3,x)
$16:fcae  1a			inc a
$16:fcaf  25 58		 and $58
$16:fcb1  5e 75 71	  lsr $7175,x
$16:fcb4  b8			clv
$16:fcb5  05 c6		 ora $c6
$16:fcb7  90 17		 bcc $fcd0
$16:fcb9  1a			inc a
$16:fcba  4c 42 6f	  jmp $6f42
$16:fcbd  10 9c		 bpl $fc5b
$16:fcbf  16 42		 asl $42,x
$16:fcc1  29 24 2b	  and #$2b24
$16:fcc4  91 74		 sta ($74),y
$16:fcc6  cb			wai
$16:fcc7  00 18		 brk #$18
$16:fcc9  02 d0		 cop #$d0
$16:fccb  52 82		 eor ($82)
$16:fccd  e3 21		 sbc $21,s
$16:fccf  0b			phd
$16:fcd0  88			dey
$16:fcd1  58			cli
$16:fcd2  cd e4 3b	  cmp $3be4
$16:fcd5  1b			tcs
$16:fcd6  30 bc		 bmi $fc94
$16:fcd8  ec e3 d4	  cpx $d4e3
$16:fcdb  88			dey
$16:fcdc  40			rti
$16:fcdd  62 10 22	  per $1ef0
$16:fce0  c8			iny
$16:fce1  86 02		 stx $02
$16:fce3  6e 5d 12	  ror $125d
$16:fce6  d0 26		 bne $fd0e
$16:fce8  11 38		 ora ($38),y
$16:fcea  28			plp
$16:fceb  f1 48		 sbc ($48),y
$16:fced  02 90		 cop #$90
$16:fcef  81 09		 sta ($09,x)
$16:fcf1  46 88		 lsr $88
$16:fcf3  3c 02 6d	  bit $6d02,x
$16:fcf6  10 02		 bpl $fcfa
$16:fcf8  02 d8		 cop #$d8
$16:fcfa  b2 6b		 lda ($6b)
$16:fcfc  b1 07		 lda ($07),y
$16:fcfe  03 f8		 ora $f8,s
$16:fd00  17 4c		 ora [$4c],y
$16:fd02  ba			tsx
$16:fd03  05 a2		 ora $a2
$16:fd05  2c 8e 19	  bit $198e
$16:fd08  c1 86		 cmp ($86,x)
$16:fd0a  70 a9		 bvs $fcb5
$16:fd0c  95 a8		 sta $a8,x
$16:fd0e  65 6a		 adc $6a
$16:fd10  25 d8		 and $d8
$16:fd12  89 76 62	  bit #$6276
$16:fd15  5e 88 97	  lsr $9788,x
$16:fd18  a6 31		 ldx $31
$16:fd1a  c1 8c		 cmp ($8c,x)
$16:fd1c  70 a3		 bvs $fcc1
$16:fd1e  1c 58 c7	  trb $c758
$16:fd21  19 c6 4e	  ora $4ec6,y
$16:fd24  32 2b		 and ($2b)
$16:fd26  a4 42		 ldy $42
$16:fd28  8a			txa
$16:fd29  57 30		 eor [$30],y
$16:fd2b  31 16		 and ($16),y
$16:fd2d  00 0c		 brk #$0c
$16:fd2f  0a			asl a
$16:fd30  42 09		 wdm #$09
$16:fd32  12 70		 ora ($70)
$16:fd34  49 e4 59	  eor #$59e4
$16:fd37  1a			inc a
$16:fd38  49 4c 32	  eor #$324c
$16:fd3b  12 38		 ora ($38)
$16:fd3d  84 44		 sty $44
$16:fd3f  e2 0f		 sep #$0f
$16:fd41  f5 33		 sbc $33,x
$16:fd43  34 48		 bit $48,x
$16:fd45  4e 05 90	  lsr $9005
$16:fd48  1f 88 78 88   ora $887888,x
$16:fd4c  41 22		 eor ($22,x)
$16:fd4e  c8			iny
$16:fd4f  24 00		 bit $00
$16:fd51  00 24		 brk #$24
$16:fd53  d0 26		 bne $fd7b
$16:fd55  98			tya
$16:fd56  a0 12		 ldy #$12
$16:fd58  01 22		 ora ($22,x)
$16:fd5a  1f 90 ce 43   ora $43ce90,x
$16:fd5e  c4 3e		 cpy $3e
$16:fd60  23 93		 and $93,s
$16:fd62  00 00		 brk #$00
$16:fd64  58			cli
$16:fd65  10 4c		 bpl $fdb3
$16:fd67  85 62		 sta $62
$16:fd69  21 14		 and ($14,x)
$16:fd6b  88			dey
$16:fd6c  40			rti
$16:fd6d  d0 21		 bne $fd90
$16:fd6f  50 42		 bvc $fdb3
$16:fd71  10 b0		 bpl $fd23
$16:fd73  37 91		 and [$91],y
$16:fd75  08			php
$16:fd76  9c 43 99	  stz $9943
$16:fd79  50 e6		 bvc $fd61
$16:fd7b  22 45 24 02   jsl $022445
$16:fd7f  c0 dd		 cpy #$dd
$16:fd81  44 37 69	  mvp $69,$37
$16:fd84  31 16		 and ($16),y
$16:fd86  02 00		 cop #$00
$16:fd88  7a			ply
$16:fd89  1b			tcs
$16:fd8a  be 86 ea	  ldx $ea86,y
$16:fd8d  29 56 8a	  and #$8a56
$16:fd90  55 e2		 eor $e2,x
$16:fd92  96 68		 stx $68,y
$16:fd94  a5 9e		 lda $9e
$16:fd96  2d 77 8b	  and $8b77
$16:fd99  65 a2		 adc $a2
$16:fd9b  d7 68		 cmp [$68],y
$16:fd9d  b6 99		 ldx $99,y
$16:fd9f  7a			ply
$16:fda0  15 65		 ora $65,x
$16:fda2  c0 d5		 cpy #$d5
$16:fda4  ae d1 4d	  ldx $4dd1
$16:fda7  34 53		 bit $53,x
$16:fda9  2d 14 c3	  and $c314
$16:fdac  c5 31		 cmp $31
$16:fdae  1d 66 70	  ora $7066,x
$16:fdb1  61 d7		 adc ($d7,x)
$16:fdb3  22 be 1c b5   jsl $b51cbe
$16:fdb7  e1 a6		 sbc ($a6,x)
$16:fdb9  59 6c 36	  eor $366c,y
$16:fdbc  59 a4 0b	  eor $0ba4,y
$16:fdbf  c1 68		 cmp ($68,x)
$16:fdc1  87 5b		 sta [$5b]
$16:fdc3  0c c3 21	  tsb $21c3
$16:fdc6  78			sei
$16:fdc7  88			dey
$16:fdc8  80 44		 bra $fe0e
$16:fdca  14 76		 trb $76
$16:fdcc  e8			inx
$16:fdcd  2e 45 a8	  rol $a845
$16:fdd0  6f 93 6d 03   adc $036d93
$16:fdd4  e0 6a		 cpx #$6a
$16:fdd6  c0 61		 cpy #$61
$16:fdd8  17 8f		 ora [$8f],y
$16:fdda  a8			tay
$16:fddb  c2 34		 rep #$34
$16:fddd  77 79		 adc [$79],y
$16:fddf  14 c7		 trb $c7
$16:fde1  b4 b7		 ldy $b7,x
$16:fde3  37 50		 and [$50],y
$16:fde5  34 81		 bit $81,x
$16:fde7  80 35		 bra $fe1e
$16:fde9  6c 3d 5b	  jmp ($5b3d)
$16:fdec  0c 7f 24	  tsb $247f
$16:fdef  98			tya
$16:fdf0  da			phx
$16:fdf1  0f e5 50 46   ora $4650e5
$16:fdf5  00 d8		 brk #$d8
$16:fdf7  47 62		 eor [$62]
$16:fdf9  3c 61 a1	  bit $a161,x
$16:fdfc  73 54		 adc ($54,s),y
$16:fdfe  20 9b 5d	  jsr $5d9b
$16:fe01  ea			nop
$16:fe02  94 52		 sty $52,x
$16:fe04  c4 80		 cpy $80
$16:fe06  0d cc 43	  ora $43cc
$16:fe09  96 8f		 stx $8f,y
$16:fe0b  3e 54 42	  rol $4254,x
$16:fe0e  3b			tsc
$16:fe0f  1e 87 47	  asl $4787,x
$16:fe12  a5 f1		 lda $f1
$16:fe14  e3 98		 sbc $98,s
$16:fe16  42 f3		 wdm #$f3
$16:fe18  d2 cc		 cmp ($cc)
$16:fe1a  f4 b6 a5	  pea $a5b6
$16:fe1d  02 89		 cop #$89
$16:fe1f  40			rti
$16:fe20  4e e4 7d	  lsr $7de4
$16:fe23  03 eb		 ora $eb,s
$16:fe25  c0 a3 d2	  cpy #$d2a3
$16:fe28  e8			inx
$16:fe29  f4 3e 3d	  pea $3d3e
$16:fe2c  0c 8f 47	  tsb $478f
$16:fe2f  cd e3 1b	  cmp $1be3
$16:fe32  39 8c fe	  and $fe8c,y
$16:fe35  25 20		 and $20
$16:fe37  89 44 23	  bit #$2344
$16:fe3a  d2 c8		 cmp ($c8)
$16:fe3c  f4 b6 3d	  pea $3db6
$16:fe3f  1c 48 8c	  trb $8c48
$16:fe42  f9 2a 07	  sbc $072a,y
$16:fe45  70 ef		 bvs $fe36
$16:fe47  4a			lsr a
$16:fe48  d0 68		 bne $feb2
$16:fe4a  b1 03		 lda ($03),y
$16:fe4c  d9 25 d6	  cmp $d625,y
$16:fe4f  16 a7		 asl $a7,x
$16:fe51  34 a0		 bit $a0,x
$16:fe53  e7 a5		 sbc [$a5]
$16:fe55  68			pla
$16:fe56  94 67		 sty $67,x
$16:fe58  aa			tax
$16:fe59  10 14		 bpl $fe6f
$16:fe5b  07 5e		 ora [$5e]
$16:fe5d  59 02 80	  eor $8002,y
$16:fe60  a5 6a		 lda $6a
$16:fe62  50 27		 bvc $fe8b
$16:fe64  ac 50 ae	  ldy $ae50
$16:fe67  63 40		 adc $40,s
$16:fe69  2f 10 c8 0c   and $0cc810
$16:fe6d  84 58		 sty $58
$16:fe6f  03 51		 ora $51,s
$16:fe71  8c c4 94	  sty $94c4
$16:fe74  10 31		 bpl $fea7
$16:fe76  a8			tay
$16:fe77  8d 02 90	  sta $9002
$16:fe7a  13 1a		 ora ($1a,s),y
$16:fe7c  48			pha
$16:fe7d  74 21		 stz $21,x
$16:fe7f  96 e2		 stx $e2,y
$16:fe81  58			cli
$16:fe82  88			dey
$16:fe83  02 df		 cop #$df
$16:fe85  10 bc		 bpl $fe43
$16:fe87  8a			txa
$16:fe88  46 29		 lsr $29
$16:fe8a  8e b7 43	  stx $43b7
$16:fe8d  a1 58		 lda ($58,x)
$16:fe8f  ea			nop
$16:fe90  de 3a 4f	  dec $4f3a,x
$16:fe93  0e ad c3	  asl $c3ad
$16:fe96  a0 b0 eb	  ldy #$ebb0
$16:fe99  5c 3a 2a 37   jml $372a3a
$16:fe9d  11 b0		 ora ($b0),y
$16:fe9f  5b			tcd
$16:fea0  b1 d5		 lda ($d5),y
$16:fea2  d1 f9		 cmp ($f9),y
$16:fea4  8d 82 41	  sta $4182
$16:fea7  4e 88 73	  lsr $7388
$16:feaa  a4 dc		 ldy $dc
$16:feac  e9 2f 3a	  sbc #$3a2f
$16:feaf  0c 13 10	  tsb $1013
$16:feb2  10 04		 bpl $feb8
$16:feb4  00 2c		 brk #$2c
$16:feb6  05 82		 ora $82
$16:feb8  09 00 58	  ora #$5800
$16:febb  26 e1		 rol $e1
$16:febd  11 32		 ora ($32),y
$16:febf  24 e0		 bit $e0
$16:fec1  32 34		 and ($34)
$16:fec3  73 79		 adc ($79,s),y
$16:fec5  ea			nop
$16:fec6  4c e1 50	  jmp $50e1
$16:fec9  50 81		 bvc $fe4c
$16:fecb  c8			iny
$16:fecc  f3 d4		 sbc ($d4,s),y
$16:fece  c5 88		 cmp $88
$16:fed0  a8			tay
$16:fed1  02 8f		 cop #$8f
$16:fed3  50 ad		 bvc $fe82
$16:fed5  44 2b 48	  mvp $48,$2b
$16:fed8  f2 88		 sbc ($88)
$16:feda  5a			phy
$16:fedb  92 e8		 sta ($e8)
$16:fedd  7f 18 95 42   adc $429518,x
$16:fee1  45 10		 eor $10
$16:fee3  91 38		 sta ($38),y
$16:fee5  c1 da		 cmp ($da,x)
$16:fee7  0c 31 8f	  tsb $8f31
$16:feea  d4 20		 pei ($20)
$16:feec  51 05		 eor ($05),y
$16:feee  80 1e		 bra $ff0e
$16:fef0  82 6f 1e	  brl $1d62
$16:fef3  87 47		 sta [$47]
$16:fef5  a1 f9		 lda ($f9,x)
$16:fef7  e9 63 64	  sbc #$6463
$16:fefa  23 d4		 and $d4,s
$16:fefc  c8			iny
$16:fefd  f5 36		 sbc $36,x
$16:feff  05 00		 ora $00
$16:ff01  61 81		 adc ($81,x)
$16:ff03  bc cf 41	  ldy $41cf,x
$16:ff06  4a			lsr a
$16:ff07  33 88		 and ($88,s),y
$16:ff09  68			pla
$16:ff0a  0f 40 1e 06   ora $061e40
$16:ff0e  82 1d 80	  brl $7f2e
$16:ff11  40			rti
$16:ff12  4d 41 13	  eor $1341
$16:ff15  ac de 1d	  ldy $1dde
$16:ff18  97 a7		 sta [$a7],y
$16:ff1a  65 e1		 adc $e1
$16:ff1c  da			phx
$16:ff1d  7a			ply
$16:ff1e  76 9c		 ror $9c,x
$16:ff20  26 3b		 rol $3b
$16:ff22  c0 78 f3	  cpy #$f378
$16:ff25  2a			rol a
$16:ff26  1c c3 08	  trb $08c3
$16:ff29  54 1f 41	  mvn $41,$1f
$16:ff2c  14 88		 trb $88
$16:ff2e  6e a2 1b	  ror $1ba2
$16:ff31  b1 18		 lda ($18),y
$16:ff33  81 80		 sta ($80,x)
$16:ff35  c0 3d 0d	  cpy #$0d3d
$16:ff38  df 43 74 4d   cmp $4d7443,x
$16:ff3c  08			php
$16:ff3d  74 41		 stz $41,x
$16:ff3f  7e 41 74	  ror $7441,x
$16:ff42  af 4a c2 e7   lda $e7c24a
$16:ff46  2b			pld
$16:ff47  60			rts
$16:ff48  84 6b		 sty $6b
$16:ff4a  7d 1a df	  adc $df1a,x
$16:ff4d  c6 b9		 dec $b9
$16:ff4f  d1 ae		 cmp ($ae),y
$16:ff51  7c 42 6f	  jmp ($6f42,x)
$16:ff54  14 eb		 trb $eb
$16:ff56  44 27 11	  mvp $11,$27
$16:ff59  4f 34 53 ae   eor $ae5334
$16:ff5d  3b			tsc
$16:ff5e  1f 38 dc 06   ora $06dc38,x
$16:ff62  e3 c9		 sbc $c9,s
$16:ff64  24 81		 bit $81
$16:ff66  1c 87 60	  trb $6087
$16:ff69  3b			tsc
$16:ff6a  12 50		 ora ($50)
$16:ff6c  8f c0 7a 3e   sta $3e7ac0
$16:ff70  71 c8		 adc ($c8),y
$16:ff72  12 44		 ora ($44)
$16:ff74  b8			clv
$16:ff75  85 a0		 sta $a0
$16:ff77  25 07		 and $07
$16:ff79  9e 35 de	  stz $de35,x
$16:ff7c  8d 77 e3	  sta $e377
$16:ff7f  5e e8 d7	  lsr $d7e8,x
$16:ff82  be 2d 9e	  ldx $9e2d,y
$16:ff85  8b			phb
$16:ff86  67 e2		 adc [$e2]
$16:ff88  da			phx
$16:ff89  e8			inx
$16:ff8a  b6 bc		 ldx $bc,y
$16:ff8c  ce 65 c1	  dec $c165
$16:ff8f  8c 72 10	  sty $1072
$16:ff92  e8			inx
$16:ff93  4f 42 29 14   eor $142942
$16:ff97  c8			iny
$16:ff98  8a			txa
$16:ff99  89 36 4c	  bit #$4c36
$16:ff9c  ac e2 31	  ldy $31e2
$16:ff9f  11 59		 ora ($59),y
$16:ffa1  84 33		 sty $33
$16:ffa3  fd 4c ff	  sbc $ff4c,x
$16:ffa6  63 3f		 adc $3f,s
$16:ffa8  dc cf f5	  jml [$f5cf]
$16:ffab  62 b5 18	  per $1863
$16:ffae  ad 2f ca	  lda $ca2f
$16:ffb1  0d f7 a3	  ora $a3f7
$16:ffb4  7d e0 df	  adc $dfe0,x
$16:ffb7  8a			txa
$16:ffb8  37 e2		 and [$e2],y
$16:ffba  0d f9 a3	  ora $a3f9
$16:ffbd  7e 60 df	  ror $df60,x
$16:ffc0  aa			tax
$16:ffc1  37 ea		 and [$ea],y
$16:ffc3  09 ff a2	  ora #$a2ff
$16:ffc6  7f f0 9f fe   adc $fe9ff0,x
$16:ffca  27 fe		 and [$fe]
$16:ffcc  09 fc a2	  ora #$a2fc
$16:ffcf  7f 30 9f ce   adc $ce9f30,x
$16:ffd3  27 f2		 and [$f2]
$16:ffd5  09 fb a2	  ora #$a2fb
$16:ffd8  7e f0 9f	  ror $9ff0,x
$16:ffdb  be 27 ec	  ldx $ec27,y
$16:ffde  01 01		 ora ($01,x)
$16:ffe0  00 01		 brk #$01
$16:ffe2  e7 73		 sbc [$73]
$16:ffe4  dd f8 f0	  cmp $f0f8,x
$16:ffe7  de 73 bf	  dec $bf73,x
$16:ffea  c0 1e 11	  cpy #$111e
$16:ffed  f1 17		 sbc ($17),y
$16:ffef  8c fc 89	  sty $89fc
$16:fff2  e5 5f		 sbc $5f
$16:fff4  33 79		 and ($79,s),y
$16:fff6  df d1 1e 99   cmp $991ed1,x
$16:fffa  f5 57		 sbc $57,x
$16:fffc  ae fd d4	  ldx $d4fd
$16:ffff  20 73 24	  jsr $2473
