; Soul Blazer (SNES) - Bank $0c
; Disassembled from ROM
; File offset: $060000-$067fff
; CPU address: $0c:$8000-$0c:$ffff
;===========================================================

.bank $0c
.org $8000

$0c:8000  58			cli
$0c:8001  80 62		 bra $8065
$0c:8003  80 6c		 bra $8071
$0c:8005  80 76		 bra $807d
$0c:8007  80 80		 bra $7f89
$0c:8009  80 a2		 bra $7fad
$0c:800b  80 c4		 bra $7fd1
$0c:800d  80 e6		 bra $7ff5
$0c:800f  80 08		 bra $8019
$0c:8011  81 2a		 sta ($2a,x)
$0c:8013  81 4c		 sta ($4c,x)
$0c:8015  81 6e		 sta ($6e,x)
$0c:8017  81 90		 sta ($90,x)
$0c:8019  81 b2		 sta ($b2,x)
$0c:801b  81 d4		 sta ($d4,x)
$0c:801d  81 f6		 sta ($f6,x)
$0c:801f  81 18		 sta ($18,x)
$0c:8021  82 3a 82	  brl $025e
$0c:8024  5c 82 7e 82   jml $827e82
$0c:8028  a0 82		 ldy #$82
$0c:802a  aa			tax
$0c:802b  82 b4 82	  brl $02e2
$0c:802e  be 82 c8	  ldx $c882,y
$0c:8031  82 d2 82	  brl $0306
$0c:8034  dc 82 e6	  jml [$e682]
$0c:8037  82 f0 82	  brl $032a
$0c:803a  fa			plx
$0c:803b  82 04 83	  brl $0342
$0c:803e  0e 83 18	  asl $1883
$0c:8041  83 42		 sta $42,s
$0c:8043  83 6c		 sta $6c,s
$0c:8045  83 96		 sta $96,s
$0c:8047  83 c0		 sta $c0,s
$0c:8049  83 ca		 sta $ca,s
$0c:804b  83 ec		 sta $ec,s
$0c:804d  83 0e		 sta $0e,s
$0c:804f  84 18		 sty $18
$0c:8051  84 3a		 sty $3a
$0c:8053  84 44		 sty $44
$0c:8055  84 66		 sty $66
$0c:8057  84 00		 sty $00
$0c:8059  00 00		 brk #$00
$0c:805b  00 00		 brk #$00
$0c:805d  00 70		 brk #$70
$0c:805f  84 ff		 sty $ff
$0c:8061  ff 00 00 00   sbc $000000,x
$0c:8065  00 00		 brk #$00
$0c:8067  00 93		 brk #$93
$0c:8069  84 ff		 sty $ff
$0c:806b  ff 00 00 00   sbc $000000,x
$0c:806f  00 00		 brk #$00
$0c:8071  00 b6		 brk #$b6
$0c:8073  84 ff		 sty $ff
$0c:8075  ff 00 00 00   sbc $000000,x
$0c:8079  00 00		 brk #$00
$0c:807b  00 d2		 brk #$d2
$0c:807d  84 ff		 sty $ff
$0c:807f  ff 07 00 00   sbc $000007,x
$0c:8083  00 02		 brk #$02
$0c:8085  00 ee		 brk #$ee
$0c:8087  84 03		 sty $03
$0c:8089  00 00		 brk #$00
$0c:808b  00 02		 brk #$02
$0c:808d  00 11		 brk #$11
$0c:808f  85 07		 sta $07
$0c:8091  00 00		 brk #$00
$0c:8093  00 02		 brk #$02
$0c:8095  00 ee		 brk #$ee
$0c:8097  84 03		 sty $03
$0c:8099  00 00		 brk #$00
$0c:809b  00 02		 brk #$02
$0c:809d  00 11		 brk #$11
$0c:809f  85 ff		 sta $ff
$0c:80a1  ff 07 00 00   sbc $000007,x
$0c:80a5  00 fe		 brk #$fe
$0c:80a7  ff ee 84 03   sbc $0384ee,x
$0c:80ab  00 00		 brk #$00
$0c:80ad  00 fe		 brk #$fe
$0c:80af  ff 11 85 07   sbc $078511,x
$0c:80b3  00 00		 brk #$00
$0c:80b5  00 fe		 brk #$fe
$0c:80b7  ff ee 84 03   sbc $0384ee,x
$0c:80bb  00 00		 brk #$00
$0c:80bd  00 fe		 brk #$fe
$0c:80bf  ff 11 85 ff   sbc $ff8511,x
$0c:80c3  ff 07 00 00   sbc $000007,x
$0c:80c7  00 fe		 brk #$fe
$0c:80c9  ff 34 85 03   sbc $038534,x
$0c:80cd  00 00		 brk #$00
$0c:80cf  00 fe		 brk #$fe
$0c:80d1  ff 57 85 07   sbc $078557,x
$0c:80d5  00 00		 brk #$00
$0c:80d7  00 fe		 brk #$fe
$0c:80d9  ff 34 85 03   sbc $038534,x
$0c:80dd  00 00		 brk #$00
$0c:80df  00 fe		 brk #$fe
$0c:80e1  ff 57 85 ff   sbc $ff8557,x
$0c:80e5  ff 07 00 00   sbc $000007,x
$0c:80e9  00 02		 brk #$02
$0c:80eb  00 34		 brk #$34
$0c:80ed  85 03		 sta $03
$0c:80ef  00 00		 brk #$00
$0c:80f1  00 02		 brk #$02
$0c:80f3  00 57		 brk #$57
$0c:80f5  85 07		 sta $07
$0c:80f7  00 00		 brk #$00
$0c:80f9  00 02		 brk #$02
$0c:80fb  00 34		 brk #$34
$0c:80fd  85 03		 sta $03
$0c:80ff  00 00		 brk #$00
$0c:8101  00 02		 brk #$02
$0c:8103  00 57		 brk #$57
$0c:8105  85 ff		 sta $ff
$0c:8107  ff 07 00 fe   sbc $fe0007,x
$0c:810b  ff 00 00 7a   sbc $7a0000,x
$0c:810f  85 03		 sta $03
$0c:8111  00 fe		 brk #$fe
$0c:8113  ff 00 00 96   sbc $960000,x
$0c:8117  85 07		 sta $07
$0c:8119  00 fe		 brk #$fe
$0c:811b  ff 00 00 7a   sbc $7a0000,x
$0c:811f  85 03		 sta $03
$0c:8121  00 fe		 brk #$fe
$0c:8123  ff 00 00 96   sbc $960000,x
$0c:8127  85 ff		 sta $ff
$0c:8129  ff 07 00 02   sbc $020007,x
$0c:812d  00 00		 brk #$00
$0c:812f  00 7a		 brk #$7a
$0c:8131  85 03		 sta $03
$0c:8133  00 02		 brk #$02
$0c:8135  00 00		 brk #$00
$0c:8137  00 96		 brk #$96
$0c:8139  85 07		 sta $07
$0c:813b  00 02		 brk #$02
$0c:813d  00 00		 brk #$00
$0c:813f  00 7a		 brk #$7a
$0c:8141  85 03		 sta $03
$0c:8143  00 02		 brk #$02
$0c:8145  00 00		 brk #$00
$0c:8147  00 96		 brk #$96
$0c:8149  85 ff		 sta $ff
$0c:814b  ff 07 00 02   sbc $020007,x
$0c:814f  00 00		 brk #$00
$0c:8151  00 b2		 brk #$b2
$0c:8153  85 03		 sta $03
$0c:8155  00 02		 brk #$02
$0c:8157  00 00		 brk #$00
$0c:8159  00 ce		 brk #$ce
$0c:815b  85 07		 sta $07
$0c:815d  00 02		 brk #$02
$0c:815f  00 00		 brk #$00
$0c:8161  00 b2		 brk #$b2
$0c:8163  85 03		 sta $03
$0c:8165  00 02		 brk #$02
$0c:8167  00 00		 brk #$00
$0c:8169  00 ce		 brk #$ce
$0c:816b  85 ff		 sta $ff
$0c:816d  ff 07 00 fe   sbc $fe0007,x
$0c:8171  ff 00 00 b2   sbc $b20000,x
$0c:8175  85 03		 sta $03
$0c:8177  00 fe		 brk #$fe
$0c:8179  ff 00 00 ce   sbc $ce0000,x
$0c:817d  85 07		 sta $07
$0c:817f  00 fe		 brk #$fe
$0c:8181  ff 00 00 b2   sbc $b20000,x
$0c:8185  85 03		 sta $03
$0c:8187  00 fe		 brk #$fe
$0c:8189  ff 00 00 ce   sbc $ce0000,x
$0c:818d  85 ff		 sta $ff
$0c:818f  ff 07 00 02   sbc $020007,x
$0c:8193  00 00		 brk #$00
$0c:8195  00 ee		 brk #$ee
$0c:8197  84 03		 sty $03
$0c:8199  00 02		 brk #$02
$0c:819b  00 00		 brk #$00
$0c:819d  00 11		 brk #$11
$0c:819f  85 07		 sta $07
$0c:81a1  00 02		 brk #$02
$0c:81a3  00 00		 brk #$00
$0c:81a5  00 ee		 brk #$ee
$0c:81a7  84 03		 sty $03
$0c:81a9  00 02		 brk #$02
$0c:81ab  00 00		 brk #$00
$0c:81ad  00 11		 brk #$11
$0c:81af  85 ff		 sta $ff
$0c:81b1  ff 07 00 fe   sbc $fe0007,x
$0c:81b5  ff 00 00 ee   sbc $ee0000,x
$0c:81b9  84 03		 sty $03
$0c:81bb  00 fe		 brk #$fe
$0c:81bd  ff 00 00 11   sbc $110000,x
$0c:81c1  85 07		 sta $07
$0c:81c3  00 fe		 brk #$fe
$0c:81c5  ff 00 00 ee   sbc $ee0000,x
$0c:81c9  84 03		 sty $03
$0c:81cb  00 fe		 brk #$fe
$0c:81cd  ff 00 00 11   sbc $110000,x
$0c:81d1  85 ff		 sta $ff
$0c:81d3  ff 07 00 fe   sbc $fe0007,x
$0c:81d7  ff 00 00 34   sbc $340000,x
$0c:81db  85 03		 sta $03
$0c:81dd  00 fe		 brk #$fe
$0c:81df  ff 00 00 57   sbc $570000,x
$0c:81e3  85 07		 sta $07
$0c:81e5  00 fe		 brk #$fe
$0c:81e7  ff 00 00 34   sbc $340000,x
$0c:81eb  85 03		 sta $03
$0c:81ed  00 fe		 brk #$fe
$0c:81ef  ff 00 00 57   sbc $570000,x
$0c:81f3  85 ff		 sta $ff
$0c:81f5  ff 07 00 02   sbc $020007,x
$0c:81f9  00 00		 brk #$00
$0c:81fb  00 34		 brk #$34
$0c:81fd  85 03		 sta $03
$0c:81ff  00 02		 brk #$02
$0c:8201  00 00		 brk #$00
$0c:8203  00 57		 brk #$57
$0c:8205  85 07		 sta $07
$0c:8207  00 02		 brk #$02
$0c:8209  00 00		 brk #$00
$0c:820b  00 34		 brk #$34
$0c:820d  85 03		 sta $03
$0c:820f  00 02		 brk #$02
$0c:8211  00 00		 brk #$00
$0c:8213  00 57		 brk #$57
$0c:8215  85 ff		 sta $ff
$0c:8217  ff 07 00 00   sbc $000007,x
$0c:821b  00 02		 brk #$02
$0c:821d  00 7a		 brk #$7a
$0c:821f  85 03		 sta $03
$0c:8221  00 00		 brk #$00
$0c:8223  00 02		 brk #$02
$0c:8225  00 96		 brk #$96
$0c:8227  85 07		 sta $07
$0c:8229  00 00		 brk #$00
$0c:822b  00 02		 brk #$02
$0c:822d  00 7a		 brk #$7a
$0c:822f  85 03		 sta $03
$0c:8231  00 00		 brk #$00
$0c:8233  00 02		 brk #$02
$0c:8235  00 96		 brk #$96
$0c:8237  85 ff		 sta $ff
$0c:8239  ff 07 00 00   sbc $000007,x
$0c:823d  00 fe		 brk #$fe
$0c:823f  ff 7a 85 03   sbc $03857a,x
$0c:8243  00 00		 brk #$00
$0c:8245  00 fe		 brk #$fe
$0c:8247  ff 96 85 07   sbc $078596,x
$0c:824b  00 00		 brk #$00
$0c:824d  00 fe		 brk #$fe
$0c:824f  ff 7a 85 03   sbc $03857a,x
$0c:8253  00 00		 brk #$00
$0c:8255  00 fe		 brk #$fe
$0c:8257  ff 96 85 ff   sbc $ff8596,x
$0c:825b  ff 07 00 00   sbc $000007,x
$0c:825f  00 fe		 brk #$fe
$0c:8261  ff b2 85 03   sbc $0385b2,x
$0c:8265  00 00		 brk #$00
$0c:8267  00 fe		 brk #$fe
$0c:8269  ff ce 85 07   sbc $0785ce,x
$0c:826d  00 00		 brk #$00
$0c:826f  00 fe		 brk #$fe
$0c:8271  ff b2 85 03   sbc $0385b2,x
$0c:8275  00 00		 brk #$00
$0c:8277  00 fe		 brk #$fe
$0c:8279  ff ce 85 ff   sbc $ff85ce,x
$0c:827d  ff 07 00 00   sbc $000007,x
$0c:8281  00 02		 brk #$02
$0c:8283  00 b2		 brk #$b2
$0c:8285  85 03		 sta $03
$0c:8287  00 00		 brk #$00
$0c:8289  00 02		 brk #$02
$0c:828b  00 ce		 brk #$ce
$0c:828d  85 07		 sta $07
$0c:828f  00 00		 brk #$00
$0c:8291  00 02		 brk #$02
$0c:8293  00 b2		 brk #$b2
$0c:8295  85 03		 sta $03
$0c:8297  00 00		 brk #$00
$0c:8299  00 02		 brk #$02
$0c:829b  00 ce		 brk #$ce
$0c:829d  85 ff		 sta $ff
$0c:829f  ff 3b 00 00   sbc $00003b,x
$0c:82a3  00 00		 brk #$00
$0c:82a5  00 70		 brk #$70
$0c:82a7  84 ff		 sty $ff
$0c:82a9  ff 3b 00 00   sbc $00003b,x
$0c:82ad  00 00		 brk #$00
$0c:82af  00 93		 brk #$93
$0c:82b1  84 ff		 sty $ff
$0c:82b3  ff 3b 00 00   sbc $00003b,x
$0c:82b7  00 00		 brk #$00
$0c:82b9  00 b6		 brk #$b6
$0c:82bb  84 ff		 sty $ff
$0c:82bd  ff 3b 00 00   sbc $00003b,x
$0c:82c1  00 00		 brk #$00
$0c:82c3  00 d2		 brk #$d2
$0c:82c5  84 ff		 sty $ff
$0c:82c7  ff 05 00 00   sbc $000005,x
$0c:82cb  00 00		 brk #$00
$0c:82cd  00 ea		 brk #$ea
$0c:82cf  85 ff		 sta $ff
$0c:82d1  ff 05 00 00   sbc $000005,x
$0c:82d5  00 00		 brk #$00
$0c:82d7  00 ea		 brk #$ea
$0c:82d9  85 ff		 sta $ff
$0c:82db  ff 05 00 00   sbc $000005,x
$0c:82df  00 00		 brk #$00
$0c:82e1  00 ea		 brk #$ea
$0c:82e3  85 ff		 sta $ff
$0c:82e5  ff 05 00 00   sbc $000005,x
$0c:82e9  00 00		 brk #$00
$0c:82eb  00 ea		 brk #$ea
$0c:82ed  85 ff		 sta $ff
$0c:82ef  ff af 00 00   sbc $0000af,x
$0c:82f3  00 00		 brk #$00
$0c:82f5  00 ea		 brk #$ea
$0c:82f7  85 ff		 sta $ff
$0c:82f9  ff af 00 00   sbc $0000af,x
$0c:82fd  00 00		 brk #$00
$0c:82ff  00 ea		 brk #$ea
$0c:8301  85 ff		 sta $ff
$0c:8303  ff af 00 00   sbc $0000af,x
$0c:8307  00 00		 brk #$00
$0c:8309  00 ea		 brk #$ea
$0c:830b  85 ff		 sta $ff
$0c:830d  ff af 00 00   sbc $0000af,x
$0c:8311  00 00		 brk #$00
$0c:8313  00 ea		 brk #$ea
$0c:8315  85 ff		 sta $ff
$0c:8317  ff 03 00 00   sbc $000003,x
$0c:831b  00 00		 brk #$00
$0c:831d  00 ff		 brk #$ff
$0c:831f  85 00		 sta $00
$0c:8321  00 00		 brk #$00
$0c:8323  00 00		 brk #$00
$0c:8325  00 14		 brk #$14
$0c:8327  86 00		 stx $00
$0c:8329  00 00		 brk #$00
$0c:832b  00 00		 brk #$00
$0c:832d  00 37		 brk #$37
$0c:832f  86 00		 stx $00
$0c:8331  00 00		 brk #$00
$0c:8333  00 00		 brk #$00
$0c:8335  00 5a		 brk #$5a
$0c:8337  86 07		 stx $07
$0c:8339  00 00		 brk #$00
$0c:833b  00 00		 brk #$00
$0c:833d  00 8b		 brk #$8b
$0c:833f  86 ff		 stx $ff
$0c:8341  ff 03 00 00   sbc $000003,x
$0c:8345  00 00		 brk #$00
$0c:8347  00 ff		 brk #$ff
$0c:8349  85 00		 sta $00
$0c:834b  00 00		 brk #$00
$0c:834d  00 00		 brk #$00
$0c:834f  00 a7		 brk #$a7
$0c:8351  86 00		 stx $00
$0c:8353  00 00		 brk #$00
$0c:8355  00 00		 brk #$00
$0c:8357  00 ca		 brk #$ca
$0c:8359  86 00		 stx $00
$0c:835b  00 00		 brk #$00
$0c:835d  00 00		 brk #$00
$0c:835f  00 ed		 brk #$ed
$0c:8361  86 07		 stx $07
$0c:8363  00 00		 brk #$00
$0c:8365  00 00		 brk #$00
$0c:8367  00 1e		 brk #$1e
$0c:8369  87 ff		 sta [$ff]
$0c:836b  ff 03 00 00   sbc $000003,x
$0c:836f  00 00		 brk #$00
$0c:8371  00 ff		 brk #$ff
$0c:8373  85 00		 sta $00
$0c:8375  00 00		 brk #$00
$0c:8377  00 00		 brk #$00
$0c:8379  00 48		 brk #$48
$0c:837b  87 00		 sta [$00]
$0c:837d  00 00		 brk #$00
$0c:837f  00 00		 brk #$00
$0c:8381  00 6b		 brk #$6b
$0c:8383  87 00		 sta [$00]
$0c:8385  00 00		 brk #$00
$0c:8387  00 00		 brk #$00
$0c:8389  00 87		 brk #$87
$0c:838b  87 07		 sta [$07]
$0c:838d  00 00		 brk #$00
$0c:838f  00 00		 brk #$00
$0c:8391  00 b1		 brk #$b1
$0c:8393  87 ff		 sta [$ff]
$0c:8395  ff 03 00 00   sbc $000003,x
$0c:8399  00 00		 brk #$00
$0c:839b  00 ff		 brk #$ff
$0c:839d  85 00		 sta $00
$0c:839f  00 00		 brk #$00
$0c:83a1  00 00		 brk #$00
$0c:83a3  00 cd		 brk #$cd
$0c:83a5  87 00		 sta [$00]
$0c:83a7  00 00		 brk #$00
$0c:83a9  00 00		 brk #$00
$0c:83ab  00 f0		 brk #$f0
$0c:83ad  87 00		 sta [$00]
$0c:83af  00 00		 brk #$00
$0c:83b1  00 00		 brk #$00
$0c:83b3  00 0c		 brk #$0c
$0c:83b5  88			dey
$0c:83b6  07 00		 ora [$00]
$0c:83b8  00 00		 brk #$00
$0c:83ba  00 00		 brk #$00
$0c:83bc  36 88		 rol $88,x
$0c:83be  ff ff 00 00   sbc $0000ff,x
$0c:83c2  00 00		 brk #$00
$0c:83c4  00 00		 brk #$00
$0c:83c6  4e 89 ff	  lsr $ff89
$0c:83c9  ff 07 00 02   sbc $020007,x
$0c:83cd  00 00		 brk #$00
$0c:83cf  00 c2		 brk #$c2
$0c:83d1  88			dey
$0c:83d2  03 00		 ora $00,s
$0c:83d4  02 00		 cop #$00
$0c:83d6  00 00		 brk #$00
$0c:83d8  de 88 07	  dec $0788,x
$0c:83db  00 02		 brk #$02
$0c:83dd  00 00		 brk #$00
$0c:83df  00 c2		 brk #$c2
$0c:83e1  88			dey
$0c:83e2  03 00		 ora $00,s
$0c:83e4  02 00		 cop #$00
$0c:83e6  00 00		 brk #$00
$0c:83e8  de 88 ff	  dec $ff88,x
$0c:83eb  ff 07 00 fe   sbc $fe0007,x
$0c:83ef  ff 00 00 16   sbc $160000,x
$0c:83f3  89 03 00	  bit #$0003
$0c:83f6  fe ff 00	  inc $00ff,x
$0c:83f9  00 32		 brk #$32
$0c:83fb  89 07 00	  bit #$0007
$0c:83fe  fe ff 00	  inc $00ff,x
$0c:8401  00 16		 brk #$16
$0c:8403  89 03 00	  bit #$0003
$0c:8406  fe ff 00	  inc $00ff,x
$0c:8409  00 32		 brk #$32
$0c:840b  89 ff ff	  bit #$ffff
$0c:840e  00 00		 brk #$00
$0c:8410  00 00		 brk #$00
$0c:8412  00 00		 brk #$00
$0c:8414  a2 89		 ldx #$89
$0c:8416  ff ff 07 00   sbc $0007ff,x
$0c:841a  00 00		 brk #$00
$0c:841c  02 00		 cop #$00
$0c:841e  6a			ror a
$0c:841f  89 03 00	  bit #$0003
$0c:8422  00 00		 brk #$00
$0c:8424  02 00		 cop #$00
$0c:8426  86 89		 stx $89
$0c:8428  07 00		 ora [$00]
$0c:842a  00 00		 brk #$00
$0c:842c  02 00		 cop #$00
$0c:842e  6a			ror a
$0c:842f  89 03 00	  bit #$0003
$0c:8432  00 00		 brk #$00
$0c:8434  02 00		 cop #$00
$0c:8436  86 89		 stx $89
$0c:8438  ff ff 00 00   sbc $0000ff,x
$0c:843c  00 00		 brk #$00
$0c:843e  00 00		 brk #$00
$0c:8440  a6 88		 ldx $88
$0c:8442  ff ff 07 00   sbc $0007ff,x
$0c:8446  00 00		 brk #$00
$0c:8448  fe ff be	  inc $beff,x
$0c:844b  89 03 00	  bit #$0003
$0c:844e  00 00		 brk #$00
$0c:8450  fe ff da	  inc $daff,x
$0c:8453  89 07 00	  bit #$0007
$0c:8456  00 00		 brk #$00
$0c:8458  fe ff be	  inc $beff,x
$0c:845b  89 03 00	  bit #$0003
$0c:845e  00 00		 brk #$00
$0c:8460  fe ff da	  inc $daff,x
$0c:8463  89 ff ff	  bit #$ffff
$0c:8466  00 00		 brk #$00
$0c:8468  00 00		 brk #$00
$0c:846a  00 00		 brk #$00
$0c:846c  fa			plx
$0c:846d  88			dey
$0c:846e  ff ff fe ff   sbc $fffeff,x
$0c:8472  12 00		 ora ($00)
$0c:8474  0b			phd
$0c:8475  00 06		 brk #$06
$0c:8477  00 08		 brk #$08
$0c:8479  00 08		 brk #$08
$0c:847b  00 03		 brk #$03
$0c:847d  00 00		 brk #$00
$0c:847f  03 05		 ora $05,s
$0c:8481  00 09		 brk #$09
$0c:8483  4a			lsr a
$0c:8484  0c 00 03	  tsb $0300
$0c:8487  05 08		 ora $08
$0c:8489  01 5a		 ora ($5a,x)
$0c:848b  0c 01 00	  tsb $0001
$0c:848e  00 01		 brk #$01
$0c:8490  00 2c		 brk #$2c
$0c:8492  0c ff ff	  tsb $ffff
$0c:8495  11 00		 ora ($00),y
$0c:8497  20 00 f1	  jsr $f100
$0c:849a  ff 08 00 08   sbc $080008,x
$0c:849e  00 03		 brk #$03
$0c:84a0  00 00		 brk #$00
$0c:84a2  02 06		 cop #$06
$0c:84a4  09 00 4a	  ora #$4a00
$0c:84a7  cc 00 02	  cpy $0200
$0c:84aa  06 01		 asl $01
$0c:84ac  08			php
$0c:84ad  5a			phy
$0c:84ae  cc 01 00	  cpy $0001
$0c:84b1  00 00		 brk #$00
$0c:84b3  01 2c		 ora ($2c,x)
$0c:84b5  0c 0a 00	  tsb $000a
$0c:84b8  06 00		 asl $00
$0c:84ba  10 00		 bpl $84bc
$0c:84bc  f8			sed
$0c:84bd  ff 08 00 08   sbc $080008,x
$0c:84c1  00 02		 brk #$02
$0c:84c3  00 00		 brk #$00
$0c:84c5  00 08		 brk #$08
$0c:84c7  00 00		 brk #$00
$0c:84c9  20 0c 00	  jsr $000c
$0c:84cc  08			php
$0c:84cd  00 00		 brk #$00
$0c:84cf  00 21		 brk #$21
$0c:84d1  0c f6 ff	  tsb $fff6
$0c:84d4  1a			inc a
$0c:84d5  00 0f		 brk #$0f
$0c:84d7  00 f9		 brk #$f9
$0c:84d9  ff 08 00 08   sbc $080008,x
$0c:84dd  00 02		 brk #$02
$0c:84df  00 00		 brk #$00
$0c:84e1  00 08		 brk #$08
$0c:84e3  00 00		 brk #$00
$0c:84e5  21 4c		 and ($4c,x)
$0c:84e7  00 08		 brk #$08
$0c:84e9  00 00		 brk #$00
$0c:84eb  00 20		 brk #$20
$0c:84ed  4c fd ff	  jmp $fffd
$0c:84f0  13 00		 ora ($00,s),y
$0c:84f2  0c 00 06	  tsb $0600
$0c:84f5  00 08		 brk #$08
$0c:84f7  00 08		 brk #$08
$0c:84f9  00 03		 brk #$03
$0c:84fb  00 00		 brk #$00
$0c:84fd  02 06		 cop #$06
$0c:84ff  00 0a		 brk #$0a
$0c:8501  4a			lsr a
$0c:8502  0c 00 02	  tsb $0200
$0c:8505  06 08		 asl $08
$0c:8507  02 5a		 cop #$5a
$0c:8509  0c 01 00	  tsb $0001
$0c:850c  00 02		 brk #$02
$0c:850e  00 2c		 brk #$2c
$0c:8510  0c fd ff	  tsb $fffd
$0c:8513  13 00		 ora ($00,s),y
$0c:8515  0b			phd
$0c:8516  00 06		 brk #$06
$0c:8518  00 08		 brk #$08
$0c:851a  00 08		 brk #$08
$0c:851c  00 03		 brk #$03
$0c:851e  00 00		 brk #$00
$0c:8520  02 06		 cop #$06
$0c:8522  00 09		 brk #$09
$0c:8524  4a			lsr a
$0c:8525  0c 00 02	  tsb $0200
$0c:8528  06 08		 asl $08
$0c:852a  01 5a		 ora ($5a,x)
$0c:852c  0c 01 00	  tsb $0001
$0c:852f  00 01		 brk #$01
$0c:8531  00 2c		 brk #$2c
$0c:8533  0c ff ff	  tsb $ffff
$0c:8536  11 00		 ora ($00),y
$0c:8538  20 00 f0	  jsr $f000
$0c:853b  ff 08 00 08   sbc $080008,x
$0c:853f  00 03		 brk #$03
$0c:8541  00 00		 brk #$00
$0c:8543  02 06		 cop #$06
$0c:8545  08			php
$0c:8546  00 4a		 brk #$4a
$0c:8548  cc 00 02	  cpy $0200
$0c:854b  06 00		 asl $00
$0c:854d  08			php
$0c:854e  5a			phy
$0c:854f  cc 01 00	  cpy $0001
$0c:8552  00 00		 brk #$00
$0c:8554  00 2c		 brk #$2c
$0c:8556  0c ff ff	  tsb $ffff
$0c:8559  11 00		 ora ($00),y
$0c:855b  20 00 f1	  jsr $f100
$0c:855e  ff 08 00 08   sbc $080008,x
$0c:8562  00 03		 brk #$03
$0c:8564  00 00		 brk #$00
$0c:8566  02 06		 cop #$06
$0c:8568  09 00 4a	  ora #$4a00
$0c:856b  cc 00 02	  cpy $0200
$0c:856e  06 01		 asl $01
$0c:8570  08			php
$0c:8571  5a			phy
$0c:8572  cc 01 00	  cpy $0001
$0c:8575  00 00		 brk #$00
$0c:8577  01 2c		 ora ($2c,x)
$0c:8579  0c 0a 00	  tsb $000a
$0c:857c  06 00		 asl $00
$0c:857e  10 00		 bpl $8580
$0c:8580  f8			sed
$0c:8581  ff 08 00 08   sbc $080008,x
$0c:8585  00 02		 brk #$02
$0c:8587  00 00		 brk #$00
$0c:8589  00 08		 brk #$08
$0c:858b  00 00		 brk #$00
$0c:858d  20 0c 00	  jsr $000c
$0c:8590  08			php
$0c:8591  00 00		 brk #$00
$0c:8593  00 21		 brk #$21
$0c:8595  0c 0a 00	  tsb $000a
$0c:8598  06 00		 asl $00
$0c:859a  0f 00 f9 ff   ora $fff900
$0c:859e  08			php
$0c:859f  00 08		 brk #$08
$0c:85a1  00 02		 brk #$02
$0c:85a3  00 00		 brk #$00
$0c:85a5  00 08		 brk #$08
$0c:85a7  00 00		 brk #$00
$0c:85a9  20 0c 00	  jsr $000c
$0c:85ac  08			php
$0c:85ad  00 00		 brk #$00
$0c:85af  00 21		 brk #$21
$0c:85b1  0c f6 ff	  tsb $fff6
$0c:85b4  1a			inc a
$0c:85b5  00 10		 brk #$10
$0c:85b7  00 f8		 brk #$f8
$0c:85b9  ff 08 00 08   sbc $080008,x
$0c:85bd  00 02		 brk #$02
$0c:85bf  00 00		 brk #$00
$0c:85c1  00 08		 brk #$08
$0c:85c3  00 00		 brk #$00
$0c:85c5  21 4c		 and ($4c,x)
$0c:85c7  00 08		 brk #$08
$0c:85c9  00 00		 brk #$00
$0c:85cb  00 20		 brk #$20
$0c:85cd  4c f6 ff	  jmp $fff6
$0c:85d0  1a			inc a
$0c:85d1  00 0f		 brk #$0f
$0c:85d3  00 f9		 brk #$f9
$0c:85d5  ff 08 00 08   sbc $080008,x
$0c:85d9  00 02		 brk #$02
$0c:85db  00 00		 brk #$00
$0c:85dd  00 08		 brk #$08
$0c:85df  00 00		 brk #$00
$0c:85e1  21 4c		 and ($4c,x)
$0c:85e3  00 08		 brk #$08
$0c:85e5  00 00		 brk #$00
$0c:85e7  00 20		 brk #$20
$0c:85e9  4c 00 00	  jmp $0000
$0c:85ec  10 00		 bpl $85ee
$0c:85ee  10 00		 bpl $85f0
$0c:85f0  00 00		 brk #$00
$0c:85f2  10 00		 bpl $85f4
$0c:85f4  10 00		 bpl $85f6
$0c:85f6  01 00		 ora ($00,x)
$0c:85f8  01 00		 ora ($00,x)
$0c:85fa  00 00		 brk #$00
$0c:85fc  00 2c		 brk #$2c
$0c:85fe  0c 00 00	  tsb $0000
$0c:8601  10 00		 bpl $8603
$0c:8603  10 00		 bpl $8605
$0c:8605  00 00		 brk #$00
$0c:8607  08			php
$0c:8608  00 08		 brk #$08
$0c:860a  00 01		 brk #$01
$0c:860c  00 01		 brk #$01
$0c:860e  00 00		 brk #$00
$0c:8610  00 00		 brk #$00
$0c:8612  2c 0c e9	  bit $e90c
$0c:8615  ff 1f 00 18   sbc $18001f,x
$0c:8619  00 00		 brk #$00
$0c:861b  00 08		 brk #$08
$0c:861d  00 08		 brk #$08
$0c:861f  00 03		 brk #$03
$0c:8621  00 00		 brk #$00
$0c:8623  00 00		 brk #$00
$0c:8625  00 10		 brk #$10
$0c:8627  25 0c		 and $0c
$0c:8629  00 00		 brk #$00
$0c:862b  00 08		 brk #$08
$0c:862d  08			php
$0c:862e  35 0c		 and $0c,x
$0c:8630  00 00		 brk #$00
$0c:8632  00 10		 brk #$10
$0c:8634  00 34		 brk #$34
$0c:8636  0c 01 00	  tsb $0001
$0c:8639  1f 00 08 00   ora $000800,x
$0c:863d  08			php
$0c:863e  00 08		 brk #$08
$0c:8640  00 08		 brk #$08
$0c:8642  00 03		 brk #$03
$0c:8644  00 01		 brk #$01
$0c:8646  10 00		 bpl $8648
$0c:8648  00 00		 brk #$00
$0c:864a  44 0c 00	  mvp $00,$0c
$0c:864d  08			php
$0c:864e  10 08		 bpl $8658
$0c:8650  00 43		 brk #$43
$0c:8652  0c 00 00	  tsb $0000
$0c:8655  18			clc
$0c:8656  08			php
$0c:8657  00 42		 brk #$42
$0c:8659  0c 0f 00	  tsb $000f
$0c:865c  11 00		 ora ($00),y
$0c:865e  10 00		 bpl $8660
$0c:8660  08			php
$0c:8661  00 08		 brk #$08
$0c:8663  00 08		 brk #$08
$0c:8665  00 05		 brk #$05
$0c:8667  00 00		 brk #$00
$0c:8669  18			clc
$0c:866a  00 10		 brk #$10
$0c:866c  00 53		 brk #$53
$0c:866e  0c 00 10	  tsb $1000
$0c:8671  08			php
$0c:8672  10 00		 bpl $8674
$0c:8674  52 0c		 eor ($0c)
$0c:8676  01 00		 ora ($00,x)
$0c:8678  10 08		 bpl $8682
$0c:867a  00 40		 brk #$40
$0c:867c  0c 01 00	  tsb $0001
$0c:867f  10 00		 bpl $8681
$0c:8681  08			php
$0c:8682  30 0c		 bmi $8690
$0c:8684  00 08		 brk #$08
$0c:8686  10 00		 bpl $8688
$0c:8688  10 4c		 bpl $86d6
$0c:868a  0a			asl a
$0c:868b  0f 00 01 00   ora $000100
$0c:868f  10 00		 bpl $8691
$0c:8691  00 00		 brk #$00
$0c:8693  08			php
$0c:8694  00 08		 brk #$08
$0c:8696  00 02		 brk #$02
$0c:8698  00 01		 brk #$01
$0c:869a  00 00		 brk #$00
$0c:869c  00 00		 brk #$00
$0c:869e  22 0c 00 08   jsl $08000c
$0c:86a2  00 00		 brk #$00
$0c:86a4  08			php
$0c:86a5  4c 0a 0e	  jmp $0e0a
$0c:86a8  00 fa		 brk #$fa
$0c:86aa  ff 18 00 00   sbc $000018,x
$0c:86ae  00 08		 brk #$08
$0c:86b0  00 08		 brk #$08
$0c:86b2  00 03		 brk #$03
$0c:86b4  00 00		 brk #$00
$0c:86b6  00 00		 brk #$00
$0c:86b8  10 00		 bpl $86ba
$0c:86ba  25 cc		 and $cc
$0c:86bc  00 00		 brk #$00
$0c:86be  00 08		 brk #$08
$0c:86c0  08			php
$0c:86c1  35 cc		 and $cc,x
$0c:86c3  00 00		 brk #$00
$0c:86c5  00 00		 brk #$00
$0c:86c7  10 34		 bpl $86fd
$0c:86c9  cc 0e 00	  cpy $000e
$0c:86cc  12 00		 ora ($00)
$0c:86ce  20 00 f0	  jsr $f000
$0c:86d1  ff 08 00 08   sbc $080008,x
$0c:86d5  00 03		 brk #$03
$0c:86d7  00 01		 brk #$01
$0c:86d9  00 10		 brk #$10
$0c:86db  00 00		 brk #$00
$0c:86dd  44 cc 00	  mvp $00,$cc
$0c:86e0  10 08		 bpl $86ea
$0c:86e2  00 08		 brk #$08
$0c:86e4  43 cc		 eor $cc,s
$0c:86e6  00 18		 brk #$18
$0c:86e8  00 00		 brk #$00
$0c:86ea  08			php
$0c:86eb  42 cc		 wdm #$cc
$0c:86ed  00 00		 brk #$00
$0c:86ef  20 00 20	  jsr $2000
$0c:86f2  00 f8		 brk #$f8
$0c:86f4  ff 08 00 08   sbc $080008,x
$0c:86f8  00 05		 brk #$05
$0c:86fa  00 00		 brk #$00
$0c:86fc  08			php
$0c:86fd  10 00		 bpl $86ff
$0c:86ff  10 52		 bpl $8753
$0c:8701  cc 00 00	  cpy $0000
$0c:8704  18			clc
$0c:8705  00 10		 brk #$10
$0c:8707  53 cc		 eor ($cc,s),y
$0c:8709  01 10		 ora ($10,x)
$0c:870b  00 00		 brk #$00
$0c:870d  08			php
$0c:870e  2e 0c 00	  rol $000c
$0c:8711  10 08		 bpl $871b
$0c:8713  10 00		 bpl $8715
$0c:8715  4e 0c 00	  lsr $000c
$0c:8718  10 08		 bpl $8722
$0c:871a  10 00		 bpl $871c
$0c:871c  4b			phk
$0c:871d  0a			asl a
$0c:871e  f0 ff		 beq $871f
$0c:8720  20 00 18	  jsr $1800
$0c:8723  00 f8		 brk #$f8
$0c:8725  ff 08 00 08   sbc $080008,x
$0c:8729  00 04		 brk #$04
$0c:872b  00 00		 brk #$00
$0c:872d  00 08		 brk #$08
$0c:872f  00 08		 brk #$08
$0c:8731  5e 0c 00	  lsr $000c,x
$0c:8734  08			php
$0c:8735  00 00		 brk #$00
$0c:8737  08			php
$0c:8738  5f 0c 00 00   eor $00000c,x
$0c:873c  08			php
$0c:873d  08			php
$0c:873e  00 4e		 brk #$4e
$0c:8740  0c 00 00	  tsb $0000
$0c:8743  08			php
$0c:8744  08			php
$0c:8745  00 4b		 brk #$4b
$0c:8747  0a			asl a
$0c:8748  07 00		 ora [$00]
$0c:874a  11 00		 ora ($00),y
$0c:874c  01 00		 ora ($00,x)
$0c:874e  07 00		 ora [$00]
$0c:8750  08			php
$0c:8751  00 08		 brk #$08
$0c:8753  00 03		 brk #$03
$0c:8755  00 00		 brk #$00
$0c:8757  10 00		 bpl $8759
$0c:8759  00 00		 brk #$00
$0c:875b  3b			tsc
$0c:875c  0c 00 08	  tsb $0800
$0c:875f  08			php
$0c:8760  00 00		 brk #$00
$0c:8762  59 0c 00	  eor $000c,y
$0c:8765  00 10		 brk #$10
$0c:8767  00 00		 brk #$00
$0c:8769  49 0c 0f	  eor #$0f0c
$0c:876c  00 01		 brk #$01
$0c:876e  00 11		 brk #$11
$0c:8770  00 07		 brk #$07
$0c:8772  00 08		 brk #$08
$0c:8774  00 08		 brk #$08
$0c:8776  00 02		 brk #$02
$0c:8778  00 01		 brk #$01
$0c:877a  00 00		 brk #$00
$0c:877c  08			php
$0c:877d  00 47		 brk #$47
$0c:877f  0c 00 00	  tsb $0000
$0c:8782  08			php
$0c:8783  00 10		 brk #$10
$0c:8785  56 0c		 lsr $0c,x
$0c:8787  0f 00 09 00   ora $000900
$0c:878b  21 00		 and ($00,x)
$0c:878d  f7 ff		 sbc [$ff],y
$0c:878f  08			php
$0c:8790  00 08		 brk #$08
$0c:8792  00 04		 brk #$04
$0c:8794  00 00		 brk #$00
$0c:8796  00 10		 brk #$10
$0c:8798  10 00		 bpl $879a
$0c:879a  46 0c		 lsr $0c
$0c:879c  01 00		 ora ($00,x)
$0c:879e  08			php
$0c:879f  00 08		 brk #$08
$0c:87a1  26 0c		 rol $0c
$0c:87a3  01 08		 ora ($08,x)
$0c:87a5  00 00		 brk #$00
$0c:87a7  08			php
$0c:87a8  27 0c		 and [$0c]
$0c:87aa  00 10		 brk #$10
$0c:87ac  00 08		 brk #$08
$0c:87ae  08			php
$0c:87af  5b			tcd
$0c:87b0  0a			asl a
$0c:87b1  07 00		 ora [$00]
$0c:87b3  09 00 21	  ora #$2100
$0c:87b6  00 ef		 brk #$ef
$0c:87b8  ff 08 00 08   sbc $080008,x
$0c:87bc  00 02		 brk #$02
$0c:87be  00 01		 brk #$01
$0c:87c0  00 00		 brk #$00
$0c:87c2  00 00		 brk #$00
$0c:87c4  29 0c 00	  and #$000c
$0c:87c7  08			php
$0c:87c8  00 08		 brk #$08
$0c:87ca  00 5b		 brk #$5b
$0c:87cc  0a			asl a
$0c:87cd  01 00		 ora ($00,x)
$0c:87cf  17 00		 ora [$00],y
$0c:87d1  21 00		 and ($00,x)
$0c:87d3  e7 ff		 sbc [$ff]
$0c:87d5  08			php
$0c:87d6  00 08		 brk #$08
$0c:87d8  00 03		 brk #$03
$0c:87da  00 00		 brk #$00
$0c:87dc  00 10		 brk #$10
$0c:87de  00 00		 brk #$00
$0c:87e0  3b			tsc
$0c:87e1  cc 00 08	  cpy $0800
$0c:87e4  08			php
$0c:87e5  00 00		 brk #$00
$0c:87e7  59 cc 00	  eor $00cc,y
$0c:87ea  10 00		 bpl $87ec
$0c:87ec  00 00		 brk #$00
$0c:87ee  49 cc f1	  eor #$f1cc
$0c:87f1  ff 1f 00 21   sbc $21001f,x
$0c:87f5  00 f7		 brk #$f7
$0c:87f7  ff 08 00 08   sbc $080008,x
$0c:87fb  00 02		 brk #$02
$0c:87fd  00 01		 brk #$01
$0c:87ff  00 00		 brk #$00
$0c:8801  00 08		 brk #$08
$0c:8803  47 cc		 eor [$cc]
$0c:8805  00 08		 brk #$08
$0c:8807  00 10		 brk #$10
$0c:8809  00 56		 brk #$56
$0c:880b  cc f9 ff	  cpy $fff9
$0c:880e  1f 00 11 00   ora $001100,x
$0c:8812  07 00		 ora [$00]
$0c:8814  08			php
$0c:8815  00 08		 brk #$08
$0c:8817  00 04		 brk #$04
$0c:8819  00 01		 brk #$01
$0c:881b  08			php
$0c:881c  00 08		 brk #$08
$0c:881e  00 26		 brk #$26
$0c:8820  cc 01 00	  cpy $0001
$0c:8823  08			php
$0c:8824  08			php
$0c:8825  00 27		 brk #$27
$0c:8827  cc 00 10	  cpy $1000
$0c:882a  00 00		 brk #$00
$0c:882c  10 46		 bpl $8874
$0c:882e  cc 00 00	  cpy $0000
$0c:8831  10 08		 bpl $883b
$0c:8833  08			php
$0c:8834  5b			tcd
$0c:8835  ca			dex
$0c:8836  f9 ff 17	  sbc $17ff,y
$0c:8839  00 09		 brk #$09
$0c:883b  00 07		 brk #$07
$0c:883d  00 08		 brk #$08
$0c:883f  00 08		 brk #$08
$0c:8841  00 02		 brk #$02
$0c:8843  00 01		 brk #$01
$0c:8845  00 00		 brk #$00
$0c:8847  00 00		 brk #$00
$0c:8849  29 cc 00	  and #$00cc
$0c:884c  00 08		 brk #$08
$0c:884e  00 08		 brk #$08
$0c:8850  5b			tcd
$0c:8851  ca			dex
$0c:8852  07 00		 ora [$00]
$0c:8854  01 00		 ora ($00,x)
$0c:8856  10 00		 bpl $8858
$0c:8858  f8			sed
$0c:8859  ff 10 00 10   sbc $100010,x
$0c:885d  00 01		 brk #$01
$0c:885f  00 00		 brk #$00
$0c:8861  00 00		 brk #$00
$0c:8863  00 00		 brk #$00
$0c:8865  4c 0a f1	  jmp $f10a
$0c:8868  ff 17 00 10   sbc $100017,x
$0c:886c  00 f8		 brk #$f8
$0c:886e  ff 10 00 10   sbc $100010,x
$0c:8872  00 01		 brk #$01
$0c:8874  00 00		 brk #$00
$0c:8876  00 00		 brk #$00
$0c:8878  00 00		 brk #$00
$0c:887a  4b			phk
$0c:887b  0a			asl a
$0c:887c  ff ff 09 00   sbc $0009ff,x
$0c:8880  18			clc
$0c:8881  00 f0		 brk #$f0
$0c:8883  ff 08 00 08   sbc $080008,x
$0c:8887  00 01		 brk #$01
$0c:8889  00 00		 brk #$00
$0c:888b  00 00		 brk #$00
$0c:888d  00 00		 brk #$00
$0c:888f  5b			tcd
$0c:8890  0a			asl a
$0c:8891  f9 ff 0f	  sbc $0fff,y
$0c:8894  00 08		 brk #$08
$0c:8896  00 00		 brk #$00
$0c:8898  00 08		 brk #$08
$0c:889a  00 08		 brk #$08
$0c:889c  00 01		 brk #$01
$0c:889e  00 00		 brk #$00
$0c:88a0  00 00		 brk #$00
$0c:88a2  00 00		 brk #$00
$0c:88a4  5b			tcd
$0c:88a5  ca			dex
$0c:88a6  02 00		 cop #$00
$0c:88a8  06 00		 asl $00
$0c:88aa  1f 00 f1 ff   ora $fff100,x
$0c:88ae  08			php
$0c:88af  00 08		 brk #$08
$0c:88b1  00 02		 brk #$02
$0c:88b3  00 00		 brk #$00
$0c:88b5  00 00		 brk #$00
$0c:88b7  08			php
$0c:88b8  00 4a		 brk #$4a
$0c:88ba  8c 00 00	  sty $0000
$0c:88bd  00 00		 brk #$00
$0c:88bf  08			php
$0c:88c0  5a			phy
$0c:88c1  8c ff ff	  sty $ffff
$0c:88c4  09 00 1e	  ora #$1e00
$0c:88c7  00 f2		 brk #$f2
$0c:88c9  ff 08 00 08   sbc $080008,x
$0c:88cd  00 02		 brk #$02
$0c:88cf  00 00		 brk #$00
$0c:88d1  00 00		 brk #$00
$0c:88d3  08			php
$0c:88d4  00 4a		 brk #$4a
$0c:88d6  8c 00 00	  sty $0000
$0c:88d9  00 00		 brk #$00
$0c:88db  08			php
$0c:88dc  5a			phy
$0c:88dd  8c ff ff	  sty $ffff
$0c:88e0  09 00 1d	  ora #$1d00
$0c:88e3  00 f3		 brk #$f3
$0c:88e5  ff 08 00 08   sbc $080008,x
$0c:88e9  00 02		 brk #$02
$0c:88eb  00 00		 brk #$00
$0c:88ed  00 00		 brk #$00
$0c:88ef  08			php
$0c:88f0  00 4a		 brk #$4a
$0c:88f2  8c 00 00	  sty $0000
$0c:88f5  00 00		 brk #$00
$0c:88f7  08			php
$0c:88f8  5a			phy
$0c:88f9  8c f6 ff	  sty $fff6
$0c:88fc  12 00		 ora ($00)
$0c:88fe  21 00		 and ($00,x)
$0c:8900  ef ff 08 00   sbc $0008ff
$0c:8904  08			php
$0c:8905  00 02		 brk #$02
$0c:8907  00 00		 brk #$00
$0c:8909  00 00		 brk #$00
$0c:890b  08			php
$0c:890c  00 4a		 brk #$4a
$0c:890e  cc 00 00	  cpy $0000
$0c:8911  00 00		 brk #$00
$0c:8913  08			php
$0c:8914  5a			phy
$0c:8915  cc f8 ff	  cpy $fff8
$0c:8918  10 00		 bpl $891a
$0c:891a  20 00 f0	  jsr $f000
$0c:891d  ff 08 00 08   sbc $080008,x
$0c:8921  00 02		 brk #$02
$0c:8923  00 00		 brk #$00
$0c:8925  00 00		 brk #$00
$0c:8927  08			php
$0c:8928  00 4a		 brk #$4a
$0c:892a  cc 00 00	  cpy $0000
$0c:892d  00 00		 brk #$00
$0c:892f  08			php
$0c:8930  5a			phy
$0c:8931  cc f8 ff	  cpy $fff8
$0c:8934  10 00		 bpl $8936
$0c:8936  1f 00 f1 ff   ora $fff100,x
$0c:893a  08			php
$0c:893b  00 08		 brk #$08
$0c:893d  00 02		 brk #$02
$0c:893f  00 00		 brk #$00
$0c:8941  00 00		 brk #$00
$0c:8943  08			php
$0c:8944  00 4a		 brk #$4a
$0c:8946  cc 00 00	  cpy $0000
$0c:8949  00 00		 brk #$00
$0c:894b  08			php
$0c:894c  5a			phy
$0c:894d  cc 00 00	  cpy $0000
$0c:8950  08			php
$0c:8951  00 1e		 brk #$1e
$0c:8953  00 f2		 brk #$f2
$0c:8955  ff 08 00 08   sbc $080008,x
$0c:8959  00 02		 brk #$02
$0c:895b  00 00		 brk #$00
$0c:895d  00 00		 brk #$00
$0c:895f  08			php
$0c:8960  00 4a		 brk #$4a
$0c:8962  8c 00 00	  sty $0000
$0c:8965  00 00		 brk #$00
$0c:8967  08			php
$0c:8968  5a			phy
$0c:8969  8c 02 00	  sty $0002
$0c:896c  06 00		 asl $00
$0c:896e  1e 00 f2	  asl $f200,x
$0c:8971  ff 08 00 08   sbc $080008,x
$0c:8975  00 02		 brk #$02
$0c:8977  00 00		 brk #$00
$0c:8979  00 00		 brk #$00
$0c:897b  08			php
$0c:897c  00 4a		 brk #$4a
$0c:897e  8c 00 00	  sty $0000
$0c:8981  00 00		 brk #$00
$0c:8983  08			php
$0c:8984  5a			phy
$0c:8985  8c 02 00	  sty $0002
$0c:8988  06 00		 asl $00
$0c:898a  1d 00 f3	  ora $f300,x
$0c:898d  ff 08 00 08   sbc $080008,x
$0c:8991  00 02		 brk #$02
$0c:8993  00 00		 brk #$00
$0c:8995  00 00		 brk #$00
$0c:8997  08			php
$0c:8998  00 4a		 brk #$4a
$0c:899a  8c 00 00	  sty $0000
$0c:899d  00 00		 brk #$00
$0c:899f  08			php
$0c:89a0  5a			phy
$0c:89a1  8c f8 ff	  sty $fff8
$0c:89a4  10 00		 bpl $89a6
$0c:89a6  20 00 f0	  jsr $f000
$0c:89a9  ff 08 00 08   sbc $080008,x
$0c:89ad  00 02		 brk #$02
$0c:89af  00 00		 brk #$00
$0c:89b1  00 00		 brk #$00
$0c:89b3  08			php
$0c:89b4  00 4a		 brk #$4a
$0c:89b6  cc 00 00	  cpy $0000
$0c:89b9  00 00		 brk #$00
$0c:89bb  08			php
$0c:89bc  5a			phy
$0c:89bd  cc f6 ff	  cpy $fff6
$0c:89c0  12 00		 ora ($00)
$0c:89c2  21 00		 and ($00,x)
$0c:89c4  ef ff 08 00   sbc $0008ff
$0c:89c8  08			php
$0c:89c9  00 02		 brk #$02
$0c:89cb  00 00		 brk #$00
$0c:89cd  00 00		 brk #$00
$0c:89cf  08			php
$0c:89d0  00 4a		 brk #$4a
$0c:89d2  cc 00 00	  cpy $0000
$0c:89d5  00 00		 brk #$00
$0c:89d7  08			php
$0c:89d8  5a			phy
$0c:89d9  cc f6 ff	  cpy $fff6
$0c:89dc  12 00		 ora ($00)
$0c:89de  20 00 f0	  jsr $f000
$0c:89e1  ff 08 00 08   sbc $080008,x
$0c:89e5  00 02		 brk #$02
$0c:89e7  00 00		 brk #$00
$0c:89e9  00 00		 brk #$00
$0c:89eb  08			php
$0c:89ec  00 4a		 brk #$4a
$0c:89ee  cc 00 00	  cpy $0000
$0c:89f1  00 00		 brk #$00
$0c:89f3  08			php
$0c:89f4  5a			phy
$0c:89f5  cc 00 20	  cpy $2000
$0c:89f8  80 3b		 bra $8a35
$0c:89fa  fd fd 94	  sbc $94fd,x
$0c:89fd  0f fc 13 ff   ora $ff13fc
$0c:8a01  08			php
$0c:8a02  ff c0 7f f0   sbc $f07fc0,x
$0c:8a06  00 90		 brk #$90
$0c:8a08  c6 7f		 dec $7f
$0c:8a0a  f0 20		 beq $8a2c
$0c:8a0c  b0 3f		 bcs $8a4d
$0c:8a0e  b7 00		 lda [$00],y
$0c:8a10  10 18		 bpl $8a2a
$0c:8a12  af de 61 fe   lda $fe61de
$0c:8a16  81 85		 sta ($85,x)
$0c:8a18  04 5e		 tsb $5e
$0c:8a1a  00 f0		 brk #$f0
$0c:8a1c  7f 14 22 01   adc $012214,x
$0c:8a20  01 7f		 ora ($7f,x)
$0c:8a22  38			sec
$0c:8a23  54 85 e1	  mvn $e1,$85
$0c:8a26  41 bf		 eor ($bf,x)
$0c:8a28  e7 7f		 sbc [$7f]
$0c:8a2a  f2 8f		 sbc ($8f)
$0c:8a2c  7e e4 2c	  ror $2ce4,x
$0c:8a2f  1f c1 4a bf   ora $bf4ac1,x
$0c:8a33  86 20		 stx $20
$0c:8a35  fe 18 1c	  inc $1c18,x
$0c:8a38  03 15		 ora $15,s
$0c:8a3a  fb			xce
$0c:8a3b  99 fc fc	  sta $fcfc,y
$0c:8a3e  be 78 a4	  ldx $a478,y
$0c:8a41  72 99		 adc ($99)
$0c:8a43  4c b1 f8	  jmp $f8b1
$0c:8a46  f2 d9		 sbc ($d9)
$0c:8a48  79 54 fa	  adc $fa54,y
$0c:8a4b  09 00 86	  ora #$8600
$0c:8a4e  40			rti
$0c:8a4f  23 10		 and $10,s
$0c:8a51  0f 1c 03 67   ora $67031c
$0c:8a55  00 8e		 brk #$8e
$0c:8a57  40			rti
$0c:8a58  2d 10 0e	  and $0e10
$0c:8a5b  0c 00 36	  tsb $3600
$0c:8a5e  12 3f		 ora ($3f)
$0c:8a60  fe 1b fd	  inc $fd1b,x
$0c:8a63  44 be 67	  mvp $67,$be
$0c:8a66  7f b2 4f 3f   adc $3f4fb2,x
$0c:8a6a  b7 df		 lda [$df],y
$0c:8a6c  70 be		 bvs $8a2c
$0c:8a6e  12 ce		 ora ($ce)
$0c:8a70  01 83		 ora ($83,x)
$0c:8a72  80 40		 bra $8ab4
$0c:8a74  90 42		 bcc $8ab8
$0c:8a76  69 05 28	  adc #$2805
$0c:8a79  46 7c		 lsr $7c
$0c:8a7b  f8			sed
$0c:8a7c  6f ff 3b 9f   adc $9f3bff
$0c:8a80  33 9e		 and ($9e,s),y
$0c:8a82  72 06		 adc ($06)
$0c:8a84  41 fe		 eor ($fe,x)
$0c:8a86  fd ff 6a	  sbc $6aff,x
$0c:8a89  dd a7 f1	  cmp $f1a7,x
$0c:8a8c  4c 20 1c	  jmp $1c20
$0c:8a8f  07 f2		 ora [$f2]
$0c:8a91  c8			iny
$0c:8a92  51 01		 eor ($01),y
$0c:8a94  e5 ec		 sbc $ec
$0c:8a96  7a			ply
$0c:8a97  f6 35		 inc $35,x
$0c:8a99  6f 14 b3 89   adc $89b314
$0c:8a9d  58			cli
$0c:8a9e  c4 ec		 cpy $ec
$0c:8aa0  62 56 29	  per $b3f9
$0c:8aa3  27 16		 and [$16]
$0c:8aa5  05 01		 ora $01
$0c:8aa7  82 c0 e1	  brl $6c6a
$0c:8aaa  70 78		 bvs $8b24
$0c:8aac  bc 3e 5f	  ldy $5f3e,x
$0c:8aaf  1f af 4f f7   ora $f74faf,x
$0c:8ab3  b7 fb		 lda [$fb],y
$0c:8ab5  d7 fe		 cmp [$fe],y
$0c:8ab7  1b			tcs
$0c:8ab8  9d 83 f3	  sta $f383,x
$0c:8abb  e0 be		 cpx #$be
$0c:8abd  3a			dec a
$0c:8abe  14 c7		 trb $c7
$0c:8ac0  01 b9		 ora ($b9,x)
$0c:8ac2  88			dey
$0c:8ac3  5b			tcd
$0c:8ac4  21 1c		 and ($1c,x)
$0c:8ac6  6b			rtl
$0c:8ac7  26 8e		 rol $8e
$0c:8ac9  c5 80		 cmp $80
$0c:8acb  d8			cld
$0c:8acc  70 3b		 bvs $8b09
$0c:8ace  1e 0f 67	  asl $670f,x
$0c:8ad1  c2 8d		 rep #$8d
$0c:8ad3  f8			sed
$0c:8ad4  cd ff 27	  cmp $27ff
$0c:8ad7  bf ea f7 fc   lda $fcf7ea,x
$0c:8adb  1c 16 fc	  trb $fc16
$0c:8ade  f9 6c 32	  sbc $326c,y
$0c:8ae1  d9 9f 1f	  cmp $1f9f,y
$0c:8ae4  fe 73 ff	  inc $ff73,x
$0c:8ae7  a5 ce		 lda $ce
$0c:8ae9  e3 13		 sbc $13,s
$0c:8aeb  f2 32		 sbc ($32)
$0c:8aed  58			cli
$0c:8aee  08			php
$0c:8aef  c7 84		 cmp [$84]
$0c:8af1  62 0c 07	  per $9200
$0c:8af4  fd 11 f6	  sbc $f611,x
$0c:8af7  c1 be		 cmp ($be,x)
$0c:8af9  70 4f		 bvs $8b4a
$0c:8afb  7c ab ef	  jmp ($efab,x)
$0c:8afe  75 d1		 adc $d1,x
$0c:8b00  c5 ff		 cmp $ff
$0c:8b02  b7 ee		 lda [$ee],y
$0c:8b04  cc 1f f1	  cpy $f11f
$0c:8b07  1d f1 4c	  ora $4cf1,x
$0c:8b0a  f9 12 1e	  sbc $1e12,y
$0c:8b0d  85 83		 sta $83
$0c:8b0f  01 60		 ora ($60,x)
$0c:8b11  c4 5f		 cpy $5f
$0c:8b13  30 04		 bmi $8b19
$0c:8b15  b0 f0		 bcs $8b07
$0c:8b17  47 f2		 eor [$f2]
$0c:8b19  1e fd 44	  asl $44fd,x
$0c:8b1c  5e 29 0b	  lsr $0b29,x
$0c:8b1f  95 67		 sta $67,x
$0c:8b21  63 5f		 adc $5f,s
$0c:8b23  de d6 17	  dec $17d6,x
$0c:8b26  6d cb 27	  adc $27cb
$0c:8b29  87 e2		 sta [$e2]
$0c:8b2b  0f fc 81 98   ora $9881fc
$0c:8b2f  c3 fd		 cmp $fd,s
$0c:8b31  01 bf		 ora ($bf,x)
$0c:8b33  40			rti
$0c:8b34  60			rts
$0c:8b35  d2 18		 cmp ($18)
$0c:8b37  72 8c		 adc ($8c)
$0c:8b39  0d f5 01	  ora $01f5
$0c:8b3c  80 a9		 bra $8ae7
$0c:8b3e  c0 e1		 cpy #$e1
$0c:8b40  70 08		 bvs $8b4a
$0c:8b42  18			clc
$0c:8b43  98			tya
$0c:8b44  e0 70		 cpx #$70
$0c:8b46  38			sec
$0c:8b47  e4 3e		 cpx $3e
$0c:8b49  61 3f		 adc ($3f,x)
$0c:8b4b  e0 7f		 cpx #$7f
$0c:8b4d  e0 1f		 cpx #$1f
$0c:8b4f  86 32		 stx $32
$0c:8b51  23 82		 and $82,s
$0c:8b53  3f 00 0f 02   and $020f00,x
$0c:8b57  6c 15 45	  jmp ($4515)
$0c:8b5a  07 80		 ora [$80]
$0c:8b5c  5f d5 21 c0   eor $c021d5,x
$0c:8b60  9f 93 c3 e1   sta $e1c393,x
$0c:8b64  0f 30 92 bd   ora $bd9230
$0c:8b68  18			clc
$0c:8b69  70 99		 bvs $8b04
$0c:8b6b  09 ff 05	  ora #$05ff
$0c:8b6e  a2 3c		 ldx #$3c
$0c:8b70  36 a9		 rol $a9,x
$0c:8b72  47 fc		 eor [$fc]
$0c:8b74  6d b0 54	  adc $54b0
$0c:8b77  84 05		 sty $05
$0c:8b79  c0 30		 cpy #$30
$0c:8b7b  37 23		 and [$23],y
$0c:8b7d  aa			tax
$0c:8b7e  42 89		 wdm #$89
$0c:8b80  ff c0 7f e0   sbc $e07fc0,x
$0c:8b84  bf d8 62 a8   lda $a862d8,x
$0c:8b88  66 0e		 ror $0e
$0c:8b8a  c2 13		 rep #$13
$0c:8b8c  19 fa 31	  ora $31fa,y
$0c:8b8f  df 9d bf 60   cmp $60bf9d,x
$0c:8b93  1e 1b 6e	  asl $6e1b,x
$0c:8b96  4e 3f f1	  lsr $f13f
$0c:8b99  96 fc		 stx $fc,y
$0c:8b9b  eb			xba
$0c:8b9c  bb			tyx
$0c:8b9d  39 ef 0c	  and $0cef,y
$0c:8ba0  02 e9		 cop #$e9
$0c:8ba2  08			php
$0c:8ba3  b6 40		 ldx $40,y
$0c:8ba5  2e 10 0b	  rol $0b10
$0c:8ba8  e0 7c ee	  cpx #$ee7c
$0c:8bab  90 0b		 bcc $8bb8
$0c:8bad  c3 84		 cmp $84,s
$0c:8baf  28			plp
$0c:8bb0  df e9 1c ff   cmp $ff1ce9,x
$0c:8bb4  8b			phb
$0c:8bb5  fd cf 7f	  sbc $7fcf,x
$0c:8bb8  e4 9e		 cpx $9e
$0c:8bba  79 c3 f0	  adc $f0c3,y
$0c:8bbd  cd c1 c0	  cmp $c0c1
$0c:8bc0  02 1c		 cop #$1c
$0c:8bc2  60			rts
$0c:8bc3  ea			nop
$0c:8bc4  74 3b		 stz $3b,x
$0c:8bc6  fb			xce
$0c:8bc7  cc 37 7f	  cpy $7f37
$0c:8bca  fe 37 7d	  inc $7d37,x
$0c:8bcd  c2 10		 rep #$10
$0c:8bcf  7f fe 73 ff   adc $ff73fe,x
$0c:8bd3  35 fb		 and $fb,x
$0c:8bd5  e0 0e a7	  cpx #$a70e
$0c:8bd8  20 42 ac	  jsr $ac42
$0c:8bdb  22 01 6d be   jsl $be6d01
$0c:8bdf  fd be d0	  sbc $d0be,x
$0c:8be2  b8			clv
$0c:8be3  7c d6 7b	  jmp ($7bd6,x)
$0c:8be6  de ff f1	  dec $f1ff,x
$0c:8be9  78			sei
$0c:8bea  f1 88		 sbc ($88),y
$0c:8bec  fd ce ff	  sbc $ffce,x
$0c:8bef  82 80 42	  brl $ce72
$0c:8bf2  60			rts
$0c:8bf3  1f 08 07 08   ora $080708,x
$0c:8bf7  16 33		 asl $33,x
$0c:8bf9  88			dey
$0c:8bfa  07 82		 ora [$82]
$0c:8bfc  00 5f		 brk #$5f
$0c:8bfe  02 78		 cop #$78
$0c:8c00  63 7f		 adc $7f,s
$0c:8c02  bb			tyx
$0c:8c03  0f 86 63 3f   ora $3f6386
$0c:8c07  31 ff		 and ($ff),y
$0c:8c09  d8			cld
$0c:8c0a  fc 7c ce	  jsr ($ce7c,x)
$0c:8c0d  7c d6 6e	  jmp ($6ed6,x)
$0c:8c10  5f 00 28 43   eor $432800,x
$0c:8c14  e0 16 00	  cpx #$0016
$0c:8c17  58			cli
$0c:8c18  c7 20		 cmp [$20]
$0c:8c1a  13 08		 ora ($08,s),y
$0c:8c1c  07 22		 ora [$22]
$0c:8c1e  01 bc		 ora ($bc,x)
$0c:8c20  d2 f6		 cmp ($f6)
$0c:8c22  3d 77 1c	  and $1c77,x
$0c:8c25  b7 8a		 lda [$8a],y
$0c:8c27  59 40 ee	  eor $ee40,y
$0c:8c2a  40			rti
$0c:8c2b  e7 b1		 sbc [$b1]
$0c:8c2d  9b			txy
$0c:8c2e  34 53		 bit $53,x
$0c:8c30  c7 42		 cmp [$42]
$0c:8c32  80 c1		 bra $8bf5
$0c:8c34  60			rts
$0c:8c35  70 b8		 bvs $8bef
$0c:8c37  3c 5e 1f	  bit $1f5e,x
$0c:8c3a  27 8f		 and [$8f]
$0c:8c3c  f4 a7 fb	  pea $fba7
$0c:8c3f  9b			txy
$0c:8c40  fd f3 ff	  sbc $fff3,x
$0c:8c43  48			pha
$0c:8c44  c5 e4		 cmp $e4
$0c:8c46  62 d2 29	  per $b61b
$0c:8c49  65 12		 adc $12
$0c:8c4b  b1 89		 lda ($89),y
$0c:8c4d  d8			cld
$0c:8c4e  e4 ac		 cpx $ac
$0c:8c50  72 de		 adc ($de)
$0c:8c52  b5 4b		 lda $4b,x
$0c:8c54  19 f4 ff	  ora $fff4,y
$0c:8c57  fa			plx
$0c:8c58  7f fd 3f fe   adc $fe3ffd,x
$0c:8c5c  9f ff 4e 2d   sta $2d4eff,x
$0c:8c60  0c a7 ff	  tsb $ffa7
$0c:8c63  73 ff		 adc ($ff,s),y
$0c:8c65  cc ba 35	  cpy $35ba
$0c:8c68  99 45 32	  sta $3245,y
$0c:8c6b  e9 a6 ed	  sbc #$eda6
$0c:8c6e  54 f1 b4	  mvn $b4,$f1
$0c:8c71  9e 36 92	  stz $9236,x
$0c:8c74  c7 52		 cmp [$52]
$0c:8c76  98			tya
$0c:8c77  cb			wai
$0c:8c78  ff fd 7f fe   sbc $fe7ffd,x
$0c:8c7c  2f ff 25 ff   and $ff25ff
$0c:8c80  dc bf f3	  jml [$f3bf]
$0c:8c83  92 d0		 sta ($d0)
$0c:8c85  f3 bf		 sbc ($bf,s),y
$0c:8c87  f0 4c		 beq $8cd5
$0c:8c89  dc 2f 8f	  jml [$8f2f]
$0c:8c8c  87 b1		 sta [$b1]
$0c:8c8e  d0 e6		 bne $8c76
$0c:8c90  12 08		 ora ($08)
$0c:8c92  ce 43 19	  dec $1943
$0c:8c95  c8			iny
$0c:8c96  a3 5b		 lda $5b,s
$0c:8c98  35 76		 and $76,x
$0c:8c9a  0c 06 c3	  tsb $c306
$0c:8c9d  81 d8		 sta ($d8,x)
$0c:8c9f  f0 7b		 beq $8d1c
$0c:8ca1  3e 1f 6f	  rol $6f1f,x
$0c:8ca4  c5 ef		 cmp $ef
$0c:8ca6  f9 bd ff	  sbc $ffbd,y
$0c:8ca9  55 bf		 eor $bf,x
$0c:8cab  e4 b2		 cpx $b2
$0c:8cad  17 c4		 ora [$c4],y
$0c:8caf  04 5f		 tsb $5f
$0c:8cb1  83 bb		 sta $bb,s
$0c:8cb3  44 87 7e	  mvp $7e,$87
$0c:8cb6  3f 3c 9f 90   and $909f3c,x
$0c:8cba  26 7f		 rol $7f
$0c:8cbc  1f f0 4f f8   ora $f84ff0,x
$0c:8cc0  10 38		 bpl $8cfa
$0c:8cc2  24 1e		 bit $1e
$0c:8cc4  11 0f		 ora ($0f),y
$0c:8cc6  88			dey
$0c:8cc7  47 a4		 eor [$a4]
$0c:8cc9  17 fc		 ora [$fc],y
$0c:8ccb  04 7e		 tsb $7e
$0c:8ccd  01 c1		 ora ($c1,x)
$0c:8ccf  e0 5f 3f	  cpx #$3f5f
$0c:8cd2  90 08		 bcc $8cdc
$0c:8cd4  3a			dec a
$0c:8cd5  88			dey
$0c:8cd6  4f 20 5e 01   eor $015e20
$0c:8cda  70 7f		 bvs $8d5b
$0c:8cdc  f8			sed
$0c:8cdd  13 ff		 ora ($ff,s),y
$0c:8cdf  e4 0f		 cpx $0f
$0c:8ce1  c1 00		 cmp ($00,x)
$0c:8ce3  c1 40		 cmp ($40,x)
$0c:8ce5  a1 f0		 lda ($f0,x)
$0c:8ce7  f8			sed
$0c:8ce8  cc 7f 21	  cpy $217f
$0c:8ceb  1f e8 47 fb   ora $fb47e8,x
$0c:8cef  11 fb		 ora ($fb),y
$0c:8cf1  4a			lsr a
$0c:8cf2  08			php
$0c:8cf3  3f f0 2f ec   and $ec2ff0,x
$0c:8cf7  3f e1 1f f0   and $f01fe1,x
$0c:8cfb  29 51 46	  and #$4651
$0c:8cfe  17 e8		 ora [$e8],y
$0c:8d00  0c fa 03	  tsb $03fa
$0c:8d03  1e 80 e7	  asl $e780,x
$0c:8d06  30 79		 bmi $8d81
$0c:8d08  8c 3e 43	  sty $433e
$0c:8d0b  1f a0 cf d4   ora $d4cfa0,x
$0c:8d0f  10 c6		 bpl $8cd7
$0c:8d11  87 0c		 sta [$0c]
$0c:8d13  01 dc		 ora ($dc,x)
$0c:8d15  18			clc
$0c:8d16  c6 87		 dec $87
$0c:8d18  08			php
$0c:8d19  ff 8e 1f f3   sbc $f31f8e,x
$0c:8d1d  68			pla
$0c:8d1e  84 1f		 sty $1f
$0c:8d20  f6 d5		 inc $d5,x
$0c:8d22  08			php
$0c:8d23  1f f5 b2 10   ora $10b2f5,x
$0c:8d27  1f fc 0d bc   ora $bc0dfc,x
$0c:8d2b  ed d0 74	  sbc $74d0
$0c:8d2e  94 6b		 sty $6b,x
$0c:8d30  f7 32		 sbc [$32],y
$0c:8d32  f9 f9 3c	  sbc $3cf9,y
$0c:8d35  f1 c8		 sbc ($c8),y
$0c:8d37  e7 5b		 sbc [$5b]
$0c:8d39  fd 30 f8	  sbc $f830,x
$0c:8d3c  61 33		 adc ($33,x)
$0c:8d3e  9c af d4	  stz $d4af
$0c:8d41  12 01		 ora ($01)
$0c:8d43  0c 80 46	  tsb $4680
$0c:8d46  20 1e 31	  jsr $311e
$0c:8d49  e0 a0 82	  cpx #$82a0
$0c:8d4c  c7 00		 cmp [$00]
$0c:8d4e  82 a1 c3	  brl $50f2
$0c:8d51  ff df ef ef   sbc $efefdf,x
$0c:8d55  f7 f9		 sbc [$f9],y
$0c:8d57  4c a0 3c	  jmp $3ca0
$0c:8d5a  02 e9		 cop #$e9
$0c:8d5c  00 0f		 brk #$0f
$0c:8d5e  84 82		 sty $82
$0c:8d60  01 40		 ora ($40,x)
$0c:8d62  c8			iny
$0c:8d63  5a			phy
$0c:8d64  c3 e2		 cmp $e2,s
$0c:8d66  27 30		 and [$30]
$0c:8d68  78			sei
$0c:8d69  7f 7f a1 30   adc $30a17f,x
$0c:8d6d  ee 77 02	  inc $0277
$0c:8d70  e5 ef		 sbc $ef
$0c:8d72  f7 87		 sbc [$87],y
$0c:8d74  4e 04 23	  lsr $2304
$0c:8d77  08			php
$0c:8d78  04 8c		 tsb $8c
$0c:8d7a  4e 71 01	  lsr $0171
$0c:8d7d  00 56		 brk #$56
$0c:8d7f  70 82		 bvs $8d03
$0c:8d81  00 97		 brk #$97
$0c:8d83  66 7a		 ror $7a
$0c:8d85  92 bd		 sta ($bd)
$0c:8d87  2d 6a 6b	  and $6b6a
$0c:8d8a  ce b1 e3	  dec $e3b1
$0c:8d8d  2a			rol a
$0c:8d8e  5a			phy
$0c:8d8f  d6 01		 dec $01,x
$0c:8d91  98			tya
$0c:8d92  27 c7		 and [$c7]
$0c:8d94  18			clc
$0c:8d95  8c 44 3a	  sty $3a44
$0c:8d98  71 ca		 adc ($ca),y
$0c:8d9a  d6 76		 dec $76,x
$0c:8d9c  31 df		 and ($df),y
$0c:8d9e  9a			txs
$0c:8d9f  f6 a9		 inc $a9,x
$0c:8da1  bc ad 5f	  ldy $5fad,x
$0c:8da4  31 80		 and ($80),y
$0c:8da6  5e f4 13	  lsr $13f4,x
$0c:8da9  44 3c f1	  mvp $f1,$3c
$0c:8dac  0a			asl a
$0c:8dad  05 fe		 ora $fe
$0c:8daf  27 ff		 and [$ff]
$0c:8db1  c8			iny
$0c:8db2  67 ed		 adc [$ed]
$0c:8db4  b7 d8		 lda [$d8],y
$0c:8db6  9f ce 4d 27   sta $274dce,x
$0c:8dba  c0 e0 68	  cpy #$68e0
$0c:8dbd  97 cc		 sta [$cc],y
$0c:8dbf  00 7c		 brk #$7c
$0c:8dc1  6c 10 0c	  jmp ($0c10)
$0c:8dc4  10 00		 bpl $8dc6
$0c:8dc6  7b			tdc
$0c:8dc7  10 0b		 bpl $8dd4
$0c:8dc9  f4 03 07	  pea $0703
$0c:8dcc  00 c0		 brk #$c0
$0c:8dce  ff f8 9f f8   sbc $f89ff8,x
$0c:8dd2  af de 61 fe   lda $fe61de
$0c:8dd6  c1 ac		 cmp ($ac,x)
$0c:8dd8  83 fb		 sta $fb,s
$0c:8dda  b1 ff		 lda ($ff),y
$0c:8ddc  cf 37 e2 72   cmp $72e237
$0c:8de0  84 01		 sty $01
$0c:8de2  84 80		 sty $80
$0c:8de4  42 00		 wdm #$00
$0c:8de6  22 07 ef 39   jsl $39ef07
$0c:8dea  9d d3 53	  sta $53d3,x
$0c:8ded  7a			ply
$0c:8dee  33 2f		 and ($2f,s),y
$0c:8df0  e7 82		 sbc [$82]
$0c:8df2  3f 80 c0 5f   and $5fc080,x
$0c:8df6  e0 17 ff	  cpx #$ff17
$0c:8df9  fe 7e 01	  inc $017e,x
$0c:8dfc  87 a0		 sta [$a0]
$0c:8dfe  70 64		 bvs $8e64
$0c:8e00  5f 08 0f fe   eor $fe0f08,x
$0c:8e04  00 da		 brk #$da
$0c:8e06  14 f8		 trb $f8
$0c:8e08  f6 4a		 inc $4a,x
$0c:8e0a  01 40		 ora ($40,x)
$0c:8e0c  f7 56		 sbc [$56],y
$0c:8e0e  72 90		 adc ($90)
$0c:8e10  b9 ae ab	  lda $abae,y
$0c:8e13  0b			phd
$0c:8e14  8e 99 ef	  stx $ef99
$0c:8e17  3b			tsc
$0c:8e18  5d d7 38	  eor $38d7,x
$0c:8e1b  5f f0 0e 70   eor $700ef0,x
$0c:8e1f  cf d8 33 f4   cmp $f433d8
$0c:8e23  0c 7d c3	  tsb $c37d
$0c:8e26  5f 40 e7 c8   eor $c8e740,x
$0c:8e2a  3c 70 6c	  bit $6c70,x
$0c:8e2d  ec 1b 51	  cpx $511b
$0c:8e30  de a0 5f	  dec $5fa0,x
$0c:8e33  93 c5		 sta ($c5,s),y
$0c:8e35  fe 0d 07	  inc $070d,x
$0c:8e38  fd ce 01	  sbc $01ce,x
$0c:8e3b  f2 00		 sbc ($00)
$0c:8e3d  92 00		 sta ($00)
$0c:8e3f  58			cli
$0c:8e40  a2 42 08	  ldx #$0842
$0c:8e43  24 02		 bit $02
$0c:8e45  13 01		 ora ($01,s),y
$0c:8e47  85 c0		 sta $c0
$0c:8e49  e2 d0		 sep #$d0
$0c:8e4b  78			sei
$0c:8e4c  34 1e		 bit $1e,x
$0c:8e4e  19 0f 96	  ora $960f,y
$0c:8e51  43 e0		 eor $e0,s
$0c:8e53  10 38		 bpl $8e8d
$0c:8e55  04 1e		 tsb $1e
$0c:8e57  03 0e		 ora $0e,s
$0c:8e59  81 c3		 sta ($c3,x)
$0c:8e5b  20 f1 82	  jsr $82f1
$0c:8e5e  38			sec
$0c:8e5f  43 e2		 eor $e2,s
$0c:8e61  10 f9		 bpl $8e5c
$0c:8e63  85 e6		 sta $e6
$0c:8e65  fd f3 fe	  sbc $fef3,x
$0c:8e68  70 ff		 bvs $8e69
$0c:8e6a  90 1f		 bcc $8e8b
$0c:8e6c  f4 cc fc	  pea $fccc
$0c:8e6f  21 b0		 and ($b0,x)
$0c:8e71  f0 80		 beq $8df3
$0c:8e73  0c c3 5c	  tsb $5cc3
$0c:8e76  e9 f7 e6	  sbc #$e6f7
$0c:8e79  0f d6 87 69   ora $6987d6
$0c:8e7d  23 9e		 and $9e,s
$0c:8e7f  48			pha
$0c:8e80  e5 12		 sbc $12
$0c:8e82  79 cc 9e	  adc $9ecc,y
$0c:8e85  46 7f		 lsr $7f
$0c:8e87  3f e7 30 9f   and $9f30e7,x
$0c:8e8b  c3 f9		 cmp $f9,s
$0c:8e8d  03 42		 ora $42,s
$0c:8e8f  a7 e6		 lda [$e6]
$0c:8e91  0d 2e 87	  ora $872e
$0c:8e94  4d 20 b6	  eor $b620
$0c:8e97  88			dey
$0c:8e98  5d 08 24	  eor $2408,x
$0c:8e9b  12 4b		 ora ($4b)
$0c:8e9d  ad b3 a7	  lda $a7b3
$0c:8ea0  c9 a8 f3	  cmp #$f3a8
$0c:8ea3  e1 df		 sbc ($df,x)
$0c:8ea5  18			clc
$0c:8ea6  27 ee		 and [$ee]
$0c:8ea8  11 f7		 ora ($f7),y
$0c:8eaa  73 04		 adc ($04,s),y
$0c:8eac  8f bf 63 cf   sta $cf63bf
$0c:8eb0  f1 a7		 sbc ($a7),y
$0c:8eb2  fc 09 fc	  jsr ($fc09,x)
$0c:8eb5  c3 ff		 cmp $ff,s
$0c:8eb7  50 ef		 bvc $8ea8
$0c:8eb9  e4 33		 cpx $33
$0c:8ebb  f2 88		 sbc ($88)
$0c:8ebd  ff 6a 7f 7a   sbc $7a7f6a,x
$0c:8ec1  df f1 a9 f6   cmp $f6a9f1,x
$0c:8ec5  c8			iny
$0c:8ec6  f9 b0 24	  sbc $24b0,y
$0c:8ec9  1f fb 07 ff   ora $ff07fb,x
$0c:8ecd  c1 ff		 cmp ($ff,x)
$0c:8ecf  e0 7f		 cpx #$7f
$0c:8ed1  c0 40		 cpy #$40
$0c:8ed3  af 06 28 18   lda $182806
$0c:8ed7  ad b5 e6	  lda $e6b5
$0c:8eda  c0 d1		 cpy #$d1
$0c:8edc  fc 7a db	  jsr ($db7a,x)
$0c:8edf  ba			tsx
$0c:8ee0  a7 5a		 lda [$5a]
$0c:8ee2  fd 7f fd	  sbc $fd7f,x
$0c:8ee5  7e e5 fc	  ror $fce5,x
$0c:8ee8  fa			plx
$0c:8ee9  ed f7 df	  sbc $dff7
$0c:8eec  ef ef c7 fd   sbc $fdc7ef
$0c:8ef0  f0 ce		 beq $8ec0
$0c:8ef2  1c a2 03	  trb $03a2
$0c:8ef5  80 80		 bra $8e77
$0c:8ef7  c1 3c		 cmp ($3c,x)
$0c:8ef9  31 0b		 and ($0b),y
$0c:8efb  06 0b		 asl $0b
$0c:8efd  d1 10		 cmp ($10),y
$0c:8eff  ac d6 7f	  ldy $7fd6
$0c:8f02  ff fb f8 4c   sbc $4cf8fb,x
$0c:8f06  42 21		 wdm #$21
$0c:8f08  f7 fb		 sbc [$fb],y
$0c:8f0a  e7 33		 sbc [$33]
$0c:8f0c  81 70		 sta ($70,x)
$0c:8f0e  84 69		 sty $69
$0c:8f10  a0 02		 ldy #$02
$0c:8f12  10 c0		 bpl $8ed4
$0c:8f14  08			php
$0c:8f15  c4 42		 cpy $42
$0c:8f17  10 8c		 bpl $8ea5
$0c:8f19  e5 8c		 sbc $8c
$0c:8f1b  42 19		 wdm #$19
$0c:8f1d  ac d0 5c	  ldy $5cd0
$0c:8f20  02 25		 cop #$25
$0c:8f22  77 bb		 adc [$bb],y
$0c:8f24  85 c3		 sta $c3
$0c:8f26  5d be f5	  eor $f5be,x
$0c:8f29  fa			plx
$0c:8f2a  e0 16		 cpx #$16
$0c:8f2c  51 10		 eor ($10),y
$0c:8f2e  10 44		 bpl $8f74
$0c:8f30  48			pha
$0c:8f31  18			clc
$0c:8f32  81 10		 sta ($10,x)
$0c:8f34  6f a8 30 08   adc $0830a8
$0c:8f38  a5 27		 lda $27
$0c:8f3a  ff 55 dd eb   sbc $ebdd55,x
$0c:8f3e  2e 62 f0	  rol $f062
$0c:8f41  ba			tsx
$0c:8f42  dd 79 b0	  cmp $b079,x
$0c:8f45  ab			plb
$0c:8f46  d7 7e		 cmp [$7e],y
$0c:8f48  ab			plb
$0c:8f49  f7 6f		 sbc [$6f],y
$0c:8f4b  26 68		 rol $68
$0c:8f4d  80 18		 bra $8f67
$0c:8f4f  af 7c 43 df   lda $df437c
$0c:8f53  00 f3		 brk #$f3
$0c:8f55  c2 32		 rep #$32
$0c:8f57  5d 59 ef	  eor $ef59,x
$0c:8f5a  6f 89 23 ab   adc $ab2389
$0c:8f5e  55 83		 eor $83,x
$0c:8f60  21 8d		 and ($8d,x)
$0c:8f62  b8			clv
$0c:8f63  55 7d		 eor $7d,x
$0c:8f65  f3 ce		 sbc ($ce,s),y
$0c:8f67  79 b4 0d	  adc $0db4,y
$0c:8f6a  63 18		 adc $18,s
$0c:8f6c  a3 6a		 lda $6a,s
$0c:8f6e  45 20		 eor $20
$0c:8f70  de 4b 65	  dec $654b,x
$0c:8f73  bf ab d7 c2   lda $c2d7ab,x
$0c:8f77  e1 73		 sbc ($73,x)
$0c:8f79  39 f9 24	  and $24f9,y
$0c:8f7c  f3 41		 sbc ($41,s),y
$0c:8f7e  e0 e0 f0	  cpx #$f0e0
$0c:8f81  60			rts
$0c:8f82  d0 7c		 bne $9000
$0c:8f84  84 02		 sty $02
$0c:8f86  51 00		 eor ($00),y
$0c:8f88  bd 40 2c	  lda $2c40,x
$0c:8f8b  10 0e		 bpl $8f9b
$0c:8f8d  1c 01 7c	  trb $7c01
$0c:8f90  13 e8		 ora ($e8,s),y
$0c:8f92  07 e2		 ora [$e2]
$0c:8f94  01 69		 ora ($69,x)
$0c:8f96  bc ed b6	  ldy $b6ed,x
$0c:8f99  d0 b8		 bne $8f53
$0c:8f9b  7c d6 7b	  jmp ($7bd6,x)
$0c:8f9e  de ff f1	  dec $f1ff,x
$0c:8fa1  78			sei
$0c:8fa2  f1 88		 sbc ($88),y
$0c:8fa4  fd ce ff	  sbc $ffce,x
$0c:8fa7  86 80		 stx $80
$0c:8fa9  52 60		 eor ($60)
$0c:8fab  1f 08 07 08   ora $080708,x
$0c:8faf  82 33 88	  brl $17e5
$0c:8fb2  07 80		 ora [$80]
$0c:8fb4  46 35		 lsr $35
$0c:8fb6  6b			rtl
$0c:8fb7  f6 37		 inc $37,x
$0c:8fb9  fb			xce
$0c:8fba  b0 f8		 bcs $8fb4
$0c:8fbc  66 33		 ror $33
$0c:8fbe  f3 1f		 sbc ($1f,s),y
$0c:8fc0  fd 8f c7	  sbc $c78f,x
$0c:8fc3  cc e7 cd	  cpy $cde7
$0c:8fc6  66 f8		 ror $f8
$0c:8fc8  18			clc
$0c:8fc9  04 0a		 tsb $0a
$0c:8fcb  01 0f		 ora ($0f,x)
$0c:8fcd  52 08		 eor ($08)
$0c:8fcf  88			dey
$0c:8fd0  23 90		 and $90,s
$0c:8fd2  09 84 03	  ora #$0384
$0c:8fd5  90 ae		 bcc $8f85
$0c:8fd7  0f 7e a6 57   ora $57a67e
$0c:8fdb  34 db		 bit $db,x
$0c:8fdd  cd f6 fa	  cmp $faf6
$0c:8fe0  bd dd 6f	  lda $6fdd,x
$0c:8fe3  b7 f6		 lda [$f6],y
$0c:8fe5  bf 65 e7 fe   lda $fee765,x
$0c:8fe9  78			sei
$0c:8fea  86 8e		 stx $8e
$0c:8fec  a9 b3 a4	  lda #$a4b3
$0c:8fef  6c 69 1b	  jmp ($1b69)
$0c:8ff2  8a			txa
$0c:8ff3  27 66		 and [$66]
$0c:8ff5  49 fc 80	  eor #$80fc
$0c:8ff8  ef 28 10 00   sbc $001028
$0c:8ffc  7c c0 5c	  jmp ($5cc0,x)
$0c:8fff  02 1e		 cop #$1e
$0c:9001  b0 d8		 bcs $8fdb
$0c:9003  40			rti
$0c:9004  e5 90		 sbc $90
$0c:9006  f9 34 1c	  sbc $1c34,y
$0c:9009  62 13 38	  per $c81f
$0c:900c  1d 86 03	  ora $0386,x
$0c:900f  8c 87 dc	  sty $dc87
$0c:9012  ef 9c 7f c4   sbc $c47f9c
$0c:9016  3e 61 07	  rol $0761,x
$0c:9019  9c 10 42	  stz $4210
$0c:901c  07 3c		 ora [$3c]
$0c:901e  80 df		 bra $8fff
$0c:9020  a1 ff		 lda ($ff,x)
$0c:9022  0b			phd
$0c:9023  fe 00 be	  inc $be00,x
$0c:9026  0a			asl a
$0c:9027  70 a7		 bvs $8fd0
$0c:9029  60			rts
$0c:902a  6f 18 79 07   adc $077918
$0c:902e  7e 07 ff	  ror $ff07,x
$0c:9031  df df e7 ff   cmp $ffe7df,x
$0c:9035  f9 77 bd	  sbc $bd77,y
$0c:9038  12 85		 ora ($85)
$0c:903a  f6 f7		 inc $f7,x
$0c:903c  c4 2e		 cpy $2e
$0c:903e  5f 3b 17 8f   eor $8f173b,x
$0c:9042  8b			phb
$0c:9043  c1 e1		 cmp ($e1,x)
$0c:9045  f0 7f		 beq $90c6
$0c:9047  3f 8f f7 fa   and $faf78f,x
$0c:904b  3f ff b3 e7   and $e7b3ff,x
$0c:904f  fe 70 cf	  inc $cf70,x
$0c:9052  1c 73 83	  trb $8373
$0c:9055  3e 41 87	  rol $8741,x
$0c:9058  e2 0f		 sep #$0f
$0c:905a  fe 80 97	  inc $9780,x
$0c:905d  cb			wai
$0c:905e  ab			plb
$0c:905f  4c b9 5a	  jmp $5ab9
$0c:9062  6d 1a 4c	  adc $4c1a
$0c:9065  af cf 95 f9   lda $f995cf
$0c:9069  d1 4f		 cmp ($4f),y
$0c:906b  b5 98		 lda $98,x
$0c:906d  f9 5f 8f	  sbc $8f5f,y
$0c:9070  86 fe		 stx $fe
$0c:9072  08			php
$0c:9073  ff 8e 3f f0   sbc $f03f8e,x
$0c:9077  87 a1		 sta [$a1]
$0c:9079  c1 08		 cmp ($08,x)
$0c:907b  18			clc
$0c:907c  fb			xce
$0c:907d  82 04 23	  brl $b384
$0c:9080  bf ff 1f 9e   lda $9e1fff,x
$0c:9084  95 d7		 sta $d7,x
$0c:9086  fd 76 f6	  sbc $f676,x
$0c:9089  b8			clv
$0c:908a  1e 24 f3	  asl $f324,x
$0c:908d  6f 70 ed 79   adc $79ed70
$0c:9091  b8			clv
$0c:9092  1f fc c7 fe   ora $fec7fc,x
$0c:9096  71 ff		 adc ($ff),y
$0c:9098  9a			txs
$0c:9099  7f ed df f2   adc $f2dfed,x
$0c:909d  b8			clv
$0c:909e  29 41 12	  and #$1241
$0c:90a1  10 02		 bpl $90a5
$0c:90a3  f8			sed
$0c:90a4  93 01		 sta ($01,s),y
$0c:90a6  a6 4d		 ldx $4d
$0c:90a8  10 68		 bpl $9112
$0c:90aa  85 82		 sta $82
$0c:90ac  3e d9 26	  rol $26d9,x
$0c:90af  fd bb d6	  sbc $d6bb,x
$0c:90b2  03 01		 ora $01,s
$0c:90b4  81 c1		 sta ($c1,x)
$0c:90b6  21 d0		 and ($d0,x)
$0c:90b8  48			pha
$0c:90b9  64 11		 stz $11
$0c:90bb  de f0 08	  dec $08f0,x
$0c:90be  3c 02 16	  bit $1602,x
$0c:90c1  0a			asl a
$0c:90c2  17 b0		 ora [$b0],y
$0c:90c4  c0 a0 90	  cpy #$90a0
$0c:90c7  8b			phb
$0c:90c8  76 3f		 ror $3f,x
$0c:90ca  51 3f		 eor ($3f),y
$0c:90cc  b0 df		 bcs $90ad
$0c:90ce  f8			sed
$0c:90cf  df fa e5 fd   cmp $fde5fa,x
$0c:90d3  9c 10 38	  stz $3810
$0c:90d6  04 3e		 tsb $3e
$0c:90d8  01 f0		 ora ($f0,x)
$0c:90da  80 70		 bra $914c
$0c:90dc  20 18 07	  jsr $0718
$0c:90df  78			sei
$0c:90e0  8a			txa
$0c:90e1  43 01		 eor $01,s
$0c:90e3  40			rti
$0c:90e4  b0 74		 bcs $915a
$0c:90e6  25 9e		 and $9e
$0c:90e8  b9 b7 f2	  lda $f2b7,y
$0c:90eb  1b			tcs
$0c:90ec  fb			xce
$0c:90ed  2b			pld
$0c:90ee  81 30		 sta ($30,x)
$0c:90f0  28			plp
$0c:90f1  1f f1 38 4c   ora $4c38f1,x
$0c:90f5  20 0d e0	  jsr $e00d
$0c:90f8  11 80		 ora ($80),y
$0c:90fa  24 09		 bit $09
$0c:90fc  17 80		 ora [$80],y
$0c:90fe  2b			pld
$0c:90ff  0d 03 41	  ora $4103
$0c:9102  e0 80 17	  cpx #$1780
$0c:9105  00 a2		 brk #$a2
$0c:9107  82 81 13	  brl $a48b
$0c:910a  85 80		 sta $80
$0c:910c  d4 38		 pei ($38)
$0c:910e  ef f4 db ef   sbc $efdbf4
$0c:9112  cd 87 e5	  cmp $e587
$0c:9115  23 94		 and $94,s
$0c:9117  1a			inc a
$0c:9118  0d 9e 4f	  ora $4f9e
$0c:911b  c4 a3		 cpy $a3
$0c:911d  79 a8 cc	  adc $cca8,y
$0c:9120  e0 84 09	  cpx #$0984
$0c:9123  07 c7		 ora [$c7]
$0c:9125  c0 df 70	  cpy #$70df
$0c:9128  3b			tsc
$0c:9129  1c 0d ca	  trb $ca0d
$0c:912c  28			plp
$0c:912d  6b			rtl
$0c:912e  b9 7c ee	  lda $ee7c,y
$0c:9131  be 13 2f	  ldx $2f13,y
$0c:9134  ed cf f7	  sbc $f7cf
$0c:9137  f7 fe		 sbc [$fe],y
$0c:9139  8d 5b 61	  sta $615b
$0c:913c  bb			tyx
$0c:913d  be df fd	  ldx $fddf,y
$0c:9140  ff 85 d8 79   sbc $79d885,x
$0c:9144  e2 1e		 sep #$1e
$0c:9146  72 e8		 adc ($e8)
$0c:9148  f1 e5		 sbc ($e5),y
$0c:914a  18			clc
$0c:914b  ba			tsx
$0c:914c  24 bc		 bit $bc
$0c:914e  ac 0d 01	  ldy $010d
$0c:9151  88			dey
$0c:9152  7f e4 1f f8   adc $f81fe4,x
$0c:9156  13 60		 ora ($60,s),y
$0c:9158  d6 60		 dec $60,x
$0c:915a  48			pha
$0c:915b  c7 a8		 cmp [$a8]
$0c:915d  65 ea		 adc $ea
$0c:915f  14 7f		 trb $7f
$0c:9161  45 f7		 eor $f7
$0c:9163  6d 70 de	  adc $de70
$0c:9166  67 2f		 adc [$2f]
$0c:9168  fd 9b f5	  sbc $f59b,x
$0c:916b  ae 3b a5	  ldx $a53b
$0c:916e  f4 c4 35	  pea $35c4
$0c:9171  10 f8		 bpl $916b
$0c:9173  81 1c		 sta ($1c,x)
$0c:9175  60			rts
$0c:9176  74 08		 stz $08,x
$0c:9178  03 9c		 ora $9c,s
$0c:917a  20 38 0d	  jsr $0d38
$0c:917d  0c 4b 55	  tsb $554b
$0c:9180  25 89		 and $89
$0c:9182  c2 38		 rep #$38
$0c:9184  f2 ad		 sbc ($ad)
$0c:9186  6e 5e b5	  ror $b55e
$0c:9189  9d c3 fe	  sta $fec3,x
$0c:918c  35 3c		 and $3c,x
$0c:918e  29 9f 0a	  and #$0a9f
$0c:9191  79 41 fc	  adc $fc41,y
$0c:9194  41 3c		 eor ($3c,x)
$0c:9196  51 0c		 eor ($0c),y
$0c:9198  3d 02 3e	  and $3e02,x
$0c:919b  b5 05		 lda $05,x
$0c:919d  88			dey
$0c:919e  02 86		 cop #$86
$0c:91a0  05 00		 ora $00
$0c:91a2  82 c0 42	  brl $d465
$0c:91a5  21 03		 and ($03,x)
$0c:91a7  0a			asl a
$0c:91a8  9c 2c 34	  stz $342c
$0c:91ab  2e 50 80	  rol $8050
$0c:91ae  c1 84		 cmp ($84,x)
$0c:91b0  21 03		 and ($03,x)
$0c:91b2  82 09 4e	  brl $dfbe
$0c:91b5  18			clc
$0c:91b6  2b			pld
$0c:91b7  0c d7 87	  tsb $87d7
$0c:91ba  6d c1 b3	  adc $b3c1
$0c:91bd  60			rts
$0c:91be  6f d8 19 e7   adc $e719d8
$0c:91c2  0e 21 ef	  asl $ef21
$0c:91c5  58			cli
$0c:91c6  84 07		 sty $07
$0c:91c8  fe 09 41	  inc $4109,x
$0c:91cb  fc 59 3c	  jsr ($3c59,x)
$0c:91ce  f7 3f		 sbc [$3f],y
$0c:91d0  9d 83 c1	  sta $c183,x
$0c:91d3  64 f1		 stz $f1
$0c:91d5  d2 78		 cmp ($78)
$0c:91d7  d5 2e		 cmp $2e,x
$0c:91d9  67 a7		 adc [$a7]
$0c:91db  ad a8 c3	  lda $c3a8
$0c:91de  f9 e3 1f	  sbc $1fe3,y
$0c:91e1  38			sec
$0c:91e2  67 82		 adc [$82]
$0c:91e4  3e 63 0e	  rol $0e63,x
$0c:91e7  04 fc		 tsb $fc
$0c:91e9  ce 58 0b	  dec $0b58
$0c:91ec  ff 62 0f 07   sbc $070f62,x
$0c:91f0  fc 4e 27	  jsr ($274e,x)
$0c:91f3  f6 8c		 inc $8c,x
$0c:91f5  7d 52 4f	  adc $4f52,x
$0c:91f8  ce eb da	  dec $daeb
$0c:91fb  ac 7a b9	  ldy $b97a
$0c:91fe  18			clc
$0c:91ff  24 8d		 bit $8d
$0c:9201  01 0f		 ora ($0f,x)
$0c:9203  f8			sed
$0c:9204  1c 43 8f	  trb $8f43
$0c:9207  38			sec
$0c:9208  b1 e7		 lda ($e7),y
$0c:920a  24 7d		 bit $7d
$0c:920c  cf 54 63 37   cmp $376354
$0c:9210  06 f8		 asl $f8
$0c:9212  c3 ec		 cmp $ec,s
$0c:9214  79 f8 77	  adc $77f8,y
$0c:9217  fa			plx
$0c:9218  7f fe fe 7f   adc $7ffefe,x
$0c:921c  7d fe cf	  adc $cffe,x
$0c:921f  c4 1f		 cpy $1f
$0c:9221  fc 3d 00	  jsr ($003d,x)
$0c:9224  50 a8		 bvc $91ce
$0c:9226  41 42		 eor ($42,x)
$0c:9228  1f c8 1f b2   ora $b21fc8,x
$0c:922c  27 7d		 and [$7d]
$0c:922e  bf 63 e1 fb   lda $fbe163,x
$0c:9232  1a			inc a
$0c:9233  0e 6e c9	  asl $c96e
$0c:9236  46 cf		 lsr $cf
$0c:9238  54 73 fa	  mvn $fa,$73
$0c:923b  39 e5 36	  and $36e5,y
$0c:923e  e5 7f		 sbc $7f
$0c:9240  c0 21 41	  cpy #$4121
$0c:9243  50 03		 bvc $9248
$0c:9245  b0 8f		 bcs $91d6
$0c:9247  78			sei
$0c:9248  4c 80 68	  jmp $6880
$0c:924b  05 f8		 ora $f8
$0c:924d  5a			phy
$0c:924e  fc 95 5c	  jsr ($5c95,x)
$0c:9251  86 bb		 stx $bb
$0c:9253  95 57		 sta $57,x
$0c:9255  b2 f4		 lda ($f4)
$0c:9257  6c b5 29	  jmp ($29b5)
$0c:925a  5c 93 6f eb   jml $eb6f93
$0c:925e  a6 98		 ldx $98
$0c:9260  c3 e1		 cmp $e1,s
$0c:9262  0f fd 41 6f   ora $6f41fd
$0c:9266  b8			clv
$0c:9267  27 28		 and [$28]
$0c:9269  4e f8 9b	  lsr $9bf8
$0c:926c  7a			ply
$0c:926d  47 3e		 eor [$3e]
$0c:926f  61 07		 adc ($07,x)
$0c:9271  84 41		 sty $41
$0c:9273  a1 f0		 lda ($f0,x)
$0c:9275  68			pla
$0c:9276  3c 0e 0a	  bit $0a0e,x
$0c:9279  f5 00		 sbc $00,x
$0c:927b  a0 3e 46	  ldy #$463e
$0c:927e  03 0f		 ora $0f,s
$0c:9280  80 3f		 bra $92c1
$0c:9282  c2 0e		 rep #$0e
$0c:9284  02 30		 cop #$30
$0c:9286  f0 c0		 beq $9248
$0c:9288  20 30 0b	  jsr $0b30
$0c:928b  05 be		 ora $be
$0c:928d  41 2f		 eor ($2f,x)
$0c:928f  94 4b		 sty $4b,x
$0c:9291  e2 d9		 sep #$d9
$0c:9293  7d 5f 2e	  adc $2e5f,x
$0c:9296  87 e3		 sta [$e3]
$0c:9298  db			stp
$0c:9299  5b			tcd
$0c:929a  28			plp
$0c:929b  7c 7c 84	  jmp ($847c,x)
$0c:929e  03 a0		 ora $a0,s
$0c:92a0  20 1f 44	  jsr $441f
$0c:92a3  03 e9		 ora $e9,s
$0c:92a5  00 fe		 brk #$fe
$0c:92a7  29 08 18	  and #$1808
$0c:92aa  1f fa 2f f2   ora $f22ffa,x
$0c:92ae  49 3b f2	  eor #$f23b
$0c:92b1  7c 37 3f	  jmp ($3f37,x)
$0c:92b4  19 1f 8e	  ora $8e1f,y
$0c:92b7  51 ef		 eor ($ef),y
$0c:92b9  a9 a0 40	  lda #$40a0
$0c:92bc  10 3c		 bpl $92fa
$0c:92be  70 00		 bvs $92c0
$0c:92c0  c3 a0		 cmp $a0,s
$0c:92c2  11 c8		 ora ($c8),y
$0c:92c4  04 40		 tsb $40
$0c:92c6  7e 10 09	  ror $0910,x
$0c:92c9  85 c2		 sta $c2
$0c:92cb  81 f0		 sta ($f0,x)
$0c:92cd  8a			txa
$0c:92ce  43 3e		 eor $3e,s
$0c:92d0  df 2f d7 eb   cmp $ebd72f,x
$0c:92d4  31 fa		 and ($fa),y
$0c:92d6  c8			iny
$0c:92d7  7c 66 9f	  jmp ($9f66,x)
$0c:92da  5f 84 00 be   eor $be0084,x
$0c:92de  02 90		 cop #$90
$0c:92e0  23 84		 and $84,s
$0c:92e2  18			clc
$0c:92e3  cc 2f f0	  cpy $f02f
$0c:92e6  85 89		 sta $89
$0c:92e8  83 b9		 sta $b9,s
$0c:92ea  93 f9		 sta ($f9,s),y
$0c:92ec  e0 30		 cpx #$30
$0c:92ee  10 b8		 bpl $92a8
$0c:92f0  0c 76 07	  tsb $0776
$0c:92f3  c5 e1		 cmp $e1
$0c:92f5  4b			phk
$0c:92f6  a7 b1		 lda [$b1]
$0c:92f8  3c c6 8e	  bit $8ec6,x
$0c:92fb  81 4c		 sta ($4c,x)
$0c:92fd  80 5f		 bra $935e
$0c:92ff  d4 87		 pei ($87)
$0c:9301  3d 81 f1	  and $f181,x
$0c:9304  e0 7e		 cpx #$7e
$0c:9306  f8			sed
$0c:9307  3f 77 bb b2   and $b2bb77,x
$0c:930b  d9 40 38	  cmp $3840,y
$0c:930e  19 58 ec	  ora $ec58,y
$0c:9311  8e 47 c6	  stx $c647
$0c:9314  a3 52		 lda $52,s
$0c:9316  f9 7b 48	  sbc $487b,y
$0c:9319  bc 8a 01	  ldy $018a,x
$0c:931c  4d 15 05	  eor $0515
$0c:931f  03 c5		 ora $c5,s
$0c:9321  c0 ee		 cpy #$ee
$0c:9323  70 37		 bvs $935c
$0c:9325  3c 0d a7	  bit $a70d,x
$0c:9328  03 d1		 ora $d1,s
$0c:932a  c0 26		 cpy #$26
$0c:932c  0a			asl a
$0c:932d  bc c1 a1	  ldy $a1c1,x
$0c:9330  02 80		 cop #$80
$0c:9332  41 0d		 eor ($0d,x)
$0c:9334  80 09		 bra $933f
$0c:9336  05 7c		 ora $7c
$0c:9338  02 41		 cop #$41
$0c:933a  e8			inx
$0c:933b  10 c5		 bpl $9302
$0c:933d  7a			ply
$0c:933e  60			rts
$0c:933f  20 14 0c	  jsr $0c14
$0c:9342  04 81		 tsb $81
$0c:9344  26 1c		 rol $1c
$0c:9346  09 82 bd	  ora #$bd82
$0c:9349  95 c0		 sta $c0,x
$0c:934b  ae 0f 07	  ldx $070f
$0c:934e  01 b2		 ora ($b2,x)
$0c:9350  06 10		 asl $10
$0c:9352  57 ac		 eor [$ac],y
$0c:9354  0a			asl a
$0c:9355  05 05		 ora $05
$0c:9357  83 c0		 sta $c0,s
$0c:9359  a0 70		 ldy #$70
$0c:935b  e5 f3		 sbc $f3
$0c:935d  c0 a0		 cpy #$a0
$0c:935f  30 72		 bmi $93d3
$0c:9361  00 41		 brk #$41
$0c:9363  19 a0 bd	  ora $bda0,y
$0c:9366  09 4c 47	  ora #$474c
$0c:9369  d9 10 82	  cmp $8210,y
$0c:936c  42 33		 wdm #$33
$0c:936e  71 8a		 adc ($8a),y
$0c:9370  24 f3		 bit $f3
$0c:9372  5b			tcd
$0c:9373  b3 a9		 lda ($a9,s),y
$0c:9375  f7 19		 sbc [$19],y
$0c:9377  a1 01		 lda ($01,x)
$0c:9379  9f 21 07 ff   sta $ff0721,x
$0c:937d  18			clc
$0c:937e  f3 cf		 sbc ($cf,s),y
$0c:9380  38			sec
$0c:9381  7b			tdc
$0c:9382  fa			plx
$0c:9383  07 7e		 ora [$7e]
$0c:9385  41 86		 eor ($86,x)
$0c:9387  ff 66 7f 3b   sbc $3b7f66,x
$0c:938b  4f bf 33 9f   eor $9f33bf
$0c:938f  1a			inc a
$0c:9390  8e cb 66	  stx $66cb
$0c:9393  7e 3f fc	  ror $fc3f,x
$0c:9396  ff fe 87 0f   sbc $0f87fe,x
$0c:939a  cc 1b ef	  cpy $ef1b
$0c:939d  08			php
$0c:939e  e7 cc		 sbc [$cc]
$0c:93a0  23 fe		 and $fe,s
$0c:93a2  09 ff 00	  ora #$00ff
$0c:93a5  48			pha
$0c:93a6  30 08		 bmi $93b0
$0c:93a8  64 0b		 stz $0b
$0c:93aa  99 c2 ac	  sta $acc2,y
$0c:93ad  71 0a		 adc ($0a),y
$0c:93af  61 98		 adc ($98,x)
$0c:93b1  c2 6c		 rep #$6c
$0c:93b3  31 13		 and ($13),y
$0c:93b5  08			php
$0c:93b6  45 82		 eor $82
$0c:93b8  20 86 0e	  jsr $0e86
$0c:93bb  04 fb		 tsb $fb
$0c:93bd  81 3c		 sta ($3c,x)
$0c:93bf  31 86		 and ($86),y
$0c:93c1  02 f9		 cop #$f9
$0c:93c3  80 bc		 bra $9381
$0c:93c5  40			rti
$0c:93c6  3f 0e d0 aa   and $aad00e,x
$0c:93ca  e4 64		 cpx $64
$0c:93cc  b4 19		 ldy $19,x
$0c:93ce  35 02		 and $02,x
$0c:93d0  27 24		 and [$24]
$0c:93d2  8a			txa
$0c:93d3  48			pha
$0c:93d4  e1 51		 sbc ($51,x)
$0c:93d6  18			clc
$0c:93d7  2c 20 16	  bit $1620
$0c:93da  11 1f		 ora ($1f),y
$0c:93dc  74 06		 stz $06,x
$0c:93de  fd 00 bf	  sbc $bf00,x
$0c:93e1  c0 27		 cpy #$27
$0c:93e3  e8			inx
$0c:93e4  51 8f		 eor ($8f),y
$0c:93e6  c0 21		 cpy #$21
$0c:93e8  ec b0 e3	  cpx $e3b0
$0c:93eb  f1 f0		 sbc ($f0),y
$0c:93ed  d8			cld
$0c:93ee  78			sei
$0c:93ef  6c 3f 97	  jmp ($973f)
$0c:93f2  0e f7 c3	  asl $c3f7
$0c:93f5  6d d8 a9	  adc $a9d8
$0c:93f8  2f 03 5f 45   and $455f03
$0c:93fc  e3 ce		 sbc $ce,s
$0c:93fe  30 f7		 bmi $93f7
$0c:9400  88			dey
$0c:9401  7f c2 1d f1   adc $f11dc2,x
$0c:9405  86 7c		 stx $7c
$0c:9407  e1 3f		 sbc ($3f,x)
$0c:9409  78			sei
$0c:940a  17 fe		 ora [$fe],y
$0c:940c  03 fe		 ora $fe,s
$0c:940e  da			phx
$0c:940f  f2 21		 sbc ($21)
$0c:9411  3f 3f 54 ce   and $ce543f,x
$0c:9415  bb			tyx
$0c:9416  81 a2		 sta ($a2,x)
$0c:9418  5e b7 76	  lsr $76b7,x
$0c:941b  4b			phk
$0c:941c  4f 5f d5 ae   eor $aed55f
$0c:9420  25 91		 and $91
$0c:9422  24 23		 bit $23
$0c:9424  be 2f f6	  ldx $f62f,y
$0c:9427  06 cf		 asl $cf
$0c:9429  98			tya
$0c:942a  4f 86 3a e3   eor $e33a86
$0c:942e  72 fc		 adc ($fc)
$0c:9430  f9 72 5d	  sbc $5d72,y
$0c:9433  99 35 b3	  sta $b335,y
$0c:9436  bf 96 f9 c2   lda $c2f996,x
$0c:943a  ff 32 d9 ef   sbc $efd932,x
$0c:943e  76 3a		 ror $3a,x
$0c:9440  4b			phk
$0c:9441  22 59 7c e1   jsl $e17c59
$0c:9445  84 10		 sty $10
$0c:9447  9e f0 98	  stz $98f0,x
$0c:944a  a1 01		 lda ($01,x)
$0c:944c  77 9c		 adc [$9c],y
$0c:944e  01 e8		 ora ($e8,x)
$0c:9450  2e f0 81	  rol $81f0
$0c:9453  c0 a0		 cpy #$a0
$0c:9455  10 47		 bpl $949e
$0c:9457  a1 80		 lda ($80,x)
$0c:9459  16 06		 asl $06,x
$0c:945b  8d 08 05	  sta $0508
$0c:945e  3f f1 40 ff   and $ff40f1,x
$0c:9462  e8			inx
$0c:9463  37 f9		 and [$f9],y
$0c:9465  1e fe 0b	  asl $0bfe,x
$0c:9468  07 88		 ora [$88]
$0c:946a  9f d6 6f f8   sta $f86fd6,x
$0c:946e  2f fe 1e 01   and $011efe
$0c:9472  80 80		 bra $93f4
$0c:9474  70 20		 bvs $9496
$0c:9476  1e 08 07	  asl $0708,x
$0c:9479  f0 44		 beq $94bf
$0c:947b  22 10 16 08   jsl $081610
$0c:947f  84 28		 sty $28
$0c:9481  10 09		 bpl $948c
$0c:9483  84 a3		 sty $a3
$0c:9485  c9 34 f9	  cmp #$f934
$0c:9488  4d be 39	  eor $39be
$0c:948b  7f 9d b7 ca   adc $cab79d,x
$0c:948f  21 2f		 and ($2f,x)
$0c:9491  84 02		 sty $02
$0c:9493  39 00 87	  and $8700,y
$0c:9496  22 c6 1b 00   jsl $001bc6
$0c:949a  8d 8b 08	  sta $088b
$0c:949d  9d 38 01	  sta $0138,x
$0c:94a0  59 94 e6	  eor $e694,y
$0c:94a3  01 8b		 ora ($8b,x)
$0c:94a5  fd 8e 42	  sbc $428e,x
$0c:94a8  ab			plb
$0c:94a9  27 de		 and [$de]
$0c:94ab  53 b9		 eor ($b9,s),y
$0c:94ad  50 38		 bvc $94e7
$0c:94af  2c 07 f7	  bit $f707
$0c:94b2  02 ab		 cop #$ab
$0c:94b4  49 62 90	  eor #$9062
$0c:94b7  f2 48		 sbc ($48)
$0c:94b9  7e 1c c1	  ror $c11c,x
$0c:94bc  3c fe ff	  bit $fffe,x
$0c:94bf  bf df ff ef   lda $efffdf,x
$0c:94c3  ff f7 ff b2   sbc $b2fff7,x
$0c:94c7  57 3a		 eor [$3a],y
$0c:94c9  1d 0c 00	  ora $000c,x
$0c:94cc  c8			iny
$0c:94cd  1e e3 8c	  asl $8ce3,x
$0c:94d0  87 c0		 sta [$c0]
$0c:94d2  78			sei
$0c:94d3  34 0c		 bit $0c,x
$0c:94d5  06 8f		 asl $8f
$0c:94d7  81 2f		 sta ($2f,x)
$0c:94d9  e0 2f		 cpx #$2f
$0c:94db  cb			wai
$0c:94dc  fc 42 0c	  jsr ($0c42,x)
$0c:94df  06 fb		 asl $fb
$0c:94e1  81 7f		 sta ($7f,x)
$0c:94e3  c0 40		 cpy #$40
$0c:94e5  a0 70		 ldy #$70
$0c:94e7  d8			cld
$0c:94e8  2c 2a 07	  bit $072a
$0c:94eb  03 85		 ora $85,s
$0c:94ed  c1 a0		 cmp ($a0,x)
$0c:94ef  10 58		 bpl $9549
$0c:94f1  14 0a		 trb $0a
$0c:94f3  08			php
$0c:94f4  fc 08 1c	  jsr ($1c08,x)
$0c:94f7  31 64		 and ($64),y
$0c:94f9  30 c5		 bmi $94c0
$0c:94fb  f8			sed
$0c:94fc  03 05		 ora $05,s
$0c:94fe  90 50		 bcc $9550
$0c:9500  3d 06 42	  and $4206,x
$0c:9503  a1 c0		 lda ($c0,x)
$0c:9505  d0 58		 bne $955f
$0c:9507  2e 19 0d	  rol $0d19
$0c:950a  a7 72		 lda [$72]
$0c:950c  a5 6b		 lda $6b
$0c:950e  d6 cf		 dec $cf,x
$0c:9510  ad 50 cc	  lda $cc50
$0c:9513  05 c3		 ora $c3
$0c:9515  81 30		 sta ($30,x)
$0c:9517  f0 44		 beq $955d
$0c:9519  3e 10 81	  rol $8110,x
$0c:951c  38			sec
$0c:951d  5e f0 93	  lsr $93f0,x
$0c:9520  fe 04 3f	  inc $3f04,x
$0c:9523  e0 b1		 cpx #$b1
$0c:9525  08			php
$0c:9526  44 3a 15	  mvp $15,$3a
$0c:9529  0d 8b 46	  ora $468b
$0c:952c  69 b7 3a	  adc #$3ab7
$0c:952f  be 3a 51	  ldx $513a,y
$0c:9532  18			clc
$0c:9533  d5 58		 cmp $58,x
$0c:9535  96 41		 stx $41,y
$0c:9537  0e 80 92	  asl $9280
$0c:953a  42 3f		 wdm #$3f
$0c:953c  00 bf		 brk #$bf
$0c:953e  a9 82 03	  lda #$0382
$0c:9541  f8			sed
$0c:9542  83 f8		 sta $f8,s
$0c:9544  a3 b5		 lda $b5,s
$0c:9546  cd 7e 7f	  cmp $7f7e
$0c:9549  9f bf e7 f6   sta $f6e7bf,x
$0c:954d  34 13		 bit $13,x
$0c:954f  3a			dec a
$0c:9550  1d 43 c1	  ora $c143,x
$0c:9553  e0 c0		 cpx #$c0
$0c:9555  69 f8 1e	  adc #$1ef8
$0c:9558  f8			sed
$0c:9559  80 7c		 bra $95d7
$0c:955b  bc 11 fa	  ldy $fa11,x
$0c:955e  1e 73 01	  asl $0173,x
$0c:9561  5f c0 01 43   eor $4301c0,x
$0c:9565  7f fc fe 7e   adc $7efefc,x
$0c:9569  7f 18 3c 05   adc $053c18,x
$0c:956d  9e c1 cc	  stz $ccc1,x
$0c:9570  e0 c6		 cpx #$c6
$0c:9572  a0 3f		 ldy #$3f
$0c:9574  48			pha
$0c:9575  16 42		 asl $42,x
$0c:9577  d1 fc		 cmp ($fc),y
$0c:9579  81 82		 sta ($82,x)
$0c:957b  c3 01		 cmp $01,s
$0c:957d  7f b0 67 f8   adc $f867b0,x
$0c:9581  13 f5		 ora ($f5,s),y
$0c:9583  21 fe		 and ($fe,x)
$0c:9585  1c 21 80	  trb $8021
$0c:9588  b0 40		 bcs $95ca
$0c:958a  38			sec
$0c:958b  06 c1		 asl $c1
$0c:958d  2b			pld
$0c:958e  b7 c2		 lda [$c2],y
$0c:9590  01 e0		 ora ($e0,x)
$0c:9592  29 dc 0d	  and #$0ddc
$0c:9595  2c 06 77	  bit $7706
$0c:9598  36 79		 rol $79,x
$0c:959a  f4 34 f4	  pea $f434
$0c:959d  d9 67 62	  cmp $6267,y
$0c:95a0  1b			tcs
$0c:95a1  78			sei
$0c:95a2  87 5e		 sta [$5e]
$0c:95a4  61 33		 adc ($33,x)
$0c:95a6  b4 b8		 ldy $b8,x
$0c:95a8  41 e7		 eor ($e7,x)
$0c:95aa  31 58		 and ($58),y
$0c:95ac  5c 04 98 04   jml $049804
$0c:95b0  a0 bf		 ldy #$bf
$0c:95b2  81 84		 sta ($84,x)
$0c:95b4  90 0a		 bcc $95c0
$0c:95b6  82 8f f5	  brl $8b48
$0c:95b9  6b			rtl
$0c:95ba  98			tya
$0c:95bb  b8			clv
$0c:95bc  ce d7 61	  dec $61d7
$0c:95bf  2e 92 67	  rol $6792
$0c:95c2  20 1a b8	  jsr $b81a
$0c:95c5  d7 5e		 cmp [$5e],y
$0c:95c7  69 95 9b	  adc #$9b95
$0c:95ca  4f 3c 75 8f   eor $8f753c
$0c:95ce  3c cf 9f	  bit $9fcf,x
$0c:95d1  a3 ef		 lda $ef,s
$0c:95d3  c1 bf		 cmp ($bf,x)
$0c:95d5  f0 4f		 beq $9626
$0c:95d7  fc 21 94	  jsr ($9421,x)
$0c:95da  33 ae		 and ($ae,s),y
$0c:95dc  c5 ca		 cmp $ca
$0c:95de  a1 54		 lda ($54,x)
$0c:95e0  88			dey
$0c:95e1  4b			phk
$0c:95e2  e4 1b		 cpx $1b
$0c:95e4  c8			iny
$0c:95e5  1d e2 0f	  ora $0fe2,x
$0c:95e8  ef 80 6b e2   sbc $e26b80
$0c:95ec  11 8f		 ora ($8f),y
$0c:95ee  3e 43 de	  rol $de43,x
$0c:95f1  e1 09		 sbc ($09,x)
$0c:95f3  07 7c		 ora [$7c]
$0c:95f5  92 2e		 sta ($2e)
$0c:95f7  83 82		 sta $82,s
$0c:95f9  42 e1		 wdm #$e1
$0c:95fb  10 b8		 bpl $95b5
$0c:95fd  c4 7e		 cpy $7e
$0c:95ff  33 17		 and ($17,s),y
$0c:9601  9a			txs
$0c:9602  c8			iny
$0c:9603  e6 f0		 inc $f0
$0c:9605  38			sec
$0c:9606  b4 8a		 ldy $8a,x
$0c:9608  6b			rtl
$0c:9609  2f 86 40 1f   and $1f4086
$0c:960d  e1 1c		 sbc ($1c,x)
$0c:960f  80 47		 bra $9658
$0c:9611  a0 13		 ldy #$13
$0c:9613  e0 30		 cpx #$30
$0c:9615  aa			tax
$0c:9616  09 ce 52	  ora #$52ce
$0c:9619  0f fe 13 ff   ora $ff13fe
$0c:961d  81 ff		 sta ($ff,x)
$0c:961f  fc ff fe	  jsr ($feff,x)
$0c:9622  3f ff fd 48   and $48fdff,x
$0c:9626  07 3b		 ora [$3b]
$0c:9628  33 05		 and ($05,s),y
$0c:962a  53 8f		 eor ($8f,s),y
$0c:962c  48			pha
$0c:962d  e5 cb		 sbc $cb
$0c:962f  67 f4		 adc [$f4]
$0c:9631  5b			tcd
$0c:9632  be 4b e7	  ldx $e74b,y
$0c:9635  24 f3		 bit $f3
$0c:9637  ca			dex
$0c:9638  7d f0 2c	  adc $2cf0,x
$0c:963b  74 ee		 stz $ee,x
$0c:963d  01 37		 ora ($37,x)
$0c:963f  80 71		 bra $96b2
$0c:9641  e0 18		 cpx #$18
$0c:9643  f8			sed
$0c:9644  04 3e		 tsb $3e
$0c:9646  01 18		 ora ($18,x)
$0c:9648  80 44		 bra $968e
$0c:964a  20 17 18	  jsr $1817
$0c:964d  06 23		 asl $23
$0c:964f  f1 c4		 sbc ($c4),y
$0c:9651  c6 63		 dec $63
$0c:9653  a0 d9		 ldy #$d9
$0c:9655  28			plp
$0c:9656  b4 6b		 ldy $6b,x
$0c:9658  3d ba df	  and $dfba,x
$0c:965b  7a			ply
$0c:965c  b5 d5		 lda $d5,x
$0c:965e  6c 97 e2	  jmp ($e297)
$0c:9661  01 fc		 ora ($fc,x)
$0c:9663  80 28		 bra $968d
$0c:9665  03 dd		 ora $dd,s
$0c:9667  00 f3		 brk #$f3
$0c:9669  40			rti
$0c:966a  38			sec
$0c:966b  d0 0e		 bne $967b
$0c:966d  b1 90		 lda ($90),y
$0c:966f  77 95		 adc [$95],y
$0c:9671  be c4 5a	  ldx $5ac4,y
$0c:9674  ed 6c f6	  sbc $f66c
$0c:9677  76 2a		 ror $2a,x
$0c:9679  93 08		 sta ($08,s),y
$0c:967b  1f 8e d1 d8   ora $d8d18e,x
$0c:967f  cc 66 3c	  cpy $3c66
$0c:9682  df ff 6f fb   cmp $fb6fff,x
$0c:9686  3f f8 9f fc   and $fc9ff8,x
$0c:968a  3f fe 0e e7   and $e70efe,x
$0c:968e  83 cf		 sta $cf,s
$0c:9690  80 f3		 bra $9685
$0c:9692  a8			tay
$0c:9693  47 77		 eor [$77]
$0c:9695  44 91 66	  mvp $66,$91
$0c:9698  7d d7 79	  adc $79d7,x
$0c:969b  15 13		 ora $13,x
$0c:969d  33 ff		 and ($ff,s),y
$0c:969f  b3 66		 lda ($66,s),y
$0c:96a1  7b			tdc
$0c:96a2  bc c7 39	  ldy $39c7,x
$0c:96a5  59 bf e9	  eor $e9bf,y
$0c:96a8  90 0e		 bcc $96b8
$0c:96aa  03 9c		 ora $9c,s
$0c:96ac  a6 7f		 ldx $7f
$0c:96ae  f8			sed
$0c:96af  0c 0a 01	  tsb $010a
$0c:96b2  01 80		 ora ($80,x)
$0c:96b4  8a			txa
$0c:96b5  41 66		 eor ($66,x)
$0c:96b7  2b			pld
$0c:96b8  75 81		 adc $81,x
$0c:96ba  ad 45 84	  lda $8445
$0c:96bd  4b			phk
$0c:96be  75 aa		 adc $aa,x
$0c:96c0  d1 f5		 cmp ($f5),y
$0c:96c2  52 2a		 eor ($2a)
$0c:96c4  ae 46 57	  ldx $5746
$0c:96c7  4a			lsr a
$0c:96c8  ca			dex
$0c:96c9  c9 69 39	  cmp #$3969
$0c:96cc  09 35 02	  ora #$0235
$0c:96cf  2b			pld
$0c:96d0  25 a3		 and $a3
$0c:96d2  ee 24 5d	  inc $5d24
$0c:96d5  d8			cld
$0c:96d6  8f ba 17 f4   sta $f417ba
$0c:96da  82 fe 91	  brl $28db
$0c:96dd  c3 7f		 cmp $7f,s
$0c:96df  82 ce b6	  brl $4db0
$0c:96e2  f9 eb 5d	  sbc $5deb,y
$0c:96e5  e3 2b		 sbc $2b,s
$0c:96e7  f0 b5		 beq $969e
$0c:96e9  78			sei
$0c:96ea  34 98		 bit $98,x
$0c:96ec  0d c4 c3	  ora $c3c4
$0c:96ef  a1 c0		 lda ($c0,x)
$0c:96f1  b0 40		 bcs $9733
$0c:96f3  33 d6		 and ($d6,s),y
$0c:96f5  1b			tcs
$0c:96f6  c6 1f		 dec $1f
$0c:96f8  e1 0f		 sbc ($0f,x)
$0c:96fa  f0 47		 beq $9743
$0c:96fc  b0 17		 bcs $9715
$0c:96fe  c9 87 23	  cmp #$2387
$0c:9701  81 30		 sta ($30,x)
$0c:9703  80 78		 bra $977d
$0c:9705  33 94		 and ($94,s),y
$0c:9707  3f 01 24 38   and $382401,x
$0c:970b  0b			phd
$0c:970c  77 65		 adc [$65],y
$0c:970e  84 fe		 sty $fe
$0c:9710  01 38		 ora ($38,x)
$0c:9712  80 50		 bra $9764
$0c:9714  03 2a		 ora $2a,s
$0c:9716  cb			wai
$0c:9717  1d be db	  ora $dbbe,x
$0c:971a  49 a7 fb	  eor #$fba7
$0c:971d  fd 74 3a	  sbc $3a74,x
$0c:9720  35 38		 and $38,x
$0c:9722  7c 7f da	  jmp ($da7f,x)
$0c:9725  8d 9f 97	  sta $979f
$0c:9728  ff 13 a4 40   sbc $40a413,x
$0c:972c  eb			xba
$0c:972d  10 38		 bpl $9767
$0c:972f  44 0e b9	  mvp $b9,$0e
$0c:9732  1c 80 47	  trb $4780
$0c:9735  e0 11		 cpx #$11
$0c:9737  ba			tsx
$0c:9738  25 7e		 and $7e
$0c:973a  01 a4		 ora ($a4,x)
$0c:973c  d2 7d		 cmp ($7d)
$0c:973e  3e 9a cd	  rol $cd9a,x
$0c:9741  67 f3		 adc [$f3]
$0c:9743  f9 ed f6	  sbc $f6ed,y
$0c:9746  f9 7d bb	  sbc $bb7d,y
$0c:9749  4d a7 d3	  eor $d3a7
$0c:974c  eb			xba
$0c:974d  00 ad		 brk #$ad
$0c:974f  d0 21		 bne $9772
$0c:9751  70 8a		 bvs $96dd
$0c:9753  9c 62 07	  stz $0762
$0c:9756  09 89 19	  ora #$1989
$0c:9759  c2 21		 rep #$21
$0c:975b  4b			phk
$0c:975c  88			dey
$0c:975d  c2 a2		 rep #$a2
$0c:975f  5f 18 4d e2   eor $e24d18,x
$0c:9763  09 3c c1	  ora #$c13c
$0c:9766  77 a0		 adc [$a0],y
$0c:9768  3e fb 47	  rol $47fb,x
$0c:976b  bf f1 fb c4   lda $c4fbf1,x
$0c:976f  7d 6d df	  adc $df6d,x
$0c:9772  fd bd ff	  sbc $ffbd,x
$0c:9775  b7 3f		 lda [$3f],y
$0c:9777  96 c7		 stx $c7,y
$0c:9779  e2 d0		 sep #$d0
$0c:977b  f8			sed
$0c:977c  9c 1e 0b	  stz $0b1e
$0c:977f  03 81		 ora $81,s
$0c:9781  40			rti
$0c:9782  62 30 f8	  per $8fb5
$0c:9785  4c 5e 1b	  jmp $1b5e
$0c:9788  12 86		 ora ($86)
$0c:978a  44 e0 d0	  mvp $d0,$e0
$0c:978d  98			tya
$0c:978e  3c 21 32	  bit $3221,x
$0c:9791  10 38		 bpl $97cb
$0c:9793  21 20		 and ($20,x)
$0c:9795  54 09 0f	  mvn $0f,$09
$0c:9798  53 9c		 eor ($9c,s),y
$0c:979a  1f 77 1c ed   ora $ed1c77,x
$0c:979e  cf 3b 1a fa   cmp $fa1a3b
$0c:97a2  26 ee		 rol $ee
$0c:97a4  27 ec		 and [$ec]
$0c:97a6  f4 c1 b9	  pea $b9c1
$0c:97a9  b0 2a		 bcs $97d5
$0c:97ab  a4 4d		 ldy $4d
$0c:97ad  d2 2c		 cmp ($2c)
$0c:97af  09 88 7b	  ora #$7b88
$0c:97b2  eb			xba
$0c:97b3  72 09		 adc ($09)
$0c:97b5  8f 02 c9 84   sta $84c902
$0c:97b9  e5 43		 sbc $43
$0c:97bb  b9 f0 ff	  lda $fff0,y
$0c:97be  34 1b		 bit $1b,x
$0c:97c0  c9 04 f9	  cmp #$f904
$0c:97c3  87 01		 sta [$01]
$0c:97c5  80 30		 bra $97f7
$0c:97c7  4f dc 3b e3   eor $e33bdc
$0c:97cb  0f f8 41 bf   ora $bf41f8
$0c:97cf  2e 30 5f	  rol $5f30
$0c:97d2  84 8a		 sty $8a
$0c:97d4  7d 05 8e	  adc $8e05,x
$0c:97d7  c2 23		 rep #$23
$0c:97d9  91 a8		 sta ($a8),y
$0c:97db  dc 6a 35	  jml [$356a]
$0c:97de  1f 8f c2 e2   ora $e2c28f,x
$0c:97e2  f1 88		 sbc ($88),y
$0c:97e4  b8			clv
$0c:97e5  80 23		 bra $980a
$0c:97e7  c4 81		 cpy $81
$0c:97e9  23 84		 and $84,s
$0c:97eb  75 3e		 adc $3e,x
$0c:97ed  bd 7d 3f	  lda $3f7d,x
$0c:97f0  cf e7 df ef   cmp $efdfe7
$0c:97f4  ef 3f fe 09   sbc $09fe3f
$0c:97f8  fd 13 3f	  sbc $3f13,x
$0c:97fb  2c e7 fc	  bit $fce7
$0c:97fe  79 f7 88	  adc $88f7,y
$0c:9801  04 32		 tsb $32
$0c:9803  01 20		 ora ($20,x)
$0c:9805  6f 04 03 81   adc $810304
$0c:9809  00 f0		 brk #$f0
$0c:980b  40			rti
$0c:980c  3e 02 a1	  rol $a102,x
$0c:980f  c7 ff		 cmp [$ff]
$0c:9811  e3 ff		 sbc $ff,s
$0c:9813  f8			sed
$0c:9814  d7 ea		 cmp [$ea],y
$0c:9816  79 fc b1	  adc $b1fc,y
$0c:9819  78			sei
$0c:981a  62 ff 3c	  per $d51c
$0c:981d  ef ee 83 f7   sbc $f783ee
$0c:9821  12 0c		 ora ($0c)
$0c:9823  02 0b		 cop #$0b
$0c:9825  00 81		 brk #$81
$0c:9827  a9 4e 0e	  lda #$0e4e
$0c:982a  a7 1e		 lda [$1e]
$0c:982c  17 2b		 ora [$2b],y
$0c:982e  c5 ea		 cmp $ea
$0c:9830  ef 7e b1 5e   sbc $5eb17e
$0c:9834  ee 56 fb	  inc $fb56
$0c:9837  bd be ce	  lda $cebe,x
$0c:983a  7f 39 9f cf   adc $cf9f39,x
$0c:983e  f4 03 bd	  pea $bd03
$0c:9841  00 f7		 brk #$f7
$0c:9843  40			rti
$0c:9844  0b			phd
$0c:9845  e0 65		 cpx #$65
$0c:9847  2f e1 a8 79   and $79a8e1
$0c:984b  be fd 6f	  ldx $6ffd,y
$0c:984e  3e b3 bf	  rol $bfb3,x
$0c:9851  98			tya
$0c:9852  cc 7f ff	  cpy $ff7f
$0c:9855  fa			plx
$0c:9856  af aa d1 7b   lda $7bd1aa
$0c:985a  96 df		 stx $df,y
$0c:985c  fd ec d0	  sbc $d0ec,x
$0c:985f  66 84		 ror $84
$0c:9861  02 43		 cop #$43
$0c:9863  ce 6f 15	  dec $156f
$0c:9866  ef 09 7f c0   sbc $c07f09
$0c:986a  62 3f fd	  per $95ac
$0c:986d  bd ed d3	  lda $d3ed,x
$0c:9870  7f 25 92 9d   adc $9d9225,x
$0c:9874  c2 cb		 rep #$cb
$0c:9876  8a			txa
$0c:9877  bd 57 fa	  lda $fa57,x
$0c:987a  df 76 02 49   cmp $490276,x
$0c:987e  7b			tdc
$0c:987f  4d e0 3f	  eor $3fe0
$0c:9882  85 bf		 sta $bf
$0c:9884  01 e7		 ora ($e7,x)
$0c:9886  84 42		 sty $42
$0c:9888  2f f5 bb ee   and $eebbf5
$0c:988c  d3 7f		 cmp ($7f,s),y
$0c:988e  35 9f		 and $9f,x
$0c:9890  a5 c3		 lda $c3
$0c:9892  5b			tcd
$0c:9893  a2 fd		 ldx #$fd
$0c:9895  7f ee d7 74   adc $74d7ee,x
$0c:9899  68			pla
$0c:989a  23 42		 and $42,s
$0c:989c  7f 40 8f f0   adc $f08f40,x
$0c:98a0  30 02		 bmi $98a4
$0c:98a2  e0 a8		 cpx #$a8
$0c:98a4  73 e0		 adc ($e0,s),y
$0c:98a6  14 7c		 trb $7c
$0c:98a8  44 68 7e	  mvp $7e,$68
$0c:98ab  4d 0a 23	  eor $230a
$0c:98ae  83 42		 sta $42,s
$0c:98b0  c4 e0		 cpy $e0
$0c:98b2  d0 d7		 bne $988b
$0c:98b4  7e d3 31	  ror $31d3,x
$0c:98b7  79 88 b4	  adc $b488,y
$0c:98ba  c6 5b		 dec $5b
$0c:98bc  62 ad f0	  per $896c
$0c:98bf  f6 70		 inc $70,x
$0c:98c1  cf 7c 0f 8f   cmp $8f0f7c
$0c:98c5  15 cd		 ora $cd,x
$0c:98c7  dd bf fe	  cmp $febf,x
$0c:98ca  df f7 6b f9   cmp $f96bf7,x
$0c:98ce  b4 fc		 ldy $fc,x
$0c:98d0  5b			tcd
$0c:98d1  3e 1d 0f	  rol $0f1d,x
$0c:98d4  06 e3		 asl $e3
$0c:98d6  81 60		 sta ($60,x)
$0c:98d8  c0 6f		 cpy #$6f
$0c:98da  f5 fc		 sbc $fc,x
$0c:98dc  be fa 5c	  ldx $5cfa,y
$0c:98df  31 5e		 and ($5e),y
$0c:98e1  7f be ff 65   adc $65ffbe,x
$0c:98e5  ff ce e7 7f   sbc $7fe7ce,x
$0c:98e9  bf d8 fd 02   lda $02fdd8,x
$0c:98ed  bf 20 b0 40   lda $40b020,x
$0c:98f1  2d f1 0b	  and $0bf1
$0c:98f4  fc 00 8e	  jsr ($8e00,x)
$0c:98f7  11 db		 ora ($db),y
$0c:98f9  14 02		 trb $02
$0c:98fb  05 1e		 ora $1e
$0c:98fd  ff 5c 3e 18   sbc $183e5c,x
$0c:9901  0c 04 0a	  tsb $0a04
$0c:9904  03 72		 ora $72,s
$0c:9906  b8			clv
$0c:9907  c9 64 7c	  cmp #$7c64
$0c:990a  2e 1d 16	  rol $161d
$0c:990d  fb			xce
$0c:990e  01 80		 ora ($80,x)
$0c:9910  43 c9		 eor $c9,s
$0c:9912  02 89		 cop #$89
$0c:9914  0c 7c 03	  tsb $037c
$0c:9917  bd 01 9f	  lda $9f01,x
$0c:991a  c0 70		 cpy #$70
$0c:991c  70 0b		 bvs $9929
$0c:991e  a6 3b		 ldx $3b
$0c:9920  37 7f		 and [$7f],y
$0c:9922  bf ff f2 99   lda $99f2ff,x
$0c:9926  f9 2c eb	  sbc $eb2c,y
$0c:9929  93 ff		 sta ($ff,s),y
$0c:992b  ff 7f be 7f   sbc $7fbe7f,x
$0c:992f  f2 f8		 sbc ($f8)
$0c:9931  20 08 86	  jsr $8608
$0c:9934  00 02		 brk #$02
$0c:9936  3f 94 06 0d   and $0d0694,x
$0c:993a  00 83		 brk #$83
$0c:993c  c0 4a		 cpy #$4a
$0c:993e  a1 02		 lda ($02,x)
$0c:9940  80 40		 bra $9982
$0c:9942  d1 42		 cmp ($42),y
$0c:9944  7f 28 3a 7c   adc $7c3a28,x
$0c:9948  53 00		 eor ($00,s),y
$0c:994a  a4 24		 ldy $24
$0c:994c  d1 e5		 cmp ($e5),y
$0c:994e  a2 36		 ldx #$36
$0c:9950  bc 46 0e	  ldy $0e46,x
$0c:9953  c1 b1		 cmp ($b1,x)
$0c:9955  80 73		 bra $99ca
$0c:9957  20 13 ee	  jsr $ee13
$0c:995a  06 1e		 asl $1e
$0c:995c  f1 7f		 sbc ($7f),y
$0c:995e  c0 44		 cpy #$44
$0c:9960  3d f0 8f	  and $8ff0,x
$0c:9963  b9 90 58	  lda $5890,y
$0c:9966  8f 65 cc c2   sta $c2cc65
$0c:996a  be 59 9b	  ldx $9b59,y
$0c:996d  06 6e		 asl $6e
$0c:996f  c9 c4 9c	  cmp #$9cc4
$0c:9972  73 66		 adc ($66,s),y
$0c:9974  36 e8		 rol $e8,x
$0c:9976  85 86		 sta $86
$0c:9978  3d 01 ff	  and $ff01,x
$0c:997b  40			rti
$0c:997c  bf ac 34 6f   lda $6f34ac,x
$0c:9980  83 0c		 sta $0c,s
$0c:9982  a3 31		 lda $31,s
$0c:9984  e8			inx
$0c:9985  bc 7a 6d	  ldy $6d7a,x
$0c:9988  03 8d		 ora $8d,s
$0c:998a  d7 a1		 cmp [$a1],y
$0c:998c  b5 cb		 lda $cb,x
$0c:998e  95 4a		 sta $4a,x
$0c:9990  9b			txy
$0c:9991  6f a9 5f a3   adc $a35fa9
$0c:9995  f0 07		 beq $999e
$0c:9997  f8			sed
$0c:9998  4f e0 16 18   eor $1816e0
$0c:999c  05 8e		 ora $8e
$0c:999e  01 6d		 ora ($6d,x)
$0c:99a0  80 5c		 bra $99fe
$0c:99a2  00 83		 brk #$83
$0c:99a4  c0 f7		 cpy #$f7
$0c:99a6  83 c3		 sta $c3,s
$0c:99a8  61 e7		 adc ($e7,x)
$0c:99aa  dd 7c f9	  cmp $f97c,x
$0c:99ad  9f af 45 cf   sta $cf45af,x
$0c:99b1  61 97		 adc ($97,x)
$0c:99b3  93 43		 sta ($43,s),y
$0c:99b5  fe 10 00	  inc $0010,x
$0c:99b8  f8			sed
$0c:99b9  7e 20 1f	  ror $1f20,x
$0c:99bc  c3 20		 cmp $20,s
$0c:99be  89 42 f0	  bit #$f042
$0c:99c1  20 18 5f	  jsr $5f18
$0c:99c4  9e 8b fe	  stz $fe8b,x
$0c:99c7  93 4d		 sta ($4d,s),y
$0c:99c9  38			sec
$0c:99ca  bf 9c b7 ce   lda $ceb79c,x
$0c:99ce  59 e7 94	  eor $94e7,y
$0c:99d1  fb			xce
$0c:99d2  e0 7b		 cpx #$7b
$0c:99d4  f0 08		 beq $99de
$0c:99d6  18			clc
$0c:99d7  43 9f		 eor $9f,s
$0c:99d9  00 48		 brk #$48
$0c:99db  04 32		 tsb $32
$0c:99dd  01 18		 ora ($18,x)
$0c:99df  80 44		 bra $9a25
$0c:99e1  20 14 05	  jsr $0514
$0c:99e4  b0 7f		 bcs $9a65
$0c:99e6  3d 97 cb	  and $cb97,x
$0c:99e9  65 73		 adc $73
$0c:99eb  d9 fc 2b	  cmp $2bfc,y
$0c:99ee  0f 73 d1 d8   ora $d8d173
$0c:99f2  f4 7e 05	  pea $057e
$0c:99f5  20 29 0d	  jsr $0d29
$0c:99f8  e4 02		 cpx $02
$0c:99fa  38			sec
$0c:99fb  64 19		 stz $19
$0c:99fd  e4 02		 cpx $02
$0c:99ff  70 48		 bvs $9a49
$0c:9a01  1c ff fe	  trb $feff
$0c:9a04  45 22		 eor $22
$0c:9a06  ff ff e7 5d   sbc $5de7ff,x
$0c:9a0a  da			phx
$0c:9a0b  bf df 65 b7   lda $b765df,x
$0c:9a0f  88			dey
$0c:9a10  c4 7f		 cpy $7f
$0c:9a12  bf d1 38 48   lda $4838d1,x
$0c:9a16  bb			tyx
$0c:9a17  aa			tax
$0c:9a18  d0 f7		 bne $9a11
$0c:9a1a  c0 3c		 cpy #$3c
$0c:9a1c  f0 8d		 beq $99ab
$0c:9a1e  3d 22 03	  and $0322,x
$0c:9a21  ee 80 40	  inc $4080
$0c:9a24  ae 5f 7c	  ldx $7c5f
$0c:9a27  96 48		 stx $48,y
$0c:9a29  e6 1e		 inc $1e
$0c:9a2b  a9 bc a7	  lda #$a7bc
$0c:9a2e  f3 6a		 sbc ($6a,s),y
$0c:9a30  fd c5 62	  sbc $62c5,x
$0c:9a33  bd fe fa	  lda $fafe,x
$0c:9a36  1c 30 40	  trb $4030
$0c:9a39  90 61		 bcc $9a9c
$0c:9a3b  8f e6 0d fb   sta $fb0de6
$0c:9a3f  82 44 7d	  brl $1786
$0c:9a42  50 09		 bvc $9a4d
$0c:9a44  04 aa		 tsb $aa
$0c:9a46  5f 2e 97 4f   eor $4f972e,x
$0c:9a4a  e7 f3		 sbc [$f3]
$0c:9a4c  e9 fe df	  sbc #$dffe
$0c:9a4f  6f a7 db cb   adc $cbdba7
$0c:9a53  65 b2		 adc $b2
$0c:9a55  f9 7c 1f	  sbc $1f7c,y
$0c:9a58  a1 02		 lda ($02,x)
$0c:9a5a  e8			inx
$0c:9a5b  c4 38		 cpy $38
$0c:9a5d  11 9e		 ora ($9e),y
$0c:9a5f  06 46		 asl $46
$0c:9a61  91 90		 sta ($90),y
$0c:9a63  a4 42		 ldy $42
$0c:9a65  3a			dec a
$0c:9a66  50 8e		 bvc $99f6
$0c:9a68  85 2a		 sta $2a
$0c:9a6a  f7 b4		 sbc [$b4],y
$0c:9a6c  e7 d2		 sbc [$d2]
$0c:9a6e  70 d9		 bvs $9a49
$0c:9a70  28			plp
$0c:9a71  e4 92		 cpx $92
$0c:9a73  71 49		 adc ($49),y
$0c:9a75  b8			clv
$0c:9a76  e4 fc		 cpx $fc
$0c:9a78  52 6e		 eor ($6e)
$0c:9a7a  2e 13 ff	  rol $ff13
$0c:9a7d  30 ff		 bmi $9a7e
$0c:9a7f  de 7f fe	  dec $fe7f,x
$0c:9a82  3f ff 1f ff   and $ff1fff,x
$0c:9a86  8e ff c7	  stx $c7ff
$0c:9a89  7f f3 bf fc   adc $fcbff3,x
$0c:9a8d  e3 af		 sbc $af,s
$0c:9a8f  90 b7		 bcc $9a48
$0c:9a91  1a			inc a
$0c:9a92  02 c1		 cop #$c1
$0c:9a94  59 e1 6c	  eor $6ce1,y
$0c:9a97  f0 56		 beq $9aef
$0c:9a99  58			cli
$0c:9a9a  77 3a		 adc [$3a],y
$0c:9a9c  33 97		 and ($97,s),y
$0c:9a9e  97 7f		 sta [$7f],y
$0c:9aa0  f3 bf		 sbc ($bf,s),y
$0c:9aa2  ee 5f f3	  inc $f35f
$0c:9aa5  4d f8 b6	  eor $b6f8
$0c:9aa8  7c 3b 1e	  jmp ($1e3b,x)
$0c:9aab  0d 8f 02	  ora $028f
$0c:9aae  c1 80		 cmp ($80,x)
$0c:9ab0  8b			phb
$0c:9ab1  cb			wai
$0c:9ab2  e5 55		 sbc $55
$0c:9ab4  ba			tsx
$0c:9ab5  3e fe e5	  rol $e5fe,x
$0c:9ab8  fd c5 e2	  sbc $e2c5,x
$0c:9abb  f8			sed
$0c:9abc  9f c8 e7 ff   sta $ffe7c8,x
$0c:9ac0  23 9f		 and $9f,s
$0c:9ac2  e0 40		 cpx #$40
$0c:9ac4  30 88		 bmi $9a4e
$0c:9ac6  30 11		 bmi $9ad9
$0c:9ac8  0d d2 01	  ora $01d2
$0c:9acb  03 11		 ora $11,s
$0c:9acd  0d 82 01	  ora $0182
$0c:9ad0  81 c0		 sta ($c0,x)
$0c:9ad2  cf 3e 58 9c   cmp $9c583e
$0c:9ad6  34 8a		 bit $8a,x
$0c:9ad8  79 e3 ce	  adc $cee3,y
$0c:9adb  4b			phk
$0c:9adc  3e 18 3b	  rol $3b18,x
$0c:9adf  c4 47		 cpy $47
$0c:9ae1  c1 7e		 cmp ($7e,x)
$0c:9ae3  80 43		 bra $9b28
$0c:9ae5  60			rts
$0c:9ae6  57 b8		 eor [$b8],y
$0c:9ae8  3f 5e 1f 6f   and $6f1f5e,x
$0c:9aec  8f df e3 fb   sta $fbe3df
$0c:9af0  fb			xce
$0c:9af1  ff fe ff 69   sbc $69fffe,x
$0c:9af5  b4 f2		 ldy $f2,x
$0c:9af7  3b			tsc
$0c:9af8  11 0c		 ora ($0c),y
$0c:9afa  86 03		 stx $03
$0c:9afc  81 d0		 sta ($d0,x)
$0c:9afe  f0 71		 beq $9b71
$0c:9b00  21 11		 and ($11,x)
$0c:9b02  f8			sed
$0c:9b03  ee 4e c7	  inc $c74e
$0c:9b06  96 80		 stx $80,y
$0c:9b08  49 d0 83	  eor #$83d0
$0c:9b0b  7f c0 19 43   adc $4319c0,x
$0c:9b0f  ff f0 f7 7c   sbc $7cf7f0,x
$0c:9b13  3f 9f fa 57   and $57fa9f,x
$0c:9b17  1a			inc a
$0c:9b18  4b			phk
$0c:9b19  e3 c9		 sbc $c9,s
$0c:9b1b  5c 69 53 b9   jml $b95369
$0c:9b1f  2c 7b 23	  bit $237b
$0c:9b22  8d a4 71	  sta $71a4
$0c:9b25  a4 9e		 ldy $9e
$0c:9b27  39 cf fc	  and $fccf,y
$0c:9b2a  36 0e		 rol $0e,x
$0c:9b2c  90 e2		 bcc $9b10
$0c:9b2e  7f fc 3f fb   adc $fb3ffc,x
$0c:9b32  97 ff		 sta [$ff],y
$0c:9b34  73 ff		 adc ($ff,s),y
$0c:9b36  ee 29 41	  inc $4129
$0c:9b39  1e 90 14	  asl $1490,x
$0c:9b3c  a8			tay
$0c:9b3d  40			rti
$0c:9b3e  60			rts
$0c:9b3f  42 90		 wdm #$90
$0c:9b41  81 c1		 sta ($c1,x)
$0c:9b43  11 f0		 ora ($f0),y
$0c:9b45  28			plp
$0c:9b46  11 48		 ora ($48),y
$0c:9b48  41 e6		 eor ($e6,x)
$0c:9b4a  7c 08 7f	  jmp ($7f08,x)
$0c:9b4d  c2 0f		 rep #$0f
$0c:9b4f  f8			sed
$0c:9b50  80 ff		 bra $9b51
$0c:9b52  b8			clv
$0c:9b53  13 fe		 ora ($fe,s),y
$0c:9b55  34 e7		 bit $e7,x
$0c:9b57  07 7c		 ora [$7c]
$0c:9b59  b0 47		 bcs $9ba2
$0c:9b5b  e0 08		 cpx #$08
$0c:9b5d  e0 60		 cpx #$60
$0c:9b5f  5f ce 19 87   eor $8719ce,x
$0c:9b63  bc 79 e3	  ldy $e379,x
$0c:9b66  0c f0 b9	  tsb $b9f0
$0c:9b69  e3 16		 sbc $16,s
$0c:9b6b  a5 f2		 lda $f2
$0c:9b6d  86 af		 stx $af
$0c:9b6f  fa			plx
$0c:9b70  c7 e3		 cmp [$e3]
$0c:9b72  d3 c9		 cmp ($c9,s),y
$0c:9b74  e7 fb		 sbc [$fb]
$0c:9b76  f7 98		 sbc [$98],y
$0c:9b78  3d 82 ef	  and $ef82,x
$0c:9b7b  f7 ae		 sbc [$ae],y
$0c:9b7d  57 3f		 eor [$3f],y
$0c:9b7f  ff ff 04 73   sbc $7304ff,x
$0c:9b83  41 58		 eor ($58,x)
$0c:9b85  d8			cld
$0c:9b86  50 34		 bvc $9bbc
$0c:9b88  14 0c		 trb $0c
$0c:9b8a  00 18		 brk #$18
$0c:9b8c  21 11		 and ($11,x)
$0c:9b8e  cd 18 94	  cmp $9418
$0c:9b91  2d b6 db	  and $dbb6
$0c:9b94  3d 9e df	  and $df9e,x
$0c:9b97  6f 9e 4f 1e   adc $1e4f9e
$0c:9b9b  c0 fd		 cpy #$fd
$0c:9b9d  0f 7f bd fa   ora $fabd7f
$0c:9ba1  14 8c		 trb $8c
$0c:9ba3  95 03		 sta $03,x
$0c:9ba5  31 40		 and ($40),y
$0c:9ba7  c8			iny
$0c:9ba8  40			rti
$0c:9ba9  38			sec
$0c:9baa  60			rts
$0c:9bab  71 06		 adc ($06),y
$0c:9bad  84 41		 sty $41
$0c:9baf  1e a2 d6	  asl $d6a2,x
$0c:9bb2  8c 41 a4	  sty $a441
$0c:9bb5  63 0b		 adc $0b,s
$0c:9bb7  80 4f		 bra $9c08
$0c:9bb9  c5 b3		 cmp $b3
$0c:9bbb  10 b4		 bpl $9b71
$0c:9bbd  5b			tcd
$0c:9bbe  34 9d		 bit $9d,x
$0c:9bc0  6b			rtl
$0c:9bc1  90 b6		 bcc $9b79
$0c:9bc3  2f 10 0e e4   and $e40e10
$0c:9bc7  03 1d		 ora $1d,s
$0c:9bc9  00 db		 brk #$db
$0c:9bcb  6d bc de	  adc $debc
$0c:9bce  6f b7 db c9   adc $c9dbb7
$0c:9bd2  e4 da		 cpx $da
$0c:9bd4  ed 74 ba	  sbc $ba74
$0c:9bd7  50 d8		 bvc $9bb1
$0c:9bd9  7b			tdc
$0c:9bda  bd d1 2a	  lda $2ad1,x
$0c:9bdd  4d 0a 33	  eor $330a
$0c:9be0  02 84		 cop #$84
$0c:9be2  c0 23		 cpy #$23
$0c:9be4  71 1a		 adc ($1a),y
$0c:9be6  54 06 b5	  mvn $b5,$06
$0c:9be9  03 88		 ora $88,s
$0c:9beb  40			rti
$0c:9bec  a2 34		 ldx #$34
$0c:9bee  5a			phy
$0c:9bef  2d 92 cf	  and $cf92
$0c:9bf2  43 a1		 eor $a1,s
$0c:9bf4  52 69		 eor ($69)
$0c:9bf6  15 8a		 ora $8a,x
$0c:9bf8  cd b6 fb	  cmp $fbb6
$0c:9bfb  64 ba		 stz $ba
$0c:9bfd  d4 ea		 pei ($ea)
$0c:9bff  70 5d		 bvs $9c5e
$0c:9c01  d4 9f		 pei ($9f)
$0c:9c03  31 03		 and ($03),y
$0c:9c05  de 42 76	  dec $7642,x
$0c:9c08  d1 9d		 cmp ($9d),y
$0c:9c0a  34 f7		 bit $f7,x
$0c:9c0c  05 35		 ora $35
$0c:9c0e  c5 44		 cmp $44
$0c:9c10  f5 91		 sbc $91,x
$0c:9c12  8d 5c af	  sta $af5c
$0c:9c15  af 9b ba 76   lda $76ba9b
$0c:9c19  e7 99		 sbc [$99]
$0c:9c1b  9b			txy
$0c:9c1c  f7 32		 sbc [$32],y
$0c:9c1e  7f 8a 9e 7d   adc $7d9e8a,x
$0c:9c22  a1 f3		 lda ($f3,x)
$0c:9c24  8e 24 7f	  stx $7f24
$0c:9c27  01 47		 ora ($47,x)
$0c:9c29  e0 50		 cpx #$50
$0c:9c2b  38			sec
$0c:9c2c  12 0d		 ora ($0d)
$0c:9c2e  04 43		 tsb $43
$0c:9c30  21 07		 and ($07,x)
$0c:9c32  e3 c0		 sbc $c0,s
$0c:9c34  30 12		 bmi $9c48
$0c:9c36  8e ae cb	  stx $cbae
$0c:9c39  93 34		 sta ($34,s),y
$0c:9c3b  89 ca 24	  bit #$24ca
$0c:9c3e  fa			plx
$0c:9c3f  e8			inx
$0c:9c40  cf 32 03 de   cmp $de0332
$0c:9c44  e3 fa		 sbc $fa,s
$0c:9c46  21 b1		 and ($b1,x)
$0c:9c48  c8			iny
$0c:9c49  1f e2 0b f2   ora $f20be2,x
$0c:9c4d  85 c8		 sta $c8
$0c:9c4f  ba			tsx
$0c:9c50  70 4a		 bvs $9c9c
$0c:9c52  2c 62 77	  bit $7762
$0c:9c55  26 f0		 rol $f0
$0c:9c57  c3 22		 cmp $22,s
$0c:9c59  74 db		 stz $db,x
$0c:9c5b  5e 67 7f	  lsr $7f67,x
$0c:9c5e  f8			sed
$0c:9c5f  ff f7 7b fd   sbc $fd7bf7,x
$0c:9c63  ce e7 17	  dec $17e7
$0c:9c66  85 e2		 sta $e2
$0c:9c68  e7 ed		 sbc [$ed]
$0c:9c6a  76 fe		 ror $fe,x
$0c:9c6c  fc 85 bf	  jsr ($bf85,x)
$0c:9c6f  81 2f		 sta ($2f,x)
$0c:9c71  01 07		 ora ($07,x)
$0c:9c73  82 41 e3	  brl $7fb7
$0c:9c76  97 fc		 sta [$fc],y
$0c:9c78  27 ff		 and [$ff]
$0c:9c7a  0a			asl a
$0c:9c7b  7f e2 8f 46   adc $468fe2,x
$0c:9c7f  b3 59		 lda ($59,s),y
$0c:9c81  28			plp
$0c:9c82  b4 4a		 ldy $4a,x
$0c:9c84  65 26		 adc $26
$0c:9c86  b1 5b		 lda ($5b),y
$0c:9c88  b6 dc		 ldx $dc,y
$0c:9c8a  ac b7 2a	  ldy $2ab7
$0c:9c8d  9d 32 0f	  sta $0f32,x
$0c:9c90  b8			clv
$0c:9c91  50 80		 bvc $9c13
$0c:9c93  7c 21 fb	  jmp ($fb21,x)
$0c:9c96  08			php
$0c:9c97  fe 82 7f	  inc $7f82,x
$0c:9c9a  80 14		 bra $9cb0
$0c:9c9c  80 9c		 bra $9c3a
$0c:9c9e  31 be		 and ($be),y
$0c:9ca0  2a			rol a
$0c:9ca1  3f c3 8b bc   and $bc8bc3,x
$0c:9ca5  91 47		 sta ($47),y
$0c:9ca7  b8			clv
$0c:9ca8  1f e9 87 bf   ora $bf87e9,x
$0c:9cac  09 9b e4	  ora #$e49b
$0c:9caf  7e ff f7	  ror $f7ff,x
$0c:9cb2  fb			xce
$0c:9cb3  fc fe b7	  jsr ($b7fe,x)
$0c:9cb6  3f f6 c7 e2   and $e2c7f6,x
$0c:9cba  f0 f8		 beq $9cb4
$0c:9cbc  dc 1e cb	  jml [$cb1e]
$0c:9cbf  03 83		 ora $83,s
$0c:9cc1  40			rti
$0c:9cc2  7f f0 3b 7d   adc $7d3bf0,x
$0c:9cc6  8b			phb
$0c:9cc7  75 02		 adc $02,x
$0c:9cc9  cb			wai
$0c:9cca  59 3d 90	  eor $903d,y
$0c:9ccd  f9 dc 0a	  sbc $0adc,y
$0c:9cd0  97 c4		 sta [$c4],y
$0c:9cd2  8c 70 3f	  sty $3f70
$0c:9cd5  bf ec ef fb   lda $fbefec,x
$0c:9cd9  ff fc fd ff   sbc $fffdfc,x
$0c:9cdd  3e 7f cf	  rol $cf7f,x
$0c:9ce0  ef ff 7f ff   sbc $ff7fff
$0c:9ce4  36 04		 rol $04,x
$0c:9ce6  5b			tcd
$0c:9ce7  eb			xba
$0c:9ce8  08			php
$0c:9ce9  bd c0 77	  lda $77c0,x
$0c:9cec  d8			cld
$0c:9ced  2e e4 87	  rol $87e4
$0c:9cf0  9d e0 fb	  sta $fbe0,x
$0c:9cf3  d4 2d		 pei ($2d)
$0c:9cf5  7a			ply
$0c:9cf6  ce ad ab	  dec $abad
$0c:9cf9  ff b4 bf d6   sbc $d6bfb4,x
$0c:9cfd  67 f2		 adc [$f2]
$0c:9cff  32 30		 and ($30)
$0c:9d01  c2 e0		 rep #$e0
$0c:9d03  f8			sed
$0c:9d04  58			cli
$0c:9d05  1c 0a 03	  trb $030a
$0c:9d08  02 82		 cop #$82
$0c:9d0a  41 e1		 eor ($e1,x)
$0c:9d0c  09 12 87	  ora #$8712
$0c:9d0f  c0 21		 cpy #$21
$0c:9d11  f1 04		 sbc ($04),y
$0c:9d13  c8			iny
$0c:9d14  40			rti
$0c:9d15  63 d0		 adc $d0,s
$0c:9d17  08			php
$0c:9d18  3a			dec a
$0c:9d19  60			rts
$0c:9d1a  14 2b		 trb $2b
$0c:9d1c  1f 54 95 9a   ora $9a9554,x
$0c:9d20  33 3b		 and ($3b,s),y
$0c:9d22  82 46 60	  brl $fd6b
$0c:9d25  dd f8 07	  cmp $07f8,x
$0c:9d28  fa			plx
$0c:9d29  01 ff		 ora ($ff,x)
$0c:9d2b  5c 1c 01 72   jml $72011c
$0c:9d2f  8c 07 82	  sty $8207
$0c:9d32  fe b1 97	  inc $97b1,x
$0c:9d35  3e f4 87	  rol $87f4,x
$0c:9d38  75 01		 adc $01,x
$0c:9d3a  96 c4		 stx $c4,y
$0c:9d3c  24 f1		 bit $f1
$0c:9d3e  8c bc 23	  sty $23bc
$0c:9d41  a7 0c		 lda [$0c]
$0c:9d43  5f f2 f8 17   eor $17f8f2,x
$0c:9d47  c1 02		 cmp ($02,x)
$0c:9d49  81 c2		 sta ($c2,x)
$0c:9d4b  a1 92		 lda ($92,x)
$0c:9d4d  d9 8d 5e	  cmp $5e8d,y
$0c:9d50  cf 9c 8f d8   cmp $d88f9c
$0c:9d54  af ce f2 81   lda $81f2ce
$0c:9d58  a8			tay
$0c:9d59  46 7d		 lsr $7d
$0c:9d5b  00 bc		 brk #$bc
$0c:9d5d  40			rti
$0c:9d5e  3c 10 0c	  bit $0c10,x
$0c:9d61  0b			phd
$0c:9d62  bc 97 c1	  ldy $c197,x
$0c:9d65  80 c0		 bra $9d27
$0c:9d67  50 38		 bvc $9da1
$0c:9d69  38			sec
$0c:9d6a  1c ae 3a	  trb $3aae
$0c:9d6d  fb			xce
$0c:9d6e  71 8d		 adc ($8d),y
$0c:9d70  fe c2 07	  inc $07c2,x
$0c:9d73  00 e0		 brk #$e0
$0c:9d75  40			rti
$0c:9d76  28			plp
$0c:9d77  30 0b		 bmi $9d84
$0c:9d79  fc 03 1d	  jsr ($1d03,x)
$0c:9d7c  00 82		 brk #$82
$0c:9d7e  40			rti
$0c:9d7f  27 71		 and [$71]
$0c:9d81  98			tya
$0c:9d82  6d 32 bd	  adc $bd32
$0c:9d85  1e 93 ef	  asl $ef93,x
$0c:9d88  e1 db		 sbc ($db,x)
$0c:9d8a  ec 1c fe	  cpx $fe1c
$0c:9d8d  21 1f		 and ($1f,x)
$0c:9d8f  c1 f9		 cmp ($f9,x)
$0c:9d91  e4 f0		 cpx $f0
$0c:9d93  0b			phd
$0c:9d94  9c 02 c2	  stz $c202
$0c:9d97  24 1e		 bit $1e
$0c:9d99  08			php
$0c:9d9a  90 41		 bcc $9ddd
$0c:9d9c  61 18		 adc ($18,x)
$0c:9d9e  80 55		 bra $9df5
$0c:9da0  33 5a		 and ($5a,s),y
$0c:9da2  3e 07 b2	  rol $b207,x
$0c:9da5  2b			pld
$0c:9da6  1d 81 fc	  ora $fc81,x
$0c:9da9  fc 1c cf	  jsr ($cf1c,x)
$0c:9dac  66 3f		 ror $3f
$0c:9dae  bf 0d ff f9   lda $f9ff0d,x
$0c:9db2  97 e2		 sta [$e2],y
$0c:9db4  1e 07 70	  asl $7007,x
$0c:9db7  47 e0		 eor [$e0]
$0c:9db9  11 38		 ora ($38),y
$0c:9dbb  04 80		 tsb $80
$0c:9dbd  1c 7e 0c	  trb $0c7e
$0c:9dc0  84 63		 sty $63
$0c:9dc2  11 e8		 ora ($e8),y
$0c:9dc4  b3 6c		 lda ($6c,s),y
$0c:9dc6  fe 31 bf	  inc $bf31,x
$0c:9dc9  c4 e3		 cpy $e3
$0c:9dcb  f1 0e		 sbc ($0e),y
$0c:9dcd  5b			tcd
$0c:9dce  84 03		 sty $03
$0c:9dd0  e1 00		 sbc ($00,x)
$0c:9dd2  fc 40 33	  jsr ($3340,x)
$0c:9dd5  ca			dex
$0c:9dd6  11 50		 ora ($50),y
$0c:9dd8  02 80		 cop #$80
$0c:9dda  20 20 e4	  jsr $e420
$0c:9ddd  77 8c		 adc [$8c],y
$0c:9ddf  52 31		 eor ($31)
$0c:9de1  a7 e3		 lda [$e3]
$0c:9de3  df f7 f8 d7   cmp $d7f8f7,x
$0c:9de7  71 bb		 adc ($bb),y
$0c:9de9  c8			iny
$0c:9dea  ce 08 30	  dec $3008
$0c:9ded  12 82		 ora ($82)
$0c:9def  b2 2e		 lda ($2e)
$0c:9df1  11 0a		 ora ($0a),y
$0c:9df3  57 1a		 eor [$1a],y
$0c:9df5  e7 f0		 sbc [$f0]
$0c:9df7  83 a7		 sta $a7,s
$0c:9df9  9d 02 00	  sta $0002,x
$0c:9dfc  70 43		 bvs $9e41
$0c:9dfe  83 33		 sta $33,s
$0c:9e00  20 7c 4c	  jsr $4c7c
$0c:9e03  ae 25 99	  ldx $9925
$0c:9e06  5c 78 03 f8   jml $f80378
$0c:9e0a  d6 0a		 dec $0a,x
$0c:9e0c  15 0e		 ora $0e,x
$0c:9e0e  06 82		 asl $82
$0c:9e10  b9 c3 58	  lda $58c3,y
$0c:9e13  2a			rol a
$0c:9e14  c0 44		 cpy #$44
$0c:9e16  a1 60		 lda ($60,x)
$0c:9e18  80 4f		 bra $9e69
$0c:9e1a  e0 1d		 cpx #$1d
$0c:9e1c  ae 6f 97	  ldx $976f
$0c:9e1f  b7 dc		 lda [$dc],y
$0c:9e21  e9 c6 b6	  sbc #$b6c6
$0c:9e24  f7 7f		 sbc [$7f],y
$0c:9e26  be 36 e1	  ldx $e136,y
$0c:9e29  d5 b7		 cmp $b7,x
$0c:9e2b  cf 39 f9 f9   cmp $f9f939
$0c:9e2f  06 fe		 asl $fe
$0c:9e31  00 21		 brk #$21
$0c:9e33  17 d0		 ora [$d0],y
$0c:9e35  42 13		 wdm #$13
$0c:9e37  c0 29		 cpy #$29
$0c:9e39  2c 16 16	  bit $1616
$0c:9e3c  65 f0		 adc $f0
$0c:9e3e  ca			dex
$0c:9e3f  61 25		 adc ($25,x)
$0c:9e41  33 9d		 and ($9d,s),y
$0c:9e43  0f 86 45 e3   ora $e34586
$0c:9e47  c5 62		 cmp $62
$0c:9e49  c6 a1		 dec $a1
$0c:9e4b  7f 43 0d ee   adc $ee0d43,x
$0c:9e4f  01 c6		 ora ($c6,x)
$0c:9e51  80 47		 bra $9e9a
$0c:9e53  a0 11		 ldy #$11
$0c:9e55  c8			iny
$0c:9e56  05 d0		 ora $d0
$0c:9e58  88			dey
$0c:9e59  30 4f		 bmi $9eaa
$0c:9e5b  26 2e		 rol $2e
$0c:9e5d  f1 e7		 sbc ($e7),y
$0c:9e5f  de 60 c4	  dec $c460,x
$0c:9e62  61 1e		 adc ($1e,x)
$0c:9e64  90 79		 bcc $9edf
$0c:9e66  f9 9c b9	  sbc $b99c,y
$0c:9e69  b4 d6		 ldy $d6,x
$0c:9e6b  f7 ff		 sbc [$ff],y
$0c:9e6d  db			stp
$0c:9e6e  df ef 71 fb   cmp $fb71ef,x
$0c:9e72  64 7f		 stz $7f
$0c:9e74  ef 0f 8f c0   sbc $c08f0f
$0c:9e78  e6 f0		 inc $f0
$0c:9e7a  1e 54 05	  asl $0554,x
$0c:9e7d  3c 1f 38	  bit $381f,x
$0c:9e80  67 56		 adc [$56]
$0c:9e82  43 fa		 eor $fa,s
$0c:9e84  8c f6 a3	  sty $a3f6
$0c:9e87  3a			dec a
$0c:9e88  3a			dec a
$0c:9e89  3e 72 8f	  rol $8f72,x
$0c:9e8c  e5 64		 sbc $64
$0c:9e8e  80 a4		 bra $9e34
$0c:9e90  67 5f		 adc [$5f]
$0c:9e92  f9 27 fe	  sbc $fe27,y
$0c:9e95  4f ff 8e 7f   eor $7f8eff
$0c:9e99  e5 1f		 sbc $1f
$0c:9e9b  f8			sed
$0c:9e9c  4f fe 02 47   eor $4702fe
$0c:9ea0  05 38		 ora $38
$0c:9ea2  29 c0 1a	  and #$1ac0
$0c:9ea5  09 62 bf	  ora #$bf62
$0c:9ea8  a6 c5		 ldx $c5
$0c:9eaa  24 49		 bit $49
$0c:9eac  49 ff ff	  eor #$ffff
$0c:9eaf  fb			xce
$0c:9eb0  fd f5 78	  sbc $78f5,x
$0c:9eb3  7d 3e 9b	  adc $9b3e,x
$0c:9eb6  fd fe 9f	  sbc $9ffe,x
$0c:9eb9  4f ef f7 fb   eor $fbf7ef
$0c:9ebd  3d 8e 90	  and $908e,x
$0c:9ec0  a0 48		 ldy #$48
$0c:9ec2  1d 21 10	  ora $1021,x
$0c:9ec5  85 c6		 sta $c6
$0c:9ec7  28			plp
$0c:9ec8  10 0a		 bpl $9ed4
$0c:9eca  c4 0a		 cpy $0a
$0c:9ecc  21 00		 and ($00,x)
$0c:9ece  89 8a 8a	  bit #$8a8a
$0c:9ed1  0f f8 87 fc   ora $fc87f8
$0c:9ed5  23 fe		 and $fe,s
$0c:9ed7  06 b8		 asl $b8
$0c:9ed9  4f f8 0d b0   eor $b00df8
$0c:9edd  15 1b		 ora $1b,x
$0c:9edf  82 61 9e	  brl $3d43
$0c:9ee2  3c 35 c7	  bit $c735,x
$0c:9ee5  07 38		 ora [$38]
$0c:9ee7  80 df		 bra $9ec8
$0c:9ee9  24 1d		 bit $1d
$0c:9eeb  e9 86 3e	  sbc #$3e86
$0c:9eee  31 c7		 and ($c7),y
$0c:9ef0  c6 58		 dec $58
$0c:9ef2  e7 cb		 sbc [$cb]
$0c:9ef4  00 ff		 brk #$ff
$0c:9ef6  f3 ff		 sbc ($ff,s),y
$0c:9ef8  fa			plx
$0c:9ef9  7f fd cf ff   adc $ffcffd,x
$0c:9efd  79 ff ef	  adc $efff,y
$0c:9f00  3f fd ef fd   and $fdeffd,x
$0c:9f04  ff 3f 34 e6   sbc $e6343f,x
$0c:9f08  47 3c		 eor [$3c]
$0c:9f0a  98			tya
$0c:9f0b  db			stp
$0c:9f0c  9f 1e 73 63   sta $63731e,x
$0c:9f10  8e 4c 71	  stx $714c
$0c:9f13  d1 0e		 cmp ($0e),y
$0c:9f15  3d 83 01	  and $0183,x
$0c:9f18  33 e0		 and ($e0,s),y
$0c:9f1a  66 fc		 ror $fc
$0c:9f1c  1c cf 87	  trb $87cf
$0c:9f1f  9b			txy
$0c:9f20  f1 f3		 sbc ($f3),y
$0c:9f22  fe 7e 7f	  inc $7f7e,x
$0c:9f25  d7 cf		 cmp [$cf],y
$0c:9f27  fe 03 ff	  inc $ff03,x
$0c:9f2a  04 ff		 tsb $ff
$0c:9f2c  c7 7e		 cmp [$7e]
$0c:9f2e  f3 1f		 sbc ($1f,s),y
$0c:9f30  f4 0d 1c	  pea $1c0d
$0c:9f33  02 e1		 cop #$e1
$0c:9f35  a1 7f		 lda ($7f,x)
$0c:9f37  57 e0		 eor [$e0],y
$0c:9f39  bf 08 44 02   lda $024408,x
$0c:9f3d  02 3f		 cop #$3f
$0c:9f3f  21 f8		 and ($f8,x)
$0c:9f41  c0 e0		 cpy #$e0
$0c:9f43  18			clc
$0c:9f44  ef dc ff e7   sbc $e7ffdc
$0c:9f48  fd f3 fd	  sbc $fdf3,x
$0c:9f4b  d1 21		 cmp ($21),y
$0c:9f4d  cc 9f f8	  cpy $f89f
$0c:9f50  ff d9 7b 5f   sbc $5f7bd9,x
$0c:9f54  fa			plx
$0c:9f55  09 00 86	  ora #$8600
$0c:9f58  40			rti
$0c:9f59  23 10		 and $10,s
$0c:9f5b  0f 1c 02 67   ora $67021c
$0c:9f5f  00 8e		 brk #$8e
$0c:9f61  40			rti
$0c:9f62  2d 10 0c	  and $0c10
$0c:9f65  0c 03 49	  tsb $4903
$0c:9f68  a4 5a		 ldy $5a
$0c:9f6a  86 b3		 stx $b3
$0c:9f6c  59 fc fe	  eor $fefc,y
$0c:9f6f  7b			tdc
$0c:9f70  7d be 5f	  adc $5fbe,x
$0c:9f73  6e d3 68	  ror $68d3
$0c:9f76  b5 08		 lda $08,x
$0c:9f78  05 6e		 ora $6e
$0c:9f7a  81 0b		 sta ($0b,x)
$0c:9f7c  84 54		 sty $54
$0c:9f7e  e3 10		 sbc $10,s
$0c:9f80  38			sec
$0c:9f81  4c 49 0e	  jmp $0e49
$0c:9f84  11 0a		 ora ($0a),y
$0c:9f86  5b			tcd
$0c:9f87  14 38		 trb $38
$0c:9f89  dc 7e 2f	  jml [$2f7e]
$0c:9f8c  13 99		 ora ($99,s),y
$0c:9f8e  cd a6 73	  cmp $73a6
$0c:9f91  6a			ror a
$0c:9f92  bd de d7	  lda $d7de,x
$0c:9f95  6f df fe b4   adc $b4fedf
$0c:9f99  df 30 f3 8c   cmp $8cf330,x
$0c:9f9d  2c eb 1b	  bit $1beb
$0c:9fa0  32 51		 and ($51)
$0c:9fa2  86 76		 stx $76
$0c:9fa4  45 9b		 eor $9b
$0c:9fa6  92 6f		 sta ($6f)
$0c:9fa8  e0 13		 cpx #$13
$0c:9faa  dc 17 4b	  jml [$4b17]
$0c:9fad  b3 24		 lda ($24,s),y
$0c:9faf  99 f2 3c	  sta $3cf2,y
$0c:9fb2  f9 1e 74	  sbc $741e,y
$0c:9fb5  8f 39 46 9c   sta $9c4639
$0c:9fb9  63 6e		 adc $6e,s
$0c:9fbb  11 af		 ora ($af),y
$0c:9fbd  0c 9a 03	  tsb $039a
$0c:9fc0  cc 81 c6	  cpy $c681
$0c:9fc3  60			rts
$0c:9fc4  f3 38		 sbc ($38,s),y
$0c:9fc6  7d 9e 3f	  adc $3f9e,x
$0c:9fc9  cf 9f e7 ef   cmp $efe79f
$0c:9fcd  ef f0 98 e3   sbc $e398f0
$0c:9fd1  23 1c		 and $1c,s
$0c:9fd3  67 78		 adc [$78]
$0c:9fd5  61 2e		 adc ($2e,x)
$0c:9fd7  3c 09 dd	  bit $dd09,x
$0c:9fda  88			dey
$0c:9fdb  34 2f		 bit $2f,x
$0c:9fdd  b0 bd		 bcs $9f9c
$0c:9fdf  ff e7 bf fc   sbc $fcbfe7,x
$0c:9fe3  f7 ff		 sbc [$ff],y
$0c:9fe5  9d ff f2	  sta $f2ff,x
$0c:9fe8  ff fe 7f f0   sbc $f07ffe,x
$0c:9fec  48			pha
$0c:9fed  4f 3f f9 8f   eor $8ff93f
$0c:9ff1  c5 1f		 cmp $1f
$0c:9ff3  bf 33 ff ca   lda $caff33,x
$0c:9ff7  bd d0 bf	  lda $bfd0,x
$0c:9ffa  c4 5f		 cpy $5f
$0c:9ffc  e3 89		 sbc $89,s
$0c:9ffe  f3 de		 sbc ($de,s),y
$0c:a000  be f0 78	  ldx $78f0,y
$0c:a003  04 80		 tsb $80
$0c:a005  7e 31 18	  ror $1831,x
$0c:a008  03 fc		 ora $fc,s
$0c:a00a  21 f0		 and ($f0,x)
$0c:a00c  08			php
$0c:a00d  f8			sed
$0c:a00e  20 60 18	  jsr $1860
$0c:a011  0a			asl a
$0c:a012  07 03		 ora [$03]
$0c:a014  41 60		 eor ($60,x)
$0c:a016  f0 68		 beq $a080
$0c:a018  30 1a		 bmi $a034
$0c:a01a  08			php
$0c:a01b  06 82		 asl $82
$0c:a01d  81 b0		 sta ($b0,x)
$0c:a01f  e8			inx
$0c:a020  6c 30 10	  jmp ($1030)
$0c:a023  0e 04 03	  asl $0304
$0c:a026  c0 22		 cpy #$22
$0c:a028  5f 80 a8 60   eor $60a880,x
$0c:a02c  30 18		 bmi $a046
$0c:a02e  14 06		 trb $06
$0c:a030  06 31		 asl $31
$0c:a032  08			php
$0c:a033  14 1e		 trb $1e
$0c:a035  0b			phd
$0c:a036  00 82		 brk #$82
$0c:a038  c1 46		 cmp ($46,x)
$0c:a03a  61 0c		 adc ($0c,x)
$0c:a03c  80 c0		 bra $9ffe
$0c:a03e  20 64 03	  jsr $0364
$0c:a041  83 11		 sta $11,s
$0c:a043  84 be		 sty $be
$0c:a045  00 90		 brk #$90
$0c:a047  b0 e4		 bcs $a02d
$0c:a049  ae d7 0c	  ldx $0cd7
$0c:a04c  df ee 9f 7f   cmp $7f9fee,x
$0c:a050  cc 7f e4	  cpy $e47f
$0c:a053  1e 7f 67	  asl $677f,x
$0c:a056  be e1 7e	  ldx $7ee1,y
$0c:a059  f9 c0 31	  sbc $31c0,y
$0c:a05c  e4 a1		 cpx $a1
$0c:a05e  0f 80 08 23   ora $230880
$0c:a062  10 08		 bpl $a06c
$0c:a064  84 03		 sty $03
$0c:a066  03 00		 ora $00,s
$0c:a068  8f 7e e7 df   sta $dfe77e
$0c:a06c  3f e7 9f ff   and $ff9fe7,x
$0c:a070  08			php
$0c:a071  eb			xba
$0c:a072  ff a7 df 0f   sbc $0fdfa7,x
$0c:a076  36 73		 rol $73,x
$0c:a078  9d f8 25	  sta $25f8,x
$0c:a07b  84 30		 sty $30
$0c:a07d  d0 3f		 bne $a0be
$0c:a07f  71 70		 adc ($70),y
$0c:a081  02 06		 cop #$06
$0c:a083  c6 06		 dec $06
$0c:a085  18			clc
$0c:a086  ef f2 f1 d3   sbc $d3f1f2
$0c:a08a  f4 e1 b0	  pea $b0e1
$0c:a08d  51 ce		 eor ($ce),y
$0c:a08f  24 e2		 bit $e2
$0c:a091  13 71		 ora ($71,s),y
$0c:a093  89 78 a4	  bit #$a478
$0c:a096  9c 52 08	  stz $0852
$0c:a099  4b			phk
$0c:a09a  e0 37		 cpx #$37
$0c:a09c  f8			sed
$0c:a09d  1f de 1f ef   ora $ef1fde,x
$0c:a0a1  8f f7 a7 fb   sta $fba7f7
$0c:a0a5  db			stp
$0c:a0a6  fd eb ff	  sbc $ffeb,x
$0c:a0a9  cf 9c 4f ba   cmp $ba4f9c
$0c:a0ad  70 df		 bvs $a08e
$0c:a0af  3d 3e 69	  and $693e,x
$0c:a0b2  85 dc		 sta $dc
$0c:a0b4  44 2d d0	  mvp $d0,$2d
$0c:a0b7  8e 3d 93	  stx $933d
$0c:a0ba  47 c7		 eor [$c7]
$0c:a0bc  80 6b		 bra $a129
$0c:a0be  38			sec
$0c:a0bf  1d 8f 07	  ora $078f,x
$0c:a0c2  af e1 4f f8   lda $f84fe1
$0c:a0c6  66 4f		 ror $4f
$0c:a0c8  01 fd		 ora ($fd,x)
$0c:a0ca  af ff b3 59   lda $59b3ff
$0c:a0ce  af fb 44 6f   lda $6f44fb
$0c:a0d2  ff fa bf 7d   sbc $7dbffa,x
$0c:a0d6  b0 1e		 bcs $a0f6
$0c:a0d8  ef f5 a2 fb   sbc $fba2f5
$0c:a0dc  80 b2		 bra $a090
$0c:a0de  88			dey
$0c:a0df  43 41		 eor $41,s
$0c:a0e1  00 d8		 brk #$d8
$0c:a0e3  40			rti
$0c:a0e4  33 12		 and ($12,s),y
$0c:a0e6  0c e4 83	  tsb $83e4
$0c:a0e9  7d 01 9e	  adc $9e01,x
$0c:a0ec  e0 aa		 cpx #$aa
$0c:a0ee  51 99		 eor ($99),y
$0c:a0f0  24 cf		 bit $cf
$0c:a0f2  91 e7		 sta ($e7),y
$0c:a0f4  a8			tay
$0c:a0f5  f3 b4		 sbc ($b4,s),y
$0c:a0f7  79 ce 04	  adc $04ce,y
$0c:a0fa  fb			xce
$0c:a0fb  01 7f		 ora ($7f,x)
$0c:a0fd  84 7d		 sty $7d
$0c:a0ff  fc d0 1e	  jsr ($1ed0,x)
$0c:a102  64 0e		 stz $0e
$0c:a104  33 07		 and ($07,s),y
$0c:a106  99 c3 ec	  sta $ecc3,y
$0c:a109  71 fe		 adc ($fe),y
$0c:a10b  1c ff 33	  trb $33ff
$0c:a10e  7f 8e 7f e6   adc $e67f8e,x
$0c:a112  9c 3b 46	  stz $463b
$0c:a115  1f a3 0e d1   ora $d10ea3,x
$0c:a119  c7 28		 cmp [$28]
$0c:a11b  d3 88		 cmp ($88,s),y
$0c:a11d  67 c6		 adc [$c6]
$0c:a11f  01 fb		 ora ($fb,x)
$0c:a121  90 f7		 bcc $a11a
$0c:a123  af 9f ff cf   lda $cfff9f
$0c:a127  ff e7 ff f3   sbc $f3ffe7,x
$0c:a12b  ab			plb
$0c:a12c  83 ff		 sta $ff,s
$0c:a12e  9e ff cb	  stz $cbff,x
$0c:a131  7f f7 3f fc   adc $fc3ff7,x
$0c:a135  0b			phd
$0c:a136  fb			xce
$0c:a137  47 ff		 eor [$ff]
$0c:a139  78			sei
$0c:a13a  e7 dc		 sbc [$dc]
$0c:a13c  7f e8 a4 27   adc $27a4e8,x
$0c:a140  9e 79 cf	  stz $cf79,x
$0c:a143  f2 01		 sbc ($01)
$0c:a145  fe 81 40	  inc $4081,x
$0c:a148  50 e1		 bvc $a12b
$0c:a14a  c1 80		 cmp ($80,x)
$0c:a14c  40			rti
$0c:a14d  8c e0 68	  sty $68e0
$0c:a150  18			clc
$0c:a151  19 00 20	  ora $2000,y
$0c:a154  7e f8 ad	  ror $adf8,x
$0c:a157  3f 85 37 ea   and $ea3785,x
$0c:a15b  e2 e5		 sep #$e5
$0c:a15d  bc 6c dc	  ldy $dc6c,x
$0c:a160  f7 c9		 sbc [$c9],y
$0c:a162  08			php
$0c:a163  c2 9f		 rep #$9f
$0c:a165  83 f5		 sta $f5,s
$0c:a167  e0 9e ff	  cpx #$ff9e
$0c:a16a  ad 5b cf	  lda $cf5b
$0c:a16d  94 72		 sty $72,x
$0c:a16f  e9 08		 sbc #$08
$0c:a171  8d c0 3f	  sta $3fc0
$0c:a174  56 7f		 lsr $7f,x
$0c:a176  ff ef 81 7d   sbc $7d81ef,x
$0c:a17a  cc fa 37	  cpy $37fa
$0c:a17d  9e 4f 36	  stz $364f,x
$0c:a180  69 64		 adc #$64
$0c:a182  14 9e		 trb $9e
$0c:a184  36 92		 rol $92,x
$0c:a186  c7 52		 cmp [$52]
$0c:a188  98			tya
$0c:a189  e3 e1		 sbc $e1,s
$0c:a18b  f1 78		 sbc ($78),y
$0c:a18d  fc 6e 1f	  jsr ($1f6e,x)
$0c:a190  65 9f		 adc $9f
$0c:a192  fc af f3	  jsr ($f3af,x)
$0c:a195  9f fe 73 ff   sta $ff73fe,x
$0c:a199  ce ff f0	  dec $f0ff
$0c:a19c  ef f4 fd ee   sbc $eefdf4
$0c:a1a0  fe a1 58	  inc $58a1,x
$0c:a1a3  97 ca		 sta [$ca],y
$0c:a1a5  62 f9 7c	  per $1ea1
$0c:a1a8  5f 2a 8b 6d   eor $6d8b2a,x
$0c:a1ac  d5 60		 cmp $60,x
$0c:a1ae  20 1c 2c	  jsr $2c1c
$0c:a1b1  07 bf		 ora [$bf]
$0c:a1b3  81 f0		 sta ($f0,x)
$0c:a1b5  f0 7e		 beq $a235
$0c:a1b7  3e 17 cf	  rol $cf17,x
$0c:a1ba  c6 fb		 dec $fb
$0c:a1bc  f9 57 ff	  sbc $ff57,y
$0c:a1bf  57 f3		 eor [$f3],y
$0c:a1c1  f2 8e		 sbc ($8e)
$0c:a1c3  44 53 c9	  mvp $c9,$53
$0c:a1c6  4b			phk
$0c:a1c7  99 e1 77	  sta $77e1,y
$0c:a1ca  31 2b		 and ($2b),y
$0c:a1cc  64 27		 stz $27
$0c:a1ce  8d 64 d1	  sta $d164
$0c:a1d1  d8			cld
$0c:a1d2  30 1b		 bmi $a1ef
$0c:a1d4  7e 07 6f	  ror $6f07,x
$0c:a1d7  c1 ec		 cmp ($ec,x)
$0c:a1d9  f8			sed
$0c:a1da  51 bf		 eor ($bf),y
$0c:a1dc  19 bf e1	  ora $e1bf,y
$0c:a1df  84 2b		 sty $2b
$0c:a1e1  df f8 47 8f   cmp $8f47f8,x
$0c:a1e5  09 73		 ora #$73
$0c:a1e7  e0 6f ec	  cpx #$ec6f
$0c:a1ea  35 ee		 and $ee,x
$0c:a1ec  87 be		 sta [$be]
$0c:a1ee  31 17		 and ($17),y
$0c:a1f0  d6 4e		 dec $4e,x
$0c:a1f2  ea			nop
$0c:a1f3  57 98		 eor [$98],y
$0c:a1f5  f7 ff		 sbc [$ff],y
$0c:a1f7  19 7f a0	  ora $a07f,y
$0c:a1fa  cf f4 71 f8   cmp $f871f4
$0c:a1fe  8c 3f d1	  sty $d13f
$0c:a201  07 e2		 ora [$e2]
$0c:a203  40			rti
$0c:a204  f0 d0		 beq $a1d6
$0c:a206  18			clc
$0c:a207  57 e6		 eor [$e6],y
$0c:a209  93 f8		 sta ($f8,s),y
$0c:a20b  ec 7e 26	  cpx $267e
$0c:a20e  3f 1c 7f fe   and $fe7f1c,x
$0c:a212  03 ff		 ora $ff,s
$0c:a214  9b			txy
$0c:a215  ff e3 7f f8   sbc $f87fe3,x
$0c:a219  3c 01 fe	  bit $fe01,x
$0c:a21c  50 e2		 bvc $a200
$0c:a21e  30 81		 bmi $a1a1
$0c:a220  93 21		 sta ($21,s),y
$0c:a222  f0 d8		 beq $a1fc
$0c:a224  04 02		 tsb $02
$0c:a226  e1 60		 sbc ($60,x)
$0c:a228  b0 7e		 bcs $a2a8
$0c:a22a  3f 91 29 cc   and $cc2991,x
$0c:a22e  b6 59		 ldx $59,y
$0c:a230  0d c7 fc	  ora $fcc7
$0c:a233  20 01 f2	  jsr $f201
$0c:a236  f0 40		 beq $a278
$0c:a238  2f 90 0f fc   and $fc0f90
$0c:a23c  03 e7		 ora $e7,s
$0c:a23e  00 b8		 brk #$b8
$0c:a240  40			rti
$0c:a241  21 70		 and ($70,x)
$0c:a243  f8			sed
$0c:a244  24 2a		 bit $2a
$0c:a246  1d 0b 85	  ora $850b,x
$0c:a249  47 e1		 eor [$e1]
$0c:a24b  91 f9		 sta ($f9),y
$0c:a24d  ed f6 a9	  sbc $a9f6
$0c:a250  97 d2		 sta [$d2],y
$0c:a252  49 c0		 eor #$c0
$0c:a254  a1 0f		 lda ($0f,x)
$0c:a256  20 0c 7c	  jsr $7c0c
$0c:a259  88			dey
$0c:a25a  37 e8		 and [$e8],y
$0c:a25c  07 e2		 ora [$e2]
$0c:a25e  01 d8		 ora ($d8,x)
$0c:a260  80 50		 bra $a2b2
$0c:a262  6f fc df fe   adc $fedffc
$0c:a266  c3 ff		 cmp $ff,s
$0c:a268  80 ef		 bra $a259
$0c:a26a  fc 2b f4	  jsr ($f42b,x)
$0c:a26d  39 7f 63	  and $637f,y
$0c:a270  9f 13 f9 a7   sta $a7f913,x
$0c:a274  c0 c0 42	  cpy #$42c0
$0c:a277  50 12		 bvc $a28b
$0c:a279  80 7c		 bra $a2f7
$0c:a27b  26 10		 rol $10
$0c:a27d  08			php
$0c:a27e  60			rts
$0c:a27f  80 30		 bra $a2b1
$0c:a281  73 8f		 adc ($8f,s),y
$0c:a283  3f 87 1d e2   and $e21d87,x
$0c:a287  86 60		 stx $60
$0c:a289  3b			tsc
$0c:a28a  94 3d		 sty $3d,x
$0c:a28c  ec 67 cd	  cpx $cd67
$0c:a28f  14 f1		 trb $f1
$0c:a291  df 20 71 98   cmp $987120,x
$0c:a295  3d ce 1e	  and $1ece,x
$0c:a298  fe 09 3c	  inc $3c09,x
$0c:a29b  7e a5 3f	  ror $3fa5,x
$0c:a29e  9c ff ef	  stz $efff
$0c:a2a1  9f f9 c7 1e   sta $1ec7f9,x
$0c:a2a5  b5 99		 lda $99,x
$0c:a2a7  d6 48		 dec $48,x
$0c:a2a9  7a			ply
$0c:a2aa  d5 1f		 cmp $1f,x
$0c:a2ac  65 2e		 adc $2e
$0c:a2ae  79 83 a8	  adc $a883,y
$0c:a2b1  63 c5		 adc $c5,s
$0c:a2b3  03 ff		 ora $ff,s
$0c:a2b5  b2 7f		 lda ($7f)
$0c:a2b7  ea			nop
$0c:a2b8  df f9 47 fe   cmp $fe47f9,x
$0c:a2bc  21 ff		 and ($ff,x)
$0c:a2be  b0 7f		 bcs $a33f
$0c:a2c0  e4 09		 cpx $09
$0c:a2c2  e1 56		 sbc ($56,x)
$0c:a2c4  a4 7b		 ldy $7b
$0c:a2c6  db			stp
$0c:a2c7  33 e9		 and ($e9,s),y
$0c:a2c9  4b			phk
$0c:a2ca  38			sec
$0c:a2cb  37 cd		 and [$cd],y
$0c:a2cd  1d 9a cc	  ora $cc9a,x
$0c:a2d0  ad 68 67	  lda $6768
$0c:a2d3  fe 34 a6	  inc $a634,x
$0c:a2d6  1c cf fe	  trb $fecf
$0c:a2d9  4f 81 8f f0   eor $f08f81
$0c:a2dd  a3 f4		 lda $f4,s
$0c:a2df  0c 34 b2	  tsb $b234
$0c:a2e2  07 18		 ora [$18]
$0c:a2e4  f1 e3		 sbc ($e3),y
$0c:a2e6  28			plp
$0c:a2e7  30 7f		 bmi $a368
$0c:a2e9  64 af		 stz $af
$0c:a2eb  fd 00 de	  sbc $de00,x
$0c:a2ee  f0 3f		 beq $a32f
$0c:a2f0  fc 0f 9f	  jsr ($9f0f,x)
$0c:a2f3  83 ef		 sta $ef,s
$0c:a2f5  f8			sed
$0c:a2f6  fd ff 37	  sbc $37ff,x
$0c:a2f9  9f ef b2 b1   sta $b1b2ef,x
$0c:a2fd  de be ac	  dec $acbe,x
$0c:a300  5d 4f 72	  eor $724f,x
$0c:a303  89 ba		 bit #$ba
$0c:a305  e7 4d		 sbc [$4d]
$0c:a307  35 57		 and $57,x
$0c:a309  4f d7 f3 3d   eor $3df3d7
$0c:a30d  7c af 7d	  jmp ($7daf,x)
$0c:a310  26 be		 rol $be
$0c:a312  6f ec 0f fe   adc $fe0fec
$0c:a316  20 28 38	  jsr $3828
$0c:a319  98			tya
$0c:a31a  3c f0 7f	  bit $7ff0,x
$0c:a31d  7c 3f f7	  jmp ($f73f,x)
$0c:a320  1f 8f 7e e7   ora $e77e8f,x
$0c:a324  bf 0f e7 93   lda $93e70f,x
$0c:a328  e5 1e		 sbc $1e
$0c:a32a  e8			inx
$0c:a32b  ff e6 1e 7f   sbc $7f1ee6,x
$0c:a32f  46 5f		 lsr $5f
$0c:a331  99 fb 82	  sta $82fb,y
$0c:a334  c0 21 f0	  cpy #$f021
$0c:a337  38			sec
$0c:a338  dc 1f db	  jml [$db1f]
$0c:a33b  0f 83 43 c8   ora $c84383
$0c:a33f  61 6d		 adc ($6d,x)
$0c:a341  81 c1		 sta ($c1,x)
$0c:a343  a0 34 8e	  ldy #$8e34
$0c:a346  2c 83 cf	  bit $cf83
$0c:a349  90 bb		 bcc $a306
$0c:a34b  51 26		 eor ($26),y
$0c:a34d  12 18		 ora ($18)
$0c:a34f  ce 4b 17	  dec $174b
$0c:a352  66 ea		 ror $ea
$0c:a354  42 3b		 wdm #$3b
$0c:a356  f3 ef		 sbc ($ef,s),y
$0c:a358  dc 63 ff	  jml [$ff63]
$0c:a35b  89 ff		 bit #$ff
$0c:a35d  f3 ff		 sbc ($ff,s),y
$0c:a35f  fe ef bd	  inc $bdef,x
$0c:a362  d7 ff		 cmp [$ff],y
$0c:a364  bb			tyx
$0c:a365  ff f9 3f f0   sbc $f03ff9,x
$0c:a369  af dc d2 5f   lda $5fd2dc
$0c:a36d  69 a3		 adc #$a3
$0c:a36f  64 bb		 stz $bb
$0c:a371  92 4d		 sta ($4d)
$0c:a373  c5 26		 cmp $26
$0c:a375  e3 93		 sbc $93,s
$0c:a377  f1 49		 sbc ($49),y
$0c:a379  b8			clv
$0c:a37a  b0 4f		 bcs $a3cb
$0c:a37c  ff 43 ff b9   sbc $b9ff43,x
$0c:a380  ff d8 ff fc   sbc $fcffd8,x
$0c:a384  7f fe 3b ff   adc $ff3bfe,x
$0c:a388  1d ff ce	  ora $ceff,x
$0c:a38b  ff f3 8e be   sbc $be8ef3,x
$0c:a38f  46 dd		 lsr $dd
$0c:a391  02 9e		 cop #$9e
$0c:a393  59 6b 3c	  eor $3c6b,y
$0c:a396  bd 9e 52	  lda $529e,x
$0c:a399  c9 27		 cmp #$27
$0c:a39b  5d 06 72	  eor $7206,x
$0c:a39e  5d ff ce	  eor $ceff,x
$0c:a3a1  ff b9 7f cd   sbc $cd7fb9,x
$0c:a3a5  37 e2		 and [$e2],y
$0c:a3a7  d9 f0 ed	  cmp $edf0,y
$0c:a3aa  f8			sed
$0c:a3ab  37 dc		 and [$dc],y
$0c:a3ad  0b			phd
$0c:a3ae  1e 02 7f	  asl $7f02,x
$0c:a3b1  ff 89 f4 e0   sbc $e0f489,x
$0c:a3b5  be 7c 64	  ldx $647c,y
$0c:a3b8  f2 17		 sbc ($17)
$0c:a3ba  1f b6 45 3f   ora $3f45b6,x
$0c:a3be  10 6c		 bpl $a42c
$0c:a3c0  54 2b 01	  mvn $01,$2b
$0c:a3c3  00 f6		 brk #$f6
$0c:a3c5  60			rts
$0c:a3c6  3f 0e 41 fc   and $fc410e,x
$0c:a3ca  7c 3f ff	  jmp ($ff3f,x)
$0c:a3cd  8f ff f3 ef   sta $eff3ff
$0c:a3d1  fc f0 a2	  jsr ($a2f0,x)
$0c:a3d4  03 a7		 ora $a7,s
$0c:a3d6  b9 f1 fc	  lda $fcf1,y
$0c:a3d9  34 1d		 bit $1d,x
$0c:a3db  bc c7 df	  ldy $dfc7,x
$0c:a3de  69 ac		 adc #$ac
$0c:a3e0  f6 63		 inc $63,x
$0c:a3e2  3a			dec a
$0c:a3e3  17 fb		 ora [$fb],y
$0c:a3e5  fd 7e c1	  sbc $c17e,x
$0c:a3e8  5f a0 57 28   eor $2857a0,x
$0c:a3ec  75 bb		 adc $bb,x
$0c:a3ee  25 ce		 and $ce
$0c:a3f0  91 63		 sta ($63),y
$0c:a3f2  a8			tay
$0c:a3f3  57 2c		 eor [$2c],y
$0c:a3f5  78			sei
$0c:a3f6  1f fe 6b 49   ora $496bfe,x
$0c:a3fa  f1 e2		 sbc ($e2),y
$0c:a3fc  d8			cld
$0c:a3fd  e8			inx
$0c:a3fe  f8			sed
$0c:a3ff  38			sec
$0c:a400  3e 1e 4f	  rol $4f1e,x
$0c:a403  29 9c		 and #$9c
$0c:a405  dd e8 bf	  cmp $bfe8,x
$0c:a408  ef f6 fa 87   sbc $87faf6
$0c:a40c  3f 81 4f 70   and $704f81,x
$0c:a410  5c 59 d7 96   jml $96d759
$0c:a414  35 fb		 and $fb,x
$0c:a416  83 4f		 sta $4f,s
$0c:a418  f0 50		 beq $a46a
$0c:a41a  0f fc 07 ff   ora $ff07fc
$0c:a41e  83 ff		 sta $ff,s
$0c:a420  d0 2f		 bne $a451
$0c:a422  f9 cf fc	  sbc $fccf,y
$0c:a425  93 cf		 sta ($cf,s),y
$0c:a427  ed f7 c6	  sbc $c6f7
$0c:a42a  2f 90 00 f9   and $f90090
$0c:a42e  af c0 3e 11   lda $113ec0
$0c:a432  88			dey
$0c:a433  04 42		 tsb $42
$0c:a435  01 e3		 ora ($e3,x)
$0c:a437  80 7e		 bra $a4b7
$0c:a439  bc 58 2e	  ldy $2e58,x
$0c:a43c  17 8f		 ora [$8f],y
$0c:a43e  7f c0 df 60   adc $60dfc0,x
$0c:a442  77 ec		 adc [$ec],y
$0c:a444  a0 82 de	  ldy #$de82
$0c:a447  7f ff fa f5   adc $f5faff,x
$0c:a44b  06 bd		 asl $bd
$0c:a44d  61 bf		 adc ($bf,x)
$0c:a44f  d0 2f		 bne $a480
$0c:a451  d4 12		 pei ($12)
$0c:a453  18			clc
$0c:a454  41 ef		 eor ($ef,x)
$0c:a456  17 ec		 ora [$ec],y
$0c:a458  3d fe 00	  and $00fe,x
$0c:a45b  f3 0e		 sbc ($0e,s),y
$0c:a45d  1f 1f 97 f7   ora $f7971f,x
$0c:a461  c3 fe		 cmp $fe,s
$0c:a463  ca			dex
$0c:a464  a1 1f		 lda ($1f,x)
$0c:a466  ff f0 bb 9f   sbc $9fbbf0,x
$0c:a46a  df e8 0c 60   cmp $600ce8,x
$0c:a46e  57 d3		 eor [$d3],y
$0c:a470  10 ff		 bpl $a471
$0c:a472  60			rts
$0c:a473  5e 18 f4	  lsr $f418,x
$0c:a476  fb			xce
$0c:a477  c3 fc		 cmp $fc,s
$0c:a479  81 41		 sta ($41,x)
$0c:a47b  a0 1f 0f	  ldy #$0f1f
$0c:a47e  84 0a		 sty $0a
$0c:a480  05 6f		 ora $6f
$0c:a482  87 c6		 sta [$c6]
$0c:a484  63 18		 adc $18,s
$0c:a486  6c 37 52	  jmp ($5237)
$0c:a489  89 63		 bit #$63
$0c:a48b  d1 ff		 cmp ($ff),y
$0c:a48d  e0 10 f8	  cpx #$f810
$0c:a490  07 f4		 ora [$f4]
$0c:a492  e0 10 0f	  cpx #$0f10
$0c:a495  3c 02 f3	  bit $f302,x
$0c:a498  00 dd		 brk #$dd
$0c:a49a  c0 3b 90	  cpy #$903b
$0c:a49d  09 87		 ora #$87
$0c:a49f  1e c3 8e	  asl $8ec3,x
$0c:a4a2  e1 47		 sbc ($47,x)
$0c:a4a4  30 b3		 bmi $a459
$0c:a4a6  98			tya
$0c:a4a7  65 c2		 adc $c2
$0c:a4a9  27 e3		 and [$e3]
$0c:a4ab  9e 71 2d	  stz $2d71,x
$0c:a4ae  d8			cld
$0c:a4af  eb			xba
$0c:a4b0  e7 ff		 sbc [$ff]
$0c:a4b2  f3 fe		 sbc ($fe,s),y
$0c:a4b4  f9 ff 3c	  sbc $3cff,y
$0c:a4b7  df 8e 7f c2   cmp $c27f8e,x
$0c:a4bb  39 e0 9d	  and $9de0,y
$0c:a4be  f0 2e		 beq $a4ee
$0c:a4c0  38			sec
$0c:a4c1  09 7f		 ora #$7f
$0c:a4c3  3e b1 98	  rol $98b1,x
$0c:a4c6  9f ec 3d d6   sta $d63dec,x
$0c:a4ca  6d 4c 86	  adc $864c
$0c:a4cd  ad 90 9c	  lda $9c90
$0c:a4d0  71 6f		 adc ($6f),y
$0c:a4d2  3f 38 87 fe   and $fe8738,x
$0c:a4d6  4f ff a4 7f   eor $7fa4ff
$0c:a4da  e2 3f		 sep #$3f
$0c:a4dc  fa			plx
$0c:a4dd  b7 fe		 lda [$fe],y
$0c:a4df  57 ff		 eor [$ff],y
$0c:a4e1  81 ff		 sta ($ff,x)
$0c:a4e3  e0 df		 cpx #$df
$0c:a4e5  fe 04 ff	  inc $ff04,x
$0c:a4e8  43 9f		 eor $9f,s
$0c:a4ea  ab			plb
$0c:a4eb  52 b6		 eor ($b6)
$0c:a4ed  b2 4e		 lda ($4e)
$0c:a4ef  fd 0a a5	  sbc $a50a,x
$0c:a4f2  cc d5 e6	  cpy $e6d5
$0c:a4f5  2b			pld
$0c:a4f6  93 0c		 sta ($0c,s),y
$0c:a4f8  00 50		 brk #$50
$0c:a4fa  3f fa 1f fd   and $fd1ffa,x
$0c:a4fe  2b			pld
$0c:a4ff  ff 21 73 0d   sbc $0d7321,x
$0c:a503  18			clc
$0c:a504  24 30		 bit $30
$0c:a506  ef ed e3 e7   sbc $e7e3ed
$0c:a50a  f1 87		 sbc ($87),y
$0c:a50c  24 c3		 bit $c3
$0c:a50e  89 b8		 bit #$b8
$0c:a510  84 ec		 sty $ec
$0c:a512  72 56		 adc ($56)
$0c:a514  29 27		 and #$27
$0c:a516  16 07		 asl $07,x
$0c:a518  00 86		 brk #$86
$0c:a51a  c0 fe		 cpy #$fe
$0c:a51c  70 ff		 bvs $a51d
$0c:a51e  7c 5e bf	  jmp ($bf5e,x)
$0c:a521  2f af 4f f7   and $f74faf
$0c:a525  b7 fb		 lda [$fb],y
$0c:a527  d7 fe		 cmp [$fe],y
$0c:a529  87 7f		 sta [$7f]
$0c:a52b  97 e7		 sta [$e7],y
$0c:a52d  63 ff		 adc $ff,s
$0c:a52f  0a			asl a
$0c:a530  44 ff 03	  mvp $03,$ff
$0c:a533  b7 89		 lda [$89],y
$0c:a535  db			stp
$0c:a536  e1 1c		 sbc ($1c,x)
$0c:a538  6b			rtl
$0c:a539  26 8f		 rol $8f
$0c:a53b  01 00		 ora ($00,x)
$0c:a53d  f1 60		 sbc ($60),y
$0c:a53f  3d fc 0f	  and $0ffc,x
$0c:a542  87 82		 sta [$82]
$0c:a544  91 f0		 sta ($f0),y
$0c:a546  ce 7e 27	  dec $277e
$0c:a549  ff ca ff fb   sbc $fbffca,x
$0c:a54d  e1 83		 sbc ($83,x)
$0c:a54f  9e fc 3d	  stz $3dfc,x
$0c:a552  f8			sed
$0c:a553  4f 7c e7 77   eor $77e77c
$0c:a557  e1 9f		 sbc ($9f,x)
$0c:a559  78			sei
$0c:a55a  ff d8 b1 a8   sbc $a8b1d8,x
$0c:a55e  5f d0 03 7b   eor $7b03d0,x
$0c:a562  80 71		 bra $a5d5
$0c:a564  a0 11		 ldy #$11
$0c:a566  e8			inx
$0c:a567  04 72		 tsb $72
$0c:a569  01 74		 ora ($74,x)
$0c:a56b  22 0c 2b e3   jsl $e32b0c
$0c:a56f  08			php
$0c:a570  bd e0 7f	  lda $7fe0,x
$0c:a573  dc 2c e6	  jml [$e62c]
$0c:a576  86 1d		 stx $1d
$0c:a578  20 f7 fc	  jsr $fcf7
$0c:a57b  38			sec
$0c:a57c  7f c9 bd bb   adc $bbbdc9,x
$0c:a580  ff b4 bf d6   sbc $d6bfb4,x
$0c:a584  67 f6		 adc [$f6]
$0c:a586  38			sec
$0c:a587  ff de 1f 1b   sbc $1b1fde,x
$0c:a58b  83 cf		 sta $cf,s
$0c:a58d  60			rts
$0c:a58e  7c a8 0d	  jmp ($0da8,x)
$0c:a591  33 17		 and ($17,s),y
$0c:a593  99 8b 4c	  sta $4c8b,y
$0c:a596  a5 96		 lda $96
$0c:a598  5a			phy
$0c:a599  cf 2b 65 0d   cmp $0d652b
$0c:a59d  f0 4d		 beq $a5ec
$0c:a59f  f8			sed
$0c:a5a0  f5 cc		 sbc $cc,x
$0c:a5a2  e5 db		 sbc $db
$0c:a5a4  ff ed ff 76   sbc $76ffed,x
$0c:a5a8  ff 9b 6f c5   sbc $c56f9b,x
$0c:a5ac  b7 e1		 lda [$e1],y
$0c:a5ae  df f0 6e 38   cmp $386ef0,x
$0c:a5b2  16 3c		 asl $3c,x
$0c:a5b4  07 16		 ora [$16]
$0c:a5b6  6d fa 8a	  adc $8afa
$0c:a5b9  64 eb		 stz $eb
$0c:a5bb  bd 59 3a	  lda $3a59,x
$0c:a5be  3d a3 3f	  and $3fa3,x
$0c:a5c1  f9 4f fe	  sbc $fe4f,y
$0c:a5c4  51 ff		 eor ($ff),y
$0c:a5c6  8c 7f d3	  sty $d37f
$0c:a5c9  ed 77 b9	  sbc $b977
$0c:a5cc  e6 f0		 inc $f0
$0c:a5ce  17 f8		 ora [$f8],y
$0c:a5d0  46 72		 lsr $72
$0c:a5d2  d1 25		 cmp ($25),y
$0c:a5d4  e2 f2		 sep #$f2
$0c:a5d6  60			rts
$0c:a5d7  1f e8 0f fe   ora $fe0fe8,x
$0c:a5db  19 8f fe	  ora $fe8f,y
$0c:a5de  5f ff ff ff   eor $ffffff,x
$0c:a5e2  bb			tyx
$0c:a5e3  0c 3f 7f	  tsb $7f3f
$0c:a5e6  e6 10		 inc $10
$0c:a5e8  32 47		 and ($47)
$0c:a5ea  e7 6c		 sbc [$6c]
$0c:a5ec  b7 c5		 lda [$c5],y
$0c:a5ee  7a			ply
$0c:a5ef  fa			plx
$0c:a5f0  5f 2e 67 7f   eor $7f672e,x
$0c:a5f4  28			plp
$0c:a5f5  9c 79 21	  stz $2179
$0c:a5f8  95 3c		 sta $3c,x
$0c:a5fa  be ba 57	  ldx $57ba,y
$0c:a5fd  90 80		 bcc $a57f
$0c:a5ff  7a			ply
$0c:a600  20 1f aa	  jsr $aa1f
$0c:a603  07 c2		 ora [$c2]
$0c:a605  c1 df		 cmp ($df,x)
$0c:a607  f8			sed
$0c:a608  7f ff 1e ef   adc $ef1eff,x
$0c:a60c  e7 5b		 sbc [$5b]
$0c:a60e  fb			xce
$0c:a60f  0d fe 5d	  ora $5dfe
$0c:a612  be 70 18	  ldx $1870,y
$0c:a615  74 4a		 stz $4a,x
$0c:a617  79 f3 fe	  adc $fef3,y
$0c:a61a  43 3e		 eor $3e,s
$0c:a61c  10 3f		 bpl $a65d
$0c:a61e  c4 47		 cpy $47
$0c:a620  c1 03		 cmp ($03,x)
$0c:a622  20 04 07	  jsr $0704
$0c:a625  f7 07		 sbc [$07],y
$0c:a627  33 84		 and ($84,s),y
$0c:a629  fe 1f 5f	  inc $5f1f,x
$0c:a62c  9f ef ef ec   sta $ecefef,x
$0c:a630  10 af		 bpl $a5e1
$0c:a632  e3 e5		 sbc $e5,s
$0c:a634  9b			txy
$0c:a635  7a			ply
$0c:a636  7d 22 e5	  adc $e522,x
$0c:a639  02 df		 cop #$df
$0c:a63b  d0 38		 bne $a675
$0c:a63d  b0 22		 bcs $a661
$0c:a63f  48			pha
$0c:a640  64 6c		 stz $6c
$0c:a642  17 0f		 ora [$0f],y
$0c:a644  07 77		 ora [$77]
$0c:a646  c5 bf		 cmp $bf
$0c:a648  fb			xce
$0c:a649  ff 7f e2 66   sbc $66e27f,x
$0c:a64d  5e 05 1b	  lsr $1b05,x
$0c:a650  fd 2c 9e	  sbc $9e2c,x
$0c:a653  7c 6e 33	  jmp ($336e,x)
$0c:a656  ff ef 1e 25   sbc $251eef,x
$0c:a65a  fe 82 fa	  inc $fa82,x
$0c:a65d  e3 10		 sbc $10,s
$0c:a65f  08			php
$0c:a660  04 06		 tsb $06
$0c:a662  01 c3		 ora ($c3,x)
$0c:a664  c0 73		 cpy #$73
$0c:a666  b0 1e		 bcs $a686
$0c:a668  3e 07 ff	  rol $ff07,x
$0c:a66b  c2 cd		 rep #$cd
$0c:a66d  0f ff 9e 87   ora $879eff
$0c:a671  7f f0 7f ef   adc $ef7ff0,x
$0c:a675  71 fc		 adc ($fc),y
$0c:a677  b7 be		 lda [$be],y
$0c:a679  53 bf		 eor ($bf,s),y
$0c:a67b  f3 c2		 sbc ($c2,s),y
$0c:a67d  ea			nop
$0c:a67e  59 7d 6c	  eor $6c7d,y
$0c:a681  af 00 3f 08   lda $083f00
$0c:a685  07 82		 ora [$82]
$0c:a687  01 f0		 ora ($f0,x)
$0c:a689  80 56		 bra $a6e1
$0c:a68b  3e 1f c7	  rol $c71f,x
$0c:a68e  50 f5		 bvc $a685
$0c:a690  ff db 5a 3d   sbc $3d5adb,x
$0c:a694  5f 33 ba 8a   eor $8aba33,x
$0c:a698  79 ee 92	  adc $92ee,y
$0c:a69b  5a			phy
$0c:a69c  3f 7f 7b f6   and $f67b7f,x
$0c:a6a0  84 77		 sty $77
$0c:a6a2  79 8a 50	  adc $508a,y
$0c:a6a5  51 85		 eor ($85),y
$0c:a6a7  a7 ff		 lda [$ff]
$0c:a6a9  99 74 87	  sta $8774,y
$0c:a6ac  fe 00 2e	  inc $2e00,x
$0c:a6af  19 9f ff	  ora $ff9f,y
$0c:a6b2  71 38		 adc ($38),y
$0c:a6b4  a1 d0		 lda ($d0,x)
$0c:a6b6  3e 9f 0c	  rol $0c9f,x
$0c:a6b9  7e 3e cd	  ror $cd3e,x
$0c:a6bc  00 8c		 brk #$8c
$0c:a6be  46 3c		 lsr $3c
$0c:a6c0  7e 0a 35	  ror $350a,x
$0c:a6c3  1b			tcs
$0c:a6c4  8f 00 df 80   sta $80df00
$0c:a6c8  02 01		 cop #$01
$0c:a6ca  70 44		 bvs $a710
$0c:a6cc  84 03		 sty $03
$0c:a6ce  cf 00 8f c0   cmp $c08f00
$0c:a6d2  37 30		 and [$30],y
$0c:a6d4  0d 76 2b	  ora $2b76
$0c:a6d7  6b			rtl
$0c:a6d8  80 e5		 bra $a6bf
$0c:a6da  54 2e b8	  mvn $b8,$2e
$0c:a6dd  89 ff		 bit #$ff
$0c:a6df  62 d9 a6	  per $4dbb
$0c:a6e2  ad 70 3e	  lda $3e70
$0c:a6e5  bf 1a 8f fe   lda $fe8f1a,x
$0c:a6e9  97 ff		 sta [$ff],y
$0c:a6eb  92 ff		 sta ($ff)
$0c:a6ed  e0 48		 cpx #$48
$0c:a6ef  81 8c		 sta ($8c,x)
$0c:a6f1  b0 86		 bcs $a679
$0c:a6f3  15 ff		 ora $ff,x
$0c:a6f5  c5 49		 cmp $49
$0c:a6f7  bf b4 4f d4   lda $d44fb4,x
$0c:a6fb  67 6b		 adc [$6b]
$0c:a6fd  33 ad		 and ($ad,s),y
$0c:a6ff  51 b6		 eor ($b6),y
$0c:a701  78			sei
$0c:a702  8f a6 0a 63   sta $630aa6
$0c:a706  55 5f		 eor $5f,x
$0c:a708  84 8b		 sty $8b
$0c:a70a  ff 84 ff d2   sbc $d2ff84,x
$0c:a70e  3f fb 1f fd   and $fd1ffb,x
$0c:a712  93 ff		 sta ($ff,s),y
$0c:a714  49 ff		 eor #$ff
$0c:a716  f2 bf		 sbc ($bf)
$0c:a718  e0 00		 cpx #$00
$0c:a71a  20 80 3b	  jsr $3b80
$0c:a71d  fd fd 99	  sbc $99fd,x
$0c:a720  2b			pld
$0c:a721  fd 23 93	  sbc $9323,x
$0c:a724  a3 a0		 lda $a0,s
$0c:a726  d2 f1		 cmp ($f1)
$0c:a728  3a			dec a
$0c:a729  4c 1d 87	  jmp $871d
$0c:a72c  07 8b		 ora [$8b]
$0c:a72e  a1 f5		 lda ($f5,x)
$0c:a730  22 4f e0 9b   jsl $9be04f
$0c:a734  40			rti
$0c:a735  2f d0 0b b0   and $b00bd0
$0c:a739  88			dey
$0c:a73a  44 e5 6f	  mvp $6f,$e5
$0c:a73d  80 44		 bra $a783
$0c:a73f  b2 ba		 lda ($ba)
$0c:a741  98			tya
$0c:a742  1f 02 07 56   ora $560702,x
$0c:a746  c0 cb		 cpy #$cb
$0c:a748  f9 3c 8c	  sbc $8c3c,y
$0c:a74b  5c 57 07 d2   jml $d20757
$0c:a74f  97 db		 sta [$db],y
$0c:a751  84 ca		 sty $ca
$0c:a753  25 01		 and $01
$0c:a755  2a			rol a
$0c:a756  03 c8		 ora $c8,s
$0c:a758  67 1e		 adc [$1e]
$0c:a75a  28			plp
$0c:a75b  f8			sed
$0c:a75c  7d 08 b1	  adc $b108,x
$0c:a75f  ed 89 6d	  sbc $6d89
$0c:a762  ef dd c8 ee   sbc $eec8dd
$0c:a766  d2 7b		 cmp ($7b)
$0c:a768  59 ec 67	  eor $67ec,y
$0c:a76b  a3 bf		 lda $bf,s
$0c:a76d  69 ae		 adc #$ae
$0c:a76f  ae 72 fe	  ldx $fe72
$0c:a772  2b			pld
$0c:a773  14 02		 trb $02
$0c:a775  85 00		 sta $00
$0c:a777  93 20		 sta ($20,s),y
$0c:a779  86 95		 stx $95
$0c:a77b  00 a3		 brk #$a3
$0c:a77d  1b			tcs
$0c:a77e  82 f1 d6	  brl $7e72
$0c:a781  aa			tax
$0c:a782  ef e7 9a 99   sbc $999ae7
$0c:a786  47 42		 eor [$42]
$0c:a788  33 37		 and ($37,s),y
$0c:a78a  de 7a ad	  dec $ad7a,x
$0c:a78d  39 f8 04	  and $04f8,y
$0c:a790  1a			inc a
$0c:a791  01 2a		 ora ($2a,x)
$0c:a793  42 0d		 wdm #$0d
$0c:a795  5a			phy
$0c:a796  01 66		 ora ($66,x)
$0c:a798  42 0c		 wdm #$0c
$0c:a79a  58			cli
$0c:a79b  d8			cld
$0c:a79c  e9 58		 sbc #$58
$0c:a79e  3f a2 96 2d   and $2d96a2,x
$0c:a7a2  be dd be	  ldx $bedd,y
$0c:a7a5  06 b9		 asl $b9
$0c:a7a7  e2 da		 sep #$da
$0c:a7a9  70 ab		 bvs $a756
$0c:a7ab  72 7c		 adc ($7c)
$0c:a7ad  f7 8a		 sbc [$8a],y
$0c:a7af  e9 c8		 sbc #$c8
$0c:a7b1  95 f1		 sta $f1,x
$0c:a7b3  83 c0		 sta $c0,s
$0c:a7b5  23 0b		 and $0b,s
$0c:a7b7  fb			xce
$0c:a7b8  88			dey
$0c:a7b9  7f ce 21 be   adc $be21ce,x
$0c:a7bd  c0 9c		 cpy #$9c
$0c:a7bf  61 ed		 adc ($ed,x)
$0c:a7c1  c3 d5		 cmp $d5,s
$0c:a7c3  b5 53		 lda $53,x
$0c:a7c5  fe 1e a7	  inc $a71e,x
$0c:a7c8  af d6 f3 4d   lda $4df3d6
$0c:a7cc  68			pla
$0c:a7cd  3e ac b4	  rol $b4ac,x
$0c:a7d0  57 ea		 eor [$ea],y
$0c:a7d2  e1 21		 sbc ($21,x)
$0c:a7d4  39 39 43	  and $4339,y
$0c:a7d7  f8			sed
$0c:a7d8  ec 1b a4	  cpx $a41b
$0c:a7db  29 9e		 and #$9e
$0c:a7dd  8f 58 6f a0   sta $a06f58
$0c:a7e1  16 17		 asl $17,x
$0c:a7e3  c6 be		 dec $be
$0c:a7e5  38			sec
$0c:a7e6  08			php
$0c:a7e7  e4 60		 cpx $60
$0c:a7e9  50 21		 bvc $a80c
$0c:a7eb  7c 0d 4e	  jmp ($4e0d,x)
$0c:a7ee  01 5d		 ora ($5d,x)
$0c:a7f0  f7 ef		 sbc [$ef],y
$0c:a7f2  af df 6b 37   lda $376bdf
$0c:a7f6  4e bd ce	  lsr $cebd
$0c:a7f9  b9 7f ec	  lda $ec7f,y
$0c:a7fc  df cb ed 57   cmp $57edcb,x
$0c:a800  87 00		 sta [$00]
$0c:a802  81 c0		 sta ($c0,x)
$0c:a804  7f f1 9f fc   adc $fc9ff1,x
$0c:a808  87 fe		 sta [$fe]
$0c:a80a  61 03		 adc ($03,x)
$0c:a80c  08			php
$0c:a80d  40			rti
$0c:a80e  ff f3 ff f8   sbc $f8fff3,x
$0c:a812  cd 87 a1	  cmp $a187
$0c:a815  05 82		 ora $82
$0c:a817  42 a1		 wdm #$a1
$0c:a819  31 56		 and ($56),y
$0c:a81b  f8			sed
$0c:a81c  11 9e		 ora ($9e),y
$0c:a81e  07 00		 ora [$00]
$0c:a820  83 c0		 sta $c0,s
$0c:a822  21 e2		 and ($e2,x)
$0c:a824  f7 1e		 sbc [$1e],y
$0c:a826  81 ec		 sta ($ec,x)
$0c:a828  25 32		 and $32
$0c:a82a  7d 36 74	  adc $7436,x
$0c:a82d  8b			phb
$0c:a82e  08			php
$0c:a82f  b0 8f		 bcs $a7c0
$0c:a831  81 85		 sta ($85,x)
$0c:a833  2e 52 a9	  rol $a952
$0c:a836  3e a7 3f	  rol $3fa7,x
$0c:a839  94 b7		 sty $b7,x
$0c:a83b  d8			cld
$0c:a83c  33 f0		 and ($f0,s),y
$0c:a83e  df 9c e7 dc   cmp $dce79c,x
$0c:a842  a7 63		 lda [$63]
$0c:a844  70 31		 bvs $a877
$0c:a846  d3 79		 cmp ($79,s),y
$0c:a848  73 ad		 adc ($ad,s),y
$0c:a84a  fb			xce
$0c:a84b  20 5f fc	  jsr $fc5f
$0c:a84e  ad fa cb	  lda $cbfa
$0c:a851  f9 8b f9	  sbc $f98b,y
$0c:a854  eb			xba
$0c:a855  19 f9 1c	  ora $1cf9,y
$0c:a858  f1 8e		 sbc ($8e),y
$0c:a85a  df e8 07 e2   cmp $e207e8,x
$0c:a85e  01 e0		 ora ($e0,x)
$0c:a860  80 70		 bra $a8d2
$0c:a862  20 00 f0	  jsr $f000
$0c:a865  cd e0 74	  cmp $74e0
$0c:a868  19 ff 6e	  ora $6eff,y
$0c:a86b  5f 2f ad da   eor $daad2f,x
$0c:a86f  66 fa		 ror $fa
$0c:a871  7a			ply
$0c:a872  dd 5e 54	  cmp $545e,x
$0c:a875  3e 02 70	  rol $7002,x
$0c:a878  11 80		 ora ($80),y
$0c:a87a  0e 3b 77	  asl $773b
$0c:a87d  89 64		 bit #$64
$0c:a87f  13 af		 ora ($af,s),y
$0c:a881  73 bb		 adc ($bb,s),y
$0c:a883  d0 3f		 bne $a8c4
$0c:a885  75 80		 adc $80,x
$0c:a887  88			dey
$0c:a888  55 ee		 eor $ee,x
$0c:a88a  7f 7a 06 1a   adc $1a067a,x
$0c:a88e  01 d3		 ora ($d3,x)
$0c:a890  80 62		 bra $a8f4
$0c:a892  20 18 c8	  jsr $c818
$0c:a895  00 7d		 brk #$7d
$0c:a897  b4 93		 ldy $93,x
$0c:a899  be ef aa	  ldx $aaef,y
$0c:a89c  6d d9 ee	  adc $eed9
$0c:a89f  44 f4 f3	  mvp $f3,$f4
$0c:a8a2  ae e7 ac	  ldx $ace7
$0c:a8a5  66 1d		 ror $1d
$0c:a8a7  d8			cld
$0c:a8a8  95 01		 sta $01,x
$0c:a8aa  24 72		 bit $72
$0c:a8ac  08			php
$0c:a8ad  00 fd		 brk #$fd
$0c:a8af  b6 91		 ldx $91,y
$0c:a8b1  9e 5d cb	  stz $cb5d,x
$0c:a8b4  77 45		 adc [$45],y
$0c:a8b6  e6 44		 inc $44
$0c:a8b8  ff d1 1f eb   sbc $eb1fd1,x
$0c:a8bc  18			clc
$0c:a8bd  ec d0 09	  cpx $09d0
$0c:a8c0  24 02		 bit $02
$0c:a8c2  44 62 18	  mvp $18,$62
$0c:a8c5  11 98		 ora ($98),y
$0c:a8c7  54 65 52	  mvn $52,$65
$0c:a8ca  ef ee a9 df   sbc $dfa9ee
$0c:a8ce  b8			clv
$0c:a8cf  e7 5e		 sbc [$5e]
$0c:a8d1  59 fc 85	  eor $85fc,y
$0c:a8d4  ef 2c 59 2b   sbc $2b592c
$0c:a8d8  77 ba		 adc [$ba],y
$0c:a8da  e7 21		 sbc [$21]
$0c:a8dc  80 41		 bra $a91f
$0c:a8de  a0 30		 ldy #$30
$0c:a8e0  f8			sed
$0c:a8e1  04 22		 tsb $22
$0c:a8e3  01 60		 ora ($60,x)
$0c:a8e5  81 d8		 sta ($d8,x)
$0c:a8e7  64 f7		 stz $f7
$0c:a8e9  18			clc
$0c:a8ea  3d e2 0f	  and $0fe2,x
$0c:a8ed  5a			phy
$0c:a8ee  fd d6 6e	  sbc $6ed6,x
$0c:a8f1  dd f9 c7	  cmp $c7f9,x
$0c:a8f4  ae 69 7f	  ldx $7f69
$0c:a8f7  c8			iny
$0c:a8f8  6f 78 df 9b   adc $9bdf78
$0c:a8fc  36 9f		 rol $9f,x
$0c:a8fe  3d 84 43	  and $4384,x
$0c:a901  06 03		 asl $03
$0c:a903  e1 00		 sbc ($00,x)
$0c:a905  88			dey
$0c:a906  20 03 01	  jsr $0103
$0c:a909  06 e2		 asl $e2
$0c:a90b  67 b8		 adc [$b8]
$0c:a90d  17 ee		 ora [$ee],y
$0c:a90f  04 76		 tsb $76
$0c:a911  67 13		 adc [$13]
$0c:a913  9a			txs
$0c:a914  c5 66		 cmp $66
$0c:a916  90 49		 bcc $a961
$0c:a918  8c 56 75	  sty $7556
$0c:a91b  17 97		 ora [$97],y
$0c:a91d  c1 66		 cmp ($66,x)
$0c:a91f  13 a8		 ora ($a8,s),y
$0c:a921  aa			tax
$0c:a922  0c 17 e9	  tsb $e917
$0c:a925  00 83		 brk #$83
$0c:a927  c0 23		 cpy #$23
$0c:a929  f0 f6		 beq $a921
$0c:a92b  50 4c		 bvc $a979
$0c:a92d  34 97		 bit $97,x
$0c:a92f  88			dey
$0c:a930  e7 a2		 sbc [$a2]
$0c:a932  99 b8 d6	  sta $d6b8,y
$0c:a935  56 2d		 lsr $2d,x
$0c:a937  99 8b a7	  sta $a78b,y
$0c:a93a  c2 59		 rep #$59
$0c:a93c  dc b4 64	  jml [$64b4]
$0c:a93f  3f 90 06 fa   and $fa0690,x
$0c:a943  41 3f		 eor ($3f,x)
$0c:a945  10 8f		 bpl $a8d6
$0c:a947  e7 e3		 sbc [$e3]
$0c:a949  f9 fc 82	  sbc $82fc,y
$0c:a94c  45 66		 eor $66
$0c:a94e  11 79		 ora ($79),y
$0c:a950  c4 2e		 cpy $2e
$0c:a952  6f 12 95 c5   adc $c59512
$0c:a956  25 cb		 and $cb
$0c:a958  90 8e		 bcc $a8e8
$0c:a95a  cb			wai
$0c:a95b  21 33		 and ($33,x)
$0c:a95d  86 29		 stx $29
$0c:a95f  c3 e0		 cmp $e0,s
$0c:a961  91 f8		 sta ($f8),y
$0c:a963  0c 7d 92	  tsb $927d
$0c:a966  10 38		 bpl $a9a0
$0c:a968  fc 1e 21	  jsr ($211e,x)
$0c:a96b  5c d4 51 37   jml $3751d4
$0c:a96f  1a			inc a
$0c:a970  8d 67 33	  sta $3367
$0c:a973  81 d8		 sta ($d8,x)
$0c:a975  ea			nop
$0c:a976  49 25		 eor #$25
$0c:a978  9a			txs
$0c:a979  ca			dex
$0c:a97a  e2 94		 sep #$94
$0c:a97c  1c a5 50	  trb $50a5
$0c:a97f  fc 4e 3f	  jsr ($3f4e,x)
$0c:a982  92 8f		 sta ($8f)
$0c:a984  e7 61		 sbc [$61]
$0c:a986  d4 70		 pei ($70)
$0c:a988  38			sec
$0c:a989  14 12		 trb $12
$0c:a98b  0b			phd
$0c:a98c  06 82		 asl $82
$0c:a98e  c2 61		 rep #$61
$0c:a990  70 c8		 bvs $a95a
$0c:a992  5c 4a 2b 18   jml $182b4a
$0c:a996  8b			phb
$0c:a997  c8			iny
$0c:a998  e5 d0		 sbc $d0
$0c:a99a  18			clc
$0c:a99b  04 0c		 tsb $0c
$0c:a99d  80 2c		 bra $a9cb
$0c:a99f  80 01		 bra $a9a2
$0c:a9a1  0b			phd
$0c:a9a2  00 41		 brk #$41
$0c:a9a4  00 4e		 brk #$4e
$0c:a9a6  68			pla
$0c:a9a7  1c 0e 0b	  trb $0b0e
$0c:a9aa  04 85		 tsb $85
$0c:a9ac  42 62		 wdm #$62
$0c:a9ae  b1 32		 lda ($32),y
$0c:a9b0  73 90		 adc ($90,s),y
$0c:a9b2  8d 06 05	  sta $0506
$0c:a9b5  70 86		 bvs $a93d
$0c:a9b7  c3 26		 cmp $26,s
$0c:a9b9  f3 3e		 sbc ($3e,s),y
$0c:a9bb  c7 3e		 cmp [$3e]
$0c:a9bd  cb			wai
$0c:a9be  3b			tsc
$0c:a9bf  cd fb 2d	  cmp $2dfb
$0c:a9c2  d9 3d 8d	  cmp $8d3d,y
$0c:a9c5  b8			clv
$0c:a9c6  ce 46 d0	  dec $d046
$0c:a9c9  9f c0 3f e8   sta $e83fc0,x
$0c:a9cd  65 de		 adc $de
$0c:a9cf  5c eb 7e c8   jml $c87eeb
$0c:a9d3  17 ff		 ora [$ff],y
$0c:a9d5  2b			pld
$0c:a9d6  7e b2 fe	  ror $feb2,x
$0c:a9d9  62 fe 7a	  per $24da
$0c:a9dc  c6 7e		 dec $7e
$0c:a9de  47 3c		 eor [$3c]
$0c:a9e0  43 b7		 eor $b7,s
$0c:a9e2  fa			plx
$0c:a9e3  01 f8		 ora ($f8,x)
$0c:a9e5  80 78		 bra $aa5f
$0c:a9e7  20 1c 08	  jsr $081c
$0c:a9ea  07 16		 ora [$16]
$0c:a9ec  f3 16		 sbc ($16,s),y
$0c:a9ee  4d 0d 8e	  eor $8e0d
$0c:a9f1  f9 ce f8	  sbc $f8ce,y
$0c:a9f4  4b			phk
$0c:a9f5  7a			ply
$0c:a9f6  5c d8 96 92   jml $9296d8
$0c:a9fa  b4 a7		 ldy $a7,x
$0c:a9fc  4c 04 00	  jmp $0004
$0c:a9ff  7e 03 f0	  ror $f003,x
$0c:aa02  90 b2		 bcc $a9b6
$0c:aa04  87 97		 sta [$97]
$0c:aa06  f4 99 f3	  pea $f399
$0c:aa09  3e 70 4b	  rol $4b70,x
$0c:aa0c  5e 52 df	  lsr $df52,x
$0c:aa0f  94 91		 sty $91,x
$0c:aa11  f4 3b ba	  pea $ba3b
$0c:aa14  aa			tax
$0c:aa15  8c a8 a6	  sty $a6a8
$0c:aa18  50 87		 bvc $a9a1
$0c:aa1a  11 c3		 ora ($c3),y
$0c:aa1c  04 01		 tsb $01
$0c:aa1e  00 c2		 brk #$c2
$0c:aa20  40			rti
$0c:aa21  32 ba		 and ($ba)
$0c:aa23  bf 7e 67 41   lda $41677e,x
$0c:aa27  9f f6 e5 f2   sta $f2e5f6,x
$0c:aa2b  fa			plx
$0c:aa2c  dd a6 6f	  cmp $6fa6,x
$0c:aa2f  a7 ad		 lda [$ad]
$0c:aa31  d5 e5		 cmp $e5,x
$0c:aa33  6f f0 07 fe   adc $fe07f0
$0c:aa37  75 65		 adc $65,x
$0c:aa39  c8			iny
$0c:aa3a  70 e2		 bvs $aa1e
$0c:aa3c  ef a2 dc bf   sbc $bfdca2
$0c:aa40  2c 78 22	  bit $2278
$0c:aa43  52 af		 eor ($af)
$0c:aa45  39 39 27	  and $2739,y
$0c:aa48  84 e5		 sty $e5
$0c:aa4a  8e 40 36	  stx $3640
$0c:aa4d  bc ff fc	  ldy $fcff,x
$0c:aa50  07 7d		 ora [$7d]
$0c:aa52  41 fe		 eor ($fe,x)
$0c:aa54  40			rti
$0c:aa55  fb			xce
$0c:aa56  d6 29		 dec $29,x
$0c:aa58  6e cf a7	  ror $a7cf
$0c:aa5b  3f da df 4a   and $4adfda,x
$0c:aa5f  61 02		 adc ($02,x)
$0c:aa61  20 0a 04	  jsr $040a
$0c:aa64  20 30 4a	  jsr $4a30
$0c:aa67  04 12		 tsb $12
$0c:aa69  c1 07		 cmp ($07,x)
$0c:aa6b  20 87 de	  jsr $de87
$0c:aa6e  01 b1		 ora ($b1,x)
$0c:aa70  87 7f		 sta [$7f]
$0c:aa72  60			rts
$0c:aa73  1f b8 27 7e   ora $7e27b8,x
$0c:aa77  41 ef		 eor ($ef,x)
$0c:aa79  88			dey
$0c:aa7a  21 ca		 and ($ca,x)
$0c:aa7c  b9 00 a4	  lda $a400,y
$0c:aa7f  40			rti
$0c:aa80  21 42		 and ($42,x)
$0c:aa82  65 10		 adc $10
$0c:aa84  16 12		 asl $12,x
$0c:aa86  35 1f		 and $1f,x
$0c:aa88  cd 74 ab	  cmp $ab74
$0c:aa8b  de fb 8e	  dec $8efb,x
$0c:aa8e  d2 d5		 cmp ($d5)
$0c:aa90  9f b1 7e a0   sta $a07eb1,x
$0c:aa94  c3 10		 cmp $10,s
$0c:aa96  cc d9 cf	  cpy $cfd9
$0c:aa99  e1 d9		 sbc ($d9,x)
$0c:aa9b  93 de		 sta ($de,s),y
$0c:aa9d  20 f7 18	  jsr $18f7
$0c:aaa0  3d 85 10	  and $1085,x
$0c:aaa3  30 08		 bmi $aaad
$0c:aaa5  3f 67 f1 28   and $28f167,x
$0c:aaa9  b4 d5		 ldy $d5,x
$0c:aaab  7f 9a 78 f6   adc $f6789a,x
$0c:aaaf  ff 4d 39 a3   sbc $a3394d,x
$0c:aab3  5f f8 1b f8   eor $f81bf8,x
$0c:aab7  04 e7		 tsb $e7
$0c:aab9  8d a9 eb	  sta $eba9
$0c:aabc  6f 78 5f ee   adc $ee5f78
$0c:aac0  05 7b		 ora $7b
$0c:aac2  81 86		 sta ($86,x)
$0c:aac4  54 0a b0	  mvn $b0,$0a
$0c:aac7  35 55		 and $55,x
$0c:aac9  99 54 67	  sta $6754,y
$0c:aacc  d5 d9		 cmp $d9,x
$0c:aace  d5 2d		 cmp $2d,x
$0c:aad0  06 55		 asl $55
$0c:aad2  59 5a 85	  eor $855a,y
$0c:aad5  ab			plb
$0c:aad6  32 8c		 and ($8c)
$0c:aad8  0e 3a 34	  asl $343a
$0c:aadb  18			clc
$0c:aadc  47 87		 eor [$87]
$0c:aade  61 14		 adc ($14,x)
$0c:aae0  82 a7 9c	  brl $478a
$0c:aae3  a9 66 2a	  lda #$2a66
$0c:aae6  d9 ea 9e	  cmp $9eea,y
$0c:aae9  6d a6 55	  adc $55a6
$0c:aaec  4c e5 5f	  jmp $5fe5
$0c:aaef  31 e0		 and ($e0),y
$0c:aaf1  80 07		 bra $aafa
$0c:aaf3  83 c3		 sta $c3,s
$0c:aaf5  00 f2		 brk #$f2
$0c:aaf7  38			sec
$0c:aaf8  8f c7 00 f0   sta $f000c7
$0c:aafc  41 22		 eor ($22,x)
$0c:aafe  d3 18		 cmp ($18,s),y
$0c:ab00  44 9e 2b	  mvp $2b,$9e
$0c:ab03  3b			tsc
$0c:ab04  c2 eb		 rep #$eb
$0c:ab06  b0 b2		 bcs $aaba
$0c:ab08  ae 45 9e	  ldx $9e45
$0c:ab0b  15 27		 ora $27,x
$0c:ab0d  c9 4f e1	  cmp #$e14f
$0c:ab10  f0 08		 beq $ab1a
$0c:ab12  fc 01 fe	  jsr ($fe01,x)
$0c:ab15  15 f8		 ora $f8,x
$0c:ab17  07 7e		 ora [$7e]
$0c:ab19  01 9f		 ora ($9f,x)
$0c:ab1b  03 0f		 ora $0f,s
$0c:ab1d  3e 01 a8	  rol $a801,x
$0c:ab20  a8			tay
$0c:ab21  57 3d		 eor [$3d],y
$0c:ab23  01 10		 ora ($10,x)
$0c:ab25  92 fe		 sta ($fe)
$0c:ab27  7d 7b ac	  adc $ac7b,x
$0c:ab2a  0f e2 7b d0   ora $d07be2
$0c:ab2e  8b			phb
$0c:ab2f  7e ff 90	  ror $90ff,x
$0c:ab32  00 f9		 brk #$f9
$0c:ab34  7f a0 05 30   adc $3005a0,x
$0c:ab38  2d 91 4c	  and $4c91
$0c:ab3b  35 95		 and $95,x
$0c:ab3d  4b			phk
$0c:ab3e  e6 52		 inc $52
$0c:ab40  55 d2		 eor $d2,x
$0c:ab42  eb			xba
$0c:ab43  6a			ror a
$0c:ab44  b6 9e		 ldx $9e,y
$0c:ab46  ca			dex
$0c:ab47  5e f7 b5	  lsr $b5f7,x
$0c:ab4a  6e 82 de	  ror $de82
$0c:ab4d  bf 10 01 f8   lda $f80110,x
$0c:ab51  08			php
$0c:ab52  50 4a		 bvc $ab9e
$0c:ab54  02 92		 cop #$92
$0c:ab56  94 c9		 sty $c9,x
$0c:ab58  aa			tax
$0c:ab59  94 bd		 sty $bd,x
$0c:ab5b  36 76		 rol $76,x
$0c:ab5d  93 3e		 sta ($3e,s),y
$0c:ab5f  da			phx
$0c:ab60  d2 a9		 cmp ($a9)
$0c:ab62  5f 7d 67 6e   eor $6e677d,x
$0c:ab66  a7 be		 lda [$be]
$0c:ab68  00 84		 brk #$84
$0c:ab6a  fe 01 7f	  inc $7f01,x
$0c:ab6d  25 19		 and $19
$0c:ab6f  95 2d		 sta $2d,x
$0c:ab71  59 4f ac	  eor $ac4f,y
$0c:ab74  a6 b5		 ldx $b5
$0c:ab76  b3 da		 lda ($da,s),y
$0c:ab78  f9 a5 5c	  sbc $5ca5,y
$0c:ab7b  de b6 67	  dec $67b6,x
$0c:ab7e  5d 31 ae	  eor $ae31,x
$0c:ab81  da			phx
$0c:ab82  89 a0 25	  bit #$25a0
$0c:ab85  01 18		 ora ($18,x)
$0c:ab87  10 43		 bpl $abcc
$0c:ab89  e0 ec		 cpx #$ec
$0c:ab8b  08			php
$0c:ab8c  07 02		 ora [$02]
$0c:ab8e  01 80		 ora ($80,x)
$0c:ab90  80 72		 bra $ac04
$0c:ab92  fe 13 5e	  inc $5e13,x
$0c:ab95  57 ce		 eor [$ce],y
$0c:ab97  15 d1		 ora $d1,x
$0c:ab99  d4 4d		 pei ($4d)
$0c:ab9b  e9 96 8a	  sbc #$8a96
$0c:ab9e  af af 2f 94   lda $942faf
$0c:aba2  d5 c1		 cmp $c1,x
$0c:aba4  20 09 f2	  jsr $f209
$0c:aba7  83 40		 sta $40,s
$0c:aba9  30 4a		 bmi $abf5
$0c:abab  61 a0		 adc ($a0,x)
$0c:abad  2a			rol a
$0c:abae  87 77		 sta [$77]
$0c:abb0  55 c5		 eor $c5,x
$0c:abb2  51 6e		 eor ($6e),y
$0c:abb4  fa			plx
$0c:abb5  8a			txa
$0c:abb6  2e ab 55	  rol $55ab
$0c:abb9  57 ed		 eor [$ed],y
$0c:abbb  ca			dex
$0c:abbc  75 b6		 adc $b6,x
$0c:abbe  3e a5 2a	  rol $2aa5,x
$0c:abc1  41 00		 eor ($00,x)
$0c:abc3  98			tya
$0c:abc4  40			rti
$0c:abc5  22 0c 21 63   jsl $63210c
$0c:abc9  02 94		 cop #$94
$0c:abcb  23 c6		 and $c6,s
$0c:abcd  01 df		 ora ($df,x)
$0c:abcf  d0 25		 bne $abf6
$0c:abd1  35 7e		 and $7e,x
$0c:abd3  c4 e7		 cpy $e7
$0c:abd5  ad 41 f7	  lda $f741
$0c:abd8  c2 69		 rep #$69
$0c:abda  18			clc
$0c:abdb  38			sec
$0c:abdc  9f 17 c9 1f   sta $1fc917,x
$0c:abe0  46 82		 lsr $82
$0c:abe2  34 14		 bit $14,x
$0c:abe4  a1 3e		 lda ($3e,x)
$0c:abe6  80 5d		 bra $ac45
$0c:abe8  a0 17		 ldy #$17
$0c:abea  e7 41		 sbc [$41]
$0c:abec  ea			nop
$0c:abed  bd c4 d0	  lda $d0c4,x
$0c:abf0  9e f0 a5	  stz $a5f0,x
$0c:abf3  fd 2d 2f	  sbc $2f2d,x
$0c:abf6  63 77		 adc $77,s
$0c:abf8  4c a6 5c	  jmp $5ca6
$0c:abfb  7e 7a c8	  ror $c87a,x
$0c:abfe  8b			phb
$0c:abff  18			clc
$0c:ac00  40			rti
$0c:ac01  05 02		 ora $02
$0c:ac03  53 0e		 eor ($0e,s),y
$0c:ac05  2a			rol a
$0c:ac06  01 4a		 ora ($4a,x)
$0c:ac08  77 1c		 adc [$1c],y
$0c:ac0a  e7 8d		 sbc [$8d]
$0c:ac0c  b7 a7		 lda [$a7],y
$0c:ac0e  6f f9 93 bd   adc $bd93f9
$0c:ac12  47 13		 eor [$13]
$0c:ac14  eb			xba
$0c:ac15  3b			tsc
$0c:ac16  c4 3f		 cpy $3f
$0c:ac18  d1 c2		 cmp ($c2),y
$0c:ac1a  00 70		 brk #$70
$0c:ac1c  a3 40		 lda $40,s
$0c:ac1e  25 50		 and $50
$0c:ac20  0b			phd
$0c:ac21  33 b8		 and ($b8,s),y
$0c:ac23  e2 3e		 sep #$3e
$0c:ac25  ea			nop
$0c:ac26  5f 7b e7 ce   eor $cee77b,x
$0c:ac2a  ea			nop
$0c:ac2b  f3 37		 sbc ($37,s),y
$0c:ac2d  7e ea af	  ror $afea,x
$0c:ac30  31 fe		 and ($fe),y
$0c:ac32  8b			phb
$0c:ac33  f0 5f		 beq $ac94
$0c:ac35  84 89		 sty $89
$0c:ac37  8c 24 90	  sty $9024
$0c:ac3a  17 a5		 ora [$a5],y
$0c:ac3c  13 bb		 ora ($bb,s),y
$0c:ac3e  ee ee 87	  inc $87ee
$0c:ac41  43 89		 eor $89,s
$0c:ac43  d5 0e		 cmp $0e,x
$0c:ac45  b1 24		 lda ($24),y
$0c:ac47  09 20		 ora #$20
$0c:ac49  2d 01 59	  and $5901
$0c:ac4c  0c 42 bf	  tsb $bf42
$0c:ac4f  60			rts
$0c:ac50  d7 d0		 cmp [$d0],y
$0c:ac52  35 fd		 and $fd,x
$0c:ac54  8b			phb
$0c:ac55  fe 03 3f	  inc $3f03,x
$0c:ac58  20 b5 d4	  jsr $d4b5
$0c:ac5b  2c fb 81	  bit $81fb
$0c:ac5e  19 7c 00	  ora $007c,y
$0c:ac61  07 c0		 ora [$c0]
$0c:ac63  80 6f		 bra $acd4
$0c:ac65  18			clc
$0c:ac66  c3 12		 cmp $12,s
$0c:ac68  ff e2 29 3e   sbc $3e29e2,x
$0c:ac6c  3b			tsc
$0c:ac6d  0e ce 63	  asl $63ce
$0c:ac70  5c ed e3 e3   jml $e3e3ed
$0c:ac74  bb			tyx
$0c:ac75  59 ae aa	  eor $aaae,y
$0c:ac78  76 c6		 ror $c6,x
$0c:ac7a  09 b3		 ora #$b3
$0c:ac7c  28			plp
$0c:ac7d  69 d0		 adc #$d0
$0c:ac7f  09 34		 ora #$34
$0c:ac81  02 c5		 cop #$c5
$0c:ac83  00 06		 brk #$06
$0c:ac85  85 12		 sta $12
$0c:ac87  01 ea		 ora ($ea,x)
$0c:ac89  9c cd 7b	  stz $7bcd
$0c:ac8c  94 5d		 sty $5d,x
$0c:ac8e  e7 ef		 sbc [$ef]
$0c:ac90  0f ac e9 d9   ora $d9e9ac
$0c:ac94  ab			plb
$0c:ac95  3a			dec a
$0c:ac96  9c fd a3	  stz $a3fd
$0c:ac99  31 07		 and ($07),y
$0c:ac9b  b8			clv
$0c:ac9c  48			pha
$0c:ac9d  ef 10 3b fc   sbc $fc3b10
$0c:aca1  02 7f		 cop #$7f
$0c:aca3  00 87		 brk #$87
$0c:aca5  e0 20		 cpx #$20
$0c:aca7  f4 08 04	  pea $0408
$0c:acaa  1e 01 57	  asl $5701,x
$0c:acad  ce 78 a6	  dec $a678
$0c:acb0  d1 fe		 cmp ($fe),y
$0c:acb2  ec be 63	  cpx $63be
$0c:acb5  d6 f5		 dec $f5,x
$0c:acb7  4a			lsr a
$0c:acb8  fa			plx
$0c:acb9  fb			xce
$0c:acba  4d e7 5e	  eor $5ee7
$0c:acbd  31 e0		 and ($e0),y
$0c:acbf  87 73		 sta [$73]
$0c:acc1  63 de		 adc $de,s
$0c:acc3  0f f7 03 f9   ora $f903f7
$0c:acc7  01 41		 ora ($41,x)
$0c:acc9  87 82		 sta [$82]
$0c:accb  86 e9		 stx $e9
$0c:accd  08			php
$0c:acce  05 52		 ora $52
$0c:acd0  ff 4d b3 c4   sbc $c4b34d,x
$0c:acd4  e7 b4		 sbc [$b4]
$0c:acd6  8b			phb
$0c:acd7  7f 97 95 39   adc $399597,x
$0c:acdb  eb			xba
$0c:acdc  7e a2 b8	  ror $b8a2,x
$0c:acdf  0b			phd
$0c:ace0  7e 3e 01	  ror $013e,x
$0c:ace3  9f 80 73 c0   sta $c07380,x
$0c:ace7  03 1f		 ora $1f,s
$0c:ace9  63 80		 adc $80,s
$0c:aceb  20 40 e1	  jsr $e140
$0c:acee  9f b9 70 2f   sta $2f70b9,x
$0c:acf2  35 3f		 and $3f,x
$0c:acf4  55 d3		 eor $d3,x
$0c:acf6  d5 21		 cmp $21,x
$0c:acf8  fd d3 37	  sbc $37d3,x
$0c:acfb  72 5e		 adc ($5e)
$0c:acfd  d6 a6		 dec $a6,x
$0c:acff  bd fd 37	  lda $37fd,x
$0c:ad02  08			php
$0c:ad03  7c 03 e1	  jmp ($e103,x)
$0c:ad06  fc 13 2e	  jsr ($2e13,x)
$0c:ad09  aa			tax
$0c:ad0a  b7 c1		 lda [$c1],y
$0c:ad0c  ad 5f f4	  lda $f45f
$0c:ad0f  b9 4d 6c	  lda $6c4d,y
$0c:ad12  f6 99		 inc $99,x
$0c:ad14  3a			dec a
$0c:ad15  ef 59 b1 5d   sbc $5db159
$0c:ad19  b8			clv
$0c:ad1a  bc 9e 00	  ldy $009e,x
$0c:ad1d  3f 07 58 10   and $105807,x
$0c:ad21  c3 07		 cmp $07,s
$0c:ad23  00 80		 brk #$80
$0c:ad25  c0 0b		 cpy #$0b
$0c:ad27  e1 20		 sbc ($20,x)
$0c:ad29  80 65		 bra $ad90
$0c:ad2b  bd 96 5d	  lda $5d96,x
$0c:ad2e  cd 6b 67	  cmp $676b
$0c:ad31  b4 b3		 ldy $b3,x
$0c:ad33  da			phx
$0c:ad34  f9 bd 6c	  sbc $6cbd,y
$0c:ad37  ce b6 75	  dec $75b6
$0c:ad3a  43 ba		 eor $ba,s
$0c:ad3c  08			php
$0c:ad3d  43 fc		 eor $fc,s
$0c:ad3f  26 1f		 rol $1f
$0c:ad41  c2 08		 rep #$08
$0c:ad43  5d a0 89	  eor $89a0,x
$0c:ad46  0c 44 03	  tsb $0344
$0c:ad49  7f d4 b0 e4   adc $e4b0d4,x
$0c:ad4d  b7 dc		 lda [$dc],y
$0c:ad4f  b8			clv
$0c:ad50  ad b7 75	  lda $75b7
$0c:ad53  06 8e		 asl $8e
$0c:ad55  c8			iny
$0c:ad56  fd db 1a	  sbc $1adb,x
$0c:ad59  ef 4a 11 00   sbc $00114a
$0c:ad5d  86 40		 stx $40
$0c:ad5f  20 90 0c	  jsr $0c90
$0c:ad62  14 03		 trb $03
$0c:ad64  82 6a 16	  brl $c3d1
$0c:ad67  58			cli
$0c:ad68  13 42		 ora ($42,s),y
$0c:ad6a  fd e3 d6	  sbc $d6e3,x
$0c:ad6d  5d 7f 71	  eor $717f,x
$0c:ad70  9f 7c a7 49   sta $49a77c,x
$0c:ad74  83 8e		 sta $8e,s
$0c:ad76  68			pla
$0c:ad77  ae 98 a9	  ldx $a998
$0c:ad7a  5f 1a 01 00   eor $00011a,x
$0c:ad7e  81 40		 sta ($40,x)
$0c:ad80  20 d0 08	  jsr $08d0
$0c:ad83  b2 38		 lda ($38)
$0c:ad85  20 0c 40	  jsr $400c
$0c:ad88  54 94 aa	  mvn $aa,$94
$0c:ad8b  4b			phk
$0c:ad8c  55 a7		 eor $a7,x
$0c:ad8e  da			phx
$0c:ad8f  aa			tax
$0c:ad90  b9 4d 5f	  lda $5f4d,y
$0c:ad93  4f 7d 24 af   eor $af247d
$0c:ad97  f5 65		 sbc $65,x
$0c:ad99  7a			ply
$0c:ad9a  ba			tsx
$0c:ad9b  f0 1c		 beq $adb9
$0c:ad9d  27 ec		 and [$ec]
$0c:ad9f  01 54		 ora ($54,x)
$0c:ada1  90 84		 bcc $ad27
$0c:ada3  19 25 92	  ora $9225,y
$0c:ada6  bf d9 3c b5   lda $b53cd9,x
$0c:adaa  fe 04 4b	  inc $4b04,x
$0c:adad  0b			phd
$0c:adae  68			pla
$0c:adaf  e2 d2		 sep #$d2
$0c:adb1  fa			plx
$0c:adb2  12 cc		 ora ($cc)
$0c:adb4  0d 51 0e	  ora $0e51
$0c:adb7  10 08		 bpl $adc1
$0c:adb9  db			stp
$0c:adba  08			php
$0c:adbb  d8			cld
$0c:adbc  28			plp
$0c:adbd  c1 0a		 cmp ($0a,x)
$0c:adbf  25 df		 and $df
$0c:adc1  d5 dd		 cmp $dd,x
$0c:adc3  dd e2 28	  cmp $28e2,x
$0c:adc6  9d fd 77	  sta $77fd,x
$0c:adc9  f7 a7		 sbc [$a7],y
$0c:adcb  a8			tay
$0c:adcc  9a			txs
$0c:adcd  53 7f		 eor ($7f,s),y
$0c:adcf  f8			sed
$0c:add0  4d 54 02	  eor $0254
$0c:add3  4d 00 b3	  eor $b300
$0c:add6  40			rti
$0c:add7  24 4a		 bit $4a
$0c:add9  03 42		 ora $42,s
$0c:addb  82 84 28	  brl $d662
$0c:adde  b7 6f		 lda [$6f],y
$0c:ade0  6f 73 73 8c   adc $8c7373
$0c:ade4  a1 ff		 lda ($ff,x)
$0c:ade6  bf 3c ce bf   lda $bfce3c,x
$0c:adea  3b			tsc
$0c:adeb  77 ee		 adc [$ee],y
$0c:aded  aa			tax
$0c:adee  f3 1f		 sbc ($1f,s),y
$0c:adf0  e0 05		 cpx #$05
$0c:adf2  0b			phd
$0c:adf3  14 00		 trb $00
$0c:adf5  9a			txs
$0c:adf6  00 50		 brk #$50
$0c:adf8  26 82		 rol $82
$0c:adfa  7c 00 a0	  jmp ($a000,x)
$0c:adfd  1b			tcs
$0c:adfe  08			php
$0c:adff  8f 32 aa 1a   sta $1aaa32
$0c:ae03  11 88		 ora ($88),y
$0c:ae05  5d fd c1	  eor $c1fd,x
$0c:ae08  b1 e7		 lda ($e7),y
$0c:ae0a  0a			asl a
$0c:ae0b  c9 1a		 cmp #$1a
$0c:ae0d  02 b2		 cop #$b2
$0c:ae0f  24 12		 bit $12
$0c:ae11  34 1d		 bit $1d,x
$0c:ae13  e1 ee		 sbc ($ee,x)
$0c:ae15  79 17 fc	  adc $fc17,y
$0c:ae18  a2 75		 ldx #$75
$0c:ae1a  57 98		 eor [$98],y
$0c:ae1c  07 c8		 ora [$c8]
$0c:ae1e  06 46		 asl $46
$0c:ae20  12 7f		 ora ($7f)
$0c:ae22  80 0c		 bra $ae30
$0c:ae24  19 a1 bf	  ora $bfa1,y
$0c:ae27  80 7d		 bra $aea6
$0c:ae29  e1 1f		 sbc ($1f,x)
$0c:ae2b  b8			clv
$0c:ae2c  24 fe		 bit $fe
$0c:ae2e  81 af		 sta ($af,x)
$0c:ae30  a8			tay
$0c:ae31  67 e8		 adc [$e8]
$0c:ae33  0c d0 15	  tsb $15d0
$0c:ae36  87 00		 sta [$00]
$0c:ae38  54 38 08	  mvn $08,$38
$0c:ae3b  07 81		 ora [$81]
$0c:ae3d  08			php
$0c:ae3e  24 32		 bit $32
$0c:ae40  f6 c4		 inc $c4,x
$0c:ae42  ae ff ec	  ldx $ecff
$0c:ae45  e4 76		 cpx $76
$0c:ae47  89 8d		 bit #$8d
$0c:ae49  d1 e0		 cmp ($e0),y
$0c:ae4b  2c 58 1c	  bit $1c58
$0c:ae4e  45 07		 eor $07
$0c:ae50  ab			plb
$0c:ae51  13 41		 ora ($41,s),y
$0c:ae53  0c 00 46	  tsb $4600
$0c:ae56  17 28		 ora [$28],y
$0c:ae58  05 f9		 ora $f9
$0c:ae5a  4c 76 e8	  jmp $e876
$0c:ae5d  07 f6		 ora [$f6]
$0c:ae5f  07 fa		 ora [$fa]
$0c:ae61  83 5d		 sta $5d,s
$0c:ae63  71 9a		 adc ($9a),y
$0c:ae65  ae ca d4	  ldx $d4ca
$0c:ae68  25 55		 and $55
$0c:ae6a  95 a8		 sta $a8,x
$0c:ae6c  5a			phy
$0c:ae6d  b3 22		 lda ($22,s),y
$0c:ae6f  b0 80		 bcs $adf1
$0c:ae71  c0 20		 cpy #$20
$0c:ae73  70 08		 bvs $ae7d
$0c:ae75  3b			tsc
$0c:ae76  10 70		 bpl $aee8
$0c:ae78  ec 42 90	  cpx $9042
$0c:ae7b  76 fc		 ror $fc,x
$0c:ae7d  9a			txs
$0c:ae7e  a9 85		 lda #$85
$0c:ae80  5b			tcd
$0c:ae81  3d 53 cd	  and $cd53,x
$0c:ae84  b4 ca		 ldy $ca,x
$0c:ae86  a9 9c		 lda #$9c
$0c:ae88  ab			plb
$0c:ae89  e6 05		 inc $05
$0c:ae8b  61 c7		 adc ($c7,x)
$0c:ae8d  80 78		 bra $af07
$0c:ae8f  60			rts
$0c:ae90  1e 47 11	  asl $1147,x
$0c:ae93  f8			sed
$0c:ae94  d0 c1		 bne $ae57
$0c:ae96  04 d2		 tsb $d2
$0c:ae98  d2 f7		 cmp ($f7)
$0c:ae9a  55 0a		 eor $0a,x
$0c:ae9c  b6 c2		 ldx $c2,y
$0c:ae9e  97 b8		 sta [$b8],y
$0c:aea0  d3 d4		 cmp ($d4,s),y
$0c:aea2  39 b3 8d	  and $8db3,y
$0c:aea5  15 4b		 ora $4b,x
$0c:aea7  ab			plb
$0c:aea8  6f 8f c0 21   adc $21c08f
$0c:aeac  e0 01		 cpx #$01
$0c:aeae  62 80 0c	  per $bb31
$0c:aeb1  a1 a8		 lda ($a8,x)
$0c:aeb3  21 fe		 and ($fe,x)
$0c:aeb5  d7 bb		 cmp [$bb],y
$0c:aeb7  30 6d		 bmi $af26
$0c:aeb9  45 1f		 eor $1f
$0c:aebb  d9 03 b8	  cmp $b803,y
$0c:aebe  c0 b4		 cpy #$b4
$0c:aec0  f0 6b		 beq $af2d
$0c:aec2  4d 0a b3	  eor $b30a
$0c:aec5  fe fe 40	  inc $40fe,x
$0c:aec8  03 ed		 ora $ed,s
$0c:aeca  f8			sed
$0c:aecb  80 6f		 bra $af3c
$0c:aecd  01 85		 ora ($85,x)
$0c:aecf  02 ca		 cop #$ca
$0c:aed1  7a			ply
$0c:aed2  a3 79		 lda $79,s
$0c:aed4  cd 9f 0b	  cmp $0b9f
$0c:aed7  9f e0 9a d0   sta $d09ae0,x
$0c:aedb  fd 59 68	  sbc $6859,x
$0c:aede  cf fd 82 0c   cmp $0c82fd
$0c:aee2  10 b0		 bpl $ae94
$0c:aee4  40			rti
$0c:aee5  2f 8a 61 ff   and $ff618a
$0c:aee9  40			rti
$0c:aeea  2f ea 61 9a   and $9a61ea
$0c:aeee  ca			dex
$0c:aeef  a7 d2		 lda [$d2]
$0c:aef1  9a			txs
$0c:aef2  ad 2e d5	  lda $d52e
$0c:aef5  55 b7		 eor $b7,x
$0c:aef7  55 72		 eor $72,x
$0c:aef9  9b			txy
$0c:aefa  be de d7	  ldx $d7de,y
$0c:aefd  cb			wai
$0c:aefe  9b			txy
$0c:aeff  7f 83 fc 27   adc $27fc83,x
$0c:af03  e6 23		 inc $23
$0c:af05  25 81		 and $81
$0c:af07  a4 aa		 ldy $aa
$0c:af09  bd ae 1d	  lda $1dae,x
$0c:af0c  6a			ror a
$0c:af0d  7d e5 f4	  adc $f4e5,x
$0c:af10  ed 77 9b	  sbc $9b77
$0c:af13  28			plp
$0c:af14  e6 ef		 inc $ef
$0c:af16  cd 51 ad	  cmp $ad51
$0c:af19  da			phx
$0c:af1a  1d 20 e9	  ora $e920,x
$0c:af1d  0e 12 08	  asl $0812
$0c:af20  78			sei
$0c:af21  30 0e		 bmi $af31
$0c:af23  04 03		 tsb $03
$0c:af25  11 00		 ora ($00),y
$0c:af27  c2 40		 rep #$40
$0c:af29  24 5e		 bit $5e
$0c:af2b  fa			plx
$0c:af2c  86 e7		 stx $e7
$0c:af2e  d7 19		 cmp [$19],y
$0c:af30  ab			plb
$0c:af31  ec 75 96	  cpx $9675
$0c:af34  3a			dec a
$0c:af35  c7 0b		 cmp [$0b]
$0c:af37  6d 0a 94	  adc $940a
$0c:af3a  e1 a2		 sbc ($a2,x)
$0c:af3c  10 08		 bpl $af46
$0c:af3e  32 80		 and ($80)
$0c:af40  61 d0		 adc ($d0,x)
$0c:af42  08			php
$0c:af43  f1 99		 sbc ($99),y
$0c:af45  6f dd 4d 0d   adc $0d4ddd
$0c:af49  76 75		 ror $75,x
$0c:af4b  eb			xba
$0c:af4c  e0 4e		 cpx #$4e
$0c:af4e  f6 f5		 inc $f5,x
$0c:af50  5a			phy
$0c:af51  17 d6		 ora [$d6],y
$0c:af53  d7 ac		 cmp [$ac],y
$0c:af55  81 fa		 sta ($fa,x)
$0c:af57  3f e4 81 12   and $1281e4,x
$0c:af5b  a0 a4		 ldy #$a4
$0c:af5d  3e 10 0f	  rol $0f10,x
$0c:af60  a4 02		 ldy $02
$0c:af62  d5 c1		 cmp $c1,x
$0c:af64  88			dey
$0c:af65  62 6b fc	  per $abd3
$0c:af68  08			php
$0c:af69  96 16		 stx $16,y
$0c:af6b  d1 c5		 cmp ($c5),y
$0c:af6d  a5 f4		 lda $f4
$0c:af6f  25 98		 and $98
$0c:af71  1a			inc a
$0c:af72  a7 04		 lda [$04]
$0c:af74  ce 4d f4	  dec $f44d
$0c:af77  6f a7 56 57   adc $5756a7
$0c:af7b  bd ac f2	  lda $f2ac,x
$0c:af7e  a6 1f		 ldx $1f
$0c:af80  29 a6		 and #$a6
$0c:af82  66 ad		 ror $ad
$0c:af84  bd a5 62	  lda $62a5,x
$0c:af87  ac d7 dd	  ldy $ddd7
$0c:af8a  9c 1d 48	  stz $481d
$0c:af8d  31 f8		 and ($f8),y
$0c:af8f  09 84		 ora #$84
$0c:af91  a3 f2		 lda $f2,s
$0c:af93  08			php
$0c:af94  f4 86 1f	  pea $1f86
$0c:af97  10 d5		 bpl $af6e
$0c:af99  71 72		 adc ($72),y
$0c:af9b  39 7f 64	  and $647f,y
$0c:af9e  2e a5 21	  rol $21a5
$0c:afa1  b4 e3		 ldy $e3,x
$0c:afa3  eb			xba
$0c:afa4  9b			txy
$0c:afa5  79 8c 8e	  adc $8e8c,y
$0c:afa8  9d fd 24	  sta $24fd,x
$0c:afab  81 34		 sta ($34,x)
$0c:afad  3f d8 0f b4   and $b40fd8,x
$0c:afb1  23 f5		 and $f5,s
$0c:afb3  04 13		 tsb $13
$0c:afb5  84 fb		 sty $fb
$0c:afb7  89 f2		 bit #$f2
$0c:afb9  84 56		 sty $56
$0c:afbb  bd b2 de	  lda $deb2,x
$0c:afbe  3d 77 4d	  and $4d77,x
$0c:afc1  a0 fc		 ldy #$fc
$0c:afc3  6e b6 f6	  ror $f6b6
$0c:afc6  ef 8a fc 36   sbc $36fc8a
$0c:afca  df d8 04 0f   cmp $0f04d8,x
$0c:afce  e1 0f		 sbc ($0f,x)
$0c:afd0  f8			sed
$0c:afd1  c3 fe		 cmp $fe,s
$0c:afd3  f0 fa		 beq $afcf
$0c:afd5  04 3e		 tsb $3e
$0c:afd7  00 ff		 brk #$ff
$0c:afd9  08			php
$0c:afda  14 02		 trb $02
$0c:afdc  01 d6		 ora ($d6,x)
$0c:afde  94 d4		 sty $d4,x
$0c:afe0  a9 bc		 lda #$bc
$0c:afe2  0e fd 5a	  asl $5afd
$0c:afe5  7f 86 e3 6d   adc $6de386,x
$0c:afe9  6f eb f0 c5   adc $c5f0eb
$0c:afed  6f e0 1e 0d   adc $0d1ee0
$0c:aff1  f9 80 7f	  sbc $7f80,y
$0c:aff4  fe 09 cf	  inc $cf09,x
$0c:aff7  80 be		 bra $afb7
$0c:aff9  10 0b		 bpl $b006
$0c:affb  05 02		 ora $02
$0c:affd  01 b4		 ora ($b4,x)
$0c:afff  e7 72		 sbc [$72]
$0c:b001  25 d0		 and $d0
$0c:b003  4f b6 83 f7   eor $f783b6
$0c:b007  3b			tsc
$0c:b008  9e ef f8	  stz $f8ef,x
$0c:b00b  0b			phd
$0c:b00c  f0 dd		 beq $afeb
$0c:b00e  ff 20 30 0f   sbc $0f3020,x
$0c:b012  8c 03 f3	  sty $f303
$0c:b015  00 1f		 brk #$1f
$0c:b017  07 00		 ora [$00]
$0c:b019  9a			txs
$0c:b01a  07 f0		 ora [$f0]
$0c:b01c  3f 84 03 75   and $750384,x
$0c:b020  ef 8c 56 6d   sbc $6d568c
$0c:b024  7e 9f 9f	  ror $9f9f,x
$0c:b027  c6 d9		 dec $d9
$0c:b029  4b			phk
$0c:b02a  c9 ec		 cmp #$ec
$0c:b02c  ef 3a bf 34   sbc $34bf3a
$0c:b030  42 31		 wdm #$31
$0c:b032  00 ef		 brk #$ef
$0c:b034  48			pha
$0c:b035  3d d1 01	  and $01d1,x
$0c:b038  28			plp
$0c:b039  6f a0 16 ef   adc $ef16a0
$0c:b03d  c4 1b		 cpy $1b
$0c:b03f  f1 0f		 sbc ($0f),y
$0c:b041  90 65		 bcc $b0a8
$0c:b043  75 7e		 adc $7e,x
$0c:b045  fc ce 83	  jsr ($83ce,x)
$0c:b048  3f ed cb fb   and $fbcbed,x
$0c:b04c  62 79 be	  per $6ec8
$0c:b04f  d7 eb		 cmp [$eb],y
$0c:b051  fd d7 f7	  sbc $f7d7,x
$0c:b054  ba			tsx
$0c:b055  c1 7e		 cmp ($7e,x)
$0c:b057  8c 00 92	  sty $9200
$0c:b05a  df e0 2b f1   cmp $f12be0,x
$0c:b05e  ed de 25	  sbc $25de
$0c:b061  90 4e		 bcc $b0b1
$0c:b063  bd ce ef	  lda $efce,x
$0c:b066  40			rti
$0c:b067  fd d6 35	  sbc $35d6,x
$0c:b06a  90 4a		 bcc $b0b6
$0c:b06c  bf ce ef 80   lda $80efce,x
$0c:b070  c3 40		 cmp $40,s
$0c:b072  3a			dec a
$0c:b073  70 0c		 bvs $b081
$0c:b075  44 03 19	  mvp $19,$03
$0c:b078  00 6f		 brk #$6f
$0c:b07a  85 4f		 sta $4f
$0c:b07c  01 08		 ora ($08,x)
$0c:b07e  c0 43		 cpy #$43
$0c:b080  38			sec
$0c:b081  1a			inc a
$0c:b082  49 df		 eor #$df
$0c:b084  77 d5		 adc [$d5],y
$0c:b086  36 ec		 rol $ec,x
$0c:b088  f7 22		 sbc [$22],y
$0c:b08a  7a			ply
$0c:b08b  79 d7 73	  adc $73d7,y
$0c:b08e  d7 35		 cmp [$35],y
$0c:b090  ed 77 a2	  sbc $a277
$0c:b093  26 d0		 rol $d0
$0c:b095  00 14		 brk #$14
$0c:b097  82 00 ff	  brl $af9a
$0c:b09a  65 7b		 adc $7b
$0c:b09c  5f f0 39 ee   eor $ee39f0,x
$0c:b0a0  f7 7a		 sbc [$7a],y
$0c:b0a2  fd eb bb	  sbc $bbeb,x
$0c:b0a5  2f e2 42 ca   and $ca42e2
$0c:b0a9  0f f8 ac 25   ora $25acf8
$0c:b0ad  5e ef fe	  lsr $feef,x
$0c:b0b0  03 a3		 ora $a3,s
$0c:b0b2  6e 82 4f	  ror $4f82
$0c:b0b5  6d d3 d8	  adc $d8d3
$0c:b0b8  dc 22 63	  jml [$6322]
$0c:b0bb  18			clc
$0c:b0bc  82 43 62	  brl $1302
$0c:b0bf  20 01 c0	  jsr $c001
$0c:b0c2  40			rti
$0c:b0c3  28			plp
$0c:b0c4  44 41 93	  mvp $93,$41
$0c:b0c7  12 06		 ora ($06)
$0c:b0c9  25 00		 and $00
$0c:b0cb  aa			tax
$0c:b0cc  5d c5 81	  eor $81c5,x
$0c:b0cf  8b			phb
$0c:b0d0  bb			tyx
$0c:b0d1  70 2b		 bvs $b0fe
$0c:b0d3  97 6e		 sta [$6e],y
$0c:b0d5  e4 e3		 cpx $e3
$0c:b0d7  21 cc		 and ($cc,x)
$0c:b0d9  ac 48 36	  ldy $3648
$0c:b0dc  0e 30 44	  asl $4430
$0c:b0df  14 88		 trb $88
$0c:b0e1  c8			iny
$0c:b0e2  36 48		 rol $48,x
$0c:b0e4  04 92		 tsb $92
$0c:b0e6  01 48		 ora ($48,x)
$0c:b0e8  80 56		 bra $b140
$0c:b0ea  bd bb eb	  lda $ebbb,x
$0c:b0ed  ff 5e df f7   sbc $f7df5e,x
$0c:b0f1  ab			plb
$0c:b0f2  f3 2d		 sbc ($2d,s),y
$0c:b0f4  de fb f7	  dec $f7fb,x
$0c:b0f7  f2 fb		 sbc ($fb)
$0c:b0f9  29 c3		 and #$c3
$0c:b0fb  90 07		 bcc $b104
$0c:b0fd  fe 81 08	  inc $0881,x
$0c:b100  47 fe		 eor [$fe]
$0c:b102  32 2c		 and ($2c)
$0c:b104  18			clc
$0c:b105  1f fe ff ff   ora $fffffe,x
$0c:b109  cb			wai
$0c:b10a  7a			ply
$0c:b10b  7a			ply
$0c:b10c  5c df 07 7e   jml $7e07df
$0c:b110  ed 3f d3	  sbc $d33f
$0c:b113  59 ba b3	  eor $b3ba,y
$0c:b116  f4 10 72	  pea $7210
$0c:b119  bd e0 40	  lda $40e0,x
$0c:b11c  9f f8 14 21   sta $2114f8,x
$0c:b120  ff f0 46 7c   sbc $7c46f0,x
$0c:b124  10 0b		 bpl $b131
$0c:b126  01 08		 ora ($08,x)
$0c:b128  22 18 0b 6e   jsl $6e0b18
$0c:b12c  4e 8b b3	  lsr $b38b
$0c:b12f  87 fc		 sta [$fc]
$0c:b131  ee 3f cb	  inc $cb3f
$0c:b134  0d 9b 55	  ora $559b
$0c:b137  fd ff 40	  sbc $40ff,x
$0c:b13a  6a			ror a
$0c:b13b  5f d0 58 7e   eor $7e58d0,x
$0c:b13f  20 ec 10	  jsr $10ec
$0c:b142  fd c1 f3	  sbc $f3c1,x
$0c:b145  10 38		 bpl $b17f
$0c:b147  04 08		 tsb $08
$0c:b149  80 30		 bra $b17b
$0c:b14b  0a			asl a
$0c:b14c  d6 df		 dec $df,x
$0c:b14e  7d fe f5	  adc $f5fe,x
$0c:b151  7d af 76	  adc $76af,x
$0c:b154  af 35 db f7   lda $f7db35
$0c:b158  7e ef 5f	  ror $5fef,x
$0c:b15b  ea			nop
$0c:b15c  bc b3 10	  ldy $10b3,x
$0c:b15f  0a			asl a
$0c:b160  cb			wai
$0c:b161  0b			phd
$0c:b162  ff 86 8b 04   sbc $048b86,x
$0c:b166  5a			phy
$0c:b167  09 a0		 ora #$a0
$0c:b169  c1 d1		 cmp ($d1,x)
$0c:b16b  72 b6		 adc ($b6)
$0c:b16d  4d 5d 03	  eor $035d
$0c:b170  e7 35		 sbc [$35]
$0c:b172  a5 6b		 lda $6b
$0c:b174  43 61		 eor $61,s
$0c:b176  2a			rol a
$0c:b177  dc f5 a3	  jml [$a3f5]
$0c:b17a  d3 b8		 cmp ($b8,s),y
$0c:b17c  64 2e		 stz $2e
$0c:b17e  6f 1f 90 43   adc $43901f
$0c:b182  e2 11		 sep #$11
$0c:b184  38			sec
$0c:b185  64 06		 stz $06
$0c:b187  0f 47 80 58   ora $588047
$0c:b18b  60			rts
$0c:b18c  15 0e		 ora $0e,x
$0c:b18e  1d db 8f	  ora $8fdb,x
$0c:b191  2d f8 df	  and $dff8
$0c:b194  fd ba 4e	  sbc $4eba,x
$0c:b197  3e 66 97	  rol $9766,x
$0c:b19a  b7 ad		 lda [$ad],y
$0c:b19c  d5 2e		 cmp $2e,x
$0c:b19e  5f c9 87 e3   eor $e387c9,x
$0c:b1a2  c9 fa		 cmp #$fa
$0c:b1a4  82 7c a1	  brl $5323
$0c:b1a7  1f a9 87 db   ora $db87a9,x
$0c:b1ab  c1 e6		 cmp ($e6,x)
$0c:b1ad  80 63		 bra $b212
$0c:b1af  e0 1a		 cpx #$1a
$0c:b1b1  9e ff f6	  stz $f6ff,x
$0c:b1b4  04 be		 tsb $be
$0c:b1b6  0f f4 0b b9   ora $b90bf4
$0c:b1ba  e2 97		 sep #$97
$0c:b1bc  4c b2 77	  jmp $77b2
$0c:b1bf  fd aa f8	  sbc $f8aa,x
$0c:b1c2  4c 60 c8	  jmp $c860
$0c:b1c5  03 18		 ora $18,s
$0c:b1c7  40			rti
$0c:b1c8  60			rts
$0c:b1c9  9c 18 27	  stz $2718
$0c:b1cc  82 0e ca	  brl $7bdd
$0c:b1cf  0b			phd
$0c:b1d0  2c 7a ff	  bit $ff7a
$0c:b1d3  00 df		 brk #$df
$0c:b1d5  d0 0a		 bne $b1e1
$0c:b1d7  61 74		 adc ($74,x)
$0c:b1d9  d8			cld
$0c:b1da  64 60		 stz $60
$0c:b1dc  15 69		 ora $69,x
$0c:b1de  c5 2b		 cmp $2b
$0c:b1e0  ff c0 80 17   sbc $1780c0,x
$0c:b1e4  ce 41 cf	  dec $cf41
$0c:b1e7  90 7f		 bcc $b268
$0c:b1e9  cd 00 a8	  cmp $a800
$0c:b1ec  08			php
$0c:b1ed  06 d7		 asl $d7
$0c:b1ef  9e 88 05	  stz $0588,x
$0c:b1f2  d8			cld
$0c:b1f3  7f 20 7d ef   adc $ef7d20,x
$0c:b1f7  14 b6		 trb $b6
$0c:b1f9  66 3b		 ror $3b
$0c:b1fb  46 50		 lsr $50
$0c:b1fd  32 80		 and ($80)
$0c:b1ff  86 30		 stx $30
$0c:b201  4e 01 28	  lsr $2801
$0c:b204  eb			xba
$0c:b205  54 9e 5f	  mvn $5f,$9e
$0c:b208  37 49		 and [$49],y
$0c:b20a  af 8d 7e 70   lda $707e8d
$0c:b20e  f8			sed
$0c:b20f  fb			xce
$0c:b210  a5 b7		 lda $b7
$0c:b212  a9 d2		 lda #$d2
$0c:b214  2e 86 fa	  rol $fa86
$0c:b217  01 3e		 ora ($3e,x)
$0c:b219  80 57		 bra $b272
$0c:b21b  a0 02		 ldy #$02
$0c:b21d  30 be		 bmi $b1dd
$0c:b21f  40			rti
$0c:b220  b3 d0		 lda ($d0,s),y
$0c:b222  29 7f		 and #$7f
$0c:b224  f8			sed
$0c:b225  7e 1f 6a	  ror $6a1f,x
$0c:b228  bf 3e df ff   lda $ffdf3e,x
$0c:b22c  bf d5 3a 59   lda $593ad5,x
$0c:b230  0b			phd
$0c:b231  ff 5a 53 f6   sbc $f6535a,x
$0c:b235  84 ed		 sty $ed
$0c:b237  af d0 8f fc   lda $fc8fd0
$0c:b23b  63 ff		 adc $ff,s
$0c:b23d  00 ff		 brk #$ff
$0c:b23f  cb			wai
$0c:b240  d8			cld
$0c:b241  43 00		 eor $00,s
$0c:b243  28			plp
$0c:b244  81 00		 sta ($00,x)
$0c:b246  57 21		 eor [$21],y
$0c:b248  d2 e6		 cmp ($e6)
$0c:b24a  f8			sed
$0c:b24b  3b			tsc
$0c:b24c  fb			xce
$0c:b24d  6b			rtl
$0c:b24e  fe 1b 8d	  inc $8d1b,x
$0c:b251  b5 bf		 lda $bf,x
$0c:b253  cf f8 18 ad   cmp $ad18f8
$0c:b257  fc 03 c1	  jsr ($c103,x)
$0c:b25a  3f 70 09 ac   and $ac0970,x
$0c:b25e  27 26		 and [$26]
$0c:b260  c0 36		 cpy #$36
$0c:b262  04 82		 tsb $82
$0c:b264  81 00		 sta ($00,x)
$0c:b266  b5 e5		 lda $e5,x
$0c:b268  28			plp
$0c:b269  9b			txy
$0c:b26a  28			plp
$0c:b26b  7f ce c1 fc   adc $fcc1ce,x
$0c:b26f  b6 5a		 ldx $5a,y
$0c:b271  f4 df d6	  pea $d6df
$0c:b274  10 54		 bpl $b2ca
$0c:b276  86 61		 stx $61
$0c:b278  03 fc		 ora $fc,s
$0c:b27a  c1 ff		 cmp ($ff,x)
$0c:b27c  10 7f		 bpl $b2fd
$0c:b27e  dc 1f 21	  jml [$211f]
$0c:b281  07 42		 ora [$42]
$0c:b283  08			php
$0c:b284  2c 6f 5e	  bit $5e6f
$0c:b287  af 3f db 7d   lda $7ddb3f
$0c:b28b  ff ea c0 e1   sbc $e1c0ea,x
$0c:b28f  5f ea 0e fe   eor $fe0eea,x
$0c:b293  df 90 da 7d   cmp $7dda90,x
$0c:b297  60			rts
$0c:b298  bf f8 69 c4   lda $c469f8,x
$0c:b29c  3f e2 40 11   and $1140e2,x
$0c:b2a0  83 1c		 sta $1c,s
$0c:b2a2  69 b0		 adc #$b0
$0c:b2a4  a8			tay
$0c:b2a5  04 7a		 tsb $7a
$0c:b2a7  1a			inc a
$0c:b2a8  47 08		 eor [$08]
$0c:b2aa  7c 19 08	  jmp ($0819,x)
$0c:b2ad  04 c0		 tsb $c0
$0c:b2af  81 40		 sta ($40,x)
$0c:b2b1  e0 2c		 cpx #$2c
$0c:b2b3  d0 80		 bne $b235
$0c:b2b5  44 a0 02	  mvp $02,$a0
$0c:b2b8  d0 84		 bne $b23e
$0c:b2ba  40			rti
$0c:b2bb  20 84 41	  jsr $4184
$0c:b2be  3f 93 34 27   and $273493,x
$0c:b2c2  1b			tcs
$0c:b2c3  0e 05 83	  asl $8305
$0c:b2c6  e1 60		 sbc ($60,x)
$0c:b2c8  80 70		 bra $b33a
$0c:b2ca  3c 14 0a	  bit $0a14,x
$0c:b2cd  07 03		 ora [$03]
$0c:b2cf  01 80		 ora ($80,x)
$0c:b2d1  65 85		 adc $85
$0c:b2d3  22 01 10 30   jsl $301001
$0c:b2d7  0c 80 c8	  tsb $c880
$0c:b2da  26 80		 rol $80
$0c:b2dc  76 81		 ror $81,x
$0c:b2de  70 35		 bvs $b315
$0c:b2e0  73 5c		 adc ($5c,s),y
$0c:b2e2  e7 8a		 sbc [$8a]
$0c:b2e4  e7 8e		 sbc [$8e]
$0c:b2e6  ee 46 6d	  inc $6d46
$0c:b2e9  f7 19		 sbc [$19],y
$0c:b2eb  e7 1f		 sbc [$1f]
$0c:b2ed  c7 1a		 cmp [$1a]
$0c:b2ef  d5 5c		 cmp $5c,x
$0c:b2f1  dd a0 cd	  cmp $cda0,x
$0c:b2f4  06 68		 asl $68
$0c:b2f6  48			pha
$0c:b2f7  e0 18		 cpx #$18
$0c:b2f9  38			sec
$0c:b2fa  00 28		 brk #$28
$0c:b2fc  01 00		 ora ($00,x)
$0c:b2fe  08			php
$0c:b2ff  0a			asl a
$0c:b300  fc 82 df	  jsr ($df82,x)
$0c:b303  40			rti
$0c:b304  eb			xba
$0c:b305  dc 2e f4	  jml [$f42e]
$0c:b308  0f dd 62 59   ora $5962dd
$0c:b30c  04 ab		 tsb $ab
$0c:b30e  dc fe f4	  jml [$f4fe]
$0c:b311  0c 07 03	  tsb $0307
$0c:b314  21 40		 and ($40,x)
$0c:b316  c4 40		 cpy $40
$0c:b318  31 90		 and ($90),y
$0c:b31a  0c 34 03	  tsb $0334
$0c:b31d  a7 00		 lda [$00]
$0c:b31f  51 97		 eor ($97),y
$0c:b321  d6 15		 dec $15,x
$0c:b323  ff 84 7d a3   sbc $a37d84,x
$0c:b327  3d c8 9e	  and $9ec8,x
$0c:b32a  9e 75 dc	  stz $dc75,x
$0c:b32d  f5 cd		 sbc $cd,x
$0c:b32f  bb			tyx
$0c:b330  3d d1 f8	  and $f8d1,x
$0c:b333  0f 00 96 06   ora $069600
$0c:b337  41 76		 eor ($76,x)
$0c:b339  83 20		 sta $20,s
$0c:b33b  8c a1 26	  sty $26a1
$0c:b33e  ad f4 e5	  lda $e5f4
$0c:b341  da			phx
$0c:b342  9e bd df	  stz $dfbd,x
$0c:b345  5b			tcd
$0c:b346  56 d5		 lsr $d5,x
$0c:b348  6a			ror a
$0c:b349  bb			tyx
$0c:b34a  56 8c		 lsr $8c,x
$0c:b34c  86 b2		 stx $b2
$0c:b34e  a8			tay
$0c:b34f  28			plp
$0c:b350  2f f3 88 7f   and $7f88f3
$0c:b354  8e 63 fc	  stx $fc63
$0c:b357  40			rti
$0c:b358  32 37		 and ($37)
$0c:b35a  fe b5 77	  inc $77b5,x
$0c:b35d  43 35		 eor $35,s
$0c:b35f  ee 5d f5	  inc $f55d
$0c:b362  74 cf		 stz $cf,x
$0c:b364  3c 23 7d	  bit $7d23,x
$0c:b367  59 f3 c5	  eor $c5f3,y
$0c:b36a  11 01		 ora ($01),y
$0c:b36c  23 83		 and $83,s
$0c:b36e  d3 a1		 cmp ($a1,s),y
$0c:b370  f0 88		 beq $b2fa
$0c:b372  fc 40 0c	  jsr ($0c40,x)
$0c:b375  11 e8		 ora ($e8),y
$0c:b377  04 76		 tsb $76
$0c:b379  11 1e		 ora ($1e),y
$0c:b37b  c9 65		 cmp #$65
$0c:b37d  70 32		 bvs $b3b1
$0c:b37f  3e c7 4f	  rol $4fc7,x
$0c:b382  7d 69 ec	  adc $ec69,x
$0c:b385  cd fe 51	  cmp $51fe
$0c:b388  be 6c 8f	  ldx $8f6c,y
$0c:b38b  1d 5b b7	  ora $b75b,x
$0c:b38e  60			rts
$0c:b38f  3b			tsc
$0c:b390  de 09 77	  dec $7709,x
$0c:b393  c2 2d		 rep #$2d
$0c:b395  f8			sed
$0c:b396  87 4e		 sta [$4e]
$0c:b398  04 e1		 tsb $e1
$0c:b39a  1e dc 4d	  asl $4ddc,x
$0c:b39d  af 1b be f5   lda $f5be1b
$0c:b3a1  46 6b		 lsr $6b
$0c:b3a3  a6 b7		 ldx $b7
$0c:b3a5  53 e3		 eor ($e3,s),y
$0c:b3a7  fb			xce
$0c:b3a8  6d a5 66	  adc $66a5
$0c:b3ab  d7 57		 cmp [$57],y
$0c:b3ad  b5 6f		 lda $6f,x
$0c:b3af  b8			clv
$0c:b3b0  28			plp
$0c:b3b1  30 e6		 bmi $b399
$0c:b3b3  c0 bb		 cpy #$bb
$0c:b3b5  d0 16		 bne $b3cd
$0c:b3b7  f8			sed
$0c:b3b8  52 e0		 eor ($e0)
$0c:b3ba  18			clc
$0c:b3bb  68			pla
$0c:b3bc  fe 02 3e	  inc $3e02,x
$0c:b3bf  c1 0f		 cmp ($0f,x)
$0c:b3c1  2e 7b 33	  rol $337b
$0c:b3c4  e6 d0		 inc $d0
$0c:b3c6  77 eb		 adc [$eb],y
$0c:b3c8  57 fe		 eor [$fe],y
$0c:b3ca  d7 6a		 cmp [$6a],y
$0c:b3cc  67 7f		 adc [$7f]
$0c:b3ce  ff e0 29 53   sbc $5329e0,x
$0c:b3d2  fc 03 80	  jsr ($8003,x)
$0c:b3d5  5b			tcd
$0c:b3d6  e1 7f		 sbc ($7f,x)
$0c:b3d8  c0 69		 cpy #$69
$0c:b3da  60			rts
$0c:b3db  18			clc
$0c:b3dc  02 f8		 cop #$f8
$0c:b3de  1a			inc a
$0c:b3df  44 5e 19	  mvp $19,$5e
$0c:b3e2  1b			tcs
$0c:b3e3  ad 9b 5d	  lda $5d9b
$0c:b3e6  cf 9f e5 be   cmp $bee59f
$0c:b3ea  97 9d		 sta [$9d],y
$0c:b3ec  5e de d5	  lsr $d5de,x
$0c:b3ef  3e 1f 0c	  rol $0c1f,x
$0c:b3f2  36 05		 rol $05,x
$0c:b3f4  1e 80 c7	  asl $c780,x
$0c:b3f7  e0 10		 cpx #$10
$0c:b3f9  b8			clv
$0c:b3fa  04 19		 tsb $19
$0c:b3fc  0a			asl a
$0c:b3fd  08			php
$0c:b3fe  50 81		 bvc $b381
$0c:b400  6e 7d d1	  ror $d17d
$0c:b403  ba			tsx
$0c:b404  ed b7 d3	  sbc $d3b7
$0c:b407  f2 f9		 sbc ($f9)
$0c:b409  da			phx
$0c:b40a  a9 f9 2d	  lda #$2df9
$0c:b40d  bd f7 5f	  lda $5ff7,x
$0c:b410  e6 8b		 inc $8b
$0c:b412  c6 20		 dec $20
$0c:b414  1d e9 07	  ora $07e9,x
$0c:b417  ba			tsx
$0c:b418  21 f4		 and ($f4,x)
$0c:b41a  84 6e		 sty $6e
$0c:b41c  20 16 87	  jsr $8716
$0c:b41f  68			pla
$0c:b420  7e 21 12	  ror $1221,x
$0c:b423  0d 2d d7	  ora $d72d
$0c:b426  db			stp
$0c:b427  3c 9c fa	  bit $fa9c,x
$0c:b42a  a7 5f		 lda [$5f]
$0c:b42c  8f 64 a3 75   sta $75a364
$0c:b430  5a			phy
$0c:b431  d6 db		 dec $db,x
$0c:b433  7e bf d8	  ror $d8bf,x
$0c:b436  53 fc		 eor ($fc,s),y
$0c:b438  20 10 76	  jsr $7610
$0c:b43b  10 c5		 bpl $b402
$0c:b43d  f0 10		 beq $b44f
$0c:b43f  5c 04 4b ff   jml $ff4b04
$0c:b443  02 80		 cop #$80
$0c:b445  59 63 d7	  eor $d763,y
$0c:b448  f8			sed
$0c:b449  06 fe		 asl $fe
$0c:b44b  80 d3		 bra $b420
$0c:b44d  09 a7 c2	  ora #$c2a7
$0c:b450  a3 80		 lda $80,s
$0c:b452  ab			plb
$0c:b453  4e 29 5f	  lsr $5f29
$0c:b456  fe 04 01	  inc $0104,x
$0c:b459  be 72 0e	  ldx $0e72,y
$0c:b45c  7c 83 fe	  jmp ($fe83,x)
$0c:b45f  e8			inx
$0c:b460  0f 04 02 01   ora $010204
$0c:b464  a5 bd		 lda $bd
$0c:b466  ff e0 3f d8   sbc $d83fe0,x
$0c:b46a  1b			tcs
$0c:b46b  cc 25 f0	  cpy $f025
$0c:b46e  9c 6c 0a	  stz $0a6c
$0c:b471  d9 1b ab	  cmp $ab1b,y
$0c:b474  18			clc
$0c:b475  41 fe		 eor ($fe,x)
$0c:b477  90 4f		 bcc $b4c8
$0c:b479  84 13		 sty $13
$0c:b47b  f0 08		 beq $b485
$0c:b47d  06 18		 asl $18
$0c:b47f  40			rti
$0c:b480  25 5a		 and $5a
$0c:b482  9b			txy
$0c:b483  57 87		 eor [$87],y
$0c:b485  9b			txy
$0c:b486  53 ea		 eor ($ea,s),y
$0c:b488  f0 ac		 beq $b436
$0c:b48a  34 7e		 bit $7e,x
$0c:b48c  97 53		 sta [$53],y
$0c:b48e  b5 d9		 lda $d9,x
$0c:b490  d7 ef		 cmp [$ef],y
$0c:b492  ea			nop
$0c:b493  d0 08		 bne $b49d
$0c:b495  f4 02 7c	  pea $7c02
$0c:b498  22 08 0e fa   jsl $fa0e08
$0c:b49c  03 2f		 ora $2f,s
$0c:b49e  80 c9		 bra $b469
$0c:b4a0  ff f4 08 06   sbc $0608f4,x
$0c:b4a4  93 ef		 sta ($ef,s),y
$0c:b4a6  5e 96 fc	  lsr $fc96,x
$0c:b4a9  e9 17 6a	  sbc #$6a17
$0c:b4ac  6f f2 ab 2b   adc $2babf2
$0c:b4b0  83 55		 sta $55,s
$0c:b4b2  6e 5f 6a	  ror $6a5f
$0c:b4b5  0a			asl a
$0c:b4b6  fc 30 50	  jsr ($5030,x)
$0c:b4b9  0c 31 00	  tsb $0031
$0c:b4bc  48			pha
$0c:b4bd  21 d0		 and ($d0,x)
$0c:b4bf  80 62		 bra $b523
$0c:b4c1  20 18 c8	  jsr $c818
$0c:b4c4  05 19		 ora $19
$0c:b4c6  60			rts
$0c:b4c7  1d ad b6	  ora $b6ad,x
$0c:b4ca  26 d9		 rol $d9
$0c:b4cc  d3 eb		 cmp ($eb,s),y
$0c:b4ce  f2 b7		 sbc ($b7)
$0c:b4d0  9a			txs
$0c:b4d1  bf b7 67 bb   lda $bb67b7,x
$0c:b4d5  92 d4		 sta ($d4)
$0c:b4d7  40			rti
$0c:b4d8  24 10		 bit $10
$0c:b4da  0b			phd
$0c:b4db  01 80		 ora ($80,x)
$0c:b4dd  4c 20 2d	  jmp $2d20
$0c:b4e0  07 68		 ora [$68]
$0c:b4e2  18			clc
$0c:b4e3  41 98		 eor ($98,x)
$0c:b4e5  15 2a		 ora $2a,x
$0c:b4e7  36 be		 rol $be,x
$0c:b4e9  83 54		 sta $54,s
$0c:b4eb  81 6d		 sta ($6d,x)
$0c:b4ed  ff 5b 2f f6   sbc $f62f5b,x
$0c:b4f1  9e b3 5c	  stz $5cb3,x
$0c:b4f4  d1 40		 cmp ($40),y
$0c:b4f6  60			rts
$0c:b4f7  fb			xce
$0c:b4f8  98			tya
$0c:b4f9  38			sec
$0c:b4fa  2c 3f 28	  bit $283f
$0c:b4fd  41 3f		 eor ($3f,x)
$0c:b4ff  83 08		 sta $08,s
$0c:b501  0f e1 3d a1   ora $a13de1
$0c:b505  54 f8 7a	  mvn $7a,$f8
$0c:b508  e8			inx
$0c:b509  3e 53 0f	  rol $0f53,x
$0c:b50c  2a			rol a
$0c:b50d  b9 dd 7f	  lda $7fdd,y
$0c:b510  5a			phy
$0c:b511  b8			clv
$0c:b512  a6 7f		 ldx $7f
$0c:b514  41 80		 eor ($80,x)
$0c:b516  e0 6f		 cpx #$6f
$0c:b518  38			sec
$0c:b519  1f 8e 05 e1   ora $e1058e,x
$0c:b51d  40			rti
$0c:b51e  29 f0 55	  and #$55f0
$0c:b521  05 03		 ora $03
$0c:b523  81 55		 sta ($55,x)
$0c:b525  84 6b		 sty $6b
$0c:b527  e4 51		 cpx $51
$0c:b529  dc d6 9e	  jml [$9ed6]
$0c:b52c  89 d5 94	  bit #$94d5
$0c:b52f  6a			ror a
$0c:b530  6a			ror a
$0c:b531  1f 2a 4f e6   ora $e64f2a,x
$0c:b535  a9 e2 24	  lda #$24e2
$0c:b538  09 8c 27	  ora #$278c
$0c:b53b  02 01		 cop #$01
$0c:b53d  87 a2		 sta [$a2]
$0c:b53f  c2 01		 rep #$01
$0c:b541  03 80		 ora $80,s
$0c:b543  57 69		 eor [$69],y
$0c:b545  1a			inc a
$0c:b546  fd 12 cd	  sbc $cd12,x
$0c:b549  e9 1f 8a	  sbc #$8a1f
$0c:b54c  ae 8a 01	  ldx $018a
$0c:b54f  50 61		 bvc $b5b2
$0c:b551  4c 0a 01	  jmp $010a
$0c:b554  b5 a6		 lda $a6,x
$0c:b556  66 ac		 ror $ac
$0c:b558  dc eb 8e	  jml [$8eeb]
$0c:b55b  fe 41 7e	  inc $7e41,x
$0c:b55e  d0 f6		 bne $b556
$0c:b560  f0 b0		 beq $b512
$0c:b562  ac 97 d6	  ldy $d697
$0c:b565  5f 03 8f c0   eor $c08f03,x
$0c:b569  59 23 40	  eor $4023,y
$0c:b56c  84 d0		 sty $d0
$0c:b56e  20 b6 08	  jsr $08b6
$0c:b571  3d 96 1f	  and $1f96,x
$0c:b574  40			rti
$0c:b575  8f de ba f5   sta $f5bade
$0c:b579  8b			phb
$0c:b57a  0e ef 83	  asl $83ef
$0c:b57d  6b			rtl
$0c:b57e  c8			iny
$0c:b57f  db			stp
$0c:b580  26 74		 rol $74
$0c:b582  9e 9e 6e	  stz $6e9e,x
$0c:b585  67 a0		 adc [$a0]
$0c:b587  f5 78		 sbc $78,x
$0c:b589  3f 18 6f 84   and $846f18,x
$0c:b58d  1b			tcs
$0c:b58e  d1 06		 cmp ($06),y
$0c:b590  dc 08 43	  jml [$4308]
$0c:b593  4d f8 f3	  eor $f3f8
$0c:b596  7e 22 ff	  ror $ff22,x
$0c:b599  8f ac 53 f9   sta $f953ac
$0c:b59d  9c f5 46	  stz $46f5
$0c:b5a0  b8			clv
$0c:b5a1  33 ff		 and ($ff,s),y
$0c:b5a3  44 a2 af	  mvp $af,$a2
$0c:b5a6  b6 9e		 ldx $9e,y
$0c:b5a8  ff 6e bf d8   sbc $d8bf6e,x
$0c:b5ac  5c 02 47 00   jml $004702
$0c:b5b0  92 c0		 sta ($c0)
$0c:b5b2  27 f0		 and [$f0]
$0c:b5b4  08			php
$0c:b5b5  b8			clv
$0c:b5b6  14 60		 trb $60
$0c:b5b8  57 f7		 eor [$f7],y
$0c:b5ba  68			pla
$0c:b5bb  79 73 5b	  adc $5b73,y
$0c:b5be  fe 05 ff	  inc $ff05,x
$0c:b5c1  81 bf		 sta ($bf,x)
$0c:b5c3  c0 5d		 cpy #$5d
$0c:b5c5  3e 15 1e	  rol $1e15,x
$0c:b5c8  05 5a		 ora $5a
$0c:b5ca  71 4a		 adc ($4a),y
$0c:b5cc  ff e0 20 1c   sbc $1c20e0,x
$0c:b5d0  03 00		 ora $00,s
$0c:b5d2  e0 28		 cpx #$28
$0c:b5d4  1c f9 07	  trb $07f9
$0c:b5d7  fc d0 1e	  jsr ($1ed0,x)
$0c:b5da  08			php
$0c:b5db  04 00		 tsb $00
$0c:b5dd  5e 31 c1	  lsr $c131,x
$0c:b5e0  9f 91 26 b3   sta $b32691,x
$0c:b5e4  4e e4 73	  lsr $73e4
$0c:b5e7  f4 da f8	  pea $f8da
$0c:b5ea  df e7 0d 8e   cmp $8e0de7,x
$0c:b5ee  ba			tsx
$0c:b5ef  db			stp
$0c:b5f0  3a			dec a
$0c:b5f1  9d 22 e8	  sta $e822,x
$0c:b5f4  6e 20 13	  ror $1320
$0c:b5f7  c8			iny
$0c:b5f8  05 72		 ora $72
$0c:b5fa  01 f8		 ora ($f8,x)
$0c:b5fc  83 5f		 sta $5f,s
$0c:b5fe  60			rts
$0c:b5ff  59 f8 14	  eor $14f8,y
$0c:b602  bf fc 6d 0e   lda $0e6dfc,x
$0c:b606  44 de 8f	  mvp $8f,$de
$0c:b609  c2 fa		 rep #$fa
$0c:b60b  5d f5 f7	  eor $f7f5,x
$0c:b60e  eb			xba
$0c:b60f  ef fb a7 52   sbc $52a7fb
$0c:b613  d6 db		 dec $db,x
$0c:b615  be f0 83	  ldx $83f0,y
$0c:b618  68			pla
$0c:b619  28			plp
$0c:b61a  41 7c		 eor ($7c,x)
$0c:b61c  2c 41 96	  bit $9641
$0c:b61f  40			rti
$0c:b620  22 0c 41 d2   jsl $d2410c
$0c:b624  5e 2b 9a	  lsr $9a2b,x
$0c:b627  8a			txa
$0c:b628  66 e2		 ror $e2
$0c:b62a  19 f8 ea	  ora $eaf8,y
$0c:b62d  5a			phy
$0c:b62e  3b			tsc
$0c:b62f  96 89		 stx $89,y
$0c:b631  67 63		 adc [$63]
$0c:b633  59 58 fe	  eor $fe58,y
$0c:b636  40			rti
$0c:b637  1b			tcs
$0c:b638  f9 9e a0	  sbc $a09e,y
$0c:b63b  ec ad d9	  cpx $d9ad
$0c:b63e  7a			ply
$0c:b63f  56 d2		 lsr $d2,x
$0c:b641  c5 ee		 cmp $ee
$0c:b643  90 f2		 bcc $b637
$0c:b645  a4 dc		 ldy $dc
$0c:b647  f9 d7 f2	  sbc $f2d7,y
$0c:b64a  05 38		 ora $38
$0c:b64c  83 c6		 sta $c6,s
$0c:b64e  60			rts
$0c:b64f  f3 90		 sbc ($90,s),y
$0c:b651  00 c6		 brk #$c6
$0c:b653  00 03		 brk #$03
$0c:b655  01 05		 ora ($05,x)
$0c:b657  0d fc cc	  ora $ccfc
$0c:b65a  15 09		 ora $09,x
$0c:b65c  bd e3 4f	  lda $4fe3,x
$0c:b65f  b8			clv
$0c:b660  b5 df		 lda $df,x
$0c:b662  3e f7 48	  rol $48f7,x
$0c:b665  4d 2b 6f	  eor $6f2b
$0c:b668  88			dey
$0c:b669  c0 70 34	  cpy #$3470
$0c:b66c  1c 00 f8	  trb $f800
$0c:b66f  50 04		 bvc $b675
$0c:b671  43 88		 eor $88,s
$0c:b673  e0 6d 04	  cpx #$046d
$0c:b676  83 9e		 sta $9e,s
$0c:b678  b8			clv
$0c:b679  d4 a0		 pei ($a0)
$0c:b67b  d6 fb		 dec $fb,x
$0c:b67d  17 73		 ora [$73],y
$0c:b67f  b5 e6		 lda $e6,x
$0c:b681  fc ce a7	  jsr ($a7ce,x)
$0c:b684  d8			cld
$0c:b685  fc 55 f3	  jsr ($f355,x)
$0c:b688  05 00		 ora $00
$0c:b68a  83 fe		 sta $fe,s
$0c:b68c  60			rts
$0c:b68d  f9 98 3c	  sbc $3c98,y
$0c:b690  86 0e		 stx $0e
$0c:b692  3f 0e 0c 1e   and $1e0c0e,x
$0c:b696  e2 0a		 sep #$0a
$0c:b698  1b			tcs
$0c:b699  ad 2b d7	  lda $d72b
$0c:b69c  40			rti
$0c:b69d  92 d9		 sta ($d9)
$0c:b69f  36 5b		 rol $5b,x
$0c:b6a1  eb			xba
$0c:b6a2  65 b3		 adc $b3
$0c:b6a4  ed 76 81	  sbc $8176
$0c:b6a7  50 b7		 bvc $b660
$0c:b6a9  78			sei
$0c:b6aa  40			rti
$0c:b6ab  f8			sed
$0c:b6ac  6f f8 19 be   adc $be19f8
$0c:b6b0  05 07		 ora $07
$0c:b6b2  81 93		 sta ($93,x)
$0c:b6b4  e0 62 78	  cpx #$7862
$0c:b6b7  1b			tcs
$0c:b6b8  d1 60		 cmp ($60),y
$0c:b6ba  f3 a6		 sbc ($a6,s),y
$0c:b6bc  34 2e		 bit $2e,x
$0c:b6be  37 de		 and [$de],y
$0c:b6c0  e5 ac		 sbc $ac
$0c:b6c2  bd 5f bf	  lda $bf5f,x
$0c:b6c5  3d 2a b6	  and $b62a,x
$0c:b6c8  be d5 f4	  ldx $f4d5,y
$0c:b6cb  85 0f		 sta $0f
$0c:b6cd  c0 06 10	  cpy #$1006
$0c:b6d0  90 50		 bcc $b722
$0c:b6d2  8f c2 53 07   sta $0753c2
$0c:b6d6  88			dey
$0c:b6d7  82 86 b7	  brl $6e60
$0c:b6da  74 e9		 stz $e9,x
$0c:b6dc  50 25		 bvc $b703
$0c:b6de  d6 6c		 dec $6c,x
$0c:b6e0  de 6e cd	  dec $cd6e,x
$0c:b6e3  7e fd de	  ror $defd,x
$0c:b6e6  e1 94		 sbc ($94,x)
$0c:b6e8  cd fe 00	  cmp $00fe
$0c:b6eb  be 59 9e	  ldx $9e59,y
$0c:b6ee  05 93		 ora $93
$0c:b6f0  81 81		 sta ($81,x)
$0c:b6f2  e0 61 38	  cpx #$3861
$0c:b6f5  1b			tcs
$0c:b6f6  31 60		 and ($60),y
$0c:b6f8  dd f1 9f	  cmp $9ff1,x
$0c:b6fb  f8			sed
$0c:b6fc  04 ae		 tsb $ae
$0c:b6fe  21 91		 and ($91,x)
$0c:b700  80 55		 bra $b757
$0c:b702  a7 14		 lda [$14]
$0c:b704  af fa c4 15   lda $15c4fa
$0c:b708  e1 00		 sbc ($00,x)
$0c:b70a  5f 8a c4 18   eor $18c48a,x
$0c:b70e  64 c8		 stz $c8
$0c:b710  4d fd 81	  eor $81fd
$0c:b713  62 1b 39	  per $f031
$0c:b716  e5 27		 sbc $27
$0c:b718  1d 50 91	  ora $9150,x
$0c:b71b  ae 49 9e	  ldx $9e49
$0c:b71e  0b			phd
$0c:b71f  f2 e0		 sbc ($e0)
$0c:b721  40			rti
$0c:b722  3e 10 0f	  rol $0f10,x
$0c:b725  e3 21		 sbc $21,s
$0c:b727  56 21		 lsr $21,x
$0c:b729  7f e0 6b 66   adc $666be0,x
$0c:b72d  55 5c		 eor $5c,x
$0c:b72f  d6 af		 dec $af,x
$0c:b731  19 65 c3	  ora $c365,y
$0c:b734  62 a8 7d	  per $34df
$0c:b737  58			cli
$0c:b738  8a			txa
$0c:b739  fc a8 10	  jsr ($10a8,x)
$0c:b73c  06 f0		 asl $f0
$0c:b73e  5c 20 17 88   jml $881720
$0c:b742  05 f2		 ora $f2
$0c:b744  01 6e		 ora ($6e,x)
$0c:b746  61 1f		 adc ($1f,x)
$0c:b748  f6 04		 inc $04,x
$0c:b74a  11 2d		 ora ($2d),y
$0c:b74c  fd 0b 7b	  sbc $7b0b,x
$0c:b74f  42 d4		 wdm #$d4
$0c:b751  d5 99		 cmp $99,x
$0c:b753  0a			asl a
$0c:b754  1f 78 86 57   ora $578678,x
$0c:b758  4b			phk
$0c:b759  06 e9		 asl $e9
$0c:b75b  c7 28		 cmp [$28]
$0c:b75d  b9 a8 ff	  lda $ffa8,y
$0c:b760  43 8f		 eor $8f,s
$0c:b762  98			tya
$0c:b763  8a			txa
$0c:b764  e6 bd		 inc $bd
$0c:b766  70 c0		 bvs $b728
$0c:b768  68			pla
$0c:b769  02 40		 cop #$40
$0c:b76b  0a			asl a
$0c:b76c  04 36		 tsb $36
$0c:b76e  03 84		 ora $84,s
$0c:b770  4b			phk
$0c:b771  ff c8 a4 e8   sbc $e8a4c8,x
$0c:b775  e8			inx
$0c:b776  38			sec
$0c:b777  b8			clv
$0c:b778  4f 92 87 a1   eor $a18792
$0c:b77c  a1 d2		 lda ($d2,x)
$0c:b77e  f0 77		 beq $b7f7
$0c:b780  4d 90 04	  eor $0490
$0c:b783  26 d0		 rol $d0
$0c:b785  0b			phd
$0c:b786  f4 02 ed	  pea $ed02
$0c:b789  00 9f		 brk #$9f
$0c:b78b  19 8e 1f	  ora $1f8e,y
$0c:b78e  00 f2		 brk #$f2
$0c:b790  e6 fb		 inc $fb
$0c:b792  7b			tdc
$0c:b793  5c a6 ee dd   jml $ddeea6
$0c:b797  55 b5		 eor $b5,x
$0c:b799  55 6a		 eor $6a,x
$0c:b79b  b4 b9		 ldy $b9,x
$0c:b79d  f4 a6 6b	  pea $6ba6
$0c:b7a0  2a			rol a
$0c:b7a1  bf bc 01 00   lda $0001bc,x
$0c:b7a5  33 f4		 and ($f4,s),y
$0c:b7a7  21 c7		 and ($c7,x)
$0c:b7a9  d1 43		 cmp ($43),y
$0c:b7ab  4b			phk
$0c:b7ac  bc 7f 28	  ldy $287f,x
$0c:b7af  90 cd		 bcc $b77e
$0c:b7b1  9e df 21	  stz $21df,x
$0c:b7b4  f4 c6 4f	  pea $4fc6
$0c:b7b7  3c 7c 7a	  bit $7a7c,x
$0c:b7ba  c5 67		 cmp $67
$0c:b7bc  95 86		 sta $86,x
$0c:b7be  80 60		 bra $b820
$0c:b7c0  e0 0e 30	  cpx #$300e
$0c:b7c3  e6 40		 inc $40
$0c:b7c5  38			sec
$0c:b7c6  6a			ror a
$0c:b7c7  21 f0		 and ($f0,x)
$0c:b7c9  40			rti
$0c:b7ca  3c 90 0d	  bit $0d90,x
$0c:b7cd  55 7b		 eor $7b,x
$0c:b7cf  ab			plb
$0c:b7d0  2b			pld
$0c:b7d1  92 57		 sta ($57)
$0c:b7d3  fa			plx
$0c:b7d4  7b			tdc
$0c:b7d5  ec a6 ac	  cpx $aca6
$0c:b7d8  ee 34 f9	  inc $f934
$0c:b7db  54 94 1e	  mvn $1e,$94
$0c:b7de  4b			phk
$0c:b7df  f0 40		 beq $b821
$0c:b7e1  b2 34		 lda ($34)
$0c:b7e3  37 d5		 and [$d5],y
$0c:b7e5  fb			xce
$0c:b7e6  cc 4f 61	  cpy $614f
$0c:b7e9  83 af		 sta $af,s
$0c:b7eb  72 75		 adc ($75)
$0c:b7ed  b6 7a		 ldx $7a,y
$0c:b7ef  b6 ce		 ldx $ce,y
$0c:b7f1  c7 b9		 cmp [$b9]
$0c:b7f3  ca			dex
$0c:b7f4  7b			tdc
$0c:b7f5  40			rti
$0c:b7f6  21 8e		 and ($8e,x)
$0c:b7f8  80 73		 bra $b86d
$0c:b7fa  a0 1e 68	  ldy #$681e
$0c:b7fd  07 ca		 ora [$ca]
$0c:b7ff  01 f8		 ora ($f8,x)
$0c:b801  80 7f		 bra $b882
$0c:b803  20 1f e8	  jsr $e81f
$0c:b806  05 4f		 ora $4f
$0c:b808  7b			tdc
$0c:b809  ad ed 52	  lda $52ed
$0c:b80c  be fb 5a	  ldx $5afb,y
$0c:b80f  55 26		 eor $26,x
$0c:b811  7d a6 ce	  adc $cea6,x
$0c:b814  d5 29		 cmp $29,x
$0c:b816  72 99		 adc ($99)
$0c:b818  33 b4		 and ($b4,s),y
$0c:b81a  17 e8		 ora [$e8],y
$0c:b81c  c3 24		 cmp $24,s
$0c:b81e  49 55 77	  eor #$7755
$0c:b821  d8			cld
$0c:b822  9e 1f 02	  stz $021f,x
$0c:b825  c7 6e		 cmp [$6e]
$0c:b827  dc eb 39	  jml [$39eb]
$0c:b82a  b4 bd		 ldy $bd,x
$0c:b82c  97 d6		 sta [$d6],y
$0c:b82e  53 6d		 eor ($6d,s),y
$0c:b830  c9 17 c0	  cmp #$c017
$0c:b833  ce 19 e8	  dec $e819
$0c:b836  07 19		 ora [$19]
$0c:b838  cc 2e b2	  cpy $b22e
$0c:b83b  5f 86 4a ff   eor $ff4a86,x
$0c:b83f  48			pha
$0c:b840  e4 94		 cpx $94
$0c:b842  c2 97		 rep #$97
$0c:b844  89 d2 60	  bit #$60d2
$0c:b847  e4 38		 cpx $38
$0c:b849  39 5f 86	  and $865f,y
$0c:b84c  b6 7f		 ldx $7f,y
$0c:b84e  03 02		 ora $02,s
$0c:b850  98			tya
$0c:b851  c0 c6 11	  cpy #$11c6
$0c:b854  e8			inx
$0c:b855  06 02		 asl $02
$0c:b857  01 4a		 ora ($4a,x)
$0c:b859  c0 69 6b	  cpy #$6b69
$0c:b85c  51 af		 eor ($af),y
$0c:b85e  2d af 39	  and $39af
$0c:b861  d6 b5		 dec $b5,x
$0c:b863  8b			phb
$0c:b864  02 b7		 cop #$b7
$0c:b866  ff dd ee 80   sbc $80eedd,x
$0c:b86a  2c bf 4a	  bit $4abf
$0c:b86d  2c 03 db	  bit $db03
$0c:b870  12 db		 ora ($db)
$0c:b872  c5 b9		 cmp $b9
$0c:b874  90 dc		 bcc $b852
$0c:b876  a5 7a		 lda $7a
$0c:b878  71 9e		 adc ($9e),y
$0c:b87a  ca			dex
$0c:b87b  c6 7d		 dec $7d
$0c:b87d  73 5d		 adc ($5d,s),y
$0c:b87f  ac b9 be	  ldy $beb9
$0c:b882  16 88		 asl $88,x
$0c:b884  05 ca		 ora $ca
$0c:b886  01 61		 ora ($61,x)
$0c:b888  42 0d		 wdm #$0d
$0c:b88a  8a			txa
$0c:b88b  01 42		 ora ($42,x)
$0c:b88d  80 50		 bra $b8df
$0c:b88f  e0 1a db	  cpx #$db1a
$0c:b892  c4 df		 cpy $df
$0c:b894  27 79		 and [$79]
$0c:b896  9a			txs
$0c:b897  f7 f2		 sbc [$f2],y
$0c:b899  b6 dd		 ldx $dd,y
$0c:b89b  fc 2a 51	  jsr ($512a,x)
$0c:b89e  56 d9		 lsr $d9,x
$0c:b8a0  47 f6		 eor [$f6]
$0c:b8a2  f0 68		 beq $b90c
$0c:b8a4  05 22		 ora $22
$0c:b8a6  01 c2		 ora ($c2,x)
$0c:b8a8  80 78		 bra $b922
$0c:b8aa  94 43		 sty $43,x
$0c:b8ac  d7 80		 cmp [$80],y
$0c:b8ae  53 54		 eor ($54,s),y
$0c:b8b0  03 9c		 ora $9c,s
$0c:b8b2  ef 5e 7b bd   sbc $bd7b5e
$0c:b8b6  bd 44 53	  lda $5344,x
$0c:b8b9  45 ec		 eor $ec
$0c:b8bb  aa			tax
$0c:b8bc  76 fa		 ror $fa,x
$0c:b8be  d5 ae		 cmp $ae,x
$0c:b8c0  97 13		 sta [$13],y
$0c:b8c2  aa			tax
$0c:b8c3  85 05		 sta $05
$0c:b8c5  28			plp
$0c:b8c6  7d c5 83	  adc $83c5,x
$0c:b8c9  bf 80 4f 59   lda $594f80,x
$0c:b8cd  03 3b		 ora $3b,s
$0c:b8cf  80 56		 bra $b927
$0c:b8d1  ba			tsx
$0c:b8d2  b3 1b		 lda ($1b,s),y
$0c:b8d4  5c a2 c7 86   jml $86c7a2
$0c:b8d8  90 cc		 bcc $b8a6
$0c:b8da  76 fc		 ror $fc,x
$0c:b8dc  2c 9d b7	  bit $b79d
$0c:b8df  67 7a		 adc [$7a]
$0c:b8e1  97 9f		 sta [$9f],y
$0c:b8e3  80 46		 bra $b92b
$0c:b8e5  02 30		 cop #$30
$0c:b8e7  ef 40 39 d0   sbc $d03940
$0c:b8eb  0f 73 98 44   ora $449873
$0c:b8ef  a0 03 0a	  ldy #$0a03
$0c:b8f2  ad 03 59	  lda $5903
$0c:b8f5  44 ab c0	  mvp $c0,$ab
$0c:b8f8  76 bf		 ror $bf,x
$0c:b8fa  f7 b8		 sbc [$b8],y
$0c:b8fc  68			pla
$0c:b8fd  ab			plb
$0c:b8fe  b5 9d		 lda $9d,x
$0c:b900  30 7c		 bmi $b97e
$0c:b902  18			clc
$0c:b903  e1 fb		 sbc ($fb,x)
$0c:b905  15 18		 ora $18,x
$0c:b907  21 0c		 and ($0c,x)
$0c:b909  e1 8f		 sbc ($8f,x)
$0c:b90b  a8			tay
$0c:b90c  7b			tdc
$0c:b90d  e6 1b		 inc $1b
$0c:b90f  79 c5 ef	  adc $efc5,y
$0c:b912  f9 ad 97	  sbc $97ad,y
$0c:b915  7d a6 fa	  adc $faa6,x
$0c:b918  b9 c8 fc	  lda $fcc8,y
$0c:b91b  24 10		 bit $10
$0c:b91d  0a			asl a
$0c:b91e  00 88		 brk #$88
$0c:b920  47 e1		 eor [$e1]
$0c:b922  50 50		 bvc $b974
$0c:b924  0d 19 8c	  ora $8c19
$0c:b927  14 0b		 trb $0b
$0c:b929  df 53 2f 58   cmp $582f53,x
$0c:b92d  a5 e3		 lda $e3
$0c:b92f  30 b8		 bmi $b8e9
$0c:b931  6a			ror a
$0c:b932  96 0f		 stx $0f,y
$0c:b934  13 41		 ora ($41,s),y
$0c:b936  ea			nop
$0c:b937  44 83 e5	  mvp $e5,$83
$0c:b93a  60			rts
$0c:b93b  80 5c		 bra $b999
$0c:b93d  20 17 88	  jsr $8817
$0c:b940  05 f2		 ora $f2
$0c:b942  01 7e		 ora ($7e,x)
$0c:b944  80 5b		 bra $b9a1
$0c:b946  e0 15 2e	  cpx #$2e15
$0c:b949  ac a6 c7	  ldy $c7a6
$0c:b94c  c0 b1 d9	  cpy #$d9b1
$0c:b94f  b6 3b		 ldx $3b,y
$0c:b951  9a			txs
$0c:b952  dd 7b 5b	  cmp $5b7b,x
$0c:b955  4d fa f5	  eor $f5fa
$0c:b958  a5 6d		 lda $6d
$0c:b95a  f4 73 87	  pea $8773
$0c:b95d  9a			txs
$0c:b95e  01 f2		 ora ($f2,x)
$0c:b960  80 7e		 bra $b9e0
$0c:b962  a0 1f c8	  ldy #$c81f
$0c:b965  06 8b		 asl $8b
$0c:b967  87 95		 sta [$95]
$0c:b969  cb			wai
$0c:b96a  7a			ply
$0c:b96b  e1 95		 sbc ($95,x)
$0c:b96d  19 15 af	  ora $af15,y
$0c:b970  19 5f da	  ora $da5f,y
$0c:b973  4d 64 d4	  eor $d464
$0c:b976  7f a1 b4 08   adc $08b4a1,x
$0c:b97a  e1 f8		 sbc ($f8,x)
$0c:b97c  c0 7d 21	  cpy #$217d
$0c:b97f  1f 88 22 1c   ora $1c2288,x
$0c:b983  27 1c		 and [$1c]
$0c:b985  4f c4 22 35   eor $3522c4
$0c:b989  f6 b7		 inc $b7,x
$0c:b98b  e8			inx
$0c:b98c  29 7f ed	  and #$ed7f
$0c:b98f  a5 4f		 lda $4f
$0c:b991  8f 3c 9d 7a   sta $7a9d3c
$0c:b995  74 75		 stz $75,x
$0c:b997  eb			xba
$0c:b998  ef 53 c3 00   sbc $00c353
$0c:b99c  f8			sed
$0c:b99d  28			plp
$0c:b99e  07 f0		 ora [$f0]
$0c:b9a0  a4 13		 ldy $13
$0c:b9a2  68			pla
$0c:b9a3  1b			tcs
$0c:b9a4  40			rti
$0c:b9a5  0a			asl a
$0c:b9a6  11 58		 ora ($58),y
$0c:b9a8  94 2a		 sty $2a,x
$0c:b9aa  13 05		 ora ($05,s),y
$0c:b9ac  82 40 a0	  brl $59ef
$0c:b9af  50 18		 bvc $b9c9
$0c:b9b1  08			php
$0c:b9b2  21 21		 and ($21,x)
$0c:b9b4  f0 08		 beq $b9be
$0c:b9b6  3c 02 07	  bit $0702,x
$0c:b9b9  00 5c		 brk #$5c
$0c:b9bb  28			plp
$0c:b9bc  20 65 9f	  jsr $9f65
$0c:b9bf  2c 65 ee	  bit $ee65
$0c:b9c2  a5 ef		 lda $ef
$0c:b9c4  d4 dd		 pei ($dd)
$0c:b9c6  aa			tax
$0c:b9c7  52 fd		 eor ($fd)
$0c:b9c9  4e 5e a9	  lsr $a95e
$0c:b9cc  4f 95 49 41   eor $414995
$0c:b9d0  e0 df 6b	  cpx #$6bdf
$0c:b9d3  fc 02 7f	  jsr ($7f02,x)
$0c:b9d6  00 8f		 brk #$8f
$0c:b9d8  ab			plb
$0c:b9d9  82 26 b1	  brl $6b02
$0c:b9dc  28			plp
$0c:b9dd  1b			tcs
$0c:b9de  0d d7 e8	  ora $e8d7
$0c:b9e1  04 8d		 tsb $8d
$0c:b9e3  95 b6		 sta $b6,x
$0c:b9e5  dd 93 cd	  cmp $cd93,x
$0c:b9e8  fb			xce
$0c:b9e9  2c b3 be	  bit $beb3
$0c:b9ec  c7 3e		 cmp [$3e]
$0c:b9ee  6f f3 86 db   adc $db86f3
$0c:b9f2  21 53		 and ($53,x)
$0c:b9f4  87 29		 sta [$29]
$0c:b9f6  39 49 d6	  and $d649,y
$0c:b9f9  0b			phd
$0c:b9fa  f0 89		 beq $b985
$0c:b9fc  b0 06		 bcs $ba04
$0c:b9fe  09 1c 81	  ora #$811c
$0c:ba01  43 80		 eor $80,s
$0c:ba03  54 c3 a5	  mvn $a5,$c3
$0c:ba06  c9 49 20	  cmp #$2049
$0c:ba09  99 98 86	  sta $8698,y
$0c:ba0c  97 03		 sta [$03],y
$0c:ba0e  32 f8		 and ($f8)
$0c:ba10  59 a3 d1	  eor $d1a3,y
$0c:ba13  d8			cld
$0c:ba14  1c 1e 10	  trb $101e
$0c:ba17  c2 0f		 rep #$0f
$0c:ba19  dc 03 df	  jml [$df03]
$0c:ba1c  00 bf		 brk #$bf
$0c:ba1e  2f 85 8a df   and $df8a85
$0c:ba22  1b			tcs
$0c:ba23  5f 5a 9b a9   eor $a99b5a,x
$0c:ba27  9a			txs
$0c:ba28  7a			ply
$0c:ba29  a6 d9		 ldx $d9
$0c:ba2b  be bc 96	  ldx $96bc,y
$0c:ba2e  f7 d4		 sbc [$d4],y
$0c:ba30  cd cb 39	  cmp $39cb
$0c:ba33  6c 10 91	  jmp ($9110)
$0c:ba36  c0 28 70	  cpy #$7028
$0c:ba39  0a			asl a
$0c:ba3a  0c 02 c1	  tsb $c102
$0c:ba3d  00 e0		 brk #$e0
$0c:ba3f  21 86		 and ($86,x)
$0c:ba41  e1 00		 sbc ($00,x)
$0c:ba43  8d 7a e2	  sta $e27a
$0c:ba46  b5 69		 lda $69,x
$0c:ba48  57 cf		 eor [$cf],y
$0c:ba4a  2f 25 8b 5c   and $5c8b25
$0c:ba4e  ad 12 bc	  lda $bc12
$0c:ba51  36 d6		 rol $d6,x
$0c:ba53  b1 e8		 lda ($e8),y
$0c:ba55  8a			txa
$0c:ba56  40			rti
$0c:ba57  37 10		 and [$10],y
$0c:ba59  0c e4 03	  tsb $03e4
$0c:ba5c  b5 00		 lda $00,x
$0c:ba5e  e7 c0		 sbc [$c0]
$0c:ba60  3a			dec a
$0c:ba61  f0 0a		 beq $ba6d
$0c:ba63  db			stp
$0c:ba64  b0 6b		 bcs $bad1
$0c:ba66  f4 db 4c	  pea $4cdb
$0c:ba69  8b			phb
$0c:ba6a  a9 b8 9c	  lda #$9cb8
$0c:ba6d  77 64		 adc [$64],y
$0c:ba6f  3d 89 d5	  and $d589,x
$0c:ba72  cb			wai
$0c:ba73  83 57		 sta $57,s
$0c:ba75  f9 d3 b6	  sbc $b6d3,y
$0c:ba78  70 0c		 bvs $ba86
$0c:ba7a  fb			xce
$0c:ba7b  f8			sed
$0c:ba7c  45 20		 eor $20
$0c:ba7e  ed 0c ea	  sbc $ea0c
$0c:ba81  80 76		 bra $baf9
$0c:ba83  30 0c		 bmi $ba91
$0c:ba85  d6 be		 dec $be,x
$0c:ba87  c1 51		 cmp ($51,x)
$0c:ba89  c1 e6		 cmp ($e6,x)
$0c:ba8b  68			pla
$0c:ba8c  76 9e		 ror $9e,x
$0c:ba8e  67 ce		 adc [$ce]
$0c:ba90  e3 e3		 sbc $e3,s
$0c:ba92  ed fa e6	  sbc $e6fa
$0c:ba95  91 aa		 sta ($aa),y
$0c:ba97  04 03		 tsb $03
$0c:ba99  5d 00 b3	  eor $b300,x
$0c:ba9c  40			rti
$0c:ba9d  32 d0		 and ($d0)
$0c:ba9f  08			php
$0c:baa0  b4 02		 ldy $02,x
$0c:baa2  3d 00 9b	  and $9b00,x
$0c:baa5  40			rti
$0c:baa6  3c f0 0d	  bit $0df0,x
$0c:baa9  5c 02 ab 55   jml $55ab02
$0c:baad  de fd 84	  dec $84fd,x
$0c:bab0  a0 ef 61	  ldy #$61ef
$0c:bab3  28			plp
$0c:bab4  6a			ror a
$0c:bab5  87 26		 sta [$26]
$0c:bab7  ff 6a a8 00   sbc $00a86a,x
$0c:babb  35 5d		 and $5d,x
$0c:babd  6f fb f4 2f   adc $2ff4fb
$0c:bac1  f3 fd		 sbc ($fd,s),y
$0c:bac3  6e db d5	  ror $d5db
$0c:bac6  d5 7e		 cmp $7e,x
$0c:bac8  90 3c		 bcc $bb06
$0c:baca  07 24		 ora [$24]
$0c:bacc  89 06 f8	  bit #$f806
$0c:bacf  12 0a		 ora ($0a)
$0c:bad1  25 95		 and $95
$0c:bad3  d4 c0		 pei ($c0)
$0c:bad5  78			sei
$0c:bad6  50 3a		 bvc $bb12
$0c:bad8  be 1a 5b	  ldx $5b1a,y
$0c:badb  cc e5 63	  cpy $63e5
$0c:bade  e2 b8		 sep #$b8
$0c:bae0  6f 3c 5a dc   adc $dc5a3c
$0c:bae4  62 1b e4	  per $9f02
$0c:bae7  02 f1		 cop #$f1
$0c:bae9  00 b9		 brk #$b9
$0c:baeb  40			rti
$0c:baec  11 a0		 ora ($a0),y
$0c:baee  45 02		 eor $02
$0c:baf0  28			plp
$0c:baf1  66 ee		 ror $ee
$0c:baf3  95 28		 sta $28,x
$0c:baf5  05 ba		 ora $ba
$0c:baf7  cd db ed	  cmp $eddb
$0c:bafa  f9 bf d3	  sbc $d3bf,y
$0c:bafd  b9 de 33	  lda $33de,y
$0c:bb00  19 7f c0	  ora $c07f,y
$0c:bb03  01 4b		 ora ($4b,x)
$0c:bb05  33 00		 and ($00,s),y
$0c:bb07  92 40		 sta ($40)
$0c:bb09  20 30 0e	  jsr $0e30
$0c:bb0c  24 02		 bit $02
$0c:bb0e  e6 2c		 inc $2c
$0c:bb10  1a			inc a
$0c:bb11  9f 02 ef c4   sta $c4ef02,x
$0c:bb15  97 fc		 sta [$fc],y
$0c:bb17  2f fe cd 2f   and $2fcdfe
$0c:bb1b  1b			tcs
$0c:bb1c  35 4b		 and $4b,x
$0c:bb1e  dc d4 6a	  jml [$6ad4]
$0c:bb21  97 2f		 sta [$2f],y
$0c:bb23  e4 c3		 cpx $c3
$0c:bb25  f1 e4		 sbc ($e4),y
$0c:bb27  fc 41 3e	  jsr ($3e41,x)
$0c:bb2a  10 8f		 bpl $babb
$0c:bb2c  c4 c3		 cpy $c3
$0c:bb2e  e9 e0		 sbc #$e0
$0c:bb30  f7 40		 sbc [$40],y
$0c:bb32  31 f0		 and ($f0),y
$0c:bb34  09 36		 ora #$36
$0c:bb36  97 a9		 sta [$a9],y
$0c:bb38  45 d1		 eor $d1
$0c:bb3a  d0 71		 bne $bbad
$0c:bb3c  70 9f		 bvs $badd
$0c:bb3e  25 0f		 and $0f
$0c:bb40  43 43		 eor $43,s
$0c:bb42  a5 e0		 lda $e0
$0c:bb44  ee 9b 2a	  inc $2a9b
$0c:bb47  d4 02		 pei ($02)
$0c:bb49  74 40		 stz $40,x
$0c:bb4b  1b			tcs
$0c:bb4c  b4 02		 ldy $02,x
$0c:bb4e  7c a6 36	  jmp ($36a6,x)
$0c:bb51  18			clc
$0c:bb52  56 f6		 lsr $f6,x
$0c:bb54  98			tya
$0c:bb55  2f 06 1a 6d   and $6d1a06
$0c:bb59  83 8d		 sta $8d,s
$0c:bb5b  c8			iny
$0c:bb5c  a1 dc		 lda ($dc,x)
$0c:bb5e  9a			txs
$0c:bb5f  3c 82 47	  bit $4782,x
$0c:bb62  54 33 84	  mvn $84,$33
$0c:bb65  02 3f		 cop #$3f
$0c:bb67  00 e4		 brk #$e4
$0c:bb69  c0 3c		 cpy #$3c
$0c:bb6b  90 0f		 bcc $bb7c
$0c:bb6d  8c 03 71	  sty $7103
$0c:bb70  00 ee		 brk #$ee
$0c:bb72  40			rti
$0c:bb73  3f d0 0b 4f   and $4f0bd0,x
$0c:bb77  a6 2b		 ldx $2b
$0c:bb79  54 85 48	  mvn $48,$85
$0c:bb7c  20 91 48	  jsr $4891
$0c:bb7f  1c 2a 01	  trb $012a
$0c:bb82  04 80		 tsb $80
$0c:bb84  40			rti
$0c:bb85  8c c1 16	  sty $16c1
$0c:bb88  80 4a		 bra $bbd4
$0c:bb8a  d8			cld
$0c:bb8b  03 0b		 ora $0b,s
$0c:bb8d  80 41		 bra $bbd0
$0c:bb8f  60			rts
$0c:bb90  10 33		 bpl $bbc5
$0c:bb92  30 8b		 bmi $bb1f
$0c:bb94  4b			phk
$0c:bb95  13 c3		 ora ($c3,s),y
$0c:bb97  e0 58		 cpx #$58
$0c:bb99  ed db 9d	  sbc $9ddb
$0c:bb9c  67 36		 adc [$36]
$0c:bb9e  97 b2		 sta [$b2],y
$0c:bba0  fa			plx
$0c:bba1  ca			dex
$0c:bba2  6d b9 21	  adc $21b9
$0c:bba5  f8			sed
$0c:bba6  29 c3		 and #$c3
$0c:bba8  3d 00 e3	  and $e300,x
$0c:bbab  40			rti
$0c:bbac  3e 50 0f	  rol $0f50,x
$0c:bbaf  e3 30		 sbc $30,s
$0c:bbb1  4c 21 eb	  jmp $eb21
$0c:bbb4  8e 77 a9	  stx $a977
$0c:bbb7  1a			inc a
$0c:bbb8  18			clc
$0c:bbb9  26 57		 rol $57
$0c:bbbb  3b			tsc
$0c:bbbc  70 98		 bvs $bb56
$0c:bbbe  51 ba		 eor ($ba),y
$0c:bbc0  f1 ec		 sbc ($ec),y
$0c:bbc2  df b7 6a ed   cmp $ed6ab7,x
$0c:bbc6  09 fc		 ora #$fc
$0c:bbc8  02 ef		 cop #$ef
$0c:bbca  08			php
$0c:bbcb  1f 85 23 0f   ora $0f2385,x
$0c:bbcf  f7 84		 sbc [$84],y
$0c:bbd1  57 24		 eor [$24],y
$0c:bbd3  04 10		 tsb $10
$0c:bbd5  ea			nop
$0c:bbd6  4e ff 51	  lsr $51ff
$0c:bbd9  18			clc
$0c:bbda  64 8f		 stz $8f
$0c:bbdc  47 b3		 eor [$b3]
$0c:bbde  85 42		 sta $42
$0c:bbe0  2c de bf	  bit $bfde
$0c:bbe3  45 63		 eor $63
$0c:bbe5  6f ad 76 83   adc $8376ad
$0c:bbe9  34 3d		 bit $3d,x
$0c:bbeb  d1 0b		 cmp ($0b),y
$0c:bbed  e4 02		 cpx $02
$0c:bbef  2d e1 f7	  and $f7e1
$0c:bbf2  c4 27		 cpy $27
$0c:bbf4  70 45		 bvs $bc3b
$0c:bbf6  18			clc
$0c:bbf7  66 6c		 ror $6c
$0c:bbf9  f3 47		 sbc ($47,s),y
$0c:bbfb  c0 6e		 cpy #$6e
$0c:bbfd  b3 76		 lda ($76,s),y
$0c:bbff  a9 07		 lda #$07
$0c:bc01  96 87		 stx $87,y
$0c:bc03  c1 d3		 cmp ($d3,x)
$0c:bc05  69 ab		 adc #$ab
$0c:bc07  bb			tyx
$0c:bc08  b8			clv
$0c:bc09  06 7e		 asl $7e
$0c:bc0b  05 7f		 ora $7f
$0c:bc0d  82 5f e3	  brl $9f6f
$0c:bc10  9f f8 f7 fe   sta $fef7f8,x
$0c:bc14  7d ff ac	  adc $acff,x
$0c:bc17  83 43		 sta $43,s
$0c:bc19  ff 2d f9 6d   sbc $6df92d,x
$0c:bc1d  b7 35		 lda [$35],y
$0c:bc1f  2c ee 4b	  bit $4bee
$0c:bc22  bb			tyx
$0c:bc23  7b			tdc
$0c:bc24  8e 63 f9	  stx $f963
$0c:bc27  91 9e		 sta ($9e),y
$0c:bc29  f5 3f		 sbc $3f,x
$0c:bc2b  38			sec
$0c:bc2c  ed 0a 04	  sbc $040a
$0c:bc2f  02 c0		 cop #$c0
$0c:bc31  82 1f 04	  brl $c053
$0c:bc34  02 e0		 cop #$e0
$0c:bc36  82 3b b7	  brl $7374
$0c:bc39  aa			tax
$0c:bc3a  59 e7 d9	  eor $d9e7,y
$0c:bc3d  5c 70 96 18   jml $189670
$0c:bc41  8f c2 b1 b9   sta $b9b1c2
$0c:bc45  e5 4e		 sbc $4e
$0c:bc47  75 b5		 adc $b5,x
$0c:bc49  c6 08		 dec $08
$0c:bc4b  46 e0		 lsr $e0
$0c:bc4d  10 f7		 bpl $bc46
$0c:bc4f  10 a8		 bpl $bbf9
$0c:bc51  c2 0e		 rep #$0e
$0c:bc53  a8			tay
$0c:bc54  18			clc
$0c:bc55  1e 03 33	  asl $3303,x
$0c:bc58  ec b5 57	  cpx $57b5
$0c:bc5b  6f bb 7d 8e   adc $8e7dbb
$0c:bc5f  26 1d		 rol $1d
$0c:bc61  ab			plb
$0c:bc62  fe d6 ad	  inc $add6,x
$0c:bc65  15 e9		 ora $e9,x
$0c:bc67  94 72		 sty $72,x
$0c:bc69  67 00		 adc [$00]
$0c:bc6b  d1 c0		 cmp ($c0),y
$0c:bc6d  39 70 0f	  and $0f70,y
$0c:bc70  ec 08 92	  cpx $9208
$0c:bc73  1b			tcs
$0c:bc74  f8			sed
$0c:bc75  03 24		 ora $24,s
$0c:bc77  01 a1		 ora ($a1,x)
$0c:bc79  19 e9 fa	  ora $fae9,y
$0c:bc7c  b6 91		 ldx $91,y
$0c:bc7e  5d ce e6	  eor $e6ce,x
$0c:bc81  6f fa ba 59   adc $59bafa
$0c:bc85  6d 75 ca	  adc $ca75
$0c:bc88  d6 d7		 dec $d7,x
$0c:bc8a  33 e6		 and ($e6,s),y
$0c:bc8c  80 70		 bra $bcfe
$0c:bc8e  e1 1c		 sbc ($1c,x)
$0c:bc90  28			plp
$0c:bc91  27 02		 and [$02]
$0c:bc93  09 81		 ora #$81
$0c:bc95  87 64		 sta [$64]
$0c:bc97  21 9a		 and ($9a,x)
$0c:bc99  18			clc
$0c:bc9a  65 0a		 adc $0a
$0c:bc9c  71 ab		 adc ($ab),y
$0c:bc9e  80 55		 bra $bcf5
$0c:bca0  6a			ror a
$0c:bca1  bb			tyx
$0c:bca2  df b0 34 25   cmp $2534b0,x
$0c:bca6  79 0c 8c	  adc $8c0c,y
$0c:bca9  02 ad		 cop #$ad
$0c:bcab  38			sec
$0c:bcac  a5 7f		 lda $7f
$0c:bcae  cd 81 aa	  cmp $aa81
$0c:bcb1  1f 80 08 4d   ora $4d0880,x
$0c:bcb5  82 cc 11	  brl $ce84
$0c:bcb8  f8			sed
$0c:bcb9  55 e0		 eor $e0,x
$0c:bcbb  fa			plx
$0c:bcbc  bd 77 53	  lda $5377,x
$0c:bcbf  f6 6c		 inc $6c,x
$0c:bcc1  09 4f		 ora #$4f
$0c:bcc3  1a			inc a
$0c:bcc4  91 00		 sta ($00),y
$0c:bcc6  c9 5f		 cmp #$5f
$0c:bcc8  f6 bf		 inc $bf,x
$0c:bcca  df c4 02 a0   cmp $a002c4,x
$0c:bcce  02 98		 cop #$98
$0c:bcd0  14 03		 trb $03
$0c:bcd2  27 7c		 and [$7c]
$0c:bcd4  a7 f3		 lda [$f3]
$0c:bcd6  b4 54		 ldy $54,x
$0c:bcd8  3a			dec a
$0c:bcd9  4e 27 4d	  lsr $4d27
$0c:bcdc  81 b0		 sta ($b0,x)
$0c:bcde  e0 f1		 cpx #$f1
$0c:bce0  74 3e		 stz $3e,x
$0c:bce2  a4 48		 ldy $48
$0c:bce4  18			clc
$0c:bce5  13 08		 ora ($08,s),y
$0c:bce7  05 f1		 ora $f1
$0c:bce9  1c 10 0b	  trb $0b10
$0c:bcec  f1 18		 sbc ($18),y
$0c:bcee  ed f0 0e	  sbc $0ef0
$0c:bcf1  4c de 8b	  jmp $8bde
$0c:bcf4  c0 fb		 cpy #$fb
$0c:bcf6  5d b5 b7	  eor $b7b5,x
$0c:bcf9  db			stp
$0c:bcfa  f7 ff		 sbc [$ff],y
$0c:bcfc  a7 53		 lda [$53]
$0c:bcfe  d4 5a		 pei ($5a)
$0c:bd00  3e f0 80	  rol $80f0,x
$0c:bd03  60			rts
$0c:bd04  4f e0 10 91   eor $9110e0
$0c:bd08  60			rts
$0c:bd09  83 02		 sta $02,s
$0c:bd0b  59 00 8b	  eor $8b00,y
$0c:bd0e  83 07		 sta $07,s
$0c:bd10  6b			rtl
$0c:bd11  4a			lsr a
$0c:bd12  95 c0		 sta $c0,x
$0c:bd14  3c b6 4d	  bit $4db6,x
$0c:bd17  96 fa		 stx $fa,y
$0c:bd19  d9 ec db	  cmp $dbec,y
$0c:bd1c  6d b8 5c	  adc $5cb8
$0c:bd1f  2f dc 10 0a   and $0a10dc
$0c:bd23  59 b8 05	  eor $05b8,y
$0c:bd26  06 01		 asl $01
$0c:bd28  13 80		 ora ($80,s),y
$0c:bd2a  52 60		 eor ($60)
$0c:bd2c  13 d0		 ora ($d0,s),y
$0c:bd2e  60			rts
$0c:bd2f  cd 79 52	  cmp $5279
$0c:bd32  bb			tyx
$0c:bd33  0f 02 c7 66   ora $66c702
$0c:bd37  d8			cld
$0c:bd38  ee 6b 75	  inc $756b
$0c:bd3b  ed 6d 37	  sbc $376d
$0c:bd3e  eb			xba
$0c:bd3f  d6 38		 dec $38,x
$0c:bd41  84 03		 sty $03
$0c:bd43  3c a0 1e	  bit $1ea0,x
$0c:bd46  74 01		 stz $01,x
$0c:bd48  be 1f 28	  ldx $281f,y
$0c:bd4b  07 ea		 ora [$ea]
$0c:bd4d  01 fc		 ora ($fc,x)
$0c:bd4f  7b			tdc
$0c:bd50  06 26		 asl $26
$0c:bd52  a5 c2		 lda $c2
$0c:bd54  8a			txa
$0c:bd55  d4 26		 pei ($26)
$0c:bd57  56 28		 lsr $28,x
$0c:bd59  24 92		 bit $92
$0c:bd5b  35 30		 and $30,x
$0c:bd5d  82 c4 21	  brl $df24
$0c:bd60  71 a2		 adc ($a2),y
$0c:bd62  28			plp
$0c:bd63  22 c2 5f 00   jsl $005fc2
$0c:bd67  8e c0 23	  stx $23c0
$0c:bd6a  70 08		 bvs $bd74
$0c:bd6c  7b			tdc
$0c:bd6d  20 60 ac	  jsr $ac60
$0c:bd70  60			rts
$0c:bd71  fa			plx
$0c:bd72  54 b8 1a	  mvn $1a,$b8
$0c:bd75  ef 34 ee f7   sbc $f7ee34
$0c:bd79  c6 bf		 dec $bf
$0c:bd7b  66 f7		 ror $f7
$0c:bd7d  76 c9		 ror $c9,x
$0c:bd7f  e4 3e		 cpx $3e
$0c:bd81  20 5f 28	  jsr $285f
$0c:bd84  cc 03 09	  cpy $0903
$0c:bd87  00 c0		 brk #$c0
$0c:bd89  c0 28		 cpy #$28
$0c:bd8b  90 0e		 bcc $bd9b
$0c:bd8d  1c 03 c1	  trb $c103
$0c:bd90  00 f6		 brk #$f6
$0c:bd92  c4 b6		 cpy $b6
$0c:bd94  f0 5e		 beq $bdf4
$0c:bd96  55 3b		 eor $3b,x
$0c:bd98  85 4d		 sta $4d
$0c:bd9a  ec d7 b1	  cpx $b1d7
$0c:bd9d  b0 be		 bcs $bd5d
$0c:bd9f  a5 9f		 lda $9f
$0c:bda1  95 7d		 sta $7d,x
$0c:bda3  46 05		 lsr $05
$0c:bda5  ee 01 31	  inc $3101
$0c:bda8  20 0c 82	  jsr $820c
$0c:bdab  01 70		 ora ($70,x)
$0c:bdad  80 4e		 bra $bdfd
$0c:bdaf  11 83		 ora ($83),y
$0c:bdb1  4f f4 ff 2a   eor $2afff4
$0c:bdb5  f8			sed
$0c:bdb6  ac c7 df	  ldy $dfc7
$0c:bdb9  bb			tyx
$0c:bdba  2b			pld
$0c:bdbb  b7 6a		 lda [$6a],y
$0c:bdbd  76 59		 ror $59,x
$0c:bdbf  ba			tsx
$0c:bdc0  6e 3e f7	  ror $f73e
$0c:bdc3  77 80		 adc [$80],y
$0c:bdc5  78			sei
$0c:bdc6  cc 01 41	  cpy $4101
$0c:bdc9  b1 40		 lda ($40),y
$0c:bdcb  7e aa c1	  ror $c1aa,x
$0c:bdce  df 1a 87 e7   cmp $e7871a,x
$0c:bdd2  97 b4		 sta [$b4],y
$0c:bdd4  ff 35 bd 9a   sbc $9abd35,x
$0c:bdd8  9c bb ab	  stz $abbb
$0c:bddb  77 ca		 adc [$ca],y
$0c:bddd  d3 7b		 cmp ($7b,s),y
$0c:bddf  fb			xce
$0c:bde0  6b			rtl
$0c:bde1  25 6f		 and $6f
$0c:bde3  dd 00 e2	  cmp $e200,x
$0c:bde6  c0 bf		 cpy #$bf
$0c:bde8  98			tya
$0c:bde9  2e 36 03	  rol $0336
$0c:bdec  5c 60 1b cc   jml $cc1b60
$0c:bdf0  02 d1		 cop #$d1
$0c:bdf2  80 f3		 bra $bde7
$0c:bdf4  7e 7d bc	  ror $bc7d,x
$0c:bdf7  0d 94 87	  ora $8794
$0c:bdfa  87 c0		 sta [$c0]
$0c:bdfc  94 42		 sty $42,x
$0c:bdfe  f1 58		 sbc ($58),y
$0c:be00  1f 4e 72 a4   ora $a4724e,x
$0c:be04  81 08		 sta ($08,x)
$0c:be06  07 fa		 ora [$fa]
$0c:be08  01 de		 ora ($de,x)
$0c:be0a  80 4f		 bra $be5b
$0c:be0c  a0 1f		 ldy #$1f
$0c:be0e  68			pla
$0c:be0f  05 f8		 ora $f8
$0c:be11  d0 28		 bne $be3b
$0c:be13  c0 d4		 cpy #$d4
$0c:be15  e7 aa		 sbc [$aa]
$0c:be17  b9 6b fe	  lda $fe6b,y
$0c:be1a  72 13		 adc ($13)
$0c:be1c  4e c9 f7	  lsr $f7c9
$0c:be1f  2a			rol a
$0c:be20  f1 8f		 sbc ($8f),y
$0c:be22  be e2 17	  ldx $17e2,y
$0c:be25  cc b0 13	  cpy $13b0
$0c:be28  02 00		 cop #$00
$0c:be2a  7f 0f 82 08   adc $08820f,x
$0c:be2e  5d a1 40	  eor $40a1,x
$0c:be31  04 04		 tsb $04
$0c:be33  07 4b		 ora [$4b]
$0c:be35  5c ee 4b 3e   jml $3e4bee
$0c:be39  d1 ef		 cmp ($ef),y
$0c:be3b  d4 2f		 pei ($2f)
$0c:be3d  b5 26		 lda $26,x
$0c:be3f  a5 6d		 lda $6d
$0c:be41  7a			ply
$0c:be42  52 dc		 eor ($dc)
$0c:be44  f5 9a		 sbc $9a,x
$0c:be46  07 40		 ora [$40]
$0c:be48  81 d8		 sta ($d8,x)
$0c:be4a  20 33 88	  jsr $8833
$0c:be4d  24 7e		 bit $7e
$0c:be4f  02 c9		 cop #$c9
$0c:be51  08			php
$0c:be52  19 7c 20	  ora $207c,y
$0c:be55  30 09		 bmi $be60
$0c:be57  b6 63		 ldx $63,y
$0c:be59  55 1c		 eor $1c,x
$0c:be5b  a1 c6		 lda ($c6,x)
$0c:be5d  a1 91		 lda ($91,x)
$0c:be5f  ad 5d cf	  lda $cf5d
$0c:be62  6b			rtl
$0c:be63  fc fb 7c	  jsr ($7cfb,x)
$0c:be66  6a			ror a
$0c:be67  5c f2 f0 17   jml $17f0f2
$0c:be6b  83 fb		 sta $fb,s
$0c:be6d  03 f3		 ora $f3,s
$0c:be6f  c7 ff		 cmp [$ff]
$0c:be71  9f e8 1f e1   sta $e11fe8,x
$0c:be75  50 0e		 bvc $be85
$0c:be77  10 ca		 bpl $be43
$0c:be79  e6 fe		 inc $fe
$0c:be7b  7a			ply
$0c:be7c  db			stp
$0c:be7d  55 72		 eor $72,x
$0c:be7f  f9 ba 88	  sbc $88ba,y
$0c:be82  c5 f9		 cmp $f9
$0c:be84  58			cli
$0c:be85  ca			dex
$0c:be86  16 33		 asl $33,x
$0c:be88  3d 1c b0	  and $b01c,x
$0c:be8b  4c 28 1f	  jmp $1f28
$0c:be8e  0c 0f 82	  tsb $820f
$0c:be91  03 c0		 ora $c0,s
$0c:be93  f4 40 3e	  pea $3e40
$0c:be96  2e 81 f0	  rol $f081
$0c:be99  c0 bf		 cpy #$bf
$0c:be9b  ff fa 54 03   sbc $0354fa,x
$0c:be9f  5d 51 b8	  eor $b851,x
$0c:bea2  eb			xba
$0c:bea3  b1 57		 lda ($57),y
$0c:bea5  79 df 71	  adc $71df,y
$0c:bea8  36 1d		 rol $1d,x
$0c:beaa  b2 f0		 lda ($f0)
$0c:beac  af c8 03 1f   lda $1f03c8
$0c:beb0  ef fd 26 03   sbc $0326fd
$0c:beb4  ad a8 dc	  lda $dca8
$0c:beb7  b5 98		 lda $98,x
$0c:beb9  bb			tyx
$0c:beba  ac e7 bb	  ldy $bbe7
$0c:bebd  d2 96		 cmp ($96)
$0c:bebf  3f 48 c2 06   and $06c248,x
$0c:bec3  10 06		 bpl $becb
$0c:bec5  88			dey
$0c:bec6  89 6d		 bit #$6d
$0c:bec8  dd 19 ff	  cmp $ff19,x
$0c:becb  fe d5 f6	  inc $f6d5,x
$0c:bece  fd fa f4	  sbc $f4fa,x
$0c:bed1  df 6a ff 7b   cmp $7bff6a,x
$0c:bed5  b9 fd ac	  lda $acfd,y
$0c:bed8  f0 d9		 beq $beb3
$0c:beda  83 7f		 sta $7f,s
$0c:bedc  80 df		 bra $bebd
$0c:bede  e0 97		 cpx #$97
$0c:bee0  f8			sed
$0c:bee1  6d fe 43	  adc $43fe
$0c:bee4  7f 81 df c6   adc $c6df81,x
$0c:bee8  21 bf		 and ($bf,x)
$0c:beea  a0 53		 ldy #$53
$0c:beec  e2 17		 sep #$17
$0c:beee  7b			tdc
$0c:beef  c7 9f		 cmp [$9f]
$0c:bef1  f1 eb		 sbc ($eb),y
$0c:bef3  fe 4d e6	  inc $e64d,x
$0c:bef6  98			tya
$0c:bef7  97 b8		 sta [$b8],y
$0c:bef9  62 1f e0	  per $9f1b
$0c:befc  89 0c		 bit #$0c
$0c:befe  03 fc		 ora $fc,s
$0c:bf00  0c 83 c8	  tsb $c883
$0c:bf03  80 5d		 bra $bf62
$0c:bf05  0c 83 fd	  tsb $fd83
$0c:bf08  81 54		 sta ($54,x)
$0c:bf0a  e8			inx
$0c:bf0b  7a			ply
$0c:bf0c  ea			nop
$0c:bf0d  3d 52 0f	  and $0f52,x
$0c:bf10  aa			tax
$0c:bf11  f9 ed 7f	  sbc $7fed,y
$0c:bf14  5a			phy
$0c:bf15  ba			tsx
$0c:bf16  a5 7f		 lda $7f
$0c:bf18  40			rti
$0c:bf19  ff 0d e4 03   sbc $03e40d,x
$0c:bf1d  f0 82		 beq $bea1
$0c:bf1f  1f e1 90 df   ora $df90e1,x
$0c:bf23  e1 d4		 sbc ($d4,x)
$0c:bf25  aa			tax
$0c:bf26  d5 32		 cmp $32,x
$0c:bf28  3a			dec a
$0c:bf29  ba			tsx
$0c:bf2a  4d 2f 13	  eor $132f
$0c:bf2d  a6 c0		 ldx $c0
$0c:bf2f  c8			iny
$0c:bf30  70 72		 bvs $bfa4
$0c:bf32  bf 0d 6e ff   lda $ff6e0d,x
$0c:bf36  2a			rol a
$0c:bf37  17 04		 ora [$04],y
$0c:bf39  02 ec		 cop #$ec
$0c:bf3b  a2 1b		 ldx #$1b
$0c:bf3d  f2 98		 sbc ($98)
$0c:bf3f  63 c6		 adc $c6,s
$0c:bf41  21 81		 and ($81,x)
$0c:bf43  42 20		 wdm #$20
$0c:bf45  b0 c8		 bcs $bf0f
$0c:bf47  0c 16 01	  tsb $0116
$0c:bf4a  04 81		 tsb $81
$0c:bf4c  c1 95		 cmp ($95,x)
$0c:bf4e  c0 ae		 cpy #$ae
$0c:bf50  08			php
$0c:bf51  0c 0e 0f	  tsb $0f0e
$0c:bf54  00 81		 brk #$81
$0c:bf56  ae 45 82	  ldx $8245
$0c:bf59  10 16		 bpl $bf71
$0c:bf5b  31 a2		 and ($a2),y
$0c:bf5d  03 67		 ora $67,s
$0c:bf5f  1c a1 52	  trb $52a1
$0c:bf62  2b			pld
$0c:bf63  50 e8		 bvc $bf4d
$0c:bf65  5c 3e a5 16   jml $16a53e
$0c:bf69  d6 e1		 dec $e1,x
$0c:bf6b  ec 94 6c	  cpx $6c94
$0c:bf6e  cc 48 c2	  cpy $c248
$0c:bf71  1b			tcs
$0c:bf72  78			sei
$0c:bf73  07 c6		 ora [$c6]
$0c:bf75  01 f0		 ora ($f0,x)
$0c:bf77  80 7a		 bra $bff3
$0c:bf79  60			rts
$0c:bf7a  17 88		 ora [$88],y
$0c:bf7c  06 e6		 asl $e6
$0c:bf7e  01 ec		 ora ($ec,x)
$0c:bf80  80 55		 bra $bfd7
$0c:bf82  3d 9f ba	  and $ba9f,x
$0c:bf85  26 7e		 rol $7e
$0c:bf87  c1 ef		 cmp ($ef,x)
$0c:bf89  a4 e7		 ldy $e7
$0c:bf8b  69 fe		 adc #$fe
$0c:bf8d  da			phx
$0c:bf8e  ff 6a cb 3f   sbc $3fcb6a,x
$0c:bf92  e0 48		 cpx #$48
$0c:bf94  e0 12		 cpx #$12
$0c:bf96  00 00		 brk #$00
$0c:bf98  cd 87 e2	  cmp $e287
$0c:bf9b  01 20		 ora ($20,x)
$0c:bf9d  08			php
$0c:bf9e  7d e3 f9	  adc $f9e3,x
$0c:bfa1  4b			phk
$0c:bfa2  45 97		 eor $97
$0c:bfa4  a1 68		 lda ($68,x)
$0c:bfa6  e8			inx
$0c:bfa7  5c fb 76 fe   jml $fe76fb
$0c:bfab  7d 07 fd	  adc $fd07,x
$0c:bfae  7f f0 a2 02   adc $02a2f0,x
$0c:bfb2  2e 3f 12	  rol $123f
$0c:bfb5  00 4f		 brk #$4f
$0c:bfb7  20 12 f8	  jsr $f812
$0c:bfba  81 00		 sta ($00,x)
$0c:bfbc  27 ca		 and [$ca]
$0c:bfbe  00 f4		 brk #$f4
$0c:bfc0  e2 34		 sep #$34
$0c:bfc2  92 78		 sta ($78)
$0c:bfc4  56 5a		 lsr $5a,x
$0c:bfc6  15 cf		 ora $cf,x
$0c:bfc8  ed fd be	  sbc $befd
$0c:bfcb  58			cli
$0c:bfcc  3b			tsc
$0c:bfcd  f7 ff		 sbc [$ff],y
$0c:bfcf  0f 90 80 5e   ora $5e8090
$0c:bfd3  cd c0 42	  cmp $42c0
$0c:bfd6  11 38		 ora ($38),y
$0c:bfd8  7d 61 04	  adc $0461,x
$0c:bfdb  30 be		 bmi $bf9b
$0c:bfdd  40			rti
$0c:bfde  35 75		 and $75,x
$0c:bfe0  ca			dex
$0c:bfe1  bd bb 5b	  lda $5bbb,x
$0c:bfe4  e8			inx
$0c:bfe5  e8			inx
$0c:bfe6  ec 35 7f	  cpx $7f35
$0c:bfe9  ea			nop
$0c:bfea  9d ab 7f	  sta $7fab,x
$0c:bfed  10 d4		 bpl $bfc3
$0c:bfef  fe 60 11	  inc $1160,x
$0c:bff2  8c c4 f2	  sty $f2c4
$0c:bff5  3d 3c 87	  and $873c,x
$0c:bff8  09 c2		 ora #$c2
$0c:bffa  39 84 9e	  and $9e84,y
$0c:bffd  72 a7		 adc ($a7)
$0c:bfff  90 69		 bcc $c06a
$0c:c001  e5 b7		 sbc $b7
$0c:c003  e5 b7		 sbc $b7
$0c:c005  cc 57 32	  cpy $3257
$0c:c008  7a			ply
$0c:c009  7f c5 72 27   adc $2772c5,x
$0c:c00d  db			stp
$0c:c00e  ca			dex
$0c:c00f  46 7a		 lsr $7a
$0c:c011  d7 5c		 cmp [$5c],y
$0c:c013  d3 30		 cmp ($30,s),y
$0c:c015  2c 10 14	  bit $1410
$0c:c018  08			php
$0c:c019  50 20		 bvc $c03b
$0c:c01b  7e 04 10	  ror $1004,x
$0c:c01e  40			rti
$0c:c01f  d0 25		 bne $c046
$0c:c021  9b			txy
$0c:c022  b3 f4		 lda ($f4,s),y
$0c:c024  65 f9		 adc $f9
$0c:c026  4b			phk
$0c:c027  7e 96 bb	  ror $bb96,x
$0c:c02a  d7 97		 cmp [$97],y
$0c:c02c  e3 3f		 sbc $3f,s
$0c:c02e  f0 5f		 beq $c08f
$0c:c030  fe ce de	  inc $dece,x
$0c:c033  cc 16 60	  cpy $6016
$0c:c036  ae 82 01	  ldx $0182
$0c:c039  80 53		 bra $c08e
$0c:c03b  8f 01 c8 1c   sta $1cc801
$0c:c03f  ae 3e 2f	  ldx $2f3e
$0c:c042  8f af f1 cc   sta $ccf1af
$0c:c046  bc fe af	  ldy $affe,x
$0c:c049  3a			dec a
$0c:c04a  bc 32 b8	  ldy $b832,x
$0c:c04d  e9 14		 sbc #$14
$0c:c04f  70 46		 bvs $c097
$0c:c051  51 f6		 eor ($f6),y
$0c:c053  11 88		 ora ($88),y
$0c:c055  c2 ff		 rep #$ff
$0c:c057  00 ff		 brk #$ff
$0c:c059  c0 39 30	  cpy #$3039
$0c:c05c  fc 34 1b	  jsr ($1b34,x)
$0c:c05f  23 15		 and $15,s
$0c:c061  97 c2		 sta [$c2],y
$0c:c063  78			sei
$0c:c064  10 cc		 bpl $c032
$0c:c066  fc 5e 75	  jsr ($755e,x)
$0c:c069  3a			dec a
$0c:c06a  f4 f8 fe	  pea $fef8
$0c:c06d  10 2f		 bpl $c09e
$0c:c06f  cc 0b d5	  cpy $d50b
$0c:c072  02 f9		 cop #$f9
$0c:c074  41 be		 eor ($be,x)
$0c:c076  70 6f		 bvs $c0e7
$0c:c078  04 3b		 tsb $3b
$0c:c07a  8b			phb
$0c:c07b  0e 8e 47	  asl $478e
$0c:c07e  b5 58		 lda $58,x
$0c:c080  ac 54 02	  ldy $0254
$0c:c083  e9 10 c9	  sbc #$c910
$0c:c086  c0 6d 56	  cpy #$566d
$0c:c089  a8			tay
$0c:c08a  0f fd 9a 0c   ora $0c9afd
$0c:c08e  d0 ba		 bne $c04a
$0c:c090  b3 07		 lda ($07,s),y
$0c:c092  df 00 ff 40   cmp $40ff00,x
$0c:c096  32 a9		 and ($a9)
$0c:c098  f4 80 3b	  pea $3b80
$0c:c09b  f3 b7		 sbc ($b7,s),y
$0c:c09d  24 7f		 bit $7f
$0c:c09f  f6 2e		 inc $2e,x
$0c:c0a1  fd 40 df	  sbc $df40,x
$0c:c0a4  54 f5 f5	  mvn $f5,$f5
$0c:c0a7  1d fd 97	  ora $97fd,x
$0c:c0aa  37 95		 and [$95],y
$0c:c0ac  b5 3e		 lda $3e,x
$0c:c0ae  c9 f2 10	  cmp #$10f2
$0c:c0b1  16 58		 asl $58,x
$0c:c0b3  10 92		 bpl $c047
$0c:c0b5  2a			rol a
$0c:c0b6  9f 26 68 53   sta $536826,x
$0c:c0ba  fa			plx
$0c:c0bb  1f 7b c6 9e   ora $9ec67b,x
$0c:c0bf  f1 7b		 sbc ($7b),y
$0c:c0c1  fe 75 ea	  inc $ea75,x
$0c:c0c4  9a			txs
$0c:c0c5  9b			txy
$0c:c0c6  57 de		 eor [$de],y
$0c:c0c8  10 a3		 bpl $c06d
$0c:c0ca  09 00 21	  ora #$2100
$0c:c0cd  65 10		 adc $10
$0c:c0cf  08			php
$0c:c0d0  a2 7c 73	  ldx #$737c
$0c:c0d3  94 1d		 sty $1d,x
$0c:c0d5  9d b7 29	  sta $29b7,x
$0c:c0d8  49 d9 d9	  eor #$d9d9
$0c:c0db  fd d2 2e	  sbc $2ed2,x
$0c:c0de  4c 8f 99	  jmp $998f
$0c:c0e1  3e 66 84	  rol $8466,x
$0c:c0e4  fa			plx
$0c:c0e5  01 1e		 ora ($1e,x)
$0c:c0e7  3f 0c 72 01   and $01720c,x
$0c:c0eb  1d 42 0c	  ora $0c42,x
$0c:c0ee  05 3e		 ora $3e
$0c:c0f0  3b			tsc
$0c:c0f1  2a			rol a
$0c:c0f2  ad e6 27	  lda $27e6
$0c:c0f5  b0 c1		 bcs $c0b8
$0c:c0f7  d7 b9		 cmp [$b9],y
$0c:c0f9  3a			dec a
$0c:c0fa  db			stp
$0c:c0fb  3d 5b 67	  and $675b,x
$0c:c0fe  63 dc		 adc $dc,s
$0c:c100  e5 3d		 sbc $3d
$0c:c102  b0 e8		 bcs $c0ec
$0c:c104  06 3a		 asl $3a
$0c:c106  01 ce		 ora ($ce,x)
$0c:c108  80 79		 bra $c183
$0c:c10a  a0 1f 28	  ldy #$281f
$0c:c10d  07 e2		 ora [$e2]
$0c:c10f  01 fc		 ora ($fc,x)
$0c:c111  02 0a		 cop #$0a
$0c:c113  28			plp
$0c:c114  56 18		 lsr $18,x
$0c:c116  bf da d4 4f   lda $4fd4da,x
$0c:c11a  49 81 ef	  eor #$ef81
$0c:c11d  62 fa 1c	  per $de1a
$0c:c120  1d 66 97	  ora $9766,x
$0c:c123  c5 a3		 cmp $a3
$0c:c125  cb			wai
$0c:c126  60			rts
$0c:c127  f5 98		 sbc $98,x
$0c:c129  9f 64 02 fd   sta $fd0264,x
$0c:c12d  00 ba		 brk #$ba
$0c:c12f  1f 86 b5 00   ora $00b586,x
$0c:c133  ae 40 2f	  ldx $2f40
$0c:c136  90 0b		 bcc $c143
$0c:c138  b4 03		 ldy $03,x
$0c:c13a  3d 95 96	  and $9695,x
$0c:c13d  f5 bf		 sbc $bf,x
$0c:c13f  f0 4a		 beq $c18b
$0c:c141  c4 3f		 cpy $3f
$0c:c143  41 f7		 eor ($f7,x)
$0c:c145  d3 ff		 cmp ($ff,s),y
$0c:c147  35 f5		 and $f5,x
$0c:c149  4f e4 1e c5   eor $c51ee4
$0c:c14d  00 81		 brk #$81
$0c:c14f  00 05		 brk #$05
$0c:c151  4e 1f a0	  lsr $a01f
$0c:c154  01 80		 ora ($80,x)
$0c:c156  42 3b		 wdm #$3b
$0c:c158  9f bf f0 2e   sta $2ef0bf,x
$0c:c15c  7f fa 0c 07   adc $070cfa,x
$0c:c160  35 98		 and $98,x
$0c:c162  a4 40		 ldy $40
$0c:c164  32 57		 and ($57)
$0c:c166  f9 af f6	  sbc $f6af,y
$0c:c169  bf 20 9f 99   lda $999f20,x
$0c:c16d  85 5a		 sta $5a
$0c:c16f  16 72		 asl $72,x
$0c:c171  70 93		 bvs $c106
$0c:c173  c0 02 1b	  cpy #$1b02
$0c:c176  9f cf f2 03   sta $03f2cf,x
$0c:c17a  ac ff e0	  ldy $e0ff
$0c:c17d  b0 15		 bcs $c194
$0c:c17f  98			tya
$0c:c180  cc 4a 01	  cpy $014a
$0c:c183  49 ff 6b	  eor #$6bff
$0c:c186  37 ff		 and [$ff],y
$0c:c188  a8			tay
$0c:c189  22 b4 00 21   jsl $2100b4
$0c:c18d  7f 52 08 a4   adc $a40852,x
$0c:c191  a8			tay
$0c:c192  08			php
$0c:c193  00 f6		 brk #$f6
$0c:c195  fa			plx
$0c:c196  60			rts
$0c:c197  ff 78 8e c6   sbc $c68e78,x
$0c:c19b  db			stp
$0c:c19c  c0 a1 6b	  cpy #$6ba1
$0c:c19f  76 95		 ror $95,x
$0c:c1a1  2f 76 d2 df   and $dfd276
$0c:c1a5  18			clc
$0c:c1a6  df 97 c2 15   cmp $15c297,x
$0c:c1aa  5f 83 7f e7   eor $e77f83,x
$0c:c1ae  ff fa 1f fe   sbc $fe1ffa,x
$0c:c1b2  32 7d		 and ($7d)
$0c:c1b4  0c ce 93	  tsb $93ce
$0c:c1b7  17 5f		 ora [$5f],y
$0c:c1b9  d4 54		 pei ($54)
$0c:c1bb  b0 be		 bcs $c17b
$0c:c1bd  dc 36 ab	  jml [$ab36]
$0c:c1c0  97 17		 sta [$17],y
$0c:c1c2  a1 7b		 lda ($7b,x)
$0c:c1c4  32 31		 and ($31)
$0c:c1c6  7d cd c2	  adc $c2cd,x
$0c:c1c9  01 70		 ora ($70,x)
$0c:c1cb  80 de		 bra $c1ab
$0c:c1cd  20 08 30	  jsr $3008
$0c:c1d0  71 82		 adc ($82),y
$0c:c1d2  ac 1c 20	  ldy $201c
$0c:c1d5  e1 0d		 sbc ($0d,x)
$0c:c1d7  55 b6		 eor $b6,x
$0c:c1d9  b7 b9		 lda [$b9],y
$0c:c1db  db			stp
$0c:c1dc  53 b5		 eor ($b5,s),y
$0c:c1de  b5 3e		 lda $3e,x
$0c:c1e0  d4 96		 pei ($96)
$0c:c1e2  eb			xba
$0c:c1e3  8b			phb
$0c:c1e4  9d e9 2d	  sta $2de9,x
$0c:c1e7  f8			sed
$0c:c1e8  88			dey
$0c:c1e9  87 fa		 sta [$fa]
$0c:c1eb  0d 7f 80	  ora $807f
$0c:c1ee  88			dey
$0c:c1ef  40			rti
$0c:c1f0  42 11		 wdm #$11
$0c:c1f2  f8			sed
$0c:c1f3  04 1e		 tsb $1e
$0c:c1f5  81 03		 sta ($03,x)
$0c:c1f7  3f 84 56 11   and $115684,x
$0c:c1fb  dc a2 ea	  jml [$eaa2]
$0c:c1fe  ab			plb
$0c:c1ff  fa			plx
$0c:c200  ac 26 87	  ldy $8726
$0c:c203  c1 fe		 cmp ($fe,x)
$0c:c205  bd 53 fd	  lda $fd53,x
$0c:c208  fc a9 ef	  jsr ($efa9,x)
$0c:c20b  fa			plx
$0c:c20c  03 33		 ora $33,s
$0c:c20e  c7 ff		 cmp [$ff]
$0c:c210  ff f7 ff fc   sbc $fcfff7,x
$0c:c214  7f ff 05 ff   adc $ff05ff,x
$0c:c218  c4 05		 cpy $05
$0c:c21a  61 fe		 adc ($fe,x)
$0c:c21c  92 e5		 sta ($e5)
$0c:c21e  f5 7c		 sbc $7c,x
$0c:c220  da			phx
$0c:c221  c6 3b		 dec $3b
$0c:c223  6f 39 b4 dd   adc $ddb439
$0c:c227  72 5e		 adc ($5e)
$0c:c229  8a			txa
$0c:c22a  2e ce 17	  rol $17ce
$0c:c22d  c7 bc		 cmp [$bc]
$0c:c22f  7f be 1f ef   adc $ef1fbe,x
$0c:c233  8f f3 81 fe   sta $fe81f3
$0c:c237  c1 7e		 cmp ($7e,x)
$0c:c239  20 ff 08	  jsr $08ff
$0c:c23c  77 02		 adc [$02],y
$0c:c23e  7d 00 cf	  adc $cf00,x
$0c:c241  dc a9 5c	  jml [$5ca9]
$0c:c244  ed 7d 26	  sbc $267d
$0c:c247  99 8a d7	  sta $d78a,y
$0c:c24a  e2 ad		 sep #$ad
$0c:c24c  58			cli
$0c:c24d  ec 7d 27	  cpx $277d
$0c:c250  b9 1a 80	  lda $801a,y
$0c:c253  c1 e6		 cmp ($e6,x)
$0c:c255  30 7b		 bmi $c2d2
$0c:c257  84 1e		 sty $1e
$0c:c259  e2 04		 sep #$04
$0c:c25b  30 18		 bmi $c275
$0c:c25d  58			cli
$0c:c25e  60			rts
$0c:c25f  f1 2a		 sbc ($2a),y
$0c:c261  ad a7 87	  lda $87a7
$0c:c264  80 81		 bra $c1e7
$0c:c266  e5 b0		 sbc $b0
$0c:c268  32 9a		 and ($9a)
$0c:c26a  7d 2b 97	  adc $972b,x
$0c:c26d  95 81		 sta $81,x
$0c:c26f  ea			nop
$0c:c270  b3 fa		 lda ($fa,s),y
$0c:c272  ee 06 f9	  inc $f906
$0c:c275  ca			dex
$0c:c276  1c 0b f7	  trb $f70b
$0c:c279  03 6c		 ora $6c,s
$0c:c27b  26 11		 rol $11
$0c:c27d  19 47 f3	  ora $f347,y
$0c:c280  5a			phy
$0c:c281  a8			tay
$0c:c282  77 3e		 adc [$3e],y
$0c:c284  13 5c		 ora ($5c,s),y
$0c:c286  c5 4b		 cmp $4b
$0c:c288  f9 5c ac	  sbc $ac5c,y
$0c:c28b  74 7f		 stz $7f,x
$0c:c28d  13 e4		 ora ($e4,s),y
$0c:c28f  89 03		 bit #$03
$0c:c291  40			rti
$0c:c292  12 40		 ora ($40)
$0c:c294  56 bc		 lsr $bc,x
$0c:c296  83 82		 sta $82,s
$0c:c298  ff 48 e4 e8   sbc $e8e448,x
$0c:c29c  e0 38 bc	  cpx #$bc38
$0c:c29f  4c 92 87	  jmp $8792
$0c:c2a2  61 e1		 adc ($e1,x)
$0c:c2a4  e2 e0		 sep #$e0
$0c:c2a6  79 4c 96	  adc $964c,y
$0c:c2a9  00 50		 brk #$50
$0c:c2ab  77 61		 adc [$61],y
$0c:c2ad  00 88		 brk #$88
$0c:c2af  4a			lsr a
$0c:c2b0  df c0 ad 7e   cmp $7eadc0,x
$0c:c2b4  eb			xba
$0c:c2b5  37 6e		 and [$6e],y
$0c:c2b7  fc e3 97	  jsr ($97e3,x)
$0c:c2ba  34 f7		 bit $f7,x
$0c:c2bc  c4 3f		 cpy $3f
$0c:c2be  b0 6f		 bcs $c32f
$0c:c2c0  cc 9a 9f	  cpy $9f9a
$0c:c2c3  f6 c2		 inc $c2,x
$0c:c2c5  40			rti
$0c:c2c6  2c 18 0f	  bit $0f18
$0c:c2c9  84 02		 sty $02
$0c:c2cb  21 00		 and ($00,x)
$0c:c2cd  83 21		 sta $21,s
$0c:c2cf  82 09 d6	  brl $98db
$0c:c2d2  66 85		 ror $85
$0c:c2d4  03 e3		 ora $e3,s
$0c:c2d6  f8			sed
$0c:c2d7  a4 52		 ldy $52
$0c:c2d9  7a			ply
$0c:c2da  7f a3 e8 7f   adc $7fe8a3,x
$0c:c2de  e4 df		 cpx $df
$0c:c2e0  98			tya
$0c:c2e1  33 30		 and ($30,s),y
$0c:c2e3  19 80 99	  ora $9980,y
$0c:c2e6  0a			asl a
$0c:c2e7  4e db f7	  lsr $f7db
$0c:c2ea  04 46		 tsb $46
$0c:c2ec  82 2c 10	  brl $d31b
$0c:c2ef  e3 00		 sbc $00,s
$0c:c2f1  56 04		 lsr $04,x
$0c:c2f3  76 67		 ror $67,x
$0c:c2f5  13 9a		 ora ($9a,s),y
$0c:c2f7  c7 66		 cmp [$66]
$0c:c2f9  d1 99		 cmp ($99),y
$0c:c2fb  b4 72		 ldy $72,x
$0c:c2fd  67 01		 adc [$01]
$0c:c2ff  93 ad		 sta ($ad,s),y
$0c:c301  c2 35		 rep #$35
$0c:c303  35 87		 and $87,x
$0c:c305  c0 17 ed	  cpy #$ed17
$0c:c308  1f 60 1d fc   ora $fc1d60,x
$0c:c30c  be 13 fd	  ldx $fd13,y
$0c:c30f  bd df 83	  lda $83df,x
$0c:c312  7f cf 4f 9a   adc $9a4fcf,x
$0c:c316  e1 80		 sbc ($80,x)
$0c:c318  9f 35 42 ff   sta $ff4235,x
$0c:c31c  ff e0 7f f1   sbc $f17fe0,x
$0c:c320  1f fd f7 fd   ora $fdf7fd,x
$0c:c324  cc 8e 50	  cpy $508e
$0c:c327  e0 5f fc	  cpx #$fc5f
$0c:c32a  b6 5f		 ldx $5f,y
$0c:c32c  e4 0b		 cpx $0b
$0c:c32e  73 3b		 adc ($3b,s),y
$0c:c330  e1 5f		 sbc ($5f,x)
$0c:c332  dd e1 92	  cmp $92e1,x
$0c:c335  6f 06 03 01   adc $010306
$0c:c339  ff cd 7f ff   sbc $ff7fcd,x
$0c:c33d  bf fe 27 ff   lda $ff27fe,x
$0c:c341  79 ff df	  adc $dfff,y
$0c:c344  ff df e0 df   sbc $dfe0df,x
$0c:c348  07 e8		 ora [$e8]
$0c:c34a  df fb b7 fc   cmp $fcb7fb,x
$0c:c34e  0c 07 79	  tsb $7907
$0c:c351  42 eb		 wdm #$eb
$0c:c353  ca			dex
$0c:c354  37 f4		 and [$f4],y
$0c:c356  00 d8		 brk #$d8
$0c:c358  37 c1		 and [$c1],y
$0c:c35a  ca			dex
$0c:c35b  0e 50 ff	  asl $ff50
$0c:c35e  7f f7 bf fe   adc $febff7,x
$0c:c362  b8			clv
$0c:c363  20 41 21	  jsr $2141
$0c:c366  fb			xce
$0c:c367  a2 7d 29	  ldx #$297d
$0c:c36a  7e 0a fe	  ror $fe0a,x
$0c:c36d  a6 57		 ldx $57
$0c:c36f  ca			dex
$0c:c370  bf 3e 50 56   lda $56503e,x
$0c:c374  40			rti
$0c:c375  90 ea		 bcc $c361
$0c:c377  09 84 12	  ora #$1284
$0c:c37a  97 ec		 sta [$ec],y
$0c:c37c  0f 06 fd 92   ora $92fd06
$0c:c380  b9 e8 6f	  lda $6fe8,y
$0c:c383  f8			sed
$0c:c384  da			phx
$0c:c385  9e 32 a4	  stz $a432,x
$0c:c388  55 0a		 eor $0a,x
$0c:c38a  d6 ea		 dec $ea,x
$0c:c38c  fd ff c0	  sbc $c0ff,x
$0c:c38f  ff f1 80 a1   sbc $a180f1,x
$0c:c393  d6 7f		 dec $7f,x
$0c:c395  f5 a0		 sbc $a0,x
$0c:c397  a1 a2		 lda ($a2,x)
$0c:c399  ff ed fb 0d   sbc $0dfbed,x
$0c:c39d  9d 3b 99	  sta $993b,x
$0c:c3a0  bd a9 ec	  lda $eca9,x
$0c:c3a3  b5 36		 lda $36,x
$0c:c3a5  fd 35 bb	  sbc $bb35,x
$0c:c3a8  ab			plb
$0c:c3a9  5c ed ca 29   jml $29caed
$0c:c3ad  ff fd 8f fe   sbc $fe8ffd,x
$0c:c3b1  85 ff		 sta $ff
$0c:c3b3  a6 ff		 ldx $ff
$0c:c3b5  f2 3f		 sbc ($3f)
$0c:c3b7  ec b7 e7	  cpx $e7b7
$0c:c3ba  49 fb ec	  eor #$ecfb
$0c:c3bd  7d ef dc	  adc $dcef,x
$0c:c3c0  3b			tsc
$0c:c3c1  1e f7 b7	  asl $b7f7,x
$0c:c3c4  af af ff 12   lda $12ffaf
$0c:c3c8  21 c2		 and ($c2,x)
$0c:c3ca  df f6 bd b5   cmp $b5bdf6,x
$0c:c3ce  7f 6c f2 01   adc $01f26c,x
$0c:c3d2  7e 90 5f	  ror $5f90,x
$0c:c3d5  a1 57		 lda ($57,x)
$0c:c3d7  fa			plx
$0c:c3d8  a2 84 60	  ldx #$6084
$0c:c3db  57 ea		 eor [$ea],y
$0c:c3dd  45 fa		 eor $fa
$0c:c3df  89 d3 d7	  bit #$d7d3
$0c:c3e2  d6 ff		 dec $ff,x
$0c:c3e4  f4 bf ef	  pea $efbf
$0c:c3e7  0f 7f db d7   ora $d7db7f
$0c:c3eb  5e ff bc	  lsr $bcff,x
$0c:c3ee  bd ed f3	  lda $f3ed,x
$0c:c3f1  a6 a9		 ldx $a9
$0c:c3f3  1a			inc a
$0c:c3f4  92 ac		 sta ($ac)
$0c:c3f6  60			rts
$0c:c3f7  57 f8		 eor [$f8],y
$0c:c3f9  55 fa		 eor $fa,x
$0c:c3fb  e1 7e		 sbc ($7e,x)
$0c:c3fd  84 4b		 sty $4b
$0c:c3ff  20 1a de	  jsr $de1a
$0c:c402  9d 57 d9	  sta $d957,x
$0c:c405  aa			tax
$0c:c406  ac d5 75	  ldy $75d5
$0c:c409  9a			txs
$0c:c40a  9b			txy
$0c:c40b  bf 5a b3 26   lda $26b35a,x
$0c:c40f  c4 f6		 cpy $f6
$0c:c411  75 d2		 adc $d2,x
$0c:c413  8f c4 0f c1   sta $c10fc4
$0c:c417  87 e0		 sta [$e0]
$0c:c419  40			rti
$0c:c41a  c2 01		 rep #$01
$0c:c41c  80 90		 bra $c3ae
$0c:c41e  40			rti
$0c:c41f  2e 30 0b	  rol $0b30
$0c:c422  9c 00 00	  stz $0000
$0c:c425  20 80 3b	  jsr $3b80
$0c:c428  fc 01 d3	  jsr ($d301,x)
$0c:c42b  68			pla
$0c:c42c  05 6a		 ora $6a
$0c:c42e  0b			phd
$0c:c42f  20 8f d4	  jsr $d48f
$0c:c432  25 f6		 and $f6
$0c:c434  88			dey
$0c:c435  fd 0a 7f	  sbc $7f0a,x
$0c:c438  62 8e c0	  per $84c9
$0c:c43b  3f e1 fd 80   and $80fde1,x
$0c:c43f  7f a0 14 5d   adc $5d14a0,x
$0c:c443  d4 83		 pei ($83)
$0c:c445  ff 21 ef e0   sbc $e0ef21,x
$0c:c449  6f f1 2f fc   adc $fc2ff1
$0c:c44d  47 de		 eor [$de]
$0c:c44f  1f f0 81 d8   ora $d881f0,x
$0c:c453  23 f4		 and $f4,s
$0c:c455  99 fd 8e	  sta $8efd,y
$0c:c458  3f 5a 9d 48   and $489d5a,x
$0c:c45c  63 c3		 adc $c3,s
$0c:c45e  fa			plx
$0c:c45f  82 8b 16	  brl $daed
$0c:c462  83 be		 sta $be,s
$0c:c464  91 7f		 sta ($7f),y
$0c:c466  e5 5d		 sbc $5d
$0c:c468  f8			sed
$0c:c469  af f6 81 41   lda $4181f6
$0c:c46d  b2 e7		 lda ($e7)
$0c:c46f  87 f1		 sta [$f1]
$0c:c471  02 ff		 cop #$ff
$0c:c473  ef 88 09 01   sbc $010988
$0c:c477  dd 40 3b	  cmp $3b40,x
$0c:c47a  f2 0e		 sbc ($0e)
$0c:c47c  f4 06 fd	  pea $fd06
$0c:c47f  01 f6		 ora ($f6,x)
$0c:c481  c4 bd		 cpy $bd
$0c:c483  d0 1f		 bne $c4a4
$0c:c485  ff fd 3c 03   sbc $033cfd,x
$0c:c489  fa			plx
$0c:c48a  da			phx
$0c:c48b  52 e7		 eor ($e7)
$0c:c48d  78			sei
$0c:c48e  59 67 4e	  eor $4e67,y
$0c:c491  f3 e7		 sbc ($e7,s),y
$0c:c493  ca			dex
$0c:c494  fe ed 3f	  inc $3fed,x
$0c:c497  f8			sed
$0c:c498  54 2d 2c	  mvn $2c,$2d
$0c:c49b  03 fa		 ora $fa,s
$0c:c49d  fa			plx
$0c:c49e  10 06		 bpl $c4a6
$0c:c4a0  81 bf		 sta ($bf,x)
$0c:c4a2  bf ff ed 30   lda $30edff,x
$0c:c4a6  09 0f 7b	  ora #$7b0f
$0c:c4a9  75 fe		 adc $fe,x
$0c:c4ab  d4 d5		 pei ($d5)
$0c:c4ad  b1 38		 lda ($38),y
$0c:c4af  0d e8 b8	  ora $b8e8
$0c:c4b2  40			rti
$0c:c4b3  00 40		 brk #$40
$0c:c4b5  6b			rtl
$0c:c4b6  f8			sed
$0c:c4b7  00 70		 brk #$70
$0c:c4b9  17 fd		 ora [$fd],y
$0c:c4bb  bd df 7d	  lda $7ddf,x
$0c:c4be  41 fd		 eor ($fd,x)
$0c:c4c0  41 92		 eor ($92,x)
$0c:c4c2  a1 f4		 lda ($f4,x)
$0c:c4c4  85 79		 sta $79
$0c:c4c6  a3 3d		 lda $3d,s
$0c:c4c8  99 3b 7c	  sta $7c3b,y
$0c:c4cb  21 0d		 and ($0d,x)
$0c:c4cd  f1 80		 sbc ($80),y
$0c:c4cf  80 95		 bra $c466
$0c:c4d1  be 10 3f	  ldx $3f10,y
$0c:c4d4  f4 ca 63	  pea $63ca
$0c:c4d7  bb			tyx
$0c:c4d8  a3 59		 lda $59,s
$0c:c4da  ff 1d 39 e6   sbc $e6391d,x
$0c:c4de  df d1 bb a6   cmp $a6bbd1,x
$0c:c4e2  73 ee		 adc ($ee,s),y
$0c:c4e4  8d f0 e7	  sta $e7f0
$0c:c4e7  02 8c		 cop #$8c
$0c:c4e9  44 c4 00	  mvp $00,$c4
$0c:c4ec  c1 df		 cmp ($df,x)
$0c:c4ee  af fc 0f 0d   lda $0d0ffc
$0c:c4f2  7f ff 50 bc   adc $bc50ff,x
$0c:c4f6  f5 a6		 sbc $a6,x
$0c:c4f8  f9 ce 14	  sbc $14ce,y
$0c:c4fb  b4 45		 ldy $45,x
$0c:c4fd  54 08 04	  mvn $04,$08
$0c:c500  42 01		 wdm #$01
$0c:c502  da			phx
$0c:c503  fd ba c3	  sbc $c3ba,x
$0c:c506  4d ff 8e	  eor $8eff
$0c:c509  d7 64		 cmp [$64],y
$0c:c50b  f6 8c		 inc $8c,x
$0c:c50d  0d 3a 2d	  ora $2d3a
$0c:c510  4f d0 fb 60   eor $60fbd0
$0c:c514  8e e0 6f	  stx $6fe0
$0c:c517  8e 8a 01	  stx $018a
$0c:c51a  90 80		 bcc $c49c
$0c:c51c  6c 0d 03	  jmp ($030d)
$0c:c51f  12 5f		 ora ($5f)
$0c:c521  88			dey
$0c:c522  3c 14 41	  bit $4114,x
$0c:c525  89 68 84	  bit #$8468
$0c:c528  02 da		 cop #$da
$0c:c52a  72 1e		 adc ($1e)
$0c:c52c  24 ec		 bit $ec
$0c:c52e  45 6e		 eor $6e
$0c:c530  03 e9		 ora $e9,s
$0c:c532  4b			phk
$0c:c533  4e e9 af	  lsr $afe9
$0c:c536  3b			tsc
$0c:c537  0d 07 7c	  ora $7c07
$0c:c53a  7f ec bd ff   adc $ffbdec,x
$0c:c53e  f1 06		 sbc ($06),y
$0c:c540  ad fe ba	  lda $bafe
$0c:c543  9d 2e 7c	  sta $7c2e,x
$0c:c546  ca			dex
$0c:c547  a9 d9 db	  lda #$dbd9
$0c:c54a  e4 af		 cpx $af
$0c:c54c  b3 30		 lda ($30,s),y
$0c:c54e  19 41 60	  ora $6041,y
$0c:c551  03 e0		 ora $e0,s
$0c:c553  86 c0		 stx $c0
$0c:c555  25 e7		 and $e7
$0c:c557  80 80		 bra $c4d9
$0c:c559  73 20		 adc ($20,s),y
$0c:c55b  1f e8 0f 4a   ora $4a0fe8,x
$0c:c55f  5f f8 82 de   eor $de82f8,x
$0c:c563  bf fe 08 ae   lda $ae08fe,x
$0c:c567  aa			tax
$0c:c568  eb			xba
$0c:c569  1a			inc a
$0c:c56a  eb			xba
$0c:c56b  e0 3e e8	  cpx #$e83e
$0c:c56e  b2 81		 lda ($81)
$0c:c570  22 c6 14 e6   jsl $e614c6
$0c:c574  19 40 00	  ora $0040,y
$0c:c577  e7 d0		 sbc [$d0]
$0c:c579  0a			asl a
$0c:c57a  8c ba c5	  sty $c5ba
$0c:c57d  3f b5 47 ea   and $ea47b5,x
$0c:c581  b3 d9		 lda ($d9,s),y
$0c:c583  85 c6		 sta $c6
$0c:c585  8a			txa
$0c:c586  f1 04		 sbc ($04),y
$0c:c588  78			sei
$0c:c589  00 16		 brk #$16
$0c:c58b  05 ff		 ora $ff
$0c:c58d  87 00		 sta [$00]
$0c:c58f  06 91		 asl $91
$0c:c591  37 a8		 and [$a8],y
$0c:c593  4b			phk
$0c:c594  e8			inx
$0c:c595  93 b9		 sta ($b9,s),y
$0c:c597  05 fe		 ora $fe
$0c:c599  45 5f		 eor $5f
$0c:c59b  83 df		 sta $df,s
$0c:c59d  eb			xba
$0c:c59e  73 bb		 adc ($bb,s),y
$0c:c5a0  04 7d		 tsb $7d
$0c:c5a2  ff 08 e0 82   sbc $82e008,x
$0c:c5a6  00 06		 brk #$06
$0c:c5a8  97 ff		 sta [$ff],y
$0c:c5aa  a2 6f a2	  ldx #$a26f
$0c:c5ad  7f fb 37 fb   adc $fb37fb,x
$0c:c5b1  35 fe		 and $fe,x
$0c:c5b3  b7 7f		 lda [$7f],y
$0c:c5b5  a1 30		 lda ($30,x)
$0c:c5b7  99 0f 79	  sta $790f,y
$0c:c5ba  1c 10 10	  trb $1010
$0c:c5bd  00 90		 brk #$90
$0c:c5bf  40			rti
$0c:c5c0  8a			txa
$0c:c5c1  5f 60 01 3c   eor $3c0160,x
$0c:c5c5  06 ab		 asl $ab
$0c:c5c7  0a			asl a
$0c:c5c8  b1 47		 lda ($47),y
$0c:c5ca  e5 51		 sbc $51
$0c:c5cc  fa			plx
$0c:c5cd  04 f6		 tsb $f6
$0c:c5cf  cd 1f 86	  cmp $861f
$0c:c5d2  cf 1f f4 07   cmp $07f41f
$0c:c5d6  22 c8 58 e3   jsl $e358c8
$0c:c5da  d5 99		 cmp $99,x
$0c:c5dc  a5 12		 lda $12
$0c:c5de  7b			tdc
$0c:c5df  48			pha
$0c:c5e0  9e d1 67	  stz $67d1,x
$0c:c5e3  b5 89		 lda $89,x
$0c:c5e5  cc 96 3c	  cpy $3c96
$0c:c5e8  69 44 1a	  adc #$1a44
$0c:c5eb  41 80		 eor ($80,x)
$0c:c5ed  03 b4		 ora $b4,s
$0c:c5ef  a5 ee		 lda $ee
$0c:c5f1  e0 be c8	  cpx #$c8be
$0c:c5f4  9e 66 cf	  stz $cf66,x
$0c:c5f7  65 cd		 adc $cd
$0c:c5f9  e4 6d		 cpx $6d
$0c:c5fb  e4 b0		 cpx $b0
$0c:c5fd  1f 00 7e 9f   ora $9f7e00,x
$0c:c601  e5 82		 sbc $82
$0c:c603  be ce ff	  ldx $ffce,y
$0c:c606  f8			sed
$0c:c607  9c 47 93	  stz $9347
$0c:c60a  37 5b		 and [$5b],y
$0c:c60c  9f f9 b2 3c   sta $3cb2f9,x
$0c:c610  4e 24 74	  lsr $7424
$0c:c613  9c 2e e0	  stz $e02e
$0c:c616  bb			tyx
$0c:c617  b0 85		 bcs $c59e
$0c:c619  bc 17 f8	  ldy $f817,x
$0c:c61c  04 ed		 tsb $ed
$0c:c61e  dc 32 0e	  jml [$0e32]
$0c:c621  fe df ff	  inc $ffdf,x
$0c:c624  49 a0 70	  eor #$70a0
$0c:c627  37 d3		 and [$d3],y
$0c:c629  bb			tyx
$0c:c62a  ff 42 5d c5   sbc $c55d42,x
$0c:c62e  a0 76 d7	  ldy #$d776
$0c:c631  c7 bf		 cmp [$bf]
$0c:c633  64 0f		 stz $0f
$0c:c635  f8			sed
$0c:c636  9a			txs
$0c:c637  2e 30 66	  rol $6630
$0c:c63a  07 da		 ora [$da]
$0c:c63c  1d eb 8e	  ora $8eeb,x
$0c:c63f  6f a8 3f 59   adc $593fa8
$0c:c643  5b			tcd
$0c:c644  cc 3f 30	  cpy $303f
$0c:c647  7f 14 7b b3   adc $b37b14,x
$0c:c64b  2a			rol a
$0c:c64c  80 af		 bra $c5fd
$0c:c64e  c8			iny
$0c:c64f  00 af		 brk #$af
$0c:c651  f0 82		 beq $c5d5
$0c:c653  40			rti
$0c:c654  2c ff 8e	  bit $8eff
$0c:c657  9c d3 2b	  stz $2bd3
$0c:c65a  ee 95 cf	  inc $cf95
$0c:c65d  36 b4		 rol $b4,x
$0c:c65f  ec 6d cb	  cpx $cb6d
$0c:c662  cf 78 ee ce   cmp $ceee78
$0c:c666  99 81 08	  sta $0881,y
$0c:c669  66 0f		 ror $0f
$0c:c66b  00 00		 brk #$00
$0c:c66d  fe 4a ff	  inc $ff4a,x
$0c:c670  ca			dex
$0c:c671  b3 53		 lda ($53,s),y
$0c:c673  fc fd 6b	  jsr ($6bfd,x)
$0c:c676  fe 1a 5d	  inc $5d1a,x
$0c:c679  c3 b7		 cmp $b7,s
$0c:c67b  37 ce		 and [$ce],y
$0c:c67d  f0 e5		 beq $c664
$0c:c67f  ac c0 06	  ldy $06c0
$0c:c682  80 34		 bra $c6b8
$0c:c684  19 81 14	  ora $1481,y
$0c:c687  06 0d		 asl $0d
$0c:c689  02 01		 cop #$01
$0c:c68b  10 80		 bpl $c60d
$0c:c68d  4a			lsr a
$0c:c68e  7c f8 6e	  jmp ($6ef8,x)
$0c:c691  76 d3		 ror $d3,x
$0c:c693  d9 0d a6	  cmp $a60d,y
$0c:c696  65 f9		 adc $f9
$0c:c698  d3 5b		 cmp ($5b,s),y
$0c:c69a  65 16		 adc $16
$0c:c69c  59 2f aa	  eor $aa2f,y
$0c:c69f  13 42		 ora ($42,s),y
$0c:c6a1  63 00		 adc $00,s
$0c:c6a3  89 c0 36	  bit #$36c0
$0c:c6a6  66 01		 ror $01
$0c:c6a8  c9 9a 07	  cmp #$079a
$0c:c6ab  07 00		 ora [$00]
$0c:c6ad  cb			wai
$0c:c6ae  df db c1 5b   cmp $5bc1db,x
$0c:c6b2  ff 74 fa 5e   sbc $5efa74,x
$0c:c6b6  f8			sed
$0c:c6b7  87 02		 sta [$02]
$0c:c6b9  7f b7 bf d1   adc $d1bfb7,x
$0c:c6bd  38			sec
$0c:c6be  80 04		 bra $c6c4
$0c:c6c0  96 00		 stx $00,y
$0c:c6c2  15 96		 ora $96,x
$0c:c6c4  15 ab		 ora $ab,x
$0c:c6c6  db			stp
$0c:c6c7  78			sei
$0c:c6c8  24 df		 bit $df
$0c:c6ca  fa			plx
$0c:c6cb  ef 77 6f 48   sbc $486f77
$0c:c6cf  80 ff		 bra $c6d0
$0c:c6d1  be df fb	  ldx $fbdf,y
$0c:c6d4  2d 97 08	  and $0897
$0c:c6d7  00 39		 brk #$39
$0c:c6d9  10 01		 bpl $c6dc
$0c:c6db  73 50		 adc ($50,s),y
$0c:c6dd  09 5c cf	  ora #$cf5c
$0c:c6e0  bd 12 ee	  lda $ee12,x
$0c:c6e3  c4 28		 cpy $28
$0c:c6e5  79 ac f4	  adc $f4ac,y
$0c:c6e8  4b			phk
$0c:c6e9  ef 3a ec c4   sbc $c4ec3a
$0c:c6ed  ab			plb
$0c:c6ee  39 ee 64	  and $64ee,y
$0c:c6f1  03 db		 ora $db,s
$0c:c6f3  00 f7		 brk #$f7
$0c:c6f5  b0 05		 bcs $c6fc
$0c:c6f7  82 1c d6	  brl $9d16
$0c:c6fa  00 f8		 brk #$f8
$0c:c6fc  60			rts
$0c:c6fd  18			clc
$0c:c6fe  0e ee a3	  asl $a3ee
$0c:c701  bb			tyx
$0c:c702  70 aa		 bvs $c6ae
$0c:c704  de aa f0	  dec $f0aa,x
$0c:c707  0b			phd
$0c:c708  ad aa ab	  lda $abaa
$0c:c70b  da			phx
$0c:c70c  eb			xba
$0c:c70d  d0 2e		 bne $c73d
$0c:c70f  ea			nop
$0c:c710  50 52		 bvc $c764
$0c:c712  86 aa		 stx $aa
$0c:c714  01 a8		 ora ($a8,x)
$0c:c716  71 0b		 adc ($0b),y
$0c:c718  8c 25 10	  sty $1025
$0c:c71b  0c 43 20	  tsb $2043
$0c:c71e  26 56		 rol $56
$0c:c720  5c c5 26 6d   jml $6d26c5
$0c:c724  03 fe		 ora $fe,s
$0c:c726  e7 2c		 sbc [$2c]
$0c:c728  72 fe		 adc ($fe)
$0c:c72a  84 b7		 sty $b7
$0c:c72c  81 9e		 sta ($9e,x)
$0c:c72e  b0 f7		 bcs $c727
$0c:c730  d8			cld
$0c:c731  42 c3		 wdm #$c3
$0c:c733  0e 1c 02	  asl $021c
$0c:c736  39 00 9f	  and $9f00,y
$0c:c739  82 07 7e	  brl $4543
$0c:c73c  c8			iny
$0c:c73d  09 86 7e	  ora #$7e86
$0c:c740  c1 d7		 cmp ($d7,x)
$0c:c742  b4 4d		 ldy $4d,x
$0c:c744  f8			sed
$0c:c745  11 df		 ora ($df),y
$0c:c747  1e 32 ff	  asl $ff32,x
$0c:c74a  c7 9c		 cmp [$9c]
$0c:c74c  67 6c		 adc [$6c]
$0c:c74e  4c 30 7f	  jmp $7f30
$0c:c751  83 fc		 sta $fc,s
$0c:c753  01 a0		 ora ($a0,x)
$0c:c755  09 0c e0	  ora #$e00c
$0c:c758  10 5f		 bpl $c7b9
$0c:c75a  e1 32		 sbc ($32,x)
$0c:c75c  56 04		 lsr $04,x
$0c:c75e  0b			phd
$0c:c75f  6d 80 fe	  adc $fe80
$0c:c762  40			rti
$0c:c763  7c 70 0e	  jmp ($0e70,x)
$0c:c766  84 03		 sty $03
$0c:c768  a5 12		 lda $12
$0c:c76a  b0 88		 bcs $c6f4
$0c:c76c  05 82		 ora $82
$0c:c76e  16 f0		 asl $f0,x
$0c:c770  22 cb 41 83   jsl $8341cb
$0c:c774  32 81		 and ($81)
$0c:c776  58			cli
$0c:c777  1d 41 40	  ora $4041,x
$0c:c77a  e4 42		 cpx $42
$0c:c77c  3c 50 1b	  bit $1b50,x
$0c:c77f  bc 22 79	  ldy $7922,x
$0c:c782  00 b1		 brk #$b1
$0c:c784  30 04		 bmi $c78a
$0c:c786  42 5b		 wdm #$5b
$0c:c788  71 33		 adc ($33),y
$0c:c78a  d0 60		 bne $c7ec
$0c:c78c  3e 87 50	  rol $5087,x
$0c:c78f  72 26		 adc ($26)
$0c:c791  9c 5f e4	  stz $e45f
$0c:c794  09 2e 1a	  ora #$1a2e
$0c:c797  48			pha
$0c:c798  c7 32		 cmp [$32]
$0c:c79a  65 be		 adc $be
$0c:c79c  06 09		 asl $09
$0c:c79e  94 23		 sty $23,x
$0c:c7a0  6c 21 f8	  jmp ($f821)
$0c:c7a3  40			rti
$0c:c7a4  3e ec 21	  rol $21ec,x
$0c:c7a7  c2 7f		 rep #$7f
$0c:c7a9  eb			xba
$0c:c7aa  79 f9 3e	  adc $3ef9,y
$0c:c7ad  1e 35 85	  asl $8535,x
$0c:c7b0  a9 f3 e8	  lda #$e8f3
$0c:c7b3  fc f8 a6	  jsr ($a6f8,x)
$0c:c7b6  3e 8b ce	  rol $ce8b,x
$0c:c7b9  80 40		 bra $c7fb
$0c:c7bb  0a			asl a
$0c:c7bc  21 78		 and ($78,x)
$0c:c7be  80 5f		 bra $c81f
$0c:c7c0  c1 42		 cmp ($42,x)
$0c:c7c2  0b			phd
$0c:c7c3  05 29		 ora $29
$0c:c7c5  68			pla
$0c:c7c6  2f f5 ff fd   and $fdfff5
$0c:c7ca  f7 fb		 sbc [$fb],y
$0c:c7cc  52 96		 eor ($96)
$0c:c7ce  ee d6 03	  inc $03d6
$0c:c7d1  80 bf		 bra $c792
$0c:c7d3  ca			dex
$0c:c7d4  53 e0		 eor ($e0,s),y
$0c:c7d6  be 18 14	  ldx $1418,y
$0c:c7d9  03 fe		 ora $fe,s
$0c:c7db  c4 7c		 cpy $7c
$0c:c7dd  95 fa		 sta $fa,x
$0c:c7df  d7 e9		 cmp [$e9],y
$0c:c7e1  9f ec 6b 32   sta $326bec,x
$0c:c7e5  5a			phy
$0c:c7e6  af e7 e5 78   lda $78e5e7
$0c:c7ea  ca			dex
$0c:c7eb  de eb d3	  dec $d3eb,x
$0c:c7ee  08			php
$0c:c7ef  0c 02 2d	  tsb $2d02
$0c:c7f2  00 a7		 brk #$a7
$0c:c7f4  40			rti
$0c:c7f5  3f ce 41 62   and $6241ce,x
$0c:c7f9  83 9c		 sta $9c,s
$0c:c7fb  ba			tsx
$0c:c7fc  73 cd		 adc ($cd,s),y
$0c:c7fe  55 93		 eor $93,x
$0c:c800  63 54		 adc $54,s
$0c:c802  f0 4d		 beq $c851
$0c:c804  3d 31 cf	  and $cf31,x
$0c:c807  55 5b		 eor $5b,x
$0c:c809  e9 57 dd	  sbc #$dd57
$0c:c80c  56 53		 lsr $53,x
$0c:c80e  e0 85 08	  cpx #$0885
$0c:c811  58			cli
$0c:c812  08			php
$0c:c813  60			rts
$0c:c814  70 06		 bvs $c81c
$0c:c816  f8			sed
$0c:c817  42 20		 wdm #$20
$0c:c819  10 78		 bpl $c893
$0c:c81b  04 17		 tsb $17
$0c:c81d  ed ad cb	  sbc $cbad
$0c:c820  51 7a		 eor ($7a),y
$0c:c822  d8			cld
$0c:c823  7a			ply
$0c:c824  a7 26		 lda [$26]
$0c:c826  3d ab 9d	  and $9dab,x
$0c:c829  4a			lsr a
$0c:c82a  7c 59 5f	  jmp ($5f59,x)
$0c:c82d  30 2c		 bmi $c85b
$0c:c82f  2d 10 03	  and $0310
$0c:c832  88			dey
$0c:c833  1c 43 c1	  trb $c143
$0c:c836  00 e2		 brk #$e2
$0c:c838  11 85		 ora ($85),y
$0c:c83a  46 1b		 lsr $1b
$0c:c83c  8a			txa
$0c:c83d  bc 9b 9b	  ldy $9b9b,x
$0c:c840  e3 a4		 sbc $a4,s
$0c:c842  e5 ef		 sbc $ef
$0c:c844  b6 1e		 ldx $1e,y
$0c:c846  5f 86 97 33   eor $339786,x
$0c:c84a  ec fc 29	  cpx $29fc
$0c:c84d  69 f0 88	  adc #$88f0
$0c:c850  40			rti
$0c:c851  22 8b e1 21   jsl $21e18b
$0c:c855  81 0c		 sta ($0c,x)
$0c:c857  20 84 a1	  jsr $a184
$0c:c85a  ea			nop
$0c:c85b  cf 25 b6 cc   cmp $ccb625
$0c:c85f  af 32 4b 6c   lda $6c4b32
$0c:c863  97 db		 sta [$db],y
$0c:c865  b0 b4		 bcs $c81b
$0c:c867  c8			iny
$0c:c868  ed 13 45	  sbc $4513
$0c:c86b  ee c1 c0	  inc $c0c1
$0c:c86e  32 70		 and ($70)
$0c:c870  09 99 80	  ora #$8099
$0c:c873  72 30		 adc ($30)
$0c:c875  0d 99 a0	  ora $a099
$0c:c878  62 30 0a	  per $d2ab
$0c:c87b  a4 ee		 ldy $ee
$0c:c87d  49 5f c4	  eor #$c45f
$0c:c880  fd a5 31	  sbc $31a5,x
$0c:c883  ff 26 6f 7b   sbc $7b6f26,x
$0c:c887  80 b5		 bra $c83e
$0c:c889  7a			ply
$0c:c88a  fb			xce
$0c:c88b  7f d6 29 5f   adc $5f29d6,x
$0c:c88f  d0 06		 bne $c897
$0c:c891  83 02		 sta $02,s
$0c:c893  18			clc
$0c:c894  39 43 af	  and $af43,y
$0c:c897  3a			dec a
$0c:c898  93 77		 sta ($77,s),y
$0c:c89a  e1 3f		 sbc ($3f,x)
$0c:c89c  7a			ply
$0c:c89d  46 fe		 lsr $fe
$0c:c89f  83 fe		 sta $fe,s
$0c:c8a1  db			stp
$0c:c8a2  19 83 23	  ora $2383,y
$0c:c8a5  4d 9f 9f	  eor $9f9f
$0c:c8a8  c9 3e d6	  cmp #$d63e
$0c:c8ab  e6 20		 inc $20
$0c:c8ad  de f6 5f	  dec $5ff6,x
$0c:c8b0  f9 97 4e	  sbc $4e97,y
$0c:c8b3  35 4c		 and $4c,x
$0c:c8b5  c1 67		 cmp ($67,x)
$0c:c8b7  e2 55		 sep #$55
$0c:c8b9  4c cd df	  jmp $dfcd
$0c:c8bc  65 6d		 adc $6d
$0c:c8be  b9 f3 60	  lda $60f3,y
$0c:c8c1  0b			phd
$0c:c8c2  f0 f6		 beq $c8ba
$0c:c8c4  c0 3f		 cpy #$3f
$0c:c8c6  ac 21 f7	  ldy $f721
$0c:c8c9  b0 07		 bcs $c8d2
$0c:c8cb  19 00 95	  ora $9500,y
$0c:c8ce  5d ea 15	  eor $15ea,x
$0c:c8d1  5f d7 5e 59   eor $595ed7,x
$0c:c8d5  55 84		 eor $84,x
$0c:c8d7  55 6d		 eor $6d,x
$0c:c8d9  55 7f		 eor $7f,x
$0c:c8db  a7 56		 lda [$56]
$0c:c8dd  11 dd		 ora ($dd),y
$0c:c8df  c4 40		 cpy $40
$0c:c8e1  35 50		 and $50,x
$0c:c8e3  09 43 80	  ora #$8043
$0c:c8e6  5c 21 a8 67   jml $67a821
$0c:c8ea  04 02		 tsb $02
$0c:c8ec  45 00		 eor $00
$0c:c8ee  df 50 3a f2   cmp $f23a50,x
$0c:c8f2  88			dey
$0c:c8f3  bf 82 17 f1   lda $f11782,x
$0c:c8f7  f3 c7		 sbc ($c7,s),y
$0c:c8f9  b6 14		 ldx $14,y
$0c:c8fb  fd 3c 63	  sbc $633c,x
$0c:c8fe  9b			txy
$0c:c8ff  32 df		 and ($df)
$0c:c901  c0 1f		 cpy #$1f
$0c:c903  e5 1f		 sbc $1f
$0c:c905  64 04		 stz $04
$0c:c907  0b			phd
$0c:c908  e1 00		 sbc ($00,x)
$0c:c90a  fb			xce
$0c:c90b  b2 07		 lda ($07)
$0c:c90d  5b			tcd
$0c:c90e  50 97		 bvc $c8a7
$0c:c910  f0 3f		 beq $c951
$0c:c912  78			sei
$0c:c913  4b			phk
$0c:c914  ce 0e 69	  dec $690e
$0c:c917  cf 89 ff 31   cmp $31ff89
$0c:c91b  d7 1e		 cmp [$1e],y
$0c:c91d  f4 83 be	  pea $be83
$0c:c920  00 34		 brk #$34
$0c:c922  38			sec
$0c:c923  5f 0c 43 0f   eor $0f430c,x
$0c:c927  80 67		 bra $c990
$0c:c929  e0 14		 cpx #$14
$0c:c92b  18			clc
$0c:c92c  0d a2 01	  ora $01a2
$0c:c92f  e8			inx
$0c:c930  84 7d		 sty $7d
$0c:c932  20 b1 c8	  jsr $c8b1
$0c:c935  15 3e		 ora $3e,x
$0c:c937  01 58		 ora ($58,x)
$0c:c939  a0 4c		 ldy #$4c
$0c:c93b  9d c0 02	  sta $02c0,x
$0c:c93e  1d bc 02	  ora $02bc,x
$0c:c941  36 c8		 rol $c8,x
$0c:c943  10 48		 bpl $c98d
$0c:c945  10 c1		 bpl $c908
$0c:c947  92 17		 sta ($17)
$0c:c949  28			plp
$0c:c94a  17 42		 ora [$42],y
$0c:c94c  21 44		 and ($44,x)
$0c:c94e  c0 61		 cpy #$61
$0c:c950  a0 bc		 ldy #$bc
$0c:c952  b8			clv
$0c:c953  27 f2		 and [$f2]
$0c:c955  01 f1		 ora ($f1,x)
$0c:c957  80 58		 bra $c9b1
$0c:c959  60			rts
$0c:c95a  3d d8 06	  and $06d8,x
$0c:c95d  bc 04 37	  ldy $3704,x
$0c:c960  b1 32		 lda ($32),y
$0c:c962  e7 a0		 sbc [$a0]
$0c:c964  15 3d		 ora $3d,x
$0c:c966  1d d7 f3	  ora $f3d7,x
$0c:c969  f7 fc		 sbc [$fc],y
$0c:c96b  f8			sed
$0c:c96c  7f bf 5f cf   adc $cf5fbf,x
$0c:c970  4b			phk
$0c:c971  f1 f5		 sbc ($f5),y
$0c:c973  fd ff be	  sbc $beff,x
$0c:c976  05 90		 ora $90
$0c:c978  ff 20 15 4e   sbc $4e1520,x
$0c:c97c  08			php
$0c:c97d  72 a1		 adc ($a1)
$0c:c97f  f3 e8		 sbc ($e8,s),y
$0c:c981  fc f9 36	  jsr ($36f9,x)
$0c:c984  be d5 e5	  ldx $e5d5,y
$0c:c987  ba			tsx
$0c:c988  7a			ply
$0c:c989  e8			inx
$0c:c98a  9d fb 07	  sta $07fb,x
$0c:c98d  7e 61 80	  ror $8061,x
$0c:c990  9f c0 13 e1   sta $e113c0,x
$0c:c994  5f 02 08 14   eor $140802,x
$0c:c998  13 e4		 ora ($e4,s),y
$0c:c99a  25 0e		 and $0e
$0c:c99c  dd fe ff	  cmp $fffe,x
$0c:c99f  ff f7 df eb   sbc $ebdff7,x
$0c:c9a3  b3 2c		 lda ($2c,s),y
$0c:c9a5  15 fe		 ora $fe,x
$0c:c9a7  09 7b 82	  ora #$827b
$0c:c9aa  5f f5 98 04   eor $0498f5,x
$0c:c9ae  48			pha
$0c:c9af  2f e8 4a 1f   and $1f4ae8
$0c:c9b3  6b			rtl
$0c:c9b4  c4 df		 cpy $df
$0c:c9b6  f3 73		 sbc ($73,s),y
$0c:c9b8  fc ef ab	  jsr ($abef,x)
$0c:c9bb  14 ab		 trb $ab
$0c:c9bd  e4 1e		 cpx $1e
$0c:c9bf  fb			xce
$0c:c9c0  14 b7		 trb $b7
$0c:c9c2  49 e0 28	  eor #$28e0
$0c:c9c5  92 43		 sta ($43)
$0c:c9c7  92 25		 sta ($25)
$0c:c9c9  10 21		 bpl $c9ec
$0c:c9cb  e9 8c 68	  sbc #$688c
$0c:c9ce  ab			plb
$0c:c9cf  1f 49 66 46   ora $466649,x
$0c:c9d3  ef 99 be 72   sbc $72be99
$0c:c9d7  27 9e		 and [$9e]
$0c:c9d9  f8			sed
$0c:c9da  d7 b6		 cmp [$b6],y
$0c:c9dc  a7 07		 lda [$07]
$0c:c9de  80 3f		 bra $ca1f
$0c:c9e0  c2 07		 rep #$07
$0c:c9e2  00 84		 brk #$84
$0c:c9e4  00 84		 brk #$84
$0c:c9e6  06 10		 asl $10
$0c:c9e8  18			clc
$0c:c9e9  00 30		 brk #$30
$0c:c9eb  35 bc		 and $bc,x
$0c:c9ed  6f 1e 1a a7   adc $a71a1e
$0c:c9f1  9a			txs
$0c:c9f2  b7 fd		 lda [$fd],y
$0c:c9f4  aa			tax
$0c:c9f5  33 2d		 and ($2d,s),y
$0c:c9f7  bd 52 93	  lda $9352,x
$0c:c9fa  1e d5 ee	  asl $eed5,x
$0c:c9fd  af 10 00 f8   lda $f80010
$0c:ca01  59 00 83	  eor $8300,y
$0c:ca04  ec 80 7a	  cpx $7a80
$0c:ca07  20 1e 08	  jsr $081e
$0c:ca0a  05 12		 ora $12
$0c:ca0c  01 e4		 ora ($e4,x)
$0c:ca0e  fc 6d ff	  jsr ($ff6d,x)
$0c:ca11  3f 3f cc fb   and $fbcc3f,x
$0c:ca15  b1 4a		 lda ($4a),y
$0c:ca17  fe 61 ef	  inc $ef61,x
$0c:ca1a  b9 4f 75	  lda $754f,y
$0c:ca1d  97 36		 sta [$36],y
$0c:ca1f  df e9 4f 9f   cmp $9f4fe9,x
$0c:ca23  0f ce da 7b   ora $7bdace
$0c:ca27  61 f4		 adc ($f4,x)
$0c:ca29  cc 87 2e	  cpy $2e87
$0c:ca2c  6b			rtl
$0c:ca2d  6a			ror a
$0c:ca2e  96 5b		 stx $5b,y
$0c:ca30  2b			pld
$0c:ca31  33 78		 and ($78,s),y
$0c:ca33  84 02		 sty $02
$0c:ca35  63 00		 adc $00,s
$0c:ca37  89 c0 36	  bit #$36c0
$0c:ca3a  70 09		 bvs $ca45
$0c:ca3c  bc 03 2f	  ldy $2f03,x
$0c:ca3f  00 c9		 brk #$c9
$0c:ca41  c0 31		 cpy #$31
$0c:ca43  f0 09		 beq $ca4e
$0c:ca45  27 fa		 and [$fa]
$0c:ca47  93 b7		 sta ($b7,s),y
$0c:ca49  cd db 66	  cmp $66db
$0c:ca4c  90 1f		 bcc $ca6d
$0c:ca4e  a7 de		 lda [$de]
$0c:ca50  37 bf		 and [$bf],y
$0c:ca52  f4 65 f4	  pea $f465
$0c:ca55  b8			clv
$0c:ca56  86 fa		 stx $fa
$0c:ca58  3b			tsc
$0c:ca59  40			rti
$0c:ca5a  0a			asl a
$0c:ca5b  0a			asl a
$0c:ca5c  d0 44		 bne $caa2
$0c:ca5e  96 92		 stx $92,y
$0c:ca60  b7 c4		 lda [$c4],y
$0c:ca62  9f dc a1 b9   sta $b9a1dc,x
$0c:ca66  bc 06 cf	  ldy $cf06,x
$0c:ca69  e7 7b		 sbc [$7b]
$0c:ca6b  fe 8e c2	  inc $c28e,x
$0c:ca6e  a1 be		 lda ($be,x)
$0c:ca70  64 93		 stz $93
$0c:ca72  2c a1 84	  bit $84a1
$0c:ca75  25 d5		 and $d5
$0c:ca77  cc eb d1	  cpy $d1eb
$0c:ca7a  2a			rol a
$0c:ca7b  ed 43 47	  sbc $4743
$0c:ca7e  5a			phy
$0c:ca7f  8c 5c be	  sty $be5c
$0c:ca82  b9 6e cf	  lda $cf6e,y
$0c:ca85  7b			tdc
$0c:ca86  ab			plb
$0c:ca87  e6 e6		 inc $e6
$0c:ca89  40			rti
$0c:ca8a  3d b0 0f	  and $0fb0,x
$0c:ca8d  7b			tdc
$0c:ca8e  00 58		 brk #$58
$0c:ca90  21 69		 and ($69,x)
$0c:ca92  80 48		 bra $cadc
$0c:ca94  60			rts
$0c:ca95  1f 98 04 4b   ora $4b0498,x
$0c:ca99  fd eb f4	  sbc $f4eb,x
$0c:ca9c  ef f6 35 9d   sbc $9d35f6
$0c:caa0  2d d7 f3	  and $f3d7
$0c:caa3  d2 fc		 cmp ($fc)
$0c:caa5  7d 7f 7e	  adc $7e7f,x
$0c:caa8  6f c0 2c 22   adc $222cc0
$0c:caac  d0 0a		 bne $cab8
$0c:caae  71 01		 adc ($01),y
$0c:cab0  48			pha
$0c:cab1  65 54		 adc $54
$0c:cab3  ef d2 b6 79   sbc $79b6d2
$0c:cab7  ed bc 6b	  sbc $6bbc
$0c:caba  67 42		 adc [$42]
$0c:cabc  d9 fa 32	  cmp $32fa,y
$0c:cabf  2f 50 cb 6c   and $6ccb50
$0c:cac3  e4 10		 cpx $10
$0c:cac5  0b			phd
$0c:cac6  e0 80		 cpx #$80
$0c:cac8  40			rti
$0c:cac9  20 01 0b	  jsr $0b01
$0c:cacc  f0 10		 beq $cade
$0c:cace  f5 77		 sbc $77,x
$0c:cad0  4d ac 1a	  eor $1aac
$0c:cad3  c3 d6		 cmp $d6,s
$0c:cad5  f2 d5		 sbc ($d5)
$0c:cad7  b7 b0		 lda [$b0],y
$0c:cad9  e8			inx
$0c:cada  be 18 2a	  ldx $2a18,y
$0c:cadd  16 9e		 asl $9e,x
$0c:cadf  d4 00		 pei ($00)
$0c:cae1  04 33		 tsb $33
$0c:cae3  81 10		 sta ($10,x)
$0c:cae5  dc 04 07	  jml [$0704]
$0c:cae8  34 80		 bit $80,x
$0c:caea  6a			ror a
$0c:caeb  72 fd		 adc ($fd)
$0c:caed  0c 7e 57	  tsb $577e
$0c:caf0  55 2d		 eor $2d,x
$0c:caf2  c8			iny
$0c:caf3  ea			nop
$0c:caf4  30 54		 bmi $cb4a
$0c:caf6  ee 6c 63	  inc $636c
$0c:caf9  f7 0a		 sbc [$0a],y
$0c:cafb  b0 a9		 bcs $caa6
$0c:cafd  40			rti
$0c:cafe  7e 40 90	  ror $9040,x
$0c:cb01  be c0 26	  ldx $26c0,y
$0c:cb04  70 08		 bvs $cb0e
$0c:cb06  3b			tsc
$0c:cb07  b0 75		 bcs $cb7e
$0c:cb09  2b			pld
$0c:cb0a  c0 8b		 cpy #$8b
$0c:cb0c  d2 ec		 cmp ($ec)
$0c:cb0e  d7 4e		 cmp [$4e],y
$0c:cb10  de a2 6f	  dec $6fa2,x
$0c:cb13  f3 d6		 sbc ($d6,s),y
$0c:cb15  56 ba		 lsr $ba,x
$0c:cb17  5a			phy
$0c:cb18  8a			txa
$0c:cb19  f9 fc 3d	  sbc $3dfc,y
$0c:cb1c  10 0c		 bpl $cb2a
$0c:cb1e  fc 02 7f	  jsr ($7f02,x)
$0c:cb21  00 ef		 brk #$ef
$0c:cb23  99 85 8e	  sta $8e85,y
$0c:cb26  1e 07 70	  asl $7007,x
$0c:cb29  4e fd 9e	  lsr $9efd
$0c:cb2c  7f 2e d2 5b   adc $5bd22e,x
$0c:cb30  19 e1 6f	  ora $6fe1,y
$0c:cb33  b4 99		 ldy $99,x
$0c:cb35  9b			txy
$0c:cb36  77 96		 adc [$96],y
$0c:cb38  21 fb		 and ($fb,x)
$0c:cb3a  2f 84 7e 01   and $017e84
$0c:cb3e  7b			tdc
$0c:cb3f  72 09		 adc ($09)
$0c:cb41  1c 14 a1	  trb $a114
$0c:cb44  1b			tcs
$0c:cb45  25 0f		 and $0f
$0c:cb47  5e 75 26	  lsr $2675,x
$0c:cb4a  ef c2 7e f6   sbc $f67ec2
$0c:cb4e  88			dey
$0c:cb4f  fe 07 7d	  inc $7d07,x
$0c:cb52  b6 90		 ldx $90,y
$0c:cb54  74 72		 stz $72,x
$0c:cb56  3a			dec a
$0c:cb57  da			phx
$0c:cb58  d9 7c 13	  cmp $137c,y
$0c:cb5b  e8			inx
$0c:cb5c  3f 03 38 7b   and $7b3803,x
$0c:cb60  a0 1e		 ldy #$1e
$0c:cb62  78			sei
$0c:cb63  05 43		 ora $43
$0c:cb65  81 28		 sta ($28,x)
$0c:cb67  dc 67 3f	  jml [$3f67]
$0c:cb6a  fe 4c a4	  inc $a44c,x
$0c:cb6d  6b			rtl
$0c:cb6e  13 55		 ora ($55,s),y
$0c:cb70  f9 45 2e	  sbc $2e45,y
$0c:cb73  76 bc		 ror $bc,x
$0c:cb75  38			sec
$0c:cb76  8c 28 02	  sty $0228
$0c:cb79  61 41		 adc ($41,x)
$0c:cb7b  85 de		 sta $de
$0c:cb7d  01 0f		 ora ($0f,x)
$0c:cb7f  52 1b		 eor ($1b)
$0c:cb81  38			sec
$0c:cb82  b4 df		 ldy $df,x
$0c:cb84  fc 4c 07	  jsr ($074c,x)
$0c:cb87  75 44		 adc $44,x
$0c:cb89  a0 ef		 ldy #$ef
$0c:cb8b  a4 bd		 ldy $bd
$0c:cb8d  af 61 7c 19   lda $197c61
$0c:cb91  c6 85		 dec $85
$0c:cb93  04 fb		 tsb $fb
$0c:cb95  6d 2a fb	  adc $fb2a
$0c:cb98  aa			tax
$0c:cb99  cf 86 31 ee   cmp $ee3186
$0c:cb9d  8e 6d 2d	  stx $2d6d
$0c:cba0  93 9e		 sta ($9e,s),y
$0c:cba2  fd 33 71	  sbc $7133,x
$0c:cba5  2f ed 42 09   and $0942ed
$0c:cba9  42 4b		 wdm #$4b
$0c:cbab  08			php
$0c:cbac  18			clc
$0c:cbad  10 43		 bpl $cbf2
$0c:cbaf  e0 05		 cpx #$05
$0c:cbb1  08			php
$0c:cbb2  0c 02 5b	  tsb $5b02
$0c:cbb5  e6 cb		 inc $cb
$0c:cbb7  f9 3e 78	  sbc $783e,y
$0c:cbba  4d 6e 2a	  eor $2a6e
$0c:cbbd  b3 92		 lda ($92,s),y
$0c:cbbf  e2 5d		 sep #$5d
$0c:cbc1  f8			sed
$0c:cbc2  d1 5a		 cmp ($5a),y
$0c:cbc4  c5 3e		 cmp $3e
$0c:cbc6  31 00		 and ($00),y
$0c:cbc8  bc 08 05	  ldy $0508,x
$0c:cbcb  86 16		 stx $16
$0c:cbcd  48			pha
$0c:cbce  03 fc		 ora $fc,s
$0c:cbd0  0c 21 a0	  tsb $a021
$0c:cbd3  80 6e		 bra $cc43
$0c:cbd5  6a			ror a
$0c:cbd6  f2 6e		 sbc ($6e)
$0c:cbd8  6f 8e 93 97   adc $97938e
$0c:cbdc  be d8 79	  ldx $79d8,y
$0c:cbdf  7e 1a 5c	  ror $5c1a,x
$0c:cbe2  cf b3 f0 a5   cmp $a5f0b3
$0c:cbe6  82 42 21	  brl $ed2b
$0c:cbe9  00 8a		 brk #$8a
$0c:cbeb  33 84		 and ($84,s),y
$0c:cbed  86 04		 stx $04
$0c:cbef  30 82		 bmi $cb73
$0c:cbf1  12 87		 ora ($87)
$0c:cbf3  69 7b 9a	  adc #$9a7b
$0c:cbf6  5b			tcd
$0c:cbf7  f5 1f		 sbc $1f,x
$0c:cbf9  78			sei
$0c:cbfa  dd 02 b7	  cmp $b702,x
$0c:cbfd  5b			tcd
$0c:cbfe  ae 5f ba	  ldx $ba5f
$0c:cc01  1a			inc a
$0c:cc02  ec 97 f3	  cpx $f397
$0c:cc05  1f 00 cf a0   ora $a0cf00,x
$0c:cc09  07 7f		 ora [$7f]
$0c:cc0b  00 d2		 brk #$d2
$0c:cc0d  19 05 12	  ora $1205,y
$0c:cc10  08			php
$0c:cc11  90 8a		 bcc $cb9d
$0c:cc13  e0 bb		 cpx #$bb
$0c:cc15  57 ae		 eor [$ae],y
$0c:cc17  54 fe b7	  mvn $b7,$fe
$0c:cc1a  fd c5 dd	  sbc $ddc5,x
$0c:cc1d  fe b0 b9	  inc $b9b0,x
$0c:cc20  64 06		 stz $06
$0c:cc22  ab			plb
$0c:cc23  be 36 84	  ldx $8436,y
$0c:cc26  15 c4		 ora $c4,x
$0c:cc28  68			pla
$0c:cc29  54 04 86	  mvn $86,$04
$0c:cc2c  de 93 6a	  dec $6a93,x
$0c:cc2f  b5 f3		 lda $f3,x
$0c:cc31  3f f5 b9 ff   and $ffb9f5,x
$0c:cc35  a6 2d		 ldx $2d
$0c:cc37  6e a0 e9	  ror $e9a0
$0c:cc3a  74 1b		 stz $1b,x
$0c:cc3c  5b			tcd
$0c:cc3d  db			stp
$0c:cc3e  94 32		 sty $32,x
$0c:cc40  8c e1 74	  sty $74e1
$0c:cc43  91 94		 sta ($94),y
$0c:cc45  2b			pld
$0c:cc46  ec e1 8d	  cpx $8de1
$0c:cc49  fc a9 ff	  jsr ($ffa9,x)
$0c:cc4c  2c 1d eb	  bit $eb1d
$0c:cc4f  79 02 fb	  adc $fb02,y
$0c:cc52  fd a3 5b	  sbc $5ba3,x
$0c:cc55  cf 5e 5f 63   cmp $635f5e
$0c:cc59  8e fe c0	  stx $c0fe
$0c:cc5c  17 e9		 ora [$e9],y
$0c:cc5e  09 35 0d	  ora #$0d35
$0c:cc61  f8			sed
$0c:cc62  d4 36		 pei ($36)
$0c:cc64  ab			plb
$0c:cc65  bd 42 ab	  lda $ab42,x
$0c:cc68  fa			plx
$0c:cc69  eb			xba
$0c:cc6a  cb			wai
$0c:cc6b  2a			rol a
$0c:cc6c  b0 8a		 bcs $cbf8
$0c:cc6e  ad aa af	  lda $afaa
$0c:cc71  f4 aa d2	  pea $d2aa
$0c:cc74  2b			pld
$0c:cc75  b8			clv
$0c:cc76  88			dey
$0c:cc77  06 aa		 asl $aa
$0c:cc79  01 28		 ora ($28,x)
$0c:cc7b  70 0b		 bvs $cc88
$0c:cc7d  84 35		 sty $35
$0c:cc7f  0e 01 d1	  asl $d101
$0c:cc82  40			rti
$0c:cc83  3b			tsc
$0c:cc84  1b			tcs
$0c:cc85  38			sec
$0c:cc86  d6 ce		 dec $ce,x
$0c:cc88  3d b7 ad	  and $adb7,x
$0c:cc8b  6c f0 5b	  jmp ($5bf0)
$0c:cc8e  3f 46 45 ea   and $ea4546,x
$0c:cc92  12 6c		 ora ($6c)
$0c:cc94  1d f2 00	  ora $00f2,x
$0c:cc97  ff 01 08 3f   sbc $3f0801,x
$0c:cc9b  c9 96 0f	  cmp #$0f96
$0c:cc9e  f2 93		 sbc ($93)
$0c:cca0  e5 3c		 sbc $3c
$0c:cca2  b5 6f		 lda $6f,x
$0c:cca4  0d 5b 4b	  ora $4b5b
$0c:cca7  16 be		 asl $be,x
$0c:cca9  f3 a2		 sbc ($a2,s),y
$0c:ccab  f8			sed
$0c:ccac  60			rts
$0c:ccad  a8			tay
$0c:ccae  76 6b		 ror $6b,x
$0c:ccb0  40			rti
$0c:ccb1  30 9c		 bmi $cc4f
$0c:ccb3  08			php
$0c:ccb4  04 06		 tsb $06
$0c:ccb6  13 00		 ora ($00,s),y
$0c:ccb8  10 80		 bpl $cc3a
$0c:ccba  c2 49		 rep #$49
$0c:ccbc  00 ac		 brk #$ac
$0c:ccbe  e3 30		 sbc $30,s
$0c:ccc0  f9 db 47	  sbc $47db,y
$0c:ccc3  56 2d		 lsr $2d,x
$0c:ccc5  cb			wai
$0c:ccc6  94 62		 sty $62,x
$0c:ccc8  bb			tyx
$0c:ccc9  9b			txy
$0c:ccca  4b			phk
$0c:cccb  26 52		 rol $52
$0c:cccd  31 a8		 and ($a8),y
$0c:cccf  64 94		 stz $94
$0c:ccd1  fa			plx
$0c:ccd2  01 3c		 ora ($3c,x)
$0c:ccd4  80 5d		 bra $cd33
$0c:ccd6  05 07		 ora $07
$0c:ccd8  70 80		 bvs $cc5a
$0c:ccda  48			pha
$0c:ccdb  27 18		 and [$18]
$0c:ccdd  0f 04 03 00   ora $000304
$0c:cce1  ac 12 aa	  ldy $aa12
$0c:cce4  f0 0a		 beq $ccf0
$0c:cce6  b0 55		 bcs $cd3d
$0c:cce8  38			sec
$0c:cce9  2c 72 03	  bit $0372
$0c:ccec  07 80		 ora [$80]
$0c:ccee  40			rti
$0c:ccef  4a			lsr a
$0c:ccf0  b1 03		 lda ($03),y
$0c:ccf2  30 6d		 bmi $cd61
$0c:ccf4  63 17		 adc $17,s
$0c:ccf6  e2 ac		 sep #$ac
$0c:ccf8  c7 75		 cmp [$75]
$0c:ccfa  16 7e		 asl $7e,x
$0c:ccfc  d4 f6		 pei ($f6)
$0c:ccfe  c3 06		 cmp $06,s
$0c:cd00  92 4c		 sta ($4c)
$0c:cd02  67 f1		 adc [$f1]
$0c:cd04  b8			clv
$0c:cd05  af de 01 bf   lda $bf01de
$0c:cd09  64 0c		 stz $0c
$0c:cd0b  f6 01		 inc $01,x
$0c:cd0d  1e 80 47	  asl $4780,x
$0c:cd10  e0 10		 cpx #$10
$0c:cd12  e5 50		 sbc $50
$0c:cd14  95 4b		 sta $4b,x
$0c:cd16  b5 ff		 lda $ff,x
$0c:cd18  a4 70		 ldy $70
$0c:cd1a  27 f8		 and [$f8]
$0c:cd1c  0e 96 b7	  asl $b796
$0c:cd1f  91 b7		 sta ($b7),y
$0c:cd21  d7 67		 cmp [$67],y
$0c:cd23  ca			dex
$0c:cd24  a9 3f		 lda #$3f
$0c:cd26  51 0b		 eor ($0b),y
$0c:cd28  1d 20 51	  ora $5120,x
$0c:cd2b  38			sec
$0c:cd2c  cc 6f 77	  cpy $776f
$0c:cd2f  d7 a4		 cmp [$a4],y
$0c:cd31  5c b6 b3 1e   jml $1eb3b6
$0c:cd35  44 66 bb	  mvp $bb,$66
$0c:cd38  97 d5		 sta [$d5],y
$0c:cd3a  f2 61		 sbc ($61)
$0c:cd3c  90 08		 bcc $cd46
$0c:cd3e  32 a8		 and ($a8)
$0c:cd40  71 f0		 adc ($f0),y
$0c:cd42  0e 74 03	  asl $0374
$0c:cd45  cd 00 f7	  cmp $f700
$0c:cd48  40			rti
$0c:cd49  3e d0 0d	  rol $0dd0,x
$0c:cd4c  ed 0f f7	  sbc $f70f
$0c:cd4f  2c ea cb	  bit $cbea
$0c:cd52  36 54		 rol $54,x
$0c:cd54  ee ed 8f	  inc $8fed
$0c:cd57  b7 7c		 lda [$7c],y
$0c:cd59  e4 d0		 cpx $d0
$0c:cd5b  3f e3 f0 3e   and $3ef0e3,x
$0c:cd5f  19 d1 27	  ora $27d1,y
$0c:cd62  e6 c1		 inc $c1
$0c:cd64  d4 ee		 pei ($ee)
$0c:cd66  ae fa 4e	  ldx $4efa
$0c:cd69  5e 33 7f	  lsr $7f33,x
$0c:cd6c  32 aa		 and ($aa)
$0c:cd6e  fb			xce
$0c:cd6f  33 77		 and ($77,s),y
$0c:cd71  9c bd 27	  stz $27bd
$0c:cd74  fb			xce
$0c:cd75  fc a2 40	  jsr ($40a2,x)
$0c:cd78  23 04		 and $04,s
$0c:cd7a  c1 a0		 cmp ($a0,x)
$0c:cd7c  33 81		 and ($81,s),y
$0c:cd7e  c0 3f		 cpy #$3f
$0c:cd80  e1 30		 sbc ($30,x)
$0c:cd82  f9 ab bf	  sbc $bfab,y
$0c:cd85  1a			inc a
$0c:cd86  dd 43 f7	  cmp $f743,x
$0c:cd89  f6 af		 inc $af,x
$0c:cd8b  79 a9 97	  adc $97a9,y
$0c:cd8e  5e fc cf	  lsr $cffc,x
$0c:cd91  33 c8		 and ($c8,s),y
$0c:cd93  97 9b		 sta [$9b],y
$0c:cd95  42 08		 wdm #$08
$0c:cd97  40			rti
$0c:cd98  13 a0		 ora ($a0,s),y
$0c:cd9a  44 c4 c3	  mvp $c3,$c4
$0c:cd9d  46 80		 lsr $80
$0c:cd9f  44 20 1b	  mvp $1b,$20
$0c:cda2  4a			lsr a
$0c:cda3  9c ab 8b	  stz $8bab
$0c:cda6  d1 b0		 cmp ($b0),y
$0c:cda8  60			rts
$0c:cda9  af f2 9f 3e   lda $3e9ff2
$0c:cdad  4e 83 7c	  lsr $7c83
$0c:cdb0  fe d6 b4	  inc $b4d6,x
$0c:cdb3  b0 f5		 bcs $cdaa
$0c:cdb5  40			rti
$0c:cdb6  aa			tax
$0c:cdb7  40			rti
$0c:cdb8  7e 0a 70	  ror $700a,x
$0c:cdbb  9f 09 84 7e   sta $7e8409,x
$0c:cdbf  1e 4a dc	  asl $dc4a,x
$0c:cdc2  b7 01		 lda [$01],y
$0c:cdc4  52 e0		 eor ($e0)
$0c:cdc6  6b			rtl
$0c:cdc7  6e dd 09	  ror $09dd
$0c:cdca  6d 4e 83	  adc $834e
$0c:cdcd  fa			plx
$0c:cdce  fd d2 f6	  sbc $f6d2,x
$0c:cdd1  80 b0		 bra $cd83
$0c:cdd3  51 80		 eor ($80),y
$0c:cdd5  2c 85 61	  bit $6185
$0c:cdd8  be 20 08	  ldx $0820,y
$0c:cddb  fc 21 1f	  jsr ($1f21,x)
$0c:cdde  cf 5c 56 9b   cmp $9b565c
$0c:cde2  01 9b		 ora ($9b,x)
$0c:cde4  76 f7		 ror $f7,x
$0c:cde6  d8			cld
$0c:cde7  1a			inc a
$0c:cde8  8c 03 fb	  sty $fb03
$0c:cdeb  fd d4 d5	  sbc $d5d4,x
$0c:cdee  ff e2 a1 15   sbc $15a1e2,x
$0c:cdf2  80 fc		 bra $cdf0
$0c:cdf4  19 a0 9f	  ora $9fa0,y
$0c:cdf7  03 59		 ora $59,s
$0c:cdf9  66 ae		 ror $ae
$0c:cdfb  ff 08 6c aa   sbc $aa6c08,x
$0c:cdff  0f 2c fe e8   ora $e8fe2c
$0c:ce03  3b			tsc
$0c:ce04  b2 c8		 lda ($c8)
$0c:ce06  1f e3 f3 ea   ora $eaf3e3,x
$0c:ce0a  8a			txa
$0c:ce0b  fe 20 1f	  inc $1f20,x
$0c:ce0e  a8			tay
$0c:ce0f  02 fc		 cop #$fc
$0c:ce11  09 21		 ora #$21
$0c:ce13  7e 15 0b	  ror $0b15,x
$0c:ce16  84 07		 sty $07
$0c:ce18  e1 80		 sbc ($80,x)
$0c:ce1a  ee ca 2b	  inc $2bca
$0c:ce1d  bf 0e ad eb   lda $ebad0e,x
$0c:ce21  af a0 aa e2   lda $e2aaa0
$0c:ce25  ae b7 a8	  ldx $a8b7
$0c:ce28  bf 83 cf 22   lda $22cf83,x
$0c:ce2c  80 68		 bra $ce96
$0c:ce2e  a0 12		 ldy #$12
$0c:ce30  a8			tay
$0c:ce31  07 a2		 ora [$a2]
$0c:ce33  01 ea		 ora ($ea,x)
$0c:ce35  73 0b		 adc ($0b,s),y
$0c:ce37  94 04		 sty $04,x
$0c:ce39  21 60		 and ($60,x)
$0c:ce3b  b0 72		 bcs $ceaf
$0c:ce3d  7a			ply
$0c:ce3e  d3 99		 cmp ($99,s),y
$0c:ce40  e6 ca		 inc $ca
$0c:ce42  f3 25		 sbc ($25,s),y
$0c:ce44  b9 c2 ac	  lda $acc2,y
$0c:ce47  f1 5a		 sbc ($5a),y
$0c:ce49  74 2a		 stz $2a,x
$0c:ce4b  b9 9f 41	  lda $419f,y
$0c:ce4e  0a			asl a
$0c:ce4f  7c 3f f2	  jmp ($f23f,x)
$0c:ce52  00 18		 brk #$18
$0c:ce54  82 0e 05	  brl $d365
$0c:ce57  02 c8		 cop #$c8
$0c:ce59  db			stp
$0c:ce5a  73 93		 adc ($93,s),y
$0c:ce5c  ea			nop
$0c:ce5d  7e 7a 4f	  ror $4f7a,x
$0c:ce60  ce e9 d9	  dec $d9e9
$0c:ce63  ad 13 39	  lda $3913
$0c:ce66  8c 6b fa	  sty $fa6b
$0c:ce69  a2 1f		 ldx #$1f
$0c:ce6b  fc 20 0e	  jsr ($0e20,x)
$0c:ce6e  c9 f0		 cmp #$f0
$0c:ce70  54 05 c3	  mvn $c3,$05
$0c:ce73  1f 40 df ca   ora $cadf40,x
$0c:ce77  be b2 5f	  ldx $5fb2,y
$0c:ce7a  d5 4f		 cmp $4f,x
$0c:ce7c  5d a4 ad	  eor $ada4,x
$0c:ce7f  f9 eb 5f	  sbc $5feb,y
$0c:ce82  ff fe 3f 1f   sbc $1f3ffe,x
$0c:ce86  9f cf e5 72   sta $72e5cf,x
$0c:ce8a  b9 0c 86	  lda $860c,y
$0c:ce8d  13 09		 ora ($09,s),y
$0c:ce8f  10 88		 bpl $ce19
$0c:ce91  33 07		 and ($07,s),y
$0c:ce93  ff 2a ea aa   sbc $aaea2a,x
$0c:ce97  03 6f		 ora $6f,s
$0c:ce99  48			pha
$0c:ce9a  ac 6d e4	  ldy $e46d
$0c:ce9d  d7 fd		 cmp [$fd],y
$0c:ce9f  8f ef df a7   sta $a7dfef
$0c:cea3  1f 87 57 aa   ora $aa5787,x
$0c:cea7  3f 0a 45 21   and $21450a,x
$0c:ceab  9a			txs
$0c:ceac  28			plp
$0c:cead  a1 26		 lda ($26,x)
$0c:ceaf  07 56		 ora [$56]
$0c:ceb1  55 aa		 eor $aa,x
$0c:ceb3  aa			tax
$0c:ceb4  ed 69 51	  sbc $5169
$0c:ceb7  2f 6f 97 ef   and $ef976f
$0c:cebb  9b			txy
$0c:cebc  cd 5c aa	  cmp $aa5c
$0c:cebf  50 88		 bvc $ce49
$0c:cec1  94 aa		 sty $aa,x
$0c:cec3  55 01		 eor $01,x
$0c:cec5  80 d2		 bra $ce99
$0c:cec7  a9 4c		 lda #$4c
$0c:cec9  c0 84		 cpy #$84
$0c:cecb  40			rti
$0c:cecc  2c b0 0d	  bit $0db0
$0c:cecf  6c 03 db	  jmp ($db03)
$0c:ced2  00 97		 brk #$97
$0c:ced4  74 70		 stz $70,x
$0c:ced6  37 ea		 and [$ea],y
$0c:ced8  ee 9b 57	  inc $579b
$0c:cedb  52 ad		 eor ($ad)
$0c:cedd  fc a6 b9	  jsr ($b9a6,x)
$0c:cee0  ee d7 de	  inc $ded7
$0c:cee3  31 bd		 and ($bd),y
$0c:cee5  e8			inx
$0c:cee6  f4 6e 17	  pea $176e
$0c:cee9  0d 06 80	  ora $8006
$0c:ceec  d6 06		 dec $06,x
$0c:ceee  b0 a0		 bcs $ce90
$0c:cef0  33 06		 and ($06,s),y
$0c:cef2  84 2e		 sty $2e
$0c:cef4  18			clc
$0c:cef5  d7 96		 cmp [$96],y
$0c:cef7  49 db		 eor #$db
$0c:cef9  80 ff		 bra $cefa
$0c:cefb  a1 ff		 lda ($ff,x)
$0c:cefd  01 78		 ora ($78,x)
$0c:ceff  42 be		 wdm #$be
$0c:cf01  b0 2f		 bcs $cf32
$0c:cf03  e9 7c		 sbc #$7c
$0c:cf05  3c 9e 4e	  bit $4e9e,x
$0c:cf08  1f 0f fd fe   ora $fefd0f,x
$0c:cf0c  f8			sed
$0c:cf0d  7c 0b e0	  jmp ($e00b,x)
$0c:cf10  c7 0f		 cmp [$0f]
$0c:cf12  ef f6 41 df   sbc $df41f6
$0c:cf16  d3 5e		 cmp ($5e,s),y
$0c:cf18  77 b4		 adc [$b4],y
$0c:cf1a  35 a8		 and $a8,x
$0c:cf1c  74 25		 stz $25,x
$0c:cf1e  f0 4f		 beq $cf6f
$0c:cf20  dc 87 fd	  jml [$fd87]
$0c:cf23  f4 85 f7	  pea $f785
$0c:cf26  fb			xce
$0c:cf27  f0 88		 beq $ceb1
$0c:cf29  45 02		 eor $02
$0c:cf2b  80 c5		 bra $cef2
$0c:cf2d  08			php
$0c:cf2e  7c 3f f7	  jmp ($f73f,x)
$0c:cf31  fb			xce
$0c:cf32  87 43		 sta [$43]
$0c:cf34  a1 70		 lda ($70,x)
$0c:cf36  b2 a8		 lda ($a8)
$0c:cf38  57 76		 eor [$76],y
$0c:cf3a  db			stp
$0c:cf3b  7e 45 ab	  ror $ab45,x
$0c:cf3e  af 5d b4 ed   lda $edb45d
$0c:cf42  a5 5a		 lda $5a
$0c:cf44  0d b5 57	  ora $57b5
$0c:cf47  2c 67 07	  bit $0767
$0c:cf4a  fa			plx
$0c:cf4b  60			rts
$0c:cf4c  a0 1c		 ldy #$1c
$0c:cf4e  18			clc
$0c:cf4f  05 26		 ora $26
$0c:cf51  01 69		 ora ($69,x)
$0c:cf53  16 0d		 asl $0d,x
$0c:cf55  5f 5f f1 ce   eor $cef15f,x
$0c:cf59  f7 6c		 sbc [$6c],y
$0c:cf5b  36 7f		 rol $7f,x
$0c:cf5d  ce b7 b3	  dec $b3b7
$0c:cf60  31 b2		 and ($b2),y
$0c:cf62  df e8 af f2   cmp $f2afe8,x
$0c:cf66  81 08		 sta ($08,x)
$0c:cf68  97 15		 sta [$15],y
$0c:cf6a  00 d5		 brk #$d5
$0c:cf6c  03 86		 ora $86,s
$0c:cf6e  3f e0 bb 72   and $72bbe0,x
$0c:cf72  6f bc 29 ce   adc $ce29bc
$0c:cf76  1a			inc a
$0c:cf77  dd d1 bd	  cmp $bdd1,x
$0c:cf7a  f5 61		 sbc $61,x
$0c:cf7c  3a			dec a
$0c:cf7d  37 fb		 and [$fb],y
$0c:cf7f  50 1f		 bvc $cfa0
$0c:cf81  e7 54		 sbc [$54]
$0c:cf83  07 0f		 ora [$0f]
$0c:cf85  5e 51 fa	  lsr $fa51,x
$0c:cf88  86 eb		 stx $eb
$0c:cf8a  6a			ror a
$0c:cf8b  56 de		 lsr $de,x
$0c:cf8d  9e eb 8d	  stz $8deb,x
$0c:cf90  fa			plx
$0c:cf91  cb			wai
$0c:cf92  d5 67		 cmp $67,x
$0c:cf94  8a			txa
$0c:cf95  a1 2f		 lda ($2f,x)
$0c:cf97  ac 05 54	  ldy $5405
$0c:cf9a  20 70 b8	  jsr $b870
$0c:cf9d  6d bf b3	  adc $b3bf
$0c:cfa0  be d4 42	  ldx $42d4,y
$0c:cfa3  8b			phb
$0c:cfa4  8d cd c4	  sta $c4cd
$0c:cfa7  ea			nop
$0c:cfa8  79 ab a6	  adc $a6ab,y
$0c:cfab  4a			lsr a
$0c:cfac  ff 73 e7 c0   sbc $c0e773,x
$0c:cfb0  38			sec
$0c:cfb1  d0 0f		 bne $cfc2
$0c:cfb3  7c 03 f5	  jmp ($f503,x)
$0c:cfb6  00 f6		 brk #$f6
$0c:cfb8  40			rti
$0c:cfb9  3d a8 81	  and $81a8,x
$0c:cfbc  c6 40		 dec $40
$0c:cfbe  34 97		 bit $97,x
$0c:cfc0  be 24 fe	  ldx $fe24,y
$0c:cfc3  e5 0d		 sbc $0d
$0c:cfc5  cd e0 36	  cmp $36e0
$0c:cfc8  7f 39 df f7   adc $f7df39,x
$0c:cfcc  29 6e		 and #$6e
$0c:cfce  a8			tay
$0c:cfcf  4f 81 e0 9f   eor $9fe081
$0c:cfd3  2b			pld
$0c:cfd4  fc 02 19	  jsr ($1902,x)
$0c:cfd7  00 ff		 brk #$ff
$0c:cfd9  13 84		 ora ($84,s),y
$0c:cfdb  9e 12 4f	  stz $4f12,x
$0c:cfde  f5 27		 sbc $27,x
$0c:cfe0  6f 9a b6 4d   adc $4db69a
$0c:cfe4  60			rts
$0c:cfe5  3f 5f bc 6b   and $6bbc5f,x
$0c:cfe9  7f e8 cb e9   adc $e9cbe8,x
$0c:cfed  71 04		 adc ($04),y
$0c:cfef  f0 54		 beq $d045
$0c:cff1  92 a4		 sta ($a4)
$0c:cff3  21 0a		 and ($0a,x)
$0c:cff5  41 64		 eor ($64,x)
$0c:cff7  96 d6		 stx $d6,y
$0c:cff9  d9 8d b6	  cmp $b68d,y
$0c:cffc  65 6b		 adc $6b
$0c:cffe  97 59		 sta [$59],y
$0c:d000  e7 7f		 sbc [$7f]
$0c:d002  fd c5 b6	  sbc $b6c5,x
$0c:d005  49 6d		 eor #$6d
$0c:d007  9b			txy
$0c:d008  2f 77 ce 00   and $00ce77
$0c:d00c  df 0f 1c 03   cmp $031c0f,x
$0c:d010  86 68		 stx $68
$0c:d012  1c 9b a0	  trb $a09b
$0c:d015  62 30 09	  per $d948
$0c:d018  65 63		 adc $63
$0c:d01a  6f 4f 85 d9   adc $d9854f
$0c:d01e  e4 b7		 cpx $b7
$0c:d020  3d 95 e6	  and $e695,x
$0c:d023  f3 3c		 sbc ($3c,s),y
$0c:d025  cf ef eb 7c   cmp $7cebef
$0c:d029  f2 78		 sbc ($78)
$0c:d02b  7f 15 0b ff   adc $ff0b15,x
$0c:d02f  88			dey
$0c:d030  29 42		 and #$42
$0c:d032  7e 50 0e	  ror $0e50,x
$0c:d035  d7 b3		 cmp [$b3],y
$0c:d037  e7 d3		 sbc [$d3]
$0c:d039  f3 69		 sbc ($69,s),y
$0c:d03b  f9 d4 fc	  sbc $fcd4,y
$0c:d03e  f6 72		 inc $72,x
$0c:d040  7d 7a fe	  adc $fe7a,x
$0c:d043  6d 7f 20	  adc $207f
$0c:d046  d0 06		 bne $d04e
$0c:d048  83 2c		 sta $2c,s
$0c:d04a  15 63		 ora $63,x
$0c:d04c  04 55		 tsb $55
$0c:d04e  8c c1 52	  sty $52c1
$0c:d051  11 6f		 ora ($6f),y
$0c:d053  5f da 97 0c   eor $0c97da,x
$0c:d057  dc f5 ad	  jml [$adf5]
$0c:d05a  74 fd		 stz $fd,x
$0c:d05c  84 2b		 sty $2b
$0c:d05e  eb			xba
$0c:d05f  32 f6		 and ($f6)
$0c:d061  f2 2a		 sbc ($2a)
$0c:d063  f8			sed
$0c:d064  0c 01 9c	  tsb $9c01
$0c:d067  2a			rol a
$0c:d068  51 03		 eor ($03),y
$0c:d06a  38			sec
$0c:d06b  64 08		 stz $08
$0c:d06d  e3 8d		 sbc $8d,s
$0c:d06f  c6 c9		 dec $c9
$0c:d071  60			rts
$0c:d072  b9 3f fc	  lda $fc3f,y
$0c:d075  d7 fb		 cmp [$fb],y
$0c:d077  00 a4		 brk #$a4
$0c:d079  6f 6d 94 8d   adc $8d946d
$0c:d07d  bf ca ad b7   lda $b7adca,x
$0c:d081  a4 49		 ldy $49
$0c:d083  3b			tsc
$0c:d084  64 50		 stz $50
$0c:d086  81 40		 sta ($40,x)
$0c:d088  36 ee		 rol $ee,x
$0c:d08a  81 22		 sta ($22,x)
$0c:d08c  84 24		 sty $24
$0c:d08e  a6 06		 ldx $06
$0c:d090  b1 9b		 lda ($9b),y
$0c:d092  4d aa 71	  eor $71aa
$0c:d095  3f fc 4a 85   and $854afc,x
$0c:d099  8b			phb
$0c:d09a  f6 ff		 inc $ff,x
$0c:d09c  f6 12		 inc $12,x
$0c:d09e  58			cli
$0c:d09f  97 b7		 sta [$b7],y
$0c:d0a1  b7 ed		 lda [$ed],y
$0c:d0a3  e4 c0		 cpx $c0
$0c:d0a5  3d 90 0f	  and $0f90,x
$0c:d0a8  6c 00 a4	  jmp ($a400)
$0c:d0ab  04 50		 tsb $50
$0c:d0ad  ed 19 84	  sbc $8419
$0c:d0b0  8a			txa
$0c:d0b1  19 7d f6	  ora $f67d,y
$0c:d0b4  43 7b		 eor $7b,s
$0c:d0b6  cf d2 e5 37   cmp $37e5d2
$0c:d0ba  b0 df		 bcs $d09b
$0c:d0bc  b6 bf		 ldx $bf,y
$0c:d0be  ed b3 a5	  sbc $a5b3
$0c:d0c1  7b			tdc
$0c:d0c2  2b			pld
$0c:d0c3  34 08		 bit $08,x
$0c:d0c5  05 08		 ora $08
$0c:d0c7  84 0a		 sty $0a
$0c:d0c9  01 45		 ora ($45,x)
$0c:d0cb  14 12		 trb $12
$0c:d0cd  01 06		 ora ($06,x)
$0c:d0cf  80 43		 bra $d114
$0c:d0d1  3e f0 6f	  rol $6ff0,x
$0c:d0d4  cc 23 ef	  cpy $ef23
$0c:d0d7  05 fd		 ora $fd
$0c:d0d9  ac 42 15	  ldy $1542
$0c:d0dc  f7 1c		 sbc [$1c],y
$0c:d0de  84 33		 sty $33
$0c:d0e0  e7 f0		 sbc [$f0]
$0c:d0e2  f8			sed
$0c:d0e3  7e 7f 2b	  ror $2b7f,x
$0c:d0e6  f0 5f		 beq $d147
$0c:d0e8  b2 fc		 lda ($fc)
$0c:d0ea  2d 3a 6f	  and $6f3a
$0c:d0ed  84 3f		 sty $3f
$0c:d0ef  51 77		 eor ($77),y
$0c:d0f1  94 f9		 sty $f9,x
$0c:d0f3  bc 91 fd	  ldy $fd91,x
$0c:d0f6  65 ce		 adc $ce
$0c:d0f8  f3 f6		 sbc ($f6,s),y
$0c:d0fa  96 f9		 stx $f9,y
$0c:d0fc  a2 d0		 ldx #$d0
$0c:d0fe  68			pla
$0c:d0ff  5c 2e 0f 07   jml $070f2e
$0c:d103  89 40		 bit #$40
$0c:d105  9c 21 03	  stz $0321
$0c:d108  81 c0		 sta ($c0,x)
$0c:d10a  a0 4e		 ldy #$4e
$0c:d10c  50 84		 bvc $d092
$0c:d10e  fc ea 39	  jsr ($39ea,x)
$0c:d111  ad 7e db	  lda $db7e
$0c:d114  53 3c		 eor ($3c,s),y
$0c:d116  ab			plb
$0c:d117  5d 29 5a	  eor $5a29,x
$0c:d11a  bd ef da	  lda $daef,x
$0c:d11d  ad a9 86	  lda $86a9
$0c:d120  40			rti
$0c:d121  2d b0 0a	  and $0ab0
$0c:d124  4c 03 87	  jmp $8703
$0c:d127  00 c5		 brk #$c5
$0c:d129  c0 22		 cpy #$22
$0c:d12b  84 50		 sty $50
$0c:d12d  05 0d		 ora $0d
$0c:d12f  2f 3b fd b3   and $b3fd3b
$0c:d133  c4 6a		 cpy $6a
$0c:d135  bb			tyx
$0c:d136  7e 0e a6	  ror $a60e,x
$0c:d139  5f 57 be c6   eor $c6be57,x
$0c:d13d  bc 1b 7a	  ldy $7a1b,x
$0c:d140  54 8a 01	  mvn $01,$8a
$0c:d143  8a			txa
$0c:d144  80 6a		 bra $d1b0
$0c:d146  a0 11		 ldy #$11
$0c:d148  a5 10		 lda $10
$0c:d14a  e0 a0		 cpx #$a0
$0c:d14c  10 70		 bpl $d1be
$0c:d14e  50 cb		 bvc $d11b
$0c:d150  f2 94		 sbc ($94)
$0c:d152  8d 35 df	  sta $df35
$0c:d155  bb			tyx
$0c:d156  36 c8		 rol $c8,x
$0c:d158  da			phx
$0c:d159  f3 d1		 sbc ($d1,s),y
$0c:d15b  5d 5e ff	  eor $ff5e,x
$0c:d15e  41 bf		 eor ($bf,x)
$0c:d160  a0 27		 ldy #$27
$0c:d162  c2 a2		 rep #$a2
$0c:d164  0d 03 50	  ora $5003
$0c:d167  40			rti
$0c:d168  13 e0		 ora ($e0,s),y
$0c:d16a  47 20		 eor [$20]
$0c:d16c  68			pla
$0c:d16d  5b			tcd
$0c:d16e  f4 17 59	  pea $5917
$0c:d171  64 2a		 stz $2a
$0c:d173  cf 6a ab 65   cmp $65ab6a
$0c:d177  77 7a		 adc [$7a],y
$0c:d179  fb			xce
$0c:d17a  c7 4a		 cmp [$4a]
$0c:d17c  5b			tcd
$0c:d17d  ff 80 44 20   sbc $204480,x
$0c:d181  19 28 06	  ora $0628,y
$0c:d184  42 01		 wdm #$01
$0c:d186  81 25		 sta ($25,x)
$0c:d188  19 a0 a5	  ora $a5a0,y
$0c:d18b  53 3e		 eor ($3e,s),y
$0c:d18d  f4 4b bb	  pea $bb4b
$0c:d190  10 a1		 bpl $d133
$0c:d192  e6 b3		 inc $b3
$0c:d194  d1 2f		 cmp ($2f),y
$0c:d196  bc eb b3	  ldy $b3eb,x
$0c:d199  12 ac		 ora ($ac)
$0c:d19b  e7 b9		 sbc [$b9]
$0c:d19d  90 0f		 bcc $d1ae
$0c:d19f  6c 03 de	  jmp ($de03)
$0c:d1a2  80 14		 bra $d1b8
$0c:d1a4  08			php
$0c:d1a5  73 50		 adc ($50,s),y
$0c:d1a7  03 e1		 ora $e1,s
$0c:d1a9  80 5d		 bra $d208
$0c:d1ab  e1 3c		 sbc ($3c,x)
$0c:d1ad  ae 5c a3	  ldx $a35c
$0c:d1b0  ff e5 ef cd   sbc $cdefe5,x
$0c:d1b4  6d 50 db	  adc $db50
$0c:d1b7  47 53		 eor [$53]
$0c:d1b9  e9 34 bd	  sbc #$bd34
$0c:d1bc  ff a0 13 42   sbc $4213a0,x
$0c:d1c0  10 cf		 bpl $d191
$0c:d1c2  e0 19		 cpx #$19
$0c:d1c4  f8			sed
$0c:d1c5  06 5e		 asl $5e
$0c:d1c7  01 0b		 ora ($0b,x)
$0c:d1c9  80 60		 bra $d22b
$0c:d1cb  20 11 cc	  jsr $cc11
$0c:d1ce  17 5e		 ora [$5e],y
$0c:d1d0  ef ca 9f f5   sbc $f59fca
$0c:d1d4  bf 78 ab 9f   lda $9fab78,x
$0c:d1d8  76 0f		 ror $0f,x
$0c:d1da  ab			plb
$0c:d1db  c6 d0		 dec $d0
$0c:d1dd  f7 b7		 sbc [$b7],y
$0c:d1df  f8			sed
$0c:d1e0  04 20		 tsb $20
$0c:d1e2  84 3f		 sty $3f
$0c:d1e4  c6 20		 dec $20
$0c:d1e6  fe 20 17	  inc $1720,x
$0c:d1e9  02 10		 cop #$10
$0c:d1eb  c8			iny
$0c:d1ec  7d f8 6e	  adc $6ef8,x
$0c:d1ef  76 d3		 ror $d3,x
$0c:d1f1  d9 0d a6	  cmp $a60d,y
$0c:d1f4  65 f9		 adc $f9
$0c:d1f6  d3 5b		 cmp ($5b,s),y
$0c:d1f8  64 16		 stz $16
$0c:d1fa  99 47 9e	  sta $9e47,y
$0c:d1fd  17 c2		 ora [$c2],y
$0c:d1ff  63 00		 adc $00,s
$0c:d201  89 c0 36	  bit #$36c0
$0c:d204  6e 01 c9	  ror $c901
$0c:d207  b9 07 07	  lda $0707,y
$0c:d20a  00 bf		 brk #$bf
$0c:d20c  ff e8 bb fb   sbc $fbbbe8,x
$0c:d210  2e 6e 63	  rol $636e
$0c:d213  cf 98 e3 ee   cmp $eee398
$0c:d217  b8			clv
$0c:d218  3b			tsc
$0c:d219  f9 94 0b	  sbc $0b94,y
$0c:d21c  a0 fe		 ldy #$fe
$0c:d21e  d8			cld
$0c:d21f  e4 53		 cpx $53
$0c:d221  7d 22 db	  adc $db22,x
$0c:d224  c2 60		 rep #$60
$0c:d226  36 18		 rol $18,x
$0c:d228  9f 8a 1b 76   sta $761b8a,x
$0c:d22c  c0 c9		 cpy #$c9
$0c:d22e  38			sec
$0c:d22f  30 ef		 bmi $d220
$0c:d231  1c 23 83	  trb $8323
$0c:d234  1c e0 4f	  trb $4fe0
$0c:d237  b3 d6		 lda ($d6,s),y
$0c:d239  08			php
$0c:d23a  e7 87		 sbc [$87]
$0c:d23c  31 63		 and ($63),y
$0c:d23e  ec 49 fe	  cpx $fe49
$0c:d241  10 f9		 bpl $d23c
$0c:d243  bf fe 3f ff   lda $ff3ffe,x
$0c:d247  c5 7e		 cmp $7e
$0c:d249  a8			tay
$0c:d24a  97 bd		 sta [$bd],y
$0c:d24c  06 ff		 asl $ff
$0c:d24e  89 db a0	  bit #$a0db
$0c:d251  f7 78		 sbc [$78],y
$0c:d253  5d fc 06	  eor $06fc,x
$0c:d256  02 81		 cop #$81
$0c:d258  40			rti
$0c:d259  92 c8		 sta ($c8)
$0c:d25b  32 11		 and ($11)
$0c:d25d  0a			asl a
$0c:d25e  7c 3e 51	  jmp ($513e,x)
$0c:d261  08			php
$0c:d262  95 42		 sta $42,x
$0c:d264  09 21 f8	  ora #$f821
$0c:d267  fd fc 3e	  sbc $3efc,x
$0c:d26a  f4 1a 7c	  pea $7c1a
$0c:d26d  8f ff 06 ff   sta $ff06ff
$0c:d271  60			rts
$0c:d272  ff f6 7f fd   sbc $fd7ff6,x
$0c:d276  96 ff		 stx $ff,y
$0c:d278  05 80		 ora $80
$0c:d27a  c2 a0		 rep #$a0
$0c:d27c  5b			tcd
$0c:d27d  48			pha
$0c:d27e  24 22		 bit $22
$0c:d280  11 f1		 ora ($f1),y
$0c:d282  f8			sed
$0c:d283  44 0d 22	  mvp $22,$0d
$0c:d286  45 0f		 eor $0f
$0c:d288  0f fe a7 5f   ora $5fa7fe
$0c:d28c  9c 4f a0	  stz $a04f
$0c:d28f  b1 6a		 lda ($6a),y
$0c:d291  4d 2a 07	  eor $072a
$0c:d294  02 cf		 cop #$cf
$0c:d296  c2 a4		 rep #$a4
$0c:d298  f0 23		 beq $d2bd
$0c:d29a  28			plp
$0c:d29b  69 20 9c	  adc #$9c20
$0c:d29e  38			sec
$0c:d29f  17 a2		 ora [$a2],y
$0c:d2a1  01 b4		 ora ($b4,x)
$0c:d2a3  62 0f d1	  per $a3b5
$0c:d2a6  88			dey
$0c:d2a7  3c 3e dc	  bit $dc3e,x
$0c:d2aa  be 3e 31	  ldx $313e,y
$0c:d2ad  0e ed 7f	  asl $7fed
$0c:d2b0  8f 4f e3 d1   sta $d1e34f
$0c:d2b4  fc 56 2e	  jsr ($2e56,x)
$0c:d2b7  ad 16 69	  lda $6916
$0c:d2ba  10 e0		 bpl $d29c
$0c:d2bc  40			rti
$0c:d2bd  30 10		 bmi $d2cf
$0c:d2bf  09 04 02	  ora #$0204
$0c:d2c2  61 00		 adc ($00,x)
$0c:d2c4  9c 40 23	  stz $2340
$0c:d2c7  b0 09		 bcs $d2d2
$0c:d2c9  d4 02		 pei ($02)
$0c:d2cb  ad f0 89	  lda $89f0
$0c:d2ce  fc 2a 7f	  jsr ($7f2a,x)
$0c:d2d1  4a			lsr a
$0c:d2d2  af c2 ab f2   lda $f2abc2
$0c:d2d6  cb			wai
$0c:d2d7  dc 24 7d	  jml [$7d24]
$0c:d2da  0a			asl a
$0c:d2db  4f e6 1f 00   eor $001fe6
$0c:d2df  5f d4 1a 01   eor $011ad4,x
$0c:d2e3  e2 8b		 sep #$8b
$0c:d2e5  74 a6		 stz $a6,x
$0c:d2e7  d9 69 96	  cmp $9669,y
$0c:d2ea  5a			phy
$0c:d2eb  e4 d1		 cpx $d1
$0c:d2ed  0a			asl a
$0c:d2ee  3c ce b1	  bit $b1ce,x
$0c:d2f1  ab			plb
$0c:d2f2  8f c2 ff b0   sta $b0ffc2
$0c:d2f6  06 fb		 asl $fb
$0c:d2f8  22 49 16 18   jsl $181649
$0c:d2fc  bb			tyx
$0c:d2fd  86 96		 stx $96
$0c:d2ff  81 cb		 sta ($cb,x)
$0c:d301  88			dey
$0c:d302  67 e4		 adc [$e4]
$0c:d304  1c 98 26	  trb $2698
$0c:d307  d6 87		 dec $87,x
$0c:d309  99 a3 75	  sta $75a3,y
$0c:d30c  68			pla
$0c:d30d  90 08		 bcc $d317
$0c:d30f  24 02		 bit $02
$0c:d311  37 00		 and [$00],y
$0c:d313  9f 40 2c 90   sta $902c40,x
$0c:d317  0b			phd
$0c:d318  fc 02 df	  jsr ($df02,x)
$0c:d31b  00 b3		 brk #$b3
$0c:d31d  c0 2d		 cpy #$2d
$0c:d31f  d1 a8		 cmp ($a8),y
$0c:d321  35 6e		 and $6e,x
$0c:d323  43 25		 eor $25,s
$0c:d325  ac d4 7b	  ldy $7bd4
$0c:d328  bb			tyx
$0c:d329  bc 6d 57	  ldy $576d,x
$0c:d32c  bf 4b be cb   lda $cbbe4b,x
$0c:d330  65 70		 adc $70
$0c:d332  1f 02 20 7f   ora $7f2002,x
$0c:d336  d2 0f		 cmp ($0f)
$0c:d338  f5 c0		 sbc $c0,x
$0c:d33a  48			pha
$0c:d33b  38			sec
$0c:d33c  0f f5 43 fd   ora $fd43f5
$0c:d340  82 bc f2	  brl $c5ff
$0c:d343  6c 7b 6a	  jmp ($6a7b)
$0c:d346  57 22		 eor [$22],y
$0c:d348  3d f7 87	  and $87f7,x
$0c:d34b  f5 64		 sbc $64,x
$0c:d34d  3a			dec a
$0c:d34e  e8			inx
$0c:d34f  8f 5e 21 00   sta $00215e
$0c:d353  83 c0		 sta $c0,s
$0c:d355  23 f0		 and $f0,s
$0c:d357  12 10		 ora ($10)
$0c:d359  4f e0 13 f8   eor $f813e0
$0c:d35d  11 18		 ora ($18),y
$0c:d35f  2e 70 0b	  rol $0b70
$0c:d362  ce 8b bd	  dec $bd8b
$0c:d365  e1 ab		 sbc ($ab,x)
$0c:d367  e5 77		 sbc $77
$0c:d369  7e 9b 5d	  ror $5d9b,x
$0c:d36c  5e b3 4f	  lsr $4fb3,x
$0c:d36f  92 ec		 sta ($ec)
$0c:d371  79 b6 fc	  adc $fcb6,y
$0c:d374  48			pha
$0c:d375  7c 30 1f	  jmp ($1f30,x)
$0c:d378  8e 07 e3	  stx $e307
$0c:d37b  21 fc		 and ($fc,x)
$0c:d37d  d0 7f		 bne $d3fe
$0c:d37f  38			sec
$0c:d380  08			php
$0c:d381  90 e7		 bcc $d36a
$0c:d383  40			rti
$0c:d384  33 d5		 and ($d5,s),y
$0c:d386  49 dc 92	  eor #$92dc
$0c:d389  bf 89 9b 5a   lda $5a9b89,x
$0c:d38d  7b			tdc
$0c:d38e  f8			sed
$0c:d38f  68			pla
$0c:d390  ce a6 41	  dec $41a6
$0c:d393  fb			xce
$0c:d394  9d d7 32	  sta $32d7,x
$0c:d397  df f8 01 fc   cmp $fc01f8,x
$0c:d39b  b7 e8		 lda [$e8],y
$0c:d39d  01 ef		 ora ($ef,x)
$0c:d39f  c0 38		 cpy #$38
$0c:d3a1  90 0f		 bcc $d3b2
$0c:d3a3  7c 02 49	  jmp ($4902,x)
$0c:d3a6  72 a5		 adc ($a5)
$0c:d3a8  d6 7f		 dec $7f,x
$0c:d3aa  9d d9 2d	  sta $2dd9,x
$0c:d3ad  5a			phy
$0c:d3ae  17 56		 ora [$56],y
$0c:d3b0  b4 d5		 ldy $d5,x
$0c:d3b2  fe d5 78	  inc $78d5,x
$0c:d3b5  47 77		 eor [$77]
$0c:d3b7  1f 00 d3 40   ora $40d300,x
$0c:d3bb  24 50		 bit $50
$0c:d3bd  0d 44 03	  ora $0344
$0c:d3c0  52 a4		 eor ($a4)
$0c:d3c2  15 28		 ora $28,x
$0c:d3c4  28			plp
$0c:d3c5  c3 13		 cmp $13,s
$0c:d3c7  6f bb 47 74   adc $7447bb
$0c:d3cb  7b			tdc
$0c:d3cc  98			tya
$0c:d3cd  7f d7 b3 73   adc $73b3d7,x
$0c:d3d1  b0 d2		 bcs $d3a5
$0c:d3d3  f6 7d		 inc $7d,x
$0c:d3d5  9d 85 2f	  sta $2f85,x
$0c:d3d8  e1 00		 sbc ($00,x)
$0c:d3da  10 03		 bpl $d3df
$0c:d3dc  f8			sed
$0c:d3dd  18			clc
$0c:d3de  81 84		 sta ($84,x)
$0c:d3e0  80 65		 bra $d447
$0c:d3e2  1f e2 00 0e   ora $0e00e2,x
$0c:d3e6  a4 ea		 ldy $ea
$0c:d3e8  4f dd 84 7d   eor $7d84dd
$0c:d3ec  29 fb aa	  and #$aafb
$0c:d3ef  1f eb ab 24   ora $24abeb,x
$0c:d3f3  9c cf 2d	  stz $2dcf
$0c:d3f6  fd c3 f8	  sbc $f8c3,x
$0c:d3f9  7f 90 03 fd   adc $fd0390,x
$0c:d3fd  72 0f		 adc ($0f)
$0c:d3ff  ee 01 c3	  inc $c301
$0c:d402  80 7c		 bra $d480
$0c:d404  e0 16		 cpx #$16
$0c:d406  38			sec
$0c:d407  44 06 39	  mvp $39,$06
$0c:d40a  68			pla
$0c:d40b  af 7b b0 1e   lda $1eb07b
$0c:d40f  48			pha
$0c:d410  0f db 0f 7c   ora $7c0fdb
$0c:d414  ac cf e6	  ldy $e6cf
$0c:d417  1f 78 47 8e   ora $8e4778,x
$0c:d41b  39 81 9f	  and $9f81,y
$0c:d41e  47 ec		 eor [$ec]
$0c:d420  11 ef		 ora ($ef),y
$0c:d422  0c 62 c7	  tsb $c762
$0c:d425  80 93		 bra $d3ba
$0c:d427  f0 21		 beq $d44a
$0c:d429  e8			inx
$0c:d42a  00 fd		 brk #$fd
$0c:d42c  61 77		 adc ($77,x)
$0c:d42e  5c 12 80 71   jml $718012
$0c:d432  b7 38		 lda [$38],y
$0c:d434  ef 8e 0b fb   sbc $fb0b8e
$0c:d438  fe 3f a0	  inc $a03f,x
$0c:d43b  7a			ply
$0c:d43c  7c 3f fe	  jmp ($fe3f,x)
$0c:d43f  9f 7f f1 fe   sta $fef17f,x
$0c:d443  f2 fd		 sbc ($fd)
$0c:d445  b7 3f		 lda [$3f],y
$0c:d447  af df ea c7   lda $c7eadf
$0c:d44b  6a			ror a
$0c:d44c  ec f6 a1	  cpx $a1f6
$0c:d44f  10 89		 bpl $d3da
$0c:d451  24 12		 bit $12
$0c:d453  07 02		 ora [$02]
$0c:d455  84 32		 sty $32
$0c:d457  8d 92 12	  sta $1292
$0c:d45a  47 50		 eor [$50]
$0c:d45c  76 f5		 ror $f5,x
$0c:d45e  f9 fe fc	  sbc $fcfe,y
$0c:d461  fe 7b ff	  inc $ff7b,x
$0c:d464  9b			txy
$0c:d465  ff e7 ff f8   sbc $f8ffe7,x
$0c:d469  f7 fa		 sbc [$fa],y
$0c:d46b  57 ef		 eor [$ef],y
$0c:d46d  9a			txs
$0c:d46e  44 28 10	  mvp $10,$28
$0c:d471  0c 01 88	  tsb $8801
$0c:d474  0c a7 81	  tsb $81a7
$0c:d477  c0 64		 cpy #$64
$0c:d479  30 19		 bmi $d494
$0c:d47b  6c f7 a3	  jmp ($a3f7)
$0c:d47e  99 e5 f3	  sta $f3e5,y
$0c:d481  7a			ply
$0c:d482  be 7b ef	  ldx $ef7b,y
$0c:d485  df e3 f3 62   cmp $62f3e3,x
$0c:d489  b5 8f		 lda $8f,x
$0c:d48b  42 d3		 wdm #$d3
$0c:d48d  08			php
$0c:d48e  9b			txy
$0c:d48f  c1 23		 cmp ($23,x)
$0c:d491  70 28		 bvs $d4bb
$0c:d493  63 28		 adc $28,s
$0c:d495  60			rts
$0c:d496  c4 a3		 cpy $a3
$0c:d498  de 62 32	  dec $3262,x
$0c:d49b  1b			tcs
$0c:d49c  0e 04 82	  asl $8204
$0c:d49f  65 f2		 adc $f2
$0c:d4a1  98			tya
$0c:d4a2  7e 27 9f	  ror $9f27,x
$0c:d4a5  c8			iny
$0c:d4a6  f9 70 6c	  sbc $6c70,y
$0c:d4a9  f0 0a		 beq $d4b5
$0c:d4ab  7c 03 3f	  jmp ($3f03,x)
$0c:d4ae  00 c6		 brk #$c6
$0c:d4b0  e0 30		 cpx #$30
$0c:d4b2  f8			sed
$0c:d4b3  0c 19 a8	  tsb $a819
$0c:d4b6  ea			nop
$0c:d4b7  df 0e 9d c2   cmp $c29d0e,x
$0c:d4bb  2b			pld
$0c:d4bc  f2 ab		 sbc ($ab)
$0c:d4be  fc 24 7d	  jsr ($7d24,x)
$0c:d4c1  0a			asl a
$0c:d4c2  4f e7 ad 71   eor $71ade7
$0c:d4c6  e9 dd 01	  sbc #$01dd
$0c:d4c9  c0 bf		 cpy #$bf
$0c:d4cb  64 48		 stz $48
$0c:d4cd  2f cb c5 16   and $16c5cb
$0c:d4d1  e9 4d 9a	  sbc #$9a4d
$0c:d4d4  21 47		 and ($47,x)
$0c:d4d6  99 d6 35	  sta $35d6,y
$0c:d4d9  70 f8		 bvs $d4d3
$0c:d4db  df 0a 6d 96   cmp $966d0a,x
$0c:d4df  99 7f 60	  sta $607f,y
$0c:d4e2  0d f2 fe	  ora $fef2
$0c:d4e5  40			rti
$0c:d4e6  3e 8e 61	  rol $618e,x
$0c:d4e9  6f 97 ee 89   adc $89ee97
$0c:d4ed  99 a1 6b	  sta $6ba1,y
$0c:d4f0  68			pla
$0c:d4f1  1e 69 84	  asl $8469,x
$0c:d4f4  6f 43 48 c9   adc $c94843
$0c:d4f8  da			phx
$0c:d4f9  38			sec
$0c:d4fa  fd b8 84	  sbc $84b8,x
$0c:d4fd  02 dd		 cop #$dd
$0c:d4ff  00 4f		 brk #$4f
$0c:d501  85 ee		 sta $ee
$0c:d503  01 79		 ora ($79,x)
$0c:d505  80 5d		 bra $d564
$0c:d507  e0 13		 cpx #$13
$0c:d509  f8			sed
$0c:d50a  04 7e		 tsb $7e
$0c:d50c  c1 07		 cmp ($07,x)
$0c:d50e  f9 cf f9	  sbc $f9cf,y
$0c:d511  b3 fb		 lda ($fb,s),y
$0c:d513  df f6 8f 38   cmp $388ff6,x
$0c:d517  be d0 75	  ldx $75d0,y
$0c:d51a  7f 18 b7 8b   adc $8bb718,x
$0c:d51e  ba			tsx
$0c:d51f  85 0b		 sta $0b
$0c:d521  f0 7c		 beq $d59f
$0c:d523  7f c2 30 c0   adc $c030c2,x
$0c:d527  09 03 f9	  ora #$f903
$0c:d52a  01 fc		 ora ($fc,x)
$0c:d52c  40			rti
$0c:d52d  fc 1b 0a	  jsr ($0a1b,x)
$0c:d530  4f da 47 dc   eor $dc47da
$0c:d534  91 65		 sta ($65),y
$0c:d536  64 16		 stz $16
$0c:d538  7c 45 3f	  jmp ($3f45,x)
$0c:d53b  f1 69		 sbc ($69),y
$0c:d53d  fb			xce
$0c:d53e  76 e2		 ror $e2,x
$0c:d540  70 0a		 bvs $d54c
$0c:d542  fc 02 df	  jsr ($df02,x)
$0c:d545  00 b1		 brk #$b1
$0c:d547  c0 2d		 cpy #$2d
$0c:d549  50 09		 bvc $d554
$0c:d54b  c4 02		 cpy $02
$0c:d54d  34 c0		 bit $c0,x
$0c:d54f  00 68		 brk #$68
$0c:d551  40			rti
$0c:d552  63 75		 adc $75,s
$0c:d554  7f 2c 6e 8b   adc $8b6e2c,x
$0c:d558  ab			plb
$0c:d559  82 f8 62	  brl $3854
$0c:d55c  be 58 5e	  ldx $5e58,y
$0c:d55f  aa			tax
$0c:d560  ed 65 a6	  sbc $a665
$0c:d563  09 c4 48	  ora #$48c4
$0c:d566  1e 68 05	  asl $0568,x
$0c:d569  5a			phy
$0c:d56a  01 1e		 ora ($1e,x)
$0c:d56c  88			dey
$0c:d56d  57 05		 eor [$05],y
$0c:d56f  61 83		 adc ($83,x)
$0c:d571  f8			sed
$0c:d572  4a			lsr a
$0c:d573  e6 7a		 inc $7a
$0c:d575  e9 97 76	  sbc #$7697
$0c:d578  21 43		 and ($43,x)
$0c:d57a  cd 67 a2	  cmp $a267
$0c:d57d  5f 79 d7 66   eor $66d779,x
$0c:d581  25 58		 and $58
$0c:d583  cf 73 20 1c   cmp $1c2073
$0c:d587  d8			cld
$0c:d588  07 be		 ora [$be]
$0c:d58a  01 ed		 ora ($ed,x)
$0c:d58c  42 0a		 wdm #$0a
$0c:d58e  04 10		 tsb $10
$0c:d590  a1 e1		 lda ($e1,x)
$0c:d592  80 60		 bra $d5f4
$0c:d594  fb			xce
$0c:d595  da			phx
$0c:d596  ae ed de	  ldx $deed
$0c:d599  a1 75		 lda ($75,x)
$0c:d59b  af 4f ec 10   lda $10ec4f
$0c:d59f  fb			xce
$0c:d5a0  fe ff 81	  inc $81ff,x
$0c:d5a3  41 df		 eor ($df,x)
$0c:d5a5  48			pha
$0c:d5a6  20 09 f0	  jsr $f009
$0c:d5a9  d4 40		 pei ($40)
$0c:d5ab  34 10		 bit $10,x
$0c:d5ad  0c 02 98	  tsb $9802
$0c:d5b0  55 45		 eor $45,x
$0c:d5b2  e4 af		 cpx $af
$0c:d5b4  cc bb 3e	  cpy $3ebb
$0c:d5b7  38			sec
$0c:d5b8  ce 76 cf	  dec $cf76
$0c:d5bb  fd 83 da	  sbc $da83,x
$0c:d5be  3f ff f8 0f   and $0ff8ff,x
$0c:d5c2  12 76		 ora ($76)
$0c:d5c4  aa			tax
$0c:d5c5  08			php
$0c:d5c6  23 00		 and $00,s
$0c:d5c8  58			cli
$0c:d5c9  91 21		 sta ($21),y
$0c:d5cb  f7 e1		 sbc [$e1],y
$0c:d5cd  b9 db 4f	  lda $4fdb,y
$0c:d5d0  64 36		 stz $36
$0c:d5d2  99 97 e7	  sta $e797,y
$0c:d5d5  4d 6d 90	  eor $906d
$0c:d5d8  5a			phy
$0c:d5d9  67 1f		 adc [$1f]
$0c:d5db  78			sei
$0c:d5dc  fe 09 8c	  inc $8c09,x
$0c:d5df  00 7c		 brk #$7c
$0c:d5e1  1b			tcs
$0c:d5e2  37 00		 and [$00],y
$0c:d5e4  e4 dc		 cpx $dc
$0c:d5e6  83 03		 sta $03,s
$0c:d5e8  80 2e		 bra $d618
$0c:d5ea  83 0a		 sta $0a,s
$0c:d5ec  f0 0f		 beq $d5fd
$0c:d5ee  df 07 ff c9   cmp $c9ff07,x
$0c:d5f2  df e2 7e f8   cmp $f87ee2,x
$0c:d5f6  15 d0		 ora $d0,x
$0c:d5f8  7f dd c0 ff   adc $ffc0dd,x
$0c:d5fc  c8			iny
$0c:d5fd  44 20 44	  mvp $44,$20
$0c:d600  01 10		 ora ($10,x)
$0c:d602  af 48 2b d0   lda $d02b48
$0c:d606  0b			phd
$0c:d607  d4 12		 pei ($12)
$0c:d609  f4 aa 1f	  pea $1faa
$0c:d60c  bb			tyx
$0c:d60d  ff 60 5f 0a   sbc $0a5f60,x
$0c:d611  4f 92 b9 86   eor $86b992
$0c:d615  96 64		 stx $64,y
$0c:d617  ed 10 69	  sbc $6910
$0c:d61a  0d f3 07	  ora $07f3
$0c:d61d  38			sec
$0c:d61e  e3 c4		 sbc $c4,s
$0c:d620  21 ff		 and ($ff,x)
$0c:d622  08			php
$0c:d623  df 92 73 c6   cmp $c67392,x
$0c:d627  bc 61 ff	  ldy $ff61,x
$0c:d62a  30 6c		 bmi $d698
$0c:d62c  1d f3 8f	  ora $8ff3,x
$0c:d62f  38			sec
$0c:d630  f7 c4		 sbc [$c4],y
$0c:d632  23 91		 and $91,s
$0c:d634  49 f4 8a	  eor #$8af4
$0c:d637  ef 49 f0 e0   sbc $e0f049
$0c:d63b  7c 70 2f	  jmp ($2f70,x)
$0c:d63e  ae 1a fb	  ldx $fb1a
$0c:d641  58			cli
$0c:d642  9f cc 3c 70   sta $703ccc,x
$0c:d646  8e 0c 73	  stx $730c
$0c:d649  01 3e		 ora ($3e,x)
$0c:d64b  8f 58 23 9e   sta $9e2358
$0c:d64f  18			clc
$0c:d650  c5 8f		 cmp $8f
$0c:d652  01 27		 ora ($27,x)
$0c:d654  e0 43		 cpx #$43
$0c:d656  f8			sed
$0c:d657  d2 9c		 cmp ($9c)
$0c:d659  95 12		 sta $12,x
$0c:d65b  23 92		 and $92,s
$0c:d65d  ac 68 63	  ldy $6368
$0c:d660  94 08		 sty $08,x
$0c:d662  e4 96		 cpx $96
$0c:d664  93 12		 sta ($12,s),y
$0c:d666  a1 53		 lda ($53,x)
$0c:d668  62 1e f1	  per $c789
$0c:d66b  e0 5b		 cpx #$5b
$0c:d66d  30 70		 bmi $d6df
$0c:d66f  6f ce 1e f1   adc $f11ece
$0c:d673  c2 9c		 rep #$9c
$0c:d675  f9 23 7b	  sbc $7b23,y
$0c:d678  08			php
$0c:d679  7c ef e9	  jmp ($e9ef,x)
$0c:d67c  6b			rtl
$0c:d67d  ec 7d f3	  cpx $f37d
$0c:d680  9b			txy
$0c:d681  3a			dec a
$0c:d682  76 97		 ror $97,x
$0c:d684  3f 77 e4 dd   and $dde477,x
$0c:d688  bc 75 cd	  ldy $cd75,x
$0c:d68b  b8			clv
$0c:d68c  fc 24 fd	  jsr ($fd24,x)
$0c:d68f  8b			phb
$0c:d690  1e 73 c2	  asl $c273,x
$0c:d693  65 0c		 adc $0c
$0c:d695  fc f8 c2	  jsr ($c2f8,x)
$0c:d698  05 f0		 ora $f0
$0c:d69a  fb			xce
$0c:d69b  c5 fe		 cmp $fe
$0c:d69d  16 3e		 asl $3e,x
$0c:d69f  85 27		 sta $27
$0c:d6a1  f3 55		 sbc ($55,s),y
$0c:d6a3  f9 65 ee	  sbc $ee65,y
$0c:d6a6  12 35		 ora ($35)
$0c:d6a8  90 ad		 bcc $d657
$0c:d6aa  c2 1f		 rep #$1f
$0c:d6ac  00 5f		 brk #$5f
$0c:d6ae  84 19		 sty $19
$0c:d6b0  80 2b		 bra $d6dd
$0c:d6b2  f6 c3		 inc $c3,x
$0c:d6b4  dc f9 12	  jml [$12f9]
$0c:d6b7  b8			clv
$0c:d6b8  fc 2f a5	  jsr ($a52f,x)
$0c:d6bb  36 a3		 rol $a3,x
$0c:d6bd  cc eb 1a	  cpy $1aeb
$0c:d6c0  b8			clv
$0c:d6c1  74 6f		 stz $6f,x
$0c:d6c3  b1 2b		 lda ($2b),y
$0c:d6c5  fe 40 3e	  inc $3e40,x
$0c:d6c8  8e 01 fe	  stx $fe01
$0c:d6cb  c0 1b e8	  cpy #$e81b
$0c:d6ce  e1 09		 sbc ($09,x)
$0c:d6d0  27 fa		 and [$fa]
$0c:d6d2  93 b4		 sta ($b4,s),y
$0c:d6d4  da			phx
$0c:d6d5  d3 a1		 cmp ($a1,s),y
$0c:d6d7  b1 8e		 lda ($8e),y
$0c:d6d9  ff c6 1b a2   sbc $a21bc6,x
$0c:d6dd  fa			plx
$0c:d6de  6c 30 7b	  jmp ($7b30)
$0c:d6e1  41 68		 eor ($68,x)
$0c:d6e3  7e e0 ff	  ror $ffe0,x
$0c:d6e6  08			php
$0c:d6e7  7f 82 3d 00   adc $003d82,x
$0c:d6eb  8d d4 22	  sta $22d4
$0c:d6ee  f4 08 fd	  pea $fd08
$0c:d6f1  22 3d a4 ad   jsl $ada43d
$0c:d6f5  d5 2d		 cmp $2d,x
$0c:d6f7  fa			plx
$0c:d6f8  ab			plb
$0c:d6f9  ae c6 31	  ldx $31c6
$0c:d6fc  7f c7 ec e8   adc $e8ecc7,x
$0c:d700  32 88		 and ($88)
$0c:d702  57 02		 eor [$02],y
$0c:d704  54 ff 0c	  mvn $0c,$ff
$0c:d707  ff 80 7e 10   sbc $107e80,x
$0c:d70b  7b			tdc
$0c:d70c  c4 03		 cpy $03
$0c:d70e  b1 0e		 lda ($0e),y
$0c:d710  f4 41 ff	  pea $ff41
$0c:d713  11 7b		 ora ($7b),y
$0c:d715  c6 b6		 dec $b6
$0c:d717  85 d1		 sta $d1
$0c:d719  84 6b		 sty $6b
$0c:d71b  e0 1b 68	  cpx #$681b
$0c:d71e  17 56		 ora [$56],y
$0c:d720  45 a8		 eor $a8
$0c:d722  b2 fd		 lda ($fd)
$0c:d724  e8			inx
$0c:d725  18			clc
$0c:d726  aa			tax
$0c:d727  9c 02 3f	  stz $3f02
$0c:d72a  00 9f		 brk #$9f
$0c:d72c  40			rti
$0c:d72d  04 c1		 tsb $c1
$0c:d72f  6b			rtl
$0c:d730  80 5b		 bra $d78d
$0c:d732  e0 17 f8	  cpx #$f817
$0c:d735  05 e6		 ora $e6
$0c:d737  01 77		 ora ($77,x)
$0c:d739  d8			cld
$0c:d73a  51 f1		 eor ($f1),y
$0c:d73c  d1 2f		 cmp ($2f),y
$0c:d73e  8c 16 1d	  sty $1d16
$0c:d741  01 a5		 ora ($a5,x)
$0c:d743  79 63 91	  adc $9163,y
$0c:d746  7b			tdc
$0c:d747  ae 23 b5	  ldx $b523
$0c:d74a  cb			wai
$0c:d74b  80 7e		 bra $d7cb
$0c:d74d  20 22 60	  jsr $6022
$0c:d750  8f 50 3e d0   sta $d03e50
$0c:d754  0f b6 83 fd   ora $fd83b6
$0c:d758  02 cf		 cop #$cf
$0c:d75a  40			rti
$0c:d75b  3d d6 ad	  and $add6,x
$0c:d75e  9f a2 67 d1   sta $d167a2,x
$0c:d762  8b			phb
$0c:d763  51 f3		 eor ($f3),y
$0c:d765  d8			cld
$0c:d766  f8			sed
$0c:d767  85 83		 sta $83
$0c:d769  7f f7 bf f1   adc $f1bff7,x
$0c:d76d  38			sec
$0c:d76e  9c c8 01	  stz $01c8
$0c:d771  fc 3d 10	  jsr ($103d,x)
$0c:d774  0f 02 10 78   ora $781002
$0c:d778  10 0c		 bpl $d786
$0c:d77a  04 02		 tsb $02
$0c:d77c  77 00		 adc [$00],y
$0c:d77e  ed 7e df	  sbc $df7e
$0c:d781  e1 a6		 sbc ($a6,x)
$0c:d783  bf d7 7b bb   lda $bb7bd7,x
$0c:d787  7a			ply
$0c:d788  44 07 fd	  mvp $fd,$07
$0c:d78b  f6 ff		 inc $ff,x
$0c:d78d  d9 6c b0	  cmp $b06c,y
$0c:d790  48			pha
$0c:d791  02 80		 cop #$80
$0c:d793  a4 4a		 ldy $4a
$0c:d795  03 50		 ora $50,s
$0c:d797  06 6a		 asl $6a
$0c:d799  01 f0		 ora ($f0,x)
$0c:d79b  fe 5d 7f	  inc $7f5d,x
$0c:d79e  3f 7f cf 87   and $87cf7f,x
$0c:d7a2  fb			xce
$0c:d7a3  f5 fc		 sbc $fc,x
$0c:d7a5  f4 bf 1f	  pea $1fbf
$0c:d7a8  5f df fb e0   eor $e0fbdf,x
$0c:d7ac  ff 0f f3 01   sbc $01f30f,x
$0c:d7b0  57 e4		 eor [$e4],y
$0c:d7b2  ff 09 af f3   sbc $f3af09,x
$0c:d7b6  db			stp
$0c:d7b7  2c 8a ff	  bit $ff8a
$0c:d7ba  28			plp
$0c:d7bb  bf cd bd 3a   lda $3abdcd,x
$0c:d7bf  13 f4		 ora ($f4,s),y
$0c:d7c1  5e 05 96	  lsr $9605,x
$0c:d7c4  cf 03 80 44   cmp $448003
$0c:d7c8  e0 0d f0	  cpx #$f00d
$0c:d7cb  6f 84 05 c8   adc $c80584
$0c:d7cf  79 85 18	  adc $1885,y
$0c:d7d2  7f ef 58 5b   adc $5b58ef,x
$0c:d7d6  d6 06		 dec $06,x
$0c:d7d8  7d c1 9b	  adc $9bc1,x
$0c:d7db  62 6e d8	  per $b04c
$0c:d7de  1b			tcs
$0c:d7df  f6 05		 inc $05,x
$0c:d7e1  90 2f		 bcc $d812
$0c:d7e3  ed fb ff	  sbc $fffb
$0c:d7e6  f0 21		 beq $d809
$0c:d7e8  11 d0		 ora ($d0),y
$0c:d7ea  85 03		 sta $03
$0c:d7ec  43 85		 eor $85,s
$0c:d7ee  c0 e1 70	  cpy #$70e1
$0c:d7f1  bf f4 88 40   lda $4088f4,x
$0c:d7f5  2f c2 03 af   and $af03c2
$0c:d7f9  08			php
$0c:d7fa  06 f4		 asl $f4
$0c:d7fc  a0 1b 94	  ldy #$941b
$0c:d7ff  0a			asl a
$0c:d800  a1 90		 lda ($90,x)
$0c:d802  e2 60		 sep #$60
$0c:d804  2c d8 59	  bit $59d8
$0c:d807  df 12 29 f8   cmp $f82912,x
$0c:d80b  c6 dc		 dec $dc
$0c:d80d  3b			tsc
$0c:d80e  f2 1e		 sbc ($1e)
$0c:d810  ec 03 5f	  cpx $5f03
$0c:d813  00 df		 brk #$df
$0c:d815  c0 2f 70	  cpy #$702f
$0c:d818  0b			phd
$0c:d819  e4 02		 cpx $02
$0c:d81b  67 00		 adc [$00]
$0c:d81d  87 c0		 sta [$c0]
$0c:d81f  0d 81 e3	  ora $e381
$0c:d822  84 70		 sty $70
$0c:d824  63 98		 adc $98,s
$0c:d826  89 f4		 bit #$f4
$0c:d828  7a			ply
$0c:d829  c1 1c		 cmp ($1c,x)
$0c:d82b  f0 c2		 beq $d7ef
$0c:d82d  ae 78 29	  ldx $2978
$0c:d830  2f 02 1f f7   and $f71f02
$0c:d834  84 78		 sty $78
$0c:d836  e3 9c		 sbc $9c,s
$0c:d838  19 f6 7e	  ora $7ef6,y
$0c:d83b  c1 1e		 cmp ($1e,x)
$0c:d83d  f0 e7		 beq $d826
$0c:d83f  2c 7d 89	  bit $897d
$0c:d842  3f c2 1f 39   and $391fc2,x
$0c:d846  f7 db		 sbc [$db],y
$0c:d848  7a			ply
$0c:d849  de ec 1e	  dec $1eec,x
$0c:d84c  9f f3 e3 ae   sta $aee3f3,x
$0c:d850  78			sei
$0c:d851  e7 3b		 sbc [$3b]
$0c:d853  6a			ror a
$0c:d854  de f6 1f	  dec $1ff6,x
$0c:d857  10 f7		 bpl $d850
$0c:d859  ce 38 f7	  dec $f738
$0c:d85c  cc 1c 1b	  cpy $1b1c
$0c:d85f  f3 87		 sbc ($87,s),y
$0c:d861  bc 71 a7	  ldy $a771,x
$0c:d864  3e 48 d9	  rol $d948,x
$0c:d867  b4 38		 ldy $38,x
$0c:d869  93 0c		 sta ($0c,s),y
$0c:d86b  a5 32		 lda $32
$0c:d86d  10 91		 bpl $d800
$0c:d86f  08			php
$0c:d870  15 6b		 ora $6b,x
$0c:d872  8b			phb
$0c:d873  88			dey
$0c:d874  a0 e2 6d	  ldy #$6de2
$0c:d877  5a			phy
$0c:d878  38			sec
$0c:d879  a4 3f		 ldy $3f
$0c:d87b  e1 23		 sbc ($23,x)
$0c:d87d  ec 58 f3	  cpx $f358
$0c:d880  9e 18 f4	  stz $f418,x
$0c:d883  83 3e		 sta $3e,s
$0c:d885  f5 08		 sbc $08,x
$0c:d887  a1 3c		 lda ($3c,x)
$0c:d889  3e f2 5e	  rol $5ef2,x
$0c:d88c  85 23		 sta $23
$0c:d88e  f1 31		 sbc ($31),y
$0c:d890  df cc 30 14   cmp $1430cc,x
$0c:d894  fe 45 23	  inc $2345,x
$0c:d897  91 61		 sta ($61),y
$0c:d899  f4 e0 ef	  pea $efe0
$0c:d89c  e4 b0		 cpx $b0
$0c:d89e  83 c0		 sta $c0,s
$0c:d8a0  28			plp
$0c:d8a1  10 0b		 bpl $d8ae
$0c:d8a3  fc 02 6e	  jsr ($6e02,x)
$0c:d8a6  c6 18		 dec $18
$0c:d8a8  b4 01		 ldy $01,x
$0c:d8aa  98			tya
$0c:d8ab  1a			inc a
$0c:d8ac  d8			cld
$0c:d8ad  7d 4a bd	  adc $bd4a,x
$0c:d8b0  65 fe		 adc $fe
$0c:d8b2  41 60		 eor ($60,x)
$0c:d8b4  76 bc		 ror $bc,x
$0c:d8b6  c4 06		 cpy $06
$0c:d8b8  11 3b		 ora ($3b),y
$0c:d8ba  99 5e 7f	  sta $7f5e,y
$0c:d8bd  ff 08 06 86   sbc $860608,x
$0c:d8c1  01 03		 ora ($03,x)
$0c:d8c3  80 3f		 bra $d904
$0c:d8c5  93 9a		 sta ($9a,s),y
$0c:d8c7  cc 1a b7	  cpy $b71a
$0c:d8ca  bb			tyx
$0c:d8cb  13 77		 ora ($77,s),y
$0c:d8cd  e1 48		 sbc ($48,x)
$0c:d8cf  69 7e		 adc #$7e
$0c:d8d1  ce 94 97	  dec $9794
$0c:d8d4  4d 45 9a	  eor $9a45
$0c:d8d7  c1 aa		 cmp ($aa,x)
$0c:d8d9  5b			tcd
$0c:d8da  d8			cld
$0c:d8db  0c 7c 94	  tsb $947c
$0c:d8de  31 ff		 and ($ff),y
$0c:d8e0  84 07		 sty $07
$0c:d8e2  f0 06		 beq $d8ea
$0c:d8e4  08			php
$0c:d8e5  18			clc
$0c:d8e6  1c 01 81	  trb $8101
$0c:d8e9  af 9a d5 ad   lda $add59a
$0c:d8ed  f4 0c bf	  pea $bf0c
$0c:d8f0  ae 4f d1	  ldx $d14f
$0c:d8f3  c7 4b		 cmp [$4b]
$0c:d8f5  ac 3d 5d	  ldy $5d3d
$0c:d8f8  87 96		 sta [$96]
$0c:d8fa  37 c2		 and [$c2],y
$0c:d8fc  fc 60 1b	  jsr ($1b60,x)
$0c:d8ff  e1 e8		 sbc ($e8,x)
$0c:d901  8f e0 27 fc   sta $fc27e0
$0c:d905  0c f9 74	  tsb $74f9
$0c:d908  30 0c		 bmi $d916
$0c:d90a  c0 eb c3	  cpy #$c3eb
$0c:d90d  75 90		 adc $90,x
$0c:d90f  ac b4 2a	  ldy $2ab4
$0c:d912  5f 9b a8 e2   eor $e2a89b,x
$0c:d916  e9 dc		 sbc #$dc
$0c:d918  1b			tcs
$0c:d919  2f 8b b5 10   and $10b58b
$0c:d91d  80 5f		 bra $d97e
$0c:d91f  e0 24 01	  cpx #$0124
$0c:d922  1f 84 02 7e   ora $7e0284,x
$0c:d926  47 18		 eor [$18]
$0c:d928  fd 82 0f	  sbc $0f82,x
$0c:d92b  14 ad		 trb $ad
$0c:d92d  f5 6e		 sbc $6e,x
$0c:d92f  5a			phy
$0c:d930  a8			tay
$0c:d931  8d b6 91	  sta $91b6
$0c:d934  95 ec		 sta $ec,x
$0c:d936  5a			phy
$0c:d937  72 7a		 adc ($7a)
$0c:d939  2a			rol a
$0c:d93a  35 56		 and $56,x
$0c:d93c  19 a0 ff	  ora $ffa0,y
$0c:d93f  60			rts
$0c:d940  3f dc 0f f6   and $f60fdc,x
$0c:d944  43 fd		 eor $fd,s
$0c:d946  00 33		 brk #$33
$0c:d948  07 f0		 ora [$f0]
$0c:d94a  10 3e		 bpl $d98a
$0c:d94c  0d 15 77	  ora $7715
$0c:d94f  55 6a		 eor $6a,x
$0c:d951  a8			tay
$0c:d952  f3 a4		 sbc ($a4,s),y
$0c:d954  99 bb 57	  sta $57bb,y
$0c:d957  42 09		 wdm #$09
$0c:d959  93 90		 sta ($90,s),y
$0c:d95b  65 ea		 adc $ea
$0c:d95d  1e 76 60	  asl $6076,x
$0c:d960  45 48		 eor $48
$0c:d962  e2 46		 sep #$46
$0c:d964  22 22 71 27   jsl $277122
$0c:d968  75 6a		 adc $6a,x
$0c:d96a  bc 17 f7	  ldy $f717,x
$0c:d96d  52 f6		 eor ($f6)
$0c:d96f  54 21 d9	  mvn $d9,$21
$0c:d972  3f ee ca f9   and $f9caee,x
$0c:d976  29 eb		 and #$eb
$0c:d978  b3 03		 lda ($03,s),y
$0c:d97a  50 67		 bvc $d9e3
$0c:d97c  17 29		 ora [$29],y
$0c:d97e  28			plp
$0c:d97f  c8			iny
$0c:d980  cc 1a ab	  cpy $ab1a
$0c:d983  15 43		 ora $43,x
$0c:d985  9e 75 1c	  stz $1c75,x
$0c:d988  84 13		 sty $13
$0c:d98a  67 40		 adc [$40]
$0c:d98c  eb			xba
$0c:d98d  9f 42 45 97   sta $974542,x
$0c:d991  8e a1 94	  stx $94a1
$0c:d994  8c 84 40	  sty $4084
$0c:d997  a5 40		 lda $40
$0c:d999  e0 ff 94	  cpx #$94ff
$0c:d99c  a8			tay
$0c:d99d  54 a1 89	  mvn $89,$a1
$0c:d9a0  90 d9		 bcc $d97b
$0c:d9a2  df 53 a1 02   cmp $02a153,x
$0c:d9a6  fe 7f 14	  inc $147f,x
$0c:d9a9  4e 66 25	  lsr $2566
$0c:d9ac  28			plp
$0c:d9ad  6d 30 14	  adc $1430
$0c:d9b0  49 dc		 eor #$dc
$0c:d9b2  26 ed		 rol $ed
$0c:d9b4  17 b3		 ora [$b3],y
$0c:d9b6  f2 ac		 sbc ($ac)
$0c:d9b8  50 4b		 bvc $da05
$0c:d9ba  05 52		 ora $52
$0c:d9bc  67 09		 adc [$09]
$0c:d9be  b5 91		 lda $91,x
$0c:d9c0  01 4a		 ora ($4a,x)
$0c:d9c2  5f 88 07 f5   eor $f50788,x
$0c:d9c6  4c 3e f8	  jmp $f83e
$0c:d9c9  07 de		 ora [$de]
$0c:d9cb  01 92		 ora ($92,x)
$0c:d9cd  80 40		 bra $da0f
$0c:d9cf  7f da ca fe   adc $fecada,x
$0c:d9d3  bf 4d d7 e3   lda $e3d74d,x
$0c:d9d7  69 62		 adc #$62
$0c:d9d9  dc ef bf	  jml [$bfef]
$0c:d9dc  9f ac a5 25   sta $25a5ac,x
$0c:d9e0  28			plp
$0c:d9e1  57 c8		 eor [$c8],y
$0c:d9e3  e2 1f		 sep #$1f
$0c:d9e5  49 66		 eor #$66
$0c:d9e7  0a			asl a
$0c:d9e8  a5 3f		 lda $3f
$0c:d9ea  d7 df		 cmp [$df],y
$0c:d9ec  f7 37		 sbc [$37],y
$0c:d9ee  9a			txs
$0c:d9ef  96 b6		 stx $b6,y
$0c:d9f1  11 c0		 ora ($c0),y
$0c:d9f3  9a			txs
$0c:d9f4  62 e4 39	  per $13db
$0c:d9f7  fc 00 7c	  jsr ($7c00,x)
$0c:d9fa  e0 df		 cpx #$df
$0c:d9fc  f1 f8		 sbc ($f8),y
$0c:d9fe  70 08		 bvs $da08
$0c:da00  c2 47		 rep #$47
$0c:da02  18			clc
$0c:da03  5e 83 8b	  lsr $8b83,x
$0c:da06  d0 f1		 bne $d9f9
$0c:da08  da			phx
$0c:da09  2e 31 4f	  rol $4f31
$0c:da0c  50 90		 bvc $d99e
$0c:da0e  34 14		 bit $14,x
$0c:da10  f8			sed
$0c:da11  87 9e		 sta [$9e]
$0c:da13  17 ff		 ora [$ff],y
$0c:da15  82 ff e0	  brl $bb17
$0c:da18  7f fc 0f fe   adc $fe0ffc,x
$0c:da1c  05 ff		 ora $ff
$0c:da1e  af ff e1 ff   lda $ffe1ff
$0c:da22  f8			sed
$0c:da23  3f fe 91 c8   and $c891fe,x
$0c:da27  d0 78		 bne $daa1
$0c:da29  2a			rol a
$0c:da2a  b7 0d		 lda [$0d],y
$0c:da2c  5c fe a1 1f   jml $1fa1fe
$0c:da30  9d c5 f7	  sta $f7c5,x
$0c:da33  d9 49 ec	  cmp $ec49,y
$0c:da36  57 6f		 eor [$6f],y
$0c:da38  80 af		 bra $d9e9
$0c:da3a  d0 35		 bne $da71
$0c:da3c  f2 0e		 sbc ($0e)
$0c:da3e  84 43		 sty $43
$0c:da40  df 0f f0 40   cmp $40f00f,x
$0c:da44  2c 70 0f	  bit $0f70
$0c:da47  14 02		 trb $02
$0c:da49  0d 03 86	  ora $8603
$0c:da4c  c1 f7		 cmp ($f7,x)
$0c:da4e  50 ee		 bvc $da3e
$0c:da50  a7 72		 lda [$72]
$0c:da52  13 f8		 ora ($f8,s),y
$0c:da54  b6 5f		 ldx $5f,y
$0c:da56  31 19		 and ($19),y
$0c:da58  8c 54 6b	  sty $6b54
$0c:da5b  fb			xce
$0c:da5c  01 fd		 ora ($fd,x)
$0c:da5e  40			rti
$0c:da5f  be b0 49	  ldx $49b0,y
$0c:da62  5c 23 ef f0   jml $f0ef23
$0c:da66  c9 c4		 cmp #$c4
$0c:da68  2e f1 0f	  rol $0ff1
$0c:da6b  ac 43 03	  ldy $0343
$0c:da6e  7f bd 7a aa   adc $aa7abd,x
$0c:da72  3c 4a ef	  bit $ef4a,x
$0c:da75  12 d7		 ora ($d7)
$0c:da77  d9 a6 fe	  cmp $fea6,y
$0c:da7a  af 7d 2c 36   lda $362c7d
$0c:da7e  76 01		 ror $01,x
$0c:da80  08			php
$0c:da81  80 c3		 bra $da46
$0c:da83  25 71		 and $71
$0c:da85  c8			iny
$0c:da86  4c fa 18	  jmp $18fa
$0c:da89  c6 09		 dec $09
$0c:da8b  fc 32 7b	  jsr ($7b32,x)
$0c:da8e  40			rti
$0c:da8f  9f ab db 57   sta $57dbab,x
$0c:da93  98			tya
$0c:da94  86 de		 stx $de
$0c:da96  bb			tyx
$0c:da97  75 2d		 adc $2d,x
$0c:da99  32 f9		 and ($f9)
$0c:da9b  b7 d0		 lda [$d0],y
$0c:da9d  df f6 35 d0   cmp $d035f6,x
$0c:daa1  3c 1f f7	  bit $f71f,x
$0c:daa4  9a			txs
$0c:daa5  bb			tyx
$0c:daa6  fa			plx
$0c:daa7  a8			tay
$0c:daa8  d1 ff		 cmp ($ff),y
$0c:daaa  9f 9a bf f2   sta $f2bf9a,x
$0c:daae  a3 7d		 lda $7d,s
$0c:dab0  eb			xba
$0c:dab1  4d b3 9c	  eor $9cb3
$0c:dab4  89 84		 bit #$84
$0c:dab6  02 01		 cop #$01
$0c:dab8  04 7f		 tsb $7f
$0c:daba  83 fc		 sta $fc,s
$0c:dabc  20 30 28	  jsr $2830
$0c:dabf  1c 02 0f	  trb $0f02
$0c:dac2  40			rti
$0c:dac3  83 c1		 sta $c1,s
$0c:dac5  20 f2 9f	  jsr $9ff2
$0c:dac8  3e 9b dd	  rol $dd9b,x
$0c:dacb  54 de 49	  mvn $49,$de
$0c:dace  67 9d		 adc [$9d]
$0c:dad0  f9 b4 a6	  sbc $a6b4,y
$0c:dad3  39 19 86	  and $8619,y
$0c:dad6  70 e0		 bvs $dab8
$0c:dad8  91 08		 sta ($08),y
$0c:dada  04 46		 tsb $46
$0c:dadc  00 08		 brk #$08
$0c:dade  0e 1f c2	  asl $c21f
$0c:dae1  03 f8		 ora $f8,s
$0c:dae3  81 8a		 sta ($8a,x)
$0c:dae5  06 17		 asl $17
$0c:dae7  b8			clv
$0c:dae8  94 cc		 sty $cc,x
$0c:daea  fa			plx
$0c:daeb  d1 4e		 cmp ($4e),y
$0c:daed  54 76 c9	  mvn $c9,$76
$0c:daf0  bc d9 c9	  ldy $c9d9,x
$0c:daf3  3a			dec a
$0c:daf4  93 8e		 sta ($8e,s),y
$0c:daf6  c4 c2		 cpy $c2
$0c:daf8  93 a2		 sta ($a2,s),y
$0c:dafa  e6 40		 inc $40
$0c:dafc  3d 30 2f	  and $2f30,x
$0c:daff  04 0b		 tsb $0b
$0c:db01  87 07		 sta [$07]
$0c:db03  e4 43		 cpx $43
$0c:db05  f8			sed
$0c:db06  11 f2		 ora ($f2),y
$0c:db08  48			pha
$0c:db09  74 22		 stz $22,x
$0c:db0b  f8			sed
$0c:db0c  0e ec a3	  asl $a3ec
$0c:db0f  bb			tyx
$0c:db10  90 ea		 bcc $dafc
$0c:db12  e6 be		 inc $be
$0c:db14  f2 0c		 sbc ($0c)
$0c:db16  ae aa eb	  ldx $ebaa
$0c:db19  fa			plx
$0c:db1a  9b			txy
$0c:db1b  d0 22		 bne $db3f
$0c:db1d  f2 28		 sbc ($28)
$0c:db1f  01 7c		 ora ($7c,x)
$0c:db21  25 4d		 and $4d
$0c:db23  f0 e0		 beq $db05
$0c:db25  52 bc		 eor ($bc)
$0c:db27  10 af		 bpl $dad8
$0c:db29  04 22		 tsb $22
$0c:db2b  c1 28		 cmp ($28,x)
$0c:db2d  f0 48		 beq $db77
$0c:db2f  b2 f6		 lda ($f6)
$0c:db31  ae ad 03	  ldx $03ad
$0c:db34  ef 2b cb d8   sbc $d8cb2b
$0c:db38  bb			tyx
$0c:db39  b2 4c		 lda ($4c)
$0c:db3b  dd 77 81	  cmp $8177,x
$0c:db3e  36 fa		 rol $fa,x
$0c:db40  5f e0 13 f4   eor $f413e0,x
$0c:db44  00 9f		 brk #$9f
$0c:db46  c8			iny
$0c:db47  fe 50 b8	  inc $b850,x
$0c:db4a  04 0b		 tsb $0b
$0c:db4c  f9 52 fe	  sbc $fe52,y
$0c:db4f  57 76		 eor [$76],y
$0c:db51  ff 2f e4 13   sbc $13e42f,x
$0c:db55  fd 9d ff	  sbc $ff9d,x
$0c:db58  da			phx
$0c:db59  20 b5 7a	  jsr $7ab5
$0c:db5c  bf fe 00 9f   lda $9f00fe,x
$0c:db60  0f f2 80 24   ora $2480f2
$0c:db64  0a			asl a
$0c:db65  11 4b		 ora ($4b),y
$0c:db67  84 03		 sty $03
$0c:db69  51 00		 eor ($00),y
$0c:db6b  38			sec
$0c:db6c  a5 0b		 lda $0b
$0c:db6e  fb			xce
$0c:db6f  64 ed		 stz $ed
$0c:db71  cb			wai
$0c:db72  78			sei
$0c:db73  14 2e		 trb $2e
$0c:db75  15 5b		 ora $5b,x
$0c:db77  e8			inx
$0c:db78  81 64		 sta ($64,x)
$0c:db7a  09 4f		 ora #$4f
$0c:db7c  51 82		 eor ($82),y
$0c:db7e  91 0a		 sta ($0a),y
$0c:db80  f6 d1		 inc $d1,x
$0c:db82  2a			rol a
$0c:db83  10 6f		 bpl $dbf4
$0c:db85  e6 7b		 inc $7b
$0c:db87  f8			sed
$0c:db88  9b			txy
$0c:db89  0c ac 06	  tsb $06ac
$0c:db8c  a7 53		 lda [$53]
$0c:db8e  4f 92 94 bf   eor $bf9492
$0c:db92  ea			nop
$0c:db93  a1 51		 lda ($51,x)
$0c:db95  86 b0		 stx $b0
$0c:db97  0a			asl a
$0c:db98  16 3c		 asl $3c,x
$0c:db9a  95 c6		 sta $c6,x
$0c:db9c  8b			phb
$0c:db9d  23 84		 and $84,s
$0c:db9f  59 f5 d7	  eor $d7f5,y
$0c:dba2  18			clc
$0c:dba3  dd fe ff	  cmp $fffe,x
$0c:dba6  3f ec 69 d3   and $d369ec,x
$0c:dbaa  e1 ef		 sbc ($ef,x)
$0c:dbac  70 10		 bvs $dbbe
$0c:dbae  09 20		 ora #$20
$0c:dbb0  48			pha
$0c:dbb1  50 e5		 bvc $db98
$0c:dbb3  7d ec df	  adc $dfec,x
$0c:dbb6  f9 7f da	  sbc $da7f,y
$0c:dbb9  2d ff d7	  and $d7ff
$0c:dbbc  57 ff		 eor [$ff],y
$0c:dbbe  df fd e7 ff   cmp $ffe7fd,x
$0c:dbc2  23 6e		 and $6e,s
$0c:dbc4  ff d0 00 ac   sbc $ac00d0,x
$0c:dbc8  9f 18 c2 7c   sta $7cc218,x
$0c:dbcc  22 e0 10 f4   jsl $f410e0
$0c:dbd0  c4 b8		 cpy $b8
$0c:dbd2  04 80		 tsb $80
$0c:dbd4  8a			txa
$0c:dbd5  72 e0		 adc ($e0)
$0c:dbd7  1f a8 57 02   ora $0257a8,x
$0c:dbdb  1d e1 e0	  ora $e0e1,x
$0c:dbde  7f fd 3f f1   adc $f13ffd,x
$0c:dbe2  f8			sed
$0c:dbe3  10 cb		 bpl $dbb0
$0c:dbe5  f4 42 1f	  pea $1f42
$0c:dbe8  02 68		 cop #$68
$0c:dbea  2e 70 08	  rol $0870
$0c:dbed  ff 42 0f 28   sbc $280f42,x
$0c:dbf1  c1 f4		 cmp ($f4,x)
$0c:dbf3  3c f0 08	  bit $08f0,x
$0c:dbf6  7e 42 0f	  ror $0f42,x
$0c:dbf9  90 b1		 bcc $dbac
$0c:dbfb  e0 ff		 cpx #$ff
$0c:dbfd  f1 ff		 sbc ($ff),y
$0c:dbff  fc 1f ff	  jsr ($ff1f,x)
$0c:dc02  03 31		 ora $31,s
$0c:dc04  0c 3c c4	  tsb $c43c
$0c:dc07  71 68		 adc ($68),y
$0c:dc09  f4 a2 19	  pea $19a2
$0c:dc0c  05 83		 ora $83
$0c:dc0e  46 a2		 lsr $a2
$0c:dc10  74 6a		 stz $6a,x
$0c:dc12  1c 12 03	  trb $0312
$0c:dc15  9c 84 c9	  stz $c984
$0c:dc18  a0 7e		 ldy #$7e
$0c:dc1a  98			tya
$0c:dc1b  47 de		 eor [$de]
$0c:dc1d  09 fb		 ora #$fb
$0c:dc1f  81 7b		 sta ($7b,x)
$0c:dc21  20 1b c5	  jsr $c51b
$0c:dc24  10 fd		 bpl $dc23
$0c:dc26  a0 1f		 ldy #$1f
$0c:dc28  c8			iny
$0c:dc29  04 f2		 tsb $f2
$0c:dc2b  11 50		 ora ($50),y
$0c:dc2d  98			tya
$0c:dc2e  48			pha
$0c:dc2f  3c 1c 2a	  bit $2a1c,x
$0c:dc32  17 22		 ora [$22],y
$0c:dc34  91 c0		 sta ($c0),y
$0c:dc36  a0 78		 ldy #$78
$0c:dc38  6c 1d 4a	  jmp ($4a1d)
$0c:dc3b  21 60		 and ($60,x)
$0c:dc3d  39 f0 0c	  and $0cf0,y
$0c:dc40  fb			xce
$0c:dc41  28			plp
$0c:dc42  66 ec		 ror $ec
$0c:dc44  41 8f		 eor ($8f,x)
$0c:dc46  c0 27		 cpy #$27
$0c:dc48  70 0c		 bvs $dc56
$0c:dc4a  c5 ae		 cmp $ae
$0c:dc4c  e7 e5		 sbc [$e5]
$0c:dc4e  ae 71 6d	  ldx $6d71
$0c:dc51  7d 8a 6f	  adc $6f8a,x
$0c:dc54  ea			nop
$0c:dc55  f7 d2		 sbc [$d2],y
$0c:dc57  a3 f5		 lda $f5,s
$0c:dc59  37 d8		 and [$d8],y
$0c:dc5b  12 c8		 ora ($c8)
$0c:dc5d  42 23		 wdm #$23
$0c:dc5f  f0 89		 beq $dbea
$0c:dc61  fc 36 7c	  jsr ($7c36,x)
$0c:dc64  c5 28		 cmp $28
$0c:dc66  4c f8 1a	  jmp $1af8
$0c:dc69  1d 9d 5e	  ora $5e9d,x
$0c:dc6c  ca			dex
$0c:dc6d  4d 5d a2	  eor $a25d
$0c:dc70  2d 63 81	  and $8163
$0c:dc73  ec e4 ff	  cpx $ffe4
$0c:dc76  31 3f		 and ($3f),y
$0c:dc78  e6 2c		 inc $2c
$0c:dc7a  6e aa 13	  ror $13aa
$0c:dc7d  4e f7 82	  lsr $82f7
$0c:dc80  9b			txy
$0c:dc81  9f b9 de ba   sta $badeb9,x
$0c:dc85  be 5a 74	  ldx $745a,y
$0c:dc88  cf b3 f0 a5   cmp $a5f0b3
$0c:dc8c  c1 21		 cmp ($21,x)
$0c:dc8e  f0 08		 beq $dc98
$0c:dc90  3c 4a 0e	  bit $0e4a,x
$0c:dc93  01 08		 ora ($08,x)
$0c:dc95  04 0e		 tsb $0e
$0c:dc97  21 01		 and ($01,x)
$0c:dc99  82 40 01	  brl $dddc
$0c:dc9c  61 95		 adc ($95,x)
$0c:dc9e  82 4a 63	  brl $3feb
$0c:dca1  9c 59 64	  stz $6459
$0c:dca4  a6 69		 ldx $69
$0c:dca6  d7 f7		 cmp [$f7],y
$0c:dca8  5d 73 93	  eor $9373,x
$0c:dcab  db			stp
$0c:dcac  26 8b		 rol $8b
$0c:dcae  dd 0b bc	  cmp $bc0b,x
$0c:dcb1  40			rti
$0c:dcb2  ff 11 3f c7   sbc $c73f11,x
$0c:dcb6  0f f1 01 f8   ora $f801f1
$0c:dcba  40			rti
$0c:dcbb  fc 19 38	  jsr ($3819,x)
$0c:dcbe  04 46		 tsb $46
$0c:dcc0  01 4b		 ora ($4b,x)
$0c:dcc2  d0 75		 bne $dd39
$0c:dcc4  27 1e		 and [$1e]
$0c:dcc6  39 a5 f7	  and $f7a5,y
$0c:dcc9  59 8b 8b	  eor $8b8b,y
$0c:dccc  d5 b3		 cmp $b3,x
$0c:dcce  36 5d		 rol $5d,x
$0c:dcd0  b5 a6		 lda $a6,x
$0c:dcd2  e7 d0		 sbc [$d0]
$0c:dcd4  8f 70 23 7c   sta $7c2370
$0c:dcd8  88			dey
$0c:dcd9  ff 0e 3f e0   sbc $e03f0e,x
$0c:dcdd  87 f8		 sta [$f8]
$0c:dcdf  20 fc 98	  jsr $98fc
$0c:dce2  06 32		 asl $32
$0c:dce4  01 7a		 ora ($7a,x)
$0c:dce6  93 f0		 sta ($f0,s),y
$0c:dce8  2a			rol a
$0c:dce9  b1 ad		 lda ($ad),y
$0c:dceb  bc b2 ab	  ldy $abb2,x
$0c:dcee  48			pha
$0c:dcef  da			phx
$0c:dcf0  ea			nop
$0c:dcf1  ae fa 4e	  ldx $4efa
$0c:dcf4  ac 23 bb	  ldy $bb23
$0c:dcf7  08			php
$0c:dcf8  d8			cld
$0c:dcf9  4a			lsr a
$0c:dcfa  bc 14 8f	  ldy $8f14,x
$0c:dcfd  06 2b		 asl $2b
$0c:dcff  c1 0a		 cmp ($0a,x)
$0c:dd01  e0 42		 cpx #$42
$0c:dd03  30 12		 bmi $dd17
$0c:dd05  a8			tay
$0c:dd06  04 8a		 tsb $8a
$0c:dd08  00 88		 brk #$88
$0c:dd0a  0b			phd
$0c:dd0b  ef fe b9 df   sbc $dfb9fe
$0c:dd0f  d2 eb		 cmp ($eb)
$0c:dd11  e9 7c		 sbc #$7c
$0c:dd13  ca			dex
$0c:dd14  a7 22		 lda [$22]
$0c:dd16  5b			tcd
$0c:dd17  e9 e2		 sbc #$e2
$0c:dd19  fa			plx
$0c:dd1a  60			rts
$0c:dd1b  26 e0		 rol $e0
$0c:dd1d  80 48		 bra $dd67
$0c:dd1f  20 15 f8	  jsr $f815
$0c:dd22  12 a4		 ora ($a4)
$0c:dd24  27 f0		 and [$f0]
$0c:dd26  88			dey
$0c:dd27  f4 01 16	  pea $1601
$0c:dd2a  11 6f		 ora ($6f),y
$0c:dd2c  f4 b2 f9	  pea $f9b2
$0c:dd2f  1a			inc a
$0c:dd30  ec 55 bc	  cpx $bc55
$0c:dd33  1c d8 04	  trb $04d8
$0c:dd36  ba			tsx
$0c:dd37  41 ca		 eor ($ca,x)
$0c:dd39  f1 e1		 sbc ($e1),y
$0c:dd3b  bd cb e0	  lda $e0cb,x
$0c:dd3e  c1 c0		 cmp ($c0,x)
$0c:dd40  24 f0		 bit $f0
$0c:dd42  0f fa 90 7b   ora $7b90fa
$0c:dd46  f0 08		 beq $dd50
$0c:dd48  e4 02		 cpx $02
$0c:dd4a  32 6e		 and ($6e)
$0c:dd4c  5d 7e be	  eor $be7e,x
$0c:dd4f  8d c6 ad	  sta $adc6
$0c:dd52  72 e4		 adc ($e4)
$0c:dd54  3e 1e 07	  rol $071e,x
$0c:dd57  80 fe		 bra $dd57
$0c:dd59  95 08		 sta $08,x
$0c:dd5b  04 e6		 tsb $e6
$0c:dd5d  01 34		 ora ($34,x)
$0c:dd5f  46 0c		 lsr $0c
$0c:dd61  7d 1c bd	  adc $bd1c,x
$0c:dd64  6f 87 b7 c1   adc $c1b787
$0c:dd68  de e0 6e	  dec $6ee0,x
$0c:dd6b  b0 76		 bcs $dde3
$0c:dd6d  68			pla
$0c:dd6e  72 7d		 adc ($7d)
$0c:dd70  00 00		 brk #$00
$0c:dd72  cd 04 38	  cmp $3804
$0c:dd75  5f 20 1f 93   eor $931f20,x
$0c:dd79  70 7f		 bvs $ddfa
$0c:dd7b  ea			nop
$0c:dd7c  7b			tdc
$0c:dd7d  e9 27		 sbc #$27
$0c:dd7f  6e 5b ff	  ror $ff5b
$0c:dd82  bc fa 2a	  ldy $2afa,x
$0c:dd85  ba			tsx
$0c:dd86  de 4d 5e	  dec $5e4d,x
$0c:dd89  3b			tsc
$0c:dd8a  e2 ff		 sep #$ff
$0c:dd8c  a9 42		 lda #$42
$0c:dd8e  01 db		 ora ($db,x)
$0c:dd90  ed e0 30	  sbc $30e0
$0c:dd93  18			clc
$0c:dd94  7c 06 0b	  jmp ($0b06,x)
$0c:dd97  00 83		 brk #$83
$0c:dd99  0e 07 02	  asl $0207
$0c:dd9c  03 fe		 ora $fe,s
$0c:dd9e  a8			tay
$0c:dd9f  ff e2 5e db   sbc $db5ee2,x
$0c:dda3  55 af		 eor $af,x
$0c:dda5  d9 00 a4	  cmp $a400,y
$0c:dda8  d2 eb		 cmp ($eb)
$0c:ddaa  5f ff 7c 43   eor $437cff,x
$0c:ddae  fd fe 40	  sbc $40fe,x
$0c:ddb1  87 b7		 sta [$b7]
$0c:ddb3  db			stp
$0c:ddb4  94 52		 sty $52,x
$0c:ddb6  0e d1 00	  asl $00d1
$0c:ddb9  28			plp
$0c:ddba  01 78		 ora ($78,x)
$0c:ddbc  2e 3a 81	  rol $813a
$0c:ddbf  b2 b9		 lda ($b9)
$0c:ddc1  55 f7		 eor $f7,x
$0c:ddc3  f2 ae		 sbc ($ae)
$0c:ddc5  ab			plb
$0c:ddc6  fd 90 e1	  sbc $e190,x
$0c:ddc9  0d 80 01	  ora $0180
$0c:ddcc  43 80		 eor $80,s
$0c:ddce  0e 5e 9f	  asl $9f5e
$0c:ddd1  6b			rtl
$0c:ddd2  57 36		 eor [$36],y
$0c:ddd4  ec 79 ed	  cpx $ed79
$0c:ddd7  99 59 cf	  sta $cf59,y
$0c:ddda  18			clc
$0c:dddb  3e 92 40	  rol $4092,x
$0c:ddde  60			rts
$0c:dddf  40			rti
$0c:dde0  20 30 18	  jsr $1830
$0c:dde3  94 42		 sty $42,x
$0c:dde5  81 40		 sta ($40,x)
$0c:dde7  9c fd b2	  stz $b2fd
$0c:ddea  81 a0		 sta ($a0,x)
$0c:ddec  de ed ea	  dec $eaed,x
$0c:ddef  52 9d		 eor ($9d)
$0c:ddf1  fd 3b 65	  sbc $653b,x
$0c:ddf4  2d f7 74	  and $74f7
$0c:ddf7  2e 18 6c	  rol $6c18
$0c:ddfa  34 ce		 bit $ce,x
$0c:ddfc  07 81		 ora [$81]
$0c:ddfe  c0 c3		 cpy #$c3
$0c:de00  20 14 08	  jsr $0814
$0c:de03  06 07		 asl $07
$0c:de05  01 90		 ora ($90,x)
$0c:de07  c0 39		 cpy #$39
$0c:de09  41 4a		 eor ($4a,x)
$0c:de0b  12 9e		 ora ($9e)
$0c:de0d  b4 43		 ldy $43,x
$0c:de0f  df 80 bf c8   cmp $c8bf80,x
$0c:de13  3b			tsc
$0c:de14  f8			sed
$0c:de15  eb			xba
$0c:de16  ff d2 49 d5   sbc $d549d2,x
$0c:de1a  f5 30		 sbc $30,x
$0c:de1c  43 ad		 eor $ad,s
$0c:de1e  d6 f7		 dec $f7,x
$0c:de20  fb			xce
$0c:de21  ef f7 f8 fc   sbc $fcf8f7
$0c:de25  7f 01 00 8d   adc $8d0001,x
$0c:de29  c0 20		 cpy #$20
$0c:de2b  50 29		 bvc $de56
$0c:de2d  d7 14		 cmp [$14],y
$0c:de2f  4c 3f f2	  jmp $f23f
$0c:de32  78			sei
$0c:de33  41 3f		 eor ($3f,x)
$0c:de35  7a			ply
$0c:de36  eb			xba
$0c:de37  55 57		 eor $57,x
$0c:de39  8d e5 8e	  sta $8ee5
$0c:de3c  71 78		 adc ($78),y
$0c:de3e  af f0 7f 80   lda $807ff0
$0c:de42  7c 3f 1f	  jmp ($1f3f,x)
$0c:de45  88			dey
$0c:de46  8c 02 71	  sty $7102
$0c:de49  00 81		 brk #$81
$0c:de4b  c0 33		 cpy #$33
$0c:de4d  76 a5		 ror $a5,x
$0c:de4f  b8			clv
$0c:de50  54 f6 b4	  mvn $b4,$f6
$0c:de53  ad 77 37	  lda $3777
$0c:de56  e9 22		 sbc #$22
$0c:de58  af da 3c 12   lda $123cda
$0c:de5c  69 05		 adc #$05
$0c:de5e  92 c1		 sta ($c1)
$0c:de60  e4 f0		 cpx $f0
$0c:de62  62 30 0c	  per $ea95
$0c:de65  90 66		 bcc $decd
$0c:de67  82 a4 23	  brl $020e
$0c:de6a  f0 0e		 beq $de7a
$0c:de6c  f8			sed
$0c:de6d  98			tya
$0c:de6e  60			rts
$0c:de6f  7f e1 38 62   adc $6238e1,x
$0c:de73  6f e2 00 b2   adc $b200e2
$0c:de77  fe 3f 30	  inc $303f,x
$0c:de7a  5e 2c b8	  lsr $b82c,x
$0c:de7d  54 82 a1	  mvn $a1,$82
$0c:de80  80 b9		 bra $de3b
$0c:de82  82 04 8d	  brl $6b89
$0c:de85  08			php
$0c:de86  f8			sed
$0c:de87  9c 3a 43	  stz $433a
$0c:de8a  50 80		 bvc $de0c
$0c:de8c  5b			tcd
$0c:de8d  7f d7 f8 06   adc $06f8d7,x
$0c:de91  bd 4e 1e	  lda $1e4e,x
$0c:de94  0f 0c d9 fe   ora $fed90c
$0c:de98  ea			nop
$0c:de99  90 33		 bcc $dece
$0c:de9b  87 c2		 sta [$c2]
$0c:de9d  01 f8		 ora ($f8,x)
$0c:de9f  de 52 3f	  dec $3f52,x
$0c:dea2  30 8a		 bmi $de2e
$0c:dea4  a7 a3		 lda [$a3]
$0c:dea6  dd e4 f2	  cmp $f2e4,x
$0c:dea9  c4 f8		 cpy $f8
$0c:deab  b3 8d		 lda ($8d,s),y
$0c:dead  b5 fe		 lda $fe,x
$0c:deaf  89 c4		 bit #$c4
$0c:deb1  75 09		 adc $09,x
$0c:deb3  01 11		 ora ($11,x)
$0c:deb5  a0 cd		 ldy #$cd
$0c:deb7  08			php
$0c:deb8  04 ee		 tsb $ee
$0c:deba  01 3a		 ora ($3a,x)
$0c:debc  8b			phb
$0c:debd  e7 e2		 sbc [$e2]
$0c:debf  12 a8		 ora ($a8)
$0c:dec1  bd 56 4b	  lda $4b56,x
$0c:dec4  a7 e4		 lda [$e4]
$0c:dec6  48			pha
$0c:dec7  73 d7		 adc ($d7,s),y
$0c:dec9  6f fd 96 ca   adc $ca96fd
$0c:decd  2d 02 f9	  and $f902
$0c:ded0  40			rti
$0c:ded1  8c 00 2c	  sty $2c00
$0c:ded4  01 50		 ora ($50,x)
$0c:ded6  40			rti
$0c:ded7  33 50		 and ($50,s),y
$0c:ded9  0a			asl a
$0c:deda  2d a6 5d	  and $5da6
$0c:dedd  eb			xba
$0c:dede  a1 f2		 lda ($f2,x)
$0c:dee0  3f 3d 78 a6   and $a6783d,x
$0c:dee4  2e 4d 9c	  rol $9c4d
$0c:dee7  e0 ef		 cpx #$ef
$0c:dee9  76 d0		 ror $d0,x
$0c:deeb  2c f4 02	  bit $02f4
$0c:deee  39 00 9f	  and $9f00,y
$0c:def1  c0 25		 cpy #$25
$0c:def3  f0 00		 beq $def5
$0c:def5  b8			clv
$0c:def6  05 c2		 ora $c2
$0c:def8  fd 00 fe	  sbc $fe00,x
$0c:defb  c0 21		 cpy #$21
$0c:defd  be 48 17	  ldx $1748,y
$0c:df00  ae 3f 19	  ldx $193f
$0c:df03  d2 fe		 cmp ($fe)
$0c:df05  e1 5f		 sbc ($5f,x)
$0c:df07  ca			dex
$0c:df08  74 d3		 stz $d3,x
$0c:df0a  07 be		 ora [$be]
$0c:df0c  fb			xce
$0c:df0d  50 63		 bvc $df72
$0c:df0f  68			pla
$0c:df10  01 f7		 ora ($f7,x)
$0c:df12  40			rti
$0c:df13  3f d1 07 78   and $7807d1,x
$0c:df17  3b			tsc
$0c:df18  c0 2e		 cpy #$2e
$0c:df1a  1b			tcs
$0c:df1b  f8			sed
$0c:df1c  05 36		 ora $36
$0c:df1e  c9 22		 cmp #$22
$0c:df20  f0 d1		 beq $def3
$0c:df22  38			sec
$0c:df23  7f 83 b3 e6   adc $e6b383,x
$0c:df27  dd 42 83	  cmp $8342,x
$0c:df2a  ad ef 12	  lda $12ef
$0c:df2d  75 c3		 adc $c3,x
$0c:df2f  f1 dd		 sbc ($dd),y
$0c:df31  71 ff		 adc ($ff),y
$0c:df33  14 bb		 trb $bb
$0c:df35  7e e0 1f	  ror $1fe0,x
$0c:df38  ca			dex
$0c:df39  03 dc		 ora $dc,s
$0c:df3b  14 b0		 trb $b0
$0c:df3d  a8			tay
$0c:df3e  17 85		 ora [$85],y
$0c:df40  bf ba b5 a5   lda $a5b5ba,x
$0c:df44  d7 ff		 cmp [$ff],y
$0c:df46  f7 7f		 sbc [$7f],y
$0c:df48  fa			plx
$0c:df49  8c bb 9b	  sty $9bbb
$0c:df4c  c8			iny
$0c:df4d  9a			txs
$0c:df4e  ed e5 9f	  sbc $9fe5
$0c:df51  dd a5 2d	  cmp $2da5,x
$0c:df54  0e 48 70	  asl $7048
$0c:df57  53 84		 eor ($84,s),y
$0c:df59  de 01 48	  dec $4801,x
$0c:df5c  80 40		 bra $df9e
$0c:df5e  a0 02		 ldy #$02
$0c:df60  c0 a6		 cpy #$a6
$0c:df62  43 e5		 eor $e5,s
$0c:df64  fc 6c 9f	  jsr ($9f6c,x)
$0c:df67  8a			txa
$0c:df68  9b			txy
$0c:df69  b1 d5		 lda ($d5),y
$0c:df6b  e8			inx
$0c:df6c  ad 76 ea	  lda $ea76
$0c:df6f  cf ea d3 96   cmp $96d3ea
$0c:df73  34 01		 bit $01,x
$0c:df75  80 3f		 bra $dfb6
$0c:df77  8a			txa
$0c:df78  40			rti
$0c:df79  80 57		 bra $dfd2
$0c:df7b  20 19 08	  jsr $0819
$0c:df7e  04 10		 tsb $10
$0c:df80  58			cli
$0c:df81  30 7d		 bmi $e000
$0c:df83  ec 5f 5b	  cpx $5b5f
$0c:df86  61 ee		 adc ($ee,x)
$0c:df88  d1 ff		 cmp ($ff),y
$0c:df8a  3e 5a ef	  rol $ef5a,x
$0c:df8d  86 9b		 stx $9b
$0c:df8f  d7 a6		 cmp [$a6],y
$0c:df91  ea			nop
$0c:df92  6c a8 b0	  jmp ($b0a8)
$0c:df95  45 84		 eor $84
$0c:df97  f8			sed
$0c:df98  c4 f1		 cpy $f1
$0c:df9a  e8			inx
$0c:df9b  07 5a		 ora [$5a]
$0c:df9d  e7 0f		 sbc [$0f]
$0c:df9f  de d9 7b	  dec $7bd9,x
$0c:dfa2  ba			tsx
$0c:dfa3  ba			tsx
$0c:dfa4  2f 56 8b c8   and $c88b56
$0c:dfa8  a2 ed		 ldx #$ed
$0c:dfaa  ae 7c d9	  ldx $d97c
$0c:dfad  f4 30 c1	  pea $c130
$0c:dfb0  27 f0		 and [$f0]
$0c:dfb2  16 07		 asl $07,x
$0c:dfb4  d2 9b		 cmp ($9b)
$0c:dfb6  d8			cld
$0c:dfb7  a2 e5		 ldx #$e5
$0c:dfb9  ea			nop
$0c:dfba  5a			phy
$0c:dfbb  ab			plb
$0c:dfbc  1f 56 65 e3   ora $e36556,x
$0c:dfc0  8e 74 29	  stx $2974
$0c:dfc3  ba			tsx
$0c:dfc4  ab			plb
$0c:dfc5  39 8c a5	  and $a58c,y
$0c:dfc8  90 08		 bcc $dfd2
$0c:dfca  e2 28		 sep #$28
$0c:dfcc  cc 60 a5	  cpy $a560
$0c:dfcf  0f bd 8b 53   ora $538bbd
$0c:dfd3  62 e3 cf	  per $afb9
$0c:dfd6  32 d4		 and ($d4)
$0c:dfd8  bd 45 8f	  lda $8f45,x
$0c:dfdb  e9 33		 sbc #$33
$0c:dfdd  cb			wai
$0c:dfde  dd 3e 70	  cmp $703e,x
$0c:dfe1  c5 28		 cmp $28
$0c:dfe3  29 40		 and #$40
$0c:dfe5  58			cli
$0c:dfe6  13 c5		 ora ($c5,s),y
$0c:dfe8  21 c2		 and ($c2,x)
$0c:dfea  05 83		 ora $83
$0c:dfec  7f c0 70 27   adc $2770c0,x
$0c:dff0  fb			xce
$0c:dff1  7b			tdc
$0c:dff2  bf 06 ff 9e   lda $9eff06,x
$0c:dff6  9f 35 c3 01   sta $01c335,x
$0c:dffa  3e 6a 85	  rol $856a,x
$0c:dffd  ff ff c0 ff   sbc $ffc0ff,x
$0c:e001  e2 3f		 sep #$3f
$0c:e003  fb			xce
$0c:e004  e7 f2		 sbc [$f2]
$0c:e006  b9 43 81	  lda $8143,y
$0c:e009  7f f2 d9 7f   adc $7fd9f2,x
$0c:e00d  90 2d		 bcc $e03c
$0c:e00f  cc ef 85	  cpy $85ef
$0c:e012  7f 77 86 49   adc $498677,x
$0c:e016  bc 18 0c	  ldy $0c18,x
$0c:e019  07 ff		 ora [$ff]
$0c:e01b  35 ff		 and $ff,x
$0c:e01d  fe ff f8	  inc $f8ff,x
$0c:e020  9f fd e7 ff   sta $ffe7fd,x
$0c:e024  7f ff 7f 83   adc $837fff,x
$0c:e028  7c 1f a3	  jmp ($a31f,x)
$0c:e02b  7f ee df f0   adc $f0dfee,x
$0c:e02f  30 1d		 bmi $e04e
$0c:e031  e5 0b		 sbc $0b
$0c:e033  af 28 df d0   lda $d0df28
$0c:e037  03 60		 ora $60,s
$0c:e039  df 07 28 39   cmp $392807,x
$0c:e03d  43 fd		 eor $fd,s
$0c:e03f  ff de ff fa   sbc $faffde,x
$0c:e043  e0 81		 cpx #$81
$0c:e045  04 87		 tsb $87
$0c:e047  ee 89 f4	  inc $f489
$0c:e04a  a5 f8		 lda $f8
$0c:e04c  2b			pld
$0c:e04d  fa			plx
$0c:e04e  99 5f 2a	  sta $2a5f,y
$0c:e051  fc f9 41	  jsr ($41f9,x)
$0c:e054  59 02 43	  eor $4302,y
$0c:e057  a8			tay
$0c:e058  26 10		 rol $10
$0c:e05a  4a			lsr a
$0c:e05b  5f b0 3c 1b   eor $1b3cb0,x
$0c:e05f  f6 4a		 inc $4a,x
$0c:e061  e7 a1		 sbc [$a1]
$0c:e063  bf e3 6a 78   lda $786ae3,x
$0c:e067  ca			dex
$0c:e068  91 54		 sta ($54),y
$0c:e06a  2b			pld
$0c:e06b  5b			tcd
$0c:e06c  ab			plb
$0c:e06d  f7 ff		 sbc [$ff],y
$0c:e06f  03 ff		 ora $ff,s
$0c:e071  c6 02		 dec $02
$0c:e073  87 59		 sta [$59]
$0c:e075  ff d6 82 86   sbc $8682d6,x
$0c:e079  8b			phb
$0c:e07a  ff b7 ec 36   sbc $36ecb7,x
$0c:e07e  74 ee		 stz $ee,x
$0c:e080  66 f6		 ror $f6
$0c:e082  a7 b2		 lda [$b2]
$0c:e084  d4 db		 pei ($db)
$0c:e086  f4 d6 ee	  pea $eed6
$0c:e089  ad 73 b7	  lda $b773
$0c:e08c  28			plp
$0c:e08d  a7 ff		 lda [$ff]
$0c:e08f  f6 3f		 inc $3f,x
$0c:e091  fa			plx
$0c:e092  17 fe		 ora [$fe],y
$0c:e094  9b			txy
$0c:e095  ff c8 ff b2   sbc $b2ffc8,x
$0c:e099  df 9d 27 ef   cmp $ef279d,x
$0c:e09d  b1 f7		 lda ($f7),y
$0c:e09f  96 d4		 stx $d4,y
$0c:e0a1  3d f0 0a	  and $0af0,x
$0c:e0a4  de 13 13	  dec $1313,x
$0c:e0a7  03 e6		 ora $e6,s
$0c:e0a9  41 ff		 eor ($ff,x)
$0c:e0ab  f0 0f		 beq $e0bc
$0c:e0ad  84 06		 sty $06
$0c:e0af  c3 01		 cmp $01,s
$0c:e0b1  ef c0 37 ea   sbc $ea37c0
$0c:e0b5  01 bf		 ora ($bf,x)
$0c:e0b7  c0 2f		 cpy #$2f
$0c:e0b9  90 09		 bcc $e0c4
$0c:e0bb  9c 02 1f	  stz $1f02
$0c:e0be  00 cf		 brk #$cf
$0c:e0c0  40			rti
$0c:e0c1  30 77		 bmi $e13a
$0c:e0c3  c9 ae		 cmp #$ae
$0c:e0c5  de b5 ce	  dec $ceb5,x
$0c:e0c8  be fd 27	  ldx $27fd,y
$0c:e0cb  7a			ply
$0c:e0cc  9a			txs
$0c:e0cd  b7 cb		 lda [$cb],y
$0c:e0cf  5b			tcd
$0c:e0d0  65 ed		 adc $ed
$0c:e0d2  d2 94		 cmp ($94)
$0c:e0d4  c1 48		 cmp ($48,x)
$0c:e0d6  ff cc 7f f2   sbc $f27fcc,x
$0c:e0da  3f bd 1f df   and $df1fbd,x
$0c:e0de  0f ff c7 af   ora $afc7ff
$0c:e0e2  f3 db		 sbc ($db,s),y
$0c:e0e4  fe b7 a7	  inc $a7b7,x
$0c:e0e7  55 f6		 eor $f6,x
$0c:e0e9  6a			ror a
$0c:e0ea  ab			plb
$0c:e0eb  35 5d		 and $5d,x
$0c:e0ed  66 a6		 ror $a6
$0c:e0ef  ef d6 ac c9   sbc $c9acd6
$0c:e0f3  b1 3d		 lda ($3d),y
$0c:e0f5  9d 74 a3	  sta $a374,x
$0c:e0f8  f1 03		 sbc ($03),y
$0c:e0fa  f0 61		 beq $e15d
$0c:e0fc  f8			sed
$0c:e0fd  10 37		 bpl $e136
$0c:e0ff  f0 60		 beq $e161
$0c:e101  24 10		 bit $10
$0c:e103  0b			phd
$0c:e104  8c 02 e7	  sty $e702
$0c:e107  00 00		 brk #$00
$0c:e109  20 80 3b	  jsr $3b80
$0c:e10c  fc 01 d1	  jsr ($d101,x)
$0c:e10f  18			clc
$0c:e110  14 5a		 trb $5a
$0c:e112  29 05		 and #$05
$0c:e114  84 c2		 sty $c2
$0c:e116  b5 73		 lda $73,x
$0c:e118  2c 1e 76	  bit $761e
$0c:e11b  b3 22		 lda ($22,s),y
$0c:e11d  aa			tax
$0c:e11e  00 02		 brk #$02
$0c:e120  27 13		 and [$13]
$0c:e122  83 c5		 sta $c5,s
$0c:e124  e3 d1		 sbc $d1,s
$0c:e126  fd e6 fc	  sbc $fce6,x
$0c:e129  4e 1f 6f	  lsr $6f1f
$0c:e12c  f8			sed
$0c:e12d  b0 21		 bcs $e150
$0c:e12f  70 79		 bvs $e1aa
$0c:e131  7c 7e ff	  jmp ($ff7e,x)
$0c:e134  3f 9f df f7   and $f7df9f,x
$0c:e138  ff f9 ff fe   sbc $fefff9,x
$0c:e13c  3f bf a3 d7   and $d7a3bf,x
$0c:e140  e1 f0		 sbc ($f0,x)
$0c:e142  f1 a0		 sbc ($a0),y
$0c:e144  df c5 80 44   cmp $4480c5,x
$0c:e148  02 39		 cop #$39
$0c:e14a  0d c3 a1	  ora $a1c3
$0c:e14d  e0 fa		 cpx #$fa
$0c:e14f  7e 3f 5f	  ror $5f3f,x
$0c:e152  cf e7 fb fa   cmp $fafbe7
$0c:e156  56 12		 lsr $12,x
$0c:e158  98			tya
$0c:e159  7d 7f 3f	  adc $3f7f,x
$0c:e15c  0f 81 50 7f   ora $7f5081
$0c:e160  c2 c1		 rep #$c1
$0c:e162  32 99		 and ($99)
$0c:e164  90 32		 bcc $e198
$0c:e166  58			cli
$0c:e167  0e 9e f3	  asl $f39e
$0c:e16a  97 b4		 sta [$b4],y
$0c:e16c  9e d0 b3	  stz $b3d0,x
$0c:e16f  5e 7b 26	  lsr $267b,x
$0c:e172  6f e7 8c af   adc $af8ce7
$0c:e176  48			pha
$0c:e177  48			pha
$0c:e178  e8			inx
$0c:e179  45 61		 eor $61
$0c:e17b  60			rts
$0c:e17c  53 60		 eor ($60,s),y
$0c:e17e  31 8f		 and ($8f),y
$0c:e180  36 ae		 rol $ae,x
$0c:e182  ff 37 e5 db   sbc $dbe537,x
$0c:e186  72 79		 adc ($79)
$0c:e188  4b			phk
$0c:e189  d7 2e		 cmp [$2e],y
$0c:e18b  6b			rtl
$0c:e18c  ac b9 19	  ldy $19b9
$0c:e18f  08			php
$0c:e190  c8			iny
$0c:e191  0a			asl a
$0c:e192  32 35		 and ($35)
$0c:e194  90 b0		 bcc $e146
$0c:e196  32 d8		 and ($d8)
$0c:e198  0e be f3	  asl $f3be
$0c:e19b  b7 a2		 lda [$a2],y
$0c:e19d  9b			txy
$0c:e19e  d1 3d		 cmp ($3d),y
$0c:e1a0  f4 8b f6	  pea $f68b
$0c:e1a3  c7 7b		 cmp [$7b]
$0c:e1a5  a2 bd		 ldx #$bd
$0c:e1a7  d1 af		 cmp ($af),y
$0c:e1a9  ff b5 f8 5f   sbc $5ff8b5,x
$0c:e1ad  3e ff 8f	  rol $8fff,x
$0c:e1b0  7f c2 3f 40   adc $403fc2,x
$0c:e1b4  ff 50 3f 98   sbc $983f50,x
$0c:e1b8  0f c5 75 20   ora $2075c5
$0c:e1bc  1f 69 d9 30   ora $30d969,x
$0c:e1c0  39 75 ff	  and $ff75,y
$0c:e1c3  34 93		 bit $93,x
$0c:e1c5  f5 93		 sbc $93,x
$0c:e1c7  fe da 33	  inc $33da,x
$0c:e1ca  df ef 7f ff   cmp $ff7fef,x
$0c:e1ce  df 7e b7 cf   cmp $cfb77e,x
$0c:e1d2  a6 f1		 ldx $f1
$0c:e1d4  f8			sed
$0c:e1d5  c0 fc		 cpy #$fc
$0c:e1d7  20 d0 78	  jsr $78d0
$0c:e1da  1d 8e 31	  ora $318e,x
$0c:e1dd  58			cli
$0c:e1de  da			phx
$0c:e1df  ec 61 b8	  cpx $b861
$0c:e1e2  0b			phd
$0c:e1e3  86 02		 stx $02
$0c:e1e5  47 ff		 eor [$ff]
$0c:e1e7  05 27		 ora $27
$0c:e1e9  62 4f 4e	  per $303b
$0c:e1ec  80 5f		 bra $e24d
$0c:e1ee  c0 42		 cpy #$42
$0c:e1f0  06 6a		 asl $6a
$0c:e1f2  95 4f		 sta $4f,x
$0c:e1f4  69 85		 adc #$85
$0c:e1f6  cc 40 6f	  cpy $6f40
$0c:e1f9  50 1b		 bvc $e216
$0c:e1fb  1b			tcs
$0c:e1fc  e1 6a		 sbc ($6a,x)
$0c:e1fe  7a			ply
$0c:e1ff  cb			wai
$0c:e200  dc 00 30	  jml [$3000]
$0c:e203  01 85		 ora ($85,x)
$0c:e205  7c 8d 93	  jmp ($938d,x)
$0c:e208  ef 32 f5 cd   sbc $cdf532
$0c:e20c  7d b9 5b	  adc $5bb9,x
$0c:e20f  6f aa 6d 5a   adc $5a6daa
$0c:e213  db			stp
$0c:e214  65 af		 adc $af
$0c:e216  d5 6d		 cmp $6d,x
$0c:e218  f4 23 ff	  pea $ff23
$0c:e21b  04 ff		 tsb $ff
$0c:e21d  c0 88		 cpy #$88
$0c:e21f  43 01		 eor $01,s
$0c:e221  23 2f		 and $2f,s
$0c:e223  4a			lsr a
$0c:e224  e5 53		 sbc $53
$0c:e226  f9 d4 f6	  sbc $f6d4,y
$0c:e229  7b			tdc
$0c:e22a  5e 8e df	  lsr $df8e,x
$0c:e22d  a3 db		 lda $db,s
$0c:e22f  fc ea b7	  jsr ($b7ea,x)
$0c:e232  12 a9		 ora ($a9)
$0c:e234  c4 37		 cpy $37
$0c:e236  ff 0c 30 0c   sbc $0c300c,x
$0c:e23a  38			sec
$0c:e23b  c8			iny
$0c:e23c  30 6f		 bmi $e2ad
$0c:e23e  fd 1f ff	  sbc $ff1f,x
$0c:e241  c7 ff		 cmp [$ff]
$0c:e243  e0 30		 cpx #$30
$0c:e245  17 c8		 ora [$c8],y
$0c:e247  1d c2 1f	  ora $1fc2,x
$0c:e24a  43 9f		 eor $9f,s
$0c:e24c  c3 ef		 cmp $ef,s
$0c:e24e  f3 cb		 sbc ($cb,s),y
$0c:e250  e5 c2		 sbc $c2
$0c:e252  e1 7f		 sbc ($7f,x)
$0c:e254  3e 84 03	  rol $0384,x
$0c:e257  01 7f		 ora ($7f,x)
$0c:e259  40			rti
$0c:e25a  a6 0e		 ldx $0e
$0c:e25c  ff 8f bf 86   sbc $86bf8f,x
$0c:e260  0a			asl a
$0c:e261  79 fc f8	  adc $f8fc,y
$0c:e264  7c 38 7c	  jmp ($7c38,x)
$0c:e267  08			php
$0c:e268  7a			ply
$0c:e269  40			rti
$0c:e26a  20 7f 08	  jsr $087f
$0c:e26d  7f fd 3a 10   adc $103afd,x
$0c:e271  08			php
$0c:e272  1f fd 38 13   ora $1338fd,x
$0c:e276  f4 e8 a9	  pea $a9e8
$0c:e279  8d 1c 49	  sta $491c
$0c:e27c  a1 e1		 lda ($e1,x)
$0c:e27e  9d 81 48	  sta $4881,x
$0c:e281  1f cf ff c1   ora $c1ffcf,x
$0c:e285  3a			dec a
$0c:e286  4a			lsr a
$0c:e287  66 5d		 ror $5d
$0c:e289  1b			tcs
$0c:e28a  e4 67		 cpx $67
$0c:e28c  ff df ff c7   sbc $c7ffdf,x
$0c:e290  fb			xce
$0c:e291  c3 f8		 cmp $f8,s
$0c:e293  ad 06 1d	  lda $1d06
$0c:e296  fe fc 7e	  inc $7efc,x
$0c:e299  03 01		 ora $01,s
$0c:e29b  fd ff 7c	  sbc $7cff,x
$0c:e29e  7f dc 1f f4   adc $f41fdc,x
$0c:e2a2  05 cc		 ora $cc
$0c:e2a4  22 20 fc 41   jsl $41fc20
$0c:e2a8  e5 35		 sbc $35
$0c:e2aa  68			pla
$0c:e2ab  dd 1a 25	  cmp $251a,x
$0c:e2ae  4f ab 43 e5   eor $e543ab
$0c:e2b2  71 b9		 adc ($b9),y
$0c:e2b4  4c 66 65	  jmp $6566
$0c:e2b7  13 a9		 ora ($a9,s),y
$0c:e2b9  cc 8f a2	  cpy $a28f
$0c:e2bc  ff 3b dd ee   sbc $eedd3b,x
$0c:e2c0  f3 79		 sbc ($79,s),y
$0c:e2c2  b9 82 c6	  lda $c682,y
$0c:e2c5  43 6a		 eor $6a,s
$0c:e2c7  99 59 f3	  sta $f359,y
$0c:e2ca  d7 9b		 cmp [$9b],y
$0c:e2cc  f6 77		 inc $77,x
$0c:e2ce  81 5a		 sta ($5a,x)
$0c:e2d0  dc cb 79	  jml [$79cb]
$0c:e2d3  d8			cld
$0c:e2d4  da			phx
$0c:e2d5  5f 99 3a 0d   eor $0d3a99,x
$0c:e2d9  20 fd 08	  jsr $08fd
$0c:e2dc  03 f7		 ora $f7,s
$0c:e2de  bf ff f7 bf   lda $bff7ff,x
$0c:e2e2  ff e4 e8 ec   sbc $ece8e4,x
$0c:e2e6  2e fd 3c	  rol $3cfd
$0c:e2e9  fd d6 5f	  sbc $5fd6,x
$0c:e2ec  4a			lsr a
$0c:e2ed  ef e4 a9 3a   sbc $3aa9e4
$0c:e2f1  5b			tcd
$0c:e2f2  25 bb		 and $bb
$0c:e2f4  b5 5f		 lda $5f,x
$0c:e2f6  fa			plx
$0c:e2f7  f3 ff		 sbc ($ff,s),y
$0c:e2f9  f6 0f		 inc $0f,x
$0c:e2fb  fe 63 ff	  inc $ff63,x
$0c:e2fe  3d 52 0c	  and $0c52,x
$0c:e301  6f ff 01 5f   adc $5f01ff
$0c:e305  8c 6b c7	  sty $c76b
$0c:e308  8e c6 ea	  stx $eac6
$0c:e30b  bf 1e 9e ee   lda $ee9e1e,x
$0c:e30f  4b			phk
$0c:e310  95 25		 sta $25,x
$0c:e312  d3 5e		 cmp ($5e,s),y
$0c:e314  6b			rtl
$0c:e315  9a			txs
$0c:e316  9d d3 48	  sta $48d3,x
$0c:e319  2e 7f f8	  rol $f87f
$0c:e31c  ff ff 7c 20   sbc $207cff,x
$0c:e320  1e cf ff	  asl $ffcf,x
$0c:e323  07 ff		 ora [$ff]
$0c:e325  a3 ff		 lda $ff,s
$0c:e327  fc 99 be	  jsr ($be99,x)
$0c:e32a  76 c6		 ror $c6,x
$0c:e32c  3b			tsc
$0c:e32d  e3 f8		 sbc $f8,s
$0c:e32f  f3 b2		 sbc ($b2,s),y
$0c:e331  bf aa 74 c7   lda $c774aa,x
$0c:e335  cf bf a5 7e   cmp $7ea5bf
$0c:e339  ef ff f3 fb   sbc $fbf3ff
$0c:e33d  27 40		 and [$40]
$0c:e33f  fe 10 4f	  inc $4f10,x
$0c:e342  fe 5e f7	  inc $f75e,x
$0c:e345  5b			tcd
$0c:e346  f3 d9		 sbc ($d9,s),y
$0c:e348  f3 fd		 sbc ($fd,s),y
$0c:e34a  99 fd 1b	  sta $1bfd,y
$0c:e34d  75 ba		 adc $ba,x
$0c:e34f  a3 6b		 lda $6b,s
$0c:e351  7f f4 be 78   adc $78bef4,x
$0c:e355  ac 13 e8	  ldy $e813
$0c:e358  c1 21		 cmp ($21,x)
$0c:e35a  58			cli
$0c:e35b  4c 3f fa	  jmp $fa3f
$0c:e35e  3c ff 47	  bit $47ff,x
$0c:e361  1f 28 e3 fd   ora $fde328,x
$0c:e365  2c 7f 2c	  bit $2c7f
$0c:e368  cd 7e 51	  cmp $517e
$0c:e36b  ef 3e 07 ce   sbc $ce073e
$0c:e36f  81 e0		 sta ($e0,x)
$0c:e371  b0 7c		 bcs $e3ef
$0c:e373  2e 0d d0	  rol $d00d
$0c:e376  8e 5f 3d	  stx $3d5f
$0c:e379  df ef bd ff   cmp $ffbdef,x
$0c:e37d  ef 0c fb f3   sbc $f3fb0c
$0c:e381  e6 f9		 inc $f9
$0c:e383  bb			tyx
$0c:e384  7c ff af	  jmp ($afff,x)
$0c:e387  7f d7 7b ab   adc $ab7bd7,x
$0c:e38b  5d ac b6	  eor $b6ac,x
$0c:e38e  f7 ff		 sbc [$ff],y
$0c:e390  5b			tcd
$0c:e391  e7 c0		 sbc [$c0]
$0c:e393  b8			clv
$0c:e394  70 6c		 bvs $e402
$0c:e396  3c 3a 1f	  bit $1f3a,x
$0c:e399  1f 8c 4f e6   ora $e64f8c,x
$0c:e39d  f7 fb		 sbc [$fb],y
$0c:e39f  7f fb df 30   adc $30dffb,x
$0c:e3a3  f7 e5		 sbc [$e5],y
$0c:e3a5  6e f4 6f	  ror $6ff4
$0c:e3a8  ff 72 47 00   sbc $004772,x
$0c:e3ac  7a			ply
$0c:e3ad  bc 20 98	  ldy $9820,x
$0c:e3b0  20 11 7a	  jsr $7a11
$0c:e3b3  be eb f7	  ldx $f7eb,y
$0c:e3b6  44 fe e7	  mvp $e7,$fe
$0c:e3b9  2c 6f 58	  bit $586f
$0c:e3bc  46 84		 lsr $84
$0c:e3be  08			php
$0c:e3bf  05 77		 ora $77
$0c:e3c1  ee dd fb	  inc $fbdd
$0c:e3c4  cd 75 e9	  cmp $e975
$0c:e3c7  d7 b8		 cmp [$b8],y
$0c:e3c9  d5 de		 cmp $de,x
$0c:e3cb  1e 73 87	  asl $8773,x
$0c:e3ce  c6 f0		 dec $f0
$0c:e3d0  fa			plx
$0c:e3d1  ef 12 5f fc   sbc $fc5f12
$0c:e3d5  67 ff		 adc [$ff]
$0c:e3d7  2f ff ce 7f   and $7fceff
$0c:e3db  f3 fb		 sbc ($fb,s),y
$0c:e3dd  f9 1c 23	  sbc $231c,y
$0c:e3e0  f3 f8		 sbc ($f8,s),y
$0c:e3e2  3c 3f 7f	  bit $7f3f,x
$0c:e3e5  1b			tcs
$0c:e3e6  be d9 75	  ldx $75d9,y
$0c:e3e9  bc 9b a5	  ldy $a59b,x
$0c:e3ec  e7 cf		 sbc [$cf]
$0c:e3ee  fb			xce
$0c:e3ef  e4 fc		 cpx $fc
$0c:e3f1  e2 7e		 sep #$7e
$0c:e3f3  6e bc 73	  ror $73bc
$0c:e3f6  c9 ff		 cmp #$ff
$0c:e3f8  cd 7f fe	  cmp $fe7f
$0c:e3fb  df fc f7 ff   cmp $fff7fc,x
$0c:e3ff  f9 fe 33	  sbc $33fe,y
$0c:e402  87 e3		 sta [$e3]
$0c:e404  f9 e0 f8	  sbc $f8e0,y
$0c:e407  3d 42 ff	  and $ff42,x
$0c:e40a  ff c0 5f ce   sbc $ce5fc0,x
$0c:e40e  70 04		 bvs $e414
$0c:e410  97 aa		 sta [$aa],y
$0c:e412  a9 80		 lda #$80
$0c:e414  02 69		 cop #$69
$0c:e416  25 3f		 and $3f
$0c:e418  f6 4e		 inc $4e,x
$0c:e41a  9f 7f df f8   sta $f8df7f,x
$0c:e41e  30 1b		 bmi $e43b
$0c:e420  ad dd af	  lda $afdd
$0c:e423  c7 d6		 cmp [$d6]
$0c:e425  a3 63		 lda $63,s
$0c:e427  35 b3		 and $b3,x
$0c:e429  9a			txs
$0c:e42a  df ff 81 c0   cmp $c081ff,x
$0c:e42e  b0 7f		 bcs $e4af
$0c:e430  e4 1c		 cpx $1c
$0c:e432  49 86		 eor #$86
$0c:e434  72 43		 adc ($43)
$0c:e436  b9 a1 dc	  lda $dca1,y
$0c:e439  f0 fe		 beq $e439
$0c:e43b  78			sei
$0c:e43c  7c 06 03	  jmp ($0306,x)
$0c:e43f  fe ff 40	  inc $40ff,x
$0c:e442  7f ed 38 01   adc $0138ed,x
$0c:e446  04 05		 tsb $05
$0c:e448  01 74		 ora ($74,x)
$0c:e44a  59 34 9a	  eor $9a34,y
$0c:e44d  c9 23		 cmp #$23
$0c:e44f  b2 d0		 lda ($d0)
$0c:e451  a9 95		 lda #$95
$0c:e453  9b			txy
$0c:e454  34 2a		 bit $2a,x
$0c:e456  d3 b9		 cmp ($b9,s),y
$0c:e458  ec 69 f8	  cpx $f869
$0c:e45b  16 77		 asl $77,x
$0c:e45d  f8			sed
$0c:e45e  d9 ac f4	  cmp $f4ac,y
$0c:e461  f5 80		 sbc $80,x
$0c:e463  5f ee f7 ff   eor $fff7ee,x
$0c:e467  3a			dec a
$0c:e468  44 3f ff	  mvp $ff,$3f
$0c:e46b  db			stp
$0c:e46c  ae d6 ff	  ldx $ffd6
$0c:e46f  2a			rol a
$0c:e470  bb			tyx
$0c:e471  e5 b7		 sbc $b7
$0c:e473  16 ca		 asl $ca,x
$0c:e475  fe 3e 3f	  inc $3f3e,x
$0c:e478  d8			cld
$0c:e479  c7 d9		 cmp [$d9]
$0c:e47b  f9 c9 10	  sbc $10c9,y
$0c:e47e  ff 03 04 e2   sbc $e20403,x
$0c:e482  1b			tcs
$0c:e483  f0 60		 beq $e4e5
$0c:e485  8a			txa
$0c:e486  0a			asl a
$0c:e487  ab			plb
$0c:e488  ff ad fe ad   sbc $adfead,x
$0c:e48c  9e 99 6e	  stz $6e99,x
$0c:e48f  a6 4b		 ldx $4b
$0c:e491  a1 da		 lda ($da,x)
$0c:e493  c8			iny
$0c:e494  76 b6		 ror $b6,x
$0c:e496  1d e5 a5	  ora $a5e5,x
$0c:e499  26 10		 rol $10
$0c:e49b  5f fc 5f ff   eor $ff5ffc,x
$0c:e49f  57 ff		 eor [$ff],y
$0c:e4a1  d7 c8		 cmp [$c8],y
$0c:e4a3  c3 1f		 cmp $1f,s
$0c:e4a5  21 0e		 and ($0e,x)
$0c:e4a7  87 d5		 sta [$d5]
$0c:e4a9  6d a5 67	  adc $67a5
$0c:e4ac  65 5b		 adc $5b
$0c:e4ae  d9 5c bf	  cmp $bf5c,y
$0c:e4b1  73 2f		 adc ($2f,s),y
$0c:e4b3  dd 4c 75	  cmp $754c,x
$0c:e4b6  72 dd		 adc ($dd)
$0c:e4b8  39 2c 04	  and $042c,y
$0c:e4bb  e4 21		 cpx $21
$0c:e4bd  01 08		 ora ($08,x)
$0c:e4bf  7f 0d 03 f8   adc $f8030d,x
$0c:e4c3  48			pha
$0c:e4c4  9c 32 ff	  stz $ff32
$0c:e4c7  2c b7 cd	  bit $cdb7
$0c:e4ca  2f fc 2b fd   and $fd2bfc
$0c:e4ce  96 fb		 stx $fb,y
$0c:e4d0  9b			txy
$0c:e4d1  4f 9a 50 3d   eor $3d509a
$0c:e4d5  f1 04		 sbc ($04),y
$0c:e4d7  c1 7f		 cmp ($7f,x)
$0c:e4d9  60			rts
$0c:e4da  57 f4		 eor [$f4],y
$0c:e4dc  40			rti
$0c:e4dd  a1 c2		 lda ($c2,x)
$0c:e4df  73 f1		 adc ($f1,s),y
$0c:e4e1  f0 fc		 beq $e4df
$0c:e4e3  6a			ror a
$0c:e4e4  7d 1e 3f	  adc $3f1e,x
$0c:e4e7  c7 39		 cmp [$39]
$0c:e4e9  f0 b4		 beq $e49f
$0c:e4eb  f8			sed
$0c:e4ec  5c 85 fe 51   jml $51fe85
$0c:e4f0  0f 7a 40 a3   ora $a3407a
$0c:e4f4  04 38		 tsb $38
$0c:e4f6  7b			tdc
$0c:e4f7  a2 1b		 ldx #$1b
$0c:e4f9  9d c6 87	  sta $87c6,x
$0c:e4fc  25 a5		 and $a5
$0c:e4fe  cb			wai
$0c:e4ff  6b			rtl
$0c:e500  73 cb		 adc ($cb,s),y
$0c:e502  54 a9 53	  mvn $53,$a9
$0c:e505  28			plp
$0c:e506  ff fb 9f fe   sbc $fe9ffb,x
$0c:e50a  ee 24 16	  inc $1624
$0c:e50d  2a			rol a
$0c:e50e  09 c2		 ora #$c2
$0c:e510  61 f0		 adc ($f0,x)
$0c:e512  ac f4 53	  ldy $53f4
$0c:e515  a1 a2		 lda ($a2,x)
$0c:e517  d8			cld
$0c:e518  67 7e		 adc [$7e]
$0c:e51a  32 5f		 and ($5f)
$0c:e51c  0e eb f9	  asl $f9eb
$0c:e51f  44 10 82	  mvp $82,$10
$0c:e522  98			tya
$0c:e523  55 a1		 eor $a1,x
$0c:e525  bf a0 2a 43   lda $432aa0,x
$0c:e529  cd 18 37	  cmp $3718
$0c:e52c  a6 86		 ldx $86
$0c:e52e  ff 1b bf cc   sbc $ccbf1b,x
$0c:e532  6f fe 2f f4   adc $f42ffe
$0c:e536  3a			dec a
$0c:e537  7f 6a b7 ec   adc $ecb76a,x
$0c:e53b  44 a0 8e	  mvp $8e,$a0
$0c:e53e  34 38		 bit $38,x
$0c:e540  5f a0 2e 50   eor $502ea0,x
$0c:e544  42 a2		 wdm #$a2
$0c:e546  1c 26 1f	  trb $1f26
$0c:e549  cf 3f fa a9   cmp $a9fa3f
$0c:e54d  d4 e4		 pei ($e4)
$0c:e54f  7f 32 5f eb   adc $eb5f32,x
$0c:e553  5f b8 fe 48   eor $48feb8,x
$0c:e557  b0 43		 bcs $e59c
$0c:e559  87 56		 sta [$56]
$0c:e55b  54 23 24	  mvn $24,$23
$0c:e55e  28			plp
$0c:e55f  1f c8 e7 e8   ora $e8e7c8,x
$0c:e563  49 3f		 eor #$3f
$0c:e565  92 4f		 sta ($4f)
$0c:e567  d4 93		 pei ($93)
$0c:e569  80 bf		 bra $e52a
$0c:e56b  9b			txy
$0c:e56c  f0 9c		 beq $e50a
$0c:e56e  67 fa		 adc [$fa]
$0c:e570  01 92		 ora ($92,x)
$0c:e572  42 8f		 wdm #$8f
$0c:e574  fb			xce
$0c:e575  55 e9		 eor $e9,x
$0c:e577  d2 b8		 cmp ($b8)
$0c:e579  39 da a5	  and $a5da,y
$0c:e57c  3a			dec a
$0c:e57d  57 b7		 eor [$b7],y
$0c:e57f  c2 d9		 rep #$d9
$0c:e581  bc ba 19	  ldy $19ba,x
$0c:e584  e4 0b		 cpx $0b
$0c:e586  fd ef 8f	  sbc $8fef,x
$0c:e589  ff e3 fe b8   sbc $b8fee3,x
$0c:e58d  ff d2 1f 7b   sbc $7b1fd2,x
$0c:e591  83 46		 sta $46,s
$0c:e593  f0 1c		 beq $e5b1
$0c:e595  3f e4 07 fd   and $fd07e4,x
$0c:e599  01 ff		 ora ($ff,x)
$0c:e59b  b3 f0		 lda ($f0,s),y
$0c:e59d  ff dd 9f 37   sbc $379fdd,x
$0c:e5a1  97 77		 sta [$77],y
$0c:e5a3  b2 ce		 lda ($ce)
$0c:e5a5  f3 b7		 sbc ($b7,s),y
$0c:e5a7  fd ed fe	  sbc $feed,x
$0c:e5aa  6f 79 ec ef   adc $efec79
$0c:e5ae  74 f9		 stz $f9,x
$0c:e5b0  9f f7 fc ef   sta $effcf7,x
$0c:e5b4  ff 7b df fd   sbc $fddf7b,x
$0c:e5b8  77 c7		 adc [$c7],y
$0c:e5ba  75 f2		 adc $f2,x
$0c:e5bc  73 7d		 adc ($7d,s),y
$0c:e5be  74 9f		 stz $9f,x
$0c:e5c0  5e d6 c1	  lsr $c1d6,x
$0c:e5c3  33 8f		 and ($8f,s),y
$0c:e5c5  eb			xba
$0c:e5c6  6b			rtl
$0c:e5c7  d5 6c		 cmp $6c,x
$0c:e5c9  c3 fc		 cmp $fc,s
$0c:e5cb  3f 7f ff bf   and $bfff7f,x
$0c:e5cf  fb			xce
$0c:e5d0  ef ff ff 01   sbc $01ffff
$0c:e5d4  93 ff		 sta ($ff,s),y
$0c:e5d6  7d ec 5f	  adc $5fec,x
$0c:e5d9  bc d7 5e	  ldy $5ed7,x
$0c:e5dc  9d 7b 8d	  sta $8d7b,x
$0c:e5df  1d a1 df	  ora $dfa1,x
$0c:e5e2  24 71		 bit $71
$0c:e5e4  69 8c		 adc #$8c
$0c:e5e6  36 19		 rol $19,x
$0c:e5e8  27 ff		 and [$ff]
$0c:e5ea  c6 7f		 dec $7f
$0c:e5ec  f2 ff		 sbc ($ff)
$0c:e5ee  fc e7 ff	  jsr ($ffe7,x)
$0c:e5f1  3f bf c7 ef   and $efc7bf,x
$0c:e5f5  f0 f9		 beq $e5f0
$0c:e5f7  fc 0e 1f	  jsr ($1f0e,x)
$0c:e5fa  bf 8d df 6c   lda $6cdf8d,x
$0c:e5fe  ba			tsx
$0c:e5ff  de 4d d2	  dec $d24d,x
$0c:e602  f3 e6		 sbc ($e6,s),y
$0c:e604  fd 72 3e	  sbc $3e72,x
$0c:e607  51 0f		 eor ($0f),y
$0c:e609  27 40		 and [$40]
$0c:e60b  b6 1f		 ldx $1f,y
$0c:e60d  fc d7 ff	  jsr ($ffd7,x)
$0c:e610  ed ff cf	  sbc $cfff
$0c:e613  7f ff 9f e3   adc $e39fff,x
$0c:e617  38			sec
$0c:e618  7e 3f 9e	  ror $9e3f,x
$0c:e61b  0f 84 32 ff   ora $ff3284
$0c:e61f  a1 bf		 lda ($bf,x)
$0c:e621  c6 ef		 dec $ef
$0c:e623  f3 1b		 sbc ($1b,s),y
$0c:e625  ff 8b fd 73   sbc $73fd8b,x
$0c:e629  80 53		 bra $e67e
$0c:e62b  20 1d 7e	  jsr $7e1d
$0c:e62e  ba			tsx
$0c:e62f  41 af		 eor ($af,x)
$0c:e631  cd d1 6f	  cmp $6fd1
$0c:e634  04 a2		 tsb $a2
$0c:e636  01 30		 ora ($30,x)
$0c:e638  f8			sed
$0c:e639  56 7a		 lsr $7a,x
$0c:e63b  36 9f		 rol $9f,x
$0c:e63d  0e 8b 61	  asl $618b
$0c:e640  9d f8 c7	  sta $c7f8,x
$0c:e643  60			rts
$0c:e644  37 28		 and [$28],y
$0c:e646  06 6f		 asl $6f
$0c:e648  36 de		 rol $de,x
$0c:e64a  0e f4 83	  asl $83f4
$0c:e64d  dd 10 df	  cmp $df10,x
$0c:e650  d0 3f		 bne $e691
$0c:e652  d0 05		 bne $e659
$0c:e654  38			sec
$0c:e655  37 82		 and [$82],y
$0c:e657  c9 00		 cmp #$00
$0c:e659  9a			txs
$0c:e65a  7f aa 7d eb   adc $eb7daa,x
$0c:e65e  47 b3		 eor [$b3]
$0c:e660  4b			phk
$0c:e661  bc cc fe	  ldy $fecc,x
$0c:e664  26 d0		 rol $d0
$0c:e666  eb			xba
$0c:e667  4c 12 ab	  jmp $ab12
$0c:e66a  52 6f		 eor ($6f)
$0c:e66c  07 7e		 ora [$7e]
$0c:e66e  41 ed		 eor ($ed,x)
$0c:e670  89 6f		 bit #$6f
$0c:e672  68			pla
$0c:e673  5f 98 33 78   eor $783398,x
$0c:e677  3f b0 2d 7c   and $7c2db0,x
$0c:e67b  02 31		 cop #$31
$0c:e67d  08			php
$0c:e67e  92 42		 sta ($42)
$0c:e680  a1 11		 lda ($11,x)
$0c:e682  18			clc
$0c:e683  34 4e		 bit $4e,x
$0c:e685  39 00 81	  and $8100,y
$0c:e688  cb			wai
$0c:e689  63 d2		 adc $d2,s
$0c:e68b  c9 2c		 cmp #$2c
$0c:e68d  7a			ply
$0c:e68e  11 10		 ora ($10),y
$0c:e690  87 4b		 sta [$4b]
$0c:e692  a3 f1		 lda $f1,s
$0c:e694  f8			sed
$0c:e695  eb			xba
$0c:e696  8c 23 f3	  sty $f323
$0c:e699  e9 fb		 sbc #$fb
$0c:e69b  a8			tay
$0c:e69c  b6 b8		 ldx $b8,y
$0c:e69e  09 05		 ora #$05
$0c:e6a0  7e 11 77	  ror $7711,x
$0c:e6a3  9a			txs
$0c:e6a4  df f4 9a 44   cmp $449af4,x
$0c:e6a8  18			clc
$0c:e6a9  48			pha
$0c:e6aa  bf f4 9f fd   lda $fd9ff4,x
$0c:e6ae  fc 50 62	  jsr ($6250,x)
$0c:e6b1  80 ad		 bra $e660
$0c:e6b3  9f d7 db 00   sta $00dbd7,x
$0c:e6b7  c0 5f e2	  cpy #$e25f
$0c:e6ba  be bb 7f	  ldx $7fbb,y
$0c:e6bd  fe 97 4a	  inc $4a97,x
$0c:e6c0  41 86		 eor ($86,x)
$0c:e6c2  2b			pld
$0c:e6c3  fd 12 ff	  sbc $ff12,x
$0c:e6c6  00 8c		 brk #$8c
$0c:e6c8  04 3b		 tsb $3b
$0c:e6ca  54 18 a2	  mvn $a2,$18
$0c:e6cd  01 10		 ora ($10,x)
$0c:e6cf  10 9f		 bpl $e670
$0c:e6d1  d4 3b		 pei ($3b)
$0c:e6d3  fb			xce
$0c:e6d4  21 fe		 and ($fe,x)
$0c:e6d6  62 3f d7	  per $be18
$0c:e6d9  0f ff 60 cc   ora $cc60ff
$0c:e6dd  06 00		 asl $00
$0c:e6df  cf c1 ff f0   cmp $f0ffc1
$0c:e6e3  32 00		 and ($00)
$0c:e6e5  a2 0d 06	  ldx #$060d
$0c:e6e8  36 0f		 rol $0f,x
$0c:e6ea  fc c2 7f	  jsr ($7fc2,x)
$0c:e6ed  d8			cld
$0c:e6ee  cf db f9 fa   cmp $faf9db
$0c:e6f2  7b			tdc
$0c:e6f3  3c c2 c1	  bit $c1c2,x
$0c:e6f6  5c 98 45 f7   jml $f74598
$0c:e6fa  10 bd		 bpl $e6b9
$0c:e6fc  e7 03		 sbc [$03]
$0c:e6fe  ff e0 ff fc   sbc $fcffe0,x
$0c:e702  3f ff 80 11   and $1180ff,x
$0c:e706  bf c1 fe 01   lda $01fec1,x
$0c:e70a  10 37		 bpl $e743
$0c:e70c  d1 20		 cmp ($20),y
$0c:e70e  0f de 46 52   ora $5246de
$0c:e712  3a			dec a
$0c:e713  1f 7e 01 13   ora $13017e,x
$0c:e717  9d ca e2	  sta $e2ca,x
$0c:e71a  70 f8		 bvs $e714
$0c:e71c  bc 66 0f	  ldy $0f66,x
$0c:e71f  1a			inc a
$0c:e720  82 c1 a0	  brl $87e4
$0c:e723  30 18		 bmi $e73d
$0c:e725  14 06		 trb $06
$0c:e727  01 04		 ora ($04,x)
$0c:e729  9f af c2 01   sta $01c2af,x
$0c:e72d  1f 61 9c 1e   ora $1e9c61,x
$0c:e731  01 03		 ora ($03,x)
$0c:e733  80 2e		 bra $e763
$0c:e735  80 54		 bra $e78b
$0c:e737  6c f6 4e	  jmp ($4ef6)
$0c:e73a  fc 02 31	  jsr ($3102,x)
$0c:e73d  07 a7		 ora [$a7]
$0c:e73f  cf f6 b7 2c   cmp $2cb7f6
$0c:e743  8e 36 bf	  stx $bf36
$0c:e746  3b			tsc
$0c:e747  a9 4e		 lda #$4e
$0c:e749  b6 bf		 ldx $bf,y
$0c:e74b  4b			phk
$0c:e74c  34 d5		 bit $d5,x
$0c:e74e  bc 50 f8	  ldy $f850,x
$0c:e751  05 fa		 ora $fa
$0c:e753  01 fc		 ora ($fc,x)
$0c:e755  80 7f		 bra $e7d6
$0c:e757  60			rts
$0c:e758  17 b8		 ora [$b8],y
$0c:e75a  07 ee		 ora [$ee]
$0c:e75c  01 06		 ora ($06,x)
$0c:e75e  c3 66		 cmp $66,s
$0c:e760  3b			tsc
$0c:e761  16 6b		 asl $6b,x
$0c:e763  0e cf 1f	  asl $1fcf
$0c:e766  d8			cld
$0c:e767  9c 59 fc	  stz $fc59
$0c:e76a  14 fe		 trb $fe
$0c:e76c  06 5f		 asl $5f
$0c:e76e  10 bd		 bpl $e72d
$0c:e770  06 50		 asl $50
$0c:e772  67 e0		 adc [$e0]
$0c:e774  17 f8		 ora [$f8],y
$0c:e776  07 e2		 ora [$e2]
$0c:e778  0f e0 8f f0   ora $f08fe0
$0c:e77c  27 e7		 and [$e7]
$0c:e77e  b0 87		 bcs $e707
$0c:e780  43 fe		 eor $fe,s
$0c:e782  70 3f		 bvs $e7c3
$0c:e784  67 c2		 adc [$c2]
$0c:e786  35 1c		 and $1c,x
$0c:e788  fe ff be	  inc $beff,x
$0c:e78b  50 4e		 bvc $e7db
$0c:e78d  2c 1b 75	  bit $751b
$0c:e790  3b			tsc
$0c:e791  f8			sed
$0c:e792  01 85		 ora ($85,x)
$0c:e794  20 11 f3	  jsr $f311
$0c:e797  08			php
$0c:e798  08			php
$0c:e799  00 4e		 brk #$4e
$0c:e79b  1f 89 df 13   ora $13df89,x
$0c:e79f  01 00		 ora ($00,x)
$0c:e7a1  d8			cld
$0c:e7a2  70 3e		 bvs $e7e2
$0c:e7a4  9f 8a d5 b2   sta $b2d58a,x
$0c:e7a8  57 34		 eor [$34],y
$0c:e7aa  d7 cd		 cmp [$cd],y
$0c:e7ac  3b			tsc
$0c:e7ad  fe ba d5	  inc $d5ba,x
$0c:e7b0  a2 00 5f	  ldx #$5f00
$0c:e7b3  32 78		 and ($78)
$0c:e7b5  70 20		 bvs $e7d7
$0c:e7b7  1c 48 24	  trb $2448
$0c:e7ba  2e 17 87	  rol $8717
$0c:e7bd  2f 9a f0 57   and $57f09a
$0c:e7c1  41 01		 eor ($01,x)
$0c:e7c3  c1 40		 cmp ($40,x)
$0c:e7c5  b0 30		 bcs $e7f7
$0c:e7c7  0e 31 ec	  asl $ec31
$0c:e7ca  0f ee 1f 2c   ora $2c1fee
$0c:e7ce  79 94 0b	  adc $0b94,y
$0c:e7d1  e3 40		 sbc $40,s
$0c:e7d3  e0 25 03	  cpx #$0325
$0c:e7d6  41 80		 eor ($80,x)
$0c:e7d8  a8			tay
$0c:e7d9  48			pha
$0c:e7da  2b			pld
$0c:e7db  3d 9d 4e	  and $4e9d,x
$0c:e7de  20 be 92	  jsr $92be
$0c:e7e1  08			php
$0c:e7e2  05 c2		 ora $c2
$0c:e7e4  00 3f		 brk #$3f
$0c:e7e6  0e c4 83	  asl $83c4
$0c:e7e9  17 70		 ora [$70],y
$0c:e7eb  66 14		 ror $14
$0c:e7ed  22 01 14 84   jsl $841401
$0c:e7f1  49 23		 eor #$23
$0c:e7f3  17 4f		 ora [$4f],y
$0c:e7f5  c4 56		 cpy $56
$0c:e7f7  31 57		 and ($57),y
$0c:e7f9  cc 21 c4	  cpy $c421
$0c:e7fc  e8			inx
$0c:e7fd  07 f5		 ora [$f5]
$0c:e7ff  f0 32		 beq $e833
$0c:e801  87 41		 sta [$41]
$0c:e803  40			rti
$0c:e804  ec 6c 2d	  cpx $2d6c
$0c:e807  9c 0b cf	  stz $cf0b
$0c:e80a  5b			tcd
$0c:e80b  e7 97		 sbc [$97]
$0c:e80d  de 5d 28	  dec $285d,x
$0c:e810  bc dd 52	  ldy $52dd,x
$0c:e813  f8			sed
$0c:e814  70 18		 bvs $e82e
$0c:e816  0e c7 03	  asl $03c7
$0c:e819  99 c0 c7	  sta $c7c0,y
$0c:e81c  60			rts
$0c:e81d  21 b0		 and ($b0,x)
$0c:e81f  29 ec		 and #$ec
$0c:e821  0a			asl a
$0c:e822  f1 07		 sbc ($07),y
$0c:e824  c9 5f		 cmp #$5f
$0c:e826  fa			plx
$0c:e827  74 3e		 stz $3e,x
$0c:e829  5d 2e 7b	  eor $7b2e,x
$0c:e82c  bd cd 46	  lda $46cd,x
$0c:e82f  3c 96 4f	  bit $4f96,x
$0c:e832  9d ce bd	  sta $bdce,x
$0c:e835  de 21 04	  dec $0421,x
$0c:e838  f3 ff		 sbc ($ff,s),y
$0c:e83a  34 ff		 bit $ff,x
$0c:e83c  d0 bf		 bne $e7fd
$0c:e83e  f6 7f		 inc $7f,x
$0c:e840  fc 6f ff	  jsr ($ff6f,x)
$0c:e843  0c ff c8	  tsb $c8ff
$0c:e846  7f f4 df f4   adc $f4dff4,x
$0c:e84a  62 33 ab	  per $9380
$0c:e84d  c0 4d e6	  cpy #$e64d
$0c:e850  96 db		 stx $db,y
$0c:e852  66 53		 ror $53
$0c:e854  0b			phd
$0c:e855  cb			wai
$0c:e856  e5 6b		 sbc $6b
$0c:e858  31 a4		 and ($a4),y
$0c:e85a  20 f3 7f	  jsr $7ff3
$0c:e85d  ef df fe 57   sbc $57fedf
$0c:e861  ff 25 ff bd   sbc $bdff25,x
$0c:e865  00 86		 brk #$86
$0c:e867  e5 ff		 sbc $ff
$0c:e869  e7 73		 sbc [$73]
$0c:e86b  f8			sed
$0c:e86c  fc 7b 1f	  jsr ($1f7b,x)
$0c:e86f  8c 66 1a	  sty $1a66
$0c:e872  9b			txy
$0c:e873  4e e6 e3	  lsr $e3e6
$0c:e876  b0 b8		 bcs $e830
$0c:e878  54 76 33	  mvn $33,$76
$0c:e87b  0f fc e3 ff   ora $ffe3fc
$0c:e87f  1c 21 0c	  trb $0c21
$0c:e882  5b			tcd
$0c:e883  ff 0e ff c3   sbc $c3ff0e,x
$0c:e887  c9 03		 cmp #$03
$0c:e889  ab			plb
$0c:e88a  ee 4b 7b	  inc $7b4b
$0c:e88d  d9 5e 76	  cmp $765e,y
$0c:e890  53 9f		 eor ($9f,s),y
$0c:e892  c4 f7		 cpy $f7
$0c:e894  f1 bd		 sbc ($bd),y
$0c:e896  fe cf ae	  inc $aecf,x
$0c:e899  b3 eb		 lda ($eb,s),y
$0c:e89b  3f ff 97 d2   and $d297ff,x
$0c:e89f  3e 66 18	  rol $1866,x
$0c:e8a2  69 a8		 adc #$a8
$0c:e8a4  78			sei
$0c:e8a5  dc 0d fd	  jml [$fd0d]
$0c:e8a8  ff ff 80 38   sbc $3880ff,x
$0c:e8ac  01 c0		 ora ($c0,x)
$0c:e8ae  6f f0 28 1c   adc $1c28f0
$0c:e8b2  06 05		 asl $05
$0c:e8b4  bf 39 87 fd   lda $fd8739,x
$0c:e8b8  04 87		 tsb $87
$0c:e8ba  90 81		 bcc $e83d
$0c:e8bc  a2 c5 9e	  ldx #$9ec5
$0c:e8bf  08			php
$0c:e8c0  21 80		 and ($80,x)
$0c:e8c2  47 7f		 eor [$7f]
$0c:e8c4  a5 f0		 lda $f0
$0c:e8c6  ff ff 37 f7   sbc $f737ff,x
$0c:e8ca  ec e8 8c	  cpx $8ce8
$0c:e8cd  12 60		 ora ($60)
$0c:e8cf  82 1f ef	  brl $d7f1
$0c:e8d2  fb			xce
$0c:e8d3  ff f8 fe 7e   sbc $7efef8,x
$0c:e8d7  ff df d4 10   sbc $10d4df,x
$0c:e8db  7c bf d5	  jmp ($d5bf,x)
$0c:e8de  aa			tax
$0c:e8df  f5 aa		 sbc $aa,x
$0c:e8e1  c5 2d		 cmp $2d
$0c:e8e3  b0 cd		 bcs $e8b2
$0c:e8e5  6e 31 59	  ror $5931
$0c:e8e8  8c 4e 67	  sty $674e
$0c:e8eb  0b			phd
$0c:e8ec  8d c0 41	  sta $41c0
$0c:e8ef  81 7f		 sta ($7f,x)
$0c:e8f1  8e df e3	  stx $e3df
$0c:e8f4  d7 f8		 cmp [$f8],y
$0c:e8f6  73 18		 adc ($18,s),y
$0c:e8f8  27 f0		 and [$f0]
$0c:e8fa  c9 fc		 cmp #$fc
$0c:e8fc  12 3f		 ora ($3f)
$0c:e8fe  df fc 76 ff   cmp $ff76fc,x
$0c:e902  99 9f f6	  sta $f69f,y
$0c:e905  57 fd		 eor [$fd],y
$0c:e907  55 df		 eor $df,x
$0c:e909  57 77		 eor [$77],y
$0c:e90b  da			phx
$0c:e90c  ab			plb
$0c:e90d  66 b2		 ror $b2
$0c:e90f  d0 1f		 bne $e930
$0c:e911  06 fc		 asl $fc
$0c:e913  44 3f d1	  mvp $d1,$3f
$0c:e916  0f e4 62 97   ora $9762e4
$0c:e91a  85 a1		 sta $a1
$0c:e91c  d6 fa		 dec $fa,x
$0c:e91e  f2 6d		 sbc ($6d)
$0c:e920  76 63		 ror $63,x
$0c:e922  11 75		 ora ($75),y
$0c:e924  88			dey
$0c:e925  52 e4		 eor ($e4)
$0c:e927  1f f9 07 5e   ora $5e07f9,x
$0c:e92b  41 df		 eor ($df,x)
$0c:e92d  90 73		 bcc $e9a2
$0c:e92f  e4 1b		 cpx $1b
$0c:e931  ea			nop
$0c:e932  0e e2 8f	  asl $8fe2
$0c:e935  30 01		 bmi $e938
$0c:e937  87 7e		 sta [$7e]
$0c:e939  c1 9f		 cmp ($9f,x)
$0c:e93b  df e0 2d d1   cmp $d12de0,x
$0c:e93f  0f 74 43 99   ora $994374
$0c:e943  30 e6		 bmi $e92b
$0c:e945  cc 31 d7	  cpy $d731
$0c:e948  1c 6d ce	  trb $ce6d
$0c:e94b  17 f3		 ora [$f3],y
$0c:e94d  c0 5f db	  cpy #$db5f
$0c:e950  e3 fe		 sbc $fe,s
$0c:e952  11 84		 ora ($84),y
$0c:e954  07 f9		 ora [$f9]
$0c:e956  03 14		 ora $14,s
$0c:e958  1c 2a 0f	  trb $0f2a
$0c:e95b  2a			rol a
$0c:e95c  88			dey
$0c:e95d  d5 27		 cmp $27,x
$0c:e95f  79 bb fc	  adc $fcbb,y
$0c:e962  df ef 64 f2   cmp $f264ef,x
$0c:e966  1b			tcs
$0c:e967  c2 35		 rep #$35
$0c:e969  03 8f		 ora $8f,s
$0c:e96b  e0 27 f0	  cpx #$f027
$0c:e96e  01 01		 ora ($01,x)
$0c:e970  7d e1 1e	  adc $1ee1,x
$0c:e973  48			pha
$0c:e974  df 02 7e 29   cmp $297e02,x
$0c:e978  09 1c 73	  ora #$731c
$0c:e97b  3d 7f f6	  and $f67f,x
$0c:e97e  f8			sed
$0c:e97f  77 b8		 adc [$b8],y
$0c:e981  1f 24 03 6f   ora $6f0324,x
$0c:e985  38			sec
$0c:e986  c2 7a		 rep #$7a
$0c:e988  f2 75		 sbc ($75)
$0c:e98a  f7 01		 sbc [$01],y
$0c:e98c  78			sei
$0c:e98d  63 d8		 adc $d8,s
$0c:e98f  1b			tcs
$0c:e990  f2 84		 sbc ($84)
$0c:e992  01 21		 ora ($21,x)
$0c:e994  f0 8f		 beq $e925
$0c:e996  f8			sed
$0c:e997  2f f4 b8 3c   and $3cb8f4
$0c:e99b  92 39		 sta ($39)
$0c:e99d  a7 b0		 lda [$b0]
$0c:e99f  6e 30 fc	  ror $fc30
$0c:e9a2  d9 ed c7	  cmp $c7ed,y
$0c:e9a5  e3 c2		 sbc $c2,s
$0c:e9a7  e1 c0		 sbc ($c0,x)
$0c:e9a9  a0 7b f8	  ldy #$f87b
$0c:e9ac  00 a0		 brk #$a0
$0c:e9ae  3c 03 f0	  bit $f003,x
$0c:e9b1  bf c0 bf f0   lda $f0bfc0,x
$0c:e9b5  ef fc f3 ff   sbc $fff3fc
$0c:e9b9  fc ff db	  jsr ($dbff,x)
$0c:e9bc  61 7e		 adc ($7e,x)
$0c:e9be  38			sec
$0c:e9bf  7f 7e 3f 53   adc $533f7e,x
$0c:e9c3  c9 d0 b0	  cmp #$b0d0
$0c:e9c6  75 2c		 adc $2c,x
$0c:e9c8  1f da 0f 76   ora $760fda,x
$0c:e9cc  c3 c3		 cmp $c3,s
$0c:e9ce  fe 09 f0	  inc $f009,x
$0c:e9d1  36 04		 rol $04,x
$0c:e9d3  4f d8 29 28   eor $2829d8
$0c:e9d7  3f e1 56 15   and $1556e1,x
$0c:e9db  4c dd 57	  jmp $57dd
$0c:e9de  37 56		 and [$56],y
$0c:e9e0  cd 54 73	  cmp $7354
$0c:e9e3  95 4c		 sta $4c,x
$0c:e9e5  ef 0e 33 a8   sbc $a8330e
$0c:e9e9  9d 6d a6	  sta $a66d,x
$0c:e9ec  5e 08 02	  lsr $0208,x
$0c:e9ef  fc 3c 30	  jsr ($303c,x)
$0c:e9f2  0f 1b 10 7c   ora $7c101b
$0c:e9f6  f0 0e		 beq $ea06
$0c:e9f8  34 07		 bit $07,x
$0c:e9fa  9d 01 eb	  sta $eb01,x
$0c:e9fd  ec 26 f7	  cpx $f726
$0c:ea00  09 7d 82	  ora #$827d
$0c:ea03  9f c0 cf e0   sta $e0cfc0,x
$0c:ea07  27 b0		 and [$b0]
$0c:ea09  2b			pld
$0c:ea0a  ec 0b fb	  cpx $fb0b
$0c:ea0d  02 b8		 cop #$b8
$0c:ea0f  27 c5		 and [$c5]
$0c:ea11  06 04		 asl $04
$0c:ea13  b0 0f		 bcs $ea24
$0c:ea15  9b			txy
$0c:ea16  a8			tay
$0c:ea17  7c 96 4e	  jmp ($4e96,x)
$0c:ea1a  75 3b		 adc $3b,x
$0c:ea1c  3b			tsc
$0c:ea1d  1c f8 cc	  trb $ccf8
$0c:ea20  72 b0		 adc ($b0)
$0c:ea22  5a			phy
$0c:ea23  77 3b		 adc [$3b],y
$0c:ea25  cf 40 fd c1   cmp $c1fd40
$0c:ea29  23 7f		 and $7f,s
$0c:ea2b  f9 8f fe	  sbc $fe8f,y
$0c:ea2e  c7 ff		 cmp [$ff]
$0c:ea30  a7 7f		 lda [$7f]
$0c:ea32  ef 40 01 9f   sbc $9f0140
$0c:ea36  ba			tsx
$0c:ea37  87 2f		 sta [$2f]
$0c:ea39  84 ad		 sty $ad
$0c:ea3b  c6 2c		 dec $2c
$0c:ea3d  f6 0e		 inc $0e,x
$0c:ea3f  cf 02 8d 45   cmp $458d02
$0c:ea43  dd 6e 75	  cmp $756e,x
$0c:ea46  b0 0e		 bcs $ea56
$0c:ea48  7c c0 0e	  jmp ($0ec0,x)
$0c:ea4b  1e 6f fe	  asl $fe6f,x
$0c:ea4e  7b			tdc
$0c:ea4f  ff 3e ff ee   sbc $eeff3e,x
$0c:ea53  bf f4 6f ff   lda $ff6ff4,x
$0c:ea57  f9 d4 35	  sbc $35d4,y
$0c:ea5a  9f c5 23 f1   sta $f123c5,x
$0c:ea5e  ac de 65	  ldy $65de
$0c:ea61  73 b2		 adc ($b2,s),y
$0c:ea63  ac 77 6e	  ldy $6e77
$0c:ea66  87 ad		 sta [$ad]
$0c:ea68  b1 5d		 lda ($5d),y
$0c:ea6a  36 70		 rol $70,x
$0c:ea6c  7f f8 fc 28   adc $28fcf8,x
$0c:ea70  7f fb 17 fe   adc $fe17fb,x
$0c:ea74  e2 8a		 sep #$8a
$0c:ea76  18			clc
$0c:ea77  ff fe 1f ff   sbc $ff1ffe,x
$0c:ea7b  fd fd ef	  sbc $effd,x
$0c:ea7e  37 5b		 and [$5b],y
$0c:ea80  25 c2		 and $c2
$0c:ea82  ef 73 b9 da   sbc $dab973
$0c:ea86  3e 1c c9	  rol $c91c,x
$0c:ea89  4f 97 9f b9   eor $b99f97
$0c:ea8d  26 86		 rol $86
$0c:ea8f  37 ff		 and [$ff],y
$0c:ea91  8c ff e3	  sty $e3ff
$0c:ea94  ff f9 ff f8   sbc $f8fff9,x
$0c:ea98  2c 23 df	  bit $df23
$0c:ea9b  f8			sed
$0c:ea9c  37 fe		 and [$fe],y
$0c:ea9e  03 00		 ora $00,s
$0c:eaa0  80 40		 bra $eae2
$0c:eaa2  4e 40 70	  lsr $7040
$0c:eaa5  03 ab		 ora $ab,s
$0c:eaa7  1c 84 e5	  trb $e584
$0c:eaaa  74 a9		 stz $a9,x
$0c:eaac  e5 6a		 sbc $6a
$0c:eaae  79 fd 9f	  adc $9ffd,y
$0c:eab1  69 6c d4	  adc #$d46c
$0c:eab4  6e 3c 0a	  ror $0a3c
$0c:eab7  06 9a		 asl $9a
$0c:eab9  03 90		 ora $90,s
$0c:eabb  7f d3 e7 e7   adc $e7e7d3,x
$0c:eabf  f3 f1		 sbc ($f1,s),y
$0c:eac1  f8			sed
$0c:eac2  e9 a1 4e	  sbc #$4ea1
$0c:eac5  0c 2e 37	  tsb $372e
$0c:eac8  05 86		 ora $86
$0c:eaca  c3 d6		 cmp $d6,s
$0c:eacc  21 05		 and ($05,x)
$0c:eace  81 41		 sta ($41,x)
$0c:ead0  e0 f0 28	  cpx #$28f0
$0c:ead3  0a			asl a
$0c:ead4  64 20		 stz $20
$0c:ead6  10 48		 bpl $eb20
$0c:ead8  fc 0a 1e	  jsr ($1e0a,x)
$0c:eadb  c1 28		 cmp ($28,x)
$0c:eadd  04 1d		 tsb $1d
$0c:eadf  8e 2b d0	  stx $d02b
$0c:eae2  81 ed		 sta ($ed,x)
$0c:eae4  2f 17 01 80   and $800117
$0c:eae8  7c 3c 15	  jmp ($153c,x)
$0c:eaeb  0d 05 42	  ora $4205
$0c:eaee  81 80		 sta ($80,x)
$0c:eaf0  c0 1d 4b	  cpy #$4b1d
$0c:eaf3  f9 00 fc	  sbc $fc00,y
$0c:eaf6  38			sec
$0c:eaf7  47 e0		 eor [$e0]
$0c:eaf9  e5 1e		 sbc $1e
$0c:eafb  04 01		 tsb $01
$0c:eafd  b6 39		 ldx $39,y
$0c:eaff  fa			plx
$0c:eb00  05 fb		 ora $fb
$0c:eb02  83 bc		 sta $bc,s
$0c:eb04  c1 de		 cmp ($de,x)
$0c:eb06  60			rts
$0c:eb07  f7 38		 sbc [$38],y
$0c:eb09  7f 9a 3d cc   adc $cc3d9a,x
$0c:eb0d  9e 66 af	  stz $af66,x
$0c:eb10  14 0d		 trb $0d
$0c:eb12  ff 02 7f 80   sbc $807f02,x
$0c:eb16  bf 8b 40 5a   lda $5a408b,x
$0c:eb1a  09 e0 81	  ora #$81e0
$0c:eb1d  90 06		 bcc $eb25
$0c:eb1f  bd e6 ae	  lda $aee6,x
$0c:eb22  f9 3b 7e	  sbc $7e3b,y
$0c:eb25  0a			asl a
$0c:eb26  fd 82 3f	  sbc $3f82,x
$0c:eb29  60			rts
$0c:eb2a  8e 58 37	  stx $3758
$0c:eb2d  1c 0d 8f	  trb $8f0d
$0c:eb30  06 0d		 asl $0d
$0c:eb32  f9 82 7e	  sbc $7e82,y
$0c:eb35  c0 e1 80	  cpy #$80e1
$0c:eb38  12 18		 ora ($18)
$0c:eb3a  1c 7f d6	  trb $d67f
$0c:eb3d  98			tya
$0c:eb3e  77 1e		 adc [$1e],y
$0c:eb40  13 b3		 ora ($b3,s),y
$0c:eb42  9d e3 a6	  sta $a6e3,x
$0c:eb45  b5 2b		 lda $2b,x
$0c:eb47  3c b6 95	  bit $95b6,x
$0c:eb4a  9f ea 5a b7   sta $b75aea,x
$0c:eb4e  90 ff		 bcc $eb4f
$0c:eb50  84 3b		 sty $3b
$0c:eb52  e1 3d		 sbc ($3d,x)
$0c:eb54  e0 ce 78	  cpx #$78ce
$0c:eb57  37 bc		 and [$bc],y
$0c:eb59  1d cf 07	  ora $07cf,x
$0c:eb5c  e7 83		 sbc [$83]
$0c:eb5e  f3 e1		 sbc ($e1,s),y
$0c:eb60  fa			plx
$0c:eb61  6d f6 a2	  adc $a2f6
$0c:eb64  71 b0		 adc ($b0),y
$0c:eb66  98			tya
$0c:eb67  68			pla
$0c:eb68  64 0c		 stz $0c
$0c:eb6a  80 8f		 bra $eafb
$0c:eb6c  c0 2e d0	  cpy #$d02e
$0c:eb6f  8f 74 43 83   sta $834374
$0c:eb73  ff e3 ff f9   sbc $f9ffe3,x
$0c:eb77  ff fe fa 7d   sbc $7dfafe,x
$0c:eb7b  13 e3		 ora ($e3,s),y
$0c:eb7d  04 83		 tsb $83
$0c:eb7f  c9 e0 fc	  cmp #$fce0
$0c:eb82  98			tya
$0c:eb83  4e 4a 27	  lsr $274a
$0c:eb86  84 83		 sty $83
$0c:eb88  c2 61		 rep #$61
$0c:eb8a  d1 28		 cmp ($28),y
$0c:eb8c  e4 96		 cpx $96
$0c:eb8e  73 f8		 adc ($f8,s),y
$0c:eb90  ff 9f c3 ed   sbc $edc39f,x
$0c:eb94  ff f6 20 07   sbc $0720f6,x
$0c:eb98  e1 ff		 sbc ($ff,x)
$0c:eb9a  f0 7f		 beq $ec1b
$0c:eb9c  f8			sed
$0c:eb9d  3f ef 26 1e   and $1e26ef,x
$0c:eba1  d3 8e		 cmp ($8e,s),y
$0c:eba3  a4 e3		 ldy $e3
$0c:eba5  ba			tsx
$0c:eba6  51 cd		 eor ($cd),y
$0c:eba8  bc e2 59	  ldy $59e2,x
$0c:ebab  33 ea		 and ($ea,s),y
$0c:ebad  7b			tdc
$0c:ebae  24 7e		 bit $7e
$0c:ebb0  08			php
$0c:ebb1  3f e0 7e 03   and $037ee0,x
$0c:ebb5  f0 8f		 beq $eb46
$0c:ebb7  f8			sed
$0c:ebb8  27 e0		 and [$e0]
$0c:ebba  10 e0		 bpl $eb9c
$0c:ebbc  7f 20 7e 08   adc $087e20,x
$0c:ebc0  fe a2 49	  inc $49a2,x
$0c:ebc3  55 a6		 eor $a6,x
$0c:ebc5  4a			lsr a
$0c:ebc6  63 1d		 adc $1d,s
$0c:ebc8  39 86 be	  and $be86,y
$0c:ebcb  c1 9f		 cmp ($9f,x)
$0c:ebcd  c0 5f a0	  cpy #$a05f
$0c:ebd0  3f 88 3f 72   and $723f88,x
$0c:ebd4  07 bc		 ora [$bc]
$0c:ebd6  81 af		 sta ($af,x)
$0c:ebd8  41 44		 eor ($44,x)
$0c:ebda  0a			asl a
$0c:ebdb  d0 01		 bne $ebde
$0c:ebdd  a7 e4		 lda [$e4]
$0c:ebdf  3e 10 6f	  rol $6f10,x
$0c:ebe2  dc 1b a3	  jml [$a31b]
$0c:ebe5  2e db d3	  rol $d3db
$0c:ebe8  25 7d		 and $7d
$0c:ebea  ca			dex
$0c:ebeb  5e f2 6f	  lsr $6ff2,x
$0c:ebee  f8			sed
$0c:ebef  80 01		 bra $ebf2
$0c:ebf1  85 bf		 sta $bf
$0c:ebf3  58			cli
$0c:ebf4  1f f7 0b f9   ora $f90bf7,x
$0c:ebf8  e6 fc		 inc $fc
$0c:ebfa  7d bd 1c	  adc $1cbd,x
$0c:ebfd  ff ce bb 91   sbc $91bbce,x
$0c:ec01  47 c2		 eor [$c2]
$0c:ec03  c0 a0 66	  cpy #$66a0
$0c:ec06  66 ff		 ror $ff
$0c:ec08  7f fe ff ff   adc $fffffe,x
$0c:ec0c  d7 ff		 cmp [$ff],y
$0c:ec0e  f9 ff e5	  sbc $e5ff,y
$0c:ec11  ff fa b3 e9   sbc $e9b3fa,x
$0c:ec15  f4 22 15	  pea $1522
$0c:ec18  d3 eb		 cmp ($eb,s),y
$0c:ec1a  f9 e5 5c	  sbc $5ce5,y
$0c:ec1d  dd 2c e3	  cmp $e32c,x
$0c:ec20  35 c4		 and $c4,x
$0c:ec22  33 27		 and ($27,s),y
$0c:ec24  f7 ff		 sbc [$ff],y
$0c:ec26  fb			xce
$0c:ec27  04 09		 tsb $09
$0c:ec29  8c 27 ff	  sty $ff27
$0c:ec2c  fa			plx
$0c:ec2d  de e2 59	  dec $59e2,x
$0c:ec30  dc 8b 7b	  jml [$7b8b]
$0c:ec33  a3 3e		 lda $3e,s
$0c:ec35  78			sei
$0c:ec36  67 ce		 adc [$ce]
$0c:ec38  2d f9 89	  and $89f9
$0c:ec3b  ff 27 1f f8   sbc $f81f27,x
$0c:ec3f  3f fd fc 10   and $10fcfd,x
$0c:ec43  17 04		 ora [$04],y
$0c:ec45  d0 b3		 bne $ebfa
$0c:ec47  3a			dec a
$0c:ec48  df 2d 4a dd   cmp $dd4a2d,x
$0c:ec4c  39 9c 73	  and $739c,y
$0c:ec4f  b8			clv
$0c:ec50  3c 5e 14	  bit $145e,x
$0c:ec53  b7 c3		 lda [$c3],y
$0c:ec55  a7 f5		 lda [$f5]
$0c:ec57  cd b9 f1	  cmp $f1b9
$0c:ec5a  2e 7e 07	  rol $077e
$0c:ec5d  ff c7 16 08   sbc $0816c7,x
$0c:ec61  b4 23		 ldy $23,x
$0c:ec63  df f8 e7 fe   cmp $fee7f8,x
$0c:ec67  0b			phd
$0c:ec68  02 7f		 cop #$7f
$0c:ec6a  8c 01 16	  sty $1601
$0c:ec6d  1f 0b f8 b0   ora $b0f80b,x
$0c:ec71  33 b7		 and ($b7,s),y
$0c:ec73  ed cd f8	  sbc $f8cd
$0c:ec76  e4 2f		 cpx $2f
$0c:ec78  f2 bf		 sbc ($bf)
$0c:ec7a  df f7 e2 d0   cmp $d0e2f7,x
$0c:ec7e  3c 03 fc	  bit $fc03,x
$0c:ec81  36 10		 rol $10,x
$0c:ec83  0c 81 d0	  tsb $d081
$0c:ec86  20 08 f2	  jsr $f208
$0c:ec89  47 82		 eor [$82]
$0c:ec8b  4c a2 1e	  jmp $1ea2
$0c:ec8e  f4 f8 48	  pea $48f8
$0c:ec91  3b			tsc
$0c:ec92  ea			nop
$0c:ec93  30 4f		 bmi $ece4
$0c:ec95  b2 3c		 lda ($3c)
$0c:ec97  62 09 30	  per $1ca3
$0c:ec9a  d0 48		 bne $ece4
$0c:ec9c  12 e2		 ora ($e2)
$0c:ec9e  b2 38		 lda ($38)
$0c:eca0  ff 81 7e 13   sbc $137e81,x
$0c:eca4  fe 04 bf	  inc $bf04,x
$0c:eca7  a0 bf 68	  ldy #$68bf
$0c:ecaa  84 7d		 sty $7d
$0c:ecac  9e 0b e0	  stz $e00b,x
$0c:ecaf  90 4b		 bcc $ecfc
$0c:ecb1  d9 ed 7f	  cmp $7fed,y
$0c:ecb4  c0 57 f4	  cpy #$f457
$0c:ecb7  0d f0 71	  ora $71f0
$0c:ecba  93 85		 sta ($85,s),y
$0c:ecbc  26 df		 rol $df
$0c:ecbe  0b			phd
$0c:ecbf  4f 9b 2f 8e   eor $8e2f9b
$0c:ecc3  a7 4f		 lda [$4f]
$0c:ecc5  77 f7		 adc [$f7],y
$0c:ecc7  9f ff 87 e3   sta $e387ff,x
$0c:eccb  8e e7 4f	  stx $4fe7
$0c:ecce  e1 ff		 sbc ($ff,x)
$0c:ecd0  f8			sed
$0c:ecd1  fa			plx
$0c:ecd2  28			plp
$0c:ecd3  7f bf df cf   adc $cfdfbf,x
$0c:ecd7  e7 c3		 sbc [$c3]
$0c:ecd9  e1 c0		 sbc ($c0,x)
$0c:ecdb  60			rts
$0c:ecdc  20 10 0f	  jsr $0f10
$0c:ecdf  16 0f		 asl $0f,x
$0c:ece1  cb			wai
$0c:ece2  86 a5		 stx $a5
$0c:ece4  43 2a		 eor $2a,s
$0c:ece6  51 b9		 eor ($b9),y
$0c:ece8  2e db cf	  rol $cfdb
$0c:eceb  f9 cf 58	  sbc $58cf,y
$0c:ecee  e7 3c		 sbc [$3c]
$0c:ecf0  68			pla
$0c:ecf1  1f f2 0f f8   ora $f80ff2,x
$0c:ecf5  c7 fc		 cmp [$fc]
$0c:ecf7  33 9e		 and ($9e,s),y
$0c:ecf9  0d c7 03	  ora $03c7
$0c:ecfc  03 81		 ora $81,s
$0c:ecfe  81 c0		 sta ($c0,x)
$0c:ed00  e0 f0 7d	  cpx #$7df0
$0c:ed03  4c f2 b1	  jmp $b1f2
$0c:ed06  7f cf ff e7   adc $e7ffcf,x
$0c:ed0a  1f ff 35 e2   ora $e235ff,x
$0c:ed0e  75 c3		 adc $c3,x
$0c:ed10  b2 e2		 lda ($e2)
$0c:ed12  62 75 ce	  per $bb8a
$0c:ed15  7c 3f 3f	  jmp ($3f3f,x)
$0c:ed18  1f 21 04 fe   ora $fe0421,x
$0c:ed1c  7e 86 0f	  ror $0f86,x
$0c:ed1f  e7 ff		 sbc [$ff]
$0c:ed21  e3 fe		 sbc $fe,s
$0c:ed23  cf f8 31 97   cmp $9731f8
$0c:ed27  08			php
$0c:ed28  cf 86 4b c6   cmp $c64b86
$0c:ed2c  ea			nop
$0c:ed2d  c6 75		 dec $75
$0c:ed2f  7c cd 64	  jmp ($64cd,x)
$0c:ed32  c2 e3		 rep #$e3
$0c:ed34  81 83		 sta ($83,x)
$0c:ed36  41 d1		 eor ($d1,x)
$0c:ed38  81 fe		 sta ($fe,x)
$0c:ed3a  ff fe 1f 21   sbc $211ffe,x
$0c:ed3e  fe 87 fc	  inc $fc87,x
$0c:ed41  18			clc
$0c:ed42  61 fe		 adc ($fe,x)
$0c:ed44  80 7e		 bra $edc4
$0c:ed46  20 15 5b	  jsr $5b15
$0c:ed49  35 53		 and $53,x
$0c:ed4b  30 6f		 bmi $edbc
$0c:ed4d  09 5f 36	  ora #$365f
$0c:ed50  27 1d		 and [$1d]
$0c:ed52  bb			tyx
$0c:ed53  de 04 60	  dec $6004,x
$0c:ed56  df 0c 3f e1   cmp $e13f0c,x
$0c:ed5a  7e 17 8c	  ror $8c17,x
$0c:ed5d  07 c6		 ora [$c6]
$0c:ed5f  03 e1		 ora $e1,s
$0c:ed61  80 83		 bra $ece6
$0c:ed63  05 14		 ora $14
$0c:ed65  30 7d		 bmi $ede4
$0c:ed67  c7 93		 cmp [$93]
$0c:ed69  6f fb e1 c7   adc $c7e1fb
$0c:ed6d  7c 3c 6f	  jmp ($6f3c,x)
$0c:ed70  c7 8f		 cmp [$8f]
$0c:ed72  f9 fc 01	  sbc $01fc,y
$0c:ed75  84 fd		 sty $fd
$0c:ed77  c8			iny
$0c:ed78  13 89		 ora ($89,s),y
$0c:ed7a  f9 24 0c	  sbc $0c24,y
$0c:ed7d  20 a6 22	  jsr $22a6
$0c:ed80  38			sec
$0c:ed81  11 41		 ora ($41),y
$0c:ed83  80 10		 bra $ed95
$0c:ed85  1f fc 0f ff   ora $ff0ffc,x
$0c:ed89  8f ff df 6f   sta $6fdfff
$0c:ed8d  98			tya
$0c:ed8e  08			php
$0c:ed8f  3c 18 be	  bit $be18,x
$0c:ed92  1f f8 02 f9   ora $f902f8,x
$0c:ed96  70 6b		 bvs $ee03
$0c:ed98  c1 64		 cmp ($64,x)
$0c:ed9a  15 bb		 ora $bb,x
$0c:ed9c  d3 c4		 cmp ($c4,s),y
$0c:ed9e  e3 e5		 sbc $e5,s
$0c:eda0  70 f3		 bvs $ed95
$0c:eda2  58			cli
$0c:eda3  3f da 0d 3d   and $3d0dda,x
$0c:eda7  e6 4c		 inc $4c
$0c:eda9  f8			sed
$0c:edaa  1c cf 1c	  trb $1ccf
$0c:edad  40			rti
$0c:edae  68			pla
$0c:edaf  37 83		 and [$83],y
$0c:edb1  10 fe		 bpl $edb1
$0c:edb3  7f ff 36 41   adc $4136ff,x
$0c:edb7  f2 f3		 sbc ($f3)
$0c:edb9  bc 8c ec	  ldy $ec8c,x
$0c:edbc  9b			txy
$0c:edbd  95 69		 sta $69,x
$0c:edbf  e9 6d 7c	  sbc #$7c6d
$0c:edc2  d6 ae		 dec $ae,x
$0c:edc4  6e f7 b1	  ror $b1f7
$0c:edc7  ca			dex
$0c:edc8  ce 18 40	  dec $4018
$0c:edcb  c2 1f		 rep #$1f
$0c:edcd  d0 10		 bne $eddf
$0c:edcf  fe ff ff	  inc $ffff,x
$0c:edd2  7f ff bc be   adc $bebcff,x
$0c:edd6  1f fe 77 c7   ora $c777fe,x
$0c:edda  6b			rtl
$0c:eddb  db			stp
$0c:eddc  a5 6b		 lda $6b
$0c:edde  6a			ror a
$0c:eddf  bc 3d 55	  ldy $553d,x
$0c:ede2  9b			txy
$0c:ede3  ab			plb
$0c:ede4  2c d5 56	  bit $56d5
$0c:ede7  68			pla
$0c:ede8  9f 34 68 58   sta $586834,x
$0c:edec  20 17 08	  jsr $0817
$0c:edef  04 e2		 tsb $e2
$0c:edf1  01 19		 ora ($19,x)
$0c:edf3  80 40		 bra $ee35
$0c:edf5  d1 c1		 cmp ($c1),y
$0c:edf7  00 87		 brk #$87
$0c:edf9  c0 25 1e	  cpy #$1e25
$0c:edfc  f1 78		 sbc ($78),y
$0c:edfe  52 79		 eor ($79)
$0c:ee00  f5 9e		 sbc $9e,x
$0c:ee02  7d 6b 9b	  adc $9b6b,x
$0c:ee05  9a			txs
$0c:ee06  c6 ee		 dec $ee
$0c:ee08  f1 9a		 sbc ($9a),y
$0c:ee0a  bc 63 7c	  ldy $7c63,x
$0c:ee0d  1b			tcs
$0c:ee0e  e1 30		 sbc ($30,x)
$0c:ee10  21 1d		 and ($1d,x)
$0c:ee12  c0 90 75	  cpy #$7590
$0c:ee15  0b			phd
$0c:ee16  fd 66 fd	  sbc $fd66,x
$0c:ee19  87 de		 sta [$de]
$0c:ee1b  65 f4		 adc $f4
$0c:ee1d  99 3d 66	  sta $663d,y
$0c:ee20  cf 51 50 e3   cmp $e35051
$0c:ee24  d6 3a		 dec $3a,x
$0c:ee26  f8			sed
$0c:ee27  cf f9 7c 29   cmp $297cf9
$0c:ee2b  86 21		 stx $21
$0c:ee2d  a2 19 86	  ldx #$8619
$0c:ee30  58			cli
$0c:ee31  6a			ror a
$0c:ee32  1f af e6 15   ora $15e6af,x
$0c:ee36  b3 c4		 lda ($c4,s),y
$0c:ee38  d2 be		 cmp ($be)
$0c:ee3a  b4 4d		 ldy $4d,x
$0c:ee3c  ac 67 35	  ldy $3567
$0c:ee3f  2c b6 4d	  bit $4db6
$0c:ee42  e5 d3		 sbc $d3
$0c:ee44  75 28		 adc $28,x
$0c:ee46  5f 37 fb 4e   eor $4efb37,x
$0c:ee4a  3e 6f c1	  rol $c16f,x
$0c:ee4d  de f0 73	  dec $73f0,x
$0c:ee50  fe 1c 7f	  inc $7f1c,x
$0c:ee53  c2 2c		 rep #$2c
$0c:ee55  30 18		 bmi $ee6f
$0c:ee57  0b			phd
$0c:ee58  f4 06 f1	  pea $f106
$0c:ee5b  07 b0		 ora [$b0]
$0c:ee5d  2c 02 ff	  bit $ff02
$0c:ee60  07 bf		 ora [$bf]
$0c:ee62  c7 ef		 cmp [$ef]
$0c:ee64  f7 eb		 sbc [$eb],y
$0c:ee66  f5 fe		 sbc $fe,x
$0c:ee68  01 80		 ora ($80,x)
$0c:ee6a  bf a8 63 02   lda $0263a8,x
$0c:ee6e  9f 01 50 7f   sta $7f5001,x
$0c:ee72  e3 ff		 sbc $ff,s
$0c:ee74  fb			xce
$0c:ee75  fb			xce
$0c:ee76  98			tya
$0c:ee77  3f 3e 1f 0e   and $0e1f3e,x
$0c:ee7b  07 03		 ora [$03]
$0c:ee7d  07 80		 ora [$80]
$0c:ee7f  ff e0 10 1f   sbc $1f10e0,x
$0c:ee83  f3 04		 sbc ($04,s),y
$0c:ee85  a0 ff e8	  ldy #$e8ff
$0c:ee88  ff fa fe ff   sbc $fffefa,x
$0c:ee8c  18			clc
$0c:ee8d  84 7d		 sty $7d
$0c:ee8f  9e 12 06	  stz $0612,x
$0c:ee92  90 4b		 bcc $eedf
$0c:ee94  a6 71		 ldx $71
$0c:ee96  58			cli
$0c:ee97  e4 32		 cpx $32
$0c:ee99  01 23		 ora ($23,x)
$0c:ee9b  0f 82 88 2b   ora $2b8882
$0c:ee9f  fa			plx
$0c:eea0  05 12		 ora $12
$0c:eea2  57 74		 eor [$74],y
$0c:eea4  57 7c		 eor [$7c],y
$0c:eea6  44 ff 81	  mvp $81,$ff
$0c:eea9  0e 81 47	  asl $4781
$0c:eeac  e0 52 68	  cpx #$6852
$0c:eeaf  e4 7e		 cpx $7e
$0c:eeb1  67 73		 adc [$73]
$0c:eeb3  3d 04 fd	  and $fd04,x
$0c:eeb6  ec 1e 6b	  cpx $6b1e
$0c:eeb9  14 0e		 trb $0e
$0c:eebb  04 ff		 tsb $ff
$0c:eebd  08			php
$0c:eebe  2c 12 05	  bit $0512
$0c:eec1  02 0f		 cop #$0f
$0c:eec3  80 7c		 bra $ef41
$0c:eec5  1b			tcs
$0c:eec6  41 1d		 eor ($1d,x)
$0c:eec8  80 6d		 bra $ef37
$0c:eeca  6e 7c 5a	  ror $5a7c
$0c:eecd  1d fb 83	  ora $83fb,x
$0c:eed0  70 e3		 bvs $eeb5
$0c:eed2  d5 78		 cmp $78,x
$0c:eed4  bb			tyx
$0c:eed5  cb			wai
$0c:eed6  34 a2		 bit $a2,x
$0c:eed8  c7 7f		 cmp [$7f]
$0c:eeda  99 7c 21	  sta $217c,y
$0c:eedd  fc 07 68	  jsr ($6807,x)
$0c:eee0  08			php
$0c:eee1  87 8d		 sta [$8d]
$0c:eee3  3b			tsc
$0c:eee4  f3 c6		 sbc ($c6,s),y
$0c:eee6  7c 71 df	  jmp ($df71,x)
$0c:eee9  9c 32 39	  stz $3932
$0c:eeec  00 c7		 brk #$c7
$0c:eeee  e0 06 21	  cpx #$2106
$0c:eef1  45 e1		 eor $e1
$0c:eef3  49 bc 3f	  eor #$3fbc
$0c:eef6  3f 84 0e 01   and $010e84,x
$0c:eefa  f1 c0		 sbc ($c0),y
$0c:eefc  7f ff eb 50   adc $50ebff,x
$0c:ef00  5a			phy
$0c:ef01  84 fd		 sty $fd
$0c:ef03  64 30		 stz $30
$0c:ef05  f1 f8		 sbc ($f8),y
$0c:ef07  12 86		 ora ($86)
$0c:ef09  f5 53		 sbc $53,x
$0c:ef0b  84 c8		 sty $c8
$0c:ef0d  76 b2		 ror $b2,x
$0c:ef0f  9e 64 62	  stz $6264,x
$0c:ef12  a5 94		 lda $94
$0c:ef14  97 71		 sta [$71],y
$0c:ef16  22 5e 8c e5   jsl $e58c5e
$0c:ef1a  ab			plb
$0c:ef1b  39 e0 e7	  and $e7e0,y
$0c:ef1e  7c 0c 21	  jmp ($210c,x)
$0c:ef21  ef f8 79 ff   sbc $ff79f8
$0c:ef25  1f 7f c7 cf   ora $cfc77f,x
$0c:ef29  f8			sed
$0c:ef2a  6b			rtl
$0c:ef2b  08			php
$0c:ef2c  d4 2a		 pei ($2a)
$0c:ef2e  13 18		 ora ($18,s),y
$0c:ef30  93 47		 sta ($47,s),y
$0c:ef32  ae b0 3a	  ldx $3ab0
$0c:ef35  e5 77		 sbc $77
$0c:ef37  7b			tdc
$0c:ef38  44 bd 6d	  mvp $6d,$bd
$0c:ef3b  b9 b7 b8	  lda $b8b7,y
$0c:ef3e  34 06		 bit $06,x
$0c:ef40  11 07		 ora ($07),y
$0c:ef42  8f 40 67 ed   sta $ed6740
$0c:ef46  b1 1d		 lda ($1d),y
$0c:ef48  84 c6		 sty $c6
$0c:ef4a  61 78		 adc ($78,x)
$0c:ef4c  bc 2f c3	  ldy $c32f,x
$0c:ef4f  f0 b1		 beq $ef02
$0c:ef51  08			php
$0c:ef52  02 14		 cop #$14
$0c:ef54  39 fc 0b	  and $0bfc,y
$0c:ef57  3f 83 27 70   and $702783,x
$0c:ef5b  c4 e6		 cpy $e6
$0c:ef5d  20 0b f0	  jsr $f00b
$0c:ef60  50 18		 bvc $ef7a
$0c:ef62  84 3c		 sty $3c
$0c:ef64  11 f0		 ora ($f0),y
$0c:ef66  f8			sed
$0c:ef67  5e 12 43	  lsr $4312,x
$0c:ef6a  2f f8 42 7f   and $7f42f8
$0c:ef6e  de 68 ff	  dec $ff68,x
$0c:ef71  e6 0f		 inc $0f
$0c:ef73  ed 89 fc	  sbc $fc89
$0c:ef76  a1 a9		 lda ($a9,x)
$0c:ef78  10 4f		 bpl $efc9
$0c:ef7a  b2 7d		 lda ($7d)
$0c:ef7c  a6 df		 ldx $df
$0c:ef7e  1c 55 e7	  trb $e755
$0c:ef81  fb			xce
$0c:ef82  7c c2 e1	  jmp ($e1c2,x)
$0c:ef85  27 d0		 and [$d0]
$0c:ef87  0c f6 07	  tsb $07f6
$0c:ef8a  93 c7		 sta ($c7,s),y
$0c:ef8c  b4 f9		 ldy $f9,x
$0c:ef8e  c9 20 92	  cmp #$9220
$0c:ef91  08			php
$0c:ef92  1f fe f6 4a   ora $4af6fe,x
$0c:ef96  12 08		 ora ($08)
$0c:ef98  11 4b		 ora ($4b),y
$0c:ef9a  37 87		 and [$87],y
$0c:ef9c  f7 e7		 sbc [$e7],y
$0c:ef9e  ff fb f9 fd   sbc $fdf9fb,x
$0c:efa2  ff 7e 44 2d   sbc $2d447e,x
$0c:efa6  fd 1e be	  sbc $be1e,x
$0c:efa9  41 22		 eor ($22,x)
$0c:efab  08			php
$0c:efac  0f d0 82 0f   ora $0f82d0
$0c:efb0  70 ee		 bvs $efa0
$0c:efb2  f8			sed
$0c:efb3  7e 9f af	  ror $af9f,x
$0c:efb6  df f7 f9 fe   cmp $fef9f7,x
$0c:efba  fe 85 87	  inc $8785,x
$0c:efbd  f5 fc		 sbc $fc,x
$0c:efbf  fa			plx
$0c:efc0  fe 7f c4	  inc $c47f,x
$0c:efc3  a1 0f		 lda ($0f,x)
$0c:efc5  90 91		 bcc $ef58
$0c:efc7  03 e1		 ora $e1,s
$0c:efc9  b5 c3		 lda $c3,x
$0c:efcb  65 70		 adc $70
$0c:efcd  dd 2e 5f	  cmp $5f2e,x
$0c:efd0  47 93		 eor [$93]
$0c:efd2  28			plp
$0c:efd3  f2 5a		 sbc ($5a)
$0c:efd5  7c d5 5f	  jmp ($5fd5,x)
$0c:efd8  9d 67 b0	  sta $b067,x
$0c:efdb  8e 04 70	  stx $7004
$0c:efde  4f 3f f3 e7   eor $e7f33f
$0c:efe2  60			rts
$0c:efe3  bb			tyx
$0c:efe4  42 1f		 wdm #$1f
$0c:efe6  ff 93 ff ee   sbc $eeff93,x
$0c:efea  5f 1d 9d c3   eor $c39d1d,x
$0c:efee  91 38		 sta ($38),y
$0c:eff0  d2 77		 cmp ($77)
$0c:eff2  38			sec
$0c:eff3  ff f9 64 f2   sbc $f264f9,x
$0c:eff7  b7 98		 lda [$98],y
$0c:eff9  dc ce 09	  jml [$09ce]
$0c:effc  60			rts
$0c:effd  4b			phk
$0c:effe  07 09		 ora [$09]
$0c:f000  40			rti
$0c:f001  3f fc 3f ff   and $ff3ffc,x
$0c:f005  9f fe 57 0c   sta $0c57fe,x
$0c:f009  ae 66 a5	  ldx $a566
$0c:f00c  dc d4 db	  jml [$dbd4]
$0c:f00f  b9 93 fd	  lda $fd93,y
$0c:f012  9c 3f b9	  stz $b93f
$0c:f015  03 ef		 ora $ef,s
$0c:f017  c4 3c		 cpy $3c
$0c:f019  f0 0b		 beq $f026
$0c:f01b  0f fa 41 ff   ora $ff41fa
$0c:f01f  88			dey
$0c:f020  28			plp
$0c:f021  16 21		 asl $21,x
$0c:f023  ef 80 7d ef   sbc $ef7d80
$0c:f027  17 8b		 ora [$8b],y
$0c:f029  05 82		 ora $82
$0c:f02b  03 00		 ora $00,s
$0c:f02d  5f 04 7e 01   eor $017e04,x
$0c:f031  7e 80 ab	  ror $ab80,x
$0c:f034  42 c1		 wdm #$c1
$0c:f036  1f c3 df f3   ora $f3dfc3,x
$0c:f03a  ef f4 51 2c   sbc $2c51f4
$0c:f03e  7e 03 7f	  ror $7f03,x
$0c:f041  80 fe		 bra $f041
$0c:f043  60			rts
$0c:f044  fe 18 fe	  inc $fe18,x
$0c:f047  06 fe		 asl $fe
$0c:f049  e1 02		 sbc ($02,x)
$0c:f04b  48			pha
$0c:f04c  00 c4		 brk #$c4
$0c:f04e  3e 0c 0b	  rol $0b0c,x
$0c:f051  c6 7f		 dec $7f
$0c:f053  fe 3f 0f	  inc $0f3f,x
$0c:f056  4f a3 f7 7a   eor $7af7a3
$0c:f05a  8f 67 fb b1   sta $b1fb67
$0c:f05e  cf 94 cf 4f   cmp $4fcf94
$0c:f062  46 44		 lsr $44
$0c:f064  84 3b		 sty $3b
$0c:f066  ff 16 ff e1   sbc $e1ff16,x
$0c:f06a  3f fe 0f ff   and $ff0ffe,x
$0c:f06e  8b			phb
$0c:f06f  ff cc ff fe   sbc $feffcc,x
$0c:f073  3f f4 ae 0f   and $0faef4,x
$0c:f077  57 97		 eor [$97],y
$0c:f079  aa			tax
$0c:f07a  cf 6e 73 35   cmp $35736e
$0c:f07e  d9 cd b6	  cmp $b6cd,y
$0c:f081  53 6e		 eor ($6e,s),y
$0c:f083  94 5b		 sty $5b,x
$0c:f085  e5 13		 sbc $13
$0c:f087  f8			sed
$0c:f088  03 fc		 ora $fc,s
$0c:f08a  13 21		 ora ($21,s),y
$0c:f08c  79 83 7e	  adc $7e83,y
$0c:f08f  60			rts
$0c:f090  de 98 b7	  dec $b798,x
$0c:f093  a2 2e 0b	  ldx #$0b2e
$0c:f096  08			php
$0c:f097  c7 e7		 cmp [$e7]
$0c:f099  b7 b9		 lda [$b9],y
$0c:f09b  97 67		 sta [$67],y
$0c:f09d  3a			dec a
$0c:f09e  33 09		 and ($09,s),y
$0c:f0a0  cd e2 99	  cmp $99e2
$0c:f0a3  3c 93 47	  bit $4793,x
$0c:f0a6  a2 50 e0	  ldx #$e050
$0c:f0a9  38			sec
$0c:f0aa  01 c3		 ora ($c3,x)
$0c:f0ac  f9 03 f8	  sbc $f803,y
$0c:f0af  43 ff		 eor $ff,s
$0c:f0b1  10 7b		 bpl $f12e
$0c:f0b3  e4 0e		 cpx $0e
$0c:f0b5  7d 01 8f	  adc $8f01,x
$0c:f0b8  60			rts
$0c:f0b9  7c d7 8b	  jmp ($8bd7,x)
$0c:f0bc  de b2 ad	  dec $adb2,x
$0c:f0bf  9b			txy
$0c:f0c0  cb			wai
$0c:f0c1  f9 65 53	  sbc $5365,y
$0c:f0c4  3d 2c e7	  and $e72c,x
$0c:f0c7  93 0e		 sta ($0e,s),y
$0c:f0c9  b9 40 f7	  lda $f740,y
$0c:f0cc  f3 fe		 sbc ($fe,s),y
$0c:f0ce  7c 3f c7	  jmp ($c73f,x)
$0c:f0d1  03 fc		 ora $fc,s
$0c:f0d3  c0 67 9c	  cpy #$9c67
$0c:f0d6  09 f7 02	  ora #$02f7
$0c:f0d9  1f f0 81 ff   ora $ff81f0,x
$0c:f0dd  34 77		 bit $77,x
$0c:f0df  69 6d d2	  adc #$d26d
$0c:f0e2  55 f1		 eor $f1,x
$0c:f0e4  fa			plx
$0c:f0e5  7e ee bf	  ror $bfee,x
$0c:f0e8  9c f7 e2	  stz $e2f7
$0c:f0eb  95 7d		 sta $7d,x
$0c:f0ed  d4 4d		 pei ($4d)
$0c:f0ef  bf 7f cf cf   lda $cfcf7f,x
$0c:f0f3  fb			xce
$0c:f0f4  fa			plx
$0c:f0f5  62 1b fd	  per $ee13
$0c:f0f8  fa			plx
$0c:f0f9  3d 1f c7	  and $c71f,x
$0c:f0fc  43 f8		 eor $f8,s
$0c:f0fe  f0 7e		 beq $f17e
$0c:f100  1d 03 02	  ora $0203,x
$0c:f103  96 19		 stx $19,y
$0c:f105  04 7e		 tsb $7e
$0c:f107  2f 0f 86 41   and $41860f
$0c:f10b  20 b0 48	  jsr $48b0
$0c:f10e  04 16		 tsb $16
$0c:f110  81 40		 sta ($40,x)
$0c:f112  80 20		 bra $f134
$0c:f114  56 06		 lsr $06,x
$0c:f116  88			dey
$0c:f117  3a			dec a
$0c:f118  a7 32		 lda [$32]
$0c:f11a  4b			phk
$0c:f11b  e3 f4		 sbc $f4,s
$0c:f11d  c6 20		 dec $20
$0c:f11f  5f ef cf fe   eor $fecfef,x
$0c:f123  06 4d		 asl $4d
$0c:f125  08			php
$0c:f126  04 1f		 tsb $1f
$0c:f128  f1 3c		 sbc ($3c),y
$0c:f12a  81 9c		 sta ($9c,x)
$0c:f12c  c2 0f		 rep #$0f
$0c:f12e  00 80		 brk #$80
$0c:f130  a0 45 36	  ldy #$3645
$0c:f133  1f f5 50 8a   ora $8a50f5,x
$0c:f137  42 3d		 wdm #$3d
$0c:f139  01 a7		 ora ($a7,x)
$0c:f13b  70 75		 bvs $f1b2
$0c:f13d  f6 0a		 inc $0a,x
$0c:f13f  bc c3 57	  ldy $57c3,x
$0c:f142  98			tya
$0c:f143  a9 d2 33	  lda #$33d2
$0c:f146  a7 c0		 lda [$c0]
$0c:f148  55 8f		 eor $8f,x
$0c:f14a  02 7f		 cop #$7f
$0c:f14c  e0 8f 89	  cpx #$898f
$0c:f14f  42 f1		 wdm #$f1
$0c:f151  07 dc		 ora [$dc]
$0c:f153  41 c4		 eor ($c4,x)
$0c:f155  61 79		 adc ($79,x)
$0c:f157  fb			xce
$0c:f158  cc fe f1	  cpy $f1fe
$0c:f15b  bf fc 67 f7   lda $f767fc,x
$0c:f15f  09 fd e2	  ora #$e2fd
$0c:f162  6f 6d 90 ca   adc $ca906d
$0c:f166  dc e1 ff	  jml [$ffe1]
$0c:f169  f6 f8		 inc $f8,x
$0c:f16b  41 dc		 eor ($dc,x)
$0c:f16d  4e df 08	  lsr $08df
$0c:f170  46 e3		 lsr $e3
$0c:f172  f5 a6		 sbc $a6,x
$0c:f174  88			dey
$0c:f175  d0 ff		 bne $f176
$0c:f177  14 0f		 trb $0f
$0c:f179  f5 02		 sbc $02,x
$0c:f17b  6f 88 7c 87   adc $877c88
$0c:f17f  ef 09 67 80   sbc $806709
$0c:f183  58			cli
$0c:f184  62 1c 09	  per $faa3
$0c:f187  e3 0c		 sbc $0c,s
$0c:f189  18			clc
$0c:f18a  61 80		 adc ($80,x)
$0c:f18c  bf 82 4a 67   lda $674a82,x
$0c:f190  0f f6 47 e0   ora $e047f6
$0c:f194  f7 8b		 sbc [$8b],y
$0c:f196  85 fe		 sta $fe
$0c:f198  19 0f 4d	  ora $4d0f,y
$0c:f19b  87 3e		 sta [$3e]
$0c:f19d  01 f1		 ora ($f1,x)
$0c:f19f  55 18		 eor $18,x
$0c:f1a1  7c 01 40	  jmp ($4001,x)
$0c:f1a4  4b			phk
$0c:f1a5  00 f2		 brk #$f2
$0c:f1a7  78			sei
$0c:f1a8  53 c1		 eor ($c1,s),y
$0c:f1aa  c3 52		 cmp $52,s
$0c:f1ac  87 6a		 sta [$6a]
$0c:f1ae  3d 6c c7	  and $c76c,x
$0c:f1b1  e5 bc		 sbc $bc
$0c:f1b3  fa			plx
$0c:f1b4  d9 8f aa	  cmp $aa8f,y
$0c:f1b7  19 f8 71	  ora $71f8,y
$0c:f1ba  82 b0 7c	  brl $6e6d
$0c:f1bd  30 01		 bmi $f1c0
$0c:f1bf  40			rti
$0c:f1c0  7e 20 13	  ror $1320,x
$0c:f1c3  ee 00 9c	  inc $9c00
$0c:f1c6  32 77		 and ($77)
$0c:f1c8  6a			ror a
$0c:f1c9  54 e7 4b	  mvn $4b,$e7
$0c:f1cc  1c c9 d3	  trb $d3c9
$0c:f1cf  b1 1a		 lda ($1a),y
$0c:f1d1  69 8f af	  adc #$af8f
$0c:f1d4  31 75		 and ($75),y
$0c:f1d6  ea			nop
$0c:f1d7  6a			ror a
$0c:f1d8  a1 df		 lda ($df,x)
$0c:f1da  e7 18		 sbc [$18]
$0c:f1dc  60			rts
$0c:f1dd  ef fc 19 fd   sbc $fd19fc
$0c:f1e1  86 3f		 stx $3f
$0c:f1e3  18			clc
$0c:f1e4  83 c3		 sta $c3,s
$0c:f1e6  20 70 68	  jsr $6870
$0c:f1e9  0e ab 75	  asl $75ab
$0c:f1ec  33 99		 and ($99,s),y
$0c:f1ee  e4 72		 cpx $72
$0c:f1f0  3d 1e 8f	  and $8f1e,x
$0c:f1f3  5f a7 b2 f9   eor $f9b2a7,x
$0c:f1f7  ce bf 76	  dec $76bf
$0c:f1fa  cf fd 17 ff   cmp $ff17fd
$0c:f1fe  cc ff db	  cpy $dbff
$0c:f201  bf f2 ef fc   lda $fceff2,x
$0c:f205  b3 ff		 lda ($ff,s),y
$0c:f207  0c ff c1	  tsb $c1ff
$0c:f20a  03 e3		 ora $e3,s
$0c:f20c  ff fb c6 3e   sbc $3ec6fb,x
$0c:f210  f2 8e		 sbc ($8e)
$0c:f212  b8			clv
$0c:f213  7c 3d 77	  jmp ($773d,x)
$0c:f216  fc 0d ff	  jsr ($ff0d,x)
$0c:f219  69 4b 0f	  adc #$0f4b
$0c:f21c  80 80		 bra $f19e
$0c:f21e  d4 13		 pei ($13)
$0c:f220  f8			sed
$0c:f221  69 07 d3	  adc #$d307
$0c:f224  17 74		 ora [$74],y
$0c:f226  0f 87 d2 ff   ora $ffd287
$0c:f22a  83 be		 sta $be,s
$0c:f22c  64 cf		 stz $cf
$0c:f22e  a0 9e fc	  ldy #$fc9e
$0c:f231  fd fa bb	  sbc $bbfa,x
$0c:f234  ec b1 e4	  cpx $e4b1
$0c:f237  bb			tyx
$0c:f238  d3 7a		 cmp ($7a,s),y
$0c:f23a  26 f7		 rol $f7
$0c:f23c  77 46		 adc [$46],y
$0c:f23e  d6 ff		 dec $ff,x
$0c:f240  29 5c ff	  and #$ff5c
$0c:f243  07 ff		 ora [$ff]
$0c:f245  e5 ff		 sbc $ff
$0c:f247  fe 2b 83	  inc $832b,x
$0c:f24a  ff fa 71 0f   sbc $0f71fa,x
$0c:f24e  fb			xce
$0c:f24f  ff 30 ff c5   sbc $c5ff30,x
$0c:f253  e6 1b		 inc $1b
$0c:f255  7c 86 9f	  jmp ($9f86,x)
$0c:f258  21 4a		 and ($4a,x)
$0c:f25a  ac d6 69	  ldy $69d6
$0c:f25d  13 49		 ora ($49,s),y
$0c:f25f  64 ba		 stz $ba
$0c:f261  cd 59 eb	  cmp $eb59
$0c:f264  fc 21 f7	  jsr ($f721,x)
$0c:f267  00 00		 brk #$00
$0c:f269  ce 20 e0	  dec $e020
$0c:f26c  50 8e		 bvc $f1fc
$0c:f26e  40			rti
$0c:f26f  e3 d0		 sbc $d0,s
$0c:f271  19 7c 03	  ora $037c,y
$0c:f274  17 07		 ora [$07],y
$0c:f276  f2 c0		 sbc ($c0)
$0c:f278  ff c2 91 c0   sbc $c091c2,x
$0c:f27c  5f fc 11 fb   eor $fb11fc,x
$0c:f280  c4 1f		 cpy $1f
$0c:f282  7d 81 87	  adc $8781,x
$0c:f285  f0 20		 beq $f2a7
$0c:f287  e4 70		 cpx $70
$0c:f289  55 1a		 eor $1a,x
$0c:f28b  ac 82 e1	  ldy $e182
$0c:f28e  79 80 ee	  adc $ee80,y
$0c:f291  30 1d		 bmi $f2b0
$0c:f293  ce 00 4c	  dec $4c00
$0c:f296  a0 7f cf	  ldy #$cf7f
$0c:f299  87 fe		 sta [$fe]
$0c:f29b  47 e3		 eor [$e3]
$0c:f29d  80 ff		 bra $f29e
$0c:f29f  82 e1 c0	  brl $b383
$0c:f2a2  9f a7 da 39   sta $39daa7,x
$0c:f2a6  ff a6 e5 b6   sbc $b6e5a6,x
$0c:f2aa  dd ba 75	  cmp $75ba,x
$0c:f2ad  a6 47		 ldx $47
$0c:f2af  34 89		 bit $89,x
$0c:f2b1  c7 39		 cmp [$39]
$0c:f2b3  b0 ef		 bcs $f2a4
$0c:f2b5  a4 1f		 ldy $1f
$0c:f2b7  8d cd f3	  sta $f3cd
$0c:f2ba  c1 fc		 cmp ($fc,x)
$0c:f2bc  70 3b		 bvs $f2f9
$0c:f2be  8e 06 71	  stx $7106
$0c:f2c1  c0 8c 78	  cpy #$788c
$0c:f2c4  21 02		 and ($02,x)
$0c:f2c6  20 fc 4f	  jsr $4ffc
$0c:f2c9  3f 90 38 12   and $123890,x
$0c:f2cd  f8			sed
$0c:f2ce  17 c1		 ora [$c1],y
$0c:f2d0  03 81		 ora $81,s
$0c:f2d2  c1 a0		 cmp ($a0,x)
$0c:f2d4  50 98		 bvc $f26e
$0c:f2d6  24 da		 bit $da
$0c:f2d8  65 19		 adc $19
$0c:f2da  9d c0 60	  sta $60c0,x
$0c:f2dd  07 f0		 ora [$f0]
$0c:f2df  39 8c 02	  and $028c,y
$0c:f2e2  1d 01 04	  ora $0401,x
$0c:f2e5  82 1c 20	  brl $1304
$0c:f2e8  f0 01		 beq $f2eb
$0c:f2ea  d8			cld
$0c:f2eb  5f ff fa 3b   eor $3bfaff,x
$0c:f2ef  1e 83 c1	  asl $c183,x
$0c:f2f2  37 98		 and [$98],y
$0c:f2f4  70 d5		 bvs $f2cb
$0c:f2f6  63 62		 adc $62,s
$0c:f2f8  8e b2 8b	  stx $8bb2
$0c:f2fb  c7 1c		 cmp [$1c]
$0c:f2fd  0c 84 c3	  tsb $c384
$0c:f300  9e bf 4b	  stz $4bbf,x
$0c:f303  4e 12 33	  lsr $3312
$0c:f306  e4 c7		 cpx $c7
$0c:f308  7c ac 97	  jmp ($97ac,x)
$0c:f30b  a8			tay
$0c:f30c  d1 60		 cmp ($60),y
$0c:f30e  21 ff		 and ($ff,x)
$0c:f310  28			plp
$0c:f311  1e 6b c6	  asl $c66b,x
$0c:f314  6e 03 70	  ror $7003
$0c:f317  7f a0 37 ec   adc $ec37a0,x
$0c:f31b  0c 7b c3	  tsb $c37b
$0c:f31e  0f f8 30 07   ora $0730f8
$0c:f322  f9 b5 b9	  sbc $b9b5,y
$0c:f325  eb			xba
$0c:f326  6c 7d ba	  jmp ($ba7d)
$0c:f329  3c cf 1f	  bit $1fcf,x
$0c:f32c  33 e7		 and ($e7,s),y
$0c:f32e  d9 fb f6	  cmp $f6fb,y
$0c:f331  f9 f5 bf	  sbc $bff5,y
$0c:f334  f9 0f ff	  sbc $ff0f,y
$0c:f337  c7 ff		 cmp [$ff]
$0c:f339  f3 f4		 sbc ($f4,s),y
$0c:f33b  80 b9		 bra $f2f6
$0c:f33d  4a			lsr a
$0c:f33e  7d be de	  adc $debe,x
$0c:f341  1b			tcs
$0c:f342  43 07		 eor $07,s
$0c:f344  f6 c4		 inc $c4,x
$0c:f346  ce e0 9b	  dec $9be0
$0c:f349  b8			clv
$0c:f34a  27 e6		 and [$e6]
$0c:f34c  8c f7 0d	  sty $0df7
$0c:f34f  c4 1d		 cpy $1d
$0c:f351  f6 01		 inc $01,x
$0c:f353  70 0b		 bvs $f360
$0c:f355  80 a4		 bra $f2fb
$0c:f357  a8			tay
$0c:f358  1b			tcs
$0c:f359  f0 38		 beq $f393
$0c:f35b  0a			asl a
$0c:f35c  4a			lsr a
$0c:f35d  fb			xce
$0c:f35e  81 c7		 sta ($c7,x)
$0c:f360  fc 2c 7f	  jsr ($7f2c,x)
$0c:f363  cd ed fb	  cmp $fbed
$0c:f366  bd 3f d3	  lda $d33f,x
$0c:f369  c5 fa		 cmp $fa
$0c:f36b  b0 9f		 bcs $f30c
$0c:f36d  b4 30		 ldy $30,x
$0c:f36f  7e 00 b2	  ror $b200,x
$0c:f372  05 94		 ora $94
$0c:f374  e3 bf		 sbc $bf,s
$0c:f376  0e f7 c5	  asl $c5f7
$0c:f379  fc f7 38	  jsr ($38f7,x)
$0c:f37c  15 76		 ora $76,x
$0c:f37e  83 96		 sta $96,s
$0c:f380  88			dey
$0c:f381  72 e1		 adc ($e1)
$0c:f383  16 5c		 asl $5c,x
$0c:f385  24 db		 bit $db
$0c:f387  8d 9b f1	  sta $f19b
$0c:f38a  f2 be		 sbc ($be)
$0c:f38c  6c 00 a0	  jmp ($a000)
$0c:f38f  ef a2 1e f8   sbc $f81ea2
$0c:f393  47 de		 eor [$de]
$0c:f395  09 fb 83	  ora #$83fb
$0c:f398  7e 59 65	  ror $6559,x
$0c:f39b  4b			phk
$0c:f39c  bb			tyx
$0c:f39d  69 67 7d	  adc #$7d67
$0c:f3a0  6c cd 9a	  jmp ($9acd)
$0c:f3a3  93 bb		 sta ($bb,s),y
$0c:f3a5  96 74		 stx $74,y
$0c:f3a7  e2 96		 sep #$96
$0c:f3a9  b8			clv
$0c:f3aa  26 df		 rol $df
$0c:f3ac  11 81		 ora ($81),y
$0c:f3ae  80 70		 bra $f420
$0c:f3b0  20 1e 08	  jsr $081e
$0c:f3b3  05 c3		 ora $c3
$0c:f3b5  01 30		 ora ($30,x)
$0c:f3b7  e0 46		 cpx #$46
$0c:f3b9  3c 10 8f	  bit $8f10,x
$0c:f3bc  86 02		 stx $02
$0c:f3be  f1 b4		 sbc ($b4),y
$0c:f3c0  a3 74		 lda $74,s
$0c:f3c2  33 b2		 and ($b2,s),y
$0c:f3c4  1d d5 2a	  ora $2ad5,x
$0c:f3c7  eb			xba
$0c:f3c8  97 f1		 sta [$f1],y
$0c:f3ca  49 39 e3	  eor #$e339
$0c:f3cd  20 dd c3	  jsr $c3dd
$0c:f3d0  6f 17 ff 0f   adc $0fff17
$0c:f3d4  fb			xce
$0c:f3d5  87 fc		 sta [$fc]
$0c:f3d7  c3 7e		 cmp $7e,s
$0c:f3d9  20 9f 83	  jsr $839f
$0c:f3dc  58			cli
$0c:f3dd  1a			inc a
$0c:f3de  40			rti
$0c:f3df  ce 1c fb	  dec $fb1c
$0c:f3e2  86 ff		 stx $ff
$0c:f3e4  81 71		 sta ($71,x)
$0c:f3e6  c7 62		 cmp [$62]
$0c:f3e8  af 32 df 25   lda $25df32
$0c:f3ec  6f 91 b6 c8   adc $c8b691
$0c:f3f0  5b			tcd
$0c:f3f1  64 38		 stz $38
$0c:f3f3  08			php
$0c:f3f4  02 80		 cop #$80
$0c:f3f6  a0 d0		 ldy #$d0
$0c:f3f8  18			clc
$0c:f3f9  e4 0e		 cpx $0e
$0c:f3fb  71 07		 adc ($07),y
$0c:f3fd  b8			clv
$0c:f3fe  43 fc		 eor $fc,s
$0c:f400  31 ef		 and ($ef),y
$0c:f402  fc 0d c4	  jsr ($c40d,x)
$0c:f405  18			clc
$0c:f406  ce 1e 46	  dec $461e
$0c:f409  e1 e6		 sbc ($e6,x)
$0c:f40b  8f 13 02 0f   sta $0f0213
$0c:f40f  00 98		 brk #$98
$0c:f411  fc 20 70	  jsr ($7020,x)
$0c:f414  39 fb 8c	  and $8cfb,y
$0c:f417  3f ed f0 80   and $80f0ed,x
$0c:f41b  89 0f e1	  bit #$e10f
$0c:f41e  0f 5b 87 e7   ora $e7875b
$0c:f422  cf 7e fc ef   cmp $effc7e
$0c:f426  ef 96 f8 f6   sbc $f6f896
$0c:f42a  5f 1f ab b3   eor $b3ab1f,x
$0c:f42e  f4 e6 f0	  pea $f0e6
$0c:f431  13 10		 ora ($10,s),y
$0c:f433  78			sei
$0c:f434  3f 1f 8f e7   and $e78f1f,x
$0c:f438  f3 fd		 sbc ($fd,s),y
$0c:f43a  fe bf ff	  inc $ffbf,x
$0c:f43d  e3 ec		 sbc $ec,s
$0c:f43f  41 bd		 eor ($bd,x)
$0c:f441  76 69		 ror $69,x
$0c:f443  be cb 5f	  ldx $5fcb,y
$0c:f446  4f 91 5c df   eor $df5c91
$0c:f44a  5b			tcd
$0c:f44b  e4 76		 cpx $76
$0c:f44d  fa			plx
$0c:f44e  6c 8a 65	  jmp ($658a)
$0c:f451  12 93		 ora ($93)
$0c:f453  c0 26		 cpy #$26
$0c:f455  70 09		 bvs $f460
$0c:f457  e4 02		 cpx $02
$0c:f459  7f 00 8f 81   adc $818f00,x
$0c:f45d  8e 1b 00	  stx $001b
$0c:f460  b3 f8		 lda ($f8,s),y
$0c:f462  26 7f		 rol $7f
$0c:f464  0a			asl a
$0c:f465  ac c3 57	  ldy $57c3
$0c:f468  98			tya
$0c:f469  d6 c9		 dec $c9,x
$0c:f46b  22 b1 39 3f   jsl $3f39b1
$0c:f46f  82 93 38	  brl $2d05
$0c:f472  f0 47		 beq $f4bb
$0c:f474  d9 a0 cd	  cmp $cda0,y
$0c:f477  0b			phd
$0c:f478  c4 1f		 cpy $1f
$0c:f47a  b9 03 8f	  lda $8f03,y
$0c:f47d  f8			sed
$0c:f47e  15 a1		 ora $a1,x
$0c:f480  f8			sed
$0c:f481  83 e6		 sta $e6,s
$0c:f483  2f 1c d9 e2   and $e2d91c
$0c:f487  dc 3e 70	  jml [$703e]
$0c:f48a  ff cc 1e f9   sbc $f91ecc,x
$0c:f48e  03 af		 ora $af,s
$0c:f490  70 74		 bvs $f506
$0c:f492  f6 08		 inc $08,x
$0c:f494  3a			dec a
$0c:f495  bc 58 e8	  ldy $e858,x
$0c:f498  c9 0e 04	  cmp #$040e
$0c:f49b  fe c1 9f	  inc $9fc1,x
$0c:f49e  b7 47		 lda [$47],y
$0c:f4a0  77 b6		 adc [$b6],y
$0c:f4a2  3d ed ce	  and $ceed,x
$0c:f4a5  bb			tyx
$0c:f4a6  3b			tsc
$0c:f4a7  d7 66		 cmp [$66],y
$0c:f4a9  79 dd da	  adc $dadd,y
$0c:f4ac  bf 32 5f e6   lda $e65f32,x
$0c:f4b0  72 83		 adc ($83)
$0c:f4b2  84 3e		 sty $3e
$0c:f4b4  1f 07 18 5e   ora $5e1807,x
$0c:f4b8  3f 13 cf e1   and $e1cf13,x
$0c:f4bc  a4 23		 ldy $23
$0c:f4be  df e8 54 e6   cmp $e654e8,x
$0c:f4c2  4b			phk
$0c:f4c3  04 6f		 tsb $6f
$0c:f4c5  81 d1		 sta ($d1,x)
$0c:f4c7  1b			tcs
$0c:f4c8  e1 07		 sbc ($07,x)
$0c:f4ca  80 c1		 bra $f48d
$0c:f4cc  e0 10		 cpx #$10
$0c:f4ce  34 00		 bit $00,x
$0c:f4d0  9c de 03	  stz $03de
$0c:f4d3  ac cf e8	  ldy $e8cf
$0c:f4d6  f2 76		 sbc ($76)
$0c:f4d8  8e c6 62	  stx $62c6
$0c:f4db  91 14		 sta ($14),y
$0c:f4dd  a6 5d		 ldx $5d
$0c:f4df  25 98		 and $98
$0c:f4e1  e9 34 ea	  sbc #$ea34
$0c:f4e4  2d 80 bf	  and $bf80
$0c:f4e7  e3 2f		 sbc $2f,s
$0c:f4e9  fc 79 fa	  jsr ($fa79,x)
$0c:f4ec  8c 38 73	  sty $7338
$0c:f4ef  ff 1c 7e c3   sbc $c37e1c,x
$0c:f4f3  1f f8 c3 ec   ora $ecc3f8,x
$0c:f4f7  bf 9a 97 73   lda $73979a,x
$0c:f4fb  93 ce		 sta ($ce,s),y
$0c:f4fd  92 49		 sta ($49)
$0c:f4ff  e2 51		 sep #$51
$0c:f501  3a			dec a
$0c:f502  0c 06 41	  tsb $4106
$0c:f505  00 9c		 brk #$9c
$0c:f507  1e 83 fd	  asl $fd83,x
$0c:f50a  20 ff cc	  jsr $ccff
$0c:f50d  3f fd 8f ff   and $ff8ffd,x
$0c:f511  b3 ff		 lda ($ff,s),y
$0c:f513  fe ff b2	  inc $b2ff,x
$0c:f516  8b			phb
$0c:f517  7f 18 8f e8   adc $e88f18,x
$0c:f51b  3c fb 88	  bit $88fb,x
$0c:f51e  9d 73 db	  sta $db73,x
$0c:f521  4e 8a e9	  lsr $e98a
$0c:f524  bc bb 68	  ldy $68bb,x
$0c:f527  15 4f		 ora $4f,x
$0c:f529  b1 18		 lda ($18),y
$0c:f52b  e0 40		 cpx #$40
$0c:f52d  1c 21 60	  trb $6021
$0c:f530  c0 5c		 cpy #$5c
$0c:f532  30 13		 bmi $f547
$0c:f534  8e 03 a4	  stx $a403
$0c:f537  33 9e		 and ($9e,s),y
$0c:f539  01 28		 ora ($28,x)
$0c:f53b  08			php
$0c:f53c  4b			phk
$0c:f53d  c9 1f 7a	  cmp #$7a1f
$0c:f540  87 32		 sta [$32]
$0c:f542  7e a1 08	  ror $08a1,x
$0c:f545  e1 11		 sbc ($11,x)
$0c:f547  5f f1 a0 a7   eor $a7a0f1,x
$0c:f54b  ee e9 3b	  inc $3be9
$0c:f54e  3a			dec a
$0c:f54f  34 c3		 bit $c3,x
$0c:f551  8b			phb
$0c:f552  7f c2 de 30   adc $30dec2,x
$0c:f556  57 9c		 eor [$9c],y
$0c:f558  15 eb		 ora $eb,x
$0c:f55a  07 0b		 ora [$0b]
$0c:f55c  f9 c3 7e	  sbc $7ec3,y
$0c:f55f  30 4f		 bmi $f5b0
$0c:f561  c4 18		 cpy $18
$0c:f563  48			pha
$0c:f564  30 3f		 bmi $f5a5
$0c:f566  e0 a4		 cpx #$a4
$0c:f568  ad b7 1d	  lda $1db7
$0c:f56b  2c e6 25	  bit $25e6
$0c:f56e  9c c9 67	  stz $67c9
$0c:f571  39 78 cd	  and $cd78,y
$0c:f574  4d 3a cb	  eor $cb3a
$0c:f577  c6 b2		 dec $b2
$0c:f579  61 f0		 adc ($f0,x)
$0c:f57b  3f ee 0f fb   and $fb0fee,x
$0c:f57f  c1 ff		 cmp ($ff,x)
$0c:f581  21 87		 and ($87,x)
$0c:f583  c3 ff		 cmp $ff,s
$0c:f585  70 bf		 bvs $f546
$0c:f587  de 2f f3	  dec $f32f,x
$0c:f58a  89 fc ff	  bit #$fffc
$0c:f58d  09 33 c6	  ora #$c633
$0c:f590  6c f1 5a	  jmp ($5af1)
$0c:f593  bc d2 d8	  ldy $d8d2,x
$0c:f596  2e f1 2a	  rol $2af1
$0c:f599  9c df 97	  stz $97df
$0c:f59c  27 c2		 and [$c2]
$0c:f59e  5f 0b e1 86   eor $86e10b,x
$0c:f5a2  bf 18 c2 1d   lda $1dc218,x
$0c:f5a6  fe 33 84	  inc $8433,x
$0c:f5a9  3f ff 1f ff   and $ff1fff,x
$0c:f5ad  e8			inx
$0c:f5ae  9b			txy
$0c:f5af  01 5c		 ora ($5c,x)
$0c:f5b1  a7 47		 lda [$47]
$0c:f5b3  6b			rtl
$0c:f5b4  79 9a a6	  adc $a69a,y
$0c:f5b7  4b			phk
$0c:f5b8  97 86		 sta [$86],y
$0c:f5ba  cc f1 32	  cpy $32f1
$0c:f5bd  fc cb 8e	  jsr ($8ecb,x)
$0c:f5c0  02 c6		 cop #$c6
$0c:f5c2  80 1f		 bra $f5e3
$0c:f5c4  3c 03 dc	  bit $dc03,x
$0c:f5c7  bf 08 08 a8   lda $a80808,x
$0c:f5cb  bb			tyx
$0c:f5cc  54 3d be	  mvn $be,$3d
$0c:f5cf  1e d9 0c	  asl $0cd9,x
$0c:f5d2  a9 c4 3c	  lda #$3cc4
$0c:f5d5  d2 1c		 cmp ($1c)
$0c:f5d7  64 0f		 stz $0f
$0c:f5d9  b3 47		 lda ($47,s),y
$0c:f5db  99 c3 f8	  sta $f8c3,y
$0c:f5de  73 cc		 adc ($cc,s),y
$0c:f5e0  3d e2 19	  and $19e2,x
$0c:f5e3  f3 88		 sbc ($88,s),y
$0c:f5e5  7b			tdc
$0c:f5e6  e4 1d		 cpx $1d
$0c:f5e8  f0 58		 beq $f642
$0c:f5ea  50 37		 bvc $f623
$0c:f5ec  e0 b0		 cpx #$b0
$0c:f5ee  e7 70		 sbc [$70]
$0c:f5f0  67 10		 adc [$10]
$0c:f5f2  7e 1b e8	  ror $e81b,x
$0c:f5f5  2f 93 0f 87   and $870f93
$0c:f5f9  1f 81 8b c3   ora $c38b81,x
$0c:f5fd  57 27		 eor [$27],y
$0c:f5ff  7c 09 f8	  jmp ($f809,x)
$0c:f602  2c a0 7f	  bit $7fa0
$0c:f605  f3 58		 sbc ($58,s),y
$0c:f607  4f ff f7 ef   eor $eff7ff
$0c:f60b  f7 e3		 sbc [$e3],y
$0c:f60d  f1 15		 sbc ($15),y
$0c:f60f  f9 fe ff	  sbc $fffe,y
$0c:f612  38			sec
$0c:f613  3c 0c e4	  bit $e40c,x
$0c:f616  16 38		 asl $38,x
$0c:f618  3b			tsc
$0c:f619  e7 e2		 sbc [$e2]
$0c:f61b  ff 7e c7 9a   sbc $9ac77e,x
$0c:f61f  c2 0f		 rep #$0f
$0c:f621  ff bf ff dc   sbc $dcffbf,x
$0c:f625  89 7f bf	  bit #$bf7f
$0c:f628  c3 e1		 cmp $e1,s
$0c:f62a  ee 30 fc	  inc $fc30
$0c:f62d  fe 7c 3e	  inc $3e7c,x
$0c:f630  1c 0e 06	  trb $060e
$0c:f633  0d 00 66	  ora $6600
$0c:f636  84 05		 sty $05
$0c:f638  10 08		 bpl $f642
$0c:f63a  90 ff		 bcc $f63b
$0c:f63c  41 ff		 eor ($ff,x)
$0c:f63e  d1 ff		 cmp ($ff),y
$0c:f640  f5 fd		 sbc $fd,x
$0c:f642  fa			plx
$0c:f643  1f ff c3 84   ora $84c3ff,x
$0c:f647  20 10 18	  jsr $1810
$0c:f64a  05 ff		 ora $ff
$0c:f64c  01 80		 ora ($80,x)
$0c:f64e  bf f7 6f f8   lda $f86ff7,x
$0c:f652  18			clc
$0c:f653  0e f2 85	  asl $85f2
$0c:f656  d7 94		 cmp [$94],y
$0c:f658  6f d5 61 40   adc $4061d5
$0c:f65c  71 86		 adc ($86),y
$0c:f65e  f8			sed
$0c:f65f  40			rti
$0c:f660  20 70 de	  jsr $de70
$0c:f663  ff fa ff fd   sbc $fdfffa,x
$0c:f667  f8			sed
$0c:f668  a8			tay
$0c:f669  7f 74 4f a5   adc $a54f74,x
$0c:f66d  2f c1 5f d4   and $d45fc1
$0c:f671  ca			dex
$0c:f672  f9 57 ee	  sbc $ee57,y
$0c:f675  05 ff		 ora $ff
$0c:f677  24 eb		 bit $eb
$0c:f679  0c 00 ac	  tsb $ac00
$0c:f67c  85 61		 sta $61
$0c:f67e  d4 13		 pei ($13)
$0c:f680  08			php
$0c:f681  ac 30 0e	  ldy $0e30
$0c:f684  21 bf		 and ($bf,x)
$0c:f686  60			rts
$0c:f687  78			sei
$0c:f688  37 ec		 and [$ec],y
$0c:f68a  95 cf		 sta $cf,x
$0c:f68c  43 7f		 eor $7f,s
$0c:f68e  c6 d4		 dec $d4
$0c:f690  f1 95		 sbc ($95),y
$0c:f692  22 a8 56 b7   jsl $b756a8
$0c:f696  57 ef		 eor [$ef],y
$0c:f698  fe 07 ff	  inc $ff07,x
$0c:f69b  8c 25 0e	  sty $0e25
$0c:f69e  b3 ff		 lda ($ff,s),y
$0c:f6a0  ad 25 0d	  lda $0d25
$0c:f6a3  17 ff		 ora [$ff],y
$0c:f6a5  6f d8 6c e9   adc $e96cd8
$0c:f6a9  dc cd ed	  jml [$edcd]
$0c:f6ac  4f 65 a9 b7   eor $b7a965
$0c:f6b0  e9 ad dd	  sbc #$ddad
$0c:f6b3  5a			phy
$0c:f6b4  e7 6e		 sbc [$6e]
$0c:f6b6  51 4f		 eor ($4f),y
$0c:f6b8  ff ec 7f f4   sbc $f47fec,x
$0c:f6bc  2f fd 37 ff   and $ff37fd
$0c:f6c0  91 ff		 sta ($ff),y
$0c:f6c2  65 bf		 adc $bf
$0c:f6c4  3a			dec a
$0c:f6c5  4f df 63 ef   eor $ef63df
$0c:f6c9  81 bf		 sta ($bf,x)
$0c:f6cb  54 fe 71	  mvn $71,$fe
$0c:f6ce  cf 15 bb bf   cmp $bfbb15
$0c:f6d2  39 cc cc	  and $cccc,y
$0c:f6d5  b2 d5		 lda ($d5)
$0c:f6d7  5f af 2a b7   eor $b72aaf,x
$0c:f6db  c3 31		 cmp $31,s
$0c:f6dd  0b			phd
$0c:f6de  24 24		 bit $24
$0c:f6e0  1f fb 37 fe   ora $fe37fb,x
$0c:f6e4  d3 ff		 cmp ($ff,s),y
$0c:f6e6  d5 7f		 cmp $7f,x
$0c:f6e8  f4 9f f9	  pea $f99f
$0c:f6eb  97 f6		 sta [$f6],y
$0c:f6ed  95 82		 sta $82,x
$0c:f6ef  d2 e5		 cmp ($e5)
$0c:f6f1  35 5a		 and $5a,x
$0c:f6f3  9a			txs
$0c:f6f4  ae 4e 57	  ldx $574e
$0c:f6f7  a6 eb		 ldx $eb
$0c:f6f9  53 25		 eor ($25,s),y
$0c:f6fb  99 98 04	  sta $0498,y
$0c:f6fe  02 fb		 cop #$fb
$0c:f700  00 bd		 brk #$bd
$0c:f702  c0 2e		 cpy #$2e
$0c:f704  f0 0b		 beq $f711
$0c:f706  7c 02 bf	  jmp ($bf02,x)
$0c:f709  00 9f		 brk #$9f
$0c:f70b  c0 2f		 cpy #$2f
$0c:f70d  f0 08		 beq $f717
$0c:f70f  ac 2e ab	  ldy $ab2e
$0c:f712  2c 95 56	  bit $5695
$0c:f715  7a			ply
$0c:f716  b2 c9		 lda ($c9)
$0c:f718  4f df ad 59   eor $59addf
$0c:f71c  93 62		 sta ($62,s),y
$0c:f71e  7b			tdc
$0c:f71f  3a			dec a
$0c:f720  e8			inx
$0c:f721  84 62		 sty $62
$0c:f723  87 60		 sta [$60]
$0c:f725  83 d0		 sta $d0,s
$0c:f727  30 78		 bmi $f7a1
$0c:f729  08			php
$0c:f72a  06 02		 asl $02
$0c:f72c  41 00		 eor ($00,x)
$0c:f72e  b8			clv
$0c:f72f  c0 2e		 cpy #$2e
$0c:f731  70 09		 bvs $f73c
$0c:f733  e7 ff		 sbc [$ff]
$0c:f735  e9 f7 f2	  sbc #$f2f7
$0c:f738  79 f9 9c	  adc $9cf9,y
$0c:f73b  fd 4e 3a	  sbc $3a4e,x
$0c:f73e  b7 1c		 lda [$1c],y
$0c:f740  ea			nop
$0c:f741  46 36		 lsr $36
$0c:f743  72 38		 adc ($38)
$0c:f745  07 fe		 ora [$fe]
$0c:f747  11 ff		 ora ($ff),y
$0c:f749  8c 7f e6	  sty $e67f
$0c:f74c  1f fb 87 ff   ora $ff87fb,x
$0c:f750  c0 08		 cpy #$08
$0c:f752  1e 1f f3	  asl $f31f,x
$0c:f755  f5 03		 sbc $03,x
$0c:f757  fa			plx
$0c:f758  41 bd		 eor ($bd,x)
$0c:f75a  70 de		 bvs $f73a
$0c:f75c  8c 77 4d	  sty $4d77
$0c:f75f  3b			tsc
$0c:f760  a5 5c		 lda $5c
$0c:f762  f2 be		 sbc ($be)
$0c:f764  69 5f 36	  adc #$365f
$0c:f767  07 fc		 ora [$fc]
$0c:f769  83 fe		 sta $fe,s
$0c:f76b  21 df		 and ($df,x)
$0c:f76d  08			php
$0c:f76e  f7 82		 sbc [$82],y
$0c:f770  79 c0 be	  adc $bec0,y
$0c:f773  60			rts
$0c:f774  3f 10 0f 8c   and $8c0f10,x
$0c:f778  06 ed		 asl $ed
$0c:f77a  87 e9		 sta [$e9]
$0c:f77c  58			cli
$0c:f77d  fb			xce
$0c:f77e  56 3e		 lsr $3e,x
$0c:f780  d8			cld
$0c:f781  c8			iny
$0c:f782  3c 59 1f	  bit $1f59,x
$0c:f785  06 db		 asl $db
$0c:f787  83 3f		 sta $3f,s
$0c:f789  e3 ce		 sbc $ce,s
$0c:f78b  27 f7		 and [$f7]
$0c:f78d  cb			wai
$0c:f78e  f9 04 bf	  sbc $bf04,y
$0c:f791  bf f2 42 7a   lda $7a42f2,x
$0c:f795  e4 d9		 cpx $d9
$0c:f797  7a			ply
$0c:f798  75 7f		 adc $7f,x
$0c:f79a  9d ae ce	  sta $ceae,x
$0c:f79d  d7 a7		 cmp [$a7],y
$0c:f79f  b3 df		 lda ($df,s),y
$0c:f7a1  df f7 e7 fa   cmp $fae7f7,x
$0c:f7a5  f3 47		 sbc ($47,s),y
$0c:f7a7  bf d3 e3 00   lda $00e3d3,x
$0c:f7ab  df 3f 86 60   cmp $60863f,x
$0c:f7af  fc 7e 3e	  jsr ($3e7e,x)
$0c:f7b2  1f 0f 0f 83   ora $830f0f,x
$0c:f7b6  47 d8		 eor [$d8]
$0c:f7b8  d1 76		 cmp ($76),y
$0c:f7ba  2d dd 8a	  and $8add
$0c:f7bd  77 e3		 adc [$e3],y
$0c:f7bf  2b			pld
$0c:f7c0  70 ea		 bvs $f7ac
$0c:f7c2  cc 2a f3	  cpy $f32a
$0c:f7c5  0a			asl a
$0c:f7c6  3c 03 f0	  bit $f003,x
$0c:f7c9  21 04		 and ($04,x)
$0c:f7cb  01 fc		 ora ($fc,x)
$0c:f7cd  21 e8		 and ($e8,x)
$0c:f7cf  72 f0		 adc ($f0)
$0c:f7d1  47 fe		 eor [$fe]
$0c:f7d3  d8			cld
$0c:f7d4  eb			xba
$0c:f7d5  6c 73 bf	  jmp ($bf73)
$0c:f7d8  3d ec 4e	  and $4eec,x
$0c:f7db  f3 77		 sbc ($77,s),y
$0c:f7dd  cd ad e3	  cmp $e3ad
$0c:f7e0  57 70		 eor [$70],y
$0c:f7e2  af f8 30 37   lda $3730f8
$0c:f7e6  f8			sed
$0c:f7e7  1f fd 42 10   ora $1042fd,x
$0c:f7eb  6f f4 17 f9   adc $f917f4
$0c:f7ef  04 fd		 tsb $fd
$0c:f7f1  bf c1 fe 16   lda $16fec1,x
$0c:f7f5  ae cd a7	  ldx $a7cd
$0c:f7f8  4f 08 dc 53   eor $53dc08
$0c:f7fc  f8			sed
$0c:f7fd  0c d0 56	  tsb $56d0
$0c:f800  02 20		 cop #$20
$0c:f802  11 a1		 ora ($a1),y
$0c:f804  c7 e0		 cmp [$e0]
$0c:f806  67 f0		 adc [$f0]
$0c:f808  17 88		 ora [$88],y
$0c:f80a  3f 02 7e ab   and $ab7e02,x
$0c:f80e  25 59		 and $59
$0c:f810  4c f7 ba	  jmp $baf7
$0c:f813  de 70 64	  dec $6470,x
$0c:f816  34 b3		 bit $b3,x
$0c:f818  9e 94 73	  stz $7394,x
$0c:f81b  d3 0e		 cmp ($0e,s),y
$0c:f81d  fa			plx
$0c:f81e  41 c1		 eor ($c1,x)
$0c:f820  e1 c1		 sbc ($c1,x)
$0c:f822  80 fc		 bra $f820
$0c:f824  20 02 90	  jsr $9002
$0c:f827  9f 70 23 fe   sta $fe2370,x
$0c:f82b  04 40		 tsb $40
$0c:f82d  08			php
$0c:f82e  40			rti
$0c:f82f  3e 14 c9	  rol $c914,x
$0c:f832  9d 43 5f	  sta $5f43,x
$0c:f835  25 cd		 and $cd
$0c:f837  6b			rtl
$0c:f838  2a			rol a
$0c:f839  7d 28 2d	  adc $2d28,x
$0c:f83c  2f 4d 97 bf   and $bf974d
$0c:f840  54 b7 c4	  mvn $c4,$b7
$0c:f843  80 bf		 bra $f804
$0c:f845  80 06		 bra $f84d
$0c:f847  7f ff 9d ff   adc $ff9dff,x
$0c:f84b  e2 3f		 sep #$3f
$0c:f84d  f8			sed
$0c:f84e  08			php
$0c:f84f  28			plp
$0c:f850  63 1e		 adc $1e,s
$0c:f852  7c 1d f2	  jmp ($f21d,x)
$0c:f855  61 cf		 adc ($cf,x)
$0c:f857  e2 4e		 sep #$4e
$0c:f859  e2 7e		 sep #$7e
$0c:f85b  c0 98		 cpy #$98
$0c:f85d  5a			phy
$0c:f85e  b4 b9		 ldy $b9,x
$0c:f860  69 89		 adc #$89
$0c:f862  21 49		 and ($49,x)
$0c:f864  07 df		 ora [$df]
$0c:f866  ff f3 ff f0   sbc $f0fff3,x
$0c:f86a  b9 c4 3a	  lda $3ac4,y
$0c:f86d  7d a5 cf	  adc $cfa5,x
$0c:f870  f9 7b fc	  sbc $fc7b,y
$0c:f873  1f fe 2b fb   ora $fb2bfe,x
$0c:f877  2a			rol a
$0c:f878  fe cb 3f	  inc $3fcb,x
$0c:f87b  fc 7f f8	  jsr ($f87f,x)
$0c:f87e  dc 28 0c	  jml [$0c28]
$0c:f881  85 22		 sta $22
$0c:f883  95 ff		 sta $ff,x
$0c:f885  00 c5		 brk #$c5
$0c:f887  0d bd df	  ora $dfbd
$0c:f88a  83 7f		 sta $7f,s
$0c:f88c  cf 4f 8a e0   cmp $e08a4f
$0c:f890  e4 02		 cpx $02
$0c:f892  a8			tay
$0c:f893  00 43		 brk #$43
$0c:f895  81 ff		 sta ($ff,x)
$0c:f897  c4 7f		 cpy $7f
$0c:f899  df c2 24 37   cmp $3724c2,x
$0c:f89d  f0 2d		 beq $f8cc
$0c:f89f  83 cb		 sta $cb,s
$0c:f8a1  65 fe		 adc $fe
$0c:f8a3  40			rti
$0c:f8a4  b7 33		 lda [$33],y
$0c:f8a6  be 15 fd	  ldx $fd15,y
$0c:f8a9  6c 19 22	  jmp ($2219)
$0c:f8ac  f0 60		 beq $f90e
$0c:f8ae  30 1f		 bmi $f8cf
$0c:f8b0  fc d7 ff	  jsr ($ffd7,x)
$0c:f8b3  fb			xce
$0c:f8b4  ff e2 7f f7   sbc $f77fe2,x
$0c:f8b8  9f fd ff fc   sta $fcfffd,x
$0c:f8bc  fe 00 10	  inc $1000,x
$0c:f8bf  e2 4e		 sep #$4e
$0c:f8c1  27 5f		 and [$5f]
$0c:f8c3  ca			dex
$0c:f8c4  74 cb		 stz $cb,x
$0c:f8c6  d5 37		 cmp $37,x
$0c:f8c8  d6 ff		 dec $ff,x
$0c:f8ca  a5 9a		 lda $9a
$0c:f8cc  50 fb		 bvc $f8c9
$0c:f8ce  60			rts
$0c:f8cf  6f 16 68 8e   adc $8e6816
$0c:f8d3  66 85		 ror $85
$0c:f8d5  5a			phy
$0c:f8d6  4d 09 34	  eor $3409
$0c:f8d9  39 94 ce	  and $ce94,y
$0c:f8dc  3d 1e 57	  and $571e,x
$0c:f8df  e3 96		 sbc $96,s
$0c:f8e1  78			sei
$0c:f8e2  22 df 18 bf   jsl $bf18df
$0c:f8e6  c2 a7		 rep #$a7
$0c:f8e8  f0 ac		 beq $f896
$0c:f8ea  fe 26 7f	  inc $7f26,x
$0c:f8ed  f9 c7 fe	  sbc $fec7,y
$0c:f8f0  39 ff 8f	  and $8fff,y
$0c:f8f3  ff e1 ec 63   sbc $63ece1,x
$0c:f8f7  83 ff		 sta $ff,s
$0c:f8f9  e8			inx
$0c:f8fa  d7 5e		 cmp [$5e],y
$0c:f8fc  3f 92 15 d1   and $d11592,x
$0c:f900  94 4c		 sty $4c,x
$0c:f902  fa			plx
$0c:f903  3e 39 b7	  rol $b739,x
$0c:f906  0f c3 07 e1   ora $e107c3
$0c:f90a  c3 f1		 cmp $f1,s
$0c:f90c  7f f8 d8 10   adc $10d8f8,x
$0c:f910  43 f1		 eor $f1,s
$0c:f912  60			rts
$0c:f913  8f c0 6f f0   sta $f06fc0
$0c:f917  7b			tdc
$0c:f918  fc 7e ff	  jsr ($ff7e,x)
$0c:f91b  7e bf 1f	  ror $1fbf,x
$0c:f91e  09 1a 0f	  ora #$0f1a
$0c:f921  c0 7f		 cpy #$7f
$0c:f923  a6 05		 ldx $05
$0c:f925  1a			inc a
$0c:f926  10 0b		 bpl $f933
$0c:f928  fc 00 18	  jsr ($1800,x)
$0c:f92b  0f 14 7b 05   ora $057b14
$0c:f92f  fe f1 7f	  inc $7ff1,x
$0c:f932  b0 5f		 bcs $f993
$0c:f934  a0 37		 ldy #$37
$0c:f936  86 68		 stx $68
$0c:f938  23 40		 and $40,s
$0c:f93a  40			rti
$0c:f93b  3f eb ff e2   and $e2ffeb,x
$0c:f93f  ff e0 00 1f   sbc $1f00e0,x
$0c:f943  ff f3 ff f0   sbc $f0fff3,x
$0c:f947  a8			tay
$0c:f948  83 f3		 sta $f3,s
$0c:f94a  07 f0		 ora [$f0]
$0c:f94c  c7 c0		 cmp [$c0]
$0c:f94e  e0 cd		 cpx #$cd
$0c:f950  06 28		 asl $28
$0c:f952  7e 7f de	  ror $de7f,x
$0c:f955  1f f6 07 fd   ora $fd07f6,x
$0c:f959  01 22		 ora ($22,x)
$0c:f95b  3c 47 ff	  bit $ff47,x
$0c:f95e  e9 ef f2	  sbc #$f2ef
$0c:f961  bf f5 ef 7d   lda $7deff5,x
$0c:f965  7a			ply
$0c:f966  df 26 9e ed   cmp $ed9e26,x
$0c:f96a  77 d9		 adc [$d9],y
$0c:f96c  5c f2 b4 0b   jml $0bb4f2
$0c:f970  e8			inx
$0c:f971  7f 0e 07 fe   adc $fe070e,x
$0c:f975  80 ee		 bra $f965
$0c:f977  0f fc 9e 41   ora $419efc
$0c:f97b  4f b0 43 a8   eor $a843b0
$0c:f97f  3d 9c 33	  and $339c,x
$0c:f982  e8			inx
$0c:f983  2b			pld
$0c:f984  fc 0a cc	  jsr ($cc0a,x)
$0c:f987  e2 b3		 sep #$b3
$0c:f989  c7 e0		 cmp [$e0]
$0c:f98b  47 f0		 eor [$f0]
$0c:f98d  08			php
$0c:f98e  00 9f		 brk #$9f
$0c:f990  c0 10		 cpy #$10
$0c:f992  81 7f		 sta ($7f,x)
$0c:f994  e0 4f		 cpx #$4f
$0c:f996  ff 10 74 20   sbc $207410,x
$0c:f99a  4f 38 77 0c   eor $0c7738
$0c:f99e  7a			ply
$0c:f99f  24 37		 bit $37
$0c:f9a1  e6 b0		 inc $b0
$0c:f9a3  2f 8f 32 19   and $19328f
$0c:f9a7  df e0 17 d8   cmp $d817e0,x
$0c:f9ab  be 50 cf	  ldx $cf50,y
$0c:f9ae  9a			txs
$0c:f9af  24 0b		 bit $0b
$0c:f9b1  e4 c5		 cpx $c5
$0c:f9b3  0c 3d fc	  tsb $fc3d
$0c:f9b6  6e 08 b0	  ror $b008
$0c:f9b9  fe 40 c3	  inc $c340,x
$0c:f9bc  60			rts
$0c:f9bd  9f a2 f9 43   sta $43f9a2,x
$0c:f9c1  7e 30 5f	  ror $5f30,x
$0c:f9c4  cf cb f9 9c   cmp $9cf9cb
$0c:f9c8  cf 71 f8 de   cmp $def871
$0c:f9cc  9f 0d db e1   sta $e1db0d,x
$0c:f9d0  7b			tdc
$0c:f9d1  fc 11 48	  jsr ($4811,x)
$0c:f9d4  ca			dex
$0c:f9d5  06 d0		 asl $d0
$0c:f9d7  9c 7f e3	  stz $e37f
$0c:f9da  df f8 7f fc   cmp $fc7ff8,x
$0c:f9de  3c 1e a8	  bit $a81e,x
$0c:f9e1  3e 26 f9	  rol $f926,x
$0c:f9e4  1b			tcs
$0c:f9e5  f0 d9		 beq $f9c0
$0c:f9e7  be d4 5a	  ldx $5ad4,y
$0c:f9ea  29 10		 and #$10
$0c:f9ec  31 5f		 and ($5f),y
$0c:f9ee  c8			iny
$0c:f9ef  6f ef ff f8   adc $f8ffef
$0c:f9f3  ff fc 3f 9f   sbc $9f3ffc,x
$0c:f9f7  31 80		 and ($80),y
$0c:f9f9  6e bf e4	  ror $e4bf
$0c:f9fc  d0 83		 bne $f981
$0c:f9fe  fe 20 9f	  inc $9f20,x
$0c:fa01  b4 48		 ldy $48,x
$0c:fa03  4f ff f4 e9   eor $e9f4ff
$0c:fa07  97 aa		 sta [$aa],y
$0c:fa09  6f ad ff 4b   adc $4bffad
$0c:fa0d  34 bf		 bit $bf,x
$0c:fa0f  f0 da		 beq $f9eb
$0c:fa11  e0 6f		 cpx #$6f
$0c:fa13  16 68		 asl $68,x
$0c:fa15  8e 66 85	  stx $8566
$0c:fa18  5a			phy
$0c:fa19  0d 09 94	  ora $9409
$0c:fa1c  2d 1e ba	  and $ba1e
$0c:fa1f  c7 6e		 cmp [$6e]
$0c:fa21  91 cb		 sta ($cb),y
$0c:fa23  18			clc
$0c:fa24  95 27		 sta $27,x
$0c:fa26  94 2f		 sty $2f,x
$0c:fa28  01 98		 ora ($98,x)
$0c:fa2a  45 cd		 eor $cd
$0c:fa2c  c1 ff		 cmp ($ff,x)
$0c:fa2e  9b			txy
$0c:fa2f  90 0c		 bcc $fa3d
$0c:fa31  86 03		 stx $03
$0c:fa33  f0 21		 beq $fa56
$0c:fa35  86 0e		 stx $0e
$0c:fa37  17 c7		 ora [$c7],y
$0c:fa39  83 f5		 sta $f5,s
$0c:fa3b  e3 f4		 sbc $f4,s
$0c:fa3d  38			sec
$0c:fa3e  5f 0e 17 e7   eor $e7170e,x
$0c:fa42  97 95		 sta [$95],y
$0c:fa44  c0 ae		 cpy #$ae
$0c:fa46  0f e0 0d 87   ora $870de0
$0c:fa4a  bf fe fe 07   lda $07fefe,x
$0c:fa4e  f0 77		 beq $fac7
$0c:fa50  cc 87 17	  cpy $1787
$0c:fa53  ee 4a 7d	  inc $7d4a
$0c:fa56  9e 99 1f	  stz $1f99,x
$0c:fa59  52 63		 eor ($63)
$0c:fa5b  0a			asl a
$0c:fa5c  fc 49 7f	  jsr ($7f49,x)
$0c:fa5f  93 af		 sta ($af,s),y
$0c:fa61  74 fb		 stz $fb,x
$0c:fa63  e7 23		 sbc [$23]
$0c:fa65  ff c4 ff f1   sbc $f1ffc4,x
$0c:fa69  cf fc 39 d8   cmp $d839fc
$0c:fa6d  30 3f		 bmi $faae
$0c:fa6f  fc 45 54	  jsr ($5445,x)
$0c:fa72  0b			phd
$0c:fa73  40			rti
$0c:fa74  87 f5		 sta [$f5]
$0c:fa76  23 f5		 and $f5,s
$0c:fa78  38			sec
$0c:fa79  a5 53		 lda $53
$0c:fa7b  b1 8f		 lda ($8f),y
$0c:fa7d  ff e4 23 ff   sbc $ff23e4,x
$0c:fa81  38			sec
$0c:fa82  7e f3 06	  ror $06f3,x
$0c:fa85  61 23		 adc ($23,x)
$0c:fa87  18			clc
$0c:fa88  4b			phk
$0c:fa89  c5 83		 cmp $83
$0c:fa8b  e0 0d		 cpx #$0d
$0c:fa8d  8d ff ff	  sta $ffff
$0c:fa90  4c fe 51	  jmp $51fe
$0c:fa93  bf d7 3f fd   lda $fd3fd7,x
$0c:fa97  43 bf		 eor $bf,s
$0c:fa99  52 ee		 eor ($ee)
$0c:fa9b  54 fb 83	  mvn $83,$fb
$0c:fa9e  32 44		 and ($44)
$0c:faa0  84 04		 sty $04
$0c:faa2  58			cli
$0c:faa3  32 0f		 and ($0f)
$0c:faa5  f9 fc 0f	  sbc $0ffc,y
$0c:faa8  e0 43		 cpx #$43
$0c:faaa  28			plp
$0c:faab  e4 7e		 cpx $7e
$0c:faad  cf 7b ee 7f   cmp $7fee7b
$0c:fab1  3e 3f 98	  rol $983f,x
$0c:fab4  9c 6c a6	  stz $a66c
$0c:fab7  1d 38 d9	  ora $d938,x
$0c:faba  54 0c 61	  mvn $61,$0c
$0c:fabd  8c ff c1	  sty $c1ff
$0c:fac0  3f f0 9f ff   and $ff9ff0,x
$0c:fac4  ac c4 2e	  ldy $2ec4
$0c:fac7  70 36		 bvs $faff
$0c:fac9  87 06		 sta [$06]
$0c:facb  41 45		 eor ($45,x)
$0c:facd  f0 70		 beq $fb3f
$0c:facf  e2 57		 sep #$57
$0c:fad1  98			tya
$0c:fad2  07 b2		 ora [$b2]
$0c:fad4  03 f6		 ora $f6,s
$0c:fad6  90 cc		 bcc $faa4
$0c:fad8  e6 5c		 inc $5c
$0c:fada  f9 84 fb	  sbc $fb84,y
$0c:fadd  ff fe ff ff   sbc $fffffe,x
$0c:fae1  00 02		 brk #$02
$0c:fae3  01 0e		 ora ($0e,x)
$0c:fae5  f7 ff		 sbc [$ff],y
$0c:fae7  98			tya
$0c:fae8  2c 1a 25	  bit $251a
$0c:faeb  03 65		 ora $65,s
$0c:faed  04 e2		 tsb $e2
$0c:faef  45 af		 eor $af
$0c:faf1  b7 68		 lda [$68],y
$0c:faf3  9c eb ad	  stz $adeb
$0c:faf6  cb			wai
$0c:faf7  d9 4d eb	  cmp $eb4d,y
$0c:fafa  d9 b9 c6	  cmp $c6b9,y
$0c:fafd  02 71		 cop #$71
$0c:faff  c0 8c		 cpy #$8c
$0c:fb01  78			sei
$0c:fb02  2f 18 0f e4   and $e40f18
$0c:fb06  02 79		 cop #$79
$0c:fb08  00 e6		 brk #$e6
$0c:fb0a  40			rti
$0c:fb0b  3c 90 0f	  bit $0f90,x
$0c:fb0e  1c 22 d3	  trb $d322
$0c:fb11  08			php
$0c:fb12  b8			clv
$0c:fb13  41 2e		 eor ($2e,x)
$0c:fb15  90 4d		 bcc $fb64
$0c:fb17  86 00		 stx $00
$0c:fb19  6e 1d 5e	  ror $5e1d
$0c:fb1c  2d 43 8f	  and $8f43
$0c:fb1f  08			php
$0c:fb20  f9 c2 3e	  sbc $3ec2,y
$0c:fb23  30 4f		 bmi $fb74
$0c:fb25  cc 13 f1	  cpy $f113
$0c:fb28  80 be		 bra $fae8
$0c:fb2a  11 c3		 ora ($c3),y
$0c:fb2c  8b			phb
$0c:fb2d  38			sec
$0c:fb2e  e3 ce		 sbc $ce,s
$0c:fb30  34 d4		 bit $d4,x
$0c:fb32  8e b4 63	  stx $63b4
$0c:fb35  b9 10 f6	  lda $f610,y
$0c:fb38  cc 6f 32	  cpy $326f
$0c:fb3b  18			clc
$0c:fb3c  9c 8f 4d	  stz $4d8f
$0c:fb3f  c7 eb		 cmp [$eb]
$0c:fb41  47 e1		 eor [$e1]
$0c:fb43  ff 08 ff 80   sbc $80ff08,x
$0c:fb47  c2 13		 rep #$13
$0c:fb49  ee 01 94	  inc $9401
$0c:fb4c  27 9c		 and [$9c]
$0c:fb4e  0f c4 03 c1   ora $c103c4
$0c:fb52  00 8c		 brk #$8c
$0c:fb54  41 e9		 eor ($e9,x)
$0c:fb56  f3 fd		 sbc ($fd,s),y
$0c:fb58  ad ca 23	  lda $23ca
$0c:fb5b  0d af ce	  ora $ceaf
$0c:fb5e  ea			nop
$0c:fb5f  51 ad		 eor ($ad),y
$0c:fb61  ae 52 cd	  ldx $cd52
$0c:fb64  05 80		 ora $80
$0c:fb66  1f c6 1f 00   ora $001fc6,x
$0c:fb6a  ff 40 04 e1   sbc $e10440,x
$0c:fb6e  dd 90 46	  cmp $4690,x
$0c:fb71  ec 10 bf	  cpx $bf10
$0c:fb74  84 1b		 sty $1b
$0c:fb76  0d 98 ec	  ora $ec98
$0c:fb79  59 2c 7b	  eor $7b2c,y
$0c:fb7c  6c 7f 72	  jmp ($727f)
$0c:fb7f  79 71 f8	  adc $f871,y
$0c:fb82  53 b8		 eor ($b8,s),y
$0c:fb84  39 9c 34	  and $349c,y
$0c:fb87  06 01		 asl $01
$0c:fb89  07 80		 ora [$80]
$0c:fb8b  67 e0		 adc [$e0]
$0c:fb8d  17 f4		 ora [$f4],y
$0c:fb8f  30 40		 bmi $fbd1
$0c:fb91  fe 10 fe	  inc $fe10,x
$0c:fb94  04 ff		 tsb $ff
$0c:fb96  01 7f		 ora ($7f,x)
$0c:fb98  67 87		 adc [$87]
$0c:fb9a  1e 0f f3	  asl $f30f,x
$0c:fb9d  81 ce		 sta ($ce,x)
$0c:fb9f  38			sec
$0c:fba0  36 db		 rol $db,x
$0c:fba2  8e 6a 39	  stx $396a
$0c:fba5  79 c1 7c	  adc $7cc1,y
$0c:fba8  e0 46 d0	  cpx #$d046
$0c:fbab  35 80		 and $80,x
$0c:fbad  9c 10 a1	  stz $a110
$0c:fbb0  7e c0 18	  ror $18c0,x
$0c:fbb3  c2 06		 rep #$06
$0c:fbb5  a7 01		 lda [$01]
$0c:fbb7  38			sec
$0c:fbb8  40			rti
$0c:fbb9  28			plp
$0c:fbba  18			clc
$0c:fbbb  0d 27 03	  ora $0327
$0c:fbbe  6d d8 af	  adc $afd8
$0c:fbc1  7a			ply
$0c:fbc2  33 1e		 and ($1e,s),y
$0c:fbc4  ce 46 c2	  dec $c246
$0c:fbc7  41 40		 eor ($40,x)
$0c:fbc9  3f 84 12 09   and $091284,x
$0c:fbcd  06 83		 asl $83
$0c:fbcf  47 a3		 eor [$a3]
$0c:fbd1  d0 e8		 bne $fbbb
$0c:fbd3  74 32		 stz $32,x
$0c:fbd5  18			clc
$0c:fbd6  7f 0c 04 03   adc $03040c,x
$0c:fbda  ff 00 d4 d5   sbc $d5d400,x
$0c:fbde  ba			tsx
$0c:fbdf  56 dc		 lsr $dc,x
$0c:fbe1  05 7f		 ora $7f
$0c:fbe3  cd 6f db	  cmp $db6f
$0c:fbe6  dc 3f f7	  jml [$f73f]
$0c:fbe9  ab			plb
$0c:fbea  bf c5 dc 20   lda $20dcc5,x
$0c:fbee  01 90		 ora ($90,x)
$0c:fbf0  7f e2 1f f8   adc $f81fe2,x
$0c:fbf4  47 fe		 eor [$fe]
$0c:fbf6  03 fe		 ora $fe,s
$0c:fbf8  85 ff		 sta $ff
$0c:fbfa  2f f8 0d 25   and $250df8
$0c:fbfe  76 17		 ror $17,x
$0c:fc00  fa			plx
$0c:fc01  89 fc		 bit #$fc
$0c:fc03  bc be 4e	  ldy $4ebe,x
$0c:fc06  04 07		 tsb $07
$0c:fc08  87 82		 sta [$82]
$0c:fc0a  f4 27 c3	  pea $c327
$0c:fc0d  ff 02 ff c1   sbc $c1ff02,x
$0c:fc11  3f f0 cf fc   and $fccff0,x
$0c:fc15  6b			rtl
$0c:fc16  ff 3e ff cf   sbc $cfff3e,x
$0c:fc1a  3f fb eb fe   and $feebfb,x
$0c:fc1e  26 1f		 rol $1f
$0c:fc20  a2 91 a1	  ldx #$a191
$0c:fc23  43 81		 eor $81,s
$0c:fc25  ff e3 70 37   sbc $3770e3,x
$0c:fc29  f8			sed
$0c:fc2a  0d 16 03	  ora $0316
$0c:fc2d  b3 d9		 lda ($d9,s),y
$0c:fc2f  f8			sed
$0c:fc30  7f fb 9f f2   adc $f29ffb,x
$0c:fc34  11 4f		 ora ($4f),y
$0c:fc36  ff f7 f2 40   sbc $40f2f7,x
$0c:fc3a  c9 bf		 cmp #$bf
$0c:fc3c  f9 0c 7d	  sbc $7d0c,y
$0c:fc3f  97 c1		 sta [$c1],y
$0c:fc41  9f 8f bb 80   sta $80bb8f,x
$0c:fc45  00 54		 brk #$54
$0c:fc47  4a			lsr a
$0c:fc48  26 7b		 rol $7b
$0c:fc4a  3c 49 08	  bit $0849,x
$0c:fc4d  ff ff c0 42   sbc $42c0ff,x
$0c:fc51  32 10		 and ($10)
$0c:fc53  6e ff f6	  ror $f6ff
$0c:fc56  1f fc ef e9   ora $e9effc,x
$0c:fc5a  14 f9		 trb $f9
$0c:fc5c  ee ff 1b	  inc $1bff
$0c:fc5f  3f 86 57 e9   and $e95786,x
$0c:fc63  5b			tcd
$0c:fc64  bc 6b 27	  ldy $276b,x
$0c:fc67  9d 2a f4	  sta $f42a,x
$0c:fc6a  3f fe 7f 08   and $087ffe,x
$0c:fc6e  3a			dec a
$0c:fc6f  00 61		 brk #$61
$0c:fc71  7f fc 3f ff   adc $ff3ffc,x
$0c:fc75  87 ff		 sta [$ff]
$0c:fc77  d0 ff		 bne $fc78
$0c:fc79  f4 7e 0f	  pea $0f7e
$0c:fc7c  1c fc 8e	  trb $8efc
$0c:fc7f  1c b9 ff	  trb $ffb9
$0c:fc82  92 3f		 sta ($3f)
$0c:fc84  d0 97		 bne $fc1d
$0c:fc86  f5 27		 sbc $27,x
$0c:fc88  76 48		 ror $48,x
$0c:fc8a  f9 84 06	  sbc $0684,y
$0c:fc8d  a0 a2 a6	  ldy #$a6a2
$0c:fc90  f8			sed
$0c:fc91  2c 3d 83	  bit $833d
$0c:fc94  ed 2f 6f	  sbc $6f2f
$0c:fc97  4e fe e1	  lsr $e1fe
$0c:fc9a  d5 b8		 cmp $b8,x
$0c:fc9c  7d ee 1a	  adc $1aee,x
$0c:fc9f  fb			xce
$0c:fca0  07 be		 ora [$be]
$0c:fca2  c1 52		 cmp ($52,x)
$0c:fca4  e0 79 6c	  cpx #$6c79
$0c:fca7  bf b8 24 21   lda $2124b8,x
$0c:fcab  08			php
$0c:fcac  27 f0		 and [$f0]
$0c:fcae  30 81		 bmi $fc31
$0c:fcb0  84 12		 sty $12
$0c:fcb2  60			rts
$0c:fcb3  27 08		 and [$08]
$0c:fcb5  07 ff		 ora [$ff]
$0c:fcb7  35 eb		 and $eb,x
$0c:fcb9  ba			tsx
$0c:fcba  59 a5 93	  eor $93a5,y
$0c:fcbd  4d d4 cb	  eor $cbd4
$0c:fcc0  a5 1a		 lda $1a
$0c:fcc2  ae e6 69	  ldx $69e6
$0c:fcc5  38			sec
$0c:fcc6  dd 05 33	  cmp $3305,x
$0c:fcc9  e9 00		 sbc #$00
$0c:fccb  bc 60 27	  ldy $2760,x
$0c:fcce  1c 09 e7	  trb $e709
$0c:fcd1  02 39		 cop #$39
$0c:fcd3  e0 8f 78	  cpx #$788f
$0c:fcd6  21 df		 and ($df,x)
$0c:fcd8  08			php
$0c:fcd9  7f c3 35 48   adc $4835c3,x
$0c:fcdd  d3 db		 cmp ($db,s),y
$0c:fcdf  f4 76 0a	  pea $0a76
$0c:fce2  84 c2		 sty $c2
$0c:fce4  81 20		 sta ($20,x)
$0c:fce6  e0 68 38	  cpx #$3868
$0c:fce9  18			clc
$0c:fcea  06 f0		 asl $f0
$0c:fcec  73 e6		 adc ($e6,s),y
$0c:fcee  1e 88 87	  asl $8788,x
$0c:fcf1  82 21 f0	  brl $ed15
$0c:fcf4  80 78		 bra $fd6e
$0c:fcf6  20 16 08	  jsr $0816
$0c:fcf9  05 02		 ora $02
$0c:fcfb  00 3c		 brk #$3c
$0c:fcfd  0b			phd
$0c:fcfe  65 fa		 adc $fa
$0c:fd00  a5 bc		 lda $bc
$0c:fd02  c6 5c		 dec $5c
$0c:fd04  27 14		 and [$14]
$0c:fd06  82 a0 47	  brl $44a9
$0c:fd09  24 11		 bit $11
$0c:fd0b  86 f0		 stx $f0
$0c:fd0d  8f 05 bc 30   sta $30bc05
$0c:fd11  88			dey
$0c:fd12  44 e2 71	  mvp $71,$e2
$0c:fd15  3e 9f 47	  rol $479f,x
$0c:fd18  23 8d		 and $8d,s
$0c:fd1a  e0 dc 72	  cpx #$72dc
$0c:fd1d  e8			inx
$0c:fd1e  b6 3c		 ldx $3c,y
$0c:fd20  dc 5e cf	  jml [$cf5e]
$0c:fd23  ac ce 72	  ldy $72ce
$0c:fd26  f3 7c		 sbc ($7c,s),y
$0c:fd28  7c 96 c3	  jmp ($c396,x)
$0c:fd2b  79 c0 8b	  adc $8bc0,y
$0c:fd2e  f8			sed
$0c:fd2f  33 fe		 and ($fe,s),y
$0c:fd31  0f 7f 83 b9   ora $b9837f
$0c:fd35  c3 fc		 cmp $fc,s
$0c:fd37  71 fc		 adc ($fc),y
$0c:fd39  1d fe 7e	  ora $7efe,x
$0c:fd3c  ff 7f ff d5   sbc $d5ff7f,x
$0c:fd40  e7 29		 sbc [$29]
$0c:fd42  73 cc		 adc ($cc,s),y
$0c:fd44  bd e2 6d	  lda $6de2,x
$0c:fd47  f8			sed
$0c:fd48  e7 74		 sbc [$74]
$0c:fd4a  a5 33		 lda $33
$0c:fd4c  0a			asl a
$0c:fd4d  bd 83 7f	  lda $7f83,x
$0c:fd50  c0 c0 5f	  cpy #$5fc0
$0c:fd53  c1 a0		 cmp ($a0,x)
$0c:fd55  a1 1f		 lda ($1f,x)
$0c:fd57  f4 8b fb	  pea $fb8b
$0c:fd5a  c0 ff e0	  cpy #$e0ff
$0c:fd5d  01 83		 ora ($83,x)
$0c:fd5f  c2 81		 rep #$81
$0c:fd61  e0 20 31	  cpx #$3120
$0c:fd64  29 9d		 and #$9d
$0c:fd66  03 81		 ora $81,s
$0c:fd68  3f 80 7f 20   and $207f80,x
$0c:fd6c  1f 38 1e 3a   ora $3a1e38,x
$0c:fd70  1f 03 f0 40   ora $40f003,x
$0c:fd74  70 13		 bvs $fd89
$0c:fd76  38			sec
$0c:fd77  62 d8 41	  per $3f52
$0c:fd7a  83 03		 sta $03,s
$0c:fd7c  fe 0b 42	  inc $420b,x
$0c:fd7f  c1 40		 cmp ($40,x)
$0c:fd81  f0 50		 beq $fdd3
$0c:fd83  1a			inc a
$0c:fd84  41 80		 eor ($80,x)
$0c:fd86  e0 64 22	  cpx #$2264
$0c:fd89  16 0b		 asl $0b,x
$0c:fd8b  e0 a4 3c	  cpx #$3ca4
$0c:fd8e  d0 61		 bne $fdf1
$0c:fd90  e0 37 cb	  cpx #$cb37
$0c:fd93  81 00		 sta ($00,x)
$0c:fd95  21 05		 and ($05,x)
$0c:fd97  f3 01		 sbc ($01,s),y
$0c:fd99  fe 80 7e	  inc $7e80,x
$0c:fd9c  60			rts
$0c:fd9d  00 02		 brk #$02
$0c:fd9f  03 00		 ora $00,s
$0c:fda1  06 9c		 asl $9c
$0c:fda3  3b			tsc
$0c:fda4  c3 57		 cmp $57,s
$0c:fda6  ab			plb
$0c:fda7  77 a4		 adc [$a4],y
$0c:fda9  32 9b		 and ($9b)
$0c:fdab  0d d0 f2	  ora $f2d0
$0c:fdae  27 19		 and [$19]
$0c:fdb0  ed 85 16	  sbc $1685
$0c:fdb3  8b			phb
$0c:fdb4  a2 d1 00	  ldx #$00d1
$0c:fdb7  4a			lsr a
$0c:fdb8  1d 55 87	  ora $8755,x
$0c:fdbb  e7 1f		 sbc [$1f]
$0c:fdbd  c1 a6		 cmp ($a6,x)
$0c:fdbf  00 bc		 brk #$bc
$0c:fdc1  5a			phy
$0c:fdc2  df 17 d2 72   cmp $72d217,x
$0c:fdc6  27 3b		 and [$3b]
$0c:fdc8  2e 97 4a	  rol $4a97
$0c:fdcb  d7 ac		 cmp [$ac],y
$0c:fdcd  f4 72 35	  pea $3572
$0c:fdd0  82 10 10	  brl $0de3
$0c:fdd3  97 23		 sta [$23],y
$0c:fdd5  51 af		 eor ($af),y
$0c:fdd7  80 40		 bra $fe19
$0c:fdd9  20 74 1f	  jsr $1f74
$0c:fddc  3d 2b 9f	  and $9f2b,x
$0c:fddf  02 18		 cop #$18
$0c:fde1  80 c8		 bra $fdab
$0c:fde3  39 c1 e1	  and $e1c1,y
$0c:fde6  18			clc
$0c:fde7  8c c7 c1	  sty $c1c7
$0c:fdea  e1 ed		 sbc ($ed,x)
$0c:fdec  73 09		 adc ($09,s),y
$0c:fdee  05 32		 ora $32
$0c:fdf0  f0 0b		 beq $fdfd
$0c:fdf2  ce 63 e2	  dec $e263
$0c:fdf5  f1 f6		 sbc ($f6),y
$0c:fdf7  39 a5 82	  and $82a5,y
$0c:fdfa  99 f8 87	  sta $87f8,y
$0c:fdfd  e6 3d		 inc $3d
$0c:fdff  0e 47 3f	  asl $3f47
$0c:fe02  e8			inx
$0c:fe03  68			pla
$0c:fe04  1f a8 f4 05   ora $05f4a8,x
$0c:fe08  e7 ac		 sbc [$ac]
$0c:fe0a  2c 06 b2	  bit $b206
$0c:fe0d  09 01		 ora #$01
$0c:fe0f  3c 84 20	  bit $2084,x
$0c:fe12  e8			inx
$0c:fe13  03 f3		 ora $f3,s
$0c:fe15  34 10		 bit $10,x
$0c:fe17  e0 cd 00	  cpx #$00cd
$0c:fe1a  2f 28 01 e4   and $e40128
$0c:fe1e  60			rts
$0c:fe1f  23 91		 and $91,s
$0c:fe21  49 10		 eor #$10
$0c:fe23  7c 35 84	  jmp ($8435,x)
$0c:fe26  80 d6		 bra $fdfe
$0c:fe28  0c 41 42	  tsb $4241
$0c:fe2b  c2 f0		 rep #$f0
$0c:fe2d  32 14		 and ($14)
$0c:fe2f  08			php
$0c:fe30  c6 6b		 dec $6b
$0c:fe32  52 0f		 eor ($0f)
$0c:fe34  81 10		 sta ($10,x)
$0c:fe36  56 82		 lsr $82,x
$0c:fe38  c1 61		 cmp ($61,x)
$0c:fe3a  78			sei
$0c:fe3b  15 05		 ora $05,x
$0c:fe3d  88			dey
$0c:fe3e  4d 25 0f	  eor $0f25
$0c:fe41  80 f4		 bra $fe37
$0c:fe43  3f ab 43 71   and $7143ab,x
$0c:fe47  a7 27		 lda [$27]
$0c:fe49  41 0c		 eor ($0c,x)
$0c:fe4b  a6 c3		 ldx $c3
$0c:fe4d  67 1a		 adc [$1a]
$0c:fe4f  bd 5c e1	  lda $e15c,x
$0c:fe52  ee 0f 53	  inc $530f
$0c:fe55  e4 e6		 cpx $e6
$0c:fe57  e1 d5		 sbc ($d5,x)
$0c:fe59  58			cli
$0c:fe5a  78			sei
$0c:fe5b  58			cli
$0c:fe5c  b4 40		 ldy $40,x
$0c:fe5e  42 ce		 wdm #$ce
$0c:fe60  ce 3a 9a	  dec $9a3a
$0c:fe63  38			sec
$0c:fe64  b5 be		 lda $be,x
$0c:fe66  2e 04 7d	  rol $7d04
$0c:fe69  2c e3 91	  bit $91e3
$0c:fe6c  ac e9 08	  ldy $08e9
$0c:fe6f  46 d7		 lsr $d7
$0c:fe71  ac e4 7a	  ldy $7ae4
$0c:fe74  04 03		 tsb $03
$0c:fe76  6b			rtl
$0c:fe77  d9 ce 56	  cmp $56ce,y
$0c:fe7a  62 89 2e	  per $2d06
$0c:fe7d  75 03		 adc $03,x
$0c:fe7f  cf 4b 44 04   cmp $04444b
$0c:fe83  bb			tyx
$0c:fe84  5d a9 f0	  eor $f0a9,x
$0c:fe87  f6 94		 inc $94,x
$0c:fe89  40			rti
$0c:fe8a  41 19		 eor ($19,x)
$0c:fe8c  93 08		 sta ($08,s),y
$0c:fe8e  87 60		 sta [$60]
$0c:fe90  2d 0f 1f	  and $1f0f
$0c:fe93  60			rts
$0c:fe94  ea			nop
$0c:fe95  05 11		 ora $11
$0c:fe97  99 b6 08	  sta $08b6,y
$0c:fe9a  76 4e		 ror $4e,x
$0c:fe9c  30 42		 bmi $fee0
$0c:fe9e  17 d5		 ora [$d5],y
$0c:fea0  62 64 b2	  per $b107
$0c:fea3  e6 eb		 inc $eb
$0c:fea5  20 89 41	  jsr $4189
$0c:fea8  84 6b		 sty $6b
$0c:feaa  0a			asl a
$0c:feab  81 ac		 sta ($ac,x)
$0c:fead  1d 19 84	  ora $8419,x
$0c:feb0  06 26		 asl $26
$0c:feb2  61 22		 adc ($22,x)
$0c:feb4  51 9c		 eor ($9c),y
$0c:feb6  c0 64 23	  cpy #$2364
$0c:feb9  30 39		 bmi $fef4
$0c:febb  0a			asl a
$0c:febc  40			rti
$0c:febd  47 83		 eor [$83]
$0c:febf  cc d6 0c	  cpy $0cd6
$0c:fec2  c3 58		 cmp $58,s
$0c:fec4  44 05 02	  mvp $02,$05
$0c:fec7  47 c5		 eor [$c5]
$0c:fec9  a6 e6		 ldx $e6
$0c:fecb  15 7a		 ora $7a,x
$0c:fecd  c7 87		 cmp [$87]
$0c:fecf  a2 da 22	  ldx #$22da
$0c:fed2  39 30 8a	  and $8a30,y
$0c:fed5  3c 4d 16	  bit $164d,x
$0c:fed8  31 15		 and ($15),y
$0c:feda  c9 a4 4b	  cmp #$4ba4
$0c:fedd  c1 57		 cmp ($57,x)
$0c:fedf  9f f5 be ac   sta $acbef5,x
$0c:fee3  c1 d4		 cmp ($d4,x)
$0c:fee5  6b			rtl
$0c:fee6  f5 9d		 sbc $9d,x
$0c:fee8  9e c1 e4	  stz $e4c1,x
$0c:feeb  20 6f 16	  jsr $166f
$0c:feee  9c ec 8c	  stz $8cec
$0c:fef1  a0 60 06	  ldy #$0660
$0c:fef4  38			sec
$0c:fef5  00 59		 brk #$59
$0c:fef7  de 10 80	  dec $8010,x
$0c:fefa  10 41		 bpl $ff3d
$0c:fefc  06 60		 asl $60
$0c:fefe  11 67		 ora ($67),y
$0c:ff00  f8			sed
$0c:ff01  2e 00 92	  rol $9200
$0c:ff04  28			plp
$0c:ff05  40			rti
$0c:ff06  11 2b		 ora ($2b),y
$0c:ff08  bc 04 38	  ldy $3804,x
$0c:ff0b  1f f1 87 90   ora $9087f1,x
$0c:ff0f  7c a5 bc	  jmp ($bca5,x)
$0c:ff12  ce df 69	  dec $69df
$0c:ff15  54 0a a0	  mvn $a0,$0a
$0c:ff18  41 2b		 eor ($2b,x)
$0c:ff1a  bc 17 40	  ldy $4017,x
$0c:ff1d  91 a7		 sta ($a7),y
$0c:ff1f  f8			sed
$0c:ff20  72 26		 adc ($26)
$0c:ff22  f3 65		 sbc ($65,s),y
$0c:ff24  d0 28		 bne $ff4e
$0c:ff26  9d 1e 33	  sta $331e,x
$0c:ff29  69 ba 70	  adc #$70ba
$0c:ff2c  16 4f		 asl $4f,x
$0c:ff2e  38			sec
$0c:ff2f  d0 f2		 bne $ff23
$0c:ff31  98			tya
$0c:ff32  33 dc		 and ($dc,s),y
$0c:ff34  e4 4e		 cpx $4e
$0c:ff36  34 fa		 bit $fa,x
$0c:ff38  dd 8b 45	  cmp $458b,x
$0c:ff3b  f3 39		 sbc ($39,s),y
$0c:ff3d  a6 70		 ldx $70
$0c:ff3f  4e 35 4e	  lsr $4e35
$0c:ff42  09 d0 f2	  ora #$f2d0
$0c:ff45  3b			tsc
$0c:ff46  1a			inc a
$0c:ff47  c0 28 6b	  cpy #$6b28
$0c:ff4a  3b			tsc
$0c:ff4b  2e f5 8f	  rol $8ff5
$0c:ff4e  eb			xba
$0c:ff4f  b5 3c		 lda $3c,x
$0c:ff51  ff a3 dc 3e   sbc $3edca3,x
$0c:ff55  a1 80		 lda ($80,x)
$0c:ff57  00 27		 brk #$27
$0c:ff59  d7 67		 cmp [$67],y
$0c:ff5b  39 e7 c1	  and $c1e7,y
$0c:ff5e  0b			phd
$0c:ff5f  61 08		 adc ($08,x)
$0c:ff61  2c 00 41	  bit $4100
$0c:ff64  3e 4f d1	  rol $d14f,x
$0c:ff67  32 4f		 and ($4f)
$0c:ff69  3f e6 0d 11   and $110de6,x
$0c:ff6d  05 87		 ora $87
$0c:ff6f  7c 5d e7	  jmp ($e75d,x)
$0c:ff72  3a			dec a
$0c:ff73  25 f9		 and $f9
$0c:ff75  70 7b		 bvs $fff2
$0c:ff77  5c c4 00 f6   jml $f600c4
$0c:ff7b  cf eb d7 06   cmp $06d7eb
$0c:ff7f  82 b0 11	  brl $1132
$0c:ff82  f3 c9		 sbc ($c9,s),y
$0c:ff84  7e 84 d9	  ror $d984,x
$0c:ff87  78			sei
$0c:ff88  13 74		 ora ($74,s),y
$0c:ff8a  fb			xce
$0c:ff8b  f2 41		 sbc ($41)
$0c:ff8d  a1 37		 lda ($37,x)
$0c:ff8f  4d 04 d9	  eor $d904
$0c:ff92  5e e9 c1	  lsr $c1e9,x
$0c:ff95  ea			nop
$0c:ff96  f2 98		 sbc ($98)
$0c:ff98  13 cb		 ora ($cb,s),y
$0c:ff9a  d0 4e		 bne $ffea
$0c:ff9c  39 39 8d	  and $8d39,y
$0c:ff9f  8e b5 a3	  stx $a3b5
$0c:ffa2  19 f6 70	  ora $70f6,y
$0c:ffa5  33 43		 and ($43,s),y
$0c:ffa7  54 e1 99	  mvn $99,$e1
$0c:ffaa  c1 04		 cmp ($04,x)
$0c:ffac  1e 1e 01	  asl $011e,x
$0c:ffaf  f0 97		 beq $ff48
$0c:ffb1  88			dey
$0c:ffb2  fc 69 e4	  jsr ($e469,x)
$0c:ffb5  5f 2b 79 9f   eor $9f792b,x
$0c:ffb9  cf 1e 7e 3e   cmp $3e7e1e
$0c:ffbd  72 a0		 adc ($a0)
$0c:ffbf  0f d7 34 fd   ora $fd34d7
$0c:ffc3  a4 70		 ldy $70
$0c:ffc5  fc 1a ce	  jsr ($ce1a,x)
$0c:ffc8  cf 60 fd 7f   cmp $7ffd60
$0c:ffcc  5e 77 3f	  lsr $3f77,x
$0c:ffcf  9d e8 48	  sta $48e8,x
$0c:ffd2  cc 21 84	  cpy $8421
$0c:ffd5  14 1f		 trb $1f
$0c:ffd7  3d 29 4f	  and $4f29,x
$0c:ffda  3d be d4	  and $d4be,x
$0c:ffdd  a2 90 a1	  ldx #$a190
$0c:ffe0  e7 af		 sbc [$af]
$0c:ffe2  81 bc		 sta ($bc,x)
$0c:ffe4  2f e2 8f 1c   and $1c8fe2
$0c:ffe8  f9 2b cb	  sbc $cb2b,y
$0c:ffeb  7e 6c f3	  ror $f36c,x
$0c:ffee  ef a3 bd 3f   sbc $3fbda3
$0c:fff2  eb			xba
$0c:fff3  0f 60 fb 4b   ora $4bfb60
$0c:fff7  dc 72 29	  jml [$2972]
$0c:fffa  00 00		 brk #$00
$0c:fffc  e0 78 1c	  cpx #$1c78
$0c:ffff  00 a0		 brk #$a0
