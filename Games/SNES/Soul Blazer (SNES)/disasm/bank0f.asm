; Soul Blazer (SNES) - Bank $0f
; Disassembled from ROM
; File offset: $078000-$07ffff
; CPU address: $0f:$8000-$0f:$ffff
;===========================================================

.bank $0f
.org $8000

$0f:8000  6c 80 9e	  jmp ($9e80)
$0f:8003  80 b0		 bra $7fb5
$0f:8005  80 c2		 bra $7fc9
$0f:8007  80 f4		 bra $7ffd
$0f:8009  80 36		 bra $8041
$0f:800b  81 50		 sta ($50,x)
$0f:800d  81 5a		 sta ($5a,x)
$0f:800f  81 74		 sta ($74,x)
$0f:8011  81 7e		 sta ($7e,x)
$0f:8013  81 98		 sta ($98,x)
$0f:8015  81 b2		 sta ($b2,x)
$0f:8017  81 cc		 sta ($cc,x)
$0f:8019  81 e6		 sta ($e6,x)
$0f:801b  81 f8		 sta ($f8,x)
$0f:801d  81 12		 sta ($12,x)
$0f:801f  82 34 82	  brl $0256
$0f:8022  56 82		 lsr $82,x
$0f:8024  78			sei
$0f:8025  82 a2 82	  brl $02ca
$0f:8028  d4 82		 pei ($82)
$0f:802a  e6 82		 inc $82
$0f:802c  f8			sed
$0f:802d  82 0a 83	  brl $033a
$0f:8030  1c 83 3e	  trb $3e83
$0f:8033  83 50		 sta $50,s
$0f:8035  83 72		 sta $72,s
$0f:8037  83 94		 sta $94,s
$0f:8039  83 b6		 sta $b6,s
$0f:803b  83 e0		 sta $e0,s
$0f:803d  83 22		 sta $22,s
$0f:803f  84 64		 sty $64
$0f:8041  84 a6		 sty $a6
$0f:8043  84 e8		 sty $e8
$0f:8045  84 2a		 sty $2a
$0f:8047  85 6c		 sta $6c
$0f:8049  85 ae		 sta $ae
$0f:804b  85 c8		 sta $c8
$0f:804d  85 0a		 sta $0a
$0f:804f  86 4c		 stx $4c
$0f:8051  86 8e		 stx $8e
$0f:8053  86 d0		 stx $d0
$0f:8055  86 12		 stx $12
$0f:8057  87 54		 sta [$54]
$0f:8059  87 96		 sta [$96]
$0f:805b  87 d8		 sta [$d8]
$0f:805d  87 02		 sta [$02]
$0f:805f  88			dey
$0f:8060  0c 88 36	  tsb $3688
$0f:8063  88			dey
$0f:8064  40			rti
$0f:8065  88			dey
$0f:8066  6a			ror a
$0f:8067  88			dey
$0f:8068  94 88		 sty $88,x
$0f:806a  d6 88		 dec $88,x
$0f:806c  02 00		 cop #$00
$0f:806e  00 00		 brk #$00
$0f:8070  00 00		 brk #$00
$0f:8072  18			clc
$0f:8073  89 02		 bit #$02
$0f:8075  00 00		 brk #$00
$0f:8077  00 00		 brk #$00
$0f:8079  00 42		 brk #$42
$0f:807b  89 02		 bit #$02
$0f:807d  00 00		 brk #$00
$0f:807f  00 00		 brk #$00
$0f:8081  00 6c		 brk #$6c
$0f:8083  89 02		 bit #$02
$0f:8085  00 00		 brk #$00
$0f:8087  00 00		 brk #$00
$0f:8089  00 96		 brk #$96
$0f:808b  89 01		 bit #$01
$0f:808d  00 00		 brk #$00
$0f:808f  00 00		 brk #$00
$0f:8091  00 42		 brk #$42
$0f:8093  89 01		 bit #$01
$0f:8095  00 00		 brk #$00
$0f:8097  00 00		 brk #$00
$0f:8099  00 c0		 brk #$c0
$0f:809b  89 ff		 bit #$ff
$0f:809d  ff 03 00 fc   sbc $fc0003,x
$0f:80a1  ff 00 00 ea   sbc $ea0000,x
$0f:80a5  89 03		 bit #$03
$0f:80a7  00 fc		 brk #$fc
$0f:80a9  ff 00 00 ff   sbc $ff0000,x
$0f:80ad  89 ff		 bit #$ff
$0f:80af  ff 03 00 00   sbc $000003,x
$0f:80b3  00 04		 brk #$04
$0f:80b5  00 14		 brk #$14
$0f:80b7  8a			txa
$0f:80b8  03 00		 ora $00,s
$0f:80ba  00 00		 brk #$00
$0f:80bc  04 00		 tsb $00
$0f:80be  29 8a		 and #$8a
$0f:80c0  ff ff 01 00   sbc $0001ff,x
$0f:80c4  00 00		 brk #$00
$0f:80c6  00 00		 brk #$00
$0f:80c8  3e 8a 03	  rol $038a,x
$0f:80cb  00 00		 brk #$00
$0f:80cd  00 00		 brk #$00
$0f:80cf  00 68		 brk #$68
$0f:80d1  8a			txa
$0f:80d2  03 00		 ora $00,s
$0f:80d4  00 00		 brk #$00
$0f:80d6  00 00		 brk #$00
$0f:80d8  92 8a		 sta ($8a)
$0f:80da  03 00		 ora $00,s
$0f:80dc  00 00		 brk #$00
$0f:80de  00 00		 brk #$00
$0f:80e0  bc 8a 03	  ldy $038a,x
$0f:80e3  00 00		 brk #$00
$0f:80e5  00 00		 brk #$00
$0f:80e7  00 e6		 brk #$e6
$0f:80e9  8a			txa
$0f:80ea  03 00		 ora $00,s
$0f:80ec  00 00		 brk #$00
$0f:80ee  00 00		 brk #$00
$0f:80f0  2c 8b ff	  bit $ff8b
$0f:80f3  ff 02 00 00   sbc $000002,x
$0f:80f7  00 00		 brk #$00
$0f:80f9  00 8e		 brk #$8e
$0f:80fb  8b			phb
$0f:80fc  02 00		 cop #$00
$0f:80fe  00 00		 brk #$00
$0f:8100  00 00		 brk #$00
$0f:8102  16 8d		 asl $8d,x
$0f:8104  02 00		 cop #$00
$0f:8106  00 00		 brk #$00
$0f:8108  00 00		 brk #$00
$0f:810a  78			sei
$0f:810b  8d 02 00	  sta $0002
$0f:810e  00 00		 brk #$00
$0f:8110  00 00		 brk #$00
$0f:8112  da			phx
$0f:8113  8d 02 00	  sta $0002
$0f:8116  00 00		 brk #$00
$0f:8118  00 00		 brk #$00
$0f:811a  20 8e 02	  jsr $028e
$0f:811d  00 00		 brk #$00
$0f:811f  00 00		 brk #$00
$0f:8121  00 66		 brk #$66
$0f:8123  8e 02 00	  stx $0002
$0f:8126  00 00		 brk #$00
$0f:8128  00 00		 brk #$00
$0f:812a  90 8e		 bcc $80ba
$0f:812c  02 00		 cop #$00
$0f:812e  00 00		 brk #$00
$0f:8130  00 00		 brk #$00
$0f:8132  ba			tsx
$0f:8133  8e ff ff	  stx $ffff
$0f:8136  02 00		 cop #$00
$0f:8138  fc ff 00	  jsr ($00ff,x)
$0f:813b  00 0c		 brk #$0c
$0f:813d  8c 02 00	  sty $0002
$0f:8140  fc ff 00	  jsr ($00ff,x)
$0f:8143  00 28		 brk #$28
$0f:8145  8c 01 00	  sty $0001
$0f:8148  fc ff 00	  jsr ($00ff,x)
$0f:814b  00 52		 brk #$52
$0f:814d  8c ff ff	  sty $ffff
$0f:8150  03 00		 ora $00,s
$0f:8152  fc ff 00	  jsr ($00ff,x)
$0f:8155  00 8a		 brk #$8a
$0f:8157  8c ff ff	  sty $ffff
$0f:815a  02 00		 cop #$00
$0f:815c  00 00		 brk #$00
$0f:815e  04 00		 tsb $00
$0f:8160  a6 8c		 ldx $8c
$0f:8162  02 00		 cop #$00
$0f:8164  00 00		 brk #$00
$0f:8166  04 00		 tsb $00
$0f:8168  c2 8c		 rep #$8c
$0f:816a  01 00		 ora ($00,x)
$0f:816c  00 00		 brk #$00
$0f:816e  04 00		 tsb $00
$0f:8170  d7 8c		 cmp [$8c],y
$0f:8172  ff ff 03 00   sbc $0003ff,x
$0f:8176  00 00		 brk #$00
$0f:8178  04 00		 tsb $00
$0f:817a  fa			plx
$0f:817b  8c ff ff	  sty $ffff
$0f:817e  03 00		 ora $00,s
$0f:8180  00 00		 brk #$00
$0f:8182  00 00		 brk #$00
$0f:8184  e4 8e		 cpx $8e
$0f:8186  03 00		 ora $00,s
$0f:8188  00 00		 brk #$00
$0f:818a  00 00		 brk #$00
$0f:818c  0e 8f 03	  asl $038f
$0f:818f  00 00		 brk #$00
$0f:8191  00 00		 brk #$00
$0f:8193  00 38		 brk #$38
$0f:8195  8f ff ff 03   sta $03ffff
$0f:8199  00 00		 brk #$00
$0f:819b  00 00		 brk #$00
$0f:819d  00 62		 brk #$62
$0f:819f  8f 03 00 00   sta $000003
$0f:81a3  00 00		 brk #$00
$0f:81a5  00 8c		 brk #$8c
$0f:81a7  8f 03 00 00   sta $000003
$0f:81ab  00 00		 brk #$00
$0f:81ad  00 b6		 brk #$b6
$0f:81af  8f ff ff 03   sta $03ffff
$0f:81b3  00 00		 brk #$00
$0f:81b5  00 00		 brk #$00
$0f:81b7  00 e0		 brk #$e0
$0f:81b9  8f 03 00 00   sta $000003
$0f:81bd  00 00		 brk #$00
$0f:81bf  00 0a		 brk #$0a
$0f:81c1  90 03		 bcc $81c6
$0f:81c3  00 00		 brk #$00
$0f:81c5  00 00		 brk #$00
$0f:81c7  00 34		 brk #$34
$0f:81c9  90 ff		 bcc $81ca
$0f:81cb  ff 03 00 00   sbc $000003,x
$0f:81cf  00 00		 brk #$00
$0f:81d1  00 5e		 brk #$5e
$0f:81d3  90 03		 bcc $81d8
$0f:81d5  00 00		 brk #$00
$0f:81d7  00 00		 brk #$00
$0f:81d9  00 88		 brk #$88
$0f:81db  90 03		 bcc $81e0
$0f:81dd  00 00		 brk #$00
$0f:81df  00 00		 brk #$00
$0f:81e1  00 b2		 brk #$b2
$0f:81e3  90 ff		 bcc $81e4
$0f:81e5  ff 01 00 00   sbc $000001,x
$0f:81e9  00 00		 brk #$00
$0f:81eb  00 62		 brk #$62
$0f:81ed  8f 01 00 00   sta $000001
$0f:81f1  00 00		 brk #$00
$0f:81f3  00 38		 brk #$38
$0f:81f5  8f ff ff 00   sta $00ffff
$0f:81f9  00 00		 brk #$00
$0f:81fb  00 00		 brk #$00
$0f:81fd  00 e0		 brk #$e0
$0f:81ff  8f 00 00 00   sta $000000
$0f:8203  00 00		 brk #$00
$0f:8205  00 62		 brk #$62
$0f:8207  8f 00 00 00   sta $000000
$0f:820b  00 00		 brk #$00
$0f:820d  00 e4		 brk #$e4
$0f:820f  8e ff ff	  stx $ffff
$0f:8212  00 00		 brk #$00
$0f:8214  00 00		 brk #$00
$0f:8216  00 00		 brk #$00
$0f:8218  5e 90 00	  lsr $0090,x
$0f:821b  00 00		 brk #$00
$0f:821d  00 00		 brk #$00
$0f:821f  00 e0		 brk #$e0
$0f:8221  8f 00 00 00   sta $000000
$0f:8225  00 00		 brk #$00
$0f:8227  00 62		 brk #$62
$0f:8229  8f 00 00 00   sta $000000
$0f:822d  00 00		 brk #$00
$0f:822f  00 e4		 brk #$e4
$0f:8231  8e ff ff	  stx $ffff
$0f:8234  02 00		 cop #$00
$0f:8236  00 00		 brk #$00
$0f:8238  00 00		 brk #$00
$0f:823a  dc 90 05	  jml [$0590]
$0f:823d  00 00		 brk #$00
$0f:823f  00 00		 brk #$00
$0f:8241  00 30		 brk #$30
$0f:8243  91 07		 sta ($07),y
$0f:8245  00 00		 brk #$00
$0f:8247  00 00		 brk #$00
$0f:8249  00 5a		 brk #$5a
$0f:824b  91 04		 sta ($04),y
$0f:824d  00 00		 brk #$00
$0f:824f  00 00		 brk #$00
$0f:8251  00 3a		 brk #$3a
$0f:8253  92 ff		 sta ($ff)
$0f:8255  ff 05 00 00   sbc $000005,x
$0f:8259  00 00		 brk #$00
$0f:825b  00 06		 brk #$06
$0f:825d  91 05		 sta ($05),y
$0f:825f  00 00		 brk #$00
$0f:8261  00 00		 brk #$00
$0f:8263  00 5a		 brk #$5a
$0f:8265  91 06		 sta ($06),y
$0f:8267  00 00		 brk #$00
$0f:8269  00 00		 brk #$00
$0f:826b  00 84		 brk #$84
$0f:826d  91 04		 sta ($04),y
$0f:826f  00 00		 brk #$00
$0f:8271  00 00		 brk #$00
$0f:8273  00 9c		 brk #$9c
$0f:8275  92 ff		 sta ($ff)
$0f:8277  ff 01 00 00   sbc $000001,x
$0f:827b  00 00		 brk #$00
$0f:827d  00 06		 brk #$06
$0f:827f  91 03		 sta ($03),y
$0f:8281  00 00		 brk #$00
$0f:8283  00 00		 brk #$00
$0f:8285  00 5a		 brk #$5a
$0f:8287  91 05		 sta ($05),y
$0f:8289  00 00		 brk #$00
$0f:828b  00 00		 brk #$00
$0f:828d  00 84		 brk #$84
$0f:828f  91 07		 sta ($07),y
$0f:8291  00 00		 brk #$00
$0f:8293  00 00		 brk #$00
$0f:8295  00 e6		 brk #$e6
$0f:8297  91 04		 sta ($04),y
$0f:8299  00 00		 brk #$00
$0f:829b  00 00		 brk #$00
$0f:829d  00 fe		 brk #$fe
$0f:829f  92 ff		 sta ($ff)
$0f:82a1  ff 01 00 00   sbc $000001,x
$0f:82a5  00 00		 brk #$00
$0f:82a7  00 06		 brk #$06
$0f:82a9  91 02		 sta ($02),y
$0f:82ab  00 00		 brk #$00
$0f:82ad  00 00		 brk #$00
$0f:82af  00 5a		 brk #$5a
$0f:82b1  91 03		 sta ($03),y
$0f:82b3  00 00		 brk #$00
$0f:82b5  00 00		 brk #$00
$0f:82b7  00 84		 brk #$84
$0f:82b9  91 05		 sta ($05),y
$0f:82bb  00 00		 brk #$00
$0f:82bd  00 00		 brk #$00
$0f:82bf  00 e6		 brk #$e6
$0f:82c1  91 07		 sta ($07),y
$0f:82c3  00 00		 brk #$00
$0f:82c5  00 00		 brk #$00
$0f:82c7  00 10		 brk #$10
$0f:82c9  92 04		 sta ($04)
$0f:82cb  00 00		 brk #$00
$0f:82cd  00 00		 brk #$00
$0f:82cf  00 60		 brk #$60
$0f:82d1  93 ff		 sta ($ff,s),y
$0f:82d3  ff 01 00 00   sbc $000001,x
$0f:82d7  00 00		 brk #$00
$0f:82d9  00 c2		 brk #$c2
$0f:82db  93 01		 sta ($01,s),y
$0f:82dd  00 00		 brk #$00
$0f:82df  00 00		 brk #$00
$0f:82e1  00 ec		 brk #$ec
$0f:82e3  93 ff		 sta ($ff,s),y
$0f:82e5  ff 01 00 00   sbc $000001,x
$0f:82e9  00 00		 brk #$00
$0f:82eb  00 16		 brk #$16
$0f:82ed  94 01		 sty $01,x
$0f:82ef  00 00		 brk #$00
$0f:82f1  00 00		 brk #$00
$0f:82f3  00 40		 brk #$40
$0f:82f5  94 ff		 sty $ff,x
$0f:82f7  ff 01 00 00   sbc $000001,x
$0f:82fb  00 00		 brk #$00
$0f:82fd  00 6a		 brk #$6a
$0f:82ff  94 01		 sty $01,x
$0f:8301  00 00		 brk #$00
$0f:8303  00 00		 brk #$00
$0f:8305  00 7f		 brk #$7f
$0f:8307  94 ff		 sty $ff,x
$0f:8309  ff 01 00 00   sbc $000001,x
$0f:830d  00 00		 brk #$00
$0f:830f  00 94		 brk #$94
$0f:8311  94 00		 sty $00,x
$0f:8313  00 00		 brk #$00
$0f:8315  00 00		 brk #$00
$0f:8317  00 a9		 brk #$a9
$0f:8319  94 ff		 sty $ff,x
$0f:831b  ff 04 00 00   sbc $000004,x
$0f:831f  00 00		 brk #$00
$0f:8321  00 be		 brk #$be
$0f:8323  94 04		 sty $04,x
$0f:8325  00 00		 brk #$00
$0f:8327  00 00		 brk #$00
$0f:8329  00 d3		 brk #$d3
$0f:832b  94 04		 sty $04,x
$0f:832d  00 00		 brk #$00
$0f:832f  00 00		 brk #$00
$0f:8331  00 e8		 brk #$e8
$0f:8333  94 04		 sty $04,x
$0f:8335  00 00		 brk #$00
$0f:8337  00 00		 brk #$00
$0f:8339  00 fd		 brk #$fd
$0f:833b  94 ff		 sty $ff,x
$0f:833d  ff 02 00 00   sbc $000002,x
$0f:8341  00 01		 brk #$01
$0f:8343  00 be		 brk #$be
$0f:8345  94 02		 sty $02,x
$0f:8347  00 00		 brk #$00
$0f:8349  00 ff		 brk #$ff
$0f:834b  ff 12 95 ff   sbc $ff9512,x
$0f:834f  ff 03 00 00   sbc $000003,x
$0f:8353  00 00		 brk #$00
$0f:8355  00 27		 brk #$27
$0f:8357  95 03		 sta $03,x
$0f:8359  00 00		 brk #$00
$0f:835b  00 00		 brk #$00
$0f:835d  00 90		 brk #$90
$0f:835f  95 03		 sta $03,x
$0f:8361  00 00		 brk #$00
$0f:8363  00 00		 brk #$00
$0f:8365  00 3c		 brk #$3c
$0f:8367  95 03		 sta $03,x
$0f:8369  00 00		 brk #$00
$0f:836b  00 00		 brk #$00
$0f:836d  00 66		 brk #$66
$0f:836f  95 ff		 sta $ff,x
$0f:8371  ff 03 00 00   sbc $000003,x
$0f:8375  00 00		 brk #$00
$0f:8377  00 dd		 brk #$dd
$0f:8379  95 03		 sta $03,x
$0f:837b  00 00		 brk #$00
$0f:837d  00 00		 brk #$00
$0f:837f  00 f9		 brk #$f9
$0f:8381  95 03		 sta $03,x
$0f:8383  00 00		 brk #$00
$0f:8385  00 00		 brk #$00
$0f:8387  00 15		 brk #$15
$0f:8389  96 03		 stx $03,y
$0f:838b  00 00		 brk #$00
$0f:838d  00 00		 brk #$00
$0f:838f  00 31		 brk #$31
$0f:8391  96 ff		 stx $ff,y
$0f:8393  ff 01 00 00   sbc $000001,x
$0f:8397  00 00		 brk #$00
$0f:8399  00 4d		 brk #$4d
$0f:839b  96 01		 stx $01,y
$0f:839d  00 00		 brk #$00
$0f:839f  00 00		 brk #$00
$0f:83a1  00 77		 brk #$77
$0f:83a3  96 01		 stx $01,y
$0f:83a5  00 00		 brk #$00
$0f:83a7  00 00		 brk #$00
$0f:83a9  00 9a		 brk #$9a
$0f:83ab  96 01		 stx $01,y
$0f:83ad  00 00		 brk #$00
$0f:83af  00 00		 brk #$00
$0f:83b1  00 bd		 brk #$bd
$0f:83b3  96 ff		 stx $ff,y
$0f:83b5  ff 01 00 00   sbc $000001,x
$0f:83b9  00 00		 brk #$00
$0f:83bb  00 e0		 brk #$e0
$0f:83bd  96 01		 stx $01,y
$0f:83bf  00 00		 brk #$00
$0f:83c1  00 ff		 brk #$ff
$0f:83c3  ff 0a 97 01   sbc $01970a,x
$0f:83c7  00 00		 brk #$00
$0f:83c9  00 ff		 brk #$ff
$0f:83cb  ff 49 97 01   sbc $019749,x
$0f:83cf  00 00		 brk #$00
$0f:83d1  00 fe		 brk #$fe
$0f:83d3  ff 88 97 01   sbc $019788,x
$0f:83d7  00 00		 brk #$00
$0f:83d9  00 fe		 brk #$fe
$0f:83db  ff b9 97 ff   sbc $ff97b9,x
$0f:83df  ff 01 00 ff   sbc $ff0001,x
$0f:83e3  ff 01 00 37   sbc $370001,x
$0f:83e7  98			tya
$0f:83e8  01 00		 ora ($00,x)
$0f:83ea  ff ff 01 00   sbc $0001ff,x
$0f:83ee  99 98 01	  sta $0198,y
$0f:83f1  00 ff		 brk #$ff
$0f:83f3  ff 01 00 bf   sbc $bf0001,x
$0f:83f7  99 01 00	  sta $0001,y
$0f:83fa  ff ff 01 00   sbc $0001ff,x
$0f:83fe  21 9a		 and ($9a,x)
$0f:8400  01 00		 ora ($00,x)
$0f:8402  ff ff 01 00   sbc $0001ff,x
$0f:8406  fb			xce
$0f:8407  98			tya
$0f:8408  01 00		 ora ($00,x)
$0f:840a  ff ff 01 00   sbc $0001ff,x
$0f:840e  5d 99 01	  eor $0199,x
$0f:8411  00 ff		 brk #$ff
$0f:8413  ff 01 00 83   sbc $830001,x
$0f:8417  9a			txs
$0f:8418  01 00		 ora ($00,x)
$0f:841a  ff ff 01 00   sbc $0001ff,x
$0f:841e  e5 9a		 sbc $9a
$0f:8420  ff ff 01 00   sbc $0001ff,x
$0f:8424  ff ff ff ff   sbc $ffffff,x
$0f:8428  37 98		 and [$98],y
$0f:842a  01 00		 ora ($00,x)
$0f:842c  ff ff ff ff   sbc $ffffff,x
$0f:8430  99 98 01	  sta $0198,y
$0f:8433  00 ff		 brk #$ff
$0f:8435  ff ff ff bf   sbc $bfffff,x
$0f:8439  99 01 00	  sta $0001,y
$0f:843c  ff ff ff ff   sbc $ffffff,x
$0f:8440  21 9a		 and ($9a,x)
$0f:8442  01 00		 ora ($00,x)
$0f:8444  ff ff ff ff   sbc $ffffff,x
$0f:8448  fb			xce
$0f:8449  98			tya
$0f:844a  01 00		 ora ($00,x)
$0f:844c  ff ff ff ff   sbc $ffffff,x
$0f:8450  5d 99 01	  eor $0199,x
$0f:8453  00 ff		 brk #$ff
$0f:8455  ff ff ff 83   sbc $83ffff,x
$0f:8459  9a			txs
$0f:845a  01 00		 ora ($00,x)
$0f:845c  ff ff ff ff   sbc $ffffff,x
$0f:8460  e5 9a		 sbc $9a
$0f:8462  ff ff 01 00   sbc $0001ff,x
$0f:8466  00 00		 brk #$00
$0f:8468  fe ff 37	  inc $37ff,x
$0f:846b  98			tya
$0f:846c  01 00		 ora ($00,x)
$0f:846e  ff ff ff ff   sbc $ffffff,x
$0f:8472  99 98 01	  sta $0198,y
$0f:8475  00 ff		 brk #$ff
$0f:8477  ff ff ff bf   sbc $bfffff,x
$0f:847b  99 01 00	  sta $0001,y
$0f:847e  fe ff 00	  inc $00ff,x
$0f:8481  00 21		 brk #$21
$0f:8483  9a			txs
$0f:8484  01 00		 ora ($00,x)
$0f:8486  fe ff 00	  inc $00ff,x
$0f:8489  00 fb		 brk #$fb
$0f:848b  98			tya
$0f:848c  01 00		 ora ($00,x)
$0f:848e  ff ff 01 00   sbc $0001ff,x
$0f:8492  5d 99 01	  eor $0199,x
$0f:8495  00 ff		 brk #$ff
$0f:8497  ff 01 00 83   sbc $830001,x
$0f:849b  9a			txs
$0f:849c  01 00		 ora ($00,x)
$0f:849e  00 00		 brk #$00
$0f:84a0  02 00		 cop #$00
$0f:84a2  e5 9a		 sbc $9a
$0f:84a4  ff ff 01 00   sbc $0001ff,x
$0f:84a8  00 00		 brk #$00
$0f:84aa  02 00		 cop #$00
$0f:84ac  37 98		 and [$98],y
$0f:84ae  01 00		 ora ($00,x)
$0f:84b0  ff ff 01 00   sbc $0001ff,x
$0f:84b4  99 98 01	  sta $0198,y
$0f:84b7  00 ff		 brk #$ff
$0f:84b9  ff 01 00 bf   sbc $bf0001,x
$0f:84bd  99 01 00	  sta $0001,y
$0f:84c0  fe ff 00	  inc $00ff,x
$0f:84c3  00 21		 brk #$21
$0f:84c5  9a			txs
$0f:84c6  01 00		 ora ($00,x)
$0f:84c8  fe ff 00	  inc $00ff,x
$0f:84cb  00 fb		 brk #$fb
$0f:84cd  98			tya
$0f:84ce  01 00		 ora ($00,x)
$0f:84d0  ff ff ff ff   sbc $ffffff,x
$0f:84d4  5d 99 01	  eor $0199,x
$0f:84d7  00 ff		 brk #$ff
$0f:84d9  ff ff ff 83   sbc $83ffff,x
$0f:84dd  9a			txs
$0f:84de  01 00		 ora ($00,x)
$0f:84e0  00 00		 brk #$00
$0f:84e2  fe ff e5	  inc $e5ff,x
$0f:84e5  9a			txs
$0f:84e6  ff ff 01 00   sbc $0001ff,x
$0f:84ea  fe ff 00	  inc $00ff,x
$0f:84ed  00 37		 brk #$37
$0f:84ef  98			tya
$0f:84f0  01 00		 ora ($00,x)
$0f:84f2  ff ff 01 00   sbc $0001ff,x
$0f:84f6  99 98 01	  sta $0198,y
$0f:84f9  00 ff		 brk #$ff
$0f:84fb  ff 01 00 bf   sbc $bf0001,x
$0f:84ff  99 01 00	  sta $0001,y
$0f:8502  00 00		 brk #$00
$0f:8504  02 00		 cop #$00
$0f:8506  21 9a		 and ($9a,x)
$0f:8508  01 00		 ora ($00,x)
$0f:850a  00 00		 brk #$00
$0f:850c  02 00		 cop #$00
$0f:850e  fb			xce
$0f:850f  98			tya
$0f:8510  01 00		 ora ($00,x)
$0f:8512  01 00		 ora ($00,x)
$0f:8514  01 00		 ora ($00,x)
$0f:8516  5d 99 01	  eor $0199,x
$0f:8519  00 01		 brk #$01
$0f:851b  00 01		 brk #$01
$0f:851d  00 83		 brk #$83
$0f:851f  9a			txs
$0f:8520  01 00		 ora ($00,x)
$0f:8522  02 00		 cop #$00
$0f:8524  00 00		 brk #$00
$0f:8526  e5 9a		 sbc $9a
$0f:8528  ff ff 01 00   sbc $0001ff,x
$0f:852c  fe ff 00	  inc $00ff,x
$0f:852f  00 37		 brk #$37
$0f:8531  98			tya
$0f:8532  01 00		 ora ($00,x)
$0f:8534  ff ff ff ff   sbc $ffffff,x
$0f:8538  99 98 01	  sta $0198,y
$0f:853b  00 ff		 brk #$ff
$0f:853d  ff ff ff bf   sbc $bfffff,x
$0f:8541  99 01 00	  sta $0001,y
$0f:8544  00 00		 brk #$00
$0f:8546  fe ff 21	  inc $21ff,x
$0f:8549  9a			txs
$0f:854a  01 00		 ora ($00,x)
$0f:854c  00 00		 brk #$00
$0f:854e  fe ff fb	  inc $fbff,x
$0f:8551  98			tya
$0f:8552  01 00		 ora ($00,x)
$0f:8554  01 00		 ora ($00,x)
$0f:8556  ff ff 5d 99   sbc $995dff,x
$0f:855a  01 00		 ora ($00,x)
$0f:855c  01 00		 ora ($00,x)
$0f:855e  ff ff 83 9a   sbc $9a83ff,x
$0f:8562  01 00		 ora ($00,x)
$0f:8564  02 00		 cop #$00
$0f:8566  00 00		 brk #$00
$0f:8568  e5 9a		 sbc $9a
$0f:856a  ff ff 00 00   sbc $0000ff,x
$0f:856e  fa			plx
$0f:856f  ff 06 00 47   sbc $470006,x
$0f:8573  9b			txy
$0f:8574  00 00		 brk #$00
$0f:8576  00 00		 brk #$00
$0f:8578  09 00		 ora #$00
$0f:857a  5c 9b 00 00   jml $00009b
$0f:857e  06 00		 asl $00
$0f:8580  06 00		 asl $00
$0f:8582  47 9b		 eor [$9b]
$0f:8584  00 00		 brk #$00
$0f:8586  09 00		 ora #$00
$0f:8588  00 00		 brk #$00
$0f:858a  5c 9b 00 00   jml $00009b
$0f:858e  06 00		 asl $00
$0f:8590  fa			plx
$0f:8591  ff 47 9b 00   sbc $009b47,x
$0f:8595  00 00		 brk #$00
$0f:8597  00 f7		 brk #$f7
$0f:8599  ff 5c 9b 00   sbc $009b5c,x
$0f:859d  00 fa		 brk #$fa
$0f:859f  ff fa ff 47   sbc $47fffa,x
$0f:85a3  9b			txy
$0f:85a4  00 00		 brk #$00
$0f:85a6  f7 ff		 sbc [$ff],y
$0f:85a8  00 00		 brk #$00
$0f:85aa  5c 9b ff ff   jml $ffff9b
$0f:85ae  02 00		 cop #$00
$0f:85b0  00 00		 brk #$00
$0f:85b2  00 00		 brk #$00
$0f:85b4  71 9b		 adc ($9b),y
$0f:85b6  02 00		 cop #$00
$0f:85b8  00 00		 brk #$00
$0f:85ba  00 00		 brk #$00
$0f:85bc  8d 9b 02	  sta $029b
$0f:85bf  00 00		 brk #$00
$0f:85c1  00 00		 brk #$00
$0f:85c3  00 d5		 brk #$d5
$0f:85c5  97 ff		 sta [$ff],y
$0f:85c7  ff 01 00 00   sbc $000001,x
$0f:85cb  00 00		 brk #$00
$0f:85cd  00 37		 brk #$37
$0f:85cf  98			tya
$0f:85d0  01 00		 ora ($00,x)
$0f:85d2  00 00		 brk #$00
$0f:85d4  00 00		 brk #$00
$0f:85d6  d3 9b		 cmp ($9b,s),y
$0f:85d8  01 00		 ora ($00,x)
$0f:85da  00 00		 brk #$00
$0f:85dc  00 00		 brk #$00
$0f:85de  bf 99 01 00   lda $000199,x
$0f:85e2  00 00		 brk #$00
$0f:85e4  00 00		 brk #$00
$0f:85e6  d3 9b		 cmp ($9b,s),y
$0f:85e8  01 00		 ora ($00,x)
$0f:85ea  00 00		 brk #$00
$0f:85ec  00 00		 brk #$00
$0f:85ee  fb			xce
$0f:85ef  98			tya
$0f:85f0  01 00		 ora ($00,x)
$0f:85f2  00 00		 brk #$00
$0f:85f4  00 00		 brk #$00
$0f:85f6  d3 9b		 cmp ($9b,s),y
$0f:85f8  01 00		 ora ($00,x)
$0f:85fa  00 00		 brk #$00
$0f:85fc  00 00		 brk #$00
$0f:85fe  83 9a		 sta $9a,s
$0f:8600  01 00		 ora ($00,x)
$0f:8602  00 00		 brk #$00
$0f:8604  00 00		 brk #$00
$0f:8606  d3 9b		 cmp ($9b,s),y
$0f:8608  ff ff 01 00   sbc $0001ff,x
$0f:860c  00 00		 brk #$00
$0f:860e  00 00		 brk #$00
$0f:8610  37 98		 and [$98],y
$0f:8612  01 00		 ora ($00,x)
$0f:8614  00 00		 brk #$00
$0f:8616  00 00		 brk #$00
$0f:8618  99 98 01	  sta $0198,y
$0f:861b  00 00		 brk #$00
$0f:861d  00 00		 brk #$00
$0f:861f  00 bf		 brk #$bf
$0f:8621  99 01 00	  sta $0001,y
$0f:8624  00 00		 brk #$00
$0f:8626  00 00		 brk #$00
$0f:8628  21 9a		 and ($9a,x)
$0f:862a  01 00		 ora ($00,x)
$0f:862c  00 00		 brk #$00
$0f:862e  00 00		 brk #$00
$0f:8630  fb			xce
$0f:8631  98			tya
$0f:8632  01 00		 ora ($00,x)
$0f:8634  00 00		 brk #$00
$0f:8636  00 00		 brk #$00
$0f:8638  5d 99 01	  eor $0199,x
$0f:863b  00 00		 brk #$00
$0f:863d  00 00		 brk #$00
$0f:863f  00 83		 brk #$83
$0f:8641  9a			txs
$0f:8642  01 00		 ora ($00,x)
$0f:8644  00 00		 brk #$00
$0f:8646  00 00		 brk #$00
$0f:8648  e5 9a		 sbc $9a
$0f:864a  ff ff 01 00   sbc $0001ff,x
$0f:864e  01 00		 ora ($00,x)
$0f:8650  ff ff 37 98   sbc $9837ff,x
$0f:8654  01 00		 ora ($00,x)
$0f:8656  01 00		 ora ($00,x)
$0f:8658  ff ff 99 98   sbc $9899ff,x
$0f:865c  01 00		 ora ($00,x)
$0f:865e  01 00		 ora ($00,x)
$0f:8660  ff ff bf 99   sbc $99bfff,x
$0f:8664  01 00		 ora ($00,x)
$0f:8666  01 00		 ora ($00,x)
$0f:8668  ff ff 21 9a   sbc $9a21ff,x
$0f:866c  01 00		 ora ($00,x)
$0f:866e  01 00		 ora ($00,x)
$0f:8670  ff ff fb 98   sbc $98fbff,x
$0f:8674  01 00		 ora ($00,x)
$0f:8676  01 00		 ora ($00,x)
$0f:8678  ff ff 5d 99   sbc $995dff,x
$0f:867c  01 00		 ora ($00,x)
$0f:867e  01 00		 ora ($00,x)
$0f:8680  ff ff 83 9a   sbc $9a83ff,x
$0f:8684  01 00		 ora ($00,x)
$0f:8686  01 00		 ora ($00,x)
$0f:8688  ff ff e5 9a   sbc $9ae5ff,x
$0f:868c  ff ff 01 00   sbc $0001ff,x
$0f:8690  01 00		 ora ($00,x)
$0f:8692  01 00		 ora ($00,x)
$0f:8694  37 98		 and [$98],y
$0f:8696  01 00		 ora ($00,x)
$0f:8698  01 00		 ora ($00,x)
$0f:869a  01 00		 ora ($00,x)
$0f:869c  99 98 01	  sta $0198,y
$0f:869f  00 01		 brk #$01
$0f:86a1  00 01		 brk #$01
$0f:86a3  00 bf		 brk #$bf
$0f:86a5  99 01 00	  sta $0001,y
$0f:86a8  01 00		 ora ($00,x)
$0f:86aa  01 00		 ora ($00,x)
$0f:86ac  21 9a		 and ($9a,x)
$0f:86ae  01 00		 ora ($00,x)
$0f:86b0  01 00		 ora ($00,x)
$0f:86b2  01 00		 ora ($00,x)
$0f:86b4  fb			xce
$0f:86b5  98			tya
$0f:86b6  01 00		 ora ($00,x)
$0f:86b8  01 00		 ora ($00,x)
$0f:86ba  01 00		 ora ($00,x)
$0f:86bc  5d 99 01	  eor $0199,x
$0f:86bf  00 01		 brk #$01
$0f:86c1  00 01		 brk #$01
$0f:86c3  00 83		 brk #$83
$0f:86c5  9a			txs
$0f:86c6  01 00		 ora ($00,x)
$0f:86c8  01 00		 ora ($00,x)
$0f:86ca  01 00		 ora ($00,x)
$0f:86cc  e5 9a		 sbc $9a
$0f:86ce  ff ff 01 00   sbc $0001ff,x
$0f:86d2  00 00		 brk #$00
$0f:86d4  fe ff 37	  inc $37ff,x
$0f:86d7  98			tya
$0f:86d8  01 00		 ora ($00,x)
$0f:86da  01 00		 ora ($00,x)
$0f:86dc  ff ff 99 98   sbc $9899ff,x
$0f:86e0  01 00		 ora ($00,x)
$0f:86e2  01 00		 ora ($00,x)
$0f:86e4  ff ff bf 99   sbc $99bfff,x
$0f:86e8  01 00		 ora ($00,x)
$0f:86ea  02 00		 cop #$00
$0f:86ec  00 00		 brk #$00
$0f:86ee  21 9a		 and ($9a,x)
$0f:86f0  01 00		 ora ($00,x)
$0f:86f2  02 00		 cop #$00
$0f:86f4  00 00		 brk #$00
$0f:86f6  fb			xce
$0f:86f7  98			tya
$0f:86f8  01 00		 ora ($00,x)
$0f:86fa  01 00		 ora ($00,x)
$0f:86fc  01 00		 ora ($00,x)
$0f:86fe  5d 99 01	  eor $0199,x
$0f:8701  00 01		 brk #$01
$0f:8703  00 01		 brk #$01
$0f:8705  00 83		 brk #$83
$0f:8707  9a			txs
$0f:8708  01 00		 ora ($00,x)
$0f:870a  00 00		 brk #$00
$0f:870c  02 00		 cop #$00
$0f:870e  e5 9a		 sbc $9a
$0f:8710  ff ff 01 00   sbc $0001ff,x
$0f:8714  00 00		 brk #$00
$0f:8716  02 00		 cop #$00
$0f:8718  37 98		 and [$98],y
$0f:871a  01 00		 ora ($00,x)
$0f:871c  01 00		 ora ($00,x)
$0f:871e  01 00		 ora ($00,x)
$0f:8720  99 98 01	  sta $0198,y
$0f:8723  00 01		 brk #$01
$0f:8725  00 01		 brk #$01
$0f:8727  00 bf		 brk #$bf
$0f:8729  99 01 00	  sta $0001,y
$0f:872c  02 00		 cop #$00
$0f:872e  00 00		 brk #$00
$0f:8730  21 9a		 and ($9a,x)
$0f:8732  01 00		 ora ($00,x)
$0f:8734  02 00		 cop #$00
$0f:8736  00 00		 brk #$00
$0f:8738  fb			xce
$0f:8739  98			tya
$0f:873a  01 00		 ora ($00,x)
$0f:873c  01 00		 ora ($00,x)
$0f:873e  ff ff 5d 99   sbc $995dff,x
$0f:8742  01 00		 ora ($00,x)
$0f:8744  01 00		 ora ($00,x)
$0f:8746  ff ff 83 9a   sbc $9a83ff,x
$0f:874a  01 00		 ora ($00,x)
$0f:874c  00 00		 brk #$00
$0f:874e  fe ff e5	  inc $e5ff,x
$0f:8751  9a			txs
$0f:8752  ff ff 01 00   sbc $0001ff,x
$0f:8756  02 00		 cop #$00
$0f:8758  00 00		 brk #$00
$0f:875a  37 98		 and [$98],y
$0f:875c  01 00		 ora ($00,x)
$0f:875e  01 00		 ora ($00,x)
$0f:8760  01 00		 ora ($00,x)
$0f:8762  99 98 01	  sta $0198,y
$0f:8765  00 01		 brk #$01
$0f:8767  00 01		 brk #$01
$0f:8769  00 bf		 brk #$bf
$0f:876b  99 01 00	  sta $0001,y
$0f:876e  00 00		 brk #$00
$0f:8770  02 00		 cop #$00
$0f:8772  21 9a		 and ($9a,x)
$0f:8774  01 00		 ora ($00,x)
$0f:8776  00 00		 brk #$00
$0f:8778  02 00		 cop #$00
$0f:877a  fb			xce
$0f:877b  98			tya
$0f:877c  01 00		 ora ($00,x)
$0f:877e  ff ff 01 00   sbc $0001ff,x
$0f:8782  5d 99 01	  eor $0199,x
$0f:8785  00 ff		 brk #$ff
$0f:8787  ff 01 00 83   sbc $830001,x
$0f:878b  9a			txs
$0f:878c  01 00		 ora ($00,x)
$0f:878e  fe ff 00	  inc $00ff,x
$0f:8791  00 e5		 brk #$e5
$0f:8793  9a			txs
$0f:8794  ff ff 01 00   sbc $0001ff,x
$0f:8798  02 00		 cop #$00
$0f:879a  00 00		 brk #$00
$0f:879c  37 98		 and [$98],y
$0f:879e  01 00		 ora ($00,x)
$0f:87a0  01 00		 ora ($00,x)
$0f:87a2  ff ff 99 98   sbc $9899ff,x
$0f:87a6  01 00		 ora ($00,x)
$0f:87a8  01 00		 ora ($00,x)
$0f:87aa  ff ff bf 99   sbc $99bfff,x
$0f:87ae  01 00		 ora ($00,x)
$0f:87b0  00 00		 brk #$00
$0f:87b2  fe ff 21	  inc $21ff,x
$0f:87b5  9a			txs
$0f:87b6  01 00		 ora ($00,x)
$0f:87b8  00 00		 brk #$00
$0f:87ba  fe ff fb	  inc $fbff,x
$0f:87bd  98			tya
$0f:87be  01 00		 ora ($00,x)
$0f:87c0  ff ff ff ff   sbc $ffffff,x
$0f:87c4  5d 99 01	  eor $0199,x
$0f:87c7  00 ff		 brk #$ff
$0f:87c9  ff ff ff 83   sbc $83ffff,x
$0f:87cd  9a			txs
$0f:87ce  01 00		 ora ($00,x)
$0f:87d0  fe ff 00	  inc $00ff,x
$0f:87d3  00 e5		 brk #$e5
$0f:87d5  9a			txs
$0f:87d6  ff ff 02 00   sbc $0002ff,x
$0f:87da  ff ff 00 00   sbc $0000ff,x
$0f:87de  e8			inx
$0f:87df  9b			txy
$0f:87e0  02 00		 cop #$00
$0f:87e2  fe ff 00	  inc $00ff,x
$0f:87e5  00 e8		 brk #$e8
$0f:87e7  9b			txy
$0f:87e8  03 00		 ora $00,s
$0f:87ea  fd ff 00	  sbc $00ff,x
$0f:87ed  00 82		 brk #$82
$0f:87ef  a3 03		 lda $03,s
$0f:87f1  00 fc		 brk #$fc
$0f:87f3  ff 00 00 82   sbc $820000,x
$0f:87f7  a3 03		 lda $03,s
$0f:87f9  00 fa		 brk #$fa
$0f:87fb  ff 00 00 74   sbc $740000,x
$0f:87ff  9c ff ff	  stz $ffff
$0f:8802  03 00		 ora $00,s
$0f:8804  fa			plx
$0f:8805  ff 00 00 54   sbc $540000,x
$0f:8809  9d ff ff	  sta $ffff,x
$0f:880c  02 00		 cop #$00
$0f:880e  00 00		 brk #$00
$0f:8810  ff ff 2e 9c   sbc $9c2eff,x
$0f:8814  02 00		 cop #$00
$0f:8816  00 00		 brk #$00
$0f:8818  fe ff 2e	  inc $2eff,x
$0f:881b  9c 03 00	  stz $0003
$0f:881e  00 00		 brk #$00
$0f:8820  fd ff f2	  sbc $f2ff,x
$0f:8823  a3 03		 lda $03,s
$0f:8825  00 00		 brk #$00
$0f:8827  00 fc		 brk #$fc
$0f:8829  ff f2 a3 03   sbc $03a3f2,x
$0f:882d  00 00		 brk #$00
$0f:882f  00 fa		 brk #$fa
$0f:8831  ff e4 9c ff   sbc $ff9ce4,x
$0f:8835  ff 03 00 00   sbc $000003,x
$0f:8839  00 fa		 brk #$fa
$0f:883b  ff 9a 9d ff   sbc $ff9d9a,x
$0f:883f  ff 02 00 00   sbc $000002,x
$0f:8843  00 fc		 brk #$fc
$0f:8845  ff e0 9d 02   sbc $029de0,x
$0f:8849  00 00		 brk #$00
$0f:884b  00 fd		 brk #$fd
$0f:884d  ff 1f 9e 02   sbc $029e1f,x
$0f:8851  00 00		 brk #$00
$0f:8853  00 fe		 brk #$fe
$0f:8855  ff 5e 9e 02   sbc $029e5e,x
$0f:8859  00 00		 brk #$00
$0f:885b  00 ff		 brk #$ff
$0f:885d  ff 8f 9e 02   sbc $029e8f,x
$0f:8861  00 00		 brk #$00
$0f:8863  00 00		 brk #$00
$0f:8865  00 b2		 brk #$b2
$0f:8867  9e ff ff	  stz $ffff,x
$0f:886a  02 00		 cop #$00
$0f:886c  fc ff 00	  jsr ($00ff,x)
$0f:886f  00 c7		 brk #$c7
$0f:8871  9e 02 00	  stz $0002,x
$0f:8874  fd ff 00	  sbc $00ff,x
$0f:8877  00 06		 brk #$06
$0f:8879  9f 02 00 fe   sta $fe0002,x
$0f:887d  ff 00 00 45   sbc $450000,x
$0f:8881  9f 02 00 ff   sta $ff0002,x
$0f:8885  ff 00 00 76   sbc $760000,x
$0f:8889  9f 02 00 00   sta $000002,x
$0f:888d  00 00		 brk #$00
$0f:888f  00 99		 brk #$99
$0f:8891  9f ff ff 01   sta $01ffff,x
$0f:8895  00 00		 brk #$00
$0f:8897  00 00		 brk #$00
$0f:8899  00 ae		 brk #$ae
$0f:889b  9f 01 00 00   sta $000001,x
$0f:889f  00 00		 brk #$00
$0f:88a1  00 2c		 brk #$2c
$0f:88a3  a0 01		 ldy #$01
$0f:88a5  00 00		 brk #$00
$0f:88a7  00 00		 brk #$00
$0f:88a9  00 aa		 brk #$aa
$0f:88ab  a0 01		 ldy #$01
$0f:88ad  00 00		 brk #$00
$0f:88af  00 00		 brk #$00
$0f:88b1  00 28		 brk #$28
$0f:88b3  a1 01		 lda ($01,x)
$0f:88b5  00 00		 brk #$00
$0f:88b7  00 00		 brk #$00
$0f:88b9  00 98		 brk #$98
$0f:88bb  a1 01		 lda ($01,x)
$0f:88bd  00 00		 brk #$00
$0f:88bf  00 00		 brk #$00
$0f:88c1  00 16		 brk #$16
$0f:88c3  a2 01		 ldx #$01
$0f:88c5  00 00		 brk #$00
$0f:88c7  00 00		 brk #$00
$0f:88c9  00 94		 brk #$94
$0f:88cb  a2 01		 ldx #$01
$0f:88cd  00 00		 brk #$00
$0f:88cf  00 00		 brk #$00
$0f:88d1  00 12		 brk #$12
$0f:88d3  a3 ff		 lda $ff,s
$0f:88d5  ff 00 00 00   sbc $000000,x
$0f:88d9  00 00		 brk #$00
$0f:88db  00 ae		 brk #$ae
$0f:88dd  9f 00 00 00   sta $000000,x
$0f:88e1  00 00		 brk #$00
$0f:88e3  00 2c		 brk #$2c
$0f:88e5  a0 00		 ldy #$00
$0f:88e7  00 00		 brk #$00
$0f:88e9  00 00		 brk #$00
$0f:88eb  00 aa		 brk #$aa
$0f:88ed  a0 00		 ldy #$00
$0f:88ef  00 00		 brk #$00
$0f:88f1  00 00		 brk #$00
$0f:88f3  00 28		 brk #$28
$0f:88f5  a1 00		 lda ($00,x)
$0f:88f7  00 00		 brk #$00
$0f:88f9  00 00		 brk #$00
$0f:88fb  00 98		 brk #$98
$0f:88fd  a1 00		 lda ($00,x)
$0f:88ff  00 00		 brk #$00
$0f:8901  00 00		 brk #$00
$0f:8903  00 16		 brk #$16
$0f:8905  a2 00		 ldx #$00
$0f:8907  00 00		 brk #$00
$0f:8909  00 00		 brk #$00
$0f:890b  00 94		 brk #$94
$0f:890d  a2 00		 ldx #$00
$0f:890f  00 00		 brk #$00
$0f:8911  00 00		 brk #$00
$0f:8913  00 12		 brk #$12
$0f:8915  a3 ff		 lda $ff,s
$0f:8917  ff 08 00 18   sbc $180008,x
$0f:891b  00 18		 brk #$18
$0f:891d  00 08		 brk #$08
$0f:891f  00 10		 brk #$10
$0f:8921  00 10		 brk #$10
$0f:8923  00 04		 brk #$04
$0f:8925  00 01		 brk #$01
$0f:8927  00 10		 brk #$10
$0f:8929  00 10		 brk #$10
$0f:892b  60			rts
$0f:892c  06 01		 asl $01
$0f:892e  00 10		 brk #$10
$0f:8930  10 00		 bpl $8932
$0f:8932  60			rts
$0f:8933  86 01		 stx $01
$0f:8935  10 00		 bpl $8937
$0f:8937  10 00		 bpl $8939
$0f:8939  60			rts
$0f:893a  c6 01		 dec $01
$0f:893c  10 00		 bpl $893e
$0f:893e  00 10		 brk #$10
$0f:8940  60			rts
$0f:8941  46 08		 lsr $08
$0f:8943  00 18		 brk #$18
$0f:8945  00 18		 brk #$18
$0f:8947  00 08		 brk #$08
$0f:8949  00 10		 brk #$10
$0f:894b  00 10		 brk #$10
$0f:894d  00 04		 brk #$04
$0f:894f  00 01		 brk #$01
$0f:8951  00 10		 brk #$10
$0f:8953  00 10		 brk #$10
$0f:8955  62 06 01	  per $8a5e
$0f:8958  00 10		 brk #$10
$0f:895a  10 00		 bpl $895c
$0f:895c  62 86 01	  per $8ae5
$0f:895f  10 00		 bpl $8961
$0f:8961  10 00		 bpl $8963
$0f:8963  62 c6 01	  per $8b2c
$0f:8966  10 00		 bpl $8968
$0f:8968  00 10		 brk #$10
$0f:896a  62 46 08	  per $91b3
$0f:896d  00 18		 brk #$18
$0f:896f  00 18		 brk #$18
$0f:8971  00 08		 brk #$08
$0f:8973  00 10		 brk #$10
$0f:8975  00 10		 brk #$10
$0f:8977  00 04		 brk #$04
$0f:8979  00 01		 brk #$01
$0f:897b  00 10		 brk #$10
$0f:897d  00 10		 brk #$10
$0f:897f  80 06		 bra $8987
$0f:8981  01 00		 ora ($00,x)
$0f:8983  10 10		 bpl $8995
$0f:8985  00 80		 brk #$80
$0f:8987  86 01		 stx $01
$0f:8989  10 00		 bpl $898b
$0f:898b  10 00		 bpl $898d
$0f:898d  80 c6		 bra $8955
$0f:898f  01 10		 ora ($10,x)
$0f:8991  00 00		 brk #$00
$0f:8993  10 80		 bpl $8915
$0f:8995  46 08		 lsr $08
$0f:8997  00 18		 brk #$18
$0f:8999  00 18		 brk #$18
$0f:899b  00 08		 brk #$08
$0f:899d  00 10		 brk #$10
$0f:899f  00 10		 brk #$10
$0f:89a1  00 04		 brk #$04
$0f:89a3  00 01		 brk #$01
$0f:89a5  00 10		 brk #$10
$0f:89a7  00 10		 brk #$10
$0f:89a9  82 06 01	  brl $8ab2
$0f:89ac  00 10		 brk #$10
$0f:89ae  10 00		 bpl $89b0
$0f:89b0  82 86 01	  brl $8b39
$0f:89b3  10 00		 bpl $89b5
$0f:89b5  10 00		 bpl $89b7
$0f:89b7  82 c6 01	  brl $8b80
$0f:89ba  10 00		 bpl $89bc
$0f:89bc  00 10		 brk #$10
$0f:89be  82 46 08	  brl $9207
$0f:89c1  00 18		 brk #$18
$0f:89c3  00 18		 brk #$18
$0f:89c5  00 08		 brk #$08
$0f:89c7  00 10		 brk #$10
$0f:89c9  00 10		 brk #$10
$0f:89cb  00 04		 brk #$04
$0f:89cd  00 01		 brk #$01
$0f:89cf  00 10		 brk #$10
$0f:89d1  00 10		 brk #$10
$0f:89d3  84 06		 sty $06
$0f:89d5  01 00		 ora ($00,x)
$0f:89d7  10 10		 bpl $89e9
$0f:89d9  00 84		 brk #$84
$0f:89db  86 01		 stx $01
$0f:89dd  10 00		 bpl $89df
$0f:89df  10 00		 bpl $89e1
$0f:89e1  84 c6		 sty $c6
$0f:89e3  01 10		 ora ($10,x)
$0f:89e5  00 00		 brk #$00
$0f:89e7  10 84		 bpl $896d
$0f:89e9  46 00		 lsr $00
$0f:89eb  00 10		 brk #$10
$0f:89ed  00 10		 brk #$10
$0f:89ef  00 00		 brk #$00
$0f:89f1  00 10		 brk #$10
$0f:89f3  00 10		 brk #$10
$0f:89f5  00 01		 brk #$01
$0f:89f7  00 01		 brk #$01
$0f:89f9  00 00		 brk #$00
$0f:89fb  00 00		 brk #$00
$0f:89fd  64 06		 stz $06
$0f:89ff  00 00		 brk #$00
$0f:8a01  10 00		 bpl $8a03
$0f:8a03  10 00		 bpl $8a05
$0f:8a05  00 00		 brk #$00
$0f:8a07  10 00		 bpl $8a09
$0f:8a09  10 00		 bpl $8a0b
$0f:8a0b  01 00		 ora ($00,x)
$0f:8a0d  01 00		 ora ($00,x)
$0f:8a0f  00 00		 brk #$00
$0f:8a11  00 64		 brk #$64
$0f:8a13  86 00		 stx $00
$0f:8a15  00 10		 brk #$10
$0f:8a17  00 10		 brk #$10
$0f:8a19  00 00		 brk #$00
$0f:8a1b  00 10		 brk #$10
$0f:8a1d  00 10		 brk #$10
$0f:8a1f  00 01		 brk #$01
$0f:8a21  00 01		 brk #$01
$0f:8a23  00 00		 brk #$00
$0f:8a25  00 00		 brk #$00
$0f:8a27  66 06		 ror $06
$0f:8a29  00 00		 brk #$00
$0f:8a2b  10 00		 bpl $8a2d
$0f:8a2d  10 00		 bpl $8a2f
$0f:8a2f  00 00		 brk #$00
$0f:8a31  10 00		 bpl $8a33
$0f:8a33  10 00		 bpl $8a35
$0f:8a35  01 00		 ora ($00,x)
$0f:8a37  01 00		 ora ($00,x)
$0f:8a39  00 00		 brk #$00
$0f:8a3b  00 66		 brk #$66
$0f:8a3d  46 08		 lsr $08
$0f:8a3f  00 18		 brk #$18
$0f:8a41  00 18		 brk #$18
$0f:8a43  00 08		 brk #$08
$0f:8a45  00 10		 brk #$10
$0f:8a47  00 10		 brk #$10
$0f:8a49  00 04		 brk #$04
$0f:8a4b  00 01		 brk #$01
$0f:8a4d  00 10		 brk #$10
$0f:8a4f  00 10		 brk #$10
$0f:8a51  8e 06 01	  stx $0106
$0f:8a54  00 10		 brk #$10
$0f:8a56  10 00		 bpl $8a58
$0f:8a58  8e 86 01	  stx $0186
$0f:8a5b  10 00		 bpl $8a5d
$0f:8a5d  10 00		 bpl $8a5f
$0f:8a5f  8e c6 01	  stx $01c6
$0f:8a62  10 00		 bpl $8a64
$0f:8a64  00 10		 brk #$10
$0f:8a66  8e 46 08	  stx $0846
$0f:8a69  00 18		 brk #$18
$0f:8a6b  00 18		 brk #$18
$0f:8a6d  00 08		 brk #$08
$0f:8a6f  00 10		 brk #$10
$0f:8a71  00 10		 brk #$10
$0f:8a73  00 04		 brk #$04
$0f:8a75  00 01		 brk #$01
$0f:8a77  00 10		 brk #$10
$0f:8a79  00 10		 brk #$10
$0f:8a7b  6e 06 01	  ror $0106
$0f:8a7e  00 10		 brk #$10
$0f:8a80  10 00		 bpl $8a82
$0f:8a82  6e 86 01	  ror $0186
$0f:8a85  10 00		 bpl $8a87
$0f:8a87  10 00		 bpl $8a89
$0f:8a89  6e c6 01	  ror $01c6
$0f:8a8c  10 00		 bpl $8a8e
$0f:8a8e  00 10		 brk #$10
$0f:8a90  6e 46 08	  ror $0846
$0f:8a93  00 18		 brk #$18
$0f:8a95  00 18		 brk #$18
$0f:8a97  00 08		 brk #$08
$0f:8a99  00 10		 brk #$10
$0f:8a9b  00 10		 brk #$10
$0f:8a9d  00 04		 brk #$04
$0f:8a9f  00 01		 brk #$01
$0f:8aa1  00 10		 brk #$10
$0f:8aa3  00 10		 brk #$10
$0f:8aa5  8c 06 01	  sty $0106
$0f:8aa8  00 10		 brk #$10
$0f:8aaa  10 00		 bpl $8aac
$0f:8aac  8c 86 01	  sty $0186
$0f:8aaf  10 00		 bpl $8ab1
$0f:8ab1  10 00		 bpl $8ab3
$0f:8ab3  8c c6 01	  sty $01c6
$0f:8ab6  10 00		 bpl $8ab8
$0f:8ab8  00 10		 brk #$10
$0f:8aba  8c 46 08	  sty $0846
$0f:8abd  00 18		 brk #$18
$0f:8abf  00 18		 brk #$18
$0f:8ac1  00 08		 brk #$08
$0f:8ac3  00 10		 brk #$10
$0f:8ac5  00 10		 brk #$10
$0f:8ac7  00 04		 brk #$04
$0f:8ac9  00 01		 brk #$01
$0f:8acb  00 10		 brk #$10
$0f:8acd  00 10		 brk #$10
$0f:8acf  6c 06 01	  jmp ($0106)
$0f:8ad2  00 10		 brk #$10
$0f:8ad4  10 00		 bpl $8ad6
$0f:8ad6  6c 86 01	  jmp ($0186)
$0f:8ad9  10 00		 bpl $8adb
$0f:8adb  10 00		 bpl $8add
$0f:8add  6c c6 01	  jmp ($01c6)
$0f:8ae0  10 00		 bpl $8ae2
$0f:8ae2  00 10		 brk #$10
$0f:8ae4  6c 46 10	  jmp ($1046)
$0f:8ae7  00 20		 brk #$20
$0f:8ae9  00 20		 brk #$20
$0f:8aeb  00 10		 brk #$10
$0f:8aed  00 10		 brk #$10
$0f:8aef  00 10		 brk #$10
$0f:8af1  00 08		 brk #$08
$0f:8af3  00 01		 brk #$01
$0f:8af5  08			php
$0f:8af6  18			clc
$0f:8af7  08			php
$0f:8af8  18			clc
$0f:8af9  6c 06 01	  jmp ($0106)
$0f:8afc  08			php
$0f:8afd  18			clc
$0f:8afe  18			clc
$0f:8aff  08			php
$0f:8b00  6c 86 01	  jmp ($0186)
$0f:8b03  18			clc
$0f:8b04  08			php
$0f:8b05  18			clc
$0f:8b06  08			php
$0f:8b07  6c c6 01	  jmp ($01c6)
$0f:8b0a  18			clc
$0f:8b0b  08			php
$0f:8b0c  08			php
$0f:8b0d  18			clc
$0f:8b0e  6c 46 00	  jmp ($0046)
$0f:8b11  00 28		 brk #$28
$0f:8b13  10 18		 bpl $8b2d
$0f:8b15  8a			txa
$0f:8b16  06 00		 asl $00
$0f:8b18  18			clc
$0f:8b19  10 00		 bpl $8b1b
$0f:8b1b  28			plp
$0f:8b1c  8a			txa
$0f:8b1d  06 00		 asl $00
$0f:8b1f  28			plp
$0f:8b20  00 18		 brk #$18
$0f:8b22  10 8a		 bpl $8aae
$0f:8b24  06 00		 asl $00
$0f:8b26  10 18		 bpl $8b40
$0f:8b28  28			plp
$0f:8b29  00 8a		 brk #$8a
$0f:8b2b  06 08		 asl $08
$0f:8b2d  00 18		 brk #$18
$0f:8b2f  00 18		 brk #$18
$0f:8b31  00 08		 brk #$08
$0f:8b33  00 10		 brk #$10
$0f:8b35  00 10		 brk #$10
$0f:8b37  00 0c		 brk #$0c
$0f:8b39  00 01		 brk #$01
$0f:8b3b  00 10		 brk #$10
$0f:8b3d  00 10		 brk #$10
$0f:8b3f  8e 06 01	  stx $0106
$0f:8b42  00 10		 brk #$10
$0f:8b44  10 00		 bpl $8b46
$0f:8b46  8e 86 01	  stx $0186
$0f:8b49  10 00		 bpl $8b4b
$0f:8b4b  10 00		 bpl $8b4d
$0f:8b4d  8e c6 01	  stx $01c6
$0f:8b50  10 00		 bpl $8b52
$0f:8b52  00 10		 brk #$10
$0f:8b54  8e 46 00	  stx $0046
$0f:8b57  00 18		 brk #$18
$0f:8b59  08			php
$0f:8b5a  10 9b		 bpl $8af7
$0f:8b5c  06 00		 asl $00
$0f:8b5e  00 18		 brk #$18
$0f:8b60  10 08		 bpl $8b6a
$0f:8b62  9b			txy
$0f:8b63  06 00		 asl $00
$0f:8b65  08			php
$0f:8b66  10 00		 bpl $8b68
$0f:8b68  18			clc
$0f:8b69  9b			txy
$0f:8b6a  06 00		 asl $00
$0f:8b6c  10 08		 bpl $8b76
$0f:8b6e  00 18		 brk #$18
$0f:8b70  9b			txy
$0f:8b71  06 00		 asl $00
$0f:8b73  08			php
$0f:8b74  10 18		 bpl $8b8e
$0f:8b76  00 9b		 brk #$9b
$0f:8b78  06 00		 asl $00
$0f:8b7a  10 08		 bpl $8b84
$0f:8b7c  18			clc
$0f:8b7d  00 9b		 brk #$9b
$0f:8b7f  06 00		 asl $00
$0f:8b81  18			clc
$0f:8b82  00 10		 brk #$10
$0f:8b84  08			php
$0f:8b85  9b			txy
$0f:8b86  06 00		 asl $00
$0f:8b88  18			clc
$0f:8b89  00 08		 brk #$08
$0f:8b8b  10 9b		 bpl $8b28
$0f:8b8d  06 10		 asl $10
$0f:8b8f  00 20		 brk #$20
$0f:8b91  00 20		 brk #$20
$0f:8b93  00 10		 brk #$10
$0f:8b95  00 10		 brk #$10
$0f:8b97  00 10		 brk #$10
$0f:8b99  00 10		 brk #$10
$0f:8b9b  00 01		 brk #$01
$0f:8b9d  08			php
$0f:8b9e  18			clc
$0f:8b9f  08			php
$0f:8ba0  18			clc
$0f:8ba1  8e 06 01	  stx $0106
$0f:8ba4  08			php
$0f:8ba5  18			clc
$0f:8ba6  18			clc
$0f:8ba7  08			php
$0f:8ba8  8e 86 01	  stx $0186
$0f:8bab  18			clc
$0f:8bac  08			php
$0f:8bad  18			clc
$0f:8bae  08			php
$0f:8baf  8e c6 01	  stx $01c6
$0f:8bb2  18			clc
$0f:8bb3  08			php
$0f:8bb4  08			php
$0f:8bb5  18			clc
$0f:8bb6  8e 46 00	  stx $0046
$0f:8bb9  08			php
$0f:8bba  20 10 18	  jsr $1810
$0f:8bbd  9b			txy
$0f:8bbe  06 00		 asl $00
$0f:8bc0  08			php
$0f:8bc1  20 18 10	  jsr $1018
$0f:8bc4  9b			txy
$0f:8bc5  06 00		 asl $00
$0f:8bc7  10 18		 bpl $8be1
$0f:8bc9  08			php
$0f:8bca  20 9b 06	  jsr $069b
$0f:8bcd  00 18		 brk #$18
$0f:8bcf  10 08		 bpl $8bd9
$0f:8bd1  20 9b 06	  jsr $069b
$0f:8bd4  00 10		 brk #$10
$0f:8bd6  18			clc
$0f:8bd7  20 08 9b	  jsr $9b08
$0f:8bda  06 00		 asl $00
$0f:8bdc  18			clc
$0f:8bdd  10 20		 bpl $8bff
$0f:8bdf  08			php
$0f:8be0  9b			txy
$0f:8be1  06 00		 asl $00
$0f:8be3  20 08 18	  jsr $1808
$0f:8be6  10 9b		 bpl $8b83
$0f:8be8  06 00		 asl $00
$0f:8bea  20 08 10	  jsr $1008
$0f:8bed  18			clc
$0f:8bee  9b			txy
$0f:8bef  06 00		 asl $00
$0f:8bf1  00 28		 brk #$28
$0f:8bf3  10 18		 bpl $8c0d
$0f:8bf5  9a			txs
$0f:8bf6  06 00		 asl $00
$0f:8bf8  18			clc
$0f:8bf9  10 00		 bpl $8bfb
$0f:8bfb  28			plp
$0f:8bfc  9a			txs
$0f:8bfd  06 00		 asl $00
$0f:8bff  28			plp
$0f:8c00  00 18		 brk #$18
$0f:8c02  10 9a		 bpl $8b9e
$0f:8c04  06 00		 asl $00
$0f:8c06  10 18		 bpl $8c20
$0f:8c08  28			plp
$0f:8c09  00 9a		 brk #$9a
$0f:8c0b  06 00		 asl $00
$0f:8c0d  00 08		 brk #$08
$0f:8c0f  00 10		 brk #$10
$0f:8c11  00 00		 brk #$00
$0f:8c13  00 10		 brk #$10
$0f:8c15  00 10		 brk #$10
$0f:8c17  00 02		 brk #$02
$0f:8c19  00 00		 brk #$00
$0f:8c1b  00 00		 brk #$00
$0f:8c1d  00 08		 brk #$08
$0f:8c1f  86 06		 stx $06
$0f:8c21  00 00		 brk #$00
$0f:8c23  00 08		 brk #$08
$0f:8c25  00 96		 brk #$96
$0f:8c27  06 00		 asl $00
$0f:8c29  00 10		 brk #$10
$0f:8c2b  00 10		 brk #$10
$0f:8c2d  00 00		 brk #$00
$0f:8c2f  00 10		 brk #$10
$0f:8c31  00 10		 brk #$10
$0f:8c33  00 04		 brk #$04
$0f:8c35  00 00		 brk #$00
$0f:8c37  00 08		 brk #$08
$0f:8c39  00 08		 brk #$08
$0f:8c3b  86 06		 stx $06
$0f:8c3d  00 00		 brk #$00
$0f:8c3f  08			php
$0f:8c40  08			php
$0f:8c41  00 96		 brk #$96
$0f:8c43  06 00		 asl $00
$0f:8c45  08			php
$0f:8c46  00 00		 brk #$00
$0f:8c48  08			php
$0f:8c49  87 06		 sta [$06]
$0f:8c4b  00 08		 brk #$08
$0f:8c4d  00 08		 brk #$08
$0f:8c4f  00 97		 brk #$97
$0f:8c51  06 00		 asl $00
$0f:8c53  00 18		 brk #$18
$0f:8c55  00 10		 brk #$10
$0f:8c57  00 00		 brk #$00
$0f:8c59  00 10		 brk #$10
$0f:8c5b  00 10		 brk #$10
$0f:8c5d  00 06		 brk #$06
$0f:8c5f  00 00		 brk #$00
$0f:8c61  00 10		 brk #$10
$0f:8c63  00 08		 brk #$08
$0f:8c65  86 06		 stx $06
$0f:8c67  00 00		 brk #$00
$0f:8c69  10 08		 bpl $8c73
$0f:8c6b  00 96		 brk #$96
$0f:8c6d  06 00		 asl $00
$0f:8c6f  08			php
$0f:8c70  08			php
$0f:8c71  00 08		 brk #$08
$0f:8c73  87 06		 sta [$06]
$0f:8c75  00 08		 brk #$08
$0f:8c77  08			php
$0f:8c78  08			php
$0f:8c79  00 97		 brk #$97
$0f:8c7b  06 00		 asl $00
$0f:8c7d  10 00		 bpl $8c7f
$0f:8c7f  00 08		 brk #$08
$0f:8c81  88			dey
$0f:8c82  06 00		 asl $00
$0f:8c84  10 00		 bpl $8c86
$0f:8c86  08			php
$0f:8c87  00 98		 brk #$98
$0f:8c89  06 00		 asl $00
$0f:8c8b  00 20		 brk #$20
$0f:8c8d  00 10		 brk #$10
$0f:8c8f  00 00		 brk #$00
$0f:8c91  00 10		 brk #$10
$0f:8c93  00 10		 brk #$10
$0f:8c95  00 02		 brk #$02
$0f:8c97  00 01		 brk #$01
$0f:8c99  00 10		 brk #$10
$0f:8c9b  00 00		 brk #$00
$0f:8c9d  86 06		 stx $06
$0f:8c9f  01 10		 ora ($10,x)
$0f:8ca1  00 00		 brk #$00
$0f:8ca3  00 88		 brk #$88
$0f:8ca5  06 00		 asl $00
$0f:8ca7  00 10		 brk #$10
$0f:8ca9  00 08		 brk #$08
$0f:8cab  00 00		 brk #$00
$0f:8cad  00 10		 brk #$10
$0f:8caf  00 10		 brk #$10
$0f:8cb1  00 02		 brk #$02
$0f:8cb3  00 00		 brk #$00
$0f:8cb5  00 08		 brk #$08
$0f:8cb7  00 00		 brk #$00
$0f:8cb9  68			pla
$0f:8cba  86 00		 stx $00
$0f:8cbc  08			php
$0f:8cbd  00 00		 brk #$00
$0f:8cbf  00 69		 brk #$69
$0f:8cc1  86 00		 stx $00
$0f:8cc3  00 10		 brk #$10
$0f:8cc5  00 10		 brk #$10
$0f:8cc7  00 00		 brk #$00
$0f:8cc9  00 10		 brk #$10
$0f:8ccb  00 10		 brk #$10
$0f:8ccd  00 01		 brk #$01
$0f:8ccf  00 01		 brk #$01
$0f:8cd1  00 00		 brk #$00
$0f:8cd3  00 00		 brk #$00
$0f:8cd5  68			pla
$0f:8cd6  86 00		 stx $00
$0f:8cd8  00 10		 brk #$10
$0f:8cda  00 18		 brk #$18
$0f:8cdc  00 00		 brk #$00
$0f:8cde  00 10		 brk #$10
$0f:8ce0  00 10		 brk #$10
$0f:8ce2  00 03		 brk #$03
$0f:8ce4  00 01		 brk #$01
$0f:8ce6  00 00		 brk #$00
$0f:8ce8  08			php
$0f:8ce9  00 68		 brk #$68
$0f:8ceb  86 00		 stx $00
$0f:8ced  00 08		 brk #$08
$0f:8cef  00 10		 brk #$10
$0f:8cf1  6a			ror a
$0f:8cf2  86 00		 stx $00
$0f:8cf4  08			php
$0f:8cf5  00 00		 brk #$00
$0f:8cf7  10 6b		 bpl $8d64
$0f:8cf9  86 00		 stx $00
$0f:8cfb  00 10		 brk #$10
$0f:8cfd  00 20		 brk #$20
$0f:8cff  00 00		 brk #$00
$0f:8d01  00 10		 brk #$10
$0f:8d03  00 10		 brk #$10
$0f:8d05  00 02		 brk #$02
$0f:8d07  00 01		 brk #$01
$0f:8d09  00 00		 brk #$00
$0f:8d0b  10 00		 bpl $8d0d
$0f:8d0d  68			pla
$0f:8d0e  86 01		 stx $01
$0f:8d10  00 00		 brk #$00
$0f:8d12  00 10		 brk #$10
$0f:8d14  6a			ror a
$0f:8d15  86 18		 stx $18
$0f:8d17  00 28		 brk #$28
$0f:8d19  00 28		 brk #$28
$0f:8d1b  00 18		 brk #$18
$0f:8d1d  00 10		 brk #$10
$0f:8d1f  00 10		 brk #$10
$0f:8d21  00 0c		 brk #$0c
$0f:8d23  00 01		 brk #$01
$0f:8d25  10 20		 bpl $8d47
$0f:8d27  10 20		 bpl $8d49
$0f:8d29  8e 06 01	  stx $0106
$0f:8d2c  10 20		 bpl $8d4e
$0f:8d2e  20 10 8e	  jsr $8e10
$0f:8d31  86 01		 stx $01
$0f:8d33  20 10 20	  jsr $2010
$0f:8d36  10 8e		 bpl $8cc6
$0f:8d38  c6 01		 dec $01
$0f:8d3a  20 10 10	  jsr $1010
$0f:8d3d  20 8e 46	  jsr $468e
$0f:8d40  00 08		 brk #$08
$0f:8d42  30 18		 bmi $8d5c
$0f:8d44  20 8b 06	  jsr $068b
$0f:8d47  00 20		 brk #$20
$0f:8d49  18			clc
$0f:8d4a  08			php
$0f:8d4b  30 8b		 bmi $8cd8
$0f:8d4d  06 00		 asl $00
$0f:8d4f  30 08		 bmi $8d59
$0f:8d51  20 18 8b	  jsr $8b18
$0f:8d54  06 00		 asl $00
$0f:8d56  18			clc
$0f:8d57  20 30 08	  jsr $0830
$0f:8d5a  8b			phb
$0f:8d5b  06 00		 asl $00
$0f:8d5d  00 38		 brk #$38
$0f:8d5f  20 18 8a	  jsr $8a18
$0f:8d62  06 00		 asl $00
$0f:8d64  38			sec
$0f:8d65  00 18		 brk #$18
$0f:8d67  20 8a 06	  jsr $068a
$0f:8d6a  00 18		 brk #$18
$0f:8d6c  20 00 38	  jsr $3800
$0f:8d6f  8a			txa
$0f:8d70  06 00		 asl $00
$0f:8d72  20 18 38	  jsr $3818
$0f:8d75  00 8a		 brk #$8a
$0f:8d77  06 18		 asl $18
$0f:8d79  00 28		 brk #$28
$0f:8d7b  00 28		 brk #$28
$0f:8d7d  00 18		 brk #$18
$0f:8d7f  00 10		 brk #$10
$0f:8d81  00 10		 brk #$10
$0f:8d83  00 0c		 brk #$0c
$0f:8d85  00 01		 brk #$01
$0f:8d87  10 20		 bpl $8da9
$0f:8d89  10 20		 bpl $8dab
$0f:8d8b  8e 06 01	  stx $0106
$0f:8d8e  10 20		 bpl $8db0
$0f:8d90  20 10 8e	  jsr $8e10
$0f:8d93  86 01		 stx $01
$0f:8d95  20 10 20	  jsr $2010
$0f:8d98  10 8e		 bpl $8d28
$0f:8d9a  c6 01		 dec $01
$0f:8d9c  20 10 10	  jsr $1010
$0f:8d9f  20 8e 46	  jsr $468e
$0f:8da2  00 08		 brk #$08
$0f:8da4  30 18		 bmi $8dbe
$0f:8da6  20 9b 06	  jsr $069b
$0f:8da9  00 20		 brk #$20
$0f:8dab  18			clc
$0f:8dac  08			php
$0f:8dad  30 9b		 bmi $8d4a
$0f:8daf  06 00		 asl $00
$0f:8db1  30 08		 bmi $8dbb
$0f:8db3  20 18 9b	  jsr $9b18
$0f:8db6  06 00		 asl $00
$0f:8db8  18			clc
$0f:8db9  20 30 08	  jsr $0830
$0f:8dbc  9b			txy
$0f:8dbd  06 00		 asl $00
$0f:8dbf  00 38		 brk #$38
$0f:8dc1  20 18 9a	  jsr $9a18
$0f:8dc4  06 00		 asl $00
$0f:8dc6  18			clc
$0f:8dc7  20 00 38	  jsr $3800
$0f:8dca  9a			txs
$0f:8dcb  06 00		 asl $00
$0f:8dcd  38			sec
$0f:8dce  00 18		 brk #$18
$0f:8dd0  20 9a 06	  jsr $069a
$0f:8dd3  00 20		 brk #$20
$0f:8dd5  18			clc
$0f:8dd6  38			sec
$0f:8dd7  00 9a		 brk #$9a
$0f:8dd9  06 28		 asl $28
$0f:8ddb  00 38		 brk #$38
$0f:8ddd  00 38		 brk #$38
$0f:8ddf  00 28		 brk #$28
$0f:8de1  00 10		 brk #$10
$0f:8de3  00 10		 brk #$10
$0f:8de5  00 08		 brk #$08
$0f:8de7  00 00		 brk #$00
$0f:8de9  10 48		 bpl $8e33
$0f:8deb  30 28		 bmi $8e15
$0f:8ded  8b			phb
$0f:8dee  06 00		 asl $00
$0f:8df0  28			plp
$0f:8df1  30 10		 bmi $8e03
$0f:8df3  48			pha
$0f:8df4  8b			phb
$0f:8df5  06 00		 asl $00
$0f:8df7  30 28		 bmi $8e21
$0f:8df9  48			pha
$0f:8dfa  10 8b		 bpl $8d87
$0f:8dfc  06 00		 asl $00
$0f:8dfe  48			pha
$0f:8dff  10 28		 bpl $8e29
$0f:8e01  30 8b		 bmi $8d8e
$0f:8e03  06 00		 asl $00
$0f:8e05  00 58		 brk #$58
$0f:8e07  28			plp
$0f:8e08  30 8a		 bmi $8d94
$0f:8e0a  06 00		 asl $00
$0f:8e0c  30 28		 bmi $8e36
$0f:8e0e  00 58		 brk #$58
$0f:8e10  8a			txa
$0f:8e11  06 00		 asl $00
$0f:8e13  28			plp
$0f:8e14  30 58		 bmi $8e6e
$0f:8e16  00 8a		 brk #$8a
$0f:8e18  06 00		 asl $00
$0f:8e1a  58			cli
$0f:8e1b  00 30		 brk #$30
$0f:8e1d  28			plp
$0f:8e1e  8a			txa
$0f:8e1f  06 28		 asl $28
$0f:8e21  00 38		 brk #$38
$0f:8e23  00 38		 brk #$38
$0f:8e25  00 28		 brk #$28
$0f:8e27  00 10		 brk #$10
$0f:8e29  00 10		 brk #$10
$0f:8e2b  00 08		 brk #$08
$0f:8e2d  00 00		 brk #$00
$0f:8e2f  00 58		 brk #$58
$0f:8e31  28			plp
$0f:8e32  30 8a		 bmi $8dbe
$0f:8e34  06 00		 asl $00
$0f:8e36  30 28		 bmi $8e60
$0f:8e38  00 58		 brk #$58
$0f:8e3a  8a			txa
$0f:8e3b  06 00		 asl $00
$0f:8e3d  28			plp
$0f:8e3e  30 58		 bmi $8e98
$0f:8e40  00 8a		 brk #$8a
$0f:8e42  06 00		 asl $00
$0f:8e44  58			cli
$0f:8e45  00 30		 brk #$30
$0f:8e47  28			plp
$0f:8e48  8a			txa
$0f:8e49  06 00		 asl $00
$0f:8e4b  10 48		 bpl $8e95
$0f:8e4d  30 28		 bmi $8e77
$0f:8e4f  9b			txy
$0f:8e50  06 00		 asl $00
$0f:8e52  28			plp
$0f:8e53  30 10		 bmi $8e65
$0f:8e55  48			pha
$0f:8e56  9b			txy
$0f:8e57  06 00		 asl $00
$0f:8e59  48			pha
$0f:8e5a  10 28		 bpl $8e84
$0f:8e5c  30 9b		 bmi $8df9
$0f:8e5e  06 00		 asl $00
$0f:8e60  30 28		 bmi $8e8a
$0f:8e62  48			pha
$0f:8e63  10 9b		 bpl $8e00
$0f:8e65  06 28		 asl $28
$0f:8e67  00 38		 brk #$38
$0f:8e69  00 38		 brk #$38
$0f:8e6b  00 28		 brk #$28
$0f:8e6d  00 10		 brk #$10
$0f:8e6f  00 10		 brk #$10
$0f:8e71  00 04		 brk #$04
$0f:8e73  00 00		 brk #$00
$0f:8e75  00 58		 brk #$58
$0f:8e77  28			plp
$0f:8e78  30 9a		 bmi $8e14
$0f:8e7a  06 00		 asl $00
$0f:8e7c  30 28		 bmi $8ea6
$0f:8e7e  00 58		 brk #$58
$0f:8e80  9a			txs
$0f:8e81  06 00		 asl $00
$0f:8e83  58			cli
$0f:8e84  00 30		 brk #$30
$0f:8e86  28			plp
$0f:8e87  9a			txs
$0f:8e88  06 00		 asl $00
$0f:8e8a  28			plp
$0f:8e8b  30 58		 bmi $8ee5
$0f:8e8d  00 9a		 brk #$9a
$0f:8e8f  06 28		 asl $28
$0f:8e91  00 38		 brk #$38
$0f:8e93  00 38		 brk #$38
$0f:8e95  00 28		 brk #$28
$0f:8e97  00 10		 brk #$10
$0f:8e99  00 10		 brk #$10
$0f:8e9b  00 04		 brk #$04
$0f:8e9d  00 00		 brk #$00
$0f:8e9f  00 58		 brk #$58
$0f:8ea1  28			plp
$0f:8ea2  30 8b		 bmi $8e2f
$0f:8ea4  06 00		 asl $00
$0f:8ea6  28			plp
$0f:8ea7  30 58		 bmi $8f01
$0f:8ea9  00 8b		 brk #$8b
$0f:8eab  06 00		 asl $00
$0f:8ead  58			cli
$0f:8eae  00 30		 brk #$30
$0f:8eb0  28			plp
$0f:8eb1  8b			phb
$0f:8eb2  06 00		 asl $00
$0f:8eb4  30 28		 bmi $8ede
$0f:8eb6  00 58		 brk #$58
$0f:8eb8  8b			phb
$0f:8eb9  06 28		 asl $28
$0f:8ebb  00 38		 brk #$38
$0f:8ebd  00 38		 brk #$38
$0f:8ebf  00 28		 brk #$28
$0f:8ec1  00 10		 brk #$10
$0f:8ec3  00 10		 brk #$10
$0f:8ec5  00 04		 brk #$04
$0f:8ec7  00 00		 brk #$00
$0f:8ec9  00 58		 brk #$58
$0f:8ecb  28			plp
$0f:8ecc  30 9b		 bmi $8e69
$0f:8ece  06 00		 asl $00
$0f:8ed0  28			plp
$0f:8ed1  30 58		 bmi $8f2b
$0f:8ed3  00 9b		 brk #$9b
$0f:8ed5  06 00		 asl $00
$0f:8ed7  58			cli
$0f:8ed8  00 30		 brk #$30
$0f:8eda  28			plp
$0f:8edb  9b			txy
$0f:8edc  06 00		 asl $00
$0f:8ede  30 28		 bmi $8f08
$0f:8ee0  00 58		 brk #$58
$0f:8ee2  9b			txy
$0f:8ee3  06 07		 asl $07
$0f:8ee5  00 17		 brk #$17
$0f:8ee7  00 17		 brk #$17
$0f:8ee9  00 07		 brk #$07
$0f:8eeb  00 10		 brk #$10
$0f:8eed  00 10		 brk #$10
$0f:8eef  00 04		 brk #$04
$0f:8ef1  00 01		 brk #$01
$0f:8ef3  00 0e		 brk #$0e
$0f:8ef5  00 0e		 brk #$0e
$0f:8ef7  64 06		 stz $06
$0f:8ef9  01 0e		 ora ($0e,x)
$0f:8efb  00 0e		 brk #$0e
$0f:8efd  00 64		 brk #$64
$0f:8eff  c6 01		 dec $01
$0f:8f01  0e 00 00	  asl $0000
$0f:8f04  0e 84 46	  asl $4684
$0f:8f07  01 00		 ora ($00,x)
$0f:8f09  0e 0e 00	  asl $000e
$0f:8f0c  84 86		 sty $86
$0f:8f0e  07 00		 ora [$00]
$0f:8f10  17 00		 ora [$00],y
$0f:8f12  17 00		 ora [$00],y
$0f:8f14  07 00		 ora [$00]
$0f:8f16  10 00		 bpl $8f18
$0f:8f18  10 00		 bpl $8f1a
$0f:8f1a  04 00		 tsb $00
$0f:8f1c  01 00		 ora ($00,x)
$0f:8f1e  0e 00 0e	  asl $0e00
$0f:8f21  84 06		 sty $06
$0f:8f23  01 0e		 ora ($0e,x)
$0f:8f25  00 0e		 brk #$0e
$0f:8f27  00 84		 brk #$84
$0f:8f29  c6 01		 dec $01
$0f:8f2b  0e 00 00	  asl $0000
$0f:8f2e  0e 82 46	  asl $4682
$0f:8f31  01 00		 ora ($00,x)
$0f:8f33  0e 0e 00	  asl $000e
$0f:8f36  82 86 07	  brl $96bf
$0f:8f39  00 17		 brk #$17
$0f:8f3b  00 17		 brk #$17
$0f:8f3d  00 07		 brk #$07
$0f:8f3f  00 10		 brk #$10
$0f:8f41  00 10		 brk #$10
$0f:8f43  00 04		 brk #$04
$0f:8f45  00 01		 brk #$01
$0f:8f47  00 0e		 brk #$0e
$0f:8f49  00 0e		 brk #$0e
$0f:8f4b  82 06 01	  brl $9054
$0f:8f4e  0e 00 0e	  asl $0e00
$0f:8f51  00 82		 brk #$82
$0f:8f53  c6 01		 dec $01
$0f:8f55  00 0e		 brk #$0e
$0f:8f57  0e 00 64	  asl $6400
$0f:8f5a  86 01		 stx $01
$0f:8f5c  0e 00 00	  asl $0000
$0f:8f5f  0e 64 46	  asl $4664
$0f:8f62  08			php
$0f:8f63  00 18		 brk #$18
$0f:8f65  00 18		 brk #$18
$0f:8f67  00 08		 brk #$08
$0f:8f69  00 10		 brk #$10
$0f:8f6b  00 10		 brk #$10
$0f:8f6d  00 04		 brk #$04
$0f:8f6f  00 01		 brk #$01
$0f:8f71  00 10		 brk #$10
$0f:8f73  00 10		 brk #$10
$0f:8f75  82 06 01	  brl $907e
$0f:8f78  10 00		 bpl $8f7a
$0f:8f7a  10 00		 bpl $8f7c
$0f:8f7c  82 c6 01	  brl $9145
$0f:8f7f  00 10		 brk #$10
$0f:8f81  10 00		 bpl $8f83
$0f:8f83  84 86		 sty $86
$0f:8f85  01 10		 ora ($10,x)
$0f:8f87  00 00		 brk #$00
$0f:8f89  10 84		 bpl $8f0f
$0f:8f8b  46 08		 lsr $08
$0f:8f8d  00 18		 brk #$18
$0f:8f8f  00 18		 brk #$18
$0f:8f91  00 08		 brk #$08
$0f:8f93  00 10		 brk #$10
$0f:8f95  00 10		 brk #$10
$0f:8f97  00 04		 brk #$04
$0f:8f99  00 01		 brk #$01
$0f:8f9b  00 10		 brk #$10
$0f:8f9d  00 10		 brk #$10
$0f:8f9f  84 06		 sty $06
$0f:8fa1  01 10		 ora ($10,x)
$0f:8fa3  00 10		 brk #$10
$0f:8fa5  00 84		 brk #$84
$0f:8fa7  c6 01		 dec $01
$0f:8fa9  00 10		 brk #$10
$0f:8fab  10 00		 bpl $8fad
$0f:8fad  64 86		 stz $86
$0f:8faf  01 10		 ora ($10,x)
$0f:8fb1  00 00		 brk #$00
$0f:8fb3  10 64		 bpl $9019
$0f:8fb5  46 08		 lsr $08
$0f:8fb7  00 18		 brk #$18
$0f:8fb9  00 18		 brk #$18
$0f:8fbb  00 08		 brk #$08
$0f:8fbd  00 10		 brk #$10
$0f:8fbf  00 10		 brk #$10
$0f:8fc1  00 04		 brk #$04
$0f:8fc3  00 01		 brk #$01
$0f:8fc5  00 10		 brk #$10
$0f:8fc7  00 10		 brk #$10
$0f:8fc9  64 06		 stz $06
$0f:8fcb  01 10		 ora ($10,x)
$0f:8fcd  00 10		 brk #$10
$0f:8fcf  00 64		 brk #$64
$0f:8fd1  c6 01		 dec $01
$0f:8fd3  00 10		 brk #$10
$0f:8fd5  10 00		 bpl $8fd7
$0f:8fd7  82 86 01	  brl $9160
$0f:8fda  10 00		 bpl $8fdc
$0f:8fdc  00 10		 brk #$10
$0f:8fde  82 46 06	  brl $9627
$0f:8fe1  00 16		 brk #$16
$0f:8fe3  00 16		 brk #$16
$0f:8fe5  00 06		 brk #$06
$0f:8fe7  00 10		 brk #$10
$0f:8fe9  00 10		 brk #$10
$0f:8feb  00 04		 brk #$04
$0f:8fed  00 01		 brk #$01
$0f:8fef  00 0c		 brk #$0c
$0f:8ff1  00 0c		 brk #$0c
$0f:8ff3  60			rts
$0f:8ff4  06 01		 asl $01
$0f:8ff6  0c 00 0c	  tsb $0c00
$0f:8ff9  00 60		 brk #$60
$0f:8ffb  c6 01		 dec $01
$0f:8ffd  0c 00 00	  tsb $0000
$0f:9000  0c 62 46	  tsb $4662
$0f:9003  01 00		 ora ($00,x)
$0f:9005  0c 0c 00	  tsb $000c
$0f:9008  62 86 06	  per $9691
$0f:900b  00 16		 brk #$16
$0f:900d  00 16		 brk #$16
$0f:900f  00 06		 brk #$06
$0f:9011  00 10		 brk #$10
$0f:9013  00 10		 brk #$10
$0f:9015  00 04		 brk #$04
$0f:9017  00 01		 brk #$01
$0f:9019  00 0c		 brk #$0c
$0f:901b  00 0c		 brk #$0c
$0f:901d  62 06 01	  per $9126
$0f:9020  0c 00 0c	  tsb $0c00
$0f:9023  00 62		 brk #$62
$0f:9025  c6 01		 dec $01
$0f:9027  00 0c		 brk #$0c
$0f:9029  0c 00 80	  tsb $8000
$0f:902c  86 01		 stx $01
$0f:902e  0c 00 00	  tsb $0000
$0f:9031  0c 80 46	  tsb $4680
$0f:9034  06 00		 asl $00
$0f:9036  16 00		 asl $00,x
$0f:9038  16 00		 asl $00,x
$0f:903a  06 00		 asl $00
$0f:903c  10 00		 bpl $903e
$0f:903e  10 00		 bpl $9040
$0f:9040  04 00		 tsb $00
$0f:9042  01 00		 ora ($00,x)
$0f:9044  0c 00 0c	  tsb $0c00
$0f:9047  80 06		 bra $904f
$0f:9049  01 0c		 ora ($0c,x)
$0f:904b  00 0c		 brk #$0c
$0f:904d  00 80		 brk #$80
$0f:904f  c6 01		 dec $01
$0f:9051  00 0c		 brk #$0c
$0f:9053  0c 00 60	  tsb $6000
$0f:9056  86 01		 stx $01
$0f:9058  0c 00 00	  tsb $0000
$0f:905b  0c 60 46	  tsb $4660
$0f:905e  08			php
$0f:905f  00 18		 brk #$18
$0f:9061  00 18		 brk #$18
$0f:9063  00 08		 brk #$08
$0f:9065  00 10		 brk #$10
$0f:9067  00 10		 brk #$10
$0f:9069  00 04		 brk #$04
$0f:906b  00 01		 brk #$01
$0f:906d  00 10		 brk #$10
$0f:906f  00 10		 brk #$10
$0f:9071  80 06		 bra $9079
$0f:9073  01 10		 ora ($10,x)
$0f:9075  00 10		 brk #$10
$0f:9077  00 80		 brk #$80
$0f:9079  c6 01		 dec $01
$0f:907b  00 10		 brk #$10
$0f:907d  10 00		 bpl $907f
$0f:907f  62 86 01	  per $9208
$0f:9082  10 00		 bpl $9084
$0f:9084  00 10		 brk #$10
$0f:9086  62 46 08	  per $98cf
$0f:9089  00 18		 brk #$18
$0f:908b  00 18		 brk #$18
$0f:908d  00 08		 brk #$08
$0f:908f  00 10		 brk #$10
$0f:9091  00 10		 brk #$10
$0f:9093  00 04		 brk #$04
$0f:9095  00 01		 brk #$01
$0f:9097  00 10		 brk #$10
$0f:9099  00 10		 brk #$10
$0f:909b  62 06 01	  per $91a4
$0f:909e  10 00		 bpl $90a0
$0f:90a0  10 00		 bpl $90a2
$0f:90a2  62 c6 01	  per $926b
$0f:90a5  00 10		 brk #$10
$0f:90a7  10 00		 bpl $90a9
$0f:90a9  60			rts
$0f:90aa  86 01		 stx $01
$0f:90ac  10 00		 bpl $90ae
$0f:90ae  00 10		 brk #$10
$0f:90b0  60			rts
$0f:90b1  46 08		 lsr $08
$0f:90b3  00 18		 brk #$18
$0f:90b5  00 18		 brk #$18
$0f:90b7  00 08		 brk #$08
$0f:90b9  00 10		 brk #$10
$0f:90bb  00 10		 brk #$10
$0f:90bd  00 04		 brk #$04
$0f:90bf  00 01		 brk #$01
$0f:90c1  00 10		 brk #$10
$0f:90c3  00 10		 brk #$10
$0f:90c5  60			rts
$0f:90c6  06 01		 asl $01
$0f:90c8  10 00		 bpl $90ca
$0f:90ca  10 00		 bpl $90cc
$0f:90cc  60			rts
$0f:90cd  c6 01		 dec $01
$0f:90cf  00 10		 brk #$10
$0f:90d1  10 00		 bpl $90d3
$0f:90d3  80 86		 bra $905b
$0f:90d5  01 10		 ora ($10,x)
$0f:90d7  00 00		 brk #$00
$0f:90d9  10 80		 bpl $905b
$0f:90db  46 fd		 lsr $fd
$0f:90dd  ff 0e 00 0d   sbc $0d000e,x
$0f:90e1  00 fe		 brk #$fe
$0f:90e3  ff 10 00 10   sbc $100010,x
$0f:90e7  00 04		 brk #$04
$0f:90e9  00 00		 brk #$00
$0f:90eb  00 03		 brk #$03
$0f:90ed  00 03		 brk #$03
$0f:90ef  7b			tdc
$0f:90f0  06 00		 asl $00
$0f:90f2  03 00		 ora $00,s
$0f:90f4  03 00		 ora $00,s
$0f:90f6  7b			tdc
$0f:90f7  c6 00		 dec $00
$0f:90f9  03 00		 ora $00,s
$0f:90fb  00 03		 brk #$03
$0f:90fd  7b			tdc
$0f:90fe  46 00		 lsr $00
$0f:9100  00 03		 brk #$03
$0f:9102  03 00		 ora $00,s
$0f:9104  7b			tdc
$0f:9105  86 fe		 stx $fe
$0f:9107  ff 0f 00 0f   sbc $0f000f,x
$0f:910b  00 00		 brk #$00
$0f:910d  00 10		 brk #$10
$0f:910f  00 10		 brk #$10
$0f:9111  00 04		 brk #$04
$0f:9113  00 00		 brk #$00
$0f:9115  00 05		 brk #$05
$0f:9117  00 07		 brk #$07
$0f:9119  7b			tdc
$0f:911a  06 00		 asl $00
$0f:911c  05 00		 ora $00
$0f:911e  07 00		 ora [$00]
$0f:9120  7b			tdc
$0f:9121  c6 00		 dec $00
$0f:9123  05 00		 ora $00
$0f:9125  00 07		 brk #$07
$0f:9127  7b			tdc
$0f:9128  46 00		 lsr $00
$0f:912a  00 05		 brk #$05
$0f:912c  07 00		 ora [$00]
$0f:912e  7b			tdc
$0f:912f  86 ff		 stx $ff
$0f:9131  ff 0f 00 0f   sbc $0f000f,x
$0f:9135  00 ff		 brk #$ff
$0f:9137  ff 10 00 10   sbc $100010,x
$0f:913b  00 04		 brk #$04
$0f:913d  00 00		 brk #$00
$0f:913f  00 06		 brk #$06
$0f:9141  00 06		 brk #$06
$0f:9143  6a			ror a
$0f:9144  06 00		 asl $00
$0f:9146  06 00		 asl $00
$0f:9148  06 00		 asl $00
$0f:914a  6a			ror a
$0f:914b  c6 00		 dec $00
$0f:914d  00 06		 brk #$06
$0f:914f  06 00		 asl $00
$0f:9151  6a			ror a
$0f:9152  86 00		 stx $00
$0f:9154  06 00		 asl $00
$0f:9156  00 06		 brk #$06
$0f:9158  6a			ror a
$0f:9159  46 00		 lsr $00
$0f:915b  00 10		 brk #$10
$0f:915d  00 10		 brk #$10
$0f:915f  00 00		 brk #$00
$0f:9161  00 10		 brk #$10
$0f:9163  00 10		 brk #$10
$0f:9165  00 04		 brk #$04
$0f:9167  00 00		 brk #$00
$0f:9169  00 08		 brk #$08
$0f:916b  00 08		 brk #$08
$0f:916d  6a			ror a
$0f:916e  06 00		 asl $00
$0f:9170  08			php
$0f:9171  00 08		 brk #$08
$0f:9173  00 6a		 brk #$6a
$0f:9175  c6 00		 dec $00
$0f:9177  00 08		 brk #$08
$0f:9179  08			php
$0f:917a  00 6a		 brk #$6a
$0f:917c  86 00		 stx $00
$0f:917e  08			php
$0f:917f  00 00		 brk #$00
$0f:9181  08			php
$0f:9182  6a			ror a
$0f:9183  46 08		 lsr $08
$0f:9185  00 18		 brk #$18
$0f:9187  00 18		 brk #$18
$0f:9189  00 08		 brk #$08
$0f:918b  00 10		 brk #$10
$0f:918d  00 10		 brk #$10
$0f:918f  00 0c		 brk #$0c
$0f:9191  00 00		 brk #$00
$0f:9193  08			php
$0f:9194  10 00		 bpl $9196
$0f:9196  18			clc
$0f:9197  67 06		 adc [$06]
$0f:9199  00 08		 brk #$08
$0f:919b  10 18		 bpl $91b5
$0f:919d  00 67		 brk #$67
$0f:919f  86 00		 stx $00
$0f:91a1  10 08		 bpl $91ab
$0f:91a3  18			clc
$0f:91a4  00 67		 brk #$67
$0f:91a6  c6 00		 dec $00
$0f:91a8  10 08		 bpl $91b2
$0f:91aa  00 18		 brk #$18
$0f:91ac  67 46		 adc [$46]
$0f:91ae  00 00		 brk #$00
$0f:91b0  18			clc
$0f:91b1  08			php
$0f:91b2  10 76		 bpl $922a
$0f:91b4  06 00		 asl $00
$0f:91b6  00 18		 brk #$18
$0f:91b8  10 08		 bpl $91c2
$0f:91ba  76 86		 ror $86,x
$0f:91bc  00 18		 brk #$18
$0f:91be  00 10		 brk #$10
$0f:91c0  08			php
$0f:91c1  76 c6		 ror $c6,x
$0f:91c3  00 18		 brk #$18
$0f:91c5  00 08		 brk #$08
$0f:91c7  10 76		 bpl $923f
$0f:91c9  46 00		 lsr $00
$0f:91cb  08			php
$0f:91cc  10 10		 bpl $91de
$0f:91ce  08			php
$0f:91cf  77 86		 adc [$86],y
$0f:91d1  00 08		 brk #$08
$0f:91d3  10 08		 bpl $91dd
$0f:91d5  10 77		 bpl $924e
$0f:91d7  06 00		 asl $00
$0f:91d9  10 08		 bpl $91e3
$0f:91db  08			php
$0f:91dc  10 77		 bpl $9255
$0f:91de  46 00		 lsr $00
$0f:91e0  10 08		 bpl $91ea
$0f:91e2  10 08		 bpl $91ec
$0f:91e4  77 c6		 adc [$c6],y
$0f:91e6  08			php
$0f:91e7  00 18		 brk #$18
$0f:91e9  00 18		 brk #$18
$0f:91eb  00 08		 brk #$08
$0f:91ed  00 10		 brk #$10
$0f:91ef  00 10		 brk #$10
$0f:91f1  00 04		 brk #$04
$0f:91f3  00 01		 brk #$01
$0f:91f5  00 10		 brk #$10
$0f:91f7  00 10		 brk #$10
$0f:91f9  86 06		 stx $06
$0f:91fb  01 00		 ora ($00,x)
$0f:91fd  10 10		 bpl $920f
$0f:91ff  00 86		 brk #$86
$0f:9201  86 01		 stx $01
$0f:9203  10 00		 bpl $9205
$0f:9205  10 00		 bpl $9207
$0f:9207  86 c6		 stx $c6
$0f:9209  01 10		 ora ($10,x)
$0f:920b  00 00		 brk #$00
$0f:920d  10 86		 bpl $9195
$0f:920f  46 08		 lsr $08
$0f:9211  00 18		 brk #$18
$0f:9213  00 18		 brk #$18
$0f:9215  00 08		 brk #$08
$0f:9217  00 10		 brk #$10
$0f:9219  00 10		 brk #$10
$0f:921b  00 04		 brk #$04
$0f:921d  00 01		 brk #$01
$0f:921f  00 10		 brk #$10
$0f:9221  00 10		 brk #$10
$0f:9223  8a			txa
$0f:9224  06 01		 asl $01
$0f:9226  00 10		 brk #$10
$0f:9228  10 00		 bpl $922a
$0f:922a  8a			txa
$0f:922b  86 01		 stx $01
$0f:922d  10 00		 bpl $922f
$0f:922f  10 00		 bpl $9231
$0f:9231  8a			txa
$0f:9232  c6 01		 dec $01
$0f:9234  10 00		 bpl $9236
$0f:9236  00 10		 brk #$10
$0f:9238  8a			txa
$0f:9239  46 06		 lsr $06
$0f:923b  00 16		 brk #$16
$0f:923d  00 16		 brk #$16
$0f:923f  00 06		 brk #$06
$0f:9241  00 10		 brk #$10
$0f:9243  00 10		 brk #$10
$0f:9245  00 0c		 brk #$0c
$0f:9247  00 00		 brk #$00
$0f:9249  08			php
$0f:924a  0c 08 0c	  tsb $0c08
$0f:924d  99 46 00	  sta $0046,y
$0f:9250  08			php
$0f:9251  0c 0c 08	  tsb $080c
$0f:9254  99 c6 00	  sta $00c6,y
$0f:9257  0c 08 0c	  tsb $0c08
$0f:925a  08			php
$0f:925b  99 86 00	  sta $0086,y
$0f:925e  0c 08 08	  tsb $0808
$0f:9261  0c 99 06	  tsb $0699
$0f:9264  00 06		 brk #$06
$0f:9266  0e 00 14	  asl $1400
$0f:9269  89 06		 bit #$06
$0f:926b  00 0e		 brk #$0e
$0f:926d  06 00		 asl $00
$0f:926f  14 89		 trb $89
$0f:9271  46 00		 lsr $00
$0f:9273  06 0e		 asl $0e
$0f:9275  14 00		 trb $00
$0f:9277  89 86		 bit #$86
$0f:9279  00 0e		 brk #$0e
$0f:927b  06 14		 asl $14
$0f:927d  00 89		 brk #$89
$0f:927f  c6 00		 dec $00
$0f:9281  00 14		 brk #$14
$0f:9283  06 0e		 asl $0e
$0f:9285  98			tya
$0f:9286  06 00		 asl $00
$0f:9288  00 14		 brk #$14
$0f:928a  0e 06 98	  asl $9806
$0f:928d  86 00		 stx $00
$0f:928f  14 00		 trb $00
$0f:9291  0e 06 98	  asl $9806
$0f:9294  c6 00		 dec $00
$0f:9296  14 00		 trb $00
$0f:9298  06 0e		 asl $0e
$0f:929a  98			tya
$0f:929b  46 08		 lsr $08
$0f:929d  00 18		 brk #$18
$0f:929f  00 18		 brk #$18
$0f:92a1  00 08		 brk #$08
$0f:92a3  00 10		 brk #$10
$0f:92a5  00 10		 brk #$10
$0f:92a7  00 0c		 brk #$0c
$0f:92a9  00 00		 brk #$00
$0f:92ab  08			php
$0f:92ac  10 00		 bpl $92ae
$0f:92ae  18			clc
$0f:92af  89 06		 bit #$06
$0f:92b1  00 08		 brk #$08
$0f:92b3  10 18		 bpl $92cd
$0f:92b5  00 89		 brk #$89
$0f:92b7  86 00		 stx $00
$0f:92b9  10 08		 bpl $92c3
$0f:92bb  18			clc
$0f:92bc  00 89		 brk #$89
$0f:92be  c6 00		 dec $00
$0f:92c0  10 08		 bpl $92ca
$0f:92c2  00 18		 brk #$18
$0f:92c4  89 46		 bit #$46
$0f:92c6  00 08		 brk #$08
$0f:92c8  10 08		 bpl $92d2
$0f:92ca  10 99		 bpl $9265
$0f:92cc  06 00		 asl $00
$0f:92ce  08			php
$0f:92cf  10 10		 bpl $92e1
$0f:92d1  08			php
$0f:92d2  99 86 00	  sta $0086,y
$0f:92d5  10 08		 bpl $92df
$0f:92d7  10 08		 bpl $92e1
$0f:92d9  99 c6 00	  sta $00c6,y
$0f:92dc  10 08		 bpl $92e6
$0f:92de  08			php
$0f:92df  10 99		 bpl $927a
$0f:92e1  46 00		 lsr $00
$0f:92e3  00 18		 brk #$18
$0f:92e5  08			php
$0f:92e6  10 98		 bpl $9280
$0f:92e8  06 00		 asl $00
$0f:92ea  00 18		 brk #$18
$0f:92ec  10 08		 bpl $92f6
$0f:92ee  98			tya
$0f:92ef  86 00		 stx $00
$0f:92f1  18			clc
$0f:92f2  00 10		 brk #$10
$0f:92f4  08			php
$0f:92f5  98			tya
$0f:92f6  c6 00		 dec $00
$0f:92f8  18			clc
$0f:92f9  00 08		 brk #$08
$0f:92fb  10 98		 bpl $9295
$0f:92fd  46 06		 lsr $06
$0f:92ff  00 16		 brk #$16
$0f:9301  00 17		 brk #$17
$0f:9303  00 07		 brk #$07
$0f:9305  00 10		 brk #$10
$0f:9307  00 10		 brk #$10
$0f:9309  00 0c		 brk #$0c
$0f:930b  00 00		 brk #$00
$0f:930d  00 14		 brk #$14
$0f:930f  00 16		 brk #$16
$0f:9311  68			pla
$0f:9312  06 00		 asl $00
$0f:9314  00 14		 brk #$14
$0f:9316  16 00		 asl $00,x
$0f:9318  68			pla
$0f:9319  86 00		 stx $00
$0f:931b  14 00		 trb $00
$0f:931d  16 00		 asl $00,x
$0f:931f  68			pla
$0f:9320  c6 00		 dec $00
$0f:9322  14 00		 trb $00
$0f:9324  00 16		 brk #$16
$0f:9326  68			pla
$0f:9327  46 00		 lsr $00
$0f:9329  00 14		 brk #$14
$0f:932b  07 0f		 ora [$0f]
$0f:932d  78			sei
$0f:932e  06 00		 asl $00
$0f:9330  00 14		 brk #$14
$0f:9332  0f 07 78 86   ora $867807
$0f:9336  00 14		 brk #$14
$0f:9338  00 0f		 brk #$0f
$0f:933a  07 78		 ora [$78]
$0f:933c  c6 00		 dec $00
$0f:933e  14 00		 trb $00
$0f:9340  07 0f		 ora [$0f]
$0f:9342  78			sei
$0f:9343  46 00		 lsr $00
$0f:9345  06 0e		 asl $0e
$0f:9347  01 15		 ora ($15,x)
$0f:9349  69 06		 adc #$06
$0f:934b  00 0e		 brk #$0e
$0f:934d  06 01		 asl $01
$0f:934f  15 69		 ora $69,x
$0f:9351  46 00		 lsr $00
$0f:9353  06 0e		 asl $0e
$0f:9355  15 01		 ora $01,x
$0f:9357  69 86		 adc #$86
$0f:9359  00 0e		 brk #$0e
$0f:935b  06 15		 asl $15
$0f:935d  01 69		 ora ($69,x)
$0f:935f  c6 09		 dec $09
$0f:9361  00 19		 brk #$19
$0f:9363  00 19		 brk #$19
$0f:9365  00 09		 brk #$09
$0f:9367  00 10		 brk #$10
$0f:9369  00 10		 brk #$10
$0f:936b  00 0c		 brk #$0c
$0f:936d  00 00		 brk #$00
$0f:936f  00 1a		 brk #$1a
$0f:9371  00 1a		 brk #$1a
$0f:9373  68			pla
$0f:9374  06 00		 asl $00
$0f:9376  00 1a		 brk #$1a
$0f:9378  1a			inc a
$0f:9379  00 68		 brk #$68
$0f:937b  86 00		 stx $00
$0f:937d  1a			inc a
$0f:937e  00 1a		 brk #$1a
$0f:9380  00 68		 brk #$68
$0f:9382  c6 00		 dec $00
$0f:9384  1a			inc a
$0f:9385  00 00		 brk #$00
$0f:9387  1a			inc a
$0f:9388  68			pla
$0f:9389  46 00		 lsr $00
$0f:938b  00 1a		 brk #$1a
$0f:938d  09 11		 ora #$11
$0f:938f  78			sei
$0f:9390  06 00		 asl $00
$0f:9392  00 1a		 brk #$1a
$0f:9394  11 09		 ora ($09),y
$0f:9396  78			sei
$0f:9397  86 00		 stx $00
$0f:9399  1a			inc a
$0f:939a  00 11		 brk #$11
$0f:939c  09 78		 ora #$78
$0f:939e  c6 00		 dec $00
$0f:93a0  1a			inc a
$0f:93a1  00 09		 brk #$09
$0f:93a3  11 78		 ora ($78),y
$0f:93a5  46 00		 lsr $00
$0f:93a7  09 11		 ora #$11
$0f:93a9  00 1a		 brk #$1a
$0f:93ab  69 06		 adc #$06
$0f:93ad  00 11		 brk #$11
$0f:93af  09 00		 ora #$00
$0f:93b1  1a			inc a
$0f:93b2  69 46		 adc #$46
$0f:93b4  00 09		 brk #$09
$0f:93b6  11 1a		 ora ($1a),y
$0f:93b8  00 69		 brk #$69
$0f:93ba  86 00		 stx $00
$0f:93bc  11 09		 ora ($09),y
$0f:93be  1a			inc a
$0f:93bf  00 69		 brk #$69
$0f:93c1  c6 04		 dec $04
$0f:93c3  00 14		 brk #$14
$0f:93c5  00 14		 brk #$14
$0f:93c7  00 04		 brk #$04
$0f:93c9  00 10		 brk #$10
$0f:93cb  00 10		 brk #$10
$0f:93cd  00 04		 brk #$04
$0f:93cf  00 01		 brk #$01
$0f:93d1  00 08		 brk #$08
$0f:93d3  00 08		 brk #$08
$0f:93d5  6c 06 01	  jmp ($0106)
$0f:93d8  08			php
$0f:93d9  00 08		 brk #$08
$0f:93db  00 6c		 brk #$6c
$0f:93dd  c6 00		 dec $00
$0f:93df  00 10		 brk #$10
$0f:93e1  10 00		 bpl $93e3
$0f:93e3  6c 86 00	  jmp ($0086)
$0f:93e6  10 00		 bpl $93e8
$0f:93e8  00 10		 brk #$10
$0f:93ea  6c 46 04	  jmp ($0446)
$0f:93ed  00 14		 brk #$14
$0f:93ef  00 14		 brk #$14
$0f:93f1  00 04		 brk #$04
$0f:93f3  00 10		 brk #$10
$0f:93f5  00 10		 brk #$10
$0f:93f7  00 04		 brk #$04
$0f:93f9  00 01		 brk #$01
$0f:93fb  00 08		 brk #$08
$0f:93fd  00 08		 brk #$08
$0f:93ff  68			pla
$0f:9400  06 01		 asl $01
$0f:9402  08			php
$0f:9403  00 08		 brk #$08
$0f:9405  00 68		 brk #$68
$0f:9407  c6 00		 dec $00
$0f:9409  00 10		 brk #$10
$0f:940b  10 00		 bpl $940d
$0f:940d  68			pla
$0f:940e  86 00		 stx $00
$0f:9410  10 00		 bpl $9412
$0f:9412  00 10		 brk #$10
$0f:9414  68			pla
$0f:9415  46 04		 lsr $04
$0f:9417  00 14		 brk #$14
$0f:9419  00 14		 brk #$14
$0f:941b  00 04		 brk #$04
$0f:941d  00 10		 brk #$10
$0f:941f  00 10		 brk #$10
$0f:9421  00 04		 brk #$04
$0f:9423  00 01		 brk #$01
$0f:9425  00 08		 brk #$08
$0f:9427  00 08		 brk #$08
$0f:9429  8e 06 01	  stx $0106
$0f:942c  08			php
$0f:942d  00 08		 brk #$08
$0f:942f  00 8e		 brk #$8e
$0f:9431  c6 00		 dec $00
$0f:9433  00 10		 brk #$10
$0f:9435  10 00		 bpl $9437
$0f:9437  8e 86 00	  stx $0086
$0f:943a  10 00		 bpl $943c
$0f:943c  00 10		 brk #$10
$0f:943e  8e 46 04	  stx $0446
$0f:9441  00 14		 brk #$14
$0f:9443  00 14		 brk #$14
$0f:9445  00 04		 brk #$04
$0f:9447  00 10		 brk #$10
$0f:9449  00 10		 brk #$10
$0f:944b  00 04		 brk #$04
$0f:944d  00 01		 brk #$01
$0f:944f  00 08		 brk #$08
$0f:9451  00 08		 brk #$08
$0f:9453  8a			txa
$0f:9454  06 01		 asl $01
$0f:9456  08			php
$0f:9457  00 08		 brk #$08
$0f:9459  00 8a		 brk #$8a
$0f:945b  c6 00		 dec $00
$0f:945d  00 10		 brk #$10
$0f:945f  10 00		 bpl $9461
$0f:9461  8a			txa
$0f:9462  86 00		 stx $00
$0f:9464  10 00		 bpl $9466
$0f:9466  00 10		 brk #$10
$0f:9468  8a			txa
$0f:9469  46 00		 lsr $00
$0f:946b  00 10		 brk #$10
$0f:946d  00 10		 brk #$10
$0f:946f  00 00		 brk #$00
$0f:9471  00 10		 brk #$10
$0f:9473  00 10		 brk #$10
$0f:9475  00 01		 brk #$01
$0f:9477  00 01		 brk #$01
$0f:9479  00 00		 brk #$00
$0f:947b  00 00		 brk #$00
$0f:947d  8c 06 00	  sty $0006
$0f:9480  00 10		 brk #$10
$0f:9482  00 10		 brk #$10
$0f:9484  00 00		 brk #$00
$0f:9486  00 10		 brk #$10
$0f:9488  00 10		 brk #$10
$0f:948a  00 01		 brk #$01
$0f:948c  00 01		 brk #$01
$0f:948e  00 00		 brk #$00
$0f:9490  00 00		 brk #$00
$0f:9492  88			dey
$0f:9493  06 00		 asl $00
$0f:9495  00 10		 brk #$10
$0f:9497  00 10		 brk #$10
$0f:9499  00 00		 brk #$00
$0f:949b  00 10		 brk #$10
$0f:949d  00 10		 brk #$10
$0f:949f  00 01		 brk #$01
$0f:94a1  00 01		 brk #$01
$0f:94a3  00 00		 brk #$00
$0f:94a5  00 00		 brk #$00
$0f:94a7  6e 06 00	  ror $0006
$0f:94aa  00 10		 brk #$10
$0f:94ac  00 10		 brk #$10
$0f:94ae  00 00		 brk #$00
$0f:94b0  00 10		 brk #$10
$0f:94b2  00 10		 brk #$10
$0f:94b4  00 01		 brk #$01
$0f:94b6  00 01		 brk #$01
$0f:94b8  00 00		 brk #$00
$0f:94ba  00 00		 brk #$00
$0f:94bc  6a			ror a
$0f:94bd  06 00		 asl $00
$0f:94bf  00 10		 brk #$10
$0f:94c1  00 10		 brk #$10
$0f:94c3  00 00		 brk #$00
$0f:94c5  00 10		 brk #$10
$0f:94c7  00 10		 brk #$10
$0f:94c9  00 01		 brk #$01
$0f:94cb  00 01		 brk #$01
$0f:94cd  00 00		 brk #$00
$0f:94cf  00 00		 brk #$00
$0f:94d1  80 06		 bra $94d9
$0f:94d3  00 00		 brk #$00
$0f:94d5  10 00		 bpl $94d7
$0f:94d7  10 00		 bpl $94d9
$0f:94d9  00 00		 brk #$00
$0f:94db  10 00		 bpl $94dd
$0f:94dd  10 00		 bpl $94df
$0f:94df  01 00		 ora ($00,x)
$0f:94e1  01 00		 ora ($00,x)
$0f:94e3  00 00		 brk #$00
$0f:94e5  00 82		 brk #$82
$0f:94e7  06 00		 asl $00
$0f:94e9  00 10		 brk #$10
$0f:94eb  00 10		 brk #$10
$0f:94ed  00 00		 brk #$00
$0f:94ef  00 10		 brk #$10
$0f:94f1  00 10		 brk #$10
$0f:94f3  00 01		 brk #$01
$0f:94f5  00 01		 brk #$01
$0f:94f7  00 00		 brk #$00
$0f:94f9  00 00		 brk #$00
$0f:94fb  84 06		 sty $06
$0f:94fd  00 00		 brk #$00
$0f:94ff  10 00		 bpl $9501
$0f:9501  10 00		 bpl $9503
$0f:9503  00 00		 brk #$00
$0f:9505  10 00		 bpl $9507
$0f:9507  10 00		 bpl $9509
$0f:9509  01 00		 ora ($00,x)
$0f:950b  01 00		 ora ($00,x)
$0f:950d  00 00		 brk #$00
$0f:950f  00 86		 brk #$86
$0f:9511  06 00		 asl $00
$0f:9513  00 10		 brk #$10
$0f:9515  00 10		 brk #$10
$0f:9517  00 00		 brk #$00
$0f:9519  00 10		 brk #$10
$0f:951b  00 10		 brk #$10
$0f:951d  00 01		 brk #$01
$0f:951f  00 01		 brk #$01
$0f:9521  00 00		 brk #$00
$0f:9523  00 00		 brk #$00
$0f:9525  64 06		 stz $06
$0f:9527  00 00		 brk #$00
$0f:9529  10 00		 bpl $952b
$0f:952b  10 00		 bpl $952d
$0f:952d  00 00		 brk #$00
$0f:952f  10 00		 bpl $9531
$0f:9531  10 00		 bpl $9533
$0f:9533  01 00		 ora ($00,x)
$0f:9535  01 00		 ora ($00,x)
$0f:9537  00 00		 brk #$00
$0f:9539  00 66		 brk #$66
$0f:953b  06 08		 asl $08
$0f:953d  00 18		 brk #$18
$0f:953f  00 18		 brk #$18
$0f:9541  00 08		 brk #$08
$0f:9543  00 10		 brk #$10
$0f:9545  00 10		 brk #$10
$0f:9547  00 04		 brk #$04
$0f:9549  00 01		 brk #$01
$0f:954b  00 10		 brk #$10
$0f:954d  00 10		 brk #$10
$0f:954f  62 06 01	  per $9658
$0f:9552  10 00		 bpl $9554
$0f:9554  00 10		 brk #$10
$0f:9556  62 46 01	  per $969f
$0f:9559  10 00		 bpl $955b
$0f:955b  10 00		 bpl $955d
$0f:955d  62 c6 01	  per $9726
$0f:9560  00 10		 brk #$10
$0f:9562  10 00		 bpl $9564
$0f:9564  62 86 08	  per $9ded
$0f:9567  00 18		 brk #$18
$0f:9569  00 18		 brk #$18
$0f:956b  00 08		 brk #$08
$0f:956d  00 10		 brk #$10
$0f:956f  00 10		 brk #$10
$0f:9571  00 04		 brk #$04
$0f:9573  00 01		 brk #$01
$0f:9575  00 10		 brk #$10
$0f:9577  00 10		 brk #$10
$0f:9579  60			rts
$0f:957a  06 01		 asl $01
$0f:957c  10 00		 bpl $957e
$0f:957e  00 10		 brk #$10
$0f:9580  60			rts
$0f:9581  46 01		 lsr $01
$0f:9583  00 10		 brk #$10
$0f:9585  10 00		 bpl $9587
$0f:9587  60			rts
$0f:9588  86 01		 stx $01
$0f:958a  10 00		 bpl $958c
$0f:958c  10 00		 bpl $958e
$0f:958e  60			rts
$0f:958f  c6 03		 dec $03
$0f:9591  00 14		 brk #$14
$0f:9593  00 13		 brk #$13
$0f:9595  00 03		 brk #$03
$0f:9597  00 10		 brk #$10
$0f:9599  00 10		 brk #$10
$0f:959b  00 09		 brk #$09
$0f:959d  00 00		 brk #$00
$0f:959f  00 0f		 brk #$0f
$0f:95a1  00 0e		 brk #$0e
$0f:95a3  62 06 00	  per $95ac
$0f:95a6  00 0f		 brk #$0f
$0f:95a8  0e 00 62	  asl $6200
$0f:95ab  86 00		 stx $00
$0f:95ad  0f 00 0e 00   ora $000e00
$0f:95b1  62 c6 00	  per $967a
$0f:95b4  0f 00 00 0e   ora $0e0000
$0f:95b8  62 46 00	  per $9601
$0f:95bb  02 0d		 cop #$0d
$0f:95bd  07 07		 ora [$07]
$0f:95bf  72 06		 adc ($06)
$0f:95c1  00 0d		 brk #$0d
$0f:95c3  02 08		 cop #$08
$0f:95c5  06 72		 asl $72
$0f:95c7  c6 00		 dec $00
$0f:95c9  08			php
$0f:95ca  07 00		 ora [$00]
$0f:95cc  0e 63 06	  asl $0663
$0f:95cf  00 08		 brk #$08
$0f:95d1  07 0e		 ora [$0e]
$0f:95d3  00 63		 brk #$63
$0f:95d5  86 00		 stx $00
$0f:95d7  09 06		 ora #$06
$0f:95d9  08			php
$0f:95da  06 73		 asl $73
$0f:95dc  06 00		 asl $00
$0f:95de  00 10		 brk #$10
$0f:95e0  00 20		 brk #$20
$0f:95e2  00 00		 brk #$00
$0f:95e4  00 10		 brk #$10
$0f:95e6  00 10		 brk #$10
$0f:95e8  00 02		 brk #$02
$0f:95ea  00 01		 brk #$01
$0f:95ec  00 00		 brk #$00
$0f:95ee  00 10		 brk #$10
$0f:95f0  68			pla
$0f:95f1  06 01		 asl $01
$0f:95f3  00 00		 brk #$00
$0f:95f5  10 00		 bpl $95f7
$0f:95f7  88			dey
$0f:95f8  06 00		 asl $00
$0f:95fa  00 10		 brk #$10
$0f:95fc  00 20		 brk #$20
$0f:95fe  00 00		 brk #$00
$0f:9600  00 10		 brk #$10
$0f:9602  00 10		 brk #$10
$0f:9604  00 02		 brk #$02
$0f:9606  00 01		 brk #$01
$0f:9608  00 00		 brk #$00
$0f:960a  00 10		 brk #$10
$0f:960c  6a			ror a
$0f:960d  06 01		 asl $01
$0f:960f  00 00		 brk #$00
$0f:9611  10 00		 bpl $9613
$0f:9613  8a			txa
$0f:9614  06 00		 asl $00
$0f:9616  00 10		 brk #$10
$0f:9618  00 20		 brk #$20
$0f:961a  00 00		 brk #$00
$0f:961c  00 10		 brk #$10
$0f:961e  00 10		 brk #$10
$0f:9620  00 02		 brk #$02
$0f:9622  00 01		 brk #$01
$0f:9624  00 00		 brk #$00
$0f:9626  00 10		 brk #$10
$0f:9628  6c 06 01	  jmp ($0106)
$0f:962b  00 00		 brk #$00
$0f:962d  10 00		 bpl $962f
$0f:962f  8c 06 00	  sty $0006
$0f:9632  00 10		 brk #$10
$0f:9634  00 20		 brk #$20
$0f:9636  00 00		 brk #$00
$0f:9638  00 10		 brk #$10
$0f:963a  00 10		 brk #$10
$0f:963c  00 02		 brk #$02
$0f:963e  00 01		 brk #$01
$0f:9640  00 00		 brk #$00
$0f:9642  00 10		 brk #$10
$0f:9644  6e 06 01	  ror $0106
$0f:9647  00 00		 brk #$00
$0f:9649  10 00		 bpl $964b
$0f:964b  8e 06 00	  stx $0006
$0f:964e  00 10		 brk #$10
$0f:9650  00 0c		 brk #$0c
$0f:9652  00 00		 brk #$00
$0f:9654  00 10		 brk #$10
$0f:9656  00 10		 brk #$10
$0f:9658  00 04		 brk #$04
$0f:965a  00 00		 brk #$00
$0f:965c  01 07		 ora ($07,x)
$0f:965e  00 04		 brk #$04
$0f:9660  68			pla
$0f:9661  06 00		 asl $00
$0f:9663  07 01		 ora [$01]
$0f:9665  04 00		 tsb $00
$0f:9667  69 06		 adc #$06
$0f:9669  00 08		 brk #$08
$0f:966b  00 03		 brk #$03
$0f:966d  01 6d		 ora ($6d,x)
$0f:966f  06 00		 asl $00
$0f:9671  00 08		 brk #$08
$0f:9673  04 00		 tsb $00
$0f:9675  6c 06 00	  jmp ($0006)
$0f:9678  00 10		 brk #$10
$0f:967a  00 14		 brk #$14
$0f:967c  00 00		 brk #$00
$0f:967e  00 10		 brk #$10
$0f:9680  00 10		 brk #$10
$0f:9682  00 03		 brk #$03
$0f:9684  00 01		 brk #$01
$0f:9686  00 00		 brk #$00
$0f:9688  00 04		 brk #$04
$0f:968a  6a			ror a
$0f:968b  06 00		 asl $00
$0f:968d  01 07		 ora ($07,x)
$0f:968f  0c 00 9a	  tsb $9a00
$0f:9692  06 00		 asl $00
$0f:9694  07 01		 ora [$01]
$0f:9696  0c 00 9b	  tsb $9b00
$0f:9699  06 00		 asl $00
$0f:969b  00 10		 brk #$10
$0f:969d  00 18		 brk #$18
$0f:969f  00 00		 brk #$00
$0f:96a1  00 10		 brk #$10
$0f:96a3  00 10		 brk #$10
$0f:96a5  00 03		 brk #$03
$0f:96a7  00 01		 brk #$01
$0f:96a9  00 00		 brk #$00
$0f:96ab  00 08		 brk #$08
$0f:96ad  6c 06 00	  jmp ($0006)
$0f:96b0  08			php
$0f:96b1  00 10		 brk #$10
$0f:96b3  00 9f		 brk #$9f
$0f:96b5  06 00		 asl $00
$0f:96b7  00 08		 brk #$08
$0f:96b9  10 00		 bpl $96bb
$0f:96bb  9e 06 00	  stz $0006,x
$0f:96be  00 10		 brk #$10
$0f:96c0  00 1e		 brk #$1e
$0f:96c2  00 00		 brk #$00
$0f:96c4  00 10		 brk #$10
$0f:96c6  00 10		 brk #$10
$0f:96c8  00 03		 brk #$03
$0f:96ca  00 01		 brk #$01
$0f:96cc  00 00		 brk #$00
$0f:96ce  00 0e		 brk #$0e
$0f:96d0  6e 06 01	  ror $0106
$0f:96d3  00 00		 brk #$00
$0f:96d5  08			php
$0f:96d6  06 7e		 asl $7e
$0f:96d8  06 01		 asl $01
$0f:96da  00 00		 brk #$00
$0f:96dc  0e 00 8e	  asl $8e00
$0f:96df  06 00		 asl $00
$0f:96e1  00 10		 brk #$10
$0f:96e3  00 20		 brk #$20
$0f:96e5  00 00		 brk #$00
$0f:96e7  00 10		 brk #$10
$0f:96e9  00 10		 brk #$10
$0f:96eb  00 04		 brk #$04
$0f:96ed  00 01		 brk #$01
$0f:96ef  00 00		 brk #$00
$0f:96f1  10 00		 bpl $96f3
$0f:96f3  6c 86 01	  jmp ($0186)
$0f:96f6  00 00		 brk #$00
$0f:96f8  00 10		 brk #$10
$0f:96fa  68			pla
$0f:96fb  06 00		 asl $00
$0f:96fd  00 08		 brk #$08
$0f:96ff  18			clc
$0f:9700  00 77		 brk #$77
$0f:9702  06 00		 asl $00
$0f:9704  00 08		 brk #$08
$0f:9706  10 08		 bpl $9710
$0f:9708  67 06		 adc [$06]
$0f:970a  00 00		 brk #$00
$0f:970c  0e 00 20	  asl $2000
$0f:970f  00 ff		 brk #$ff
$0f:9711  ff 10 00 10   sbc $100010,x
$0f:9715  00 07		 brk #$07
$0f:9717  00 00		 brk #$00
$0f:9719  06 00		 asl $00
$0f:971b  08			php
$0f:971c  0f 76 06 00   ora $000676
$0f:9720  06 00		 asl $00
$0f:9722  00 17		 brk #$17
$0f:9724  66 06		 ror $06
$0f:9726  00 00		 brk #$00
$0f:9728  06 08		 asl $08
$0f:972a  0f 77 06 00   ora $000677
$0f:972e  00 06		 brk #$06
$0f:9730  00 17		 brk #$17
$0f:9732  67 06		 adc [$06]
$0f:9734  00 04		 brk #$04
$0f:9736  02 0f		 cop #$0f
$0f:9738  08			php
$0f:9739  66 46		 ror $46
$0f:973b  00 04		 brk #$04
$0f:973d  02 17		 cop #$17
$0f:973f  00 76		 brk #$76
$0f:9741  46 00		 lsr $00
$0f:9743  02 04		 cop #$04
$0f:9745  0c 0b 96	  tsb $960b
$0f:9748  06 00		 asl $00
$0f:974a  00 0e		 brk #$0e
$0f:974c  00 22		 brk #$22
$0f:974e  00 ff		 brk #$ff
$0f:9750  ff 10 00 10   sbc $100010,x
$0f:9754  00 07		 brk #$07
$0f:9756  00 00		 brk #$00
$0f:9758  06 00		 asl $00
$0f:975a  08			php
$0f:975b  11 76		 ora ($76),y
$0f:975d  06 00		 asl $00
$0f:975f  06 00		 asl $00
$0f:9761  00 19		 brk #$19
$0f:9763  66 06		 ror $06
$0f:9765  00 00		 brk #$00
$0f:9767  06 08		 asl $08
$0f:9769  11 77		 ora ($77),y
$0f:976b  06 00		 asl $00
$0f:976d  00 06		 brk #$06
$0f:976f  00 19		 brk #$19
$0f:9771  67 06		 adc [$06]
$0f:9773  00 04		 brk #$04
$0f:9775  02 11		 cop #$11
$0f:9777  08			php
$0f:9778  66 46		 ror $46
$0f:977a  00 04		 brk #$04
$0f:977c  02 19		 cop #$19
$0f:977e  00 76		 brk #$76
$0f:9780  46 00		 lsr $00
$0f:9782  02 04		 cop #$04
$0f:9784  0d 0c 96	  ora $960c
$0f:9787  06 00		 asl $00
$0f:9789  00 0e		 brk #$0e
$0f:978b  00 29		 brk #$29
$0f:978d  00 ff		 brk #$ff
$0f:978f  ff 10 00 10   sbc $100010,x
$0f:9793  00 05		 brk #$05
$0f:9795  00 00		 brk #$00
$0f:9797  04 02		 tsb $02
$0f:9799  18			clc
$0f:979a  08			php
$0f:979b  67 46		 adc [$46]
$0f:979d  00 04		 brk #$04
$0f:979f  02 20		 cop #$20
$0f:97a1  00 77		 brk #$77
$0f:97a3  46 00		 lsr $00
$0f:97a5  00 06		 brk #$06
$0f:97a7  0a			asl a
$0f:97a8  16 96		 asl $96,x
$0f:97aa  06 00		 asl $00
$0f:97ac  06 00		 asl $00
$0f:97ae  08			php
$0f:97af  18			clc
$0f:97b0  77 06		 adc [$06],y
$0f:97b2  00 06		 brk #$06
$0f:97b4  00 00		 brk #$00
$0f:97b6  20 67 06	  jsr $0667
$0f:97b9  fd ff 0e	  sbc $0eff,x
$0f:97bc  00 26		 brk #$26
$0f:97be  00 fc		 brk #$fc
$0f:97c0  ff 10 00 10   sbc $100010,x
$0f:97c4  00 02		 brk #$02
$0f:97c6  00 00		 brk #$00
$0f:97c8  03 00		 ora $00,s
$0f:97ca  00 1a		 brk #$1a
$0f:97cc  96 06		 stx $06,y
$0f:97ce  00 00		 brk #$00
$0f:97d0  03 1a		 ora $1a,s
$0f:97d2  00 96		 brk #$96
$0f:97d4  06 08		 asl $08
$0f:97d6  00 18		 brk #$18
$0f:97d8  00 28		 brk #$28
$0f:97da  00 08		 brk #$08
$0f:97dc  00 10		 brk #$10
$0f:97de  00 20		 brk #$20
$0f:97e0  00 0c		 brk #$0c
$0f:97e2  00 01		 brk #$01
$0f:97e4  00 10		 brk #$10
$0f:97e6  00 20		 brk #$20
$0f:97e8  60			rts
$0f:97e9  06 01		 asl $01
$0f:97eb  10 00		 bpl $97ed
$0f:97ed  00 20		 brk #$20
$0f:97ef  62 06 01	  per $98f8
$0f:97f2  00 10		 brk #$10
$0f:97f4  08			php
$0f:97f5  18			clc
$0f:97f6  70 06		 bvs $97fe
$0f:97f8  01 10		 ora ($10,x)
$0f:97fa  00 08		 brk #$08
$0f:97fc  18			clc
$0f:97fd  72 06		 adc ($06)
$0f:97ff  00 00		 brk #$00
$0f:9801  18			clc
$0f:9802  18			clc
$0f:9803  10 90		 bpl $9795
$0f:9805  06 00		 asl $00
$0f:9807  08			php
$0f:9808  10 18		 bpl $9822
$0f:980a  10 91		 bpl $979d
$0f:980c  06 00		 asl $00
$0f:980e  10 08		 bpl $9818
$0f:9810  18			clc
$0f:9811  10 92		 bpl $97a5
$0f:9813  06 00		 asl $00
$0f:9815  18			clc
$0f:9816  00 18		 brk #$18
$0f:9818  10 93		 bpl $97ad
$0f:981a  06 00		 asl $00
$0f:981c  08			php
$0f:981d  10 20		 bpl $983f
$0f:981f  08			php
$0f:9820  64 06		 stz $06
$0f:9822  00 10		 brk #$10
$0f:9824  08			php
$0f:9825  20 08 65	  jsr $6508
$0f:9828  06 00		 asl $00
$0f:982a  08			php
$0f:982b  10 28		 bpl $9855
$0f:982d  00 74		 brk #$74
$0f:982f  06 00		 asl $00
$0f:9831  10 08		 bpl $983b
$0f:9833  28			plp
$0f:9834  00 75		 brk #$75
$0f:9836  06 0b		 asl $0b
$0f:9838  00 17		 brk #$17
$0f:983a  00 28		 brk #$28
$0f:983c  00 08		 brk #$08
$0f:983e  00 10		 brk #$10
$0f:9840  00 20		 brk #$20
$0f:9842  00 0c		 brk #$0c
$0f:9844  00 01		 brk #$01
$0f:9846  00 12		 brk #$12
$0f:9848  00 20		 brk #$20
$0f:984a  60			rts
$0f:984b  06 01		 asl $01
$0f:984d  10 02		 bpl $9851
$0f:984f  00 20		 brk #$20
$0f:9851  62 06 01	  per $995a
$0f:9854  01 11		 ora ($11,x)
$0f:9856  08			php
$0f:9857  18			clc
$0f:9858  70 06		 bvs $9860
$0f:985a  01 11		 ora ($11,x)
$0f:985c  01 08		 ora ($08,x)
$0f:985e  18			clc
$0f:985f  72 06		 adc ($06)
$0f:9861  00 02		 brk #$02
$0f:9863  18			clc
$0f:9864  18			clc
$0f:9865  10 90		 bpl $97f7
$0f:9867  06 00		 asl $00
$0f:9869  0a			asl a
$0f:986a  10 18		 bpl $9884
$0f:986c  10 91		 bpl $97ff
$0f:986e  06 00		 asl $00
$0f:9870  12 08		 ora ($08)
$0f:9872  18			clc
$0f:9873  10 92		 bpl $9807
$0f:9875  06 00		 asl $00
$0f:9877  1a			inc a
$0f:9878  00 18		 brk #$18
$0f:987a  10 93		 bpl $980f
$0f:987c  06 00		 asl $00
$0f:987e  0b			phd
$0f:987f  0f 20 08 64   ora $640820
$0f:9883  06 00		 asl $00
$0f:9885  13 07		 ora ($07,s),y
$0f:9887  20 08 65	  jsr $6508
$0f:988a  06 00		 asl $00
$0f:988c  0b			phd
$0f:988d  0f 28 00 74   ora $740028
$0f:9891  06 00		 asl $00
$0f:9893  13 07		 ora ($07,s),y
$0f:9895  28			plp
$0f:9896  00 75		 brk #$75
$0f:9898  06 0e		 asl $0e
$0f:989a  00 15		 brk #$15
$0f:989c  00 28		 brk #$28
$0f:989e  00 08		 brk #$08
$0f:98a0  00 10		 brk #$10
$0f:98a2  00 20		 brk #$20
$0f:98a4  00 0c		 brk #$0c
$0f:98a6  00 01		 brk #$01
$0f:98a8  00 13		 brk #$13
$0f:98aa  00 20		 brk #$20
$0f:98ac  60			rts
$0f:98ad  06 01		 asl $01
$0f:98af  10 03		 bpl $98b4
$0f:98b1  00 20		 brk #$20
$0f:98b3  62 06 01	  per $99bc
$0f:98b6  01 12		 ora ($12,x)
$0f:98b8  08			php
$0f:98b9  18			clc
$0f:98ba  70 06		 bvs $98c2
$0f:98bc  01 11		 ora ($11,x)
$0f:98be  02 08		 cop #$08
$0f:98c0  18			clc
$0f:98c1  72 06		 adc ($06)
$0f:98c3  00 03		 brk #$03
$0f:98c5  18			clc
$0f:98c6  18			clc
$0f:98c7  10 90		 bpl $9859
$0f:98c9  06 00		 asl $00
$0f:98cb  0b			phd
$0f:98cc  10 18		 bpl $98e6
$0f:98ce  10 91		 bpl $9861
$0f:98d0  06 00		 asl $00
$0f:98d2  13 08		 ora ($08,s),y
$0f:98d4  18			clc
$0f:98d5  10 92		 bpl $9869
$0f:98d7  06 00		 asl $00
$0f:98d9  1b			tcs
$0f:98da  00 18		 brk #$18
$0f:98dc  10 93		 bpl $9871
$0f:98de  06 00		 asl $00
$0f:98e0  0d 0e 20	  ora $200e
$0f:98e3  08			php
$0f:98e4  64 06		 stz $06
$0f:98e6  00 15		 brk #$15
$0f:98e8  06 20		 asl $20
$0f:98ea  08			php
$0f:98eb  65 06		 adc $06
$0f:98ed  00 0e		 brk #$0e
$0f:98ef  0d 28 00	  ora $0028
$0f:98f2  74 06		 stz $06,x
$0f:98f4  00 16		 brk #$16
$0f:98f6  05 28		 ora $28
$0f:98f8  00 75		 brk #$75
$0f:98fa  06 07		 asl $07
$0f:98fc  00 1b		 brk #$1b
$0f:98fe  00 28		 brk #$28
$0f:9900  00 08		 brk #$08
$0f:9902  00 10		 brk #$10
$0f:9904  00 20		 brk #$20
$0f:9906  00 0c		 brk #$0c
$0f:9908  00 01		 brk #$01
$0f:990a  02 10		 cop #$10
$0f:990c  00 20		 brk #$20
$0f:990e  60			rts
$0f:990f  06 01		 asl $01
$0f:9911  12 00		 ora ($00)
$0f:9913  00 20		 brk #$20
$0f:9915  62 06 01	  per $9a1e
$0f:9918  01 11		 ora ($11,x)
$0f:991a  08			php
$0f:991b  18			clc
$0f:991c  70 06		 bvs $9924
$0f:991e  01 11		 ora ($11,x)
$0f:9920  01 08		 ora ($08,x)
$0f:9922  18			clc
$0f:9923  72 06		 adc ($06)
$0f:9925  00 00		 brk #$00
$0f:9927  1a			inc a
$0f:9928  18			clc
$0f:9929  10 90		 bpl $98bb
$0f:992b  06 00		 asl $00
$0f:992d  08			php
$0f:992e  12 18		 ora ($18)
$0f:9930  10 91		 bpl $98c3
$0f:9932  06 00		 asl $00
$0f:9934  10 0a		 bpl $9940
$0f:9936  18			clc
$0f:9937  10 92		 bpl $98cb
$0f:9939  06 00		 asl $00
$0f:993b  18			clc
$0f:993c  02 18		 cop #$18
$0f:993e  10 93		 bpl $98d3
$0f:9940  06 00		 asl $00
$0f:9942  07 13		 ora [$13]
$0f:9944  20 08 64	  jsr $6408
$0f:9947  06 00		 asl $00
$0f:9949  0f 0b 20 08   ora $08200b
$0f:994d  65 06		 adc $06
$0f:994f  00 07		 brk #$07
$0f:9951  13 28		 ora ($28,s),y
$0f:9953  00 74		 brk #$74
$0f:9955  06 00		 asl $00
$0f:9957  0f 0b 28 00   ora $00280b
$0f:995b  75 06		 adc $06,x
$0f:995d  05 00		 ora $00
$0f:995f  1d 00 28	  ora $2800,x
$0f:9962  00 08		 brk #$08
$0f:9964  00 10		 brk #$10
$0f:9966  00 20		 brk #$20
$0f:9968  00 0c		 brk #$0c
$0f:996a  00 01		 brk #$01
$0f:996c  02 10		 cop #$10
$0f:996e  00 20		 brk #$20
$0f:9970  60			rts
$0f:9971  06 01		 asl $01
$0f:9973  12 00		 ora ($00)
$0f:9975  00 20		 brk #$20
$0f:9977  62 06 01	  per $9a80
$0f:997a  02 10		 cop #$10
$0f:997c  08			php
$0f:997d  18			clc
$0f:997e  70 06		 bvs $9986
$0f:9980  01 12		 ora ($12,x)
$0f:9982  00 08		 brk #$08
$0f:9984  18			clc
$0f:9985  72 06		 adc ($06)
$0f:9987  00 00		 brk #$00
$0f:9989  1a			inc a
$0f:998a  18			clc
$0f:998b  10 90		 bpl $991d
$0f:998d  06 00		 asl $00
$0f:998f  08			php
$0f:9990  12 18		 ora ($18)
$0f:9992  10 91		 bpl $9925
$0f:9994  06 00		 asl $00
$0f:9996  10 0a		 bpl $99a2
$0f:9998  18			clc
$0f:9999  10 92		 bpl $992d
$0f:999b  06 00		 asl $00
$0f:999d  18			clc
$0f:999e  02 18		 cop #$18
$0f:99a0  10 93		 bpl $9935
$0f:99a2  06 00		 asl $00
$0f:99a4  07 13		 ora [$13]
$0f:99a6  20 08 64	  jsr $6408
$0f:99a9  06 00		 asl $00
$0f:99ab  0f 0b 20 08   ora $08200b
$0f:99af  65 06		 adc $06
$0f:99b1  00 05		 brk #$05
$0f:99b3  15 28		 ora $28,x
$0f:99b5  00 74		 brk #$74
$0f:99b7  06 00		 asl $00
$0f:99b9  0d 0d 28	  ora $280d
$0f:99bc  00 75		 brk #$75
$0f:99be  06 0b		 asl $0b
$0f:99c0  00 17		 brk #$17
$0f:99c2  00 28		 brk #$28
$0f:99c4  00 08		 brk #$08
$0f:99c6  00 10		 brk #$10
$0f:99c8  00 20		 brk #$20
$0f:99ca  00 0c		 brk #$0c
$0f:99cc  00 01		 brk #$01
$0f:99ce  02 10		 cop #$10
$0f:99d0  00 20		 brk #$20
$0f:99d2  60			rts
$0f:99d3  06 01		 asl $01
$0f:99d5  12 00		 ora ($00)
$0f:99d7  00 20		 brk #$20
$0f:99d9  62 06 01	  per $9ae2
$0f:99dc  01 11		 ora ($11,x)
$0f:99de  08			php
$0f:99df  18			clc
$0f:99e0  70 06		 bvs $99e8
$0f:99e2  01 11		 ora ($11,x)
$0f:99e4  01 08		 ora ($08,x)
$0f:99e6  18			clc
$0f:99e7  72 06		 adc ($06)
$0f:99e9  00 00		 brk #$00
$0f:99eb  1a			inc a
$0f:99ec  18			clc
$0f:99ed  10 90		 bpl $997f
$0f:99ef  06 00		 asl $00
$0f:99f1  08			php
$0f:99f2  12 18		 ora ($18)
$0f:99f4  10 91		 bpl $9987
$0f:99f6  06 00		 asl $00
$0f:99f8  10 0a		 bpl $9a04
$0f:99fa  18			clc
$0f:99fb  10 92		 bpl $998f
$0f:99fd  06 00		 asl $00
$0f:99ff  18			clc
$0f:9a00  02 18		 cop #$18
$0f:9a02  10 93		 bpl $9997
$0f:9a04  06 00		 asl $00
$0f:9a06  0a			asl a
$0f:9a07  10 20		 bpl $9a29
$0f:9a09  08			php
$0f:9a0a  64 06		 stz $06
$0f:9a0c  00 12		 brk #$12
$0f:9a0e  08			php
$0f:9a0f  20 08 65	  jsr $6508
$0f:9a12  06 00		 asl $00
$0f:9a14  0b			phd
$0f:9a15  0f 28 00 74   ora $740028
$0f:9a19  06 00		 asl $00
$0f:9a1b  13 07		 ora ($07,s),y
$0f:9a1d  28			plp
$0f:9a1e  00 75		 brk #$75
$0f:9a20  06 09		 asl $09
$0f:9a22  00 18		 brk #$18
$0f:9a24  00 28		 brk #$28
$0f:9a26  00 08		 brk #$08
$0f:9a28  00 10		 brk #$10
$0f:9a2a  00 20		 brk #$20
$0f:9a2c  00 0c		 brk #$0c
$0f:9a2e  00 01		 brk #$01
$0f:9a30  01 10		 ora ($10,x)
$0f:9a32  00 20		 brk #$20
$0f:9a34  60			rts
$0f:9a35  06 01		 asl $01
$0f:9a37  11 00		 ora ($00),y
$0f:9a39  00 20		 brk #$20
$0f:9a3b  62 06 01	  per $9b44
$0f:9a3e  01 10		 ora ($10,x)
$0f:9a40  08			php
$0f:9a41  18			clc
$0f:9a42  70 06		 bvs $9a4a
$0f:9a44  01 11		 ora ($11,x)
$0f:9a46  00 08		 brk #$08
$0f:9a48  18			clc
$0f:9a49  72 06		 adc ($06)
$0f:9a4b  00 00		 brk #$00
$0f:9a4d  19 18 10	  ora $1018,y
$0f:9a50  90 06		 bcc $9a58
$0f:9a52  00 08		 brk #$08
$0f:9a54  11 18		 ora ($18),y
$0f:9a56  10 91		 bpl $99e9
$0f:9a58  06 00		 asl $00
$0f:9a5a  10 09		 bpl $9a65
$0f:9a5c  18			clc
$0f:9a5d  10 92		 bpl $99f1
$0f:9a5f  06 00		 asl $00
$0f:9a61  18			clc
$0f:9a62  01 18		 ora ($18,x)
$0f:9a64  10 93		 bpl $99f9
$0f:9a66  06 00		 asl $00
$0f:9a68  08			php
$0f:9a69  11 20		 ora ($20),y
$0f:9a6b  08			php
$0f:9a6c  64 06		 stz $06
$0f:9a6e  00 10		 brk #$10
$0f:9a70  09 20		 ora #$20
$0f:9a72  08			php
$0f:9a73  65 06		 adc $06
$0f:9a75  00 09		 brk #$09
$0f:9a77  10 28		 bpl $9aa1
$0f:9a79  00 74		 brk #$74
$0f:9a7b  06 00		 asl $00
$0f:9a7d  11 08		 ora ($08),y
$0f:9a7f  28			plp
$0f:9a80  00 75		 brk #$75
$0f:9a82  06 06		 asl $06
$0f:9a84  00 1c		 brk #$1c
$0f:9a86  00 28		 brk #$28
$0f:9a88  00 08		 brk #$08
$0f:9a8a  00 10		 brk #$10
$0f:9a8c  00 20		 brk #$20
$0f:9a8e  00 0c		 brk #$0c
$0f:9a90  00 01		 brk #$01
$0f:9a92  00 12		 brk #$12
$0f:9a94  00 20		 brk #$20
$0f:9a96  60			rts
$0f:9a97  06 01		 asl $01
$0f:9a99  10 02		 bpl $9a9d
$0f:9a9b  00 20		 brk #$20
$0f:9a9d  62 06 01	  per $9ba6
$0f:9aa0  01 11		 ora ($11,x)
$0f:9aa2  08			php
$0f:9aa3  18			clc
$0f:9aa4  70 06		 bvs $9aac
$0f:9aa6  01 11		 ora ($11,x)
$0f:9aa8  01 08		 ora ($08,x)
$0f:9aaa  18			clc
$0f:9aab  72 06		 adc ($06)
$0f:9aad  00 02		 brk #$02
$0f:9aaf  18			clc
$0f:9ab0  18			clc
$0f:9ab1  10 90		 bpl $9a43
$0f:9ab3  06 00		 asl $00
$0f:9ab5  0a			asl a
$0f:9ab6  10 18		 bpl $9ad0
$0f:9ab8  10 91		 bpl $9a4b
$0f:9aba  06 00		 asl $00
$0f:9abc  12 08		 ora ($08)
$0f:9abe  18			clc
$0f:9abf  10 92		 bpl $9a53
$0f:9ac1  06 00		 asl $00
$0f:9ac3  1a			inc a
$0f:9ac4  00 18		 brk #$18
$0f:9ac6  10 93		 bpl $9a5b
$0f:9ac8  06 00		 asl $00
$0f:9aca  08			php
$0f:9acb  12 20		 ora ($20)
$0f:9acd  08			php
$0f:9ace  64 06		 stz $06
$0f:9ad0  00 10		 brk #$10
$0f:9ad2  0a			asl a
$0f:9ad3  20 08 65	  jsr $6508
$0f:9ad6  06 00		 asl $00
$0f:9ad8  06 14		 asl $14
$0f:9ada  28			plp
$0f:9adb  00 74		 brk #$74
$0f:9add  06 00		 asl $00
$0f:9adf  0e 0c 28	  asl $280c
$0f:9ae2  00 75		 brk #$75
$0f:9ae4  06 08		 asl $08
$0f:9ae6  00 1a		 brk #$1a
$0f:9ae8  00 28		 brk #$28
$0f:9aea  00 08		 brk #$08
$0f:9aec  00 10		 brk #$10
$0f:9aee  00 20		 brk #$20
$0f:9af0  00 0c		 brk #$0c
$0f:9af2  00 01		 brk #$01
$0f:9af4  00 12		 brk #$12
$0f:9af6  00 20		 brk #$20
$0f:9af8  60			rts
$0f:9af9  06 01		 asl $01
$0f:9afb  10 02		 bpl $9aff
$0f:9afd  00 20		 brk #$20
$0f:9aff  62 06 01	  per $9c08
$0f:9b02  01 11		 ora ($11,x)
$0f:9b04  08			php
$0f:9b05  18			clc
$0f:9b06  70 06		 bvs $9b0e
$0f:9b08  01 11		 ora ($11,x)
$0f:9b0a  01 08		 ora ($08,x)
$0f:9b0c  18			clc
$0f:9b0d  72 06		 adc ($06)
$0f:9b0f  00 02		 brk #$02
$0f:9b11  18			clc
$0f:9b12  18			clc
$0f:9b13  10 90		 bpl $9aa5
$0f:9b15  06 00		 asl $00
$0f:9b17  0a			asl a
$0f:9b18  10 18		 bpl $9b32
$0f:9b1a  10 91		 bpl $9aad
$0f:9b1c  06 00		 asl $00
$0f:9b1e  12 08		 ora ($08)
$0f:9b20  18			clc
$0f:9b21  10 92		 bpl $9ab5
$0f:9b23  06 00		 asl $00
$0f:9b25  1a			inc a
$0f:9b26  00 18		 brk #$18
$0f:9b28  10 93		 bpl $9abd
$0f:9b2a  06 00		 asl $00
$0f:9b2c  0a			asl a
$0f:9b2d  10 20		 bpl $9b4f
$0f:9b2f  08			php
$0f:9b30  64 06		 stz $06
$0f:9b32  00 12		 brk #$12
$0f:9b34  08			php
$0f:9b35  20 08 65	  jsr $6508
$0f:9b38  06 00		 asl $00
$0f:9b3a  08			php
$0f:9b3b  12 28		 ora ($28)
$0f:9b3d  00 74		 brk #$74
$0f:9b3f  06 00		 asl $00
$0f:9b41  10 0a		 bpl $9b4d
$0f:9b43  28			plp
$0f:9b44  00 75		 brk #$75
$0f:9b46  06 00		 asl $00
$0f:9b48  00 08		 brk #$08
$0f:9b4a  00 08		 brk #$08
$0f:9b4c  00 00		 brk #$00
$0f:9b4e  00 08		 brk #$08
$0f:9b50  00 08		 brk #$08
$0f:9b52  00 01		 brk #$01
$0f:9b54  00 00		 brk #$00
$0f:9b56  00 00		 brk #$00
$0f:9b58  00 00		 brk #$00
$0f:9b5a  84 06		 sty $06
$0f:9b5c  00 00		 brk #$00
$0f:9b5e  08			php
$0f:9b5f  00 08		 brk #$08
$0f:9b61  00 00		 brk #$00
$0f:9b63  00 08		 brk #$08
$0f:9b65  00 08		 brk #$08
$0f:9b67  00 01		 brk #$01
$0f:9b69  00 00		 brk #$00
$0f:9b6b  00 00		 brk #$00
$0f:9b6d  00 00		 brk #$00
$0f:9b6f  85 06		 sta $06
$0f:9b71  00 00		 brk #$00
$0f:9b73  10 00		 bpl $9b75
$0f:9b75  00 00		 brk #$00
$0f:9b77  08			php
$0f:9b78  00 10		 brk #$10
$0f:9b7a  00 10		 brk #$10
$0f:9b7c  00 02		 brk #$02
$0f:9b7e  00 00		 brk #$00
$0f:9b80  00 08		 brk #$08
$0f:9b82  00 00		 brk #$00
$0f:9b84  74 06		 stz $06,x
$0f:9b86  00 08		 brk #$08
$0f:9b88  00 00		 brk #$00
$0f:9b8a  00 75		 brk #$75
$0f:9b8c  06 00		 asl $00
$0f:9b8e  00 10		 brk #$10
$0f:9b90  00 18		 brk #$18
$0f:9b92  00 08		 brk #$08
$0f:9b94  00 10		 brk #$10
$0f:9b96  00 10		 brk #$10
$0f:9b98  00 08		 brk #$08
$0f:9b9a  00 00		 brk #$00
$0f:9b9c  00 08		 brk #$08
$0f:9b9e  18			clc
$0f:9b9f  00 74		 brk #$74
$0f:9ba1  06 00		 asl $00
$0f:9ba3  08			php
$0f:9ba4  00 18		 brk #$18
$0f:9ba6  00 75		 brk #$75
$0f:9ba8  06 00		 asl $00
$0f:9baa  00 08		 brk #$08
$0f:9bac  10 08		 bpl $9bb6
$0f:9bae  80 06		 bra $9bb6
$0f:9bb0  00 08		 brk #$08
$0f:9bb2  00 10		 brk #$10
$0f:9bb4  08			php
$0f:9bb5  83 06		 sta $06,s
$0f:9bb7  00 08		 brk #$08
$0f:9bb9  00 08		 brk #$08
$0f:9bbb  10 73		 bpl $9c30
$0f:9bbd  06 00		 asl $00
$0f:9bbf  00 08		 brk #$08
$0f:9bc1  08			php
$0f:9bc2  10 70		 bpl $9c34
$0f:9bc4  06 00		 asl $00
$0f:9bc6  00 08		 brk #$08
$0f:9bc8  00 18		 brk #$18
$0f:9bca  60			rts
$0f:9bcb  06 00		 asl $00
$0f:9bcd  08			php
$0f:9bce  00 00		 brk #$00
$0f:9bd0  18			clc
$0f:9bd1  63 06		 adc $06,s
$0f:9bd3  f0 ff		 beq $9bd4
$0f:9bd5  18			clc
$0f:9bd6  00 30		 brk #$30
$0f:9bd8  00 d8		 brk #$d8
$0f:9bda  ff 08 00 08   sbc $080008,x
$0f:9bde  00 01		 brk #$01
$0f:9be0  00 00		 brk #$00
$0f:9be2  00 00		 brk #$00
$0f:9be4  00 00		 brk #$00
$0f:9be6  94 04		 sty $04,x
$0f:9be8  04 00		 tsb $00
$0f:9bea  13 00		 ora ($00,s),y
$0f:9bec  0f 00 00 00   ora $000000
$0f:9bf0  10 00		 bpl $9bf2
$0f:9bf2  10 00		 bpl $9bf4
$0f:9bf4  08			php
$0f:9bf5  00 00		 brk #$00
$0f:9bf7  00 0f		 brk #$0f
$0f:9bf9  07 00		 ora [$00]
$0f:9bfb  7d 06 00	  adc $0006,x
$0f:9bfe  00 0f		 brk #$0f
$0f:9c00  00 07		 brk #$07
$0f:9c02  7d 86 00	  adc $0086,x
$0f:9c05  08			php
$0f:9c06  07 07		 ora [$07]
$0f:9c08  00 9c		 brk #$9c
$0f:9c0a  06 00		 asl $00
$0f:9c0c  08			php
$0f:9c0d  07 00		 ora [$00]
$0f:9c0f  07 9c		 ora [$9c]
$0f:9c11  86 00		 stx $00
$0f:9c13  0f 00 07 00   ora $000700
$0f:9c17  9d 06 00	  sta $0006,x
$0f:9c1a  0f 00 00 07   ora $070000
$0f:9c1e  9d 86 00	  sta $0086,x
$0f:9c21  0f 00 01 06   ora $060100
$0f:9c25  8d 86 00	  sta $0086
$0f:9c28  0f 00 06 01   ora $010600
$0f:9c2c  8d 06 ff	  sta $ff06
$0f:9c2f  ff 10 00 1c   sbc $1c0010,x
$0f:9c33  00 fc		 brk #$fc
$0f:9c35  ff 10 00 10   sbc $100010,x
$0f:9c39  00 08		 brk #$08
$0f:9c3b  00 00		 brk #$00
$0f:9c3d  00 07		 brk #$07
$0f:9c3f  10 00		 bpl $9c41
$0f:9c41  9e 06 00	  stz $0006,x
$0f:9c44  07 00		 ora [$00]
$0f:9c46  10 00		 bpl $9c48
$0f:9c48  9e 46 00	  stz $0046,x
$0f:9c4b  00 07		 brk #$07
$0f:9c4d  08			php
$0f:9c4e  08			php
$0f:9c4f  8e 06 00	  stx $0006
$0f:9c52  07 00		 ora [$00]
$0f:9c54  08			php
$0f:9c55  08			php
$0f:9c56  8e 46 00	  stx $0046
$0f:9c59  00 07		 brk #$07
$0f:9c5b  00 10		 brk #$10
$0f:9c5d  7e 06 00	  ror $0006,x
$0f:9c60  07 00		 ora [$00]
$0f:9c62  00 10		 brk #$10
$0f:9c64  7e 46 00	  ror $0046,x
$0f:9c67  03 04		 ora $04,s
$0f:9c69  0e 02 9e	  asl $9e02
$0f:9c6c  06 00		 asl $00
$0f:9c6e  04 03		 tsb $03
$0f:9c70  0e 02 9e	  asl $9e02
$0f:9c73  46 07		 lsr $07
$0f:9c75  00 19		 brk #$19
$0f:9c77  00 15		 brk #$15
$0f:9c79  00 06		 brk #$06
$0f:9c7b  00 10		 brk #$10
$0f:9c7d  00 10		 brk #$10
$0f:9c7f  00 0e		 brk #$0e
$0f:9c81  00 00		 brk #$00
$0f:9c83  16 02		 asl $02,x
$0f:9c85  13 00		 ora ($00,s),y
$0f:9c87  9d 06 00	  sta $0006,x
$0f:9c8a  16 02		 asl $02,x
$0f:9c8c  00 13		 brk #$13
$0f:9c8e  9d 86 00	  sta $0086,x
$0f:9c91  0e 0a 13	  asl $130a
$0f:9c94  00 9c		 brk #$9c
$0f:9c96  06 00		 asl $00
$0f:9c98  0e 0a 00	  asl $000a
$0f:9c9b  13 9c		 ora ($9c,s),y
$0f:9c9d  86 00		 stx $00
$0f:9c9f  06 12		 asl $12
$0f:9ca1  13 00		 ora ($00,s),y
$0f:9ca3  7d 06 00	  adc $0006,x
$0f:9ca6  06 12		 asl $12
$0f:9ca8  00 13		 brk #$13
$0f:9caa  7d 86 00	  adc $0086,x
$0f:9cad  18			clc
$0f:9cae  00 0b		 brk #$0b
$0f:9cb0  08			php
$0f:9cb1  8d 06 00	  sta $0006
$0f:9cb4  18			clc
$0f:9cb5  00 08		 brk #$08
$0f:9cb7  0b			phd
$0f:9cb8  8d 86 00	  sta $0086
$0f:9cbb  10 08		 bpl $9cc5
$0f:9cbd  0c 07 8c	  tsb $8c07
$0f:9cc0  06 00		 asl $00
$0f:9cc2  10 08		 bpl $9ccc
$0f:9cc4  08			php
$0f:9cc5  0b			phd
$0f:9cc6  8c 86 00	  sty $0086
$0f:9cc9  08			php
$0f:9cca  10 0d		 bpl $9cd9
$0f:9ccc  06 6d		 asl $6d
$0f:9cce  06 00		 asl $00
$0f:9cd0  08			php
$0f:9cd1  10 06		 bpl $9cd9
$0f:9cd3  0d 6d 86	  ora $866d
$0f:9cd6  00 00		 brk #$00
$0f:9cd8  18			clc
$0f:9cd9  0d 06 6c	  ora $6c06
$0f:9cdc  06 00		 asl $00
$0f:9cde  00 18		 brk #$18
$0f:9ce0  06 0d		 asl $0d
$0f:9ce2  6c 86 05	  jmp ($0586)
$0f:9ce5  00 16		 brk #$16
$0f:9ce7  00 1f		 brk #$1f
$0f:9ce9  00 01		 brk #$01
$0f:9ceb  00 10		 brk #$10
$0f:9ced  00 10		 brk #$10
$0f:9cef  00 0e		 brk #$0e
$0f:9cf1  00 00		 brk #$00
$0f:9cf3  00 13		 brk #$13
$0f:9cf5  15 03		 ora $03,x
$0f:9cf7  9e 06 00	  stz $0006,x
$0f:9cfa  13 00		 ora ($00,s),y
$0f:9cfc  15 03		 ora $03,x
$0f:9cfe  9e 46 00	  stz $0046,x
$0f:9d01  00 13		 brk #$13
$0f:9d03  0d 0b 8e	  ora $8e0b
$0f:9d06  06 00		 asl $00
$0f:9d08  13 00		 ora ($00,s),y
$0f:9d0a  0d 0b 8e	  ora $8e0b
$0f:9d0d  46 00		 lsr $00
$0f:9d0f  00 13		 brk #$13
$0f:9d11  05 13		 ora $13
$0f:9d13  7e 06 00	  ror $0006,x
$0f:9d16  13 00		 ora ($00,s),y
$0f:9d18  05 13		 ora $13
$0f:9d1a  7e 46 00	  ror $0046,x
$0f:9d1d  08			php
$0f:9d1e  0b			phd
$0f:9d1f  18			clc
$0f:9d20  00 9f		 brk #$9f
$0f:9d22  06 00		 asl $00
$0f:9d24  0b			phd
$0f:9d25  08			php
$0f:9d26  18			clc
$0f:9d27  00 9f		 brk #$9f
$0f:9d29  46 00		 lsr $00
$0f:9d2b  07 0c		 ora [$0c]
$0f:9d2d  10 08		 bpl $9d37
$0f:9d2f  8f 06 00 0c   sta $0c0006
$0f:9d33  07 10		 ora [$10]
$0f:9d35  08			php
$0f:9d36  8f 46 00 06   sta $060046
$0f:9d3a  0d 08 10	  ora $1008
$0f:9d3d  7f 06 00 0d   adc $0d0006,x
$0f:9d41  06 08		 asl $08
$0f:9d43  10 7f		 bpl $9dc4
$0f:9d45  46 00		 lsr $00
$0f:9d47  06 0d		 asl $0d
$0f:9d49  00 18		 brk #$18
$0f:9d4b  6f 06 00 0d   adc $0d0006
$0f:9d4f  06 00		 asl $00
$0f:9d51  18			clc
$0f:9d52  6f 46 08 00   adc $000846
$0f:9d56  18			clc
$0f:9d57  00 17		 brk #$17
$0f:9d59  00 08		 brk #$08
$0f:9d5b  00 10		 brk #$10
$0f:9d5d  00 10		 brk #$10
$0f:9d5f  00 08		 brk #$08
$0f:9d61  00 00		 brk #$00
$0f:9d63  08			php
$0f:9d64  10 17		 bpl $9d7d
$0f:9d66  00 7d		 brk #$7d
$0f:9d68  06 00		 asl $00
$0f:9d6a  08			php
$0f:9d6b  10 00		 bpl $9d6d
$0f:9d6d  17 7d		 ora [$7d],y
$0f:9d6f  86 00		 stx $00
$0f:9d71  08			php
$0f:9d72  10 0f		 bpl $9d83
$0f:9d74  08			php
$0f:9d75  6d 06 00	  adc $0006
$0f:9d78  08			php
$0f:9d79  10 08		 bpl $9d83
$0f:9d7b  0f 6d 86 00   ora $00866d
$0f:9d7f  00 18		 brk #$18
$0f:9d81  0f 08 6c 06   ora $066c08
$0f:9d85  00 00		 brk #$00
$0f:9d87  18			clc
$0f:9d88  08			php
$0f:9d89  0f 6c 86 01   ora $01866c
$0f:9d8d  10 00		 bpl $9d8f
$0f:9d8f  0f 00 8c 06   ora $068c00
$0f:9d93  01 10		 ora ($10,x)
$0f:9d95  00 00		 brk #$00
$0f:9d97  0f 8c 86 07   ora $07868c
$0f:9d9b  00 18		 brk #$18
$0f:9d9d  00 20		 brk #$20
$0f:9d9f  00 00		 brk #$00
$0f:9da1  00 10		 brk #$10
$0f:9da3  00 10		 brk #$10
$0f:9da5  00 08		 brk #$08
$0f:9da7  00 00		 brk #$00
$0f:9da9  00 17		 brk #$17
$0f:9dab  08			php
$0f:9dac  10 7e		 bpl $9e2c
$0f:9dae  06 00		 asl $00
$0f:9db0  17 00		 ora [$00],y
$0f:9db2  08			php
$0f:9db3  10 7e		 bpl $9e33
$0f:9db5  46 00		 lsr $00
$0f:9db7  08			php
$0f:9db8  0f 08 10 7f   ora $7f1008
$0f:9dbc  06 00		 asl $00
$0f:9dbe  0f 08 08 10   ora $100808
$0f:9dc2  7f 46 00 08   adc $080046,x
$0f:9dc6  0f 00 18 6f   ora $6f1800
$0f:9dca  06 00		 asl $00
$0f:9dcc  0f 08 00 18   ora $180008
$0f:9dd0  6f 46 01 00   adc $000146
$0f:9dd4  0f 10 00 8e   ora $8e0010
$0f:9dd8  06 01		 asl $01
$0f:9dda  0f 00 10 00   ora $001000
$0f:9dde  8e 46 ff	  stx $ff46
$0f:9de1  ff 0f 00 13   sbc $13000f,x
$0f:9de5  00 11		 brk #$11
$0f:9de7  00 10		 brk #$10
$0f:9de9  00 10		 brk #$10
$0f:9deb  00 07		 brk #$07
$0f:9ded  00 00		 brk #$00
$0f:9def  00 06		 brk #$06
$0f:9df1  05 17		 ora $17
$0f:9df3  66 06		 ror $06
$0f:9df5  00 03		 brk #$03
$0f:9df7  03 0a		 ora $0a,s
$0f:9df9  12 66		 ora ($66)
$0f:9dfb  06 00		 asl $00
$0f:9dfd  02 04		 cop #$04
$0f:9dff  12 0a		 ora ($0a)
$0f:9e01  6b			rtl
$0f:9e02  06 00		 asl $00
$0f:9e04  06 00		 asl $00
$0f:9e06  04 18		 tsb $18
$0f:9e08  66 46		 ror $46
$0f:9e0a  00 03		 brk #$03
$0f:9e0c  03 1c		 ora $1c,s
$0f:9e0e  00 6b		 brk #$6b
$0f:9e10  06 00		 asl $00
$0f:9e12  02 04		 cop #$04
$0f:9e14  02 1a		 cop #$1a
$0f:9e16  66 06		 ror $06
$0f:9e18  00 04		 brk #$04
$0f:9e1a  02 00		 cop #$00
$0f:9e1c  1c 66 46	  trb $4666
$0f:9e1f  ff ff 0f 00   sbc $000fff,x
$0f:9e23  13 00		 ora ($00,s),y
$0f:9e25  1a			inc a
$0f:9e26  00 10		 brk #$10
$0f:9e28  00 10		 brk #$10
$0f:9e2a  00 07		 brk #$07
$0f:9e2c  00 00		 brk #$00
$0f:9e2e  00 06		 brk #$06
$0f:9e30  06 1f		 asl $1f
$0f:9e32  66 06		 ror $06
$0f:9e34  00 03		 brk #$03
$0f:9e36  03 0d		 ora $0d,s
$0f:9e38  18			clc
$0f:9e39  66 06		 ror $06
$0f:9e3b  00 02		 brk #$02
$0f:9e3d  04 17		 tsb $17
$0f:9e3f  0e 6b 06	  asl $066b
$0f:9e42  00 06		 brk #$06
$0f:9e44  00 05		 brk #$05
$0f:9e46  20 66 46	  jsr $4666
$0f:9e49  00 03		 brk #$03
$0f:9e4b  03 25		 ora $25,s
$0f:9e4d  00 6b		 brk #$6b
$0f:9e4f  06 00		 asl $00
$0f:9e51  02 04		 cop #$04
$0f:9e53  02 23		 cop #$23
$0f:9e55  66 06		 ror $06
$0f:9e57  00 04		 brk #$04
$0f:9e59  02 00		 cop #$00
$0f:9e5b  25 66		 and $66
$0f:9e5d  46 fe		 lsr $fe
$0f:9e5f  ff 0f 00 13   sbc $13000f,x
$0f:9e63  00 09		 brk #$09
$0f:9e65  00 10		 brk #$10
$0f:9e67  00 10		 brk #$10
$0f:9e69  00 05		 brk #$05
$0f:9e6b  00 00		 brk #$00
$0f:9e6d  00 05		 brk #$05
$0f:9e6f  09 0b		 ora #$0b
$0f:9e71  66 06		 ror $06
$0f:9e73  00 02		 brk #$02
$0f:9e75  03 14		 ora $14,s
$0f:9e77  00 6b		 brk #$6b
$0f:9e79  06 00		 asl $00
$0f:9e7b  05 00		 ora $00
$0f:9e7d  07 0d		 ora [$0d]
$0f:9e7f  66 46		 ror $46
$0f:9e81  00 01		 brk #$01
$0f:9e83  04 02		 tsb $02
$0f:9e85  12 66		 ora ($66)
$0f:9e87  06 00		 asl $00
$0f:9e89  03 02		 ora $02,s
$0f:9e8b  00 14		 brk #$14
$0f:9e8d  66 46		 ror $46
$0f:9e8f  fe ff 0e	  inc $0eff,x
$0f:9e92  00 11		 brk #$11
$0f:9e94  00 05		 brk #$05
$0f:9e96  00 10		 brk #$10
$0f:9e98  00 10		 brk #$10
$0f:9e9a  00 03		 brk #$03
$0f:9e9c  00 00		 brk #$00
$0f:9e9e  00 04		 brk #$04
$0f:9ea0  0e 00 6b	  asl $6b00
$0f:9ea3  06 00		 asl $00
$0f:9ea5  04 00		 tsb $00
$0f:9ea7  09 05		 ora #$05
$0f:9ea9  6b			rtl
$0f:9eaa  06 00		 asl $00
$0f:9eac  02 02		 cop #$02
$0f:9eae  00 0e		 brk #$0e
$0f:9eb0  66 06		 ror $06
$0f:9eb2  fc ff 0c	  jsr ($0cff,x)
$0f:9eb5  00 10		 brk #$10
$0f:9eb7  00 f8		 brk #$f8
$0f:9eb9  ff 10 00 10   sbc $100010,x
$0f:9ebd  00 01		 brk #$01
$0f:9ebf  00 00		 brk #$00
$0f:9ec1  00 00		 brk #$00
$0f:9ec3  00 00		 brk #$00
$0f:9ec5  6b			rtl
$0f:9ec6  06 00		 asl $00
$0f:9ec8  00 24		 brk #$24
$0f:9eca  00 11		 brk #$11
$0f:9ecc  00 fd		 brk #$fd
$0f:9ece  ff 10 00 10   sbc $100010,x
$0f:9ed2  00 07		 brk #$07
$0f:9ed4  00 00		 brk #$00
$0f:9ed6  04 18		 tsb $18
$0f:9ed8  06 00		 asl $00
$0f:9eda  7c 06 00	  jmp ($0006,x)
$0f:9edd  07 15		 ora [$15]
$0f:9edf  00 06		 brk #$06
$0f:9ee1  7c 86 00	  jmp ($0086,x)
$0f:9ee4  00 1c		 brk #$1c
$0f:9ee6  04 02		 tsb $02
$0f:9ee8  7c 06 00	  jmp ($0006,x)
$0f:9eeb  01 1b		 ora ($1b,x)
$0f:9eed  02 04		 cop #$04
$0f:9eef  7c 86 00	  jmp ($0086,x)
$0f:9ef2  0b			phd
$0f:9ef3  11 03		 ora ($03),y
$0f:9ef5  03 7c		 ora $7c,s
$0f:9ef7  06 00		 asl $00
$0f:9ef9  12 0a		 ora ($0a)
$0f:9efb  05 01		 ora $01
$0f:9efd  6e 06 00	  ror $0006
$0f:9f00  1c 00 03	  trb $0300
$0f:9f03  03 6e		 ora $6e,s
$0f:9f05  06 00		 asl $00
$0f:9f07  00 28		 brk #$28
$0f:9f09  00 11		 brk #$11
$0f:9f0b  00 fd		 brk #$fd
$0f:9f0d  ff 10 00 10   sbc $100010,x
$0f:9f11  00 07		 brk #$07
$0f:9f13  00 00		 brk #$00
$0f:9f15  05 1b		 ora $1b
$0f:9f17  06 00		 asl $00
$0f:9f19  7c 06 00	  jmp ($0006,x)
$0f:9f1c  08			php
$0f:9f1d  18			clc
$0f:9f1e  00 06		 brk #$06
$0f:9f20  7c 86 00	  jmp ($0086,x)
$0f:9f23  00 20		 brk #$20
$0f:9f25  04 02		 tsb $02
$0f:9f27  7c 06 00	  jmp ($0006,x)
$0f:9f2a  01 1f		 ora ($1f,x)
$0f:9f2c  02 04		 cop #$04
$0f:9f2e  7c 86 00	  jmp ($0086,x)
$0f:9f31  0c 14 03	  tsb $0314
$0f:9f34  03 7c		 ora $7c,s
$0f:9f36  06 00		 asl $00
$0f:9f38  16 0a		 asl $0a,x
$0f:9f3a  05 01		 ora $01
$0f:9f3c  6e 06 00	  ror $0006
$0f:9f3f  20 00 03	  jsr $0300
$0f:9f42  03 6e		 ora $6e,s
$0f:9f44  06 00		 asl $00
$0f:9f46  00 1a		 brk #$1a
$0f:9f48  00 11		 brk #$11
$0f:9f4a  00 fd		 brk #$fd
$0f:9f4c  ff 10 00 10   sbc $100010,x
$0f:9f50  00 05		 brk #$05
$0f:9f52  00 00		 brk #$00
$0f:9f54  06 0c		 asl $0c
$0f:9f56  06 00		 asl $00
$0f:9f58  7c 06 00	  jmp ($0006,x)
$0f:9f5b  09 09		 ora #$09
$0f:9f5d  00 06		 brk #$06
$0f:9f5f  7c 86 00	  jmp ($0086,x)
$0f:9f62  00 12		 brk #$12
$0f:9f64  04 02		 tsb $02
$0f:9f66  7c 06 00	  jmp ($0006,x)
$0f:9f69  01 11		 ora ($11,x)
$0f:9f6b  02 04		 cop #$04
$0f:9f6d  7c 86 00	  jmp ($0086,x)
$0f:9f70  12 00		 ora ($00)
$0f:9f72  03 03		 ora $03,s
$0f:9f74  6e 06 00	  ror $0006
$0f:9f77  00 18		 brk #$18
$0f:9f79  00 10		 brk #$10
$0f:9f7b  00 fd		 brk #$fd
$0f:9f7d  ff 10 00 10   sbc $100010,x
$0f:9f81  00 03		 brk #$03
$0f:9f83  00 00		 brk #$00
$0f:9f85  00 10		 brk #$10
$0f:9f87  02 03		 cop #$03
$0f:9f89  7c 86 00	  jmp ($0086,x)
$0f:9f8c  09 07		 ora #$07
$0f:9f8e  05 00		 ora $00
$0f:9f90  6e 06 00	  ror $0006
$0f:9f93  10 00		 bpl $9f95
$0f:9f95  00 05		 brk #$05
$0f:9f97  6e 06 00	  ror $0006
$0f:9f9a  00 08		 brk #$08
$0f:9f9c  00 0d		 brk #$0d
$0f:9f9e  00 fb		 brk #$fb
$0f:9fa0  ff 10 00 10   sbc $100010,x
$0f:9fa4  00 01		 brk #$01
$0f:9fa6  00 00		 brk #$00
$0f:9fa8  00 00		 brk #$00
$0f:9faa  00 00		 brk #$00
$0f:9fac  6e 06 12	  ror $1206
$0f:9faf  00 33		 brk #$33
$0f:9fb1  00 33		 brk #$33
$0f:9fb3  00 14		 brk #$14
$0f:9fb5  00 20		 brk #$20
$0f:9fb7  00 20		 brk #$20
$0f:9fb9  00 10		 brk #$10
$0f:9fbb  00 00		 brk #$00
$0f:9fbd  1e 1f 00	  asl $001f,x
$0f:9fc0  3f 79 06 00   and $000679,x
$0f:9fc4  1f 1e 3f 00   ora $003f1e,x
$0f:9fc8  79 06 00	  adc $0006,y
$0f:9fcb  00 3d		 brk #$3d
$0f:9fcd  20 1f 79	  jsr $791f
$0f:9fd0  06 00		 asl $00
$0f:9fd2  3d 00 1f	  and $1f00,x
$0f:9fd5  20 79 06	  jsr $0679
$0f:9fd8  00 07		 brk #$07
$0f:9fda  36 08		 rol $08,x
$0f:9fdc  37 79		 and [$79],y
$0f:9fde  06 00		 asl $00
$0f:9fe0  36 07		 rol $07,x
$0f:9fe2  08			php
$0f:9fe3  37 79		 and [$79],y
$0f:9fe5  06 00		 asl $00
$0f:9fe7  07 36		 ora [$36]
$0f:9fe9  37 08		 and [$08],y
$0f:9feb  79 06 00	  adc $0006,y
$0f:9fee  36 07		 rol $07,x
$0f:9ff0  37 08		 and [$08],y
$0f:9ff2  79 06 00	  adc $0006,y
$0f:9ff5  12 2b		 ora ($2b)
$0f:9ff7  1a			inc a
$0f:9ff8  25 88		 and $88
$0f:9ffa  06 00		 asl $00
$0f:9ffc  12 2b		 ora ($2b)
$0f:9ffe  25 1a		 and $1a
$0f:a000  88			dey
$0f:a001  06 00		 asl $00
$0f:a003  19 24 2c	  ora $2c24,y
$0f:a006  13 88		 ora ($88,s),y
$0f:a008  06 00		 asl $00
$0f:a00a  24 19		 bit $19
$0f:a00c  2c 13 88	  bit $8813
$0f:a00f  06 00		 asl $00
$0f:a011  2b			pld
$0f:a012  12 25		 ora ($25)
$0f:a014  1a			inc a
$0f:a015  88			dey
$0f:a016  06 00		 asl $00
$0f:a018  2b			pld
$0f:a019  12 1a		 ora ($1a)
$0f:a01b  25 88		 and $88
$0f:a01d  06 00		 asl $00
$0f:a01f  24 19		 bit $19
$0f:a021  14 2b		 trb $2b
$0f:a023  88			dey
$0f:a024  06 00		 asl $00
$0f:a026  19 24 14	  ora $1424,y
$0f:a029  2b			pld
$0f:a02a  88			dey
$0f:a02b  06 0f		 asl $0f
$0f:a02d  00 30		 brk #$30
$0f:a02f  00 2f		 brk #$2f
$0f:a031  00 10		 brk #$10
$0f:a033  00 20		 brk #$20
$0f:a035  00 20		 brk #$20
$0f:a037  00 10		 brk #$10
$0f:a039  00 00		 brk #$00
$0f:a03b  07 30		 ora [$30]
$0f:a03d  07 30		 ora [$30]
$0f:a03f  79 06 00	  adc $0006,y
$0f:a042  30 07		 bmi $a04b
$0f:a044  07 30		 ora [$30]
$0f:a046  79 06 00	  adc $0006,y
$0f:a049  07 30		 ora [$30]
$0f:a04b  30 07		 bmi $a054
$0f:a04d  79 06 00	  adc $0006,y
$0f:a050  30 07		 bmi $a059
$0f:a052  30 07		 bmi $a05b
$0f:a054  79 06 00	  adc $0006,y
$0f:a057  16 21		 asl $21,x
$0f:a059  12 25		 ora ($25)
$0f:a05b  88			dey
$0f:a05c  06 00		 asl $00
$0f:a05e  17 20		 ora [$20],y
$0f:a060  24 13		 bit $13
$0f:a062  88			dey
$0f:a063  06 00		 asl $00
$0f:a065  1f 18 24 13   ora $132418,x
$0f:a069  88			dey
$0f:a06a  06 00		 asl $00
$0f:a06c  1e 19 12	  asl $1219,x
$0f:a06f  25 88		 and $88
$0f:a071  06 00		 asl $00
$0f:a073  24 13		 bit $13
$0f:a075  17 20		 ora [$20],y
$0f:a077  88			dey
$0f:a078  06 00		 asl $00
$0f:a07a  24 13		 bit $13
$0f:a07c  1f 18 88 06   ora $068818,x
$0f:a080  00 11		 brk #$11
$0f:a082  26 17		 rol $17
$0f:a084  20 88 06	  jsr $0688
$0f:a087  00 11		 brk #$11
$0f:a089  26 1f		 rol $1f
$0f:a08b  18			clc
$0f:a08c  88			dey
$0f:a08d  06 00		 asl $00
$0f:a08f  1b			tcs
$0f:a090  1c 00 37	  trb $3700
$0f:a093  7a			ply
$0f:a094  06 00		 asl $00
$0f:a096  1c 1b 37	  trb $371b
$0f:a099  00 7a		 brk #$7a
$0f:a09b  06 00		 asl $00
$0f:a09d  00 37		 brk #$37
$0f:a09f  1c 1b 7a	  trb $7a1b
$0f:a0a2  06 00		 asl $00
$0f:a0a4  37 00		 and [$00],y
$0f:a0a6  1b			tcs
$0f:a0a7  1c 7a 06	  trb $067a
$0f:a0aa  0b			phd
$0f:a0ab  00 2c		 brk #$2c
$0f:a0ad  00 2b		 brk #$2b
$0f:a0af  00 0c		 brk #$0c
$0f:a0b1  00 20		 brk #$20
$0f:a0b3  00 20		 brk #$20
$0f:a0b5  00 10		 brk #$10
$0f:a0b7  00 00		 brk #$00
$0f:a0b9  00 2f		 brk #$2f
$0f:a0bb  18			clc
$0f:a0bc  17 7a		 ora [$7a],y
$0f:a0be  06 00		 asl $00
$0f:a0c0  06 29		 asl $29
$0f:a0c2  06 29		 asl $29
$0f:a0c4  7a			ply
$0f:a0c5  06 00		 asl $00
$0f:a0c7  17 18		 ora [$18],y
$0f:a0c9  00 2f		 brk #$2f
$0f:a0cb  7a			ply
$0f:a0cc  06 00		 asl $00
$0f:a0ce  28			plp
$0f:a0cf  07 06		 ora [$06]
$0f:a0d1  29 7a		 and #$7a
$0f:a0d3  06 00		 asl $00
$0f:a0d5  2f 00 18 17   and $171800
$0f:a0d9  7a			ply
$0f:a0da  06 00		 asl $00
$0f:a0dc  28			plp
$0f:a0dd  07 28		 ora [$28]
$0f:a0df  07 7a		 ora [$7a]
$0f:a0e1  06 00		 asl $00
$0f:a0e3  18			clc
$0f:a0e4  17 2f		 ora [$2f],y
$0f:a0e6  00 7a		 brk #$7a
$0f:a0e8  06 00		 asl $00
$0f:a0ea  06 29		 asl $29
$0f:a0ec  28			plp
$0f:a0ed  07 7a		 ora [$7a]
$0f:a0ef  06 00		 asl $00
$0f:a0f1  10 1f		 bpl $a112
$0f:a0f3  1a			inc a
$0f:a0f4  15 88		 ora $88,x
$0f:a0f6  06 00		 asl $00
$0f:a0f8  14 1b		 trb $1b
$0f:a0fa  10 1f		 bpl $a11b
$0f:a0fc  88			dey
$0f:a0fd  06 00		 asl $00
$0f:a0ff  1a			inc a
$0f:a100  15 1e		 ora $1e,x
$0f:a102  11 88		 ora ($88),y
$0f:a104  06 00		 asl $00
$0f:a106  1e 11 1a	  asl $1a11,x
$0f:a109  15 88		 ora $88,x
$0f:a10b  06 00		 asl $00
$0f:a10d  1a			inc a
$0f:a10e  15 10		 ora $10,x
$0f:a110  1f 88 06 00   ora $000688,x
$0f:a114  10 1f		 bpl $a135
$0f:a116  14 1b		 trb $1b
$0f:a118  88			dey
$0f:a119  06 00		 asl $00
$0f:a11b  14 1b		 trb $1b
$0f:a11d  1e 11 88	  asl $8811,x
$0f:a120  06 00		 asl $00
$0f:a122  1e 11 14	  asl $1411,x
$0f:a125  1b			tcs
$0f:a126  88			dey
$0f:a127  06 06		 asl $06
$0f:a129  00 27		 brk #$27
$0f:a12b  00 26		 brk #$26
$0f:a12d  00 07		 brk #$07
$0f:a12f  00 20		 brk #$20
$0f:a131  00 20		 brk #$20
$0f:a133  00 0e		 brk #$0e
$0f:a135  00 00		 brk #$00
$0f:a137  04 21		 tsb $21
$0f:a139  21 04		 and ($04,x)
$0f:a13b  7a			ply
$0f:a13c  06 00		 asl $00
$0f:a13e  04 21		 tsb $21
$0f:a140  04 21		 tsb $21
$0f:a142  7a			ply
$0f:a143  06 00		 asl $00
$0f:a145  20 05 21	  jsr $2105
$0f:a148  04 7a		 tsb $7a
$0f:a14a  06 00		 asl $00
$0f:a14c  21 04		 and ($04,x)
$0f:a14e  04 21		 tsb $21
$0f:a150  7a			ply
$0f:a151  06 00		 asl $00
$0f:a153  0e 17 12	  asl $1217
$0f:a156  13 88		 ora ($88,s),y
$0f:a158  06 00		 asl $00
$0f:a15a  10 15		 bpl $a171
$0f:a15c  16 0f		 asl $0f,x
$0f:a15e  88			dey
$0f:a15f  06 00		 asl $00
$0f:a161  14 11		 trb $11
$0f:a163  16 0f		 asl $0f,x
$0f:a165  88			dey
$0f:a166  06 00		 asl $00
$0f:a168  14 11		 trb $11
$0f:a16a  0e 17 88	  asl $8817
$0f:a16d  06 00		 asl $00
$0f:a16f  10 15		 bpl $a186
$0f:a171  0e 17 88	  asl $8817
$0f:a174  06 00		 asl $00
$0f:a176  12 13		 ora ($13)
$0f:a178  00 25		 brk #$25
$0f:a17a  88			dey
$0f:a17b  06 00		 asl $00
$0f:a17d  00 25		 brk #$25
$0f:a17f  13 12		 ora ($12,s),y
$0f:a181  88			dey
$0f:a182  06 00		 asl $00
$0f:a184  25 00		 and $00
$0f:a186  13 12		 ora ($12,s),y
$0f:a188  88			dey
$0f:a189  06 00		 asl $00
$0f:a18b  12 13		 ora ($13)
$0f:a18d  25 00		 and $00
$0f:a18f  88			dey
$0f:a190  06 00		 asl $00
$0f:a192  17 0e		 ora [$0e],y
$0f:a194  12 13		 ora ($13)
$0f:a196  88			dey
$0f:a197  06 10		 asl $10
$0f:a199  00 30		 brk #$30
$0f:a19b  00 30		 brk #$30
$0f:a19d  00 10		 brk #$10
$0f:a19f  00 20		 brk #$20
$0f:a1a1  00 20		 brk #$20
$0f:a1a3  00 10		 brk #$10
$0f:a1a5  00 00		 brk #$00
$0f:a1a7  00 38		 brk #$38
$0f:a1a9  10 28		 bpl $a1d3
$0f:a1ab  79 06 00	  adc $0006,y
$0f:a1ae  10 28		 bpl $a1d8
$0f:a1b0  00 38		 brk #$38
$0f:a1b2  79 06 00	  adc $0006,y
$0f:a1b5  29 0f		 and #$0f
$0f:a1b7  00 38		 brk #$38
$0f:a1b9  79 06 00	  adc $0006,y
$0f:a1bc  38			sec
$0f:a1bd  00 10		 brk #$10
$0f:a1bf  28			plp
$0f:a1c0  79 06 00	  adc $0006,y
$0f:a1c3  38			sec
$0f:a1c4  00 29		 brk #$29
$0f:a1c6  0f 79 06 00   ora $000679
$0f:a1ca  29 0f		 and #$0f
$0f:a1cc  38			sec
$0f:a1cd  00 79		 brk #$79
$0f:a1cf  06 00		 asl $00
$0f:a1d1  10 28		 bpl $a1fb
$0f:a1d3  38			sec
$0f:a1d4  00 79		 brk #$79
$0f:a1d6  06 00		 asl $00
$0f:a1d8  00 38		 brk #$38
$0f:a1da  29 0f		 and #$0f
$0f:a1dc  79 06 00	  adc $0006,y
$0f:a1df  1c 1c 0f	  trb $0f1c
$0f:a1e2  29 88		 and #$88
$0f:a1e4  06 00		 asl $00
$0f:a1e6  13 25		 ora ($25,s),y
$0f:a1e8  12 26		 ora ($26)
$0f:a1ea  88			dey
$0f:a1eb  06 00		 asl $00
$0f:a1ed  0f 29 1c 1c   ora $1c1c29
$0f:a1f1  88			dey
$0f:a1f2  06 00		 asl $00
$0f:a1f4  13 25		 ora ($25,s),y
$0f:a1f6  26 12		 rol $12
$0f:a1f8  88			dey
$0f:a1f9  06 00		 asl $00
$0f:a1fb  1c 1c 29	  trb $291c
$0f:a1fe  0f 88 06 00   ora $000688
$0f:a202  26 12		 rol $12
$0f:a204  26 12		 rol $12
$0f:a206  88			dey
$0f:a207  06 00		 asl $00
$0f:a209  2a			rol a
$0f:a20a  0e 1c 1c	  asl $1c1c
$0f:a20d  88			dey
$0f:a20e  06 00		 asl $00
$0f:a210  26 12		 rol $12
$0f:a212  13 25		 ora ($25,s),y
$0f:a214  88			dey
$0f:a215  06 0e		 asl $0e
$0f:a217  00 2e		 brk #$2e
$0f:a219  00 2d		 brk #$2d
$0f:a21b  00 0d		 brk #$0d
$0f:a21d  00 20		 brk #$20
$0f:a21f  00 20		 brk #$20
$0f:a221  00 10		 brk #$10
$0f:a223  00 00		 brk #$00
$0f:a225  1a			inc a
$0f:a226  1a			inc a
$0f:a227  0f 23 88 06   ora $068823
$0f:a22b  00 13		 brk #$13
$0f:a22d  21 12		 and ($12,x)
$0f:a22f  20 88 06	  jsr $0688
$0f:a232  00 10		 brk #$10
$0f:a234  24 19		 bit $19
$0f:a236  19 88 06	  ora $0688,y
$0f:a239  00 1a		 brk #$1a
$0f:a23b  1a			inc a
$0f:a23c  23 0f		 and $0f,s
$0f:a23e  88			dey
$0f:a23f  06 00		 asl $00
$0f:a241  24 10		 bit $10
$0f:a243  19 19 88	  ora $8819,y
$0f:a246  06 00		 asl $00
$0f:a248  21 13		 and ($13,x)
$0f:a24a  12 20		 ora ($20)
$0f:a24c  88			dey
$0f:a24d  06 00		 asl $00
$0f:a24f  00 34		 brk #$34
$0f:a251  0e 24 79	  asl $7924
$0f:a254  06 00		 asl $00
$0f:a256  10 24		 bpl $a27c
$0f:a258  32 00		 and ($00)
$0f:a25a  79 06 00	  adc $0006,y
$0f:a25d  34 00		 bit $00,x
$0f:a25f  25 0d		 and $0d
$0f:a261  79 06 00	  adc $0006,y
$0f:a264  25 0f		 and $0f
$0f:a266  00 32		 brk #$32
$0f:a268  79 06 00	  adc $0006,y
$0f:a26b  10 24		 bpl $a291
$0f:a26d  00 32		 brk #$32
$0f:a26f  7a			ply
$0f:a270  06 00		 asl $00
$0f:a272  00 34		 brk #$34
$0f:a274  25 0d		 and $0d
$0f:a276  7a			ply
$0f:a277  06 00		 asl $00
$0f:a279  25 0f		 and $0f
$0f:a27b  32 00		 and ($00)
$0f:a27d  7a			ply
$0f:a27e  06 00		 asl $00
$0f:a280  34 00		 bit $00,x
$0f:a282  0e 24 7a	  asl $7a24
$0f:a285  06 00		 asl $00
$0f:a287  13 21		 ora ($21,s),y
$0f:a289  20 12 88	  jsr $8812
$0f:a28c  06 00		 asl $00
$0f:a28e  21 13		 and ($13,x)
$0f:a290  20 12 88	  jsr $8812
$0f:a293  06 09		 asl $09
$0f:a295  00 2a		 brk #$2a
$0f:a297  00 2a		 brk #$2a
$0f:a299  00 0a		 brk #$0a
$0f:a29b  00 20		 brk #$20
$0f:a29d  00 20		 brk #$20
$0f:a29f  00 10		 brk #$10
$0f:a2a1  00 00		 brk #$00
$0f:a2a3  00 2b		 brk #$2b
$0f:a2a5  0d 1f 7a	  ora $7a1f
$0f:a2a8  06 00		 asl $00
$0f:a2aa  00 2b		 brk #$2b
$0f:a2ac  20 0c 7a	  jsr $7a0c
$0f:a2af  06 00		 asl $00
$0f:a2b1  0d 1e 2c	  ora $2c1e
$0f:a2b4  00 7a		 brk #$7a
$0f:a2b6  06 00		 asl $00
$0f:a2b8  1e 0d 2c	  asl $2c0d,x
$0f:a2bb  00 7a		 brk #$7a
$0f:a2bd  06 00		 asl $00
$0f:a2bf  2a			rol a
$0f:a2c0  01 20		 ora ($20,x)
$0f:a2c2  0c 7a 06	  tsb $067a
$0f:a2c5  00 2b		 brk #$2b
$0f:a2c7  00 0d		 brk #$0d
$0f:a2c9  1f 7a 06 00   ora $00067a,x
$0f:a2cd  1e 0d 00	  asl $000d,x
$0f:a2d0  2c 7a 06	  bit $067a
$0f:a2d3  00 0d		 brk #$0d
$0f:a2d5  1e 00 2c	  asl $2c00,x
$0f:a2d8  7a			ply
$0f:a2d9  06 00		 asl $00
$0f:a2db  0e 1d 16	  asl $161d
$0f:a2de  16 88		 asl $88,x
$0f:a2e0  06 00		 asl $00
$0f:a2e2  15 16		 ora $16,x
$0f:a2e4  0f 1d 88 06   ora $06881d
$0f:a2e8  00 16		 brk #$16
$0f:a2ea  15 1d		 ora $1d,x
$0f:a2ec  0f 88 06 00   ora $000688
$0f:a2f0  1c 0f 16	  trb $160f
$0f:a2f3  16 88		 asl $88,x
$0f:a2f5  06 00		 asl $00
$0f:a2f7  10 1b		 bpl $a314
$0f:a2f9  11 1b		 ora ($1b),y
$0f:a2fb  88			dey
$0f:a2fc  06 00		 asl $00
$0f:a2fe  1a			inc a
$0f:a2ff  11 11		 ora ($11),y
$0f:a301  1b			tcs
$0f:a302  88			dey
$0f:a303  06 00		 asl $00
$0f:a305  1a			inc a
$0f:a306  11 1b		 ora ($1b),y
$0f:a308  11 88		 ora ($88),y
$0f:a30a  06 00		 asl $00
$0f:a30c  10 1b		 bpl $a329
$0f:a30e  1b			tcs
$0f:a30f  11 88		 ora ($88),y
$0f:a311  06 05		 asl $05
$0f:a313  00 25		 brk #$25
$0f:a315  00 25		 brk #$25
$0f:a317  00 06		 brk #$06
$0f:a319  00 20		 brk #$20
$0f:a31b  00 20		 brk #$20
$0f:a31d  00 0e		 brk #$0e
$0f:a31f  00 00		 brk #$00
$0f:a321  00 22		 brk #$22
$0f:a323  09 1a		 ora #$1a
$0f:a325  7a			ply
$0f:a326  06 00		 asl $00
$0f:a328  0a			asl a
$0f:a329  18			clc
$0f:a32a  23 00		 and $00,s
$0f:a32c  7a			ply
$0f:a32d  06 00		 asl $00
$0f:a32f  22 00 1a 09   jsl $091a00
$0f:a333  7a			ply
$0f:a334  06 00		 asl $00
$0f:a336  19 09 00	  ora $0009,y
$0f:a339  23 7a		 and $7a,s
$0f:a33b  06 00		 asl $00
$0f:a33d  0d 15 13	  ora $1315
$0f:a340  10 88		 bpl $a2ca
$0f:a342  06 00		 asl $00
$0f:a344  0d 15 0f	  ora $0f15
$0f:a347  14 88		 trb $88
$0f:a349  06 00		 asl $00
$0f:a34b  15 0d		 ora $0d,x
$0f:a34d  0f 14 88 06   ora $068814
$0f:a351  00 15		 brk #$15
$0f:a353  0d 13 10	  ora $1013
$0f:a356  88			dey
$0f:a357  06 00		 asl $00
$0f:a359  00 22		 brk #$22
$0f:a35b  19 0a 88	  ora $880a,y
$0f:a35e  06 00		 asl $00
$0f:a360  19 09 23	  ora $2309,y
$0f:a363  00 88		 brk #$88
$0f:a365  06 00		 asl $00
$0f:a367  22 00 0a 19   jsl $190a00
$0f:a36b  88			dey
$0f:a36c  06 00		 asl $00
$0f:a36e  0a			asl a
$0f:a36f  18			clc
$0f:a370  00 23		 brk #$23
$0f:a372  88			dey
$0f:a373  06 00		 asl $00
$0f:a375  11 11		 ora ($11),y
$0f:a377  0c 17 88	  tsb $8817
$0f:a37a  06 00		 asl $00
$0f:a37c  11 11		 ora ($11),y
$0f:a37e  16 0d		 asl $0d,x
$0f:a380  88			dey
$0f:a381  06 08		 asl $08
$0f:a383  00 13		 brk #$13
$0f:a385  00 14		 brk #$14
$0f:a387  00 05		 brk #$05
$0f:a389  00 10		 brk #$10
$0f:a38b  00 10		 brk #$10
$0f:a38d  00 0e		 brk #$0e
$0f:a38f  00 00		 brk #$00
$0f:a391  05 0e		 ora $0e
$0f:a393  11 00		 ora ($00),y
$0f:a395  7d 06 00	  adc $0006,x
$0f:a398  05 0e		 ora $0e
$0f:a39a  00 11		 brk #$11
$0f:a39c  7d 86 00	  adc $0086,x
$0f:a39f  0c 07 11	  tsb $1107
$0f:a3a2  00 9c		 brk #$9c
$0f:a3a4  06 00		 asl $00
$0f:a3a6  13 00		 ora ($00,s),y
$0f:a3a8  11 00		 ora ($00),y
$0f:a3aa  9d 06 00	  sta $0006,x
$0f:a3ad  13 00		 ora ($00,s),y
$0f:a3af  00 11		 brk #$11
$0f:a3b1  9d 86 00	  sta $0086,x
$0f:a3b4  0c 07 00	  tsb $0007
$0f:a3b7  11 9c		 ora ($9c),y
$0f:a3b9  86 00		 stx $00
$0f:a3bb  00 13		 brk #$13
$0f:a3bd  0c 05 6c	  tsb $6c05
$0f:a3c0  06 00		 asl $00
$0f:a3c2  00 13		 brk #$13
$0f:a3c4  05 0c		 ora $0c
$0f:a3c6  6c 86 00	  jmp ($0086)
$0f:a3c9  07 0c		 ora [$0c]
$0f:a3cb  0c 05 6d	  tsb $6d05
$0f:a3ce  06 00		 asl $00
$0f:a3d0  07 0c		 ora [$0c]
$0f:a3d2  05 0c		 ora $0c
$0f:a3d4  6d 86 00	  adc $0086
$0f:a3d7  13 00		 ora ($00,s),y
$0f:a3d9  0a			asl a
$0f:a3da  07 8d		 ora [$8d]
$0f:a3dc  06 00		 asl $00
$0f:a3de  13 00		 ora ($00,s),y
$0f:a3e0  07 0a		 ora [$0a]
$0f:a3e2  8d 86 00	  sta $0086
$0f:a3e5  0d 06 0b	  ora $0b06
$0f:a3e8  06 8c		 asl $8c
$0f:a3ea  06 00		 asl $00
$0f:a3ec  0d 06 06	  ora $0606
$0f:a3ef  0b			phd
$0f:a3f0  8c 86 04	  sty $0486
$0f:a3f3  00 15		 brk #$15
$0f:a3f5  00 1e		 brk #$1e
$0f:a3f7  00 fe		 brk #$fe
$0f:a3f9  ff 10 00 10   sbc $100010,x
$0f:a3fd  00 0e		 brk #$0e
$0f:a3ff  00 00		 brk #$00
$0f:a401  00 11		 brk #$11
$0f:a403  05 0f		 ora $0f
$0f:a405  7e 06 00	  ror $0006,x
$0f:a408  11 00		 ora ($00),y
$0f:a40a  05 0f		 ora $0f
$0f:a40c  7e 46 00	  ror $0046,x
$0f:a40f  00 11		 brk #$11
$0f:a411  0c 08 8e	  tsb $8e08
$0f:a414  06 00		 asl $00
$0f:a416  00 11		 brk #$11
$0f:a418  13 01		 ora ($01,s),y
$0f:a41a  9e 06 00	  stz $0006,x
$0f:a41d  11 00		 ora ($00),y
$0f:a41f  14 00		 trb $00
$0f:a421  9e 46 00	  stz $0046,x
$0f:a424  11 00		 ora ($00),y
$0f:a426  0d 07 8e	  ora $8e07
$0f:a429  46 00		 lsr $00
$0f:a42b  05 0c		 ora $0c
$0f:a42d  00 14		 brk #$14
$0f:a42f  6f 06 00 0c   adc $0c0006
$0f:a433  05 00		 ora $00
$0f:a435  14 6f		 trb $6f
$0f:a437  46 00		 lsr $00
$0f:a439  07 0a		 ora [$0a]
$0f:a43b  12 02		 ora ($02)
$0f:a43d  9f 06 00 0a   sta $0a0006,x
$0f:a441  07 12		 ora [$12]
$0f:a443  02 9f		 cop #$9f
$0f:a445  46 00		 lsr $00
$0f:a447  05 0c		 ora $0c
$0f:a449  07 0d		 ora [$0d]
$0f:a44b  7f 06 00 0c   adc $0c0006,x
$0f:a44f  05 07		 ora $07
$0f:a451  0d 7f 46	  ora $467f
$0f:a454  00 06		 brk #$06
$0f:a456  0b			phd
$0f:a457  0c 08 8f	  tsb $8f08
$0f:a45a  06 00		 asl $00
$0f:a45c  0b			phd
$0f:a45d  06 0c		 asl $0c
$0f:a45f  08			php
$0f:a460  8f 46 6e 14   sta $146e46
$0f:a464  b4 4e		 ldy $4e,x
$0f:a466  2e 53 8b	  rol $8b53
$0f:a469  e4 e3		 cpx $e3
$0f:a46b  0d 38 d4	  ora $d438
$0f:a46e  4e 39 53	  lsr $5339
$0f:a471  8f 64 e2 2d   sta $2de264
$0f:a475  39 9c 4e	  and $4e9c,y
$0f:a478  6c 53 9b	  jmp ($9b53)
$0f:a47b  e4 e7		 cpx $e7
$0f:a47d  2d 39 dc	  and $dc39
$0f:a480  4e 7a 53	  lsr $537a
$0f:a483  9f 64 e6 0d   sta $0de664,x
$0f:a487  3a			dec a
$0f:a488  90 4e		 bcc $a4d8
$0f:a48a  82 01 84	  brl $288e
$0f:a48d  9d 65 a7	  sta $a765,x
$0f:a490  5a			phy
$0f:a491  89 d6		 bit #$d6
$0f:a493  ea			nop
$0f:a494  75 cc		 adc $cc,x
$0f:a496  9d 77 a7	  sta $a777,x
$0f:a499  5f 09 d4 2a   eor $2ad409,x
$0f:a49d  77 24		 adc [$24],y
$0f:a49f  9d cf a7	  sta $a7cf,x
$0f:a4a2  75 89		 adc $89,x
$0f:a4a4  dd ca 77	  cmp $77ca,x
$0f:a4a7  8c 9d eb	  sty $eb9d
$0f:a4aa  a7 7b		 lda [$7b]
$0f:a4ac  89 df		 bit #$df
$0f:a4ae  28			plp
$0f:a4af  44 13 cb	  mvp $cb,$13
$0f:a4b2  f4 f3 b1	  pea $b1f3
$0f:a4b5  3c 99 4f	  bit $4f99,x
$0f:a4b8  69 93		 adc #$93
$0f:a4ba  da			phx
$0f:a4bb  b4 f7		 ldy $f7,x
$0f:a4bd  91 3d		 sta ($3d),y
$0f:a4bf  e9 4f		 sbc #$4f
$0f:a4c1  7f 93 d8 74   adc $74d893,x
$0f:a4c5  fa			plx
$0f:a4c6  41 3e		 eor ($3e,x)
$0f:a4c8  99 4f a8	  sta $a84f,y
$0f:a4cb  93 ea		 sta ($ea,s),y
$0f:a4cd  b4 fa		 ldy $fa,x
$0f:a4cf  c1 3e		 cmp ($3e,x)
$0f:a4d1  b5 4f		 lda $4f,x
$0f:a4d3  ae 93 eb	  ldx $eb93
$0f:a4d6  f4 fa 0f	  pea $0ffa
$0f:a4d9  00 2c		 brk #$2c
$0f:a4db  16 62		 asl $62,x
$0f:a4dd  7d ff ff	  adc $ffff,x
$0f:a4e0  95 d2		 sta $d2,x
$0f:a4e2  ff 3f 2f b5   sbc $b52f3f,x
$0f:a4e6  2a			rol a
$0f:a4e7  80 5f		 bra $a548
$0f:a4e9  08			php
$0f:a4ea  19 60 60	  ora $6060,y
$0f:a4ed  25 c1		 and $c1
$0f:a4ef  3a			dec a
$0f:a4f0  a7 78		 lda [$78]
$0f:a4f2  f8			sed
$0f:a4f3  a7 b6		 lda [$b6]
$0f:a4f5  84 1a		 sty $1a
$0f:a4f7  04 ea		 tsb $ea
$0f:a4f9  45 f0		 eor $f0
$0f:a4fb  33 82		 and ($82,s),y
$0f:a4fd  5d 36 e9	  eor $e936,x
$0f:a500  e5 4e		 sbc $4e
$0f:a502  b7 69		 lda [$69],y
$0f:a504  28			plp
$0f:a505  65 f0		 adc $f0
$0f:a507  37 92		 and [$92],y
$0f:a509  e5 2e		 sbc $2e
$0f:a50b  8c 05 5f	  sty $5f05
$0f:a50e  b6 78		 ldx $78,y
$0f:a510  e4 30		 cpx $30
$0f:a512  f2 c2		 sbc ($c2)
$0f:a514  95 ca		 sta $ca,x
$0f:a516  05 00		 ora $00
$0f:a518  95 cf		 sta $cf,x
$0f:a51a  cb			wai
$0f:a51b  05 10		 ora $10
$0f:a51d  80 55		 bra $a574
$0f:a51f  67 f0		 adc [$f0]
$0f:a521  52 c1		 eor ($c1)
$0f:a523  bc 40 b0	  ldy $b040,x
$0f:a526  5f 0f f9 74   eor $74f90f,x
$0f:a52a  9b			txy
$0f:a52b  68			pla
$0f:a52c  ad 02 b9	  lda $b902
$0f:a52f  7f bf ff 69   adc $69ffbf,x
$0f:a533  fc 18 b0	  jsr ($b018,x)
$0f:a536  72 0a		 adc ($0a)
$0f:a538  01 60		 ora ($60,x)
$0f:a53a  cc c6 db	  cpy $dbc6
$0f:a53d  46 78		 lsr $78
$0f:a53f  15 c0		 ora $c0,x
$0f:a541  22 05 80 e4   jsl $e48005
$0f:a545  07 05		 ora [$05]
$0f:a547  fe 05 80	  inc $8005,x
$0f:a54a  f9 50 1e	  sbc $1e50,y
$0f:a54d  68			pla
$0f:a54e  3d 07 69	  and $6907,x
$0f:a551  1b			tcs
$0f:a552  e0 0c		 cpx #$0c
$0f:a554  11 ca		 ora ($ca),y
$0f:a556  09 45		 ora #$45
$0f:a558  29 a5		 and #$a5
$0f:a55a  85 b1		 sta $b1
$0f:a55c  50 49		 bvc $a5a7
$0f:a55e  ec 5f 69	  cpx $695f
$0f:a561  c1 61		 cmp ($61,x)
$0f:a563  4a			lsr a
$0f:a564  e0 69		 cpx #$69
$0f:a566  07 19		 ora [$19]
$0f:a568  01 82		 ora ($82,x)
$0f:a56a  ef 41 42 a6   sbc $a64241
$0f:a56e  85 18		 sta $18
$0f:a570  bc b4 62	  ldy $62b4,x
$0f:a573  fd 4d 02	  sbc $024d,x
$0f:a576  f3 28		 sbc ($28,s),y
$0f:a578  0c 02 3f	  tsb $3f02
$0f:a57b  42 82		 wdm #$82
$0f:a57d  2a			rol a
$0f:a57e  0e a0 ae	  asl $aea0
$0f:a581  5c 45 09 4a   jml $4a0945
$0f:a585  8d 90 dc	  sta $dc90
$0f:a588  ab			plb
$0f:a589  8c 06 1f	  sty $1f06
$0f:a58c  16 42		 asl $42,x
$0f:a58e  ca			dex
$0f:a58f  68			pla
$0f:a590  6a			ror a
$0f:a591  52 01		 eor ($01)
$0f:a593  80 18		 bra $a5ad
$0f:a595  2c 34 35	  bit $3534
$0f:a598  78			sei
$0f:a599  37 4a		 and [$4a],y
$0f:a59b  fa			plx
$0f:a59c  e2 5c		 sep #$5c
$0f:a59e  cb			wai
$0f:a59f  60			rts
$0f:a5a0  c6 21		 dec $21
$0f:a5a2  02 80		 cop #$80
$0f:a5a4  6d 5c 42	  adc $425c
$0f:a5a7  f7 2f		 sbc [$2f],y
$0f:a5a9  6b			rtl
$0f:a5aa  f1 66		 sbc ($66),y
$0f:a5ac  74 47		 stz $47,x
$0f:a5ae  9a			txs
$0f:a5af  0c 41 f6	  tsb $f641
$0f:a5b2  83 10		 sta $10,s
$0f:a5b4  01 a0		 ora ($a0,x)
$0f:a5b6  64 01		 stz $01
$0f:a5b8  64 bb		 stz $bb
$0f:a5ba  04 31		 tsb $31
$0f:a5bc  5e 68 82	  lsr $8268,x
$0f:a5bf  94 7d		 sty $7d,x
$0f:a5c1  80 a7		 bra $a56a
$0f:a5c3  00 60		 brk #$60
$0f:a5c5  29 4d		 and #$4d
$0f:a5c7  c5 11		 cmp $11
$0f:a5c9  0c 60 21	  tsb $2160
$0f:a5cc  28			plp
$0f:a5cd  a0 2c		 ldy #$2c
$0f:a5cf  05 29		 ora $29
$0f:a5d1  05 a2		 ora $a2
$0f:a5d3  8a			txa
$0f:a5d4  50 16		 bvc $a5ec
$0f:a5d6  50 34		 bvc $a60c
$0f:a5d8  30 82		 bmi $a55c
$0f:a5da  42 a5		 wdm #$a5
$0f:a5dc  45 39		 eor $39
$0f:a5de  a5 9e		 lda $9e
$0f:a5e0  8a			txa
$0f:a5e1  71 40		 adc ($40),y
$0f:a5e3  c8			iny
$0f:a5e4  1e 50 32	  asl $3250,x
$0f:a5e7  08			php
$0f:a5e8  14 0c		 trb $0c
$0f:a5ea  81 68		 sta ($68,x)
$0f:a5ec  0f 24 99 24   ora $249924
$0f:a5f0  0b			phd
$0f:a5f1  02 42		 cop #$42
$0f:a5f3  f8			sed
$0f:a5f4  7a			ply
$0f:a5f5  5c fa 09 d5   jml $d509fa
$0f:a5f9  e8			inx
$0f:a5fa  19 05 ba	  ora $ba05,y
$0f:a5fd  26 49		 rol $49
$0f:a5ff  5e 49 92	  lsr $9249,x
$0f:a602  5b			tcd
$0f:a603  90 24		 bcc $a629
$0f:a605  0e a5 c2	  asl $c2a5
$0f:a608  a2 b7		 ldx #$b7
$0f:a60a  d2 2d		 cmp ($2d)
$0f:a60c  46 20		 lsr $20
$0f:a60e  90 24		 bcc $a634
$0f:a610  2d 54 66	  and $6654
$0f:a613  ea			nop
$0f:a614  06 41		 asl $41
$0f:a616  ca			dex
$0f:a617  81 90		 sta ($90,x)
$0f:a619  76 a3		 ror $a3,x
$0f:a61b  f4 1e a8	  pea $a81e
$0f:a61e  d7 27		 cmp [$27],y
$0f:a620  29 35		 and #$35
$0f:a622  c9 da		 cmp #$da
$0f:a624  4d 72 7a	  eor $7a72
$0f:a627  b3 ac		 lda ($ac,s),y
$0f:a629  37 d4		 and [$d4],y
$0f:a62b  66 fa		 ror $fa
$0f:a62d  44 a8 ee	  mvp $ee,$a8
$0f:a630  f4 ba 51	  pea $51ba
$0f:a633  de ec 33	  dec $33ec,x
$0f:a636  47 e8		 eor [$e8]
$0f:a638  0e d1 fa	  asl $fad1
$0f:a63b  04 34		 tsb $34
$0f:a63d  6b			rtl
$0f:a63e  90 cc		 bcc $a60c
$0f:a640  9a			txs
$0f:a641  e4 3b		 cpx $3b
$0f:a643  26 b9		 rol $b9
$0f:a645  10 c9		 bpl $a610
$0f:a647  62 4f a0	  per $4699
$0f:a64a  eb			xba
$0f:a64b  51 cf		 eor ($cf),y
$0f:a64d  69 2a		 adc #$2a
$0f:a64f  a4 1e		 ldy $1e
$0f:a651  d3 18		 cmp ($18,s),y
$0f:a653  8a			txa
$0f:a654  5f 75 20 f2   eor $f22075,x
$0f:a658  10 f3		 bpl $a64d
$0f:a65a  e1 d4		 sbc ($d4,x)
$0f:a65c  29 27		 and #$27
$0f:a65e  90 83		 bcc $a5e3
$0f:a660  9f 0e 8b 4a   sta $4a8b0e,x
$0f:a664  6f 93 e8 31   adc $31e893
$0f:a668  74 a3		 stz $a3,x
$0f:a66a  c8			iny
$0f:a66b  1f 0b f9 ff   ora $fff90b,x
$0f:a66f  ec 52 8f	  cpx $8f52
$0f:a672  85 fd		 sta $fd
$0f:a674  5f 2b f4 17   eor $17f42b,x
$0f:a678  e0 57		 cpx #$57
$0f:a67a  23 c8		 and $c8,s
$0f:a67c  33 d1		 and ($d1,s),y
$0f:a67e  f4 0c f4	  pea $f40c
$0f:a681  2b			pld
$0f:a682  83 3d		 sta $3d,s
$0f:a684  07 20		 ora [$20]
$0f:a686  cf 44 18 2f   cmp $2f1844
$0f:a68a  d2 08		 cmp ($08)
$0f:a68c  f6 58		 inc $58,x
$0f:a68e  2b			pld
$0f:a68f  d9 60 cd	  cmp $cd60,y
$0f:a692  e1 5b		 sbc ($5b,x)
$0f:a694  a7 e9		 lda [$e9]
$0f:a696  7c bf b5	  jmp ($b5bf,x)
$0f:a699  f2 af		 sbc ($af)
$0f:a69b  48			pha
$0f:a69c  ae 4c 52	  ldx $524c
$0f:a69f  2b			pld
$0f:a6a0  a3 3f		 lda $3f,s
$0f:a6a2  dc 0e 7c	  jml [$7c0e]
$0f:a6a5  27 69		 and [$69]
$0f:a6a7  1f 09 eb 4b   ora $4beb09,x
$0f:a6ab  72 15		 adc ($15)
$0f:a6ad  80 7d		 bra $a72c
$0f:a6af  05 60		 ora $60
$0f:a6b1  bd 41 58	  lda $5841,x
$0f:a6b4  0b			phd
$0f:a6b5  d0 56		 bne $a70d
$0f:a6b7  03 74		 ora $74,s
$0f:a6b9  15 80		 ora $80,x
$0f:a6bb  fd 05 64	  sbc $6405,x
$0f:a6be  83 47		 sta $47,s
$0f:a6c0  2a			rol a
$0f:a6c1  0a			asl a
$0f:a6c2  c0 ae		 cpy #$ae
$0f:a6c4  82 b0 7a	  brl $2177
$0f:a6c7  a0 ac		 ldy #$ac
$0f:a6c9  1f a8 2b 00   ora $002ba8,x
$0f:a6cd  29 04		 and #$04
$0f:a6cf  48			pha
$0f:a6d0  22 07 14 08   jsl $081407
$0f:a6d4  81 e5		 sta ($e5,x)
$0f:a6d6  02 20		 cop #$20
$0f:a6d8  2f 40 88 0d   and $0d8840
$0f:a6dc  d0 22		 bne $a700
$0f:a6de  03 f4		 ora $f4,s
$0f:a6e0  08			php
$0f:a6e1  93 75		 sta ($75,s),y
$0f:a6e3  14 28		 trb $28
$0f:a6e5  c5 05		 cmp $05
$0f:a6e7  4a			lsr a
$0f:a6e8  31 40		 and ($40),y
$0f:a6ea  be 8c 50	  ldx $508c,y
$0f:a6ed  5c a3 14 18   jml $1814a3
$0f:a6f1  28			plp
$0f:a6f2  43 4c		 eor $4c,s
$0f:a6f4  5d 28 be	  eor $be28,x
$0f:a6f7  04 52		 tsb $52
$0f:a6f9  a2 d2		 ldx #$d2
$0f:a6fb  95 20		 sta $20,x
$0f:a6fd  23 46		 and $46,s
$0f:a6ff  28			plp
$0f:a700  5f c4 47 17   eor $1747c4,x
$0f:a704  a5 b1		 lda $b1
$0f:a706  42 1e		 wdm #$1e
$0f:a708  5c 3a 45 2e   jml $2e453a
$0f:a70c  0e 80 16	  asl $1680
$0f:a70f  28			plp
$0f:a710  12 c9		 ora ($c9)
$0f:a712  c6 0e		 dec $0e
$0f:a714  30 25		 bmi $a73b
$0f:a716  93 64		 sta ($64,s),y
$0f:a718  89 64		 bit #$64
$0f:a71a  7f 22 59 2a   adc $2a5922,x
$0f:a71e  40			rti
$0f:a71f  b2 80		 lda ($80)
$0f:a721  b0 28		 bcs $a74b
$0f:a723  a0 2c		 ldy #$2c
$0f:a725  12 e0		 ora ($e0)
$0f:a727  6b			rtl
$0f:a728  45 48		 eor $48
$0f:a72a  18			clc
$0f:a72b  d0 92		 bne $a6bf
$0f:a72d  80 92		 bra $a6c1
$0f:a72f  29 a2		 and #$a2
$0f:a731  25 1b		 and $1b
$0f:a733  60			rts
$0f:a734  81 22		 sta ($22,x)
$0f:a736  29 18		 and #$18
$0f:a738  49 e2		 eor #$e2
$0f:a73a  42 b2		 wdm #$b2
$0f:a73c  b9 10 84	  lda $8410,y
$0f:a73f  62 9c 62	  per $09de
$0f:a742  60			rts
$0f:a743  8a			txa
$0f:a744  ca			dex
$0f:a745  a1 49		 lda ($49,x)
$0f:a747  18			clc
$0f:a748  a6 75		 ldx $75
$0f:a74a  a0 ac		 ldy #$ac
$0f:a74c  f6 f8		 inc $f8,x
$0f:a74e  d2 43		 cmp ($43)
$0f:a750  ed 44 a6	  sbc $a644
$0f:a753  08			php
$0f:a754  52 b3		 eor ($b3)
$0f:a756  4c 0f a1	  jmp $a10f
$0f:a759  c4 1e		 cpy $1e
$0f:a75b  28			plp
$0f:a75c  71 07		 adc ($07),y
$0f:a75e  ca			dex
$0f:a75f  1c 41 de	  trb $de41
$0f:a762  81 12		 sta ($12,x)
$0f:a764  05 b2		 ora $b2
$0f:a766  24 02		 bit $02
$0f:a768  a8			tay
$0f:a769  89 00		 bit #$00
$0f:a76b  5b			tcd
$0f:a76c  00 50		 brk #$50
$0f:a76e  ae 4f 92	  ldx $924f
$0f:a771  64 a5		 stz $a5
$0f:a773  4a			lsr a
$0f:a774  8a			txa
$0f:a775  43 6b		 eor $6b,s
$0f:a777  e1 31		 sbc ($31,x)
$0f:a779  f8			sed
$0f:a77a  44 c7 df	  mvp $df,$c7
$0f:a77d  51 8a		 eor ($8a),y
$0f:a77f  e1 05		 sbc ($05,x)
$0f:a781  23 1e		 and $1e,s
$0f:a783  d6 87		 dec $87,x
$0f:a785  04 23		 tsb $23
$0f:a787  1f b4 e8 b3   ora $b3e8b4,x
$0f:a78b  3a			dec a
$0f:a78c  21 5c		 and ($5c,x)
$0f:a78e  0a			asl a
$0f:a78f  e1 10		 sbc ($10,x)
$0f:a791  80 46		 bra $a7d9
$0f:a793  17 42		 ora [$42],y
$0f:a795  89 04		 bit #$04
$0f:a797  48			pha
$0f:a798  42 17		 wdm #$17
$0f:a79a  41 01		 eor ($01,x)
$0f:a79c  83 42		 sta $42,s
$0f:a79e  a0 d0		 ldy #$d0
$0f:a7a0  81 28		 sta ($28,x)
$0f:a7a2  40			rti
$0f:a7a3  a0 a9		 ldy #$a9
$0f:a7a5  80 84		 bra $a72b
$0f:a7a7  89 40		 bit #$40
$0f:a7a9  9e 31 07	  stz $0731,x
$0f:a7ac  99 13 c1	  sta $c113,y
$0f:a7af  4e 14 05	  lsr $0514
$0f:a7b2  50 c2		 bvc $a776
$0f:a7b4  21 11		 and ($11,x)
$0f:a7b6  15 80		 ora $80,x
$0f:a7b8  13 c1		 ora ($c1,s),y
$0f:a7ba  68			pla
$0f:a7bb  2a			rol a
$0f:a7bc  92 44		 sta ($44)
$0f:a7be  84 85		 sty $85
$0f:a7c0  6e 4c 21	  ror $214c
$0f:a7c3  46 1a		 lsr $1a
$0f:a7c5  2d 8e a3	  and $a38e
$0f:a7c8  03 82		 ora $82,s
$0f:a7ca  c3 60		 cmp $60,s
$0f:a7cc  69 a1		 adc #$a1
$0f:a7ce  82 41 1b	  brl $c312
$0f:a7d1  c0 a1		 cpy #$a1
$0f:a7d3  00 29		 brk #$29
$0f:a7d5  26 84		 rol $84
$0f:a7d7  0a			asl a
$0f:a7d8  29 30		 and #$30
$0f:a7da  89 40		 bit #$40
$0f:a7dc  0a			asl a
$0f:a7dd  e0 bd		 cpx #$bd
$0f:a7df  04 5b		 tsb $5b
$0f:a7e1  40			rti
$0f:a7e2  dd 44 b4	  cmp $b444,x
$0f:a7e5  08			php
$0f:a7e6  53 a1		 eor ($a1,s),y
$0f:a7e8  68			pla
$0f:a7e9  0f 04 58 0a   ora $0a5804
$0f:a7ed  24 24		 bit $24
$0f:a7ef  09 c0		 ora #$c0
$0f:a7f1  6a			ror a
$0f:a7f2  2a			rol a
$0f:a7f3  a0 61		 ldy #$61
$0f:a7f5  50 81		 bvc $a778
$0f:a7f7  31 bd		 and ($bd),y
$0f:a7f9  42 28		 wdm #$28
$0f:a7fb  ea			nop
$0f:a7fc  28			plp
$0f:a7fd  04 6a		 tsb $6a
$0f:a7ff  16 a2		 asl $a2,x
$0f:a801  05 d0		 ora $d0
$0f:a803  c4 a3		 cpy $a3
$0f:a805  63 c1		 adc $c1,s
$0f:a807  44 84 9a	  mvp $9a,$84
$0f:a80a  01 fc		 ora ($fc,x)
$0f:a80c  44 08 78	  mvp $78,$08
$0f:a80f  0e a3 02	  asl $02a3
$0f:a812  83 46		 sta $46,s
$0f:a814  a0 10		 ldy #$10
$0f:a816  bc 11 48	  ldy $4811,x
$0f:a819  62 50 88	  per $306c
$0f:a81c  de 09 50	  dec $5009,x
$0f:a81f  51 27		 eor ($27),y
$0f:a821  72 42		 adc ($42)
$0f:a823  9e a0 80	  stz $80a0,x
$0f:a826  08			php
$0f:a827  7a			ply
$0f:a828  29 e0		 and #$e0
$0f:a82a  ca			dex
$0f:a82b  94 54		 sty $54,x
$0f:a82d  99 d4 56	  sta $56d4,y
$0f:a830  08			php
$0f:a831  80 15		 bra $a848
$0f:a833  c9 44		 cmp #$44
$0f:a835  16 04		 asl $04,x
$0f:a837  1c 26 31	  trb $3126
$0f:a83a  c8			iny
$0f:a83b  03 26		 ora $26,s
$0f:a83d  fb			xce
$0f:a83e  87 49		 sta [$49]
$0f:a840  cc 1d e8	  cpy $e81d
$0f:a843  89 12		 bit #$12
$0f:a845  98			tya
$0f:a846  1d 42 30	  ora $3042,x
$0f:a849  0b			phd
$0f:a84a  13 84		 ora ($84,s),y
$0f:a84c  19 4d 6e	  ora $6e4d,y
$0f:a84f  21 24		 and ($24,x)
$0f:a851  a0 06		 ldy #$06
$0f:a853  4c aa 1f	  jmp $1faa
$0f:a856  e2 58		 sep #$58
$0f:a858  89 09		 bit #$09
$0f:a85a  7a			ply
$0f:a85b  30 a8		 bmi $a805
$0f:a85d  34 2f		 bit $2f,x
$0f:a85f  84 bd		 sty $bd
$0f:a861  18			clc
$0f:a862  14 3a		 trb $3a
$0f:a864  37 c2		 and [$c2],y
$0f:a866  5a			phy
$0f:a867  1c c9 74	  trb $74c9
$0f:a86a  94 23		 sty $23,x
$0f:a86c  99 c9 1d	  sta $1dc9,y
$0f:a86f  46 4e		 lsr $4e
$0f:a871  21 78		 and ($78,x)
$0f:a873  c2 97		 rep #$97
$0f:a875  08			php
$0f:a876  6c 07 20	  jmp ($2007)
$0f:a879  c1 8c		 cmp ($8c,x)
$0f:a87b  a1 1a		 lda ($1a,x)
$0f:a87d  85 83		 sta $83
$0f:a87f  40			rti
$0f:a880  58			cli
$0f:a881  10 88		 bpl $a80b
$0f:a883  94 6e		 sty $6e,x
$0f:a885  84 b2		 sty $b2
$0f:a887  05 44		 ora $44
$0f:a889  3c 46 01	  bit $0146,x
$0f:a88c  0b			phd
$0f:a88d  4a			lsr a
$0f:a88e  03 1c		 ora $1c,s
$0f:a890  12 61		 ora ($61)
$0f:a892  03 4a		 ora $4a,s
$0f:a894  04 65		 tsb $65
$0f:a896  90 0b		 bcc $a8a3
$0f:a898  20 49 84	  jsr $8449
$0f:a89b  d0 38		 bne $a8d5
$0f:a89d  0b			phd
$0f:a89e  20 5f 05	  jsr $055f
$0f:a8a1  12 01		 ora ($01)
$0f:a8a3  05 1d		 ora $1d
$0f:a8a5  6c 34 94	  jmp ($9434)
$0f:a8a8  90 52		 bcc $a8fc
$0f:a8aa  89 98		 bit #$98
$0f:a8ac  c1 26		 cmp ($26,x)
$0f:a8ae  13 60		 ora ($60,s),y
$0f:a8b0  e0 18 c1	  cpx #$c118
$0f:a8b3  7c 14 66	  jmp ($6614,x)
$0f:a8b6  a0 8e f2	  ldy #$f28e
$0f:a8b9  15 0b		 ora $0b,x
$0f:a8bb  82 93 0a	  brl $b351
$0f:a8be  04 9e		 tsb $9e
$0f:a8c0  02 98		 cop #$98
$0f:a8c2  b5 40		 lda $40,x
$0f:a8c4  f0 13		 beq $a8d9
$0f:a8c6  80 e0		 bra $a8a8
$0f:a8c8  13 46		 ora ($46,s),y
$0f:a8ca  01 48		 ora ($48,x)
$0f:a8cc  6a			ror a
$0f:a8cd  0c 64 79	  tsb $7964
$0f:a8d0  51 31		 eor ($31),y
$0f:a8d2  f8			sed
$0f:a8d3  ca			dex
$0f:a8d4  01 a0		 ora ($a0,x)
$0f:a8d6  49 02		 eor #$02
$0f:a8d8  00 4a		 brk #$4a
$0f:a8da  68			pla
$0f:a8db  41 d0		 eor ($d0,x)
$0f:a8dd  85 9e		 sta $9e
$0f:a8df  02 0c		 cop #$0c
$0f:a8e1  1c 16 68	  trb $6816
$0f:a8e4  c5 a0		 cmp $a0
$0f:a8e6  1f df fc 78   ora $78fcdf,x
$0f:a8ea  79 71 38	  adc $3871,y
$0f:a8ed  4c 1e 50	  jmp $501e
$0f:a8f0  4d 18 5b	  eor $5b18
$0f:a8f3  c8			iny
$0f:a8f4  25 27		 and $27
$0f:a8f6  e0 6a 82	  cpx #$826a
$0f:a8f9  08			php
$0f:a8fa  da			phx
$0f:a8fb  a2 8a 11	  ldx #$118a
$0f:a8fe  f9 43 20	  sbc $2043,y
$0f:a901  1f cf f9 ac   ora $acf9cf,x
$0f:a905  95 42		 sta $42,x
$0f:a907  5e 18 07	  lsr $0718,x
$0f:a90a  69 86		 adc #$86
$0f:a90c  01 b1		 ora ($b1,x)
$0f:a90e  80 76		 bra $a986
$0f:a910  d8			cld
$0f:a911  62 6b 21	  per $ca7f
$0f:a914  fa			plx
$0f:a915  34 c1		 bit $c1,x
$0f:a917  a6 0b		 ldx $0b
$0f:a919  c1 f5		 cmp ($f5,x)
$0f:a91b  09 bd		 ora #$bd
$0f:a91d  78			sei
$0f:a91e  3c 81 df	  bit $df81,x
$0f:a921  af 07 d0 50   lda $50d007
$0f:a925  b4 c9		 ldy $c9,x
$0f:a927  37 42		 and [$42],y
$0f:a929  11 0c		 ora ($0c),y
$0f:a92b  0f 99 e0 28   ora $28e099
$0f:a92f  8a			txa
$0f:a930  b1 6e		 lda ($6e),y
$0f:a932  84 70		 sty $70
$0f:a934  3e 48 51	  rol $5148,x
$0f:a937  40			rti
$0f:a938  89 a3		 bit #$a3
$0f:a93a  e1 a7		 sbc ($a7,x)
$0f:a93c  a4 86		 ldy $86
$0f:a93e  a0 52 3a	  ldy #$3a52
$0f:a941  88			dey
$0f:a942  48			pha
$0f:a943  ea			nop
$0f:a944  3f ce c3 0e   and $0ec3ce,x
$0f:a948  3d 24 39	  and $3924,x
$0f:a94b  02 91		 cop #$91
$0f:a94d  e5 92		 sbc $92
$0f:a94f  47 97		 eor [$97]
$0f:a951  3e ca 18	  rol $18ca,x
$0f:a954  79 e9 21	  adc $21e9,y
$0f:a957  e8			inx
$0f:a958  14 8f		 trb $8f
$0f:a95a  ac 92 3e	  ldy $3e92
$0f:a95d  81 18		 sta ($18,x)
$0f:a95f  7c 02 30	  jmp ($3002,x)
$0f:a962  bf 58 2a fc   lda $fc2a58,x
$0f:a966  60			rts
$0f:a967  e6 e0		 inc $e0
$0f:a969  9d 40 83	  sta $8340,x
$0f:a96c  a0 c1 19	  ldy #$19c1
$0f:a96f  d5 08		 cmp $08,x
$0f:a971  38			sec
$0f:a972  2d 80 95	  and $9580
$0f:a975  08			php
$0f:a976  88			dey
$0f:a977  5a			phy
$0f:a978  22 90 80 c1   jsl $c18090
$0f:a97c  98			tya
$0f:a97d  21 1a		 and ($1a,x)
$0f:a97f  11 03		 ora ($03),y
$0f:a981  04 42		 tsb $42
$0f:a983  4c 3a 06	  jmp $063a
$0f:a986  88			dey
$0f:a987  9b			txy
$0f:a988  82 b4 22	  brl $cc3f
$0f:a98b  18			clc
$0f:a98c  09 40		 ora #$40
$0f:a98e  45 22		 eor $22
$0f:a990  d8			cld
$0f:a991  08			php
$0f:a992  45 28		 eor $28
$0f:a994  a6 45		 ldx $45
$0f:a996  e1 2d		 sbc ($2d,x)
$0f:a998  13 04		 ora ($04,s),y
$0f:a99a  31 a5		 and ($a5),y
$0f:a99c  30 53		 bmi $a9f1
$0f:a99e  0c 43 1c	  tsb $1c43
$0f:a9a1  3e 10 87	  rol $8710,x
$0f:a9a4  de 84 49	  dec $4984,x
$0f:a9a7  7a			ply
$0f:a9a8  14 a5		 trb $a5
$0f:a9aa  a8			tay
$0f:a9ab  60			rts
$0f:a9ac  96 a1		 stx $a1,y
$0f:a9ae  b8			clv
$0f:a9af  41 20		 eor ($20,x)
$0f:a9b1  6c 10 c7	  jmp ($c710)
$0f:a9b4  8f bc d6 32   sta $32d6bc
$0f:a9b8  c2 99		 rep #$99
$0f:a9ba  2e 44 b4	  rol $b444
$0f:a9bd  92 b3		 sta ($b3)
$0f:a9bf  0a			asl a
$0f:a9c0  4a			lsr a
$0f:a9c1  cb			wai
$0f:a9c2  44 e6 09	  mvp $09,$e6
$0f:a9c5  d9 bc 89	  cmp $89bc,y
$0f:a9c8  21 3c		 and ($3c,x)
$0f:a9ca  53 f9		 eor ($f9,s),y
$0f:a9cc  ac 69 8b	  ldy $8b69
$0f:a9cf  c4 a6		 cpy $a6
$0f:a9d1  16 92		 asl $92,x
$0f:a9d3  96 61		 stx $61,y
$0f:a9d5  4a			lsr a
$0f:a9d6  5b			tcd
$0f:a9d7  45 2b		 eor $2b
$0f:a9d9  6d 84 ae	  adc $ae84
$0f:a9dc  37 fd		 and [$fd],y
$0f:a9de  b4 36		 ldy $36,x
$0f:a9e0  c5 e2		 cmp $e2
$0f:a9e2  5b			tcd
$0f:a9e3  0b			phd
$0f:a9e4  49 6b		 eor #$6b
$0f:a9e6  30 a5		 bmi $a98d
$0f:a9e8  ac 12 97	  ldy $9712
$0f:a9eb  b6 c2		 ldx $c2,y
$0f:a9ed  5f 20 50 48   eor $485020,x
$0f:a9f1  04 50		 tsb $50
$0f:a9f3  42 27		 wdm #$27
$0f:a9f5  d4 1d		 pei ($1d)
$0f:a9f7  03 dc		 ora $dc,s
$0f:a9f9  0e 23 2d	  asl $2d23
$0f:a9fc  81 0f		 sta ($0f,x)
$0f:a9fe  40			rti
$0f:a9ff  4a			lsr a
$0f:aa00  32 e2		 and ($e2)
$0f:aa02  7f 98 06 9a   adc $9a0698,x
$0f:aa06  64 4a		 stz $4a
$0f:aa08  71 af		 adc ($af),y
$0f:aa0a  cc 03 6d	  cpy $6d03
$0f:aa0d  32 25		 and ($25)
$0f:aa0f  b8			clv
$0f:aa10  2e 30 f0	  rol $f030
$0f:aa13  dd c1 c4	  cmp $c4c1,x
$0f:aa16  21 d7		 and ($d7,x)
$0f:aa18  44 02 d0	  mvp $d0,$02
$0f:aa1b  16 a3		 asl $a3,x
$0f:aa1d  44 59 08	  mvp $08,$59
$0f:aa20  18			clc
$0f:aa21  3a			dec a
$0f:aa22  cb			wai
$0f:aa23  82 61 8a	  brl $3487
$0f:aa26  fc 84 41	  jsr ($4184,x)
$0f:aa29  e6 5c		 inc $5c
$0f:aa2b  13 44		 ora ($44,s),y
$0f:aa2d  68			pla
$0f:aa2e  82 40 8a	  brl $3471
$0f:aa31  94 dd		 sty $dd,x
$0f:aa33  30 30		 bmi $aa65
$0f:aa35  88			dey
$0f:aa36  59 0c 38	  eor $380c,y
$0f:aa39  e8			inx
$0f:aa3a  80 85		 bra $a9c1
$0f:aa3c  a6 01		 ldx $01
$0f:aa3e  dc 0b f1	  jml [$f10b]
$0f:aa41  89 90		 bit #$90
$0f:aa43  c3 8c		 cmp $8c,s
$0f:aa45  88			dey
$0f:aa46  07 d0		 ora [$d0]
$0f:aa48  3e c5 7e	  rol $7ec5,x
$0f:aa4b  10 68		 bpl $aab5
$0f:aa4d  69 0c		 adc #$0c
$0f:aa4f  18			clc
$0f:aa50  a3 0d		 lda $0d,s
$0f:aa52  12 03		 ora ($03)
$0f:aa54  2c 80 e0	  bit $e080
$0f:aa57  98			tya
$0f:aa58  06 98		 asl $98
$0f:aa5a  83 80		 sta $80,s
$0f:aa5c  2e 34 48	  rol $4834
$0f:aa5f  1c 02 25	  trb $2502
$0f:aa62  00 88		 brk #$88
$0f:aa64  c0 3f ff	  cpy #$ff3f
$0f:aa67  f7 22		 sbc [$22],y
$0f:aa69  83 41		 sta $41,s
$0f:aa6b  d4 1e		 pei ($1e)
$0f:aa6d  70 60		 bvs $aacf
$0f:aa6f  ba			tsx
$0f:aa70  47 ce		 eor [$ce]
$0f:aa72  bf 10 b0 fd   lda $fdb010,x
$0f:aa76  c6 c4		 dec $c4
$0f:aa78  41 15		 eor ($15,x)
$0f:aa7a  f8			sed
$0f:aa7b  40			rti
$0f:aa7c  e1 40		 sbc ($40,x)
$0f:aa7e  93 85		 sta ($85,s),y
$0f:aa80  08			php
$0f:aa81  81 96		 sta ($96,x)
$0f:aa83  44 d0 0b	  mvp $0b,$d0
$0f:aa86  99 50 03	  sta $0350,y
$0f:aa89  c4 a4		 cpy $a4
$0f:aa8b  a5 d0		 lda $d0
$0f:aa8d  c1 20		 cmp ($20,x)
$0f:aa8f  70 b8		 bvs $aa49
$0f:aa91  2f d9 fc 0b   and $0bfcd9
$0f:aa95  3f 62 7b 57   and $577b62,x
$0f:aa99  dc 01 09	  jml [$0901]
$0f:aa9c  74 84		 stz $84,x
$0f:aa9e  2a			rol a
$0f:aa9f  13 03		 ora ($03,s),y
$0f:aaa1  3d 13 af	  and $af13,x
$0f:aaa4  df 9e 0d f0   cmp $f00d9e,x
$0f:aaa8  f7 2c		 sbc [$2c],y
$0f:aaaa  c6 0f		 dec $0f
$0f:aaac  06 5c		 asl $5c
$0f:aaae  18			clc
$0f:aaaf  c7 c8		 cmp [$c8]
$0f:aab1  5e 53 f3	  lsr $f353,x
$0f:aab4  22 1c 08 dc   jsl $dc081c
$0f:aab8  90 12		 bcc $aacc
$0f:aaba  60			rts
$0f:aabb  9b			txy
$0f:aabc  47 16		 eor [$16]
$0f:aabe  7c 12 1f	  jmp ($1f12,x)
$0f:aac1  e2 c8		 sep #$c8
$0f:aac3  06 f6		 asl $f6
$0f:aac5  02 e2		 cop #$e2
$0f:aac7  0b			phd
$0f:aac8  80 9e		 bra $aa68
$0f:aaca  50 2d		 bvc $aaf9
$0f:aacc  59 54 61	  eor $6154,y
$0f:aacf  02 70		 cop #$70
$0f:aad1  c5 2e		 cmp $2e
$0f:aad3  c4 58		 cpy $58
$0f:aad5  08			php
$0f:aad6  40			rti
$0f:aad7  20 1b 48	  jsr $481b
$0f:aada  4e 53 03	  lsr $0353
$0f:aadd  d5 e1		 cmp $e1,x
$0f:aadf  02 42		 cop #$42
$0f:aae1  be 04 29	  ldx $2904,y
$0f:aae4  a9 86		 lda #$86
$0f:aae6  88			dey
$0f:aae7  21 08		 and ($08,x)
$0f:aae9  c2 c8		 rep #$c8
$0f:aaeb  5a			phy
$0f:aaec  00 5e		 brk #$5e
$0f:aaee  21 38		 and ($38,x)
$0f:aaf0  40			rti
$0f:aaf1  60			rts
$0f:aaf2  90 c8		 bcc $aabc
$0f:aaf4  04 33		 tsb $33
$0f:aaf6  3b			tsc
$0f:aaf7  04 80		 tsb $80
$0f:aaf9  c3 16		 cmp $16,s
$0f:aafb  e1 0c		 sbc ($0c,x)
$0f:aafd  cf 31 41 80   cmp $804131
$0f:ab01  10 88		 bpl $aa8b
$0f:ab03  26 b5		 rol $b5
$0f:ab05  8a			txa
$0f:ab06  4d 00 d7	  eor $d700
$0f:ab09  21 86		 and ($86,x)
$0f:ab0b  21 14		 and ($14,x)
$0f:ab0d  80 6a		 bra $ab79
$0f:ab0f  96 e3		 stx $e3,y
$0f:ab11  08			php
$0f:ab12  6f 0a 34 63   adc $63340a
$0f:ab16  0d e0 cd	  ora $cde0
$0f:ab19  2d c1 66	  and $66c1
$0f:ab1c  0e c1 74	  asl $74c1
$0f:ab1f  14 36		 trb $36
$0f:ab21  0f 9a 51 02   ora $02519a
$0f:ab25  cc 1f 43	  cpy $431f
$0f:ab28  c4 58		 cpy $58
$0f:ab2a  94 65		 sty $65,x
$0f:ab2c  6d 0c 71	  adc $710c
$0f:ab2f  86 e7		 stx $e7
$0f:ab31  68			pla
$0f:ab32  8b			phb
$0f:ab33  f2 86		 sbc ($86)
$0f:ab35  e7 83		 sbc [$83]
$0f:ab37  25 08		 and $08
$0f:ab39  82 eb 83	  brl $2f27
$0f:ab3c  20 d5 18	  jsr $18d5
$0f:ab3f  2e b5 d0	  rol $d0b5
$0f:ab42  0d c0 8a	  ora $8ac0
$0f:ab45  b7 d0		 lda [$d0],y
$0f:ab47  64 2e		 stz $2e
$0f:ab49  82 19 03	  brl $ae65
$0f:ab4c  b8			clv
$0f:ab4d  56 41		 lsr $41,x
$0f:ab4f  0e 7d a1	  asl $a17d
$0f:ab52  1c 78 8b	  trb $8b78
$0f:ab55  21 20		 and ($20,x)
$0f:ab57  0d 12 0f	  ora $0f12
$0f:ab5a  00 8b		 brk #$8b
$0f:ab5c  c0 23 40	  cpy #$4023
$0f:ab5f  a8			tay
$0f:ab60  81 c2		 sta ($c2,x)
$0f:ab62  e1 10		 sbc ($10,x)
$0f:ab64  6c ee 12	  jmp ($12ee)
$0f:ab67  03 0b		 ora $0b,s
$0f:ab69  81 9a		 sta ($9a,x)
$0f:ab6b  83 3c		 sta $3c,s
$0f:ab6d  6d 22 68	  adc $6822
$0f:ab70  6b			rtl
$0f:ab71  8d a0 68	  sta $68a0
$0f:ab74  02 68		 cop #$68
$0f:ab76  6b			rtl
$0f:ab77  54 41 08	  mvn $08,$41
$0f:ab7a  87 45		 sta [$45]
$0f:ab7c  9b			txy
$0f:ab7d  e5 0e		 sbc $0e
$0f:ab7f  84 21		 sty $21
$0f:ab81  85 d0		 sta $d0
$0f:ab83  31 68		 and ($68),y
$0f:ab85  7b			tdc
$0f:ab86  ec 92 40	  cpx $4092
$0f:ab89  86 07		 stx $07
$0f:ab8b  70 a1		 bvs $ab2e
$0f:ab8d  81 36		 sta ($36,x)
$0f:ab8f  2e 80 43	  rol $4380
$0f:ab92  02 50		 cop #$50
$0f:ab94  40			rti
$0f:ab95  87 1d		 sta [$1d]
$0f:ab97  6d 80 31	  adc $3180
$0f:ab9a  81 c3		 sta ($c3,x)
$0f:ab9c  15 e6		 ora $e6,x
$0f:ab9e  34 c0		 bit $c0,x
$0f:aba0  1e 05 40	  asl $4005,x
$0f:aba3  e7 30		 sbc [$30]
$0f:aba5  40			rti
$0f:aba6  6c 11 08	  jmp ($0811)
$0f:aba9  2f b1 82 4c   and $4c82b1
$0f:abad  c0 f7 17	  cpy #$17f7
$0f:abb0  c0 60 0b	  cpy #$0b60
$0f:abb3  10 e5		 bpl $ab9a
$0f:abb5  8d 49 b4	  sta $b449
$0f:abb8  2f 62 58 87   and $875862
$0f:abbc  28			plp
$0f:abbd  be 0a f2	  ldx $f20a,y
$0f:abc0  e5 0f		 sbc $0f
$0f:abc2  0e 11 ba	  asl $ba11
$0f:abc5  75 93		 adc $93,x
$0f:abc7  d8			cld
$0f:abc8  68			pla
$0f:abc9  8a			txa
$0f:abca  d2 8f		 cmp ($8f)
$0f:abcc  ac 96 18	  ldy $1896
$0f:abcf  66 06		 ror $06
$0f:abd1  18			clc
$0f:abd2  c5 f9		 cmp $f9
$0f:abd4  82 70 31	  brl $dd47
$0f:abd7  0c 5f 9c	  tsb $9c5f
$0f:abda  15 28		 ora $28,x
$0f:abdc  84 1f		 sty $1f
$0f:abde  dc 15 03	  jml [$0315]
$0f:abe1  08			php
$0f:abe2  c1 fd		 cmp ($fd,x)
$0f:abe4  89 00		 bit #$00
$0f:abe6  84 c3		 sty $c3
$0f:abe8  c0 a0 dc	  cpy #$dca0
$0f:abeb  18			clc
$0f:abec  7c 24 5c	  jmp ($5c24,x)
$0f:abef  29 00		 and #$00
$0f:abf1  80 c5		 bra $abb8
$0f:abf3  c0 a0 ea	  cpy #$eaa0
$0f:abf6  18			clc
$0f:abf7  bc 04 78	  ldy $7804,x
$0f:abfa  23 82		 and $82,s
$0f:abfc  8b			phb
$0f:abfd  bd c8 82	  lda $82c8,x
$0f:ac00  04 a1		 tsb $a1
$0f:ac02  48			pha
$0f:ac03  03 60		 ora $60,s
$0f:ac05  09 41		 ora #$41
$0f:ac07  cb			wai
$0f:ac08  41 03		 eor ($03,x)
$0f:ac0a  7c 0b 02	  jmp ($020b,x)
$0f:ac0d  ac 39 08	  ldy $0839
$0f:ac10  1a			inc a
$0f:ac11  19 43 09	  ora $0943,y
$0f:ac14  e6 61		 inc $61
$0f:ac16  1a			inc a
$0f:ac17  05 09		 ora $09
$0f:ac19  e7 1d		 sbc [$1d]
$0f:ac1b  c1 6c		 cmp ($6c,x)
$0f:ac1d  31 9f		 and ($9f),y
$0f:ac1f  61 dc		 adc ($dc,x)
$0f:ac21  90 41		 bcc $ac64
$0f:ac23  ee 2d 84	  inc $842d
$0f:ac26  2a			rol a
$0f:ac27  1c 67 06	  trb $0667
$0f:ac2a  e0 c3 a1	  cpx #$a1c3
$0f:ac2d  49 01		 eor #$01
$0f:ac2f  15 04		 ora $04,x
$0f:ac31  0a			asl a
$0f:ac32  2c 67 07	  bit $0767
$0f:ac35  50 c5		 bvc $abfc
$0f:ac37  a0 49 e1	  ldy #$e149
$0f:ac3a  4d 14 65	  eor $6514
$0f:ac3d  ee 4a 30	  inc $304a
$0f:ac40  56 09		 lsr $09,x
$0f:ac42  50 95		 bvc $abd9
$0f:ac44  81 aa		 sta ($aa,x)
$0f:ac46  2d 92 e8	  and $e892
$0f:ac49  78			sei
$0f:ac4a  90 e8		 bcc $ac34
$0f:ac4c  04 82		 tsb $82
$0f:ac4e  01 22		 ora ($22,x)
$0f:ac50  46 80		 lsr $80
$0f:ac52  20 d9 61	  jsr $61d9
$0f:ac55  01 83		 ora ($83,x)
$0f:ac57  46 21		 lsr $21
$0f:ac59  d0 eb		 bne $ac46
$0f:ac5b  44 12 03	  mvp $03,$12
$0f:ac5e  07 8b		 ora [$8b]
$0f:ac60  c1 23		 cmp ($23,x)
$0f:ac62  1a			inc a
$0f:ac63  86 c8		 stx $c8
$0f:ac65  45 61		 eor $61
$0f:ac67  31 88		 and ($88),y
$0f:ac69  26 a0		 rol $a0
$0f:ac6b  2a			rol a
$0f:ac6c  10 88		 bpl $abf6
$0f:ac6e  b3 90		 lda ($90,s),y
$0f:ac70  31 07		 and ($07),y
$0f:ac72  70 8b		 bvs $abff
$0f:ac74  42 20		 wdm #$20
$0f:ac76  d1 6b		 cmp ($6b),y
$0f:ac78  41 50		 eor ($50,x)
$0f:ac7a  63 d0		 adc $d0,s
$0f:ac7c  09 26		 ora #$26
$0f:ac7e  dc 7e 10	  jml [$107e]
$0f:ac81  09 34		 ora #$34
$0f:ac83  82 09 a6	  brl $528f
$0f:ac86  1f 84 99 44   ora $449984,x
$0f:ac8a  10 ed		 bpl $ac79
$0f:ac8c  3b			tsc
$0f:ac8d  64 1e		 stz $1e
$0f:ac8f  00 d6		 brk #$d6
$0f:ac91  0c 40 fc	  tsb $fc40
$0f:ac94  1e e1 24	  asl $24e1,x
$0f:ac97  80 6d		 bra $ad06
$0f:ac99  e8			inx
$0f:ac9a  91 16		 sta ($16),y
$0f:ac9c  40			rti
$0f:ac9d  b1 c1		 lda ($c1),y
$0f:ac9f  8a			txa
$0f:aca0  06 b5		 asl $b5
$0f:aca2  80 c8		 bra $ac6c
$0f:aca4  a2 00 f1	  ldx #$f100
$0f:aca7  80 c8		 bra $ac71
$0f:aca9  20 6e 90	  jsr $906e
$0f:acac  6f 8c 6a 13   adc $136a8c
$0f:acb0  19 82 da	  ora $da82,y
$0f:acb3  38			sec
$0f:acb4  90 18		 bcc $acce
$0f:acb6  4c 6a 01	  jmp $016a
$0f:acb9  1e 6c 04	  asl $046c,x
$0f:acbc  02 27		 cop #$27
$0f:acbe  18			clc
$0f:acbf  8b			phb
$0f:acc0  44 00 43	  mvp $43,$00
$0f:acc3  19 89 3d	  ora $3d89,y
$0f:acc6  c0 12 04	  cpy #$0412
$0f:acc9  a1 88		 lda ($88,x)
$0f:accb  45 9f		 eor $9f
$0f:accd  63 2b		 adc $2b,s
$0f:accf  80 47		 bra $ad18
$0f:acd1  21 5a		 and ($5a,x)
$0f:acd3  67 a8		 adc [$a8]
$0f:acd5  16 02		 asl $02,x
$0f:acd7  47 03		 eor [$03]
$0f:acd9  d3 9d		 cmp ($9d,s),y
$0f:acdb  c2 15		 rep #$15
$0f:acdd  19 7c 04	  ora $047c,y
$0f:ace0  38			sec
$0f:ace1  76 11		 ror $11,x
$0f:ace3  08			php
$0f:ace4  9c 2a 29	  stz $292a
$0f:ace7  0e 42 84	  asl $8442
$0f:acea  8a			txa
$0f:aceb  03 0f		 ora $0f,s
$0f:aced  87 c3		 sta [$c3]
$0f:acef  83 07		 sta $07,s
$0f:acf1  17 80		 ora [$80],y
$0f:acf3  43 c4		 eor $c4,s
$0f:acf5  0d 00 91	  ora $9100
$0f:acf8  c4 a0		 cpy $a0
$0f:acfa  8d 81 84	  sta $8481
$0f:acfd  46 c0		 lsr $c0
$0f:acff  c0 df 19	  cpy #$19df
$0f:ad02  0c 0a 23	  tsb $230a
$0f:ad05  05 76		 ora $76
$0f:ad07  84 02		 sty $02
$0f:ad09  31 13		 and ($13),y
$0f:ad0b  89 43		 bit #$43
$0f:ad0d  34 cb		 bit $cb,x
$0f:ad0f  d0 92		 bne $aca3
$0f:ad11  41 e0		 eor ($e0,x)
$0f:ad13  91 a0		 sta ($a0),y
$0f:ad15  10 c8		 bpl $acdf
$0f:ad17  21 70		 and ($70,x)
$0f:ad19  c8			iny
$0f:ad1a  91 3c		 sta ($3c),y
$0f:ad1c  61 f1		 adc ($f1,x)
$0f:ad1e  c8			iny
$0f:ad1f  e4 0b		 cpx $0b
$0f:ad21  4e f5 08	  lsr $08f5
$0f:ad24  1c a2 07	  trb $07a2
$0f:ad27  1b			tcs
$0f:ad28  db			stp
$0f:ad29  a7 40		 lda [$40]
$0f:ad2b  b2 10		 lda ($10)
$0f:ad2d  b8			clv
$0f:ad2e  9b			txy
$0f:ad2f  ec 20 31	  cpx $3120
$0f:ad32  78			sei
$0f:ad33  64 58		 stz $58
$0f:ad35  d4 4c		 pei ($4c)
$0f:ad37  90 03		 bcc $ad3c
$0f:ad39  0a			asl a
$0f:ad3a  58			cli
$0f:ad3b  21 b1		 and ($b1,x)
$0f:ad3d  68			pla
$0f:ad3e  64 29		 stz $29
$0f:ad40  a8			tay
$0f:ad41  10 d1		 bpl $ad14
$0f:ad43  f8			sed
$0f:ad44  10 c1		 bpl $ad07
$0f:ad46  00 f0		 brk #$f0
$0f:ad48  03 38		 ora $38,s
$0f:ad4a  43 94		 eor $94,s
$0f:ad4c  40			rti
$0f:ad4d  42 18		 wdm #$18
$0f:ad4f  84 1a		 sty $1a
$0f:ad51  28			plp
$0f:ad52  5d 14 c0	  eor $c014,x
$0f:ad55  42 e1		 wdm #$e1
$0f:ad57  ea			nop
$0f:ad58  31 45		 and ($45),y
$0f:ad5a  03 f0		 ora $f0,s
$0f:ad5c  34 e4		 bit $e4,x
$0f:ad5e  20 8a 43	  jsr $438a
$0f:ad61  e2 10		 sep #$10
$0f:ad63  a3 20		 lda $20,s
$0f:ad65  40			rti
$0f:ad66  20 b1 e8	  jsr $e8b1
$0f:ad69  9c 1f 6e	  stz $6e1f
$0f:ad6c  b9 07 98	  lda $9807,y
$0f:ad6f  40			rti
$0f:ad70  23 4c		 and $4c,s
$0f:ad72  61 81		 adc ($81,x)
$0f:ad74  c6 20		 dec $20
$0f:ad76  11 23		 ora ($23),y
$0f:ad78  c8			iny
$0f:ad79  40			rti
$0f:ad7a  61 71		 adc ($71,x)
$0f:ad7c  08			php
$0f:ad7d  93 30		 sta ($30,s),y
$0f:ad7f  04 40		 tsb $40
$0f:ad81  92 08		 sta ($08)
$0f:ad83  8c 04 e4	  sty $e404
$0f:ad86  0d e0 82	  ora $82e0
$0f:ad89  c1 62		 cmp ($62,x)
$0f:ad8b  b0 f7		 bcs $ad84
$0f:ad8d  88			dey
$0f:ad8e  22 82 2b 05   jsl $052b82
$0f:ad92  8f 8d c6 3f   sta $3fc68d
$0f:ad96  00 94		 brk #$94
$0f:ad98  97 c1		 sta [$c1],y
$0f:ad9a  58			cli
$0f:ad9b  04 61		 tsb $61
$0f:ad9d  84 a2		 sty $a2
$0f:ad9f  05 02		 ora $02
$0f:ada1  11 9b		 ora ($9b),y
$0f:ada3  34 08		 bit $08,x
$0f:ada5  ec 03 80	  cpx $8003
$0f:ada8  28			plp
$0f:ada9  85 0a		 sta $0a
$0f:adab  01 08		 ora ($08,x)
$0f:adad  04 84		 tsb $84
$0f:adaf  47 63		 eor [$63]
$0f:adb1  02 59		 cop #$59
$0f:adb3  84 20		 sty $20
$0f:adb5  bc 34 24	  ldy $2434,x
$0f:adb8  80 41		 bra $adfb
$0f:adba  e0 31		 cpx #$31
$0f:adbc  8b			phb
$0f:adbd  01 4c		 ora ($4c,x)
$0f:adbf  0d 41 11	  ora $1141
$0f:adc2  84 60		 sty $60
$0f:adc4  0d e5 19	  ora $19e5
$0f:adc7  80 64		 bra $ae2d
$0f:adc9  0a			asl a
$0f:adca  61 07		 adc ($07,x)
$0f:adcc  84 1e		 sty $1e
$0f:adce  84 d0		 sty $d0
$0f:add0  07 f0		 ora [$f0]
$0f:add2  84 c4		 sty $c4
$0f:add4  2e 14 2f	  rol $2f14
$0f:add7  df fe 61 00   cmp $0061fe,x
$0f:addb  47 01		 eor [$01]
$0f:addd  15 21		 ora $21,x
$0f:addf  44 c1 15	  mvp $15,$c1
$0f:ade2  84 82		 sty $82
$0f:ade4  c8			iny
$0f:ade5  53 04		 eor ($04,s),y
$0f:ade7  d8			cld
$0f:ade8  44 22 18	  mvp $18,$22
$0f:adeb  42 98		 wdm #$98
$0f:aded  44 04 81	  mvp $81,$04
$0f:adf0  10 c3		 bpl $adb5
$0f:adf2  14 c0		 trb $c0
$0f:adf4  3a			dec a
$0f:adf5  10 83		 bpl $ad7a
$0f:adf7  69 07		 adc #$07
$0f:adf9  41 62		 eor ($62,x)
$0f:adfb  07 51		 ora [$51]
$0f:adfd  0e 81 1c	  asl $1c81
$0f:ae00  0f 83 02 8c   ora $8c0283
$0f:ae04  b0 04		 bcs $ae0a
$0f:ae06  d0 0c		 bne $ae14
$0f:ae08  50 52		 bvc $ae5c
$0f:ae0a  02 28		 cop #$28
$0f:ae0c  07 20		 ora [$20]
$0f:ae0e  e6 08		 inc $08
$0f:ae10  c0 d8		 cpy #$d8
$0f:ae12  63 b0		 adc $b0,s
$0f:ae14  68			pla
$0f:ae15  6c 6c 7a	  jmp ($7a6c)
$0f:ae18  01 71		 ora ($71,x)
$0f:ae1a  47 d3		 eor [$d3]
$0f:ae1c  88			dey
$0f:ae1d  13 a2		 ora ($a2,s),y
$0f:ae1f  68			pla
$0f:ae20  07 10		 ora [$10]
$0f:ae22  44 14 a0	  mvp $a0,$14
$0f:ae25  68			pla
$0f:ae26  08			php
$0f:ae27  53 e0		 eor ($e0,s),y
$0f:ae29  15 80		 ora $80,x
$0f:ae2b  68			pla
$0f:ae2c  08			php
$0f:ae2d  c4 09		 cpy $09
$0f:ae2f  80 60		 bra $ae91
$0f:ae31  40			rti
$0f:ae32  7c 05 c0	  jmp ($c005,x)
$0f:ae35  12 4b		 ora ($4b)
$0f:ae37  23 8b		 and $8b,s
$0f:ae39  c0 c1		 cpy #$c1
$0f:ae3b  a2 68		 ldx #$68
$0f:ae3d  00 c8		 brk #$c8
$0f:ae3f  31 c8		 and ($c8),y
$0f:ae41  70 12		 bvs $ae55
$0f:ae43  28			plp
$0f:ae44  84 60		 sty $60
$0f:ae46  7a			ply
$0f:ae47  30 68		 bmi $aeb1
$0f:ae49  e4 2e		 cpx $2e
$0f:ae4b  3a			dec a
$0f:ae4c  d7 18		 cmp [$18],y
$0f:ae4e  04 7e		 tsb $7e
$0f:ae50  01 28		 ora ($28,x)
$0f:ae52  48			pha
$0f:ae53  ac 21 32	  ldy $3221
$0f:ae56  30 f8		 bmi $ae50
$0f:ae58  7c 26 cc	  jmp ($cc26,x)
$0f:ae5b  a7 08		 lda [$08]
$0f:ae5d  79 88 08	  adc $0888,y
$0f:ae60  c0 25		 cpy #$25
$0f:ae62  08			php
$0f:ae63  44 3e 3f	  mvp $3f,$3e
$0f:ae66  01 d8		 ora ($d8,x)
$0f:ae68  c0 88		 cpy #$88
$0f:ae6a  61 08		 adc ($08,x)
$0f:ae6c  29 8a		 and #$8a
$0f:ae6e  10 0e		 bpl $ae7e
$0f:ae70  21 18		 and ($18,x)
$0f:ae72  80 78		 bra $aeec
$0f:ae74  0f a4 61 12   ora $1261a4
$0f:ae78  e9 42		 sbc #$42
$0f:ae7a  22 1c 02 b0   jsl $b0021c
$0f:ae7e  14 41		 trb $41
$0f:ae80  26 1b		 rol $1b
$0f:ae82  02 b0		 cop #$b0
$0f:ae84  0d 46 5a	  ora $5a46
$0f:ae87  91 58		 sta ($58),y
$0f:ae89  49 04		 eor #$04
$0f:ae8b  9b			txy
$0f:ae8c  20 47 34	  jsr $3447
$0f:ae8f  58			cli
$0f:ae90  93 ca		 sta ($ca,s),y
$0f:ae92  21 15		 and ($15,x)
$0f:ae94  2a			rol a
$0f:ae95  9a			txs
$0f:ae96  64 4b		 stz $4b
$0f:ae98  a5 1d		 lda $1d
$0f:ae9a  80 78		 bra $af14
$0f:ae9c  8c 84 a7	  sty $a784
$0f:ae9f  12 e9		 ora ($e9)
$0f:aea1  43 62		 eor $62,s
$0f:aea3  1c 23 21	  trb $2123
$0f:aea6  2d 44 ba	  and $ba44
$0f:aea9  50 58		 bvc $af03
$0f:aeab  c6 c8		 dec $c8
$0f:aead  f2 73		 sbc ($73)
$0f:aeaf  88			dey
$0f:aeb0  07 e3		 ora [$e3]
$0f:aeb2  fe 82 28	  inc $2882,x
$0f:aeb5  3a			dec a
$0f:aeb6  1c e4 08	  trb $08e4
$0f:aeb9  d4 6c		 pei ($6c)
$0f:aebb  82 54 e3	  brl $9212
$0f:aebe  09 b4		 ora #$b4
$0f:aec0  73 82		 adc ($82,s),y
$0f:aec2  8c 83 61	  sty $6183
$0f:aec5  62 24 01	  per $afec
$0f:aec8  7c 04 41	  jmp ($4104,x)
$0f:aecb  82 32 13	  brl $c200
$0f:aece  ec 68 5f	  cpx $5f68
$0f:aed1  9f fc 60 6e   sta $6e60fc,x
$0f:aed5  f0 52		 beq $af29
$0f:aed7  08			php
$0f:aed8  10 82		 bpl $ae5c
$0f:aeda  01 18		 ora ($18,x)
$0f:aedc  b0 12		 bcs $aef0
$0f:aede  00 84		 brk #$84
$0f:aee0  06 f0		 asl $f0
$0f:aee2  b8			clv
$0f:aee3  12 00		 ora ($00)
$0f:aee5  82 01 e1	  brl $8fe9
$0f:aee8  51 81		 eor ($81),y
$0f:aeea  08			php
$0f:aeeb  01 01		 ora ($01,x)
$0f:aeed  90 10		 bcc $aeff
$0f:aeef  90 b0		 bcc $aea1
$0f:aef1  49 e0		 eor #$e0
$0f:aef3  7b			tdc
$0f:aef4  10 40		 bpl $af36
$0f:aef6  20 0a 21	  jsr $210a
$0f:aef9  00 82		 brk #$82
$0f:aefb  35 0e		 and $0e,x
$0f:aefd  10 da		 bpl $aed9
$0f:aeff  42 48		 wdm #$48
$0f:af01  38			sec
$0f:af02  8e 00 e8	  stx $e800
$0f:af05  42 b8		 wdm #$b8
$0f:af07  50 bf		 bvc $aec8
$0f:af09  ff f9 10 24   sbc $2410f9,x
$0f:af0d  5a			phy
$0f:af0e  a0 82		 ldy #$82
$0f:af10  28			plp
$0f:af11  50 8c		 bvc $ae9f
$0f:af13  61 30		 adc ($30,x)
$0f:af15  88			dey
$0f:af16  8f 12 08 6f   sta $6f0812
$0f:af1a  18			clc
$0f:af1b  c4 07		 cpy $07
$0f:af1d  c8			iny
$0f:af1e  43 03		 eor $03,s
$0f:af20  c8			iny
$0f:af21  47 a0		 eor [$a0]
$0f:af23  7a			ply
$0f:af24  32 18		 and ($18)
$0f:af26  40			rti
$0f:af27  23 30		 and $30,s
$0f:af29  e8			inx
$0f:af2a  9e 88 ea	  stz $ea88,x
$0f:af2d  10 18		 bpl $af47
$0f:af2f  84 66		 sty $66
$0f:af31  01 84		 ora ($84,x)
$0f:af33  6d 84 45	  adc $4584
$0f:af36  0a			asl a
$0f:af37  10 0c		 bpl $af45
$0f:af39  30 68		 bmi $afa3
$0f:af3b  62 10 98	  per $474e
$0f:af3e  85 91		 sta $91
$0f:af40  70 30		 bvs $af72
$0f:af42  a3 c8		 lda $c8,s
$0f:af44  78			sei
$0f:af45  13 e4		 ora ($e4,s),y
$0f:af47  72 0e		 adc ($0e)
$0f:af49  03 a4		 ora $a4,s
$0f:af4b  20 f1 28	  jsr $28f1
$0f:af4e  04 87		 tsb $87
$0f:af50  60			rts
$0f:af51  21 19		 and ($19,x)
$0f:af53  2c 02 5a	  bit $5a02
$0f:af56  0b			phd
$0f:af57  52 08		 eor ($08)
$0f:af59  22 c2 2b 00   jsl $002bc2
$0f:af5d  8e b6 86	  stx $86b6
$0f:af60  21 06		 and ($06,x)
$0f:af62  63 0b		 adc $0b,s
$0f:af64  88			dey
$0f:af65  21 31		 and ($31,x)
$0f:af67  58			cli
$0f:af68  84 55		 sty $55
$0f:af6a  d0 31		 bne $af9d
$0f:af6c  08			php
$0f:af6d  73 50		 adc ($50,s),y
$0f:af6f  4a			lsr a
$0f:af70  41 14		 eor ($14,x)
$0f:af72  85 47		 sta $47
$0f:af74  a0 fb		 ldy #$fb
$0f:af76  7a			ply
$0f:af77  24 02		 bit $02
$0f:af79  35 04		 and $04,x
$0f:af7b  8c 43 74	  sty $7443
$0f:af7e  c7 50		 cmp [$50]
$0f:af80  8b			phb
$0f:af81  16 82		 asl $82,x
$0f:af83  1d 0e 21	  ora $210e,x
$0f:af86  83 9c		 sta $9c,s
$0f:af88  23 f0		 and $f0,s
$0f:af8a  68			pla
$0f:af8b  79 0c 20	  adc $200c,y
$0f:af8e  51 c8		 eor ($c8),y
$0f:af90  9c 4a 1f	  stz $1f4a
$0f:af93  44 80 c2	  mvp $c2,$80
$0f:af96  61 b1		 adc ($b1,x)
$0f:af98  d8			cld
$0f:af99  07 88		 ora [$88]
$0f:af9b  96 00		 stx $00,y
$0f:af9d  30 86		 bmi $af25
$0f:af9f  c4 38		 cpy $38
$0f:afa1  40			rti
$0f:afa2  82 82 c6	  brl $7627
$0f:afa5  36 44		 rol $44,x
$0f:afa7  b0 84		 bcs $af2d
$0f:afa9  43 a2		 eor $a2,s
$0f:afab  b0 8e		 bcs $af3b
$0f:afad  95 08		 sta $08,x
$0f:afaf  2e 20 51	  rol $5120
$0f:afb2  1b			tcs
$0f:afb3  0c 7a 42	  tsb $427a
$0f:afb6  f6 07		 inc $07,x
$0f:afb8  d1 46		 cmp ($46),y
$0f:afba  e1 5a		 sbc ($5a,x)
$0f:afbc  6a			ror a
$0f:afbd  27 f3		 and [$f3]
$0f:afbf  ff 0c 80 0d   sbc $0d800c,x
$0f:afc3  40			rti
$0f:afc4  66 0c		 ror $0c
$0f:afc6  10 60		 bpl $b028
$0f:afc8  8a			txa
$0f:afc9  e8			inx
$0f:afca  57 43		 eor [$43],y
$0f:afcc  f6 82		 inc $82,x
$0f:afce  0c fd 76	  tsb $76fd
$0f:afd1  1b			tcs
$0f:afd2  68			pla
$0f:afd3  20 01 01	  jsr $0101
$0f:afd6  00 01		 brk #$01
$0f:afd8  ac 56 5d	  ldy $5d56
$0f:afdb  f9 5a ad	  sbc $ad5a,y
$0f:afde  bf f2 c5 63   lda $63c5f2,x
$0f:afe2  07 e5		 ora [$e5]
$0f:afe4  72 bb		 adc ($bb)
$0f:afe6  64 b2		 stz $b2
$0f:afe8  87 ea		 sta [$ea]
$0f:afea  00 2f		 brk #$2f
$0f:afec  f2 07		 sbc ($07)
$0f:afee  94 7c		 sty $7c,x
$0f:aff0  c5 e7		 cmp $e7
$0f:aff2  3f 42 7a 57   and $577a42,x
$0f:aff6  d4 de		 pei ($de)
$0f:aff8  b7 f6		 lda [$f6],y
$0f:affa  47 b6		 eor [$b6]
$0f:affc  7d d4 40	  adc $40d4,x
$0f:afff  16 00		 asl $00,x
$0f:b001  00 00		 brk #$00
$0f:b003  00 00		 brk #$00
$0f:b005  00 00		 brk #$00
$0f:b007  00 00		 brk #$00
$0f:b009  00 00		 brk #$00
$0f:b00b  00 00		 brk #$00
$0f:b00d  00 00		 brk #$00
$0f:b00f  00 00		 brk #$00
$0f:b011  00 00		 brk #$00
$0f:b013  00 00		 brk #$00
$0f:b015  00 00		 brk #$00
$0f:b017  00 00		 brk #$00
$0f:b019  00 00		 brk #$00
$0f:b01b  00 00		 brk #$00
$0f:b01d  00 00		 brk #$00
$0f:b01f  00 00		 brk #$00
$0f:b021  00 00		 brk #$00
$0f:b023  00 00		 brk #$00
$0f:b025  00 00		 brk #$00
$0f:b027  00 00		 brk #$00
$0f:b029  00 00		 brk #$00
$0f:b02b  00 00		 brk #$00
$0f:b02d  00 02		 brk #$02
$0f:b02f  01 00		 ora ($00,x)
$0f:b031  00 00		 brk #$00
$0f:b033  00 00		 brk #$00
$0f:b035  00 00		 brk #$00
$0f:b037  00 00		 brk #$00
$0f:b039  00 00		 brk #$00
$0f:b03b  00 00		 brk #$00
$0f:b03d  00 00		 brk #$00
$0f:b03f  00 00		 brk #$00
$0f:b041  00 00		 brk #$00
$0f:b043  00 00		 brk #$00
$0f:b045  00 00		 brk #$00
$0f:b047  00 00		 brk #$00
$0f:b049  00 00		 brk #$00
$0f:b04b  00 00		 brk #$00
$0f:b04d  00 00		 brk #$00
$0f:b04f  00 00		 brk #$00
$0f:b051  00 00		 brk #$00
$0f:b053  00 00		 brk #$00
$0f:b055  00 00		 brk #$00
$0f:b057  00 00		 brk #$00
$0f:b059  00 00		 brk #$00
$0f:b05b  00 00		 brk #$00
$0f:b05d  00 00		 brk #$00
$0f:b05f  00 00		 brk #$00
$0f:b061  00 00		 brk #$00
$0f:b063  00 00		 brk #$00
$0f:b065  00 00		 brk #$00
$0f:b067  00 00		 brk #$00
$0f:b069  00 03		 brk #$03
$0f:b06b  00 0c		 brk #$0c
$0f:b06d  03 18		 ora $18,s
$0f:b06f  04 00		 tsb $00
$0f:b071  00 00		 brk #$00
$0f:b073  00 00		 brk #$00
$0f:b075  00 00		 brk #$00
$0f:b077  00 00		 brk #$00
$0f:b079  00 00		 brk #$00
$0f:b07b  00 00		 brk #$00
$0f:b07d  00 03		 brk #$03
$0f:b07f  00 00		 brk #$00
$0f:b081  00 00		 brk #$00
$0f:b083  00 09		 brk #$09
$0f:b085  05 25		 ora $25
$0f:b087  16 58		 asl $58,x
$0f:b089  38			sec
$0f:b08a  02 43		 cop #$43
$0f:b08c  1c 80 b9	  trb $b980
$0f:b08f  80 00		 bra $b091
$0f:b091  00 00		 brk #$00
$0f:b093  00 02		 brk #$02
$0f:b095  00 08		 brk #$08
$0f:b097  00 07		 brk #$07
$0f:b099  00 3c		 brk #$3c
$0f:b09b  00 77		 brk #$77
$0f:b09d  08			php
$0f:b09e  6f 10 00 00   adc $000010
$0f:b0a2  00 00		 brk #$00
$0f:b0a4  50 80		 bvc $b026
$0f:b0a6  80 00		 bra $b0a8
$0f:b0a8  6a			ror a
$0f:b0a9  74 e0		 stz $e0,x
$0f:b0ab  00 4c		 brk #$4c
$0f:b0ad  70 82		 bvs $b031
$0f:b0af  03 00		 ora $00,s
$0f:b0b1  00 00		 brk #$00
$0f:b0b3  00 00		 brk #$00
$0f:b0b5  00 00		 brk #$00
$0f:b0b7  00 80		 brk #$80
$0f:b0b9  00 00		 brk #$00
$0f:b0bb  00 80		 brk #$80
$0f:b0bd  00 fc		 brk #$fc
$0f:b0bf  00 00		 brk #$00
$0f:b0c1  01 09		 ora ($09,x)
$0f:b0c3  01 02		 ora ($02,x)
$0f:b0c5  08			php
$0f:b0c6  0a			asl a
$0f:b0c7  00 20		 brk #$20
$0f:b0c9  0a			asl a
$0f:b0ca  0c 0a 2e	  tsb $2e0a
$0f:b0cd  0a			asl a
$0f:b0ce  15 20		 ora $20,x
$0f:b0d0  00 00		 brk #$00
$0f:b0d2  00 00		 brk #$00
$0f:b0d4  01 00		 ora ($00,x)
$0f:b0d6  01 00		 ora ($00,x)
$0f:b0d8  01 00		 ora ($00,x)
$0f:b0da  01 00		 ora ($00,x)
$0f:b0dc  01 00		 ora ($00,x)
$0f:b0de  0b			phd
$0f:b0df  00 00		 brk #$00
$0f:b0e1  00 90		 brk #$90
$0f:b0e3  00 10		 brk #$10
$0f:b0e5  80 40		 bra $b127
$0f:b0e7  90 d4		 bcc $b0bd
$0f:b0e9  90 e4		 bcc $b0cf
$0f:b0eb  90 50		 bcc $b13d
$0f:b0ed  24 34		 bit $34
$0f:b0ef  60			rts
$0f:b0f0  00 00		 brk #$00
$0f:b0f2  00 00		 brk #$00
$0f:b0f4  00 00		 brk #$00
$0f:b0f6  00 00		 brk #$00
$0f:b0f8  00 00		 brk #$00
$0f:b0fa  00 00		 brk #$00
$0f:b0fc  80 00		 bra $b0fe
$0f:b0fe  80 00		 bra $b100
$0f:b100  00 00		 brk #$00
$0f:b102  00 00		 brk #$00
$0f:b104  00 00		 brk #$00
$0f:b106  01 00		 ora ($00,x)
$0f:b108  01 00		 ora ($00,x)
$0f:b10a  03 00		 ora $00,s
$0f:b10c  01 00		 ora ($00,x)
$0f:b10e  07 02		 ora [$02]
$0f:b110  00 00		 brk #$00
$0f:b112  00 00		 brk #$00
$0f:b114  00 00		 brk #$00
$0f:b116  01 00		 ora ($00,x)
$0f:b118  01 00		 ora ($00,x)
$0f:b11a  03 00		 ora $00,s
$0f:b11c  03 00		 ora $00,s
$0f:b11e  05 00		 ora $00
$0f:b120  00 00		 brk #$00
$0f:b122  80 00		 bra $b124
$0f:b124  80 00		 bra $b126
$0f:b126  c0 00		 cpy #$00
$0f:b128  c0 00		 cpy #$00
$0f:b12a  e0 00		 cpx #$00
$0f:b12c  c0 00		 cpy #$00
$0f:b12e  f0 20		 beq $b150
$0f:b130  80 00		 bra $b132
$0f:b132  80 00		 bra $b134
$0f:b134  80 00		 bra $b136
$0f:b136  c0 00		 cpy #$00
$0f:b138  c0 00		 cpy #$00
$0f:b13a  e0 00		 cpx #$00
$0f:b13c  e0 00		 cpx #$00
$0f:b13e  d0 00		 bne $b140
$0f:b140  00 02		 brk #$02
$0f:b142  0e 04 03	  asl $0304
$0f:b145  06 09		 asl $09
$0f:b147  08			php
$0f:b148  01 0c		 ora ($0c,x)
$0f:b14a  14 14		 trb $14
$0f:b14c  02 12		 cop #$12
$0f:b14e  03 0b		 ora $0b,s
$0f:b150  0d 00 09	  ora $0900
$0f:b153  00 09		 brk #$09
$0f:b155  00 13		 brk #$13
$0f:b157  00 13		 brk #$13
$0f:b159  00 03		 brk #$03
$0f:b15b  00 05		 brk #$05
$0f:b15d  00 04		 brk #$04
$0f:b15f  00 80		 brk #$80
$0f:b161  20 b8 10	  jsr $10b8
$0f:b164  e0 30		 cpx #$30
$0f:b166  c8			iny
$0f:b167  08			php
$0f:b168  c0 18		 cpy #$18
$0f:b16a  94 14		 sty $14,x
$0f:b16c  a0 24		 ldy #$24
$0f:b16e  60			rts
$0f:b16f  68			pla
$0f:b170  d8			cld
$0f:b171  00 c8		 brk #$c8
$0f:b173  00 c8		 brk #$c8
$0f:b175  00 e4		 brk #$e4
$0f:b177  00 e4		 brk #$e4
$0f:b179  00 e0		 brk #$e0
$0f:b17b  00 d0		 brk #$d0
$0f:b17d  00 90		 brk #$90
$0f:b17f  00 00		 brk #$00
$0f:b181  00 00		 brk #$00
$0f:b183  00 00		 brk #$00
$0f:b185  00 00		 brk #$00
$0f:b187  00 00		 brk #$00
$0f:b189  00 00		 brk #$00
$0f:b18b  00 00		 brk #$00
$0f:b18d  00 00		 brk #$00
$0f:b18f  00 00		 brk #$00
$0f:b191  00 00		 brk #$00
$0f:b193  00 00		 brk #$00
$0f:b195  00 00		 brk #$00
$0f:b197  00 00		 brk #$00
$0f:b199  00 00		 brk #$00
$0f:b19b  00 00		 brk #$00
$0f:b19d  00 00		 brk #$00
$0f:b19f  00 00		 brk #$00
$0f:b1a1  0a			asl a
$0f:b1a2  42 52		 wdm #$52
$0f:b1a4  10 18		 bpl $b1be
$0f:b1a6  08			php
$0f:b1a7  18			clc
$0f:b1a8  20 28 90	  jsr $9028
$0f:b1ab  b4 0a		 ldy $0a,x
$0f:b1ad  1a			inc a
$0f:b1ae  0d 18 00	  ora $0018
$0f:b1b1  00 00		 brk #$00
$0f:b1b3  00 00		 brk #$00
$0f:b1b5  00 00		 brk #$00
$0f:b1b7  00 00		 brk #$00
$0f:b1b9  00 00		 brk #$00
$0f:b1bb  00 04		 brk #$04
$0f:b1bd  00 07		 brk #$07
$0f:b1bf  00 00		 brk #$00
$0f:b1c1  00 00		 brk #$00
$0f:b1c3  00 00		 brk #$00
$0f:b1c5  00 00		 brk #$00
$0f:b1c7  00 00		 brk #$00
$0f:b1c9  00 00		 brk #$00
$0f:b1cb  00 00		 brk #$00
$0f:b1cd  00 00		 brk #$00
$0f:b1cf  00 00		 brk #$00
$0f:b1d1  00 00		 brk #$00
$0f:b1d3  00 00		 brk #$00
$0f:b1d5  00 00		 brk #$00
$0f:b1d7  00 00		 brk #$00
$0f:b1d9  00 00		 brk #$00
$0f:b1db  00 00		 brk #$00
$0f:b1dd  00 00		 brk #$00
$0f:b1df  00 00		 brk #$00
$0f:b1e1  00 00		 brk #$00
$0f:b1e3  00 00		 brk #$00
$0f:b1e5  00 00		 brk #$00
$0f:b1e7  01 01		 ora ($01,x)
$0f:b1e9  03 02		 ora $02,s
$0f:b1eb  02 00		 cop #$00
$0f:b1ed  04 05		 tsb $05
$0f:b1ef  04 00		 tsb $00
$0f:b1f1  00 00		 brk #$00
$0f:b1f3  00 00		 brk #$00
$0f:b1f5  00 00		 brk #$00
$0f:b1f7  00 00		 brk #$00
$0f:b1f9  00 01		 brk #$01
$0f:b1fb  00 03		 brk #$03
$0f:b1fd  00 03		 brk #$03
$0f:b1ff  00 00		 brk #$00
$0f:b201  00 00		 brk #$00
$0f:b203  00 00		 brk #$00
$0f:b205  00 00		 brk #$00
$0f:b207  00 00		 brk #$00
$0f:b209  00 00		 brk #$00
$0f:b20b  00 01		 brk #$01
$0f:b20d  00 00		 brk #$00
$0f:b20f  01 00		 ora ($00,x)
$0f:b211  00 00		 brk #$00
$0f:b213  00 00		 brk #$00
$0f:b215  00 00		 brk #$00
$0f:b217  00 00		 brk #$00
$0f:b219  00 00		 brk #$00
$0f:b21b  00 00		 brk #$00
$0f:b21d  00 00		 brk #$00
$0f:b21f  00 09		 brk #$09
$0f:b221  04 10		 tsb $10
$0f:b223  08			php
$0f:b224  20 10 40	  jsr $4010
$0f:b227  20 80 40	  jsr $4080
$0f:b22a  00 80		 brk #$80
$0f:b22c  00 00		 brk #$00
$0f:b22e  80 00		 bra $b230
$0f:b230  03 00		 ora $00,s
$0f:b232  04 00		 tsb $00
$0f:b234  00 00		 brk #$00
$0f:b236  00 00		 brk #$00
$0f:b238  00 00		 brk #$00
$0f:b23a  40			rti
$0f:b23b  00 80		 brk #$80
$0f:b23d  00 80		 brk #$80
$0f:b23f  00 00		 brk #$00
$0f:b241  00 00		 brk #$00
$0f:b243  00 00		 brk #$00
$0f:b245  00 01		 brk #$01
$0f:b247  00 02		 brk #$02
$0f:b249  01 02		 ora ($02,x)
$0f:b24b  01 04		 ora ($04,x)
$0f:b24d  02 04		 cop #$04
$0f:b24f  02 00		 cop #$00
$0f:b251  00 00		 brk #$00
$0f:b253  00 00		 brk #$00
$0f:b255  00 00		 brk #$00
$0f:b257  00 00		 brk #$00
$0f:b259  00 00		 brk #$00
$0f:b25b  00 01		 brk #$01
$0f:b25d  00 01		 brk #$01
$0f:b25f  00 23		 brk #$23
$0f:b261  10 4c		 bpl $b2af
$0f:b263  20 90 40	  jsr $4090
$0f:b266  20 80 40	  jsr $4080
$0f:b269  00 40		 brk #$40
$0f:b26b  00 80		 brk #$80
$0f:b26d  00 80		 brk #$80
$0f:b26f  00 0f		 brk #$0f
$0f:b271  00 1c		 brk #$1c
$0f:b273  00 30		 brk #$30
$0f:b275  00 60		 brk #$60
$0f:b277  00 c0		 brk #$c0
$0f:b279  00 c0		 brk #$c0
$0f:b27b  00 80		 brk #$80
$0f:b27d  00 80		 brk #$80
$0f:b27f  00 b6		 brk #$b6
$0f:b281  80 12		 bra $b295
$0f:b283  83 0a		 sta $0a,s
$0f:b285  48			pha
$0f:b286  44 27 2d	  mvp $2d,$27
$0f:b289  1e 0a 07	  asl $070a,x
$0f:b28c  00 00		 brk #$00
$0f:b28e  00 00		 brk #$00
$0f:b290  7f 00 7c 00   adc $007c00,x
$0f:b294  37 00		 and [$00],y
$0f:b296  18			clc
$0f:b297  00 00		 brk #$00
$0f:b299  00 00		 brk #$00
$0f:b29b  00 00		 brk #$00
$0f:b29d  00 00		 brk #$00
$0f:b29f  00 32		 brk #$32
$0f:b2a1  3c 78 80	  bit $8078,x
$0f:b2a4  a0 c0		 ldy #$c0
$0f:b2a6  d6 38		 dec $38,x
$0f:b2a8  00 00		 brk #$00
$0f:b2aa  b0 40		 bcs $b2ec
$0f:b2ac  00 00		 brk #$00
$0f:b2ae  00 00		 brk #$00
$0f:b2b0  c0 00		 cpy #$00
$0f:b2b2  00 00		 brk #$00
$0f:b2b4  00 00		 brk #$00
$0f:b2b6  00 00		 brk #$00
$0f:b2b8  00 00		 brk #$00
$0f:b2ba  00 00		 brk #$00
$0f:b2bc  00 00		 brk #$00
$0f:b2be  00 00		 brk #$00
$0f:b2c0  31 24		 and ($24),y
$0f:b2c2  04 14		 tsb $14
$0f:b2c4  12 30		 ora ($30)
$0f:b2c6  2b			pld
$0f:b2c7  08			php
$0f:b2c8  0b			phd
$0f:b2c9  18			clc
$0f:b2ca  11 08		 ora ($08),y
$0f:b2cc  08			php
$0f:b2cd  04 01		 tsb $01
$0f:b2cf  03 0b		 ora $0b,s
$0f:b2d1  00 2b		 brk #$2b
$0f:b2d3  00 0f		 brk #$0f
$0f:b2d5  00 15		 brk #$15
$0f:b2d7  02 06		 cop #$06
$0f:b2d9  01 07		 ora ($07,x)
$0f:b2db  00 03		 brk #$03
$0f:b2dd  00 00		 brk #$00
$0f:b2df  00 08		 brk #$08
$0f:b2e1  54 e4 5c	  mvn $5c,$e4
$0f:b2e4  98			tya
$0f:b2e5  1c 2c 28	  trb $282c
$0f:b2e8  c0 08		 cpy #$08
$0f:b2ea  88			dey
$0f:b2eb  10 10		 bpl $b2fd
$0f:b2ed  20 80 c0	  jsr $c080
$0f:b2f0  a0 00		 ldy #$00
$0f:b2f2  a0 00		 ldy #$00
$0f:b2f4  e0 00		 cpx #$00
$0f:b2f6  d0 00		 bne $b2f8
$0f:b2f8  f0 00		 beq $b2fa
$0f:b2fa  e0 00		 cpx #$00
$0f:b2fc  c0 00		 cpy #$00
$0f:b2fe  00 00		 brk #$00
$0f:b300  00 02		 brk #$02
$0f:b302  0e 04 03	  asl $0304
$0f:b305  06 09		 asl $09
$0f:b307  08			php
$0f:b308  03 08		 ora $08,s
$0f:b30a  03 00		 ora $00,s
$0f:b30c  05 00		 ora $00
$0f:b30e  06 02		 asl $02
$0f:b310  05 00		 ora $00
$0f:b312  09 00		 ora #$00
$0f:b314  09 00		 ora #$00
$0f:b316  03 00		 ora $00,s
$0f:b318  03 00		 ora $00,s
$0f:b31a  07 00		 ora [$00]
$0f:b31c  07 00		 ora [$00]
$0f:b31e  05 00		 ora $00
$0f:b320  80 20		 bra $b342
$0f:b322  b8			clv
$0f:b323  10 e0		 bpl $b305
$0f:b325  30 c8		 bmi $b2ef
$0f:b327  08			php
$0f:b328  e0 08		 cpx #$08
$0f:b32a  e0 00		 cpx #$00
$0f:b32c  d0 00		 bne $b32e
$0f:b32e  b0 20		 bcs $b350
$0f:b330  d0 00		 bne $b332
$0f:b332  c8			iny
$0f:b333  00 c8		 brk #$c8
$0f:b335  00 e0		 brk #$e0
$0f:b337  00 e0		 brk #$e0
$0f:b339  00 f0		 brk #$f0
$0f:b33b  00 f0		 brk #$f0
$0f:b33d  00 d0		 brk #$d0
$0f:b33f  00 0a		 brk #$0a
$0f:b341  0b			phd
$0f:b342  04 06		 tsb $06
$0f:b344  06 14		 asl $14
$0f:b346  04 14		 tsb $14
$0f:b348  0c 1c 14	  tsb $141c
$0f:b34b  0c 0c 04	  tsb $040c
$0f:b34e  02 06		 cop #$06
$0f:b350  04 00		 tsb $00
$0f:b352  08			php
$0f:b353  00 08		 brk #$08
$0f:b355  00 08		 brk #$08
$0f:b357  00 00		 brk #$00
$0f:b359  00 00		 brk #$00
$0f:b35b  00 00		 brk #$00
$0f:b35d  00 00		 brk #$00
$0f:b35f  00 a8		 brk #$a8
$0f:b361  e8			inx
$0f:b362  10 b0		 bpl $b314
$0f:b364  30 14		 bmi $b37a
$0f:b366  10 14		 bpl $b37c
$0f:b368  18			clc
$0f:b369  1c 14 18	  trb $1814
$0f:b36c  18			clc
$0f:b36d  10 20		 bpl $b38f
$0f:b36f  30 10		 bmi $b381
$0f:b371  00 08		 brk #$08
$0f:b373  00 08		 brk #$08
$0f:b375  00 08		 brk #$08
$0f:b377  00 00		 brk #$00
$0f:b379  00 00		 brk #$00
$0f:b37b  00 00		 brk #$00
$0f:b37d  00 00		 brk #$00
$0f:b37f  00 04		 brk #$04
$0f:b381  04 40		 tsb $40
$0f:b383  40			rti
$0f:b384  08			php
$0f:b385  0c 24 77	  tsb $7724
$0f:b388  13 bb		 ora ($bb,s),y
$0f:b38a  01 04		 ora ($04,x)
$0f:b38c  42 c2		 wdm #$c2
$0f:b38e  01 00		 ora ($00,x)
$0f:b390  00 00		 brk #$00
$0f:b392  00 00		 brk #$00
$0f:b394  00 00		 brk #$00
$0f:b396  00 00		 brk #$00
$0f:b398  00 00		 brk #$00
$0f:b39a  03 00		 ora $00,s
$0f:b39c  01 00		 ora ($00,x)
$0f:b39e  01 00		 ora ($00,x)
$0f:b3a0  12 30		 ora ($30)
$0f:b3a2  10 30		 bpl $b3d4
$0f:b3a4  00 c0		 brk #$c0
$0f:b3a6  c0 c0		 cpy #$c0
$0f:b3a8  00 00		 brk #$00
$0f:b3aa  00 00		 brk #$00
$0f:b3ac  80 00		 bra $b3ae
$0f:b3ae  00 00		 brk #$00
$0f:b3b0  0f 00 0c 00   ora $000c00
$0f:b3b4  30 00		 bmi $b3b6
$0f:b3b6  20 00 c0	  jsr $c000
$0f:b3b9  00 c0		 brk #$c0
$0f:b3bb  00 80		 brk #$80
$0f:b3bd  00 80		 brk #$80
$0f:b3bf  00 00		 brk #$00
$0f:b3c1  00 00		 brk #$00
$0f:b3c3  00 00		 brk #$00
$0f:b3c5  00 00		 brk #$00
$0f:b3c7  00 00		 brk #$00
$0f:b3c9  00 01		 brk #$01
$0f:b3cb  03 04		 ora $04,s
$0f:b3cd  0c 09 18	  tsb $1809
$0f:b3d0  00 00		 brk #$00
$0f:b3d2  00 00		 brk #$00
$0f:b3d4  00 00		 brk #$00
$0f:b3d6  00 00		 brk #$00
$0f:b3d8  00 00		 brk #$00
$0f:b3da  00 00		 brk #$00
$0f:b3dc  03 00		 ora $00,s
$0f:b3de  07 00		 ora [$00]
$0f:b3e0  09 08		 ora #$08
$0f:b3e2  10 30		 bpl $b414
$0f:b3e4  00 40		 brk #$40
$0f:b3e6  40			rti
$0f:b3e7  40			rti
$0f:b3e8  80 80		 bra $b36a
$0f:b3ea  00 00		 brk #$00
$0f:b3ec  00 00		 brk #$00
$0f:b3ee  80 00		 bra $b3f0
$0f:b3f0  07 00		 ora [$00]
$0f:b3f2  0c 00 30	  tsb $3000
$0f:b3f5  00 20		 brk #$20
$0f:b3f7  00 40		 brk #$40
$0f:b3f9  00 c0		 brk #$c0
$0f:b3fb  00 80		 brk #$80
$0f:b3fd  00 80		 brk #$80
$0f:b3ff  00 00		 brk #$00
$0f:b401  00 00		 brk #$00
$0f:b403  00 00		 brk #$00
$0f:b405  00 00		 brk #$00
$0f:b407  00 00		 brk #$00
$0f:b409  00 00		 brk #$00
$0f:b40b  00 00		 brk #$00
$0f:b40d  00 01		 brk #$01
$0f:b40f  00 00		 brk #$00
$0f:b411  00 00		 brk #$00
$0f:b413  00 00		 brk #$00
$0f:b415  00 00		 brk #$00
$0f:b417  00 00		 brk #$00
$0f:b419  00 00		 brk #$00
$0f:b41b  00 00		 brk #$00
$0f:b41d  00 00		 brk #$00
$0f:b41f  00 00		 brk #$00
$0f:b421  00 00		 brk #$00
$0f:b423  00 00		 brk #$00
$0f:b425  00 07		 brk #$07
$0f:b427  00 18		 brk #$18
$0f:b429  07 60		 ora [$60]
$0f:b42b  18			clc
$0f:b42c  87 60		 sta [$60]
$0f:b42e  1f 80 00 00   ora $000080,x
$0f:b432  00 00		 brk #$00
$0f:b434  00 00		 brk #$00
$0f:b436  00 00		 brk #$00
$0f:b438  00 00		 brk #$00
$0f:b43a  07 00		 ora [$00]
$0f:b43c  1f 00 78 07   ora $077800,x
$0f:b440  00 00		 brk #$00
$0f:b442  00 00		 brk #$00
$0f:b444  00 00		 brk #$00
$0f:b446  01 00		 ora ($00,x)
$0f:b448  02 01		 cop #$01
$0f:b44a  04 02		 tsb $02
$0f:b44c  08			php
$0f:b44d  04 11		 tsb $11
$0f:b44f  08			php
$0f:b450  00 00		 brk #$00
$0f:b452  00 00		 brk #$00
$0f:b454  00 00		 brk #$00
$0f:b456  00 00		 brk #$00
$0f:b458  00 00		 brk #$00
$0f:b45a  01 00		 ora ($00,x)
$0f:b45c  03 00		 ora $00,s
$0f:b45e  07 00		 ora [$00]
$0f:b460  00 00		 brk #$00
$0f:b462  0f 00 70 0f   ora $0f7000
$0f:b466  80 70		 bra $b4d8
$0f:b468  0f 80 3f 00   ora $003f80
$0f:b46c  ff 00 ff 00   sbc $00ff00,x
$0f:b470  00 00		 brk #$00
$0f:b472  00 00		 brk #$00
$0f:b474  00 00		 brk #$00
$0f:b476  0f 00 7f 00   ora $007f00
$0f:b47a  f0 0f		 beq $b48b
$0f:b47c  c0 3f		 cpy #$3f
$0f:b47e  80 7f		 bra $b4ff
$0f:b480  00 00		 brk #$00
$0f:b482  00 00		 brk #$00
$0f:b484  02 01		 cop #$01
$0f:b486  09 04		 ora #$04
$0f:b488  00 08		 brk #$08
$0f:b48a  10 00		 bpl $b48c
$0f:b48c  08			php
$0f:b48d  10 00		 bpl $b48f
$0f:b48f  00 00		 brk #$00
$0f:b491  00 00		 brk #$00
$0f:b493  00 00		 brk #$00
$0f:b495  00 03		 brk #$03
$0f:b497  00 04		 brk #$04
$0f:b499  00 08		 brk #$08
$0f:b49b  00 08		 brk #$08
$0f:b49d  00 10		 brk #$10
$0f:b49f  00 0c		 brk #$0c
$0f:b4a1  02 24		 cop #$24
$0f:b4a3  10 00		 bpl $b4a5
$0f:b4a5  00 00		 brk #$00
$0f:b4a7  00 00		 brk #$00
$0f:b4a9  00 00		 brk #$00
$0f:b4ab  00 00		 brk #$00
$0f:b4ad  00 00		 brk #$00
$0f:b4af  00 01		 brk #$01
$0f:b4b1  00 0c		 brk #$0c
$0f:b4b3  00 80		 brk #$80
$0f:b4b5  00 00		 brk #$00
$0f:b4b7  00 00		 brk #$00
$0f:b4b9  00 00		 brk #$00
$0f:b4bb  00 00		 brk #$00
$0f:b4bd  00 00		 brk #$00
$0f:b4bf  00 00		 brk #$00
$0f:b4c1  00 00		 brk #$00
$0f:b4c3  00 00		 brk #$00
$0f:b4c5  00 00		 brk #$00
$0f:b4c7  00 01		 brk #$01
$0f:b4c9  00 05		 brk #$05
$0f:b4cb  01 1f		 ora ($1f,x)
$0f:b4cd  00 7f		 brk #$7f
$0f:b4cf  00 00		 brk #$00
$0f:b4d1  00 00		 brk #$00
$0f:b4d3  00 00		 brk #$00
$0f:b4d5  00 00		 brk #$00
$0f:b4d7  00 01		 brk #$01
$0f:b4d9  00 06		 brk #$06
$0f:b4db  00 1f		 brk #$1f
$0f:b4dd  00 ff		 brk #$ff
$0f:b4df  00 00		 brk #$00
$0f:b4e1  00 00		 brk #$00
$0f:b4e3  00 00		 brk #$00
$0f:b4e5  00 50		 brk #$50
$0f:b4e7  18			clc
$0f:b4e8  43 60		 eor $60,s
$0f:b4ea  6d a1 3e	  adc $3ea1
$0f:b4ed  00 ff		 brk #$ff
$0f:b4ef  00 00		 brk #$00
$0f:b4f1  00 00		 brk #$00
$0f:b4f3  00 00		 brk #$00
$0f:b4f5  00 60		 brk #$60
$0f:b4f7  00 87		 brk #$87
$0f:b4f9  00 1e		 brk #$1e
$0f:b4fb  00 ff		 brk #$ff
$0f:b4fd  00 ff		 brk #$ff
$0f:b4ff  00 00		 brk #$00
$0f:b501  00 00		 brk #$00
$0f:b503  00 04		 brk #$04
$0f:b505  06 50		 asl $50
$0f:b507  19 44 6c	  ora $6c44,y
$0f:b50a  63 a3		 adc $a3,s
$0f:b50c  39 01 fe	  and $fe01,y
$0f:b50f  00 00		 brk #$00
$0f:b511  00 00		 brk #$00
$0f:b513  00 18		 brk #$18
$0f:b515  00 e0		 brk #$e0
$0f:b517  00 83		 brk #$83
$0f:b519  00 1c		 brk #$1c
$0f:b51b  00 fe		 brk #$fe
$0f:b51d  00 ff		 brk #$ff
$0f:b51f  00 00		 brk #$00
$0f:b521  00 00		 brk #$00
$0f:b523  00 04		 brk #$04
$0f:b525  38			sec
$0f:b526  8a			txa
$0f:b527  8c 7e 7f	  sty $7f7e
$0f:b52a  a1 c1		 lda ($c1,x)
$0f:b52c  00 80		 brk #$80
$0f:b52e  80 c0		 bra $b4f0
$0f:b530  00 00		 brk #$00
$0f:b532  00 00		 brk #$00
$0f:b534  00 00		 brk #$00
$0f:b536  70 00		 bvs $b538
$0f:b538  80 00		 bra $b53a
$0f:b53a  00 00		 brk #$00
$0f:b53c  00 00		 brk #$00
$0f:b53e  00 00		 brk #$00
$0f:b540  00 00		 brk #$00
$0f:b542  00 00		 brk #$00
$0f:b544  00 08		 brk #$08
$0f:b546  08			php
$0f:b547  1c 00 08	  trb $0800
$0f:b54a  00 00		 brk #$00
$0f:b54c  00 00		 brk #$00
$0f:b54e  00 00		 brk #$00
$0f:b550  00 00		 brk #$00
$0f:b552  00 00		 brk #$00
$0f:b554  00 00		 brk #$00
$0f:b556  00 00		 brk #$00
$0f:b558  00 00		 brk #$00
$0f:b55a  00 00		 brk #$00
$0f:b55c  00 00		 brk #$00
$0f:b55e  00 00		 brk #$00
$0f:b560  00 08		 brk #$08
$0f:b562  08			php
$0f:b563  08			php
$0f:b564  00 14		 brk #$14
$0f:b566  2a			rol a
$0f:b567  63 00		 adc $00,s
$0f:b569  14 08		 trb $08
$0f:b56b  08			php
$0f:b56c  00 08		 brk #$08
$0f:b56e  00 00		 brk #$00
$0f:b570  00 00		 brk #$00
$0f:b572  00 00		 brk #$00
$0f:b574  08			php
$0f:b575  00 1c		 brk #$1c
$0f:b577  00 08		 brk #$08
$0f:b579  00 00		 brk #$00
$0f:b57b  00 00		 brk #$00
$0f:b57d  00 00		 brk #$00
$0f:b57f  00 00		 brk #$00
$0f:b581  00 00		 brk #$00
$0f:b583  00 00		 brk #$00
$0f:b585  00 00		 brk #$00
$0f:b587  00 00		 brk #$00
$0f:b589  00 00		 brk #$00
$0f:b58b  00 00		 brk #$00
$0f:b58d  00 00		 brk #$00
$0f:b58f  00 00		 brk #$00
$0f:b591  00 00		 brk #$00
$0f:b593  00 00		 brk #$00
$0f:b595  00 00		 brk #$00
$0f:b597  00 00		 brk #$00
$0f:b599  00 00		 brk #$00
$0f:b59b  00 00		 brk #$00
$0f:b59d  00 00		 brk #$00
$0f:b59f  00 00		 brk #$00
$0f:b5a1  01 01		 ora ($01,x)
$0f:b5a3  03 02		 ora $02,s
$0f:b5a5  06 06		 asl $06
$0f:b5a7  0e 0d 1c	  asl $1c0d
$0f:b5aa  0b			phd
$0f:b5ab  18			clc
$0f:b5ac  0b			phd
$0f:b5ad  18			clc
$0f:b5ae  05 0c		 ora $0c
$0f:b5b0  00 00		 brk #$00
$0f:b5b2  00 00		 brk #$00
$0f:b5b4  01 00		 ora ($00,x)
$0f:b5b6  01 00		 ora ($00,x)
$0f:b5b8  03 00		 ora $00,s
$0f:b5ba  07 00		 ora [$00]
$0f:b5bc  07 00		 ora [$00]
$0f:b5be  03 00		 ora $00,s
$0f:b5c0  00 00		 brk #$00
$0f:b5c2  00 00		 brk #$00
$0f:b5c4  00 00		 brk #$00
$0f:b5c6  00 00		 brk #$00
$0f:b5c8  00 00		 brk #$00
$0f:b5ca  00 00		 brk #$00
$0f:b5cc  00 00		 brk #$00
$0f:b5ce  00 00		 brk #$00
$0f:b5d0  00 00		 brk #$00
$0f:b5d2  00 00		 brk #$00
$0f:b5d4  00 00		 brk #$00
$0f:b5d6  00 00		 brk #$00
$0f:b5d8  00 00		 brk #$00
$0f:b5da  00 00		 brk #$00
$0f:b5dc  00 00		 brk #$00
$0f:b5de  00 00		 brk #$00
$0f:b5e0  00 00		 brk #$00
$0f:b5e2  00 00		 brk #$00
$0f:b5e4  00 00		 brk #$00
$0f:b5e6  00 00		 brk #$00
$0f:b5e8  00 00		 brk #$00
$0f:b5ea  00 00		 brk #$00
$0f:b5ec  00 00		 brk #$00
$0f:b5ee  01 03		 ora ($03,x)
$0f:b5f0  00 00		 brk #$00
$0f:b5f2  00 00		 brk #$00
$0f:b5f4  00 00		 brk #$00
$0f:b5f6  00 00		 brk #$00
$0f:b5f8  00 00		 brk #$00
$0f:b5fa  00 00		 brk #$00
$0f:b5fc  00 00		 brk #$00
$0f:b5fe  00 00		 brk #$00
$0f:b600  02 01		 cop #$01
$0f:b602  04 02		 tsb $02
$0f:b604  04 02		 tsb $02
$0f:b606  09 04		 ora #$04
$0f:b608  09 04		 ora #$04
$0f:b60a  13 08		 ora ($08,s),y
$0f:b60c  13 08		 ora ($08,s),y
$0f:b60e  13 08		 ora ($08,s),y
$0f:b610  00 00		 brk #$00
$0f:b612  01 00		 ora ($00,x)
$0f:b614  01 00		 ora ($00,x)
$0f:b616  03 00		 ora $00,s
$0f:b618  03 00		 ora $00,s
$0f:b61a  06 01		 asl $01
$0f:b61c  06 01		 asl $01
$0f:b61e  06 01		 asl $01
$0f:b620  7f 00 fc 00   adc $00fc00,x
$0f:b624  f0 00		 beq $b626
$0f:b626  e0 00		 cpx #$00
$0f:b628  c0 00		 cpy #$00
$0f:b62a  c0 00		 cpy #$00
$0f:b62c  80 00		 bra $b62e
$0f:b62e  80 00		 bra $b630
$0f:b630  e0 1f		 cpx #$1f
$0f:b632  80 7c		 bra $b6b0
$0f:b634  80 70		 bra $b6a6
$0f:b636  00 e0		 brk #$e0
$0f:b638  00 c0		 brk #$c0
$0f:b63a  00 c0		 brk #$c0
$0f:b63c  00 80		 brk #$80
$0f:b63e  00 80		 brk #$80
$0f:b640  13 08		 ora ($08,s),y
$0f:b642  23 10		 and $10,s
$0f:b644  27 10		 and [$10]
$0f:b646  27 10		 and [$10]
$0f:b648  4f 20 4f 20   eor $204f20
$0f:b64c  4f 20 4f 20   eor $204f20
$0f:b650  07 00		 ora [$00]
$0f:b652  0e 01 0c	  asl $0c01
$0f:b655  03 0c		 ora $0c,s
$0f:b657  03 1c		 ora $1c,s
$0f:b659  03 18		 ora $18,s
$0f:b65b  07 18		 ora [$18]
$0f:b65d  07 18		 ora [$18]
$0f:b65f  07 ff		 ora [$ff]
$0f:b661  00 fc		 brk #$fc
$0f:b663  00 f0		 brk #$f0
$0f:b665  00 e0		 brk #$e0
$0f:b667  00 c0		 brk #$c0
$0f:b669  00 c0		 brk #$c0
$0f:b66b  00 80		 brk #$80
$0f:b66d  00 80		 brk #$80
$0f:b66f  00 00		 brk #$00
$0f:b671  ff 00 fc 00   sbc $00fc00,x
$0f:b675  f0 00		 beq $b677
$0f:b677  e0 00		 cpx #$00
$0f:b679  c0 00		 cpy #$00
$0f:b67b  c0 00		 cpy #$00
$0f:b67d  80 00		 bra $b67f
$0f:b67f  80 00		 bra $b681
$0f:b681  00 00		 brk #$00
$0f:b683  00 40		 brk #$40
$0f:b685  00 00		 brk #$00
$0f:b687  40			rti
$0f:b688  80 00		 bra $b68a
$0f:b68a  c0 00		 cpy #$00
$0f:b68c  00 80		 brk #$80
$0f:b68e  00 00		 brk #$00
$0f:b690  00 00		 brk #$00
$0f:b692  00 00		 brk #$00
$0f:b694  00 00		 brk #$00
$0f:b696  00 00		 brk #$00
$0f:b698  40			rti
$0f:b699  00 40		 brk #$40
$0f:b69b  00 00		 brk #$00
$0f:b69d  00 80		 brk #$80
$0f:b69f  00 00		 brk #$00
$0f:b6a1  00 00		 brk #$00
$0f:b6a3  00 00		 brk #$00
$0f:b6a5  00 00		 brk #$00
$0f:b6a7  00 00		 brk #$00
$0f:b6a9  00 00		 brk #$00
$0f:b6ab  00 00		 brk #$00
$0f:b6ad  00 00		 brk #$00
$0f:b6af  00 00		 brk #$00
$0f:b6b1  00 00		 brk #$00
$0f:b6b3  00 00		 brk #$00
$0f:b6b5  00 00		 brk #$00
$0f:b6b7  00 00		 brk #$00
$0f:b6b9  00 00		 brk #$00
$0f:b6bb  00 00		 brk #$00
$0f:b6bd  00 00		 brk #$00
$0f:b6bf  00 1f		 brk #$1f
$0f:b6c1  00 05		 brk #$05
$0f:b6c3  01 01		 ora ($01,x)
$0f:b6c5  00 00		 brk #$00
$0f:b6c7  00 00		 brk #$00
$0f:b6c9  00 00		 brk #$00
$0f:b6cb  00 00		 brk #$00
$0f:b6cd  00 00		 brk #$00
$0f:b6cf  00 1f		 brk #$1f
$0f:b6d1  00 06		 brk #$06
$0f:b6d3  00 01		 brk #$01
$0f:b6d5  00 00		 brk #$00
$0f:b6d7  00 00		 brk #$00
$0f:b6d9  00 00		 brk #$00
$0f:b6db  00 00		 brk #$00
$0f:b6dd  00 00		 brk #$00
$0f:b6df  00 3e		 brk #$3e
$0f:b6e1  00 6d		 brk #$6d
$0f:b6e3  a1 43		 lda ($43,x)
$0f:b6e5  60			rts
$0f:b6e6  50 18		 bvc $b700
$0f:b6e8  00 00		 brk #$00
$0f:b6ea  00 00		 brk #$00
$0f:b6ec  00 00		 brk #$00
$0f:b6ee  00 00		 brk #$00
$0f:b6f0  ff 00 1e 00   sbc $001e00,x
$0f:b6f4  87 00		 sta [$00]
$0f:b6f6  60			rts
$0f:b6f7  00 00		 brk #$00
$0f:b6f9  00 00		 brk #$00
$0f:b6fb  00 00		 brk #$00
$0f:b6fd  00 00		 brk #$00
$0f:b6ff  00 39		 brk #$39
$0f:b701  01 63		 ora ($63,x)
$0f:b703  a3 44		 lda $44,s
$0f:b705  6c 50 19	  jmp ($1950)
$0f:b708  04 06		 tsb $06
$0f:b70a  00 00		 brk #$00
$0f:b70c  00 00		 brk #$00
$0f:b70e  00 00		 brk #$00
$0f:b710  fe 00 1c	  inc $1c00,x
$0f:b713  00 83		 brk #$83
$0f:b715  00 e0		 brk #$e0
$0f:b717  00 18		 brk #$18
$0f:b719  00 00		 brk #$00
$0f:b71b  00 00		 brk #$00
$0f:b71d  00 00		 brk #$00
$0f:b71f  00 00		 brk #$00
$0f:b721  80 a1		 bra $b6c4
$0f:b723  c1 7e		 cmp ($7e,x)
$0f:b725  7f 8a 8c 04   adc $048c8a,x
$0f:b729  38			sec
$0f:b72a  00 00		 brk #$00
$0f:b72c  00 00		 brk #$00
$0f:b72e  00 00		 brk #$00
$0f:b730  00 00		 brk #$00
$0f:b732  00 00		 brk #$00
$0f:b734  80 00		 bra $b736
$0f:b736  70 00		 bvs $b738
$0f:b738  00 00		 brk #$00
$0f:b73a  00 00		 brk #$00
$0f:b73c  00 00		 brk #$00
$0f:b73e  00 00		 brk #$00
$0f:b740  00 00		 brk #$00
$0f:b742  00 08		 brk #$08
$0f:b744  08			php
$0f:b745  08			php
$0f:b746  14 36		 trb $36
$0f:b748  08			php
$0f:b749  08			php
$0f:b74a  00 08		 brk #$08
$0f:b74c  00 00		 brk #$00
$0f:b74e  00 00		 brk #$00
$0f:b750  00 00		 brk #$00
$0f:b752  00 00		 brk #$00
$0f:b754  00 00		 brk #$00
$0f:b756  08			php
$0f:b757  00 00		 brk #$00
$0f:b759  00 00		 brk #$00
$0f:b75b  00 00		 brk #$00
$0f:b75d  00 00		 brk #$00
$0f:b75f  00 00		 brk #$00
$0f:b761  08			php
$0f:b762  00 00		 brk #$00
$0f:b764  00 00		 brk #$00
$0f:b766  00 41		 brk #$41
$0f:b768  00 00		 brk #$00
$0f:b76a  00 00		 brk #$00
$0f:b76c  00 08		 brk #$08
$0f:b76e  00 00		 brk #$00
$0f:b770  00 00		 brk #$00
$0f:b772  00 00		 brk #$00
$0f:b774  00 00		 brk #$00
$0f:b776  00 00		 brk #$00
$0f:b778  00 00		 brk #$00
$0f:b77a  00 00		 brk #$00
$0f:b77c  00 00		 brk #$00
$0f:b77e  00 00		 brk #$00
$0f:b780  00 00		 brk #$00
$0f:b782  00 00		 brk #$00
$0f:b784  00 00		 brk #$00
$0f:b786  00 0e		 brk #$0e
$0f:b788  0e 1f 19	  asl $191f
$0f:b78b  39 36 70	  and $7036,y
$0f:b78e  4f c0 00 00   eor $0000c0
$0f:b792  00 00		 brk #$00
$0f:b794  00 00		 brk #$00
$0f:b796  00 00		 brk #$00
$0f:b798  00 00		 brk #$00
$0f:b79a  06 00		 asl $00
$0f:b79c  0f 00 3f 00   ora $003f00
$0f:b7a0  09 08		 ora #$08
$0f:b7a2  10 30		 bpl $b7d4
$0f:b7a4  00 40		 brk #$40
$0f:b7a6  40			rti
$0f:b7a7  40			rti
$0f:b7a8  80 80		 bra $b72a
$0f:b7aa  00 00		 brk #$00
$0f:b7ac  00 00		 brk #$00
$0f:b7ae  80 00		 bra $b7b0
$0f:b7b0  07 00		 ora [$00]
$0f:b7b2  0c 00 30	  tsb $3000
$0f:b7b5  00 20		 brk #$20
$0f:b7b7  00 40		 brk #$40
$0f:b7b9  00 c0		 brk #$c0
$0f:b7bb  00 80		 brk #$80
$0f:b7bd  00 80		 brk #$80
$0f:b7bf  00 00		 brk #$00
$0f:b7c1  00 00		 brk #$00
$0f:b7c3  00 00		 brk #$00
$0f:b7c5  00 00		 brk #$00
$0f:b7c7  00 00		 brk #$00
$0f:b7c9  00 00		 brk #$00
$0f:b7cb  00 00		 brk #$00
$0f:b7cd  01 01		 ora ($01,x)
$0f:b7cf  01 00		 ora ($00,x)
$0f:b7d1  00 00		 brk #$00
$0f:b7d3  00 00		 brk #$00
$0f:b7d5  00 00		 brk #$00
$0f:b7d7  00 00		 brk #$00
$0f:b7d9  00 00		 brk #$00
$0f:b7db  00 00		 brk #$00
$0f:b7dd  00 00		 brk #$00
$0f:b7df  00 04		 brk #$04
$0f:b7e1  0c 10 10	  tsb $1010
$0f:b7e4  00 20		 brk #$20
$0f:b7e6  40			rti
$0f:b7e7  40			rti
$0f:b7e8  00 80		 brk #$80
$0f:b7ea  80 80		 bra $b76c
$0f:b7ec  00 00		 brk #$00
$0f:b7ee  00 00		 brk #$00
$0f:b7f0  03 00		 ora $00,s
$0f:b7f2  0c 00 10	  tsb $1000
$0f:b7f5  00 20		 brk #$20
$0f:b7f7  00 40		 brk #$40
$0f:b7f9  00 40		 brk #$40
$0f:b7fb  00 80		 brk #$80
$0f:b7fd  00 80		 brk #$80
$0f:b7ff  00 00		 brk #$00
$0f:b801  00 00		 brk #$00
$0f:b803  00 01		 brk #$01
$0f:b805  03 04		 ora $04,s
$0f:b807  0c 09 0b	  tsb $0b09
$0f:b80a  01 15		 ora ($15,x)
$0f:b80c  12 1a		 ora ($1a)
$0f:b80e  0e 27 00	  asl $0027
$0f:b811  00 00		 brk #$00
$0f:b813  00 00		 brk #$00
$0f:b815  03 03		 ora $03,s
$0f:b817  0f 07 0f 0e   ora $0e0f07
$0f:b81b  1f 0d 1f 1f   ora $1f1f0d,x
$0f:b81f  3f 03 0f 14   and $140f03,x
$0f:b823  33 6c		 and ($6c,s),y
$0f:b825  1f ad 6c 0d   ora $0d6cad,x
$0f:b829  3e 4b 65	  rol $654b,x
$0f:b82c  92 de		 sta ($de)
$0f:b82e  a0 20		 ldy #$20
$0f:b830  00 0f		 brk #$0f
$0f:b832  0f 3f ff ff   ora $ffff3f
$0f:b836  f3 ff		 sbc ($ff,s),y
$0f:b838  ff ff fe ff   sbc $fffeff,x
$0f:b83c  e0 fe		 cpx #$fe
$0f:b83e  c0 e0		 cpy #$e0
$0f:b840  00 00		 brk #$00
$0f:b842  00 00		 brk #$00
$0f:b844  00 03		 brk #$03
$0f:b846  01 04		 ora ($04,x)
$0f:b848  06 05		 asl $05
$0f:b84a  00 0a		 brk #$0a
$0f:b84c  0e 0b 10	  asl $100b
$0f:b84f  16 00		 asl $00,x
$0f:b851  00 00		 brk #$00
$0f:b853  00 00		 brk #$00
$0f:b855  03 03		 ora $03,s
$0f:b857  07 03		 ora [$03]
$0f:b859  07 07		 ora [$07]
$0f:b85b  0f 07 0f 0f   ora $0f0f07
$0f:b85f  1f 03 07 0b   ora $0b0703,x
$0f:b863  38			sec
$0f:b864  d7 cf		 cmp [$cf],y
$0f:b866  fa			plx
$0f:b867  72 54		 adc ($54)
$0f:b869  63 b9		 adc $b9,s
$0f:b86b  d9 22 a7	  cmp $a722,y
$0f:b86e  40			rti
$0f:b86f  40			rti
$0f:b870  00 07		 brk #$07
$0f:b872  07 3f		 ora [$3f]
$0f:b874  3f ff fd ff   and $fffdff,x
$0f:b878  bf ff 66 ff   lda $ff66ff,x
$0f:b87c  c0 e7		 cpy #$e7
$0f:b87e  80 c0		 bra $b840
$0f:b880  00 00		 brk #$00
$0f:b882  00 00		 brk #$00
$0f:b884  00 00		 brk #$00
$0f:b886  00 00		 brk #$00
$0f:b888  00 00		 brk #$00
$0f:b88a  00 00		 brk #$00
$0f:b88c  00 00		 brk #$00
$0f:b88e  00 00		 brk #$00
$0f:b890  00 00		 brk #$00
$0f:b892  00 00		 brk #$00
$0f:b894  00 00		 brk #$00
$0f:b896  00 00		 brk #$00
$0f:b898  00 00		 brk #$00
$0f:b89a  00 00		 brk #$00
$0f:b89c  00 00		 brk #$00
$0f:b89e  00 00		 brk #$00
$0f:b8a0  00 00		 brk #$00
$0f:b8a2  00 00		 brk #$00
$0f:b8a4  00 00		 brk #$00
$0f:b8a6  00 00		 brk #$00
$0f:b8a8  00 00		 brk #$00
$0f:b8aa  02 02		 cop #$02
$0f:b8ac  08			php
$0f:b8ad  0b			phd
$0f:b8ae  21 2d		 and ($2d,x)
$0f:b8b0  00 00		 brk #$00
$0f:b8b2  00 00		 brk #$00
$0f:b8b4  00 00		 brk #$00
$0f:b8b6  00 00		 brk #$00
$0f:b8b8  00 00		 brk #$00
$0f:b8ba  01 03		 ora ($03,x)
$0f:b8bc  07 0f		 ora [$0f]
$0f:b8be  1e 3f 08	  asl $083f,x
$0f:b8c1  08			php
$0f:b8c2  10 10		 bpl $b8d4
$0f:b8c4  08			php
$0f:b8c5  00 18		 brk #$18
$0f:b8c7  10 00		 bpl $b8c9
$0f:b8c9  10 00		 bpl $b8cb
$0f:b8cb  00 08		 brk #$08
$0f:b8cd  08			php
$0f:b8ce  00 08		 brk #$08
$0f:b8d0  00 00		 brk #$00
$0f:b8d2  08			php
$0f:b8d3  00 18		 brk #$18
$0f:b8d5  00 08		 brk #$08
$0f:b8d7  00 08		 brk #$08
$0f:b8d9  00 08		 brk #$08
$0f:b8db  00 00		 brk #$00
$0f:b8dd  00 00		 brk #$00
$0f:b8df  00 00		 brk #$00
$0f:b8e1  00 00		 brk #$00
$0f:b8e3  00 00		 brk #$00
$0f:b8e5  00 00		 brk #$00
$0f:b8e7  00 00		 brk #$00
$0f:b8e9  00 03		 brk #$03
$0f:b8eb  00 0c		 brk #$0c
$0f:b8ed  03 12		 ora $12,s
$0f:b8ef  0e 00 00	  asl $0000
$0f:b8f2  00 00		 brk #$00
$0f:b8f4  00 00		 brk #$00
$0f:b8f6  00 00		 brk #$00
$0f:b8f8  00 00		 brk #$00
$0f:b8fa  03 00		 ora $00,s
$0f:b8fc  0f 00 1e 01   ora $011e00
$0f:b900  00 00		 brk #$00
$0f:b902  00 00		 brk #$00
$0f:b904  00 00		 brk #$00
$0f:b906  02 01		 cop #$01
$0f:b908  04 03		 tsb $03
$0f:b90a  08			php
$0f:b90b  04 09		 tsb $09
$0f:b90d  00 02		 brk #$02
$0f:b90f  09 00		 ora #$00
$0f:b911  00 00		 brk #$00
$0f:b913  00 00		 brk #$00
$0f:b915  00 03		 brk #$03
$0f:b917  00 07		 brk #$07
$0f:b919  00 0c		 brk #$0c
$0f:b91b  00 09		 brk #$09
$0f:b91d  00 0b		 brk #$0b
$0f:b91f  00 03		 brk #$03
$0f:b921  00 24		 brk #$24
$0f:b923  13 54		 ora ($54,s),y
$0f:b925  08			php
$0f:b926  01 80		 ora ($80,x)
$0f:b928  02 01		 cop #$01
$0f:b92a  14 20		 trb $20
$0f:b92c  0a			asl a
$0f:b92d  84 10		 sty $10
$0f:b92f  00 03		 brk #$03
$0f:b931  00 37		 brk #$37
$0f:b933  00 5c		 brk #$5c
$0f:b935  00 81		 brk #$81
$0f:b937  00 03		 brk #$03
$0f:b939  00 34		 brk #$34
$0f:b93b  00 8e		 brk #$8e
$0f:b93d  00 10		 brk #$10
$0f:b93f  00 02		 brk #$02
$0f:b941  01 03		 ora ($03,x)
$0f:b943  07 12		 ora [$12]
$0f:b945  08			php
$0f:b946  11 34		 ora ($34),y
$0f:b948  5a			phy
$0f:b949  3a			dec a
$0f:b94a  2d 64 97	  and $9764
$0f:b94d  40			rti
$0f:b94e  4b			phk
$0f:b94f  c8			iny
$0f:b950  03 00		 ora $00,s
$0f:b952  07 00		 ora [$00]
$0f:b954  18			clc
$0f:b955  07 34		 ora [$34]
$0f:b957  0b			phd
$0f:b958  7a			ply
$0f:b959  05 64		 ora $64
$0f:b95b  1b			tcs
$0f:b95c  c0 3f		 cpy #$3f
$0f:b95e  c8			iny
$0f:b95f  37 08		 and [$08],y
$0f:b961  08			php
$0f:b962  00 00		 brk #$00
$0f:b964  00 00		 brk #$00
$0f:b966  08			php
$0f:b967  08			php
$0f:b968  00 08		 brk #$08
$0f:b96a  00 00		 brk #$00
$0f:b96c  00 00		 brk #$00
$0f:b96e  00 00		 brk #$00
$0f:b970  00 00		 brk #$00
$0f:b972  08			php
$0f:b973  00 08		 brk #$08
$0f:b975  00 00		 brk #$00
$0f:b977  00 00		 brk #$00
$0f:b979  00 00		 brk #$00
$0f:b97b  00 00		 brk #$00
$0f:b97d  00 00		 brk #$00
$0f:b97f  00 7f		 brk #$7f
$0f:b981  1c 0f 00	  trb $000f
$0f:b984  05 01		 ora $01
$0f:b986  01 00		 ora ($00,x)
$0f:b988  00 00		 brk #$00
$0f:b98a  00 00		 brk #$00
$0f:b98c  00 00		 brk #$00
$0f:b98e  01 01		 ora ($01,x)
$0f:b990  dc 3f 19	  jml [$193f]
$0f:b993  06 06		 asl $06
$0f:b995  00 01		 brk #$01
$0f:b997  00 00		 brk #$00
$0f:b999  00 00		 brk #$00
$0f:b99b  00 00		 brk #$00
$0f:b99d  00 00		 brk #$00
$0f:b99f  00 ff		 brk #$ff
$0f:b9a1  07 9f		 ora [$9f]
$0f:b9a3  02 07		 cop #$07
$0f:b9a5  00 43		 brk #$43
$0f:b9a7  41 23		 eor ($23,x)
$0f:b9a9  20 0f 09	  jsr $090f
$0f:b9ac  2f 22 7f 04   and $047f22
$0f:b9b0  e7 1f		 sbc [$1f]
$0f:b9b2  fa			plx
$0f:b9b3  07 1c		 ora [$1c]
$0f:b9b5  03 87		 ora $87,s
$0f:b9b7  01 46		 ora ($46,x)
$0f:b9b9  01 05		 ora ($05,x)
$0f:b9bb  03 1e		 ora $1e,s
$0f:b9bd  03 e5		 ora $e5,s
$0f:b9bf  1e 00 00	  asl $0000,x
$0f:b9c2  00 00		 brk #$00
$0f:b9c4  00 00		 brk #$00
$0f:b9c6  90 98		 bcc $b960
$0f:b9c8  00 00		 brk #$00
$0f:b9ca  00 00		 brk #$00
$0f:b9cc  00 00		 brk #$00
$0f:b9ce  00 00		 brk #$00
$0f:b9d0  00 00		 brk #$00
$0f:b9d2  00 00		 brk #$00
$0f:b9d4  00 00		 brk #$00
$0f:b9d6  60			rts
$0f:b9d7  00 00		 brk #$00
$0f:b9d9  00 00		 brk #$00
$0f:b9db  00 00		 brk #$00
$0f:b9dd  00 00		 brk #$00
$0f:b9df  00 00		 brk #$00
$0f:b9e1  00 01		 brk #$01
$0f:b9e3  00 01		 brk #$01
$0f:b9e5  00 01		 brk #$01
$0f:b9e7  01 03		 ora ($03,x)
$0f:b9e9  01 07		 ora ($07,x)
$0f:b9eb  01 03		 ora ($03,x)
$0f:b9ed  00 8f		 brk #$8f
$0f:b9ef  84 01		 sty $01
$0f:b9f1  00 01		 brk #$01
$0f:b9f3  00 00		 brk #$00
$0f:b9f5  01 03		 ora ($03,x)
$0f:b9f7  01 03		 ora ($03,x)
$0f:b9f9  01 05		 ora ($05,x)
$0f:b9fb  03 04		 ora $04,s
$0f:b9fd  03 0a		 ora $0a,s
$0f:b9ff  01 39		 ora ($39,x)
$0f:ba01  2d 12 4b	  and $4b12
$0f:ba04  0c a6 e2	  tsb $e2a6
$0f:ba07  aa			tax
$0f:ba08  b2 fa		 lda ($fa)
$0f:ba0a  60			rts
$0f:ba0b  aa			tax
$0f:ba0c  0c b4 44	  tsb $44b4
$0f:ba0f  74 1e		 stz $1e,x
$0f:ba11  3f 3c 7f 78   and $787f3c,x
$0f:ba15  fe 7c fe	  inc $fe7c,x
$0f:ba18  6c fe 7c	  jmp ($7cfe)
$0f:ba1b  fe 78 fc	  inc $fc78,x
$0f:ba1e  38			sec
$0f:ba1f  7c 80 c0	  jmp ($c080,x)
$0f:ba22  00 00		 brk #$00
$0f:ba24  00 00		 brk #$00
$0f:ba26  00 00		 brk #$00
$0f:ba28  00 00		 brk #$00
$0f:ba2a  00 00		 brk #$00
$0f:ba2c  00 00		 brk #$00
$0f:ba2e  00 00		 brk #$00
$0f:ba30  00 c0		 brk #$c0
$0f:ba32  00 00		 brk #$00
$0f:ba34  00 00		 brk #$00
$0f:ba36  00 00		 brk #$00
$0f:ba38  00 00		 brk #$00
$0f:ba3a  00 00		 brk #$00
$0f:ba3c  00 00		 brk #$00
$0f:ba3e  00 00		 brk #$00
$0f:ba40  33 2b		 and ($2b,s),y
$0f:ba42  0f 17 30 57   ora $573017
$0f:ba46  5c 7f 1c b8   jml $b81c7f
$0f:ba4a  6a			ror a
$0f:ba4b  b2 9c		 lda ($9c)
$0f:ba4d  ec e8 cc	  cpx $cce8
$0f:ba50  1e 3f 3a	  asl $3a3f,x
$0f:ba53  3f 3a 7f 32   and $327f3a,x
$0f:ba57  7f 76 fe 7c   adc $7cfe76,x
$0f:ba5b  fe 70 fc	  inc $fc70,x
$0f:ba5e  70 fc		 bvs $ba5c
$0f:ba60  00 00		 brk #$00
$0f:ba62  00 00		 brk #$00
$0f:ba64  00 00		 brk #$00
$0f:ba66  00 00		 brk #$00
$0f:ba68  00 00		 brk #$00
$0f:ba6a  00 00		 brk #$00
$0f:ba6c  00 00		 brk #$00
$0f:ba6e  00 00		 brk #$00
$0f:ba70  00 00		 brk #$00
$0f:ba72  00 00		 brk #$00
$0f:ba74  00 00		 brk #$00
$0f:ba76  00 00		 brk #$00
$0f:ba78  00 00		 brk #$00
$0f:ba7a  00 00		 brk #$00
$0f:ba7c  00 00		 brk #$00
$0f:ba7e  00 00		 brk #$00
$0f:ba80  00 00		 brk #$00
$0f:ba82  01 01		 ora ($01,x)
$0f:ba84  00 00		 brk #$00
$0f:ba86  00 01		 brk #$01
$0f:ba88  02 03		 cop #$03
$0f:ba8a  00 01		 brk #$01
$0f:ba8c  04 06		 tsb $06
$0f:ba8e  05 07		 ora $07
$0f:ba90  00 00		 brk #$00
$0f:ba92  00 01		 brk #$01
$0f:ba94  01 01		 ora ($01,x)
$0f:ba96  01 01		 ora ($01,x)
$0f:ba98  01 03		 ora ($03,x)
$0f:ba9a  03 03		 ora $03,s
$0f:ba9c  03 07		 ora $07,s
$0f:ba9e  02 07		 cop #$07
$0f:baa0  80 b7		 bra $ba59
$0f:baa2  15 5d		 ora $5d,x
$0f:baa4  20 b0 88	  jsr $88b0
$0f:baa7  a8			tay
$0f:baa8  90 d0		 bcc $ba7a
$0f:baaa  20 a0 40	  jsr $40a0
$0f:baad  c0 80		 cpy #$80
$0f:baaf  80 7f		 bra $bb30
$0f:bab1  ff ea ff d8   sbc $d8ffea,x
$0f:bab5  f8			sed
$0f:bab6  f0 f8		 beq $bab0
$0f:bab8  e0 f0		 cpx #$f0
$0f:baba  c0 e0		 cpy #$e0
$0f:babc  80 c0		 bra $ba7e
$0f:babe  c0 c0		 cpy #$c0
$0f:bac0  00 00		 brk #$00
$0f:bac2  01 00		 ora ($00,x)
$0f:bac4  00 01		 brk #$01
$0f:bac6  02 01		 cop #$01
$0f:bac8  01 03		 ora ($03,x)
$0f:baca  02 01		 cop #$01
$0f:bacc  05 03		 ora $03
$0f:bace  06 02		 asl $02
$0f:bad0  00 00		 brk #$00
$0f:bad2  01 00		 ora ($00,x)
$0f:bad4  01 00		 ora ($00,x)
$0f:bad6  03 00		 ora $00,s
$0f:bad8  03 00		 ora $00,s
$0f:bada  03 00		 ora $00,s
$0f:badc  07 00		 ora [$00]
$0f:bade  06 01		 asl $01
$0f:bae0  69 18		 adc #$18
$0f:bae2  55 f5		 eor $f5,x
$0f:bae4  ca			dex
$0f:bae5  e2 b4		 sep #$b4
$0f:bae7  b4 4f		 ldy $4f,x
$0f:bae9  18			clc
$0f:baea  83 83		 sta $83,s
$0f:baec  2f 25 d7 43   and $43d725
$0f:baf0  78			sei
$0f:baf1  07 f5		 ora [$f5]
$0f:baf3  0b			phd
$0f:baf4  e2 1d		 sep #$1d
$0f:baf6  b4 4b		 ldy $4b,x
$0f:baf8  18			clc
$0f:baf9  e7 83		 sbc [$83]
$0f:bafb  7f 25 df 43   adc $43df25,x
$0f:baff  bf 06 00 00   lda $000006,x
$0f:bb03  14 21		 trb $21
$0f:bb05  10 46		 bpl $bb4d
$0f:bb07  21 44		 and ($44,x)
$0f:bb09  22 44 32 a2   jsl $a23244
$0f:bb0d  00 00		 brk #$00
$0f:bb0f  88			dey
$0f:bb10  06 00		 asl $00
$0f:bb12  14 00		 trb $00
$0f:bb14  31 00		 and ($00),y
$0f:bb16  67 00		 adc [$00]
$0f:bb18  66 00		 ror $00
$0f:bb1a  76 00		 ror $00,x
$0f:bb1c  a2 00		 ldx #$00
$0f:bb1e  88			dey
$0f:bb1f  00 00		 brk #$00
$0f:bb21  00 00		 brk #$00
$0f:bb23  00 00		 brk #$00
$0f:bb25  00 18		 brk #$18
$0f:bb27  00 08		 brk #$08
$0f:bb29  00 00		 brk #$00
$0f:bb2b  00 00		 brk #$00
$0f:bb2d  00 00		 brk #$00
$0f:bb2f  00 00		 brk #$00
$0f:bb31  00 00		 brk #$00
$0f:bb33  00 00		 brk #$00
$0f:bb35  00 10		 brk #$10
$0f:bb37  08			php
$0f:bb38  18			clc
$0f:bb39  00 00		 brk #$00
$0f:bb3b  00 00		 brk #$00
$0f:bb3d  00 00		 brk #$00
$0f:bb3f  00 00		 brk #$00
$0f:bb41  00 00		 brk #$00
$0f:bb43  00 00		 brk #$00
$0f:bb45  00 18		 brk #$18
$0f:bb47  00 18		 brk #$18
$0f:bb49  00 00		 brk #$00
$0f:bb4b  00 00		 brk #$00
$0f:bb4d  00 00		 brk #$00
$0f:bb4f  00 00		 brk #$00
$0f:bb51  00 00		 brk #$00
$0f:bb53  00 08		 brk #$08
$0f:bb55  00 30		 brk #$30
$0f:bb57  08			php
$0f:bb58  1c 00 10	  trb $1000
$0f:bb5b  00 00		 brk #$00
$0f:bb5d  00 00		 brk #$00
$0f:bb5f  00 00		 brk #$00
$0f:bb61  00 01		 brk #$01
$0f:bb63  02 14		 cop #$14
$0f:bb65  0c 08 08	  tsb $0808
$0f:bb68  06 0e		 asl $0e
$0f:bb6a  29 29		 and #$29
$0f:bb6c  cc 4c 02	  cpy $024c
$0f:bb6f  42 07		 wdm #$07
$0f:bb71  00 1f		 brk #$1f
$0f:bb73  00 3f		 brk #$3f
$0f:bb75  00 7f		 brk #$7f
$0f:bb77  00 fe		 brk #$fe
$0f:bb79  01 ef		 ora ($ef,x)
$0f:bb7b  10 df		 bpl $bb5c
$0f:bb7d  20 fa 05	  jsr $05fa
$0f:bb80  00 00		 brk #$00
$0f:bb82  00 00		 brk #$00
$0f:bb84  00 00		 brk #$00
$0f:bb86  b2 83		 lda ($83)
$0f:bb88  50 58		 bvc $bbe2
$0f:bb8a  00 00		 brk #$00
$0f:bb8c  00 00		 brk #$00
$0f:bb8e  00 00		 brk #$00
$0f:bb90  00 00		 brk #$00
$0f:bb92  00 00		 brk #$00
$0f:bb94  00 00		 brk #$00
$0f:bb96  7c 00 20	  jmp ($2000,x)
$0f:bb99  00 00		 brk #$00
$0f:bb9b  00 00		 brk #$00
$0f:bb9d  00 00		 brk #$00
$0f:bb9f  00 bf		 brk #$bf
$0f:bba1  8e 5f 40	  stx $405f
$0f:bba4  2f 20 17 10   and $101720
$0f:bba8  05 04		 ora $04
$0f:bbaa  01 01		 ora ($01,x)
$0f:bbac  00 00		 brk #$00
$0f:bbae  00 00		 brk #$00
$0f:bbb0  6e 1f 30	  ror $301f
$0f:bbb3  0f 1d 02 0e   ora $0e021d
$0f:bbb7  01 03		 ora ($03,x)
$0f:bbb9  00 00		 brk #$00
$0f:bbbb  00 00		 brk #$00
$0f:bbbd  00 00		 brk #$00
$0f:bbbf  00 01		 brk #$01
$0f:bbc1  01 02		 ora ($02,x)
$0f:bbc3  02 05		 cop #$05
$0f:bbc5  04 0b		 tsb $0b
$0f:bbc7  08			php
$0f:bbc8  07 01		 ora [$01]
$0f:bbca  1f 11 0f 01   ora $010f11,x
$0f:bbce  3f 20 00 00   and $000020,x
$0f:bbd2  01 00		 ora ($00,x)
$0f:bbd4  03 00		 ora $00,s
$0f:bbd6  06 01		 asl $01
$0f:bbd8  0d 03 0d	  ora $0d03
$0f:bbdb  03 19		 ora $19,s
$0f:bbdd  07 14		 ora [$14]
$0f:bbdf  0b			phd
$0f:bbe0  03 00		 ora $00,s
$0f:bbe2  89 08		 bit #$08
$0f:bbe4  d1 50		 cmp ($50),y
$0f:bbe6  83 00		 sta $00,s
$0f:bbe8  e3 20		 sbc $20,s
$0f:bbea  e7 81		 sbc [$81]
$0f:bbec  ff 43 ff 29   sbc $29ff43,x
$0f:bbf0  8b			phb
$0f:bbf1  00 93		 brk #$93
$0f:bbf3  00 83		 brk #$83
$0f:bbf5  00 46		 brk #$46
$0f:bbf7  81 46		 sta ($46,x)
$0f:bbf9  81 fd		 sta ($fd,x)
$0f:bbfb  83 5b		 sta $5b,s
$0f:bbfd  e7 a9		 sbc [$a9]
$0f:bbff  7f 00 00 00   adc $000000,x
$0f:bc03  00 00		 brk #$00
$0f:bc05  00 01		 brk #$01
$0f:bc07  01 02		 ora ($02,x)
$0f:bc09  06 0a		 asl $0a
$0f:bc0b  19 0a 27	  ora $270a,y
$0f:bc0e  10 2a		 bpl $bc3a
$0f:bc10  00 00		 brk #$00
$0f:bc12  00 00		 brk #$00
$0f:bc14  00 00		 brk #$00
$0f:bc16  00 01		 brk #$01
$0f:bc18  01 07		 ora ($07,x)
$0f:bc1a  07 1f		 ora [$1f]
$0f:bc1c  1f 3f 1f 3f   ora $3f1f3f,x
$0f:bc20  03 0f		 ora $0f,s
$0f:bc22  15 33		 ora $33,x
$0f:bc24  bd 8e fa	  lda $fa8e,x
$0f:bc27  7c bf db	  jmp ($dbbf,x)
$0f:bc2a  5a			phy
$0f:bc2b  73 c4		 adc ($c4,s),y
$0f:bc2d  f4 c0 f0	  pea $f0c0
$0f:bc30  00 0f		 brk #$0f
$0f:bc32  0f 3f 7f ff   ora $ff7f3f
$0f:bc36  ff ff e4 ff   sbc $ffe4ff,x
$0f:bc3a  8c ff f8	  sty $f8ff
$0f:bc3d  fc 00 f0	  jsr ($f000,x)
$0f:bc40  00 00		 brk #$00
$0f:bc42  00 00		 brk #$00
$0f:bc44  00 00		 brk #$00
$0f:bc46  00 00		 brk #$00
$0f:bc48  00 00		 brk #$00
$0f:bc4a  00 00		 brk #$00
$0f:bc4c  00 00		 brk #$00
$0f:bc4e  00 00		 brk #$00
$0f:bc50  00 00		 brk #$00
$0f:bc52  00 00		 brk #$00
$0f:bc54  00 00		 brk #$00
$0f:bc56  00 00		 brk #$00
$0f:bc58  00 00		 brk #$00
$0f:bc5a  00 00		 brk #$00
$0f:bc5c  00 00		 brk #$00
$0f:bc5e  00 00		 brk #$00
$0f:bc60  00 00		 brk #$00
$0f:bc62  00 00		 brk #$00
$0f:bc64  00 00		 brk #$00
$0f:bc66  00 00		 brk #$00
$0f:bc68  00 00		 brk #$00
$0f:bc6a  03 03		 ora $03,s
$0f:bc6c  08			php
$0f:bc6d  0b			phd
$0f:bc6e  41 5d		 eor ($5d,x)
$0f:bc70  00 00		 brk #$00
$0f:bc72  00 00		 brk #$00
$0f:bc74  00 00		 brk #$00
$0f:bc76  00 00		 brk #$00
$0f:bc78  00 00		 brk #$00
$0f:bc7a  00 03		 brk #$03
$0f:bc7c  07 0f		 ora [$0f]
$0f:bc7e  3e 7f 00	  rol $007f,x
$0f:bc81  00 00		 brk #$00
$0f:bc83  00 00		 brk #$00
$0f:bc85  00 00		 brk #$00
$0f:bc87  00 00		 brk #$00
$0f:bc89  00 00		 brk #$00
$0f:bc8b  00 00		 brk #$00
$0f:bc8d  00 00		 brk #$00
$0f:bc8f  00 00		 brk #$00
$0f:bc91  00 00		 brk #$00
$0f:bc93  00 00		 brk #$00
$0f:bc95  00 00		 brk #$00
$0f:bc97  00 00		 brk #$00
$0f:bc99  00 00		 brk #$00
$0f:bc9b  00 00		 brk #$00
$0f:bc9d  00 00		 brk #$00
$0f:bc9f  00 00		 brk #$00
$0f:bca1  00 00		 brk #$00
$0f:bca3  00 00		 brk #$00
$0f:bca5  00 00		 brk #$00
$0f:bca7  00 00		 brk #$00
$0f:bca9  00 04		 brk #$04
$0f:bcab  04 22		 tsb $22
$0f:bcad  2f 40 53 00   and $005340
$0f:bcb1  00 00		 brk #$00
$0f:bcb3  00 00		 brk #$00
$0f:bcb5  00 00		 brk #$00
$0f:bcb7  00 00		 brk #$00
$0f:bcb9  00 03		 brk #$03
$0f:bcbb  07 1f		 ora [$1f]
$0f:bcbd  3f 3f 7f 00   and $007f3f,x
$0f:bcc1  00 00		 brk #$00
$0f:bcc3  00 00		 brk #$00
$0f:bcc5  00 00		 brk #$00
$0f:bcc7  00 00		 brk #$00
$0f:bcc9  00 00		 brk #$00
$0f:bccb  00 00		 brk #$00
$0f:bccd  01 03		 ora ($03,x)
$0f:bccf  01 00		 ora ($00,x)
$0f:bcd1  00 00		 brk #$00
$0f:bcd3  00 00		 brk #$00
$0f:bcd5  00 00		 brk #$00
$0f:bcd7  00 00		 brk #$00
$0f:bcd9  00 00		 brk #$00
$0f:bcdb  00 01		 brk #$01
$0f:bcdd  00 03		 brk #$03
$0f:bcdf  00 00		 brk #$00
$0f:bce1  00 00		 brk #$00
$0f:bce3  00 06		 brk #$06
$0f:bce5  01 18		 ora ($18,x)
$0f:bce7  07 17		 ora [$17]
$0f:bce9  0f ab 5b 14   ora $145bab
$0f:bced  f4 6b f0	  pea $f06b
$0f:bcf0  00 00		 brk #$00
$0f:bcf2  00 00		 brk #$00
$0f:bcf4  07 00		 ora [$00]
$0f:bcf6  1f 00 1f 00   ora $001f00,x
$0f:bcfa  fb			xce
$0f:bcfb  04 f4		 tsb $f4
$0f:bcfd  0b			phd
$0f:bcfe  f0 0f		 beq $bd0f
$0f:bd00  00 00		 brk #$00
$0f:bd02  00 00		 brk #$00
$0f:bd04  08			php
$0f:bd05  00 38		 brk #$38
$0f:bd07  08			php
$0f:bd08  1c 00 10	  trb $1000
$0f:bd0b  00 00		 brk #$00
$0f:bd0d  00 00		 brk #$00
$0f:bd0f  00 00		 brk #$00
$0f:bd11  00 08		 brk #$08
$0f:bd13  00 18		 brk #$18
$0f:bd15  00 6c		 brk #$6c
$0f:bd17  18			clc
$0f:bd18  26 18		 rol $18
$0f:bd1a  18			clc
$0f:bd1b  00 10		 brk #$10
$0f:bd1d  00 00		 brk #$00
$0f:bd1f  00 00		 brk #$00
$0f:bd21  00 00		 brk #$00
$0f:bd23  00 00		 brk #$00
$0f:bd25  00 00		 brk #$00
$0f:bd27  00 00		 brk #$00
$0f:bd29  00 11		 brk #$11
$0f:bd2b  00 64		 brk #$64
$0f:bd2d  03 48		 ora $48,s
$0f:bd2f  00 00		 brk #$00
$0f:bd31  00 00		 brk #$00
$0f:bd33  00 00		 brk #$00
$0f:bd35  00 00		 brk #$00
$0f:bd37  00 00		 brk #$00
$0f:bd39  00 11		 brk #$11
$0f:bd3b  00 67		 brk #$67
$0f:bd3d  00 48		 brk #$48
$0f:bd3f  00 00		 brk #$00
$0f:bd41  00 00		 brk #$00
$0f:bd43  00 00		 brk #$00
$0f:bd45  00 02		 brk #$02
$0f:bd47  01 05		 ora ($05,x)
$0f:bd49  03 08		 ora $08,s
$0f:bd4b  07 07		 ora [$07]
$0f:bd4d  0f 05 0d 00   ora $000d05
$0f:bd51  00 00		 brk #$00
$0f:bd53  00 00		 brk #$00
$0f:bd55  00 03		 brk #$03
$0f:bd57  00 07		 brk #$07
$0f:bd59  00 0f		 brk #$0f
$0f:bd5b  00 0f		 brk #$0f
$0f:bd5d  00 0d		 brk #$0d
$0f:bd5f  02 07		 cop #$07
$0f:bd61  00 0c		 brk #$0c
$0f:bd63  03 fa		 ora $fa,s
$0f:bd65  07 95		 ora [$95]
$0f:bd67  6d 50 f0	  adc $f050
$0f:bd6a  6f e7 59 d8   adc $d859e7
$0f:bd6e  62 00 07	  per $c471
$0f:bd71  00 0f		 brk #$0f
$0f:bd73  00 ff		 brk #$ff
$0f:bd75  00 fd		 brk #$fd
$0f:bd77  02 f0		 cop #$f0
$0f:bd79  0f e7 1f d8   ora $d81fe7
$0f:bd7d  27 00		 and [$00]
$0f:bd7f  ff e6 07 f8   sbc $f807e6,x
$0f:bd83  00 c3		 brk #$c3
$0f:bd85  03 f8		 ora $f8,s
$0f:bd87  00 ff		 brk #$ff
$0f:bd89  80 fc		 bra $bd87
$0f:bd8b  00 e3		 brk #$e3
$0f:bd8d  03 8c		 ora $8c,s
$0f:bd8f  0e 38 c0	  asl $c038
$0f:bd92  7f 80 fc 00   adc $00fc80,x
$0f:bd96  7f 80 8f f0   adc $f08f80,x
$0f:bd9a  3f c0 7c 80   and $807cc0,x
$0f:bd9e  f0 00		 beq $bda0
$0f:bda0  00 00		 brk #$00
$0f:bda2  c0 e0		 cpy #$e0
$0f:bda4  00 80		 brk #$80
$0f:bda6  c0 c0		 cpy #$c0
$0f:bda8  18			clc
$0f:bda9  1c 60 70	  trb $7060
$0f:bdac  80 c0		 bra $bd6e
$0f:bdae  00 00		 brk #$00
$0f:bdb0  00 00		 brk #$00
$0f:bdb2  00 00		 brk #$00
$0f:bdb4  00 00		 brk #$00
$0f:bdb6  00 00		 brk #$00
$0f:bdb8  e0 00		 cpx #$00
$0f:bdba  80 00		 bra $bdbc
$0f:bdbc  00 00		 brk #$00
$0f:bdbe  00 00		 brk #$00
$0f:bdc0  1f 00 3f 00   ora $003f00,x
$0f:bdc4  77 40		 adc [$40],y
$0f:bdc6  26 00		 rol $00
$0f:bdc8  6a			ror a
$0f:bdc9  08			php
$0f:bdca  ea			nop
$0f:bdcb  88			dey
$0f:bdcc  52 18		 eor ($18)
$0f:bdce  42 10		 wdm #$10
$0f:bdd0  25 1a		 and $1a
$0f:bdd2  2d 12 3d	  and $3d12
$0f:bdd5  02 7f		 cop #$7f
$0f:bdd7  00 77		 brk #$77
$0f:bdd9  00 77		 brk #$77
$0f:bddb  00 e7		 brk #$e7
$0f:bddd  00 e7		 brk #$e7
$0f:bddf  00 ff		 brk #$ff
$0f:bde1  10 7f		 bpl $be62
$0f:bde3  00 7b		 brk #$7b
$0f:bde5  00 3a		 brk #$3a
$0f:bde7  00 ba		 brk #$ba
$0f:bde9  80 b1		 bra $bd9c
$0f:bdeb  81 55		 sta ($55,x)
$0f:bded  c5 54		 cmp $54
$0f:bdef  45 94		 eor $94
$0f:bdf1  7b			tdc
$0f:bdf2  ce 31 ef	  dec $ef31
$0f:bdf5  10 ef		 bpl $bde6
$0f:bdf7  10 7f		 bpl $be78
$0f:bdf9  00 7e		 brk #$7e
$0f:bdfb  00 3a		 brk #$3a
$0f:bdfd  00 3a		 brk #$3a
$0f:bdff  00 34		 brk #$34
$0f:be01  26 39		 rol $39
$0f:be03  3d 16 5a	  and $5a16,x
$0f:be06  3c 54 54	  bit $5454,x
$0f:be09  64 28		 stz $28
$0f:be0b  a2 f2		 ldx #$f2
$0f:be0d  ba			tsx
$0f:be0e  e4 a6		 cpx $a6
$0f:be10  1b			tcs
$0f:be11  3f 16 3f 3c   and $3c3f16,x
$0f:be15  7e 38 7c	  ror $7c38,x
$0f:be18  38			sec
$0f:be19  7c 7c fe	  jmp ($fe7c,x)
$0f:be1c  6c fe 78	  jmp ($78fe)
$0f:be1f  fe 00 00	  inc $0000,x
$0f:be22  00 00		 brk #$00
$0f:be24  00 00		 brk #$00
$0f:be26  00 00		 brk #$00
$0f:be28  00 00		 brk #$00
$0f:be2a  00 00		 brk #$00
$0f:be2c  00 00		 brk #$00
$0f:be2e  00 00		 brk #$00
$0f:be30  00 00		 brk #$00
$0f:be32  00 00		 brk #$00
$0f:be34  00 00		 brk #$00
$0f:be36  00 00		 brk #$00
$0f:be38  00 00		 brk #$00
$0f:be3a  00 00		 brk #$00
$0f:be3c  00 00		 brk #$00
$0f:be3e  00 00		 brk #$00
$0f:be40  00 00		 brk #$00
$0f:be42  00 00		 brk #$00
$0f:be44  01 01		 ora ($01,x)
$0f:be46  00 00		 brk #$00
$0f:be48  02 03		 cop #$03
$0f:be4a  00 01		 brk #$01
$0f:be4c  04 06		 tsb $06
$0f:be4e  01 03		 ora ($03,x)
$0f:be50  00 00		 brk #$00
$0f:be52  00 00		 brk #$00
$0f:be54  00 01		 brk #$01
$0f:be56  01 01		 ora ($01,x)
$0f:be58  01 03		 ora ($03,x)
$0f:be5a  03 03		 ora $03,s
$0f:be5c  03 07		 ora $07,s
$0f:be5e  06 07		 asl $07
$0f:be60  99 bf 02	  sta $02bf,y
$0f:be63  4a			lsr a
$0f:be64  24 b4		 bit $b4
$0f:be66  48			pha
$0f:be67  e8			inx
$0f:be68  10 50		 bpl $beba
$0f:be6a  40			rti
$0f:be6b  c0 00		 cpy #$00
$0f:be6d  80 40		 bra $beaf
$0f:be6f  c0 7f		 cpy #$7f
$0f:be71  ff fd ff d8   sbc $d8fffd,x
$0f:be75  fc b0 f8	  jsr ($f8b0,x)
$0f:be78  e0 f0		 cpx #$f0
$0f:be7a  80 c0		 bra $be3c
$0f:be7c  c0 c0		 cpy #$c0
$0f:be7e  80 c0		 bra $be40
$0f:be80  00 00		 brk #$00
$0f:be82  00 00		 brk #$00
$0f:be84  01 01		 ora ($01,x)
$0f:be86  02 02		 cop #$02
$0f:be88  00 01		 brk #$01
$0f:be8a  05 07		 ora $07
$0f:be8c  00 02		 brk #$02
$0f:be8e  01 03		 ora ($03,x)
$0f:be90  00 00		 brk #$00
$0f:be92  00 00		 brk #$00
$0f:be94  00 01		 brk #$01
$0f:be96  01 03		 ora ($03,x)
$0f:be98  03 03		 ora $03,s
$0f:be9a  02 07		 cop #$07
$0f:be9c  07 07		 ora [$07]
$0f:be9e  07 07		 ora [$07]
$0f:bea0  0c 2e 11	  tsb $112e
$0f:bea3  5d 42 fa	  eor $fa42,x
$0f:bea6  08			php
$0f:bea7  a8			tay
$0f:bea8  80 c0		 bra $be6a
$0f:beaa  20 60 00	  jsr $0060
$0f:bead  80 40		 bra $beef
$0f:beaf  c0 77		 cpy #$77
$0f:beb1  7f ee ff fc   adc $fcffee,x
$0f:beb5  fe f0 f8	  inc $f8f0,x
$0f:beb8  60			rts
$0f:beb9  e0 c0		 cpx #$c0
$0f:bebb  e0 c0		 cpx #$c0
$0f:bebd  c0 80		 cpy #$80
$0f:bebf  c0 04		 cpy #$04
$0f:bec1  03 01		 ora $01,s
$0f:bec3  07 05		 ora [$05]
$0f:bec5  03 0a		 ora $0a,s
$0f:bec7  06 15		 asl $15
$0f:bec9  0c 2a 1a	  tsb $1a2a
$0f:becc  29 18		 and #$18
$0f:bece  13 30		 ora ($30,s),y
$0f:bed0  07 00		 ora [$00]
$0f:bed2  07 00		 ora [$00]
$0f:bed4  07 00		 ora [$00]
$0f:bed6  0e 01 1c	  asl $1c01
$0f:bed9  03 3a		 ora $3a,s
$0f:bedb  05 38		 ora $38
$0f:bedd  07 30		 ora [$30]
$0f:bedf  0f 97 93 6a   ora $6a9397
$0f:bee3  08			php
$0f:bee4  55 11		 eor $11,x
$0f:bee6  ae 20 c1	  ldx $c120
$0f:bee9  00 af		 brk #$af
$0f:beeb  24 5f		 bit $5f
$0f:beed  4f 5f 4f 93   eor $934f5f
$0f:bef1  6f 08 f7 11   adc $11f708
$0f:bef5  ee 20 df	  inc $df20
$0f:bef8  00 ff		 brk #$ff
$0f:befa  24 df		 bit $df
$0f:befc  4f bf 4f bf   eor $bf4fbf
$0f:bf00  00 00		 brk #$00
$0f:bf02  01 00		 ora ($00,x)
$0f:bf04  02 01		 cop #$01
$0f:bf06  00 02		 brk #$02
$0f:bf08  02 00		 cop #$00
$0f:bf0a  00 00		 brk #$00
$0f:bf0c  00 04		 brk #$04
$0f:bf0e  04 00		 tsb $00
$0f:bf10  00 00		 brk #$00
$0f:bf12  01 00		 ora ($00,x)
$0f:bf14  03 00		 ora $00,s
$0f:bf16  02 00		 cop #$00
$0f:bf18  02 00		 cop #$00
$0f:bf1a  00 00		 brk #$00
$0f:bf1c  04 00		 tsb $00
$0f:bf1e  04 00		 tsb $00
$0f:bf20  00 00		 brk #$00
$0f:bf22  08			php
$0f:bf23  84 10		 sty $10
$0f:bf25  09 00		 ora #$00
$0f:bf27  04 00		 tsb $00
$0f:bf29  40			rti
$0f:bf2a  80 00		 bra $bf2c
$0f:bf2c  10 90		 bpl $bebe
$0f:bf2e  00 20		 brk #$20
$0f:bf30  00 00		 brk #$00
$0f:bf32  8c 00 19	  sty $1900
$0f:bf35  00 04		 brk #$04
$0f:bf37  00 40		 brk #$40
$0f:bf39  00 80		 brk #$80
$0f:bf3b  00 90		 brk #$90
$0f:bf3d  00 20		 brk #$20
$0f:bf3f  00 0a		 brk #$0a
$0f:bf41  06 08		 asl $08
$0f:bf43  1c 27 1d	  trb $1d27
$0f:bf46  55 3c		 eor $3c,x
$0f:bf48  5b			tcd
$0f:bf49  3b			tsc
$0f:bf4a  a5 60		 lda $60
$0f:bf4c  2a			rol a
$0f:bf4d  e0 9d		 cpx #$9d
$0f:bf4f  c9 0e		 cmp #$0e
$0f:bf51  01 1c		 ora ($1c,x)
$0f:bf53  03 3d		 ora $3d,s
$0f:bf55  03 7c		 ora $7c,s
$0f:bf57  03 7b		 ora $7b,s
$0f:bf59  05 e0		 ora $e0
$0f:bf5b  1f e0 1f c9   ora $c91fe0,x
$0f:bf5f  3e a7 23	  rol $23a7,x
$0f:bf62  ce c4 1a	  dec $1ac4
$0f:bf65  02 d5		 cop #$d5
$0f:bf67  70 a7		 bvs $bf10
$0f:bf69  20 2f 20	  jsr $202f
$0f:bf6c  5f 45 3f 07   eor $073f45,x
$0f:bf70  23 df		 and $df,s
$0f:bf72  c4 bf		 cpy $bf
$0f:bf74  02 fd		 cop #$fd
$0f:bf76  70 8f		 bvs $bf07
$0f:bf78  20 df 20	  jsr $20df
$0f:bf7b  df 45 bf 07   cmp $07bf45,x
$0f:bf7f  ff e0 00 ff   sbc $ff00e0,x
$0f:bf83  00 f0		 brk #$f0
$0f:bf85  00 cc		 brk #$cc
$0f:bf87  0e e2 03	  asl $03e2
$0f:bf8a  7c 00 2f	  jmp ($2f00,x)
$0f:bf8d  20 04 04	  jsr $0404
$0f:bf90  ff 00 1f e0   sbc $e01f00,x
$0f:bf94  ff 00 70 80   sbc $807000,x
$0f:bf98  3c c0 ff	  bit $ffc0,x
$0f:bf9b  00 1f		 brk #$1f
$0f:bf9d  00 03		 brk #$03
$0f:bf9f  00 08		 brk #$08
$0f:bfa1  0e 20 30	  asl $3020
$0f:bfa4  80 c0		 bra $bf66
$0f:bfa6  00 00		 brk #$00
$0f:bfa8  00 80		 brk #$80
$0f:bfaa  7c 7f 88	  jmp ($887f,x)
$0f:bfad  0c 60 70	  tsb $7060
$0f:bfb0  f0 00		 beq $bfb2
$0f:bfb2  c0 00		 cpy #$00
$0f:bfb4  00 00		 brk #$00
$0f:bfb6  00 00		 brk #$00
$0f:bfb8  00 00		 brk #$00
$0f:bfba  80 00		 bra $bfbc
$0f:bfbc  f0 00		 beq $bfbe
$0f:bfbe  80 00		 bra $bfc0
$0f:bfc0  44 14 a0	  mvp $a0,$14
$0f:bfc3  a4 a2		 ldy $a2
$0f:bfc5  a2 20		 ldx #$20
$0f:bfc7  a2 61		 ldx #$61
$0f:bfc9  61 20		 adc ($20,x)
$0f:bfcb  61 00		 adc ($00,x)
$0f:bfcd  21 00		 and ($00,x)
$0f:bfcf  20 e3 00	  jsr $00e3
$0f:bfd2  43 00		 eor $00,s
$0f:bfd4  41 00		 eor ($00,x)
$0f:bfd6  41 00		 eor ($00,x)
$0f:bfd8  00 00		 brk #$00
$0f:bfda  00 00		 brk #$00
$0f:bfdc  00 00		 brk #$00
$0f:bfde  00 00		 brk #$00
$0f:bfe0  4a			lsr a
$0f:bfe1  4e 2a 6a	  lsr $6a2a
$0f:bfe4  20 22 10	  jsr $1022
$0f:bfe7  30 10		 bmi $bff9
$0f:bfe9  10 00		 bpl $bfeb
$0f:bfeb  10 00		 bpl $bfed
$0f:bfed  00 00		 brk #$00
$0f:bfef  00 30		 brk #$30
$0f:bff1  00 10		 brk #$10
$0f:bff3  00 10		 brk #$10
$0f:bff5  00 00		 brk #$00
$0f:bff7  00 00		 brk #$00
$0f:bff9  00 00		 brk #$00
$0f:bffb  00 00		 brk #$00
$0f:bffd  00 00		 brk #$00
$0f:bfff  00 00		 brk #$00
$0f:c001  00 00		 brk #$00
$0f:c003  00 01		 brk #$01
$0f:c005  00 0a		 brk #$0a
$0f:c007  06 14		 asl $14
$0f:c009  0c 08 18	  tsb $1808
$0f:c00c  38			sec
$0f:c00d  10 20		 bpl $c02f
$0f:c00f  00 00		 brk #$00
$0f:c011  00 00		 brk #$00
$0f:c013  00 00		 brk #$00
$0f:c015  00 01		 brk #$01
$0f:c017  00 02		 brk #$02
$0f:c019  00 04		 brk #$04
$0f:c01b  00 08		 brk #$08
$0f:c01d  00 10		 brk #$10
$0f:c01f  00 00		 brk #$00
$0f:c021  00 05		 brk #$05
$0f:c023  03 a0		 ora $a0,s
$0f:c025  60			rts
$0f:c026  00 00		 brk #$00
$0f:c028  04 0c		 tsb $0c
$0f:c02a  00 00		 brk #$00
$0f:c02c  00 40		 brk #$40
$0f:c02e  00 00		 brk #$00
$0f:c030  00 00		 brk #$00
$0f:c032  00 00		 brk #$00
$0f:c034  10 00		 bpl $c036
$0f:c036  80 00		 bra $c038
$0f:c038  00 00		 brk #$00
$0f:c03a  00 00		 brk #$00
$0f:c03c  00 00		 brk #$00
$0f:c03e  00 00		 brk #$00
$0f:c040  00 00		 brk #$00
$0f:c042  03 00		 ora $00,s
$0f:c044  04 02		 tsb $02
$0f:c046  1a			inc a
$0f:c047  06 15		 asl $15
$0f:c049  0c 0a 18	  tsb $180a
$0f:c04c  39 09 26	  and $2609,y
$0f:c04f  12 00		 ora ($00)
$0f:c051  00 00		 brk #$00
$0f:c053  00 01		 brk #$01
$0f:c055  00 01		 brk #$01
$0f:c057  00 03		 brk #$03
$0f:c059  00 07		 brk #$07
$0f:c05b  00 06		 brk #$06
$0f:c05d  00 0d		 brk #$0d
$0f:c05f  00 0f		 brk #$0f
$0f:c061  00 3c		 brk #$3c
$0f:c063  c3 95		 cmp $95,s
$0f:c065  2c a3 d3	  bit $d3a3
$0f:c068  64 6c		 stz $6c
$0f:c06a  cb			wai
$0f:c06b  c8			iny
$0f:c06c  37 00		 and [$00],y
$0f:c06e  cf 00 00 00   cmp $000000
$0f:c072  00 00		 brk #$00
$0f:c074  c3 00		 cmp $00,s
$0f:c076  0c 00 93	  tsb $9300
$0f:c079  00 37		 brk #$37
$0f:c07b  00 fe		 brk #$fe
$0f:c07d  01 fa		 ora ($fa,x)
$0f:c07f  05 00		 ora $00
$0f:c081  00 00		 brk #$00
$0f:c083  00 00		 brk #$00
$0f:c085  00 00		 brk #$00
$0f:c087  03 0b		 ora $0b,s
$0f:c089  07 36		 ora [$36]
$0f:c08b  0e 30 30	  asl $3030
$0f:c08e  1c 0c 00	  trb $000c
$0f:c091  00 00		 brk #$00
$0f:c093  00 00		 brk #$00
$0f:c095  00 00		 brk #$00
$0f:c097  00 00		 brk #$00
$0f:c099  00 01		 brk #$01
$0f:c09b  70 33		 bvs $c0d0
$0f:c09d  0c 0f 00	  tsb $000f
$0f:c0a0  10 10		 bpl $c0b2
$0f:c0a2  20 20 40	  jsr $4020
$0f:c0a5  40			rti
$0f:c0a6  00 c0		 brk #$c0
$0f:c0a8  e0 f0		 cpx #$f0
$0f:c0aa  30 30		 bmi $c0dc
$0f:c0ac  d0 58		 bne $c106
$0f:c0ae  d0 18		 bne $c0c8
$0f:c0b0  10 00		 bpl $c0b2
$0f:c0b2  20 10 40	  jsr $4010
$0f:c0b5  20 00 20	  jsr $2000
$0f:c0b8  00 00		 brk #$00
$0f:c0ba  c0 00		 cpy #$00
$0f:c0bc  60			rts
$0f:c0bd  c0 20		 cpy #$20
$0f:c0bf  c0 00		 cpy #$00
$0f:c0c1  00 00		 brk #$00
$0f:c0c3  00 01		 brk #$01
$0f:c0c5  06 07		 asl $07
$0f:c0c7  0b			phd
$0f:c0c8  0d 14 54	  ora $5414
$0f:c0cb  fc 15 54	  jsr ($5415,x)
$0f:c0ce  26 31		 rol $31
$0f:c0d0  00 00		 brk #$00
$0f:c0d2  00 00		 brk #$00
$0f:c0d4  00 06		 brk #$06
$0f:c0d6  00 0b		 brk #$0b
$0f:c0d8  03 17		 ora $17,s
$0f:c0da  c3 30		 cmp $30,s
$0f:c0dc  4b			phk
$0f:c0dd  38			sec
$0f:c0de  2f 13 00 00   and $000013
$0f:c0e2  00 10		 brk #$10
$0f:c0e4  50 f0		 bvc $c0d6
$0f:c0e6  b0 b0		 bcs $c098
$0f:c0e8  48			pha
$0f:c0e9  10 cc		 bpl $c0b7
$0f:c0eb  0c 84 20	  tsb $2084
$0f:c0ee  a4 44		 ldy $44
$0f:c0f0  00 00		 brk #$00
$0f:c0f2  10 00		 bpl $c0f4
$0f:c0f4  10 00		 bpl $c0f6
$0f:c0f6  40			rti
$0f:c0f7  30 e0		 bmi $c0d9
$0f:c0f9  00 f0		 brk #$f0
$0f:c0fb  1c 78 b8	  trb $b878
$0f:c0fe  78			sei
$0f:c0ff  fc 00 00	  jsr ($0000,x)
$0f:c102  00 00		 brk #$00
$0f:c104  01 00		 ora ($00,x)
$0f:c106  02 01		 cop #$01
$0f:c108  03 01		 ora $01,s
$0f:c10a  07 01		 ora [$01]
$0f:c10c  1c 03 2d	  trb $2d03
$0f:c10f  1f 00 00 01   ora $010000,x
$0f:c113  00 07		 brk #$07
$0f:c115  00 0f		 brk #$0f
$0f:c117  00 1f		 brk #$1f
$0f:c119  00 3f		 brk #$3f
$0f:c11b  00 3f		 brk #$3f
$0f:c11d  00 7f		 brk #$7f
$0f:c11f  00 00		 brk #$00
$0f:c121  00 42		 brk #$42
$0f:c123  00 bd		 brk #$bd
$0f:c125  42 66		 wdm #$66
$0f:c127  ff e7 ff 99   sbc $99ffe7,x
$0f:c12b  99 24 00	  sta $0024,y
$0f:c12e  a5 81		 lda $81
$0f:c130  7e 00 ff	  ror $ff00,x
$0f:c133  00 ff		 brk #$ff
$0f:c135  00 ff		 brk #$ff
$0f:c137  00 ff		 brk #$ff
$0f:c139  00 99		 brk #$99
$0f:c13b  66 00		 ror $00
$0f:c13d  ff 81 7e 00   sbc $007e81,x
$0f:c141  00 00		 brk #$00
$0f:c143  00 00		 brk #$00
$0f:c145  00 05		 brk #$05
$0f:c147  02 0a		 cop #$0a
$0f:c149  07 11		 ora [$11]
$0f:c14b  0d 08 18	  ora $1808
$0f:c14e  14 0c		 trb $0c
$0f:c150  00 00		 brk #$00
$0f:c152  00 00		 brk #$00
$0f:c154  03 00		 ora $00,s
$0f:c156  0f 00 1f 00   ora $001f00
$0f:c15a  1d 02 38	  ora $3802,x
$0f:c15d  07 3c		 ora [$3c]
$0f:c15f  03 00		 ora $00,s
$0f:c161  00 00		 brk #$00
$0f:c163  00 00		 brk #$00
$0f:c165  00 a0		 brk #$a0
$0f:c167  40			rti
$0f:c168  50 e0		 bvc $c14a
$0f:c16a  88			dey
$0f:c16b  b0 10		 bcs $c17d
$0f:c16d  18			clc
$0f:c16e  28			plp
$0f:c16f  30 00		 bmi $c171
$0f:c171  00 00		 brk #$00
$0f:c173  00 c0		 brk #$c0
$0f:c175  00 f0		 brk #$f0
$0f:c177  00 f8		 brk #$f8
$0f:c179  00 b8		 brk #$b8
$0f:c17b  40			rti
$0f:c17c  1c e0 3c	  trb $3ce0
$0f:c17f  c0 00		 cpy #$00
$0f:c181  00 01		 brk #$01
$0f:c183  00 05		 brk #$05
$0f:c185  03 0a		 ora $0a,s
$0f:c187  06 15		 asl $15
$0f:c189  0c 2b 18	  tsb $182b
$0f:c18c  17 31		 ora [$31],y
$0f:c18e  57 33		 eor [$33],y
$0f:c190  00 00		 brk #$00
$0f:c192  01 00		 ora ($00,x)
$0f:c194  07 00		 ora [$00]
$0f:c196  0e 01 1c	  asl $1c01
$0f:c199  03 38		 ora $38,s
$0f:c19b  07 31		 ora [$31]
$0f:c19d  0f 73 0f 00   ora $000f73
$0f:c1a1  7e 7e ff	  ror $ff7e,x
$0f:c1a4  81 81		 sta ($81,x)
$0f:c1a6  7e 00 ff	  ror $ff00,x
$0f:c1a9  3c ff ff	  bit $ffff,x
$0f:c1ac  ff ff ff ff   sbc $ffffff,x
$0f:c1b0  7e 00 ff	  ror $ff00,x
$0f:c1b3  00 81		 brk #$81
$0f:c1b5  7e 00 ff	  ror $ff00,x
$0f:c1b8  3c ff ff	  bit $ffff,x
$0f:c1bb  ff ff ff ff   sbc $ffffff,x
$0f:c1bf  ff 00 00 00   sbc $000000,x
$0f:c1c3  00 02		 brk #$02
$0f:c1c5  01 0b		 ora ($0b,x)
$0f:c1c7  07 14		 ora [$14]
$0f:c1c9  0c 0b 18	  tsb $180b
$0f:c1cc  2b			pld
$0f:c1cd  19 17 33	  ora $3317,y
$0f:c1d0  00 00		 brk #$00
$0f:c1d2  00 00		 brk #$00
$0f:c1d4  03 00		 ora $00,s
$0f:c1d6  0f 00 1c 03   ora $031c00
$0f:c1da  18			clc
$0f:c1db  07 39		 ora [$39]
$0f:c1dd  07 33		 ora [$33]
$0f:c1df  0f 00 00 00   ora $000000
$0f:c1e3  00 40		 brk #$40
$0f:c1e5  80 d0		 bra $c1b7
$0f:c1e7  e0 28		 cpx #$28
$0f:c1e9  30 d0		 bmi $c1bb
$0f:c1eb  18			clc
$0f:c1ec  d4 98		 pei ($98)
$0f:c1ee  e8			inx
$0f:c1ef  cc 00 00	  cpy $0000
$0f:c1f2  00 00		 brk #$00
$0f:c1f4  c0 00		 cpy #$00
$0f:c1f6  f0 00		 beq $c1f8
$0f:c1f8  38			sec
$0f:c1f9  c0 18		 cpy #$18
$0f:c1fb  e0 9c		 cpx #$9c
$0f:c1fd  e0 cc		 cpx #$cc
$0f:c1ff  f0 10		 beq $c211
$0f:c201  22 2c 2c 40   jsl $402c2c
$0f:c205  00 08		 brk #$08
$0f:c207  50 d0		 bvc $c1d9
$0f:c209  50 40		 bvc $c24b
$0f:c20b  c0 80		 cpy #$80
$0f:c20d  80 00		 bra $c20f
$0f:c20f  00 10		 brk #$10
$0f:c211  00 00		 brk #$00
$0f:c213  00 28		 brk #$28
$0f:c215  00 08		 brk #$08
$0f:c217  00 00		 brk #$00
$0f:c219  00 10		 brk #$10
$0f:c21b  00 00		 brk #$00
$0f:c21d  00 80		 brk #$80
$0f:c21f  00 00		 brk #$00
$0f:c221  00 00		 brk #$00
$0f:c223  00 00		 brk #$00
$0f:c225  00 00		 brk #$00
$0f:c227  00 00		 brk #$00
$0f:c229  00 00		 brk #$00
$0f:c22b  00 00		 brk #$00
$0f:c22d  00 00		 brk #$00
$0f:c22f  00 00		 brk #$00
$0f:c231  00 00		 brk #$00
$0f:c233  00 00		 brk #$00
$0f:c235  00 00		 brk #$00
$0f:c237  00 00		 brk #$00
$0f:c239  00 00		 brk #$00
$0f:c23b  00 00		 brk #$00
$0f:c23d  00 00		 brk #$00
$0f:c23f  00 4a		 brk #$4a
$0f:c241  2a			rol a
$0f:c242  01 48		 ora ($48,x)
$0f:c244  55 04		 eor $04,x
$0f:c246  d5 24		 cmp $24,x
$0f:c248  a2 62		 ldx #$62
$0f:c24a  d5 44		 cmp $44,x
$0f:c24c  4b			phk
$0f:c24d  c8			iny
$0f:c24e  2b			pld
$0f:c24f  98			tya
$0f:c250  15 00		 ora $00,x
$0f:c252  37 00		 and [$00],y
$0f:c254  3b			tsc
$0f:c255  00 1b		 brk #$1b
$0f:c257  00 1d		 brk #$1d
$0f:c259  00 3b		 brk #$3b
$0f:c25b  00 36		 brk #$36
$0f:c25d  01 66		 ora ($66,x)
$0f:c25f  01 ef		 ora ($ef,x)
$0f:c261  01 f7		 ora ($f7,x)
$0f:c263  00 ff		 brk #$ff
$0f:c265  44 ff 03	  mvp $03,$ff
$0f:c268  ff 1c ff 11   sbc $11ff1c,x
$0f:c26c  bf 07 7f 1b   lda $1b7f07,x
$0f:c270  b9 47 1c	  lda $1c47,y
$0f:c273  e3 c4		 sbc $c4,s
$0f:c275  7f 33 cf dc   adc $dccf33,x
$0f:c279  3f 91 7f e7   and $e77f91,x
$0f:c27d  1f db 3f 1e   ora $1e3fdb,x
$0f:c281  02 1b		 cop #$1b
$0f:c283  07 09		 ora [$09]
$0f:c285  07 0c		 ora [$0c]
$0f:c287  03 03		 ora $03,s
$0f:c289  08			php
$0f:c28a  00 00		 brk #$00
$0f:c28c  00 00		 brk #$00
$0f:c28e  00 00		 brk #$00
$0f:c290  01 00		 ora ($00,x)
$0f:c292  00 00		 brk #$00
$0f:c294  00 00		 brk #$00
$0f:c296  00 00		 brk #$00
$0f:c298  08			php
$0f:c299  00 00		 brk #$00
$0f:c29b  00 00		 brk #$00
$0f:c29d  00 00		 brk #$00
$0f:c29f  00 30		 brk #$30
$0f:c2a1  38			sec
$0f:c2a2  e0 f8		 cpx #$f8
$0f:c2a4  c0 f0		 cpy #$f0
$0f:c2a6  d0 40		 bne $c2e8
$0f:c2a8  80 40		 bra $c2ea
$0f:c2aa  20 20 10	  jsr $1020
$0f:c2ad  10 00		 bpl $c2af
$0f:c2af  00 c0		 brk #$c0
$0f:c2b1  00 00		 brk #$00
$0f:c2b3  00 00		 brk #$00
$0f:c2b5  00 40		 brk #$40
$0f:c2b7  20 40 20	  jsr $2040
$0f:c2ba  20 10 10	  jsr $1010
$0f:c2bd  00 00		 brk #$00
$0f:c2bf  00 1b		 brk #$1b
$0f:c2c1  38			sec
$0f:c2c2  14 2c		 trb $2c
$0f:c2c4  19 09 06	  ora $0609,y
$0f:c2c7  1f 01 16 00   ora $001601,x
$0f:c2cb  00 00		 brk #$00
$0f:c2cd  00 00		 brk #$00
$0f:c2cf  00 07		 brk #$07
$0f:c2d1  31 03		 and ($03),y
$0f:c2d3  20 06 0e	  jsr $0e06
$0f:c2d6  10 0e		 bpl $c2e6
$0f:c2d8  10 06		 bpl $c2e0
$0f:c2da  00 00		 brk #$00
$0f:c2dc  00 00		 brk #$00
$0f:c2de  00 00		 brk #$00
$0f:c2e0  cc 0c a4	  cpy $a40c
$0f:c2e3  28			plp
$0f:c2e4  18			clc
$0f:c2e5  10 70		 bpl $c357
$0f:c2e7  f8			sed
$0f:c2e8  40			rti
$0f:c2e9  d0 10		 bne $c2fb
$0f:c2eb  30 00		 bmi $c2ed
$0f:c2ed  10 00		 bpl $c2ef
$0f:c2ef  00 f0		 brk #$f0
$0f:c2f1  64 d0		 stz $d0
$0f:c2f3  00 e0		 brk #$e0
$0f:c2f5  70 00		 bvs $c2f7
$0f:c2f7  f8			sed
$0f:c2f8  40			rti
$0f:c2f9  b0 30		 bcs $c32b
$0f:c2fb  00 10		 brk #$10
$0f:c2fd  00 00		 brk #$00
$0f:c2ff  00 2d		 brk #$2d
$0f:c301  1d 58 38	  ora $3858,x
$0f:c304  3b			tsc
$0f:c305  18			clc
$0f:c306  24 1c		 bit $1c
$0f:c308  24 1c		 bit $1c
$0f:c30a  3b			tsc
$0f:c30b  18			clc
$0f:c30c  58			cli
$0f:c30d  38			sec
$0f:c30e  2d 1d 7d	  and $7d1d
$0f:c311  02 f8		 cop #$f8
$0f:c313  07 f8		 ora [$f8]
$0f:c315  07 fc		 ora [$fc]
$0f:c317  03 fc		 ora $fc,s
$0f:c319  03 f8		 ora $f8,s
$0f:c31b  07 f8		 ora [$f8]
$0f:c31d  07 7d		 ora [$7d]
$0f:c31f  02 bd		 cop #$bd
$0f:c321  81 3c		 sta ($3c,x)
$0f:c323  00 ff		 brk #$ff
$0f:c325  00 7f		 brk #$7f
$0f:c327  00 7f		 brk #$7f
$0f:c329  00 ff		 brk #$ff
$0f:c32b  00 3c		 brk #$3c
$0f:c32d  00 bd		 brk #$bd
$0f:c32f  81 81		 sta ($81,x)
$0f:c331  7e 00 ff	  ror $ff00,x
$0f:c334  00 ff		 brk #$ff
$0f:c336  00 ff		 brk #$ff
$0f:c338  00 ff		 brk #$ff
$0f:c33a  00 ff		 brk #$ff
$0f:c33c  00 ff		 brk #$ff
$0f:c33e  81 7e		 sta ($7e,x)
$0f:c340  14 0c		 trb $0c
$0f:c342  08			php
$0f:c343  18			clc
$0f:c344  11 0d		 ora ($0d),y
$0f:c346  0a			asl a
$0f:c347  07 05		 ora [$05]
$0f:c349  02 00		 cop #$00
$0f:c34b  00 00		 brk #$00
$0f:c34d  00 00		 brk #$00
$0f:c34f  00 3c		 brk #$3c
$0f:c351  03 38		 ora $38,s
$0f:c353  07 1d		 ora [$1d]
$0f:c355  02 1f		 cop #$1f
$0f:c357  00 0f		 brk #$0f
$0f:c359  00 03		 brk #$03
$0f:c35b  00 00		 brk #$00
$0f:c35d  00 00		 brk #$00
$0f:c35f  00 28		 brk #$28
$0f:c361  30 10		 bmi $c373
$0f:c363  18			clc
$0f:c364  88			dey
$0f:c365  b0 50		 bcs $c3b7
$0f:c367  e0 a0		 cpx #$a0
$0f:c369  40			rti
$0f:c36a  00 00		 brk #$00
$0f:c36c  00 00		 brk #$00
$0f:c36e  00 00		 brk #$00
$0f:c370  3c c0 1c	  bit $1cc0,x
$0f:c373  e0 b8		 cpx #$b8
$0f:c375  40			rti
$0f:c376  f8			sed
$0f:c377  00 f0		 brk #$f0
$0f:c379  00 c0		 brk #$c0
$0f:c37b  00 00		 brk #$00
$0f:c37d  00 00		 brk #$00
$0f:c37f  00 2f		 brk #$2f
$0f:c381  63 af		 adc $af,s
$0f:c383  67 af		 adc [$af]
$0f:c385  67 af		 adc [$af]
$0f:c387  67 af		 adc [$af]
$0f:c389  67 af		 adc [$af]
$0f:c38b  67 af		 adc [$af]
$0f:c38d  67 2f		 adc [$2f]
$0f:c38f  63 63		 adc $63,s
$0f:c391  1f e7 1f e7   ora $e71fe7,x
$0f:c395  1f e7 1f e7   ora $e71fe7,x
$0f:c399  1f e7 1f e7   ora $e71fe7,x
$0f:c39d  1f 63 1f ff   ora $ff1f63,x
$0f:c3a1  ff ff ff ff   sbc $ffffff,x
$0f:c3a5  ff ff ff ff   sbc $ffffff,x
$0f:c3a9  ff ff ff ff   sbc $ffffff,x
$0f:c3ad  ff ff ff ff   sbc $ffffff,x
$0f:c3b1  ff ff ff ff   sbc $ffffff,x
$0f:c3b5  ff ff ff ff   sbc $ffffff,x
$0f:c3b9  ff ff ff ff   sbc $ffffff,x
$0f:c3bd  ff ff ff 17   sbc $17ffff,x
$0f:c3c1  33 2b		 and ($2b,s),y
$0f:c3c3  19 0b 18	  ora $180b,y
$0f:c3c6  14 0c		 trb $0c
$0f:c3c8  0b			phd
$0f:c3c9  07 02		 ora [$02]
$0f:c3cb  01 00		 ora ($00,x)
$0f:c3cd  00 00		 brk #$00
$0f:c3cf  00 33		 brk #$33
$0f:c3d1  0f 39 07 18   ora $180739
$0f:c3d5  07 1c		 ora [$1c]
$0f:c3d7  03 0f		 ora $0f,s
$0f:c3d9  00 03		 brk #$03
$0f:c3db  00 00		 brk #$00
$0f:c3dd  00 00		 brk #$00
$0f:c3df  00 e8		 brk #$e8
$0f:c3e1  cc d4 98	  cpy $98d4
$0f:c3e4  d0 18		 bne $c3fe
$0f:c3e6  28			plp
$0f:c3e7  30 d0		 bmi $c3b9
$0f:c3e9  e0 40		 cpx #$40
$0f:c3eb  80 00		 bra $c3ed
$0f:c3ed  00 00		 brk #$00
$0f:c3ef  00 cc		 brk #$cc
$0f:c3f1  f0 9c		 beq $c38f
$0f:c3f3  e0 18		 cpx #$18
$0f:c3f5  e0 38		 cpx #$38
$0f:c3f7  c0 f0		 cpy #$f0
$0f:c3f9  00 c0		 brk #$c0
$0f:c3fb  00 00		 brk #$00
$0f:c3fd  00 00		 brk #$00
$0f:c3ff  00 00		 brk #$00
$0f:c401  00 00		 brk #$00
$0f:c403  00 00		 brk #$00
$0f:c405  00 03		 brk #$03
$0f:c407  03 04		 ora $04,s
$0f:c409  0c 59 48	  tsb $4859
$0f:c40c  1b			tcs
$0f:c40d  38			sec
$0f:c40e  03 1c		 ora $1c,s
$0f:c410  00 00		 brk #$00
$0f:c412  00 00		 brk #$00
$0f:c414  00 00		 brk #$00
$0f:c416  00 03		 brk #$03
$0f:c418  03 0f		 ora $0f,s
$0f:c41a  47 3f		 eor [$3f]
$0f:c41c  3b			tsc
$0f:c41d  07 0f		 ora [$0f]
$0f:c41f  13 00		 ora ($00,s),y
$0f:c421  10 10		 bpl $c433
$0f:c423  30 20		 bmi $c445
$0f:c425  60			rts
$0f:c426  e0 e0		 cpx #$e0
$0f:c428  10 10		 bpl $c43a
$0f:c42a  c0 00		 cpy #$00
$0f:c42c  68			pla
$0f:c42d  c8			iny
$0f:c42e  28			plp
$0f:c42f  c8			iny
$0f:c430  10 00		 bpl $c432
$0f:c432  30 00		 bmi $c434
$0f:c434  60			rts
$0f:c435  00 20		 brk #$20
$0f:c437  c0 e0		 cpy #$e0
$0f:c439  f0 f0		 beq $c42b
$0f:c43b  f0 f0		 beq $c42d
$0f:c43d  f8			sed
$0f:c43e  f0 f8		 beq $c438
$0f:c440  00 00		 brk #$00
$0f:c442  00 00		 brk #$00
$0f:c444  00 00		 brk #$00
$0f:c446  03 03		 ora $03,s
$0f:c448  04 0c		 tsb $0c
$0f:c44a  0b			phd
$0f:c44b  0b			phd
$0f:c44c  0a			asl a
$0f:c44d  1e 05 1c	  asl $1c05,x
$0f:c450  00 00		 brk #$00
$0f:c452  00 00		 brk #$00
$0f:c454  00 00		 brk #$00
$0f:c456  00 03		 brk #$03
$0f:c458  03 0f		 ora $0f,s
$0f:c45a  04 0f		 tsb $0f
$0f:c45c  01 1f		 ora ($1f,x)
$0f:c45e  03 1f		 ora $1f,s
$0f:c460  00 00		 brk #$00
$0f:c462  20 20 00	  jsr $0020
$0f:c465  40			rti
$0f:c466  e0 c0		 cpx #$c0
$0f:c468  b0 b0		 bcs $c41a
$0f:c46a  80 80		 bra $c3ec
$0f:c46c  e8			inx
$0f:c46d  48			pha
$0f:c46e  28			plp
$0f:c46f  c8			iny
$0f:c470  00 00		 brk #$00
$0f:c472  20 00 40	  jsr $4000
$0f:c475  20 40 a0	  jsr $a040
$0f:c478  a0 50		 ldy #$50
$0f:c47a  b0 70		 bcs $c4ec
$0f:c47c  f0 f8		 beq $c476
$0f:c47e  f0 f8		 beq $c478
$0f:c480  00 00		 brk #$00
$0f:c482  00 00		 brk #$00
$0f:c484  01 01		 ora ($01,x)
$0f:c486  03 03		 ora $03,s
$0f:c488  04 0c		 tsb $0c
$0f:c48a  09 08		 ora #$08
$0f:c48c  0b			phd
$0f:c48d  18			clc
$0f:c48e  0b			phd
$0f:c48f  18			clc
$0f:c490  00 00		 brk #$00
$0f:c492  00 01		 brk #$01
$0f:c494  01 00		 ora ($00,x)
$0f:c496  00 03		 brk #$03
$0f:c498  03 0f		 ora $0f,s
$0f:c49a  07 0f		 ora [$0f]
$0f:c49c  07 1f		 ora [$1f]
$0f:c49e  07 1f		 ora [$1f]
$0f:c4a0  00 00		 brk #$00
$0f:c4a2  00 00		 brk #$00
$0f:c4a4  00 00		 brk #$00
$0f:c4a6  c0 c0		 cpy #$c0
$0f:c4a8  10 10		 bpl $c4ba
$0f:c4aa  c0 00		 cpy #$00
$0f:c4ac  68			pla
$0f:c4ad  c8			iny
$0f:c4ae  28			plp
$0f:c4af  c8			iny
$0f:c4b0  00 00		 brk #$00
$0f:c4b2  00 00		 brk #$00
$0f:c4b4  00 80		 brk #$80
$0f:c4b6  00 c0		 brk #$c0
$0f:c4b8  e0 f0		 cpx #$f0
$0f:c4ba  f0 f0		 beq $c4ac
$0f:c4bc  f0 f8		 beq $c4b6
$0f:c4be  f0 f8		 beq $c4b8
$0f:c4c0  00 00		 brk #$00
$0f:c4c2  20 20 10	  jsr $1020
$0f:c4c5  30 1b		 bmi $c4e2
$0f:c4c7  1b			tcs
$0f:c4c8  04 1c		 tsb $1c
$0f:c4ca  09 08		 ora #$08
$0f:c4cc  0a			asl a
$0f:c4cd  18			clc
$0f:c4ce  09 19		 ora #$19
$0f:c4d0  00 00		 brk #$00
$0f:c4d2  20 00 30	  jsr $3000
$0f:c4d5  00 18		 brk #$18
$0f:c4d7  03 13		 ora $13,s
$0f:c4d9  0f 07 0f 07   ora $070f07
$0f:c4dd  1f 06 1f 00   ora $001f06,x
$0f:c4e1  00 00		 brk #$00
$0f:c4e3  00 00		 brk #$00
$0f:c4e5  00 c0		 brk #$c0
$0f:c4e7  c0 10		 cpy #$10
$0f:c4e9  10 80		 bpl $c46b
$0f:c4eb  00 a8		 brk #$a8
$0f:c4ed  88			dey
$0f:c4ee  ea			nop
$0f:c4ef  cf 00 00 00   cmp $000000
$0f:c4f3  00 00		 brk #$00
$0f:c4f5  00 00		 brk #$00
$0f:c4f7  c0 e0		 cpy #$e0
$0f:c4f9  f0 b0		 beq $c4ab
$0f:c4fb  f0 b0		 beq $c4ad
$0f:c4fd  78			sei
$0f:c4fe  f7 38		 sbc [$38],y
$0f:c500  00 00		 brk #$00
$0f:c502  02 00		 cop #$00
$0f:c504  05 02		 ora $02
$0f:c506  0a			asl a
$0f:c507  07 1b		 ora [$1b]
$0f:c509  07 22		 ora [$22]
$0f:c50b  1e 38 18	  asl $1838,x
$0f:c50e  15 0c		 ora $0c,x
$0f:c510  00 00		 brk #$00
$0f:c512  03 00		 ora $00,s
$0f:c514  0f 00 1f 00   ora $001f00
$0f:c518  3f 00 3e 01   and $013e00,x
$0f:c51c  78			sei
$0f:c51d  07 7c		 ora [$7c]
$0f:c51f  03 00		 ora $00,s
$0f:c521  00 40		 brk #$40
$0f:c523  00 a0		 brk #$a0
$0f:c525  40			rti
$0f:c526  50 e0		 bvc $c508
$0f:c528  d8			cld
$0f:c529  e0 44		 cpx #$44
$0f:c52b  78			sei
$0f:c52c  1c 18 a8	  trb $a818
$0f:c52f  30 00		 bmi $c531
$0f:c531  00 c0		 brk #$c0
$0f:c533  00 f0		 brk #$f0
$0f:c535  00 f8		 brk #$f8
$0f:c537  00 fc		 brk #$fc
$0f:c539  00 7c		 brk #$7c
$0f:c53b  80 1e		 bra $c55b
$0f:c53d  e0 3e		 cpx #$3e
$0f:c53f  c0 00		 cpy #$00
$0f:c541  00 00		 brk #$00
$0f:c543  00 00		 brk #$00
$0f:c545  00 00		 brk #$00
$0f:c547  00 00		 brk #$00
$0f:c549  00 00		 brk #$00
$0f:c54b  00 00		 brk #$00
$0f:c54d  00 01		 brk #$01
$0f:c54f  00 00		 brk #$00
$0f:c551  00 00		 brk #$00
$0f:c553  00 00		 brk #$00
$0f:c555  00 00		 brk #$00
$0f:c557  00 00		 brk #$00
$0f:c559  00 01		 brk #$01
$0f:c55b  00 03		 brk #$03
$0f:c55d  00 07		 brk #$07
$0f:c55f  00 00		 brk #$00
$0f:c561  00 00		 brk #$00
$0f:c563  00 00		 brk #$00
$0f:c565  00 00		 brk #$00
$0f:c567  00 24		 brk #$24
$0f:c569  00 db		 brk #$db
$0f:c56b  24 66		 bit $66
$0f:c56d  ff 5b db 00   sbc $00db5b,x
$0f:c571  00 00		 brk #$00
$0f:c573  00 00		 brk #$00
$0f:c575  00 3c		 brk #$3c
$0f:c577  00 ff		 brk #$ff
$0f:c579  00 ff		 brk #$ff
$0f:c57b  00 ff		 brk #$ff
$0f:c57d  00 db		 brk #$db
$0f:c57f  24 00		 bit $00
$0f:c581  00 00		 brk #$00
$0f:c583  03 0b		 ora $0b,s
$0f:c585  07 14		 ora [$14]
$0f:c587  0c 29 18	  tsb $1829
$0f:c58a  2b			pld
$0f:c58b  18			clc
$0f:c58c  57 31		 eor [$31],y
$0f:c58e  57 33		 eor [$33],y
$0f:c590  00 00		 brk #$00
$0f:c592  03 00		 ora $00,s
$0f:c594  0f 00 1c 03   ora $031c00
$0f:c598  38			sec
$0f:c599  07 38		 ora [$38]
$0f:c59b  07 71		 ora [$71]
$0f:c59d  0f 73 0f 00   ora $000f73
$0f:c5a1  00 00		 brk #$00
$0f:c5a3  c0 d0		 cpy #$d0
$0f:c5a5  e0 28		 cpx #$28
$0f:c5a7  30 94		 bmi $c53d
$0f:c5a9  18			clc
$0f:c5aa  d4 18		 pei ($18)
$0f:c5ac  ea			nop
$0f:c5ad  8c ea cc	  sty $ccea
$0f:c5b0  00 00		 brk #$00
$0f:c5b2  c0 00		 cpy #$00
$0f:c5b4  f0 00		 beq $c5b6
$0f:c5b6  38			sec
$0f:c5b7  c0 1c		 cpy #$1c
$0f:c5b9  e0 1c		 cpx #$1c
$0f:c5bb  e0 8e		 cpx #$8e
$0f:c5bd  f0 ce		 beq $c58d
$0f:c5bf  f0 00		 beq $c5c1
$0f:c5c1  00 00		 brk #$00
$0f:c5c3  00 00		 brk #$00
$0f:c5c5  00 00		 brk #$00
$0f:c5c7  00 00		 brk #$00
$0f:c5c9  00 01		 brk #$01
$0f:c5cb  00 02		 brk #$02
$0f:c5cd  01 05		 ora ($05,x)
$0f:c5cf  03 00		 ora $00,s
$0f:c5d1  00 00		 brk #$00
$0f:c5d3  00 00		 brk #$00
$0f:c5d5  00 00		 brk #$00
$0f:c5d7  00 00		 brk #$00
$0f:c5d9  00 01		 brk #$01
$0f:c5db  00 03		 brk #$03
$0f:c5dd  00 07		 brk #$07
$0f:c5df  00 00		 brk #$00
$0f:c5e1  00 00		 brk #$00
$0f:c5e3  00 00		 brk #$00
$0f:c5e5  00 00		 brk #$00
$0f:c5e7  3c bd 7e	  bit $7ebd,x
$0f:c5ea  42 c3		 wdm #$c3
$0f:c5ec  bd 81 7e	  lda $7e81,x
$0f:c5ef  00 00		 brk #$00
$0f:c5f1  00 00		 brk #$00
$0f:c5f3  00 00		 brk #$00
$0f:c5f5  00 3c		 brk #$3c
$0f:c5f7  00 ff		 brk #$ff
$0f:c5f9  00 c3		 brk #$c3
$0f:c5fb  3c 81 7e	  bit $7e81,x
$0f:c5fe  00 ff		 brk #$ff
$0f:c600  01 1c		 ora ($1c,x)
$0f:c602  04 1c		 tsb $1c
$0f:c604  06 0e		 asl $0e
$0f:c606  03 0f		 ora $0f,s
$0f:c608  00 0b		 brk #$0b
$0f:c60a  00 00		 brk #$00
$0f:c60c  00 00		 brk #$00
$0f:c60e  00 00		 brk #$00
$0f:c610  03 1f		 ora $1f,s
$0f:c612  03 1f		 ora $1f,s
$0f:c614  01 0f		 ora ($0f,x)
$0f:c616  00 0f		 brk #$0f
$0f:c618  08			php
$0f:c619  03 00		 ora $00,s
$0f:c61b  00 00		 brk #$00
$0f:c61d  00 00		 brk #$00
$0f:c61f  00 c8		 brk #$c8
$0f:c621  08			php
$0f:c622  18			clc
$0f:c623  18			clc
$0f:c624  30 30		 bmi $c656
$0f:c626  20 f0 20	  jsr $20f0
$0f:c629  e0 10		 cpx #$10
$0f:c62b  30 00		 bmi $c62d
$0f:c62d  10 00		 bpl $c62f
$0f:c62f  00 f0		 brk #$f0
$0f:c631  f8			sed
$0f:c632  e0 f8		 cpx #$f8
$0f:c634  c0 f0		 cpy #$f0
$0f:c636  60			rts
$0f:c637  90 60		 bcc $c699
$0f:c639  80 30		 bra $c66b
$0f:c63b  00 10		 brk #$10
$0f:c63d  00 00		 brk #$00
$0f:c63f  00 01		 brk #$01
$0f:c641  18			clc
$0f:c642  00 18		 brk #$18
$0f:c644  04 06		 tsb $06
$0f:c646  19 1f 20	  ora $201f,y
$0f:c649  33 00		 and ($00,s),y
$0f:c64b  00 00		 brk #$00
$0f:c64d  00 00		 brk #$00
$0f:c64f  00 07		 brk #$07
$0f:c651  1f 03 1f 07   ora $071f03,x
$0f:c655  09 1c		 ora #$1c
$0f:c657  03 30		 ora $30,s
$0f:c659  03 00		 ora $00,s
$0f:c65b  00 00		 brk #$00
$0f:c65d  00 00		 brk #$00
$0f:c65f  00 c8		 brk #$c8
$0f:c661  08			php
$0f:c662  18			clc
$0f:c663  18			clc
$0f:c664  30 30		 bmi $c696
$0f:c666  d0 f0		 bne $c658
$0f:c668  08			php
$0f:c669  f8			sed
$0f:c66a  04 0c		 tsb $0c
$0f:c66c  00 00		 brk #$00
$0f:c66e  00 00		 brk #$00
$0f:c670  f0 f8		 beq $c66a
$0f:c672  e0 f8		 cpx #$f8
$0f:c674  c0 f0		 cpy #$f0
$0f:c676  10 e0		 bpl $c658
$0f:c678  38			sec
$0f:c679  c0 0c		 cpy #$0c
$0f:c67b  00 00		 brk #$00
$0f:c67d  00 00		 brk #$00
$0f:c67f  00 09		 brk #$09
$0f:c681  18			clc
$0f:c682  0d 1d 06	  ora $061d
$0f:c685  3f 22 6f 00   and $006f22,x
$0f:c689  03 00		 ora $00,s
$0f:c68b  00 00		 brk #$00
$0f:c68d  00 00		 brk #$00
$0f:c68f  00 07		 brk #$07
$0f:c691  1f 03 1e 30   ora $301e03,x
$0f:c695  0f 60 0f 00   ora $000f60
$0f:c699  03 00		 ora $00,s
$0f:c69b  00 00		 brk #$00
$0f:c69d  00 00		 brk #$00
$0f:c69f  00 88		 brk #$88
$0f:c6a1  08			php
$0f:c6a2  58			cli
$0f:c6a3  58			cli
$0f:c6a4  b4 bc		 ldy $bc,x
$0f:c6a6  62 fe 00	  per $c7a7
$0f:c6a9  c0 00		 cpy #$00
$0f:c6ab  00 00		 brk #$00
$0f:c6ad  00 00		 brk #$00
$0f:c6af  00 70		 brk #$70
$0f:c6b1  f8			sed
$0f:c6b2  60			rts
$0f:c6b3  b8			clv
$0f:c6b4  8c 70 4e	  sty $4e70
$0f:c6b7  b0 00		 bcs $c6b9
$0f:c6b9  c0 00		 cpy #$00
$0f:c6bb  00 00		 brk #$00
$0f:c6bd  00 00		 brk #$00
$0f:c6bf  00 0c		 brk #$0c
$0f:c6c1  1f 09 1f 00   ora $001f09,x
$0f:c6c5  0e 01 0f	  asl $0f01
$0f:c6c8  00 03		 brk #$03
$0f:c6ca  01 03		 ora ($03,x)
$0f:c6cc  01 03		 ora ($03,x)
$0f:c6ce  00 01		 brk #$01
$0f:c6d0  00 1f		 brk #$1f
$0f:c6d2  00 1f		 brk #$1f
$0f:c6d4  01 0f		 ora ($0f,x)
$0f:c6d6  00 0f		 brk #$0f
$0f:c6d8  00 03		 brk #$03
$0f:c6da  03 00		 ora $00,s
$0f:c6dc  03 00		 ora $00,s
$0f:c6de  01 00		 ora ($00,x)
$0f:c6e0  c8			iny
$0f:c6e1  8c 18 18	  sty $1818
$0f:c6e4  30 30		 bmi $c716
$0f:c6e6  e0 f0		 cpx #$f0
$0f:c6e8  00 c0		 brk #$c0
$0f:c6ea  00 00		 brk #$00
$0f:c6ec  00 00		 brk #$00
$0f:c6ee  00 00		 brk #$00
$0f:c6f0  74 f8		 stz $f8,x
$0f:c6f2  e0 f8		 cpx #$f8
$0f:c6f4  c0 f0		 cpy #$f0
$0f:c6f6  00 f0		 brk #$f0
$0f:c6f8  00 c0		 brk #$c0
$0f:c6fa  00 00		 brk #$00
$0f:c6fc  00 00		 brk #$00
$0f:c6fe  00 00		 brk #$00
$0f:c700  15 0c		 ora $0c,x
$0f:c702  38			sec
$0f:c703  18			clc
$0f:c704  22 1e 1b 07   jsl $071b1e
$0f:c708  0a			asl a
$0f:c709  07 05		 ora [$05]
$0f:c70b  02 02		 cop #$02
$0f:c70d  00 00		 brk #$00
$0f:c70f  00 7c		 brk #$7c
$0f:c711  03 78		 ora $78,s
$0f:c713  07 3e		 ora [$3e]
$0f:c715  01 3f		 ora ($3f,x)
$0f:c717  00 1f		 brk #$1f
$0f:c719  00 0f		 brk #$0f
$0f:c71b  00 03		 brk #$03
$0f:c71d  00 00		 brk #$00
$0f:c71f  00 a8		 brk #$a8
$0f:c721  30 1c		 bmi $c73f
$0f:c723  18			clc
$0f:c724  44 78 d8	  mvp $d8,$78
$0f:c727  e0 50		 cpx #$50
$0f:c729  e0 a0		 cpx #$a0
$0f:c72b  40			rti
$0f:c72c  40			rti
$0f:c72d  00 00		 brk #$00
$0f:c72f  00 3e		 brk #$3e
$0f:c731  c0 1e		 cpy #$1e
$0f:c733  e0 7c		 cpx #$7c
$0f:c735  80 fc		 bra $c733
$0f:c737  00 f8		 brk #$f8
$0f:c739  00 f0		 brk #$f0
$0f:c73b  00 c0		 brk #$c0
$0f:c73d  00 00		 brk #$00
$0f:c73f  00 04		 brk #$04
$0f:c741  03 07		 ora $07,s
$0f:c743  03 0a		 ora $0a,s
$0f:c745  06 05		 asl $05
$0f:c747  03 05		 ora $05,s
$0f:c749  03 0a		 ora $0a,s
$0f:c74b  06 07		 asl $07
$0f:c74d  03 05		 ora $05,s
$0f:c74f  03 0f		 ora $0f,s
$0f:c751  00 0f		 brk #$0f
$0f:c753  00 1e		 brk #$1e
$0f:c755  01 1f		 ora ($1f,x)
$0f:c757  00 1f		 brk #$1f
$0f:c759  00 1e		 brk #$1e
$0f:c75b  01 0f		 ora ($0f,x)
$0f:c75d  00 0f		 brk #$0f
$0f:c75f  00 42		 brk #$42
$0f:c761  c3 c3		 cmp $c3,s
$0f:c763  c3 18		 cmp $18,s
$0f:c765  00 3c		 brk #$3c
$0f:c767  00 3c		 brk #$3c
$0f:c769  00 18		 brk #$18
$0f:c76b  00 c3		 brk #$c3
$0f:c76d  c3 42		 cmp $42,s
$0f:c76f  c3 c3		 cmp $c3,s
$0f:c771  3c c3 3c	  bit $3cc3,x
$0f:c774  00 ff		 brk #$ff
$0f:c776  00 ff		 brk #$ff
$0f:c778  00 ff		 brk #$ff
$0f:c77a  00 ff		 brk #$ff
$0f:c77c  c3 3c		 cmp $3c,s
$0f:c77e  c3 3c		 cmp $3c,s
$0f:c780  57 33		 eor [$33],y
$0f:c782  57 31		 eor [$31],y
$0f:c784  2b			pld
$0f:c785  18			clc
$0f:c786  29 18		 and #$18
$0f:c788  14 0c		 trb $0c
$0f:c78a  0b			phd
$0f:c78b  07 00		 ora [$00]
$0f:c78d  03 00		 ora $00,s
$0f:c78f  00 73		 brk #$73
$0f:c791  0f 71 0f 38   ora $380f71
$0f:c795  07 38		 ora [$38]
$0f:c797  07 1c		 ora [$1c]
$0f:c799  03 0f		 ora $0f,s
$0f:c79b  00 03		 brk #$03
$0f:c79d  00 00		 brk #$00
$0f:c79f  00 ea		 brk #$ea
$0f:c7a1  cc ea 8c	  cpy $8cea
$0f:c7a4  d4 18		 pei ($18)
$0f:c7a6  94 18		 sty $18,x
$0f:c7a8  28			plp
$0f:c7a9  30 d0		 bmi $c77b
$0f:c7ab  e0 00		 cpx #$00
$0f:c7ad  c0 00		 cpy #$00
$0f:c7af  00 ce		 brk #$ce
$0f:c7b1  f0 8e		 beq $c741
$0f:c7b3  f0 1c		 beq $c7d1
$0f:c7b5  e0 1c		 cpx #$1c
$0f:c7b7  e0 38		 cpx #$38
$0f:c7b9  c0 f0		 cpy #$f0
$0f:c7bb  00 c0		 brk #$c0
$0f:c7bd  00 00		 brk #$00
$0f:c7bf  00 0a		 brk #$0a
$0f:c7c1  06 0a		 asl $0a
$0f:c7c3  06 15		 asl $15
$0f:c7c5  0c 15 0c	  tsb $0c15
$0f:c7c8  15 0c		 ora $0c,x
$0f:c7ca  15 0c		 ora $0c,x
$0f:c7cc  0a			asl a
$0f:c7cd  06 0a		 asl $0a
$0f:c7cf  06 0e		 asl $0e
$0f:c7d1  01 0e		 ora ($0e,x)
$0f:c7d3  01 1c		 ora ($1c,x)
$0f:c7d5  03 1c		 ora $1c,s
$0f:c7d7  03 1c		 ora $1c,s
$0f:c7d9  03 1c		 ora $1c,s
$0f:c7db  03 0e		 ora $0e,s
$0f:c7dd  01 0e		 ora ($0e,x)
$0f:c7df  01 ff		 ora ($ff,x)
$0f:c7e1  00 ff		 brk #$ff
$0f:c7e3  7e ff ff	  ror $ffff,x
$0f:c7e6  ff ff ff ff   sbc $ffffff,x
$0f:c7ea  ff ff ff 7e   sbc $7effff,x
$0f:c7ee  ff 3c 00 ff   sbc $ff003c,x
$0f:c7f2  7e ff ff	  ror $ffff,x
$0f:c7f5  ff ff ff ff   sbc $ffffff,x
$0f:c7f9  ff ff ff 7e   sbc $7effff,x
$0f:c7fd  ff 3c ff 00   sbc $00ff3c,x
$0f:c801  00 00		 brk #$00
$0f:c803  00 00		 brk #$00
$0f:c805  00 00		 brk #$00
$0f:c807  00 01		 brk #$01
$0f:c809  00 06		 brk #$06
$0f:c80b  00 00		 brk #$00
$0f:c80d  00 00		 brk #$00
$0f:c80f  00 00		 brk #$00
$0f:c811  00 00		 brk #$00
$0f:c813  00 00		 brk #$00
$0f:c815  00 00		 brk #$00
$0f:c817  00 01		 brk #$01
$0f:c819  01 06		 ora ($06,x)
$0f:c81b  06 00		 asl $00
$0f:c81d  08			php
$0f:c81e  00 10		 brk #$10
$0f:c820  00 00		 brk #$00
$0f:c822  00 00		 brk #$00
$0f:c824  0e 0f 10	  asl $100f
$0f:c827  10 00		 bpl $c829
$0f:c829  00 00		 brk #$00
$0f:c82b  00 00		 brk #$00
$0f:c82d  00 0e		 brk #$0e
$0f:c82f  00 00		 brk #$00
$0f:c831  00 00		 brk #$00
$0f:c833  00 00		 brk #$00
$0f:c835  0f 60 70 80   ora $807060
$0f:c839  80 00		 bra $c83b
$0f:c83b  00 00		 brk #$00
$0f:c83d  00 0f		 brk #$0f
$0f:c83f  0f 00 00 00   ora $000000
$0f:c843  00 10		 brk #$10
$0f:c845  f0 0e		 beq $c855
$0f:c847  0e 01 01	  asl $0101
$0f:c84a  00 00		 brk #$00
$0f:c84c  00 00		 brk #$00
$0f:c84e  00 00		 brk #$00
$0f:c850  00 00		 brk #$00
$0f:c852  00 00		 brk #$00
$0f:c854  10 f0		 bpl $c846
$0f:c856  0e 0e 01	  asl $010e
$0f:c859  01 00		 ora ($00,x)
$0f:c85b  00 00		 brk #$00
$0f:c85d  00 f0		 brk #$f0
$0f:c85f  f0 00		 beq $c861
$0f:c861  00 00		 brk #$00
$0f:c863  00 00		 brk #$00
$0f:c865  00 00		 brk #$00
$0f:c867  00 00		 brk #$00
$0f:c869  80 00		 bra $c86b
$0f:c86b  60			rts
$0f:c86c  00 10		 brk #$10
$0f:c86e  08			php
$0f:c86f  00 00		 brk #$00
$0f:c871  00 00		 brk #$00
$0f:c873  00 00		 brk #$00
$0f:c875  00 00		 brk #$00
$0f:c877  00 80		 brk #$80
$0f:c879  80 60		 bra $c8db
$0f:c87b  60			rts
$0f:c87c  10 10		 bpl $c88e
$0f:c87e  08			php
$0f:c87f  08			php
$0f:c880  99 00 5c	  sta $5c00,y
$0f:c883  40			rti
$0f:c884  5e 20 04	  lsr $0420,x
$0f:c887  07 10		 ora [$10]
$0f:c889  20 08 00	  jsr $0008
$0f:c88c  04 10		 tsb $10
$0f:c88e  02 03		 cop #$03
$0f:c890  87 f8		 sta [$f8]
$0f:c892  43 3c		 eor $3c,s
$0f:c894  61 7e		 adc ($7e,x)
$0f:c896  08			php
$0f:c897  2f 2c 34 07   and $07342c
$0f:c89b  18			clc
$0f:c89c  13 14		 ora ($14,s),y
$0f:c89e  0c 07 f0	  tsb $f007
$0f:c8a1  0e 3e 02	  asl $023e
$0f:c8a4  16 04		 asl $04,x
$0f:c8a6  84 ec		 sty $ec
$0f:c8a8  04 18		 tsb $18
$0f:c8aa  c8			iny
$0f:c8ab  38			sec
$0f:c8ac  60			rts
$0f:c8ad  08			php
$0f:c8ae  90 d0		 bcc $c880
$0f:c8b0  ff 01 fe 00   sbc $00fe01,x
$0f:c8b4  f2 06		 sbc ($06)
$0f:c8b6  fc f0 3c	  jsr ($3cf0,x)
$0f:c8b9  24 f8		 bit $f8
$0f:c8bb  00 e8		 brk #$e8
$0f:c8bd  08			php
$0f:c8be  f0 e0		 beq $c8a0
$0f:c8c0  00 00		 brk #$00
$0f:c8c2  00 00		 brk #$00
$0f:c8c4  08			php
$0f:c8c5  08			php
$0f:c8c6  00 00		 brk #$00
$0f:c8c8  00 00		 brk #$00
$0f:c8ca  08			php
$0f:c8cb  00 18		 brk #$18
$0f:c8cd  10 1c		 bpl $c8eb
$0f:c8cf  14 00		 trb $00
$0f:c8d1  00 00		 brk #$00
$0f:c8d3  00 00		 brk #$00
$0f:c8d5  08			php
$0f:c8d6  08			php
$0f:c8d7  08			php
$0f:c8d8  08			php
$0f:c8d9  08			php
$0f:c8da  08			php
$0f:c8db  08			php
$0f:c8dc  08			php
$0f:c8dd  18			clc
$0f:c8de  08			php
$0f:c8df  1c 00 00	  trb $0000
$0f:c8e2  00 00		 brk #$00
$0f:c8e4  00 00		 brk #$00
$0f:c8e6  00 00		 brk #$00
$0f:c8e8  08			php
$0f:c8e9  08			php
$0f:c8ea  00 00		 brk #$00
$0f:c8ec  00 00		 brk #$00
$0f:c8ee  00 00		 brk #$00
$0f:c8f0  00 00		 brk #$00
$0f:c8f2  00 00		 brk #$00
$0f:c8f4  00 00		 brk #$00
$0f:c8f6  00 00		 brk #$00
$0f:c8f8  00 08		 brk #$08
$0f:c8fa  08			php
$0f:c8fb  08			php
$0f:c8fc  08			php
$0f:c8fd  08			php
$0f:c8fe  08			php
$0f:c8ff  08			php
$0f:c900  04 04		 tsb $04
$0f:c902  04 04		 tsb $04
$0f:c904  00 00		 brk #$00
$0f:c906  00 00		 brk #$00
$0f:c908  04 04		 tsb $04
$0f:c90a  00 04		 brk #$04
$0f:c90c  08			php
$0f:c90d  08			php
$0f:c90e  08			php
$0f:c90f  08			php
$0f:c910  00 04		 brk #$04
$0f:c912  00 04		 brk #$04
$0f:c914  04 04		 tsb $04
$0f:c916  04 04		 tsb $04
$0f:c918  08			php
$0f:c919  0c 08 0c	  tsb $0c08
$0f:c91c  00 08		 brk #$08
$0f:c91e  00 08		 brk #$08
$0f:c920  00 00		 brk #$00
$0f:c922  00 00		 brk #$00
$0f:c924  00 00		 brk #$00
$0f:c926  00 20		 brk #$20
$0f:c928  20 20 20	  jsr $2020
$0f:c92b  20 00 00	  jsr $0000
$0f:c92e  00 50		 brk #$50
$0f:c930  00 00		 brk #$00
$0f:c932  00 00		 brk #$00
$0f:c934  00 00		 brk #$00
$0f:c936  00 20		 brk #$20
$0f:c938  00 20		 brk #$20
$0f:c93a  00 20		 brk #$20
$0f:c93c  20 20 20	  jsr $2020
$0f:c93f  70 00		 bvs $c941
$0f:c941  00 00		 brk #$00
$0f:c943  01 09		 ora ($09,x)
$0f:c945  09 09		 ora #$09
$0f:c947  09 02		 ora #$02
$0f:c949  0a			asl a
$0f:c94a  02 02		 cop #$02
$0f:c94c  01 00		 ora ($00,x)
$0f:c94e  01 00		 ora ($00,x)
$0f:c950  00 00		 brk #$00
$0f:c952  00 01		 brk #$01
$0f:c954  00 09		 brk #$09
$0f:c956  00 09		 brk #$09
$0f:c958  01 0b		 ora ($0b,x)
$0f:c95a  01 03		 ora ($03,x)
$0f:c95c  03 03		 ora $03,s
$0f:c95e  03 03		 ora $03,s
$0f:c960  00 00		 brk #$00
$0f:c962  00 00		 brk #$00
$0f:c964  20 20 20	  jsr $2020
$0f:c967  20 10 90	  jsr $9010
$0f:c96a  90 90		 bcc $c8fc
$0f:c96c  00 00		 brk #$00
$0f:c96e  20 20 00	  jsr $0020
$0f:c971  00 00		 brk #$00
$0f:c973  00 00		 brk #$00
$0f:c975  20 00 20	  jsr $2000
$0f:c978  20 b0 20	  jsr $20b0
$0f:c97b  b0 a0		 bcs $c91d
$0f:c97d  a0 80		 ldy #$80
$0f:c97f  a0 00		 ldy #$00
$0f:c981  00 01		 brk #$01
$0f:c983  01 00		 ora ($00,x)
$0f:c985  00 00		 brk #$00
$0f:c987  00 03		 brk #$03
$0f:c989  02 03		 cop #$03
$0f:c98b  02 02		 cop #$02
$0f:c98d  02 00		 cop #$00
$0f:c98f  02 00		 cop #$00
$0f:c991  00 00		 brk #$00
$0f:c993  01 01		 ora ($01,x)
$0f:c995  01 01		 ora ($01,x)
$0f:c997  01 01		 ora ($01,x)
$0f:c999  03 01		 ora $01,s
$0f:c99b  03 01		 ora $01,s
$0f:c99d  03 01		 ora $01,s
$0f:c99f  03 40		 ora $40,s
$0f:c9a1  40			rti
$0f:c9a2  40			rti
$0f:c9a3  40			rti
$0f:c9a4  a0 60		 ldy #$60
$0f:c9a6  80 00		 bra $c9a8
$0f:c9a8  00 80		 brk #$80
$0f:c9aa  a0 20		 ldy #$20
$0f:c9ac  80 50		 bra $c9fe
$0f:c9ae  d0 50		 bne $ca00
$0f:c9b0  80 c0		 bra $c972
$0f:c9b2  80 c0		 bra $c974
$0f:c9b4  80 e0		 bra $c996
$0f:c9b6  a0 a0		 ldy #$a0
$0f:c9b8  a0 a0		 ldy #$a0
$0f:c9ba  80 a0		 bra $c95c
$0f:c9bc  80 d0		 bra $c98e
$0f:c9be  80 d0		 bra $c990
$0f:c9c0  00 00		 brk #$00
$0f:c9c2  00 00		 brk #$00
$0f:c9c4  00 00		 brk #$00
$0f:c9c6  00 00		 brk #$00
$0f:c9c8  00 00		 brk #$00
$0f:c9ca  00 00		 brk #$00
$0f:c9cc  05 05		 ora $05
$0f:c9ce  00 01		 brk #$01
$0f:c9d0  00 00		 brk #$00
$0f:c9d2  00 00		 brk #$00
$0f:c9d4  01 01		 ora ($01,x)
$0f:c9d6  01 01		 ora ($01,x)
$0f:c9d8  01 01		 ora ($01,x)
$0f:c9da  01 01		 ora ($01,x)
$0f:c9dc  00 05		 brk #$05
$0f:c9de  04 05		 tsb $05
$0f:c9e0  00 00		 brk #$00
$0f:c9e2  20 20 a0	  jsr $a020
$0f:c9e5  a0 00		 ldy #$00
$0f:c9e7  80 00		 bra $c9e9
$0f:c9e9  00 00		 brk #$00
$0f:c9eb  00 00		 brk #$00
$0f:c9ed  00 00		 brk #$00
$0f:c9ef  20 80 80	  jsr $8080
$0f:c9f2  80 a0		 bra $c994
$0f:c9f4  00 a0		 brk #$a0
$0f:c9f6  00 80		 brk #$80
$0f:c9f8  00 00		 brk #$00
$0f:c9fa  00 00		 brk #$00
$0f:c9fc  00 00		 brk #$00
$0f:c9fe  00 20		 brk #$20
$0f:ca00  20 00 40	  jsr $4000
$0f:ca03  01 02		 ora ($02,x)
$0f:ca05  03 04		 ora $04,s
$0f:ca07  07 44		 ora [$44]
$0f:ca09  07 4c		 ora [$4c]
$0f:ca0b  0e 48 2c	  asl $2c48
$0f:ca0e  48			pha
$0f:ca0f  ad 00 20	  lda $2000
$0f:ca12  21 41		 and ($41,x)
$0f:ca14  43 03		 eor $03,s
$0f:ca16  c7 07		 cmp [$07]
$0f:ca18  c7 07		 cmp [$07]
$0f:ca1a  ce 0e ec	  dec $ec0e
$0f:ca1d  0c 6c 8d	  tsb $8d6c
$0f:ca20  18			clc
$0f:ca21  60			rts
$0f:ca22  70 80		 bvs $c9a4
$0f:ca24  f0 00		 beq $ca26
$0f:ca26  c0 00		 cpy #$00
$0f:ca28  04 07		 tsb $07
$0f:ca2a  19 3e 33	  ora $333e,y
$0f:ca2d  fc 70 f0	  jsr ($f070,x)
$0f:ca30  7f 7f ff ff   adc $ffff7f,x
$0f:ca34  f8			sed
$0f:ca35  f8			sed
$0f:ca36  c0 c0		 cpy #$c0
$0f:ca38  07 07		 ora [$07]
$0f:ca3a  1f 3f 3f ff   ora $ff3f3f,x
$0f:ca3e  70 f0		 bvs $ca30
$0f:ca40  3e 3e f8	  rol $f83e,x
$0f:ca43  ff 10 1f 00   sbc $001f10,x
$0f:ca47  03 60		 ora $60,s
$0f:ca49  80 c0		 bra $ca0b
$0f:ca4b  00 0e		 brk #$0e
$0f:ca4d  0e 0f 0f	  asl $0f0f
$0f:ca50  c0 fe		 cpy #$fe
$0f:ca52  00 ff		 brk #$ff
$0f:ca54  00 1f		 brk #$1f
$0f:ca56  00 03		 brk #$03
$0f:ca58  e0 e0		 cpx #$e0
$0f:ca5a  fc fc f1	  jsr ($f1fc,x)
$0f:ca5d  ff 00 0f 04   sbc $040f00,x
$0f:ca61  04 06		 tsb $06
$0f:ca63  82 02 c2	  brl $8c68
$0f:ca66  01 e3		 ora ($e3,x)
$0f:ca68  e0 e3		 cpx #$e3
$0f:ca6a  70 73		 bvs $cadf
$0f:ca6c  10 37		 bpl $caa5
$0f:ca6e  a6 91		 ldx $91
$0f:ca70  04 00		 tsb $00
$0f:ca72  06 84		 asl $84
$0f:ca74  02 c0		 cop #$c0
$0f:ca76  03 e0		 ora $e0,s
$0f:ca78  e3 e0		 sbc $e0,s
$0f:ca7a  73 70		 adc ($70,s),y
$0f:ca7c  37 30		 and [$30],y
$0f:ca7e  37 b0		 and [$b0],y
$0f:ca80  00 08		 brk #$08
$0f:ca82  03 00		 ora $00,s
$0f:ca84  01 04		 ora ($04,x)
$0f:ca86  00 01		 brk #$01
$0f:ca88  01 02		 ora ($02,x)
$0f:ca8a  00 00		 brk #$00
$0f:ca8c  00 01		 brk #$01
$0f:ca8e  00 00		 brk #$00
$0f:ca90  06 0a		 asl $0a
$0f:ca92  07 00		 ora [$00]
$0f:ca94  03 04		 ora $04,s
$0f:ca96  02 01		 cop #$01
$0f:ca98  01 02		 ora ($02,x)
$0f:ca9a  01 00		 ora ($00,x)
$0f:ca9c  00 01		 brk #$01
$0f:ca9e  00 00		 brk #$00
$0f:caa0  30 60		 bmi $cb02
$0f:caa2  20 e0 a0	  jsr $a0e0
$0f:caa5  40			rti
$0f:caa6  c0 c0		 cpy #$c0
$0f:caa8  c0 80		 cpy #$80
$0f:caaa  80 00		 bra $caac
$0f:caac  00 00		 brk #$00
$0f:caae  00 00		 brk #$00
$0f:cab0  70 50		 bvs $cb02
$0f:cab2  e0 00		 cpx #$00
$0f:cab4  e0 20		 cpx #$20
$0f:cab6  c0 80		 cpy #$80
$0f:cab8  c0 40		 cpy #$40
$0f:caba  80 00		 bra $cabc
$0f:cabc  80 80		 bra $ca3e
$0f:cabe  00 00		 brk #$00
$0f:cac0  0c 04 08	  tsb $0804
$0f:cac3  00 20		 brk #$20
$0f:cac5  28			plp
$0f:cac6  10 08		 bpl $cad0
$0f:cac8  1c 04 24	  trb $2404
$0f:cacb  24 18		 bit $18
$0f:cacd  18			clc
$0f:cace  00 00		 brk #$00
$0f:cad0  18			clc
$0f:cad1  1c 1c 1c	  trb $1c1c
$0f:cad4  1c 3c 3c	  trb $3c3c
$0f:cad7  3c 38 3c	  bit $3c38,x
$0f:cada  18			clc
$0f:cadb  3c 00 18	  bit $1800,x
$0f:cade  00 00		 brk #$00
$0f:cae0  04 04		 tsb $04
$0f:cae2  0c 04 18	  tsb $1804
$0f:cae5  10 00		 bpl $cae7
$0f:cae7  08			php
$0f:cae8  0c 04 14	  tsb $1404
$0f:caeb  14 08		 trb $08
$0f:caed  08			php
$0f:caee  00 00		 brk #$00
$0f:caf0  08			php
$0f:caf1  0c 08 0c	  tsb $0c08
$0f:caf4  0c 1c 1c	  tsb $1c1c
$0f:caf7  1c 18 1c	  trb $1c18
$0f:cafa  08			php
$0f:cafb  1c 00 08	  trb $0800
$0f:cafe  00 00		 brk #$00
$0f:cb00  04 04		 tsb $04
$0f:cb02  04 05		 tsb $05
$0f:cb04  09 01		 ora #$01
$0f:cb06  08			php
$0f:cb07  12 18		 ora ($18)
$0f:cb09  12 1a		 ora ($1a)
$0f:cb0b  12 05		 ora ($05)
$0f:cb0d  04 05		 tsb $05
$0f:cb0f  04 08		 tsb $08
$0f:cb11  0c 08 0d	  tsb $0d08
$0f:cb14  0c 0d 0d	  tsb $0d0d
$0f:cb17  1f 0d 1f 0d   ora $0d1f0d,x
$0f:cb1b  1f 1b 1f 1b   ora $1b1f1b,x
$0f:cb1f  1f 50 50 70   ora $705050,x
$0f:cb23  50 60		 bvc $cb85
$0f:cb25  40			rti
$0f:cb26  00 a0		 brk #$a0
$0f:cb28  a0 88		 ldy #$88
$0f:cb2a  a8			tay
$0f:cb2b  88			dey
$0f:cb2c  68			pla
$0f:cb2d  08			php
$0f:cb2e  68			pla
$0f:cb2f  08			php
$0f:cb30  20 70 20	  jsr $2070
$0f:cb33  70 30		 bvs $cb65
$0f:cb35  70 70		 bvs $cba7
$0f:cb37  f0 70		 beq $cba9
$0f:cb39  f8			sed
$0f:cb3a  70 f8		 bvs $cb34
$0f:cb3c  f0 f8		 beq $cb36
$0f:cb3e  f0 f8		 beq $cb38
$0f:cb40  03 08		 ora $08,s
$0f:cb42  0b			phd
$0f:cb43  0c 0d 0e	  tsb $0e0d
$0f:cb46  05 06		 ora $06
$0f:cb48  05 06		 ora $06
$0f:cb4a  03 10		 ora $10,s
$0f:cb4c  17 10		 ora [$10],y
$0f:cb4e  17 10		 ora [$10],y
$0f:cb50  03 0b		 ora $0b,s
$0f:cb52  03 0f		 ora $0f,s
$0f:cb54  03 0f		 ora $0f,s
$0f:cb56  0b			phd
$0f:cb57  0f 0b 0f 0f   ora $0f0f0b
$0f:cb5b  1f 0f 1f 0f   ora $0f1f0f,x
$0f:cb5f  1f 10 10 10   ora $101010,x
$0f:cb63  50 40		 bvc $cba5
$0f:cb65  40			rti
$0f:cb66  40			rti
$0f:cb67  40			rti
$0f:cb68  80 00		 bra $cb6a
$0f:cb6a  a0 00		 ldy #$00
$0f:cb6c  a0 08		 ldy #$08
$0f:cb6e  a8			tay
$0f:cb6f  08			php
$0f:cb70  a0 b0		 ldy #$b0
$0f:cb72  a0 f0		 ldy #$f0
$0f:cb74  b0 f0		 bcs $cb66
$0f:cb76  b0 f0		 bcs $cb68
$0f:cb78  f0 f0		 beq $cb6a
$0f:cb7a  f0 f0		 beq $cb6c
$0f:cb7c  f0 f8		 beq $cb76
$0f:cb7e  f0 f8		 beq $cb78
$0f:cb80  02 02		 cop #$02
$0f:cb82  02 02		 cop #$02
$0f:cb84  00 02		 brk #$02
$0f:cb86  00 0a		 brk #$0a
$0f:cb88  0b			phd
$0f:cb89  0a			asl a
$0f:cb8a  0b			phd
$0f:cb8b  0a			asl a
$0f:cb8c  01 10		 ora ($10,x)
$0f:cb8e  11 14		 ora ($14),y
$0f:cb90  01 03		 ora ($03,x)
$0f:cb92  01 03		 ora ($03,x)
$0f:cb94  01 03		 ora ($03,x)
$0f:cb96  01 0b		 ora ($0b,x)
$0f:cb98  01 0b		 ora ($0b,x)
$0f:cb9a  01 0b		 ora ($0b,x)
$0f:cb9c  0b			phd
$0f:cb9d  1b			tcs
$0f:cb9e  0b			phd
$0f:cb9f  1f d0 d0 c0   ora $c0d0d0,x
$0f:cba3  c0 40		 cpy #$40
$0f:cba5  68			pla
$0f:cba6  60			rts
$0f:cba7  68			pla
$0f:cba8  58			cli
$0f:cba9  48			pha
$0f:cbaa  58			cli
$0f:cbab  48			pha
$0f:cbac  08			php
$0f:cbad  08			php
$0f:cbae  10 00		 bpl $cbb0
$0f:cbb0  00 d0		 brk #$d0
$0f:cbb2  10 d0		 bpl $cb84
$0f:cbb4  90 f8		 bcc $cbae
$0f:cbb6  90 f8		 bcc $cbb0
$0f:cbb8  b0 f8		 bcs $cbb2
$0f:cbba  b0 f8		 bcs $cbb4
$0f:cbbc  f0 f8		 beq $cbb6
$0f:cbbe  f8			sed
$0f:cbbf  f8			sed
$0f:cbc0  09 09		 ora #$09
$0f:cbc2  0d 0d 08	  ora $080d
$0f:cbc5  0c 08 0c	  tsb $0c08
$0f:cbc8  04 14		 tsb $14
$0f:cbca  14 16		 trb $16
$0f:cbcc  1c 16 1a	  trb $1a16
$0f:cbcf  12 04		 ora ($04)
$0f:cbd1  0d 00 0d	  ora $0d00
$0f:cbd4  01 0d		 ora ($0d,x)
$0f:cbd6  01 0d		 ora ($0d,x)
$0f:cbd8  09 1d		 ora #$1d
$0f:cbda  09 1f		 ora #$1f
$0f:cbdc  09 1f		 ora #$1f
$0f:cbde  0d 1f 20	  ora $201f
$0f:cbe1  20 00 80	  jsr $8000
$0f:cbe4  80 90		 bra $cb76
$0f:cbe6  90 90		 bcc $cb78
$0f:cbe8  00 00		 brk #$00
$0f:cbea  00 40		 brk #$40
$0f:cbec  60			rts
$0f:cbed  40			rti
$0f:cbee  60			rts
$0f:cbef  48			pha
$0f:cbf0  00 20		 brk #$20
$0f:cbf2  20 a0 20	  jsr $20a0
$0f:cbf5  b0 20		 bcs $cc17
$0f:cbf7  b0 b0		 bcs $cba9
$0f:cbf9  b0 b0		 bcs $cbab
$0f:cbfb  f0 b0		 beq $cbad
$0f:cbfd  f0 b0		 beq $cbaf
$0f:cbff  f8			sed
$0f:cc00  6e 1f 2f	  ror $2f1f
$0f:cc03  1f 27 1f 33   ora $331f27,x
$0f:cc07  0f 11 0f 11   ora $110f11
$0f:cc0b  0f 03 0b 00   ora $000b03
$0f:cc0f  0e 7c 0f	  asl $0f7c
$0f:cc12  7c 47 3e	  jmp ($3e47,x)
$0f:cc15  01 3f		 ora ($3f,x)
$0f:cc17  00 3f		 brk #$3f
$0f:cc19  20 1f 00	  jsr $001f
$0f:cc1c  1b			tcs
$0f:cc1d  18			clc
$0f:cc1e  0f 07 00 80   ora $800007
$0f:cc22  0b			phd
$0f:cc23  0f 27 3f c0   ora $c03f27
$0f:cc27  f8			sed
$0f:cc28  c0 c0		 cpy #$c0
$0f:cc2a  e7 e0		 sbc [$e0]
$0f:cc2c  f0 f0		 beq $cc1e
$0f:cc2e  f8			sed
$0f:cc2f  f8			sed
$0f:cc30  00 80		 brk #$80
$0f:cc32  03 0f		 ora $0f,s
$0f:cc34  07 3f		 ora [$3f]
$0f:cc36  80 78		 bra $ccb0
$0f:cc38  c0 30		 cpy #$30
$0f:cc3a  e0 1f		 cpx #$1f
$0f:cc3c  f0 0f		 beq $cc4d
$0f:cc3e  f8			sed
$0f:cc3f  07 00		 ora [$00]
$0f:cc41  01 00		 ora ($00,x)
$0f:cc43  e0 04		 cpx #$04
$0f:cc45  84 1e		 sty $1e
$0f:cc47  1e 00 00	  asl $0000,x
$0f:cc4a  ff 00 7f 00   sbc $007f00,x
$0f:cc4e  3f 00 00 01   and $010000,x
$0f:cc52  f0 f0		 beq $cc44
$0f:cc54  f8			sed
$0f:cc55  fc 01 1e	  jsr ($1e01,x)
$0f:cc58  0f 00 00 ff   ora $ff0000
$0f:cc5c  00 ff		 brk #$ff
$0f:cc5e  00 ff		 brk #$ff
$0f:cc60  3e c0 7e	  rol $7ec0,x
$0f:cc63  c0 64		 cpy #$64
$0f:cc65  00 00		 brk #$00
$0f:cc67  00 04		 brk #$04
$0f:cc69  00 08		 brk #$08
$0f:cc6b  08			php
$0f:cc6c  88			dey
$0f:cc6d  00 80		 brk #$80
$0f:cc6f  f0 3e		 beq $ccaf
$0f:cc71  f0 7e		 beq $ccf1
$0f:cc73  e0 7c		 cpx #$7c
$0f:cc75  00 fc		 brk #$fc
$0f:cc77  00 fc		 brk #$fc
$0f:cc79  04 f8		 tsb $f8
$0f:cc7b  00 48		 brk #$48
$0f:cc7d  88			dey
$0f:cc7e  10 e0		 bpl $cc60
$0f:cc80  3c 00 42	  bit $4200,x
$0f:cc83  3c 99 7e	  bit $7e99,x
$0f:cc86  bd 7e bd	  lda $bd7e,x
$0f:cc89  7e 99 7e	  ror $7e99,x
$0f:cc8c  42 3c		 wdm #$3c
$0f:cc8e  3c 00 00	  bit $0000,x
$0f:cc91  00 00		 brk #$00
$0f:cc93  00 00		 brk #$00
$0f:cc95  00 00		 brk #$00
$0f:cc97  00 00		 brk #$00
$0f:cc99  00 00		 brk #$00
$0f:cc9b  00 00		 brk #$00
$0f:cc9d  00 00		 brk #$00
$0f:cc9f  00 00		 brk #$00
$0f:cca1  00 18		 brk #$18
$0f:cca3  00 24		 brk #$24
$0f:cca5  18			clc
$0f:cca6  5a			phy
$0f:cca7  3c 5a 3c	  bit $3c5a,x
$0f:ccaa  24 18		 bit $18
$0f:ccac  18			clc
$0f:ccad  00 00		 brk #$00
$0f:ccaf  00 00		 brk #$00
$0f:ccb1  00 00		 brk #$00
$0f:ccb3  00 00		 brk #$00
$0f:ccb5  00 00		 brk #$00
$0f:ccb7  00 00		 brk #$00
$0f:ccb9  00 00		 brk #$00
$0f:ccbb  00 00		 brk #$00
$0f:ccbd  00 00		 brk #$00
$0f:ccbf  00 00		 brk #$00
$0f:ccc1  00 00		 brk #$00
$0f:ccc3  00 00		 brk #$00
$0f:ccc5  00 00		 brk #$00
$0f:ccc7  00 00		 brk #$00
$0f:ccc9  00 00		 brk #$00
$0f:cccb  00 00		 brk #$00
$0f:cccd  00 00		 brk #$00
$0f:cccf  00 00		 brk #$00
$0f:ccd1  00 00		 brk #$00
$0f:ccd3  00 00		 brk #$00
$0f:ccd5  00 00		 brk #$00
$0f:ccd7  00 00		 brk #$00
$0f:ccd9  00 00		 brk #$00
$0f:ccdb  00 00		 brk #$00
$0f:ccdd  00 00		 brk #$00
$0f:ccdf  00 00		 brk #$00
$0f:cce1  00 00		 brk #$00
$0f:cce3  00 00		 brk #$00
$0f:cce5  00 00		 brk #$00
$0f:cce7  00 00		 brk #$00
$0f:cce9  00 00		 brk #$00
$0f:cceb  00 00		 brk #$00
$0f:cced  00 00		 brk #$00
$0f:ccef  00 00		 brk #$00
$0f:ccf1  00 00		 brk #$00
$0f:ccf3  00 00		 brk #$00
$0f:ccf5  00 00		 brk #$00
$0f:ccf7  00 00		 brk #$00
$0f:ccf9  00 00		 brk #$00
$0f:ccfb  00 00		 brk #$00
$0f:ccfd  00 00		 brk #$00
$0f:ccff  00 09		 brk #$09
$0f:cd01  00 09		 brk #$09
$0f:cd03  00 09		 brk #$09
$0f:cd05  20 29 20	  jsr $2029
$0f:cd08  1a			inc a
$0f:cd09  01 1a		 ora ($1a,x)
$0f:cd0b  01 0a		 ora ($0a,x)
$0f:cd0d  01 2a		 ora ($2a,x)
$0f:cd0f  21 1f		 and ($1f,x)
$0f:cd11  1f 1f 1f 1f   ora $1f1f1f,x
$0f:cd15  3f 1f 3f 3f   and $3f3f1f,x
$0f:cd19  3f 3f 3f 3f   and $3f3f3f,x
$0f:cd1d  3f 1f 3f 60   and $603f1f,x
$0f:cd21  00 20		 brk #$20
$0f:cd23  00 a0		 brk #$a0
$0f:cd25  04 a4		 tsb $a4
$0f:cd27  04 b4		 tsb $b4
$0f:cd29  04 b0		 tsb $b0
$0f:cd2b  00 b0		 brk #$b0
$0f:cd2d  00 f0		 brk #$f0
$0f:cd2f  00 f8		 brk #$f8
$0f:cd31  f8			sed
$0f:cd32  f8			sed
$0f:cd33  f8			sed
$0f:cd34  f8			sed
$0f:cd35  fc f8 fc	  jsr ($fcf8,x)
$0f:cd38  f8			sed
$0f:cd39  fc fc fc	  jsr ($fcfc,x)
$0f:cd3c  fc fc fc	  jsr ($fcfc,x)
$0f:cd3f  fc 13 10	  jsr ($1013,x)
$0f:cd42  03 00		 ora $00,s
$0f:cd44  0a			asl a
$0f:cd45  01 0a		 ora ($0a,x)
$0f:cd47  01 0a		 ora ($0a,x)
$0f:cd49  21 2e		 and ($2e,x)
$0f:cd4b  21 2e		 and ($2e,x)
$0f:cd4d  21 2c		 and ($2c,x)
$0f:cd4f  23 0f		 and $0f,s
$0f:cd51  1f 1f 1f 1f   ora $1f1f1f,x
$0f:cd55  1f 1f 1f 1f   ora $1f1f1f,x
$0f:cd59  3f 1f 3f 1f   and $1f3f1f,x
$0f:cd5d  3f 1f 3f b0   and $b03f1f,x
$0f:cd61  00 b0		 brk #$b0
$0f:cd63  00 90		 brk #$90
$0f:cd65  04 90		 tsb $90
$0f:cd67  00 d0		 brk #$d0
$0f:cd69  00 d4		 brk #$d4
$0f:cd6b  04 d4		 tsb $d4
$0f:cd6d  04 f4		 tsb $f4
$0f:cd6f  04 f8		 tsb $f8
$0f:cd71  f8			sed
$0f:cd72  f8			sed
$0f:cd73  f8			sed
$0f:cd74  f8			sed
$0f:cd75  fc fc fc	  jsr ($fcfc,x)
$0f:cd78  fc fc f8	  jsr ($f8fc,x)
$0f:cd7b  fc f8 fc	  jsr ($fcf8,x)
$0f:cd7e  f8			sed
$0f:cd7f  fc 15 14	  jsr ($1415,x)
$0f:cd82  15 14		 ora $14,x
$0f:cd84  01 20		 ora ($20,x)
$0f:cd86  29 20		 and #$20
$0f:cd88  2b			pld
$0f:cd89  20 2a 21	  jsr $212a
$0f:cd8c  3a			dec a
$0f:cd8d  21 1e		 and ($1e,x)
$0f:cd8f  01 0b		 ora ($0b,x)
$0f:cd91  1f 0b 1f 1f   ora $1f1f0b,x
$0f:cd95  3f 1f 3f 1f   and $1f3f1f,x
$0f:cd99  3f 1f 3f 1f   and $1f3f1f,x
$0f:cd9d  3f 3f 3f 10   and $103f3f,x
$0f:cda1  00 30		 brk #$30
$0f:cda3  00 b0		 brk #$b0
$0f:cda5  00 a0		 brk #$a0
$0f:cda7  00 a0		 brk #$a0
$0f:cda9  04 a4		 tsb $a4
$0f:cdab  04 a4		 tsb $a4
$0f:cdad  04 f4		 tsb $f4
$0f:cdaf  04 f8		 tsb $f8
$0f:cdb1  f8			sed
$0f:cdb2  f8			sed
$0f:cdb3  f8			sed
$0f:cdb4  f8			sed
$0f:cdb5  f8			sed
$0f:cdb6  f8			sed
$0f:cdb7  f8			sed
$0f:cdb8  f8			sed
$0f:cdb9  fc f8 fc	  jsr ($fcf8,x)
$0f:cdbc  f8			sed
$0f:cdbd  fc f8 fc	  jsr ($fcf8,x)
$0f:cdc0  0a			asl a
$0f:cdc1  02 0a		 cop #$0a
$0f:cdc3  02 08		 cop #$08
$0f:cdc5  20 28 20	  jsr $2028
$0f:cdc8  29 20		 and #$20
$0f:cdca  19 00 1d	  ora $1d00,y
$0f:cdcd  00 1d		 brk #$1d
$0f:cdcf  00 1d		 brk #$1d
$0f:cdd1  1f 1d 1f 1f   ora $1f1f1d,x
$0f:cdd5  3f 1f 3f 1f   and $1f3f1f,x
$0f:cdd9  3f 3f 3f 3f   and $3f3f3f,x
$0f:cddd  3f 3f 3f 80   and $803f3f,x
$0f:cde1  08			php
$0f:cde2  a8			tay
$0f:cde3  28			plp
$0f:cde4  a8			tay
$0f:cde5  28			plp
$0f:cde6  88			dey
$0f:cde7  08			php
$0f:cde8  c8			iny
$0f:cde9  08			php
$0f:cdea  c4 04		 cpy $04
$0f:cdec  50 84		 bvc $cd72
$0f:cdee  54 84 f0	  mvn $f0,$84
$0f:cdf1  f8			sed
$0f:cdf2  d0 f8		 bne $cdec
$0f:cdf4  d0 f8		 bne $cdee
$0f:cdf6  f0 f8		 beq $cdf0
$0f:cdf8  f0 f8		 beq $cdf2
$0f:cdfa  f8			sed
$0f:cdfb  fc f8 fc	  jsr ($fcf8,x)
$0f:cdfe  f8			sed
$0f:cdff  fc 00 06	  jsr ($0600,x)
$0f:ce02  03 07		 ora $07,s
$0f:ce04  01 03		 ora ($03,x)
$0f:ce06  01 03		 ora ($03,x)
$0f:ce08  00 00		 brk #$00
$0f:ce0a  01 01		 ora ($01,x)
$0f:ce0c  01 00		 ora ($00,x)
$0f:ce0e  00 00		 brk #$00
$0f:ce10  0f 0b 07 00   ora $00070b
$0f:ce14  07 04		 ora [$04]
$0f:ce16  03 00		 ora $00,s
$0f:ce18  02 02		 cop #$02
$0f:ce1a  01 00		 ora ($00,x)
$0f:ce1c  01 01		 ora ($01,x)
$0f:ce1e  00 00		 brk #$00
$0f:ce20  10 10		 bpl $ce32
$0f:ce22  33 3f		 and ($3f,s),y
$0f:ce24  90 98		 bcc $cdbe
$0f:ce26  ce c0 47	  dec $47c0
$0f:ce29  40			rti
$0f:ce2a  03 80		 ora $80,s
$0f:ce2c  99 9f b8	  sta $b89f,y
$0f:ce2f  88			dey
$0f:ce30  90 8f		 bcc $cdc1
$0f:ce32  03 3f		 ora $3f,s
$0f:ce34  80 78		 bra $ceae
$0f:ce36  c1 3e		 cmp ($3e,x)
$0f:ce38  c0 bf		 cpy #$bf
$0f:ce3a  c0 cf		 cpy #$cf
$0f:ce3c  a1 7f		 lda ($7f,x)
$0f:ce3e  80 78		 bra $ceb8
$0f:ce40  78			sei
$0f:ce41  01 0c		 ora ($0c,x)
$0f:ce43  cc 1f 18	  cpy $181f
$0f:ce46  01 00		 ora ($00,x)
$0f:ce48  c0 01		 cpy #$01
$0f:ce4a  e0 03		 cpx #$03
$0f:ce4c  8e ef 00	  stx $00ef
$0f:ce4f  0f 00 f9 f0   ora $f0f900
$0f:ce53  fc 07 18	  jsr ($1807,x)
$0f:ce56  ff 00 3e c1   sbc $c13e00,x
$0f:ce5a  10 e3		 bpl $ce3f
$0f:ce5c  f3 fc		 sbc ($fc,s),y
$0f:ce5e  1f 10 00 e0   ora $e00010,x
$0f:ce62  80 60		 bra $cec4
$0f:ce64  c0 00		 cpy #$00
$0f:ce66  80 40		 bra $cea8
$0f:ce68  00 00		 brk #$00
$0f:ce6a  00 80		 brk #$80
$0f:ce6c  00 00		 brk #$00
$0f:ce6e  00 00		 brk #$00
$0f:ce70  30 d0		 bmi $ce42
$0f:ce72  e0 00		 cpx #$00
$0f:ce74  e0 20		 cpx #$20
$0f:ce76  c0 00		 cpy #$00
$0f:ce78  40			rti
$0f:ce79  40			rti
$0f:ce7a  80 00		 bra $ce7c
$0f:ce7c  80 80		 bra $cdfe
$0f:ce7e  00 00		 brk #$00
$0f:ce80  00 00		 brk #$00
$0f:ce82  00 00		 brk #$00
$0f:ce84  00 00		 brk #$00
$0f:ce86  00 00		 brk #$00
$0f:ce88  00 00		 brk #$00
$0f:ce8a  00 00		 brk #$00
$0f:ce8c  00 00		 brk #$00
$0f:ce8e  00 00		 brk #$00
$0f:ce90  00 00		 brk #$00
$0f:ce92  00 00		 brk #$00
$0f:ce94  00 00		 brk #$00
$0f:ce96  00 00		 brk #$00
$0f:ce98  00 00		 brk #$00
$0f:ce9a  00 00		 brk #$00
$0f:ce9c  00 00		 brk #$00
$0f:ce9e  00 00		 brk #$00
$0f:cea0  00 00		 brk #$00
$0f:cea2  00 00		 brk #$00
$0f:cea4  00 00		 brk #$00
$0f:cea6  00 00		 brk #$00
$0f:cea8  00 00		 brk #$00
$0f:ceaa  00 00		 brk #$00
$0f:ceac  00 00		 brk #$00
$0f:ceae  00 00		 brk #$00
$0f:ceb0  00 00		 brk #$00
$0f:ceb2  00 00		 brk #$00
$0f:ceb4  00 00		 brk #$00
$0f:ceb6  00 00		 brk #$00
$0f:ceb8  00 00		 brk #$00
$0f:ceba  00 00		 brk #$00
$0f:cebc  00 00		 brk #$00
$0f:cebe  00 00		 brk #$00
$0f:cec0  08			php
$0f:cec1  08			php
$0f:cec2  08			php
$0f:cec3  08			php
$0f:cec4  00 00		 brk #$00
$0f:cec6  08			php
$0f:cec7  00 08		 brk #$08
$0f:cec9  00 00		 brk #$00
$0f:cecb  00 08		 brk #$08
$0f:cecd  08			php
$0f:cece  00 00		 brk #$00
$0f:ced0  00 08		 brk #$08
$0f:ced2  00 08		 brk #$08
$0f:ced4  08			php
$0f:ced5  08			php
$0f:ced6  08			php
$0f:ced7  08			php
$0f:ced8  08			php
$0f:ced9  08			php
$0f:ceda  08			php
$0f:cedb  08			php
$0f:cedc  00 08		 brk #$08
$0f:cede  00 00		 brk #$00
$0f:cee0  00 00		 brk #$00
$0f:cee2  00 00		 brk #$00
$0f:cee4  00 00		 brk #$00
$0f:cee6  00 00		 brk #$00
$0f:cee8  00 00		 brk #$00
$0f:ceea  00 00		 brk #$00
$0f:ceec  00 00		 brk #$00
$0f:ceee  00 00		 brk #$00
$0f:cef0  00 00		 brk #$00
$0f:cef2  00 00		 brk #$00
$0f:cef4  00 00		 brk #$00
$0f:cef6  00 00		 brk #$00
$0f:cef8  00 00		 brk #$00
$0f:cefa  00 00		 brk #$00
$0f:cefc  00 00		 brk #$00
$0f:cefe  00 00		 brk #$00
$0f:cf00  2e 21 2c	  rol $2c21
$0f:cf03  23 24		 and $24,s
$0f:cf05  23 26		 and $26,s
$0f:cf07  21 27		 and ($27,x)
$0f:cf09  20 13 30	  jsr $3013
$0f:cf0c  01 10		 ora ($10,x)
$0f:cf0e  04 0c		 tsb $0c
$0f:cf10  1f 3f 1f 3f   ora $3f1f3f,x
$0f:cf14  1f 3f 1f 3f   ora $3f1f3f,x
$0f:cf18  1f 3f 0f 3f   ora $3f0f3f,x
$0f:cf1c  0f 1f 03 0f   ora $0f031f
$0f:cf20  74 84		 stz $84,x
$0f:cf22  64 84		 stz $84
$0f:cf24  64 84		 stz $84
$0f:cf26  64 84		 stz $84
$0f:cf28  fc 0c e8	  jsr ($e80c,x)
$0f:cf2b  0c c0 08	  tsb $08c0
$0f:cf2e  20 30 f8	  jsr $f830
$0f:cf31  fc f8 fc	  jsr ($fcf8,x)
$0f:cf34  f8			sed
$0f:cf35  fc f8 fc	  jsr ($fcf8,x)
$0f:cf38  f0 fc		 beq $cf36
$0f:cf3a  f0 fc		 beq $cf38
$0f:cf3c  f0 f8		 beq $cf36
$0f:cf3e  c0 f0		 cpy #$f0
$0f:cf40  2c 23 24	  bit $2423
$0f:cf43  23 26		 and $26,s
$0f:cf45  21 26		 and ($26,x)
$0f:cf47  21 37		 and ($37,x)
$0f:cf49  30 13		 bmi $cf5e
$0f:cf4b  30 03		 bmi $cf50
$0f:cf4d  10 04		 bpl $cf53
$0f:cf4f  0c 1f 3f	  tsb $3f1f
$0f:cf52  1f 3f 1f 3f   ora $3f1f3f,x
$0f:cf56  1f 3f 0f 3f   ora $3f0f3f,x
$0f:cf5a  0f 3f 0f 1f   ora $1f0f3f
$0f:cf5e  03 0f		 ora $0f,s
$0f:cf60  74 84		 stz $84,x
$0f:cf62  74 84		 stz $84,x
$0f:cf64  54 84 44	  mvn $44,$84
$0f:cf67  84 c4		 sty $c4
$0f:cf69  04 e8		 tsb $e8
$0f:cf6b  0c c0 08	  tsb $08c0
$0f:cf6e  20 30 f8	  jsr $f830
$0f:cf71  fc f8 fc	  jsr ($fcf8,x)
$0f:cf74  f8			sed
$0f:cf75  fc f8 fc	  jsr ($fcf8,x)
$0f:cf78  f8			sed
$0f:cf79  fc f0 fc	  jsr ($fcf0,x)
$0f:cf7c  f0 f8		 beq $cf76
$0f:cf7e  c0 f0		 cpy #$f0
$0f:cf80  0e 01 0e	  asl $0e01
$0f:cf83  01 2c		 ora ($2c,x)
$0f:cf85  23 34		 and $34,s
$0f:cf87  33 37		 and ($37,s),y
$0f:cf89  30 17		 bmi $cfa2
$0f:cf8b  30 03		 bmi $cf90
$0f:cf8d  10 04		 bpl $cf93
$0f:cf8f  0c 3f 3f	  tsb $3f3f
$0f:cf92  3f 3f 1f 3f   and $3f1f3f,x
$0f:cf96  0f 3f 0f 3f   ora $3f0f3f
$0f:cf9a  0f 3f 0f 1f   ora $1f0f3f
$0f:cf9e  03 0f		 ora $0f,s
$0f:cfa0  74 84		 stz $84,x
$0f:cfa2  50 80		 bvc $cf24
$0f:cfa4  d0 00		 bne $cfa6
$0f:cfa6  c0 00		 cpy #$00
$0f:cfa8  c4 04		 cpy $04
$0f:cfaa  e0 04		 cpx #$04
$0f:cfac  c0 08		 cpy #$08
$0f:cfae  20 30 f8	  jsr $f830
$0f:cfb1  fc fc fc	  jsr ($fcfc,x)
$0f:cfb4  fc fc fc	  jsr ($fcfc,x)
$0f:cfb7  fc f8 fc	  jsr ($fcf8,x)
$0f:cfba  f8			sed
$0f:cfbb  fc f0 f8	  jsr ($f8f0,x)
$0f:cfbe  c0 f0		 cpy #$f0
$0f:cfc0  0d 00 2b	  ora $2b00
$0f:cfc3  24 2a		 bit $2a
$0f:cfc5  25 26		 and $26
$0f:cfc7  21 37		 and ($37,x)
$0f:cfc9  30 17		 bmi $cfe2
$0f:cfcb  30 03		 bmi $cfd0
$0f:cfcd  10 04		 bpl $cfd3
$0f:cfcf  0c 3f 3f	  tsb $3f3f
$0f:cfd2  1f 3f 1f 3f   ora $3f1f3f,x
$0f:cfd6  1f 3f 0f 3f   ora $3f0f3f,x
$0f:cfda  0f 3f 0f 1f   ora $1f0f3f
$0f:cfde  03 0f		 ora $0f,s
$0f:cfe0  70 80		 bvs $cf62
$0f:cfe2  70 80		 bvs $cf64
$0f:cfe4  54 84 c4	  mvn $c4,$84
$0f:cfe7  04 e4		 tsb $e4
$0f:cfe9  04 e8		 tsb $e8
$0f:cfeb  0c 80 08	  tsb $0880
$0f:cfee  20 30 fc	  jsr $fc30
$0f:cff1  fc fc fc	  jsr ($fcfc,x)
$0f:cff4  f8			sed
$0f:cff5  fc f8 fc	  jsr ($fcf8,x)
$0f:cff8  f8			sed
$0f:cff9  fc f0 fc	  jsr ($fcf0,x)
$0f:cffc  f0 f8		 beq $cff6
$0f:cffe  c0 f0		 cpy #$f0
$0f:d000  08			php
$0f:d001  21 14		 and ($14,x)
$0f:d003  00 1f		 brk #$1f
$0f:d005  00 1d		 brk #$1d
$0f:d007  01 1f		 ora ($1f,x)
$0f:d009  02 5f		 cop #$5f
$0f:d00b  2b			pld
$0f:d00c  94 01		 sty $01,x
$0f:d00e  5a			phy
$0f:d00f  02 7e		 cop #$7e
$0f:d011  03 ff		 ora $ff,s
$0f:d013  5b			tcd
$0f:d014  22 14 44 28   jsl $284414
$0f:d018  87 3c		 sta [$3c]
$0f:d01a  2d 61 14	  and $1461
$0f:d01d  7e ff 7f	  ror $7fff,x
$0f:d020  08			php
$0f:d021  21 2b		 and ($2b,x)
$0f:d023  7d 49 7e	  adc $7e49,x
$0f:d026  2c 7f f4	  bit $f47f
$0f:d029  7f ff 7f 28   adc $287fff,x
$0f:d02d  29 28		 and #$28
$0f:d02f  29 28		 and #$28
$0f:d031  29 28		 and #$28
$0f:d033  29 6a		 and #$6a
$0f:d035  34 54		 bit $54,x
$0f:d037  3c 1f 51	  bit $511f,x
$0f:d03a  7f 62 5f 73   adc $735f62,x
$0f:d03e  ff 7f 08 21   sbc $21087f,x
$0f:d042  49 7e		 eor #$7e
$0f:d044  2c 7f f4	  bit $f47f
$0f:d047  7f aa 04 0e   adc $0e04aa,x
$0f:d04b  11 75		 ora ($75),y
$0f:d04d  11 3b		 ora ($3b),y
$0f:d04f  1a			inc a
$0f:d050  ff 1e ff 3f   sbc $3fff1e,x
$0f:d054  0a			asl a
$0f:d055  61 2f		 adc ($2f,x)
$0f:d057  75 f7		 adc $f7,x
$0f:d059  7d 9d 7e	  adc $7e9d,x
$0f:d05c  3f 7f ff 7f   and $7fff7f,x
$0f:d060  08			php
$0f:d061  21 49		 and ($49,x)
$0f:d063  7e 2c 7f	  ror $7f2c,x
$0f:d066  f4 7f aa	  pea $aa7f
$0f:d069  04 0e		 tsb $0e
$0f:d06b  11 75		 ora ($75),y
$0f:d06d  11 3b		 ora ($3b),y
$0f:d06f  1a			inc a
$0f:d070  ff 1e ff 3f   sbc $3fff1e,x
$0f:d074  0a			asl a
$0f:d075  61 2f		 adc ($2f,x)
$0f:d077  75 f7		 adc $f7,x
$0f:d079  7d 9d 7e	  adc $7e9d,x
$0f:d07c  3f 7f ff 7f   and $7fff7f,x
$0f:d080  08			php
$0f:d081  21 14		 and ($14,x)
$0f:d083  00 1f		 brk #$1f
$0f:d085  00 1d		 brk #$1d
$0f:d087  01 1f		 ora ($1f,x)
$0f:d089  02 5f		 cop #$5f
$0f:d08b  2b			pld
$0f:d08c  94 01		 sty $01,x
$0f:d08e  5a			phy
$0f:d08f  02 7e		 cop #$7e
$0f:d091  03 ff		 ora $ff,s
$0f:d093  5b			tcd
$0f:d094  22 14 44 28   jsl $284414
$0f:d098  87 3c		 sta [$3c]
$0f:d09a  2d 61 14	  and $1461
$0f:d09d  7e ff 7f	  ror $7fff,x
$0f:d0a0  08			php
$0f:d0a1  21 2b		 and ($2b,x)
$0f:d0a3  7d 49 7e	  adc $7e49,x
$0f:d0a6  2c 7f f4	  bit $f47f
$0f:d0a9  7f ff 7f 28   adc $287fff,x
$0f:d0ad  29 28		 and #$28
$0f:d0af  29 28		 and #$28
$0f:d0b1  29 28		 and #$28
$0f:d0b3  29 6a		 and #$6a
$0f:d0b5  34 54		 bit $54,x
$0f:d0b7  3c 1f 51	  bit $511f,x
$0f:d0ba  7f 62 5f 73   adc $735f62,x
$0f:d0be  ff 7f 08 21   sbc $21087f,x
$0f:d0c2  69 7e		 adc #$7e
$0f:d0c4  ef 7f ff 7f   sbc $7fff7f
$0f:d0c8  0a			asl a
$0f:d0c9  61 8c		 adc ($8c,x)
$0f:d0cb  7d 49 7e	  adc $7e49,x
$0f:d0ce  2c 7f f4	  bit $f47f
$0f:d0d1  7f ff 7f 72   adc $727fff,x
$0f:d0d5  25 f4		 and $f4
$0f:d0d7  2d 76 3a	  and $3a76
$0f:d0da  f9 42 9c	  sbc $9c42,y
$0f:d0dd  53 ff		 eor ($ff,s),y
$0f:d0df  7f 08 21 14   adc $142108,x
$0f:d0e3  00 1f		 brk #$1f
$0f:d0e5  00 1d		 brk #$1d
$0f:d0e7  01 1f		 ora ($1f,x)
$0f:d0e9  02 5f		 cop #$5f
$0f:d0eb  2b			pld
$0f:d0ec  94 01		 sty $01,x
$0f:d0ee  5a			phy
$0f:d0ef  02 7e		 cop #$7e
$0f:d0f1  03 ff		 ora $ff,s
$0f:d0f3  5b			tcd
$0f:d0f4  26 24		 rol $24
$0f:d0f6  48			pha
$0f:d0f7  34 8c		 bit $8c,x
$0f:d0f9  3c f3 4c	  bit $4cf3,x
$0f:d0fc  7f 61 ff 7f   adc $7fff61,x
$0f:d100  00 20		 brk #$20
$0f:d102  80 3b		 bra $d13f
$0f:d104  fd fd 9f	  sbc $9ffd,x
$0f:d107  f8			sed
$0f:d108  07 8f		 ora [$8f]
$0f:d10a  c7 3f		 cmp [$3f]
$0f:d10c  e0 7b		 cpx #$7b
$0f:d10e  23 9c		 and $9c,s
$0f:d110  fa			plx
$0f:d111  7f 87 ff 7e   adc $7eff87,x
$0f:d115  c0 ef		 cpy #$ef
$0f:d117  ef c0 f1 8e   sbc $8ef1c0
$0f:d11b  03 c3		 ora $c3,s
$0f:d11d  f9 03 e7	  sbc $e703,y
$0f:d120  cc 01 e0	  cpy $e001
$0f:d123  29 2f		 and #$2f
$0f:d125  04 03		 tsb $03
$0f:d127  39 e0 f3	  and $f3e0,y
$0f:d12a  de 3f 39	  dec $393f,x
$0f:d12d  e9 74		 sbc #$74
$0f:d12f  df d7 ef bf   cmp $bfefd7,x
$0f:d133  ff f3 b7 e1   sbc $e1b7f3,x
$0f:d137  78			sei
$0f:d138  7f 05 46 13   adc $134605,x
$0f:d13c  0f 7c 40 52   ora $52407c
$0f:d140  57 c8		 eor [$c8],y
$0f:d142  ff 56 db bb   sbc $bbdb56,x
$0f:d146  b6 fb		 ldx $fb,y
$0f:d148  a6 f5		 ldx $f5
$0f:d14a  fd bc fb	  sbc $fbbc,x
$0f:d14d  b5 a7		 lda $a7,x
$0f:d14f  e9 e9		 sbc #$e9
$0f:d151  6a			ror a
$0f:d152  f7 f8		 sbc [$f8],y
$0f:d154  07 f6		 ora [$f6]
$0f:d156  04 29		 tsb $29
$0f:d158  4f f4 07 ef   eor $ef07f4
$0f:d15c  08			php
$0f:d15d  35 85		 and $85,x
$0f:d15f  03 01		 ora $01,s
$0f:d161  3e e0 58	  rol $58e0,x
$0f:d164  ef 9a 6b 3d   sbc $3d6b9a
$0f:d168  cb			wai
$0f:d169  9d a7 fc	  sta $fca7,x
$0f:d16c  6f 3d f5 fb   adc $fbf53d
$0f:d170  bf 00 d0 10   lda $10d000,x
$0f:d174  0b			phd
$0f:d175  fe 03 cf	  inc $cf03,x
$0f:d178  18			clc
$0f:d179  34 80		 bit $80,x
$0f:d17b  a4 90		 ldy $90
$0f:d17d  60			rts
$0f:d17e  fe 2f c4	  inc $c42f,x
$0f:d181  02 0f		 cop #$0f
$0f:d183  f8			sed
$0f:d184  88			dey
$0f:d185  47 e1		 eor [$e1]
$0f:d187  3f 9f 84 3e   and $3e849f,x
$0f:d18b  1f f0 47 a0   ora $a047f0,x
$0f:d18f  3c 23 fe	  bit $fe23,x
$0f:d192  0f cc 18 52   ora $5218cc
$0f:d196  4f e1 80 c0   eor $c080e1
$0f:d19a  60			rts
$0f:d19b  9d 69 a5	  sta $a569,x
$0f:d19e  73 a1		 adc ($a1,s),y
$0f:d1a0  98			tya
$0f:d1a1  f0 4d		 beq $d1f0
$0f:d1a3  bf 1d d9 f2   lda $f2d91d,x
$0f:d1a7  c0 60		 cpy #$60
$0f:d1a9  10 58		 bpl $d203
$0f:d1ab  17 da		 ora [$da],y
$0f:d1ad  11 dc		 ora ($dc),y
$0f:d1af  90 24		 bcc $d1d5
$0f:d1b1  c1 02		 cmp ($02,x)
$0f:d1b3  0a			asl a
$0f:d1b4  d2 81		 cmp ($81)
$0f:d1b6  c0 21		 cpy #$21
$0f:d1b8  50 68		 bvc $d222
$0f:d1ba  54 72 57	  mvn $57,$72
$0f:d1bd  30 96		 bmi $d155
$0f:d1bf  50 ba		 bvc $d17b
$0f:d1c1  50 bd		 bvc $d180
$0f:d1c3  5c 71 9e 50   jml $509e71
$0f:d1c7  e8			inx
$0f:d1c8  0c 7a 01	  tsb $017a
$0f:d1cb  3b			tsc
$0f:d1cc  80 5b		 bra $d229
$0f:d1ce  a0 3d		 ldy #$3d
$0f:d1d0  b8			clv
$0f:d1d1  26 fd		 rol $fd
$0f:d1d3  fe f6 08	  inc $08f6,x
$0f:d1d6  06 42		 asl $42
$0f:d1d8  41 e8		 eor ($e8,x)
$0f:d1da  b8			clv
$0f:d1db  68			pla
$0f:d1dc  ed 8e f8	  sbc $f88e
$0f:d1df  d8			cld
$0f:d1e0  50 12		 bvc $d1f4
$0f:d1e2  60			rts
$0f:d1e3  49 08		 eor #$08
$0f:d1e5  24 0e		 bit $0e
$0f:d1e7  09 02		 ora #$02
$0f:d1e9  82 2c c2	  brl $9418
$0f:d1ec  03 05		 ora $05,s
$0f:d1ee  80 c2		 bra $d1b2
$0f:d1f0  20 70 98	  jsr $9870
$0f:d1f3  1c 2a 07	  trb $072a
$0f:d1f6  07 0f		 ora [$0f]
$0f:d1f8  84 1a		 sty $1a
$0f:d1fa  0d 04 11	  ora $1104
$0f:d1fd  94 32		 sty $32,x
$0f:d1ff  10 29		 bpl $d22a
$0f:d201  28			plp
$0f:d202  25 6e		 and $6e
$0f:d204  1d 73 95	  ora $9573,x
$0f:d207  c5 e2		 cmp $e2
$0f:d209  f2 f8		 sbc ($f8)
$0f:d20b  fe 9e 37	  inc $379e,x
$0f:d20e  a5 88		 lda $88
$0f:d210  ea			nop
$0f:d211  a2 9a		 ldx #$9a
$0f:d213  ff f5 67 fd   sbc $fd67f5,x
$0f:d217  79 ff cc	  adc $ccff,y
$0f:d21a  3e f3 8b	  rol $8bf3,x
$0f:d21d  b9 18 6e	  lda $6e18,y
$0f:d220  73 cb		 adc ($cb,s),y
$0f:d222  7c c3 d9	  jmp ($d9c3,x)
$0f:d225  fc 8e cf	  jsr ($cf8e,x)
$0f:d228  69 b6		 adc #$b6
$0f:d22a  dd 47 b7	  cmp $b747,x
$0f:d22d  45 e7		 eor $e7
$0f:d22f  b2 f9		 lda ($f9)
$0f:d231  f4 35 ec	  pea $ec35
$0f:d234  06 02		 asl $02
$0f:d236  37 e7		 and [$e7],y
$0f:d238  ed 79 f5	  sbc $f579
$0f:d23b  5d 79 57	  eor $5779,x
$0f:d23e  5e cb 9a	  lsr $9acb,x
$0f:d241  33 82		 and ($82,s),y
$0f:d243  2c 30 17	  bit $1730
$0f:d246  fc 9f ce	  jsr ($ce9f,x)
$0f:d249  4b			phk
$0f:d24a  e5 ab		 sbc $ab
$0f:d24c  75 f1		 adc $f1,x
$0f:d24e  58			cli
$0f:d24f  fc 9e 7f	  jsr ($7f9e,x)
$0f:d252  29 8b		 and #$8b
$0f:d254  b6 67		 ldx $67,y
$0f:d256  38			sec
$0f:d257  7f f9 e7 3e   adc $3ee7f9,x
$0f:d25b  d5 9f		 cmp $9f,x
$0f:d25d  ec 4b f0	  cpx $f04b
$0f:d260  37 ec		 and [$ec],y
$0f:d262  bd a3 3f	  lda $3fa3,x
$0f:d265  60			rts
$0f:d266  fe 40 d4	  inc $d440,x
$0f:d269  a1 4c		 lda ($4c,x)
$0f:d26b  bf e7 bf f7   lda $f7bfe7,x
$0f:d26f  1f 8e 2f 17   ora $172f8e,x
$0f:d273  97 cb		 sta [$cb],y
$0f:d275  b3 0b		 lda ($0b,s),y
$0f:d277  ff ff cf 78   sbc $78cfff,x
$0f:d27b  67 fc		 adc [$fc]
$0f:d27d  0f 8c 3b 17   ora $173b8c
$0f:d281  74 43		 stz $43,x
$0f:d283  82 68 e0	  brl $b2ee
$0f:d286  18			clc
$0f:d287  0f ff 93 ff   ora $ff93ff
$0f:d28b  4c ff d7	  jmp $d7ff
$0f:d28e  7f f3 d4 e8   adc $e8d4f3,x
$0f:d292  43 fd		 eor $fd,s
$0f:d294  ff 08 7f fe   sbc $fe7f08,x
$0f:d298  0f f8 87 fc   ora $fc87f8
$0f:d29c  23 fe		 and $fe,s
$0f:d29e  0d fd 01	  ora $01fd
$0f:d2a1  8a			txa
$0f:d2a2  0a			asl a
$0f:d2a3  90 64		 bcc $d309
$0f:d2a5  97 53		 sta [$53],y
$0f:d2a7  ff c0 ff f8   sbc $f8ffc0,x
$0f:d2ab  3f fe 1f ff   and $ff1ffe,x
$0f:d2af  8f ff f3 ff   sta $fff3ff
$0f:d2b3  fd a3 ec	  sbc $eca3,x
$0f:d2b6  30 e0		 bmi $d298
$0f:d2b8  4f fc 11 ff   eor $ff11fc
$0f:d2bc  0c 7b c7	  tsb $c77b
$0f:d2bf  1c 72 87	  trb $8772
$0f:d2c2  de 11 b7	  dec $b711,x
$0f:d2c5  a4 2a		 ldy $2a
$0f:d2c7  42 7b		 wdm #$7b
$0f:d2c9  13 ba		 ora ($ba,s),y
$0f:d2cb  4b			phk
$0f:d2cc  2d 31 9a	  and $9a31
$0f:d2cf  9c ce cf	  stz $cfce
$0f:d2d2  27 d2		 and [$d2]
$0f:d2d4  d9 79 54	  cmp $5479,y
$0f:d2d7  be 5d 2a	  ldx $2a5d,y
$0f:d2da  7f 00 be 40   adc $40be00,x
$0f:d2de  ef 30 6b 9c   sbc $9c6b30
$0f:d2e2  32 cf		 and ($cf)
$0f:d2e4  18			clc
$0f:d2e5  f2 c6		 sbc ($c6)
$0f:d2e7  b9 73 40	  lda $4073,y
$0f:d2ea  58			cli
$0f:d2eb  57 eb		 eor [$eb],y
$0f:d2ed  ff 8f ff 9f   sbc $9fff8f,x
$0f:d2f1  ff 9c fe 4c   sbc $4cfe9c,x
$0f:d2f5  7e 3d ba	  ror $ba3d,x
$0f:d2f8  dc db 6f	  jml [$6fdb]
$0f:d2fb  8c c7 d7	  sty $d7c7
$0f:d2fe  f4 0c 92	  pea $920c
$0f:d301  45 82		 eor $82
$0f:d303  8c 3b 52	  sty $523b
$0f:d306  5d ad 29	  eor $29ad,x
$0f:d309  4a			lsr a
$0f:d30a  1f 7d df 8f   ora $8fdf7d,x
$0f:d30e  e7 d3		 sbc [$d3]
$0f:d310  f9 f3 3d	  sbc $3df3,y
$0f:d313  fa			plx
$0f:d314  9f 7e df ff   sta $ffdf7e,x
$0f:d318  6d de ed	  adc $edde
$0f:d31b  ee ea 90	  inc $90ea
$0f:d31e  f9 c3 3e	  sbc $3ec3,y
$0f:d321  50 df		 bvc $d302
$0f:d323  5c 53 cf 18   jml $18cf53
$0f:d327  bf e0 3f b0   lda $b03fe0,x
$0f:d32b  22 38 67 fd   jsl $fd6738
$0f:d32f  bd 9f 5c	  lda $5c9f,x
$0f:d332  4b			phk
$0f:d333  d7 17		 cmp [$17],y
$0f:d335  f7 73		 sbc [$73],y
$0f:d337  7e 9f ef	  ror $ef9f,x
$0f:d33a  bf ab e7 8d   lda $8de7ab,x
$0f:d33e  fa			plx
$0f:d33f  92 43		 sta ($43)
$0f:d341  77 44		 adc [$44],y
$0f:d343  fd c1 15	  sbc $15c1,x
$0f:d346  20 4b 05	  jsr $054b
$0f:d349  48			pha
$0f:d34a  18			clc
$0f:d34b  c0 96		 cpy #$96
$0f:d34d  11 a9		 ora ($a9),y
$0f:d34f  b6 57		 ldx $57,y
$0f:d351  77 ac		 adc [$ac],y
$0f:d353  39 0e 2f	  and $2f0e,y
$0f:d356  3b			tsc
$0f:d357  96 ca		 stx $ca,y
$0f:d359  f5 ba		 sbc $ba,x
$0f:d35b  b4 4e		 ldy $4e,x
$0f:d35d  3c fb 82	  bit $82fb,x
$0f:d360  c5 26		 cmp $26
$0f:d362  28			plp
$0f:d363  67 ec		 adc [$ec]
$0f:d365  0a			asl a
$0f:d366  70 eb		 bvs $d353
$0f:d368  ca			dex
$0f:d369  38			sec
$0f:d36a  f3 8a		 sbc ($8a,s),y
$0f:d36c  1d ff 83	  ora $83ff,x
$0f:d36f  c1 be		 cmp ($be,x)
$0f:d371  7f 21 1f ff   adc $ff1f21,x
$0f:d375  f7 ff		 sbc [$ff],y
$0f:d377  03 81		 ora $81,s
$0f:d379  b8			clv
$0f:d37a  7c 02 a0	  jmp ($a002,x)
$0f:d37d  49 0e		 eor #$0e
$0f:d37f  0c f8 4a	  tsb $4af8
$0f:d382  0c 92 c0	  tsb $c092
$0f:d385  df 97 80 25   cmp $258097,x
$0f:d389  0d f7 3f	  ora $3ff7
$0f:d38c  f5 f7		 sbc $f7,x
$0f:d38e  8e c7 f8	  stx $f8c7
$0f:d391  fc 78 c7	  jsr ($c778,x)
$0f:d394  e7 8f		 sbc [$8f]
$0f:d396  ff 99 cf e1   sbc $e1cf99,x
$0f:d39a  b0 f1		 bcs $d38d
$0f:d39c  09 37		 ora #$37
$0f:d39e  41 1a		 eor ($1a,x)
$0f:d3a0  1f 98 30 84   ora $843098,x
$0f:d3a4  27 fc		 and [$fc]
$0f:d3a6  08			php
$0f:d3a7  7f c3 e1 00   adc $00e1c3,x
$0f:d3ab  d6 5c		 dec $5c,x
$0f:d3ad  2b			pld
$0f:d3ae  5b			tcd
$0f:d3af  ca			dex
$0f:d3b0  ee fb 5d	  inc $5dfb
$0f:d3b3  df b5 57 f6   cmp $f657b5,x
$0f:d3b7  9e fc c7	  stz $c7fc,x
$0f:d3ba  dd 9e 1f	  cmp $1f9e,x
$0f:d3bd  c8			iny
$0f:d3be  07 f8		 ora [$f8]
$0f:d3c0  44 22 10	  mvp $10,$22
$0f:d3c3  24 80		 bit $80
$0f:d3c5  84 9d		 sty $9d
$0f:d3c7  cd 80 80	  cmp $8080
$0f:d3ca  70 20		 bvs $d3ec
$0f:d3cc  14 0c		 trb $0c
$0f:d3ce  05 ab		 ora $ab
$0f:d3d0  38			sec
$0f:d3d1  ef a7 c8 38   sbc $38c8a7
$0f:d3d5  c2 15		 rep #$15
$0f:d3d7  07 8a		 ora [$8a]
$0f:d3d9  41 e2		 eor ($e2,x)
$0f:d3db  01 22		 ora ($22,x)
$0f:d3dd  86 c5		 stx $c5
$0f:d3df  21 d1		 and ($d1,x)
$0f:d3e1  68			pla
$0f:d3e2  74 9a		 stz $9a,x
$0f:d3e4  1f 08 84 46   ora $468408,x
$0f:d3e8  22 02 12 89   jsl $891202
$0f:d3ec  44 22 22	  mvp $22,$22
$0f:d3ef  81 98		 sta ($98,x)
$0f:d3f1  48			pha
$0f:d3f2  23 de		 and $de,s
$0f:d3f4  19 87 02	  ora $0287,y
$0f:d3f7  41 c3		 eor ($c3,x)
$0f:d3f9  90 60		 bcc $d45b
$0f:d3fb  e4 38		 cpx $38
$0f:d3fd  79 0c 1e	  adc $1e0c,y
$0f:d400  43 47		 eor $47,s
$0f:d402  91 d1		 sta ($d1),y
$0f:d404  e5 e2		 sbc $e2
$0f:d406  d0 9f		 bne $d3a7
$0f:d408  b2 82		 lda ($82)
$0f:d40a  80 44		 bra $d450
$0f:d40c  1e 03 2c	  asl $2c03,x
$0f:d40f  2f e4 b0 ff   and $ffb0e4
$0f:d413  93 c1		 sta ($c1,s),y
$0f:d415  4c 09 61	  jmp $6109
$0f:d418  f9 7f f8	  sbc $f87f,y
$0f:d41b  5f fc 67 fa   eor $fa67fc,x
$0f:d41f  18			clc
$0f:d420  97 07		 sta [$07],y
$0f:d422  61 29		 adc ($29,x)
$0f:d424  48			pha
$0f:d425  c8			iny
$0f:d426  b8			clv
$0f:d427  ff 87 ce 1f   sbc $1fce87,x
$0f:d42b  83 e7		 sta $e7,s
$0f:d42d  c1 f3		 cmp ($f3,x)
$0f:d42f  f0 78		 beq $d4a9
$0f:d431  fc 3e 7f	  jsr ($7f3e,x)
$0f:d434  0c 9f ca	  tsb $ca9f
$0f:d437  09 c1		 ora #$c1
$0f:d439  00 f0		 brk #$f0
$0f:d43b  47 cc		 eor [$cc]
$0f:d43d  74 a5		 stz $a5,x
$0f:d43f  02 a8		 cop #$a8
$0f:d441  7e 3f fe	  ror $fe3f,x
$0f:d444  02 c0		 cop #$c0
$0f:d446  c0 bf e5	  cpy #$e5bf
$0f:d449  d0 8e		 bne $d3d9
$0f:d44b  17 84		 ora [$84],y
$0f:d44d  c7 4e		 cmp [$4e]
$0f:d44f  60			rts
$0f:d450  f8			sed
$0f:d451  43 e1		 eor $e1,s
$0f:d453  ef 90 c6 42   sbc $42c690
$0f:d457  33 90		 and ($90,s),y
$0f:d459  89 e4		 bit #$e4
$0f:d45b  42 73		 wdm #$73
$0f:d45d  10 bc		 bpl $d41b
$0f:d45f  cc 2e 7c	  cpy $7c2e
$0f:d462  f9 84 3b	  sbc $3b84,y
$0f:d465  e2 63		 sep #$63
$0f:d467  ab			plb
$0f:d468  a7 ff		 lda [$ff]
$0f:d46a  d1 7f		 cmp ($7f),y
$0f:d46c  74 85		 stz $85,x
$0f:d46e  9f fe d5 0f   sta $0fd5fe,x
$0f:d472  37 ff		 and [$ff],y
$0f:d474  98			tya
$0f:d475  da			phx
$0f:d476  14 60		 trb $60
$0f:d478  34 c1		 bit $c1,x
$0f:d47a  a6 06		 ldx $06
$0f:d47c  38			sec
$0f:d47d  e3 d1		 sbc $d1,s
$0f:d47f  b8			clv
$0f:d480  94 7c		 sty $7c,x
$0f:d482  75 37		 adc $37,x
$0f:d484  5d 6d 7a	  eor $7a6d,x
$0f:d487  85 fa		 sta $fa
$0f:d489  7b			tdc
$0f:d48a  7d 9f 57	  adc $579f,x
$0f:d48d  67 dc		 adc [$dc]
$0f:d48f  79 c3 fc	  adc $fcc3,y
$0f:d492  17 e1		 ora [$e1],y
$0f:d494  ef 88 01 42   sbc $420188
$0f:d498  fe e0 00	  inc $00e0,x
$0f:d49b  50 c2		 bvc $d45f
$0f:d49d  21 f1		 and ($f1,x)
$0f:d49f  88			dey
$0f:d4a0  fc 46 3d	  jsr ($3d46,x)
$0f:d4a3  b1 df		 lda ($df),y
$0f:d4a5  6c f7 d5	  jmp ($d5f7)
$0f:d4a8  3e f5 6f	  rol $6ff5,x
$0f:d4ab  bd 7b ff	  lda $ff7b,x
$0f:d4ae  43 fe		 eor $fe,s
$0f:d4b0  11 7f		 ora ($7f),y
$0f:d4b2  44 7f c1	  mvp $c1,$7f
$0f:d4b5  bf a0 6f 68   lda $686fa0,x
$0f:d4b9  5d f9 07	  eor $07f9,x
$0f:d4bc  5e 51 fd	  lsr $fd51,x
$0f:d4bf  81 7b		 sta ($7b,x)
$0f:d4c1  ad fc da	  lda $dafc
$0f:d4c4  74 6f		 stz $6f,x
$0f:d4c6  39 1a ce	  and $ce1a,y
$0f:d4c9  6d 77 71	  adc $7177
$0f:d4cc  48			pha
$0f:d4cd  cc da 77	  cpy $77da
$0f:d4d0  2d 99 af	  and $af99
$0f:d4d3  c1 7e		 cmp ($7e,x)
$0f:d4d5  19 fb 06	  ora $06fb,y
$0f:d4d8  7a			ply
$0f:d4d9  c2 25		 rep #$25
$0f:d4db  08			php
$0f:d4dc  ef 8a 7d c1   sbc $c17d8a
$0f:d4e0  9e 70 ef	  stz $ef70,x
$0f:d4e3  38			sec
$0f:d4e4  1d 5c ce	  ora $ce5c,x
$0f:d4e7  73 41		 adc ($41,s),y
$0f:d4e9  be e5 7d	  ldx $7de5,y
$0f:d4ec  33 5c		 and ($5c,s),y
$0f:d4ee  cd 16 3d	  cmp $3d16
$0f:d4f1  aa			tax
$0f:d4f2  9b			txy
$0f:d4f3  64 bf		 stz $bf
$0f:d4f5  30 6d		 bmi $d564
$0f:d4f7  dd 12 f3	  cmp $f312,x
$0f:d4fa  86 16		 stx $16
$0f:d4fc  80 b4		 bra $d4b2
$0f:d4fe  3b			tsc
$0f:d4ff  b2 2d		 lda ($2d)
$0f:d501  b5 27		 lda $27,x
$0f:d503  5d 59 e5	  eor $e559,x
$0f:d506  d2 8d		 cmp ($8d)
$0f:d508  e1 e3		 sbc ($e3,x)
$0f:d50a  b1 58		 lda ($58),y
$0f:d50c  bc 7a 2b	  ldy $2b7a,x
$0f:d50f  1e 86 c3	  asl $c386,x
$0f:d512  31 f8		 and ($f8),y
$0f:d514  f4 76 3c	  pea $3c76
$0f:d517  b9 a1 fc	  lda $fca1,y
$0f:d51a  3c 71 c4	  bit $c471,x
$0f:d51d  19 78 63	  ora $6378,y
$0f:d520  df 16 08 43   cmp $430816,x
$0f:d524  ac 7e 38	  ldy $387e
$0f:d527  67 f2		 adc [$f2]
$0f:d529  e7 ff		 sbc [$ff]
$0f:d52b  d7 5b		 cmp [$5b],y
$0f:d52d  f6 77		 inc $77,x
$0f:d52f  3d cd e7	  and $e7cd,x
$0f:d532  31 78		 and ($78),y
$0f:d534  ce 5f 10	  dec $105f
$0f:d537  61 fc		 adc ($fc,x)
$0f:d539  81 bb		 sta ($bb,x)
$0f:d53b  00 0a		 brk #$0a
$0f:d53d  1f 38 61 7c   ora $7c6138,x
$0f:d541  3f 10 75 08   and $087510,x
$0f:d545  61 f0		 adc ($f0,x)
$0f:d547  ff 3f 9e f7   sbc $f79e3f,x
$0f:d54b  7b			tdc
$0f:d54c  df ff db ff   cmp $ffdbff,x
$0f:d550  fe 5f fe	  inc $fe5f,x
$0f:d553  db			stp
$0f:d554  ff 72 bf e1   sbc $e1bf72,x
$0f:d558  ef 0a 70 13   sbc $13700a
$0f:d55c  83 99		 sta $99,s
$0f:d55e  9c 21 cf	  stz $cf21
$0f:d561  be 7c b7	  ldx $b77c,y
$0f:d564  df ce ff bb   cmp $bbffce,x
$0f:d568  bf 7f b7 fd   lda $fdb77f,x
$0f:d56c  fd ff ff	  sbc $ffff,x
$0f:d56f  bf 6f ae a3   lda $a3ae6f,x
$0f:d573  0f f4 05 92   ora $9205f4
$0f:d577  8c 52 14	  sty $1452
$0f:d57a  84 a3		 sty $a3
$0f:d57c  61 a0		 adc ($a0,x)
$0f:d57e  e0 78 20	  cpx #$2078
$0f:d581  12 0e		 ora ($0e)
$0f:d583  04 43		 tsb $43
$0f:d585  c0 f7 0c	  cpy #$0cf7
$0f:d588  83 e8		 sta $e8,s
$0f:d58a  77 14		 adc [$14],y
$0f:d58c  07 98		 ora [$98]
$0f:d58e  00 4b		 brk #$4b
$0f:d590  e0 06 59	  cpx #$5906
$0f:d593  44 3e 51	  mvp $51,$3e
$0f:d596  0d 92 43	  ora $4392
$0f:d599  a9 d1 fa	  lda #$fad1
$0f:d59c  34 7e		 bit $7e,x
$0f:d59e  98			tya
$0f:d59f  16 1a		 asl $1a,x
$0f:d5a1  14 be		 trb $be
$0f:d5a3  61 20		 adc ($20,x)
$0f:d5a5  99 48 26	  sta $2648,y
$0f:d5a8  32 0b		 and ($0b)
$0f:d5aa  05 00		 ora $00
$0f:d5ac  4a			lsr a
$0f:d5ad  95 0a		 sta $0a,x
$0f:d5af  04 8a		 tsb $8a
$0f:d5b1  0f 12 d3 cc   ora $ccd312
$0f:d5b5  20 63 30	  jsr $3063
$0f:d5b8  8c 68 63	  sty $6368
$0f:d5bb  1a			inc a
$0f:d5bc  08			php
$0f:d5bd  65 42		 adc $42
$0f:d5bf  39 60 e0	  and $e060,y
$0f:d5c2  4f ec 13 ff   eor $ff13ec
$0f:d5c6  01 08		 ora ($08,x)
$0f:d5c8  6e 04 61	  ror $6104
$0f:d5cb  fc 57 ff	  jsr ($ff57,x)
$0f:d5ce  17 f8		 ora [$f8],y
$0f:d5d0  47 f2		 eor [$f2]
$0f:d5d2  31 fd		 and ($fd),y
$0f:d5d4  98			tya
$0f:d5d5  7e e6 5f	  ror $5fe6,x
$0f:d5d8  fa			plx
$0f:d5d9  07 fa		 ora [$fa]
$0f:d5db  01 fb		 ora ($fb,x)
$0f:d5dd  80 4d		 bra $d62c
$0f:d5df  20 05 d0	  jsr $d005
$0f:d5e2  62 b3 15	  per $eb98
$0f:d5e5  68			pla
$0f:d5e6  1f fe 07 7f   ora $7f07fe,x
$0f:d5ea  07 8f		 ora [$8f]
$0f:d5ec  80 1d		 bra $d60b
$0f:d5ee  02 80		 cop #$80
$0f:d5f0  5d 13 c9	  eor $c913,x
$0f:d5f3  18			clc
$0f:d5f4  36 71		 rol $71,x
$0f:d5f6  fe fc 7f	  inc $7ffc,x
$0f:d5f9  3f 05 20 fe   and $fe2005,x
$0f:d5fd  c0 27 f0	  cpy #$f027
$0f:d600  08			php
$0f:d601  19 ef d8	  ora $d8ef,y
$0f:d604  a3 20		 lda $20,s
$0f:d606  f9 c0 3d	  sbc $3dc0,y
$0f:d609  f4 1f 7c	  pea $7c1f
$0f:d60c  07 be		 ora [$be]
$0f:d60e  e4 08		 cpx $08
$0f:d610  16 fa		 asl $fa,x
$0f:d612  01 7e		 ora ($7e,x)
$0f:d614  80 43		 bra $d659
$0f:d616  0b			phd
$0f:d617  fc e8 0c	  jsr ($0ce8,x)
$0f:d61a  06 7c		 asl $7c
$0f:d61c  ea			nop
$0f:d61d  30 75		 bmi $d694
$0f:d61f  e8			inx
$0f:d620  af 82 20 9d   lda $9d2082
$0f:d624  ff fd 76 7d   sbc $7d76fd,x
$0f:d628  3d 8f 4b	  and $4b8f,x
$0f:d62b  23 f2		 and $f2,s
$0f:d62d  e8			inx
$0f:d62e  fd 5a 5f	  sbc $5f5a,x
$0f:d631  77 97		 adc [$97],y
$0f:d633  de e4 f7	  dec $f7e4,x
$0f:d636  99 3d fe	  sta $fe3d,y
$0f:d639  01 3f		 ora ($3f,x)
$0f:d63b  00 0c		 brk #$0c
$0f:d63d  f6 04		 inc $04,x
$0f:d63f  ff 0b f4 04   sbc $04f40b,x
$0f:d643  0e 57 df	  asl $df57
$0f:d646  f5 b7		 sbc $b7,x
$0f:d648  fd ae bb	  sbc $bbae,x
$0f:d64b  ea			nop
$0f:d64c  ae b9 5b	  ldx $5bb9
$0f:d64f  d5 1f		 cmp $1f,x
$0f:d651  71 63		 adc ($63),y
$0f:d653  ce fe 79	  dec $79fe
$0f:d656  fa			plx
$0f:d657  ba			tsx
$0f:d658  a6 de		 ldx $de
$0f:d65a  91 db		 sta ($db),y
$0f:d65c  92 77		 sta ($77)
$0f:d65e  e4 1e		 cpx $1e
$0f:d660  f8			sed
$0f:d661  87 fa		 sta [$fa]
$0f:d663  03 fd		 ora $fd,s
$0f:d665  81 ed		 sta ($ed,x)
$0f:d667  e9 3a ed	  sbc #$ed3a
$0f:d66a  94 2b		 sty $2b,x
$0f:d66c  2d ae 9b	  and $9bae
$0f:d66f  73 aa		 adc ($aa,s),y
$0f:d671  d8			cld
$0f:d672  ea			nop
$0f:d673  b7 ba		 lda [$ba],y
$0f:d675  6d 5e db	  adc $db5e
$0f:d678  75 e7		 adc $e7,x
$0f:d67a  7b			tdc
$0f:d67b  da			phx
$0f:d67c  1e 66 cf	  asl $cf66,x
$0f:d67f  b9 a3 f6	  lda $f6a3,y
$0f:d682  64 e4		 stz $e4
$0f:d684  50 bc		 bvc $d642
$0f:d686  e1 c9		 sbc ($c9,x)
$0f:d688  21 7c		 and ($7c,x)
$0f:d68a  c1 d3		 cmp ($d3,x)
$0f:d68c  3c 59 de	  bit $de59,x
$0f:d68f  1d fa 0b	  ora $0bfa,x
$0f:d692  7a			ply
$0f:d693  80 ef		 bra $d684
$0f:d695  b8			clv
$0f:d696  35 db		 and $db,x
$0f:d698  17 fe		 ora [$fe],y
$0f:d69a  85 9d		 sta $9d
$0f:d69c  90 7e		 bcc $d71c
$0f:d69e  a3 bf		 lda $bf,s
$0f:d6a0  b9 e4 e7	  lda $e7e4,y
$0f:d6a3  fd 3d ff	  sbc $ff3d,x
$0f:d6a6  7f 67 df ec   adc $ecdf67,x
$0f:d6aa  ef 73 7f fe   sbc $fe7f73
$0f:d6ae  ef f4 76 31   sbc $3176f4
$0f:d6b2  9b			txy
$0f:d6b3  cc e6 b3	  cpy $b3e6
$0f:d6b6  ed ee ef	  sbc $efee
$0f:d6b9  e5 f5		 sbc $f5
$0f:d6bb  8c a5 c3	  sty $c3a5
$0f:d6be  27 b0		 and [$b0]
$0f:d6c0  a7 fc		 lda [$fc]
$0f:d6c2  61 d7		 adc ($d7,x)
$0f:d6c4  9c 32 04	  stz $0432
$0f:d6c7  3f b0 2d fd   and $fd2db0,x
$0f:d6cb  03 b9		 ora $b9,s
$0f:d6cd  23 f9		 and $f9,s
$0f:d6cf  c3 14		 cmp $14,s
$0f:d6d1  01 5c		 ora ($5c,x)
$0f:d6d3  de 56 b7	  dec $b756,x
$0f:d6d6  dc ed f7	  jml [$f7ed]
$0f:d6d9  37 7f		 and [$7f],y
$0f:d6db  4d 9f d3	  eor $d39f
$0f:d6de  37 fa		 and [$fa],y
$0f:d6e0  6e ed 9b	  ror $9bed
$0f:d6e3  bb			tyx
$0f:d6e4  fc 81 8a	  jsr ($8a81,x)
$0f:d6e7  40			rti
$0f:d6e8  52 0c		 eor ($0c)
$0f:d6ea  00 bf		 brk #$bf
$0f:d6ec  b3 c1		 lda ($c1,s),y
$0f:d6ee  7e 77 3b	  ror $3b77,x
$0f:d6f1  fc c6 7f	  jsr ($7fc6,x)
$0f:d6f4  39 9f ce	  and $ce9f,y
$0f:d6f7  27 f1		 and [$f1]
$0f:d6f9  88			dey
$0f:d6fa  fe 63 3f	  inc $3f63,x
$0f:d6fd  9c cf e3	  stz $e3cf
$0f:d700  33 ea		 and ($ea,s),y
$0f:d702  70 9f		 bvs $d6a3
$0f:d704  f0 18		 beq $d71e
$0f:d706  25 1f		 and $1f
$0f:d708  f0 67		 beq $d771
$0f:d70a  ec 0c 92	  cpx $920c
$0f:d70d  bf fe ef bf   lda $bfeffe,x
$0f:d711  ba			tsx
$0f:d712  e7 ee		 sbc [$ee]
$0f:d714  7d fd 97	  adc $97fd,x
$0f:d717  b5 86		 lda $86,x
$0f:d719  2e da 0f	  rol $0fda
$0f:d71c  f2 94		 sbc ($94)
$0f:d71e  1b			tcs
$0f:d71f  f9 88 f8	  sbc $f888,y
$0f:d722  72 1e		 adc ($1e)
$0f:d724  07 48		 ora [$48]
$0f:d726  f8			sed
$0f:d727  5a			phy
$0f:d728  3e 17 4f	  rol $4f17,x
$0f:d72b  46 d3		 lsr $d3
$0f:d72d  d1 f8		 cmp ($f8),y
$0f:d72f  80 3f		 bra $d770
$0f:d731  e3 f8		 sbc $f8,s
$0f:d733  0a			asl a
$0f:d734  16 00		 asl $00,x
$0f:d736  6c 27 79	  jmp ($7927)
$0f:d739  89 e6 72	  bit #$72e6
$0f:d73c  fd 8c bf	  sbc $bf8c,x
$0f:d73f  60			rts
$0f:d740  a7 f8		 lda [$f8]
$0f:d742  1a			inc a
$0f:d743  be 02 9f	  ldx $9f02,y
$0f:d746  c0 c0 71	  cpy #$71c0
$0f:d749  30 1c		 bmi $d767
$0f:d74b  3c 06 04	  bit $0406,x
$0f:d74e  48			pha
$0f:d74f  21 f0		 and ($f0,x)
$0f:d751  f4 70 3e	  pea $3e70
$0f:d754  1c 08 64	  trb $6408
$0f:d757  c2 0d		 rep #$0d
$0f:d759  b8			clv
$0f:d75a  8b			phb
$0f:d75b  62 21 dd	  per $b47f
$0f:d75e  08			php
$0f:d75f  7d c2 2f	  adc $2fc2,x
$0f:d762  28			plp
$0f:d763  83 e6		 sta $e6,s
$0f:d765  20 7e cf	  jsr $cf7e
$0f:d768  c4 fe		 cpy $fe
$0f:d76a  f8			sed
$0f:d76b  40			rti
$0f:d76c  08			php
$0f:d76d  ff f3 bf fe   sbc $febff3,x
$0f:d771  bf ff a7 f7   lda $f7a7ff,x
$0f:d775  f8			sed
$0f:d776  fc 7e 1f	  jsr ($1f7e,x)
$0f:d779  00 77		 brk #$77
$0f:d77b  06 22		 asl $22
$0f:d77d  45 22		 eor $22
$0f:d77f  aa			tax
$0f:d780  d5 75		 cmp $75,x
$0f:d782  5a			phy
$0f:d783  ab			plb
$0f:d784  bd df bb	  lda $bbdf,x
$0f:d787  dd ff b7	  cmp $b7ff,x
$0f:d78a  c7 11		 cmp [$11]
$0f:d78c  77 91		 adc [$91],y
$0f:d78e  77 4a		 adc [$4a],y
$0f:d790  c3 55		 cmp $55,s
$0f:d792  bb			tyx
$0f:d793  e2 3b		 sep #$3b
$0f:d795  b2 26		 lda ($26)
$0f:d797  f8			sed
$0f:d798  9b			txy
$0f:d799  f9 d8 2d	  sbc $2dd8,y
$0f:d79c  fa			plx
$0f:d79d  bb			tyx
$0f:d79e  ff cb 81 aa   sbc $aa81cb,x
$0f:d7a2  ff d5 4c 01   sbc $014cd5,x
$0f:d7a6  ff 36 12 6c   sbc $6c1236,x
$0f:d7aa  13 46		 ora ($46,s),y
$0f:d7ac  a0 95		 ldy #$95
$0f:d7ae  04 18		 tsb $18
$0f:d7b0  c0 c2		 cpy #$c2
$0f:d7b2  05 60		 ora $60
$0f:d7b4  4f fb 3f 97   eor $973ffb
$0f:d7b8  fb			xce
$0f:d7b9  54 91 ca	  mvn $ca,$91
$0f:d7bc  a2 33		 ldx #$33
$0f:d7be  98			tya
$0f:d7bf  84 a2		 sty $a2
$0f:d7c1  21 10		 and ($10,x)
$0f:d7c3  84 3d		 sty $3d
$0f:d7c5  c2 11		 rep #$11
$0f:d7c7  04 82		 tsb $82
$0f:d7c9  23 82		 and $82,s
$0f:d7cb  01 3b		 ora ($3b,x)
$0f:d7cd  80 4e		 bra $d81d
$0f:d7cf  60			rts
$0f:d7d0  13 88		 ora ($88,s),y
$0f:d7d2  04 60		 tsb $60
$0f:d7d4  0c 30 c8	  tsb $c830
$0f:d7d7  03 f4		 ora $f4,s
$0f:d7d9  26 bf		 rol $bf
$0f:d7db  ac ff 82	  ldy $82ff
$0f:d7de  df f1 ef cf   cmp $cfeff1,x
$0f:d7e2  2e 70 ca	  rol $ca70
$0f:d7e5  7c ca c7	  jmp ($c7ca,x)
$0f:d7e8  3c aa c6	  bit $c6aa,x
$0f:d7eb  bd d1 14	  lda $14d1,x
$0f:d7ee  68			pla
$0f:d7ef  7f 60 7f a8   adc $a87f60,x
$0f:d7f3  2d f2 07	  and $07f2
$0f:d7f6  7e 14 04	  ror $0414,x
$0f:d7f9  06 bd		 asl $bd
$0f:d7fb  21 db		 and ($db,x)
$0f:d7fd  d6 fd		 dec $fd,x
$0f:d7ff  b5 9a		 lda $9a,x
$0f:d801  d7 32		 cmp [$32],y
$0f:d803  cf cc 99 e1   cmp $e199cc
$0f:d807  b6 18		 ldx $18,y
$0f:d809  3f 0f fe 7f   and $7ffe0f,x
$0f:d80d  c0 84 7d	  cpy #$7d84
$0f:d810  e3 5e		 sbc $5e,s
$0f:d812  79 2f ee	  adc $ee2f,y
$0f:d815  73 f7		 adc ($f7,s),y
$0f:d817  be 7e ef	  ldx $ef7e,y
$0f:d81a  ff c4 d9 57   sbc $57d9c4,x
$0f:d81e  e0 3e 6c	  cpx #$6c3e
$0f:d821  86 cf		 stx $cf
$0f:d823  11 59		 ora ($59),y
$0f:d825  a3 70		 lda $70,s
$0f:d827  e0 1b fa	  cpx #$fa1b
$0f:d82a  04 7f		 tsb $7f
$0f:d82c  c1 6e		 cmp ($6e,x)
$0f:d82e  f0 7b		 beq $d8ab
$0f:d830  bf f7 ff 7d   lda $7dfff7,x
$0f:d834  ff ef bf fc   sbc $fcbfef,x
$0f:d838  9f 42 ff bf   sta $bfff42,x
$0f:d83c  ff c7 e3 ff   sbc $ffe3c7,x
$0f:d840  fe f5 8b	  inc $8bf5,x
$0f:d843  fd b1 bd	  sbc $bdb1,x
$0f:d846  d2 b3		 cmp ($b3)
$0f:d848  b1 3f		 lda ($3f),y
$0f:d84a  3c 13 87	  bit $8713,x
$0f:d84d  03 81		 ora $81,s
$0f:d84f  c7 e3		 cmp [$e3]
$0f:d851  d6 1b		 dec $1b,x
$0f:d853  16 76		 asl $76,x
$0f:d855  63 ce		 adc $ce,s
$0f:d857  c5 7d		 cmp $7d
$0f:d859  7c 7f cf	  jmp ($cf7f,x)
$0f:d85c  c7 ff		 cmp [$ff]
$0f:d85e  f8			sed
$0f:d85f  88			dey
$0f:d860  0f 1f 03 7f   ora $7f031f
$0f:d864  23 ee		 and $ee,s
$0f:d866  75 7d		 adc $7d,x
$0f:d868  3f 78 a4 ae   and $aea478,x
$0f:d86c  69 9d		 adc #$9d
$0f:d86e  b7 7b		 lda [$7b],y
$0f:d870  72 df		 adc ($df)
$0f:d872  af 3d fb f7   lda $f7fb3d
$0f:d876  dc 91 fa	  jml [$fa91]
$0f:d879  62 d1 4f	  per $284d
$0f:d87c  5c c3 9f 60   jml $609fc3
$0f:d880  cf c4 3d f0   cmp $f03dc4
$0f:d884  4f db b4 21   eor $21b4db
$0f:d888  95 f8		 sta $f8,x
$0f:d88a  26 7f		 rol $7f
$0f:d88c  2d 9f c3	  and $c39f
$0f:d88f  63 e0		 adc $e0,s
$0f:d891  58			cli
$0f:d892  fa			plx
$0f:d893  1f 3f 87 4f   ora $4f873f,x
$0f:d897  e0 d3 eb	  cpx #$ebd3
$0f:d89a  fa			plx
$0f:d89b  0c fa 9c	  tsb $9cfa
$0f:d89e  2c 18 fb	  bit $fb18
$0f:d8a1  83 14		 sta $14,s
$0f:d8a3  39 f3 0a	  and $0af3,y
$0f:d8a6  7e c1 96	  ror $96c1,x
$0f:d8a9  18			clc
$0f:d8aa  7f f4 1f fd   adc $fd1ff4,x
$0f:d8ae  43 69		 eor $69,s
$0f:d8b0  0c 0f fd	  tsb $fd0f
$0f:d8b3  22 ff c9 1b   jsl $1bc9ff
$0f:d8b7  42 4c		 wdm #$4c
$0f:d8b9  17 05		 ora [$05],y
$0f:d8bb  ed 3d 0e	  sbc $0e3d
$0f:d8be  f0 ca		 beq $d88a
$0f:d8c0  3c 86 29	  bit $2986,x
$0f:d8c3  e8			inx
$0f:d8c4  c5 5d		 cmp $5d
$0f:d8c6  31 4f		 and ($4f),y
$0f:d8c8  a1 25		 lda ($25,x)
$0f:d8ca  03 fd		 ora $fd,s
$0f:d8cc  bf c0 83 6f   lda $6f83c0,x
$0f:d8d0  f0 3b		 beq $d90d
$0f:d8d2  b0 10		 bcs $d8e4
$0f:d8d4  01 7b		 ora ($7b,x)
$0f:d8d6  70 07		 bvs $d8df
$0f:d8d8  03 40		 ora $40,s
$0f:d8da  c0 0b f0	  cpy #$f00b
$0f:d8dd  72 13		 adc ($13)
$0f:d8df  7f c5 9f f1   adc $f19fc5,x
$0f:d8e3  e7 fc		 sbc [$fc]
$0f:d8e5  7b			tdc
$0f:d8e6  fe 1d ef	  inc $ef1d,x
$0f:d8e9  0e bb a3	  asl $a3bb
$0f:d8ec  1f f0 06 c2   ora $c206f0,x
$0f:d8f0  ff 83 ff c0   sbc $c0ff83,x
$0f:d8f4  ff a6 20 83   sbc $8320a6,x
$0f:d8f8  fe 4c c7	  inc $c74c,x
$0f:d8fb  e5 8f		 sbc $8f
$0f:d8fd  c3 bb		 cmp $bb,s
$0f:d8ff  f9 fa fc	  sbc $fcfa,y
$0f:d902  73 7f		 adc ($7f,s),y
$0f:d904  30 df		 bmi $d8e5
$0f:d906  c8			iny
$0f:d907  2f b0 0b 9c   and $9c0bb0
$0f:d90b  07 af		 ora [$af]
$0f:d90d  81 b7		 sta ($b7,x)
$0f:d90f  f8			sed
$0f:d910  38			sec
$0f:d911  07 f0		 ora [$f0]
$0f:d913  e0 60 10	  cpx #$1060
$0f:d916  61 82		 adc ($82,x)
$0f:d918  80 63		 bra $d97d
$0f:d91a  20 1b 8c	  jsr $8c1b
$0f:d91d  87 c3		 sta [$c3]
$0f:d91f  c1 9e		 cmp ($9e,x)
$0f:d921  0d 87 fa	  ora $fa87
$0f:d924  01 f1		 ora ($f1,x)
$0f:d926  90 7f		 bcc $d9a7
$0f:d928  2f 1f ff 87   and $87ff1f
$0f:d92c  ff f9 ff fc   sbc $fcfff9,x
$0f:d930  07 46		 ora [$46]
$0f:d932  03 00		 ora $00,s
$0f:d934  87 c0		 sta [$c0]
$0f:d936  60			rts
$0f:d937  61 e0		 adc ($e0,x)
$0f:d939  53 37		 eor ($37,s),y
$0f:d93b  be 01 58	  ldx $5801,y
$0f:d93e  83 6e		 sta $6e,s
$0f:d940  54 41 00	  mvn $00,$41
$0f:d943  c1 c0		 cmp ($c0,x)
$0f:d945  3c 03 81	  bit $8103,x
$0f:d948  d8			cld
$0f:d949  c7 e1		 cmp [$e1]
$0f:d94b  ff fa c7 ff   sbc $ffc7fa,x
$0f:d94f  7f ff 87 df   adc $df87ff,x
$0f:d953  e0 71 f8	  cpx #$f871
$0f:d956  04 fe		 tsb $fe
$0f:d958  01 4f		 ora ($4f,x)
$0f:d95a  80 c4		 bra $d920
$0f:d95c  24 16		 bit $16
$0f:d95e  0c 06 82	  tsb $8206
$0f:d961  81 20		 sta ($20,x)
$0f:d963  e0 35 50	  cpx #$5035
$0f:d966  7a			ply
$0f:d967  1f 09 87 81   ora $818709,x
$0f:d96b  c3 3c		 cmp $3c,s
$0f:d96d  0e 06 aa	  asl $aa06
$0f:d970  ab			plb
$0f:d971  dd 91 5d	  cmp $5d91,x
$0f:d974  f1 00		 sbc ($00),y
$0f:d976  fe 7e c5	  inc $c57e,x
$0f:d979  2e 59 65	  rol $6559
$0f:d97c  9f 56 e7 92   sta $92e756,x
$0f:d980  58			cli
$0f:d981  3c ee 37	  bit $37ee,x
$0f:d984  2d 8f 44	  and $448f
$0f:d987  e0 51 68	  cpx #$6851
$0f:d98a  7d ba 23	  adc $23ba,x
$0f:d98d  7e 80 88	  ror $8880,x
$0f:d990  42 4f		 wdm #$4f
$0f:d992  19 9d c1	  ora $c19d,y
$0f:d995  67 d0		 adc [$d0]
$0f:d997  18			clc
$0f:d998  9c 31 92	  stz $9231
$0f:d99b  1f 0d fb d3   ora $d3fb0d,x
$0f:d99f  38			sec
$0f:d9a0  0f dd 7e dc   ora $dc7edd
$0f:d9a4  1b			tcs
$0f:d9a5  ff 2f 80 17   sbc $17802f,x
$0f:d9a9  e6 1f		 inc $1f
$0f:d9ab  0f b8 5f df   ora $df5fb8
$0f:d9af  af 0f 4c 87   lda $874c0f
$0f:d9b3  00 12		 brk #$12
$0f:d9b5  45 f3		 eor $f3
$0f:d9b7  81 c0		 sta ($c0,x)
$0f:d9b9  e3 91		 sbc $91,s
$0f:d9bb  f3 d9		 sbc ($d9,s),y
$0f:d9bd  ff fd 5d 2e   sbc $2e5dfd,x
$0f:d9c1  cd 0f 37	  cmp $370f
$0f:d9c4  42 cf		 wdm #$cf
$0f:d9c6  50 f7		 bvc $d9bf
$0f:d9c8  be 1d 77	  ldx $771d,y
$0f:d9cb  83 df		 sta $df,s
$0f:d9cd  a0 e7 d8	  ldy #$d8e7
$0f:d9d0  37 b7		 and [$b7],y
$0f:d9d2  f9 e7 fd	  sbc $fde7,y
$0f:d9d5  42 59		 wdm #$59
$0f:d9d7  eb			xba
$0f:d9d8  fe 7d 50	  inc $507d,x
$0f:d9db  35 fd		 and $fd,x
$0f:d9dd  fe 26 9f	  inc $9f26,x
$0f:d9e0  8d a5 ea	  sta $eaa5
$0f:d9e3  6d fa cb	  adc $cbfa
$0f:d9e6  5a			phy
$0f:d9e7  d4 35		 pei ($35)
$0f:d9e9  0b			phd
$0f:d9ea  41 a6		 eor ($a6,x)
$0f:d9ec  6a			ror a
$0f:d9ed  e9 fb		 sbc #$fb
$0f:d9ef  0a			asl a
$0f:d9f0  5e d2 df	  lsr $dfd2,x
$0f:d9f3  90 b5		 bcc $d9aa
$0f:d9f5  e5 18		 sbc $18
$0f:d9f7  a0 c3 29	  ldy #$29c3
$0f:d9fa  5f 53 2d ff   eor $ff2d53,x
$0f:d9fe  67 86		 adc [$86]
$0f:da00  5f ff d3 6a   eor $6ad3ff,x
$0f:da04  0d 6a fe	  ora $fe6a
$0f:da07  d9 0e c1	  cmp $c10e,y
$0f:da0a  3a			dec a
$0f:da0b  6f f8 07 48   adc $4807f8
$0f:da0f  02 42		 cop #$42
$0f:da11  95 b4		 sta $b4,x
$0f:da13  77 94		 adc [$94],y
$0f:da15  9b			txy
$0f:da16  b1 a6		 lda ($a6),y
$0f:da18  ec 69 7b	  cpx $7b69
$0f:da1b  59 5f 57	  eor $575f,y
$0f:da1e  4f d9 fe 80   eor $80fed9
$0f:da22  3f d8 e2 99   and $99e2d8,x
$0f:da26  fb			xce
$0f:da27  06 fe		 asl $fe
$0f:da29  81 f4		 sta ($f4,x)
$0f:da2b  85 f5		 sta $f5
$0f:da2d  e5 19		 sbc $19
$0f:da2f  9b			txy
$0f:da30  35 73		 and $73,x
$0f:da32  47 53		 eor [$53]
$0f:da34  d6 1c		 dec $1c,x
$0f:da36  42 c1		 wdm #$c1
$0f:da38  ff a0 5f e1   sbc $e15fa0,x
$0f:da3c  7f b9 47 be   adc $be47b9,x
$0f:da40  cd 7e d1	  cmp $d17e
$0f:da43  f8			sed
$0f:da44  f5 9b		 sbc $9b,x
$0f:da46  f3 90		 sbc ($90,s),y
$0f:da48  60			rts
$0f:da49  20 02 f0	  jsr $f002
$0f:da4c  a0 60 2e	  ldy #$2e60
$0f:da4f  1c 0c 45	  trb $450c
$0f:da52  c3 a9		 cmp $a9,s
$0f:da54  38			sec
$0f:da55  94 47		 sty $47,x
$0f:da57  23 d0		 and $d0,s
$0f:da59  c1 79		 cmp ($79,x)
$0f:da5b  70 20		 bvs $da7d
$0f:da5d  1f 08 07 e2   ora $e20708,x
$0f:da61  01 fc		 ora ($fc,x)
$0f:da63  80 4f		 bra $dab4
$0f:da65  20 11 e8	  jsr $e811
$0f:da68  05 7f		 ora $7f
$0f:da6a  41 b7		 eor ($b7,x)
$0f:da6c  a4 1c		 ldy $1c
$0f:da6e  42 3d		 wdm #$3d
$0f:da70  c1 2a		 cmp ($2a,x)
$0f:da72  84 73		 sty $73
$0f:da74  07 1c		 ora [$1c]
$0f:da76  c1 47		 cmp ($47,x)
$0f:da78  20 5f b8	  jsr $b85f
$0f:da7b  39 7c 29	  and $297c,y
$0f:da7e  7b			tdc
$0f:da7f  78			sei
$0f:da80  3f fc ca 50   and $50cafc,x
$0f:da84  ff f1 ac 30   sbc $30acf1,x
$0f:da88  74 f8		 stz $f8,x
$0f:da8a  36 7e		 rol $7e,x
$0f:da8c  09 3f		 ora #$3f
$0f:da8e  80 cf		 bra $da5f
$0f:da90  60			rts
$0f:da91  36 78		 rol $78,x
$0f:da93  34 3e		 bit $3e,x
$0f:da95  19 1f 88	  ora $881f,y
$0f:da98  6f fe 1c 0f   adc $0f1cfe
$0f:da9c  06 00		 asl $00
$0f:da9e  86 1c		 stx $1c
$0f:daa0  28			plp
$0f:daa1  06 60		 asl $60
$0f:daa3  88			dey
$0f:daa4  3e 02 10	  rol $1002,x
$0f:daa7  0d 03 ff	  ora $ff03
$0f:daaa  f0 ff		 beq $daab
$0f:daac  f8			sed
$0f:daad  3f 9c 0f dc   and $dc0f9c,x
$0f:dab1  03 ed		 ora $ed,s
$0f:dab3  00 f4		 brk #$f4
$0f:dab5  40			rti
$0f:dab6  38			sec
$0f:dab7  f0 3d		 beq $daf6
$0f:dab9  fc 01 3e	  jsr ($3e01,x)
$0f:dabc  30 38		 bmi $daf6
$0f:dabe  04 1e		 tsb $1e
$0f:dac0  07 0f		 ora [$0f]
$0f:dac2  83 47		 sta $47,s
$0f:dac4  e1 13		 sbc ($13,x)
$0f:dac6  81 90		 sta ($90,x)
$0f:dac8  27 c3		 and [$c3]
$0f:daca  f3 00		 sbc ($00,s),y
$0f:dacc  9c c0 3b	  stz $3bc0
$0f:dacf  30 0d		 bmi $dade
$0f:dad1  cc 82 e7	  cpy $e782
$0f:dad4  60			rts
$0f:dad5  f9 f0 3c	  sbc $3cf0,y
$0f:dad8  70 0e		 bvs $dae8
$0f:dada  1c 1e 03	  trb $031e
$0f:dadd  c7 80		 cmp [$80]
$0f:dadf  f9 f8 3c	  sbc $3cf8,y
$0f:dae2  7c 0e 3d	  jmp ($3d0e,x)
$0f:dae5  4c 10 38	  jmp $3810
$0f:dae8  fc 0e 7f	  jsr ($7f0e,x)
$0f:daeb  03 19		 ora $19,s
$0f:daed  80 cc		 bra $dabb
$0f:daef  08			php
$0f:daf0  60			rts
$0f:daf1  2f 26 aa 70   and $70aa26
$0f:daf5  1b			tcs
$0f:daf6  e7 80		 sbc [$80]
$0f:daf8  72 bd		 adc ($bd)
$0f:dafa  de 01 dd	  dec $dd01,x
$0f:dafd  80 6a		 bra $db69
$0f:daff  a0 15 58	  ldy #$5815
$0f:db02  06 22		 asl $22
$0f:db04  01 22		 ora ($22,x)
$0f:db06  4f 90 b4 1f   eor $1fb490
$0f:db0a  db			stp
$0f:db0b  09 83		 ora #$83
$0f:db0d  c1 20		 cmp ($20,x)
$0f:db0f  70 78		 bvs $db89
$0f:db11  04 36		 tsb $36
$0f:db13  07 15		 ora [$15]
$0f:db15  86 cd		 stx $cd
$0f:db17  e2 d6		 sep #$d6
$0f:db19  e9 6c		 sbc #$6c
$0f:db1b  36 97		 rol $97,x
$0f:db1d  0f 52 00 80   ora $800052
$0f:db21  43 e1		 eor $e1,s
$0f:db23  1d 81 4d	  ora $4d81,x
$0f:db26  e1 16		 sbc ($16,x)
$0f:db28  f8			sed
$0f:db29  85 3e		 sta $3e
$0f:db2b  60			rts
$0f:db2c  fe 88 1f	  inc $1f88,x
$0f:db2f  ff fd fe cf   sbc $cffefd,x
$0f:db33  e4 1f		 cpx $1f
$0f:db35  d4 65		 pei ($65)
$0f:db37  0f e7 f0 87   ora $87f0e7
$0f:db3b  1f df ed fe   ora $feeddf,x
$0f:db3f  c0 0d		 cpy #$0d
$0f:db41  07 f4		 ora [$f4]
$0f:db43  43 ff		 eor $ff,s
$0f:db45  ff 8f c3 f0   sbc $f0c38f,x
$0f:db49  89 61		 bit #$61
$0f:db4b  7d fe cf	  adc $cffe,x
$0f:db4e  ff 1e 7f 27   sbc $277f1e,x
$0f:db52  ff 00 ff 23   sbc $23ff00,x
$0f:db56  2a			rol a
$0f:db57  47 bf		 eor [$bf]
$0f:db59  d7 ff		 cmp [$ff],y
$0f:db5b  fb			xce
$0f:db5c  7c 13 e5	  jmp ($e513,x)
$0f:db5f  1f ff 7b fd   ora $fd7bff,x
$0f:db63  07 94		 ora [$94]
$0f:db65  7f a1 2c 27   adc $272ca1,x
$0f:db69  9f cf 07 81   sta $8107cf,x
$0f:db6d  f4 6f a3	  pea $a36f
$0f:db70  a6 6a		 ldx $6a
$0f:db72  ea			nop
$0f:db73  9b			txy
$0f:db74  35 88		 and $88,x
$0f:db76  78			sei
$0f:db77  b2 be		 lda ($be)
$0f:db79  6c af ab	  jmp ($abaf)
$0f:db7c  33 f1		 and ($f1,s),y
$0f:db7e  d5 7d		 cmp $7d,x
$0f:db80  f5 d2		 sbc $d2,x
$0f:db82  be a4 cf	  ldx $cfa4,y
$0f:db85  98			tya
$0f:db86  c1 08		 cmp ($08,x)
$0f:db88  af a9 8a 11   lda $118aa9
$0f:db8c  9f 34 ab eb   sta $ebab34,x
$0f:db90  2e f8 df	  rol $dff8
$0f:db93  bf b6 af cc   lda $ccafb6,x
$0f:db97  fb			xce
$0f:db98  5f 33 d5 4b   eor $4bd533,x
$0f:db9c  76 b1		 ror $b1,x
$0f:db9e  2c f5 57	  bit $57f5
$0f:dba1  b7 0a		 lda [$0a],y
$0f:dba3  e6 83		 inc $83
$0f:dba5  43 f7		 eor $f7,s
$0f:dba7  04 df		 tsb $df
$0f:dba9  d0 37		 bne $dbe2
$0f:dbab  74 4d		 stz $4d,x
$0f:dbad  ed 0b 3d	  sbc $3d0b
$0f:dbb0  61 ef		 adc ($ef,x)
$0f:dbb2  c8			iny
$0f:dbb3  39 f3 0e	  and $0ef3,y
$0f:dbb6  9f b1 de 14   sta $14deb1,x
$0f:dbba  bf a5 27 ed   lda $ed27a5,x
$0f:dbbe  0d f9 73	  ora $73f9
$0f:dbc1  76 53		 ror $53,x
$0f:dbc3  f7 60		 sbc [$60],y
$0f:dbc5  72 08		 adc ($08)
$0f:dbc7  13 00		 ora ($00,s),y
$0f:dbc9  9f f0 1d a0   sta $a01df0,x
$0f:dbcd  95 2f		 sta $2f,x
$0f:dbcf  e4 0f		 cpx $0f
$0f:dbd1  eb			xba
$0f:dbd2  0a			asl a
$0f:dbd3  71 84		 adc ($84),y
$0f:dbd5  bf a1 fa 82   lda $82faa1,x
$0f:dbd9  97 50		 sta [$50],y
$0f:dbdb  72 10		 adc ($10)
$0f:dbdd  af dd 02 ff   lda $ff02dd
$0f:dbe1  d0 ef		 bne $dbd2
$0f:dbe3  c1 7f		 cmp ($7f,x)
$0f:dbe5  a8			tay
$0f:dbe6  10 c2		 bpl $dbaa
$0f:dbe8  43 a1		 eor $a1,s
$0f:dbea  d8			cld
$0f:dbeb  6a			ror a
$0f:dbec  1e 1b 0f	  asl $0f1b,x
$0f:dbef  42 83		 wdm #$83
$0f:dbf1  8d 86 8f	  sta $8f86
$0f:dbf4  02 c0		 cop #$c0
$0f:dbf6  c1 b1		 cmp ($b1,x)
$0f:dbf8  d0 01		 bne $dbfb
$0f:dbfa  f8			sed
$0f:dbfb  71 c8		 adc ($c8),y
$0f:dbfd  43 47		 eor $47,s
$0f:dbff  23 1e		 and $1e,s
$0f:dc01  1e 01 1c	  asl $1c01,x
$0f:dc04  c1 c7		 cmp ($c7,x)
$0f:dc06  30 51		 bmi $dc59
$0f:dc08  88			dey
$0f:dc09  34 e3		 bit $e3,x
$0f:dc0b  09 38		 ora #$38
$0f:dc0d  82 4e 20	  brl $fc5e
$0f:dc10  b3 08		 lda ($08,s),y
$0f:dc12  44 c2 1a	  mvp $1a,$c2
$0f:dc15  83 08		 sta $08,s
$0f:dc17  7f f8 c2 11   adc $11c2f8,x
$0f:dc1b  ff e1 94 23   sbc $2394e1,x
$0f:dc1f  c6 60		 dec $60
$0f:dc21  fc 47 c5	  jsr ($c547,x)
$0f:dc24  81 7f		 sta ($7f,x)
$0f:dc26  80 5f		 bra $dc87
$0f:dc28  a0 1f		 ldy #$1f
$0f:dc2a  98			tya
$0f:dc2b  07 8c		 ora [$8c]
$0f:dc2d  98			tya
$0f:dc2e  10 19		 bpl $dc49
$0f:dc30  7c 0e 9f	  jmp ($9f0e,x)
$0f:dc33  84 af		 sty $af
$0f:dc35  e0 20		 cpx #$20
$0f:dc37  18			clc
$0f:dc38  18			clc
$0f:dc39  04 18		 tsb $18
$0f:dc3b  9c 10 0b	  stz $0b10
$0f:dc3e  c4 03		 cpy $03
$0f:dc40  e1 20		 sbc ($20,x)
$0f:dc42  f8			sed
$0f:dc43  50 3c		 bvc $dc81
$0f:dc45  1c 08 37	  trb $3708
$0f:dc48  fe 09 fe	  inc $fe09,x
$0f:dc4b  8c 7f 6e	  sty $6e7f
$0f:dc4e  1f ff 87 ff   ora $ff87ff,x
$0f:dc52  c1 ff		 cmp ($ff,x)
$0f:dc54  f1 7f		 sbc ($7f),y
$0f:dc56  f8			sed
$0f:dc57  80 90		 bra $dbe9
$0f:dc59  80 40		 bra $dc9b
$0f:dc5b  60			rts
$0f:dc5c  10 20		 bpl $dc7e
$0f:dc5e  f0 29		 beq $dc89
$0f:dc60  1e 03 9a	  asl $9a03,x
$0f:dc63  80 dd		 bra $dc42
$0f:dc65  a0 3f		 ldy #$3f
$0f:dc67  68			pla
$0f:dc68  1f d2 07 e4   ora $e407d2,x
$0f:dc6c  83 7a		 sta $7a,s
$0f:dc6e  20 dc 88	  jsr $88dc
$0f:dc71  57 52		 eor [$52],y
$0f:dc73  cf 03 c7 c1   cmp $c1c703
$0f:dc77  e1 ec		 sbc ($ec,x)
$0f:dc79  21 8f		 and ($8f,x)
$0f:dc7b  c1 e3		 cmp ($e3,x)
$0f:dc7d  d0 e9		 bne $dc68
$0f:dc7f  f3 28		 sbc ($28,s),y
$0f:dc81  23 ca		 and $ca,s
$0f:dc83  59 6c 1a	  eor $1a6c,y
$0f:dc86  96 5d		 stx $5d,y
$0f:dc88  26 a4		 rol $a4
$0f:dc8a  2c 46 22	  bit $2246
$0f:dc8d  45 22		 eor $22
$0f:dc8f  aa			tax
$0f:dc90  d5 75		 cmp $75,x
$0f:dc92  5a			phy
$0f:dc93  ab			plb
$0f:dc94  bd df bb	  lda $bbdf,x
$0f:dc97  dd 0e 80	  cmp $800e,x
$0f:dc9a  74 2e		 stz $2e,x
$0f:dc9c  f0 0e		 beq $dcac
$0f:dc9e  ec 03 55	  cpx $5503
$0f:dca1  00 aa		 brk #$aa
$0f:dca3  bc 82 01	  ldy $0182,x
$0f:dca6  22 80 75 ab   jsl $ab7580
$0f:dcaa  79 b8 b6	  adc $b6b8,y
$0f:dcad  2e 2d 8d	  rol $8d2d
$0f:dcb0  0a			asl a
$0f:dcb1  0f 36 ad 9c   ora $9cad36
$0f:dcb5  ab			plb
$0f:dcb6  d6 22		 dec $22,x
$0f:dcb8  fd f9 06	  sbc $06f9,x
$0f:dcbb  7e c0 21	  ror $21c0,x
$0f:dcbe  40			rti
$0f:dcbf  f8			sed
$0f:dcc0  07 c2		 ora [$c2]
$0f:dcc2  bf 20 ff c0   lda $c0ff20,x
$0f:dcc6  8c 01 fc	  sty $fc01
$0f:dcc9  9f fc 2f ff   sta $ff2ffc,x
$0f:dccd  89 fc		 bit #$fc
$0f:dccf  31 fe		 and ($fe),y
$0f:dcd1  5f f8 3c 1e   eor $1e3cf8,x
$0f:dcd5  31 1f		 and ($1f),y
$0f:dcd7  b0 5f		 bcs $dd38
$0f:dcd9  f0 1f		 beq $dcfa
$0f:dcdb  fe 00 e8	  inc $e800,x
$0f:dcde  c0 00		 cpy #$00
$0f:dce0  ff 18 0f fa   sbc $fa0f18,x
$0f:dce4  0f fe 81 ff   ora $ff81fe
$0f:dce8  21 e6		 and ($e6,x)
$0f:dcea  c0 f0		 cpy #$f0
$0f:dcec  5f f8 17 f8   eor $f817f8,x
$0f:dcf0  0c 06 05	  tsb $0506
$0f:dcf3  03 82		 ora $82,s
$0f:dcf5  41 cc		 eor ($cc,x)
$0f:dcf7  60			rts
$0f:dcf8  41 09		 eor ($09,x)
$0f:dcfa  04 fe		 tsb $fe
$0f:dcfc  81 7f		 sta ($7f,x)
$0f:dcfe  22 87 86 3d   jsl $3d8687
$0f:dd02  e3 8e		 sbc $8e,s
$0f:dd04  1c 43 ef	  trb $ef43
$0f:dd07  08			php
$0f:dd08  24 29		 bit $29
$0f:dd0a  34 4f		 bit $4f,x
$0f:dd0c  f9 e3 81	  sbc $81e3,y
$0f:dd0f  f0 e0		 beq $dcf1
$0f:dd11  7c 78 3e	  jmp ($3e78,x)
$0f:dd14  1d 28 23	  ora $2328,x
$0f:dd17  f0 87		 beq $dca0
$0f:dd19  c3 e1		 cmp $e1,s
$0f:dd1b  c3 20		 cmp $20,s
$0f:dd1d  ff a7 c3 f0   sbc $f0c3a7,x
$0f:dd21  a2 5f		 ldx #$5f
$0f:dd23  82 a8 77	  brl $54ce
$0f:dd26  5f 7d ef af   eor $afef7d,x
$0f:dd2a  5d d1 9b	  eor $9bd1,x
$0f:dd2d  f2 2e		 sbc ($2e)
$0f:dd2f  58			cli
$0f:dd30  da			phx
$0f:dd31  d6 96		 dec $96,x
$0f:dd33  d3 96		 cmp ($96,s),y
$0f:dd35  8e fc 86	  stx $86fc
$0f:dd38  81 3f		 sta ($3f,x)
$0f:dd3a  f4 16 81	  pea $8116
$0f:dd3d  86 90		 stx $90
$0f:dd3f  ff 83 2c 35   sbc $352c83,x
$0f:dd43  96 fa		 stx $fa,y
$0f:dd45  d6 ef		 dec $ef,x
$0f:dd47  6d cf db	  adc $dbcf
$0f:dd4a  5e 6f 58	  lsr $586f,x
$0f:dd4d  7a			ply
$0f:dd4e  f7 fe		 sbc [$fe],y
$0f:dd50  df ff bf ff   cmp $ffbfff,x
$0f:dd54  fd f1 0f	  sbc $0ff1,x
$0f:dd57  dc 10 ee	  jml [$ee10]
$0f:dd5a  e0 01		 cpx #$01
$0f:dd5c  e9 cc		 sbc #$cc
$0f:dd5e  a3 5e		 lda $5e,s
$0f:dd60  6a			ror a
$0f:dd61  3f e2 c9 fb   and $fbc9e2,x
$0f:dd65  7a			ply
$0f:dd66  94 93		 sty $93,x
$0f:dd68  f7 34		 sbc [$34],y
$0f:dd6a  fd fc e1	  sbc $e1fc,x
$0f:dd6d  9f e8 0b 8e   sta $8e0be8,x
$0f:dd71  b0 10		 bcs $dd83
$0f:dd73  0f 06 03 e1   ora $e10306
$0f:dd77  60			rts
$0f:dd78  f8			sed
$0f:dd79  46 33		 lsr $33
$0f:dd7b  10 cc		 bpl $dd49
$0f:dd7d  74 13		 stz $13,x
$0f:dd7f  0d 02 c3	  ora $c302
$0f:dd82  c0 81		 cpy #$81
$0f:dd84  e3 00		 sbc $00,s
$0f:dd86  f8			sed
$0f:dd87  40			rti
$0f:dd88  3f 10 0c e4   and $e40c10,x
$0f:dd8c  03 1d		 ora $1d,s
$0f:dd8e  00 c3		 brk #$c3
$0f:dd90  40			rti
$0f:dd91  30 f0		 bmi $dd83
$0f:dd93  08			php
$0f:dd94  24 1a		 bit $1a
$0f:dd96  0d 04 85	  ora $8504
$0f:dd99  41 21		 eor ($21,x)
$0f:dd9b  90 88		 bcc $dd25
$0f:dd9d  24 22		 bit $22
$0f:dd9f  31 00		 and ($00),y
$0f:dda1  84 44		 sty $44
$0f:dda3  22 10 08 30   jsl $300810
$0f:dda7  f8			sed
$0f:dda8  61 d0		 adc ($d0,x)
$0f:ddaa  08			php
$0f:ddab  61 10		 adc ($10,x)
$0f:ddad  47 20		 eor [$20]
$0f:ddaf  39 01 e8	  and $e801,y
$0f:ddb2  5a			phy
$0f:ddb3  e2 97		 sep #$97
$0f:ddb5  e8			inx
$0f:ddb6  0d f2 07	  ora $07f2
$0f:ddb9  7c 81 7e	  jmp ($7e81,x)
$0f:ddbc  20 df 08	  jsr $08df
$0f:ddbf  67 c2		 adc [$c2]
$0f:ddc1  1b			tcs
$0f:ddc2  e0 8d		 cpx #$8d
$0f:ddc4  cf ff e5 f0   cmp $f0e5ff
$0f:ddc8  93 ff		 sta ($ff,s),y
$0f:ddca  e1 ff		 sbc ($ff,x)
$0f:ddcc  e8			inx
$0f:ddcd  ff fa 7f fc   sbc $fc7ffa,x
$0f:ddd1  bf ff 6f ff   lda $ff6fff,x
$0f:ddd5  be 7c 82	  ldx $827c,y
$0f:ddd8  fd 90 bf	  sbc $bf90,x
$0f:dddb  e4 7f		 cpx $7f
$0f:dddd  d1 0b		 cmp ($0b),y
$0f:dddf  3d e3 cf	  and $cfe3,x
$0f:dde2  10 93		 bpl $dd77
$0f:dde4  f4 27 bc	  pea $bc27
$0f:dde7  ca			dex
$0f:dde8  fe ff 9f	  inc $9fff,x
$0f:ddeb  3f c7 5f e9   and $e95fc7,x
$0f:ddef  fb			xce
$0f:ddf0  fa			plx
$0f:ddf1  3e fd 0a	  rol $0afd,x
$0f:ddf4  1e f8 ff	  asl $fff8,x
$0f:ddf7  0e 7f 18	  asl $187f
$0f:ddfa  ff cc 12 01   sbc $0112cc,x
$0f:ddfe  7e f0 7f	  ror $7ff0,x
$0f:de01  38			sec
$0f:de02  1f 38 07 ba   ora $ba0738,x
$0f:de06  01 7c		 ora ($7c,x)
$0f:de08  12 0a		 ora ($0a)
$0f:de0a  7c 70 30	  jmp ($3070,x)
$0f:de0d  08			php
$0f:de0e  19 10 62	  ora $6210,y
$0f:de11  30 0c		 bmi $de1f
$0f:de13  1c 02 0f	  trb $0f02
$0f:de16  00 89		 brk #$89
$0f:de18  6b			rtl
$0f:de19  20 53 c8	  jsr $c853
$0f:de1c  25 62		 and $62
$0f:de1e  09 38		 ora #$38
$0f:de20  82 46 21	  brl $ff69
$0f:de23  13 05		 ora ($05,s),y
$0f:de25  c8			iny
$0f:de26  dc 2f d3	  jml [$d32f]
$0f:de29  ef f4 fb f9   sbc $f9fbf4
$0f:de2d  5c fe 4f 3f   jml $3f4ffe
$0f:de31  91 cf		 sta ($cf),y
$0f:de33  c4 e1		 cpy $e1
$0f:de35  92 37		 sta ($37)
$0f:de37  88			dey
$0f:de38  0c 02 05	  tsb $0502
$0f:de3b  01 81		 ora ($81,x)
$0f:de3d  0b			phd
$0f:de3e  82 03 09	  brl $e744
$0f:de41  81 c2		 sta ($c2,x)
$0f:de43  1b			tcs
$0f:de44  01 01		 ora ($01,x)
$0f:de46  82 40 20	  brl $fe89
$0f:de49  30 18		 bmi $de63
$0f:de4b  1b			tcs
$0f:de4c  84 20		 sty $20
$0f:de4e  43 10		 eor $10,s
$0f:de50  1a			inc a
$0f:de51  80 d4		 bra $de27
$0f:de53  21 d0		 and ($d0,x)
$0f:de55  88			dey
$0f:de56  3c 13 fe	  bit $fe13,x
$0f:de59  ef 3d df ff   sbc $ffdf3d
$0f:de5d  dd ff aa	  cmp $aaff,x
$0f:de60  ff f5 5f fa   sbc $fa5ff5,x
$0f:de64  27 fd		 and [$fd]
$0f:de66  3e 4f fa	  rol $fa4f,x
$0f:de69  b2 4a		 lda ($4a)
$0f:de6b  e1 d2		 sbc ($d2,x)
$0f:de6d  99 9c 52	  sta $529c,y
$0f:de70  25 0b		 and $0b
$0f:de72  86 c0		 stx $c0
$0f:de74  e2 f0		 sep #$f0
$0f:de76  89 74		 bit #$74
$0f:de78  7e 7d 1f	  ror $1f7d,x
$0f:de7b  b7 c4		 lda [$c4],y
$0f:de7d  25 f1		 and $f1
$0f:de7f  09 bc		 ora #$bc
$0f:de81  22 37 04 87   jsl $870437
$0f:de85  c0 23		 cpy #$23
$0f:de87  f0 09		 beq $de92
$0f:de89  f8			sed
$0f:de8a  a8			tay
$0f:de8b  5f c0 2f 58   eor $582fc0,x
$0f:de8f  0f fa 1f f0   ora $f01ffa
$0f:de93  9f f0 2f ef   sta $ef2ff0,x
$0f:de97  f6 83		 inc $83,x
$0f:de99  c1 e3		 cmp ($e3,x)
$0f:de9b  11 fb		 ora ($fb),y
$0f:de9d  05 ff		 ora $ff
$0f:de9f  01 ff		 ora ($ff,x)
$0f:dea1  e0 7f		 cpx #$7f
$0f:dea3  f6 11		 inc $11,x
$0f:dea5  ff c4 bf f9   sbc $f9bfc4,x
$0f:dea9  3f f1 6f c5   and $c56ff1,x
$0f:dead  c8			iny
$0f:deae  4d 0f 02	  eor $020f
$0f:deb1  48			pha
$0f:deb2  27 f4		 and [$f4]
$0f:deb4  0b			phd
$0f:deb5  f9 3c 05	  sbc $053c,y
$0f:deb8  c8			iny
$0f:deb9  fe 0f f4	  inc $f40f,x
$0f:debc  02 7d		 cop #$7d
$0f:debe  80 df		 bra $de9f
$0f:dec0  60			rts
$0f:dec1  0e 21 fc	  asl $fc21
$0f:dec4  3c 0a 78	  bit $780a,x
$0f:dec7  1d e5 7f	  ora $7fe5,x
$0f:deca  41 0a		 eor ($0a,x)
$0f:decc  19 a1 d0	  ora $d0a1,y
$0f:decf  f4 78 47	  pea $4778
$0f:ded2  23 e9		 and $e9,s
$0f:ded4  30 8c		 bmi $de62
$0f:ded6  c7 92		 cmp [$92]
$0f:ded8  e1 33		 sbc ($33,x)
$0f:deda  9e 4c a7	  stz $a74c,x
$0f:dedd  bf 0f fa 7c   lda $7cfa0f,x
$0f:dee1  0c 20 a3	  tsb $a320
$0f:dee4  43 38		 eor $38,s
$0f:dee6  19 c3 69	  ora $69c3,y
$0f:dee9  7b			tdc
$0f:deea  9b			txy
$0f:deeb  7f 7f df 9f   adc $9fdf7f,x
$0f:deef  77 e6		 adc [$e6],y
$0f:def1  af f8 bd e9   lda $e9bdf8
$0f:def5  3f 74 4f dd   and $dd4f74,x
$0f:def9  d2 0f		 cmp ($0f)
$0f:defb  f8			sed
$0f:defc  83 ff		 sta $ff,s
$0f:defe  21 ff		 and ($ff,x)
$0f:df00  86 18		 stx $18
$0f:df02  47 c7		 eor [$c7]
$0f:df04  61 e0		 adc ($e0,x)
$0f:df06  bf f0 2e ff   lda $ff2ef0,x
$0f:df0a  8b			phb
$0f:df0b  b7 fa		 lda [$fa],y
$0f:df0d  ad de 9d	  lda $9dde
$0f:df10  ff e5 5e e9   sbc $e95ee5,x
$0f:df14  17 9a		 ora [$9a],y
$0f:df16  69 f6		 adc #$f6
$0f:df18  8a			txa
$0f:df19  fd f2 37	  sbc $37f2,x
$0f:df1c  3f f4 07 bd   and $bd07f4,x
$0f:df20  21 7f		 and ($7f,x)
$0f:df22  07 ba		 ora [$ba]
$0f:df24  23 e6		 and $e6,s
$0f:df26  8c fd a1	  sty $a1fd
$0f:df29  3f 78 47 ce   and $ce4778,x
$0f:df2d  19 b4 fd	  ora $fdb4,y
$0f:df30  ec bf b5	  cpx $b5bf
$0f:df33  2b			pld
$0f:df34  ec 6a 7b	  cpx $7b6a
$0f:df37  3a			dec a
$0f:df38  9e ea b7	  stz $b7ea,x
$0f:df3b  b2 c9		 lda ($c9)
$0f:df3d  fd 3a ba	  sbc $ba3a,x
$0f:df40  2f 22 60 0f   and $0f6022
$0f:df44  00 78		 brk #$78
$0f:df46  1b			tcs
$0f:df47  fa			plx
$0f:df48  00 f0		 brk #$f0
$0f:df4a  2b			pld
$0f:df4b  fa			plx
$0f:df4c  0a			asl a
$0f:df4d  1e 04 1e	  asl $1e04,x
$0f:df50  14 1c		 trb $1c
$0f:df52  0d 03 03	  ora $0303
$0f:df55  20 e0 c8	  jsr $c8e0
$0f:df58  78			sei
$0f:df59  5a			phy
$0f:df5a  0a			asl a
$0f:df5b  16 42		 asl $42,x
$0f:df5d  c9 c3		 cmp #$c3
$0f:df5f  80 07		 bra $df68
$0f:df61  c3 82		 cmp $82,s
$0f:df63  22 1f 0c 03   jsl $030c1f
$0f:df67  c7 00		 cmp [$00]
$0f:df69  f1 40		 sbc ($40),y
$0f:df6b  3e 84 50	  rol $5084,x
$0f:df6e  00 80		 brk #$80
$0f:df70  c3 c7		 cmp $c7,s
$0f:df72  b4 3e		 ldy $3e,x
$0f:df74  78			sei
$0f:df75  18			clc
$0f:df76  f8			sed
$0f:df77  61 9f		 adc ($9f,x)
$0f:df79  f9 00 b8	  sbc $b800,y
$0f:df7c  0b			phd
$0f:df7d  e9 1f		 sbc #$1f
$0f:df7f  8f e0 30 11   sta $1130e0
$0f:df83  e8			inx
$0f:df84  f2 28		 sbc ($28)
$0f:df86  47 b4		 eor [$b4]
$0f:df88  58			cli
$0f:df89  12 f9		 ora ($f9)
$0f:df8b  4e 27 02	  lsr $0227
$0f:df8e  e0 c7		 cpx #$c7
$0f:df90  63 bc		 adc $bc,s
$0f:df92  1e 08 7c	  asl $7c08,x
$0f:df95  3f e3 f1 1f   and $1ff1e3,x
$0f:df99  4c 1f ff	  jmp $ff1f
$0f:df9c  31 2b		 and ($2b),y
$0f:df9e  81 7c		 sta ($7c,x)
$0f:dfa0  a3 91		 lda $91,s
$0f:dfa2  cb			wai
$0f:dfa3  85 c2		 sta $c2
$0f:dfa5  0f 07 bf df   ora $dfbf07
$0f:dfa9  c9 c0		 cmp #$c0
$0f:dfab  ab			plb
$0f:dfac  11 eb		 ora ($eb),y
$0f:dfae  78			sei
$0f:dfaf  27 f3		 and [$f3]
$0f:dfb1  cf fd 0e 3f   cmp $3f0efd
$0f:dfb5  18			clc
$0f:dfb6  80 c0		 bra $df78
$0f:dfb8  54 a1 06	  mvn $06,$a1
$0f:dfbb  83 5e		 sta $5e,s
$0f:dfbd  2f 0a b3 56   and $56b30a
$0f:dfc1  50 f4		 bvc $dfb7
$0f:dfc3  b3 07		 lda ($07,s),y
$0f:dfc5  d4 b9		 pei ($b9)
$0f:dfc7  dc d4 61	  jml [$61d4]
$0f:dfca  81 c0		 sta ($c0,x)
$0f:dfcc  fe 3f 0a	  inc $0a3f,x
$0f:dfcf  b2 88		 lda ($88)
$0f:dfd1  8f b9 ff b5   sta $b5ffb9
$0f:dfd5  49 bd		 eor #$bd
$0f:dfd7  96 4d		 stx $4d,y
$0f:dfd9  61 93		 adc ($93,x)
$0f:dfdb  5a			phy
$0f:dfdc  e5 81		 sbc $81
$0f:dfde  50 a9		 bvc $df89
$0f:dfe0  cd 26 b1	  cmp $b126
$0f:dfe3  69 2c		 adc #$2c
$0f:dfe5  5a			phy
$0f:dfe6  ef 08 b3 c6   sbc $c6b308
$0f:dfea  04 21		 tsb $21
$0f:dfec  6f 88 09 40   adc $400988
$0f:dff0  3e 13 71	  rol $7113,x
$0f:dff3  50 e4		 bvc $dfd9
$0f:dff5  ed 19 fb	  sbc $fb19
$0f:dff8  26 66		 rol $66
$0f:dffa  c9 0b		 cmp #$0b
$0f:dffc  fb			xce
$0f:dffd  53 fe		 eor ($fe,s),y
$0f:dfff  54 5f de	  mvn $de,$5f
$0f:e002  9b			txy
$0f:e003  73 a7		 adc ($a7,s),y
$0f:e005  dc 59 f3	  jml [$f359]
$0f:e008  f7 3c		 sbc [$3c],y
$0f:e00a  7d 8f 3f	  adc $3f8f,x
$0f:e00d  f9 83 fc	  sbc $fc83,y
$0f:e010  61 ff		 adc ($ff,x)
$0f:e012  c8			iny
$0f:e013  1e ea 8b	  asl $8bea,x
$0f:e016  b9 a3 68	  lda $68a3,y
$0f:e019  24 14		 bit $14
$0f:e01b  8a			txa
$0f:e01c  04 db		 tsb $db
$0f:e01e  e5 ab		 sbc $ab
$0f:e020  ad 55 f7	  lda $f755
$0f:e023  9b			txy
$0f:e024  7f 86 7e 01   adc $017e86,x
$0f:e028  bf a0 77 ff   lda $ff77a0,x
$0f:e02c  fb			xce
$0f:e02d  ff fc 37 ff   sbc $ff37fc,x
$0f:e031  05 3d		 ora $3d
$0f:e033  8c 3d 56	  sty $563d
$0f:e036  7f 88 07 c2   adc $c20788,x
$0f:e03a  01 e1		 ora ($e1,x)
$0f:e03c  80 f1		 bra $e02f
$0f:e03e  a0 f9		 ldy #$f9
$0f:e040  88			dey
$0f:e041  fd 9e f1	  sbc $f19e,x
$0f:e044  3e e6 ff	  rol $ffe6,x
$0f:e047  3f 7f f3 f8   and $f8f37f,x
$0f:e04b  ff bf ee a0   sbc $a0eebf,x
$0f:e04f  f0 7f		 beq $e0d0
$0f:e051  f0 1f		 beq $e072
$0f:e053  f8			sed
$0f:e054  67 cf		 adc [$cf]
$0f:e056  f1 07		 sbc ($07),y
$0f:e058  b2 5e		 lda ($5e)
$0f:e05a  f8			sed
$0f:e05b  5f fc b7 be   eor $beb7fc,x
$0f:e05f  55 df		 eor $df,x
$0f:e061  ed 4f f6	  sbc $f64f
$0f:e064  57 fb		 eor [$fb],y
$0f:e066  97 ff		 sta [$ff],y
$0f:e068  ec 88 17	  cpx $1788
$0f:e06b  8e 79 ea	  stx $ea79
$0f:e06e  9f 3a 57 e6   sta $e6573a,x
$0f:e072  8b			phb
$0f:e073  f9 a3 ad	  sbc $ada3,y
$0f:e076  43 e3		 eor $e3,s
$0f:e078  4d fa d1	  eor $d1fa
$0f:e07b  7d 75 db	  adc $db75,x
$0f:e07e  ff d2 ff fa   sbc $faffd2,x
$0f:e082  bf ff 6f ac   lda $ac6fff,x
$0f:e086  41 bd		 eor ($bd,x)
$0f:e088  fe 6f 7f	  inc $7f6f,x
$0f:e08b  1b			tcs
$0f:e08c  9f cf 23 73   sta $7323cf,x
$0f:e090  c9 34		 cmp #$34
$0f:e092  07 35		 ora [$35]
$0f:e094  7b			tdc
$0f:e095  e5 4e		 sbc $4e
$0f:e097  e9 5b		 sbc #$5b
$0f:e099  b6 b8		 ldx $b8,y
$0f:e09b  53 b7		 eor ($b7,s),y
$0f:e09d  ff 34 58 38   sbc $385834,x
$0f:e0a1  07 f7		 ora [$f7]
$0f:e0a3  04 72		 tsb $72
$0f:e0a5  a2 80		 ldx #$80
$0f:e0a7  2b			pld
$0f:e0a8  95 fe		 sta $fe,x
$0f:e0aa  a7 7f		 lda [$7f]
$0f:e0ac  6d bf 9b	  adc $9bbf
$0f:e0af  6f fd 76 f7   adc $f776fd
$0f:e0b3  b8			clv
$0f:e0b4  4f 4f e1 bf   eor $bfe14f
$0f:e0b8  af e8 3b f2   lda $f23be8
$0f:e0bc  02 e8		 cop #$e8
$0f:e0be  17 43		 ora [$43],y
$0f:e0c0  df 10 03 82   cmp $820310,x
$0f:e0c4  80 bb		 bra $e081
$0f:e0c6  12 0e		 ora ($0e)
$0f:e0c8  84 82		 sty $82
$0f:e0ca  d1 90		 cmp ($90),y
$0f:e0cc  09 84		 ora #$84
$0f:e0ce  f3 81		 sbc ($81,s),y
$0f:e0d0  14 f4		 trb $f4
$0f:e0d2  63 be		 adc $be,s
$0f:e0d4  1c 3f e1	  trb $e13f
$0f:e0d7  bc 8d e0	  ldy $e08d,x
$0f:e0da  6f 0f e0 98   adc $98e00f
$0f:e0de  7f ca 12 86   adc $8612ca,x
$0f:e0e2  7f e0 3f e8   adc $e83fe0,x
$0f:e0e6  32 82		 and ($82)
$0f:e0e8  2f f7 f8 1c   and $1cf8f7
$0f:e0ec  0e 1f 0f	  asl $0f1f
$0f:e0ef  80 11		 bra $e102
$0f:e0f1  5c d0 2a 10   jml $102ad0
$0f:e0f5  9e 28 03	  stz $0328,x
$0f:e0f8  fd 01 8e	  sbc $8e01,x
$0f:e0fb  f8			sed
$0f:e0fc  bc 71 c5	  ldy $c571,x
$0f:e0ff  00 47		 brk #$47
$0f:e101  e3 e3		 sbc $e3,s
$0f:e103  f0 ff		 beq $e104
$0f:e105  7f af 17 88   adc $8817af,x
$0f:e109  e9 65		 sbc #$65
$0f:e10b  3f ff 1c 77   and $771cff,x
$0f:e10f  3a			dec a
$0f:e110  63 3f		 adc $3f,s
$0f:e112  e0 28		 cpx #$28
$0f:e114  23 9c		 and $9c,s
$0f:e116  71 cf		 adc ($cf),y
$0f:e118  ff f0 a8 10   sbc $10a8f0,x
$0f:e11c  7b			tdc
$0f:e11d  fe 03 3f	  inc $3f03,x
$0f:e120  60			rts
$0f:e121  f7 c4		 sbc [$c4],y
$0f:e123  db			stp
$0f:e124  e1 fd		 sbc ($fd,x)
$0f:e126  81 15		 sta ($15,x)
$0f:e128  c3 ff		 cmp $ff,s
$0f:e12a  ff 9f cf f1   sbc $f1cf9f,x
$0f:e12e  f8			sed
$0f:e12f  fb			xce
$0f:e130  0f 86 2f f7   ora $f72f86
$0f:e134  86 a6		 stx $a6
$0f:e136  cc 82 19	  cpy $1982
$0f:e139  fc f7 ff	  jsr ($fff7,x)
$0f:e13c  e1 ff		 sbc ($ff,x)
$0f:e13e  a0 4b		 ldy #$4b
$0f:e140  e5 1f		 sbc $1f
$0f:e142  88			dey
$0f:e143  3e 1e f0	  rol $f01e,x
$0f:e146  93 04		 sta ($04,s),y
$0f:e148  f8			sed
$0f:e149  2f cb f1 f8   and $f8f1cb
$0f:e14d  fe 7f 3e	  inc $3e7f,x
$0f:e150  ff 75 e1 f8   sbc $f8e175,x
$0f:e154  17 21		 ora [$21],y
$0f:e156  f7 84		 sbc [$84],y
$0f:e158  73 e6		 adc ($e6,s),y
$0f:e15a  07 36		 ora [$36]
$0f:e15c  62 87 9f	  per $80e6
$0f:e15f  cf 08 87 b5   cmp $b58708
$0f:e163  9d b2 72	  sta $72b2,x
$0f:e166  2e ee 22	  rol $22ee
$0f:e169  ef 55 d5 6a   sbc $6ad555
$0f:e16d  aa			tax
$0f:e16e  bd d9 15	  lda $15d9,x
$0f:e171  df 10 45 82   cmp $824510,x
$0f:e175  2a			rol a
$0f:e176  42 e3		 wdm #$e3
$0f:e178  51 68		 eor ($68),y
$0f:e17a  7c 76 0b	  jmp ($0b76,x)
$0f:e17d  12 87		 ora ($87)
$0f:e17f  46 61		 lsr $61
$0f:e181  f1 c8		 sbc ($c8),y
$0f:e183  7c 68 1e	  jmp ($1e68,x)
$0f:e186  10 b8		 bpl $e140
$0f:e188  dc 12 3f	  jml [$3f12]
$0f:e18b  00 8e		 brk #$8e
$0f:e18d  c0 a3		 cpy #$a3
$0f:e18f  d0 11		 bne $e1a2
$0f:e191  08			php
$0f:e192  08			php
$0f:e193  40			rti
$0f:e194  3e 01 f0	  rol $f001,x
$0f:e197  ba			tsx
$0f:e198  7e 7a 97	  ror $977a,x
$0f:e19b  9e 45 8a	  stz $8a45,x
$0f:e19e  11 e3		 ora ($e3),y
$0f:e1a0  ed 6c ed	  sbc $ed6c
$0f:e1a3  15 2c		 ora $2c,x
$0f:e1a5  a6 a6		 ldx $a6
$0f:e1a7  f9 e1 fd	  sbc $fde1,y
$0f:e1aa  c1 7f		 cmp ($7f,x)
$0f:e1ac  50 4f		 bvc $e1fd
$0f:e1ae  2c 63 cb	  bit $cb63
$0f:e1b1  19 fa c2	  ora $c2fa,y
$0f:e1b4  6e b8 8d	  ror $8db8
$0f:e1b7  d5 13		 cmp $13,x
$0f:e1b9  fc 85 0f	  jsr ($0f85,x)
$0f:e1bc  fd ff 7f	  sbc $7fff,x
$0f:e1bf  7f cc 7f 22   adc $227fcc,x
$0f:e1c3  7f 88 bd e3   adc $e3bd88,x
$0f:e1c7  2f 33 ef cc   and $ccef33
$0f:e1cb  bb			tyx
$0f:e1cc  cc 13 59	  cpy $5913
$0f:e1cf  89 95		 bit #$95
$0f:e1d1  3e 3f ff	  rol $ff3f,x
$0f:e1d4  cf 9f c7 1f   cmp $1fc79f
$0f:e1d8  c3 df		 cmp $df,s
$0f:e1da  e1 df		 sbc ($df,x)
$0f:e1dc  e9 c7		 sbc #$c7
$0f:e1de  e3 c1		 sbc $c1,s
$0f:e1e0  e0 80		 cpx #$80
$0f:e1e2  9e c7 c0	  stz $c0c7,x
$0f:e1e5  27 07		 and [$07]
$0f:e1e7  80 ab		 bra $e194
$0f:e1e9  42 0f		 wdm #$0f
$0f:e1eb  ff 8f ff ff   sbc $ffff8f,x
$0f:e1ef  c8			iny
$0f:e1f0  a1 f3		 lda ($f3,x)
$0f:e1f2  7f fc bf ef   adc $efbffc,x
$0f:e1f6  6f fa 9b 7f   adc $7f9bfa
$0f:e1fa  e5 7f		 sbc $7f
$0f:e1fc  fb			xce
$0f:e1fd  5f fc 87 ff   eor $ff87fc,x
$0f:e201  68			pla
$0f:e202  e8			inx
$0f:e203  5c 01 34 3f   jml $3f3401
$0f:e207  8a			txa
$0f:e208  71 fc		 adc ($fc),y
$0f:e20a  37 83		 and [$83],y
$0f:e20c  d7 58		 cmp [$58],y
$0f:e20e  eb			xba
$0f:e20f  de 2c ff	  dec $ff2c,x
$0f:e212  0e 7f 83	  asl $837f
$0f:e215  9b			txy
$0f:e216  e2 5a		 sep #$5a
$0f:e218  86 37		 stx $37
$0f:e21a  85 89		 sta $89
$0f:e21c  e3 5d		 sbc $5d,s
$0f:e21e  7e 56 5f	  ror $5f56,x
$0f:e221  34 36		 bit $36,x
$0f:e223  0d 1b 86	  ora $861b
$0f:e226  31 42		 and ($42),y
$0f:e228  2f 08 9b b2   and $b29b08
$0f:e22c  86 9d		 stx $9d
$0f:e22e  bf 67 86 9a   lda $9a8667,x
$0f:e232  be d3 2d	  ldx $2dd3,y
$0f:e235  3b			tsc
$0f:e236  60			rts
$0f:e237  66 7c		 ror $7c
$0f:e239  f4 f2 b8	  pea $b8f2
$0f:e23c  1f f5 bb ef   ora $efbbf5,x
$0f:e240  ef f7 dd eb   sbc $ebddf7
$0f:e244  5f 7e a9 ef   eor $efa97e,x
$0f:e248  b9 fb e1	  lda $e1fb,y
$0f:e24b  1d 79 b7	  ora $b779,x
$0f:e24e  e7 f7		 sbc [$f7]
$0f:e250  04 41		 tsb $41
$0f:e252  07 f9		 ora [$f9]
$0f:e254  0a			asl a
$0f:e255  04 e0		 tsb $e0
$0f:e257  03 0f		 ora $0f,s
$0f:e259  7e 40 82	  ror $8240,x
$0f:e25c  03 28		 ora $28,s
$0f:e25e  4f bf fd bf   eor $bffdbf
$0f:e262  3e 77 3d	  rol $3d77,x
$0f:e265  f1 f8		 sbc ($f8),y
$0f:e267  d7 b7		 cmp [$b7],y
$0f:e269  de df 9c	  dec $9cdf,x
$0f:e26c  7d 16 00	  adc $0016,x
$0f:e26f  63 cf		 adc $cf,s
$0f:e271  d8			cld
$0f:e272  3e 27 50	  rol $5027,x
$0f:e275  02 1f		 cop #$1f
$0f:e277  02 01		 cop #$01
$0f:e279  30 e0		 bmi $e25b
$0f:e27b  72 3e		 adc ($3e)
$0f:e27d  1b			tcs
$0f:e27e  4b			phk
$0f:e27f  c5 ab		 cmp $ab
$0f:e281  39 55 b7	  and $b755,y
$0f:e284  7a			ply
$0f:e285  fe d5 4e	  inc $4ed5,x
$0f:e288  c8			iny
$0f:e289  bc 3e 0a	  ldy $0a3e,x
$0f:e28c  b1 54		 lda ($54),y
$0f:e28e  02 98		 cop #$98
$0f:e290  2f f8 04 10   and $1004f8
$0f:e294  77 64		 adc [$64],y
$0f:e296  49 e4		 eor #$e4
$0f:e298  fe 40 df	  inc $df40,x
$0f:e29b  e1 f7		 sbc ($f7,x)
$0f:e29d  84 7b		 sty $7b
$0f:e29f  e2 02		 sep #$02
$0f:e2a1  50 80		 bvc $e223
$0f:e2a3  17 c6		 ora [$c6],y
$0f:e2a5  19 0c b9	  ora $b90c,y
$0f:e2a8  dc f0 98	  jml [$98f0]
$0f:e2ab  78			sei
$0f:e2ac  44 3f a1	  mvp $a1,$3f
$0f:e2af  df b0 5f db   cmp $db5fb0,x
$0f:e2b3  ed 7f c0	  sbc $c07f
$0f:e2b6  09 43		 ora #$43
$0f:e2b8  df 13 2c 81   cmp $812c13,x
$0f:e2bc  7c a8 14	  jmp ($14a8,x)
$0f:e2bf  08			php
$0f:e2c0  34 1b		 bit $1b,x
$0f:e2c2  31 98		 and ($98),y
$0f:e2c4  b3 f9		 lda ($f9,s),y
$0f:e2c6  e2 7f		 sep #$7f
$0f:e2c8  38			sec
$0f:e2c9  57 e8		 eor [$e8],y
$0f:e2cb  ea			nop
$0f:e2cc  08			php
$0f:e2cd  f7 25		 sbc [$25],y
$0f:e2cf  04 0f		 tsb $0f
$0f:e2d1  ff 70 2f 94   sbc $942f70,x
$0f:e2d5  62 30 5f	  per $4208
$0f:e2d8  0e 27 13	  asl $1327
$0f:e2db  f3 f9		 sbc ($f9,s),y
$0f:e2dd  df ef d5 20   cmp $20d5ef,x
$0f:e2e1  8f 78 32 5c   sta $5c3278
$0f:e2e5  cb			wai
$0f:e2e6  e4 30		 cpx $30
$0f:e2e8  01 88		 ora ($88,x)
$0f:e2ea  70 23		 bvs $e30f
$0f:e2ec  f1 fc		 sbc ($fc),y
$0f:e2ee  1e 0d 8a	  asl $8a0d,x
$0f:e2f1  0a			asl a
$0f:e2f2  d9 03 05	  cmp $0503,y
$0f:e2f5  05 2e		 ora $2e
$0f:e2f7  4b			phk
$0f:e2f8  e3 5f		 sbc $5f,s
$0f:e2fa  1f cf e7 04   ora $04e7cf,x
$0f:e2fe  82 78 7c	  brl $5f79
$0f:e301  28			plp
$0f:e302  f9 10 1b	  sbc $1b10,y
$0f:e305  fb			xce
$0f:e306  a4 51		 ldy $51
$0f:e308  39 a4 5e	  and $5ea4,y
$0f:e30b  6b			rtl
$0f:e30c  16 92		 asl $92,x
$0f:e30e  c1 a4		 cmp ($a4,x)
$0f:e310  50 59		 bvc $e36b
$0f:e312  1c 16 97	  trb $9716
$0f:e315  2d b5 cb	  and $cbb5
$0f:e318  66 70		 ror $70
$0f:e31a  c9 bc		 cmp #$bc
$0f:e31c  20 42 12	  jsr $1242
$0f:e31f  78			sei
$0f:e320  c0 94		 cpy #$94
$0f:e322  ad f1 01	  lda $01f1
$0f:e325  58			cli
$0f:e326  63 7a		 adc $7a,s
$0f:e328  3b			tsc
$0f:e329  5f ce 13 d3   eor $d313ce,x
$0f:e32d  20 a5 4e	  jsr $4ea5
$0f:e330  aa			tax
$0f:e331  52 8a		 eor ($8a)
$0f:e333  96 c3		 stx $c3,y
$0f:e335  8b			phb
$0f:e336  04 82		 tsb $82
$0f:e338  f7 a4		 sbc [$a4],y
$0f:e33a  1f e8 07 ba   ora $ba07e8,x
$0f:e33e  21 6d		 and ($6d,x)
$0f:e340  c8			iny
$0f:e341  5f 70 04 70   eor $700470,x
$0f:e345  fd c0 49	  sbc $49c0,x
$0f:e348  61 74		 adc ($74,x)
$0f:e34a  ce 5d 37	  dec $375d
$0f:e34d  97 cd		 sta [$cd],y
$0f:e34f  a7 f2		 lda [$f2]
$0f:e351  69 f8		 adc #$f8
$0f:e353  8e 5e b3	  stx $b35e
$0f:e356  d3 ee		 cmp ($ee,s),y
$0f:e358  d4 fb		 pei ($fb)
$0f:e35a  95 f3		 sta $f3,x
$0f:e35c  ff 97 d3 f7   sbc $f7d397,x
$0f:e360  ff 57 01 a4   sbc $a40157,x
$0f:e364  a0 66		 ldy #$66
$0f:e366  f1 83		 sbc ($83),y
$0f:e368  41 e1		 eor ($e1,x)
$0f:e36a  30 f8		 bmi $e364
$0f:e36c  bc 7e 51	  ldy $517e,x
$0f:e36f  3f 88 4f 2a   and $2a4f88,x
$0f:e373  17 8f		 ora [$8f],y
$0f:e375  e7 fc		 sbc [$fc]
$0f:e377  fe 1f 8f	  inc $8f1f,x
$0f:e37a  ff c3 fd e0   sbc $e0fdc3,x
$0f:e37e  fc 70 3e	  jsr ($3e70,x)
$0f:e381  1c 3f 06	  trb $063f
$0f:e384  1f c1 24 fe   ora $fe24c1,x
$0f:e388  c2 3f		 rep #$3f
$0f:e38a  73 0f		 adc ($0f,s),y
$0f:e38c  df 83 e7 c0   cmp $c0e783,x
$0f:e390  fb			xce
$0f:e391  70 3e		 bvs $e3d1
$0f:e393  b0 0f		 bcs $e3a4
$0f:e395  0c 02 c5	  tsb $c502
$0f:e398  02 fc		 cop #$fc
$0f:e39a  41 3e		 eor ($3e,x)
$0f:e39c  10 4e		 bpl $e3ec
$0f:e39e  04 32		 tsb $32
$0f:e3a0  01 09		 ora ($09,x)
$0f:e3a2  80 42		 bra $e3e6
$0f:e3a4  e0 31 f8	  cpx #$f831
$0f:e3a7  0e 7e 05	  asl $057e
$0f:e3aa  0b			phd
$0f:e3ab  ea			nop
$0f:e3ac  63 fa		 adc $fa,s
$0f:e3ae  11 fd		 ora ($fd),y
$0f:e3b0  04 e2		 tsb $e2
$0f:e3b2  8f 40 d9 60   sta $60d940
$0f:e3b6  e9 91 89	  sbc #$8991
$0f:e3b9  24 07		 bit $07
$0f:e3bb  85 37		 sta $37
$0f:e3bd  8c 4e 63	  sty $634e
$0f:e3c0  d7 69		 cmp [$69],y
$0f:e3c2  ff 7e ff ff   sbc $ffff7e,x
$0f:e3c6  f9 7f f9	  sbc $f97f,y
$0f:e3c9  ff f9 e7 fb   sbc $fbe7f9,x
$0f:e3cd  87 32		 sta [$32]
$0f:e3cf  e7 b3		 sbc [$b3]
$0f:e3d1  c3 63		 cmp $63,s
$0f:e3d3  4f fc c1 ef   eor $efc1fc
$0f:e3d7  18			clc
$0f:e3d8  7f e4 0e fd   adc $fd0ee4,x
$0f:e3dc  81 7e		 sta ($7e,x)
$0f:e3de  83 74		 sta $74,s
$0f:e3e0  af f8 0c ff   lda $ff0cf8
$0f:e3e4  83 df		 sta $df,s
$0f:e3e6  f0 e3		 beq $e3cb
$0f:e3e8  fe 37 7c	  inc $7c37,x
$0f:e3eb  4f ec 0b 13   eor $130bec
$0f:e3ef  ee e4 7a	  inc $7ae4
$0f:e3f2  6d 1f 8a	  adc $8a1f
$0f:e3f5  d7 7b		 cmp [$7b],y
$0f:e3f7  65 f3		 adc $f3
$0f:e3f9  ae 7f 22	  ldx $227f
$0f:e3fc  7f fc 35 ff   adc $ff35fc,x
$0f:e400  df 10 f4 c5   cmp $c5f410,x
$0f:e404  bf 10 7e f4   lda $f47e10,x
$0f:e408  87 e7		 sta [$e7]
$0f:e40a  0c 6c 83	  tsb $836c
$0f:e40d  7c b8 53	  jmp ($53b8,x)
$0f:e410  eb			xba
$0f:e411  e6 0f		 inc $0f
$0f:e413  0f f8 d4 ed   ora $edd4f8
$0f:e417  a7 5b		 lda [$5b]
$0f:e419  da			phx
$0f:e41a  6d fb 27	  adc $27fb
$0f:e41d  9e 9a fd	  stz $fd9a,x
$0f:e420  ff d0 16 f9   sbc $f916d0,x
$0f:e424  6f e8 02 50   adc $5002e8
$0f:e428  71 8d		 adc ($8d),y
$0f:e42a  83 ef		 sta $ef,s
$0f:e42c  08			php
$0f:e42d  f2 ea		 sbc ($ea)
$0f:e42f  f9 5e c9	  sbc $c95e,y
$0f:e432  96 53		 stx $53,y
$0f:e434  0b			phd
$0f:e435  53 ef		 eor ($ef,s),y
$0f:e437  42 ee		 wdm #$ee
$0f:e439  da			phx
$0f:e43a  ba			tsx
$0f:e43b  96 be		 stx $be,y
$0f:e43d  db			stp
$0f:e43e  96 7f		 stx $7f,y
$0f:e440  87 ba		 sta [$ba]
$0f:e442  23 b6		 and $b6,s
$0f:e444  a4 f5		 ldy $f5
$0f:e446  e5 1d		 sbc $1d
$0f:e448  f9 03 7c	  sbc $7c03,y
$0f:e44b  9c 24 49	  stz $4924
$0f:e44e  42 8b		 wdm #$8b
$0f:e450  14 37		 trb $37
$0f:e452  ff f9 83 07   sbc $0783f9,x
$0f:e456  d0 a2		 bne $e3fa
$0f:e458  c7 0d		 cmp [$0d]
$0f:e45a  ff ff e0 2e   sbc $2ee0ff,x
$0f:e45e  30 12		 bmi $e472
$0f:e460  87 3e		 sta [$3e]
$0f:e462  61 f1		 adc ($f1,x)
$0f:e464  87 07		 sta [$07]
$0f:e466  d3 8f		 cmp ($8f,s),y
$0f:e468  c7 dc		 cmp [$dc]
$0f:e46a  6e 2a dd	  ror $dd2a
$0f:e46d  69 8a 5d	  adc #$5d8a
$0f:e470  91 c0		 sta ($c0),y
$0f:e472  e0 08 63	  cpx #$6308
$0f:e475  7c 83 e1	  jmp ($e183,x)
$0f:e478  1d f1 78	  ora $78f1,x
$0f:e47b  e3 85		 sbc $85,s
$0f:e47d  d1 c0		 cmp ($c0),y
$0f:e47f  47 e3		 eor [$e3]
$0f:e481  f7 8b		 sbc [$8b],y
$0f:e483  c6 3f		 dec $3f
$0f:e485  1f 31 98 ae   ora $ae9831,x
$0f:e489  8f fe fa 0f   sta $0ffafe
$0f:e48d  dc 10 5a	  jml [$5a10]
$0f:e490  09 50 9f	  ora #$9f50
$0f:e493  f0 0f		 beq $e4a4
$0f:e495  64 7b		 stz $7b
$0f:e497  09 dc ef	  ora #$efdc
$0f:e49a  09 87 84	  ora #$8487
$0f:e49d  43 da		 eor $da,s
$0f:e49f  ce 7b 07	  dec $077b
$0f:e4a2  78			sei
$0f:e4a3  c0 60 10	  cpy #$1060
$0f:e4a6  28			plp
$0f:e4a7  04 12		 tsb $12
$0f:e4a9  02 f7		 cop #$f7
$0f:e4ab  08			php
$0f:e4ac  4c 0d f6	  jmp $f60d
$0f:e4af  0e f3 80	  asl $80f3
$0f:e4b2  c0 e0 50	  cpy #$50e0
$0f:e4b5  68			pla
$0f:e4b6  20 1c 21	  jsr $211c
$0f:e4b9  90 80		 bcc $e43b
$0f:e4bb  58			cli
$0f:e4bc  5a			phy
$0f:e4bd  25 7c		 and $7c
$0f:e4bf  08			php
$0f:e4c0  3c 62 7d	  bit $7d62,x
$0f:e4c3  34 fe		 bit $fe,x
$0f:e4c5  fe ff bf	  inc $bfff,x
$0f:e4c8  5f df 1f c7   eor $c71fdf,x
$0f:e4cc  89 e3 db	  bit #$dbe3
$0f:e4cf  e2 7f		 sep #$7f
$0f:e4d1  8e 07 06	  stx $0607
$0f:e4d4  00 fe		 brk #$fe
$0f:e4d6  07 f0		 ora [$f0]
$0f:e4d8  41 e0		 eor ($e0,x)
$0f:e4da  11 f8		 ora ($f8),y
$0f:e4dc  04 f2		 tsb $f2
$0f:e4de  07 14		 ora [$14]
$0f:e4e0  e2 d1		 sep #$d1
$0f:e4e2  26 b3		 rol $b3
$0f:e4e4  2f d7 cb f5   and $f5cbd7
$0f:e4e8  e1 fe		 sbc ($fe,x)
$0f:e4ea  f1 7f		 sbc ($7f),y
$0f:e4ec  34 be		 bit $be,x
$0f:e4ee  6c 8e 7b	  jmp ($7b8e)
$0f:e4f1  3b			tsc
$0f:e4f2  80 fe		 bra $e4f2
$0f:e4f4  e0 3f		 cpx #$3f
$0f:e4f6  d8			cld
$0f:e4f7  07 d6		 ora [$d6]
$0f:e4f9  11 e6		 ora ($e6),y
$0f:e4fb  8c 71 a7	  sty $a771
$0f:e4fe  13 2f		 ora ($2f,s),y
$0f:e500  e7 0b		 sbc [$0b]
$0f:e502  f9 9c b5	  sbc $b59c,y
$0f:e505  77 24		 adc [$24],y
$0f:e507  d6 dc		 dec $dc,x
$0f:e509  bc bb ab	  ldy $abbb,x
$0f:e50c  36 e5		 rol $e5,x
$0f:e50e  c5 fd		 cmp $fd
$0f:e510  51 fd		 eor ($fd),y
$0f:e512  14 6f		 trb $6f
$0f:e514  4d f9 ff	  eor $fff9
$0f:e517  ff 59 c0 62   sbc $62c059,x
$0f:e51b  1f f1 98 6f   ora $6f98f1,x
$0f:e51f  d3 f3		 cmp ($f3,s),y
$0f:e521  58			cli
$0f:e522  48			pha
$0f:e523  2f 1a 0f 95   and $950f1a
$0f:e527  00 e4		 brk #$e4
$0f:e529  1e 63 a8	  asl $a863,x
$0f:e52c  60			rts
$0f:e52d  0f 01 e2 80   ora $80e201
$0f:e531  78			sei
$0f:e532  30 fc		 bmi $e530
$0f:e534  08			php
$0f:e535  7f 0a 1f 82   adc $821f0a,x
$0f:e539  8f e1 90 a3   sta $a390e1
$0f:e53d  06 8f		 asl $8f
$0f:e53f  c0 85		 cpy #$85
$0f:e541  61 04		 adc ($04,x)
$0f:e543  f4 c2 3a	  pea $3ac2
$0f:e546  93 0e		 sta ($0e,s),y
$0f:e548  4d 02 4d	  eor $4d02
$0f:e54b  01 e5		 ora ($e5,x)
$0f:e54d  e0 aa		 cpx #$aa
$0f:e54f  f0 4d		 beq $e59e
$0f:e551  7c 23 7f	  jmp ($7f23,x)
$0f:e554  1f 86 cf e3   ora $e3cf86,x
$0f:e558  97 fb		 sta [$fb],y
$0f:e55a  cf fe cd fc   cmp $fccdfe
$0f:e55e  e4 7e		 cpx $7e
$0f:e560  3a			dec a
$0f:e561  1f 0d 07 83   ora $83070d,x
$0f:e565  41 0e		 eor ($0e,x)
$0f:e567  88			dey
$0f:e568  c8			iny
$0f:e569  ea			nop
$0f:e56a  f8			sed
$0f:e56b  d8			cld
$0f:e56c  1d 3b c3	  ora $c33b,x
$0f:e56f  93 f6		 sta ($f6,s),y
$0f:e571  47 79		 eor [$79]
$0f:e573  d3 ec		 cmp ($ec,s),y
$0f:e575  f9 ac 3f	  sbc $3fac,y
$0f:e578  91 ff		 sta ($ff),y
$0f:e57a  c5 df		 cmp $df
$0f:e57c  f9 83 8f	  sbc $8f83,y
$0f:e57f  40			rti
$0f:e580  45 61		 eor $61
$0f:e582  3f 80 5f e0   and $e05f80,x
$0f:e586  0e c0 bf	  asl $bfc0
$0f:e589  60			rts
$0f:e58a  71 ff		 adc ($ff),y
$0f:e58c  0f 87 ff cb   ora $cbff87
$0f:e590  ff 8d ff ef   sbc $efff8d,x
$0f:e594  9f fb 97 f6   sta $f697fb,x
$0f:e598  21 ef		 and ($ef,x)
$0f:e59a  67 84		 adc [$84]
$0f:e59c  3f e0 cc 17   and $17cce0,x
$0f:e5a0  21 c0		 and ($c0,x)
$0f:e5a2  d7 e1		 cmp [$e1],y
$0f:e5a4  e0 f8		 cpx #$f8
$0f:e5a6  c3 d9		 cmp $d9,s
$0f:e5a8  e1 4f		 sbc ($4f,x)
$0f:e5aa  d8			cld
$0f:e5ab  6e f8 94	  ror $94f8
$0f:e5ae  7f c6 32 e1   adc $e132c6,x
$0f:e5b2  30 e1		 bmi $e595
$0f:e5b4  f0 61		 beq $e617
$0f:e5b6  f7 fc		 sbc [$fc],y
$0f:e5b8  03 b4		 ora $b4,s
$0f:e5ba  28			plp
$0f:e5bb  fb			xce
$0f:e5bc  89 cf		 bit #$cf
$0f:e5be  1a			inc a
$0f:e5bf  3d e1 66	  and $66e1,x
$0f:e5c2  87 f2		 sta [$f2]
$0f:e5c4  00 e2		 brk #$e2
$0f:e5c6  08			php
$0f:e5c7  64 f6		 stz $f6
$0f:e5c9  13 ee		 ora ($ee,s),y
$0f:e5cb  e2 4f		 sep #$4f
$0f:e5cd  66 7c		 ror $7c
$0f:e5cf  de 4c da	  dec $da4c,x
$0f:e5d2  c9 1b		 cmp #$1b
$0f:e5d4  89 63		 bit #$63
$0f:e5d6  71 7e		 adc ($7e),y
$0f:e5d8  49 ef		 eor #$ef
$0f:e5da  0b			phd
$0f:e5db  df 10 fe c0   cmp $c0fe10,x
$0f:e5df  9c 88 cb	  stz $cb88
$0f:e5e2  04 68		 tsb $68
$0f:e5e4  69 7b		 adc #$7b
$0f:e5e6  d7 9e		 cmp [$9e],y
$0f:e5e8  77 46		 adc [$46],y
$0f:e5ea  dd bb b2	  cmp $b2bb,x
$0f:e5ed  5a			phy
$0f:e5ee  f6 9e		 inc $9e,x
$0f:e5f0  a9 a7		 lda #$a7
$0f:e5f2  7e c1 55	  ror $55c1,x
$0f:e5f5  f5 39		 sbc $39,x
$0f:e5f7  15 98		 ora $98,x
$0f:e5f9  3f e7 19 f0   and $f019e7,x
$0f:e5fd  e7 93		 sbc [$93]
$0f:e5ff  ce 1f 8e	  dec $8e1f
$0f:e602  38			sec
$0f:e603  ed 0f c4	  sbc $c40f
$0f:e606  1f 37 64 fa   ora $fa6437,x
$0f:e60a  42 ca		 wdm #$ca
$0f:e60c  61 3c		 adc ($3c,x)
$0f:e60e  ff f6 fb 75   sbc $75fbf6,x
$0f:e612  ca			dex
$0f:e613  ff 83 ff 07   sbc $07ff83,x
$0f:e617  ff d9 7c b0   sbc $b07cd9,x
$0f:e61b  bf dc 73 fe   lda $fe73dc,x
$0f:e61f  e4 2f		 cpx $2f
$0f:e621  5c 52 8d b9   jml $b98d52
$0f:e625  66 86		 ror $86
$0f:e627  52 d6		 eor ($d6)
$0f:e629  ff 06 68 38   sbc $386806,x
$0f:e62d  ca			dex
$0f:e62e  29 ff		 and #$ff
$0f:e630  dc fe 66	  jml [$66fe]
$0f:e633  73 33		 adc ($33,s),y
$0f:e635  d1 ff		 cmp ($ff),y
$0f:e637  fe d0 9c	  inc $9cd0,x
$0f:e63a  bd a3 f9	  lda $f9a3,x
$0f:e63d  03 b1		 ora $b1,s
$0f:e63f  e7 33		 sbc [$33]
$0f:e641  f6 0b		 inc $0b,x
$0f:e643  36 67		 rol $67,x
$0f:e645  4b			phk
$0f:e646  5a			phy
$0f:e647  2d 84 27	  and $2784
$0f:e64a  f3 68		 sbc ($68,s),y
$0f:e64c  f7 c0		 sbc [$c0],y
$0f:e64e  ff f9 cf fd   sbc $fdcff9,x
$0f:e652  82 ff 99	  brl $8054
$0f:e655  cf d6 bf 70   cmp $70bfd6
$0f:e659  bf fb fc 0a   lda $0afcfb,x
$0f:e65d  61 ac		 adc ($ac,x)
$0f:e65f  a9 b3		 lda #$b3
$0f:e661  c1 9a		 cmp ($9a,x)
$0f:e663  16 4c		 asl $4c,x
$0f:e665  da			phx
$0f:e666  3c 16 e0	  bit $e016,x
$0f:e669  7c 08 e7	  jmp ($e708,x)
$0f:e66c  fe a7 53	  inc $53a7,x
$0f:e66f  c0 b9		 cpy #$b9
$0f:e671  07 37		 ora [$37]
$0f:e673  ff 4f 83 a4   sbc $a4834f,x
$0f:e677  16 e0		 asl $e0,x
$0f:e679  93 05		 sta ($05,s),y
$0f:e67b  b8			clv
$0f:e67c  66 6c		 ror $6c
$0f:e67e  dc e9 8f	  jml [$8fe9]
$0f:e681  5e 51 7a	  lsr $7a51,x
$0f:e684  c2 9f		 rep #$9f
$0f:e686  49 a4		 eor #$a4
$0f:e688  3f fb 35 fa   and $fa35fb,x
$0f:e68c  63 f1		 adc $f1,s
$0f:e68e  94 4b		 sty $4b,x
$0f:e690  db			stp
$0f:e691  83 ff		 sta $ff,s
$0f:e693  88			dey
$0f:e694  c1 e4		 cmp ($e4,x)
$0f:e696  31 f9		 and ($f9),y
$0f:e698  0c 2e 83	  tsb $832e
$0f:e69b  3f a1 46 e0   and $e046a1,x
$0f:e69f  57 7c		 eor [$7c],y
$0f:e6a1  95 df		 sta $df,x
$0f:e6a3  2d 37 8e	  and $8e37
$0f:e6a6  45 26		 eor $26
$0f:e6a8  80 10		 bra $e6ba
$0f:e6aa  90 59		 bcc $e705
$0f:e6ac  00 a1		 brk #$a1
$0f:e6ae  40			rti
$0f:e6af  a4 50		 ldy $50
$0f:e6b1  39 1c 0e	  and $0e1c,y
$0f:e6b4  46 03		 lsr $03
$0f:e6b6  27 cf		 and [$cf]
$0f:e6b8  d5 77		 cmp $77,x
$0f:e6ba  a6 b9		 ldx $b9
$0f:e6bc  59 36 1e	  eor $1e36,y
$0f:e6bf  99 af b8	  sta $b8af,y
$0f:e6c2  cd eb 51	  cmp $51eb
$0f:e6c5  ec 9d 7e	  cpx $7e9d
$0f:e6c8  71 07		 adc ($07),y
$0f:e6ca  9c c1 ee	  stz $eec1
$0f:e6cd  50 fb		 bvc $e6ca
$0f:e6cf  04 7e		 tsb $7e
$0f:e6d1  d3 16		 cmp ($16,s),y
$0f:e6d3  f9 c3 3b	  sbc $3bc3,y
$0f:e6d6  52 56		 eor ($56)
$0f:e6d8  c8			iny
$0f:e6d9  1b			tcs
$0f:e6da  82 8f 7b	  brl $626c
$0f:e6dd  8f 7e ef 9f   sta $9fef7e
$0f:e6e1  7c a6 3e	  jmp ($3ea6,x)
$0f:e6e4  71 2e		 adc ($2e),y
$0f:e6e6  9c 4b ef	  stz $ef4b
$0f:e6e9  16 f6		 asl $f6,x
$0f:e6eb  80 63		 bra $e750
$0f:e6ed  3e 13 ce	  rol $ce13,x
$0f:e6f0  07 e2		 ora [$e2]
$0f:e6f2  01 90		 ora ($90,x)
$0f:e6f4  b0 4c		 bcs $e742
$0f:e6f6  78			sei
$0f:e6f7  13 0e		 ora ($0e,s),y
$0f:e6f9  05 c3		 ora $c3
$0f:e6fb  01 0f		 ora ($0f,x)
$0f:e6fd  d9 43 b6	  cmp $b643,y
$0f:e700  f0 de		 beq $e6e0
$0f:e702  bc 37 a3	  ldy $a337,x
$0f:e705  0b			phd
$0f:e706  f3 95		 sbc ($95,s),y
$0f:e708  c2 13		 rep #$13
$0f:e70a  67 84		 adc [$84]
$0f:e70c  55 6f		 eor $6f,x
$0f:e70e  f3 fb		 sbc ($fb,s),y
$0f:e710  f4 fa 7d	  pea $7dfa
$0f:e713  1e 9f 47	  asl $479f,x
$0f:e716  23 90		 and $90,s
$0f:e718  c3 38		 cmp $38,s
$0f:e71a  67 21		 adc [$21]
$0f:e71c  9b			txy
$0f:e71d  e8			inx
$0f:e71e  e4 02		 cpx $02
$0f:e720  c5 00		 cmp $00
$0f:e722  d9 40 36	  cmp $3640,y
$0f:e725  90 8f		 bcc $e6b6
$0f:e727  2c 43 97	  bit $9743
$0f:e72a  90 f3		 bcc $e71f
$0f:e72c  e9 39		 sbc #$39
$0f:e72e  f8			sed
$0f:e72f  8f f6 7e 05   sta $057ef6
$0f:e733  cf c1 73 f0   cmp $f073c1
$0f:e737  95 ea		 sta $ea,x
$0f:e739  65 f6		 adc $f6
$0f:e73b  b3 38		 lda ($38,s),y
$0f:e73d  98			tya
$0f:e73e  4c 24 12	  jmp $1224
$0f:e741  19 04 22	  ora $2204,y
$0f:e744  bd 11 ae	  lda $ae11,x
$0f:e747  48			pha
$0f:e748  f7 30		 sbc [$30],y
$0f:e74a  4f 9c 23 8d   eor $8d239c
$0f:e74e  08			php
$0f:e74f  cb			wai
$0f:e750  45 21		 eor $21
$0f:e752  d1 0e		 cmp ($0e),y
$0f:e754  17 86		 ora [$86],y
$0f:e756  81 e3		 sta ($e3,x)
$0f:e758  a0 71 f0	  ldy #$f071
$0f:e75b  18			clc
$0f:e75c  cc 1c f6	  cpy $f61c
$0f:e75f  07 7d		 ora [$7d]
$0f:e761  89 ff		 bit #$ff
$0f:e763  60			rts
$0f:e764  73 18		 adc ($18,s),y
$0f:e766  7f aa db 88   adc $88dbaa,x
$0f:e76a  cb			wai
$0f:e76b  eb			xba
$0f:e76c  3b			tsc
$0f:e76d  fe 6f 3e	  inc $3e6f,x
$0f:e770  2b			pld
$0f:e771  1f 14 9f d8   ora $d89f14,x
$0f:e775  6f f8 0f c7   adc $c70ff8
$0f:e779  ba			tsx
$0f:e77a  23 98		 and $98,s
$0f:e77c  b3 f8		 lda ($f8,s),y
$0f:e77e  23 f1		 and $f1,s
$0f:e780  8f fd c3 ff   sta $ffc3fd
$0f:e784  c0 ff e0	  cpy #$e0ff
$0f:e787  ff 90 8f bf   sbc $bf8f90,x
$0f:e78b  c6 fd		 dec $fd
$0f:e78d  8a			txa
$0f:e78e  c6 5d		 dec $5d
$0f:e790  3f 30 8f 99   and $998f30,x
$0f:e794  e4 22		 cpx $22
$0f:e796  3e fd 1f	  rol $1ffd,x
$0f:e799  3f 4f df ff   and $ffdf4f,x
$0f:e79d  c0 31 f7	  cpy #$f731
$0f:e7a0  0f f4 02 f9   ora $f902f4
$0f:e7a4  80 8c		 bra $e732
$0f:e7a6  78			sei
$0f:e7a7  09 a1		 ora #$a1
$0f:e7a9  f0 80		 beq $e72b
$0f:e7ab  78			sei
$0f:e7ac  20 10 79	  jsr $7910
$0f:e7af  fc 7f ff	  jsr ($ff7f,x)
$0f:e7b2  7f 17 87 ff   adc $ff8717,x
$0f:e7b6  fd ff fc	  sbc $fcff,x
$0f:e7b9  7f fc 1f c5   adc $c51ffc,x
$0f:e7bd  e8			inx
$0f:e7be  70 20		 bvs $e7e0
$0f:e7c0  00 08		 brk #$08
$0f:e7c2  81 bb		 sta ($bb,x)
$0f:e7c4  82 01 65	  brl $4cc8
$0f:e7c7  fd 79 7e	  sbc $7e79,x
$0f:e7ca  5c 3f a6 0f   jml $0fa63f
$0f:e7ce  c1 03		 cmp ($03,x)
$0f:e7d0  e0 40 e0	  cpx #$e040
$0f:e7d3  90 d8		 bcc $e7ad
$0f:e7d5  95 c3		 sta $c3,x
$0f:e7d7  1f 0f 84 43   ora $43840f,x
$0f:e7db  e0 82 10	  cpx #$1082
$0f:e7de  8f c0 a7 f0   sta $f0a7c0
$0f:e7e2  2f fc 1f fe   and $fe1ffc
$0f:e7e6  f1 0f		 sbc ($0f),y
$0f:e7e8  fe db 93	  inc $93db,x
$0f:e7eb  2d e8 5a	  and $5ae8
$0f:e7ee  32 94		 and ($94)
$0f:e7f0  ad a7 5a	  lda $5aa7
$0f:e7f3  51 96		 eor ($96),y
$0f:e7f5  b4 63		 ldy $63,x
$0f:e7f7  ae 1a aa	  ldx $aa1a
$0f:e7fa  a7 fe		 lda [$fe]
$0f:e7fc  01 fd		 ora ($fd,x)
$0f:e7fe  80 7f		 bra $e87f
$0f:e800  20 0e 30	  jsr $300e
$0f:e803  22 b0 fc 3f   jsl $3ffcb0
$0f:e807  d1 ff		 cmp ($ff),y
$0f:e809  05 ff		 ora $ff
$0f:e80b  9f 4f ff 0a   sta $0aff4f,x
$0f:e80f  00 9c		 brk #$9c
$0f:e811  23 f0		 and $f0,s
$0f:e813  81 c0		 sta ($c0,x)
$0f:e815  e6 13		 inc $13
$0f:e817  f8			sed
$0f:e818  05 fd		 ora $fd
$0f:e81a  f2 10		 sbc ($10)
$0f:e81c  70 68		 bvs $e886
$0f:e81e  00 0f		 brk #$0f
$0f:e820  ff b8 87 93   sbc $9387b8,x
$0f:e824  47 c0		 eor [$c0]
$0f:e826  f2 0b		 sbc ($0b)
$0f:e828  7f c2 20 59   adc $5920c2,x
$0f:e82c  2f e7 f2 02   and $02f2e7
$0f:e830  59 3f 87	  eor $873f,y
$0f:e833  fe 7e 62	  inc $627e,x
$0f:e836  03 61		 ora $61,s
$0f:e838  1c c6 3f	  trb $3fc6
$0f:e83b  fa			plx
$0f:e83c  bb			tyx
$0f:e83d  fd 33 f9	  sbc $f933,x
$0f:e840  0f fe 00 b2   ora $b200fe
$0f:e844  40			rti
$0f:e845  00 fc		 brk #$fc
$0f:e847  7e 05 41	  ror $4105,x
$0f:e84a  1e ff 28	  asl $28ff,x
$0f:e84d  43 80		 eor $80,s
$0f:e84f  ff 32 ca 16   sbc $16ca32,x
$0f:e853  53 f3		 eor ($f3,s),y
$0f:e855  09 ff		 ora #$ff
$0f:e857  c0 40 33	  cpy #$3340
$0f:e85a  03 8f		 ora $8f,s
$0f:e85c  c7 d9		 cmp [$d9]
$0f:e85e  20 af 78	  jsr $78af
$0f:e861  7a			ply
$0f:e862  1c 38 1f	  trb $1f38
$0f:e865  fc 76 3d	  jsr ($3d76,x)
$0f:e868  86 d1		 stx $d1
$0f:e86a  c8			iny
$0f:e86b  fb			xce
$0f:e86c  6c 09 c0	  jmp ($c009)
$0f:e86f  65 0d		 adc $0d
$0f:e871  25 df		 and $df
$0f:e873  49 6e		 eor #$6e
$0f:e875  c6 3c		 dec $3c
$0f:e877  82 fd 98	  brl $8177
$0f:e87a  af 44 3f 90   lda $903f44
$0f:e87e  09 a4		 ora #$a4
$0f:e880  22 fb 88 c0   jsl $c088fb
$0f:e884  64 40		 stz $40
$0f:e886  03 81		 ora $81,s
$0f:e888  c0 68 70	  cpy #$7068
$0f:e88b  18			clc
$0f:e88c  3c 07 2e	  bit $2e07,x
$0f:e88f  01 83		 ora ($83,x)
$0f:e891  80 fb		 bra $e88e
$0f:e893  af de ab f7   lda $f7abde
$0f:e897  1e cf dd	  asl $ddcf,x
$0f:e89a  bf e1 68 f8   lda $f868e1,x
$0f:e89e  8a			txa
$0f:e89f  5e 92 cf	  lsr $cf92,x
$0f:e8a2  a9 b7		 lda #$b7
$0f:e8a4  fd a1 3e	  sbc $3ea1,x
$0f:e8a7  28			plp
$0f:e8a8  ef ee 39 c1   sbc $c139ee
$0f:e8ac  9f 7e 67 db   sta $db677e,x
$0f:e8b0  4b			phk
$0f:e8b1  fe 66 fd	  inc $fd66,x
$0f:e8b4  d3 9e		 cmp ($9e,s),y
$0f:e8b6  55 2d		 eor $2d,x
$0f:e8b8  fd 4f 3e	  sbc $3e4f,x
$0f:e8bb  9b			txy
$0f:e8bc  9f c6 cf ec   sta $eccfc6,x
$0f:e8c0  27 fb		 and [$fb]
$0f:e8c2  09 de		 ora #$de
$0f:e8c4  02 6b		 cop #$6b
$0f:e8c6  c0 cd dc	  cpy #$dccd
$0f:e8c9  30 1f		 bmi $e8ea
$0f:e8cb  85 00		 sta $00
$0f:e8cd  42 3d		 wdm #$3d
$0f:e8cf  10 8e		 bpl $e85f
$0f:e8d1  24 13		 bit $13
$0f:e8d3  8d 02 e5	  sta $e502
$0f:e8d6  40			rti
$0f:e8d7  3c f0 38	  bit $38f0,x
$0f:e8da  9c 2e 4d	  stz $4d2e
$0f:e8dd  0f 8c 5f ea   ora $ea5f8c
$0f:e8e1  11 fb		 ora ($fb),y
$0f:e8e3  04 ff		 tsb $ff
$0f:e8e5  41 7a		 eor ($7a,x)
$0f:e8e7  e0 58 78	  cpx #$7858
$0f:e8ea  f0 8f		 beq $e87b
$0f:e8ec  e4 63		 cpx $63
$0f:e8ee  e1 20		 sbc ($20,x)
$0f:e8f0  f0 58		 beq $e94a
$0f:e8f2  3c 34 1e	  bit $1e34,x
$0f:e8f5  35 1b		 and $1b,x
$0f:e8f7  3b			tsc
$0f:e8f8  98			tya
$0f:e8f9  df e8 7f fc   cmp $fc7fe8,x
$0f:e8fd  88			dey
$0f:e8fe  c7 f6		 cmp [$f6]
$0f:e900  65 fb		 adc $fb
$0f:e902  a2 7f e0	  ldx #$e07f
$0f:e905  9f f8 46 be   sta $be46f8,x
$0f:e909  11 6e		 ora ($6e),y
$0f:e90b  f8			sed
$0f:e90c  41 b1		 eor ($b1,x)
$0f:e90e  9f 1a 15 02   sta $02151a,x
$0f:e912  89 40		 bit #$40
$0f:e914  c4 62		 cpy $62
$0f:e916  22 11 0b 84   jsl $840b11
$0f:e91a  83 e3		 sta $e3,s
$0f:e91c  60			rts
$0f:e91d  fc c0 37	  jsr ($37c0,x)
$0f:e920  f4 19 0f	  pea $0f19
$0f:e923  4e 69 97	  lsr $9769
$0f:e926  95 72		 sta $72,x
$0f:e928  eb			xba
$0f:e929  d3 f4		 cmp ($f4,s),y
$0f:e92b  a8			tay
$0f:e92c  5f b7 f6 6d   eor $6df6b7,x
$0f:e930  3e aa df	  rol $dfaa,x
$0f:e933  32 86		 and ($86)
$0f:e935  dd a1 36	  cmp $36a1,x
$0f:e938  aa			tax
$0f:e939  af fe 01 fe   lda $fe01fe
$0f:e93d  80 ff		 bra $e93e
$0f:e93f  b0 3e		 bcs $e97f
$0f:e941  4c df a2	  jmp $a2df
$0f:e944  2f 01 f0 ca   and $caf001
$0f:e948  fd 77 6f	  sbc $6f77,x
$0f:e94b  bf fb ff fd   lda $fdfffb,x
$0f:e94f  ff 6d 76 d4   sbc $d4766d,x
$0f:e953  5e 32 ec	  lsr $ec32,x
$0f:e956  24 3d		 bit $3d
$0f:e958  eb			xba
$0f:e959  5e 53 ef	  lsr $ef53,x
$0f:e95c  08			php
$0f:e95d  52 82		 eor ($82)
$0f:e95f  94 36		 sty $36,x
$0f:e961  f4 8e 3c	  pea $3c8e
$0f:e964  e1 96		 sbc ($96,x)
$0f:e966  14 bc		 trb $bc
$0f:e968  fd 0f 37	  sbc $370f,x
$0f:e96b  93 9b		 sta ($9b,s),y
$0f:e96d  e1 a6		 sbc ($a6,x)
$0f:e96f  f0 69		 beq $e9da
$0f:e971  7c 32 dd	  jmp ($dd32,x)
$0f:e974  0d af c2	  ora $c2af
$0f:e977  6b			rtl
$0f:e978  fe 08 07	  inc $0708,x
$0f:e97b  92 01		 sta ($01)
$0f:e97d  c8			iny
$0f:e97e  71 0f		 adc ($0f),y
$0f:e980  42 01		 wdm #$01
$0f:e982  91 80		 sta ($80),y
$0f:e984  68			pla
$0f:e985  1d 43 01	  ora $0143,x
$0f:e988  f9 40 3d	  sbc $3d40,y
$0f:e98b  ce 61 c1	  dec $c161
$0f:e98e  c6 67		 dec $67
$0f:e990  f6 3f		 inc $3f,x
$0f:e992  ff 83 f1 80   sbc $80f183,x
$0f:e996  f3 c3		 sbc ($c3,s),y
$0f:e998  e0 71 f8	  cpx #$f871
$0f:e99b  74 fe		 stz $fe,x
$0f:e99d  21 7c		 and ($7c,x)
$0f:e99f  80 70		 bra $ea11
$0f:e9a1  20 00 80	  jsr $8000
$0f:e9a4  83 c0		 sta $c0,s
$0f:e9a6  23 e0		 and $e0,s
$0f:e9a8  b0 f8		 bcs $e9a2
$0f:e9aa  c0 23 30	  cpy #$3023
$0f:e9ad  0b			phd
$0f:e9ae  e5 e3		 sbc $e3
$0f:e9b0  f9 fc ff	  sbc $fffc,y
$0f:e9b3  79 3f ca	  adc $ca3f,y
$0f:e9b6  60			rts
$0f:e9b7  80 4f		 bra $ea08
$0f:e9b9  ff ff 1f 3c   sbc $3c1fff,x
$0f:e9bd  07 07		 ora [$07]
$0f:e9bf  00 81		 brk #$81
$0f:e9c1  bb			tyx
$0f:e9c2  80 4c		 bra $ea10
$0f:e9c4  60			rts
$0f:e9c5  70 ed		 bvs $e9b4
$0f:e9c7  49 3a		 eor #$3a
$0f:e9c9  92 89		 sta ($89)
$0f:e9cb  a7 22		 lda [$22]
$0f:e9cd  d9 90 bc	  cmp $bc90,y
$0f:e9d0  60			rts
$0f:e9d1  27 14		 and [$14]
$0f:e9d3  01 c8		 ora ($c8,x)
$0f:e9d5  4c 28 01	  jmp $0128
$0f:e9d8  a0 fe 60	  ldy #$60fe
$0f:e9db  08			php
$0f:e9dc  23 c0		 and $c0,s
$0f:e9de  fc 11 82	  jsr ($8211,x)
$0f:e9e1  c0 49 0f	  cpy #$0f49
$0f:e9e4  85 81		 sta $81
$0f:e9e6  8a			txa
$0f:e9e7  5f f8 37 e0   eor $e037f8,x
$0f:e9eb  9e 65 73	  stz $7365,x
$0f:e9ee  04 0c		 tsb $0c
$0f:e9f0  7e 3f e0	  ror $e03f,x
$0f:e9f3  2b			pld
$0f:e9f4  39 3c f0	  and $f03c,y
$0f:e9f7  1f ff 84 3d   ora $3d84ff,x
$0f:e9fb  4e 05 a7	  lsr $a705
$0f:e9fe  e0 70 27	  cpx #$2770
$0f:ea01  9f c3 ca 9b   sta $9bcac3,x
$0f:ea05  90 a0		 bcc $e9a7
$0f:ea07  58			cli
$0f:ea08  1f fe ce 78   ora $78cefe,x
$0f:ea0c  5c 52 f9 70   jml $70f952
$0f:ea10  f8			sed
$0f:ea11  77 c4		 adc [$c4],y
$0f:ea13  55 47		 eor $47,x
$0f:ea15  bc 17 f5	  ldy $f517,x
$0f:ea18  68			pla
$0f:ea19  1e 42 0f	  asl $0f42,x
$0f:ea1c  fc 4f a5	  jsr ($a54f,x)
$0f:ea1f  fe fe 74	  inc $74fe,x
$0f:ea22  02 81		 cop #$81
$0f:ea24  40			rti
$0f:ea25  d1 d1		 cmp ($d1),y
$0f:ea27  c0 8f ff	  cpy #$ff8f
$0f:ea2a  3d fa 86	  and $86fa,x
$0f:ea2d  b8			clv
$0f:ea2e  27 d3		 and [$d3]
$0f:ea30  00 38		 brk #$38
$0f:ea32  0f c4 0b fd   ora $fd0bc4
$0f:ea36  7c fe 78	  jmp ($78fe,x)
$0f:ea39  3c 11 1a	  bit $1a11,x
$0f:ea3c  c4 06		 cpy $06
$0f:ea3e  75 41		 adc $41,x
$0f:ea40  f9 60 5e	  sbc $5e60,y
$0f:ea43  81 e6		 sta ($e6,x)
$0f:ea45  81 71		 sta ($71,x)
$0f:ea47  60			rts
$0f:ea48  51 58		 eor ($58),y
$0f:ea4a  14 f7		 trb $f7
$0f:ea4c  4f 00 e3 c0   eor $c0e300
$0f:ea50  a1 e0		 lda ($e0,x)
$0f:ea52  21 8f		 and ($8f,x)
$0f:ea54  c1 a7		 cmp ($a7,x)
$0f:ea56  f0 4f		 beq $eaa7
$0f:ea58  fc 53 bd	  jsr ($bd53,x)
$0f:ea5b  1d a1 73	  ora $73a1,x
$0f:ea5e  b0 99		 bcs $e9f9
$0f:ea60  c9 5c		 cmp #$5c
$0f:ea62  ee 9d 7f	  inc $7f9d
$0f:ea65  97 5f		 sta [$5f],y
$0f:ea67  fd a5 e0	  sbc $e0a5,x
$0f:ea6a  cf 4e 27 9f   cmp $9f274e
$0f:ea6e  69 ce		 adc #$ce
$0f:ea70  b2 e7		 lda ($e7)
$0f:ea72  0b			phd
$0f:ea73  fa			plx
$0f:ea74  57 f4		 eor [$f4],y
$0f:ea76  11 ef		 ora ($ef),y
$0f:ea78  0e 7a c3	  asl $c37a
$0f:ea7b  6d f9 f0	  adc $f0f9
$0f:ea7e  ff f3 fa 04   sbc $04faf3,x
$0f:ea82  67 f3		 adc [$f3]
$0f:ea84  42 f1		 wdm #$f1
$0f:ea86  f3 ff		 sbc ($ff,s),y
$0f:ea88  fe ef f6	  inc $f6ef,x
$0f:ea8b  3b			tsc
$0f:ea8c  3d 44 be	  and $be44,x
$0f:ea8f  4a			lsr a
$0f:ea90  a7 53		 lda [$53]
$0f:ea92  fe 06 e6	  inc $e606,x
$0f:ea95  8d 22 ee	  sta $ee22
$0f:ea98  89 c2		 bit #$c2
$0f:ea9a  3b			tsc
$0f:ea9b  e3 be		 sbc $be,s
$0f:ea9d  f8			sed
$0f:ea9e  f1 7f		 sbc ($7f),y
$0f:eaa0  7e 2f fe	  ror $fe2f,x
$0f:eaa3  f7 87		 sbc [$87],y
$0f:eaa5  cc fe 70	  cpy $70fe
$0f:eaa8  7e 38 f5	  ror $f538,x
$0f:eaab  fe b9 7e	  inc $7eb9,x
$0f:eaae  a4 5f		 ldy $5f
$0f:eab0  3c df ef	  bit $efdf,x
$0f:eab3  0f fd 8c 17   ora $178cfd
$0f:eab7  9c 35 8f	  stz $8f35
$0f:eaba  39 bf e0	  and $e0bf,y
$0f:eabd  6f f8 39 ff   adc $ff39f8
$0f:eac1  1c 47 df	  trb $df47
$0f:eac4  0c f9 d6	  tsb $d6f9
$0f:eac7  ff 9c 8f fd   sbc $fd8f9c,x
$0f:eacb  86 fd		 stx $fd
$0f:eacd  a1 df		 lda ($df,x)
$0f:eacf  42 21		 wdm #$21
$0f:ead1  f2 89		 sbc ($89)
$0f:ead3  5d 72 bf	  eor $bf72,x
$0f:ead6  f0 ff		 beq $ead7
$0f:ead8  ef e8 11 ff   sbc $ff11e8
$0f:eadc  06 3f		 asl $3f
$0f:eade  e1 47		 sbc ($47,x)
$0f:eae0  fc 7c 7f	  jsr ($7f7c,x)
$0f:eae3  dd 4f fe	  cmp $fe4f,x
$0f:eae6  87 fd		 sta [$fd]
$0f:eae8  03 fe		 ora $fe,s
$0f:eaea  61 e9		 adc ($e9,x)
$0f:eaec  fd 1a cd	  sbc $cd1a,x
$0f:eaef  83 e1		 sta $e1,s
$0f:eaf1  59 fc d0	  eor $d0fc,y
$0f:eaf4  f8			sed
$0f:eaf5  70 4f		 bvs $eb46
$0f:eaf7  e4 c7		 cpx $c7
$0f:eaf9  ff 65 f2 f2   sbc $f2f265,x
$0f:eafd  26 fd		 rol $fd
$0f:eaff  69 7f		 adc #$7f
$0f:eb01  be 3f c6	  ldx $c63f,y
$0f:eb04  9f cf 3f f8   sta $f83fcf,x
$0f:eb08  3b			tsc
$0f:eb09  ff 02 7f da   sbc $da7f02,x
$0f:eb0d  9f ca bd 8a   sta $8abdca,x
$0f:eb11  f0 cd		 beq $eae0
$0f:eb13  7f 3b 5f ce   adc $ce5f3b,x
$0f:eb17  57 f2		 eor [$f2],y
$0f:eb19  df 78 e3 fe   cmp $fee378,x
$0f:eb1d  32 bf		 and ($bf)
$0f:eb1f  ab			plb
$0f:eb20  7e 41 7e	  ror $7e41,x
$0f:eb23  03 f0		 ora $f0,s
$0f:eb25  1f 82 04 0d   ora $0d0482,x
$0f:eb29  21 0f		 and ($0f,x)
$0f:eb2b  f9 cf f8	  sbc $f8cf,y
$0f:eb2e  71 38		 adc ($38),y
$0f:eb30  dd 4a 6f	  cmp $6f4a,x
$0f:eb33  80 9b		 bra $ead0
$0f:eb35  60			rts
$0f:eb36  25 b8		 and $b8
$0f:eb38  09 56		 ora #$56
$0f:eb3a  02 a3		 cop #$a3
$0f:eb3c  80 a3		 bra $eae1
$0f:eb3e  c0 21 fe	  cpy #$fe21
$0f:eb41  48			pha
$0f:eb42  07 22		 ora [$22]
$0f:eb44  81 c9		 sta ($c9,x)
$0f:eb46  c0 74 f0	  cpy #$f074
$0f:eb49  3d 7c 16	  and $167c,x
$0f:eb4c  bb			tyx
$0f:eb4d  01 b8		 ora ($b8,x)
$0f:eb4f  c0 7c 20	  cpy #$207c
$0f:eb52  10 0c		 bpl $eb60
$0f:eb54  84 02		 sty $02
$0f:eb56  dd 00 e3	  cmp $e300,x
$0f:eb59  c0 23 f0	  cpy #$f023
$0f:eb5c  1b			tcs
$0f:eb5d  fc 2b ff	  jsr ($ff2b,x)
$0f:eb60  b7 2f		 lda [$2f],y
$0f:eb62  01 78		 ora ($78,x)
$0f:eb64  22 1f 1b 07   jsl $071b1f
$0f:eb68  e3 81		 sbc $81,s
$0f:eb6a  e0 80 60	  cpx #$6080
$0f:eb6d  1d c0 08	  ora $08c0,x
$0f:eb70  4d fc 12	  eor $12fc
$0f:eb73  3f 04 cf c2   and $c2cf04,x
$0f:eb77  37 d5		 and [$d5],y
$0f:eb79  8f f7 c3 f8   sta $f8c3f7
$0f:eb7d  19 0e 07	  ora $070e,y
$0f:eb80  ef 81 80 02   sbc $028081
$0f:eb84  85 82		 sta $82
$0f:eb86  01 41		 ora ($41,x)
$0f:eb88  80 40		 bra $ebca
$0f:eb8a  60			rts
$0f:eb8b  10 31		 bpl $ebbe
$0f:eb8d  40			rti
$0f:eb8e  c1 e0		 cmp ($e0,x)
$0f:eb90  71 09		 adc ($09),y
$0f:eb92  00 bd		 brk #$bd
$0f:eb94  6c 13 0a	  jmp ($0a13)
$0f:eb97  04 43		 tsb $43
$0f:eb99  c1 10		 cmp ($10,x)
$0f:eb9b  e0 7c 26	  cpx #$267c
$0f:eb9e  03 f5		 ora $f5,s
$0f:eba0  b8			clv
$0f:eba1  11 c4		 ora ($c4),y
$0f:eba3  96 1d		 stx $1d,y
$0f:eba5  03 e8		 ora $e8,s
$0f:eba7  78			sei
$0f:eba8  3f f3 f9 ff   and $fff9f3,x
$0f:ebac  f2 19		 sbc ($19)
$0f:ebae  ff 80 15 d3   sbc $d31580,x
$0f:ebb2  80 57		 bra $ec0b
$0f:ebb4  13 e8		 ora ($e8,s),y
$0f:ebb6  19 02 0f	  ora $0f02,y
$0f:ebb9  07 04		 ora [$04]
$0f:ebbb  29 98		 and #$98
$0f:ebbd  3f ff cf e4   and $e4cfff,x
$0f:ebc1  be 50 57	  ldx $5750,y
$0f:ebc4  62 c1 1c	  per $0888
$0f:ebc7  40			rti
$0f:ebc8  c8			iny
$0f:ebc9  1f 07 68 9a   ora $9a6807,x
$0f:ebcd  d3 00		 cmp ($00,s),y
$0f:ebcf  50 1e		 bvc $ebef
$0f:ebd1  e5 7f		 sbc $7f
$0f:ebd3  f9 04 ff	  sbc $ff04,y
$0f:ebd6  9e 9d 22	  stz $229d,x
$0f:ebd9  04 f0		 tsb $f0
$0f:ebdb  8f c7 cc ea   sta $eaccc7
$0f:ebdf  99 18 0f	  sta $0f18,y
$0f:ebe2  fe 73 f9	  inc $f973,x
$0f:ebe5  cf e4 13 30   cmp $3013e4
$0f:ebe9  58			cli
$0f:ebea  08			php
$0f:ebeb  79 c8 7c	  adc $7cc8,y
$0f:ebee  00 50		 brk #$50
$0f:ebf0  04 0c		 tsb $0c
$0f:ebf2  ff e1 0f ff   sbc $ff0fe1,x
$0f:ebf6  77 fb		 adc [$fb],y
$0f:ebf8  09 01		 ora #$01
$0f:ebfa  2c 2c 33	  bit $332c
$0f:ebfd  f8			sed
$0f:ebfe  b3 0b		 lda ($0b,s),y
$0f:ec00  e3 21		 sbc $21,s
$0f:ec02  5d 44 00	  eor $0044,x
$0f:ec05  20 8c 46	  jsr $468c
$0f:ec08  24 92		 bit $92
$0f:ec0a  4a			lsr a
$0f:ec0b  13 cc		 ora ($cc,s),y
$0f:ec0d  6b			rtl
$0f:ec0e  57 e9		 eor [$e9],y
$0f:ec10  25 6a		 and $6a
$0f:ec12  49 66		 eor #$66
$0f:ec14  79 84 02	  adc $0284,y
$0f:ec17  01 18		 ora ($18,x)
$0f:ec19  80 4f		 bra $ec6a
$0f:ec1b  00 42		 brk #$42
$0f:ec1d  ff 09 20 00   sbc $002009,x
$0f:ec21  dd ec f5	  cmp $f5ec,x
$0f:ec24  5f 3b fd 80   eor $80fd3b,x
$0f:ec28  ac 11 69	  ldy $6911
$0f:ec2b  e5 fa		 sbc $fa
$0f:ec2d  01 e7		 ora ($e7,x)
$0f:ec2f  7d 83 dc	  adc $dc83,x
$0f:ec32  04 30		 tsb $30
$0f:ec34  01 0c		 ora ($0c,x)
$0f:ec36  cc 03 02	  cpy $0203
$0f:ec39  0e 98 c5	  asl $c598
$0f:ec3c  6a			ror a
$0f:ec3d  01 66		 ora ($66,x)
$0f:ec3f  7c 80 7e	  jmp ($7e80,x)
$0f:ec42  05 66		 ora $66
$0f:ec44  08			php
$0f:ec45  09 e3		 ora #$e3
$0f:ec47  f0 01		 beq $ec4a
$0f:ec49  20 ff 0b	  jsr $0bff
$0f:ec4c  35 9a		 and $9a,x
$0f:ec4e  00 fe		 brk #$fe
$0f:ec50  07 98		 ora [$98]
$0f:ec52  7f df e0 03   adc $03e0df,x
$0f:ec56  01 c0		 ora ($c0,x)
$0f:ec58  0e 00 02	  asl $0200
$0f:ec5b  e7 05		 sbc [$05]
$0f:ec5d  a1 3e		 lda ($3e,x)
$0f:ec5f  01 f8		 ora ($f8,x)
$0f:ec61  2f d2 40 a3   and $a340d2
$0f:ec65  fe 11 a4	  inc $a411,x
$0f:ec68  97 67		 sta [$67],y
$0f:ec6a  e9 2f		 sbc #$2f
$0f:ec6c  d0 43		 bne $ecb1
$0f:ec6e  27 04		 and [$04]
$0f:ec70  9e 26 58	  stz $5826,x
$0f:ec73  fe 8f e0	  inc $e08f,x
$0f:ec76  54 c2 9c	  mvn $9c,$c2
$0f:ec79  20 90 09	  jsr $0990
$0f:ec7c  c4 c2		 cpy $c2
$0f:ec7e  85 46		 sta $46
$0f:ec80  88			dey
$0f:ec81  e3 6e		 sbc $6e,s
$0f:ec83  3e 17 7b	  rol $7b17,x
$0f:ec86  43 10		 eor $10,s
$0f:ec88  07 9e		 ora [$9e]
$0f:ec8a  90 2f		 bcc $ecbb
$0f:ec8c  d2 15		 cmp ($15)
$0f:ec8e  0a			asl a
$0f:ec8f  88			dey
$0f:ec90  c4 62		 cpy $62
$0f:ec92  11 08		 ora ($08),y
$0f:ec94  54 12 83	  mvn $83,$12
$0f:ec97  6e 77 b4	  ror $b477
$0f:ec9a  3a			dec a
$0f:ec9b  01 0f		 ora ($0f,x)
$0f:ec9d  80 47		 bra $ece6
$0f:ec9f  e0 19 f7	  cpx #$f719
$0f:eca2  77 78		 adc [$78],y
$0f:eca4  1f f9 9f 90   ora $909ff9,x
$0f:eca8  46 a3		 lsr $a3
$0f:ecaa  52 19		 eor ($19)
$0f:ecac  0a			asl a
$0f:ecad  9c 2a 54	  stz $542a
$0f:ecb0  ca			dex
$0f:ecb1  4d 4e 81	  eor $814e
$0f:ecb4  50 c0		 bvc $ec76
$0f:ecb6  74 34		 stz $34,x
$0f:ecb8  12 c7		 ora ($c7)
$0f:ecba  a8			tay
$0f:ecbb  47 a0		 eor [$a0]
$0f:ecbd  13 f3		 ora ($f3,s),y
$0f:ecbf  10 ce		 bpl $ec8f
$0f:ecc1  a0 13 03	  ldy #$0313
$0f:ecc4  40			rti
$0f:ecc5  f6 17		 inc $17,x
$0f:ecc7  ec f0 59	  cpx $59f0
$0f:ecca  d4 cc		 pei ($cc)
$0f:eccc  df 80 70 27   cmp $277080,x
$0f:ecd0  d4 02		 pei ($02)
$0f:ecd2  a1 a8		 lda ($a8,x)
$0f:ecd4  d0 17		 bne $eced
$0f:ecd6  f2 b0		 sbc ($b0)
$0f:ecd8  72 a9		 adc ($a9)
$0f:ecda  95 06		 sta $06,x
$0f:ecdc  8b			phb
$0f:ecdd  11 c6		 ora ($c6),y
$0f:ecdf  20 ea 7d	  jsr $7dea
$0f:ece2  00 bf		 brk #$bf
$0f:ece4  a3 ac		 lda $ac,s
$0f:ece6  b6 1b		 ldx $1b,y
$0f:ece8  09 41		 ora #$41
$0f:ecea  7f a4 98 1d   adc $1d98a4,x
$0f:ecee  2f 9f 7b e7   and $e77b9f
$0f:ecf2  e1 ef		 sbc ($ef,x)
$0f:ecf4  6f dc 39 e5   adc $e539dc
$0f:ecf8  08			php
$0f:ecf9  96 04		 stx $04,y
$0f:ecfb  92 ad		 sta ($ad)
$0f:ecfd  49 00		 eor #$00
$0f:ecff  21 24		 and ($24,x)
$0f:ed01  3c 0e 04	  bit $040e,x
$0f:ed04  ec 74 2e	  cpx $2e74
$0f:ed07  1e 97 03	  asl $0397,x
$0f:ed0a  24 79		 bit $79
$0f:ed0c  05 9b		 ora $9b
$0f:ed0e  03 7e		 ora $7e,s
$0f:ed10  cc d9 af	  cpy $afd9
$0f:ed13  d2 42		 cmp ($42)
$0f:ed15  48			pha
$0f:ed16  3f 68 ec 5a   and $5aec68,x
$0f:ed1a  5e d8 4c	  lsr $4cd8,x
$0f:ed1d  38			sec
$0f:ed1e  74 2d		 stz $2d,x
$0f:ed20  28			plp
$0f:ed21  b8			clv
$0f:ed22  2c c1 50	  bit $50c1
$0f:ed25  a1 4f		 lda ($4f,x)
$0f:ed27  03 e0		 ora $e0,s
$0f:ed29  05 08		 ora $08
$0f:ed2b  c0 7a c2	  cpy #$c27a
$0f:ed2e  60			rts
$0f:ed2f  0f 07 78 04   ora $047807
$0f:ed33  c4 a0		 cpy $a0
$0f:ed35  13 c7		 ora ($c7,s),y
$0f:ed37  d9 10 60	  cmp $6010,y
$0f:ed3a  6a			ror a
$0f:ed3b  02 b3		 cop #$b3
$0f:ed3d  28			plp
$0f:ed3e  01 c4		 ora ($c4,x)
$0f:ed40  78			sei
$0f:ed41  7c 30 78	  jmp ($7830,x)
$0f:ed44  79 e4 85	  adc $85e4,y
$0f:ed47  b4 de		 ldy $de,x
$0f:ed49  a0 04 3a	  ldy #$3a04
$0f:ed4c  44 10 05	  mvp $05,$10
$0f:ed4f  99 cc 41	  sta $41cc,y
$0f:ed52  e2 f4		 sep #$f4
$0f:ed54  0f fc 93 7b   ora $7b93fc
$0f:ed58  99 3d 00	  sta $003d,y
$0f:ed5b  ec 10 8f	  cpx $8f10
$0f:ed5e  42 54		 wdm #$54
$0f:ed60  08			php
$0f:ed61  34 92		 bit $92,x
$0f:ed63  64 1e		 stz $1e
$0f:ed65  0d 2e f7	  ora $f72e
$0f:ed68  b6 1a		 ldx $1a,y
$0f:ed6a  04 21		 tsb $21
$0f:ed6c  97 4b		 sta [$4b],y
$0f:ed6e  86 aa		 stx $aa
$0f:ed70  36 41		 rol $41,x
$0f:ed72  1d 04 ec	  ora $ec04,x
$0f:ed75  14 29		 trb $29
$0f:ed77  20 58 13	  jsr $1358
$0f:ed7a  40			rti
$0f:ed7b  ba			tsx
$0f:ed7c  74 08		 stz $08,x
$0f:ed7e  66 58		 ror $58
$0f:ed80  cf 24 fc 43   cmp $43fc24
$0f:ed84  2e 91 18	  rol $1891
$0f:ed87  4c c6 17	  jmp $17c6
$0f:ed8a  32 82		 and ($82)
$0f:ed8c  c7 85		 cmp [$85]
$0f:ed8e  07 df		 ora [$df]
$0f:ed90  90 5e		 bcc $edf0
$0f:ed92  e0 10		 cpx #$10
$0f:ed94  68			pla
$0f:ed95  04 12		 tsb $12
$0f:ed97  01 08		 ora ($08,x)
$0f:ed99  80 40		 bra $eddb
$0f:ed9b  45 07		 eor $07
$0f:ed9d  01 95		 ora ($95,x)
$0f:ed9f  fc 25 18	  jsr ($1825,x)
$0f:eda2  88			dey
$0f:eda3  84 72		 sty $72
$0f:eda5  01 bc		 ora ($bc,x)
$0f:eda7  d0 4e		 bne $edf7
$0f:eda9  28			plp
$0f:edaa  08			php
$0f:edab  b2 ed		 lda ($ed)
$0f:edad  40			rti
$0f:edae  3b			tsc
$0f:edaf  10 0f		 bpl $edc0
$0f:edb1  84 03		 sty $03
$0f:edb3  c1 00		 cmp ($00,x)
$0f:edb5  0d 06 01	  ora $0106
$0f:edb8  f4 72 6f	  pea $6f72
$0f:edbb  d4 2a		 pei ($2a)
$0f:edbd  ed 3d 82	  sbc $823d
$0f:edc0  df 61 d7 f8   cmp $f8d761,x
$0f:edc4  04 fd		 tsb $fd
$0f:edc6  f4 7d d9	  pea $d97d
$0f:edc9  05 e6		 ora $e6
$0f:edcb  01 02		 ora ($02,x)
$0f:edcd  7d 19 11	  adc $1119,x
$0f:edd0  22 91 6d 16   jsl $166d91
$0f:edd4  8a			txa
$0f:edd5  c1 e1		 cmp ($e1,x)
$0f:edd7  ea			nop
$0f:edd8  cd 3c 51	  cmp $513c
$0f:eddb  ef e1 0c fd   sbc $fd0ce1
$0f:eddf  10 0a		 bpl $edeb
$0f:ede1  e4 01		 cpx $01
$0f:ede3  f2 10		 sbc ($10)
$0f:ede5  a0 40		 ldy #$40
$0f:ede7  82 52 83	  brl $713c
$0f:edea  45 88		 eor $88
$0f:edec  e3 2e		 sbc $2e,s
$0f:edee  1e 01 79	  asl $7901,x
$0f:edf1  4f 20 b1 92   eor $92b120
$0f:edf5  18			clc
$0f:edf6  cf a0 03 70   cmp $7003a0
$0f:edfa  cf c8 07 e8   cmp $e807c8
$0f:edfe  05 05		 ora $05
$0f:ee00  30 60		 bmi $ee62
$0f:ee02  20 92 01	  jsr $0192
$0f:ee05  30 52		 bmi $ee59
$0f:ee07  25 17		 and $17
$0f:ee09  89 97		 bit #$97
$0f:ee0b  13 fd		 ora ($fd,s),y
$0f:ee0d  00 fe		 brk #$fe
$0f:ee0f  33 07		 and ($07,s),y
$0f:ee11  f0 9a		 beq $edad
$0f:ee13  1d a4 03	  ora $03a4,x
$0f:ee16  08			php
$0f:ee17  06 12		 asl $12
$0f:ee19  22 1c ce ef   jsl $efce1c
$0f:ee1d  3c 81 8e	  bit $8e81,x
$0f:ee20  42 3e		 wdm #$3e
$0f:ee22  fa			plx
$0f:ee23  34 19		 bit $19,x
$0f:ee25  5e 08 93	  lsr $9308,x
$0f:ee28  08			php
$0f:ee29  84 5e		 sty $5e
$0f:ee2b  29 1e		 and #$1e
$0f:ee2d  4c 06 33	  jmp $3306
$0f:ee30  11 2c		 ora ($2c),y
$0f:ee32  f0 4e		 beq $ee82
$0f:ee34  12 20		 ora ($20)
$0f:ee36  6c 11 18	  jmp ($1811)
$0f:ee39  6c 20 0c	  jmp ($0c20)
$0f:ee3c  30 b8		 bmi $edf6
$0f:ee3e  40			rti
$0f:ee3f  22 10 0e 01   jsl $010e10
$0f:ee43  11 60		 ora ($60),y
$0f:ee45  d0 18		 bne $ee5f
$0f:ee47  64 0e		 stz $0e
$0f:ee49  1d 01 8f	  ora $8f01,x
$0f:ee4c  c4 27		 cpy $27
$0f:ee4e  f1 08		 sbc ($08),y
$0f:ee50  bc 42 e7	  ldy $e742,x
$0f:ee53  30 83		 bmi $edd8
$0f:ee55  c1 e1		 cmp ($e1,x)
$0f:ee57  f0 f8		 beq $ee51
$0f:ee59  74 3e		 stz $3e,x
$0f:ee5b  3f 1f 02 04   and $04021f,x
$0f:ee5f  b6 7b		 ldx $7b,y
$0f:ee61  6d 9e 73	  adc $739e
$0f:ee64  e3 06		 sbc $06,s
$0f:ee66  c0 74		 cpy #$74
$0f:ee68  85 83		 sta $83
$0f:ee6a  01 e0		 ora ($e0,x)
$0f:ee6c  6f 04 43 f1   adc $f14304
$0f:ee70  10 e8		 bpl $ee5a
$0f:ee72  44 33 91	  mvp $91,$33
$0f:ee75  8e 07 03	  stx $0307
$0f:ee78  c0 21		 cpy #$21
$0f:ee7a  1f 87 c0 48   ora $48c087,x
$0f:ee7e  16 8b		 asl $8b,x
$0f:ee80  c5 b2		 cmp $b2
$0f:ee82  f1 e6		 sbc ($e6),y
$0f:ee84  98			tya
$0f:ee85  3b			tsc
$0f:ee86  61 f2		 adc ($f2,x)
$0f:ee88  15 f8		 ora $f8,x
$0f:ee8a  84 dc		 sty $dc
$0f:ee8c  5c 2f f6 b7   jml $b7f62f
$0f:ee90  cf fd b3 de   cmp $deb3fd
$0f:ee94  6c 70 d6	  jmp ($d670)
$0f:ee97  41 16		 eor ($16,x)
$0f:ee99  0b			phd
$0f:ee9a  87 61		 sta [$61]
$0f:ee9c  ce 01 00	  dec $0001
$0f:ee9f  10 3d		 bpl $eede
$0f:eea1  82 e0 29	  brl $1884
$0f:eea4  07 7b		 ora [$7b]
$0f:eea6  43 e0		 eor $e0,s
$0f:eea8  0f b0 89 c0   ora $c089b0
$0f:eeac  2f e4 07 02   and $0207e4
$0f:eeb0  95 fe		 sta $fe,x
$0f:eeb2  7f ff 5b 84   adc $845bff,x
$0f:eeb6  00 22		 brk #$22
$0f:eeb8  81 50		 sta ($50,x)
$0f:eeba  0d 86 42	  ora $4286
$0f:eebd  01 fc		 ora ($fc,x)
$0f:eebf  48			pha
$0f:eec0  00 81		 brk #$81
$0f:eec2  44 a5 fc	  mvp $fc,$a5
$0f:eec5  fc 7f bf	  jsr ($bf7f,x)
$0f:eec8  0e da cb	  asl $cbda
$0f:eecb  e0 2e		 cpx #$2e
$0f:eecd  63 01		 adc $01,s
$0f:eecf  7f c2 2d 11   adc $112dc2,x
$0f:eed3  f8			sed
$0f:eed4  5f 81 29 7e   eor $7e2981,x
$0f:eed8  15 ce		 ora $ce,x
$0f:eeda  73 03		 adc ($03,s),y
$0f:eedc  e8			inx
$0f:eedd  23 82		 and $82,s
$0f:eedf  36 be		 rol $be,x
$0f:eee1  58			cli
$0f:eee2  f2 14		 sbc ($14)
$0f:eee4  66 f1		 ror $f1
$0f:eee6  7b			tdc
$0f:eee7  bc 1e 7f	  ldy $7f1e,x
$0f:eeea  03 17		 ora $17,s
$0f:eeec  96 02		 stx $02,y
$0f:eeee  01 40		 ora ($40,x)
$0f:eef0  c0 14		 cpy #$14
$0f:eef2  c0 a6		 cpy #$a6
$0f:eef4  01 30		 ora ($30,x)
$0f:eef6  b8			clv
$0f:eef7  04 08		 tsb $08
$0f:eef9  2c 0a 03	  bit $030a
$0f:eefc  32 93		 and ($93)
$0f:eefe  b5 1e		 lda $1e,x
$0f:ef00  34 af		 bit $af,x
$0f:ef02  20 0d 0b	  jsr $0b0d
$0f:ef05  d0 27		 bne $ef2e
$0f:ef07  00 f3		 brk #$f3
$0f:ef09  11 48		 ora ($48),y
$0f:ef0b  bf c8 1e 51   lda $511ec8,x
$0f:ef0f  f1 05		 sbc ($05),y
$0f:ef11  c0 a0		 cpy #$a0
$0f:ef13  6a			ror a
$0f:ef14  f0 82		 beq $ee98
$0f:ef16  41 e1		 eor ($e1,x)
$0f:ef18  d1 38		 cmp ($38),y
$0f:ef1a  1c 16 29	  trb $2916
$0f:ef1d  19 80 c7	  ora $c780,y
$0f:ef20  62 b0 93	  per $82d3
$0f:ef23  7a			ply
$0f:ef24  43 20		 eor $20,s
$0f:ef26  11 e7		 ora ($e7),y
$0f:ef28  90 32		 bcc $ef5c
$0f:ef2a  0c 42 02	  tsb $0242
$0f:ef2d  10 a0		 bpl $eecf
$0f:ef2f  70 34		 bvs $ef65
$0f:ef31  1a			inc a
$0f:ef32  0a			asl a
$0f:ef33  04 42		 tsb $42
$0f:ef35  21 50		 and ($50,x)
$0f:ef37  a0 48		 ldy #$48
$0f:ef39  20 13 03	  jsr $0313
$0f:ef3c  7a			ply
$0f:ef3d  50 20		 bvc $ef5f
$0f:ef3f  1e 07 30	  asl $3007,x
$0f:ef42  f4 03 03	  pea $0303
$0f:ef45  cd 84 43	  cmp $4384
$0f:ef48  e1 80		 sbc ($80,x)
$0f:ef4a  90 9f		 bcc $eeeb
$0f:ef4c  c3 a4		 cmp $a4,s
$0f:ef4e  f1 49		 sbc ($49),y
$0f:ef50  7c 02 3e	  jmp ($3e02,x)
$0f:ef53  82 08 07	  brl $f65e
$0f:ef56  4a			lsr a
$0f:ef57  31 10		 and ($10),y
$0f:ef59  8e 42 1f	  stx $1f42
$0f:ef5c  61 0e		 adc ($0e,x)
$0f:ef5e  84 40		 sty $40
$0f:ef60  23 06		 and $06,s
$0f:ef62  f3 b3		 sbc ($b3,s),y
$0f:ef64  48			pha
$0f:ef65  3c 16 0e	  bit $0e16,x
$0f:ef68  c7 43		 cmp [$43]
$0f:ef6a  f1 e0		 sbc ($e0),y
$0f:ef6c  e4 54		 cpx $54
$0f:ef6e  3d 10 03	  and $0310,x
$0f:ef71  70 26		 bvs $ef99
$0f:ef73  43 2d		 eor $2d,s
$0f:ef75  30 88		 bmi $eeff
$0f:ef77  5c 24 06 e0   jml $e00624
$0f:ef7b  f0 37		 beq $efb4
$0f:ef7d  1a			inc a
$0f:ef7e  27 10		 and [$10]
$0f:ef80  86 bc		 stx $bc
$0f:ef82  05 0a		 ora $0a
$0f:ef84  13 38		 ora ($38,s),y
$0f:ef86  13 d5		 ora ($d5,s),y
$0f:ef88  21 f1		 and ($f1,x)
$0f:ef8a  88			dey
$0f:ef8b  90 00		 bcc $ef8d
$0f:ef8d  62 11 f8	  per $e7a1
$0f:ef90  64 38		 stz $38
$0f:ef92  e8			inx
$0f:ef93  00 72		 brk #$72
$0f:ef95  c8			iny
$0f:ef96  44 2f 93	  mvp $93,$2f
$0f:ef99  8e b5 43	  stx $43b5
$0f:ef9c  7d a0 ec	  adc $eca0,x
$0f:ef9f  78			sei
$0f:efa0  3f 0e 61 4a   and $4a610e,x
$0f:efa4  87 b2		 sta [$b2]
$0f:efa6  71 86		 adc ($86),y
$0f:efa8  98			tya
$0f:efa9  4b			phk
$0f:efaa  ae 14 6f	  ldx $6f14
$0f:efad  04 11		 tsb $11
$0f:efaf  32 06		 and ($06)
$0f:efb1  93 af		 sta ($af,s),y
$0f:efb3  d4 1f		 pei ($1f)
$0f:efb5  21 37		 and ($37,x)
$0f:efb7  88			dey
$0f:efb8  49 a0		 eor #$a0
$0f:efba  33 d8		 and ($d8,s),y
$0f:efbc  64 7e		 stz $7e
$0f:efbe  07 0f		 ora [$0f]
$0f:efc0  4f 8e 3e 3e   eor $3e3e8e
$0f:efc4  80 08		 bra $efce
$0f:efc6  7a			ply
$0f:efc7  04 60		 tsb $60
$0f:efc9  6f d0 81 a7   adc $a781d0
$0f:efcd  cb			wai
$0f:efce  e9 14		 sbc #$14
$0f:efd0  0c 87 62	  tsb $6287
$0f:efd3  21 c8		 and ($c8,x)
$0f:efd5  80 5e		 bra $f035
$0f:efd7  2c 1f 0c	  bit $0c1f
$0f:efda  03 9c		 ora $9c,s
$0f:efdc  01 61		 ora ($61,x)
$0f:efde  e2 f8		 sep #$f8
$0f:efe0  28			plp
$0f:efe1  03 c0		 ora $c0,s
$0f:efe3  a1 1c		 lda ($1c,x)
$0f:efe5  00 74		 brk #$74
$0f:efe7  0b			phd
$0f:efe8  a0 6c		 ldy #$6c
$0f:efea  2a			rol a
$0f:efeb  04 7e		 tsb $7e
$0f:efed  20 71 29	  jsr $2971
$0f:eff0  9c 42 79	  stz $7942
$0f:eff3  0c 89 8f	  tsb $8f89
$0f:eff6  82 01 bf	  brl $aefa
$0f:eff9  9f a0 c5 04   sta $04c5a0,x
$0f:effd  23 50		 and $50,s
$0f:efff  89 c1		 bit #$c1
$0f:f001  e1 80		 sbc ($80,x)
$0f:f003  b1 ec		 lda ($ec),y
$0f:f005  40			rti
$0f:f006  3f 91 8d d4   and $d48d91,x
$0f:f00a  42 b1		 wdm #$b1
$0f:f00c  90 cc		 bcc $efda
$0f:f00e  40			rti
$0f:f00f  2e 14 02	  rol $0214
$0f:f012  d9 7f 3f	  cmp $3f7f,y
$0f:f015  1e 6f 83	  asl $836f,x
$0f:f018  84 13		 sty $13
$0f:f01a  e1 e0		 sbc ($e0,x)
$0f:f01c  53 10		 eor ($10,s),y
$0f:f01e  2c 60 70	  bit $7060
$0f:f021  38			sec
$0f:f022  0c 06 05	  tsb $0506
$0f:f025  02 87		 cop #$87
$0f:f027  c0 8f		 cpy #$8f
$0f:f029  21 1f		 and ($1f,x)
$0f:f02b  80 c7		 bra $eff4
$0f:f02d  d7 82		 cmp [$82],y
$0f:f02f  89 08		 bit #$08
$0f:f031  13 c0		 ora ($c0,s),y
$0f:f033  20 4f 20	  jsr $204f
$0f:f036  44 8c 04	  mvp $04,$8c
$0f:f039  d6 00		 dec $00,x
$0f:f03b  a0 a8		 ldy #$a8
$0f:f03d  48			pha
$0f:f03e  36 1a		 rol $1a,x
$0f:f040  0d 64 83	  ora $8364
$0f:f043  b5 42		 lda $42,x
$0f:f045  db			stp
$0f:f046  61 23		 adc ($23,x)
$0f:f048  d1 02		 cmp ($02),y
$0f:f04a  a8			tay
$0f:f04b  7f 28 1f 8f   adc $8f1f28,x
$0f:f04f  c5 72		 cmp $72
$0f:f051  39 de 9f	  and $9fde,y
$0f:f054  6f 2f d7 8f   adc $8fd72f
$0f:f058  e2 8c		 sep #$8c
$0f:f05a  28			plp
$0f:f05b  05 c1		 ora $c1
$0f:f05d  8d 82 45	  sta $4582
$0f:f060  14 04		 trb $04
$0f:f062  80 8e		 bra $eff2
$0f:f064  40			rti
$0f:f065  23 d0		 and $d0,s
$0f:f067  08			php
$0f:f068  e9 e8		 sbc #$e8
$0f:f06a  20 33 f7	  jsr $f733
$0f:f06d  78			sei
$0f:f06e  10 15		 bpl $f085
$0f:f070  e2 06		 sep #$06
$0f:f072  b0 83		 bcs $eff7
$0f:f074  03 85		 ora $85,s
$0f:f076  32 19		 and ($19)
$0f:f078  0c 85 92	  tsb $9285
$0f:f07b  81 ba		 sta ($ba,x)
$0f:f07d  c4 6d		 cpy $6d
$0f:f07f  b2 97		 lda ($97)
$0f:f081  eb			xba
$0f:f082  87 f2		 sta [$f2]
$0f:f084  00 1f		 brk #$1f
$0f:f086  0b			phd
$0f:f087  c7 e2		 cmp [$e2]
$0f:f089  d9 cc df	  cmp $dfcc,y
$0f:f08c  73 ae		 adc ($ae,s),y
$0f:f08e  98			tya
$0f:f08f  cb			wai
$0f:f090  46 73		 lsr $73
$0f:f092  01 f0		 ora ($f0,x)
$0f:f094  55 80		 eor $80,x
$0f:f096  bc 1d e2	  ldy $e21d,x
$0f:f099  fc 18 bc	  jsr ($bc18,x)
$0f:f09c  1d f2 83	  ora $83f2,x
$0f:f09f  f0 77		 beq $f118
$0f:f0a1  08			php
$0f:f0a2  1c 61 00	  trb $0061
$0f:f0a5  83 55		 sta $55,s
$0f:f0a7  84 82		 sty $82
$0f:f0a9  81 e8		 sta ($e8,x)
$0f:f0ab  80 6a		 bra $f117
$0f:f0ad  24 14		 bit $14
$0f:f0af  ca			dex
$0f:f0b0  07 63		 ora [$63]
$0f:f0b2  81 06		 sta ($06,x)
$0f:f0b4  82 71 bd	  brl $ae28
$0f:f0b7  1d c8 80	  ora $80c8,x
$0f:f0ba  7c 03 e1	  jmp ($e103,x)
$0f:f0bd  dc 9e 6f	  jml [$6f9e]
$0f:f0c0  af d3 ef f7   lda $f7efd3
$0f:f0c4  e3 f9		 sbc $f9,s
$0f:f0c6  10 e0		 bpl $f0a8
$0f:f0c8  58			cli
$0f:f0c9  05 c1		 ora $c1
$0f:f0cb  09 8e		 ora #$8e
$0f:f0cd  c2 60		 rep #$60
$0f:f0cf  b1 30		 lda ($30),y
$0f:f0d1  c8			iny
$0f:f0d2  45 63		 eor $63
$0f:f0d4  71 58		 adc ($58),y
$0f:f0d6  9c 22 37	  stz $3722
$0f:f0d9  1d 87 13	  ora $1387,x
$0f:f0dc  40			rti
$0f:f0dd  9a			txs
$0f:f0de  03 50		 ora $50,s
$0f:f0e0  7e 80 d4	  ror $d480,x
$0f:f0e3  06 a1		 asl $a1
$0f:f0e5  05 45		 ora $45
$0f:f0e7  8f 42 81 60   sta $608142
$0f:f0eb  c8			iny
$0f:f0ec  54 26 11	  mvn $11,$26
$0f:f0ef  0c 86 82	  tsb $8286
$0f:f0f2  e0 50		 cpx #$50
$0f:f0f4  0a			asl a
$0f:f0f5  86 83		 stx $83
$0f:f0f7  21 60		 and ($60,x)
$0f:f0f9  d0 40		 bne $f13b
$0f:f0fb  3c 0e 01	  bit $010e,x
$0f:f0fe  56 80		 lsr $80,x
$0f:f100  b4 1c		 ldy $1c,x
$0f:f102  e4 0b		 cpx $0b
$0f:f104  10 18		 bpl $f11e
$0f:f106  02 02		 cop #$02
$0f:f108  01 09		 ora ($09,x)
$0f:f10a  80 c2		 bra $f0ce
$0f:f10c  e0 70		 cpx #$70
$0f:f10e  68			pla
$0f:f10f  34 22		 bit $22,x
$0f:f111  18			clc
$0f:f112  b2 04		 lda ($04)
$0f:f114  58			cli
$0f:f115  c1 20		 cmp ($20,x)
$0f:f117  f0 87		 beq $f0a0
$0f:f119  d0 40		 bne $f15b
$0f:f11b  21 90		 and ($90,x)
$0f:f11d  58			cli
$0f:f11e  44 2e 01	  mvp $01,$2e
$0f:f121  02 45		 cop #$45
$0f:f123  8d 81 a2	  sta $a281
$0f:f126  19 0c 06	  ora $060c,y
$0f:f129  03 a1		 ora $a1,s
$0f:f12b  c0 b8		 cpy #$b8
$0f:f12d  58			cli
$0f:f12e  2a			rol a
$0f:f12f  0d 10 d8	  ora $d810
$0f:f132  3a			dec a
$0f:f133  c1 be		 cmp ($be,x)
$0f:f135  17 07		 ora [$07],y
$0f:f137  20 44 24	  jsr $2444
$0f:f13a  11 0d		 ora ($0d),y
$0f:f13c  04 43		 tsb $43
$0f:f13e  01 10		 ora ($10,x)
$0f:f140  a8			tay
$0f:f141  03 00		 ora $00,s
$0f:f143  90 2f		 bcc $f174
$0f:f145  52 85		 eor ($85)
$0f:f147  40			rti
$0f:f148  a0 90		 ldy #$90
$0f:f14a  48			pha
$0f:f14b  4c 34 08	  jmp $0834
$0f:f14e  00 10		 brk #$10
$0f:f150  7d 03 e8	  adc $e803,x
$0f:f153  20 90 88	  jsr $8890
$0f:f156  0c 30 06	  tsb $0630
$0f:f159  10 a7		 bpl $f102
$0f:f15b  68			pla
$0f:f15c  d0 28		 bne $f186
$0f:f15e  01 50		 ora ($50,x)
$0f:f160  0a			asl a
$0f:f161  00 5c		 brk #$5c
$0f:f163  91 c0		 sta ($c0),y
$0f:f165  1d 08 85	  ora $8508,x
$0f:f168  83 01		 sta $01,s
$0f:f16a  20 12 80	  jsr $8012
$0f:f16d  94 20		 sty $20,x
$0f:f16f  13 01		 ora ($01,s),y
$0f:f171  48			pha
$0f:f172  70 05		 bvs $f179
$0f:f174  82 ea 33	  brl $2561
$0f:f177  7c bb c0	  jmp ($c0bb,x)
$0f:f17a  df 88 ce e0   cmp $e0ce88,x
$0f:f17e  70 11		 bvs $f191
$0f:f180  9e 6f 4c	  stz $4c6f,x
$0f:f183  06 9f		 asl $9f
$0f:f185  7e ef 0c	  ror $0cef,x
$0f:f188  3e 1f 3b	  rol $3b1f,x
$0f:f18b  d9 37 b5	  cmp $b537,y
$0f:f18e  1a			inc a
$0f:f18f  01 fe		 ora ($fe,x)
$0f:f191  80 5e		 bra $f1f1
$0f:f193  0b			phd
$0f:f194  20 c7 03	  jsr $03c7
$0f:f197  c8			iny
$0f:f198  c4 22		 cpy $22
$0f:f19a  10 88		 bpl $f124
$0f:f19c  46 23		 lsr $23
$0f:f19e  91 f8		 sta ($f8),y
$0f:f1a0  fc 50 04	  jsr ($0450,x)
$0f:f1a3  61 20		 adc ($20,x)
$0f:f1a5  37 a1		 and [$a1],y
$0f:f1a7  90 0c		 bcc $f1b5
$0f:f1a9  80 6c		 bra $f217
$0f:f1ab  24 f2		 bit $f2
$0f:f1ad  ad 9f e9	  lda $e99f
$0f:f1b0  85 60		 sta $60
$0f:f1b2  e4 12		 cpx $12
$0f:f1b4  f6 79		 inc $79,x
$0f:f1b6  01 c8		 ora ($c8,x)
$0f:f1b8  0e 41 ae	  asl $ae41
$0f:f1bb  1f 06 d4 c2   ora $c2d406,x
$0f:f1bf  1c cf c0	  trb $c0cf
$0f:f1c2  6f 0c 08 20   adc $20080c
$0f:f1c6  10 18		 bpl $f1e0
$0f:f1c8  1c 1a 03	  trb $031a
$0f:f1cb  07 85		 ora [$85]
$0f:f1cd  c2 e0		 rep #$e0
$0f:f1cf  b0 18		 bcs $f1e9
$0f:f1d1  dc 54 5e	  jml [$5e54]
$0f:f1d4  50 78		 bvc $f24e
$0f:f1d6  04 14		 tsb $14
$0f:f1d8  f2 30		 sbc ($30)
$0f:f1da  48			pha
$0f:f1db  04 38		 tsb $38
$0f:f1dd  94 29		 sty $29,x
$0f:f1df  58			cli
$0f:f1e0  90 48		 bcc $f22a
$0f:f1e2  2a			rol a
$0f:f1e3  1b			tcs
$0f:f1e4  0e 83 9c	  asl $9c83
$0f:f1e7  92 cd		 sta ($cd)
$0f:f1e9  00 f0		 brk #$f0
$0f:f1eb  1a			inc a
$0f:f1ec  86 02		 stx $02
$0f:f1ee  e8			inx
$0f:f1ef  08			php
$0f:f1f0  14 0e		 trb $0e
$0f:f1f2  02 34		 cop #$34
$0f:f1f4  08			php
$0f:f1f5  4c 26 05	  jmp $0526
$0f:f1f8  04 8b		 tsb $8b
$0f:f1fa  c6 62		 dec $62
$0f:f1fc  b1 73		 lda ($73),y
$0f:f1fe  78			sei
$0f:f1ff  40			rti
$0f:f200  c6 02		 dec $02
$0f:f202  e8			inx
$0f:f203  08			php
$0f:f204  34 02		 bit $02,x
$0f:f206  1e 4a 18	  asl $184a,x
$0f:f209  51 b8		 eor ($b8),y
$0f:f20b  0f 21 07 8b   ora $8b0721
$0f:f20f  40			rti
$0f:f210  61 d0		 adc ($d0,x)
$0f:f212  38			sec
$0f:f213  54 6e 29	  mvn $29,$6e
$0f:f216  1b			tcs
$0f:f217  81 41		 sta ($41,x)
$0f:f219  ce 40 e8	  dec $e840
$0f:f21c  18			clc
$0f:f21d  04 52		 tsb $52
$0f:f21f  05 0a		 ora $0a
$0f:f221  8a			txa
$0f:f222  42 a0		 wdm #$a0
$0f:f224  84 90		 sty $90
$0f:f226  4f 94 46 15   eor $154694
$0f:f22a  17 84		 ora [$84],y
$0f:f22c  47 e1		 eor [$e1]
$0f:f22e  11 b8		 ora ($b8),y
$0f:f230  44 5e 09	  mvp $09,$5e
$0f:f233  13 5c		 ora ($5c,s),y
$0f:f235  09 0c 09	  ora #$090c
$0f:f238  20 bf 41	  jsr $41bf
$0f:f23b  18			clc
$0f:f23c  31 c8		 and ($c8),y
$0f:f23e  44 19 09	  mvp $09,$19
$0f:f241  07 42		 ora [$42]
$0f:f243  01 f0		 ora ($f0,x)
$0f:f245  35 19		 and $19,x
$0f:f247  ac 1d a7	  ldy $a71d
$0f:f24a  40			rti
$0f:f24b  0d b3 8d	  ora $8db3
$0f:f24e  21 10		 and ($10,x)
$0f:f250  68			pla
$0f:f251  64 12		 stz $12
$0f:f253  31 08		 and ($08),y
$0f:f255  8a			txa
$0f:f256  41 1e		 eor ($1e,x)
$0f:f258  a1 11		 lda ($11,x)
$0f:f25a  82 46 a1	  brl $93a3
$0f:f25d  b1 02		 lda ($02),y
$0f:f25f  18			clc
$0f:f260  40			rti
$0f:f261  50 20		 bvc $f283
$0f:f263  43 08		 eor $08,s
$0f:f265  58			cli
$0f:f266  10 14		 bpl $f27c
$0f:f268  81 03		 sta ($03,x)
$0f:f26a  84 20		 sty $20
$0f:f26c  42 15		 wdm #$15
$0f:f26e  10 b0		 bpl $f220
$0f:f270  4c 24 11	  jmp $1124
$0f:f273  88			dey
$0f:f274  84 a2		 sty $a2
$0f:f276  40			rti
$0f:f277  15 0c		 ora $0c,x
$0f:f279  44 82 b1	  mvp $b1,$82
$0f:f27c  b0 8c		 bcs $f20a
$0f:f27e  1a			inc a
$0f:f27f  c3 00		 cmp $00,s
$0f:f281  69 26 88	  adc #$8826
$0f:f284  74 28		 stz $28,x
$0f:f286  15 0e		 ora $0e,x
$0f:f288  04 40		 tsb $40
$0f:f28a  d2 14		 cmp ($14)
$0f:f28c  07 88		 ora [$88]
$0f:f28e  42 1e		 wdm #$1e
$0f:f290  93 1f		 sta ($1f,s),y
$0f:f292  86 80		 stx $80
$0f:f294  72 19		 adc ($19)
$0f:f296  02 08		 cop #$08
$0f:f298  84 40		 sty $40
$0f:f29a  29 3f 8c	  and #$8c3f
$0f:f29d  80 87		 bra $f226
$0f:f29f  22 14 08 12   jsl $120814
$0f:f2a3  0c 62 13	  tsb $1362
$0f:f2a6  c9 0c f6	  cmp #$f60c
$0f:f2a9  49 18 8f	  eor #$8f18
$0f:f2ac  40			rti
$0f:f2ad  61 b0		 adc ($b0,x)
$0f:f2af  16 e8		 asl $e8,x
$0f:f2b1  1f 00 18 10   ora $101800,x
$0f:f2b5  38			sec
$0f:f2b6  74 0a		 stz $0a,x
$0f:f2b8  3d 03 9e	  and $9e03,x
$0f:f2bb  40			rti
$0f:f2bc  27 d0		 and [$d0]
$0f:f2be  18			clc
$0f:f2bf  f3 74		 sbc ($74,s),y
$0f:f2c1  24 05		 bit $05
$0f:f2c3  01 d5		 ora ($d5,x)
$0f:f2c5  e8			inx
$0f:f2c6  e6 9a		 inc $9a
$0f:f2c8  88			dey
$0f:f2c9  66 03		 ror $03
$0f:f2cb  61 b4		 adc ($b4,x)
$0f:f2cd  bc dd 63	  ldy $63dd,x
$0f:f2d0  b1 11		 lda ($11),y
$0f:f2d2  09 54 21	  ora #$2154
$0f:f2d5  94 38		 sty $38,x
$0f:f2d7  e5 8e		 sbc $8e
$0f:f2d9  39 d3 86	  and $86d3,y
$0f:f2dc  44 95 43	  mvp $43,$95
$0f:f2df  f5 c2		 sbc $c2,x
$0f:f2e1  63 71		 adc $71,s
$0f:f2e3  9f ef f7 ff   sta $fff7ef,x
$0f:f2e7  c1 ff		 cmp ($ff,x)
$0f:f2e9  80 2d		 bra $f318
$0f:f2eb  c9 ba 10	  cmp #$10ba
$0f:f2ee  4b			phk
$0f:f2ef  de 32 e7	  dec $e732,x
$0f:f2f2  fe 80 a8	  inc $a880,x
$0f:f2f5  41 8d		 eor ($8d,x)
$0f:f2f7  1a			inc a
$0f:f2f8  0a			asl a
$0f:f2f9  06 a2		 asl $a2
$0f:f2fb  81 bc		 sta ($bc,x)
$0f:f2fd  c0 7e		 cpy #$7e
$0f:f2ff  a6 1e		 ldx $1e
$0f:f301  a8			tay
$0f:f302  07 f2		 ora [$f2]
$0f:f304  08			php
$0f:f305  bc 0e 04	  ldy $040e,x
$0f:f308  81 40		 sta ($40,x)
$0f:f30a  3f 0c 05 e2   and $e2050c,x
$0f:f30e  61 0c		 adc ($0c,x)
$0f:f310  80 47		 bra $f359
$0f:f312  20 91 85	  jsr $8591
$0f:f315  e0 63		 cpx #$63
$0f:f317  b1 bf		 lda ($bf),y
$0f:f319  ff e7 f5 6c   sbc $6cf5e7,x
$0f:f31d  ab			plb
$0f:f31e  b2 60		 lda ($60)
$0f:f320  87 f2		 sta [$f2]
$0f:f322  07 e0		 ora [$e0]
$0f:f324  1f 83 19 ec   ora $ec1983,x
$0f:f328  1a			inc a
$0f:f329  0d 04 83	  ora $8304
$0f:f32c  b1 00		 lda ($00),y
$0f:f32e  6a			ror a
$0f:f32f  87 70		 sta [$70]
$0f:f331  28			plp
$0f:f332  12 0f		 ora ($0f)
$0f:f334  c2 f0		 rep #$f0
$0f:f336  64 0d		 stz $0d
$0f:f338  f0 4f		 beq $f389
$0f:f33a  8e 02 c0	  stx $c002
$0f:f33d  a0 01 08	  ldy #$0801
$0f:f340  af 06 2b 1f   lda $1f2b06
$0f:f344  87 46		 sta [$46]
$0f:f346  a2 90 a8	  ldx #$a890
$0f:f349  ec 0e 3b	  cpx $3b0e
$0f:f34c  13 8f		 ora ($8f,s),y
$0f:f34e  c3 20		 cmp $20,s
$0f:f350  91 18		 sta ($18),y
$0f:f352  a4 2e		 ldy $2e
$0f:f354  15 00		 ora $00,x
$0f:f356  82 90 06	  brl $f9e9
$0f:f359  21 04		 and ($04,x)
$0f:f35b  8a			txa
$0f:f35c  42 21		 wdm #$21
$0f:f35e  d0 08		 bne $f368
$0f:f360  c4 0a		 cpy $0a
$0f:f362  38			sec
$0f:f363  0e 0f 87	  asl $870f
$0f:f366  03 61		 ora $61,s
$0f:f368  50 d0		 bvc $f33a
$0f:f36a  5c 30 17 0c   jml $0c1730
$0f:f36e  87 c2		 sta [$c2]
$0f:f370  c0 6c 02	  cpy #$026c
$0f:f373  98			tya
$0f:f374  60			rts
$0f:f375  20 14 03	  jsr $0314
$0f:f378  00 c4		 brk #$c4
$0f:f37a  28			plp
$0f:f37b  15 09		 ora $09,x
$0f:f37d  02 84		 cop #$84
$0f:f37f  26 05		 rol $05
$0f:f381  60			rts
$0f:f382  80 0c		 bra $f390
$0f:f384  4a			lsr a
$0f:f385  39 02 1b	  and $1b02,y
$0f:f388  b4 22		 ldy $22,x
$0f:f38a  26 41		 rol $41
$0f:f38c  28			plp
$0f:f38d  89 19 db	  bit #$db19
$0f:f390  81 e0		 sta ($e0,x)
$0f:f392  29 5c 83	  and #$835c
$0f:f395  20 61 c3	  jsr $c361
$0f:f398  08			php
$0f:f399  40			rti
$0f:f39a  a0 70 48	  ldy #$4870
$0f:f39d  3c 2a 27	  bit $272a,x
$0f:f3a0  13 8a		 ora ($8a,s),y
$0f:f3a2  c3 21		 cmp $21,s
$0f:f3a4  31 18		 and ($18),y
$0f:f3a6  ec 56 13	  cpx $1356
$0f:f3a9  1b			tcs
$0f:f3aa  84 82		 sty $82
$0f:f3ac  c9 d0 04	  cmp #$04d0
$0f:f3af  90 8b		 bcc $f33c
$0f:f3b1  40			rti
$0f:f3b2  20 cc 83	  jsr $83cc
$0f:f3b5  c0 60 28	  cpy #$2860
$0f:f3b8  1c 0d 06	  trb $060d
$0f:f3bb  41 a0		 eor ($a0,x)
$0f:f3bd  17 09		 ora [$09],y
$0f:f3bf  04 42		 tsb $42
$0f:f3c1  e0 67 0d	  cpx #$0d67
$0f:f3c4  84 80		 sty $80
$0f:f3c6  16 70		 asl $70,x
$0f:f3c8  0f 84 03 a1   ora $a10384
$0f:f3cc  00 15		 brk #$15
$0f:f3ce  03 a4		 ora $a4,s
$0f:f3d0  a3 f0		 lda $f0,s
$0f:f3d2  58			cli
$0f:f3d3  f4 0a 3f	  pea $3f0a
$0f:f3d6  04 89		 tsb $89
$0f:f3d8  bb			tyx
$0f:f3d9  82 09 1b	  brl $0ee5
$0f:f3dc  80 45		 bra $f423
$0f:f3de  e0 10 f4	  cpx #$f410
$0f:f3e1  60			rts
$0f:f3e2  42 a0		 wdm #$a0
$0f:f3e4  50 98		 bvc $f37e
$0f:f3e6  24 21		 bit $21
$0f:f3e8  84 00		 sty $00
$0f:f3ea  32 61		 and ($61)
$0f:f3ec  0c 03 f1	  tsb $f103
$0f:f3ef  90 b4		 bcc $f3a5
$0f:f3f1  50 3d		 bvc $f430
$0f:f3f3  12 0f		 ora ($0f)
$0f:f3f5  c3 90		 cmp $90,s
$0f:f3f7  4d 20 ed	  eor $ed20
$0f:f3fa  05 f8		 ora $f8
$0f:f3fc  19 42 81	  ora $8142,y
$0f:f3ff  90 6c		 bcc $f46d
$0f:f401  02 fc		 cop #$fc
$0f:f403  84 a9		 sty $a9
$0f:f405  16 79		 asl $79,x
$0f:f407  0b			phd
$0f:f408  dd a0 eb	  cmp $eba0,x
$0f:f40b  f1 00		 sbc ($00),y
$0f:f40d  90 1d		 bcc $f42c
$0f:f40f  97 e4		 sta [$e4],y
$0f:f411  11 0f		 ora ($0f),y
$0f:f413  c0 50 22	  cpy #$2250
$0f:f416  01 50		 ora ($50,x)
$0f:f418  0a			asl a
$0f:f419  a2 fc 04	  ldx #$04fc
$0f:f41c  24 24		 bit $24
$0f:f41e  98			tya
$0f:f41f  04 76		 tsb $76
$0f:f421  23 15		 and $15,s
$0f:f423  88			dey
$0f:f424  fe a1 1f	  inc $1fa1,x
$0f:f427  e8			inx
$0f:f428  07 d6		 ora [$d6]
$0f:f42a  01 ef		 ora ($ef,x)
$0f:f42c  82 7f d7	  brl $cbae
$0f:f42f  e3 12		 sbc $12,s
$0f:f431  86 44		 stx $44
$0f:f433  21 d0		 and ($d0,x)
$0f:f435  81 d8		 sta ($d8,x)
$0f:f437  0e c2 1d	  asl $1dc2
$0f:f43a  04 8c		 tsb $8c
$0f:f43c  40			rti
$0f:f43d  11 41		 ora ($41),y
$0f:f43f  00 38		 brk #$38
$0f:f441  84 2a		 sty $2a
$0f:f443  11 fd		 ora ($fd),y
$0f:f445  81 1d		 sta ($1d,x)
$0f:f447  43 f9		 eor $f9,s
$0f:f449  00 fd		 brk #$fd
$0f:f44b  c0 7f f0	  cpy #$f07f
$0f:f44e  10 e8		 bpl $f438
$0f:f450  a0 8a 06	  ldy #$068a
$0f:f453  a3 28		 lda $28,s
$0f:f455  0c 19 52	  tsb $5219
$0f:f458  02 57		 cop #$57
$0f:f45a  c0 69 f7	  cpy #$f769
$0f:f45d  f0 18		 beq $f477
$0f:f45f  0e 1f 0f	  asl $0f1f
$0f:f462  9d ec 89	  sta $89ec,x
$0f:f465  5a			phy
$0f:f466  8d 00 3a	  sta $3a00
$0f:f469  85 e2		 sta $e2
$0f:f46b  01 20		 ora ($20,x)
$0f:f46d  63 80		 adc $80,s
$0f:f46f  95 70		 sta $70,x
$0f:f471  9c 4f c7	  stz $c74f
$0f:f474  e2 81		 sep #$81
$0f:f476  70 66		 bvs $f4de
$0f:f478  00 95		 brk #$95
$0f:f47a  91 82		 sta ($82),y
$0f:f47c  b5 00		 lda $00,x
$0f:f47e  d1 ac		 cmp ($ac),y
$0f:f480  eb			xba
$0f:f481  eb			xba
$0f:f482  84 60		 sty $60
$0f:f484  e4 12		 cpx $12
$0f:f486  f6 4a		 inc $4a,x
$0f:f488  08			php
$0f:f489  20 44 71	  jsr $7144
$0f:f48c  1c 8f 83	  trb $838f
$0f:f48f  6a			ror a
$0f:f490  48			pha
$0f:f491  80 63		 bra $f4f6
$0f:f493  27 59		 and [$59]
$0f:f495  70 24		 bvs $f4bb
$0f:f497  10 88		 bpl $f421
$0f:f499  9c 1a 17	  stz $171a
$0f:f49c  1b			tcs
$0f:f49d  81 c7		 sta ($c7,x)
$0f:f49f  22 b0 58 c4   jsl $c458b0
$0f:f4a3  7a			ply
$0f:f4a4  15 1f		 ora $1f,x
$0f:f4a6  8c 45 c2	  sty $c245
$0f:f4a9  01 00		 ora ($00,x)
$0f:f4ab  8b			phb
$0f:f4ac  40			rti
$0f:f4ad  88			dey
$0f:f4ae  21 02		 and ($02,x)
$0f:f4b0  80 11		 bra $f4c3
$0f:f4b2  42 12		 wdm #$12
$0f:f4b4  24 28		 bit $28
$0f:f4b6  c4 83		 cpy $83
$0f:f4b8  21 c0		 and ($c0,x)
$0f:f4ba  d0 6c		 bne $f528
$0f:f4bc  30 16		 bmi $f4d4
$0f:f4be  0a			asl a
$0f:f4bf  05 82		 ora $82
$0f:f4c1  61 d0		 adc ($d0,x)
$0f:f4c3  f8			sed
$0f:f4c4  6c 2e 1e	  jmp ($1e2e)
$0f:f4c7  09 85 02	  ora #$0285
$0f:f4ca  01 d0		 ora ($d0,x)
$0f:f4cc  c0 18 43	  cpy #$4318
$0f:f4cf  20 ea 1a	  jsr $1aea
$0f:f4d2  80 90		 bra $f464
$0f:f4d4  e2 c3		 sep #$c3
$0f:f4d6  21 86		 and ($86,x)
$0f:f4d8  41 61		 eor ($61,x)
$0f:f4da  b1 88		 lda ($88),y
$0f:f4dc  b4 2a		 ldy $2a,x
$0f:f4de  37 1c		 and [$1c],y
$0f:f4e0  81 c5		 sta ($c5,x)
$0f:f4e2  22 f0 82 09   jsl $0982f0
$0f:f4e6  44 88 c2	  mvp $c2,$88
$0f:f4e9  9c 01 28	  stz $2801
$0f:f4ec  08			php
$0f:f4ed  c0 00 05	  cpy #$0500
$0f:f4f0  17 d0		 ora [$d0],y
$0f:f4f2  64 0b		 stz $0b
$0f:f4f4  82 5d 03	  brl $f854
$0f:f4f7  0b			phd
$0f:f4f8  00 00		 brk #$00
$0f:f4fa  4a			lsr a
$0f:f4fb  40			rti
$0f:f4fc  00 8a		 brk #$8a
$0f:f4fe  c0 61 b1	  cpy #$b161
$0f:f501  38			sec
$0f:f502  a4 62		 ldy $62
$0f:f504  2b			pld
$0f:f505  13 80		 ora ($80,s),y
$0f:f507  44 e1 11	  mvp $11,$e1
$0f:f50a  b8			clv
$0f:f50b  ec 3a 2b	  cpx $2b3a
$0f:f50e  0e 87 40	  asl $4087
$0f:f511  17 e1		 ora [$e1],y
$0f:f513  0f 60 0c 36   ora $360c60
$0f:f517  01 05		 ora ($05,x)
$0f:f519  00 19		 brk #$19
$0f:f51b  a4 2c		 ldy $2c
$0f:f51d  09 90 88	  ora #$8890
$0f:f520  44 36 1a	  mvp $1a,$36
$0f:f523  09 83 5c	  ora #$5c83
$0f:f526  22 1a 0a 87   jsl $870a1a
$0f:f52a  83 c1		 sta $c1,s
$0f:f52c  00 6f		 brk #$6f
$0f:f52e  a0 ac 60	  ldy #$60ac
$0f:f531  05 f0		 ora $f0
$0f:f533  76 44		 ror $44,x
$0f:f535  0e 03 08	  asl $0803
$0f:f538  45 8c		 eor $8c
$0f:f53a  32 18		 and ($18)
$0f:f53c  ec 68 0c	  cpx $0c68
$0f:f53f  19 86 0c	  ora $0c86,y
$0f:f542  30 85		 bmi $f4c9
$0f:f544  aa			tax
$0f:f545  51 54		 eor ($54),y
$0f:f547  25 f0		 and $f0
$0f:f549  98			tya
$0f:f54a  36 80		 rol $80,x
$0f:f54c  36 2e		 rol $2e,x
$0f:f54e  c7 f0		 cmp [$f0]
$0f:f550  74 1c		 stz $1c,x
$0f:f552  06 f1		 asl $f1
$0f:f554  67 e8		 adc [$e8]
$0f:f556  3e 41 f2	  rol $f241,x
$0f:f559  10 68		 bpl $f5c3
$0f:f55b  30 05		 bmi $f562
$0f:f55d  a1 70		 lda ($70,x)
$0f:f55f  08			php
$0f:f560  39 20 5f	  and $5f20,y
$0f:f563  00 11		 brk #$11
$0f:f565  ca			dex
$0f:f566  83 3c		 sta $3c,s
$0f:f568  04 57		 tsb $57
$0f:f56a  a0 57 04	  ldy #$0457
$0f:f56d  46 2f		 lsr $2f
$0f:f56f  11 f5		 ora ($f5),y
$0f:f571  42 7f		 wdm #$7f
$0f:f573  d0 8f		 bne $f504
$0f:f575  fc 00 ee	  jsr ($ee00,x)
$0f:f578  4a			lsr a
$0f:f579  a0 89 43	  ldy #$4389
$0f:f57c  22 10 e8 44   jsl $44e810
$0f:f580  5e 11 11	  lsr $1111,x
$0f:f583  76 31		 ror $31,x
$0f:f585  c4 21		 cpy $21
$0f:f587  b0 ef		 bcs $f578
$0f:f589  d9 e8 20	  cmp $20e8,y
$0f:f58c  3f d8 02 4c   and $4c02d8,x
$0f:f590  46 02		 lsr $02
$0f:f592  81 08		 sta ($08,x)
$0f:f594  64 0c		 stz $0c
$0f:f596  90 00		 bcc $f598
$0f:f598  70 80		 bvs $f51a
$0f:f59a  29 88 60	  and #$6088
$0f:f59d  3f 6c 24 3a   and $3a246c,x
$0f:f5a1  1b			tcs
$0f:f5a2  7d be 6f	  adc $6fbe,x
$0f:f5a5  a4 1f		 ldy $1f
$0f:f5a7  fc 0d f9	  jsr ($f90d,x)
$0f:f5aa  6c 12 01	  jmp ($0112)
$0f:f5ad  80 41		 bra $f5f0
$0f:f5af  6f 50 cf 9d   adc $9dcf50
$0f:f5b3  f3 07		 sbc ($07,s),y
$0f:f5b5  20 e0 e0	  jsr $e0e0
$0f:f5b8  68			pla
$0f:f5b9  0c 50 62	  tsb $6250
$0f:f5bc  82 74 4b	  brl $4133
$0f:f5bf  81 90		 sta ($90,x)
$0f:f5c1  aa			tax
$0f:f5c2  61 3e		 adc ($3e,x)
$0f:f5c4  d0 4b		 bne $f611
$0f:f5c6  f4 03 79	  pea $7903
$0f:f5c9  00 f8		 brk #$f8
$0f:f5cb  15 42		 ora $42,x
$0f:f5cd  01 d0		 ora ($d0,x)
$0f:f5cf  90 44		 bcc $f615
$0f:f5d1  3d 10 47	  and $4710,x
$0f:f5d4  10 72		 bpl $f648
$0f:f5d6  20 1c 07	  jsr $071c
$0f:f5d9  38			sec
$0f:f5da  50 30		 bvc $f60c
$0f:f5dc  03 00		 ora $00,s
$0f:f5de  c6 e3		 dec $e3
$0f:f5e0  3f ff ef ff   and $ffefff,x
$0f:f5e4  84 ee		 sty $ee
$0f:f5e6  87 b2		 sta [$b2]
$0f:f5e8  c6 5c		 dec $5c
$0f:f5ea  ff d0 1f 08   sbc $081fd0,x
$0f:f5ee  7d c6 01	  adc $01c6,x
$0f:f5f1  60			rts
$0f:f5f2  d0 03		 bne $f5f7
$0f:f5f4  c2 b1		 rep #$b1
$0f:f5f6  00 fe		 brk #$fe
$0f:f5f8  54 39 90	  mvn $90,$39
$0f:f5fb  0d 64 03	  ora $0364
$0f:f5fe  f1 10		 sbc ($10),y
$0f:f600  18			clc
$0f:f601  04 83		 tsb $83
$0f:f603  80 1f		 bra $f624
$0f:f605  03 40		 ora $40,s
$0f:f607  54 17 81	  mvn $81,$17
$0f:f60a  30 80		 bmi $f58c
$0f:f60c  5c 22 16 02   jml $021622
$0f:f610  00 47		 brk #$47
$0f:f612  c5 c7		 cmp $c7
$0f:f614  0f 1a 09 2c   ora $2c091a
$0f:f618  14 40		 trb $40
$0f:f61a  9c 20 24	  stz $2420
$0f:f61d  98			tya
$0f:f61e  ca			dex
$0f:f61f  61 d0		 adc ($d0,x)
$0f:f621  28			plp
$0f:f622  13 68		 ora ($68,s),y
$0f:f624  0d 42 e8	  ora $e842
$0f:f627  00 23		 brk #$23
$0f:f629  8a			txa
$0f:f62a  00 80		 brk #$80
$0f:f62c  a2 f4 19	  ldx #$19f4
$0f:f62f  b1 f3		 lda ($f3),y
$0f:f631  db			stp
$0f:f632  c0 54 32	  cpy #$3254
$0f:f635  b9 16 5c	  lda $5c16,y
$0f:f638  cc e0 92	  cpy $92e0
$0f:f63b  89 c2 22	  bit #$22c2
$0f:f63e  70 c3		 bvs $f603
$0f:f640  7c 0e c2	  jmp ($c20e,x)
$0f:f643  08			php
$0f:f644  7e dc 84	  ror $84dc,x
$0f:f647  83 a1		 sta $a1,s
$0f:f649  60			rts
$0f:f64a  d8			cld
$0f:f64b  34 84		 bit $84,x
$0f:f64d  aa			tax
$0f:f64e  98			tya
$0f:f64f  08			php
$0f:f650  05 00		 ora $00
$0f:f652  0c c2 60	  tsb $60c2
$0f:f655  04 9c		 tsb $9c
$0f:f657  6a			ror a
$0f:f658  3d 0a 83	  and $830a,x
$0f:f65b  46 60		 lsr $60
$0f:f65d  f1 d8		 sbc ($d8),y
$0f:f65f  2c 66 13	  bit $1366
$0f:f662  11 80		 ora ($80),y
$0f:f664  c6 a0		 dec $a0
$0f:f666  71 78		 adc ($78),y
$0f:f668  3c 66 01	  bit $0166,x
$0f:f66b  01 30		 ora ($30,x)
$0f:f66d  0c 0a 01	  tsb $010a
$0f:f670  0e 80 41	  asl $4180
$0f:f673  a1 10		 lda ($10,x)
$0f:f675  48			pha
$0f:f676  44 06 11	  mvp $11,$06
$0f:f679  70 b8		 bvs $f633
$0f:f67b  52 2c		 eor ($2c)
$0f:f67d  19 8f 86	  ora $868f,y
$0f:f680  a3 71		 lda $71,s
$0f:f682  88			dey
$0f:f683  c4 66		 cpy $66
$0f:f685  30 16		 bmi $f69d
$0f:f687  8b			phb
$0f:f688  05 62		 ora $62
$0f:f68a  a0 dd 0c	  ldy #$0cdd
$0f:f68d  04 40		 tsb $40
$0f:f68f  d0 14		 bne $f6a5
$0f:f691  88			dey
$0f:f692  05 a2		 ora $a2
$0f:f694  21 60		 and ($60,x)
$0f:f696  88			dey
$0f:f697  08			php
$0f:f698  43 a1		 eor $a1,s
$0f:f69a  20 81 41	  jsr $4181
$0f:f69d  a1 30		 lda ($30,x)
$0f:f69f  f8			sed
$0f:f6a0  ec 55 ee	  cpx $ee55
$0f:f6a3  d1 f8		 cmp ($f8),y
$0f:f6a5  50 34		 bvc $f6db
$0f:f6a7  21 11		 and ($11,x)
$0f:f6a9  08			php
$0f:f6aa  90 19		 bcc $f6c5
$0f:f6ac  e1 50		 sbc ($50,x)
$0f:f6ae  4a			lsr a
$0f:f6af  45 a3		 eor $a3
$0f:f6b1  21 e0		 and ($e0,x)
$0f:f6b3  dc 68 33	  jml [$3368]
$0f:f6b6  19 0e 47	  ora $470e,y
$0f:f6b9  02 f1		 cop #$f1
$0f:f6bb  60			rts
$0f:f6bc  94 58		 sty $58,x
$0f:f6be  2f 15 0c 42   and $420c15
$0f:f6c2  90 23		 bcc $f6e7
$0f:f6c4  0d f0 b8	  ora $b8f0
$0f:f6c7  39 c0 54	  and $54c0,y
$0f:f6ca  22 b2 40 45   jsl $4540b2
$0f:f6ce  02 81		 cop #$81
$0f:f6d0  80 c0		 bra $f692
$0f:f6d2  1e 41 81	  asl $8141,x
$0f:f6d5  0e 80 6f	  asl $6f80
$0f:f6d8  83 74		 sta $74,s
$0f:f6da  14 cc		 trb $cc
$0f:f6dc  7b			tdc
$0f:f6dd  06 06		 asl $06
$0f:f6df  b7 05		 lda [$05],y
$0f:f6e1  52 40		 eor ($40)
$0f:f6e3  10 86		 bpl $f66b
$0f:f6e5  40			rti
$0f:f6e6  23 b0		 and $b0,s
$0f:f6e8  c8			iny
$0f:f6e9  5c 02 39 10   jml $103902
$0f:f6ed  8e 4b 21	  stx $214b
$0f:f6f0  36 68		 rol $68,x
$0f:f6f2  07 fa		 ora [$fa]
$0f:f6f4  03 04		 ora $04,s
$0f:f6f6  03 04		 ora $04,s
$0f:f6f8  36 21		 rol $21,x
$0f:f6fa  0a			asl a
$0f:f6fb  88			dey
$0f:f6fc  c4 21		 cpy $21
$0f:f6fe  d0 c8		 bne $f6c8
$0f:f700  84 3d		 sty $3d
$0f:f702  8e 08 31	  stx $3108
$0f:f705  bf 40 28 4d   lda $4d2840,x
$0f:f709  25 68		 and $68
$0f:f70b  83 73		 sta $73,s
$0f:f70d  d0 61		 bne $f770
$0f:f70f  e0 a0 58	  cpx #$58a0
$0f:f712  2c 33 79	  bit $7933
$0f:f715  a6 76		 ldx $76
$0f:f717  a1 d4		 lda ($d4,x)
$0f:f719  96 58		 stx $58,y
$0f:f71b  22 32 98 cc   jsl $cc9832
$0f:f71f  07 c0		 ora [$c0]
$0f:f721  ac 1e 04	  ldy $041e
$0f:f724  02 c7		 cop #$c7
$0f:f726  00 97		 brk #$97
$0f:f728  c0 23 f0	  cpy #$f023
$0f:f72b  08			php
$0f:f72c  f0 28		 beq $f756
$0f:f72e  50 65		 bvc $f795
$0f:f730  3c 9e 75	  bit $759e,x
$0f:f733  e4 f8		 cpx $f8
$0f:f735  08			php
$0f:f736  2c 0a a1	  bit $a10a
$0f:f739  09 85 54	  ora #$5485
$0f:f73c  e5 08		 sbc $08
$0f:f73e  32 01		 and ($01)
$0f:f740  87 e1		 sta [$e1]
$0f:f742  7a			ply
$0f:f743  10 0f		 bpl $f754
$0f:f745  fc 03 ee	  jsr ($ee03,x)
$0f:f748  2a			rol a
$0f:f749  15 0a		 ora $0a,x
$0f:f74b  e8			inx
$0f:f74c  28			plp
$0f:f74d  06 e0		 asl $e0
$0f:f74f  e0 23 45	  cpx #$4523
$0f:f752  1a			inc a
$0f:f753  76 02		 ror $02,x
$0f:f755  10 bf		 bpl $f716
$0f:f757  c1 16		 cmp ($16,x)
$0f:f759  4a			lsr a
$0f:f75a  d0 78		 bne $f7d4
$0f:f75c  e4 32		 cpx $32
$0f:f75e  02 01		 cop #$01
$0f:f760  c0 69 04	  cpy #$0469
$0f:f763  ce 12 19	  dec $1912
$0f:f766  2b			pld
$0f:f767  3c 43 45	  bit $4543,x
$0f:f76a  54 10 d7	  mvn $d7,$10
$0f:f76d  bd 14 2d	  lda $2d14,x
$0f:f770  f2 a0		 sbc ($a0)
$0f:f772  70 24		 bvs $f798
$0f:f774  11 07		 ora ($07),y
$0f:f776  78			sei
$0f:f777  0e c9 32	  asl $32c9
$0f:f77a  2d f1 98	  and $98f1
$0f:f77d  40			rti
$0f:f77e  3e 04 21	  rol $2104,x
$0f:f781  25 92		 and $92
$0f:f783  74 9a		 stz $9a,x
$0f:f785  3e c0 d5	  rol $d5c0,x
$0f:f788  8f b7 ae 3f   sta $3faeb7
$0f:f78c  0e 8f c0	  asl $c08f
$0f:f78f  a3 30		 lda $30,s
$0f:f791  08			php
$0f:f792  e9 98 20	  sbc #$2098
$0f:f795  51 78		 eor ($78),y
$0f:f797  04 2e		 tsb $2e
$0f:f799  01 07		 ora ($07,x)
$0f:f79b  80 42		 bra $f7df
$0f:f79d  a0 10 28	  ldy #$2810
$0f:f7a0  24 02		 bit $02
$0f:f7a2  0c 03 00	  tsb $0003
$0f:f7a5  08			php
$0f:f7a6  c3 01		 cmp $01,s
$0f:f7a8  23 00		 and $00,s
$0f:f7aa  dc 48 3d	  jml [$3d48]
$0f:f7ad  01 01		 ora ($01,x)
$0f:f7af  52 82		 eor ($82)
$0f:f7b1  94 08		 sty $08,x
$0f:f7b3  e0 61 06	  cpx #$0661
$0f:f7b6  f0 10		 beq $f7c8
$0f:f7b8  c1 2a		 cmp ($2a,x)
$0f:f7ba  09 51 6f	  ora #$6f51
$0f:f7bd  3c 66 11	  bit $1166,x
$0f:f7c0  17 82		 ora [$82],y
$0f:f7c2  19 c0 66	  ora $66c0,y
$0f:f7c5  50 f1		 bvc $f7b8
$0f:f7c7  c0 c0 e0	  cpy #$e0c0
$0f:f7ca  10 88		 bpl $f754
$0f:f7cc  34 12		 bit $12,x
$0f:f7ce  10 de		 bpl $f7ae
$0f:f7d0  ae c7 03	  ldx $03c7
$0f:f7d3  70 82		 bvs $f757
$0f:f7d5  0a			asl a
$0f:f7d6  07 a0		 ora [$a0]
$0f:f7d8  9c 0a 41	  stz $410a
$0f:f7db  52 87		 eor ($87)
$0f:f7dd  01 24		 ora ($24,x)
$0f:f7df  12 05		 ora ($05)
$0f:f7e1  30 17		 bmi $f7fa
$0f:f7e3  c5 46		 cmp $46
$0f:f7e5  0a			asl a
$0f:f7e6  30 6f		 bmi $f857
$0f:f7e8  24 62		 bit $62
$0f:f7ea  49 24 a1	  eor #$a124
$0f:f7ed  36 42		 rol $42,x
$0f:f7ef  01 a5		 ora ($a5,x)
$0f:f7f1  d2 d6		 cmp ($d6)
$0f:f7f3  ac c7 a0	  ldy $a0c7
$0f:f7f6  d2 f9		 cmp ($f9)
$0f:f7f8  e0 12 48	  cpx #$4812
$0f:f7fb  c4 02		 cpy $02
$0f:f7fd  78			sei
$0f:f7fe  d0 1a		 bne $f81a
$0f:f800  d4 03		 pei ($03)
$0f:f802  03 18		 ora $18,s
$0f:f804  d2 9c		 cmp ($9c)
$0f:f806  01 02		 ora ($02,x)
$0f:f808  0d e1 80	  ora $80e1
$0f:f80b  8f 05 2a 49   sta $492a05
$0f:f80f  30 4e		 bmi $f85f
$0f:f811  7c 02 9d	  jmp ($9d02,x)
$0f:f814  3c 9a 41	  bit $419a,x
$0f:f817  28			plp
$0f:f818  34 98		 bit $98,x
$0f:f81a  f0 dc		 beq $f7f8
$0f:f81c  13 cb		 ora ($cb,s),y
$0f:f81e  07 82		 ora [$82]
$0f:f820  5f e0 93 64   eor $6493e0,x
$0f:f824  f7 8f		 sbc [$8f],y
$0f:f826  41 fa		 eor ($fa,x)
$0f:f828  0f d0 1e 83   ora $831ed0
$0f:f82c  73 c1		 adc ($c1,s),y
$0f:f82e  21 01		 and ($01,x)
$0f:f830  82 c4 6e	  brl $66f7
$0f:f833  50 bf		 bvc $f7f4
$0f:f835  4c 6b c7	  jmp $c76b
$0f:f838  04 e3		 tsb $e3
$0f:f83a  ca			dex
$0f:f83b  3d f1 0a	  and $0af1,x
$0f:f83e  fc 02 3d	  jsr ($3d02,x)
$0f:f841  00 87		 brk #$87
$0f:f843  40			rti
$0f:f844  20 80 21	  jsr $2180
$0f:f847  40			rti
$0f:f848  80 90		 bra $f7da
$0f:f84a  43 e1		 eor $e1,s
$0f:f84c  60			rts
$0f:f84d  c3 5b		 cmp $5b,s
$0f:f84f  70 b8		 bvs $f809
$0f:f851  ce 56 1a	  dec $1a56
$0f:f854  fd 05 ff	  sbc $ff05,x
$0f:f857  c0 02 e5	  cpy #$e502
$0f:f85a  cf 80 7c e0   cmp $e07c80
$0f:f85e  18			clc
$0f:f85f  34 40		 bit $40,x
$0f:f861  00 83		 brk #$83
$0f:f863  00 de		 brk #$de
$0f:f865  6e 05 00	  ror $0005
$0f:f868  60			rts
$0f:f869  30 0a		 bmi $f875
$0f:f86b  c7 03		 cmp [$03]
$0f:f86d  b9 10 e6	  lda $e610,y
$0f:f870  48			pha
$0f:f871  3f 85 81 13   and $138185,x
$0f:f875  00 98		 brk #$98
$0f:f877  3c 10 03	  bit $0310,x
$0f:f87a  00 18		 brk #$18
$0f:f87c  00 12		 brk #$12
$0f:f87e  28			plp
$0f:f87f  10 8c		 bpl $f80d
$0f:f881  48			pha
$0f:f882  a6 13		 ldx $13
$0f:f884  99 2c e6	  sta $e62c,y
$0f:f887  0b			phd
$0f:f888  fb			xce
$0f:f889  83 15		 sta $15,s
$0f:f88b  43 fa		 eor $fa,s
$0f:f88d  58			cli
$0f:f88e  08			php
$0f:f88f  15 ee		 ora $ee,x
$0f:f891  01 2f		 ora ($2f,x)
$0f:f893  80 48		 bra $f8dd
$0f:f895  a0 10 27	  ldy #$2710
$0f:f898  3b			tsc
$0f:f899  bb			tyx
$0f:f89a  82 10 81	  brl $79ad
$0f:f89d  08			php
$0f:f89e  7f 3a 05 fe   adc $fe053a,x
$0f:f8a2  80 ff		 bra $f8a3
$0f:f8a4  43 0a		 eor $0a,s
$0f:f8a6  d7 06		 cmp [$06],y
$0f:f8a8  f0 26		 beq $f8d0
$0f:f8aa  c6 0c		 dec $0c
$0f:f8ac  85 11		 sta $11
$0f:f8ae  52 0b		 eor ($0b)
$0f:f8b0  c0 84 1c	  cpy #$1c84
$0f:f8b3  01 e8		 ora ($e8,x)
$0f:f8b5  25 50		 and $50
$0f:f8b7  86 02		 stx $02
$0f:f8b9  d1 6f		 cmp ($6f),y
$0f:f8bb  6d fa 01	  adc $01fa
$0f:f8be  42 59		 wdm #$59
$0f:f8c0  2a			rol a
$0f:f8c1  c4 17		 cpy $17
$0f:f8c3  9e ae f6	  stz $f6ae,x
$0f:f8c6  f7 b8		 sbc [$b8],y
$0f:f8c8  84 c6		 sty $c6
$0f:f8ca  06 34		 asl $34
$0f:f8cc  80 c0		 bra $f88e
$0f:f8ce  62 2e f6	  per $eeff
$0f:f8d1  31 82		 and ($82),y
$0f:f8d3  0c 60 30	  tsb $3060
$0f:f8d6  82 40 5f	  brl $5819
$0f:f8d9  e0 00 f3	  cpx #$f300
$0f:f8dc  a0 4f c2	  ldy #$c24f
$0f:f8df  02 79		 cop #$79
$0f:f8e1  27 12		 and [$12]
$0f:f8e3  24 41		 bit $41
$0f:f8e5  c5 50		 cmp $50
$0f:f8e7  47 13		 eor [$13]
$0f:f8e9  a0 c4 62	  ldy #$62c4
$0f:f8ec  44 22 31	  mvp $31,$22
$0f:f8ef  80 30		 bra $f921
$0f:f8f1  1f a1 02 07   ora $0702a1,x
$0f:f8f5  a0 5c 68	  ldy #$685c
$0f:f8f8  01 97		 ora ($97,x)
$0f:f8fa  c0 18 46	  cpy #$4618
$0f:f8fd  80 25		 bra $f924
$0f:f8ff  13 10		 ora ($10,s),y
$0f:f901  38			sec
$0f:f902  86 1d		 stx $1d
$0f:f904  02 85		 cop #$85
$0f:f906  44 a3 33	  mvp $33,$a3
$0f:f909  88			dey
$0f:f90a  84 c0		 sty $c0
$0f:f90c  e6 10		 inc $10
$0f:f90e  b8			clv
$0f:f90f  c4 06		 cpy $06
$0f:f911  21 0c		 and ($0c,x)
$0f:f913  9e 43 60	  stz $6043,x
$0f:f916  07 f0		 ora [$f0]
$0f:f918  83 c0		 sta $c0,s
$0f:f91a  21 e8		 and ($e8,x)
$0f:f91c  21 41		 and ($41,x)
$0f:f91e  94 0e		 sty $0e,x
$0f:f920  01 e0		 ora ($e0,x)
$0f:f922  c0 68 32	  cpy #$3268
$0f:f925  13 03		 ora ($03,s),y
$0f:f927  a0 46 12	  ldy #$1246
$0f:f92a  61 a0		 adc ($a0,x)
$0f:f92c  98			tya
$0f:f92d  03 42		 ora $42,s
$0f:f92f  c1 78		 cmp ($78,x)
$0f:f931  b0 40		 bcs $f973
$0f:f933  13 e1		 ora ($e1,s),y
$0f:f935  c0 47 02	  cpy #$0247
$0f:f938  88			dey
$0f:f939  54 64 6a	  mvn $6a,$64
$0f:f93c  37 12		 and [$12],y
$0f:f93e  cd 21 0d	  cmp $0d21
$0f:f941  10 ff		 bpl $f942
$0f:f943  e9 5c 4d	  sbc #$4d5c
$0f:f946  3c 9e 5d	  bit $5d9e,x
$0f:f949  af cc a1 2e   lda $2ea1cc
$0f:f94d  98			tya
$0f:f94e  80 89		 bra $f8d9
$0f:f950  41 18		 eor ($18,x)
$0f:f952  8c 50 a8	  sty $a850
$0f:f955  5b			tcd
$0f:f956  5c 48 99 9b   jml $9b9948
$0f:f95a  20 d8 09	  jsr $09d8
$0f:f95d  e5 fa		 sbc $fa
$0f:f95f  ec 5d 0f	  cpx $0f5d
$0f:f962  05 02		 ora $02
$0f:f964  c1 61		 cmp ($61,x)
$0f:f966  9b			txy
$0f:f967  cd 33 b5	  cmp $b533
$0f:f96a  0e a4 b2	  asl $b2a4
$0f:f96d  c1 1b		 cmp ($1b,x)
$0f:f96f  9a			txs
$0f:f970  c7 22		 cmp [$22]
$0f:f972  2a			rol a
$0f:f973  b2 51		 lda ($51)
$0f:f975  85 8e		 sta $8e
$0f:f977  01 2f		 ora ($2f,x)
$0f:f979  80 47		 bra $f9c2
$0f:f97b  cd c0 0a	  cmp $0ac0
$0f:f97e  16 1a		 asl $1a,x
$0f:f980  75 e4		 adc $e4,x
$0f:f982  f8			sed
$0f:f983  08			php
$0f:f984  4c 0a a1	  jmp $a10a
$0f:f987  09 85 7a	  ora #$7a85
$0f:f98a  f3 00		 sbc ($00,s),y
$0f:f98c  e2 51		 sep #$51
$0f:f98e  87 e2		 sta [$e2]
$0f:f990  01 fe		 ora ($fe,x)
$0f:f992  2e 0f de	  rol $de0f
$0f:f995  01 67		 ora ($67,x)
$0f:f997  57 2d		 eor [$2d],y
$0f:f999  03 81		 ora $81,s
$0f:f99b  20 90 23	  jsr $2390
$0f:f99e  86 81		 stx $81
$0f:f9a0  20 52 80	  jsr $8052
$0f:f9a3  38			sec
$0f:f9a4  c7 01		 cmp [$01]
$0f:f9a6  d0 50		 bne $f9f8
$0f:f9a8  09 88 de	  ora #$de88
$0f:f9ab  4f 15 94 c2   eor $c29415
$0f:f9af  60			rts
$0f:f9b0  30 48		 bmi $f9fa
$0f:f9b2  c8			iny
$0f:f9b3  06 23		 asl $23
$0f:f9b5  c6 81		 dec $81
$0f:f9b7  83 04		 sta $04,s
$0f:f9b9  2e d7 18	  rol $18d7
$0f:f9bc  d4 56		 pei ($56)
$0f:f9be  84 35		 sty $35
$0f:f9c0  e7 45		 sbc [$45]
$0f:f9c2  08			php
$0f:f9c3  38			sec
$0f:f9c4  86 a3		 stx $a3
$0f:f9c6  10 1c		 bpl $f9e4
$0f:f9c8  88			dey
$0f:f9c9  38			sec
$0f:f9ca  30 09		 bmi $f9d5
$0f:f9cc  91 07		 sta ($07),y
$0f:f9ce  0c c2 01	  tsb $01c2
$0f:f9d1  f0 24		 beq $f9f7
$0f:f9d3  2a			rol a
$0f:f9d4  74 af		 stz $af,x
$0f:f9d6  d0 0a		 bne $f9e2
$0f:f9d8  12 c9		 ora ($c9)
$0f:f9da  56 20		 lsr $20,x
$0f:f9dc  bc f5 77	  ldy $77f5,x
$0f:f9df  b7 ba		 lda [$ba],y
$0f:f9e1  07 02		 ora [$02]
$0f:f9e3  83 c1		 sta $c1,s
$0f:f9e5  20 6e e0	  jsr $e06e
$0f:f9e8  80 44		 bra $fa2e
$0f:f9ea  60			rts
$0f:f9eb  10 18		 bpl $fa05
$0f:f9ed  08			php
$0f:f9ee  38			sec
$0f:f9ef  22 31 08 14   jsl $140831
$0f:f9f3  42 08		 wdm #$08
$0f:f9f5  9e 00 08	  stz $0800,x
$0f:f9f8  45 20		 eor $20
$0f:f9fa  11 28		 ora ($28),y
$0f:f9fc  0c 21 f0	  tsb $f021
$0f:f9ff  11 08		 ora ($08),y
$0f:fa01  08			php
$0f:fa02  a4 01		 ldy $01
$0f:fa04  f8			sed
$0f:fa05  1e e9 2c	  asl $2ce9,x
$0f:fa08  82 0e f4	  brl $ee19
$0f:fa0b  19 3b c8	  ora $c83b,y
$0f:fa0e  20 4f 92	  jsr $924f
$0f:fa11  4f 04 80 da   eor $da8004
$0f:fa15  00 10		 brk #$10
$0f:fa17  82 41 24	  brl $1e5b
$0f:fa1a  10 29		 bpl $fa45
$0f:fa1c  00 30		 brk #$30
$0f:fa1e  1f 01 00 90   ora $900001,x
$0f:fa22  83 fc		 sta $fc,s
$0f:fa24  bd b0 69	  lda $69b0,x
$0f:fa27  34 da		 bit $da,x
$0f:fa29  55 18		 eor $18,x
$0f:fa2b  a0 4d		 ldy #$4d
$0f:fa2d  28			plp
$0f:fa2e  90 aa		 bcc $f9da
$0f:fa30  45 53		 eor $53
$0f:fa32  e1 75		 sbc ($75,x)
$0f:fa34  f8			sed
$0f:fa35  f4 7a 31	  pea $317a
$0f:fa38  98			tya
$0f:fa39  04 76		 tsb $76
$0f:fa3b  01 3f		 ora ($3f,x)
$0f:fa3d  80 4e		 bra $fa8d
$0f:fa3f  e0 13		 cpx #$13
$0f:fa41  78			sei
$0f:fa42  04 3e		 tsb $3e
$0f:fa44  01 0e		 ora ($0e,x)
$0f:fa46  80 4b		 bra $fa93
$0f:fa48  a0 1c		 ldy #$1c
$0f:fa4a  0e 47 63	  asl $6347
$0f:fa4d  51 30		 eor ($30),y
$0f:fa4f  82 56 28	  brl $22a8
$0f:fa52  9a			txs
$0f:fa53  09 25 52	  ora #$5225
$0f:fa56  3d 5c 8f	  and $8f5c,x
$0f:fa59  45 a2		 eor $a2
$0f:fa5b  d3 08		 cmp ($08,s),y
$0f:fa5d  05 c2		 ora $c2
$0f:fa5f  01 f8		 ora ($f8,x)
$0f:fa61  80 6e		 bra $fad1
$0f:fa63  20 1d 88	  jsr $881d
$0f:fa66  07 81		 ora [$81]
$0f:fa68  50 3e		 bvc $faa8
$0f:fa6a  88			dey
$0f:fa6b  04 f2		 tsb $f2
$0f:fa6d  49 f3 86	  eor #$86f3
$0f:fa70  6d 61 17	  adc $1761
$0f:fa73  eb			xba
$0f:fa74  f7 fe		 sbc [$fe],y
$0f:fa76  78			sei
$0f:fa77  d1 06		 cmp ($06),y
$0f:fa79  d9 79 ff	  cmp $ff79,y
$0f:fa7c  fb			xce
$0f:fa7d  5c 6f 6f 97   jml $976f6f
$0f:fa81  81 2e		 sta ($2e,x)
$0f:fa83  84 f2		 sty $f2
$0f:fa85  01 24		 ora ($24,x)
$0f:fa87  a1 0a		 lda ($0a,x)
$0f:fa89  85 76		 sta $76
$0f:fa8b  1f fd 2e f7   ora $f72efd,x
$0f:fa8f  4a			lsr a
$0f:fa90  b1 0f		 lda ($0f),y
$0f:fa92  bc b1 72	  ldy $72b1,x
$0f:fa95  9f ff fa d8   sta $d8faff,x
$0f:fa99  2c df f9	  bit $f9df
$0f:fa9c  a4 32		 ldy $32
$0f:fa9e  31 2c		 and ($2c),y
$0f:faa0  64 a4		 stz $a4
$0f:faa2  1a			inc a
$0f:faa3  21 31		 and ($31,x)
$0f:faa5  96 c7		 stx $c7,y
$0f:faa7  a2 3b		 ldx #$3b
$0f:faa9  f9 01 3d	  sbc $3d01,y
$0f:faac  2f e8 81 91   and $9181e8
$0f:fab0  40			rti
$0f:fab1  22 16 09 05   jsl $050916
$0f:fab5  00 54		 brk #$54
$0f:fab7  63 a0		 adc $a0,s
$0f:fab9  80 ea		 bra $faa5
$0f:fabb  3b			tsc
$0f:fabc  50 68		 bvc $fb26
$0f:fabe  64 22		 stz $22
$0f:fac0  8d 3f a0	  sta $a03f
$0f:fac3  ef 38 41 70   sbc $704138
$0f:fac7  df 50 69 b0   cmp $b06950,x
$0f:facb  0b			phd
$0f:facc  3c 03 07	  bit $0703,x
$0f:facf  00 c0		 brk #$c0
$0f:fad1  c0 30		 cpy #$30
$0f:fad3  00 b2		 brk #$b2
$0f:fad5  35 06		 and $06,x
$0f:fad7  18			clc
$0f:fad8  56 1c		 lsr $1c,x
$0f:fada  0a			asl a
$0f:fadb  05 03		 ora $03
$0f:fadd  c1 e0		 cmp ($e0,x)
$0f:fadf  02 05		 cop #$05
$0f:fae1  82 e1 80	  brl $7bc5
$0f:fae4  f8			sed
$0f:fae5  2a			rol a
$0f:fae6  04 4a		 tsb $4a
$0f:fae8  0a			asl a
$0f:fae9  90 03		 bcc $faee
$0f:faeb  06 82		 asl $82
$0f:faed  20 43 03	  jsr $0343
$0f:faf0  33 40		 and ($40,s),y
$0f:faf2  e0 30		 cpx #$30
$0f:faf4  59 6d be	  eor $be6d,y
$0f:faf7  60			rts
$0f:faf8  f9 27 ca	  sbc $ca27,y
$0f:fafb  47 a0		 eor [$a0]
$0f:fafd  11 22		 ora ($22),y
$0f:faff  51 27		 eor ($27),y
$0f:fb01  c2 40		 rep #$40
$0f:fb03  48			pha
$0f:fb04  48			pha
$0f:fb05  14 22		 trb $22
$0f:fb07  09 0c e6	  ora #$e60c
$0f:fb0a  40			rti
$0f:fb0b  ca			dex
$0f:fb0c  ad cf 80	  lda $80cf
$0f:fb0f  41 c9		 eor ($c9,x)
$0f:fb11  c0 47		 cpy #$47
$0f:fb13  62 42 60	  per $5b58
$0f:fb16  07 a3		 ora [$a3]
$0f:fb18  40			rti
$0f:fb19  d8			cld
$0f:fb1a  60			rts
$0f:fb1b  2e 1c 04	  rol $041c
$0f:fb1e  b8			clv
$0f:fb1f  0e 43 40	  asl $4043
$0f:fb22  8d 21 20	  sta $2021
$0f:fb25  81 92		 sta ($92,x)
$0f:fb27  01 c0		 ora ($c0,x)
$0f:fb29  55 8b		 eor $8b,x
$0f:fb2b  38			sec
$0f:fb2c  59 60 b3	  eor $b360,y
$0f:fb2f  46 d9		 lsr $d9
$0f:fb31  2f bd 61 ee   and $ee61bd
$0f:fb35  0e 13 94	  asl $9413
$0f:fb38  42 01		 wdm #$01
$0f:fb3a  08			php
$0f:fb3b  25 0c		 and $0c
$0f:fb3d  12 08		 ora ($08)
$0f:fb3f  4a			lsr a
$0f:fb40  18			clc
$0f:fb41  88			dey
$0f:fb42  98			tya
$0f:fb43  40			rti
$0f:fb44  00 00		 brk #$00
$0f:fb46  07 b8		 ora [$b8]
$0f:fb48  1c 00 94	  trb $9400
$0f:fb4b  27 b0		 and [$b0]
$0f:fb4d  07 8e		 ora [$8e]
$0f:fb4f  00 26		 brk #$26
$0f:fb51  34 09		 bit $09,x
$0f:fb53  fc 82 5e	  jsr ($5e82,x)
$0f:fb56  7e 07 e1	  ror $e107,x
$0f:fb59  28			plp
$0f:fb5a  13 01		 ora ($01,s),y
$0f:fb5c  20 52 84	  jsr $8452
$0f:fb5f  c2 08		 rep #$08
$0f:fb61  f7 18		 sbc [$18],y
$0f:fb63  0c 06 44	  tsb $4406
$0f:fb66  6e 02 50	  ror $5002
$0f:fb69  c4 1e		 cpy $1e
$0f:fb6b  a0 ed		 ldy #$ed
$0f:fb6d  38			sec
$0f:fb6e  08			php
$0f:fb6f  d4 06		 pei ($06)
$0f:fb71  60			rts
$0f:fb72  33 08		 and ($08,s),y
$0f:fb74  08			php
$0f:fb75  e8			inx
$0f:fb76  5e e2 75	  lsr $75e2,x
$0f:fb79  2b			pld
$0f:fb7a  f8			sed
$0f:fb7b  48			pha
$0f:fb7c  6f e1 81 a7   adc $a781e1
$0f:fb80  c0 21		 cpy #$21
$0f:fb82  f0 c4		 beq $fb48
$0f:fb84  5b			tcd
$0f:fb85  29 42 40	  and #$4042
$0f:fb88  3b			tsc
$0f:fb89  0a			asl a
$0f:fb8a  84 30		 sty $30
$0f:fb8c  d2 23		 cmp ($23)
$0f:fb8e  b0 8e		 bcs $fb1e
$0f:fb90  47 21		 eor [$21]
$0f:fb92  90 88		 bcc $fb1c
$0f:fb94  c4 42		 cpy $42
$0f:fb96  70 79		 bvs $fc11
$0f:fb98  07 4b		 ora [$4b]
$0f:fb9a  47 1e		 eor [$1e]
$0f:fb9c  c2 f5		 rep #$f5
$0f:fb9e  03 db		 ora $db,s
$0f:fba0  a4 bd		 ldy $bd
$0f:fba2  89 ed 5f	  bit #$5fed
$0f:fba5  51 d8		 eor ($d8),y
$0f:fba7  20 5a 42	  jsr $425a
$0f:fbaa  af 2f fc f0   lda $f0fc2f
$0f:fbae  76 51		 ror $51,x
$0f:fbb0  87 19		 sta [$19]
$0f:fbb2  d6 ab		 dec $ab,x
$0f:fbb4  5d be df	  eor $dfbe,x
$0f:fbb7  0c a2 0a	  tsb $0aa2
$0f:fbba  87 80		 sta [$80]
$0f:fbbc  c0 26 90	  cpy #$9026
$0f:fbbf  85 dd		 sta $dd
$0f:fbc1  4f 67 b7 7b   eor $7bb767
$0f:fbc5  f8			sed
$0f:fbc6  30 14		 bmi $fbdc
$0f:fbc8  71 80		 adc ($80),y
$0f:fbca  80 70		 bra $fc3c
$0f:fbcc  78			sei
$0f:fbcd  1d 41 d2	  ora $d241,x
$0f:fbd0  0e cf 81	  asl $81cf
$0f:fbd3  c0 81 f0	  cpy #$f081
$0f:fbd6  fd ee e3	  sbc $e3ee,x
$0f:fbd9  7c 80 cc	  jmp ($cc80,x)
$0f:fbdc  9e 85 35	  stz $3585,x
$0f:fbdf  84 bd		 sty $bd
$0f:fbe1  4c 86 a0	  jmp $a086
$0f:fbe4  90 bb		 bcc $fba1
$0f:fbe6  03 94		 ora $94,s
$0f:fbe8  32 01		 and ($01)
$0f:fbea  90 e0		 bcc $fbcc
$0f:fbec  16 06		 asl $06,x
$0f:fbee  83 40		 sta $40,s
$0f:fbf0  29 81 7c	  and #$7c81
$0f:fbf3  b0 06		 bcs $fbfb
$0f:fbf5  51 14		 eor ($14),y
$0f:fbf7  80 a4		 bra $fb9d
$0f:fbf9  30 7c		 bmi $fc77
$0f:fbfb  32 fa		 and ($fa)
$0f:fbfd  17 c8		 ora [$c8],y
$0f:fbff  66 4f		 ror $4f
$0f:fc01  b0 37		 bcs $fc3a
$0f:fc03  c9 28 41	  cmp #$4128
$0f:fc06  60			rts
$0f:fc07  6f 82 b9 06   adc $06b982
$0f:fc0b  c1 1f		 cmp ($1f,x)
$0f:fc0d  26 81		 rol $81
$0f:fc0f  15 81		 ora $81,x
$0f:fc11  be 0a 60	  ldx $600a,y
$0f:fc14  fb			xce
$0f:fc15  c9 e4 f0	  cmp #$f0e4
$0f:fc18  17 87		 ora [$87],y
$0f:fc1a  72 0e		 adc ($0e)
$0f:fc1c  d1 4c		 cmp ($4c),y
$0f:fc1e  38			sec
$0f:fc1f  62 c5 2f	  per $2be7
$0f:fc22  94 40		 sty $40,x
$0f:fc24  3c 30 28	  bit $2830,x
$0f:fc27  04 0d		 tsb $0d
$0f:fc29  f6 05		 inc $05,x
$0f:fc2b  f2 82		 sbc ($82)
$0f:fc2d  3d 44 a6	  and $a644,x
$0f:fc30  12 07		 ora ($07)
$0f:fc32  e0 d1 11	  cpx #$11d1
$0f:fc35  c0 2e 04	  cpy #$042e
$0f:fc38  70 4f		 bvs $fc89
$0f:fc3a  c2 41		 rep #$41
$0f:fc3c  40			rti
$0f:fc3d  07 90		 ora [$90]
$0f:fc3f  b8			clv
$0f:fc40  4a			lsr a
$0f:fc41  a4 99		 ldy $99
$0f:fc43  0a			asl a
$0f:fc44  01 78		 ora ($78,x)
$0f:fc46  53 20		 eor ($20,s),y
$0f:fc48  74 79		 stz $79,x
$0f:fc4a  04 80		 tsb $80
$0f:fc4c  4c 58 5c	  jmp $5c58
$0f:fc4f  09 ec 0b	  ora #$0bec
$0f:fc52  e3 09		 sbc $09,s
$0f:fc54  44 00 28	  mvp $28,$00
$0f:fc57  0b			phd
$0f:fc58  c5 81		 cmp $81
$0f:fc5a  02 06		 cop #$06
$0f:fc5c  20 1e 38	  jsr $381e
$0f:fc5f  02 88		 cop #$88
$0f:fc61  d0 02		 bne $fc65
$0f:fc63  a2 1a 51	  ldx #$511a
$0f:fc66  01 50		 ora ($50,x)
$0f:fc68  04 82		 tsb $82
$0f:fc6a  c3 48		 cmp $48,s
$0f:fc6c  44 22 1b	  mvp $1b,$22
$0f:fc6f  0d 83 c3	  ora $c383
$0f:fc72  e0 30 78	  cpx #$7830
$0f:fc75  1c 1e 0b	  trb $0b1e
$0f:fc78  0e 87 c7	  asl $c787
$0f:fc7b  a3 53		 lda $53,s
$0f:fc7d  88			dey
$0f:fc7e  3b			tsc
$0f:fc7f  e8			inx
$0f:fc80  45 70		 eor $70
$0f:fc82  7f 0e 37 1b   adc $1b370e,x
$0f:fc86  57 83		 eor [$83],y
$0f:fc88  b6 db		 ldx $db,y
$0f:fc8a  78			sei
$0f:fc8b  f8			sed
$0f:fc8c  3a			dec a
$0f:fc8d  6c 26 bb	  jmp ($bb26)
$0f:fc90  5c e3 e0 92   jml $92e0e3
$0f:fc94  e1 39		 sbc ($39,x)
$0f:fc96  80 5f		 bra $fcf7
$0f:fc98  20 19 25	  jsr $2519
$0f:fc9b  00 fd		 brk #$fd
$0f:fc9d  a0 1a 38	  ldy #$381a
$0f:fca0  05 f5		 ora $f5
$0f:fca2  4c 23 50	  jmp $5023
$0f:fca5  b0 58		 bcs $fcff
$0f:fca7  38			sec
$0f:fca8  1e 08 07	  asl $0708,x
$0f:fcab  03 01		 ora $01,s
$0f:fcad  c0 59 84	  cpy #$8459
$0f:fcb0  82 61 b0	  brl $ad14
$0f:fcb3  9c 70 0c	  stz $0c70
$0f:fcb6  42 c2		 wdm #$c2
$0f:fcb8  65 f8		 adc $f8
$0f:fcba  2f c3 87 42   and $4287c3
$0f:fcbe  9a			txs
$0f:fcbf  42 3f		 wdm #$3f
$0f:fcc1  f8			sed
$0f:fcc2  17 70		 ora [$70],y
$0f:fcc4  6f 64 97 a8   adc $a89764
$0f:fcc8  25 da		 and $da
$0f:fcca  10 5e		 bpl $fd2a
$0f:fccc  0d ef ff	  ora $ffef
$0f:fccf  ef ff bf 38   sbc $38bfff
$0f:fcd3  81 ca		 sta ($ca,x)
$0f:fcd5  32 48		 and ($48)
$0f:fcd7  e4 61		 cpx $61
$0f:fcd9  b8			clv
$0f:fcda  37 f9		 and [$f9],y
$0f:fcdc  0c fb c5	  tsb $c5fb
$0f:fcdf  5a			phy
$0f:fce0  91 17		 sta ($17),y
$0f:fce2  81 ea		 sta ($ea,x)
$0f:fce4  d7 eb		 cmp [$eb],y
$0f:fce6  ff f7 ff 7d   sbc $7dfff7,x
$0f:fcea  0a			asl a
$0f:fceb  83 d5		 sta $d5,s
$0f:fced  fb			xce
$0f:fcee  9d cf 84	  sta $84cf,x
$0f:fcf1  c1 eb		 cmp ($eb,x)
$0f:fcf3  05 e0		 ora $e0
$0f:fcf5  90 7f		 bcc $fd76
$0f:fcf7  38			sec
$0f:fcf8  1f 05 c0 18   ora $18c005,x
$0f:fcfc  05 ea		 ora $ea
$0f:fcfe  b7 f8		 lda [$f8],y
$0f:fd00  1d fe 45	  ora $45fe,x
$0f:fd03  3d f0 bc	  and $bcf0,x
$0f:fd06  e2 f9		 sep #$f9
$0f:fd08  7f be df ff   adc $ffdfbe,x
$0f:fd0c  c0 29		 cpy #$29
$0f:fd0e  fa			plx
$0f:fd0f  7c 3f 93	  jmp ($933f,x)
$0f:fd12  cf 02 d0 0a   cmp $0ad002
$0f:fd16  af 0f ff f0   lda $f0ff0f
$0f:fd1a  3f 91 0f 81   and $810f91,x
$0f:fd1e  4e 2f ce	  lsr $ce2f
$0f:fd21  e3 ad		 sbc $ad,s
$0f:fd23  c8			iny
$0f:fd24  91 60		 sta ($60),y
$0f:fd26  29 5b		 and #$5b
$0f:fd28  fb			xce
$0f:fd29  fd 20 27	  sbc $2720,x
$0f:fd2c  75 ea		 adc $ea,x
$0f:fd2e  44 01 e4	  mvp $e4,$01
$0f:fd31  bf 8f 7f fc   lda $fc7f8f,x
$0f:fd35  3f 87 16 5a   and $5a1687,x
$0f:fd39  a1 74		 lda ($74,x)
$0f:fd3b  10 2c		 bpl $fd69
$0f:fd3d  c5 42		 cmp $42
$0f:fd3f  e8			inx
$0f:fd40  24 51		 bit $51
$0f:fd42  2a			rol a
$0f:fd43  42 64		 wdm #$64
$0f:fd45  50 a2		 bvc $fce9
$0f:fd47  94 84		 sty $84,x
$0f:fd49  a9 47		 lda #$47
$0f:fd4b  81 41		 sta ($41,x)
$0f:fd4d  e0 10		 cpx #$10
$0f:fd4f  37 90		 and [$90],y
$0f:fd51  9d d0 ee	  sta $eed0,x
$0f:fd54  10 2a		 bpl $fd80
$0f:fd56  24 02		 bit $02
$0f:fd58  08			php
$0f:fd59  01 10		 ora ($10,x)
$0f:fd5b  00 50		 brk #$50
$0f:fd5d  96 c3		 stx $c3,y
$0f:fd5f  21 5b		 and ($5b,x)
$0f:fd61  07 fe		 ora [$fe]
$0f:fd63  00 0f		 brk #$0f
$0f:fd65  c0 f7		 cpy #$f7
$0f:fd67  42 e0		 wdm #$e0
$0f:fd69  50 f8		 bvc $fd63
$0f:fd6b  20 c4 20	  jsr $20c4
$0f:fd6e  f0 4c		 beq $fdbc
$0f:fd70  1e 0a 07	  asl $070a,x
$0f:fd73  01 1c		 ora ($1c,x)
$0f:fd75  83 f4		 sta $f4,s
$0f:fd77  61 10		 adc ($10,x)
$0f:fd79  42 01		 wdm #$01
$0f:fd7b  e0 a0		 cpx #$a0
$0f:fd7d  90 18		 bcc $fd97
$0f:fd7f  11 24		 ora ($24),y
$0f:fd81  20 14 10	  jsr $1014
$0f:fd84  7f 97 b6 0d   adc $0db697,x
$0f:fd88  24 9b		 bit $9b
$0f:fd8a  d9 e5 f6	  cmp $f6e5,y
$0f:fd8d  59 ed f6	  eor $f6ed,y
$0f:fd90  0b			phd
$0f:fd91  3f 81 c7 60   and $60c781,x
$0f:fd95  b1 d8		 lda ($d8),y
$0f:fd97  6c 7e 37	  jmp ($377e)
$0f:fd9a  00 8c		 brk #$8c
$0f:fd9c  40			rti
$0f:fd9d  23 4f		 and $4f,s
$0f:fd9f  e0 56		 cpx #$56
$0f:fda1  09 30		 ora #$30
$0f:fda3  10 a5		 bpl $fd4a
$0f:fda5  58			cli
$0f:fda6  ae 71 70	  ldx $7071
$0f:fda9  34 c8		 bit $c8,x
$0f:fdab  45 66		 eor $66
$0f:fdad  ba			tsx
$0f:fdae  91 4e		 sta ($4e),y
$0f:fdb0  7e 2f 46	  ror $462f,x
$0f:fdb3  be 08 07	  ldx $0708,y
$0f:fdb6  de 01 a2	  dec $a201,x
$0f:fdb9  50 2d		 bvc $fde8
$0f:fdbb  d2 01		 cmp ($01)
$0f:fdbd  90 8c		 bcc $fd4b
$0f:fdbf  66 31		 ror $31
$0f:fdc1  9e 8a 65	  stz $658a,x
$0f:fdc4  e2 f9		 sep #$f9
$0f:fdc6  40			rti
$0f:fdc7  fc 60 2e	  jsr ($2e60,x)
$0f:fdca  14 0b		 trb $0b
$0f:fdcc  85 83		 sta $83
$0f:fdce  e1 e0		 sbc ($e0,x)
$0f:fdd0  80 5c		 bra $fe2e
$0f:fdd2  20 1b 06	  jsr $061b
$0f:fdd5  c1 ba		 cmp ($ba,x)
$0f:fdd7  81 d4		 sta ($d4,x)
$0f:fdd9  62 a1 9a	  per $987d
$0f:fddc  42 14		 wdm #$14
$0f:fdde  20 a1 09	  jsr $09a1
$0f:fde1  e4 02		 cpx $02
$0f:fde3  b5 42		 lda $42,x
$0f:fde5  ad 0a 86	  lda $860a
$0f:fde8  79 3c bb	  adc $bb3c,y
$0f:fdeb  5f 9c 89 bd   eor $bd899c,x
$0f:fdef  ff bb 01 9f   sbc $9f01bb,x
$0f:fdf3  5d be 1d	  eor $1dbe,x
$0f:fdf6  fa			plx
$0f:fdf7  48			pha
$0f:fdf8  df a9 e7 ff   cmp $ffe7a9,x
$0f:fdfc  b6 5d		 ldx $5d,y
$0f:fdfe  56 9a		 lsr $9a,x
$0f:fe00  36 c1		 rol $c1,x
$0f:fe02  fa			plx
$0f:fe03  4d f8 9e	  eor $9ef8
$0f:fe06  5f 81 ac 1f   eor $1fac81,x
$0f:fe0a  28			plp
$0f:fe0b  d4 12		 pei ($12)
$0f:fe0d  7f 00 9f c4   adc $c49f00,x
$0f:fe11  05 ed		 ora $ed
$0f:fe13  1e 8f 4e	  asl $4e8f,x
$0f:fe16  e7 e4		 sbc [$e4]
$0f:fe18  a2 17		 ldx #$17
$0f:fe1a  c0 7c		 cpy #$7c
$0f:fe1c  b0 18		 bcs $fe36
$0f:fe1e  02 7e		 cop #$7e
$0f:fe20  32 9c		 and ($9c)
$0f:fe22  5e 61 50	  lsr $5061,x
$0f:fe25  bf c0 4d 80   lda $804dc0,x
$0f:fe29  7f 67 09 df   adc $df0967,x
$0f:fe2d  cf f0 7f 2e   cmp $2e7ff0
$0f:fe31  27 01		 and [$01]
$0f:fe33  1f 90 4e 22   ora $224e90,x
$0f:fe37  3f 2d 71 34   and $34712d,x
$0f:fe3b  7d 5e 2f	  adc $2f5e,x
$0f:fe3e  1e c1 74	  asl $74c1,x
$0f:fe41  9f cb c9 e0   sta $e0c9cb,x
$0f:fe45  4f ef 90 fc   eor $fc90ef
$0f:fe49  14 0a		 trb $0a
$0f:fe4b  04 10		 tsb $10
$0f:fe4d  fe f1 01	  inc $01f1,x
$0f:fe50  f0 40		 beq $fe92
$0f:fe52  68			pla
$0f:fe53  10 58		 bpl $fead
$0f:fe55  05 11		 ora $11
$0f:fe57  58			cli
$0f:fe58  10 08		 bpl $fe62
$0f:fe5a  13 c0		 ora ($c0,s),y
$0f:fe5c  1f 63 00 17   ora $170063,x
$0f:fe60  00 b8		 brk #$b8
$0f:fe62  11 c0		 ora ($c0),y
$0f:fe64  8e 01 d8	  stx $d801
$0f:fe67  c8			iny
$0f:fe68  23 f1		 and $f1,s
$0f:fe6a  08			php
$0f:fe6b  7c 30 fe	  jmp ($fe30,x)
$0f:fe6e  66 e0		 ror $e0
$0f:fe70  37 05		 and [$05],y
$0f:fe72  02 40		 cop #$40
$0f:fe74  fc 0c 04	  jsr ($040c,x)
$0f:fe77  30 14		 bmi $fe8d
$0f:fe79  30 81		 bmi $fdfc
$0f:fe7b  80 aa		 bra $fe27
$0f:fe7d  c4 fe		 cpy $fe
$0f:fe7f  d0 91		 bne $fe12
$0f:fe81  f8			sed
$0f:fe82  8c 49 e6	  sty $e649
$0f:fe85  00 62		 brk #$62
$0f:fe87  07 4c		 ora [$4c]
$0f:fe89  7c b0 11	  jmp ($11b0,x)
$0f:fe8c  08			php
$0f:fe8d  3b			tsc
$0f:fe8e  cd 30 02	  cmp $0230
$0f:fe91  52 80		 eor ($80)
$0f:fe93  48			pha
$0f:fe94  01 a1		 ora ($a1,x)
$0f:fe96  04 84		 tsb $84
$0f:fe98  40			rti
$0f:fe99  e3 b1		 sbc $b1,s
$0f:fe9b  58			cli
$0f:fe9c  ec 16 1f	  cpx $1f16
$0f:fe9f  01 86		 ora ($86,x)
$0f:fea1  c0 60		 cpy #$60
$0f:fea3  b0 18		 bcs $febd
$0f:fea5  1c 05 de	  trb $de05
$0f:fea8  00 71		 brk #$71
$0f:feaa  26 09		 rol $09
$0f:feac  f9 4c 05	  sbc $054c,y
$0f:feaf  4d 84 ec	  eor $ec84
$0f:feb2  7f bc fc 5d   adc $5dfcbc,x
$0f:feb6  57 33		 eor [$33],y
$0f:feb8  30 fe		 bmi $feb8
$0f:feba  fd b7 73	  sbc $73b7,x
$0f:febd  2d dc 82	  and $82dc
$0f:fec0  f9 f6 03	  sbc $03f6,y
$0f:fec3  8d d2 01	  sta $01d2
$0f:fec6  66 03		 ror $03
$0f:fec8  88			dey
$0f:fec9  10 00		 bpl $fecb
$0f:fecb  80 22		 bra $feef
$0f:fecd  1b			tcs
$0f:fece  85 42		 sta $42
$0f:fed0  e1 40		 sbc ($40,x)
$0f:fed2  6f 05 80 12   adc $128005
$0f:fed6  26 40		 rol $40
$0f:fed8  30 aa		 bmi $fe84
$0f:feda  f5 8c		 sbc $8c,x
$0f:fedc  05 ff		 ora $ff
$0f:fede  92 79		 sta ($79)
$0f:fee0  e4 96		 cpx $96
$0f:fee2  e8			inx
$0f:fee3  45 d8		 eor $d8
$0f:fee5  54 10 08	  mvn $08,$10
$0f:fee8  c2 20		 rep #$20
$0f:feea  fb			xce
$0f:feeb  7f f6 f8 74   adc $74f8f6,x
$0f:feef  fb			xce
$0f:fef0  75 aa		 adc $aa,x
$0f:fef2  d4 61		 pei ($61)
$0f:fef4  ce 2c b9	  dec $b92c
$0f:fef7  a1 35		 lda ($35,x)
$0f:fef9  f2 30		 sbc ($30)
$0f:fefb  e6 76		 inc $76
$0f:fefd  88			dey
$0f:fefe  7b			tdc
$0f:feff  e5 9b		 sbc $9b
$0f:ff01  5c 0b d4 1b   jml $1bd40b
$0f:ff05  28			plp
$0f:ff06  dd 2e 9f	  cmp $9f2e,x
$0f:ff09  fe b4 04	  inc $04b4,x
$0f:ff0c  34 42		 bit $42,x
$0f:ff0e  47 ae		 eor [$ae]
$0f:ff10  12 f8		 ora ($f8)
$0f:ff12  9c 16 09	  stz $0916
$0f:ff15  0d 80 43	  ora $4380
$0f:ff18  a0 03		 ldy #$03
$0f:ff1a  50 83		 bvc $fe9f
$0f:ff1c  98			tya
$0f:ff1d  06 ff		 asl $ff
$0f:ff1f  7f 9e 47 e0   adc $e0479e,x
$0f:ff23  70 78		 bvs $ff9d
$0f:ff25  19 e8 a0	  ora $a0e8,y
$0f:ff28  c6 02		 dec $02
$0f:ff2a  c2 40		 rep #$40
$0f:ff2c  39 98 0e	  and $0e98,y
$0f:ff2f  85 03		 sta $03
$0f:ff31  e1 30		 sbc ($30,x)
$0f:ff33  5a			phy
$0f:ff34  02 d0		 cop #$d0
$0f:ff36  38			sec
$0f:ff37  0b			phd
$0f:ff38  b1 e2		 lda ($e2),y
$0f:ff3a  71 2d		 adc ($2d),y
$0f:ff3c  9e cd c7	  stz $c7cd,x
$0f:ff3f  e3 81		 sbc $81,s
$0f:ff41  f0 f0		 beq $ff33
$0f:ff43  2d 01 10	  and $1001
$0f:ff46  77 e9		 adc [$e9],y
$0f:ff48  04 f6		 tsb $f6
$0f:ff4a  c3 9d		 cmp $9d,s
$0f:ff4c  b2 0c		 lda ($0c)
$0f:ff4e  c0 6f		 cpy #$6f
$0f:ff50  17 eb		 ora [$eb],y
$0f:ff52  ff ee fe 43   sbc $43feee,x
$0f:ff56  02 3b		 cop #$3b
$0f:ff58  6b			rtl
$0f:ff59  24 1d		 bit $1d
$0f:ff5b  0e 06 c0	  asl $c006
$0f:ff5e  ac 3a 02	  ldy $023a
$0f:ff61  c2 f3		 rep #$f3
$0f:ff63  3d 93 83	  and $8393,x
$0f:ff66  21 f0		 and ($f0,x)
$0f:ff68  0b			phd
$0f:ff69  64 6b		 stz $6b
$0f:ff6b  1f eb 38 28   ora $2838eb,x
$0f:ff6f  77 de		 adc [$de],y
$0f:ff71  24 57		 bit $57
$0f:ff73  c9 0e 81	  cmp #$810e
$0f:ff76  0e 53 ff	  asl $ff53
$0f:ff79  ff fe 7f ff   sbc $ff7ffe,x
$0f:ff7d  6c 21 80	  jmp ($8021)
$0f:ff80  c0 d1 2b	  cpy #$2bd1
$0f:ff83  00 33		 brk #$33
$0f:ff85  07 c2		 ora [$c2]
$0f:ff87  21 e0		 and ($e0,x)
$0f:ff89  90 58		 bcc $ffe3
$0f:ff8b  28			plp
$0f:ff8c  06 80		 asl $80
$0f:ff8e  4d 9f 32	  eor $329f
$0f:ff91  31 f8		 and ($f8),y
$0f:ff93  69 07 03	  adc #$0307
$0f:ff96  c1 80		 cmp ($80,x)
$0f:ff98  54 28 10	  mvn $10,$28
$0f:ff9b  42 00		 wdm #$00
$0f:ff9d  00 28		 brk #$28
$0f:ff9f  28			plp
$0f:ffa0  6d 40 f3	  adc $f340
$0f:ffa3  58			cli
$0f:ffa4  79 71 0a	  adc $0a71,y
$0f:ffa7  00 14		 brk #$14
$0f:ffa9  00 1e		 brk #$1e
$0f:ffab  00 ec		 brk #$ec
$0f:ffad  00 d6		 brk #$d6
$0f:ffaf  01 1e		 ora ($1e,x)
$0f:ffb1  03 df		 ora $df,s
$0f:ffb3  63 90		 adc $90,s
$0f:ffb5  29 98 4a	  and #$4a98
$0f:ffb8  5e 63 10	  lsr $1063,x
$0f:ffbb  42 00		 wdm #$00
$0f:ffbd  00 aa		 brk #$aa
$0f:ffbf  00 10		 brk #$10
$0f:ffc1  01 76		 ora ($76,x)
$0f:ffc3  01 fe		 ora ($fe,x)
$0f:ffc5  01 80		 ora ($80,x)
$0f:ffc7  30 c0		 bmi $ff89
$0f:ffc9  50 00		 bvc $ffcb
$0f:ffcb  71 05		 adc ($05),y
$0f:ffcd  02 0a		 cop #$0a
$0f:ffcf  03 cf		 ora $cf,s
$0f:ffd1  03 7f		 ora $7f,s
$0f:ffd3  32 90		 and ($90)
$0f:ffd5  29 98 4a	  and #$4a98
$0f:ffd8  5e 63 00	  lsr $0063,x
$0f:ffdb  50 00		 bvc $ffdd
$0f:ffdd  00 85		 brk #$85
$0f:ffdf  08			php
$0f:ffe0  ea			nop
$0f:ffe1  10 6f		 bpl $0052
$0f:ffe3  19 d4 21	  ora $21d4,y
$0f:ffe6  59 2a 3c	  eor $3c2a,y
$0f:ffe9  53 a5		 eor ($a5,s),y
$0f:ffeb  3d 6b 52	  and $526b,x
$0f:ffee  32 73		 and ($73)
$0f:fff0  49 25 ee	  eor #$ee25
$0f:fff3  39 93 4e	  and $4e93,y
$0f:fff6  38			sec
$0f:fff7  63 dd		 adc $dd,s
$0f:fff9  77 00		 adc [$00],y
$0f:fffb  00 e0		 brk #$e0
$0f:fffd  78			sei
$0f:fffe  1c 00 41	  trb $4100
