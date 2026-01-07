; Soul Blazer (SNES) - Bank $06
; Disassembled from ROM
; File offset: $030000-$037fff
; CPU address: $06:$8000-$06:$ffff
;===========================================================

.bank $06
.org $8000

$06:8000  4e 00 00	  lsr $0000
$06:8003  2e 00 ff	  rol $ff00
$06:8006  f4 b8 03	  pea $03b8
$06:8009  d2 01		 cmp ($01)
$06:800b  ff f4 b8 03   sbc $03b8f4,x
$06:800f  d4 02		 pei ($02)
$06:8011  ff e0 b8 07   sbc $07b8e0,x
$06:8015  00 03		 brk #$03
$06:8017  ff f3 b8 03   sbc $03b8f3,x
$06:801b  d4 04		 pei ($04)
$06:801d  ff eb b8 0d   sbc $0db8eb,x
$06:8021  e0 05 ff	  cpx #$ff05
$06:8024  eb			xba
$06:8025  b8			clv
$06:8026  05 30		 ora $30
$06:8028  06 ff		 asl $ff
$06:802a  eb			xba
$06:802b  b8			clv
$06:802c  01 00		 ora ($00,x)
$06:802e  07 ff		 ora [$ff]
$06:8030  e0 b8 05	  cpx #$05b8
$06:8033  f0 08		 beq $803d
$06:8035  ff f6 b8 0f   sbc $0fb8f6,x
$06:8039  80 09		 bra $8044
$06:803b  ff e0 b8 03   sbc $03b8e0,x
$06:803f  00 0a		 brk #$0a
$06:8041  ff e0 b8 07   sbc $07b8e0,x
$06:8045  00 0b		 brk #$0b
$06:8047  ff f3 b8 01   sbc $01b8f3,x
$06:804b  00 0c		 brk #$0c
$06:804d  ff f1 b8 07   sbc $07b8f1,x
$06:8051  00 18		 brk #$18
$06:8053  00 00		 brk #$00
$06:8055  2f 32 65 7f   and $7f6532
$06:8059  98			tya
$06:805a  b2 cb		 lda ($cb)
$06:805c  e5 fc		 sbc $fc
$06:805e  19 32 4c	  ora $4c32,y
$06:8061  65 72		 adc $72
$06:8063  7f 8c 98 a5   adc $a5988c,x
$06:8067  b2 bf		 lda ($bf)
$06:8069  cb			wai
$06:806a  d8			cld
$06:806b  e5 f2		 sbc $f2
$06:806d  fc 50 06	  jsr ($0650,x)
$06:8070  00 24		 brk #$24
$06:8072  02 24		 cop #$24
$06:8074  4e 24 79	  lsr $7924
$06:8077  24 8c		 bit $8c
$06:8079  24 c7		 bit $c7
$06:807b  24 d7		 bit $d7
$06:807d  24 ea		 bit $ea
$06:807f  24 63		 bit $63
$06:8081  25 76		 and $76
$06:8083  25 81		 and $81
$06:8085  25 92		 and $92
$06:8087  25 a0		 and $a0
$06:8089  25 b7		 and $b7
$06:808b  25 c1		 and $c1
$06:808d  25 fe		 and $fe
$06:808f  25 4b		 and $4b
$06:8091  26 9a		 rol $9a
$06:8093  26 ac		 rol $ac
$06:8095  26 c7		 rol $c7
$06:8097  26 d8		 rol $d8
$06:8099  26 ef		 rol $ef
$06:809b  26 46		 rol $46
$06:809d  27 61		 and [$61]
$06:809f  27 75		 and [$75]
$06:80a1  27 0b		 and [$0b]
$06:80a3  28			plp
$06:80a4  2b			pld
$06:80a5  28			plp
$06:80a6  7d 28 98	  adc $9828,x
$06:80a9  28			plp
$06:80aa  c4 28		 cpy $28
$06:80ac  22 29 46 29   jsl $294629
$06:80b0  7a			ply
$06:80b1  29 91 29	  and #$2991
$06:80b4  a8			tay
$06:80b5  29 bf 29	  and #$29bf
$06:80b8  d1 29		 cmp ($29),y
$06:80ba  db			stp
$06:80bb  29 05 2a	  and #$2a05
$06:80be  40			rti
$06:80bf  2a			rol a
$06:80c0  fa			plx
$06:80c1  0d e0 08	  ora $08e0
$06:80c4  e7 34		 sbc [$34]
$06:80c6  ed ff ee	  sbc $eeff
$06:80c9  32 00		 and ($00)
$06:80cb  ea			nop
$06:80cc  f4 0a 7f	  pea $7f0a
$06:80cf  8c f9 00	  sty $00f9
$06:80d2  0a			asl a
$06:80d3  ab			plb
$06:80d4  e0 08 ea	  cpx #$ea08
$06:80d7  00 ea		 brk #$ea
$06:80d9  f4 0b c9	  pea $c90b
$06:80dc  0a			asl a
$06:80dd  8c f9 00	  sty $00f9
$06:80e0  0a			asl a
$06:80e1  bc 07 8c	  ldy $8c07,x
$06:80e4  f9 00 07	  sbc $0700,y
$06:80e7  bd ea 00	  lda $00ea,x
$06:80ea  00 e0		 brk #$e0
$06:80ec  01 e7		 ora ($e7,x)
$06:80ee  34 ed		 bit $ed,x
$06:80f0  e6 1e		 inc $1e
$06:80f2  7f a4 18 74   adc $7418a4,x
$06:80f6  a6 18		 ldx $18
$06:80f8  72 a6		 adc ($a6)
$06:80fa  12 70		 ora ($70)
$06:80fc  a6 00		 ldx $00
$06:80fe  e0 02 e7	  cpx #$e702
$06:8101  34 ed		 bit $ed,x
$06:8103  a0 08 7f	  ldy #$7f08
$06:8106  b0 f9		 bcs $8101
$06:8108  00 08		 brk #$08
$06:810a  80 bc		 bra $80c8
$06:810c  f9 00 08	  sbc $0800,y
$06:810f  80 a4		 bra $80b5
$06:8111  f9 00 08	  sbc $0800,y
$06:8114  80 08		 bra $811e
$06:8116  7d a4 f9	  adc $f9a4,x
$06:8119  00 08		 brk #$08
$06:811b  80 08		 bra $8125
$06:811d  7b			tdc
$06:811e  a4 f9		 ldy $f9
$06:8120  00 08		 brk #$08
$06:8122  80 08		 bra $812c
$06:8124  79 a4 f9	  adc $f9a4,y
$06:8127  00 08		 brk #$08
$06:8129  80 08		 bra $8133
$06:812b  77 a4		 adc [$a4],y
$06:812d  f9 00 08	  sbc $0800,y
$06:8130  80 08		 bra $813a
$06:8132  75 a4		 adc $a4,x
$06:8134  f9 00 08	  sbc $0800,y
$06:8137  80 00		 bra $8139
$06:8139  e7 34		 sbc [$34]
$06:813b  e0 03 ed	  cpx #$ed03
$06:813e  ff 28 7f a2   sbc $a27f28,x
$06:8142  28			plp
$06:8143  77 a2		 adc [$a2],y
$06:8145  28			plp
$06:8146  73 a2		 adc ($a2,s),y
$06:8148  00 ed		 brk #$ed
$06:814a  ff e7 34 e0   sbc $e034e7,x
$06:814e  01 0c		 ora ($0c,x)
$06:8150  7f a3 e0 04   adc $04e0a3,x
$06:8154  ee 78 00	  inc $0078
$06:8157  60			rts
$06:8158  85 30		 sta $30
$06:815a  c8			iny
$06:815b  00 e7		 brk #$e7
$06:815d  34 e0		 bit $e0,x
$06:815f  05 ed		 ora $ed
$06:8161  a0 e3 01	  ldy #$01e3
$06:8164  64 d2		 stz $d2
$06:8166  ee 78 ff	  inc $ff78
$06:8169  24 7f		 bit $7f
$06:816b  a4 f9		 ldy $f9
$06:816d  01 10		 ora ($10,x)
$06:816f  8c a8 f9	  sty $f9a8
$06:8172  01 10		 ora ($10,x)
$06:8174  90 ab		 bcc $8121
$06:8176  f9 01 10	  sbc $1001,y
$06:8179  93 a4		 sta ($a4,s),y
$06:817b  f9 01 10	  sbc $1001,y
$06:817e  8c a8 f9	  sty $f9a8
$06:8181  01 10		 ora ($10,x)
$06:8183  90 ab		 bcc $8130
$06:8185  f9 01 10	  sbc $1001,y
$06:8188  93 a4		 sta ($a4,s),y
$06:818a  f9 01 10	  sbc $1001,y
$06:818d  8c a8 f9	  sty $f9a8
$06:8190  01 10		 ora ($10,x)
$06:8192  90 ee		 bcc $8182
$06:8194  ff 64 ab f9   sbc $f9ab64,x
$06:8198  01 10		 ora ($10,x)
$06:819a  93 a4		 sta ($a4,s),y
$06:819c  f9 01 10	  sbc $1001,y
$06:819f  8c a8 f9	  sty $f9a8
$06:81a2  01 10		 ora ($10,x)
$06:81a4  90 ab		 bcc $8151
$06:81a6  f9 01 10	  sbc $1001,y
$06:81a9  93 a4		 sta ($a4,s),y
$06:81ab  f9 01 10	  sbc $1001,y
$06:81ae  8c a8 f9	  sty $f9a8
$06:81b1  01 10		 ora ($10,x)
$06:81b3  90 ab		 bcc $8160
$06:81b5  f9 01 10	  sbc $1001,y
$06:81b8  93 a4		 sta ($a4,s),y
$06:81ba  f9 01 10	  sbc $1001,y
$06:81bd  8c a8 f9	  sty $f9a8
$06:81c0  01 10		 ora ($10,x)
$06:81c2  90 ab		 bcc $816f
$06:81c4  f9 01 10	  sbc $1001,y
$06:81c7  93 a4		 sta ($a4,s),y
$06:81c9  f9 01 10	  sbc $1001,y
$06:81cc  8c a4 f9	  sty $f9a4
$06:81cf  01 10		 ora ($10,x)
$06:81d1  8c e4 e4	  sty $e4e4
$06:81d4  00 e7		 brk #$e7
$06:81d6  34 e0		 bit $e0,x
$06:81d8  06 ed		 asl $ed
$06:81da  b4 ea		 ldy $ea,x
$06:81dc  02 e3		 cop #$e3
$06:81de  01 32		 ora ($32,x)
$06:81e0  32 05		 and ($05)
$06:81e2  5f b7 e4 ea   eor $eae4b7,x
$06:81e6  00 00		 brk #$00
$06:81e8  e7 34		 sbc [$34]
$06:81ea  ed 96 e0	  sbc $e096
$06:81ed  06 04		 asl $04
$06:81ef  7f b9 b4 00   adc $00b4b9,x
$06:81f3  e7 34		 sbc [$34]
$06:81f5  e0 07 ed	  cpx #$ed07
$06:81f8  ff ee 96 00   sbc $0096ee,x
$06:81fc  10 7f		 bpl $827d
$06:81fe  93 50		 sta ($50,s),y
$06:8200  8e 60 c8	  stx $c860
$06:8203  00 e7		 brk #$e7
$06:8205  34 e0		 bit $e0,x
$06:8207  07 ed		 ora [$ed]
$06:8209  ff ee c8 00   sbc $00c8ee,x
$06:820d  60			rts
$06:820e  7f 87 c8 00   adc $00c887,x
$06:8212  e7 34		 sbc [$34]
$06:8214  ed b4 e0	  sbc $e0b4
$06:8217  06 ee		 asl $ee
$06:8219  96 32		 stx $32,y
$06:821b  e3 01		 sbc $01,s
$06:821d  50 fa		 bvc $8219
$06:821f  78			sei
$06:8220  7f bc f9 04   adc $04f9bc,x
$06:8224  60			rts
$06:8225  a4 e4		 ldy $e4
$06:8227  e4 00		 cpx $00
$06:8229  e7 34		 sbc [$34]
$06:822b  ed c8 e0	  sbc $e0c8
$06:822e  08			php
$06:822f  60			rts
$06:8230  7f 98 00 e0   adc $e00098,x
$06:8234  02 e7		 cop #$e7
$06:8236  34 ed		 bit $ed,x
$06:8238  be 0c 7f	  ldx $7f0c,y
$06:823b  98			tya
$06:823c  f9 01 0c	  sbc $0c01,y
$06:823f  bc 0c 7d	  ldy $7d0c,x
$06:8242  9f f9 01 0c   sta $0c01f9,x
$06:8246  bc a4 f9	  ldy $f9a4,x
$06:8249  01 0c		 ora ($0c,x)
$06:824b  bc 0c 79	  ldy $790c,x
$06:824e  a4 f9		 ldy $f9
$06:8250  01 0c		 ora ($0c,x)
$06:8252  bc 0c 77	  ldy $770c,x
$06:8255  a4 f9		 ldy $f9
$06:8257  01 0c		 ora ($0c,x)
$06:8259  bc 0c 75	  ldy $750c,x
$06:825c  a4 f9		 ldy $f9
$06:825e  01 0c		 ora ($0c,x)
$06:8260  bc 0c 73	  ldy $730c,x
$06:8263  a4 f9		 ldy $f9
$06:8265  01 0c		 ora ($0c,x)
$06:8267  bc 0c 72	  ldy $720c,x
$06:826a  a4 f9		 ldy $f9
$06:826c  01 0c		 ora ($0c,x)
$06:826e  bc 00 e7	  ldy $e700,x
$06:8271  34 ed		 bit $ed,x
$06:8273  dc e0 09	  jml [$09e0]
$06:8276  10 7f		 bpl $82f7
$06:8278  98			tya
$06:8279  f9 00 10	  sbc $1000,y
$06:827c  b9 10 7d	  lda $7d10,y
$06:827f  98			tya
$06:8280  f9 00 10	  sbc $1000,y
$06:8283  b9 10 7b	  lda $7b10,y
$06:8286  98			tya
$06:8287  f9 00 10	  sbc $1000,y
$06:828a  b9 10 79	  lda $7910,y
$06:828d  8c f9 00	  sty $00f9
$06:8290  10 b9		 bpl $824b
$06:8292  10 77		 bpl $830b
$06:8294  8c f9 00	  sty $00f9
$06:8297  10 b9		 bpl $8252
$06:8299  10 75		 bpl $8310
$06:829b  8c f9 00	  sty $00f9
$06:829e  10 b9		 bpl $8259
$06:82a0  10 73		 bpl $8315
$06:82a2  8c f9 00	  sty $00f9
$06:82a5  10 b9		 bpl $8260
$06:82a7  10 72		 bpl $831b
$06:82a9  8c f9 00	  sty $00f9
$06:82ac  10 b9		 bpl $8267
$06:82ae  10 71		 bpl $8321
$06:82b0  8c f9 00	  sty $00f9
$06:82b3  10 ad		 bpl $8262
$06:82b5  10 70		 bpl $8327
$06:82b7  8c f9 00	  sty $00f9
$06:82ba  10 ad		 bpl $8269
$06:82bc  00 e0		 brk #$e0
$06:82be  08			php
$06:82bf  e7 34		 sbc [$34]
$06:82c1  ed b4 ee	  sbc $eeb4
$06:82c4  82 00 0a	  brl $8cc7
$06:82c7  7f 8c f9 00   adc $00f98c,x
$06:82cb  0a			asl a
$06:82cc  bc 8c f9	  ldy $f98c,x
$06:82cf  00 0a		 brk #$0a
$06:82d1  bc 8c f9	  ldy $f98c,x
$06:82d4  00 0a		 brk #$0a
$06:82d6  bc 09 8c	  ldy $8c09,x
$06:82d9  f9 00 09	  sbc $0900,y
$06:82dc  bc 8c f9	  ldy $f98c,x
$06:82df  00 09		 brk #$09
$06:82e1  bd 08 8c	  lda $8c08,x
$06:82e4  f9 00 08	  sbc $0800,y
$06:82e7  be 8c f9	  ldx $f98c,y
$06:82ea  00 08		 brk #$08
$06:82ec  bf 07 8c f9   lda $f98c07,x
$06:82f0  00 07		 brk #$07
$06:82f2  c0 06 8c	  cpy #$8c06
$06:82f5  f9 00 06	  sbc $0600,y
$06:82f8  c1 05		 cmp ($05,x)
$06:82fa  8c f9 00	  sty $00f9
$06:82fd  05 c1		 ora $c1
$06:82ff  04 8c		 tsb $8c
$06:8301  f9 00 04	  sbc $0400,y
$06:8304  c2 05		 rep #$05
$06:8306  8c f9 00	  sty $00f9
$06:8309  05 c2		 ora $c2
$06:830b  00 e7		 brk #$e7
$06:830d  34 e0		 bit $e0,x
$06:830f  09 ed a0	  ora #$a0ed
$06:8312  e3 00		 sbc $00,s
$06:8314  64 f8		 stz $f8
$06:8316  60			rts
$06:8317  7f b0 f9 00   adc $00f9b0,x
$06:831b  50 89		 bvc $82a6
$06:831d  00 e7		 brk #$e7
$06:831f  34 e0		 bit $e0,x
$06:8321  07 ed		 ora [$ed]
$06:8323  64 ee		 stz $ee
$06:8325  0c ff e3	  tsb $e3ff
$06:8328  00 50		 brk #$50
$06:832a  f5 60		 sbc $60,x
$06:832c  7f 84 f9 00   adc $00f984,x
$06:8330  fa			plx
$06:8331  93 c8		 sta ($c8,s),y
$06:8333  ee fa 00	  inc $00fa
$06:8336  c8			iny
$06:8337  c8			iny
$06:8338  00 e0		 brk #$e0
$06:833a  07 e7		 ora [$e7]
$06:833c  34 ed		 bit $ed,x
$06:833e  dc ee 60	  jml [$60ee]
$06:8341  00 60		 brk #$60
$06:8343  7f b7 f9 00   adc $00f9b7,x
$06:8347  18			clc
$06:8348  8c 00 e0	  sty $e000
$06:834b  09 e7 34	  ora #$34e7
$06:834e  ed 91 ea	  sbc $ea91
$06:8351  f4 ee 50	  pea $50ee
$06:8354  00 e3		 brk #$e3
$06:8356  00 12		 brk #$12
$06:8358  fb			xce
$06:8359  56 6f		 lsr $6f,x
$06:835b  b7 e4		 lda [$e4],y
$06:835d  ea			nop
$06:835e  00 e4		 brk #$e4
$06:8360  00 e7		 brk #$e7
$06:8362  29 ed ff	  and #$ffed
$06:8365  ea			nop
$06:8366  f4 e0 05	  pea $05e0
$06:8369  e3 10		 sbc $10,s
$06:836b  28			plp
$06:836c  fa			plx
$06:836d  10 7f		 bpl $83ee
$06:836f  a4 f9		 ldy $f9
$06:8371  00 10		 brk #$10
$06:8373  b7 10		 lda [$10],y
$06:8375  7e a4 f9	  ror $f9a4,x
$06:8378  00 10		 brk #$10
$06:837a  b7 10		 lda [$10],y
$06:837c  7d a4 f9	  adc $f9a4,x
$06:837f  00 10		 brk #$10
$06:8381  b7 10		 lda [$10],y
$06:8383  79 98 f9	  adc $f998,y
$06:8386  00 10		 brk #$10
$06:8388  b7 10		 lda [$10],y
$06:838a  77 98		 adc [$98],y
$06:838c  f9 00 10	  sbc $1000,y
$06:838f  b7 10		 lda [$10],y
$06:8391  75 98		 adc $98,x
$06:8393  f9 00 10	  sbc $1000,y
$06:8396  b6 10		 ldx $10,y
$06:8398  73 98		 adc ($98,s),y
$06:839a  f9 00 10	  sbc $1000,y
$06:839d  b5 10		 lda $10,x
$06:839f  72 98		 adc ($98)
$06:83a1  f9 00 10	  sbc $1000,y
$06:83a4  b4 10		 ldy $10,x
$06:83a6  71 98		 adc ($98),y
$06:83a8  f9 00 10	  sbc $1000,y
$06:83ab  b2 10		 lda ($10)
$06:83ad  70 98		 bvs $8347
$06:83af  f9 00 10	  sbc $1000,y
$06:83b2  b0 ea		 bcs $839e
$06:83b4  00 e4		 brk #$e4
$06:83b6  e4 00		 cpx $00
$06:83b8  e0 09 e7	  cpx #$e709
$06:83bb  34 ed		 bit $ed,x
$06:83bd  e6 ea		 inc $ea
$06:83bf  00 ee		 brk #$ee
$06:83c1  21 00		 and ($00,x)
$06:83c3  e3 0c		 sbc $0c,s
$06:83c5  28			plp
$06:83c6  ff 23 5f 8e   sbc $8e5f23,x
$06:83ca  f9 01 12	  sbc $1201,y
$06:83cd  b7 e4		 lda [$e4],y
$06:83cf  ea			nop
$06:83d0  00 e4		 brk #$e4
$06:83d2  00 e0		 brk #$e0
$06:83d4  07 e7		 ora [$e7]
$06:83d6  34 ed		 bit $ed,x
$06:83d8  96 ee		 stx $ee,y
$06:83da  60			rts
$06:83db  00 60		 brk #$60
$06:83dd  7f c3 f9 00   adc $00f9c3,x
$06:83e1  18			clc
$06:83e2  98			tya
$06:83e3  e4 ea		 cpx $ea
$06:83e5  00 00		 brk #$00
$06:83e7  e7 2f		 sbc [$2f]
$06:83e9  e0 0b ed	  cpx #$ed0b
$06:83ec  d2 ea		 cmp ($ea)
$06:83ee  09 08 5d	  ora #$5d08
$06:83f1  a4 04		 ldy $04
$06:83f3  32 a4		 and ($a4)
$06:83f5  08			php
$06:83f6  5d a8 04	  eor $04a8,x
$06:83f9  32 a8		 and ($a8)
$06:83fb  08			php
$06:83fc  5d ab 04	  eor $04ab,x
$06:83ff  32 ab		 and ($ab)
$06:8401  ed c8 08	  sbc $08c8
$06:8404  5d a4 04	  eor $04a4,x
$06:8407  32 a4		 and ($a4)
$06:8409  08			php
$06:840a  5d a8 04	  eor $04a8,x
$06:840d  32 a8		 and ($a8)
$06:840f  08			php
$06:8410  5d ab 04	  eor $04ab,x
$06:8413  32 ab		 and ($ab)
$06:8415  ed be 08	  sbc $08be
$06:8418  5d a4 04	  eor $04a4,x
$06:841b  32 a4		 and ($a4)
$06:841d  08			php
$06:841e  5d a8 04	  eor $04a8,x
$06:8421  32 a8		 and ($a8)
$06:8423  08			php
$06:8424  5d ab 04	  eor $04ab,x
$06:8427  32 ab		 and ($ab)
$06:8429  ed a0 08	  sbc $08a0
$06:842c  5d a4 04	  eor $04a4,x
$06:842f  32 a4		 and ($a4)
$06:8431  08			php
$06:8432  5d a8 04	  eor $04a8,x
$06:8435  32 a8		 and ($a8)
$06:8437  08			php
$06:8438  5d ab 04	  eor $04ab,x
$06:843b  32 ab		 and ($ab)
$06:843d  ed 78 08	  sbc $0878
$06:8440  5d a4 04	  eor $04a4,x
$06:8443  32 a4		 and ($a4)
$06:8445  08			php
$06:8446  5d a8 04	  eor $04a8,x
$06:8449  32 a8		 and ($a8)
$06:844b  08			php
$06:844c  5d ab 04	  eor $04ab,x
$06:844f  32 ab		 and ($ab)
$06:8451  ed 50 08	  sbc $0850
$06:8454  5d a4 04	  eor $04a4,x
$06:8457  32 a4		 and ($a4)
$06:8459  08			php
$06:845a  5d a8 04	  eor $04a8,x
$06:845d  32 a8		 and ($a8)
$06:845f  08			php
$06:8460  5d ab 04	  eor $04ab,x
$06:8463  32 ab		 and ($ab)
$06:8465  ed 32 08	  sbc $0832
$06:8468  5d a4 04	  eor $04a4,x
$06:846b  32 a4		 and ($a4)
$06:846d  08			php
$06:846e  5d a8 04	  eor $04a8,x
$06:8471  32 a8		 and ($a8)
$06:8473  08			php
$06:8474  5d ab 04	  eor $04ab,x
$06:8477  32 ab		 and ($ab)
$06:8479  e4 ea		 cpx $ea
$06:847b  00 00		 brk #$00
$06:847d  e7 34		 sbc [$34]
$06:847f  e0 06 ed	  cpx #$ed06
$06:8482  af ea 07 e3   lda $e307ea
$06:8486  01 1e		 ora ($1e,x)
$06:8488  1e 07 4f	  asl $4f07,x
$06:848b  a8			tay
$06:848c  0e 7f b7	  asl $b77f
$06:848f  0a			asl a
$06:8490  57 b7		 eor [$b7],y
$06:8492  06 52		 asl $52
$06:8494  b7 02		 lda [$02],y
$06:8496  50 b7		 bvc $844f
$06:8498  e4 ea		 cpx $ea
$06:849a  00 e4		 brk #$e4
$06:849c  00 e0		 brk #$e0
$06:849e  09 e7 19	  ora #$19e7
$06:84a1  ed 82 ea	  sbc $ea82
$06:84a4  f4 18 7b	  pea $7b18
$06:84a7  bb			tyx
$06:84a8  f9 00 04	  sbc $0400,y
$06:84ab  bc 0c 7d	  ldy $7d0c,x
$06:84ae  ba			tsx
$06:84af  f9 00 08	  sbc $0800,y
$06:84b2  ba			tsx
$06:84b3  0c 7f b8	  tsb $b87f
$06:84b6  f9 00 08	  sbc $0800,y
$06:84b9  b8			clv
$06:84ba  18			clc
$06:84bb  b7 f9		 lda [$f9],y
$06:84bd  00 0c		 brk #$0c
$06:84bf  b7 b5		 lda [$b5],y
$06:84c1  f9 00 0c	  sbc $0c00,y
$06:84c4  b5 b3		 lda $b3,x
$06:84c6  f9 00 0c	  sbc $0c00,y
$06:84c9  b3 b2		 lda ($b2,s),y
$06:84cb  f9 00 0c	  sbc $0c00,y
$06:84ce  b2 b0		 lda ($b0)
$06:84d0  f9 00 0c	  sbc $0c00,y
$06:84d3  b0 af		 bcs $8484
$06:84d5  f9 00 0c	  sbc $0c00,y
$06:84d8  af 30 b0 f9   lda $f9b030
$06:84dc  00 18		 brk #$18
$06:84de  b0 b3		 bcs $8493
$06:84e0  f9 00 18	  sbc $1800,y
$06:84e3  b3 b0		 lda ($b0,s),y
$06:84e5  f9 00 18	  sbc $1800,y
$06:84e8  b0 01		 bcs $84eb
$06:84ea  c9 ea 00	  cmp #$00ea
$06:84ed  e4 00		 cpx $00
$06:84ef  e0 05 e7	  cpx #$e705
$06:84f2  34 ed		 bit $ed,x
$06:84f4  ff e3 00 96   sbc $9600e3,x
$06:84f8  fc 60 7f	  jsr ($7f60,x)
$06:84fb  b7 f9		 lda [$f9],y
$06:84fd  00 60		 brk #$60
$06:84ff  98			tya
$06:8500  c8			iny
$06:8501  5a			phy
$06:8502  68			pla
$06:8503  c8			iny
$06:8504  01 c9		 ora ($c9,x)
$06:8506  ea			nop
$06:8507  00 e4		 brk #$e4
$06:8509  00 e0		 brk #$e0
$06:850b  00 e7		 brk #$e7
$06:850d  34 ed		 bit $ed,x
$06:850f  ff e3 00 37   sbc $3700e3,x
$06:8513  fa			plx
$06:8514  0c 7f bc	  tsb $bc7f
$06:8517  f9 00 0c	  sbc $0c00,y
$06:851a  98			tya
$06:851b  0c 75 bc	  tsb $bc75
$06:851e  f9 00 0c	  sbc $0c00,y
$06:8521  98			tya
$06:8522  0c 73 bc	  tsb $bc73
$06:8525  f9 00 0c	  sbc $0c00,y
$06:8528  98			tya
$06:8529  0a			asl a
$06:852a  72 bc		 adc ($bc)
$06:852c  f9 00 0a	  sbc $0a00,y
$06:852f  98			tya
$06:8530  01 c9		 ora ($c9,x)
$06:8532  e4 ea		 cpx $ea
$06:8534  00 00		 brk #$00
$06:8536  e0 0c e7	  cpx #$e70c
$06:8539  34 ed		 bit $ed,x
$06:853b  ff ea 02 e3   sbc $e302ea,x
$06:853f  05 50		 ora $50
$06:8541  78			sei
$06:8542  09 7f 97	  ora #$977f
$06:8545  06 c9		 asl $c9
$06:8547  01 7d		 ora ($7d,x)
$06:8549  ad 0b 7b	  lda $7b0b
$06:854c  af 07 75 af   lda $af7507
$06:8550  e4 ed		 cpx $ed
$06:8552  d2 e3		 cmp ($e3)
$06:8554  05 50		 ora $50
$06:8556  78			sei
$06:8557  09 7f 97	  ora #$977f
$06:855a  06 c9		 asl $c9
$06:855c  01 7d		 ora ($7d,x)
$06:855e  ad 0b 7b	  lda $7b0b
$06:8561  af 07 75 af   lda $af7507
$06:8565  e4 ed		 cpx $ed
$06:8567  aa			tax
$06:8568  e3 05		 sbc $05,s
$06:856a  50 78		 bvc $85e4
$06:856c  09 7f 97	  ora #$977f
$06:856f  06 c9		 asl $c9
$06:8571  01 7d		 ora ($7d,x)
$06:8573  ad 0b 7b	  lda $7b0b
$06:8576  af 07 75 af   lda $af7507
$06:857a  e4 ed		 cpx $ed
$06:857c  78			sei
$06:857d  e3 05		 sbc $05,s
$06:857f  50 78		 bvc $85f9
$06:8581  09 7f 97	  ora #$977f
$06:8584  06 c9		 asl $c9
$06:8586  01 7d		 ora ($7d,x)
$06:8588  ad 0b 7b	  lda $7b0b
$06:858b  af 07 75 af   lda $af7507
$06:858f  e4 ea		 cpx $ea
$06:8591  00 e4		 brk #$e4
$06:8593  00 e0		 brk #$e0
$06:8595  05 e7		 ora $e7
$06:8597  33 ed		 and ($ed,s),y
$06:8599  ff ea fc e3   sbc $e3fcea,x
$06:859d  0c 02 02	  tsb $0202
$06:85a0  04 4d		 tsb $4d
$06:85a2  a8			tay
$06:85a3  46 7f		 lsr $7f
$06:85a5  a9 f9 00	  lda #$00f9
$06:85a8  46 a9		 lsr $a9
$06:85aa  ee 3c 00	  inc $003c
$06:85ad  20 79 a7	  jsr $a779
$06:85b0  f9 20 20	  sbc $2020,y
$06:85b3  a6 e4		 ldx $e4
$06:85b5  ea			nop
$06:85b6  00 00		 brk #$00
$06:85b8  e0 0a e7	  cpx #$e70a
$06:85bb  29 ed 9b	  and #$9bed
$06:85be  ea			nop
$06:85bf  f3 e3		 sbc ($e3,s),y
$06:85c1  01 06		 ora ($06,x)
$06:85c3  06 08		 asl $08
$06:85c5  4d a4 02	  eor $02a4
$06:85c8  33 a4		 and ($a4,s),y
$06:85ca  08			php
$06:85cb  4d a8 02	  eor $02a8
$06:85ce  33 a8		 and ($a8,s),y
$06:85d0  08			php
$06:85d1  4d ab 02	  eor $02ab
$06:85d4  33 ab		 and ($ab,s),y
$06:85d6  12 25		 ora ($25)
$06:85d8  b0 03		 bcs $85dd
$06:85da  13 b0		 ora ($b0,s),y
$06:85dc  06 4d		 asl $4d
$06:85de  ab			plb
$06:85df  02 33		 cop #$33
$06:85e1  ab			plb
$06:85e2  18			clc
$06:85e3  37 b0		 and [$b0],y
$06:85e5  08			php
$06:85e6  33 b0		 and ($b0,s),y
$06:85e8  e4 ea		 cpx $ea
$06:85ea  00 00		 brk #$00
$06:85ec  e0 09 e7	  cpx #$e709
$06:85ef  34 ed		 bit $ed,x
$06:85f1  50 ee		 bvc $85e1
$06:85f3  60			rts
$06:85f4  a0 e3 00	  ldy #$00e3
$06:85f7  12 fb		 ora ($fb)
$06:85f9  60			rts
$06:85fa  7f b7 ee c0   adc $c0eeb7,x
$06:85fe  00 c8		 brk #$c8
$06:8600  c8			iny
$06:8601  e4 00		 cpx $00
$06:8603  e0 0a ed	  cpx #$ed0a
$06:8606  96 e7		 stx $e7,y
$06:8608  34 06		 bit $06,x
$06:860a  7f b0 f9 00   adc $00f9b0,x
$06:860e  06 80		 asl $80
$06:8610  ee 60 32	  inc $3260
$06:8613  60			rts
$06:8614  bc f9 00	  ldy $00f9,x
$06:8617  60			rts
$06:8618  80 00		 bra $861a
$06:861a  e0 09 e7	  cpx #$e709
$06:861d  34 ed		 bit $ed,x
$06:861f  be ee 60	  ldx $60ee,y
$06:8622  00 e3		 brk #$e3
$06:8624  00 32		 brk #$32
$06:8626  f8			sed
$06:8627  60			rts
$06:8628  7f b0 f9 00   adc $00f9b0,x
$06:862c  10 8c		 bpl $85ba
$06:862e  e4 e4		 cpx $e4
$06:8630  00 e0		 brk #$e0
$06:8632  0a			asl a
$06:8633  ed aa e7	  sbc $e7aa
$06:8636  34 e3		 bit $e3,x
$06:8638  00 b4		 brk #$b4
$06:863a  e6 ee		 inc $ee
$06:863c  20 32 30	  jsr $3032
$06:863f  7f 90 e4 00   adc $00e490,x
$06:8643  e0 03 ed	  cpx #$ed03
$06:8646  b4 e7		 ldy $e7,x
$06:8648  34 20		 bit $20,x
$06:864a  7f ad 00 e0   adc $e000ad,x
$06:864e  06 ed		 asl $ed
$06:8650  b4 e7		 ldy $e7,x
$06:8652  34 ee		 bit $ee,x
$06:8654  60			rts
$06:8655  00 10		 brk #$10
$06:8657  7f b4 f9 00   adc $00f9b4,x
$06:865b  10 8c		 bpl $85e9
$06:865d  b4 f9		 ldy $f9,x
$06:865f  00 10		 brk #$10
$06:8661  8c b4 f9	  sty $f9b4
$06:8664  00 10		 brk #$10
$06:8666  8c b4 f9	  sty $f9b4
$06:8669  00 10		 brk #$10
$06:866b  8c b4 f9	  sty $f9b4
$06:866e  00 10		 brk #$10
$06:8670  8c b4 f9	  sty $f9b4
$06:8673  00 10		 brk #$10
$06:8675  8c 00 e7	  sty $e700
$06:8678  34 ed		 bit $ed,x
$06:867a  aa			tax
$06:867b  e0 0a e0	  cpx #$e00a
$06:867e  0a			asl a
$06:867f  08			php
$06:8680  7f 80 f9 00   adc $00f980,x
$06:8684  08			php
$06:8685  bc 80 f9	  ldy $f980,x
$06:8688  00 08		 brk #$08
$06:868a  b0 80		 bcs $860c
$06:868c  f9 00 08	  sbc $0800,y
$06:868f  a4 80		 ldy $80
$06:8691  f9 00 08	  sbc $0800,y
$06:8694  a3 08		 lda $08,s
$06:8696  7b			tdc
$06:8697  80 f9		 bra $8692
$06:8699  00 08		 brk #$08
$06:869b  a1 08		 lda ($08,x)
$06:869d  79 80 f9	  adc $f980,y
$06:86a0  00 08		 brk #$08
$06:86a2  9f 08 77 80   sta $807708,x
$06:86a6  f9 00 08	  sbc $0800,y
$06:86a9  9d 08 75	  sta $7508,x
$06:86ac  80 f9		 bra $86a7
$06:86ae  00 08		 brk #$08
$06:86b0  9c 00 e7	  stz $e700
$06:86b3  34 ed		 bit $ed,x
$06:86b5  a0 e0 0a	  ldy #$0ae0
$06:86b8  60			rts
$06:86b9  7f b0 f9 00   adc $00f9b0,x
$06:86bd  60			rts
$06:86be  c0 c9 00	  cpy #$00c9
$06:86c1  00 34		 brk #$34
$06:86c3  00 00		 brk #$00
$06:86c5  2c 00 30	  bit $3000
$06:86c8  00 30		 brk #$30
$06:86ca  01 3b		 ora ($3b,x)
$06:86cc  01 3b		 ora ($3b,x)
$06:86ce  eb			xba
$06:86cf  44 06 45	  mvp $45,$06
$06:86d2  45 45		 eor $45
$06:86d4  45 45		 eor $45
$06:86d6  2f 4f 4a 4f   and $4f4a4f
$06:86da  14 58		 trb $58
$06:86dc  38			sec
$06:86dd  58			cli
$06:86de  b4 5d		 ldy $5d,x
$06:86e0  cf 5d d8 5d   cmp $5dd85d
$06:86e4  a1 64		 lda ($64,x)
$06:86e6  06 69		 asl $69
$06:86e8  73 6b		 adc ($6b,s),y
$06:86ea  a1 6d		 lda ($6d,x)
$06:86ec  d7 6d		 cmp [$6d],y
$06:86ee  f2 6d		 sbc ($6d)
$06:86f0  0d 6e 4c	  ora $4c6e
$06:86f3  6e 9d 6e	  ror $6e9d
$06:86f6  d3 6e		 cmp ($6e,s),y
$06:86f8  14 73		 trb $73
$06:86fa  01 00		 ora ($00,x)
$06:86fc  ff 0f 0d 00   sbc $000d0f,x
$06:8700  00 0d		 brk #$0d
$06:8702  00 01		 brk #$01
$06:8704  02 03		 cop #$03
$06:8706  04 05		 tsb $05
$06:8708  0c 06 0b	  tsb $0b06
$06:870b  1c 0d 07	  trb $070d
$06:870e  1d 00 00	  ora $0000,x
$06:8711  00 00		 brk #$00
$06:8713  00 00		 brk #$00
$06:8715  00 00		 brk #$00
$06:8717  00 00		 brk #$00
$06:8719  00 00		 brk #$00
$06:871b  00 00		 brk #$00
$06:871d  00 00		 brk #$00
$06:871f  00 00		 brk #$00
$06:8721  00 00		 brk #$00
$06:8723  00 00		 brk #$00
$06:8725  00 00		 brk #$00
$06:8727  00 00		 brk #$00
$06:8729  00 00		 brk #$00
$06:872b  00 00		 brk #$00
$06:872d  00 00		 brk #$00
$06:872f  ff fe fe f5   sbc $f5fefe,x
$06:8733  fd bb fb	  sbc $fbbb,x
$06:8736  f7 f5		 sbc [$f5],y
$06:8738  ed ed 5f	  sbc $5fed
$06:873b  d6 b7		 dec $b7,x
$06:873d  a5 6e		 lda $6e
$06:873f  fe fe f4	  inc $f4fe,x
$06:8742  f4 b8 b8	  pea $b8b8
$06:8745  f0 f0		 beq $8737
$06:8747  e2 e0		 sep #$e0
$06:8749  40			rti
$06:874a  40			rti
$06:874b  88			dey
$06:874c  80 10		 bra $875e
$06:874e  00 00		 brk #$00
$06:8750  ff 30 ff 00   sbc $00ff30,x
$06:8754  ff ac 21 a0   sbc $a021ac,x
$06:8758  81 ba		 sta ($ba,x)
$06:875a  33 24		 and ($24,s),y
$06:875c  e5 1a		 sbc $1a
$06:875e  1f 00 00 4a   ora $4a0000,x
$06:8762  00 9f		 brk #$9f
$06:8764  00 df		 brk #$df
$06:8766  00 7e		 brk #$7e
$06:8768  00 cc		 brk #$cc
$06:876a  00 db		 brk #$db
$06:876c  00 e4		 brk #$e4
$06:876e  00 a9		 brk #$a9
$06:8770  7e d7 35	  ror $35d7,x
$06:8773  b5 76		 lda $76,x
$06:8775  a9 7e		 lda #$7e
$06:8777  d5 3b		 cmp $3b,x
$06:8779  ab			plb
$06:877a  6d a5 76	  adc $76a5
$06:877d  d3 3d		 cmp ($3d,s),y
$06:877f  00 00		 brk #$00
$06:8781  09 01		 ora #$01
$06:8783  08			php
$06:8784  00 00		 brk #$00
$06:8786  00 01		 brk #$01
$06:8788  01 11		 ora ($11,x)
$06:878a  01 08		 ora ($08,x)
$06:878c  00 01		 brk #$01
$06:878e  01 8f		 ora ($8f,x)
$06:8790  f5 a5		 sbc $a5,x
$06:8792  7a			ply
$06:8793  d5 bb		 cmp $bb,x
$06:8795  af 55 d5 ba   lda $bad555
$06:8799  95 6b		 sta $6b,x
$06:879b  ef b5 a5 7a   sbc $7aa5b5
$06:879f  85 85		 sta $85
$06:87a1  00 00		 brk #$00
$06:87a3  81 81		 sta ($81,x)
$06:87a5  05 05		 ora $05
$06:87a7  80 80		 bra $8729
$06:87a9  01 01		 ora ($01,x)
$06:87ab  85 85		 sta $85
$06:87ad  00 00		 brk #$00
$06:87af  d7 fe		 cmp [$fe],y
$06:87b1  47 fc		 eor [$fc]
$06:87b3  af f8 8d f2   lda $f28df8
$06:87b7  99 e6 67	  sta $67e6,y
$06:87ba  dc 5d ba	  jml [$ba5d]
$06:87bd  a3 7c		 lda $7c,s
$06:87bf  28			plp
$06:87c0  d6 a8		 dec $a8,x
$06:87c2  54 50 a8	  mvn $a8,$50
$06:87c5  50 a0		 bvc $8767
$06:87c7  20 c0 80	  jsr $80c0
$06:87ca  40			rti
$06:87cb  80 00		 bra $87cd
$06:87cd  00 00		 brk #$00
$06:87cf  ff d5 dd aa   sbc $aaddd5,x
$06:87d3  aa			tax
$06:87d4  f5 dd		 sbc $dd,x
$06:87d6  ff a9 a9 c4   sbc $c4a9a9,x
$06:87da  c4 e8		 cpy $e8
$06:87dc  78			sei
$06:87dd  bf 6f d5 d5   lda $d5d56f,x
$06:87e1  88			dey
$06:87e2  88			dey
$06:87e3  80 80		 bra $8765
$06:87e5  80 80		 bra $8767
$06:87e7  d6 80		 dec $80,x
$06:87e9  bb			tyx
$06:87ea  80 67		 bra $8853
$06:87ec  60			rts
$06:87ed  0f 0f ff 55   ora $55ff0f
$06:87f1  dd ab af	  cmp $afab,x
$06:87f4  5d d9 ff	  eor $ffd9,x
$06:87f7  35 35		 and $35,x
$06:87f9  03 03		 ora $03,s
$06:87fb  17 1e		 ora [$1e],y
$06:87fd  fd f6 55	  sbc $55f6,x
$06:8800  55 89		 eor $89,x
$06:8802  89 09		 bit #$09
$06:8804  09 01		 ora #$01
$06:8806  01 cb		 ora ($cb,x)
$06:8808  01 fd		 ora ($fd,x)
$06:880a  01 e6		 ora ($e6,x)
$06:880c  06 f0		 asl $f0
$06:880e  f0 8f		 beq $879f
$06:8810  75 65		 adc $65,x
$06:8812  ba			tsx
$06:8813  b5 db		 lda $db,x
$06:8815  df e5 ad b2   cmp $b2ade5,x
$06:8819  b5 fb		 lda $fb,x
$06:881b  6b			rtl
$06:881c  ed a5 76	  sbc $76a5
$06:881f  05 05		 ora $05
$06:8821  00 00		 brk #$00
$06:8823  01 01		 ora ($01,x)
$06:8825  05 05		 ora $05
$06:8827  40			rti
$06:8828  00 01		 brk #$01
$06:882a  01 11		 ora ($11,x)
$06:882c  01 08		 ora ($08,x)
$06:882e  00 b7		 brk #$b7
$06:8830  fc 9d b3	  jsr ($b39d,x)
$06:8833  52 ef		 eor ($ef)
$06:8835  29 d9		 and #$d9
$06:8837  35 5e		 and $5e,x
$06:8839  ce ab 6c	  dec $6cab
$06:883c  9f ed ba 68   sta $68baed,x
$06:8840  94 30		 sty $30,x
$06:8842  c0 e0 00	  cpy #$00e0
$06:8845  c6 00		 dec $00
$06:8847  40			rti
$06:8848  80 90		 bra $87da
$06:884a  00 80		 brk #$80
$06:884c  00 00		 brk #$00
$06:884e  80 5b		 bra $88ab
$06:8850  dd 57 7a	  cmp $7a57,x
$06:8853  af f5 5f eb   lda $eb5ff5
$06:8857  bf dd 7f af   lda $af7fdd,x
$06:885b  ff 3b ff 5d   sbc $5dff3b,x
$06:885f  21 01		 and ($01,x)
$06:8861  82 02 05	  brl $8d66
$06:8864  05 0b		 ora $0b
$06:8866  0b			phd
$06:8867  1d 1d 2f	  ora $2f1d,x
$06:886a  2f 3b 3b 5d   and $5d3b3b
$06:886e  5d fb a4	  eor $a4fb,x
$06:8871  f6 ed		 inc $ed,x
$06:8873  eb			xba
$06:8874  54 ed db	  mvn $db,$ed
$06:8877  d7 aa		 cmp [$aa],y
$06:8879  db			stp
$06:887a  b5 8b		 lda $8b,x
$06:887c  76 a5		 ror $a5,x
$06:887e  5f a0 a0 e0   eor $e0a0a0,x
$06:8882  e0 40 40	  cpx #$4040
$06:8885  c1 c1		 cmp ($c1,x)
$06:8887  82 82 81	  brl $0a0c
$06:888a  81 02		 sta ($02,x)
$06:888c  02 05		 cop #$05
$06:888e  05 cb		 ora $cb
$06:8890  b6 b7		 ldx $b7,y
$06:8892  59 65 bf	  eor $bf65,y
$06:8895  b6 6c		 ldx $6c,y
$06:8897  dd bf f7	  cmp $f7bf,x
$06:889a  77 bd		 adc [$bd],y
$06:889c  bd e6 ff	  lda $ffe6,x
$06:889f  82 82 01	  brl $8a24
$06:88a2  01 25		 ora ($25,x)
$06:88a4  24 24		 bit $24
$06:88a6  25 9e		 and $9e
$06:88a8  99 62 7d	  sta $7d62,y
$06:88ab  a8			tay
$06:88ac  d7 db		 cmp [$db],y
$06:88ae  a4 24		 ldy $24
$06:88b0  cf 4e 76 c7   cmp $c7764e
$06:88b4  ef 12 f7 ba   sbc $baf712
$06:88b8  5f a5 5f d5   eor $d55fa5,x
$06:88bc  ab			plb
$06:88bd  e9 de		 sbc #$de
$06:88bf  0f 10 84 03   ora $038410
$06:88c3  15 06		 ora $06,x
$06:88c5  0b			phd
$06:88c6  02 03		 cop #$03
$06:88c8  02 01		 cop #$01
$06:88ca  01 81		 ora ($81,x)
$06:88cc  81 da		 sta ($da,x)
$06:88ce  48			pha
$06:88cf  a3 5d		 lda $5d,s
$06:88d1  d5 6a		 cmp $6a,x
$06:88d3  dd a3 ab	  cmp $aba3,x
$06:88d6  54 bb e5	  mvn $e5,$bb
$06:88d9  d7 7a		 cmp [$7a],y
$06:88db  fb			xce
$06:88dc  ed 76 db	  sbc $db76
$06:88df  01 01		 ora ($01,x)
$06:88e1  40			rti
$06:88e2  40			rti
$06:88e3  81 81		 sta ($81,x)
$06:88e5  00 00		 brk #$00
$06:88e7  a1 a1		 lda ($a1,x)
$06:88e9  52 52		 eor ($52)
$06:88eb  ac e9 c9	  ldy $c9e9
$06:88ee  52 cb		 eor ($cb)
$06:88f0  3c a5 7b	  bit $7ba5,x
$06:88f3  d3 3c		 cmp ($3c,s),y
$06:88f5  a7 79		 lda [$79]
$06:88f7  cb			wai
$06:88f8  3c a5 7b	  bit $7ba5,x
$06:88fb  d3 3c		 cmp ($3c,s),y
$06:88fd  a7 79		 lda [$79]
$06:88ff  00 00		 brk #$00
$06:8901  01 01		 ora ($01,x)
$06:8903  00 00		 brk #$00
$06:8905  01 01		 ora ($01,x)
$06:8907  00 00		 brk #$00
$06:8909  01 01		 ora ($01,x)
$06:890b  00 00		 brk #$00
$06:890d  01 01		 ora ($01,x)
$06:890f  ff fe ff f6   sbc $f6fffe,x
$06:8913  ff bc ff fc   sbc $fcffbc,x
$06:8917  fe d9 fc	  inc $fcd9,x
$06:891a  7b			tdc
$06:891b  fe f3 f9	  inc $f9f3,x
$06:891e  d6 fe		 dec $fe,x
$06:8920  fe f6 f6	  inc $f6f6,x
$06:8923  bc bc fc	  ldy $fcbc,x
$06:8926  fc d8 d8	  jsr ($d8d8,x)
$06:8929  78			sei
$06:892a  78			sei
$06:892b  f0 f0		 beq $891d
$06:892d  d0 d0		 bne $88ff
$06:892f  97 6a		 sta [$6a],y
$06:8931  6f b5 3f c7   adc $c73fb5
$06:8935  df a9 bf 5f   cmp $5fbfa9,x
$06:8939  7f ad bf 77   adc $77bfad,x
$06:893d  7f dd 02 02   adc $0202dd,x
$06:8941  05 05		 ora $05
$06:8943  07 07		 ora [$07]
$06:8945  09 09		 ora #$09
$06:8947  1f 1f 2d 2d   ora $2d2d1f,x
$06:894b  37 37		 and [$37],y
$06:894d  5d 5d 2a	  eor $2a5d,x
$06:8950  fb			xce
$06:8951  97 7f		 sta [$7f],y
$06:8953  d4 2b		 pei ($2b)
$06:8955  2f d4 ff 52   and $52ffd4
$06:8959  ff ab 7f ee   sbc $ee7fab,x
$06:895d  ad bf 04	  lda $04bf
$06:8960  00 00		 brk #$00
$06:8962  00 00		 brk #$00
$06:8964  00 04		 brk #$04
$06:8966  04 52		 tsb $52
$06:8968  52 ab		 eor ($ab)
$06:896a  ab			plb
$06:896b  ee 4a bf	  inc $bf4a
$06:896e  41 79		 eor ($79,x)
$06:8970  fe 53 f6	  inc $f653,x
$06:8973  44 bf bb	  mvp $bb,$bf
$06:8976  56 dd		 lsr $dd,x
$06:8978  ab			plb
$06:8979  b7 4a		 lda [$4a],y
$06:897b  ff 25 ad 5b   sbc $5bad25,x
$06:897f  00 00		 brk #$00
$06:8981  08			php
$06:8982  00 00		 brk #$00
$06:8984  00 00		 brk #$00
$06:8986  00 81		 brk #$81
$06:8988  81 02		 sta ($02,x)
$06:898a  02 25		 cop #$25
$06:898c  25 5b		 and $5b
$06:898e  08			php
$06:898f  2e 35 8b	  rol $8b35
$06:8992  1f ad 3a ce   ora $ce3aad,x
$06:8996  19 ad 3a	  ora $3aad,y
$06:8999  ce 15 8d	  dec $8d15
$06:899c  16 df		 asl $df,x
$06:899e  14 c4		 trb $c4
$06:89a0  04 eb		 tsb $eb
$06:89a2  0b			phd
$06:89a3  c8			iny
$06:89a4  08			php
$06:89a5  e8			inx
$06:89a6  08			php
$06:89a7  c8			iny
$06:89a8  08			php
$06:89a9  e4 04		 cpx $04
$06:89ab  e4 04		 cpx $04
$06:89ad  e4 04		 cpx $04
$06:89af  ff fe ff f7   sbc $f7fffe,x
$06:89b3  ff bf ff fd   sbc $fdffbf,x
$06:89b7  ff df ff fa   sbc $faffdf,x
$06:89bb  ff ad f6 5b   sbc $5bf6ad,x
$06:89bf  f6 fe		 inc $fe,x
$06:89c1  f5 f7		 sbc $f7,x
$06:89c3  af bf bd fd   lda $fdbdbf
$06:89c7  db			stp
$06:89c8  df 52 fa a9   cmp $a9fa52,x
$06:89cc  ad 09 52	  lda $5209
$06:89cf  ff fe ff f7   sbc $f7fffe,x
$06:89d3  ff bf ff fd   sbc $fdffbf,x
$06:89d7  ff df ff 7d   sbc $7dffdf,x
$06:89db  ff f7 ff dd   sbc $ddfff7,x
$06:89df  fe fe f7	  inc $f7fe,x
$06:89e2  f7 bf		 sbc [$bf],y
$06:89e4  bf fd fd df   lda $dffdfd,x
$06:89e8  df 7d 7d f7   cmp $f77d7d,x
$06:89ec  f7 dd		 sbc [$dd],y
$06:89ee  dd a4 ef	  cmp $efa4,x
$06:89f1  12 ba		 ora ($ba)
$06:89f3  db			stp
$06:89f4  ff a0 f5 be   sbc $bef5a0,x
$06:89f8  ff 46 6f 35   sbc $356f46,x
$06:89fc  bf 69 fb ef   lda $effb69,x
$06:8a00  10 b8		 bpl $89ba
$06:8a02  47 7d		 eor [$7d]
$06:8a04  82 75 8a	  brl $147c
$06:8a07  eb			xba
$06:8a08  14 6b		 trb $6b
$06:8a0a  94 9e		 sty $9e,x
$06:8a0c  61 d3		 adc ($d3,x)
$06:8a0e  2c ff ff	  bit $ffff
$06:8a11  ff ff ff ff   sbc $ffffff,x
$06:8a15  ff ff ff ff   sbc $ffffff,x
$06:8a19  ff ff ff ff   sbc $ffffff,x
$06:8a1d  ff ff ff ff   sbc $ffffff,x
$06:8a21  ff ff ff ff   sbc $ffffff,x
$06:8a25  ff ff ff ff   sbc $ffffff,x
$06:8a29  ff ff ff ff   sbc $ffffff,x
$06:8a2d  ff ff ef b3   sbc $b3efff,x
$06:8a31  ff 55 f7 cb   sbc $cbf755,x
$06:8a35  ff 89 ff 53   sbc $53ff89,x
$06:8a39  f7 8d		 sbc [$8d],y
$06:8a3b  ff d3 ff 69   sbc $69ffd3,x
$06:8a3f  a3 a3		 lda $a3,s
$06:8a41  55 55		 eor $55,x
$06:8a43  c3 c3		 cmp $c3,s
$06:8a45  89 89		 bit #$89
$06:8a47  53 53		 eor ($53,s),y
$06:8a49  85 85		 sta $85
$06:8a4b  d3 d3		 cmp ($d3,s),y
$06:8a4d  69 69		 adc #$69
$06:8a4f  e9 17		 sbc #$17
$06:8a51  d3 ac		 cmp ($ac,s),y
$06:8a53  f7 69		 sbc [$69],y
$06:8a55  e9 96		 sbc #$96
$06:8a57  eb			xba
$06:8a58  5d f5 aa	  eor $aaf5,x
$06:8a5b  ef 51 fb 8c   sbc $8cfb51
$06:8a5f  01 01		 ora ($01,x)
$06:8a61  80 80		 bra $89e3
$06:8a63  61 61		 adc ($61,x)
$06:8a65  80 80		 bra $89e7
$06:8a67  49 49		 eor #$49
$06:8a69  a0 a0 41	  ldy #$41a0
$06:8a6c  41 88		 eor ($88,x)
$06:8a6e  88			dey
$06:8a6f  86 5d		 stx $5d
$06:8a71  6b			rtl
$06:8a72  b6 8b		 ldx $8b,y
$06:8a74  7f b9 6b c5   adc $c56bb9,x
$06:8a78  3f aa 66 e6   and $e666aa,x
$06:8a7c  3c 99 6f	  bit $6f99,x
$06:8a7f  20 00 00	  jsr $0000
$06:8a82  00 00		 brk #$00
$06:8a84  00 04		 brk #$04
$06:8a86  00 00		 brk #$00
$06:8a88  00 11		 brk #$11
$06:8a8a  00 01		 brk #$01
$06:8a8c  00 00		 brk #$00
$06:8a8e  00 d3		 brk #$d3
$06:8a90  3c a5 7b	  bit $7ba5,x
$06:8a93  d3 3c		 cmp ($3c,s),y
$06:8a95  a7 79		 lda [$79]
$06:8a97  d3 2c		 cmp ($2c,s),y
$06:8a99  a5 7b		 lda $7b
$06:8a9b  da			phx
$06:8a9c  b5 dd		 lda $dd,x
$06:8a9e  6a			ror a
$06:8a9f  00 00		 brk #$00
$06:8aa1  01 01		 ora ($01,x)
$06:8aa3  00 00		 brk #$00
$06:8aa5  01 01		 ora ($01,x)
$06:8aa7  00 00		 brk #$00
$06:8aa9  01 01		 ora ($01,x)
$06:8aab  01 80		 ora ($80,x)
$06:8aad  22 48 ff fe   jsl $feff48
$06:8ab1  ff f7 ff bf   sbc $bffff7,x
$06:8ab5  ff fd f6 cf   sbc $cff6fd,x
$06:8ab9  95 fe		 sta $fe,x
$06:8abb  ba			tsx
$06:8abc  ff 6f f5 fe   sbc $fef56f,x
$06:8ac0  fe f7 f7	  inc $f7f7,x
$06:8ac3  bf bf fd fd   lda $fdfdbf,x
$06:8ac7  c1 ce		 cmp ($ce,x)
$06:8ac9  aa			tax
$06:8aca  d4 d5		 pei ($d5)
$06:8acc  aa			tax
$06:8acd  d0 25		 bne $8af4
$06:8acf  cb			wai
$06:8ad0  3c a7 79	  bit $79a7,x
$06:8ad3  9b			txy
$06:8ad4  76 23		 ror $23,x
$06:8ad6  fd 95 5a	  sbc $5a95,x
$06:8ad9  bb			tyx
$06:8ada  7d 15 da	  adc $da15,x
$06:8add  eb			xba
$06:8ade  6c 00 00	  jmp ($0000)
$06:8ae1  01 01		 ora ($01,x)
$06:8ae3  02 02		 cop #$02
$06:8ae5  01 01		 ora ($01,x)
$06:8ae7  20 00 01	  jsr $0100
$06:8aea  01 20		 ora ($20,x)
$06:8aec  00 10		 brk #$10
$06:8aee  00 e2		 brk #$e2
$06:8af0  e7 b5		 sbc [$b5]
$06:8af2  a6 42		 ldx $42
$06:8af4  c7 97		 cmp [$97]
$06:8af6  9e 2a af	  stz $af2a,x
$06:8af9  d5 c6		 cmp $c6,x
$06:8afb  8a			txa
$06:8afc  8f 55 f6 18   sta $18f655
$06:8b00  00 58		 brk #$58
$06:8b02  00 38		 brk #$38
$06:8b04  00 60		 brk #$60
$06:8b06  00 50		 brk #$50
$06:8b08  00 38		 brk #$38
$06:8b0a  00 70		 brk #$70
$06:8b0c  00 08		 brk #$08
$06:8b0e  00 a5		 brk #$a5
$06:8b10  ee 12 b9	  inc $b912
$06:8b13  dd fb ab	  cmp $abfb,x
$06:8b16  f7 b5		 sbc [$b5],y
$06:8b18  ed 6d 5f	  sbc $5f6d
$06:8b1b  56 b7		 lsr $b7,x
$06:8b1d  a5 6e		 lda $6e
$06:8b1f  ee 10 b8	  inc $b810
$06:8b22  44 78 80	  mvp $80,$78
$06:8b25  70 80		 bvs $8aa7
$06:8b27  e2 00		 sep #$00
$06:8b29  40			rti
$06:8b2a  80 88		 bra $8ab4
$06:8b2c  00 10		 brk #$10
$06:8b2e  00 eb		 brk #$eb
$06:8b30  bf 6a d5 ff   lda $ffd56a,x
$06:8b34  5a			phy
$06:8b35  b5 ea		 lda $ea,x
$06:8b37  57 ef		 eor [$ef],y
$06:8b39  5b			tcd
$06:8b3a  bd af f6	  lda $f6af,x
$06:8b3d  bd 57 14	  lda $1457,x
$06:8b40  ab			plb
$06:8b41  95 40		 sta $40,x
$06:8b43  00 5a		 brk #$5a
$06:8b45  4a			lsr a
$06:8b46  a0 a8 47	  ldy #$47a8
$06:8b49  a4 19		 ldy $19
$06:8b4b  50 a6		 bvc $8af3
$06:8b4d  42 15		 wdm #$15
$06:8b4f  24 ef		 bit $ef
$06:8b51  d2 7a		 cmp ($7a)
$06:8b53  1b			tcs
$06:8b54  ff 20 f5 be   sbc $bef520,x
$06:8b58  7f c6 6f 35   adc $356fc6,x
$06:8b5c  ff 69 fb ef   sbc $effb69,x
$06:8b60  10 38		 bpl $8b9a
$06:8b62  47 7d		 eor [$7d]
$06:8b64  02 75		 cop #$75
$06:8b66  0a			asl a
$06:8b67  2b			pld
$06:8b68  14 2b		 trb $2b
$06:8b6a  14 1e		 trb $1e
$06:8b6c  21 53		 and ($53,x)
$06:8b6e  2c b5 fe	  bit $feb5
$06:8b71  95 be		 sta $be,x
$06:8b73  46 ef		 lsr $ef
$06:8b75  39 fe 15	  and $15fe,y
$06:8b78  5e b6 f7	  lsr $f7b6,x
$06:8b7b  3d bd e6	  and $e6bd,x
$06:8b7e  ff 6a 94 3c   sbc $3c946a,x
$06:8b82  c0 ec 10	  cpy #$10ec
$06:8b85  d4 28		 pei ($28)
$06:8b87  4e b0 e2	  lsr $e2b0
$06:8b8a  1c a8 57	  trb $57a8
$06:8b8d  5b			tcd
$06:8b8e  a4 eb		 ldy $eb
$06:8b90  d8			cld
$06:8b91  e9 58		 sbc #$58
$06:8b93  d3 b0		 cmp ($b0,s),y
$06:8b95  d9 78 ed	  cmp $ed78,y
$06:8b98  dc f2 6e	  jml [$6ef2]
$06:8b9b  fd 93 fe	  sbc $fe93,x
$06:8b9e  0d c7 c0	  ora $c0c7
$06:8ba1  47 40		 eor [$40]
$06:8ba3  8f 80 47 40   sta $404780
$06:8ba7  c3 c0		 cmp $c0,s
$06:8ba9  61 60		 adc ($60,x)
$06:8bab  90 90		 bcc $8b3d
$06:8bad  0c 0c ad	  tsb $ad0c
$06:8bb0  fe 95 ed	  inc $ed95,x
$06:8bb3  46 b0		 lsr $b0
$06:8bb5  76 f7		 ror $f7,x
$06:8bb7  a9 ee		 lda #$ee
$06:8bb9  77 f9		 adc [$f9],y
$06:8bbb  bf b7 3f 3a   lda $3a3fb7,x
$06:8bbf  00 00		 brk #$00
$06:8bc1  02 00		 cop #$00
$06:8bc3  0f 00 08 00   ora $000800
$06:8bc7  10 00		 bpl $8bc9
$06:8bc9  01 01		 ora ($01,x)
$06:8bcb  47 07		 eor [$07]
$06:8bcd  da			phx
$06:8bce  1a			inc a
$06:8bcf  54 fb 52	  mvn $52,$fb
$06:8bd2  ee a3 f7	  inc $f7a3
$06:8bd5  48			pha
$06:8bd6  ef dd fa a5   sbc $a5fadd
$06:8bda  fa			plx
$06:8bdb  ab			plb
$06:8bdc  d5 96		 cmp $96,x
$06:8bde  7b			tdc
$06:8bdf  a8			tay
$06:8be0  50 a1		 bvc $8b83
$06:8be2  40			rti
$06:8be3  68			pla
$06:8be4  a0 d0 40	  ldy #$40d0
$06:8be7  c0 c0 80	  cpy #$80c0
$06:8bea  80 81		 bra $8b6d
$06:8bec  81 5b		 sta ($5b,x)
$06:8bee  12 fb		 ora ($fb)
$06:8bf0  fe 2d 2e	  inc $2e2d,x
$06:8bf3  55 56		 eor $56,x
$06:8bf5  0a			asl a
$06:8bf6  fb			xce
$06:8bf7  7e db fe	  ror $fedb,x
$06:8bfa  25 fe		 and $fe
$06:8bfc  d1 ff		 cmp ($ff),y
$06:8bfe  a0 00 00	  ldy #$0000
$06:8c01  d0 00		 bne $8c03
$06:8c03  a8			tay
$06:8c04  00 04		 brk #$04
$06:8c06  00 58		 brk #$58
$06:8c08  58			cli
$06:8c09  24 24		 bit $24
$06:8c0b  d0 d0		 bne $8bdd
$06:8c0d  a0 a0 06	  ldy #$06a0
$06:8c10  f9 01 be	  sbc $be01,y
$06:8c13  a0 df 83	  ldy #$83df
$06:8c16  fc 10 eb	  jsr ($eb10,x)
$06:8c19  a8			tay
$06:8c1a  d7 82		 cmp [$82],y
$06:8c1c  ff a2 ee af   sbc $afeea2,x
$06:8c20  1f 5f 3f 27   ora $273f5f,x
$06:8c24  7f bf 7f 3e   adc $3e7fbf,x
$06:8c28  7f 28 7f d7   adc $d77f28,x
$06:8c2c  28			plp
$06:8c2d  29 10		 and #$10
$06:8c2f  86 5d		 stx $5d
$06:8c31  6b			rtl
$06:8c32  b6 8b		 ldx $8b,y
$06:8c34  7f b9 6b c7   adc $c76bb9,x
$06:8c38  3d d5 be	  and $bed5,x
$06:8c3b  fa			plx
$06:8c3c  cd ff ff	  cmp $ffff
$06:8c3f  20 00 00	  jsr $0000
$06:8c42  00 00		 brk #$00
$06:8c44  00 04		 brk #$04
$06:8c46  00 00		 brk #$00
$06:8c48  00 90		 brk #$90
$06:8c4a  90 c8		 bcc $8c14
$06:8c4c  c8			iny
$06:8c4d  ff ff e2 e7   sbc $e7e2ff,x
$06:8c51  b5 a6		 lda $a6,x
$06:8c53  42 c7		 wdm #$c7
$06:8c55  95 9e		 sta $9e,x
$06:8c57  2b			pld
$06:8c58  ad 33 ed	  lda $ed33
$06:8c5b  5f a3 ff ff   eor $ffffa3,x
$06:8c5f  18			clc
$06:8c60  00 58		 brk #$58
$06:8c62  00 38		 brk #$38
$06:8c64  00 60		 brk #$60
$06:8c66  00 51		 brk #$51
$06:8c68  01 01		 ora ($01,x)
$06:8c6a  01 03		 ora ($03,x)
$06:8c6c  03 ff		 ora $ff,s
$06:8c6e  ff cb bc a5   sbc $a5bccb,x
$06:8c72  fb			xce
$06:8c73  5f fc 2f db   eor $db2ffc,x
$06:8c77  15 5f		 ora $5f,x
$06:8c79  b7 f7		 lda [$f7],y
$06:8c7b  3d bd f6	  and $f6bd,x
$06:8c7e  ff 80 80 81   sbc $818080,x
$06:8c82  81 d4		 sta ($d4,x)
$06:8c84  54 d9 0b	  mvn $0b,$d9
$06:8c87  4e b1 e2	  lsr $e2b1
$06:8c8a  1d a8 57	  ora $57a8,x
$06:8c8d  5b			tcd
$06:8c8e  a4 86		 ldy $86
$06:8c90  5d 6b b6	  eor $b66b,x
$06:8c93  8b			phb
$06:8c94  7f b5 7f dd   adc $dd7fb5,x
$06:8c98  b2 ff		 lda ($ff)
$06:8c9a  8a			txa
$06:8c9b  3f b5 e6 ff   and $ffe6b5,x
$06:8c9f  20 00 00	  jsr $0000
$06:8ca2  00 00		 brk #$00
$06:8ca4  00 10		 brk #$10
$06:8ca6  10 90		 bpl $8c38
$06:8ca8  90 8a		 bcc $8c34
$06:8caa  8a			txa
$06:8cab  b5 75		 lda $75,x
$06:8cad  5b			tcd
$06:8cae  a4 ac		 ldy $ac
$06:8cb0  ef 12 ba dd   sbc $ddba12
$06:8cb4  ea			nop
$06:8cb5  ac d5 b5	  ldy $b5d5
$06:8cb8  ed 6a 5e	  sbc $5e6a
$06:8cbb  71 eb		 adc ($eb),y
$06:8cbd  7d d7 ef	  adc $efd7,x
$06:8cc0  10 b8		 bpl $8c7a
$06:8cc2  47 68		 eor [$68]
$06:8cc4  80 42		 bra $8d08
$06:8cc6  80 e2		 bra $8caa
$06:8cc8  20 41 c0	  jsr $c041
$06:8ccb  e4 20		 cpx $20
$06:8ccd  d0 10		 bne $8cdf
$06:8ccf  b4 ff		 ldy $ff,x
$06:8cd1  95 bf		 sta $bf,x
$06:8cd3  7d e7 ce	  adc $cee7,x
$06:8cd6  b6 a7		 ldx $a7,y
$06:8cd8  69 ab		 adc #$ab
$06:8cda  ed 55 3b	  sbc $3b55
$06:8cdd  2e 77 6b	  rol $6b77
$06:8ce0  94 3f		 sty $3f,x
$06:8ce2  c0 e7 20	  cpy #$20e7
$06:8ce5  84 87		 sty $87
$06:8ce7  10 01		 bpl $8cea
$06:8ce9  90 81		 bcc $8c6c
$06:8ceb  82 01 a7	  brl $33ef
$06:8cee  24 dd		 bit $dd
$06:8cf0  c1 ef		 cmp ($ef,x)
$06:8cf2  e1 df		 sbc ($df,x)
$06:8cf4  c1 e7		 cmp ($e7,x)
$06:8cf6  e1 ef		 sbc ($ef,x)
$06:8cf8  e9 df		 sbc #$df
$06:8cfa  c1 ed		 cmp ($ed,x)
$06:8cfc  e1 df		 sbc ($df,x)
$06:8cfe  c3 41		 cmp $41,s
$06:8d00  be 21 de	  ldx $de21,y
$06:8d03  41 be		 eor ($be,x)
$06:8d05  21 de		 and ($de,x)
$06:8d07  29 d6		 and #$d6
$06:8d09  41 be		 eor ($be,x)
$06:8d0b  21 de		 and ($de,x)
$06:8d0d  43 bc		 eor $bc,s
$06:8d0f  fe 06 fa	  inc $fa06,x
$06:8d12  a6 fb		 ldx $fb
$06:8d14  c7 f6		 cmp [$f6]
$06:8d16  ea			nop
$06:8d17  fd e4 f2	  sbc $f2e4,x
$06:8d1a  ee f4 ac	  inc $acf4
$06:8d1d  b1 58		 lda ($58),y
$06:8d1f  01 00		 ora ($00,x)
$06:8d21  a1 a0		 lda ($a0,x)
$06:8d23  c0 c0 e1	  cpy #$e1c0
$06:8d26  e0 e3 e0	  cpx #$e0e3
$06:8d29  e1 e0		 sbc ($e0,x)
$06:8d2b  a3 a0		 lda $a0,s
$06:8d2d  17 10		 ora [$10],y
$06:8d2f  ff 60 5f 65   sbc $655f60,x
$06:8d33  df e3 6f 57   cmp $576fe3,x
$06:8d37  bf 27 4f 77   lda $774f27,x
$06:8d3b  2f 35 8d 1a   and $1a8d35
$06:8d3f  80 00		 bra $8d41
$06:8d41  85 05		 sta $05
$06:8d43  03 03		 ora $03,s
$06:8d45  87 07		 sta [$07]
$06:8d47  c7 07		 cmp [$07]
$06:8d49  87 07		 sta [$07]
$06:8d4b  c5 05		 cmp $05
$06:8d4d  e8			inx
$06:8d4e  08			php
$06:8d4f  b4 7f		 ldy $7f,x
$06:8d51  55 ff		 eor $ff,x
$06:8d53  c5 6f		 cmp $6f
$06:8d55  fa			plx
$06:8d56  7e 95 7f	  ror $7f95,x
$06:8d59  57 b7		 eor [$b7],y
$06:8d5b  dd 7d b6	  cmp $b67d,x
$06:8d5e  7f 6b 14 3f   adc $3f146b,x
$06:8d62  40			rti
$06:8d63  2f 50 14 6b   and $6b1450
$06:8d67  0e 11 22	  asl $2211
$06:8d6a  1d 28 57	  ora $5728,x
$06:8d6d  5b			tcd
$06:8d6e  24 a4		 bit $a4
$06:8d70  ef 13 ba da   sbc $daba13
$06:8d74  ff a0 f5 be   sbc $bef5a0,x
$06:8d78  ff 46 6f 35   sbc $356f46,x
$06:8d7c  be 68 fb	  ldx $fb68,y
$06:8d7f  ef 10 b8 46   sbc $46b810
$06:8d83  7c 82 75	  jmp ($7582,x)
$06:8d86  8a			txa
$06:8d87  eb			xba
$06:8d88  14 6b		 trb $6b
$06:8d8a  94 9e		 sty $9e,x
$06:8d8c  60			rts
$06:8d8d  d2 2c		 cmp ($2c)
$06:8d8f  e0 1f 6a	  cpx #$6a1f
$06:8d92  bf 9d 7e ef   lda $ef7e9d,x
$06:8d96  10 d5		 bpl $8d6d
$06:8d98  2b			pld
$06:8d99  aa			tax
$06:8d9a  57 da		 eor [$da],y
$06:8d9c  3d b0 6f	  and $6fb0,x
$06:8d9f  00 00		 brk #$00
$06:8da1  00 00		 brk #$00
$06:8da3  00 00		 brk #$00
$06:8da5  00 00		 brk #$00
$06:8da7  00 00		 brk #$00
$06:8da9  00 00		 brk #$00
$06:8dab  00 00		 brk #$00
$06:8dad  00 00		 brk #$00
$06:8daf  ac d7 b9	  ldy $b9d7
$06:8db2  7e f2 cf	  ror $cff2,x
$06:8db5  07 fe		 ora [$fe]
$06:8db7  aa			tax
$06:8db8  af 55 c6 ea   lda $eac655
$06:8dbc  ef 5d fe 00   sbc $00fe5d
$06:8dc0  00 00		 brk #$00
$06:8dc2  00 c0		 brk #$c0
$06:8dc4  c0 00 00	  cpy #$0000
$06:8dc7  50 00		 bvc $8dc9
$06:8dc9  38			sec
$06:8dca  00 10		 brk #$10
$06:8dcc  00 00		 brk #$00
$06:8dce  00 9b		 brk #$9b
$06:8dd0  ff 6a ff e6   sbc $e6ff6a,x
$06:8dd4  ff b5 ff f5   sbc $f5ffb5,x
$06:8dd8  ff 5a 7f ad   sbc $ad7f5a,x
$06:8ddc  af 6e ff e4   lda $e4ff6e
$06:8de0  1b			tcs
$06:8de1  d5 2a		 cmp $2a,x
$06:8de3  59 a6 6a	  eor $6aa6,y
$06:8de6  95 aa		 sta $aa,x
$06:8de8  55 75		 eor $75,x
$06:8dea  8a			txa
$06:8deb  06 f9		 asl $f9
$06:8ded  d5 2a		 cmp $2a,x
$06:8def  fe 05 ff	  inc $ff05,x
$06:8df2  a9 fe		 lda #$fe
$06:8df4  f7 ff		 sbc [$ff],y
$06:8df6  fd fe ff	  sbc $fffe,x
$06:8df9  ff fc ff fa   sbc $fafffc,x
$06:8dfd  ff 61 04 04   sbc $040461,x
$06:8e01  a9 a9		 lda #$a9
$06:8e03  f6 f6		 inc $f6,x
$06:8e05  fd fd fe	  sbc $fefd,x
$06:8e08  fe fc fc	  inc $fcfc,x
$06:8e0b  fa			plx
$06:8e0c  fa			plx
$06:8e0d  61 61		 adc ($61,x)
$06:8e0f  00 b3		 brk #$b3
$06:8e11  49 37		 eor #$37
$06:8e13  50 8f		 bvc $8da4
$06:8e15  80 3c		 bra $8e53
$06:8e17  04 f9		 tsb $f9
$06:8e19  0b			phd
$06:8e1a  f7 96		 sbc [$96],y
$06:8e1c  ee 82 fe	  inc $fe82
$06:8e1f  dc ee f9	  jml [$f9ee]
$06:8e22  fc f4 fb	  jsr ($fbf4,x)
$06:8e25  cb			wai
$06:8e26  f7 86		 sbc [$86],y
$06:8e28  ff 58 bc b2   sbc $b2bc58,x
$06:8e2c  79 09 30	  adc $3009,y
$06:8e2f  e2 e7		 sep #$e7
$06:8e31  b5 a6		 lda $a6,x
$06:8e33  4a			lsr a
$06:8e34  cf b7 7a 4a   cmp $4a7ab7
$06:8e38  b7 fd		 lda [$fd],y
$06:8e3a  ab			plb
$06:8e3b  f4 5a aa	  pea $aa5a
$06:8e3e  bf 18 00 58   lda $580018,x
$06:8e42  00 30		 brk #$30
$06:8e44  00 00		 brk #$00
$06:8e46  00 00		 brk #$00
$06:8e48  00 a9		 brk #$a9
$06:8e4a  a9 5a		 lda #$5a
$06:8e4c  51 bf		 eor ($bf),y
$06:8e4e  40			rti
$06:8e4f  a9 7f		 lda #$7f
$06:8e51  96 f5		 stx $f5,y
$06:8e53  d7 3b		 cmp [$3b],y
$06:8e55  bd ef b2	  lda $b2ef,x
$06:8e58  da			phx
$06:8e59  5d ff c2	  eor $c2ff,x
$06:8e5c  f7 b8		 sbc [$b8],y
$06:8e5e  fd 01 00	  sbc $0001,x
$06:8e61  89 80		 bit #$80
$06:8e63  12 13		 ora ($13)
$06:8e65  af ac c8 97   lda $97c8ac
$06:8e69  eb			xba
$06:8e6a  14 b7		 trb $b7
$06:8e6c  48			pha
$06:8e6d  ed 12 7e	  sbc $7e12
$06:8e70  ff ef ff bf   sbc $bfffef,x
$06:8e74  ff 00 80 da   sbc $da8000,x
$06:8e78  ff 7f ff 40   sbc $40ff7f,x
$06:8e7c  60			rts
$06:8e7d  10 18		 bpl $8e97
$06:8e7f  81 7e		 sta ($7e,x)
$06:8e81  f7 08		 sbc [$08],y
$06:8e83  df 20 80 7f   cmp $7f8020,x
$06:8e87  25 da		 and $da
$06:8e89  ff 00 60 9f   sbc $9f6000,x
$06:8e8d  18			clc
$06:8e8e  e7 ff		 sbc [$ff]
$06:8e90  bf fe 49 fb   lda $fb49fe,x
$06:8e94  d7 fc		 cmp [$fc],y
$06:8e96  ac ef 53	  ldy $53ef
$06:8e99  ff 9f bf 7f   sbc $7fbf9f,x
$06:8e9d  84 7c		 sty $7c
$06:8e9f  bf bf 48 48   lda $4848bf,x
$06:8ea3  d0 d0		 bne $8e75
$06:8ea5  a3 a0		 lda $a0,s
$06:8ea7  43 43		 eor $43,s
$06:8ea9  9f 9f 3f 3f   sta $3f3f9f,x
$06:8ead  03 00		 ora $00,s
$06:8eaf  92 fd		 sta ($fd)
$06:8eb1  6b			rtl
$06:8eb2  db			stp
$06:8eb3  aa			tax
$06:8eb4  ef a2 d5 be   sbc $bed5a2
$06:8eb8  ff 46 6f 35   sbc $356f46,x
$06:8ebc  bf 69 fb 80   lda $80fb69,x
$06:8ec0  00 45		 brk #$45
$06:8ec2  00 9a		 brk #$9a
$06:8ec4  00 45		 brk #$45
$06:8ec6  88			dey
$06:8ec7  eb			xba
$06:8ec8  14 6b		 trb $6b
$06:8eca  94 9e		 sty $9e,x
$06:8ecc  61 d3		 adc ($d3,x)
$06:8ece  2c e7 ab	  bit $abe7
$06:8ed1  ba			tsx
$06:8ed2  f5 5b		 sbc $5b,x
$06:8ed4  ae 76 db	  ldx $db76
$06:8ed7  11 74		 ora ($74),y
$06:8ed9  db			stp
$06:8eda  fe 25 99	  inc $9925,x
$06:8edd  e6 ff		 inc $ff
$06:8edf  12 83		 ora ($83)
$06:8ee1  00 80		 brk #$80
$06:8ee3  88			dey
$06:8ee4  08			php
$06:8ee5  c2 42		 rep #$42
$06:8ee7  4a			lsr a
$06:8ee8  80 c0		 bra $8eaa
$06:8eea  40			rti
$06:8eeb  80 43		 bra $8f30
$06:8eed  5b			tcd
$06:8eee  a4 d2		 ldy $d2
$06:8ef0  ed aa d8	  sbc $d8aa
$06:8ef3  55 cf		 eor $cf,x
$06:8ef5  b6 bd		 ldx $bd,y
$06:8ef7  5a			phy
$06:8ef8  f7 a6		 sbc [$a6],y
$06:8efa  7f d5 af 69   adc $69afd5,x
$06:8efe  fb			xce
$06:8eff  01 00		 ora ($00,x)
$06:8f01  04 01		 tsb $01
$06:8f03  21 00		 and ($00,x)
$06:8f05  51 10		 eor ($10),y
$06:8f07  13 10		 ora ($10,s),y
$06:8f09  0b			phd
$06:8f0a  04 8e		 tsb $8e
$06:8f0c  81 d3		 sta ($d3,x)
$06:8f0e  2c 8f 5c	  bit $5c8f
$06:8f11  72 b2		 adc ($b2)
$06:8f13  af 65 df 4f   lda $4fdf65
$06:8f17  b5 bf		 lda $bf,x
$06:8f19  eb			xba
$06:8f1a  e7 e7		 sbc [$e7]
$06:8f1c  3d 9a 6e	  and $6e9a,x
$06:8f1f  2c 0d 32	  bit $320d
$06:8f22  3f 25 1a 4f   and $4f1a25,x
$06:8f26  7f b1 f1 d1   adc $d1f1b1,x
$06:8f2a  c1 01		 cmp ($01,x)
$06:8f2c  01 02		 ora ($02,x)
$06:8f2e  03 e2		 ora $e2,s
$06:8f30  e7 b5		 sbc [$b5]
$06:8f32  a6 da		 ldx $da
$06:8f34  df 67 66 ba   cmp $ba6667,x
$06:8f38  13 6d		 ora ($6d,s),y
$06:8f3a  60			rts
$06:8f3b  dc dd d7	  jml [$d7dd]
$06:8f3e  f6 98		 inc $98,x
$06:8f40  80 d8		 bra $8f1a
$06:8f42  80 b8		 bra $8efc
$06:8f44  98			tya
$06:8f45  64 fc		 stz $fc
$06:8f47  12 ee		 ora ($ee)
$06:8f49  60			rts
$06:8f4a  fe fc 5e	  inc $5efc,x
$06:8f4d  8a			txa
$06:8f4e  82 f7 f7	  brl $8748
$06:8f51  dd fc be	  cmp $befc,x
$06:8f54  f0 d7		 beq $8f2d
$06:8f56  c6 be		 dec $be
$06:8f58  90 db		 bcc $8f35
$06:8f5a  82 f6 a0	  brl $3053
$06:8f5d  df 8b f7 6f   cmp $6ff78b,x
$06:8f61  9b			txy
$06:8f62  98			tya
$06:8f63  af a0 f9 40   lda $40f9a0
$06:8f67  ef 80 fd 80   sbc $80fd80
$06:8f6b  df 80 f4 80   cmp $80f480,x
$06:8f6f  fa			plx
$06:8f70  ff dd 1d 77   sbc $771ddd,x
$06:8f74  47 cb		 eor [$cb]
$06:8f76  03 b5		 ora $b5,s
$06:8f78  91 9d		 sta ($9d),y
$06:8f7a  09 75		 ora #$75
$06:8f7c  21 5d		 and ($5d,x)
$06:8f7e  09 ff		 ora #$ff
$06:8f80  f0 ed		 beq $8f6f
$06:8f82  0e bb 02	  asl $02bb
$06:8f85  fd 01 6f	  sbc $6f01,x
$06:8f88  01 f7		 ora ($f7,x)
$06:8f8a  01 df		 ora ($df,x)
$06:8f8c  01 f7		 ora ($f7,x)
$06:8f8e  01 e8		 ora ($e8,x)
$06:8f90  9f 90 38 2f   sta $2f3890,x
$06:8f94  73 ff		 adc ($ff,s),y
$06:8f96  f8			sed
$06:8f97  9f c4 fe 80   sta $80fec4,x
$06:8f9b  df 1f be 24   cmp $24be1f,x
$06:8f9f  9f 68 38 d7   sta $d73868,x
$06:8fa3  73 ac		 adc ($ac,s),y
$06:8fa5  d8			cld
$06:8fa6  ff c4 3f 80   sbc $803fc4,x
$06:8faa  ff 1f e0 24   sbc $24e01f,x
$06:8fae  db			stp
$06:8faf  3e 88 17	  rol $1788,x
$06:8fb2  41 a1		 eor ($a1,x)
$06:8fb4  30 ff		 bmi $8fb5
$06:8fb6  bf 7d 5d 67   lda $675d7d,x
$06:8fba  5f eb e7 86   eor $86e7eb,x
$06:8fbe  99 88 77	  sta $7788,y
$06:8fc1  41 be		 eor ($be,x)
$06:8fc3  30 ef		 bmi $8fb4
$06:8fc5  9f 7f 4d ba   sta $ba4d7f,x
$06:8fc9  5f a4 e7 1b   eor $1be7a4,x
$06:8fcd  99 66 03	  sta $0366,y
$06:8fd0  e7 1b		 sbc [$1b]
$06:8fd2  9f 1b 3c 1c   sta $1c3c1b,x
$06:8fd6  73 30		 adc ($30,s),y
$06:8fd8  6f a0 ff 40   adc $40ffa0
$06:8fdc  ff 40 ff fc   sbc $fcff40,x
$06:8fe0  00 e4		 brk #$e4
$06:8fe2  00 e0		 brk #$e0
$06:8fe4  00 e0		 brk #$e0
$06:8fe6  00 c0		 brk #$c0
$06:8fe8  00 4f		 brk #$4f
$06:8fea  00 9f		 brk #$9f
$06:8fec  00 9f		 brk #$9f
$06:8fee  00 6c		 brk #$6c
$06:8ff0  e7 ee		 sbc [$ee]
$06:8ff2  f9 ed 3c	  sbc $3ced,y
$06:8ff5  ff 0e 3c c6   sbc $c63c0e,x
$06:8ff9  1d e7 0e	  ora $0ee7,x
$06:8ffc  f3 0d		 sbc ($0d,s),y
$06:8ffe  f3 9b		 sbc ($9b,s),y
$06:9000  00 17		 brk #$17
$06:9002  00 13		 brk #$13
$06:9004  00 01		 brk #$01
$06:9006  00 03		 brk #$03
$06:9008  00 82		 brk #$82
$06:900a  00 c1		 brk #$c1
$06:900c  00 c2		 brk #$c2
$06:900e  00 a8		 brk #$a8
$06:9010  e7 ae		 sbc [$ae]
$06:9012  f9 ed 3c	  sbc $3ced,y
$06:9015  ff 0e 3c c6   sbc $c63c0e,x
$06:9019  1d e7 1f	  ora $1fe7,x
$06:901c  e3 1c		 sbc $1c,s
$06:901e  03 5f		 ora $5f,s
$06:9020  00 57		 brk #$57
$06:9022  00 13		 brk #$13
$06:9024  00 01		 brk #$01
$06:9026  00 03		 brk #$03
$06:9028  00 82		 brk #$82
$06:902a  00 c0		 brk #$c0
$06:902c  00 00		 brk #$00
$06:902e  f8			sed
$06:902f  05 e7		 ora $e7
$06:9031  1a			inc a
$06:9032  9f 2b 3c 6c   sta $6c3c2b,x
$06:9036  73 30		 adc ($30,s),y
$06:9038  6f e0 ff 40   adc $40ffe0
$06:903c  ff b2 40 fa   sbc $fa40b2,x
$06:9040  00 e5		 brk #$e5
$06:9042  00 d4		 brk #$d4
$06:9044  00 90		 brk #$90
$06:9046  00 c0		 brk #$c0
$06:9048  00 0f		 brk #$0f
$06:904a  00 1f		 brk #$1f
$06:904c  00 00		 brk #$00
$06:904e  1f 37 88 c8   ora $c88837,x
$06:9052  40			rti
$06:9053  8f ff 88 ff   sta $ff88ff
$06:9057  f8			sed
$06:9058  ff ff c7 cb   sbc $cbc7ff,x
$06:905c  bb			tyx
$06:905d  ed df 77	  sbc $77df
$06:9060  00 37		 brk #$37
$06:9062  00 88		 brk #$88
$06:9064  88			dey
$06:9065  88			dey
$06:9066  88			dey
$06:9067  f8			sed
$06:9068  f8			sed
$06:9069  c7 c7		 cmp [$c7]
$06:906b  85 81		 sta $81
$06:906d  c1 c1		 cmp ($c1,x)
$06:906f  33 88		 and ($88,s),y
$06:9071  ff 77 88 ff   sbc $ff8877,x
$06:9075  88			dey
$06:9076  ff ff f7 ff   sbc $fff7ff,x
$06:907a  c3 7f		 cmp $7f,s
$06:907c  c3 d3		 cmp $d3,s
$06:907e  f7 77		 sbc [$77],y
$06:9080  00 00		 brk #$00
$06:9082  00 88		 brk #$88
$06:9084  88			dey
$06:9085  88			dey
$06:9086  88			dey
$06:9087  f7 f7		 sbc [$f7],y
$06:9089  c3 c3		 cmp $c3,s
$06:908b  c3 43		 cmp $43,s
$06:908d  cb			wai
$06:908e  c3 b5		 cmp $b5,s
$06:9090  f7 6e		 sbc [$6e],y
$06:9092  cf 59 99 3d   cmp $3d9959
$06:9096  b9 df dd	  lda $dddf,y
$06:9099  ef 8f fd 9f   sbc $9ffd8f
$06:909d  6d e7 99	  adc $99e7
$06:90a0  76 0c		 ror $0c,x
$06:90a2  fb			xce
$06:90a3  18			clc
$06:90a4  f7 28		 sbc [$28],y
$06:90a6  ef 9c 6f 0b   sbc $0b6f9c
$06:90aa  fa			plx
$06:90ab  0b			phd
$06:90ac  f5 03		 sbc $03,x
$06:90ae  fd 25 7e	  sbc $7e25,x
$06:90b1  8a			txa
$06:90b2  db			stp
$06:90b3  37 fe		 and [$fe],y
$06:90b5  6b			rtl
$06:90b6  75 aa		 adc $aa,x
$06:90b8  db			stp
$06:90b9  30 af		 bmi $906a
$06:90bb  65 f7		 adc $f7
$06:90bd  98			tya
$06:90be  bf 74 80 c4   lda $c48074,x
$06:90c2  20 90 00	  jsr $0090
$06:90c5  70 80		 bvs $9047
$06:90c7  c4 00		 cpy $00
$06:90c9  a8			tay
$06:90ca  40			rti
$06:90cb  d6 28		 dec $28,x
$06:90cd  ac 50 c7	  ldy $c750
$06:90d0  39 a9 6e	  and $6ea9,y
$06:90d3  ce cf 17	  dec $17cf
$06:90d6  06 ea		 asl $ea
$06:90d8  db			stp
$06:90d9  f9 fe fe	  sbc $fefe,y
$06:90dc  ff 2b 0c 01   sbc $010c2b,x
$06:90e0  01 10		 ora ($10,x)
$06:90e2  00 30		 brk #$30
$06:90e4  00 f8		 brk #$f8
$06:90e6  00 c4		 brk #$c4
$06:90e8  c0 f8 f8	  cpy #$f8f8
$06:90eb  fc fc f0	  jsr ($f0fc,x)
$06:90ee  00 d0		 brk #$d0
$06:90f0  9e e2 bb	  stz $bbe2,x
$06:90f3  d8			cld
$06:90f4  47 bd		 eor [$bd]
$06:90f6  83 da		 sta $da,s
$06:90f8  c2 e5		 rep #$e5
$06:90fa  e5 79		 sbc $79
$06:90fc  79 5f 47	  adc $475f,y
$06:90ff  90 71		 bcc $9172
$06:9101  a4 60		 ldy $60
$06:9103  78			sei
$06:9104  80 fd		 bra $9103
$06:9106  01 be		 ora ($be,x)
$06:9108  83 dd		 sta $dd,s
$06:910a  42 79		 wdm #$79
$06:910c  b6 47		 ldx $47,y
$06:910e  b8			clv
$06:910f  2f fe b2 72   and $72b2fe
$06:9113  ef 25 5f cf   sbc $cf5f25
$06:9117  bf b3 ff eb   lda $ebffb3,x
$06:911b  7f ef ae be   adc $beaeef,x
$06:911f  0c 0d 32	  tsb $320d
$06:9122  3f 25 1a 4f   and $4f1a25,x
$06:9126  7f b3 f3 eb   adc $ebf3b3,x
$06:912a  eb			xba
$06:912b  ef 4b be 43   sbc $43be4b
$06:912f  f9 fe d3	  sbc $d3fe,y
$06:9132  f6 dc		 inc $dc,x
$06:9134  bf 67 66 bb   lda $bb6667,x
$06:9138  13 6d		 ora ($6d,s),y
$06:913a  60			rts
$06:913b  fd fd af	  sbc $affd,x
$06:913e  db			stp
$06:913f  80 80		 bra $90c1
$06:9141  88			dey
$06:9142  80 98		 bra $90dc
$06:9144  98			tya
$06:9145  64 fc		 stz $fc
$06:9147  13 ef		 ora ($ef,s),y
$06:9149  60			rts
$06:914a  fe fd 7f	  inc $7ffd,x
$06:914d  db			stp
$06:914e  8a			txa
$06:914f  04 ff		 tsb $ff
$06:9151  21 9f		 and ($9f,x)
$06:9153  c4 eb		 cpy $eb
$06:9155  80 ff		 bra $9156
$06:9157  50 de		 bvc $9137
$06:9159  89 be d2	  bit #$d2be
$06:915c  fc a3 fc	  jsr ($fca3,x)
$06:915f  80 60		 bra $91c1
$06:9161  61 fc		 adc ($fc,x)
$06:9163  5c 3e 81 1c   jml $1c813e
$06:9167  25 03		 and $03
$06:9169  2b			pld
$06:916a  47 87		 eor [$87]
$06:916c  0f 37 0f 04   ora $040f37
$06:9170  ff 25 bf da   sbc $dabf25,x
$06:9174  fb			xce
$06:9175  90 f7		 bcc $916e
$06:9177  82 0f 73	  brl $0489
$06:917a  07 89		 ora [$89]
$06:917c  73 10		 adc ($10,s),y
$06:917e  e2 a0		 sep #$a0
$06:9180  00 4d		 brk #$4d
$06:9182  00 44		 brk #$44
$06:9184  00 91		 brk #$91
$06:9186  08			php
$06:9187  f6 f8		 inc $f8,x
$06:9189  f8			sed
$06:918a  fc fd fe	  jsr ($fefd,x)
$06:918d  9d fe 7f	  sta $7ffe,x
$06:9190  88			dey
$06:9191  7e c0 35	  ror $35c0,x
$06:9194  7d db 18	  adc $18db,x
$06:9197  df 10 08 38   cmp $380810,x
$06:919b  6b			rtl
$06:919c  67 fc		 adc [$fc]
$06:919e  99 88 77	  sta $7788,y
$06:91a1  c0 7f 6d	  cpy #$6d7f
$06:91a4  b2 18		 lda ($18)
$06:91a6  f7 10		 sbc [$10],y
$06:91a8  ff 38 cf 66   sbc $66cf38,x
$06:91ac  9b			txy
$06:91ad  99 6e f8	  sta $f86e,y
$06:91b0  9f f6 9f f7   sta $f79ff6,x
$06:91b4  38			sec
$06:91b5  bf 22 4e 42   lda $424e22,x
$06:91b9  33 91		 and ($91,s),y
$06:91bb  7b			tdc
$06:91bc  39 5f 47	  and $475f,y
$06:91bf  9f 68 8d 76   sta $768d68,x
$06:91c3  38			sec
$06:91c4  d7 22		 cmp [$22],y
$06:91c6  fd 02 fd	  sbc $fd02,x
$06:91c9  91 6e		 sta ($6e),y
$06:91cb  39 c6 47	  and $47c6,y
$06:91ce  b8			clv
$06:91cf  68			pla
$06:91d0  e7 ee		 sbc [$ee]
$06:91d2  f9 ed 3c	  sbc $3ced,y
$06:91d5  ff 0e 3c c6   sbc $c63c0e,x
$06:91d9  1d e7 0e	  ora $0ee7,x
$06:91dc  f3 0d		 sbc ($0d,s),y
$06:91de  f3 9f		 sbc ($9f,s),y
$06:91e0  00 17		 brk #$17
$06:91e2  00 13		 brk #$13
$06:91e4  00 01		 brk #$01
$06:91e6  00 03		 brk #$03
$06:91e8  00 82		 brk #$82
$06:91ea  00 c1		 brk #$c1
$06:91ec  00 c2		 brk #$c2
$06:91ee  00 03		 brk #$03
$06:91f0  e7 1b		 sbc [$1b]
$06:91f2  9f 1b 3c 1c   sta $1c3c1b,x
$06:91f6  73 30		 adc ($30,s),y
$06:91f8  6f a0 ff 40   adc $40ffa0
$06:91fc  ff 40 ff fc   sbc $fcff40,x
$06:9200  00 e4		 brk #$e4
$06:9202  00 e0		 brk #$e0
$06:9204  00 e0		 brk #$e0
$06:9206  00 c0		 brk #$c0
$06:9208  00 4f		 brk #$4f
$06:920a  00 9f		 brk #$9f
$06:920c  00 9f		 brk #$9f
$06:920e  00 ff		 brk #$ff
$06:9210  ff 7e 00 ff   sbc $ff007e,x
$06:9214  00 ad		 brk #$ad
$06:9216  08			php
$06:9217  db			stp
$06:9218  42 5a		 wdm #$5a
$06:921a  5a			phy
$06:921b  ff ff 88 88   sbc $8888ff,x
$06:921f  ff 00 00 ff   sbc $ff0000,x
$06:9223  00 ff		 brk #$ff
$06:9225  08			php
$06:9226  f7 42		 sbc [$42],y
$06:9228  bd 5a a5	  lda $a55a,x
$06:922b  a5 5a		 lda $5a
$06:922d  77 ff		 adc [$ff],y
$06:922f  d5 c1		 cmp $c1,x
$06:9231  ee cc fb	  inc $fbcc
$06:9234  d6 fe		 dec $fe,x
$06:9236  d2 dd		 cmp ($dd)
$06:9238  cc ee e0	  cpy $e0ee
$06:923b  bf bf 80 80   lda $8080bf,x
$06:923f  41 be		 eor ($be,x)
$06:9241  4c b3 5e	  jmp $5eb3
$06:9244  a1 5e		 lda ($5e,x)
$06:9246  a1 4c		 lda ($4c,x)
$06:9248  b3 a0		 lda ($a0,s),y
$06:924a  df 5f e0 ff   cmp $ffe05f,x
$06:924e  ff 7f ff 6d   sbc $6dff7f,x
$06:9252  df 73 d3 7f   cmp $7fd373,x
$06:9256  df 73 cd ed   cmp $edcd73,x
$06:925a  df 3f ff a0   cmp $a0ff3f,x
$06:925e  ff ff 7f c1   sbc $c17fff,x
$06:9262  41 cd		 eor ($cd,x)
$06:9264  41 c1		 eor ($c1,x)
$06:9266  41 c1		 eor ($c1,x)
$06:9268  41 c1		 eor ($c1,x)
$06:926a  41 ff		 eor ($ff,x)
$06:926c  3f ff 00 67   and $6700ff,x
$06:9270  db			stp
$06:9271  d2 f7		 cmp ($f7)
$06:9273  da			phx
$06:9274  ff 6f db a5   sbc $a5db6f,x
$06:9278  db			stp
$06:9279  7e e7 d3	  ror $d3e7,x
$06:927c  d3 52		 cmp ($52,s),y
$06:927e  ff c3 43 cb   sbc $cb43c3,x
$06:9282  c2 c3		 rep #$c3
$06:9284  c2 c3		 rep #$c3
$06:9286  43 81		 eor $81,s
$06:9288  c3 24		 cmp $24,s
$06:928a  e7 ad		 sbc [$ad]
$06:928c  ff d3 7e ff   sbc $ff7ed3,x
$06:9290  ff fe 92 a7   sbc $a792fe,x
$06:9294  b3 c5		 lda ($c5,s),y
$06:9296  f4 af 8e	  pea $8eaf
$06:9299  f7 91		 sbc [$91],y
$06:929b  bf b9 79 f9   lda $f979b9,x
$06:929f  93 6d		 sta ($6d,s),y
$06:92a1  00 ff		 brk #$ff
$06:92a3  23 df		 and $df,s
$06:92a5  84 7f		 sty $7f
$06:92a7  0e fd 11	  asl $11fd
$06:92aa  ff 39 d7 89   sbc $89d739,x
$06:92ae  7f bc bd 7e   adc $7ebdbc,x
$06:92b2  72 ce		 adc ($ce)
$06:92b4  e2 d3		 sep #$d3
$06:92b6  f3 cd		 sbc ($cd,s),y
$06:92b8  ef 3b f3 ff   sbc $fff33b
$06:92bc  ff fe fe bd   sbc $bdfefe,x
$06:92c0  5e 6e bf	  lsr $bf6e,x
$06:92c3  de 7f 8f	  dec $8f7f,x
$06:92c6  ff 91 ff 8d   sbc $8dff91,x
$06:92ca  7f c3 7e fe   adc $fe7ec3,x
$06:92ce  3d ff 1f	  and $1fff,x
$06:92d1  f2 31		 sbc ($31)
$06:92d3  54 53 c7	  mvn $c7,$53
$06:92d6  d3 ff		 cmp ($ff,s),y
$06:92d8  ee aa ae	  inc $aeaa
$06:92db  d6 b3		 dec $b3,x
$06:92dd  eb			xba
$06:92de  ba			tsx
$06:92df  ff 1f ef 3f   sbc $3fef1f,x
$06:92e3  f3 7c		 sbc ($7c,s),y
$06:92e5  f1 af		 sbc ($af),y
$06:92e7  9d cc d5	  sta $d5cc,x
$06:92ea  c8			iny
$06:92eb  f3 de		 sbc ($de,s),y
$06:92ed  fa			plx
$06:92ee  e5 ff		 sbc $ff
$06:92f0  f8			sed
$06:92f1  9d 6c 4f	  sta $4f6c,x
$06:92f4  26 6b		 rol $6b
$06:92f6  ff b9 93 4d   sbc $4d93b9,x
$06:92fa  df 7d 3f d5   cmp $d53f7d,x
$06:92fe  cf ff f8 f7   cmp $f7f8ff
$06:9302  fc 3b de	  jsr ($de3b,x)
$06:9305  f7 2d		 sbc [$2d],y
$06:9307  8f e7 c3 27   sta $27c3e7
$06:930b  3b			tsc
$06:930c  df fb 07 2a   cmp $2a07fb,x
$06:9310  ef 92 da a0   sbc $a0da92
$06:9314  ec 7e 7e	  cpx $7e7e
$06:9317  bd db 56	  lda $56db,x
$06:931a  eb			xba
$06:931b  97 ff		 sta [$ff],y
$06:931d  51 ae		 eor ($ae),y
$06:931f  ef 10 da 25   sbc $25da10
$06:9323  ec 13 5a	  cpx $5a13
$06:9326  ad cb 18	  lda $18cb
$06:9329  81 42		 sta ($42,x)
$06:932b  92 13		 sta ($13)
$06:932d  80 00		 bra $932f
$06:932f  b5 ff		 lda $ff,x
$06:9331  48			pha
$06:9332  da			phx
$06:9333  87 c7		 sta [$c7]
$06:9335  ec ed d2	  cpx $d2ed
$06:9338  fb			xce
$06:9339  bd 7f 2a	  lda $2a7f,x
$06:933c  ff 7e bf ef   sbc $efbf7e,x
$06:9340  10 9a		 bpl $92dc
$06:9342  65 c5		 adc $c5
$06:9344  3a			dec a
$06:9345  ad 52 bb	  lda $bb52
$06:9348  c4 56		 cpy $56
$06:934a  29 1d		 and #$1d
$06:934c  2a			rol a
$06:934d  2b			pld
$06:934e  3e a7 ff	  rol $ffa7,x
$06:9351  9e fe 57	  stz $57fe,x
$06:9354  f0 ea		 beq $9340
$06:9356  f8			sed
$06:9357  b5 fa		 lda $fa,x
$06:9359  69 f9		 adc #$f9
$06:935b  72 ff		 adc ($ff)
$06:935d  b1 ff		 lda ($ff),y
$06:935f  ff 07 e9 1f   sbc $1fe907,x
$06:9363  bf 5f 47 bf   lda $bf475f,x
$06:9367  57 bf		 eor [$bf],y
$06:9369  86 7f		 stx $7f
$06:936b  90 7f		 bcc $93ec
$06:936d  50 bf		 bvc $932e
$06:936f  ea			nop
$06:9370  ff 18 3e e7   sbc $e73e18,x
$06:9374  1f b8 5b 4e   ora $4e5bb8,x
$06:9378  9f 65 77 aa   sta $aa7765,x
$06:937c  f6 5b		 inc $5b,x
$06:937e  f7 ff		 sbc [$ff],y
$06:9380  e0 d6		 cpx #$d6
$06:9382  f9 ed f2	  sbc $f2ed,y
$06:9385  eb			xba
$06:9386  fc e7 fc	  jsr ($fce7,x)
$06:9389  8f fc 0a ff   sta $ff0afc
$06:938d  0b			phd
$06:938e  fe cf 00	  inc $00cf,x
$06:9391  0a			asl a
$06:9392  86 18		 stx $18
$06:9394  3f 18 77 30   and $307718,x
$06:9398  6f a0 ff 60   adc $60ffa0
$06:939c  df 40 ff 38   cmp $38ff40,x
$06:93a0  00 79		 brk #$79
$06:93a2  00 e3		 brk #$e3
$06:93a4  00 e7		 brk #$e7
$06:93a6  00 c7		 brk #$c7
$06:93a8  00 4f		 brk #$4f
$06:93aa  00 9f		 brk #$9f
$06:93ac  00 9f		 brk #$9f
$06:93ae  00 eb		 brk #$eb
$06:93b0  00 4e		 brk #$4e
$06:93b2  61 ad		 adc ($ad,x)
$06:93b4  dc 3f ce	  jml [$ce3f]
$06:93b7  1c e6 1d	  trb $1de6
$06:93ba  e7 0e		 sbc [$0e]
$06:93bc  f3 0d		 sbc ($0d,s),y
$06:93be  f3 1c		 sbc ($1c,s),y
$06:93c0  00 9e		 brk #$9e
$06:93c2  00 13		 brk #$13
$06:93c4  00 01		 brk #$01
$06:93c6  00 03		 brk #$03
$06:93c8  00 82		 brk #$82
$06:93ca  00 c1		 brk #$c1
$06:93cc  00 c2		 brk #$c2
$06:93ce  00 39		 brk #$39
$06:93d0  c6 49		 dec $49
$06:93d2  36 bd		 rol $bd,x
$06:93d4  82 44 0b	  brl $9f1b
$06:93d7  d4 d3		 pei ($d3)
$06:93d9  a8			tay
$06:93da  87 74		 sta [$74]
$06:93dc  73 c8		 adc ($c8,s),y
$06:93de  c9 c6		 cmp #$c6
$06:93e0  00 06		 brk #$06
$06:93e2  c0 82		 cpy #$82
$06:93e4  70 03		 bvs $93e9
$06:93e6  f0 d3		 beq $93bb
$06:93e8  28			plp
$06:93e9  83 78		 sta $78,s
$06:93eb  71 8c		 adc ($8c),y
$06:93ed  c8			iny
$06:93ee  36 10		 rol $10,x
$06:93f0  ef 13 6c 53   sbc $536c13
$06:93f4  2c d7 c8	  bit $c8d7
$06:93f7  23 0c		 and $0c,s
$06:93f9  db			stp
$06:93fa  d8			cld
$06:93fb  35 30		 and $30,x
$06:93fd  cd 0c 6c	  cmp $6c0c
$06:9400  00 6c		 brk #$6c
$06:9402  80 0c		 bra $9410
$06:9404  c0 c8		 cpy #$c8
$06:9406  30 00		 bmi $9408
$06:9408  f0 d8		 beq $93e2
$06:940a  24 30		 bit $30
$06:940c  ce 0c f3	  dec $f30c
$06:940f  00 ff		 brk #$ff
$06:9411  08			php
$06:9412  ff 46 ff 5c   sbc $5cff46,x
$06:9416  dc 32 03	  jml [$0332]
$06:9419  92 9e		 sta ($9e)
$06:941b  63 63		 adc $63,s
$06:941d  88			dey
$06:941e  f8			sed
$06:941f  00 00		 brk #$00
$06:9421  90 00		 bcc $9423
$06:9423  29 00		 and #$00
$06:9425  a3 00		 lda $00,s
$06:9427  fd 00 6d	  sbc $6d00,x
$06:942a  00 9c		 brk #$9c
$06:942c  00 77		 brk #$77
$06:942e  00 39		 brk #$39
$06:9430  c6 b9		 dec $b9
$06:9432  c6 79		 dec $79
$06:9434  86 1c		 stx $1c
$06:9436  e3 1d		 sbc $1d,s
$06:9438  e3 1d		 sbc $1d,s
$06:943a  e3 08		 sbc $08,s
$06:943c  f7 4c		 sbc [$4c],y
$06:943e  f7 c6		 sbc [$c6],y
$06:9440  00 46		 brk #$46
$06:9442  00 86		 brk #$86
$06:9444  00 83		 brk #$83
$06:9446  00 82		 brk #$82
$06:9448  00 82		 brk #$82
$06:944a  00 c7		 brk #$c7
$06:944c  00 83		 brk #$83
$06:944e  00 2d		 brk #$2d
$06:9450  f7 d7		 sbc [$d7],y
$06:9452  3e f7 1e	  rol $1ef7,x
$06:9455  8f 7c 07 fc   sta $fc077c
$06:9459  0f fc 15 fe   ora $fe15fc
$06:945d  3b			tsc
$06:945e  f6 12		 inc $12,x
$06:9460  00 20		 brk #$20
$06:9462  00 08		 brk #$08
$06:9464  00 10		 brk #$10
$06:9466  00 18		 brk #$18
$06:9468  00 10		 brk #$10
$06:946a  00 2a		 brk #$2a
$06:946c  00 04		 brk #$04
$06:946e  00 bf		 brk #$bf
$06:9470  63 92		 adc $92,s
$06:9472  6e b1 4d	  ror $4db1
$06:9475  ae d0 93	  ldx $93d0
$06:9478  e3 9a		 sbc $9a,s
$06:947a  d8			cld
$06:947b  b7 c7		 lda [$c7],y
$06:947d  5d 9d 40	  eor $409d,x
$06:9480  00 60		 brk #$60
$06:9482  01 41		 ora ($41,x)
$06:9484  02 40		 cop #$40
$06:9486  0f 43 1c 58   ora $581c43
$06:948a  27 07		 and [$07]
$06:948c  38			sec
$06:948d  1d 62 5a	  ora $5a62,x
$06:9490  ff bd f7 f5   sbc $f5f7bd,x
$06:9494  c7 ba		 cmp [$ba]
$06:9496  8b			phb
$06:9497  97 9f		 sta [$9f],y
$06:9499  6a			ror a
$06:949a  ff ab ff 7a   sbc $7affab,x
$06:949e  ff bd 5a fe   sbc $fe5abd,x
$06:94a2  15 8e		 ora $8e,x
$06:94a4  75 0f		 adc $0f,x
$06:94a6  fa			plx
$06:94a7  0d f5 96	  ora $96f5
$06:94aa  6a			ror a
$06:94ab  d5 2b		 cmp $2b,x
$06:94ad  9d 7a ff	  sta $ff7a,x
$06:94b0  ff f6 76 75   sbc $7576f6,x
$06:94b4  71 cf		 adc ($cf),y
$06:94b6  c9 ee		 cmp #$ee
$06:94b8  8f fa 9f e0   sta $e09ffa
$06:94bc  f5 a9		 sbc $a9,x
$06:94be  fd ff 98	  sbc $98ff,x
$06:94c1  76 ef		 ror $ef,x
$06:94c3  71 ff		 adc ($ff),y
$06:94c5  81 ff		 sta ($ff,x)
$06:94c7  01 fe		 ora ($fe,x)
$06:94c9  0f f0 15 ea   ora $ea15f0
$06:94cd  fd 82 fa	  sbc $fa82,x
$06:94d0  be ad a7	  ldx $a7ad,y
$06:94d3  f1 f4		 sbc ($f4),y
$06:94d5  a6 de		 ldx $de
$06:94d7  b4 eb		 ldy $eb,x
$06:94d9  73 73		 adc ($73,s),y
$06:94db  ef 7f 9f 1f   sbc $1f9f7f
$06:94df  de f9 ff	  dec $fff9,x
$06:94e2  e4 af		 cpx $af
$06:94e4  e0 fd		 cpx #$fd
$06:94e6  a4 df		 ldy $df
$06:94e8  bc cc 7f	  ldy $7fcc,x
$06:94eb  b0 2f		 bcs $951c
$06:94ed  ff 1f 6f ed   sbc $ed6f1f,x
$06:94f1  af 9d 15 9d   lda $9d159d
$06:94f5  a3 f7		 lda $f7,s
$06:94f7  c9 33		 cmp #$33
$06:94f9  0e 0e f7	  asl $f70e
$06:94fc  fc ff f8	  jsr ($f8ff,x)
$06:94ff  db			stp
$06:9500  4f 9b e7 9b   eor $9be79b
$06:9504  77 fd		 adc [$fd],y
$06:9506  af ff fd f3   lda $f3fdff
$06:950a  fe 0f f4	  inc $f40f,x
$06:950d  ff f8 2b d5   sbc $d52bf8,x
$06:9511  dd a3 d6	  cmp $d6a3,x
$06:9514  f9 2b 56	  sbc $562b,y
$06:9517  7d 66 7f	  adc $7f66,x
$06:951a  75 bf		 adc $bf,x
$06:951c  da			phx
$06:951d  ff ff 81 01   sbc $0181ff,x
$06:9521  80 00		 bra $9523
$06:9523  80 40		 bra $9565
$06:9525  42 82		 wdm #$82
$06:9527  44 a4 75	  mvp $75,$a4
$06:952a  b5 da		 lda $da,x
$06:952c  1a			inc a
$06:952d  bf 7f bf 5f   lda $5fbf7f,x
$06:9531  ff 2f be 5e   sbc $5ebe2f,x
$06:9535  ff bf fe ff   sbc $fffebf,x
$06:9539  ff 7f fc fe   sbc $fefc7f,x
$06:953d  fa			plx
$06:953e  ff 1f 1f 2f   sbc $2f1f1f,x
$06:9542  2e 1e 1f	  rol $1f1e
$06:9545  bf be ff fe   lda $feffbe,x
$06:9549  7f 7e fe fd   adc $fdfe7e,x
$06:954d  ff f8 a6 f3   sbc $f3a6f8,x
$06:9551  68			pla
$06:9552  fa			plx
$06:9553  76 f6		 ror $f6,x
$06:9555  6a			ror a
$06:9556  ff 72 7f aa   sbc $aa7f72,x
$06:955a  ff 1d bf e6   sbc $e6bf1d,x
$06:955e  ff 6c bf a5   sbc $a5bf6c,x
$06:9562  7f fb 7f e2   adc $e27ffb,x
$06:9566  7f 72 ff ea   adc $eaff72,x
$06:956a  3f bf 5d 5b   and $5b5dbf,x
$06:956e  a4 2e		 ldy $2e
$06:9570  2f c2 13 8b   and $8b13c2
$06:9574  57 33		 eor [$33],y
$06:9576  33 bf		 and ($bf,s),y
$06:9578  bf b7 3f 36   lda $363fb7,x
$06:957c  3e eb ff	  rol $ffeb,x
$06:957f  d3 fe		 cmp ($fe,s),y
$06:9581  ef fe ed ff   sbc $ffedfe
$06:9585  dd ff 51	  cmp $51ff,x
$06:9588  ff d3 fe d6   sbc $d6fed3,x
$06:958c  ff fd e2 df   sbc $dfe2fd,x
$06:9590  ff fd fd bf   sbc $bffdfd,x
$06:9594  f3 d7		 sbc ($d7,s),y
$06:9596  c4 bb		 cpy $bb
$06:9598  98			tya
$06:9599  d9 09 ff	  cmp $ff09,y
$06:959c  a7 fb		 lda [$fb]
$06:959e  bb			tyx
$06:959f  df 57 bb b9   cmp $b9bb57,x
$06:95a3  ad a3 f8	  lda $f8a3
$06:95a6  c7 e0		 cmp [$e0]
$06:95a8  8f 70 0f d8   sta $d80f70
$06:95ac  86 fd		 stx $fd
$06:95ae  ba			tsx
$06:95af  7b			tdc
$06:95b0  78			sei
$06:95b1  5d 5c f7	  eor $f75c,x
$06:95b4  c7 4b		 cmp [$4b]
$06:95b6  c3 b5		 cmp $b5,s
$06:95b8  91 9d		 sta ($9d),y
$06:95ba  89 f5		 bit #$f5
$06:95bc  e1 fd		 sbc ($fd,x)
$06:95be  29 e8		 and #$e8
$06:95c0  77 e0		 adc [$e0],y
$06:95c2  4f 79 42 7d   eor $7d4279
$06:95c6  41 ef		 eor ($ef,x)
$06:95c8  81 f7		 sta ($f7,x)
$06:95ca  81 1f		 sta ($1f,x)
$06:95cc  c1 17		 cmp ($17,x)
$06:95ce  e1 00		 sbc ($00,x)
$06:95d0  ff c4 7f aa   sbc $aa7fc4,x
$06:95d4  4b			phk
$06:95d5  cc 21 d0	  cpy $d021
$06:95d8  31 c6		 and ($c6),y
$06:95da  3d 82 7f	  and $7f82,x
$06:95dd  90 6f		 bcc $964e
$06:95df  00 00		 brk #$00
$06:95e1  28			plp
$06:95e2  00 75		 brk #$75
$06:95e4  00 3e		 brk #$3e
$06:95e6  00 2f		 brk #$2f
$06:95e8  00 3a		 brk #$3a
$06:95ea  00 7c		 brk #$7c
$06:95ec  00 6d		 brk #$6d
$06:95ee  00 01		 brk #$01
$06:95f0  fe 80 ff	  inc $ff80,x
$06:95f3  4a			lsr a
$06:95f4  df 04 e5 12   cmp $12e504,x
$06:95f8  e3 18		 sbc $18,s
$06:95fa  e1 0a		 sbc ($0a,x)
$06:95fc  f7 08		 sbc [$08],y
$06:95fe  f7 00		 sbc [$00],y
$06:9600  00 52		 brk #$52
$06:9602  00 b4		 brk #$b4
$06:9604  00 9b		 brk #$9b
$06:9606  00 8c		 brk #$8c
$06:9608  00 86		 brk #$86
$06:960a  00 c5		 brk #$c5
$06:960c  00 c6		 brk #$c6
$06:960e  00 2d		 brk #$2d
$06:9610  27 ff		 and [$ff]
$06:9612  ef 9b 9f f7   sbc $f79f9b
$06:9616  cf f7 cf fd   cmp $fdcff7
$06:961a  f5 fd		 sbc $fd,x
$06:961c  f5 ff		 sbc $ff,x
$06:961e  6f 27 fd eb   adc $ebfd27
$06:9622  7a			ply
$06:9623  93 f2		 sta ($f2,s),y
$06:9625  c7 b4		 cmp [$b4]
$06:9627  c7 f6		 cmp [$f6]
$06:9629  f5 b7		 sbc $b7,x
$06:962b  f5 97		 sbc $97,x
$06:962d  ef 6b 54 ef   sbc $ef546b
$06:9631  83 7c		 sta $7c,s
$06:9633  a7 78		 lda [$78]
$06:9635  e1 3e		 sbc ($3e,x)
$06:9637  c1 3e		 cmp ($3e,x)
$06:9639  c1 3e		 cmp ($3e,x)
$06:963b  88			dey
$06:963c  7f d8 6f a8   adc $a86fd8,x
$06:9640  00 6c		 brk #$6c
$06:9642  00 58		 brk #$58
$06:9644  00 18		 brk #$18
$06:9646  00 38		 brk #$38
$06:9648  00 38		 brk #$38
$06:964a  00 74		 brk #$74
$06:964c  00 24		 brk #$24
$06:964e  00 bf		 brk #$bf
$06:9650  63 fd		 adc $fd,s
$06:9652  63 ff		 adc $ff,s
$06:9654  61 78		 adc ($78,x)
$06:9656  c7 f8		 cmp [$f8]
$06:9658  c7 b9		 cmp [$b9]
$06:965a  c7 b1		 cmp [$b1]
$06:965c  ef 52 ef 40   sbc $40ef52
$06:9660  00 02		 brk #$02
$06:9662  00 00		 brk #$00
$06:9664  00 81		 brk #$81
$06:9666  00 01		 brk #$01
$06:9668  00 40		 brk #$40
$06:966a  00 42		 brk #$42
$06:966c  00 a1		 brk #$a1
$06:966e  00 3e		 brk #$3e
$06:9670  f7 dc		 sbc [$dc],y
$06:9672  36 eb		 rol $eb,x
$06:9674  34 f4		 bit $f4,x
$06:9676  18			clc
$06:9677  c7 37		 cmp [$37]
$06:9679  eb			xba
$06:967a  03 b6		 ora $b6,s
$06:967c  30 59		 bmi $96d7
$06:967e  19 00 00	  ora $0000,y
$06:9681  22 01 10 03   jsl $031001
$06:9685  00 07		 brk #$07
$06:9687  07 08		 ora [$08]
$06:9689  03 3c		 ora $3c,s
$06:968b  30 4f		 bmi $96dc
$06:968d  19 e6 3d	  ora $3de6,y
$06:9690  f7 f5		 sbc [$f5],y
$06:9692  c7 be		 cmp [$be]
$06:9694  8f be bf ef   sta $efbfbe
$06:9698  ff 37 f0 53   sbc $53f037,x
$06:969c  f3 2d		 sbc ($2d,s),y
$06:969e  bf ce 35 8e   lda $8e35ce,x
$06:96a2  75 0b		 adc $0b,x
$06:96a4  fa			plx
$06:96a5  2b			pld
$06:96a6  da			phx
$06:96a7  9d 6d c0	  sta $c06d,x
$06:96aa  3e e1 1f	  rol $1fe1,x
$06:96ad  92 6d		 sta ($6d)
$06:96af  ef ff d2 f6   sbc $f6d2ff
$06:96b3  7d ff 57	  adc $57ff,x
$06:96b6  ff 18 fb 0b   sbc $0bfb18,x
$06:96ba  bf 64 f6 ae   lda $aef664,x
$06:96be  ff e7 66 ca   sbc $ca66e7,x
$06:96c2  43 ff		 eor $ff,s
$06:96c4  3c fd 02	  bit $02fd,x
$06:96c7  f3 0c		 sbc ($0c,s),y
$06:96c9  be 41 d2	  ldx $d241,y
$06:96cc  2d db 24	  and $24db
$06:96cf  00 ff		 brk #$ff
$06:96d1  01 fe		 ora ($fe,x)
$06:96d3  b1 fe		 lda ($fe),y
$06:96d5  5f 44 8f 0c   eor $0c8f44,x
$06:96d9  7f 1c 3f 3e   adc $3e3f1c,x
$06:96dd  ff 76 00 00   sbc $000076,x
$06:96e1  92 00		 sta ($00)
$06:96e3  4c 00 b8	  jmp $b800
$06:96e6  00 f0		 brk #$f0
$06:96e8  00 e0		 brk #$e0
$06:96ea  00 c0		 brk #$c0
$06:96ec  00 80		 brk #$80
$06:96ee  00 00		 brk #$00
$06:96f0  ff 01 ff 03   sbc $03ff01,x
$06:96f4  fd 69 0f	  sbc $0f69,x
$06:96f7  59 d7 d9	  eor $d9d7,y
$06:96fa  07 b3		 ora [$b3]
$06:96fc  2f 13 6f 00   and $006f13
$06:9700  00 90		 brk #$90
$06:9702  00 e8		 brk #$e8
$06:9704  00 f0		 brk #$f0
$06:9706  00 a0		 brk #$a0
$06:9708  00 e0		 brk #$e0
$06:970a  00 c0		 brk #$c0
$06:970c  00 e0		 brk #$e0
$06:970e  00 cd		 brk #$cd
$06:9710  ff 92 d2 e1   sbc $e1d292,x
$06:9714  e1 ab		 sbc ($ab,x)
$06:9716  ff ff ff a6   sbc $a6ffff,x
$06:971a  67 ff		 adc [$ff]
$06:971c  60			rts
$06:971d  ff 00 80 80   sbc $808000,x
$06:9721  ad 80 9e	  lda $9e80
$06:9724  80 80		 bra $96a6
$06:9726  80 ff		 bra $9727
$06:9728  ff 18 00 00   sbc $000018,x
$06:972c  00 00		 brk #$00
$06:972e  00 cd		 brk #$cd
$06:9730  c7 a7		 cmp [$a7]
$06:9732  e3 9d		 sbc $9d,s
$06:9734  df cf ed ef   cmp $efedcf,x
$06:9738  bd bd e7	  lda $e7bd,x
$06:973b  ff d5 ff d3   sbc $d3ffd5,x
$06:973f  c5 fd		 cmp $fd
$06:9741  a1 bd		 lda ($bd,x)
$06:9743  bd 91 dd	  lda $dd91,x
$06:9746  cd a5 a5	  cmp $a5a5
$06:9749  25 25		 and $25
$06:974b  d5 d5		 cmp $d5,x
$06:974d  d3 d3		 cmp ($d3,s),y
$06:974f  11 6f		 ora ($6f),y
$06:9751  42 82		 wdm #$82
$06:9753  25 84		 and $84
$06:9755  9d 1c af	  sta $af1c,x
$06:9758  2f 73 b4 a2   and $a2b473
$06:975c  2d 31 af	  and $af31
$06:975f  80 81		 bra $96e2
$06:9761  7d 7e 7b	  adc $7b7e,x
$06:9764  7c 63 64	  jmp ($6463,x)
$06:9767  50 4e		 bvc $97b7
$06:9769  40			rti
$06:976a  59 40 70	  eor $7040,y
$06:976d  40			rti
$06:976e  79 88 f6	  adc $f688,y
$06:9771  7c 41 33	  jmp ($3341,x)
$06:9774  a0 bf		 ldy #$bf
$06:9776  3c 7a 71	  bit $717a,x
$06:9779  ce cd b6	  dec $b6cd
$06:977c  95 a6		 sta $a6,x
$06:977e  95 01		 sta $01,x
$06:9780  81 be		 sta ($be,x)
$06:9782  7e de 3e	  ror $3ede,x
$06:9785  c2 22		 rep #$22
$06:9787  8e 72 42	  stx $4272
$06:978a  ba			tsx
$06:978b  02 fe		 cop #$fe
$06:978d  82 7e 80	  brl $180e
$06:9790  ff 3f 80 c1   sbc $c1803f,x
$06:9794  bf 56 bf 68   lda $68bf56,x
$06:9798  97 0e		 sta [$0e],y
$06:979a  b8			clv
$06:979b  31 83		 and ($83),y
$06:979d  58			cli
$06:979e  8b			phb
$06:979f  00 00		 brk #$00
$06:97a1  7f 00 40 00   adc $004000,x
$06:97a5  40			rti
$06:97a6  00 40		 brk #$40
$06:97a8  00 54		 brk #$54
$06:97aa  3f 40 3f 56   and $563f40,x
$06:97ae  3f 00 ff fc   and $fcff00,x
$06:97b2  01 ca		 ora ($ca,x)
$06:97b4  fd 3e fd	  sbc $fd3e,x
$06:97b7  ca			dex
$06:97b8  35 e2		 and $e2,x
$06:97ba  2d b2 c1	  and $c1b2
$06:97bd  ce 05 00	  dec $0005
$06:97c0  00 fe		 brk #$fe
$06:97c2  00 02		 brk #$02
$06:97c4  00 02		 brk #$02
$06:97c6  00 02		 brk #$02
$06:97c8  00 5a		 brk #$5a
$06:97ca  fc 02 fc	  jsr ($fc02,x)
$06:97cd  0a			asl a
$06:97ce  fc 93 fc	  jsr ($fc93,x)
$06:97d1  7d f4 f5	  adc $f5f4,x
$06:97d4  e1 ab		 sbc ($ab,x)
$06:97d6  c0 75		 cpy #$75
$06:97d8  c1 7f		 cmp ($7f,x)
$06:97da  ca			dex
$06:97db  ba			tsx
$06:97dc  c8			iny
$06:97dd  aa			tax
$06:97de  c2 fc		 rep #$fc
$06:97e0  00 d3		 brk #$d3
$06:97e2  20 4e a0	  jsr $a04e
$06:97e5  5f 80 9e 40   eor $409e80,x
$06:97e9  95 40		 sta $40,x
$06:97eb  57 80		 eor [$80],y
$06:97ed  5d 80 e9	  eor $e980,x
$06:97f0  1f e8 05 be   ora $be05e8,x
$06:97f4  a3 fa		 lda $fa,s
$06:97f6  11 9f		 ora ($9f),y
$06:97f8  89 df 49	  bit #$49df
$06:97fb  26 01		 rol $01
$06:97fd  ab			plb
$06:97fe  a0 1f 00	  ldy #$001f
$06:9801  f5 02		 sbc $02,x
$06:9803  5b			tcd
$06:9804  00 ed		 brk #$ed
$06:9806  00 75		 brk #$75
$06:9808  00 b5		 brk #$b5
$06:980a  00 fd		 brk #$fd
$06:980c  00 5c		 brk #$5c
$06:980e  00 de		 brk #$de
$06:9810  30 37		 bmi $9849
$06:9812  8c 88 c6	  sty $c688
$06:9815  bc 71 c5	  ldy $c571,x
$06:9818  0e 8e 38	  asl $388e
$06:981b  31 c3		 and ($c3),y
$06:981d  58			cli
$06:981e  8b			phb
$06:981f  48			pha
$06:9820  ff 02 ff 03   sbc $03ff02,x
$06:9824  ff e8 ff 00   sbc $00ffe8,x
$06:9828  ff 14 ff 80   sbc $80ff14,x
$06:982c  ff 16 ff d8   sbc $d8ff16,x
$06:9830  06 56		 asl $56
$06:9832  38			sec
$06:9833  6b			rtl
$06:9834  d1 6b		 cmp ($6b),y
$06:9836  06 34		 asl $34
$06:9838  c2 e1		 rep #$e1
$06:983a  2c b2 c1	  bit $c1b2
$06:983d  cc 07 4c	  cpy $4c07
$06:9840  ff 0c ff a2   sbc $a2ff0c,x
$06:9844  ff 4f ff 64   sbc $64ff4f,x
$06:9848  ff 59 ff 03   sbc $03ff59,x
$06:984c  ff 0a ff b6   sbc $b6ff0a,x
$06:9850  12 9a		 ora ($9a)
$06:9852  1a			inc a
$06:9853  5e 4e ce	  lsr $ce4e,x
$06:9856  cd c7 ac	  cmp $acc7
$06:9859  ef 87 fd fc   sbc $fcfd87
$06:985d  78			sei
$06:985e  34 f1		 bit $f1,x
$06:9860  0e ea 15	  asl $15ea
$06:9863  c4 3b		 cpy $3b
$06:9865  48			pha
$06:9866  37 84		 and [$84],y
$06:9868  7b			tdc
$06:9869  80 7b		 bra $98e6
$06:986b  04 fb		 tsb $fb
$06:986d  d0 2f		 bne $989e
$06:986f  1a			inc a
$06:9870  01 e5		 ora ($e5,x)
$06:9872  42 7f		 wdm #$7f
$06:9874  3c 76 32	  bit $3276,x
$06:9877  2f 25 e5 d1   and $d1e525
$06:987b  f6 c2		 inc $c2,x
$06:987d  fe fe ff	  inc $fffe,x
$06:9880  00 3f		 brk #$3f
$06:9882  c0 03 e0	  cpy #$e003
$06:9885  0d e0 02	  ora $02e0
$06:9888  fc 4a 3c	  jsr ($3c4a,x)
$06:988b  41 be		 eor ($be,x)
$06:988d  01 be		 ora ($be,x)
$06:988f  57 d3		 eor [$d3],y
$06:9891  da			phx
$06:9892  7a			ply
$06:9893  de ce ce	  dec $cece,x
$06:9896  cd c7 ac	  cmp $acc7
$06:9899  ef 87 fd fc   sbc $fcfd87
$06:989d  78			sei
$06:989e  34 30		 bit $30,x
$06:98a0  8f 2a d5 44   sta $44d52a
$06:98a4  bb			tyx
$06:98a5  48			pha
$06:98a6  37 84		 and [$84],y
$06:98a8  7b			tdc
$06:98a9  80 7b		 bra $9926
$06:98ab  04 fb		 tsb $fb
$06:98ad  d0 2f		 bne $98de
$06:98af  fd f0 dd	  sbc $ddf0,x
$06:98b2  5c 7f 3f 67   jml $673f7f
$06:98b6  2b			pld
$06:98b7  2f 25 e5 d1   and $d1e525
$06:98bb  f6 c2		 inc $c2,x
$06:98bd  fe fe 10	  inc $10fe,x
$06:98c0  ef 2c c3 03   sbc $03c32c
$06:98c4  e0 04 f8	  cpx #$f804
$06:98c7  02 fc		 cop #$fc
$06:98c9  4a			lsr a
$06:98ca  3c 41 be	  bit $be41,x
$06:98cd  01 be		 ora ($be,x)
$06:98cf  fd f0 dd	  sbc $ddf0,x
$06:98d2  9c cf ff	  stz $ffcf
$06:98d5  c8			iny
$06:98d6  bb			tyx
$06:98d7  f8			sed
$06:98d8  9b			txy
$06:98d9  ff fc 77 77   sbc $7777fc,x
$06:98dd  d3 13		 cmp ($13,s),y
$06:98df  10 ef		 bpl $98d0
$06:98e1  60			rts
$06:98e2  87 30		 sta [$30]
$06:98e4  c4 77		 cpy $77
$06:98e6  88			dey
$06:98e7  67 98		 adc [$98]
$06:98e9  03 7c		 ora $7c,s
$06:98eb  88			dey
$06:98ec  13 ec		 ora ($ec,s),y
$06:98ee  00 59		 brk #$59
$06:98f0  df c9 7e cf   cmp $cf7ec9,x
$06:98f4  f4 ff e7	  pea $e7ff
$06:98f7  9e 9e d2	  stz $d29e,x
$06:98fa  b2 be		 lda ($be)
$06:98fc  9c 68 60	  stz $6068
$06:98ff  26 89		 rol $89
$06:9901  37 c8		 and [$c8],y
$06:9903  3b			tsc
$06:9904  c4 18		 cpy $18
$06:9906  a7 61		 lda [$61]
$06:9908  18			clc
$06:9909  6d 02 63	  adc $6302
$06:990c  9c 9f 00	  stz $009f
$06:990f  7f 00 fb 00   adc $00fb00,x
$06:9913  7f 40 ff 00   adc $00ff40,x
$06:9917  fb			xce
$06:9918  02 7f		 cop #$7f
$06:991a  00 df		 brk #$df
$06:991c  10 ff		 bpl $991d
$06:991e  02 ff		 cop #$ff
$06:9920  00 ff		 brk #$ff
$06:9922  00 bf		 brk #$bf
$06:9924  00 ff		 brk #$ff
$06:9926  00 fd		 brk #$fd
$06:9928  00 ff		 brk #$ff
$06:992a  00 ef		 brk #$ef
$06:992c  00 fd		 brk #$fd
$06:992e  00 7d		 brk #$7d
$06:9930  19 f7 93	  ora $93f7,y
$06:9933  eb			xba
$06:9934  63 b5		 adc $b5,s
$06:9936  87 d5		 sta [$d5]
$06:9938  1f df bb e7   ora $e7bbdf,x
$06:993c  dd 9b 7f	  cmp $7f9b,x
$06:993f  07 f1		 ora [$f1]
$06:9941  0d f1 9d	  ora $9df1
$06:9944  61 79		 adc ($79,x)
$06:9946  01 e5		 ora ($e5,x)
$06:9948  05 13		 ora $13
$06:994a  13 c5		 ora ($c5,s),y
$06:994c  c5 03		 cmp $03
$06:994e  03 6b		 ora $6b,s
$06:9950  a3 36		 lda $36,s
$06:9952  b6 7e		 ldx $7e,y
$06:9954  be 6f af	  ldx $af6f,y
$06:9957  9f 1f 3b 83   sta $833b1f,x
$06:995b  0c 73 80	  tsb $8073
$06:995e  80 41		 bra $99a1
$06:9960  7e 42 7d	  ror $7d42,x
$06:9963  42 5d		 wdm #$5d
$06:9965  53 4c		 eor ($4c,s),y
$06:9967  63 64		 adc $64,s
$06:9969  7c 7f 80	  jmp ($807f,x)
$06:996c  80 7f		 bra $99ed
$06:996e  ff 27 04 ce   sbc $ce0427,x
$06:9972  35 f3		 and $f3,x
$06:9974  0a			asl a
$06:9975  03 02		 ora $02,s
$06:9977  d4 d7		 pei ($d7)
$06:9979  ac ab 58	  ldy $58ab
$06:997c  a6 01		 ldx $01
$06:997e  01 02		 ora ($02,x)
$06:9980  fe 02 fe	  inc $fe02,x
$06:9983  00 fe		 brk #$fe
$06:9985  00 fe		 brk #$fe
$06:9987  d2 2e		 cmp ($2e)
$06:9989  f6 5e		 inc $5e,x
$06:998b  01 01		 ora ($01,x)
$06:998d  fe ff 1e	  inc $1eff,x
$06:9990  b0 77		 bcs $9a09
$06:9992  8c 48 86	  sty $8648
$06:9995  7c b1 45	  jmp ($45b1,x)
$06:9998  8e 4e b8	  stx $b84e
$06:999b  25 80		 and $80
$06:999d  80 ff		 bra $999e
$06:999f  48			pha
$06:99a0  3f 42 3f 43   and $433f42,x
$06:99a4  3f 68 3f 40   and $403f68,x
$06:99a8  3f 54 3f 7f   and $7f3f54,x
$06:99ac  00 00		 brk #$00
$06:99ae  00 26		 brk #$26
$06:99b0  4d aa 1d	  eor $1daa
$06:99b3  96 e1		 stx $e1,y
$06:99b5  96 4d		 stx $4d,y
$06:99b7  ca			dex
$06:99b8  65 1e		 adc $1e
$06:99ba  79 fc 01	  adc $01fc,y
$06:99bd  00 ff		 brk #$ff
$06:99bf  02 fc		 cop #$fc
$06:99c1  32 fc		 and ($fc)
$06:99c3  52 fc		 eor ($fc)
$06:99c5  02 fc		 cop #$fc
$06:99c7  82 fc 36	  brl $d0c6
$06:99ca  fc fe 00	  jsr ($00fe,x)
$06:99cd  00 00		 brk #$00
$06:99cf  72 d0		 adc ($d0)
$06:99d1  35 cd		 and $cd,x
$06:99d3  55 aa		 eor $aa,x
$06:99d5  75 ab		 adc $ab,x
$06:99d7  d6 28		 dec $28,x
$06:99d9  9f 61 62 9d   sta $9d6261,x
$06:99dd  aa			tax
$06:99de  fd 8f 40	  sbc $408f,x
$06:99e1  c2 00		 rep #$00
$06:99e3  80 00		 bra $99e5
$06:99e5  80 00		 bra $99e7
$06:99e7  01 00		 ora ($00,x)
$06:99e9  00 00		 brk #$00
$06:99eb  9c 00 fc	  stz $fc00
$06:99ee  00 f3		 brk #$f3
$06:99f0  05 56		 ora $56
$06:99f2  5d 6e fd	  eor $fd6e,x
$06:99f5  6b			rtl
$06:99f6  fa			plx
$06:99f7  29 f8 57	  and #$57f8
$06:99fa  ae 6c 92	  ldx $926c
$06:99fd  49 ff f8	  eor #$f8ff
$06:9a00  00 a0		 brk #$a0
$06:9a02  00 01		 brk #$01
$06:9a04  00 04		 brk #$04
$06:9a06  00 06		 brk #$06
$06:9a08  00 00		 brk #$00
$06:9a0a  00 10		 brk #$10
$06:9a0c  01 ff		 ora ($ff,x)
$06:9a0e  00 de		 brk #$de
$06:9a10  30 37		 bmi $9a49
$06:9a12  8c 88 c6	  sty $c688
$06:9a15  bc 71 c5	  ldy $c571,x
$06:9a18  0e 8e 38	  asl $388e
$06:9a1b  31 c3		 and ($c3),y
$06:9a1d  58			cli
$06:9a1e  8b			phb
$06:9a1f  48			pha
$06:9a20  ff 02 ff 03   sbc $03ff02,x
$06:9a24  ff e8 ff 00   sbc $00ffe8,x
$06:9a28  ff 14 ff 80   sbc $80ff14,x
$06:9a2c  ff 16 ff 27   sbc $27ff16,x
$06:9a30  4c a9 1c	  jmp $1ca9
$06:9a33  94 e3		 sty $e3,x
$06:9a35  94 4d		 sty $4d,x
$06:9a37  cb			wai
$06:9a38  64 1e		 stz $1e
$06:9a3a  79 4d 83	  adc $834d,y
$06:9a3d  33 0e		 and ($0e,s),y
$06:9a3f  02 ff		 cop #$ff
$06:9a41  30 ff		 bmi $9a42
$06:9a43  51 ff		 eor ($ff),y
$06:9a45  02 ff		 cop #$ff
$06:9a47  82 ff 34	  brl $cf49
$06:9a4a  ff c0 ff 05   sbc $05ffc0,x
$06:9a4e  ff ab ff 5b   sbc $5bffab,x
$06:9a52  ff c7 fe b7   sbc $b7fec7,x
$06:9a56  fe 9f fe	  inc $fe9f,x
$06:9a59  5f f5 4f ff   eor $ff4ff5,x
$06:9a5d  aa			tax
$06:9a5e  ff 55 ab a5   sbc $a5ab55,x
$06:9a62  5b			tcd
$06:9a63  2a			rol a
$06:9a64  d6 4a		 dec $4a,x
$06:9a66  b6 e6		 ldx $e6,y
$06:9a68  1e a5 55	  asl $55a5,x
$06:9a6b  93 6f		 sta ($6f,s),y
$06:9a6d  56 aa		 lsr $aa,x
$06:9a6f  f7 a9		 sbc [$a9],y
$06:9a71  fb			xce
$06:9a72  76 f7		 ror $f7,x
$06:9a74  cd ff b2	  cmp $b2ff
$06:9a77  fb			xce
$06:9a78  cd cf f2	  cmp $f2cf
$06:9a7b  b7 7c		 lda [$7c],y
$06:9a7d  af 55 a1 a1   lda $a1a155
$06:9a81  72 72		 adc ($72)
$06:9a83  c5 c5		 cmp $c5
$06:9a85  b2 b2		 lda ($b2)
$06:9a87  c9 c9 c2	  cmp #$c2c9
$06:9a8a  c2 04		 rep #$04
$06:9a8c  04 05		 tsb $05
$06:9a8e  05 5f		 ora $5f
$06:9a90  fc be fd	  jsr ($fdbe,x)
$06:9a93  ae fb 5f	  ldx $5ffb
$06:9a96  fd 75 7f	  sbc $7f75,x
$06:9a99  96 d7		 stx $d7,y
$06:9a9b  69 fd b6	  adc #$b6fd
$06:9a9e  bf a4 5c 44   lda $445ca4,x
$06:9aa2  bc 5a aa	  ldy $aa5a,x
$06:9aa5  bd 4d 2f	  lda $2f4d,x
$06:9aa8  d5 c3		 cmp $c3,x
$06:9aaa  3c dc 23	  bit $23dc,x
$06:9aad  1b			tcs
$06:9aae  e4 d8		 cpx $d8
$06:9ab0  9f de 9f f7   sta $f79fde,x
$06:9ab4  3f b8 3a 31   and $313ab8,x
$06:9ab8  73 2e		 adc ($2e,s),y
$06:9aba  9f 72 3f 58   sta $583f72,x
$06:9abe  47 9f		 eor [$9f]
$06:9ac0  68			pla
$06:9ac1  9f 7e 3f d0   sta $d03f7e,x
$06:9ac5  3a			dec a
$06:9ac6  e5 73		 sbc $73
$06:9ac8  8c 9f 60	  sty $609f
$06:9acb  3f c0 47 b8   and $b847c0,x
$06:9acf  df ef bb df   cmp $dfbbef,x
$06:9ad3  65 bf		 adc $bf
$06:9ad5  da			phx
$06:9ad6  3f d5 5f b7   and $b75fd5,x
$06:9ada  f7 2d		 sbc [$2d],y
$06:9adc  bd ca ef	  lda $efca,x
$06:9adf  0f 8f 1e 1b   ora $1b1e8f
$06:9ae3  3e 25 35	  rol $3525,x
$06:9ae6  0a			asl a
$06:9ae7  4e 71 e2	  lsr $e271
$06:9aea  1d 98 67	  ora $6798,x
$06:9aed  6f 90 ea df   adc $dfea90
$06:9af1  f2 d6		 sbc ($d6)
$06:9af3  fd df 64	  sbc $64df,x
$06:9af6  dd ea df	  cmp $dfea,x
$06:9af9  36 67		 rol $67,x
$06:9afb  7f eb a9 fb   adc $fba9eb,x
$06:9aff  c3 c2		 cmp $c2,s
$06:9b01  ca			dex
$06:9b02  c3 c7		 cmp $c7,s
$06:9b04  c4 c5		 cpy $c5
$06:9b06  46 c3		 lsr $c3
$06:9b08  42 6b		 wdm #$6b
$06:9b0a  a2 e2 23	  ldx #$23e2
$06:9b0d  fb			xce
$06:9b0e  04 4c		 tsb $4c
$06:9b10  b7 32		 lda [$32],y
$06:9b12  cb			wai
$06:9b13  cb			wai
$06:9b14  ff a0 f5 be   sbc $bef5a0,x
$06:9b18  ff 46 6f 35   sbc $356f46,x
$06:9b1c  bf 69 fb 82   lda $82fb69,x
$06:9b20  04 c9		 tsb $c9
$06:9b22  06 7d		 asl $7d
$06:9b24  82 75 8a	  brl $259c
$06:9b27  eb			xba
$06:9b28  14 6b		 trb $6b
$06:9b2a  94 9e		 sty $9e,x
$06:9b2c  61 d3		 adc ($d3,x)
$06:9b2e  2c d2 2f	  bit $2fd2
$06:9b31  8e f7 41	  stx $41f7
$06:9b34  ef 3a fe 15   sbc $15fe3a
$06:9b38  5f b7 f7 3d   eor $3df7b7,x
$06:9b3c  bd e6 ff	  lda $ffe6,x
$06:9b3f  25 02		 and $02
$06:9b41  75 82		 adc $82,x
$06:9b43  ef 10 d4 2b   sbc $2bd410
$06:9b47  4e b1 e2	  lsr $e2b1
$06:9b4a  1d a8 57	  ora $57a8,x
$06:9b4d  5b			tcd
$06:9b4e  a4 6c		 ldy $6c
$06:9b50  ff f6 fe a5   sbc $a5fef6,x
$06:9b54  ff d9 fd 66   sbc $66fdd9,x
$06:9b58  f7 ad		 sbc [$ad],y
$06:9b5a  f2 8e		 sbc ($8e)
$06:9b5c  f1 00		 sbc ($00),y
$06:9b5e  f0 b7		 beq $9b17
$06:9b60  4c be 51	  jmp $51be
$06:9b63  7f a0 7d c2   adc $c27da0,x
$06:9b67  f7 48		 sbc [$48],y
$06:9b69  ff 8f ff bf   sbc $bfff8f,x
$06:9b6d  ff 3f 3c fe   sbc $fe3c3f,x
$06:9b71  ed ff aa	  sbc $aaff
$06:9b74  af 5e 07 d9   lda $d9075e
$06:9b78  c3 43		 cmp $43,s
$06:9b7a  b3 89		 lda ($89,s),y
$06:9b7c  77 03		 adc [$03],y
$06:9b7e  0f f6 29 ff   ora $ff29f6
$06:9b82  08			php
$06:9b83  af 50 07 fa   lda $fa0750
$06:9b87  c3 3c		 cmp $3c,s
$06:9b89  f3 fd		 sbc ($fd,s),y
$06:9b8b  ff fd ff fd   sbc $fdfffd,x
$06:9b8f  95 30		 sta $30,x
$06:9b91  7a			ply
$06:9b92  0e e5 99	  asl $99e5
$06:9b95  bd 0f 4b	  lda $4b0f,x
$06:9b98  19 14 31	  ora $3114,y
$06:9b9b  76 51		 ror $51,x
$06:9b9d  b9 99 cb	  lda $cb99,y
$06:9ba0  00 e1		 brk #$e1
$06:9ba2  00 62		 brk #$62
$06:9ba4  00 e0		 brk #$e0
$06:9ba6  00 e4		 brk #$e4
$06:9ba8  00 ce		 brk #$ce
$06:9baa  00 8e		 brk #$8e
$06:9bac  00 46		 brk #$46
$06:9bae  00 b9		 brk #$b9
$06:9bb0  29 82 a7	  and #$a782
$06:9bb3  4c 64 a2	  jmp $a264
$06:9bb6  e6 57		 inc $57
$06:9bb8  bb			tyx
$06:9bb9  a1 67		 lda ($67,x)
$06:9bbb  de 47 da	  dec $da47,x
$06:9bbe  42 c6		 wdm #$c6
$06:9bc0  00 58		 brk #$58
$06:9bc2  00 9b		 brk #$9b
$06:9bc4  00 19		 brk #$19
$06:9bc6  00 00		 brk #$00
$06:9bc8  00 18		 brk #$18
$06:9bca  00 38		 brk #$38
$06:9bcc  00 3d		 brk #$3d
$06:9bce  00 b4		 brk #$b4
$06:9bd0  ff 95 bf 45   sbc $45bf95,x
$06:9bd4  ef 3a fe 54   sbc $54fe3a
$06:9bd8  ff 5b fb 76   sbc $76fb5b,x
$06:9bdc  ff a5 ff 6b   sbc $6bffa5,x
$06:9be0  94 3f		 sty $3f,x
$06:9be2  c0 ef 10	  cpy #$10ef
$06:9be5  d4 2b		 pei ($2b)
$06:9be7  ef 10 e8 17   sbc $17e810
$06:9beb  ac 52 10	  ldy $1052
$06:9bee  24 a4		 bit $a4
$06:9bf0  ef 12 ba fb   sbc $fbba12
$06:9bf4  ff a0 f5 be   sbc $bef5a0,x
$06:9bf8  ff c6 ef dd   sbc $ddefc6,x
$06:9bfc  bf 29 7f ef   lda $ef7f29,x
$06:9c00  10 b8		 bpl $9bba
$06:9c02  47 5d		 eor [$5d]
$06:9c04  a2 75 8a	  ldx #$8a75
$06:9c07  eb			xba
$06:9c08  14 ab		 trb $ab
$06:9c0a  54 16 09	  mvn $09,$16
$06:9c0d  84 08		 sty $08
$06:9c0f  b5 15		 lda $15,x
$06:9c11  4a			lsr a
$06:9c12  2a			rol a
$06:9c13  a4 04		 ldy $04
$06:9c15  14 34		 trb $34
$06:9c17  4b			phk
$06:9c18  62 f4 a0	  per $3d0f
$06:9c1b  9b			txy
$06:9c1c  40			rti
$06:9c1d  4f c0 ca 00   eor $00cac0
$06:9c21  d5 00		 cmp $00,x
$06:9c23  db			stp
$06:9c24  00 cb		 brk #$cb
$06:9c26  00 9d		 brk #$9d
$06:9c28  00 1f		 brk #$1f
$06:9c2a  00 3f		 brk #$3f
$06:9c2c  00 3f		 brk #$3f
$06:9c2e  00 6d		 brk #$6d
$06:9c30  ff da fa ad   sbc $adfada,x
$06:9c34  ad 42 42	  lda $4242
$06:9c37  a8			tay
$06:9c38  00 56		 brk #$56
$06:9c3a  00 fd		 brk #$fd
$06:9c3c  00 ff		 brk #$ff
$06:9c3e  00 00		 brk #$00
$06:9c40  00 05		 brk #$05
$06:9c42  00 52		 brk #$52
$06:9c44  00 bd		 brk #$bd
$06:9c46  00 ff		 brk #$ff
$06:9c48  00 ff		 brk #$ff
$06:9c4a  00 ff		 brk #$ff
$06:9c4c  00 ff		 brk #$ff
$06:9c4e  00 45		 brk #$45
$06:9c50  bf b2 ff 4a   lda $4affb2,x
$06:9c54  4a			lsr a
$06:9c55  90 80		 bcc $9bd7
$06:9c57  45 00		 eor $00
$06:9c59  2b			pld
$06:9c5a  00 5f		 brk #$5f
$06:9c5c  00 ff		 brk #$ff
$06:9c5e  00 00		 brk #$00
$06:9c60  00 00		 brk #$00
$06:9c62  00 b5		 brk #$b5
$06:9c64  00 7f		 brk #$7f
$06:9c66  00 ff		 brk #$ff
$06:9c68  00 ff		 brk #$ff
$06:9c6a  00 ff		 brk #$ff
$06:9c6c  00 ff		 brk #$ff
$06:9c6e  00 55		 brk #$55
$06:9c70  fb			xce
$06:9c71  53 5d		 eor ($5d,s),y
$06:9c73  ad ab 53	  lda $53ab
$06:9c76  55 84		 eor $84,x
$06:9c78  06 47		 asl $47
$06:9c7a  05 96		 ora $96
$06:9c7c  07 e2		 ora [$e2]
$06:9c7e  03 00		 ora $00,s
$06:9c80  00 a0		 brk #$a0
$06:9c82  00 50		 brk #$50
$06:9c84  00 a8		 brk #$a8
$06:9c86  00 f9		 brk #$f9
$06:9c88  00 f8		 brk #$f8
$06:9c8a  00 f8		 brk #$f8
$06:9c8c  00 fc		 brk #$fc
$06:9c8e  00 ff		 brk #$ff
$06:9c90  9f 9f ff 9c   sta $9cff9f,x
$06:9c94  f8			sed
$06:9c95  9f 98 9f 9f   sta $9f9f98,x
$06:9c99  9f 9f 9c 98   sta $989c9f,x
$06:9c9d  9f 98 f7 f8   sta $f8f798,x
$06:9ca1  ff ff f4 ff   sbc $fff4ff,x
$06:9ca5  f8			sed
$06:9ca6  f3 f7		 sbc ($f7,s),y
$06:9ca8  f8			sed
$06:9ca9  ff ff f4 ff   sbc $fff4ff,x
$06:9cad  f8			sed
$06:9cae  f3 c1		 sbc ($c1,s),y
$06:9cb0  c9 f6 ff	  cmp #$fff6
$06:9cb3  ef ff 3f bf   sbc $bf3fff
$06:9cb7  78			sei
$06:9cb8  ff 9c df 9f   sbc $9fdf9c,x
$06:9cbc  ff 7f ff c9   sbc $c9ff7f,x
$06:9cc0  b6 ff		 ldx $ff,y
$06:9cc2  40			rti
$06:9cc3  df 20 bf 7f   cmp $7fbf20,x
$06:9cc7  ff 18 db 3c   sbc $3cdb18,x
$06:9ccb  fe 07 ff	  inc $ff07,x
$06:9cce  19 57 7f	  ora $7f57,y
$06:9cd1  b7 fe		 lda [$fe],y
$06:9cd3  5f fd 5d ff   eor $ff5dfd,x
$06:9cd7  b6 f7		 ldx $f7,y
$06:9cd9  b7 f7		 lda [$f7],y
$06:9cdb  e7 e7		 sbc [$e7]
$06:9cdd  56 c6		 lsr $c6,x
$06:9cdf  6f 93 cf 37   adc $37cf93
$06:9ce3  ae 5f b7	  ldx $b75f
$06:9ce6  5f 6f bf 6d   eor $6dbf6f,x
$06:9cea  bf 5c ff f9   lda $f9ff5c,x
$06:9cee  7f e6 ee f5   adc $f5eee6,x
$06:9cf2  7f f8 ba b8   adc $b8baf8,x
$06:9cf6  fd 6e ef	  sbc $ef6e,x
$06:9cf9  f4 e7 be	  pea $bee7
$06:9cfc  a6 3b		 ldx $3b
$06:9cfe  23 ee		 and $ee,s
$06:9d00  91 ff		 sta ($ff),y
$06:9d02  e0 7a f5	  cpx #$f57a
$06:9d05  ed fa f7	  sbc $f7fa
$06:9d08  fc bf fc	  jsr ($fcbf,x)
$06:9d0b  7a			ply
$06:9d0c  ff df fe 00   sbc $00fedf,x
$06:9d10  ff a5 24 00   sbc $0024a5,x
$06:9d14  5a			phy
$06:9d15  18			clc
$06:9d16  a5 5a		 lda $5a
$06:9d18  e7 00		 sbc [$00]
$06:9d1a  5a			phy
$06:9d1b  a5 24		 lda $24
$06:9d1d  00 ff		 brk #$ff
$06:9d1f  ff ff db ff   sbc $ffdbff,x
$06:9d23  a5 81		 lda $81
$06:9d25  52 52		 eor ($52)
$06:9d27  18			clc
$06:9d28  5a			phy
$06:9d29  a5 81		 lda $81
$06:9d2b  db			stp
$06:9d2c  ff ff ff 0c   sbc $0cffff,x
$06:9d30  a1 56		 lda ($56,x)
$06:9d32  80 27		 bra $9d5b
$06:9d34  a8			tay
$06:9d35  59 ac 3a	  eor $3aac,y
$06:9d38  80 54		 bra $9d8e
$06:9d3a  cd 2a a0	  cmp $a02a
$06:9d3d  80 7f		 bra $9dbe
$06:9d3f  d2 d2		 cmp ($d2)
$06:9d41  ef cd d2 f2   sbc $f2d2cd
$06:9d45  c2 ca		 rep #$ca
$06:9d47  e5 e5		 sbc $e5
$06:9d49  b2 d4		 lda ($d4)
$06:9d4b  df ff ff ff   cmp $ffffff,x
$06:9d4f  8a			txa
$06:9d50  ca			dex
$06:9d51  21 c1		 and ($c1,x)
$06:9d53  9f cf ae ce   sta $ceaecf,x
$06:9d57  7a			ply
$06:9d58  c8			iny
$06:9d59  72 c2		 adc ($c2)
$06:9d5b  8f cf a8 bb   sta $bba8cf
$06:9d5f  f5 be		 sbc $be,x
$06:9d61  fe 30 f0	  inc $f030,x
$06:9d64  b0 f1		 bcs $9d57
$06:9d66  b0 f7		 bcs $9d5f
$06:9d68  70 fd		 bvs $9d67
$06:9d6a  70 f0		 bvs $9d5c
$06:9d6c  30 bb		 bmi $9d29
$06:9d6e  44 d2 53	  mvp $53,$d2
$06:9d71  97 83		 sta [$83],y
$06:9d73  fa			plx
$06:9d74  f3 95		 sbc ($95,s),y
$06:9d76  93 ae		 sta ($ae,s),y
$06:9d78  02 4f		 cop #$4f
$06:9d7a  43 f0		 eor $f0,s
$06:9d7c  f2 8a		 sbc ($8a)
$06:9d7e  fb			xce
$06:9d7f  af 7c 7f 0d   lda $0d7f7c
$06:9d83  0f 0c 6e 0d   ora $0d6e0c
$06:9d87  fe 0f bf	  inc $bf0f,x
$06:9d8a  0e 0e 0d	  asl $0d0e
$06:9d8d  fb			xce
$06:9d8e  04 62		 tsb $62
$06:9d90  70 b1		 bvs $9d43
$06:9d92  a1 5b		 lda ($5b,x)
$06:9d94  7b			tdc
$06:9d95  b5 d5		 lda $d5,x
$06:9d97  fa			plx
$06:9d98  db			stp
$06:9d99  75 1e		 adc $1e,x
$06:9d9b  f1 83		 sbc ($83),y
$06:9d9d  d8			cld
$06:9d9e  0b			phd
$06:9d9f  8f 00 4e 00   sta $004e00
$06:9da3  84 00		 sty $00
$06:9da5  0a			asl a
$06:9da6  00 04		 brk #$04
$06:9da8  00 80		 brk #$80
$06:9daa  00 00		 brk #$00
$06:9dac  3f 16 7f 49   and $497f16,x
$06:9db0  c3 36		 cmp $36,s
$06:9db2  a6 c9		 ldx $c9
$06:9db4  47 04		 eor [$04]
$06:9db6  85 d3		 sta $d3
$06:9db8  56 2f		 lsr $2f,x
$06:9dba  ad 6e b9	  lda $b96e
$06:9dbd  33 0e		 and ($0e,s),y
$06:9dbf  3c 00 59	  bit $5900,x
$06:9dc2  00 38		 brk #$38
$06:9dc4  00 7a		 brk #$7a
$06:9dc6  00 28		 brk #$28
$06:9dc8  00 50		 brk #$50
$06:9dca  00 80		 brk #$80
$06:9dcc  80 04		 bra $9dd2
$06:9dce  fe bd 09	  inc $09bd,x
$06:9dd1  77 13		 adc [$13],y
$06:9dd3  ab			plb
$06:9dd4  23 b5		 and $b5,s
$06:9dd6  87 d5		 sta [$d5]
$06:9dd8  1f df bb e7   ora $e7bbdf,x
$06:9ddc  dd 9b 7f	  cmp $7f9b,x
$06:9ddf  f7 01		 sbc [$01],y
$06:9de1  ed 01 dd	  sbc $dd01
$06:9de4  01 79		 ora ($79,x)
$06:9de6  01 e5		 ora ($e5,x)
$06:9de8  05 13		 ora $13
$06:9dea  13 c5		 ora ($c5,s),y
$06:9dec  c5 03		 cmp $03
$06:9dee  03 da		 ora $da,s
$06:9df0  3f ef 55 f6   and $f655ef,x
$06:9df4  6b			rtl
$06:9df5  eb			xba
$06:9df6  5d eb 5f	  eor $5feb,x
$06:9df9  f3 5d		 sbc ($5d,s),y
$06:9dfb  eb			xba
$06:9dfc  b5 f7		 lda $f7,x
$06:9dfe  ab			plb
$06:9dff  02 02		 cop #$02
$06:9e01  44 44 62	  mvp $62,$44
$06:9e04  62 41 41	  per $df48
$06:9e07  43 43		 eor $43,s
$06:9e09  51 51		 eor ($51),y
$06:9e0b  a1 a1		 lda ($a1,x)
$06:9e0d  a3 a3		 lda $a3,s
$06:9e0f  d5 c0		 cmp $c0,x
$06:9e11  8b			phb
$06:9e12  80 7f		 bra $9e93
$06:9e14  c0 3f 80	  cpy #$803f
$06:9e17  6b			rtl
$06:9e18  c0 d5 50	  cpy #$50d5
$06:9e1b  3a			dec a
$06:9e1c  ea			nop
$06:9e1d  58			cli
$06:9e1e  8b			phb
$06:9e1f  3f 00 7f 00   and $007f00,x
$06:9e23  3f 00 7f 00   and $007f00,x
$06:9e27  3f 00 2f 80   and $802f00,x
$06:9e2b  81 d4		 sta ($d4,x)
$06:9e2d  16 ff		 asl $ff,x
$06:9e2f  ff 00 bb 00   sbc $00bb00,x
$06:9e33  ff 00 ee 00   sbc $00ee00,x
$06:9e37  ff 00 be 00   sbc $00be00,x
$06:9e3b  57 00		 eor [$00],y
$06:9e3d  ac 84 ff	  ldy $ff84
$06:9e40  00 ff		 brk #$ff
$06:9e42  00 ff		 brk #$ff
$06:9e44  00 ff		 brk #$ff
$06:9e46  00 ff		 brk #$ff
$06:9e48  00 ff		 brk #$ff
$06:9e4a  00 ff		 brk #$ff
$06:9e4c  00 7b		 brk #$7b
$06:9e4e  00 ed		 brk #$ed
$06:9e50  00 ff		 brk #$ff
$06:9e52  00 bb		 brk #$bb
$06:9e54  00 ff		 brk #$ff
$06:9e56  00 ff		 brk #$ff
$06:9e58  00 b5		 brk #$b5
$06:9e5a  00 5b		 brk #$5b
$06:9e5c  01 a4		 ora ($a4,x)
$06:9e5e  a4 ff		 ldy $ff
$06:9e60  00 ff		 brk #$ff
$06:9e62  00 ff		 brk #$ff
$06:9e64  00 ff		 brk #$ff
$06:9e66  00 ff		 brk #$ff
$06:9e68  00 ff		 brk #$ff
$06:9e6a  00 fe		 brk #$fe
$06:9e6c  00 5b		 brk #$5b
$06:9e6e  00 b7		 brk #$b7
$06:9e70  05 79		 ora $79
$06:9e72  0b			phd
$06:9e73  ad 07 f9	  lda $f907
$06:9e76  03 f6		 ora $f6,s
$06:9e78  05 6a		 ora $6a
$06:9e7a  0d 6d 73	  ora $736d
$06:9e7d  33 0e		 and ($0e,s),y
$06:9e7f  f8			sed
$06:9e80  00 f4		 brk #$f4
$06:9e82  00 f8		 brk #$f8
$06:9e84  00 fc		 brk #$fc
$06:9e86  00 f8		 brk #$f8
$06:9e88  00 f0		 brk #$f0
$06:9e8a  03 80		 ora $80,s
$06:9e8c  0f 05 ff bf   ora $bfff05
$06:9e90  9f 9f 9f dc   sta $dc9f9f,x
$06:9e94  98			tya
$06:9e95  bf 98 df 9f   lda $9fdf98,x
$06:9e99  bf 9f fc 98   lda $98fc9f,x
$06:9e9d  df 98 f7 f8   cmp $f8f798,x
$06:9ea1  ff ff f4 ff   sbc $fff4ff,x
$06:9ea5  f8			sed
$06:9ea6  f3 f7		 sbc ($f7,s),y
$06:9ea8  f8			sed
$06:9ea9  ff ff f4 ff   sbc $fff4ff,x
$06:9ead  f8			sed
$06:9eae  f3 2f		 sbc ($2f,s),y
$06:9eb0  bf 39 bf 57   lda $57bf39,x
$06:9eb4  7f b8 fa 75   adc $75fab8,x
$06:9eb8  f7 ee		 sbc [$ee],y
$06:9eba  ff c4 ff b8   sbc $b8ffc4,x
$06:9ebe  ff bf 4f b6   sbc $b64fbf,x
$06:9ec2  59 7f 90	  eor $907f,y
$06:9ec5  fa			plx
$06:9ec6  25 f7		 and $f7
$06:9ec8  48			pha
$06:9ec9  ff 80 ff 00   sbc $00ff80,x
$06:9ecd  ff 00 7e e0   sbc $e07e00,x
$06:9ed1  6f e0 5f f0   adc $f05fe0
$06:9ed5  72 f1		 adc ($f1)
$06:9ed7  28			plp
$06:9ed8  f8			sed
$06:9ed9  bd fd bf	  lda $bffd,x
$06:9edc  ff 5f ff df   sbc $dfff5f,x
$06:9ee0  7f df 7f cf   adc $cf7fdf,x
$06:9ee4  7f af 7f e7   adc $e77faf,x
$06:9ee8  3f 52 bf 58   and $58bf52,x
$06:9eec  bf ef 1f be   lda $be1fef,x
$06:9ef0  07 66		 ora [$66]
$06:9ef2  97 d7		 sta [$d7],y
$06:9ef4  27 2c		 and [$2c]
$06:9ef6  cf 1e 1f 7a   cmp $7a1f1e
$06:9efa  7e f5 ff	  ror $fff5,x
$06:9efd  ea			nop
$06:9efe  ff fb fe fb   sbc $fbfefb,x
$06:9f02  fe ff fe	  inc $feff,x
$06:9f05  f7 fc		 sbc [$fc],y
$06:9f07  e7 fc		 sbc [$fc]
$06:9f09  8e f9 1f	  stx $1ff9
$06:9f0c  f0 ff		 beq $9f0d
$06:9f0e  e0 42 99	  cpx #$9942
$06:9f11  08			php
$06:9f12  ad 42 db	  lda $db42
$06:9f15  18			clc
$06:9f16  a5 18		 lda $18
$06:9f18  a5 42		 lda $42
$06:9f1a  db			stp
$06:9f1b  08			php
$06:9f1c  ad 42 99	  lda $9942
$06:9f1f  e7 e7		 sbc [$e7]
$06:9f21  d3 db		 cmp ($db,s),y
$06:9f23  a5 c3		 lda $c3
$06:9f25  db			stp
$06:9f26  db			stp
$06:9f27  d3 d3		 cmp ($d3,s),y
$06:9f29  a5 c3		 lda $c3
$06:9f2b  d3 db		 cmp ($db,s),y
$06:9f2d  e7 e7		 sbc [$e7]
$06:9f2f  97 84		 sta [$84],y
$06:9f31  ed c1 97	  sbc $97c1
$06:9f34  c4 dd		 cpy $dd
$06:9f36  f1 eb		 sbc ($eb),y
$06:9f38  b8			clv
$06:9f39  fd a7 fb	  sbc $fba7,x
$06:9f3c  d6 fb		 dec $fb,x
$06:9f3e  d5 fb		 cmp $fb,x
$06:9f40  80 be		 bra $9f00
$06:9f42  80 bb		 bra $9eff
$06:9f44  80 ce		 bra $9f14
$06:9f46  c0 a7 a0	  cpy #$a0a7
$06:9f49  a4 a4		 ldy $a4
$06:9f4b  d2 d2		 cmp ($d2)
$06:9f4d  d1 d1		 cmp ($d1),y
$06:9f4f  f7 fb		 sbc [$fb],y
$06:9f51  7f bf ef ff   adc $ffefbf,x
$06:9f55  fd f6 ff	  sbc $fff6,x
$06:9f58  7f bf db fe   adc $fedbbf,x
$06:9f5c  ef ff dd f3   sbc $f3ddff
$06:9f60  f3 3f		 sbc ($3f,s),y
$06:9f62  3f ef ef f4   and $f4efef,x
$06:9f66  f4 7f 7f	  pea $7f7f
$06:9f69  9b			txy
$06:9f6a  9b			txy
$06:9f6b  ee ee dd	  inc $ddee
$06:9f6e  dd 9f 6e	  cmp $6e9f,x
$06:9f71  f5 6e		 sbc $6e,x
$06:9f73  9b			txy
$06:9f74  75 ff		 adc $ff,x
$06:9f76  9b			txy
$06:9f77  ff bf ff db   sbc $dbffbf,x
$06:9f7b  ff bf ff ff   sbc $ffffbf,x
$06:9f7f  00 00		 brk #$00
$06:9f81  00 00		 brk #$00
$06:9f83  11 11		 ora ($11),y
$06:9f85  9b			txy
$06:9f86  9b			txy
$06:9f87  bf bf db db   lda $dbdbbf,x
$06:9f8b  bf bf ff ff   lda $ffffbf,x
$06:9f8f  ed db c3	  sbc $c3db
$06:9f92  b7 96		 lda [$96],y
$06:9f94  c7 38		 cmp [$38]
$06:9f96  ed 43 b7	  sbc $b743
$06:9f99  ef 79 b6 eb   sbc $ebb679
$06:9f9d  dd fe 81	  cmp $81fe,x
$06:9fa0  81 89		 sta ($89,x)
$06:9fa2  81 a8		 sta ($a8,x)
$06:9fa4  80 02		 bra $9fa8
$06:9fa6  00 09		 brk #$09
$06:9fa8  01 20		 ora ($20,x)
$06:9faa  20 82 82	  jsr $8282
$06:9fad  d4 d4		 pei ($d4)
$06:9faf  ab			plb
$06:9fb0  d5 f7		 cmp $f7,x
$06:9fb2  ab			plb
$06:9fb3  ff c9 bb e7   sbc $e7bbc9,x
$06:9fb7  f7 b9		 sbc [$b9],y
$06:9fb9  fb			xce
$06:9fba  d7 db		 cmp [$db],y
$06:9fbc  a5 b5		 lda $b5
$06:9fbe  cf 81 81 a3   cmp $a38181
$06:9fc2  a3 c9		 lda $c9,s
$06:9fc4  c9 a3 a3	  cmp #$a3a3
$06:9fc7  b1 b1		 lda ($b1),y
$06:9fc9  d3 d3		 cmp ($d3,s),y
$06:9fcb  81 81		 sta ($81,x)
$06:9fcd  81 81		 sta ($81,x)
$06:9fcf  ff ff ff bf   sbc $bfffff,x
$06:9fd3  ff ed ff fb   sbc $fbffed,x
$06:9fd7  ff d1 f2 ef   sbc $eff2d1,x
$06:9fdb  e9 d7 e3	  sbc #$e3d7
$06:9fde  ff ff ff bf   sbc $bfffff,x
$06:9fe2  bf ed ed fb   lda $fbeded,x
$06:9fe6  fb			xce
$06:9fe7  d1 d1		 cmp ($d1),y
$06:9fe9  e0 e0 c0	  cpx #$c0e0
$06:9fec  c0 e0 e0	  cpy #$e0e0
$06:9fef  ff ff ff fb   sbc $fbffff,x
$06:9ff3  ff 5f ff f7   sbc $f7ff5f,x
$06:9ff7  ff 9d df 2b   sbc $2bdf9d,x
$06:9ffb  1f f7 c7 bf   ora $bfc7f7,x
$06:9fff  ff ff fb fb   sbc $fbfbff,x
$06:a003  5f 5f f7 f7   eor $f7f75f,x
$06:a007  9d 9d 0b	  sta $0b9d,x
$06:a00a  0b			phd
$06:a00b  07 07		 ora [$07]
$06:a00d  87 87		 sta [$87]
$06:a00f  fa			plx
$06:a010  d6 f8		 dec $f8,x
$06:a012  eb			xba
$06:a013  f6 ad		 inc $ad,x
$06:a015  e3 da		 sbc $da,s
$06:a017  ec db f1	  cpx $f1db
$06:a01a  b7 f8		 lda [$f8],y
$06:a01c  d7 e6		 cmp [$e6],y
$06:a01e  d3 d1		 cmp ($d1,s),y
$06:a020  c0 e0 e4	  cpy #$e4e0
$06:a023  a0 a0 c6	  ldy #$c6a0
$06:a026  c0 c0 c0	  cpy #$c0c0
$06:a029  b0 a8		 bcs $9fd3
$06:a02b  c0 c0 c8	  cpy #$c8c0
$06:a02e  c0 bf 57	  cpy #$57bf
$06:a031  e7 6d		 sbc [$6d]
$06:a033  3f fb ef ef   and $efeffb,x
$06:a037  a7 9b		 lda [$9b]
$06:a039  7f e7 af 93   adc $93afe7,x
$06:a03d  77 3d		 adc [$3d],y
$06:a03f  07 07		 ora [$07]
$06:a041  35 05		 and $05,x
$06:a043  03 03		 ora $03,s
$06:a045  97 87		 sta [$87],y
$06:a047  83 43		 sta $43,s
$06:a049  27 07		 and [$07]
$06:a04b  43 03		 eor $03,s
$06:a04d  a5 05		 lda $05
$06:a04f  04 ff		 tsb $ff
$06:a051  25 bf		 and $bf
$06:a053  da			phx
$06:a054  fb			xce
$06:a055  90 f7		 bcc $a04e
$06:a057  52 df		 eor ($df)
$06:a059  8b			phb
$06:a05a  bf d6 f6 a2   lda $a2f6d6,x
$06:a05e  ee a0 00	  inc $00a0
$06:a061  4d 00 44	  eor $4400
$06:a064  00 91		 brk #$91
$06:a066  08			php
$06:a067  26 00		 rol $00
$06:a069  28			plp
$06:a06a  40			rti
$06:a06b  8a			txa
$06:a06c  01 29		 ora ($29,x)
$06:a06e  10 ff		 bpl $a06f
$06:a070  d9 fd ef	  cmp $effd,y
$06:a073  ef b3 f3 dd   sbc $ddf3b3
$06:a077  f3 af		 sbc ($af,s),y
$06:a079  ad ff f3	  lda $f3ff
$06:a07c  df ed b7 d9   cmp $d9b7ed,x
$06:a080  d9 ed ed	  cmp $eded,y
$06:a083  a3 a3		 lda $a3,s
$06:a085  d1 d1		 cmp ($d1),y
$06:a087  a1 a1		 lda ($a1,x)
$06:a089  a9 a9 d3	  lda #$d3a9
$06:a08c  d3 a5		 cmp ($a5,s),y
$06:a08e  a5 ef		 lda $ef
$06:a090  9b			txy
$06:a091  bf f7 f7 cd   lda $cdf7f7,x
$06:a095  cf bb cf f5   cmp $f5cfbb
$06:a099  b5 ff		 lda $ff,x
$06:a09b  ff cf ef bf   sbc $bfefcf,x
$06:a09f  8b			phb
$06:a0a0  8b			phb
$06:a0a1  b7 b7		 lda [$b7],y
$06:a0a3  c5 c5		 cmp $c5
$06:a0a5  8b			phb
$06:a0a6  8b			phb
$06:a0a7  85 85		 sta $85
$06:a0a9  95 95		 sta $95,x
$06:a0ab  cf cf af af   cmp $afafcf
$06:a0af  ff ff ff f7   sbc $f7ffff,x
$06:a0b3  ff de ff b7   sbc $b7ffde,x
$06:a0b7  6d d3 d1	  adc $d1d3
$06:a0ba  3d c8 5b	  and $5bc8,x
$06:a0bd  b2 de		 lda ($de)
$06:a0bf  ff ff f7 f7   sbc $f7f7ff,x
$06:a0c3  de de b7	  dec $b7de,x
$06:a0c6  b7 41		 lda [$41],y
$06:a0c8  41 02		 eor ($02,x)
$06:a0ca  00 24		 brk #$24
$06:a0cc  00 01		 brk #$01
$06:a0ce  00 ff		 brk #$ff
$06:a0d0  fb			xce
$06:a0d1  a2 ff 55	  ldx #$55ff
$06:a0d4  f7 d5		 sbc [$d5],y
$06:a0d6  bf ff 6a bf   lda $bf6aff,x
$06:a0da  db			stp
$06:a0db  fe ef ff	  inc $ffef,x
$06:a0de  dd fb fb	  cmp $fbfb,x
$06:a0e1  22 22 49 41   jsl $414922
$06:a0e5  94 94		 sty $94,x
$06:a0e7  6a			ror a
$06:a0e8  6a			ror a
$06:a0e9  9b			txy
$06:a0ea  9b			txy
$06:a0eb  ee ee dd	  inc $ddee
$06:a0ee  dd b5 d3	  cmp $d3b5,x
$06:a0f1  ac 14 d2	  ldy $d214
$06:a0f4  5e f5 e3	  lsr $e3f5,x
$06:a0f7  50 23		 bvc $a11c
$06:a0f9  95 bc		 sta $bc,x
$06:a0fb  e8			inx
$06:a0fc  e4 b3		 cpx $b3
$06:a0fe  77 d3		 adc [$d3],y
$06:a100  08			php
$06:a101  10 67		 bpl $a16a
$06:a103  4a			lsr a
$06:a104  35 a3		 and $a3,x
$06:a106  4c 23 cc	  jmp $cc23
$06:a109  a4 53		 ldy $53
$06:a10b  44 bb 56	  mvp $56,$bb
$06:a10e  29 7f ff	  and #$ff7f
$06:a111  97 ea		 sta [$ea],y
$06:a113  af fd cf b7   lda $b7cffd
$06:a117  fd 96 9f	  sbc $9f96,x
$06:a11a  eb			xba
$06:a11b  df ef b7 db   cmp $dbb7ef,x
$06:a11f  7f 7f 80 80   adc $80807f,x
$06:a123  8d 8d 87	  sta $878d
$06:a126  87 94		 sta [$94]
$06:a128  94 8b		 sty $8b,x
$06:a12a  8b			phb
$06:a12b  8f 8f 93 93   sta $93938f
$06:a12f  fe f7 8b	  inc $8bf7,x
$06:a132  75 b7		 adc $b7,x
$06:a134  dd f3 6d	  cmp $6df3,x
$06:a137  ff f3 e9 ff   sbc $ffe9f3,x
$06:a13b  7b			tdc
$06:a13c  bf f5 fb f6   lda $f6fbf5,x
$06:a140  f6 01		 inc $01,x
$06:a142  01 91		 ora ($91,x)
$06:a144  91 61		 sta ($61),y
$06:a146  61 f3		 adc ($f3,x)
$06:a148  f3 e9		 sbc ($e9,s),y
$06:a14a  e9 39 39	  sbc #$3939
$06:a14d  f1 f1		 sbc ($f1),y
$06:a14f  bb			tyx
$06:a150  6a			ror a
$06:a151  d5 2e		 cmp $2e,x
$06:a153  bb			tyx
$06:a154  42 75		 wdm #$75
$06:a156  8e 3f 06	  stx $063f
$06:a159  78			sei
$06:a15a  17 cb		 ora [$cb],y
$06:a15c  84 a7		 sty $a7
$06:a15e  18			clc
$06:a15f  04 00		 tsb $00
$06:a161  00 00		 brk #$00
$06:a163  04 00		 tsb $00
$06:a165  00 80		 brk #$80
$06:a167  00 e0		 brk #$e0
$06:a169  20 f0 40	  jsr $40f0
$06:a16c  f0 89		 beq $a0f7
$06:a16e  f9 3b f5	  sbc $f53b,y
$06:a171  aa			tax
$06:a172  76 5a		 ror $5a,x
$06:a174  e6 b1		 inc $b1
$06:a176  6f 13 f7 bb   adc $bbf713
$06:a17a  5d d5 3b	  eor $3bd5,x
$06:a17d  eb			xba
$06:a17e  1d 00 00	  ora $0000,x
$06:a181  01 00		 ora ($00,x)
$06:a183  01 00		 ora ($00,x)
$06:a185  00 00		 brk #$00
$06:a187  08			php
$06:a188  00 00		 brk #$00
$06:a18a  00 00		 brk #$00
$06:a18c  00 00		 brk #$00
$06:a18e  80 92		 bra $a122
$06:a190  26 2b		 rol $2b
$06:a192  27 52		 and [$52]
$06:a194  77 91		 adc [$91],y
$06:a196  b7 6a		 lda [$6a],y
$06:a198  6d 93 f4	  adc $f493
$06:a19b  6a			ror a
$06:a19c  bd d3 3e	  lda $3ed3,x
$06:a19f  d9 00 d8	  cmp $d800,y
$06:a1a2  00 88		 brk #$88
$06:a1a4  00 48		 brk #$48
$06:a1a6  00 90		 brk #$90
$06:a1a8  00 08		 brk #$08
$06:a1aa  00 00		 brk #$00
$06:a1ac  00 00		 brk #$00
$06:a1ae  02 d6		 cop #$d6
$06:a1b0  b8			clv
$06:a1b1  a6 d8		 ldx $d8
$06:a1b3  ab			plb
$06:a1b4  d1 2b		 cmp ($2b),y
$06:a1b6  c6 34		 dec $34
$06:a1b8  c2 61		 rep #$61
$06:a1ba  ac b2 41	  ldy $41b2
$06:a1bd  cc 07 00	  cpy $0007
$06:a1c0  01 0c		 ora ($0c,x)
$06:a1c2  0f 22 3f 0f   ora $0f3f22
$06:a1c6  3f 24 3f 19   and $193f24,x
$06:a1ca  3f 03 3f 0a   and $0a3f03,x
$06:a1ce  7f f6 bf 4e   adc $4ebff6,x
$06:a1d2  be bd df	  ldx $dfbd,y
$06:a1d5  b6 cf		 ldx $cf,y
$06:a1d7  2f db b2 57   and $57b2db
$06:a1db  76 95		 ror $95,x
$06:a1dd  bd 5e 9d	  lda $9d5e,x
$06:a1e0  a2 14 2b	  ldx #$2b14
$06:a1e3  0b			phd
$06:a1e4  1c 01 06	  trb $0601
$06:a1e7  00 03		 brk #$03
$06:a1e9  0b			phd
$06:a1ea  02 09		 cop #$09
$06:a1ec  00 00		 brk #$00
$06:a1ee  00 b4		 brk #$b4
$06:a1f0  ff 95 bf 45   sbc $45bf95,x
$06:a1f4  ef ba fe 95   sbc $95feba
$06:a1f8  df f7 f7 bd   cmp $bdf7f7,x
$06:a1fc  bd e6 ff	  lda $ffe6,x
$06:a1ff  6b			rtl
$06:a200  94 3f		 sty $3f,x
$06:a202  c0 ef 10	  cpy #$10ef
$06:a205  54 ab ce	  mvn $ce,$ab
$06:a208  31 a2		 and ($a2),y
$06:a20a  5d 28 d7	  eor $d728,x
$06:a20d  5b			tcd
$06:a20e  a4 a4		 ldy $a4
$06:a210  ef 12 ba db   sbc $dbba12
$06:a214  ff a0 f5 be   sbc $bef5a0,x
$06:a218  ff 46 6f 35   sbc $356f46,x
$06:a21c  bf 69 fb ef   lda $effb69,x
$06:a220  10 b8		 bpl $a1da
$06:a222  47 7d		 eor [$7d]
$06:a224  82 75 8a	  brl $2c9c
$06:a227  eb			xba
$06:a228  14 6b		 trb $6b
$06:a22a  94 9e		 sty $9e,x
$06:a22c  61 d3		 adc ($d3,x)
$06:a22e  2c b5 fe	  bit $feb5
$06:a231  cf fa 6c f5   cmp $f56cfa
$06:a235  bb			tyx
$06:a236  e1 fc		 sbc ($fc,x)
$06:a238  d5 df		 cmp $df,x
$06:a23a  82 6f a4	  brl $46ac
$06:a23d  ff 32 6a 94   sbc $946a32,x
$06:a241  70 88		 bvs $a1cb
$06:a243  d2 20		 cmp ($20)
$06:a245  46 a0		 lsr $a0
$06:a247  82 40 b0	  brl $528a
$06:a24a  00 90		 brk #$90
$06:a24c  00 00		 brk #$00
$06:a24e  00 21		 brk #$21
$06:a250  58			cli
$06:a251  c9 06 77	  cmp #$7706
$06:a254  82 43 d8	  brl $7a9a
$06:a257  3a			dec a
$06:a258  05 76		 ora $76
$06:a25a  1b			tcs
$06:a25b  e9 97 e5	  sbc #$e597
$06:a25e  3f 30 ff 8c   and $8cff30,x
$06:a262  fe c4 fe	  inc $fec4,x
$06:a265  30 fe		 bmi $a265
$06:a267  0c fc 29	  tsb $29fc
$06:a26a  f8			sed
$06:a26b  47 c0		 eor [$c0]
$06:a26d  8f 80 db 2c   sta $2cdb80
$06:a271  e5 bf		 sbc $bf
$06:a273  55 ff		 eor $ff,x
$06:a275  bb			tyx
$06:a276  ff d7 ff 1f   sbc $1fffd7,x
$06:a27a  ff 6b ff fa   sbc $faff6b,x
$06:a27e  ff 04 08 1a   sbc $1a0804,x
$06:a282  25 3b		 and $3b
$06:a284  44 d5 aa	  mvp $aa,$d5
$06:a287  6a			ror a
$06:a288  95 ea		 sta $ea,x
$06:a28a  15 d4		 ora $d4,x
$06:a28c  2b			pld
$06:a28d  55 aa		 eor $aa,x
$06:a28f  1d e3 15	  ora $15e3,x
$06:a292  be db ff	  ldx $ffdb,y
$06:a295  a1 f5		 lda ($f5,x)
$06:a297  bf fe 47 6f   lda $6f47fe,x
$06:a29b  35 bf		 and $bf,x
$06:a29d  69 fb 81	  adc #$81fb
$06:a2a0  01 b8		 ora ($b8,x)
$06:a2a2  46 7c		 lsr $7c
$06:a2a4  82 74 8a	  brl $2d1b
$06:a2a7  ea			nop
$06:a2a8  14 6b		 trb $6b
$06:a2aa  95 9e		 sta $9e,x
$06:a2ac  61 d3		 adc ($d3,x)
$06:a2ae  2c d8 06	  bit $06d8
$06:a2b1  56 38		 lsr $38,x
$06:a2b3  eb			xba
$06:a2b4  51 eb		 eor ($eb),y
$06:a2b6  06 74		 asl $74
$06:a2b8  02 e1		 cop #$e1
$06:a2ba  ac 32 c1	  ldy $c132
$06:a2bd  56 e9		 lsr $e9,x
$06:a2bf  4c ff 0c	  jmp $0cff
$06:a2c2  ff 22 7f 4f   sbc $4f7f22,x
$06:a2c6  7f a4 3f 19   adc $193fa4,x
$06:a2ca  3f 83 1f e0   and $e01f83,x
$06:a2ce  01 de		 ora ($de,x)
$06:a2d0  30 37		 bmi $a309
$06:a2d2  8c 88 c6	  sty $c688
$06:a2d5  bc 71 c5	  ldy $c571,x
$06:a2d8  0e 4e b8	  asl $b84e
$06:a2db  f1 43		 sbc ($43),y
$06:a2dd  b8			clv
$06:a2de  53 48		 eor ($48,s),y
$06:a2e0  ff 02 ff 03   sbc $03ff02,x
$06:a2e4  ff e8 ff 00   sbc $00ffe8,x
$06:a2e8  7f 14 3f 00   adc $003f14,x
$06:a2ec  0f 06 07 1c   ora $1c0706
$06:a2f0  9f f0 69 ad   sta $ad69f0,x
$06:a2f4  e5 76		 sbc $76
$06:a2f6  37 9b		 and [$9b],y
$06:a2f8  b9 b5 ed	  lda $edb5,y
$06:a2fb  af 17 4d e4   lda $e44d17
$06:a2ff  8a			txa
$06:a300  74 69		 stz $69,x
$06:a302  06 c5		 asl $c5
$06:a304  3a			dec a
$06:a305  12 ec		 ora ($ec)
$06:a307  89 76 6d	  bit #$6d76
$06:a30a  82 12 65	  brl $081f
$06:a30d  40			rti
$06:a30e  1f fb ca d5   ora $d5cafb,x
$06:a312  d1 ca		 cmp ($ca),y
$06:a314  a5 a4		 lda $a4
$06:a316  98			tya
$06:a317  ea			nop
$06:a318  c9 bf bf	  cmp #$bfbf
$06:a31b  ff a2 ff ff   sbc $ffffa2,x
$06:a31f  c4 ce		 cpy $ce
$06:a321  ae ff 7f	  ldx $7fff
$06:a324  ff 7f ff 37   sbc $37ff7f,x
$06:a328  ff 52 ff a2   sbc $a2ff52,x
$06:a32c  a2 ff ff	  ldx #$ffff
$06:a32f  bf ef 53 13   lda $1353ef,x
$06:a333  93 0d		 sta ($0d,s),y
$06:a335  ab			plb
$06:a336  45 51		 eor $51
$06:a338  ad 4d 4d	  lda $4d4d
$06:a33b  ff d3 ff ff   sbc $ffffd3,x
$06:a33f  03 af		 ora $af,s
$06:a341  ed ff fe	  sbc $feff
$06:a344  ff fe ff fe   sbc $fefffe,x
$06:a348  ff b2 ff 53   sbc $53ffb2,x
$06:a34c  d3 ff		 cmp ($ff,s),y
$06:a34e  ff 49 36 a8   sbc $a83649,x
$06:a352  a4 56		 ldy $56
$06:a354  f6 a8		 inc $a8,x
$06:a356  5f 54 ab b6   eor $b6ab54,x
$06:a35a  ef 4d ff b3   sbc $b3ff4d
$06:a35e  ff 04 e0 a0   sbc $a0e004,x
$06:a362  5b			tcd
$06:a363  f2 0d		 sbc ($0d)
$06:a365  1b			tcs
$06:a366  00 83		 brk #$83
$06:a368  00 a2		 brk #$a2
$06:a36a  04 ef		 tsb $ef
$06:a36c  00 bb		 brk #$bb
$06:a36e  00 34		 brk #$34
$06:a370  5b			tcd
$06:a371  a7 19		 lda [$19]
$06:a373  a6 d9		 ldx $d9
$06:a375  9f 45 ca 65   sta $65ca45,x
$06:a379  1e 79 4d	  asl $4d79,x
$06:a37c  83 33		 sta $33,s
$06:a37e  0e 00 c0	  asl $c000
$06:a381  00 c0		 brk #$c0
$06:a383  40			rti
$06:a384  c0 00 e4	  cpy #$e400
$06:a387  80 fc		 bra $a385
$06:a389  34 ff		 bit $ff,x
$06:a38b  c0 ff 05	  cpy #$05ff
$06:a38e  ff 2e 78 af   sbc $af782e,x
$06:a392  54 48 06	  mvn $06,$48
$06:a395  bc f1 45	  ldy $45f1,x
$06:a398  8e 8e 38	  stx $388e
$06:a39b  31 c3		 and ($c3),y
$06:a39d  58			cli
$06:a39e  8b			phb
$06:a39f  80 03		 bra $a3a4
$06:a3a1  82 07 83	  brl $26ab
$06:a3a4  3f 28 3f 00   and $003f28,x
$06:a3a8  7f 14 ff 80   adc $80ff14,x
$06:a3ac  ff 16 ff a1   sbc $a1ff16,x
$06:a3b0  ef 16 ba c8   sbc $c8ba16
$06:a3b4  f6 9f		 inc $9f,x
$06:a3b6  eb			xba
$06:a3b7  b5 df		 lda $df,x
$06:a3b9  54 0e 6d	  mvn $6d,$0e
$06:a3bc  ab			plb
$06:a3bd  d5 3b		 cmp $3b,x
$06:a3bf  ee 10 b9	  inc $b910
$06:a3c2  40			rti
$06:a3c3  71 80		 adc ($80),y
$06:a3c5  60			rts
$06:a3c6  80 c0		 bra $a388
$06:a3c8  00 31		 brk #$31
$06:a3ca  80 90		 bra $a35c
$06:a3cc  00 00		 brk #$00
$06:a3ce  00 e2		 brk #$e2
$06:a3d0  57 ed		 eor [$ed],y
$06:a3d2  5e aa 5f	  lsr $5faa,x
$06:a3d5  d5 2a		 cmp $2a,x
$06:a3d7  5a			phy
$06:a3d8  a5 ad		 lda $ad
$06:a3da  76 d1		 ror $d1,x
$06:a3dc  48			pha
$06:a3dd  db			stp
$06:a3de  48			pha
$06:a3df  08			php
$06:a3e0  00 00		 brk #$00
$06:a3e2  00 00		 brk #$00
$06:a3e4  00 00		 brk #$00
$06:a3e6  00 00		 brk #$00
$06:a3e8  00 00		 brk #$00
$06:a3ea  00 26		 brk #$26
$06:a3ec  00 26		 brk #$26
$06:a3ee  00 3c		 brk #$3c
$06:a3f0  ff 2a fa db   sbc $dbfa2a,x
$06:a3f4  3f 65 ff bd   and $bdff65,x
$06:a3f8  97 d2		 sta [$d2],y
$06:a3fa  df 29 b7 e7   cmp $e7b729,x
$06:a3fe  69 57 a8	  adc #$a857
$06:a401  10 ef		 bpl $a3f2
$06:a403  0d 12 0a	  ora $0a12
$06:a406  05 62		 ora $62
$06:a408  05 21		 ora $21
$06:a40a  06 40		 asl $40
$06:a40c  07 11		 ora [$11]
$06:a40e  01 b7		 ora ($b7,x)
$06:a410  fc 96 bb	  jsr ($bb96,x)
$06:a413  58			cli
$06:a414  fc b5 e4	  jsr ($e4b5,x)
$06:a417  0a			asl a
$06:a418  5e a5 ed	  lsr $eda5,x
$06:a41b  72 ce		 adc ($ce)
$06:a41d  27 4f		 and [$4f]
$06:a41f  68			pla
$06:a420  94 38		 sty $38,x
$06:a422  c0 e3 10	  cpy #$10e3
$06:a425  4b			phk
$06:a426  a0 41 a0	  ldy #$a041
$06:a429  d2 20		 cmp ($20)
$06:a42b  11 c0		 ora ($c0),y
$06:a42d  90 00		 bcc $a42f
$06:a42f  0a			asl a
$06:a430  b9 ba 13	  lda $13ba,y
$06:a433  95 ce		 sta $ce,x
$06:a435  27 6c		 and [$6c]
$06:a437  d5 3e		 cmp $3e,x
$06:a439  3b			tsc
$06:a43a  76 d5		 ror $d5,x
$06:a43c  be 29 76	  ldx $7629,y
$06:a43f  44 00 64	  mvp $64,$00
$06:a442  00 30		 brk #$30
$06:a444  00 90		 brk #$90
$06:a446  00 80		 brk #$80
$06:a448  00 80		 brk #$80
$06:a44a  00 00		 brk #$00
$06:a44c  00 80		 brk #$80
$06:a44e  00 f6		 brk #$f6
$06:a450  ef d3 7f f5   sbc $f57fd3
$06:a454  9f ea 7e 95   sta $957eea,x
$06:a458  7f f7 37 9d   adc $9d37f7,x
$06:a45c  fd e6 bf	  sbc $bfe6,x
$06:a45f  89 86 0d	  bit #$0d86
$06:a462  12 8f		 ora ($8f)
$06:a464  90 34		 bcc $a49a
$06:a466  2b			pld
$06:a467  2e 11 22	  rol $2211
$06:a46a  1d a8 97	  ora $97a8,x
$06:a46d  9b			txy
$06:a46e  a4 ff		 ldy $ff
$06:a470  7f eb a0 d9   adc $d9a0eb,x
$06:a474  99 ff 4a	  sta $4aff,y
$06:a477  ec a0 e9	  cpx $e9a0
$06:a47a  c4 ff		 cpy $ff
$06:a47c  ed ff d2	  sbc $d2ff
$06:a47f  7f 7f 9f bf   adc $bf9f7f,x
$06:a483  a6 bf		 ldx $bf
$06:a485  0a			asl a
$06:a486  4a			lsr a
$06:a487  bf bf bf ff   lda $ffbfbf,x
$06:a48b  80 ed		 bra $a47a
$06:a48d  d2 d2		 cmp ($d2)
$06:a48f  ff fe 2f 05   sbc $052ffe,x
$06:a493  b3 b1		 lda ($b1,s),y
$06:a495  ff d2 af 15   sbc $15afd2,x
$06:a499  13 83		 ora ($83,s),y
$06:a49b  ff 2f ff 92   sbc $92ff2f,x
$06:a49f  fe fe f9	  inc $f9fe,x
$06:a4a2  fd 4d fd	  sbc $fd4d,x
$06:a4a5  d0 d2		 bne $a479
$06:a4a7  fd fd fd	  sbc $fdfd,x
$06:a4aa  ff 01 2f 92   sbc $922f01,x
$06:a4ae  92 bb		 sta ($bb)
$06:a4b0  e6 1d		 inc $1d
$06:a4b2  b4 db		 ldy $db,x
$06:a4b4  f6 a7		 inc $a7,x
$06:a4b6  f2 bd		 sbc ($bd)
$06:a4b8  fe 47 6e	  inc $6e47,x
$06:a4bb  35 bf		 and $bf,x
$06:a4bd  69 fa e0	  adc #$e0fa
$06:a4c0  00 b2		 brk #$b2
$06:a4c2  40			rti
$06:a4c3  70 80		 bvs $a445
$06:a4c5  70 88		 bvs $a44f
$06:a4c7  e8			inx
$06:a4c8  14 6a		 trb $6a
$06:a4ca  96 9f		 stx $9f,y
$06:a4cc  61 d2		 adc ($d2,x)
$06:a4ce  2c 27 4c	  bit $4c27
$06:a4d1  a9 1c 94	  lda #$941c
$06:a4d4  e3 95		 sbc $95,s
$06:a4d6  4c cb 64	  jmp $64cb
$06:a4d9  1e 79 4f	  asl $4f79,x
$06:a4dc  82 3d 02	  brl $a71c
$06:a4df  02 ff		 cop #$ff
$06:a4e1  30 ff		 bmi $a4e2
$06:a4e3  51 ff		 eor ($ff),y
$06:a4e5  02 fe		 cop #$fe
$06:a4e7  82 fe 34	  brl $d9e8
$06:a4ea  fc c0 f8	  jsr ($f8c0,x)
$06:a4ed  00 f0		 brk #$f0
$06:a4ef  f3 d7		 sbc ($d7,s),y
$06:a4f1  2a			rol a
$06:a4f2  d9 2d 9d	  cmp $9d2d,y
$06:a4f5  ca			dex
$06:a4f6  57 b6		 eor [$b6],y
$06:a4f8  7b			tdc
$06:a4f9  5c ef 33 ff   jml $ff33ef
$06:a4fd  cf ff d2 09   cmp $09d2ff
$06:a501  d8			cld
$06:a502  06 05		 asl $05
$06:a504  6a			ror a
$06:a505  46 20		 lsr $20
$06:a507  61 12		 adc ($12,x)
$06:a509  ad 40 76	  lda $7640
$06:a50c  01 df		 ora ($df,x)
$06:a50e  00 de		 brk #$de
$06:a510  2a			rol a
$06:a511  d6 2e		 dec $2e,x
$06:a513  aa			tax
$06:a514  58			cli
$06:a515  ad 61 9b	  lda $9b61
$06:a518  48			pha
$06:a519  4c c0 31	  jmp $31c0
$06:a51c  b3 92		 lda ($92,s),y
$06:a51e  ff 01 00 01   sbc $010001,x
$06:a522  00 07		 brk #$07
$06:a524  00 1e		 brk #$1e
$06:a526  00 37		 brk #$37
$06:a528  00 3f		 brk #$3f
$06:a52a  00 4c		 brk #$4c
$06:a52c  00 48		 brk #$48
$06:a52e  00 ee		 brk #$ee
$06:a530  ad a4 af	  lda $afa4
$06:a533  db			stp
$06:a534  1e 96 87	  asl $8796,x
$06:a537  d8			cld
$06:a538  13 ae		 ora ($ae,s),y
$06:a53a  8b			phb
$06:a53b  48			pha
$06:a53c  69 15 ff	  adc #$ff15
$06:a53f  50 00		 bvc $a541
$06:a541  50 00		 bvc $a543
$06:a543  e0 00 78	  cpx #$7800
$06:a546  00 ec		 brk #$ec
$06:a548  00 74		 brk #$74
$06:a54a  00 96		 brk #$96
$06:a54c  00 22		 brk #$22
$06:a54e  00 cb		 brk #$cb
$06:a550  c0 2d 80	  cpy #$802d
$06:a553  75 c0		 adc $c0,x
$06:a555  17 80		 ora [$80],y
$06:a557  55 c0		 eor $c0,x
$06:a559  49 c0 1b	  eor #$1bc0
$06:a55c  96 7f		 stx $7f,y
$06:a55e  cb			wai
$06:a55f  3f 00 7f 00   and $007f00,x
$06:a563  3f 00 7f 00   and $007f00,x
$06:a567  3f 00 3f 00   and $003f00,x
$06:a56b  60			rts
$06:a56c  00 00		 brk #$00
$06:a56e  00 50		 brk #$50
$06:a570  01 56		 ora ($56,x)
$06:a572  03 ae		 ora $ae,s
$06:a574  03 a8		 ora $a8,s
$06:a576  01 b3		 ora ($b3,x)
$06:a578  02 54		 cop #$54
$06:a57a  01 57		 ora ($57,x)
$06:a57c  f2 34		 sbc ($34)
$06:a57e  b9 fe 00	  lda $00fe,y
$06:a581  fc 00 fc	  jsr ($fc00,x)
$06:a584  00 fe		 brk #$fe
$06:a586  00 fc		 brk #$fc
$06:a588  00 fe		 brk #$fe
$06:a58a  00 0c		 brk #$0c
$06:a58c  00 42		 brk #$42
$06:a58e  00 bb		 brk #$bb
$06:a590  b4 7d		 ldy $7d,x
$06:a592  cb			wai
$06:a593  dc aa d6	  jml [$d6aa]
$06:a596  2e aa 58	  rol $58aa
$06:a599  a9 61 9d	  lda #$9d61
$06:a59c  4c 69 f9	  jmp $f969
$06:a59f  b0 40		 bcs $a5e1
$06:a5a1  c0 00 81	  cpy #$8100
$06:a5a4  00 01		 brk #$01
$06:a5a6  00 07		 brk #$07
$06:a5a8  00 1e		 brk #$1e
$06:a5aa  00 33		 brk #$33
$06:a5ac  00 06		 brk #$06
$06:a5ae  00 fd		 brk #$fd
$06:a5b0  cf f6 ba af   cmp $afbaf6
$06:a5b4  ad a4 af	  lda $afa4
$06:a5b7  db			stp
$06:a5b8  1e d6 c7	  asl $c7d6,x
$06:a5bb  98			tya
$06:a5bc  13 ae		 ora ($ae,s),y
$06:a5be  8f 0f 00 42   sta $42000f
$06:a5c2  01 51		 ora ($51,x)
$06:a5c4  00 50		 brk #$50
$06:a5c6  00 e0		 brk #$e0
$06:a5c8  00 38		 brk #$38
$06:a5ca  00 ec		 brk #$ec
$06:a5cc  00 70		 brk #$70
$06:a5ce  00 cb		 brk #$cb
$06:a5d0  c0 2d 80	  cpy #$802d
$06:a5d3  75 c0		 adc $c0,x
$06:a5d5  1f 88 55 c0   ora $c05588,x
$06:a5d9  7d c0 2a	  adc $2ac0,x
$06:a5dc  80 6e		 bra $a64c
$06:a5de  c4 3f		 cpy $3f
$06:a5e0  00 7f		 brk #$7f
$06:a5e2  00 3f		 brk #$3f
$06:a5e4  00 77		 brk #$77
$06:a5e6  00 3f		 brk #$3f
$06:a5e8  00 3f		 brk #$3f
$06:a5ea  00 7f		 brk #$7f
$06:a5ec  00 3b		 brk #$3b
$06:a5ee  00 7f		 brk #$7f
$06:a5f0  80 c0		 bra $a5b2
$06:a5f2  3f b7 77 c1   and $c177b7,x
$06:a5f6  7f 9e 3e 9e   adc $9e3e9e,x
$06:a5fa  3e 80 3e	  rol $3e80,x
$06:a5fd  c1 7f		 cmp ($7f,x)
$06:a5ff  7f ff c0 ff   adc $ffc0ff,x
$06:a603  88			dey
$06:a604  ff be ff ff   sbc $ffffbe,x
$06:a608  ff ff ff ff   sbc $ffffff,x
$06:a60c  ff be ff c0   sbc $c0ffbe,x
$06:a610  7f e5 65 fc   adc $fc65e5,x
$06:a614  02 b9		 cop #$b9
$06:a616  3b			tsc
$06:a617  d2 7f		 cmp ($7f)
$06:a619  c0 7f 92	  cpy #$927f
$06:a61c  7f 7f 80 80   adc $80807f,x
$06:a620  ff 9a ff fd   sbc $fdff9a,x
$06:a624  ff c4 ff bc   sbc $bcffc4,x
$06:a628  ff bf ff 80   sbc $80ffbf,x
$06:a62c  ff 7f ff 7f   sbc $7fff7f,x
$06:a630  80 80		 bra $a5b2
$06:a632  7f dd 7f 81   adc $817fdd,x
$06:a636  01 bc		 ora ($bc,x)
$06:a638  42 d7		 wdm #$d7
$06:a63a  28			plp
$06:a63b  bf 40 bf 40   lda $40bf40,x
$06:a63f  7f ff be ff   adc $ffbeff,x
$06:a643  be ff fe	  ldx $feff,y
$06:a646  ff bd ff d7   sbc $d7ffbd,x
$06:a64a  ff bf ff bf   sbc $bfffbf,x
$06:a64e  ff fb 44 f4   sbc $f444fb,x
$06:a652  4b			phk
$06:a653  e0 5f a9	  cpx #$a95f
$06:a656  2b			pld
$06:a657  ca			dex
$06:a658  7e c0 7f	  ror $7fc0,x
$06:a65b  92 7f		 sta ($7f)
$06:a65d  7f 80 bf ff   adc $ffbf80,x
$06:a661  bf ff bf ff   lda $ffbfff,x
$06:a665  d4 ff		 pei ($ff)
$06:a667  bd ff bf	  lda $bfff,x
$06:a66a  ff 80 ff 7f   sbc $7fff80,x
$06:a66e  ff 7e 81 c1   sbc $c1817e,x
$06:a672  7e 92 73	  ror $7392,x
$06:a675  a1 7f		 lda ($7f,x)
$06:a677  8d 53 8c	  sta $8c53
$06:a67a  52 a1		 eor ($a1)
$06:a67c  7f 5a ba 7e   adc $7eba5a,x
$06:a680  ff 81 ff 8c   sbc $8cff81,x
$06:a684  ff 80 ff ac   sbc $acff80,x
$06:a688  ff ad ff 80   sbc $80ffad,x
$06:a68c  ff 45 ff 6f   sbc $6fff45,x
$06:a690  b0 b3		 bcs $a645
$06:a692  4e cc bd	  lsr $bdcc
$06:a695  53 b2		 eor ($b2,s),y
$06:a697  a9 6f a6	  lda #$a66f
$06:a69a  6e d5 5c	  ror $5cd5
$06:a69d  db			stp
$06:a69e  28			plp
$06:a69f  4f ff b1 ff   eor $ffb1ff
$06:a6a3  42 ff		 wdm #$ff
$06:a6a5  4d ff 91	  eor $91ff
$06:a6a8  fe 96 f9	  inc $f996,x
$06:a6ab  a4 fb		 ldy $fb
$06:a6ad  d8			cld
$06:a6ae  f7 81		 sbc [$81],y
$06:a6b0  7e 53 f3	  ror $f353,x
$06:a6b3  1c e2 6e	  trb $6ee2
$06:a6b6  df 39 99 32   cmp $329939,x
$06:a6ba  96 55		 stx $55,y
$06:a6bc  f5 ca		 sbc $ca,x
$06:a6be  5b			tcd
$06:a6bf  c3 ff		 cmp $ff,s
$06:a6c1  8c ff 3f	  sty $3fff
$06:a6c4  ff 20 ff 66   sbc $66ff20,x
$06:a6c8  ff 69 ff aa   sbc $aaff69,x
$06:a6cc  ff a4 ff 03   sbc $03ffa4,x
$06:a6d0  fc 35 b7	  jsr ($b735,x)
$06:a6d3  5a			phy
$06:a6d4  ce 55 fc	  dec $fc55
$06:a6d7  2a			rol a
$06:a6d8  b9 54 f2	  lda $f254,y
$06:a6db  a9 65 d3	  lda #$d365
$06:a6de  4a			lsr a
$06:a6df  00 fc		 brk #$fc
$06:a6e1  48			pha
$06:a6e2  ff 31 ff 23   sbc $23ff31,x
$06:a6e6  ff 47 ff 0f   sbc $0fff47,x
$06:a6ea  ff 1e 7f 3d   sbc $3d7f1e,x
$06:a6ee  7f 00 00 00   adc $000000,x
$06:a6f2  00 00		 brk #$00
$06:a6f4  00 00		 brk #$00
$06:a6f6  00 00		 brk #$00
$06:a6f8  00 00		 brk #$00
$06:a6fa  00 00		 brk #$00
$06:a6fc  00 00		 brk #$00
$06:a6fe  00 ff		 brk #$ff
$06:a700  ff ff ff ff   sbc $ffffff,x
$06:a704  ff ff ff ff   sbc $ffffff,x
$06:a708  ff ff ff ff   sbc $ffffff,x
$06:a70c  ff ff ff 00   sbc $00ffff,x
$06:a710  00 00		 brk #$00
$06:a712  00 00		 brk #$00
$06:a714  00 00		 brk #$00
$06:a716  00 00		 brk #$00
$06:a718  00 00		 brk #$00
$06:a71a  00 00		 brk #$00
$06:a71c  00 00		 brk #$00
$06:a71e  00 00		 brk #$00
$06:a720  00 00		 brk #$00
$06:a722  00 00		 brk #$00
$06:a724  00 00		 brk #$00
$06:a726  00 00		 brk #$00
$06:a728  00 00		 brk #$00
$06:a72a  00 00		 brk #$00
$06:a72c  00 00		 brk #$00
$06:a72e  00 ff		 brk #$ff
$06:a730  c9 88 88	  cmp #$8888
$06:a733  ff ff dd ff   sbc $ffddff,x
$06:a737  aa			tax
$06:a738  aa			tax
$06:a739  dd 88 ff	  cmp $ff88,x
$06:a73c  dd ff ff	  cmp $ffff,x
$06:a73f  ff c9 ff 88   sbc $88ffc9,x
$06:a743  88			dey
$06:a744  88			dey
$06:a745  88			dey
$06:a746  88			dey
$06:a747  dd 88 ff	  cmp $ff88,x
$06:a74a  88			dey
$06:a74b  ff dd ff ff   sbc $ffffdd,x
$06:a74f  1f 9f 5d df   ora $df5d9f,x
$06:a753  15 9f		 ora $9f,x
$06:a755  5f df 1e 9e   eor $9e1edf,x
$06:a759  5c df 1b 9b   jml $9b1bdf
$06:a75d  53 df		 eor ($df,s),y
$06:a75f  f6 f4		 inc $f4,x
$06:a761  be f4 ff	  ldx $fff4,y
$06:a764  f4 bf fb	  pea $fbbf
$06:a767  ee ed a3	  inc $a3ed
$06:a76a  e0 eb e7	  cpx #$e7eb
$06:a76d  ac e0 00	  ldy $00e0
$06:a770  a0 5f ff	  ldy #$ff5f
$06:a773  34 f4		 bit $f4,x
$06:a775  5f df 00 9f   eor $9f00df,x
$06:a779  5f df 1e 9e   eor $9e1edf,x
$06:a77d  5f df a0 ff   eor $ffa0df,x
$06:a781  ff a0 eb ff   sbc $ffeba0,x
$06:a785  bf e0 e0 e0   lda $e0e0e0,x
$06:a789  a0 e0 ea	  ldy #$eae0
$06:a78c  eb			xba
$06:a78d  bf eb 00 00   lda $0000eb,x
$06:a791  00 00		 brk #$00
$06:a793  00 00		 brk #$00
$06:a795  00 00		 brk #$00
$06:a797  00 00		 brk #$00
$06:a799  00 00		 brk #$00
$06:a79b  00 00		 brk #$00
$06:a79d  00 00		 brk #$00
$06:a79f  00 00		 brk #$00
$06:a7a1  00 00		 brk #$00
$06:a7a3  00 00		 brk #$00
$06:a7a5  00 00		 brk #$00
$06:a7a7  00 00		 brk #$00
$06:a7a9  00 00		 brk #$00
$06:a7ab  00 00		 brk #$00
$06:a7ad  00 00		 brk #$00
$06:a7af  00 ff		 brk #$ff
$06:a7b1  10 f7		 bpl $a7aa
$06:a7b3  18			clc
$06:a7b4  ff 00 ff 99   sbc $99ff00,x
$06:a7b8  ff 66 66 99   sbc $996666,x
$06:a7bc  ff 00 ff 18   sbc $18ff00,x
$06:a7c0  e7 b5		 sbc [$b5]
$06:a7c2  4a			lsr a
$06:a7c3  bd 42 18	  lda $1842,x
$06:a7c6  e7 bd		 sbc [$bd]
$06:a7c8  42 66		 wdm #$66
$06:a7ca  99 bd 42	  sta $42bd,y
$06:a7cd  00 ff		 brk #$ff
$06:a7cf  60			rts
$06:a7d0  fd e0 ff	  sbc $ffe0,x
$06:a7d3  08			php
$06:a7d4  ff 42 77 42   sbc $427742,x
$06:a7d8  77 08		 adc [$08],y
$06:a7da  ff e0 ff e0   sbc $e0ffe0,x
$06:a7de  fd 00 ff	  sbc $ff00,x
$06:a7e1  0a			asl a
$06:a7e2  f5 0e		 sbc $0e,x
$06:a7e4  f1 66		 sbc ($66),y
$06:a7e6  99 66 99	  sta $9966,y
$06:a7e9  0e f1 0a	  asl $0af1
$06:a7ec  f5 00		 sbc $00,x
$06:a7ee  ff 80 fd 00   sbc $00fd80,x
$06:a7f2  ff 48 ff 42   sbc $42ff48,x
$06:a7f6  77 42		 adc [$42],y
$06:a7f8  77 a8		 adc [$a8],y
$06:a7fa  ff 60 ff 60   sbc $60ff60,x
$06:a7fe  fd 00 ff	  sbc $ff00,x
$06:a801  2a			rol a
$06:a802  d5 6e		 cmp $6e,x
$06:a804  91 66		 sta ($66),y
$06:a806  99 46 b9	  sta $b946,y
$06:a809  8e 71 8a	  stx $8a71
$06:a80c  75 00		 adc $00,x
$06:a80e  ff 00 00 00   sbc $000000,x
$06:a812  00 00		 brk #$00
$06:a814  00 00		 brk #$00
$06:a816  00 00		 brk #$00
$06:a818  00 00		 brk #$00
$06:a81a  00 00		 brk #$00
$06:a81c  07 00		 ora [$00]
$06:a81e  3f 00 00 00   and $000000,x
$06:a822  00 00		 brk #$00
$06:a824  00 00		 brk #$00
$06:a826  00 00		 brk #$00
$06:a828  00 00		 brk #$00
$06:a82a  00 00		 brk #$00
$06:a82c  07 00		 ora [$00]
$06:a82e  3f 00 ff 10   and $10ff00,x
$06:a832  f7 18		 sbc [$18],y
$06:a834  ff 02 ff 92   sbc $92ff02,x
$06:a838  ff 40 6f 80   sbc $806f40,x
$06:a83c  ff 00 fd 18   sbc $18fd00,x
$06:a840  e7 b4		 sbc [$b4]
$06:a842  4b			phk
$06:a843  be 41 1a	  ldx $1a41,y
$06:a846  e5 b6		 sbc $b6
$06:a848  49 66 99	  eor #$9966
$06:a84b  aa			tax
$06:a84c  55 00		 eor $00,x
$06:a84e  ff 00 00 00   sbc $000000,x
$06:a852  00 00		 brk #$00
$06:a854  01 00		 ora ($00,x)
$06:a856  01 00		 ora ($00,x)
$06:a858  01 01		 ora ($01,x)
$06:a85a  03 01		 ora $01,s
$06:a85c  03 01		 ora $01,s
$06:a85e  03 00		 ora $00,s
$06:a860  00 00		 brk #$00
$06:a862  00 00		 brk #$00
$06:a864  01 00		 ora ($00,x)
$06:a866  01 00		 ora ($00,x)
$06:a868  01 01		 ora ($01,x)
$06:a86a  02 01		 cop #$01
$06:a86c  02 01		 cop #$01
$06:a86e  02 00		 cop #$00
$06:a870  00 00		 brk #$00
$06:a872  00 00		 brk #$00
$06:a874  00 00		 brk #$00
$06:a876  00 00		 brk #$00
$06:a878  00 00		 brk #$00
$06:a87a  ff 22 ff 00   sbc $00ff22,x
$06:a87e  ff 00 00 00   sbc $000000,x
$06:a882  00 00		 brk #$00
$06:a884  00 00		 brk #$00
$06:a886  00 00		 brk #$00
$06:a888  00 00		 brk #$00
$06:a88a  ff 77 88 00   sbc $008877,x
$06:a88e  ff 03 1f 06   sbc $061f03,x
$06:a892  1f 00 1f 00   ora $001f00,x
$06:a896  1d 00 19	  ora $1900,x
$06:a899  01 13		 ora ($13,x)
$06:a89b  01 13		 ora ($13,x)
$06:a89d  01 03		 ora ($03,x)
$06:a89f  00 1f		 brk #$1f
$06:a8a1  00 1f		 brk #$1f
$06:a8a3  00 1f		 brk #$1f
$06:a8a5  00 1d		 brk #$1d
$06:a8a7  00 19		 brk #$19
$06:a8a9  01 12		 ora ($12,x)
$06:a8ab  01 12		 ora ($12,x)
$06:a8ad  01 02		 ora ($02,x)
$06:a8af  00 03		 brk #$03
$06:a8b1  00 03		 brk #$03
$06:a8b3  01 03		 ora ($03,x)
$06:a8b5  02 03		 cop #$03
$06:a8b7  04 04		 tsb $04
$06:a8b9  04 0c		 tsb $0c
$06:a8bb  0c 0f 0b	  tsb $0b0f
$06:a8be  1f 01 02 01   ora $010201,x
$06:a8c2  02 00		 cop #$00
$06:a8c4  03 00		 ora $00,s
$06:a8c6  03 00		 ora $00,s
$06:a8c8  07 04		 ora [$04]
$06:a8ca  0b			phd
$06:a8cb  04 0b		 tsb $0b
$06:a8cd  08			php
$06:a8ce  17 0b		 ora [$0b],y
$06:a8d0  1f 07 1f 06   ora $061f07,x
$06:a8d4  1f 06 0f 00   ora $000f06,x
$06:a8d8  06 00		 asl $00
$06:a8da  02 00		 cop #$00
$06:a8dc  00 00		 brk #$00
$06:a8de  00 08		 brk #$08
$06:a8e0  17 08		 ora [$08],y
$06:a8e2  17 00		 ora [$00],y
$06:a8e4  1f 00 0f 00   ora $000f00,x
$06:a8e8  06 00		 asl $00
$06:a8ea  02 00		 cop #$00
$06:a8ec  00 00		 brk #$00
$06:a8ee  00 80		 brk #$80
$06:a8f0  ff 09 9f 00   sbc $009f09,x
$06:a8f4  17 08		 ora [$08],y
$06:a8f6  1f 01 1f 03   ora $031f01,x
$06:a8fa  1f 01 0f 00   ora $000f01,x
$06:a8fe  07 02		 ora [$02]
$06:a900  fd 0b 94	  sbc $940b,x
$06:a903  05 1a		 ora $1a
$06:a905  0c 13 0b	  tsb $0b13
$06:a908  14 0b		 trb $0b
$06:a90a  14 03		 trb $03
$06:a90c  0c 00 07	  tsb $0700
$06:a90f  8d 65 9f	  sta $9f65
$06:a912  7a			ply
$06:a913  fb			xce
$06:a914  7d 9f 15	  adc $159f,x
$06:a917  f7 84		 sbc [$84],y
$06:a919  7f fb 7f fc   adc $fc7ffb,x
$06:a91d  5f dc 9a 05   eor $059adc,x
$06:a921  8d 18 8a	  sta $8a18
$06:a924  1d ee 14	  ora $14ee,x
$06:a927  ff 84 7e fb   sbc $fb7e84,x
$06:a92b  53 fc		 eor ($fc,s),y
$06:a92d  73 fc		 adc ($fc,s),y
$06:a92f  b1 a6		 lda ($a6),y
$06:a931  f9 5e ff	  sbc $ff5e,y
$06:a934  be 79 28	  ldx $2879,y
$06:a937  ff 21 fe de   sbc $defe21,x
$06:a93b  76 73		 ror $73,x
$06:a93d  6a			ror a
$06:a93e  7a			ply
$06:a93f  59 a0 b1	  eor $b1a0,y
$06:a942  18			clc
$06:a943  51 b8		 eor ($b8),y
$06:a945  f7 28		 sbc [$28],y
$06:a947  ff 21 73 df   sbc $df7321,x
$06:a94b  8f 02 87 03   sta $038702
$06:a94f  1f 9f 5e de   ora $de5e9f,x
$06:a953  1c 9d 59	  trb $599d
$06:a956  db			stp
$06:a957  12 97		 ora ($97)
$06:a959  45 cf		 eor $cf
$06:a95b  0e 9f 4a	  asl $4a9f
$06:a95e  ff ec ed a1   sbc $a1edec,x
$06:a962  e3 e3		 sbc $e3,s
$06:a964  e7 a7		 sbc [$a7]
$06:a966  ef ef fe bf   sbc $bffeef
$06:a96a  ff ff fa bf   sbc $bffaff,x
$06:a96e  ea			nop
$06:a96f  ff 24 ff db   sbc $dbff24,x
$06:a973  01 ec		 ora ($ec,x)
$06:a975  08			php
$06:a976  2b			pld
$06:a977  15 47		 ora $47,x
$06:a979  13 7d		 ora ($7d,s),y
$06:a97b  ff ff da ff   sbc $ffdaff,x
$06:a97f  ff 24 ff db   sbc $dbff24,x
$06:a983  bf d3 43 fd   lda $fd43d3,x
$06:a987  d0 bf		 bne $a948
$06:a989  3f cf ff 01   and $01ffcf,x
$06:a98d  ff da 00 1f   sbc $1f00da,x
$06:a991  08			php
$06:a992  38			sec
$06:a993  15 70		 ora $70,x
$06:a995  10 77		 bpl $aa0e
$06:a997  00 7f		 brk #$7f
$06:a999  00 7f		 brk #$7f
$06:a99b  00 79		 brk #$79
$06:a99d  00 61		 brk #$61
$06:a99f  03 1c		 ora $1c,s
$06:a9a1  18			clc
$06:a9a2  27 30		 and [$30]
$06:a9a4  4f 36 49 38   eor $384936
$06:a9a8  47 20		 eor [$20]
$06:a9aa  5f 00 79 00   eor $007900,x
$06:a9ae  61 ff		 adc ($ff,x)
$06:a9b0  ff 85 ff 03   sbc $03ff85,x
$06:a9b4  83 06		 sta $06,s
$06:a9b6  86 0d		 stx $0d
$06:a9b8  8c 12 99	  sty $9912
$06:a9bb  26 b0		 rol $b0
$06:a9bd  65 e8		 adc $e8
$06:a9bf  ff ff ff 80   sbc $80ffff,x
$06:a9c3  82 7d 85	  brl $2f43
$06:a9c6  7b			tdc
$06:a9c7  8b			phb
$06:a9c8  77 97		 adc [$97],y
$06:a9ca  6f af 5f df   adc $df5faf
$06:a9ce  3f ff ff 25   and $25ffff,x
$06:a9d2  ff da ff 7d   sbc $7dffda,x
$06:a9d6  7f ae 3f 5a   adc $5a3fae,x
$06:a9da  1f cd 2f 54   ora $542fcd,x
$06:a9de  07 ff		 ora [$ff]
$06:a9e0  ff ff 25 7f   sbc $7f25ff,x
$06:a9e4  80 bf		 bra $a9a5
$06:a9e6  c0 df e0	  cpy #$e0df
$06:a9e9  ef f0 f7 f8   sbc $f8f7f0
$06:a9ed  fb			xce
$06:a9ee  fc ff ff	  jsr ($ffff,x)
$06:a9f1  c0 c0 bf	  cpy #$bfc0
$06:a9f4  bf bb bf bf   lda $bfbfbb,x
$06:a9f8  bf be bf bf   lda $bfbfbe,x
$06:a9fc  bf af bf ff   lda $ffbfaf,x
$06:aa00  ff ff c0 c0   sbc $c0c0ff,x
$06:aa04  80 c0		 bra $a9c6
$06:aa06  80 c0		 bra $a9c8
$06:aa08  80 c0		 bra $a9ca
$06:aa0a  80 c0		 bra $a9cc
$06:aa0c  80 c0		 bra $a9ce
$06:aa0e  80 ff		 bra $aa0f
$06:aa10  ff 03 03 fd   sbc $fd0303,x
$06:aa14  ff dd ff dd   sbc $ddffdd,x
$06:aa18  df fd ff fd   cmp $fdfffd,x
$06:aa1c  ff dd ff ff   sbc $ffffdd,x
$06:aa20  ff ff 03 01   sbc $0103ff,x
$06:aa24  01 01		 ora ($01,x)
$06:aa26  01 21		 ora ($21,x)
$06:aa28  01 01		 ora ($01,x)
$06:aa2a  01 01		 ora ($01,x)
$06:aa2c  01 01		 ora ($01,x)
$06:aa2e  01 ff		 ora ($ff,x)
$06:aa30  ff ff ff ff   sbc $ffffff,x
$06:aa34  ff ff ff ff   sbc $ffffff,x
$06:aa38  ff ff ff ff   sbc $ffffff,x
$06:aa3c  ff ff ff ff   sbc $ffffff,x
$06:aa40  ff ff ff ff   sbc $ffffff,x
$06:aa44  ff ff ff ff   sbc $ffffff,x
$06:aa48  ff ff ff ff   sbc $ffffff,x
$06:aa4c  ff ff ff 00   sbc $00ffff,x
$06:aa50  ff 00 ff 7f   sbc $7fff00,x
$06:aa54  80 7f		 bra $aad5
$06:aa56  80 00		 bra $aa58
$06:aa58  ff 00 ff 7f   sbc $7fff00,x
$06:aa5c  80 7f		 bra $aadd
$06:aa5e  80 55		 bra $aab5
$06:aa60  aa			tax
$06:aa61  55 aa		 eor $aa,x
$06:aa63  00 ff		 brk #$ff
$06:aa65  00 ff		 brk #$ff
$06:aa67  2a			rol a
$06:aa68  d5 2a		 cmp $2a,x
$06:aa6a  d5 00		 cmp $00,x
$06:aa6c  ff 00 ff 00   sbc $00ff00,x
$06:aa70  ff 00 ff ff   sbc $ffff00,x
$06:aa74  00 ff		 brk #$ff
$06:aa76  00 00		 brk #$00
$06:aa78  ff 00 ff ff   sbc $ffff00,x
$06:aa7c  00 ff		 brk #$ff
$06:aa7e  00 55		 brk #$55
$06:aa80  aa			tax
$06:aa81  55 aa		 eor $aa,x
$06:aa83  00 ff		 brk #$ff
$06:aa85  00 ff		 brk #$ff
$06:aa87  aa			tax
$06:aa88  55 aa		 eor $aa,x
$06:aa8a  55 00		 eor $00,x
$06:aa8c  ff 00 ff 00   sbc $00ff00,x
$06:aa90  ff 00 ff 28   sbc $28ff00,x
$06:aa94  3f 14 17 00   and $001714,x
$06:aa98  ff 00 ff a8   sbc $a8ff00,x
$06:aa9c  2f 14 1f 00   and $001f14
$06:aaa0  ff 00 ff 3e   sbc $3eff00,x
$06:aaa4  c1 16		 cmp ($16,x)
$06:aaa6  e9 00 ff	  sbc #$ff00
$06:aaa9  00 ff		 brk #$ff
$06:aaab  2e d1 1e	  rol $1ed1
$06:aaae  e1 00		 sbc ($00,x)
$06:aab0  ff 4a 87 32   sbc $32874a,x
$06:aab4  b2 48		 lda ($48)
$06:aab6  f7 44		 sbc [$44],y
$06:aab8  f8			sed
$06:aab9  32 bb		 and ($bb)
$06:aabb  02 8a		 cop #$8a
$06:aabd  37 cf		 and [$cf],y
$06:aabf  00 ff		 brk #$ff
$06:aac1  78			sei
$06:aac2  87 4d		 sta [$4d]
$06:aac4  80 08		 bra $aace
$06:aac6  87 07		 sta [$07]
$06:aac8  88			dey
$06:aac9  44 88 75	  mvp $75,$88
$06:aacc  88			dey
$06:aacd  30 c8		 bmi $aa97
$06:aacf  00 ff		 brk #$ff
$06:aad1  52 e1		 eor ($e1)
$06:aad3  4c 4d 12	  jmp $124d
$06:aad6  ef 22 3f cc   sbc $cc3f22
$06:aada  fd 80 f1	  sbc $f180,x
$06:aadd  8c b3 00	  sty $00b3
$06:aae0  ff 1e e1 b2   sbc $b2e11e,x
$06:aae4  01 10		 ora ($10,x)
$06:aae6  e1 c0		 sbc ($c0,x)
$06:aae8  11 02		 ora ($02),y
$06:aaea  11 0e		 ora ($0e),y
$06:aaec  11 4c		 ora ($4c),y
$06:aaee  13 ff		 ora ($ff,s),y
$06:aaf0  ff 27 f9 db   sbc $dbf927,x
$06:aaf4  e3 6f		 sbc $6f,s
$06:aaf6  89 7f 2b	  bit #$2b7f
$06:aaf9  df 29 97 ab   cmp $ab9729,x
$06:aafd  3f 29 fe ff   and $fffe29,x
$06:ab01  27 f9		 and [$f9]
$06:ab03  df e3 7f 89   cmp $897fe3,x
$06:ab07  ff 2b df 29   sbc $29df2b,x
$06:ab0b  d7 ab		 cmp [$ab],y
$06:ab0d  ff 29 5c d0   sbc $d05c29,x
$06:ab11  5c d0 5c d0   jml $d05cd0
$06:ab15  5c d0 5c d0   jml $d05cd0
$06:ab19  5c d0 5c d0   jml $d05cd0
$06:ab1d  5c d0 7f f0   jml $f07fd0
$06:ab21  7f f0 7f f0   adc $f07ff0,x
$06:ab25  7f f0 7f f0   adc $f07ff0,x
$06:ab29  7f f0 7f f0   adc $f07ff0,x
$06:ab2d  7f f0 aa db   adc $dbaaf0,x
$06:ab31  aa			tax
$06:ab32  db			stp
$06:ab33  aa			tax
$06:ab34  db			stp
$06:ab35  aa			tax
$06:ab36  db			stp
$06:ab37  aa			tax
$06:ab38  db			stp
$06:ab39  aa			tax
$06:ab3a  db			stp
$06:ab3b  aa			tax
$06:ab3c  db			stp
$06:ab3d  aa			tax
$06:ab3e  db			stp
$06:ab3f  06 03		 asl $03
$06:ab41  06 03		 asl $03
$06:ab43  06 03		 asl $03
$06:ab45  06 03		 asl $03
$06:ab47  06 03		 asl $03
$06:ab49  06 03		 asl $03
$06:ab4b  06 03		 asl $03
$06:ab4d  06 03		 asl $03
$06:ab4f  bc 0c 67	  ldy $670c,x
$06:ab52  60			rts
$06:ab53  de 40 b3	  dec $b340,x
$06:ab56  11 ad		 ora ($ad),y
$06:ab58  80 ef		 bra $ab49
$06:ab5a  80 77		 bra $abd3
$06:ab5c  00 5e		 brk #$5e
$06:ab5e  10 0c		 bpl $ab6c
$06:ab60  f3 60		 sbc ($60,s),y
$06:ab62  9f 40 bf 11   sta $11bf40,x
$06:ab66  ee 88 7f	  inc $7f88
$06:ab69  81 7f		 sta ($7f,x)
$06:ab6b  02 ff		 cop #$ff
$06:ab6d  14 ef		 trb $ef
$06:ab6f  ff 24 ff db   sbc $dbff24,x
$06:ab73  6b			rtl
$06:ab74  8c 54 ff	  sty $ff54
$06:ab77  bd ee 1b	  lda $1bee,x
$06:ab7a  72 e5		 adc ($e5)
$06:ab7c  ff 5b ff ff   sbc $ffff5b,x
$06:ab80  24 ff		 bit $ff
$06:ab82  db			stp
$06:ab83  f2 ff		 sbc ($ff)
$06:ab85  4c bb ab	  jmp $abbb
$06:ab88  d7 ce		 cmp [$ce],y
$06:ab8a  bd ff 80	  lda $80ff,x
$06:ab8d  ff 5b 78 78   sbc $78785b,x
$06:ab91  30 78		 bmi $ac0b
$06:ab93  00 30		 brk #$30
$06:ab95  00 00		 brk #$00
$06:ab97  00 00		 brk #$00
$06:ab99  00 00		 brk #$00
$06:ab9b  00 00		 brk #$00
$06:ab9d  00 00		 brk #$00
$06:ab9f  00 78		 brk #$78
$06:aba1  00 78		 brk #$78
$06:aba3  00 30		 brk #$30
$06:aba5  00 00		 brk #$00
$06:aba7  00 00		 brk #$00
$06:aba9  00 00		 brk #$00
$06:abab  00 00		 brk #$00
$06:abad  00 00		 brk #$00
$06:abaf  d0 e2		 bne $ab93
$06:abb1  ba			tsx
$06:abb2  b2 1c		 lda ($1c)
$06:abb4  98			tya
$06:abb5  8f 8d 07 86   sta $86078d
$06:abb9  83 83		 sta $83,s
$06:abbb  92 80		 sta ($80)
$06:abbd  6d ed df	  adc $dfed
$06:abc0  3f ad 5f 97   and $975fad,x
$06:abc4  6f 8a 77 85   adc $85778a
$06:abc8  7b			tdc
$06:abc9  82 7d 80	  brl $2c49
$06:abcc  7f ed 12 ec   adc $ec12ed,x
$06:abd0  07 0c		 ora [$0c]
$06:abd2  1f 94 37 02   ora $023794,x
$06:abd6  63 02		 adc $02,s
$06:abd8  c3 03		 cmp $03,s
$06:abda  81 dd		 sta ($dd,x)
$06:abdc  01 6f		 ora ($6f,x)
$06:abde  6f fb fc f7   adc $f7fcfb
$06:abe2  f8			sed
$06:abe3  e7 f8		 sbc [$f8]
$06:abe5  c3 fc		 cmp $fc,s
$06:abe7  83 fc		 sta $fc,s
$06:abe9  01 fe		 ora ($fe,x)
$06:abeb  01 fe		 ora ($fe,x)
$06:abed  6f 90 af af   adc $afaf90
$06:abf1  bd bf bd	  lda $bdbf,x
$06:abf4  bd bf bf	  lda $bfbf,x
$06:abf7  b7 bf		 lda [$bf],y
$06:abf9  b7 b7		 lda [$b7],y
$06:abfb  ba			tsx
$06:abfc  bf b5 bf d0   lda $d0bfb5,x
$06:ac00  80 c0		 bra $abc2
$06:ac02  80 c2		 bra $abc6
$06:ac04  80 c0		 bra $abc6
$06:ac06  80 c0		 bra $abc8
$06:ac08  80 c8		 bra $abd2
$06:ac0a  80 c0		 bra $abcc
$06:ac0c  80 c0		 bra $abce
$06:ac0e  80 f5		 bra $ac05
$06:ac10  f7 dd		 sbc [$dd],y
$06:ac12  df fd ff ed   cmp $edfffd,x
$06:ac16  ff ed ef 7d   sbc $7defed,x
$06:ac1a  7f ad f3 55   adc $55f3ad,x
$06:ac1e  ab			plb
$06:ac1f  09 01 21	  ora #$2101
$06:ac22  01 01		 ora ($01,x)
$06:ac24  01 01		 ora ($01,x)
$06:ac26  01 11		 ora ($11,x)
$06:ac28  01 81		 ora ($81,x)
$06:ac2a  01 01		 ora ($01,x)
$06:ac2c  01 01		 ora ($01,x)
$06:ac2e  01 00		 ora ($00,x)
$06:ac30  ff 00 ff 40   sbc $40ff00,x
$06:ac34  ff 44 ff 00   sbc $00ff44,x
$06:ac38  ff 00 ff 34   sbc $34ff00,x
$06:ac3c  ff 30 ff 00   sbc $00ff30,x
$06:ac40  ff ef 10 ef   sbc $ef10ef,x
$06:ac44  10 ef		 bpl $ac35
$06:ac46  10 00		 bpl $ac48
$06:ac48  ff 7f 80 7f   sbc $7f807f,x
$06:ac4c  80 7f		 bra $accd
$06:ac4e  80 01		 bra $ac51
$06:ac50  72 d1		 adc ($d1)
$06:ac52  4e c9 be	  lsr $bec9
$06:ac55  44 69 56	  mvp $56,$69
$06:ac58  ff 75 ff 7f   sbc $7fff75,x
$06:ac5c  ff 78 ff a4   sbc $a4ff78,x
$06:ac60  df 7b f7 ce   cmp $cef77b,x
$06:ac64  71 6e		 adc ($6e),y
$06:ac66  df ff 46 ff   cmp $ff46ff,x
$06:ac6a  24 ff		 bit $ff
$06:ac6c  2f ff 18 ab   and $ab18ff
$06:ac70  9d 0a 57	  sta $570a,x
$06:ac73  52 f9		 eor ($f9)
$06:ac75  aa			tax
$06:ac76  df 6b ff ac   cmp $acff6b,x
$06:ac7a  ff fe ff 18   sbc $18fffe,x
$06:ac7e  ff ef 73 9f   sbc $9f73ef,x
$06:ac82  eb			xba
$06:ac83  f7 0e		 sbc [$0e],y
$06:ac85  bf 72 ff 63   lda $63ff72,x
$06:ac89  ff 24 ff f4   sbc $f4ff24,x
$06:ac8d  ff 18 c3 7f   sbc $7fc318,x
$06:ac91  51 6a		 eor ($6a),y
$06:ac93  a1 fd		 lda ($fd,x)
$06:ac95  03 7e		 ora $7e,s
$06:ac97  99 f7 41	  sta $41f7,y
$06:ac9a  7d a1 da	  adc $daa1,x
$06:ac9d  57 7d		 eor [$7d],y
$06:ac9f  81 01		 sta ($01,x)
$06:aca1  85 00		 sta $00
$06:aca3  03 01		 ora $01,s
$06:aca5  81 00		 sta ($00,x)
$06:aca7  01 01		 ora ($01,x)
$06:aca9  83 01		 sta $01,s
$06:acab  05 00		 ora $00
$06:acad  81 01		 sta ($01,x)
$06:acaf  ee 07 08	  inc $0807
$06:acb2  19 92 31	  ora $3192,y
$06:acb5  02 63		 cop #$63
$06:acb7  02 c1		 cop #$c1
$06:acb9  03 81		 ora $81,s
$06:acbb  df 01 6e 6f   cmp $6f6e01,x
$06:acbf  fb			xce
$06:acc0  fc f1 fe	  jsr ($fef1,x)
$06:acc3  e1 fe		 sbc ($fe,x)
$06:acc5  c3 fc		 cmp $fc,s
$06:acc7  81 fe		 sta ($fe,x)
$06:acc9  01 fe		 ora ($fe,x)
$06:accb  01 fe		 ora ($fe,x)
$06:accd  6f 90 c0 ff   adc $ffc090
$06:acd1  e0 f3 c8	  cpx #$c8f3
$06:acd4  f3 c4		 sbc ($c4,s),y
$06:acd6  f3 28		 sbc ($28,s),y
$06:acd8  f7 e6		 sbc [$e6],y
$06:acda  19 96 9f	  ora $9f96,y
$06:acdd  98			tya
$06:acde  77 00		 adc [$00],y
$06:ace0  1f 0c 13 0c   ora $0c130c,x
$06:ace4  13 0c		 ora ($0c,s),y
$06:ace6  13 08		 ora ($08,s),y
$06:ace8  17 e6		 ora [$e6],y
$06:acea  19 60 81	  ora $8160,y
$06:aced  88			dey
$06:acee  71 d7		 adc ($d7),y
$06:acf0  4b			phk
$06:acf1  57 c9		 eor [$c9],y
$06:acf3  77 7b		 adc [$7b],y
$06:acf5  af 09 6f 7b   lda $7b6f09
$06:acf9  a7 c1		 lda [$c1]
$06:acfb  6b			rtl
$06:acfc  9b			txy
$06:acfd  97 fd		 sta [$fd],y
$06:acff  b7 0b		 lda [$0b],y
$06:ad01  77 c9		 adc [$c9],y
$06:ad03  a7 eb		 lda [$eb]
$06:ad05  ff c9 a7 e3   sbc $e3a7c9,x
$06:ad09  3f c1 47 83   and $8347c1,x
$06:ad0d  03 01		 ora $01,s
$06:ad0f  5c d0 dc 90   jml $90dcd0
$06:ad13  9c 90 9c	  stz $9c90
$06:ad16  90 bc		 bcc $acd4
$06:ad18  d0 9c		 bne $acb6
$06:ad1a  e0 ba c4	  cpx #$c4ba
$06:ad1d  81 82		 sta ($82,x)
$06:ad1f  7f f0 ff b0   adc $b0fff0,x
$06:ad23  ff b0 ff b0   sbc $b0ffb0,x
$06:ad27  bf 90 9f 80   lda $809f90,x
$06:ad2b  83 80		 sta $80,s
$06:ad2d  fc 80 aa	  jsr ($aa80,x)
$06:ad30  db			stp
$06:ad31  ab			plb
$06:ad32  d9 ab db	  cmp $dbab,y
$06:ad35  ab			plb
$06:ad36  db			stp
$06:ad37  ad db a1	  lda $a1db
$06:ad3a  d7 5d		 cmp [$5d],y
$06:ad3c  63 81		 adc $81,s
$06:ad3e  41 06		 eor ($06,x)
$06:ad40  03 07		 ora $07,s
$06:ad42  01 05		 ora ($05,x)
$06:ad44  01 05		 ora ($05,x)
$06:ad46  01 05		 ora ($05,x)
$06:ad48  01 09		 ora ($09,x)
$06:ad4a  01 81		 ora ($81,x)
$06:ad4c  01 3f		 ora ($3f,x)
$06:ad4e  01 e6		 ora ($e6,x)
$06:ad50  80 db		 bra $ad2d
$06:ad52  a4 15		 ldy $15
$06:ad54  ff 37 e5 1a   sbc $1ae537,x
$06:ad58  f3 06		 sbc ($06,s),y
$06:ad5a  f8			sed
$06:ad5b  37 e5		 and [$e5],y
$06:ad5d  13 e7		 ora ($e7,s),y
$06:ad5f  ff 80 db a4   sbc $a4db80,x
$06:ad63  15 ff		 ora $ff,x
$06:ad65  1a			inc a
$06:ad66  e0 0c f0	  cpx #$f00c
$06:ad69  07 f8		 ora [$f8]
$06:ad6b  1a			inc a
$06:ad6c  e0 18 e0	  cpx #$e018
$06:ad6f  66 01		 ror $01
$06:ad71  da			phx
$06:ad72  25 55		 and $55
$06:ad74  ff f0 bf 4c   sbc $4cbff0,x
$06:ad78  cf d4 f7 3e   cmp $3ef7d4
$06:ad7c  8b			phb
$06:ad7d  6e b5 fe	  ror $feb5
$06:ad80  01 da		 ora ($da,x)
$06:ad82  25 55		 and $55
$06:ad84  ff 50 3f 34   sbc $343f50,x
$06:ad88  0f 08 07 76   ora $760708
$06:ad8c  03 4a		 ora $4a,s
$06:ad8e  01 7e		 ora ($7e,x)
$06:ad90  e6 d5		 inc $d5
$06:ad92  99 dc 98	  sta $98dc,y
$06:ad95  e5 c0		 sbc $c0
$06:ad97  ff ec eb ce   sbc $ceebec,x
$06:ad9b  ed cd f3	  sbc $f3cd
$06:ad9e  c0 59 e4	  cpy #$e459
$06:ada1  66 80		 ror $80
$06:ada3  67 80		 adc [$80]
$06:ada5  bf c0 d3 ec   lda $ecd3c0,x
$06:ada9  f1 c2		 sbc ($c2),y
$06:adab  b2 c1		 lda ($c1)
$06:adad  bf c0 a7 ef   lda $efa7c0,x
$06:adb1  50 5f		 bvc $ae12
$06:adb3  84 8f		 sty $8f
$06:adb5  5a			phy
$06:adb6  0f ea 1f c2   ora $c21fea
$06:adba  bf 96 7f 4c   lda $4c7f96,x
$06:adbe  ff 17 0f a0   sbc $a00f17,x
$06:adc2  0f 70 09 f0   ora $f00970
$06:adc6  0b			phd
$06:adc7  e0 13 40	  cpx #$4013
$06:adca  b3 80		 lda ($80,s),y
$06:adcc  73 00		 adc ($00,s),y
$06:adce  83 a5		 sta $a5,s
$06:add0  3c a5 bd	  bit $bda5,x
$06:add3  99 18 bd	  sta $bd18,y
$06:add6  24 db		 bit $db
$06:add8  db			stp
$06:add9  e7 bd		 sbc [$bd]
$06:addb  a5 3c		 lda $3c
$06:addd  a5 3c		 lda $3c
$06:addf  c3 00		 cmp $00,s
$06:ade1  c3 81		 cmp $81,s
$06:ade3  e7 00		 sbc [$00]
$06:ade5  ff 24 e7 c3   sbc $c3e724,x
$06:ade9  c3 81		 cmp $81,s
$06:adeb  c3 00		 cmp $00,s
$06:aded  c3 00		 cmp $00,s
$06:adef  5a			phy
$06:adf0  66 da		 ror $da
$06:adf2  66 5a		 ror $5a
$06:adf4  66 da		 ror $da
$06:adf6  66 5a		 ror $5a
$06:adf8  66 da		 ror $da
$06:adfa  66 5a		 ror $5a
$06:adfc  66 da		 ror $da
$06:adfe  66 81		 ror $81
$06:ae00  00 81		 brk #$81
$06:ae02  00 81		 brk #$81
$06:ae04  00 81		 brk #$81
$06:ae06  00 81		 brk #$81
$06:ae08  00 81		 brk #$81
$06:ae0a  00 81		 brk #$81
$06:ae0c  00 81		 brk #$81
$06:ae0e  00 c0		 brk #$c0
$06:ae10  00 f0		 brk #$f0
$06:ae12  c0 fc f0	  cpy #$f0fc
$06:ae15  ff cc c3 83   sbc $83c3cc,x
$06:ae19  ff bd db bd   sbc $bddbbd,x
$06:ae1d  c3 bd		 cmp $bd,s
$06:ae1f  ff 00 ff c0   sbc $c0ff00,x
$06:ae23  ff f0 b7 cc   sbc $ccb7f0,x
$06:ae27  fd 83 c3	  sbc $c383,x
$06:ae2a  81 c3		 sta ($c3,x)
$06:ae2c  81 c3		 sta ($c3,x)
$06:ae2e  81 55		 sta ($55,x)
$06:ae30  55 55		 eor $55,x
$06:ae32  55 55		 eor $55,x
$06:ae34  55 55		 eor $55,x
$06:ae36  55 55		 eor $55,x
$06:ae38  55 55		 eor $55,x
$06:ae3a  55 55		 eor $55,x
$06:ae3c  55 55		 eor $55,x
$06:ae3e  55 aa		 eor $aa,x
$06:ae40  00 aa		 brk #$aa
$06:ae42  00 aa		 brk #$aa
$06:ae44  00 aa		 brk #$aa
$06:ae46  00 aa		 brk #$aa
$06:ae48  00 aa		 brk #$aa
$06:ae4a  00 aa		 brk #$aa
$06:ae4c  00 aa		 brk #$aa
$06:ae4e  00 aa		 brk #$aa
$06:ae50  ff aa ff aa   sbc $aaffaa,x
$06:ae54  ff aa ff aa   sbc $aaffaa,x
$06:ae58  ff aa ff aa   sbc $aaffaa,x
$06:ae5c  ff aa ff 00   sbc $00ffaa,x
$06:ae60  00 00		 brk #$00
$06:ae62  00 00		 brk #$00
$06:ae64  00 00		 brk #$00
$06:ae66  00 00		 brk #$00
$06:ae68  00 00		 brk #$00
$06:ae6a  00 00		 brk #$00
$06:ae6c  00 00		 brk #$00
$06:ae6e  00 02		 brk #$02
$06:ae70  ff 14 ff ff   sbc $ffff14,x
$06:ae74  ff 00 ff aa   sbc $aaff00,x
$06:ae78  ff fb fb bf   sbc $bffbfb,x
$06:ae7c  ff 2f 3f ff   sbc $ff3f2f,x
$06:ae80  00 ff		 brk #$ff
$06:ae82  14 ff		 trb $ff
$06:ae84  ff 00 00 00   sbc $000000,x
$06:ae88  00 c4		 brk #$c4
$06:ae8a  c0 f0 30	  cpy #$30f0
$06:ae8d  3c cc 6a	  bit $6acc,x
$06:ae90  ff 80 ff ff   sbc $ffff80,x
$06:ae94  ff 00 ff ab   sbc $abff00,x
$06:ae98  ff db db 7c   sbc $7cdbdb,x
$06:ae9c  7f f2 ff ff   adc $fffff2,x
$06:aea0  00 ff		 brk #$ff
$06:aea2  80 ff		 bra $aea3
$06:aea4  ff 00 00 00   sbc $000000,x
$06:aea8  00 27		 brk #$27
$06:aeaa  03 8f		 ora $8f,s
$06:aeac  0c 3f 30	  tsb $303f
$06:aeaf  c1 01		 cmp ($01,x)
$06:aeb1  eb			xba
$06:aeb2  48			pha
$06:aeb3  81 01		 sta ($01,x)
$06:aeb5  59 10 83	  eor $8310,y
$06:aeb8  02 e1		 cop #$e1
$06:aeba  40			rti
$06:aebb  55 10		 eor $10,x
$06:aebd  81 00		 sta ($00,x)
$06:aebf  ff 01 b7 00   sbc $00b701,x
$06:aec3  ff 01 ef 00   sbc $00ef01,x
$06:aec7  fd 00 bf	  sbc $bf00,x
$06:aeca  00 ef		 brk #$ef
$06:aecc  00 ff		 brk #$ff
$06:aece  00 aa		 brk #$aa
$06:aed0  ff 80 ff d5   sbc $d5ff80,x
$06:aed4  ff ff ff c0   sbc $c0ffff,x
$06:aed8  ff 95 ff af   sbc $afff95,x
$06:aedc  ff 9f ff ff   sbc $ffff9f,x
$06:aee0  80 ff		 bra $aee1
$06:aee2  80 ff		 bra $aee3
$06:aee4  d5 ff		 cmp $ff,x
$06:aee6  ff c0 c0 80   sbc $80c0c0,x
$06:aeea  80 80		 bra $ae6c
$06:aeec  80 80		 bra $ae6e
$06:aeee  80 a9		 bra $ae99
$06:aef0  ff 8b ff 55   sbc $55ff8b,x
$06:aef4  ff fe ff 03   sbc $03fffe,x
$06:aef8  ff 55 ff 6f   sbc $6fff55,x
$06:aefc  6f ff ff ff   adc $ffffff
$06:af00  01 ff		 ora ($ff,x)
$06:af02  8b			phb
$06:af03  ff 55 ff fe   sbc $feff55,x
$06:af07  03 02		 ora $02,s
$06:af09  01 01		 ora ($01,x)
$06:af0b  91 01		 sta ($01),y
$06:af0d  01 01		 ora ($01,x)
$06:af0f  c0 c0 ff	  cpy #$ffc0
$06:af12  64 80		 stz $80
$06:af14  00 9f		 brk #$9f
$06:af16  00 98		 brk #$98
$06:af18  18			clc
$06:af19  9b			txy
$06:af1a  9d 88 82	  sta $8288,x
$06:af1d  19 55 ff	  ora $ff55,y
$06:af20  c0 ff 64	  cpy #$64ff
$06:af23  ff 00 ff 00   sbc $00ff00,x
$06:af27  e7 00		 sbc [$00]
$06:af29  ea			nop
$06:af2a  07 f9		 ora [$f9]
$06:af2c  1f a1 fe 03   ora $03fea1,x
$06:af30  03 ff		 ora $ff,s
$06:af32  26 01		 rol $01
$06:af34  00 f9		 brk #$f9
$06:af36  18			clc
$06:af37  19 00 d9	  ora $d900,y
$06:af3a  b1 51		 lda ($51),y
$06:af3c  49 88 ba	  eor #$ba88
$06:af3f  ff 03 ff 26   sbc $26ff03,x
$06:af43  ff 00 ff 18   sbc $18ff00,x
$06:af47  ff 00 cf 70   sbc $70cf00,x
$06:af4b  17 f8		 ora [$f8],y
$06:af4d  95 6f		 sta $6f,x
$06:af4f  0d f1 13	  ora $13f1
$06:af52  e7 1e		 sbc [$1e]
$06:af54  f4 7b ce	  pea $ce7b
$06:af57  6d cb 3d	  adc $3dcb
$06:af5a  e7 d6		 sbc [$d6]
$06:af5c  9c c9 89	  stz $89c9
$06:af5f  0e f0 18	  asl $18f0
$06:af62  e0 0b f0	  cpx #$f00b
$06:af65  31 ce		 and ($ce),y
$06:af67  34 c2		 bit $c2,x
$06:af69  18			clc
$06:af6a  e7 63		 sbc [$63]
$06:af6c  80 76		 bra $afe4
$06:af6e  80 5d		 bra $afcd
$06:af70  df 76 f6 d1   cmp $d1f676,x
$06:af74  e0 7f 6f	  cpx #$6f7f
$06:af77  56 55		 lsr $55,x
$06:af79  d2 21		 cmp ($21)
$06:af7b  3c 13 d7	  bit $d713,x
$06:af7e  cf 20 48 09   cmp $094820
$06:af82  30 1f		 bmi $afa3
$06:af84  00 91		 brk #$91
$06:af86  0f aa 41 de   ora $de41aa
$06:af8a  21 fc		 and ($fc,x)
$06:af8c  13 37		 ora ($37,s),y
$06:af8e  0f be ea b3   ora $b3eabe
$06:af92  e1 ba		 sbc ($ba,x)
$06:af94  ed bd ec	  sbc $ecbd
$06:af97  b2 e0		 lda ($e0)
$06:af99  9d f1 5c	  sta $5cf1,x
$06:af9c  f8			sed
$06:af9d  6f fe 95 ea   adc $ea95fe
$06:afa1  be e0 92	  ldx $92e0,y
$06:afa4  e1 93		 sbc ($93,x)
$06:afa6  e0 9f e0	  cpx #$e09f
$06:afa9  8e f0 07	  stx $07f0
$06:afac  f8			sed
$06:afad  01 fe		 ora ($fe,x)
$06:afaf  14 f7		 trb $f7
$06:afb1  ea			nop
$06:afb2  eb			xba
$06:afb3  16 e7		 asl $e7,x
$06:afb5  32 e3		 and ($e3)
$06:afb7  76 13		 ror $13,x
$06:afb9  48			pha
$06:afba  47 ba		 eor [$ba]
$06:afbc  0f f6 bf 08   ora $08bff6
$06:afc0  03 14		 ora $14,s
$06:afc2  e3 18		 sbc $18,s
$06:afc4  e3 1c		 sbc $1c,s
$06:afc6  e3 ec		 sbc $ec,s
$06:afc8  03 b8		 ora $b8,s
$06:afca  07 f0		 ora [$f0]
$06:afcc  0f 40 bf bd   ora $bdbf40
$06:afd0  99 df d7	  sta $d7df,y
$06:afd3  b1 9d		 lda ($9d),y
$06:afd5  a5 85		 lda $85
$06:afd7  db			stp
$06:afd8  81 bd		 sta ($bd,x)
$06:afda  b9 78 00	  lda $0078,y
$06:afdd  ff ff ff 99   sbc $99ffff,x
$06:afe1  e3 c3		 sbc $c3,s
$06:afe3  e3 81		 sbc $81,s
$06:afe5  fb			xce
$06:afe6  81 ff		 sta ($ff,x)
$06:afe8  81 7e		 sta ($7e,x)
$06:afea  38			sec
$06:afeb  ff 00 00 00   sbc $000000,x
$06:afef  5a			phy
$06:aff0  66 e7		 ror $e7
$06:aff2  19 7e 5a	  ora $5a7e,y
$06:aff5  81 3c		 sta ($3c,x)
$06:aff7  ff bd c3 81   sbc $81c3bd,x
$06:affb  7f c3 7f ff   adc $ff7fc3,x
$06:afff  81 00		 sta ($00,x)
$06:b001  80 00		 bra $b003
$06:b003  81 00		 sta ($00,x)
$06:b005  c3 00		 cmp $00,s
$06:b007  c3 81		 cmp $81,s
$06:b009  ff 81 ff 43   sbc $43ff81,x
$06:b00d  ff 7f 55 55   sbc $55557f,x
$06:b011  55 55		 eor $55,x
$06:b013  55 55		 eor $55,x
$06:b015  55 55		 eor $55,x
$06:b017  57 54		 eor [$54],y
$06:b019  5c 50 70 40   jml $407050
$06:b01d  c0 00 aa	  cpy #$aa00
$06:b020  00 aa		 brk #$aa
$06:b022  00 aa		 brk #$aa
$06:b024  00 aa		 brk #$aa
$06:b026  00 ab		 brk #$ab
$06:b028  00 af		 brk #$af
$06:b02a  00 bf		 brk #$bf
$06:b02c  00 ff		 brk #$ff
$06:b02e  00 57		 brk #$57
$06:b030  54 5c 50	  mvn $50,$5c
$06:b033  70 40		 bvs $b075
$06:b035  c0 00 03	  cpy #$0300
$06:b038  00 0f		 brk #$0f
$06:b03a  03 3f		 ora $3f,s
$06:b03c  0f ff 3f ab   ora $ab3fff
$06:b040  00 af		 brk #$af
$06:b042  00 bf		 brk #$bf
$06:b044  00 ff		 brk #$ff
$06:b046  00 ff		 brk #$ff
$06:b048  00 ff		 brk #$ff
$06:b04a  03 ff		 ora $ff,s
$06:b04c  0f ff 3f ea   ora $ea3fff
$06:b050  3f 3a 0f 0e   and $0e0f3a,x
$06:b054  03 03		 ora $03,s
$06:b056  00 c0		 brk #$c0
$06:b058  00 f0		 brk #$f0
$06:b05a  c0 fc f0	  cpy #$f0fc
$06:b05d  ff fc c0 00   sbc $00c0fc,x
$06:b061  f0 00		 beq $b063
$06:b063  fc 00 ff	  jsr ($ff00,x)
$06:b066  00 ff		 brk #$ff
$06:b068  00 ff		 brk #$ff
$06:b06a  c0 ff f0	  cpy #$f0ff
$06:b06d  ff fc aa ff   sbc $ffaafc,x
$06:b071  aa			tax
$06:b072  ff aa ff aa   sbc $aaffaa,x
$06:b076  ff ea 3f 3a   sbc $3a3fea,x
$06:b07a  0f 0e 03 03   ora $03030e
$06:b07e  00 00		 brk #$00
$06:b080  00 00		 brk #$00
$06:b082  00 00		 brk #$00
$06:b084  00 00		 brk #$00
$06:b086  00 c0		 brk #$c0
$06:b088  00 f0		 brk #$f0
$06:b08a  00 fc		 brk #$fc
$06:b08c  00 ff		 brk #$ff
$06:b08e  00 00		 brk #$00
$06:b090  ff 40 7f a0   sbc $a07f40,x
$06:b094  3f 7d fc 5b   and $5bfc7d,x
$06:b098  f8			sed
$06:b099  5f ff 6a ff   eor $ff6aff,x
$06:b09d  80 ff		 bra $b09e
$06:b09f  94 6b		 sty $6b,x
$06:b0a1  6a			ror a
$06:b0a2  95 20		 sta $20,x
$06:b0a4  df 9c 63 78   cmp $78639c,x
$06:b0a8  87 e3		 sta [$e3]
$06:b0aa  1c 95 6a	  trb $6a95
$06:b0ad  7f 80 0b f8   adc $f80b80,x
$06:b0b1  2b			pld
$06:b0b2  f8			sed
$06:b0b3  34 ff		 bit $ff,x
$06:b0b5  2b			pld
$06:b0b6  ff 9f 3f aa   sbc $aa3f9f,x
$06:b0ba  3f f4 ff 04   and $04fff4,x
$06:b0be  ff 18 e7 78   sbc $78e718,x
$06:b0c2  87 eb		 sta [$eb]
$06:b0c4  14 14		 trb $14
$06:b0c6  eb			xba
$06:b0c7  00 ff		 brk #$ff
$06:b0c9  35 ca		 and $ca,x
$06:b0cb  6b			rtl
$06:b0cc  94 fb		 sty $fb,x
$06:b0ce  04 ff		 tsb $ff
$06:b0d0  ff 21 ff c1   sbc $c1ff21,x
$06:b0d4  c1 62		 cmp ($62,x)
$06:b0d6  61 b1		 adc ($b1,x)
$06:b0d8  31 4a		 and ($4a),y
$06:b0da  19 c6 2d	  ora $2dc6,y
$06:b0dd  47 17		 eor [$17]
$06:b0df  ff ff ff 21   sbc $21ffff,x
$06:b0e3  41 bf		 eor ($bf,x)
$06:b0e5  a1 de		 lda ($de,x)
$06:b0e7  d1 ef		 cmp ($ef),y
$06:b0e9  e9 f6 f5	  sbc #$f5f6
$06:b0ec  fa			plx
$06:b0ed  fb			xce
$06:b0ee  fd 87 ff	  sbc $ff87,x
$06:b0f1  78			sei
$06:b0f2  fe 50 da	  inc $da50,x
$06:b0f5  42 f5		 wdm #$f5
$06:b0f7  90 f6		 bcc $b0ef
$06:b0f9  a9 e7 d2	  lda #$d2e7
$06:b0fc  dc a8 f5	  jml [$f5a8]
$06:b0ff  ff 87 fc 23   sbc $23fc87,x
$06:b103  d7 7d		 cmp [$7d],y
$06:b105  e2 5f		 sep #$5f
$06:b107  d6 3d		 dec $3d,x
$06:b109  cd ba ff	  cmp $ffba
$06:b10c  ab			plb
$06:b10d  f8			sed
$06:b10e  8f 2e 9f 47   sta $479f2e
$06:b112  e7 65		 sbc [$65]
$06:b114  e7 67		 sbc [$67]
$06:b116  e7 67		 sbc [$67]
$06:b118  e0 6f		 cpx #$6f
$06:b11a  20 ff ff	  jsr $ffff
$06:b11d  00 ff		 brk #$ff
$06:b11f  e6 79		 inc $79
$06:b121  47 b8		 eor [$b8]
$06:b123  e1 1e		 sbc ($1e,x)
$06:b125  e7 18		 sbc [$18]
$06:b127  e0 1f		 cpx #$1f
$06:b129  20 df ff	  jsr $ffdf
$06:b12c  00 ff		 brk #$ff
$06:b12e  00 a4		 brk #$a4
$06:b130  b9 e6 ff	  lda $ffe6,y
$06:b133  e8			inx
$06:b134  7d e6 ff	  adc $ffe6,x
$06:b137  e6 1f		 inc $1f
$06:b139  f6 0c		 inc $0c,x
$06:b13b  ff ff 00 ff   sbc $ff00ff,x
$06:b13f  7f c6 ff 00   adc $00ffc6,x
$06:b143  f1 8e		 sbc ($8e),y
$06:b145  ff 00 1f e0   sbc $e01f00,x
$06:b149  0c f3 ff	  tsb $fff3
$06:b14c  00 ff		 brk #$ff
$06:b14e  00 ff		 brk #$ff
$06:b150  fb			xce
$06:b151  db			stp
$06:b152  d2 9a		 cmp ($9a)
$06:b154  b0 ba		 bcs $b110
$06:b156  b0 fa		 bcs $b152
$06:b158  88			dey
$06:b159  da			phx
$06:b15a  d0 9a		 bne $b0f6
$06:b15c  b0 ba		 bcs $b118
$06:b15e  b0 7c		 bcs $b1dc
$06:b160  f8			sed
$06:b161  ef c2 cf 80   sbc $80cfc2
$06:b165  cf 80 ff 88   cmp $88ff80
$06:b169  ef c0 cf 80   sbc $80cfc0
$06:b16d  cf 80 d6 f4   cmp $f4d680
$06:b171  af eb d5 dd   lda $ddd5eb
$06:b175  7a			ply
$06:b176  dd 56 de	  cmp $de56,x
$06:b179  e9 d7 e6	  sbc #$e6d7
$06:b17c  c4 98		 cpy $98
$06:b17e  c5 f5		 cmp $f5
$06:b180  cb			wai
$06:b181  ef 9f df a7   sbc $a7df9f
$06:b185  da			phx
$06:b186  37 d6		 and [$d6],y
$06:b188  3b			tsc
$06:b189  dd aa cf	  cmp $cfaa,x
$06:b18c  bf c8 bf f4   lda $f4bfc8,x
$06:b190  d6 df		 dec $df,x
$06:b192  db			stp
$06:b193  90 dd		 bcc $b172
$06:b195  eb			xba
$06:b196  fd b4 fe	  sbc $feb4,x
$06:b199  b9 f7 d2	  lda $d2f7,y
$06:b19c  dc a0 f5	  jml [$f5a0]
$06:b19f  f5 bb		 sbc $bb,x
$06:b1a1  ff af cf b2   sbc $b2cfaf,x
$06:b1a5  eb			xba
$06:b1a6  f6 f6		 inc $f6,x
$06:b1a8  b9 fd aa	  lda $aafd,y
$06:b1ab  df bb f8 af   cmp $aff8bb,x
$06:b1af  dd ff b2	  cmp $b2ff,x
$06:b1b2  ff a5 ef 5b   sbc $5befa5,x
$06:b1b6  ff a9 fd 5b   sbc $5bfda9,x
$06:b1ba  ff a4 fe 5d   sbc $5dfea4,x
$06:b1be  ff dd ff 82   sbc $82ffdd,x
$06:b1c2  ff 94 ff 48   sbc $48ff94,x
$06:b1c6  ff 2a ff 18   sbc $18ff2a,x
$06:b1ca  ff 25 ff 44   sbc $44ff25,x
$06:b1ce  ff 29 ef d3   sbc $d3ef29,x
$06:b1d2  ff 3d ff 86   sbc $86ff3d,x
$06:b1d6  ff 47 f7 aa   sbc $aaf747,x
$06:b1da  ef b9 9f 77   sbc $779fb9
$06:b1de  3f 11 ff c3   and $c3ff11,x
$06:b1e2  ff 3d ff 06   sbc $06ff3d,x
$06:b1e6  ff 0b ff 12   sbc $12ff0b,x
$06:b1ea  ff 61 ff c3   sbc $c3ff61,x
$06:b1ee  ff 2f ff 9b   sbc $9bff2f,x
$06:b1f2  ff 77 ff ae   sbc $aeff77,x
$06:b1f6  fe 21 fd	  inc $fd21,x
$06:b1f9  96 fe		 stx $fe,y
$06:b1fb  49 fd 97	  eor #$97fd
$06:b1fe  f7 0f		 sbc [$0f],y
$06:b200  ff 9a ff 74   sbc $74ff9a,x
$06:b204  ff 81 ff 22   sbc $22ff81,x
$06:b208  ff 81 ff 42   sbc $42ff81,x
$06:b20c  ff 98 ff c5   sbc $c5ff98,x
$06:b210  ff 97 ff 2b   sbc $2bff97,x
$06:b214  ff 89 cd 9d   sbc $9dcd89,x
$06:b218  fe 1a fc	  inc $fc1a,x
$06:b21b  b7 87		 lda [$87],y
$06:b21d  62 7a ff	  per $b19a
$06:b220  c4 ff		 cpy $ff
$06:b222  87 ff		 sta [$ff]
$06:b224  03 cc		 ora $cc,s
$06:b226  b3 8e		 lda ($8e,s),y
$06:b228  f5 73		 sbc $73,x
$06:b22a  cf 87 7b ab   cmp $ab7b87
$06:b22e  fd b3 ff	  sbc $ffb3,x
$06:b231  ec ff 31	  cpx $31ff
$06:b234  f9 16 ff	  sbc $ff16,y
$06:b237  53 ad		 eor ($ad,s),y
$06:b239  46 9c		 lsr $9c
$06:b23b  6d 6f e3	  adc $e36f
$06:b23e  fa			plx
$06:b23f  ff 33 ff e0   sbc $e0ff33,x
$06:b243  f9 36 3f	  sbc $3f36,y
$06:b246  d0 e1		 bne $b229
$06:b248  7f 1b e7 8f   adc $8fe71b,x
$06:b24c  f1 e3		 sbc ($e3),y
$06:b24e  5f eb f8 f3   eor $f3f8eb,x
$06:b252  f8			sed
$06:b253  5d 5c be	  eor $be5c,x
$06:b256  be 4d 4f	  ldx $4f4d,y
$06:b259  9e 8f 2d	  stz $2d8f,x
$06:b25c  0f 1c 5f 27   ora $275f1c
$06:b260  ff 17 ff ab   sbc $abff17,x
$06:b264  ff 45 ff b4   sbc $b4ff45,x
$06:b268  ff 76 ff f5   sbc $f5ff76,x
$06:b26c  ff e4 ff 57   sbc $57ffe4,x
$06:b270  07 a4		 ora [$a4]
$06:b272  0f 4c 9f 94   ora $949f4c
$06:b276  6f 69 0f 88   adc $880f69
$06:b27a  9f 71 ff ae   sta $aeff71,x
$06:b27e  fe ff ff	  inc $ffff,x
$06:b281  fc ff f4	  jsr ($f4ff,x)
$06:b284  ff f4 ff f8   sbc $f8fff4,x
$06:b288  ff 68 ff 10   sbc $10ff68,x
$06:b28c  ff a9 ff 7d   sbc $7dffa9,x
$06:b290  ff 87 ff 5d   sbc $5dff87,x
$06:b294  cf cf cf 7f   cmp $7fcfcf
$06:b298  ff 05 ff 20   sbc $20ff05,x
$06:b29c  fd 58 fc	  sbc $fc58,x
$06:b29f  02 fd		 cop #$fd
$06:b2a1  00 ff		 brk #$ff
$06:b2a3  4a			lsr a
$06:b2a4  b5 48		 lda $48,x
$06:b2a6  b7 30		 lda [$30],y
$06:b2a8  cf 78 87 58   cmp $588778
$06:b2ac  a5 20		 lda $20
$06:b2ae  dc 20 ff	  jml [$ff20]
$06:b2b1  04 ff		 tsb $ff
$06:b2b3  60			rts
$06:b2b4  fe c0 ec	  inc $ecc0,x
$06:b2b7  e0 e0		 cpx #$e0
$06:b2b9  40			rti
$06:b2ba  c0 00		 cpy #$00
$06:b2bc  c0 00		 cpy #$00
$06:b2be  80 de		 bra $b29e
$06:b2c0  21 da		 and ($da,x)
$06:b2c2  25 8c		 and $8c
$06:b2c4  72 00		 adc ($00)
$06:b2c6  ec 00 e0	  cpx $e000
$06:b2c9  00 c0		 brk #$c0
$06:b2cb  00 c0		 brk #$c0
$06:b2cd  00 80		 brk #$80
$06:b2cf  6b			rtl
$06:b2d0  bb			tyx
$06:b2d1  2b			pld
$06:b2d2  7b			tdc
$06:b2d3  78			sei
$06:b2d4  ab			plb
$06:b2d5  2b			pld
$06:b2d6  7b			tdc
$06:b2d7  70 a3		 bvs $b27c
$06:b2d9  ff 00 ff ff   sbc $ffff00,x
$06:b2dd  00 ff		 brk #$ff
$06:b2df  1c 38 9c	  trb $9c38
$06:b2e2  38			sec
$06:b2e3  1c 38 9c	  trb $9c38
$06:b2e6  38			sec
$06:b2e7  14 38		 trb $38
$06:b2e9  00 ff		 brk #$ff
$06:b2eb  ff 00 ff 00   sbc $00ff00,x
$06:b2ef  c4 f5		 cpy $f5
$06:b2f1  b2 ec		 lda ($ec)
$06:b2f3  c0 ef		 cpy #$ef
$06:b2f5  1e bb 68	  asl $68bb,x
$06:b2f8  af aa 9e ca   lda $ca9eaa
$06:b2fc  ef 67 ff e6   sbc $e6ff67
$06:b300  db			stp
$06:b301  ba			tsx
$06:b302  f7 b6		 sbc [$b6],y
$06:b304  d9 d5 6e	  cmp $6ed5,y
$06:b307  ef 59 a9 7f   sbc $7fa959
$06:b30b  f6 99		 inc $99,x
$06:b30d  ff 46 f9 f9   sbc $f9f946,x
$06:b311  9b			txy
$06:b312  bb			tyx
$06:b313  5d 1d af	  eor $af1d,x
$06:b316  0f 95 57 0e   ora $0e5795
$06:b31a  6f 9b 2f 2a   adc $2a2f9b
$06:b31e  4e e6 ff	  lsr $ffe6
$06:b321  54 ff ea	  mvn $ea,$ff
$06:b324  ff f4 ff ec   sbc $ecfff4,x
$06:b328  ff f6 ff f9   sbc $f9fff6,x
$06:b32c  ff f9 ff 87   sbc $87fff9,x
$06:b330  37 15		 and [$15],y
$06:b332  67 ae		 adc [$ae]
$06:b334  0e 15 6d	  asl $6d15
$06:b337  ca			dex
$06:b338  2e 19 5c	  rol $5c19
$06:b33b  12 99		 ora ($99)
$06:b33d  8d de ff	  sta $ffde
$06:b340  ff fc ff f5   sbc $f5fffc,x
$06:b344  ff f6 ff f9   sbc $f9fff6,x
$06:b348  ff eb ff 77   sbc $77ffeb,x
$06:b34c  ff ab ff fa   sbc $faffab,x
$06:b350  88			dey
$06:b351  da			phx
$06:b352  d0 9a		 bne $b2ee
$06:b354  b0 ba		 bcs $b310
$06:b356  b0 fa		 bcs $b352
$06:b358  88			dey
$06:b359  da			phx
$06:b35a  d0 9a		 bne $b2f6
$06:b35c  b0 ba		 bcs $b318
$06:b35e  b0 ff		 bcs $b35f
$06:b360  88			dey
$06:b361  ef c0 cf 80   sbc $80cfc0
$06:b365  cf 80 ff 88   cmp $88ff80
$06:b369  ef c0 cf 80   sbc $80cfc0
$06:b36d  cf 80 db ff   cmp $ffdb80
$06:b371  c5 c7		 cmp $c7
$06:b373  1a			inc a
$06:b374  83 34		 sta $34,s
$06:b376  99 dc c9	  sta $c9dc,y
$06:b379  d7 f3		 cmp [$f3],y
$06:b37b  ab			plb
$06:b37c  e3 bd		 sbc $bd,s
$06:b37e  81 ff		 sta ($ff,x)
$06:b380  c3 c7		 cmp $c7,s
$06:b382  b9 83 7c	  lda $7c83,y
$06:b385  99 66 c9	  sta $c966,y
$06:b388  b6 f3		 ldx $f3,y
$06:b38a  cd e3 9f	  cmp $9fe3
$06:b38d  81 7e		 sta ($7e,x)
$06:b38f  f9 fd f0	  sbc $f0fd,y
$06:b392  fc c9 d6	  jsr ($d6c9,x)
$06:b395  b4 ef		 ldy $ef,x
$06:b397  eb			xba
$06:b398  fd a0 eb	  sbc $eba0,x
$06:b39b  ff fb c8 df   sbc $dfc8fb,x
$06:b39f  ff e2 f5 db   sbc $dbf5e2,x
$06:b3a3  dd eb fe	  cmp $feeb,x
$06:b3a6  b1 fb		 lda ($fb),y
$06:b3a8  d6 ff		 dec $ff,x
$06:b3aa  b4 ee		 ldy $ee,x
$06:b3ac  97 ce		 sta [$ce],y
$06:b3ae  bb			tyx
$06:b3af  ae ef b6	  ldx $b6ef
$06:b3b2  9f db cf 73   sta $73cfdb,x
$06:b3b6  f7 f2		 sbc [$f2],y
$06:b3b8  fb			xce
$06:b3b9  bd bf ab	  lda $abbf,x
$06:b3bc  8f d1 e7 9e   sta $9ee7d1
$06:b3c0  ff 66 ff b3   sbc $b3ff66,x
$06:b3c4  ff 4b ff f4   sbc $f4ff4b,x
$06:b3c8  ff 4d ff 73   sbc $73ff4d,x
$06:b3cc  ff 99 ff a7   sbc $a7ff99,x
$06:b3d0  4f 2a 3f 51   eor $513f2a
$06:b3d4  ff fe ff e5   sbc $e5fffe,x
$06:b3d8  ff 82 fe 55   sbc $55fe82,x
$06:b3dc  f7 80		 sbc [$80],y
$06:b3de  fd f7 ff	  sbc $fff7,x
$06:b3e1  ca			dex
$06:b3e2  ff 11 ff fe   sbc $feff11,x
$06:b3e6  ff e0 ff 81   sbc $81ffe0,x
$06:b3ea  ff 48 ff 82   sbc $82ff48,x
$06:b3ee  ff e4 fc da   sbc $dafce4,x
$06:b3f2  de 37 bf	  dec $bf37,x
$06:b3f5  a9 2f 5a	  lda #$5a2f
$06:b3f8  9b			txy
$06:b3f9  ac cf 55	  ldy $55cf
$06:b3fc  e7 aa		 sbc [$aa]
$06:b3fe  b3 e3		 lda ($e3,s),y
$06:b400  ff f9 ff 46   sbc $46fff9,x
$06:b404  ff d1 ff 64   sbc $64ffd1,x
$06:b408  ff 30 ff 18   sbc $18ff30,x
$06:b40c  ff 4c ff 5b   sbc $5bff4c,x
$06:b410  3f b4 bc db   and $dbbcb4,x
$06:b414  ff b5 ff 1a   sbc $1affb5,x
$06:b418  ff b8 ff 7f   sbc $7fffb8,x
$06:b41c  ff bf ff d9   sbc $d9ffbf,x
$06:b420  ff 53 ff 18   sbc $18ff53,x
$06:b424  ff 10 ff 18   sbc $18ff10,x
$06:b428  ff b8 ff 7f   sbc $7fffb8,x
$06:b42c  ff b1 ff 2b   sbc $2bffb1,x
$06:b430  3f be 3f 62   and $623fbe,x
$06:b434  77 2a		 adc [$2a],y
$06:b436  7e bf ff	  ror $ffbf,x
$06:b439  66 ef		 ror $ef
$06:b43b  9b			txy
$06:b43c  d7 35		 cmp [$35],y
$06:b43e  b7 ca		 lda [$ca],y
$06:b440  ff d6 ff aa   sbc $aaffd6,x
$06:b444  ff a3 ff 3a   sbc $3affa3,x
$06:b448  ff 76 ff ab   sbc $abff76,x
$06:b44c  ff 49 ff 5c   sbc $5cff49,x
$06:b450  9f 36 bf bd   sta $bdbf36,x
$06:b454  3f 6b 7b de   and $de7b6b,x
$06:b458  fc 3a 7f	  jsr ($7f3a,x)
$06:b45b  d5 fe		 cmp $fe,x
$06:b45d  b8			clv
$06:b45e  fe e4 ff	  inc $ffe4,x
$06:b461  c4 ff		 cpy $ff
$06:b463  c4 ff		 cpy $ff
$06:b465  8c ff 0b	  sty $0bff
$06:b468  ff 99 ff 15   sbc $15ff99,x
$06:b46c  ff 39 ff 6a   sbc $6aff39,x
$06:b470  f9 be fe	  sbc $febe,y
$06:b473  14 df		 trb $df
$06:b475  ba			tsx
$06:b476  bf cc 7f 8e   lda $8e7fcc,x
$06:b47a  ff 8c ff 8a   sbc $8aff8c,x
$06:b47e  ff 67 ff 39   sbc $39ff67,x
$06:b482  ff 34 ff 58   sbc $58ff34,x
$06:b486  ff 8c ff 0e   sbc $0eff8c,x
$06:b48a  ff 0c ff 0a   sbc $0aff0c,x
$06:b48e  ff 00 3c 5a   sbc $5a3c00,x
$06:b492  74 1f		 stz $1f,x
$06:b494  e0 7e		 cpx #$7e
$06:b496  c9 77 99	  cmp #$9977
$06:b499  3f c1 7f 02   and $027fc1,x
$06:b49d  2e 1c 3c	  rol $3c1c
$06:b4a0  c3 22		 cmp $22,s
$06:b4a2  89 e1 14	  bit #$14e1
$06:b4a5  80 30		 bra $b4d7
$06:b4a7  80 46		 bra $b4ef
$06:b4a9  80 2e		 bra $b4d9
$06:b4ab  40			rti
$06:b4ac  8d 20 c3	  sta $c320
$06:b4af  ea			nop
$06:b4b0  79 fc bc	  adc $bcfc,y
$06:b4b3  34 1d		 bit $1d,x
$06:b4b5  ea			nop
$06:b4b6  8f ec 27 d6   sta $d627ec
$06:b4ba  53 ab		 eor ($ab,s),y
$06:b4bc  ab			plb
$06:b4bd  5d 5f e7	  eor $e75f,x
$06:b4c0  ff 7b ff f6   sbc $f6ff7b,x
$06:b4c4  ff 78 ff dc   sbc $dcff78,x
$06:b4c8  ff ae ff 55   sbc $55ffae,x
$06:b4cc  ff a1 ff 13   sbc $13ffa1,x
$06:b4d0  bf 96 3e 29   lda $293e96,x
$06:b4d4  7d a2 fa	  adc $faa2,x
$06:b4d7  75 f4		 adc $f4,x
$06:b4d9  6a			ror a
$06:b4da  e9 d4 f2	  sbc #$f2d4
$06:b4dd  59 f9 d0	  eor $d0f9,y
$06:b4e0  ff d1 ff a2   sbc $a2ffd1,x
$06:b4e4  ff 25 ff 6b   sbc $6bff25,x
$06:b4e8  ff 57 ff cf   sbc $cfff57,x
$06:b4ec  ff 46 ff 6a   sbc $6aff46,x
$06:b4f0  79 fc bc	  adc $bcfc,y
$06:b4f3  34 1d		 bit $1d,x
$06:b4f5  da			phx
$06:b4f6  9f bc 3f 7e   sta $7e3fbc,x
$06:b4fa  7f dc df ba   adc $badfdc,x
$06:b4fe  9f e7 ff 7b   sta $7bffe7,x
$06:b502  ff f6 ff 68   sbc $68fff6,x
$06:b506  ff cc ff 8e   sbc $8effcc,x
$06:b50a  ff 2c ff 6a   sbc $6aff2c,x
$06:b50e  ff 11 bd 92   sbc $92bd11,x
$06:b512  3a			dec a
$06:b513  28			plp
$06:b514  7c a2 fa	  jmp ($faa2,x)
$06:b517  75 f4		 adc $f4,x
$06:b519  6a			ror a
$06:b51a  e9 d5 f2	  sbc #$f2d5
$06:b51d  57 f1		 eor [$f1],y
$06:b51f  d2 ff		 cmp ($ff)
$06:b521  d5 ff		 cmp $ff,x
$06:b523  a3 ff		 lda $ff,s
$06:b525  25 ff		 and $ff
$06:b527  6b			rtl
$06:b528  ff 57 ff cf   sbc $cfff57,x
$06:b52c  ff 4e ff ea   sbc $eaff4e,x
$06:b530  79 fc bc	  adc $bcfc,y
$06:b533  34 1d		 bit $1d,x
$06:b535  fa			plx
$06:b536  9f fc 3f f6   sta $f63ffc,x
$06:b53a  7f c4 cf b2   adc $b2cfc4,x
$06:b53e  87 e7		 sta [$e7]
$06:b540  ff 7b ff f6   sbc $f6ff7b,x
$06:b544  ff 68 ff cc   sbc $ccff68,x
$06:b548  ff 86 ff 34   sbc $34ff86,x
$06:b54c  ff 7a ff fa   sbc $faff7a,x
$06:b550  88			dey
$06:b551  da			phx
$06:b552  d0 9a		 bne $b4ee
$06:b554  b0 ba		 bcs $b510
$06:b556  b0 fa		 bcs $b552
$06:b558  88			dey
$06:b559  da			phx
$06:b55a  d0 9b		 bne $b4f7
$06:b55c  b2 bb		 lda ($bb)
$06:b55e  b3 ff		 lda ($ff,s),y
$06:b560  88			dey
$06:b561  ef c0 cf 80   sbc $80cfc0
$06:b565  cf 80 ff 88   cmp $88ff80
$06:b569  ef c0 cf 82   sbc $82cfc0
$06:b56d  cc 80 ab	  cpy $ab80
$06:b570  ab			plb
$06:b571  d5 d5		 cmp $d5,x
$06:b573  f9 f9 f1	  sbc $f1f9,y
$06:b576  f1 f1		 sbc ($f1),y
$06:b578  f9 f9 e5	  sbc $e5f9,y
$06:b57b  fd c3 c1	  sbc $c1c3,x
$06:b57e  80 fe		 bra $b57e
$06:b580  55 7d		 eor $7d,x
$06:b582  aa			tax
$06:b583  39 c6 11	  and $11c6,y
$06:b586  ee 09 fe	  inc $fe09
$06:b589  05 fe		 ora $fe
$06:b58b  03 fe		 ora $fe,s
$06:b58d  00 ff		 brk #$ff
$06:b58f  10 f9		 bpl $b58a
$06:b591  d6 f7		 dec $f7,x
$06:b593  49 fb e2	  eor #$e2fb
$06:b596  ff b7 ff 5c   sbc $5cffb7,x
$06:b59a  7f 47 7f 2a   adc $2a7f47,x
$06:b59e  3f 06 ff 48   and $48ff06,x
$06:b5a2  ff 45 ff e2   sbc $e2ff45,x
$06:b5a6  ff 36 ff 9c   sbc $9cff36,x
$06:b5aa  ff 86 ff ca   sbc $caff86,x
$06:b5ae  ff ab ff fd   sbc $fdffab,x
$06:b5b2  ff d2 df b6   sbc $b6dfd2,x
$06:b5b6  87 55		 sta [$55]
$06:b5b8  88			dey
$06:b5b9  ad 95 4a	  lda $4a95
$06:b5bc  2a			rol a
$06:b5bd  57 17		 eor [$17],y
$06:b5bf  03 ff		 ora $ff,s
$06:b5c1  fd ff a2	  sbc $a2ff,x
$06:b5c4  ff 78 ff 7f   sbc $7fff78,x
$06:b5c8  ff 7a ff f5   sbc $f5ff7a,x
$06:b5cc  ff e8 ff 98   sbc $98ffe8,x
$06:b5d0  f9 62 f0	  sbc $f062,y
$06:b5d3  bb			tyx
$06:b5d4  fb			xce
$06:b5d5  1d ff 6e	  ora $6eff,x
$06:b5d8  7f 89 ff 16   adc $16ff89,x
$06:b5dc  fe 3c fc	  inc $fc3c,x
$06:b5df  9e ff 6f	  stz $6fff,x
$06:b5e2  ff a4 ff 11   sbc $11ffa4,x
$06:b5e6  ff 8e ff 08   sbc $08ff8e,x
$06:b5ea  ff 11 ff 3b   sbc $3bff11,x
$06:b5ee  ff 45 ff c7   sbc $c7ff45,x
$06:b5f2  7f 0b b7 8a   adc $8ab70b,x
$06:b5f6  e7 4a		 sbc [$4a]
$06:b5f8  7f a7 77 63   adc $6377a7,x
$06:b5fc  d7 8e		 cmp [$8e],y
$06:b5fe  ef af d4 ff   sbc $ffd4af
$06:b602  d7 ff		 cmp [$ff],y
$06:b604  4b			phk
$06:b605  4f ba d7 ea   eor $ead7ba
$06:b609  df ae f7 6a   cmp $6af7ae,x
$06:b60d  6f de cb fb   adc $fbcbde
$06:b611  b4 ff		 ldy $ff,x
$06:b613  5d ff cb	  eor $cbff,x
$06:b616  ff 35 7f ee   sbc $ee7f35,x
$06:b61a  7f 57 ff 69   adc $69ff57,x
$06:b61e  bf c5 ff b0   lda $b0ffc5,x
$06:b622  ff 4d ff 43   sbc $43ff4d,x
$06:b626  ff a1 ff a0   sbc $a0ffa1,x
$06:b62a  ff 90 ff c8   sbc $c8ff90,x
$06:b62e  ff aa ff fc   sbc $fcffaa,x
$06:b632  fe ad ef	  inc $efad,x
$06:b635  76 c7		 ror $c7,x
$06:b637  8d c7 c2	  sta $c2c7
$06:b63a  e6 f5		 inc $f5
$06:b63c  fc 2c fd	  jsr ($fd2c,x)
$06:b63f  02 ff		 cop #$ff
$06:b641  fd ff 94	  sbc $94ff,x
$06:b644  ff 3a ff 39   sbc $39ff3a,x
$06:b648  ff 9b ff 47   sbc $47ff9b,x
$06:b64c  ff 2b ff 75   sbc $75ff2b,x
$06:b650  fe d8 de	  inc $ded8,x
$06:b653  2d 1f 8f	  and $8f1f
$06:b656  1f 75 bf aa   ora $aabf75,x
$06:b65a  fb			xce
$06:b65b  db			stp
$06:b65c  fb			xce
$06:b65d  7b			tdc
$06:b65e  fb			xce
$06:b65f  55 ff		 eor $ff,x
$06:b661  b9 ff ec	  lda $ecff,y
$06:b664  ff ee ff d4   sbc $d4ffee,x
$06:b668  ff 6e ff 16   sbc $16ff6e,x
$06:b66c  ff 65 ff 93   sbc $93ff65,x
$06:b670  fb			xce
$06:b671  1f f9 11 fe   ora $fe11f9,x
$06:b675  1c ff 3f	  trb $3fff
$06:b678  ff 6d e7 b2   sbc $b2e76d,x
$06:b67c  f7 09		 sbc [$09],y
$06:b67e  fb			xce
$06:b67f  1d ff 16	  ora $16ff,x
$06:b682  ff 13 ff 19   sbc $19ff13,x
$06:b686  ff 24 ff 58   sbc $58ff24,x
$06:b68a  ff 8e ff 07   sbc $07ff8e,x
$06:b68e  ff ff ff ff   sbc $ffffff,x
$06:b692  ff cd cd ff   sbc $ffcdcd,x
$06:b696  cd ff 28	  cmp $28ff
$06:b699  ab			plb
$06:b69a  fb			xce
$06:b69b  fb			xce
$06:b69c  2b			pld
$06:b69d  ab			plb
$06:b69e  fb			xce
$06:b69f  ff ff ff c8   sbc $c8ffff,x
$06:b6a3  cd fa cd	  cmp $cdfa
$06:b6a6  3a			dec a
$06:b6a7  18			clc
$06:b6a8  38			sec
$06:b6a9  1c 38 1c	  trb $1c38
$06:b6ac  38			sec
$06:b6ad  1c 38 45	  trb $4538
$06:b6b0  51 8b		 eor ($8b),y
$06:b6b2  a3 15		 lda $15,s
$06:b6b4  57 2a		 eor [$2a],y
$06:b6b6  af 54 5f aa   lda $aa5f54
$06:b6ba  fe 51 fc	  inc $fc51,x
$06:b6bd  a2 f8		 ldx #$f8
$06:b6bf  ae ff 5d	  ldx $5dff
$06:b6c2  ff a9 ff 52   sbc $52ffa9,x
$06:b6c6  ff a4 ff 09   sbc $09ffa4,x
$06:b6ca  ff 13 ff a7   sbc $a7ff13,x
$06:b6ce  ff d9 fb 6a   sbc $6afbd9,x
$06:b6d2  ff 7f ff 53   sbc $53ff7f,x
$06:b6d6  ff e9 ff 2e   sbc $2effe9,x
$06:b6da  3f f3 ff aa   and $aafff3,x
$06:b6de  fe d4 ff	  inc $ffd4,x
$06:b6e1  60			rts
$06:b6e2  ff 7f ff 50   sbc $50ff7f,x
$06:b6e6  ff e8 ff ce   sbc $ceffe8,x
$06:b6ea  ff 31 ff 29   sbc $29ff31,x
$06:b6ee  ff ff ff ea   sbc $eaffff,x
$06:b6f2  ff d6 d6 0d   sbc $0dd6d6,x
$06:b6f6  6d ca 2e	  adc $2eca
$06:b6f9  19 5c 12	  ora $125c,y
$06:b6fc  99 8d de	  sta $de8d,y
$06:b6ff  1f ff ea ff   ora $ffeaff,x
$06:b703  2d ff f6	  and $f6ff
$06:b706  ff f9 ff eb   sbc $ebfff9,x
$06:b70a  ff 77 ff ab   sbc $abff77,x
$06:b70e  ff ff f9 f7   sbc $f7f9ff,x
$06:b712  f0 f9		 beq $b70d
$06:b714  90 bf		 bcc $b6d5
$06:b716  10 7f		 bpl $b797
$06:b718  50 fe		 bvc $b718
$06:b71a  27 be		 and [$be]
$06:b71c  ab			plb
$06:b71d  7b			tdc
$06:b71e  48			pha
$06:b71f  7f f9 ff f0   adc $f0fff9,x
$06:b723  ff 90 ff 10   sbc $10ff90,x
$06:b727  bf 10 fa 20   lda $20fa10,x
$06:b72b  74 28		 stz $28,x
$06:b72d  f7 48		 sbc [$48],y
$06:b72f  ff 3f ff 1f   sbc $1fff3f,x
$06:b733  bf 11 fd 90   lda $90fd11,x
$06:b737  fe 9a bf	  inc $bf9a,x
$06:b73a  c8			iny
$06:b73b  7b			tdc
$06:b73c  ab			plb
$06:b73d  bc 24 ff	  ldy $ff24,x
$06:b740  3f ff 1f ff   and $ff1fff,x
$06:b744  11 7f		 ora ($7f),y
$06:b746  10 7d		 bpl $b7c5
$06:b748  18			clc
$06:b749  bf 08 5c 28   lda $285c08,x
$06:b74d  df 24 e7 bd   cmp $bde724,x
$06:b751  db			stp
$06:b752  99 e7 c3	  sta $c3e7,y
$06:b755  ff e5 fb f9   sbc $f9fbe5,x
$06:b759  f3 b1		 sbc ($b1,s),y
$06:b75b  db			stp
$06:b75c  99 e7 81	  sta $81e7,y
$06:b75f  c3 81		 cmp $81,s
$06:b761  e7 81		 sbc [$81]
$06:b763  ff c3 ff e5   sbc $e5ffc3,x
$06:b767  ff f9 ff b1   sbc $b1fff9,x
$06:b76b  e7 81		 sbc [$81]
$06:b76d  ff 81 2c e7   sbc $e72c81,x
$06:b771  a5 e7		 lda $e7
$06:b773  99 ff 10	  sta $10ff,y
$06:b776  ff 89 ff e7   sbc $e7ff89,x
$06:b77a  ff ad e7 2c   sbc $2ce7ad,x
$06:b77e  ff e7 99 e7   sbc $e799e7,x
$06:b782  99 ff 81	  sta $81ff,y
$06:b785  ff 81 ff c3   sbc $c3ff81,x
$06:b789  ff a5 e7 99   sbc $99e7a5,x
$06:b78d  ff e7 4b 8b   sbc $8b4be7,x
$06:b791  3b			tsc
$06:b792  3f 5d ff ba   and $baff5d,x
$06:b796  fb			xce
$06:b797  f9 f1 a6	  sbc $a6f1,y
$06:b79a  e0 4a		 cpx #$4a
$06:b79c  e1 e6		 sbc ($e6,x)
$06:b79e  f0 f5		 beq $b795
$06:b7a0  ff c3 ff 0d   sbc $0dffc3,x
$06:b7a4  ff 14 ff ee   sbc $eeff14,x
$06:b7a8  ff 9f ff 5f   sbc $5fff9f,x
$06:b7ac  ff ef ff ea   sbc $eaffef,x
$06:b7b0  ff fb ff a8   sbc $a8fffb,x
$06:b7b4  fb			xce
$06:b7b5  57 fd		 eor [$fd],y
$06:b7b7  51 fc		 eor ($fc),y
$06:b7b9  00 7f		 brk #$7f
$06:b7bb  81 04		 sta ($04,x)
$06:b7bd  33 39		 and ($39,s),y
$06:b7bf  2a			rol a
$06:b7c0  ff f3 ff ac   sbc $acfff3,x
$06:b7c4  ff 52 ff 03   sbc $03ff52,x
$06:b7c8  ff 81 ff fb   sbc $fbff81,x
$06:b7cc  ff c6 ff eb   sbc $ebffc6,x
$06:b7d0  fe c7 ef	  inc $efc7,x
$06:b7d3  99 f7 4e	  sta $4ef7,y
$06:b7d6  fb			xce
$06:b7d7  92 f8		 sta ($f8)
$06:b7d9  65 71		 adc $71
$06:b7db  dd f7 ae	  cmp $aef7,x
$06:b7de  ef c9 ff 96   sbc $96ffc9
$06:b7e2  ff 89 ff 44   sbc $44ff89,x
$06:b7e6  ff 07 ff ae   sbc $aeff07,x
$06:b7ea  ff 49 ff b6   sbc $b6ff49,x
$06:b7ee  ff 87 ff 79   sbc $79ff87,x
$06:b7f2  d7 03		 cmp [$03],y
$06:b7f4  c7 d1		 cmp [$d1]
$06:b7f6  bf 33 f7 9f   lda $9ff733,x
$06:b7fa  6f 07 3f 9d   adc $9d3f07
$06:b7fe  ff bf cf 7f   sbc $7fcfbf,x
$06:b802  f9 ef 79	  sbc $79ef,y
$06:b805  d7 69		 cmp [$69],y
$06:b807  77 9b		 adc [$9b],y
$06:b809  bf df af d7   lda $d7afdf,x
$06:b80d  bf 61 54 9f   lda $9f5461,x
$06:b811  aa			tax
$06:b812  2f 55 57 a9   and $a95755
$06:b816  fb			xce
$06:b817  76 7e		 ror $7e,x
$06:b819  4c ef ad	  jmp $adef
$06:b81c  bf ba ff e4   lda $e4ffba,x
$06:b820  ff d2 ff a9   sbc $a9ffd2,x
$06:b824  ff 05 ff 87   sbc $87ff05,x
$06:b828  ff 14 ff 48   sbc $48ff14,x
$06:b82c  ff 10 ff f8   sbc $f8ff10,x
$06:b830  fa			plx
$06:b831  51 f5		 eor ($f5),y
$06:b833  ca			dex
$06:b834  c2 95		 rep #$95
$06:b836  c5 4a		 cmp $4a
$06:b838  e3 25		 sbc $25,s
$06:b83a  77 9a		 adc [$9a],y
$06:b83c  5b			tcd
$06:b83d  45 2f		 eor $2f
$06:b83f  77 ff		 adc [$ff],y
$06:b841  4e ff bd	  lsr $bdff
$06:b844  ff ba ff 5c   sbc $5cffba,x
$06:b848  ff a8 ff f4   sbc $f4ffa8,x
$06:b84c  ff f0 ff 05   sbc $05fff0,x
$06:b850  3f 4b 9f b1   and $b19f4b,x
$06:b854  f1 33		 sbc ($33),y
$06:b856  bf 95 e6 bd   lda $bde695,x
$06:b85a  ff 9c 2f ff   sbc $ff2f9c,x
$06:b85e  ff 3f e0 9f   sbc $9fe03f,x
$06:b862  73 fd		 adc ($fd,s),y
$06:b864  0e bc 53	  asl $53bc
$06:b867  c7 bb		 cmp [$bb]
$06:b869  35 ef		 and $ef,x
$06:b86b  3e f1 ff	  rol $fff1,x
$06:b86e  ff f5 fd ae   sbc $aefdf5,x
$06:b872  b2 14		 lda ($14)
$06:b874  a7 7b		 lda [$7b]
$06:b876  bf a6 be b4   lda $b4bea6,x
$06:b87a  f7 e2		 sbc [$e2],y
$06:b87c  ee ff ff	  inc $ffff
$06:b87f  fd e2 ba	  sbc $bae2,x
$06:b882  5f c5 7e 32   eor $327ec5,x
$06:b886  cf bf 45 b7   cmp $b745bf
$06:b88a  ea			nop
$06:b88b  5e fd ff	  lsr $fffd,x
$06:b88e  ff c2 f2 19   sbc $19f2c2,x
$06:b892  1f 84 86 32   ora $328684,x
$06:b896  ba			tsx
$06:b897  5a			phy
$06:b898  4b			phk
$06:b899  88			dey
$06:b89a  09 51 11	  ora #$1151
$06:b89d  a5 8d		 lda $8d
$06:b89f  f2 0d		 sbc ($0d)
$06:b8a1  1f e0 86 79   ora $7986e0,x
$06:b8a5  ba			tsx
$06:b8a6  45 5b		 eor $5b
$06:b8a8  b4 89		 ldy $89,x
$06:b8aa  f6 51		 inc $51,x
$06:b8ac  ee ad 72	  inc $72ad
$06:b8af  c4 70		 cpy $70
$06:b8b1  ea			nop
$06:b8b2  ba			tsx
$06:b8b3  37 1f		 and [$1f],y
$06:b8b5  fa			plx
$06:b8b6  9f fc 3f fe   sta $fe3ffc,x
$06:b8ba  7f cd cf b2   adc $b2cfcd,x
$06:b8be  87 cf		 sta [$cf]
$06:b8c0  ff 65 ff f0   sbc $f0ff65,x
$06:b8c4  ff 68 ff cc   sbc $ccff68,x
$06:b8c8  ff 8e ff 3d   sbc $3dff8e,x
$06:b8cc  ff 7a ff 51   sbc $51ff7a,x
$06:b8d0  fd 42 fa	  sbc $fa42,x
$06:b8d3  a8			tay
$06:b8d4  fc c2 fa	  jsr ($fac2,x)
$06:b8d7  95 f4		 sta $f4,x
$06:b8d9  ea			nop
$06:b8da  e9 95 f2	  sbc #$f295
$06:b8dd  d7 f1		 cmp [$f1],y
$06:b8df  52 ff		 eor ($ff)
$06:b8e1  45 ff		 eor $ff
$06:b8e3  a3 ff		 lda $ff,s
$06:b8e5  c5 ff		 cmp $ff
$06:b8e7  8b			phb
$06:b8e8  ff d7 ff 8f   sbc $8fffd7,x
$06:b8ec  ff ce ff ff   sbc $ffffce,x
$06:b8f0  00 99		 brk #$99
$06:b8f2  88			dey
$06:b8f3  ee 66 ff	  inc $ff66
$06:b8f6  99 db db	  sta $dbdb,y
$06:b8f9  e7 bd		 sbc [$bd]
$06:b8fb  a5 3c		 lda $3c
$06:b8fd  a5 3c		 lda $3c
$06:b8ff  ff 00 ff 88   sbc $88ff00,x
$06:b903  99 00 ff	  sta $ff00,y
$06:b906  99 e7 c3	  sta $c3e7,y
$06:b909  c3 81		 cmp $81,s
$06:b90b  c3 00		 cmp $00,s
$06:b90d  c3 00		 cmp $00,s
$06:b90f  f4 57 f9	  pea $f957
$06:b912  db			stp
$06:b913  ec ec fe	  cpx $feec
$06:b916  fc bd fd	  jsr ($fdbd,x)
$06:b919  f3 e3		 sbc ($e3,s),y
$06:b91b  a9 af e6	  lda #$e6af
$06:b91e  aa			tax
$06:b91f  e8			inx
$06:b920  50 e4		 bvc $b906
$06:b922  d0 f3		 bne $b917
$06:b924  e4 cf		 cpx $cf
$06:b926  ec 9e 9c	  cpx $9c9e
$06:b929  fc e0 f0	  jsr ($f0e0,x)
$06:b92c  a0 f1 a0	  ldy #$a0f1
$06:b92f  5f d6 3f b7   eor $b73fd6,x
$06:b933  6f 6f ff 7f   adc $7fff6f
$06:b937  7b			tdc
$06:b938  7f bf bf b9   adc $b9bfbf,x
$06:b93c  b1 7f		 lda ($7f),y
$06:b93e  71 2f		 adc ($2f),y
$06:b940  16 4f		 asl $4f,x
$06:b942  17 9f		 ora [$9f],y
$06:b944  4f ef 6f f3   eor $f36fef
$06:b948  73 5f		 adc ($5f,s),y
$06:b94a  3f 5f 31 bf   and $bf315f,x
$06:b94e  71 c5		 adc ($c5),y
$06:b950  ff 97 ff 2b   sbc $2bff97,x
$06:b954  ef aa ef 6a   sbc $6aefaa
$06:b958  ff d7 ff 2b   sbc $2bffd7,x
$06:b95c  7f 7f 7f c4   adc $c47f7f,x
$06:b960  ff 87 ff 13   sbc $13ff87,x
$06:b964  ff 92 ff 42   sbc $42ff92,x
$06:b968  ff 56 ff aa   sbc $aaff56,x
$06:b96c  ff be ff bf   sbc $bfffbe,x
$06:b970  ff f0 ff 39   sbc $39fff0,x
$06:b974  f9 5e ff	  sbc $ff5e,y
$06:b977  9b			txy
$06:b978  bf 55 7f 6c   lda $6c7f55,x
$06:b97c  fe fe fe	  inc $fefe,x
$06:b97f  3f ff f0 ff   and $fff0ff,x
$06:b983  36 ff		 rol $ff,x
$06:b985  18			clc
$06:b986  ff 5b ff 94   sbc $94ff5b,x
$06:b98a  ff 2d ff 37   sbc $37ff2d,x
$06:b98e  ff 93 f3 e3   sbc $e3f393,x
$06:b992  e3 57		 sbc $57,s
$06:b994  73 fb		 adc ($fb,s),y
$06:b996  7b			tdc
$06:b997  fe fe 65	  inc $65fe,x
$06:b99a  ef 66 f7 cf   sbc $cff766
$06:b99e  ff 8d ff 9d   sbc $9dff8d,x
$06:b9a2  ff cd ff f6   sbc $f6ffcd,x
$06:b9a6  ff 4d ff 74   sbc $74ff4d,x
$06:b9aa  ff 4e ff cf   sbc $cfff4e,x
$06:b9ae  ff 8a f8 a9   sbc $a9f88a,x
$06:b9b2  f9 d1 c7	  sbc $c7d1,y
$06:b9b5  f3 7f		 sbc ($7f,s),y
$06:b9b7  dd de b5	  cmp $b5de,x
$06:b9ba  8f fb ff ff   sta $fffffb
$06:b9be  ff 87 ff 87   sbc $87ff87,x
$06:b9c2  ff 79 ff f2   sbc $f2ff79,x
$06:b9c6  ff 6d ff f4   sbc $f4ff6d,x
$06:b9ca  ff 82 ff ff   sbc $ffff82,x
$06:b9ce  ff cb cf b3   sbc $b3cfcb,x
$06:b9d2  f3 5c		 sbc ($5c,s),y
$06:b9d4  7c a7 ff	  jmp ($ffa7,x)
$06:b9d7  49 74 a5	  eor #$a574
$06:b9da  de 8b f6	  dec $f68b,x
$06:b9dd  25 7e		 and $7e
$06:b9df  cf f3 33 3d   cmp $3d33f3
$06:b9e3  8c 0f 03	  sty $030f
$06:b9e6  03 83		 ora $83,s
$06:b9e8  00 01		 brk #$01
$06:b9ea  00 01		 brk #$01
$06:b9ec  00 81		 brk #$81
$06:b9ee  00 cf		 brk #$cf
$06:b9f0  ff 3f fc f9   sbc $f9fc3f,x
$06:b9f4  f0 e7		 beq $b9dd
$06:b9f6  c5 81		 cmp $81
$06:b9f8  00 e3		 brk #$e3
$06:b9fa  41 09		 eor ($09,x)
$06:b9fc  00 b1		 brk #$b1
$06:b9fe  20 ff c3	  jsr $c3ff
$06:ba01  ff 0c ff 30   sbc $30ff0c,x
$06:ba05  fb			xce
$06:ba06  c1 ff		 cmp ($ff,x)
$06:ba08  00 bf		 brk #$bf
$06:ba0a  01 ff		 ora ($ff,x)
$06:ba0c  00 df		 brk #$df
$06:ba0e  00 af		 brk #$af
$06:ba10  ef be ff 5e   sbc $5effbe
$06:ba14  de a5 ff	  dec $ffa5,x
$06:ba17  7f ff bf ff   adc $ffbfff,x
$06:ba1b  c0 c0 ff	  cpy #$ffc0
$06:ba1e  ff 90 80 80   sbc $808090,x
$06:ba22  80 21		 bra $ba45
$06:ba24  00 00		 brk #$00
$06:ba26  00 7f		 brk #$7f
$06:ba28  7f ff 80 c0   adc $c080ff,x
$06:ba2c  bf ff ff bf   lda $bfffff,x
$06:ba30  bf f5 ff f4   lda $f4fff5,x
$06:ba34  f7 9e		 sbc [$9e],y
$06:ba36  ff fe ff ff   sbc $fffffe,x
$06:ba3a  ff 5b 03 ff   sbc $ff035b,x
$06:ba3e  ff 43 03 01   sbc $010343,x
$06:ba42  01 08		 ora ($08,x)
$06:ba44  00 00		 brk #$00
$06:ba46  00 fe		 brk #$fe
$06:ba48  fe ff 01	  inc $01ff,x
$06:ba4b  03 fd		 ora $fd,s
$06:ba4d  ff ff 7f ff   sbc $ff7fff,x
$06:ba51  e6 ff		 inc $ff
$06:ba53  bf ff e0 ff   lda $ffe0ff,x
$06:ba57  b8			clv
$06:ba58  ff 91 ff bd   sbc $bdff91,x
$06:ba5c  fe e4 f3	  inc $f3e4,x
$06:ba5f  ff 7f ff c0   sbc $c0ff7f,x
$06:ba63  ff bf ff e0   sbc $e0ffbf,x
$06:ba67  fe b9 f3	  inc $f3b9,x
$06:ba6a  9d eb bf	  sta $bfeb,x
$06:ba6d  ee fd 97	  inc $97fd
$06:ba70  82 ff 7c	  brl $3772
$06:ba73  ee 60 fd	  inc $fd60
$06:ba76  c1 ce		 cmp ($ce,x)
$06:ba78  86 f7		 stx $f7
$06:ba7a  76 e3		 ror $e3,x
$06:ba7c  61 97		 adc ($97,x)
$06:ba7e  82 ff 82	  brl $3d80
$06:ba81  8f 0c 9f 00   sta $009f0c
$06:ba85  fe c0 f9	  inc $f9c0,x
$06:ba88  80 89		 bra $ba13
$06:ba8a  00 9f		 brk #$9f
$06:ba8c  01 ff		 ora ($ff,x)
$06:ba8e  82 e9 41	  brl $fc7a
$06:ba91  ff 3e 77 06   sbc $06773e,x
$06:ba95  bf 83 73 61   lda $617383,x
$06:ba99  ef 6e c7 86   sbc $86c76e
$06:ba9d  e9 41 ff	  sbc #$ff41
$06:baa0  41 f1		 eor ($f1,x)
$06:baa2  30 f9		 bmi $ba9d
$06:baa4  00 7f		 brk #$7f
$06:baa6  03 9f		 ora $9f,s
$06:baa8  01 91		 ora ($91,x)
$06:baaa  00 f9		 brk #$f9
$06:baac  80 ff		 bra $baad
$06:baae  41 c2		 eor ($c2,x)
$06:bab0  3c 81 42	  bit $4281,x
$06:bab3  00 81		 brk #$81
$06:bab5  00 99		 brk #$99
$06:bab7  01 84		 ora ($84,x)
$06:bab9  80 44		 bra $baff
$06:babb  c0 38 c0	  cpy #$c038
$06:babe  20 3c c3	  jsr $c33c
$06:bac1  42 bd		 wdm #$bd
$06:bac3  81 7e		 sta ($7e,x)
$06:bac5  99 66 84	  sta $8466,y
$06:bac8  7b			tdc
$06:bac9  44 bb 38	  mvp $38,$bb
$06:bacc  c7 20		 cmp [$20]
$06:bace  df c0 20 c4   cmp $c420c0,x
$06:bad2  23 88		 and $88,s
$06:bad4  44 10 88	  mvp $88,$10
$06:bad7  10 09		 bpl $bae2
$06:bad9  30 08		 bmi $bae3
$06:badb  18			clc
$06:badc  04 2c		 tsb $2c
$06:bade  03 20		 ora $20,s
$06:bae0  df 23 dc 44   cmp $44dc23,x
$06:bae4  bb			tyx
$06:bae5  88			dey
$06:bae6  77 09		 adc [$09],y
$06:bae8  f6 08		 inc $08,x
$06:baea  f7 04		 sbc [$04],y
$06:baec  fb			xce
$06:baed  03 fc		 ora $fc,s
$06:baef  79 04 7a	  adc $7a04,y
$06:baf2  84 b1		 sty $b1
$06:baf4  48			pha
$06:baf5  b2 48		 lda ($48)
$06:baf7  20 9f 23	  jsr $239f
$06:bafa  10 49		 bpl $bb45
$06:bafc  20 16 c0	  jsr $c016
$06:baff  04 fb		 tsb $fb
$06:bb01  84 7b		 sty $7b
$06:bb03  48			pha
$06:bb04  b7 48		 lda [$48],y
$06:bb06  b7 9f		 lda [$9f],y
$06:bb08  60			rts
$06:bb09  10 ef		 bpl $bafa
$06:bb0b  20 df c0	  jsr $c0df
$06:bb0e  3f e1 ad f9   and $f9ade1,x
$06:bb12  ed bd 9d	  sbc $9dbd
$06:bb15  f1 f5		 sbc ($f5),y
$06:bb17  9d 95 da	  sta $da95,x
$06:bb1a  9a			txs
$06:bb1b  ed cd ff	  sbc $ffcd
$06:bb1e  ff f2 a1 f2   sbc $f2a1f2,x
$06:bb22  e1 f2		 sbc ($f2,x)
$06:bb24  91 fa		 sta ($fa),y
$06:bb26  f1 fa		 sbc ($fa),y
$06:bb28  91 fd		 sta ($fd),y
$06:bb2a  98			tya
$06:bb2b  fe cc ff	  inc $ffcc,x
$06:bb2e  ff ff f9 cf   sbc $cff9ff,x
$06:bb32  07 fb		 ora [$fb]
$06:bb34  fd e7 ff	  sbc $ffe7,x
$06:bb37  d9 b9 bd	  cmp $bdb9,y
$06:bb3a  39 7b 77	  and $777b,y
$06:bb3d  a7 3f		 lda [$3f]
$06:bb3f  ff f9 ff 07   sbc $07fff9,x
$06:bb43  fb			xce
$06:bb44  f9 e3 e7	  sbc $e7e3,y
$06:bb47  c7 89		 cmp [$89]
$06:bb49  cf 19 bb 33   cmp $33bb19
$06:bb4d  c3 07		 cmp $07,s
$06:bb4f  7e ff db	  ror $dbff,x
$06:bb52  db			stp
$06:bb53  24 81		 bit $81
$06:bb55  99 e7 66	  sta $66e7,y
$06:bb58  e7 5a		 sbc [$5a]
$06:bb5a  ff a5 ff ff   sbc $ffffa5,x
$06:bb5e  ff ff 7e db   sbc $db7eff,x
$06:bb62  24 81		 bit $81
$06:bb64  7e e7 99	  ror $99e7,x
$06:bb67  e7 7e		 sbc [$7e]
$06:bb69  ff 18 ff 81   sbc $81ff18,x
$06:bb6d  ff ff af ff   sbc $ffafff,x
$06:bb71  7b			tdc
$06:bb72  f3 7d		 sbc ($7d,s),y
$06:bb74  f1 7d		 sbc ($7d),y
$06:bb76  f1 7d		 sbc ($7d),y
$06:bb78  f1 7d		 sbc ($7d),y
$06:bb7a  f1 7d		 sbc ($7d),y
$06:bb7c  f1 7d		 sbc ($7d),y
$06:bb7e  f1 81		 sbc ($81),y
$06:bb80  ff 22 dd 20   sbc $20dd22,x
$06:bb84  df 20 df 20   cmp $20df20,x
$06:bb88  df 20 df 20   cmp $20df20,x
$06:bb8c  df 20 df b2   cmp $b2df20,x
$06:bb90  f4 ea fb	  pea $fbea
$06:bb93  a0 ff e8	  ldy #$e8ff
$06:bb96  fd a6 f5	  sbc $f5a6,x
$06:bb99  f9 ff a0	  sbc $a0ff,y
$06:bb9c  fa			plx
$06:bb9d  e0 f9 f1	  cpx #$f1f9
$06:bba0  bf ff ef fd   lda $fdefff,x
$06:bba4  a2 fa e7	  ldx #$e7fa
$06:bba7  f6 ab		 inc $ab,x
$06:bba9  ff fa f1 af   sbc $aff1fa,x
$06:bbad  f5 af		 sbc $af,x
$06:bbaf  b9 fd b8	  lda $b8fd,y
$06:bbb2  f4 ed fa	  pea $faed
$06:bbb5  ac ef f3	  ldy $f3ef
$06:bbb8  fd f0 f9	  sbc $f9f0,x
$06:bbbb  ee fb e8	  inc $e8fb
$06:bbbe  ef fb b6 f5   sbc $f5b6fb
$06:bbc2  bf fd af ee   lda $eeaffd,x
$06:bbc6  b9 fb e6	  lda $e6fb,y
$06:bbc9  fd b6 fe	  sbc $feb6,x
$06:bbcc  a7 ee		 lda [$ee]
$06:bbce  fb			xce
$06:bbcf  9e 32 fa	  stz $fa32,x
$06:bbd2  f2 9d		 sbc ($9d)
$06:bbd4  31 9b		 and ($9b),y
$06:bbd6  13 9a		 ora ($9a,s),y
$06:bbd8  d2 3d		 cmp ($3d)
$06:bbda  31 bb		 and ($bb),y
$06:bbdc  33 5d		 and ($5d,s),y
$06:bbde  51 dd		 eor ($dd),y
$06:bbe0  30 fd		 bmi $bbdf
$06:bbe2  f0 de		 beq $bbc2
$06:bbe4  30 fc		 bmi $bbe2
$06:bbe6  10 bd		 bpl $bba5
$06:bbe8  d0 de		 bne $bbc8
$06:bbea  10 dc		 bpl $bbc8
$06:bbec  10 be		 bpl $bbac
$06:bbee  10 ba		 bpl $bbaa
$06:bbf0  30 5f		 bmi $bc51
$06:bbf2  1f dd 11 7a   ora $7a11dd,x
$06:bbf6  32 1b		 and ($1b)
$06:bbf8  93 bd		 sta ($bd,s),y
$06:bbfa  31 ba		 and ($ba),y
$06:bbfc  32 58		 and ($58)
$06:bbfe  10 df		 bpl $bbdf
$06:bc00  10 ff		 bpl $bc01
$06:bc02  1f fe 10 dd   ora $dd10fe,x
$06:bc06  10 7c		 bpl $bc84
$06:bc08  90 de		 bcc $bbe8
$06:bc0a  10 dd		 bpl $bbe9
$06:bc0c  10 ff		 bpl $bc0d
$06:bc0e  10 e1		 bpl $bbf1
$06:bc10  80 ff		 bra $bc11
$06:bc12  e8			inx
$06:bc13  f2 82		 sbc ($82)
$06:bc15  ed 8f f6	  sbc $f68f
$06:bc18  97 ca		 sta [$ca],y
$06:bc1a  83 f5		 sta $f5,s
$06:bc1c  85 ca		 sta $ca
$06:bc1e  83 ff		 sta $ff,s
$06:bc20  80 ff		 bra $bc21
$06:bc22  e8			inx
$06:bc23  fd 80 f0	  sbc $f080,x
$06:bc26  80 e8		 bra $bc10
$06:bc28  80 fc		 bra $bc26
$06:bc2a  80 fa		 bra $bc26
$06:bc2c  80 fc		 bra $bc2a
$06:bc2e  80 d4		 bra $bc04
$06:bc30  97 f5		 sta [$f5],y
$06:bc32  87 d8		 sta [$d8]
$06:bc34  81 f6		 sta ($f6,x)
$06:bc36  87 ed		 sta [$ed]
$06:bc38  87 e4		 sta [$e4]
$06:bc3a  87 d0		 sta [$d0]
$06:bc3c  83 d9		 sta $d9,s
$06:bc3e  8d e8 80	  sta $80e8
$06:bc41  f8			sed
$06:bc42  80 fe		 bra $bc42
$06:bc44  80 f8		 bra $bc3e
$06:bc46  80 f8		 bra $bc40
$06:bc48  80 f8		 bra $bc42
$06:bc4a  80 fc		 bra $bc48
$06:bc4c  80 f2		 bra $bc40
$06:bc4e  80 14		 bra $bc64
$06:bc50  e9 8a 70	  sbc #$708a
$06:bc53  31 c4		 and ($c4),y
$06:bc55  42 f9		 wdm #$f9
$06:bc57  05 ba		 ora $ba
$06:bc59  24 bb		 bit $bb
$06:bc5b  48			pha
$06:bc5c  8f 02 fd fd   sta $fdfd02
$06:bc60  fe fa ff	  inc $fffa,x
$06:bc63  b1 7f		 lda ($7f),y
$06:bc65  f3 0f		 sbc ($0f,s),y
$06:bc67  8f 77 af 57   sta $57af77
$06:bc6b  cb			wai
$06:bc6c  77 ff		 adc [$ff],y
$06:bc6e  03 55		 ora $55,s
$06:bc70  ff bf 32 5d   sbc $5d32bf,x
$06:bc74  5e bb 13	  lsr $13bb,x
$06:bc77  76 30		 ror $30,x
$06:bc79  b9 30 da	  lda $da30,y
$06:bc7c  50 35		 bvc $bcb3
$06:bc7e  31 55		 and ($55),y
$06:bc80  ff ff 32 bd   sbc $bd32ff,x
$06:bc84  1e ff 13	  asl $13ff,x
$06:bc87  df 10 df 10   cmp $10df10,x
$06:bc8b  bf 10 de 10   lda $10de10,x
$06:bc8f  95 ff		 sta $ff,x
$06:bc91  7d 00 89	  adc $8900,x
$06:bc94  42 54		 wdm #$54
$06:bc96  44 9f 72	  mvp $72,$9f
$06:bc99  f5 b2		 sbc $b2,x
$06:bc9b  9e cc a3	  stz $a3cc,x
$06:bc9e  97 95		 sta [$95],y
$06:bca0  ff ff 00 bd   sbc $bd00ff,x
$06:bca4  42 bb		 wdm #$bb
$06:bca6  00 9f		 brk #$9f
$06:bca8  72 fd		 adc ($fd)
$06:bcaa  b2 bf		 lda ($bf)
$06:bcac  cc eb 97	  cpy $97eb
$06:bcaf  c2 ff		 rep #$ff
$06:bcb1  81 ff		 sta ($ff,x)
$06:bcb3  00 ff		 brk #$ff
$06:bcb5  00 ff		 brk #$ff
$06:bcb7  01 ff		 ora ($ff,x)
$06:bcb9  80 ff		 bra $bcba
$06:bcbb  c0 ff c0	  cpy #$c0ff
$06:bcbe  ff c3 3c bd   sbc $bd3cc3,x
$06:bcc2  42 7e		 wdm #$7e
$06:bcc4  81 66		 sta ($66,x)
$06:bcc6  99 7b 84	  sta $847b,y
$06:bcc9  bb			tyx
$06:bcca  44 c7 38	  mvp $38,$c7
$06:bccd  df 20 c0 ff   cmp $ffc020,x
$06:bcd1  c4 ff		 cpy $ff
$06:bcd3  88			dey
$06:bcd4  ff 10 ff 10   sbc $10ff10,x
$06:bcd8  ff 30 ff 18   sbc $18ff30,x
$06:bcdc  ff 2c ff df   sbc $dfff2c,x
$06:bce0  20 dc 23	  jsr $23dc
$06:bce3  bb			tyx
$06:bce4  44 77 88	  mvp $88,$77
$06:bce7  f6 09		 inc $09,x
$06:bce9  f7 08		 sbc [$08],y
$06:bceb  fb			xce
$06:bcec  04 fc		 tsb $fc
$06:bcee  03 79		 ora $79,s
$06:bcf0  ff 7a ff b1   sbc $b1ff7a,x
$06:bcf4  ff b2 ff 20   sbc $20ffb2,x
$06:bcf8  ff 23 ff 49   sbc $49ff23,x
$06:bcfc  ff 16 ff fb   sbc $fbff16,x
$06:bd00  04 7b		 tsb $7b
$06:bd02  84 b7		 sty $b7
$06:bd04  48			pha
$06:bd05  b7 48		 lda [$48],y
$06:bd07  60			rts
$06:bd08  9f ef 10 df   sta $df10ef,x
$06:bd0c  20 3f c0	  jsr $c03f
$06:bd0f  81 ff		 sta ($ff,x)
$06:bd11  bd fd ea	  lda $eafd,x
$06:bd14  e5 a8		 sbc $a8
$06:bd16  fe f0 f7	  inc $f7f0,x
$06:bd19  f6 ff		 inc $ff,x
$06:bd1b  e2 ff		 sep #$ff
$06:bd1d  ef ff da ad   sbc $addaff
$06:bd21  eb			xba
$06:bd22  bf ff bb fa   lda $fabbff,x
$06:bd26  a5 f4		 lda $f4
$06:bd28  fb			xce
$06:bd29  ff b2 ff a0   sbc $a0ffb2,x
$06:bd2d  ff ef b5 35   sbc $35b5ef,x
$06:bd31  ab			plb
$06:bd32  33 9e		 and ($9e,s),y
$06:bd34  16 6b		 asl $6b,x
$06:bd36  33 bd		 and ($bd,s),y
$06:bd38  34 b7		 bit $b7,x
$06:bd3a  37 2d		 and [$2d],y
$06:bd3c  7d 3a aa	  adc $aa3a,x
$06:bd3f  db			stp
$06:bd40  11 cd		 ora ($cd),y
$06:bd42  11 fb		 ora ($fb),y
$06:bd44  12 ce		 ora ($ce)
$06:bd46  12 df		 ora ($df)
$06:bd48  14 df		 trb $df
$06:bd4a  17 8a		 ora [$8a],y
$06:bd4c  58			cli
$06:bd4d  5d 88 e1	  eor $e188,x
$06:bd50  00 d8		 brk #$d8
$06:bd52  01 e2		 ora ($e2,x)
$06:bd54  42 de		 wdm #$de
$06:bd56  82 f7 45	  brl $0350
$06:bd59  ec 85 5d	  cpx $5d85
$06:bd5c  89 ef		 bit #$ef
$06:bd5e  4e ff 00	  lsr $00ff
$06:bd61  fe 01 ff	  inc $ff01,x
$06:bd64  42 ff		 wdm #$ff
$06:bd66  82 fe 44	  brl $0267
$06:bd69  fe 84 7e	  inc $7e84,x
$06:bd6c  88			dey
$06:bd6d  ff 4e bf aa   sbc $aabf4e,x
$06:bd71  9f 95 9f 8f   sta $8f9f95,x
$06:bd75  af a3 df 89   lda $89dfa3
$06:bd79  af a5 df 8b   lda $8bdfa5
$06:bd7d  ef e5 ff aa   sbc $aaffe5
$06:bd81  ff 95 ff 8f   sbc $8fff95,x
$06:bd85  df 83 ff 89   cmp $89ff83,x
$06:bd89  df 85 ff 8b   cmp $8bff85,x
$06:bd8d  df c5 d9 df   cmp $dfd9c5,x
$06:bd91  9f fd 94 f4   sta $f494fd,x
$06:bd95  ce ce e7	  dec $e7ce
$06:bd98  ff e2 bb fa   sbc $fabbe2,x
$06:bd9c  9b			txy
$06:bd9d  ff 83 b0 90   sbc $90b083,x
$06:bda1  92 91		 sta ($91)
$06:bda3  9b			txy
$06:bda4  97 f9		 sta [$f9],y
$06:bda6  cf c7 c7 e4   cmp $e4c7c7
$06:bdaa  a0 fc		 ldy #$fc
$06:bdac  98			tya
$06:bdad  ff 83 7d 0d   sbc $0d7d83,x
$06:bdb1  f9 8f b9	  sbc $b98f,y
$06:bdb4  2f 73 73 e3   and $e37373
$06:bdb8  fb			xce
$06:bdb9  25 f9		 and $f9
$06:bdbb  1d d5 ed	  ora $edd5,x
$06:bdbe  8d fb 09	  sta $09fb
$06:bdc1  79 89 d9	  adc $d989,y
$06:bdc4  e9 9f		 sbc #$9f
$06:bdc6  f3 e7		 sbc ($e7,s),y
$06:bdc8  e3 07		 sbc $07,s
$06:bdca  01 3b		 ora ($3b,x)
$06:bdcc  11 f3		 ora ($f3),y
$06:bdce  81 48		 sta ($48,x)
$06:bdd0  fa			plx
$06:bdd1  f8			sed
$06:bdd2  07 79		 ora [$79]
$06:bdd4  a7 df		 lda [$df]
$06:bdd6  20 ea 95	  jsr $95ea
$06:bdd9  99 ff 66	  sta $66ff,y
$06:bddc  64 ff		 stz $ff
$06:bdde  92 05		 sta ($05)
$06:bde0  02 00		 cop #$00
$06:bde2  02 00		 cop #$00
$06:bde4  02 02		 cop #$02
$06:bde6  00 02		 brk #$02
$06:bde8  00 00		 brk #$00
$06:bdea  02 9b		 cop #$9b
$06:bdec  00 ff		 brk #$ff
$06:bdee  92 8d		 sta ($8d)
$06:bdf0  ff ff 10 6d   sbc $6d10ff,x
$06:bdf4  d3 f2		 cmp ($f2,s),y
$06:bdf6  0f 6a 9d ad   ora $ad9d6a
$06:bdfa  ff 53 53 8d   sbc $8d5353,x
$06:bdfe  72 00		 adc ($00)
$06:be00  00 00		 brk #$00
$06:be02  00 00		 brk #$00
$06:be04  00 00		 brk #$00
$06:be06  00 00		 brk #$00
$06:be08  00 00		 brk #$00
$06:be0a  00 ac		 brk #$ac
$06:be0c  00 8d		 brk #$8d
$06:be0e  72 66		 adc ($66)
$06:be10  64 9a		 stz $9a
$06:be12  98			tya
$06:be13  35 02		 and $02,x
$06:be15  9f 72 54 44   sta $445472,x
$06:be19  89 42		 bit #$42
$06:be1b  7d 00 95	  adc $9500,x
$06:be1e  ff 9b 00 67   sbc $67009b,x
$06:be22  00 fd		 brk #$fd
$06:be24  02 9f		 cop #$9f
$06:be26  72 bb		 adc ($bb)
$06:be28  00 bd		 brk #$bd
$06:be2a  42 ff		 wdm #$ff
$06:be2c  00 95		 brk #$95
$06:be2e  ff 64 66 9a   sbc $9a6664,x
$06:be32  9a			txs
$06:be33  35 00		 and $00,x
$06:be35  9f 72 56 46   sta $465672,x
$06:be39  89 42		 bit #$42
$06:be3b  7f 02 95 ff   adc $ff9502,x
$06:be3f  99 00 65	  sta $6500,y
$06:be42  00 ff		 brk #$ff
$06:be44  00 9f		 brk #$9f
$06:be46  72 bb		 adc ($bb)
$06:be48  02 bd		 cop #$bd
$06:be4a  42 ff		 wdm #$ff
$06:be4c  02 95		 cop #$95
$06:be4e  ff e9 ff 4a   sbc $4affe9,x
$06:be52  ff a0 b9 37   sbc $37b9a0,x
$06:be56  bf aa 1f 11   lda $111faa,x
$06:be5a  df 43 37 23   cmp $233743,x
$06:be5e  af ff e1 ff   lda $ffe1ff
$06:be62  08			php
$06:be63  c9 76		 cmp #$76
$06:be65  3f d8 eb f6   and $f6ebd8,x
$06:be69  57 a9		 eor [$a9],y
$06:be6b  5b			tcd
$06:be6c  ef 6b df c7   sbc $c7df6b
$06:be70  87 91		 sta [$91]
$06:be72  97 a1		 sta [$a1],y
$06:be74  b9 e6 f9	  lda $f9e6,y
$06:be77  9a			txs
$06:be78  93 9b		 sta ($9b,s),y
$06:be7a  f3 16		 sbc ($16,s),y
$06:be7c  61 1e		 adc ($1e,x)
$06:be7e  73 ff		 adc ($ff,s),y
$06:be80  87 f8		 sta [$f8]
$06:be82  90 e6		 bcc $be6a
$06:be84  a0 c6		 ldy #$c6
$06:be86  c0 ee		 cpy #$ee
$06:be88  82 9e 92	  brl $5129
$06:be8b  9e 00 9e	  stz $9e00,x
$06:be8e  12 ff		 ora ($ff)
$06:be90  ff ff e0 be   sbc $bee0ff,x
$06:be94  a0 d7		 ldy #$d7
$06:be96  c0 bd		 cpy #$bd
$06:be98  a0 eb		 ldy #$eb
$06:be9a  cb			wai
$06:be9b  c5 85		 cmp $85
$06:be9d  d7 d7		 cmp [$d7],y
$06:be9f  e5 ff		 sbc $ff
$06:bea1  80 ff		 bra $bea2
$06:bea3  00 ff		 brk #$ff
$06:bea5  80 ff		 bra $bea6
$06:bea7  00 ff		 brk #$ff
$06:bea9  0a			asl a
$06:beaa  f5 05		 sbc $05,x
$06:beac  fa			plx
$06:bead  95 eb		 sta $eb,x
$06:beaf  df 9f f4 80   cmp $80f49f,x
$06:beb3  ff c1 fd a8   sbc $a8fdc1,x
$06:beb7  ff ff ff c3   sbc $c3ffff,x
$06:bebb  bf bd c3 bf   lda $bfc3bd,x
$06:bebf  e0 80		 cpx #$80
$06:bec1  ff 80 ff c1   sbc $c1ff80,x
$06:bec5  ff a8 ff ff   sbc $ffffa8,x
$06:bec9  ff c3 c3 81   sbc $81c3c3,x
$06:becd  c1 81		 cmp ($81,x)
$06:becf  ff ff bb 01   sbc $01bbff,x
$06:bed3  ff 13 ee 4a   sbc $4aee13,x
$06:bed7  ff ff fd ad   sbc $adfdff,x
$06:bedb  ba			tsx
$06:bedc  1a			inc a
$06:bedd  58			cli
$06:bede  58			cli
$06:bedf  01 01		 ora ($01,x)
$06:bee1  ff 01 fe 12   sbc $12fe01,x
$06:bee5  ff 4a fc fc   sbc $fcfc4a,x
$06:bee9  fe ac fd	  inc $fdac,x
$06:beec  18			clc
$06:beed  bf 18 ac bd   lda $bdac18,x
$06:bef1  7e bd d5	  ror $d5bd,x
$06:bef4  c7 8c		 cmp [$8c]
$06:bef6  f9 93 af	  sbc $af93,y
$06:bef9  c4 dd		 cpy $dd
$06:befb  2e bd d8	  rol $d8bd
$06:befe  8f c3 80 42   sta $4280c3
$06:bf02  c1 b1		 cmp ($b1,x)
$06:bf04  ff a7 fe 85   sbc $85fea7,x
$06:bf08  ff cf b6 ba   sbc $bab6cf,x
$06:bf0c  5f 9b fe ef   eor $effe9b,x
$06:bf10  ff f2 ff bf   sbc $bffff2,x
$06:bf14  ff ca ff 80   sbc $80ffca,x
$06:bf18  ff ff ff ea   sbc $eaffff,x
$06:bf1c  ff ff ff ff   sbc $ffffff,x
$06:bf20  a2 ff		 ldx #$ff
$06:bf22  e2 ff		 sep #$ff
$06:bf24  bf ff c0 ff   lda $ffc0ff,x
$06:bf28  80 ff		 bra $bf29
$06:bf2a  ff ff 82 ff   sbc $ff82ff,x
$06:bf2e  ff 35 b1 58   sbc $58b135,x
$06:bf32  50 75		 bvc $bfa9
$06:bf34  60			rts
$06:bf35  bf 35 74 60   lda $607435,x
$06:bf39  e9 40		 sbc #$40
$06:bf3b  d4 94		 pei ($94)
$06:bf3d  a9 ff		 lda #$ff
$06:bf3f  5e 90 bf	  lsr $bf90,x
$06:bf42  10 bf		 bpl $bf03
$06:bf44  20 ff 35	  jsr $35ff
$06:bf47  ff 60 ff 40   sbc $40ff60,x
$06:bf4b  eb			xba
$06:bf4c  80 a9		 bra $bef7
$06:bf4e  ff dd 91 f6   sbc $f691dd,x
$06:bf52  53 73		 eor ($73,s),y
$06:bf54  a3 ed		 lda $ed,s
$06:bf56  a7 d2		 lda [$d2]
$06:bf58  42 e9		 wdm #$e9
$06:bf5a  49 d5		 eor #$d5
$06:bf5c  80 ff		 bra $bf5d
$06:bf5e  d4 fe		 pei ($fe)
$06:bf60  90 fc		 bcc $bf5e
$06:bf62  50 7c		 bvc $bfe0
$06:bf64  a0 f8		 ldy #$f8
$06:bf66  a0 fd		 ldy #$fd
$06:bf68  40			rti
$06:bf69  f6 40		 inc $40,x
$06:bf6b  ff 80 ff d4   sbc $d4ff80,x
$06:bf6f  d7 90		 cmp [$90],y
$06:bf71  b7 b2		 lda [$b2],y
$06:bf73  db			stp
$06:bf74  98			tya
$06:bf75  ab			plb
$06:bf76  a8			tay
$06:bf77  dd dc f6	  cmp $f6dc,x
$06:bf7a  d6 c9		 dec $c9,x
$06:bf7c  8b			phb
$06:bf7d  ff 7f ef 80   sbc $80ef7f,x
$06:bf81  cf 82 e7 80   cmp $80e782
$06:bf85  d7 80		 cmp [$80],y
$06:bf87  e3 c0		 sbc $c0,s
$06:bf89  e9 c0		 sbc #$c0
$06:bf8b  f4 80 ff	  pea $ff80
$06:bf8e  7f e9 c1 e9   adc $e9c1e9,x
$06:bf92  c1 fa		 cmp ($fa,x)
$06:bf94  e2 fc		 sep #$fc
$06:bf96  60			rts
$06:bf97  fe b0 ff	  inc $ffb0,x
$06:bf9a  3c 7f 5f	  bit $5f7f,x
$06:bf9d  ff 00 fe c0   sbc $c0fe00,x
$06:bfa1  fe c0 fd	  inc $fdc0,x
$06:bfa4  e0 ff		 cpx #$ff
$06:bfa6  60			rts
$06:bfa7  ff b0 ff 3c   sbc $3cffb0,x
$06:bfab  ff 5f ff 00   sbc $00ff5f,x
$06:bfaf  7b			tdc
$06:bfb0  7a			ply
$06:bfb1  5b			tcd
$06:bfb2  5a			phy
$06:bfb3  e6 e4		 inc $e4
$06:bfb5  a7 a4		 lda [$a4]
$06:bfb7  0c 08 39	  tsb $3908
$06:bfba  30 e4		 bmi $bfa0
$06:bfbc  c0 ff		 cpy #$ff
$06:bfbe  00 87		 brk #$87
$06:bfc0  02 a7		 cop #$a7
$06:bfc2  02 1f		 cop #$1f
$06:bfc4  04 5f		 tsb $5f
$06:bfc6  04 ff		 tsb $ff
$06:bfc8  08			php
$06:bfc9  ff 30 ff c0   sbc $c0ff30,x
$06:bfcd  ff 00 ae dd   sbc $ddae00,x
$06:bfd1  9d e3 d2	  sta $d2e3,x
$06:bfd4  fe ad af	  inc $afad,x
$06:bfd7  5a			phy
$06:bfd8  12 ff		 ora ($ff)
$06:bfda  54 69 9a	  mvn $9a,$69
$06:bfdd  64 ff		 stz $ff
$06:bfdf  00 00		 brk #$00
$06:bfe1  00 00		 brk #$00
$06:bfe3  01 00		 ora ($00,x)
$06:bfe5  50 00		 bvc $bfe7
$06:bfe7  ed 00 ff	  sbc $ff00
$06:bfea  54 04 02	  mvn $02,$04
$06:bfed  00 02		 brk #$02
$06:bfef  d8			cld
$06:bff0  6a			ror a
$06:bff1  2a			rol a
$06:bff2  dc b7 fd	  jml [$fdb7]
$06:bff5  de de 2b	  dec $2bde,x
$06:bff8  28			plp
$06:bff9  c5 bb		 cmp $bb
$06:bffb  6d f6 ba	  adc $baf6
$06:bffe  ff 05 02 03   sbc $030205,x
$06:c002  00 02		 brk #$02
$06:c004  00 23		 brk #$23
$06:c006  02 d7		 cop #$d7
$06:c008  00 c5		 brk #$c5
$06:c00a  bb			tyx
$06:c00b  00 00		 brk #$00
$06:c00d  00 00		 brk #$00
$06:c00f  bf 8f fa d3   lda $d3fa8f,x
$06:c013  a2 bb		 ldx #$bb
$06:c015  e6 fc		 inc $fc
$06:c017  cd cf 91	  cmp $91cf
$06:c01a  f7 9b		 sbc [$9b],y
$06:c01c  ff d5 df ff   sbc $ffdfd5,x
$06:c020  8f bc 90 e4   sta $e490bc
$06:c024  a0 c7		 ldy #$c7
$06:c026  c4 f8		 cpy $f8
$06:c028  c8			iny
$06:c029  98			tya
$06:c02a  90 90		 bcc $bfbc
$06:c02c  90 b0		 bcc $bfde
$06:c02e  90 fd		 bcc $c02d
$06:c030  f3 1f		 sbc ($1f,s),y
$06:c032  cb			wai
$06:c033  25 f9		 and $f9
$06:c035  67 3f		 adc [$3f]
$06:c037  57 d7		 eor [$d7],y
$06:c039  b9 8f 79	  lda $798f,y
$06:c03c  2f 7d 1d fd   and $fd1d7d
$06:c040  f1 3d		 sbc ($3d),y
$06:c042  09 07		 ora #$07
$06:c044  01 e3		 ora ($e3,x)
$06:c046  23 3b		 and $3b,s
$06:c048  13 79		 ora ($79,s),y
$06:c04a  09 f9		 ora #$f9
$06:c04c  29 fb		 and #$fb
$06:c04e  19 95 2f	  ora $2f95,y
$06:c051  4b			phk
$06:c052  3b			tsc
$06:c053  99 8f 8d	  sta $8d8f,y
$06:c056  df 12 b3 09   cmp $09b312,x
$06:c05a  b7 c2		 lda [$c2],y
$06:c05c  e3 d5		 sbc $d5,s
$06:c05e  ff 1f f1 7b   sbc $7bf11f,x
$06:c062  d5 db		 cmp $db,x
$06:c064  75 4b		 adc $4b,x
$06:c066  bc 17 ee	  ldy $ee17,x
$06:c069  f3 4c		 sbc ($4c,s),y
$06:c06b  4b			phk
$06:c06c  fc ff c1	  jsr ($c1ff,x)
$06:c06f  1e 75 1f	  asl $1f75,x
$06:c072  6b			rtl
$06:c073  fe f7 8e	  inc $8ef7,x
$06:c076  3f cf ff f1   and $f1ffcf,x
$06:c07a  b7 fe		 lda [$fe],y
$06:c07c  d6 bf		 dec $bf,x
$06:c07e  87 9e		 sta [$9e]
$06:c080  14 9e		 trb $9e
$06:c082  0a			asl a
$06:c083  9e 96 ce	  stz $ce96,x
$06:c086  0e c6 c6	  asl $c6c6
$06:c089  e8			inx
$06:c08a  a0 f9		 ldy #$f9
$06:c08c  d0 ff		 bne $c08d
$06:c08e  87 ff		 sta [$ff]
$06:c090  ff e0 e0 e1   sbc $e1e0e0,x
$06:c094  e1 e8		 sbc ($e8,x)
$06:c096  e8			inx
$06:c097  e2 e2		 sep #$e2
$06:c099  ff ff ff ff   sbc $ffffff,x
$06:c09d  ff ff ff ff   sbc $ffffff,x
$06:c0a1  a0 ff		 ldy #$ff
$06:c0a3  e0 ff		 cpx #$ff
$06:c0a5  a0 ff		 ldy #$ff
$06:c0a7  e0 ff		 cpx #$ff
$06:c0a9  ea			nop
$06:c0aa  ff ab d5 57   sbc $57d5ab,x
$06:c0ae  a9 9f		 lda #$9f
$06:c0b0  c3 eb		 cmp $eb,s
$06:c0b2  c3 97		 cmp $97,s
$06:c0b4  d7 e9		 cmp [$e9],y
$06:c0b6  e3 d3		 sbc $d3,s
$06:c0b8  d3 d5		 cmp ($d5,s),y
$06:c0ba  c7 e7		 cmp [$e7]
$06:c0bc  e3 d1		 sbc $d1,s
$06:c0be  d3 c3		 cmp ($c3,s),y
$06:c0c0  bd c3 bd	  lda $bdc3,x
$06:c0c3  d7 a9		 cmp [$a9],y
$06:c0c5  e3 9d		 sbc $9d,s
$06:c0c7  d3 ad		 cmp ($ad,s),y
$06:c0c9  c7 b9		 cmp [$b9]
$06:c0cb  e3 9d		 sbc $9d,s
$06:c0cd  d3 ad		 cmp ($ad,s),y
$06:c0cf  be 12 da	  ldx $da12,y
$06:c0d2  32 7d		 and ($7d)
$06:c0d4  f1 bb		 sbc ($bb),y
$06:c0d6  b3 da		 lda ($da,s),y
$06:c0d8  d2 7d		 cmp ($7d)
$06:c0da  71 bb		 adc ($bb),y
$06:c0dc  b3 dd		 lda ($dd,s),y
$06:c0de  d1 fd		 cmp ($fd),y
$06:c0e0  10 dd		 bpl $c0bf
$06:c0e2  30 7e		 bmi $c162
$06:c0e4  f0 fc		 beq $c0e2
$06:c0e6  b0 fd		 bcs $c0e5
$06:c0e8  d0 de		 bne $c0c8
$06:c0ea  50 dc		 bvc $c0c8
$06:c0ec  90 be		 bcc $c0ac
$06:c0ee  90 13		 bcc $c103
$06:c0f0  bd 86 ee	  lda $ee86,x
$06:c0f3  ea			nop
$06:c0f4  f7 a7		 sbc [$a7],y
$06:c0f6  be a7 f6	  ldx $f6a7,y
$06:c0f9  f2 fe		 sbc ($fe)
$06:c0fb  e1 fd		 sbc ($fd,x)
$06:c0fd  e1 ff		 sbc ($ff,x)
$06:c0ff  aa			tax
$06:c100  57 fd		 eor [$fd],y
$06:c102  93 ed		 sta ($ed,s),y
$06:c104  ba			tsx
$06:c105  bf eb fb af   lda $affbeb,x
$06:c109  e9 f7		 sbc #$f7
$06:c10b  ea			nop
$06:c10c  b7 fe		 lda [$fe],y
$06:c10e  a3 23		 lda $23,s
$06:c110  9f 1b 37 02   sta $02371b,x
$06:c114  f9 a2 df	  sbc $dfa2,y
$06:c117  ab			plb
$06:c118  bb			tyx
$06:c119  76 ff		 ror $ff,x
$06:c11b  82 ff ff	  brl $c11d
$06:c11e  ff e7 fb 8e   sbc $8efbe7,x
$06:c122  fb			xce
$06:c123  f7 0e		 sbc [$0e],y
$06:c125  bc 73 bb	  ldy $bb73,x
$06:c128  46 ff		 lsr $ff
$06:c12a  42 ff		 wdm #$ff
$06:c12c  02 ff		 cop #$ff
$06:c12e  ff 44 75 d2   sbc $d27544,x
$06:c132  4c 6c bf	  jmp $bf6c
$06:c135  55 f8		 eor $f8,x
$06:c137  ab			plb
$06:c138  bb			tyx
$06:c139  76 ff		 ror $ff,x
$06:c13b  82 ff ff	  brl $c13d
$06:c13e  ff e6 db 7a   sbc $7adbe6,x
$06:c142  b7 ca		 lda [$ca],y
$06:c144  f5 7f		 sbc $7f,x
$06:c146  cf bb 44 ff   cmp $ff44bb
$06:c14a  42 ff		 wdm #$ff
$06:c14c  00 ff		 brk #$ff
$06:c14e  ff f1 fe 4d   sbc $4dfef1,x
$06:c152  f2 81		 sbc ($81)
$06:c154  f2 60		 sbc ($60)
$06:c156  9a			txs
$06:c157  61 8b		 adc ($8b,x)
$06:c159  15 df		 ora $df,x
$06:c15b  c8			iny
$06:c15c  3f c5 1f fe   and $fe1fc5,x
$06:c160  fe f6 f2	  inc $f2f6,x
$06:c163  df d2 b7 92   cmp $92b7d2,x
$06:c167  fe 8a 6a	  inc $6a8a,x
$06:c16a  4a			lsr a
$06:c16b  62 22 f0	  per $b190
$06:c16e  10 ef		 bpl $c15f
$06:c170  1f 0f 1f 0a   ora $0a1f0f,x
$06:c174  ff 05 ff 0f   sbc $0fff05,x
$06:c178  ef d0 f0 2a   sbc $2af0d0
$06:c17c  ff 92 ff 1f   sbc $1fff92,x
$06:c180  1f ff 1f 1f   ora $1f1fff,x
$06:c184  1a			inc a
$06:c185  1f 10 ef f0   ora $f0ef10,x
$06:c189  f0 ef		 beq $c17a
$06:c18b  ff ba ff ff   sbc $ffffba,x
$06:c18f  00 ff		 brk #$ff
$06:c191  fe ff ff	  inc $ffff,x
$06:c194  ff fe ff fd   sbc $fdfffe,x
$06:c198  01 fd		 ora ($fd,x)
$06:c19a  01 01		 ora ($01,x)
$06:c19c  01 fe		 ora ($fe,x)
$06:c19e  ff 00 ff 00   sbc $00ff00,x
$06:c1a2  ff fe 01 00   sbc $0001fe,x
$06:c1a6  ff 00 ff 00   sbc $00ff00,x
$06:c1aa  ff 00 ff 00   sbc $00ff00,x
$06:c1ae  ff d0 df e6   sbc $e6dfd0,x
$06:c1b2  e0 9c		 cpx #$9c
$06:c1b4  f9 27 bc	  sbc $bc27,y
$06:c1b7  1b			tcs
$06:c1b8  bc 41 bd	  ldy $bd41,x
$06:c1bb  66 81		 ror $81
$06:c1bd  06 91		 asl $91
$06:c1bf  df 30 ff 2e   cmp $2eff30,x
$06:c1c3  c7 3e		 cmp [$3e]
$06:c1c5  db			stp
$06:c1c6  3f c3 7f e6   and $e67fc3,x
$06:c1ca  59 fe 6f	  eor $6ffe,y
$06:c1cd  ff 66 10 f1   sbc $f11066,x
$06:c1d1  61 0d		 adc ($0d,x)
$06:c1d3  6c 12 0d	  jmp ($0d12)
$06:c1d6  03 d0		 ora $d0,s
$06:c1d8  c3 26		 cmp $26,s
$06:c1da  e1 ce		 sbc ($ce,x)
$06:c1dc  e1 00		 sbc ($00,x)
$06:c1de  d1 f1		 cmp ($f1),y
$06:c1e0  1e fd e2	  asl $e2fd,x
$06:c1e3  fe ed ff	  inc $ffed,x
$06:c1e6  dc 3f f8	  jml [$f83f]
$06:c1e9  df ee 1f fe   cmp $fe1fee,x
$06:c1ed  3f c8 85 fe   and $fe85c8,x
$06:c1f1  ef fc de fe   sbc $fedefc
$06:c1f5  b7 fb		 lda [$fb],y
$06:c1f7  fc f1 f9	  jsr ($f9f1,x)
$06:c1fa  f9 b7 e7	  sbc $e7b7,y
$06:c1fd  a5 e7		 lda $e7
$06:c1ff  87 ff		 sta [$ff]
$06:c201  eb			xba
$06:c202  ff d9 ff ad   sbc $adffd9,x
$06:c206  ff ee ff e6   sbc $e6ffee,x
$06:c20a  ff 9a ff 99   sbc $99ff9a,x
$06:c20e  ff bd fd df   sbc $dffdbd,x
$06:c212  ff a7 e6 d2   sbc $d2e6a7,x
$06:c216  cc da c4	  cpy $c4da
$06:c219  e3 e4		 sbc $e4,s
$06:c21b  9f fe e7 fe   sta $fee7fe,x
$06:c21f  be fc c7	  ldx $c7fc,y
$06:c222  ff 9b fe bb   sbc $bbfe9b,x
$06:c226  fc bb fc	  jsr ($fcbb,x)
$06:c229  9b			txy
$06:c22a  fc 87 fe	  jsr ($fe87,x)
$06:c22d  67 fe		 adc [$fe]
$06:c22f  c9 0d		 cmp #$0d
$06:c231  e4 86		 cpx $86
$06:c233  fa			plx
$06:c234  e3 9d		 sbc $9d,s
$06:c236  f9 d7 fe	  sbc $fed7,y
$06:c239  91 ff		 sta ($ff),y
$06:c23b  d0 ff		 bne $c23c
$06:c23d  97 ff		 sta [$ff],y
$06:c23f  f3 01		 sbc ($01,s),y
$06:c241  f9 80 fc	  sbc $fc80,y
$06:c244  e0 9e		 cpx #$9e
$06:c246  f8			sed
$06:c247  c7 fe		 cmp [$fe]
$06:c249  81 ff		 sta ($ff,x)
$06:c24b  c0 ff		 cpy #$ff
$06:c24d  80 ff		 bra $c24e
$06:c24f  fe ff 81	  inc $81ff,x
$06:c252  ff 7f 7f e4   sbc $e47f7f,x
$06:c256  bd 7d 5f	  lda $5f7d,x
$06:c259  d2 9e		 cmp ($9e)
$06:c25b  78			sei
$06:c25c  ef fc f8 00   sbc $00f8fc
$06:c260  ff 81 ff ff   sbc $ffff81,x
$06:c264  7f 66 3c b8   adc $b83c66,x
$06:c268  18			clc
$06:c269  e1 80		 sbc ($80,x)
$06:c26b  70 e0		 bvs $c24d
$06:c26d  1f f8 39 3f   ora $3f39f8,x
$06:c271  45 df		 eor $df
$06:c273  e3 e7		 sbc $e7,s
$06:c275  d1 cb		 cmp ($cb),y
$06:c277  d9 c3 a5	  cmp $a5c3,y
$06:c27a  e7 db		 sbc [$db]
$06:c27c  ff e7 ff f9   sbc $f9ffe7,x
$06:c280  3f 25 1f db   and $db1f25,x
$06:c284  ff bd ff bd   sbc $bdffbd,x
$06:c288  ff 99 ff c3   sbc $c3ff99,x
$06:c28c  ff a7 bf 99   sbc $99bfa7,x
$06:c290  a6 80		 ldx $80
$06:c292  bf db 9b a0   lda $a09bdb,x
$06:c296  a0 df		 ldy #$df
$06:c298  d0 9f		 bne $c239
$06:c29a  dc ff df	  jml [$dfff]
$06:c29d  ff 5e c0 80   sbc $80c05e,x
$06:c2a1  c0 80		 cpy #$80
$06:c2a3  e4 80		 cpx $80
$06:c2a5  ff a0 bf 90   sbc $90bfa0,x
$06:c2a9  bf 9c bf 9f   lda $9fbf9c,x
$06:c2ad  bf 1e 8f 2f   lda $2f8f1e,x
$06:c2b1  75 f7		 adc $f7,x
$06:c2b3  47 57		 eor [$57]
$06:c2b5  f3 7b		 sbc ($7b,s),y
$06:c2b7  e7 2f		 sbc [$2f]
$06:c2b9  f9 1d df	  sbc $df1d,y
$06:c2bc  0f be 36 5f   ora $5f36be
$06:c2c0  0f 4d 47 ef   ora $ef474d
$06:c2c4  47 e7		 eor [$e7]
$06:c2c6  63 f3		 adc $f3,s
$06:c2c8  23 f3		 and $f3,s
$06:c2ca  11 f9		 ora ($f9),y
$06:c2cc  09 cd		 ora #$cd
$06:c2ce  04 b9		 tsb $b9
$06:c2d0  f9 cd cb	  sbc $cbcd,y
$06:c2d3  3f dd 33 23   and $2333dd,x
$06:c2d7  e6 46		 inc $46
$06:c2d9  ee 40 7f	  inc $7f40
$06:c2dc  4e ee db	  lsr $dbee
$06:c2df  be ff f6	  ldx $f6ff,y
$06:c2e2  ff 3e ff ff   sbc $ffff3e,x
$06:c2e6  e3 f9		 sbc $f9,s
$06:c2e8  c0 ff		 cpy #$ff
$06:c2ea  c0 f1		 cpy #$f1
$06:c2ec  c0 6a		 cpy #$6a
$06:c2ee  c0 25		 cpy #$25
$06:c2f0  3f a3 67 f4   and $f467a3,x
$06:c2f4  2f 7f 27 af   and $af277f
$06:c2f8  a4 66		 ldy $66
$06:c2fa  65 e8		 adc $e8
$06:c2fc  6c a9 2d	  jmp ($2da9)
$06:c2ff  c5 ff		 cmp $ff
$06:c301  db			stp
$06:c302  ff d8 ff d8   sbc $d8ffd8,x
$06:c306  ff db ff db   sbc $dbffdb,x
$06:c30a  7f d3 7f f2   adc $f27fd3,x
$06:c30e  3f 22 9b 9d   and $9d9b22,x
$06:c312  f9 ff ff	  sbc $ffff,y
$06:c315  97 ff		 sta [$ff],y
$06:c317  02 ff		 cop #$ff
$06:c319  ff ff ec ff   sbc $ffecff,x
$06:c31d  ff ff fd 77   sbc $77fdff,x
$06:c321  35 ce		 and $ce,x
$06:c323  ff ff ff 02   sbc $02ffff,x
$06:c327  ff 02 ff ff   sbc $ffff02,x
$06:c32b  ff 00 ff ff   sbc $ffff00,x
$06:c32f  7e 1d 4a	  ror $4a1d,x
$06:c332  f3 ff		 sbc ($ff,s),y
$06:c334  ff ca ff 00   sbc $00ffca,x
$06:c338  ff ff ff 6a   sbc $6affff,x
$06:c33c  ff ff ff cb   sbc $cbffff,x
$06:c340  f7 9e		 sbc [$9e],y
$06:c342  7f ff ff ff   adc $ffffff,x
$06:c346  00 ff		 brk #$ff
$06:c348  00 ff		 brk #$ff
$06:c34a  ff ff 02 ff   sbc $ff02ff,x
$06:c34e  ff 00 9f 24   sbc $249f00,x
$06:c352  ff 80 ff aa   sbc $aaff80,x
$06:c356  ff cd df 05   sbc $05dfcd,x
$06:c35a  1f ea 1f e0   ora $e01fea,x
$06:c35e  1f f2 92 84   ora $8492f2,x
$06:c362  84 c2		 sty $c2
$06:c364  c2 ea		 rep #$ea
$06:c366  ea			nop
$06:c367  3d 1d ff	  and $ff1d,x
$06:c36a  1f ff 1f 1f   ora $1f1fff,x
$06:c36e  1f ff ff 7f   ora $7fffff,x
$06:c372  ff 3f ff 1f   sbc $1fff3f,x
$06:c376  ff 07 f7 1f   sbc $1ff707,x
$06:c37a  fb			xce
$06:c37b  3d fd 7f	  and $7ffd,x
$06:c37e  ff 00 ff 02   sbc $02ff00,x
$06:c382  fd 06 f9	  sbc $f906,x
$06:c385  0e f1 06	  asl $06f1
$06:c388  f9 1a e5	  sbc $e51a,y
$06:c38b  3c c3 01	  bit $01c3,x
$06:c38e  fe 00 00	  inc $0000,x
$06:c391  00 00		 brk #$00
$06:c393  00 00		 brk #$00
$06:c395  00 00		 brk #$00
$06:c397  00 00		 brk #$00
$06:c399  00 00		 brk #$00
$06:c39b  00 00		 brk #$00
$06:c39d  00 00		 brk #$00
$06:c39f  00 00		 brk #$00
$06:c3a1  00 00		 brk #$00
$06:c3a3  00 00		 brk #$00
$06:c3a5  00 00		 brk #$00
$06:c3a7  00 00		 brk #$00
$06:c3a9  00 00		 brk #$00
$06:c3ab  00 00		 brk #$00
$06:c3ad  00 00		 brk #$00
$06:c3af  38			sec
$06:c3b0  c0 33		 cpy #$33
$06:c3b2  84 0f		 sty $0f
$06:c3b4  cc 12 9e	  cpy $9e12
$06:c3b7  0c be 20	  tsb $20be
$06:c3ba  bc 50 9f	  ldy $9f50,x
$06:c3bd  48			pha
$06:c3be  8f ff 3e ff   sta $ff3eff
$06:c3c2  33 f3		 and ($f3,s),y
$06:c3c4  3f ed 1f e1   and $e11fed,x
$06:c3c8  1e d3 0d	  asl $0dd3,x
$06:c3cb  ef 00 f0 00   sbc $00f000
$06:c3cf  1c 41 0c	  trb $0c41
$06:c3d2  2f 4c 1f 60   and $601f4c
$06:c3d6  9d 60 85	  sta $8560,x
$06:c3d9  04 0d		 tsb $0d
$06:c3db  0a			asl a
$06:c3dc  f9 12 f1	  sbc $f112,y
$06:c3df  ff bc f3 5c   sbc $5cf3bc,x
$06:c3e3  e3 fc		 sbc $fc,s
$06:c3e5  e7 78		 sbc [$78]
$06:c3e7  ff 68 fb 60   sbc $60fb68,x
$06:c3eb  f7 00		 sbc [$00],y
$06:c3ed  0f 00 a1 ff   ora $ffa100
$06:c3f1  6f ff 6f ff   adc $ff6fff
$06:c3f5  6f ff 6f ff   adc $ff6fff
$06:c3f9  6f ff 6f ff   adc $ff6fff
$06:c3fd  6f ff 81 ff   adc $ff81ff
$06:c401  21 df		 and ($df,x)
$06:c403  21 df		 and ($df,x)
$06:c405  21 df		 and ($df,x)
$06:c407  21 df		 and ($df,x)
$06:c409  21 df		 and ($df,x)
$06:c40b  21 df		 and ($df,x)
$06:c40d  21 df		 and ($df,x)
$06:c40f  c1 ef		 cmp ($ef,x)
$06:c411  d2 e8		 cmp ($e8)
$06:c413  c5 ed		 cmp $ed
$06:c415  d7 ff		 cmp [$ff],y
$06:c417  d2 ff		 cmp ($ff)
$06:c419  d5 ff		 cmp $ff,x
$06:c41b  d2 ff		 cmp ($ff)
$06:c41d  d0 ff		 bne $c41e
$06:c41f  51 ff		 eor ($ff),y
$06:c421  57 ff		 eor [$ff],y
$06:c423  52 ff		 eor ($ff)
$06:c425  40			rti
$06:c426  ff 40 ff 40   sbc $40ff40,x
$06:c42a  ff 40 ff 40   sbc $40ff40,x
$06:c42e  ff 0a e5 00   sbc $00e50a,x
$06:c432  3c 11 e3	  bit $e311,x
$06:c435  b0 fe		 bcs $c435
$06:c437  93 dd		 sta ($dd,s),y
$06:c439  26 ff		 rol $ff
$06:c43b  91 df		 sta ($df),y
$06:c43d  6a			ror a
$06:c43e  bf be db 5e   lda $5edbbe,x
$06:c442  e3 7f		 sbc $7f,s
$06:c444  9d 87 f9	  sta $f987,x
$06:c447  5f a7 23 fe   eor $fe23a7,x
$06:c44b  ef b1 df e0   sbc $e0dfb1
$06:c44f  ff ff ff ff   sbc $ffffff,x
$06:c453  db			stp
$06:c454  c3 d3		 cmp $d3,s
$06:c456  cb			wai
$06:c457  c3 c3		 cmp $c3,s
$06:c459  a9 eb 95	  lda #$95eb
$06:c45c  ff eb ff 7e   sbc $7effeb,x
$06:c460  ff c3 ff bd   sbc $bdffc3,x
$06:c464  ff bd ff bd   sbc $bdffbd,x
$06:c468  ff 95 ff 81   sbc $81ff95,x
$06:c46c  ff c3 ff a3   sbc $a3ffc3,x
$06:c470  ff 3f 7f 3d   sbc $3d7f3f,x
$06:c474  bd df ff	  lda $ffdf,x
$06:c477  63 6b		 adc $6b,s
$06:c479  d7 f7		 cmp [$f7],y
$06:c47b  5b			tcd
$06:c47c  df 9b 7f a2   cmp $a27f9b,x
$06:c480  bf a7 3f 6f   lda $6f3fa7,x
$06:c484  3d 5b 7b	  and $7b5b,x
$06:c487  f6 63		 inc $63,x
$06:c489  8e 87 3a	  stx $3a87
$06:c48c  1f 92 7f 3e   ora $3e7f92,x
$06:c490  b0 f1		 bcs $c483
$06:c492  c1 54		 cmp ($54,x)
$06:c494  57 e8		 eor [$e8],y
$06:c496  a0 bf		 ldy #$bf
$06:c498  f0 6f		 beq $c509
$06:c49a  6f 25 34 92   adc $923425
$06:c49e  1a			inc a
$06:c49f  7f 30 fe c0   adc $c0fe30,x
$06:c4a3  a8			tay
$06:c4a4  00 1f		 brk #$1f
$06:c4a6  00 1f		 brk #$1f
$06:c4a8  10 9f		 bpl $c449
$06:c4aa  0f cf 07 e7   ora $e707cf
$06:c4ae  03 56		 ora $56,s
$06:c4b0  77 ae		 adc [$ae],y
$06:c4b2  e7 dc		 sbc [$dc]
$06:c4b4  c5 7e		 cmp $7e
$06:c4b6  0d fa 79	  ora $79fa
$06:c4b9  c2 c1		 rep #$c1
$06:c4bb  fc 03 02	  jsr ($0203,x)
$06:c4be  03 8e		 ora $8e,s
$06:c4c0  06 1c		 asl $1c
$06:c4c2  07 3e		 ora [$3e]
$06:c4c4  07 fa		 ora [$fa]
$06:c4c6  0f f6 7f be   ora $be7ff6
$06:c4ca  ff fe ff fc   sbc $fcfffe,x
$06:c4ce  ff 6f da a6   sbc $a6da6f,x
$06:c4d2  99 f1 9f	  sta $9ff1,y
$06:c4d5  ce ff af	  dec $afff
$06:c4d8  40			rti
$06:c4d9  86 66		 stx $66
$06:c4db  cf cf dd c6   cmp $c6ddcf
$06:c4df  60			rts
$06:c4e0  ca			dex
$06:c4e1  e0 80		 cpx #$80
$06:c4e3  e0 80		 cpx #$80
$06:c4e5  c0 f1		 cpy #$f1
$06:c4e7  9f 00 99 00   sta $009900,x
$06:c4eb  b0 80		 bcs $c46d
$06:c4ed  a0 80		 ldy #$80
$06:c4ef  b3 3b		 lda ($3b,s),y
$06:c4f1  e2 3a		 sep #$3a
$06:c4f3  dc 0e 7d	  jml [$7d0e]
$06:c4f6  85 7d		 sta $7d
$06:c4f8  a5 1f		 lda $1f
$06:c4fa  df bb ef 4d   cmp $4defbb,x
$06:c4fe  6f e4 3f e7   adc $e73fe4
$06:c502  3f f9 0f 7e   and $7e0ff9,x
$06:c506  87 3f		 sta [$3f]
$06:c508  27 3d		 and [$3d]
$06:c50a  1f 1a 0f 9c   ora $9c0f1a,x
$06:c50e  0f 00 00 00   ora $000000
$06:c512  00 00		 brk #$00
$06:c514  00 00		 brk #$00
$06:c516  00 00		 brk #$00
$06:c518  00 00		 brk #$00
$06:c51a  00 00		 brk #$00
$06:c51c  00 00		 brk #$00
$06:c51e  00 00		 brk #$00
$06:c520  00 00		 brk #$00
$06:c522  00 00		 brk #$00
$06:c524  00 00		 brk #$00
$06:c526  00 00		 brk #$00
$06:c528  00 00		 brk #$00
$06:c52a  00 00		 brk #$00
$06:c52c  00 00		 brk #$00
$06:c52e  00 00		 brk #$00
$06:c530  00 00		 brk #$00
$06:c532  00 00		 brk #$00
$06:c534  00 00		 brk #$00
$06:c536  00 00		 brk #$00
$06:c538  00 00		 brk #$00
$06:c53a  00 00		 brk #$00
$06:c53c  00 00		 brk #$00
$06:c53e  00 00		 brk #$00
$06:c540  00 00		 brk #$00
$06:c542  00 00		 brk #$00
$06:c544  00 00		 brk #$00
$06:c546  00 00		 brk #$00
$06:c548  00 00		 brk #$00
$06:c54a  00 00		 brk #$00
$06:c54c  00 00		 brk #$00
$06:c54e  00 00		 brk #$00
$06:c550  03 00		 ora $00,s
$06:c552  03 01		 ora $01,s
$06:c554  03 02		 ora $02,s
$06:c556  03 06		 ora $06,s
$06:c558  06 00		 asl $00
$06:c55a  ff 22 ff 00   sbc $00ff22,x
$06:c55e  ff 01 02 01   sbc $010201,x
$06:c562  02 00		 cop #$00
$06:c564  03 00		 ora $00,s
$06:c566  03 02		 ora $02,s
$06:c568  05 00		 ora $00
$06:c56a  ff 77 88 00   sbc $008877,x
$06:c56e  ff 00 00 00   sbc $000000,x
$06:c572  00 00		 brk #$00
$06:c574  00 00		 brk #$00
$06:c576  00 00		 brk #$00
$06:c578  00 00		 brk #$00
$06:c57a  ff 22 ff 00   sbc $00ff22,x
$06:c57e  ff 00 00 00   sbc $000000,x
$06:c582  00 00		 brk #$00
$06:c584  00 00		 brk #$00
$06:c586  00 00		 brk #$00
$06:c588  00 00		 brk #$00
$06:c58a  ff 77 88 00   sbc $008877,x
$06:c58e  ff 60 fd e0   sbc $e0fd60,x
$06:c592  ff 08 ff c2   sbc $c2ff08,x
$06:c596  f7 48		 sbc [$48],y
$06:c598  7f 04 ff 22   adc $22ff04,x
$06:c59c  ff 00 ff 00   sbc $00ff00,x
$06:c5a0  ff 0a f5 0e   sbc $0ef50a,x
$06:c5a4  f1 e6		 sbc ($e6),y
$06:c5a6  19 68 97	  ora $9768,y
$06:c5a9  06 f9		 asl $f9
$06:c5ab  77 88		 adc [$88],y
$06:c5ad  00 ff		 brk #$ff
$06:c5af  d4 b4		 pei ($b4)
$06:c5b1  8b			phb
$06:c5b2  df b8 3f 92   cmp $923fb8,x
$06:c5b6  26 d9		 rol $d9
$06:c5b8  cd 15 f6	  cmp $f615
$06:c5bb  45 33		 eor $33
$06:c5bd  da			phx
$06:c5be  9f f4 cb af   sta $afcbf4,x
$06:c5c2  78			sei
$06:c5c3  e0 df		 cpx #$df
$06:c5c5  3f f9 cd 32   and $32cdf9,x
$06:c5c9  0f fb e1 fe   ora $fee1fb
$06:c5cd  9f 60 2b 2f   sta $2f2b60,x
$06:c5d1  c4 ff		 cpy $ff
$06:c5d3  ce de 59	  dec $59de
$06:c5d6  df f5 e7 46   cmp $46e7f5,x
$06:c5da  72 a8		 adc ($a8)
$06:c5dc  2a			rol a
$06:c5dd  2e fe 2f	  rol $2ffe
$06:c5e0  d3 fd		 cmp ($fd,s),y
$06:c5e2  06 e8		 asl $e8
$06:c5e4  f7 41		 sbc [$41],y
$06:c5e6  be 27 db	  ldx $db27,y
$06:c5e9  ce bd 39	  dec $39bd
$06:c5ec  df fe 05 ff   cmp $ff05fe,x
$06:c5f0  00 c0		 brk #$c0
$06:c5f2  3f b7 77 c1   and $c177b7,x
$06:c5f6  7f 9e 3e 9e   adc $9e3e9e,x
$06:c5fa  3e 80 3e	  rol $3e80,x
$06:c5fd  c1 7f		 cmp ($7f,x)
$06:c5ff  ff ff c0 ff   sbc $ffc0ff,x
$06:c603  88			dey
$06:c604  ff be ff ff   sbc $ffffbe,x
$06:c608  ff ff ff ff   sbc $ffffff,x
$06:c60c  ff be ff 3f   sbc $3fffbe,x
$06:c610  80 1a		 bra $c62c
$06:c612  80 01		 bra $c615
$06:c614  fe c4 82	  inc $82c4,x
$06:c617  7c fd 7f	  jmp ($7ffd,x)
$06:c61a  ff 92 ff 6d   sbc $6dff92,x
$06:c61e  ff 3f ff 00   sbc $00ff3f,x
$06:c622  ff 00 ff 00   sbc $00ff00,x
$06:c626  ff c0 3f c0   sbc $c03fc0,x
$06:c62a  3f 7f 80 12   and $12807f,x
$06:c62e  ed ff 00	  sbc $00ff
$06:c631  80 7f		 bra $c6b2
$06:c633  dd 7f 81	  cmp $817f,x
$06:c636  01 bc		 ora ($bc,x)
$06:c638  42 df		 wdm #$df
$06:c63a  20 bf 40	  jsr $40bf
$06:c63d  bf 40 ff ff   lda $ffff40,x
$06:c641  be ff be	  ldx $beff,y
$06:c644  ff fe ff bd   sbc $bdfffe,x
$06:c648  ff ff ff ff   sbc $ffffff,x
$06:c64c  ff ff ff 04   sbc $04ffff,x
$06:c650  bf 0b bf 1f   lda $1fbf0b,x
$06:c654  bf d4 82 75   lda $7582d4,x
$06:c658  f4 7f ff	  pea $ff7f
$06:c65b  92 ff		 sta ($ff)
$06:c65d  6d ff 00	  adc $00ff
$06:c660  ff 00 ff 00   sbc $00ff00,x
$06:c664  ff 00 ff c8   sbc $c8ff00,x
$06:c668  3f c0 3f 7f   and $7f3fc0,x
$06:c66c  80 12		 bra $c680
$06:c66e  ed f8 f9	  sbc $f9f8
$06:c671  cb			wai
$06:c672  ff a4 e1 91   sbc $91e1a4,x
$06:c676  df cc de ad   cmp $addecc,x
$06:c67a  de c3 df	  dec $dfc3,x
$06:c67d  57 f2		 eor [$f2],y
$06:c67f  26 ff		 rol $ff
$06:c681  41 be		 eor ($be,x)
$06:c683  9e ff 20	  stz $20ff,x
$06:c686  ff ad 7f ad   sbc $ad7fad,x
$06:c68a  7f 21 fe 4f   adc $4ffe21,x
$06:c68e  bd 6f b0	  lda $b06f,x
$06:c691  b1 4f		 lda ($4f),y
$06:c693  cc bc 53	  cpy $53bc
$06:c696  b3 a9		 lda ($a9,s),y
$06:c698  6f a6 6e d5   adc $d56ea6
$06:c69c  5c db 58 4f   jml $4f58db
$06:c6a0  ff b0 ff 43   sbc $43ffb0,x
$06:c6a4  ff 4c ff 91   sbc $91ff4c,x
$06:c6a8  fe 96 f9	  inc $f996,x
$06:c6ab  a4 fb		 ldy $fb
$06:c6ad  a8			tay
$06:c6ae  f7 7e		 sbc [$7e],y
$06:c6b0  ff f5 f1 e3   sbc $e3f1f5,x
$06:c6b4  fe df ff	  inc $ffdf,x
$06:c6b7  9b			txy
$06:c6b8  b8			clv
$06:c6b9  d7 b6		 cmp [$b6],y
$06:c6bb  bf b5 7f d3   lda $d37fb5,x
$06:c6bf  3c c3 2e	  bit $2ec3,x
$06:c6c2  df c1 3f 80   cmp $803fc1,x
$06:c6c6  7f c7 7f cd   adc $cd7fc7,x
$06:c6ca  7f 4a ff 2c   adc $2cff4a,x
$06:c6ce  ff 10 ff 65   sbc $65ff10,x
$06:c6d2  a7 5a		 lda [$5a]
$06:c6d4  ce b5 9c	  dec $9cb5
$06:c6d7  2a			rol a
$06:c6d8  b8			clv
$06:c6d9  55 f1		 eor $f1,x
$06:c6db  2a			rol a
$06:c6dc  e3 54		 sbc $54,s
$06:c6de  c6 9c		 dec $9c
$06:c6e0  63 25		 adc $25,s
$06:c6e2  da			phx
$06:c6e3  4a			lsr a
$06:c6e4  b5 b5		 lda $b5,x
$06:c6e6  6b			rtl
$06:c6e7  aa			tax
$06:c6e8  57 d5		 eor [$d5],y
$06:c6ea  2e 2b dc	  rol $dc2b
$06:c6ed  56 b9		 lsr $b9,x
$06:c6ef  00 00		 brk #$00
$06:c6f1  00 00		 brk #$00
$06:c6f3  00 00		 brk #$00
$06:c6f5  00 00		 brk #$00
$06:c6f7  00 00		 brk #$00
$06:c6f9  00 00		 brk #$00
$06:c6fb  00 00		 brk #$00
$06:c6fd  00 00		 brk #$00
$06:c6ff  00 00		 brk #$00
$06:c701  00 00		 brk #$00
$06:c703  00 00		 brk #$00
$06:c705  00 00		 brk #$00
$06:c707  00 00		 brk #$00
$06:c709  00 00		 brk #$00
$06:c70b  00 00		 brk #$00
$06:c70d  00 00		 brk #$00
$06:c70f  00 00		 brk #$00
$06:c711  00 00		 brk #$00
$06:c713  00 00		 brk #$00
$06:c715  00 00		 brk #$00
$06:c717  00 00		 brk #$00
$06:c719  00 00		 brk #$00
$06:c71b  00 00		 brk #$00
$06:c71d  00 00		 brk #$00
$06:c71f  00 00		 brk #$00
$06:c721  00 00		 brk #$00
$06:c723  00 00		 brk #$00
$06:c725  00 00		 brk #$00
$06:c727  00 00		 brk #$00
$06:c729  00 00		 brk #$00
$06:c72b  00 00		 brk #$00
$06:c72d  00 00		 brk #$00
$06:c72f  ad 7b 55	  lda $557b
$06:c732  df 4c 19 bb   cmp $bb194c,x
$06:c736  7b			tdc
$06:c737  5c 16 81 b4   jml $b48116
$06:c73b  ea			nop
$06:c73c  ab			plb
$06:c73d  55 51		 eor $51,x
$06:c73f  00 00		 brk #$00
$06:c741  20 00 e6	  jsr $e600
$06:c744  00 c4		 brk #$c4
$06:c746  00 eb		 brk #$eb
$06:c748  00 5b		 brk #$5b
$06:c74a  00 54		 brk #$54
$06:c74c  00 ae		 brk #$ae
$06:c74e  00 65		 brk #$65
$06:c750  fe b9 92	  inc $92b9,x
$06:c753  3a			dec a
$06:c754  2f 50 93 ae   and $ae9350
$06:c758  a7 6f		 lda [$6f]
$06:c75a  7a			ply
$06:c75b  b5 b6		 lda $b6,x
$06:c75d  d8			cld
$06:c75e  5f 00 00 64   eor $640000,x
$06:c762  00 c0		 brk #$c0
$06:c764  00 6c		 brk #$6c
$06:c766  00 58		 brk #$58
$06:c768  00 84		 brk #$84
$06:c76a  00 48		 brk #$48
$06:c76c  00 a0		 brk #$a0
$06:c76e  00 16		 brk #$16
$06:c770  1a			inc a
$06:c771  ce af 51	  dec $51af
$06:c774  14 85		 trb $85
$06:c776  2d b2 fe	  and $feb2
$06:c779  4d 7c a5	  eor $a57c
$06:c77c  62 d0 c8	  per $904f
$06:c77f  e5 00		 sbc $00
$06:c781  70 00		 bvs $c783
$06:c783  eb			xba
$06:c784  00 d2		 brk #$d2
$06:c786  00 01		 brk #$01
$06:c788  00 83		 brk #$83
$06:c78a  00 9f		 brk #$9f
$06:c78c  00 3f		 brk #$3f
$06:c78e  00 25		 brk #$25
$06:c790  15 8d		 ora $8d,x
$06:c792  87 a9		 sta [$a9]
$06:c794  ec 5a 79	  cpx $795a
$06:c797  a4 f4		 ldy $f4
$06:c799  5a			phy
$06:c79a  78			sei
$06:c79b  a5 b0		 lda $b0
$06:c79d  da			phx
$06:c79e  59 fa 00	  eor $00fa,y
$06:c7a1  78			sei
$06:c7a2  00 13		 brk #$13
$06:c7a4  00 87		 brk #$87
$06:c7a6  00 0b		 brk #$0b
$06:c7a8  00 87		 brk #$87
$06:c7aa  00 4f		 brk #$4f
$06:c7ac  00 a7		 brk #$a7
$06:c7ae  00 e6		 brk #$e6
$06:c7b0  19 bb 44	  ora $44bb,y
$06:c7b3  6e 91 f9	  ror $f991
$06:c7b6  07 b2		 ora [$b2]
$06:c7b8  6b			rtl
$06:c7b9  db			stp
$06:c7ba  25 a9		 and $a9
$06:c7bc  5f 56 ef 00   eor $00ef56,x
$06:c7c0  00 00		 brk #$00
$06:c7c2  00 00		 brk #$00
$06:c7c4  00 00		 brk #$00
$06:c7c6  00 04		 brk #$04
$06:c7c8  00 00		 brk #$00
$06:c7ca  00 00		 brk #$00
$06:c7cc  00 00		 brk #$00
$06:c7ce  00 de		 brk #$de
$06:c7d0  31 2b		 and ($2b),y
$06:c7d2  f6 ab		 inc $ab,x
$06:c7d4  dd 68 77	  cmp $7768,x
$06:c7d7  b3 9a		 lda ($9a,s),y
$06:c7d9  a4 ff		 ldy $ff
$06:c7db  69 ee		 adc #$ee
$06:c7dd  97 9b		 sta [$9b],y
$06:c7df  00 00		 brk #$00
$06:c7e1  00 00		 brk #$00
$06:c7e3  00 00		 brk #$00
$06:c7e5  80 00		 bra $c7e7
$06:c7e7  64 00		 stz $00
$06:c7e9  00 00		 brk #$00
$06:c7eb  10 00		 bpl $c7ed
$06:c7ed  60			rts
$06:c7ee  00 b7		 brk #$b7
$06:c7f0  28			plp
$06:c7f1  3d 02 f6	  and $f602,x
$06:c7f4  09 5f		 ora #$5f
$06:c7f6  20 a9 76	  jsr $76a9
$06:c7f9  d4 2d		 pei ($2d)
$06:c7fb  f9 06 6f	  sbc $6f06,y
$06:c7fe  10 20		 bpl $c820
$06:c800  c0 00		 cpy #$00
$06:c802  c0 00		 cpy #$00
$06:c804  80 00		 bra $c806
$06:c806  80 00		 bra $c808
$06:c808  00 02		 brk #$02
$06:c80a  00 00		 brk #$00
$06:c80c  00 00		 brk #$00
$06:c80e  80 94		 bra $c7a4
$06:c810  69 47		 adc #$47
$06:c812  f8			sed
$06:c813  b0 df		 bcs $c7f4
$06:c815  4d b6 eb	  eor $ebb6
$06:c818  7a			ply
$06:c819  d5 9e		 cmp $9e,x
$06:c81b  68			pla
$06:c81c  f7 2a		 sbc [$2a],y
$06:c81e  dc 00 07	  jml [$0700]
$06:c821  00 03		 brk #$03
$06:c823  00 01		 brk #$01
$06:c825  00 01		 brk #$01
$06:c827  04 00		 tsb $00
$06:c829  60			rts
$06:c82a  00 00		 brk #$00
$06:c82c  00 00		 brk #$00
$06:c82e  01 4e		 ora ($4e,x)
$06:c830  01 37		 ora ($37,x)
$06:c832  08			php
$06:c833  6b			rtl
$06:c834  1c f6 09	  trb $09f6
$06:c837  db			stp
$06:c838  24 75		 bit $75
$06:c83a  8e b1 4a	  stx $4ab1
$06:c83d  5b			tcd
$06:c83e  a4 00		 ldy $00
$06:c840  f0 00		 beq $c842
$06:c842  c0 00		 cpy #$00
$06:c844  80 00		 bra $c846
$06:c846  00 00		 brk #$00
$06:c848  00 00		 brk #$00
$06:c84a  00 04		 brk #$04
$06:c84c  00 00		 brk #$00
$06:c84e  00 75		 brk #$75
$06:c850  84 ad		 sty $ad
$06:c852  51 7b		 eor ($7b),y
$06:c854  c4 af		 cpy $af
$06:c856  d4 5b		 pei ($5b)
$06:c858  b4 97		 ldy $97,x
$06:c85a  78			sei
$06:c85b  e5 2a		 sbc $2a
$06:c85d  5b			tcd
$06:c85e  b6 04		 ldx $04,y
$06:c860  0b			phd
$06:c861  01 02		 ora ($02,x)
$06:c863  00 01		 brk #$01
$06:c865  00 00		 brk #$00
$06:c867  00 00		 brk #$00
$06:c869  00 00		 brk #$00
$06:c86b  10 00		 bpl $c86d
$06:c86d  00 00		 brk #$00
$06:c86f  c1 67		 cmp ($67,x)
$06:c871  4f 0a 93 5c   eor $5c930a
$06:c875  ee 35 d9	  inc $d935
$06:c878  6f 5d 66 23   adc $23665d
$06:c87c  4c 6e d5	  jmp $d56e
$06:c87f  7b			tdc
$06:c880  0f f3 1f e7   ora $e71ff3
$06:c884  3f 87 7f 8f   and $8f7f87,x
$06:c888  7f 8f ff 9f   adc $9fff8f,x
$06:c88c  7f 07 ff 88   adc $88ff07,x
$06:c890  e8			inx
$06:c891  f2 54		 sbc ($54)
$06:c893  c9 38		 cmp #$38
$06:c895  77 ac		 adc [$ac],y
$06:c897  9a			txs
$06:c898  76 aa		 ror $aa,x
$06:c89a  76 c4		 ror $c4,x
$06:c89c  32 f6		 and ($f6)
$06:c89e  3b			tsc
$06:c89f  de f1 cf	  dec $cff1,x
$06:c8a2  f8			sed
$06:c8a3  e7 fc		 sbc [$fc]
$06:c8a5  e1 fe		 sbc ($fe,x)
$06:c8a7  f1 fe		 sbc ($fe),y
$06:c8a9  f1 ff		 sbc ($ff),y
$06:c8ab  f9 fe e0	  sbc $e0fe,y
$06:c8ae  ff 00 00 00   sbc $000000,x
$06:c8b2  00 00		 brk #$00
$06:c8b4  00 00		 brk #$00
$06:c8b6  00 00		 brk #$00
$06:c8b8  00 80		 brk #$80
$06:c8ba  40			rti
$06:c8bb  40			rti
$06:c8bc  c0 a0		 cpy #$a0
$06:c8be  50 00		 bvc $c8c0
$06:c8c0  00 00		 brk #$00
$06:c8c2  00 00		 brk #$00
$06:c8c4  00 00		 brk #$00
$06:c8c6  00 00		 brk #$00
$06:c8c8  00 00		 brk #$00
$06:c8ca  c0 20		 cpy #$20
$06:c8cc  e0 00		 cpx #$00
$06:c8ce  f0 89		 beq $c859
$06:c8d0  68			pla
$06:c8d1  db			stp
$06:c8d2  1c 11 f8	  trb $f811
$06:c8d5  ba			tsx
$06:c8d6  3c 37 fe	  bit $fe37,x
$06:c8d9  61 7c		 adc ($7c,x)
$06:c8db  60			rts
$06:c8dc  19 2d 3e	  ora $3e2d,y
$06:c8df  0f 10 07 20   ora $200710
$06:c8e3  1f 00 27 40   ora $402700,x
$06:c8e7  19 00 64	  ora $6400,y
$06:c8ea  82 18 86	  brl $4f05
$06:c8ed  38			sec
$06:c8ee  c0 aa		 cpy #$aa
$06:c8f0  6e f4 37	  ror $37f4
$06:c8f3  1b			tcs
$06:c8f4  78			sei
$06:c8f5  39 3e 73	  and $733e,y
$06:c8f8  18			clc
$06:c8f9  a9 3c		 lda #$3c
$06:c8fb  86 7e		 stx $7e
$06:c8fd  5b			tcd
$06:c8fe  9c f2 01	  stz $01f2
$06:c901  d0 08		 bne $c90b
$06:c903  e0 04		 cpx #$04
$06:c905  d8			cld
$06:c906  00 e0		 brk #$e0
$06:c908  04 d8		 tsb $d8
$06:c90a  02 0e		 cop #$0e
$06:c90c  01 00		 ora ($00,x)
$06:c90e  20 b5 fe	  jsr $feb5
$06:c911  49 6f		 eor #$6f
$06:c913  be 2b 81	  ldx $812b,y
$06:c916  2f 56 7d a8   and $a87d56
$06:c91a  fb			xce
$06:c91b  d3 5e		 cmp ($5e,s),y
$06:c91d  5c 77 00 00   jml $000077
$06:c921  90 00		 bcc $c923
$06:c923  d0 00		 bne $c925
$06:c925  d0 00		 bne $c927
$06:c927  80 00		 bra $c929
$06:c929  04 00		 tsb $00
$06:c92b  a0 00		 ldy #$00
$06:c92d  80 00		 bra $c92f
$06:c92f  04 24		 tsb $24
$06:c931  b2 00		 lda ($00)
$06:c933  29 20		 and #$20
$06:c935  59 02 a4	  eor $a402,y
$06:c938  c4 1c		 cpy $1c
$06:c93a  08			php
$06:c93b  cb			wai
$06:c93c  45 52		 eor $52
$06:c93e  10 fb		 bpl $c93b
$06:c940  00 ff		 brk #$ff
$06:c942  00 df		 brk #$df
$06:c944  00 ff		 brk #$ff
$06:c946  00 7b		 brk #$7b
$06:c948  00 f7		 brk #$f7
$06:c94a  00 be		 brk #$be
$06:c94c  00 ef		 brk #$ef
$06:c94e  00 69		 brk #$69
$06:c950  62 d6 8b	  per $5529
$06:c953  4b			phk
$06:c954  6a			ror a
$06:c955  99 be 59	  sta $59be,y
$06:c958  4a			lsr a
$06:c959  97 32		 sta [$32],y
$06:c95b  4a			lsr a
$06:c95c  51 a9		 eor ($a9),y
$06:c95e  ce 9c 00	  dec $009c
$06:c961  7c 00 94	  jmp ($9400,x)
$06:c964  00 60		 brk #$60
$06:c966  00 b4		 brk #$b4
$06:c968  00 cc		 brk #$cc
$06:c96a  00 bc		 brk #$bc
$06:c96c  00 30		 brk #$30
$06:c96e  00 62		 brk #$62
$06:c970  e2 56		 sep #$56
$06:c972  74 97		 stz $97,x
$06:c974  5e 71 1f	  lsr $1f71,x
$06:c977  a9 b9		 lda #$b9
$06:c979  aa			tax
$06:c97a  e4 d5		 cpx $d5
$06:c97c  74 da		 stz $da,x
$06:c97e  d9 1d 00	  cmp $001d,y
$06:c981  8b			phb
$06:c982  00 e1		 brk #$e1
$06:c984  00 e0		 brk #$e0
$06:c986  00 46		 brk #$46
$06:c988  00 1f		 brk #$1f
$06:c98a  00 8b		 brk #$8b
$06:c98c  00 27		 brk #$27
$06:c98e  00 05		 brk #$05
$06:c990  2f d3 9f 79   and $799fd3
$06:c994  78			sei
$06:c995  8a			txa
$06:c996  e0 34		 cpx #$34
$06:c998  e8			inx
$06:c999  63 62		 adc $62,s
$06:c99b  d5 72		 cmp $72,x
$06:c99d  b8			clv
$06:c99e  f0 f0		 beq $c990
$06:c9a0  00 60		 brk #$60
$06:c9a2  00 87		 brk #$87
$06:c9a4  00 1f		 brk #$1f
$06:c9a6  00 1f		 brk #$1f
$06:c9a8  00 9d		 brk #$9d
$06:c9aa  00 8f		 brk #$8f
$06:c9ac  00 0f		 brk #$0f
$06:c9ae  00 92		 brk #$92
$06:c9b0  b3 2d		 lda ($2d,s),y
$06:c9b2  de db 65	  dec $65db,x
$06:c9b5  aa			tax
$06:c9b6  5b			tcd
$06:c9b7  d1 2e		 cmp ($2e),y
$06:c9b9  6e b1 ab	  ror $abb1
$06:c9bc  5c fd 02 4c   jml $4c02fd
$06:c9c0  00 00		 brk #$00
$06:c9c2  00 00		 brk #$00
$06:c9c4  00 04		 brk #$04
$06:c9c6  00 00		 brk #$00
$06:c9c8  00 00		 brk #$00
$06:c9ca  00 00		 brk #$00
$06:c9cc  00 00		 brk #$00
$06:c9ce  00 b6		 brk #$b6
$06:c9d0  84 4b		 sty $4b
$06:c9d2  cf a4 fd aa   cmp $aafda4
$06:c9d6  8f 75 fe a9   sta $a9fe75
$06:c9da  db			stp
$06:c9db  2a			rol a
$06:c9dc  f7 b4		 sbc [$b4],y
$06:c9de  4b			phk
$06:c9df  7b			tdc
$06:c9e0  00 30		 brk #$30
$06:c9e2  00 02		 brk #$02
$06:c9e4  00 70		 brk #$70
$06:c9e6  00 00		 brk #$00
$06:c9e8  00 04		 brk #$04
$06:c9ea  00 00		 brk #$00
$06:c9ec  00 00		 brk #$00
$06:c9ee  00 56		 brk #$56
$06:c9f0  39 ab 74	  and $74ab,y
$06:c9f3  f2 0f		 sbc ($0f)
$06:c9f5  ad 5d 79	  lda $795d
$06:c9f8  06 d6		 asl $d6
$06:c9fa  39 3d 03	  and $033d,y
$06:c9fd  9f 80 00 80   sta $800080,x
$06:ca01  00 00		 brk #$00
$06:ca03  00 00		 brk #$00
$06:ca05  02 00		 cop #$00
$06:ca07  00 80		 brk #$80
$06:ca09  00 80		 brk #$80
$06:ca0b  00 c0		 brk #$c0
$06:ca0d  80 60		 bra $ca6f
$06:ca0f  95 f6		 sta $f6,x
$06:ca11  2a			rol a
$06:ca12  fb			xce
$06:ca13  b5 ba		 lda $ba,x
$06:ca15  4a			lsr a
$06:ca16  0f 61 fe b6   ora $b6fe61
$06:ca1a  d5 47		 cmp $47,x
$06:ca1c  78			sei
$06:ca1d  90 6a		 bcc $ca89
$06:ca1f  08			php
$06:ca20  01 04		 ora ($04,x)
$06:ca22  00 40		 brk #$40
$06:ca24  00 f0		 brk #$f0
$06:ca26  00 00		 brk #$00
$06:ca28  01 08		 ora ($08,x)
$06:ca2a  01 80		 ora ($80,x)
$06:ca2c  03 00		 ora $00,s
$06:ca2e  07 ac		 ora [$ac]
$06:ca30  77 5e		 adc [$5e],y
$06:ca32  eb			xba
$06:ca33  2b			pld
$06:ca34  da			phx
$06:ca35  a4 7f		 ldy $7f
$06:ca37  1b			tcs
$06:ca38  ed 54 37	  sbc $3754
$06:ca3b  c9 3e		 cmp #$3e
$06:ca3d  5d 23 00	  eor $0023,x
$06:ca40  00 04		 brk #$04
$06:ca42  00 04		 brk #$04
$06:ca44  00 00		 brk #$00
$06:ca46  00 00		 brk #$00
$06:ca48  00 08		 brk #$08
$06:ca4a  80 00		 bra $ca4c
$06:ca4c  c0 00		 cpy #$00
$06:ca4e  f0 a5		 beq $c9f5
$06:ca50  ec 1a cf	  cpx $cf1a
$06:ca53  6c eb a5	  jmp ($a5eb)
$06:ca56  ee 50 7b	  inc $7b50
$06:ca59  a6 9c		 ldx $9c
$06:ca5b  57 f8		 eor [$f8],y
$06:ca5d  aa			tax
$06:ca5e  d5 12		 cmp $12,x
$06:ca60  00 30		 brk #$30
$06:ca62  00 10		 brk #$10
$06:ca64  00 10		 brk #$10
$06:ca66  00 84		 brk #$84
$06:ca68  00 40		 brk #$40
$06:ca6a  01 00		 ora ($00,x)
$06:ca6c  03 00		 ora $00,s
$06:ca6e  0f 21 46 ab   ora $ab4621
$06:ca72  54 c4 6f	  mvn $6f,$c4
$06:ca75  9b			txy
$06:ca76  2e 2e b1	  rol $b12e
$06:ca79  57 5c		 eor [$5c],y
$06:ca7b  77 1a		 adc [$1a],y
$06:ca7d  28			plp
$06:ca7e  3f 9f ff 0f   and $0fff9f,x
$06:ca82  7f 1f ff 4f   adc $4fff1f,x
$06:ca86  7f 47 7f 67   adc $677f47,x
$06:ca8a  bf 03 9f 33   lda $339f03,x
$06:ca8e  cf f4 22 d4   cmp $d422f4
$06:ca92  2b			pld
$06:ca93  a3 76		 lda $76,s
$06:ca95  99 74 75	  sta $7574,y
$06:ca98  8c e9 38	  sty $38e9
$06:ca9b  ee 5e 1b	  inc $1b5e
$06:ca9e  fc e9 ff	  jsr ($ffe9,x)
$06:caa1  f0 fe		 beq $caa1
$06:caa3  f8			sed
$06:caa4  ff f2 fe e2   sbc $e2fef2,x
$06:caa8  fe e4 fe	  inc $fee4,x
$06:caab  c6 f9		 dec $f9
$06:caad  c0 f0		 cpy #$f0
$06:caaf  04 2f		 tsb $2f
$06:cab1  d3 9d		 cmp ($9d,s),y
$06:cab3  78			sei
$06:cab4  7b			tdc
$06:cab5  8b			phb
$06:cab6  e2 34		 sep #$34
$06:cab8  e9 65		 sbc #$65
$06:caba  65 d7		 adc $d7
$06:cabc  72 a5		 adc ($a5)
$06:cabe  df f0 00 60   cmp $6000f0,x
$06:cac2  00 84		 brk #$84
$06:cac4  00 1c		 brk #$1c
$06:cac6  00 1e		 brk #$1e
$06:cac8  00 9a		 brk #$9a
$06:caca  00 8c		 brk #$8c
$06:cacc  00 00		 brk #$00
$06:cace  00 cb		 brk #$cb
$06:cad0  68			pla
$06:cad1  51 16		 eor ($16),y
$06:cad3  bb			tyx
$06:cad4  78			sei
$06:cad5  fa			plx
$06:cad6  3c 97 7e	  bit $7e97,x
$06:cad9  2a			rol a
$06:cada  3c 61 18	  bit $1861,x
$06:cadd  3b			tsc
$06:cade  3c 70 04	  bit $0470,x
$06:cae1  f0 08		 beq $caeb
$06:cae3  e0 04		 cpx #$04
$06:cae5  d8			cld
$06:cae6  01 e6		 ora ($e6,x)
$06:cae8  00 d9		 brk #$d9
$06:caea  00 e7		 brk #$e7
$06:caec  00 c7		 brk #$c7
$06:caee  00 88		 brk #$88
$06:caf0  68			pla
$06:caf1  3a			dec a
$06:caf2  bc 31 78	  ldy $7831,x
$06:caf5  3b			tsc
$06:caf6  3c 70 18	  bit $1870,x
$06:caf9  a3 3c		 lda $3c,s
$06:cafb  8e 3e c9	  stx $c93e
$06:cafe  1f 0e 11 27   ora $27110e,x
$06:cb02  40			rti
$06:cb03  1f 80 27 c0   ora $c02780,x
$06:cb07  1f 80 a7 40   ora $40a780,x
$06:cb0b  f1 00		 sbc ($00),y
$06:cb0d  ff 00 ad 6f   sbc $6fad00,x
$06:cb11  12 f6		 ora ($f6)
$06:cb13  7e d6 89	  ror $89d6,x
$06:cb16  fd 72 af	  sbc $af72,x
$06:cb19  05 f6		 ora $f6
$06:cb1b  e9 5f		 sbc #$5f
$06:cb1d  23 fd		 and $fd,s
$06:cb1f  10 00		 bpl $cb21
$06:cb21  09 00		 ora #$00
$06:cb23  09 00		 ora #$00
$06:cb25  02 00		 cop #$00
$06:cb27  00 00		 brk #$00
$06:cb29  08			php
$06:cb2a  00 00		 brk #$00
$06:cb2c  00 00		 brk #$00
$06:cb2e  00 28		 brk #$28
$06:cb30  28			plp
$06:cb31  cd 4d d6	  cmp $d64d
$06:cb34  f6 a6		 inc $a6,x
$06:cb36  a4 5b		 ldy $5b
$06:cb38  9f e3 eb 34   sta $34ebe3,x
$06:cb3c  71 ad		 adc ($ad),y
$06:cb3e  bd d7 00	  lda $00d7,x
$06:cb41  b2 00		 lda ($00)
$06:cb43  09 00		 ora #$00
$06:cb45  5b			tcd
$06:cb46  00 60		 brk #$60
$06:cb48  00 14		 brk #$14
$06:cb4a  00 8e		 brk #$8e
$06:cb4c  00 42		 brk #$42
$06:cb4e  00 24		 brk #$24
$06:cb50  2f d2 93 6d   and $6d93d2
$06:cb54  78			sei
$06:cb55  a8			tay
$06:cb56  8f 24 e5 ab   sta $abe524
$06:cb5a  ba			tsx
$06:cb5b  56 d3		 lsr $d3,x
$06:cb5d  b6 ed		 ldx $ed,y
$06:cb5f  d0 00		 bne $cb61
$06:cb61  6c 00 86	  jmp ($8600)
$06:cb64  00 70		 brk #$70
$06:cb66  00 1a		 brk #$1a
$06:cb68  00 44		 brk #$44
$06:cb6a  00 2c		 brk #$2c
$06:cb6c  00 00		 brk #$00
$06:cb6e  00 fb		 brk #$fb
$06:cb70  de cd 4d	  dec $4dcd,x
$06:cb73  16 36		 asl $36,x
$06:cb75  65 25		 adc $25
$06:cb77  bb			tyx
$06:cb78  df 13 0b cc   cmp $cc0b13,x
$06:cb7c  41 53		 eor ($53,x)
$06:cb7e  11 20		 ora ($20),y
$06:cb80  00 b2		 brk #$b2
$06:cb82  00 c9		 brk #$c9
$06:cb84  00 da		 brk #$da
$06:cb86  00 60		 brk #$60
$06:cb88  00 f4		 brk #$f4
$06:cb8a  00 be		 brk #$be
$06:cb8c  00 ee		 brk #$ee
$06:cb8e  00 6a		 brk #$6a
$06:cb90  80 d7		 bra $cb69
$06:cb92  4a			lsr a
$06:cb93  ab			plb
$06:cb94  25 4d		 and $4d
$06:cb96  48			pha
$06:cb97  aa			tax
$06:cb98  2a			rol a
$06:cb99  95 15		 sta $15,x
$06:cb9b  50 90		 bvc $cb2d
$06:cb9d  32 40		 and ($40)
$06:cb9f  c3 de		 cmp $de,s
$06:cba1  c3 bd		 cmp $bd,s
$06:cba3  21 5e		 and ($5e,x)
$06:cba5  f8			sed
$06:cba6  b7 7a		 lda [$7a],y
$06:cba8  55 f7		 eor $f7,x
$06:cbaa  ea			nop
$06:cbab  bd af ef	  lda $efaf,x
$06:cbae  6e ea 37	  ror $37ea
$06:cbb1  9d 63 6e	  sta $6e63,x
$06:cbb4  91 bf		 sta ($bf),y
$06:cbb6  60			rts
$06:cbb7  da			phx
$06:cbb8  35 2d		 and $2d,x
$06:cbba  db			stp
$06:cbbb  d5 6a		 cmp $6a,x
$06:cbbd  5b			tcd
$06:cbbe  a4 00		 ldy $00
$06:cbc0  00 00		 brk #$00
$06:cbc2  00 00		 brk #$00
$06:cbc4  00 00		 brk #$00
$06:cbc6  00 00		 brk #$00
$06:cbc8  00 00		 brk #$00
$06:cbca  00 00		 brk #$00
$06:cbcc  00 00		 brk #$00
$06:cbce  00 1d		 brk #$1d
$06:cbd0  d5 e2		 cmp $e2,x
$06:cbd2  7e 95 fb	  ror $fb95,x
$06:cbd5  49 d6		 eor #$d6
$06:cbd7  a5 6f		 lda $6f
$06:cbd9  d2 f6		 cmp ($f6)
$06:cbdb  2a			rol a
$06:cbdc  bf b6 ed 22   lda $22edb6,x
$06:cbe0  00 01		 brk #$01
$06:cbe2  00 00		 brk #$00
$06:cbe4  00 20		 brk #$20
$06:cbe6  00 10		 brk #$10
$06:cbe8  00 09		 brk #$09
$06:cbea  00 40		 brk #$40
$06:cbec  00 00		 brk #$00
$06:cbee  00 6f		 brk #$6f
$06:cbf0  98			tya
$06:cbf1  d5 2e		 cmp $2e,x
$06:cbf3  af 50 75 da   lda $da7550
$06:cbf7  5a			phy
$06:cbf8  a7 ab		 lda [$ab]
$06:cbfa  f6 94		 inc $94,x
$06:cbfc  fb			xce
$06:cbfd  2a			rol a
$06:cbfe  b5 00		 lda $00,x
$06:cc00  00 00		 brk #$00
$06:cc02  00 00		 brk #$00
$06:cc04  00 00		 brk #$00
$06:cc06  00 00		 brk #$00
$06:cc08  00 00		 brk #$00
$06:cc0a  00 00		 brk #$00
$06:cc0c  00 40		 brk #$40
$06:cc0e  00 09		 brk #$09
$06:cc10  ef 54 df 0a   sbc $0adf54
$06:cc14  ff 51 f5 a5   sbc $a5f551,x
$06:cc18  bf 2a ba d6   lda $d6ba2a,x
$06:cc1c  f6 ab		 inc $ab,x
$06:cc1e  f9 10 00	  sbc $0010,y
$06:cc21  20 00 00	  jsr $0000
$06:cc24  00 0a		 brk #$0a
$06:cc26  00 40		 brk #$40
$06:cc28  00 45		 brk #$45
$06:cc2a  00 09		 brk #$09
$06:cc2c  00 06		 brk #$06
$06:cc2e  00 91		 brk #$91
$06:cc30  c3 6b		 cmp $6b,s
$06:cc32  92 95		 sta ($95)
$06:cc34  22 62 85 99   jsl $998562
$06:cc38  c7 6d		 cmp [$6d]
$06:cc3a  86 4b		 stx $4b
$06:cc3c  04 25		 tsb $25
$06:cc3e  c2 03		 rep #$03
$06:cc40  ff 03 ff 07   sbc $07ff03,x
$06:cc44  ff 07 ff 0f   sbc $0fff07,x
$06:cc48  ff 0f ff 0f   sbc $0fff0f,x
$06:cc4c  ff 07 ff 9a   sbc $9aff07,x
$06:cc50  c1 e5		 cmp ($e5,x)
$06:cc52  58			cli
$06:cc53  db			stp
$06:cc54  2c 74 a9	  bit $a974
$06:cc57  92 71		 sta ($71)
$06:cc59  ab			plb
$06:cc5a  74 cc		 stz $cc,x
$06:cc5c  36 69		 rol $69,x
$06:cc5e  a6 c0		 ldx $c0
$06:cc60  ff c0 ff e0   sbc $e0ffc0,x
$06:cc64  ff e0 ff f0   sbc $f0ffe0,x
$06:cc68  ff f0 ff f0   sbc $f0fff0,x
$06:cc6c  ff e0 ff f6   sbc $f6ffe0,x
$06:cc70  19 ab 74	  ora $74ab,y
$06:cc73  f5 0a		 sbc $0a,x
$06:cc75  ae 5b 5a	  ldx $5a5b
$06:cc78  e5 d5		 sbc $d5
$06:cc7a  6e 2a dd	  ror $dd2a
$06:cc7d  54 aa ff	  mvn $ff,$aa
$06:cc80  ff ff ff ff   sbc $ffffff,x
$06:cc84  ff ff ff ff   sbc $ffffff,x
$06:cc88  ff fe ff fc   sbc $fcfffe,x
$06:cc8c  ff f9 ff 5e   sbc $5efff9,x
$06:cc90  a9 57		 lda #$57
$06:cc92  6c 54 9f	  jmp ($9f54)
$06:cc95  98			tya
$06:cc96  ef e1 7c 08   sbc $087ce1
$06:cc9a  1b			tcs
$06:cc9b  64 18		 stz $18
$06:cc9d  3b			tsc
$06:cc9e  3c ff ff	  bit $ffff,x
$06:cca1  ff ff 3f ff   sbc $ff3fff,x
$06:cca5  0e ff 82	  asl $82ff
$06:cca8  7f e4 3f e3   adc $e33fe4,x
$06:ccac  15 c7		 ora $c7,x
$06:ccae  00 b7		 brk #$b7
$06:ccb0  c9 4a		 cmp #$4a
$06:ccb2  b6 aa		 ldx $aa,y
$06:ccb4  fd 7b b6	  sbc $b67b,x
$06:ccb7  94 2c		 sty $2c,x
$06:ccb9  ab			plb
$06:ccba  f8			sed
$06:ccbb  0e 96 c9	  asl $c996
$06:ccbe  1f ff ff ff   ora $ffffff,x
$06:ccc2  ff fc ff 30   sbc $30fffc,x
$06:ccc6  ff 43 fe 07   sbc $07fe43,x
$06:ccca  fc 61 b8	  jsr ($b861,x)
$06:cccd  ff 00 89 68   sbc $688900,x
$06:ccd1  db			stp
$06:ccd2  1c 11 f8	  trb $f811
$06:ccd5  ba			tsx
$06:ccd6  3c 37 fe	  bit $fe37,x
$06:ccd9  a1 7c		 lda ($7c,x)
$06:ccdb  40			rti
$06:ccdc  d9 ad 5e	  cmp $5ead,y
$06:ccdf  0f 10 07 20   ora $200710
$06:cce3  1f 00 27 40   ora $402700,x
$06:cce7  19 00 24	  ora $2400,y
$06:ccea  c2 38		 rep #$38
$06:ccec  e6 08		 inc $08
$06:ccee  f0 aa		 beq $cc9a
$06:ccf0  6e f4 37	  ror $37f4
$06:ccf3  1b			tcs
$06:ccf4  78			sei
$06:ccf5  39 3e 73	  and $733e,y
$06:ccf8  18			clc
$06:ccf9  a9 3e 82	  lda #$823e
$06:ccfc  7b			tdc
$06:ccfd  55 9a		 eor $9a,x
$06:ccff  f2 01		 sbc ($01)
$06:cd01  d0 08		 bne $cd0b
$06:cd03  e0 04 d8	  cpx #$d804
$06:cd06  00 e0		 brk #$e0
$06:cd08  04 d8		 tsb $d8
$06:cd0a  03 0c		 ora $0c,s
$06:cd0c  07 00		 ora [$00]
$06:cd0e  2f 9d e1 6e   and $6ee19d
$06:cd12  8d fd 2b	  sta $2bfd
$06:cd15  b2 11		 lda ($11)
$06:cd17  aa			tax
$06:cd18  23 f5		 and $f5,s
$06:cd1a  29 5a 59	  and #$595a
$06:cd1d  ad ae fb	  lda $fbae
$06:cd20  fa			plx
$06:cd21  fc f3 a8	  jsr ($a8f3,x)
$06:cd24  87 10		 sta [$10]
$06:cd26  4f e2 dd 20   eor $20dde2
$06:cd2a  1f d8 a7 fc   ora $fca7d8,x
$06:cd2e  53 4b		 eor ($4b,s),y
$06:cd30  7f b5 2f 7b   adc $7b2fb5,x
$06:cd34  9d 95 e6	  sta $e695,x
$06:cd37  fa			plx
$06:cd38  d1 55		 cmp ($55),y
$06:cd3a  e8			inx
$06:cd3b  8d 61 ae	  sta $ae61
$06:cd3e  18			clc
$06:cd3f  ff bf 3f df   sbc $df3fbf,x
$06:cd43  1f e7 07 fb   ora $fb07e7,x
$06:cd47  03 ff		 ora $ff,s
$06:cd49  03 ff		 ora $ff,s
$06:cd4b  01 fe		 ora ($fe,x)
$06:cd4d  01 ff		 ora ($ff,x)
$06:cd4f  57 17		 eor [$17],y
$06:cd51  6a			ror a
$06:cd52  68			pla
$06:cd53  a7 a7		 lda [$a7]
$06:cd55  4e 62 a3	  lsr $a362
$06:cd58  8d 6d 75	  sta $756d
$06:cd5b  6b			rtl
$06:cd5c  a6 5b		 ldx $5b
$06:cd5e  59 e8 00	  eor $00e8,y
$06:cd61  90 07		 bcc $cd6a
$06:cd63  47 18		 eor [$18]
$06:cd65  82 1d 01	  brl $ce85
$06:cd68  72 85		 adc ($85)
$06:cd6a  02 22		 cop #$22
$06:cd6c  5c 59 a6 d4   jml $d4a659
$06:cd70  c4 d2		 cpy $d2
$06:cd72  90 71		 bcc $cde5
$06:cd74  60			rts
$06:cd75  da			phx
$06:cd76  9a			txs
$06:cd77  6c 6c ec	  jmp ($ec6c)
$06:cd7a  a1 97		 lda ($97,x)
$06:cd7c  a6 5d		 ldx $5d
$06:cd7e  18			clc
$06:cd7f  3b			tsc
$06:cd80  00 9f		 brk #$9f
$06:cd82  60			rts
$06:cd83  67 98		 adc [$98]
$06:cd85  95 20		 sta $20,x
$06:cd87  7f 80 a0 1e   adc $1ea080,x
$06:cd8b  86 78		 stx $78
$06:cd8d  18			clc
$06:cd8e  e3 b4		 sbc $b4,s
$06:cd90  04 db		 tsb $db
$06:cd92  8b			phb
$06:cd93  66 60		 ror $60
$06:cd95  dd dc 7f	  cmp $7fdc,x
$06:cd98  63 e5		 adc $e5,s
$06:cd9a  a8			tay
$06:cd9b  b6 86		 ldx $86,y
$06:cd9d  5f 19 04 7b   eor $7b0419,x
$06:cda1  8b			phb
$06:cda2  64 60		 stz $60
$06:cda4  9f dc 23 63   sta $6323dc,x
$06:cda8  80 a0		 bra $cd4a
$06:cdaa  1e 86 79	  asl $7986,x
$06:cdad  19 e0 e4	  ora $e4e0,y
$06:cdb0  44 bb 2b	  mvp $2b,$bb
$06:cdb3  f6 90		 inc $90,x
$06:cdb5  fd 34 7f	  sbc $7f34,x
$06:cdb8  43 e5		 eor $e5,s
$06:cdba  a9 d6 c6	  lda #$c6d6
$06:cdbd  5f 19 44 3b   eor $3b4419,x
$06:cdc1  2b			pld
$06:cdc2  44 90 0f	  mvp $0f,$90
$06:cdc5  34 03		 bit $03,x
$06:cdc7  43 80		 eor $80,s
$06:cdc9  a1 1e		 lda ($1e,x)
$06:cdcb  c6 39		 dec $39
$06:cdcd  19 e0 ef	  ora $efe0,y
$06:cdd0  4b			phk
$06:cdd1  bf 24 f7 91   lda $91f724,x
$06:cdd5  fe 22 ff	  inc $ff22,x
$06:cdd8  80 fb		 bra $cdd5
$06:cdda  12 ef		 ora ($ef)
$06:cddc  49 bf a0	  eor #$a0bf
$06:cddf  4b			phk
$06:cde0  30 24		 bmi $ce06
$06:cde2  40			rti
$06:cde3  91 0e		 sta ($0e),y
$06:cde5  22 01 80 00   jsl $008001
$06:cde9  12 0c		 ora ($0c)
$06:cdeb  49 30 a0	  eor #$a030
$06:cdee  40			rti
$06:cdef  a7 97		 lda [$97]
$06:cdf1  cd c7 ba	  cmp $bac7
$06:cdf4  3e 6b 79	  rol $796b,x
$06:cdf7  6d cf 94	  adc $94cf
$06:cdfa  9c ea f9	  stz $f9ea
$06:cdfd  5c 5c 78 00   jml $00785c
$06:ce01  38			sec
$06:ce02  00 c1		 brk #$c1
$06:ce04  00 86		 brk #$86
$06:ce06  00 30		 brk #$30
$06:ce08  00 63		 brk #$63
$06:ce0a  00 07		 brk #$07
$06:ce0c  00 a3		 brk #$a3
$06:ce0e  00 72		 brk #$72
$06:ce10  f3 4b		 sbc ($4b,s),y
$06:ce12  63 9c		 adc $9c,s
$06:ce14  5e 77 1f	  lsr $1f77,x
$06:ce17  a9 a9 aa	  lda #$aaa9
$06:ce1a  e4 52		 cpx $52
$06:ce1c  53 bd		 eor ($bd,s),y
$06:ce1e  bc 0c 00	  ldy $000c,x
$06:ce21  9c 00 e1	  stz $e100
$06:ce24  00 e0		 brk #$e0
$06:ce26  00 56		 brk #$56
$06:ce28  00 1f		 brk #$1f
$06:ce2a  00 ac		 brk #$ac
$06:ce2c  00 43		 brk #$43
$06:ce2e  00 96		 brk #$96
$06:ce30  c1 6b		 cmp ($6b,x)
$06:ce32  84 86		 sty $86
$06:ce34  2d 59 86	  and $8659
$06:ce37  a2 c5 17	  ldx #$17c5
$06:ce3a  c2 71		 rep #$71
$06:ce3c  02 4a		 cop #$4a
$06:ce3e  e1 07		 sbc ($07,x)
$06:ce40  ff 0f ff 0f   sbc $0fff0f,x
$06:ce44  ff 0f ff 07   sbc $07ff0f,x
$06:ce48  ff 07 ff 03   sbc $03ff07,x
$06:ce4c  ff 03 ff ba   sbc $baff03,x
$06:ce50  61 d5		 adc ($d5,x)
$06:ce52  28			plp
$06:ce53  ab			plb
$06:ce54  7c 94 69	  jmp ($6994,x)
$06:ce57  72 81		 adc ($81)
$06:ce59  fb			xce
$06:ce5a  24 f4		 bit $f4
$06:ce5c  4e 29 c6	  lsr $c629
$06:ce5f  e0 ff f0	  cpx #$f0ff
$06:ce62  ff f0 ff f0   sbc $f0fff0,x
$06:ce66  ff e0 ff e0   sbc $e0ffe0,x
$06:ce6a  ff c0 ff c0   sbc $c0ffc0,x
$06:ce6e  ff f6 19 ab   sbc $ab19f6,x
$06:ce72  74 f5		 stz $f5,x
$06:ce74  0a			asl a
$06:ce75  ae 5b 5a	  ldx $5a5b
$06:ce78  e5 d5		 sbc $d5
$06:ce7a  6e 2a dc	  ror $dc2a
$06:ce7d  55 a8		 eor $a8,x
$06:ce7f  ff ff ff ff   sbc $ffffff,x
$06:ce83  ff ff ff ff   sbc $ffffff,x
$06:ce87  ff ff fe ff   sbc $fffeff,x
$06:ce8b  fc ff f8	  jsr ($f8ff,x)
$06:ce8e  ff 5e a9 d7   sbc $d7a95e,x
$06:ce92  6c b4 1f	  jmp ($1fb4)
$06:ce95  5a			phy
$06:ce96  8c b5 c0	  sty $c0b5
$06:ce99  0a			asl a
$06:ce9a  d4 75		 pei ($75)
$06:ce9c  0e 4a e5	  asl $e54a
$06:ce9f  ff ff 7f ff   sbc $ff7fff,x
$06:cea3  3f ff 1e ff   and $ff1eff,x
$06:cea7  04 ff		 tsb $ff
$06:cea9  00 ff		 brk #$ff
$06:ceab  00 ff		 brk #$ff
$06:cead  00 ff		 brk #$ff
$06:ceaf  8b			phb
$06:ceb0  64 74		 stz $74
$06:ceb2  0e ab 04	  asl $04ab
$06:ceb5  52 81		 eor ($81)
$06:ceb7  7d 30 aa	  adc $aa30,x
$06:ceba  fc 4b b6	  jsr ($b64b,x)
$06:cebd  b6 c9		 ldx $c9,y
$06:cebf  00 ff		 brk #$ff
$06:cec1  00 ff		 brk #$ff
$06:cec3  00 ff		 brk #$ff
$06:cec5  00 ff		 brk #$ff
$06:cec7  78			sei
$06:cec8  ff fc ff fe   sbc $fefffc,x
$06:cecc  ff ff ff ab   sbc $abffff,x
$06:ced0  58			cli
$06:ced1  51 d6		 eor ($d6),y
$06:ced3  bb			tyx
$06:ced4  78			sei
$06:ced5  fa			plx
$06:ced6  3c 97 7e	  bit $7e97,x
$06:ced9  2a			rol a
$06:ceda  3c 61 18	  bit $1861,x
$06:cedd  3b			tsc
$06:cede  3c 00 f4	  bit $f400,x
$06:cee1  30 e8		 bmi $cecb
$06:cee3  20 c4 d8	  jsr $d8c4
$06:cee6  01 e6		 ora ($e6,x)
$06:cee8  00 d9		 brk #$d9
$06:ceea  00 e7		 brk #$e7
$06:ceec  00 c7		 brk #$c7
$06:ceee  00 85		 brk #$85
$06:cef0  6a			ror a
$06:cef1  3a			dec a
$06:cef2  bb			tyx
$06:cef3  31 7a		 and ($7a),y
$06:cef5  3b			tsc
$06:cef6  3c 70 18	  bit $1870,x
$06:cef9  a3 3c		 lda $3c,s
$06:cefb  8e 3e c9	  stx $c93e
$06:cefe  1f 00 1f 24   ora $241f00,x
$06:cf02  47 1c		 eor [$1c]
$06:cf04  83 27		 sta $27,s
$06:cf06  c0 1f 80	  cpy #$801f
$06:cf09  a7 40		 lda [$40]
$06:cf0b  f1 00		 sbc ($00),y
$06:cf0d  ff 00 96 94   sbc $949600,x
$06:cf11  05 05		 ora $05
$06:cf13  c2 42		 rep #$42
$06:cf15  cc 0c 69	  cpy $690c
$06:cf18  a9 74 94	  lda #$9474
$06:cf1b  b0 c0		 bcs $cedd
$06:cf1d  2c f0 fc	  bit $fcf0
$06:cf20  6b			rtl
$06:cf21  fd fa fb	  sbc $fbfa,x
$06:cf24  bd bf b3	  lda $b3bf,x
$06:cf27  bf 96 df cb   lda $cbdf96,x
$06:cf2b  ef ef ff ff   sbc $ffffef
$06:cf2f  d3 cc		 cmp ($cc,s),y
$06:cf31  2d 21 56	  and $5621
$06:cf34  52 25		 eor ($25)
$06:cf36  24 56		 bit $56
$06:cf38  53 5e		 eor ($5e,s),y
$06:cf3a  45 3d		 eor $3d
$06:cf3c  03 e6		 ora $e6,s
$06:cf3e  1f c0 3e e1   ora $e13ec0,x
$06:cf42  de f3 ad	  dec $adf3,x
$06:cf45  e7 db		 sbc [$db]
$06:cf47  db			stp
$06:cf48  a9 e7 a3	  lda #$a3e7
$06:cf4b  cf cf bf bf   cmp $bfbfcf
$06:cf4f  d4 c4		 pei ($c4)
$06:cf51  fb			xce
$06:cf52  eb			xba
$06:cf53  66 e0		 ror $e0
$06:cf55  fc ed 57	  jsr ($57ed,x)
$06:cf58  43 b5		 eor $b5,s
$06:cf5a  a1 ce		 lda ($ce,x)
$06:cf5c  da			phx
$06:cf5d  9b			txy
$06:cf5e  bf c4 3b 6b   lda $6b3bc4,x
$06:cf62  04 20		 tsb $20
$06:cf64  1f 2c 03 c3   ora $c3032c,x
$06:cf68  38			sec
$06:cf69  21 4e		 and ($4e,x)
$06:cf6b  0a			asl a
$06:cf6c  21 43		 and ($43,x)
$06:cf6e  00 ab		 brk #$ab
$06:cf70  a3 5d		 lda $5d,s
$06:cf72  4c de da	  jmp $dade
$06:cf75  f4 51 75	  pea $7551
$06:cf78  27 b9		 and [$b9]
$06:cf7a  b9 d4 54	  lda $54d4,y
$06:cf7d  f2 b2		 sbc ($b2)
$06:cf7f  a3 5c		 lda $5c,s
$06:cf81  4c b2 d9	  jmp $d9b2
$06:cf84  20 50 8e	  jsr $8e50
$06:cf87  24 d8		 bit $d8
$06:cf89  ba			tsx
$06:cf8a  44 53 28	  mvp $28,$53
$06:cf8d  ad 00 ad	  lda $ad00
$06:cf90  a1 56		 lda ($56,x)
$06:cf92  46 df		 lsr $df
$06:cf94  d9 76 d0	  cmp $d076,y
$06:cf97  77 27		 adc [$27],y
$06:cf99  9d 95 ab	  sta $ab95,x
$06:cf9c  a6 db		 ldx $db
$06:cf9e  d9 a1 5e	  cmp $5ea1,y
$06:cfa1  46 b9		 lsr $b9
$06:cfa3  d9 20 50	  cmp $5020,y
$06:cfa6  8f 27 d8 95   sta $95d827
$06:cfaa  62 a2 5c	  per $2c4f
$06:cfad  d9 26 69	  cmp $6926,y
$06:cfb0  6a			ror a
$06:cfb1  9a			txs
$06:cfb2  53 af		 eor ($af,s),y
$06:cfb4  8b			phb
$06:cfb5  55 53		 eor $53,x
$06:cfb7  2d 0c 4a	  and $4a0c
$06:cfba  52 ed		 eor ($ed)
$06:cfbc  c5 36		 cmp $36
$06:cfbe  b2 98		 lda ($98)
$06:cfc0  07 12		 ora [$12]
$06:cfc2  ec 8a 70	  cpx $708a
$06:cfc5  51 ae		 eor ($ae),y
$06:cfc7  8c 53 c2	  sty $c253
$06:cfca  3d 44 32	  and $3244,x
$06:cfcd  31 4c		 and ($4c),y
$06:cfcf  fb			xce
$06:cfd0  52 ef		 eor ($ef)
$06:cfd2  a9 ff 20	  lda #$20ff
$06:cfd5  fd 09 af	  sbc $af09,x
$06:cfd8  88			dey
$06:cfd9  ff 62 f7 50   sbc $50f762,x
$06:cfdd  fd a4 52	  sbc $52a4,x
$06:cfe0  0c a9 10	  tsb $10a9
$06:cfe3  20 00 09	  jsr $0900
$06:cfe6  86 88		 stx $88
$06:cfe8  50 62		 bvc $d04c
$06:cfea  00 50		 brk #$50
$06:cfec  0c a4 02	  tsb $02a4
$06:cfef  58			cli
$06:cff0  cf 32 f5 45   cmp $45f532
$06:cff4  7b			tdc
$06:cff5  94 ed		 sty $ed,x
$06:cff7  92 5d		 sta ($5d)
$06:cff9  6b			rtl
$06:cffa  f7 15		 sbc [$15],y
$06:cffc  ec a3 ff	  cpx $ffa3
$06:cfff  30 00		 bmi $d001
$06:d001  08			php
$06:d002  00 80		 brk #$80
$06:d004  00 02		 brk #$02
$06:d006  00 20		 brk #$20
$06:d008  00 00		 brk #$00
$06:d00a  00 03		 brk #$03
$06:d00c  00 00		 brk #$00
$06:d00e  00 8d		 brk #$8d
$06:d010  7e b4 d7	  ror $d7b4,x
$06:d013  63 3d		 adc $3d,s
$06:d015  88			dey
$06:d016  97 56		 sta [$56],y
$06:d018  ff 55 b1 ad   sbc $adb155,x
$06:d01c  fe 42 fe	  inc $fe42,x
$06:d01f  00 00		 brk #$00
$06:d021  08			php
$06:d022  00 c0		 brk #$c0
$06:d024  00 60		 brk #$60
$06:d026  00 00		 brk #$00
$06:d028  00 0e		 brk #$0e
$06:d02a  00 00		 brk #$00
$06:d02c  00 01		 brk #$01
$06:d02e  00 58		 brk #$58
$06:d030  cf b2 f5 85   cmp $85f5b2
$06:d034  3b			tsc
$06:d035  74 6d		 stz $6d,x
$06:d037  62 cd 93	  per $6407
$06:d03a  9f e9 f8 5d   sta $5df8e9,x
$06:d03e  5d 30 00	  eor $0030,x
$06:d041  08			php
$06:d042  00 c0		 brk #$c0
$06:d044  00 82		 brk #$82
$06:d046  00 30		 brk #$30
$06:d048  00 60		 brk #$60
$06:d04a  00 07		 brk #$07
$06:d04c  00 a2		 brk #$a2
$06:d04e  00 a6		 brk #$a6
$06:d050  97 ce		 sta [$ce],y
$06:d052  c5 bd		 cmp $bd
$06:d054  3b			tsc
$06:d055  64 7d		 stz $7d
$06:d057  72 dd		 adc ($dd)
$06:d059  ab			plb
$06:d05a  b7 95		 lda [$95],y
$06:d05c  ec a3 ff	  cpx $ffa3
$06:d05f  78			sei
$06:d060  00 38		 brk #$38
$06:d062  00 c0		 brk #$c0
$06:d064  00 82		 brk #$82
$06:d066  00 20		 brk #$20
$06:d068  00 40		 brk #$40
$06:d06a  00 03		 brk #$03
$06:d06c  00 00		 brk #$00
$06:d06e  00 09		 brk #$09
$06:d070  ee 54 de	  inc $de54
$06:d073  0a			asl a
$06:d074  fc 51 f6	  jsr ($f651,x)
$06:d077  a5 b8		 lda $b8
$06:d079  2a			rol a
$06:d07a  b5 d5		 lda $d5,x
$06:d07c  ea			nop
$06:d07d  a8			tay
$06:d07e  c7 10		 cmp [$10]
$06:d080  01 20		 ora ($20,x)
$06:d082  01 00		 ora ($00,x)
$06:d084  03 08		 ora $08,s
$06:d086  03 40		 ora $40,s
$06:d088  07 40		 ora [$40]
$06:d08a  0f 00 1f 00   ora $001f00
$06:d08e  3f 5e a9 57   and $57a95e,x
$06:d092  6c 54 9f	  jmp ($9f54)
$06:d095  98			tya
$06:d096  ef 61 7c 08   sbc $087c61
$06:d09a  1b			tcs
$06:d09b  04 10		 tsb $10
$06:d09d  00 00		 brk #$00
$06:d09f  ff ff ff ff   sbc $ffffff,x
$06:d0a3  3f ff 0e ff   and $ff0eff,x
$06:d0a7  02 7f		 cop #$7f
$06:d0a9  24 3f		 bit $3f
$06:d0ab  01 15		 ora ($15,x)
$06:d0ad  00 00		 brk #$00
$06:d0af  b7 c9		 lda [$c9],y
$06:d0b1  4a			lsr a
$06:d0b2  b6 aa		 ldx $aa,y
$06:d0b4  fd 7b b6	  sbc $b67b,x
$06:d0b7  94 2c		 sty $2c,x
$06:d0b9  a8			tay
$06:d0ba  f8			sed
$06:d0bb  08			php
$06:d0bc  90 00		 bcc $d0be
$06:d0be  00 ff		 brk #$ff
$06:d0c0  ff ff ff fc   sbc $fcffff,x
$06:d0c4  ff 30 ff 42   sbc $42ff30,x
$06:d0c8  fe 04 fc	  inc $fc04,x
$06:d0cb  20 b8 00	  jsr $00b8
$06:d0ce  00 01		 brk #$01
$06:d0d0  07 0f		 ora [$0f]
$06:d0d2  0a			asl a
$06:d0d3  13 1c		 ora ($1c,s),y
$06:d0d5  6e 35 59	  ror $5935
$06:d0d8  6f 5d 66 23   adc $23665d
$06:d0dc  4c 6e d5	  jmp $d56e
$06:d0df  0b			phd
$06:d0e0  0f 13 1f 27   ora $271f13
$06:d0e4  3f 07 7f 0f   and $0f7f07,x
$06:d0e8  7f 8f ff 1f   adc $1fff8f,x
$06:d0ec  7f 07 ff 80   adc $80ff07,x
$06:d0f0  e0 f0 50	  cpx #$50f0
$06:d0f3  c8			iny
$06:d0f4  38			sec
$06:d0f5  76 ac		 ror $ac,x
$06:d0f7  9a			txs
$06:d0f8  76 aa		 ror $aa,x
$06:d0fa  76 c4		 ror $c4,x
$06:d0fc  32 f6		 and ($f6)
$06:d0fe  3b			tsc
$06:d0ff  d0 f0		 bne $d0f1
$06:d101  c8			iny
$06:d102  f8			sed
$06:d103  e4 fc		 cpx $fc
$06:d105  e0 fe f0	  cpx #$f0fe
$06:d108  fe f1 ff	  inc $fff1,x
$06:d10b  f8			sed
$06:d10c  fe e0 ff	  inc $ffe0,x
$06:d10f  6b			rtl
$06:d110  69 b4 84	  adc #$84b4
$06:d113  ea			nop
$06:d114  e4 ba		 cpx $ba
$06:d116  b9 4a d2	  lda $d24a,y
$06:d119  aa			tax
$06:d11a  89 b2 b4	  bit #$b4b2
$06:d11d  ea			nop
$06:d11e  e2 e9		 sep #$e9
$06:d120  16 84		 asl $84,x
$06:d122  7b			tdc
$06:d123  60			rts
$06:d124  1f 78 07 42   ora $420778,x
$06:d128  3d 88 77	  and $7788,x
$06:d12b  b0 4f		 bcs $d17c
$06:d12d  62 1d 6b	  per $3c4d
$06:d130  6b			rtl
$06:d131  ac ac 9b	  ldy $9bac
$06:d134  9a			txs
$06:d135  a4 04		 ldy $04
$06:d137  9b			txy
$06:d138  53 2d		 eor ($2d,s),y
$06:d13a  05 d7		 ora $d7
$06:d13c  c5 aa		 cmp $aa
$06:d13e  40			rti
$06:d13f  d7 00		 cmp [$00],y
$06:d141  bc 43 9a	  ldy $9a43,x
$06:d144  65 04		 adc $04
$06:d146  fb			xce
$06:d147  13 ec		 ora ($ec,s),y
$06:d149  05 fa		 ora $fa
$06:d14b  c5 3a		 cmp $3a
$06:d14d  00 ff		 brk #$ff
$06:d14f  aa			tax
$06:d150  aa			tax
$06:d151  fd fd 7f	  sbc $7ffd,x
$06:d154  7b			tdc
$06:d155  aa			tax
$06:d156  2a			rol a
$06:d157  ff 6c 62 64   sbc $64626c,x
$06:d15b  a5 a9		 lda $a9
$06:d15d  ca			dex
$06:d15e  91 57		 sta ($57),y
$06:d160  00 c5		 brk #$c5
$06:d162  02 7b		 cop #$7b
$06:d164  84 2a		 sty $2a
$06:d166  d5 6c		 cmp $6c,x
$06:d168  93 60		 sta ($60,s),y
$06:d16a  9f a1 5e 80   sta $805ea1,x
$06:d16e  7f ee ce bf   adc $bfceee,x
$06:d172  3f 57 4b ab   and $ab4b57,x
$06:d176  49 76		 eor #$76
$06:d178  6e 97 53	  ror $5397
$06:d17b  3b			tsc
$06:d17c  1a			inc a
$06:d17d  5f 57 c9 30   eor $30c957,x
$06:d181  3e c0 43	  rol $43c0,x
$06:d184  bc 09 f6	  ldy $f609,x
$06:d187  66 99		 ror $99
$06:d189  13 ec		 ora ($ec,s),y
$06:d18b  1a			inc a
$06:d18c  e4 54		 cpx $54
$06:d18e  a0 ab 89	  ldy #$89ab
$06:d191  ed ed a4	  sbc $a4ed
$06:d194  28			plp
$06:d195  8a			txa
$06:d196  92 32		 sta ($32)
$06:d198  64 e5		 stz $e5
$06:d19a  29 1d		 and #$1d
$06:d19c  25 d2		 and $d2
$06:d19e  c1 71		 cmp ($71,x)
$06:d1a0  06 0d		 asl $0d
$06:d1a2  12 e1		 ora ($e1)
$06:d1a4  1e 02 7d	  asl $7d02,x
$06:d1a7  20 df 01	  jsr $01df
$06:d1aa  fe 05 fa	  inc $fa05,x
$06:d1ad  c0 3f e2	  cpy #$e23f
$06:d1b0  63 cd		 adc $cd,s
$06:d1b2  a9 a4		 lda #$a4
$06:d1b4  94 9a		 sty $9a,x
$06:d1b6  4c 2d 09	  jmp $092d
$06:d1b9  92 4b		 sta ($4b)
$06:d1bb  4c 24 69	  jmp $6924
$06:d1be  4a			lsr a
$06:d1bf  68			pla
$06:d1c0  94 88		 sty $88,x
$06:d1c2  76 85		 ror $85,x
$06:d1c4  7a			ply
$06:d1c5  08			php
$06:d1c6  f7 00		 sbc [$00],y
$06:d1c8  fe 02 fc	  inc $fc02,x
$06:d1cb  04 fb		 tsb $fb
$06:d1cd  48			pha
$06:d1ce  b7 8d		 lda [$8d],y
$06:d1d0  6a			ror a
$06:d1d1  3c e8 ef	  bit $efe8,x
$06:d1d4  47 2f		 eor [$2f]
$06:d1d6  63 2a		 adc $2a,s
$06:d1d8  12 d6		 ora ($d6)
$06:d1da  5a			phy
$06:d1db  62 d8 d7	  per $a9b6
$06:d1de  45 08		 eor $08
$06:d1e0  f7 08		 sbc [$08],y
$06:d1e2  f3 07		 sbc ($07,s),y
$06:d1e4  f0 23		 beq $d209
$06:d1e6  d8			cld
$06:d1e7  02 fd		 cop #$fd
$06:d1e9  42 bd		 wdm #$bd
$06:d1eb  40			rti
$06:d1ec  bd 45 b8	  lda $b845,x
$06:d1ef  6a			ror a
$06:d1f0  5c d4 48 62   jml $6248d4
$06:d1f4  20 5d 15	  jsr $155d
$06:d1f7  8b			phb
$06:d1f8  60			rts
$06:d1f9  28			plp
$06:d1fa  ab			plb
$06:d1fb  a7 55		 lda [$55]
$06:d1fd  1c 75 40	  trb $4075
$06:d200  bf 40 3f 20   lda $203f40,x
$06:d204  9d 15 e2	  sta $e215,x
$06:d207  00 f7		 brk #$f7
$06:d209  08			php
$06:d20a  f7 04		 sbc [$04],y
$06:d20c  fb			xce
$06:d20d  04 fb		 tsb $fb
$06:d20f  da			phx
$06:d210  cf 72 f5 56   cmp $56f572
$06:d214  ba			tsx
$06:d215  a5 dc		 lda $dc
$06:d217  5b			tcd
$06:d218  af a5 dd 5a   lda $5adda5
$06:d21c  ea			nop
$06:d21d  25 7c		 and $7c
$06:d21f  30 00		 bmi $d221
$06:d221  08			php
$06:d222  00 01		 brk #$01
$06:d224  00 03		 brk #$03
$06:d226  00 00		 brk #$00
$06:d228  00 02		 brk #$02
$06:d22a  00 05		 brk #$05
$06:d22c  00 83		 brk #$83
$06:d22e  00 6d		 brk #$6d
$06:d230  b2 b6		 lda ($b6)
$06:d232  c9 62		 cmp #$62
$06:d234  1f ab 6b 44   ora $446bab,x
$06:d238  d6 92		 dec $92,x
$06:d23a  48			pha
$06:d23b  5a			phy
$06:d23c  7f aa 95 00   adc $0095aa,x
$06:d240  00 80		 brk #$80
$06:d242  00 00		 brk #$00
$06:d244  80 14		 bra $d25a
$06:d246  00 29		 brk #$29
$06:d248  00 37		 brk #$37
$06:d24a  00 40		 brk #$40
$06:d24c  80 80		 bra $d1ce
$06:d24e  40			rti
$06:d24f  49 49		 eor #$49
$06:d251  a6 10		 ldx $10
$06:d253  5b			tcd
$06:d254  20 05 3e	  jsr $3e05
$06:d257  90 44		 bcc $d29d
$06:d259  a5 ed		 lda $ed
$06:d25b  5a			phy
$06:d25c  b7 65		 lda [$65],y
$06:d25e  9a			txs
$06:d25f  b6 00		 ldx $00,y
$06:d261  ff 00 ff 00   sbc $00ff00,x
$06:d265  fb			xce
$06:d266  00 bb		 brk #$bb
$06:d268  00 12		 brk #$12
$06:d26a  00 00		 brk #$00
$06:d26c  00 00		 brk #$00
$06:d26e  00 b7		 brk #$b7
$06:d270  e8			inx
$06:d271  3d c2 f6	  and $f6c2,x
$06:d274  89 5f		 bit #$5f
$06:d276  a0 a9 76	  ldy #$76a9
$06:d279  d4 2d		 pei ($2d)
$06:d27b  f9 06 6f	  sbc $6f06,y
$06:d27e  90 20		 bcc $d2a0
$06:d280  00 00		 brk #$00
$06:d282  00 00		 brk #$00
$06:d284  00 00		 brk #$00
$06:d286  00 00		 brk #$00
$06:d288  00 02		 brk #$02
$06:d28a  00 00		 brk #$00
$06:d28c  00 00		 brk #$00
$06:d28e  00 1a		 brk #$1a
$06:d290  d0 e1		 bne $d273
$06:d292  7c 94 fa	  jmp ($fa94,x)
$06:d295  49 d6		 eor #$d6
$06:d297  a5 6f		 lda $6f
$06:d299  d2 f6		 cmp ($f6)
$06:d29b  2a			rol a
$06:d29c  bf b6 ed 20   lda $20edb6,x
$06:d2a0  07 00		 ora [$00]
$06:d2a2  03 00		 ora $00,s
$06:d2a4  01 20		 ora ($20,x)
$06:d2a6  00 10		 brk #$10
$06:d2a8  00 09		 brk #$09
$06:d2aa  00 40		 brk #$40
$06:d2ac  00 00		 brk #$00
$06:d2ae  00 75		 brk #$75
$06:d2b0  8f ac 53 7b   sta $7b53ac
$06:d2b4  c5 af		 cmp $af
$06:d2b6  d4 5b		 pei ($5b)
$06:d2b8  b4 97		 ldy $97,x
$06:d2ba  78			sei
$06:d2bb  e5 2a		 sbc $2a
$06:d2bd  5b			tcd
$06:d2be  b6 00		 ldx $00,y
$06:d2c0  00 00		 brk #$00
$06:d2c2  00 00		 brk #$00
$06:d2c4  00 00		 brk #$00
$06:d2c6  00 00		 brk #$00
$06:d2c8  00 00		 brk #$00
$06:d2ca  00 10		 brk #$10
$06:d2cc  00 00		 brk #$00
$06:d2ce  00 21		 brk #$21
$06:d2d0  46 2b		 lsr $2b
$06:d2d2  54 c4 6f	  mvn $6f,$c4
$06:d2d5  1b			tcs
$06:d2d6  2e 2e 31	  rol $312e
$06:d2d9  17 1c		 ora [$1c],y
$06:d2db  17 1a		 ora [$1a],y
$06:d2dd  08			php
$06:d2de  0f 9f ff 0f   ora $0fff9f
$06:d2e2  7f 1f ff 4f   adc $4fff1f,x
$06:d2e6  7f 47 7f 27   adc $277f47,x
$06:d2ea  3f 03 1f 03   and $031f03,x
$06:d2ee  0f f4 22 d4   ora $d422f4
$06:d2f2  2a			rol a
$06:d2f3  a3 76		 lda $76,s
$06:d2f5  98			tya
$06:d2f6  74 74		 stz $74,x
$06:d2f8  8c e8 38	  sty $38e8
$06:d2fb  e8			inx
$06:d2fc  58			cli
$06:d2fd  10 f0		 bpl $d2ef
$06:d2ff  e9 ff		 sbc #$ff
$06:d301  f0 fe		 beq $d301
$06:d303  f8			sed
$06:d304  ff f2 fe e2   sbc $e2fef2,x
$06:d308  fe e4 fc	  inc $fce4,x
$06:d30b  c0 f8 c0	  cpy #$c0f8
$06:d30e  f0 76		 beq $d386
$06:d310  e5 be		 sbc $be
$06:d312  b8			clv
$06:d313  fa			plx
$06:d314  f2 9d		 sbc ($9d)
$06:d316  9c 6a e2	  stz $e26a
$06:d319  a5 85		 lda $85
$06:d31b  7a			ply
$06:d31c  39 fe fe	  and $fefe,y
$06:d31f  24 1b		 bit $1b
$06:d321  58			cli
$06:d322  07 72		 ora [$72]
$06:d324  0d 9c 63	  ora $639c
$06:d327  62 1d 85	  per $5847
$06:d32a  7a			ply
$06:d32b  38			sec
$06:d32c  c7 de		 cmp [$de]
$06:d32e  01 b0		 ora ($b0,x)
$06:d330  34 af		 bit $af,x
$06:d332  91 80		 sta ($80),y
$06:d334  42 3a		 wdm #$3a
$06:d336  38			sec
$06:d337  cd 04 a5	  cmp $a504
$06:d33a  91 d5		 sta ($d5),y
$06:d33c  0e 6a 30	  asl $306a
$06:d33f  30 cf		 bmi $d310
$06:d341  81 7e		 sta ($7e,x)
$06:d343  00 ff		 brk #$ff
$06:d345  38			sec
$06:d346  c7 04		 cmp [$04]
$06:d348  fb			xce
$06:d349  81 7e		 sta ($7e,x)
$06:d34b  00 ff		 brk #$ff
$06:d34d  00 ff		 brk #$ff
$06:d34f  74 44		 stz $44,x
$06:d351  89 25		 bit #$25
$06:d353  6b			rtl
$06:d354  09 9d		 ora #$9d
$06:d356  c5 56		 cmp $56
$06:d358  12 2d		 ora ($2d)
$06:d35a  2c 27 07	  bit $0727
$06:d35d  d5 c1		 cmp $c1,x
$06:d35f  44 bb 01	  mvp $01,$bb
$06:d362  fe 09 f6	  inc $f609,x
$06:d365  85 7a		 sta $7a
$06:d367  12 ed		 ora ($ed)
$06:d369  2c d3 07	  bit $07d3
$06:d36c  f8			sed
$06:d36d  c1 3e		 cmp ($3e,x)
$06:d36f  ea			nop
$06:d370  7a			ply
$06:d371  65 6d		 adc $6d
$06:d373  b4 bc		 ldy $bc,x
$06:d375  56 46		 lsr $46,x
$06:d377  a9 0f		 lda #$0f
$06:d379  8b			phb
$06:d37a  43 25		 eor $25,s
$06:d37c  15 d3		 ora $d3,x
$06:d37e  89 65		 bit #$65
$06:d380  80 52		 bra $d3d4
$06:d382  80 b3		 bra $d337
$06:d384  40			rti
$06:d385  45 b8		 eor $b8
$06:d387  08			php
$06:d388  f0 02		 beq $d38c
$06:d38a  fc 05 fa	  jsr ($fa05,x)
$06:d38d  81 7e		 sta ($7e,x)
$06:d38f  6d 24 d4	  adc $d424
$06:d392  b2 2b		 lda ($2b)
$06:d394  08			php
$06:d395  86 8a		 stx $8a
$06:d397  ea			nop
$06:d398  b0 9b		 bcs $d335
$06:d39a  8c 64 60	  sty $6064
$06:d39d  a9 a9		 lda #$a9
$06:d39f  24 db		 bit $db
$06:d3a1  90 6f		 bcc $d412
$06:d3a3  08			php
$06:d3a4  f7 82		 sbc [$82],y
$06:d3a6  7d 20 5f	  adc $5f20,x
$06:d3a9  08			php
$06:d3aa  77 a0		 adc [$a0],y
$06:d3ac  1f 49 16 12   ora $121649,x
$06:d3b0  94 dd		 sty $dd,x
$06:d3b2  68			pla
$06:d3b3  6a			ror a
$06:d3b4  48			pha
$06:d3b5  94 58		 sty $58,x
$06:d3b7  b7 23		 lda [$23],y
$06:d3b9  5c 68 25 85   jml $852568
$06:d3bd  dc 5c 10	  jml [$105c]
$06:d3c0  ef 48 b7 00   sbc $00b748
$06:d3c4  ff 10 ef 22   sbc $22ef10,x
$06:d3c8  dc 49 b6	  jml [$b649]
$06:d3cb  06 f8		 asl $f8
$06:d3cd  53 a0		 eor ($a0,s),y
$06:d3cf  af 89 a7 55   lda $55a789
$06:d3d3  1f 74 b5 6c   ora $6cb574,x
$06:d3d7  51 22		 eor ($22),y
$06:d3d9  ce 89 b5	  dec $b589
$06:d3dc  83 5a		 sta $5a,s
$06:d3de  09 89		 ora #$89
$06:d3e0  70 05		 bvs $d3e7
$06:d3e2  f8			sed
$06:d3e3  04 f8		 tsb $f8
$06:d3e5  04 fb		 tsb $fb
$06:d3e7  00 ff		 brk #$ff
$06:d3e9  88			dey
$06:d3ea  37 80		 and [$80],y
$06:d3ec  4f 08 e7 b6   eor $b6e708
$06:d3f0  60			rts
$06:d3f1  5f 21 9e 92   eor $929e21,x
$06:d3f5  79 49 32	  adc $3249,y
$06:d3f8  94 fb		 sty $fb,x
$06:d3fa  96 d6		 stx $d6,y
$06:d3fc  40			rti
$06:d3fd  55 29		 eor $29,x
$06:d3ff  00 f9		 brk #$f9
$06:d401  01 f0		 ora ($f0,x)
$06:d403  92 61		 sta ($61)
$06:d405  49 86		 eor #$86
$06:d407  10 cf		 bpl $d3d8
$06:d409  10 cf		 bpl $d3da
$06:d40b  40			rti
$06:d40c  bf 01 fe fa   lda $fafe01,x
$06:d410  d5 2c		 cmp $2c,x
$06:d412  b3 86		 lda ($86,s),y
$06:d414  fe 75 95	  inc $9575,x
$06:d417  cb			wai
$06:d418  23 9c		 and $9c,s
$06:d41a  fe 2a 58	  inc $582a,x
$06:d41d  47 b7		 eor [$b7]
$06:d41f  20 00 40	  jsr $4000
$06:d422  00 01		 brk #$01
$06:d424  00 0a		 brk #$0a
$06:d426  00 1c		 brk #$1c
$06:d428  00 01		 brk #$01
$06:d42a  00 87		 brk #$87
$06:d42c  00 08		 brk #$08
$06:d42e  00 75		 brk #$75
$06:d430  4a			lsr a
$06:d431  d2 b5		 cmp ($b5)
$06:d433  8d 77 d5	  sta $d577
$06:d436  aa			tax
$06:d437  ea			nop
$06:d438  95 f3		 sta $f3,x
$06:d43a  29 ad		 and #$ad
$06:d43c  7b			tdc
$06:d43d  e9 16		 sbc #$16
$06:d43f  40			rti
$06:d440  80 8a		 bra $d3cc
$06:d442  00 00		 brk #$00
$06:d444  00 80		 brk #$80
$06:d446  00 80		 brk #$80
$06:d448  00 16		 brk #$16
$06:d44a  00 00		 brk #$00
$06:d44c  00 00		 brk #$00
$06:d44e  00 4a		 brk #$4a
$06:d450  f7 99		 sbc [$99],y
$06:d452  89 d7		 bit #$d7
$06:d454  df 8c ff 4a   cmp $4aff8c,x
$06:d458  f7 b2		 sbc [$b2],y
$06:d45a  90 57		 bcc $d4b3
$06:d45c  53 54		 eor ($54,s),y
$06:d45e  fd 00 00	  sbc $0000,x
$06:d461  76 00		 ror $00,x
$06:d463  20 00 00	  jsr $0000
$06:d466  00 00		 brk #$00
$06:d468  00 6f		 brk #$6f
$06:d46a  00 ac		 brk #$ac
$06:d46c  00 02		 brk #$02
$06:d46e  00 56		 brk #$56
$06:d470  b9 ab 74	  lda $74ab,y
$06:d473  f2 0f		 sbc ($0f)
$06:d475  ad 5d 79	  lda $795d
$06:d478  86 d6		 stx $d6
$06:d47a  b9 3d c3	  lda $c33d,y
$06:d47d  9f 60 00 00   sta $000060,x
$06:d481  00 00		 brk #$00
$06:d483  00 00		 brk #$00
$06:d485  02 00		 cop #$00
$06:d487  00 00		 brk #$00
$06:d489  00 00		 brk #$00
$06:d48b  00 00		 brk #$00
$06:d48d  00 00		 brk #$00
$06:d48f  ea			nop
$06:d490  30 9d		 bmi $d42f
$06:d492  60			rts
$06:d493  6e 90 bf	  ror $bf90
$06:d496  60			rts
$06:d497  da			phx
$06:d498  35 2d		 and $2d,x
$06:d49a  db			stp
$06:d49b  d5 6a		 cmp $6a,x
$06:d49d  5b			tcd
$06:d49e  a4 00		 ldy $00
$06:d4a0  07 00		 ora [$00]
$06:d4a2  03 00		 ora $00,s
$06:d4a4  01 00		 ora ($00,x)
$06:d4a6  00 00		 brk #$00
$06:d4a8  00 00		 brk #$00
$06:d4aa  00 00		 brk #$00
$06:d4ac  00 00		 brk #$00
$06:d4ae  00 a5		 brk #$a5
$06:d4b0  ec 1a cf	  cpx $cf1a
$06:d4b3  6c eb a5	  jmp ($a5eb)
$06:d4b6  ee 50 7b	  inc $7b50
$06:d4b9  a6 9c		 ldx $9c
$06:d4bb  57 fb		 eor [$fb],y
$06:d4bd  aa			tax
$06:d4be  da			phx
$06:d4bf  12 00		 ora ($00)
$06:d4c1  30 00		 bmi $d4c3
$06:d4c3  10 00		 bpl $d4c5
$06:d4c5  10 00		 bpl $d4c7
$06:d4c7  84 00		 sty $00
$06:d4c9  41 00		 eor ($00,x)
$06:d4cb  00 00		 brk #$00
$06:d4cd  05 00		 ora $00
$06:d4cf  6f 98 d5 ae   adc $aed598
$06:d4d3  af 90 75 1a   lda $1a7590
$06:d4d7  5a			phy
$06:d4d8  47 ab		 eor [$ab]
$06:d4da  06 94		 asl $94
$06:d4dc  03 2a		 ora $2a,s
$06:d4de  49 00		 eor #$00
$06:d4e0  00 80		 brk #$80
$06:d4e2  00 80		 brk #$80
$06:d4e4  40			rti
$06:d4e5  00 c0		 brk #$c0
$06:d4e7  40			rti
$06:d4e8  a0 00 f0	  ldy #$f000
$06:d4eb  00 f8		 brk #$f8
$06:d4ed  08			php
$06:d4ee  f4 09 ee	  pea $ee09
$06:d4f1  54 de 08	  mvn $08,$de
$06:d4f4  fc 53 f6	  jsr ($f653,x)
$06:d4f7  a5 bc		 lda $bc
$06:d4f9  22 b1 d5 f0   jsl $f0d5b1
$06:d4fd  8a			txa
$06:d4fe  c0 10 01	  cpy #$0110
$06:d501  20 01 00	  jsr $0001
$06:d504  03 0a		 ora $0a,s
$06:d506  01 44		 ora ($44,x)
$06:d508  03 40		 ora $40,s
$06:d50a  0f 10 0f 00   ora $000f10
$06:d50e  3f ed e0 f8   and $f8e0ed,x
$06:d512  fb			xce
$06:d513  b2 84		 lda ($84)
$06:d515  64 6a		 stz $6a
$06:d517  c8			iny
$06:d518  92 f2		 sta ($f2)
$06:d51a  4a			lsr a
$06:d51b  28			plp
$06:d51c  0a			asl a
$06:d51d  c3 a9		 cmp $a9,s
$06:d51f  20 1f 78	  jsr $781f
$06:d522  07 80		 ora [$80]
$06:d524  7f 60 9f 80   adc $809f60,x
$06:d528  7f 40 bf 00   adc $00bf40,x
$06:d52c  ff 81 7e b4   sbc $b47e81,x
$06:d530  c2 a2		 rep #$a2
$06:d532  14 07		 trb $07
$06:d534  b5 b0		 lda $b0,x
$06:d536  a4 81		 ldy $81
$06:d538  a5 0e		 lda $0e
$06:d53a  aa			tax
$06:d53b  fa			plx
$06:d53c  5a			phy
$06:d53d  55 55		 eor $55,x
$06:d53f  00 ff		 brk #$ff
$06:d541  00 ff		 brk #$ff
$06:d543  01 fe		 ora ($fe,x)
$06:d545  00 ff		 brk #$ff
$06:d547  01 fe		 ora ($fe,x)
$06:d549  0a			asl a
$06:d54a  f5 5a		 sbc $5a,x
$06:d54c  a5 55		 lda $55
$06:d54e  aa			tax
$06:d54f  23 48		 and $48,s
$06:d551  59 85 92	  eor $9285,y
$06:d554  24 67		 bit $67
$06:d556  4a			lsr a
$06:d557  89 52 72	  bit #$7252
$06:d55a  a5 05		 lda $05
$06:d55c  a9 aa 49	  lda #$49aa
$06:d55f  00 ff		 brk #$ff
$06:d561  01 fe		 ora ($fe,x)
$06:d563  00 ff		 brk #$ff
$06:d565  00 ff		 brk #$ff
$06:d567  00 ff		 brk #$ff
$06:d569  00 ff		 brk #$ff
$06:d56b  00 ff		 brk #$ff
$06:d56d  00 ff		 brk #$ff
$06:d56f  7c 50 01	  jmp ($0150,x)
$06:d572  04 be		 tsb $be
$06:d574  68			pla
$06:d575  31 13		 and ($13),y
$06:d577  9c 56 46	  stz $4656
$06:d57a  24 3d		 bit $3d
$06:d57c  0d 9f 4f	  ora $4f9f
$06:d57f  50 af		 bvc $d530
$06:d581  00 ff		 brk #$ff
$06:d583  28			plp
$06:d584  d7 11		 cmp [$11],y
$06:d586  ee 14 eb	  inc $eb14
$06:d589  04 fb		 tsb $fb
$06:d58b  0d f2 0a	  ora $0af2
$06:d58e  f0 ab		 beq $d53b
$06:d590  ab			plb
$06:d591  65 29		 adc $29
$06:d593  8a			txa
$06:d594  92 b2		 sta ($b2)
$06:d596  64 65		 stz $65
$06:d598  29 93 a1	  and #$a193
$06:d59b  df cb 6e 6e   cmp $6e6ecb,x
$06:d59f  08			php
$06:d5a0  54 20 de	  mvn $de,$20
$06:d5a3  83 7c		 sta $7c,s
$06:d5a5  20 df 01	  jsr $01df
$06:d5a8  fe 81 7e	  inc $7e81,x
$06:d5ab  4a			lsr a
$06:d5ac  34 ad		 bit $ad,x
$06:d5ae  10 cb		 bpl $d57b
$06:d5b0  91 b4		 sta ($b4),y
$06:d5b2  85 4d		 sta $4d
$06:d5b4  84 6a		 sty $6a
$06:d5b6  3a			dec a
$06:d5b7  b2 a4		 lda ($a4)
$06:d5b9  45 29		 eor $29
$06:d5bb  2d 05 52	  and $5205
$06:d5be  41 81		 eor ($81,x)
$06:d5c0  7e 04 fb	  ror $fb04,x
$06:d5c3  04 fb		 tsb $fb
$06:d5c5  2a			rol a
$06:d5c6  d5 80		 cmp $80,x
$06:d5c8  7f 01 fe 05   adc $05fe01,x
$06:d5cc  fa			plx
$06:d5cd  40			rti
$06:d5ce  bf 8d 6d 3d   lda $3d6d8d,x
$06:d5d2  ef e9 44 2e   sbc $2e44e9
$06:d5d6  61 28		 adc ($28,x)
$06:d5d8  10 d6		 bpl $d5b0
$06:d5da  58			cli
$06:d5db  60			rts
$06:d5dc  d9 d7 44	  cmp $44d7,y
$06:d5df  0a			asl a
$06:d5e0  f0 08		 beq $d5ea
$06:d5e2  f0 03		 beq $d5e7
$06:d5e4  f0 23		 beq $d609
$06:d5e6  d8			cld
$06:d5e7  03 fc		 ora $fc,s
$06:d5e9  43 bc		 eor $bc,s
$06:d5eb  43 bc		 eor $bc,s
$06:d5ed  47 b8		 eor [$b8]
$06:d5ef  ad 8f a7	  lda $a78f
$06:d5f2  57 1d		 eor [$1d],y
$06:d5f4  74 b6		 stz $b6,x
$06:d5f6  6c 50 20	  jmp ($2050)
$06:d5f9  cb			wai
$06:d5fa  8a			txa
$06:d5fb  bd 8a 50	  lda $508a,x
$06:d5fe  00 88		 brk #$88
$06:d600  70 04		 bvs $d606
$06:d602  f8			sed
$06:d603  07 f8		 ora [$f8]
$06:d605  07 f8		 ora [$f8]
$06:d607  03 fc		 ora $fc,s
$06:d609  8d 30 87	  sta $8730
$06:d60c  40			rti
$06:d60d  0f e0 0a 28   ora $280ae0
$06:d611  d5 95		 cmp $95,x
$06:d613  4b			phk
$06:d614  6b			rtl
$06:d615  58			cli
$06:d616  46 9d		 lsr $9d
$06:d618  ac 2e 0d	  ldy $0d2e
$06:d61b  d5 51		 cmp $51,x
$06:d61d  9a			txs
$06:d61e  99 f7 00	  sta $00f7,y
$06:d621  6a			ror a
$06:d622  00 94		 brk #$94
$06:d624  00 b8		 brk #$b8
$06:d626  01 74		 ora ($74,x)
$06:d628  03 fc		 ora $fc,s
$06:d62a  03 a0		 ora $a0,s
$06:d62c  0f 68 07 52   ora $520768
$06:d630  f3 ab		 sbc ($ab,s),y
$06:d632  e3 5c		 sbc $5c,s
$06:d634  de 77 1f	  dec $1f77,x
$06:d637  a9 a9 aa	  lda #$aaa9
$06:d63a  e4 52		 cpx $52
$06:d63c  53 bd		 eor ($bd,s),y
$06:d63e  bc 0c 00	  ldy $000c,x
$06:d641  1c 00 21	  trb $2100
$06:d644  00 e0		 brk #$e0
$06:d646  00 56		 brk #$56
$06:d648  00 1f		 brk #$1f
$06:d64a  00 ac		 brk #$ac
$06:d64c  00 43		 brk #$43
$06:d64e  00 5a		 brk #$5a
$06:d650  cf b2 f5 45   cmp $45f5b2
$06:d654  7b			tdc
$06:d655  94 ed		 sty $ed,x
$06:d657  91 5f		 sta ($5f),y
$06:d659  65 fc		 adc $fc
$06:d65b  13 ef		 ora ($ef,s),y
$06:d65d  a9 f7 30	  lda #$30f7
$06:d660  00 08		 brk #$08
$06:d662  00 80		 brk #$80
$06:d664  00 02		 brk #$02
$06:d666  00 20		 brk #$20
$06:d668  03 03		 ora $03,s
$06:d66a  0f 00 0f 00   ora $000f00
$06:d66e  0f a2 fd 8a   ora $8afda2
$06:d672  f6 6b		 inc $6b,x
$06:d674  58			cli
$06:d675  ac 69 d2	  ldy $d269
$06:d678  8b			phb
$06:d679  29 27 75	  and #$7527
$06:d67c  72 94		 adc ($94)
$06:d67e  f3 00		 sbc ($00,s),y
$06:d680  07 01		 ora [$01]
$06:d682  0f 87 3f 17   ora $173f87
$06:d686  ff 7f ff df   sbc $dfff7f,x
$06:d68a  ff 8f ff 0f   sbc $0fff8f,x
$06:d68e  ff c9 ff 92   sbc $92ffc9,x
$06:d692  1d 6d bf	  ora $bf6d,x
$06:d695  d2 17		 cmp ($17)
$06:d697  2c cf 8b	  bit $8bcf
$06:d69a  f3 d7		 sbc ($d7,s),y
$06:d69c  f8			sed
$06:d69d  cc ff 00	  cpy $00ff
$06:d6a0  f0 e0		 beq $d682
$06:d6a2  fc c0 fe	  jsr ($fec0,x)
$06:d6a5  e8			inx
$06:d6a6  ff f0 ff fc   sbc $fcfff0,x
$06:d6aa  ff ff ff ff   sbc $ffffff,x
$06:d6ae  ff 72 f3 cb   sbc $cbf372,x
$06:d6b2  e3 7c		 sbc $7c,s
$06:d6b4  3e 0b 97	  rol $970b,x
$06:d6b7  97 ff		 sta [$ff],y
$06:d6b9  b5 b1		 lda $b1,x
$06:d6bb  5d 9e b2	  eor $b29e,x
$06:d6be  3e 0c 00	  rol $000c,x
$06:d6c1  1c 00 c1	  trb $c100
$06:d6c4  00 60		 brk #$60
$06:d6c6  80 00		 bra $d6c8
$06:d6c8  c0 4e e0	  cpy #$e04e
$06:d6cb  e0 f0 c1	  cpx #$c1f0
$06:d6ce  f0 65		 beq $d735
$06:d6d0  83 9e		 sta $9e,s
$06:d6d2  05 7d		 ora $7d
$06:d6d4  0b			phd
$06:d6d5  b2 11		 lda ($11)
$06:d6d7  ca			dex
$06:d6d8  23 75		 and $75,s
$06:d6da  29 da 59	  and #$59da
$06:d6dd  ad 7e 00	  lda $007e
$06:d6e0  d8			cld
$06:d6e1  03 f0		 ora $f0,s
$06:d6e3  07 a0		 ora [$a0]
$06:d6e5  0f c0 1d 80   ora $801dc0
$06:d6e9  1f 80 27 00   ora $002780,x
$06:d6ed  03 00		 ora $00,s
$06:d6ef  5a			phy
$06:d6f0  c1 b5		 cmp ($b5,x)
$06:d6f2  28			plp
$06:d6f3  7b			tdc
$06:d6f4  9c 94 e5	  stz $e594
$06:d6f7  fa			plx
$06:d6f8  d1 55		 cmp ($55),y
$06:d6fa  ea			nop
$06:d6fb  8d 61 ae	  sta $ae61
$06:d6fe  19 00 3f	  ora $3f00,y
$06:d701  c0 1f e0	  cpy #$e01f
$06:d704  07 f8		 ora [$f8]
$06:d706  03 fe		 ora $fe,s
$06:d708  03 fc		 ora $fc,s
$06:d70a  01 fe		 ora ($fe,x)
$06:d70c  00 fe		 brk #$fe
$06:d70e  00 6d		 brk #$6d
$06:d710  45 16		 eor $16
$06:d712  56 d9		 lsr $d9,x
$06:d714  94 b6		 sty $b6,x
$06:d716  ac 4d bd	  ldy $bd4d
$06:d719  97 ff		 sta [$ff],y
$06:d71b  73 f7		 adc ($f7,s),y
$06:d71d  ae bf 05	  ldx $05bf
$06:d720  fa			plx
$06:d721  16 e9		 asl $e9,x
$06:d723  90 63		 bcc $d788
$06:d725  a4 43		 ldy $43
$06:d727  05 02		 ora $02
$06:d729  03 00		 ora $00,s
$06:d72b  09 00 40	  ora #$4000
$06:d72e  00 eb		 brk #$eb
$06:d730  eb			xba
$06:d731  b5 91		 lda $91,x
$06:d733  5b			tcd
$06:d734  09 ef 25	  ora #$25ef
$06:d737  25 ac		 and $ac
$06:d739  bf 36 56 74   lda $745636,x
$06:d73d  ed d8 eb	  sbc $ebd8
$06:d740  14 91		 trb $91
$06:d742  6e 09 f6	  ror $f609
$06:d745  25 da		 and $da
$06:d747  24 da		 bit $da
$06:d749  36 c8		 rol $c8,x
$06:d74b  55 89		 eor $89,x
$06:d74d  8b			phb
$06:d74e  03 49		 ora $49,s
$06:d750  52 96		 eor ($96)
$06:d752  d2 e0		 cmp ($e0)
$06:d754  b6 b6		 ldx $b6,y
$06:d756  24 59		 bit $59
$06:d758  cc af 0a	  cpy $0aaf
$06:d75b  5a			phy
$06:d75c  2a			rol a
$06:d75d  35 4f		 and $4f,x
$06:d75f  00 ff		 brk #$ff
$06:d761  80 7f		 bra $d7e2
$06:d763  a0 5f 20	  ldy #$205f
$06:d766  5f 68 37 fa   eor $fa3768,x
$06:d76a  f5 fa		 sbc $fa,x
$06:d76c  f5 fd		 sbc $fd,x
$06:d76e  f8			sed
$06:d76f  47 af		 eor [$af]
$06:d771  11 a5		 ora ($a5),y
$06:d773  a2 97 db	  ldx #$db97
$06:d776  8f e5 ad 3a   sta $3aade5
$06:d77a  ba			tsx
$06:d77b  3b			tsc
$06:d77c  bd ee 7e	  lda $7eee,x
$06:d77f  00 f0		 brk #$f0
$06:d781  02 f8		 cop #$f8
$06:d783  00 f8		 brk #$f8
$06:d785  08			php
$06:d786  f0 22		 beq $d7aa
$06:d788  d0 35		 bne $d7bf
$06:d78a  c0 22 c0	  cpy #$c022
$06:d78d  41 80		 eor ($80,x)
$06:d78f  50 d1		 bvc $d762
$06:d791  26 14		 rol $14
$06:d793  d1 49		 cmp ($49),y
$06:d795  4d 26 b6	  eor $b626
$06:d798  84 c9		 sty $c9
$06:d79a  85 7a		 sta $7a
$06:d79c  53 b5		 eor ($b5,s),y
$06:d79e  b4 14		 ldy $14,x
$06:d7a0  2a			rol a
$06:d7a1  84 7b		 sty $7b
$06:d7a3  c1 3e		 cmp ($3e,x)
$06:d7a5  04 fb		 tsb $fb
$06:d7a7  80 7f		 bra $d828
$06:d7a9  81 7e		 sta ($7e,x)
$06:d7ab  d2 2c		 cmp ($2c)
$06:d7ad  77 08		 adc [$08],y
$06:d7af  a2 90 1b	  ldx #$1b90
$06:d7b2  8d a4 61	  sta $61a4
$06:d7b5  49 12 b6	  eor #$b612
$06:d7b8  24 4d		 bit $4d
$06:d7ba  24 54		 bit $54
$06:d7bc  02 ab		 cop #$ab
$06:d7be  89 80 7f	  bit #$7f80
$06:d7c1  09 f6 20	  ora #$20f6
$06:d7c4  df 00 ff 04   cmp $04ff00,x
$06:d7c8  fb			xce
$06:d7c9  00 ff		 brk #$ff
$06:d7cb  00 ff		 brk #$ff
$06:d7cd  89 76 ad	  bit #$ad76
$06:d7d0  8f a7 57 1f   sta $1f57a7
$06:d7d4  74 b5		 stz $b5,x
$06:d7d6  6c 51 22	  jmp ($2251)
$06:d7d9  ce 89 b5	  dec $b589
$06:d7dc  83 5a		 sta $5a,s
$06:d7de  09 88 70	  ora #$7088
$06:d7e1  04 f8		 tsb $f8
$06:d7e3  04 f8		 tsb $f8
$06:d7e5  04 fb		 tsb $fb
$06:d7e7  00 ff		 brk #$ff
$06:d7e9  88			dey
$06:d7ea  37 80		 and [$80],y
$06:d7ec  4f 08 e7 53   eor $53e708
$06:d7f0  21 aa		 and ($aa,x)
$06:d7f2  82 a9 ec	  brl $c49e
$06:d7f5  58			cli
$06:d7f6  78			sei
$06:d7f7  32 94		 and ($94)
$06:d7f9  fb			xce
$06:d7fa  96 d6		 stx $d6,y
$06:d7fc  40			rti
$06:d7fd  55 29		 eor $29,x
$06:d7ff  fe 00 7d	  inc $7d00,x
$06:d802  00 93		 brk #$93
$06:d804  00 49		 brk #$49
$06:d806  86 10		 stx $10
$06:d808  cf 10 cf 40   cmp $40cf10
$06:d80c  bf 01 fe 15   lda $15fe01,x
$06:d810  27 d9		 and [$d9]
$06:d812  91 19		 sta ($19),y
$06:d814  08			php
$06:d815  ad 94 01	  lda $0194
$06:d818  42 fe		 wdm #$fe
$06:d81a  b9 b5 83	  lda $83b5,y
$06:d81d  5a			phy
$06:d81e  09 f8 00	  ora #$00f8
$06:d821  6e 00 f4	  ror $f400
$06:d824  02 7c		 cop #$7c
$06:d826  03 30		 ora $30,s
$06:d828  8f 88 07 80   sta $800788
$06:d82c  4f 08 e7 a8   eor $a8e708
$06:d830  68			pla
$06:d831  e9 61 11	  sbc #$1161
$06:d834  f0 a5		 beq $d7db
$06:d836  6d d5 37	  adc $37d5
$06:d839  66 be		 ror $be
$06:d83b  9c 78 a0	  stz $a078
$06:d83e  60			rts
$06:d83f  17 00		 ora [$00],y
$06:d841  1e 00 0f	  asl $0f00,x
$06:d844  00 12		 brk #$12
$06:d846  00 08		 brk #$08
$06:d848  00 01		 brk #$01
$06:d84a  00 07		 brk #$07
$06:d84c  00 1f		 brk #$1f
$06:d84e  00 8a		 brk #$8a
$06:d850  77 b4		 adc [$b4],y
$06:d852  cf 73 2f 95   cmp $952f73
$06:d856  ac 66 dc	  ldy $dc66
$06:d859  7b			tdc
$06:d85a  9b			txy
$06:d85b  a4 d7		 ldy $d7
$06:d85d  09 ff 00	  ora #$00ff
$06:d860  0f 00 1f c0   ora $c01f00
$06:d864  1f 43 1f 03   ora $031f43,x
$06:d868  3f 04 3f 08   and $083f04,x
$06:d86c  3f 00 7f 6b   and $6b7f00,x
$06:d870  e1 a9		 sbc ($a9,x)
$06:d872  8b			phb
$06:d873  25 43		 and $43
$06:d875  96 03		 stx $03,y
$06:d877  6a			ror a
$06:d878  67 8d		 adc [$8d]
$06:d87a  c6 23		 dec $23
$06:d87c  2c b4 fa	  bit $fab4
$06:d87f  1f ff 77 ff   ora $ff77ff,x
$06:d883  ff ff ff ff   sbc $ffffff,x
$06:d887  9f ff 3f ff   sta $ff3fff,x
$06:d88b  df ff 0f ff   cmp $ff0fff,x
$06:d88f  ab			plb
$06:d890  f7 65		 sbc [$65],y
$06:d892  fb			xce
$06:d893  b4 79		 ldy $79,x
$06:d895  11 fd		 ora ($fd),y
$06:d897  c6 1c		 dec $1c
$06:d899  33 2e		 and ($2e,s),y
$06:d89b  4c 53 d2	  jmp $d253
$06:d89e  c1 ff		 cmp ($ff,x)
$06:d8a0  ff ff ff ff   sbc $ffffff,x
$06:d8a4  ff fe ff ff   sbc $fffffe,x
$06:d8a8  ff df ff bf   sbc $bfffdf,x
$06:d8ac  ff 3f ff 90   sbc $90ff3f,x
$06:d8b0  0f 4a 9d 51   ora $519d4a
$06:d8b4  e7 84		 sbc [$84]
$06:d8b6  65 5c		 adc $5c
$06:d8b8  2f 23 93 be   and $be9323
$06:d8bc  c3 c8		 cmp $c8,s
$06:d8be  e5 f0		 sbc $f0
$06:d8c0  f8			sed
$06:d8c1  f0 f8		 beq $d8bb
$06:d8c3  f8			sed
$06:d8c4  fc fa fc	  jsr ($fcfa,x)
$06:d8c7  f0 fe		 beq $d8c7
$06:d8c9  fc fe fc	  jsr ($fcfe,x)
$06:d8cc  ff fe ff 56   sbc $56fffe,x
$06:d8d0  fc 05 fd	  jsr ($fd05,x)
$06:d8d3  c2 7b		 rep #$7b
$06:d8d5  4c 3f e9	  jmp $e93f
$06:d8d8  3f f8 1f 96   and $961ff8,x
$06:d8dc  0f b6 41 03   ora $0341b6
$06:d8e0  00 02		 brk #$02
$06:d8e2  00 04		 brk #$04
$06:d8e4  00 00		 brk #$00
$06:d8e6  80 00		 bra $d8e8
$06:d8e8  80 00		 bra $d8ea
$06:d8ea  c0 00 e0	  cpy #$e000
$06:d8ed  00 e8		 brk #$e8
$06:d8ef  d3 cc		 cmp ($cc,s),y
$06:d8f1  2d e1 56	  and $56e1
$06:d8f4  f3 25		 sbc ($25,s),y
$06:d8f6  e6 56		 inc $56
$06:d8f8  d9 4f f0	  cmp $f04f,y
$06:d8fb  1c e6 f9	  trb $f9e6
$06:d8fe  06 3e		 asl $3e
$06:d900  00 1e		 brk #$1e
$06:d902  00 0c		 brk #$0c
$06:d904  00 18		 brk #$18
$06:d906  01 20		 ora ($20,x)
$06:d908  03 00		 ora $00,s
$06:d90a  07 00		 ora [$00]
$06:d90c  0f 80 9f 2b   ora $2b9f80
$06:d910  2b			pld
$06:d911  cd 4d d6	  cmp $d64d
$06:d914  f7 a5		 sbc [$a5],y
$06:d916  a5 5c		 lda $5c
$06:d918  9f f3 fc 2f   sta $2ffcf3,x
$06:d91c  70 af		 bvs $d8cd
$06:d91e  b0 d4		 bcs $d8f4
$06:d920  00 b2		 brk #$b2
$06:d922  00 08		 brk #$08
$06:d924  00 5a		 brk #$5a
$06:d926  00 60		 brk #$60
$06:d928  00 00		 brk #$00
$06:d92a  00 80		 brk #$80
$06:d92c  00 40		 brk #$40
$06:d92e  00 94		 brk #$94
$06:d930  e0 52 a1	  cpx #$a152
$06:d933  a9 c0 26	  lda #$26c0
$06:d936  c1 6b		 cmp ($6b,x)
$06:d938  80 ca		 bra $d904
$06:d93a  00 f6		 brk #$f6
$06:d93c  01 e2		 ora ($e2,x)
$06:d93e  00 0f		 brk #$0f
$06:d940  0f 0f 0f 1f   ora $1f0f0f
$06:d944  1f 1f 1f 17   ora $171f1f,x
$06:d948  17 3d		 ora [$3d],y
$06:d94a  3d 2f 2f	  and $2f2f,x
$06:d94d  1f 1f 69 b3   ora $b3691f,x
$06:d951  93 eb		 sta ($eb,s),y
$06:d953  b1 5b		 lda ($5b),y
$06:d955  ca			dex
$06:d956  f2 7d		 sbc ($7d)
$06:d958  a1 a1		 lda ($a1,x)
$06:d95a  19 ad f1	  ora $f1ad,y
$06:d95d  35 c9		 and $c9,x
$06:d95f  fc fc fc	  jsr ($fcfc,x)
$06:d962  fc fc fc	  jsr ($fcfc,x)
$06:d965  fd fc fe	  sbc $fefc,x
$06:d968  fe fe fe	  inc $fefe,x
$06:d96b  fe fe fe	  inc $fefe,x
$06:d96e  fe fb d2	  inc $d2fb,x
$06:d971  6f 28 de c1   adc $c1de28
$06:d975  fb			xce
$06:d976  4a			lsr a
$06:d977  6f 28 df d2   adc $d2df28
$06:d97b  ab			plb
$06:d97c  01 dd		 ora ($dd,x)
$06:d97e  d4 d2		 pei ($d2)
$06:d980  0c 28 90	  tsb $9028
$06:d983  c0 20 4a	  cpy #$4a20
$06:d986  84 28		 sty $28
$06:d988  d0 d2		 bne $d95c
$06:d98a  20 01 5c	  jsr $5c01
$06:d98d  d4 22		 pei ($22)
$06:d98f  ee ca bd	  inc $bdca
$06:d992  34 57		 bit $57,x
$06:d994  4b			phk
$06:d995  ab			plb
$06:d996  49 77 6c	  eor #$6c77
$06:d999  97 53		 sta [$53],y
$06:d99b  3a			dec a
$06:d99c  09 5f 44	  ora #$445f
$06:d99f  cb			wai
$06:d9a0  31 37		 and ($37),y
$06:d9a2  c3 43		 cmp $43,s
$06:d9a4  bc 09 f6	  ldy $f609,x
$06:d9a7  65 99		 adc $99
$06:d9a9  13 ec		 ora ($ec,s),y
$06:d9ab  0b			phd
$06:d9ac  e7 45		 sbc [$45]
$06:d9ae  a1 fb		 lda ($fb,x)
$06:d9b0  79 b4 04	  adc $04b4,y
$06:d9b3  6a			ror a
$06:d9b4  64 7a		 stz $7a
$06:d9b6  b9 ca d2	  lda $d2ca,y
$06:d9b9  aa			tax
$06:d9ba  89 f2 74	  bit #$74f2
$06:d9bd  ea			nop
$06:d9be  c2 79		 rep #$79
$06:d9c0  06 84		 asl $84
$06:d9c2  fb			xce
$06:d9c3  e0 9f f8	  cpx #$f89f
$06:d9c6  c7 c2		 cmp [$c2]
$06:d9c8  3d 88 77	  and $7788,x
$06:d9cb  f0 8f		 beq $d95c
$06:d9cd  c2 1d		 rep #$1d
$06:d9cf  55 25		 eor $25,x
$06:d9d1  2a			rol a
$06:d9d2  42 82		 wdm #$82
$06:d9d4  91 4f		 sta ($4f),y
$06:d9d6  48			pha
$06:d9d7  e5 a9		 sbc $a9
$06:d9d9  52 4c		 eor ($4c)
$06:d9db  ac 21 53	  ldy $5321
$06:d9de  d0 fa		 bne $d9da
$06:d9e0  00 fd		 brk #$fd
$06:d9e2  00 7f		 brk #$7f
$06:d9e4  00 b7		 brk #$b7
$06:d9e6  00 5e		 brk #$5e
$06:d9e8  00 bf		 brk #$bf
$06:d9ea  00 df		 brk #$df
$06:d9ec  00 af		 brk #$af
$06:d9ee  00 7e		 brk #$7e
$06:d9f0  81 42		 sta ($42,x)
$06:d9f2  ff d5 5b dc   sbc $dc5bd5,x
$06:d9f6  5d 65 d5	  eor $d565,x
$06:d9f9  83 19		 sta $19,s
$06:d9fb  69 db 09	  adc #$09db
$06:d9fe  bb			tyx
$06:d9ff  00 00		 brk #$00
$06:da01  00 00		 brk #$00
$06:da03  20 00 23	  jsr $2300
$06:da06  00 2b		 brk #$2b
$06:da08  00 67		 brk #$67
$06:da0a  00 27		 brk #$27
$06:da0c  00 67		 brk #$67
$06:da0e  00 4b		 brk #$4b
$06:da10  98			tya
$06:da11  ab			plb
$06:da12  32 29		 and ($29)
$06:da14  4c ab 25	  jmp $25ab
$06:da17  58			cli
$06:da18  ea			nop
$06:da19  11 f5		 ora ($f5),y
$06:da1b  29 7a 92	  and #$927a
$06:da1e  3d 00 e7	  and $e700,x
$06:da21  1c c1 3f	  trb $3fc1
$06:da24  81 5e		 sta ($5e,x)
$06:da26  00 17		 brk #$17
$06:da28  00 0e		 brk #$0e
$06:da2a  00 04		 brk #$04
$06:da2c  81 00		 sta ($00,x)
$06:da2e  c3 b8		 cmp $b8,s
$06:da30  e8			inx
$06:da31  48			pha
$06:da32  e8			inx
$06:da33  72 fa		 adc ($fa)
$06:da35  f4 5c 1a	  pea $1a5c
$06:da38  cc 6d ed	  cpy $ed6d
$06:da3b  ae 7f c0	  ldx $c07f
$06:da3e  3f 17 00 17   and $170017,x
$06:da42  00 05		 brk #$05
$06:da44  00 23		 brk #$23
$06:da46  00 33		 brk #$33
$06:da48  00 12		 brk #$12
$06:da4a  00 00		 brk #$00
$06:da4c  00 00		 brk #$00
$06:da4e  00 55		 brk #$55
$06:da50  bb			tyx
$06:da51  5c a3 aa 57   jml $57aaa3
$06:da55  ab			plb
$06:da56  74 df		 stz $df,x
$06:da58  60			rts
$06:da59  15 ea		 ora $ea,x
$06:da5b  56 ad		 lsr $ad,x
$06:da5d  a8			tay
$06:da5e  df 00 7f 00   cmp $007f00,x
$06:da62  7f 00 ff 00   adc $00ff00,x
$06:da66  ff 00 ff 00   sbc $00ff00,x
$06:da6a  7f 00 7f 00   adc $007f00,x
$06:da6e  3f 65 e9 2a   and $2ae965,x
$06:da72  e0 b5 69	  cpx #$69b5
$06:da75  b9 61 0e	  lda $0e61,y
$06:da78  c8			iny
$06:da79  55 d4		 eor $d4,x
$06:da7b  ee fe 19	  inc $19fe
$06:da7e  b8			clv
$06:da7f  1e ff 1f	  asl $1fff,x
$06:da82  ff 1e ff 1e   sbc $1eff1e,x
$06:da86  ff 37 ff 2b   sbc $2bff37,x
$06:da8a  ff 01 ff 47   sbc $47ff01,x
$06:da8e  ff ab a8 bd   sbc $bda8ab,x
$06:da92  fc 4c ec	  jsr ($ec4c,x)
$06:da95  b3 9b		 lda ($9b,s),y
$06:da97  52 3e		 eor ($3e)
$06:da99  65 8c		 adc $8c
$06:da9b  9b			txy
$06:da9c  6f 45 37 57   adc $573745
$06:daa0  ff 03 ff 13   sbc $13ff03,x
$06:daa4  ff 64 ff e1   sbc $e1ff64,x
$06:daa8  ff f3 ff f0   sbc $f0fff3,x
$06:daac  ff f8 ff 03   sbc $03fff8,x
$06:dab0  e5 7c		 sbc $7c
$06:dab2  aa			tax
$06:dab3  c2 30		 rep #$30
$06:dab5  a9 15 e6	  lda #$e615
$06:dab8  13 1a		 ora ($1a,s),y
$06:daba  4b			phk
$06:dabb  44 07 b8	  mvp $b8,$07
$06:dabe  aa			tax
$06:dabf  fe ff f7	  inc $f7ff,x
$06:dac2  ff ff ff fe   sbc $feffff,x
$06:dac6  ff fc ff f4   sbc $f4fffc,x
$06:daca  ff f8 ff 55   sbc $55fff8,x
$06:dace  fe 5d cc	  inc $cc5d,x
$06:dad1  3d e8 72	  and $72e8,x
$06:dad4  55 e3		 eor $e3,x
$06:dad6  a9 d8 c3	  lda #$c3d8
$06:dad9  e6 61		 inc $61
$06:dadb  b0 b3		 bcs $da90
$06:dadd  ed eb 34	  sbc $34eb
$06:dae0  03 08		 ora $08,s
$06:dae2  07 90		 ora [$90]
$06:dae4  0f 20 1f 40   ora $401f20
$06:dae8  3f 60 1f b0   and $b01f60,x
$06:daec  4f e8 17 92   eor $9217e8
$06:daf0  1b			tcs
$06:daf1  4b			phk
$06:daf2  8f 94 c6 d7   sta $d7c694
$06:daf6  e7 cb		 sbc [$cb]
$06:daf8  f3 f6		 sbc ($f6,s),y
$06:dafa  eb			xba
$06:dafb  29 71 97	  and #$9771
$06:dafe  3b			tsc
$06:daff  14 e0		 trb $e0
$06:db01  08			php
$06:db02  f0 05		 beq $db09
$06:db04  f8			sed
$06:db05  06 f8		 asl $f8
$06:db07  02 fc		 cop #$fc
$06:db09  02 fc		 cop #$fc
$06:db0b  01 fe		 ora ($fe,x)
$06:db0d  03 fc		 ora $fc,s
$06:db0f  5f 60 df 60   eor $60df60,x
$06:db13  5f 60 6f 70   eor $706f60,x
$06:db17  cf b0 33 3c   cmp $3c33b0
$06:db1b  dc 4f 92	  jml [$924f]
$06:db1e  db			stp
$06:db1f  80 00		 bra $db21
$06:db21  80 00		 bra $db23
$06:db23  80 00		 bra $db25
$06:db25  80 00		 bra $db27
$06:db27  40			rti
$06:db28  00 c0		 brk #$c0
$06:db2a  00 b0		 brk #$b0
$06:db2c  00 24		 brk #$24
$06:db2e  00 d1		 brk #$d1
$06:db30  00 aa		 brk #$aa
$06:db32  05 97		 ora $97
$06:db34  00 e0		 brk #$e0
$06:db36  00 d5		 brk #$d5
$06:db38  08			php
$06:db39  ee 01 73	  inc $7301
$06:db3c  80 b8		 bra $daf6
$06:db3e  c0 3e 3e	  cpy #$3e3e
$06:db41  5f 5f 6f 6f   eor $6f6f5f,x
$06:db45  3f 3f 3f 3f   and $3f3f3f,x
$06:db49  1f 1f 0f 0f   ora $0f0f1f,x
$06:db4d  07 07		 ora [$07]
$06:db4f  d5 39		 cmp $39,x
$06:db51  aa			tax
$06:db52  f4 b2 4c	  pea $4cb2
$06:db55  cc 38 6d	  cpy $6d38
$06:db58  f1 59		 sbc ($59),y
$06:db5a  a1 b3		 lda ($b3,x)
$06:db5c  03 0e		 ora $0e,s
$06:db5e  0c fe fe	  tsb $fefe
$06:db61  ff ff ff ff   sbc $ffffff,x
$06:db65  ff ff fe fe   sbc $fefeff,x
$06:db69  fe fe fc	  inc $fcfe,x
$06:db6c  fc f3 f0	  jsr ($f0f3,x)
$06:db6f  af 0b df 84   lda $84df0b
$06:db73  65 20		 adc $20
$06:db75  de d2 7f	  dec $7fd2,x
$06:db78  68			pla
$06:db79  ed a1 96	  sbc $96a1
$06:db7c  a4 55		 ldy $55
$06:db7e  11 0b		 ora ($0b),y
$06:db80  70 84		 bvs $db06
$06:db82  60			rts
$06:db83  20 9e d2	  jsr $d29e
$06:db86  21 68		 and ($68,x)
$06:db88  80 a1		 bra $db2b
$06:db8a  1e 84 79	  asl $7984,x
$06:db8d  11 ee		 ora ($ee),y
$06:db8f  fb			xce
$06:db90  72 6e		 adc ($6e)
$06:db92  29 bd b4	  and #$b4bd
$06:db95  56 44		 lsr $44,x
$06:db97  ae 09 8b	  ldx $8b09
$06:db9a  42 25		 wdm #$25
$06:db9c  15 d3		 ora $d3,x
$06:db9e  89 72 8c	  bit #$8c72
$06:dba1  2b			pld
$06:dba2  93 b7		 sta ($b7,s),y
$06:dba4  43 45		 eor $45,s
$06:dba6  b9 0b f3	  lda $f30b,y
$06:dba9  03 fd		 ora $fd,s
$06:dbab  05 fa		 ora $fa
$06:dbad  81 7e		 sta ($7e,x)
$06:dbaf  f6 95		 inc $95,x
$06:dbb1  5e 88 3a	  lsr $3a88,x
$06:dbb4  12 fd		 ora ($fd)
$06:dbb6  2c 6a 22	  bit $226a
$06:dbb9  e5 45		 sbc $45
$06:dbbb  3a			dec a
$06:dbbc  29 fe d6	  and #$d6fe
$06:dbbf  94 0b		 sty $0b,x
$06:dbc1  e8			inx
$06:dbc2  e7 d2		 sbc [$d2]
$06:dbc4  cd 2c 03	  cmp $032c
$06:dbc7  e2 dd		 sep #$dd
$06:dbc9  c5 ba		 cmp $ba
$06:dbcb  a8			tay
$06:dbcc  c7 d6		 cmp [$d6]
$06:dbce  01 15		 ora ($15,x)
$06:dbd0  25 d2		 and $d2
$06:dbd2  90 69		 bcc $dc3d
$06:dbd4  64 86		 stz $86
$06:dbd6  99 bc 00	  sta $00bc,y
$06:dbd9  43 0a		 eor $0a,s
$06:dbdb  ed 4a 18	  sbc $184a
$06:dbde  10 fa		 bpl $dbda
$06:dbe0  00 6f		 brk #$6f
$06:dbe2  00 9f		 brk #$9f
$06:dbe4  00 7f		 brk #$7f
$06:dbe6  00 ff		 brk #$ff
$06:dbe8  00 fd		 brk #$fd
$06:dbea  00 b7		 brk #$b7
$06:dbec  00 ef		 brk #$ef
$06:dbee  00 97		 brk #$97
$06:dbf0  b3 e2		 lda ($e2,s),y
$06:dbf2  d7 33		 cmp [$33],y
$06:dbf4  96 28		 stx $28,y
$06:dbf6  86 15		 stx $15
$06:dbf8  90 2d		 bcc $dc27
$06:dbfa  9f c2 bd 5d   sta $5dbdc2,x
$06:dbfe  5c 6f 00 2f   jml $2f006f
$06:dc02  00 6f		 brk #$6f
$06:dc04  00 7f		 brk #$7f
$06:dc06  00 6f		 brk #$6f
$06:dc08  00 7f		 brk #$7f
$06:dc0a  00 7f		 brk #$7f
$06:dc0c  00 a3		 brk #$a3
$06:dc0e  00 9a		 brk #$9a
$06:dc10  c1 66		 cmp ($66,x)
$06:dc12  98			tya
$06:dc13  94 38		 sty $38,x
$06:dc15  69 90 95	  adc #$9590
$06:dc18  c0 2e		 cpy #$2e
$06:dc1a  c0 6b		 cpy #$6b
$06:dc1c  04 54		 tsb $54
$06:dc1e  e0 00		 cpx #$00
$06:dc20  ff 00 fd 00   sbc $00fd00,x
$06:dc24  ff 00 ff 00   sbc $00ff00,x
$06:dc28  ff 00 ff 00   sbc $00ff00,x
$06:dc2c  fe 00 ff	  inc $ff00,x
$06:dc2f  72 f3		 adc ($f3)
$06:dc31  ab			plb
$06:dc32  e3 4c		 sbc $4c,s
$06:dc34  7e d7 ff	  ror $ffd7,x
$06:dc37  29 f5 54	  and #$54f5
$06:dc3a  b6 a8		 ldx $a8,y
$06:dc3c  ff 4a f6 0c   sbc $0cf64a,x
$06:dc40  00 1c		 brk #$1c
$06:dc42  00 81		 brk #$81
$06:dc44  00 00		 brk #$00
$06:dc46  00 02		 brk #$02
$06:dc48  00 09		 brk #$09
$06:dc4a  00 00		 brk #$00
$06:dc4c  00 01		 brk #$01
$06:dc4e  00 ad		 brk #$ad
$06:dc50  5a			phy
$06:dc51  b2 cd		 lda ($cd)
$06:dc53  76 2d		 ror $2d,x
$06:dc55  8b			phb
$06:dc56  94 56		 sty $56,x
$06:dc58  f9 d5 b1	  sbc $b1d5,y
$06:dc5b  55 5e		 eor $5e,x
$06:dc5d  ac bc 00	  ldy $00bc
$06:dc60  3f 00 1f c0   and $c01f00,x
$06:dc64  1f 60 0f 00   ora $000f60,x
$06:dc68  07 0e		 ora [$0e]
$06:dc6a  00 a0		 brk #$a0
$06:dc6c  00 43		 brk #$43
$06:dc6e  00 6f		 brk #$6f
$06:dc70  ed a7 ff	  sbc $ffa7
$06:dc73  3d af 48	  and $48af,x
$06:dc76  ff 92 7d 45   sbc $457d92,x
$06:dc7a  be 12 ed	  ldx $ed12,y
$06:dc7d  a3 fe		 lda $fe,s
$06:dc7f  12 ff		 ora ($ff)
$06:dc81  00 ff		 brk #$ff
$06:dc83  40			rti
$06:dc84  ff 00 ff 00   sbc $00ff00,x
$06:dc88  ff 00 ff 00   sbc $00ff00,x
$06:dc8c  1f 00 01 dc   ora $dc0100,x
$06:dc90  25 62		 and $62
$06:dc92  0b			phd
$06:dc93  17 53		 ora [$53],y
$06:dc95  c9 9b a6	  cmp #$a69b
$06:dc98  ad 54 ff	  lda $ff54
$06:dc9b  6d da 1a	  adc $1ada
$06:dc9e  e6 fa		 inc $fa
$06:dca0  ff fc ff ec   sbc $ecfffc,x
$06:dca4  ff 64 ff 50   sbc $50ff64,x
$06:dca8  ff 00 ff 00   sbc $00ff00,x
$06:dcac  fe 01 f8	  inc $f801,x
$06:dcaf  ac ef 5a	  ldy $5aef
$06:dcb2  bd 95 5b	  lda $5b95,x
$06:dcb5  44 fd 11	  mvp $11,$fd
$06:dcb8  ff ec 75 09   sbc $0975ec,x
$06:dcbc  fb			xce
$06:dcbd  9a			txs
$06:dcbe  de 10 fc	  dec $fc10,x
$06:dcc1  00 fc		 brk #$fc
$06:dcc3  20 f8 02	  jsr $02f8
$06:dcc6  f0 00		 beq $dcc8
$06:dcc8  e0 02		 cpx #$02
$06:dcca  80 04		 bra $dcd0
$06:dccc  00 21		 brk #$21
$06:dcce  00 f2		 brk #$f2
$06:dcd0  f5 ad		 sbc $ad,x
$06:dcd2  a0 b9		 ldy #$b9
$06:dcd4  32 d6		 and ($d6)
$06:dcd6  94 78		 sty $78,x
$06:dcd8  b8			clv
$06:dcd9  6d 85 b3	  adc $b385
$06:dcdc  e2 4e		 sep #$4e
$06:dcde  f2 f0		 sbc ($f0)
$06:dce0  0f a0 5f 30   ora $305fa0
$06:dce4  4f 14 2b 38   eor $382b14
$06:dce8  07 05		 ora [$05]
$06:dcea  1a			inc a
$06:dceb  02 0d		 cop #$0d
$06:dced  02 01		 cop #$01
$06:dcef  55 a8		 eor $a8,x
$06:dcf1  c9 e5 57	  cmp #$57e5
$06:dcf4  e3 a2		 sbc $a2,s
$06:dcf6  53 57		 eor ($57,s),y
$06:dcf8  85 ac		 sta $ac
$06:dcfa  28			plp
$06:dcfb  52 49		 eor ($49)
$06:dcfd  6c 7c 00	  jmp ($007c)
$06:dd00  fe 01 fe	  inc $fe01,x
$06:dd03  03 fc		 ora $fc,s
$06:dd05  02 fc		 cop #$fc
$06:dd07  04 f8		 tsb $f8
$06:dd09  2b			pld
$06:dd0a  d0 47		 bne $dd53
$06:dd0c  a0 63		 ldy #$63
$06:dd0e  80 fb		 bra $dd0b
$06:dd10  79 b4 84	  adc $84b4,y
$06:dd13  ea			nop
$06:dd14  64 7a		 stz $7a
$06:dd16  39 ca d2	  and $d2ca,y
$06:dd19  aa			tax
$06:dd1a  89 b2 b4	  bit #$b4b2
$06:dd1d  ea			nop
$06:dd1e  42 79		 wdm #$79
$06:dd20  06 84		 asl $84
$06:dd22  7b			tdc
$06:dd23  60			rts
$06:dd24  1f 38 87 c2   ora $c28738,x
$06:dd28  3d 88 77	  and $7788,x
$06:dd2b  b0 4f		 bcs $dd7c
$06:dd2d  42 1d		 wdm #$1d
$06:dd2f  ef 4b bd a5   sbc $a5bd4b
$06:dd33  9b			txy
$06:dd34  9a			txs
$06:dd35  a4 04		 ldy $04
$06:dd37  9b			txy
$06:dd38  53 2d		 eor ($2d,s),y
$06:dd3a  05 d7		 ora $d7
$06:dd3c  c5 aa		 cmp $aa
$06:dd3e  40			rti
$06:dd3f  4b			phk
$06:dd40  30 a5		 bmi $dce7
$06:dd42  42 9a		 wdm #$9a
$06:dd44  65 04		 adc $04
$06:dd46  fb			xce
$06:dd47  13 ec		 ora ($ec,s),y
$06:dd49  05 fa		 ora $fa
$06:dd4b  c5 3a		 cmp $3a
$06:dd4d  00 ff		 brk #$ff
$06:dd4f  fb			xce
$06:dd50  52 ed		 eor ($ed)
$06:dd52  ad ff ab	  lda $abff
$06:dd55  6a			ror a
$06:dd56  4a			lsr a
$06:dd57  ff 6c 62 64   sbc $64626c,x
$06:dd5b  a5 a9		 lda $a9
$06:dd5d  ca			dex
$06:dd5e  91 52		 sta ($52),y
$06:dd60  0c ad 12	  tsb $12ad
$06:dd63  ab			plb
$06:dd64  04 4a		 tsb $4a
$06:dd66  95 6c		 sta $6c,x
$06:dd68  93 60		 sta ($60,s),y
$06:dd6a  9f a1 5e 80   sta $805ea1,x
$06:dd6e  7f ef cb bf   adc $bfcbef,x
$06:dd72  34 57		 bit $57,x
$06:dd74  4b			phk
$06:dd75  ab			plb
$06:dd76  49 76 6e	  eor #$6e76
$06:dd79  97 51		 sta [$51],y
$06:dd7b  3b			tsc
$06:dd7c  0a			asl a
$06:dd7d  5f 45 cb 30   eor $30cb45,x
$06:dd81  34 c0		 bit $c0,x
$06:dd83  43 bc		 eor $bc,s
$06:dd85  09 f6 66	  ora #$66f6
$06:dd88  99 11 ec	  sta $ec11,y
$06:dd8b  0a			asl a
$06:dd8c  e4 45		 cpx $45
$06:dd8e  a0 ed		 ldy #$ed
$06:dd90  60			rts
$06:dd91  f8			sed
$06:dd92  fb			xce
$06:dd93  b2 84		 lda ($84)
$06:dd95  64 6a		 stz $6a
$06:dd97  c8			iny
$06:dd98  92 f2		 sta ($f2)
$06:dd9a  4a			lsr a
$06:dd9b  28			plp
$06:dd9c  0a			asl a
$06:dd9d  c3 a9		 cmp $a9,s
$06:dd9f  60			rts
$06:dda0  1f f8 07 80   ora $8007f8,x
$06:dda4  7f 60 9f 80   adc $809f60,x
$06:dda8  7f 40 bf 00   adc $00bf40,x
$06:ddac  ff 81 7e eb   sbc $eb7e81,x
$06:ddb0  eb			xba
$06:ddb1  b5 91		 lda $91,x
$06:ddb3  5b			tcd
$06:ddb4  09 ef 25	  ora #$25ef
$06:ddb7  25 ad		 and $ad
$06:ddb9  be 36 57	  ldx $5736,y
$06:ddbc  75 ee		 adc $ee,x
$06:ddbe  da			phx
$06:ddbf  eb			xba
$06:ddc0  14 91		 trb $91
$06:ddc2  6e 09 f6	  ror $f609
$06:ddc5  25 da		 and $da
$06:ddc7  25 da		 and $da
$06:ddc9  36 c9		 rol $c9,x
$06:ddcb  55 88		 eor $88,x
$06:ddcd  8a			txa
$06:ddce  01 49		 ora ($49,x)
$06:ddd0  52 96		 eor ($96)
$06:ddd2  d2 e0		 cmp ($e0)
$06:ddd4  b6 b6		 ldx $b6,y
$06:ddd6  a4 79		 ldy $79
$06:ddd8  ec af aa	  cpx $aaaf
$06:dddb  4a			lsr a
$06:dddc  02 b5		 cop #$b5
$06:ddde  97 00		 sta [$00],y
$06:dde0  ff 80 7f a0   sbc $a07f80,x
$06:dde4  5f 20 5f 68   eor $685f20,x
$06:dde8  17 ba		 ora [$ba],y
$06:ddea  55 02		 eor $02,x
$06:ddec  f5 95		 sbc $95,x
$06:ddee  68			pla
$06:ddef  7c 50 01	  jmp ($0150,x)
$06:ddf2  04 be		 tsb $be
$06:ddf4  68			pla
$06:ddf5  31 13		 and ($13),y
$06:ddf7  9c 56 46	  stz $4656
$06:ddfa  24 3d		 bit $3d
$06:ddfc  0d 9f 4a	  ora $4a9f
$06:ddff  50 af		 bvc $ddb0
$06:de01  00 ff		 brk #$ff
$06:de03  28			plp
$06:de04  d7 11		 cmp [$11],y
$06:de06  ee 14 eb	  inc $eb14
$06:de09  04 fb		 tsb $fb
$06:de0b  0d f2 0a	  ora $0af2
$06:de0e  f0 b9		 beq $ddc9
$06:de10  c0 67		 cpy #$67
$06:de12  98			tya
$06:de13  94 38		 sty $38,x
$06:de15  6b			rtl
$06:de16  90 95		 bcc $ddad
$06:de18  c0 26		 cpy #$26
$06:de1a  c8			iny
$06:de1b  75 0e		 adc $0e,x
$06:de1d  4a			lsr a
$06:de1e  e4 00		 cpx $00
$06:de20  ff 00 fd 00   sbc $00fd00,x
$06:de24  ff 00 fd 00   sbc $00fd00,x
$06:de28  ff 00 ff 00   sbc $00ff00,x
$06:de2c  fe 00 ff	  inc $ff00,x
$06:de2f  62 e2 96	  per $7514
$06:de32  74 57		 stz $57,x
$06:de34  de 71 df	  dec $df71,x
$06:de37  a9 f9 6a	  lda #$6af9
$06:de3a  e4 95		 cpx $95
$06:de3c  34 69		 bit $69,x
$06:de3e  df 1d 00 0b   cmp $0b001d,x
$06:de42  00 21		 brk #$21
$06:de44  00 20		 brk #$20
$06:de46  00 06		 brk #$06
$06:de48  00 1f		 brk #$1f
$06:de4a  00 4b		 brk #$4b
$06:de4c  00 00		 brk #$00
$06:de4e  00 59		 brk #$59
$06:de50  be a6 bf	  ldx $bfa6,y
$06:de53  51 14		 eor ($14),y
$06:de55  85 2d		 sta $2d
$06:de57  b2 fe		 lda ($fe)
$06:de59  4d 7c a5	  eor $a57c
$06:de5c  62 d0 c8	  per $a72f
$06:de5f  00 00		 brk #$00
$06:de61  40			rti
$06:de62  00 eb		 brk #$eb
$06:de64  00 d2		 brk #$d2
$06:de66  00 01		 brk #$01
$06:de68  00 83		 brk #$83
$06:de6a  00 9f		 brk #$9f
$06:de6c  00 3f		 brk #$3f
$06:de6e  00 2a		 brk #$2a
$06:de70  f7 95		 sbc [$95],y
$06:de72  b7 b9		 lda [$b9],y
$06:de74  ec 5a 79	  cpx $795a
$06:de77  a4 f4		 ldy $f4
$06:de79  5a			phy
$06:de7a  78			sei
$06:de7b  a5 b0		 lda $b0
$06:de7d  da			phx
$06:de7e  59 00 00	  eor $0000,y
$06:de81  48			pha
$06:de82  00 13		 brk #$13
$06:de84  00 87		 brk #$87
$06:de86  00 0b		 brk #$0b
$06:de88  00 87		 brk #$87
$06:de8a  00 4f		 brk #$4f
$06:de8c  00 a7		 brk #$a7
$06:de8e  00 26		 brk #$26
$06:de90  17 8d		 ora [$8d],y
$06:de92  86 aa		 stx $aa
$06:de94  ef 5a 7b a5   sbc $a57b5a
$06:de98  f7 5a		 sbc [$5a],y
$06:de9a  7b			tdc
$06:de9b  a5 b0		 lda $b0
$06:de9d  da			phx
$06:de9e  5b			tcd
$06:de9f  f8			sed
$06:dea0  00 78		 brk #$78
$06:dea2  00 10		 brk #$10
$06:dea4  00 84		 brk #$84
$06:dea6  00 08		 brk #$08
$06:dea8  00 84		 brk #$84
$06:deaa  00 4e		 brk #$4e
$06:deac  00 a4		 brk #$a4
$06:deae  00 2a		 brk #$2a
$06:deb0  f7 95		 sbc [$95],y
$06:deb2  b6 ba		 ldx $ba,y
$06:deb4  ef 5a 7b a5   sbc $a57b5a
$06:deb8  f7 5a		 sbc [$5a],y
$06:deba  7b			tdc
$06:debb  a5 b0		 lda $b0
$06:debd  da			phx
$06:debe  5b			tcd
$06:debf  00 00		 brk #$00
$06:dec1  48			pha
$06:dec2  00 10		 brk #$10
$06:dec4  00 84		 brk #$84
$06:dec6  00 08		 brk #$08
$06:dec8  00 84		 brk #$84
$06:deca  00 4e		 brk #$4e
$06:decc  00 a4		 brk #$a4
$06:dece  00 aa		 brk #$aa
$06:ded0  e2 51		 sep #$51
$06:ded2  ce 24 9b	  dec $9b24
$06:ded5  68			pla
$06:ded6  9f 09 b6 60   sta $60b609,x
$06:deda  df 56 cd 34   cmp $34cd56,x
$06:dede  83 1d		 sta $1d,s
$06:dee0  00 3f		 brk #$3f
$06:dee2  00 7f		 brk #$7f
$06:dee4  00 7f		 brk #$7f
$06:dee6  00 7f		 brk #$7f
$06:dee8  00 3f		 brk #$3f
$06:deea  00 3f		 brk #$3f
$06:deec  00 7f		 brk #$7f
$06:deee  00 4b		 brk #$4b
$06:def0  03 15		 ora $15,s
$06:def2  e9 72 cc	  sbc #$cc72
$06:def5  64 18		 stz $18
$06:def7  83 7d		 sta $7d,s
$06:def9  13 ed		 ora ($ed,s),y
$06:defb  0d f3 04	  ora $04f3
$06:defe  d8			cld
$06:deff  fc 00 fe	  jsr ($fe00,x)
$06:df02  00 ff		 brk #$ff
$06:df04  00 ff		 brk #$ff
$06:df06  00 fe		 brk #$fe
$06:df08  00 fe		 brk #$fe
$06:df0a  00 fe		 brk #$fe
$06:df0c  00 ff		 brk #$ff
$06:df0e  00 f6		 brk #$f6
$06:df10  95 be		 sta $be,x
$06:df12  28			plp
$06:df13  fa			plx
$06:df14  92 fd		 sta ($fd)
$06:df16  2c ea a2	  bit $a2ea
$06:df19  a5 05		 lda $05
$06:df1b  7a			ply
$06:df1c  29 fe d6	  and #$d6fe
$06:df1f  94 0b		 sty $0b,x
$06:df21  28			plp
$06:df22  47 92		 eor [$92]
$06:df24  0d 2c 03	  ora $032c
$06:df27  a2 1d		 ldx #$1d
$06:df29  05 7a		 ora $7a
$06:df2b  28			plp
$06:df2c  c7 d6		 cmp [$d6]
$06:df2e  01 a9		 ora ($a9,x)
$06:df30  7a			ply
$06:df31  9f 94 18 4f   sta $4f1894,x
$06:df35  dd ab 51	  cmp $51ab,x
$06:df38  dc 0e f5	  jml [$f50e]
$06:df3b  55 fc		 eor $fc,x
$06:df3d  a3 a7		 lda $a7,s
$06:df3f  07 00		 ora [$00]
$06:df41  63 00		 adc $00,s
$06:df43  f0 00		 beq $df45
$06:df45  70 00		 bvs $df47
$06:df47  23 00		 and $00,s
$06:df49  03 00		 ora $00,s
$06:df4b  03 00		 ora $00,s
$06:df4d  58			cli
$06:df4e  00 3b		 brk #$3b
$06:df50  5d f9 a3	  eor $a3f9,x
$06:df53  a8			tay
$06:df54  73 86		 adc ($86,s),y
$06:df56  25 26		 and $26
$06:df58  bb			tyx
$06:df59  35 2e		 and $2e,x
$06:df5b  4a			lsr a
$06:df5c  7b			tdc
$06:df5d  97 f1		 sta [$f1],y
$06:df5f  80 00		 bra $df61
$06:df61  1c 00 1c	  trb $1c00
$06:df64  00 d8		 brk #$d8
$06:df66  00 c0		 brk #$c0
$06:df68  00 c0		 brk #$c0
$06:df6a  00 84		 brk #$84
$06:df6c  00 0e		 brk #$0e
$06:df6e  00 fb		 brk #$fb
$06:df70  72 6f		 adc ($6f)
$06:df72  29 bf b4	  and #$b4bf
$06:df75  55 45		 eor $45,x
$06:df77  af 08 8b 42   lda $428b08
$06:df7b  25 15		 and $15
$06:df7d  d3 89		 cmp ($89,s),y
$06:df7f  72 8c		 adc ($8c)
$06:df81  29 90 b4	  and #$b490
$06:df84  40			rti
$06:df85  45 ba		 eor $ba
$06:df87  08			php
$06:df88  f0 02		 beq $df8c
$06:df8a  fc 05 fa	  jsr ($fa05,x)
$06:df8d  81 7e		 sta ($7e,x)
$06:df8f  6d 45 16	  adc $1645
$06:df92  56 dd		 lsr $dd,x
$06:df94  98			tya
$06:df95  be a4 fd	  ldx $fda4,y
$06:df98  c5 fb		 cmp $fb
$06:df9a  13 ef		 ora ($ef,s),y
$06:df9c  49 bf a0	  eor #$a0bf
$06:df9f  05 fa		 ora $fa
$06:dfa1  16 e9		 asl $e9,x
$06:dfa3  98			tya
$06:dfa4  67 a4		 adc [$a4]
$06:dfa6  43 c5		 eor $c5,s
$06:dfa8  02 13		 cop #$13
$06:dfaa  0c 49 30	  tsb $3049
$06:dfad  a0 40		 ldy #$40
$06:dfaf  9c 07 23	  stz $2307
$06:dfb2  51 78		 eor ($78),y
$06:dfb4  02 d5		 cop #$d5
$06:dfb6  af 4a cf 90   lda $90cf4a
$06:dfba  e8			inx
$06:dfbb  e9 ba 67	  sbc #$67ba
$06:dfbe  d0 f8		 bne $dfb8
$06:dfc0  00 fc		 brk #$fc
$06:dfc2  00 fd		 brk #$fd
$06:dfc4  00 70		 brk #$70
$06:dfc6  00 30		 brk #$30
$06:dfc8  00 07		 brk #$07
$06:dfca  00 47		 brk #$47
$06:dfcc  00 0f		 brk #$0f
$06:dfce  00 48		 brk #$48
$06:dfd0  a6 7d		 ldx $7d
$06:dfd2  51 4a		 eor ($4a),y
$06:dfd4  bb			tyx
$06:dfd5  52 6d		 eor ($6d)
$06:dfd7  6b			rtl
$06:dfd8  ba			tsx
$06:dfd9  bc d1 5c	  ldy $5cd1,x
$06:dfdc  71 e8		 adc ($e8),y
$06:dfde  5b			tcd
$06:dfdf  1f 00 8e 00   ora $008e00,x
$06:dfe3  c4 00		 cpy $00
$06:dfe5  80 00		 bra $dfe7
$06:dfe7  04 00		 tsb $00
$06:dfe9  0e 00 8e	  asl $8e00
$06:dfec  00 84		 brk #$84
$06:dfee  00 43		 brk #$43
$06:dff0  a2 1f		 ldx #$1f
$06:dff2  ad af 98	  lda $98af
$06:dff5  dd 89 eb	  cmp $eb89,x
$06:dff8  a9 3f b2	  lda #$b23f
$06:dffb  36 b0		 rol $b0,x
$06:dffd  fd 64 02	  sbc $0264,x
$06:e000  fc 0d f0	  jsr ($f00d,x)
$06:e003  08			php
$06:e004  f0 09		 beq $e00f
$06:e006  f6 29		 inc $29,x
$06:e008  d4 32		 pei ($32)
$06:e00a  c0 30		 cpy #$30
$06:e00c  cd 64 82	  cmp $8264
$06:e00f  9a			txs
$06:e010  c1 65		 cmp ($65,x)
$06:e012  98			tya
$06:e013  9b			txy
$06:e014  3c 64 99	  bit $9964,x
$06:e017  96 c1		 stx $c1,y
$06:e019  09 dc 75	  ora #$75dc
$06:e01c  0e 4a e4	  asl $e44a
$06:e01f  00 ff		 brk #$ff
$06:e021  00 ff		 brk #$ff
$06:e023  00 ff		 brk #$ff
$06:e025  00 ff		 brk #$ff
$06:e027  00 ff		 brk #$ff
$06:e029  00 ff		 brk #$ff
$06:e02b  00 ff		 brk #$ff
$06:e02d  00 ff		 brk #$ff
$06:e02f  a8			tay
$06:e030  c2 56		 rep #$56
$06:e032  cb			wai
$06:e033  ab			plb
$06:e034  25 ed		 and $ed
$06:e036  48			pha
$06:e037  b2 00		 lda ($00)
$06:e039  55 89		 eor $89,x
$06:e03b  f5 b0		 sbc $b0,x
$06:e03d  5f 6d 1d 1c   eor $1c1d6d,x
$06:e041  7e 3c 7f	  ror $7f3c,x
$06:e044  5e 5f 17	  lsr $175f,x
$06:e047  6f 6f 3f 3e   adc $3e3f6f
$06:e04b  3a			dec a
$06:e04c  0a			asl a
$06:e04d  8c 00 62	  sty $6200
$06:e050  e2 56		 sep #$56
$06:e052  74 97		 stz $97,x
$06:e054  5e 71 1f	  lsr $1f71,x
$06:e057  a9 b9 aa	  lda #$aab9
$06:e05a  e4 d5		 cpx $d5
$06:e05c  74 a9		 stz $a9,x
$06:e05e  df 1d 00 8b   cmp $8b001d,x
$06:e062  00 e1		 brk #$e1
$06:e064  00 e0		 brk #$e0
$06:e066  00 46		 brk #$46
$06:e068  00 1f		 brk #$1f
$06:e06a  00 8b		 brk #$8b
$06:e06c  00 00		 brk #$00
$06:e06e  00 05		 brk #$05
$06:e070  2f d3 9f 79   and $799fd3
$06:e074  78			sei
$06:e075  8a			txa
$06:e076  e0 34		 cpx #$34
$06:e078  e8			inx
$06:e079  63 62		 adc $62,s
$06:e07b  d4 72		 pei ($72)
$06:e07d  a6 df		 ldx $df
$06:e07f  f0 00		 beq $e081
$06:e081  60			rts
$06:e082  00 87		 brk #$87
$06:e084  00 1f		 brk #$1f
$06:e086  00 1f		 brk #$1f
$06:e088  00 9d		 brk #$9d
$06:e08a  00 8f		 brk #$8f
$06:e08c  00 00		 brk #$00
$06:e08e  00 04		 brk #$04
$06:e090  2f d3 9d 78   and $789dd3
$06:e094  7b			tdc
$06:e095  8b			phb
$06:e096  e2 34		 sep #$34
$06:e098  e9 61		 sbc #$61
$06:e09a  61 d7		 adc ($d7,x)
$06:e09c  72 b9		 adc ($b9)
$06:e09e  f3 f0		 sbc ($f0,s),y
$06:e0a0  00 60		 brk #$60
$06:e0a2  00 84		 brk #$84
$06:e0a4  00 1c		 brk #$1c
$06:e0a6  00 1e		 brk #$1e
$06:e0a8  00 9e		 brk #$9e
$06:e0aa  00 8c		 brk #$8c
$06:e0ac  00 0c		 brk #$0c
$06:e0ae  00 19		 brk #$19
$06:e0b0  fe e6 bf	  inc $bfe6,x
$06:e0b3  11 d4		 ora ($d4),y
$06:e0b5  c5 6d		 cmp $6d
$06:e0b7  32 be		 and ($be)
$06:e0b9  8d bc e5	  sta $e5bc
$06:e0bc  62 90 c8	  per $a94f
$06:e0bf  00 00		 brk #$00
$06:e0c1  00 00		 brk #$00
$06:e0c3  2b			pld
$06:e0c4  00 12		 brk #$12
$06:e0c6  00 41		 brk #$41
$06:e0c8  00 43		 brk #$43
$06:e0ca  00 1f		 brk #$1f
$06:e0cc  00 3f		 brk #$3f
$06:e0ce  00 62		 brk #$62
$06:e0d0  dc 51 ee	  jml [$ee51]
$06:e0d3  20 9f 7a	  jsr $7a9f
$06:e0d6  cd 55 ca	  cmp $ca55
$06:e0d9  29 c0		 and #$c0
$06:e0db  c2 c2		 rep #$c2
$06:e0dd  52 d0		 eor ($d0)
$06:e0df  3f 00 3f 00   and $003f00,x
$06:e0e3  7f 00 3f 00   adc $003f00,x
$06:e0e7  3f 00 3f 00   and $003f00,x
$06:e0eb  3d 00 2f	  and $2f00,x
$06:e0ee  00 1b		 brk #$1b
$06:e0f0  fd 2b f5	  sbc $f52b,x
$06:e0f3  02 fd		 cop #$fd
$06:e0f5  5d a9 a4	  eor $a4a9,x
$06:e0f8  c9 4a		 cmp #$4a
$06:e0fa  13 91		 ora ($91,s),y
$06:e0fc  01 25		 ora ($25,x)
$06:e0fe  21 fe		 and ($fe,x)
$06:e100  00 fe		 brk #$fe
$06:e102  00 fe		 brk #$fe
$06:e104  00 fe		 brk #$fe
$06:e106  00 fe		 brk #$fe
$06:e108  00 fc		 brk #$fc
$06:e10a  00 fe		 brk #$fe
$06:e10c  00 de		 brk #$de
$06:e10e  00 33		 brk #$33
$06:e110  38			sec
$06:e111  d5 62		 cmp $62,x
$06:e113  28			plp
$06:e114  47 86		 eor [$86]
$06:e116  e8			inx
$06:e117  2d c0 49	  and $49c0
$06:e11a  86 e4		 stx $e4
$06:e11c  03 e3		 ora $e3,s
$06:e11e  00 c7		 brk #$c7
$06:e120  07 8f		 ora [$8f]
$06:e122  0e 9f 1c	  asl $1c9f
$06:e125  1f 18 1f 1c   ora $1c1f18,x
$06:e129  3f 3c 3f 3f   and $3f3f3c,x
$06:e12d  1f 1f 37 d5   ora $d5371f,x
$06:e131  2a			rol a
$06:e132  d2 e1		 cmp ($e1)
$06:e134  3b			tsc
$06:e135  9a			txs
$06:e136  02 25		 cop #$25
$06:e138  99 01 f9	  sta $f901,y
$06:e13b  ad d1 55	  lda $55d1
$06:e13e  89 ea		 bit #$ea
$06:e140  e8			inx
$06:e141  fd 1c dc	  sbc $dc1c,x
$06:e144  0c fd 04	  tsb $04fd
$06:e147  fe 0e fe	  inc $fe0e,x
$06:e14a  9e fe fe	  stz $fefe,x
$06:e14d  fe fe 74	  inc $74fe,x
$06:e150  80 b2		 bra $e104
$06:e152  41 69		 eor ($69,x)
$06:e154  00 a6		 brk #$a6
$06:e156  41 eb		 eor ($eb,x)
$06:e158  00 ca		 brk #$ca
$06:e15a  00 f6		 brk #$f6
$06:e15c  01 e2		 ora ($e2,x)
$06:e15e  00 0f		 brk #$0f
$06:e160  0f 0f 0f 1f   ora $1f0f0f
$06:e164  9f 1f 1f 17   sta $171f1f,x
$06:e168  17 3d		 ora [$3d],y
$06:e16a  3d 2f 2f	  and $2f2f,x
$06:e16d  1f 1f 69 b1   ora $b1691f,x
$06:e171  92 ea		 sta ($ea)
$06:e173  b3 59		 lda ($59,s),y
$06:e175  ca			dex
$06:e176  f0 7d		 beq $e1f5
$06:e178  a1 a1		 lda ($a1,x)
$06:e17a  18			clc
$06:e17b  ad f0 35	  lda $35f0
$06:e17e  c9 fd		 cmp #$fd
$06:e180  fe fe fd	  inc $fdfe,x
$06:e183  fd fc fc	  sbc $fcfc,x
$06:e186  fd ff fe	  sbc $feff,x
$06:e189  fe fe fe	  inc $fefe,x
$06:e18c  fe ff fe	  inc $feff,x
$06:e18f  c7 2a		 cmp [$2a]
$06:e191  f7 37		 sbc [$37],y
$06:e193  48			pha
$06:e194  c8			iny
$06:e195  62 e1 5f	  per $4179
$06:e198  c0 4a		 cpy #$4a
$06:e19a  c4 b9		 cpy $b9
$06:e19c  78			sei
$06:e19d  4d 9f d2	  eor $d29f
$06:e1a0  d0 b7		 bne $e159
$06:e1a2  88			dey
$06:e1a3  48			pha
$06:e1a4  37 60		 and [$60],y
$06:e1a6  1f 40 3f 40   ora $403f40,x
$06:e1aa  3f b8 87 ed   and $ed87b8,x
$06:e1ae  e0 ea		 cpx #$ea
$06:e1b0  95 3d		 sta $3d,x
$06:e1b2  3a			dec a
$06:e1b3  d6 87		 dec $87,x
$06:e1b5  4a			lsr a
$06:e1b6  33 d0		 and ($d0,s),y
$06:e1b8  3b			tsc
$06:e1b9  b6 67		 ldx $67,y
$06:e1bb  5c 1b 63 fe   jml $fe631b
$06:e1bf  83 03		 sta $03,s
$06:e1c1  39 c1 86	  and $86c1,y
$06:e1c4  78			sei
$06:e1c5  02 fc		 cop #$fc
$06:e1c7  00 fc		 brk #$fc
$06:e1c9  06 f8		 asl $f8
$06:e1cb  19 e1 63	  ora $63e1,y
$06:e1ce  03 a7		 ora $a7,s
$06:e1d0  97 cb		 sta [$cb],y
$06:e1d2  cf ac 3c 67   cmp $673cac
$06:e1d6  60			rts
$06:e1d7  d2 c4		 cmp ($c4)
$06:e1d9  ad 10 cf	  lda $cf10
$06:e1dc  e0 b3		 cpx #$b3
$06:e1de  00 78		 brk #$78
$06:e1e0  00 33		 brk #$33
$06:e1e2  00 cf		 brk #$cf
$06:e1e4  03 bf		 ora $bf,s
$06:e1e6  1f 7f 3f 7f   ora $7f3f7f,x
$06:e1ea  7f ff 3f 7f   adc $7f3fff,x
$06:e1ee  7f 72 f3 6b   adc $6bf372,x
$06:e1f2  7b			tdc
$06:e1f3  8c 0e 53	  sty $530e
$06:e1f6  43 25		 eor $25,s
$06:e1f8  09 ab		 ora #$ab
$06:e1fa  51 74		 eor ($74),y
$06:e1fc  80 9a		 bra $e198
$06:e1fe  04 0c		 tsb $0c
$06:e200  00 e4		 brk #$e4
$06:e202  80 fd		 bra $e201
$06:e204  f0 fe		 beq $e204
$06:e206  bc ff fe	  ldy $feff,x
$06:e209  ff fe ff ff   sbc $fffffe,x
$06:e20d  ff ff eb 50   sbc $50ebff,x
$06:e211  d5 a2		 cmp $a2,x
$06:e213  a8			tay
$06:e214  47 26		 eor [$26]
$06:e216  48			pha
$06:e217  6d 80 c9	  adc $c980
$06:e21a  06 e4		 asl $e4
$06:e21c  03 e3		 ora $e3,s
$06:e21e  00 47		 brk #$47
$06:e220  07 8f		 ora [$8f]
$06:e222  0e 1f 1c	  asl $1c1f
$06:e225  1f 98 1f 1c   ora $1c1f98,x
$06:e229  3f 3c 3f 3f   and $3f3f3c,x
$06:e22d  1f 1f 37 d3   ora $d3371f,x
$06:e231  2b			pld
$06:e232  d0 e3		 bne $e217
$06:e234  39 9a 02	  and $029a,y
$06:e237  25 98		 and $98
$06:e239  01 f8		 ora ($f8,x)
$06:e23b  ad d1 55	  lda $55d1
$06:e23e  88			dey
$06:e23f  eb			xba
$06:e240  e8			inx
$06:e241  fc 1c dd	  jsr ($dd1c,x)
$06:e244  0e fe 05	  asl $05fe
$06:e247  fe 0e fe	  inc $fe0e,x
$06:e24a  9e ff fe	  stz $feff,x
$06:e24d  fe fe d6	  inc $d6fe,x
$06:e250  29 aa		 and #$aa
$06:e252  75 b3		 adc $b3,x
$06:e254  aa			tax
$06:e255  44 3f a3	  mvp $a3,$3f
$06:e258  b5 7e		 lda $7e,x
$06:e25a  ca			dex
$06:e25b  15 be		 ora $be,x
$06:e25d  aa			tax
$06:e25e  fb			xce
$06:e25f  00 00		 brk #$00
$06:e261  00 00		 brk #$00
$06:e263  44 00 c0	  mvp $c0,$00
$06:e266  00 4a		 brk #$4a
$06:e268  00 11		 brk #$11
$06:e26a  00 40		 brk #$40
$06:e26c  00 04		 brk #$04
$06:e26e  00 b7		 brk #$b7
$06:e270  97 f7		 sta [$f7],y
$06:e272  e0 ed		 cpx #$ed
$06:e274  1f d0 64 42   ora $4264d0,x
$06:e278  89 8a		 bit #$8a
$06:e27a  14 5d		 trb $5d
$06:e27c  69 52		 adc #$52
$06:e27e  4a			lsr a
$06:e27f  68			pla
$06:e280  00 1f		 brk #$1f
$06:e282  1f ff 7f fb   ora $fb7fff,x
$06:e286  fb			xce
$06:e287  f7 f7		 sbc [$f7],y
$06:e289  ef cf 9e 9e   sbc $9e9ecf
$06:e28d  bd 3c 72	  lda $723c,x
$06:e290  f3 4f		 sbc ($4f,s),y
$06:e292  27 b4		 and [$b4]
$06:e294  ce af 77	  dec $77af
$06:e297  ad 19 4a	  lda $4a19
$06:e29a  05 65		 ora $65
$06:e29c  72 8b		 adc ($8b)
$06:e29e  c1 0c		 cmp ($0c,x)
$06:e2a0  00 d8		 brk #$d8
$06:e2a2  c0 f1		 cpy #$f1
$06:e2a4  f0 f8		 beq $e29e
$06:e2a6  f8			sed
$06:e2a7  fe fc fe	  inc $fefc,x
$06:e2aa  fe 8f 0f	  inc $0f8f,x
$06:e2ad  3f 3f 73 23   and $23733f,x
$06:e2b1  bc 55 5e	  ldy $5e55,x
$06:e2b4  2d 63 2a	  and $2a63
$06:e2b7  89 a6		 bit #$a6
$06:e2b9  74 19		 stz $19,x
$06:e2bb  59 e3 a3	  eor $a3e3,y
$06:e2be  0a			asl a
$06:e2bf  dc c0 ea	  jml [$eac0]
$06:e2c2  e0 f3		 cpx #$f3
$06:e2c4  f3 f7		 sbc ($f7,s),y
$06:e2c6  77 7f		 adc [$7f],y
$06:e2c8  7f fe fe fc   adc $fcfefe,x
$06:e2cc  fc f5 f0	  jsr ($f0f5,x)
$06:e2cf  a8			tay
$06:e2d0  68			pla
$06:e2d1  e9 61		 sbc #$61
$06:e2d3  31 f0		 and ($f0),y
$06:e2d5  20 e0 3c	  jsr $3ce0
$06:e2d8  fc 0e fe	  jsr ($fe0e,x)
$06:e2db  15 f1		 ora $f1,x
$06:e2dd  2a			rol a
$06:e2de  e0 17		 cpx #$17
$06:e2e0  00 1e		 brk #$1e
$06:e2e2  00 0f		 brk #$0f
$06:e2e4  00 1f		 brk #$1f
$06:e2e6  00 03		 brk #$03
$06:e2e8  00 01		 brk #$01
$06:e2ea  00 0e		 brk #$0e
$06:e2ec  00 1f		 brk #$1f
$06:e2ee  00 72		 brk #$72
$06:e2f0  73 4c		 adc ($4c,s),y
$06:e2f2  2f 06 17 8a   and $8a1706
$06:e2f6  83 ea		 sta $ea,s
$06:e2f8  e3 d6		 sbc $d6,s
$06:e2fa  43 06		 eor $06,s
$06:e2fc  03 0b		 ora $0b,s
$06:e2fe  0b			phd
$06:e2ff  8c 00 f0	  sty $f000
$06:e302  00 f8		 brk #$f8
$06:e304  00 7c		 brk #$7c
$06:e306  00 1c		 brk #$1c
$06:e308  00 bc		 brk #$bc
$06:e30a  00 fc		 brk #$fc
$06:e30c  00 f4		 brk #$f4
$06:e30e  00 d4		 brk #$d4
$06:e310  00 aa		 brk #$aa
$06:e312  01 90		 ora ($90,x)
$06:e314  00 68		 brk #$68
$06:e316  80 56		 bra $e36e
$06:e318  88			dey
$06:e319  aa			tax
$06:e31a  c1 13		 cmp ($13,x)
$06:e31c  e0 a8		 cpx #$a8
$06:e31e  f0 3f		 beq $e35f
$06:e320  3f 5f 5f 6f   and $6f5f5f,x
$06:e324  6f 3f 3f 3f   adc $3f3f3f
$06:e328  3f 1f 1f 0f   and $0f1f1f,x
$06:e32c  0f 07 07 d5   ora $d50707
$06:e330  19 aa d4	  ora $d4aa,y
$06:e333  da			phx
$06:e334  0c 54 28	  tsb $2854
$06:e337  ad 11 59	  lda $5911
$06:e33a  81 c3		 sta ($c3,x)
$06:e33c  03 0e		 ora $0e,s
$06:e33e  0c fe fe	  tsb $fefe
$06:e341  ff ff ff ff   sbc $ffffff,x
$06:e345  ff ff fe fe   sbc $fefeff,x
$06:e349  fe fe fc	  inc $fcfe,x
$06:e34c  fc f3 f0	  jsr ($f0f3,x)
$06:e34f  d1 00		 cmp ($00),y
$06:e351  aa			tax
$06:e352  05 97		 ora $97
$06:e354  00 e0		 brk #$e0
$06:e356  00 d5		 brk #$d5
$06:e358  08			php
$06:e359  ee 01 73	  inc $7301
$06:e35c  80 88		 bra $e2e6
$06:e35e  50 3e		 bvc $e39e
$06:e360  3e 5f 5f	  rol $5f5f,x
$06:e363  6f 6f 3f 3f   adc $3f3f6f
$06:e367  3f 3f 1f 1f   and $1f1f3f,x
$06:e36b  0f 0f 07 27   ora $27070f
$06:e36f  d4 38		 pei ($38)
$06:e371  aa			tax
$06:e372  f4 b2 4c	  pea $4cb2
$06:e375  cc 38 6c	  cpy $6c38
$06:e378  f0 58		 beq $e3d2
$06:e37a  a0 b1		 ldy #$b1
$06:e37c  00 06		 brk #$06
$06:e37e  06 fe		 asl $fe
$06:e380  ff ff ff ff   sbc $ffffff,x
$06:e384  ff ff ff ff   sbc $ffffff,x
$06:e388  ff fe ff fc   sbc $fcfffe,x
$06:e38c  ff f6 f9 ea   sbc $eaf9f6,x
$06:e390  15 bd		 ora $bd,x
$06:e392  7c d2 52	  jmp ($52d2,x)
$06:e395  4b			phk
$06:e396  c2 af		 rep #$af
$06:e398  23 c9		 and $c9,s
$06:e39a  45 dd		 eor $dd
$06:e39c  c1 4b		 cmp ($4b,x)
$06:e39e  d1 c3		 cmp ($c3),y
$06:e3a0  c3 bf		 cmp $bf,s
$06:e3a2  83 53		 sta $53,s
$06:e3a4  2d 42 3c	  and $3c42
$06:e3a7  23 5c		 and $5c,s
$06:e3a9  41 3e		 eor ($3e,x)
$06:e3ab  c1 3e		 cmp ($3e,x)
$06:e3ad  41 3e		 eor ($3e,x)
$06:e3af  ad a1 bb	  lda $bba1
$06:e3b2  05 45		 ora $45
$06:e3b4  dd ee 5b	  cmp $5bee,x
$06:e3b7  53 ca		 eor ($ca,s),y
$06:e3b9  66 a5		 ror $a5
$06:e3bb  bd 77 65	  lda $6577,x
$06:e3be  9a			txs
$06:e3bf  a1 5e		 lda ($5e,x)
$06:e3c1  01 7e		 ora ($7e,x)
$06:e3c3  41 3e		 eor ($3e,x)
$06:e3c5  42 3c		 wdm #$3c
$06:e3c7  42 3c		 wdm #$3c
$06:e3c9  24 18		 bit $18
$06:e3cb  b5 81		 lda $81,x
$06:e3cd  c3 c3		 cmp $c3,s
$06:e3cf  99 81 e9	  sta $e981,y
$06:e3d2  54 50 cd	  mvn $cd,$50
$06:e3d5  66 a0		 ror $a0
$06:e3d7  b9 e9 9e	  lda $9ee9,y
$06:e3da  f6 57		 inc $57,x
$06:e3dc  5b			tcd
$06:e3dd  bd bc ff	  lda $ffbc,x
$06:e3e0  7e 7f 3f	  ror $3f7f,x
$06:e3e3  7f 3f 3f 1f   adc $1f3f3f,x
$06:e3e7  2f 06 17 01   and $011706
$06:e3eb  a3 00		 lda $00,s
$06:e3ed  43 00		 eor $00,s
$06:e3ef  58			cli
$06:e3f0  24 25		 bit $25
$06:e3f2  c9 b1 41	  cmp #$41b1
$06:e3f5  26 f3		 rol $f3
$06:e3f7  85 27		 sta $27
$06:e3f9  58			cli
$06:e3fa  5c ea 79 5c   jml $5c79ea
$06:e3fe  5c ff ff ff   jml $ffffff
$06:e402  fe ff fe	  inc $feff,x
$06:e405  fe fc fc	  inc $fcfc,x
$06:e408  f8			sed
$06:e409  fb			xce
$06:e40a  a0 67		 ldy #$67
$06:e40c  00 a3		 brk #$a3
$06:e40e  00 d4		 brk #$d4
$06:e410  00 aa		 brk #$aa
$06:e412  01 90		 ora ($90,x)
$06:e414  00 e8		 brk #$e8
$06:e416  00 d6		 brk #$d6
$06:e418  08			php
$06:e419  ea			nop
$06:e41a  01 f3		 ora ($f3,x)
$06:e41c  40			rti
$06:e41d  b8			clv
$06:e41e  a0 3f		 ldy #$3f
$06:e420  3f 5f 5f 6f   and $6f5f5f,x
$06:e424  6f 3f 3f 3f   adc $3f3f3f
$06:e428  3f 1f 1f 4f   and $4f1f1f,x
$06:e42c  0f a7 47 d5   ora $d547a7
$06:e430  18			clc
$06:e431  aa			tax
$06:e432  d4 da		 pei ($da)
$06:e434  0c 54 28	  tsb $2854
$06:e437  ad 10 59	  lda $5910
$06:e43a  80 c3		 bra $e3ff
$06:e43c  00 8d		 brk #$8d
$06:e43e  04 fe		 tsb $fe
$06:e440  fe ff ff	  inc $ffff,x
$06:e443  ff ff ff ff   sbc $ffffff,x
$06:e447  fe fe fe	  inc $fefe,x
$06:e44a  fe fc fc	  inc $fcfc,x
$06:e44d  74 72		 stz $72,x
$06:e44f  71 f2		 adc ($f2),y
$06:e451  44 67 83	  mvp $83,$67
$06:e454  5d 48 17	  eor $1748,x
$06:e457  d6 ff		 dec $ff,x
$06:e459  55 b1		 eor $b1,x
$06:e45b  ad fe 42	  lda $42fe
$06:e45e  fe 0c 00	  inc $000c,x
$06:e461  98			tya
$06:e462  00 e0		 brk #$e0
$06:e464  00 e0		 brk #$e0
$06:e466  00 00		 brk #$00
$06:e468  00 0e		 brk #$0e
$06:e46a  00 00		 brk #$00
$06:e46c  00 01		 brk #$01
$06:e46e  00 3a		 brk #$3a
$06:e470  d3 a1		 cmp ($a1,s),y
$06:e472  d4 15		 pei ($15)
$06:e474  c3 b5		 cmp $b5,s
$06:e476  0e 28 f1	  asl $f128
$06:e479  06 2e		 asl $2e
$06:e47b  5a			phy
$06:e47c  5b			tcd
$06:e47d  bd bc 3c	  lda $3cbc,x
$06:e480  3c 3b 3b	  bit $3b3b,x
$06:e483  3f 3f ff ff   and $ffff3f,x
$06:e487  fe fe d1	  inc $d1fe,x
$06:e48a  d0 a4		 bne $e430
$06:e48c  00 43		 brk #$43
$06:e48e  00 55		 brk #$55
$06:e490  38			sec
$06:e491  70 c0		 bvs $e453
$06:e493  44 af 0f	  mvp $0f,$af
$06:e496  35 b7		 and $b7,x
$06:e498  db			stp
$06:e499  9c aa c7	  stz $c7aa
$06:e49c  ea			nop
$06:e49d  6a			ror a
$06:e49e  56 ff		 lsr $ff,x
$06:e4a0  ff ff ff f0   sbc $f0ffff,x
$06:e4a4  f0 fa		 beq $e4a0
$06:e4a6  f8			sed
$06:e4a7  3c 3c 5d	  bit $5d3c,x
$06:e4aa  1c 1d 1c	  trb $1c1d
$06:e4ad  b9 38 4c	  lda $4c38,y
$06:e4b0  9d fb 43	  sta $43fb,x
$06:e4b3  5e 32 17	  lsr $1732,x
$06:e4b6  8c 84 a3	  sty $a384
$06:e4b9  a0 ea		 ldy #$ea
$06:e4bb  52 53		 eor ($53)
$06:e4bd  bd bc e2	  lda $e2bc,x
$06:e4c0  e0 fc		 cpx #$fc
$06:e4c2  f0 fd		 beq $e4c1
$06:e4c4  fc 7f 7f	  jsr ($7f7f,x)
$06:e4c7  5f 1f 15 05   eor $05151f,x
$06:e4cb  ac 00 43	  ldy $4300
$06:e4ce  00 b0		 brk #$b0
$06:e4d0  e0 61		 cpx #$61
$06:e4d2  e0 48		 cpx #$48
$06:e4d4  c8			iny
$06:e4d5  e8			inx
$06:e4d6  60			rts
$06:e4d7  24 e4		 bit $e4
$06:e4d9  73 f3		 adc ($f3,s),y
$06:e4db  ae 7f c0	  ldx $c07f
$06:e4de  3f 1f 00 1f   and $1f001f,x
$06:e4e2  00 37		 brk #$37
$06:e4e4  00 1f		 brk #$1f
$06:e4e6  00 1b		 brk #$1b
$06:e4e8  00 0c		 brk #$0c
$06:e4ea  00 00		 brk #$00
$06:e4ec  00 00		 brk #$00
$06:e4ee  00 8b		 brk #$8b
$06:e4f0  83 01		 sta $01,s
$06:e4f2  01 23		 ora ($23,x)
$06:e4f4  23 27		 and $27,s
$06:e4f6  07 25		 ora [$25]
$06:e4f8  25 6a		 and $6a
$06:e4fa  6b			rtl
$06:e4fb  dc ff 08	  jml [$08ff]
$06:e4fe  ff 7c 00 fe   sbc $fe007c,x
$06:e502  00 dc		 brk #$dc
$06:e504  00 f8		 brk #$f8
$06:e506  00 da		 brk #$da
$06:e508  00 94		 brk #$94
$06:e50a  00 00		 brk #$00
$06:e50c  00 00		 brk #$00
$06:e50e  00 a7		 brk #$a7
$06:e510  97 cc		 sta [$cc],y
$06:e512  c4 b9		 cpy $b9
$06:e514  30 76		 bmi $e58c
$06:e516  61 4c		 adc ($4c,x)
$06:e518  c3 83		 cmp $83,s
$06:e51a  9f b9 8f 46   sta $468fb9,x
$06:e51e  3f 78 00 3b   and $3b0078,x
$06:e522  03 cf		 ora $cf,s
$06:e524  0f 9f 1f 3f   ora $3f1f9f
$06:e528  3f 77 77 7f   and $7f7777,x
$06:e52c  7f ff ff 72   adc $72ffff,x
$06:e530  f3 8b		 sbc ($8b,s),y
$06:e532  23 6c		 and $6c,s
$06:e534  0e 5f a7	  asl $a75f
$06:e537  89 f1 de	  bit #$def1
$06:e53a  f0 a5		 beq $e4e1
$06:e53c  f9 fa fc	  sbc $fcfa,y
$06:e53f  0c 00 dc	  tsb $dc00
$06:e542  c0 f1		 cpy #$f1
$06:e544  f0 f8		 beq $e53e
$06:e546  f8			sed
$06:e547  fe fc ff	  inc $fffc,x
$06:e54a  fe fe fe	  inc $fefe,x
$06:e54d  ff ff 76 d0   sbc $d076ff,x
$06:e551  69 ea 32	  adc #$32ea
$06:e554  f1 55		 sbc ($55),y
$06:e556  d4 3c		 pei ($3c)
$06:e558  fe 15 fc	  inc $fc15,x
$06:e55b  aa			tax
$06:e55c  fa			plx
$06:e55d  52 d0		 eor ($d0)
$06:e55f  2f 00 17 00   and $001700
$06:e563  0f 00 2b 00   ora $002b00
$06:e567  01 00		 ora ($00,x)
$06:e569  03 00		 ora $00,s
$06:e56b  05 00		 ora $00
$06:e56d  2f 00 99 71   and $719900
$06:e571  77 a3		 adc [$a3],y
$06:e573  aa			tax
$06:e574  cb			wai
$06:e575  57 97		 eor [$97],y
$06:e577  ac 3d 52	  ldy $523d
$06:e57a  53 f1		 eor ($f1,s),y
$06:e57c  65 2d		 adc $2d
$06:e57e  25 fe		 and $fe
$06:e580  00 fc		 brk #$fc
$06:e582  00 f4		 brk #$f4
$06:e584  00 e8		 brk #$e8
$06:e586  00 c2		 brk #$c2
$06:e588  00 ac		 brk #$ac
$06:e58a  00 9a		 brk #$9a
$06:e58c  00 da		 brk #$da
$06:e58e  00 a5		 brk #$a5
$06:e590  66 6a		 ror $6a
$06:e592  a3 b9		 lda $b9,s
$06:e594  62 55 86	  per $6bec
$06:e597  aa			tax
$06:e598  63 fa		 adc $fa,s
$06:e59a  23 86		 and $86,s
$06:e59c  57 33		 eor [$33],y
$06:e59e  e3 18		 sbc $18,s
$06:e5a0  00 1c		 brk #$1c
$06:e5a2  00 1c		 brk #$1c
$06:e5a4  00 38		 brk #$38
$06:e5a6  00 1c		 brk #$1c
$06:e5a8  00 1c		 brk #$1c
$06:e5aa  00 38		 brk #$38
$06:e5ac  00 1c		 brk #$1c
$06:e5ae  00 68		 brk #$68
$06:e5b0  a3 96		 lda $96,s
$06:e5b2  47 a0		 eor [$a0]
$06:e5b4  63 0d		 adc $0d,s
$06:e5b6  c7 da		 cmp [$da]
$06:e5b8  03 a0		 ora $a0,s
$06:e5ba  6b			rtl
$06:e5bb  aa			tax
$06:e5bc  6b			rtl
$06:e5bd  c5 3e		 cmp $3e
$06:e5bf  1c 00 38	  trb $3800
$06:e5c2  00 1c		 brk #$1c
$06:e5c4  00 38		 brk #$38
$06:e5c6  00 3c		 brk #$3c
$06:e5c8  00 1c		 brk #$1c
$06:e5ca  00 14		 brk #$14
$06:e5cc  00 00		 brk #$00
$06:e5ce  00 f5		 brk #$f5
$06:e5d0  61 89		 adc ($89,x)
$06:e5d2  45 6a		 eor $6a
$06:e5d4  e3 58		 sbc $58,s
$06:e5d6  ff 8b 76 ef   sbc $ef768b,x
$06:e5da  12 f3		 ora ($f3)
$06:e5dc  0d c5 3e	  ora $3ec5
$06:e5df  1e 00 3e	  asl $3e00,x
$06:e5e2  00 1c		 brk #$1c
$06:e5e4  00 00		 brk #$00
$06:e5e6  00 00		 brk #$00
$06:e5e8  00 3d		 brk #$3d
$06:e5ea  3d 7e 7e	  and $7e7e,x
$06:e5ed  f7 f7		 sbc [$f7],y
$06:e5ef  7f 80 c0 3f   adc $3fc080,x
$06:e5f3  b7 77		 lda [$77],y
$06:e5f5  c1 7f		 cmp ($7f,x)
$06:e5f7  9e 3e 9e	  stz $9e3e,x
$06:e5fa  3e 80 3e	  rol $3e80,x
$06:e5fd  c1 7f		 cmp ($7f,x)
$06:e5ff  7f ff c0 ff   adc $ffc0ff,x
$06:e603  88			dey
$06:e604  ff be ff ff   sbc $ffffbe,x
$06:e608  ff ff ff ff   sbc $ffffff,x
$06:e60c  ff be ff c0   sbc $c0ffbe,x
$06:e610  7f e5 65 fc   adc $fc65e5,x
$06:e614  02 b9		 cop #$b9
$06:e616  3b			tsc
$06:e617  c2 7f		 rep #$7f
$06:e619  c0 7f 92	  cpy #$927f
$06:e61c  7f 7f 80 80   adc $80807f,x
$06:e620  ff 9a ff fd   sbc $fdff9a,x
$06:e624  ff c4 ff bc   sbc $bcffc4,x
$06:e628  ff bf ff 80   sbc $80ffbf,x
$06:e62c  ff 7f ff 7f   sbc $7fff7f,x
$06:e630  80 80		 bra $e5b2
$06:e632  7f dd 7f 81   adc $817fdd,x
$06:e636  01 bc		 ora ($bc,x)
$06:e638  42 d7		 wdm #$d7
$06:e63a  28			plp
$06:e63b  bf 40 bf 40   lda $40bf40,x
$06:e63f  7f ff be ff   adc $ffbeff,x
$06:e643  be ff fe	  ldx $feff,y
$06:e646  ff bd ff d7   sbc $d7ffbd,x
$06:e64a  ff bf ff bf   sbc $bfffbf,x
$06:e64e  ff fb 44 f4   sbc $f444fb,x
$06:e652  4b			phk
$06:e653  e0 5f a9	  cpx #$a95f
$06:e656  2b			pld
$06:e657  ca			dex
$06:e658  7e c0 7f	  ror $7fc0,x
$06:e65b  92 7f		 sta ($7f)
$06:e65d  7f 80 bf ff   adc $ffbf80,x
$06:e661  bf ff bf ff   lda $ffbfff,x
$06:e665  d4 ff		 pei ($ff)
$06:e667  bd ff bf	  lda $bfff,x
$06:e66a  ff 80 ff 7f   sbc $7fff80,x
$06:e66e  ff 7e 81 c1   sbc $c1817e,x
$06:e672  7e 92 73	  ror $7392,x
$06:e675  a1 7f		 lda ($7f,x)
$06:e677  8d 53 8c	  sta $8c53
$06:e67a  52 a1		 eor ($a1)
$06:e67c  7f 5a ba 7e   adc $7eba5a,x
$06:e680  ff 81 ff 8c   sbc $8cff81,x
$06:e684  ff 80 ff ac   sbc $acff80,x
$06:e688  ff ad ff 80   sbc $80ffad,x
$06:e68c  ff 45 ff 6f   sbc $6fff45,x
$06:e690  b0 b3		 bcs $e645
$06:e692  4e cc bd	  lsr $bdcc
$06:e695  53 b2		 eor ($b2,s),y
$06:e697  a9 6f a6	  lda #$a66f
$06:e69a  6e d5 5c	  ror $5cd5
$06:e69d  db			stp
$06:e69e  28			plp
$06:e69f  4f ff b1 ff   eor $ffb1ff
$06:e6a3  42 ff		 wdm #$ff
$06:e6a5  4d ff 91	  eor $91ff
$06:e6a8  fe 96 f9	  inc $f996,x
$06:e6ab  a4 fb		 ldy $fb
$06:e6ad  d8			cld
$06:e6ae  f7 b5		 sbc [$b5],y
$06:e6b0  4a			lsr a
$06:e6b1  6f d0 d5 2e   adc $2ed5d0
$06:e6b5  6f 90 b3 4c   adc $4cb390
$06:e6b9  56 bf		 lsr $bf,x
$06:e6bb  ed 2e 55	  sbc $552e
$06:e6be  86 ff		 stx $ff
$06:e6c0  ff ff ff ff   sbc $ffffff,x
$06:e6c4  ff fe fe 00   sbc $00fefe,x
$06:e6c8  00 00		 brk #$00
$06:e6ca  00 10		 brk #$10
$06:e6cc  00 38		 brk #$38
$06:e6ce  00 ff		 brk #$ff
$06:e6d0  fc ca 82	  jsr ($82ca,x)
$06:e6d3  a5 94		 lda $94
$06:e6d5  aa			tax
$06:e6d6  a9 d5 93	  lda #$93d5
$06:e6d9  ab			plb
$06:e6da  a6 d6		 ldx $d6
$06:e6dc  4c ac 19	  jmp $19ac
$06:e6df  00 fc		 brk #$fc
$06:e6e1  7d ff 7b	  adc $7bff,x
$06:e6e4  ff 77 ff 6f   sbc $6fff77,x
$06:e6e8  ff 5f ff 3f   sbc $3fff5f,x
$06:e6ec  7f 7f 7f ad   adc $ad7f7f,x
$06:e6f0  d3 55		 cmp ($55,s),y
$06:e6f2  ec aa 59	  cpx $59aa
$06:e6f5  55 ac		 eor $ac,x
$06:e6f7  a9 77 d6	  lda #$d677
$06:e6fa  59 26 89	  eor $8926,y
$06:e6fd  d9 ae 28	  cmp $28ae,y
$06:e700  f8			sed
$06:e701  03 e0		 ora $e0,s
$06:e703  87 c0		 sta [$c0]
$06:e705  03 80		 ora $80,s
$06:e707  80 80		 bra $e689
$06:e709  20 00 71	  jsr $7100
$06:e70c  00 73		 brk #$73
$06:e70e  00 00		 brk #$00
$06:e710  20 80 3b	  jsr $3b80
$06:e713  ce 05 02	  dec $0205
$06:e716  82 c1 20	  brl $07da
$06:e719  f0 f9		 beq $e714
$06:e71b  8c b2 6f	  sty $6fb2
$06:e71e  0a			asl a
$06:e71f  77 a4		 adc [$a4],y
$06:e721  06 01		 asl $01
$06:e723  03 80		 ora $80,s
$06:e725  42 22		 wdm #$22
$06:e727  10 b8		 bpl $e6e1
$06:e729  84 a6		 sty $a6
$06:e72b  24 ef		 bit $ef
$06:e72d  4d 04 83	  eor $8304
$06:e730  a1 10		 lda ($10,x)
$06:e732  b8			clv
$06:e733  5e 38 d9	  lsr $d938,x
$06:e736  ab			plb
$06:e737  b6 a1		 ldx $a1,y
$06:e739  de 9c 08	  dec $089c,x
$06:e73c  07 82		 ora [$82]
$06:e73e  01 88		 ora ($88,x)
$06:e740  82 5a 20	  brl $079d
$06:e743  94 a9		 sty $a9,x
$06:e745  23 bd		 and $bd,s
$06:e747  1d e1 0a	  ora $0ae1,x
$06:e74a  87 4b		 sta [$4b]
$06:e74c  65 9b		 adc $9b
$06:e74e  7e 7c c6	  ror $c67c,x
$06:e751  98			tya
$06:e752  2f 68 6c 00   and $006c68
$06:e756  16 12		 asl $12,x
$06:e758  88			dey
$06:e759  86 ae		 stx $ae
$06:e75b  20 2f 60	  jsr $602f
$06:e75e  ab			plb
$06:e75f  0b			phd
$06:e760  d8			cld
$06:e761  4a			lsr a
$06:e762  c3 15		 cmp $15,s
$06:e764  81 40		 sta ($40,x)
$06:e766  67 d8		 adc [$d8]
$06:e768  bd 15 b2	  lda $b215,x
$06:e76b  55 ed		 eor $ed,x
$06:e76d  27 2c		 and [$2c]
$06:e76f  74 08		 stz $08,x
$06:e771  35 d8		 and $d8,x
$06:e773  07 46		 ora [$46]
$06:e775  11 a3		 ora ($a3),y
$06:e777  17 ae		 ora [$ae],y
$06:e779  03 01		 ora $01,s
$06:e77b  60			rts
$06:e77c  a0 6c 24	  ldy #$246c
$06:e77f  13 09		 ora ($09,s),y
$06:e781  04 e1		 tsb $e1
$06:e783  dc a9 31	  jml [$31a9]
$06:e786  98			tya
$06:e787  70 23		 bvs $e7ac
$06:e789  0a			asl a
$06:e78a  92 17		 sta ($17)
$06:e78c  b9 d9 45	  lda $45d9,y
$06:e78f  ec 85 64	  cpx $6485
$06:e792  fb			xce
$06:e793  e0 2a 14	  cpx #$142a
$06:e796  2d c4 86	  and $86c4
$06:e799  7d 23 17	  adc $1723,x
$06:e79c  b3 fc		 lda ($fc,s),y
$06:e79e  30 93		 bmi $e733
$06:e7a0  8e 14 73	  stx $7314
$06:e7a3  81 1c		 sta ($1c,x)
$06:e7a5  80 40		 bra $e7e7
$06:e7a7  91 c7		 sta ($c7),y
$06:e7a9  02 81		 cop #$81
$06:e7ab  41 9f		 eor ($9f,x)
$06:e7ad  01 04		 ora ($04,x)
$06:e7af  82 40 50	  brl $37f2
$06:e7b2  e0 f0 58	  cpx #$58f0
$06:e7b5  04 18		 tsb $18
$06:e7b7  0e 26 e0	  asl $e026
$06:e7ba  43 82		 eor $82,s
$06:e7bc  38			sec
$06:e7bd  e1 10		 sbc ($10,x)
$06:e7bf  8c c6 e3	  sty $e3c6
$06:e7c2  51 e8		 eor ($e8),y
$06:e7c4  a8			tay
$06:e7c5  56 32		 lsr $32,x
$06:e7c7  19 04 72	  ora $7204,y
$06:e7ca  b3 83		 lda ($83,s),y
$06:e7cc  71 10		 adc ($10),y
$06:e7ce  fc 68 3f	  jsr ($3f68,x)
$06:e7d1  16 0f		 asl $0f,x
$06:e7d3  83 d4		 sta $d4,s
$06:e7d5  9f 60 8e 08   sta $088e60,x
$06:e7d9  2c 16 1b	  bit $1b16
$06:e7dc  0d 83 c1	  ora $c183
$06:e7df  e1 70		 sbc ($70,x)
$06:e7e1  b0 29		 bcs $e80c
$06:e7e3  9b			txy
$06:e7e4  8a			txa
$06:e7e5  0b			phd
$06:e7e6  00 86		 brk #$86
$06:e7e8  c2 21		 rep #$21
$06:e7ea  f0 48		 beq $e834
$06:e7ec  7c 40 3a	  jmp ($3a40,x)
$06:e7ef  1b			tcs
$06:e7f0  89 85 e3	  bit #$e385
$06:e7f3  a1 d0		 lda ($d0,x)
$06:e7f5  0e 80 74	  asl $7480
$06:e7f8  24 12		 bit $12
$06:e7fa  04 a8		 tsb $a8
$06:e7fc  40			rti
$06:e7fd  03 c1		 ora $c1,s
$06:e7ff  b8			clv
$06:e800  c0 7e 24	  cpy #$247e
$06:e803  1f 01 68 0b   ora $0b6801,x
$06:e807  43 81		 eor $81,s
$06:e809  e0 a0 70	  cpx #$70a0
$06:e80c  1e 67 03	  asl $0367,x
$06:e80f  82 41 47	  brl $2f53
$06:e812  61 0a		 adc ($0a,x)
$06:e814  85 05		 sta $05
$06:e816  42 1b		 wdm #$1b
$06:e818  09 01 9c	  ora #$9c01
$06:e81b  0e 05 07	  asl $0705
$06:e81e  80 41		 bra $e861
$06:e820  e0 90 e8	  cpx #$e890
$06:e823  32 28		 and ($28)
$06:e825  21 e5		 and ($e5,x)
$06:e827  b0 a8		 bcs $e7d1
$06:e829  24 44		 bit $44
$06:e82b  b6 14		 ldx $14,y
$06:e82d  0a			asl a
$06:e82e  04 42		 tsb $42
$06:e830  21 b0		 and ($b0,x)
$06:e832  d8			cld
$06:e833  68			pla
$06:e834  34 10		 bit $10,x
$06:e836  02 d8		 cop #$d8
$06:e838  5c 14 21 40   jml $402114
$06:e83c  b0 40		 bcs $e87e
$06:e83e  28			plp
$06:e83f  10 08		 bpl $e849
$06:e841  84 03		 sty $03
$06:e843  61 00		 adc ($00,x)
$06:e845  4f 04 11 f0   eor $f01104
$06:e849  03 80		 ora $80,s
$06:e84b  84 c2		 sty $c2
$06:e84d  4f 20 fb 07   eor $07fb20
$06:e851  b1 02		 lda ($02),y
$06:e853  c6 0d		 dec $0d
$06:e855  02 87		 cop #$87
$06:e857  a3 41		 lda $41,s
$06:e859  12 00		 ora ($00)
$06:e85b  b1 03		 lda ($03),y
$06:e85d  10 7c		 bpl $e8db
$06:e85f  13 21		 ora ($21,s),y
$06:e861  30 2d		 bmi $e890
$06:e863  80 7c		 bra $e8e1
$06:e865  8b			phb
$06:e866  61 60		 adc ($60,x)
$06:e868  b4 33		 ldy $33,x
$06:e86a  ca			dex
$06:e86b  01 30		 ora ($30,x)
$06:e86d  4f 80 7c da   eor $da7c80
$06:e871  c1 68		 cmp ($68,x)
$06:e873  93 db		 sta ($db,s),y
$06:e875  6b			rtl
$06:e876  37 c9		 and [$c9],y
$06:e878  5c fa af 6a   jml $6aaffa
$06:e87c  92 d2		 sta ($d2)
$06:e87e  e6 d0		 inc $d0
$06:e880  18			clc
$06:e881  ac 0a 13	  ldy $130a
$06:e884  06 84		 asl $84
$06:e886  44 23 70	  mvp $70,$23
$06:e889  0a			asl a
$06:e88a  e8			inx
$06:e88b  94 5c		 sty $5c,x
$06:e88d  81 38		 sta ($38,x)
$06:e88f  04 0a		 tsb $0a
$06:e891  a8			tay
$06:e892  2e 5d be	  rol $be5d
$06:e895  6c 7f d5	  jmp ($d57f)
$06:e898  3e fa ca	  rol $cafa,x
$06:e89b  ea			nop
$06:e89c  56 9d		 lsr $9d,x
$06:e89e  b7 03		 lda [$03],y
$06:e8a0  a9 20 e4	  lda #$e420
$06:e8a3  4c 21 10	  jmp $1021
$06:e8a6  4f 64 03 bb   eor $bb0364
$06:e8aa  00 c4		 brk #$c4
$06:e8ac  40			rti
$06:e8ad  30 d0		 bmi $e87f
$06:e8af  06 40		 asl $40
$06:e8b1  32 0a		 and ($0a)
$06:e8b3  cf 2a 93 c3   cmp $c3932a
$06:e8b7  69 37 c8	  adc #$c837
$06:e8ba  1c 7a 47	  trb $477a
$06:e8bd  0e 92 c2	  asl $c292
$06:e8c0  e2 d0		 sep #$d0
$06:e8c2  d8			cld
$06:e8c3  0c 4b 13	  tsb $134b
$06:e8c6  12 e4		 ora ($e4)
$06:e8c8  44 33 70	  mvp $70,$33
$06:e8cb  0b			phd
$06:e8cc  6c 02 f9	  jmp ($f902)
$06:e8cf  00 bc		 brk #$bc
$06:e8d1  39 46 19	  and $1946,y
$06:e8d4  00 bb		 brk #$bb
$06:e8d6  6a			ror a
$06:e8d7  2e 1d 9e	  rol $9e1d
$06:e8da  74 7f		 stz $7f,x
$06:e8dc  f3 2f		 sbc ($2f,s),y
$06:e8de  fb			xce
$06:e8df  4a			lsr a
$06:e8e0  a9 37 4d	  lda #$4d37
$06:e8e3  cf 13 e9 02   cmp $02e913
$06:e8e7  a5 49		 lda $49
$06:e8e9  17 00		 ora [$00],y
$06:e8eb  21 0e		 and ($0e,x)
$06:e8ed  64 03		 stz $03
$06:e8ef  13 00		 ora ($00,s),y
$06:e8f1  c9 a0 c2	  cmp #$c2a0
$06:e8f4  01 0d		 ora ($0d,x)
$06:e8f6  80 45		 bra $e93d
$06:e8f8  8d 81 3d	  sta $3d81
$06:e8fb  80 43		 bra $e940
$06:e8fd  e0 30		 cpx #$30
$06:e8ff  28			plp
$06:e900  0c 00 ee	  tsb $ee00
$06:e903  10 f8		 bpl $e8fd
$06:e905  48			pha
$06:e906  a4 3f		 ldy $3f
$06:e908  f0 0a		 beq $e914
$06:e90a  13 9c		 ora ($9c,s),y
$06:e90c  dc e4 be	  jml [$bee4]
$06:e90f  08			php
$06:e910  7c 02 b9	  jmp ($b902,x)
$06:e913  44 9c 60	  mvp $60,$9c
$06:e916  28			plp
$06:e917  18			clc
$06:e918  8b			phb
$06:e919  97 0a		 sta [$0a],y
$06:e91b  31 ca		 and ($ca),y
$06:e91d  cc 7e e0	  cpy $e07e
$06:e920  70 bb		 bvs $e8dd
$06:e922  37 fb		 and [$fb],y
$06:e924  08			php
$06:e925  09 0b e6	  ora #$e60b
$06:e928  e2 89		 sep #$89
$06:e92a  ba			tsx
$06:e92b  82 6c a0	  brl $899a
$06:e92e  90 98		 bcc $e8c8
$06:e930  27 ea		 and [$ea]
$06:e932  08			php
$06:e933  8d 0f 6c	  sta $6c0f
$06:e936  40			rti
$06:e937  de 10 c3	  dec $c310,x
$06:e93a  92 de		 sta ($de)
$06:e93c  4b			phk
$06:e93d  21 04		 and ($04,x)
$06:e93f  d1 9f		 cmp ($9f),y
$06:e941  a6 6d		 ldx $6d
$06:e943  00 bd		 brk #$bd
$06:e945  c0 27		 cpy #$27
$06:e947  92 0c		 sta ($0c)
$06:e949  c7 01		 cmp [$01]
$06:e94b  22 0f f0 f1   jsl $f1f00f
$06:e94f  62 a6 19	  per $02f8
$06:e952  aa			tax
$06:e953  47 ef		 eor [$ef]
$06:e955  07 fb		 ora [$fb]
$06:e957  e0 47		 cpx #$47
$06:e959  19 c1 80	  ora $80c1,y
$06:e95c  be 5c 31	  ldx $315c,y
$06:e95f  97 a8		 sta [$a8],y
$06:e961  25 a9		 and $a9
$06:e963  50 33		 bvc $e998
$06:e965  a8			tay
$06:e966  24 0e		 bit $0e
$06:e968  07 05		 ora [$05]
$06:e96a  82 c0 60	  brl $4a2d
$06:e96d  30 a8		 bmi $e917
$06:e96f  44 36 15	  mvp $15,$36
$06:e972  0b			phd
$06:e973  0f 84 11 e6   ora $e61184
$06:e977  06 a0		 asl $a0
$06:e979  81 41		 sta ($41,x)
$06:e97b  e0 d0		 cpx #$d0
$06:e97d  78			sei
$06:e97e  3c 3c 0a	  bit $0a3c,x
$06:e981  50 38		 bvc $e9bb
$06:e983  39 e0 2a	  and $2ae0,y
$06:e986  11 04		 ora ($04),y
$06:e988  30 52		 bmi $e9dc
$06:e98a  21 1e		 and ($1e,x)
$06:e98c  88			dey
$06:e98d  44 a3 90	  mvp $90,$a3
$06:e990  17 0e		 ora [$0e],y
$06:e992  84 43		 sty $43
$06:e994  c0 1d		 cpy #$1d
$06:e996  0f 80 80 7f   ora $7f8080
$06:e99a  02 34		 cop #$34
$06:e99c  0f 84 03 c1   ora $c10384
$06:e9a0  19 8c c4	  ora $c48c,y
$06:e9a3  22 11 28 82   jsl $822811
$06:e9a7  2c 25 32	  bit $3225
$06:e9aa  69 ac ca	  adc #$caac
$06:e9ad  37 19		 and [$19],y
$06:e9af  83 0f		 sta $0f,s
$06:e9b1  42 3f		 wdm #$3f
$06:e9b3  0f 20 09 10   ora $100920
$06:e9b7  67 f0		 adc [$f0]
$06:e9b9  f9 f8 fc	  sbc $fcf8,y
$06:e9bc  11 41		 ora ($41),y
$06:e9be  80 c0		 bra $e980
$06:e9c0  07 43		 ora [$43]
$06:e9c2  41 a0		 eor ($a0,x)
$06:e9c4  90 48		 bcc $ea0e
$06:e9c6  03 61		 ora $61,s
$06:e9c8  b0 a8		 bcs $e972
$06:e9ca  03 c0		 ora $c0,s
$06:e9cc  3a			dec a
$06:e9cd  14 0e		 trb $0e
$06:e9cf  00 b4		 brk #$b4
$06:e9d1  28			plp
$06:e9d2  1e 0e 00	  asl $000e,x
$06:e9d5  78			sei
$06:e9d6  4c e4 2d	  jmp $2de4
$06:e9d9  08			php
$06:e9da  d4 62		 pei ($62)
$06:e9dc  3d 18 45	  and $4518,x
$06:e9df  84 5e		 sty $5e
$06:e9e1  21 28		 and ($28,x)
$06:e9e3  93 8d		 sta ($8d,s),y
$06:e9e5  c2 2d		 rep #$2d
$06:e9e7  10 87		 bpl $e970
$06:e9e9  81 82		 sta ($82,x)
$06:e9eb  3e 7f 03	  rol $037f,x
$06:e9ee  e8			inx
$06:e9ef  10 c6		 bpl $e9b7
$06:e9f1  7e 47 12	  ror $1247,x
$06:e9f4  60			rts
$06:e9f5  43 f2		 eor $f2,s
$06:e9f7  19 0d 86	  ora $860d,y
$06:e9fa  c3 f1		 cmp $f1,s
$06:e9fc  f8			sed
$06:e9fd  b4 5a		 ldy $5a,x
$06:e9ff  33 11		 and ($11,s),y
$06:ea01  8d 43 54	  sta $5443
$06:ea04  03 83		 ora $83,s
$06:ea06  00 c8		 brk #$c8
$06:ea08  40			rti
$06:ea09  36 10		 rol $10,x
$06:ea0b  0f c6 40 54   ora $5440c6
$06:ea0f  02 85		 cop #$85
$06:ea11  84 3d		 sty $3d
$06:ea13  82 1b 09	  brl $f331
$06:ea16  84 bd		 sty $bd
$06:ea18  42 2b		 wdm #$2b
$06:ea1a  12 5b		 ora ($5b)
$06:ea1c  83 d4		 sta $d4,s
$06:ea1e  00 81		 brk #$81
$06:ea20  04 86		 tsb $86
$06:ea22  40			rti
$06:ea23  a1 f0		 lda ($f0,x)
$06:ea25  60			rts
$06:ea26  30 90		 bmi $e9b8
$06:ea28  48			pha
$06:ea29  0a			asl a
$06:ea2a  10 08		 bpl $ea34
$06:ea2c  3f 43 b0 91   and $91b043,x
$06:ea30  04 d8		 tsb $d8
$06:ea32  c8			iny
$06:ea33  2a			rol a
$06:ea34  19 08 87	  ora $8708,y
$06:ea37  40			rti
$06:ea38  36 52		 rol $52,x
$06:ea3a  0f c5 00 d0   ora $d000c5
$06:ea3e  26 58		 rol $58
$06:ea40  81 c7		 sta ($c7,x)
$06:ea42  23 f0		 and $f0,s
$06:ea44  29 8c 3a	  and #$3a8c
$06:ea47  67 1e		 adc [$1e]
$06:ea49  87 c7		 sta [$c7]
$06:ea4b  22 f0 02 60   jsl $6002f0
$06:ea4f  41 e0		 eor ($e0,x)
$06:ea51  0f e6 90 40   ora $4090e6
$06:ea55  25 0f		 and $0f
$06:ea57  e3 f0		 sbc $f0,s
$06:ea59  47 3f		 eor [$3f]
$06:ea5b  92 0e		 sta ($0e)
$06:ea5d  34 e3		 bit $e3,x
$06:ea5f  cd 1c fc	  cmp $fc1c
$06:ea62  47 3e		 eor [$3e]
$06:ea64  90 0f		 bcc $ea75
$06:ea66  e4 01		 cpx $01
$06:ea68  58			cli
$06:ea69  0f e6 81 40   ora $4081e6
$06:ea6d  21 4f		 and ($4f,x)
$06:ea6f  e3 82		 sbc $82,s
$06:ea71  c1 a3		 cmp ($a3,x)
$06:ea73  71 c9		 adc ($c9),y
$06:ea75  1c 72 77	  trb $7772
$06:ea78  06 9b		 asl $9b
$06:ea7a  c3 a7		 cmp $a7,s
$06:ea7c  ef 61 7e 84   sbc $847e61
$06:ea80  61 fc		 adc ($fc,x)
$06:ea82  e0 54		 cpx #$54
$06:ea84  f6 40		 inc $40,x
$06:ea86  3d 10 0e	  and $0e10,x
$06:ea89  b4 83		 ldy $83,x
$06:ea8b  ed 1c ff	  sbc $ff1c
$06:ea8e  40			rti
$06:ea8f  0a			asl a
$06:ea90  e0 1b		 cpx #$1b
$06:ea92  28			plp
$06:ea93  f4 02 39	  pea $3902
$06:ea96  00 84		 brk #$84
$06:ea98  10 26		 bpl $eac0
$06:ea9a  1f 02 8f 40   ora $408f02,x
$06:ea9e  4e 20 8c	  lsr $8c20
$06:eaa1  04 60		 tsb $60
$06:eaa3  c0 20		 cpy #$20
$06:eaa5  6f e1 82 10   adc $1082e1
$06:eaa9  25 fc		 and $fc
$06:eaab  5f 88 2d b2   eor $b22d88,x
$06:eaaf  e5 df		 sbc $df
$06:eab1  f0 67		 beq $eb1a
$06:eab3  ee 17 79	  inc $7917
$06:eab6  84 7a		 sty $7a
$06:eab8  21 b8		 and ($b8,x)
$06:eaba  3e 14 0b	  rol $0b14,x
$06:eabd  05 01		 ora $01
$06:eabf  7f 16 21 da   adc $da2116,x
$06:eac3  10 0a		 bpl $eacf
$06:eac5  03 f8		 ora $f8,s
$06:eac7  67 91		 adc [$91]
$06:eac9  33 a9		 and ($a9,s),y
$06:eacb  1d 60 0e	  ora $0e60,x
$06:eace  08			php
$06:eacf  0c b3 67	  tsb $67b3
$06:ead2  b3 16		 lda ($16,s),y
$06:ead4  5b			tcd
$06:ead5  a7 ea		 lda [$ea]
$06:ead7  57 b4		 eor [$b4],y
$06:ead9  ca			dex
$06:eada  db			stp
$06:eadb  3c d2 42	  bit $42d2,x
$06:eade  88			dey
$06:eadf  3f 81 f6 09   and $09f681,x
$06:eae3  f0 81		 beq $ea66
$06:eae5  40			rti
$06:eae6  55 60		 eor $60,x
$06:eae8  27 01		 and [$01]
$06:eaea  f8			sed
$06:eaeb  44 1f cd	  mvp $cd,$1f
$06:eaee  01 80		 ora ($80,x)
$06:eaf0  c0 e0		 cpy #$e0
$06:eaf2  50 68		 bvc $eb5c
$06:eaf4  24 32		 bit $32
$06:eaf6  13 19		 ora ($19,s),y
$06:eaf8  89 cc dd	  bit #$ddcc
$06:eafb  8e 7a 18	  stx $187a
$06:eafe  34 02		 bit $02,x
$06:eb00  18			clc
$06:eb01  6d 18 45	  adc $4518
$06:eb04  e2 81		 sep #$81
$06:eb06  c0 83		 cpy #$83
$06:eb08  c1 e7		 cmp ($e7,x)
$06:eb0a  f3 ff		 sbc ($ff,s),y
$06:eb0c  87 ff		 sta [$ff]
$06:eb0e  81 ff		 sta ($ff,x)
$06:eb10  83 ff		 sta $ff,s
$06:eb12  c8			iny
$06:eb13  40			rti
$06:eb14  3d 09 fa	  and $fa09,x
$06:eb17  38			sec
$06:eb18  20 1c 04	  jsr $041c
$06:eb1b  06 bc		 asl $bc
$06:eb1d  d8			cld
$06:eb1e  59 67 a3	  eor $a367,y
$06:eb21  10 00		 bpl $eb23
$06:eb23  58			cli
$06:eb24  26 1f		 rol $1f
$06:eb26  0e 00 50	  asl $5000
$06:eb29  63 f1		 adc $f1,s
$06:eb2b  fb			xce
$06:eb2c  fd fc 5e	  sbc $5efc,x
$06:eb2f  8b			phb
$06:eb30  90 11		 bcc $eb43
$06:eb32  92 a4		 sta ($a4)
$06:eb34  30 02		 bmi $eb38
$06:eb36  af 14 73 b9   lda $b97314
$06:eb3a  61 f1		 adc ($f1,x)
$06:eb3c  8b			phb
$06:eb3d  c5 9f		 cmp $9f
$06:eb3f  c1 98		 cmp ($98,x)
$06:eb41  c0 59		 cpy #$59
$06:eb43  c4 20		 cpy $20
$06:eb45  2f 51 08 37   and $370851
$06:eb49  c0 bc		 cpy #$bc
$06:eb4b  06 90		 asl $90
$06:eb4d  57 7a		 eor [$7a],y
$06:eb4f  ff c5 ef 07   sbc $07efc5,x
$06:eb53  86 4f		 stx $4f
$06:eb55  26 f7		 rol $f7
$06:eb57  04 35		 tsb $35
$06:eb59  13 40		 ora ($40,s),y
$06:eb5b  ca			dex
$06:eb5c  03 b1		 ora $b1,s
$06:eb5e  1c 84 2e	  trb $2e84
$06:eb61  13 0c		 ora ($0c,s),y
$06:eb63  85 c2		 sta $c2
$06:eb65  21 30		 and ($30,x)
$06:eb67  88			dey
$06:eb68  45 22		 eor $22
$06:eb6a  e9 cc 25	  sbc #$25cc
$06:eb6d  84 1a		 sty $1a
$06:eb6f  01 04		 ora ($04,x)
$06:eb71  26 08		 rol $08
$06:eb73  84 00		 sty $00
$06:eb75  e3 30		 sbc $30,s
$06:eb77  81 cc		 sta ($cc,x)
$06:eb79  30 1c		 bmi $eb97
$06:eb7b  0a			asl a
$06:eb7c  01 b0		 ora ($b0,x)
$06:eb7e  34 12		 bit $12,x
$06:eb80  0b			phd
$06:eb81  00 50		 brk #$50
$06:eb83  03 03		 ora $03,s
$06:eb85  24 ae		 bit $ae
$06:eb87  59 8e 61	  eor $618e,y
$06:eb8a  c0 80		 cpy #$80
$06:eb8c  04 44		 tsb $44
$06:eb8e  40			rti
$06:eb8f  22 71 8c 60   jsl $608c71
$06:eb93  23 07		 and $07,s
$06:eb95  30 77		 bmi $ec0e
$06:eb97  b5 ae		 lda $ae,x
$06:eb99  91 89		 sta ($89),y
$06:eb9b  e4 7e		 cpx $7e
$06:eb9d  31 07		 and ($07),y
$06:eb9f  a1 00		 lda ($00,x)
$06:eba1  2c 9c 14	  bit $149c
$06:eba4  34 79		 bit $79,x
$06:eba6  81 cc		 sta ($cc,x)
$06:eba8  01 f3		 ora ($f3,x)
$06:ebaa  28			plp
$06:ebab  9a			txs
$06:ebac  49 8e 64	  eor #$648e
$06:ebaf  29 01 1a	  and #$1a01
$06:ebb2  72 22		 adc ($22)
$06:ebb4  02 b0		 cop #$b0
$06:ebb6  68			pla
$06:ebb7  34 2a		 bit $2a,x
$06:ebb9  05 01		 ora $01
$06:ebbb  9f 62 f4 56   sta $56f462,x
$06:ebbf  c9 53 41	  cmp #$4153
$06:ebc2  a3 a4		 lda $a4,s
$06:ebc4  01 ae		 ora ($ae,x)
$06:ebc6  c0 3a		 cpy #$3a
$06:ebc8  30 86		 bmi $eb50
$06:ebca  83 60		 sta $60,s
$06:ebcc  30 14		 bmi $ebe2
$06:ebce  0a			asl a
$06:ebcf  00 50		 brk #$50
$06:ebd1  26 12		 rol $12
$06:ebd3  06 84		 asl $84
$06:ebd5  60			rts
$06:ebd6  24 1c		 bit $1c
$06:ebd8  03 60		 ora $60,s
$06:ebda  86 02		 stx $02
$06:ebdc  21 10		 and ($10,x)
$06:ebde  92 49		 sta ($49)
$06:ebe0  25 31		 and $31
$06:ebe2  99 fb 41	  sta $41fb,y
$06:ebe5  d3 c0		 cmp ($c0,s),y
$06:ebe7  2e 00 08	  rol $0800
$06:ebea  38			sec
$06:ebeb  5a			phy
$06:ebec  02 41		 cop #$41
$06:ebee  08			php
$06:ebef  14 36		 trb $36
$06:ebf1  1b			tcs
$06:ebf2  03 81		 ora $81,s
$06:ebf4  42 a1		 wdm #$a1
$06:ebf6  90 c6		 bcc $ebbe
$06:ebf8  43 0c		 eor $0c,s
$06:ebfa  02 00		 cop #$00
$06:ebfc  d9 62 f8	  cmp $f862,y
$06:ebff  41 a4		 eor ($a4,x)
$06:ec01  f2 6b		 sbc ($6b)
$06:ec03  3c 32 9e	  bit $9e32,x
$06:ec06  f3 0a		 sbc ($0a,s),y
$06:ec08  47 3e		 eor [$3e]
$06:ec0a  33 9f		 and ($9f,s),y
$06:ec0c  7c 90 b8	  jmp ($b890,x)
$06:ec0f  05 c1		 ora $c1
$06:ec11  30 01		 bmi $ec14
$06:ec13  1d 80 10	  ora $1080,x
$06:ec16  71 ef		 adc ($ef),y
$06:ec18  f4 e3 f1	  pea $f1e3
$06:ec1b  61 f0		 adc ($f0,x)
$06:ec1d  71 f8		 adc ($f8),y
$06:ec1f  1c fe 06	  trb $06fe
$06:ec22  7f 07 9f c3   adc $c39f07,x
$06:ec26  cf e0 e4 10   cmp $10e4e0
$06:ec2a  83 c0		 sta $c0,s
$06:ec2c  23 f0		 and $f0,s
$06:ec2e  05 b8		 ora $b8
$06:ec30  2d c2 ff	  and $ffc2
$06:ec33  03 bf		 ora $bf,s
$06:ec35  c1 ff		 cmp ($ff,x)
$06:ec37  f0 78		 beq $ecb1
$06:ec39  44 62 13	  mvp $13,$62
$06:ec3c  19 88 cc	  ora $cc88,y
$06:ec3f  62 73 38	  per $24b5
$06:ec42  1c 8e 4f	  trb $4f8e
$06:ec45  67 1c		 adc [$1c]
$06:ec47  90 84		 bcc $ebcd
$06:ec49  18			clc
$06:ec4a  a1 0e		 lda ($0e,x)
$06:ec4c  72 0c		 adc ($0c)
$06:ec4e  71 84		 adc ($84),y
$06:ec50  24 92		 bit $92
$06:ec52  fe 7f 3e	  inc $3e7f,x
$06:ec55  1f 0e 18 59   ora $59180e,x
$06:ec59  a1 e5		 lda ($e5,x)
$06:ec5b  b0 81		 bcs $ebde
$06:ec5d  c0 21		 cpy #$21
$06:ec5f  e2 48		 sep #$48
$06:ec61  87 9a		 sta [$9a]
$06:ec63  c2 05		 rep #$05
$06:ec65  06 82		 asl $82
$06:ec67  c3 0e		 cmp $0e,s
$06:ec69  21 0a		 and ($0a,x)
$06:ec6b  84 42		 sty $42
$06:ec6d  a3 10		 lda $10,s
$06:ec6f  58			cli
$06:ec70  89 e4 22	  bit #$22e4
$06:ec73  b1 16		 lda ($16),y
$06:ec75  80 17		 bra $ec8e
$06:ec77  c0 be		 cpy #$be
$06:ec79  02 10		 cop #$10
$06:ec7b  10 81		 bpl $ebfe
$06:ec7d  0c 11 25	  tsb $2511
$06:ec80  9c 8e 4c	  stz $4c8e
$06:ec83  e6 16		 inc $16
$06:ec85  fb			xce
$06:ec86  07 7f		 ora [$7f]
$06:ec88  87 bf		 sta [$bf]
$06:ec8a  c7 a5		 cmp [$a5]
$06:ec8c  c2 ff		 rep #$ff
$06:ec8e  1f 4d 87 8e   ora $8e874d,x
$06:ec92  01 cf		 ora ($cf,x)
$06:ec94  80 67		 bra $ecfd
$06:ec96  cc 80 2a	  cpy $2a80
$06:ec99  08			php
$06:ec9a  7a			ply
$06:ec9b  9c 3f f1	  stz $f13f
$06:ec9e  f5 58		 sbc $58,x
$06:eca0  33 0e		 and ($0e,s),y
$06:eca2  06 b3		 asl $b3
$06:eca4  08			php
$06:eca5  14 0a		 trb $0a
$06:eca7  07 06		 ora [$06]
$06:eca9  80 c1		 bra $ec6c
$06:ecab  17 60		 ora [$60],y
$06:ecad  e6 60		 inc $60
$06:ecaf  f8			sed
$06:ecb0  1f d2 b1 c0   ora $c0b1d2,x
$06:ecb4  d1 e0		 cmp ($e0),y
$06:ecb6  29 f0 3c	  and #$3cf0
$06:ecb9  fc 3f 7f	  jsr ($7f3f,x)
$06:ecbc  1f 9f a7 02   ora $02a79f,x
$06:ecc0  7e db 01	  ror $01db,x
$06:ecc3  38			sec
$06:ecc4  c0 3f f0	  cpy #$f03f
$06:ecc7  33 58		 and ($58,s),y
$06:ecc9  c7 d5		 cmp [$d5]
$06:eccb  63 3f		 adc $3f,s
$06:eccd  75 87		 adc $87,x
$06:eccf  d3 19		 cmp ($19,s),y
$06:ecd1  d3 e3		 cmp ($e3,s),y
$06:ecd3  ca			dex
$06:ecd4  3c 71 79	  bit $7971,x
$06:ecd7  84 4e		 sty $4e
$06:ecd9  21 09		 and ($09,x)
$06:ecdb  8c 4f 27	  sty $274f
$06:ecde  90 89		 bcc $ec69
$06:ece0  cd 2e 61	  cmp $612e
$06:ece3  04 9c		 tsb $9c
$06:ece5  48			pha
$06:ece6  e3 93		 sbc $93,s
$06:ece8  08			php
$06:ece9  7c 42 1f	  jmp ($1f42,x)
$06:ecec  38			sec
$06:eced  83 c3		 sta $c3,s
$06:ecef  20 70 98	  jsr $9870
$06:ecf2  35 7a		 and $7a,x
$06:ecf4  c5 96		 cmp $96
$06:ecf6  e3 4a		 sbc $4a,s
$06:ecf8  31 dd		 and ($dd),y
$06:ecfa  08			php
$06:ecfb  c6 42		 dec $42
$06:ecfd  21 20		 and ($20,x)
$06:ecff  98			tya
$06:ed00  5e 2f 12	  lsr $122f,x
$06:ed03  09 c6 92	  ora #$92c6
$06:ed06  31 40		 and ($40),y
$06:ed08  9c 62 2e	  stz $2e62
$06:ed0b  11 8f		 ora ($8f),y
$06:ed0d  04 43		 tsb $43
$06:ed0f  c1 38		 cmp ($38,x)
$06:ed11  e0 58 30	  cpx #$3058
$06:ed14  12 0e		 ora ($0e)
$06:ed16  06 d3		 asl $d3
$06:ed18  19 54 e6	  ora $e654,y
$06:ed1b  44 e8 e0	  mvp $e0,$e8
$06:ed1e  20 87 c8	  jsr $c887
$06:ed21  22 f1 08 14   jsl $1408f1
$06:ed25  42 73		 wdm #$73
$06:ed27  39 a1 cc	  and $cca1,y
$06:ed2a  21 60		 and ($60,x)
$06:ed2c  03 90		 ora $90,s
$06:ed2e  47 c0		 eor [$c0]
$06:ed30  e0 07 0a	  cpx #$0a07
$06:ed33  48			pha
$06:ed34  38			sec
$06:ed35  2c 75 ab	  bit $ab75
$06:ed38  1e 47 8b	  asl $8b47,x
$06:ed3b  aa			tax
$06:ed3c  c7 74		 cmp [$74]
$06:ed3e  63 61		 adc $61,s
$06:ed40  90 84		 bcc $ecc6
$06:ed42  5e 33 19	  lsr $1933,x
$06:ed45  0c 24 60	  tsb $6024
$06:ed48  3e 14 29	  rol $2914,x
$06:ed4b  c6 24		 dec $24
$06:ed4d  48			pha
$06:ed4e  22 90 b8 60   jsl $60b890
$06:ed52  30 96		 bmi $ecea
$06:ed54  0f 6c 42 2d   ora $2d426c
$06:ed58  00 86		 brk #$86
$06:ed5a  cf 60 10 f8   cmp $f81060
$06:ed5e  0c 09 8e	  tsb $8e09
$06:ed61  70 2d		 bvs $ed90
$06:ed63  1b			tcs
$06:ed64  88			dey
$06:ed65  20 14 25	  jsr $2514
$06:ed68  fb			xce
$06:ed69  31 86		 and ($86),y
$06:ed6b  69 24 ac	  adc #$ac24
$06:ed6e  50 27		 bvc $ed97
$06:ed70  d8			cld
$06:ed71  2b			pld
$06:ed72  06 12		 asl $12
$06:ed74  f5 a2		 sbc $a2,x
$06:ed76  96 f9		 stx $f9,y
$06:ed78  f0 5f		 beq $edd9
$06:ed7a  be 25 17	  ldx $1725,y
$06:ed7d  89 18 c0	  bit #$c018
$06:ed80  4f 20 57 cc   eor $cc5720
$06:ed84  e5 8b		 sbc $8b
$06:ed86  3d 40 dd	  and $dd40,x
$06:ed89  c0 17 c1	  cpy #$c117
$06:ed8c  ba			tsx
$06:ed8d  60			rts
$06:ed8e  04 21		 tsb $21
$06:ed90  60			rts
$06:ed91  10 48		 bpl $eddb
$06:ed93  24 2a		 bit $2a
$06:ed95  15 04		 ora $04,x
$06:ed97  86 43		 stx $43
$06:ed99  e0 70 48	  cpx #$4870
$06:ed9c  14 09		 trb $09
$06:ed9e  0a			asl a
$06:ed9f  70 85		 bvs $ed26
$06:eda1  50 af		 bvc $ed52
$06:eda3  48			pha
$06:eda4  f2 50		 sbc ($50)
$06:eda6  f8			sed
$06:eda7  04 fe		 tsb $fe
$06:eda9  01 7f		 ora ($7f,x)
$06:edab  69 2b 44	  adc #$442b
$06:edae  19 e0 de	  ora $dee0,y
$06:edb1  e8			inx
$06:edb2  84 42		 sty $42
$06:edb4  51 28		 eor ($28),y
$06:edb6  88			dey
$06:edb7  40			rti
$06:edb8  2a			rol a
$06:edb9  94 47		 sty $47,x
$06:edbb  a8			tay
$06:edbc  be 41 ec	  ldx $ec41,y
$06:edbf  2e e1 9c	  rol $9ce1
$06:edc2  00 86		 brk #$86
$06:edc4  f8			sed
$06:edc5  05 64		 ora $64
$06:edc7  28			plp
$06:edc8  47 e3		 eor [$e3]
$06:edca  f4 0a 06	  pea $060a
$06:edcd  ff 08 13 00   sbc $001308,x
$06:edd1  88			dey
$06:edd2  21 56		 and ($56,x)
$06:edd4  3f 3f bf df   and $dfbf3f,x
$06:edd8  ff e2 30 08   sbc $0830e2,x
$06:eddc  03 7a		 ora $7a,s
$06:edde  20 30 15	  jsr $1530
$06:ede1  98			tya
$06:ede2  42 e1		 wdm #$e1
$06:ede4  10 78		 bpl $ee5e
$06:ede6  1c 5e 26	  trb $265e
$06:ede9  86 68		 stx $68
$06:edeb  1c 1e 0f	  trb $0f1e
$06:edee  0f 25 08 a9   ora $a90825
$06:edf2  c2 61		 rep #$61
$06:edf4  a0 90 70	  ldy #$7090
$06:edf7  30 1d		 bmi $ee16
$06:edf9  0c 82 15	  tsb $1582
$06:edfc  b0 1c		 bcs $ee1a
$06:edfe  0e 07 80	  asl $8007
$06:ee01  d4 3f		 pei ($3f)
$06:ee03  04 29		 tsb $29
$06:ee05  40			rti
$06:ee06  e0 70 98	  cpx #$9870
$06:ee09  44 5e 20	  mvp $20,$5e
$06:ee0c  b9 09 7c	  lda $7c09,y
$06:ee0f  9e 7f 27	  stz $277f,x
$06:ee12  73 19		 adc ($19,s),y
$06:ee14  1c 09 82	  trb $8209
$06:ee17  88			dey
$06:ee18  19 f8 88	  ora $88f8,y
$06:ee1b  0c 67 80	  tsb $8067
$06:ee1e  90 48		 bcc $ee68
$06:ee20  3a			dec a
$06:ee21  11 0f		 ora ($0f),y
$06:ee23  06 03		 asl $03
$06:ee25  d1 c8		 cmp ($c8),y
$06:ee27  fc 72 0c	  jsr ($0c72,x)
$06:ee2a  4a			lsr a
$06:ee2b  6c 15 40	  jmp ($4015)
$06:ee2e  fe 15 60	  inc $6015,x
$06:ee31  73 08		 adc ($08,s),y
$06:ee33  64 32		 stz $32
$06:ee35  67 30		 adc [$30]
$06:ee37  97 c8		 sta [$c8],y
$06:ee39  6b			rtl
$06:ee3a  f4 7a fd	  pea $fd7a
$06:ee3d  3f 7f 8f df   and $df8f7f,x
$06:ee41  e7 ce		 sbc [$ce]
$06:ee43  42 4a		 wdm #$4a
$06:ee45  04 60		 tsb $60
$06:ee47  88			dey
$06:ee48  c0 46 42	  cpy #$4246
$06:ee4b  50 49		 bvc $ee96
$06:ee4d  85 82		 sta $82
$06:ee4f  c1 98		 cmp ($98,x)
$06:ee51  8c 7a 21	  sty $217a
$06:ee54  1f 4e 27 d3   ora $d3274e,x
$06:ee58  c9 fa f1	  cmp #$f1fa
$06:ee5b  7e be 49	  ror $49be,x
$06:ee5e  21 35		 and ($35,x)
$06:ee60  02 b0		 cop #$b0
$06:ee62  7f 1f c7 38   adc $38c71f,x
$06:ee66  7f 3f ce b0   adc $b0ce3f,x
$06:ee6a  95 c6		 sta $c6,x
$06:ee6c  66 52		 ror $52
$06:ee6e  69 1d da	  adc #$da1d
$06:ee71  cf 3a ba 46   cmp $46ba3a
$06:ee75  a7 d0		 lda [$d0]
$06:ee77  08			php
$06:ee78  78			sei
$06:ee79  d4 20		 pei ($20)
$06:ee7b  10 88		 bpl $ee05
$06:ee7d  25 16		 and $16
$06:ee7f  11 05		 ora ($05),y
$06:ee81  84 3f		 sty $3f
$06:ee83  40			rti
$06:ee84  0a			asl a
$06:ee85  40			rti
$06:ee86  a2 d4 4c	  ldx #$4cd4
$06:ee89  33 1c		 and ($1c,s),y
$06:ee8b  8c 47 72	  sty $7247
$06:ee8e  99 b8 ae	  sta $aeb8,y
$06:ee91  6c 3f 0d	  jmp ($0d3f)
$06:ee94  00 2b		 brk #$2b
$06:ee96  04 02		 tsb $02
$06:ee98  41 40		 eor ($40,x)
$06:ee9a  a2 07 c2	  ldx #$c207
$06:ee9d  40			rti
$06:ee9e  0a			asl a
$06:ee9f  33 30		 and ($30,s),y
$06:eea1  0a			asl a
$06:eea2  86 d1		 stx $d1
$06:eea4  7b			tdc
$06:eea5  ad ca 6c	  lda $6cca
$06:eea8  51 69		 eor ($69),y
$06:eeaa  9c 9a 0d	  stz $0d9a
$06:eead  58			cli
$06:eeae  9b			txy
$06:eeaf  4e 63 f1	  lsr $f163
$06:eeb2  85 10		 sta $10
$06:eeb4  42 e0		 wdm #$e0
$06:eeb6  8f f0 01 80   sta $8001f0
$06:eeba  04 24		 tsb $24
$06:eebc  22 54 80 5e   jsl $5e8054
$06:eec0  2d 9a c9	  and $c99a
$06:eec3  c6 73		 dec $73
$06:eec5  a1 9c		 lda ($9c,x)
$06:eec7  e0 5f 28	  cpx #$285f
$06:eeca  13 80		 ora ($80,s),y
$06:eecc  f8			sed
$06:eecd  70 0d		 bvs $eedc
$06:eecf  c1 60		 cmp ($60,x)
$06:eed1  4a			lsr a
$06:eed2  05 02		 ora $02
$06:eed4  80 22		 bra $eef8
$06:eed6  11 58		 ora ($58),y
$06:eed8  70 20		 bvs $eefa
$06:eeda  13 00		 ora ($00,s),y
$06:eedc  50 c3		 bvc $eea1
$06:eede  60			rts
$06:eedf  11 f8		 ora ($f8),y
$06:eee1  04 7a		 tsb $7a
$06:eee3  02 73		 cop #$73
$06:eee5  08			php
$06:eee6  ec 02 19	  cpx $1902
$06:eee9  00 81		 brk #$81
$06:eeeb  02 86		 cop #$86
$06:eeed  06 08		 asl $08
$06:eeef  53 d8		 eor ($d8,s),y
$06:eef1  1f d3 1d 3f   ora $3f1dd3,x
$06:eef5  bd 61 f9	  lda $f961,x
$06:eef8  ff 28 ff 83   sbc $83ff28,x
$06:eefc  bf c0 bf 50   lda $50bfc0,x
$06:ef00  3f 04 d0 34   and $34d004,x
$06:ef04  0c 18 f4	  tsb $f418
$06:ef07  62 40 33	  per $224a
$06:ef0a  82 a8 b5	  brl $a4b5
$06:ef0d  49 c1 54	  eor #$54c1
$06:ef10  92 cd		 sta ($cd)
$06:ef12  97 dc		 sta [$dc],y
$06:ef14  af f6 f6 d5   lda $d5f6f6
$06:ef18  1d e5 44	  ora $44e5,x
$06:ef1b  79 8b dd	  adc $dd8b,y
$06:ef1e  67 17		 adc [$17]
$06:ef20  c7 fe		 cmp [$fe]
$06:ef22  13 43		 ora ($43,s),y
$06:ef24  ff ff 07 8f   sbc $8f07ff,x
$06:ef28  3c 1e 8c	  bit $8c1e,x
$06:ef2b  a3 08		 lda $08,s
$06:ef2d  80 88		 bra $eeb7
$06:ef2f  c2 00		 rep #$00
$06:ef31  ca			dex
$06:ef32  28			plp
$06:ef33  3c 0e 17	  bit $170e,x
$06:ef36  08			php
$06:ef37  82 41 20	  brl $0f7b
$06:ef3a  28			plp
$06:ef3b  14 4e		 trb $4e
$06:ef3d  0c 3e 1f	  tsb $1f3e
$06:ef40  07 87		 ora [$87]
$06:ef42  c0 e0 e8	  cpy #$e8e0
$06:ef45  05 4e		 ora $4e
$06:ef47  16 03		 asl $03,x
$06:ef49  40			rti
$06:ef4a  64 0a		 stz $0a
$06:ef4c  03 7a		 ora $7a,s
$06:ef4e  3c 1e 0e	  bit $0e1e,x
$06:ef51  07 83		 ora [$83]
$06:ef53  00 9f		 brk #$9f
$06:ef55  06 f3		 asl $f3
$06:ef57  cb			wai
$06:ef58  e4 e4		 cpx $e4
$06:ef5a  20 8b c4	  jsr $c48b
$06:ef5d  21 30		 and ($30,x)
$06:ef5f  88			dey
$06:ef60  1a			inc a
$06:ef61  24 19		 bit $19
$06:ef63  47 1f		 eor [$1f]
$06:ef65  9f c7 e3 f0   sta $f0e3c7,x
$06:ef69  f8			sed
$06:ef6a  f9 04 20	  sbc $2004,y
$06:ef6d  07 85		 ora [$85]
$06:ef6f  f4 72 0c	  pea $0c72
$06:ef72  41 d0		 eor ($d0,x)
$06:ef74  88			dey
$06:ef75  48			pha
$06:ef76  24 18		 bit $18
$06:ef78  06 da		 asl $da
$06:ef7a  fc 3f 1f	  jsr ($1f3f,x)
$06:ef7d  0f 87 83 e0   ora $e08387
$06:ef81  61 06		 adc ($06,x)
$06:ef83  d3 6f		 cmp ($6f,s),y
$06:ef85  f1 f5		 sbc ($f5),y
$06:ef87  fa			plx
$06:ef88  7d 7e 8f	  adc $8f7e,x
$06:ef8b  2f 90 cc e6   and $e6cc90
$06:ef8f  10 c8		 bpl $ef59
$06:ef91  61 dc		 adc ($dc,x)
$06:ef93  af ff f9 fd   lda $fdf9ff
$06:ef97  fd 82 07	  sbc $0782,x
$06:ef9a  f0 87		 beq $ef23
$06:ef9c  cf e0 68 63   cmp $6368e0
$06:efa0  fd 78 be	  sbc $be78,x
$06:efa3  9e 4f a7	  stz $a74f,x
$06:efa6  13 d1		 ora ($d1,s),y
$06:efa8  08			php
$06:efa9  cc 46 2c	  cpy $2c46
$06:efac  16 04		 asl $04,x
$06:efae  b9 7f 3f	  lda $3f7f,y
$06:efb1  df 8f e3 84   cmp $84e38f,x
$06:efb5  13 e1		 ora ($e1,s),y
$06:efb7  e0 fc 60	  cpx #$60fc
$06:efba  14 ce		 trb $ce
$06:efbc  6d 05 c8	  adc $c805
$06:efbf  1c c0 de	  trb $dec0
$06:efc2  13 f9		 ora ($f9,s),y
$06:efc4  7a			ply
$06:efc5  c4 1d		 cpy $1d
$06:efc7  eb			xba
$06:efc8  03 88		 ora $88,s
$06:efca  43 e4		 eor $e4,s
$06:efcc  f1 f9		 sbc ($f9),y
$06:efce  7c 7e 9f	  jmp ($9f7e,x)
$06:efd1  3f 76 a3 64   and $64a376,x
$06:efd5  12 60		 ora ($60)
$06:efd7  8f 0f c7 a1   sta $a1c70f
$06:efdb  a2 00 f5	  ldx #$f500
$06:efde  c0 44 3c	  cpy #$3c44
$06:efe1  1c 8f 87	  trb $878f
$06:efe4  a3 e1		 lda $e1,s
$06:efe6  e4 fc		 cpx $fc
$06:efe8  3b			tsc
$06:efe9  fc 7e 60	  jsr ($607e,x)
$06:efec  5f 0b 78 9e   eor $9e780b,x
$06:eff0  97 61		 sta [$61],y
$06:eff2  04 83		 tsb $83
$06:eff4  c5 20		 cmp $20
$06:eff6  f5 c8		 sbc $c8,x
$06:eff8  3c aa 17	  bit $17aa,x
$06:effb  7c b6 ab	  jmp ($abb6,x)
$06:effe  42 49		 wdm #$49
$06:f000  24 86		 bit $86
$06:f002  43 e3		 eor $e3,s
$06:f004  11 fa		 ora ($fa),y
$06:f006  c5 7f		 cmp $7f
$06:f008  f1 ff		 sbc ($ff),y
$06:f00a  fa			plx
$06:f00b  7f f2 5f f1   adc $f15ff2,x
$06:f00f  f9 70 30	  sbc $3070,y
$06:f012  0d a0 a0	  ora $a0a0
$06:f015  60			rts
$06:f016  3f 1b 08 a5   and $a5081b,x
$06:f01a  c3 31		 cmp $31,s
$06:f01c  fc 84 42	  jsr ($4284,x)
$06:f01f  38			sec
$06:f020  1c 0b 07	  trb $070b
$06:f023  82 d1 e8	  brl $d8f7
$06:f026  be 7f 29	  ldx $297f,y
$06:f029  9f cc 77 fa   sta $fa77cc,x
$06:f02d  05 fe		 ora $fe
$06:f02f  31 84		 and ($84),y
$06:f031  12 01		 ora ($01)
$06:f033  08			php
$06:f034  80 42		 bra $f078
$06:f036  e0 72 68	  cpx #$6872
$06:f039  19 ec 2b	  ora $2bec,y
$06:f03c  95 fd		 sta $fd,x
$06:f03e  87 fe		 sta [$fe]
$06:f040  0b			phd
$06:f041  05 96		 ora $96
$06:f043  cb			wai
$06:f044  67 f3		 adc [$f3]
$06:f046  fb			xce
$06:f047  e5 fd		 sbc $fd
$06:f049  8a			txa
$06:f04a  17 4b		 ora [$4b],y
$06:f04c  fe 83 ff	  inc $ff83,x
$06:f04f  00 66		 brk #$66
$06:f051  03 ac		 ora $ac,s
$06:f053  78			sei
$06:f054  0e b1 90	  asl $90b1
$06:f057  58			cli
$06:f058  34 1e		 bit $1e,x
$06:f05a  08			php
$06:f05b  a7 c2		 lda [$c2]
$06:f05d  39 d0 c0	  and $c0d0,y
$06:f060  60			rts
$06:f061  14 21		 trb $21
$06:f063  e0 f0 7c	  cpx #$7cf0
$06:f066  3e 19 2f	  rol $2f19,x
$06:f069  94 73		 sty $73,x
$06:f06b  f9 0e ff	  sbc $ff0e,y
$06:f06e  4b			phk
$06:f06f  95 c3		 sta $c3,x
$06:f071  01 80		 ora ($80,x)
$06:f073  50 e0		 bvc $f055
$06:f075  68			pla
$06:f076  30 84		 bmi $effc
$06:f078  43 e2		 eor $e2,s
$06:f07a  11 f7		 ora ($f7),y
$06:f07c  c9 48 64	  cmp #$6448
$06:f07f  36 3b		 rol $3b,x
$06:f081  1d 32 9e	  ora $9e32,x
$06:f084  f9 0a 85	  sbc $850a,y
$06:f087  7e c1 7f	  ror $7fc1,x
$06:f08a  04 93		 tsb $93
$06:f08c  44 1a 21	  mvp $21,$1a
$06:f08f  90 c0		 bcc $f051
$06:f091  78			sei
$06:f092  30 1b		 bmi $f0af
$06:f094  07 00		 ora [$00]
$06:f096  cc 3e 11	  cpy $113e
$06:f099  0f 86 0b 05   ora $050b86
$06:f09d  d0 e8		 bne $f087
$06:f09f  5c 3e 02 30   jml $30023e
$06:f0a3  bc 7e 27	  ldy $277e,x
$06:f0a6  1f 88 40 a8   ora $a84088,x
$06:f0aa  4c 60 30	  jmp $3060
$06:f0ad  f1 f5		 sbc ($f5),y
$06:f0af  ce 27 15	  dec $1527
$06:f0b2  4a			lsr a
$06:f0b3  26 eb		 rol $eb
$06:f0b5  25 fe		 and $fe
$06:f0b7  dd 14 c0	  cmp $c014,x
$06:f0ba  a2 04 f0	  ldx #$f004
$06:f0bd  26 1d		 rol $1d
$06:f0bf  f2 f9		 sbc ($f9)
$06:f0c1  fe 31 91	  inc $9131,x
$06:f0c4  84 09		 sty $09
$06:f0c6  c0 3e 77	  cpy #$773e
$06:f0c9  88			dey
$06:f0ca  41 e0		 eor ($e0,x)
$06:f0cc  10 f3		 bpl $f0c1
$06:f0ce  c8			iny
$06:f0cf  c7 cd		 cmp [$cd]
$06:f0d1  fe 3e 6e	  inc $6e3e,x
$06:f0d4  04 03		 tsb $03
$06:f0d6  c0 99 1f	  cpy #$1f99
$06:f0d9  82 3f c7	  brl $b81b
$06:f0dc  c5 03		 cmp $03
$06:f0de  3d 99 f8	  and $f899,x
$06:f0e1  27 eb		 and [$eb]
$06:f0e3  b1 58		 lda ($58),y
$06:f0e5  78			sei
$06:f0e6  f8			sed
$06:f0e7  42 20		 wdm #$20
$06:f0e9  ac 24 f0	  ldy $f024
$06:f0ec  0b			phd
$06:f0ed  80 5c		 bra $f14b
$06:f0ef  8d 49 af	  sta $af49
$06:f0f2  d3 ef		 cmp ($ef,s),y
$06:f0f4  ef 00 a3 d7   sbc $d7a300
$06:f0f8  e8			inx
$06:f0f9  35 fa		 and $fa,x
$06:f0fb  64 9e		 stz $9e
$06:f0fd  47 07		 eor [$07]
$06:f0ff  8e de ea	  stx $eade
$06:f102  34 f9		 bit $f9,x
$06:f104  fb			xce
$06:f105  fc 28 f3	  jsr ($f328,x)
$06:f108  fa			plx
$06:f109  0c fe 99	  tsb $99fe
$06:f10c  3f 91 d7 e3   and $e3d791,x
$06:f110  b6 3a		 ldx $3a,y
$06:f112  8c ff e9	  sty $e9ff
$06:f115  e4 fe		 cpx $fe
$06:f117  04 03		 tsb $03
$06:f119  89 f4 82	  bit #$82f4
$06:f11c  7d 2c 9c	  adc $9c2c,x
$06:f11f  8c 47 02	  sty $0247
$06:f122  e1 bc		 sbc ($bc,x)
$06:f124  8a			txa
$06:f125  79 3f 01	  adc $013f,y
$06:f128  f0 e2		 beq $f10c
$06:f12a  7e 20 9f	  ror $9f20,x
$06:f12d  8b			phb
$06:f12e  27 e3		 and [$e3]
$06:f130  11 f4		 ora ($f4),y
$06:f132  b8			clv
$06:f133  63 22		 adc $22,s
$06:f135  8e e2 a3	  stx $a3e2
$06:f138  df e8 75 ca   cmp $ca75e8,x
$06:f13c  85 79		 sta $79
$06:f13e  f0 13		 beq $f153
$06:f140  b8			clv
$06:f141  1b			tcs
$06:f142  f0 c0		 beq $f104
$06:f144  61 43		 adc ($43,x)
$06:f146  9f d4 00 c3   sta $c300d4,x
$06:f14a  3b			tsc
$06:f14b  a3 82		 lda $82,s
$06:f14d  d7 89		 cmp [$89],y
$06:f14f  fc c2 5d	  jsr ($5dc2,x)
$06:f152  22 81 71 dc   jsl $dc7181
$06:f156  60			rts
$06:f157  03 86		 ora $86,s
$06:f159  23 0c		 and $0c,s
$06:f15b  27 e0		 and [$e0]
$06:f15d  5a			phy
$06:f15e  02 70		 cop #$70
$06:f160  dc 71 05	  jml [$0571]
$06:f163  65 22		 adc $22
$06:f165  f7 c4		 sbc [$c4],y
$06:f167  3d f9 0f	  and $0ff9,x
$06:f16a  fc a3 df	  jsr ($dfa3,x)
$06:f16d  3c f7 c0	  bit $c0f7,x
$06:f170  fc f0 8f	  jsr ($8ff0,x)
$06:f173  3c 72 cf	  bit $cf72,x
$06:f176  10 ff		 bpl $f177
$06:f178  9f c2 04 80   sta $8004c2,x
$06:f17c  13 f8		 ora ($f8,s),y
$06:f17e  46 11		 lsr $11
$06:f180  03 98		 ora $98,s
$06:f182  ff c6 bf d1   sbc $d1bfc6,x
$06:f186  4f e4 4b e5   eor $e54be4
$06:f18a  30 fb		 bmi $f187
$06:f18c  5a			phy
$06:f18d  3d da 0f	  and $0fda,x
$06:f190  74 83		 stz $83,x
$06:f192  dd 30 f6	  cmp $f630,x
$06:f195  40			rti
$06:f196  3f d0 2f f6   and $f62fd0,x
$06:f19a  33 fd		 and ($fd,s),y
$06:f19c  08			php
$06:f19d  ff 44 14 c7   sbc $c71444,x
$06:f1a1  12 ff		 ora ($ff)
$06:f1a3  48			pha
$06:f1a4  3d f0 8f	  and $8ff0,x
$06:f1a7  7a			ply
$06:f1a8  34 0e		 bit $0e,x
$06:f1aa  a1 a8		 lda ($a8,x)
$06:f1ac  f7 f5		 sbc [$f5],y
$06:f1ae  38			sec
$06:f1af  f2 39		 sbc ($39)
$06:f1b1  1c 52 00	  trb $0052
$06:f1b4  7f 28 07 fe   adc $fe0728,x
$06:f1b8  24 80		 bit $80
$06:f1ba  19 c7 ff	  ora $ffc7,y
$06:f1bd  b9 ff bf	  lda $bfff,y
$06:f1c0  df e1 16 08   cmp $0816e1,x
$06:f1c4  27 92		 and [$92]
$06:f1c6  15 ee		 ora $ee,x
$06:f1c8  9d 7b af	  sta $af7b,x
$06:f1cb  1c ee c6	  trb $c6ee
$06:f1ce  3b			tsc
$06:f1cf  81 ce		 sta ($ce,x)
$06:f1d1  c9 73 b3	  cmp #$b373
$06:f1d4  df e4 78 29   cmp $2978e4,x
$06:f1d8  c3 21		 cmp $21,s
$06:f1da  fe 98 7f	  inc $7f98,x
$06:f1dd  ae 0e 61	  ldx $610e
$06:f1e0  75 8c		 adc $8c,x
$06:f1e2  76 a1		 ror $a1,x
$06:f1e4  5f f1 70 e3   eor $e370f1,x
$06:f1e8  b8			clv
$06:f1e9  1d f7 82	  ora $82f7,x
$06:f1ec  cb			wai
$06:f1ed  e4 9f		 cpx $9f
$06:f1ef  7b			tdc
$06:f1f0  a2 16 ff	  ldx #$ff16
$06:f1f3  17 ff		 ora [$ff],y
$06:f1f5  41 ff		 eor ($ff,x)
$06:f1f7  9e 7f ef	  stz $ef7f,x
$06:f1fa  df f8 ff fe   cmp $fefff8,x
$06:f1fe  37 ff		 and [$ff],y
$06:f200  88			dey
$06:f201  ff ce 61 10   sbc $1061ce,x
$06:f205  f8			sed
$06:f206  47 3f		 eor [$3f]
$06:f208  92 6f		 sta ($6f)
$06:f20a  f7 63		 sbc [$63],y
$06:f20c  f5 12		 sbc $12,x
$06:f20e  fb			xce
$06:f20f  69 3c d5	  adc #$d53c
$06:f212  8a			txa
$06:f213  74 43		 stz $43,x
$06:f215  d9 0c fe	  cmp $fe0c,y
$06:f218  28			plp
$06:f219  41 3e		 eor ($3e,x)
$06:f21b  10 45		 bpl $f262
$06:f21d  20 c6 3f	  jsr $3fc6
$06:f220  db			stp
$06:f221  05 60		 ora $60
$06:f223  c0 05 e1	  cpy #$e105
$06:f226  10 80		 bpl $f1a8
$06:f228  4e 20 17	  lsr $1720
$06:f22b  c1 98		 cmp ($98,x)
$06:f22d  8c 80 76	  sty $7680
$06:f230  83 2e		 sta $2e,s
$06:f232  1a			inc a
$06:f233  11 50		 ora ($50),y
$06:f235  86 80		 stx $80
$06:f237  4c f1 f8	  jmp $f8f1
$06:f23a  c3 cd		 cmp $cd,s
$06:f23c  e3 07		 sbc $07,s
$06:f23e  80 40		 bra $f280
$06:f240  47 6a		 eor [$6a]
$06:f242  6e f8 07	  ror $07f8
$06:f245  81 1e		 sta ($1e,x)
$06:f247  3c 03 bb	  bit $bb03,x
$06:f24a  a3 be		 lda $be,s
$06:f24c  01 3f		 ora ($3f,x)
$06:f24e  80 47		 bra $f297
$06:f250  d6 22		 dec $22,x
$06:f252  70 08		 bvs $f25c
$06:f254  1a			inc a
$06:f255  a7 c7		 lda [$c7]
$06:f257  69 f8 80	  adc #$80f8
$06:f25a  7c 1a 22	  jmp ($221a,x)
$06:f25d  90 0c		 bcc $f26b
$06:f25f  03 27		 ora $27,s
$06:f261  c7 67		 cmp [$67]
$06:f263  57 a0		 eor [$a0],y
$06:f265  cf e7 51 79   cmp $7951e7
$06:f269  9c 52 29	  stz $2952
$06:f26c  0b			phd
$06:f26d  8c 41 a1	  sty $a141
$06:f270  d0 08		 bne $f27a
$06:f272  20 fc 1e	  jsr $1efc
$06:f275  03 07		 ora $07,s
$06:f277  99 c3 de	  sta $dec3,y
$06:f27a  c3 07		 cmp $07,s
$06:f27c  87 40		 sta [$40]
$06:f27e  60			rts
$06:f27f  8b			phb
$06:f280  81 ea		 sta ($ea,x)
$06:f282  41 3f		 eor ($3f,x)
$06:f284  1b			tcs
$06:f285  8e 86 62	  stx $6286
$06:f288  a1 50		 lda ($50,x)
$06:f28a  d0 4c		 bne $f2d8
$06:f28c  38			sec
$06:f28d  0a			asl a
$06:f28e  00 a0		 brk #$a0
$06:f290  0f c0 20 3c   ora $3c20c0
$06:f294  0c c7 80	  tsb $80c7
$06:f297  2c ad 81	  bit $81ad
$06:f29a  ab			plb
$06:f29b  d0 a7		 bne $f244
$06:f29d  f3 b8		 sbc ($b8,s),y
$06:f29f  b4 ce		 ldy $ce,x
$06:f2a1  19 1b 84	  ora $841b,y
$06:f2a4  46 e0		 lsr $e0
$06:f2a6  90 f8		 bcc $f2a0
$06:f2a8  19 d0 20	  ora $20d0,y
$06:f2ab  63 01		 adc $01,s
$06:f2ad  01 00		 ora ($00,x)
$06:f2af  d4 20		 pei ($20)
$06:f2b1  83 81		 sta $81,s
$06:f2b3  39 8a e0	  and $e08a,y
$06:f2b6  3a			dec a
$06:f2b7  98			tya
$06:f2b8  40			rti
$06:f2b9  89 58 36	  bit #$3658
$06:f2bc  12 0d		 ora ($0d)
$06:f2be  85 03		 sta $03
$06:f2c0  c1 80		 cmp ($80,x)
$06:f2c2  52 06		 eor ($06)
$06:f2c4  00 a0		 brk #$a0
$06:f2c6  22 20 2a 85   jsl $852a20
$06:f2ca  00 b0		 brk #$b0
$06:f2cc  29 31 6c	  and #$6c31
$06:f2cf  04 46		 tsb $46
$06:f2d1  03 22		 ora $22,s
$06:f2d3  8c 44 e7	  sty $e744
$06:f2d6  c3 00		 cmp $00,s
$06:f2d8  a0 47 64	  ldy #$6447
$06:f2db  33 e9		 and ($e9,s),y
$06:f2dd  d4 e1		 pei ($e1)
$06:f2df  d6 17		 dec $17,x
$06:f2e1  eb			xba
$06:f2e2  fd de ff	  sbc $ffde,x
$06:f2e5  e1 ff		 sbc ($ff,x)
$06:f2e7  a0 c3 c7	  ldy #$c7c3
$06:f2ea  ff a1 df e8   sbc $e8dfa1,x
$06:f2ee  f7 f9		 sbc [$f9],y
$06:f2f0  e4 f2		 cpx $f2
$06:f2f2  e1 e0		 sbc ($e0,x)
$06:f2f4  f8			sed
$06:f2f5  72 32		 adc ($32)
$06:f2f7  95 89		 sta $89,x
$06:f2f9  26 e2		 rol $e2
$06:f2fb  89 f0 c4	  bit #$c4f0
$06:f2fe  5e 27 13	  lsr $1327,x
$06:f301  89 04 02	  bit #$0204
$06:f304  3d fe 9f	  and $9ffe,x
$06:f307  7f bd df ee   adc $eedfbd,x
$06:f30b  77 fb		 adc [$fb],y
$06:f30d  1d fe c2	  ora $c2fe,x
$06:f310  7f 38 9f cb   adc $cb9f38,x
$06:f314  85 c0		 sta $c0
$06:f316  6c 12 58	  jmp ($5812)
$06:f319  64 86		 stz $86
$06:f31b  1d 50 9f	  ora $9f50,x
$06:f31e  d4 a3		 pei ($a3)
$06:f320  b0 38		 bcs $f35a
$06:f322  e4 82		 cpx $82
$06:f324  79 34 9e	  adc $9e34,y
$06:f327  20 42 e7	  jsr $e742
$06:f32a  7f f9 a1 85   adc $85a1f9,x
$06:f32e  8a			txa
$06:f32f  5c 3f fd 0a   jml $0afd3f
$06:f333  fd 2a b7	  sbc $b72a,x
$06:f336  6b			rtl
$06:f337  3c 99 4f	  bit $4f99,x
$06:f33a  c6 5b		 dec $5b
$06:f33c  f1 7c		 sbc ($7c),y
$06:f33e  b8			clv
$06:f33f  1b			tcs
$06:f340  03 60		 ora $60,s
$06:f342  0d 08 06	  ora $0608
$06:f345  43 fd		 eor $fd,s
$06:f347  1a			inc a
$06:f348  ff 43 9c 42   sbc $429c43,x
$06:f34c  a7 07		 lda [$07]
$06:f34e  40			rti
$06:f34f  7f 3f 9f 8f   adc $8f9f3f,x
$06:f353  c5 86		 cmp $86
$06:f355  1f 50 9f 40   ora $409f50,x
$06:f359  af d6 29 ec   lda $ec29d6
$06:f35d  0a			asl a
$06:f35e  7b			tdc
$06:f35f  06 8e		 asl $8e
$06:f361  37 06		 and [$06],y
$06:f363  01 f0		 ora ($f0,x)
$06:f365  42 0a		 wdm #$0a
$06:f367  0c 19 60	  tsb $6019
$06:f36a  89 0b 1d	  bit #$1d0b
$06:f36d  fe 7f 3f	  inc $3f7f,x
$06:f370  6e 84 c0	  ror $c084
$06:f373  48			pha
$06:f374  1c 8d 84	  trb $848d
$06:f377  12 d9		 ora ($d9)
$06:f379  88			dey
$06:f37a  8a			txa
$06:f37b  46 29		 lsr $29
$06:f37d  0d 80 7d	  ora $7d80
$06:f380  8c 73 f8	  sty $f873
$06:f383  a1 07		 lda ($07,x)
$06:f385  40			rti
$06:f386  7d bf de	  adc $debf,x
$06:f389  65 30		 adc $30
$06:f38b  ef 37 8f b2   sbc $b28f37
$06:f38f  7d 94 0e	  adc $0e94,x
$06:f392  07 04		 ora [$04]
$06:f394  83 c2		 sta $c2,s
$06:f396  61 f0		 adc ($f0,x)
$06:f398  28			plp
$06:f399  34 56		 bit $56,x
$06:f39b  0a			asl a
$06:f39c  dd 09 04	  cmp $0409,x
$06:f39f  80 6a		 bra $f40b
$06:f3a1  11 48		 ora ($48),y
$06:f3a3  bc 62 3f	  ldy $3f62,x
$06:f3a6  10 8f		 bpl $f337
$06:f3a8  ce 67 f3	  dec $f367
$06:f3ab  a0 60 b7	  ldy #$b760
$06:f3ae  42 81		 wdm #$81
$06:f3b0  00 c0		 brk #$c0
$06:f3b2  60			rts
$06:f3b3  2c 06 90	  bit $9006
$06:f3b6  f0 44		 beq $f3fc
$06:f3b8  3a			dec a
$06:f3b9  11 0f		 ora ($0f),y
$06:f3bb  84 22		 sty $22
$06:f3bd  11 c0		 ora ($c0),y
$06:f3bf  e0 78 3c	  cpx #$3c78
$06:f3c2  17 0f		 ora [$0f],y
$06:f3c4  84 63		 sty $63
$06:f3c6  f0 67		 beq $f42f
$06:f3c8  09 57 e9	  ora #$e957
$06:f3cb  ca			dex
$06:f3cc  0d d0 87	  ora $87d0
$06:f3cf  c3 c9		 cmp $c9,s
$06:f3d1  21 28		 and ($28,x)
$06:f3d3  97 c5		 sta [$c5],y
$06:f3d5  20 f5 08	  jsr $08f5
$06:f3d8  fc 82 7f	  jsr ($7f82,x)
$06:f3db  20 9d c3	  jsr $c39d
$06:f3de  a1 c4		 lda ($c4,x)
$06:f3e0  90 3d		 bcc $f41f
$06:f3e2  85 42		 sta $42
$06:f3e4  ff 78 bf d8   sbc $d8bf78,x
$06:f3e8  2f f4 0b fd   and $fd0bf4
$06:f3ec  52 fe		 eor ($fe)
$06:f3ee  dd 08 84	  cmp $8408,x
$06:f3f1  03 11		 ora $11,s
$06:f3f3  80 a0		 bra $f395
$06:f3f5  70 12		 bvs $f409
$06:f3f7  a4 65		 ldy $65
$06:f3f9  0f 07 c3 21   ora $21c307
$06:f3fd  90 ec		 bcc $f3eb
$06:f3ff  76 29		 ror $29,x
$06:f401  1c 82 d8	  trb $d882
$06:f404  44 ba 53	  mvp $53,$ba
$06:f407  8f c4 21 54   sta $5421c4
$06:f40b  23 f1		 and $f1,s
$06:f40d  80 4d		 bra $f45c
$06:f40f  e0 f0 08	  cpx #$08f0
$06:f412  3c e2 7c	  bit $7ce2,x
$06:f415  7b			tdc
$06:f416  15 d1		 ora $d1,x
$06:f418  48			pha
$06:f419  2f f7 f9 c4   and $c4f9f7
$06:f41d  fd 0e 14	  sbc $140e,x
$06:f420  14 50		 trb $50
$06:f422  a2 c3 81	  ldx #$81c3
$06:f425  ff 80 33 cc   sbc $cc3380,x
$06:f429  aa			tax
$06:f42a  09 74 a4	  ora #$a474
$06:f42d  7e 1a 2d	  ror $2d1a,x
$06:f430  30 f8		 bmi $f42a
$06:f432  4d 3e 90	  eor $903e
$06:f435  cf e4 13 f9   cmp $f913e4
$06:f439  02 81		 cop #$81
$06:f43b  42 e1		 wdm #$e1
$06:f43d  11 78		 ora ($78),y
$06:f43f  9c fe 5f	  stz $5ffe
$06:f442  5f a7 bd 41   eor $41bda7,x
$06:f446  ea			nop
$06:f447  12 f9		 ora ($f9)
$06:f449  3c 0a 03	  bit $030a,x
$06:f44c  08			php
$06:f44d  83 c4		 sta $c4,s
$06:f44f  e1 f2		 sbc ($f2,x)
$06:f451  f8			sed
$06:f452  fb			xce
$06:f453  e0 63 e0	  cpx #$e063
$06:f456  50 93		 bvc $f3eb
$06:f458  9e 82 41	  stz $4182,x
$06:f45b  a0 90 74	  ldy #$7490
$06:f45e  32 1e		 and ($1e)
$06:f460  0d 00 4c	  ora $4c00
$06:f463  3f 1e 80 c8   and $c8801e,x
$06:f467  7e be 52	  ror $52be,x
$06:f46a  0e 00 7c	  asl $7c00
$06:f46d  02 82		 cop #$82
$06:f46f  22 1f 47 c0   jsl $c0471f
$06:f473  52 1f		 eor ($1f)
$06:f475  27 60		 and [$60]
$06:f477  41 22		 eor ($22,x)
$06:f479  f1 07		 sbc ($07),y
$06:f47b  e8			inx
$06:f47c  47 e2		 eor [$e2]
$06:f47e  e3 32		 sbc $32,s
$06:f480  1a			inc a
$06:f481  83 dc		 sta $dc,s
$06:f483  20 90 38	  jsr $3890
$06:f486  84 3c		 sty $3c
$06:f488  68			pla
$06:f489  24 23		 bit $23
$06:f48b  22 83 e0 28   jsl $28e083
$06:f48f  04 f1		 tsb $f1
$06:f491  08			php
$06:f492  87 c3		 sta [$c3]
$06:f494  a1 e8		 lda ($e8,x)
$06:f496  e4 7f		 cpx $7f
$06:f498  3e 85 90	  rol $9085,x
$06:f49b  fa			plx
$06:f49c  79 28 0d	  adc $0d28,y
$06:f49f  60			rts
$06:f4a0  c0 07 c3	  cpy #$c307
$06:f4a3  a1 e0		 lda ($e0,x)
$06:f4a5  e4 7c		 cpx $7c
$06:f4a7  3e 9f 83	  rol $839f,x
$06:f4aa  48			pha
$06:f4ab  79 1b c3	  adc $c31b,y
$06:f4ae  04 80		 tsb $80
$06:f4b0  41 c0		 eor ($c0,x)
$06:f4b2  01 09		 ora ($09,x)
$06:f4b4  85 43		 sta $43
$06:f4b6  e6 11		 inc $11
$06:f4b8  f3 c8		 sbc ($c8,s),y
$06:f4ba  d7 e4		 cmp [$e4],y
$06:f4bc  92 4b		 sta ($4b)
$06:f4be  3d 9e 1d	  and $1d9e,x
$06:f4c1  0f ab 57 ee   ora $ee57ab
$06:f4c5  17 fb		 ora [$fb],y
$06:f4c7  05 ff		 ora $ff
$06:f4c9  c1 ff		 cmp ($ff,x)
$06:f4cb  d0 33		 bne $f500
$06:f4cd  8d aa 16	  sta $16aa
$06:f4d0  cf 04 b3 c1   cmp $c1b304
$06:f4d4  18			clc
$06:f4d5  d8			cld
$06:f4d6  44 3c 12	  mvp $12,$3c
$06:f4d9  8b			phb
$06:f4da  21 3c		 and ($3c,x)
$06:f4dc  30 98		 bmi $f476
$06:f4de  4b			phk
$06:f4df  67 b2		 adc [$b2]
$06:f4e1  3d fe 52	  and $52fe,x
$06:f4e4  85 33		 sta $33
$06:f4e6  f8			sed
$06:f4e7  a5 0c		 lda $0c
$06:f4e9  d7 f9		 cmp [$f9],y
$06:f4eb  9e 90 38	  stz $3890,x
$06:f4ee  1c b2 1f	  trb $1fb2
$06:f4f1  34 83		 bit $83,x
$06:f4f3  ca			dex
$06:f4f4  a2 71 58	  ldx #$5871
$06:f4f7  08			php
$06:f4f8  bc 20 d0	  ldy $d020,x
$06:f4fb  67 e0		 adc [$e0]
$06:f4fd  5f 2f e8 70   eor $70e82f,x
$06:f501  bc 5f d8	  ldy $d85f,x
$06:f504  a1 fe		 lda ($fe,x)
$06:f506  47 0c		 eor [$0c]
$06:f508  21 5e		 and ($5e,x)
$06:f50a  29 30 08	  and #$0830
$06:f50d  05 62		 ora $62
$06:f50f  01 1c		 ora ($1c,x)
$06:f511  e0 4d bc	  cpx #$bc4d
$06:f514  90 88		 bcc $f49e
$06:f516  45 32		 eor $32
$06:f518  99 e4 f2	  sta $f2e4,y
$06:f51b  5a			phy
$06:f51c  3d 15 cf	  and $cf15,x
$06:f51f  e3 a0		 sbc $a0,s
$06:f521  27 df		 and [$df]
$06:f523  e8			inx
$06:f524  d2 b8		 cmp ($b8)
$06:f526  d6 a1		 dec $a1,x
$06:f528  0b			phd
$06:f529  81 c3		 sta ($c3,x)
$06:f52b  60			rts
$06:f52c  2b			pld
$06:f52d  d0 ac		 bne $f4db
$06:f52f  46 62		 lsr $62
$06:f531  91 d5		 sta ($d5),y
$06:f533  99 43 21	  sta $2143,y
$06:f536  f1 c8		 sbc ($c8),y
$06:f538  fd 7a bf	  sbc $bf7a,x
$06:f53b  7e bf d9	  ror $d9bf,x
$06:f53e  af f6 2b fa   lda $fa2bf6
$06:f542  bc 92 61	  ldy $6192,x
$06:f545  60			rts
$06:f546  f0 41		 beq $f589
$06:f548  3c 11 cf	  bit $cf11,x
$06:f54b  84 fb		 sty $fb
$06:f54d  e1 3a		 sbc ($3a,x)
$06:f54f  f8			sed
$06:f550  2b			pld
$06:f551  c3 41		 cmp $41,s
$06:f553  a0 0a 84	  ldy #$840a
$06:f556  53 e8		 eor ($e8,s),y
$06:f558  a5 08		 lda $08
$06:f55a  70 a0		 bvs $f4fc
$06:f55c  e3 70		 sbc $70,s
$06:f55e  19 74 06	  ora $0674,y
$06:f561  6b			rtl
$06:f562  31 e4		 and ($e4),y
$06:f564  7e f0 ff	  ror $fff0,x
$06:f567  fa			plx
$06:f568  87 fe		 sta [$fe]
$06:f56a  73 ff		 adc ($ff,s),y
$06:f56c  98			tya
$06:f56d  7f 81 20 09   adc $092081,x
$06:f571  0e 77 fe	  asl $fe77
$06:f574  08			php
$06:f575  8e 02 31	  stx $3102
$06:f578  c0 7f f1	  cpy #$f17f
$06:f57b  4d a4 6b	  eor $6ba4
$06:f57e  e4 97		 cpx $97
$06:f580  08			php
$06:f581  b7 0b		 lda [$0b],y
$06:f583  a9 c6 e4	  lda #$e4c6
$06:f586  73 a4		 adc ($a4,s),y
$06:f588  d0 60		 bne $f5ea
$06:f58a  f0 52		 beq $f5de
$06:f58c  bf d0 c5 30   lda $30c5d0,x
$06:f590  cf 3f d3 8f   cmp $8fd33f
$06:f594  f0 f4		 beq $f58a
$06:f596  3f 1f e3 60   and $60e31f,x
$06:f59a  48			pha
$06:f59b  67 f1		 adc [$f1]
$06:f59d  28			plp
$06:f59e  fa			plx
$06:f59f  d0 21		 bne $f5c2
$06:f5a1  00 20		 brk #$20
$06:f5a3  3a			dec a
$06:f5a4  04 06		 tsb $06
$06:f5a6  0b			phd
$06:f5a7  01 3b		 ora ($3b,x)
$06:f5a9  85 02		 sta $02
$06:f5ab  ff 60 65 0c   sbc $0c6560,x
$06:f5af  f2 7e		 sbc ($7e)
$06:f5b1  85 08		 sta $08
$06:f5b3  f4 7f 3d	  pea $3d7f
$06:f5b6  9f ee 77 e2   sta $e277ee,x
$06:f5ba  01 e0		 ora ($e0,x)
$06:f5bc  f8			sed
$06:f5bd  6e 3f 14	  ror $143f
$06:f5c0  04 a0		 tsb $a0
$06:f5c2  dc 12 83	  jml [$8312]
$06:f5c5  88			dey
$06:f5c6  fc 42 13	  jsr ($1342,x)
$06:f5c9  c3 04		 cmp $04,s
$06:f5cb  fe 28 e2	  inc $e228,x
$06:f5ce  41 3f		 eor ($3f,x)
$06:f5d0  b0 cf		 bcs $f5a1
$06:f5d2  ee 50 f8	  inc $f850
$06:f5d5  a4 0e		 ldy $0e
$06:f5d7  31 04		 and ($04),y
$06:f5d9  89 43 61	  bit #$6143
$06:f5dc  b0 08		 bcs $f5e6
$06:f5de  34 0a		 bit $0a,x
$06:f5e0  a1 7f		 lda ($7f,x)
$06:f5e2  e0 7f fe	  cpx #$fe7f
$06:f5e5  1f f4 18 31   ora $3118f4,x
$06:f5e9  82 7e c9	  brl $bf6a
$06:f5ec  19 ec ff	  ora $ffec,y
$06:f5ef  19 fc 2f	  ora $2ffc,y
$06:f5f2  84 cb		 sty $cb
$06:f5f4  fd 72 bf	  sbc $bf72,x
$06:f5f7  7f 6f f7 9b   adc $9bf76f,x
$06:f5fb  fc b6 c7	  jsr ($c7b6,x)
$06:f5fe  97 f9		 sta [$f9],y
$06:f600  c0 bf c4	  cpy #$c4bf
$06:f603  d0 26		 bne $f62b
$06:f605  86 07		 stx $07
$06:f607  ff 80 73 0e   sbc $0e7380,x
$06:f60b  73 ff		 adc ($ff,s),y
$06:f60d  0c ff cb	  tsb $cbff
$06:f610  e4 f7		 cpx $f7
$06:f612  fa			plx
$06:f613  3d fe 87	  and $87fe,x
$06:f616  b8			clv
$06:f617  d0 6f		 bne $f688
$06:f619  73 12		 adc ($12,s),y
$06:f61b  79 dc 0e	  adc $0edc,y
$06:f61e  3b			tsc
$06:f61f  3d 94 49	  and $4994,x
$06:f622  e3 f4		 sbc $f4,s
$06:f624  79 fd 0e	  adc $0efd,y
$06:f627  7f a0 bf e6   adc $e6bfa0,x
$06:f62b  2f f3 ba 3c   and $3cbaf3
$06:f62f  76 c7		 ror $c7,x
$06:f631  28			plp
$06:f632  8f fe be 5f   sta $5fbefe
$06:f636  ce 27 f3	  dec $f327
$06:f639  09 e8 94	  ora #$94e8
$06:f63c  7a			ply
$06:f63d  39 1c 8d	  and $8d1c,y
$06:f640  c6 02		 dec $02
$06:f642  e1 de		 sbc ($de,x)
$06:f644  c5 04		 cmp $04
$06:f646  07 f1		 ora [$f1]
$06:f648  84 fc		 sty $fc
$06:f64a  4a			lsr a
$06:f64b  3e 1c 8f	  rol $8f1c,x
$06:f64e  86 e3		 stx $e3
$06:f650  89 70 c6	  bit #$c670
$06:f653  62 bf 95	  per $8c15
$06:f656  fa			plx
$06:f657  7f ff 1f ff   adc $ff1fff,x
$06:f65b  c3 d7		 cmp $d7,s
$06:f65d  2a			rol a
$06:f65e  15 ea		 ora $ea,x
$06:f660  64 4e		 stz $4e
$06:f662  3b			tsc
$06:f663  01 87		 ora ($87,x)
$06:f665  5e ea 34	  lsr $34ea,x
$06:f668  f9 fe 3e	  sbc $3efe,y
$06:f66b  ff 87 bf d4   sbc $d4bf87,x
$06:f66f  27 f4		 and [$f4]
$06:f671  c9 fc 76	  cmp #$76fc
$06:f674  47 0e		 eor [$0e]
$06:f676  98			tya
$06:f677  d4 67		 pei ($67)
$06:f679  ff 4f 22 70   sbc $70224f,x
$06:f67d  ae 91 4f	  ldx $4f91
$06:f680  a5 93		 lda $93
$06:f682  c9 dc e0	  cmp #$e0dc
$06:f685  6e 37 91	  ror $9137
$06:f688  42 80		 wdm #$80
$06:f68a  fc 21 1f	  jsr ($1f21,x)
$06:f68d  08			php
$06:f68e  a7 e2		 lda [$e2]
$06:f690  c9 f8 ee	  cmp #$eef8
$06:f693  78			sei
$06:f694  b7 1c		 lda [$1c],y
$06:f696  63 28		 adc $28,s
$06:f698  42 39		 wdm #$39
$06:f69a  f2 0f		 sbc ($0f)
$06:f69c  3e 53 ef	  rol $ef53,x
$06:f69f  28			plp
$06:f6a0  d1 c4		 cmp ($c4),y
$06:f6a2  b1 77		 lda ($77),y
$06:f6a4  1e 6c 9b	  asl $9b6c,x
$06:f6a7  c1 1c		 cmp ($1c,x)
$06:f6a9  b7 4c		 lda [$4c],y
$06:f6ab  3f f1 8f fc   and $fc8ff1,x
$06:f6af  2b			pld
$06:f6b0  ff 5c ff df   sbc $dfff5c,x
$06:f6b4  3f f3 ef fc   and $fceff3,x
$06:f6b8  7f ff 93 ff   adc $ff93ff,x
$06:f6bc  c4 38		 cpy $38
$06:f6be  d3 0f		 cmp ($0f,s),y
$06:f6c0  34 8b		 bit $8b,x
$06:f6c2  dd 48 e7	  cmp $e748,x
$06:f6c5  5a			phy
$06:f6c6  3d 98 4f	  and $4f98,x
$06:f6c9  04 eb		 tsb $eb
$06:f6cb  d5 10		 cmp $10,x
$06:f6cd  f6 4e		 inc $4e,x
$06:f6cf  3f d1 8f f6   and $f68fd1,x
$06:f6d3  43 fd		 eor $fd,s
$06:f6d5  30 ff		 bmi $f6d6
$06:f6d7  44 bf d1	  mvp $d1,$bf
$06:f6da  ef f4 51 4c   sbc $4c51f4
$06:f6de  34 aa		 bit $aa,x
$06:f6e0  46 d3		 lsr $d3
$06:f6e2  f9 94 ff	  sbc $ff94,y
$06:f6e5  60			rts
$06:f6e6  3d f0 8f	  and $8ff0,x
$06:f6e9  7c b3 df	  jmp ($dfb3,x)
$06:f6ec  03 f7		 ora $f7,s
$06:f6ee  e2 3d		 sep #$3d
$06:f6f0  fb			xce
$06:f6f1  7f fc 0d c4   adc $c40dfc,x
$06:f6f5  31 24		 and ($24),y
$06:f6f7  70 31		 bvs $f72a
$06:f6f9  97 75		 sta [$75],y
$06:f6fb  ee d9 7f	  inc $7fd9
$06:f6fe  b2 5f		 lda ($5f)
$06:f700  e8			inx
$06:f701  45 ba		 eor $ba
$06:f703  55 ee		 eor $ee,x
$06:f705  b6 7b		 ldx $7b,y
$06:f707  34 1e		 bit $1e,x
$06:f709  08			php
$06:f70a  83 70		 sta $70,s
$06:f70c  3f d0 07 00   and $0007d0,x
$06:f710  a8			tay
$06:f711  c1 be		 cmp ($be,x)
$06:f713  0a			asl a
$06:f714  70 8e		 bvs $f6a4
$06:f716  7f 23 1f 88   adc $881f23,x
$06:f71a  9c 7e e5	  stz $e57e
$06:f71d  7e c4 7f	  ror $7fc4,x
$06:f720  a0 df		 ldy #$df
$06:f722  ec 8f fe	  cpx $fe8f
$06:f725  c1 ef		 cmp ($ef,x)
$06:f727  94 7b		 sty $7b,x
$06:f729  e0 14		 cpx #$14
$06:f72b  ff 07 ff 03   sbc $03ff07,x
$06:f72f  ff 61 83 0c   sbc $0c8361,x
$06:f733  20 0c 63	  jsr $630c
$06:f736  d8			cld
$06:f737  7f ea 1d 0c   adc $0c1dea,x
$06:f73b  a6 13		 ldx $13
$06:f73d  55 0e		 eor $0e,x
$06:f73f  b4 43		 ldy $43,x
$06:f741  b2 59		 lda ($59)
$06:f743  eb			xba
$06:f744  67 3a		 adc [$3a]
$06:f746  51 ee		 eor ($ee),y
$06:f748  80 7b		 bra $f7c5
$06:f74a  25 df		 and $df
$06:f74c  eb			xba
$06:f74d  d7 fb		 cmp [$fb],y
$06:f74f  e0 22		 cpx #$22
$06:f751  1b			tcs
$06:f752  07 f9		 ora [$f9]
$06:f754  4a			lsr a
$06:f755  0e 72 d8	  asl $d872
$06:f758  7f 9e 21 32   adc $32219e,x
$06:f75c  8f 57 63 97   sta $976357
$06:f760  18			clc
$06:f761  35 ae		 and $ae,x
$06:f763  09 1c		 ora #$1c
$06:f765  80 0f		 bra $f776
$06:f767  01 86		 ora ($86,x)
$06:f769  00 10		 brk #$10
$06:f76b  b0 df		 bcs $f74c
$06:f76d  fc 7f f2	  jsr ($f27f,x)
$06:f770  31 5f		 and ($5f),y
$06:f772  ef f1 e8 f6   sbc $f6e8f1
$06:f776  b2 41		 lda ($41)
$06:f778  94 fc		 sty $fc,x
$06:f77a  65 3e		 adc $3e
$06:f77c  10 8b		 bpl $f709
$06:f77e  c5 00		 cmp $00
$06:f780  ac 34 8b	  ldy $8b34
$06:f783  c4 82		 cpy $82
$06:f785  61 de		 adc ($de,x)
$06:f787  ff 43 8c 03   sbc $038c43,x
$06:f78b  84 fe		 sty $fe
$06:f78d  19 43 0d	  ora $0d43,y
$06:f790  fe 34 81	  inc $8134,x
$06:f793  6c 39 50	  jmp ($5039)
$06:f796  0c dc 02	  tsb $02dc
$06:f799  2d 06 8a	  and $8a06
$06:f79c  c3 e3		 cmp $e3,s
$06:f79e  10 18		 bpl $f7b8
$06:f7a0  94 0e		 sty $0e,x
$06:f7a2  11 0f		 ora ($0f),y
$06:f7a4  1e 07 7f	  asl $7f07,x
$06:f7a7  bf bf df ce   lda $cedfbf,x
$06:f7ab  67 f3		 adc [$f3]
$06:f7ad  09 fc		 ora #$fc
$06:f7af  fa			plx
$06:f7b0  7f 3c 9f c4   adc $c49f3c,x
$06:f7b4  23 f0		 and $f0,s
$06:f7b6  f8			sed
$06:f7b7  7f 23 f1 30   adc $30f123,x
$06:f7bb  98			tya
$06:f7bc  70 20		 bvs $f7de
$06:f7be  14 89		 trb $89
$06:f7c0  87 23		 sta [$23]
$06:f7c2  a1 38		 lda ($38,x)
$06:f7c4  f0 4a		 beq $f810
$06:f7c6  3c 03 c0	  bit $c003,x
$06:f7c9  82 7f 11	  brl $094b
$06:f7cc  e1 fc		 sbc ($fc,x)
$06:f7ce  51 8c		 eor ($8c),y
$06:f7d0  f3 f8		 sbc ($f8,s),y
$06:f7d2  eb			xba
$06:f7d3  07 58		 ora [$58]
$06:f7d5  7e 3f 10	  ror $103f,x
$06:f7d8  28			plp
$06:f7d9  1c 3e 07	  trb $073e
$06:f7dc  14 81		 trb $81
$06:f7de  c1 16		 cmp ($16,x)
$06:f7e0  81 07		 sta ($07,x)
$06:f7e2  84 43		 sty $43
$06:f7e4  e4 13		 cpx $13
$06:f7e6  f1 e0		 sbc ($e0),y
$06:f7e8  4b			phk
$06:f7e9  25 e8		 and $e8
$06:f7eb  90 44		 bcc $f831
$06:f7ed  84 72		 sty $72
$06:f7ef  3f 18 8f dc   and $dc8f18,x
$06:f7f3  2f f4 0b fa   and $fa0bf4
$06:f7f7  34 35		 bit $35,x
$06:f7f9  1e 0e 07	  asl $070e,x
$06:f7fc  02 a9		 cop #$a9
$06:f7fe  dc aa 71	  jml [$71aa]
$06:f801  33 18		 and ($18,s),y
$06:f803  0d 86 01	  ora $0186
$06:f806  b4 03		 ldy $03,x
$06:f808  c0 8f		 cpy #$8f
$06:f80a  7f a7 df e9   adc $e9dfa7,x
$06:f80e  17 fa		 ora [$fa],y
$06:f810  75 fe		 adc $fe,x
$06:f812  bf 7f af 1f   lda $1faf7f,x
$06:f816  87 48		 sta [$48]
$06:f818  7c 3e 12	  jmp ($123e,x)
$06:f81b  b9 0c fe	  lda $fe0c,y
$06:f81e  77 16		 adc [$16],y
$06:f820  99 c6 26	  sta $26c6,y
$06:f823  f1 09		 sbc ($09),y
$06:f825  bc 11 62	  ldy $6211,x
$06:f828  10 71		 bpl $f89b
$06:f82a  f0 48		 beq $f874
$06:f82c  63 f3		 adc $f3,s
$06:f82e  b8			clv
$06:f82f  3c ce 19	  bit $19ce,x
$06:f832  37 84		 and [$84],y
$06:f834  01 40		 ora ($40,x)
$06:f836  f8			sed
$06:f837  0f c1 80 7a   ora $7a80c1
$06:f83b  a8			tay
$06:f83c  5f 8d c7 43   eor $43c78d,x
$06:f840  31 c0		 and ($c0),y
$06:f842  b0 50		 bcs $f894
$06:f844  02 c1		 cop #$c1
$06:f846  e0 c0		 cpx #$c0
$06:f848  24 c3		 bit $c3
$06:f84a  81 42		 sta ($42,x)
$06:f84c  fe 6e 38	  inc $386e,x
$06:f84f  19 8b 05	  ora $058b,y
$06:f852  83 00		 sta $00,s
$06:f854  25 04		 and $04
$06:f856  e0 07		 cpx #$07
$06:f858  06 01		 asl $01
$06:f85a  57 a1		 eor [$a1],y
$06:f85c  5f ee f2 db   eor $dbf2ee,x
$06:f860  3c 32 37	  bit $3732,x
$06:f863  08			php
$06:f864  8d c0 a0	  sta $a0c0
$06:f867  f0 18		 beq $f881
$06:f869  1c 02 07	  trb $0702
$06:f86c  42 9f		 wdm #$9f
$06:f86e  dd e1 f6	  cmp $f6e1,x
$06:f871  78			sei
$06:f872  c4 6e		 cpy $6e
$06:f874  08			php
$06:f875  45 07		 eor $07
$06:f877  e0 0f		 cpx #$0f
$06:f879  06 01		 asl $01
$06:f87b  d4 c2		 pei ($c2)
$06:f87d  7c 2e 1a	  jmp ($1a2e,x)
$06:f880  09 85		 ora #$85
$06:f882  83 61		 sta $61,s
$06:f884  20 2b 07	  jsr $072b
$06:f887  c3 81		 cmp $81,s
$06:f889  e0 80		 cpx #$80
$06:f88b  60			rts
$06:f88c  30 9f		 bmi $f82d
$06:f88e  8b			phb
$06:f88f  86 01		 stx $01
$06:f891  24 1b		 bit $1b
$06:f893  0a			asl a
$06:f894  01 94		 ora ($94,x)
$06:f896  3e 10 02	  rol $0210,x
$06:f899  e0 c0		 cpx #$c0
$06:f89b  27 b0		 and [$b0]
$06:f89d  e8			inx
$06:f89e  24 be		 bit $be
$06:f8a0  eb			xba
$06:f8a1  1e b3 c7	  asl $c7b3,x
$06:f8a4  24 b1		 bit $b1
$06:f8a6  c9 3c		 cmp #$3c
$06:f8a8  72 31		 adc ($31)
$06:f8aa  08			php
$06:f8ab  5e 85 ce	  lsr $ce85,x
$06:f8ae  fe 7f 0f	  inc $0f7f,x
$06:f8b1  1f fd 06 56   ora $5606fd,x
$06:f8b5  3b			tsc
$06:f8b6  fd de ff	  sbc $ffde,x
$06:f8b9  3c 9e 4c	  bit $4c9e,x
$06:f8bc  3c 18 8f	  bit $8f18,x
$06:f8bf  06 73		 asl $73
$06:f8c1  e1 8c		 sbc ($8c,x)
$06:f8c3  34 85		 bit $85,x
$06:f8c5  c3 11		 cmp $11,s
$06:f8c7  78			sei
$06:f8c8  98			tya
$06:f8c9  48			pha
$06:f8ca  17 a1		 ora [$a1],y
$06:f8cc  1c fe 27	  trb $27fe
$06:f8cf  c2 1d		 rep #$1d
$06:f8d1  fe 51 86	  inc $8651,x
$06:f8d4  3b			tsc
$06:f8d5  fd 84 fe	  sbc $fe84,x
$06:f8d8  77 3f		 adc [$3f],y
$06:f8da  97 8b		 sta [$8b],y
$06:f8dc  c6 a7		 dec $a7
$06:f8de  df 6e a7 56   cmp $56a76e,x
$06:f8e2  a7 d5		 lda [$d5]
$06:f8e4  79 34 76	  adc $7634,y
$06:f8e7  89 41		 bit #$41
$06:f8e9  87 42		 sta [$42]
$06:f8eb  20 91 08	  jsr $0891
$06:f8ee  04 43		 tsb $43
$06:f8f0  ff 31 bf f8   sbc $f8bf31,x
$06:f8f4  7f ff 9f ff   adc $ff9fff,x
$06:f8f8  ef fe c8 0b   sbc $0bc8fe
$06:f8fc  fd fd 1a	  sbc $1afd,x
$06:f8ff  12 0f		 ora ($0f)
$06:f901  06 61		 asl $61
$06:f903  a0 1f 0d	  ldy #$0d1f
$06:f906  67 82		 adc [$82]
$06:f908  b1 44		 lda ($44),y
$06:f90a  d0 49		 bne $f955
$06:f90c  21 17		 and ($17,x)
$06:f90e  8a			txa
$06:f90f  c5 e1		 cmp $e1
$06:f911  3e 91 ef	  rol $ef91,x
$06:f914  f6 fb		 inc $fb,x
$06:f916  fd de ff	  sbc $ffde,x
$06:f919  61 95		 adc ($95,x)
$06:f91b  03 19		 ora $19,s
$06:f91d  87 c8		 sta [$c8]
$06:f91f  a2 d4 69	  ldx #$69d4
$06:f922  36 66		 rol $66,x
$06:f924  81 a6		 sta ($a6,x)
$06:f926  b0 d5		 bcs $f8fd
$06:f928  a3 89		 lda $89,s
$06:f92a  d0 4e		 bne $f97a
$06:f92c  85 c2		 sta $c2
$06:f92e  fe c5 06	  inc $06c5,x
$06:f931  28			plp
$06:f932  32 03		 and ($03)
$06:f934  be 84 16	  ldx $1684,y
$06:f937  58			cli
$06:f938  3e c7 c1	  rol $c1c7,x
$06:f93b  10 f8		 bpl $f935
$06:f93d  60			rts
$06:f93e  3e 14 8b	  rol $8b14,x
$06:f941  c7 12		 cmp [$12]
$06:f943  f1 44		 sbc ($44),y
$06:f945  bc 4e 1f	  ldy $1f4e,x
$06:f948  62 9f 08	  per $01ea
$06:f94b  47 e2		 eor [$e2]
$06:f94d  19 fc 75	  ora $75fc,y
$06:f950  83 ac		 sta $ac,s
$06:f952  14 e1		 trb $e1
$06:f954  7c be 4e	  jmp ($4ebe,x)
$06:f957  03 63		 ora $63,s
$06:f959  04 80		 tsb $80
$06:f95b  41 60		 eor ($60,x)
$06:f95d  34 28		 bit $28,x
$06:f95f  05 8e		 ora $8e
$06:f961  07 6c		 ora [$6c]
$06:f963  87 ce		 sta [$ce]
$06:f965  23 f3		 and $f3,s
$06:f967  29 f4		 and #$f4
$06:f969  1a			inc a
$06:f96a  0d 4f a7	  ora $a74f
$06:f96d  f3 b9		 sbc ($b9,s),y
$06:f96f  fe ff 7f	  inc $7fff,x
$06:f972  f3 fe		 sbc ($fe,s),y
$06:f974  ff 0f 07 ff   sbc $ff070f,x
$06:f978  83 ff		 sta $ff,s
$06:f97a  7d 90 c4	  adc $c490,x
$06:f97d  30 58		 bmi $f9d7
$06:f97f  0f 17 83 21   ora $218317
$06:f983  f0 a8		 beq $f92d
$06:f985  54 35 03	  mvn $03,$35
$06:f988  00 82		 brk #$82
$06:f98a  43 a1		 eor $a1,s
$06:f98c  d8			cld
$06:f98d  6c 35 8b	  jmp ($8b35)
$06:f990  c5 12		 cmp $12
$06:f992  f9 08 43	  sbc $4308,y
$06:f995  59 fc ff	  eor $fffc,y
$06:f998  7f 93 a1 0f   adc $0fa193,x
$06:f99c  87 c4		 sta [$c4]
$06:f99e  23 f2		 and $f2,s
$06:f9a0  09 dd		 ora #$dd
$06:f9a2  82 7f e2	  brl $dc24
$06:f9a5  9f d8 67 b2   sta $b267d8,x
$06:f9a9  49 e1		 eor #$e1
$06:f9ab  04 0e		 tsb $0e
$06:f9ad  61 60		 adc ($60,x)
$06:f9af  bf d1 2f fc   lda $fc2fd1,x
$06:f9b3  0f fa 1c 38   ora $381cfa
$06:f9b7  5f fe 99 38   eor $3899fe,x
$06:f9bb  f0 18		 beq $f9d5
$06:f9bd  0a			asl a
$06:f9be  07 01		 ora [$01]
$06:f9c0  2a			rol a
$06:f9c1  19 8c 05	  ora $058c,y
$06:f9c4  e1 fc		 sbc ($fc,x)
$06:f9c6  10 0a		 bpl $f9d2
$06:f9c8  05 01		 ora $01
$06:f9ca  26 52		 rol $52
$06:f9cc  8f 44 f3 f9   sta $f9f344
$06:f9d0  7c fe 2a	  jmp ($2afe,x)
$06:f9d3  89 f6		 bit #$f6
$06:f9d5  47 10		 eor [$10]
$06:f9d7  89 47		 bit #$47
$06:f9d9  a4 53		 ldy $53
$06:f9db  e9 29		 sbc #$29
$06:f9dd  f0 27		 beq $fa06
$06:f9df  f2 09		 sbc ($09)
$06:f9e1  f9 bd 24	  sbc $24bd,y
$06:f9e4  33 fa		 and ($fa,s),y
$06:f9e6  0d fe 85	  ora $85fe
$06:f9e9  7f a0 32 84   adc $8432a0,x
$06:f9ed  3a			dec a
$06:f9ee  10 88		 bpl $f978
$06:f9f0  04 c2		 tsb $c2
$06:f9f2  01 b0		 ora ($b0,x)
$06:f9f4  80 68		 bra $fa5e
$06:f9f6  30 15		 bmi $fa0d
$06:f9f8  0e 05 33	  asl $3305
$06:f9fb  81 6c		 sta ($6c,x)
$06:f9fd  f0 42		 beq $fa41
$06:f9ff  21 02		 and ($02,x)
$06:fa01  d0 fc		 bne $f9ff
$06:fa03  7e 3e 5f	  ror $5f3e,x
$06:fa06  2b			pld
$06:fa07  b7 d9		 lda [$d9],y
$06:fa09  4e 0a 70	  lsr $700a
$06:fa0c  0f 84 02 05   ora $050284
$06:fa10  02 81		 cop #$81
$06:fa12  cc 62 74	  cpy $7462
$06:fa15  a9 37		 lda #$37
$06:fa17  56 1b		 lsr $1b,x
$06:fa19  55 9e		 eor $9e,x
$06:fa1b  74 21		 stz $21,x
$06:fa1d  0f 90 80 ab   ora $ab8090
$06:fa21  c6 c1		 dec $c1
$06:fa23  00 88		 brk #$88
$06:fa25  c0 2c 50	  cpy #$502c
$06:fa28  0c 1c 02	  tsb $021c
$06:fa2b  ce 08 1c	  dec $1c08
$06:fa2e  07 00		 ora [$00]
$06:fa30  20 14 ca	  jsr $ca14
$06:fa33  45 5a		 eor $5a
$06:fa35  c1 ab		 cmp ($ab,x)
$06:fa37  d8			cld
$06:fa38  7a			ply
$06:fa39  b7 90		 lda [$90],y
$06:fa3b  b8			clv
$06:fa3c  80 64		 bra $faa2
$06:fa3e  12 60		 ora ($60)
$06:fa40  93 0c		 sta ($0c,s),y
$06:fa42  34 03		 bit $03,x
$06:fa44  11 00		 ora ($00),y
$06:fa46  a3 40		 lda $40,s
$06:fa48  38			sec
$06:fa49  38			sec
$06:fa4a  0f 30 a0 60   ora $60a030
$06:fa4e  30 29		 bmi $fa79
$06:fa50  84 4a		 sty $4a
$06:fa52  a5 33		 lda $33
$06:fa54  e8			inx
$06:fa55  c3 ea		 cmp $ea,s
$06:fa57  b3 de		 lda ($de,s),y
$06:fa59  ac 32 a1	  ldy $a132
$06:fa5c  38			sec
$06:fa5d  1c 83 fc	  trb $fc83
$06:fa60  2c 2d 01	  bit $012d
$06:fa63  01 86		 ora ($86,x)
$06:fa65  0a			asl a
$06:fa66  01 63		 ora ($63,x)
$06:fa68  80 61		 bra $facb
$06:fa6a  c9 02		 cmp #$02
$06:fa6c  0f 0c 67 23   ora $23670c
$06:fa70  9d c8 a5	  sta $a5c8,x
$06:fa73  dc 35 5b	  jml [$5b35]
$06:fa76  cf 5e c2 15   cmp $15c25e
$06:fa7a  1c 2c 80	  trb $802c
$06:fa7d  84 70		 sty $70
$06:fa7f  19 01 10	  ora $1001,y
$06:fa82  d0 60		 bne $fae4
$06:fa84  1c 6c 07	  trb $076c
$06:fa87  84 d0		 sty $d0
$06:fa89  22 f2 a5 48   jsl $48a5f2
$06:fa8d  c6 a5		 dec $a5
$06:fa8f  f5 c6		 sbc $c6,x
$06:fa91  3e d0 82	  rol $82d0,x
$06:fa94  11 02		 ora ($02),y
$06:fa96  21 c0		 and ($c0,x)
$06:fa98  c1 4a		 cmp ($4a,x)
$06:fa9a  51 0e		 eor ($0e),y
$06:fa9c  b7 00		 lda [$00],y
$06:fa9e  aa			tax
$06:fa9f  5e fd 88	  lsr $88fd,x
$06:faa2  6d 0c 21	  adc $210c
$06:faa5  88			dey
$06:faa6  32 1f		 and ($1f)
$06:faa8  00 54		 brk #$54
$06:faaa  71 88		 adc ($88),y
$06:faac  c4 b2		 cpy $b2
$06:faae  49 1c		 eor #$1c
$06:fab0  6f 84 02 49   adc $490284
$06:fab4  24 88		 bit $88
$06:fab6  4d 16 00	  eor $0016
$06:fab9  b0 00		 bcs $fabb
$06:fabb  00 46		 brk #$46
$06:fabd  20 13 c8	  jsr $c813
$06:fac0  44 f1 80	  mvp $80,$f1
$06:fac3  2b			pld
$06:fac4  50 8c		 bvc $fa52
$06:fac6  42 19		 wdm #$19
$06:fac8  61 aa		 adc ($aa,x)
$06:faca  00 0e		 brk #$0e
$06:facc  01 a1		 ora ($a1,x)
$06:face  2d ef 77	  and $77ef
$06:fad1  bc e2 71	  ldy $71e2,x
$06:fad4  f0 e0		 beq $fab6
$06:fad6  72 e8		 adc ($e8)
$06:fad8  6e db 80	  ror $80db
$06:fadb  7c 28 0e	  jmp ($0e28,x)
$06:fade  f8			sed
$06:fadf  8e 47 21	  stx $2147
$06:fae2  f0 3e		 beq $fb22
$06:fae4  9f 05 d1 51   sta $51d105,x
$06:fae8  c8			iny
$06:fae9  04 3e		 tsb $3e
$06:faeb  03 f1		 ora $f1,s
$06:faed  ff e4 3f f1   sbc $f13fe4,x
$06:faf1  0f fc 23 ff   ora $ff23fc
$06:faf5  f7 ff		 sbc [$ff],y
$06:faf7  d0 29		 bne $fb22
$06:faf9  f2 d8		 sbc ($d8)
$06:fafb  7c e4 fe	  jmp ($fee4,x)
$06:fafe  1f f1 fb 6c   ora $6cfbf1,x
$06:fb02  3f ff 0f fd   and $fd0fff,x
$06:fb06  fa			plx
$06:fb07  fe 85 04	  inc $0485,x
$06:fb0a  f8			sed
$06:fb0b  4e 3f 12	  lsr $123f
$06:fb0e  ef f7 4b fd   sbc $fd4bf7
$06:fb12  28			plp
$06:fb13  f7 4f		 sbc [$4f],y
$06:fb15  bf d0 8f f7   lda $f78fd0,x
$06:fb19  e3 f1		 sbc $f1,s
$06:fb1b  7c fe 41	  jmp ($41fe,x)
$06:fb1e  bf d0 03 20   lda $2003d0,x
$06:fb22  c4 0c		 cpy $0c
$06:fb24  87 21		 sta [$21]
$06:fb26  9c 46 e3	  stz $e346
$06:fb29  10 58		 bpl $fb83
$06:fb2b  0c 09 12	  tsb $1209
$06:fb2e  08			php
$06:fb2f  90 80		 bcc $fab1
$06:fb31  9e 80 ee	  stz $ee80,x
$06:fb34  14 7b		 trb $7b
$06:fb36  fc 9e 7f	  jsr ($7f9e,x)
$06:fb39  3e 9f c3	  rol $c39f,x
$06:fb3c  21 e8		 and ($e8,x)
$06:fb3e  50 83		 bvc $fac3
$06:fb40  41 d1		 eor ($d1,x)
$06:fb42  21 14		 and ($14,x)
$06:fb44  8b			phb
$06:fb45  e4 22		 cpx $22
$06:fb47  1d 0f 86	  ora $860f,x
$06:fb4a  73 81		 adc ($81,s),y
$06:fb4c  6c e0 57	  jmp ($57e0)
$06:fb4f  33 13		 and ($13,s),y
$06:fb51  0d c5 03	  ora $03c5
$06:fb54  f1 88		 sbc ($88),y
$06:fb56  fc 7a bf	  jsr ($bf7a,x)
$06:fb59  50 ef		 bvc $fb4a
$06:fb5b  f1 6c		 sbc ($6c),y
$06:fb5d  0b			phd
$06:fb5e  61 66		 adc ($66,x)
$06:fb60  ff 51 bf d0   sbc $d0bf51,x
$06:fb64  4f e2 ac 24   eor $24ace2
$06:fb68  33 f5		 and ($f5,s),y
$06:fb6a  78			sei
$06:fb6b  44 e3 f4	  mvp $f4,$e3
$06:fb6e  38			sec
$06:fb6f  1c 8a 07	  trb $078a
$06:fb72  3c 8f c8	  bit $c88f,x
$06:fb75  a7 f2		 lda [$f2]
$06:fb77  39 fd 42	  and $42fd,y
$06:fb7a  ff 00 9f d8   sbc $d89f00,x
$06:fb7e  2f f7 cb fc   and $fccbf7
$06:fb82  f2 7f		 sbc ($7f)
$06:fb84  20 9f d0	  jsr $d09f
$06:fb87  18			clc
$06:fb88  03 10		 ora $10,s
$06:fb8a  f8			sed
$06:fb8b  33 c2		 and ($c2,s),y
$06:fb8d  61 f0		 adc ($f0,x)
$06:fb8f  b8			clv
$06:fb90  7c 26 9f	  jmp ($9f26,x)
$06:fb93  0b			phd
$06:fb94  07 83		 ora [$83]
$06:fb96  d1 e0		 cmp ($e0),y
$06:fb98  e4 70		 cpx $70
$06:fb9a  21 9f		 and ($9f,x)
$06:fb9c  c8			iny
$06:fb9d  47 e2		 eor [$e2]
$06:fb9f  1b			tcs
$06:fba0  fd 6f 82	  sbc $826f,x
$06:fba3  84 23		 sty $23
$06:fba5  df e8 e7 f2   cmp $f2e7e8,x
$06:fba9  79 fc ec	  adc $ecfc,y
$06:fbac  42 2b		 wdm #$2b
$06:fbae  b2 cf		 lda ($cf)
$06:fbb0  cd a2 f9	  cmp $f9a2
$06:fbb3  34 be		 bit $be,x
$06:fbb5  45 b1		 eor $b1
$06:fbb7  f8			sed
$06:fbb8  bf 1b 0c 20   lda $200c1b,x
$06:fbbc  16 78		 asl $78,x
$06:fbbe  06 0e		 asl $0e
$06:fbc0  01 07		 ora ($07,x)
$06:fbc2  80 78		 bra $fc3c
$06:fbc4  e4 1e		 cpx $1e
$06:fbc6  38			sec
$06:fbc7  15 c0		 ora $c0,x
$06:fbc9  54 22 10	  mvn $10,$22
$06:fbcc  8d 9a 43	  sta $439a
$06:fbcf  61 dd		 adc ($dd,x)
$06:fbd1  ca			dex
$06:fbd2  6f a5 53 eb   adc $eb53a5
$06:fbd6  47 c7		 eor [$c7]
$06:fbd8  a3 c7		 lda $c7,s
$06:fbda  31 8f		 and ($8f),y
$06:fbdc  9a			txs
$06:fbdd  01 c1		 ora ($c1,x)
$06:fbdf  c0 78 b0	  cpy #$b078
$06:fbe2  1c 78 17	  trb $1778
$06:fbe5  1e 81 0e	  asl $0e81,x
$06:fbe8  80 4e		 bra $fc38
$06:fbea  01 83		 ora ($83,x)
$06:fbec  48			pha
$06:fbed  9c 7f 71	  stz $717f
$06:fbf0  9f 98 47 f2   sta $f24798,x
$06:fbf4  c9 7c		 cmp #$7c
$06:fbf6  9b			txy
$06:fbf7  5f e2 78 fc   eor $fc78e2,x
$06:fbfb  43 ec		 eor $ec,s
$06:fbfd  30 e7		 bmi $fbe6
$06:fbff  71 01		 adc ($01),y
$06:fc01  81 d8		 sta ($d8,x)
$06:fc03  3c 72 2f	  bit $2f72,x
$06:fc06  04 00		 tsb $00
$06:fc08  12 51		 ora ($51)
$06:fc0a  28			plp
$06:fc0b  e7 df		 sbc [$df]
$06:fc0d  72 13		 adc ($13)
$06:fc0f  af 0c 03 80   lda $80030c
$06:fc13  22 b7 78 53   jsl $5378b7
$06:fc17  67 8f		 adc [$8f]
$06:fc19  3f 02 5f cb   and $cb5f02,x
$06:fc1d  79 df c8	  adc $c8df,y
$06:fc20  6f 64 93 eb   adc $eb9364
$06:fc24  57 fb		 eor [$fb],y
$06:fc26  91 f1		 sta ($f1),y
$06:fc28  88			dey
$06:fc29  86 c0		 stx $c0
$06:fc2b  3e 5e 0c	  rol $0c5e,x
$06:fc2e  07 0a		 ora [$0a]
$06:fc30  01 c7		 ora ($c7,x)
$06:fc32  a1 10		 lda ($10,x)
$06:fc34  c0 52 8a	  cpy #$8a52
$06:fc37  e4 94		 cpx $94
$06:fc39  4a			lsr a
$06:fc3a  2e 95 4a	  rol $4a95
$06:fc3d  8d 17 85	  sta $8517
$06:fc40  45 57		 eor $57
$06:fc42  34 40		 bit $40,x
$06:fc44  54 11 09	  mvn $09,$11
$06:fc47  d4 03		 pei ($03)
$06:fc49  74 ae		 stz $ae,x
$06:fc4b  75 71		 adc $71,x
$06:fc4d  54 2a 1e	  mvn $1e,$2a
$06:fc50  ad 53 3a	  lda $3a53
$06:fc53  a4 10		 ldy $10
$06:fc55  0b			phd
$06:fc56  a3 ac		 lda $ac,s
$06:fc58  15 cb		 ora $cb,x
$06:fc5a  38			sec
$06:fc5b  9c 7c 38	  stz $387c
$06:fc5e  1c 8a 07	  trb $078a
$06:fc61  4e 26 ce	  lsr $ce26
$06:fc64  81 58		 sta ($58,x)
$06:fc66  7c 28 04	  jmp ($0428,x)
$06:fc69  90 57		 bcc $fcc2
$06:fc6b  34 72		 bit $72,x
$06:fc6d  39 0f 81	  and $810f,y
$06:fc70  c4 e0		 cpy $e0
$06:fc72  3c be 43	  bit $43be,x
$06:fc75  3a			dec a
$06:fc76  11 61		 ora ($61),y
$06:fc78  0f 80 aa 40   ora $40aa80
$06:fc7c  56 13		 lsr $13,x
$06:fc7e  48			pha
$06:fc7f  85 5e		 sta $5e
$06:fc81  21 2c		 and ($2c,x)
$06:fc83  bf d0 27 f6   lda $f627d0,x
$06:fc87  7b			tdc
$06:fc88  e4 92		 cpx $92
$06:fc8a  79 14 8e	  adc $8e14,y
$06:fc8d  5f af f6 fb   eor $fbf6af,x
$06:fc91  ff bf ff c3   sbc $c3ffbf,x
$06:fc95  22 0e 0f ff   jsl $ff0f0e
$06:fc99  43 bf		 eor $bf,s
$06:fc9b  c8			iny
$06:fc9c  a7 d0		 lda [$d0]
$06:fc9e  8f d4 53 e5   sta $e553d4
$06:fca2  98			tya
$06:fca3  fc 7c ae	  jsr ($ae7c,x)
$06:fca6  14 2e		 trb $2e
$06:fca8  25 33		 and $33
$06:fcaa  01 c4		 ora ($c4,x)
$06:fcac  7b			tdc
$06:fcad  84 02		 sty $02
$06:fcaf  09 fe		 ora #$fe
$06:fcb1  86 7f		 stx $7f
$06:fcb3  a0 df ec	  ldy #$ecdf
$06:fcb6  7f ff 7f ff   adc $ff7fff,x
$06:fcba  34 07		 bit $07,x
$06:fcbc  fb			xce
$06:fcbd  fd fc fe	  sbc $fefc,x
$06:fcc0  40			rti
$06:fcc1  a0 71 18	  ldy #$1871
$06:fcc4  5c 52 0f 24   jml $240f52
$06:fcc8  8f c8 23 33   sta $3323c8
$06:fccc  28			plp
$06:fccd  1c 22 1e	  trb $1e22
$06:fcd0  15 18		 ora $18,x
$06:fcd2  fc f2 7f	  jsr ($7ff2,x)
$06:fcd5  38			sec
$06:fcd6  9f dc 2f e3   sta $e32fdc,x
$06:fcda  f0 be		 beq $fc9a
$06:fcdc  5f d0 a1 1f   eor $1fa1d0,x
$06:fce0  8f e2 3f 1f   sta $1f3fe2
$06:fce4  0f 85 63 81   ora $816385
$06:fce8  10 e0		 bpl $fcca
$06:fcea  48			pha
$06:fceb  3c 09 70	  bit $7009,x
$06:fcee  98			tya
$06:fcef  03 46		 ora $46,s
$06:fcf1  09 fc		 ora #$fc
$06:fcf3  84 7e		 sty $7e
$06:fcf5  27 0a		 and [$0a]
$06:fcf7  21 8c		 and ($8c,x)
$06:fcf9  29 8d		 and #$8d
$06:fcfb  22 11 28 dc   jsl $dc2811
$06:fcff  2e 07 3a	  rol $3a07
$06:fd02  81 cc		 sta ($cc,x)
$06:fd04  60			rts
$06:fd05  36 08		 rol $08,x
$06:fd07  c4 92		 cpy $92
$06:fd09  31 2f		 and ($2f),y
$06:fd0b  88			dey
$06:fd0c  0b			phd
$06:fd0d  42 89		 wdm #$89
$06:fd0f  5f 44 87 f0   eor $f08744,x
$06:fd13  d4 06		 pei ($06)
$06:fd15  81 bf		 sta ($bf,x)
$06:fd17  b2 46		 lda ($46)
$06:fd19  7f 3f 49 87   adc $87493f,x
$06:fd1d  83 c1		 sta $c1,s
$06:fd1f  60			rts
$06:fd20  4d 07 c3	  eor $c307
$06:fd23  61 e0		 adc ($e0,x)
$06:fd25  dc 78 2e	  jml [$2e78]
$06:fd28  16 04		 asl $04,x
$06:fd2a  e8			inx
$06:fd2b  4f 3f 8a 70   eor $708a3f
$06:fd2f  88			dey
$06:fd30  7c 14 21	  jmp ($2114,x)
$06:fd33  1c fe 47	  trb $47fe
$06:fd36  bf d9 e3 60   lda $60e3d9,x
$06:fd3a  f7 22		 sbc [$22],y
$06:fd3c  d3 59		 cmp ($59,s),y
$06:fd3e  66 a6		 ror $a6
$06:fd40  31 fc		 and ($fc),y
$06:fd42  86 74		 stx $74
$06:fd44  23 34		 and $34,s
$06:fd46  49 77		 eor #$77
$06:fd48  46 19		 lsr $19
$06:fd4a  50 9e		 bvc $fcea
$06:fd4c  78			sei
$06:fd4d  e0 5c 38	  cpx #$385c
$06:fd50  05 9e		 ora $9e
$06:fd52  01 03		 ora ($03,x)
$06:fd54  80 59		 bra $fdaf
$06:fd56  a0 19 18	  ldy #$1819
$06:fd59  05 8e		 ora $8e
$06:fd5b  01 83		 ora ($83,x)
$06:fd5d  80 6e		 bra $fdcd
$06:fd5f  ed 1e cd	  sbc $cd1e
$06:fd62  a7 57		 lda [$57]
$06:fd64  31 3f		 and ($3f),y
$06:fd66  98			tya
$06:fd67  52 f3		 eor ($f3)
$06:fd69  1a			inc a
$06:fd6a  6b			rtl
$06:fd6b  87 2f		 sta [$2f]
$06:fd6d  61 8a		 adc ($8a,x)
$06:fd6f  9e 71 e8	  stz $e871,x
$06:fd72  1c 3c 07	  trb $073c
$06:fd75  9b			txy
$06:fd76  01 c0		 ora ($c0,x)
$06:fd78  03 0e		 ora $0e,s
$06:fd7a  26 01		 rol $01
$06:fd7c  c6 c0		 dec $c0
$06:fd7e  70 5b		 bvs $fddb
$06:fd80  c1 26		 cmp ($26,x)
$06:fd82  d2 c7		 cmp ($c7)
$06:fd84  3f 30 8f e4   and $e48f30,x
$06:fd88  37 e1		 and [$e1],y
$06:fd8a  0a			asl a
$06:fd8b  e8			inx
$06:fd8c  c7 28		 cmp [$28]
$06:fd8e  12 ce		 ora ($ce)
$06:fd90  84 3b		 sty $3b
$06:fd92  87 02		 sta [$02]
$06:fd94  05 82		 ora $82
$06:fd96  f4 20 50	  pea $5020
$06:fd99  08			php
$06:fd9a  28			plp
$06:fd9b  28			plp
$06:fd9c  72 70		 adc ($70)
$06:fd9e  0b			phd
$06:fd9f  08			php
$06:fda0  39 b6 18	  and $18b6,y
$06:fda3  fa			plx
$06:fda4  87 2f		 sta [$2f]
$06:fda6  71 86		 adc ($86),y
$06:fda8  0b			phd
$06:fda9  05 c0		 ora $c0
$06:fdab  3e 94 08	  rol $0894,x
$06:fdae  06 80		 asl $80
$06:fdb0  54 3c 98	  mvn $98,$3c
$06:fdb3  06 1a		 asl $1a
$06:fdb5  00 ef		 brk #$ef
$06:fdb7  58			cli
$06:fdb8  6f 42 35 41   adc $413542
$06:fdbc  1e 04 32	  asl $3204,x
$06:fdbf  c1 0e		 cmp ($0e,x)
$06:fdc1  7f a1 14 2c   adc $2c14a1,x
$06:fdc5  a4 a1		 ldy $a1
$06:fdc7  05 80		 ora $80
$06:fdc9  24 37		 bit $37
$06:fdcb  96 4f		 stx $4f,y
$06:fdcd  2e e3 bf	  rol $bfe3
$06:fdd0  90 2a		 bcc $fdfc
$06:fdd2  86 2e		 stx $2e
$06:fdd4  b1 c6		 lda ($c6),y
$06:fdd6  4b			phk
$06:fdd7  04 c2		 tsb $c2
$06:fdd9  0d 70 e1	  ora $e170
$06:fddc  d0 05		 bne $fde3
$06:fdde  61 e0		 adc ($e0,x)
$06:fde0  32 0e		 and ($0e)
$06:fde2  9a			txs
$06:fde3  01 c9		 ora ($c9,x)
$06:fde5  c0 71 85	  cpy #$8571
$06:fde8  03 07		 ora $07,s
$06:fdea  81 ce		 sta ($ce,x)
$06:fdec  27 13		 and [$13]
$06:fdee  f8			sed
$06:fdef  c4 f6		 cpy $f6
$06:fdf1  05 7f		 ora $7f
$06:fdf3  8f ea 66 1d   sta $1d66ea
$06:fdf7  d8			cld
$06:fdf8  49 ac		 eor #$ac
$06:fdfa  15 e0		 ora $e0,x
$06:fdfc  dd 0b 94	  cmp $940b,x
$06:fdff  42 e1		 wdm #$e1
$06:fe01  00 32		 brk #$32
$06:fe03  85 7e		 sta $7e
$06:fe05  21 3f		 and ($3f,x)
$06:fe07  84 cf		 sty $cf
$06:fe09  e0 1c 0b	  cpx #$0b1c
$06:fe0c  94 2e		 sty $2e,x
$06:fe0e  1d fa 83	  ora $83fa,x
$06:fe11  54 b5 5e	  mvn $5e,$b5
$06:fe14  df 5d 6a 37   cmp $376a5d,x
$06:fe18  54 a6 d0	  mvn $d0,$a6
$06:fe1b  20 d8 d8	  jsr $d8d8
$06:fe1e  04 06		 tsb $06
$06:fe20  01 a1		 ora ($a1,x)
$06:fe22  23 0c		 and $0c,s
$06:fe24  52 01		 eor ($01)
$06:fe26  f4 88 7c	  pea $7c88
$06:fe29  a8			tay
$06:fe2a  1f 87 00 40   ora $400087,x
$06:fe2e  67 73		 adc [$73]
$06:fe30  99 fc 79	  sta $79fc,y
$06:fe33  9a			txs
$06:fe34  0b			phd
$06:fe35  76 60		 ror $60,x
$06:fe37  81 14		 sta ($14,x)
$06:fe39  2e f1 66	  rol $66f1
$06:fe3c  2c 52 a2	  bit $a252
$06:fe3f  ce 60 c7	  dec $c760
$06:fe42  79 2a 1a	  adc $1a2a,y
$06:fe45  8f af f2 af   sta $aff2af
$06:fe49  16 a9		 asl $a9,x
$06:fe4b  d1 aa		 cmp ($aa),y
$06:fe4d  91 ef		 sta ($ef),y
$06:fe4f  44 03 d5	  mvp $d5,$03
$06:fe52  00 89		 brk #$89
$06:fe54  40			rti
$06:fe55  20 c8 41	  jsr $41c8
$06:fe58  fc 44 3f	  jsr ($3f44,x)
$06:fe5b  14 0f		 trb $0f
$06:fe5d  03 b8		 ora $b8,s
$06:fe5f  6e 77 1b	  ror $1b77
$06:fe62  fc da fb	  jsr ($fbda,x)
$06:fe65  02 df		 cop #$df
$06:fe67  c7 ed		 cmp [$ed]
$06:fe69  2f a7 f3 c9   and $c9f3a7
$06:fe6d  85 a1		 sta $a1
$06:fe6f  c0 80 67	  cpy #$6780
$06:fe72  c1 5e		 cmp ($5e,x)
$06:fe74  1b			tcs
$06:fe75  f1 60		 sbc ($60),y
$06:fe77  9b			txy
$06:fe78  96 40		 stx $40,y
$06:fe7a  75 18		 adc $18,x
$06:fe7c  81 e4		 sta ($e4,x)
$06:fe7e  63 07		 adc $07,s
$06:fe80  05 42		 ora $42
$06:fe82  8c 41 12	  sty $1241
$06:fe85  31 83		 and ($83),y
$06:fe87  f2 c0		 sbc ($c0)
$06:fe89  20 89 51	  jsr $5189
$06:fe8c  84 26		 sty $26
$06:fe8e  44 fc b0	  mvp $b0,$fc
$06:fe91  45 28		 eor $28
$06:fe93  c2 15		 rep #$15
$06:fe95  22 8d 0d 53   jsl $530d8d
$06:fe99  f8			sed
$06:fe9a  70 0b		 bvs $fea7
$06:fe9c  09 5f		 ora #$5f
$06:fe9e  72 bf		 adc ($bf)
$06:fea0  db			stp
$06:fea1  db			stp
$06:fea2  d0 85		 bne $fe29
$06:fea4  54 27 ff	  mvn $ff,$27
$06:fea7  5c 7e eb 4f   jml $4feb7e
$06:feab  bc 81 ef	  ldy $ef81,x
$06:feae  e0 16 78	  cpx #$7816
$06:feb1  04 0e		 tsb $0e
$06:feb3  01 65		 ora ($65,x)
$06:feb5  6d 09 d8	  adc $d809
$06:feb8  28			plp
$06:feb9  00 43		 brk #$43
$06:febb  40			rti
$06:febc  94 2e		 sty $2e,x
$06:febe  a1 2a		 lda ($2a,x)
$06:fec0  fe 6b fe	  inc $fe6b,x
$06:fec3  35 df		 and $df,x
$06:fec5  2c f7 81	  bit $81f7
$06:fec8  fd 80 79	  sbc $7980,x
$06:fecb  88			dey
$06:fecc  c3 a6		 cmp $a6,s
$06:fece  80 40		 bra $ff10
$06:fed0  52 a2		 eor ($a2)
$06:fed2  67 01		 adc [$01]
$06:fed4  29 20		 and #$20
$06:fed6  4a			lsr a
$06:fed7  a1 3b		 lda ($3b,x)
$06:fed9  e8			inx
$06:feda  c3 ea		 cmp $ea,s
$06:fedc  53 ff		 eor ($ff,s),y
$06:fede  ce 1f 79	  dec $791f
$06:fee1  a3 7c		 lda $7c,s
$06:fee3  86 ce		 stx $ce
$06:fee5  01 60		 ora ($60,x)
$06:fee7  80 61		 bra $ff4a
$06:fee9  07 82		 ora [$82]
$06:feeb  01 a8		 ora ($a8,x)
$06:feed  57 73		 eor [$73],y
$06:feef  57 f0		 eor [$f0],y
$06:fef1  a5 7f		 lda $7f
$06:fef3  33 fe		 and ($fe,s),y
$06:fef5  19 ef 14	  ora $14ef,y
$06:fef8  32 1c		 and ($1c)
$06:fefa  d8			cld
$06:fefb  04 1a		 tsb $1a
$06:fefd  01 21		 ora ($21,x)
$06:feff  2e 08 86	  rol $8608
$06:ff02  ba			tsx
$06:ff03  1b			tcs
$06:ff04  b1 8e		 lda ($8e),y
$06:ff06  25 80		 and $80
$06:ff08  83 90		 sta $90,s
$06:ff0a  be e9 47	  ldx $47e9,y
$06:ff0d  08			php
$06:ff0e  a0 61 ce	  ldy #$ce61
$06:ff11  14 4b		 trb $4b
$06:ff13  cb			wai
$06:ff14  27 fc		 and [$fc]
$06:ff16  47 fb		 eor [$fb]
$06:ff18  b0 0d		 bcs $ff27
$06:ff1a  bc 63 eb	  ldy $eb63,x
$06:ff1d  40			rti
$06:ff1e  e7 c2		 sbc [$c2]
$06:ff20  af 50 09 ec   lda $ec0950
$06:ff24  42 30		 wdm #$30
$06:ff26  04 1b		 tsb $1b
$06:ff28  14 02		 trb $02
$06:ff2a  e5 10		 sbc $10
$06:ff2c  9d 40 26	  sta $2640,x
$06:ff2f  00 b1		 brk #$b1
$06:ff31  dd ef 2a	  cmp $2aef,x
$06:ff34  ff 8b fe 02   sbc $02fe8b,x
$06:ff38  af 04 ff 42   lda $42ff04
$06:ff3c  2b			pld
$06:ff3d  50 0f		 bvc $ff4e
$06:ff3f  f6 93		 inc $93,x
$06:ff41  48			pha
$06:ff42  08			php
$06:ff43  5d 44 01	  eor $0144,x
$06:ff46  ba			tsx
$06:ff47  0d d0 05	  ora $05d0
$06:ff4a  92 bd		 sta ($bd)
$06:ff4c  37 d0		 and [$d0],y
$06:ff4e  0b			phd
$06:ff4f  3c c3 dd	  bit $ddc3,x
$06:ff52  80 cf		 bra $ff23
$06:ff54  c4 6f		 cpy $6f
$06:ff56  2b			pld
$06:ff57  e3 21		 sbc $21,s
$06:ff59  87 06		 sta [$06]
$06:ff5b  01 e9		 ora ($e9,x)
$06:ff5d  90 5c		 bcc $ffbb
$06:ff5f  47 82		 eor [$82]
$06:ff61  8d 0d d6	  sta $d60d
$06:ff64  f2 ac		 sbc ($ac)
$06:ff66  d2 0c		 cmp ($0c)
$06:ff68  46 ae		 lsr $ae
$06:ff6a  05 ff		 ora $ff
$06:ff6c  82 6b 60	  brl $5fda
$06:ff6f  1f fa 95 49   ora $4995fa,x
$06:ff73  bc b5 48	  ldy $48b5,x
$06:ff76  00 74		 brk #$74
$06:ff78  03 a0		 ora $a0,s
$06:ff7a  eb			xba
$06:ff7b  85 af		 sta $af
$06:ff7d  b1 9c		 lda ($9c),y
$06:ff7f  1e 96 b0	  asl $b096,x
$06:ff82  b0 db		 bcs $ff5f
$06:ff84  43 41		 eor $41,s
$06:ff86  92 c9		 sta ($c9)
$06:ff88  37 97		 and [$97],y
$06:ff8a  29 00		 and #$00
$06:ff8c  2e 81 74	  rol $7481
$06:ff8f  1d 47 4c	  ora $4c47,x
$06:ff92  80 50		 bra $ffe4
$06:ff94  93 c3		 sta ($c3,s),y
$06:ff96  38			sec
$06:ff97  80 47		 bra $ffe0
$06:ff99  d1 c1		 cmp ($c1),y
$06:ff9b  00 81		 brk #$81
$06:ff9d  9b			txy
$06:ff9e  86 99		 stx $99
$06:ffa0  42 a1		 wdm #$a1
$06:ffa2  48			pha
$06:ffa3  24 13		 bit $13
$06:ffa5  89 c4		 bit #$c4
$06:ffa7  7e 3f 0b	  ror $0b3f,x
$06:ffaa  85 c0		 sta $c0
$06:ffac  cf 83 00 99   cmp $990083
$06:ffb0  1c 45 4a	  trb $4a45
$06:ffb3  11 c8		 ora ($c8),y
$06:ffb5  07 e2		 ora [$e2]
$06:ffb7  01 d0		 ora ($d0,x)
$06:ffb9  80 70		 bra $002b
$06:ffbb  11 c3		 ora ($c3),y
$06:ffbd  32 40		 and ($40)
$06:ffbf  84 12		 sty $12
$06:ffc1  09 1c		 ora #$1c
$06:ffc3  8e 7e 3f	  stx $3f7e
$06:ffc6  1d 0e 87	  ora $870e,x
$06:ffc9  01 38		 ora ($38,x)
$06:ffcb  3a			dec a
$06:ffcc  a1 10		 lda ($10,x)
$06:ffce  80 c1		 bra $ff91
$06:ffd0  63 0b		 adc $0b,s
$06:ffd2  ee 57 fb	  inc $fb57
$06:ffd5  7f 40 01 01   adc $010140,x
$06:ffd9  00 01		 brk #$01
$06:ffdb  ea			nop
$06:ffdc  73 1d		 adc ($1d,s),y
$06:ffde  f9 cd ea	  sbc $eacd,y
$06:ffe1  3f f3 ab cd   and $cdabf3,x
$06:ffe5  07 e7		 ora [$e7]
$06:ffe7  33 aa		 and ($aa,s),y
$06:ffe9  1f c7 7f 80   ora $807fc7,x
$06:ffed  3c 23 e2	  bit $e223,x
$06:fff0  2f 19 f9 13   and $13f919
$06:fff4  ca			dex
$06:fff5  be 66 f3	  ldx $f366,y
$06:fff8  bf a2 3d 33   lda $333da2,x
$06:fffc  ee 83 f0	  inc $f083
$06:ffff  00 01		 brk #$01
