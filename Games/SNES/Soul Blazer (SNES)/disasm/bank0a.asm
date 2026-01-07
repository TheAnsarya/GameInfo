; Soul Blazer (SNES) - Bank $0a
; Disassembled from ROM
; File offset: $050000-$057fff
; CPU address: $0a:$8000-$0a:$ffff
;===========================================================

.bank $0a
.org $8000

$0a:8000  34 80		 bit $80,x
$0a:8002  3e 80 48	  rol $4880,x
$0a:8005  80 52		 bra $8059
$0a:8007  80 5c		 bra $8065
$0a:8009  80 8e		 bra $7f99
$0a:800b  80 c0		 bra $7fcd
$0a:800d  80 f2		 bra $8001
$0a:800f  80 24		 bra $8035
$0a:8011  81 56		 sta ($56,x)
$0a:8013  81 88		 sta ($88,x)
$0a:8015  81 ba		 sta ($ba,x)
$0a:8017  81 ec		 sta ($ec,x)
$0a:8019  81 1e		 sta ($1e,x)
$0a:801b  82 50 82	  brl $026e
$0a:801e  82 82 b4	  brl $34a3
$0a:8021  82 e6 82	  brl $030a
$0a:8024  18			clc
$0a:8025  83 4a		 sta $4a,s
$0a:8027  83 7c		 sta $7c,s
$0a:8029  83 9e		 sta $9e,s
$0a:802b  83 c0		 sta $c0,s
$0a:802d  83 d2		 sta $d2,s
$0a:802f  83 e4		 sta $e4,s
$0a:8031  83 f6		 sta $f6,s
$0a:8033  83 00		 sta $00,s
$0a:8035  00 00		 brk #$00
$0a:8037  00 00		 brk #$00
$0a:8039  00 08		 brk #$08
$0a:803b  84 ff		 sty $ff
$0a:803d  ff 00 00 00   sbc $000000,x
$0a:8041  00 00		 brk #$00
$0a:8043  00 2b		 brk #$2b
$0a:8045  84 ff		 sty $ff
$0a:8047  ff 00 00 00   sbc $000000,x
$0a:804b  00 00		 brk #$00
$0a:804d  00 4e		 brk #$4e
$0a:804f  84 ff		 sty $ff
$0a:8051  ff 00 00 00   sbc $000000,x
$0a:8055  00 00		 brk #$00
$0a:8057  00 71		 brk #$71
$0a:8059  84 ff		 sty $ff
$0a:805b  ff 03 00 00   sbc $000003,x
$0a:805f  00 02		 brk #$02
$0a:8061  00 da		 brk #$da
$0a:8063  84 03		 sty $03
$0a:8065  00 00		 brk #$00
$0a:8067  00 02		 brk #$02
$0a:8069  00 fd		 brk #$fd
$0a:806b  84 03		 sty $03
$0a:806d  00 00		 brk #$00
$0a:806f  00 02		 brk #$02
$0a:8071  00 20		 brk #$20
$0a:8073  85 03		 sta $03
$0a:8075  00 00		 brk #$00
$0a:8077  00 02		 brk #$02
$0a:8079  00 43		 brk #$43
$0a:807b  85 03		 sta $03
$0a:807d  00 00		 brk #$00
$0a:807f  00 02		 brk #$02
$0a:8081  00 94		 brk #$94
$0a:8083  84 03		 sty $03
$0a:8085  00 00		 brk #$00
$0a:8087  00 02		 brk #$02
$0a:8089  00 b7		 brk #$b7
$0a:808b  84 ff		 sty $ff
$0a:808d  ff 03 00 00   sbc $000003,x
$0a:8091  00 fe		 brk #$fe
$0a:8093  ff 94 84 03   sbc $038494,x
$0a:8097  00 00		 brk #$00
$0a:8099  00 fe		 brk #$fe
$0a:809b  ff 43 85 03   sbc $038543,x
$0a:809f  00 00		 brk #$00
$0a:80a1  00 fe		 brk #$fe
$0a:80a3  ff 20 85 03   sbc $038520,x
$0a:80a7  00 00		 brk #$00
$0a:80a9  00 fe		 brk #$fe
$0a:80ab  ff fd 84 03   sbc $0384fd,x
$0a:80af  00 00		 brk #$00
$0a:80b1  00 fe		 brk #$fe
$0a:80b3  ff da 84 03   sbc $0384da,x
$0a:80b7  00 00		 brk #$00
$0a:80b9  00 fe		 brk #$fe
$0a:80bb  ff b7 84 ff   sbc $ff84b7,x
$0a:80bf  ff 03 00 00   sbc $000003,x
$0a:80c3  00 fe		 brk #$fe
$0a:80c5  ff ac 85 03   sbc $0385ac,x
$0a:80c9  00 00		 brk #$00
$0a:80cb  00 fe		 brk #$fe
$0a:80cd  ff cf 85 03   sbc $0385cf,x
$0a:80d1  00 00		 brk #$00
$0a:80d3  00 fe		 brk #$fe
$0a:80d5  ff f2 85 03   sbc $0385f2,x
$0a:80d9  00 00		 brk #$00
$0a:80db  00 fe		 brk #$fe
$0a:80dd  ff 15 86 03   sbc $038615,x
$0a:80e1  00 00		 brk #$00
$0a:80e3  00 fe		 brk #$fe
$0a:80e5  ff 66 85 03   sbc $038566,x
$0a:80e9  00 00		 brk #$00
$0a:80eb  00 fe		 brk #$fe
$0a:80ed  ff 89 85 ff   sbc $ff8589,x
$0a:80f1  ff 03 00 00   sbc $000003,x
$0a:80f5  00 02		 brk #$02
$0a:80f7  00 66		 brk #$66
$0a:80f9  85 03		 sta $03
$0a:80fb  00 00		 brk #$00
$0a:80fd  00 02		 brk #$02
$0a:80ff  00 15		 brk #$15
$0a:8101  86 03		 stx $03
$0a:8103  00 00		 brk #$00
$0a:8105  00 02		 brk #$02
$0a:8107  00 f2		 brk #$f2
$0a:8109  85 03		 sta $03
$0a:810b  00 00		 brk #$00
$0a:810d  00 02		 brk #$02
$0a:810f  00 cf		 brk #$cf
$0a:8111  85 03		 sta $03
$0a:8113  00 00		 brk #$00
$0a:8115  00 02		 brk #$02
$0a:8117  00 ac		 brk #$ac
$0a:8119  85 03		 sta $03
$0a:811b  00 00		 brk #$00
$0a:811d  00 02		 brk #$02
$0a:811f  00 89		 brk #$89
$0a:8121  85 ff		 sta $ff
$0a:8123  ff 03 00 fe   sbc $fe0003,x
$0a:8127  ff 00 00 7e   sbc $7e0000,x
$0a:812b  86 03		 stx $03
$0a:812d  00 fe		 brk #$fe
$0a:812f  ff 00 00 a1   sbc $a10000,x
$0a:8133  86 03		 stx $03
$0a:8135  00 fe		 brk #$fe
$0a:8137  ff 00 00 c4   sbc $c40000,x
$0a:813b  86 03		 stx $03
$0a:813d  00 fe		 brk #$fe
$0a:813f  ff 00 00 e7   sbc $e70000,x
$0a:8143  86 03		 stx $03
$0a:8145  00 fe		 brk #$fe
$0a:8147  ff 00 00 38   sbc $380000,x
$0a:814b  86 03		 stx $03
$0a:814d  00 fe		 brk #$fe
$0a:814f  ff 00 00 5b   sbc $5b0000,x
$0a:8153  86 ff		 stx $ff
$0a:8155  ff 03 00 02   sbc $020003,x
$0a:8159  00 00		 brk #$00
$0a:815b  00 38		 brk #$38
$0a:815d  86 03		 stx $03
$0a:815f  00 02		 brk #$02
$0a:8161  00 00		 brk #$00
$0a:8163  00 e7		 brk #$e7
$0a:8165  86 03		 stx $03
$0a:8167  00 02		 brk #$02
$0a:8169  00 00		 brk #$00
$0a:816b  00 c4		 brk #$c4
$0a:816d  86 03		 stx $03
$0a:816f  00 02		 brk #$02
$0a:8171  00 00		 brk #$00
$0a:8173  00 a1		 brk #$a1
$0a:8175  86 03		 stx $03
$0a:8177  00 02		 brk #$02
$0a:8179  00 00		 brk #$00
$0a:817b  00 7e		 brk #$7e
$0a:817d  86 03		 stx $03
$0a:817f  00 02		 brk #$02
$0a:8181  00 00		 brk #$00
$0a:8183  00 5b		 brk #$5b
$0a:8185  86 ff		 stx $ff
$0a:8187  ff 03 00 02   sbc $020003,x
$0a:818b  00 00		 brk #$00
$0a:818d  00 50		 brk #$50
$0a:818f  87 03		 sta [$03]
$0a:8191  00 02		 brk #$02
$0a:8193  00 00		 brk #$00
$0a:8195  00 73		 brk #$73
$0a:8197  87 03		 sta [$03]
$0a:8199  00 02		 brk #$02
$0a:819b  00 00		 brk #$00
$0a:819d  00 96		 brk #$96
$0a:819f  87 03		 sta [$03]
$0a:81a1  00 02		 brk #$02
$0a:81a3  00 00		 brk #$00
$0a:81a5  00 b9		 brk #$b9
$0a:81a7  87 03		 sta [$03]
$0a:81a9  00 02		 brk #$02
$0a:81ab  00 00		 brk #$00
$0a:81ad  00 0a		 brk #$0a
$0a:81af  87 03		 sta [$03]
$0a:81b1  00 02		 brk #$02
$0a:81b3  00 00		 brk #$00
$0a:81b5  00 2d		 brk #$2d
$0a:81b7  87 ff		 sta [$ff]
$0a:81b9  ff 03 00 fe   sbc $fe0003,x
$0a:81bd  ff 00 00 0a   sbc $0a0000,x
$0a:81c1  87 03		 sta [$03]
$0a:81c3  00 fe		 brk #$fe
$0a:81c5  ff 00 00 b9   sbc $b90000,x
$0a:81c9  87 03		 sta [$03]
$0a:81cb  00 fe		 brk #$fe
$0a:81cd  ff 00 00 96   sbc $960000,x
$0a:81d1  87 03		 sta [$03]
$0a:81d3  00 fe		 brk #$fe
$0a:81d5  ff 00 00 73   sbc $730000,x
$0a:81d9  87 03		 sta [$03]
$0a:81db  00 fe		 brk #$fe
$0a:81dd  ff 00 00 50   sbc $500000,x
$0a:81e1  87 03		 sta [$03]
$0a:81e3  00 fe		 brk #$fe
$0a:81e5  ff 00 00 2d   sbc $2d0000,x
$0a:81e9  87 ff		 sta [$ff]
$0a:81eb  ff 03 00 02   sbc $020003,x
$0a:81ef  00 00		 brk #$00
$0a:81f1  00 45		 brk #$45
$0a:81f3  88			dey
$0a:81f4  03 00		 ora $00,s
$0a:81f6  02 00		 cop #$00
$0a:81f8  00 00		 brk #$00
$0a:81fa  68			pla
$0a:81fb  88			dey
$0a:81fc  03 00		 ora $00,s
$0a:81fe  02 00		 cop #$00
$0a:8200  00 00		 brk #$00
$0a:8202  8b			phb
$0a:8203  88			dey
$0a:8204  03 00		 ora $00,s
$0a:8206  02 00		 cop #$00
$0a:8208  00 00		 brk #$00
$0a:820a  dc 87 03	  jml [$0387]
$0a:820d  00 02		 brk #$02
$0a:820f  00 00		 brk #$00
$0a:8211  00 ff		 brk #$ff
$0a:8213  87 03		 sta [$03]
$0a:8215  00 02		 brk #$02
$0a:8217  00 00		 brk #$00
$0a:8219  00 22		 brk #$22
$0a:821b  88			dey
$0a:821c  ff ff 03 00   sbc $0003ff,x
$0a:8220  fe ff 00	  inc $00ff,x
$0a:8223  00 ff		 brk #$ff
$0a:8225  87 03		 sta [$03]
$0a:8227  00 fe		 brk #$fe
$0a:8229  ff 00 00 dc   sbc $dc0000,x
$0a:822d  87 03		 sta [$03]
$0a:822f  00 fe		 brk #$fe
$0a:8231  ff 00 00 8b   sbc $8b0000,x
$0a:8235  88			dey
$0a:8236  03 00		 ora $00,s
$0a:8238  fe ff 00	  inc $00ff,x
$0a:823b  00 68		 brk #$68
$0a:823d  88			dey
$0a:823e  03 00		 ora $00,s
$0a:8240  fe ff 00	  inc $00ff,x
$0a:8243  00 45		 brk #$45
$0a:8245  88			dey
$0a:8246  03 00		 ora $00,s
$0a:8248  fe ff 00	  inc $00ff,x
$0a:824b  00 22		 brk #$22
$0a:824d  88			dey
$0a:824e  ff ff 03 00   sbc $0003ff,x
$0a:8252  fe ff 00	  inc $00ff,x
$0a:8255  00 17		 brk #$17
$0a:8257  89 03		 bit #$03
$0a:8259  00 fe		 brk #$fe
$0a:825b  ff 00 00 3a   sbc $3a0000,x
$0a:825f  89 03		 bit #$03
$0a:8261  00 fe		 brk #$fe
$0a:8263  ff 00 00 5d   sbc $5d0000,x
$0a:8267  89 03		 bit #$03
$0a:8269  00 fe		 brk #$fe
$0a:826b  ff 00 00 ae   sbc $ae0000,x
$0a:826f  88			dey
$0a:8270  03 00		 ora $00,s
$0a:8272  fe ff 00	  inc $00ff,x
$0a:8275  00 d1		 brk #$d1
$0a:8277  88			dey
$0a:8278  03 00		 ora $00,s
$0a:827a  fe ff 00	  inc $00ff,x
$0a:827d  00 f4		 brk #$f4
$0a:827f  88			dey
$0a:8280  ff ff 03 00   sbc $0003ff,x
$0a:8284  02 00		 cop #$00
$0a:8286  00 00		 brk #$00
$0a:8288  d1 88		 cmp ($88),y
$0a:828a  03 00		 ora $00,s
$0a:828c  02 00		 cop #$00
$0a:828e  00 00		 brk #$00
$0a:8290  ae 88 03	  ldx $0388
$0a:8293  00 02		 brk #$02
$0a:8295  00 00		 brk #$00
$0a:8297  00 5d		 brk #$5d
$0a:8299  89 03		 bit #$03
$0a:829b  00 02		 brk #$02
$0a:829d  00 00		 brk #$00
$0a:829f  00 3a		 brk #$3a
$0a:82a1  89 03		 bit #$03
$0a:82a3  00 02		 brk #$02
$0a:82a5  00 00		 brk #$00
$0a:82a7  00 17		 brk #$17
$0a:82a9  89 03		 bit #$03
$0a:82ab  00 02		 brk #$02
$0a:82ad  00 00		 brk #$00
$0a:82af  00 f4		 brk #$f4
$0a:82b1  88			dey
$0a:82b2  ff ff 03 00   sbc $0003ff,x
$0a:82b6  00 00		 brk #$00
$0a:82b8  02 00		 cop #$00
$0a:82ba  e9 89		 sbc #$89
$0a:82bc  03 00		 ora $00,s
$0a:82be  00 00		 brk #$00
$0a:82c0  02 00		 cop #$00
$0a:82c2  0c 8a 03	  tsb $038a
$0a:82c5  00 00		 brk #$00
$0a:82c7  00 02		 brk #$02
$0a:82c9  00 2f		 brk #$2f
$0a:82cb  8a			txa
$0a:82cc  03 00		 ora $00,s
$0a:82ce  00 00		 brk #$00
$0a:82d0  02 00		 cop #$00
$0a:82d2  80 89		 bra $825d
$0a:82d4  03 00		 ora $00,s
$0a:82d6  00 00		 brk #$00
$0a:82d8  02 00		 cop #$00
$0a:82da  a3 89		 lda $89,s
$0a:82dc  03 00		 ora $00,s
$0a:82de  00 00		 brk #$00
$0a:82e0  02 00		 cop #$00
$0a:82e2  c6 89		 dec $89
$0a:82e4  ff ff 03 00   sbc $0003ff,x
$0a:82e8  00 00		 brk #$00
$0a:82ea  fe ff a3	  inc $a3ff,x
$0a:82ed  89 03		 bit #$03
$0a:82ef  00 00		 brk #$00
$0a:82f1  00 fe		 brk #$fe
$0a:82f3  ff 80 89 03   sbc $038980,x
$0a:82f7  00 00		 brk #$00
$0a:82f9  00 fe		 brk #$fe
$0a:82fb  ff 2f 8a 03   sbc $038a2f,x
$0a:82ff  00 00		 brk #$00
$0a:8301  00 fe		 brk #$fe
$0a:8303  ff 0c 8a 03   sbc $038a0c,x
$0a:8307  00 00		 brk #$00
$0a:8309  00 fe		 brk #$fe
$0a:830b  ff e9 89 03   sbc $0389e9,x
$0a:830f  00 00		 brk #$00
$0a:8311  00 fe		 brk #$fe
$0a:8313  ff c6 89 ff   sbc $ff89c6,x
$0a:8317  ff 03 00 00   sbc $000003,x
$0a:831b  00 fe		 brk #$fe
$0a:831d  ff bb 8a 03   sbc $038abb,x
$0a:8321  00 00		 brk #$00
$0a:8323  00 fe		 brk #$fe
$0a:8325  ff de 8a 03   sbc $038ade,x
$0a:8329  00 00		 brk #$00
$0a:832b  00 fe		 brk #$fe
$0a:832d  ff 01 8b 03   sbc $038b01,x
$0a:8331  00 00		 brk #$00
$0a:8333  00 fe		 brk #$fe
$0a:8335  ff 52 8a 03   sbc $038a52,x
$0a:8339  00 00		 brk #$00
$0a:833b  00 fe		 brk #$fe
$0a:833d  ff 75 8a 03   sbc $038a75,x
$0a:8341  00 00		 brk #$00
$0a:8343  00 fe		 brk #$fe
$0a:8345  ff 98 8a ff   sbc $ff8a98,x
$0a:8349  ff 03 00 00   sbc $000003,x
$0a:834d  00 02		 brk #$02
$0a:834f  00 75		 brk #$75
$0a:8351  8a			txa
$0a:8352  03 00		 ora $00,s
$0a:8354  00 00		 brk #$00
$0a:8356  02 00		 cop #$00
$0a:8358  52 8a		 eor ($8a)
$0a:835a  03 00		 ora $00,s
$0a:835c  00 00		 brk #$00
$0a:835e  02 00		 cop #$00
$0a:8360  01 8b		 ora ($8b,x)
$0a:8362  03 00		 ora $00,s
$0a:8364  00 00		 brk #$00
$0a:8366  02 00		 cop #$00
$0a:8368  de 8a 03	  dec $038a,x
$0a:836b  00 00		 brk #$00
$0a:836d  00 02		 brk #$02
$0a:836f  00 bb		 brk #$bb
$0a:8371  8a			txa
$0a:8372  03 00		 ora $00,s
$0a:8374  00 00		 brk #$00
$0a:8376  02 00		 cop #$00
$0a:8378  98			tya
$0a:8379  8a			txa
$0a:837a  ff ff 07 00   sbc $0007ff,x
$0a:837e  00 00		 brk #$00
$0a:8380  ff ff 24 8b   sbc $8b24ff,x
$0a:8384  07 00		 ora [$00]
$0a:8386  00 00		 brk #$00
$0a:8388  ff ff 47 8b   sbc $8b47ff,x
$0a:838c  07 00		 ora [$00]
$0a:838e  00 00		 brk #$00
$0a:8390  ff ff 6a 8b   sbc $8b6aff,x
$0a:8394  07 00		 ora [$00]
$0a:8396  00 00		 brk #$00
$0a:8398  ff ff 8d 8b   sbc $8b8dff,x
$0a:839c  ff ff 07 00   sbc $0007ff,x
$0a:83a0  00 00		 brk #$00
$0a:83a2  01 00		 ora ($00,x)
$0a:83a4  8d 8b 07	  sta $078b
$0a:83a7  00 00		 brk #$00
$0a:83a9  00 01		 brk #$01
$0a:83ab  00 6a		 brk #$6a
$0a:83ad  8b			phb
$0a:83ae  07 00		 ora [$00]
$0a:83b0  00 00		 brk #$00
$0a:83b2  01 00		 ora ($00,x)
$0a:83b4  47 8b		 eor [$8b]
$0a:83b6  07 00		 ora [$00]
$0a:83b8  00 00		 brk #$00
$0a:83ba  01 00		 ora ($00,x)
$0a:83bc  24 8b		 bit $8b
$0a:83be  ff ff 09 00   sbc $0009ff,x
$0a:83c2  00 00		 brk #$00
$0a:83c4  00 00		 brk #$00
$0a:83c6  b0 8b		 bcs $8353
$0a:83c8  09 00		 ora #$00
$0a:83ca  00 00		 brk #$00
$0a:83cc  00 00		 brk #$00
$0a:83ce  d3 8b		 cmp ($8b,s),y
$0a:83d0  ff ff 09 00   sbc $0009ff,x
$0a:83d4  00 00		 brk #$00
$0a:83d6  00 00		 brk #$00
$0a:83d8  f6 8b		 inc $8b,x
$0a:83da  09 00		 ora #$00
$0a:83dc  00 00		 brk #$00
$0a:83de  00 00		 brk #$00
$0a:83e0  19 8c ff	  ora $ff8c,y
$0a:83e3  ff 09 00 00   sbc $000009,x
$0a:83e7  00 00		 brk #$00
$0a:83e9  00 3c		 brk #$3c
$0a:83eb  8c 09 00	  sty $0009
$0a:83ee  00 00		 brk #$00
$0a:83f0  00 00		 brk #$00
$0a:83f2  5f 8c ff ff   eor $ffff8c,x
$0a:83f6  09 00		 ora #$00
$0a:83f8  00 00		 brk #$00
$0a:83fa  00 00		 brk #$00
$0a:83fc  82 8c 09	  brl $8d8b
$0a:83ff  00 00		 brk #$00
$0a:8401  00 00		 brk #$00
$0a:8403  00 a5		 brk #$a5
$0a:8405  8c ff ff	  sty $ffff
$0a:8408  00 00		 brk #$00
$0a:840a  10 00		 bpl $840c
$0a:840c  20 00 00	  jsr $0000
$0a:840f  00 10		 brk #$10
$0a:8411  00 10		 brk #$10
$0a:8413  00 03		 brk #$03
$0a:8415  00 01		 brk #$01
$0a:8417  00 00		 brk #$00
$0a:8419  00 10		 brk #$10
$0a:841b  00 0a		 brk #$0a
$0a:841d  01 00		 ora ($00,x)
$0a:841f  00 08		 brk #$08
$0a:8421  08			php
$0a:8422  20 0a 01	  jsr $010a
$0a:8425  00 00		 brk #$00
$0a:8427  10 00		 bpl $8429
$0a:8429  40			rti
$0a:842a  0a			asl a
$0a:842b  00 00		 brk #$00
$0a:842d  10 00		 bpl $842f
$0a:842f  20 00 00	  jsr $0000
$0a:8432  00 10		 brk #$10
$0a:8434  00 10		 brk #$10
$0a:8436  00 03		 brk #$03
$0a:8438  00 01		 brk #$01
$0a:843a  00 00		 brk #$00
$0a:843c  00 10		 brk #$10
$0a:843e  02 0a		 cop #$0a
$0a:8440  01 00		 ora ($00,x)
$0a:8442  00 08		 brk #$08
$0a:8444  08			php
$0a:8445  60			rts
$0a:8446  0a			asl a
$0a:8447  01 00		 ora ($00,x)
$0a:8449  00 10		 brk #$10
$0a:844b  00 80		 brk #$80
$0a:844d  0a			asl a
$0a:844e  00 00		 brk #$00
$0a:8450  10 00		 bpl $8452
$0a:8452  20 00 00	  jsr $0000
$0a:8455  00 10		 brk #$10
$0a:8457  00 10		 brk #$10
$0a:8459  00 03		 brk #$03
$0a:845b  00 01		 brk #$01
$0a:845d  00 00		 brk #$00
$0a:845f  00 10		 brk #$10
$0a:8461  04 0a		 tsb $0a
$0a:8463  01 00		 ora ($00,x)
$0a:8465  00 08		 brk #$08
$0a:8467  08			php
$0a:8468  a0 0a 01	  ldy #$010a
$0a:846b  00 00		 brk #$00
$0a:846d  10 00		 bpl $846f
$0a:846f  c0 0a 00	  cpy #$000a
$0a:8472  00 10		 brk #$10
$0a:8474  00 20		 brk #$20
$0a:8476  00 00		 brk #$00
$0a:8478  00 10		 brk #$10
$0a:847a  00 10		 brk #$10
$0a:847c  00 03		 brk #$03
$0a:847e  00 01		 brk #$01
$0a:8480  00 00		 brk #$00
$0a:8482  00 10		 brk #$10
$0a:8484  06 0a		 asl $0a
$0a:8486  01 00		 ora ($00,x)
$0a:8488  00 08		 brk #$08
$0a:848a  08			php
$0a:848b  a0 4a 01	  ldy #$014a
$0a:848e  00 00		 brk #$00
$0a:8490  10 00		 bpl $8492
$0a:8492  c0 4a 00	  cpy #$004a
$0a:8495  00 10		 brk #$10
$0a:8497  00 20		 brk #$20
$0a:8499  00 00		 brk #$00
$0a:849b  00 10		 brk #$10
$0a:849d  00 10		 brk #$10
$0a:849f  00 03		 brk #$03
$0a:84a1  00 01		 brk #$01
$0a:84a3  00 00		 brk #$00
$0a:84a5  00 10		 brk #$10
$0a:84a7  00 0a		 brk #$0a
$0a:84a9  01 00		 ora ($00,x)
$0a:84ab  00 08		 brk #$08
$0a:84ad  08			php
$0a:84ae  22 0a 01 00   jsl $00010a
$0a:84b2  00 10		 brk #$10
$0a:84b4  00 42		 brk #$42
$0a:84b6  0a			asl a
$0a:84b7  00 00		 brk #$00
$0a:84b9  10 00		 bpl $84bb
$0a:84bb  1f 00 00 00   ora $000000,x
$0a:84bf  10 00		 bpl $84c1
$0a:84c1  10 00		 bpl $84c3
$0a:84c3  03 00		 ora $00,s
$0a:84c5  01 00		 ora ($00,x)
$0a:84c7  00 00		 brk #$00
$0a:84c9  0f 00 0a 01   ora $010a00
$0a:84cd  00 00		 brk #$00
$0a:84cf  07 08		 ora [$08]
$0a:84d1  24 0a		 bit $0a
$0a:84d3  01 00		 ora ($00,x)
$0a:84d5  00 0f		 brk #$0f
$0a:84d7  00 44		 brk #$44
$0a:84d9  0a			asl a
$0a:84da  00 00		 brk #$00
$0a:84dc  10 00		 bpl $84de
$0a:84de  20 00 00	  jsr $0000
$0a:84e1  00 10		 brk #$10
$0a:84e3  00 10		 brk #$10
$0a:84e5  00 03		 brk #$03
$0a:84e7  00 01		 brk #$01
$0a:84e9  00 00		 brk #$00
$0a:84eb  00 10		 brk #$10
$0a:84ed  00 0a		 brk #$0a
$0a:84ef  01 00		 ora ($00,x)
$0a:84f1  00 08		 brk #$08
$0a:84f3  08			php
$0a:84f4  22 0a 01 00   jsl $00010a
$0a:84f8  00 10		 brk #$10
$0a:84fa  00 46		 brk #$46
$0a:84fc  0a			asl a
$0a:84fd  01 00		 ora ($00,x)
$0a:84ff  10 00		 bpl $8501
$0a:8501  20 00 00	  jsr $0000
$0a:8504  00 10		 brk #$10
$0a:8506  00 10		 brk #$10
$0a:8508  00 03		 brk #$03
$0a:850a  00 01		 brk #$01
$0a:850c  01 00		 ora ($00,x)
$0a:850e  00 10		 brk #$10
$0a:8510  00 0a		 brk #$0a
$0a:8512  01 00		 ora ($00,x)
$0a:8514  01 08		 ora ($08,x)
$0a:8516  08			php
$0a:8517  22 4a 01 00   jsl $00014a
$0a:851b  01 10		 ora ($10,x)
$0a:851d  00 42		 brk #$42
$0a:851f  4a			lsr a
$0a:8520  01 00		 ora ($00,x)
$0a:8522  10 00		 bpl $8524
$0a:8524  1f 00 00 00   ora $000000,x
$0a:8528  10 00		 bpl $852a
$0a:852a  10 00		 bpl $852c
$0a:852c  03 00		 ora $00,s
$0a:852e  01 01		 ora ($01,x)
$0a:8530  00 00		 brk #$00
$0a:8532  0f 00 0a 01   ora $010a00
$0a:8536  00 01		 brk #$01
$0a:8538  07 08		 ora [$08]
$0a:853a  24 4a		 bit $4a
$0a:853c  01 00		 ora ($00,x)
$0a:853e  01 0f		 ora ($0f,x)
$0a:8540  00 44		 brk #$44
$0a:8542  4a			lsr a
$0a:8543  01 00		 ora ($00,x)
$0a:8545  10 00		 bpl $8547
$0a:8547  20 00 00	  jsr $0000
$0a:854a  00 10		 brk #$10
$0a:854c  00 10		 brk #$10
$0a:854e  00 03		 brk #$03
$0a:8550  00 01		 brk #$01
$0a:8552  01 00		 ora ($00,x)
$0a:8554  00 10		 brk #$10
$0a:8556  00 0a		 brk #$0a
$0a:8558  01 00		 ora ($00,x)
$0a:855a  01 08		 ora ($08,x)
$0a:855c  08			php
$0a:855d  22 4a 01 00   jsl $00014a
$0a:8561  01 10		 ora ($10,x)
$0a:8563  00 46		 brk #$46
$0a:8565  4a			lsr a
$0a:8566  00 00		 brk #$00
$0a:8568  10 00		 bpl $856a
$0a:856a  21 00		 and ($00,x)
$0a:856c  ff ff 10 00   sbc $0010ff,x
$0a:8570  10 00		 bpl $8572
$0a:8572  03 00		 ora $00,s
$0a:8574  01 00		 ora ($00,x)
$0a:8576  00 00		 brk #$00
$0a:8578  10 02		 bpl $857c
$0a:857a  0a			asl a
$0a:857b  01 00		 ora ($00,x)
$0a:857d  00 08		 brk #$08
$0a:857f  08			php
$0a:8580  62 0a 01	  per $868d
$0a:8583  00 00		 brk #$00
$0a:8585  10 00		 bpl $8587
$0a:8587  82 0a 00	  brl $8594
$0a:858a  00 10		 brk #$10
$0a:858c  00 20		 brk #$20
$0a:858e  00 00		 brk #$00
$0a:8590  00 10		 brk #$10
$0a:8592  00 10		 brk #$10
$0a:8594  00 03		 brk #$03
$0a:8596  00 01		 brk #$01
$0a:8598  00 00		 brk #$00
$0a:859a  00 10		 brk #$10
$0a:859c  02 0a		 cop #$0a
$0a:859e  01 00		 ora ($00,x)
$0a:85a0  00 08		 brk #$08
$0a:85a2  08			php
$0a:85a3  64 0a		 stz $0a
$0a:85a5  01 00		 ora ($00,x)
$0a:85a7  00 10		 brk #$10
$0a:85a9  00 84		 brk #$84
$0a:85ab  0a			asl a
$0a:85ac  00 00		 brk #$00
$0a:85ae  10 00		 bpl $85b0
$0a:85b0  21 00		 and ($00,x)
$0a:85b2  ff ff 10 00   sbc $0010ff,x
$0a:85b6  10 00		 bpl $85b8
$0a:85b8  03 00		 ora $00,s
$0a:85ba  01 00		 ora ($00,x)
$0a:85bc  00 00		 brk #$00
$0a:85be  10 02		 bpl $85c2
$0a:85c0  0a			asl a
$0a:85c1  01 00		 ora ($00,x)
$0a:85c3  00 08		 brk #$08
$0a:85c5  08			php
$0a:85c6  62 0a 01	  per $86d3
$0a:85c9  00 00		 brk #$00
$0a:85cb  10 00		 bpl $85cd
$0a:85cd  86 0a		 stx $0a
$0a:85cf  01 00		 ora ($00,x)
$0a:85d1  10 00		 bpl $85d3
$0a:85d3  21 00		 and ($00,x)
$0a:85d5  ff ff 10 00   sbc $0010ff,x
$0a:85d9  10 00		 bpl $85db
$0a:85db  03 00		 ora $00,s
$0a:85dd  01 01		 ora ($01,x)
$0a:85df  00 00		 brk #$00
$0a:85e1  10 02		 bpl $85e5
$0a:85e3  0a			asl a
$0a:85e4  01 00		 ora ($00,x)
$0a:85e6  01 08		 ora ($08,x)
$0a:85e8  08			php
$0a:85e9  62 4a 01	  per $8736
$0a:85ec  00 01		 brk #$01
$0a:85ee  10 00		 bpl $85f0
$0a:85f0  82 4a 01	  brl $873d
$0a:85f3  00 10		 brk #$10
$0a:85f5  00 20		 brk #$20
$0a:85f7  00 00		 brk #$00
$0a:85f9  00 10		 brk #$10
$0a:85fb  00 10		 brk #$10
$0a:85fd  00 03		 brk #$03
$0a:85ff  00 01		 brk #$01
$0a:8601  01 00		 ora ($00,x)
$0a:8603  00 10		 brk #$10
$0a:8605  02 0a		 cop #$0a
$0a:8607  01 00		 ora ($00,x)
$0a:8609  01 08		 ora ($08,x)
$0a:860b  08			php
$0a:860c  64 4a		 stz $4a
$0a:860e  01 00		 ora ($00,x)
$0a:8610  01 10		 ora ($10,x)
$0a:8612  00 84		 brk #$84
$0a:8614  4a			lsr a
$0a:8615  01 00		 ora ($00,x)
$0a:8617  10 00		 bpl $8619
$0a:8619  21 00		 and ($00,x)
$0a:861b  ff ff 10 00   sbc $0010ff,x
$0a:861f  10 00		 bpl $8621
$0a:8621  03 00		 ora $00,s
$0a:8623  01 01		 ora ($01,x)
$0a:8625  00 00		 brk #$00
$0a:8627  10 02		 bpl $862b
$0a:8629  0a			asl a
$0a:862a  01 00		 ora ($00,x)
$0a:862c  01 08		 ora ($08,x)
$0a:862e  08			php
$0a:862f  62 4a 01	  per $877c
$0a:8632  00 01		 brk #$01
$0a:8634  10 00		 bpl $8636
$0a:8636  86 4a		 stx $4a
$0a:8638  00 00		 brk #$00
$0a:863a  10 00		 bpl $863c
$0a:863c  20 00 00	  jsr $0000
$0a:863f  00 10		 brk #$10
$0a:8641  00 10		 brk #$10
$0a:8643  00 03		 brk #$03
$0a:8645  00 01		 brk #$01
$0a:8647  00 00		 brk #$00
$0a:8649  00 10		 brk #$10
$0a:864b  04 0a		 tsb $0a
$0a:864d  01 00		 ora ($00,x)
$0a:864f  00 08		 brk #$08
$0a:8651  08			php
$0a:8652  a6 0a		 ldx $0a
$0a:8654  01 00		 ora ($00,x)
$0a:8656  00 10		 brk #$10
$0a:8658  00 c2		 brk #$c2
$0a:865a  0a			asl a
$0a:865b  00 00		 brk #$00
$0a:865d  10 00		 bpl $865f
$0a:865f  1f 00 00 00   ora $000000,x
$0a:8663  10 00		 bpl $8665
$0a:8665  10 00		 bpl $8667
$0a:8667  03 00		 ora $00,s
$0a:8669  01 00		 ora ($00,x)
$0a:866b  00 00		 brk #$00
$0a:866d  0f 04 0a 01   ora $010a04
$0a:8671  00 00		 brk #$00
$0a:8673  07 08		 ora [$08]
$0a:8675  a4 0a		 ldy $0a
$0a:8677  01 00		 ora ($00,x)
$0a:8679  00 0f		 brk #$0f
$0a:867b  00 c4		 brk #$c4
$0a:867d  0a			asl a
$0a:867e  00 00		 brk #$00
$0a:8680  10 00		 bpl $8682
$0a:8682  20 00 00	  jsr $0000
$0a:8685  00 10		 brk #$10
$0a:8687  00 10		 brk #$10
$0a:8689  00 03		 brk #$03
$0a:868b  00 01		 brk #$01
$0a:868d  00 00		 brk #$00
$0a:868f  00 10		 brk #$10
$0a:8691  04 0a		 tsb $0a
$0a:8693  01 00		 ora ($00,x)
$0a:8695  00 08		 brk #$08
$0a:8697  08			php
$0a:8698  a6 0a		 ldx $0a
$0a:869a  01 00		 ora ($00,x)
$0a:869c  00 10		 brk #$10
$0a:869e  00 c6		 brk #$c6
$0a:86a0  0a			asl a
$0a:86a1  00 00		 brk #$00
$0a:86a3  10 00		 bpl $86a5
$0a:86a5  20 00 00	  jsr $0000
$0a:86a8  00 10		 brk #$10
$0a:86aa  00 10		 brk #$10
$0a:86ac  00 03		 brk #$03
$0a:86ae  00 01		 brk #$01
$0a:86b0  00 00		 brk #$00
$0a:86b2  00 10		 brk #$10
$0a:86b4  04 0a		 tsb $0a
$0a:86b6  01 00		 ora ($00,x)
$0a:86b8  00 09		 brk #$09
$0a:86ba  07 a8		 ora [$a8]
$0a:86bc  0a			asl a
$0a:86bd  01 00		 ora ($00,x)
$0a:86bf  00 10		 brk #$10
$0a:86c1  00 c8		 brk #$c8
$0a:86c3  0a			asl a
$0a:86c4  00 00		 brk #$00
$0a:86c6  10 00		 bpl $86c8
$0a:86c8  1f 00 00 00   ora $000000,x
$0a:86cc  10 00		 bpl $86ce
$0a:86ce  10 00		 bpl $86d0
$0a:86d0  03 00		 ora $00,s
$0a:86d2  01 00		 ora ($00,x)
$0a:86d4  00 00		 brk #$00
$0a:86d6  0f 04 0a 01   ora $010a04
$0a:86da  00 00		 brk #$00
$0a:86dc  07 08		 ora [$08]
$0a:86de  aa			tax
$0a:86df  0a			asl a
$0a:86e0  01 00		 ora ($00,x)
$0a:86e2  00 0f		 brk #$0f
$0a:86e4  00 ca		 brk #$ca
$0a:86e6  0a			asl a
$0a:86e7  00 00		 brk #$00
$0a:86e9  10 00		 bpl $86eb
$0a:86eb  20 00 00	  jsr $0000
$0a:86ee  00 10		 brk #$10
$0a:86f0  00 10		 brk #$10
$0a:86f2  00 03		 brk #$03
$0a:86f4  00 01		 brk #$01
$0a:86f6  00 00		 brk #$00
$0a:86f8  00 10		 brk #$10
$0a:86fa  04 0a		 tsb $0a
$0a:86fc  01 00		 ora ($00,x)
$0a:86fe  00 09		 brk #$09
$0a:8700  07 a8		 ora [$a8]
$0a:8702  0a			asl a
$0a:8703  01 00		 ora ($00,x)
$0a:8705  00 10		 brk #$10
$0a:8707  00 cc		 brk #$cc
$0a:8709  0a			asl a
$0a:870a  00 00		 brk #$00
$0a:870c  10 00		 bpl $870e
$0a:870e  20 00 00	  jsr $0000
$0a:8711  00 10		 brk #$10
$0a:8713  00 10		 brk #$10
$0a:8715  00 03		 brk #$03
$0a:8717  00 01		 brk #$01
$0a:8719  00 00		 brk #$00
$0a:871b  00 10		 brk #$10
$0a:871d  06 0a		 asl $0a
$0a:871f  01 00		 ora ($00,x)
$0a:8721  00 09		 brk #$09
$0a:8723  07 a8		 ora [$a8]
$0a:8725  4a			lsr a
$0a:8726  01 00		 ora ($00,x)
$0a:8728  00 10		 brk #$10
$0a:872a  00 c8		 brk #$c8
$0a:872c  4a			lsr a
$0a:872d  00 00		 brk #$00
$0a:872f  10 00		 bpl $8731
$0a:8731  1f 00 00 00   ora $000000,x
$0a:8735  10 00		 bpl $8737
$0a:8737  10 00		 bpl $8739
$0a:8739  03 00		 ora $00,s
$0a:873b  01 00		 ora ($00,x)
$0a:873d  00 00		 brk #$00
$0a:873f  0f 06 0a 01   ora $010a06
$0a:8743  00 00		 brk #$00
$0a:8745  07 08		 ora [$08]
$0a:8747  aa			tax
$0a:8748  4a			lsr a
$0a:8749  01 00		 ora ($00,x)
$0a:874b  00 0f		 brk #$0f
$0a:874d  00 ca		 brk #$ca
$0a:874f  4a			lsr a
$0a:8750  00 00		 brk #$00
$0a:8752  10 00		 bpl $8754
$0a:8754  20 00 00	  jsr $0000
$0a:8757  00 10		 brk #$10
$0a:8759  00 10		 brk #$10
$0a:875b  00 03		 brk #$03
$0a:875d  00 01		 brk #$01
$0a:875f  00 00		 brk #$00
$0a:8761  00 10		 brk #$10
$0a:8763  06 0a		 asl $0a
$0a:8765  01 00		 ora ($00,x)
$0a:8767  00 09		 brk #$09
$0a:8769  07 a8		 ora [$a8]
$0a:876b  4a			lsr a
$0a:876c  01 00		 ora ($00,x)
$0a:876e  00 10		 brk #$10
$0a:8770  00 cc		 brk #$cc
$0a:8772  4a			lsr a
$0a:8773  00 00		 brk #$00
$0a:8775  10 00		 bpl $8777
$0a:8777  20 00 00	  jsr $0000
$0a:877a  00 10		 brk #$10
$0a:877c  00 10		 brk #$10
$0a:877e  00 03		 brk #$03
$0a:8780  00 01		 brk #$01
$0a:8782  00 00		 brk #$00
$0a:8784  00 10		 brk #$10
$0a:8786  06 0a		 asl $0a
$0a:8788  01 00		 ora ($00,x)
$0a:878a  00 08		 brk #$08
$0a:878c  08			php
$0a:878d  a6 4a		 ldx $4a
$0a:878f  01 00		 ora ($00,x)
$0a:8791  00 10		 brk #$10
$0a:8793  00 c2		 brk #$c2
$0a:8795  4a			lsr a
$0a:8796  00 00		 brk #$00
$0a:8798  10 00		 bpl $879a
$0a:879a  1f 00 00 00   ora $000000,x
$0a:879e  10 00		 bpl $87a0
$0a:87a0  10 00		 bpl $87a2
$0a:87a2  03 00		 ora $00,s
$0a:87a4  01 00		 ora ($00,x)
$0a:87a6  00 00		 brk #$00
$0a:87a8  0f 06 0a 01   ora $010a06
$0a:87ac  00 00		 brk #$00
$0a:87ae  07 08		 ora [$08]
$0a:87b0  a4 4a		 ldy $4a
$0a:87b2  01 00		 ora ($00,x)
$0a:87b4  00 0f		 brk #$0f
$0a:87b6  00 c4		 brk #$c4
$0a:87b8  4a			lsr a
$0a:87b9  00 00		 brk #$00
$0a:87bb  10 00		 bpl $87bd
$0a:87bd  20 00 00	  jsr $0000
$0a:87c0  00 10		 brk #$10
$0a:87c2  00 10		 brk #$10
$0a:87c4  00 03		 brk #$03
$0a:87c6  00 01		 brk #$01
$0a:87c8  00 00		 brk #$00
$0a:87ca  00 10		 brk #$10
$0a:87cc  06 0a		 asl $0a
$0a:87ce  01 00		 ora ($00,x)
$0a:87d0  00 08		 brk #$08
$0a:87d2  08			php
$0a:87d3  a6 4a		 ldx $4a
$0a:87d5  01 00		 ora ($00,x)
$0a:87d7  00 10		 brk #$10
$0a:87d9  00 c6		 brk #$c6
$0a:87db  4a			lsr a
$0a:87dc  00 00		 brk #$00
$0a:87de  10 00		 bpl $87e0
$0a:87e0  20 00 00	  jsr $0000
$0a:87e3  00 10		 brk #$10
$0a:87e5  00 10		 brk #$10
$0a:87e7  00 03		 brk #$03
$0a:87e9  00 01		 brk #$01
$0a:87eb  00 00		 brk #$00
$0a:87ed  00 10		 brk #$10
$0a:87ef  00 0a		 brk #$0a
$0a:87f1  01 00		 ora ($00,x)
$0a:87f3  00 08		 brk #$08
$0a:87f5  08			php
$0a:87f6  28			plp
$0a:87f7  0a			asl a
$0a:87f8  01 00		 ora ($00,x)
$0a:87fa  00 10		 brk #$10
$0a:87fc  00 48		 brk #$48
$0a:87fe  0a			asl a
$0a:87ff  00 00		 brk #$00
$0a:8801  10 00		 bpl $8803
$0a:8803  20 00 00	  jsr $0000
$0a:8806  00 10		 brk #$10
$0a:8808  00 10		 brk #$10
$0a:880a  00 03		 brk #$03
$0a:880c  00 01		 brk #$01
$0a:880e  00 00		 brk #$00
$0a:8810  00 10		 brk #$10
$0a:8812  00 0a		 brk #$0a
$0a:8814  01 00		 ora ($00,x)
$0a:8816  00 08		 brk #$08
$0a:8818  08			php
$0a:8819  2a			rol a
$0a:881a  0a			asl a
$0a:881b  01 00		 ora ($00,x)
$0a:881d  00 10		 brk #$10
$0a:881f  00 4a		 brk #$4a
$0a:8821  0a			asl a
$0a:8822  00 00		 brk #$00
$0a:8824  10 00		 bpl $8826
$0a:8826  1f 00 00 00   ora $000000,x
$0a:882a  10 00		 bpl $882c
$0a:882c  10 00		 bpl $882e
$0a:882e  03 00		 ora $00,s
$0a:8830  01 00		 ora ($00,x)
$0a:8832  00 00		 brk #$00
$0a:8834  0f 00 0a 01   ora $010a00
$0a:8838  00 00		 brk #$00
$0a:883a  08			php
$0a:883b  07 2a		 ora [$2a]
$0a:883d  0a			asl a
$0a:883e  01 00		 ora ($00,x)
$0a:8840  00 0f		 brk #$0f
$0a:8842  00 4c		 brk #$4c
$0a:8844  0a			asl a
$0a:8845  00 00		 brk #$00
$0a:8847  10 00		 bpl $8849
$0a:8849  20 00 00	  jsr $0000
$0a:884c  00 10		 brk #$10
$0a:884e  00 10		 brk #$10
$0a:8850  00 03		 brk #$03
$0a:8852  00 01		 brk #$01
$0a:8854  00 00		 brk #$00
$0a:8856  00 10		 brk #$10
$0a:8858  00 0a		 brk #$0a
$0a:885a  01 00		 ora ($00,x)
$0a:885c  00 08		 brk #$08
$0a:885e  08			php
$0a:885f  2a			rol a
$0a:8860  0a			asl a
$0a:8861  01 00		 ora ($00,x)
$0a:8863  00 10		 brk #$10
$0a:8865  00 4e		 brk #$4e
$0a:8867  0a			asl a
$0a:8868  00 00		 brk #$00
$0a:886a  10 00		 bpl $886c
$0a:886c  20 00 00	  jsr $0000
$0a:886f  00 10		 brk #$10
$0a:8871  00 10		 brk #$10
$0a:8873  00 03		 brk #$03
$0a:8875  00 01		 brk #$01
$0a:8877  00 00		 brk #$00
$0a:8879  00 10		 brk #$10
$0a:887b  00 0a		 brk #$0a
$0a:887d  01 00		 ora ($00,x)
$0a:887f  00 08		 brk #$08
$0a:8881  08			php
$0a:8882  28			plp
$0a:8883  0a			asl a
$0a:8884  01 00		 ora ($00,x)
$0a:8886  00 10		 brk #$10
$0a:8888  00 2c		 brk #$2c
$0a:888a  0a			asl a
$0a:888b  00 00		 brk #$00
$0a:888d  10 00		 bpl $888f
$0a:888f  1f 00 00 00   ora $000000,x
$0a:8893  10 00		 bpl $8895
$0a:8895  10 00		 bpl $8897
$0a:8897  03 00		 ora $00,s
$0a:8899  01 00		 ora ($00,x)
$0a:889b  00 00		 brk #$00
$0a:889d  0f 00 0a 01   ora $010a00
$0a:88a1  00 00		 brk #$00
$0a:88a3  08			php
$0a:88a4  07 28		 ora [$28]
$0a:88a6  0a			asl a
$0a:88a7  01 00		 ora ($00,x)
$0a:88a9  00 0f		 brk #$0f
$0a:88ab  00 2e		 brk #$2e
$0a:88ad  0a			asl a
$0a:88ae  00 00		 brk #$00
$0a:88b0  10 00		 bpl $88b2
$0a:88b2  20 00 00	  jsr $0000
$0a:88b5  00 10		 brk #$10
$0a:88b7  00 10		 brk #$10
$0a:88b9  00 03		 brk #$03
$0a:88bb  00 01		 brk #$01
$0a:88bd  00 00		 brk #$00
$0a:88bf  00 10		 brk #$10
$0a:88c1  02 0a		 cop #$0a
$0a:88c3  01 00		 ora ($00,x)
$0a:88c5  00 08		 brk #$08
$0a:88c7  08			php
$0a:88c8  68			pla
$0a:88c9  0a			asl a
$0a:88ca  01 00		 ora ($00,x)
$0a:88cc  00 10		 brk #$10
$0a:88ce  00 88		 brk #$88
$0a:88d0  0a			asl a
$0a:88d1  00 00		 brk #$00
$0a:88d3  10 00		 bpl $88d5
$0a:88d5  20 00 00	  jsr $0000
$0a:88d8  00 10		 brk #$10
$0a:88da  00 10		 brk #$10
$0a:88dc  00 03		 brk #$03
$0a:88de  00 01		 brk #$01
$0a:88e0  00 00		 brk #$00
$0a:88e2  00 10		 brk #$10
$0a:88e4  02 0a		 cop #$0a
$0a:88e6  01 00		 ora ($00,x)
$0a:88e8  00 08		 brk #$08
$0a:88ea  08			php
$0a:88eb  6a			ror a
$0a:88ec  0a			asl a
$0a:88ed  01 00		 ora ($00,x)
$0a:88ef  00 10		 brk #$10
$0a:88f1  00 8a		 brk #$8a
$0a:88f3  0a			asl a
$0a:88f4  00 00		 brk #$00
$0a:88f6  10 00		 bpl $88f8
$0a:88f8  1f 00 00 00   ora $000000,x
$0a:88fc  10 00		 bpl $88fe
$0a:88fe  10 00		 bpl $8900
$0a:8900  03 00		 ora $00,s
$0a:8902  01 00		 ora ($00,x)
$0a:8904  00 00		 brk #$00
$0a:8906  0f 02 0a 01   ora $010a02
$0a:890a  00 00		 brk #$00
$0a:890c  08			php
$0a:890d  07 6a		 ora [$6a]
$0a:890f  0a			asl a
$0a:8910  01 00		 ora ($00,x)
$0a:8912  00 0f		 brk #$0f
$0a:8914  00 8c		 brk #$8c
$0a:8916  0a			asl a
$0a:8917  00 00		 brk #$00
$0a:8919  10 00		 bpl $891b
$0a:891b  20 00 00	  jsr $0000
$0a:891e  00 10		 brk #$10
$0a:8920  00 10		 brk #$10
$0a:8922  00 03		 brk #$03
$0a:8924  00 01		 brk #$01
$0a:8926  00 00		 brk #$00
$0a:8928  00 10		 brk #$10
$0a:892a  02 0a		 cop #$0a
$0a:892c  01 00		 ora ($00,x)
$0a:892e  00 08		 brk #$08
$0a:8930  08			php
$0a:8931  6a			ror a
$0a:8932  0a			asl a
$0a:8933  01 00		 ora ($00,x)
$0a:8935  00 10		 brk #$10
$0a:8937  00 8e		 brk #$8e
$0a:8939  0a			asl a
$0a:893a  00 00		 brk #$00
$0a:893c  10 00		 bpl $893e
$0a:893e  20 00 00	  jsr $0000
$0a:8941  00 10		 brk #$10
$0a:8943  00 10		 brk #$10
$0a:8945  00 03		 brk #$03
$0a:8947  00 01		 brk #$01
$0a:8949  00 00		 brk #$00
$0a:894b  00 10		 brk #$10
$0a:894d  02 0a		 cop #$0a
$0a:894f  01 00		 ora ($00,x)
$0a:8951  00 08		 brk #$08
$0a:8953  08			php
$0a:8954  68			pla
$0a:8955  0a			asl a
$0a:8956  01 00		 ora ($00,x)
$0a:8958  00 10		 brk #$10
$0a:895a  00 6c		 brk #$6c
$0a:895c  0a			asl a
$0a:895d  00 00		 brk #$00
$0a:895f  10 00		 bpl $8961
$0a:8961  1f 00 00 00   ora $000000,x
$0a:8965  10 00		 bpl $8967
$0a:8967  10 00		 bpl $8969
$0a:8969  03 00		 ora $00,s
$0a:896b  01 00		 ora ($00,x)
$0a:896d  00 00		 brk #$00
$0a:896f  0f 02 0a 01   ora $010a02
$0a:8973  00 00		 brk #$00
$0a:8975  08			php
$0a:8976  07 68		 ora [$68]
$0a:8978  0a			asl a
$0a:8979  01 00		 ora ($00,x)
$0a:897b  00 0f		 brk #$0f
$0a:897d  00 6e		 brk #$6e
$0a:897f  0a			asl a
$0a:8980  00 00		 brk #$00
$0a:8982  10 00		 bpl $8984
$0a:8984  20 00 00	  jsr $0000
$0a:8987  00 10		 brk #$10
$0a:8989  00 10		 brk #$10
$0a:898b  00 03		 brk #$03
$0a:898d  00 01		 brk #$01
$0a:898f  00 00		 brk #$00
$0a:8991  00 10		 brk #$10
$0a:8993  04 0a		 tsb $0a
$0a:8995  01 00		 ora ($00,x)
$0a:8997  00 09		 brk #$09
$0a:8999  07 e0		 ora [$e0]
$0a:899b  0a			asl a
$0a:899c  01 00		 ora ($00,x)
$0a:899e  00 10		 brk #$10
$0a:89a0  00 00		 brk #$00
$0a:89a2  0b			phd
$0a:89a3  00 00		 brk #$00
$0a:89a5  10 00		 bpl $89a7
$0a:89a7  20 00 00	  jsr $0000
$0a:89aa  00 10		 brk #$10
$0a:89ac  00 10		 brk #$10
$0a:89ae  00 03		 brk #$03
$0a:89b0  00 01		 brk #$01
$0a:89b2  00 00		 brk #$00
$0a:89b4  00 10		 brk #$10
$0a:89b6  04 0a		 tsb $0a
$0a:89b8  01 00		 ora ($00,x)
$0a:89ba  00 09		 brk #$09
$0a:89bc  07 e2		 ora [$e2]
$0a:89be  0a			asl a
$0a:89bf  01 00		 ora ($00,x)
$0a:89c1  00 10		 brk #$10
$0a:89c3  00 02		 brk #$02
$0a:89c5  0b			phd
$0a:89c6  00 00		 brk #$00
$0a:89c8  10 00		 bpl $89ca
$0a:89ca  1f 00 00 00   ora $000000,x
$0a:89ce  10 00		 bpl $89d0
$0a:89d0  10 00		 bpl $89d2
$0a:89d2  03 00		 ora $00,s
$0a:89d4  01 00		 ora ($00,x)
$0a:89d6  00 00		 brk #$00
$0a:89d8  0f 04 0a 01   ora $010a04
$0a:89dc  00 00		 brk #$00
$0a:89de  09 06		 ora #$06
$0a:89e0  e2 0a		 sep #$0a
$0a:89e2  01 00		 ora ($00,x)
$0a:89e4  00 0f		 brk #$0f
$0a:89e6  00 04		 brk #$04
$0a:89e8  0b			phd
$0a:89e9  00 00		 brk #$00
$0a:89eb  10 00		 bpl $89ed
$0a:89ed  20 00 00	  jsr $0000
$0a:89f0  00 10		 brk #$10
$0a:89f2  00 10		 brk #$10
$0a:89f4  00 03		 brk #$03
$0a:89f6  00 01		 brk #$01
$0a:89f8  00 00		 brk #$00
$0a:89fa  00 10		 brk #$10
$0a:89fc  04 0a		 tsb $0a
$0a:89fe  01 00		 ora ($00,x)
$0a:8a00  00 09		 brk #$09
$0a:8a02  07 e2		 ora [$e2]
$0a:8a04  0a			asl a
$0a:8a05  01 00		 ora ($00,x)
$0a:8a07  00 10		 brk #$10
$0a:8a09  00 06		 brk #$06
$0a:8a0b  0b			phd
$0a:8a0c  00 00		 brk #$00
$0a:8a0e  10 00		 bpl $8a10
$0a:8a10  20 00 00	  jsr $0000
$0a:8a13  00 10		 brk #$10
$0a:8a15  00 10		 brk #$10
$0a:8a17  00 03		 brk #$03
$0a:8a19  00 01		 brk #$01
$0a:8a1b  00 00		 brk #$00
$0a:8a1d  00 10		 brk #$10
$0a:8a1f  04 0a		 tsb $0a
$0a:8a21  01 00		 ora ($00,x)
$0a:8a23  00 09		 brk #$09
$0a:8a25  07 e0		 ora [$e0]
$0a:8a27  0a			asl a
$0a:8a28  01 00		 ora ($00,x)
$0a:8a2a  00 10		 brk #$10
$0a:8a2c  00 e4		 brk #$e4
$0a:8a2e  0a			asl a
$0a:8a2f  00 00		 brk #$00
$0a:8a31  10 00		 bpl $8a33
$0a:8a33  1f 00 00 00   ora $000000,x
$0a:8a37  10 00		 bpl $8a39
$0a:8a39  10 00		 bpl $8a3b
$0a:8a3b  03 00		 ora $00,s
$0a:8a3d  01 00		 ora ($00,x)
$0a:8a3f  00 00		 brk #$00
$0a:8a41  0f 04 0a 01   ora $010a04
$0a:8a45  00 00		 brk #$00
$0a:8a47  09 06		 ora #$06
$0a:8a49  e0 0a 01	  cpx #$010a
$0a:8a4c  00 00		 brk #$00
$0a:8a4e  0f 00 e6 0a   ora $0ae600
$0a:8a52  00 00		 brk #$00
$0a:8a54  10 00		 bpl $8a56
$0a:8a56  20 00 00	  jsr $0000
$0a:8a59  00 10		 brk #$10
$0a:8a5b  00 10		 brk #$10
$0a:8a5d  00 03		 brk #$03
$0a:8a5f  00 01		 brk #$01
$0a:8a61  00 00		 brk #$00
$0a:8a63  00 10		 brk #$10
$0a:8a65  06 0a		 asl $0a
$0a:8a67  01 00		 ora ($00,x)
$0a:8a69  00 09		 brk #$09
$0a:8a6b  07 e8		 ora [$e8]
$0a:8a6d  0a			asl a
$0a:8a6e  01 00		 ora ($00,x)
$0a:8a70  00 10		 brk #$10
$0a:8a72  00 08		 brk #$08
$0a:8a74  0b			phd
$0a:8a75  00 00		 brk #$00
$0a:8a77  10 00		 bpl $8a79
$0a:8a79  20 00 00	  jsr $0000
$0a:8a7c  00 10		 brk #$10
$0a:8a7e  00 10		 brk #$10
$0a:8a80  00 03		 brk #$03
$0a:8a82  00 01		 brk #$01
$0a:8a84  00 00		 brk #$00
$0a:8a86  00 10		 brk #$10
$0a:8a88  06 0a		 asl $0a
$0a:8a8a  01 00		 ora ($00,x)
$0a:8a8c  00 09		 brk #$09
$0a:8a8e  07 ea		 ora [$ea]
$0a:8a90  0a			asl a
$0a:8a91  01 00		 ora ($00,x)
$0a:8a93  00 10		 brk #$10
$0a:8a95  00 0a		 brk #$0a
$0a:8a97  0b			phd
$0a:8a98  00 00		 brk #$00
$0a:8a9a  10 00		 bpl $8a9c
$0a:8a9c  1f 00 00 00   ora $000000,x
$0a:8aa0  10 00		 bpl $8aa2
$0a:8aa2  10 00		 bpl $8aa4
$0a:8aa4  03 00		 ora $00,s
$0a:8aa6  01 00		 ora ($00,x)
$0a:8aa8  00 00		 brk #$00
$0a:8aaa  0f 06 0a 01   ora $010a06
$0a:8aae  00 00		 brk #$00
$0a:8ab0  09 06		 ora #$06
$0a:8ab2  ea			nop
$0a:8ab3  0a			asl a
$0a:8ab4  01 00		 ora ($00,x)
$0a:8ab6  00 0f		 brk #$0f
$0a:8ab8  00 0c		 brk #$0c
$0a:8aba  0b			phd
$0a:8abb  00 00		 brk #$00
$0a:8abd  10 00		 bpl $8abf
$0a:8abf  20 00 00	  jsr $0000
$0a:8ac2  00 10		 brk #$10
$0a:8ac4  00 10		 brk #$10
$0a:8ac6  00 03		 brk #$03
$0a:8ac8  00 01		 brk #$01
$0a:8aca  00 00		 brk #$00
$0a:8acc  00 10		 brk #$10
$0a:8ace  06 0a		 asl $0a
$0a:8ad0  01 00		 ora ($00,x)
$0a:8ad2  00 09		 brk #$09
$0a:8ad4  07 ea		 ora [$ea]
$0a:8ad6  0a			asl a
$0a:8ad7  01 00		 ora ($00,x)
$0a:8ad9  00 10		 brk #$10
$0a:8adb  00 0e		 brk #$0e
$0a:8add  0b			phd
$0a:8ade  00 00		 brk #$00
$0a:8ae0  10 00		 bpl $8ae2
$0a:8ae2  20 00 00	  jsr $0000
$0a:8ae5  00 10		 brk #$10
$0a:8ae7  00 10		 brk #$10
$0a:8ae9  00 03		 brk #$03
$0a:8aeb  00 01		 brk #$01
$0a:8aed  00 00		 brk #$00
$0a:8aef  00 10		 brk #$10
$0a:8af1  06 0a		 asl $0a
$0a:8af3  01 00		 ora ($00,x)
$0a:8af5  00 09		 brk #$09
$0a:8af7  07 e8		 ora [$e8]
$0a:8af9  0a			asl a
$0a:8afa  01 00		 ora ($00,x)
$0a:8afc  00 10		 brk #$10
$0a:8afe  00 ec		 brk #$ec
$0a:8b00  0a			asl a
$0a:8b01  00 00		 brk #$00
$0a:8b03  10 00		 bpl $8b05
$0a:8b05  1f 00 00 00   ora $000000,x
$0a:8b09  10 00		 bpl $8b0b
$0a:8b0b  10 00		 bpl $8b0d
$0a:8b0d  03 00		 ora $00,s
$0a:8b0f  01 00		 ora ($00,x)
$0a:8b11  00 00		 brk #$00
$0a:8b13  0f 06 0a 01   ora $010a06
$0a:8b17  00 00		 brk #$00
$0a:8b19  09 06		 ora #$06
$0a:8b1b  e8			inx
$0a:8b1c  0a			asl a
$0a:8b1d  01 00		 ora ($00,x)
$0a:8b1f  00 0f		 brk #$0f
$0a:8b21  00 ee		 brk #$ee
$0a:8b23  0a			asl a
$0a:8b24  00 00		 brk #$00
$0a:8b26  10 00		 bpl $8b28
$0a:8b28  1e 00 02	  asl $0200,x
$0a:8b2b  00 10		 brk #$10
$0a:8b2d  00 10		 brk #$10
$0a:8b2f  00 03		 brk #$03
$0a:8b31  00 01		 brk #$01
$0a:8b33  00 00		 brk #$00
$0a:8b35  00 10		 brk #$10
$0a:8b37  02 0a		 cop #$0a
$0a:8b39  01 00		 ora ($00,x)
$0a:8b3b  00 05		 brk #$05
$0a:8b3d  0b			phd
$0a:8b3e  08			php
$0a:8b3f  0a			asl a
$0a:8b40  01 00		 ora ($00,x)
$0a:8b42  00 10		 brk #$10
$0a:8b44  00 0c		 brk #$0c
$0a:8b46  0a			asl a
$0a:8b47  00 00		 brk #$00
$0a:8b49  10 00		 bpl $8b4b
$0a:8b4b  1f 00 00 00   ora $000000,x
$0a:8b4f  10 00		 bpl $8b51
$0a:8b51  10 00		 bpl $8b53
$0a:8b53  03 00		 ora $00,s
$0a:8b55  01 00		 ora ($00,x)
$0a:8b57  00 00		 brk #$00
$0a:8b59  0f 02 0a 01   ora $010a02
$0a:8b5d  00 00		 brk #$00
$0a:8b5f  07 08		 ora [$08]
$0a:8b61  0a			asl a
$0a:8b62  0a			asl a
$0a:8b63  01 00		 ora ($00,x)
$0a:8b65  00 0f		 brk #$0f
$0a:8b67  00 0e		 brk #$0e
$0a:8b69  0a			asl a
$0a:8b6a  01 00		 ora ($00,x)
$0a:8b6c  10 00		 bpl $8b6e
$0a:8b6e  1e 00 02	  asl $0200,x
$0a:8b71  00 10		 brk #$10
$0a:8b73  00 10		 brk #$10
$0a:8b75  00 03		 brk #$03
$0a:8b77  00 01		 brk #$01
$0a:8b79  01 00		 ora ($00,x)
$0a:8b7b  00 10		 brk #$10
$0a:8b7d  02 0a		 cop #$0a
$0a:8b7f  01 00		 ora ($00,x)
$0a:8b81  01 05		 ora ($05,x)
$0a:8b83  0b			phd
$0a:8b84  08			php
$0a:8b85  4a			lsr a
$0a:8b86  01 00		 ora ($00,x)
$0a:8b88  01 10		 ora ($10,x)
$0a:8b8a  00 0c		 brk #$0c
$0a:8b8c  4a			lsr a
$0a:8b8d  01 00		 ora ($00,x)
$0a:8b8f  10 00		 bpl $8b91
$0a:8b91  1f 00 00 00   ora $000000,x
$0a:8b95  10 00		 bpl $8b97
$0a:8b97  10 00		 bpl $8b99
$0a:8b99  03 00		 ora $00,s
$0a:8b9b  01 01		 ora ($01,x)
$0a:8b9d  00 00		 brk #$00
$0a:8b9f  0f 02 0a 01   ora $010a02
$0a:8ba3  00 01		 brk #$01
$0a:8ba5  07 08		 ora [$08]
$0a:8ba7  0a			asl a
$0a:8ba8  4a			lsr a
$0a:8ba9  01 00		 ora ($00,x)
$0a:8bab  01 0f		 ora ($0f,x)
$0a:8bad  00 0e		 brk #$0e
$0a:8baf  4a			lsr a
$0a:8bb0  00 00		 brk #$00
$0a:8bb2  10 00		 bpl $8bb4
$0a:8bb4  1d 00 00	  ora $0000,x
$0a:8bb7  00 10		 brk #$10
$0a:8bb9  00 10		 brk #$10
$0a:8bbb  00 03		 brk #$03
$0a:8bbd  00 01		 brk #$01
$0a:8bbf  00 00		 brk #$00
$0a:8bc1  00 0d		 brk #$0d
$0a:8bc3  00 0a		 brk #$0a
$0a:8bc5  01 00		 ora ($00,x)
$0a:8bc7  00 05		 brk #$05
$0a:8bc9  08			php
$0a:8bca  6a			ror a
$0a:8bcb  0b			phd
$0a:8bcc  01 00		 ora ($00,x)
$0a:8bce  00 0d		 brk #$0d
$0a:8bd0  00 6e		 brk #$6e
$0a:8bd2  0b			phd
$0a:8bd3  00 00		 brk #$00
$0a:8bd5  10 00		 bpl $8bd7
$0a:8bd7  1d 00 00	  ora $0000,x
$0a:8bda  00 10		 brk #$10
$0a:8bdc  00 10		 brk #$10
$0a:8bde  00 03		 brk #$03
$0a:8be0  00 01		 brk #$01
$0a:8be2  00 00		 brk #$00
$0a:8be4  00 0d		 brk #$0d
$0a:8be6  00 0a		 brk #$0a
$0a:8be8  01 00		 ora ($00,x)
$0a:8bea  00 05		 brk #$05
$0a:8bec  08			php
$0a:8bed  6c 0b 01	  jmp ($010b)
$0a:8bf0  00 00		 brk #$00
$0a:8bf2  0d 00 6e	  ora $6e00
$0a:8bf5  0b			phd
$0a:8bf6  00 00		 brk #$00
$0a:8bf8  10 00		 bpl $8bfa
$0a:8bfa  21 00		 and ($00,x)
$0a:8bfc  00 00		 brk #$00
$0a:8bfe  10 00		 bpl $8c00
$0a:8c00  10 00		 bpl $8c02
$0a:8c02  03 00		 ora $00,s
$0a:8c04  01 00		 ora ($00,x)
$0a:8c06  00 09		 brk #$09
$0a:8c08  08			php
$0a:8c09  8a			txa
$0a:8c0a  0b			phd
$0a:8c0b  01 00		 ora ($00,x)
$0a:8c0d  00 00		 brk #$00
$0a:8c0f  11 02		 ora ($02),y
$0a:8c11  0a			asl a
$0a:8c12  01 00		 ora ($00,x)
$0a:8c14  00 11		 brk #$11
$0a:8c16  00 8e		 brk #$8e
$0a:8c18  0b			phd
$0a:8c19  00 00		 brk #$00
$0a:8c1b  10 00		 bpl $8c1d
$0a:8c1d  21 00		 and ($00,x)
$0a:8c1f  00 00		 brk #$00
$0a:8c21  10 00		 bpl $8c23
$0a:8c23  10 00		 bpl $8c25
$0a:8c25  03 00		 ora $00,s
$0a:8c27  01 00		 ora ($00,x)
$0a:8c29  00 09		 brk #$09
$0a:8c2b  08			php
$0a:8c2c  8c 0b 01	  sty $010b
$0a:8c2f  00 00		 brk #$00
$0a:8c31  00 11		 brk #$11
$0a:8c33  02 0a		 cop #$0a
$0a:8c35  01 00		 ora ($00,x)
$0a:8c37  00 11		 brk #$11
$0a:8c39  00 8e		 brk #$8e
$0a:8c3b  0b			phd
$0a:8c3c  03 00		 ora $00,s
$0a:8c3e  10 00		 bpl $8c40
$0a:8c40  1e 00 00	  asl $0000,x
$0a:8c43  00 10		 brk #$10
$0a:8c45  00 10		 brk #$10
$0a:8c47  00 03		 brk #$03
$0a:8c49  00 01		 brk #$01
$0a:8c4b  00 03		 brk #$03
$0a:8c4d  00 0e		 brk #$0e
$0a:8c4f  04 0a		 tsb $0a
$0a:8c51  01 03		 ora ($03,x)
$0a:8c53  00 06		 brk #$06
$0a:8c55  08			php
$0a:8c56  aa			tax
$0a:8c57  0b			phd
$0a:8c58  01 03		 ora ($03,x)
$0a:8c5a  00 0e		 brk #$0e
$0a:8c5c  00 ae		 brk #$ae
$0a:8c5e  0b			phd
$0a:8c5f  03 00		 ora $00,s
$0a:8c61  10 00		 bpl $8c63
$0a:8c63  1e 00 00	  asl $0000,x
$0a:8c66  00 10		 brk #$10
$0a:8c68  00 10		 brk #$10
$0a:8c6a  00 03		 brk #$03
$0a:8c6c  00 01		 brk #$01
$0a:8c6e  00 03		 brk #$03
$0a:8c70  00 0e		 brk #$0e
$0a:8c72  04 0a		 tsb $0a
$0a:8c74  01 03		 ora ($03,x)
$0a:8c76  00 06		 brk #$06
$0a:8c78  08			php
$0a:8c79  ac 0b 01	  ldy $010b
$0a:8c7c  03 00		 ora $00,s
$0a:8c7e  0e 00 ae	  asl $ae00
$0a:8c81  0b			phd
$0a:8c82  00 00		 brk #$00
$0a:8c84  13 00		 ora ($00,s),y
$0a:8c86  1e 00 00	  asl $0000,x
$0a:8c89  00 10		 brk #$10
$0a:8c8b  00 10		 brk #$10
$0a:8c8d  00 03		 brk #$03
$0a:8c8f  00 01		 brk #$01
$0a:8c91  03 00		 ora $00,s
$0a:8c93  00 0e		 brk #$0e
$0a:8c95  06 0a		 asl $0a
$0a:8c97  01 00		 ora ($00,x)
$0a:8c99  03 06		 ora $06,s
$0a:8c9b  08			php
$0a:8c9c  aa			tax
$0a:8c9d  4b			phk
$0a:8c9e  01 00		 ora ($00,x)
$0a:8ca0  03 0e		 ora $0e,s
$0a:8ca2  00 ae		 brk #$ae
$0a:8ca4  4b			phk
$0a:8ca5  00 00		 brk #$00
$0a:8ca7  13 00		 ora ($00,s),y
$0a:8ca9  1e 00 00	  asl $0000,x
$0a:8cac  00 10		 brk #$10
$0a:8cae  00 10		 brk #$10
$0a:8cb0  00 03		 brk #$03
$0a:8cb2  00 01		 brk #$01
$0a:8cb4  03 00		 ora $00,s
$0a:8cb6  00 0e		 brk #$0e
$0a:8cb8  06 0a		 asl $0a
$0a:8cba  01 00		 ora ($00,x)
$0a:8cbc  03 06		 ora $06,s
$0a:8cbe  08			php
$0a:8cbf  ac 4b 01	  ldy $014b
$0a:8cc2  00 03		 brk #$03
$0a:8cc4  0e 00 ae	  asl $ae00
$0a:8cc7  4b			phk
$0a:8cc8  00 00		 brk #$00
$0a:8cca  00 00		 brk #$00
$0a:8ccc  00 00		 brk #$00
$0a:8cce  00 00		 brk #$00
$0a:8cd0  00 00		 brk #$00
$0a:8cd2  00 00		 brk #$00
$0a:8cd4  00 00		 brk #$00
$0a:8cd6  00 00		 brk #$00
$0a:8cd8  00 00		 brk #$00
$0a:8cda  00 00		 brk #$00
$0a:8cdc  00 00		 brk #$00
$0a:8cde  00 00		 brk #$00
$0a:8ce0  00 00		 brk #$00
$0a:8ce2  00 00		 brk #$00
$0a:8ce4  00 00		 brk #$00
$0a:8ce6  00 00		 brk #$00
$0a:8ce8  a9 00		 lda #$00
$0a:8cea  7e 34 d5	  ror $d534,x
$0a:8ced  dd e8 7b	  cmp $7be8,x
$0a:8cf0  60			rts
$0a:8cf1  cc a7 61	  cpy $61a7
$0a:8cf4  25 f4		 and $f4
$0a:8cf6  89 2b		 bit #$2b
$0a:8cf8  00 ff		 brk #$ff
$0a:8cfa  34 cb		 bit $cb,x
$0a:8cfc  d5 22		 cmp $22,x
$0a:8cfe  10 04		 bpl $8d04
$0a:8d00  36 01		 rol $01,x
$0a:8d02  9e 00 8b	  stz $8b00,x
$0a:8d05  00 d4		 brk #$d4
$0a:8d07  00 0b		 brk #$0b
$0a:8d09  21 e9		 and ($e9,x)
$0a:8d0b  4d 17 8a	  eor $8a17
$0a:8d0e  c5 55		 cmp $55
$0a:8d10  5d fa 75	  eor $75fa,x
$0a:8d13  28			plp
$0a:8d14  92 40		 sta ($40)
$0a:8d16  6d 29 01	  adc $0129
$0a:8d19  fe 49 b6	  inc $b649,x
$0a:8d1c  02 f4		 cop #$f4
$0a:8d1e  40			rti
$0a:8d1f  aa			tax
$0a:8d20  47 00		 eor [$00]
$0a:8d22  9f 00 bf 00   sta $00bf00,x
$0a:8d26  96 00		 stx $00,y
$0a:8d28  2b			pld
$0a:8d29  81 cc		 sta ($cc,x)
$0a:8d2b  d8			cld
$0a:8d2c  b1 63		 lda ($63),y
$0a:8d2e  0f 64 f4 d5   ora $d5f464
$0a:8d32  03 ce		 ora $ce,s
$0a:8d34  ed 57 2b	  sbc $2b57
$0a:8d37  8d 01 7e	  sta $7e01
$0a:8d3a  48			pha
$0a:8d3b  37 a1		 and [$a1],y
$0a:8d3d  1e c4 1b	  asl $1bc4,x
$0a:8d40  04 0b		 tsb $0b
$0a:8d42  32 01		 and ($01)
$0a:8d44  39 00 76	  and $7600,y
$0a:8d47  00 ca		 brk #$ca
$0a:8d49  37 d1		 and [$d1],y
$0a:8d4b  6b			rtl
$0a:8d4c  bb			tyx
$0a:8d4d  48			pha
$0a:8d4e  f4 1f a9	  pea $a91f
$0a:8d51  5f 97 6e ec   eor $ec6e97,x
$0a:8d55  24 94		 bit $94
$0a:8d57  7b			tdc
$0a:8d58  00 00		 brk #$00
$0a:8d5a  04 00		 tsb $00
$0a:8d5c  06 00		 asl $00
$0a:8d5e  00 00		 brk #$00
$0a:8d60  00 00		 brk #$00
$0a:8d62  01 00		 ora ($00,x)
$0a:8d64  13 00		 ora ($00,s),y
$0a:8d66  00 00		 brk #$00
$0a:8d68  d6 f7		 dec $f7,x
$0a:8d6a  28			plp
$0a:8d6b  65 32		 adc $32
$0a:8d6d  ef c3 56 84   sbc $8456c3
$0a:8d71  33 5e		 and ($5e,s),y
$0a:8d73  8f 31 da da   sta $dada31
$0a:8d77  cb			wai
$0a:8d78  08			php
$0a:8d79  00 9a		 brk #$9a
$0a:8d7b  00 18		 brk #$18
$0a:8d7d  00 38		 brk #$38
$0a:8d7f  00 78		 brk #$78
$0a:8d81  00 70		 brk #$70
$0a:8d83  00 64		 brk #$64
$0a:8d85  00 34		 brk #$34
$0a:8d87  00 b4		 brk #$b4
$0a:8d89  4b			phk
$0a:8d8a  54 b4 aa	  mvn $aa,$b4
$0a:8d8d  78			sei
$0a:8d8e  8d 6d f1	  sta $f16d
$0a:8d91  23 16		 and $16,s
$0a:8d93  f2 ad		 sbc ($ad)
$0a:8d95  64 92		 stz $92
$0a:8d97  75 00		 adc $00,x
$0a:8d99  00 0b		 brk #$0b
$0a:8d9b  00 07		 brk #$07
$0a:8d9d  00 12		 brk #$12
$0a:8d9f  00 1c		 brk #$1c
$0a:8da1  00 0d		 brk #$0d
$0a:8da3  00 1b		 brk #$1b
$0a:8da5  00 08		 brk #$08
$0a:8da7  00 b6		 brk #$b6
$0a:8da9  ee b3 b3	  inc $b3b3
$0a:8dac  cd 11 29	  cmp $2911
$0a:8daf  7d f1 d1	  adc $d1f1,x
$0a:8db2  0a			asl a
$0a:8db3  c7 ec		 cmp [$ec]
$0a:8db5  57 2b		 eor [$2b],y
$0a:8db7  8d 01 00	  sta $0001
$0a:8dba  4c 00 ee	  jmp $ee00
$0a:8dbd  00 c6		 brk #$c6
$0a:8dbf  00 0e		 brk #$0e
$0a:8dc1  00 3c		 brk #$3c
$0a:8dc3  00 38		 brk #$38
$0a:8dc5  00 76		 brk #$76
$0a:8dc7  00 ef		 brk #$ef
$0a:8dc9  10 92		 bpl $8d5d
$0a:8dcb  ff 29 85 54   sbc $548529,x
$0a:8dcf  45 aa		 eor $aa
$0a:8dd1  eb			xba
$0a:8dd2  51 d2		 eor ($d2),y
$0a:8dd4  66 bd		 ror $bd
$0a:8dd6  ed 12 00	  sbc $0012
$0a:8dd9  00 00		 brk #$00
$0a:8ddb  00 7e		 brk #$7e
$0a:8ddd  00 ba		 brk #$ba
$0a:8ddf  00 14		 brk #$14
$0a:8de1  00 2c		 brk #$2c
$0a:8de3  00 00		 brk #$00
$0a:8de5  00 00		 brk #$00
$0a:8de7  00 e5		 brk #$e5
$0a:8de9  7e 54 5b	  ror $5b54,x
$0a:8dec  3b			tsc
$0a:8ded  ac b5 0e	  ldy $0eb5
$0a:8df0  4e eb 82	  lsr $82eb
$0a:8df3  13 2d		 ora ($2d,s),y
$0a:8df5  99 c2 ee	  sta $eec2,y
$0a:8df8  80 00		 bra $8dfa
$0a:8dfa  a0 00 d0	  ldy #$d000
$0a:8dfd  00 f8		 brk #$f8
$0a:8dff  00 b4		 brk #$b4
$0a:8e01  00 fc		 brk #$fc
$0a:8e03  00 fe		 brk #$fe
$0a:8e05  00 bd		 brk #$bd
$0a:8e07  00 4b		 brk #$4b
$0a:8e09  ff ca b7 b3   sbc $b3b7ca,x
$0a:8e0d  f2 c6		 sbc ($c6)
$0a:8e0f  85 ad		 sta $ad
$0a:8e11  eb			xba
$0a:8e12  d8			cld
$0a:8e13  94 b5		 sty $b5,x
$0a:8e15  ed 4a 1b	  sbc $1b4a
$0a:8e18  00 00		 brk #$00
$0a:8e1a  7f 00 73 0c   adc $0c7300,x
$0a:8e1e  47 38		 eor [$38]
$0a:8e20  6f 10 5c 23   adc $235c10
$0a:8e24  7d 02 db	  adc $db02,x
$0a:8e27  24 8a		 bit $8a
$0a:8e29  ff 96 97 1b   sbc $1b9796,x
$0a:8e2d  3b			tsc
$0a:8e2e  28			plp
$0a:8e2f  09 13		 ora #$13
$0a:8e31  2b			pld
$0a:8e32  a2 a2 45	  ldx #$45a2
$0a:8e35  c5 82		 cmp $82
$0a:8e37  82 00 00	  brl $8e3a
$0a:8e3a  96 68		 stx $68,y
$0a:8e3c  3a			dec a
$0a:8e3d  c4 38		 cpy $38
$0a:8e3f  c6 3a		 dec $3a
$0a:8e41  c4 a3		 cpy $a3
$0a:8e43  5c c4 3a 83   jml $833ac4
$0a:8e47  7c a9 da	  jmp ($daa9,x)
$0a:8e4a  f5 0d		 sbc $0d,x
$0a:8e4c  fc 33 d7	  jsr ($d733,x)
$0a:8e4f  64 96		 stz $96
$0a:8e51  52 58		 eor ($58)
$0a:8e53  39 da 2e	  and $2eda,y
$0a:8e56  76 5d		 ror $5d,x
$0a:8e58  04 00		 tsb $00
$0a:8e5a  02 00		 cop #$00
$0a:8e5c  00 00		 brk #$00
$0a:8e5e  18			clc
$0a:8e5f  00 2d		 brk #$2d
$0a:8e61  00 86		 brk #$86
$0a:8e63  00 81		 brk #$81
$0a:8e65  00 80		 brk #$80
$0a:8e67  00 55		 brk #$55
$0a:8e69  ce 5a 97	  dec $975a
$0a:8e6c  8f b0 1a eb   sta $eb1ab0
$0a:8e70  f2 18		 sbc ($18)
$0a:8e72  ca			dex
$0a:8e73  a2 6d 2d	  ldx #$2d6d
$0a:8e76  d2 bb		 cmp ($bb)
$0a:8e78  20 00 20	  jsr $2000
$0a:8e7b  00 40		 brk #$40
$0a:8e7d  00 04		 brk #$04
$0a:8e7f  00 07		 brk #$07
$0a:8e81  00 1d		 brk #$1d
$0a:8e83  00 92		 brk #$92
$0a:8e85  00 04		 brk #$04
$0a:8e87  00 76		 brk #$76
$0a:8e89  53 4a		 eor ($4a,s),y
$0a:8e8b  b8			clv
$0a:8e8c  83 4f		 sta $4f,s
$0a:8e8e  a8			tay
$0a:8e8f  33 69		 and ($69,s),y
$0a:8e91  c4 a7		 cpy $a7
$0a:8e93  61 25		 adc ($25,x)
$0a:8e95  f4 89 2b	  pea $2b89
$0a:8e98  8c 00 07	  sty $0700
$0a:8e9b  00 30		 brk #$30
$0a:8e9d  00 5c		 brk #$5c
$0a:8e9f  00 3f		 brk #$3f
$0a:8ea1  00 9e		 brk #$9e
$0a:8ea3  00 8b		 brk #$8b
$0a:8ea5  00 d4		 brk #$d4
$0a:8ea7  00 aa		 brk #$aa
$0a:8ea9  9b			txy
$0a:8eaa  a5 cd		 lda $cd
$0a:8eac  79 36 e5	  adc $e536,y
$0a:8eaf  f1 4d		 sbc ($4d),y
$0a:8eb1  aa			tax
$0a:8eb2  75 28		 adc $28,x
$0a:8eb4  92 40		 sta ($40)
$0a:8eb6  6d 29 64	  adc $6429
$0a:8eb9  00 32		 brk #$32
$0a:8ebb  00 c0		 brk #$c0
$0a:8ebd  00 0e		 brk #$0e
$0a:8ebf  00 17		 brk #$17
$0a:8ec1  00 9f		 brk #$9f
$0a:8ec3  00 bf		 brk #$bf
$0a:8ec5  00 96		 brk #$96
$0a:8ec7  00 c8		 brk #$c8
$0a:8ec9  37 0a		 and [$0a],y
$0a:8ecb  9b			txy
$0a:8ecc  7b			tdc
$0a:8ecd  d5 ed		 cmp $ed,x
$0a:8ecf  bb			tyx
$0a:8ed0  16 b2		 asl $b2,x
$0a:8ed2  aa			tax
$0a:8ed3  e4 e4		 cpx $e4
$0a:8ed5  d2 c5		 cmp ($c5)
$0a:8ed7  ba			tsx
$0a:8ed8  00 00		 brk #$00
$0a:8eda  64 00		 stz $00
$0a:8edc  2e 00 56	  rol $5600
$0a:8edf  00 4d		 brk #$4d
$0a:8ee1  00 1f		 brk #$1f
$0a:8ee3  00 3f		 brk #$3f
$0a:8ee5  00 7f		 brk #$7f
$0a:8ee7  12 a7		 ora ($a7)
$0a:8ee9  97 cd		 sta [$cd],y
$0a:8eeb  c7 ba		 cmp [$ba]
$0a:8eed  3e 6b 79	  rol $796b,x
$0a:8ef0  6d cf 94	  adc $94cf
$0a:8ef3  9c ea f9	  stz $f9ea
$0a:8ef6  5c 5c 78 00   jml $00785c
$0a:8efa  38			sec
$0a:8efb  00 c1		 brk #$c1
$0a:8efd  00 86		 brk #$86
$0a:8eff  00 30		 brk #$30
$0a:8f01  00 63		 brk #$63
$0a:8f03  00 07		 brk #$07
$0a:8f05  00 a3		 brk #$a3
$0a:8f07  00 72		 brk #$72
$0a:8f09  f3 4b		 sbc ($4b,s),y
$0a:8f0b  63 dc		 adc $dc,s
$0a:8f0d  1e 37 5f	  asl $5f37,x
$0a:8f10  a9 a9		 lda #$a9
$0a:8f12  aa			tax
$0a:8f13  e4 52		 cpx $52
$0a:8f15  53 bd		 eor ($bd,s),y
$0a:8f17  bc 0c 00	  ldy $000c,x
$0a:8f1a  9c 00 e1	  stz $e100
$0a:8f1d  00 e0		 brk #$e0
$0a:8f1f  00 56		 brk #$56
$0a:8f21  00 1f		 brk #$1f
$0a:8f23  00 ac		 brk #$ac
$0a:8f25  00 43		 brk #$43
$0a:8f27  00 29		 brk #$29
$0a:8f29  bf f6 8a 5c   lda $5c8af6,x
$0a:8f2d  28			plp
$0a:8f2e  bb			tyx
$0a:8f2f  de 2d 48	  dec $482d,x
$0a:8f32  70 a2		 bvs $8ed6
$0a:8f34  26 ac		 rol $ac
$0a:8f36  df 15 41 00   cmp $004115,x
$0a:8f3a  42 01		 wdm #$01
$0a:8f3c  88			dey
$0a:8f3d  07 1a		 ora [$1a]
$0a:8f3f  05 88		 ora $88
$0a:8f41  17 20		 ora [$20],y
$0a:8f43  1f 24 5b 15   ora $155b24,x
$0a:8f47  6a			ror a
$0a:8f48  6d 94 5a	  adc $5a94
$0a:8f4b  e6 2b		 inc $2b
$0a:8f4d  b7 5a		 lda [$5a],y
$0a:8f4f  dd ab 08	  cmp $08ab,x
$0a:8f52  40			rti
$0a:8f53  d0 ed		 bne $8f42
$0a:8f55  6d 92 6d	  adc $6d92
$0a:8f58  03 00		 ora $00,s
$0a:8f5a  01 00		 ora ($00,x)
$0a:8f5c  40			rti
$0a:8f5d  00 20		 brk #$20
$0a:8f5f  00 77		 brk #$77
$0a:8f61  00 2f		 brk #$2f
$0a:8f63  00 12		 brk #$12
$0a:8f65  00 00		 brk #$00
$0a:8f67  00 25		 brk #$25
$0a:8f69  5f 91 2f 5a   eor $5a2f91,x
$0a:8f6d  16 89		 asl $89,x
$0a:8f6f  f9 a2 e9	  sbc $e9a2,y
$0a:8f72  49 48		 eor #$48
$0a:8f74  32 32		 and ($32)
$0a:8f76  25 db		 and $db
$0a:8f78  f0 00		 beq $8f7a
$0a:8f7a  f0 00		 beq $8f7c
$0a:8f7c  e1 00		 sbc ($00,x)
$0a:8f7e  06 00		 asl $00
$0a:8f80  1f 00 b7 00   ora $00b700,x
$0a:8f84  cd 00 00	  cmp $0000
$0a:8f87  00 96		 brk #$96
$0a:8f89  6c 5a b6	  jmp ($b65a)
$0a:8f8c  82 63 2d	  brl $bcf2
$0a:8f8f  e4 95		 cpx $95
$0a:8f91  5d 1a ff	  eor $ff1a,x
$0a:8f94  44 bb b3	  mvp $b3,$bb
$0a:8f97  cc 03 00	  cpy $0003
$0a:8f9a  0d 00 1d	  ora $1d00
$0a:8f9d  00 1b		 brk #$1b
$0a:8f9f  00 22		 brk #$22
$0a:8fa1  00 00		 brk #$00
$0a:8fa3  00 00		 brk #$00
$0a:8fa5  00 00		 brk #$00
$0a:8fa7  00 70		 brk #$70
$0a:8fa9  a1 ae		 lda ($ae,x)
$0a:8fab  d3 19		 cmp ($19,s),y
$0a:8fad  45 a4		 eor $a4
$0a:8faf  a9 1b		 lda #$1b
$0a:8fb1  39 6d fd	  and $fd6d,y
$0a:8fb4  92 6f		 sta ($6f)
$0a:8fb6  b5 4b		 lda $4b,x
$0a:8fb8  1e 00 3c	  asl $3c00,x
$0a:8fbb  00 be		 brk #$be
$0a:8fbd  00 5e		 brk #$5e
$0a:8fbf  00 c6		 brk #$c6
$0a:8fc1  00 02		 brk #$02
$0a:8fc3  00 00		 brk #$00
$0a:8fc5  00 00		 brk #$00
$0a:8fc7  00 ee		 brk #$ee
$0a:8fc9  11 98		 ora ($98),y
$0a:8fcb  67 55		 adc [$55]
$0a:8fcd  dd 35 f0	  cmp $f035,x
$0a:8fd0  e9 69		 sbc #$69
$0a:8fd2  22 fa cb 3f   jsl $3fcbfa
$0a:8fd6  f6 09		 inc $09,x
$0a:8fd8  00 00		 brk #$00
$0a:8fda  00 00		 brk #$00
$0a:8fdc  22 00 0f 00   jsl $000f00
$0a:8fe0  16 00		 asl $00,x
$0a:8fe2  05 00		 ora $00
$0a:8fe4  00 00		 brk #$00
$0a:8fe6  00 00		 brk #$00
$0a:8fe8  ad 39 1c	  lda $1c39
$0a:8feb  a5 4a		 lda $4a
$0a:8fed  13 65		 ora ($65,s),y
$0a:8fef  d1 49		 cmp ($49),y
$0a:8ff1  e5 f6		 sbc $f6
$0a:8ff3  b1 5b		 lda ($5b),y
$0a:8ff5  eb			xba
$0a:8ff6  a2 7f d6	  ldx #$d67f
$0a:8ff9  00 fa		 brk #$fa
$0a:8ffb  00 fc		 brk #$fc
$0a:8ffd  00 3e		 brk #$3e
$0a:8fff  00 1e		 brk #$1e
$0a:9001  00 0e		 brk #$0e
$0a:9003  00 04		 brk #$04
$0a:9005  00 00		 brk #$00
$0a:9007  00 95		 brk #$95
$0a:9009  de 2a 6e	  dec $6e2a,x
$0a:900c  65 27		 adc $27
$0a:900e  a2 e3 17	  ldx #$17e3
$0a:9011  5f 65 0a 94   eor $940a65,x
$0a:9015  04 04		 tsb $04
$0a:9017  00 5f		 brk #$5f
$0a:9019  20 ee 11	  jsr $11ee
$0a:901c  e7 18		 sbc [$18]
$0a:901e  63 1c		 adc $1c,s
$0a:9020  df 20 ff 00   cmp $00ff20,x
$0a:9024  fb			xce
$0a:9025  00 ff		 brk #$ff
$0a:9027  00 12		 brk #$12
$0a:9029  2a			rol a
$0a:902a  2b			pld
$0a:902b  0b			phd
$0a:902c  12 3a		 ora ($3a)
$0a:902e  84 84		 sty $84
$0a:9030  ed fe a6	  sbc $a6fe
$0a:9033  50 29		 bvc $905e
$0a:9035  20 20 00	  jsr $0020
$0a:9038  3b			tsc
$0a:9039  c4 3a		 cpy $3a
$0a:903b  c4 3b		 cpy $3b
$0a:903d  c4 85		 cpy $85
$0a:903f  7a			ply
$0a:9040  ff 00 ff 00   sbc $00ff00,x
$0a:9044  df 00 ff 00   cmp $00ff00,x
$0a:9048  32 8f		 and ($8f)
$0a:904a  bc c3 67	  ldy $67c3,x
$0a:904d  94 d4		 sty $d4,x
$0a:904f  30 d5		 bmi $9026
$0a:9051  bd aa 1f	  lda $1faa,x
$0a:9054  65 5f		 adc $5f
$0a:9056  12 ad		 ora ($ad)
$0a:9058  40			rti
$0a:9059  00 00		 brk #$00
$0a:905b  00 08		 brk #$08
$0a:905d  00 0f		 brk #$0f
$0a:905f  00 02		 brk #$02
$0a:9061  00 c0		 brk #$c0
$0a:9063  00 80		 brk #$80
$0a:9065  00 40		 brk #$40
$0a:9067  00 63		 brk #$63
$0a:9069  b7 de		 lda [$de],y
$0a:906b  2d d4 3f	  and $3fd4
$0a:906e  eb			xba
$0a:906f  1c fc c2	  trb $c2fc
$0a:9072  7c 24 9a	  jmp ($9a24,x)
$0a:9075  af 26 da 08   lda $08da26
$0a:9079  00 00		 brk #$00
$0a:907b  00 00		 brk #$00
$0a:907d  00 00		 brk #$00
$0a:907f  00 01		 brk #$01
$0a:9081  00 c3		 brk #$c3
$0a:9083  00 40		 brk #$40
$0a:9085  00 01		 brk #$01
$0a:9087  00 ed		 brk #$ed
$0a:9089  9d 63 5f	  sta $5f63,x
$0a:908c  98			tya
$0a:908d  f3 eb		 sbc ($eb,s),y
$0a:908f  24 2a		 bit $2a
$0a:9091  68			pla
$0a:9092  55 b5		 eor $b5,x
$0a:9094  9a			txs
$0a:9095  3a			dec a
$0a:9096  ed bf 42	  sbc $42bf
$0a:9099  00 80		 brk #$80
$0a:909b  00 0c		 brk #$0c
$0a:909d  00 1f		 brk #$1f
$0a:909f  00 97		 brk #$97
$0a:90a1  00 ca		 brk #$ca
$0a:90a3  00 c5		 brk #$c5
$0a:90a5  00 40		 brk #$40
$0a:90a7  00 9c		 brk #$9c
$0a:90a9  d4 61		 pei ($61)
$0a:90ab  b3 eb		 lda ($eb,s),y
$0a:90ad  2b			pld
$0a:90ae  54 b7 1b	  mvn $1b,$b7
$0a:90b1  26 93		 rol $93
$0a:90b3  48			pha
$0a:90b4  65 35		 adc $35
$0a:90b6  d9 fc 2b	  cmp $2bfc,y
$0a:90b9  00 0c		 brk #$0c
$0a:90bb  00 14		 brk #$14
$0a:90bd  00 08		 brk #$08
$0a:90bf  00 c1		 brk #$c1
$0a:90c1  00 e7		 brk #$e7
$0a:90c3  00 ca		 brk #$ca
$0a:90c5  00 03		 brk #$03
$0a:90c7  00 2a		 brk #$2a
$0a:90c9  ee 85 3d	  inc $3d85
$0a:90cc  4b			phk
$0a:90cd  ee ac c7	  inc $c7ac
$0a:90d0  55 cb		 eor $cb,x
$0a:90d2  09 94		 ora #$94
$0a:90d4  24 ec		 bit $ec
$0a:90d6  85 3c		 sta $3c
$0a:90d8  11 00		 ora ($00),y
$0a:90da  c2 00		 rep #$00
$0a:90dc  91 00		 sta ($00),y
$0a:90de  38			sec
$0a:90df  00 3c		 brk #$3c
$0a:90e1  00 7b		 brk #$7b
$0a:90e3  00 13		 brk #$13
$0a:90e5  00 c3		 brk #$c3
$0a:90e7  00 1a		 brk #$1a
$0a:90e9  be 45 3c	  ldx $3c45,y
$0a:90ec  a6 ee		 ldx $ee
$0a:90ee  51 c5		 eor ($c5),y
$0a:90f0  22 ae d5 c7   jsl $c7d5ae
$0a:90f4  a8			tay
$0a:90f5  6f 2d 79 c1   adc $c1792d
$0a:90f9  00 c3		 brk #$c3
$0a:90fb  00 11		 brk #$11
$0a:90fd  00 3a		 brk #$3a
$0a:90ff  00 59		 brk #$59
$0a:9101  00 38		 brk #$38
$0a:9103  00 90		 brk #$90
$0a:9105  00 c6		 brk #$c6
$0a:9107  00 48		 brk #$48
$0a:9109  64 ca		 stz $ca
$0a:910b  1e 18 53	  asl $5318,x
$0a:910e  15 b1		 ora $b1,x
$0a:9110  e0 63 55	  cpx #$5563
$0a:9113  c3 9d		 cmp $9d,s
$0a:9115  f6 50		 inc $50,x
$0a:9117  dc 9b 00	  jml [$009b]
$0a:911a  e1 00		 sbc ($00,x)
$0a:911c  ec 00 ce	  cpx $ce00
$0a:911f  00 9e		 brk #$9e
$0a:9121  00 3c		 brk #$3c
$0a:9123  00 09		 brk #$09
$0a:9125  00 23		 brk #$23
$0a:9127  00 50		 brk #$50
$0a:9129  33 a2		 and ($a2,s),y
$0a:912b  7e 59 7c	  ror $7c59,x
$0a:912e  34 f2		 bit $f2,x
$0a:9130  a4 e3		 ldy $e3
$0a:9132  09 25		 ora #$25
$0a:9134  64 17		 stz $17
$0a:9136  92 5e		 sta ($5e)
$0a:9138  cc 00 c1	  cpy $c100
$0a:913b  00 83		 brk #$83
$0a:913d  00 0d		 brk #$0d
$0a:913f  00 1e		 brk #$1e
$0a:9141  00 de		 brk #$de
$0a:9143  00 e8		 brk #$e8
$0a:9145  00 e1		 brk #$e1
$0a:9147  00 52		 brk #$52
$0a:9149  b3 85		 lda ($85,s),y
$0a:914b  3f 92 ce 25   and $25ce92,x
$0a:914f  8c 09 9a	  sty $9a09
$0a:9152  d4 f4		 pei ($f4)
$0a:9154  29 62		 and #$62
$0a:9156  57 cc		 eor [$cc],y
$0a:9158  cc 00 c0	  cpy $c000
$0a:915b  00 31		 brk #$31
$0a:915d  00 73		 brk #$73
$0a:915f  00 67		 brk #$67
$0a:9161  00 0b		 brk #$0b
$0a:9163  00 9f		 brk #$9f
$0a:9165  00 3b		 brk #$3b
$0a:9167  00 49		 brk #$49
$0a:9169  c4 2a		 cpy $2a
$0a:916b  7e b8 33	  ror $33b8,x
$0a:916e  c5 13		 cmp $13
$0a:9170  2c c9 d1	  bit $d1c9
$0a:9173  c7 f3		 cmp [$f3]
$0a:9175  2a			rol a
$0a:9176  19 c5 3b	  ora $3bc5,y
$0a:9179  00 81		 brk #$81
$0a:917b  00 cc		 brk #$cc
$0a:917d  00 ee		 brk #$ee
$0a:917f  00 f6		 brk #$f6
$0a:9181  00 38		 brk #$38
$0a:9183  00 dd		 brk #$dd
$0a:9185  00 fe		 brk #$fe
$0a:9187  00 c9		 brk #$c9
$0a:9189  36 25		 rol $25,x
$0a:918b  af 73 de 84   lda $84de73
$0a:918f  b1 59		 lda ($59),y
$0a:9191  fc 22 c9	  jsr ($c922,x)
$0a:9194  54 c6 c2	  mvn $c2,$c6
$0a:9197  bb			tyx
$0a:9198  00 00		 brk #$00
$0a:919a  50 00		 bvc $919c
$0a:919c  21 00		 and ($00,x)
$0a:919e  6e 00 07	  ror $0700
$0a:91a1  00 37		 brk #$37
$0a:91a3  00 3b		 brk #$3b
$0a:91a5  00 7c		 brk #$7c
$0a:91a7  08			php
$0a:91a8  08			php
$0a:91a9  f7 4a		 sbc [$4a],y
$0a:91ab  1b			tcs
$0a:91ac  db			stp
$0a:91ad  35 b7		 and $b7,x
$0a:91af  6b			rtl
$0a:91b0  4b			phk
$0a:91b1  fd b2 ec	  sbc $ecb2,x
$0a:91b4  68			pla
$0a:91b5  96 81		 stx $81,y
$0a:91b7  7e 00 00	  ror $0000,x
$0a:91ba  e4 00		 cpx $00
$0a:91bc  ee 00 dc	  inc $dc00
$0a:91bf  00 16		 brk #$16
$0a:91c1  00 1f		 brk #$1f
$0a:91c3  04 7f		 tsb $7f
$0a:91c5  00 ff		 brk #$ff
$0a:91c7  16 32		 asl $32,x
$0a:91c9  8d 0a c5	  sta $c50a
$0a:91cc  24 a1		 bit $a1
$0a:91ce  d0 55		 bne $9225
$0a:91d0  16 c3		 asl $c3,x
$0a:91d2  ec 69 95	  cpx $9569
$0a:91d5  76 ff		 ror $ff,x
$0a:91d7  00 7e		 brk #$7e
$0a:91d9  00 3e		 brk #$3e
$0a:91db  00 5e		 brk #$5e
$0a:91dd  00 2e		 brk #$2e
$0a:91df  00 3c		 brk #$3c
$0a:91e1  00 16		 brk #$16
$0a:91e3  00 08		 brk #$08
$0a:91e5  00 00		 brk #$00
$0a:91e7  00 ff		 brk #$ff
$0a:91e9  00 b5		 brk #$b5
$0a:91eb  af df cf 42   lda $42cfdf
$0a:91ef  30 a6		 bmi $9197
$0a:91f1  59 74 fd	  eor $fd74,y
$0a:91f4  ba			tsx
$0a:91f5  f9 94 83	  sbc $8394,y
$0a:91f8  00 00		 brk #$00
$0a:91fa  40			rti
$0a:91fb  00 20		 brk #$20
$0a:91fd  00 ef		 brk #$ef
$0a:91ff  00 00		 brk #$00
$0a:9201  00 02		 brk #$02
$0a:9203  00 06		 brk #$06
$0a:9205  00 7e		 brk #$7e
$0a:9207  00 60		 brk #$60
$0a:9209  50 50		 bvc $925b
$0a:920b  20 50 28	  jsr $2850
$0a:920e  58			cli
$0a:920f  20 59 24	  jsr $2459
$0a:9212  55 2a		 eor $2a,x
$0a:9214  1c 2a 33	  trb $332a
$0a:9217  0d 30 70	  ora $7030
$0a:921a  70 70		 bvs $928c
$0a:921c  78			sei
$0a:921d  68			pla
$0a:921e  78			sei
$0a:921f  68			pla
$0a:9220  7d 65 7f	  adc $7f65,x
$0a:9223  67 7e		 adc [$7e]
$0a:9225  62 7e 63	  per $f5a6
$0a:9228  80 7f		 bra $92a9
$0a:922a  2a			rol a
$0a:922b  ea			nop
$0a:922c  2a			rol a
$0a:922d  bf 6d ff 10   lda $10ff6d,x
$0a:9231  bf 66 ff 17   lda $17ff66,x
$0a:9235  bf 67 ff 80   lda $80ff67,x
$0a:9239  ff 15 ff 40   sbc $40ff15,x
$0a:923d  ff 1f ff 5f   sbc $5fff1f,x
$0a:9241  ff 1f ff 5f   sbc $5fff1f,x
$0a:9245  ff 1a ff 14   sbc $14ff1a,x
$0a:9249  f9 a8 9f	  sbc $9fa8,y
$0a:924c  c2 fc		 rep #$fc
$0a:924e  40			rti
$0a:924f  9f ea e7 fa   sta $fae7ea,x
$0a:9253  fc fc ff	  jsr ($fffc,x)
$0a:9256  5d 3c ff	  eor $ff3c,x
$0a:9259  1e 87 78	  asl $7887,x
$0a:925c  f8			sed
$0a:925d  07 ff		 ora [$ff]
$0a:925f  e0 ff 1e	  cpx #$1eff
$0a:9262  f0 8f		 beq $91f3
$0a:9264  ff 00 fc f3   sbc $f3fc00,x
$0a:9268  55 9a		 eor $9a,x
$0a:926a  bf 68 8c 73   lda $738c68,x
$0a:926e  f9 27 e3	  sbc $e327,y
$0a:9271  9f 4a 2c ff   sta $ff2c4a,x
$0a:9275  bf 1f df 20   lda $20df1f,x
$0a:9279  00 00		 brk #$00
$0a:927b  00 01		 brk #$01
$0a:927d  00 03		 brk #$03
$0a:927f  00 0f		 brk #$0f
$0a:9281  06 90		 asl $90
$0a:9283  0f 1f 00 7f   ora $7f001f
$0a:9287  30 f4		 bmi $927d
$0a:9289  0f 94 70 ce   ora $ce7094
$0a:928d  38			sec
$0a:928e  d0 3c		 bne $92cc
$0a:9290  ed 18 82	  sbc $8218
$0a:9293  70 dc		 bvs $9271
$0a:9295  28			plp
$0a:9296  83 7d		 sta $7d,s
$0a:9298  00 00		 brk #$00
$0a:929a  0f 00 07 00   ora $000700
$0a:929e  07 00		 ora [$00]
$0a:92a0  07 00		 ora [$00]
$0a:92a2  0f 00 07 00   ora $000700
$0a:92a6  06 00		 asl $00
$0a:92a8  d0 ff		 bne $92a9
$0a:92aa  6f 5e 90 05   adc $05905e
$0a:92ae  5d 0c 8b	  eor $8b0c,x
$0a:92b1  9e 25 16	  stz $1625,x
$0a:92b4  da			phx
$0a:92b5  0b			phd
$0a:92b6  6c 0f 00	  jmp ($000f)
$0a:92b9  00 b0		 brk #$b0
$0a:92bb  00 fa		 brk #$fa
$0a:92bd  00 f2		 brk #$f2
$0a:92bf  00 70		 brk #$70
$0a:92c1  00 f8		 brk #$f8
$0a:92c3  00 f4		 brk #$f4
$0a:92c5  00 f0		 brk #$f0
$0a:92c7  00 02		 brk #$02
$0a:92c9  56 dc		 lsr $dc,x
$0a:92cb  31 d4		 and ($d4),y
$0a:92cd  62 24 e1	  per $73f4
$0a:92d0  4b			phk
$0a:92d1  7b			tdc
$0a:92d2  a9 6f d8	  lda #$d86f
$0a:92d5  c3 26		 cmp $26,s
$0a:92d7  ae e9 00	  ldx $00e9
$0a:92da  ce 00 9f	  dec $9f00
$0a:92dd  00 1e		 brk #$1e
$0a:92df  00 84		 brk #$84
$0a:92e1  00 90		 brk #$90
$0a:92e3  00 3c		 brk #$3c
$0a:92e5  00 59		 brk #$59
$0a:92e7  00 97		 brk #$97
$0a:92e9  31 28		 and ($28),y
$0a:92eb  63 14		 adc $14,s
$0a:92ed  b1 49		 lda ($49),y
$0a:92ef  3b			tsc
$0a:92f0  52 0e		 eor ($0e)
$0a:92f2  a5 9f		 lda $9f
$0a:92f4  4e db dd	  lsr $dddb
$0a:92f7  73 ce		 adc ($ce,s),y
$0a:92f9  00 9e		 brk #$9e
$0a:92fb  00 4e		 brk #$4e
$0a:92fd  00 e4		 brk #$e4
$0a:92ff  00 f1		 brk #$f1
$0a:9301  00 70		 brk #$70
$0a:9303  00 24		 brk #$24
$0a:9305  00 8e		 brk #$8e
$0a:9307  00 a3		 brk #$a3
$0a:9309  96 94		 stx $94,y
$0a:930b  8e 3a 8f	  stx $8f3a
$0a:930e  14 5c		 trb $5c
$0a:9310  8b			phb
$0a:9311  38			sec
$0a:9312  24 71		 bit $71
$0a:9314  61 c9		 adc ($c9,x)
$0a:9316  01 97		 ora ($97,x)
$0a:9318  79 00 79	  adc $7900,y
$0a:931b  00 70		 brk #$70
$0a:931d  00 a3		 brk #$a3
$0a:931f  00 c7		 brk #$c7
$0a:9321  00 8f		 brk #$8f
$0a:9323  00 36		 brk #$36
$0a:9325  00 78		 brk #$78
$0a:9327  00 c1		 brk #$c1
$0a:9329  69 4d c4	  adc #$c44d
$0a:932c  a2 aa 1c	  ldx #$1caa
$0a:932f  87 52		 sta [$52]
$0a:9331  5e 94 72	  lsr $7294,x
$0a:9334  ab			plb
$0a:9335  e9 42 65	  sbc #$6542
$0a:9338  96 00		 stx $00,y
$0a:933a  3b			tsc
$0a:933b  00 5d		 brk #$5d
$0a:933d  00 78		 brk #$78
$0a:933f  00 a1		 brk #$a1
$0a:9341  00 8d		 brk #$8d
$0a:9343  00 16		 brk #$16
$0a:9345  00 9e		 brk #$9e
$0a:9347  00 3a		 brk #$3a
$0a:9349  81 6e		 sta ($6e,x)
$0a:934b  55 34		 eor $34,x
$0a:934d  a8			tay
$0a:934e  51 36		 eor ($36),y
$0a:9350  5e 09 a7	  lsr $a709,x
$0a:9353  9c 4f da	  stz $da4f
$0a:9356  dd 73 7f	  cmp $7f73,x
$0a:9359  00 bb		 brk #$bb
$0a:935b  00 5f		 brk #$5f
$0a:935d  00 ef		 brk #$ef
$0a:935f  00 f7		 brk #$f7
$0a:9361  02 73		 cop #$73
$0a:9363  01 25		 ora ($25,x)
$0a:9365  00 8e		 brk #$8e
$0a:9367  00 ca		 brk #$ca
$0a:9369  15 86		 ora $86,x
$0a:936b  5a			phy
$0a:936c  be 87 0c	  ldx $0c87,y
$0a:936f  ec 29 d8	  cpx $d829
$0a:9372  66 b1		 ror $b1
$0a:9374  c3 49		 cmp $49,s
$0a:9376  22 96 fe 44   jsl $44fe96
$0a:937a  fd c0 78	  sbc $78c0,x
$0a:937d  10 f3		 bpl $9372
$0a:937f  20 e7 40	  jsr $40e7
$0a:9382  cf 80 b6 00   cmp $00b680
$0a:9386  79 00 ba	  adc $ba00,y
$0a:9389  85 b5		 sta $b5
$0a:938b  21 1e		 and ($1e,x)
$0a:938d  d3 c9		 cmp ($c9,s),y
$0a:938f  3b			tsc
$0a:9390  17 cc		 ora [$cc],y
$0a:9392  aa			tax
$0a:9393  74 9c		 stz $9c,x
$0a:9395  7b			tdc
$0a:9396  cb			wai
$0a:9397  34 7e		 bit $7e,x
$0a:9399  00 5e		 brk #$5e
$0a:939b  00 2c		 brk #$2c
$0a:939d  00 04		 brk #$04
$0a:939f  00 21		 brk #$21
$0a:93a1  00 01		 brk #$01
$0a:93a3  00 00		 brk #$00
$0a:93a5  00 00		 brk #$00
$0a:93a7  00 94		 brk #$94
$0a:93a9  aa			tax
$0a:93aa  4b			phk
$0a:93ab  c1 fd		 cmp ($fd,x)
$0a:93ad  b1 98		 lda ($98),y
$0a:93af  43 57		 eor $57,s
$0a:93b1  51 ce		 eor ($ce),y
$0a:93b3  e5 26		 sbc $26
$0a:93b5  ff 1e e1 7f   sbc $7fe11e,x
$0a:93b9  00 3e		 brk #$3e
$0a:93bb  00 4e		 brk #$4e
$0a:93bd  00 be		 brk #$be
$0a:93bf  00 ae		 brk #$ae
$0a:93c1  00 1a		 brk #$1a
$0a:93c3  00 00		 brk #$00
$0a:93c5  00 00		 brk #$00
$0a:93c7  00 2a		 brk #$2a
$0a:93c9  84 16		 sty $16
$0a:93cb  c1 2d		 cmp ($2d,x)
$0a:93cd  a0 d3 50	  ldy #$50d3
$0a:93d0  17 c2		 ora [$c2],y
$0a:93d2  ea			nop
$0a:93d3  68			pla
$0a:93d4  95 75		 sta $75,x
$0a:93d6  ff 00 7f 00   sbc $007f00,x
$0a:93da  3f 00 5f 00   and $005f00,x
$0a:93de  2f 00 3d 00   and $003d00
$0a:93e2  17 00		 ora [$00],y
$0a:93e4  0a			asl a
$0a:93e5  00 00		 brk #$00
$0a:93e7  00 92		 brk #$92
$0a:93e9  6d ea 15	  adc $15ea
$0a:93ec  b8			clv
$0a:93ed  0d 5c 21	  ora $215c
$0a:93f0  aa			tax
$0a:93f1  07 d4		 ora [$d4]
$0a:93f3  41 ad		 eor ($ad,x)
$0a:93f5  ae ff 00	  ldx $00ff
$0a:93f8  fe 00 fe	  inc $fe00,x
$0a:93fb  00 f6		 brk #$f6
$0a:93fd  00 fe		 brk #$fe
$0a:93ff  00 fc		 brk #$fc
$0a:9401  00 be		 brk #$be
$0a:9403  00 50		 brk #$50
$0a:9405  00 00		 brk #$00
$0a:9407  00 00		 brk #$00
$0a:9409  00 00		 brk #$00
$0a:940b  00 00		 brk #$00
$0a:940d  00 00		 brk #$00
$0a:940f  00 00		 brk #$00
$0a:9411  f8			sed
$0a:9412  74 70		 stz $70,x
$0a:9414  00 00		 brk #$00
$0a:9416  80 54		 bra $946c
$0a:9418  00 00		 brk #$00
$0a:941a  00 00		 brk #$00
$0a:941c  00 00		 brk #$00
$0a:941e  00 00		 brk #$00
$0a:9420  f8			sed
$0a:9421  f8			sed
$0a:9422  8c fc 04	  sty $04fc
$0a:9425  04 d6		 tsb $d6
$0a:9427  fe 17 bf	  inc $bf17,x
$0a:942a  65 fd		 adc $fd
$0a:942c  12 be		 ora ($be)
$0a:942e  63 ff		 adc $ff,s
$0a:9430  16 be		 asl $be,x
$0a:9432  66 fe		 ror $fe
$0a:9434  17 bf		 ora [$bf],y
$0a:9436  67 ff		 adc [$ff]
$0a:9438  5d ff 1e	  eor $1eff,x
$0a:943b  ff 5f ff 1e   sbc $1eff5f,x
$0a:943f  ff 5d ff 1b   sbc $1bff5d,x
$0a:9443  ff 5e ff 1d   sbc $1dff5e,x
$0a:9447  ff 8a 7c 80   sbc $807c8a,x
$0a:944b  ff 28 9f 28   sbc $289f28,x
$0a:944f  f3 80		 sbc ($80,s),y
$0a:9451  fe 40 df	  inc $df40,x
$0a:9454  8a			txa
$0a:9455  e7 40		 sbc [$40]
$0a:9457  ff 30 cf ff   sbc $ffcf30,x
$0a:945b  00 ff		 brk #$ff
$0a:945d  78			sei
$0a:945e  c3 3c		 cmp $3c,s
$0a:9460  ff 01 ff 60   sbc $60ff01,x
$0a:9464  e1 1e		 sbc ($1e,x)
$0a:9466  3f c0 00 ff   and $ff00c0,x
$0a:946a  a8			tay
$0a:946b  f3 50		 sbc ($50,s),y
$0a:946d  3f 02 fc a0   and $a0fc02,x
$0a:9471  7f 85 f3 00   adc $00f385,x
$0a:9475  ff 51 3c ff   sbc $ff3c51,x
$0a:9479  00 ff		 brk #$ff
$0a:947b  3c 0f f0	  bit $f00f,x
$0a:947e  f8			sed
$0a:947f  07 ff		 ora [$ff]
$0a:9481  e0 f0 0f	  cpx #$0ff0
$0a:9484  ff 00 fc f3   sbc $f3fc00,x
$0a:9488  a8			tay
$0a:9489  48			pha
$0a:948a  94 70		 sty $70,x
$0a:948c  ce 38 d0	  dec $d038
$0a:948f  3c ed 18	  bit $18ed,x
$0a:9492  82 70 dc	  brl $7105
$0a:9495  28			plp
$0a:9496  83 7d		 sta $7d,s
$0a:9498  17 00		 ora [$00],y
$0a:949a  0f 00 07 00   ora $000700
$0a:949e  07 00		 ora [$00]
$0a:94a0  07 00		 ora [$00]
$0a:94a2  0f 00 07 00   ora $000700
$0a:94a6  06 00		 asl $00
$0a:94a8  aa			tax
$0a:94a9  1f 6f 5e 90   ora $905e6f,x
$0a:94ad  05 5d		 ora $5d
$0a:94af  0c 8b 9e	  tsb $9e8b
$0a:94b2  25 16		 and $16
$0a:94b4  da			phx
$0a:94b5  0b			phd
$0a:94b6  6c 0f f0	  jmp ($f00f)
$0a:94b9  00 b0		 brk #$b0
$0a:94bb  00 fa		 brk #$fa
$0a:94bd  00 f2		 brk #$f2
$0a:94bf  00 70		 brk #$70
$0a:94c1  00 f8		 brk #$f8
$0a:94c3  00 f4		 brk #$f4
$0a:94c5  00 f0		 brk #$f0
$0a:94c7  00 2b		 brk #$2b
$0a:94c9  7f e5 9a ea   adc $ea9ae5,x
$0a:94cd  85 95		 sta $95
$0a:94cf  a2 aa 94	  ldx #$94aa
$0a:94d2  df 80 48 c8   cmp $c84880,x
$0a:94d6  36 f7		 rol $f7,x
$0a:94d8  ff ff 7f ff   sbc $ff7fff,x
$0a:94dc  7f ff 7f ff   adc $ff7fff,x
$0a:94e0  7f ff 7f ff   adc $ff7fff,x
$0a:94e4  37 ff		 and [$ff],y
$0a:94e6  08			php
$0a:94e7  ff 6b ff 28   sbc $28ff6b,x
$0a:94eb  d7 54		 cmp [$54],y
$0a:94ed  8b			phb
$0a:94ee  91 67		 sta ($67),y
$0a:94f0  6b			rtl
$0a:94f1  95 5e		 sta $5e,x
$0a:94f3  01 c9		 ora ($c9,x)
$0a:94f5  48			pha
$0a:94f6  4b			phk
$0a:94f7  ff ff f9 ff   sbc $fff9ff,x
$0a:94fb  fe ff fe	  inc $feff,x
$0a:94fe  ff ff ff ff   sbc $ffffff,x
$0a:9502  ff ff b7 ff   sbc $ffb7ff,x
$0a:9506  00 ff		 brk #$ff
$0a:9508  d4 54		 pei ($54)
$0a:950a  1a			inc a
$0a:950b  7f 15 6f ea   adc $ea6f15,x
$0a:950f  b7 55		 lda [$55],y
$0a:9511  3e a0 df	  rol $dfa0,x
$0a:9514  b7 80		 lda [$80],y
$0a:9516  d1 d1		 cmp ($d1),y
$0a:9518  d4 2b		 pei ($2b)
$0a:951a  ff 00 ff 00   sbc $00ff00,x
$0a:951e  7f 00 ff 00   adc $00ff00,x
$0a:9522  7f 00 7f 00   adc $007f00,x
$0a:9526  2e 00 91	  rol $9100
$0a:9529  91 d6		 sta ($d6),y
$0a:952b  fe aa de	  inc $deaa,x
$0a:952e  6e f6 94	  ror $94f6
$0a:9531  fe a1 5f	  inc $5fa1,x
$0a:9534  36 81		 rol $81,x
$0a:9536  b4 b4		 ldy $b4,x
$0a:9538  91 6e		 sta ($6e),y
$0a:953a  fe 01 fe	  inc $fe01,x
$0a:953d  01 fe		 ora ($fe,x)
$0a:953f  01 fe		 ora ($fe,x)
$0a:9541  01 ff		 ora ($ff,x)
$0a:9543  00 ff		 brk #$ff
$0a:9545  00 4b		 brk #$4b
$0a:9547  00 6d		 brk #$6d
$0a:9549  fb			xce
$0a:954a  2b			pld
$0a:954b  d6 55		 dec $55,x
$0a:954d  8a			txa
$0a:954e  91 67		 sta ($67),y
$0a:9550  6b			rtl
$0a:9551  95 5e		 sta $5e,x
$0a:9553  01 c9		 ora ($c9,x)
$0a:9555  48			pha
$0a:9556  4b			phk
$0a:9557  ff ff f9 ff   sbc $fff9ff,x
$0a:955b  fe ff fe	  inc $feff,x
$0a:955e  ff ff ff ff   sbc $ffffff,x
$0a:9562  ff ff b7 ff   sbc $ffb7ff,x
$0a:9566  00 ff		 brk #$ff
$0a:9568  ff 00 7f 6c   sbc $6c7f00,x
$0a:956c  cb			wai
$0a:956d  0a			asl a
$0a:956e  6f 66 37 02   adc $023766
$0a:9572  2b			pld
$0a:9573  c8			iny
$0a:9574  ab			plb
$0a:9575  72 b7		 adc ($b7)
$0a:9577  b6 00		 ldx $00,y
$0a:9579  ff 80 ff f4   sbc $f4ff80,x
$0a:957d  ff 98 ff fc   sbc $fcff98,x
$0a:9581  ff f4 ff fc   sbc $fcfff4,x
$0a:9585  ff 48 ff a4   sbc $a4ff48,x
$0a:9589  72 da		 adc ($da)
$0a:958b  b9 27 1e	  lda $1e27,y
$0a:958e  34 6e		 bit $6e,x
$0a:9590  ca			dex
$0a:9591  86 35		 stx $35
$0a:9593  23 2e		 and $2e,s
$0a:9595  65 55		 adc $55
$0a:9597  1c 0f 00	  trb $000f
$0a:959a  87 00		 sta [$00]
$0a:959c  01 c0		 ora ($c0,x)
$0a:959e  21 c0		 and ($c0,x)
$0a:95a0  81 70		 sta ($70,x)
$0a:95a2  20 d8 24	  jsr $24d8
$0a:95a5  d8			cld
$0a:95a6  14 ea		 trb $ea
$0a:95a8  9a			txs
$0a:95a9  6b			rtl
$0a:95aa  24 ce		 bit $ce
$0a:95ac  5b			tcd
$0a:95ad  dd 66 3c	  cmp $3c66,x
$0a:95b0  a5 34		 lda $34
$0a:95b2  58			cli
$0a:95b3  f1 81		 sbc ($81),y
$0a:95b5  c4 37		 cpy $37
$0a:95b7  9a			txs
$0a:95b8  f4 00 f0	  pea $f000
$0a:95bb  81 a1		 sta ($a1,x)
$0a:95bd  02 c4		 cop #$c4
$0a:95bf  03 c4		 ora $c4,s
$0a:95c1  0b			phd
$0a:95c2  10 0f		 bpl $95d3
$0a:95c4  00 3f		 brk #$3f
$0a:95c6  12 6d		 ora ($6d)
$0a:95c8  b7 48		 lda [$48],y
$0a:95ca  fe 4a b3	  inc $b34a,x
$0a:95cd  05 b5		 ora $b5
$0a:95cf  08			php
$0a:95d0  f9 52 d7	  sbc $d752,y
$0a:95d3  0a			asl a
$0a:95d4  eb			xba
$0a:95d5  59 be a1	  eor $a1be,y
$0a:95d8  01 00		 ora ($00,x)
$0a:95da  01 00		 ora ($00,x)
$0a:95dc  4a			lsr a
$0a:95dd  00 46		 brk #$46
$0a:95df  00 0c		 brk #$0c
$0a:95e1  00 30		 brk #$30
$0a:95e3  00 24		 brk #$24
$0a:95e5  00 40		 brk #$40
$0a:95e7  00 d1		 brk #$d1
$0a:95e9  d1 4b		 cmp ($4b),y
$0a:95eb  ff d1 f4 22   sbc $22f4d1,x
$0a:95ef  be 15 c7	  ldx $c715,y
$0a:95f2  d4 33		 pei ($33)
$0a:95f4  a5 5c		 lda $5c
$0a:95f6  89 77 2e	  bit #$2e77
$0a:95f9  00 00		 brk #$00
$0a:95fb  00 0b		 brk #$0b
$0a:95fd  00 41		 brk #$41
$0a:95ff  00 38		 brk #$38
$0a:9601  00 0f		 brk #$0f
$0a:9603  80 03		 bra $9608
$0a:9605  c0 00 f0	  cpy #$f000
$0a:9608  8b			phb
$0a:9609  8b			phb
$0a:960a  d2 fe		 cmp ($fe)
$0a:960c  a9 8d dd	  lda #$dd8d
$0a:960f  59 8a d3	  eor $d38a,y
$0a:9612  d4 e7		 pei ($e7)
$0a:9614  de 1f e2	  dec $e21f,x
$0a:9617  e3 74		 sbc $74,s
$0a:9619  00 01		 brk #$01
$0a:961b  00 f2		 brk #$f2
$0a:961d  00 a6		 brk #$a6
$0a:961f  00 3c		 brk #$3c
$0a:9621  01 f8		 ora ($f8,x)
$0a:9623  03 e0		 ora $e0,s
$0a:9625  07 1c		 ora [$1c]
$0a:9627  1f 5b df ad   ora $addf5b,x
$0a:962b  6f d6 77 ab   adc $ab77d6
$0a:962f  1b			tcs
$0a:9630  f5 5d		 sbc $5d,x
$0a:9632  a8			tay
$0a:9633  02 ff		 cop #$ff
$0a:9635  55 aa		 eor $aa,x
$0a:9637  55 2e		 eor $2e,x
$0a:9639  ff 97 ff 8b   sbc $8bff97,x
$0a:963d  ff e5 ff a2   sbc $a2ffe5,x
$0a:9641  ff fd ff aa   sbc $aafffd,x
$0a:9645  ff aa ff dd   sbc $ddffaa,x
$0a:9649  55 5a		 eor $5a,x
$0a:964b  47 45		 eor [$45]
$0a:964d  0a			asl a
$0a:964e  3a			dec a
$0a:964f  79 a6 9c	  adc $9ca6,y
$0a:9652  09 20 e6	  ora #$e620
$0a:9655  4e 1d 9f	  lsr $9f1d
$0a:9658  52 a0		 eor ($a0)
$0a:965a  40			rti
$0a:965b  b0 04		 bcs $9661
$0a:965d  f0 36		 beq $9695
$0a:965f  c0 83 60	  cpy #$6083
$0a:9662  07 f0		 ora [$f0]
$0a:9664  41 b0		 eor ($b0,x)
$0a:9666  10 e0		 bpl $9648
$0a:9668  55 e5		 eor $e5,x
$0a:966a  bf 4b d3 09   lda $09d34b,x
$0a:966e  84 14		 sty $14
$0a:9670  8f b6 73 62   sta $6273b6
$0a:9674  9e ea 42	  stz $42ea,x
$0a:9677  b2 05		 lda ($05)
$0a:9679  0a			asl a
$0a:967a  0b			phd
$0a:967b  04 21		 tsb $21
$0a:967d  06 64		 asl $64
$0a:967f  0b			phd
$0a:9680  46 09		 lsr $09
$0a:9682  82 0d 0a	  brl $a092
$0a:9685  05 02		 ora $02
$0a:9687  0d 55 9a	  ora $9a55
$0a:968a  bf 68 8d 72   lda $728d68,x
$0a:968e  fb			xce
$0a:968f  26 e9		 rol $e9
$0a:9691  9e 4f 22	  stz $224f,x
$0a:9694  e5 b2		 sbc $b2
$0a:9696  51 be		 eor ($be),y
$0a:9698  20 00 00	  jsr $0000
$0a:969b  00 00		 brk #$00
$0a:969d  00 00		 brk #$00
$0a:969f  00 00		 brk #$00
$0a:96a1  00 98		 brk #$98
$0a:96a3  00 08		 brk #$08
$0a:96a5  00 00		 brk #$00
$0a:96a7  00 af		 brk #$af
$0a:96a9  ca			dex
$0a:96aa  45 d2		 eor $d2
$0a:96ac  f3 7e		 sbc ($7e,s),y
$0a:96ae  0d d4 36	  ora $36d4
$0a:96b1  57 b0		 eor [$b0],y
$0a:96b3  6d 5a 17	  adc $175a
$0a:96b6  ae ef 30	  ldx $30ef
$0a:96b9  00 28		 brk #$28
$0a:96bb  00 00		 brk #$00
$0a:96bd  00 22		 brk #$22
$0a:96bf  00 88		 brk #$88
$0a:96c1  00 9a		 brk #$9a
$0a:96c3  00 a8		 brk #$a8
$0a:96c5  00 10		 brk #$10
$0a:96c7  00 b4		 brk #$b4
$0a:96c9  fb			xce
$0a:96ca  2d da cb	  and $cbda
$0a:96cd  25 71		 and $71
$0a:96cf  87 9a		 sta [$9a]
$0a:96d1  01 b9		 ora ($b9,x)
$0a:96d3  b8			clv
$0a:96d4  24 ff		 bit $ff
$0a:96d6  c9 b7 ff	  cmp #$ffb7
$0a:96d9  f9 ff fe	  sbc $feff,y
$0a:96dc  ff ff ff ff   sbc $ffffff,x
$0a:96e0  ff ff 47 ff   sbc $ff47ff,x
$0a:96e4  00 ff		 brk #$ff
$0a:96e6  7f ff 56 3f   adc $3f56ff,x
$0a:96ea  ad 92 ea	  lda $ea92
$0a:96ed  85 37		 sta $37
$0a:96ef  80 a5		 bra $9696
$0a:96f1  a4 59		 ldy $59
$0a:96f3  d9 44 ff	  cmp $ff44,y
$0a:96f6  a6 ff		 ldx $ff
$0a:96f8  ff ff 7f ff   sbc $ff7fff,x
$0a:96fc  7f ff 7f ff   adc $ff7fff,x
$0a:9700  5b			tcd
$0a:9701  ff 26 ff 00   sbc $00ff26,x
$0a:9705  ff ff ff 49   sbc $49ffff,x
$0a:9709  49 52 76	  eor #$7652
$0a:970c  b4 ee		 ldy $ee,x
$0a:970e  0e 76 e5	  asl $e576
$0a:9711  9b			txy
$0a:9712  c6 81		 dec $81
$0a:9714  5b			tcd
$0a:9715  db			stp
$0a:9716  36 7e		 rol $7e,x
$0a:9718  c9 36 f6	  cmp #$f636
$0a:971b  09 7e 01	  ora #$017e
$0a:971e  fe 01 7f	  inc $7f01,x
$0a:9721  00 7f		 brk #$7f
$0a:9723  00 24		 brk #$24
$0a:9725  00 fe		 brk #$fe
$0a:9727  01 a9		 ora ($a9,x)
$0a:9729  69 52 3f	  adc #$3f52
$0a:972c  15 6f		 ora $6f,x
$0a:972e  c8			iny
$0a:972f  b7 5a		 lda [$5a],y
$0a:9731  01 a6		 ora ($a6,x)
$0a:9733  80 bb		 bra $96f0
$0a:9735  bb			tyx
$0a:9736  59 59 e9	  eor $e959,y
$0a:9739  16 ff		 asl $ff,x
$0a:973b  00 ff		 brk #$ff
$0a:973d  00 7f		 brk #$7f
$0a:973f  00 ff		 brk #$ff
$0a:9741  00 7f		 brk #$7f
$0a:9743  00 44		 brk #$44
$0a:9745  00 59		 brk #$59
$0a:9747  a6 67		 ldx $67
$0a:9749  e7 95		 sbc [$95]
$0a:974b  50 aa		 bvc $96f7
$0a:974d  68			pla
$0a:974e  fa			plx
$0a:974f  32 ad		 and ($ad)
$0a:9751  5d fb 3e	  eor $3efb,x
$0a:9754  c5 37		 cmp $37
$0a:9756  f5 15		 sbc $15,x
$0a:9758  18			clc
$0a:9759  ff 2f ff 17   sbc $17ff2f,x
$0a:975d  ff 0d ff 02   sbc $02ff0d,x
$0a:9761  ff 01 7f 08   sbc $087f01,x
$0a:9765  3f 0a 7f 39   and $397f0a,x
$0a:9769  39 d2 2d	  and $2dd2,y
$0a:976c  6d 42 54	  adc $5442
$0a:976f  10 19		 bpl $978a
$0a:9771  00 22		 brk #$22
$0a:9773  42 25		 wdm #$25
$0a:9775  25 4a		 and $4a
$0a:9777  c2 c6		 rep #$c6
$0a:9779  ff ff ff bf   sbc $bfffff,x
$0a:977d  ff ef ff ff   sbc $ffffef,x
$0a:9781  ff bd ff da   sbc $daffbd,x
$0a:9785  ff 3d ff a7   sbc $a7ff3d,x
$0a:9789  71 db		 adc ($db),y
$0a:978b  3a			dec a
$0a:978c  a5 5d		 lda $5d
$0a:978e  96 6e		 stx $6e,y
$0a:9790  aa			tax
$0a:9791  76 c5		 ror $c5,x
$0a:9793  2b			pld
$0a:9794  fa			plx
$0a:9795  35 a1		 and $a1,x
$0a:9797  66 0e		 ror $0e
$0a:9799  00 05		 brk #$05
$0a:979b  00 02		 brk #$02
$0a:979d  00 01		 brk #$01
$0a:979f  00 01		 brk #$01
$0a:97a1  00 10		 brk #$10
$0a:97a3  00 08		 brk #$08
$0a:97a5  00 1c		 brk #$1c
$0a:97a7  00 9b		 brk #$9b
$0a:97a9  6a			ror a
$0a:97aa  25 86		 and $86
$0a:97ac  de 1b 1e	  dec $1e1b,x
$0a:97af  97 ab		 sta [$ab],y
$0a:97b1  3a			dec a
$0a:97b2  7d 56 a4	  adc $a456,x
$0a:97b5  f3 db		 sbc ($db,s),y
$0a:97b7  62 f4 00	  per $98ae
$0a:97ba  f8			sed
$0a:97bb  00 e0		 brk #$e0
$0a:97bd  00 e0		 brk #$e0
$0a:97bf  00 c4		 brk #$c4
$0a:97c1  00 88		 brk #$88
$0a:97c3  00 1c		 brk #$1c
$0a:97c5  00 3c		 brk #$3c
$0a:97c7  20 f3 a8	  jsr $a8f3
$0a:97ca  15 f3		 ora $f3,x
$0a:97cc  e2 bd		 sep #$bd
$0a:97ce  9d a2 1c	  sta $1ca2,x
$0a:97d1  e2 dd		 sep #$dd
$0a:97d3  a3 82		 lda $82,s
$0a:97d5  9f cd af 44   sta $44afcd,x
$0a:97d9  00 4c		 brk #$4c
$0a:97db  00 42		 brk #$42
$0a:97dd  00 41		 brk #$41
$0a:97df  00 41		 brk #$41
$0a:97e1  00 40		 brk #$40
$0a:97e3  00 60		 brk #$60
$0a:97e5  00 50		 brk #$50
$0a:97e7  00 32		 brk #$32
$0a:97e9  33 46		 and ($46,s),y
$0a:97eb  bd 75 0b	  lda $0b75,x
$0a:97ee  ae 80 49	  ldx $4980
$0a:97f1  43 9f		 eor $9f,s
$0a:97f3  09 43		 ora #$43
$0a:97f5  61 54		 adc ($54,x)
$0a:97f7  51 cc		 eor ($cc),y
$0a:97f9  ff fe ff fe   sbc $fefffe,x
$0a:97fd  ff 7f ff be   sbc $beff7f,x
$0a:9801  ff f6 ff 9e   sbc $9efff6,x
$0a:9805  ff ae ff d4   sbc $d4ffae,x
$0a:9809  ab			plb
$0a:980a  1a			inc a
$0a:980b  80 1a		 bra $9827
$0a:980d  91 e6		 sta ($e6),y
$0a:980f  42 5b		 wdm #$5b
$0a:9811  c1 a1		 cmp ($a1,x)
$0a:9813  20 b7 7f	  jsr $7fb7
$0a:9816  d1 2e		 cmp ($2e),y
$0a:9818  7f 00 7f 00   adc $007f00,x
$0a:981c  67 0f		 adc [$0f]
$0a:981e  39 07 3c	  and $3c07,y
$0a:9821  03 5e		 ora $5e,s
$0a:9823  01 00		 ora ($00,x)
$0a:9825  00 00		 brk #$00
$0a:9827  00 98		 brk #$98
$0a:9829  79 d3 0f	  adc $0fd3,y
$0a:982c  54 d2 bf	  mvn $bf,$d2
$0a:982f  31 64		 and ($64),y
$0a:9831  61 11		 adc ($11,x)
$0a:9833  80 36		 bra $986b
$0a:9835  7e b4 4b	  ror $4bb4,x
$0a:9838  f9 06 ff	  sbc $ff06,y
$0a:983b  00 ee		 brk #$ee
$0a:983d  f1 cf		 sbc ($cf),y
$0a:983f  e0 9f		 cpx #$9f
$0a:9841  c0 7f		 cpy #$7f
$0a:9843  80 81		 bra $97c6
$0a:9845  00 00		 brk #$00
$0a:9847  00 4a		 brk #$4a
$0a:9849  a5 8d		 lda $8d
$0a:984b  5e 12 b5	  lsr $b512,x
$0a:984e  a5 e9		 lda $e9
$0a:9850  c4 9c		 cpy $9c
$0a:9852  3a			dec a
$0a:9853  ea			nop
$0a:9854  d4 98		 pei ($98)
$0a:9856  aa			tax
$0a:9857  ac 1f 00	  ldy $001f
$0a:985a  3f 00 77 08   and $087700,x
$0a:985e  6f 10 5c 23   adc $235c10
$0a:9862  7a			ply
$0a:9863  05 5e		 ora $5e
$0a:9865  21 6e		 and ($6e,x)
$0a:9867  11 94		 ora ($94),y
$0a:9869  66 42		 ror $42
$0a:986b  cb			wai
$0a:986c  a1 e5		 lda ($e5,x)
$0a:986e  55 37		 eor $37,x
$0a:9870  ab			plb
$0a:9871  b9 15 1f	  lda $1f15,y
$0a:9874  ab			plb
$0a:9875  99 53 31	  sta $3153,y
$0a:9878  f9 01 cc	  sbc $cc01,y
$0a:987b  30 e6		 bmi $9863
$0a:987d  18			clc
$0a:987e  76 88		 ror $88,x
$0a:9880  ba			tsx
$0a:9881  44 1e e0	  mvp $e0,$1e
$0a:9884  fa			plx
$0a:9885  04 72		 tsb $72
$0a:9887  8c 0b f8	  sty $f80b
$0a:988a  65 97		 adc $97
$0a:988c  cc 34 a0	  cpy $a034
$0a:988f  7c 7f f7	  jmp ($f77f,x)
$0a:9892  4e d6 3d	  lsr $3dd6
$0a:9895  b2 12		 lda ($12)
$0a:9897  d7 07		 cmp [$07],y
$0a:9899  e0 0f		 cpx #$0f
$0a:989b  e0 0f		 cpx #$0f
$0a:989d  e0 0f		 cpx #$0f
$0a:989f  c0 0c		 cpy #$0c
$0a:98a1  c0 2e		 cpy #$2e
$0a:98a3  c1 4f		 cmp ($4f,x)
$0a:98a5  c0 2f		 cpy #$2f
$0a:98a7  c0 60		 cpy #$60
$0a:98a9  8f bf e8 4f   sta $4fe8bf
$0a:98ad  5c a9 f9 97   jml $97f9a9
$0a:98b1  c1 01		 cmp ($01,x)
$0a:98b3  17 a7		 ora [$a7],y
$0a:98b5  f5 b7		 sbc $b7,x
$0a:98b7  67 f0		 adc [$f0]
$0a:98b9  07 f0		 ora [$f0]
$0a:98bb  07 90		 ora [$90]
$0a:98bd  27 36		 and [$36]
$0a:98bf  03 1e		 ora $1e,s
$0a:98c1  23 1e		 and $1e,s
$0a:98c3  e3 fe		 sbc $fe,s
$0a:98c5  03 fc		 ora $fc,s
$0a:98c7  03 37		 ora $37,s
$0a:98c9  a8			tay
$0a:98ca  55 c4		 eor $c4,x
$0a:98cc  99 7f 69	  sta $697f,y
$0a:98cf  96 c8		 stx $c8,y
$0a:98d1  37 6a		 and [$6a],y
$0a:98d3  01 9a		 ora ($9a,x)
$0a:98d5  fe ee 11	  inc $11ee,x
$0a:98d8  5f ff 3b ff   eor $ff3bff,x
$0a:98dc  00 ff		 brk #$ff
$0a:98de  00 ff		 brk #$ff
$0a:98e0  ff ff ff ff   sbc $ffffff,x
$0a:98e4  01 ff		 ora ($ff,x)
$0a:98e6  00 ff		 brk #$ff
$0a:98e8  a8			tay
$0a:98e9  53 4e		 eor ($4e,s),y
$0a:98eb  01 ad		 ora ($ad,x)
$0a:98ed  ec a4 5b	  cpx $5ba4
$0a:98f0  a4 1b		 ldy $1b
$0a:98f2  4b			phk
$0a:98f3  c0 95		 cpy #$95
$0a:98f5  7f db 24 ff   adc $ff24db,x
$0a:98f9  ff ff ff 13   sbc $13ffff,x
$0a:98fd  ff 00 ff 7f   sbc $7fff00,x
$0a:9901  ff 3f ff 00   sbc $00ff3f,x
$0a:9905  ff 00 ff c8   sbc $c8ff00,x
$0a:9909  9f aa 91 66   sta $6691aa,x
$0a:990d  e6 96		 inc $96
$0a:990f  ff 37 7f d5   sbc $d57f37,x
$0a:9913  ab			plb
$0a:9914  e5 e4		 sbc $e4
$0a:9916  11 ff		 ora ($ff),y
$0a:9918  7f 00 7f 00   adc $007f00,x
$0a:991c  19 00 00	  ora $0000,y
$0a:991f  00 ff		 brk #$ff
$0a:9921  00 7f		 brk #$7f
$0a:9923  00 1b		 brk #$1b
$0a:9925  00 00		 brk #$00
$0a:9927  00 57		 brk #$57
$0a:9929  fb			xce
$0a:992a  b1 4f		 lda ($4f),y
$0a:992c  52 41		 eor ($41)
$0a:992e  5b			tcd
$0a:992f  ff 5b bf b4   sbc $b4bf5b,x
$0a:9933  8b			phb
$0a:9934  6a			ror a
$0a:9935  ea			nop
$0a:9936  24 ff		 bit $ff
$0a:9938  ff 00 ff 00   sbc $00ff00,x
$0a:993c  bf 00 00 00   lda $000000,x
$0a:9940  7f 00 7f 00   adc $007f00,x
$0a:9944  15 00		 ora $00,x
$0a:9946  00 00		 brk #$00
$0a:9948  cf 2b d9 39   cmp $39d92b
$0a:994c  ee 3e d3	  inc $d33e
$0a:994f  2b			pld
$0a:9950  c5 3f		 cmp $3f
$0a:9952  ea			nop
$0a:9953  17 f3		 ora [$f3],y
$0a:9955  0c ff 00	  tsb $00ff
$0a:9958  14 ff		 trb $ff
$0a:995a  06 7f		 asl $7f
$0a:995c  01 7f		 ora ($7f,x)
$0a:995e  04 7f		 tsb $7f
$0a:9960  00 7f		 brk #$7f
$0a:9962  00 3f		 brk #$3f
$0a:9964  00 3f		 brk #$3f
$0a:9966  00 1a		 brk #$1a
$0a:9968  24 34		 bit $34
$0a:996a  5a			phy
$0a:996b  5a			phy
$0a:996c  dd ef 25	  cmp $25ef,x
$0a:996f  65 26		 adc $26
$0a:9971  ff c8 b7 75   sbc $75b7c8,x
$0a:9975  8a			txa
$0a:9976  ff 00 cb ff   sbc $ffcb00,x
$0a:997a  a5 ff		 lda $ff
$0a:997c  10 ff		 bpl $997d
$0a:997e  9a			txs
$0a:997f  ff 00 ff 00   sbc $00ff00,x
$0a:9983  ff 00 ff 00   sbc $00ff00,x
$0a:9987  26 a6		 rol $a6
$0a:9989  70 59		 bvs $99e4
$0a:998b  b9 24 5c	  lda $5c24,y
$0a:998e  97 2f		 sta [$2f],y
$0a:9990  0a			asl a
$0a:9991  56 e5		 lsr $e5,x
$0a:9993  8b			phb
$0a:9994  52 d5		 eor ($d5)
$0a:9996  49 c2		 eor #$c2
$0a:9998  0f 00 06 00   ora $000600
$0a:999c  83 00		 sta $00,s
$0a:999e  c0 00		 cpy #$00
$0a:99a0  e1 00		 sbc ($00,x)
$0a:99a2  70 00		 bvs $99a4
$0a:99a4  28			plp
$0a:99a5  00 3c		 brk #$3c
$0a:99a7  00 9a		 brk #$9a
$0a:99a9  6b			rtl
$0a:99aa  25 c7		 and $c7
$0a:99ac  5b			tcd
$0a:99ad  9c d6 1d	  stz $1dd6
$0a:99b0  3d aa 58	  and $58aa,x
$0a:99b3  76 b5		 ror $b5,x
$0a:99b5  e1 6d		 sbc ($6d,x)
$0a:99b7  d1 f4		 cmp ($f4),y
$0a:99b9  00 f8		 brk #$f8
$0a:99bb  80 e1		 bra $999e
$0a:99bd  00 e3		 brk #$e3
$0a:99bf  00 c7		 brk #$c7
$0a:99c1  02 8f		 cop #$8f
$0a:99c3  00 1e		 brk #$1e
$0a:99c5  00 3e		 brk #$3e
$0a:99c7  00 a3		 brk #$a3
$0a:99c9  9c 1f e0	  stz $e01f
$0a:99cc  99 e6 eb	  sta $ebe6,y
$0a:99cf  9f 1f ff d4   sta $d4ff1f,x
$0a:99d3  80 ec		 bra $99c1
$0a:99d5  a3 1f		 lda $1f,s
$0a:99d7  a0 40		 ldy #$40
$0a:99d9  00 40		 brk #$40
$0a:99db  00 40		 brk #$40
$0a:99dd  00 40		 brk #$40
$0a:99df  00 40		 brk #$40
$0a:99e1  00 7f		 brk #$7f
$0a:99e3  00 5f		 brk #$5f
$0a:99e5  00 40		 brk #$40
$0a:99e7  00 c1		 brk #$c1
$0a:99e9  83 a8		 sta $a8,s
$0a:99eb  a1 5a		 lda ($5a,x)
$0a:99ed  5b			tcd
$0a:99ee  64 f5		 stz $f5
$0a:99f0  5b			tcd
$0a:99f1  79 b6 d7	  adc $d7b6,y
$0a:99f4  d9 26 ff	  cmp $ff26,y
$0a:99f7  00 7c		 brk #$7c
$0a:99f9  ff 5e ff a4   sbc $a4ff5e,x
$0a:99fd  ff 0a ff 86   sbc $86ff0a,x
$0a:9a01  ff 08 ff 00   sbc $00ff08,x
$0a:9a05  ff 00 61 ca   sbc $ca6100,x
$0a:9a09  d7 45		 cmp [$45],y
$0a:9a0b  2a			rol a
$0a:9a0c  8b			phb
$0a:9a0d  ec 75 36	  cpx $3675
$0a:9a10  c9 ac		 cmp #$ac
$0a:9a12  3a			dec a
$0a:9a13  4b			phk
$0a:9a14  d5 a7		 cmp $a7,x
$0a:9a16  2b			pld
$0a:9a17  6b			rtl
$0a:9a18  20 ff f0	  jsr $f0ff
$0a:9a1b  ff 70 ff e8   sbc $e8ff70,x
$0a:9a1f  ff 72 ff f4   sbc $f4ff72,x
$0a:9a23  ff 78 ff f4   sbc $f4ff78,x
$0a:9a27  ff bc 47 fd   sbc $fd47bc,x
$0a:9a2b  09 ee		 ora #$ee
$0a:9a2d  19 d1 3d	  ora $3dd1,y
$0a:9a30  ec 59 83	  cpx $8359
$0a:9a33  71 dc		 adc ($dc),y
$0a:9a35  29 83		 and #$83
$0a:9a37  7d 00 ef	  adc $ef00,x
$0a:9a3a  06 5f		 asl $5f
$0a:9a3c  06 3f		 asl $3f
$0a:9a3e  06 7f		 asl $7f
$0a:9a40  06 7f		 asl $7f
$0a:9a42  0e ff 06	  asl $06ff
$0a:9a45  ff 06 ff ba   sbc $baff06,x
$0a:9a49  73 ab		 adc ($ab,s),y
$0a:9a4b  6e 9a 7b	  ror $7b9a
$0a:9a4e  ec 3f 96	  cpx $963f
$0a:9a51  77 fe		 adc [$fe],y
$0a:9a53  3d 98 7d	  and $7d98,x
$0a:9a56  f7 3e		 sbc [$3e],y
$0a:9a58  0c ff 10	  tsb $10ff
$0a:9a5b  ff 04 ff 00   sbc $00ff04,x
$0a:9a5f  ff 08 7f 02   sbc $027f08,x
$0a:9a63  7f 02 ff 00   adc $00ff02,x
$0a:9a67  ff d5 48 70   sbc $7048d5,x
$0a:9a6b  b0 23		 bcs $9a90
$0a:9a6d  e3 ab		 sbc $ab,s
$0a:9a6f  ef 75 bf 39   sbc $39bf75
$0a:9a73  f6 65		 inc $65,x
$0a:9a75  a9 e2		 lda #$e2
$0a:9a77  a4 3f		 ldy $3f
$0a:9a79  80 70		 bra $9aeb
$0a:9a7b  0f 63 1c 6f   ora $6f1c63
$0a:9a7f  10 7f		 bpl $9b00
$0a:9a81  00 7f		 brk #$7f
$0a:9a83  00 6e		 brk #$6e
$0a:9a85  10 67		 bpl $9aee
$0a:9a87  18			clc
$0a:9a88  12 d5		 ora ($d5)
$0a:9a8a  56 8e		 lsr $8e,x
$0a:9a8c  ec 23 ae	  cpx $ae23
$0a:9a8f  5e 7b d0	  lsr $d07b,x
$0a:9a92  51 f0		 eor ($f0),y
$0a:9a94  35 92		 and $92,x
$0a:9a96  2c dc 2f	  bit $2fdc
$0a:9a99  c0 3e		 cpy #$3e
$0a:9a9b  c1 1f		 cmp ($1f,x)
$0a:9a9d  c0 01		 cpy #$01
$0a:9a9f  c0 0f		 cpy #$0f
$0a:9aa1  c0 0f		 cpy #$0f
$0a:9aa3  c0 4f		 cpy #$4f
$0a:9aa5  c0 03		 cpy #$03
$0a:9aa7  c0 58		 cpy #$58
$0a:9aa9  a3 8b		 lda $8b,s
$0a:9aab  88			dey
$0a:9aac  a7 5c		 lda [$5c]
$0a:9aae  d5 d5		 cmp $d5,x
$0a:9ab0  d7 2d		 cmp [$2d],y
$0a:9ab2  29 d7		 and #$d7
$0a:9ab4  9f 05 db df   sta $dfdb05,x
$0a:9ab8  f8			sed
$0a:9ab9  07 88		 ora [$88]
$0a:9abb  77 fc		 adc [$fc],y
$0a:9abd  03 2a		 ora $2a,s
$0a:9abf  03 fa		 ora $fa,s
$0a:9ac1  03 fa		 ora $fa,s
$0a:9ac3  03 fa		 ora $fa,s
$0a:9ac5  03 20		 ora $20,s
$0a:9ac7  03 99		 ora $99,s
$0a:9ac9  66 33		 ror $33
$0a:9acb  ee 55 cc	  inc $cc55
$0a:9ace  55 cc		 eor $cc,x
$0a:9ad0  55 cc		 eor $cc,x
$0a:9ad2  55 cc		 eor $cc,x
$0a:9ad4  55 cc		 eor $cc,x
$0a:9ad6  55 cc		 eor $cc,x
$0a:9ad8  00 00		 brk #$00
$0a:9ada  00 00		 brk #$00
$0a:9adc  22 00 22 00   jsl $002200
$0a:9ae0  22 00 22 00   jsl $002200
$0a:9ae4  22 00 22 00   jsl $002200
$0a:9ae8  88			dey
$0a:9ae9  80 52		 bra $9b3d
$0a:9aeb  3f be de 28   and $28debe,x
$0a:9aef  68			pla
$0a:9af0  4b			phk
$0a:9af1  35 f4		 and $f4,x
$0a:9af3  8b			phb
$0a:9af4  aa			tax
$0a:9af5  95 75		 sta $75,x
$0a:9af7  f4 7f 00	  pea $007f
$0a:9afa  ff 00 7e 01   sbc $017e00,x
$0a:9afe  e8			inx
$0a:9aff  17 ff		 ora [$ff],y
$0a:9b01  00 7f		 brk #$7f
$0a:9b03  00 7f		 brk #$7f
$0a:9b05  00 0b		 brk #$0b
$0a:9b07  00 c8		 brk #$c8
$0a:9b09  9f aa 91 66   sta $6691aa,x
$0a:9b0d  e6 96		 inc $96
$0a:9b0f  ff c8 b7 6a   sbc $6ab7c8,x
$0a:9b13  c1 9a		 cmp ($9a,x)
$0a:9b15  fe ee 11	  inc $11ee,x
$0a:9b18  7f 00 7f 00   adc $007f00,x
$0a:9b1c  19 00 00	  ora $0000,y
$0a:9b1f  00 7f		 brk #$7f
$0a:9b21  ff 3f ff 01   sbc $01ff3f,x
$0a:9b25  ff 00 ff 57   sbc $57ff00,x
$0a:9b29  fb			xce
$0a:9b2a  b1 4f		 lda ($4f),y
$0a:9b2c  52 41		 eor ($41)
$0a:9b2e  5b			tcd
$0a:9b2f  ff a4 1b 4b   sbc $4b1ba4,x
$0a:9b33  c0 95		 cpy #$95
$0a:9b35  7f db 24 ff   adc $ff24db,x
$0a:9b39  00 ff		 brk #$ff
$0a:9b3b  00 bf		 brk #$bf
$0a:9b3d  00 00		 brk #$00
$0a:9b3f  00 7f		 brk #$7f
$0a:9b41  ff 3f ff 00   sbc $00ff3f,x
$0a:9b45  ff 00 ff 6a   sbc $6aff00,x
$0a:9b49  a5 cd		 lda $cd
$0a:9b4b  5e 92 b5	  lsr $b592,x
$0a:9b4e  a5 e9		 lda $e9
$0a:9b50  c4 9c		 cpy $9c
$0a:9b52  3a			dec a
$0a:9b53  ea			nop
$0a:9b54  d4 98		 pei ($98)
$0a:9b56  aa			tax
$0a:9b57  ac df c0	  ldy $c0df
$0a:9b5a  bf 80 77 08   lda $087780,x
$0a:9b5e  6f 10 5c 23   adc $235c10
$0a:9b62  7a			ply
$0a:9b63  05 5e		 ora $5e
$0a:9b65  21 6e		 and ($6e,x)
$0a:9b67  11 94		 ora ($94),y
$0a:9b69  66 43		 ror $43
$0a:9b6b  ca			dex
$0a:9b6c  a1 e5		 lda ($e5,x)
$0a:9b6e  55 37		 eor $37,x
$0a:9b70  ab			plb
$0a:9b71  b9 15 1f	  lda $1f15,y
$0a:9b74  eb			xba
$0a:9b75  99 53 31	  sta $3153,y
$0a:9b78  fb			xce
$0a:9b79  03 cd		 ora $cd,s
$0a:9b7b  31 e6		 and ($e6),y
$0a:9b7d  18			clc
$0a:9b7e  76 88		 ror $88,x
$0a:9b80  ba			tsx
$0a:9b81  44 1e e0	  mvp $e0,$1e
$0a:9b84  fa			plx
$0a:9b85  04 72		 tsb $72
$0a:9b87  8c 31 00	  sty $0031
$0a:9b8a  d4 8b		 pei ($8b)
$0a:9b8c  ab			plb
$0a:9b8d  84 4a		 sty $4a
$0a:9b8f  d0 35		 bne $9bc6
$0a:9b91  f4 aa 7a	  pea $7aaa
$0a:9b94  98			tya
$0a:9b95  7f cb 34 ff   adc $ff34cb,x
$0a:9b99  00 7f		 brk #$7f
$0a:9b9b  01 7f		 ora ($7f,x)
$0a:9b9d  00 3f		 brk #$3f
$0a:9b9f  00 0b		 brk #$0b
$0a:9ba1  00 05		 brk #$05
$0a:9ba3  00 00		 brk #$00
$0a:9ba5  00 00		 brk #$00
$0a:9ba7  00 9b		 brk #$9b
$0a:9ba9  01 0a		 ora ($0a,x)
$0a:9bab  fd 47 b9	  sbc $b947,x
$0a:9bae  d0 2d		 bne $9bdd
$0a:9bb0  29 24		 and #$24
$0a:9bb2  9e cb 4d	  stz $4dcb,x
$0a:9bb5  fe 3c c3	  inc $c33c,x
$0a:9bb8  fe 00 fe	  inc $fe00,x
$0a:9bbb  7c fe 10	  jmp ($10fe,x)
$0a:9bbe  fe 04 de	  inc $de04,x
$0a:9bc1  00 34		 brk #$34
$0a:9bc3  00 00		 brk #$00
$0a:9bc5  00 00		 brk #$00
$0a:9bc7  00 8c		 brk #$8c
$0a:9bc9  80 22		 bra $9bed
$0a:9bcb  9f 59 e2 14   sta $14e259,x
$0a:9bcf  d4 6c		 pei ($6c)
$0a:9bd1  ff b9 6e e4   sbc $e46eb9,x
$0a:9bd5  3d bf 6e	  and $6ebf,x
$0a:9bd8  7f 00 7f 00   adc $007f00,x
$0a:9bdc  3f 00 34 0b   and $0b3400,x
$0a:9be0  1f 01 1f 03   ora $031f01,x
$0a:9be4  1d 03 1f	  ora $1f03,x
$0a:9be7  01 6d		 ora ($6d,x)
$0a:9be9  01 d9		 ora ($d9,x)
$0a:9beb  ff 2a f6 8d   sbc $8df62a,x
$0a:9bef  8a			txa
$0a:9bf0  a2 6a		 ldx #$6a
$0a:9bf2  00 6a		 brk #$6a
$0a:9bf4  b0 3a		 bcs $9c30
$0a:9bf6  db			stp
$0a:9bf7  71 fe		 adc ($fe),y
$0a:9bf9  00 fe		 brk #$fe
$0a:9bfb  00 ff		 brk #$ff
$0a:9bfd  00 8f		 brk #$8f
$0a:9bff  70 ef		 bvs $9bf0
$0a:9c01  90 ef		 bcc $9bf2
$0a:9c03  d0 bf		 bne $9bc4
$0a:9c05  c0 fe		 cpy #$fe
$0a:9c07  80 68		 bra $9c71
$0a:9c09  05 d2		 ora $d2
$0a:9c0b  a3 a9		 lda $a9,s
$0a:9c0d  e9 16		 sbc #$16
$0a:9c0f  85 90		 sta $90
$0a:9c11  75 ba		 adc $ba,x
$0a:9c13  7b			tdc
$0a:9c14  d9 7d 95	  cmp $957d,y
$0a:9c17  5f fa ff 7c   eor $7cfffa,x
$0a:9c1b  ff 76 ff 7a   sbc $7aff76,x
$0a:9c1f  ff 0a ff 04   sbc $04ff0a,x
$0a:9c23  ff 02 7f 20   sbc $207f02,x
$0a:9c27  ff a9 49 94   sbc $9449a9,x
$0a:9c2b  71 ce		 adc ($ce),y
$0a:9c2d  39 d7 36	  and $36d7,y
$0a:9c30  f7 18		 sbc [$18],y
$0a:9c32  a3 7c		 lda $7c,s
$0a:9c34  a5 5a		 lda $5a
$0a:9c36  db			stp
$0a:9c37  2c 16 ff	  bit $ff16
$0a:9c3a  0e ff 06	  asl $06ff
$0a:9c3d  ff 08 ff 00   sbc $00ff08,x
$0a:9c41  fe 00 fe	  inc $fe00,x
$0a:9c44  00 fe		 brk #$fe
$0a:9c46  00 fe		 brk #$fe
$0a:9c48  ab			plb
$0a:9c49  6c a3 5c	  jmp ($5ca3)
$0a:9c4c  a7 78		 lda [$78]
$0a:9c4e  db			stp
$0a:9c4f  24 cf		 bit $cf
$0a:9c51  30 15		 bmi $9c68
$0a:9c53  fa			plx
$0a:9c54  a3 5c		 lda $5c,s
$0a:9c56  97 68		 sta [$68],y
$0a:9c58  10 fe		 bpl $9c58
$0a:9c5a  00 7e		 brk #$7e
$0a:9c5c  00 fe		 brk #$fe
$0a:9c5e  00 fe		 brk #$fe
$0a:9c60  00 fe		 brk #$fe
$0a:9c62  00 fe		 brk #$fe
$0a:9c64  00 7e		 brk #$7e
$0a:9c66  00 fe		 brk #$fe
$0a:9c68  a3 a3		 lda $a3,s
$0a:9c6a  50 90		 bvc $9bfc
$0a:9c6c  5b			tcd
$0a:9c6d  bf 32 85 ca   lda $ca8532,x
$0a:9c71  82 82 80	  brl $1cf6
$0a:9c74  d1 d1		 cmp ($d1),y
$0a:9c76  4b			phk
$0a:9c77  ff 63 1c 50   sbc $501c63,x
$0a:9c7b  2f 7f 00 7f   and $7f007f
$0a:9c7f  00 7d		 brk #$7d
$0a:9c81  00 7f		 brk #$7f
$0a:9c83  00 2e		 brk #$2e
$0a:9c85  00 00		 brk #$00
$0a:9c87  00 f9		 brk #$f9
$0a:9c89  07 9a		 ora [$9a]
$0a:9c8b  6a			ror a
$0a:9c8c  f2 1e		 sbc ($1e)
$0a:9c8e  eb			xba
$0a:9c8f  3e d7 7e	  rol $7ed7,x
$0a:9c92  a5 0c		 lda $0c
$0a:9c94  64 cc		 stz $cc
$0a:9c96  13 b6		 ora ($b6,s),y
$0a:9c98  00 00		 brk #$00
$0a:9c9a  05 00		 ora $00
$0a:9c9c  01 00		 ora ($00,x)
$0a:9c9e  01 00		 ora ($00,x)
$0a:9ca0  01 00		 ora ($00,x)
$0a:9ca2  53 00		 eor ($00,s),y
$0a:9ca4  13 00		 ora ($00,s),y
$0a:9ca6  49 00		 eor #$00
$0a:9ca8  90 7f		 bcc $9d29
$0a:9caa  4f de f4 b5   eor $b5f4de
$0a:9cae  4b			phk
$0a:9caf  0a			asl a
$0a:9cb0  34 55		 bit $55,x
$0a:9cb2  0a			asl a
$0a:9cb3  74 f4		 stz $f4,x
$0a:9cb5  de 62 b2	  dec $b262,x
$0a:9cb8  80 00		 bra $9cba
$0a:9cba  a0 00		 ldy #$00
$0a:9cbc  ca			dex
$0a:9cbd  00 74		 brk #$74
$0a:9cbf  80 6a		 bra $9d2b
$0a:9cc1  80 6b		 bra $9d2e
$0a:9cc3  80 eb		 bra $9cb0
$0a:9cc5  00 df		 brk #$df
$0a:9cc7  00 21		 brk #$21
$0a:9cc9  88			dey
$0a:9cca  c8			iny
$0a:9ccb  12 24		 ora ($24)
$0a:9ccd  70 1b		 bvs $9cea
$0a:9ccf  4e d4 81	  lsr $81d4
$0a:9cd2  23 30		 and $30,s
$0a:9cd4  3c 66 55	  bit $5566,x
$0a:9cd7  1f 00 ff 00   ora $00ff00,x
$0a:9cdb  ff 20 df 0a   sbc $0adf20,x
$0a:9cdf  f5 80		 sbc $80,x
$0a:9ce1  7f 20 df 24   adc $24df20,x
$0a:9ce5  db			stp
$0a:9ce6  15 ea		 ora $ea,x
$0a:9ce8  0b			phd
$0a:9ce9  21 fc		 and ($fc,x)
$0a:9ceb  48			pha
$0a:9cec  41 13		 eor ($13,x)
$0a:9cee  37 6c		 and [$6c],y
$0a:9cf0  e4 8d		 cpx $8d
$0a:9cf2  18			clc
$0a:9cf3  31 c1		 and ($c1),y
$0a:9cf5  64 37		 stz $37
$0a:9cf7  9a			txs
$0a:9cf8  01 fe		 ora ($fe,x)
$0a:9cfa  48			pha
$0a:9cfb  b7 01		 lda [$01],y
$0a:9cfd  fe 24 db	  inc $db24,x
$0a:9d00  84 7b		 sty $7b
$0a:9d02  10 ef		 bpl $9cf3
$0a:9d04  40			rti
$0a:9d05  bf 12 ed b4   lda $b4ed12,x
$0a:9d09  fb			xce
$0a:9d0a  2d da cb	  and $cbda
$0a:9d0d  25 71		 and $71
$0a:9d0f  87 9a		 sta [$9a]
$0a:9d11  01 b9		 ora ($b9,x)
$0a:9d13  b8			clv
$0a:9d14  24 ff		 bit $ff
$0a:9d16  36 7e		 rol $7e,x
$0a:9d18  ff f9 ff fe   sbc $fefff9,x
$0a:9d1c  ff ff ff ff   sbc $ffffff,x
$0a:9d20  ff ff 47 ff   sbc $ff47ff,x
$0a:9d24  00 ff		 brk #$ff
$0a:9d26  fe 01 56	  inc $5601,x
$0a:9d29  3f ad 92 ea   and $ea92ad,x
$0a:9d2d  85 37		 sta $37
$0a:9d2f  80 a5		 bra $9cd6
$0a:9d31  a4 59		 ldy $59
$0a:9d33  d9 44 ff	  cmp $ff44,y
$0a:9d36  59 59 ff	  eor $ff59,y
$0a:9d39  ff 7f ff 7f   sbc $7fff7f,x
$0a:9d3d  ff 7f ff 5b   sbc $5bff7f,x
$0a:9d41  ff 26 ff 00   sbc $00ff26,x
$0a:9d45  ff 59 a6 65   sbc $65a659,x
$0a:9d49  a7 32		 lda [$32]
$0a:9d4b  93 5a		 sta ($5a,s),y
$0a:9d4d  ce 2a e5	  dec $e52a
$0a:9d50  b9 70 d2	  lda $d270,y
$0a:9d53  32 c3		 and ($c3)
$0a:9d55  3f b9 58 67   and $6758b9,x
$0a:9d59  18			clc
$0a:9d5a  73 0c		 adc ($0c,s),y
$0a:9d5c  3e 01 1f	  rol $1f01,x
$0a:9d5f  00 0f		 brk #$0f
$0a:9d61  00 0d		 brk #$0d
$0a:9d63  00 00		 brk #$00
$0a:9d65  00 07		 brk #$07
$0a:9d67  00 ad		 brk #$ad
$0a:9d69  ed 4f c9	  sbc $c94f
$0a:9d6c  19 15 52	  ora $5215,y
$0a:9d6f  ab			plb
$0a:9d70  24 07		 bit $07
$0a:9d72  6a			ror a
$0a:9d73  0b			phd
$0a:9d74  57 f6		 eor [$f6],y
$0a:9d76  59 b3 ee	  eor $eeb3,y
$0a:9d79  10 ce		 bpl $9d49
$0a:9d7b  30 1e		 bmi $9d9b
$0a:9d7d  e0 fc		 cpx #$fc
$0a:9d7f  00 f8		 brk #$f8
$0a:9d81  00 f4		 brk #$f4
$0a:9d83  00 08		 brk #$08
$0a:9d85  00 fc		 brk #$fc
$0a:9d87  00 1a		 brk #$1a
$0a:9d89  03 c2		 ora $c2,s
$0a:9d8b  bd a5 88	  lda $88a5,x
$0a:9d8e  72 c5		 adc ($c5)
$0a:9d90  29 e5		 and #$e5
$0a:9d92  9f 4a 8d 7e   sta $7e8d4a,x
$0a:9d96  fc 03 fc	  jsr ($fc03,x)
$0a:9d99  00 7e		 brk #$7e
$0a:9d9b  08			php
$0a:9d9c  7e 00 3e	  ror $3e00,x
$0a:9d9f  00 1e		 brk #$1e
$0a:9da1  00 34		 brk #$34
$0a:9da3  00 00		 brk #$00
$0a:9da5  00 00		 brk #$00
$0a:9da7  00 1a		 brk #$1a
$0a:9da9  fd cb 40	  sbc $40cb,x
$0a:9dac  a5 76		 lda $76
$0a:9dae  f3 3a		 sbc ($3a,s),y
$0a:9db0  e9 1a		 sbc #$1a
$0a:9db2  df 34 ff 00   cmp $00ff34,x
$0a:9db6  ff 00 00 00   sbc $000000,x
$0a:9dba  3c 00 08	  bit $0800,x
$0a:9dbd  00 04		 brk #$04
$0a:9dbf  00 04		 brk #$04
$0a:9dc1  00 00		 brk #$00
$0a:9dc3  00 00		 brk #$00
$0a:9dc5  00 00		 brk #$00
$0a:9dc7  00 24		 brk #$24
$0a:9dc9  ee b7 7e	  inc $7eb7
$0a:9dcc  a2 77		 ldx #$77
$0a:9dce  91 5b		 sta ($5b),y
$0a:9dd0  ad 6c d1	  lda $d16c
$0a:9dd3  17 c8		 ora [$c8],y
$0a:9dd5  3f dd 22 1f   and $1f22dd,x
$0a:9dd9  03 0f		 ora $0f,s
$0a:9ddb  03 0f		 ora $0f,s
$0a:9ddd  01 27		 ora ($27,x)
$0a:9ddf  00 13		 brk #$13
$0a:9de1  00 28		 brk #$28
$0a:9de3  00 00		 brk #$00
$0a:9de5  00 00		 brk #$00
$0a:9de7  00 ac		 brk #$ac
$0a:9de9  f4 c7 55	  pea $55c7
$0a:9dec  59 e9 a3	  eor $a3e9,y
$0a:9def  c1 a8		 cmp ($a8,x)
$0a:9df1  22 75 f5 a2   jsl $a2f575
$0a:9df5  ff 9a 65 7b   sbc $7b659a,x
$0a:9df9  c0 da		 cpy #$da
$0a:9dfb  e0 f6		 cpx #$f6
$0a:9dfd  80 fe		 bra $9dfd
$0a:9dff  00 df		 brk #$df
$0a:9e01  00 0a		 brk #$0a
$0a:9e03  00 00		 brk #$00
$0a:9e05  00 00		 brk #$00
$0a:9e07  00 ba		 brk #$ba
$0a:9e09  7b			tdc
$0a:9e0a  ab			plb
$0a:9e0b  6e 9a 7b	  ror $7b9a
$0a:9e0e  e4 3f		 cpx $3f
$0a:9e10  8c 7f d7	  sty $d77f
$0a:9e13  36 ba		 rol $ba,x
$0a:9e15  7f c7 38 04   adc $0438c7,x
$0a:9e19  ff 10 ff 04   sbc $04ff10,x
$0a:9e1d  ff 00 ff 00   sbc $00ff00,x
$0a:9e21  7f 08 7f 00   adc $007f08,x
$0a:9e25  ff 00 7f 93   sbc $937f00,x
$0a:9e29  7c a3 5c	  jmp ($5ca3,x)
$0a:9e2c  a7 78		 lda [$78]
$0a:9e2e  db			stp
$0a:9e2f  2c cf 30	  bit $30cf
$0a:9e32  17 f8		 ora [$f8],y
$0a:9e34  a3 5c		 lda $5c,s
$0a:9e36  ff 00 00 fe   sbc $fe0000,x
$0a:9e3a  00 7e		 brk #$7e
$0a:9e3c  00 fe		 brk #$fe
$0a:9e3e  00 fe		 brk #$fe
$0a:9e40  00 fe		 brk #$fe
$0a:9e42  00 fe		 brk #$fe
$0a:9e44  00 fe		 brk #$fe
$0a:9e46  00 18		 brk #$18
$0a:9e48  51 f1		 eor ($f1),y
$0a:9e4a  4e e0 0b	  lsr $0be0
$0a:9e4d  e0 5b		 cpx #$5b
$0a:9e4f  f4 50 f0	  pea $f050
$0a:9e52  4d e2 4f	  eor $4fe2
$0a:9e55  e0 1b		 cpx #$1b
$0a:9e57  f0 0e		 beq $9e67
$0a:9e59  00 1f		 brk #$1f
$0a:9e5b  00 1f		 brk #$1f
$0a:9e5d  00 0f		 brk #$0f
$0a:9e5f  00 0f		 brk #$0f
$0a:9e61  00 1f		 brk #$1f
$0a:9e63  00 1f		 brk #$1f
$0a:9e65  00 0f		 brk #$0f
$0a:9e67  00 1f		 brk #$1f
$0a:9e69  0b			phd
$0a:9e6a  e2 16		 sep #$16
$0a:9e6c  d2 36		 cmp ($36)
$0a:9e6e  9e 3a 96	  stz $963a,x
$0a:9e71  82 d2 36	  brl $d546
$0a:9e74  47 33		 eor [$33]
$0a:9e76  58			cli
$0a:9e77  ab			plb
$0a:9e78  f4 00 fd	  pea $fd00
$0a:9e7b  00 fd		 brk #$fd
$0a:9e7d  00 f5		 brk #$f5
$0a:9e7f  00 7d		 brk #$7d
$0a:9e81  00 fd		 brk #$fd
$0a:9e83  00 fc		 brk #$fc
$0a:9e85  00 f4		 brk #$f4
$0a:9e87  00 4d		 brk #$4d
$0a:9e89  99 29 8b	  sta $8b29,y
$0a:9e8c  d5 c4		 cmp $c4,x
$0a:9e8e  41 cb		 eor ($cb,x)
$0a:9e90  95 53		 sta $53,x
$0a:9e92  e6 21		 inc $21
$0a:9e94  a5 52		 lda $52
$0a:9e96  72 d8		 adc ($d8)
$0a:9e98  66 00		 ror $00
$0a:9e9a  77 00		 adc [$00],y
$0a:9e9c  3b			tsc
$0a:9e9d  00 3c		 brk #$3c
$0a:9e9f  00 2f		 brk #$2f
$0a:9ea1  00 1f		 brk #$1f
$0a:9ea3  00 0f		 brk #$0f
$0a:9ea5  00 07		 brk #$07
$0a:9ea7  00 38		 brk #$38
$0a:9ea9  2a			rol a
$0a:9eaa  b2 94		 lda ($94)
$0a:9eac  1f c9 44 29   ora $2944c9,x
$0a:9eb0  85 93		 sta $93
$0a:9eb2  3e e6 d8	  rol $d8e6,x
$0a:9eb5  2a			rol a
$0a:9eb6  a6 42		 ldx $42
$0a:9eb8  f7 00		 sbc [$00],y
$0a:9eba  af 40 fe 00   lda $00fe40
$0a:9ebe  ee 10 9c	  inc $9c10
$0a:9ec1  60			rts
$0a:9ec2  f9 00 f5	  sbc $f500,y
$0a:9ec5  00 fd		 brk #$fd
$0a:9ec7  00 da		 brk #$da
$0a:9ec9  52 27		 eor ($27)
$0a:9ecb  35 b9		 and $b9,x
$0a:9ecd  ed ee aa	  sbc $aaee
$0a:9ed0  ab			plb
$0a:9ed1  aa			tax
$0a:9ed2  fc ec e5	  jsr ($e5ec,x)
$0a:9ed5  a7 bf		 lda [$bf]
$0a:9ed7  b5 52		 lda $52,x
$0a:9ed9  ad 25 da	  lda $da25
$0a:9edc  a9 56		 lda #$56
$0a:9ede  aa			tax
$0a:9edf  55 aa		 eor $aa,x
$0a:9ee1  55 ec		 eor $ec,x
$0a:9ee3  13 a5		 ora ($a5,s),y
$0a:9ee5  5a			phy
$0a:9ee6  b5 4a		 lda $4a,x
$0a:9ee8  b5 95		 lda $95,x
$0a:9eea  4b			phk
$0a:9eeb  4b			phk
$0a:9eec  bf ad e4 ac   lda $ace4ad,x
$0a:9ef0  9f 96 d7 f6   sta $f6d796,x
$0a:9ef4  7e 5a d2	  ror $d25a,x
$0a:9ef7  5a			phy
$0a:9ef8  95 6a		 sta $6a,x
$0a:9efa  4b			phk
$0a:9efb  b4 ad		 ldy $ad,x
$0a:9efd  52 a4		 eor ($a4)
$0a:9eff  5b			tcd
$0a:9f00  96 69		 stx $69,y
$0a:9f02  d6 29		 dec $29,x
$0a:9f04  5a			phy
$0a:9f05  a5 52		 lda $52
$0a:9f07  ad 29 00	  lda $0029
$0a:9f0a  2c 6f d3	  bit $d36f
$0a:9f0d  b3 14		 lda ($14,s),y
$0a:9f0f  ac d5 4b	  ldy $4bd5
$0a:9f12  54 b3 4a	  mvn $4a,$b3
$0a:9f15  f9 52 de	  sbc $de52,y
$0a:9f18  ff 00 ef 10   sbc $10ef00,x
$0a:9f1c  73 0c		 adc ($0c,s),y
$0a:9f1e  7c 03 3f	  jmp ($3f03,x)
$0a:9f21  00 0f		 brk #$0f
$0a:9f23  00 07		 brk #$07
$0a:9f25  00 21		 brk #$21
$0a:9f27  00 4b		 brk #$4b
$0a:9f29  00 9a		 brk #$9a
$0a:9f2b  7b			tdc
$0a:9f2c  e5 66		 sbc $66
$0a:9f2e  14 1a		 trb $1a
$0a:9f30  d2 6c		 cmp ($6c)
$0a:9f32  0b			phd
$0a:9f33  73 2a		 adc ($2a,s),y
$0a:9f35  4e 95 9d	  lsr $9d95
$0a:9f38  ff 00 fb 04   sbc $04fb00,x
$0a:9f3c  e7 18		 sbc [$18]
$0a:9f3e  9f 60 ff 00   sta $00ff60,x
$0a:9f42  fc 00 f1	  jsr ($f100,x)
$0a:9f45  00 62		 brk #$62
$0a:9f47  00 eb		 brk #$eb
$0a:9f49  5a			phy
$0a:9f4a  b4 5c		 ldy $5c,x
$0a:9f4c  99 7b f6	  sta $f67b,y
$0a:9f4f  15 b8		 ora $b8,x
$0a:9f51  59 a9 78	  eor $78a9,y
$0a:9f54  84 6c		 sty $6c
$0a:9f56  db			stp
$0a:9f57  33 05		 and ($05,s),y
$0a:9f59  00 03		 brk #$03
$0a:9f5b  00 04		 brk #$04
$0a:9f5d  00 0b		 brk #$0b
$0a:9f5f  00 07		 brk #$07
$0a:9f61  00 07		 brk #$07
$0a:9f63  00 13		 brk #$13
$0a:9f65  00 04		 brk #$04
$0a:9f67  00 44		 brk #$44
$0a:9f69  d5 68		 cmp $68,x
$0a:9f6b  c5 52		 cmp $52
$0a:9f6d  3f d3 d6 0c   and $0cd6d3,x
$0a:9f71  53 f6		 eor ($f6,s),y
$0a:9f73  a7 6b		 lda [$6b]
$0a:9f75  8a			txa
$0a:9f76  5a			phy
$0a:9f77  5b			tcd
$0a:9f78  da			phx
$0a:9f79  20 fa 00	  jsr $00fa
$0a:9f7c  f8			sed
$0a:9f7d  00 58		 brk #$58
$0a:9f7f  20 d8 20	  jsr $20d8
$0a:9f82  78			sei
$0a:9f83  00 74		 brk #$74
$0a:9f85  00 b4		 brk #$b4
$0a:9f87  00 04		 brk #$04
$0a:9f89  ff bb bf 60   sbc $60bfbb,x
$0a:9f8d  c0 5a		 cpy #$5a
$0a:9f8f  cd 64 e8	  cmp $e864
$0a:9f92  cd c9 4a	  cmp $4ac9
$0a:9f95  cb			wai
$0a:9f96  27 a7		 and [$a7]
$0a:9f98  00 00		 brk #$00
$0a:9f9a  40			rti
$0a:9f9b  00 3f		 brk #$3f
$0a:9f9d  00 3f		 brk #$3f
$0a:9f9f  00 1f		 brk #$1f
$0a:9fa1  00 3e		 brk #$3e
$0a:9fa3  00 3c		 brk #$3c
$0a:9fa5  00 57		 brk #$57
$0a:9fa7  08			php
$0a:9fa8  7d c7 d7	  adc $d7c7,x
$0a:9fab  3e 6c bb	  rol $bb6c,x
$0a:9fae  d5 2b		 cmp $2b,x
$0a:9fb0  e7 58		 sbc [$58]
$0a:9fb2  4d f6 7d	  eor $7df6
$0a:9fb5  8f 39 eb 38   sta $38eb39
$0a:9fb9  00 61		 brk #$61
$0a:9fbb  00 57		 brk #$57
$0a:9fbd  01 5c		 ora ($5c,x)
$0a:9fbf  00 31		 brk #$31
$0a:9fc1  00 21		 brk #$21
$0a:9fc3  04 60		 tsb $60
$0a:9fc5  0c 44 0c	  tsb $0c44
$0a:9fc8  f7 ca		 sbc [$ca],y
$0a:9fca  eb			xba
$0a:9fcb  7c 37 dc	  jmp ($dc37,x)
$0a:9fce  eb			xba
$0a:9fcf  54 77 9a	  mvn $9a,$77
$0a:9fd2  5b			tcd
$0a:9fd3  ee 4f d0	  inc $d04f
$0a:9fd6  ad 3e 3c	  lda $3c3e
$0a:9fd9  00 86		 brk #$86
$0a:9fdb  00 ea		 brk #$ea
$0a:9fdd  80 ba		 bra $9f99
$0a:9fdf  10 8c		 bpl $9f6d
$0a:9fe1  00 84		 brk #$84
$0a:9fe3  c0 a6		 cpy #$a6
$0a:9fe5  60			rts
$0a:9fe6  c2 60		 rep #$60
$0a:9fe8  7f 96 28 d7   adc $d72896,x
$0a:9fec  63 dc		 adc $dc,s
$0a:9fee  2b			pld
$0a:9fef  e9 5f 95	  sbc #$955f
$0a:9ff2  77 a5		 adc [$a5],y
$0a:9ff4  79 9f 3b	  adc $3b9f,y
$0a:9ff7  e4 69		 cpx $69
$0a:9ff9  00 7f		 brk #$7f
$0a:9ffb  01 00		 ora ($00,x)
$0a:9ffd  00 54		 brk #$54
$0a:9fff  3c 68 3c	  bit $3c68,x
$0a:a002  58			cli
$0a:a003  3c 40 00	  bit $0040,x
$0a:a006  5f 00 d7 a8   eor $a8d700,x
$0a:a00a  01 fc		 ora ($fc,x)
$0a:a00c  cf b3 ee 65   cmp $65eeb3
$0a:a010  bd 9e ab	  lda $ab9e,x
$0a:a013  2d 4c b6	  and $b64c
$0a:a016  79 8f 7e	  adc $7e8f,y
$0a:a019  00 fe		 brk #$fe
$0a:a01b  78			sei
$0a:a01c  00 00		 brk #$00
$0a:a01e  92 70		 sta ($70)
$0a:a020  62 78 d2	  per $729b
$0a:a023  78			sei
$0a:a024  83 00		 sta $00,s
$0a:a026  f2 00		 sbc ($00)
$0a:a028  45 c3		 eor $c3
$0a:a02a  5f d5 59 ef   eor $ef59d5,x
$0a:a02e  87 dd		 sta [$dd]
$0a:a030  ec 9f 91	  cpx $919f
$0a:a033  db			stp
$0a:a034  e7 95		 sbc [$95]
$0a:a036  97 d5		 sta [$d5],y
$0a:a038  3f 00 2f 00   and $002f00,x
$0a:a03c  1f 00 3f 00   ora $003f00,x
$0a:a040  7f 00 7b 04   adc $047b00,x
$0a:a044  77 08		 adc [$08],y
$0a:a046  77 08		 adc [$08],y
$0a:a048  0e 43 ca	  asl $ca43
$0a:a04b  eb			xba
$0a:a04c  22 77 50 5b   jsl $5b5077
$0a:a050  70 71		 bvs $a0c3
$0a:a052  4c 4a 12	  jmp $124a
$0a:a055  56 66		 lsr $66,x
$0a:a057  62 7c 80	  per $20d6
$0a:a05a  f4 00 78	  pea $7800
$0a:a05d  80 5c		 bra $a0bb
$0a:a05f  a0 76		 ldy #$76
$0a:a061  88			dey
$0a:a062  4f b0 57 a8   eor $a857b0
$0a:a066  67 98		 adc [$98]
$0a:a068  d5 d5		 cmp $d5,x
$0a:a06a  aa			tax
$0a:a06b  85 dd		 sta $dd
$0a:a06d  80 c9		 bra $a038
$0a:a06f  c0 16		 cpy #$16
$0a:a071  7f 60 60 3b   adc $3b6060,x
$0a:a075  7f e2 9d 2a   adc $2a9de2,x
$0a:a079  00 7f		 brk #$7f
$0a:a07b  00 7f		 brk #$7f
$0a:a07d  00 3f		 brk #$3f
$0a:a07f  00 ff		 brk #$ff
$0a:a081  00 e0		 brk #$e0
$0a:a083  1f ff 00 7f   ora $7f00ff,x
$0a:a087  00 d6		 brk #$d6
$0a:a089  76 85		 ror $85,x
$0a:a08b  70 97		 bvs $a024
$0a:a08d  70 d9		 bvs $a068
$0a:a08f  7b			tdc
$0a:a090  75 d4		 adc $d4,x
$0a:a092  d6 76		 dec $76,x
$0a:a094  93 70		 sta ($70,s),y
$0a:a096  3f d8 09 00   and $0009d8,x
$0a:a09a  0f 00 0f 00   ora $000f00
$0a:a09e  07 00		 ora [$00]
$0a:a0a0  0b			phd
$0a:a0a1  00 09		 brk #$09
$0a:a0a3  00 0f		 brk #$0f
$0a:a0a5  00 07		 brk #$07
$0a:a0a7  00 d2		 brk #$d2
$0a:a0a9  ca			dex
$0a:a0aa  a7 7b		 lda [$7b]
$0a:a0ac  30 6a		 bmi $a118
$0a:a0ae  0e 32 66	  asl $6632
$0a:a0b1  da			phx
$0a:a0b2  87 bb		 sta [$bb]
$0a:a0b4  69 33 64	  adc #$6433
$0a:a0b7  b7 3d		 lda [$3d],y
$0a:a0b9  00 fc		 brk #$fc
$0a:a0bb  00 fd		 brk #$fd
$0a:a0bd  00 3d		 brk #$3d
$0a:a0bf  c0 fd		 cpy #$fd
$0a:a0c1  00 7c		 brk #$7c
$0a:a0c3  00 fc		 brk #$fc
$0a:a0c5  00 f8		 brk #$f8
$0a:a0c7  00 65		 brk #$65
$0a:a0c9  c1 48		 cmp ($48,x)
$0a:a0cb  dd 65 f9	  cmp $f965,x
$0a:a0ce  49 d9 dc	  eor #$dcd9
$0a:a0d1  c8			iny
$0a:a0d2  4d 9b f6	  eor $f69b
$0a:a0d5  4d 11 d5	  eor $d511
$0a:a0d8  3e 00 3e	  rol $3e00,x
$0a:a0db  00 1e		 brk #$1e
$0a:a0dd  00 3e		 brk #$3e
$0a:a0df  00 3f		 brk #$3f
$0a:a0e1  00 7e		 brk #$7e
$0a:a0e3  00 3e		 brk #$3e
$0a:a0e5  00 36		 brk #$36
$0a:a0e7  08			php
$0a:a0e8  89 80 55	  bit #$5580
$0a:a0eb  3e bf df	  rol $dfbf,x
$0a:a0ee  34 74		 bit $74,x
$0a:a0f0  48			pha
$0a:a0f1  3f d2 ad a9   and $a9add2,x
$0a:a0f5  96 74		 stx $74,y
$0a:a0f7  f4 7f 00	  pea $007f
$0a:a0fa  ff 00 7f 00   sbc $007f00,x
$0a:a0fe  f4 0b ff	  pea $ff0b
$0a:a101  00 7f		 brk #$7f
$0a:a103  00 7f		 brk #$7f
$0a:a105  00 0b		 brk #$0b
$0a:a107  00 48		 brk #$48
$0a:a109  00 12		 brk #$12
$0a:a10b  ff de fe 90   sbc $90fede,x
$0a:a10f  90 93		 bcc $a0a4
$0a:a111  ff 09 f7 33   sbc $33f709,x
$0a:a115  cd 99 98	  cmp $9899
$0a:a118  ff 00 ff 00   sbc $00ff00,x
$0a:a11c  fe 01 90	  inc $9001,x
$0a:a11f  6f ff 00 ff   adc $ff00ff
$0a:a123  00 ff		 brk #$ff
$0a:a125  00 67		 brk #$67
$0a:a127  00 5b		 brk #$5b
$0a:a129  d9 ab d6	  cmp $d6ab,y
$0a:a12c  c6 be		 dec $be
$0a:a12e  2a			rol a
$0a:a12f  98			tya
$0a:a130  d9 c5 49	  cmp $49c5,y
$0a:a133  c5 5e		 cmp $5e
$0a:a135  c3 b8		 cmp $b8,s
$0a:a137  7b			tdc
$0a:a138  26 00		 rol $00
$0a:a13a  7f 00 7f 00   adc $007f00,x
$0a:a13e  7b			tdc
$0a:a13f  04 3e		 tsb $3e
$0a:a141  00 3e		 brk #$3e
$0a:a143  00 3c		 brk #$3c
$0a:a145  00 04		 brk #$04
$0a:a147  00 55		 brk #$55
$0a:a149  bc 48 f4	  ldy $f448,x
$0a:a14c  2e b6 19	  rol $19b6
$0a:a14f  9f 3b 80 40   sta $40803b,x
$0a:a153  c0 69		 cpy #$69
$0a:a155  e9 00 ff	  sbc #$ff00
$0a:a158  03 00		 ora $00,s
$0a:a15a  03 00		 ora $00,s
$0a:a15c  41 00		 eor ($00,x)
$0a:a15e  60			rts
$0a:a15f  00 7f		 brk #$7f
$0a:a161  00 3f		 brk #$3f
$0a:a163  00 16		 brk #$16
$0a:a165  00 00		 brk #$00
$0a:a167  00 41		 brk #$41
$0a:a169  db			stp
$0a:a16a  b1 6f		 lda ($6f),y
$0a:a16c  3a			dec a
$0a:a16d  56 89		 lsr $89,x
$0a:a16f  f8			sed
$0a:a170  d2 2d		 cmp ($2d)
$0a:a172  01 00		 ora ($00,x)
$0a:a174  33 32		 and ($32,s),y
$0a:a176  01 ff		 ora ($ff,x)
$0a:a178  d4 20		 pei ($20)
$0a:a17a  f0 00		 beq $a17c
$0a:a17c  e1 00		 sbc ($00,x)
$0a:a17e  07 00		 ora [$00]
$0a:a180  ff 00 ff 00   sbc $00ff00,x
$0a:a184  cd 00 00	  cmp $0000
$0a:a187  00 f2		 brk #$f2
$0a:a189  ed 43 de	  sbc $de43
$0a:a18c  69 d7 08	  adc #$08d7
$0a:a18f  bf 99 80 77   lda $778099,x
$0a:a193  f7 ac		 sbc [$ac],y
$0a:a195  7d da 25	  adc $25da,x
$0a:a198  1f 00 3f 00   ora $003f00,x
$0a:a19c  3f 00 7f 00   and $007f00,x
$0a:a1a0  7f 00 08 00   adc $000800,x
$0a:a1a4  02 00		 cop #$00
$0a:a1a6  00 00		 brk #$00
$0a:a1a8  00 ff		 brk #$ff
$0a:a1aa  01 c8		 ora ($c8,x)
$0a:a1ac  2d 82 0a	  and $0a82
$0a:a1af  91 12		 sta ($12),y
$0a:a1b1  ac 2d c3	  ldy $c32d
$0a:a1b4  2e 9d 12	  rol $129d
$0a:a1b7  80 00		 bra $a1b9
$0a:a1b9  ff 37 ff 7f   sbc $7fff37,x
$0a:a1bd  ff 7f ff 7f   sbc $7fff7f,x
$0a:a1c1  ff 3f ff 7f   sbc $7fff3f,x
$0a:a1c5  fd 7f ff	  sbc $ff7f,x
$0a:a1c8  00 ff		 brk #$ff
$0a:a1ca  50 00		 bvc $a1cc
$0a:a1cc  25 c8		 and $c8
$0a:a1ce  e8			inx
$0a:a1cf  37 b7		 and [$b7],y
$0a:a1d1  49 10 ef	  eor #$ef10
$0a:a1d4  f6 9f		 inc $9f,x
$0a:a1d6  eb			xba
$0a:a1d7  04 00		 tsb $00
$0a:a1d9  ff ff ff ff   sbc $ffffff,x
$0a:a1dd  ff ff ff ff   sbc $ffffff,x
$0a:a1e1  ff ff ff ff   sbc $ffffff,x
$0a:a1e5  9f ff ff 63   sta $63ffff,x
$0a:a1e9  9d 5b b9	  sta $b95b,x
$0a:a1ec  5f f5 47 a5   eor $a547f5,x
$0a:a1f0  7d df 6a	  adc $6adf,x
$0a:a1f3  95 86		 sta $86,x
$0a:a1f5  7f 7f 80 40   adc $40807f,x
$0a:a1f9  00 44		 brk #$44
$0a:a1fb  1c 08 1c	  trb $1c08
$0a:a1fe  58			cli
$0a:a1ff  1c 00 00	  trb $0000
$0a:a202  7f 00 00 00   adc $000000,x
$0a:a206  00 00		 brk #$00
$0a:a208  ce b4 a8	  dec $a8b4
$0a:a20b  6f cf 4c 92   adc $924ccf
$0a:a20f  dd f7 6a	  cmp $6af7,x
$0a:a212  66 99		 ror $99
$0a:a214  25 fe		 and $fe
$0a:a216  fe 01 03	  inc $0301,x
$0a:a219  00 92		 brk #$92
$0a:a21b  38			sec
$0a:a21c  b2 78		 lda ($78)
$0a:a21e  22 30 80 00   jsl $008030
$0a:a222  fe 00 00	  inc $0000,x
$0a:a225  00 00		 brk #$00
$0a:a227  00 b5		 brk #$b5
$0a:a229  df 89 da b2   cmp $b2da89,x
$0a:a22d  d5 95		 cmp $95,x
$0a:a22f  d8			cld
$0a:a230  aa			tax
$0a:a231  d0 c2		 bne $a1f5
$0a:a233  bf 82 82 67   lda $678282,x
$0a:a237  ff 7f 00 7b   sbc $7b007f,x
$0a:a23b  04 77		 tsb $77
$0a:a23d  08			php
$0a:a23e  7f 00 7f 00   adc $007f00,x
$0a:a242  7f 00 7d 00   adc $007d00,x
$0a:a246  00 00		 brk #$00
$0a:a248  52 56		 eor ($56)
$0a:a24a  84 40		 sty $40
$0a:a24c  6b			rtl
$0a:a24d  2e f0 14	  rol $14f0
$0a:a250  95 48		 sta $48,x
$0a:a252  72 f2		 adc ($f2)
$0a:a254  69 68 3b	  adc #$3b68
$0a:a257  ff 57 a8 c5   sbc $c5a857,x
$0a:a25b  3a			dec a
$0a:a25c  ef 10 f5 0a   sbc $0af510
$0a:a260  fd 02 f3	  sbc $f302,x
$0a:a263  0c 97 00	  tsb $0097
$0a:a266  00 00		 brk #$00
$0a:a268  ca			dex
$0a:a269  c8			iny
$0a:a26a  44 bb ce	  mvp $ce,$bb
$0a:a26d  11 b3		 ora ($b3),y
$0a:a26f  00 de		 brk #$de
$0a:a271  ff 01 01 96   sbc $960101,x
$0a:a275  ff 25 db 37   sbc $37db25,x
$0a:a279  00 ff		 brk #$ff
$0a:a27b  00 ff		 brk #$ff
$0a:a27d  00 ff		 brk #$ff
$0a:a27f  00 ff		 brk #$ff
$0a:a281  00 01		 brk #$01
$0a:a283  fe ff 00	  inc $00ff,x
$0a:a286  ff 00 55 f0   sbc $f05500,x
$0a:a28a  2a			rol a
$0a:a28b  ba			tsx
$0a:a28c  35 9b		 and $9b,x
$0a:a28e  55 c0		 eor $c0,x
$0a:a290  62 e2 49	  per $ec75
$0a:a293  c2 2a		 rep #$2a
$0a:a295  aa			tax
$0a:a296  99 67 0f	  sta $0f67,y
$0a:a299  00 45		 brk #$45
$0a:a29b  00 60		 brk #$60
$0a:a29d  00 3f		 brk #$3f
$0a:a29f  00 1d		 brk #$1d
$0a:a2a1  00 3d		 brk #$3d
$0a:a2a3  00 55		 brk #$55
$0a:a2a5  00 00		 brk #$00
$0a:a2a7  00 aa		 brk #$aa
$0a:a2a9  0e 55 5c	  asl $5c55
$0a:a2ac  38			sec
$0a:a2ad  fa			plx
$0a:a2ae  6b			rtl
$0a:a2af  dc 1a 44	  jml [$441a]
$0a:a2b2  64 22		 stz $22
$0a:a2b4  52 30		 eor ($30)
$0a:a2b6  89 b7 f1	  bit #$f1b7
$0a:a2b9  00 a3		 brk #$a3
$0a:a2bb  00 07		 brk #$07
$0a:a2bd  00 ff		 brk #$ff
$0a:a2bf  00 ff		 brk #$ff
$0a:a2c1  00 df		 brk #$df
$0a:a2c3  00 cf		 brk #$cf
$0a:a2c5  00 40		 brk #$40
$0a:a2c7  00 2d		 brk #$2d
$0a:a2c9  e1 39		 sbc ($39,x)
$0a:a2cb  ed b0 6d	  sbc $6db0
$0a:a2ce  3d e9 7a	  and $7ae9,x
$0a:a2d1  e8			inx
$0a:a2d2  84 4b		 sty $4b
$0a:a2d4  aa			tax
$0a:a2d5  7f ab 63 1e   adc $1e63ab,x
$0a:a2d9  00 1e		 brk #$1e
$0a:a2db  00 1e		 brk #$1e
$0a:a2dd  00 1e		 brk #$1e
$0a:a2df  00 1f		 brk #$1f
$0a:a2e1  00 3e		 brk #$3e
$0a:a2e3  00 1c		 brk #$1c
$0a:a2e5  00 1c		 brk #$1c
$0a:a2e7  00 b4		 brk #$b4
$0a:a2e9  4b			phk
$0a:a2ea  54 b4 a2	  mvn $a2,$b4
$0a:a2ed  60			rts
$0a:a2ee  8d 68 b6	  sta $b668
$0a:a2f1  61 bf		 adc ($bf,x)
$0a:a2f3  70 a7		 bvs $a29c
$0a:a2f5  60			rts
$0a:a2f6  8b			phb
$0a:a2f7  60			rts
$0a:a2f8  00 00		 brk #$00
$0a:a2fa  0b			phd
$0a:a2fb  00 1f		 brk #$1f
$0a:a2fd  00 17		 brk #$17
$0a:a2ff  00 1f		 brk #$1f
$0a:a301  00 0f		 brk #$0f
$0a:a303  00 1f		 brk #$1f
$0a:a305  00 1f		 brk #$1f
$0a:a307  00 27		 brk #$27
$0a:a309  d8			cld
$0a:a30a  b1 be		 lda ($be),y
$0a:a30c  99 1e 6c	  sta $6c1e,y
$0a:a30f  0f b6 07 d2   ora $d207b6
$0a:a313  23 da		 and $da,s
$0a:a315  43 b5		 eor $b5,s
$0a:a317  01 00		 ora ($00,x)
$0a:a319  00 40		 brk #$40
$0a:a31b  00 e0		 brk #$e0
$0a:a31d  00 f0		 brk #$f0
$0a:a31f  00 f8		 brk #$f8
$0a:a321  00 fc		 brk #$fc
$0a:a323  00 bc		 brk #$bc
$0a:a325  00 fe		 brk #$fe
$0a:a327  00 24		 brk #$24
$0a:a329  1c 49 38	  trb $3849
$0a:a32c  26 f1		 rol $f1
$0a:a32e  e7 ff		 sbc [$ff]
$0a:a330  42 c1		 wdm #$c1
$0a:a332  94 83		 sty $83,x
$0a:a334  62 1f 7e	  per $2156
$0a:a337  7f e3 ff e7   adc $e7ffe3,x
$0a:a33b  ff ef ff 00   sbc $00ffef,x
$0a:a33f  ff 3e ff 7e   sbc $7eff3e,x
$0a:a343  ff fe ff 80   sbc $80fffe,x
$0a:a347  ff 52 f7 0e   sbc $0ef752,x
$0a:a34b  e6 cd		 inc $cd
$0a:a34d  64 cd		 stz $cd
$0a:a34f  64 49		 stz $49
$0a:a351  a4 29		 ldy $29
$0a:a353  c4 55		 cpy $55
$0a:a355  f4 13 fe	  pea $fe13
$0a:a358  08			php
$0a:a359  00 19		 brk #$19
$0a:a35b  00 1b		 brk #$1b
$0a:a35d  00 1b		 brk #$1b
$0a:a35f  00 1b		 brk #$1b
$0a:a361  00 1b		 brk #$1b
$0a:a363  00 0b		 brk #$0b
$0a:a365  00 01		 brk #$01
$0a:a367  00 ad		 brk #$ad
$0a:a369  82 6f 2f	  brl $d2db
$0a:a36c  a8			tay
$0a:a36d  f9 75 35	  sbc $3575,y
$0a:a370  28			plp
$0a:a371  69 d4 f5	  adc #$f5d4
$0a:a374  33 7b		 and ($7b,s),y
$0a:a376  29 69 7f	  and #$7f69
$0a:a379  00 ef		 brk #$ef
$0a:a37b  10 79		 bpl $a3f6
$0a:a37d  06 f5		 asl $f5
$0a:a37f  0a			asl a
$0a:a380  e9 16 75	  sbc #$7516
$0a:a383  0a			asl a
$0a:a384  fb			xce
$0a:a385  04 e9		 tsb $e9
$0a:a387  16 da		 asl $da,x
$0a:a389  cf ae 1b 2a   cmp $2a1bae
$0a:a38d  9f ae 9b ee   sta $ee9bae,x
$0a:a391  db			stp
$0a:a392  2c 9b be	  bit $be9b
$0a:a395  8f ba 3b 34   sta $343bba
$0a:a399  00 f4		 brk #$f4
$0a:a39b  00 f4		 brk #$f4
$0a:a39d  00 f4		 brk #$f4
$0a:a39f  00 b4		 brk #$b4
$0a:a3a1  00 f4		 brk #$f4
$0a:a3a3  00 f0		 brk #$f0
$0a:a3a5  00 c4		 brk #$c4
$0a:a3a7  00 1d		 brk #$1d
$0a:a3a9  e3 76		 sbc $76,s
$0a:a3ab  8e d8 3a	  stx $3ad8
$0a:a3ae  64 ea		 stz $ea
$0a:a3b0  12 ab		 ora ($ab)
$0a:a3b2  48			pha
$0a:a3b3  af 23 bc 0c   lda $0cbc23
$0a:a3b7  f3 00		 sbc ($00,s),y
$0a:a3b9  ff 01 ff 05   sbc $05ff01,x
$0a:a3bd  ff 15 ff 54   sbc $54ff15,x
$0a:a3c1  ff 50 ff 40   sbc $40ff50,x
$0a:a3c5  ff 00 ff 78   sbc $78ff00,x
$0a:a3c9  47 9f		 eor [$9f]
$0a:a3cb  50 67		 bvc $a434
$0a:a3cd  d4 d9		 pei ($d9)
$0a:a3cf  75 b7		 adc $b7,x
$0a:a3d1  9d 2d e7	  sta $e72d,x
$0a:a3d4  cb			wai
$0a:a3d5  39 37 4f	  and $4f37,y
$0a:a3d8  80 ff		 bra $a3d9
$0a:a3da  e0 ff		 cpx #$ff
$0a:a3dc  f8			sed
$0a:a3dd  ff fe ff 7e   sbc $7efffe,x
$0a:a3e1  ff 1e ff 06   sbc $06ff1e,x
$0a:a3e5  ff 80 ff b6   sbc $b6ff80,x
$0a:a3e9  70 db		 bvs $a3c6
$0a:a3eb  48			pha
$0a:a3ec  f3 4a		 sbc ($4a,s),y
$0a:a3ee  f7 60		 sbc [$60],y
$0a:a3f0  5a			phy
$0a:a3f1  c9 2f c4	  cmp #$c42f
$0a:a3f4  f3 55		 sbc ($55,s),y
$0a:a3f6  17 ab		 ora [$ab],y
$0a:a3f8  0f 00 37 00   ora $003700
$0a:a3fc  3d 00 1f	  and $1f00,x
$0a:a3ff  00 37		 brk #$37
$0a:a401  00 3b		 brk #$3b
$0a:a403  00 2e		 brk #$2e
$0a:a405  00 7c		 brk #$7c
$0a:a407  00 e9		 brk #$e9
$0a:a409  36 7b		 rol $7b,x
$0a:a40b  0d b7 58	  ora $58b7
$0a:a40e  fe 35 fd	  inc $fd35,x
$0a:a411  6a			ror a
$0a:a412  f8			sed
$0a:a413  d6 75		 dec $75,x
$0a:a415  a1 ed		 lda ($ed,x)
$0a:a417  51 d8		 eor ($d8),y
$0a:a419  00 f0		 brk #$f0
$0a:a41b  00 e1		 brk #$e1
$0a:a41d  00 c3		 brk #$c3
$0a:a41f  00 87		 brk #$87
$0a:a421  02 0f		 cop #$0f
$0a:a423  00 1e		 brk #$1e
$0a:a425  00 3e		 brk #$3e
$0a:a427  00 ba		 brk #$ba
$0a:a429  7c ff ff	  jmp ($ffff,x)
$0a:a42c  af 9f eb f3   lda $f3eb9f
$0a:a430  ff ff da d9   sbc $d9daff,x
$0a:a434  eb			xba
$0a:a435  e7 7f		 sbc [$7f]
$0a:a437  ff 30 cf ff   sbc $ffcf30,x
$0a:a43b  00 ff		 brk #$ff
$0a:a43d  78			sei
$0a:a43e  c3 3d		 cmp $3d,s
$0a:a440  ff 00 ff 67   sbc $67ff00,x
$0a:a444  e1 1e		 sbc ($1e,x)
$0a:a446  3f c0 f5 f9   and $f9f5c0,x
$0a:a44a  af 9f fa fc   lda $fcfa9f
$0a:a44e  5f 9f eb e7   eor $e7eb9f,x
$0a:a452  fa			plx
$0a:a453  fc ff ff	  jsr ($ffff,x)
$0a:a456  5d 3c ff	  eor $ff3c,x
$0a:a459  1e 87 78	  asl $7887,x
$0a:a45c  f8			sed
$0a:a45d  07 ff		 ora [$ff]
$0a:a45f  e0 ff		 cpx #$ff
$0a:a461  1e f0 8f	  asl $8ff0,x
$0a:a464  ff 00 fc f3   sbc $f3fc00,x
$0a:a468  f9 06 c5	  sbc $c506,y
$0a:a46b  3f b3 7b e8   and $e87bb3,x
$0a:a46f  2a			rol a
$0a:a470  a3 6b		 lda $6b,s
$0a:a472  be 7a a3	  ldx $a37a,y
$0a:a475  6b			rtl
$0a:a476  95 7f		 sta $7f,x
$0a:a478  00 00		 brk #$00
$0a:a47a  00 00		 brk #$00
$0a:a47c  04 00		 tsb $00
$0a:a47e  15 00		 ora $00,x
$0a:a480  14 00		 trb $00
$0a:a482  05 00		 ora $00
$0a:a484  14 00		 trb $00
$0a:a486  00 00		 brk #$00
$0a:a488  ff 00 50 ff   sbc $ff5000,x
$0a:a48c  b6 b6		 ldx $b6,y
$0a:a48e  49 49 22	  eor #$2249
$0a:a491  22 49 00 b6   jsl $b60049
$0a:a495  00 eb		 brk #$eb
$0a:a497  fb			xce
$0a:a498  00 00		 brk #$00
$0a:a49a  00 00		 brk #$00
$0a:a49c  49 00 b6	  eor #$b600
$0a:a49f  00 dd		 brk #$dd
$0a:a4a1  00 ff		 brk #$ff
$0a:a4a3  00 ff		 brk #$ff
$0a:a4a5  00 04		 brk #$04
$0a:a4a7  00 fe		 brk #$fe
$0a:a4a9  01 32		 ora ($32,x)
$0a:a4ab  eb			xba
$0a:a4ac  23 9d		 and $9d,s
$0a:a4ae  91 f7		 sta ($f7),y
$0a:a4b0  05 ef		 ora $ef
$0a:a4b2  4f fd 27 9b   eor $9b27fd
$0a:a4b6  a6 a4		 ldx $a4
$0a:a4b8  00 00		 brk #$00
$0a:a4ba  04 00		 tsb $00
$0a:a4bc  42 18		 wdm #$18
$0a:a4be  08			php
$0a:a4bf  3c 18 3c	  bit $3c18,x
$0a:a4c2  02 18		 cop #$18
$0a:a4c4  66 00		 ror $00
$0a:a4c6  5b			tcd
$0a:a4c7  00 22		 brk #$22
$0a:a4c9  ea			nop
$0a:a4ca  e1 e8		 sbc ($e8,x)
$0a:a4cc  2c a2 67	  bit $67a2
$0a:a4cf  dd 48 c5	  cmp $c548,x
$0a:a4d2  69 e5 05	  adc #$05e5
$0a:a4d5  c1 5c		 cmp ($5c,x)
$0a:a4d7  fe 1d 00	  inc $001d,x
$0a:a4da  1f 00 5f 00   ora $005f00,x
$0a:a4de  3e 00 3e	  rol $3e00,x
$0a:a4e1  00 1e		 brk #$1e
$0a:a4e3  00 3e		 brk #$3e
$0a:a4e5  00 01		 brk #$01
$0a:a4e7  00 ae		 brk #$ae
$0a:a4e9  60			rts
$0a:a4ea  be 62 13	  ldx $1362,y
$0a:a4ed  e8			inx
$0a:a4ee  25 e2		 and $e2
$0a:a4f0  1d fd 1b	  ora $1bfd,x
$0a:a4f3  ff 44 bb b3   sbc $b3bb44,x
$0a:a4f7  cc 1f 00	  cpy $001f
$0a:a4fa  1d 00 1f	  ora $1f00,x
$0a:a4fd  00 1f		 brk #$1f
$0a:a4ff  00 02		 brk #$02
$0a:a501  00 00		 brk #$00
$0a:a503  00 00		 brk #$00
$0a:a505  00 00		 brk #$00
$0a:a507  00 fc		 brk #$fc
$0a:a509  01 ec		 ora ($ec,x)
$0a:a50b  01 d9		 ora ($d9,x)
$0a:a50d  45 04		 eor $04
$0a:a50f  d9 bb b9	  cmp $b9bb,y
$0a:a512  6d fd 12	  adc $12fd
$0a:a515  ef b5 4b fe   sbc $fe4bb5
$0a:a519  00 fe		 brk #$fe
$0a:a51b  00 be		 brk #$be
$0a:a51d  00 fe		 brk #$fe
$0a:a51f  00 46		 brk #$46
$0a:a521  00 02		 brk #$02
$0a:a523  00 00		 brk #$00
$0a:a525  00 00		 brk #$00
$0a:a527  00 db		 brk #$db
$0a:a529  c7 96		 cmp [$96]
$0a:a52b  8e b8 08	  stx $08b8
$0a:a52e  18			clc
$0a:a52f  e7 bd		 sbc [$bd]
$0a:a531  7c 69 e8	  jmp ($e869,x)
$0a:a534  8b			phb
$0a:a535  80 81		 bra $a4b8
$0a:a537  fe 20 ff	  inc $ff20,x
$0a:a53a  61 ff		 adc ($ff,x)
$0a:a53c  e7 ff		 sbc [$ff]
$0a:a53e  00 ff		 brk #$ff
$0a:a540  02 ff		 cop #$ff
$0a:a542  16 ff		 asl $ff,x
$0a:a544  7e ff 00	  ror $00ff,x
$0a:a547  ff a1 9e ab   sbc $ab9ea1,x
$0a:a54b  9e 8f b6	  stz $b68f,x
$0a:a54e  a7 9e		 lda [$9e]
$0a:a550  c2 c0		 rep #$c0
$0a:a552  ab			plb
$0a:a553  96 54		 stx $54,y
$0a:a555  cd 25 e0	  cmp $e025
$0a:a558  7f 00 7f 00   adc $007f00,x
$0a:a55c  7f 00 7f 00   adc $007f00,x
$0a:a560  3f 00 7f 00   and $007f00,x
$0a:a564  3d 02 1f	  and $1f02,x
$0a:a567  00 64		 brk #$64
$0a:a569  35 29		 and $29,x
$0a:a56b  69 d0 f1	  adc #$f1d0
$0a:a56e  64 2d		 stz $2d
$0a:a570  11 71		 ora ($71),y
$0a:a572  a4 e5		 ldy $e5
$0a:a574  57 3f		 eor [$3f],y
$0a:a576  ce c0 f5	  dec $f5c0
$0a:a579  0a			asl a
$0a:a57a  e9 16 71	  sbc #$7116
$0a:a57d  0e ed 12	  asl $12ed
$0a:a580  f1 0e		 sbc ($0e),y
$0a:a582  65 1a		 adc $1a
$0a:a584  ff 00 3f 00   sbc $003f00,x
$0a:a588  10 40		 bpl $a5ca
$0a:a58a  20 00 28	  jsr $2800
$0a:a58d  10 20		 bpl $a5af
$0a:a58f  10 24		 bpl $a5b5
$0a:a591  18			clc
$0a:a592  20 18 2a	  jsr $2a18
$0a:a595  5c 01 5d 30   jml $305d01
$0a:a599  70 70		 bvs $a60b
$0a:a59b  70 68		 bvs $a605
$0a:a59d  78			sei
$0a:a59e  68			pla
$0a:a59f  78			sei
$0a:a5a0  64 7c		 stz $7c
$0a:a5a2  6c 7c 6a	  jmp ($6a7c)
$0a:a5a5  7e 6e 7f	  ror $7f6e,x
$0a:a5a8  00 00		 brk #$00
$0a:a5aa  00 00		 brk #$00
$0a:a5ac  00 00		 brk #$00
$0a:a5ae  00 00		 brk #$00
$0a:a5b0  00 00		 brk #$00
$0a:a5b2  00 00		 brk #$00
$0a:a5b4  00 00		 brk #$00
$0a:a5b6  fc aa 00	  jsr ($00aa,x)
$0a:a5b9  00 00		 brk #$00
$0a:a5bb  00 00		 brk #$00
$0a:a5bd  00 00		 brk #$00
$0a:a5bf  00 00		 brk #$00
$0a:a5c1  00 00		 brk #$00
$0a:a5c3  00 00		 brk #$00
$0a:a5c5  00 fe		 brk #$fe
$0a:a5c7  fe 86 80	  inc $8086,x
$0a:a5ca  ad 9f 5b	  lda $5b9f
$0a:a5cd  c1 6b		 cmp ($6b,x)
$0a:a5cf  e9 3d bd	  sbc #$bd3d
$0a:a5d2  6d fd 2a	  adc $2afd
$0a:a5d5  ef fe 01 7f   sbc $7f01fe
$0a:a5d9  00 7e		 brk #$7e
$0a:a5db  00 3e		 brk #$3e
$0a:a5dd  00 16		 brk #$16
$0a:a5df  00 42		 brk #$42
$0a:a5e1  00 02		 brk #$02
$0a:a5e3  00 10		 brk #$10
$0a:a5e5  00 00		 brk #$00
$0a:a5e7  00 cf		 brk #$cf
$0a:a5e9  76 7f		 ror $7f,x
$0a:a5eb  cc 76 db	  cpy $db76
$0a:a5ee  be 77 db	  ldx $db77,y
$0a:a5f1  6a			ror a
$0a:a5f2  3d d6 64	  and $64d6,x
$0a:a5f5  b3 db		 lda ($db,s),y
$0a:a5f7  62 38 00	  per $a632
$0a:a5fa  30 00		 bmi $a5fc
$0a:a5fc  20 00 00	  jsr $0000
$0a:a5ff  00 04		 brk #$04
$0a:a601  00 08		 brk #$08
$0a:a603  00 1c		 brk #$1c
$0a:a605  00 3c		 brk #$3c
$0a:a607  20 c5 20	  jsr $20c5
$0a:a60a  de 30 ad	  dec $ad30,x
$0a:a60d  5a			phy
$0a:a60e  9f 6c af 76   sta $76af6c,x
$0a:a612  c7 2b		 cmp [$2b]
$0a:a614  da			phx
$0a:a615  15 a1		 ora $a1,x
$0a:a617  66 1f		 ror $1f
$0a:a619  00 0f		 brk #$0f
$0a:a61b  00 07		 brk #$07
$0a:a61d  00 03		 brk #$03
$0a:a61f  00 01		 brk #$01
$0a:a621  00 10		 brk #$10
$0a:a623  00 28		 brk #$28
$0a:a625  00 1c		 brk #$1c
$0a:a627  00 77		 brk #$77
$0a:a629  c1 48		 cmp ($48,x)
$0a:a62b  dd 41 dd	  cmp $dd41,x
$0a:a62e  6f d9 49 dd   adc $dd49d9
$0a:a632  7d c9 e0	  adc $e0c9,x
$0a:a635  5d 0f db	  eor $db0f,x
$0a:a638  3e 00 3e	  rol $3e00,x
$0a:a63b  00 3e		 brk #$3e
$0a:a63d  00 3e		 brk #$3e
$0a:a63f  00 3e		 brk #$3e
$0a:a641  00 3e		 brk #$3e
$0a:a643  00 3e		 brk #$3e
$0a:a645  00 3c		 brk #$3c
$0a:a647  00 f3		 brk #$f3
$0a:a649  6e fe 33	  ror $33fe
$0a:a64c  ae 5b 9d	  ldx $9d5b
$0a:a64f  6e ab 76	  ror $76ab
$0a:a652  c4 2b		 cpy $2b
$0a:a654  da			phx
$0a:a655  15 a1		 ora $a1,x
$0a:a657  66 1c		 ror $1c
$0a:a659  00 0c		 brk #$0c
$0a:a65b  00 04		 brk #$04
$0a:a65d  00 00		 brk #$00
$0a:a65f  00 00		 brk #$00
$0a:a661  00 10		 brk #$10
$0a:a663  00 28		 brk #$28
$0a:a665  00 1c		 brk #$1c
$0a:a667  00 00		 brk #$00
$0a:a669  01 01		 ora ($01,x)
$0a:a66b  03 02		 ora $02,s
$0a:a66d  06 05		 asl $05
$0a:a66f  0c 0b 18	  tsb $180b
$0a:a672  13 36		 ora ($36,s),y
$0a:a674  2e 65 5b	  rol $5b65
$0a:a677  c1 00		 cmp ($00,x)
$0a:a679  00 00		 brk #$00
$0a:a67b  00 01		 brk #$01
$0a:a67d  00 03		 brk #$03
$0a:a67f  00 07		 brk #$07
$0a:a681  00 0d		 brk #$0d
$0a:a683  00 1b		 brk #$1b
$0a:a685  00 3e		 brk #$3e
$0a:a687  00 89		 brk #$89
$0a:a689  7f 92 00 35   adc $350092,x
$0a:a68d  90 ee		 bcc $a67d
$0a:a68f  48			pha
$0a:a690  d5 41		 cmp $41,x
$0a:a692  6a			ror a
$0a:a693  e0 99		 cpx #$99
$0a:a695  48			pha
$0a:a696  22 f6 ff ff   jsl $fffff6
$0a:a69a  ff ff ef ff   sbc $ffefff,x
$0a:a69e  b7 ff		 lda [$ff],y
$0a:a6a0  be ff 9f	  ldx $9fff,y
$0a:a6a3  ff b7 ff 89   sbc $89ffb7,x
$0a:a6a7  ff 16 ff d2   sbc $d2ff16,x
$0a:a6ab  80 35		 bra $a6e2
$0a:a6ad  10 6e		 bpl $a71d
$0a:a6af  08			php
$0a:a6b0  95 01		 sta $01,x
$0a:a6b2  ea			nop
$0a:a6b3  a0 19		 ldy #$19
$0a:a6b5  08			php
$0a:a6b6  64 ee		 stz $ee
$0a:a6b8  ff ff 7f ff   sbc $ff7fff,x
$0a:a6bc  ef ff f7 ff   sbc $fff7ff
$0a:a6c0  fe ff 5f	  inc $5fff,x
$0a:a6c3  ff f7 ff 11   sbc $11fff7,x
$0a:a6c7  ff 15 5e 11   sbc $115e15,x
$0a:a6cb  6e 49 2e	  ror $2e49
$0a:a6ce  09 36 25	  ora #$2536
$0a:a6d1  16 05		 asl $05,x
$0a:a6d3  1a			inc a
$0a:a6d4  13 0a		 ora ($0a,s),y
$0a:a6d6  03 0d		 ora $0d,s
$0a:a6d8  34 7f		 bit $7f,x
$0a:a6da  36 7f		 rol $7f,x
$0a:a6dc  3a			dec a
$0a:a6dd  7f 1a 3f 1c   adc $1c3f1a,x
$0a:a6e1  3f 0c 1f 0e   and $0e1f0c,x
$0a:a6e5  1f 06 0f 02   ora $020f06,x
$0a:a6e9  fc 32 fe	  jsr ($fe32,x)
$0a:a6ec  32 fc		 and ($fc)
$0a:a6ee  32 fe		 and ($fe)
$0a:a6f0  32 fc		 and ($fc)
$0a:a6f2  32 fe		 and ($fe)
$0a:a6f4  02 fc		 cop #$fc
$0a:a6f6  fc 54 7a	  jsr ($7a54,x)
$0a:a6f9  fe 7a fe	  inc $fe7a,x
$0a:a6fc  7a			ply
$0a:a6fd  fe 7a fe	  inc $fe7a,x
$0a:a700  7a			ply
$0a:a701  fe 7a fe	  inc $fe7a,x
$0a:a704  7a			ply
$0a:a705  fe fe fe	  inc $fefe,x
$0a:a708  6f 45 49 57   adc $574945
$0a:a70c  46 32		 lsr $32
$0a:a70e  24 2a		 bit $2a
$0a:a710  23 18		 and $18,s
$0a:a712  10 16		 bpl $a72a
$0a:a714  17 0d		 ora [$0d],y
$0a:a716  0d 09 2e	  ora $2e09
$0a:a719  70 3e		 bvs $a759
$0a:a71b  70 37		 bvs $a754
$0a:a71d  48			pha
$0a:a71e  1f 38 1b 25   ora $251b38,x
$0a:a722  0f 1b 0a 17   ora $170a1b
$0a:a726  06 0f		 asl $0f
$0a:a728  b4 7a		 ldy $7a,x
$0a:a72a  c8			iny
$0a:a72b  4c 48 ce	  jmp $ce48
$0a:a72e  48			pha
$0a:a72f  cc 00 fe	  cpy $fe00
$0a:a732  f0 f4		 beq $a728
$0a:a734  b8			clv
$0a:a735  7a			ply
$0a:a736  8a			txa
$0a:a737  58			cli
$0a:a738  fe 02 cc	  inc $cc02,x
$0a:a73b  32 ce		 and ($ce)
$0a:a73d  32 cc		 and ($cc)
$0a:a73f  32 fe		 and ($fe)
$0a:a741  fa			plx
$0a:a742  0c fe f6	  tsb $f6fe
$0a:a745  0e d6 fe	  asl $fed6
$0a:a748  b5 f5		 lda $f5,x
$0a:a74a  fa			plx
$0a:a74b  fa			plx
$0a:a74c  29 69 36	  and #$3669
$0a:a74f  76 ac		 ror $ac,x
$0a:a751  ec 3a 7a	  cpx $7a3a
$0a:a754  61 61		 adc ($61,x)
$0a:a756  d6 3f		 dec $3f,x
$0a:a758  75 0a		 adc $0a,x
$0a:a75a  7a			ply
$0a:a75b  05 e9		 ora $e9
$0a:a75d  16 f6		 asl $f6,x
$0a:a75f  09 6c 13	  ora #$136c
$0a:a762  fa			plx
$0a:a763  05 e1		 ora $e1
$0a:a765  1e ff 00	  asl $00ff,x
$0a:a768  26 00		 rol $00
$0a:a76a  d6 ff		 dec $ff,x
$0a:a76c  55 55		 eor $55,x
$0a:a76e  a8			tay
$0a:a76f  a9 45 45	  lda #$4545
$0a:a772  21 21		 and ($21,x)
$0a:a774  01 01		 ora ($01,x)
$0a:a776  96 ff		 stx $ff,y
$0a:a778  ff 00 ff 00   sbc $00ff00,x
$0a:a77c  55 aa		 eor $aa,x
$0a:a77e  a9 56 45	  lda #$4556
$0a:a781  ba			tsx
$0a:a782  21 de		 and ($de,x)
$0a:a784  01 fe		 ora ($fe,x)
$0a:a786  ff 00 12 00   sbc $001200,x
$0a:a78a  5d 21 0a	  eor $0a21,x
$0a:a78d  73 16		 adc ($16,s),y
$0a:a78f  67 6c		 adc [$6c]
$0a:a791  0f ea 73 4c   ora $4c73ea
$0a:a795  0f a0 ff ff   ora $ffffa0
$0a:a799  00 fe		 brk #$fe
$0a:a79b  00 fc		 brk #$fc
$0a:a79d  00 f8		 brk #$f8
$0a:a79f  00 f0		 brk #$f0
$0a:a7a1  00 fc		 brk #$fc
$0a:a7a3  00 f0		 brk #$f0
$0a:a7a5  00 00		 brk #$00
$0a:a7a7  00 a5		 brk #$a5
$0a:a7a9  80 ca		 bra $a775
$0a:a7ab  bf 2f 6f 36   lda $366f2f,x
$0a:a7af  76 ad		 ror $ad,x
$0a:a7b1  ed 3a 7a	  sbc $7a3a
$0a:a7b4  61 61		 adc ($61,x)
$0a:a7b6  d6 3f		 dec $3f,x
$0a:a7b8  7f 00 7f 00   adc $007f00,x
$0a:a7bc  ef 10 f6 09   sbc $09f610
$0a:a7c0  6d 12 fa	  adc $fa12
$0a:a7c3  05 e1		 ora $e1
$0a:a7c5  1e ff 00	  asl $00ff,x
$0a:a7c8  b4 75		 ldy $75,x
$0a:a7ca  e8			inx
$0a:a7cb  e9 55 55	  sbc #$5555
$0a:a7ce  aa			tax
$0a:a7cf  ab			plb
$0a:a7d0  44 45 21	  mvp $21,$45
$0a:a7d3  21 00		 and ($00,x)
$0a:a7d5  01 92		 ora ($92,x)
$0a:a7d7  ff f5 0a e9   sbc $e90af5,x
$0a:a7db  16 55		 asl $55,x
$0a:a7dd  aa			tax
$0a:a7de  ab			plb
$0a:a7df  54 45 ba	  mvn $ba,$45
$0a:a7e2  21 de		 and ($de,x)
$0a:a7e4  01 fe		 ora ($fe,x)
$0a:a7e6  ff 00 9f 60   sbc $609f00,x
$0a:a7ea  b0 6f		 bcs $a85b
$0a:a7ec  90 6f		 bcc $a85d
$0a:a7ee  92 6d		 sta ($6d)
$0a:a7f0  9f 60 cb 04   sta $04cb60,x
$0a:a7f4  97 37		 sta [$37],y
$0a:a7f6  08			php
$0a:a7f7  38			sec
$0a:a7f8  20 ef 60	  jsr $60ef
$0a:a7fb  ff 2b ff 20   sbc $20ff2b,x
$0a:a7ff  ff 00 ff 3f   sbc $3fff00,x
$0a:a803  40			rti
$0a:a804  77 08		 adc [$08],y
$0a:a806  f8			sed
$0a:a807  07 02		 ora [$02]
$0a:a809  62 30 70	  per $183c
$0a:a80c  8d 72 dc	  sta $dc72
$0a:a80f  3c 30 70	  bit $7030,x
$0a:a812  28			plp
$0a:a813  68			pla
$0a:a814  60			rts
$0a:a815  60			rts
$0a:a816  a4 64		 ldy $64
$0a:a818  e2 1d		 sep #$1d
$0a:a81a  f0 0f		 beq $a82b
$0a:a81c  ff 00 fc 03   sbc $03fc00,x
$0a:a820  f0 0f		 beq $a831
$0a:a822  e8			inx
$0a:a823  17 e0		 ora [$e0],y
$0a:a825  1f e4 1b 6b   ora $6b1be4,x
$0a:a829  c9 49 dd	  cmp #$dd49
$0a:a82c  42 dd		 wdm #$dd
$0a:a82e  29 dd 4d	  and #$4ddd
$0a:a831  d9 c8 5d	  cmp $5dc8,y
$0a:a834  37 eb		 and [$eb],y
$0a:a836  57 d1		 eor [$d1],y
$0a:a838  36 00		 rol $00,x
$0a:a83a  3e 00 3e	  rol $3e00,x
$0a:a83d  00 3e		 brk #$3e
$0a:a83f  00 3e		 brk #$3e
$0a:a841  00 3e		 brk #$3e
$0a:a843  00 1c		 brk #$1c
$0a:a845  00 2e		 brk #$2e
$0a:a847  00 14		 brk #$14
$0a:a849  0e ff 00	  asl $00ff
$0a:a84c  cc ff 00	  cpy $00ff
$0a:a84f  ff ff 00 91   sbc $9100ff,x
$0a:a853  6e ff 00	  ror $00ff
$0a:a856  1a			inc a
$0a:a857  04 0c		 tsb $0c
$0a:a859  1e 00 fe	  asl $fe00,x
$0a:a85c  fe ff 00	  inc $00ff,x
$0a:a85f  ff 00 d0 00   sbc $00d000,x
$0a:a863  ff 00 00 00   sbc $000000,x
$0a:a867  0c 7f d0	  tsb $d07f
$0a:a86a  b5 e8		 lda $e8,x
$0a:a86c  ff 51 ed ba   sbc $baed51,x
$0a:a870  9e 55 fb	  stz $fb55,x
$0a:a873  4e ed 17	  lsr $17ed
$0a:a876  d6 0b		 dec $0b,x
$0a:a878  2f 00 1f 00   and $001f00
$0a:a87c  8e 00 47	  stx $4700
$0a:a87f  00 e3		 brk #$e3
$0a:a881  00 b1		 brk #$b1
$0a:a883  00 f8		 brk #$f8
$0a:a885  00 fc		 brk #$fc
$0a:a887  00 c8		 brk #$c8
$0a:a889  37 d2		 and [$d2],y
$0a:a88b  80 35		 bra $a8c2
$0a:a88d  10 6e		 bpl $a8fd
$0a:a88f  08			php
$0a:a890  95 01		 sta $01,x
$0a:a892  ea			nop
$0a:a893  a0 6d		 ldy #$6d
$0a:a895  6d 88 77	  adc $7788
$0a:a898  ff ff 7f ff   sbc $ff7fff,x
$0a:a89c  ef ff f7 ff   sbc $fff7ff
$0a:a8a0  fe ff 5f	  inc $5fff,x
$0a:a8a3  ff 92 7f ff   sbc $ff7f92,x
$0a:a8a7  ff c9 36 52   sbc $5236c9,x
$0a:a8ab  c0 15		 cpy #$15
$0a:a8ad  90 ce		 bcc $a87d
$0a:a8af  48			pha
$0a:a8b0  55 c1		 eor $c1,x
$0a:a8b2  ea			nop
$0a:a8b3  60			rts
$0a:a8b4  59 fb c9	  eor $c9fb,y
$0a:a8b7  36 ff		 rol $ff,x
$0a:a8b9  ff bf ff ef   sbc $efffbf,x
$0a:a8bd  ff b7 ff be   sbc $beffb7,x
$0a:a8c1  ff 9f ff 84   sbc $84ff9f,x
$0a:a8c5  ff ff ff 0d   sbc $0dffff,x
$0a:a8c9  02 0e		 cop #$0e
$0a:a8cb  05 0b		 ora $0b
$0a:a8cd  00 0c		 brk #$0c
$0a:a8cf  04 0c		 tsb $0c
$0a:a8d1  00 08		 brk #$08
$0a:a8d3  00 0c		 brk #$0c
$0a:a8d5  04 0c		 tsb $0c
$0a:a8d7  00 02		 brk #$02
$0a:a8d9  0f 00 0f 04   ora $040f00
$0a:a8dd  0c 00 0c	  tsb $0c00
$0a:a8e0  04 0c		 tsb $0c
$0a:a8e2  04 0c		 tsb $0c
$0a:a8e4  00 0c		 brk #$0c
$0a:a8e6  00 04		 brk #$04
$0a:a8e8  00 aa		 brk #$aa
$0a:a8ea  ae 54 f8	  ldx $f854
$0a:a8ed  00 0c		 brk #$0c
$0a:a8ef  04 0c		 tsb $0c
$0a:a8f1  00 08		 brk #$08
$0a:a8f3  00 0c		 brk #$0c
$0a:a8f5  04 0c		 tsb $0c
$0a:a8f7  00 fe		 brk #$fe
$0a:a8f9  fe 00 fe	  inc $fe00,x
$0a:a8fc  04 0c		 tsb $0c
$0a:a8fe  00 0c		 brk #$0c
$0a:a900  04 0c		 tsb $0c
$0a:a902  04 0c		 tsb $0c
$0a:a904  00 0c		 brk #$0c
$0a:a906  00 04		 brk #$04
$0a:a908  0a			asl a
$0a:a909  07 0f		 ora [$0f]
$0a:a90b  00 0b		 brk #$0b
$0a:a90d  00 0c		 brk #$0c
$0a:a90f  04 0c		 tsb $0c
$0a:a911  00 08		 brk #$08
$0a:a913  00 0c		 brk #$0c
$0a:a915  04 04		 tsb $04
$0a:a917  04 04		 tsb $04
$0a:a919  0f 04 0f 04   ora $040f04
$0a:a91d  0c 00 0c	  tsb $0c00
$0a:a920  04 0c		 tsb $0c
$0a:a922  04 0c		 tsb $0c
$0a:a924  00 0c		 brk #$0c
$0a:a926  00 00		 brk #$00
$0a:a928  00 58		 brk #$58
$0a:a92a  fe 06 f8	  inc $f806,x
$0a:a92d  00 0c		 brk #$0c
$0a:a92f  04 0c		 tsb $0c
$0a:a931  00 08		 brk #$08
$0a:a933  00 0c		 brk #$0c
$0a:a935  04 04		 tsb $04
$0a:a937  04 f6		 tsb $f6
$0a:a939  ae 00 fc	  ldx $fc00
$0a:a93c  04 0c		 tsb $0c
$0a:a93e  00 0c		 brk #$0c
$0a:a940  04 0c		 tsb $0c
$0a:a942  04 0c		 tsb $0c
$0a:a944  00 0c		 brk #$0c
$0a:a946  00 00		 brk #$00
$0a:a948  1a			inc a
$0a:a949  00 48		 brk #$48
$0a:a94b  37 41		 and [$41],y
$0a:a94d  3e 28 5f	  rol $5f28,x
$0a:a950  04 7b		 tsb $7b
$0a:a952  ea			nop
$0a:a953  6a			ror a
$0a:a954  6a			ror a
$0a:a955  00 a8		 brk #$a8
$0a:a957  ff ff 00 ff   sbc $ff00ff,x
$0a:a95b  00 ff		 brk #$ff
$0a:a95d  00 ff		 brk #$ff
$0a:a95f  00 ff		 brk #$ff
$0a:a961  00 ea		 brk #$ea
$0a:a963  15 ff		 ora $ff,x
$0a:a965  00 00		 brk #$00
$0a:a967  00 08		 brk #$08
$0a:a969  00 47		 brk #$47
$0a:a96b  b8			clv
$0a:a96c  09 f6 a9	  ora #$a9f6
$0a:a96f  5e 00 ff	  lsr $ff00,x
$0a:a972  9b			txy
$0a:a973  9a			txs
$0a:a974  69 00 a8	  adc #$a800
$0a:a977  ff ff 00 ff   sbc $ff00ff,x
$0a:a97b  00 ff		 brk #$ff
$0a:a97d  00 ff		 brk #$ff
$0a:a97f  00 ff		 brk #$ff
$0a:a981  00 9b		 brk #$9b
$0a:a983  64 ff		 stz $ff
$0a:a985  00 00		 brk #$00
$0a:a987  00 b5		 brk #$b5
$0a:a989  49 5a fc	  eor #$fc5a
$0a:a98c  7d fe a6	  adc $a6fe,x
$0a:a98f  a7 80		 lda [$80]
$0a:a991  80 26		 bra $a9b9
$0a:a993  d9 91 00	  cmp $0091,y
$0a:a996  ee ff fe	  inc $feff
$0a:a999  00 ff		 brk #$ff
$0a:a99b  00 ff		 brk #$ff
$0a:a99d  00 a7		 brk #$a7
$0a:a99f  58			cli
$0a:a9a0  80 7f		 bra $aa21
$0a:a9a2  ff 00 ff 00   sbc $00ff00,x
$0a:a9a6  00 00		 brk #$00
$0a:a9a8  1a			inc a
$0a:a9a9  00 48		 brk #$48
$0a:a9ab  37 41		 and [$41],y
$0a:a9ad  3e a8 5f	  rol $5fa8,x
$0a:a9b0  04 fb		 tsb $fb
$0a:a9b2  7a			ply
$0a:a9b3  7a			ply
$0a:a9b4  6a			ror a
$0a:a9b5  00 a8		 brk #$a8
$0a:a9b7  ff ff 00 ff   sbc $ff00ff,x
$0a:a9bb  00 ff		 brk #$ff
$0a:a9bd  00 ff		 brk #$ff
$0a:a9bf  00 ff		 brk #$ff
$0a:a9c1  00 7a		 brk #$7a
$0a:a9c3  85 ff		 sta $ff
$0a:a9c5  00 00		 brk #$00
$0a:a9c7  00 08		 brk #$08
$0a:a9c9  00 47		 brk #$47
$0a:a9cb  b8			clv
$0a:a9cc  09 f6 a9	  ora #$a9f6
$0a:a9cf  5e 00 ff	  lsr $ff00,x
$0a:a9d2  9a			txs
$0a:a9d3  9a			txs
$0a:a9d4  6a			ror a
$0a:a9d5  00 a8		 brk #$a8
$0a:a9d7  ff ff 00 ff   sbc $ff00ff,x
$0a:a9db  00 ff		 brk #$ff
$0a:a9dd  00 ff		 brk #$ff
$0a:a9df  00 ff		 brk #$ff
$0a:a9e1  00 9a		 brk #$9a
$0a:a9e3  65 ff		 adc $ff
$0a:a9e5  00 00		 brk #$00
$0a:a9e7  00 2f		 brk #$2f
$0a:a9e9  00 6f		 brk #$6f
$0a:a9eb  00 ff		 brk #$ff
$0a:a9ed  10 ff		 bpl $a9ee
$0a:a9ef  28			plp
$0a:a9f0  df 04 5d 02   cmp $025d04,x
$0a:a9f4  3f 20 0f 00   and $000f20,x
$0a:a9f8  10 19		 bpl $aa13
$0a:a9fa  10 19		 bpl $aa15
$0a:a9fc  00 39		 brk #$39
$0a:a9fe  00 3d		 brk #$3d
$0a:aa00  20 3f 20	  jsr $203f
$0a:aa03  33 00		 and ($00,s),y
$0a:aa05  31 00		 and ($00),y
$0a:aa07  01 f0		 ora ($f0,x)
$0a:aa09  00 f0		 brk #$f0
$0a:aa0b  80 7c		 bra $aa89
$0a:aa0d  08			php
$0a:aa0e  6c 14 78	  jmp ($7814)
$0a:aa11  20 78 40	  jsr $4078
$0a:aa14  7c 04 e0	  jmp ($e004,x)
$0a:aa17  80 08		 bra $aa21
$0a:aa19  d8			cld
$0a:aa1a  08			php
$0a:aa1b  d8			cld
$0a:aa1c  80 dc		 bra $a9fa
$0a:aa1e  80 fc		 bra $aa1c
$0a:aa20  84 ec		 sty $ec
$0a:aa22  84 cc		 sty $cc
$0a:aa24  80 8c		 bra $a9b2
$0a:aa26  00 80		 brk #$80
$0a:aa28  69 dd cc	  adc #$ccdd
$0a:aa2b  59 17 cb	  eor $cb17,y
$0a:aa2e  69 f9 49	  adc #$49f9
$0a:aa31  dd 54 c9	  cmp $c954,x
$0a:aa34  1e c3 b6	  asl $b6c3,x
$0a:aa37  77 3e		 adc [$3e],y
$0a:aa39  00 3e		 brk #$3e
$0a:aa3b  00 3c		 brk #$3c
$0a:aa3d  00 06		 brk #$06
$0a:aa3f  00 3e		 brk #$3e
$0a:aa41  00 3e		 brk #$3e
$0a:aa43  00 3c		 brk #$3c
$0a:aa45  00 08		 brk #$08
$0a:aa47  00 10		 brk #$10
$0a:aa49  0e fa 04	  asl $04fa
$0a:aa4c  0e f0 e0	  asl $e0f0
$0a:aa4f  fe 26 d8	  inc $d826,x
$0a:aa52  00 fe		 brk #$fe
$0a:aa54  f0 fe		 beq $aa54
$0a:aa56  96 68		 stx $68,y
$0a:aa58  04 1e		 tsb $1e
$0a:aa5a  04 0e		 tsb $0e
$0a:aa5c  e0 fa		 cpx #$fa
$0a:aa5e  fc fe 00	  jsr ($00fe,x)
$0a:aa61  fe fc fe	  inc $fefc,x
$0a:aa64  fc fe 00	  jsr ($00fe,x)
$0a:aa67  fe 00 fe	  inc $fe00,x
$0a:aa6a  f8			sed
$0a:aa6b  fe 02 fc	  inc $fc02,x
$0a:aa6e  fe 00 1a	  inc $1a00,x
$0a:aa71  04 1a		 tsb $1a
$0a:aa73  04 1a		 tsb $1a
$0a:aa75  04 0e		 tsb $0e
$0a:aa77  00 fc		 brk #$fc
$0a:aa79  fe fc fe	  inc $fefc,x
$0a:aa7c  00 fe		 brk #$fe
$0a:aa7e  00 f0		 brk #$f0
$0a:aa80  00 0e		 brk #$0e
$0a:aa82  00 0e		 brk #$0e
$0a:aa84  00 0e		 brk #$0e
$0a:aa86  00 0c		 brk #$0c
$0a:aa88  2d a4 d2	  and $d2a4
$0a:aa8b  00 35		 brk #$35
$0a:aa8d  90 29		 bcc $aab8
$0a:aa8f  bb			tyx
$0a:aa90  8c 73 ea	  sty $ea73
$0a:aa93  a0 19		 ldy #$19
$0a:aa95  08			php
$0a:aa96  ee 42 db	  inc $db42
$0a:aa99  ff ff ff ef   sbc $efffff,x
$0a:aa9d  ff c4 ff ff   sbc $ffffc4,x
$0a:aaa1  ff 5f ff f7   sbc $f7ff5f,x
$0a:aaa5  ff bd ff 2d   sbc $2dffbd,x
$0a:aaa9  24 d2		 bit $d2
$0a:aaab  80 35		 bra $aae2
$0a:aaad  10 48		 bpl $aaf7
$0a:aaaf  0c 34 cb	  tsb $cb34
$0a:aab2  2a			rol a
$0a:aab3  80 59		 bra $ab0e
$0a:aab5  c8			iny
$0a:aab6  ce 42 db	  dec $db42
$0a:aab9  ff 7f ff ef   sbc $efff7f,x
$0a:aabd  ff f3 ff ff   sbc $fffff3,x
$0a:aac1  ff ff ff b7   sbc $b7ffff,x
$0a:aac5  ff bd ff ff   sbc $ffffbd,x
$0a:aac9  00 ff		 brk #$ff
$0a:aacb  00 ff		 brk #$ff
$0a:aacd  00 ff		 brk #$ff
$0a:aacf  00 ff		 brk #$ff
$0a:aad1  00 ff		 brk #$ff
$0a:aad3  00 ff		 brk #$ff
$0a:aad5  00 ff		 brk #$ff
$0a:aad7  00 00		 brk #$00
$0a:aad9  00 00		 brk #$00
$0a:aadb  00 00		 brk #$00
$0a:aadd  00 00		 brk #$00
$0a:aadf  00 00		 brk #$00
$0a:aae1  00 00		 brk #$00
$0a:aae3  00 00		 brk #$00
$0a:aae5  00 00		 brk #$00
$0a:aae7  00 8b		 brk #$8b
$0a:aae9  21 7c		 and ($7c,x)
$0a:aaeb  48			pha
$0a:aaec  a1 b3		 lda ($b3,x)
$0a:aaee  e7 ac		 sbc [$ac]
$0a:aaf0  9c 95 d4	  stz $d495
$0a:aaf3  f5 7f		 sbc $7f,x
$0a:aaf5  5a			phy
$0a:aaf6  d2 5a		 cmp ($5a)
$0a:aaf8  01 fe		 ora ($fe,x)
$0a:aafa  48			pha
$0a:aafb  b7 a1		 lda [$a1],y
$0a:aafd  5e a4 5b	  lsr $5ba4,x
$0a:ab00  94 6b		 sty $6b,x
$0a:ab02  d4 2b		 pei ($2b)
$0a:ab04  5a			phy
$0a:ab05  a5 52		 lda $52
$0a:ab07  ad de 56	  lda $56de
$0a:ab0a  a7 35		 lda [$35]
$0a:ab0c  39 6d 0e	  and $0e6d,y
$0a:ab0f  4a			lsr a
$0a:ab10  db			stp
$0a:ab11  8a			txa
$0a:ab12  24 34		 bit $34
$0a:ab14  3f 65 55 1f   and $1f5565,x
$0a:ab18  56 a9		 lsr $a9,x
$0a:ab1a  25 da		 and $da
$0a:ab1c  29 d6 0a	  and #$0ad6
$0a:ab1f  f5 8a		 sbc $8a,x
$0a:ab21  75 24		 adc $24,x
$0a:ab23  db			stp
$0a:ab24  25 da		 and $da
$0a:ab26  15 ea		 ora $ea,x
$0a:ab28  a6 fe		 ldx $fe
$0a:ab2a  23 23		 and $23,s
$0a:ab2c  fd 01 f1	  sbc $f101,x
$0a:ab2f  05 dd		 ora $dd
$0a:ab31  01 d9		 ora ($d9,x)
$0a:ab33  25 b1		 and $b1
$0a:ab35  0d f9 05	  ora $05f9
$0a:ab38  01 00		 ora ($00,x)
$0a:ab3a  dc 00 fe	  jml [$fe00]
$0a:ab3d  00 fe		 brk #$fe
$0a:ab3f  00 fe		 brk #$fe
$0a:ab41  00 fe		 brk #$fe
$0a:ab43  00 fe		 brk #$fe
$0a:ab45  00 fe		 brk #$fe
$0a:ab47  00 9a		 brk #$9a
$0a:ab49  fd 73 08	  sbc $0873,x
$0a:ab4c  55 46		 eor $46,x
$0a:ab4e  d7 d2		 cmp [$d2],y
$0a:ab50  29 da df	  and #$dfda
$0a:ab53  34 ff		 bit $ff,x
$0a:ab55  00 ff		 brk #$ff
$0a:ab57  00 00		 brk #$00
$0a:ab59  00 fc		 brk #$fc
$0a:ab5b  00 b8		 brk #$b8
$0a:ab5d  00 2c		 brk #$2c
$0a:ab5f  00 04		 brk #$04
$0a:ab61  00 00		 brk #$00
$0a:ab63  00 00		 brk #$00
$0a:ab65  00 00		 brk #$00
$0a:ab67  00 c4		 brk #$c4
$0a:ab69  7c ed 5c	  jmp ($5ced,x)
$0a:ab6c  8d 7c cc	  sta $cc7c
$0a:ab6f  7c c9 78	  jmp ($78c9,x)
$0a:ab72  a5 5c		 lda $5c
$0a:ab74  cd 3c ad	  cmp $ad3c
$0a:ab77  5c 03 ff 03   jml $03ff03
$0a:ab7b  ff 03 ff 03   sbc $03ff03,x
$0a:ab7f  ff 07 ff 03   sbc $03ff07,x
$0a:ab83  ff 03 ff 03   sbc $03ff03,x
$0a:ab87  ff 9a 63 6a   sbc $6a639a,x
$0a:ab8b  d3 68		 cmp ($68,s),y
$0a:ab8d  d3 6a		 cmp ($6a,s),y
$0a:ab8f  d3 6a		 cmp ($6a,s),y
$0a:ab91  d3 78		 cmp ($78,s),y
$0a:ab93  c3 e8		 cmp $e8,s
$0a:ab95  53 6a		 eor ($6a,s),y
$0a:ab97  d7 fc		 cmp [$fc],y
$0a:ab99  ff fc df fc   sbc $fcdffc,x
$0a:ab9d  df fc df fc   cmp $fcdffc,x
$0a:aba1  df fc df fc   cmp $fcdffc,x
$0a:aba5  df f8 df 7f   cmp $7fdff8,x
$0a:aba9  80 c0		 bra $ab6b
$0a:abab  3f b7 77 c1   and $c177b7,x
$0a:abaf  7f 9e 3e 9e   adc $9e3e9e,x
$0a:abb3  3e 80 3e	  rol $3e80,x
$0a:abb6  c1 7f		 cmp ($7f,x)
$0a:abb8  7f ff c0 ff   adc $ffc0ff,x
$0a:abbc  88			dey
$0a:abbd  ff be ff ff   sbc $ffffbe,x
$0a:abc1  ff ff ff ff   sbc $ffffff,x
$0a:abc5  ff be ff c0   sbc $c0ffbe,x
$0a:abc9  7f e5 65 fc   adc $fc65e5,x
$0a:abcd  02 b9		 cop #$b9
$0a:abcf  3b			tsc
$0a:abd0  c2 7f		 rep #$7f
$0a:abd2  c0 7f 92	  cpy #$927f
$0a:abd5  7f 7f 80 80   adc $80807f,x
$0a:abd9  ff 9a ff fd   sbc $fdff9a,x
$0a:abdd  ff c4 ff bc   sbc $bcffc4,x
$0a:abe1  ff bf ff 80   sbc $80ffbf,x
$0a:abe5  ff 7f ff 7f   sbc $7fff7f,x
$0a:abe9  80 80		 bra $ab6b
$0a:abeb  7f dd 7f 81   adc $817fdd,x
$0a:abef  01 bc		 ora ($bc,x)
$0a:abf1  42 d7		 wdm #$d7
$0a:abf3  28			plp
$0a:abf4  bf 40 bf 40   lda $40bf40,x
$0a:abf8  7f ff be ff   adc $ffbeff,x
$0a:abfc  be ff fe	  ldx $feff,y
$0a:abff  ff bd ff d7   sbc $d7ffbd,x
$0a:ac03  ff bf ff bf   sbc $bfffbf,x
$0a:ac07  ff fb 44 f4   sbc $f444fb,x
$0a:ac0b  4b			phk
$0a:ac0c  e0 5f a9	  cpx #$a95f
$0a:ac0f  2b			pld
$0a:ac10  ca			dex
$0a:ac11  7e c0 7f	  ror $7fc0,x
$0a:ac14  92 7f		 sta ($7f)
$0a:ac16  7f 80 bf ff   adc $ffbf80,x
$0a:ac1a  bf ff bf ff   lda $ffbfff,x
$0a:ac1e  d4 ff		 pei ($ff)
$0a:ac20  bd ff bf	  lda $bfff,x
$0a:ac23  ff 80 ff 7f   sbc $7fff80,x
$0a:ac27  ff d1 d1 4b   sbc $4bd1d1,x
$0a:ac2b  ff d1 f4 22   sbc $22f4d1,x
$0a:ac2f  be 55 c7	  ldx $c755,y
$0a:ac32  ac 63 09	  ldy $0963
$0a:ac35  e8			inx
$0a:ac36  d1 7d		 cmp ($7d),y
$0a:ac38  2e 00 00	  rol $0000
$0a:ac3b  00 0b		 brk #$0b
$0a:ac3d  00 41		 brk #$41
$0a:ac3f  00 38		 brk #$38
$0a:ac41  00 1f		 brk #$1f
$0a:ac43  00 17		 brk #$17
$0a:ac45  00 02		 brk #$02
$0a:ac47  00 8b		 brk #$8b
$0a:ac49  8b			phb
$0a:ac4a  d2 ff		 cmp ($ff)
$0a:ac4c  aa			tax
$0a:ac4d  8e d3 59	  stx $59d3
$0a:ac50  ac e1 cc	  ldy $cce1
$0a:ac53  f7 d6		 sbc [$d6],y
$0a:ac55  17 ba		 ora [$ba],y
$0a:ac57  bb			tyx
$0a:ac58  74 00		 stz $00,x
$0a:ac5a  00 00		 brk #$00
$0a:ac5c  f1 00		 sbc ($00),y
$0a:ac5e  a6 00		 ldx $00
$0a:ac60  1e 00 f8	  asl $f800,x
$0a:ac63  00 e8		 brk #$e8
$0a:ac65  00 44		 brk #$44
$0a:ac67  00 81		 brk #$81
$0a:ac69  7e 53 f3	  ror $f353,x
$0a:ac6c  1c e2 6e	  trb $6ee2
$0a:ac6f  df 38 98 32   cmp $329838,x
$0a:ac73  96 55		 stx $55,y
$0a:ac75  f5 c2		 sbc $c2,x
$0a:ac77  53 c3		 eor ($c3,s),y
$0a:ac79  ff 8c ff 3f   sbc $3fff8c,x
$0a:ac7d  ff 20 ff 67   sbc $67ff20,x
$0a:ac81  ff 69 ff aa   sbc $aaff69,x
$0a:ac85  ff ac ff ff   sbc $ffffac,x
$0a:ac89  7c ca 82	  jmp ($82ca,x)
$0a:ac8c  a5 94		 lda $94
$0a:ac8e  a2 a9 c5	  ldx #$c5a9
$0a:ac91  93 ab		 sta ($ab,s),y
$0a:ac93  a6 d6		 ldx $d6
$0a:ac95  4c ac 19	  jmp $19ac
$0a:ac98  00 7c		 brk #$7c
$0a:ac9a  7d ff 7b	  adc $7bff,x
$0a:ac9d  ff 77 f7 6f   sbc $6ff777,x
$0a:aca1  ef 5f ff 3f   sbc $3fff5f
$0a:aca5  7f 7f 7f 40   adc $407f7f,x
$0a:aca9  60			rts
$0a:acaa  98			tya
$0a:acab  10 44		 bpl $acf1
$0a:acad  f8			sed
$0a:acae  e8			inx
$0a:acaf  0c 94 f8	  tsb $f894
$0a:acb2  cc 10 58	  cpy $5810
$0a:acb5  60			rts
$0a:acb6  f8			sed
$0a:acb7  08			php
$0a:acb8  80 e0		 bra $ac9a
$0a:acba  e0 f8 00	  cpx #$00f8
$0a:acbd  fc f0 fc	  jsr ($fcf0,x)
$0a:acc0  00 fc		 brk #$fc
$0a:acc2  e0 f8 80	  cpx #$80f8
$0a:acc5  f8			sed
$0a:acc6  00 c8		 brk #$c8
$0a:acc8  2a			rol a
$0a:acc9  00 4e		 brk #$4e
$0a:accb  2e 0d ff	  rol $ff0d
$0a:acce  e8			inx
$0a:accf  b8			clv
$0a:acd0  03 d0		 ora $d0,s
$0a:acd2  0e ff ef	  asl $efff
$0a:acd5  b8			clv
$0a:acd6  0e 00 0f	  asl $0f00
$0a:acd9  ff e0 b8 01   sbc $01b8e0,x
$0a:acdd  80 10		 bra $acef
$0a:acdf  ff f1 b8 07   sbc $07b8f1,x
$0a:ace3  00 11		 brk #$11
$0a:ace5  ff e0 b8 06   sbc $06b8e0,x
$0a:ace9  15 12		 ora $12,x
$0a:aceb  ff e0 b8 07   sbc $07b8e0,x
$0a:acef  a8			tay
$0a:acf0  13 ff		 ora ($ff,s),y
$0a:acf2  e0 b8 07	  cpx #$07b8
$0a:acf5  a8			tay
$0a:acf6  18			clc
$0a:acf7  00 00		 brk #$00
$0a:acf9  2f 32 65 7f   and $7f6532
$0a:acfd  98			tya
$0a:acfe  b2 cb		 lda ($cb)
$0a:ad00  e5 fc		 sbc $fc
$0a:ad02  19 32 4c	  ora $4c32,y
$0a:ad05  65 72		 adc $72
$0a:ad07  7f 8c 98 a5   adc $a5988c,x
$0a:ad0b  b2 bf		 lda ($bf)
$0a:ad0d  cb			wai
$0a:ad0e  d8			cld
$0a:ad0f  e5 f2		 sbc $f2
$0a:ad11  fc 89 11	  jsr ($1189,x)
$0a:ad14  00 10		 brk #$10
$0a:ad16  02 10		 cop #$10
$0a:ad18  14 10		 trb $10
$0a:ad1a  24 10		 bit $10
$0a:ad1c  24 10		 bit $10
$0a:ad1e  34 10		 bit $10,x
$0a:ad20  24 10		 bit $10
$0a:ad22  45 10		 eor $10
$0a:ad24  ff 00 02 10   sbc $100200,x
$0a:ad28  00 00		 brk #$00
$0a:ad2a  56 10		 lsr $10,x
$0a:ad2c  7b			tdc
$0a:ad2d  10 ed		 bpl $ad1c
$0a:ad2f  10 45		 bpl $ad76
$0a:ad31  11 ef		 ora ($ef),y
$0a:ad33  11 05		 ora ($05),y
$0a:ad35  12 7f		 ora ($7f)
$0a:ad37  12 0f		 ora ($0f)
$0a:ad39  13 ba		 ora ($ba,s),y
$0a:ad3b  13 e9		 ora ($e9,s),y
$0a:ad3d  13 53		 ora ($53,s),y
$0a:ad3f  14 9f		 trb $9f
$0a:ad41  14 d8		 trb $d8
$0a:ad43  15 09		 ora $09,x
$0a:ad45  16 7f		 asl $7f,x
$0a:ad47  16 09		 asl $09,x
$0a:ad49  17 44		 ora [$44],y
$0a:ad4b  18			clc
$0a:ad4c  7b			tdc
$0a:ad4d  18			clc
$0a:ad4e  e5 18		 sbc $18
$0a:ad50  31 19		 and ($19),y
$0a:ad52  6a			ror a
$0a:ad53  1a			inc a
$0a:ad54  9a			txs
$0a:ad55  1a			inc a
$0a:ad56  10 1b		 bpl $ad73
$0a:ad58  9a			txs
$0a:ad59  1b			tcs
$0a:ad5a  00 d5		 brk #$d5
$0a:ad5c  1c 17 1d	  trb $1d17
$0a:ad5f  81 1d		 sta ($1d,x)
$0a:ad61  cd 1d 06	  cmp $061d
$0a:ad64  1f 4d 1f c3   ora $c31f4d,x
$0a:ad68  1f 4d 20 00   ora $00204d,x
$0a:ad6c  fa			plx
$0a:ad6d  04 ea		 tsb $ea
$0a:ad6f  00 e0		 brk #$e0
$0a:ad71  00 e7		 brk #$e7
$0a:ad73  1a			inc a
$0a:ad74  ed c5 e5	  sbc $e5c5
$0a:ad77  fa			plx
$0a:ad78  e1 0a		 sbc ($0a,x)
$0a:ad7a  f5 80		 sbc $80,x
$0a:ad7c  50 50		 bvc $adce
$0a:ad7e  f7 03		 sbc [$03],y
$0a:ad80  aa			tax
$0a:ad81  00 e3		 brk #$e3
$0a:ad83  24 46		 bit $46
$0a:ad85  40			rti
$0a:ad86  60			rts
$0a:ad87  c9 c9 c9	  cmp #$c9c9
$0a:ad8a  c9 c9 c9	  cmp #$c9c9
$0a:ad8d  c9 c9 00	  cmp #$00c9
$0a:ad90  00 ea		 brk #$ea
$0a:ad92  00 e0		 brk #$e0
$0a:ad94  02 ed		 cop #$ed
$0a:ad96  69 e1 0a	  adc #$0ae1
$0a:ad99  0c c9 0c	  tsb $0cc9
$0a:ad9c  1d a6 c9	  ora $c9a6,x
$0a:ad9f  a6 c9		 ldx $c9
$0a:ada1  a6 06		 ldx $06
$0a:ada3  c9 a6 0c	  cmp #$0ca6
$0a:ada6  c9 a6 c9	  cmp #$c9a6
$0a:ada9  a4 c9		 ldy $c9
$0a:adab  a6 06		 ldx $06
$0a:adad  c9 a4 c9	  cmp #$c9a4
$0a:adb0  a6 0c		 ldx $0c
$0a:adb2  c9 c9 a6	  cmp #$a6c9
$0a:adb5  06 c9		 asl $c9
$0a:adb7  a4 0c		 ldy $0c
$0a:adb9  c9 a6 06	  cmp #$06a6
$0a:adbc  c9 a4 c9	  cmp #$c9a4
$0a:adbf  a9 c9 a6	  lda #$a6c9
$0a:adc2  0c c9 a6	  tsb $a6c9
$0a:adc5  c9 a4 a6	  cmp #$a6a4
$0a:adc8  06 c9		 asl $c9
$0a:adca  a4 c9		 ldy $c9
$0a:adcc  a6 0c		 ldx $0c
$0a:adce  c9 c9 a6	  cmp #$a6c9
$0a:add1  c9 a6 c9	  cmp #$c9a6
$0a:add4  a6 06		 ldx $06
$0a:add6  c9 a6 0c	  cmp #$0ca6
$0a:add9  c9 a6 c9	  cmp #$c9a6
$0a:addc  a4 c9		 ldy $c9
$0a:adde  a6 06		 ldx $06
$0a:ade0  c9 a4 c9	  cmp #$c9a4
$0a:ade3  a6 0c		 ldx $0c
$0a:ade5  c9 c9 a6	  cmp #$a6c9
$0a:ade8  06 c9		 asl $c9
$0a:adea  a4 0c		 ldy $0c
$0a:adec  c9 a6 06	  cmp #$06a6
$0a:adef  c9 a4 c9	  cmp #$c9a4
$0a:adf2  a9 c9 a6	  lda #$a6c9
$0a:adf5  0c c9 a6	  tsb $a6c9
$0a:adf8  c9 a4 a6	  cmp #$a6a4
$0a:adfb  06 c9		 asl $c9
$0a:adfd  a4 c9		 ldy $c9
$0a:adff  a6 0c		 ldx $0c
$0a:ae01  c9 00 ea	  cmp #$ea00
$0a:ae04  f4 e0 01	  pea $01e0
$0a:ae07  ed a5 e1	  sbc $e1a5
$0a:ae0a  0a			asl a
$0a:ae0b  e3 18		 sbc $18,s
$0a:ae0d  46 7f		 lsr $7f
$0a:ae0f  0c 5d 9a	  tsb $9a5d
$0a:ae12  c9 9a c9	  cmp #$c99a
$0a:ae15  9a			txs
$0a:ae16  06 c9		 asl $c9
$0a:ae18  9a			txs
$0a:ae19  0c c9 9a	  tsb $9ac9
$0a:ae1c  c9 9a c9	  cmp #$c99a
$0a:ae1f  9a			txs
$0a:ae20  c9 9a 18	  cmp #$189a
$0a:ae23  c9 0c 9a	  cmp #$9a0c
$0a:ae26  c9 9a c9	  cmp #$c99a
$0a:ae29  c9 9a c9	  cmp #$c99a
$0a:ae2c  9a			txs
$0a:ae2d  9a			txs
$0a:ae2e  c9 9a c9	  cmp #$c99a
$0a:ae31  c9 9a 18	  cmp #$189a
$0a:ae34  c9 0c 9a	  cmp #$9a0c
$0a:ae37  c9 9a c9	  cmp #$c99a
$0a:ae3a  9a			txs
$0a:ae3b  06 c9		 asl $c9
$0a:ae3d  9a			txs
$0a:ae3e  0c c9 9a	  tsb $9ac9
$0a:ae41  c9 9a c9	  cmp #$c99a
$0a:ae44  9a			txs
$0a:ae45  c9 9a 18	  cmp #$189a
$0a:ae48  c9 0c 9a	  cmp #$9a0c
$0a:ae4b  c9 9a c9	  cmp #$c99a
$0a:ae4e  c9 9a c9	  cmp #$c99a
$0a:ae51  9a			txs
$0a:ae52  9a			txs
$0a:ae53  c9 9a c9	  cmp #$c99a
$0a:ae56  c9 9a 18	  cmp #$189a
$0a:ae59  c9 00 e0	  cmp #$e000
$0a:ae5c  03 ea		 ora $ea,s
$0a:ae5e  00 ed		 brk #$ed
$0a:ae60  56 e1		 lsr $e1,x
$0a:ae62  0b			phd
$0a:ae63  60			rts
$0a:ae64  c9 c9 c9	  cmp #$c9c9
$0a:ae67  c9 06 3d	  cmp #$3d06
$0a:ae6a  b2 06		 lda ($06)
$0a:ae6c  3b			tsc
$0a:ae6d  b2 06		 lda ($06)
$0a:ae6f  3d ad 06	  and $06ad,x
$0a:ae72  39 ad 06	  and $06ad,y
$0a:ae75  3d b2 06	  and $06b2,x
$0a:ae78  3b			tsc
$0a:ae79  b2 06		 lda ($06)
$0a:ae7b  3d ad 06	  and $06ad,x
$0a:ae7e  39 ad 06	  and $06ad,y
$0a:ae81  3d b2 06	  and $06b2,x
$0a:ae84  3b			tsc
$0a:ae85  b2 c9		 lda ($c9)
$0a:ae87  06 3d		 asl $3d
$0a:ae89  b2 c9		 lda ($c9)
$0a:ae8b  b2 0c		 lda ($0c)
$0a:ae8d  39 ad 06	  and $06ad,y
$0a:ae90  3d b2 06	  and $06b2,x
$0a:ae93  3b			tsc
$0a:ae94  b2 06		 lda ($06)
$0a:ae96  3d ad 06	  and $06ad,x
$0a:ae99  39 ad 06	  and $06ad,y
$0a:ae9c  3d b2 06	  and $06b2,x
$0a:ae9f  3b			tsc
$0a:aea0  b2 06		 lda ($06)
$0a:aea2  3d ad 06	  and $06ad,x
$0a:aea5  39 ad 06	  and $06ad,y
$0a:aea8  3d b2 06	  and $06b2,x
$0a:aeab  3b			tsc
$0a:aeac  b2 c9		 lda ($c9)
$0a:aeae  06 3d		 asl $3d
$0a:aeb0  b2 c9		 lda ($c9)
$0a:aeb2  b2 0c		 lda ($0c)
$0a:aeb4  39 ad 06	  and $06ad,y
$0a:aeb7  3d b2 06	  and $06b2,x
$0a:aeba  3b			tsc
$0a:aebb  b2 06		 lda ($06)
$0a:aebd  3d ad 06	  and $06ad,x
$0a:aec0  39 ad 06	  and $06ad,y
$0a:aec3  3d b2 06	  and $06b2,x
$0a:aec6  3b			tsc
$0a:aec7  b2 06		 lda ($06)
$0a:aec9  3d ad 06	  and $06ad,x
$0a:aecc  39 ad 06	  and $06ad,y
$0a:aecf  3d b2 06	  and $06b2,x
$0a:aed2  3b			tsc
$0a:aed3  b2 c9		 lda ($c9)
$0a:aed5  06 3d		 asl $3d
$0a:aed7  b2 c9		 lda ($c9)
$0a:aed9  b2 0c		 lda ($0c)
$0a:aedb  39 ad 06	  and $06ad,y
$0a:aede  3d b2 06	  and $06b2,x
$0a:aee1  3b			tsc
$0a:aee2  b2 06		 lda ($06)
$0a:aee4  3d ad 06	  and $06ad,x
$0a:aee7  39 ad 06	  and $06ad,y
$0a:aeea  3d b2 06	  and $06b2,x
$0a:aeed  3b			tsc
$0a:aeee  b2 06		 lda ($06)
$0a:aef0  3d ad 06	  and $06ad,x
$0a:aef3  39 ad 06	  and $06ad,y
$0a:aef6  3d b2 06	  and $06b2,x
$0a:aef9  3b			tsc
$0a:aefa  b2 c9		 lda ($c9)
$0a:aefc  06 3d		 asl $3d
$0a:aefe  b2 c9		 lda ($c9)
$0a:af00  b2 0c		 lda ($0c)
$0a:af02  39 ad 00	  and $00ad,y
$0a:af05  ea			nop
$0a:af06  00 e0		 brk #$e0
$0a:af08  00 ed		 brk #$ed
$0a:af0a  82 e1 08	  brl $b7ee
$0a:af0d  e3 24		 sbc $24,s
$0a:af0f  46 40		 lsr $40
$0a:af11  60			rts
$0a:af12  c9 c9 c9	  cmp #$c9c9
$0a:af15  c9 c9 c9	  cmp #$c9c9
$0a:af18  c9 c9 00	  cmp #$00c9
$0a:af1b  ea			nop
$0a:af1c  00 ed		 brk #$ed
$0a:af1e  be 18 5b	  ldx $5b18,y
$0a:af21  ca			dex
$0a:af22  18			clc
$0a:af23  5d cb 18	  eor $18cb,x
$0a:af26  5b			tcd
$0a:af27  ca			dex
$0a:af28  18			clc
$0a:af29  5d cb 18	  eor $18cb,x
$0a:af2c  5b			tcd
$0a:af2d  ca			dex
$0a:af2e  18			clc
$0a:af2f  5d cb 12	  eor $12cb,x
$0a:af32  5b			tcd
$0a:af33  ca			dex
$0a:af34  06 5d		 asl $5d
$0a:af36  cb			wai
$0a:af37  c9 06 5b	  cmp #$5b06
$0a:af3a  ca			dex
$0a:af3b  0c c9 18	  tsb $18c9
$0a:af3e  ca			dex
$0a:af3f  18			clc
$0a:af40  5d cb 18	  eor $18cb,x
$0a:af43  5b			tcd
$0a:af44  ca			dex
$0a:af45  18			clc
$0a:af46  5d cb 18	  eor $18cb,x
$0a:af49  5b			tcd
$0a:af4a  ca			dex
$0a:af4b  18			clc
$0a:af4c  5d cb 12	  eor $12cb,x
$0a:af4f  5b			tcd
$0a:af50  ca			dex
$0a:af51  06 5d		 asl $5d
$0a:af53  cb			wai
$0a:af54  c9 06 5b	  cmp #$5b06
$0a:af57  ca			dex
$0a:af58  0c c9 18	  tsb $18c9
$0a:af5b  ca			dex
$0a:af5c  18			clc
$0a:af5d  5d cb 18	  eor $18cb,x
$0a:af60  5b			tcd
$0a:af61  ca			dex
$0a:af62  18			clc
$0a:af63  5d cb 18	  eor $18cb,x
$0a:af66  5b			tcd
$0a:af67  ca			dex
$0a:af68  18			clc
$0a:af69  5d cb 12	  eor $12cb,x
$0a:af6c  5b			tcd
$0a:af6d  ca			dex
$0a:af6e  06 5d		 asl $5d
$0a:af70  cb			wai
$0a:af71  c9 06 5b	  cmp #$5b06
$0a:af74  ca			dex
$0a:af75  0c c9 18	  tsb $18c9
$0a:af78  ca			dex
$0a:af79  18			clc
$0a:af7a  5d cb 18	  eor $18cb,x
$0a:af7d  5b			tcd
$0a:af7e  ca			dex
$0a:af7f  18			clc
$0a:af80  5d cb 18	  eor $18cb,x
$0a:af83  5b			tcd
$0a:af84  ca			dex
$0a:af85  18			clc
$0a:af86  5d cb 12	  eor $12cb,x
$0a:af89  5b			tcd
$0a:af8a  ca			dex
$0a:af8b  06 5d		 asl $5d
$0a:af8d  cb			wai
$0a:af8e  c9 06 5b	  cmp #$5b06
$0a:af91  ca			dex
$0a:af92  0c c9 00	  tsb $00c9
$0a:af95  ea			nop
$0a:af96  fc ed 8c	  jsr ($8ced,x)
$0a:af99  e1 0b		 sbc ($0b,x)
$0a:af9b  0c c9 0c	  tsb $0cc9
$0a:af9e  5d cc c9	  eor $c9cc,x
$0a:afa1  0c 5b cc	  tsb $cc5b
$0a:afa4  c9 0c 5d	  cmp #$5d0c
$0a:afa7  cc c9 0c	  cpy $0cc9
$0a:afaa  59 cc c9	  eor $c9cc,y
$0a:afad  0c 5d cc	  tsb $cc5d
$0a:afb0  c9 0c 5b	  cmp #$5b0c
$0a:afb3  cc c9 0c	  cpy $0cc9
$0a:afb6  5d cc 0c	  eor $0ccc,x
$0a:afb9  5b			tcd
$0a:afba  cc 0c 59	  cpy $590c
$0a:afbd  cc c9 0c	  cpy $0cc9
$0a:afc0  5d cc c9	  eor $c9cc,x
$0a:afc3  0c 5b cc	  tsb $cc5b
$0a:afc6  c9 0c 5d	  cmp #$5d0c
$0a:afc9  cc c9 0c	  cpy $0cc9
$0a:afcc  59 cc c9	  eor $c9cc,y
$0a:afcf  0c 5d cc	  tsb $cc5d
$0a:afd2  c9 0c 5b	  cmp #$5b0c
$0a:afd5  cc c9 0c	  cpy $0cc9
$0a:afd8  5d cc 0c	  eor $0ccc,x
$0a:afdb  5b			tcd
$0a:afdc  cc 0c 59	  cpy $590c
$0a:afdf  cc c9 0c	  cpy $0cc9
$0a:afe2  5d cc c9	  eor $c9cc,x
$0a:afe5  0c 5b cc	  tsb $cc5b
$0a:afe8  c9 0c 5d	  cmp #$5d0c
$0a:afeb  cc c9 0c	  cpy $0cc9
$0a:afee  59 cc c9	  eor $c9cc,y
$0a:aff1  0c 5d cc	  tsb $cc5d
$0a:aff4  c9 0c 5b	  cmp #$5b0c
$0a:aff7  cc c9 0c	  cpy $0cc9
$0a:affa  5d cc 0c	  eor $0ccc,x
$0a:affd  5b			tcd
$0a:affe  cc 0c 59	  cpy $590c
$0a:b001  cc c9 0c	  cpy $0cc9
$0a:b004  5d cc c9	  eor $c9cc,x
$0a:b007  0c 5b cc	  tsb $cc5b
$0a:b00a  c9 0c 5d	  cmp #$5d0c
$0a:b00d  cc c9 0c	  cpy $0cc9
$0a:b010  59 cc c9	  eor $c9cc,y
$0a:b013  0c 5d cc	  tsb $cc5d
$0a:b016  c9 0c 5b	  cmp #$5b0c
$0a:b019  cc c9 0c	  cpy $0cc9
$0a:b01c  5d cc 0c	  eor $0ccc,x
$0a:b01f  5b			tcd
$0a:b020  cc 0c 59	  cpy $590c
$0a:b023  cc 00 e0	  cpy $e000
$0a:b026  03 ea		 ora $ea,s
$0a:b028  00 ed		 brk #$ed
$0a:b02a  3c e1 08	  bit $08e1,x
$0a:b02d  66 c9		 ror $c9
$0a:b02f  60			rts
$0a:b030  c9 c9 c9	  cmp #$c9c9
$0a:b033  06 3d		 asl $3d
$0a:b035  b2 06		 lda ($06)
$0a:b037  3b			tsc
$0a:b038  b2 06		 lda ($06)
$0a:b03a  3d ad 06	  and $06ad,x
$0a:b03d  39 ad 06	  and $06ad,y
$0a:b040  3d b2 06	  and $06b2,x
$0a:b043  3b			tsc
$0a:b044  b2 06		 lda ($06)
$0a:b046  3d ad 06	  and $06ad,x
$0a:b049  39 ad 06	  and $06ad,y
$0a:b04c  3d b2 06	  and $06b2,x
$0a:b04f  3b			tsc
$0a:b050  b2 c9		 lda ($c9)
$0a:b052  06 3d		 asl $3d
$0a:b054  b2 c9		 lda ($c9)
$0a:b056  b2 0c		 lda ($0c)
$0a:b058  39 ad 06	  and $06ad,y
$0a:b05b  3d b2 06	  and $06b2,x
$0a:b05e  3b			tsc
$0a:b05f  b2 06		 lda ($06)
$0a:b061  3d ad 06	  and $06ad,x
$0a:b064  39 ad 06	  and $06ad,y
$0a:b067  3d b2 06	  and $06b2,x
$0a:b06a  3b			tsc
$0a:b06b  b2 06		 lda ($06)
$0a:b06d  3d ad 06	  and $06ad,x
$0a:b070  39 ad 06	  and $06ad,y
$0a:b073  3d b2 06	  and $06b2,x
$0a:b076  3b			tsc
$0a:b077  b2 c9		 lda ($c9)
$0a:b079  06 3d		 asl $3d
$0a:b07b  b2 c9		 lda ($c9)
$0a:b07d  b2 0c		 lda ($0c)
$0a:b07f  39 ad 06	  and $06ad,y
$0a:b082  3d b2 06	  and $06b2,x
$0a:b085  3b			tsc
$0a:b086  b2 06		 lda ($06)
$0a:b088  3d ad 06	  and $06ad,x
$0a:b08b  39 ad 06	  and $06ad,y
$0a:b08e  3d b2 06	  and $06b2,x
$0a:b091  3b			tsc
$0a:b092  b2 06		 lda ($06)
$0a:b094  3d ad 06	  and $06ad,x
$0a:b097  39 ad 06	  and $06ad,y
$0a:b09a  3d b2 06	  and $06b2,x
$0a:b09d  3b			tsc
$0a:b09e  b2 c9		 lda ($c9)
$0a:b0a0  06 3d		 asl $3d
$0a:b0a2  b2 c9		 lda ($c9)
$0a:b0a4  b2 0c		 lda ($0c)
$0a:b0a6  39 ad 06	  and $06ad,y
$0a:b0a9  3d b2 06	  and $06b2,x
$0a:b0ac  3b			tsc
$0a:b0ad  b2 06		 lda ($06)
$0a:b0af  3d ad 06	  and $06ad,x
$0a:b0b2  39 ad 06	  and $06ad,y
$0a:b0b5  3d b2 06	  and $06b2,x
$0a:b0b8  3b			tsc
$0a:b0b9  b2 06		 lda ($06)
$0a:b0bb  3d ad 06	  and $06ad,x
$0a:b0be  39 ad 06	  and $06ad,y
$0a:b0c1  3d b2 06	  and $06b2,x
$0a:b0c4  3b			tsc
$0a:b0c5  b2 c9		 lda ($c9)
$0a:b0c7  06 3d		 asl $3d
$0a:b0c9  b2 c9		 lda ($c9)
$0a:b0cb  b2 06		 lda ($06)
$0a:b0cd  39 ad 00	  and $00ad,y
$0a:b0d0  30 5d		 bmi $b12f
$0a:b0d2  b9 0c c8	  lda $c80c,y
$0a:b0d5  06 b7		 asl $b7
$0a:b0d7  b5 b7		 lda $b7,x
$0a:b0d9  b5 b4		 lda $b4,x
$0a:b0db  b5 b4		 lda $b4,x
$0a:b0dd  b2 c9		 lda ($c9)
$0a:b0df  b0 c9		 bcs $b0aa
$0a:b0e1  12 ad		 ora ($ad)
$0a:b0e3  30 c8		 bmi $b0ad
$0a:b0e5  b9 0c c8	  lda $c80c,y
$0a:b0e8  06 b7		 asl $b7
$0a:b0ea  b5 b7		 lda $b7,x
$0a:b0ec  b5 b4		 lda $b4,x
$0a:b0ee  b5 b4		 lda $b4,x
$0a:b0f0  b2 c9		 lda ($c9)
$0a:b0f2  b0 c9		 bcs $b0bd
$0a:b0f4  12 b2		 ora ($b2)
$0a:b0f6  30 c8		 bmi $b0c0
$0a:b0f8  60			rts
$0a:b0f9  c9 c9 c9	  cmp #$c9c9
$0a:b0fc  c9 00 00	  cmp #$0000
$0a:b0ff  0c c9 0c	  tsb $0cc9
$0a:b102  1d a6 c9	  ora $c9a6,x
$0a:b105  a6 c9		 ldx $c9
$0a:b107  a6 06		 ldx $06
$0a:b109  c9 a6 0c	  cmp #$0ca6
$0a:b10c  c9 a6 c9	  cmp #$c9a6
$0a:b10f  a4 c9		 ldy $c9
$0a:b111  a6 06		 ldx $06
$0a:b113  c9 a4 c9	  cmp #$c9a4
$0a:b116  a6 0c		 ldx $0c
$0a:b118  c9 c9 a6	  cmp #$a6c9
$0a:b11b  06 c9		 asl $c9
$0a:b11d  a4 0c		 ldy $0c
$0a:b11f  c9 a6 06	  cmp #$06a6
$0a:b122  c9 a4 c9	  cmp #$c9a4
$0a:b125  a9 c9 a6	  lda #$a6c9
$0a:b128  0c c9 a6	  tsb $a6c9
$0a:b12b  c9 a4 a6	  cmp #$a6a4
$0a:b12e  06 c9		 asl $c9
$0a:b130  a4 c9		 ldy $c9
$0a:b132  a6 0c		 ldx $0c
$0a:b134  c9 c9 a6	  cmp #$a6c9
$0a:b137  c9 a6 c9	  cmp #$c9a6
$0a:b13a  a6 06		 ldx $06
$0a:b13c  c9 a6 0c	  cmp #$0ca6
$0a:b13f  c9 a6 c9	  cmp #$c9a6
$0a:b142  a4 c9		 ldy $c9
$0a:b144  a6 06		 ldx $06
$0a:b146  c9 a4 c9	  cmp #$c9a4
$0a:b149  a6 0c		 ldx $0c
$0a:b14b  c9 c9 a6	  cmp #$a6c9
$0a:b14e  06 c9		 asl $c9
$0a:b150  a4 0c		 ldy $0c
$0a:b152  c9 a6 06	  cmp #$06a6
$0a:b155  c9 a4 c9	  cmp #$c9a4
$0a:b158  a9 c9 a6	  lda #$a6c9
$0a:b15b  0c c9 a6	  tsb $a6c9
$0a:b15e  c9 a4 a6	  cmp #$a6a4
$0a:b161  06 c9		 asl $c9
$0a:b163  a4 c9		 ldy $c9
$0a:b165  a6 0c		 ldx $0c
$0a:b167  c9 00 0c	  cmp #$0c00
$0a:b16a  5d 9a c9	  eor $c99a,x
$0a:b16d  9a			txs
$0a:b16e  c9 9a 06	  cmp #$069a
$0a:b171  c9 9a 0c	  cmp #$0c9a
$0a:b174  c9 9a c9	  cmp #$c99a
$0a:b177  9a			txs
$0a:b178  c9 9a c9	  cmp #$c99a
$0a:b17b  9a			txs
$0a:b17c  18			clc
$0a:b17d  c9 0c 9a	  cmp #$9a0c
$0a:b180  c9 9a c9	  cmp #$c99a
$0a:b183  c9 9a c9	  cmp #$c99a
$0a:b186  9a			txs
$0a:b187  9a			txs
$0a:b188  c9 9a c9	  cmp #$c99a
$0a:b18b  c9 9a 18	  cmp #$189a
$0a:b18e  c9 0c 9a	  cmp #$9a0c
$0a:b191  c9 9a c9	  cmp #$c99a
$0a:b194  9a			txs
$0a:b195  06 c9		 asl $c9
$0a:b197  9a			txs
$0a:b198  0c c9 9a	  tsb $9ac9
$0a:b19b  c9 9a c9	  cmp #$c99a
$0a:b19e  9a			txs
$0a:b19f  c9 9a 18	  cmp #$189a
$0a:b1a2  c9 0c 9a	  cmp #$9a0c
$0a:b1a5  c9 9a c9	  cmp #$c99a
$0a:b1a8  c9 9a c9	  cmp #$c99a
$0a:b1ab  9a			txs
$0a:b1ac  9a			txs
$0a:b1ad  c9 9a c9	  cmp #$c99a
$0a:b1b0  c9 9a 18	  cmp #$189a
$0a:b1b3  c9 00 06	  cmp #$0600
$0a:b1b6  3d b2 06	  and $06b2,x
$0a:b1b9  3b			tsc
$0a:b1ba  b2 06		 lda ($06)
$0a:b1bc  3d ad 06	  and $06ad,x
$0a:b1bf  39 ad 06	  and $06ad,y
$0a:b1c2  3d b2 06	  and $06b2,x
$0a:b1c5  3b			tsc
$0a:b1c6  b2 06		 lda ($06)
$0a:b1c8  3d ad 06	  and $06ad,x
$0a:b1cb  39 ad 06	  and $06ad,y
$0a:b1ce  3d b2 06	  and $06b2,x
$0a:b1d1  3b			tsc
$0a:b1d2  b2 c9		 lda ($c9)
$0a:b1d4  06 3d		 asl $3d
$0a:b1d6  b2 c9		 lda ($c9)
$0a:b1d8  b2 0c		 lda ($0c)
$0a:b1da  39 ad 06	  and $06ad,y
$0a:b1dd  3d b2 06	  and $06b2,x
$0a:b1e0  3b			tsc
$0a:b1e1  b2 06		 lda ($06)
$0a:b1e3  3d ad 06	  and $06ad,x
$0a:b1e6  39 ad 06	  and $06ad,y
$0a:b1e9  3d b2 06	  and $06b2,x
$0a:b1ec  3b			tsc
$0a:b1ed  b2 06		 lda ($06)
$0a:b1ef  3d ad 06	  and $06ad,x
$0a:b1f2  39 ad 06	  and $06ad,y
$0a:b1f5  3d b2 06	  and $06b2,x
$0a:b1f8  3b			tsc
$0a:b1f9  b2 c9		 lda ($c9)
$0a:b1fb  06 3d		 asl $3d
$0a:b1fd  b2 c9		 lda ($c9)
$0a:b1ff  b2 0c		 lda ($0c)
$0a:b201  39 ad 06	  and $06ad,y
$0a:b204  3d b2 06	  and $06b2,x
$0a:b207  3b			tsc
$0a:b208  b2 06		 lda ($06)
$0a:b20a  3d ad 06	  and $06ad,x
$0a:b20d  39 ad 06	  and $06ad,y
$0a:b210  3d b2 06	  and $06b2,x
$0a:b213  3b			tsc
$0a:b214  b2 06		 lda ($06)
$0a:b216  3d ad 06	  and $06ad,x
$0a:b219  39 ad 06	  and $06ad,y
$0a:b21c  3d b2 06	  and $06b2,x
$0a:b21f  3b			tsc
$0a:b220  b2 c9		 lda ($c9)
$0a:b222  06 3d		 asl $3d
$0a:b224  b2 c9		 lda ($c9)
$0a:b226  b2 0c		 lda ($0c)
$0a:b228  39 ad 06	  and $06ad,y
$0a:b22b  3d b2 06	  and $06b2,x
$0a:b22e  3b			tsc
$0a:b22f  b2 06		 lda ($06)
$0a:b231  3d ad 06	  and $06ad,x
$0a:b234  39 ad 06	  and $06ad,y
$0a:b237  3d b2 06	  and $06b2,x
$0a:b23a  3b			tsc
$0a:b23b  b2 06		 lda ($06)
$0a:b23d  3d ad 06	  and $06ad,x
$0a:b240  39 ad 06	  and $06ad,y
$0a:b243  3d b2 06	  and $06b2,x
$0a:b246  3b			tsc
$0a:b247  b2 c9		 lda ($c9)
$0a:b249  06 3d		 asl $3d
$0a:b24b  b2 c9		 lda ($c9)
$0a:b24d  b2 0c		 lda ($0c)
$0a:b24f  39 ad 06	  and $06ad,y
$0a:b252  3d b2 06	  and $06b2,x
$0a:b255  3b			tsc
$0a:b256  b2 06		 lda ($06)
$0a:b258  3d ad 06	  and $06ad,x
$0a:b25b  39 ad 06	  and $06ad,y
$0a:b25e  3d b2 06	  and $06b2,x
$0a:b261  3b			tsc
$0a:b262  b2 06		 lda ($06)
$0a:b264  3d ad 06	  and $06ad,x
$0a:b267  39 ad 06	  and $06ad,y
$0a:b26a  3d b2 06	  and $06b2,x
$0a:b26d  3b			tsc
$0a:b26e  b2 c9		 lda ($c9)
$0a:b270  06 3d		 asl $3d
$0a:b272  b2 c9		 lda ($c9)
$0a:b274  b2 0c		 lda ($0c)
$0a:b276  39 ad 06	  and $06ad,y
$0a:b279  3d b2 06	  and $06b2,x
$0a:b27c  3b			tsc
$0a:b27d  b2 06		 lda ($06)
$0a:b27f  3d ad 06	  and $06ad,x
$0a:b282  39 ad 06	  and $06ad,y
$0a:b285  3d b2 06	  and $06b2,x
$0a:b288  3b			tsc
$0a:b289  b2 06		 lda ($06)
$0a:b28b  3d ad 06	  and $06ad,x
$0a:b28e  39 ad 06	  and $06ad,y
$0a:b291  3d b2 06	  and $06b2,x
$0a:b294  3b			tsc
$0a:b295  b2 c9		 lda ($c9)
$0a:b297  06 3d		 asl $3d
$0a:b299  b2 c9		 lda ($c9)
$0a:b29b  b2 0c		 lda ($0c)
$0a:b29d  39 ad 06	  and $06ad,y
$0a:b2a0  3d b2 06	  and $06b2,x
$0a:b2a3  3b			tsc
$0a:b2a4  b2 06		 lda ($06)
$0a:b2a6  3d ad 06	  and $06ad,x
$0a:b2a9  39 ad 06	  and $06ad,y
$0a:b2ac  3d b2 06	  and $06b2,x
$0a:b2af  3b			tsc
$0a:b2b0  b2 06		 lda ($06)
$0a:b2b2  3d ad 06	  and $06ad,x
$0a:b2b5  39 ad 06	  and $06ad,y
$0a:b2b8  3d b2 06	  and $06b2,x
$0a:b2bb  3b			tsc
$0a:b2bc  b2 c9		 lda ($c9)
$0a:b2be  06 3d		 asl $3d
$0a:b2c0  b2 c9		 lda ($c9)
$0a:b2c2  b2 0c		 lda ($0c)
$0a:b2c4  39 ad 06	  and $06ad,y
$0a:b2c7  3d b2 06	  and $06b2,x
$0a:b2ca  3b			tsc
$0a:b2cb  b2 06		 lda ($06)
$0a:b2cd  3d ad 06	  and $06ad,x
$0a:b2d0  39 ad 06	  and $06ad,y
$0a:b2d3  3d b2 06	  and $06b2,x
$0a:b2d6  3b			tsc
$0a:b2d7  b2 06		 lda ($06)
$0a:b2d9  3d ad 06	  and $06ad,x
$0a:b2dc  39 ad 06	  and $06ad,y
$0a:b2df  3d b2 06	  and $06b2,x
$0a:b2e2  3b			tsc
$0a:b2e3  b2 c9		 lda ($c9)
$0a:b2e5  06 3d		 asl $3d
$0a:b2e7  b2 c9		 lda ($c9)
$0a:b2e9  b2 0c		 lda ($0c)
$0a:b2eb  39 ad 00	  and $00ad,y
$0a:b2ee  0c c9 30	  tsb $30c9
$0a:b2f1  5d b9 0c	  eor $0cb9,x
$0a:b2f4  c8			iny
$0a:b2f5  06 b7		 asl $b7
$0a:b2f7  b5 b7		 lda $b7,x
$0a:b2f9  b5 b4		 lda $b4,x
$0a:b2fb  b5 b4		 lda $b4,x
$0a:b2fd  b2 c9		 lda ($c9)
$0a:b2ff  b0 c9		 bcs $b2ca
$0a:b301  12 ad		 ora ($ad)
$0a:b303  30 c8		 bmi $b2cd
$0a:b305  b9 0c c8	  lda $c80c,y
$0a:b308  06 b7		 asl $b7
$0a:b30a  b5 b7		 lda $b7,x
$0a:b30c  b5 b4		 lda $b4,x
$0a:b30e  b5 b4		 lda $b4,x
$0a:b310  b2 c9		 lda ($c9)
$0a:b312  b0 c9		 bcs $b2dd
$0a:b314  12 b2		 ora ($b2)
$0a:b316  30 c8		 bmi $b2e0
$0a:b318  60			rts
$0a:b319  c9 c9 c9	  cmp #$c9c9
$0a:b31c  54 c9 00	  mvn $00,$c9
$0a:b31f  18			clc
$0a:b320  5b			tcd
$0a:b321  ca			dex
$0a:b322  18			clc
$0a:b323  5d cb 18	  eor $18cb,x
$0a:b326  5b			tcd
$0a:b327  ca			dex
$0a:b328  18			clc
$0a:b329  5d cb 18	  eor $18cb,x
$0a:b32c  5b			tcd
$0a:b32d  ca			dex
$0a:b32e  18			clc
$0a:b32f  5d cb 12	  eor $12cb,x
$0a:b332  5b			tcd
$0a:b333  ca			dex
$0a:b334  06 5d		 asl $5d
$0a:b336  cb			wai
$0a:b337  c9 06 5b	  cmp #$5b06
$0a:b33a  ca			dex
$0a:b33b  0c c9 18	  tsb $18c9
$0a:b33e  ca			dex
$0a:b33f  18			clc
$0a:b340  5d cb 18	  eor $18cb,x
$0a:b343  5b			tcd
$0a:b344  ca			dex
$0a:b345  18			clc
$0a:b346  5d cb 18	  eor $18cb,x
$0a:b349  5b			tcd
$0a:b34a  ca			dex
$0a:b34b  18			clc
$0a:b34c  5d cb 12	  eor $12cb,x
$0a:b34f  5b			tcd
$0a:b350  ca			dex
$0a:b351  06 5d		 asl $5d
$0a:b353  cb			wai
$0a:b354  c9 06 5b	  cmp #$5b06
$0a:b357  ca			dex
$0a:b358  0c c9 18	  tsb $18c9
$0a:b35b  ca			dex
$0a:b35c  18			clc
$0a:b35d  5d cb 18	  eor $18cb,x
$0a:b360  5b			tcd
$0a:b361  ca			dex
$0a:b362  18			clc
$0a:b363  5d cb 18	  eor $18cb,x
$0a:b366  5b			tcd
$0a:b367  ca			dex
$0a:b368  18			clc
$0a:b369  5d cb 12	  eor $12cb,x
$0a:b36c  5b			tcd
$0a:b36d  ca			dex
$0a:b36e  06 5d		 asl $5d
$0a:b370  cb			wai
$0a:b371  c9 06 5b	  cmp #$5b06
$0a:b374  ca			dex
$0a:b375  0c c9 18	  tsb $18c9
$0a:b378  ca			dex
$0a:b379  18			clc
$0a:b37a  5d cb 18	  eor $18cb,x
$0a:b37d  5b			tcd
$0a:b37e  ca			dex
$0a:b37f  18			clc
$0a:b380  5d cb 18	  eor $18cb,x
$0a:b383  5b			tcd
$0a:b384  ca			dex
$0a:b385  18			clc
$0a:b386  5d cb 12	  eor $12cb,x
$0a:b389  5b			tcd
$0a:b38a  ca			dex
$0a:b38b  06 5d		 asl $5d
$0a:b38d  cb			wai
$0a:b38e  c9 06 5b	  cmp #$5b06
$0a:b391  ca			dex
$0a:b392  0c c9 00	  tsb $00c9
$0a:b395  0c c9 0c	  tsb $0cc9
$0a:b398  5d cc c9	  eor $c9cc,x
$0a:b39b  0c 5b cc	  tsb $cc5b
$0a:b39e  c9 0c 5d	  cmp #$5d0c
$0a:b3a1  cc c9 0c	  cpy $0cc9
$0a:b3a4  59 cc c9	  eor $c9cc,y
$0a:b3a7  0c 5d cc	  tsb $cc5d
$0a:b3aa  c9 0c 5b	  cmp #$5b0c
$0a:b3ad  cc c9 0c	  cpy $0cc9
$0a:b3b0  5d cc 0c	  eor $0ccc,x
$0a:b3b3  5b			tcd
$0a:b3b4  cc 0c 59	  cpy $590c
$0a:b3b7  cc c9 0c	  cpy $0cc9
$0a:b3ba  5d cc c9	  eor $c9cc,x
$0a:b3bd  0c 5b cc	  tsb $cc5b
$0a:b3c0  c9 0c 5d	  cmp #$5d0c
$0a:b3c3  cc c9 0c	  cpy $0cc9
$0a:b3c6  59 cc c9	  eor $c9cc,y
$0a:b3c9  0c 5d cc	  tsb $cc5d
$0a:b3cc  c9 0c 5b	  cmp #$5b0c
$0a:b3cf  cc c9 0c	  cpy $0cc9
$0a:b3d2  5d cc 0c	  eor $0ccc,x
$0a:b3d5  5b			tcd
$0a:b3d6  cc 0c 59	  cpy $590c
$0a:b3d9  cc c9 0c	  cpy $0cc9
$0a:b3dc  5d cc c9	  eor $c9cc,x
$0a:b3df  0c 5b cc	  tsb $cc5b
$0a:b3e2  c9 0c 5d	  cmp #$5d0c
$0a:b3e5  cc c9 0c	  cpy $0cc9
$0a:b3e8  59 cc c9	  eor $c9cc,y
$0a:b3eb  0c 5d cc	  tsb $cc5d
$0a:b3ee  c9 0c 5b	  cmp #$5b0c
$0a:b3f1  cc c9 0c	  cpy $0cc9
$0a:b3f4  5d cc 0c	  eor $0ccc,x
$0a:b3f7  5b			tcd
$0a:b3f8  cc 0c 59	  cpy $590c
$0a:b3fb  cc c9 0c	  cpy $0cc9
$0a:b3fe  5d cc c9	  eor $c9cc,x
$0a:b401  0c 5b cc	  tsb $cc5b
$0a:b404  c9 0c 5d	  cmp #$5d0c
$0a:b407  cc c9 0c	  cpy $0cc9
$0a:b40a  59 cc c9	  eor $c9cc,y
$0a:b40d  0c 5d cc	  tsb $cc5d
$0a:b410  c9 0c 5b	  cmp #$5b0c
$0a:b413  cc c9 0c	  cpy $0cc9
$0a:b416  5d cc 0c	  eor $0ccc,x
$0a:b419  5b			tcd
$0a:b41a  cc 0c 59	  cpy $590c
$0a:b41d  cc 00 06	  cpy $0600
$0a:b420  c9 06 3d	  cmp #$3d06
$0a:b423  b2 06		 lda ($06)
$0a:b425  3b			tsc
$0a:b426  b2 06		 lda ($06)
$0a:b428  3d ad 06	  and $06ad,x
$0a:b42b  39 ad 06	  and $06ad,y
$0a:b42e  3d b2 06	  and $06b2,x
$0a:b431  3b			tsc
$0a:b432  b2 06		 lda ($06)
$0a:b434  3d ad 06	  and $06ad,x
$0a:b437  39 ad 06	  and $06ad,y
$0a:b43a  3d b2 06	  and $06b2,x
$0a:b43d  3b			tsc
$0a:b43e  b2 c9		 lda ($c9)
$0a:b440  06 3d		 asl $3d
$0a:b442  b2 c9		 lda ($c9)
$0a:b444  b2 0c		 lda ($0c)
$0a:b446  39 ad 06	  and $06ad,y
$0a:b449  3d b2 06	  and $06b2,x
$0a:b44c  3b			tsc
$0a:b44d  b2 06		 lda ($06)
$0a:b44f  3d ad 06	  and $06ad,x
$0a:b452  39 ad 06	  and $06ad,y
$0a:b455  3d b2 06	  and $06b2,x
$0a:b458  3b			tsc
$0a:b459  b2 06		 lda ($06)
$0a:b45b  3d ad 06	  and $06ad,x
$0a:b45e  39 ad 06	  and $06ad,y
$0a:b461  3d b2 06	  and $06b2,x
$0a:b464  3b			tsc
$0a:b465  b2 c9		 lda ($c9)
$0a:b467  06 3d		 asl $3d
$0a:b469  b2 c9		 lda ($c9)
$0a:b46b  b2 0c		 lda ($0c)
$0a:b46d  39 ad 06	  and $06ad,y
$0a:b470  3d b2 06	  and $06b2,x
$0a:b473  3b			tsc
$0a:b474  b2 06		 lda ($06)
$0a:b476  3d ad 06	  and $06ad,x
$0a:b479  39 ad 06	  and $06ad,y
$0a:b47c  3d b2 06	  and $06b2,x
$0a:b47f  3b			tsc
$0a:b480  b2 06		 lda ($06)
$0a:b482  3d ad 06	  and $06ad,x
$0a:b485  39 ad 06	  and $06ad,y
$0a:b488  3d b2 06	  and $06b2,x
$0a:b48b  3b			tsc
$0a:b48c  b2 c9		 lda ($c9)
$0a:b48e  06 3d		 asl $3d
$0a:b490  b2 c9		 lda ($c9)
$0a:b492  b2 0c		 lda ($0c)
$0a:b494  39 ad 06	  and $06ad,y
$0a:b497  3d b2 06	  and $06b2,x
$0a:b49a  3b			tsc
$0a:b49b  b2 06		 lda ($06)
$0a:b49d  3d ad 06	  and $06ad,x
$0a:b4a0  39 ad 06	  and $06ad,y
$0a:b4a3  3d b2 06	  and $06b2,x
$0a:b4a6  3b			tsc
$0a:b4a7  b2 06		 lda ($06)
$0a:b4a9  3d ad 06	  and $06ad,x
$0a:b4ac  39 ad 06	  and $06ad,y
$0a:b4af  3d b2 06	  and $06b2,x
$0a:b4b2  3b			tsc
$0a:b4b3  b2 c9		 lda ($c9)
$0a:b4b5  06 3d		 asl $3d
$0a:b4b7  b2 c9		 lda ($c9)
$0a:b4b9  b2 0c		 lda ($0c)
$0a:b4bb  39 ad 06	  and $06ad,y
$0a:b4be  3d b2 06	  and $06b2,x
$0a:b4c1  3b			tsc
$0a:b4c2  b2 06		 lda ($06)
$0a:b4c4  3d ad 06	  and $06ad,x
$0a:b4c7  39 ad 06	  and $06ad,y
$0a:b4ca  3d b2 06	  and $06b2,x
$0a:b4cd  3b			tsc
$0a:b4ce  b2 06		 lda ($06)
$0a:b4d0  3d ad 06	  and $06ad,x
$0a:b4d3  39 ad 06	  and $06ad,y
$0a:b4d6  3d b2 06	  and $06b2,x
$0a:b4d9  3b			tsc
$0a:b4da  b2 c9		 lda ($c9)
$0a:b4dc  06 3d		 asl $3d
$0a:b4de  b2 c9		 lda ($c9)
$0a:b4e0  b2 0c		 lda ($0c)
$0a:b4e2  39 ad 06	  and $06ad,y
$0a:b4e5  3d b2 06	  and $06b2,x
$0a:b4e8  3b			tsc
$0a:b4e9  b2 06		 lda ($06)
$0a:b4eb  3d ad 06	  and $06ad,x
$0a:b4ee  39 ad 06	  and $06ad,y
$0a:b4f1  3d b2 06	  and $06b2,x
$0a:b4f4  3b			tsc
$0a:b4f5  b2 06		 lda ($06)
$0a:b4f7  3d ad 06	  and $06ad,x
$0a:b4fa  39 ad 06	  and $06ad,y
$0a:b4fd  3d b2 06	  and $06b2,x
$0a:b500  3b			tsc
$0a:b501  b2 c9		 lda ($c9)
$0a:b503  06 3d		 asl $3d
$0a:b505  b2 c9		 lda ($c9)
$0a:b507  b2 0c		 lda ($0c)
$0a:b509  39 ad 06	  and $06ad,y
$0a:b50c  3d b2 06	  and $06b2,x
$0a:b50f  3b			tsc
$0a:b510  b2 06		 lda ($06)
$0a:b512  3d ad 06	  and $06ad,x
$0a:b515  39 ad 06	  and $06ad,y
$0a:b518  3d b2 06	  and $06b2,x
$0a:b51b  3b			tsc
$0a:b51c  b2 06		 lda ($06)
$0a:b51e  3d ad 06	  and $06ad,x
$0a:b521  39 ad 06	  and $06ad,y
$0a:b524  3d b2 06	  and $06b2,x
$0a:b527  3b			tsc
$0a:b528  b2 c9		 lda ($c9)
$0a:b52a  06 3d		 asl $3d
$0a:b52c  b2 c9		 lda ($c9)
$0a:b52e  b2 0c		 lda ($0c)
$0a:b530  39 ad 06	  and $06ad,y
$0a:b533  3d b2 06	  and $06b2,x
$0a:b536  3b			tsc
$0a:b537  b2 06		 lda ($06)
$0a:b539  3d ad 06	  and $06ad,x
$0a:b53c  39 ad 06	  and $06ad,y
$0a:b53f  3d b2 06	  and $06b2,x
$0a:b542  3b			tsc
$0a:b543  b2 06		 lda ($06)
$0a:b545  3d ad 06	  and $06ad,x
$0a:b548  39 ad 06	  and $06ad,y
$0a:b54b  3d b2 06	  and $06b2,x
$0a:b54e  3b			tsc
$0a:b54f  b2 c9		 lda ($c9)
$0a:b551  06 3d		 asl $3d
$0a:b553  b2 c9		 lda ($c9)
$0a:b555  b2 06		 lda ($06)
$0a:b557  39 ad 00	  and $00ad,y
$0a:b55a  0c c9 12	  tsb $12c9
$0a:b55d  5d b5 b5	  eor $b5b5,x
$0a:b560  b5 18		 lda $18,x
$0a:b562  b2 06		 lda ($06)
$0a:b564  c8			iny
$0a:b565  0c c9 12	  tsb $12c9
$0a:b568  b2 b5		 lda ($b5)
$0a:b56a  b5 06		 lda $06,x
$0a:b56c  5b			tcd
$0a:b56d  b2 18		 lda ($18)
$0a:b56f  c8			iny
$0a:b570  0c c9 12	  tsb $12c9
$0a:b573  5d b5 b5	  eor $b5b5,x
$0a:b576  b5 18		 lda $18,x
$0a:b578  b2 06		 lda ($06)
$0a:b57a  c8			iny
$0a:b57b  0c c9 12	  tsb $12c9
$0a:b57e  b2 b5		 lda ($b5)
$0a:b580  b5 06		 lda $06,x
$0a:b582  5b			tcd
$0a:b583  b2 18		 lda ($18)
$0a:b585  c8			iny
$0a:b586  60			rts
$0a:b587  c9 c9 c9	  cmp #$c9c9
$0a:b58a  18			clc
$0a:b58b  c9 c9 c9	  cmp #$c9c9
$0a:b58e  c9 00 00	  cmp #$0000
$0a:b591  0c c9 0c	  tsb $0cc9
$0a:b594  1d a6 c9	  ora $c9a6,x
$0a:b597  a6 c9		 ldx $c9
$0a:b599  a6 06		 ldx $06
$0a:b59b  c9 a6 0c	  cmp #$0ca6
$0a:b59e  c9 a6 c9	  cmp #$c9a6
$0a:b5a1  a4 c9		 ldy $c9
$0a:b5a3  a6 06		 ldx $06
$0a:b5a5  c9 a4 c9	  cmp #$c9a4
$0a:b5a8  a6 0c		 ldx $0c
$0a:b5aa  c9 c9 a6	  cmp #$a6c9
$0a:b5ad  06 c9		 asl $c9
$0a:b5af  a4 0c		 ldy $0c
$0a:b5b1  c9 a6 06	  cmp #$06a6
$0a:b5b4  c9 a4 c9	  cmp #$c9a4
$0a:b5b7  a9 c9 a6	  lda #$a6c9
$0a:b5ba  0c c9 a6	  tsb $a6c9
$0a:b5bd  c9 a4 a6	  cmp #$a6a4
$0a:b5c0  06 c9		 asl $c9
$0a:b5c2  a4 c9		 ldy $c9
$0a:b5c4  a6 0c		 ldx $0c
$0a:b5c6  c9 c9 a6	  cmp #$a6c9
$0a:b5c9  c9 a6 c9	  cmp #$c9a6
$0a:b5cc  a6 06		 ldx $06
$0a:b5ce  c9 a6 0c	  cmp #$0ca6
$0a:b5d1  c9 a6 c9	  cmp #$c9a6
$0a:b5d4  a4 c9		 ldy $c9
$0a:b5d6  a6 06		 ldx $06
$0a:b5d8  c9 a4 c9	  cmp #$c9a4
$0a:b5db  a6 0c		 ldx $0c
$0a:b5dd  c9 c9 a6	  cmp #$a6c9
$0a:b5e0  06 c9		 asl $c9
$0a:b5e2  a4 0c		 ldy $0c
$0a:b5e4  c9 a6 06	  cmp #$06a6
$0a:b5e7  c9 a4 c9	  cmp #$c9a4
$0a:b5ea  a9 c9 a6	  lda #$a6c9
$0a:b5ed  0c c9 a6	  tsb $a6c9
$0a:b5f0  c9 a4 a6	  cmp #$a6a4
$0a:b5f3  06 c9		 asl $c9
$0a:b5f5  a4 c9		 ldy $c9
$0a:b5f7  a6 0c		 ldx $0c
$0a:b5f9  c9 00 0c	  cmp #$0c00
$0a:b5fc  5d 9a c9	  eor $c99a,x
$0a:b5ff  9a			txs
$0a:b600  c9 9a 06	  cmp #$069a
$0a:b603  c9 9a 0c	  cmp #$0c9a
$0a:b606  c9 9a c9	  cmp #$c99a
$0a:b609  9a			txs
$0a:b60a  c9 9a c9	  cmp #$c99a
$0a:b60d  9a			txs
$0a:b60e  18			clc
$0a:b60f  c9 0c 9a	  cmp #$9a0c
$0a:b612  c9 9a c9	  cmp #$c99a
$0a:b615  c9 9a c9	  cmp #$c99a
$0a:b618  9a			txs
$0a:b619  9a			txs
$0a:b61a  c9 9a c9	  cmp #$c99a
$0a:b61d  c9 9a 18	  cmp #$189a
$0a:b620  c9 0c 9a	  cmp #$9a0c
$0a:b623  c9 9a c9	  cmp #$c99a
$0a:b626  9a			txs
$0a:b627  06 c9		 asl $c9
$0a:b629  9a			txs
$0a:b62a  0c c9 9a	  tsb $9ac9
$0a:b62d  c9 9a c9	  cmp #$c99a
$0a:b630  9a			txs
$0a:b631  c9 9a 18	  cmp #$189a
$0a:b634  c9 0c 9a	  cmp #$9a0c
$0a:b637  c9 9a c9	  cmp #$c99a
$0a:b63a  c9 9a c9	  cmp #$c99a
$0a:b63d  9a			txs
$0a:b63e  9a			txs
$0a:b63f  c9 9a c9	  cmp #$c99a
$0a:b642  c9 9a 18	  cmp #$189a
$0a:b645  c9 00 06	  cmp #$0600
$0a:b648  3d b2 06	  and $06b2,x
$0a:b64b  3b			tsc
$0a:b64c  b2 06		 lda ($06)
$0a:b64e  3d ad 06	  and $06ad,x
$0a:b651  39 ad 06	  and $06ad,y
$0a:b654  3d b2 06	  and $06b2,x
$0a:b657  3b			tsc
$0a:b658  b2 06		 lda ($06)
$0a:b65a  3d ad 06	  and $06ad,x
$0a:b65d  39 ad 06	  and $06ad,y
$0a:b660  3d b2 06	  and $06b2,x
$0a:b663  3b			tsc
$0a:b664  b2 c9		 lda ($c9)
$0a:b666  06 3d		 asl $3d
$0a:b668  b2 c9		 lda ($c9)
$0a:b66a  b2 0c		 lda ($0c)
$0a:b66c  39 ad 06	  and $06ad,y
$0a:b66f  3d b2 06	  and $06b2,x
$0a:b672  3b			tsc
$0a:b673  b2 06		 lda ($06)
$0a:b675  3d ad 06	  and $06ad,x
$0a:b678  39 ad 06	  and $06ad,y
$0a:b67b  3d b2 06	  and $06b2,x
$0a:b67e  3b			tsc
$0a:b67f  b2 06		 lda ($06)
$0a:b681  3d ad 06	  and $06ad,x
$0a:b684  39 ad 06	  and $06ad,y
$0a:b687  3d b2 06	  and $06b2,x
$0a:b68a  3b			tsc
$0a:b68b  b2 c9		 lda ($c9)
$0a:b68d  06 3d		 asl $3d
$0a:b68f  b2 c9		 lda ($c9)
$0a:b691  b2 0c		 lda ($0c)
$0a:b693  39 ad 06	  and $06ad,y
$0a:b696  3d b2 06	  and $06b2,x
$0a:b699  3b			tsc
$0a:b69a  b2 06		 lda ($06)
$0a:b69c  3d ad 06	  and $06ad,x
$0a:b69f  39 ad 06	  and $06ad,y
$0a:b6a2  3d b2 06	  and $06b2,x
$0a:b6a5  3b			tsc
$0a:b6a6  b2 06		 lda ($06)
$0a:b6a8  3d ad 06	  and $06ad,x
$0a:b6ab  39 ad 06	  and $06ad,y
$0a:b6ae  3d b2 06	  and $06b2,x
$0a:b6b1  3b			tsc
$0a:b6b2  b2 c9		 lda ($c9)
$0a:b6b4  06 3d		 asl $3d
$0a:b6b6  b2 c9		 lda ($c9)
$0a:b6b8  b2 0c		 lda ($0c)
$0a:b6ba  39 ad 06	  and $06ad,y
$0a:b6bd  3d b2 06	  and $06b2,x
$0a:b6c0  3b			tsc
$0a:b6c1  b2 06		 lda ($06)
$0a:b6c3  3d ad 06	  and $06ad,x
$0a:b6c6  39 ad 06	  and $06ad,y
$0a:b6c9  3d b2 06	  and $06b2,x
$0a:b6cc  3b			tsc
$0a:b6cd  b2 06		 lda ($06)
$0a:b6cf  3d ad 06	  and $06ad,x
$0a:b6d2  39 ad 06	  and $06ad,y
$0a:b6d5  3d b2 06	  and $06b2,x
$0a:b6d8  3b			tsc
$0a:b6d9  b2 c9		 lda ($c9)
$0a:b6db  06 3d		 asl $3d
$0a:b6dd  b2 c9		 lda ($c9)
$0a:b6df  b2 0c		 lda ($0c)
$0a:b6e1  39 ad 06	  and $06ad,y
$0a:b6e4  3d b2 06	  and $06b2,x
$0a:b6e7  3b			tsc
$0a:b6e8  b2 06		 lda ($06)
$0a:b6ea  3d ad 06	  and $06ad,x
$0a:b6ed  39 ad 06	  and $06ad,y
$0a:b6f0  3d b2 06	  and $06b2,x
$0a:b6f3  3b			tsc
$0a:b6f4  b2 06		 lda ($06)
$0a:b6f6  3d ad 06	  and $06ad,x
$0a:b6f9  39 ad 06	  and $06ad,y
$0a:b6fc  3d b2 06	  and $06b2,x
$0a:b6ff  3b			tsc
$0a:b700  b2 c9		 lda ($c9)
$0a:b702  06 3d		 asl $3d
$0a:b704  b2 c9		 lda ($c9)
$0a:b706  b2 0c		 lda ($0c)
$0a:b708  39 ad 06	  and $06ad,y
$0a:b70b  3d b2 06	  and $06b2,x
$0a:b70e  3b			tsc
$0a:b70f  b2 06		 lda ($06)
$0a:b711  3d ad 06	  and $06ad,x
$0a:b714  39 ad 06	  and $06ad,y
$0a:b717  3d b2 06	  and $06b2,x
$0a:b71a  3b			tsc
$0a:b71b  b2 06		 lda ($06)
$0a:b71d  3d ad 06	  and $06ad,x
$0a:b720  39 ad 06	  and $06ad,y
$0a:b723  3d b2 06	  and $06b2,x
$0a:b726  3b			tsc
$0a:b727  b2 c9		 lda ($c9)
$0a:b729  06 3d		 asl $3d
$0a:b72b  b2 c9		 lda ($c9)
$0a:b72d  b2 0c		 lda ($0c)
$0a:b72f  39 ad 06	  and $06ad,y
$0a:b732  3d b2 06	  and $06b2,x
$0a:b735  3b			tsc
$0a:b736  b2 06		 lda ($06)
$0a:b738  3d ad 06	  and $06ad,x
$0a:b73b  39 ad 06	  and $06ad,y
$0a:b73e  3d b2 06	  and $06b2,x
$0a:b741  3b			tsc
$0a:b742  b2 06		 lda ($06)
$0a:b744  3d ad 06	  and $06ad,x
$0a:b747  39 ad 06	  and $06ad,y
$0a:b74a  3d b2 06	  and $06b2,x
$0a:b74d  3b			tsc
$0a:b74e  b2 c9		 lda ($c9)
$0a:b750  06 3d		 asl $3d
$0a:b752  b2 c9		 lda ($c9)
$0a:b754  b2 0c		 lda ($0c)
$0a:b756  39 ad 06	  and $06ad,y
$0a:b759  3d b2 06	  and $06b2,x
$0a:b75c  3b			tsc
$0a:b75d  b2 06		 lda ($06)
$0a:b75f  3d ad 06	  and $06ad,x
$0a:b762  39 ad 06	  and $06ad,y
$0a:b765  3d b2 06	  and $06b2,x
$0a:b768  3b			tsc
$0a:b769  b2 06		 lda ($06)
$0a:b76b  3d ad 06	  and $06ad,x
$0a:b76e  39 ad 06	  and $06ad,y
$0a:b771  3d b2 06	  and $06b2,x
$0a:b774  3b			tsc
$0a:b775  b2 c9		 lda ($c9)
$0a:b777  06 3d		 asl $3d
$0a:b779  b2 c9		 lda ($c9)
$0a:b77b  b2 0c		 lda ($0c)
$0a:b77d  39 ad 00	  and $00ad,y
$0a:b780  18			clc
$0a:b781  c9 12 5d	  cmp #$5d12
$0a:b784  b5 b5		 lda $b5,x
$0a:b786  b5 18		 lda $18,x
$0a:b788  b2 06		 lda ($06)
$0a:b78a  c8			iny
$0a:b78b  0c c9 12	  tsb $12c9
$0a:b78e  b2 b5		 lda ($b5)
$0a:b790  b5 06		 lda $06,x
$0a:b792  b2 18		 lda ($18)
$0a:b794  c8			iny
$0a:b795  0c c9 12	  tsb $12c9
$0a:b798  b5 b5		 lda $b5,x
$0a:b79a  b5 18		 lda $18,x
$0a:b79c  b2 06		 lda ($06)
$0a:b79e  c8			iny
$0a:b79f  0c c9 12	  tsb $12c9
$0a:b7a2  b2 b5		 lda ($b5)
$0a:b7a4  b5 06		 lda $06,x
$0a:b7a6  b2 18		 lda ($18)
$0a:b7a8  c8			iny
$0a:b7a9  60			rts
$0a:b7aa  c9 c9 c9	  cmp #$c9c9
$0a:b7ad  54 c9 00	  mvn $00,$c9
$0a:b7b0  18			clc
$0a:b7b1  5b			tcd
$0a:b7b2  ca			dex
$0a:b7b3  18			clc
$0a:b7b4  5d cb 18	  eor $18cb,x
$0a:b7b7  5b			tcd
$0a:b7b8  ca			dex
$0a:b7b9  18			clc
$0a:b7ba  5d cb 18	  eor $18cb,x
$0a:b7bd  5b			tcd
$0a:b7be  ca			dex
$0a:b7bf  18			clc
$0a:b7c0  5d cb 12	  eor $12cb,x
$0a:b7c3  5b			tcd
$0a:b7c4  ca			dex
$0a:b7c5  06 5d		 asl $5d
$0a:b7c7  cb			wai
$0a:b7c8  c9 06 5b	  cmp #$5b06
$0a:b7cb  ca			dex
$0a:b7cc  0c c9 18	  tsb $18c9
$0a:b7cf  ca			dex
$0a:b7d0  18			clc
$0a:b7d1  5d cb 18	  eor $18cb,x
$0a:b7d4  5b			tcd
$0a:b7d5  ca			dex
$0a:b7d6  18			clc
$0a:b7d7  5d cb 18	  eor $18cb,x
$0a:b7da  5b			tcd
$0a:b7db  ca			dex
$0a:b7dc  18			clc
$0a:b7dd  5d cb 12	  eor $12cb,x
$0a:b7e0  5b			tcd
$0a:b7e1  ca			dex
$0a:b7e2  06 5d		 asl $5d
$0a:b7e4  cb			wai
$0a:b7e5  c9 06 5b	  cmp #$5b06
$0a:b7e8  ca			dex
$0a:b7e9  0c c9 18	  tsb $18c9
$0a:b7ec  ca			dex
$0a:b7ed  18			clc
$0a:b7ee  5d cb 18	  eor $18cb,x
$0a:b7f1  5b			tcd
$0a:b7f2  ca			dex
$0a:b7f3  18			clc
$0a:b7f4  5d cb 18	  eor $18cb,x
$0a:b7f7  5b			tcd
$0a:b7f8  ca			dex
$0a:b7f9  18			clc
$0a:b7fa  5d cb 12	  eor $12cb,x
$0a:b7fd  5b			tcd
$0a:b7fe  ca			dex
$0a:b7ff  06 5d		 asl $5d
$0a:b801  cb			wai
$0a:b802  c9 06 5b	  cmp #$5b06
$0a:b805  ca			dex
$0a:b806  0c c9 18	  tsb $18c9
$0a:b809  ca			dex
$0a:b80a  18			clc
$0a:b80b  5d cb 18	  eor $18cb,x
$0a:b80e  5b			tcd
$0a:b80f  ca			dex
$0a:b810  18			clc
$0a:b811  5d cb 18	  eor $18cb,x
$0a:b814  5b			tcd
$0a:b815  ca			dex
$0a:b816  18			clc
$0a:b817  5d cb 12	  eor $12cb,x
$0a:b81a  5b			tcd
$0a:b81b  ca			dex
$0a:b81c  06 5d		 asl $5d
$0a:b81e  cb			wai
$0a:b81f  c9 06 5b	  cmp #$5b06
$0a:b822  ca			dex
$0a:b823  0c c9 00	  tsb $00c9
$0a:b826  0c c9 0c	  tsb $0cc9
$0a:b829  5d cc c9	  eor $c9cc,x
$0a:b82c  0c 5b cc	  tsb $cc5b
$0a:b82f  c9 0c 5d	  cmp #$5d0c
$0a:b832  cc c9 0c	  cpy $0cc9
$0a:b835  59 cc c9	  eor $c9cc,y
$0a:b838  0c 5d cc	  tsb $cc5d
$0a:b83b  c9 0c 5b	  cmp #$5b0c
$0a:b83e  cc c9 0c	  cpy $0cc9
$0a:b841  5d cc 0c	  eor $0ccc,x
$0a:b844  5b			tcd
$0a:b845  cc 0c 59	  cpy $590c
$0a:b848  cc c9 0c	  cpy $0cc9
$0a:b84b  5d cc c9	  eor $c9cc,x
$0a:b84e  0c 5b cc	  tsb $cc5b
$0a:b851  c9 0c 5d	  cmp #$5d0c
$0a:b854  cc c9 0c	  cpy $0cc9
$0a:b857  59 cc c9	  eor $c9cc,y
$0a:b85a  0c 5d cc	  tsb $cc5d
$0a:b85d  c9 0c 5b	  cmp #$5b0c
$0a:b860  cc c9 0c	  cpy $0cc9
$0a:b863  5d cc 0c	  eor $0ccc,x
$0a:b866  5b			tcd
$0a:b867  cc 0c 59	  cpy $590c
$0a:b86a  cc c9 0c	  cpy $0cc9
$0a:b86d  5d cc c9	  eor $c9cc,x
$0a:b870  0c 5b cc	  tsb $cc5b
$0a:b873  c9 0c 5d	  cmp #$5d0c
$0a:b876  cc c9 0c	  cpy $0cc9
$0a:b879  59 cc c9	  eor $c9cc,y
$0a:b87c  0c 5d cc	  tsb $cc5d
$0a:b87f  c9 0c 5b	  cmp #$5b0c
$0a:b882  cc c9 0c	  cpy $0cc9
$0a:b885  5d cc 0c	  eor $0ccc,x
$0a:b888  5b			tcd
$0a:b889  cc 0c 59	  cpy $590c
$0a:b88c  cc c9 0c	  cpy $0cc9
$0a:b88f  5d cc c9	  eor $c9cc,x
$0a:b892  0c 5b cc	  tsb $cc5b
$0a:b895  c9 0c 5d	  cmp #$5d0c
$0a:b898  cc c9 0c	  cpy $0cc9
$0a:b89b  59 cc c9	  eor $c9cc,y
$0a:b89e  0c 5d cc	  tsb $cc5d
$0a:b8a1  c9 0c 5b	  cmp #$5b0c
$0a:b8a4  cc c9 0c	  cpy $0cc9
$0a:b8a7  5d cc 0c	  eor $0ccc,x
$0a:b8aa  5b			tcd
$0a:b8ab  cc 0c 59	  cpy $590c
$0a:b8ae  cc 00 06	  cpy $0600
$0a:b8b1  c9 06 3d	  cmp #$3d06
$0a:b8b4  b2 06		 lda ($06)
$0a:b8b6  3b			tsc
$0a:b8b7  b2 06		 lda ($06)
$0a:b8b9  3d ad 06	  and $06ad,x
$0a:b8bc  39 ad 06	  and $06ad,y
$0a:b8bf  3d b2 06	  and $06b2,x
$0a:b8c2  3b			tsc
$0a:b8c3  b2 06		 lda ($06)
$0a:b8c5  3d ad 06	  and $06ad,x
$0a:b8c8  39 ad 06	  and $06ad,y
$0a:b8cb  3d b2 06	  and $06b2,x
$0a:b8ce  3b			tsc
$0a:b8cf  b2 c9		 lda ($c9)
$0a:b8d1  06 3d		 asl $3d
$0a:b8d3  b2 c9		 lda ($c9)
$0a:b8d5  b2 0c		 lda ($0c)
$0a:b8d7  39 ad 06	  and $06ad,y
$0a:b8da  3d b2 06	  and $06b2,x
$0a:b8dd  3b			tsc
$0a:b8de  b2 06		 lda ($06)
$0a:b8e0  3d ad 06	  and $06ad,x
$0a:b8e3  39 ad 06	  and $06ad,y
$0a:b8e6  3d b2 06	  and $06b2,x
$0a:b8e9  3b			tsc
$0a:b8ea  b2 06		 lda ($06)
$0a:b8ec  3d ad 06	  and $06ad,x
$0a:b8ef  39 ad 06	  and $06ad,y
$0a:b8f2  3d b2 06	  and $06b2,x
$0a:b8f5  3b			tsc
$0a:b8f6  b2 c9		 lda ($c9)
$0a:b8f8  06 3d		 asl $3d
$0a:b8fa  b2 c9		 lda ($c9)
$0a:b8fc  b2 0c		 lda ($0c)
$0a:b8fe  39 ad 06	  and $06ad,y
$0a:b901  3d b2 06	  and $06b2,x
$0a:b904  3b			tsc
$0a:b905  b2 06		 lda ($06)
$0a:b907  3d ad 06	  and $06ad,x
$0a:b90a  39 ad 06	  and $06ad,y
$0a:b90d  3d b2 06	  and $06b2,x
$0a:b910  3b			tsc
$0a:b911  b2 06		 lda ($06)
$0a:b913  3d ad 06	  and $06ad,x
$0a:b916  39 ad 06	  and $06ad,y
$0a:b919  3d b2 06	  and $06b2,x
$0a:b91c  3b			tsc
$0a:b91d  b2 c9		 lda ($c9)
$0a:b91f  06 3d		 asl $3d
$0a:b921  b2 c9		 lda ($c9)
$0a:b923  b2 0c		 lda ($0c)
$0a:b925  39 ad 06	  and $06ad,y
$0a:b928  3d b2 06	  and $06b2,x
$0a:b92b  3b			tsc
$0a:b92c  b2 06		 lda ($06)
$0a:b92e  3d ad 06	  and $06ad,x
$0a:b931  39 ad 06	  and $06ad,y
$0a:b934  3d b2 06	  and $06b2,x
$0a:b937  3b			tsc
$0a:b938  b2 06		 lda ($06)
$0a:b93a  3d ad 06	  and $06ad,x
$0a:b93d  39 ad 06	  and $06ad,y
$0a:b940  3d b2 06	  and $06b2,x
$0a:b943  3b			tsc
$0a:b944  b2 c9		 lda ($c9)
$0a:b946  06 3d		 asl $3d
$0a:b948  b2 c9		 lda ($c9)
$0a:b94a  b2 0c		 lda ($0c)
$0a:b94c  39 ad 06	  and $06ad,y
$0a:b94f  3d b2 06	  and $06b2,x
$0a:b952  3b			tsc
$0a:b953  b2 06		 lda ($06)
$0a:b955  3d ad 06	  and $06ad,x
$0a:b958  39 ad 06	  and $06ad,y
$0a:b95b  3d b2 06	  and $06b2,x
$0a:b95e  3b			tsc
$0a:b95f  b2 06		 lda ($06)
$0a:b961  3d ad 06	  and $06ad,x
$0a:b964  39 ad 06	  and $06ad,y
$0a:b967  3d b2 06	  and $06b2,x
$0a:b96a  3b			tsc
$0a:b96b  b2 c9		 lda ($c9)
$0a:b96d  06 3d		 asl $3d
$0a:b96f  b2 c9		 lda ($c9)
$0a:b971  b2 0c		 lda ($0c)
$0a:b973  39 ad 06	  and $06ad,y
$0a:b976  3d b2 06	  and $06b2,x
$0a:b979  3b			tsc
$0a:b97a  b2 06		 lda ($06)
$0a:b97c  3d ad 06	  and $06ad,x
$0a:b97f  39 ad 06	  and $06ad,y
$0a:b982  3d b2 06	  and $06b2,x
$0a:b985  3b			tsc
$0a:b986  b2 06		 lda ($06)
$0a:b988  3d ad 06	  and $06ad,x
$0a:b98b  39 ad 06	  and $06ad,y
$0a:b98e  3d b2 06	  and $06b2,x
$0a:b991  3b			tsc
$0a:b992  b2 c9		 lda ($c9)
$0a:b994  06 3d		 asl $3d
$0a:b996  b2 c9		 lda ($c9)
$0a:b998  b2 0c		 lda ($0c)
$0a:b99a  39 ad 06	  and $06ad,y
$0a:b99d  3d b2 06	  and $06b2,x
$0a:b9a0  3b			tsc
$0a:b9a1  b2 06		 lda ($06)
$0a:b9a3  3d ad 06	  and $06ad,x
$0a:b9a6  39 ad 06	  and $06ad,y
$0a:b9a9  3d b2 06	  and $06b2,x
$0a:b9ac  3b			tsc
$0a:b9ad  b2 06		 lda ($06)
$0a:b9af  3d ad 06	  and $06ad,x
$0a:b9b2  39 ad 06	  and $06ad,y
$0a:b9b5  3d b2 06	  and $06b2,x
$0a:b9b8  3b			tsc
$0a:b9b9  b2 c9		 lda ($c9)
$0a:b9bb  06 3d		 asl $3d
$0a:b9bd  b2 c9		 lda ($c9)
$0a:b9bf  b2 0c		 lda ($0c)
$0a:b9c1  39 ad 06	  and $06ad,y
$0a:b9c4  3d b2 06	  and $06b2,x
$0a:b9c7  3b			tsc
$0a:b9c8  b2 06		 lda ($06)
$0a:b9ca  3d ad 06	  and $06ad,x
$0a:b9cd  39 ad 06	  and $06ad,y
$0a:b9d0  3d b2 06	  and $06b2,x
$0a:b9d3  3b			tsc
$0a:b9d4  b2 06		 lda ($06)
$0a:b9d6  3d ad 06	  and $06ad,x
$0a:b9d9  39 ad 06	  and $06ad,y
$0a:b9dc  3d b2 06	  and $06b2,x
$0a:b9df  3b			tsc
$0a:b9e0  b2 c9		 lda ($c9)
$0a:b9e2  06 3d		 asl $3d
$0a:b9e4  b2 c9		 lda ($c9)
$0a:b9e6  b2 06		 lda ($06)
$0a:b9e8  39 ad 00	  and $00ad,y
$0a:b9eb  0c 3d a6	  tsb $a63d
$0a:b9ee  0c 2d a9	  tsb $a92d
$0a:b9f1  ad 06 a9	  lda $a906
$0a:b9f4  0c 3d ad	  tsb $ad3d
$0a:b9f7  12 a9		 ora ($a9)
$0a:b9f9  0c 2d a6	  tsb $a62d
$0a:b9fc  a9 a6 a9	  lda #$a9a6
$0a:b9ff  a6 06		 ldx $06
$0a:ba01  a4 06		 ldy $06
$0a:ba03  3c a6 18	  bit $18a6,x
$0a:ba06  3d a6 c9	  and $c9a6,x
$0a:ba09  0c a6 0c	  tsb $0ca6
$0a:ba0c  2d a9 ad	  and $ada9
$0a:ba0f  06 a9		 asl $a9
$0a:ba11  0c 3d ad	  tsb $ad3d
$0a:ba14  12 a9		 ora ($a9)
$0a:ba16  0c 2d a6	  tsb $a62d
$0a:ba19  a9 a6 a9	  lda #$a9a6
$0a:ba1c  a6 06		 ldx $06
$0a:ba1e  a4 06		 ldy $06
$0a:ba20  1c a6 18	  trb $18a6
$0a:ba23  3d a6 c9	  and $c9a6,x
$0a:ba26  60			rts
$0a:ba27  c9 c9 c9	  cmp #$c9c9
$0a:ba2a  c9 00 00	  cmp #$0000
$0a:ba2d  0c c9 0c	  tsb $0cc9
$0a:ba30  1d a6 c9	  ora $c9a6,x
$0a:ba33  a6 c9		 ldx $c9
$0a:ba35  a6 06		 ldx $06
$0a:ba37  c9 a6 0c	  cmp #$0ca6
$0a:ba3a  c9 a6 c9	  cmp #$c9a6
$0a:ba3d  a4 c9		 ldy $c9
$0a:ba3f  a6 06		 ldx $06
$0a:ba41  c9 a4 c9	  cmp #$c9a4
$0a:ba44  a6 0c		 ldx $0c
$0a:ba46  c9 c9 a6	  cmp #$a6c9
$0a:ba49  06 c9		 asl $c9
$0a:ba4b  a4 0c		 ldy $0c
$0a:ba4d  c9 a6 06	  cmp #$06a6
$0a:ba50  c9 a4 c9	  cmp #$c9a4
$0a:ba53  a9 c9 a6	  lda #$a6c9
$0a:ba56  0c c9 a6	  tsb $a6c9
$0a:ba59  c9 a4 a6	  cmp #$a6a4
$0a:ba5c  06 c9		 asl $c9
$0a:ba5e  a4 c9		 ldy $c9
$0a:ba60  a6 0c		 ldx $0c
$0a:ba62  c9 c9 a6	  cmp #$a6c9
$0a:ba65  c9 a6 c9	  cmp #$c9a6
$0a:ba68  a6 06		 ldx $06
$0a:ba6a  c9 a6 0c	  cmp #$0ca6
$0a:ba6d  c9 a6 c9	  cmp #$c9a6
$0a:ba70  a4 c9		 ldy $c9
$0a:ba72  a6 06		 ldx $06
$0a:ba74  c9 a4 c9	  cmp #$c9a4
$0a:ba77  a6 0c		 ldx $0c
$0a:ba79  c9 c9 a6	  cmp #$a6c9
$0a:ba7c  06 c9		 asl $c9
$0a:ba7e  a4 0c		 ldy $0c
$0a:ba80  c9 a6 06	  cmp #$06a6
$0a:ba83  c9 a4 c9	  cmp #$c9a4
$0a:ba86  a9 c9 a6	  lda #$a6c9
$0a:ba89  0c c9 a6	  tsb $a6c9
$0a:ba8c  c9 a4 a6	  cmp #$a6a4
$0a:ba8f  06 c9		 asl $c9
$0a:ba91  a4 c9		 ldy $c9
$0a:ba93  a6 0c		 ldx $0c
$0a:ba95  c9 00 0c	  cmp #$0c00
$0a:ba98  5d 9a c9	  eor $c99a,x
$0a:ba9b  9a			txs
$0a:ba9c  c9 9a 06	  cmp #$069a
$0a:ba9f  c9 9a 0c	  cmp #$0c9a
$0a:baa2  c9 9a c9	  cmp #$c99a
$0a:baa5  9a			txs
$0a:baa6  c9 9a c9	  cmp #$c99a
$0a:baa9  9a			txs
$0a:baaa  18			clc
$0a:baab  c9 0c 9a	  cmp #$9a0c
$0a:baae  c9 9a c9	  cmp #$c99a
$0a:bab1  c9 9a c9	  cmp #$c99a
$0a:bab4  9a			txs
$0a:bab5  9a			txs
$0a:bab6  c9 9a c9	  cmp #$c99a
$0a:bab9  c9 9a 18	  cmp #$189a
$0a:babc  c9 0c 9a	  cmp #$9a0c
$0a:babf  c9 9a c9	  cmp #$c99a
$0a:bac2  9a			txs
$0a:bac3  06 c9		 asl $c9
$0a:bac5  9a			txs
$0a:bac6  0c c9 9a	  tsb $9ac9
$0a:bac9  c9 9a c9	  cmp #$c99a
$0a:bacc  9a			txs
$0a:bacd  c9 9a 18	  cmp #$189a
$0a:bad0  c9 0c 9a	  cmp #$9a0c
$0a:bad3  c9 9a c9	  cmp #$c99a
$0a:bad6  c9 9a c9	  cmp #$c99a
$0a:bad9  9a			txs
$0a:bada  9a			txs
$0a:badb  c9 9a c9	  cmp #$c99a
$0a:bade  c9 9a 18	  cmp #$189a
$0a:bae1  c9 00 06	  cmp #$0600
$0a:bae4  3d b2 06	  and $06b2,x
$0a:bae7  3b			tsc
$0a:bae8  b2 06		 lda ($06)
$0a:baea  3d ad 06	  and $06ad,x
$0a:baed  39 ad 06	  and $06ad,y
$0a:baf0  3d b2 06	  and $06b2,x
$0a:baf3  3b			tsc
$0a:baf4  b2 06		 lda ($06)
$0a:baf6  3d ad 06	  and $06ad,x
$0a:baf9  39 ad 06	  and $06ad,y
$0a:bafc  3d b2 06	  and $06b2,x
$0a:baff  3b			tsc
$0a:bb00  b2 c9		 lda ($c9)
$0a:bb02  06 3d		 asl $3d
$0a:bb04  b2 c9		 lda ($c9)
$0a:bb06  b2 0c		 lda ($0c)
$0a:bb08  39 ad 06	  and $06ad,y
$0a:bb0b  3d b2 06	  and $06b2,x
$0a:bb0e  3b			tsc
$0a:bb0f  b2 06		 lda ($06)
$0a:bb11  3d ad 06	  and $06ad,x
$0a:bb14  39 ad 06	  and $06ad,y
$0a:bb17  3d b2 06	  and $06b2,x
$0a:bb1a  3b			tsc
$0a:bb1b  b2 06		 lda ($06)
$0a:bb1d  3d ad 06	  and $06ad,x
$0a:bb20  39 ad 06	  and $06ad,y
$0a:bb23  3d b2 06	  and $06b2,x
$0a:bb26  3b			tsc
$0a:bb27  b2 c9		 lda ($c9)
$0a:bb29  06 3d		 asl $3d
$0a:bb2b  b2 c9		 lda ($c9)
$0a:bb2d  b2 0c		 lda ($0c)
$0a:bb2f  39 ad 06	  and $06ad,y
$0a:bb32  3d b2 06	  and $06b2,x
$0a:bb35  3b			tsc
$0a:bb36  b2 06		 lda ($06)
$0a:bb38  3d ad 06	  and $06ad,x
$0a:bb3b  39 ad 06	  and $06ad,y
$0a:bb3e  3d b2 06	  and $06b2,x
$0a:bb41  3b			tsc
$0a:bb42  b2 06		 lda ($06)
$0a:bb44  3d ad 06	  and $06ad,x
$0a:bb47  39 ad 06	  and $06ad,y
$0a:bb4a  3d b2 06	  and $06b2,x
$0a:bb4d  3b			tsc
$0a:bb4e  b2 c9		 lda ($c9)
$0a:bb50  06 3d		 asl $3d
$0a:bb52  b2 c9		 lda ($c9)
$0a:bb54  b2 0c		 lda ($0c)
$0a:bb56  39 ad 06	  and $06ad,y
$0a:bb59  3d b2 06	  and $06b2,x
$0a:bb5c  3b			tsc
$0a:bb5d  b2 06		 lda ($06)
$0a:bb5f  3d ad 06	  and $06ad,x
$0a:bb62  39 ad 06	  and $06ad,y
$0a:bb65  3d b2 06	  and $06b2,x
$0a:bb68  3b			tsc
$0a:bb69  b2 06		 lda ($06)
$0a:bb6b  3d ad 06	  and $06ad,x
$0a:bb6e  39 ad 06	  and $06ad,y
$0a:bb71  3d b2 06	  and $06b2,x
$0a:bb74  3b			tsc
$0a:bb75  b2 c9		 lda ($c9)
$0a:bb77  06 3d		 asl $3d
$0a:bb79  b2 c9		 lda ($c9)
$0a:bb7b  b2 0c		 lda ($0c)
$0a:bb7d  39 ad 06	  and $06ad,y
$0a:bb80  3d b2 06	  and $06b2,x
$0a:bb83  3b			tsc
$0a:bb84  b2 06		 lda ($06)
$0a:bb86  3d ad 06	  and $06ad,x
$0a:bb89  39 ad 06	  and $06ad,y
$0a:bb8c  3d b2 06	  and $06b2,x
$0a:bb8f  3b			tsc
$0a:bb90  b2 06		 lda ($06)
$0a:bb92  3d ad 06	  and $06ad,x
$0a:bb95  39 ad 06	  and $06ad,y
$0a:bb98  3d b2 06	  and $06b2,x
$0a:bb9b  3b			tsc
$0a:bb9c  b2 c9		 lda ($c9)
$0a:bb9e  06 3d		 asl $3d
$0a:bba0  b2 c9		 lda ($c9)
$0a:bba2  b2 0c		 lda ($0c)
$0a:bba4  39 ad 06	  and $06ad,y
$0a:bba7  3d b2 06	  and $06b2,x
$0a:bbaa  3b			tsc
$0a:bbab  b2 06		 lda ($06)
$0a:bbad  3d ad 06	  and $06ad,x
$0a:bbb0  39 ad 06	  and $06ad,y
$0a:bbb3  3d b2 06	  and $06b2,x
$0a:bbb6  3b			tsc
$0a:bbb7  b2 06		 lda ($06)
$0a:bbb9  3d ad 06	  and $06ad,x
$0a:bbbc  39 ad 06	  and $06ad,y
$0a:bbbf  3d b2 06	  and $06b2,x
$0a:bbc2  3b			tsc
$0a:bbc3  b2 c9		 lda ($c9)
$0a:bbc5  06 3d		 asl $3d
$0a:bbc7  b2 c9		 lda ($c9)
$0a:bbc9  b2 0c		 lda ($0c)
$0a:bbcb  39 ad 06	  and $06ad,y
$0a:bbce  3d b2 06	  and $06b2,x
$0a:bbd1  3b			tsc
$0a:bbd2  b2 06		 lda ($06)
$0a:bbd4  3d ad 06	  and $06ad,x
$0a:bbd7  39 ad 06	  and $06ad,y
$0a:bbda  3d b2 06	  and $06b2,x
$0a:bbdd  3b			tsc
$0a:bbde  b2 06		 lda ($06)
$0a:bbe0  3d ad 06	  and $06ad,x
$0a:bbe3  39 ad 06	  and $06ad,y
$0a:bbe6  3d b2 06	  and $06b2,x
$0a:bbe9  3b			tsc
$0a:bbea  b2 c9		 lda ($c9)
$0a:bbec  06 3d		 asl $3d
$0a:bbee  b2 c9		 lda ($c9)
$0a:bbf0  b2 0c		 lda ($0c)
$0a:bbf2  39 ad 06	  and $06ad,y
$0a:bbf5  3d b2 06	  and $06b2,x
$0a:bbf8  3b			tsc
$0a:bbf9  b2 06		 lda ($06)
$0a:bbfb  3d ad 06	  and $06ad,x
$0a:bbfe  39 ad 06	  and $06ad,y
$0a:bc01  3d b2 06	  and $06b2,x
$0a:bc04  3b			tsc
$0a:bc05  b2 06		 lda ($06)
$0a:bc07  3d ad 06	  and $06ad,x
$0a:bc0a  39 ad 06	  and $06ad,y
$0a:bc0d  3d b2 06	  and $06b2,x
$0a:bc10  3b			tsc
$0a:bc11  b2 c9		 lda ($c9)
$0a:bc13  06 3d		 asl $3d
$0a:bc15  b2 c9		 lda ($c9)
$0a:bc17  b2 0c		 lda ($0c)
$0a:bc19  39 ad 00	  and $00ad,y
$0a:bc1c  0c c9 0c	  tsb $0cc9
$0a:bc1f  3d a6 0c	  and $0ca6,x
$0a:bc22  2d a9 ad	  and $ada9
$0a:bc25  06 a9		 asl $a9
$0a:bc27  0c 3d ad	  tsb $ad3d
$0a:bc2a  12 a9		 ora ($a9)
$0a:bc2c  0c 2d a6	  tsb $a62d
$0a:bc2f  a9 a6 a9	  lda #$a9a6
$0a:bc32  a6 06		 ldx $06
$0a:bc34  a4 06		 ldy $06
$0a:bc36  3c a6 18	  bit $18a6,x
$0a:bc39  3d a6 c9	  and $c9a6,x
$0a:bc3c  0c a6 0c	  tsb $0ca6
$0a:bc3f  2d a9 ad	  and $ada9
$0a:bc42  06 a9		 asl $a9
$0a:bc44  0c 3d ad	  tsb $ad3d
$0a:bc47  12 a9		 ora ($a9)
$0a:bc49  0c 2d a6	  tsb $a62d
$0a:bc4c  a9 0c 3d	  lda #$3d0c
$0a:bc4f  a6 a9		 ldx $a9
$0a:bc51  a6 06		 ldx $06
$0a:bc53  2d a4 06	  and $06a4
$0a:bc56  1c a6 18	  trb $18a6
$0a:bc59  3d a6 c9	  and $c9a6,x
$0a:bc5c  60			rts
$0a:bc5d  c9 c9 c9	  cmp #$c9c9
$0a:bc60  54 c9 00	  mvn $00,$c9
$0a:bc63  18			clc
$0a:bc64  5b			tcd
$0a:bc65  ca			dex
$0a:bc66  18			clc
$0a:bc67  5d cb 18	  eor $18cb,x
$0a:bc6a  5b			tcd
$0a:bc6b  ca			dex
$0a:bc6c  18			clc
$0a:bc6d  5d cb 18	  eor $18cb,x
$0a:bc70  5b			tcd
$0a:bc71  ca			dex
$0a:bc72  18			clc
$0a:bc73  5d cb 12	  eor $12cb,x
$0a:bc76  5b			tcd
$0a:bc77  ca			dex
$0a:bc78  06 5d		 asl $5d
$0a:bc7a  cb			wai
$0a:bc7b  c9 06 5b	  cmp #$5b06
$0a:bc7e  ca			dex
$0a:bc7f  0c c9 18	  tsb $18c9
$0a:bc82  ca			dex
$0a:bc83  18			clc
$0a:bc84  5d cb 18	  eor $18cb,x
$0a:bc87  5b			tcd
$0a:bc88  ca			dex
$0a:bc89  18			clc
$0a:bc8a  5d cb 18	  eor $18cb,x
$0a:bc8d  5b			tcd
$0a:bc8e  ca			dex
$0a:bc8f  18			clc
$0a:bc90  5d cb 12	  eor $12cb,x
$0a:bc93  5b			tcd
$0a:bc94  ca			dex
$0a:bc95  06 5d		 asl $5d
$0a:bc97  cb			wai
$0a:bc98  c9 06 5b	  cmp #$5b06
$0a:bc9b  ca			dex
$0a:bc9c  0c c9 18	  tsb $18c9
$0a:bc9f  ca			dex
$0a:bca0  18			clc
$0a:bca1  5d cb 18	  eor $18cb,x
$0a:bca4  5b			tcd
$0a:bca5  ca			dex
$0a:bca6  18			clc
$0a:bca7  5d cb 18	  eor $18cb,x
$0a:bcaa  5b			tcd
$0a:bcab  ca			dex
$0a:bcac  18			clc
$0a:bcad  5d cb 12	  eor $12cb,x
$0a:bcb0  5b			tcd
$0a:bcb1  ca			dex
$0a:bcb2  06 5d		 asl $5d
$0a:bcb4  cb			wai
$0a:bcb5  c9 06 5b	  cmp #$5b06
$0a:bcb8  ca			dex
$0a:bcb9  0c c9 18	  tsb $18c9
$0a:bcbc  ca			dex
$0a:bcbd  18			clc
$0a:bcbe  5d cb 18	  eor $18cb,x
$0a:bcc1  5b			tcd
$0a:bcc2  ca			dex
$0a:bcc3  18			clc
$0a:bcc4  5d cb 18	  eor $18cb,x
$0a:bcc7  5b			tcd
$0a:bcc8  ca			dex
$0a:bcc9  18			clc
$0a:bcca  5d cb 12	  eor $12cb,x
$0a:bccd  5b			tcd
$0a:bcce  ca			dex
$0a:bccf  06 5d		 asl $5d
$0a:bcd1  cb			wai
$0a:bcd2  c9 06 5b	  cmp #$5b06
$0a:bcd5  ca			dex
$0a:bcd6  0c c9 00	  tsb $00c9
$0a:bcd9  0c c9 0c	  tsb $0cc9
$0a:bcdc  5d cc c9	  eor $c9cc,x
$0a:bcdf  0c 5b cc	  tsb $cc5b
$0a:bce2  c9 0c 5d	  cmp #$5d0c
$0a:bce5  cc c9 0c	  cpy $0cc9
$0a:bce8  59 cc c9	  eor $c9cc,y
$0a:bceb  0c 5d cc	  tsb $cc5d
$0a:bcee  c9 0c 5b	  cmp #$5b0c
$0a:bcf1  cc c9 0c	  cpy $0cc9
$0a:bcf4  5d cc 0c	  eor $0ccc,x
$0a:bcf7  5b			tcd
$0a:bcf8  cc 0c 59	  cpy $590c
$0a:bcfb  cc c9 0c	  cpy $0cc9
$0a:bcfe  5d cc c9	  eor $c9cc,x
$0a:bd01  0c 5b cc	  tsb $cc5b
$0a:bd04  c9 0c 5d	  cmp #$5d0c
$0a:bd07  cc c9 0c	  cpy $0cc9
$0a:bd0a  59 cc c9	  eor $c9cc,y
$0a:bd0d  0c 5d cc	  tsb $cc5d
$0a:bd10  c9 0c 5b	  cmp #$5b0c
$0a:bd13  cc c9 0c	  cpy $0cc9
$0a:bd16  5d cc 0c	  eor $0ccc,x
$0a:bd19  5b			tcd
$0a:bd1a  cc 0c 59	  cpy $590c
$0a:bd1d  cc c9 0c	  cpy $0cc9
$0a:bd20  5d cc c9	  eor $c9cc,x
$0a:bd23  0c 5b cc	  tsb $cc5b
$0a:bd26  c9 0c 5d	  cmp #$5d0c
$0a:bd29  cc c9 0c	  cpy $0cc9
$0a:bd2c  59 cc c9	  eor $c9cc,y
$0a:bd2f  0c 5d cc	  tsb $cc5d
$0a:bd32  c9 0c 5b	  cmp #$5b0c
$0a:bd35  cc c9 0c	  cpy $0cc9
$0a:bd38  5d cc 0c	  eor $0ccc,x
$0a:bd3b  5b			tcd
$0a:bd3c  cc 0c 59	  cpy $590c
$0a:bd3f  cc c9 0c	  cpy $0cc9
$0a:bd42  5d cc c9	  eor $c9cc,x
$0a:bd45  0c 5b cc	  tsb $cc5b
$0a:bd48  c9 0c 5d	  cmp #$5d0c
$0a:bd4b  cc c9 0c	  cpy $0cc9
$0a:bd4e  59 cc c9	  eor $c9cc,y
$0a:bd51  0c 5d cc	  tsb $cc5d
$0a:bd54  c9 0c 5b	  cmp #$5b0c
$0a:bd57  cc c9 0c	  cpy $0cc9
$0a:bd5a  5d cc 0c	  eor $0ccc,x
$0a:bd5d  5b			tcd
$0a:bd5e  cc 0c 59	  cpy $590c
$0a:bd61  cc 00 06	  cpy $0600
$0a:bd64  c9 06 3d	  cmp #$3d06
$0a:bd67  b2 06		 lda ($06)
$0a:bd69  3b			tsc
$0a:bd6a  b2 06		 lda ($06)
$0a:bd6c  3d ad 06	  and $06ad,x
$0a:bd6f  39 ad 06	  and $06ad,y
$0a:bd72  3d b2 06	  and $06b2,x
$0a:bd75  3b			tsc
$0a:bd76  b2 06		 lda ($06)
$0a:bd78  3d ad 06	  and $06ad,x
$0a:bd7b  39 ad 06	  and $06ad,y
$0a:bd7e  3d b2 06	  and $06b2,x
$0a:bd81  3b			tsc
$0a:bd82  b2 c9		 lda ($c9)
$0a:bd84  06 3d		 asl $3d
$0a:bd86  b2 c9		 lda ($c9)
$0a:bd88  b2 0c		 lda ($0c)
$0a:bd8a  39 ad 06	  and $06ad,y
$0a:bd8d  3d b2 06	  and $06b2,x
$0a:bd90  3b			tsc
$0a:bd91  b2 06		 lda ($06)
$0a:bd93  3d ad 06	  and $06ad,x
$0a:bd96  39 ad 06	  and $06ad,y
$0a:bd99  3d b2 06	  and $06b2,x
$0a:bd9c  3b			tsc
$0a:bd9d  b2 06		 lda ($06)
$0a:bd9f  3d ad 06	  and $06ad,x
$0a:bda2  39 ad 06	  and $06ad,y
$0a:bda5  3d b2 06	  and $06b2,x
$0a:bda8  3b			tsc
$0a:bda9  b2 c9		 lda ($c9)
$0a:bdab  06 3d		 asl $3d
$0a:bdad  b2 c9		 lda ($c9)
$0a:bdaf  b2 0c		 lda ($0c)
$0a:bdb1  39 ad 06	  and $06ad,y
$0a:bdb4  3d b2 06	  and $06b2,x
$0a:bdb7  3b			tsc
$0a:bdb8  b2 06		 lda ($06)
$0a:bdba  3d ad 06	  and $06ad,x
$0a:bdbd  39 ad 06	  and $06ad,y
$0a:bdc0  3d b2 06	  and $06b2,x
$0a:bdc3  3b			tsc
$0a:bdc4  b2 06		 lda ($06)
$0a:bdc6  3d ad 06	  and $06ad,x
$0a:bdc9  39 ad 06	  and $06ad,y
$0a:bdcc  3d b2 06	  and $06b2,x
$0a:bdcf  3b			tsc
$0a:bdd0  b2 c9		 lda ($c9)
$0a:bdd2  06 3d		 asl $3d
$0a:bdd4  b2 c9		 lda ($c9)
$0a:bdd6  b2 0c		 lda ($0c)
$0a:bdd8  39 ad 06	  and $06ad,y
$0a:bddb  3d b2 06	  and $06b2,x
$0a:bdde  3b			tsc
$0a:bddf  b2 06		 lda ($06)
$0a:bde1  3d ad 06	  and $06ad,x
$0a:bde4  39 ad 06	  and $06ad,y
$0a:bde7  3d b2 06	  and $06b2,x
$0a:bdea  3b			tsc
$0a:bdeb  b2 06		 lda ($06)
$0a:bded  3d ad 06	  and $06ad,x
$0a:bdf0  39 ad 06	  and $06ad,y
$0a:bdf3  3d b2 06	  and $06b2,x
$0a:bdf6  3b			tsc
$0a:bdf7  b2 c9		 lda ($c9)
$0a:bdf9  06 3d		 asl $3d
$0a:bdfb  b2 c9		 lda ($c9)
$0a:bdfd  b2 0c		 lda ($0c)
$0a:bdff  39 ad 06	  and $06ad,y
$0a:be02  3d b2 06	  and $06b2,x
$0a:be05  3b			tsc
$0a:be06  b2 06		 lda ($06)
$0a:be08  3d ad 06	  and $06ad,x
$0a:be0b  39 ad 06	  and $06ad,y
$0a:be0e  3d b2 06	  and $06b2,x
$0a:be11  3b			tsc
$0a:be12  b2 06		 lda ($06)
$0a:be14  3d ad 06	  and $06ad,x
$0a:be17  39 ad 06	  and $06ad,y
$0a:be1a  3d b2 06	  and $06b2,x
$0a:be1d  3b			tsc
$0a:be1e  b2 c9		 lda ($c9)
$0a:be20  06 3d		 asl $3d
$0a:be22  b2 c9		 lda ($c9)
$0a:be24  b2 0c		 lda ($0c)
$0a:be26  39 ad 06	  and $06ad,y
$0a:be29  3d b2 06	  and $06b2,x
$0a:be2c  3b			tsc
$0a:be2d  b2 06		 lda ($06)
$0a:be2f  3d ad 06	  and $06ad,x
$0a:be32  39 ad 06	  and $06ad,y
$0a:be35  3d b2 06	  and $06b2,x
$0a:be38  3b			tsc
$0a:be39  b2 06		 lda ($06)
$0a:be3b  3d ad 06	  and $06ad,x
$0a:be3e  39 ad 06	  and $06ad,y
$0a:be41  3d b2 06	  and $06b2,x
$0a:be44  3b			tsc
$0a:be45  b2 c9		 lda ($c9)
$0a:be47  06 3d		 asl $3d
$0a:be49  b2 c9		 lda ($c9)
$0a:be4b  b2 0c		 lda ($0c)
$0a:be4d  39 ad 06	  and $06ad,y
$0a:be50  3d b2 06	  and $06b2,x
$0a:be53  3b			tsc
$0a:be54  b2 06		 lda ($06)
$0a:be56  3d ad 06	  and $06ad,x
$0a:be59  39 ad 06	  and $06ad,y
$0a:be5c  3d b2 06	  and $06b2,x
$0a:be5f  3b			tsc
$0a:be60  b2 06		 lda ($06)
$0a:be62  3d ad 06	  and $06ad,x
$0a:be65  39 ad 06	  and $06ad,y
$0a:be68  3d b2 06	  and $06b2,x
$0a:be6b  3b			tsc
$0a:be6c  b2 c9		 lda ($c9)
$0a:be6e  06 3d		 asl $3d
$0a:be70  b2 c9		 lda ($c9)
$0a:be72  b2 0c		 lda ($0c)
$0a:be74  39 ad 06	  and $06ad,y
$0a:be77  3d b2 06	  and $06b2,x
$0a:be7a  3b			tsc
$0a:be7b  b2 06		 lda ($06)
$0a:be7d  3d ad 06	  and $06ad,x
$0a:be80  39 ad 06	  and $06ad,y
$0a:be83  3d b2 06	  and $06b2,x
$0a:be86  3b			tsc
$0a:be87  b2 06		 lda ($06)
$0a:be89  3d ad 06	  and $06ad,x
$0a:be8c  39 ad 06	  and $06ad,y
$0a:be8f  3d b2 06	  and $06b2,x
$0a:be92  3b			tsc
$0a:be93  b2 c9		 lda ($c9)
$0a:be95  06 3d		 asl $3d
$0a:be97  b2 c9		 lda ($c9)
$0a:be99  b2 06		 lda ($06)
$0a:be9b  39 ad 00	  and $00ad,y
$0a:be9e  00 1c		 brk #$1c
$0a:bea0  00 34		 brk #$34
$0a:bea2  2c 53 73	  bit $7353
$0a:bea5  82 77 4f	  brl $0e1f
$0a:bea8  86 ac		 stx $ac
$0a:beaa  8c 2a 8d	  sty $8d2a
$0a:bead  60			rts
$0a:beae  8d 7b 8d	  sta $8d7b
$0a:beb1  bc 91 fb	  ldy $fb91,x
$0a:beb4  91 fb		 sta ($fb),y
$0a:beb6  91 60		 sta ($60),y
$0a:beb8  96 60		 stx $60,y
$0a:beba  96 4a		 stx $4a,y
$0a:bebc  a0 4a a0	  ldy #$a04a
$0a:bebf  02 00		 cop #$00
$0a:bec1  fd 0f 2c	  sbc $2c0f,x
$0a:bec4  a3 00		 lda $00,s
$0a:bec6  00 07		 brk #$07
$0a:bec8  11 10		 ora ($10),y
$0a:beca  14 1d		 trb $1d
$0a:becc  18			clc
$0a:becd  19 1a 02	  ora $021a,y
$0a:bed0  01 00		 ora ($00,x)
$0a:bed2  02 a6		 cop #$a6
$0a:bed4  53 28		 eor ($28,s),y
$0a:bed6  94 58		 sty $58,x
$0a:bed8  2f 86 0b 46   and $460b86
$0a:bedc  a3 d5		 lda $d5,s
$0a:bede  68			pla
$0a:bedf  6f 93 77 94   adc $947793
$0a:bee3  07 d3		 ora [$d3]
$0a:bee5  01 7b		 ora ($7b,x)
$0a:bee7  05 3c		 ora $3c
$0a:bee9  10 8e		 bpl $be79
$0a:beeb  f0 aa		 beq $be97
$0a:beed  51 61		 eor ($61),y
$0a:beef  3e 18 4d	  rol $4d18,x
$0a:bef2  06 ae		 asl $ae
$0a:bef4  17 5a		 ora [$5a],y
$0a:bef6  a0 20 28	  ldy #$2820
$0a:bef9  b0 8f		 bcs $be8a
$0a:befb  34 23		 bit $23,x
$0a:befd  d1 e0		 cmp ($e0),y
$0a:beff  13 17		 ora ($17,s),y
$0a:bf01  b3 cb		 lda ($cb,s),y
$0a:bf03  ed a7 d2	  sbc $d2a7
$0a:bf06  6a			ror a
$0a:bf07  f4 2f 00	  pea $002f
$0a:bf0a  9c c4 c3	  stz $c3c4
$0a:bf0d  e1 c7		 sbc ($c7,x)
$0a:bf0f  53 a9		 eor ($a9,s),y
$0a:bf11  23 20		 and $20,s
$0a:bf13  f4 10 80	  pea $8010
$0a:bf16  68			pla
$0a:bf17  be 97 b0	  ldx $b097,y
$0a:bf1a  51 44		 eor ($44),y
$0a:bf1c  ec 2d 02	  cpx $022d
$0a:bf1f  b8			clv
$0a:bf20  78			sei
$0a:bf21  c9 a2 37	  cmp #$37a2
$0a:bf24  63 39		 adc $39,s
$0a:bf26  d4 82		 pei ($82)
$0a:bf28  21 e5		 and ($e5,x)
$0a:bf2a  24 28		 bit $28
$0a:bf2c  c0 02 e3	  cpy #$e302
$0a:bf2f  4a			lsr a
$0a:bf30  a3 d4		 lda $d4,s
$0a:bf32  71 e3		 adc ($e3),y
$0a:bf34  83 26		 sta $26,s
$0a:bf36  a7 a4		 lda [$a4]
$0a:bf38  2c 0f 10	  bit $100f
$0a:bf3b  2b			pld
$0a:bf3c  89 6e 3c	  bit #$3c6e
$0a:bf3f  15 4a		 ora $4a,x
$0a:bf41  89 a1 8b	  bit #$8ba1
$0a:bf44  22 26 1a 65   jsl $651a26
$0a:bf48  59 60 89	  eor $8960,y
$0a:bf4b  f2 c7		 sbc ($c7)
$0a:bf4d  96 45		 stx $45,y
$0a:bf4f  de 0b f5	  dec $f50b,x
$0a:bf52  58			cli
$0a:bf53  0a			asl a
$0a:bf54  80 b1		 bra $bf07
$0a:bf56  fe 21 e8	  inc $e821,x
$0a:bf59  40			rti
$0a:bf5a  1a			inc a
$0a:bf5b  73 45		 adc ($45,s),y
$0a:bf5d  f5 05		 sbc $05,x
$0a:bf5f  81 a7		 sta ($a7,x)
$0a:bf61  54 37 79	  mvn $79,$37
$0a:bf64  55 11		 eor $11,x
$0a:bf66  e1 02		 sbc ($02,x)
$0a:bf68  81 41		 sta ($41,x)
$0a:bf6a  7c 30 57	  jmp ($5730,x)
$0a:bf6d  b8			clv
$0a:bf6e  51 84		 eor ($84),y
$0a:bf70  00 ff		 brk #$ff
$0a:bf72  3a			dec a
$0a:bf73  2e 9a 81	  rol $819a
$0a:bf76  01 f4		 ora ($f4,x)
$0a:bf78  c0 68 1a	  cpy #$1a68
$0a:bf7b  6a			ror a
$0a:bf7c  31 e4		 and ($e4),y
$0a:bf7e  8f 23 42 d3   sta $d34223
$0a:bf82  d2 21		 cmp ($21)
$0a:bf84  3e 18 4d	  rol $4d18,x
$0a:bf87  23 4f		 and $4f,s
$0a:bf89  46 38		 lsr $38
$0a:bf8b  19 18 3d	  ora $3d18,y
$0a:bf8e  da			phx
$0a:bf8f  a8			tay
$0a:bf90  7c 23 dd	  jmp ($dd23,x)
$0a:bf93  08			php
$0a:bf94  87 ea		 sta [$ea]
$0a:bf96  28			plp
$0a:bf97  d8			cld
$0a:bf98  f2 2a		 sbc ($2a)
$0a:bf9a  8d 50 ea	  sta $ea50
$0a:bf9d  09 85 1a	  ora #$1a85
$0a:bfa0  af 84 7c 09   lda $097c84
$0a:bfa4  21 48		 and ($48,x)
$0a:bfa6  90 dd		 bcc $bf85
$0a:bfa8  94 09		 sty $09,x
$0a:bfaa  4e 17 a9	  lsr $a917
$0a:bfad  34 16		 bit $16,x
$0a:bfaf  08			php
$0a:bfb0  8f 01 bb 04   sta $04bb01
$0a:bfb4  8a			txa
$0a:bfb5  95 47		 sta $47,x
$0a:bfb7  3a			dec a
$0a:bfb8  81 1d		 sta ($1d,x)
$0a:bfba  89 46 84	  bit #$8446
$0a:bfbd  11 a9		 ora ($a9),y
$0a:bfbf  f9 3c 74	  sbc $743c,y
$0a:bfc2  61 d1		 adc ($d1,x)
$0a:bfc4  a1 04		 lda ($04,x)
$0a:bfc6  3e 3e cf	  rol $cf3e,x
$0a:bfc9  2f 8f 1d 52   and $521d8f
$0a:bfcd  f6 94		 inc $94,x
$0a:bfcf  41 3a		 eor ($3a,x)
$0a:bfd1  08			php
$0a:bfd2  40			rti
$0a:bfd3  a8			tay
$0a:bfd4  e3 ca		 sbc $ca,s
$0a:bfd6  00 ac		 brk #$ac
$0a:bfd8  0a			asl a
$0a:bfd9  75 4a		 adc $4a,x
$0a:bfdb  8e 60 25	  stx $2560
$0a:bfde  e8			inx
$0a:bfdf  3d 00 be	  and $be00,x
$0a:bfe2  4b			phk
$0a:bfe3  d0 ab		 bne $bf90
$0a:bfe5  55 1c		 eor $1c,x
$0a:bfe7  74 da		 stz $da,x
$0a:bfe9  f7 58		 sbc [$58],y
$0a:bfeb  80 ff		 bra $bfec
$0a:bfed  00 ff		 brk #$ff
$0a:bfef  00 00		 brk #$00
$0a:bff1  00 08		 brk #$08
$0a:bff3  00 18		 brk #$18
$0a:bff5  00 10		 brk #$10
$0a:bff7  00 00		 brk #$00
$0a:bff9  00 00		 brk #$00
$0a:bffb  00 00		 brk #$00
$0a:bffd  00 00		 brk #$00
$0a:bfff  00 00		 brk #$00
$0a:c001  40			rti
$0a:c002  80 3b		 bra $c03f
$0a:c004  d6 3f		 dec $3f,x
$0a:c006  00 87		 brk #$87
$0a:c008  c0 23 70	  cpy #$7023
$0a:c00b  49 bc 21	  eor #$21bc
$0a:c00e  de d0 08	  dec $08d0,x
$0a:c011  c4 02		 cpy $02
$0a:c013  0d 00 8e	  ora $8e00
$0a:c016  40			rti
$0a:c017  27 0e		 and [$0e]
$0a:c019  f4 e0 40	  pea $40e0
$0a:c01c  3c 10 0d	  bit $0d10,x
$0a:c01f  85 03		 sta $03
$0a:c021  a1 20		 lda ($20,x)
$0a:c023  e8			inx
$0a:c024  58			cli
$0a:c025  1d eb 40	  ora $40eb,x
$0a:c028  0b			phd
$0a:c029  0d c0 52	  ora $52c0
$0a:c02c  3f 07 7b 02   and $027b07,x
$0a:c030  81 f2		 sta ($f2,x)
$0a:c032  0f 92 7f b8   ora $b87f92
$0a:c036  f8			sed
$0a:c037  21 44		 and ($44,x)
$0a:c039  71 06		 adc ($06),y
$0a:c03b  03 fd		 ora $fd,s
$0a:c03d  c5 c0		 cmp $c0
$0a:c03f  17 22		 ora [$22],y
$0a:c041  7c 0a 44	  jmp ($440a,x)
$0a:c044  50 4e		 bvc $c094
$0a:c046  f3 80		 sbc ($80,s),y
$0a:c048  9d 05 f2	  sta $f205,x
$0a:c04b  57 b1		 eor [$b1],y
$0a:c04d  f3 1d		 sbc ($1d,s),y
$0a:c04f  41 de		 eor ($de,x)
$0a:c051  10 e0		 bpl $c033
$0a:c053  58			cli
$0a:c054  d3 1d		 cmp ($1d,s),y
$0a:c056  ed 80 0a	  sbc $0a80
$0a:c059  1e 80 bd	  asl $bd80,x
$0a:c05c  09 72 0f	  ora #$0f72
$0a:c05f  00 5c		 brk #$5c
$0a:c061  0e 0b 03	  asl $030b
$0a:c064  80 41		 bra $c0a7
$0a:c066  e0 10 d8	  cpx #$d810
$0a:c069  14 24		 trb $24
$0a:c06b  14 06		 trb $06
$0a:c06d  f6 81		 inc $81,x
$0a:c06f  2e 05 14	  rol $1405
$0a:c072  0f 90 7f b8   ora $b87f90
$0a:c076  5c 05 c1 ec   jml $ecc105
$0a:c07a  98			tya
$0a:c07b  17 e4		 ora [$e4],y
$0a:c07d  3c 0d e0	  bit $e00d,x
$0a:c080  be 46 23	  ldx $2346,y
$0a:c083  11 07		 ora ($07),y
$0a:c085  80 48		 bra $c0cf
$0a:c087  24 13		 bit $13
$0a:c089  07 a8		 ora [$a8]
$0a:c08b  3d 82 40	  and $4082,x
$0a:c08e  8b			phb
$0a:c08f  07 78		 ora [$78]
$0a:c091  3f 85 f0 00   and $00f085,x
$0a:c095  34 90		 bit $90,x
$0a:c097  4e 22 8f	  lsr $8f22
$0a:c09a  b0 2f		 bcs $c0cb
$0a:c09c  cb			wai
$0a:c09d  bc 29 04	  ldy $0429,x
$0a:c0a0  e9 0c 95	  sbc #$950c
$0a:c0a3  71 fa		 adc ($fa),y
$0a:c0a5  22 a0 88 44   jsl $4488a0
$0a:c0a9  1d 60 f6	  ora $f660,x
$0a:c0ac  09 64 22	  ora #$2264
$0a:c0af  3f 08 8b c1   and $c18b08,x
$0a:c0b3  1f c4 33 00   ora $0033c4,x
$0a:c0b7  19 49 26	  ora $2649,y
$0a:c0ba  00 d0		 brk #$d0
$0a:c0bc  8d 83 a5	  sta $a583
$0a:c0bf  3c 1f c9	  bit $c91f,x
$0a:c0c2  27 51		 and [$51]
$0a:c0c4  3d 05 81	  and $8105,x
$0a:c0c7  ae 43 36	  ldx $3643
$0a:c0ca  90 c4		 bcc $c090
$0a:c0cc  f8			sed
$0a:c0cd  32 81		 and ($81)
$0a:c0cf  9c 10 78	  stz $7810
$0a:c0d2  44 22 15	  mvp $15,$22
$0a:c0d5  0a			asl a
$0a:c0d6  86 9e		 stx $9e
$0a:c0d8  02 08		 cop #$08
$0a:c0da  cc 04 fa	  cpy $fa04
$0a:c0dd  c1 53		 cmp ($53,x)
$0a:c0df  e3 04		 sbc $04,s
$0a:c0e1  80 42		 bra $c125
$0a:c0e3  1d 61 70	  ora $7061,x
$0a:c0e6  f0 4c		 beq $c134
$0a:c0e8  3c 11 0e	  bit $0e11,x
$0a:c0eb  04 83		 tsb $83
$0a:c0ed  41 20		 eor ($20,x)
$0a:c0ef  e0 70 01	  cpx #$0170
$0a:c0f2  f4 9a a3	  pea $a39a
$0a:c0f5  8a			txa
$0a:c0f6  42 a1		 wdm #$a1
$0a:c0f8  30 d8		 bmi $c0d2
$0a:c0fa  74 2e		 stz $2e,x
$0a:c0fc  14 e0		 trb $e0
$0a:c0fe  88			dey
$0a:c0ff  32 20		 and ($20)
$0a:c101  d4 69		 pei ($69)
$0a:c103  e0 53 02	  cpx #$0253
$0a:c106  58			cli
$0a:c107  5a			phy
$0a:c108  81 80		 sta ($80,x)
$0a:c10a  b0 08		 bcs $c114
$0a:c10c  61 34		 adc ($34,x)
$0a:c10e  49 80 8f	  eor #$8f80
$0a:c111  44 a3 b0	  mvp $b0,$a3
$0a:c114  c8			iny
$0a:c115  f4 0a 1b	  pea $1b0a
$0a:c118  13 87		 ora ($87,s),y
$0a:c11a  c5 60		 cmp $60
$0a:c11c  d0 d8		 bne $c0f6
$0a:c11e  5c 1e 0b 03   jml $030b1e
$0a:c122  89 43 61	  bit #$6143
$0a:c125  b1 28		 lda ($28),y
$0a:c127  14 46		 trb $46
$0a:c129  27 13		 and [$13]
$0a:c12b  8e c7 e1	  stx $e1c7
$0a:c12e  b0 f0		 bcs $c120
$0a:c130  50 41		 bvc $c173
$0a:c132  e0 fb 0e	  cpx #$0efb
$0a:c135  80 d0		 bra $c107
$0a:c137  3e 18 0d	  rol $0d18,x
$0a:c13a  07 43		 ora [$43]
$0a:c13c  e1 50		 sbc ($50,x)
$0a:c13e  e0 58 34	  cpx #$3458
$0a:c141  1c 0a 06	  trb $060a
$0a:c144  03 20		 ora $20,s
$0a:c146  de 00 98	  dec $9800,x
$0a:c149  44 3a 1d	  mvp $1d,$3a
$0a:c14c  0b			phd
$0a:c14d  87 c2		 sta [$c2]
$0a:c14f  c1 e0		 cmp ($e0,x)
$0a:c151  15 02		 ora $02,x
$0a:c153  64 23		 stz $23
$0a:c155  70 48		 bvs $c19f
$0a:c157  fc 02 3f	  jsr ($3f02,x)
$0a:c15a  10 8e		 bpl $c0ea
$0a:c15c  43 0e		 eor $0e,s
$0a:c15e  60			rts
$0a:c15f  73 13		 adc ($13,s),y
$0a:c161  01 1f		 ora ($1f,x)
$0a:c163  82 0d 10	  brl $d173
$0a:c166  81 43		 sta ($43,x)
$0a:c168  22 70 08 12   jsl $120870
$0a:c16c  30 59		 bmi $c1c7
$0a:c16e  a3 d8		 lda $d8,s
$0a:c170  b0 4c		 bcs $c1be
$0a:c172  3a			dec a
$0a:c173  1d 04 70	  ora $7004,x
$0a:c176  35 05		 and $05,x
$0a:c178  aa			tax
$0a:c179  2a			rol a
$0a:c17a  a2 fc 44	  ldx #$44fc
$0a:c17d  1a			inc a
$0a:c17e  a1 f0		 lda ($f0,x)
$0a:c180  31 8a		 and ($8a),y
$0a:c182  68			pla
$0a:c183  1b			tcs
$0a:c184  41 40		 eor ($40,x)
$0a:c186  55 04		 eor $04,x
$0a:c188  be 01 36	  ldx $3601,y
$0a:c18b  80 ca		 bra $c157
$0a:c18d  20 11 78	  jsr $7811
$0a:c190  44 36 15	  mvp $15,$36
$0a:c193  17 8d		 ora [$8d],y
$0a:c195  47 e3		 eor [$e3]
$0a:c197  f0 f2		 beq $c18b
$0a:c199  00 47		 brk #$47
$0a:c19b  62 12 b8	  per $79b0
$0a:c19e  04 de		 tsb $de
$0a:c1a0  18			clc
$0a:c1a1  77 08		 adc [$08],y
$0a:c1a3  74 6a		 stz $6a,x
$0a:c1a5  3c 7b 18	  bit $187b,x
$0a:c1a8  7e c3 81	  ror $81c3,x
$0a:c1ab  70 c8		 bvs $c175
$0a:c1ad  4c 24 06	  jmp $0624
$0a:c1b0  40			rti
$0a:c1b1  f0 50		 beq $c203
$0a:c1b3  05 a1		 ora $a1
$0a:c1b5  80 60		 bra $c217
$0a:c1b7  10 40		 bpl $c1f9
$0a:c1b9  38			sec
$0a:c1ba  12 02		 ora ($02)
$0a:c1bc  98			tya
$0a:c1bd  44 28 09	  mvp $09,$28
$0a:c1c0  82 4d 8c	  brl $4e10
$0a:c1c3  7a			ply
$0a:c1c4  02 33		 cop #$33
$0a:c1c6  08			php
$0a:c1c7  f4 38 62	  pea $6238
$0a:c1ca  10 f8		 bpl $c1c4
$0a:c1cc  24 0e		 bit $0e
$0a:c1ce  0d 03 80	  ora $8003
$0a:c1d1  c0 5b e1	  cpy #$e15b
$0a:c1d4  17 21		 ora [$21],y
$0a:c1d6  84 3a		 sty $3a
$0a:c1d8  23 00		 and $00,s
$0a:c1da  88			dey
$0a:c1db  c1 20		 cmp ($20,x)
$0a:c1dd  90 65		 bcc $c244
$0a:c1df  d0 2e		 bne $c20f
$0a:c1e1  c7 11		 cmp [$11]
$0a:c1e3  60			rts
$0a:c1e4  ec 40 0e	  cpx $0e40
$0a:c1e7  61 d0		 adc ($d0,x)
$0a:c1e9  90 58		 bcc $c243
$0a:c1eb  02 a1		 cop #$a1
$0a:c1ed  b0 f8		 bcs $c1e7
$0a:c1ef  7c 05 40	  jmp ($4005,x)
$0a:c1f2  5f 1b 41 38   eor $38411b,x
$0a:c1f6  5a			phy
$0a:c1f7  e1 e0		 sbc ($e0,x)
$0a:c1f9  6d 0b 70	  adc $700b
$0a:c1fc  63 f0		 adc $f0,s
$0a:c1fe  88			dey
$0a:c1ff  bc 12 1c	  ldy $1c12,x
$0a:c202  0d 02 e0	  ora $e002
$0a:c205  c3 17		 cmp $17,s
$0a:c207  00 4c		 brk #$4c
$0a:c209  18			clc
$0a:c20a  a4 82		 ldy $82
$0a:c20c  37 20		 and [$20],y
$0a:c20e  8c 0c 80	  sty $800c
$0a:c211  70 30		 bvs $c243
$0a:c213  32 e1		 and ($e1)
$0a:c215  40			rti
$0a:c216  3f 92 4e a5   and $a54e92,x
$0a:c21a  03 61		 ora $61,s
$0a:c21c  80 f8		 bra $c216
$0a:c21e  17 06		 ora [$06],y
$0a:c220  21 10		 and ($10,x)
$0a:c222  c0 1b 06	  cpy #$061b
$0a:c225  b9 0c da	  lda $da0c,y
$0a:c228  43 2e		 eor $2e,s
$0a:c22a  10 cf		 bpl $c1fb
$0a:c22c  80 90		 bra $c1be
$0a:c22e  21 06		 and ($06,x)
$0a:c230  20 2e 14	  jsr $142e
$0a:c233  6a			ror a
$0a:c234  06 07		 asl $07
$0a:c236  00 c8		 brk #$c8
$0a:c238  3e 50 b8	  rol $b850,x
$0a:c23b  51 c9		 eor ($c9),y
$0a:c23d  00 16		 brk #$16
$0a:c23f  0b			phd
$0a:c240  84 13		 sty $13
$0a:c242  a4 e1		 ldy $e1
$0a:c244  08			php
$0a:c245  e9 38 50	  sbc #$5038
$0a:c248  c8			iny
$0a:c249  71 c0		 adc ($c0),y
$0a:c24b  1e 40 46	  asl $4640,x
$0a:c24e  78			sei
$0a:c24f  04 22		 tsb $22
$0a:c251  0c 74 03	  tsb $0374
$0a:c254  a4 a3		 ldy $a3
$0a:c256  7d 3d cf	  adc $cf3d,x
$0a:c259  20 37 e4	  jsr $e437
$0a:c25c  20 fd b2	  jsr $b2fd
$0a:c25f  0f 05 00 cb   ora $cb0005
$0a:c263  04 b1		 tsb $b1
$0a:c265  14 83		 trb $83
$0a:c267  4a			lsr a
$0a:c268  c8			iny
$0a:c269  ce 45 08	  dec $0845
$0a:c26c  74 2e		 stz $2e,x
$0a:c26e  0e 44 05	  asl $0544
$0a:c271  f8			sed
$0a:c272  3c 1e 19	  bit $191e,x
$0a:c275  30 82		 bmi $c1f9
$0a:c277  5e 21 85	  lsr $8521,x
$0a:c27a  12 15		 ora ($15)
$0a:c27c  1e 01 bc	  asl $bc01,x
$0a:c27f  1a			inc a
$0a:c280  0e 00 58	  asl $5800
$0a:c283  24 00		 bit $00
$0a:c285  f8			sed
$0a:c286  b0 46		 bcs $c2ce
$0a:c288  28			plp
$0a:c289  13 cb		 ora ($cb,s),y
$0a:c28b  04 79		 tsb $79
$0a:c28d  df e3 07 82   cmp $8207e3,x
$0a:c291  02 83		 cop #$83
$0a:c293  f1 04		 sbc ($04),y
$0a:c295  07 71		 ora [$71]
$0a:c297  d9 c4 e3	  cmp $e3c4,y
$0a:c29a  10 a0		 bpl $c23c
$0a:c29c  4e 05 60	  lsr $6005
$0a:c29f  a5 88		 lda $88
$0a:c2a1  74 22		 stz $22,x
$0a:c2a3  3d 13 8f	  and $8f13,x
$0a:c2a6  bf 9c 46 10   lda $10469c,x
$0a:c2aa  bb			tyx
$0a:c2ab  84 52		 sty $52
$0a:c2ad  c1 0c		 cmp ($0c,x)
$0a:c2af  b0 39		 bcs $c2ea
$0a:c2b1  ab			plb
$0a:c2b2  81 80		 sta ($80,x)
$0a:c2b4  f0 07		 beq $c2bd
$0a:c2b6  9c 4a 54	  stz $544a
$0a:c2b9  08			php
$0a:c2ba  05 41		 ora $41
$0a:c2bc  dd 90 89	  cmp $8990,x
$0a:c2bf  1c 91 ff	  trb $ff91
$0a:c2c2  20 80 88	  jsr $8880
$0a:c2c5  49 23 04	  eor #$0423
$0a:c2c8  f8			sed
$0a:c2c9  4d 8d 83	  eor $838d
$0a:c2cc  80 1e		 bra $c2ec
$0a:c2ce  9a			txs
$0a:c2cf  04 c2		 tsb $c2
$0a:c2d1  41 18		 eor ($18,x)
$0a:c2d3  75 80		 adc $80,x
$0a:c2d5  be a1 f1	  ldx $f1a1,y
$0a:c2d8  08			php
$0a:c2d9  3c 10 7f	  bit $7f10,x
$0a:c2dc  30 08		 bmi $c2e6
$0a:c2de  a0 8c 27	  ldy #$278c
$0a:c2e1  09 36 6d	  ora #$6d36
$0a:c2e4  87 c3		 sta [$c3]
$0a:c2e6  41 e0		 eor ($e0,x)
$0a:c2e8  b8			clv
$0a:c2e9  64 2b		 stz $2b
$0a:c2eb  04 f7		 tsb $f7
$0a:c2ed  35 04		 and $04,x
$0a:c2ef  22 20 2a 06   jsl $062a20
$0a:c2f3  f3 bd		 sbc ($bd,s),y
$0a:c2f5  c6 37		 dec $37
$0a:c2f7  0f 80 43 d9   ora $d94380
$0a:c2fb  20 c0 70	  jsr $70c0
$0a:c2fe  58			cli
$0a:c2ff  41 26		 eor ($26,x)
$0a:c301  10 8b		 bpl $c28e
$0a:c303  80 3e		 bra $c343
$0a:c305  3c 09 c0	  bit $c009,x
$0a:c308  0b			phd
$0a:c309  01 39		 ora ($39,x)
$0a:c30b  dc e3 1c	  jml [$1ce3]
$0a:c30e  a0 47 a6	  ldy #$a647
$0a:c311  10 e7		 bpl $c2fa
$0a:c313  18			clc
$0a:c314  41 c7		 eor ($c7,x)
$0a:c316  80 72		 bra $c38a
$0a:c318  18			clc
$0a:c319  24 32		 bit $32
$0a:c31b  17 09		 ora [$09],y
$0a:c31d  82 c1 20	  brl $e3e1
$0a:c320  50 65		 bvc $c387
$0a:c322  fc 1f 80	  jsr ($801f,x)
$0a:c325  6e 10 17	  ror $1710
$0a:c328  18			clc
$0a:c329  f0 02		 beq $c32d
$0a:c32b  c0 16 09	  cpy #$0916
$0a:c32e  02 58		 cop #$58
$0a:c330  38			sec
$0a:c331  16 0d		 asl $0d,x
$0a:c333  05 03		 ora $03
$0a:c335  e0 1f 64	  cpx #$641f
$0a:c338  80 aa		 bra $c2e4
$0a:c33a  20 e2 50	  jsr $50e2
$0a:c33d  78			sei
$0a:c33e  44 0e 1f	  mvp $1f,$0e
$0a:c341  02 87		 cop #$87
$0a:c343  42 0f		 wdm #$0f
$0a:c345  ce e3 24	  dec $24e3
$0a:c348  68			pla
$0a:c349  23 49		 and $49,s
$0a:c34b  1e 9c 09	  asl $099c,x
$0a:c34e  05 03		 ora $03
$0a:c350  c0 99 02	  cpy #$0299
$0a:c353  d8			cld
$0a:c354  37 b0		 and [$b0],y
$0a:c356  ce 10 99	  dec $9910
$0a:c359  c4 e2		 cpy $e2
$0a:c35b  31 26		 and ($26),y
$0a:c35d  87 4d		 sta [$4d]
$0a:c35f  65 71		 adc $71
$0a:c361  09 82 05	  ora #$0582
$0a:c364  25 5c		 and $5c
$0a:c366  49 44 1e	  eor #$1e44
$0a:c369  7d 01 99	  adc $9901,x
$0a:c36c  cc 00 c0	  cpy $c000
$0a:c36f  81 49		 sta ($49,x)
$0a:c371  83 c0		 sta $c0,s
$0a:c373  26 1c		 rol $1c
$0a:c375  8f 05 63 51   sta $516305
$0a:c379  10 8c		 bpl $c307
$0a:c37b  20 53 51	  jsr $5153
$0a:c37e  46 94		 lsr $94
$0a:c380  70 3f		 bvs $c3c1
$0a:c382  10 0c		 bpl $c390
$0a:c384  c4 60		 cpy $60
$0a:c386  4c 08 14	  jmp $1408
$0a:c389  84 c6		 sty $c6
$0a:c38b  2d 15 89	  and $8915
$0a:c38e  34 fa		 bit $fa,x
$0a:c390  8b			phb
$0a:c391  6b			rtl
$0a:c392  a0 58 10	  ldy #$1058
$0a:c395  29 0a b2	  and #$b20a
$0a:c398  46 20		 lsr $20
$0a:c39a  f4 e8 0d	  pea $0de8
$0a:c39d  8e c0 46	  stx $46c0
$0a:c3a0  02 fa		 cop #$fa
$0a:c3a2  a5 82		 lda $82
$0a:c3a4  61 d8		 adc ($d8,x)
$0a:c3a6  fc 50 34	  jsr ($3450,x)
$0a:c3a9  10 43		 bpl $c3ee
$0a:c3ab  b0 c2		 bcs $c36f
$0a:c3ad  21 8e		 and ($8e,x)
$0a:c3af  b1 ae		 lda ($ae),y
$0a:c3b1  48			pha
$0a:c3b2  39 9c 48	  and $489c,y
$0a:c3b5  06 32		 asl $32
$0a:c3b7  00 5c		 brk #$5c
$0a:c3b9  08			php
$0a:c3ba  61 a4		 adc ($a4,x)
$0a:c3bc  5d 21 73	  eor $7321,x
$0a:c3bf  90 48		 bcc $c409
$0a:c3c1  aa			tax
$0a:c3c2  10 e8		 bpl $c3ac
$0a:c3c4  c1 64		 cmp ($64,x)
$0a:c3c6  21 70		 and ($70,x)
$0a:c3c8  f8			sed
$0a:c3c9  0b			phd
$0a:c3ca  34 e8		 bit $e8,x
$0a:c3cc  94 8b		 sty $8b,x
$0a:c3ce  ad a2 31	  lda $31a2
$0a:c3d1  01 86		 ora ($86,x)
$0a:c3d3  40			rti
$0a:c3d4  e0 6a 06	  cpx #$066a
$0a:c3d7  a0 70 30	  ldy #$3070
$0a:c3da  16 09		 asl $09,x
$0a:c3dc  07 c3		 ora [$c3]
$0a:c3de  a1 dc		 lda ($dc,x)
$0a:c3e0  f2 5a		 sbc ($5a)
$0a:c3e2  30 02		 bmi $c3e6
$0a:c3e4  60			rts
$0a:c3e5  0b			phd
$0a:c3e6  86 02		 stx $02
$0a:c3e8  71 00		 adc ($00),y
$0a:c3ea  9e 48 33	  stz $3348,x
$0a:c3ed  9d 08 67	  sta $6708,x
$0a:c3f0  20 cc 22	  jsr $22cc
$0a:c3f3  61 20		 adc ($20,x)
$0a:c3f5  84 12		 sty $12
$0a:c3f7  0b			phd
$0a:c3f8  03 85		 ora $85,s
$0a:c3fa  c1 e0		 cmp ($e0,x)
$0a:c3fc  b0 c8		 bcs $c3c6
$0a:c3fe  74 0a		 stz $0a,x
$0a:c400  05 05		 ora $05
$0a:c402  80 c0		 bra $c3c4
$0a:c404  8f 41 04 9c   sta $9c0441
$0a:c408  40			rti
$0a:c409  58			cli
$0a:c40a  01 30		 ora ($30,x)
$0a:c40c  43 81		 eor $81,s
$0a:c40e  e8			inx
$0a:c40f  0f 47 00 d8   ora $d80047
$0a:c413  5c 26 09 01   jml $010926
$0a:c417  f0 01		 beq $c41a
$0a:c419  87 41		 sta [$41]
$0a:c41b  c0 e0 48	  cpy #$48e0
$0a:c41e  38			sec
$0a:c41f  10 0a		 bpl $c42b
$0a:c421  04 02		 tsb $02
$0a:c423  a1 80		 lda ($80,x)
$0a:c425  d8			cld
$0a:c426  40			rti
$0a:c427  3e 13 07	  rol $0713,x
$0a:c42a  28			plp
$0a:c42b  37 40		 and [$40],y
$0a:c42d  f6 50		 inc $50,x
$0a:c42f  38			sec
$0a:c430  34 1a		 bit $1a,x
$0a:c432  15 5b		 ora $5b,x
$0a:c434  bb			tyx
$0a:c435  cd e4 11	  cmp $11e4
$0a:c438  00 70		 brk #$70
$0a:c43a  4c 22 13	  jmp $1322
$0a:c43d  03 d8		 ora $d8,s
$0a:c43f  41 2f		 eor ($2f,x)
$0a:c441  10 ab		 bpl $c3ee
$0a:c443  8d 1e 00	  sta $001e
$0a:c446  f7 17		 sbc [$17],y
$0a:c448  c0 b5 80	  cpy #$80b5
$0a:c44b  f6 19		 inc $19,x
$0a:c44d  8a			txa
$0a:c44e  c4 42		 cpy $42
$0a:c450  29 7c b6	  and #$b67c
$0a:c453  59 0c a0	  eor $a00c,y
$0a:c456  17 5a		 ora [$5a],y
$0a:c458  84 82		 sty $82
$0a:c45a  39 e4 be	  and $bee4,y
$0a:c45d  67 31		 adc [$31]
$0a:c45f  85 c1		 sta $c1
$0a:c461  0b			phd
$0a:c462  a4 1e		 ldy $1e
$0a:c464  1d 28 8c	  ora $8c28,x
$0a:c467  5d ad d2	  eor $d2ad,x
$0a:c46a  c8			iny
$0a:c46b  1d 81 26	  ora $2681,x
$0a:c46e  16 03		 asl $03,x
$0a:c470  d9 43 3e	  cmp $3e43,y
$0a:c473  11 8a		 ora ($8a),y
$0a:c475  3c 3a 03	  bit $033a,x
$0a:c478  63 80		 adc $80,s
$0a:c47a  0d c0 6e	  ora $6ec0
$0a:c47d  07 b2		 ora [$b2]
$0a:c47f  ea			nop
$0a:c480  57 23		 eor [$23],y
$0a:c482  91 8b		 sta ($8b),y
$0a:c484  25 c2		 and $c2
$0a:c486  f9 8c 3a	  sbc $3a8c,y
$0a:c489  80 5d		 bra $c4e8
$0a:c48b  23 12		 and $12,s
$0a:c48d  08			php
$0a:c48e  a7 82		 lda [$82]
$0a:c490  f9 80 12	  sbc $1280,y
$0a:c493  81 98		 sta ($98,x)
$0a:c495  02 e9		 cop #$e9
$0a:c497  1e 80 4f	  asl $4f80,x
$0a:c49a  60			rts
$0a:c49b  73 f3		 adc ($f3,s),y
$0a:c49d  90 40		 bcc $c4df
$0a:c49f  23 ee		 and $ee,s
$0a:c4a1  e0 64 24	  cpx #$2464
$0a:c4a4  0d 76 0c	  ora $0c76
$0a:c4a7  50 42		 bvc $c4eb
$0a:c4a9  46 e2		 lsr $e2
$0a:c4ab  81 9c		 sta ($9c,x)
$0a:c4ad  f0 7f		 beq $c52e
$0a:c4af  30 1f		 bmi $c4d0
$0a:c4b1  87 20		 sta [$20]
$0a:c4b3  40			rti
$0a:c4b4  1b			tcs
$0a:c4b5  a1 80		 lda ($80,x)
$0a:c4b7  2d 8d 02	  and $028d
$0a:c4ba  01 a0		 ora ($a0,x)
$0a:c4bc  4d 18 5d	  eor $5d18
$0a:c4bf  a3 f0		 lda $f0,s
$0a:c4c1  98			tya
$0a:c4c2  ac 38 ee	  ldy $ee38
$0a:c4c5  07 70		 ora [$70]
$0a:c4c7  87 9e		 sta [$9e]
$0a:c4c9  04 b6		 tsb $b6
$0a:c4cb  50 88		 bvc $c455
$0a:c4cd  24 39		 bit $39
$0a:c4cf  09 25 b0	  ora #$b025
$0a:c4d2  bc 50 37	  ldy $3750,x
$0a:c4d5  98			tya
$0a:c4d6  0c e5 82	  tsb $82e5
$0a:c4d9  f9 e0 fc	  sbc $fce0,y
$0a:c4dc  58			cli
$0a:c4dd  3c 0c 93	  bit $930c,x
$0a:c4e0  4d 86 02	  eor $0286
$0a:c4e3  81 20		 sta ($20,x)
$0a:c4e5  e0 36 40	  cpx #$4036
$0a:c4e8  74 62		 stz $62,x
$0a:c4ea  a4 5b		 ldy $5b
$0a:c4ec  0c 1e 10	  tsb $101e
$0a:c4ef  f6 08		 inc $08,x
$0a:c4f1  3c 09 f2	  bit $f209,x
$0a:c4f4  10 b8		 bpl $c4ae
$0a:c4f6  53 a6		 eor ($a6,s),y
$0a:c4f8  0d 00 68	  ora $6800
$0a:c4fb  08			php
$0a:c4fc  21 6c		 and ($6c,x)
$0a:c4fe  53 20		 eor ($20,s),y
$0a:c500  d9 0e 04	  cmp $040e,y
$0a:c503  80 2c		 bra $c531
$0a:c505  1c 0c 00	  trb $000c
$0a:c508  64 34		 stz $34
$0a:c50a  0a			asl a
$0a:c50b  10 53		 bpl $c560
$0a:c50d  aa			tax
$0a:c50e  64 07		 stz $07
$0a:c510  40			rti
$0a:c511  e7 04		 sbc [$04]
$0a:c513  f8			sed
$0a:c514  3b			tsc
$0a:c515  da			phx
$0a:c516  17 0b		 ora [$0b],y
$0a:c518  82 c0 21	  brl $e6db
$0a:c51b  af 80 83 29   lda $298380
$0a:c51f  d8			cld
$0a:c520  1a			inc a
$0a:c521  0c 10 1f	  tsb $1f10
$0a:c524  22 64 02 68   jsl $680264
$0a:c528  1d 02 c9	  ora $c902,x
$0a:c52b  07 e0		 ora [$e0]
$0a:c52d  5a			phy
$0a:c52e  06 92		 asl $92
$0a:c530  77 b4		 adc [$b4],y
$0a:c532  2a			rol a
$0a:c533  15 09		 ora $09,x
$0a:c535  85 40		 sta $40
$0a:c537  df 42 da 35   cmp $35da42,x
$0a:c53b  d8			cld
$0a:c53c  8e 40 1a	  stx $1a40
$0a:c53f  00 92		 brk #$92
$0a:c541  27 c0		 and [$c0]
$0a:c543  70 13		 bvs $c558
$0a:c545  22 e7 71 3a   jsl $3a71e7
$0a:c549  39 c8 e2	  and $e2c8,y
$0a:c54c  cf d0 3d fa   cmp $fa3dd0
$0a:c550  32 c3		 and ($c3)
$0a:c552  a1 c0		 lda ($c0,x)
$0a:c554  f0 36		 beq $c58c
$0a:c556  c0 bf 40	  cpy #$40bf
$0a:c559  16 39		 asl $39,x
$0a:c55b  9c 2e 03	  stz $032e
$0a:c55e  08			php
$0a:c55f  83 43		 sta $43,s
$0a:c561  20 84 70	  jsr $7084
$0a:c564  20 38 f8	  jsr $f838
$0a:c567  20 60 a1	  jsr $a160
$0a:c56a  27 b3		 and [$b3]
$0a:c56c  6c 0b a1	  jmp ($a10b)
$0a:c56f  e0 b0 70	  cpx #$70b0
$0a:c572  13 ce		 ora ($ce,s),y
$0a:c574  c3 07		 cmp $07,s
$0a:c576  4d 3c c6	  eor $c63c
$0a:c579  1f 08 84 c2   ora $c28408,x
$0a:c57d  61 10		 adc ($10,x)
$0a:c57f  d8			cld
$0a:c580  40			rti
$0a:c581  7e 01 20	  ror $2001,x
$0a:c584  49 23 29	  eor #$2923
$0a:c587  24 c3		 bit $c3
$0a:c589  c0 d7 1e	  cpy #$1ed7
$0a:c58c  87 42		 sta [$42]
$0a:c58e  61 f0		 adc ($f0,x)
$0a:c590  b8			clv
$0a:c591  60			rts
$0a:c592  04 31		 tsb $31
$0a:c594  20 61 8e	  jsr $8e61
$0a:c597  00 52		 brk #$52
$0a:c599  63 14		 adc $14,s
$0a:c59b  82 43 17	  brl $dce1
$0a:c59e  23 12		 and $12,s
$0a:c5a0  0f c0 2c 19   ora $192cc0
$0a:c5a4  24 e3		 bit $e3
$0a:c5a6  42 99		 wdm #$99
$0a:c5a8  44 22 14	  mvp $14,$22
$0a:c5ab  8e 47 52	  stx $5247
$0a:c5ae  70 1f		 bvs $c5cf
$0a:c5b0  80 98		 bra $c54a
$0a:c5b2  4c 05 93	  jmp $9305
$0a:c5b5  05 86		 ora $86
$0a:c5b7  8e ca 07	  stx $07ca
$0a:c5ba  0a			asl a
$0a:c5bb  7f b4 08 90   adc $9008b4,x
$0a:c5bf  6f e2 73 81   adc $8173e2
$0a:c5c3  4c 83 20	  jmp $2083
$0a:c5c6  d7 2a		 cmp [$2a],y
$0a:c5c8  00 4c		 brk #$4c
$0a:c5ca  04 4e		 tsb $4e
$0a:c5cc  e7 20		 sbc [$20]
$0a:c5ce  18			clc
$0a:c5cf  41 60		 eor ($60,x)
$0a:c5d1  d1 b8		 cmp ($b8),y
$0a:c5d3  14 ce		 trb $ce
$0a:c5d5  19 3d 87	  ora $873d,y
$0a:c5d8  4f e1 91 f1   eor $f191e1
$0a:c5dc  80 b0		 bra $c58e
$0a:c5de  ce 09 08	  dec $0809
$0a:c5e1  83 43		 sta $43,s
$0a:c5e3  91 8a		 sta ($8a),y
$0a:c5e5  27 1e		 and [$1e]
$0a:c5e7  06 c3		 asl $c3
$0a:c5e9  01 98		 ora ($98,x)
$0a:c5eb  b0 5e		 bcs $c64b
$0a:c5ed  3c 1f 8b	  bit $8b1f,x
$0a:c5f0  07 c1		 ora [$c1]
$0a:c5f2  a0 28 52	  ldy #$5228
$0a:c5f5  36 84		 rol $84,x
$0a:c5f7  83 80		 sta $80,s
$0a:c5f9  53 0b		 eor ($0b,s),y
$0a:c5fb  02 09		 cop #$09
$0a:c5fd  a0 4f 10	  ldy #$104f
$0a:c600  7b			tdc
$0a:c601  84 fd		 sty $fd
$0a:c603  ec 10 07	  cpx $0710
$0a:c606  c8			iny
$0a:c607  2d 40 0a	  and $0a40
$0a:c60a  08			php
$0a:c60b  b0 00		 bcs $c60d
$0a:c60d  84 32		 sty $32
$0a:c60f  04 05		 tsb $05
$0a:c611  02 fb		 cop #$fb
$0a:c613  f0 22		 beq $c637
$0a:c615  1e 00 a9	  asl $a900,x
$0a:c618  7e 20 01	  ror $0120,x
$0a:c61b  96 d0		 stx $d0,y
$0a:c61d  37 46		 and [$46],y
$0a:c61f  c0 7f 78	  cpy #$787f
$0a:c622  3c 0a 3f	  bit $3f0a,x
$0a:c625  0a			asl a
$0a:c626  9e c1 a7	  stz $a7c1,x
$0a:c629  70 23		 bvs $c64e
$0a:c62b  98			tya
$0a:c62c  44 61 d0	  mvp $d0,$61
$0a:c62f  d8			cld
$0a:c630  74 3a		 stz $3a,x
$0a:c632  18			clc
$0a:c633  07 06		 ora [$06]
$0a:c635  69 00 41	  adc #$4100
$0a:c638  90 10		 bcc $c64a
$0a:c63a  a8			tay
$0a:c63b  20 14 83	  jsr $8314
$0a:c63e  20 57 04	  jsr $0457
$0a:c641  89 06 41	  bit #$4106
$0a:c644  bc e9 eb	  ldy $ebe9,x
$0a:c647  8a			txa
$0a:c648  c2 8e		 rep #$8e
$0a:c64a  a1 3f		 lda ($3f,x)
$0a:c64c  82 4c 61	  brl $279b
$0a:c64f  d1 d8		 cmp ($d8),y
$0a:c651  74 3c		 stz $3c,x
$0a:c653  0e 63 f2	  asl $f263
$0a:c656  43 b3		 eor $b3,s
$0a:c658  f4 a6 1c	  pea $1ca6
$0a:c65b  04 8b		 tsb $8b
$0a:c65d  06 d0		 asl $d0
$0a:c65f  36 89		 rol $89,x
$0a:c661  e8			inx
$0a:c662  86 c0		 stx $c0
$0a:c664  e3 90		 sbc $90,s
$0a:c666  29 f3 c8	  and #$c8f3
$0a:c669  20 33 d8	  jsr $d833
$0a:c66c  1c 7e 03	  trb $037e
$0a:c66f  03 0e		 ora $0e,s
$0a:c671  1c 04 80	  trb $8004
$0a:c674  00 10		 brk #$10
$0a:c676  81 be		 sta ($be,x)
$0a:c678  c0 02 05	  cpy #$0502
$0a:c67b  d4 48		 pei ($48)
$0a:c67d  95 e3		 sta $e3,x
$0a:c67f  01 f8		 ora ($f8,x)
$0a:c681  c0 78 30	  cpy #$3078
$0a:c684  18			clc
$0a:c685  02 33		 cop #$33
$0a:c687  86 c0		 stx $c0
$0a:c689  4a			lsr a
$0a:c68a  44 a2 89	  mvp $89,$a2
$0a:c68d  ac 04 e6	  ldy $e604
$0a:c690  0b			phd
$0a:c691  5f 63 3d e3   eor $e33d63,x
$0a:c695  81 7c		 sta ($7c,x)
$0a:c697  c0 7f 02	  cpy #$027f
$0a:c69a  42 99		 wdm #$99
$0a:c69c  00 da		 brk #$da
$0a:c69e  37 c0		 and [$c0],y
$0a:c6a0  37 0c		 and [$0c],y
$0a:c6a2  a2 94 c0	  ldx #$c094
$0a:c6a5  a4 f0		 ldy $f0
$0a:c6a7  4b			phk
$0a:c6a8  7c 83 7f	  jmp ($7f83,x)
$0a:c6ab  60			rts
$0a:c6ac  f7 dc		 sbc [$dc],y
$0a:c6ae  3f d6 0b 83   and $830bd6,x
$0a:c6b2  28			plp
$0a:c6b3  63 90		 adc $90,s
$0a:c6b5  08			php
$0a:c6b6  c4 02		 cpy $02
$0a:c6b8  41 10		 eor ($10,x)
$0a:c6ba  a0 4c 0f	  ldy #$0f4c
$0a:c6bd  61 60		 adc ($60,x)
$0a:c6bf  65 1f		 adc $1f
$0a:c6c1  5a			phy
$0a:c6c2  59 c2 9f	  eor $9fc2,y
$0a:c6c5  7f a0 05 30   adc $3005a0,x
$0a:c6c9  2b			pld
$0a:c6ca  83 a5		 sta $a5,s
$0a:c6cc  24 91		 bit $91
$0a:c6ce  89 f3 82	  bit #$82f3
$0a:c6d1  c5 e7		 cmp $e7
$0a:c6d3  0e 91 c7	  asl $c791
$0a:c6d6  a3 f0		 lda $f0,s
$0a:c6d8  08			php
$0a:c6d9  79 0c 07	  adc $070c,y
$0a:c6dc  8b			phb
$0a:c6dd  0c 81 44	  tsb $4481
$0a:c6e0  9c cf b0	  stz $b0cf
$0a:c6e3  c0 6f 2e	  cpy #$2e6f
$0a:c6e6  10 cf		 bpl $c6b7
$0a:c6e8  81 4c		 sta ($4c,x)
$0a:c6ea  8b			phb
$0a:c6eb  e0 21 34	  cpx #$3421
$0a:c6ee  28			plp
$0a:c6ef  70 3e		 bvs $c72f
$0a:c6f1  01 e5		 ora ($e5,x)
$0a:c6f3  75 74		 adc $74,x
$0a:c6f5  1d f4 03	  ora $03f4,x
$0a:c6f8  f0 75		 beq $c76f
$0a:c6fa  b8			clv
$0a:c6fb  fc 20 93	  jsr ($9320,x)
$0a:c6fe  88			dey
$0a:c6ff  1d e0 c5	  ora $c5e0,x
$0a:c702  54 0c 07	  mvn $07,$0c
$0a:c705  0a			asl a
$0a:c706  84 11		 sty $11
$0a:c708  90 d0		 bcc $c6da
$0a:c70a  4e 30 53	  lsr $5330
$0a:c70d  c3 15		 cmp $15,s
$0a:c70f  3e fe f0	  rol $f0fe,x
$0a:c712  0d ee 00	  ora $00ee
$0a:c715  a4 04		 ldy $04
$0a:c717  17 80		 ora [$80],y
$0a:c719  17 2c		 ora [$2c],y
$0a:c71b  40			rti
$0a:c71c  ea			nop
$0a:c71d  0b			phd
$0a:c71e  e1 82		 sbc ($82,x)
$0a:c720  c2 a9		 rep #$a9
$0a:c722  f5 c3		 sbc $c3,x
$0a:c724  7c de 21	  jmp ($21de,x)
$0a:c727  97 0a		 sta [$0a],y
$0a:c729  dc 81 45	  jml [$4581]
$0a:c72c  5e 09 01	  lsr $0109,x
$0a:c72f  76 84		 ror $84,x
$0a:c731  e5 80		 sbc $80
$0a:c733  98			tya
$0a:c734  23 ea		 and $ea,s
$0a:c736  1f 08 82 bf   ora $bf8208,x
$0a:c73a  a5 00		 lda $00
$0a:c73c  0f e0 81 c6   ora $c681e0
$0a:c740  06 31		 asl $31
$0a:c742  20 90 75	  jsr $7590
$0a:c745  26 9c		 rol $9c
$0a:c747  8a			txa
$0a:c748  c0 c5 e7	  cpy #$e7c5
$0a:c74b  96 08		 stx $08,y
$0a:c74d  e5 d2		 sbc $d2
$0a:c74f  11 98		 ora ($98),y
$0a:c751  47 5a		 eor [$5a]
$0a:c753  ec 07 b4	  cpx $b407
$0a:c756  c9 eb 04	  cmp #$04eb
$0a:c759  82 c1 b0	  brl $781d
$0a:c75c  f2 5d		 sbc ($5d)
$0a:c75e  0a			asl a
$0a:c75f  33 1c		 and ($1c,s),y
$0a:c761  a8			tay
$0a:c762  43 36		 eor $36,s
$0a:c764  90 84		 bcc $c6ea
$0a:c766  7d 41 c7	  adc $c741,x
$0a:c769  40			rti
$0a:c76a  fe 97 f0	  inc $f097,x
$0a:c76d  41 27		 eor ($27,x)
$0a:c76f  10 3b		 bpl $c7ac
$0a:c771  c2 7e		 rep #$7e
$0a:c773  f0 1c		 beq $c791
$0a:c775  2a			rol a
$0a:c776  10 7e		 bpl $c7f6
$0a:c778  45 01		 eor $01
$0a:c77a  38			sec
$0a:c77b  c1 4f		 cmp ($4f,x)
$0a:c77d  06 e9		 asl $e9
$0a:c77f  0f 1d 04 22   ora $22041d
$0a:c783  17 09		 ora [$09],y
$0a:c785  84 c2		 sty $c2
$0a:c787  a0 70 a0	  ldy #$a070
$0a:c78a  0c 41 89	  tsb $8941
$0a:c78d  04 f6		 tsb $f6
$0a:c78f  3e 04 03	  rol $0304,x
$0a:c792  c0 92 09	  cpy #$0992
$0a:c795  05 00		 ora $00
$0a:c797  32 1c		 and ($1c)
$0a:c799  04 a8		 tsb $a8
$0a:c79b  00 63		 brk #$63
$0a:c79d  00 30		 brk #$30
$0a:c79f  b3 a9		 lda ($a9,s),y
$0a:c7a1  1e 82 1f	  asl $1f82,x
$0a:c7a4  0c 7f d2	  tsb $d27f
$0a:c7a7  24 00		 bit $00
$0a:c7a9  6c 93 4e	  jmp ($4e93)
$0a:c7ac  05 83		 ora $83
$0a:c7ae  40			rti
$0a:c7af  69 06 fe	  adc #$fe06
$0a:c7b2  d2 a9		 cmp ($a9)
$0a:c7b4  f2 09		 sbc ($09)
$0a:c7b6  c4 d2		 cpy $d2
$0a:c7b8  39 27 87	  and $8727,y
$0a:c7bb  cb			wai
$0a:c7bc  26 71		 rol $71
$0a:c7be  08			php
$0a:c7bf  82 c0 a9	  brl $7182
$0a:c7c2  93 08		 sta ($08,s),y
$0a:c7c4  44 1e 59	  mvp $59,$1e
$0a:c7c7  03 9f		 ora $9f,s
$0a:c7c9  c0 26 73	  cpy #$7326
$0a:c7cc  07 ca		 ora [$ca]
$0a:c7ce  69 3c 90	  adc #$903c
$0a:c7d1  89 c5 e2	  bit #$e2c5
$0a:c7d4  e1 c8		 sbc ($c8,x)
$0a:c7d6  f0 4a		 beq $c822
$0a:c7d8  3b			tsc
$0a:c7d9  0f 94 b2 46   ora $46b294
$0a:c7dd  26 1c		 rol $1c
$0a:c7df  0b			phd
$0a:c7e0  46 03		 lsr $03
$0a:c7e2  f1 00		 sbc ($00),y
$0a:c7e4  ec 46 1f	  cpx $1f46
$0a:c7e7  29 0a 87	  and #$870a
$0a:c7ea  bc 42 29	  ldy $2942,x
$0a:c7ed  1c 83 c3	  trb $c383
$0a:c7f0  e0 90 35	  cpx #$3590
$0a:c7f3  0a			asl a
$0a:c7f4  43 00		 eor $00,s
$0a:c7f6  03 0c		 ora $0c,s
$0a:c7f8  81 9d		 sta ($9d,x)
$0a:c7fa  40			rti
$0a:c7fb  70 b0		 bvs $c7ad
$0a:c7fd  0d 07 82	  ora $8207
$0a:c800  09 3c b6	  ora #$b63c
$0a:c803  5e 38 9f	  lsr $9f38,x
$0a:c806  09 27 30	  ora #$3027
$0a:c809  7c 0b 02	  jmp ($020b,x)
$0a:c80c  b0 47		 bcs $c855
$0a:c80e  13 61		 ora ($61,s),y
$0a:c810  64 c0		 stz $c0
$0a:c812  7b			tdc
$0a:c813  20 1c c8	  jsr $c81c
$0a:c816  61 a0		 adc ($a0,x)
$0a:c818  16 05		 asl $05,x
$0a:c81a  2a			rol a
$0a:c81b  9d c2 23	  sta $23c2,x
$0a:c81e  10 68		 bpl $c888
$0a:c820  71 10		 adc ($10),y
$0a:c822  16 a0		 asl $a0,x
$0a:c824  a1 49		 lda ($49,x)
$0a:c826  d4 12		 pei ($12)
$0a:c828  31 07		 and ($07),y
$0a:c82a  87 40		 sta [$40]
$0a:c82c  56 e0		 lsr $e0,x
$0a:c82e  a1 7e		 lda ($7e,x)
$0a:c830  02 3c		 cop #$3c
$0a:c832  3a			dec a
$0a:c833  1f 0e 07 e3   ora $e3070e,x
$0a:c837  f0 28		 beq $c861
$0a:c839  08			php
$0a:c83a  c1 c4		 cmp ($c4,x)
$0a:c83c  16 01		 asl $01,x
$0a:c83e  40			rti
$0a:c83f  9c 70 27	  stz $2770
$0a:c842  9f 08 63 54   sta $546308,x
$0a:c846  18			clc
$0a:c847  c1 18		 cmp ($18,x)
$0a:c849  54 8b 18	  mvn $18,$8b
$0a:c84c  20 50 28	  jsr $2850
$0a:c84f  24 1a		 bit $1a
$0a:c851  b7 57		 lda [$57],y
$0a:c853  87 ce		 sta [$ce]
$0a:c855  e3 e8		 sbc $e8,s
$0a:c857  85 81		 sta $81
$0a:c859  4f 60 d7 9a   eor $9ad760
$0a:c85d  bc 80 8e	  ldy $8e80,x
$0a:c860  c8			iny
$0a:c861  80 7c		 bra $c8df
$0a:c863  84 c2		 sty $c2
$0a:c865  61 e0		 adc ($e0,x)
$0a:c867  f0 68		 beq $c8d1
$0a:c869  38			sec
$0a:c86a  0a			asl a
$0a:c86b  52 44		 eor ($44)
$0a:c86d  1f 80 c2 1e   ora $1ec280,x
$0a:c871  08			php
$0a:c872  03 5d		 ora $5d,s
$0a:c874  e0 10 68	  cpx #$6810
$0a:c877  1c 0a 0d	  trb $0d0a
$0a:c87a  16 8f		 asl $8f,x
$0a:c87c  41 e7		 eor ($e7,x)
$0a:c87e  f3 f9		 sbc ($f9,s),y
$0a:c880  83 40		 sta $40,s
$0a:c882  24 13		 bit $13
$0a:c884  04 40		 tsb $40
$0a:c886  ce 18 21	  dec $2118
$0a:c889  1e b0 9d	  asl $9db0,x
$0a:c88c  c9 a2 0d	  cmp #$0da2
$0a:c88f  10 44		 bpl $c8d5
$0a:c891  06 23		 asl $23
$0a:c893  21 30		 and ($30,x)
$0a:c895  9c 78 3e	  stz $3e78
$0a:c898  18			clc
$0a:c899  0f 03 5d b3   ora $b35d03
$0a:c89d  16 89		 asl $89,x
$0a:c89f  c7 23		 cmp [$23]
$0a:c8a1  e0 df 06	  cpx #$06df
$0a:c8a4  33 d2		 and ($d2,s),y
$0a:c8a6  a9 f2 09	  lda #$09f2
$0a:c8a9  c4 92		 cpy $92
$0a:c8ab  19 27 8f	  ora $8f27,y
$0a:c8ae  cb			wai
$0a:c8af  26 6f		 rol $6f
$0a:c8b1  a0 44 15	  ldy #$1544
$0a:c8b4  32 61		 and ($61)
$0a:c8b6  08			php
$0a:c8b7  83 cf		 sta $cf,s
$0a:c8b9  20 72 f9	  jsr $f972
$0a:c8bc  00 e0		 brk #$e0
$0a:c8be  01 64		 ora ($64,x)
$0a:c8c0  88			dey
$0a:c8c1  0d 27 92	  ora $9227
$0a:c8c4  11 38		 ora ($38),y
$0a:c8c6  b0 5c		 bcs $c924
$0a:c8c8  3b			tsc
$0a:c8c9  1e 89 07	  asl $0789,x
$0a:c8cc  41 10		 eor ($10,x)
$0a:c8ce  96 48		 stx $48,y
$0a:c8d0  c4 c3		 cpy $c3
$0a:c8d2  81 78		 sta ($78,x)
$0a:c8d4  c0 25 c3	  cpy #$c325
$0a:c8d7  a1 10		 lda ($10,x)
$0a:c8d9  44 24 72	  mvp $72,$24
$0a:c8dc  0b			phd
$0a:c8dd  39 82 cf	  and $cf82,y
$0a:c8e0  60			rts
$0a:c8e1  73 e8		 adc ($e8,s),y
$0a:c8e3  3c 6e 0e	  bit $0e6e,x
$0a:c8e6  05 25		 ora $25
$0a:c8e8  68			pla
$0a:c8e9  c0 20 27	  cpy #$2720
$0a:c8ec  f0 81		 beq $c86f
$0a:c8ee  c1 a0		 cmp ($a0,x)
$0a:c8f0  27 94		 and [$94]
$0a:c8f2  14 07		 trb $07
$0a:c8f4  c2 01		 rep #$01
$0a:c8f6  f8			sed
$0a:c8f7  48			pha
$0a:c8f8  16 02		 asl $02,x
$0a:c8fa  e0 15 01	  cpx #$0115
$0a:c8fd  42 8a		 wdm #$8a
$0a:c8ff  0b			phd
$0a:c900  00 a4		 brk #$a4
$0a:c902  11 42		 ora ($42),y
$0a:c904  46 21		 lsr $21
$0a:c906  73 38		 adc ($38,s),y
$0a:c908  54 f2 0d	  mvn $0d,$f2
$0a:c90b  3e 80 c7	  rol $c780,x
$0a:c90e  e0 30 31	  cpx #$3130
$0a:c911  41 c1		 eor ($c1,x)
$0a:c913  17 c2		 ora [$c2],y
$0a:c915  80 06		 bra $c91d
$0a:c917  11 a2		 ora ($a2),y
$0a:c919  9e f0 62	  stz $62f0,x
$0a:c91c  0e 06 c3	  asl $c306
$0a:c91f  80 25		 bra $c946
$0a:c921  8a			txa
$0a:c922  06 00		 asl $00
$0a:c924  2e 01 76	  rol $7601
$0a:c927  14 10		 trb $10
$0a:c929  14 21		 trb $21
$0a:c92b  ef 20 84 42   sbc $428420
$0a:c92f  e1 30		 sbc ($30,x)
$0a:c931  38			sec
$0a:c932  24 0d		 bit $0d
$0a:c934  04 0d		 tsb $0d
$0a:c936  a7 83		 lda [$83]
$0a:c938  40			rti
$0a:c939  21 10		 and ($10,x)
$0a:c93b  08			php
$0a:c93c  60			rts
$0a:c93d  a0 dc a0	  ldy #$a0dc
$0a:c940  99 0e 04	  sta $040e,y
$0a:c943  83 41		 sta $41,s
$0a:c945  20 c0 38	  jsr $38c0
$0a:c948  c1 4e		 cmp ($4e,x)
$0a:c94a  c1 03		 cmp ($03,x)
$0a:c94c  90 40		 bcc $c98e
$0a:c94e  2c 0e eb	  bit $eb0e
$0a:c951  85 c3		 sta $c3
$0a:c953  20 e0 90	  jsr $90e0
$0a:c956  00 4b		 brk #$4b
$0a:c958  70 01		 bvs $c95b
$0a:c95a  60			rts
$0a:c95b  0f aa 07 81   ora $8107aa
$0a:c95f  33 4e		 and ($4e,s),y
$0a:c961  78			sei
$0a:c962  79 90 d4	  adc $d490,y
$0a:c965  21 43		 and ($43,x)
$0a:c967  a1 84		 lda ($84,x)
$0a:c969  c2 87		 rep #$87
$0a:c96b  f8			sed
$0a:c96c  c1 10		 cmp ($10,x)
$0a:c96e  83 d0		 sta $d0,s
$0a:c970  05 a1		 ora $a1
$0a:c972  e0 67 82	  cpx #$8267
$0a:c975  7a			ply
$0a:c976  03 d0		 ora $d0,s
$0a:c978  f3 68		 sbc ($68,s),y
$0a:c97a  6c 38 fb	  jmp ($fb38)
$0a:c97d  e0 eb d0	  cpx #$d0eb
$0a:c980  58			cli
$0a:c981  0b			phd
$0a:c982  60			rts
$0a:c983  9e 83 4e	  stz $4e83,x
$0a:c986  0d d1 7b	  ora $7bd1
$0a:c989  ee e3 49	  inc $49e3
$0a:c98c  c6 80		 dec $80
$0a:c98e  d3 0a		 cmp ($0a,s),y
$0a:c990  8f 7c 94 15   sta $15947c
$0a:c994  92 40		 sta ($40)
$0a:c996  29 84 03	  and #$0384
$0a:c999  a5 b2		 lda $b2
$0a:c99b  09 70 c0	  ora #$c070
$0a:c99e  26 81		 rol $81
$0a:c9a0  fe e1 e9	  inc $e9e1,x
$0a:c9a3  59 3c 6e	  eor $6e3c,y
$0a:c9a6  38			sec
$0a:c9a7  6a			ror a
$0a:c9a8  90 41		 bcc $c9eb
$0a:c9aa  98			tya
$0a:c9ab  d9 bc 1d	  cmp $1dbc,y
$0a:c9ae  09 86 22	  ora #$2286
$0a:c9b1  11 d0		 ora ($d0),y
$0a:c9b3  fc 1f eb	  jsr ($eb1f,x)
$0a:c9b6  e0 2c f7	  cpx #$f72c
$0a:c9b9  ef 93 ac 28   sbc $28ac93
$0a:c9bd  01 70		 ora ($70,x)
$0a:c9bf  2f e0 60 21   and $2160e0
$0a:c9c3  70 a8		 bvs $c96d
$0a:c9c5  dc 0a 7b	  jml [$7b0a]
$0a:c9c8  0e 9f c3	  asl $c39f
$0a:c9cb  a6 b0		 ldx $b0
$0a:c9cd  e8			inx
$0a:c9ce  fa			plx
$0a:c9cf  c8			iny
$0a:c9d0  59 65 02	  eor $0265,y
$0a:c9d3  82 42 20	  brl $ea18
$0a:c9d6  d0 e8		 bne $c9c0
$0a:c9d8  00 14		 brk #$14
$0a:c9da  17 e9		 ora [$e9],y
$0a:c9dc  a0 d0 6c	  ldy #$6cd0
$0a:c9df  30 17		 bmi $c9f8
$0a:c9e1  8f 07 e3 c1   sta $c1e307
$0a:c9e5  58			cli
$0a:c9e6  f0 2a		 beq $ca12
$0a:c9e8  c0 d2 54	  cpy #$54d2
$0a:c9eb  08			php
$0a:c9ec  06 02		 asl $02
$0a:c9ee  80 5a		 bra $ca4a
$0a:c9f0  04 b8		 tsb $b8
$0a:c9f2  25 c0		 and $c0
$0a:c9f4  50 8e		 bvc $c984
$0a:c9f6  f0 8c		 beq $c984
$0a:c9f8  c0 a7 6f	  cpy #$6fa7
$0a:c9fb  23 8a		 and $8a,s
$0a:c9fd  c3 9f		 cmp $9f,s
$0a:c9ff  68			pla
$0a:ca00  ff c4 b8 2a   sbc $2ab8c4,x
$0a:ca04  c1 3c		 cmp ($3c,x)
$0a:ca06  05 32		 ora $32
$0a:ca08  0c a1 7b	  tsb $7ba1
$0a:ca0b  a3 70		 lda $70,s
$0a:ca0d  a1 98		 lda ($98,x)
$0a:ca0f  c1 8e		 cmp ($8e,x)
$0a:ca11  25 17		 and $17
$0a:ca13  87 42		 sta [$42]
$0a:ca15  61 c0		 adc ($c0,x)
$0a:ca17  50 1f		 bvc $ca38
$0a:ca19  90 70		 bcc $ca8b
$0a:ca1b  00 20		 brk #$20
$0a:ca1d  c8			iny
$0a:ca1e  00 2a		 brk #$2a
$0a:ca20  14 d0		 trb $d0
$0a:ca22  ae 4d 50	  ldx $504d
$0a:ca25  c0 17 bc	  cpy #$bc17
$0a:ca28  38			sec
$0a:ca29  07 b0		 ora [$b0]
$0a:ca2b  8e c1 a7	  stx $a7c1
$0a:ca2e  f0 69		 beq $ca99
$0a:ca30  cc 3a 63	  cpy $633a
$0a:ca33  0e 89 c3	  asl $c389
$0a:ca36  1f 21 0c 14   ora $140c21,x
$0a:ca3a  14 1a		 trb $1a
$0a:ca3c  0d 00 84	  ora $8400
$0a:ca3f  27 9e		 and [$9e]
$0a:ca41  80 18		 bra $ca5b
$0a:ca43  00 a0		 brk #$a0
$0a:ca45  58			cli
$0a:ca46  02 e0		 cop #$e0
$0a:ca48  57 8d		 eor [$8d],y
$0a:ca4a  05 02		 ora $02
$0a:ca4c  c1 80		 cmp ($80,x)
$0a:ca4e  13 b0		 ora ($b0,s),y
$0a:ca50  70 20		 bvs $ca72
$0a:ca52  f0 28		 beq $ca7c
$0a:ca54  f4 16 65	  pea $6516
$0a:ca57  0b			phd
$0a:ca58  9f c0 67 d0   sta $d067c0,x
$0a:ca5c  15 d8		 ora $d8,x
$0a:ca5e  43 c3		 eor $c3,s
$0a:ca60  82 bd 08	  brl $d320
$0a:ca63  4c 09 dc	  jmp $dc09
$0a:ca66  10 18		 bpl $ca80
$0a:ca68  00 14		 brk #$14
$0a:ca6a  05 09		 ora $09
$0a:ca6c  f0 c0		 beq $ca2e
$0a:ca6e  5e 30 1f	  lsr $1f30,x
$0a:ca71  80 90		 bra $ca03
$0a:ca73  83 c1		 sta $c1,s
$0a:ca75  32 c9		 and ($c9)
$0a:ca77  b0 10		 bcs $ca89
$0a:ca79  a2 a1 21	  ldx #$21a1
$0a:ca7c  f0 a8		 beq $ca26
$0a:ca7e  9c 2a 73	  stz $732a
$0a:ca81  06 5b		 asl $5b
$0a:ca83  82 dd 0f	  brl $da63
$0a:ca86  a4 85		 ldy $85
$0a:ca88  08			php
$0a:ca89  34 21		 bit $21,x
$0a:ca8b  8b			phb
$0a:ca8c  5b			tcd
$0a:ca8d  0b			phd
$0a:ca8e  07 e3		 ora [$e3]
$0a:ca90  c0 d5 a9	  cpy #$a9d5
$0a:ca93  07 01		 ora [$01]
$0a:ca95  32 0e		 and ($0e)
$0a:ca97  58			cli
$0a:ca98  8e c7 a5	  stx $a5c7
$0a:ca9b  71 cb		 adc ($cb),y
$0a:ca9d  7c 22 ff	  jmp ($ff22,x)
$0a:caa0  70 9b		 bvs $ca3d
$0a:caa2  de 27 c9	  dec $c927,x
$0a:caa5  e7 84		 sbc [$84]
$0a:caa7  44 2c 11	  mvp $11,$2c
$0a:caaa  8b			phb
$0a:caab  c2 a1		 rep #$a1
$0a:caad  7d 11 8f	  adc $8f11,x
$0a:cab0  e4 e3		 cpx $e3
$0a:cab2  a9 38 2b	  lda #$2b38
$0a:cab5  83 95		 sta $95,s
$0a:cab7  a1 13		 lda ($13,x)
$0a:cab9  09 c4 01	  ora #$01c4
$0a:cabc  42 0a		 wdm #$0a
$0a:cabe  48			pha
$0a:cabf  8d c2 a6	  sta $a6c2
$0a:cac2  b0 e9		 bcs $caad
$0a:cac4  dc 0a 77	  jml [$770a]
$0a:cac7  1c 86 c7	  trb $c786
$0a:caca  9f 64 4c 01   sta $014c64,x
$0a:cace  f8			sed
$0a:cacf  13 00		 ora ($00,s),y
$0a:cad1  82 11 88	  brl $52e5
$0a:cad4  34 78		 bit $78,x
$0a:cad6  f8			sed
$0a:cad7  b5 02		 lda $02,x
$0a:cad9  b0 b4		 bcs $ca8f
$0a:cadb  48			pha
$0a:cadc  b2 01		 lda ($01)
$0a:cade  b4 32		 ldy $32,x
$0a:cae0  c3 9b		 cmp $9b,s
$0a:cae2  20 2f 71	  jsr $712f
$0a:cae5  81 c0		 sta ($c0,x)
$0a:cae7  20 b0 60	  jsr $60b0
$0a:caea  f8			sed
$0a:caeb  3f d2 02 c1   and $c102d2,x
$0a:caef  12 08		 ora ($08)
$0a:caf1  bf d8 9c 14   lda $149cd8,x
$0a:caf5  02 d8		 cop #$d8
$0a:caf7  16 c6		 asl $c6,x
$0a:caf9  40			rti
$0a:cafa  47 7c		 eor [$7c]
$0a:cafc  01 6c		 ora ($6c,x)
$0a:cafe  03 c0		 ora $c0,s
$0a:cb00  5b			tcd
$0a:cb01  43 e1		 eor $e1,s
$0a:cb03  47 a3		 eor [$a3]
$0a:cb05  d3 c9		 cmp ($c9,s),y
$0a:cb07  f4 d6 71	  pea $71d6
$0a:cb0a  0f 89 0b de   ora $de0b89
$0a:cb0e  01 3f		 ora ($3f,x)
$0a:cb10  80 4e		 bra $cb60
$0a:cb12  a0 11 07	  ldy #$0711
$0a:cb15  35 f8		 and $f8,x
$0a:cb17  24 02		 bit $02
$0a:cb19  d8			cld
$0a:cb1a  66 80		 ror $80
$0a:cb1c  b4 ac		 ldy $ac,x
$0a:cb1e  0e 6b 81	  asl $816b
$0a:cb21  40			rti
$0a:cb22  20 e7 b0	  jsr $b0e7
$0a:cb25  52 4b		 eor ($4b)
$0a:cb27  ec 17 e4	  cpx $e417
$0a:cb2a  5f ae 44 21   eor $2144ae,x
$0a:cb2e  01 36		 ora ($36,x)
$0a:cb30  0e 04 c2	  asl $c204
$0a:cb33  40			rti
$0a:cb34  4d 98 1c	  eor $1c98
$0a:cb37  06 0e		 asl $0e
$0a:cb39  7c 03 85	  jmp ($8503,x)
$0a:cb3c  bf 81 1b 12   lda $121b81,x
$0a:cb40  09 05 00	  ora #$0005
$0a:cb43  35 65		 and $65,x
$0a:cb45  c0 e0 35	  cpy #$35e0
$0a:cb48  c0 58 e0	  cpy #$e058
$0a:cb4b  a0 83 c1	  ldy #$c183
$0a:cb4e  57 65		 eor [$65],y
$0a:cb50  05 3a		 ora $3a
$0a:cb52  34 05		 bit $05,x
$0a:cb54  96 0c		 stx $0c,y
$0a:cb56  b2 45		 lda ($45)
$0a:cb58  82 89 30	  brl $fbe4
$0a:cb5b  02 81		 cop #$81
$0a:cb5d  6d 9b 79	  adc $799b
$0a:cb60  70 09		 bvs $cb6b
$0a:cb62  a1 75		 lda ($75,x)
$0a:cb64  91 72		 sta ($72),y
$0a:cb66  d7 03		 cmp [$03],y
$0a:cb68  0f 4f 51 e8   ora $e8514f
$0a:cb6c  21 90		 and ($90,x)
$0a:cb6e  e4 76		 cpx $76
$0a:cb70  8b			phb
$0a:cb71  ac 4c 6a	  ldy $6a4c
$0a:cb74  26 80		 rol $80
$0a:cb76  c0 51 60	  cpy #$6051
$0a:cb79  79 08 a2	  adc $a208,y
$0a:cb7c  b9 e0 30	  lda $30e0,y
$0a:cb7f  e8			inx
$0a:cb80  1c 72 09	  trb $0972
$0a:cb83  18			clc
$0a:cb84  89 8f a5	  bit #$a58f
$0a:cb87  b2 42		 lda ($42)
$0a:cb89  ea			nop
$0a:cb8a  6d 83 64	  adc $6483
$0a:cb8d  0e 66 0c	  asl $0c66
$0a:cb90  18			clc
$0a:cb91  08			php
$0a:cb92  14 1e		 trb $1e
$0a:cb94  a3 0f		 lda $0f,s
$0a:cb96  85 c1		 sta $c1
$0a:cb98  61 e4		 adc ($e4,x)
$0a:cb9a  09 82 42	  ora #$4282
$0a:cb9d  20 90 c2	  jsr $c290
$0a:cba0  c2 85		 rep #$85
$0a:cba2  cf 81 40 a0   cmp $a04081
$0a:cba6  4c 0d b0	  jmp $b00d
$0a:cba9  22 58 24 15   jsl $152458
$0a:cbad  70 00		 bvs $cbaf
$0a:cbaf  40			rti
$0a:cbb0  82 41 a0	  brl $6bf4
$0a:cbb3  30 70		 bmi $cc25
$0a:cbb5  68			pla
$0a:cbb6  c0 e0 50	  cpy #$50e0
$0a:cbb9  37 80		 and [$80],y
$0a:cbbb  bc 02 0a	  ldy $0a02,x
$0a:cbbe  f6 08		 inc $08,x
$0a:cbc0  32 c0		 and ($c0)
$0a:cbc2  81 62		 sta ($62,x)
$0a:cbc4  6c 10 81	  jmp ($8110)
$0a:cbc7  58			cli
$0a:cbc8  20 1e 0e	  jsr $0e1e
$0a:cbcb  03 ac		 ora $ac,s
$0a:cbcd  18			clc
$0a:cbce  e3 20		 sbc $20,s
$0a:cbd0  e0 07 cf	  cpx #$cf07
$0a:cbd3  00 16		 brk #$16
$0a:cbd5  04 8a		 tsb $8a
$0a:cbd7  46 62		 lsr $62
$0a:cbd9  d1 f8		 cmp ($f8),y
$0a:cbdb  14 7a		 trb $7a
$0a:cbdd  27 09		 and [$09]
$0a:cbdf  5e 00 34	  lsr $3400,x
$0a:cbe2  58			cli
$0a:cbe3  c7 00		 cmp [$00]
$0a:cbe5  8d 40 21	  sta $2140
$0a:cbe8  f0 37		 beq $cc21
$0a:cbea  c0 40 d6	  cpy #$d640
$0a:cbed  20 a4 4a	  jsr $4aa4
$0a:cbf0  06 00		 asl $00
$0a:cbf2  a2 16 0f	  ldx #$0f16
$0a:cbf5  01 f8		 ora ($f8,x)
$0a:cbf7  30 09		 bmi $cc02
$0a:cbf9  d4 e0		 pei ($e0)
$0a:cbfb  4c 30 17	  jmp $1730
$0a:cbfe  88			dey
$0a:cbff  04 63		 tsb $63
$0a:cc01  c1 80		 cmp ($80,x)
$0a:cc03  32 82		 and ($82)
$0a:cc05  45 20		 eor $20
$0a:cc07  e6 e1		 inc $e1
$0a:cc09  1f 83 20 2c   ora $2c2083,x
$0a:cc0d  16 0a		 asl $0a,x
$0a:cc0f  cd 84 08	  cmp $0884
$0a:cc12  09 12 7c	  ora #$7c12
$0a:cc15  91 b8		 sta ($b8),y
$0a:cc17  2c 16 7b	  bit $7b16
$0a:cc1a  cd 9a 30	  cmp $309a
$0a:cc1d  c2 29		 rep #$29
$0a:cc1f  86 d3		 stx $d3
$0a:cc21  69 6c f6	  adc #$f66c
$0a:cc24  68			pla
$0a:cc25  3c 1e 04	  bit $041e,x
$0a:cc28  a8			tay
$0a:cc29  50 0b		 bvc $cc36
$0a:cc2b  25 c8		 and $c8
$0a:cc2d  80 6b		 bra $cc9a
$0a:cc2f  28			plp
$0a:cc30  9e c8 67	  stz $67c8,x
$0a:cc33  82 01 a0	  brl $6c37
$0a:cc36  80 50		 bra $cc88
$0a:cc38  18			clc
$0a:cc39  46 f6		 lsr $f6
$0a:cc3b  00 00		 brk #$00
$0a:cc3d  41 07		 eor ($07,x)
$0a:cc3f  e0 3f 08	  cpx #$083f
$0a:cc42  34 1e		 bit $1e,x
$0a:cc44  03 0d		 ora $0d,s
$0a:cc46  86 42		 stx $42
$0a:cc48  a1 a0		 lda ($a0,x)
$0a:cc4a  e0 01 84	  cpx #$8401
$0a:cc4d  12 06		 ora ($06)
$0a:cc4f  c3 15		 cmp $15,s
$0a:cc51  80 40		 bra $cc93
$0a:cc53  21 d0		 and ($d0,x)
$0a:cc55  c6 60		 dec $60
$0a:cc57  48			pha
$0a:cc58  02 c0		 cop #$c0
$0a:cc5a  10 1a		 bpl $cc76
$0a:cc5c  05 83		 ora $83
$0a:cc5e  41 c0		 eor ($c0,x)
$0a:cc60  2c a5 83	  bit $83a5
$0a:cc63  00 1f		 brk #$1f
$0a:cc65  26 f8		 rol $f8
$0a:cc67  16 50		 asl $50,x
$0a:cc69  7a			ply
$0a:cc6a  10 15		 bpl $cc81
$0a:cc6c  d0 43		 bne $ccb1
$0a:cc6e  60			rts
$0a:cc6f  d0 f8		 bne $cc69
$0a:cc71  11 14		 ora ($14),y
$0a:cc73  1d 0d 06	  ora $060d,x
$0a:cc76  86 c2		 stx $c2
$0a:cc78  a1 f0		 lda ($f0,x)
$0a:cc7a  83 e1		 sta $e1,s
$0a:cc7c  81 ab		 sta ($ab,x)
$0a:cc7e  01 40		 ora ($40,x)
$0a:cc80  a0 13 c5	  ldy #$c513
$0a:cc83  b0 05		 bcs $cc8a
$0a:cc85  90 52		 bcc $ccd9
$0a:cc87  80 80		 bra $cc09
$0a:cc89  ac 06 80	  ldy $8006
$0a:cc8c  34 00		 bit $00,x
$0a:cc8e  70 78		 bvs $cd08
$0a:cc90  11 f8		 ora ($f8),y
$0a:cc92  45 5a		 eor $5a
$0a:cc94  f3 61		 sbc ($61,s),y
$0a:cc96  ba			tsx
$0a:cc97  2c c2 06	  bit $06c2
$0a:cc9a  f6 08		 inc $08,x
$0a:cc9c  0b			phd
$0a:cc9d  dc a2 90	  jml [$90a2]
$0a:cca0  0b			phd
$0a:cca1  25 82		 and $82
$0a:cca3  cb			wai
$0a:cca4  62 1b 0b	  per $d7c2
$0a:cca7  b8			clv
$0a:cca8  02 09		 cop #$09
$0a:ccaa  a0 13 88	  ldy #$8813
$0a:ccad  9c 7b 1b	  stz $1b7b
$0a:ccb0  0d 47 03	  ora $0347
$0a:ccb3  88			dey
$0a:ccb4  cc 15 48	  cpy $4815
$0a:ccb7  60			rts
$0a:ccb8  2e 18 0b	  rol $0b18
$0a:ccbb  c4 02		 cpy $02
$0a:ccbd  f1 88		 sbc ($88),y
$0a:ccbf  80 73		 bra $cd34
$0a:ccc1  20 0c c1	  jsr $c10c
$0a:ccc4  86 45		 stx $45
$0a:ccc6  61 b0		 adc ($b0,x)
$0a:ccc8  98			tya
$0a:ccc9  84 42		 sty $42
$0a:cccb  32 35		 and ($35)
$0a:cccd  30 81		 bmi $cc50
$0a:cccf  c3 59		 cmp $59,s
$0a:ccd1  20 05 08	  jsr $0805
$0a:ccd4  31 14		 and ($14),y
$0a:ccd6  80 d1		 bra $cca9
$0a:ccd8  88			dey
$0a:ccd9  c0 68 2e	  cpy #$2e68
$0a:ccdc  15 0d		 ora $0d,x
$0a:ccde  80 88		 bra $cc68
$0a:cce0  02 06		 cop #$06
$0a:cce2  22 0f 86 22   jsl $22860f
$0a:cce6  e1 68		 sbc ($68,x)
$0a:cce8  14 08		 trb $08
$0a:ccea  41 0f		 eor ($0f,x)
$0a:ccec  e1 0f		 sbc ($0f,x)
$0a:ccee  80 2c		 bra $cd1c
$0a:ccf0  48			pha
$0a:ccf1  8e 0f 76	  stx $760f
$0a:ccf4  03 66		 ora $66,s
$0a:ccf6  63 01		 adc $01,s
$0a:ccf8  b8			clv
$0a:ccf9  d0 4f		 bne $cd4a
$0a:ccfb  34 1d		 bit $1d,x
$0a:ccfd  ca			dex
$0a:ccfe  06 d2		 asl $d2
$0a:cd00  f1 7c		 sbc ($7c),y
$0a:cd02  fc 7e 1f	  jsr ($1f7e,x)
$0a:cd05  83 60		 sta $60,s
$0a:cd07  80 17		 bra $cd20
$0a:cd09  c1 c2		 cmp ($c2,x)
$0a:cd0b  32 09		 and ($09)
$0a:cd0d  c7 01		 cmp [$01]
$0a:cd0f  b6 41		 ldx $41,y
$0a:cd11  31 5c		 and ($5c),y
$0a:cd13  0b			phd
$0a:cd14  c5 a0		 cmp $a0
$0a:cd16  48			pha
$0a:cd17  00 40		 brk #$40
$0a:cd19  03 fe		 ora $fe,s
$0a:cd1b  49 20 49	  eor #$4920
$0a:cd1e  21 48		 and ($48,x)
$0a:cd20  84 92		 sty $92
$0a:cd22  80 1a		 bra $cd3e
$0a:cd24  20 1b 2a	  jsr $2a1b
$0a:cd27  c8			iny
$0a:cd28  a8			tay
$0a:cd29  2e e6 3b	  rol $3be6
$0a:cd2c  04 12		 tsb $12
$0a:cd2e  c9 67 b2	  cmp #$b267
$0a:cd31  de e6 93	  dec $93e6,x
$0a:cd34  a0 78 0f	  ldy #$0f78
$0a:cd37  d2 11		 cmp ($11)
$0a:cd39  00 52		 brk #$52
$0a:cd3b  85 82		 sta $82
$0a:cd3d  31 39		 and ($39),y
$0a:cd3f  1f 88 44 e4   ora $e44488,x
$0a:cd43  05 50		 ora $50
$0a:cd45  4f 86 00 2e   eor $2e0086
$0a:cd49  0e 30 2f	  asl $2f30
$0a:cd4c  da			phx
$0a:cd4d  9d 1e 29	  sta $291e,x
$0a:cd50  01 81		 ora ($81,x)
$0a:cd52  c1 60		 cmp ($60,x)
$0a:cd54  f0 38		 beq $cd8e
$0a:cd56  69 7e 20	  adc #$207e
$0a:cd59  84 61		 sty $61
$0a:cd5b  45 10		 eor $10
$0a:cd5d  3c ca ca	  bit $caca,x
$0a:cd60  1d c3 5a	  ora $5ac3,x
$0a:cd63  3c 54 6c	  bit $6c54,x
$0a:cd66  10 78		 bpl $cde0
$0a:cd68  14 1a		 trb $1a
$0a:cd6a  1e 0d 24	  asl $240d,x
$0a:cd6d  fb			xce
$0a:cd6e  af 91 26 85   lda $852691
$0a:cd72  71 0c		 adc ($0c),y
$0a:cd74  8c 82 e0	  sty $e082
$0a:cd77  61 cd		 adc ($cd,x)
$0a:cd79  81 c2		 sta ($c2,x)
$0a:cd7b  60			rts
$0a:cd7c  90 48		 bcc $cdc6
$0a:cd7e  64 22		 stz $22
$0a:cd80  02 cb		 cop #$cb
$0a:cd82  43 72		 eor $72,s
$0a:cd84  c1 e0		 cmp ($e0,x)
$0a:cd86  10 e4		 bpl $cd6c
$0a:cd88  83 e0		 sta $e0,s
$0a:cd8a  13 47		 ora ($47,s),y
$0a:cd8c  a0 29 81	  ldy #$8129
$0a:cd8f  8b			phb
$0a:cd90  d5 f5		 cmp $f5,x
$0a:cd92  0c 44 82	  tsb $8244
$0a:cd95  7e ce 60	  ror $60ce,x
$0a:cd98  8f 56 90 e0   sta $e09056
$0a:cd9c  2c 1a 0f	  bit $0f1a
$0a:cd9f  06 a3		 asl $a3
$0a:cda1  b0 9f		 bcs $cd42
$0a:cda3  c8			iny
$0a:cda4  44 c1 de	  mvp $de,$c1
$0a:cda7  b0 48		 bcs $cdf1
$0a:cda9  0c 1c 76	  tsb $761c
$0a:cdac  0e 90 86	  asl $8690
$0a:cdaf  10 34		 bpl $cde5
$0a:cdb1  9a			txs
$0a:cdb2  4d 13 98	  eor $9813
$0a:cdb5  64 3e		 stz $3e
$0a:cdb7  09 70 e8	  ora #$e870
$0a:cdba  6c 2c 19	  jmp ($192c)
$0a:cdbd  00 0a		 brk #$0a
$0a:cdbf  44 14 85	  mvp $85,$14
$0a:cdc2  20 37 02	  jsr $0237
$0a:cdc5  94 18		 sty $18,x
$0a:cdc7  ac 09 17	  ldy $1709
$0a:cdca  c8			iny
$0a:cdcb  41 e1		 eor ($e1,x)
$0a:cdcd  b0 f7		 bcs $cdc6
$0a:cdcf  48			pha
$0a:cdd0  2f e2 10 bf   and $bf10e2
$0a:cdd4  72 99		 adc ($99)
$0a:cdd6  60			rts
$0a:cdd7  28			plp
$0a:cdd8  09 20 6e	  ora #$6e20
$0a:cddb  02 8c		 cop #$8c
$0a:cddd  1b			tcs
$0a:cdde  f9 04 81	  sbc $8104,y
$0a:cde1  42 e0		 wdm #$e0
$0a:cde3  b1 c8		 lda ($c8),y
$0a:cde5  3c 7e 03	  bit $037e,x
$0a:cde8  1b			tcs
$0a:cde9  83 43		 sta $43,s
$0a:cdeb  e0 e7 a1	  cpx #$a1e7
$0a:cdee  5a			phy
$0a:cdef  08			php
$0a:cdf0  f8			sed
$0a:cdf1  20 cb 41	  jsr $41cb
$0a:cdf4  83 1d		 sta $1d,s
$0a:cdf6  c1 be		 cmp ($be,x)
$0a:cdf8  94 0b		 sty $0b,x
$0a:cdfa  04 03		 tsb $03
$0a:cdfc  61 c0		 adc ($c0,x)
$0a:cdfe  b8			clv
$0a:cdff  40			rti
$0a:ce00  2e 1c 0d	  rol $0d1c
$0a:ce03  03 74		 ora $74,s
$0a:ce05  ca			dex
$0a:ce06  60			rts
$0a:ce07  53 06		 eor ($06,s),y
$0a:ce09  d0 36		 bne $ce41
$0a:ce0b  07 00		 ora [$00]
$0a:ce0d  de 49 34	  dec $3449,x
$0a:ce10  63 ff		 adc $ff,s
$0a:ce12  01 ff		 ora ($ff,x)
$0a:ce14  c0 2f b0	  cpy #$b02f
$0a:ce17  38			sec
$0a:ce18  fc 0c 9a	  jsr ($9a0c,x)
$0a:ce1b  91 96		 sta ($96),y
$0a:ce1d  f9 a2 d0	  sbc $d0a2,y
$0a:ce20  18			clc
$0a:ce21  61 00		 adc ($00,x)
$0a:ce23  a0 6c 30	  ldy #$306c
$0a:ce26  09 c0 f8	  ora #$f8c0
$0a:ce29  78			sei
$0a:ce2a  3c 0d f3	  bit $f30d,x
$0a:ce2d  0f 93 64 24   ora $246493
$0a:ce31  1c 02 ca	  trb $ca02
$0a:ce34  28			plp
$0a:ce35  c2 7f		 rep #$7f
$0a:ce37  35 9d		 and $9d,x
$0a:ce39  df 2f e6 e0   cmp $e0e62f,x
$0a:ce3d  80 2f		 bra $ce6e
$0a:ce3f  81 6a		 sta ($6a,x)
$0a:ce41  0d f2 9a	  ora $9af2
$0a:ce44  42 2f		 wdm #$2f
$0a:ce46  8d fb 90	  sta $90fb
$0a:ce49  48			pha
$0a:ce4a  34 1a		 bit $1a,x
$0a:ce4c  0e c4 e3	  asl $e3c4
$0a:ce4f  69 78 fe	  adc #$fe78
$0a:ce52  5c 3f 0d f3   jml $f30d3f
$0a:ce56  e0 40 2c	  cpx #$2c40
$0a:ce59  11 08		 ora ($08),y
$0a:ce5b  44 c2 f0	  mvp $f0,$c2
$0a:ce5e  16 06		 asl $06,x
$0a:ce60  fa			plx
$0a:ce61  c6 e0		 dec $e0
$0a:ce63  b3 88		 lda ($88,s),y
$0a:ce65  79 d4 0e	  adc $0ed4,y
$0a:ce68  a1 1f		 lda ($1f,x)
$0a:ce6a  3b			tsc
$0a:ce6b  0b			phd
$0a:ce6c  ac e0 10	  ldy $10e0
$0a:ce6f  e6 fd		 inc $fd
$0a:ce71  cc 26 1b	  cpy $1b26
$0a:ce74  0f 87 e2 61   ora $61e287
$0a:ce78  d8			cld
$0a:ce79  98			tya
$0a:ce7a  26 40		 rol $40
$0a:ce7c  ce 99 0b	  dec $0b99
$0a:ce7f  04 c2		 tsb $c2
$0a:ce81  81 30		 sta ($30,x)
$0a:ce83  67 03		 adc [$03]
$0a:ce85  09 ee f6	  ora #$f6ee
$0a:ce88  4b			phk
$0a:ce89  35 e6		 and $e6,x
$0a:ce8b  77 3c		 adc [$3c],y
$0a:ce8d  b3 c6		 lda ($c6,s),y
$0a:ce8f  0e 64 fa	  asl $fa64
$0a:ce92  2b			pld
$0a:ce93  24 22		 bit $22
$0a:ce95  e3 0c		 sbc $0c,s
$0a:ce97  9e 40 23	  stz $2340,x
$0a:ce9a  0f a3 7d 17   ora $177da3
$0a:ce9e  c2 41		 rep #$41
$0a:cea0  10 f0		 bpl $ce92
$0a:cea2  7c 01 c0	  jmp ($c001,x)
$0a:cea5  d8			cld
$0a:cea6  13 08		 ora ($08,s),y
$0a:cea8  3e 8a 40	  rol $408a,x
$0a:ceab  66 70		 ror $70
$0a:cead  32 46		 and ($46)
$0a:ceaf  61 33		 adc ($33,x)
$0a:ceb1  68			pla
$0a:ceb2  3d de 10	  and $10de,x
$0a:ceb5  71 0b		 adc ($0b),y
$0a:ceb7  dd f1 f2	  cmp $f2f1,x
$0a:ceba  90 65		 bcc $cf21
$0a:cebc  f0 42		 beq $cf00
$0a:cebe  20 10 c4	  jsr $c410
$0a:cec1  08			php
$0a:cec2  20 5b a1	  jsr $a15b
$0a:cec5  b8			clv
$0a:cec6  dc 26 04	  jml [$0426]
$0a:cec9  2a			rol a
$0a:ceca  4c 24 9c	  jmp $9c24
$0a:cecd  29 9d 84	  and #$849d
$0a:ced0  91 e8		 sta ($e8),y
$0a:ced2  14 f6		 trb $f6
$0a:ced4  07 3e		 ora [$3e]
$0a:ced6  81 4d		 sta ($4d,x)
$0a:ced8  a1 b1		 lda ($b1,x)
$0a:ceda  f8			sed
$0a:cedb  7a			ply
$0a:cedc  e5 20		 sbc $20
$0a:cede  2e c1 81	  rol $81c1
$0a:cee1  40			rti
$0a:cee2  61 90		 adc ($90,x)
$0a:cee4  35 ca		 and $ca,x
$0a:cee6  2f 43 d1 90   and $90d143
$0a:ceea  6b			rtl
$0a:ceeb  81 4c		 sta ($4c,x)
$0a:ceed  70 16		 bvs $cf05
$0a:ceef  0c 07 01	  tsb $0107
$0a:cef2  85 21		 sta $21
$0a:cef4  90 0c		 bcc $cf02
$0a:cef6  a2 04 20	  ldx #$2004
$0a:cef9  f0 59		 beq $cf54
$0a:cefb  bc 66 f5	  ldy $f566,x
$0a:cefe  3d 7b 83	  and $837b,x
$0a:cf01  dc 8f 21	  jml [$218f]
$0a:cf04  03 20		 ora $20,s
$0a:cf06  0c 40 04	  tsb $0440
$0a:cf09  26 28		 rol $28
$0a:cf0b  a0 50 24	  ldy #$2450
$0a:cf0e  10 0d		 bpl $cf1d
$0a:cf10  86 03		 stx $03
$0a:cf12  a1 c0		 lda ($c0,x)
$0a:cf14  28			plp
$0a:cf15  8d c3 d1	  sta $d1c3
$0a:cf18  70 09		 bvs $cf23
$0a:cf1a  80 64		 bra $cf80
$0a:cf1c  13 21		 ora ($21,s),y
$0a:cf1e  40			rti
$0a:cf1f  67 04		 adc [$04]
$0a:cf21  82 a1 20	  brl $efc5
$0a:cf24  30 81		 bmi $cea7
$0a:cf26  86 a0		 stx $a0
$0a:cf28  70 27		 bvs $cf51
$0a:cf2a  b8			clv
$0a:cf2b  43 e1		 eor $e1,s
$0a:cf2d  90 48		 bcc $cf77
$0a:cf2f  73 bd		 adc ($bd,s),y
$0a:cf31  e1 84		 sbc ($84,x)
$0a:cf33  30 21		 bmi $cf56
$0a:cf35  04 2c		 tsb $2c
$0a:cf37  c4 e9		 cpy $e9
$0a:cf39  90 4c		 bcc $cf87
$0a:cf3b  84 81		 sty $81
$0a:cf3d  9e 09 97	  stz $9709,x
$0a:cf40  0c 8b 78	  tsb $788b
$0a:cf43  9a			txs
$0a:cf44  20 a0 38	  jsr $38a0
$0a:cf47  10 d4		 bpl $cf1d
$0a:cf49  17 83		 ora [$83],y
$0a:cf4b  05 41		 ora $41
$0a:cf4d  80 dc		 bra $cf2b
$0a:cf4f  06 09		 asl $09
$0a:cf51  01 5e		 ora ($5e,x)
$0a:cf53  84 19		 sty $19
$0a:cf55  7c 07 e0	  jmp ($e007,x)
$0a:cf58  25 82		 and $82
$0a:cf5a  81 13		 sta ($13,x)
$0a:cf5c  02 19		 cop #$19
$0a:cf5e  28			plp
$0a:cf5f  06 81		 asl $81
$0a:cf61  3e c2 74	  rol $74c2,x
$0a:cf64  d0 38		 bne $cf9e
$0a:cf66  c1 78		 cmp ($78,x)
$0a:cf68  30 38		 bmi $cfa2
$0a:cf6a  24 1e		 bit $1e
$0a:cf6c  09 09 85	  ora #$8509
$0a:cf6f  3e 00 e8	  rol $e800,x
$0a:cf72  10 e8		 bpl $cf5c
$0a:cf74  68			pla
$0a:cf75  39 89 60	  and $6089,y
$0a:cf78  08			php
$0a:cf79  00 58		 brk #$58
$0a:cf7b  30 00		 bmi $cf7d
$0a:cf7d  c6 9e		 dec $9e
$0a:cf7f  04 a1		 tsb $a1
$0a:cf81  48			pha
$0a:cf82  34 1a		 bit $1a,x
$0a:cf84  0c 01 79	  tsb $7901
$0a:cf87  53 e8		 eor ($e8,s),y
$0a:cf89  e3 17		 sbc $17,s
$0a:cf8b  92 1c		 sta ($1c)
$0a:cf8d  8c f6 0f	  sty $0ff6
$0a:cf90  81 38		 sta ($38,x)
$0a:cf92  82 7e 49	  brl $1913
$0a:cf95  60			rts
$0a:cf96  4e 44 9a	  lsr $9a44
$0a:cf99  0b			phd
$0a:cf9a  43 41		 eor $41,s
$0a:cf9c  a0 b8 25	  ldy #$25b8
$0a:cf9f  41 41		 eor ($41,x)
$0a:cfa1  69 f8 3a	  adc #$3af8
$0a:cfa4  84 2e		 sty $2e
$0a:cfa6  10 4e		 bpl $cff6
$0a:cfa8  12 48		 ora ($48)
$0a:cfaa  3c 19 10	  bit $1019,x
$0a:cfad  30 38		 bmi $cfe7
$0a:cfaf  44 1a 12	  mvp $12,$1a
$0a:cfb2  9f 6e 06 01   sta $01066e,x
$0a:cfb6  2a			rol a
$0a:cfb7  42 e5		 wdm #$e5
$0a:cfb9  54 1d 80	  mvn $80,$1d
$0a:cfbc  d0 34		 bne $cff2
$0a:cfbe  03 28		 ora $28,s
$0a:cfc0  29 8e 04	  and #$048e
$0a:cfc3  bd 13 88	  lda $8813,x
$0a:cfc6  3e c2 0d	  rol $0dc2,x
$0a:cfc9  02 0a		 cop #$0a
$0a:cfcb  08			php
$0a:cfcc  50 60		 bvc $d02e
$0a:cfce  50 11		 bvc $cfe1
$0a:cfd0  c9 1c 42	  cmp #$421c
$0a:cfd3  0d 01 1f	  ora $1f01
$0a:cfd6  a6 00		 ldx $00
$0a:cfd8  aa			tax
$0a:cfd9  09 43 b0	  ora #$b043
$0a:cfdc  3a			dec a
$0a:cfdd  d5 22		 cmp $22,x
$0a:cfdf  42 96		 wdm #$96
$0a:cfe1  27 00		 and [$00]
$0a:cfe3  dc a0 24	  jml [$24a0]
$0a:cfe6  51 83		 eor ($83),y
$0a:cfe8  40			rti
$0a:cfe9  e1 e3		 sbc ($e3,x)
$0a:cfeb  e5 40		 sbc $40
$0a:cfed  51 94		 eor ($94),y
$0a:cfef  8b			phb
$0a:cff0  60			rts
$0a:cff1  d9 0e 07	  cmp $070e,y
$0a:cff4  83 2d		 sta $2d,s
$0a:cff6  96 a3		 stx $a3,y
$0a:cff8  73 90		 adc ($90,s),y
$0a:cffa  15 66		 ora $66,x
$0a:cffc  84 4d		 sty $4d
$0a:cffe  a1 08		 lda ($08,x)
$0a:d000  02 38		 cop #$38
$0a:d002  a1 2c		 lda ($2c,x)
$0a:d004  20 b0 23	  jsr $23b0
$0a:d007  ef b0 8c ce   sbc $ce8cb0
$0a:d00b  05 b0		 ora $b0
$0a:d00d  6a			ror a
$0a:d00e  97 42		 sta [$42],y
$0a:d010  61 30		 adc ($30,x)
$0a:d012  fc 30 a2	  jsr ($a230,x)
$0a:d015  20 14 15	  jsr $1514
$0a:d018  70 42		 bvs $d05c
$0a:d01a  22 b1 48 a4   jsl $a448b1
$0a:d01e  2a			rol a
$0a:d01f  0d 05 81	  ora $8105
$0a:d022  92 c1		 sta ($c1)
$0a:d024  84 91		 sty $91
$0a:d026  f8			sed
$0a:d027  84 72		 sty $72
$0a:d029  26 4d		 rol $4d
$0a:d02b  07 bb		 ora [$bb]
$0a:d02d  23 c4		 and $c4,s
$0a:d02f  5c 18 0a 02   jml $020a18
$0a:d033  5c 3c 1e 0a   jml $0a1e3c
$0a:d037  00 ac		 brk #$ac
$0a:d039  2c 05 d0	  bit $d005
$0a:d03c  b0 60		 bcs $d09e
$0a:d03e  2e 01 f0	  rol $f001
$0a:d041  e0 4c 0a	  cpx #$0a4c
$0a:d044  e0 19 10	  cpx #$1019
$0a:d047  d0 86		 bne $cfcf
$0a:d049  c2 03		 rep #$03
$0a:d04b  01 82		 ora ($82,x)
$0a:d04d  ae c2 0f	  ldx $0fc2
$0a:d050  04 7b		 tsb $7b
$0a:d052  3c 05 e8	  bit $e805,x
$0a:d055  03 30		 ora $30,s
$0a:d057  5c 0b 0b 24   jml $240b0b
$0a:d05b  1a			inc a
$0a:d05c  0e 05 01	  asl $0105
$0a:d05f  22 3c 0c 02   jsl $020c3c
$0a:d063  4c 9a a3	  jmp $a39a
$0a:d066  20 2c 11	  jsr $112c
$0a:d069  68			pla
$0a:d06a  4b			phk
$0a:d06b  61 77		 adc ($77,x)
$0a:d06d  bc 1b c2	  ldy $c21b,x
$0a:d070  4f 18 bf c0   eor $c0bf18
$0a:d074  0e a1 1f	  asl $1fa1
$0a:d077  80 10		 bra $d089
$0a:d079  c1 1c		 cmp ($1c,x)
$0a:d07b  16 08		 asl $08,x
$0a:d07d  c5 e1		 cmp $e1
$0a:d07f  d8			cld
$0a:d080  28			plp
$0a:d081  48			pha
$0a:d082  f8			sed
$0a:d083  70 2a		 bvs $d0af
$0a:d085  1a			inc a
$0a:d086  0c 87 81	  tsb $8187
$0a:d089  1e 0d 52	  asl $520d,x
$0a:d08c  33 82		 and ($82,s),y
$0a:d08e  10 e8		 bpl $d078
$0a:d090  0d 50 34	  ora $3450
$0a:d093  82 11 a1	  brl $71a7
$0a:d096  b0 58		 bcs $d0f0
$0a:d098  5c 1e 3b 01   jml $013b1e
$0a:d09c  8f 40 e3 f0   sta $f0e340
$0a:d0a0  f8			sed
$0a:d0a1  62 dc 0f	  per $e080
$0a:d0a4  83 02		 sta $02,s
$0a:d0a6  1e 12 fc	  asl $fc12,x
$0a:d0a9  20 6b b0	  jsr $b06b
$0a:d0ac  3c 82 10	  bit $1082,x
$0a:d0af  ba			tsx
$0a:d0b0  16 0c		 asl $0c,x
$0a:d0b2  85 83		 sta $83
$0a:d0b4  e0 5f 33	  cpx #$335f
$0a:d0b7  48			pha
$0a:d0b8  26 d5		 rol $d5
$0a:d0ba  bd 70 a8	  lda $a870,x
$0a:d0bd  70 cc		 bvs $d08b
$0a:d0bf  08			php
$0a:d0c0  44 37 68	  mvp $68,$37
$0a:d0c3  74 04		 stz $04,x
$0a:d0c5  86 04		 stx $04
$0a:d0c7  3e c0 60	  rol $60c0,x
$0a:d0ca  24 1e		 bit $1e
$0a:d0cc  0f 05 02 41   ora $410205
$0a:d0d0  00 98		 brk #$98
$0a:d0d2  4c 22 13	  jmp $1322
$0a:d0d5  02 f9		 cop #$f9
$0a:d0d7  60			rts
$0a:d0d8  2c 06 70	  bit $7006
$0a:d0db  0c 85 80	  tsb $8085
$0a:d0de  34 21		 bit $21,x
$0a:d0e0  b0 82		 bcs $d064
$0a:d0e2  41 20		 eor ($20,x)
$0a:d0e4  03 01		 ora $01,s
$0a:d0e6  62 04 05	  per $d5ed
$0a:d0e9  08			php
$0a:d0ea  b0 48		 bcs $d134
$0a:d0ec  18			clc
$0a:d0ed  fc 86 ce	  jsr ($ce86,x)
$0a:d0f0  7c 03 28	  jmp ($2803,x)
$0a:d0f3  0a			asl a
$0a:d0f4  42 c0		 wdm #$c0
$0a:d0f6  a2 01 10	  ldx #$1001
$0a:d0f9  06 02		 asl $02
$0a:d0fb  c1 60		 cmp ($60,x)
$0a:d0fd  2d 04 83	  and $8304
$0a:d100  80 24		 bra $d126
$0a:d102  09 00 50	  ora #$5000
$0a:d105  14 20		 trb $20
$0a:d107  98			tya
$0a:d108  02 d0		 cop #$d0
$0a:d10a  96 c1		 stx $c1,y
$0a:d10c  fe 10 d8	  inc $d810,x
$0a:d10f  34 3a		 bit $3a,x
$0a:d111  0f 0a 83 80   ora $80830a
$0a:d115  de 04 34	  dec $3404,x
$0a:d118  00 09		 brk #$09
$0a:d11a  02 1b		 cop #$1b
$0a:d11c  d9 3c fb	  cmp $fb3c,y
$0a:d11f  42 3f		 wdm #$3f
$0a:d121  d0 0f		 bne $d132
$0a:d123  c4 01		 cpy $01
$0a:d125  a6 0d		 ldx $0d
$0a:d127  90 04		 bcc $d12d
$0a:d129  14 72		 trb $72
$0a:d12b  01 08		 ora ($08,x)
$0a:d12d  6f 59 bc 60   adc $60bc59
$0a:d131  50 e8		 bvc $d11b
$0a:d133  1c 22 0f	  trb $0f22
$0a:d136  0c 3b 0a	  tsb $0a3b
$0a:d139  e8			inx
$0a:d13a  c6 a0		 dec $a0
$0a:d13c  f6 11		 inc $11,x
$0a:d13e  81 2e		 sta ($2e,x)
$0a:d140  93 91		 sta ($91,s),y
$0a:d142  38			sec
$0a:d143  4a			lsr a
$0a:d144  83 44		 sta $44,s
$0a:d146  92 e1		 sta ($e1)
$0a:d148  e0 5d 1c	  cpx #$1c5d
$0a:d14b  e1 90		 sbc ($90,x)
$0a:d14d  ae 2a 02	  ldx $022a
$0a:d150  81 00		 sta ($00,x)
$0a:d152  20 e3 00	  jsr $00e3
$0a:d155  81 c0		 sta ($c0,x)
$0a:d157  a0 70 d6	  ldy #$d670
$0a:d15a  3b			tsc
$0a:d15b  0f 08 62 23   ora $236208
$0a:d15f  50 6d		 bvc $d1ce
$0a:d161  92 64		 sta ($64)
$0a:d163  1b			tcs
$0a:d164  20 15 2d	  jsr $2d15
$0a:d167  00 6c		 brk #$6c
$0a:d169  54 92 66	  mvn $66,$92
$0a:d16c  13 38		 ora ($38,s),y
$0a:d16e  13 42		 ora ($42,s),y
$0a:d170  02 fb		 cop #$fb
$0a:d172  01 81		 ora ($81,x)
$0a:d174  03 42		 ora $42,s
$0a:d176  03 07		 ora $07,s
$0a:d178  81 43		 sta ($43,x)
$0a:d17a  c1 a8		 cmp ($a8,x)
$0a:d17c  7b			tdc
$0a:d17d  42 32		 wdm #$32
$0a:d17f  84 d3		 sty $d3
$0a:d181  81 20		 sta ($20,x)
$0a:d183  e0 78 34	  cpx #$3478
$0a:d186  1b			tcs
$0a:d187  0c 86 40	  tsb $4086
$0a:d18a  3f 96 05 21   and $210596,x
$0a:d18e  b0 c1		 bcs $d151
$0a:d190  ee 10 58	  inc $5810
$0a:d193  34 2e		 bit $2e,x
$0a:d195  0d 1a 86	  ora $861a
$0a:d198  c0 63 c1	  cpy #$c163
$0a:d19b  fa			plx
$0a:d19c  84 41		 sty $41
$0a:d19e  8f c9 80 09   sta $0980c9
$0a:d1a2  34 81		 bit $81,x
$0a:d1a4  38			sec
$0a:d1a5  01 fa		 ora ($fa,x)
$0a:d1a7  08			php
$0a:d1a8  90 bc		 bcc $d166
$0a:d1aa  8e a0 75	  stx $75a0
$0a:d1ad  08			php
$0a:d1ae  ac 58 f6	  ldy $f658
$0a:d1b1  16 fb		 asl $fb,x
$0a:d1b3  85 de		 sta $de
$0a:d1b5  f0 85		 beq $d13c
$0a:d1b7  56 20		 lsr $20,x
$0a:d1b9  c0 22 16	  cpy #$1622
$0a:d1bc  08			php
$0a:d1bd  c2 f8		 rep #$f8
$0a:d1bf  92 75		 sta ($75)
$0a:d1c1  80 0f		 bra $d1d2
$0a:d1c3  58			cli
$0a:d1c4  4c 05 a6	  jmp $a605
$0a:d1c7  72 11		 adc ($11)
$0a:d1c9  99 0d 82	  sta $820d,y
$0a:d1cc  0f 00 87 8c   ora $8c8700
$0a:d1d0  c0 3f 43	  cpy #$433f
$0a:d1d3  21 48		 and ($48,x)
$0a:d1d5  b1 5c		 lda ($5c),y
$0a:d1d7  30 1e		 bmi $d1f7
$0a:d1d9  0d 06 82	  ora $8206
$0a:d1dc  c0 53 03	  cpy #$0353
$0a:d1df  05 a1		 ora $a1
$0a:d1e1  c9 e2 a7	  cmp #$a7e2
$0a:d1e4  b0 8b		 bcs $d171
$0a:d1e6  c2 22		 rep #$22
$0a:d1e8  f0 78		 beq $d262
$0a:d1ea  c2 01		 rep #$01
$0a:d1ec  87 c1		 sta [$c1]
$0a:d1ee  14 84		 trb $84
$0a:d1f0  12 40		 ora ($40)
$0a:d1f2  7c 41 18	  jmp ($1841,x)
$0a:d1f5  6d 8a 4c	  adc $4c8a
$0a:d1f8  14 57		 trb $57
$0a:d1fa  60			rts
$0a:d1fb  16 4c		 asl $4c,x
$0a:d1fd  16 0d		 asl $0d,x
$0a:d1ff  0e 83 c2	  asl $c283
$0a:d202  1f 60 01 78   ora $780160,x
$0a:d206  22 20 60 c0   jsl $c06020
$0a:d20a  13 28		 ora ($28,s),y
$0a:d20c  b7 01		 lda [$01],y
$0a:d20e  b2 2f		 lda ($2f)
$0a:d210  fb			xce
$0a:d211  09 0b be	  ora #$be0b
$0a:d214  20 30 38	  jsr $3830
$0a:d217  2c 0e 16	  bit $160e
$0a:d21a  8b			phb
$0a:d21b  07 fd		 ora [$fd]
$0a:d21d  c1 20		 cmp ($20,x)
$0a:d21f  44 fb 98	  mvp $98,$fb
$0a:d222  74 3a		 stz $3a,x
$0a:d224  05 fc		 ora $fc
$0a:d226  4f 04 26 09   eor $092604
$0a:d22a  1d 80 c7	  ora $c780,x
$0a:d22d  61 d0		 adc ($d0,x)
$0a:d22f  e8			inx
$0a:d230  fc 7e 00	  jsr ($007e,x)
$0a:d233  f7 08		 sbc [$08],y
$0a:d235  7a			ply
$0a:d236  18			clc
$0a:d237  59 c0 b7	  eor $b7c0,y
$0a:d23a  08			php
$0a:d23b  64 0d		 stz $0d
$0a:d23d  ee 01 f6	  inc $f601
$0a:d240  a8			tay
$0a:d241  78			sei
$0a:d242  32 16		 and ($16)
$0a:d244  0f 84 00 26   ora $260084
$0a:d248  09 71 5f	  ora #$5f71
$0a:d24b  e3 05		 sbc $05,s
$0a:d24d  63 50		 adc $50,s
$0a:d24f  d8			cld
$0a:d250  43 d9		 eor $d9,s
$0a:d252  4f c0 b1 04   eor $04b1c0
$0a:d256  30 42		 bmi $d29a
$0a:d258  60			rts
$0a:d259  c0 58 42	  cpy #$4258
$0a:d25c  97 22		 sta [$22],y
$0a:d25e  f1 98		 sbc ($98),y
$0a:d260  b4 74		 ldy $74,x
$0a:d262  27 1c		 and [$1c]
$0a:d264  c9 87 f2	  cmp #$f287
$0a:d267  01 f8		 ora ($f8,x)
$0a:d269  4b			phk
$0a:d26a  0a			asl a
$0a:d26b  18			clc
$0a:d26c  21 11		 and ($11,x)
$0a:d26e  09 44 42	  ora #$4244
$0a:d271  71 00		 adc ($00),y
$0a:d273  98			tya
$0a:d274  30 5d		 bmi $d2d3
$0a:d276  ee 4f 92	  inc $924f
$0a:d279  1b			tcs
$0a:d27a  92 d4		 sta ($d4)
$0a:d27c  43 df		 eor $df,s
$0a:d27e  20 6c 06	  jsr $066c
$0a:d281  82 21 a0	  brl $72a5
$0a:d284  f8			sed
$0a:d285  58			cli
$0a:d286  36 10		 rol $10,x
$0a:d288  08			php
$0a:d289  87 83		 sta [$83]
$0a:d28b  a1 e0		 lda ($e0,x)
$0a:d28d  f0 70		 beq $d2ff
$0a:d28f  1d 61 40	  ora $4061,x
$0a:d292  50 0b		 bvc $d29f
$0a:d294  b4 20		 ldy $20,x
$0a:d296  16 0d		 asl $0d,x
$0a:d298  05 00		 ora $00
$0a:d29a  2e 52 78	  rol $7852
$0a:d29d  c5 fe		 cmp $fe
$0a:d29f  00 b1		 brk #$b1
$0a:d2a1  03 aa		 ora $aa,s
$0a:d2a3  0e ca 30	  asl $30ca
$0a:d2a6  80 d4		 bra $d27c
$0a:d2a8  88			dey
$0a:d2a9  5c 3c 09 74   jml $74093c
$0a:d2ad  f8			sed
$0a:d2ae  70 0b		 bvs $d2bb
$0a:d2b0  64 a3		 stz $a3
$0a:d2b2  a0 51 43	  ldy #$4351
$0a:d2b5  20 f0 88	  jsr $88f0
$0a:d2b8  38			sec
$0a:d2b9  fc 07 20	  jsr ($2007,x)
$0a:d2bc  79 26 59	  adc $5926,y
$0a:d2bf  41 1f		 eor ($1f,x)
$0a:d2c1  46 00		 lsr $00
$0a:d2c3  8e 85 80	  stx $8085
$0a:d2c6  a6 1f		 ldx $1f
$0a:d2c8  8b			phb
$0a:d2c9  c1 64		 cmp ($64,x)
$0a:d2cb  3e 05 a3	  rol $a305,x
$0a:d2ce  65 94		 adc $94
$0a:d2d0  e2 81		 sep #$81
$0a:d2d2  78			sei
$0a:d2d3  00 4c		 brk #$4c
$0a:d2d5  5e 10 73	  lsr $7310,x
$0a:d2d8  86 59		 stx $59
$0a:d2da  42 00		 wdm #$00
$0a:d2dc  1b			tcs
$0a:d2dd  b0 d0		 bcs $d2af
$0a:d2df  5e 3c 1b	  lsr $1b3c,x
$0a:d2e2  c9 06 d3	  cmp #$d306
$0a:d2e5  b1 7c		 lda ($7c),y
$0a:d2e7  fc 05 41	  jsr ($4105,x)
$0a:d2ea  96 4a		 stx $4a,y
$0a:d2ec  10 46		 bpl $d334
$0a:d2ee  8d 03 31	  sta $3103
$0a:d2f1  60			rts
$0a:d2f2  2c a3 2c	  bit $2ca3
$0a:d2f5  21 d0		 and ($d0,x)
$0a:d2f7  11 99		 ora ($99),y
$0a:d2f9  0d 48 6e	  ora $6e48
$0a:d2fc  c0 0c c8	  cpy #$c80c
$0a:d2ff  60			rts
$0a:d300  33 18		 and ($18,s),y
$0a:d302  09 c6 80	  ora #$80c6
$0a:d305  a6 05		 ldx $05
$0a:d307  36 b0		 rol $b0,x
$0a:d309  27 85		 and [$85]
$0a:d30b  be 0d f1	  ldx $f10d,y
$0a:d30e  32 2c		 and ($2c)
$0a:d310  36 0d		 rol $0d,x
$0a:d312  0a			asl a
$0a:d313  83 c3		 sta $c3,s
$0a:d315  20 63 58	  jsr $5863
$0a:d318  83 1e		 sta $1e,s
$0a:d31a  37 6d		 and [$6d],y
$0a:d31c  76 fb		 ror $fb,x
$0a:d31e  47 bf		 eor [$bf]
$0a:d320  90 cf		 bcc $d2f1
$0a:d322  34 63		 bit $63,x
$0a:d324  fc 16 15	  jsr ($1516,x)
$0a:d327  d9 c2 22	  cmp $22c2,y
$0a:d32a  d0 88		 bne $d2b4
$0a:d32c  64 42		 stz $42
$0a:d32e  30 c4		 bmi $d2f4
$0a:d330  96 23		 stx $23,y
$0a:d332  40			rti
$0a:d333  47 00		 eor [$00]
$0a:d335  70 08		 bvs $d33f
$0a:d337  63 be		 adc $be,s
$0a:d339  a0 46 e0	  ldy #$e046
$0a:d33c  62 4f 82	  per $558e
$0a:d33f  41 70		 eor ($70,x)
$0a:d341  e8			inx
$0a:d342  76 26		 ror $26,x
$0a:d344  0c 48 e0	  tsb $e048
$0a:d347  46 24		 lsr $24
$0a:d349  0f e0 82 3b   ora $3b82e0
$0a:d34d  ea			nop
$0a:d34e  0f 05 81 8b   ora $8b8105
$0a:d352  ac 16 10	  ldy $1016
$0a:d355  28			plp
$0a:d356  40			rti
$0a:d357  3f 3c 52 20   and $20523c,x
$0a:d35b  fc c7 a6	  jsr ($a6c7,x)
$0a:d35e  10 e8		 bpl $d348
$0a:d360  93 fa		 sta ($fa,s),y
$0a:d362  5b			tcd
$0a:d363  61 07		 adc ($07,x)
$0a:d365  82 61 98	  brl $6bc9
$0a:d368  74 b8		 stz $b8,x
$0a:d36a  0b			phd
$0a:d36b  c6 12		 dec $12
$0a:d36d  f0 e8		 beq $d357
$0a:d36f  ae 15 03	  ldx $0315
$0a:d372  83 80		 sta $80,s
$0a:d374  74 56		 stz $56,x
$0a:d376  0a			asl a
$0a:d377  79 43 9e	  adc $9e43,y
$0a:d37a  21 54		 and ($54,x)
$0a:d37c  74 0b		 stz $0b,x
$0a:d37e  61 81		 adc ($81,x)
$0a:d380  c1 a0		 cmp ($a0,x)
$0a:d382  cb			wai
$0a:d383  70 5f		 bvs $d3e4
$0a:d385  f8			sed
$0a:d386  54 e0 1f	  mvn $1f,$e0
$0a:d389  08			php
$0a:d38a  07 42		 ora [$42]
$0a:d38c  71 f4		 adc ($f4),y
$0a:d38e  9a			txs
$0a:d38f  7a			ply
$0a:d390  a3 0c		 lda $0c,s
$0a:d392  4a			lsr a
$0a:d393  27 00		 and [$00]
$0a:d395  ba			tsx
$0a:d396  54 07 0f	  mvn $0f,$07
$0a:d399  88			dey
$0a:d39a  31 30		 and ($30),y
$0a:d39c  9d 26 62	  sta $6226,x
$0a:d39f  a0 16 40	  ldy #$4016
$0a:d3a2  1f 72 0d 03   ora $030d72,x
$0a:d3a6  fa			plx
$0a:d3a7  e9 f7 0c	  sbc #$0cf7
$0a:d3aa  78			sei
$0a:d3ab  36 ed		 rol $ed,x
$0a:d3ad  16 0c		 asl $0c,x
$0a:d3af  3d c0 23	  and $23c0,x
$0a:d3b2  ba			tsx
$0a:d3b3  00 8c		 brk #$8c
$0a:d3b5  cc 05 a1	  cpy $a105
$0a:d3b8  20 a8 28	  jsr $28a8
$0a:d3bb  22 81 c0 c7   jsl $c7c081
$0a:d3bf  f2 28		 sbc ($28)
$0a:d3c1  f8			sed
$0a:d3c2  40			rti
$0a:d3c3  8c f0 38	  sty $38f0
$0a:d3c6  9c 0e 1f	  stz $1f0e
$0a:d3c9  e1 93		 sbc ($93,x)
$0a:d3cb  72 0e		 adc ($0e)
$0a:d3cd  05 80		 ora $80
$0a:d3cf  81 27		 sta ($27,x)
$0a:d3d1  80 8f		 bra $d362
$0a:d3d3  60			rts
$0a:d3d4  23 ef		 and $ef,s
$0a:d3d6  93 80		 sta ($80,s),y
$0a:d3d8  2b			pld
$0a:d3d9  81 fa		 sta ($fa,x)
$0a:d3db  11 28		 ora ($28),y
$0a:d3dd  94 06		 sty $06,x
$0a:d3df  1d 2b 96	  ora $962b,x
$0a:d3e2  10 22		 bpl $d406
$0a:d3e4  1b			tcs
$0a:d3e5  00 7f		 brk #$7f
$0a:d3e7  03 f9		 ora $f9,s
$0a:d3e9  30 08		 bmi $d3f3
$0a:d3eb  80 4c		 bra $d439
$0a:d3ed  8d c2 c1	  sta $c1c2
$0a:d3f0  78			sei
$0a:d3f1  d0 5e		 bne $d451
$0a:d3f3  3c 04 04	  bit $0404,x
$0a:d3f6  2e 01 18	  rol $1801
$0a:d3f9  0b			phd
$0a:d3fa  c1 20		 cmp ($20,x)
$0a:d3fc  0e 04 02	  asl $0204
$0a:d3ff  27 12		 and [$12]
$0a:d401  80 40		 bra $d443
$0a:d403  a0 50 18	  ldy #$1850
$0a:d406  2c 1a 1f	  bit $1f1a
$0a:d409  0b			phd
$0a:d40a  81 c1		 sta ($c1,x)
$0a:d40c  08			php
$0a:d40d  c5 10		 cmp $10
$0a:d40f  86 40		 stx $40
$0a:d411  63 80		 adc $80,s
$0a:d413  10 82		 bpl $d397
$0a:d415  c6 21		 dec $21
$0a:d417  02 e5		 cop #$e5
$0a:d419  fe 44 3b	  inc $3b44,x
$0a:d41c  93 88		 sta ($88,s),y
$0a:d41e  a7 e3		 lda [$e3]
$0a:d420  b1 60		 lda ($60),y
$0a:d422  f8			sed
$0a:d423  66 1a		 ror $1a
$0a:d425  a2 46 18	  ldx #$1846
$0a:d428  44 22 79	  mvp $79,$22
$0a:d42b  1c be 5f	  trb $5fbe
$0a:d42e  3f 17 82 03   and $038217,x
$0a:d432  44 41 00	  mvp $00,$41
$0a:d435  f2 18		 sbc ($18)
$0a:d437  34 16		 bit $16,x
$0a:d439  17 08		 ora [$08],y
$0a:d43b  80 3e		 bra $d47b
$0a:d43d  82 05 00	  brl $d445
$0a:d440  80 c4		 bra $d406
$0a:d442  80 03		 bra $d447
$0a:d444  00 01		 brk #$01
$0a:d446  04 62		 tsb $62
$0a:d448  0d 00 81	  ora $8100
$0a:d44b  8f 41 4c 3e   sta $3e4c41
$0a:d44f  48			pha
$0a:d450  77 7a		 adc [$7a],y
$0a:d452  2d 3c 94	  and $943c
$0a:d455  76 3f		 ror $3f,x
$0a:d457  11 0f		 ora ($0f),y
$0a:d459  c3 78		 cmp $78,s
$0a:d45b  3c 1c 03	  bit $031c,x
$0a:d45e  c8			iny
$0a:d45f  10 82		 bpl $d3e3
$0a:d461  61 00		 adc ($00,x)
$0a:d463  d3 50		 cmp ($50,s),y
$0a:d465  3f 91 8f c4   and $c48f91,x
$0a:d469  61 0e		 adc ($0e,x)
$0a:d46b  48			pha
$0a:d46c  90 83		 bcc $d3f1
$0a:d46e  d2 3b		 cmp ($3b)
$0a:d470  7e 09 3c	  ror $3c09,x
$0a:d473  f2 03		 sbc ($03)
$0a:d475  08			php
$0a:d476  86 41		 stx $41
$0a:d478  21 10		 and ($10,x)
$0a:d47a  72 48		 adc ($48)
$0a:d47c  29 83 19	  and #$1983
$0a:d47f  30 7d		 bmi $d4fe
$0a:d481  04 32		 tsb $32
$0a:d483  01 0a		 ora ($0a,x)
$0a:d485  82 41 20	  brl $f4c9
$0a:d488  70 75		 bvs $d4ff
$0a:d48a  31 f8		 and ($f8),y
$0a:d48c  e0 dd 29	  cpx #$29dd
$0a:d48f  4e 0d de	  lsr $de0d
$0a:d492  11 3b		 ora ($3b),y
$0a:d494  05 c3		 ora $c3
$0a:d496  41 c0		 eor ($c0,x)
$0a:d498  0c 95 06	  tsb $0695
$0a:d49b  31 63		 and ($63),y
$0a:d49d  81 d4		 sta ($d4,x)
$0a:d49f  e4 79		 cpx $79
$0a:d4a1  3b			tsc
$0a:d4a2  1d c3 00	  ora $00c3,x
$0a:d4a5  19 48 1c	  ora $1c48,y
$0a:d4a8  0e 13 01	  asl $0113
$0a:d4ab  00 04		 brk #$04
$0a:d4ad  76 01		 ror $01,x
$0a:d4af  1b			tcs
$0a:d4b0  81 45		 sta ($45,x)
$0a:d4b2  61 d1		 adc ($d1,x)
$0a:d4b4  d8			cld
$0a:d4b5  74 38		 stz $38,x
$0a:d4b7  ee 10 02	  inc $0210
$0a:d4ba  38			sec
$0a:d4bb  30 4a		 bmi $d507
$0a:d4bd  04 78		 tsb $78
$0a:d4bf  08			php
$0a:d4c0  34 39		 bit $39,x
$0a:d4c2  04 3e		 tsb $3e
$0a:d4c4  28			plp
$0a:d4c5  e7 ba		 sbc [$ba]
$0a:d4c7  39 fc 07	  and $07fc,y
$0a:d4ca  04 03		 tsb $03
$0a:d4cc  f0 5a		 beq $d528
$0a:d4ce  08			php
$0a:d4cf  06 01		 asl $01
$0a:d4d1  f8			sed
$0a:d4d2  44 30 13	  mvp $13,$30
$0a:d4d5  b0 a8		 bcs $d47f
$0a:d4d7  e1 e3		 sbc ($e3,x)
$0a:d4d9  80 83		 bra $d45e
$0a:d4db  0e 02 31	  asl $3102
$0a:d4de  28			plp
$0a:d4df  8b			phb
$0a:d4e0  c3 e1		 cmp $e1,s
$0a:d4e2  e2 a3		 sep #$a3
$0a:d4e4  83 98		 sta $98,s
$0a:d4e6  42 f3		 wdm #$f3
$0a:d4e8  00 bb		 brk #$bb
$0a:d4ea  ca			dex
$0a:d4eb  28			plp
$0a:d4ec  ef 94 15 05   sbc $051594
$0a:d4f0  c3 a1		 cmp $a1,s
$0a:d4f2  00 90		 brk #$90
$0a:d4f4  04 83		 tsb $83
$0a:d4f6  81 e0		 sta ($e0,x)
$0a:d4f8  a0 60 1b	  ldy #$1b60
$0a:d4fb  64 ea		 stz $ea
$0a:d4fd  0a			asl a
$0a:d4fe  80 44		 bra $d544
$0a:d500  38			sec
$0a:d501  01 41		 ora ($41,x)
$0a:d503  6d 1b a8	  adc $a81b
$0a:d506  e0 d1 88	  cpx #$88d1
$0a:d509  85 42		 sta $42
$0a:d50b  c0 f7 67	  cpy #$67f7
$0a:d50e  50 fe		 bvc $d50e
$0a:d510  62 1e 7b	  per $5031
$0a:d513  00 da		 brk #$da
$0a:d515  02 21		 cop #$21
$0a:d517  10 09		 bpl $d522
$0a:d519  95 81		 sta $81,x
$0a:d51b  b6 02		 ldx $02,y
$0a:d51d  75 88		 adc $88,x
$0a:d51f  08			php
$0a:d520  b2 01		 lda ($01)
$0a:d522  04 87		 tsb $87
$0a:d524  8c 42 e1	  sty $e142
$0a:d527  68			pla
$0a:d528  1a			inc a
$0a:d529  c4 33		 cpy $33
$0a:d52b  e0 41 0b	  cpx #$0b41
$0a:d52e  44 1c 8b	  mvp $8b,$1c
$0a:d531  11 2c		 ora ($2c),y
$0a:d533  1c 2e 2d	  trb $2d2e
$0a:d536  60			rts
$0a:d537  b8			clv
$0a:d538  6c 04 82	  jmp ($8204)
$0a:d53b  e9 48		 sbc #$48
$0a:d53d  15 b2		 ora $b2,x
$0a:d53f  23 e0		 and $e0,s
$0a:d541  b8			clv
$0a:d542  60			rts
$0a:d543  38			sec
$0a:d544  0e 27 95	  asl $9527
$0a:d547  cb			wai
$0a:d548  26 f3		 rol $f3
$0a:d54a  8a			txa
$0a:d54b  7c a2 df	  jmp ($dfa2,x)
$0a:d54e  10 f7		 bpl $d547
$0a:d550  de 37 97	  dec $9737,x
$0a:d553  8b			phb
$0a:d554  e3 70		 sbc $70,s
$0a:d556  dd 41 08	  cmp $0841,x
$0a:d559  6f 84 62 d1   adc $d16284
$0a:d55d  10 bc		 bpl $d51b
$0a:d55f  3a			dec a
$0a:d560  8f f1 00 f8   sta $f800f1
$0a:d564  34 04		 bit $04,x
$0a:d566  c7 4e		 cmp [$4e]
$0a:d568  0f 78 fb f2   ora $f2fb78
$0a:d56c  20 30 67	  jsr $6730
$0a:d56f  e6 29		 inc $29
$0a:d571  60			rts
$0a:d572  2f e9 c2 81   and $81c2e9
$0a:d576  49 64		 eor #$64
$0a:d578  82 fb 9e	  brl $7476
$0a:d57b  49 e3		 eor #$e3
$0a:d57d  0f cc 6b f3   ora $f36bcc
$0a:d581  5e 60 90	  lsr $9060,x
$0a:d584  58			cli
$0a:d585  0c 3e 09	  tsb $093e
$0a:d588  0e 37 c4	  asl $c437
$0a:d58b  0c 1c 10	  tsb $101c
$0a:d58e  88			dey
$0a:d58f  04 24		 tsb $24
$0a:d591  c9 0d		 cmp #$0d
$0a:d593  71 e0		 adc ($e0),y
$0a:d595  50 30		 bvc $d5c7
$0a:d597  01 d7		 ora ($d7,x)
$0a:d599  6b			rtl
$0a:d59a  83 5e		 sta $5e,s
$0a:d59c  a0 f0 08	  ldy #$08f0
$0a:d59f  1c 32 2f	  trb $2f32
$0a:d5a2  18			clc
$0a:d5a3  5c 84 7e 20   jml $207e84
$0a:d5a7  43 65		 eor $65,s
$0a:d5a9  f0 48		 beq $d5f3
$0a:d5ab  19 06 9f	  ora $9f06,y
$0a:d5ae  a5 3e		 lda $3e
$0a:d5b0  3a			dec a
$0a:d5b1  3a			dec a
$0a:d5b2  08			php
$0a:d5b3  87 05		 sta [$05]
$0a:d5b5  b0 3b		 bcs $d5f2
$0a:d5b7  aa			tax
$0a:d5b8  07 03		 ora [$03]
$0a:d5ba  7c 81 8a	  jmp ($8a81,x)
$0a:d5bd  b0 14		 bcs $d5d3
$0a:d5bf  04 d0		 tsb $d0
$0a:d5c1  18			clc
$0a:d5c2  ad 3c 01	  lda $013c
$0a:d5c5  b0 77		 bcs $d63e
$0a:d5c7  f8			sed
$0a:d5c8  f9 c1 3e	  sbc $3ec1,y
$0a:d5cb  1a			inc a
$0a:d5cc  f1 5e		 sbc ($5e),y
$0a:d5ce  18			clc
$0a:d5cf  c2 05		 rep #$05
$0a:d5d1  02 80		 cop #$80
$0a:d5d3  9b			txy
$0a:d5d4  b2 03		 lda ($03)
$0a:d5d6  01 81		 ora ($81,x)
$0a:d5d8  1b			tcs
$0a:d5d9  aa			tax
$0a:d5da  81 40		 sta ($40,x)
$0a:d5dc  d0 1b		 bne $d5f9
$0a:d5de  ae 81 80	  ldx $8081
$0a:d5e1  f0 18		 beq $d5fb
$0a:d5e3  cc fa 07	  cpy $07fa
$0a:d5e6  d0 81		 bne $d569
$0a:d5e8  c0 a0 f0	  cpy #$f0a0
$0a:d5eb  08			php
$0a:d5ec  4c 3e 0d	  jmp $0d3e
$0a:d5ef  0d 1f 54	  ora $541f
$0a:d5f2  22 09 0c 31   jsl $310c09
$0a:d5f6  8a			txa
$0a:d5f7  b4 1a		 ldy $1a,x
$0a:d5f9  2d 20 90	  and $9020
$0a:d5fc  76 3a		 ror $3a,x
$0a:d5fe  06 ea		 asl $ea
$0a:d600  15 84		 ora $84,x
$0a:d602  80 78		 bra $d67c
$0a:d604  31 78		 and ($78),y
$0a:d606  24 aa		 bit $aa
$0a:d608  29 28		 and #$28
$0a:d60a  97 47		 sta [$47],y
$0a:d60c  23 d0		 and $d0,s
$0a:d60e  f8			sed
$0a:d60f  04 2a		 tsb $2a
$0a:d611  0e 8c 18	  asl $188c
$0a:d614  e3 28		 sbc $28,s
$0a:d616  24 30		 bit $30
$0a:d618  08			php
$0a:d619  e4 36		 cpx $36
$0a:d61b  18			clc
$0a:d61c  06 08		 asl $08
$0a:d61e  60			rts
$0a:d61f  e4 11		 cpx $11
$0a:d621  c0 5d 17	  cpy #$175d
$0a:d624  68			pla
$0a:d625  3b			tsc
$0a:d626  40			rti
$0a:d627  c6 2e		 dec $2e
$0a:d629  d0 a0		 bne $d5cb
$0a:d62b  58			cli
$0a:d62c  1d 64 eb	  ora $eb64,x
$0a:d62f  13 58		 ora ($58,s),y
$0a:d631  34 4b		 bit $4b,x
$0a:d633  80 ab		 bra $d5e0
$0a:d635  03 18		 ora $18,s
$0a:d637  57 e7		 eor [$e7],y
$0a:d639  16 e9		 asl $e9,x
$0a:d63b  87 3f		 sta [$3f]
$0a:d63d  91 8e		 sta ($8e),y
$0a:d63f  e6 41		 inc $41
$0a:d641  21 d0		 and ($d0,x)
$0a:d643  a8			tay
$0a:d644  2c 36 1b	  bit $1b36
$0a:d647  08			php
$0a:d648  87 57		 sta [$57]
$0a:d64a  20 14 18	  jsr $1814
$0a:d64d  07 2f		 ora [$2f]
$0a:d64f  81 cc		 sta ($cc,x)
$0a:d651  e0 c3 a0	  cpx #$a0c3
$0a:d654  30 48		 bmi $d69e
$0a:d656  04 38		 tsb $38
$0a:d658  0e 22 c1	  asl $c122
$0a:d65b  36 c1		 rol $c1,x
$0a:d65d  b4 30		 ldy $30,x
$0a:d65f  05 c1		 ora $c1
$0a:d661  74 90		 stz $90,x
$0a:d663  98			tya
$0a:d664  cc 05 06	  cpy $0605
$0a:d667  52 84		 eor ($84)
$0a:d669  26 13		 rol $13
$0a:d66b  00 86		 brk #$86
$0a:d66d  41 60		 eor ($60,x)
$0a:d66f  d0 38		 bne $d6a9
$0a:d671  2c 0a 06	  bit $060a
$0a:d674  b7 05		 lda [$05],y
$0a:d676  b8			clv
$0a:d677  42 61		 wdm #$61
$0a:d679  a0 d0 83	  ldy #$83d0
$0a:d67c  03 01		 ora $01,s
$0a:d67e  de 00 d0	  dec $d000,x
$0a:d681  3d 81 ec	  and $ec81,x
$0a:d684  0c 04 a5	  tsb $a504
$0a:d687  0c 01 78	  tsb $7801
$0a:d68a  38			sec
$0a:d68b  02 a0		 cop #$a0
$0a:d68d  2e 02 4c	  rol $4c02
$0a:d690  4b			phk
$0a:d691  80 d1		 bra $d664
$0a:d693  1c 05 82	  trb $8205
$0a:d696  81 20		 sta ($20,x)
$0a:d698  16 02		 asl $02,x
$0a:d69a  40			rti
$0a:d69b  a3 d1		 lda $d1,s
$0a:d69d  2e ed 8e	  rol $8eed
$0a:d6a0  1f f1 ff c0   ora $c0fff1,x
$0a:d6a4  2f f0 08 fc   and $fc08f0
$0a:d6a8  02 0e		 cop #$0e
$0a:d6aa  55 18		 eor $18,x
$0a:d6ac  8c 82 81	  sty $8182
$0a:d6af  30 f8		 bmi $d6a9
$0a:d6b1  14 dd		 trb $dd
$0a:d6b3  26 41		 rol $41
$0a:d6b5  a1 a0		 lda ($a0,x)
$0a:d6b7  54 38 1b	  mvn $1b,$38
$0a:d6ba  8b			phb
$0a:d6bb  87 e2		 sta [$e2]
$0a:d6bd  e1 e8		 sbc ($e8,x)
$0a:d6bf  b8			clv
$0a:d6c0  30 c9		 bmi $d68b
$0a:d6c2  52 4a		 eor ($4a)
$0a:d6c4  70 a8		 bvs $d66e
$0a:d6c6  48			pha
$0a:d6c7  2e 10 07	  rol $0710
$0a:d6ca  48			pha
$0a:d6cb  15 4e		 ora $4e,x
$0a:d6cd  03 05		 ora $05,s
$0a:d6cf  05 81		 ora $81
$0a:d6d1  e4 20		 cpx $20
$0a:d6d3  d0 14		 bne $d6e9
$0a:d6d5  68			pla
$0a:d6d6  95 42		 sta $42,x
$0a:d6d8  07 04		 ora [$04]
$0a:d6da  80 a1		 bra $d67d
$0a:d6dc  05 0a		 ora $0a
$0a:d6de  0f 81 2a 9f   ora $9f2a81
$0a:d6e2  22 01 10 84   jsl $841001
$0a:d6e6  04 83		 tsb $83
$0a:d6e8  01 08		 ora ($08,x)
$0a:d6ea  6e 07 03	  ror $0307
$0a:d6ed  40			rti
$0a:d6ee  a2 02 a9	  ldx #$a902
$0a:d6f1  42 3d		 wdm #$3d
$0a:d6f3  10 06		 bpl $d6fb
$0a:d6f5  18			clc
$0a:d6f6  5c 1d 21 a0   jml $a0211d
$0a:d6fa  29 b3		 and #$b3
$0a:d6fc  cb			wai
$0a:d6fd  c0 74 64	  cpy #$6474
$0a:d700  08			php
$0a:d701  9c 0c 72	  stz $720c
$0a:d704  18			clc
$0a:d705  48			pha
$0a:d706  75 e3		 adc $e3,x
$0a:d708  e8			inx
$0a:d709  19 68 1f	  ora $1f68,y
$0a:d70c  8e 07 f3	  stx $f307
$0a:d70f  87 5f		 sta [$5f]
$0a:d711  af 90 c1 4a   lda $4ac190
$0a:d715  40			rti
$0a:d716  45 60		 eor $60
$0a:d718  89 03		 bit #$03
$0a:d71a  69 22		 adc #$22
$0a:d71c  40			rti
$0a:d71d  f0 47		 beq $d766
$0a:d71f  71 37		 adc ($37),y
$0a:d721  89 48		 bit #$48
$0a:d723  20 50 24	  jsr $2450
$0a:d726  28			plp
$0a:d727  22 04 56 0a   jsl $0a5604
$0a:d72b  20 b0 34	  jsr $34b0
$0a:d72e  43 41		 eor $41,s
$0a:d730  20 90 0a	  jsr $0a90
$0a:d733  c1 2a		 cmp ($2a,x)
$0a:d735  0c 00 e0	  tsb $e000
$0a:d738  60			rts
$0a:d739  24 0e		 bit $0e
$0a:d73b  01 27		 ora ($27,x)
$0a:d73d  84 80		 sty $80
$0a:d73f  9e 1e 05	  stz $051e,x
$0a:d742  28			plp
$0a:d743  50 30		 bvc $d775
$0a:d745  14 08		 trb $08
$0a:d747  04 3d		 tsb $3d
$0a:d749  5c 70 73 00   jml $007370
$0a:d74d  1b			tcs
$0a:d74e  89 77		 bit #$77
$0a:d750  e2 b0		 sep #$b0
$0a:d752  ce 54 2b	  dec $2b54
$0a:d755  9d 06 78	  sta $7806,x
$0a:d758  7b			tdc
$0a:d759  a4 1e		 ldy $1e
$0a:d75b  c8			iny
$0a:d75c  f7 7a		 sbc [$7a],y
$0a:d75e  7d 7c 15	  adc $157c,x
$0a:d761  8a			txa
$0a:d762  58			cli
$0a:d763  1b			tcs
$0a:d764  e7 10		 sbc [$10]
$0a:d766  87 4c		 sta [$4c]
$0a:d768  27 cb		 and [$cb]
$0a:d76a  e7 1d		 sbc [$1d]
$0a:d76c  82 d4 16	  brl $ee43
$0a:d76f  a2 40		 ldx #$40
$0a:d771  28			plp
$0a:d772  2a			rol a
$0a:d773  fb			xce
$0a:d774  0e 44 8d	  asl $8d44
$0a:d777  2f 80 50 21   and $215080
$0a:d77b  1d 49 a7	  ora $a749,x
$0a:d77e  ba			tsx
$0a:d77f  39 d6 94	  and $94d6,y
$0a:d782  2f a2 10 eb   and $eb10a2
$0a:d786  28			plp
$0a:d787  83 ad		 sta $ad,s
$0a:d789  9e a1 3e	  stz $3ea1,x
$0a:d78c  81 46		 sta ($46,x)
$0a:d78e  60			rts
$0a:d78f  93 e8		 sta ($e8,s),y
$0a:d791  73 ac		 adc ($ac,s),y
$0a:d793  ac 56 29	  ldy $2956
$0a:d796  03 94		 ora $94,s
$0a:d798  22 f0 29 ed   jsl $ed29f0
$0a:d79c  06 9d		 asl $9d
$0a:d79e  0e 98 ba	  asl $ba98
$0a:d7a1  db			stp
$0a:d7a2  01 00		 ora ($00,x)
$0a:d7a4  d0 70		 bne $d816
$0a:d7a6  2e 12 0c	  rol $0c12
$0a:d7a9  81 5c		 sta ($5c,x)
$0a:d7ab  1d 63 0c	  ora $0c63,x
$0a:d7ae  86 44		 stx $44
$0a:d7b0  05 c1		 ora $c1
$0a:d7b2  80 c3		 bra $d777
$0a:d7b4  59 82 81	  eor $8182,y
$0a:d7b7  80 48		 bra $d801
$0a:d7b9  83 ad		 sta $ad,s
$0a:d7bb  60			rts
$0a:d7bc  d0 68		 bne $d826
$0a:d7be  7c 26 1b	  jmp ($1b26,x)
$0a:d7c1  02 8d		 cop #$8d
$0a:d7c3  bf 9e 0d 01   lda $010d9e,x
$0a:d7c7  84 83		 sty $83
$0a:d7c9  02 0f		 cop #$0f
$0a:d7cb  05 8b		 ora $8b
$0a:d7cd  ba			tsx
$0a:d7ce  da			phx
$0a:d7cf  81 40		 sta ($40,x)
$0a:d7d1  f0 48		 beq $d81b
$0a:d7d3  02 61		 cop #$61
$0a:d7d5  b0 a0		 bcs $d777
$0a:d7d7  23 df		 and $df,s
$0a:d7d9  01 20		 ora ($20,x)
$0a:d7db  4f 06 82 81   eor $818206
$0a:d7df  d0 15		 bne $d7f6
$0a:d7e1  24 61		 bit $61
$0a:d7e3  e4 11		 cpx $11
$0a:d7e5  c8			iny
$0a:d7e6  34 7a		 bit $7a,x
$0a:d7e8  bd 5e ce	  lda $ce5e,x
$0a:d7eb  47 c0		 eor [$c0]
$0a:d7ed  73 21		 adc ($21,s),y
$0a:d7ef  a1 48		 lda ($48,x)
$0a:d7f1  60			rts
$0a:d7f2  66 e3		 ror $e3
$0a:d7f4  17 04		 ora [$04],y
$0a:d7f6  c0 ac		 cpy #$ac
$0a:d7f8  17 0e		 ora [$0e],y
$0a:d7fa  07 c3		 ora [$c3]
$0a:d7fc  e9 f4		 sbc #$f4
$0a:d7fe  b9 7c 1f	  lda $1f7c,y
$0a:d801  f1 80		 sbc ($80),y
$0a:d803  84 61		 sty $61
$0a:d805  21 18		 and ($18,x)
$0a:d807  08			php
$0a:d808  64 03		 stz $03
$0a:d80a  80 ef		 bra $d7fb
$0a:d80c  1f 06 43 e1   ora $e14306,x
$0a:d810  70 2d		 bvs $d83f
$0a:d812  84 42		 sty $42
$0a:d814  41 28		 eor ($28,x)
$0a:d816  86 0a		 stx $0a
$0a:d818  4d 82 19	  eor $1982
$0a:d81b  08			php
$0a:d81c  05 c1		 ora $c1
$0a:d81e  82 13 08	  brl $e034
$0a:d821  84 e2		 sty $e2
$0a:d823  10 66		 bpl $d88b
$0a:d825  08			php
$0a:d826  30 3c		 bmi $d864
$0a:d828  61 d1		 adc ($d1,x)
$0a:d82a  28			plp
$0a:d82b  f4 72 38	  pea $3872
$0a:d82e  0d 08 44	  ora $4408
$0a:d831  a2 c1		 ldx #$c1
$0a:d833  20 60 a4	  jsr $a460
$0a:d836  4a			lsr a
$0a:d837  01 1c		 ora ($1c,x)
$0a:d839  60			rts
$0a:d83a  84 60		 sty $60
$0a:d83c  16 04		 asl $04,x
$0a:d83e  60			rts
$0a:d83f  60			rts
$0a:d840  a4 62		 ldy $62
$0a:d842  31 30		 and ($30),y
$0a:d844  9c 58 2a	  stz $2a58
$0a:d847  1a			inc a
$0a:d848  7e 25 ff	  ror $ff25,x
$0a:d84b  34 2f		 bit $2f,x
$0a:d84d  69 c4		 adc #$c4
$0a:d84f  e2 a1		 sep #$a1
$0a:d851  50 ed		 bvc $d840
$0a:d853  f0 38		 beq $d88d
$0a:d855  8f 20 27 cf   sta $cf2720
$0a:d859  ca			dex
$0a:d85a  85 f0		 sta $f0
$0a:d85c  d1 13		 cmp ($13),y
$0a:d85e  eb			xba
$0a:d85f  65 0e		 adc $0e
$0a:d861  a9 43		 lda #$43
$0a:d863  98			tya
$0a:d864  29 02		 and #$02
$0a:d866  83 47		 sta $47,s
$0a:d868  27 d7		 and [$d7]
$0a:d86a  8b			phb
$0a:d86b  24 fe		 bit $fe
$0a:d86d  b9 7f 8d	  lda $8d7f,y
$0a:d870  30 52		 bmi $d8c4
$0a:d872  0d 06 9f	  ora $9f06
$0a:d875  4f af 97 ca   eor $ca97af
$0a:d879  1d 02 88	  ora $8802,x
$0a:d87c  aa			tax
$0a:d87d  02 87		 cop #$87
$0a:d87f  98			tya
$0a:d880  72 0f		 adc ($0f)
$0a:d882  00 87		 brk #$87
$0a:d884  ac 1e 0f	  ldy $0f1e
$0a:d887  08			php
$0a:d888  82 84 81	  brl $5a0f
$0a:d88b  7f af 21 68   adc $6821af,x
$0a:d88f  3f 02 41 40   and $404102,x
$0a:d893  27 5a		 and [$5a]
$0a:d895  3c a1 30	  bit $30a1,x
$0a:d898  18			clc
$0a:d899  c4 06		 cpy $06
$0a:d89b  35 03		 and $03,x
$0a:d89d  8d c0 a2	  sta $a2c0
$0a:d8a0  30 e8		 bmi $d88a
$0a:d8a2  ec 3a 1f	  cpx $1f3a
$0a:d8a5  0c 41 88	  tsb $8841
$0a:d8a8  44 60 87	  mvp $87,$60
$0a:d8ab  40			rti
$0a:d8ac  82 42 a0	  brl $78f1
$0a:d8af  86 e0		 stx $e0
$0a:d8b1  7e 0c 03	  ror $030c,x
$0a:d8b4  95 3c		 sta $3c,x
$0a:d8b6  f7 47		 sbc [$47],y
$0a:d8b8  3f 90 00 98   and $980090,x
$0a:d8bc  7c 19 c2	  jmp ($c219,x)
$0a:d8bf  8f 29 e4 02   sta $02e429
$0a:d8c3  38			sec
$0a:d8c4  bf bb bc 62   lda $62bcbb,x
$0a:d8c8  78			sei
$0a:d8c9  f4 08 3c	  pea $3c08
$0a:d8cc  3e 2b 16	  rol $162b,x
$0a:d8cf  8e c3 e0	  stx $e0c3
$0a:d8d2  f0 b8		 beq $d88c
$0a:d8d4  3c 12 07	  bit $0712,x
$0a:d8d7  10 a6		 bpl $d87f
$0a:d8d9  40			rti
$0a:d8da  e0 70		 cpx #$70
$0a:d8dc  78			sei
$0a:d8dd  3c 56 2f	  bit $2f56,x
$0a:d8e0  1d 8f c3	  ora $c38f,x
$0a:d8e3  c9 22		 cmp #$22
$0a:d8e5  43 0d		 eor $0d,s
$0a:d8e7  85 40		 sta $40
$0a:d8e9  2e 17 0c	  rol $0c17
$0a:d8ec  07 82		 ora [$82]
$0a:d8ee  a1 d0		 lda ($d0,x)
$0a:d8f0  b8			clv
$0a:d8f1  78			sei
$0a:d8f2  38			sec
$0a:d8f3  1a			inc a
$0a:d8f4  0e 05 03	  asl $0305
$0a:d8f7  01 10		 ora ($10,x)
$0a:d8f9  f0 60		 beq $d95b
$0a:d8fb  32 1c		 and ($1c)
$0a:d8fd  0e 01 58	  asl $5801
$0a:d900  7e 1e 03	  ror $031e,x
$0a:d903  48			pha
$0a:d904  98			tya
$0a:d905  c2 3d		 rep #$3d
$0a:d907  05 8f		 ora $8f
$0a:d909  c1 e2		 cmp ($e2,x)
$0a:d90b  f0 f8		 beq $d905
$0a:d90d  dc 11 5e	  jml [$5e11]
$0a:d910  10 28		 bpl $d93a
$0a:d912  0a			asl a
$0a:d913  3c a0 b1	  bit $b1a0,x
$0a:d916  74 00		 stz $00,x
$0a:d918  12 44		 ora ($44)
$0a:d91a  e2 10		 sep #$10
$0a:d91c  72 08		 adc ($08)
$0a:d91e  27 cb		 and [$cb]
$0a:d920  e1 40		 sbc ($40,x)
$0a:d922  f8			sed
$0a:d923  70 3a		 bvs $d95f
$0a:d925  1e 0d 83	  asl $830d,x
$0a:d928  74 70		 stz $70,x
$0a:d92a  02 33		 cop #$33
$0a:d92c  a0 74		 ldy #$74
$0a:d92e  14 00		 trb $00
$0a:d930  69 14 88	  adc #$8814
$0a:d933  70 30		 bvs $d965
$0a:d935  09 93 ef	  ora #$ef93
$0a:d938  cc 3f fc	  cpy $fc3f
$0a:d93b  0d ff 03	  ora $03ff
$0a:d93e  ff 00 bf c0   sbc $c0bf00,x
$0a:d942  27 f0		 and [$f0]
$0a:d944  08			php
$0a:d945  78			sei
$0a:d946  8c 6c 16	  sty $166c
$0a:d949  03 18		 ora $18,s
$0a:d94b  18			clc
$0a:d94c  c0 47		 cpy #$47
$0a:d94e  1f 68 c7 fa   ora $fac768,x
$0a:d952  0d fa 83	  ora $83fa
$0a:d955  7f 82 83 f8   adc $f88382,x
$0a:d959  80 78		 bra $d9d3
$0a:d95b  04 63		 tsb $63
$0a:d95d  0c 86 41	  tsb $4186
$0a:d960  9c 22 23	  stz $2322
$0a:d963  88			dey
$0a:d964  dc 42 3d	  jml [$3d42]
$0a:d967  13 86		 ora ($86,s),y
$0a:d969  c3 61		 cmp $61,s
$0a:d96b  30 88		 bmi $d8f5
$0a:d96d  38			sec
$0a:d96e  24 04		 bit $04
$0a:d970  67 0c		 adc [$0c]
$0a:d972  7f 0c 0a 00   adc $000a0c,x
$0a:d976  e4 8d		 cpx $8d
$0a:d978  84 43		 sty $43
$0a:d97a  e1 90		 sbc ($90,x)
$0a:d97c  5f 84 82 41   eor $418284,x
$0a:d980  c0 f0		 cpy #$f0
$0a:d982  31 52		 and ($52),y
$0a:d984  c0 1e		 cpy #$1e
$0a:d986  14 c8		 trb $c8
$0a:d988  31 22		 and ($22),y
$0a:d98a  9f 08 8f c2   sta $c28f08,x
$0a:d98e  21 f0		 and ($f0,x)
$0a:d990  48			pha
$0a:d991  74 06		 stz $06,x
$0a:d993  08			php
$0a:d994  c5 5a		 cmp $5a
$0a:d996  a5 82		 lda $82
$0a:d998  29 20 8c	  and #$8c20
$0a:d99b  40			rti
$0a:d99c  23 8f		 and $8f,s
$0a:d99e  e1 1b		 sbc ($1b,x)
$0a:d9a0  a7 c2		 lda [$c2]
$0a:d9a2  40			rti
$0a:d9a3  4f 0f 05 01   eor $01050f
$0a:d9a7  b6 14		 ldx $14,y
$0a:d9a9  06 2a		 asl $2a
$0a:d9ab  d4 21		 pei ($21)
$0a:d9ad  95 08		 sta $08,x
$0a:d9af  44 c2 01	  mvp $01,$c2
$0a:d9b2  70 0f		 bvs $d9c3
$0a:d9b4  09 5d 2f	  ora #$2f5d
$0a:d9b7  f7 88		 sbc [$88],y
$0a:d9b9  7c a0 66	  jmp ($66a0,x)
$0a:d9bc  50 86		 bvc $d944
$0a:d9be  2a			rol a
$0a:d9bf  d9 20 13	  cmp $1320,y
$0a:d9c2  48			pha
$0a:d9c3  01 0f		 ora ($0f,x)
$0a:d9c5  ca			dex
$0a:d9c6  9e 65 88	  stz $8865,x
$0a:d9c9  ac 3a 63	  ldy $633a
$0a:d9cc  0e 9e c3	  asl $c39e
$0a:d9cf  a7 f0		 lda [$f0]
$0a:d9d1  c8			iny
$0a:d9d2  fc 01 6e	  jsr ($6e01,x)
$0a:d9d5  10 f8		 bpl $d9cf
$0a:d9d7  04 0c		 tsb $0c
$0a:d9d9  0c 10 68	  tsb $6810
$0a:d9dc  50 d0		 bvc $d9ae
$0a:d9de  1f c2 06 6a   ora $6a06c2,x
$0a:d9e2  87 82		 sta [$82]
$0a:d9e4  31 e0		 and ($e0),y
$0a:d9e6  bc 78 3f	  ldy $3f78,x
$0a:d9e9  16 0f		 asl $0f,x
$0a:d9eb  82 38 20	  brl $fa26
$0a:d9ee  01 80		 ora ($80,x)
$0a:d9f0  11 80		 ora ($80),y
$0a:d9f2  90 34		 bcc $da28
$0a:d9f4  09 41 0f	  ora #$0f41
$0a:d9f7  83 9b		 sta $9b,s
$0a:d9f9  17 60		 ora [$60],y
$0a:d9fb  b9 18 84	  lda $8418,y
$0a:d9fe  4a			lsr a
$0a:d9ff  25 36		 and $36
$0a:da01  9c b1 9d	  stz $9db1
$0a:da04  8c 30 d6	  sty $d630
$0a:da07  33 b7		 and ($b7,s),y
$0a:da09  43 80		 eor $80,s
$0a:da0b  dc 0b 05	  jml [$050b]
$0a:da0e  02 c1		 cop #$c1
$0a:da10  80 4a		 bra $da5c
$0a:da12  83 fe		 sta $fe,s
$0a:da14  5b			tcd
$0a:da15  a1 20		 lda ($20,x)
$0a:da17  7f cc 19 74   adc $7419cc,x
$0a:da1b  2f 50 63 24   and $246350
$0a:da1f  c2 60		 rep #$60
$0a:da21  fb			xce
$0a:da22  08			php
$0a:da23  42 1c		 wdm #$1c
$0a:da25  21 52		 and ($52,x)
$0a:da27  09 23 fe	  ora #$fe23
$0a:da2a  9b			txy
$0a:da2b  24 ff		 bit $ff
$0a:da2d  88			dey
$0a:da2e  62 1c 14	  per $ee4d
$0a:da31  a0 1e		 ldy #$1e
$0a:da33  78			sei
$0a:da34  24 0d		 bit $0d
$0a:da36  82 11 d8	  brl $b24a
$0a:da39  24 7e		 bit $7e
$0a:da3b  12 c6		 ora ($c6)
$0a:da3d  68			pla
$0a:da3e  3c 1e 09	  bit $091e,x
$0a:da41  0f 82 c4 8f   ora $8fc482
$0a:da45  ce e4 0c	  dec $0ce4
$0a:da48  03 5c		 ora $5c,s
$0a:da4a  22 12 0e 83   jsl $830e12
$0a:da4e  19 f8 06	  ora $06f8,y
$0a:da51  e0 6b		 cpx #$6b
$0a:da53  93 5c		 sta ($5c,s),y
$0a:da55  10 c1		 bpl $da18
$0a:da57  08			php
$0a:da58  e1 f3		 sbc ($f3,x)
$0a:da5a  f5 3c		 sbc $3c,x
$0a:da5c  9f dc ab 17   sta $17abdc,x
$0a:da60  38			sec
$0a:da61  c3 c2		 cmp $c2,s
$0a:da63  38			sec
$0a:da64  f4 00 11	  pea $1100
$0a:da67  73 f8		 adc ($f8,s),y
$0a:da69  1c 9e 37	  trb $379e
$0a:da6c  2b			pld
$0a:da6d  09 58 82	  ora #$8258
$0a:da70  43 2e		 eor $2e,s
$0a:da72  14 49		 trb $49
$0a:da74  c2 94		 rep #$94
$0a:da76  64 1c		 stz $1c
$0a:da78  6d 34 aa	  adc $aa34
$0a:da7b  4d be d4	  eor $d4be
$0a:da7e  68			pla
$0a:da7f  a7 1c		 lda [$1c]
$0a:da81  26 90		 rol $90
$0a:da83  41 00		 eor ($00,x)
$0a:da85  45 a6		 eor $a6
$0a:da87  83 49		 sta $49,s
$0a:da89  9a			txs
$0a:da8a  61 42		 adc ($42,x)
$0a:da8c  9a			txs
$0a:da8d  06 c2		 asl $c2
$0a:da8f  38			sec
$0a:da90  cd 19 81	  cmp $8119
$0a:da93  68			pla
$0a:da94  22 1f 0f 87   jsl $870f1f
$0a:da98  83 d1		 sta $d1,s
$0a:da9a  c8			iny
$0a:da9b  8a			txa
$0a:da9c  45 23		 eor $23
$0a:da9e  91 08		 sta ($08),y
$0a:daa0  54 2c c0	  mvn $c0,$2c
$0a:daa3  4f 00 f0 44   eor $44f000
$0a:daa7  3a			dec a
$0a:daa8  13 88		 ora ($88,s),y
$0a:daaa  81 24		 sta ($24,x)
$0a:daac  5b			tcd
$0a:daad  c3 18		 cmp $18,s
$0a:daaf  80 47		 bra $daf8
$0a:dab1  a2 11 e8	  ldx #$e811
$0a:dab4  f4 3a 5d	  pea $5d3a
$0a:dab7  26 a8		 rol $a8
$0a:dab9  54 2e 11	  mvn $11,$2e
$0a:dabc  0d 06 80	  ora $8006
$0a:dabf  c0 41 00	  cpy #$0041
$0a:dac2  87 44		 sta [$44]
$0a:dac4  22 c0 80 90   jsl $9080c0
$0a:dac8  58			cli
$0a:dac9  20 0b e3	  jsr $e30b
$0a:dacc  30 2c		 bmi $dafa
$0a:dace  42 01		 wdm #$01
$0a:dad0  19 88 c3	  ora $c388,y
$0a:dad3  c9 f2 10	  cmp #$10f2
$0a:dad6  19 04 3c	  ora $3c04,y
$0a:dad9  d8			cld
$0a:dada  03 f3		 ora $f3,s
$0a:dadc  a0 78 2d	  ldy #$2d78
$0a:dadf  17 c8		 ora [$c8],y
$0a:dae1  c4 11		 cpy $11
$0a:dae3  bc 1b 01	  ldy $011b,x
$0a:dae6  c8			iny
$0a:dae7  0f cf c1 e0   ora $e0c1cf
$0a:daeb  be 5f 24	  ldx $245f,y
$0a:daee  90 4f		 bcc $db3f
$0a:daf0  24 73		 bit $73
$0a:daf2  e1 08		 sbc ($08,x)
$0a:daf4  1f ac 04 6e   ora $6e04ac,x
$0a:daf8  94 f1		 sty $f1,x
$0a:dafa  6a			ror a
$0a:dafb  c0 4e c2	  cpy #$c24e
$0a:dafe  49 2a 7b	  eor #$7b2a
$0a:db01  c0 07 e7	  cpy #$e707
$0a:db04  80 ec		 bra $daf2
$0a:db06  74 3f		 stz $3f,x
$0a:db08  13 89		 ora ($89,s),y
$0a:db0a  05 02		 ora $02
$0a:db0c  81 b8		 sta ($b8,x)
$0a:db0e  08			php
$0a:db0f  00 fc		 brk #$fc
$0a:db11  fb			xce
$0a:db12  1d 8f c7	  ora $c78f,x
$0a:db15  e2 11		 sep #$11
$0a:db17  08			php
$0a:db18  d0 46		 bne $db60
$0a:db1a  3f 03 f5 83   and $83f503,x
$0a:db1e  ad 02 11	  lda $1102
$0a:db21  1c 86 46	  trb $4686
$0a:db24  e1 33		 sbc ($33,x)
$0a:db26  58			cli
$0a:db27  70 fe		 bvs $db27
$0a:db29  20 70 08	  jsr $0870
$0a:db2c  30 fd		 bmi $db2b
$0a:db2e  f8			sed
$0a:db2f  0d 40 90	  ora $9040
$0a:db32  5c 2c 1b 09   jml $091b2c
$0a:db36  05 63		 ora $63
$0a:db38  c0 3f		 cpy #$3f
$0a:db3a  8c 03 50	  sty $5003
$0a:db3d  47 e1		 eor [$e1]
$0a:db3f  2b			pld
$0a:db40  96 45		 stx $45,y
$0a:db42  e3 16		 sbc $16,s
$0a:db44  78			sei
$0a:db45  c7 be		 cmp [$be]
$0a:db47  11 ef		 ora ($ef),y
$0a:db49  b8			clv
$0a:db4a  6f ef 17 c1   adc $c117ef
$0a:db4e  b1 c8		 lda ($c8),y
$0a:db50  07 e3		 ora [$e3]
$0a:db52  08			php
$0a:db53  88			dey
$0a:db54  58			cli
$0a:db55  23 17		 and $17,s
$0a:db57  81 f9		 sta ($f9,x)
$0a:db59  fc 24 17	  jsr ($1724,x)
$0a:db5c  8f 02 b4 15   sta $15b402
$0a:db60  a1 f0		 lda ($f0,x)
$0a:db62  75 18		 adc $18,x
$0a:db64  fc 24 1c	  jsr ($1c24,x)
$0a:db67  06 f4		 asl $f4
$0a:db69  8f c6 37 04   sta $0437c6
$0a:db6d  17 84		 ora [$84],y
$0a:db6f  7e 01 1f	  ror $1f01,x
$0a:db72  88			dey
$0a:db73  2e 42 1f	  rol $1f42
$0a:db76  00 1c		 brk #$1c
$0a:db78  82 d4 20	  brl $fc4f
$0a:db7b  11 c8		 ora ($c8),y
$0a:db7d  02 f8		 cop #$f8
$0a:db7f  20 d1 08	  jsr $08d1
$0a:db82  14 32		 trb $32
$0a:db84  27 00		 and [$00]
$0a:db86  81 01		 sta ($01,x)
$0a:db88  02 01		 cop #$01
$0a:db8a  04 d8		 tsb $d8
$0a:db8c  50 3b		 bvc $dbc9
$0a:db8e  16 09		 asl $09,x
$0a:db90  87 43		 sta [$43]
$0a:db92  a1 00		 lda ($00,x)
$0a:db94  47 03		 eor [$03]
$0a:db96  78			sei
$0a:db97  04 20		 tsb $20
$0a:db99  d5 08		 cmp $08,x
$0a:db9b  35 d8		 and $d8,x
$0a:db9d  28			plp
$0a:db9e  11 01		 ora ($01),y
$0a:dba0  08			php
$0a:dba1  05 c0		 ora $c0
$0a:dba3  2e 40 10	  rol $1040
$0a:dba6  a0 4f		 ldy #$4f
$0a:dba8  e2 06		 sep #$06
$0a:dbaa  f1 1a		 sbc ($1a),y
$0a:dbac  01 d0		 ora ($d0,x)
$0a:dbae  47 66		 eor [$66]
$0a:dbb0  fe 08 19	  inc $1908,x
$0a:dbb3  14 09		 trb $09
$0a:dbb5  62 4c 08	  per $e404
$0a:dbb8  63 20		 adc $20,s
$0a:dbba  57 e3		 eor [$e3],y
$0a:dbbc  fc 88 18	  jsr ($1888,x)
$0a:dbbf  80 26		 bra $dbe7
$0a:dbc1  81 74		 sta ($74,x)
$0a:dbc3  88			dey
$0a:dbc4  48			pha
$0a:dbc5  1f e0 fe 3b   ora $3bfee0,x
$0a:dbc9  03 a0		 ora $a0,s
$0a:dbcb  57 e3		 eor [$e3],y
$0a:dbcd  7f 98 1c c8   adc $c81c98,x
$0a:dbd1  f6 42		 inc $42,x
$0a:dbd3  44 9a 22	  mvp $22,$9a
$0a:dbd6  50 48		 bvc $dc20
$0a:dbd8  ff c8 c0 56   sbc $56c0c8,x
$0a:dbdc  04 85		 tsb $85
$0a:dbde  58			cli
$0a:dbdf  54 a0 91	  mvn $91,$a0
$0a:dbe2  e0 f0		 cpx #$f0
$0a:dbe4  81 ca		 sta ($ca,x)
$0a:dbe6  bd fc 48	  lda $48fc,x
$0a:dbe9  9c 09 01	  stz $0109
$0a:dbec  65 02		 adc $02
$0a:dbee  de e4 58	  dec $58e4,x
$0a:dbf1  5c 02 e7 60   jml $60e702
$0a:dbf5  84 ce		 sty $ce
$0a:dbf7  22 11 88 ba   jsl $ba8811
$0a:dbfb  84 5c		 sty $5c
$0a:dbfd  85 0f		 sta $0f
$0a:dbff  b8			clv
$0a:dc00  2b			pld
$0a:dc01  c2 6f		 rep #$6f
$0a:dc03  30 8f		 bmi $db94
$0a:dc05  c6 22		 dec $22
$0a:dc07  03 85		 ora $85,s
$0a:dc09  54 00 4d	  mvn $4d,$00
$0a:dc0c  1a			inc a
$0a:dc0d  ac 97 26	  ldy $2697
$0a:dc10  98			tya
$0a:dc11  04 41		 tsb $41
$0a:dc13  c8			iny
$0a:dc14  d1 b8		 cmp ($b8),y
$0a:dc16  80 c7		 bra $dbdf
$0a:dc18  23 f6		 and $f6,s
$0a:dc1a  02 0f		 cop #$0f
$0a:dc1c  94 bc		 sty $bc,x
$0a:dc1e  22 4e 46 9e   jsl $9e464e
$0a:dc22  c1 a7		 cmp ($a7,x)
$0a:dc24  70 c9		 bvs $dbef
$0a:dc26  fc 3a 6b	  jsr ($6b3a,x)
$0a:dc29  0e 8f bd	  asl $bd8f
$0a:dc2c  1e 11 06	  asl $0611,x
$0a:dc2f  87 40		 sta [$40]
$0a:dc31  18			clc
$0a:dc32  60			rts
$0a:dc33  e4 6b		 cpx $6b
$0a:dc35  c7 03		 cmp [$03]
$0a:dc37  71 60		 adc ($60),y
$0a:dc39  fc 78 2b	  jsr ($2b78,x)
$0a:dc3c  1e 02 f8	  asl $f802,x
$0a:dc3f  05 5a		 ora $5a
$0a:dc41  41 c0		 eor ($c0,x)
$0a:dc43  51 d0		 eor ($d0),y
$0a:dc45  8e 17 21	  stx $2117
$0a:dc48  0d 81 4f	  ora $4f81
$0a:dc4b  60			rts
$0a:dc4c  42 34		 wdm #$34
$0a:dc4e  91 48		 sta ($48),y
$0a:dc50  90 e2		 bcc $dc34
$0a:dc52  b9 06 18	  lda $1806,y
$0a:dc55  49 84 69	  eor #$6984
$0a:dc58  80 2b		 bra $dc85
$0a:dc5a  0a			asl a
$0a:dc5b  44 0b e1	  mvp $e1,$0b
$0a:dc5e  d0 90		 bne $dbf0
$0a:dc60  3b			tsc
$0a:dc61  4a			lsr a
$0a:dc62  09 04 86	  ora #$8604
$0a:dc65  63 22		 adc $22,s
$0a:dc67  15 04		 ora $04,x
$0a:dc69  70 cc		 bvs $dc37
$0a:dc6b  20 77 37	  jsr $3777
$0a:dc6e  6a			ror a
$0a:dc6f  40			rti
$0a:dc70  60			rts
$0a:dc71  10 37		 bpl $dcaa
$0a:dc73  c1 c2		 cmp ($c2,x)
$0a:dc75  60			rts
$0a:dc76  ce d2 a0	  dec $a0d2
$0a:dc79  50 2c		 bvc $dca7
$0a:dc7b  16 18		 asl $18,x
$0a:dc7d  84 48		 sty $48
$0a:dc7f  12 5c		 ora ($5c)
$0a:dc81  0e 7b b6	  asl $b67b
$0a:dc84  03 25		 ora $25,s
$0a:dc86  ec 98 3b	  cpx $3b98
$0a:dc89  52 89		 eor ($89)
$0a:dc8b  44 84 42	  mvp $42,$84
$0a:dc8e  05 25		 ora $25
$0a:dc90  00 be		 brk #$be
$0a:dc92  3b			tsc
$0a:dc93  62 07 30	  per $0c9d
$0a:dc96  be d9 ad	  ldx $add9,y
$0a:dc99  46 e9		 lsr $e9
$0a:dc9b  98			tya
$0a:dc9c  4c 2c d7	  jmp $d72c
$0a:dc9f  eb			xba
$0a:dca0  e5 fc		 sbc $fc
$0a:dca2  1e c1 52	  asl $52c1,x
$0a:dca5  90 50		 bcc $dcf7
$0a:dca7  34 0e		 bit $0e,x
$0a:dca9  d6 0a		 dec $0a,x
$0a:dcab  81 04		 sta ($04,x)
$0a:dcad  5c 81 80 15   jml $158081
$0a:dcb1  03 b3		 ora $b3,s
$0a:dcb3  5d 78 37	  eor $3778,x
$0a:dcb6  07 5e		 ora [$5e]
$0a:dcb8  60			rts
$0a:dcb9  14 c4		 trb $c4
$0a:dcbb  d2 a5		 cmp ($a5)
$0a:dcbd  8a			txa
$0a:dcbe  c0 46		 cpy #$46
$0a:dcc0  a0 34		 ldy #$34
$0a:dcc2  28			plp
$0a:dcc3  14 09		 trb $09
$0a:dcc5  62 e3 50	  per $2dab
$0a:dcc8  7e 90 d4	  ror $d490,x
$0a:dccb  2f d7 e9 e5   and $e5e9d7
$0a:dccf  fb			xce
$0a:dcd0  01 a0		 ora ($a0,x)
$0a:dcd2  a0 5f		 ldy #$5f
$0a:dcd4  b8			clv
$0a:dcd5  01 00		 ora ($00,x)
$0a:dcd7  df 68 34 1e   cmp $1e3468,x
$0a:dcdb  00 a8		 brk #$a8
$0a:dcdd  03 80		 ora $80,s
$0a:dcdf  84 01		 sty $01
$0a:dce1  d0 c0		 bne $dca3
$0a:dce3  2a			rol a
$0a:dce4  80 2c		 bra $dd12
$0a:dce6  0a			asl a
$0a:dce7  d0 4c		 bne $dd35
$0a:dce9  83 c1		 sta $c1,s
$0a:dceb  5f 61 06 82   eor $820661,x
$0a:dcef  41 00		 eor ($00,x)
$0a:dcf1  e1 07		 sbc ($07,x)
$0a:dcf3  82 0c 16	  brl $f302
$0a:dcf6  07 06		 ora [$06]
$0a:dcf8  1c 04 1e	  trb $1e04
$0a:dcfb  02 47		 cop #$47
$0a:dcfd  05 39		 ora $39
$0a:dcff  0a			asl a
$0a:dd00  81 54		 sta ($54,x)
$0a:dd02  09 07 58	  ora #$5807
$0a:dd05  87 00		 sta [$00]
$0a:dd07  c2 28		 rep #$28
$0a:dd09  f6 16		 inc $16,x
$0a:dd0b  a8			tay
$0a:dd0c  14 48		 trb $48
$0a:dd0e  a0 08		 ldy #$08
$0a:dd10  07 c8		 ora [$c8]
$0a:dd12  bb			tyx
$0a:dd13  9c 8a 10	  stz $108a
$0a:dd16  28			plp
$0a:dd17  1c 05 f8	  trb $f805
$0a:dd1a  94 0b		 sty $0b,x
$0a:dd1c  04 83		 tsb $83
$0a:dd1e  81 a0		 sta ($a0,x)
$0a:dd20  2b			pld
$0a:dd21  c5 01		 cmp $01
$0a:dd23  24 16		 bit $16
$0a:dd25  0f 07 81 b4   ora $b48107
$0a:dd29  65 10		 adc $10
$0a:dd2b  01 2a		 ora ($2a,x)
$0a:dd2d  cc 96 c5	  cpy $c596
$0a:dd30  1f 7b 0b 03   ora $030b7b,x
$0a:dd34  94 c0		 sty $c0,x
$0a:dd36  d1 39		 cmp ($39),y
$0a:dd38  02 90		 cop #$90
$0a:dd3a  44 80 54	  mvp $54,$80
$0a:dd3d  56 2b		 lsr $2b,x
$0a:dd3f  1a			inc a
$0a:dd40  c2 2f		 rep #$2f
$0a:dd42  00 8d		 brk #$8d
$0a:dd44  c0 22		 cpy #$22
$0a:dd46  90 08		 bcc $dd50
$0a:dd48  5c 12 0d 05   jml $050d12
$0a:dd4c  85 c3		 sta $c3
$0a:dd4e  61 f0		 adc ($f0,x)
$0a:dd50  f8			sed
$0a:dd51  3c 1e 01	  bit $011e,x
$0a:dd54  0e 84 45	  asl $4584
$0a:dd57  5e 00 47	  lsr $4700,x
$0a:dd5a  08			php
$0a:dd5b  2c 1d f4	  bit $f41d
$0a:dd5e  2f c1 ec 58   and $58ecc1
$0a:dd62  27 1c		 and [$1c]
$0a:dd64  88			dey
$0a:dd65  c4 43		 cpy $43
$0a:dd67  f1 00		 sbc ($00),y
$0a:dd69  f8			sed
$0a:dd6a  48			pha
$0a:dd6b  3c 02 c0	  bit $c002,x
$0a:dd6e  55 03		 eor $03,x
$0a:dd70  14 3d		 trb $3d
$0a:dd72  10 8f		 bpl $dd03
$0a:dd74  04 4b		 tsb $4b
$0a:dd76  d5 00		 cmp $00,x
$0a:dd78  c4 48		 cpy $48
$0a:dd7a  1b			tcs
$0a:dd7b  00 1a		 brk #$1a
$0a:dd7d  00 d8		 brk #$d8
$0a:dd7f  c7 a0		 cmp [$a0]
$0a:dd81  31 f8		 and ($f8),y
$0a:dd83  84 7a		 sty $7a
$0a:dd85  1d 1f 80	  ora $801f,x
$0a:dd88  43 e0		 eor $e0,s
$0a:dd8a  90 38		 bcc $ddc4
$0a:dd8c  32 28		 and ($28)
$0a:dd8e  16 e3		 asl $e3,x
$0a:dd90  17 88		 ora [$88],y
$0a:dd92  40			rti
$0a:dd93  a9 d5 18	  lda #$18d5
$0a:dd96  04 46		 tsb $46
$0a:dd98  08			php
$0a:dd99  f6 01		 inc $01,x
$0a:dd9b  d0 0e		 bne $ddab
$0a:dd9d  c7 11		 cmp [$11]
$0a:dd9f  60			rts
$0a:dda0  ec 40 25	  cpx $2540
$0a:dda3  10 0e		 bpl $ddb3
$0a:dda5  83 60		 sta $60,s
$0a:dda7  34 1d		 bit $1d,x
$0a:dda9  0d 87 c3	  ora $c387
$0a:ddac  e0 a5		 cpx #$a5
$0a:ddae  1f c4 42 d1   ora $d142c4,x
$0a:ddb2  00 07		 brk #$07
$0a:ddb4  81 5c		 sta ($5c,x)
$0a:ddb6  3c 05 a1	  bit $a105,x
$0a:ddb9  2e 0d ea	  rol $ea0d
$0a:ddbc  c9 75 9c	  cmp #$9c75
$0a:ddbf  4f 22 31 d9   eor $d93122
$0a:ddc3  84 7e		 sty $7e
$0a:ddc5  04 77		 tsb $77
$0a:ddc7  08			php
$0a:ddc8  7a			ply
$0a:ddc9  dc 6c 97	  jml [$976c]
$0a:ddcc  db			stp
$0a:ddcd  e5 fa		 sbc $fa
$0a:ddcf  61 3b		 adc ($3b,x)
$0a:ddd1  98			tya
$0a:ddd2  4c e0 50	  jmp $50e0
$0a:ddd5  18			clc
$0a:ddd6  14 42		 trb $42
$0a:ddd8  03 04		 ora $04,s
$0a:ddda  62 85 83	  per $6162
$0a:dddd  00 5e		 brk #$5e
$0a:dddf  12 a0		 ora ($a0)
$0a:dde1  cc 38 05	  cpy $0538
$0a:dde4  e0 56		 cpx #$56
$0a:dde6  9a			txs
$0a:dde7  6c 03 a1	  jmp ($a103)
$0a:ddea  88			dey
$0a:ddeb  0b			phd
$0a:ddec  03 40		 ora $40,s
$0a:ddee  53 67		 eor ($67,s),y
$0a:ddf0  34 86		 bit $86,x
$0a:ddf2  5a			phy
$0a:ddf3  63 17		 adc $17,s
$0a:ddf5  48			pha
$0a:ddf6  7d e2 09	  adc $09e2,x
$0a:ddf9  7c 82 5a	  jmp ($5a82,x)
$0a:ddfc  27 13		 and [$13]
$0a:ddfe  94 18		 sty $18,x
$0a:de00  40			rti
$0a:de01  21 90		 and ($90,x)
$0a:de03  38			sec
$0a:de04  cc 1a 1f	  cpy $1f1a
$0a:de07  00 1c		 brk #$1c
$0a:de09  02 fc		 cop #$fc
$0a:de0b  26 13		 rol $13
$0a:de0d  79 84 d9	  adc $d984,y
$0a:de10  88			dey
$0a:de11  01 d0		 ora ($d0,x)
$0a:de13  4d 81 78	  eor $7881
$0a:de16  24 0c		 bit $0c
$0a:de18  f1 54		 sbc ($54),y
$0a:de1a  2a			rol a
$0a:de1b  84 78		 sty $78
$0a:de1d  14 04		 trb $04
$0a:de1f  d8			cld
$0a:de20  68			pla
$0a:de21  1b			tcs
$0a:de22  86 9c		 stx $9c
$0a:de24  08			php
$0a:de25  18			clc
$0a:de26  d8			cld
$0a:de27  20 11 e8	  jsr $e811
$0a:de2a  04 7e		 tsb $7e
$0a:de2c  06 35		 asl $35
$0a:de2e  08			php
$0a:de2f  73 70		 adc ($70,s),y
$0a:de31  cf 80 ef 07   cmp $07ef80
$0a:de35  78			sei
$0a:de36  01 22		 ora ($22,x)
$0a:de38  80 9a		 bra $ddd4
$0a:de3a  01 68		 ora ($68,x)
$0a:de3c  28			plp
$0a:de3d  45 44		 eor $44
$0a:de3f  0e 84 0b	  asl $0b84
$0a:de42  b0 11		 bcs $de55
$0a:de44  a0 50		 ldy #$50
$0a:de46  08			php
$0a:de47  2a			rol a
$0a:de48  20 1f a2	  jsr $a21f
$0a:de4b  7c 17 d3	  jmp ($d317,x)
$0a:de4e  a1 c5		 lda ($c5,x)
$0a:de50  dc 23 74	  jml [$7423]
$0a:de53  0b			phd
$0a:de54  8c 82 21	  sty $2182
$0a:de57  30 f8		 bmi $de51
$0a:de59  74 2c		 stz $2c,x
$0a:de5b  0d 50 b0	  ora $b050
$0a:de5e  27 12		 and [$12]
$0a:de60  41 e0		 eor ($e0,x)
$0a:de62  2a			rol a
$0a:de63  0c 43 41	  tsb $4143
$0a:de66  20 34 00	  jsr $0034
$0a:de69  af c7 9e 4d   lda $4d9ec7
$0a:de6d  f0 80		 beq $ddef
$0a:de6f  18			clc
$0a:de70  36 fb		 rol $fb,x
$0a:de72  07 fb		 ora [$fb]
$0a:de74  43 7f		 eor $7f,s
$0a:de76  f0 1f		 beq $de97
$0a:de78  b4 3e		 ldy $3e,x
$0a:de7a  ff 0f 7b 82   sbc $827b0f,x
$0a:de7e  6c a0 90	  jmp ($90a0)
$0a:de81  08			php
$0a:de82  62 24 20	  per $fea9
$0a:de85  30 e8		 bmi $de6f
$0a:de87  0b			phd
$0a:de88  c4 01		 cpy $01
$0a:de8a  2b			pld
$0a:de8b  40			rti
$0a:de8c  f0 26		 beq $deb4
$0a:de8e  43 00		 eor $00,s
$0a:de90  d1 0a		 cmp ($0a),y
$0a:de92  00 48		 brk #$48
$0a:de94  43 6a		 eor $6a,s
$0a:de96  15 10		 ora $10,x
$0a:de98  ac 3a 10	  ldy $103a
$0a:de9b  ec 10 b8	  cpx $b810
$0a:de9e  44 1e 01	  mvp $01,$1e
$0a:dea1  07 82		 ora [$82]
$0a:dea3  53 a7		 eor ($a7,s),y
$0a:dea5  4e 84 37	  lsr $3784
$0a:dea8  84 32		 sty $32
$0a:deaa  21 04		 and ($04,x)
$0a:deac  9c 40 af	  stz $af40
$0a:deaf  11 98		 ora ($98),y
$0a:deb1  c3 a1		 cmp $a1,s
$0a:deb3  30 18		 bmi $decd
$0a:deb5  0c 44 23	  tsb $2344
$0a:deb8  21 00		 and ($00,x)
$0a:deba  d0 44		 bne $df00
$0a:debc  36 17		 rol $17,x
$0a:debe  06 51		 asl $51
$0a:dec0  cc 20 17	  cpy $1720
$0a:dec3  8a			txa
$0a:dec4  44 c2 80	  mvp $80,$c2
$0a:dec7  6a			ror a
$0a:dec8  06 78		 asl $78
$0a:deca  3a			dec a
$0a:decb  a9 00 10	  lda #$1000
$0a:dece  28			plp
$0a:decf  32 fc		 and ($fc)
$0a:ded1  1d 91 0e	  ora $0e91,x
$0a:ded4  81 c7		 sta ($c7,x)
$0a:ded6  20 91 97	  jsr $9791
$0a:ded9  45 7e		 eor $7e
$0a:dedb  a1 de		 lda ($de,x)
$0a:dedd  19 0b a2	  ora $a20b,y
$0a:dee0  a2 d0		 ldx #$d0
$0a:dee2  6e 04 78	  ror $7804
$0a:dee5  1e 83 74	  asl $7483,x
$0a:dee8  1c 08 14	  trb $1408
$0a:deeb  0d ea 05	  ora $05ea
$0a:deee  08			php
$0a:deef  1b			tcs
$0a:def0  04 23		 tsb $23
$0a:def2  d0 29		 bne $df1d
$0a:def4  e8			inx
$0a:def5  88			dey
$0a:def6  6e 02 d2	  ror $d202
$0a:def9  f6 4a		 inc $4a,x
$0a:defb  39 55 08	  and $0855,y
$0a:defe  a4 62		 ldy $62
$0a:df00  09 1c 08	  ora #$081c
$0a:df03  85 c1		 sta $c1
$0a:df05  24 17		 bit $17
$0a:df07  88			dey
$0a:df08  05 f2		 ora $f2
$0a:df0a  91 10		 sta ($10),y
$0a:df0c  cb			wai
$0a:df0d  48			pha
$0a:df0e  22 de 08 87   jsl $8708de
$0a:df12  80 de		 bra $def2
$0a:df14  d0 78		 bne $df8e
$0a:df16  34 1a		 bit $1a,x
$0a:df18  07 25		 ora [$25]
$0a:df1a  91 52		 sta ($52),y
$0a:df1c  6e 86 f6	  ror $f686
$0a:df1f  82 ce 20	  brl $fff0
$0a:df22  97 89		 sta [$89],y
$0a:df24  24 62		 bit $62
$0a:df26  0c 6f 68	  tsb $686f
$0a:df29  07 82		 ora [$82]
$0a:df2b  41 60		 eor ($60,x)
$0a:df2d  e8			inx
$0a:df2e  78			sei
$0a:df2f  20 1c 06	  jsr $061c
$0a:df32  73 b7		 adc ($b7,s),y
$0a:df34  40			rti
$0a:df35  48			pha
$0a:df36  12 08		 ora ($08)
$0a:df38  c5 02		 cmp $02
$0a:df3a  78			sei
$0a:df3b  ce 77 bf	  dec $bf77
$0a:df3e  82 3c 33	  brl $127d
$0a:df41  e2 af		 sep #$af
$0a:df43  1d f9 33	  ora $33f9,x
$0a:df46  cb			wai
$0a:df47  be b3 28	  ldx $28b3,y
$0a:df4a  24 11		 bit $11
$0a:df4c  66 30		 ror $30
$0a:df4e  38			sec
$0a:df4f  24 32		 bit $32
$0a:df51  0f 0f 87 47   ora $47870f
$0a:df55  96 65		 stx $65,y
$0a:df57  03 83		 ora $83,s
$0a:df59  9c c1 08	  stz $08c1
$0a:df5c  10 b3		 bpl $df11
$0a:df5e  d8			cld
$0a:df5f  40			rti
$0a:df60  23 d0		 and $d0,s
$0a:df62  15 99		 ora $99,x
$0a:df64  50 28		 bvc $df8e
$0a:df66  0b			phd
$0a:df67  31 c0		 and ($c0),y
$0a:df69  50 2c		 bvc $df97
$0a:df6b  1c 0f 05	  trb $050f
$0a:df6e  82 e0 b3	  brl $9351
$0a:df71  2c 07 01	  bit $0107
$0a:df74  26 0a		 rol $0a
$0a:df76  40			rti
$0a:df77  d0 26		 bne $df9f
$0a:df79  c2 01		 rep #$01
$0a:df7b  70 c0		 bvs $df3d
$0a:df7d  18			clc
$0a:df7e  92 1f		 sta ($1f)
$0a:df80  10 8b		 bpl $df0d
$0a:df82  ce 26 f2	  dec $f226
$0a:df85  88			dey
$0a:df86  3c 82 03	  bit $0382,x
$0a:df89  02 31		 cop #$31
$0a:df8b  34 c1		 bit $c1,x
$0a:df8d  8e 33 49	  stx $4933
$0a:df90  a4 46		 ldy $46
$0a:df92  22 6f 08 c4   jsl $c4086f
$0a:df96  62 f1 78	  per $588a
$0a:df99  f8			sed
$0a:df9a  44 15 61	  mvp $61,$15
$0a:df9d  c6 93		 dec $93
$0a:df9f  74 23		 stz $23,x
$0a:dfa1  1a			inc a
$0a:dfa2  0b			phd
$0a:dfa3  81 c4		 sta ($c4,x)
$0a:dfa5  63 90		 adc $90,s
$0a:dfa7  0b			phd
$0a:dfa8  c4 02		 cpy $02
$0a:dfaa  21 0f		 and ($0f,x)
$0a:dfac  87 c6		 sta [$c6]
$0a:dfae  23 d6		 and $d6,s
$0a:dfb0  0b			phd
$0a:dfb1  c7 83		 cmp [$83]
$0a:dfb3  e1 7b		 sbc ($7b,x)
$0a:dfb5  af 45 61 51   lda $516145
$0a:dfb9  d9 34 2c	  cmp $2c34,y
$0a:dfbc  e8			inx
$0a:dfbd  46 23		 lsr $23
$0a:dfbf  9f 46 2f f1   sta $f12f46,x
$0a:dfc3  e3 e0		 sbc $e0,s
$0a:dfc5  41 a0		 eor ($a0,x)
$0a:dfc7  c6 26		 dec $26
$0a:dfc9  b0 4c		 bcs $e017
$0a:dfcb  38			sec
$0a:dfcc  16 0f		 asl $0f,x
$0a:dfce  06 01		 asl $01
$0a:dfd0  5c a6 f1 e0   jml $e0f1a6
$0a:dfd4  25 c0		 and $c0
$0a:dfd6  cd 90 28	  cmp $2890
$0a:dfd9  34 0a		 bit $0a,x
$0a:dfdb  03 03		 ora $03,s
$0a:dfdd  19 02 38	  ora $3802,y
$0a:dfe0  cd e3 02	  cmp $02e3
$0a:dfe3  84 8c		 sty $8c
$0a:dfe5  86 00		 stx $00
$0a:dfe7  37 63		 and [$63],y
$0a:dfe9  78			sei
$0a:dfea  c8			iny
$0a:dfeb  22 11 88 54   jsl $548811
$0a:dfef  1f c5 fe fc   ora $fcfec5,x
$0a:dff3  12 5b		 ora ($5b)
$0a:dff5  bf 18 f3 c1   lda $c1f318,x
$0a:dff9  be 05 76	  ldx $7605,y
$0a:dffc  1e 8c 32	  asl $328c,x
$0a:dfff  1b			tcs
$0a:e000  1b			tcs
$0a:e001  89 c6		 bit #$c6
$0a:e003  04 53		 tsb $53
$0a:e005  31 21		 and ($21),y
$0a:e007  80 8a		 bra $df93
$0a:e009  aa			tax
$0a:e00a  16 0b		 asl $0b,x
$0a:e00c  00 52		 brk #$52
$0a:e00e  41 a2		 eor ($a2,x)
$0a:e010  92 b1		 sta ($b1)
$0a:e012  58			cli
$0a:e013  57 62		 eor [$62],y
$0a:e015  d1 99		 cmp ($99),y
$0a:e017  ec de 35	  cpx $35de
$0a:e01a  17 86		 ora [$86],y
$0a:e01c  42 a1		 wdm #$a1
$0a:e01e  e1 64		 sbc ($64,x)
$0a:e020  b2 40		 lda ($40)
$0a:e022  2f b3 a9 cc   and $cca9b3
$0a:e026  e2 3f		 sep #$3f
$0a:e028  1c 86 43	  trb $4386
$0a:e02b  01 2b		 ora ($2b,x)
$0a:e02d  e0 ac		 cpx #$ac
$0a:e02f  78			sei
$0a:e030  26 12		 rol $12
$0a:e032  0d 07 01	  ora $0107
$0a:e035  26 de		 rol $de
$0a:e037  08			php
$0a:e038  e0 74		 cpx #$74
$0a:e03a  9c 9e f5	  stz $f59e
$0a:e03d  f0 37		 beq $e076
$0a:e03f  85 fc		 sta $fc
$0a:e041  51 e3		 eor ($e3),y
$0a:e043  9f 25 79 6f   sta $6f7925,x
$0a:e047  d7 41		 cmp [$41],y
$0a:e049  0c 8e 42	  tsb $428e
$0a:e04c  a3 d0		 lda $d0,s
$0a:e04e  08			php
$0a:e04f  fc 1c e8	  jsr ($e81c,x)
$0a:e052  10 d8		 bpl $e02c
$0a:e054  34 16		 bit $16,x
$0a:e056  07 07		 ora [$07]
$0a:e058  80 40		 bra $e09a
$0a:e05a  e3 90		 sbc $90,s
$0a:e05c  38			sec
$0a:e05d  f4 06 3f	  pea $3f06
$0a:e060  04 8f		 tsb $8f
$0a:e062  c5 e1		 cmp $e1
$0a:e064  b0 f8		 bcs $e05e
$0a:e066  2c 1d 14	  bit $141d
$0a:e069  10 38		 bpl $e0a3
$0a:e06b  1c 81 a6	  trb $a681
$0a:e06e  17 08		 ora [$08],y
$0a:e070  07 c3		 ora [$c3]
$0a:e072  80 94		 bra $e008
$0a:e074  06 78		 asl $78
$0a:e076  50 30		 bvc $e0a8
$0a:e078  1c 08 06	  trb $0608
$0a:e07b  02 61		 cop #$61
$0a:e07d  c0 b8		 cpy #$b8
$0a:e07f  60			rts
$0a:e080  3e 14 0f	  rol $0f14,x
$0a:e083  87 41		 sta [$41]
$0a:e085  9e 0c f0	  stz $f00c,x
$0a:e088  e0 35		 cpx #$35
$0a:e08a  83 01		 sta $01,s
$0a:e08c  03 80		 ora $80,s
$0a:e08e  e0 e0		 cpx #$e0
$0a:e090  3c 0a 1d	  bit $1d0a,x
$0a:e093  0a			asl a
$0a:e094  47 3d		 eor [$3d]
$0a:e096  9f 47 ce 40   sta $40ce47,x
$0a:e09a  6a			ror a
$0a:e09b  18			clc
$0a:e09c  9c 4f 26	  stz $264f
$0a:e09f  c0 1e		 cpy #$1e
$0a:e0a1  9c 4e 9d	  stz $9d4e
$0a:e0a4  1e 86 c7	  asl $c786,x
$0a:e0a7  22 71 06 60   jsl $600671
$0a:e0ab  68			pla
$0a:e0ac  3c 0e 24	  bit $240e,x
$0a:e0af  4c 83 48	  jmp $4883
$0a:e0b2  da			phx
$0a:e0b3  c1 e0		 cmp ($e0,x)
$0a:e0b5  c0 60		 cpy #$60
$0a:e0b7  0d 45 20	  ora $2045
$0a:e0ba  68			pla
$0a:e0bb  a3 b7		 lda $b7,s
$0a:e0bd  df de 0f f1   cmp $f10fde,x
$0a:e0c1  07 9a		 ora [$9a]
$0a:e0c3  86 05		 stx $05
$0a:e0c5  02 81		 cop #$81
$0a:e0c7  c0 a0		 cpy #$a0
$0a:e0c9  f0 88		 beq $e053
$0a:e0cb  4c 62 25	  jmp $2562
$0a:e0ce  10 17		 bpl $e0e7
$0a:e0d0  ac 72 09	  ldy $0972
$0a:e0d3  38			sec
$0a:e0d4  86 4c		 stx $4c
$0a:e0d6  23 d2		 and $d2,s
$0a:e0d8  08			php
$0a:e0d9  9c 30 cc	  stz $cc30
$0a:e0dc  ce 20 d8	  dec $d820
$0a:e0df  5c 3a 12 09   jml $09123a
$0a:e0e3  00 f9		 brk #$f9
$0a:e0e5  48			pha
$0a:e0e6  05 30		 ora $30
$0a:e0e8  34 97		 bit $97,x
$0a:e0ea  c0 49		 cpy #$49
$0a:e0ec  e7 ff		 sbc [$ff]
$0a:e0ee  48			pha
$0a:e0ef  7a			ply
$0a:e0f0  87 d6		 sta [$d6]
$0a:e0f2  5e c3 f6	  lsr $f6c3,x
$0a:e0f5  a7 b9		 lda [$b9]
$0a:e0f7  7d ed e0	  adc $e0ed,x
$0a:e0fa  7f 0c 78 a7   adc $a7780c,x
$0a:e0fe  c7 5e		 cmp [$5e]
$0a:e100  4b			phk
$0a:e101  f2 e7		 sbc ($e7)
$0a:e103  9b			txy
$0a:e104  7c fd e8	  jmp ($e8fd,x)
$0a:e107  ff 50 74 06   sbc $067450,x
$0a:e10b  01 03		 ora ($03,x)
$0a:e10d  59 1a c4	  eor $c41a,y
$0a:e110  14 15		 trb $15
$0a:e112  03 81		 ora $81,s
$0a:e114  c0 57		 cpy #$57
$0a:e116  2b			pld
$0a:e117  e0 80		 cpx #$80
$0a:e119  7d 23 9d	  adc $9d23,x
$0a:e11c  a9 b5		 lda #$b5
$0a:e11e  93 35		 sta ($35,s),y
$0a:e120  94 b4		 sty $b4,x
$0a:e122  7c 20 1f	  jmp ($1f20,x)
$0a:e125  85 01		 sta $01
$0a:e127  c5 22		 cmp $22
$0a:e129  93 e9		 sta ($e9,s),y
$0a:e12b  f5 fa		 sbc $fa,x
$0a:e12d  fd 1c 8e	  sbc $8e1c,x
$0a:e130  60			rts
$0a:e131  30 14		 bmi $e147
$0a:e133  0a			asl a
$0a:e134  02 83		 cop #$83
$0a:e136  df fe 10 f0   cmp $f010fe,x
$0a:e13a  f5 c4		 sbc $c4,x
$0a:e13c  60			rts
$0a:e13d  31 88		 and ($88),y
$0a:e13f  4c 36 0b	  jmp $0b36
$0a:e142  07 5c		 ora [$5c]
$0a:e144  bc 06 1d	  ldy $1d06,x
$0a:e147  08			php
$0a:e148  83 41		 sta $41,s
$0a:e14a  60			rts
$0a:e14b  4b			phk
$0a:e14c  98			tya
$0a:e14d  88			dey
$0a:e14e  07 86		 ora [$86]
$0a:e150  81 c0		 sta ($c0,x)
$0a:e152  d0 34		 bne $e188
$0a:e154  40			rti
$0a:e155  90 cd		 bcc $e124
$0a:e157  b0 f8		 bcs $e151
$0a:e159  50 26		 bvc $e181
$0a:e15b  18			clc
$0a:e15c  00 f7		 brk #$f7
$0a:e15e  9d bd 0f	  sta $0fbd,x
$0a:e161  e9 8f		 sbc #$8f
$0a:e163  54 fa eb	  mvn $eb,$fa
$0a:e166  d9 7e dc	  cmp $dc7e,y
$0a:e169  f7 6f		 sbc [$6f],y
$0a:e16b  bf bc 1f e2   lda $e21fbc,x
$0a:e16f  0f 18 f9 0b   ora $0bf918
$0a:e173  ca			dex
$0a:e174  7e 64 f3	  ror $f364,x
$0a:e177  af a1 bd 2f   lda $2fbda1
$0a:e17b  ea			nop
$0a:e17c  06 81		 asl $81
$0a:e17e  ac 06 02	  ldy $0206
$0a:e181  a0 f5		 ldy #$f5
$0a:e183  f3 5f		 sbc ($5f,s),y
$0a:e185  30 1b		 bmi $e1a2
$0a:e187  ca			dex
$0a:e188  05 f3		 ora $f3
$0a:e18a  81 b8		 sta ($b8,x)
$0a:e18c  e0 7c		 cpx #$7c
$0a:e18e  17 cb		 ora [$cb],y
$0a:e190  60			rts
$0a:e191  b0 78		 bcs $e20b
$0a:e193  3c 1c 07	  bit $071c,x
$0a:e196  18			clc
$0a:e197  af 98 00 20   lda $200098
$0a:e19b  80 3b		 bra $e1d8
$0a:e19d  fd fd 93	  sbc $93fd,x
$0a:e1a0  3e 67 77	  rol $7767,x
$0a:e1a3  dd b3 e2	  cmp $e2b3,x
$0a:e1a6  7c 78 dd	  jmp ($dd78,x)
$0a:e1a9  ff 66 ef 99   sbc $99ef66,x
$0a:e1ad  91 f3		 sta ($f3),y
$0a:e1af  7e f9 8f	  ror $8ff9,x
$0a:e1b2  e2 84		 sep #$84
$0a:e1b4  08			php
$0a:e1b5  84 3e		 sty $3e
$0a:e1b7  8f e0 db 73   sta $73dbe0
$0a:e1bb  6f f6 ae d7   adc $d7aef6
$0a:e1bf  af a3 68 b5   lda $b568a3
$0a:e1c3  5e fb de	  lsr $defb,x
$0a:e1c6  bb			tyx
$0a:e1c7  ad a6 b7	  lda $b7a6
$0a:e1ca  6a			ror a
$0a:e1cb  7f 06 12 01   adc $011206,x
$0a:e1cf  04 80		 tsb $80
$0a:e1d1  61 88		 adc ($88,x)
$0a:e1d3  0f 09 ff ce   ora $ceff09
$0a:e1d7  a3 55		 lda $55,s
$0a:e1d9  39 c7 8f	  and $8fc7,y
$0a:e1dc  ff 08 ff e8   sbc $e8ff08,x
$0a:e1e0  f4 32 dc	  pea $dc32
$0a:e1e3  1c db fe	  trb $fedb
$0a:e1e6  fe 0f 2c	  inc $2c0f,x
$0a:e1e9  03 ce		 ora $ce,s
$0a:e1eb  fe 3a f4	  inc $f43a,x
$0a:e1ee  02 fc		 cop #$fc
$0a:e1f0  fe 1f b4	  inc $b41f,x
$0a:e1f3  27 8b		 and [$8b]
$0a:e1f5  df d6 65 23   cmp $2365d6,x
$0a:e1f9  9e 3f bc	  stz $bc3f,x
$0a:e1fc  22 b9 fd e9   jsl $e9fdb9
$0a:e200  54 79 33	  mvn $33,$79
$0a:e203  67 f0		 adc [$f0]
$0a:e205  3b			tsc
$0a:e206  82 c6 fe	  brl $e0cf
$0a:e209  38			sec
$0a:e20a  14 02		 trb $02
$0a:e20c  5c fe 3b ed   jml $ed3bfe
$0a:e210  7a			ply
$0a:e211  a9 0b		 lda #$0b
$0a:e213  80 5f		 bra $e274
$0a:e215  ec 95 ba	  cpx $ba95
$0a:e218  65 fe		 adc $fe
$0a:e21a  80 96		 bra $e1b2
$0a:e21c  18			clc
$0a:e21d  01 78		 ora ($78,x)
$0a:e21f  14 03		 trb $03
$0a:e221  1b			tcs
$0a:e222  52 0a		 eor ($0a)
$0a:e224  8d 60 1f	  sta $1f60
$0a:e227  ef d7 4e 59   sbc $594ed7
$0a:e22b  03 ff		 ora $ff,s
$0a:e22d  64 6d		 stz $6d
$0a:e22f  9d 5f c4	  sta $c45f,x
$0a:e232  07 f9		 ora [$f9]
$0a:e234  92 b7		 sta ($b7)
$0a:e236  a7 d2		 lda [$d2]
$0a:e238  d9 ff b7	  cmp $b7ff,y
$0a:e23b  7f e0 4c 61   adc $614ce0,x
$0a:e23f  62 84 1f	  per $01c6
$0a:e242  7b			tdc
$0a:e243  17 d6		 ora [$d6],y
$0a:e245  d8			cld
$0a:e246  7b			tdc
$0a:e247  b4 7f		 ldy $7f,x
$0a:e249  cf 96 bb e1   cmp $e1bb96
$0a:e24d  a6 f5		 ldx $f5
$0a:e24f  e9 ba		 sbc #$ba
$0a:e251  9b			txy
$0a:e252  29 ac		 and #$ac
$0a:e254  0d 61 3e	  ora $3e61
$0a:e257  71 3c		 adc ($3c),y
$0a:e259  7a			ply
$0a:e25a  01 aa		 ora ($aa,x)
$0a:e25c  b1 54		 lda ($54),y
$0a:e25e  39 f2 4c	  and $4cf2,y
$0a:e261  dd ab 21	  cmp $21ab,x
$0a:e264  04 d9		 tsb $d9
$0a:e266  d0 3a		 bne $e2a2
$0a:e268  f5 0f		 sbc $0f,x
$0a:e26a  3c 8b 2f	  bit $2f8b,x
$0a:e26d  1d 80 4f	  ora $4f80,x
$0a:e270  d2 a0		 cmp ($a0)
$0a:e272  02 30		 cop #$30
$0a:e274  08			php
$0a:e275  00 4a		 brk #$4a
$0a:e277  95 03		 sta $03,x
$0a:e279  83 fe		 sta $fe,s
$0a:e27b  6a			ror a
$0a:e27c  5e ca 94	  lsr $94ca,x
$0a:e27f  33 27		 and ($27,s),y
$0a:e281  fd d9 df	  sbc $dfd9,x
$0a:e284  65 3d		 adc $3d
$0a:e286  78			sei
$0a:e287  17 f3		 ora [$f3],y
$0a:e289  f8			sed
$0a:e28a  b0 04		 bcs $e290
$0a:e28c  f9 88 40	  sbc $4088,y
$0a:e28f  4e 4a 02	  lsr $024a
$0a:e292  c1 df		 cmp ($df,x)
$0a:e294  af fc 0f 0d   lda $0d0ffc
$0a:e298  7f ff 50 bc   adc $bc50ff,x
$0a:e29c  f5 a6		 sbc $a6,x
$0a:e29e  f9 ce 14	  sbc $14ce,y
$0a:e2a1  b5 08		 lda $08,x
$0a:e2a3  63 f5		 adc $f5,s
$0a:e2a5  a0 40		 ldy #$40
$0a:e2a7  22 10 0e d7   jsl $d70e10
$0a:e2ab  ec 06 1a	  cpx $1a06
$0a:e2ae  6f fc 76 bb   adc $bb76fc
$0a:e2b2  27 b4		 and [$b4]
$0a:e2b4  60			rts
$0a:e2b5  69 d1		 adc #$d1
$0a:e2b7  6a			ror a
$0a:e2b8  7e 87 db	  ror $db87,x
$0a:e2bb  04 80		 tsb $80
$0a:e2bd  60			rts
$0a:e2be  10 83		 bpl $e243
$0a:e2c0  a2 80		 ldx #$80
$0a:e2c2  64 20		 stz $20
$0a:e2c4  1b			tcs
$0a:e2c5  03 40		 ora $40,s
$0a:e2c7  c4 93		 cpy $93
$0a:e2c9  e2 b5		 sep #$b5
$0a:e2cb  06 10		 asl $10
$0a:e2cd  62 6f ec	  per $cf3f
$0a:e2d0  20 b6 9c	  jsr $9cb6
$0a:e2d3  87 89		 sta [$89]
$0a:e2d5  3b			tsc
$0a:e2d6  1f d1 14 98   ora $9814d1,x
$0a:e2da  41 d2		 eor ($d2,x)
$0a:e2dc  96 9d		 stx $9d,y
$0a:e2de  d3 5e		 cmp ($5e,s),y
$0a:e2e0  76 1a		 ror $1a,x
$0a:e2e2  0e f8 ff	  asl $fff8
$0a:e2e5  d9 7b ff	  cmp $ff7b,y
$0a:e2e8  e2 0d		 sep #$0d
$0a:e2ea  5b			tcd
$0a:e2eb  fd 75 3a	  sbc $3a75,x
$0a:e2ee  5c f9 95 53   jml $5395f9
$0a:e2f2  b3 b7		 lda ($b7,s),y
$0a:e2f4  c9 5f		 cmp #$5f
$0a:e2f6  66 66		 ror $66
$0a:e2f8  30 80		 bmi $e27a
$0a:e2fa  c0 20		 cpy #$20
$0a:e2fc  b0 01		 bcs $e2ff
$0a:e2fe  f0 43		 beq $e343
$0a:e300  60			rts
$0a:e301  12 f3		 ora ($f3)
$0a:e303  c0 40		 cpy #$40
$0a:e305  39 82 00	  and $0082,y
$0a:e308  80 f4		 bra $e2fe
$0a:e30a  a5 ff		 lda $ff
$0a:e30c  88			dey
$0a:e30d  2d eb ff	  and $ffeb
$0a:e310  e0 8a		 cpx #$8a
$0a:e312  ea			nop
$0a:e313  ae b1 ae	  ldx $aeb1
$0a:e316  be 03 ee	  ldx $ee03,y
$0a:e319  45 28		 eor $28
$0a:e31b  11 14		 ora ($14),y
$0a:e31d  61 4e		 adc ($4e,x)
$0a:e31f  61 94		 adc ($94,x)
$0a:e321  40			rti
$0a:e322  21 06		 and ($06,x)
$0a:e324  e1 9d		 sbc ($9d,x)
$0a:e326  79 6b 7c	  adc $7c6b,y
$0a:e329  71 19		 adc ($19),y
$0a:e32b  68			pla
$0a:e32c  eb			xba
$0a:e32d  da			phx
$0a:e32e  db			stp
$0a:e32f  e1 dc		 sbc ($dc,x)
$0a:e331  08			php
$0a:e332  a5 20		 lda $20
$0a:e334  1f ab 8c b2   ora $b28cab,x
$0a:e338  be 6f af	  ldx $af6f,y
$0a:e33b  0a			asl a
$0a:e33c  f7 cc		 sbc [$cc],y
$0a:e33e  8a			txa
$0a:e33f  fa			plx
$0a:e340  b7 74		 lda [$74],y
$0a:e342  47 a9		 eor [$a9]
$0a:e344  1d c1 da	  ora $dac1,x
$0a:e347  0e d0 1f	  asl $1fd0
$0a:e34a  d6 0b		 dec $0b,x
$0a:e34c  fd 5b cc	  sbc $cc5b,x
$0a:e34f  4b			phk
$0a:e350  30 54		 bmi $e3a6
$0a:e352  de bc ef	  dec $efbc,x
$0a:e355  5b			tcd
$0a:e356  4c ee 55	  jmp $55ee
$0a:e359  3d d3 7c	  and $7cd3,x
$0a:e35c  53 04		 eor ($04,s),y
$0a:e35e  2c f0 0b	  bit $0bf0
$0a:e361  fc 02 7d	  jsr ($7d02,x)
$0a:e364  00 af		 brk #$af
$0a:e366  42 27		 wdm #$27
$0a:e368  f0 02		 beq $e36c
$0a:e36a  48			pha
$0a:e36b  10 c3		 bpl $e330
$0a:e36d  03 54		 ora $54,s
$0a:e36f  bd f4 70	  lda $70f4,x
$0a:e372  9a			txs
$0a:e373  ac ce aa	  ldy $aace
$0a:e376  db			stp
$0a:e377  aa			tax
$0a:e378  99 ea a2	  sta $a2ea,y
$0a:e37b  da			phx
$0a:e37c  aa			tax
$0a:e37d  ee aa 55	  inc $55aa
$0a:e380  00 97		 brk #$97
$0a:e382  13 04		 ora ($04,s),y
$0a:e384  c7 05		 cmp [$05]
$0a:e386  d0 db		 bne $e363
$0a:e388  ea			nop
$0a:e389  bb			tyx
$0a:e38a  da			phx
$0a:e38b  ac 8e b8	  ldy $b88e
$0a:e38e  ae 13 72	  ldx $7213
$0a:e391  d1 98		 cmp ($98),y
$0a:e393  e8			inx
$0a:e394  c6 54		 dec $54
$0a:e396  bb			tyx
$0a:e397  fd 02 ff	  sbc $ff02,x
$0a:e39a  64 ad		 stz $ad
$0a:e39c  d1 af		 cmp ($af),y
$0a:e39e  f6 0a		 inc $0a,x
$0a:e3a0  fc 92 b7	  jsr ($b792,x)
$0a:e3a3  92 99		 sta ($99)
$0a:e3a5  48			pha
$0a:e3a6  ab			plb
$0a:e3a7  e1 a0		 sbc ($a0,x)
$0a:e3a9  8d a8 05	  sta $05a8
$0a:e3ac  3e 94 d5	  rol $d594,x
$0a:e3af  20 d5 7f	  jsr $7fd5
$0a:e3b2  10 1f		 bpl $e3d3
$0a:e3b4  e6 46		 inc $46
$0a:e3b6  d9 65 fc	  cmp $fc65,y
$0a:e3b9  64 ff		 stz $ff
$0a:e3bb  d9 0b 7c	  cmp $7c0b,y
$0a:e3be  1e 0b 65	  asl $650b,x
$0a:e3c1  ef 40 bf f6   sbc $f6bf40
$0a:e3c5  e6 00		 inc $00
$0a:e3c7  af c2 d8 c6   lda $c6d8c2
$0a:e3cb  1f d2 90 7a   ora $7a90d2,x
$0a:e3cf  d7 38		 cmp [$38],y
$0a:e3d1  7e f6 cb	  ror $cbf6,x
$0a:e3d4  dd d5 d1	  cmp $d1d5,x
$0a:e3d7  7a			ply
$0a:e3d8  b4 5e		 ldy $5e,x
$0a:e3da  45 17		 eor $17
$0a:e3dc  6d 73 e6	  adc $e673
$0a:e3df  cf a1 90 0b   cmp $0b90a1
$0a:e3e3  f1 10		 sbc ($10),y
$0a:e3e5  5c 68 df 00   jml $00df68
$0a:e3e9  68			pla
$0a:e3ea  5a			phy
$0a:e3eb  ba			tsx
$0a:e3ec  b4 0f		 ldy $0f,x
$0a:e3ee  bc af 2f	  ldy $2faf,x
$0a:e3f1  42 fe		 wdm #$fe
$0a:e3f3  d9 3b 72	  cmp $723b,y
$0a:e3f6  de 05 0b	  dec $0b05,x
$0a:e3f9  85 56		 sta $56
$0a:e3fb  fa			plx
$0a:e3fc  12 50		 ora ($50)
$0a:e3fe  92 44		 sta ($44)
$0a:e400  b0 9e		 bcs $e3a0
$0a:e402  c0 21		 cpy #$21
$0a:e404  70 0a		 bvs $e410
$0a:e406  97 f2		 sta [$f2],y
$0a:e408  bd b4 f9	  lda $f9b4,x
$0a:e40b  7f 20 df cc   adc $ccdf20,x
$0a:e40f  f7 f2		 sbc [$f2],y
$0a:e411  d1 05		 cmp ($05),y
$0a:e413  ca			dex
$0a:e414  c0 6a		 cpy #$6a
$0a:e416  75 35		 adc $35,x
$0a:e418  20 b3 42	  jsr $42b3
$0a:e41b  40			rti
$0a:e41c  a4 18		 ldy $18
$0a:e41e  27 fa		 and [$fa]
$0a:e420  00 29		 brk #$29
$0a:e422  0d 64 03	  ora $0364
$0a:e425  c9 5f		 cmp #$5f
$0a:e427  f9 56 6a	  sbc $6a56,y
$0a:e42a  7f 9f ad 7f   adc $7fad9f,x
$0a:e42e  c3 4b		 cmp $4b,s
$0a:e430  b8			clv
$0a:e431  76 e6		 ror $e6,x
$0a:e433  f9 de 1c	  sbc $1cde,y
$0a:e436  b5 da		 lda $da,x
$0a:e438  10 42		 bpl $e47c
$0a:e43a  00 bb		 brk #$bb
$0a:e43c  42 28		 wdm #$28
$0a:e43e  40			rti
$0a:e43f  1a			inc a
$0a:e440  04 02		 tsb $02
$0a:e442  21 00		 and ($00,x)
$0a:e444  94 f9		 sty $f9,x
$0a:e446  f0 dc		 beq $e424
$0a:e448  ed a7 b2	  sbc $b2a7
$0a:e44b  1b			tcs
$0a:e44c  4c cb f3	  jmp $f3cb
$0a:e44f  a6 b6		 ldx $b6
$0a:e451  ca			dex
$0a:e452  2c b2 5f	  bit $5fb2
$0a:e455  54 26 84	  mvn $84,$26
$0a:e458  c6 01		 dec $01
$0a:e45a  13 80		 ora ($80,s),y
$0a:e45c  6c cc 03	  jmp ($03cc)
$0a:e45f  93 34		 sta ($34,s),y
$0a:e461  0e 0e 01	  asl $010e
$0a:e464  97 bf		 sta [$bf],y
$0a:e466  a9 02		 lda #$02
$0a:e468  b7 fe		 lda [$fe],y
$0a:e46a  e9 f4		 sbc #$f4
$0a:e46c  bd f1 0e	  lda $0ef1,x
$0a:e46f  04 ff		 tsb $ff
$0a:e471  6f 7f a2 71   adc $71a27f
$0a:e475  08			php
$0a:e476  82 44 19	  brl $fdbd
$0a:e479  61 fd		 adc ($fd,x)
$0a:e47b  20 13 b8	  jsr $b813
$0a:e47e  05 6a		 ora $6a
$0a:e480  f6 a4		 inc $a4,x
$0a:e482  09 37		 ora #$37
$0a:e484  fe bb dd	  inc $ddbb,x
$0a:e487  db			stp
$0a:e488  d2 20		 cmp ($20)
$0a:e48a  3f ef b7 fe   and $feb7ef,x
$0a:e48e  cb			wai
$0a:e48f  65 c2		 adc $c2
$0a:e491  1f ce 44 86   ora $8644ce,x
$0a:e495  5c d4 02 57   jml $5702d4
$0a:e499  33 ef		 and ($ef,s),y
$0a:e49b  44 bb b1	  mvp $b1,$bb
$0a:e49e  0a			asl a
$0a:e49f  1e 6b 3d	  asl $3d6b,x
$0a:e4a2  12 fb		 ora ($fb)
$0a:e4a4  ce bb 31	  dec $31bb
$0a:e4a7  2a			rol a
$0a:e4a8  ce 7b 99	  dec $997b
$0a:e4ab  00 f6		 brk #$f6
$0a:e4ad  c0 3d		 cpy #$3d
$0a:e4af  ec 01 60	  cpx $6001
$0a:e4b2  87 35		 sta [$35]
$0a:e4b4  80 3e		 bra $e4f4
$0a:e4b6  18			clc
$0a:e4b7  06 03		 asl $03
$0a:e4b9  bb			tyx
$0a:e4ba  a8			tay
$0a:e4bb  ee dc 2a	  inc $2adc
$0a:e4be  b7 aa		 lda [$aa],y
$0a:e4c0  bc 02 eb	  ldy $eb02,x
$0a:e4c3  6a			ror a
$0a:e4c4  aa			tax
$0a:e4c5  f6 ba		 inc $ba,x
$0a:e4c7  f4 0b ba	  pea $ba0b
$0a:e4ca  94 14		 sty $14,x
$0a:e4cc  a1 aa		 lda ($aa,x)
$0a:e4ce  80 6a		 bra $e53a
$0a:e4d0  1c 42 e3	  trb $e342
$0a:e4d3  09 44		 ora #$44
$0a:e4d5  03 11		 ora $11,s
$0a:e4d7  00 d7		 brk #$d7
$0a:e4d9  76 6b		 ror $6b,x
$0a:e4db  be 3e 5f	  ldx $5f3e,y
$0a:e4de  5f ab af 97   eor $97afab,x
$0a:e4e2  d7 eb		 cmp [$eb],y
$0a:e4e4  9b			txy
$0a:e4e5  dd 8d de	  cmp $de8d,x
$0a:e4e8  a7 bf		 lda [$bf]
$0a:e4ea  3f 94 80 94   and $948094,x
$0a:e4ee  38			sec
$0a:e4ef  08			php
$0a:e4f0  04 0a		 tsb $0a
$0a:e4f2  01 08		 ora ($08,x)
$0a:e4f4  22 0d 2f 5f   jsl $5f2f0d
$0a:e4f8  a6 eb		 ldx $eb
$0a:e4fa  54 bd 7e	  mvn $7e,$bd
$0a:e4fd  bf af 17 b5   lda $b517af,x
$0a:e501  ca			dex
$0a:e502  fe ef 7f	  inc $7fef,x
$0a:e505  df 2f a9 34   cmp $34a92f,x
$0a:e509  21 24		 and ($24,x)
$0a:e50b  81 04		 sta ($04,x)
$0a:e50d  84 84		 sty $84
$0a:e50f  fe 60 b0	  inc $b060,x
$0a:e512  bb			tyx
$0a:e513  e2 37		 sep #$37
$0a:e515  d4 19		 pei ($19)
$0a:e517  e7 8e		 sbc [$8e]
$0a:e519  75 85		 adc $85,x
$0a:e51b  f8			sed
$0a:e51c  63 fc		 adc $fc,s
$0a:e51e  71 ee		 adc ($ee),y
$0a:e520  74 e7		 stz $e7,x
$0a:e522  d8			cld
$0a:e523  63 03		 adc $03,s
$0a:e525  f9 81 40	  sbc $4081,y
$0a:e528  8c df 48	  sty $48df
$0a:e52b  dd e7 1f	  cmp $1fe7,x
$0a:e52e  bd a3 47	  lda $47a3,x
$0a:e531  3c 33 ef	  bit $ef33,x
$0a:e534  04 df		 tsb $df
$0a:e536  91 43		 sta ($43),y
$0a:e538  de 43 ff	  dec $ff43,x
$0a:e53b  07 f4		 ora [$f4]
$0a:e53d  04 84		 tsb $84
$0a:e53f  05 0c		 ora $0c
$0a:e541  b7 0c		 lda [$0c],y
$0a:e543  7f f3 8f 9e   adc $9e8ff3,x
$0a:e547  f1 f7		 sbc ($f7),y
$0a:e549  fc 32 7a	  jsr ($7a32,x)
$0a:e54c  c5 4f		 cmp $4f
$0a:e54e  79 bd bf	  adc $bfbd,y
$0a:e551  6e af 64	  ror $64af
$0a:e554  66 03		 ror $03
$0a:e556  81 7c		 sta ($7c,x)
$0a:e558  84 61		 sty $61
$0a:e55a  2f ef d4 fd   and $fdd4ef
$0a:e55e  74 8d		 stz $8d,x
$0a:e560  a4 d7		 ldy $d7
$0a:e562  95 f2		 sta $f2,x
$0a:e564  c6 fa		 dec $fa
$0a:e566  62 dc 09	  per $ef45
$0a:e569  ff 12 7e 8b   sbc $8b7e12,x
$0a:e56d  28			plp
$0a:e56e  19 99 c0	  ora $c099,y
$0a:e571  21 64		 and ($64,x)
$0a:e573  f2 70		 sbc ($70)
$0a:e575  77 d9		 adc [$d9],y
$0a:e577  7e 56 a3	  ror $a356,x
$0a:e57a  bf 9b ff 68   lda $68ff9b,x
$0a:e57e  fb			xce
$0a:e57f  da			phx
$0a:e580  ef fd 96 35   sbc $3596fd
$0a:e584  1b			tcs
$0a:e585  80 5f		 bra $e5e6
$0a:e587  d8			cld
$0a:e588  09 08		 ora #$08
$0a:e58a  60			rts
$0a:e58b  8c 0b fe	  sty $fe0b
$0a:e58e  4e 0a 6f	  lsr $6f0a
$0a:e591  62 8b 97	  per $7d1f
$0a:e594  a9 6a		 lda #$6a
$0a:e596  ac 7d 59	  ldy $597d
$0a:e599  97 8e		 sta [$8e],y
$0a:e59b  39 d0 a6	  and $a6d0,y
$0a:e59e  ea			nop
$0a:e59f  ac f3 e8	  ldy $e8f3
$0a:e5a2  03 7c		 ora $7c,s
$0a:e5a4  25 90		 and $90
$0a:e5a6  08			php
$0a:e5a7  e4 02		 cpx $02
$0a:e5a9  18			clc
$0a:e5aa  0c 16 f8	  tsb $f816
$0a:e5ad  39 43 a7	  and $a743,y
$0a:e5b0  3c d5 59	  bit $59d5,x
$0a:e5b3  36 35		 rol $35,x
$0a:e5b5  4f 04 d3 d3   eor $d3d304
$0a:e5b9  1c f5 55	  trb $55f5
$0a:e5bc  be 95 7d	  ldx $7d95,y
$0a:e5bf  d5 64		 cmp $64,x
$0a:e5c1  56 0b		 lsr $0b,x
$0a:e5c3  f0 85		 beq $e54a
$0a:e5c5  80 85		 bra $e54c
$0a:e5c7  46 42		 lsr $42
$0a:e5c9  d0 83		 bne $e54e
$0a:e5cb  c0 20		 cpy #$20
$0a:e5cd  bf 6d 6e 5a   lda $5a6e6d,x
$0a:e5d1  8b			phb
$0a:e5d2  d6 c3		 dec $c3,x
$0a:e5d4  d5 39		 cmp $39,x
$0a:e5d6  31 ed		 and ($ed),y
$0a:e5d8  5c ea 53 e2   jml $e253ea
$0a:e5dc  ca			dex
$0a:e5dd  f9 81 61	  sbc $6181,y
$0a:e5e0  68			pla
$0a:e5e1  80 7a		 bra $e65d
$0a:e5e3  04 43		 tsb $43
$0a:e5e5  e0 80		 cpx #$80
$0a:e5e7  71 1c		 adc ($1c),y
$0a:e5e9  83 78		 sta $78,s
$0a:e5eb  80 6e		 bra $e65b
$0a:e5ed  2a			rol a
$0a:e5ee  f2 6e		 sbc ($6e)
$0a:e5f0  6f 8e 93 97   adc $97938e
$0a:e5f4  be d8 79	  ldx $79d8,y
$0a:e5f7  7e 1a 5c	  ror $5c1a,x
$0a:e5fa  cf b3 f0 a5   cmp $a5f0b3
$0a:e5fe  a2 c2		 ldx #$c2
$0a:e600  21 00		 and ($00,x)
$0a:e602  8a			txa
$0a:e603  3a			dec a
$0a:e604  04 86		 tsb $86
$0a:e606  04 30		 tsb $30
$0a:e608  46 82		 lsr $82
$0a:e60a  34 3a		 bit $3a,x
$0a:e60c  b3 c9		 lda ($c9,s),y
$0a:e60e  6d b3 2b	  adc $2bb3
$0a:e611  cc 92 db	  cpy $db92
$0a:e614  25 f6		 and $f6
$0a:e616  ec 2d 32	  cpx $322d
$0a:e619  3b			tsc
$0a:e61a  44 d1 7b	  mvp $7b,$d1
$0a:e61d  b0 70		 bcs $e68f
$0a:e61f  0c 9c 02	  tsb $029c
$0a:e622  66 60		 ror $60
$0a:e624  1c 8c 03	  trb $038c
$0a:e627  66 68		 ror $68
$0a:e629  18			clc
$0a:e62a  8c 02 a9	  sty $a902
$0a:e62d  3b			tsc
$0a:e62e  92 57		 sta ($57)
$0a:e630  f1 3f		 sbc ($3f),y
$0a:e632  69 4c		 adc #$4c
$0a:e634  7f c9 9b de   adc $de9bc9,x
$0a:e638  e0 2d		 cpx #$2d
$0a:e63a  5e be df	  lsr $dfbe,x
$0a:e63d  f5 9a		 sbc $9a,x
$0a:e63f  0c d0 60	  tsb $60d0
$0a:e642  82 04 98	  brl $7e49
$0a:e645  20 47 0f	  jsr $0f47
$0a:e648  f4 03 af	  pea $af03
$0a:e64b  3a			dec a
$0a:e64c  93 77		 sta ($77,s),y
$0a:e64e  e1 3f		 sbc ($3f,x)
$0a:e650  7a			ply
$0a:e651  46 fe		 lsr $fe
$0a:e653  83 fe		 sta $fe,s
$0a:e655  db			stp
$0a:e656  19 83 23	  ora $2383,y
$0a:e659  4d 9f 9f	  eor $9f9f
$0a:e65c  c9 3e		 cmp #$3e
$0a:e65e  d6 e4		 dec $e4,x
$0a:e660  20 de f6	  jsr $f6de
$0a:e663  5f f9 97 4e   eor $4e97f9,x
$0a:e667  35 4c		 and $4c,x
$0a:e669  c1 67		 cmp ($67,x)
$0a:e66b  e2 55		 sep #$55
$0a:e66d  4c cd df	  jmp $dfcd
$0a:e670  65 6d		 adc $6d
$0a:e672  b9 f3 60	  lda $60f3,y
$0a:e675  0b			phd
$0a:e676  f0 f6		 beq $e66e
$0a:e678  c0 3f		 cpy #$3f
$0a:e67a  ac 21 f7	  ldy $f721
$0a:e67d  b0 07		 bcs $e686
$0a:e67f  19 00 95	  ora $9500,y
$0a:e682  5d ea 15	  eor $15ea,x
$0a:e685  5f d7 5e 59   eor $595ed7,x
$0a:e689  55 84		 eor $84,x
$0a:e68b  55 6d		 eor $6d,x
$0a:e68d  55 7f		 eor $7f,x
$0a:e68f  a7 56		 lda [$56]
$0a:e691  11 dd		 ora ($dd),y
$0a:e693  c4 40		 cpy $40
$0a:e695  35 50		 and $50,x
$0a:e697  09 43		 ora #$43
$0a:e699  80 5c		 bra $e6f7
$0a:e69b  21 a8		 and ($a8,x)
$0a:e69d  67 04		 adc [$04]
$0a:e69f  02 45		 cop #$45
$0a:e6a1  00 d7		 brk #$d7
$0a:e6a3  f7 f2		 sbc [$f2],y
$0a:e6a5  7a			ply
$0a:e6a6  bd 43 6c	  lda $6c43,x
$0a:e6a9  3d 52 aa	  and $aa52,x
$0a:e6ac  ed 57 7d	  sbc $7d57
$0a:e6af  be bf ee	  ldx $eebf,y
$0a:e6b2  ef 64 40 a2   sbc $a24064
$0a:e6b6  40			rti
$0a:e6b7  20 70 08	  jsr $0870
$0a:e6ba  0c 03 00	  tsb $0003
$0a:e6bd  44 12 20	  mvp $20,$12
$0a:e6c0  12 c2		 ora ($c2)
$0a:e6c2  cb			wai
$0a:e6c3  6b			rtl
$0a:e6c4  b5 f5		 lda $f5,x
$0a:e6c6  ea			nop
$0a:e6c7  b2 fd		 lda ($fd)
$0a:e6c9  7d 7e af	  adc $af7e,x
$0a:e6cc  b7 db		 lda [$db],y
$0a:e6ce  5f b5 56 9a   eor $9a56b5,x
$0a:e6d2  ae cb 21	  ldx $21cb
$0a:e6d5  00 90		 brk #$90
$0a:e6d7  40			rti
$0a:e6d8  38			sec
$0a:e6d9  00 61		 brk #$61
$0a:e6db  84 01		 sty $01
$0a:e6dd  06 2d		 asl $2d
$0a:e6df  00 86		 brk #$86
$0a:e6e1  40			rti
$0a:e6e2  2e 18 fb	  rol $fb18
$0a:e6e5  e7 1e		 sbc [$1e]
$0a:e6e7  bd a3 9f	  lda $9fa3,x
$0a:e6ea  f0 7e		 beq $e76a
$0a:e6ec  f8			sed
$0a:e6ed  8f 5c 53 83   sta $83535c
$0a:e6f1  3e e2 4f	  rol $4fe2,x
$0a:e6f4  c1 06		 cmp ($06,x)
$0a:e6f6  3f 9c f7 c7   and $c7f79c,x
$0a:e6fa  39 43 dd	  and $dd43,y
$0a:e6fd  61 6e		 adc ($6e,x)
$0a:e6ff  10 ff		 bpl $e700
$0a:e701  44 7f 93	  mvp $93,$7f
$0a:e704  37 ea		 and [$ea],y
$0a:e706  cf 3d 71 80   cmp $80713d
$0a:e70a  50 08		 bvc $e714
$0a:e70c  42 80		 wdm #$80
$0a:e70e  06 58		 asl $58
$0a:e710  10 30		 bpl $e742
$0a:e712  49 e1		 eor #$e1
$0a:e714  1c e1 fe	  trb $fee1
$0a:e717  b0 b3		 bcs $e6cc
$0a:e719  0a			asl a
$0a:e71a  7d 63 7f	  adc $7f63,x
$0a:e71d  b1 bf		 lda ($bf),y
$0a:e71f  ea			nop
$0a:e720  6d 01 d0	  adc $d001
$0a:e723  2f d0 ac bc   and $bcacd0
$0a:e727  be bd 5d	  ldx $5dbd,y
$0a:e72a  5f 6b 8f bf   eor $bf8f6b,x
$0a:e72e  c3 fc		 cmp $fc,s
$0a:e730  f1 fe		 sbc ($fe),y
$0a:e732  54 db a9	  mvn $a9,$db
$0a:e735  3d 2e 84	  and $842e,x
$0a:e738  40			rti
$0a:e739  c0 e0		 cpy #$e0
$0a:e73b  50 35		 bvc $e772
$0a:e73d  96 ee		 stx $ee,y
$0a:e73f  89 a9		 bit #$a9
$0a:e741  ef 51 ff 18   sbc $18ff51
$0a:e745  d8			cld
$0a:e746  87 ab		 sta [$ab]
$0a:e748  61 ca		 adc ($ca,x)
$0a:e74a  b0 f4		 bcs $e740
$0a:e74c  b1 90		 lda ($90),y
$0a:e74e  9d 71 a4	  sta $a471,x
$0a:e751  4d 61 00	  eor $0061
$0a:e754  f0 40		 beq $e796
$0a:e756  e8			inx
$0a:e757  10 78		 bpl $e7d1
$0a:e759  04 7e		 tsb $7e
$0a:e75b  00 3e		 brk #$3e
$0a:e75d  0b			phd
$0a:e75e  ff de c5 a9   sbc $a9c5de,x
$0a:e762  b1 71		 lda ($71),y
$0a:e764  e7 99		 sbc [$99]
$0a:e766  6a			ror a
$0a:e767  5e a2 c7	  lsr $c7a2,x
$0a:e76a  f4 99 e5	  pea $e599
$0a:e76d  ee 9f 38	  inc $389f
$0a:e770  64 72		 stz $72
$0a:e772  00 df		 brk #$df
$0a:e774  00 50		 brk #$50
$0a:e776  4f 1c 02 2d   eor $2d021c
$0a:e77a  01 38		 ora ($38,x)
$0a:e77c  02 83		 cop #$83
$0a:e77e  d3 18		 cmp ($18,s),y
$0a:e780  d1 56		 cmp ($56),y
$0a:e782  3e 92 cc	  rol $cc92,x
$0a:e785  8d df 33	  sta $33df
$0a:e788  7c e4 4f	  jmp ($4fe4,x)
$0a:e78b  3d f1 af	  and $aff1,x
$0a:e78e  6d 4d 90	  adc $904d
$0a:e791  0c 80 81	  tsb $8180
$0a:e794  89 84		 bit #$84
$0a:e796  06 00		 asl $00
$0a:e798  30 14		 bmi $e7ae
$0a:e79a  81 a0		 sta ($a0,x)
$0a:e79c  35 bc		 and $bc,x
$0a:e79e  6f 1e 1a a7   adc $a71a1e
$0a:e7a2  9a			txs
$0a:e7a3  b7 fd		 lda [$fd],y
$0a:e7a5  aa			tax
$0a:e7a6  33 2d		 and ($2d,s),y
$0a:e7a8  bd 52 93	  lda $9352,x
$0a:e7ab  1e d5 ee	  asl $eed5,x
$0a:e7ae  af 10 00 f8   lda $f80010
$0a:e7b2  59 1d 43	  eor $431d,y
$0a:e7b5  ec 80 7a	  cpx $7a80
$0a:e7b8  18			clc
$0a:e7b9  81 00		 sta ($00,x)
$0a:e7bb  a2 40		 ldx #$40
$0a:e7bd  33 77		 and ($77,s),y
$0a:e7bf  fd 66 03	  sbc $0366,x
$0a:e7c2  5f d0 e5 cb   eor $cbe5d0,x
$0a:e7c6  30 9e		 bmi $e766
$0a:e7c8  ad af eb	  lda $ebaf
$0a:e7cb  35 fd		 and $fd,x
$0a:e7cd  f2 ef		 sbc ($ef)
$0a:e7cf  8d 01 7f	  sta $7f01
$0a:e7d2  20 0f ce	  jsr $ce0f
$0a:e7d5  01 73		 ora ($73,x)
$0a:e7d7  80 58		 bra $e831
$0a:e7d9  c8			iny
$0a:e7da  07 29		 ora [$29]
$0a:e7dc  f3 e1		 sbc ($e1,s),y
$0a:e7de  f9 db 4f	  sbc $4fdb,y
$0a:e7e1  6c 3e 99	  jmp ($993e)
$0a:e7e4  90 e5		 bcc $e7cb
$0a:e7e6  cd 6d 52	  cmp $526d
$0a:e7e9  cb			wai
$0a:e7ea  65 66		 adc $66
$0a:e7ec  6e 9f 09	  ror $099f
$0a:e7ef  8c 02 27	  sty $2702
$0a:e7f2  00 d9		 brk #$d9
$0a:e7f4  c0 26		 cpy #$26
$0a:e7f6  f0 0c		 beq $e804
$0a:e7f8  bc 03 27	  ldy $2703,x
$0a:e7fb  00 c7		 brk #$c7
$0a:e7fd  c0 24		 cpy #$24
$0a:e7ff  9f ea 4e df   sta $df4eea,x
$0a:e803  37 6d		 and [$6d],y
$0a:e805  9a			txs
$0a:e806  40			rti
$0a:e807  7e 9f 78	  ror $789f,x
$0a:e80a  de ff d1	  dec $d1ff,x
$0a:e80d  97 d2		 sta [$d2],y
$0a:e80f  e2 3f		 sep #$3f
$0a:e811  f0 0f		 beq $e822
$0a:e813  f2 00		 sbc ($00)
$0a:e815  dd 60 41	  cmp $4160,x
$0a:e818  22 08 69 2b   jsl $2b6908
$0a:e81c  7c 49 fd	  jmp ($fd49,x)
$0a:e81f  ca			dex
$0a:e820  1b			tcs
$0a:e821  9b			txy
$0a:e822  c0 6c		 cpy #$6c
$0a:e824  fe 77 bf	  inc $bf77,x
$0a:e827  ee 53 dd	  inc $dd53
$0a:e82a  50 df		 bvc $e80b
$0a:e82c  1f c1 3e 44   ora $443ec1,x
$0a:e830  10 74		 bpl $e8a6
$0a:e832  82 04 13	  brl $fb39
$0a:e835  e5 ab		 sbc $ab
$0a:e837  99 d7 a2	  sta $a2d7,y
$0a:e83a  55 da		 eor $da,x
$0a:e83c  86 8e		 stx $8e
$0a:e83e  b5 18		 lda $18,x
$0a:e840  b9 7d 72	  lda $727d,y
$0a:e843  dd 9e f7	  cmp $f79e,x
$0a:e846  57 cd		 eor [$cd],y
$0a:e848  cc 80 7b	  cpy $7b80
$0a:e84b  60			rts
$0a:e84c  1e f6 00	  asl $00f6,x
$0a:e84f  b0 42		 bcs $e893
$0a:e851  d3 00		 cmp ($00,s),y
$0a:e853  90 c0		 bcc $e815
$0a:e855  3f 22 e1 97   and $97e122,x
$0a:e859  60			rts
$0a:e85a  2a			rol a
$0a:e85b  7b			tdc
$0a:e85c  c8			iny
$0a:e85d  54 b6 eb	  mvn $eb,$b6
$0a:e860  9b			txy
$0a:e861  a6 6c		 ldx $6c
$0a:e863  ec 79 d8	  cpx $d879
$0a:e866  be fc 7e	  ldx $7efc,y
$0a:e869  c4 90		 cpy $90
$0a:e86b  24 a5		 bit $a5
$0a:e86d  0b			phd
$0a:e86e  79 09 fb	  adc $fb09,y
$0a:e871  69 af		 adc #$af
$0a:e873  72 1e		 adc ($1e)
$0a:e875  fc 2b ff	  jsr ($ff2b,x)
$0a:e878  25 fe		 and $fe
$0a:e87a  e3 bf		 sbc $bf,s
$0a:e87c  7d 4f b2	  adc $b24f,x
$0a:e87f  a8			tay
$0a:e880  d3 e7		 cmp ($e7,s),y
$0a:e882  02 ff		 cop #$ff
$0a:e884  c1 3f		 cmp ($3f,x)
$0a:e886  f0 8f		 beq $e817
$0a:e888  fd 17 8b	  sbc $8b17,x
$0a:e88b  37 b1		 and [$b1],y
$0a:e88d  67 a6		 adc [$a6]
$0a:e88f  94 dc		 sty $dc,x
$0a:e891  c6 4b		 dec $4b
$0a:e893  91 28		 sta ($28),y
$0a:e895  ce d5 27	  dec $27d5
$0a:e898  d9 3b 74	  cmp $743b,y
$0a:e89b  ea			nop
$0a:e89c  01 1c		 ora ($1c,x)
$0a:e89e  c0 42		 cpy #$42
$0a:e8a0  38			sec
$0a:e8a1  30 0f		 bmi $e8b2
$0a:e8a3  1c 03 cf	  trb $cf03
$0a:e8a6  00 e1		 brk #$e1
$0a:e8a8  c0 30		 cpy #$30
$0a:e8aa  23 f0		 and $f0,s
$0a:e8ac  b9 7c f9	  lda $f97c,y
$0a:e8af  94 6b		 sty $6b,x
$0a:e8b1  cc b2 e5	  cpy $e5b2
$0a:e8b4  19 c0 d6	  ora $d6c0,y
$0a:e8b7  3b			tsc
$0a:e8b8  5b			tcd
$0a:e8b9  9d 6d f2	  sta $f26d,x
$0a:e8bc  f5 fa		 sbc $fa,x
$0a:e8be  53 84		 eor ($84,s),y
$0a:e8c0  e2 03		 sep #$03
$0a:e8c2  10 c1		 bpl $e885
$0a:e8c4  c0 38		 cpy #$38
$0a:e8c6  e2 71		 sep #$71
$0a:e8c8  23 06		 and $06,s
$0a:e8ca  0e 09 01	  asl $0109
$0a:e8cd  b4 41		 ldy $41,x
$0a:e8cf  f2 96		 sbc ($96)
$0a:e8d1  3a			dec a
$0a:e8d2  34 ef		 bit $ef,x
$0a:e8d4  49 7b		 eor #$7b
$0a:e8d6  91 77		 sta ($77),y
$0a:e8d8  f1 bf		 sbc ($bf),y
$0a:e8da  ea			nop
$0a:e8db  57 6f		 eor [$6f],y
$0a:e8dd  4f 7b 7f c1   eor $c17f7b
$0a:e8e1  9c 24 89	  stz $8924
$0a:e8e4  f1 e2		 sbc ($e2),y
$0a:e8e6  5f ea db 4c   eor $4cdbea,x
$0a:e8ea  c5 b2		 cmp $b2
$0a:e8ec  c5 79		 cmp $79
$0a:e8ee  8e e8 a6	  stx $a6e8
$0a:e8f1  5c 39 3f 07   jml $073f39
$0a:e8f5  b6 df		 ldx $df,y
$0a:e8f7  08			php
$0a:e8f8  04 20		 tsb $20
$0a:e8fa  84 10		 sty $10
$0a:e8fc  3c 04 1e	  bit $1e04,x
$0a:e8ff  81 07		 sta ($07,x)
$0a:e901  c0 63		 cpy #$63
$0a:e903  e8			inx
$0a:e904  15 f8		 ora $f8,x
$0a:e906  04 bf		 tsb $bf
$0a:e908  65 7f		 adc $7f
$0a:e90a  ee 4f ec	  inc $ec4f
$0a:e90d  31 6d		 and ($6d),y
$0a:e90f  94 33		 sty $33,x
$0a:e911  5b			tcd
$0a:e912  10 ab		 bpl $e8bf
$0a:e914  4a			lsr a
$0a:e915  35 75		 and $75,x
$0a:e917  4b			phk
$0a:e918  66 4d		 ror $4d
$0a:e91a  be 10 18	  ldx $1810,y
$0a:e91d  0c 2b 05	  tsb $052b
$0a:e920  04 e2		 tsb $e2
$0a:e922  c4 3a		 cpy $3a
$0a:e924  52 0d		 eor ($0d)
$0a:e926  0d 02 81	  ora $8102
$0a:e929  91 c8		 sta ($c8),y
$0a:e92b  f6 61		 inc $61,x
$0a:e92d  f6 ec		 inc $ec,x
$0a:e92f  fe 97 9b	  inc $9b97,x
$0a:e932  5a			phy
$0a:e933  d3 4a		 cmp ($4a,s),y
$0a:e935  7a			ply
$0a:e936  72 6f		 adc ($6f)
$0a:e938  ce 4b d9	  dec $d94b
$0a:e93b  55 ff		 eor $ff,x
$0a:e93d  3b			tsc
$0a:e93e  06 7f		 asl $7f
$0a:e940  02 8f		 cop #$8f
$0a:e942  c0 61		 cpy #$61
$0a:e944  f8			sed
$0a:e945  0c 3c 02	  tsb $023c
$0a:e948  06 a0		 asl $a0
$0a:e94a  06 f8		 asl $f8
$0a:e94c  64 e0		 stz $e0
$0a:e94e  92 b8		 sta ($b8)
$0a:e950  06 d6		 asl $d6
$0a:e952  01 0b		 ora ($0b,x)
$0a:e954  80 76		 bra $e9cc
$0a:e956  a0 36		 ldy #$36
$0a:e958  68			pla
$0a:e959  44 6e 48	  mvp $48,$6e
$0a:e95c  7d 1b 7c	  adc $7c1b,x
$0a:e95f  03 ef		 ora $ef,s
$0a:e961  00 60		 brk #$60
$0a:e963  01 b0		 ora ($b0,x)
$0a:e965  37 ef		 and [$ef],y
$0a:e967  f3 bf		 sbc ($bf,s),y
$0a:e969  ed 2a fb	  sbc $fb2a
$0a:e96c  aa			tax
$0a:e96d  cf 86 31 ee   cmp $ee3186
$0a:e971  8e 6d 2d	  stx $2d6d
$0a:e974  93 9e		 sta ($9e,s),y
$0a:e976  fd 33 71	  sbc $7133,x
$0a:e979  2f ed 42 20   and $2042ed
$0a:e97d  10 70		 bpl $e9ef
$0a:e97f  00 b2		 brk #$b2
$0a:e981  81 94		 sta ($94,x)
$0a:e983  02 d0		 cop #$d0
$0a:e985  65 14		 adc $14
$0a:e987  b7 cd		 lda [$cd],y
$0a:e989  97 f2		 sta [$f2],y
$0a:e98b  7c f0 9a	  jmp ($9af0,x)
$0a:e98e  dc 55 67	  jml [$6755]
$0a:e991  25 c4		 and $c4
$0a:e993  bb			tyx
$0a:e994  f1 a2		 sbc ($a2),y
$0a:e996  b5 8a		 lda $8a,x
$0a:e998  7c 62 01	  jmp ($0162,x)
$0a:e99b  78			sei
$0a:e99c  10 0d		 bpl $e9ab
$0a:e99e  c2 01		 rep #$01
$0a:e9a0  64 40		 stz $40
$0a:e9a2  04 03		 tsb $03
$0a:e9a4  d1 00		 cmp ($00),y
$0a:e9a6  d0 40		 bne $e9e8
$0a:e9a8  37 35		 and [$35],y
$0a:e9aa  79 37 37	  adc $3737,y
$0a:e9ad  c7 49		 cmp [$49]
$0a:e9af  cb			wai
$0a:e9b0  df 6c 3c bf   cmp $bf3c6c,x
$0a:e9b4  0d 2e 67	  ora $672e
$0a:e9b7  d9 f8 52	  cmp $52f8,y
$0a:e9ba  e0 10		 cpx #$10
$0a:e9bc  08			php
$0a:e9bd  84 02		 sty $02
$0a:e9bf  28			plp
$0a:e9c0  3f 02 10 90   and $901002,x
$0a:e9c4  c2 08		 rep #$08
$0a:e9c6  4a			lsr a
$0a:e9c7  1d a5 ee	  ora $eea5,x
$0a:e9ca  69 6f		 adc #$6f
$0a:e9cc  d4 7d		 pei ($7d)
$0a:e9ce  e3 74		 sbc $74,s
$0a:e9d0  0a			asl a
$0a:e9d1  dd 6e b9	  cmp $b96e,x
$0a:e9d4  7e e8 6b	  ror $6be8,x
$0a:e9d7  b2 5f		 lda ($5f)
$0a:e9d9  cc 7c 03	  cpy $037c
$0a:e9dc  3f 00 8f b9   and $b98f00,x
$0a:e9e0  c7 48		 cmp [$48]
$0a:e9e2  e7 16		 sbc [$16]
$0a:e9e4  00 30		 brk #$30
$0a:e9e6  02 2b		 cop #$2b
$0a:e9e8  82 ed 5e	  brl $48d8
$0a:e9eb  b9 53 fa	  lda $fa53,y
$0a:e9ee  df f7 17 77   cmp $7717f7,x
$0a:e9f2  fa			plx
$0a:e9f3  c2 e5		 rep #$e5
$0a:e9f5  90 1a		 bcc $ea11
$0a:e9f7  ae f8 d6	  ldx $d6f8
$0a:e9fa  10 52		 bpl $ea4e
$0a:e9fc  20 af 81	  jsr $81af
$0a:e9ff  0a			asl a
$0a:ea00  83 f0		 sta $f0,s
$0a:ea02  db			stp
$0a:ea03  d2 6d		 cmp ($6d)
$0a:ea05  56 be		 lsr $be,x
$0a:ea07  67 fe		 adc [$fe]
$0a:ea09  b7 3f		 lda [$3f],y
$0a:ea0b  f4 c5 ad	  pea $adc5
$0a:ea0e  d4 1d		 pei ($1d)
$0a:ea10  2e 83 6b	  rol $6b83
$0a:ea13  7b			tdc
$0a:ea14  5f 06 50 88   eor $885006,x
$0a:ea18  2e 60 73	  rol $7360
$0a:ea1b  15 7c		 ora $7c,x
$0a:ea1d  88			dey
$0a:ea1e  31 bf		 and ($bf),y
$0a:ea20  95 3f		 sta $3f,x
$0a:ea22  e5 83		 sbc $83
$0a:ea24  bd 6f 20	  lda $206f,x
$0a:ea27  5f 7f b4 6b   eor $6bb47f,x
$0a:ea2b  79 eb cb	  adc $cbeb,y
$0a:ea2e  ec 71 df	  cpx $df71
$0a:ea31  d8			cld
$0a:ea32  02 fd		 cop #$fd
$0a:ea34  21 26		 and ($26,x)
$0a:ea36  a1 bf		 lda ($bf,x)
$0a:ea38  1a			inc a
$0a:ea39  86 d5		 stx $d5
$0a:ea3b  77 a8		 adc [$a8],y
$0a:ea3d  55 7f		 eor $7f,x
$0a:ea3f  5d 79 65	  eor $6579,x
$0a:ea42  56 11		 lsr $11,x
$0a:ea44  55 b5		 eor $b5,x
$0a:ea46  55 fe		 eor $fe,x
$0a:ea48  95 5a		 sta $5a,x
$0a:ea4a  45 77		 eor $77
$0a:ea4c  11 00		 ora ($00),y
$0a:ea4e  d5 40		 cmp $40,x
$0a:ea50  25 0e		 and $0e
$0a:ea52  01 70		 ora ($70,x)
$0a:ea54  86 a1		 stx $a1
$0a:ea56  c0 3a		 cpy #$3a
$0a:ea58  28			plp
$0a:ea59  06 c7		 asl $c7
$0a:ea5b  f9 da e8	  sbc $e8da,y
$0a:ea5e  c9 a6 5c	  cmp #$5ca6
$0a:ea61  bb			tyx
$0a:ea62  2e 57 9d	  rol $9d57
$0a:ea65  22 cf d4 a7   jsl $a7d4cf
$0a:ea69  da			phx
$0a:ea6a  5b			tcd
$0a:ea6b  ec 03 fd	  cpx $fd03
$0a:ea6e  20 fe 70	  jsr $70fe
$0a:ea71  7f 18 0f 84   adc $840f18,x
$0a:ea75  03 c1		 ora $c1,s
$0a:ea77  00 e0		 brk #$e0
$0a:ea79  40			rti
$0a:ea7a  70 10		 bvs $ea8c
$0a:ea7c  28			plp
$0a:ea7d  05 13		 ora $13
$0a:ea7f  ff 96 fa 56   sbc $56fa96,x
$0a:ea83  39 9b 28	  and $289b,y
$0a:ea86  cf 97 65 ca   cmp $ca6597
$0a:ea8a  b3 f4		 lda ($f4,s),y
$0a:ea8c  71 f0		 adc ($f0),y
$0a:ea8e  9d 70 fc	  sta $fc70,x
$0a:ea91  21 10		 and ($10,x)
$0a:ea93  19 84 0f	  ora $0f84,y
$0a:ea96  c1 07		 cmp ($07,x)
$0a:ea98  a0 43		 ldy #$43
$0a:ea9a  cc 43 3f	  cpy $3f43
$0a:ea9d  35 07		 and $07,x
$0a:ea9f  56 bb		 lsr $bb,x
$0a:eaa1  2a			rol a
$0a:eaa2  b5 64		 lda $64,x
$0a:eaa4  26 1c		 rol $1c
$0a:eaa6  d8			cld
$0a:eaa7  c4 9f		 cpy $9f
$0a:eaa9  9b			txy
$0a:eaaa  13 f3		 ora ($f3,s),y
$0a:eaac  5a			phy
$0a:eaad  74 71		 stz $71,x
$0a:eaaf  4e 4c 88	  lsr $884c
$0a:eab2  dc 18 08	  jml [$0818]
$0a:eab5  7f 02 0f e0   adc $e00f02,x
$0a:eab9  81 01		 sta ($01,x)
$0a:eabb  83 f1		 sta $f1,s
$0a:eabd  00 fe		 brk #$fe
$0a:eabf  3f c2 b3 0f   and $0fb3c2,x
$0a:eac3  d7 67		 cmp [$67],y
$0a:eac5  fa			plx
$0a:eac6  b4 dd		 ldy $dd,x
$0a:eac8  57 9b		 eor [$9b],y
$0a:eaca  ab			plb
$0a:eacb  73 ed		 adc ($ed,s),y
$0a:eacd  76 6c		 ror $6c,x
$0a:eacf  b7 4e		 lda [$4e],y
$0a:ead1  56 0a		 lsr $0a,x
$0a:ead3  00 a5		 brk #$a5
$0a:ead5  0b			phd
$0a:ead6  fe 0a 7f	  inc $7f0a,x
$0a:ead9  01 15		 ora ($15,x)
$0a:eadb  04 3e		 tsb $3e
$0a:eadd  41 07		 eor ($07,x)
$0a:eadf  c4 40		 cpy $40
$0a:eae1  ef 90 1a 56   sbc $561a90
$0a:eae5  c7 6b		 cmp [$6b]
$0a:eae7  62 a4 f9	  per $e48e
$0a:eaea  f2 9c		 sbc ($9c)
$0a:eaec  b9 56 56	  lda $5656,y
$0a:eaef  bb			tyx
$0a:eaf0  22 d6 d4 eb   jsl $ebd4d6
$0a:eaf4  5a			phy
$0a:eaf5  78			sei
$0a:eaf6  0f f6 05 fa   ora $fa05f6
$0a:eafa  82 7d 21	  brl $0c7a
$0a:eafd  5e a8 8f	  lsr $8fa8,x
$0a:eb00  46 41		 lsr $41
$0a:eb02  a0 a0		 ldy #$a0
$0a:eb04  50 30		 bvc $eb36
$0a:eb06  18			clc
$0a:eb07  0d dd 12	  ora $12dd
$0a:eb0a  d3 9e		 cmp ($9e,s),y
$0a:eb0c  c3 de		 cmp $de,s
$0a:eb0e  2d b7 08	  and $08b7
$0a:eb11  d6 82		 dec $82,x
$0a:eb13  65 c1		 adc $c1
$0a:eb15  93 70		 sta ($70,s),y
$0a:eb17  3b			tsc
$0a:eb18  61 f0		 adc ($f0,x)
$0a:eb1a  80 40		 bra $eb5c
$0a:eb1c  81 a1		 sta ($a1,x)
$0a:eb1e  00 c0		 brk #$c0
$0a:eb20  40			rti
$0a:eb21  e8			inx
$0a:eb22  10 7c		 bpl $eba0
$0a:eb24  06 3e		 asl $3e
$0a:eb26  81 5f		 sta ($5f,x)
$0a:eb28  80 4b		 bra $eb75
$0a:eb2a  e1 1f		 sbc ($1f,x)
$0a:eb2c  7e ac fe	  ror $feac,x
$0a:eb2f  d7 1f		 cmp [$1f],y
$0a:eb31  99 42 bb	  sta $bb42,y
$0a:eb34  10 5f		 bpl $eb95
$0a:eb36  64 0f		 stz $0f
$0a:eb38  2d 21 f5	  and $f521
$0a:eb3b  a9 03 00	  lda #$0003
$0a:eb3e  9e 1c 04	  stz $041c,x
$0a:eb41  17 81		 ora [$81],y
$0a:eb43  02 f0		 cop #$f0
$0a:eb45  40			rti
$0a:eb46  7e 30 0f	  ror $0f30,x
$0a:eb49  44 03 b9	  mvp $b9,$03
$0a:eb4c  e6 80		 inc $80
$0a:eb4e  db			stp
$0a:eb4f  f0 1b		 beq $eb6c
$0a:eb51  3e 25 63	  rol $6325,x
$0a:eb54  47 2c		 eor [$2c]
$0a:eb56  79 07 e3	  adc $e307,y
$0a:eb59  27 ec		 and [$ec]
$0a:eb5b  aa			tax
$0a:eb5c  ff 85 22 66   sbc $662285,x
$0a:eb60  18			clc
$0a:eb61  02 a0		 cop #$a0
$0a:eb63  30 70		 bmi $ebd5
$0a:eb65  08			php
$0a:eb66  0a			asl a
$0a:eb67  78			sei
$0a:eb68  60			rts
$0a:eb69  1b			tcs
$0a:eb6a  da			phx
$0a:eb6b  1f ee 59 d5   ora $d559ee,x
$0a:eb6f  96 6c		 stx $6c,y
$0a:eb71  a9 dd db	  lda #$dbdd
$0a:eb74  1f 6e f9 c9   ora $c9f96e,x
$0a:eb78  a0 7f		 ldy #$7f
$0a:eb7a  ef ee b2 81   sbc $81b2ee
$0a:eb7e  ba			tsx
$0a:eb7f  52 00		 eor ($00)
$0a:eb81  2c 00 f8	  bit $f800
$0a:eb84  6a			ror a
$0a:eb85  77 57		 adc [$57],y
$0a:eb87  7d 27 2f	  adc $2f27,x
$0a:eb8a  19 bf 99	  ora $99bf,y
$0a:eb8d  55 7d		 eor $7d,x
$0a:eb8f  99 bb ce	  sta $cebb,y
$0a:eb92  5e 93 fd	  lsr $fd93,x
$0a:eb95  fe 51 20	  inc $2051,x
$0a:eb98  11 88		 ora ($88),y
$0a:eb9a  05 c2		 ora $c2
$0a:eb9c  01 40		 ora ($40,x)
$0a:eb9e  50 04		 bvc $eba4
$0a:eba0  02 0c		 cop #$0c
$0a:eba2  4d 01 30	  eor $3001
$0a:eba5  f9 ab bf	  sbc $bfab,y
$0a:eba8  1a			inc a
$0a:eba9  dd 43 f7	  cmp $f743,x
$0a:ebac  f6 af		 inc $af,x
$0a:ebae  79 a9 97	  adc $97a9,y
$0a:ebb1  5e fc cf	  lsr $cffc,x
$0a:ebb4  33 c8		 and ($c8,s),y
$0a:ebb6  97 80		 sta [$80],y
$0a:ebb8  42 08		 wdm #$08
$0a:ebba  40			rti
$0a:ebbb  17 50		 ora [$50],y
$0a:ebbd  44 c4 c3	  mvp $c3,$c4
$0a:ebc0  46 80		 lsr $80
$0a:ebc2  44 20 1b	  mvp $1b,$20
$0a:ebc5  4a			lsr a
$0a:ebc6  9c ab 8b	  stz $8bab
$0a:ebc9  d1 b0		 cmp ($b0),y
$0a:ebcb  60			rts
$0a:ebcc  af f2 9f 3e   lda $3e9ff2
$0a:ebd0  56 87		 lsr $87,x
$0a:ebd2  74 fa		 stz $fa,x
$0a:ebd4  d6 b4		 dec $b4,x
$0a:ebd6  ae 40 70	  ldx $7040
$0a:ebd9  10 04		 bpl $ebdf
$0a:ebdb  23 d0		 and $d0,s
$0a:ebdd  09 f4 02	  ora #$02f4
$0a:ebe0  14 9e		 trb $9e
$0a:ebe2  1f 25 6e 5f   ora $5f6e25,x
$0a:ebe6  80 a9		 bra $eb91
$0a:ebe8  70 35		 bvs $ec1f
$0a:ebea  b7 6c		 lda [$6c],y
$0a:ebec  85 b7		 sta $b7
$0a:ebee  2f 01 d1 68   and $68d101
$0a:ebf2  e9 7b 40	  sbc #$407b
$0a:ebf5  58			cli
$0a:ebf6  3f 80 16 4d   and $4d1680,x
$0a:ebfa  e0 6f		 cpx #$6f
$0a:ebfc  05 71		 ora $71
$0a:ebfe  3c 30 8f	  bit $8f30,x
$0a:ec01  e5 2f		 sbc $2f
$0a:ec03  6b			rtl
$0a:ec04  5d 80 cd	  eor $cd80,x
$0a:ec07  bb			tyx
$0a:ec08  7b			tdc
$0a:ec09  ec 0d 46	  cpx $460d
$0a:ec0c  01 dd		 ora ($dd,x)
$0a:ec0e  ee ea 6a	  inc $6aea
$0a:ec11  ff f4 31 80   sbc $8031f4,x
$0a:ec15  41 fc		 eor ($fc,x)
$0a:ec17  09 f0 91	  ora #$91f0
$0a:ec1a  3f c7 35 77   and $7735c7,x
$0a:ec1e  f8			sed
$0a:ec1f  43 65		 eor $65,s
$0a:ec21  50 79		 bvc $ec9c
$0a:ec23  67 f7		 adc [$f7]
$0a:ec25  49 dd be	  eor #$bedd
$0a:ec28  40			rti
$0a:ec29  f5 5a		 sbc $5a,x
$0a:ec2b  1f 54 57 f1   ora $f15754,x
$0a:ec2f  00 fd		 brk #$fd
$0a:ec31  40			rti
$0a:ec32  17 e0		 ora [$e0],y
$0a:ec34  49 0b f0	  eor #$f00b
$0a:ec37  a8			tay
$0a:ec38  6b			rtl
$0a:ec39  cf f1 c0 77   cmp $77c0f1
$0a:ec3d  65 15		 adc $15
$0a:ec3f  df 87 56 f5   cmp $f55687,x
$0a:ec43  d7 d0		 cmp [$d0],y
$0a:ec45  55 71		 eor $71,x
$0a:ec47  57 5b		 eor [$5b],y
$0a:ec49  d4 5f		 pei ($5f)
$0a:ec4b  c1 e7		 cmp ($e7,x)
$0a:ec4d  55 86		 eor $86,x
$0a:ec4f  8a			txa
$0a:ec50  01 2a		 ora ($2a,x)
$0a:ec52  80 7a		 bra $ecce
$0a:ec54  20 1e a7	  jsr $a71e
$0a:ec57  30 b9		 bmi $ec12
$0a:ec59  40			rti
$0a:ec5a  42 12		 wdm #$12
$0a:ec5c  4f f5 27 6f   eor $6f27f5
$0a:ec60  9b			txy
$0a:ec61  b6 cd		 ldx $cd,y
$0a:ec63  20 3c cf	  jsr $cf3c
$0a:ec66  fd 2f 7f	  sbc $7f2f,x
$0a:ec69  bb			tyx
$0a:ec6a  c2 65		 rep #$65
$0a:ec6c  b1 29		 lda ($29),y
$0a:ec6e  f4 51 92	  pea $9251
$0a:ec71  00 6f		 brk #$6f
$0a:ec73  f2 0b		 sbc ($0b)
$0a:ec75  fe 92 b7	  inc $b792,x
$0a:ec78  c4 9f		 cpy $9f
$0a:ec7a  dc a1 b9	  jml [$b9a1]
$0a:ec7d  b3 90		 lda ($90,s),y
$0a:ec7f  7f e9 3c 99   adc $993ce9,x
$0a:ec83  57 5b		 eor [$5b],y
$0a:ec85  b7 23		 lda [$23],y
$0a:ec87  54 80 7c	  mvn $7c,$80
$0a:ec8a  94 e0		 sty $e0,x
$0a:ec8c  cc 09 b7	  cpy $b709
$0a:ec8f  fa			plx
$0a:ec90  03 fe		 ora $fe,s
$0a:ec92  82 7f a2	  brl $8f14
$0a:ec95  b8			clv
$0a:ec96  2e d5 eb	  rol $ebd5
$0a:ec99  95 3f		 sta $3f,x
$0a:ec9b  ad ff 71	  lda $71ff
$0a:ec9e  77 7f		 adc [$7f],y
$0a:eca0  ac 2e 55	  ldy $552e
$0a:eca3  05 ae		 ora $ae
$0a:eca5  6c 94 e1	  jmp ($e194)
$0a:eca8  05 66		 ora $66
$0a:ecaa  08			php
$0a:ecab  05 3f		 ora $3f
$0a:ecad  10 18		 bpl $ecc7
$0a:ecaf  0c 0f 6f	  tsb $6f0f
$0a:ecb2  49 b5 5a	  eor #$5ab5
$0a:ecb5  de e1 5b	  dec $5be1,x
$0a:ecb8  9f fa 62 d6   sta $d662fa,x
$0a:ecbc  ea			nop
$0a:ecbd  09 04 3c	  ora #$3c04
$0a:ecc0  b0 b5		 bcs $ec77
$0a:ecc2  18			clc
$0a:ecc3  65 19		 adc $19
$0a:ecc5  82 1f 2d	  brl $19e7
$0a:ecc8  fa			plx
$0a:ecc9  a0 3c		 ldy #$3c
$0a:eccb  1f 0f 85 97   ora $97850f,x
$0a:eccf  3d 35 84	  and $8435,x
$0a:ecd2  53 61		 eor ($61,s),y
$0a:ecd4  96 d9		 stx $d9,y
$0a:ecd6  8e 2b 47	  stx $472b
$0a:ecd9  7d 93 64	  adc $6493,x
$0a:ecdc  ef 9b 75 f8   sbc $f8759b
$0a:ece0  2a			rol a
$0a:ece1  07 e7		 ora [$e7]
$0a:ece3  00 e3		 brk #$e3
$0a:ece5  41 2b		 eor ($2b,x)
$0a:ece7  91 8e		 sta ($8e),y
$0a:ece9  c4 40		 cpy $40
$0a:eceb  fc 30 0d	  jsr ($0d30,x)
$0a:ecee  2d 7a ad	  and $ad7a
$0a:ecf1  e1 bc		 sbc ($bc,x)
$0a:ecf3  fc 20 5f	  jsr ($5f20,x)
$0a:ecf6  2c 7d 06	  bit $067d
$0a:ecf9  65 8c		 adc $8c
$0a:ecfb  92 46		 sta ($46)
$0a:ecfd  37 0c		 and [$0c],y
$0a:ecff  50 80		 bvc $ec81
$0a:ed01  4f e0 10 f8   eor $f810e0
$0a:ed05  04 36		 tsb $36
$0a:ed07  79 3e bf	  adc $bf3e,y
$0a:ed0a  5f ff ea a0   eor $a0eaff,x
$0a:ed0e  be df f5	  ldx $f5df,y
$0a:ed11  7d ce ac	  adc $acce,x
$0a:ed14  0f 4b 46 a8   ora $a8464b
$0a:ed18  c7 28		 cmp [$28]
$0a:ed1a  d9 29 c5	  cmp $c529,y
$0a:ed1d  67 4b		 adc [$4b]
$0a:ed1f  7f ca f0 48   adc $48f0ca,x
$0a:ed23  64 7e		 stz $7e
$0a:ed25  0f 1c 1e db   ora $db1e1c
$0a:ed29  4c d3 c8	  jmp $c8d3
$0a:ed2c  38			sec
$0a:ed2d  70 09		 bvs $ed38
$0a:ed2f  74 b2		 stz $b2,x
$0a:ed31  c3 9a		 cmp $9a,s
$0a:ed33  83 6c		 sta $6c,s
$0a:ed35  7d 32 8c	  adc $8c32,x
$0a:ed38  36 1a		 rol $1a,x
$0a:ed3a  a9 90 88	  lda #$8890
$0a:ed3d  e0 34		 cpx #$34
$0a:ed3f  d9 ca 57	  cmp $57ca,y
$0a:ed42  fe 09 0c	  inc $0c09,x
$0a:ed45  a7 d7		 lda [$d7]
$0a:ed47  3a			dec a
$0a:ed48  fd 0b cc	  sbc $cc0b,x
$0a:ed4b  02 de		 cop #$de
$0a:ed4d  09 21 30	  ora #$3021
$0a:ed50  d5 27		 cmp $27,x
$0a:ed52  72 4a		 adc ($4a)
$0a:ed54  fe 27 ed	  inc $ed27,x
$0a:ed57  29 8f f9	  and #$f98f
$0a:ed5a  33 7b		 and ($7b,s),y
$0a:ed5c  dc 05 ab	  jml [$ab05]
$0a:ed5f  df cb f9 08   cmp $08f9cb,x
$0a:ed63  50 46		 bvc $edab
$0a:ed65  4e 90 88	  lsr $8890
$0a:ed68  40			rti
$0a:ed69  3f 90 1e bc   and $bc1e90,x
$0a:ed6d  ea			nop
$0a:ed6e  4d df 84	  eor $84df
$0a:ed71  fd e9 1b	  sbc $1be9,x
$0a:ed74  fa			plx
$0a:ed75  0f fb 6d 00   ora $006dfb
$0a:ed79  98			tya
$0a:ed7a  fc 7a bc	  jsr ($bc7a,x)
$0a:ed7d  f7 f9		 sbc [$f9],y
$0a:ed7f  07 da		 ora [$da]
$0a:ed81  1c a0 1e	  trb $1ea0
$0a:ed84  ed f2 67	  sbc $67f2
$0a:ed87  f7 c6		 sbc [$c6],y
$0a:ed89  d7 a2		 cmp [$a2],y
$0a:ed8b  9b			txy
$0a:ed8c  bf 16 c7 1f   lda $1fc716,x
$0a:ed90  ee ea 5b	  inc $5bea
$0a:ed93  f9 97 38	  sbc $3897,y
$0a:ed96  1a			inc a
$0a:ed97  88			dey
$0a:ed98  20 33 f8	  jsr $f833
$0a:ed9b  43 a4		 eor $a4,s
$0a:ed9d  af f0 47 f9   lda $f947f0
$0a:eda1  55 f2		 eor $f2,x
$0a:eda3  dc 4f ae	  jml [$ae4f]
$0a:eda6  ce f5 09	  dec $09f5
$0a:eda9  fe d1 b7	  inc $b7d1,x
$0a:edac  8c 00 8b	  sty $8b00
$0a:edaf  7a			ply
$0a:edb0  a4 5d		 ldy $5d
$0a:edb2  af 44 03 f5   lda $f50344
$0a:edb6  80 fe		 bra $edb6
$0a:edb8  30 04		 bmi $edbe
$0a:edba  3e d7 0d	  rol $0dd7,x
$0a:edbd  b7 f6		 lda [$f6],y
$0a:edbf  77 da		 adc [$da],y
$0a:edc1  88			dey
$0a:edc2  51 71		 eor ($71),y
$0a:edc4  b9 b8 9d	  lda $9db8,y
$0a:edc7  4f 35 74 c9   eor $c97435
$0a:edcb  5f ee 7c f8   eor $f87cee,x
$0a:edcf  07 1a		 ora [$1a]
$0a:edd1  01 ef		 ora ($ef,x)
$0a:edd3  30 04		 bmi $edd9
$0a:edd5  03 d9		 ora $d9,s
$0a:edd7  00 f6		 brk #$f6
$0a:edd9  a2 07		 ldx #$07
$0a:eddb  19 00 d2	  ora $d200,y
$0a:edde  5e f8 93	  lsr $93f8,x
$0a:ede1  fb			xce
$0a:ede2  94 37		 sty $37,x
$0a:ede4  37 80		 and [$80],y
$0a:ede6  d9 fc e7	  cmp $e7fc,y
$0a:ede9  7f dc a5 ba   adc $baa5dc,x
$0a:eded  a1 3e		 lda ($3e,x)
$0a:edef  0f a3 a4 21   ora $21a4a3
$0a:edf3  86 45		 stx $45
$0a:edf5  92 7f		 sta ($7f)
$0a:edf7  a9 3b 7c	  lda #$7c3b
$0a:edfa  d5 b2		 cmp $b2,x
$0a:edfc  6b			rtl
$0a:edfd  01 fa		 ora ($fa,x)
$0a:edff  fd e3 5b	  sbc $5be3,x
$0a:ee02  ff 46 5f 4b   sbc $4b5f46,x
$0a:ee06  88			dey
$0a:ee07  7f 81 94 8c   adc $8c9481,x
$0a:ee0b  a1 08		 lda ($08,x)
$0a:ee0d  74 1b		 stz $1b,x
$0a:ee0f  a4 36		 ldy $36
$0a:ee11  b6 cc		 ldx $cc,y
$0a:ee13  6d b3 2b	  adc $2bb3
$0a:ee16  5c ba cf 3b   jml $3bcfba
$0a:ee1a  ff ee 2d b2   sbc $b22dee,x
$0a:ee1e  4b			phk
$0a:ee1f  6c d9 7b	  jmp ($7bd9)
$0a:ee22  be 70 06	  ldx $0670,y
$0a:ee25  f8			sed
$0a:ee26  78			sei
$0a:ee27  e0 1c		 cpx #$1c
$0a:ee29  38			sec
$0a:ee2a  04 06		 tsb $06
$0a:ee2c  01 93		 ora ($93,x)
$0a:ee2e  74 0c		 stz $0c,x
$0a:ee30  46 01		 lsr $01
$0a:ee32  15 c3		 ora $c3,x
$0a:ee34  6c 20 5b	  jmp ($5b20)
$0a:ee37  d9 24 23	  cmp $2324,y
$0a:ee3a  05 a5		 ora $a5
$0a:ee3c  c0 ea		 cpy #$ea
$0a:ee3e  b4 7e		 ldy $7e,x
$0a:ee40  4c 05 ff	  jmp $ff05
$0a:ee43  04 cc		 tsb $cc
$0a:ee45  08			php
$0a:ee46  2d fe 07	  and $07fe
$0a:ee49  77 80		 adc [$80],y
$0a:ee4b  dd e0 17	  cmp $17e0,x
$0a:ee4e  b8			clv
$0a:ee4f  05 de		 ora $de
$0a:ee51  05 1b		 ora $1b
$0a:ee53  80 40		 bra $ee95
$0a:ee55  e3 34		 sbc $34,s
$0a:ee57  3d e5 0f	  and $0fe5,x
$0a:ee5a  7d a5 fc	  adc $fca5,x
$0a:ee5d  50 67		 bvc $eec6
$0a:ee5f  b8			clv
$0a:ee60  0b			phd
$0a:ee61  6c 17 8a	  jmp ($8a17)
$0a:ee64  cc 08 0c	  cpy $0c08
$0a:ee67  83 fd		 sta $fd,s
$0a:ee69  20 bf 50	  jsr $50bf
$0a:ee6c  3f d0 11 20   and $2011d0,x
$0a:ee70  e0 3f		 cpx #$3f
$0a:ee72  d8			cld
$0a:ee73  1d d6 03	  ora $03d6,x
$0a:ee76  01 e9		 ora ($e9,x)
$0a:ee78  aa			tax
$0a:ee79  4e 30 95	  lsr $9530
$0a:ee7c  8e 36 a6	  stx $a636
$0a:ee7f  e1 88		 sbc ($88,x)
$0a:ee81  b2 67		 lda ($67)
$0a:ee83  21 5a		 and ($5a,x)
$0a:ee85  dd 55 2b	  cmp $2b55,x
$0a:ee88  6b			rtl
$0a:ee89  23 83		 and $83,s
$0a:ee8b  d8			cld
$0a:ee8c  e0 f2		 cpx #$f2
$0a:ee8e  18			clc
$0a:ee8f  3c 12 0d	  bit $0d12,x
$0a:ee92  f0 83		 beq $ee17
$0a:ee94  fc 60 75	  jsr ($7560,x)
$0a:ee97  08			php
$0a:ee98  14 02		 trb $02
$0a:ee9a  0b			phd
$0a:ee9b  90 b2		 bcc $ee4f
$0a:ee9d  50 e4		 bvc $ee83
$0a:ee9f  bb			tyx
$0a:eea0  58			cli
$0a:eea1  0e ba 07	  asl $07ba
$0a:eea4  62 84 ca	  per $b92b
$0a:eea7  71 15		 adc ($15),y
$0a:eea9  d8			cld
$0a:eeaa  6e 66 4f	  ror $4f66
$0a:eead  ff fc 7f 8c   sbc $8c7ffc,x
$0a:eeb1  03 48		 ora $48,s
$0a:eeb3  ec 71 ff	  cpx $ff71
$0a:eeb6  17 7f		 ora [$7f],y
$0a:eeb8  86 8b		 stx $8b
$0a:eeba  41 50		 eor ($50,x)
$0a:eebc  b8			clv
$0a:eebd  4b			phk
$0a:eebe  fa			plx
$0a:eebf  15 3e		 ora $3e,x
$0a:eec1  24 9f		 bit $9f
$0a:eec3  09 21 d1	  ora #$d121
$0a:eec6  56 f3		 lsr $f3,x
$0a:eec8  35 8f		 and $8f,x
$0a:eeca  04 73		 tsb $73
$0a:eecc  a7 23		 lda [$23]
$0a:eece  fb			xce
$0a:eecf  c0 20		 cpy #$20
$0a:eed1  13 88		 ora ($88,s),y
$0a:eed3  05 e2		 ora $e2
$0a:eed5  81 5c		 sta ($5c,x)
$0a:eed7  e0 49		 cpx #$49
$0a:eed9  ac 11 f8	  ldy $f811
$0a:eedc  85 be		 sta $be
$0a:eede  39 08 84	  and $8408,y
$0a:eee1  75 25		 adc $25,x
$0a:eee3  74 98		 stz $98,x
$0a:eee5  06 52		 asl $52
$0a:eee7  d5 74		 cmp $74,x
$0a:eee9  83 ef		 sta $ef,s
$0a:eeeb  a1 71		 lda ($71,x)
$0a:eeed  0c 1d 4a	  tsb $4a1d
$0a:eef0  79 4a ff	  adc $ff4a,y
$0a:eef3  d1 2d		 cmp ($2d),y
$0a:eef5  fe 6f b4	  inc $b46f,x
$0a:eef8  c6 f3		 dec $f3
$0a:eefa  a8			tay
$0a:eefb  d4 d5		 pei ($d5)
$0a:eefd  2a			rol a
$0a:eefe  1f d8 37 ec   ora $ec37d8,x
$0a:ef02  98			tya
$0a:ef03  10 09		 bpl $ef0e
$0a:ef05  7e 83 b9	  ror $b983,x
$0a:ef08  22 c7 d4 66   jsl $66d4c7
$0a:ef0c  bc a9 56	  ldy $56a9,x
$0a:ef0f  ca			dex
$0a:ef10  05 92		 ora $92
$0a:ef12  89 6f f6	  bit #$f66f
$0a:ef15  b7 da		 lda [$da],y
$0a:ef17  d5 7b		 cmp $7b,x
$0a:ef19  2b			pld
$0a:ef1a  bd 97 5e	  lda $5e97,x
$0a:ef1d  a0 b0		 ldy #$b0
$0a:ef1f  da			phx
$0a:ef20  2e 16 db	  rol $db16
$0a:ef23  08			php
$0a:ef24  bf c0 09 81   lda $8109c0,x
$0a:ef28  65 cf		 adc $cf
$0a:ef2a  4d a0 35	  eor $35a0
$0a:ef2d  9b			txy
$0a:ef2e  86 7b		 stx $7b
$0a:ef30  9f 65 98 c4   sta $c49865,x
$0a:ef34  30 35		 bmi $ef6b
$0a:ef36  99 fa 74	  sta $74fa,y
$0a:ef39  0f e0 de 0c   ora $0cdee0
$0a:ef3d  7c 02 63	  jmp ($6302,x)
$0a:ef40  30 e7		 bmi $ef29
$0a:ef42  c3 1b		 cmp $1b,s
$0a:ef44  c0 de		 cpy #$de
$0a:ef46  18			clc
$0a:ef47  04 ff		 tsb $ff
$0a:ef49  a1 6d		 lda ($6d,x)
$0a:ef4b  c1 f4		 cmp ($f4,x)
$0a:ef4d  21 fa		 and ($fa,x)
$0a:ef4f  6c d7 a6	  jmp ($a6d7)
$0a:ef52  35 97		 and $97,x
$0a:ef54  9c 57 e4	  stz $e457
$0a:ef57  12 fa		 ora ($fa)
$0a:ef59  07 82		 ora [$82]
$0a:ef5b  0f c0 8f e0   ora $e08fc0
$0a:ef5f  27 f0		 and [$f0]
$0a:ef61  1a			inc a
$0a:ef62  fc 12 7f	  jsr ($7f12,x)
$0a:ef65  00 be		 brk #$be
$0a:ef67  40			rti
$0a:ef68  3e 00 b0	  rol $b000,x
$0a:ef6b  de 52 eb	  dec $eb52,x
$0a:ef6e  5f 1b 25 e6   eor $e6251b,x
$0a:ef72  af 18 95 7b   lda $7b9518
$0a:ef76  3d 11 cf	  and $cf11,x
$0a:ef79  f4 13 fd	  pea $fd13
$0a:ef7c  02 83		 cop #$83
$0a:ef7e  fc 20 7f	  jsr ($7f20,x)
$0a:ef81  cc 0f fb	  cpy $fb0f
$0a:ef84  c3 fe		 cmp $fe,s
$0a:ef86  88			dey
$0a:ef87  37 80		 and [$80],y
$0a:ef89  10 10		 bpl $ef9b
$0a:ef8b  f8			sed
$0a:ef8c  04 1f		 tsb $1f
$0a:ef8e  41 df		 eor ($df,x)
$0a:ef90  b9 eb 3a	  lda $3aeb,y
$0a:ef93  1f fa 6f 7b   ora $7b6ffa,x
$0a:ef97  f7 37		 sbc [$37],y
$0a:ef99  96 f7		 stx $f7,y
$0a:ef9b  31 7f		 and ($7f),y
$0a:ef9d  7a			ply
$0a:ef9e  37 f9		 and [$f9],y
$0a:efa0  96 0c		 stx $0c,y
$0a:efa2  b0 04		 bcs $efa8
$0a:efa4  04 fe		 tsb $fe
$0a:efa6  11 0f		 ora ($0f),y
$0a:efa8  80 c0		 bra $ef6a
$0a:efaa  dd 83 01	  cmp $0183,x
$0a:efad  80 43		 bra $eff2
$0a:efaf  7e 71 4f	  ror $4f71,x
$0a:efb2  35 8f		 and $8f,x
$0a:efb4  1b			tcs
$0a:efb5  96 9d		 stx $9d,y
$0a:efb7  f1 3e		 sbc ($3e),y
$0a:efb9  fc e8 7d	  jsr ($7de8,x)
$0a:efbc  4e 47 3d	  lsr $3d47
$0a:efbf  f2 ff		 sbc ($ff)
$0a:efc1  9c 02 5f	  stz $5f02
$0a:efc4  0f e4 03 f0   ora $f003e4
$0a:efc8  0b			phd
$0a:efc9  13 28		 ora ($28,s),y
$0a:efcb  7e a0 12	  ror $12a0,x
$0a:efce  a9 9f 7a	  lda #$7a9f
$0a:efd1  25 dd		 and $dd
$0a:efd3  88			dey
$0a:efd4  50 f3		 bvc $efc9
$0a:efd6  59 e8 97	  eor $97e8,y
$0a:efd9  de 75 d9	  dec $d975,x
$0a:efdc  89 56 73	  bit #$7356
$0a:efdf  dc c8 07	  jml [$07c8]
$0a:efe2  b6 01		 ldx $01,y
$0a:efe4  ef 40 0a 04   sbc $040a40
$0a:efe8  39 a8 01	  and $01a8,y
$0a:efeb  f0 c0		 beq $efad
$0a:efed  2e f0 9e	  rol $9ef0
$0a:eff0  57 2e		 eor [$2e],y
$0a:eff2  51 ff		 eor ($ff),y
$0a:eff4  f2 f7		 sbc ($f7)
$0a:eff6  e6 b6		 inc $b6
$0a:eff8  a8			tay
$0a:eff9  6d a3 a9	  adc $a9a3
$0a:effc  f4 9a de	  pea $de9a
$0a:efff  cb			wai
$0a:f000  e1 34		 sbc ($34,x)
$0a:f002  76 14		 ror $14,x
$0a:f004  03 3f		 ora $3f,s
$0a:f006  00 cb		 brk #$cb
$0a:f008  c0 21		 cpy #$21
$0a:f00a  70 0c		 bvs $f018
$0a:f00c  04 02		 tsb $02
$0a:f00e  39 82 eb	  and $eb82,y
$0a:f011  dd f9 53	  cmp $53f9,x
$0a:f014  fe b7 ef	  inc $efb7,x
$0a:f017  15 73		 ora $73,x
$0a:f019  ee c1 f5	  inc $f5c1
$0a:f01c  78			sei
$0a:f01d  da			phx
$0a:f01e  9e f4 7e	  stz $7ef4,x
$0a:f021  10 87		 bpl $efaa
$0a:f023  60			rts
$0a:f024  9a			txs
$0a:f025  c0 ca		 cpy #$ca
$0a:f027  57 07		 eor [$07],y
$0a:f029  60			rts
$0a:f02a  c8			iny
$0a:f02b  7d f8 6e	  adc $6ef8,x
$0a:f02e  76 d3		 ror $d3,x
$0a:f030  d9 0d a6	  cmp $a60d,y
$0a:f033  65 f9		 adc $f9
$0a:f035  d3 5b		 cmp ($5b,s),y
$0a:f037  64 16		 stz $16
$0a:f039  99 47 9e	  sta $9e47,y
$0a:f03c  44 20 13	  mvp $13,$20
$0a:f03f  18			clc
$0a:f040  04 4e		 tsb $4e
$0a:f042  01 b3		 ora ($b3,x)
$0a:f044  70 0e		 bvs $f054
$0a:f046  4d c8 38	  eor $38c8
$0a:f049  34 00		 bit $00,x
$0a:f04b  55 a5		 eor $a5,x
$0a:f04d  98			tya
$0a:f04e  6a			ror a
$0a:f04f  af 17 57 76   lda $765717
$0a:f053  ca			dex
$0a:f054  5b			tcd
$0a:f055  f2 b0		 sbc ($b0)
$0a:f057  7d 26 9e	  adc $9e26,x
$0a:f05a  95 b4		 sta $b4,x
$0a:f05c  9c c0 ef	  stz $efc0
$0a:f05f  30 19		 bmi $f07a
$0a:f061  c1 24		 cmp ($24,x)
$0a:f063  20 7f 88	  jsr $887f
$0a:f066  17 e2		 ora [$e2],y
$0a:f068  03 58		 ora $58,s
$0a:f06a  26 84		 rol $84
$0a:f06c  07 91		 ora [$91]
$0a:f06e  bc e5 ed	  ldy $ede5,x
$0a:f071  6b			rtl
$0a:f072  b8			clv
$0a:f073  19 b5 6f	  ora $6fb5,y
$0a:f076  7d 81 a8	  adc $a881,x
$0a:f079  c0 3b		 cpy #$3b
$0a:f07b  bd dd 4d	  lda $4ddd,x
$0a:f07e  5e ff 80	  lsr $80ff,x
$0a:f081  bf 40 2f d8   lda $d82f40,x
$0a:f085  01 20		 ora ($20,x)
$0a:f087  07 c0		 ora [$c0]
$0a:f089  c2 12		 rep #$12
$0a:f08b  26 60		 rol $60
$0a:f08d  ec 38 f6	  cpx $f638
$0a:f090  3a			dec a
$0a:f091  e6 e2		 inc $e2
$0a:f093  87 48		 sta [$48]
$0a:f095  db			stp
$0a:f096  67 7a		 adc [$7a]
$0a:f098  12 8d		 ora ($8d)
$0a:f09a  7f 52 f7 bf   adc $bff752,x
$0a:f09e  e1 c2		 sbc ($c2,x)
$0a:f0a0  21 18		 and ($18,x)
$0a:f0a2  38			sec
$0a:f0a3  5e 12 09	  lsr $0912,x
$0a:f0a6  01 92		 ora ($92,x)
$0a:f0a8  c8			iny
$0a:f0a9  ac 55 0a	  ldy $0a55
$0a:f0ac  16 83		 asl $83,x
$0a:f0ae  03 0c		 ora $0c,s
$0a:f0b0  86 5b		 stx $5b
$0a:f0b2  72 d3		 adc ($d3)
$0a:f0b4  6e 4c 27	  ror $274c
$0a:f0b7  61 a6		 adc ($a6,x)
$0a:f0b9  89 6f 28	  bit #$286f
$0a:f0bc  12 9c		 ora ($9c)
$0a:f0be  44 5a 79	  mvp $79,$5a
$0a:f0c1  56 f1		 lsr $f1,x
$0a:f0c3  c2 31		 rep #$31
$0a:f0c5  13 79		 ora ($79,s),y
$0a:f0c7  85 3f		 sta $3f
$0a:f0c9  91 f9		 sta ($f9),y
$0a:f0cb  dc 44 e2	  jml [$e244]
$0a:f0ce  55 7e		 eor $7e,x
$0a:f0d0  87 0f		 sta [$0f]
$0a:f0d2  c0 4d 0b	  cpy #$0b4d
$0a:f0d5  2e 7a 6b	  rol $6b7a
$0a:f0d8  08			php
$0a:f0d9  a4 c0		 ldy $c0
$0a:f0db  32 58		 and ($58)
$0a:f0dd  1a			inc a
$0a:f0de  6c 36 25	  jmp ($2536)
$0a:f0e1  89 ca db	  bit #$dbca
$0a:f0e4  e9 42 90	  sbc #$9042
$0a:f0e7  80 0a		 bra $f0f3
$0a:f0e9  40			rti
$0a:f0ea  52 0b		 eor ($0b)
$0a:f0ec  f0 f9		 beq $f0e7
$0a:f0ee  a0 0d 44	  ldy #$440d
$0a:f0f1  1a			inc a
$0a:f0f2  ba			tsx
$0a:f0f3  e5 57		 sbc $57
$0a:f0f5  c5 2c		 cmp $2c
$0a:f0f7  c0 60 70	  cpy #$7060
$0a:f0fa  35 2e		 and $2e,x
$0a:f0fc  84 27		 sty $27
$0a:f0fe  01 b2		 ora ($b2,x)
$0a:f100  c7 cd		 cmp [$cd]
$0a:f102  bf cc c0 9f   lda $9fc0cc,x
$0a:f106  a1 04		 lda ($04,x)
$0a:f108  42 12		 wdm #$12
$0a:f10a  f4 20 af	  pea $af20
$0a:f10d  c0 18 19	  cpy #$1918
$0a:f110  2b			pld
$0a:f111  ff 76 b9 b9   sbc $b9b976,x
$0a:f115  9f 71 6f 1b   sta $1b6f71,x
$0a:f119  fa			plx
$0a:f11a  8f b6 05 b4   sta $b405b6
$0a:f11e  a8			tay
$0a:f11f  78			sei
$0a:f120  62 80 d0	  per $c1a3
$0a:f123  91 c1		 sta ($c1),y
$0a:f125  e8			inx
$0a:f126  10 f8		 bpl $f120
$0a:f128  04 7a		 tsb $7a
$0a:f12a  01 1b		 ora ($1b,x)
$0a:f12c  88			dey
$0a:f12d  45 e0		 eor $e0
$0a:f12f  11 f8		 ora ($f8),y
$0a:f131  44 7a 25	  mvp $25,$7a
$0a:f134  95 b0		 sta $b0,x
$0a:f136  d8			cld
$0a:f137  f1 16		 sbc ($16),y
$0a:f139  3d 74 66	  and $6674,x
$0a:f13c  e3 87		 sbc $87,s
$0a:f13e  d9 50 e5	  cmp $e550,y
$0a:f141  b0 be		 bcs $f101
$0a:f143  34 ae		 bit $ae,x
$0a:f145  dd 80 cf	  cmp $cf80,x
$0a:f148  78			sei
$0a:f149  23 df		 and $df,s
$0a:f14b  08			php
$0a:f14c  35 e2		 and $e2,x
$0a:f14e  1d d8 87	  ora $87d8,x
$0a:f151  7a			ply
$0a:f152  20 df 88	  jsr $88df
$0a:f155  b4 e3		 ldy $e3,x
$0a:f157  6f 40 e5 c0   adc $c0e540
$0a:f15b  26 b4		 rol $b4
$0a:f15d  0b			phd
$0a:f15e  14 c3		 trb $c3
$0a:f160  2b			pld
$0a:f161  38			sec
$0a:f162  e6 e7		 inc $e7
$0a:f164  ad 74 7a	  lda $7a74
$0a:f167  56 c2		 lsr $c2,x
$0a:f169  01 e8		 ora ($e8,x)
$0a:f16b  80 7d		 bra $f1ea
$0a:f16d  20 09 e0	  jsr $e009
$0a:f170  fe a9 06	  inc $06a9,x
$0a:f173  7f 80 8f c0   adc $c08f80,x
$0a:f177  20 ff d8	  jsr $d8ff
$0a:f17a  17 ee		 ora [$ee],y
$0a:f17c  01 f7		 ora ($f7,x)
$0a:f17e  81 5b		 sta ($5b,x)
$0a:f180  e0 93 18	  cpx #$1893
$0a:f183  65 4f		 adc $4f
$0a:f185  73 57		 adc ($57,s),y
$0a:f187  f1 75		 sbc ($75),y
$0a:f189  61 60		 adc ($60,x)
$0a:f18b  d0 0f		 bne $f19c
$0a:f18d  8c 3a 01	  sty $013a
$0a:f190  9e 01 8f	  stz $8f01,x
$0a:f193  f2 03		 sbc ($03)
$0a:f195  f8			sed
$0a:f196  80 78		 bra $f210
$0a:f198  32 b5		 and ($b5)
$0a:f19a  cd 15 8b	  cmp $8b15
$0a:f19d  2d 71 a2	  and $a271
$0a:f1a0  ff 31 ff fa   sbc $faff31,x
$0a:f1a4  6f f0 5e 1b   adc $1b5ef0
$0a:f1a8  2b			pld
$0a:f1a9  14 8e		 trb $8e
$0a:f1ab  01 1d		 ora ($1d,x)
$0a:f1ad  80 31		 bra $f1e0
$0a:f1af  02 06		 cop #$06
$0a:f1b1  8c 12 28	  sty $2812
$0a:f1b4  0f ca a9 e1   ora $e1a9ca
$0a:f1b8  db			stp
$0a:f1b9  52 fd		 eor ($fd)
$0a:f1bb  df 7c 95 8f   cmp $8f957c,x
$0a:f1bf  57 73		 eor [$73],y
$0a:f1c1  be f9 49	  ldx $49f9,y
$0a:f1c4  e1 86		 sbc ($86,x)
$0a:f1c6  bd 8a 06	  lda $068a,x
$0a:f1c9  00 2c		 brk #$2c
$0a:f1cb  03 08		 ora $08,s
$0a:f1cd  18			clc
$0a:f1ce  43 f4		 eor $f4,s
$0a:f1d0  27 22		 and [$22]
$0a:f1d2  70 4e		 bvs $f222
$0a:f1d4  e4 95		 cpx $95
$0a:f1d6  fc 4c da	  jsr ($da4c,x)
$0a:f1d9  d3 df		 cmp ($df,s),y
$0a:f1db  c3 46		 cmp $46,s
$0a:f1dd  75 32		 adc $32,x
$0a:f1df  0f dc ee b9   ora $b9eedc
$0a:f1e3  96 ff		 stx $ff,y
$0a:f1e5  c0 0f e5	  cpy #$e50f
$0a:f1e8  bf 40 0f 7e   lda $7e0f40,x
$0a:f1ec  01 c4		 ora ($c4,x)
$0a:f1ee  80 7b		 bra $f26b
$0a:f1f0  e0 12 4b	  cpx #$4b12
$0a:f1f3  95 2e		 sta $2e,x
$0a:f1f5  b3 fc		 lda ($fc,s),y
$0a:f1f7  ee c9 6a	  inc $6ac9
$0a:f1fa  d0 ba		 bne $f1b6
$0a:f1fc  b5 a6		 lda $a6,x
$0a:f1fe  af f6 ab c2   lda $c2abf6
$0a:f202  3b			tsc
$0a:f203  b8			clv
$0a:f204  f8			sed
$0a:f205  06 9a		 asl $9a
$0a:f207  01 22		 ora ($22,x)
$0a:f209  80 6a		 bra $f275
$0a:f20b  20 1a 95	  jsr $951a
$0a:f20e  20 a9 41	  jsr $41a9
$0a:f211  46 18		 lsr $18
$0a:f213  9b			txy
$0a:f214  7d da 3b	  adc $3bda,x
$0a:f217  e3 dc		 sbc $dc,s
$0a:f219  d3 fe		 cmp ($fe,s),y
$0a:f21b  bd 9b 9d	  lda $9d9b,x
$0a:f21e  86 97		 stx $97
$0a:f220  b3 ec		 lda ($ec,s),y
$0a:f222  ec 29 7f	  cpx $7f29
$0a:f225  01 68		 ora ($68,x)
$0a:f227  40			rti
$0a:f228  28			plp
$0a:f229  84 61		 sty $61
$0a:f22b  c2 40		 rep #$40
$0a:f22d  32 90		 and ($90)
$0a:f22f  08			php
$0a:f230  23 28		 and $28,s
$0a:f232  7a			ply
$0a:f233  93 a9		 sta ($a9,s),y
$0a:f235  3f 76 11 f4   and $f41176,x
$0a:f239  a7 ee		 lda [$ee]
$0a:f23b  a8			tay
$0a:f23c  7f ae ac 92   adc $92acae,x
$0a:f240  73 3c		 adc ($3c,s),y
$0a:f242  b7 f7		 lda [$f7],y
$0a:f244  0f e0 04 03   ora $0304e0
$0a:f248  f8			sed
$0a:f249  01 80		 ora ($80,x)
$0a:f24b  0c 01 10	  tsb $1001
$0a:f24e  e1 c0		 sbc ($c0,x)
$0a:f250  3e 70 08	  rol $0870,x
$0a:f253  be 1b 61	  ldx $611b,y
$0a:f256  02 de		 cop #$de
$0a:f258  c9 21 38	  cmp #$3821
$0a:f25b  3d 3e 03	  and $033e,x
$0a:f25e  53 a0		 eor ($a0,s),y
$0a:f260  f1 60		 sbc ($60),y
$0a:f262  2f f8 08 05   and $0508f8
$0a:f266  fe 09 7f	  inc $7f09,x
$0a:f269  81 dd		 sta ($dd,x)
$0a:f26b  e0 00 40	  cpx #$4000
$0a:f26e  bc 01 44	  ldy $4401,x
$0a:f271  9a			txs
$0a:f272  10 0a		 bpl $f27e
$0a:f274  cd 0f 79	  cmp $790f
$0a:f277  43 df		 eor $df,s
$0a:f279  49 6f 14	  eor #$146f
$0a:f27c  19 ec 03	  ora $03ec,y
$0a:f27f  db			stp
$0a:f280  05 a2		 ora $a2
$0a:f282  a0 02 03	  ldy #$0302
$0a:f285  20 ff 48	  jsr $48ff
$0a:f288  2f dc 0f f6   and $f60fdc
$0a:f28c  07 fd		 ora [$fd]
$0a:f28e  01 35		 ora ($35,x)
$0a:f290  80 98		 bra $f22a
$0a:f292  37 44		 and [$44],y
$0a:f294  70 fd		 bvs $f293
$0a:f296  e1 25		 sbc ($25,x)
$0a:f298  b4 0e		 ldy $0e,x
$0a:f29a  b5 86		 lda $86,x
$0a:f29c  03 7a		 ora $7a,s
$0a:f29e  ca			dex
$0a:f29f  76 69		 ror $69,x
$0a:f2a1  32 fc		 and ($fc)
$0a:f2a3  95 bf		 sta $bf,x
$0a:f2a5  6b			rtl
$0a:f2a6  fd 89 44	  sbc $4489,x
$0a:f2a9  b2 71		 lda ($71)
$0a:f2ab  bc 74 3f	  ldy $3f74,x
$0a:f2ae  09 2e 93	  ora #$932e
$0a:f2b1  49 fa 11	  eor #$11fa
$0a:f2b4  0f fc 42 05   ora $0542fc
$0a:f2b8  00 b1		 brk #$b1
$0a:f2ba  e6 24		 inc $24
$0a:f2bc  d9 de cc	  cmp $ccde,y
$0a:f2bf  03 8d		 ora $8d,s
$0a:f2c1  26 aa		 rol $aa
$0a:f2c3  4c 22 38	  jmp $3822
$0a:f2c6  0a			asl a
$0a:f2c7  b4 e2		 ldy $e2,x
$0a:f2c9  95 ff		 sta $ff,x
$0a:f2cb  83 43		 sta $43,s
$0a:f2cd  ac 7e 09	  ldy $097e
$0a:f2d0  fc c2 33	  jsr ($33c2,x)
$0a:f2d3  30 e7		 bmi $f2bc
$0a:f2d5  f0 2f		 beq $f306
$0a:f2d7  e8			inx
$0a:f2d8  01 62		 ora ($62,x)
$0a:f2da  06 af		 asl $af
$0a:f2dc  99 95 e1	  sta $e195,y
$0a:f2df  6b			rtl
$0a:f2e0  29 15 9b	  and #$9b15
$0a:f2e3  0e 9b 69	  asl $699b
$0a:f2e6  56 8d		 lsr $8d,x
$0a:f2e8  66 af		 ror $af
$0a:f2ea  3b			tsc
$0a:f2eb  1f ec 42 20   ora $2042ec,x
$0a:f2ef  63 0c		 adc $0c,s
$0a:f2f1  bc 63 1d	  ldy $1d63,x
$0a:f2f4  08			php
$0a:f2f5  a5 c3		 lda $c3
$0a:f2f7  3c b0 4f	  bit $4fb0,x
$0a:f2fa  bc 1a 05	  ldy $051a,x
$0a:f2fd  06 f1		 asl $f1
$0a:f2ff  57 78		 eor [$78],y
$0a:f301  75 dd		 adc $dd,x
$0a:f303  5d 57 45	  eor $4557,x
$0a:f306  5d f6 d0	  eor $d0f6,x
$0a:f309  f9 34 9c	  sbc $9c34,y
$0a:f30c  15 f8		 ora $f8,x
$0a:f30e  4c 13 e8	  jmp $e813
$0a:f311  02 7d		 cop #$7d
$0a:f313  a6 d0		 ldx $d0
$0a:f315  08			php
$0a:f316  0b			phd
$0a:f317  10 76		 bpl $f38f
$0a:f319  94 cc		 sty $cc,x
$0a:f31b  cd 9f 95	  cmp $959f
$0a:f31e  71 df		 adc ($df),y
$0a:f320  c8			iny
$0a:f321  2f da 1e d6   and $d61eda
$0a:f325  16 1b		 asl $1b,x
$0a:f327  97 f8		 sta [$f8],y
$0a:f329  4b			phk
$0a:f32a  e0 71 f8	  cpx #$f871
$0a:f32d  04 3e		 tsb $3e
$0a:f32f  01 07		 ora ($07,x)
$0a:f331  a0 42 68	  ldy #$6842
$0a:f334  10 5b		 bpl $f391
$0a:f336  04 3d		 tsb $3d
$0a:f338  92 14		 sta ($14)
$0a:f33a  08			php
$0a:f33b  fe aa 6f	  inc $6faa,x
$0a:f33e  58			cli
$0a:f33f  b0 d6		 bcs $f317
$0a:f341  f0 3e		 beq $f381
$0a:f343  b8			clv
$0a:f344  8f 73 67 29   sta $296773
$0a:f348  b1 ea		 lda ($ea),y
$0a:f34a  f2 79		 sbc ($79)
$0a:f34c  0b			phd
$0a:f34d  d7 03		 cmp [$03],y
$0a:f34f  f1 86		 sbc ($86),y
$0a:f351  f8			sed
$0a:f352  41 bd		 eor ($bd,x)
$0a:f354  10 6d		 bpl $f3c3
$0a:f356  c4 1b		 cpy $1b
$0a:f358  f1 96		 sbc ($96),y
$0a:f35a  fc 59 bf	  jsr ($bf59,x)
$0a:f35d  10 7f		 bpl $f3de
$0a:f35f  c7 62		 cmp [$62]
$0a:f361  bf 2b c5 d4   lda $d4c52b,x
$0a:f365  b8			clv
$0a:f366  1a			inc a
$0a:f367  db			stp
$0a:f368  b6 42		 ldx $42,y
$0a:f36a  db			stp
$0a:f36b  97 80		 sta [$80],y
$0a:f36d  e8			inx
$0a:f36e  b4 74		 ldy $74,x
$0a:f370  bd a4 82	  lda $82a4,x
$0a:f373  01 74		 ora ($74,x)
$0a:f375  80 4f		 bra $f3c6
$0a:f377  cd 82 28	  cmp $2882
$0a:f37a  18			clc
$0a:f37b  05 70		 ora $70
$0a:f37d  d8			cld
$0a:f37e  31 4f		 and ($4f),y
$0a:f380  86 af		 stx $af
$0a:f382  2b			pld
$0a:f383  5d 80 cd	  eor $cd80,x
$0a:f386  bb			tyx
$0a:f387  7b			tdc
$0a:f388  ec 0d 46	  cpx $460d
$0a:f38b  01 dd		 ora ($dd,x)
$0a:f38d  ee ea 6a	  inc $6aea
$0a:f390  ec 20 bf	  cpx $bf20
$0a:f393  02 05		 cop #$05
$0a:f395  5a			phy
$0a:f396  06 92		 asl $92
$0a:f398  91 1b		 sta ($1b),y
$0a:f39a  06 a9		 asl $a9
$0a:f39c  b3 d2		 lda ($d2,s),y
$0a:f39e  f7 29		 sbc [$29],y
$0a:f3a0  df ec ad 72   cmp $72adec,x
$0a:f3a4  65 e2		 adc $e2
$0a:f3a6  ea			nop
$0a:f3a7  7c f4 b3	  jmp ($b3f4,x)
$0a:f3aa  c8			iny
$0a:f3ab  64 3e		 stz $3e
$0a:f3ad  1f 00 81 aa   ora $aa8100,x
$0a:f3b1  86 47		 stx $47
$0a:f3b3  00 8e		 brk #$8e
$0a:f3b5  b0 47		 bcs $f3fe
$0a:f3b7  87 00		 sta [$00]
$0a:f3b9  f8			sed
$0a:f3ba  40			rti
$0a:f3bb  3c df 7e	  bit $7edf,x
$0a:f3be  1c 8f 5b	  trb $5b8f
$0a:f3c1  75 b8		 adc $b8,x
$0a:f3c3  79 78 d7	  adc $d778,y
$0a:f3c6  bf 6f db 5b   lda $5bdb6f,x
$0a:f3ca  4d fb fc	  eor $fcfb
$0a:f3cd  3f 10 0f e4   and $e40f10,x
$0a:f3d1  03 f4		 ora $f4,s
$0a:f3d3  08			php
$0a:f3d4  13 08		 ora ($08,s),y
$0a:f3d6  7e 60 1f	  ror $1f60,x
$0a:f3d9  26 08		 rol $08
$0a:f3db  ca			dex
$0a:f3dc  e6 7a		 inc $7a
$0a:f3de  e9 97 76	  sbc #$7697
$0a:f3e1  21 43		 and ($43,x)
$0a:f3e3  cd 67 a2	  cmp $a267
$0a:f3e6  5f 79 d7 66   eor $66d779,x
$0a:f3ea  25 58		 and $58
$0a:f3ec  cf 73 20 1c   cmp $1c2073
$0a:f3f0  d8			cld
$0a:f3f1  07 be		 ora [$be]
$0a:f3f3  01 ed		 ora ($ed,x)
$0a:f3f5  42 0a		 wdm #$0a
$0a:f3f7  04 10		 tsb $10
$0a:f3f9  a1 e1		 lda ($e1,x)
$0a:f3fb  80 60		 bra $f45d
$0a:f3fd  fb			xce
$0a:f3fe  da			phx
$0a:f3ff  ae ed de	  ldx $deed
$0a:f402  a1 75		 lda ($75,x)
$0a:f404  af 4f d9 21   lda $21d94f
$0a:f408  7f df f0 28   adc $28f0df,x
$0a:f40c  3b			tsc
$0a:f40d  e7 f8		 sbc [$f8]
$0a:f40f  3f c3 51 00   and $0051c3,x
$0a:f413  d0 40		 bne $f455
$0a:f415  30 0a		 bmi $f421
$0a:f417  61 55		 adc ($55,x)
$0a:f419  17 92		 ora [$92],y
$0a:f41b  bf 32 ec f8   lda $f8ec32,x
$0a:f41f  e3 39		 sbc $39,s
$0a:f421  db			stp
$0a:f422  3f f6 0f 68   and $680ff6,x
$0a:f426  ff ff e0 3c   sbc $3ce0ff,x
$0a:f42a  49 d8 94	  eor #$94d8
$0a:f42d  20 8c 01	  jsr $018c
$0a:f430  62 44 87	  per $7b77
$0a:f433  df 86 e7 6d   cmp $6de786,x
$0a:f437  3d 90 da	  and $da90,x
$0a:f43a  66 5f		 ror $5f
$0a:f43c  9d 35 b6	  sta $b635,x
$0a:f43f  41 69		 eor ($69,x)
$0a:f441  9c 7d e4	  stz $e47d
$0a:f444  42 01		 wdm #$01
$0a:f446  31 80		 and ($80),y
$0a:f448  44 e0 1b	  mvp $1b,$e0
$0a:f44b  37 00		 and [$00],y
$0a:f44d  e4 dc		 cpx $dc
$0a:f44f  82 41 0d	  brl $0193
$0a:f452  bd 22 bb	  lda $bb22,x
$0a:f455  b6 db		 ldx $db,y
$0a:f457  f2 2d		 sbc ($2d)
$0a:f459  5d 7a ed	  eor $ed7a,x
$0a:f45c  a7 6d		 lda [$6d]
$0a:f45e  2a			rol a
$0a:f45f  d0 6d		 bne $f4ce
$0a:f461  aa			tax
$0a:f462  b9 66 23	  lda $2366,y
$0a:f465  60			rts
$0a:f466  a0 1c 18	  ldy #$181c
$0a:f469  05 26		 ora $26
$0a:f46b  01 69		 ora ($69,x)
$0a:f46d  14 0d		 trb $0d
$0a:f46f  5f 5f f1 ce   eor $cef15f,x
$0a:f473  f7 6c		 sbc [$6c],y
$0a:f475  36 7f		 rol $7f,x
$0a:f477  ce b7 b3	  dec $b3b7
$0a:f47a  31 b2		 and ($b2),y
$0a:f47c  df e8 aa a2   cmp $a2aae8,x
$0a:f480  81 08		 sta ($08,x)
$0a:f482  97 15		 sta [$15],y
$0a:f484  00 d5		 brk #$d5
$0a:f486  03 86		 ora $86,s
$0a:f488  3f e0 bb 72   and $72bbe0,x
$0a:f48c  6f bc 29 ce   adc $ce29bc
$0a:f490  1a			inc a
$0a:f491  dd d1 bd	  cmp $bdd1,x
$0a:f494  f5 61		 sbc $61,x
$0a:f496  3a			dec a
$0a:f497  36 23		 rol $23,x
$0a:f499  50 15		 bvc $f4b0
$0a:f49b  47 54		 eor [$54]
$0a:f49d  07 0f		 ora [$0f]
$0a:f49f  5e 51 fa	  lsr $fa51,x
$0a:f4a2  86 eb		 stx $eb
$0a:f4a4  6a			ror a
$0a:f4a5  56 de		 lsr $de,x
$0a:f4a7  9e eb 8d	  stz $8deb,x
$0a:f4aa  fa			plx
$0a:f4ab  cb			wai
$0a:f4ac  d5 67		 cmp $67,x
$0a:f4ae  8c 48 80	  sty $8048
$0a:f4b1  81 0f		 sta ($0f,x)
$0a:f4b3  01 7f		 ora ($7f,x)
$0a:f4b5  db			stp
$0a:f4b6  dd f7 d4	  cmp $d4f7,x
$0a:f4b9  1f d4 1b bf   ora $bf1bd4,x
$0a:f4bd  20 fa 42	  jsr $42fa
$0a:f4c0  bc d1 9e	  ldy $9ed1,x
$0a:f4c3  cc 9d 9a	  cpy $9a9d
$0a:f4c6  10 83		 bpl $f44b
$0a:f4c8  32 9a		 and ($9a)
$0a:f4ca  49 9a 10	  eor #$109a
$0a:f4cd  3f f4 ca 63   and $63caf4,x
$0a:f4d1  bb			tyx
$0a:f4d2  a3 59		 lda $59,s
$0a:f4d4  ff 1d 39 e6   sbc $e6391d,x
$0a:f4d8  df d1 bb a6   cmp $a6bbd1,x
$0a:f4dc  73 ee		 adc ($ee,s),y
$0a:f4de  8c d0 e7	  sty $e7d0
$0a:f4e1  31 25		 and ($25),y
$0a:f4e3  9a			txs
$0a:f4e4  1a			inc a
$0a:f4e5  2a			rol a
$0a:f4e6  ee aa d5	  inc $d5aa
$0a:f4e9  51 e7		 eor ($e7),y
$0a:f4eb  49 33 76	  eor #$7633
$0a:f4ee  ae 84 13	  ldx $1384
$0a:f4f1  27 20		 and [$20]
$0a:f4f3  cb			wai
$0a:f4f4  d4 3c		 pei ($3c)
$0a:f4f6  e7 f0		 sbc [$f0]
$0a:f4f8  8a			txa
$0a:f4f9  c0 27 f0	  cpy #$f027
$0a:f4fc  0b			phd
$0a:f4fd  fb			xce
$0a:f4fe  08			php
$0a:f4ff  d8			cld
$0a:f500  a5 c4		 lda $c4
$0a:f502  9d d5 aa	  sta $aad5,x
$0a:f505  f0 5f		 beq $f566
$0a:f507  dd 4b d9	  cmp $d94b,x
$0a:f50a  50 87		 bvc $f493
$0a:f50c  64 ff		 stz $ff
$0a:f50e  bb			tyx
$0a:f50f  2b			pld
$0a:f510  e4 a7		 cpx $a7
$0a:f512  ae 7f 0d	  ldx $0d7f
$0a:f515  44 03 fc	  mvp $fc,$03
$0a:f518  0e 12 78	  asl $7812
$0a:f51b  38			sec
$0a:f51c  c9 c6 18	  cmp #$18c6
$0a:f51f  2b			pld
$0a:f520  cf 26 c7 b6   cmp $b6c726
$0a:f524  a5 72		 lda $72
$0a:f526  23 df		 and $df,s
$0a:f528  78			sei
$0a:f529  7f 56 43 ae   adc $ae4356,x
$0a:f52d  88			dey
$0a:f52e  f5 e2		 sbc $e2,x
$0a:f530  10 08		 bpl $f53a
$0a:f532  38			sec
$0a:f533  c0 20 20	  cpy #$2020
$0a:f536  20 61 84	  jsr $8461
$0a:f539  fe 04 c3	  inc $c304,x
$0a:f53c  0b			phd
$0a:f53d  9c 02 f3	  stz $f302
$0a:f540  a2 ef 78	  ldx #$78ef
$0a:f543  6a			ror a
$0a:f544  f9 5d df	  sbc $df5d,y
$0a:f547  a6 d7		 ldx $d7
$0a:f549  57 ac		 eor [$ac],y
$0a:f54b  d3 e4		 cmp ($e4,s),y
$0a:f54d  bb			tyx
$0a:f54e  1e 6d bf	  asl $bf6d,x
$0a:f551  13 01		 ora ($01,s),y
$0a:f553  f0 60		 beq $f5b5
$0a:f555  3f 1c 0f c6   and $c60f1c,x
$0a:f559  43 f9		 eor $f9,s
$0a:f55b  a0 fe 70	  ldy #$70fe
$0a:f55e  3f 8a 01 cf   and $cf018a,x
$0a:f562  7e a0 b9	  ror $b9a0,x
$0a:f565  e8			inx
$0a:f566  66 16		 ror $16
$0a:f568  71 b9		 adc ($b9),y
$0a:f56a  8d 71 25	  sta $2571
$0a:f56d  7c e9 ae	  jmp ($aee9,x)
$0a:f570  56 47		 lsr $47,x
$0a:f572  b2 ae		 lda ($ae)
$0a:f574  c0 df e1	  cpy #$e1df
$0a:f577  60			rts
$0a:f578  97 d8		 sta [$d8],y
$0a:f57a  21 f4		 and ($f4,x)
$0a:f57c  08			php
$0a:f57d  fc 02 1f	  jsr ($1f02,x)
$0a:f580  10 87		 bpl $f509
$0a:f582  d4 20		 pei ($20)
$0a:f584  f0 8e		 beq $f514
$0a:f586  87 83		 sta [$83]
$0a:f588  95 c8		 sta $c8,x
$0a:f58a  fb			xce
$0a:f58b  61 25		 adc ($25,x)
$0a:f58d  91 4d		 sta ($4d),y
$0a:f58f  a5 13		 lda $13
$0a:f591  59 5a ff	  eor $ff5a,y
$0a:f594  7c 34 5f	  jmp ($5f34,x)
$0a:f597  ef c4 1e 79   sbc $791ec4
$0a:f59b  03 be		 ora $be,s
$0a:f59d  70 ff		 bvs $f59e
$0a:f59f  d0 5f		 bne $f600
$0a:f5a1  f4 07 f9	  pea $f907
$0a:f5a4  03 fe		 ora $fe,s
$0a:f5a6  78			sei
$0a:f5a7  ff 10 5b 56   sbc $565b10,x
$0a:f5ab  cf d1 33 e8   cmp $e833d1
$0a:f5af  c5 a8		 cmp $a8
$0a:f5b1  f9 ec 7c	  sbc $7cec,y
$0a:f5b4  42 c1		 wdm #$c1
$0a:f5b6  bf fb df f8   lda $f8dffb,x
$0a:f5ba  9c 4e 64	  stz $644e
$0a:f5bd  00 fe		 brk #$fe
$0a:f5bf  1e 88 07	  asl $0788,x
$0a:f5c2  81 08		 sta ($08,x)
$0a:f5c4  3c 08 06	  bit $0608,x
$0a:f5c7  02 01		 cop #$01
$0a:f5c9  3b			tsc
$0a:f5ca  80 76		 bra $f642
$0a:f5cc  bf 6e 50 d3   lda $d3506e,x
$0a:f5d0  5f eb bd dd   eor $ddbdeb,x
$0a:f5d4  bd 22 03	  lda $0322,x
$0a:f5d7  fe fb 7f	  inc $7ffb,x
$0a:f5da  ec b6 58	  cpx $58b6
$0a:f5dd  23 7c		 and $7c,s
$0a:f5df  14 03		 trb $03
$0a:f5e1  22 50 1b 7c   jsl $7c1b50
$0a:f5e5  33 50		 and ($50,s),y
$0a:f5e7  0f 25 92 23   ora $239225
$0a:f5eb  ae b6 67	  ldx $67b6
$0a:f5ee  e0 d2 79	  cpx #$79d2
$0a:f5f1  9e 7a 99	  stz $997a,x
$0a:f5f4  f3 b9		 sbc ($b9,s),y
$0a:f5f6  e3 63		 sbc $63,s
$0a:f5f8  3a			dec a
$0a:f5f9  68			pla
$0a:f5fa  dc 02 fe	  jml [$fe02]
$0a:f5fd  c0 1f dc	  cpy #$dc1f
$0a:f600  02 c7		 cop #$c7
$0a:f602  00 91		 brk #$91
$0a:f604  b0 0e		 bcs $f614
$0a:f606  6b			rtl
$0a:f607  fc f6 cb	  jsr ($cbf6,x)
$0a:f60a  22 bf ca 2f   jsl $2fcabf
$0a:f60e  f3 6f		 sbc ($6f,s),y
$0a:f610  4e 84 fd	  lsr $fd84
$0a:f613  3f 7f eb 2d   and $2deb7f,x
$0a:f617  9c 7e 11	  stz $117e
$0a:f61a  38			sec
$0a:f61b  00 fc		 brk #$fc
$0a:f61d  07 e1		 ora [$e1]
$0a:f61f  01 72		 ora ($72,x)
$0a:f621  1e 62 01	  asl $0162,x
$0a:f624  09 f9 d4	  ora #$d4f9
$0a:f627  73 5a		 adc ($5a,s),y
$0a:f629  fd b6 a6	  sbc $a6b6,x
$0a:f62c  79 56 ba	  adc $ba56,y
$0a:f62f  52 b5		 eor ($b5)
$0a:f631  7b			tdc
$0a:f632  df b5 5b 53   cmp $535bb5,x
$0a:f636  0c 80 5b	  tsb $5b80
$0a:f639  60			rts
$0a:f63a  14 98		 trb $98
$0a:f63c  07 0e		 ora [$0e]
$0a:f63e  01 8b		 ora ($8b,x)
$0a:f640  80 45		 bra $f687
$0a:f642  14 07		 trb $07
$0a:f644  4b			phk
$0a:f645  ce ff 6c	  dec $6cff
$0a:f648  f1 1a		 sbc ($1a),y
$0a:f64a  ae df 83	  ldx $83df
$0a:f64d  a9 97 d5	  lda #$d597
$0a:f650  ef b1 af 06   sbc $06afb1
$0a:f654  de 94 a5	  dec $a594,x
$0a:f657  0c 54 03	  tsb $0354
$0a:f65a  55 00		 eor $00,x
$0a:f65c  8d 40 2a	  sta $2a40
$0a:f65f  50 0c		 bvc $f66d
$0a:f661  11 00		 ora ($00),y
$0a:f663  14 43		 trb $43
$0a:f665  2f ca 52 34   and $3452ca
$0a:f669  d7 7e		 cmp [$7e],y
$0a:f66b  ec db 23	  cpx $23db
$0a:f66e  6b			rtl
$0a:f66f  cf 45 75 7b   cmp $7b7545
$0a:f673  fd 06 fe	  sbc $fe06,x
$0a:f676  81 40		 sta ($40,x)
$0a:f678  80 54		 bra $f6ce
$0a:f67a  54 43 48	  mvn $48,$43
$0a:f67d  80 0f		 bra $f68e
$0a:f67f  c0 8e 4a	  cpy #$4a8e
$0a:f682  b0 b7		 bcs $f63b
$0a:f684  e8			inx
$0a:f685  2e b2 c8	  rol $c8b2
$0a:f688  55 9e		 eor $9e,x
$0a:f68a  d5 56		 cmp $56,x
$0a:f68c  ca			dex
$0a:f68d  ee f5 f7	  inc $f7f5
$0a:f690  8e 94 b5	  stx $b594
$0a:f693  22 11 08 06   jsl $060811
$0a:f697  4a			lsr a
$0a:f698  01 90		 ora ($90,x)
$0a:f69a  80 60		 bra $f6fc
$0a:f69c  49 46 a0	  eor #$a046
$0a:f69f  2f b4 3b d7   and $d73bb4
$0a:f6a3  1c df 50	  trb $50df
$0a:f6a6  7e b2 b3	  ror $b3b2,x
$0a:f6a9  98			tya
$0a:f6aa  7e 60 fe	  ror $fe60,x
$0a:f6ad  28			plp
$0a:f6ae  f7 66		 sbc [$66],y
$0a:f6b0  54 e7 04	  mvn $04,$e7
$0a:f6b3  04 39		 tsb $39
$0a:f6b5  c1 3e		 cmp ($3e,x)
$0a:f6b7  16 7f		 asl $7f,x
$0a:f6b9  c7 4e		 cmp [$4e]
$0a:f6bb  69 95 f7	  adc #$f795
$0a:f6be  4a			lsr a
$0a:f6bf  e7 9b		 sbc [$9b]
$0a:f6c1  5a			phy
$0a:f6c2  76 36		 ror $36,x
$0a:f6c4  e5 e7		 sbc $e7
$0a:f6c6  bc 77 67	  ldy $6777,x
$0a:f6c9  44 d0 84	  mvp $84,$d0
$0a:f6cc  13 42		 ora ($42,s),y
$0a:f6ce  01 c0		 ora ($c0,x)
$0a:f6d0  51 0a		 eor ($0a),y
$0a:f6d2  99 24 59	  sta $5924,y
$0a:f6d5  7b			tdc
$0a:f6d6  57 56		 eor [$56],y
$0a:f6d8  81 f7		 sta ($f7,x)
$0a:f6da  95 e5		 sta $e5,x
$0a:f6dc  ec 5d d9	  cpx $d95d
$0a:f6df  26 6e		 rol $6e
$0a:f6e1  bb			tyx
$0a:f6e2  c0 9b 7d	  cpy #$7d9b
$0a:f6e5  2f f0 09 fb   and $fb09f0
$0a:f6e9  00 57		 brk #$57
$0a:f6eb  e4 bf		 cpx $bf
$0a:f6ed  28			plp
$0a:f6ee  5c 02 05 fc   jml $fc0502
$0a:f6f2  a9 7f 2b	  lda #$2b7f
$0a:f6f5  bb			tyx
$0a:f6f6  7f 97 f2 09   adc $09f297,x
$0a:f6fa  fe ce ff	  inc $ffce,x
$0a:f6fd  ed 10 5a	  sbc $5a10
$0a:f700  bd 5c ba	  lda $ba5c,x
$0a:f703  05 d0		 ora $d0
$0a:f705  ff 38 02 40   sbc $400238,x
$0a:f709  e1 16		 sbc ($16,x)
$0a:f70b  b8			clv
$0a:f70c  40			rti
$0a:f70d  35 10		 and $10,x
$0a:f70f  0d 85 27	  ora $2785
$0a:f712  ed 23 ee	  sbc $ee23
$0a:f715  48			pha
$0a:f716  b2 b2		 lda ($b2)
$0a:f718  0b			phd
$0a:f719  3e 22 9f	  rol $9f22,x
$0a:f71c  f8			sed
$0a:f71d  b4 fd		 ldy $fd,x
$0a:f71f  bb			tyx
$0a:f720  71 38		 adc ($38),y
$0a:f722  05 7c		 ora $7c
$0a:f724  9c 10 0b	  stz $0b10
$0a:f727  1c 02 d5	  trb $d502
$0a:f72a  00 9c		 brk #$9c
$0a:f72c  09 06 1f	  ora #$1f06
$0a:f72f  60			rts
$0a:f730  83 c0		 sta $c0,s
$0a:f732  63 75		 adc $75,s
$0a:f734  7f 2c 6e 8b   adc $8b6e2c,x
$0a:f738  ab			plb
$0a:f739  82 f8 62	  brl $5a34
$0a:f73c  be 58 5e	  ldx $5e58,y
$0a:f73f  aa			tax
$0a:f740  ed 65 a6	  sbc $a665
$0a:f743  60			rts
$0a:f744  1c 60 e3	  trb $e360
$0a:f747  0f 34 02 ad   ora $ad0234
$0a:f74b  00 8f		 brk #$8f
$0a:f74d  44 2b 90	  mvp $90,$2b
$0a:f750  1f c6 0f e1   ora $e10fc6,x
$0a:f754  c3 93		 cmp $93,s
$0a:f756  62 66 6f	  per $66bf
$0a:f759  50 e8		 bvc $f743
$0a:f75b  c6 b4		 dec $b4
$0a:f75d  71 6c		 adc ($6c),y
$0a:f75f  2c bf 63	  bit $63bf
$0a:f762  04 e1		 tsb $e1
$0a:f764  c2 e3		 rep #$e3
$0a:f766  30 68		 bmi $f7d0
$0a:f768  25 6e		 and $6e
$0a:f76a  1f 50 83 ca   ora $ca8350,x
$0a:f76e  21 36		 and ($36,x)
$0a:f770  68			pla
$0a:f771  05 ce		 ora $ce
$0a:f773  07 78		 ora [$78]
$0a:f775  80 4f		 bra $f7c6
$0a:f777  37 1e		 and [$1e],y
$0a:f779  8f a6 4b 0d   sta $0d4ba6
$0a:f77d  78			sei
$0a:f77e  dd 7d ab	  cmp $ab7d,x
$0a:f781  5e 8f e6	  lsr $e68f,x
$0a:f784  5a			phy
$0a:f785  bd ae 96	  lda $96ae,x
$0a:f788  4c be d1	  jmp $d1be
$0a:f78b  9b			txy
$0a:f78c  67 cf		 adc [$cf]
$0a:f78e  f9 03 fc	  sbc $fc03,y
$0a:f791  41 7e		 eor ($7e,x)
$0a:f793  91 bb		 sta ($bb),y
$0a:f795  47 cf		 eor [$cf]
$0a:f797  e1 07		 sbc ($07,x)
$0a:f799  e0 43 ff	  cpx #$ff43
$0a:f79c  b0 27		 bcs $f7c5
$0a:f79e  18			clc
$0a:f79f  c0 6f d8	  cpy #$d86f
$0a:f7a2  1f fe 01 7e   ora $7e01fe,x
$0a:f7a6  13 ea		 ora ($ea,s),y
$0a:f7a8  0f 7e c1 01   ora $01c17e
$0a:f7ac  80 1f		 bra $f7cd
$0a:f7ae  c1 4c		 cmp ($4c,x)
$0a:f7b0  98			tya
$0a:f7b1  04 41		 tsb $41
$0a:f7b3  f2 7a		 sbc ($7a)
$0a:f7b5  d7 8e		 cmp [$8e],y
$0a:f7b7  2d 1f a9	  and $a91f
$0a:f7ba  0b			phd
$0a:f7bb  ca			dex
$0a:f7bc  72 aa		 adc ($aa)
$0a:f7be  bb			tyx
$0a:f7bf  0b			phd
$0a:f7c0  2e be d9	  rol $d9be
$0a:f7c3  d1 9e		 cmp ($9e),y
$0a:f7c5  02 02		 cop #$02
$0a:f7c7  74 a0		 stz $a0,x
$0a:f7c9  1b			tcs
$0a:f7ca  d2 80		 cmp ($80)
$0a:f7cc  41 41		 eor ($41,x)
$0a:f7ce  12 67		 ora ($67)
$0a:f7d0  04 03		 tsb $03
$0a:f7d2  59 47 fc	  eor $fc47,y
$0a:f7d5  d4 b0		 pei ($b0)
$0a:f7d7  f2 6d		 sbc ($6d)
$0a:f7d9  6c 1b 6b	  jmp ($6b1b)
$0a:f7dc  16 f7		 asl $f7,x
$0a:f7de  d7 31		 cmp [$31],y
$0a:f7e0  73 cf		 adc ($cf,s),y
$0a:f7e2  bd 22 31	  lda $3122,x
$0a:f7e5  00 86		 brk #$86
$0a:f7e7  40			rti
$0a:f7e8  2b			pld
$0a:f7e9  0c 21 a4	  tsb $a421
$0a:f7ec  21 46		 and ($46,x)
$0a:f7ee  80 85		 bra $f775
$0a:f7f0  13 c8		 ora ($c8,s),y
$0a:f7f2  1d c7 00	  ora $00c7,x
$0a:f7f5  e7 18		 sbc [$18]
$0a:f7f7  09 cc 0e	  ora #$0ecc
$0a:f7fa  61 fc		 adc ($fc,x)
$0a:f7fc  81 22		 sta ($22,x)
$0a:f7fe  41 c1		 eor ($c1,x)
$0a:f800  47 f0		 eor [$f0]
$0a:f802  c2 7f		 rep #$7f
$0a:f804  eb			xba
$0a:f805  79 f9 3e	  adc $3ef9,y
$0a:f808  1e 35 85	  asl $8535,x
$0a:f80b  a9 f3 e8	  lda #$e8f3
$0a:f80e  fc f8 be	  jsr ($bef8,x)
$0a:f811  3e 8d cf	  rol $cf8d,x
$0a:f814  42 85		 wdm #$85
$0a:f816  82 00 4c	  brl $4419
$0a:f819  03 c8		 ora $c8,s
$0a:f81b  4f c0 c3 7f   eor $7fc3c0
$0a:f81f  80 cf		 bra $f7f0
$0a:f821  e0 91 2f	  cpx #$2f91
$0a:f824  f7 af		 sbc [$af],y
$0a:f826  d3 bf		 cmp ($bf,s),y
$0a:f828  d8			cld
$0a:f829  d6 74		 dec $74,x
$0a:f82b  b7 5f		 lda [$5f],y
$0a:f82d  cf 4b f1 f5   cmp $f5f14b
$0a:f831  fd ff be	  sbc $beff,x
$0a:f834  10 18		 bpl $f84e
$0a:f836  04 5a		 tsb $5a
$0a:f838  01 4e		 ora ($4e,x)
$0a:f83a  6b			rtl
$0a:f83b  00 90		 brk #$90
$0a:f83d  5a			phy
$0a:f83e  a3 10		 lda $10,s
$0a:f840  ff c4 30 37   sbc $3730c4,x
$0a:f844  fb			xce
$0a:f845  d7 aa		 cmp [$aa],y
$0a:f847  a3 c4		 lda $c4,s
$0a:f849  ae f1 2d	  ldx $2df1
$0a:f84c  7d 9a 6f	  adc $6f9a,x
$0a:f84f  ea			nop
$0a:f850  f7 d2		 sbc [$d2],y
$0a:f852  c3 67		 cmp $67,s
$0a:f854  60			rts
$0a:f855  10 88		 bpl $f7df
$0a:f857  0c 32 57	  tsb $5732
$0a:f85a  1c 84 cf	  trb $cf84
$0a:f85d  a1 84		 lda ($84,x)
$0a:f85f  60			rts
$0a:f860  9f c3 27 b4   sta $b427c3,x
$0a:f864  09 f8 bd	  ora #$bdf8
$0a:f867  b5 79		 lda $79,x
$0a:f869  88			dey
$0a:f86a  6d eb b7	  adc $b7eb
$0a:f86d  52 d3		 eor ($d3)
$0a:f86f  0f 9b 7d 0d   ora $0d7d9b
$0a:f873  ff 63 4d 03   sbc $034d63,x
$0a:f877  c1 ff		 cmp ($ff,x)
$0a:f879  79 7c ba	  adc $ba7c,y
$0a:f87c  ac a7 07	  ldy $07a7
$0a:f87f  7d d8 df	  adc $dfd8,x
$0a:f882  74 37		 stz $37,x
$0a:f884  d1 9b		 cmp ($9b),y
$0a:f886  b7 4f		 lda [$4f],y
$0a:f888  6d 48 9b	  adc $9b48
$0a:f88b  2a			rol a
$0a:f88c  41 9e		 eor ($9e,x)
$0a:f88e  08			php
$0a:f88f  11 88		 ora ($88),y
$0a:f891  33 c5		 and ($c5,s),y
$0a:f893  9c 50 0b	  stz $0b50
$0a:f896  25 92		 and $92
$0a:f898  d5 94		 cmp $94,x
$0a:f89a  80 87		 bra $f823
$0a:f89c  43 fd		 eor $fd,s
$0a:f89e  18			clc
$0a:f89f  f3 50		 sbc ($50,s),y
$0a:f8a1  76 d4		 ror $d4,x
$0a:f8a3  3f b6 02 ed   and $ed02b6,x
$0a:f8a7  9b			txy
$0a:f8a8  14 0a		 trb $0a
$0a:f8aa  84 78		 sty $78
$0a:f8ac  0a			asl a
$0a:f8ad  13 14		 ora ($14,s),y
$0a:f8af  0e b6 85	  asl $85b6
$0a:f8b2  d1 84		 cmp ($84),y
$0a:f8b4  6b			rtl
$0a:f8b5  e0 1b 68	  cpx #$681b
$0a:f8b8  17 56		 ora [$56],y
$0a:f8ba  45 a8		 eor $a8
$0a:f8bc  b2 fd		 lda ($fd)
$0a:f8be  e8			inx
$0a:f8bf  18			clc
$0a:f8c0  aa			tax
$0a:f8c1  9c 02 3f	  stz $3f02
$0a:f8c4  00 9f		 brk #$9f
$0a:f8c6  00 86		 brk #$86
$0a:f8c8  d7 00		 cmp [$00],y
$0a:f8ca  b7 81		 lda [$81],y
$0a:f8cc  06 f3		 asl $f3
$0a:f8ce  00 bb		 brk #$bb
$0a:f8d0  ec 28 f8	  cpx $f828
$0a:f8d3  e8			inx
$0a:f8d4  97 c6		 sta [$c6],y
$0a:f8d6  0b			phd
$0a:f8d7  0e 80 d2	  asl $d280
$0a:f8da  bc b1 c8	  ldy $c8b1,x
$0a:f8dd  bd d7 11	  lda $11d7,x
$0a:f8e0  da			phx
$0a:f8e1  e5 c0		 sbc $c0
$0a:f8e3  3f 10 10 18   and $181010,x
$0a:f8e7  47 a8		 eor [$a8]
$0a:f8e9  1f 68 07 db   ora $db0768,x
$0a:f8ed  41 fe		 eor ($fe,x)
$0a:f8ef  81 67		 sta ($67,x)
$0a:f8f1  a0 1e ec	  ldy #$ec1e
$0a:f8f4  5d c3 4b	  eor $4bc3,x
$0a:f8f7  40			rti
$0a:f8f8  e5 c4		 sbc $c4
$0a:f8fa  33 f2		 and ($f2,s),y
$0a:f8fc  0e 4c 13	  asl $134c
$0a:f8ff  6b			rtl
$0a:f900  43 cc		 eor $cc,s
$0a:f902  d1 ba		 cmp ($ba),y
$0a:f904  b4 48		 ldy $48,x
$0a:f906  04 12		 tsb $12
$0a:f908  01 1b		 ora ($1b,x)
$0a:f90a  60			rts
$0a:f90b  8d 91 04	  sta $0491
$0a:f90e  2c 80 b3	  bit $b380
$0a:f911  c0 2d d1	  cpy #$d12d
$0a:f914  a8			tay
$0a:f915  35 6e		 and $6e,x
$0a:f917  43 25		 eor $25,s
$0a:f919  ac d4 7b	  ldy $7bd4
$0a:f91c  bb			tyx
$0a:f91d  bc 6d 57	  ldy $576d,x
$0a:f920  bf 4b be cb   lda $cbbe4b,x
$0a:f924  65 70		 adc $70
$0a:f926  1f 04 03 f9   ora $f90304,x
$0a:f92a  00 ff		 brk #$ff
$0a:f92c  48			pha
$0a:f92d  3f d7 01 20   and $2001d7,x
$0a:f931  e0 3f d5	  cpx #$d53f
$0a:f934  0f f5 b7 db   ora $dbb7f5
$0a:f938  a6 cc		 ldx $cc
$0a:f93a  f0 37		 beq $f973
$0a:f93c  fc 9d 87	  jsr ($879d,x)
$0a:f93f  5f 5f 0b b6   eor $b60b5f,x
$0a:f943  73 35		 adc ($35,s),y
$0a:f945  15 d9		 ora $d9,x
$0a:f947  4c 49 00	  jmp $0049
$0a:f94a  88			dey
$0a:f94b  20 82 23	  jsr $2382
$0a:f94e  41 94		 eor ($94,x)
$0a:f950  1f e4 70 59   ora $5970e4,x
$0a:f954  52 25		 eor ($25)
$0a:f956  60			rts
$0a:f957  8f 56 3d dd   sta $dd3d56
$0a:f95b  18			clc
$0a:f95c  74 ee		 stz $ee,x
$0a:f95e  5d d8 f7	  eor $f7d8,x
$0a:f961  66 95		 ror $95
$0a:f963  0a			asl a
$0a:f964  a1 2e		 lda ($2e,x)
$0a:f966  fa			plx
$0a:f967  fc 6a bc	  jsr ($bc6a,x)
$0a:f96a  09 be df	  ora #$dfbe
$0a:f96d  df 7f 89 7f   cmp $7f897f,x
$0a:f971  f8			sed
$0a:f972  b7 fd		 lda [$fd],y
$0a:f974  25 6f		 and $6f
$0a:f976  d7 14		 cmp [$14],y
$0a:f978  eb			xba
$0a:f979  d4 a7		 pei ($a7)
$0a:f97b  f0 0a		 beq $f987
$0a:f97d  44 01 05	  mvp $05,$01
$0a:f980  12 c8		 ora ($c8)
$0a:f982  07 52		 ora [$52]
$0a:f984  0b			phd
$0a:f985  9b			txy
$0a:f986  cd 6f 3f	  cmp $3f6f
$0a:f989  fe ef ee	  inc $eeef,x
$0a:f98c  4f fb 05 fd   eor $fd05fb
$0a:f990  cf 78 78 fc   cmp $fc7878
$0a:f994  1f e8 0a 28   ora $280ae8,x
$0a:f998  28			plp
$0a:f999  b8			clv
$0a:f99a  40			rti
$0a:f99b  37 97		 and [$97],y
$0a:f99d  dc bd fb	  jml [$fbbd]
$0a:f9a0  55 7f		 eor $7f,x
$0a:f9a2  c2 df		 rep #$df
$0a:f9a4  be f0 8d	  ldx $8df0,y
$0a:f9a7  d5 eb		 cmp $eb,x
$0a:f9a9  21 6f		 and ($6f,x)
$0a:f9ab  ec c9 e0	  cpx $e0c9
$0a:f9ae  48			pha
$0a:f9af  27 82		 and [$82]
$0a:f9b1  a0 8f fb	  ldy #$fb8f
$0a:f9b4  f3 d6		 sbc ($d6,s),y
$0a:f9b6  fc eb be	  jsr ($beeb,x)
$0a:f9b9  34 d8		 bit $d8,x
$0a:f9bb  7f e0 3e dc   adc $dc3ee0,x
$0a:f9bf  9d b7 27	  sta $27b7,x
$0a:f9c2  fe 88 a0	  inc $a088,x
$0a:f9c5  a5 04		 lda $04
$0a:f9c7  74 3e		 stz $3e,x
$0a:f9c9  7d 1f 9f	  adc $9f1f,x
$0a:f9cc  26 d7		 rol $d7
$0a:f9ce  da			phx
$0a:f9cf  bc b7 4f	  ldy $4fb7,x
$0a:f9d2  5d 13 bf	  eor $bf13,x
$0a:f9d5  60			rts
$0a:f9d6  ef ce b0 a7   sbc $a7b0ce
$0a:f9da  f0 3f		 beq $fa1b
$0a:f9dc  85 7c		 sta $7c
$0a:f9de  d8			cld
$0a:f9df  26 d0		 rol $d0
$0a:f9e1  7f 91 2c 3c   adc $3c2c91,x
$0a:f9e5  df 8f bf e7   cmp $e7bf8f,x
$0a:f9e9  e7 f9		 sbc [$f9]
$0a:f9eb  9f 76 29 5f   sta $5f2976,x
$0a:f9ef  cc 3d f7	  cpy $f73d
$0a:f9f2  29 ee b3	  and #$b3ee
$0a:f9f5  e6 cc		 inc $cc
$0a:f9f7  21 fe		 and ($fe,x)
$0a:f9f9  88			dey
$0a:f9fa  7f b6 1f f8   adc $f81fb6,x
$0a:f9fe  40			rti
$0a:f9ff  7c 49 03	  jmp ($0349,x)
$0a:fa02  fe 80 66	  inc $6680,x
$0a:fa05  2d 77 3f	  and $3f77
$0a:fa08  2d 73 8b	  and $8b73
$0a:fa0b  6b			rtl
$0a:fa0c  ec 53 7f	  cpx $7f53
$0a:fa0f  57 be		 eor [$be],y
$0a:fa11  95 1f		 sta $1f,x
$0a:fa13  a9 be c0	  lda #$c0be
$0a:fa16  c0 21 f0	  cpy #$f021
$0a:fa19  88			dey
$0a:fa1a  fc 22 7f	  jsr ($7f22,x)
$0a:fa1d  0d 9f 11	  ora $119f
$0a:fa20  4a			lsr a
$0a:fa21  13 3e		 ora ($3e,s),y
$0a:fa23  06 87		 asl $87
$0a:fa25  67 57		 adc [$57]
$0a:fa27  b2 93		 lda ($93)
$0a:fa29  57 68		 eor [$68],y
$0a:fa2b  83 58		 sta $58,s
$0a:fa2d  e0 7b 39	  cpx #$397b
$0a:fa30  3f cc 4f f8   and $f84fcc,x
$0a:fa34  8b			phb
$0a:fa35  19 1f b6	  ora $b61f,y
$0a:fa38  6f ed d8 db   adc $dbd8ed
$0a:fa3c  50 a6		 bvc $f9e4
$0a:fa3e  d9 af 34	  cmp $34af,y
$0a:fa41  0e fd 4d	  asl $4dfd
$0a:fa44  9f 6a b0 00   sta $00b06a,x
$0a:fa48  d0 3f		 bne $fa89
$0a:fa4a  90 7c		 bcc $fac8
$0a:fa4c  10 63		 bpl $fab1
$0a:fa4e  02 42		 cop #$42
$0a:fa50  94 87		 sty $87,x
$0a:fa52  ad 23 fb	  lda $fb23
$0a:fa55  44 3c da	  mvp $da,$3c
$0a:fa58  2a			rol a
$0a:fa59  b5 ca		 lda $ca,x
$0a:fa5b  0d 03 ff	  ora $ff03
$0a:fa5e  5b			tcd
$0a:fa5f  7f d4 a4 20   adc $20a4d4,x
$0a:fa63  a7 dd		 lda [$dd]
$0a:fa65  14 21		 trb $21
$0a:fa67  f0 eb		 beq $fa54
$0a:fa69  c3 75		 cmp $75,s
$0a:fa6b  90 ac		 bcc $fa19
$0a:fa6d  b4 2a		 ldy $2a,x
$0a:fa6f  5f 9b a8 e2   eor $e2a89b,x
$0a:fa73  e9 dc 1b	  sbc #$1bdc
$0a:fa76  2f 8b b5 10   and $10b58b
$0a:fa7a  40			rti
$0a:fa7b  04 05		 tsb $05
$0a:fa7d  80 28		 bra $faa7
$0a:fa7f  01 04		 ora ($04,x)
$0a:fa81  94 7e		 sty $7e,x
$0a:fa83  c1 07		 cmp ($07,x)
$0a:fa85  8a			txa
$0a:fa86  56 fa		 lsr $fa,x
$0a:fa88  b7 2d		 lda [$2d],y
$0a:fa8a  54 46 db	  mvn $db,$46
$0a:fa8d  48			pha
$0a:fa8e  ca			dex
$0a:fa8f  f6 2d		 inc $2d,x
$0a:fa91  39 3d 15	  and $153d,y
$0a:fa94  1a			inc a
$0a:fa95  ab			plb
$0a:fa96  0c d0 7f	  tsb $7fd0
$0a:fa99  b0 1f		 bcs $faba
$0a:fa9b  ee 07 fb	  inc $fb07
$0a:fa9e  20 2d 01	  jsr $012d
$0a:faa1  68			pla
$0a:faa2  7f 20 3f 88   adc $883f20,x
$0a:faa6  1f 83 f7 44   ora $44f783,x
$0a:faaa  cc d0 b5	  cpy $b5d0
$0a:faad  b4 0f		 ldy $0f,x
$0a:faaf  34 c2		 bit $c2,x
$0a:fab1  37 a1		 and [$a1],y
$0a:fab3  a4 64		 ldy $64
$0a:fab5  ed 1c 7e	  sbc $7e1c
$0a:fab8  da			phx
$0a:fab9  f8			sed
$0a:faba  2d d0 0b	  and $0bd0
$0a:fabd  3c 02 f7	  bit $f702,x
$0a:fac0  00 bc		 brk #$bc
$0a:fac2  c0 2e ec	  cpy #$ec2e
$0a:fac5  94 f9		 sty $f9,x
$0a:fac7  cf f9 b3 fb   cmp $fbb3f9
$0a:facb  df f6 8f 38   cmp $388ff6,x
$0a:facf  be d0 75	  ldx $75d0,y
$0a:fad2  7f 18 b7 8b   adc $8bb718,x
$0a:fad6  bb			tyx
$0a:fad7  0c 80 5f	  tsb $5f80
$0a:fada  83 e2		 sta $e2,s
$0a:fadc  e6 17		 inc $17
$0a:fade  08			php
$0a:fadf  3a			dec a
$0a:fae0  53 0b		 eor ($0b,s),y
$0a:fae2  e9 ca fa	  sbc #$faca
$0a:fae5  7b			tdc
$0a:fae6  da			phx
$0a:fae7  ba			tsx
$0a:fae8  94 a7		 sty $a7,x
$0a:faea  45 ff		 eor $ff
$0a:faec  90 57		 bcc $fb45
$0a:faee  f8			sed
$0a:faef  db			stp
$0a:faf0  fa			plx
$0a:faf1  9f 00 40 57   sta $574000,x
$0a:faf5  c8			iny
$0a:faf6  02 14		 cop #$14
$0a:faf8  d8			cld
$0a:faf9  a7 89		 lda [$89]
$0a:fafb  f7 42		 sbc [$42],y
$0a:fafd  fd d1 8f	  sbc $8fd1,x
$0a:fb00  75 aa		 adc $aa,x
$0a:fb02  1d f2 ff	  ora $fff2,x
$0a:fb05  40			rti
$0a:fb06  7f d6 cf f5   adc $f5cfd6,x
$0a:fb0a  26 03		 rol $03
$0a:fb0c  1f 65 81 80   ora $808165,x
$0a:fb10  54 e3 20	  mvn $20,$e3
$0a:fb13  4f 90 90 3a   eor $3a9090
$0a:fb17  72 ed		 adc ($ed)
$0a:fb19  6d b6 a1	  adc $a1b6
$0a:fb1c  d0 a3		 bne $fac1
$0a:fb1e  70 35		 bvs $fb55
$0a:fb20  b7 ff		 lda [$ff],y
$0a:fb22  bc 23 97	  ldy $9723,x
$0a:fb25  3f ef 4f a0   and $a04fef,x
$0a:fb29  10 08		 bpl $fb33
$0a:fb2b  94 02		 sty $02,x
$0a:fb2d  5e c7 14	  lsr $14c7,x
$0a:fb30  32 40		 and ($40)
$0a:fb32  58			cli
$0a:fb33  e1 c0		 sbc ($c0,x)
$0a:fb35  af d8 25 f3   lda $f325d8
$0a:fb39  0c bc 63	  tsb $63bc
$0a:fb3c  d7 fc		 cmp [$fc],y
$0a:fb3e  56 85		 lsr $85,x
$0a:fb40  7f c1 ef f8   adc $f8efc1,x
$0a:fb44  1f c3 01 00   ora $0001c3,x
$0a:fb48  e0 40 3c	  cpx #$3c40
$0a:fb4b  08			php
$0a:fb4c  65 3f		 adc $3f
$0a:fb4e  84 eb		 sty $eb
$0a:fb50  0b			phd
$0a:fb51  60			rts
$0a:fb52  ef d1 3b f1   sbc $f13bd1
$0a:fb56  4c 5d ef	  jmp $ef5d
$0a:fb59  cf 65 e2 d6   cmp $d6e265
$0a:fb5d  f3 f8		 sbc ($f8,s),y
$0a:fb5f  4f f9 2c 81   eor $812cf9
$0a:fb63  40			rti
$0a:fb64  4b			phk
$0a:fb65  08			php
$0a:fb66  fc 06 75	  jsr ($7506,x)
$0a:fb69  00 b0		 brk #$b0
$0a:fb6b  21 86		 and ($86,x)
$0a:fb6d  cf 9b ca 7b   cmp $7bca9b
$0a:fb71  b5 f7		 lda $f7,x
$0a:fb73  da			phx
$0a:fb74  d7 f3		 cmp [$f3],y
$0a:fb76  f3 f5		 sbc ($f5,s),y
$0a:fb78  c3 e2		 cmp $e2,s
$0a:fb7a  7d 7e 98	  adc $987e,x
$0a:fb7d  97 f8		 sta [$f8],y
$0a:fb7f  48			pha
$0a:fb80  06 b2		 asl $b2
$0a:fb82  35 8c		 and $8c,x
$0a:fb84  c0 7e 11	  cpy #$117e
$0a:fb87  64 60		 stz $60
$0a:fb89  c9 b3 1d	  cmp #$1db3
$0a:fb8c  3b			tsc
$0a:fb8d  76 1a		 ror $1a,x
$0a:fb8f  f3 91		 sbc ($91,s),y
$0a:fb91  a0 61 2f	  ldy #$2f61
$0a:fb94  38			sec
$0a:fb95  8a			txa
$0a:fb96  0c 17 f3	  tsb $f317
$0a:fb99  18			clc
$0a:fb9a  e0 92 43	  cpx #$4392
$0a:fb9d  02 00		 cop #$00
$0a:fb9f  09 e6 06	  ora #$06e6
$0a:fba2  5d 81 9f	  eor $9f81,x
$0a:fba5  60			rts
$0a:fba6  66 c0		 ror $c0
$0a:fba8  71 93		 adc ($93),y
$0a:fbaa  59 31 38	  eor $3831,y
$0a:fbad  3a			dec a
$0a:fbae  ac 17 57	  ldy $5717
$0a:fbb1  03 a8		 ora $a8,s
$0a:fbb3  fa			plx
$0a:fbb4  76 73		 ror $73,x
$0a:fbb6  1a			inc a
$0a:fbb7  9c 6f 57	  stz $576f
$0a:fbba  0d 8b 9b	  ora $9b8b
$0a:fbbd  41 92		 eor ($92,x)
$0a:fbbf  17 2c		 ora [$2c],y
$0a:fbc1  07 8a		 ora [$8a]
$0a:fbc3  19 c2 8e	  ora $8ec2,y
$0a:fbc6  09 42 e5	  ora #$e542
$0a:fbc9  84 9d		 sty $9d
$0a:fbcb  70 31		 bvs $fbfe
$0a:fbcd  26 d0		 rol $d0
$0a:fbcf  80 50		 bra $fc21
$0a:fbd1  a0 1e 7c	  ldy #$7c1e
$0a:fbd4  cf 6f 03 e7   cmp $e7036f
$0a:fbd8  c0 fb bf	  cpy #$bffb
$0a:fbdb  e9 90 1e	  sbc #$1e90
$0a:fbde  90 0c		 bcc $fbec
$0a:fbe0  20 04 42	  jsr $4204
$0a:fbe3  8c 21 8a	  sty $8a21
$0a:fbe6  b7 fd		 lda [$fd],y
$0a:fbe8  46 04		 lsr $04
$0a:fbea  12 03		 ora ($03)
$0a:fbec  0e f9 fd	  asl $fdf9
$0a:fbef  a0 70 e8	  ldy #$e870
$0a:fbf2  1f 77 fc 99   ora $99fc77,x
$0a:fbf6  00 f8		 brk #$f8
$0a:fbf8  07 c2		 ora [$c2]
$0a:fbfa  05 f8		 ora $f8
$0a:fbfc  80 19		 bra $fc17
$0a:fbfe  09 3c 27	  ora #$273c
$0a:fc01  f0 b4		 beq $fbb7
$0a:fc03  fa			plx
$0a:fc04  78			sei
$0a:fc05  1b			tcs
$0a:fc06  fe 46 df	  inc $df46,x
$0a:fc09  ab			plb
$0a:fc0a  bf a4 70 28   lda $2870a4,x
$0a:fc0e  1c 03 78	  trb $7803
$0a:fc11  50 37		 bvc $fc4a
$0a:fc13  ee b0 5f	  inc $5fb0
$0a:fc16  82 04 98	  brl $941d
$0a:fc19  24 eb		 bit $eb
$0a:fc1b  03 60		 ora $60,s
$0a:fc1d  68			pla
$0a:fc1e  74 30		 stz $30,x
$0a:fc20  9f b5 07 7d   sta $7d07b5,x
$0a:fc24  da			phx
$0a:fc25  ff e1 5d 83   sbc $835de1,x
$0a:fc29  32 99		 and ($99)
$0a:fc2b  62 6f f5	  per $f19d
$0a:fc2e  e1 f1		 sbc ($f1,x)
$0a:fc30  8f 53 9a 6c   sta $6c9a53
$0a:fc34  19 57 8e	  ora $8e57,y
$0a:fc37  ab			plb
$0a:fc38  c9 83 f6	  cmp #$f683
$0a:fc3b  d6 21		 dec $21,x
$0a:fc3d  14 e4		 trb $e4
$0a:fc3f  cd fd 7c	  cmp $7cfd
$0a:fc42  9a			txs
$0a:fc43  4a			lsr a
$0a:fc44  c4 23		 cpy $23
$0a:fc46  90 09		 bcc $fc51
$0a:fc48  f1 14		 sbc ($14),y
$0a:fc4a  58			cli
$0a:fc4b  20 c1 05	  jsr $05c1
$0a:fc4e  f8			sed
$0a:fc4f  4d 98 03	  eor $0398
$0a:fc52  49 80 72	  eor #$7280
$0a:fc55  26 f9		 rol $f9
$0a:fc57  2c 96 03	  bit $0396
$0a:fc5a  ff 7f ff d7   sbc $d7ff7f,x
$0a:fc5e  60			rts
$0a:fc5f  1a			inc a
$0a:fc60  bd dd db	  lda $dbdd,x
$0a:fc63  12 3d		 ora ($3d)
$0a:fc65  2b			pld
$0a:fc66  69 ac 87	  adc #$87ac
$0a:fc69  c3 44		 cmp $44,s
$0a:fc6b  36 0f		 rol $0f,x
$0a:fc6d  b3 d9		 lda ($d9,s),y
$0a:fc6f  6d 89 4e	  adc $4e89
$0a:fc72  ef fd 2d 6e   sbc $6e2dfd
$0a:fc76  f7 05		 sbc [$05],y
$0a:fc78  17 c4		 ora [$c4],y
$0a:fc7a  5a			phy
$0a:fc7b  bc 53 6f	  ldy $6f53,x
$0a:fc7e  fc 4c 7c	  jsr ($7c4c,x)
$0a:fc81  51 14		 eor ($14),y
$0a:fc83  0a			asl a
$0a:fc84  47 4d		 eor [$4d]
$0a:fc86  83 d5		 sta $d5,s
$0a:fc88  ea			nop
$0a:fc89  ec a9 9d	  cpx $9da9
$0a:fc8c  ef f5 57 5f   sbc $5f57f5
$0a:fc90  bf a2 da 72   lda $72daa2,x
$0a:fc94  b1 68		 lda ($68),y
$0a:fc96  1e eb f7	  asl $f7eb,x
$0a:fc99  2a			rol a
$0a:fc9a  1f 16 33 fd   ora $fd3316,x
$0a:fc9e  04 2f		 tsb $2f
$0a:fca0  97 f2		 sta [$f2],y
$0a:fca2  01 04		 ora ($04,x)
$0a:fca4  60			rts
$0a:fca5  07 fe		 ora [$fe]
$0a:fca7  ee b6 0d	  inc $0db6
$0a:fcaa  f4 f7 3f	  pea $3ff7
$0a:fcad  4c ff 47	  jmp $47ff
$0a:fcb0  b7 95		 lda [$95],y
$0a:fcb2  cf f4 67 7e   cmp $7e67f4
$0a:fcb6  6c 06 08	  jmp ($0806)
$0a:fcb9  21 42		 and ($42,x)
$0a:fcbb  fc 86 14	  jsr ($1486,x)
$0a:fcbe  29 11 42	  and #$4211
$0a:fcc1  3b			tsc
$0a:fcc2  bf 9e 67 aa   lda $aa679e,x
$0a:fcc6  9f ea ef fe   sta $feefea,x
$0a:fcca  25 ae		 and $ae
$0a:fccc  9b			txy
$0a:fccd  60			rts
$0a:fcce  2f bf c8 0f   and $0fc8bf
$0a:fcd2  fc 8a 08	  jsr ($088a,x)
$0a:fcd5  52 20		 eor ($20)
$0a:fcd7  92 14		 sta ($14)
$0a:fcd9  20 6a c1	  jsr $c16a
$0a:fcdc  f4 4e 14	  pea $144e
$0a:fcdf  e1 ed		 sbc ($ed,x)
$0a:fce1  89 7c 21	  bit #$217c
$0a:fce4  fe b8 fa	  inc $fab8,x
$0a:fce7  9c 3e b0	  stz $b03e
$0a:fcea  af 8c 3e 0e   lda $0e3e8c
$0a:fcee  e4 34		 cpx $34
$0a:fcf0  04 65		 tsb $65
$0a:fcf2  e3 0a		 sbc $0a,s
$0a:fcf4  70 97		 bvs $fc8d
$0a:fcf6  f4 3a fa	  pea $fa3a
$0a:fcf9  89 7c c0	  bit #$c07c
$0a:fcfc  42 16		 wdm #$16
$0a:fcfe  fc 85 bf	  jsr ($bf85,x)
$0a:fd01  e1 e0		 sbc ($e0,x)
$0a:fd03  40			rti
$0a:fd04  2f 01 00 b4   and $b40001
$0a:fd08  ae 65 27	  ldx $2765
$0a:fd0b  9d 2c d5	  sta $d52c,x
$0a:fd0e  5a			phy
$0a:fd0f  3d d7 df	  and $dfd7,x
$0a:fd12  7d 3b a9	  adc $a93b,x
$0a:fd15  64 ef		 stz $ef
$0a:fd17  4d f1 44	  eor $44f1
$0a:fd1a  70 23		 bvs $fd3f
$0a:fd1c  85 7e		 sta $7e
$0a:fd1e  11 1f		 ora ($1f),y
$0a:fd20  84 47		 sty $47
$0a:fd22  8c 41 04	  sty $0441
$0a:fd25  23 96		 and $96,s
$0a:fd27  0b			phd
$0a:fd28  fd 5a cc	  sbc $cc5a,x
$0a:fd2b  4b			phk
$0a:fd2c  70 51		 bvs $fd7f
$0a:fd2e  bc 25 53	  ldy $5325,x
$0a:fd31  95 40		 sta $40,x
$0a:fd33  e7 47		 sbc [$47]
$0a:fd35  71 4d		 adc ($4d),y
$0a:fd37  90 80		 bcc $fcb9
$0a:fd39  c0 2c e0	  cpy #$e02c
$0a:fd3c  63 5f		 adc $5f,s
$0a:fd3e  91 84		 sta ($84),y
$0a:fd40  84 04		 sty $04
$0a:fd42  ef a7 f7 69   sbc $69f7a7
$0a:fd46  ac 16 ee	  ldy $ee16
$0a:fd49  14 4f		 trb $4f
$0a:fd4b  91 d5		 sta ($d5),y
$0a:fd4d  a1 49		 lda ($49,x)
$0a:fd4f  7c b5 bf	  jmp ($bfb5,x)
$0a:fd52  fd 13 77	  sbc $7713,x
$0a:fd55  b3 a6		 lda ($a6,s),y
$0a:fd57  47 e0		 eor [$e0]
$0a:fd59  13 d7		 ora ($d7,s),y
$0a:fd5b  31 c6		 and ($c6),y
$0a:fd5d  90 0b		 bcc $fd6a
$0a:fd5f  7c 80 da	  jmp ($da80,x)
$0a:fd62  30 bd		 bmi $fd21
$0a:fd64  7a			ply
$0a:fd65  6d 73 ff	  adc $ff73
$0a:fd68  ab			plb
$0a:fd69  c2 da		 rep #$da
$0a:fd6b  7f 33 6e fe   adc $fe6e33,x
$0a:fd6f  d6 97		 dec $97,x
$0a:fd71  fe 80 0f	  inc $0f80,x
$0a:fd74  c3 7c		 cmp $7c,s
$0a:fd76  40			rti
$0a:fd77  12 f8		 ora ($f8)
$0a:fd79  41 90		 eor ($90,x)
$0a:fd7b  07 5a		 ora [$5a]
$0a:fd7d  d2 eb		 cmp ($eb)
$0a:fd7f  ff fb bf fd   sbc $fdbffb,x
$0a:fd83  46 5d		 lsr $5d
$0a:fd85  cd e4 4d	  cmp $4de4
$0a:fd88  76 f2		 ror $f2,x
$0a:fd8a  cf ee d2 96   cmp $96d2ee
$0a:fd8e  e3 27		 sbc $27,s
$0a:fd90  58			cli
$0a:fd91  1e 42 6f	  asl $6f42,x
$0a:fd94  00 a4		 brk #$a4
$0a:fd96  40			rti
$0a:fd97  20 48 01	  jsr $0148
$0a:fd9a  a6 43		 ldx $43
$0a:fd9c  e5 fc		 sbc $fc
$0a:fd9e  6c 9f 8a	  jmp ($8a9f)
$0a:fda1  9b			txy
$0a:fda2  b1 d5		 lda ($d5),y
$0a:fda4  e8			inx
$0a:fda5  ad 76 ea	  lda $ea76
$0a:fda8  cf ea d3 96   cmp $96d3ea
$0a:fdac  f8			sed
$0a:fdad  40			rti
$0a:fdae  3f 10 0f e1   and $e10f10,x
$0a:fdb2  00 6b		 brk #$6b
$0a:fdb4  90 0c		 bcc $fdc2
$0a:fdb6  84 02		 sty $02
$0a:fdb8  08			php
$0a:fdb9  a0 54 97	  ldy #$9754
$0a:fdbc  a8			tay
$0a:fdbd  fd 69 eb	  sbc $eb69,x
$0a:fdc0  e7 bf		 sbc [$bf]
$0a:fdc2  e0 38 13	  cpx #$1338
$0a:fdc5  fd bd df	  sbc $dfbd,x
$0a:fdc8  83 7f		 sta $7f,s
$0a:fdca  cf 4f 9a e1   cmp $e19a4f
$0a:fdce  80 9f		 bra $fd6f
$0a:fdd0  35 42		 and $42,x
$0a:fdd2  ff ff e0 7f   sbc $7fe0ff,x
$0a:fdd6  f1 1f		 sbc ($1f),y
$0a:fdd8  fd f3 f9	  sbc $f9f3,x
$0a:fddb  5c a1 c0 bf   jml $bfc0a1
$0a:fddf  f9 6c bf	  sbc $bf6c,y
$0a:fde2  c8			iny
$0a:fde3  16 e6		 asl $e6,x
$0a:fde5  77 c2		 adc [$c2],y
$0a:fde7  bf bb c3 24   lda $24c3bb,x
$0a:fdeb  de 0c 06	  dec $060c,x
$0a:fdee  03 ff		 ora $ff,s
$0a:fdf0  9a			txs
$0a:fdf1  ff ff 7f fc   sbc $fc7fff,x
$0a:fdf5  4f fe f3 ff   eor $fff3fe
$0a:fdf9  bf ff bf c1   lda $c1bfff,x
$0a:fdfd  be 0f d1	  ldx $d10f,y
$0a:fe00  bf f7 6f f8   lda $f86ff7,x
$0a:fe04  18			clc
$0a:fe05  0e f2 85	  asl $85f2
$0a:fe08  d7 94		 cmp [$94],y
$0a:fe0a  6f e8 01 b0   adc $b001e8
$0a:fe0e  6f 83 94 1c   adc $1c9483
$0a:fe12  a1 fe		 lda ($fe,x)
$0a:fe14  ff ef 7f fd   sbc $fd7fef,x
$0a:fe18  70 40		 bvs $fe5a
$0a:fe1a  82 43 f7	  brl $f560
$0a:fe1d  44 fa 52	  mvp $52,$fa
$0a:fe20  fc 15 fd	  jsr ($fd15,x)
$0a:fe23  4c af 95	  jmp $95af
$0a:fe26  7e 7c a0	  ror $a07c,x
$0a:fe29  ac 81 21	  ldy $2181
$0a:fe2c  d4 13		 pei ($13)
$0a:fe2e  08			php
$0a:fe2f  25 2f		 and $2f
$0a:fe31  d8			cld
$0a:fe32  1e 0d fb	  asl $fb0d,x
$0a:fe35  25 73		 and $73
$0a:fe37  d0 df		 bne $fe18
$0a:fe39  f1 b5		 sbc ($b5),y
$0a:fe3b  3c 65 48	  bit $4865,x
$0a:fe3e  aa			tax
$0a:fe3f  15 ad		 ora $ad,x
$0a:fe41  d5 fb		 cmp $fb,x
$0a:fe43  ff 81 ff e3   sbc $e3ff81,x
$0a:fe47  01 43		 ora ($43,x)
$0a:fe49  ac ff eb	  ldy $ebff
$0a:fe4c  41 43		 eor ($43,x)
$0a:fe4e  45 ff		 eor $ff
$0a:fe50  db			stp
$0a:fe51  f6 1b		 inc $1b,x
$0a:fe53  3a			dec a
$0a:fe54  77 33		 adc [$33],y
$0a:fe56  7b			tdc
$0a:fe57  53 d9		 eor ($d9,s),y
$0a:fe59  6a			ror a
$0a:fe5a  6d fa 6b	  adc $6bfa
$0a:fe5d  77 56		 adc [$56],y
$0a:fe5f  b9 db 94	  lda $94db,y
$0a:fe62  53 ff		 eor ($ff,s),y
$0a:fe64  fb			xce
$0a:fe65  1f fd 0b ff   ora $ff0bfd,x
$0a:fe69  4d ff e4	  eor $e4ff
$0a:fe6c  7f d9 6f ce   adc $ce6fd9,x
$0a:fe70  93 f7		 sta ($f7,s),y
$0a:fe72  d8			cld
$0a:fe73  fb			xce
$0a:fe74  e0 6f d5	  cpx #$d56f
$0a:fe77  3f 9c 73 c5   and $c5739c,x
$0a:fe7b  6e ef ce	  ror $ceef
$0a:fe7e  33 13		 and ($13,s),y
$0a:fe80  2c b5 57	  bit $57b5
$0a:fe83  eb			xba
$0a:fe84  c2 a9		 rep #$a9
$0a:fe86  f0 cc		 beq $fe54
$0a:fe88  43 3f		 eor $3f,s
$0a:fe8a  ff c8 3f f6   sbc $f63fc8,x
$0a:fe8e  7f fd a7 ff   adc $ffa7fd,x
$0a:fe92  aa			tax
$0a:fe93  33 0e		 and ($0e,s),y
$0a:fe95  0e f9 35	  asl $35f9
$0a:fe98  e5 56		 sbc $56
$0a:fe9a  b6 b5		 ldx $b5,y
$0a:fe9c  5c 5c ab ad   jml $adab5c
$0a:fea0  54 d6 ea	  mvn $ea,$d6
$0a:fea3  6b			rtl
$0a:fea4  5d 39 ac	  eor $ac39,x
$0a:fea7  01 7e		 ora ($7e,x)
$0a:fea9  17 d8		 ora [$d8],y
$0a:feab  05 ee		 ora $ee
$0a:fead  41 77		 eor ($77,x)
$0a:feaf  80 db		 bra $fe8c
$0a:feb1  e0 55 f8	  cpx #$f855
$0a:feb4  24 fe		 bit $fe
$0a:feb6  11 7f		 ora ($7f),y
$0a:feb8  d6 f4		 dec $f4,x
$0a:feba  ea			nop
$0a:febb  be cd 55	  ldx $55cd,y
$0a:febe  66 ab		 ror $ab
$0a:fec0  ac d4 dd	  ldy $ddd4
$0a:fec3  fa			plx
$0a:fec4  d5 99		 cmp $99,x
$0a:fec6  36 27		 rol $27,x
$0a:fec8  b3 ae		 lda ($ae,s),y
$0a:feca  94 7e		 sty $7e,x
$0a:fecc  20 7e 0c	  jsr $0c7e
$0a:fecf  3f 02 07 80   and $800702,x
$0a:fed3  73 04		 adc ($04,s),y
$0a:fed5  82 01 71	  brl $6fd9
$0a:fed8  80 5c		 bra $ff36
$0a:feda  e0 00 02	  cpx #$0200
$0a:fedd  01 00		 ora ($00,x)
$0a:fedf  02 a9		 cop #$a9
$0a:fee1  67 b6		 adc [$b6]
$0a:fee3  14 5f		 trb $5f
$0a:fee5  35 15		 and $15,x
$0a:fee7  e2 94		 sep #$94
$0a:fee9  59 fc fe	  eor $fefc,y
$0a:feec  8d 52 d3	  sta $d352
$0a:feef  3c 43 d8	  bit $d843,x
$0a:fef2  f4 10 19	  pea $1910
$0a:fef5  51 67		 eor ($67),y
$0a:fef7  de cf 65	  dec $65cf,x
$0a:fefa  4b			phk
$0a:fefb  65 fd		 adc $fd
$0a:fefd  e4 04		 cpx $04
$0a:feff  9a			txs
$0a:ff00  a1 51		 lda ($51,x)
$0a:ff02  c0 fb		 cpy #$fb
$0a:ff04  f5 1a		 sbc $1a,x
$0a:ff06  fe 44 82	  inc $8244,x
$0a:ff09  4d 26 90	  eor $9026
$0a:ff0c  85 5c		 sta $5c
$0a:ff0e  1e 1c 89	  asl $891c,x
$0a:ff11  15 ca		 ora $ca,x
$0a:ff13  e7 23		 sbc [$23]
$0a:ff15  0a			asl a
$0a:ff16  34 9c		 bit $9c,x
$0a:ff18  3e 32 2c	  rol $2c32,x
$0a:ff1b  76 3c		 ror $3c,x
$0a:ff1d  6a			ror a
$0a:ff1e  c1 20		 cmp ($20,x)
$0a:ff20  17 88		 ora [$88],y
$0a:ff22  f4 24 f2	  pea $f224
$0a:ff25  40			rti
$0a:ff26  90 54		 bcc $ff7c
$0a:ff28  eb			xba
$0a:ff29  82 51 11	  brl $107d
$0a:ff2c  00 7c		 brk #$7c
$0a:ff2e  42 49		 wdm #$49
$0a:ff30  54 f7 8d	  mvn $8d,$f7
$0a:ff33  46 45		 lsr $45
$0a:ff35  74 17		 stz $17,x
$0a:ff37  88			dey
$0a:ff38  dd 8a a3	  cmp $a38a,x
$0a:ff3b  22 be 17 dc   jsl $dc17be
$0a:ff3f  70 a6		 bvs $fee7
$0a:ff41  f7 09		 sbc [$09],y
$0a:ff43  28			plp
$0a:ff44  7c 39 4a	  jmp ($4a39,x)
$0a:ff47  19 ee 13	  ora $13ee,y
$0a:ff4a  83 4f		 sta $4f,s
$0a:ff4c  b1 d6		 lda ($d6),y
$0a:ff4e  eb			xba
$0a:ff4f  56 2d		 lsr $2d,x
$0a:ff51  99 cd 13	  sta $13cd,y
$0a:ff54  81 7e		 sta ($7e,x)
$0a:ff56  1a			inc a
$0a:ff57  ad 53 05	  lda $0553
$0a:ff5a  aa			tax
$0a:ff5b  5a			phy
$0a:ff5c  1e 44 01	  asl $0144,x
$0a:ff5f  9f ed ec a3   sta $a3eced,x
$0a:ff63  cf e7 f4 50   cmp $50f4e7
$0a:ff67  40			rti
$0a:ff68  f9 9e 67	  sbc $679e,y
$0a:ff6b  a2 ce		 ldx #$ce
$0a:ff6d  d4 bd		 pei ($bd)
$0a:ff6f  9e c9 f3	  stz $f3c9,x
$0a:ff72  c8			iny
$0a:ff73  bd 80 33	  lda $3380,x
$0a:ff76  d1 69		 cmp ($69),y
$0a:ff78  6a			ror a
$0a:ff79  5e fc 0c	  lsr $0cfc,x
$0a:ff7c  94 aa		 sty $aa,x
$0a:ff7e  28			plp
$0a:ff7f  45 e4		 eor $e4
$0a:ff81  ec ea 41	  cpx $41ea
$0a:ff84  07 2e		 ora [$2e]
$0a:ff86  84 9a		 sty $9a
$0a:ff88  43 c9		 eor $c9,s
$0a:ff8a  d7 6a		 cmp [$6a],y
$0a:ff8c  64 e1		 stz $e1
$0a:ff8e  26 91		 rol $91
$0a:ff90  5d ae f2	  eor $f2ae,x
$0a:ff93  30 e0		 bmi $ff75
$0a:ff95  a1 1e		 lda ($1e,x)
$0a:ff97  45 7e		 eor $7e
$0a:ff99  bf 8e c0 5a   lda $5ac08e,x
$0a:ff9d  02 a0		 cop #$a0
$0a:ff9f  42 05		 wdm #$05
$0a:ffa1  4e b8 50	  lsr $50b8
$0a:ffa4  13 c0		 ora ($c0,s),y
$0a:ffa6  1e 40 38	  asl $3840,x
$0a:ffa9  37 59		 and [$59],y
$0a:ffab  1a			inc a
$0a:ffac  10 2a		 bpl $ffd8
$0a:ffae  9e f3 00	  stz $00f3,x
$0a:ffb1  86 0c		 stx $0c
$0a:ffb3  5a			phy
$0a:ffb4  17 d3		 ora [$d3],y
$0a:ffb6  00 a3		 brk #$a3
$0a:ffb8  40			rti
$0a:ffb9  24 a1		 bit $a1
$0a:ffbb  c1 17		 cmp ($17,x)
$0a:ffbd  b9 a1 50	  lda $50a1,y
$0a:ffc0  32 1a		 and ($1a)
$0a:ffc2  3e af 29	  rol $29af,x
$0a:ffc5  41 3c		 eor ($3c,x)
$0a:ffc7  b3 68		 lda ($68,s),y
$0a:ffc9  72 73		 adc ($73)
$0a:ffcb  1b			tcs
$0a:ffcc  1d 6a c4	  ora $c46a,x
$0a:ffcf  16 4b		 asl $4b,x
$0a:ffd1  99 cf d4	  sta $d4cf,y
$0a:ffd4  b9 3a 0a	  lda $0a3a,y
$0a:ffd7  96 a9		 stx $a9,y
$0a:ffd9  82 0c 26	  brl $25e8
$0a:ffdc  66 03		 ror $03
$0a:ffde  83 5b		 sta $5b,s
$0a:ffe0  be 00 00	  ldx $0000,y
$0a:ffe3  00 33		 brk #$33
$0a:ffe5  7f ff 7f 4a   adc $4a7fff,x
$0a:ffe9  29 00 00	  and #$0000
$0a:ffec  df 22 df 73   cmp $73df22,x
$0a:fff0  4a			lsr a
$0a:fff1  29 00 00	  and #$0000
$0a:fff4  e0 78		 cpx #$78
$0a:fff6  1c 00 4a	  trb $4a00
$0a:fff9  29 00 00	  and #$0000
$0a:fffc  e0 78		 cpx #$78
$0a:fffe  1c 00 58	  trb $5800
