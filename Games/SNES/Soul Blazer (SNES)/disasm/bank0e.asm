; Soul Blazer (SNES) - Bank $0e
; Disassembled from ROM
; File offset: $070000-$077fff
; CPU address: $0e:$8000-$0e:$ffff
;===========================================================

.bank $0e
.org $8000

$0e:8000  22 80 64 80   jsl $806480
$0e:8004  d6 80         dec $80,x
$0e:8006  28            plp
$0e:8007  81 62         sta ($62,x)
$0e:8009  81 ac         sta ($ac,x)
$0e:800b  81 f6         sta ($f6,x)
$0e:800d  81 40         sta ($40,x)
$0e:800f  82 4a 82      brl $025c
$0e:8012  54 82 66      mvn $66,$82
$0e:8015  82 78 82      brl $0290
$0e:8018  8a            txa
$0e:8019  82 9c 82      brl $02b8
$0e:801c  be 82 c8      ldx $c882,y
$0e:801f  82 d2 82      brl $02f4
$0e:8022  06 00         asl $00
$0e:8024  00 00         brk #$00
$0e:8026  00 00         brk #$00
$0e:8028  f1 82         sbc ($82),y
$0e:802a  06 00         asl $00
$0e:802c  00 00         brk #$00
$0e:802e  00 00         brk #$00
$0e:8030  06 83         asl $83
$0e:8032  06 00         asl $00
$0e:8034  00 00         brk #$00
$0e:8036  00 00         brk #$00
$0e:8038  1b            tcs
$0e:8039  83 05         sta $05,s
$0e:803b  00 00         brk #$00
$0e:803d  00 00         brk #$00
$0e:803f  00 45         brk #$45
$0e:8041  83 00         sta $00,s
$0e:8043  00 00         brk #$00
$0e:8045  00 00         brk #$00
$0e:8047  00 dc         brk #$dc
$0e:8049  82 00 00      brl $804c
$0e:804c  00 00         brk #$00
$0e:804e  00 00         brk #$00
$0e:8050  45 83         eor $83
$0e:8052  00 00         brk #$00
$0e:8054  00 00         brk #$00
$0e:8056  00 00         brk #$00
$0e:8058  dc 82 00      jml [$0082]
$0e:805b  00 00         brk #$00
$0e:805d  00 00         brk #$00
$0e:805f  00 45         brk #$45
$0e:8061  83 ff         sta $ff,s
$0e:8063  ff 03 00 00   sbc $000003,x
$0e:8067  00 00         brk #$00
$0e:8069  00 d8         brk #$d8
$0e:806b  83 03         sta $03,s
$0e:806d  00 00         brk #$00
$0e:806f  00 00         brk #$00
$0e:8071  00 ed         brk #$ed
$0e:8073  83 03         sta $03,s
$0e:8075  00 00         brk #$00
$0e:8077  00 00         brk #$00
$0e:8079  00 02         brk #$02
$0e:807b  84 01         sty $01
$0e:807d  00 00         brk #$00
$0e:807f  00 00         brk #$00
$0e:8081  00 2c         brk #$2c
$0e:8083  84 01         sty $01
$0e:8085  00 00         brk #$00
$0e:8087  00 00         brk #$00
$0e:8089  00 02         brk #$02
$0e:808b  84 01         sty $01
$0e:808d  00 00         brk #$00
$0e:808f  00 00         brk #$00
$0e:8091  00 2c         brk #$2c
$0e:8093  84 01         sty $01
$0e:8095  00 00         brk #$00
$0e:8097  00 00         brk #$00
$0e:8099  00 dc         brk #$dc
$0e:809b  82 01 00      brl $809f
$0e:809e  00 00         brk #$00
$0e:80a0  00 00         brk #$00
$0e:80a2  8e 84 01      stx $0184
$0e:80a5  00 00         brk #$00
$0e:80a7  00 00         brk #$00
$0e:80a9  00 dc         brk #$dc
$0e:80ab  82 01 00      brl $80af
$0e:80ae  00 00         brk #$00
$0e:80b0  00 00         brk #$00
$0e:80b2  8e 84 01      stx $0184
$0e:80b5  00 00         brk #$00
$0e:80b7  00 00         brk #$00
$0e:80b9  00 dc         brk #$dc
$0e:80bb  82 01 00      brl $80bf
$0e:80be  00 00         brk #$00
$0e:80c0  00 00         brk #$00
$0e:80c2  1a            inc a
$0e:80c3  85 01         sta $01
$0e:80c5  00 00         brk #$00
$0e:80c7  00 00         brk #$00
$0e:80c9  00 dc         brk #$dc
$0e:80cb  82 01 00      brl $80cf
$0e:80ce  00 00         brk #$00
$0e:80d0  00 00         brk #$00
$0e:80d2  1a            inc a
$0e:80d3  85 ff         sta $ff
$0e:80d5  ff 03 00 00   sbc $000003,x
$0e:80d9  00 00         brk #$00
$0e:80db  00 d8         brk #$d8
$0e:80dd  83 03         sta $03,s
$0e:80df  00 00         brk #$00
$0e:80e1  00 00         brk #$00
$0e:80e3  00 ed         brk #$ed
$0e:80e5  83 03         sta $03,s
$0e:80e7  00 00         brk #$00
$0e:80e9  00 00         brk #$00
$0e:80eb  00 02         brk #$02
$0e:80ed  84 03         sty $03
$0e:80ef  00 00         brk #$00
$0e:80f1  00 00         brk #$00
$0e:80f3  00 f0         brk #$f0
$0e:80f5  84 03         sty $03
$0e:80f7  00 00         brk #$00
$0e:80f9  00 00         brk #$00
$0e:80fb  00 02         brk #$02
$0e:80fd  84 03         sty $03
$0e:80ff  00 00         brk #$00
$0e:8101  00 00         brk #$00
$0e:8103  00 f0         brk #$f0
$0e:8105  84 01         sty $01
$0e:8107  00 00         brk #$00
$0e:8109  00 00         brk #$00
$0e:810b  00 dc         brk #$dc
$0e:810d  82 01 00      brl $8111
$0e:8110  00 00         brk #$00
$0e:8112  00 00         brk #$00
$0e:8114  1a            inc a
$0e:8115  85 01         sta $01
$0e:8117  00 00         brk #$00
$0e:8119  00 00         brk #$00
$0e:811b  00 dc         brk #$dc
$0e:811d  82 01 00      brl $8121
$0e:8120  00 00         brk #$00
$0e:8122  00 00         brk #$00
$0e:8124  1a            inc a
$0e:8125  85 ff         sta $ff
$0e:8127  ff 01 00 00   sbc $000001,x
$0e:812b  00 00         brk #$00
$0e:812d  00 f1         brk #$f1
$0e:812f  82 01 00      brl $8133
$0e:8132  00 00         brk #$00
$0e:8134  00 00         brk #$00
$0e:8136  06 83         asl $83
$0e:8138  03 00         ora $00,s
$0e:813a  00 00         brk #$00
$0e:813c  00 00         brk #$00
$0e:813e  6f 83 03 00   adc $000383
$0e:8142  00 00         brk #$00
$0e:8144  00 00         brk #$00
$0e:8146  84 83         sty $83
$0e:8148  03 00         ora $00,s
$0e:814a  00 00         brk #$00
$0e:814c  00 00         brk #$00
$0e:814e  99 83 03      sta $0383,y
$0e:8151  00 00         brk #$00
$0e:8153  00 00         brk #$00
$0e:8155  00 ae         brk #$ae
$0e:8157  83 03         sta $03,s
$0e:8159  00 00         brk #$00
$0e:815b  00 00         brk #$00
$0e:815d  00 c3         brk #$c3
$0e:815f  83 ff         sta $ff,s
$0e:8161  ff 01 00 00   sbc $000001,x
$0e:8165  00 fe         brk #$fe
$0e:8167  ff 44 85 01   sbc $018544,x
$0e:816b  00 00         brk #$00
$0e:816d  00 ff         brk #$ff
$0e:816f  ff 44 85 01   sbc $018544,x
$0e:8173  00 00         brk #$00
$0e:8175  00 00         brk #$00
$0e:8177  00 44         brk #$44
$0e:8179  85 01         sta $01
$0e:817b  00 00         brk #$00
$0e:817d  00 01         brk #$01
$0e:817f  00 44         brk #$44
$0e:8181  85 01         sta $01
$0e:8183  00 00         brk #$00
$0e:8185  00 02         brk #$02
$0e:8187  00 44         brk #$44
$0e:8189  85 01         sta $01
$0e:818b  00 00         brk #$00
$0e:818d  00 ff         brk #$ff
$0e:818f  ff 44 85 01   sbc $018544,x
$0e:8193  00 00         brk #$00
$0e:8195  00 00         brk #$00
$0e:8197  00 44         brk #$44
$0e:8199  85 01         sta $01
$0e:819b  00 00         brk #$00
$0e:819d  00 01         brk #$01
$0e:819f  00 44         brk #$44
$0e:81a1  85 8f         sta $8f
$0e:81a3  00 00         brk #$00
$0e:81a5  00 00         brk #$00
$0e:81a7  00 44         brk #$44
$0e:81a9  85 ff         sta $ff
$0e:81ab  ff 01 00 00   sbc $000001,x
$0e:81af  00 fe         brk #$fe
$0e:81b1  ff 60 85 01   sbc $018560,x
$0e:81b5  00 00         brk #$00
$0e:81b7  00 ff         brk #$ff
$0e:81b9  ff 60 85 01   sbc $018560,x
$0e:81bd  00 00         brk #$00
$0e:81bf  00 00         brk #$00
$0e:81c1  00 60         brk #$60
$0e:81c3  85 01         sta $01
$0e:81c5  00 00         brk #$00
$0e:81c7  00 01         brk #$01
$0e:81c9  00 60         brk #$60
$0e:81cb  85 01         sta $01
$0e:81cd  00 00         brk #$00
$0e:81cf  00 02         brk #$02
$0e:81d1  00 60         brk #$60
$0e:81d3  85 01         sta $01
$0e:81d5  00 00         brk #$00
$0e:81d7  00 ff         brk #$ff
$0e:81d9  ff 60 85 01   sbc $018560,x
$0e:81dd  00 00         brk #$00
$0e:81df  00 00         brk #$00
$0e:81e1  00 60         brk #$60
$0e:81e3  85 01         sta $01
$0e:81e5  00 00         brk #$00
$0e:81e7  00 01         brk #$01
$0e:81e9  00 60         brk #$60
$0e:81eb  85 8f         sta $8f
$0e:81ed  00 00         brk #$00
$0e:81ef  00 00         brk #$00
$0e:81f1  00 60         brk #$60
$0e:81f3  85 ff         sta $ff
$0e:81f5  ff 01 00 00   sbc $000001,x
$0e:81f9  00 fe         brk #$fe
$0e:81fb  ff 7c 85 01   sbc $01857c,x
$0e:81ff  00 00         brk #$00
$0e:8201  00 ff         brk #$ff
$0e:8203  ff 7c 85 01   sbc $01857c,x
$0e:8207  00 00         brk #$00
$0e:8209  00 00         brk #$00
$0e:820b  00 7c         brk #$7c
$0e:820d  85 01         sta $01
$0e:820f  00 00         brk #$00
$0e:8211  00 01         brk #$01
$0e:8213  00 7c         brk #$7c
$0e:8215  85 01         sta $01
$0e:8217  00 00         brk #$00
$0e:8219  00 02         brk #$02
$0e:821b  00 7c         brk #$7c
$0e:821d  85 01         sta $01
$0e:821f  00 00         brk #$00
$0e:8221  00 ff         brk #$ff
$0e:8223  ff 7c 85 01   sbc $01857c,x
$0e:8227  00 00         brk #$00
$0e:8229  00 00         brk #$00
$0e:822b  00 7c         brk #$7c
$0e:822d  85 01         sta $01
$0e:822f  00 00         brk #$00
$0e:8231  00 01         brk #$01
$0e:8233  00 7c         brk #$7c
$0e:8235  85 8f         sta $8f
$0e:8237  00 00         brk #$00
$0e:8239  00 00         brk #$00
$0e:823b  00 7c         brk #$7c
$0e:823d  85 ff         sta $ff
$0e:823f  ff 03 00 00   sbc $000003,x
$0e:8243  00 00         brk #$00
$0e:8245  00 98         brk #$98
$0e:8247  85 ff         sta $ff
$0e:8249  ff fe 00 00   sbc $0000fe,x
$0e:824d  00 00         brk #$00
$0e:824f  00 01         brk #$01
$0e:8251  86 ff         stx $ff
$0e:8253  ff 01 00 00   sbc $000001,x
$0e:8257  00 00         brk #$00
$0e:8259  00 44         brk #$44
$0e:825b  85 01         sta $01
$0e:825d  00 00         brk #$00
$0e:825f  00 00         brk #$00
$0e:8261  00 dc         brk #$dc
$0e:8263  82 ff ff      brl $8265
$0e:8266  01 00         ora ($00,x)
$0e:8268  00 00         brk #$00
$0e:826a  00 00         brk #$00
$0e:826c  60            rts
$0e:826d  85 01         sta $01
$0e:826f  00 00         brk #$00
$0e:8271  00 00         brk #$00
$0e:8273  00 dc         brk #$dc
$0e:8275  82 ff ff      brl $8277
$0e:8278  01 00         ora ($00,x)
$0e:827a  00 00         brk #$00
$0e:827c  00 00         brk #$00
$0e:827e  7c 85 01      jmp ($0185,x)
$0e:8281  00 00         brk #$00
$0e:8283  00 00         brk #$00
$0e:8285  00 dc         brk #$dc
$0e:8287  82 ff ff      brl $8289
$0e:828a  00 00         brk #$00
$0e:828c  00 00         brk #$00
$0e:828e  00 00         brk #$00
$0e:8290  98            tya
$0e:8291  85 00         sta $00
$0e:8293  00 00         brk #$00
$0e:8295  00 00         brk #$00
$0e:8297  00 ad         brk #$ad
$0e:8299  85 ff         sta $ff
$0e:829b  ff 07 00 00   sbc $000007,x
$0e:829f  00 00         brk #$00
$0e:82a1  00 16         brk #$16
$0e:82a3  86 07         stx $07
$0e:82a5  00 00         brk #$00
$0e:82a7  00 00         brk #$00
$0e:82a9  00 47         brk #$47
$0e:82ab  86 07         stx $07
$0e:82ad  00 00         brk #$00
$0e:82af  00 00         brk #$00
$0e:82b1  00 78         brk #$78
$0e:82b3  86 07         stx $07
$0e:82b5  00 00         brk #$00
$0e:82b7  00 00         brk #$00
$0e:82b9  00 a9         brk #$a9
$0e:82bb  86 ff         stx $ff
$0e:82bd  ff 00 00 00   sbc $000000,x
$0e:82c1  00 00         brk #$00
$0e:82c3  00 dc         brk #$dc
$0e:82c5  82 ff ff      brl $82c7
$0e:82c8  00 00         brk #$00
$0e:82ca  00 00         brk #$00
$0e:82cc  00 00         brk #$00
$0e:82ce  dc 82 ff      jml [$ff82]
$0e:82d1  ff 07 00 00   sbc $000007,x
$0e:82d5  00 00         brk #$00
$0e:82d7  00 da         brk #$da
$0e:82d9  86 ff         stx $ff
$0e:82db  ff 00 00 10   sbc $100000,x
$0e:82df  00 10         brk #$10
$0e:82e1  00 00         brk #$00
$0e:82e3  00 10         brk #$10
$0e:82e5  00 10         brk #$10
$0e:82e7  00 01         brk #$01
$0e:82e9  00 01         brk #$01
$0e:82eb  00 00         brk #$00
$0e:82ed  00 00         brk #$00
$0e:82ef  0e 08 00      asl $0008
$0e:82f2  00 10         brk #$10
$0e:82f4  00 10         brk #$10
$0e:82f6  00 00         brk #$00
$0e:82f8  00 10         brk #$10
$0e:82fa  00 10         brk #$10
$0e:82fc  00 01         brk #$01
$0e:82fe  00 01         brk #$01
$0e:8300  00 00         brk #$00
$0e:8302  00 00         brk #$00
$0e:8304  c0 08         cpy #$08
$0e:8306  00 00         brk #$00
$0e:8308  10 00         bpl $830a
$0e:830a  10 00         bpl $830c
$0e:830c  00 00         brk #$00
$0e:830e  10 00         bpl $8310
$0e:8310  10 00         bpl $8312
$0e:8312  01 00         ora ($00,x)
$0e:8314  01 00         ora ($00,x)
$0e:8316  00 00         brk #$00
$0e:8318  00 c2         brk #$c2
$0e:831a  08            php
$0e:831b  08            php
$0e:831c  00 18         brk #$18
$0e:831e  00 18         brk #$18
$0e:8320  00 08         brk #$08
$0e:8322  00 10         brk #$10
$0e:8324  00 10         brk #$10
$0e:8326  00 04         brk #$04
$0e:8328  00 01         brk #$01
$0e:832a  00 10         brk #$10
$0e:832c  10 00         bpl $832e
$0e:832e  c4 08         cpy $08
$0e:8330  01 00         ora ($00,x)
$0e:8332  10 00         bpl $8334
$0e:8334  10 c4         bpl $82fa
$0e:8336  88            dey
$0e:8337  01 10         ora ($10,x)
$0e:8339  00 00         brk #$00
$0e:833b  10 c4         bpl $8301
$0e:833d  c8            iny
$0e:833e  01 10         ora ($10,x)
$0e:8340  00 10         brk #$10
$0e:8342  00 c4         brk #$c4
$0e:8344  48            pha
$0e:8345  08            php
$0e:8346  00 18         brk #$18
$0e:8348  00 18         brk #$18
$0e:834a  00 08         brk #$08
$0e:834c  00 10         brk #$10
$0e:834e  00 10         brk #$10
$0e:8350  00 04         brk #$04
$0e:8352  00 01         brk #$01
$0e:8354  00 10         brk #$10
$0e:8356  10 00         bpl $8358
$0e:8358  c6 08         dec $08
$0e:835a  01 00         ora ($00,x)
$0e:835c  10 00         bpl $835e
$0e:835e  10 c6         bpl $8326
$0e:8360  88            dey
$0e:8361  01 10         ora ($10,x)
$0e:8363  00 00         brk #$00
$0e:8365  10 c6         bpl $832d
$0e:8367  c8            iny
$0e:8368  01 10         ora ($10,x)
$0e:836a  00 10         brk #$10
$0e:836c  00 c6         brk #$c6
$0e:836e  48            pha
$0e:836f  00 00         brk #$00
$0e:8371  10 00         bpl $8373
$0e:8373  10 00         bpl $8375
$0e:8375  00 00         brk #$00
$0e:8377  10 00         bpl $8379
$0e:8379  10 00         bpl $837b
$0e:837b  01 00         ora ($00,x)
$0e:837d  01 00         ora ($00,x)
$0e:837f  00 00         brk #$00
$0e:8381  00 e6         brk #$e6
$0e:8383  08            php
$0e:8384  00 00         brk #$00
$0e:8386  10 00         bpl $8388
$0e:8388  10 00         bpl $838a
$0e:838a  00 00         brk #$00
$0e:838c  10 00         bpl $838e
$0e:838e  10 00         bpl $8390
$0e:8390  01 00         ora ($00,x)
$0e:8392  01 00         ora ($00,x)
$0e:8394  00 00         brk #$00
$0e:8396  00 e8         brk #$e8
$0e:8398  08            php
$0e:8399  00 00         brk #$00
$0e:839b  10 00         bpl $839d
$0e:839d  10 00         bpl $839f
$0e:839f  00 00         brk #$00
$0e:83a1  10 00         bpl $83a3
$0e:83a3  10 00         bpl $83a5
$0e:83a5  01 00         ora ($00,x)
$0e:83a7  01 00         ora ($00,x)
$0e:83a9  00 00         brk #$00
$0e:83ab  00 ea         brk #$ea
$0e:83ad  08            php
$0e:83ae  00 00         brk #$00
$0e:83b0  10 00         bpl $83b2
$0e:83b2  10 00         bpl $83b4
$0e:83b4  00 00         brk #$00
$0e:83b6  10 00         bpl $83b8
$0e:83b8  10 00         bpl $83ba
$0e:83ba  01 00         ora ($00,x)
$0e:83bc  01 00         ora ($00,x)
$0e:83be  00 00         brk #$00
$0e:83c0  00 ec         brk #$ec
$0e:83c2  08            php
$0e:83c3  00 00         brk #$00
$0e:83c5  10 00         bpl $83c7
$0e:83c7  10 00         bpl $83c9
$0e:83c9  00 00         brk #$00
$0e:83cb  10 00         bpl $83cd
$0e:83cd  10 00         bpl $83cf
$0e:83cf  01 00         ora ($00,x)
$0e:83d1  01 00         ora ($00,x)
$0e:83d3  00 00         brk #$00
$0e:83d5  00 ee         brk #$ee
$0e:83d7  08            php
$0e:83d8  00 00         brk #$00
$0e:83da  10 00         bpl $83dc
$0e:83dc  10 00         bpl $83de
$0e:83de  00 00         brk #$00
$0e:83e0  10 00         bpl $83e2
$0e:83e2  10 00         bpl $83e4
$0e:83e4  01 00         ora ($00,x)
$0e:83e6  01 00         ora ($00,x)
$0e:83e8  00 00         brk #$00
$0e:83ea  00 a8         brk #$a8
$0e:83ec  0c 00 00      tsb $0000
$0e:83ef  10 00         bpl $83f1
$0e:83f1  10 00         bpl $83f3
$0e:83f3  00 00         brk #$00
$0e:83f5  10 00         bpl $83f7
$0e:83f7  10 00         bpl $83f9
$0e:83f9  01 00         ora ($00,x)
$0e:83fb  01 00         ora ($00,x)
$0e:83fd  00 00         brk #$00
$0e:83ff  00 aa         brk #$aa
$0e:8401  0c 08 00      tsb $0008
$0e:8404  18            clc
$0e:8405  00 18         brk #$18
$0e:8407  00 08         brk #$08
$0e:8409  00 10         brk #$10
$0e:840b  00 10         brk #$10
$0e:840d  00 04         brk #$04
$0e:840f  00 01         brk #$01
$0e:8411  00 10         brk #$10
$0e:8413  10 00         bpl $8415
$0e:8415  ac 0c 01      ldy $010c
$0e:8418  00 10         brk #$10
$0e:841a  00 10         brk #$10
$0e:841c  ac 8c 01      ldy $018c
$0e:841f  10 00         bpl $8421
$0e:8421  00 10         brk #$10
$0e:8423  ac cc 01      ldy $01cc
$0e:8426  10 00         bpl $8428
$0e:8428  10 00         bpl $842a
$0e:842a  ac 4c 10      ldy $104c
$0e:842d  00 20         brk #$20
$0e:842f  00 20         brk #$20
$0e:8431  00 10         brk #$10
$0e:8433  00 10         brk #$10
$0e:8435  00 10         brk #$10
$0e:8437  00 0c         brk #$0c
$0e:8439  00 01         brk #$01
$0e:843b  0a            asl a
$0e:843c  16 16         asl $16,x
$0e:843e  0a            asl a
$0e:843f  ae 0c 01      ldx $010c
$0e:8442  0a            asl a
$0e:8443  16 0a         asl $0a,x
$0e:8445  16 ae         asl $ae,x
$0e:8447  8c 01 16      sty $1601
$0e:844a  0a            asl a
$0e:844b  0a            asl a
$0e:844c  16 ae         asl $ae,x
$0e:844e  cc 01 16      cpy $1601
$0e:8451  0a            asl a
$0e:8452  16 0a         asl $0a,x
$0e:8454  ae 4c 01      ldx $014c
$0e:8457  02 1e         cop #$1e
$0e:8459  02 1e         cop #$1e
$0e:845b  aa            tax
$0e:845c  8c 01 02      sty $0201
$0e:845f  1e 1e 02      asl $021e,x
$0e:8462  aa            tax
$0e:8463  0c 01 1e      tsb $1e01
$0e:8466  02 1e         cop #$1e
$0e:8468  02 aa         cop #$aa
$0e:846a  4c 01 1e      jmp $1e01
$0e:846d  02 02         cop #$02
$0e:846f  1e aa cc      asl $ccaa,x
$0e:8472  01 10         ora ($10,x)
$0e:8474  10 00         bpl $8476
$0e:8476  20 a8 0c      jsr $0ca8
$0e:8479  01 00         ora ($00,x)
$0e:847b  20 10 10      jsr $1010
$0e:847e  a8            tay
$0e:847f  0c 01 10      tsb $1001
$0e:8482  10 20         bpl $84a4
$0e:8484  00 a8         brk #$a8
$0e:8486  0c 01 20      tsb $2001
$0e:8489  00 10         brk #$10
$0e:848b  10 a8         bpl $8435
$0e:848d  0c 16 00      tsb $0016
$0e:8490  26 00         rol $00
$0e:8492  26 00         rol $00
$0e:8494  16 00         asl $00,x
$0e:8496  10 00         bpl $8498
$0e:8498  10 00         bpl $849a
$0e:849a  0c 00 01      tsb $0100
$0e:849d  0e 1e 1e      asl $1e1e
$0e:84a0  0e ae 0c      asl $0cae
$0e:84a3  01 0e         ora ($0e,x)
$0e:84a5  1e 0e 1e      asl $1e0e,x
$0e:84a8  ae 8c 01      ldx $018c
$0e:84ab  1e 0e 0e      asl $0e0e,x
$0e:84ae  1e ae cc      asl $ccae,x
$0e:84b1  01 1e         ora ($1e,x)
$0e:84b3  0e 1e 0e      asl $0e1e
$0e:84b6  ae 4c 01      ldx $014c
$0e:84b9  06 26         asl $26
$0e:84bb  06 26         asl $26
$0e:84bd  aa            tax
$0e:84be  8c 01 26      sty $2601
$0e:84c1  06 06         asl $06
$0e:84c3  26 aa         rol $aa
$0e:84c5  cc 01 26      cpy $2601
$0e:84c8  06 26         asl $26
$0e:84ca  06 aa         asl $aa
$0e:84cc  4c 01 06      jmp $0601
$0e:84cf  26 26         rol $26
$0e:84d1  06 aa         asl $aa
$0e:84d3  0c 01 16      tsb $1601
$0e:84d6  16 00         asl $00,x
$0e:84d8  2c a8 0c      bit $0ca8
$0e:84db  01 2c         ora ($2c,x)
$0e:84dd  00 16         brk #$16
$0e:84df  16 a8         asl $a8,x
$0e:84e1  0c 01 16      tsb $1601
$0e:84e4  16 2c         asl $2c,x
$0e:84e6  00 a8         brk #$a8
$0e:84e8  0c 01 00      tsb $0001
$0e:84eb  2c 16 16      bit $1616
$0e:84ee  a8            tay
$0e:84ef  0c 07 00      tsb $0007
$0e:84f2  17 00         ora [$00],y
$0e:84f4  17 00         ora [$00],y
$0e:84f6  07 00         ora [$00]
$0e:84f8  10 00         bpl $84fa
$0e:84fa  10 00         bpl $84fc
$0e:84fc  04 00         tsb $00
$0e:84fe  01 00         ora ($00,x)
$0e:8500  0e 0e 00      asl $000e
$0e:8503  ae 0c 01      ldx $010c
$0e:8506  00 0e         brk #$0e
$0e:8508  00 0e         brk #$0e
$0e:850a  ae 8c 01      ldx $018c
$0e:850d  0e 00 00      asl $0000
$0e:8510  0e ae cc      asl $ccae
$0e:8513  01 0e         ora ($0e,x)
$0e:8515  00 0e         brk #$0e
$0e:8517  00 ae         brk #$ae
$0e:8519  4c 08 00      jmp $0008
$0e:851c  18            clc
$0e:851d  00 18         brk #$18
$0e:851f  00 08         brk #$08
$0e:8521  00 10         brk #$10
$0e:8523  00 10         brk #$10
$0e:8525  00 04         brk #$04
$0e:8527  00 01         brk #$01
$0e:8529  00 10         brk #$10
$0e:852b  10 00         bpl $852d
$0e:852d  ae 0c 01      ldx $010c
$0e:8530  00 10         brk #$10
$0e:8532  00 10         brk #$10
$0e:8534  ae 8c 01      ldx $018c
$0e:8537  10 00         bpl $8539
$0e:8539  00 10         brk #$10
$0e:853b  ae cc 01      ldx $01cc
$0e:853e  10 00         bpl $8540
$0e:8540  10 00         bpl $8542
$0e:8542  ae 4c 00      ldx $004c
$0e:8545  00 10         brk #$10
$0e:8547  00 10         brk #$10
$0e:8549  00 00         brk #$00
$0e:854b  00 10         brk #$10
$0e:854d  00 10         brk #$10
$0e:854f  00 02         brk #$02
$0e:8551  00 01         brk #$01
$0e:8553  00 00         brk #$00
$0e:8555  00 00         brk #$00
$0e:8557  0a            asl a
$0e:8558  08            php
$0e:8559  00 04         brk #$04
$0e:855b  04 04         tsb $04
$0e:855d  04 b6         tsb $b6
$0e:855f  08            php
$0e:8560  00 00         brk #$00
$0e:8562  10 00         bpl $8564
$0e:8564  10 00         bpl $8566
$0e:8566  00 00         brk #$00
$0e:8568  10 00         bpl $856a
$0e:856a  10 00         bpl $856c
$0e:856c  02 00         cop #$00
$0e:856e  01 00         ora ($00,x)
$0e:8570  00 00         brk #$00
$0e:8572  00 0c         brk #$0c
$0e:8574  08            php
$0e:8575  01 00         ora ($00,x)
$0e:8577  00 00         brk #$00
$0e:8579  00 ca         brk #$ca
$0e:857b  08            php
$0e:857c  00 00         brk #$00
$0e:857e  10 00         bpl $8580
$0e:8580  10 00         bpl $8582
$0e:8582  00 00         brk #$00
$0e:8584  10 00         bpl $8586
$0e:8586  10 00         bpl $8588
$0e:8588  02 00         cop #$00
$0e:858a  01 00         ora ($00,x)
$0e:858c  00 00         brk #$00
$0e:858e  00 0c         brk #$0c
$0e:8590  08            php
$0e:8591  01 00         ora ($00,x)
$0e:8593  00 00         brk #$00
$0e:8595  00 cc         brk #$cc
$0e:8597  08            php
$0e:8598  00 00         brk #$00
$0e:859a  10 00         bpl $859c
$0e:859c  10 00         bpl $859e
$0e:859e  00 00         brk #$00
$0e:85a0  10 00         bpl $85a2
$0e:85a2  10 00         bpl $85a4
$0e:85a4  01 00         ora ($00,x)
$0e:85a6  01 00         ora ($00,x)
$0e:85a8  00 00         brk #$00
$0e:85aa  00 06         brk #$06
$0e:85ac  08            php
$0e:85ad  08            php
$0e:85ae  00 17         brk #$17
$0e:85b0  00 28         brk #$28
$0e:85b2  00 00         brk #$00
$0e:85b4  00 10         brk #$10
$0e:85b6  00 10         brk #$10
$0e:85b8  00 0a         brk #$0a
$0e:85ba  00 01         brk #$01
$0e:85bc  08            php
$0e:85bd  07 00         ora [$00]
$0e:85bf  18            clc
$0e:85c0  e0 08         cpx #$08
$0e:85c2  00 08         brk #$08
$0e:85c4  0f 10 10 e3   ora $e31010
$0e:85c8  08            php
$0e:85c9  00 0f         brk #$0f
$0e:85cb  08            php
$0e:85cc  10 10         bpl $85de
$0e:85ce  e3 48         sbc $48,s
$0e:85d0  00 00         brk #$00
$0e:85d2  17 07         ora [$07],y
$0e:85d4  19 f2 08      ora $08f2,y
$0e:85d7  00 17         brk #$17
$0e:85d9  00 07         brk #$07
$0e:85db  19 f2 48      ora $48f2,y
$0e:85de  00 00         brk #$00
$0e:85e0  17 10         ora [$10],y
$0e:85e2  10 e2         bpl $85c6
$0e:85e4  08            php
$0e:85e5  00 17         brk #$17
$0e:85e7  00 10         brk #$10
$0e:85e9  10 e2         bpl $85cd
$0e:85eb  48            pha
$0e:85ec  00 08         brk #$08
$0e:85ee  0f 18 08 f3   ora $f30818
$0e:85f2  08            php
$0e:85f3  00 0f         brk #$0f
$0e:85f5  08            php
$0e:85f6  18            clc
$0e:85f7  08            php
$0e:85f8  f3 48         sbc ($48,s),y
$0e:85fa  01 08         ora ($08,x)
$0e:85fc  07 18         ora [$18]
$0e:85fe  00 06         brk #$06
$0e:8600  08            php
$0e:8601  00 00         brk #$00
$0e:8603  10 00         bpl $8605
$0e:8605  10 00         bpl $8607
$0e:8607  00 00         brk #$00
$0e:8609  10 00         bpl $860b
$0e:860b  10 00         bpl $860d
$0e:860d  01 00         ora ($00,x)
$0e:860f  01 00         ora ($00,x)
$0e:8611  00 00         brk #$00
$0e:8613  00 08         brk #$08
$0e:8615  08            php
$0e:8616  00 00         brk #$00
$0e:8618  10 00         bpl $861a
$0e:861a  18            clc
$0e:861b  00 00         brk #$00
$0e:861d  00 10         brk #$10
$0e:861f  00 10         brk #$10
$0e:8621  00 05         brk #$05
$0e:8623  00 00         brk #$00
$0e:8625  04 04         tsb $04
$0e:8627  00 10         brk #$10
$0e:8629  a0 0c         ldy #$0c
$0e:862b  00 00         brk #$00
$0e:862d  08            php
$0e:862e  08            php
$0e:862f  08            php
$0e:8630  a1 0c         lda ($0c,x)
$0e:8632  00 08         brk #$08
$0e:8634  00 08         brk #$08
$0e:8636  08            php
$0e:8637  a2 0c         ldx #$0c
$0e:8639  00 00         brk #$00
$0e:863b  08            php
$0e:863c  10 00         bpl $863e
$0e:863e  a6 0c         ldx $0c
$0e:8640  00 07         brk #$07
$0e:8642  01 10         ora ($10,x)
$0e:8644  00 a6         brk #$a6
$0e:8646  4c 00 00      jmp $0000
$0e:8649  10 00         bpl $864b
$0e:864b  19 00 ff      ora $ff00,y
$0e:864e  ff 10 00 10   sbc $100010,x
$0e:8652  00 05         brk #$05
$0e:8654  00 00         brk #$00
$0e:8656  04 04         tsb $04
$0e:8658  00 10         brk #$10
$0e:865a  a3 0c         lda $0c,s
$0e:865c  00 00         brk #$00
$0e:865e  08            php
$0e:865f  08            php
$0e:8660  08            php
$0e:8661  a4 0c         ldy $0c
$0e:8663  00 08         brk #$08
$0e:8665  00 08         brk #$08
$0e:8667  08            php
$0e:8668  a5 0c         lda $0c
$0e:866a  00 00         brk #$00
$0e:866c  08            php
$0e:866d  10 00         bpl $866f
$0e:866f  a6 0c         ldx $0c
$0e:8671  00 07         brk #$07
$0e:8673  01 10         ora ($10,x)
$0e:8675  00 a6         brk #$a6
$0e:8677  4c 00 00      jmp $0000
$0e:867a  10 00         bpl $867c
$0e:867c  18            clc
$0e:867d  00 00         brk #$00
$0e:867f  00 10         brk #$10
$0e:8681  00 10         brk #$10
$0e:8683  00 05         brk #$05
$0e:8685  00 00         brk #$00
$0e:8687  04 04         tsb $04
$0e:8689  00 10         brk #$10
$0e:868b  b0 0c         bcs $8699
$0e:868d  00 00         brk #$00
$0e:868f  08            php
$0e:8690  08            php
$0e:8691  08            php
$0e:8692  b1 0c         lda ($0c),y
$0e:8694  00 08         brk #$08
$0e:8696  00 08         brk #$08
$0e:8698  08            php
$0e:8699  b2 0c         lda ($0c)
$0e:869b  00 00         brk #$00
$0e:869d  08            php
$0e:869e  10 00         bpl $86a0
$0e:86a0  a6 0c         ldx $0c
$0e:86a2  00 07         brk #$07
$0e:86a4  01 10         ora ($10,x)
$0e:86a6  00 a6         brk #$a6
$0e:86a8  4c 00 00      jmp $0000
$0e:86ab  10 00         bpl $86ad
$0e:86ad  17 00         ora [$00],y
$0e:86af  01 00         ora ($00,x)
$0e:86b1  10 00         bpl $86b3
$0e:86b3  10 00         bpl $86b5
$0e:86b5  05 00         ora $00
$0e:86b7  00 04         brk #$04
$0e:86b9  04 00         tsb $00
$0e:86bb  10 b3         bpl $8670
$0e:86bd  0c 00 00      tsb $0000
$0e:86c0  08            php
$0e:86c1  08            php
$0e:86c2  08            php
$0e:86c3  b4 0c         ldy $0c,x
$0e:86c5  00 08         brk #$08
$0e:86c7  00 08         brk #$08
$0e:86c9  08            php
$0e:86ca  b5 0c         lda $0c,x
$0e:86cc  00 00         brk #$00
$0e:86ce  08            php
$0e:86cf  10 00         bpl $86d1
$0e:86d1  a6 0c         ldx $0c
$0e:86d3  00 07         brk #$07
$0e:86d5  01 10         ora ($10,x)
$0e:86d7  00 a6         brk #$a6
$0e:86d9  4c 00 00      jmp $0000
$0e:86dc  10 00         bpl $86de
$0e:86de  10 00         bpl $86e0
$0e:86e0  00 00         brk #$00
$0e:86e2  10 00         bpl $86e4
$0e:86e4  10 00         bpl $86e6
$0e:86e6  01 00         ora ($00,x)
$0e:86e8  01 00         ora ($00,x)
$0e:86ea  00 00         brk #$00
$0e:86ec  00 e4         brk #$e4
$0e:86ee  08            php
$0e:86ef  00 20         brk #$20
$0e:86f1  80 3b         bra $872e
$0e:86f3  fd fd 92      sbc $92fd,x
$0e:86f6  29 e6 57      and #$57e6
$0e:86f9  71 4a         adc ($4a),y
$0e:86fb  b8            clv
$0e:86fc  dd 24 74      cmp $7424,x
$0e:86ff  cf 1e 4b 9f   cmp $9f4b1e
$0e:8703  22 de de 2e   jsl $2edede
$0e:8707  fc 0f fd      jsr ($fd0f,x)
$0e:870a  03 fd         ora $fd,s
$0e:870c  80 fe         bra $870c
$0e:870e  70 3f         bvs $874f
$0e:8710  18            clc
$0e:8711  0f 84 03 c1   ora $c10384
$0e:8715  00 e0         brk #$e0
$0e:8717  40            rti
$0e:8718  30 10         bmi $872a
$0e:871a  48            pha
$0e:871b  36 a7         rol $a7,x
$0e:871d  59 52 bc      eor $bc52,y
$0e:8720  d9 26 61      cmp $6126,y
$0e:8723  73 ce         adc ($ce,s),y
$0e:8725  d6 26         dec $26,x
$0e:8727  ff 8f fd 40   sbc $40fd8f,x
$0e:872b  45 77         eor $77
$0e:872d  af e6 57 f1   lda $f157e6
$0e:8731  6a            ror a
$0e:8732  a8            tay
$0e:8733  85 4b         sta $4b
$0e:8735  35 df         and $df,x
$0e:8737  9f 6f 6c d6   sta $d66c6f,x
$0e:873b  f8            sed
$0e:873c  07 fe         ora [$fe]
$0e:873e  00 22         brk #$22
$0e:8740  98            tya
$0e:8741  86 03         stx $03
$0e:8743  4d 4f b5      eor $b54f
$0e:8746  fd e6 bf      sbc $bfe6,x
$0e:8749  bd 5d f2      lda $f25d,x
$0e:874c  35 bd         and $bd,x
$0e:874e  d2 f6         cmp ($f6)
$0e:8750  fb            xce
$0e:8751  7e 6f 7f      ror $7f6f,x
$0e:8754  d0 c0         bne $8716
$0e:8756  07 f9         ora [$f9]
$0e:8758  80 ff         bra $8759
$0e:875a  e0 7e         cpx #$7e
$0e:875c  5f 97 5b df   eor $df5b97,x
$0e:8760  aa            tax
$0e:8761  ef d7 37 dd   sbc $dd37d7
$0e:8765  a9 e9 e4      lda #$e4e9
$0e:8768  6c f2 df      jmp ($dff2)
$0e:876b  b9 fe f0      lda $f0fe,y
$0e:876e  1f fe 07 f3   ora $f307fe,x
$0e:8772  f9 f9 fc      sbc $fcf9,y
$0e:8775  7c fe 37      jmp ($37fe,x)
$0e:8778  6b            rtl
$0e:8779  15 b3         ora $b3,x
$0e:877b  89 5a 85      bit #$855a
$0e:877e  6c 22 16      jmp ($1622)
$0e:8781  89 04 0a      bit #$0a04
$0e:8784  03 04         ora $04,s
$0e:8786  81 c2         sta ($c2,x)
$0e:8788  20 f9 18      jsr $18f9
$0e:878b  7c 8e 3f      jmp ($3f8e,x)
$0e:878e  c5 9f         cmp $9f
$0e:8790  e3 ef         sbc $ef,s
$0e:8792  f1 ff         sbc ($ff),y
$0e:8794  fd 9f df      sbc $df9f,x
$0e:8797  b3 bb         lda ($bb,s),y
$0e:8799  f5 77         sbc $77,x
$0e:879b  b6 5a         ldx $5a,y
$0e:879d  bd ce 57      lda $57ce,x
$0e:87a0  58            cli
$0e:87a1  aa            tax
$0e:87a2  4b            phk
$0e:87a3  65 59         adc $59
$0e:87a5  68            pla
$0e:87a6  ac 42 01      ldy $0142
$0e:87a9  08            php
$0e:87aa  c0 40         cpy #$40
$0e:87ac  b8            clv
$0e:87ad  18            clc
$0e:87ae  8f 07 13 e1   sta $e11307
$0e:87b2  a3 fc         lda $fc,s
$0e:87b4  74 7f         stz $7f,x
$0e:87b6  9e 8f f6      stz $f68f,x
$0e:87b9  13 ff         ora ($ff,s),y
$0e:87bb  6b            rtl
$0e:87bc  80 ca         bra $8788
$0e:87be  24 b0         bit $b0
$0e:87c0  b8            clv
$0e:87c1  4c 16 0b      jmp $0b16
$0e:87c4  02 5f         cop #$5f
$0e:87c6  84 06         sty $06
$0e:87c8  00 fc         brk #$fc
$0e:87ca  03 08         ora $08,s
$0e:87cc  40            rti
$0e:87cd  23 d0         and $d0,s
$0e:87cf  08            php
$0e:87d0  34 02         bit $02,x
$0e:87d2  04 fd         tsb $fd
$0e:87d4  20 50 e6      jsr $e650
$0e:87d7  2e f4 c9      rol $c9f4
$0e:87da  dc ab 2f      jml [$2fab]
$0e:87dd  9a            txs
$0e:87de  e6 e3         inc $e3
$0e:87e0  34 fa         bit $fa,x
$0e:87e2  7f 9f 4b f1   adc $f14b9f,x
$0e:87e6  69 be 02      adc #$02be
$0e:87e9  87 00         sta [$00]
$0e:87eb  4b            phk
$0e:87ec  1f 05 00 90   ora $900005,x
$0e:87f0  1f 88 0f f3   ora $f30f88,x
$0e:87f4  01 fe         ora ($fe,x)
$0e:87f6  30 06         bmi $87fe
$0e:87f8  0e fd 7f      asl $7ffd
$0e:87fb  e0 78         cpx #$78
$0e:87fd  6b            rtl
$0e:87fe  ff fa 85 e7   sbc $e785fa,x
$0e:8802  ad 37 ce      lda $ce37
$0e:8805  70 a5         bvs $87ac
$0e:8807  a0 a3         ldy #$a3
$0e:8809  1f ad 02 00   ora $0002ad,x
$0e:880d  df 0e d7 ee   cmp $eed70e,x
$0e:8811  ff 00 d3 7f   sbc $7fd300,x
$0e:8815  e3 b5         sbc $b5,s
$0e:8817  d9 3d a3      cmp $a33d,y
$0e:881a  03 4e         ora $4e,s
$0e:881c  8b            phb
$0e:881d  53 f4         eor ($f4,s),y
$0e:881f  3e d8 20      rol $20d8,x
$0e:8822  84 5f         sty $5f
$0e:8824  e1 a2         sbc ($a2,x)
$0e:8826  80 64         bra $888c
$0e:8828  20 1b 03      jsr $031b
$0e:882b  40            rti
$0e:882c  c4 95         cpy $95
$0e:882e  41 00         eor ($00,x)
$0e:8830  81 8b         sta ($8b,x)
$0e:8832  87 13         sta [$13]
$0e:8834  7f 17 85 b4   adc $b48517,x
$0e:8838  5c 3c 49 d8   jml $d8493c
$0e:883c  fe 81 44      inc $4481,x
$0e:883f  6f 0e 94 b4   adc $b4940e
$0e:8843  de 07 92      dec $9207,x
$0e:8846  d7 9d         cmp [$9d],y
$0e:8848  86 83         stx $83
$0e:884a  be 3f f6      ldx $f63f,y
$0e:884d  5e ff f8      lsr $f8ff,x
$0e:8850  83 56         sta $56,s
$0e:8852  ff 5d 4e 97   sbc $974e5d,x
$0e:8856  3e 65 54      rol $5465,x
$0e:8859  ec ed f2      cpx $f2ed
$0e:885c  57 d9         eor [$d9],y
$0e:885e  9b            txy
$0e:885f  fc 1f 81      jsr ($811f,x)
$0e:8862  05 80         ora $80
$0e:8864  0f 82 1b 00   ora $001b82
$0e:8868  97 9e         sta [$9e],y
$0e:886a  02 01         cop #$01
$0e:886c  cc 00 04      cpy $0400
$0e:886f  07 a5         ora [$a5]
$0e:8871  2f fc 41 6f   and $6f41fc
$0e:8875  5f ff 04 57   eor $5704ff,x
$0e:8879  55 75         eor $75,x
$0e:887b  8d 75 f0      sta $f075
$0e:887e  1f 70 51 01   ora $015170,x
$0e:8882  c1 fe         cmp ($fe,x)
$0e:8884  10 a7         bpl $882d
$0e:8886  30 ca         bmi $8852
$0e:8888  20 10 88      jsr $8810
$0e:888b  05 9b         ora $9b
$0e:888d  df b0 bb f4   cmp $f4bbb0,x
$0e:8891  b7 f6         lda [$f6],y
$0e:8893  2a            rol a
$0e:8894  ad e2 4f      lda $4fe2
$0e:8897  56 a9         lsr $a9,x
$0e:8899  c0 a3         cpy #$a3
$0e:889b  1a            inc a
$0e:889c  99 e1 34      sta $34e1,y
$0e:889f  21 02         and ($02,x)
$0e:88a1  21 c4         and ($c4,x)
$0e:88a3  78            sei
$0e:88a4  38            sec
$0e:88a5  1f 0d 07 e3   ora $e3070d,x
$0e:88a9  c3 fc         cmp $fc,s
$0e:88ab  e0 7f         cpx #$7f
$0e:88ad  ac 1e fd      ldy $fd1e
$0e:88b0  e5 ed         sbc $ed
$0e:88b2  e6 16         inc $16
$0e:88b4  6a            ror a
$0e:88b5  ad c2 57      lda $57c2
$0e:88b8  59 aa cb      eor $cbaa,y
$0e:88bb  65 59         adc $59
$0e:88bd  68            pla
$0e:88be  a9 34 0c      lda #$0c34
$0e:88c1  02 04         cop #$04
$0e:88c3  1e 27 c3      asl $c327,x
$0e:88c6  45 f8         eor $f8
$0e:88c8  e8            inx
$0e:88c9  ff 3d 1f ec   sbc $ec1f3d,x
$0e:88cd  c5 de         cmp $de
$0e:88cf  99 3b 95      sta $953b,y
$0e:88d2  65 e3         adc $e3
$0e:88d4  54 da 64      mvn $64,$da
$0e:88d7  9e 8f 53      stz $538f,x
$0e:88da  91 4a         sta ($4a),y
$0e:88dc  32 31         and ($31)
$0e:88de  45 50         eor $50
$0e:88e0  80 87         bra $8869
$0e:88e2  01 e0         ora ($e0,x)
$0e:88e4  03 90         ora $90,s
$0e:88e6  ac b0 98      ldy $98b0
$0e:88e9  6b            rtl
$0e:88ea  4f b7 67 db   eor $db67b7
$0e:88ee  a9 f8 e5      lda #$e5f8
$0e:88f1  f4 7a 8e      pea $8e7a
$0e:88f4  37 47         and [$47],y
$0e:88f6  1d ac 4d      ora $4dac,x
$0e:88f9  ef 1f f8 87   sbc $87f81f
$0e:88fd  fa            plx
$0e:88fe  01 fc         ora ($fc,x)
$0e:8900  82 7e 30      brl $b981
$0e:8903  1f 08 17 80   ora $801708,x
$0e:8907  06 02         asl $02
$0e:8909  10 bb         bpl $88c6
$0e:890b  7b            tdc
$0e:890c  7b            tdc
$0e:890d  5e 7d 2f      lsr $2f7d,x
$0e:8910  6e 97 bc      ror $bc97
$0e:8913  dd 5f 6e      cmp $6e5f,x
$0e:8916  bf b9 5f de   lda $de5fb9,x
$0e:891a  ab            plb
$0e:891b  2f ff c0 ff   and $ffc0ff
$0e:891f  f0 14         beq $8935
$0e:8921  b8            clv
$0e:8922  20 e3 6f      jsr $6fe3
$0e:8925  ef a5 9c 86   sbc $869ca5
$0e:8929  b5 bd         lda $bd,x
$0e:892b  ee cf b5      inc $b5cf
$0e:892e  dd fa a7      cmp $a7fa,x
$0e:8931  bf d5 f4 41   lda $41f4d5,x
$0e:8935  d2 0c         cmp ($0c)
$0e:8937  a6 9e         ldx $9e
$0e:8939  4c d7 cb      jmp $cbd7
$0e:893c  19 b8 d3      ora $d3b8,y
$0e:893f  7f 3e 5f ff   adc $ff5f3e,x
$0e:8943  0f bf c9 ff   ora $ffc9bf
$0e:8947  ef 7f e3 77   sbc $77e37f
$0e:894b  f8            sed
$0e:894c  6c fe 8f      jmp ($8ffe)
$0e:894f  1f 81 c3 e0   ora $e0c381,x
$0e:8953  30 78         bmi $89cd
$0e:8955  84 0e         sty $0e
$0e:8957  01 01         ora ($01,x)
$0e:8959  72 84         adc ($84)
$0e:895b  12 0d         ora ($0d)
$0e:895d  a9 d6 d4      lda #$d4d6
$0e:8960  ef 76 39 9d   sbc $9d3976
$0e:8964  2f df 9d ee   and $ee9ddf
$0e:8968  cf 77 f6 7b   cmp $7bf677
$0e:896c  7f e3 ff 50   adc $50ffe3,x
$0e:8970  ff 60 3f 9c   sbc $9c3f60,x
$0e:8974  4f c1 9d 22   eor $229dc1
$0e:8978  18            clc
$0e:8979  0e 5c be      asl $be5c
$0e:897c  cb            wai
$0e:897d  97 b9         sta [$b9],y
$0e:897f  f2 eb         sbc ($eb)
$0e:8981  3a            dec a
$0e:8982  58            cli
$0e:8983  6f ca 3d f1   adc $f13dca
$0e:8987  8d f9 24      sta $24f9
$0e:898a  3d e8 85      and $85e8,x
$0e:898d  fe 11 3f      inc $3f11,x
$0e:8990  82 47 e0      brl $69da
$0e:8993  4c 61 80      jmp $8061
$0e:8996  32 8f         and ($8f)
$0e:8998  f5 fc         sbc $fc,x
$0e:899a  aa            tax
$0e:899b  fe 35 5d      inc $5d35,x
$0e:899e  1c a6 8f      trb $8fa6
$0e:89a1  59 43 a9      eor $a943,y
$0e:89a4  63 f4         adc $f4,s
$0e:89a6  45 c1         eor $c1
$0e:89a8  42 09         wdm #$09
$0e:89aa  88            dey
$0e:89ab  68            pla
$0e:89ac  06 61         asl $61
$0e:89ae  80 1a         bra $89ca
$0e:89b0  8f c9 5f f9   sta $f95fc9
$0e:89b4  56 6a         lsr $6a,x
$0e:89b6  7f 9f ad 7f   adc $7fad9f,x
$0e:89ba  c3 4b         cmp $4b,s
$0e:89bc  b8            clv
$0e:89bd  76 e6         ror $e6,x
$0e:89bf  f9 de 1c      sbc $1cde,y
$0e:89c2  b5 9a         lda $9a,x
$0e:89c4  24 01         bit $01
$0e:89c6  66 84         ror $84
$0e:89c8  50 80         bvc $894a
$0e:89ca  34 08         bit $08,x
$0e:89cc  04 42         tsb $42
$0e:89ce  01 21         ora ($21,x)
$0e:89d0  f7 e1         sbc [$e1],y
$0e:89d2  b9 db 4f      lda $4fdb,y
$0e:89d5  64 36         stz $36
$0e:89d7  99 97 e7      sta $e797,y
$0e:89da  4d 6d 90      eor $906d
$0e:89dd  5a            phy
$0e:89de  65 1e         adc $1e
$0e:89e0  78            sei
$0e:89e1  4d 09 8c      eor $8c09
$0e:89e4  02 27         cop #$27
$0e:89e6  00 d9         brk #$d9
$0e:89e8  98            tya
$0e:89e9  07 26         ora [$26]
$0e:89eb  64 1c         stz $1c
$0e:89ed  1c 03 2f      trb $2f03
$0e:89f0  7f 41 85 6f   adc $6f8541,x
$0e:89f4  fd d3 e9      sbc $e9d3,x
$0e:89f7  7b            tdc
$0e:89f8  e2 1c         sep #$1c
$0e:89fa  09 fe de      ora #$defe
$0e:89fd  ff 44 e2 11   sbc $11e244,x
$0e:8a01  04 88         tsb $88
$0e:8a03  32 c3         and ($c3)
$0e:8a05  fa            plx
$0e:8a06  40            rti
$0e:8a07  27 70         and [$70]
$0e:8a09  0a            asl a
$0e:8a0a  d5 ec         cmp $ec,x
$0e:8a0c  40            rti
$0e:8a0d  12 6f         ora ($6f)
$0e:8a0f  fd 77 bb      sbc $bb77,x
$0e:8a12  b7 a4         lda [$a4],y
$0e:8a14  40            rti
$0e:8a15  7f df 6f fd   adc $fd6fdf,x
$0e:8a19  96 cb         stx $cb,y
$0e:8a1b  84 3f         sty $3f
$0e:8a1d  9c 89 0c      stz $0c89
$0e:8a20  b9 a8 04      lda $04a8,y
$0e:8a23  ae 67 de      ldx $de67
$0e:8a26  89 77 62      bit #$6277
$0e:8a29  14 3c         trb $3c
$0e:8a2b  d6 7a         dec $7a,x
$0e:8a2d  25 f7         and $f7
$0e:8a2f  9d 76 62      sta $6276,x
$0e:8a32  55 9c         eor $9c,x
$0e:8a34  f7 32         sbc [$32],y
$0e:8a36  01 ed         ora ($ed,x)
$0e:8a38  80 7b         bra $8ab5
$0e:8a3a  d8            cld
$0e:8a3b  02 c1         cop #$c1
$0e:8a3d  0e 6b 00      asl $006b
$0e:8a40  7c 22 d0      jmp ($d022,x)
$0e:8a43  ee ea 3b      inc $3bea
$0e:8a46  b7 0a         lda [$0a],y
$0e:8a48  ad ea af      lda $afea
$0e:8a4b  00 ba         brk #$ba
$0e:8a4d  da            phx
$0e:8a4e  aa            tax
$0e:8a4f  bd ae bd      lda $bdae,x
$0e:8a52  02 ee         cop #$ee
$0e:8a54  a5 05         lda $05
$0e:8a56  28            plp
$0e:8a57  6a            ror a
$0e:8a58  a0 1a         ldy #$1a
$0e:8a5a  87 10         sta [$10]
$0e:8a5c  b8            clv
$0e:8a5d  c2 51         rep #$51
$0e:8a5f  00 c4         brk #$c4
$0e:8a61  35 c3         and $c3,x
$0e:8a63  e1 ea         sbc ($ea,x)
$0e:8a65  f1 65         sbc ($65),y
$0e:8a67  7e be ee      ror $eebe,x
$0e:8a6a  f7 6f         sbc [$6f],y
$0e:8a6c  d7 d6         cmp [$d6],y
$0e:8a6e  f3 7a         sbc ($7a,s),y
$0e:8a70  b9 dd 7d      lda $7ddd,y
$0e:8a73  2c 3e 01      bit $013e
$0e:8a76  1d 80 52      ora $5280,x
$0e:8a79  a0 16 18      ldy #$1816
$0e:8a7c  05 d2         ora $d2
$0e:8a7e  01 79         ora ($79,x)
$0e:8a80  80 5c         bra $8ade
$0e:8a82  60            rts
$0e:8a83  17 a7         ora [$a7],y
$0e:8a85  70 da         bvs $8a61
$0e:8a87  ac 55 5b      ldy $5b55
$0e:8a8a  ad 3a fd      lda $fd3a
$0e:8a8d  cb            wai
$0e:8a8e  f5 d3         sbc $d3,x
$0e:8a90  ad d6 ea      lda $ead6
$0e:8a93  55 3e         eor $3e,x
$0e:8a95  d6 ff         dec $ff,x
$0e:8a97  0c ec 03      tsb $03ec
$0e:8a9a  15 00         ora $00,x
$0e:8a9c  d0 c0         bne $8a5e
$0e:8a9e  26 90         rol $90
$0e:8aa0  0d 8c 03      ora $038c
$0e:8aa3  6b            rtl
$0e:8aa4  00 da         brk #$da
$0e:8aa6  40            rti
$0e:8aa7  3c 70 1c      bit $1c70,x
$0e:8aaa  f5 8e         sbc $8e,x
$0e:8aac  d9 17 8f      cmp $8f17,y
$0e:8aaf  42 e7         wdm #$e7
$0e:8ab1  51 3b         eor ($3b),y
$0e:8ab3  76 cf         ror $cf,x
$0e:8ab5  9d 73 f7      sta $f773,x
$0e:8ab8  6c ff d0      jmp ($d0ff)
$0e:8abb  0f e4 03 f1   ora $f103e4
$0e:8abf  00 fa         brk #$fa
$0e:8ac1  40            rti
$0e:8ac2  3c 90 03      bit $0390,x
$0e:8ac5  f0 27         beq $8aee
$0e:8ac7  c2 08         rep #$08
$0e:8ac9  2e 2b 15      rol $152b
$0e:8acc  be 2b 1a      ldx $1a2b,y
$0e:8acf  86 4c         stx $4c
$0e:8ad1  a3 97         lda $97,s
$0e:8ad3  ad e7 0a      lda $0ae7
$0e:8ad6  b5 dd         lda $dd,x
$0e:8ad8  cc 8f c3      cpy $c38f
$0e:8adb  fb            xce
$0e:8adc  00 fd         brk #$fd
$0e:8ade  40            rti
$0e:8adf  3e ec 21      rol $21ec,x
$0e:8ae2  e7 c0         sbc [$c0]
$0e:8ae4  35 b0         and $b0,x
$0e:8ae6  0b            phd
$0e:8ae7  71 00         adc ($00),y
$0e:8ae9  3f df 9f ff   and $ff9fdf,x
$0e:8aed  c7 f9         cmp [$f9]
$0e:8aef  4e aa d5      lsr $d5aa
$0e:8af2  7d 91 2a      adc $2a91,x
$0e:8af5  74 97         stz $97,x
$0e:8af7  57 7c         eor [$7c],y
$0e:8af9  93 c0         sta ($c0,s),y
$0e:8afb  60            rts
$0e:8afc  30 08         bmi $8b06
$0e:8afe  1c 0e 0f      trb $0f0e
$0e:8b01  a3 87         lda $87,s
$0e:8b03  c0 e3 fa      cpy #$fae3
$0e:8b06  19 fd 02      ora $02fd,y
$0e:8b09  ff c0 ff f9   sbc $f9ffc0,x
$0e:8b0d  ed f7 3b      sbc $3bf7
$0e:8b10  bc 57 bb      ldy $bb57,x
$0e:8b13  d5 fb         cmp $fb,x
$0e:8b15  85 c3         sta $c3
$0e:8b17  49 48 ad      eor #$ad48
$0e:8b1a  c5 2d         cmp $2d
$0e:8b1c  3f ec 86 03   and $0386ec,x
$0e:8b20  11 c0         ora ($c0),y
$0e:8b22  f1 78         sbc ($78),y
$0e:8b24  3d 1f 0f      and $0f1f,x
$0e:8b27  a7 e3         lda [$e3]
$0e:8b29  ef fc f3 ff   sbc $fff3fc
$0e:8b2d  a0 ff f8      ldy #$f8ff
$0e:8b30  1a            inc a
$0e:8b31  b0 3f         bcs $8b72
$0e:8b33  90 af         bcc $8ae4
$0e:8b35  ee 17 d5      inc $d517
$0e:8b38  8a            txa
$0e:8b39  aa            tax
$0e:8b3a  e5 75         sbc $75
$0e:8b3c  56 a8         lsr $a8,x
$0e:8b3e  a7 15         lda [$15]
$0e:8b40  d6 0b         dec $0b,x
$0e:8b42  f3 88         sbc ($88,s),y
$0e:8b44  40            rti
$0e:8b45  64 10         stz $10
$0e:8b47  3a            dec a
$0e:8b48  04 1f         tsb $1f
$0e:8b4a  00 ff         brk #$ff
$0e:8b4c  08            php
$0e:8b4d  fe 16 e7      inc $e716,x
$0e:8b50  17 e7         ora [$e7],y
$0e:8b52  d7 27         cmp [$27],y
$0e:8b54  93 1f         sta ($1f,s),y
$0e:8b56  85 9f         sta $9f
$0e:8b58  c1 4c         cmp ($4c,x)
$0e:8b5a  e1 d2         sbc ($d2,x)
$0e:8b5c  78            sei
$0e:8b5d  f9 3c 7c      sbc $7c3c,y
$0e:8b60  01 fe         ora ($fe,x)
$0e:8b62  13 f8         ora ($f8,s),y
$0e:8b64  1f fe 1f ff   ora $ff1ffe,x
$0e:8b68  8f ff e7 ee   sta $eee7ff
$0e:8b6c  81 bf         sta ($bf,x)
$0e:8b6e  ff fa 5e 08   sbc $085efa,x
$0e:8b72  c4 76         cpy $76
$0e:8b74  c5 03         cmp $03
$0e:8b76  20 84 1f      jsr $1f84
$0e:8b79  f1 f1         sbc ($f1),y
$0e:8b7b  ff 7f 3f ff   sbc $ff3f7f,x
$0e:8b7f  ef fc 3b e3   sbc $e33bfc
$0e:8b83  e2 fe         sep #$fe
$0e:8b85  3e c0 09      rol $09c0,x
$0e:8b88  16 7f         asl $7f,x
$0e:8b8a  7e ce ef      ror $efce,x
$0e:8b8d  55 9e         eor $9e,x
$0e:8b8f  e9 72         sbc #$72
$0e:8b91  f5 3a         sbc $3a,x
$0e:8b93  5e a2 49      lsr $49a2,x
$0e:8b96  e5 99         sbc $99
$0e:8b98  75 23         adc $23,x
$0e:8b9a  71 08         adc ($08),y
$0e:8b9c  04 23         tsb $23
$0e:8b9e  01 82         ora ($82,x)
$0e:8ba0  a0 52         ldy #$52
$0e:8ba2  34 1a         bit $1a,x
$0e:8ba4  4e 87 4f      lsr $4f87
$0e:8ba7  d1 c9         cmp ($c9),y
$0e:8ba9  fa            plx
$0e:8baa  78            sei
$0e:8bab  3f db 8a bc   and $bc8adb,x
$0e:8baf  9b            txy
$0e:8bb0  9b            txy
$0e:8bb1  e3 a4         sbc $a4,s
$0e:8bb3  e5 ef         sbc $ef
$0e:8bb5  b6 1e         ldx $1e,y
$0e:8bb7  5f 86 97 33   eor $339786,x
$0e:8bbb  ec fc 29      cpx $29fc
$0e:8bbe  6c 31 80      jmp ($8031)
$0e:8bc1  45 17         eor $17
$0e:8bc3  e2 43         sep #$43
$0e:8bc5  02 18         cop #$18
$0e:8bc7  41 09         eor ($09,x)
$0e:8bc9  43 b5         eor $b5,s
$0e:8bcb  be 4b 6d      ldx $6d4b,y
$0e:8bce  99 5e 64      sta $645e,y
$0e:8bd1  96 d9         stx $d9,y
$0e:8bd3  2f b7 61 69   and $6961b7
$0e:8bd7  91 5a         sta ($5a),y
$0e:8bd9  66 8b         ror $8b
$0e:8bdb  dd 83 80      cmp $8083,x
$0e:8bde  64 e0         stz $e0
$0e:8be0  13 33         ora ($33,s),y
$0e:8be2  00 e4         brk #$e4
$0e:8be4  60            rts
$0e:8be5  1b            tcs
$0e:8be6  33 40         and ($40,s),y
$0e:8be8  c4 60         cpy $60
$0e:8bea  15 49         ora $49,x
$0e:8bec  dc 92 bf      jml [$bf92]
$0e:8bef  08            php
$0e:8bf0  bb            tyx
$0e:8bf1  c2 6f         rep #$6f
$0e:8bf3  d4 19         pei ($19)
$0e:8bf5  fe 13 77      inc $7713,x
$0e:8bf8  d9 e0 77      cmp $77e0,y
$0e:8bfb  1f a1 00 3f   ora $3f00a1,x
$0e:8bff  b5 fd         lda $fd,x
$0e:8c01  c2 08         rep #$08
$0e:8c03  01 ea         ora ($ea,x)
$0e:8c05  1c 03 bf      trb $bf03
$0e:8c08  08            php
$0e:8c09  fb            xce
$0e:8c0a  d2 77         cmp ($77)
$0e:8c0c  d4 0f         pei ($0f)
$0e:8c0e  ff 16 75 58   sbc $587516,x
$0e:8c12  80 5f         bra $8c73
$0e:8c14  7b            tdc
$0e:8c15  e8            inx
$0e:8c16  70 4f         bvs $8c67
$0e:8c18  e5 ef         sbc $ef
$0e:8c1a  65 ff         adc $ff
$0e:8c1c  99 74 e3      sta $e374,y
$0e:8c1f  54 cc 16      mvn $16,$cc
$0e:8c22  7e 25 54      ror $5425,x
$0e:8c25  cc dd f2      cpy $f2dd
$0e:8c28  57 db         eor [$db],y
$0e:8c2a  9f 36 00 bf   sta $bf0036,x
$0e:8c2e  0f 6c 03 fa   ora $fa036c
$0e:8c32  c2 1f         rep #$1f
$0e:8c34  7b            tdc
$0e:8c35  08            php
$0e:8c36  71 90         adc ($90),y
$0e:8c38  09 55 de      ora #$de55
$0e:8c3b  a1 55         lda ($55,x)
$0e:8c3d  fd 75 e5      sbc $e575,x
$0e:8c40  95 58         sta $58,x
$0e:8c42  45 56         eor $56
$0e:8c44  d5 57         cmp $57,x
$0e:8c46  fa            plx
$0e:8c47  35 83         and $83,x
$0e:8c49  bb            tyx
$0e:8c4a  88            dey
$0e:8c4b  80 6a         bra $8cb7
$0e:8c4d  a0 12 87      ldy #$8712
$0e:8c50  00 b8         brk #$b8
$0e:8c52  43 50         eor $50,s
$0e:8c54  e0 19 14      cpx #$1419
$0e:8c57  01 dc         ora ($dc,x)
$0e:8c59  10 18         bpl $8c73
$0e:8c5b  04 0e         tsb $0e
$0e:8c5d  01 06         ora ($06,x)
$0e:8c5f  80 c2         bra $8c23
$0e:8c61  e1 90         sbc ($90,x)
$0e:8c63  68            pla
$0e:8c64  cc 76 47      cpy $4776
$0e:8c67  63 8e         adc $8e,s
$0e:8c69  3c 4a 0f      bit $0f4a,x
$0e:8c6c  00 87         brk #$87
$0e:8c6e  c0 23 e8      cpy #$e823
$0e:8c71  a1 44         lda ($44,x)
$0e:8c73  82 1c 3e      brl $ca92
$0e:8c76  50 ec         bvc $8c64
$0e:8c78  cd f2 97      cmp $97f2
$0e:8c7b  b8            clv
$0e:8c7c  fb            xce
$0e:8c7d  44 65 7e      mvp $7e,$65
$0e:8c80  4a            lsr a
$0e:8c81  b7 27         lda [$27],y
$0e:8c83  7b            tdc
$0e:8c84  83 7e         sta $7e,s
$0e:8c86  82 7f a3      brl $3008
$0e:8c89  9e 39 1d      stz $1d39,x
$0e:8c8c  f3 3d         sbc ($3d,s),y
$0e:8c8e  3f e0 c7 b8   and $b8c7e0,x
$0e:8c92  52 dd         eor ($dd)
$0e:8c94  97 1e         sta [$1e],y
$0e:8c96  c3 9b         cmp $9b,s
$0e:8c98  dc 51 53      jml [$5351]
$0e:8c9b  fd 80 80      sbc $8080,x
$0e:8c9e  50 30         bvc $8cd0
$0e:8ca0  1a            inc a
$0e:8ca1  0a            asl a
$0e:8ca2  07 c2         ora [$c2]
$0e:8ca4  41 c8         eor ($c8,x)
$0e:8ca6  98            tya
$0e:8ca7  6f 39 16 2c   adc $2c1639
$0e:8cab  e6 e6         inc $e6
$0e:8cad  8c 4f 0e      sty $0e4f
$0e:8cb0  04 03         tsb $03
$0e:8cb2  c1 00         cmp ($00,x)
$0e:8cb4  f8            sed
$0e:8cb5  40            rti
$0e:8cb6  3f 10 0f e4   and $e40f10,x
$0e:8cba  03 fc         ora $fc,s
$0e:8cbc  80 1c         bra $8cda
$0e:8cbe  8d d6 9d      sta $9dd6
$0e:8cc1  79 bf ce      adc $cebf,y
$0e:8cc4  b6 39         ldx $39,y
$0e:8cc6  ee d7 36      inc $36d7
$0e:8cc9  7d b7 b3      adc $b3b7,x
$0e:8ccc  f8            sed
$0e:8ccd  f3 51         sbc ($51,s),y
$0e:8ccf  9f 17 ff e1   sta $e1ff17,x
$0e:8cd3  ff fe 7f ef   sbc $ef7ffe,x
$0e:8cd7  ff f9 ff fe   sbc $fefff9,x
$0e:8cdb  9f ff 8f ff   sta $ff8fff,x
$0e:8cdf  ec ff fc      cpx $fcff
$0e:8ce2  8f 9e 95 a7   sta $a7959e
$0e:8ce6  f3 57         sbc ($57,s),y
$0e:8ce8  3d b1 88      and $88b1,x
$0e:8ceb  a7 e2         lda [$e2]
$0e:8ced  f3 e0         sbc ($e0,s),y
$0e:8cef  f1 70         sbc ($70),y
$0e:8cf1  3b            tsc
$0e:8cf2  b8            clv
$0e:8cf3  18            clc
$0e:8cf4  7a            ply
$0e:8cf5  28            plp
$0e:8cf6  50 e0         bvc $8cd8
$0e:8cf8  a4 6f         ldy $6f
$0e:8cfa  f7 ff         sbc [$ff],y
$0e:8cfc  29 69 a4      and #$a469
$0e:8cff  64 65         stz $65
$0e:8d01  5d 18 96      eor $9618,x
$0e:8d04  a6 15         ldx $15
$0e:8d06  b1 b8         lda ($b8),y
$0e:8d08  ea            nop
$0e:8d09  2d bb 0a      and $0abb
$0e:8d0c  83 7c         sta $7c,s
$0e:8d0e  00 e4         brk #$e4
$0e:8d10  09 26 31      ora #$3126
$0e:8d13  c8            iny
$0e:8d14  2f f9 3c 7b   and $7b3cf9
$0e:8d18  3c 33 38      bit $3833,x
$0e:8d1b  7c 46 1f      jmp ($1f46,x)
$0e:8d1e  99 c3 a3      sta $a3c3,y
$0e:8d21  70 6c         bvs $8d8f
$0e:8d23  7e 0d 8d      ror $8d0d,x
$0e:8d26  c1 0a         cmp ($0a,x)
$0e:8d28  0d f4 43      ora $43f4
$0e:8d2b  82 1c 11      brl $9e4a
$0e:8d2e  60            rts
$0e:8d2f  9f 05 68 3b   sta $3b6805,x
$0e:8d33  c9 06 13      cmp #$1306
$0e:8d36  0f fc 07 fd   ora $fd07fc
$0e:8d3a  87 bc         sta [$bc]
$0e:8d3c  1a            inc a
$0e:8d3d  c5 ff         cmp $ff
$0e:8d3f  b6 ac         ldx $ac,y
$0e:8d41  45 a7         eor $a7
$0e:8d43  1f 67 c3 f3   ora $f3c367,x
$0e:8d47  e1 bc         sbc ($bc,x)
$0e:8d49  58            cli
$0e:8d4a  7e 4e 37      ror $374e,x
$0e:8d4d  13 8d         ora ($8d,s),y
$0e:8d4f  c8            iny
$0e:8d50  e7 7f         sbc [$7f]
$0e:8d52  4f df c3 f9   eor $f9c3df
$0e:8d56  f8            sed
$0e:8d57  fe 7c 3f      inc $3f7c,x
$0e:8d5a  c2 50         rep #$50
$0e:8d5c  f2 0a         sbc ($0a)
$0e:8d5e  07 89         ora [$89]
$0e:8d60  fe fb c2      inc $c2fb,x
$0e:8d63  39 33 6c      and $6c33,y
$0e:8d66  15 ff         ora $ff,x
$0e:8d68  25 7f         and $7f
$0e:8d6a  89 fb 86      bit #$86fb
$0e:8d6d  61 b4         adc ($b4,x)
$0e:8d6f  ba            tsx
$0e:8d70  d2 76         cmp ($76)
$0e:8d72  d0 01         bne $8d75
$0e:8d74  fc c2 87      jsr ($87c2,x)
$0e:8d77  e3 21         sbc $21,s
$0e:8d79  f7 e1         sbc [$e1],y
$0e:8d7b  f9 db 4f      sbc $4fdb,y
$0e:8d7e  6c 3e 99      jmp ($993e)
$0e:8d81  90 e5         bcc $8d68
$0e:8d83  cd 6d 50      cmp $506d
$0e:8d86  ca            dex
$0e:8d87  65 66         adc $66
$0e:8d89  6f 10 80 4c   adc $4c8010
$0e:8d8d  60            rts
$0e:8d8e  11 38         ora ($38),y
$0e:8d90  06 ce         asl $ce
$0e:8d92  01 37         ora ($37,x)
$0e:8d94  80 65         bra $8dfb
$0e:8d96  cc 83 8f      cpy $8f83
$0e:8d99  80 48         bra $8de3
$0e:8d9b  3f d0 5f de   and $de5fd0,x
$0e:8d9f  5a            phy
$0e:8da0  d9 bd 80      cmp $80bd,y
$0e:8da3  cd 66 b5      cmp $b566
$0e:8da6  ef fe 22 ef   sbc $ef22fe
$0e:8daa  11 f7         ora ($f7),y
$0e:8dac  7f e0 0f d1   adc $d10fe0,x
$0e:8db0  40            rti
$0e:8db1  0f 29 04 28   ora $280429
$0e:8db5  92 d2         sta ($d2)
$0e:8db7  5e f0 97      lsr $97f0,x
$0e:8dba  fd 05 7e      sbc $7e05,x
$0e:8dbd  f7 00         sbc [$00],y
$0e:8dbf  c9 e4 f7      cmp #$f7e4
$0e:8dc2  9f e8 87 ba   sta $ba87e8,x
$0e:8dc6  24 f5         bit $f5
$0e:8dc8  04 42         tsb $42
$0e:8dca  db            stp
$0e:8dcb  11 0b         ora ($0b),y
$0e:8dcd  ab            plb
$0e:8dce  99 d7 a2      sta $a2d7,y
$0e:8dd1  55 da         eor $da,x
$0e:8dd3  86 8e         stx $8e
$0e:8dd5  b5 1e         lda $1e,x
$0e:8dd7  b9 75 f6      lda $f675,y
$0e:8dda  5d de f7      eor $f7de,x
$0e:8ddd  57 cd         eor [$cd],y
$0e:8ddf  cc 80 7b      cpy $7b80
$0e:8de2  60            rts
$0e:8de3  1e f6 00      asl $00f6,x
$0e:8de6  b0 42         bcs $8e2a
$0e:8de8  da            phx
$0e:8de9  4e 08 07      lsr $0708
$0e:8dec  e6 01         inc $01
$0e:8dee  45 c1         eor $c1
$0e:8df0  6a            ror a
$0e:8df1  ad 97 4b      lda $4b97
$0e:8df4  cc a2 67      cpy $67a2
$0e:8df7  d1 b3         cmp ($b3),y
$0e:8df9  e8            inx
$0e:8dfa  a9 dc 58      lda #$58dc
$0e:8dfd  ee 2e 77      inc $772e
$0e:8e00  00 4d         brk #$4d
$0e:8e02  07 fe         ora [$fe]
$0e:8e04  41 ff         eor ($ff,x)
$0e:8e06  a0 1f c2      ldy #$c21f
$0e:8e09  ff 01 bf c0   sbc $c0bf01,x
$0e:8e0d  ef f0 7b fd   sbc $fd7bf0
$0e:8e11  d7 e1         cmp [$e1],y
$0e:8e13  6a            ror a
$0e:8e14  b1 65         lda ($65),y
$0e:8e16  66 b6         ror $b6
$0e:8e18  ed f5 6f      sbc $6ff5
$0e:8e1b  37 fe         and [$fe],y
$0e:8e1d  9b            txy
$0e:8e1e  57 b3         eor [$b3],y
$0e:8e20  55 bc         eor $bc,x
$0e:8e22  ec 3e 01      cpx $013e
$0e:8e25  9d 80 21      sta $2180,x
$0e:8e28  c3 83         cmp $83,s
$0e:8e2a  00 f2         brk #$f2
$0e:8e2c  40            rti
$0e:8e2d  39 2c 01      and $012c,y
$0e:8e30  f7 40         sbc [$40],y
$0e:8e32  3e 50 fc      rol $fc50,x
$0e:8e35  dd f2 8f      cmp $8ff2,x
$0e:8e38  b8            clv
$0e:8e39  ff 40 65 7d   sbc $7d6540,x
$0e:8e3d  cf 37 e7 3b   cmp $3be737
$0e:8e41  e3 f1         sbc $f1,s
$0e:8e43  c7 13         cmp [$13]
$0e:8e45  ec 9f 6c      cpx $6c9f
$0e:8e48  e5 8e         sbc $8e
$0e:8e4a  c7 fc         cmp [$fc]
$0e:8e4c  cf 5f c3 a1   cmp $a1c35f
$0e:8e50  d7 9c         cmp [$9c],y
$0e:8e52  6e 78 f6      ror $f678
$0e:8e55  7c fe e2      jmp ($e2fe,x)
$0e:8e58  8e 1f ed      stx $ed1f
$0e:8e5b  1f 06 bf a2   ora $a2bf06,x
$0e:8e5f  f7 e5         sbc [$e5],y
$0e:8e61  23 f8         and $f8,s
$0e:8e63  ed 9c 5a      sbc $5a9c
$0e:8e66  cd a6 e3      cmp $e3a6
$0e:8e69  dd 97 a0      cmp $a097,x
$0e:8e6c  85 0f         sta $0f
$0e:8e6e  ec 03 f7      cpx $f703
$0e:8e71  00 f9         brk #$f9
$0e:8e73  c0 3d 70      cpy #$703d
$0e:8e76  0e dc 03      asl $03dc
$0e:8e79  77 00         adc [$00],y
$0e:8e7b  4a            lsr a
$0e:8e7c  86 d6         stx $d6
$0e:8e7e  e1 da         sbc ($da,x)
$0e:8e80  91 59         sta ($59),y
$0e:8e82  62 bb 6c      per $fb40
$0e:8e85  77 6f         adc [$6f],y
$0e:8e87  8f 3c d9 59   sta $59d93c
$0e:8e8b  bc 39 b8      ldy $b839,x
$0e:8e8e  c4 3f         cpy $3f
$0e:8e90  ff 9d ff f2   sbc $f2ff9d,x
$0e:8e94  bf f6 1f fc   lda $fc1ff6,x
$0e:8e98  c3 ff         cmp $ff,s
$0e:8e9a  49 ff 87      eor #$87ff
$0e:8e9d  82 cd ff      brl $8e6d
$0e:8ea0  d1 70         cmp ($70),y
$0e:8ea2  eb            xba
$0e:8ea3  9a            txs
$0e:8ea4  7f 56 32 2b   adc $2b3256,x
$0e:8ea8  98            tya
$0e:8ea9  d2 4e         cmp ($4e)
$0e:8eab  3b            tsc
$0e:8eac  36 0d         rol $0d,x
$0e:8eae  17 02         ora [$02],y
$0e:8eb0  bb            tyx
$0e:8eb1  81 fe         sta ($fe,x)
$0e:8eb3  7f ff 3f ff   adc $ff3fff,x
$0e:8eb7  9f ff cf ff   sta $ffcfff,x
$0e:8ebb  e7 ff         sbc [$ff]
$0e:8ebd  f3 ff         sbc ($ff,s),y
$0e:8ebf  f9 ff fe      sbc $feff,y
$0e:8ec2  fd ff b6      sbc $b6ff,x
$0e:8ec5  6c 23 1b      jmp ($1b23)
$0e:8ec8  49 37 23      eor #$2337
$0e:8ecb  69 da c5      adc #$c5da
$0e:8ece  d7 22         cmp [$22],y
$0e:8ed0  1e 7a 1c      asl $1c7a,x
$0e:8ed3  ae 59 54      ldx $5459
$0e:8ed6  73 83         adc ($83,s),y
$0e:8ed8  9c 22 13      stz $1322
$0e:8edb  f8            sed
$0e:8edc  03 10         ora $10,s
$0e:8ede  61 11         adc ($11,x)
$0e:8ee0  fc 24 7e      jsr ($7e24,x)
$0e:8ee3  07 af         ora [$af]
$0e:8ee5  dc 5e 2b      jml [$2b5e]
$0e:8ee8  d3 e9         cmp ($e9,s),y
$0e:8eea  7c 7e 27      jmp ($277e,x)
$0e:8eed  0f 86 40 f0   ora $f04086
$0e:8ef1  70 0a         bvs $8efd
$0e:8ef3  06 03         asl $03
$0e:8ef5  61 c0         adc ($c0,x)
$0e:8ef7  83 ff         sta $ff,s
$0e:8ef9  e0 24 76      cpx #$7624
$0e:8efc  23 9c         and $9c,s
$0e:8efe  e2 00         sep #$00
$0e:8f00  f0 0c         beq $8f0e
$0e:8f02  1e 0f ff      asl $ff0f,x
$0e:8f05  ff 4f 84 0b   sbc $0b844f,x
$0e:8f09  f9 78 80      sbc $8078,y
$0e:8f0c  c0 60 4f      cpy #$4f60
$0e:8f0f  50 7a         bvc $8f8b
$0e:8f11  85 f1         sta $f1
$0e:8f13  c5 37         cmp $37
$0e:8f15  1b            tcs
$0e:8f16  5f 7f db b5   eor $b5db7f,x
$0e:8f1a  e2 d8         sep #$d8
$0e:8f1c  72 fb         adc ($fb)
$0e:8f1e  fa            plx
$0e:8f1f  dd 43 79      cmp $7943,x
$0e:8f22  ad b9 57      lda $57b9
$0e:8f25  bd b8 42      lda $42b8,x
$0e:8f28  f8            sed
$0e:8f29  7f a1 02 20   adc $2002a1,x
$0e:8f2d  fe 40 3f      inc $3f40,x
$0e:8f30  90 3f         bcc $8f71
$0e:8f32  c4 04         cpy $04
$0e:8f34  4c 1f ed      jmp $ed1f
$0e:8f37  cd 5e 4d      cmp $4d5e
$0e:8f3a  cd f1 d2      cmp $d2f1
$0e:8f3d  72 f7         adc ($f7)
$0e:8f3f  db            stp
$0e:8f40  0f 2f c3 4b   ora $4bc32f
$0e:8f44  99 f6 7e      sta $7ef6,y
$0e:8f47  14 b7         trb $b7
$0e:8f49  80 44         bra $8f8f
$0e:8f4b  20 11 47      jsr $4711
$0e:8f4e  80 90         bra $8ee0
$0e:8f50  c0 86         cpy #$86
$0e:8f52  10 42         bpl $8f96
$0e:8f54  50 ed         bvc $8f43
$0e:8f56  2f 73 4b 7e   and $7e4b73
$0e:8f5a  83 ff         sta $ff,s
$0e:8f5c  1b            tcs
$0e:8f5d  a0 54         ldy #$54
$0e:8f5f  ea            nop
$0e:8f60  75 c9         adc $c9,x
$0e:8f62  f7 43         sbc [$43],y
$0e:8f64  5d 92 fe      eor $fe92,x
$0e:8f67  63 e0         adc $e0,s
$0e:8f69  19 f8 04      ora $04f8,y
$0e:8f6c  7e 01 bf      ror $bf01,x
$0e:8f6f  80 6b         bra $8fdc
$0e:8f71  1c 62 c0      trb $c062
$0e:8f74  18            clc
$0e:8f75  07 52         ora [$52]
$0e:8f77  77 6d         adc [$6d],y
$0e:8f79  80 58         bra $8fd3
$0e:8f7b  ac 5d af      ldy $af5d
$0e:8f7e  f6 82         inc $82,x
$0e:8f80  fd 25 ed      sbc $ed25,x
$0e:8f83  cb            wai
$0e:8f84  e0 3c         cpx #$3c
$0e:8f86  be 5b 88      ldx $885b,y
$0e:8f89  b3 ae         lda ($ae,s),y
$0e:8f8b  33 10         and ($10,s),y
$0e:8f8d  0c 02 69      tsb $6902
$0e:8f90  00 d1         brk #$d1
$0e:8f92  57 36         eor [$36],y
$0e:8f94  b0 1b         bcs $8fb1
$0e:8f96  95 ca         sta $ca,x
$0e:8f98  b7 ff         lda [$ff],y
$0e:8f9a  d0 df         bne $8f7b
$0e:8f9c  b4 d5         ldy $d5,x
$0e:8f9e  9b            txy
$0e:8f9f  2c 00 fa      bit $fa00
$0e:8fa2  42 00         wdm #$00
$0e:8fa4  c6 b8         dec $b8
$0e:8fa6  dd 1a 11      cmp $111a,x
$0e:8fa9  bf 95 3f e5   lda $e53f95,x
$0e:8fad  83 bd         sta $bd,s
$0e:8faf  6f 20 53 79   adc $795320
$0e:8fb3  b5 6b         lda $6b,x
$0e:8fb5  f9 8b bb      sbc $bb8b,y
$0e:8fb8  c4 7d         cpy $7d
$0e:8fba  df d8 02 fd   cmp $fd02d8,x
$0e:8fbe  39 30 04      and $0430,y
$0e:8fc1  39 38 82      and $8238,y
$0e:8fc4  d5 77         cmp $77,x
$0e:8fc6  a8            tay
$0e:8fc7  55 7f         eor $7f,x
$0e:8fc9  5d 79 65      eor $6579,x
$0e:8fcc  56 11         lsr $11,x
$0e:8fce  55 b5         eor $b5,x
$0e:8fd0  55 fe         eor $fe,x
$0e:8fd2  95 5a         sta $5a,x
$0e:8fd4  45 77         eor $77
$0e:8fd6  11 00         ora ($00),y
$0e:8fd8  d5 40         cmp $40,x
$0e:8fda  25 0e         and $0e
$0e:8fdc  01 70         ora ($70,x)
$0e:8fde  86 a1         stx $a1
$0e:8fe0  c0 3a         cpy #$3a
$0e:8fe2  28            plp
$0e:8fe3  07 d6         ora [$d6]
$0e:8fe5  e1 3a         sbc ($3a,x)
$0e:8fe7  f1 55         sbc ($55),y
$0e:8fe9  76 b6         ror $b6,x
$0e:8feb  ed f5 5f      sbc $5ff5
$0e:8fee  5f 6a db 5f   eor $5fdb6a,x
$0e:8ff2  74 f6         stz $f6,x
$0e:8ff4  ad 9c 3e      lda $3e9c
$0e:8ff7  01 1d         ora ($1d,x)
$0e:8ff9  80 42         bra $903d
$0e:8ffb  a0 10         ldy #$10
$0e:8ffd  12 20         ora ($20)
$0e:8fff  81 48         sta ($48,x)
$0e:9001  96 19         stx $19,y
$0e:9003  cf 1f 0e f9   cmp $f90e1f
$0e:9007  7e 9f ec      ror $ec9f,x
$0e:900a  63 dd         adc $dd,s
$0e:900c  ae 6e fa      ldx $fa6e
$0e:900f  6f 67 b1 e6   adc $e6b167
$0e:9013  b3 26         lda ($26,s),y
$0e:9015  90 0f         bcc $9026
$0e:9017  a4 fe         ldy $fe
$0e:9019  01 cf         ora ($cf,x)
$0e:901b  30 0d         bmi $902a
$0e:901d  9e 01 f1      stz $f101,x
$0e:9020  87 e6         sta [$e6]
$0e:9022  af f4 6d e7   lda $e76df4
$0e:9026  b6 31         ldx $31,y
$0e:9028  14 fc         trb $fc
$0e:902a  5e 7c 1e      lsr $1e7c,x
$0e:902d  2e 0f 73      rol $730f
$0e:9030  00 1f         brk #$1f
$0e:9032  60            rts
$0e:9033  fb            xce
$0e:9034  78            sei
$0e:9035  e0 39         cpx #$39
$0e:9037  eb            xba
$0e:9038  1d ba 2f      ora $2fba,x
$0e:903b  1e 85 ce      asl $ce85,x
$0e:903e  a3 76         lda $76,s
$0e:9040  ed 5f ba      sbc $ba5f
$0e:9043  97 ce         sta [$ce],y
$0e:9045  f5 a2         sbc $a2,x
$0e:9047  c3 f9         cmp $f9,s
$0e:9049  00 fc         brk #$fc
$0e:904b  40            rti
$0e:904c  3e 90 0f      rol $0f90,x
$0e:904f  24 03         bit $03
$0e:9051  a9 00 da      lda #$da00
$0e:9054  2b            pld
$0e:9055  07 6b         ora [$6b]
$0e:9057  70 ad         bvs $9006
$0e:9059  68            pla
$0e:905a  b4 bd         ldy $bd,x
$0e:905c  5c b7 bb d7   jml $d7bbb7
$0e:9060  f7 f2         sbc [$f2],y
$0e:9062  7a            ply
$0e:9063  bd 5f de      lda $de5f,x
$0e:9066  ef fa 1f ff   sbc $ff1ffa
$0e:906a  8e df e1      stx $e1df
$0e:906d  53 f8         eor ($f8,s),y
$0e:906f  0c 7e 01      tsb $017e
$0e:9072  0f 88 c1 e0   ora $e0c188
$0e:9076  10 30         bpl $90a8
$0e:9078  20 68 b8      jsr $b868
$0e:907b  75 cd         adc $cd,x
$0e:907d  3f af 1f 13   and $131faf,x
$0e:9081  cd ea e7      cmp $e7ea
$0e:9084  fc db ee      jsr ($eedb,x)
$0e:9087  77 ff         adc [$ff],y
$0e:9089  67 f7         adc [$f7]
$0e:908b  ff 3f ff 8f   sbc $8fff3f,x
$0e:908f  f7 c3         sbc [$c3],y
$0e:9091  f9 e4 fc      sbc $fce4,y
$0e:9094  70 3e         bvs $90d4
$0e:9096  18            clc
$0e:9097  2f 04 03 81   and $810304
$0e:909b  10 c0         bpl $905d
$0e:909d  4d bd 19      eor $19bd
$0e:90a0  bf ae 3f 75   lda $753fae,x
$0e:90a4  a5 ff         lda $ff
$0e:90a6  7c ff fe      jmp ($feff,x)
$0e:90a9  0f 77 93 ff   ora $ff9377
$0e:90ad  de ff c0      dec $c0ff,x
$0e:90b0  ee f0 09      inc $09f0
$0e:90b3  dd 00 02      cmp $0200,x
$0e:90b6  0f f0 83 c4   ora $c483f0
$0e:90ba  51 82         eor ($82),y
$0e:90bc  0a            asl a
$0e:90bd  0d 57 42      ora $4257
$0e:90c0  35 65         and $65,x
$0e:90c2  92 ee         sta ($ee)
$0e:90c4  aa            tax
$0e:90c5  93 7c         sta ($7c,s),y
$0e:90c7  54 1b 83      mvn $83,$1b
$0e:90ca  9f 9e ef 6c   sta $6cef9e,x
$0e:90ce  b6 f2         ldx $f2,y
$0e:90d0  60            rts
$0e:90d1  0f 82 81 ff   ora $ff8182
$0e:90d5  84 7f         sty $7f
$0e:90d7  e0 22         cpx #$22
$0e:90d9  30 f0         bmi $90cb
$0e:90db  40            rti
$0e:90dc  95 83         sta $83,x
$0e:90de  8a            txa
$0e:90df  82 eb 6a      brl $fbcd
$0e:90e2  75 4d         adc $4d,x
$0e:90e4  7c cb fb      jmp ($fbcb,x)
$0e:90e7  d0 f5         bne $90de
$0e:90e9  56 ff         lsr $ff,x
$0e:90eb  bc 4e fa      ldy $fa4e,x
$0e:90ee  f4 08 0d      pea $0d08
$0e:90f1  01 fb         ora ($fb,x)
$0e:90f3  a2 c2         ldx #$c2
$0e:90f5  40            rti
$0e:90f6  cc 1d a7      cpy $a71d
$0e:90f9  5a            phy
$0e:90fa  d3 ad         cmp ($ad,s),y
$0e:90fc  e9 de ec      sbc #$ecde
$0e:90ff  73 3e         adc ($3e,s),y
$0e:9101  5d bf 3b      eor $3bbf,x
$0e:9104  dd 9e ef      cmp $ef9e,x
$0e:9107  ec f6 f7      cpx $f7f6
$0e:910a  28            plp
$0e:910b  44 0b e3      mvp $e3,$0b
$0e:910e  c4 fc         cpy $fc
$0e:9110  60            rts
$0e:9111  3e 10 25      rol $2510,x
$0e:9114  51 f9         eor ($f9),y
$0e:9116  ab            plb
$0e:9117  bf 1a dd 43   lda $43dd1a,x
$0e:911b  f7 f6         sbc [$f6],y
$0e:911d  af 79 a9 97   lda $97a979
$0e:9121  5e fc cf      lsr $cffc,x
$0e:9124  33 cf         and ($cf,s),y
$0e:9126  97 b3         sta [$b3],y
$0e:9128  42 08         wdm #$08
$0e:912a  40            rti
$0e:912b  16 60         asl $60,x
$0e:912d  44 e0 10      mvp $10,$e0
$0e:9130  28            plp
$0e:9131  05 1a         ora $1a
$0e:9133  01 10         ora ($10,x)
$0e:9135  80 6d         bra $91a4
$0e:9137  aa            tax
$0e:9138  72 ae         adc ($ae)
$0e:913a  2f 4e c1 9d   and $9dc14e
$0e:913e  be cd 7d      ldx $7dcd,y
$0e:9141  f8            sed
$0e:9142  51 90         eor ($90),y
$0e:9144  70 61         bvs $91a7
$0e:9146  9f f6 30 21   sta $2130f6,x
$0e:914a  81 0c         sta ($0c,x)
$0e:914c  04 90         tsb $90
$0e:914e  8f 40 27 c6   sta $c62740
$0e:9152  81 66         sta ($66,x)
$0e:9154  87 5a         sta [$5a]
$0e:9156  f7 22         sbc [$22],y
$0e:9158  ee ec e0      inc $e0ec
$0e:915b  19 dc ed      ora $eddc,y
$0e:915e  57 df         eor [$df],y
$0e:9160  c5 9d         cmp $9d
$0e:9162  d4 20         pei ($20)
$0e:9164  34 cf         bit $cf,x
$0e:9166  fb            xce
$0e:9167  f9 2c 50      sbc $502c,y
$0e:916a  01 10         ora ($10,x)
$0e:916c  21 c8         and ($c8,x)
$0e:916e  da            phx
$0e:916f  37 a9         and [$a9],y
$0e:9171  0f 7e db 01   ora $01db7e
$0e:9175  ee f7 4e      inc $4ef7
$0e:9178  e1 c4         sbc ($c4,x)
$0e:917a  9d d2 60      sta $60d2,x
$0e:917d  07 d2         ora [$d2]
$0e:917f  43 94         eor $94,s
$0e:9181  89 fe ac      bit #$acfe
$0e:9184  d0 ed         bne $9173
$0e:9186  5d e4 1d      eor $1de4,x
$0e:9189  db            stp
$0e:918a  54 1f b9      mvn $b9,$1f
$0e:918d  dd aa 7b      cmp $7baa,x
$0e:9190  53 21         eor ($21,s),y
$0e:9192  4a            lsr a
$0e:9193  3e 0f e2      rol $e20f,x
$0e:9196  01 fa         ora ($fa,x)
$0e:9198  80 2f         bra $91c9
$0e:919a  c1 4a         cmp ($4a,x)
$0e:919c  08            php
$0e:919d  76 c0         ror $c0,x
$0e:919f  77 65         adc [$65],y
$0e:91a1  15 db         ora $db,x
$0e:91a3  85 56         sta $56
$0e:91a5  f5 d7         sbc $d7,x
$0e:91a7  d0 55         bne $91fe
$0e:91a9  71 57         adc ($57),y
$0e:91ab  5b            tcd
$0e:91ac  d4 5f         pei ($5f)
$0e:91ae  81 c7         sta ($c7,x)
$0e:91b0  52 86         eor ($86)
$0e:91b2  8a            txa
$0e:91b3  01 aa         ora ($aa,x)
$0e:91b5  80 7a         bra $9231
$0e:91b7  20 1e a7      jsr $a71e
$0e:91ba  30 b9         bmi $9175
$0e:91bc  42 71         wdm #$71
$0e:91be  00 a0         brk #$a0
$0e:91c0  4f f6 b8 0a   eor $0ab8f6
$0e:91c4  27 12         and [$12]
$0e:91c6  a9 d0 a8      lda #$a8d0
$0e:91c9  f0 64         beq $922f
$0e:91cb  de 6c 8d      dec $8d6c,x
$0e:91ce  ba            tsx
$0e:91cf  59 81 3f      eor $3f81,y
$0e:91d2  85 fe         sta $fe
$0e:91d4  01 3b         ora ($3b,x)
$0e:91d6  80 0f         bra $91e7
$0e:91d8  80 d2         bra $91ac
$0e:91da  11 93         ora ($93),y
$0e:91dc  60            rts
$0e:91dd  df 90 81 e3   cmp $e38190,x
$0e:91e1  b5 72         lda $72,x
$0e:91e3  ff f7 ec 0d   sbc $0decf7,x
$0e:91e7  fa            plx
$0e:91e8  cd e6 96      cmp $96e6
$0e:91eb  ff f4 55 f3   sbc $f355f4,x
$0e:91ef  f8            sed
$0e:91f0  47 20         eor [$20]
$0e:91f2  13 43         ora ($43,s),y
$0e:91f4  60            rts
$0e:91f5  8f c0 12 42   sta $4212c0
$0e:91f9  22 ff 40 f8   jsl $f840ff
$0e:91fd  97 ff         sta [$ff],y
$0e:91ff  f4 ef 89      pea $89ef
$0e:9202  47 17         eor [$17]
$0e:9204  80 cc         bra $91d2
$0e:9206  05 e1         ora $e1
$0e:9208  ba            tsx
$0e:9209  89 c4 30      bit #$30c4
$0e:920c  63 f0         adc $f0,s
$0e:920e  aa            tax
$0e:920f  60            rts
$0e:9210  ed 99 32      sbc $3299
$0e:9213  09 4a 30      ora #$304a
$0e:9216  74 4c         stz $4c,x
$0e:9218  1c 62 0f      trb $0f62
$0e:921b  13 87         ora ($87,s),y
$0e:921d  c7 60         cmp [$60]
$0e:921f  b1 68         lda ($68),y
$0e:9221  64 4e         stz $4e
$0e:9223  1a            inc a
$0e:9224  57 08         eor [$08],y
$0e:9226  8c 36 2f      sty $2f36
$0e:9229  0d 66 83      ora $8366
$0e:922c  34 20         bit $20,x
$0e:922e  50 08         bvc $9238
$0e:9230  19 88 4c      ora $4c88,y
$0e:9233  e8            inx
$0e:9234  6e 68 0c      ror $0c68
$0e:9237  0a            asl a
$0e:9238  0b            phd
$0e:9239  0a            asl a
$0e:923a  88            dey
$0e:923b  cb            wai
$0e:923c  a8            tay
$0e:923d  5b            tcd
$0e:923e  f3 73         sbc ($73,s),y
$0e:9240  9b            txy
$0e:9241  96 49         stx $49,y
$0e:9243  db            stp
$0e:9244  a9 74 e0      lda #$e074
$0e:9247  98            tya
$0e:9248  5a            phy
$0e:9249  1f 06 31 89   ora $893106,x
$0e:924d  a3 f0         lda $f0,s
$0e:924f  ec 1a 18      cpx $181a
$0e:9252  06 05         asl $05
$0e:9254  9a            txs
$0e:9255  12 c8         ora ($c8)
$0e:9257  05 e8         ora $e8
$0e:9259  0c 37 68      tsb $6837
$0e:925c  04 f2         tsb $f2
$0e:925e  01 5e         ora ($5e,x)
$0e:9260  06 0e         asl $0e
$0e:9262  13 ff         ora ($ff,s),y
$0e:9264  5b            tcd
$0e:9265  cf c9 f0 f1   cmp $f1f0c9
$0e:9269  ac 2d 5f      ldy $5f2d
$0e:926c  9f 47 e7 c5   sta $c5e747,x
$0e:9270  f1 f4         sbc ($f4),y
$0e:9272  6e 78 2c      ror $2c78
$0e:9275  2c 10 0b      bit $0b10
$0e:9278  c0 00         cpy #$00
$0e:927a  67 ec         adc [$ec]
$0e:927c  61 62         adc ($62,x)
$0e:927e  94 4b         sty $4b,x
$0e:9280  fd eb f4      sbc $f4eb,x
$0e:9283  ef f6 35 9d   sbc $9d35f6
$0e:9287  2d d7 f3      and $f3d7
$0e:928a  d2 fc         cmp ($fc)
$0e:928c  7d 7f 7f      adc $7f7f,x
$0e:928f  ef 84 06 01   sbc $010684
$0e:9293  16 80         asl $80,x
$0e:9295  53 85         eor ($85,s),y
$0e:9297  c0 e4         cpy #$e4
$0e:9299  17 f8         ora [$f8],y
$0e:929b  39 c8 3a      and $3ac8,y
$0e:929e  1d 79 c0      ora $c079,x
$0e:92a1  74 39         stz $39,x
$0e:92a3  f2 8d         sbc ($8d)
$0e:92a5  fd 01 ea      sbc $ea01,x
$0e:92a8  1e b9 63      asl $63b9,x
$0e:92ab  dc 05 09      jml [$0905]
$0e:92ae  10 01         bpl $92b1
$0e:92b0  18            clc
$0e:92b1  14 bf         trb $bf
$0e:92b3  f0 0d         beq $92c2
$0e:92b5  65 fc         adc $fc
$0e:92b7  1e 1d b9      asl $b91d,x
$0e:92ba  fe d2 e9      inc $e9d2,x
$0e:92bd  c2 9f         rep #$9f
$0e:92bf  fe a0 a0      inc $a0a0,x
$0e:92c2  f0 0f         beq $92d3
$0e:92c4  34 2c         bit $2c,x
$0e:92c6  3c bd be      bit $bebd,x
$0e:92c9  67 52         adc [$52]
$0e:92cb  67 f6         adc [$f6]
$0e:92cd  86 fe         stx $fe
$0e:92cf  a0 fe f8      ldy #$f8fe
$0e:92d2  95 e7         sta $e7,x
$0e:92d4  1f 77 aa eb   ora $ebaa77,x
$0e:92d8  32 ec         and ($ec)
$0e:92da  90 87         bcc $9263
$0e:92dc  99 05 be      sta $be05,y
$0e:92df  10 1c         bpl $92fd
$0e:92e1  04 03         tsb $03
$0e:92e3  81 88         sta ($88,x)
$0e:92e5  f0 72         beq $9359
$0e:92e7  2c 12 ae      bit $ae12
$0e:92ea  e4 93         cpx $93
$0e:92ec  f5 11         sbc $11,x
$0e:92ee  f7 e4         sbc [$e4],y
$0e:92f0  6f f8 6f e6   adc $e66ff8
$0e:92f4  86 bb         stx $bb
$0e:92f6  4b            phk
$0e:92f7  98            tya
$0e:92f8  e5 33         sbc $33
$0e:92fa  e0 f0 07      cpx #$07f0
$0e:92fd  83 95         sta $95,s
$0e:92ff  9d 60 c1      sta $c160,x
$0e:9302  0b            phd
$0e:9303  86 db         stx $db
$0e:9305  fb            xce
$0e:9306  3b            tsc
$0e:9307  ed 44 28      sbc $2844
$0e:930a  b8            clv
$0e:930b  dc dc 4e      jml [$4edc]
$0e:930e  a7 9a         lda [$9a]
$0e:9310  ba            tsx
$0e:9311  64 af         stz $af
$0e:9313  f7 35         sbc [$35],y
$0e:9315  f0 71         beq $9388
$0e:9317  a0 1e f8      ldy #$f81e
$0e:931a  07 ea         ora [$ea]
$0e:931c  01 ec         ora ($ec,x)
$0e:931e  80 7b         bra $939b
$0e:9320  51 03         eor ($03),y
$0e:9322  8c 80 69      sty $6980
$0e:9325  2f 78 4b fe   and $fe4b78
$0e:9329  82 bf 7b      brl $0eeb
$0e:932c  80 64         bra $9392
$0e:932e  f2 73         sbc ($73)
$0e:9330  cf f6 42 dd   cmp $dd42f6
$0e:9334  12 be         ora ($be)
$0e:9336  17 c8         ora [$c8],y
$0e:9338  be 56 c5      ldx $c556,y
$0e:933b  02 d0         cop #$d0
$0e:933d  27 fb         and [$fb]
$0e:933f  5c 05 43 a1   jml $a14305
$0e:9343  52 e1         eor ($e1)
$0e:9345  50 b8         bvc $92ff
$0e:9347  12 6f         ora ($6f)
$0e:9349  36 46         rol $46,x
$0e:934b  dd ac 80      cmp $80ac,x
$0e:934e  87 42         sta [$42]
$0e:9350  ff 00 97 c0   sbc $c09700,x
$0e:9354  27 b0         and [$b0]
$0e:9356  01 f8         ora ($f8,x)
$0e:9358  46 60         lsr $60
$0e:935a  0c a0 75      tsb $75a0
$0e:935d  86 d6         stx $d6
$0e:935f  d9 8d b6      cmp $b68d,y
$0e:9362  65 6b         adc $6b
$0e:9364  97 59         sta [$59],y
$0e:9366  e7 7f         sbc [$7f]
$0e:9368  fd c5 b6      sbc $b6c5,x
$0e:936b  49 6d 9b      eor #$9b6d
$0e:936e  2f 77 ce 00   and $00ce77
$0e:9372  df 0f 1c 03   cmp $031c0f,x
$0e:9376  87 00         sta [$00]
$0e:9378  22 86 4d d0   jsl $d04d86
$0e:937c  31 18         and ($18),y
$0e:937e  05 8f         ora $8f
$0e:9380  c7 e3         cmp [$e3]
$0e:9382  de 47 af      dec $af47,x
$0e:9385  fe 3c e5      inc $e53c,x
$0e:9388  5e 71 b9      lsr $b971,x
$0e:938b  e3 f9         sbc $f9,s
$0e:938d  f3 fb         sbc ($fb,s),y
$0e:938f  8e 3c 71      stx $713c
$0e:9392  80 2b         bra $93bf
$0e:9394  f2 5f         sbc ($5f)
$0e:9396  90 24         bcc $93bc
$0e:9398  b2 b9         lda ($b9)
$0e:939a  5c d5 f2 8d   jml $8df2d5
$0e:939e  b8            clv
$0e:939f  32 81         and ($81)
$0e:93a1  3c 3c df      bit $df3c,x
$0e:93a4  8c e7 8b      sty $8be7
$0e:93a7  c5 1c         cmp $1c
$0e:93a9  b5 00         lda $00,x
$0e:93ab  84 43         sty $43
$0e:93ad  50 8f         bvc $933e
$0e:93af  ff 23 83 8b   sbc $8b8323,x
$0e:93b3  c4 c8         cpy $c8
$0e:93b5  f4 3a 2c      pea $2c3a
$0e:93b8  0c 0f 03      tsb $030f
$0e:93bb  3d c1 ed      and $edc1,x
$0e:93be  94 61         sty $61,x
$0e:93c0  00 9f         brk #$9f
$0e:93c2  40            rti
$0e:93c3  2e d0 0a      rol $0ad0
$0e:93c6  f4 02 fc      pea $fc02
$0e:93c9  46 36         lsr $36
$0e:93cb  50 47         bvc $9414
$0e:93cd  20 91 78      jsr $7891
$0e:93d0  69 44 22      adc #$2244
$0e:93d3  70 98         bvs $936d
$0e:93d5  3c 76 0d      bit $0d76,x
$0e:93d8  1c 2a 84      trb $842a
$0e:93db  4a            lsr a
$0e:93dc  1f 03 80 40   ora $408003,x
$0e:93e0  8c 03 06      sty $0603
$0e:93e3  30 09         bmi $93ee
$0e:93e5  7c 0c a0      jmp ($a00c,x)
$0e:93e8  ca            dex
$0e:93e9  0c 7d fa      tsb $fa7d
$0e:93ec  79 fd b9      adc $b9fd,y
$0e:93ef  7c e8 3c      jmp ($3ce8,x)
$0e:93f2  1c 96 47      trb $4796
$0e:93f5  1f 81 dd e0   ora $e0dd81,x
$0e:93f9  6b            rtl
$0e:93fa  ee 70 30      inc $3070
$0e:93fd  0c 30 80      tsb $8030
$0e:9400  36 e2         rol $e2,x
$0e:9402  31 b3         and ($b3),y
$0e:9404  42 87         wdm #$87
$0e:9406  c3 b9         cmp $b9,s
$0e:9408  74 e0         stz $e0,x
$0e:940a  98            tya
$0e:940b  51 c8         eor ($c8),y
$0e:940d  46 31         lsr $31
$0e:940f  34 77         bit $77,x
$0e:9411  28            plp
$0e:9412  60            rts
$0e:9413  7e 1d 19      ror $191d,x
$0e:9416  e4 02         cpx $02
$0e:9418  59 00 bd      eor $bd00,y
$0e:941b  40            rti
$0e:941c  08            php
$0e:941d  e0 43 04      cpx #$0443
$0e:9420  f8            sed
$0e:9421  11 c2         ora ($c2),y
$0e:9423  5c 8e 0e 7d   jml $7d0e8e
$0e:9427  1f 9f 26 d7   ora $d7269f,x
$0e:942b  da            phx
$0e:942c  bc b7 4f      ldy $4fb7,x
$0e:942f  5d 13 bf      eor $bf13,x
$0e:9432  60            rts
$0e:9433  ef ce b0 b3   sbc $b3b0ce
$0e:9437  f8            sed
$0e:9438  02 fc         cop #$fc
$0e:943a  2b            pld
$0e:943b  f0 08         beq $9445
$0e:943d  fb            xce
$0e:943e  10 57         bpl $9497
$0e:9440  e4 0d         cpx $0d
$0e:9442  00 c8         brk #$c8
$0e:9444  7d ff 3f      adc $3fff,x
$0e:9447  3f cc fb b1   and $b1fbcc,x
$0e:944b  4a            lsr a
$0e:944c  fe 61 ef      inc $ef61,x
$0e:944f  b9 4f 75      lda $754f,y
$0e:9452  97 36         sta [$36],y
$0e:9454  2b            pld
$0e:9455  04 68         tsb $68
$0e:9457  23 40         and $40,s
$0e:9459  56 4e         lsr $4e,x
$0e:945b  32 46         and ($46)
$0e:945d  87 5e         sta [$5e]
$0e:945f  71 eb         adc ($eb),y
$0e:9461  96 6a         stx $6a,y
$0e:9463  ed 9b da      sbc $da9b
$0e:9466  10 ac         bpl $9414
$0e:9468  3a            dec a
$0e:9469  b3 af         lda ($af,s),y
$0e:946b  f5 ff         sbc $ff,x
$0e:946d  b3 79         lda ($79,s),y
$0e:946f  36 04         rol $04,x
$0e:9471  40            rti
$0e:9472  00 20         brk #$20
$0e:9474  46 32         lsr $32
$0e:9476  87 f6         sta [$f6]
$0e:9478  06 27         asl $27
$0e:947a  4f 64 43 fd   eor $fd4364
$0e:947e  01 08         ora ($08,x)
$0e:9480  86 7f         stx $7f
$0e:9482  c0 04 58      cpy #$5804
$0e:9485  0c 0c ca      tsb $ca0c
$0e:9488  05 f0         ora $f0
$0e:948a  36 0e         rol $0e,x
$0e:948c  ef d9 db b3   sbc $b3dbd9
$0e:9490  6a            ror a
$0e:9491  7a            ply
$0e:9492  59 7e e4      eor $e47e,y
$0e:9495  bf 61 99 f3   lda $f39961,x
$0e:9499  6a            ror a
$0e:949a  ad b5 7c      lda $7cb5
$0e:949d  d6 03         dec $03,x
$0e:949f  81 00         sta ($00,x)
$0e:94a1  c0 41 30      cpy #$3041
$0e:94a4  12 08         ora ($08)
$0e:94a6  01 00         ora ($00,x)
$0e:94a8  1f e4 1e 0b   ora $0b1ee4,x
$0e:94ac  bf 06 91 dd   lda $dd9106,x
$0e:94b0  a0 f7 6d      ldy #$6df7
$0e:94b3  fd 9a 4f      sbc $4f9a,x
$0e:94b6  76 fb         ror $fb,x
$0e:94b8  c9 f0 57      cmp #$57f0
$0e:94bb  61 fd         adc ($fd,x)
$0e:94bd  b4 28         ldy $28,x
$0e:94bf  17 e9         ora [$e9],y
$0e:94c1  52 12         eor ($12)
$0e:94c3  a9 9f 7a      lda #$7a9f
$0e:94c6  25 dd         and $dd
$0e:94c8  88            dey
$0e:94c9  50 f3         bvc $94be
$0e:94cb  59 e8 97      eor $97e8,y
$0e:94ce  de 75 d9      dec $d975,x
$0e:94d1  89 56 73      bit #$7356
$0e:94d4  dc c8 07      jml [$07c8]
$0e:94d7  b6 01         ldx $01,y
$0e:94d9  ef 40 0a 04   sbc $040a40
$0e:94dd  39 a8 01      and $01a8,y
$0e:94e0  f0 c0         beq $94a2
$0e:94e2  2c 51 cd      bit $cd51
$0e:94e5  ae 07 e5      ldx $e507
$0e:94e8  f2 b5         sbc ($b5)
$0e:94ea  d7 e0         cmp [$e0],y
$0e:94ec  35 e9         and $e9,x
$0e:94ee  b5 a7         lda $a7,x
$0e:94f0  8b            phb
$0e:94f1  e0 9d de      cpx #$de9d
$0e:94f4  c2 21         rep #$21
$0e:94f6  7e 80 43      ror $4380,x
$0e:94f9  60            rts
$0e:94fa  1b            tcs
$0e:94fb  f5 20         sbc $20,x
$0e:94fd  e7 d8         sbc [$d8]
$0e:94ff  c3 84         cmp $84,s
$0e:9501  80 75         bra $9578
$0e:9503  27 56         and [$56]
$0e:9505  d8            cld
$0e:9506  0d 9a cf      ora $cf9a
$0e:9509  de fd e8      dec $e8fd,x
$0e:950c  af 72 de bc   lda $bcde72
$0e:9510  9e 0b d3      stz $d30b,x
$0e:9513  ee b7 cb      inc $cbb7
$0e:9516  31 00         and ($00),y
$0e:9518  fe 31 07      inc $0731,x
$0e:951b  f0 c8         beq $94e5
$0e:951d  12 28         ora ($28)
$0e:951f  48            pha
$0e:9520  a4 78         ldy $78
$0e:9522  ac 5f 77      ldy $775f
$0e:9525  fd 81 bf      sbc $bf81,x
$0e:9528  59 bc d2      eor $d2bc,y
$0e:952b  df fe 8a be   cmp $be8afe,x
$0e:952f  11 0e         ora ($0e),y
$0e:9531  e4 02         cpx $02
$0e:9533  e8            inx
$0e:9534  48            pha
$0e:9535  12 40         ora ($40)
$0e:9537  46 5c         lsr $5c
$0e:9539  46 48         lsr $48
$0e:953b  0b            phd
$0e:953c  94 3e         sty $3e,x
$0e:953e  37 7c         and [$7c],y
$0e:9540  e3 ee         sbc $ee,s
$0e:9542  1a            inc a
$0e:9543  81 ab         sta ($ab,x)
$0e:9545  ee 79 bf      inc $bf79
$0e:9548  31 db         and ($db),y
$0e:954a  1e c6 fe      asl $fec6,x
$0e:954d  11 2b         ora ($2b),y
$0e:954f  f8            sed
$0e:9550  09 5f e5      ora #$e55f
$0e:9553  9c b1 58      stz $58b1
$0e:9556  bf 99 eb f7   lda $f7eb99,x
$0e:955a  8a            txa
$0e:955b  39 d6 9c      and $9cd6,y
$0e:955e  6e 38 d6      ror $d638
$0e:9561  6c f7 6f      jmp ($6ff7)
$0e:9564  fc ff 20      jsr ($20ff,x)
$0e:9567  fd 40 ff      sbc $ff40,x
$0e:956a  ba            tsx
$0e:956b  c8            iny
$0e:956c  0c 8e 45      tsb $458e
$0e:956f  29 85 63      and #$6385
$0e:9572  70 d6         bvs $954a
$0e:9574  3b            tsc
$0e:9575  26 3e         rol $3e
$0e:9577  e1 3b         sbc ($3b,x)
$0e:9579  c5 30         cmp $30
$0e:957b  41 82         eor ($82,x)
$0e:957d  0d f0 fa      ora $faf0
$0e:9580  40            rti
$0e:9581  2f 0c 21 76   and $76210c
$0e:9585  83 84         sta $84,s
$0e:9587  2b            pld
$0e:9588  3d eb 4f      and $4feb,x
$0e:958b  eb            xba
$0e:958c  83 7e         sta $7e,s
$0e:958e  df d0 23 37   cmp $3723d0,x
$0e:9592  ee 5e d0      inc $d05e
$0e:9595  aa            tax
$0e:9596  0b            phd
$0e:9597  f0 66         beq $95ff
$0e:9599  84 11         sty $11
$0e:959b  c4 78         cpy $78
$0e:959d  07 42         ora [$42]
$0e:959f  fe 30 c1      inc $c130,x
$0e:95a2  50 c4         bvc $9568
$0e:95a4  5d a8 33      eor $33a8,x
$0e:95a7  ec 7d fa      cpx $fa7d
$0e:95aa  ef fe af 7f   sbc $7faffe
$0e:95ae  ff 57 f0 4a   sbc $4af057,x
$0e:95b2  07 e2         ora [$e2]
$0e:95b4  09 85 ed      ora #$ed85
$0e:95b7  f2 f0         sbc ($f0)
$0e:95b9  38            sec
$0e:95ba  1a            inc a
$0e:95bb  dd 6f 79      cmp $796f,x
$0e:95be  7e a9 df      ror $dfa9,x
$0e:95c1  e0 b7 f9      cpx #$f9b7
$0e:95c4  4d de f5      eor $f5de
$0e:95c7  00 9a         brk #$9a
$0e:95c9  40            rti
$0e:95ca  2f d0 0d 20   and $200dd0
$0e:95ce  28            plp
$0e:95cf  47 e4         eor [$e4]
$0e:95d1  c1 0e         cmp ($0e,x)
$0e:95d3  4c db cd      jmp $cddb
$0e:95d6  08            php
$0e:95d7  ff c1 6f 58   sbc $586fc1,x
$0e:95db  5e 7e 82      lsr $827e,x
$0e:95de  d7 14         cmp [$14],y
$0e:95e0  9b            txy
$0e:95e1  52 7b         eor ($7b)
$0e:95e3  f6 08         inc $08,x
$0e:95e5  8c a2 23      sty $23a2
$0e:95e8  30 80         bmi $956a
$0e:95ea  44 1d a0      mvp $a0,$1d
$0e:95ed  c4 03         cpy $03
$0e:95ef  38            sec
$0e:95f0  32 4b         and ($4b)
$0e:95f2  93 d6         sta ($d6,s),y
$0e:95f4  bc 71 68      ldy $6871,x
$0e:95f7  fd 48 5e      sbc $5e48,x
$0e:95fa  53 95         eor ($95,s),y
$0e:95fc  55 d8         eor $d8,x
$0e:95fe  59 75 f6      eor $f675,y
$0e:9601  ce 8c f2      dec $f28c
$0e:9604  71 00         adc ($00),y
$0e:9606  9d 38 05      sta $0538,x
$0e:9609  3e 0e 10      rol $100e,x
$0e:960c  8d 40 22      sta $2240
$0e:960f  50 08         bvc $9619
$0e:9611  14 03         trb $03
$0e:9613  59 47 fc      eor $fc47,y
$0e:9616  d4 b0         pei ($b0)
$0e:9618  f2 6d         sbc ($6d)
$0e:961a  6c 1b 6b      jmp ($6b1b)
$0e:961d  16 f7         asl $f7,x
$0e:961f  d7 31         cmp [$31],y
$0e:9621  73 cf         adc ($cf,s),y
$0e:9623  bd 22 31      lda $3122,x
$0e:9626  00 86         brk #$86
$0e:9628  40            rti
$0e:9629  2b            pld
$0e:962a  00 21         brk #$21
$0e:962c  a4 18         ldy $18
$0e:962e  86 80         stx $80
$0e:9630  62 1b dc      per $724e
$0e:9633  13 ef         ora ($ef,s),y
$0e:9635  80 af         bra $95e6
$0e:9637  e8            inx
$0e:9638  14 e3         trb $e3
$0e:963a  09 ff c0      ora #$c0ff
$0e:963d  43 21         eor $21,s
$0e:963f  fc 81 62      jsr ($6281,x)
$0e:9642  22 90 80 08   jsl $088090
$0e:9646  42 0c         wdm #$0c
$0e:9648  46 62         lsr $62
$0e:964a  18            clc
$0e:964b  08            php
$0e:964c  8c 3e f7      sty $f73e
$0e:964f  5b            tcd
$0e:9650  f4 ba 0f      pea $0fba
$0e:9653  b3 a1         lda ($a1,s),y
$0e:9655  c3 7e         cmp $7e,s
$0e:9657  b2 5e         lda ($5e)
$0e:9659  cf eb f9 10   cmp $10f9eb
$0e:965d  f7 19         sbc [$19],y
$0e:965f  4b            phk
$0e:9660  f1 00         sbc ($00),y
$0e:9662  fe 40 3f      inc $3f40,x
$0e:9665  4a            lsr a
$0e:9666  81 45         sta ($45,x)
$0e:9668  95 af         sta $af,x
$0e:966a  93 49         sta ($49,s),y
$0e:966c  ee d0 bb      inc $bbd0
$0e:966f  b2 9e         lda ($9e)
$0e:9671  ed 37 b3      sbc $b337
$0e:9674  c8            iny
$0e:9675  ae cd fd      ldx $fdcd
$0e:9678  75 7e         adc $7e,x
$0e:967a  8c da 01      sty $01da
$0e:967d  3e 30 3c      rol $3c30,x
$0e:9680  72 01         adc ($01)
$0e:9682  2e 80 55      rol $5580
$0e:9685  27 72         and [$72]
$0e:9687  4a            lsr a
$0e:9688  fe 22 6f      inc $6f22,x
$0e:968b  69 ef 60      adc #$60ef
$0e:968e  63 fb         adc $fb,s
$0e:9690  49 5f e6      eor #$e65f
$0e:9693  71 5c         adc ($5c),y
$0e:9695  cb            wai
$0e:9696  12 c8         ora ($c8)
$0e:9698  96 1b         stx $1b,y
$0e:969a  f5 30         sbc $30,x
$0e:969c  f7 e0         sbc [$e0],y
$0e:969e  1c 78 07      trb $0778
$0e:96a1  be 01 20      ldx $2001,y
$0e:96a4  bb            tyx
$0e:96a5  53 6b         eor ($6b,s),y
$0e:96a7  7f be cc 9e   adc $9eccbe,x
$0e:96ab  af 0b ab 5a   lda $5aab0b
$0e:96af  aa            tax
$0e:96b0  df 7a bc 23   cmp $23bc7a,x
$0e:96b4  bb            tyx
$0e:96b5  8f 80 69 a0   sta $a06980
$0e:96b9  12 68         ora ($68)
$0e:96bb  06 a2         asl $a2
$0e:96bd  01 a9         ora ($a9,x)
$0e:96bf  53 0a         eor ($0a,s),y
$0e:96c1  94 24         sty $24,x
$0e:96c3  4c e0 b7      jmp $b7e0
$0e:96c6  cd bb ba      cmp $babb
$0e:96c9  39 ce bf      and $bfce,y
$0e:96cc  6b            rtl
$0e:96cd  59 f9 f8      eor $f8f9,y
$0e:96d0  69 7b 3e      adc #$3e7b
$0e:96d3  ce c2 97      dec $97c2
$0e:96d6  f0 80         beq $9658
$0e:96d8  78            sei
$0e:96d9  20 1c 40      jsr $401c
$0e:96dc  50 e1         bvc $96bf
$0e:96de  20 19 48      jsr $4819
$0e:96e1  04 11         tsb $11
$0e:96e3  94 3d         sty $3d,x
$0e:96e5  49 d4 9f      eor #$9fd4
$0e:96e8  bb            tyx
$0e:96e9  08            php
$0e:96ea  fa            plx
$0e:96eb  53 f7         eor ($f7,s),y
$0e:96ed  54 3f d7      mvn $d7,$3f
$0e:96f0  36 69         rol $69,x
$0e:96f2  51 82         eor ($82),y
$0e:96f4  5b            tcd
$0e:96f5  fb            xce
$0e:96f6  81 51         sta ($51,x)
$0e:96f8  43 0f         eor $0f,s
$0e:96fa  f5 c8         sbc $c8,x
$0e:96fc  3f b7 40 fc   and $fc40b7,x
$0e:9700  e0 13 29      cpx #$2913
$0e:9703  06 6a         asl $6a
$0e:9705  25 ae         and $ae
$0e:9707  cc 79 27      cpy $2779
$0e:970a  bb            tyx
$0e:970b  3f 9c 43 81   and $81439c,x
$0e:970f  92 e9         sta ($e9)
$0e:9711  58            cli
$0e:9712  68            pla
$0e:9713  08            php
$0e:9714  90 f6         bcc $970c
$0e:9716  c0 2c f0      cpy #$f02c
$0e:9719  0e 1c 00      asl $001c
$0e:971c  44 13 f8      mvp $f8,$13
$0e:971f  04 b5         tsb $b5
$0e:9721  08            php
$0e:9722  33 28         and ($28,s),y
$0e:9724  95 82         sta $82,x
$0e:9726  41 28         eor ($28,x)
$0e:9728  b0 72         bcs $979c
$0e:972a  29 12 2e      and #$2e12
$0e:972d  0d ce df      ora $dfce
$0e:9730  0c 9e 50      tsb $509e
$0e:9733  a4 00         ldy $00
$0e:9735  10 44         bpl $977b
$0e:9737  82 24 36      brl $cd5e
$0e:973a  e0 81 ce      cpx #$ce81
$0e:973d  01 05         ora ($05,x)
$0e:973f  12 19         ora ($19)
$0e:9741  5c 25 7b bd   jml $bd7b25
$0e:9745  6f ff db 7d   adc $7ddbff
$0e:9749  fb            xce
$0e:974a  db            stp
$0e:974b  ee fa bf      inc $bffa
$0e:974e  46 bf         lsr $bf
$0e:9750  44 e3 f7      mvp $f7,$e3
$0e:9753  b8            clv
$0e:9754  04 86         tsb $86
$0e:9756  00 42         brk #$42
$0e:9758  08            php
$0e:9759  84 02         sty $02
$0e:975b  04 42         tsb $42
$0e:975d  18            clc
$0e:975e  09 08 72      ora #$7208
$0e:9761  b0 6e         bcs $97d1
$0e:9763  cf fb a7 dc   cmp $dca7fb
$0e:9767  d2 fe         cmp ($fe)
$0e:9769  ba            tsx
$0e:976a  7f cf 2f ea   adc $ea2fcf,x
$0e:976e  8f f8 c5 fd   sta $fdc5f8
$0e:9772  3f 04 21 90   and $902104,x
$0e:9776  10 84         bpl $96fc
$0e:9778  c8            iny
$0e:9779  df 6b fe 72   cmp $72fe6b,x
$0e:977d  ff 87 bf 52   sbc $52bf87,x
$0e:9781  66 d7         ror $d7
$0e:9783  18            clc
$0e:9784  76 6b         ror $6b,x
$0e:9786  01 66         ora ($66,x)
$0e:9788  b0 76         bcs $9800
$0e:978a  73 2d         adc ($2d,s),y
$0e:978c  f0 3f         beq $97cd
$0e:978e  b5 fe         lda $fe,x
$0e:9790  01 9f         ora ($9f,x)
$0e:9792  80 59         bra $97ed
$0e:9794  a0 1c 1d      ldy #$1d1c
$0e:9797  fe 07 7f      inc $7f07,x
$0e:979a  a5 cd         lda $cd
$0e:979c  f0 b7         beq $9755
$0e:979e  d9 9f bf      cmp $bf9f,y
$0e:97a1  1f 7b 80 ff   ora $ff807b,x
$0e:97a5  7c 35 d7      jmp ($d735,x)
$0e:97a8  e8            inx
$0e:97a9  02 7c         cop #$7c
$0e:97ab  91 20         sta ($20),y
$0e:97ad  a1 44         lda ($44,x)
$0e:97af  48            pha
$0e:97b0  6f e4 15 5c   adc $5c15e4
$0e:97b4  35 a3         and $a3,x
$0e:97b6  73 d6         adc ($d6,s),y
$0e:97b8  84 7c         sty $7c
$0e:97ba  61 d4         adc ($d4,x)
$0e:97bc  e8            inx
$0e:97bd  c7 ca         cmp [$ca]
$0e:97bf  47 98         eor [$98]
$0e:97c1  f3 f0         sbc ($f0,s),y
$0e:97c3  20 1e 88      jsr $881e
$0e:97c6  07 1a         ora [$1a]
$0e:97c8  01 e7         ora ($e7,x)
$0e:97ca  62 1f 30      per $c7ec
$0e:97cd  84 2e         sty $2e
$0e:97cf  30 94         bmi $9765
$0e:97d1  f5 b5         sbc $b5,x
$0e:97d3  5b            tcd
$0e:97d4  fb            xce
$0e:97d5  66 46         ror $46
$0e:97d7  07 fd         ora [$fd]
$0e:97d9  e8            inx
$0e:97da  65 68         adc $68
$0e:97dc  96 f9         stx $f9,y
$0e:97de  5f 50 c8 54   eor $54c850,x
$0e:97e2  08            php
$0e:97e3  05 a9         ora $a9
$0e:97e5  c8            iny
$0e:97e6  79 06 61      adc $6106,y
$0e:97e9  a1 c3         lda ($c3,x)
$0e:97eb  55 57         eor $57,x
$0e:97ed  f4 d0 27      pea $27d0
$0e:97f0  f8            sed
$0e:97f1  0f a5 77 bb   ora $bb77a5
$0e:97f5  2b            pld
$0e:97f6  43 81         eor $81,s
$0e:97f8  91 22         sta ($22),y
$0e:97fa  d0 0a         bne $9806
$0e:97fc  b1 18         lda ($18),y
$0e:97fe  c8            iny
$0e:97ff  41 fa         eor ($fa,x)
$0e:9801  83 77         sta $77,s
$0e:9803  66 9e         ror $9e
$0e:9805  9b            txy
$0e:9806  a6 73         ldx $73
$0e:9808  09 78 80      ora #$8078
$0e:980b  63 72         adc $72,s
$0e:980d  bb            tyx
$0e:980e  8b            phb
$0e:980f  a7 fa         lda [$fa]
$0e:9811  02 4b         cop #$4b
$0e:9813  08            php
$0e:9814  18            clc
$0e:9815  80 6c         bra $9883
$0e:9817  6c 41 b1      jmp ($b141)
$0e:981a  08            php
$0e:981b  04 84         tsb $84
$0e:981d  18            clc
$0e:981e  4b            phk
$0e:981f  d4 87         pei ($87)
$0e:9821  bf 6d 80 f7   lda $f7806d,x
$0e:9825  7b            tdc
$0e:9826  b5 4f         lda $4f,x
$0e:9828  7f 16 75 49   adc $497516,x
$0e:982c  80 53         bra $9881
$0e:982e  3f e8 70 ff   and $ff70e8,x
$0e:9832  10 06         bpl $983a
$0e:9834  44 80 56      mvp $56,$80
$0e:9837  f8            sed
$0e:9838  5a            phy
$0e:9839  7b            tdc
$0e:983a  bc ca cc      ldy $ccca,x
$0e:983d  5f 97 69 fc   eor $fc6997,x
$0e:9841  d2 46         cmp ($46)
$0e:9843  c1 c9         cmp ($c9,x)
$0e:9845  8f 70 f6 d7   sta $d7f670
$0e:9849  79 f4 00      adc $00f4,y
$0e:984c  be 13 c8      ldx $c813,y
$0e:984f  04 18         tsb $18
$0e:9851  c0 26 12      cpy #$1226
$0e:9854  84 40         sty $40
$0e:9856  25 73         and $73
$0e:9858  3e f4 4b      rol $4bf4,x
$0e:985b  bb            tyx
$0e:985c  10 a1         bpl $97ff
$0e:985e  e6 b3         inc $b3
$0e:9860  d1 2f         cmp ($2f),y
$0e:9862  bc eb b3      ldy $b3eb,x
$0e:9865  12 ac         ora ($ac)
$0e:9867  67 99         adc [$99]
$0e:9869  61 ed         adc ($ed,x)
$0e:986b  80 7b         bra $98e8
$0e:986d  d0 02         bne $9871
$0e:986f  81 0e         sta ($0e,x)
$0e:9871  6a            ror a
$0e:9872  00 7c         brk #$7c
$0e:9874  30 0c         bmi $9882
$0e:9876  1f 7b 55 dd   ora $dd557b,x
$0e:987a  bb            tyx
$0e:987b  d4 2e         pei ($2e)
$0e:987d  b5 e9         lda $e9,x
$0e:987f  fd 82 1f      sbc $1f82,x
$0e:9882  7f df f0 28   adc $28f0df,x
$0e:9886  3b            tsc
$0e:9887  e9 04 01      sbc #$0104
$0e:988a  3e 1a 88      rol $881a,x
$0e:988d  06 82         asl $82
$0e:988f  01 80         ora ($80,x)
$0e:9891  53 0b         eor ($0b,s),y
$0e:9893  7c bc 95      jmp ($95bc,x)
$0e:9896  f9 97 67      sbc $6797,y
$0e:9899  c7 19         cmp [$19]
$0e:989b  ce d9 ff      dec $ffd9
$0e:989e  b0 7b         bcs $991b
$0e:98a0  40            rti
$0e:98a1  f8            sed
$0e:98a2  20 3c 49      jsr $493c
$0e:98a5  db            stp
$0e:98a6  7c 20 8c      jmp ($8c20,x)
$0e:98a9  01 62         ora ($62,x)
$0e:98ab  44 87 df      mvp $df,$87
$0e:98ae  86 e7         stx $e7
$0e:98b0  6d 3d 90      adc $903d
$0e:98b3  da            phx
$0e:98b4  66 5f         ror $5f
$0e:98b6  9d 35 b6      sta $b635,x
$0e:98b9  41 69         eor ($69,x)
$0e:98bb  9c 7d e4      stz $e47d
$0e:98be  42 01         wdm #$01
$0e:98c0  31 80         and ($80),y
$0e:98c2  44 e0 1b      mvp $1b,$e0
$0e:98c5  37 00         and [$00],y
$0e:98c7  e4 dc         cpx $dc
$0e:98c9  82 23 08      brl $a0ef
$0e:98cc  0d 06 d1      ora $d106
$0e:98cf  40            rti
$0e:98d0  d4 52         pei ($52)
$0e:98d2  36 9e         rol $9e,x
$0e:98d4  58            cli
$0e:98d5  54 5a 8d      mvn $8d,$5a
$0e:98d8  0f ac 52 26   ora $2652ac
$0e:98dc  51 0d         eor ($0d),y
$0e:98de  f4 03 7f      pea $7f03
$0e:98e1  00 db         brk #$db
$0e:98e3  c0 23 68      cpy #$6823
$0e:98e6  21 f8         and ($f8,x)
$0e:98e8  00 85         brk #$85
$0e:98ea  06 17         asl $17
$0e:98ec  29 17 42      and #$4217
$0e:98ef  a1 44         lda ($44,x)
$0e:98f1  e0 61 b0      cpx #$b061
$0e:98f4  b4 bc         ldy $bc,x
$0e:98f6  3d b3 b9      and $b9b3,x
$0e:98f9  b1 f8         lda ($f8),y
$0e:98fb  50 6c         bvc $9969
$0e:98fd  3d d8 06      and $06d8,x
$0e:9900  bc 00 37      ldy $3700,x
$0e:9903  b8            clv
$0e:9904  05 f2         ora $f2
$0e:9906  01 33         ora ($33,x)
$0e:9908  80 43         bra $994d
$0e:990a  e0 19 e7      cpx #$e719
$0e:990d  70 41         bvs $9950
$0e:990f  e0 30 27      cpx #$2730
$0e:9912  70 31         bvs $9945
$0e:9914  24 7d         bit $7d
$0e:9916  b5 7f         lda $7f,x
$0e:9918  45 2f         eor $2f
$0e:991a  69 97 b4      adc #$b497
$0e:991d  53 f6         eor ($f6,s),y
$0e:991f  12 7a         ora ($7a)
$0e:9921  c5 be         cmp $be
$0e:9923  a1 17         lda ($17,x)
$0e:9925  94 4f         sty $4f,x
$0e:9927  d3 e0         cmp ($e0,s),y
$0e:9929  3e db bd      rol $bddb,x
$0e:992c  1e 3b 11      asl $113b,x
$0e:992f  83 41         sta $41,s
$0e:9931  20 23 47      jsr $4723
$0e:9934  dc 40 25      jml [$2540]
$0e:9937  d0 08         bne $9941
$0e:9939  5c 00 64 0c   jml $0c6400
$0e:993d  76 d0         ror $d0,x
$0e:993f  e7 fb         sbc [$fb]
$0e:9941  3b            tsc
$0e:9942  7c 1f f7      jmp ($f71f,x)
$0e:9945  83 bf         sta $bf,s
$0e:9947  c6 7e         dec $7e
$0e:9949  b4 7d         ldy $7d,x
$0e:994b  fa            plx
$0e:994c  04 f9         tsb $f9
$0e:994e  96 17         stx $17,y
$0e:9950  e4 f2         cpx $f2
$0e:9952  df d3 c3 ff   cmp $ffc3d3,x
$0e:9956  55 1d         eor $1d,x
$0e:9958  37 fe         and [$fe],y
$0e:995a  ab            plb
$0e:995b  0a            asl a
$0e:995c  bc 02 fb      ldy $fb02,x
$0e:995f  ff cc 59 f2   sbc $f259cc,x
$0e:9963  56 dd         lsr $dd,x
$0e:9965  66 b0         ror $b0
$0e:9967  cc 8a b0      cpy $b08a
$0e:996a  60            rts
$0e:996b  a5 4d         lda $4d
$0e:996d  54 3d 95      mvn $95,$3d
$0e:9970  90 d6         bcc $9948
$0e:9972  e0 1f 7f      cpx #$7f1f
$0e:9975  fe 8a bb      inc $bb8a,x
$0e:9978  22 ee d9 2c   jsl $2cd9ee
$0e:997c  8b            phb
$0e:997d  fc cd c0      jsr ($c0cd,x)
$0e:9980  2d db 3b      and $3bdb
$0e:9983  56 ce         lsr $ce,x
$0e:9985  fd a3 b6      sbc $b6a3,x
$0e:9988  6c e9 cf      jmp ($cfe9)
$0e:998b  03 77         ora $77,s
$0e:998d  84 12         sty $12
$0e:998f  00 ff         brk #$ff
$0e:9991  c9 a7 93      cmp #$93a7
$0e:9994  35 f2         and $f2,x
$0e:9996  c6 6e         dec $6e
$0e:9998  34 df         bit $df,x
$0e:999a  cf 97 fb fd   cmp $fdfb97
$0e:999e  f1 cd         sbc ($cd),y
$0e:99a0  f9 24 3d      sbc $3d24,y
$0e:99a3  e8            inx
$0e:99a4  dd fe 1b      cmp $1bfe,x
$0e:99a7  3f a3 c7 e0   and $e0c7a3,x
$0e:99ab  70 f8         bvs $99a5
$0e:99ad  0c 1e 01      tsb $011e
$0e:99b0  03 80         ora $80,s
$0e:99b2  1d 86 09      ora $0986,x
$0e:99b5  06 d4         asl $d4
$0e:99b7  eb            xba
$0e:99b8  6a            ror a
$0e:99b9  77 bb         adc [$bb],y
$0e:99bb  1c cf 97      trb $97cf
$0e:99be  6f ae e7 74   adc $74e7ae
$0e:99c2  b1 fa         lda ($fa),y
$0e:99c4  cc df f1      cpy $f1df
$0e:99c7  ff a8 7f b0   sbc $b07fa8,x
$0e:99cb  1f ce 27 e3   ora $e327ce,x
$0e:99cf  01 f0         ora ($f0,x)
$0e:99d1  81 78         sta ($78,x)
$0e:99d3  20 1c 08      jsr $081c
$0e:99d6  06 02         asl $02
$0e:99d8  9d 6b 27      sta $276b,x
$0e:99db  85 ba         sta $ba
$0e:99dd  96 4f         stx $4f,y
$0e:99df  0e 57 ac      asl $ac57
$0e:99e2  a2 9b 48      ldx #$489b
$0e:99e5  01 7d         ora ($7d,x)
$0e:99e7  26 86         rol $86
$0e:99e9  05 bd         ora $bd
$0e:99eb  6c ff 13      jmp ($13ff)
$0e:99ee  3e 8c 5a      rol $5a8c,x
$0e:99f1  af 9e c7 c4   lda $c4c79e
$0e:99f5  2c 1b ff      bit $ff1b
$0e:99f8  bd ff 89      lda $89ff,x
$0e:99fb  c4 e6         cpy $e6
$0e:99fd  40            rti
$0e:99fe  0f e1 e8 80   ora $80e8e1
$0e:9a02  12 80         ora ($80)
$0e:9a04  94 70         sty $70,x
$0e:9a06  09 dc 03      ora #$03dc
$0e:9a09  b5 fb         lda $fb,x
$0e:9a0b  69 84 9b      adc #$9b84
$0e:9a0e  ff 5d ee ed   sbc $edee5d,x
$0e:9a12  e9 10 1f      sbc #$1f10
$0e:9a15  f7 db         sbc [$db],y
$0e:9a17  ff 65 b2 83   sbc $83b265,x
$0e:9a1b  41 be         eor ($be,x)
$0e:9a1d  52 26         eor ($26)
$0e:9a1f  fa            plx
$0e:9a20  40            rti
$0e:9a21  33 50         and ($50,s),y
$0e:9a23  08            php
$0e:9a24  4f fe 75 1a   eor $1a75fe
$0e:9a28  a9 ce 3c      lda #$3cce
$0e:9a2b  7f f8 47 ff   adc $ff47f8,x
$0e:9a2f  47 a1         eor [$a1]
$0e:9a31  96 e0         stx $e0,y
$0e:9a33  e6 ce         inc $ce
$0e:9a35  51 f2         eor ($f2),y
$0e:9a37  c0 3c ed      cpy #$ed3c
$0e:9a3a  f3 af         sbc ($af,s),y
$0e:9a3c  40            rti
$0e:9a3d  2f cd f1 9a   and $9af1cd
$0e:9a41  ff 3d b2 c8   sbc $c8b23d,x
$0e:9a45  af f2 8b fc   lda $fc8bf2
$0e:9a49  db            stp
$0e:9a4a  d3 a0         cmp ($a0,s),y
$0e:9a4c  3f cf df fa   and $fadfcf,x
$0e:9a50  cb            wai
$0e:9a51  67 15         adc [$15]
$0e:9a53  04 4c         tsb $4c
$0e:9a55  52 22         eor ($22)
$0e:9a57  a2 15 16      ldx #$1615
$0e:9a5a  62 01 5a      per $f45e
$0e:9a5d  d2 eb         cmp ($eb)
$0e:9a5f  ff fb bf fd   sbc $fdbffb,x
$0e:9a63  46 5d         lsr $5d
$0e:9a65  cd e4 4d      cmp $4de4
$0e:9a68  76 f2         ror $f2,x
$0e:9a6a  cf ee d2 97   cmp $97d2ee
$0e:9a6e  7f 80 3f c9   adc $c93f80,x
$0e:9a72  22 13 78 05   jsl $057813
$0e:9a76  22 01 02 53   jsl $530201
$0e:9a7a  8e 9a 0f      stx $0f9a
$0e:9a7d  b3 e1         lda ($e1,s),y
$0e:9a7f  d2 7e         cmp ($7e)
$0e:9a81  3a            dec a
$0e:9a82  6a            ror a
$0e:9a83  c5 56         cmp $56
$0e:9a85  a3 b5         lda $b5,s
$0e:9a87  db            stp
$0e:9a88  eb            xba
$0e:9a89  1f 83 f8 80   ora $80f883,x
$0e:9a8d  7f 20 1f e0   adc $e01f20,x
$0e:9a91  20 eb 81      jsr $81eb
$0e:9a94  0b            phd
$0e:9a95  ff ff f4 e0   sbc $e0f4ff,x
$0e:9a99  1d bf 78      ora $78bf,x
$0e:9a9c  10 13         bpl $9ab1
$0e:9a9e  21 24         and ($24,x)
$0e:9aa0  ed cc 66      sbc $66cc
$0e:9aa3  20 41 02      jsr $0241
$0e:9aa6  09 05 b9      ora #$b905
$0e:9aa9  cc 61 b3      cpy $b361
$0e:9aac  76 ee         ror $ee,x
$0e:9aae  1d 0a df      ora $df0a,x
$0e:9ab1  22 59 a5 ab   jsl $aba559
$0e:9ab5  64 a5         stz $a5
$0e:9ab7  7c 9a af      jmp ($af9a,x)
$0e:9aba  92 d5         sta ($d5)
$0e:9abc  f2 9e         sbc ($9e)
$0e:9abe  7f e7 e6 00   adc $00e6e7,x
$0e:9ac2  fe 57 ff      inc $ff57,x
$0e:9ac5  d6 ff         dec $ff,x
$0e:9ac7  fd df ff      sbc $ffdf,x
$0e:9aca  7b            tdc
$0e:9acb  ff df 7f fd   sbc $fd7fdf,x
$0e:9acf  ae 95 12      ldx $1295
$0e:9ad2  47 8c         eor [$8c]
$0e:9ad4  8c 7c e5      sty $e57c
$0e:9ad7  7e 79 6f      ror $6f79,x
$0e:9ada  0e 59 f1      asl $f159
$0e:9add  86 f6         stx $f6
$0e:9adf  e0 d2 5f      cpx #$5fd2
$0e:9ae2  ff df ff 6b   sbc $6bffdf,x
$0e:9ae6  b3 c2         lda ($c2,s),y
$0e:9ae8  26 f0         rol $f0
$0e:9aea  c9 8c 32      cmp #$328c
$0e:9aed  25 1c         and $1c
$0e:9aef  91 c7         sta ($c7),y
$0e:9af1  a4 15         ldy $15
$0e:9af3  aa            tax
$0e:9af4  96 d2         stx $d2,y
$0e:9af6  87 4c         sta [$4c]
$0e:9af8  8c 5c ed      sty $ed5c
$0e:9afb  7e 7e 6f      ror $6f7e,x
$0e:9afe  0f 58 7b 2d   ora $2d7b58
$0e:9b02  2a            rol a
$0e:9b03  00 7d         brk #$7d
$0e:9b05  7e 7c 47      ror $477c,x
$0e:9b08  de 19 d1      dec $d119,x
$0e:9b0b  86 64         stx $64
$0e:9b0d  91 65         sta ($65),y
$0e:9b0f  66 ff         ror $ff
$0e:9b11  db            stp
$0e:9b12  7f fa 9a b6   adc $b69afa,x
$0e:9b16  03 00         ora $00,s
$0e:9b18  6b            rtl
$0e:9b19  2c 25 ee      bit $ee25
$0e:9b1c  be 2c 20      ldx $202c,y
$0e:9b1f  20 80 c0      jsr $c080
$0e:9b22  7e db 5f      ror $5fdb,x
$0e:9b25  ff 75 e8 1a   sbc $1ae875,x
$0e:9b29  e8            inx
$0e:9b2a  24 13         bit $13
$0e:9b2c  3a            dec a
$0e:9b2d  80 19         bra $9b48
$0e:9b2f  07 7f         ora [$7f]
$0e:9b31  ca            dex
$0e:9b32  be 5f db      ldx $db5f,y
$0e:9b35  19 fd d3      ora $d3fd,y
$0e:9b38  3b            tsc
$0e:9b39  76 ce         ror $ce,x
$0e:9b3b  bd a3 78      lda $78a3,x
$0e:9b3e  85 a3         sta $a3
$0e:9b40  67 6f         adc [$6f]
$0e:9b42  d9 3c 41      cmp $413c,y
$0e:9b45  e2 10         sep #$10
$0e:9b47  48            pha
$0e:9b48  03 ff         ora $ff,s
$0e:9b4a  2b            pld
$0e:9b4b  59 cb f6      eor $f6cb,y
$0e:9b4e  e2 37         sep #$37
$0e:9b50  9d a9 67      sta $67a9,x
$0e:9b53  01 e1         ora ($e1,x)
$0e:9b55  fa            plx
$0e:9b56  be 50 b3      ldx $b350,y
$0e:9b59  55 dc         eor $dc,x
$0e:9b5b  c8            iny
$0e:9b5c  d0 39         bne $9b97
$0e:9b5e  ee e0 80      inc $80e0
$0e:9b61  07 c0         ora [$c0]
$0e:9b63  3e 18 f8      rol $f818,x
$0e:9b66  07 b4         ora [$b4]
$0e:9b68  44 3d 7f      mvp $7f,$3d
$0e:9b6b  37 1f         and [$1f],y
$0e:9b6d  cd 9e f7      cmp $f79e
$0e:9b70  7d 78 c2      adc $c278,x
$0e:9b73  f0 eb         beq $9b60
$0e:9b75  79 bd 3c      adc $3cbd,y
$0e:9b78  ee be 9a      inc $9abe
$0e:9b7b  f7 00         sbc [$00],y
$0e:9b7d  1f 85 cc 80   ora $80cc85,x
$0e:9b81  23 f6         and $f6,s
$0e:9b83  af 5e fd 9c   lda $9cfd5e
$0e:9b87  ba            tsx
$0e:9b88  55 ae         eor $ae,x
$0e:9b8a  ad 7b a7      lda $a77b
$0e:9b8d  52 f1         eor ($f1)
$0e:9b8f  de ba 75      dec $75ba,x
$0e:9b92  ac b6 1a      ldy $1ab6
$0e:9b95  48            pha
$0e:9b96  04 d2         tsb $d2
$0e:9b98  01 b4         ora ($b4,x)
$0e:9b9a  80 17         bra $9bb3
$0e:9b9c  c0 c6         cpy #$c6
$0e:9b9e  06 12         asl $12
$0e:9ba0  31 87         and ($87),y
$0e:9ba2  6a            ror a
$0e:9ba3  31 bd         and ($bd),y
$0e:9ba5  c0 56         cpy #$56
$0e:9ba7  af ff 7c 6f   lda $6f7cff
$0e:9bab  e2 55         sep #$55
$0e:9bad  87 ae         sta [$ae]
$0e:9baf  d6 b6         dec $b6,x
$0e:9bb1  be fa 87      ldx $87fa,y
$0e:9bb4  9d 88 38      sta $3888,x
$0e:9bb7  07 30         ora [$30]
$0e:9bb9  c1 60         cmp ($60,x)
$0e:9bbb  12 07         ora ($07)
$0e:9bbd  30 af         bmi $9b6e
$0e:9bbf  c2 b6         rep #$b6
$0e:9bc1  70 08         bvs $9bcb
$0e:9bc3  0d 6b fd      ora $fd6b
$0e:9bc6  2d b9 e5      and $e5b9
$0e:9bc9  29 f6 b9      and #$b9f6
$0e:9bcc  17 97         ora [$97],y
$0e:9bce  7d da 96      adc $96da,x
$0e:9bd1  9f c3 fd 00   sta $00fdc3,x
$0e:9bd5  80 a0         bra $9b77
$0e:9bd7  87 61         sta [$61]
$0e:9bd9  00 ca         brk #$ca
$0e:9bdb  22 8f ab a6   jsl $a6ab8f
$0e:9bdf  d9 c2 aa      cmp $aac2,y
$0e:9be2  15 5d         ora $5d,x
$0e:9be4  66 e6         ror $e6
$0e:9be6  47 9a         eor [$9a]
$0e:9be8  ca            dex
$0e:9be9  d1 b2         cmp ($b2),y
$0e:9beb  b7 ae         lda [$ae],y
$0e:9bed  5c b2 f1 00   jml $00f1b2
$0e:9bf1  fe 40 35      inc $3540,x
$0e:9bf4  d0 0a         bne $9c00
$0e:9bf6  34 02         bit $02,x
$0e:9bf8  f9 00 9c      sbc $9c00,y
$0e:9bfb  39 86 20      and $2086,y
$0e:9bfe  8a            txa
$0e:9bff  37 38         and [$38],y
$0e:9c01  28            plp
$0e:9c02  c1 46         cmp ($46,x)
$0e:9c04  10 28         bpl $9c2e
$0e:9c06  0c 16 07      tsb $0716
$0e:9c09  04 81         tsb $81
$0e:9c0b  b3 95         lda ($95,s),y
$0e:9c0d  be ff ff      ldx $ffff,y
$0e:9c10  ff 2e 01 69   sbc $69012e,x
$0e:9c14  ff 42 ae da   sbc $daae42,x
$0e:9c18  bc dd 5b      ldy $5bdd,x
$0e:9c1b  9d ae 61      sta $61ae,x
$0e:9c1e  87 fd         sta [$fd]
$0e:9c20  da            phx
$0e:9c21  2f d1 fc e1   and $e1fcd1
$0e:9c25  ec fd e9      cpx $e9fd
$0e:9c28  cf 9e a2 ac   cmp $aca29e
$0e:9c2c  1b            tcs
$0e:9c2d  fd ff 27      sbc $27ff,x
$0e:9c30  00 ed         brk #$ed
$0e:9c32  db            stp
$0e:9c33  f0 17         beq $9c4c
$0e:9c35  f8            sed
$0e:9c36  85 bf         sta $bf
$0e:9c38  89 bb ac      bit #$acbb
$0e:9c3b  f6 70         inc $70,x
$0e:9c3d  1f f5 28 00   ora $0028f5,x
$0e:9c41  48            pha
$0e:9c42  02 48         cop #$48
$0e:9c44  10 93         bpl $9bd9
$0e:9c46  2b            pld
$0e:9c47  07 6d         ora [$6d]
$0e:9c49  2a            rol a
$0e:9c4a  ba            tsx
$0e:9c4b  6f 23 79 7a   adc $7a7923
$0e:9c4f  86 6a         stx $6a
$0e:9c51  bb            tyx
$0e:9c52  9b            txy
$0e:9c53  fd df 68      sbc $68df,x
$0e:9c56  59 9a ee      eor $ee9a,y
$0e:9c59  63 87         adc $87,s
$0e:9c5b  1f e1 c3 fd   ora $fdc3e1,x
$0e:9c5f  30 7f         bmi $9ce0
$0e:9c61  6c 0f d9      jmp ($d90f)
$0e:9c64  03 c6         ora $c6,s
$0e:9c66  11 87         ora ($87),y
$0e:9c68  dd 01 ba      cmp $ba01,x
$0e:9c6b  ee 6f 5d      inc $5d6f
$0e:9c6e  c9 ef ba      cmp #$baef
$0e:9c71  bd f7 b7      lda $b7f7,x
$0e:9c74  fe ee fd      inc $fdee,x
$0e:9c77  db            stp
$0e:9c78  df 3a fb c7   cmp $c7fb3a,x
$0e:9c7c  bf 7f e7 ff   lda $ffe77f,x
$0e:9c80  f8            sed
$0e:9c81  ff fe 1f ff   sbc $ff1ffe,x
$0e:9c85  83 ff         sta $ff,s
$0e:9c87  e4 7f         cpx $7f
$0e:9c89  f9 8f fe      sbc $fe8f,y
$0e:9c8c  71 ff         adc ($ff),y
$0e:9c8e  ca            dex
$0e:9c8f  50 fc         bvc $9c8d
$0e:9c91  74 1d         stz $1d,x
$0e:9c93  55 af         eor $af,x
$0e:9c95  ab            plb
$0e:9c96  3e fd 45      rol $45fd,x
$0e:9c99  3d 91 27      and $2791,x
$0e:9c9c  f0 7f         beq $9d1d
$0e:9c9e  70 11         bvs $9cb1
$0e:9ca0  e9 04 fa      sbc #$fa04
$0e:9ca3  01 14         ora ($14,x)
$0e:9ca5  69 a4 06      adc #$06a4
$0e:9ca8  02 d9         cop #$d9
$0e:9caa  0c 11 bc      tsb $bc11
$0e:9cad  2c 74 1f      bit $1f74
$0e:9cb0  56 ae         lsr $ae,x
$0e:9cb2  2b            pld
$0e:9cb3  be b5 75      ldx $75b5,y
$0e:9cb6  27 9c         and [$9c]
$0e:9cb8  28            plp
$0e:9cb9  ff 03 53 74   sbc $745303,x
$0e:9cbd  8f 68 27 d8   sta $d82768
$0e:9cc1  0c a5 03      tsb $03a5
$0e:9cc4  01 41         ora ($41,x)
$0e:9cc6  e0 40 78      cpx #$7840
$0e:9cc9  12 1e         ora ($1e)
$0e:9ccb  0c 8b c3      tsb $c38b
$0e:9cce  02 cb         cop #$cb
$0e:9cd0  65 ad         adc $ad
$0e:9cd2  df f1 48 66   cmp $6648f1,x
$0e:9cd6  b3 5a         lda ($5a,s),y
$0e:9cd8  1a            inc a
$0e:9cd9  f7 53         sbc [$53],y
$0e:9cdb  a8            tay
$0e:9cdc  29 0b 37      and #$370b
$0e:9cdf  fe d2 00      inc $00d2,x
$0e:9ce2  3b            tsc
$0e:9ce3  2b            pld
$0e:9ce4  f4 65 6f      pea $6f65
$0e:9ce7  d2 80         cmp ($80)
$0e:9ce9  46 a3         lsr $a3
$0e:9ceb  5d ef ff      eor $ffef,x
$0e:9cee  de 01 42      dec $4201,x
$0e:9cf1  a1 40         lda ($40,x)
$0e:9cf3  bf b2 c9 66   lda $66c9b2,x
$0e:9cf7  fe 01 b9      inc $b901,x
$0e:9cfa  ff f9 40 07   sbc $0740f9,x
$0e:9cfe  bd 7e 8f      lda $8f7e,x
$0e:9d01  4d 94 76      eor $7694
$0e:9d04  cd 9d 3b      cmp $3b9d
$0e:9d07  67 6f         adc [$6f]
$0e:9d09  d9 5a b6      cmp $b65a,y
$0e:9d0c  76 ed         ror $ed,x
$0e:9d0e  9f ba 67 ce   sta $ce67ba,x
$0e:9d12  99 f7 a4      sta $a4f7,y
$0e:9d15  70 48         bvs $9d5f
$0e:9d17  03 ff         ora $ff,s
$0e:9d19  23 59         and $59,s
$0e:9d1b  c8            iny
$0e:9d1c  f7 62         sbc [$62],y
$0e:9d1e  a5 9c         lda $9c
$0e:9d20  e8            inx
$0e:9d21  47 29         eor [$29]
$0e:9d23  39 fb d6      and $d6fb,y
$0e:9d26  f2 b1         sbc ($b1)
$0e:9d28  9c ed 47      stz $47ed
$0e:9d2b  3d f0 00      and $00f0,x
$0e:9d2e  fa            plx
$0e:9d2f  7b            tdc
$0e:9d30  a0 1c f1      ldy #$f11c
$0e:9d33  01 f5         ora ($f5,x)
$0e:9d35  fc dd ff      jsr ($ffdd,x)
$0e:9d38  76 5f         ror $5f,x
$0e:9d3a  c8            iny
$0e:9d3b  2f 0e 9f 9b   and $9b9f0e
$0e:9d3f  8f e6 e3 6d   sta $6de3e6
$0e:9d43  ba            tsx
$0e:9d44  be 6b dc      ldx $dc6b,y
$0e:9d47  02 e7         cop #$e7
$0e:9d49  00 1f         brk #$1f
$0e:9d4b  81 0e         sta ($0e,x)
$0e:9d4d  2d d4 ba      and $bad4
$0e:9d50  55 ae         eor $ae,x
$0e:9d52  bd 7b e7      lda $e77b,x
$0e:9d55  7a            ply
$0e:9d56  e9 d4 bb      sbc #$bbd4
$0e:9d59  6d 2e 85      adc $852e
$0e:9d5c  6a            ror a
$0e:9d5d  a0 db 76      ldy #$76db
$0e:9d60  90 02         bcc $9d64
$0e:9d62  f8            sed
$0e:9d63  69 20 13      adc #$1320
$0e:9d66  43 00         eor $00,s
$0e:9d68  97 c3         sta [$c3],y
$0e:9d6a  6b            rtl
$0e:9d6b  00 d9         brk #$d9
$0e:9d6d  40            rti
$0e:9d6e  2b            pld
$0e:9d6f  9a            txs
$0e:9d70  3d 37 7b      and $7b37,x
$0e:9d73  b3 38         lda ($38,s),y
$0e:9d75  91 7b         sta ($7b),y
$0e:9d77  ba            tsx
$0e:9d78  d7 a9         cmp [$a9],y
$0e:9d7a  d7 7b         cmp [$7b],y
$0e:9d7c  e5 96         sbc $96
$0e:9d7e  d8            cld
$0e:9d7f  55 9d         eor $9d,x
$0e:9d81  a1 01         lda ($01,x)
$0e:9d83  80 41         bra $9dc6
$0e:9d85  e0 11 14      cpx #$1411
$0e:9d88  00 a0         brk #$a0
$0e:9d8a  42 12         wdm #$12
$0e:9d8c  8a            txa
$0e:9d8d  19 ff 0b      ora $0bff,y
$0e:9d90  6d 39 98      adc $9839
$0e:9d93  f1 ac         sbc ($ac),y
$0e:9d95  76 ad         ror $ad,x
$0e:9d97  e5 b6         sbc $b6
$0e:9d99  b7 c7         lda [$c7],y
$0e:9d9b  a3 f3         lda $f3,s
$0e:9d9d  62 1c b7      per $54bc
$0e:9da0  68            pla
$0e:9da1  70 20         bvs $9dc3
$0e:9da3  1f 88 06 72   ora $720688,x
$0e:9da7  01 92         ora ($92,x)
$0e:9da9  80 6c         bra $9e17
$0e:9dab  15 02         ora $02,x
$0e:9dad  5f 0f 1c 93   eor $931c0f,x
$0e:9db1  e7 24         sbc [$24]
$0e:9db3  c3 d1         cmp $d1,s
$0e:9db5  32 f4         and ($f4)
$0e:9db7  4e 8d 0b      lsr $0b8d
$0e:9dba  4b            phk
$0e:9dbb  76 ad         ror $ad,x
$0e:9dbd  6f 37 98 08   adc $089837
$0e:9dc1  c4 01         cpy $01
$0e:9dc3  7e 13 86      ror $8613,x
$0e:9dc6  10 cf         bpl $9d97
$0e:9dc8  18            clc
$0e:9dc9  02 ca         cop #$ca
$0e:9dcb  9c 03 54      stz $5403
$0e:9dce  30 1c         bmi $9dec
$0e:9dd0  0a            asl a
$0e:9dd1  07 83         ora [$83]
$0e:9dd3  01 20         ora ($20,x)
$0e:9dd5  65 62         adc $62
$0e:9dd7  84 3e         sty $3e
$0e:9dd9  df 2e cd 56   cmp $56cd2e,x
$0e:9ddd  e5 e6         sbc $e6
$0e:9ddf  c2 ec         rep #$ec
$0e:9de1  f5 1b         sbc $1b,x
$0e:9de3  5a            phy
$0e:9de4  2f 0b c1 d5   and $d5c10b
$0e:9de8  81 ff         sta ($ff,x)
$0e:9dea  21 30         and ($30,x)
$0e:9dec  7d 1d fe      adc $fe1d,x
$0e:9def  83 bf         sta $bf,s
$0e:9df1  a0 7b f8      ldy #$f87b
$0e:9df4  17 f9         ora [$f9],y
$0e:9df6  87 fe         sta [$fe]
$0e:9df8  11 3f         ora ($3f),y
$0e:9dfa  80 40         bra $9e3c
$0e:9dfc  be ff 7f      ldx $7fff,y
$0e:9dff  5f eb fd f7   eor $f7fdeb,x
$0e:9e03  a0 d7 76      ldy #$76d7
$0e:9e06  ba            tsx
$0e:9e07  dd 15 0e      cmp $0e15,x
$0e:9e0a  8f ab e0 4f   sta $4fe0ab
$0e:9e0e  f9 1e 0f      sbc $0f1e,y
$0e:9e11  2c fb c5      bit $c5fb
$0e:9e14  3d f1 7d      and $7df1,x
$0e:9e17  e8            inx
$0e:9e18  7f e8 67 fe   adc $fe67e8,x
$0e:9e1c  21 fc         and ($fc,x)
$0e:9e1e  80 50         bra $9e70
$0e:9e20  2d d5 4d      and $4dd5
$0e:9e23  3e db bd      rol $bddb,x
$0e:9e26  ee ca f1      inc $f1ca
$0e:9e29  a6 f4         ldx $f4
$0e:9e2b  6e b6 9a      ror $9ab6
$0e:9e2e  d3 8e         cmp ($8e,s),y
$0e:9e30  eb            xba
$0e:9e31  c9 b8 7f      cmp #$7fb8
$0e:9e34  8e 5f c3      stx $c35f
$0e:9e37  27 60         and [$60]
$0e:9e39  dd f0 08      cmp $08f0,x
$0e:9e3c  a1 3b         lda ($3b,x)
$0e:9e3e  e0 4c f8      cpx #$f84c
$0e:9e41  17 bc         ora [$bc],y
$0e:9e43  07 d7         ora [$d7]
$0e:9e45  73 7a         adc ($7a,s),y
$0e:9e47  ae 7f 65      ldx $657f
$0e:9e4a  d1 ef         cmp ($ef),y
$0e:9e4c  bf ff f7 07   lda $07f7ff,x
$0e:9e50  82 ef f0      brl $8f42
$0e:9e53  5c 1a fd fb   jml $fbfd1a
$0e:9e57  ff bf ff f7   sbc $f7ffbf,x
$0e:9e5b  e7 fe         sbc [$fe]
$0e:9e5d  f8            sed
$0e:9e5e  ff de 1f 83   sbc $831fde,x
$0e:9e62  ff f0 78 7e   sbc $7e78f0,x
$0e:9e66  0f 0f e6 09   ora $09e60f
$0e:9e6a  f2 82         sbc ($82)
$0e:9e6c  7b            tdc
$0e:9e6d  a3 5f         lda $5f,s
$0e:9e6f  18            clc
$0e:9e70  5f 9e 1b c3   eor $c31b9e,x
$0e:9e74  96 7c         stx $7c,y
$0e:9e76  61 bd         adc ($bd,x)
$0e:9e78  b8            clv
$0e:9e79  3c 06 15      bit $1506,x
$0e:9e7c  03 84         ora $84,s
$0e:9e7e  42 60         wdm #$60
$0e:9e80  90 88         bcc $9e0a
$0e:9e82  a4 32         ldy $32
$0e:9e84  23 0c         and $0c,s
$0e:9e86  89 47 24      bit #$2447
$0e:9e89  71 e9         adc ($e9),y
$0e:9e8b  0d 3e 61      ora $613e
$0e:9e8e  27 88         and [$88]
$0e:9e90  6b            rtl
$0e:9e91  f7 15         sbc [$15],y
$0e:9e93  3f 47 9f 99   and $999f47,x
$0e:9e97  c3 d6         cmp $d6,s
$0e:9e99  7c 61 9d      jmp ($9d61,x)
$0e:9e9c  be 37 82      ldx $8237,y
$0e:9e9f  10 9f         bpl $9e40
$0e:9ea1  0a            asl a
$0e:9ea2  42 10         wdm #$10
$0e:9ea4  ba            tsx
$0e:9ea5  10 cc         bpl $9e73
$0e:9ea7  94 72         sty $72,x
$0e:9ea9  45 1e         eor $1e
$0e:9eab  6e 05 fe      ror $fe05
$0e:9eae  6d ff a5      adc $a5ff
$0e:9eb1  ff 2a 9e b9   sbc $b99e2a,x
$0e:9eb5  47 fe         eor [$fe]
$0e:9eb7  ad eb b3      lda $b3eb
$0e:9eba  77 e4         adc [$e4],y
$0e:9ebc  1d f7 40      ora $40f7,x
$0e:9ebf  c0 20 70      cpy #$7020
$0e:9ec2  38            sec
$0e:9ec3  fc 7e 3d      jsr ($3d7e,x)
$0e:9ec6  1e 8e c7      asl $c78e,x
$0e:9ec9  67 73         adc [$73]
$0e:9ecb  b9 bc de      lda $debc,y
$0e:9ece  01 ff         ora ($ff,x)
$0e:9ed0  b3 7f         lda ($7f,s),y
$0e:9ed2  ff ee 80 ff   sbc $ff80ee,x
$0e:9ed6  d5 7f         cmp $7f,x
$0e:9ed8  e2 90         sep #$90
$0e:9eda  f9 b6 45      sbc $45b6,y
$0e:9edd  80 2c         bra $9f0b
$0e:9edf  f0 71         beq $9f52
$0e:9ee1  8b            phb
$0e:9ee2  85 21         sta $21
$0e:9ee4  90 cf         bcc $9eb5
$0e:9ee6  d4 0f         pei ($0f)
$0e:9ee8  59 57 b5      eor $b557,y
$0e:9eeb  ed 22 bf      sbc $bf22
$0e:9eee  a9 27 ee      lda #$ee27
$0e:9ef1  bb            tyx
$0e:9ef2  ff 93 e9 e9   sbc $e9e993,x
$0e:9ef6  bc d8 23      ldy $23d8,x
$0e:9ef9  7c 80 0b      jmp ($0b80,x)
$0e:9efc  58            cli
$0e:9efd  80 4c         bra $9f4b
$0e:9eff  a0 15         ldy #$15
$0e:9f01  bc ed 43      ldy $43ed,x
$0e:9f04  39 da 8e      and $8eda,y
$0e:9f07  5d af 11      eor $11af,x
$0e:9f0a  8f 86 97 af   sta $af9786
$0e:9f0e  76 ff         ror $ff,x
$0e:9f10  cd a0 1e      cmp $1ea0
$0e:9f13  e8            inx
$0e:9f14  07 bc         ora [$bc]
$0e:9f16  40            rti
$0e:9f17  38            sec
$0e:9f18  f8            sed
$0e:9f19  04 3e         tsb $3e
$0e:9f1b  01 08         ora ($08,x)
$0e:9f1d  70 14         bvs $9f33
$0e:9f1f  03 af         ora $af,s
$0e:9f21  e6 17         inc $17
$0e:9f23  86 57         stx $57
$0e:9f25  cd ee e6      cmp $e6ee
$0e:9f28  66 7b         ror $7b
$0e:9f2a  be 7d fd      ldx $fd7d,y
$0e:9f2d  1b            tcs
$0e:9f2e  81 2d         sta ($2d,x)
$0e:9f30  80 5e         bra $9f90
$0e:9f32  c7 c7         cmp [$c7]
$0e:9f34  73 80         adc ($80,s),y
$0e:9f36  58            cli
$0e:9f37  a0 14         ldy #$14
$0e:9f39  08            php
$0e:9f3a  04 fc         tsb $fc
$0e:9f3c  58            cli
$0e:9f3d  35 4b         and $4b,x
$0e:9f3f  e5 8e         sbc $8e
$0e:9f41  b3 6b         lda ($6b,s),y
$0e:9f43  bc e5 be      ldy $bee5,x
$0e:9f46  14 de         trb $de
$0e:9f48  1d f6 03      ora $03f6,x
$0e:9f4b  c7 8c         cmp [$8c]
$0e:9f4d  fd 20 5a      sbc $5a20,x
$0e:9f50  38            sec
$0e:9f51  06 9a         asl $9a
$0e:9f53  01 86         ora ($86,x)
$0e:9f55  13 0c         ora ($0c,s),y
$0e:9f57  fa            plx
$0e:9f58  01 fe         ora ($fe,x)
$0e:9f5a  34 0b         bit $0b,x
$0e:9f5c  4c 36 55      jmp $5536
$0e:9f5f  63 7a         adc $7a,s
$0e:9f61  7c a2 c6      jmp ($c6a2,x)
$0e:9f64  f0 dd         beq $9f43
$0e:9f66  57 be         eor [$be],y
$0e:9f68  d1 28         cmp ($28),y
$0e:9f6a  4c 00 ff      jmp $ff00
$0e:9f6d  10 14         bpl $9f83
$0e:9f6f  00 c5         brk #$c5
$0e:9f71  79 48 f2      adc $f248,y
$0e:9f74  a8            tay
$0e:9f75  f2 ba         sbc ($ba)
$0e:9f77  34 aa         bit $aa,x
$0e:9f79  af 29 32 14   lda $143229
$0e:9f7d  1e 56 d2      asl $d256,x
$0e:9f80  00 9f         brk #$9f
$0e:9f82  cd b5 48      cmp $48b5
$0e:9f85  de 1b 0a      dec $0a1b,x
$0e:9f88  b7 8a         lda [$8a],y
$0e:9f8a  2c af 05      bit $05af
$0e:9f8d  99 6f 6b      sta $6b6f,y
$0e:9f90  67 fa         adc [$fa]
$0e:9f92  46 80         lsr $80
$0e:9f94  1c 32 74      trb $7432
$0e:9f97  84 78         sty $78
$0e:9f99  44 79 5c      mvp $5c,$79
$0e:9f9c  5a            phy
$0e:9f9d  74 c7         stz $c7,x
$0e:9f9f  d4 8f         pei ($8f)
$0e:9fa1  0f 2d ab 63   ora $63ab2d
$0e:9fa5  fa            plx
$0e:9fa6  4f a6 c2 01   eor $01c2a6
$0e:9faa  94 50         sty $50,x
$0e:9fac  0b            phd
$0e:9fad  9c 1f e0      stz $e01f
$0e:9fb0  4d 0f fe      eor $fe0f
$0e:9fb3  aa            tax
$0e:9fb4  ab            plb
$0e:9fb5  66 79         ror $79
$0e:9fb7  93 c4         sta ($c4,s),y
$0e:9fb9  5d e2 4c      eor $4ce2,x
$0e:9fbc  0e 64 02      asl $0264
$0e:9fbf  f1 80         sbc ($80),y
$0e:9fc1  c3 c2         cmp $c2,s
$0e:9fc3  00 60         brk #$60
$0e:9fc5  01 07         ora ($07,x)
$0e:9fc7  71 3f         adc ($3f),y
$0e:9fc9  0c 21 21      tsb $2121
$0e:9fcc  0d ff ff      ora $ffff
$0e:9fcf  a0 7c         ldy #$7c
$0e:9fd1  4b            phk
$0e:9fd2  ff fa 77 c4   sbc $c477fa,x
$0e:9fd6  a3 8b         lda $8b,s
$0e:9fd8  da            phx
$0e:9fd9  21 83         and ($83,x)
$0e:9fdb  1f 85 53 07   ora $075385,x
$0e:9fdf  6c c9 ca      jmp ($cac9)
$0e:9fe2  30 64         bmi $a048
$0e:9fe4  70 b6         bvs $9f9c
$0e:9fe6  10 83         bpl $9f6b
$0e:9fe8  57 6f         eor [$6f],y
$0e:9fea  97 ec         sta [$ec],y
$0e:9fec  32 15         and ($15)
$0e:9fee  ba            tsx
$0e:9fef  46 b2         lsr $b2
$0e:9ff1  4b            phk
$0e:9ff2  56 c9         lsr $c9,x
$0e:9ff4  6a            ror a
$0e:9ff5  f9 3d 5f      sbc $5f3d,y
$0e:9ff8  27 aa         and [$aa]
$0e:9ffa  e5 f0         sbc $f0
$0e:9ffc  f8            sed
$0e:9ffd  5f ff 1b ff   eor $ff1bff,x
$0e:a001  e7 7f         sbc [$7f]
$0e:a003  fd ef ff      sbc $ffef,x
$0e:a006  fd ff ff      sbc $ffff,x
$0e:a009  bf ff f7 ff   lda $fff7ff,x
$0e:a00d  5d aa ed      eor $edaa,x
$0e:a010  28            plp
$0e:a011  54 d8 cd      mvn $cd,$d8
$0e:a014  ce d7 e7      dec $e7d7
$0e:a017  e6 f0         inc $f0
$0e:a019  f5 bf         sbc $bf,x
$0e:a01b  18            clc
$0e:a01c  6f 6e 0d a2   adc $a20d6e
$0e:a020  34 0f         bit $0f,x
$0e:a022  ab            plb
$0e:a023  cf 88 fb c3   cmp $c3fb88
$0e:a027  3a            dec a
$0e:a028  30 cc         bmi $9ff6
$0e:a02a  9c 72 47      stz $4772
$0e:a02d  1e 90 65      asl $6590,x
$0e:a030  68            pla
$0e:a031  76 3a         ror $3a,x
$0e:a033  0f ab 57 15   ora $1557ab
$0e:a037  df 5b fa 83   cmp $83fa5b,x
$0e:a03b  c0 8f         cpy #$8f
$0e:a03d  f0 37         beq $a076
$0e:a03f  f6 08         inc $08,x
$0e:a041  f6 82         inc $82,x
$0e:a043  7d 80 ca      adc $ca80,x
$0e:a046  50 30         bvc $a078
$0e:a048  14 0e         trb $0e
$0e:a04a  04 03         tsb $03
$0e:a04c  81 20         sta ($20,x)
$0e:a04e  54 87 82      mvn $82,$87
$0e:a051  01 2b         ora ($2b,x)
$0e:a053  ee d8 fb      inc $fbd8
$0e:a056  b6 be         ldx $be,y
$0e:a058  ec 8f bb      cpx $bb8f
$0e:a05b  2d ef 59      and $59ef
$0e:a05e  7b            tdc
$0e:a05f  cb            wai
$0e:a060  32 9b         and ($9b)
$0e:a062  2f d6 6e c7   and $c76ed6
$0e:a066  15 f9         ora $f9,x
$0e:a068  3b            tsc
$0e:a069  8a            txa
$0e:a06a  40            rti
$0e:a06b  ef 18 13 bc   sbc $bc1318
$0e:a06f  62 01 b3      per $5373
$0e:a072  6f e6 f7 01   adc $01f7e6
$0e:a076  50 e8         bvc $a060
$0e:a078  57 3f         eor [$3f],y
$0e:a07a  f9 3c 07      sbc $073c,y
$0e:a07d  8b            phb
$0e:a07e  3b            tsc
$0e:a07f  4e e7 57      lsr $57e7
$0e:a082  ff f0 3f e5   sbc $e53ff0,x
$0e:a086  fe 01 2f      inc $2f01,x
$0e:a089  6f 8b fc 1f   adc $1ffc8b
$0e:a08d  e1 31         sbc ($31,x)
$0e:a08f  6f 9b 40 2f   adc $2f409b
$0e:a093  f0 af         beq $a044
$0e:a095  ac 9b eb      ldy $eb9b
$0e:a098  a6 09         ldx $09
$0e:a09a  80 44         bra $a0e0
$0e:a09c  5b            tcd
$0e:a09d  85 ff         sta $ff
$0e:a09f  d6 40         dec $40,x
$0e:a0a1  29 10 09      and #$0910
$0e:a0a4  bc 20 46      ldy $4620,x
$0e:a0a7  02 10         cop #$10
$0e:a0a9  67 97         adc [$97]
$0e:a0ab  12 77         ora ($77)
$0e:a0ad  03 80         ora $80,s
$0e:a0af  77 fb         adc [$fb],y
$0e:a0b1  ed 00 67      sbc $6700
$0e:a0b4  84 c2         sty $c2
$0e:a0b6  01 3f         ora ($3f,x)
$0e:a0b8  68            pla
$0e:a0b9  0b            phd
$0e:a0ba  70 a4         bvs $a060
$0e:a0bc  0c f2 6e      tsb $6ef2
$0e:a0bf  ae 8f bd      ldx $bd8f
$0e:a0c2  03 80         ora $80,s
$0e:a0c4  fb            xce
$0e:a0c5  8c e1 01      sty $01e1
$0e:a0c8  c0 df         cpy #$df
$0e:a0ca  e2 70         sep #$70
$0e:a0cc  1b            tcs
$0e:a0cd  f7 fe         sbc [$fe],y
$0e:a0cf  18            clc
$0e:a0d0  3e 1f f4      rol $f41f,x
$0e:a0d3  02 20         cop #$20
$0e:a0d5  60            rts
$0e:a0d6  13 29         ora ($29,s),y
$0e:a0d8  37 cb         and [$cb],y
$0e:a0da  ef 13 dc d7   sbc $d7dc13
$0e:a0de  b5 d5         lda $d5,x
$0e:a0e0  2f 54 7b 6d   and $6d7b54
$0e:a0e4  52 d9         eor ($d9)
$0e:a0e6  55 b6         eor $b6,x
$0e:a0e8  15 6f         ora $6f,x
$0e:a0ea  14 5a         trb $5a
$0e:a0ec  10 df         bpl $a0cd
$0e:a0ee  18            clc
$0e:a0ef  0a            asl a
$0e:a0f0  08            php
$0e:a0f1  61 28         adc ($28,x)
$0e:a0f3  65 a0         adc $a0
$0e:a0f5  d2 a6         cmp ($a6)
$0e:a0f7  be aa 2d      ldx $2daa,y
$0e:a0fa  fa            plx
$0e:a0fb  83 ce         sta $ce,s
$0e:a0fd  c9 d2         cmp #$d2
$0e:a0ff  22 bc a8 8f   jsl $8fa8bc
$0e:a103  2a            rol a
$0e:a104  cb            wai
$0e:a105  6e da 40      ror $40da
$0e:a108  22 90 0c 04   jsl $040c90
$0e:a10c  03 61         ora $61,s
$0e:a10e  00 4f         brk #$4f
$0e:a110  82 9c b2      brl $53af
$0e:a113  10 0d         bpl $a122
$0e:a115  2d 73 b7      and $b773
$0e:a118  33 cc         and ($cc,s),y
$0e:a11a  57 e8         eor [$e8],y
$0e:a11c  bf cd 65 82   lda $8265cd,x
$0e:a120  35 9a         and $9a,x
$0e:a122  b6 df         ldx $df,y
$0e:a124  78            sei
$0e:a125  df e1 88 43   cmp $4388e1,x
$0e:a129  08            php
$0e:a12a  42 31         wdm #$31
$0e:a12c  08            php
$0e:a12d  fc 02 cb      jsr ($cb02,x)
$0e:a130  00 c1         brk #$c1
$0e:a132  20 86 4b      jsr $4b86
$0e:a135  ce a5 cc      dec $cca5
$0e:a138  24 7e         bit $7e
$0e:a13a  5a            phy
$0e:a13b  df fb 4d 5b   cmp $5b4dfb,x
$0e:a13f  e9 cb         sbc #$cb
$0e:a141  aa            tax
$0e:a142  b0 2c         bcs $a170
$0e:a144  96 43         stx $43,y
$0e:a146  e1 00         sbc ($00,x)
$0e:a148  fe 40 23      inc $2340,x
$0e:a14b  d0 0f         bne $a15c
$0e:a14d  0b            phd
$0e:a14e  80 47         bra $a197
$0e:a150  e5 6f         sbc $6f
$0e:a152  80 6e         bra $a1c2
$0e:a154  bf b1 3c fd   lda $fd3cb1,x
$0e:a158  6b            rtl
$0e:a159  bd 6f f7      lda $f76f,x
$0e:a15c  c4 b6         cpy $b6
$0e:a15e  7c 5a b4      jmp ($b45a,x)
$0e:a161  0b            phd
$0e:a162  af 59 f5 43   lda $43f559
$0e:a166  bc 36 1f      ldy $1f36,x
$0e:a169  fc ef ef      jsr ($efef,x)
$0e:a16c  1a            inc a
$0e:a16d  fe d3 bf      inc $bfd3,x
$0e:a170  f2 cf         sbc ($cf)
$0e:a172  fc a7 ff      jsr ($ffa7,x)
$0e:a175  07 ff         ora [$ff]
$0e:a177  d5 7c         cmp $7c,x
$0e:a179  fc 8f cd      jsr ($cd8f,x)
$0e:a17c  6a            ror a
$0e:a17d  f7 f6         sbc [$f6],y
$0e:a17f  fb            xce
$0e:a180  d2 39         cmp ($39)
$0e:a182  ba            tsx
$0e:a183  3b            tsc
$0e:a184  55 03         eor $03,x
$0e:a186  d7 9a         cmp [$9a],y
$0e:a188  eb            xba
$0e:a189  de 30 f8      dec $f830,x
$0e:a18c  6f ff 73 df   adc $df73ff
$0e:a190  58            cli
$0e:a191  df dc bf f3   cmp $f3bfdc,x
$0e:a195  4f fe 53 ff   eor $ff53fe
$0e:a199  e0 bf         cpx #$bf
$0e:a19b  eb            xba
$0e:a19c  6e d9 ca      ror $cad9
$0e:a19f  bd c7 f1      lda $f1c7,x
$0e:a1a2  33 df         and ($df,s),y
$0e:a1a4  e7 2b         sbc [$2b]
$0e:a1a6  5a            phy
$0e:a1a7  eb            xba
$0e:a1a8  47 57         eor [$57]
$0e:a1aa  67 6f         adc [$6f]
$0e:a1ac  ad c9 ff      lda $ffc9
$0e:a1af  72 1f         adc ($1f)
$0e:a1b1  fc 9b ff      jsr ($ff9b,x)
$0e:a1b4  61 ef         adc ($ef,x)
$0e:a1b6  cc 7f f1      cpy $f17f
$0e:a1b9  9f fc 22 ff   sta $ff22fc,x
$0e:a1bd  80 9f         bra $a15e
$0e:a1bf  ed 6d d3      sbc $d36d
$0e:a1c2  97 f0         sta [$f0],y
$0e:a1c4  67 f9         adc [$f9]
$0e:a1c6  9f dd cf 6a   sta $6acfdd,x
$0e:a1ca  eb            xba
$0e:a1cb  16 d5         asl $d5,x
$0e:a1cd  73 3e         adc ($3e,s),y
$0e:a1cf  fd af 27      sbc $27af,x
$0e:a1d2  7f 09 ff b2   adc $b2ff09,x
$0e:a1d6  7f f0 d7 bc   adc $bcd7f0,x
$0e:a1da  67 ff         adc [$ff]
$0e:a1dc  31 ff         and ($ff),y
$0e:a1de  88            dey
$0e:a1df  ff a0 3f c7   sbc $c73fa0,x
$0e:a1e3  58            cli
$0e:a1e4  7f f5 f5 0b   adc $0bf5f5,x
$0e:a1e8  29 cc         and #$cc
$0e:a1ea  8e 22 6f      stx $6f22
$0e:a1ed  17 40         ora [$40],y
$0e:a1ef  72 a0         adc ($a0)
$0e:a1f1  17 9c         ora [$9c],y
$0e:a1f3  16 1a         asl $1a,x
$0e:a1f5  10 83         bpl $a17a
$0e:a1f7  04 08         tsb $08
$0e:a1f9  3a            dec a
$0e:a1fa  0b            phd
$0e:a1fb  89 7f         bit #$7f
$0e:a1fd  e2 51         sep #$51
$0e:a1ff  d1 e4         cmp ($e4),y
$0e:a201  be 04 78      ldx $7804,y
$0e:a204  7f a7 69 10   adc $1069a7,x
$0e:a208  94 60         sty $60,x
$0e:a20a  ea            nop
$0e:a20b  9a            txs
$0e:a20c  b8            clv
$0e:a20d  86 0e         stx $0e
$0e:a20f  d9 93 4f      cmp $4f93,y
$0e:a212  82 7c 2d      brl $cf91
$0e:a215  8a            txa
$0e:a216  01 ed         ora ($ed,x)
$0e:a218  49 7d         eor #$7d
$0e:a21a  ff fb df fe   sbc $fedffb,x
$0e:a21e  a3 ae         lda $ae,s
$0e:a220  e6 f2         inc $f2
$0e:a222  36 bb         rol $bb,x
$0e:a224  7d 67 f7      adc $f767,x
$0e:a227  69 4b         adc #$4b
$0e:a229  3e 1b a0      rol $a01b,x
$0e:a22c  66 f0         ror $f0
$0e:a22e  0a            asl a
$0e:a22f  44 02 04      mvp $04,$02
$0e:a232  8a            txa
$0e:a233  08            php
$0e:a234  01 30         ora ($30,x)
$0e:a236  38            sec
$0e:a237  13 fd         ora ($fd,s),y
$0e:a239  bd df 83      lda $83df,x
$0e:a23c  7f cf 4f 9a   adc $9a4fcf,x
$0e:a240  e1 80         sbc ($80,x)
$0e:a242  9f 35 42 ff   sta $ff4235,x
$0e:a246  ff e0 7f f1   sbc $f17fe0,x
$0e:a24a  1f fd f7 fd   ora $fdf7fd,x
$0e:a24e  cc 8e 50      cpy $508e
$0e:a251  e0 5f         cpx #$5f
$0e:a253  fc b6 5f      jsr ($5fb6,x)
$0e:a256  e4 0b         cpx $0b
$0e:a258  73 3b         adc ($3b,s),y
$0e:a25a  e9 5f         sbc #$5f
$0e:a25c  dd e1 92      cmp $92e1,x
$0e:a25f  6f 06 03 01   adc $010306
$0e:a263  ff cd 7f ff   sbc $ff7fcd,x
$0e:a267  a8            tay
$0e:a268  e0 ff         cpx #$ff
$0e:a26a  ef 3f fb ff   sbc $fffb3f
$0e:a26e  fb            xce
$0e:a26f  fc 1b e0      jsr ($e01b,x)
$0e:a272  fd 1b ff      sbc $ff1b,x
$0e:a275  76 ff         ror $ff,x
$0e:a277  81 80         sta ($80,x)
$0e:a279  ef 28 5d 79   sbc $795d28
$0e:a27d  46 fe         lsr $fe
$0e:a27f  80 1b         bra $a29c
$0e:a281  06 f8         asl $f8
$0e:a283  39 41 ca      and $ca41,y
$0e:a286  1f ef fe f7   ora $f7feef,x
$0e:a28a  ff d7 04 08   sbc $0804d7,x
$0e:a28e  24 3f         bit $3f
$0e:a290  74 4f         stz $4f,x
$0e:a292  a5 2f         lda $2f
$0e:a294  c1 5f         cmp ($5f,x)
$0e:a296  d4 ca         pei ($ca)
$0e:a298  f9 57 e7      sbc $e757,y
$0e:a29b  ca            dex
$0e:a29c  0a            asl a
$0e:a29d  c8            iny
$0e:a29e  12 1d         ora ($1d)
$0e:a2a0  41 30         eor ($30,x)
$0e:a2a2  82 52 fd      brl $9ff7
$0e:a2a5  81 e0         sta ($e0,x)
$0e:a2a7  df b2 57 3d   cmp $3d57b2,x
$0e:a2ab  0d ff 1b      ora $1bff
$0e:a2ae  53 c6         eor ($c6,s),y
$0e:a2b0  54 8a a1      mvn $a1,$8a
$0e:a2b3  5a            phy
$0e:a2b4  dd 5f bf      cmp $bf5f,x
$0e:a2b7  f8            sed
$0e:a2b8  1f fe 30 14   ora $1430fe,x
$0e:a2bc  3a            dec a
$0e:a2bd  cf fe b4 14   cmp $14b4fe
$0e:a2c1  34 5f         bit $5f,x
$0e:a2c3  fd bf 61      sbc $61bf,x
$0e:a2c6  b3 a7         lda ($a7,s),y
$0e:a2c8  73 37         adc ($37,s),y
$0e:a2ca  b5 3d         lda $3d,x
$0e:a2cc  96 a6         stx $a6,y
$0e:a2ce  df a6 b7 75   cmp $75b7a6,x
$0e:a2d2  6b            rtl
$0e:a2d3  9d b9 45      sta $45b9,x
$0e:a2d6  3f ff b1 ff   and $ffb1ff,x
$0e:a2da  d0 bf         bne $a29b
$0e:a2dc  f4 df fe      pea $fedf
$0e:a2df  47 fd         eor [$fd]
$0e:a2e1  96 fc         stx $fc,y
$0e:a2e3  e9 3f         sbc #$3f
$0e:a2e5  7d 8f be      adc $be8f,x
$0e:a2e8  06 fd         asl $fd
$0e:a2ea  53 f9         eor ($f9,s),y
$0e:a2ec  c7 3c         cmp [$3c]
$0e:a2ee  56 ee         lsr $ee,x
$0e:a2f0  fc e7 33      jsr ($33e7,x)
$0e:a2f3  32 cb         and ($cb)
$0e:a2f5  55 7e         eor $7e,x
$0e:a2f7  bc aa df      ldy $dfaa,x
$0e:a2fa  0c c4 33      tsb $33c4
$0e:a2fd  ff fc 83 ff   sbc $ff83fc,x
$0e:a301  66 ff         ror $ff
$0e:a303  da            phx
$0e:a304  7f fa af fe   adc $feaffa,x
$0e:a308  93 ff         sta ($ff,s),y
$0e:a30a  03 80         ora $80,s
$0e:a30c  4d 69 15      eor $1569
$0e:a30f  a9 8d         lda #$8d
$0e:a311  56 07         lsr $07,x
$0e:a313  2a            rol a
$0e:a314  a3 55         lda $55,s
$0e:a316  21 ba         and ($ba,x)
$0e:a318  98            tya
$0e:a319  d7 4e         cmp [$4e],y
$0e:a31b  6b            rtl
$0e:a31c  00 fe         brk #$fe
$0e:a31e  40            rti
$0e:a31f  3f ec 10 52   and $5210ec,x
$0e:a323  84 07         sty $07
$0e:a325  ff 02 ff c1   sbc $c1ff02,x
$0e:a329  2f f0 8b fe   and $fe8bf0
$0e:a32d  b7 a7         lda [$a7],y
$0e:a32f  55 f6         eor $f6,x
$0e:a331  6a            ror a
$0e:a332  ab            plb
$0e:a333  35 5d         and $5d,x
$0e:a335  66 a6         ror $a6
$0e:a337  ef d6 ac c9   sbc $c9acd6
$0e:a33b  b1 3d         lda ($3d),y
$0e:a33d  9d 74 a3      sta $a374,x
$0e:a340  f1 03         sbc ($03),y
$0e:a342  f0 61         beq $a3a5
$0e:a344  f8            sed
$0e:a345  10 3c         bpl $a383
$0e:a347  03 98         ora $98,s
$0e:a349  24 10         bit $10
$0e:a34b  0b            phd
$0e:a34c  8c 02 e7      sty $e702
$0e:a34f  00 00         brk #$00
$0e:a351  20 80 3b      jsr $3b80
$0e:a354  fd fd 95      sbc $95fd,x
$0e:a357  fc 04 1e      jsr ($1e04,x)
$0e:a35a  21 01         and ($01,x)
$0e:a35c  82 40 3c      brl $df9f
$0e:a35f  5c 18 86 a2   jml $a28618
$0e:a363  51 70         eor ($70),y
$0e:a365  a4 fe         ldy $fe
$0e:a367  70 31         bvs $a39a
$0e:a369  ff 07 9f f1   sbc $f19f07,x
$0e:a36d  f9 ff 47      sbc $47ff,y
$0e:a370  3f f0 ef fc   and $fceff0,x
$0e:a374  9b            txy
$0e:a375  bf 76 c7 fd   lda $fdc776,x
$0e:a379  a1 f0         lda ($f0,x)
$0e:a37b  0d 6d 17      ora $176d
$0e:a37e  93 45         sta ($45,s),y
$0e:a380  e8            inx
$0e:a381  dc 7f 35      jml [$357f]
$0e:a384  ce ec 93      dec $93ec
$0e:a387  db            stp
$0e:a388  16 ff         asl $ff,x
$0e:a38a  c2 bf         rep #$bf
$0e:a38c  f8            sed
$0e:a38d  9b            txy
$0e:a38e  b7 26         lda [$26],y
$0e:a390  6d d1 97      adc $97d1
$0e:a393  7e 60 dd      ror $dd60,x
$0e:a396  d9 17 b6      cmp $b617,y
$0e:a399  25 ff         and $ff
$0e:a39b  80 12         bra $a3af
$0e:a39d  c2 ab         rep #$ab
$0e:a39f  ee 95 cf      inc $cf95
$0e:a3a2  a3 51         lda $51,s
$0e:a3a4  d8            cld
$0e:a3a5  ac 5a 4b      ldy $4b5a
$0e:a3a8  26 c5         rol $c5
$0e:a3aa  7a            ply
$0e:a3ab  ea            nop
$0e:a3ac  bf ad 5f 50   lda $505fad,x
$0e:a3b0  98            tya
$0e:a3b1  1c 0f ff      trb $ff0f
$0e:a3b4  83 ff         sta $ff,s
$0e:a3b6  e8            inx
$0e:a3b7  ff f6 3f f1   sbc $f13ff6,x
$0e:a3bb  42 59         wdm #$59
$0e:a3bd  7f e0 30 08   adc $0830e0,x
$0e:a3c1  3c 12 0d      bit $0d12,x
$0e:a3c4  04 95         tsb $95
$0e:a3c6  c2 67         rep #$67
$0e:a3c8  f0 9b         beq $a365
$0e:a3ca  ad 07 a7      lda $a707
$0e:a3cd  83 e1         sta $e1,s
$0e:a3cf  e0 e0 70      cpx #$70e0
$0e:a3d2  18            clc
$0e:a3d3  1a            inc a
$0e:a3d4  04 20         tsb $20
$0e:a3d6  53 69         eor ($69,s),y
$0e:a3d8  14 da         trb $da
$0e:a3da  6d 3e 9a      adc $9a3e
$0e:a3dd  5f 2a 17 ca   eor $ca172a,x
$0e:a3e1  06 02         asl $02
$0e:a3e3  01 c0         ora ($c0,x)
$0e:a3e5  c0 68 12      cpy #$1268
$0e:a3e8  21 e0         and ($e0,x)
$0e:a3ea  c8            iny
$0e:a3eb  78            sei
$0e:a3ec  34 1d         bit $1d,x
$0e:a3ee  0c 47 c3      tsb $c347
$0e:a3f1  a1 e8         lda ($e8,x)
$0e:a3f3  47 85         eor [$85]
$0e:a3f5  02 00         cop #$00
$0e:a3f7  ee 28 82      inc $8228
$0e:a3fa  88            dey
$0e:a3fb  61 0a         adc ($0a,x)
$0e:a3fd  61 a2         adc ($a2,x)
$0e:a3ff  f1 e0         sbc ($e0),y
$0e:a401  d0 5c         bne $a45f
$0e:a403  ee 7b eb      inc $eb7b
$0e:a406  fe 99 4f      inc $4f99,x
$0e:a409  65 33         adc $33
$0e:a40b  eb            xba
$0e:a40c  55 d7         eor $d7,x
$0e:a40e  eb            xba
$0e:a40f  ff 9c 7f ff   sbc $ff7f9c,x
$0e:a413  1f fb 01 2c   ora $2c01fb,x
$0e:a417  4c 20 61      jmp $6120
$0e:a41a  0c 01 2c      tsb $2c01
$0e:a41d  66 47         ror $47
$0e:a41f  70 84         bvs $a3a5
$0e:a421  e0 1a 63      cpx #$631a
$0e:a424  02 81         cop #$81
$0e:a426  71 78         adc ($78),y
$0e:a428  f5 6f         sbc $6f,x
$0e:a42a  ee a2 fe      inc $fea2
$0e:a42d  61 0f         adc ($0f,x)
$0e:a42f  b7 fe         lda [$fe],y
$0e:a431  fe e2 1f      inc $1fe2,x
$0e:a434  ea            nop
$0e:a435  f8            sed
$0e:a436  4d 65 b1      eor $b165
$0e:a439  bc d2 39      ldy $39d2,x
$0e:a43c  0d 32 a6      ora $a632
$0e:a43f  73 35         adc ($35,s),y
$0e:a441  37 fa         and [$fa],y
$0e:a443  8f c7 43 53   sta $5343c7
$0e:a447  83 7f         sta $7f,s
$0e:a449  e6 ee         inc $ee
$0e:a44b  23 99         and $99,s
$0e:a44d  92 c4         sta ($c4)
$0e:a44f  4e 10 cf      lsr $cf10
$0e:a452  fd cb 1b      sbc $1bcb,x
$0e:a455  ed b9 4d      sbc $4db9
$0e:a458  e7 12         sbc [$12]
$0e:a45a  b9 67 ab      lda $ab67,y
$0e:a45d  db            stp
$0e:a45e  5a            phy
$0e:a45f  fa            plx
$0e:a460  e9 bf 34      sbc #$34bf
$0e:a463  7d c1 ac      adc $acc1,x
$0e:a466  9b            txy
$0e:a467  e1 d0         sbc ($d0,x)
$0e:a469  ff c4 0d 46   sbc $460dc4,x
$0e:a46d  cd 08 44      cmp $4408
$0e:a470  12 3b         ora ($3b)
$0e:a472  05 9b         ora $9b
$0e:a474  43 a2         eor $a2,s
$0e:a476  33 39         and ($39,s),y
$0e:a478  b4 56         ldy $56,x
$0e:a47a  2b            pld
$0e:a47b  0d 86 40      ora $4086
$0e:a47e  ef 70 48 1c   sbc $1c4870
$0e:a482  3e 05 1f      rol $1f05,x
$0e:a485  80 cf         bra $a456
$0e:a487  e1 93         sbc ($93,x)
$0e:a489  f8            sed
$0e:a48a  44 fc 82      mvp $82,$fc
$0e:a48d  10 08         bpl $a497
$0e:a48f  7c 02 ff      jmp ($ff02,x)
$0e:a492  aa            tax
$0e:a493  ad 71 e7      lda $e771
$0e:a496  fc a9 fe      jsr ($fea9,x)
$0e:a499  c1 bc         cmp ($bc,x)
$0e:a49b  31 6f         and ($6f),y
$0e:a49d  4c af a9      jmp $a9af
$0e:a4a0  7f c0 69 52   adc $5269c0,x
$0e:a4a4  00 60         brk #$60
$0e:a4a6  14 78         trb $78
$0e:a4a8  29 02 2d      and #$2d02
$0e:a4ab  00 95         brk #$95
$0e:a4ad  93 41         sta ($41,s),y
$0e:a4af  48            pha
$0e:a4b0  30 13         bmi $a4c5
$0e:a4b2  8a            txa
$0e:a4b3  c0 cf 26      cpy #$26cf
$0e:a4b6  6f f4 7b bc   adc $bc7bf4
$0e:a4ba  c9 e6 08      cmp #$08e6
$0e:a4bd  fe 87 c7      inc $c787,x
$0e:a4c0  f1 f8         sbc ($f8),y
$0e:a4c2  7e 9d 4e      ror $4e9d,x
$0e:a4c5  c7 a1         cmp [$a1]
$0e:a4c7  e8            inx
$0e:a4c8  68            pla
$0e:a4c9  62 1e 8d      per $31ea
$0e:a4cc  47 12         eor [$12]
$0e:a4ce  ab            plb
$0e:a4cf  eb            xba
$0e:a4d0  f7 ff         sbc [$ff],y
$0e:a4d2  ee ff f9      inc $f9ff
$0e:a4d5  5f fe 3a 0a   eor $0a3afe,x
$0e:a4d9  18            clc
$0e:a4da  3f fe 06 08   and $0806fe,x
$0e:a4de  1e 6d 3e      asl $3e6d,x
$0e:a4e1  37 9f         and [$9f],y
$0e:a4e3  c5 63         cmp $63
$0e:a4e5  e9 dc fc      sbc #$fcdc
$0e:a4e8  fb            xce
$0e:a4e9  48            pha
$0e:a4ea  23 f1         and $f1,s
$0e:a4ec  ec fe f6      cpx $f6fe
$0e:a4ef  7f 2f fe df   adc $dffe2f,x
$0e:a4f3  fd 56 ff      sbc $ff56,x
$0e:a4f6  d4 bf         pei ($bf)
$0e:a4f8  f5 7f         sbc $7f,x
$0e:a4fa  f5 b8         sbc $b8,x
$0e:a4fc  42 ff         wdm #$ff
$0e:a4fe  ee af fb      inc $fbaf
$0e:a501  7f ee ff 7f   adc $7fffee,x
$0e:a505  62 3c be      per $6344
$0e:a508  10 0a         bpl $a514
$0e:a50a  c5 82         cmp $82
$0e:a50c  97 50         sta [$50],y
$0e:a50e  cb            wai
$0e:a50f  f6 36         inc $36,x
$0e:a511  5f da 3e e1   eor $e13eda,x
$0e:a515  1e 51 0f      asl $0f51,x
$0e:a518  06 03         asl $03
$0e:a51a  f1 a0         sbc ($a0),y
$0e:a51c  fd c8 bf      sbc $bfc8,x
$0e:a51f  ac d0 15      ldy $15d0
$0e:a522  8c 62 01      sty $0162
$0e:a525  2c 9c 4b      bit $4b9c
$0e:a528  23 14         and $14,s
$0e:a52a  eb            xba
$0e:a52b  c7 2f         cmp [$2f]
$0e:a52d  77 8b         adc [$8b],y
$0e:a52f  97 43         sta [$43],y
$0e:a531  eb            xba
$0e:a532  51 f1         eor ($f1),y
$0e:a534  08            php
$0e:a535  88            dey
$0e:a536  82 21 30      brl $d55a
$0e:a539  88            dey
$0e:a53a  4d 26 17      eor $1726
$0e:a53d  49 87 c2      eor #$c287
$0e:a540  41 e0         eor ($e0,x)
$0e:a542  a0 1c 42      ldy #$421c
$0e:a545  0d 06 84      ora $8406
$0e:a548  42 22         wdm #$22
$0e:a54a  b3 59         lda ($59,s),y
$0e:a54c  57 fe         eor [$fe],y
$0e:a54e  2b            pld
$0e:a54f  ff d0 6f fd   sbc $fd6fd0,x
$0e:a553  7e c3 f8      ror $f8c3,x
$0e:a556  c0 20 f0      cpy #$f020
$0e:a559  08            php
$0e:a55a  52 94         eor ($94)
$0e:a55c  a0 14 08      ldy #$0814
$0e:a55f  04 4e         tsb $4e
$0e:a561  01 b1         ora ($b1,x)
$0e:a563  98            tya
$0e:a564  ce a7 56      dec $56a7
$0e:a567  fb            xce
$0e:a568  fe db ff      inc $ffdb,x
$0e:a56b  55 ff         eor $ff,x
$0e:a56d  4c bc f9      jmp $f9bc
$0e:a570  4f 0c db c1   eor $c1db0c
$0e:a574  ce c0 71      dec $71c0
$0e:a577  55 00         eor $00,x
$0e:a579  a5 13         lda $13
$0e:a57b  08            php
$0e:a57c  46 22         lsr $22
$0e:a57e  11 e8         ora ($e8),y
$0e:a580  a4 7e         ldy $7e
$0e:a582  2d c4 fc      and $fcc4
$0e:a585  72 fe         adc ($fe)
$0e:a587  9a            txs
$0e:a588  5d d4 8f      eor $8fd4,x
$0e:a58b  79 45 fd      adc $fd45,y
$0e:a58e  6b            rtl
$0e:a58f  ae 3d 99      ldx $993d
$0e:a592  3d fb 03      and $03fb,x
$0e:a595  04 80         tsb $80
$0e:a597  42 e0         wdm #$e0
$0e:a599  14 58         trb $58
$0e:a59b  05 0e         ora $0e
$0e:a59d  01 05         ora ($05,x)
$0e:a59f  80 63         bra $a604
$0e:a5a1  a0 1d 88      ldy #$881d
$0e:a5a4  05 fa         ora $fa
$0e:a5a6  01 d5         ora ($d5,x)
$0e:a5a8  9f 6d ac 5b   sta $5bac6d,x
$0e:a5ac  4b            phk
$0e:a5ad  05 47         ora $47
$0e:a5af  83 29         sta $29,s
$0e:a5b1  c4 e5         cpy $e5
$0e:a5b3  f3 d6         sbc ($d6,s),y
$0e:a5b5  af ee 56 d5   lda $d556ee
$0e:a5b9  c1 80         cmp ($80,x)
$0e:a5bb  67 62         adc [$62]
$0e:a5bd  99 f8 a4      sta $a4f8,y
$0e:a5c0  fa            plx
$0e:a5c1  21 76         and ($76,x)
$0e:a5c3  90 58         bcc $a61d
$0e:a5c5  60            rts
$0e:a5c6  10 28         bpl $a5f0
$0e:a5c8  06 54         asl $54
$0e:a5ca  24 10         bit $10
$0e:a5cc  1d 56 d3      ora $d356,x
$0e:a5cf  5f b4 a9 7a   eor $7aa9b4,x
$0e:a5d3  2b            pld
$0e:a5d4  9a            txs
$0e:a5d5  8d 6d 67      sta $676d
$0e:a5d8  b1 32         lda ($32),y
$0e:a5da  d1 59         cmp ($59),y
$0e:a5dc  be 50 0a      ldx $0a50,y
$0e:a5df  5c 0a 97 03   jml $03970a
$0e:a5e3  8b            phb
$0e:a5e4  c0 aa f0      cpy #$f0aa
$0e:a5e7  4d 34 13      eor $1334
$0e:a5ea  9b            txy
$0e:a5eb  08            php
$0e:a5ec  cc 99 c3      cpy $c399
$0e:a5ef  01 40         ora ($40,x)
$0e:a5f1  d8            cld
$0e:a5f2  44 2d 9c      mvp $9c,$2d
$0e:a5f5  c8            iny
$0e:a5f6  9f 8e 19 b1   sta $b1198e,x
$0e:a5fa  8b            phb
$0e:a5fb  57 22         eor [$22],y
$0e:a5fd  f3 99         sbc ($99,s),y
$0e:a5ff  91 a4         sta ($a4),y
$0e:a601  b2 10         lda ($10)
$0e:a603  0f 67 03 e7   ora $e70367
$0e:a607  e0 f4 e8      cpx #$e8f4
$0e:a60a  3d 14 87      and $8714,x
$0e:a60d  58            cli
$0e:a60e  19 c8 1e      ora $1ec8,y
$0e:a611  7c 0e 01      jmp ($010e,x)
$0e:a614  30 22         bmi $a638
$0e:a616  17 0c         ora [$0c],y
$0e:a618  40            rti
$0e:a619  3d c2 e1      and $e1c2,x
$0e:a61c  00 f0         brk #$f0
$0e:a61e  40            rti
$0e:a61f  2e 00 40      rol $4000
$0e:a622  f4 6e 7f      pea $7f6e
$0e:a625  3b            tsc
$0e:a626  af dc 6b ff   lda $ff6bdc
$0e:a62a  0c f9 ed      tsb $edf9
$0e:a62d  29 9d b9      and #$b99d
$0e:a630  ec 97 b5      cpx $b597
$0e:a633  17 82         ora [$82],y
$0e:a635  41 a0         eor ($a0,x)
$0e:a637  09 f0 33      ora #$33f0
$0e:a63a  84 32         sty $32
$0e:a63c  01 b3         ora ($b3,x)
$0e:a63e  80 70         bra $a6b0
$0e:a640  a0 12 58      ldy #$5812
$0e:a643  06 ab         asl $ab
$0e:a645  43 4e         eor $4e,s
$0e:a647  e3 e5         sbc $e5,s
$0e:a649  78            sei
$0e:a64a  72 df         adc ($df)
$0e:a64c  5e 53 3f      lsr $3f53,x
$0e:a64f  ee fa d4      inc $d4fa
$0e:a652  7d d5 2d      adc $2dd5,x
$0e:a655  6d 7a 11      adc $117a
$0e:a658  38            sec
$0e:a659  84 4f         sty $4f
$0e:a65b  22 11 48 05   jsl $054811
$0e:a65f  82 01 0a      brl $b063
$0e:a662  80 44         bra $a6a8
$0e:a664  60            rts
$0e:a665  15 28         ora $28,x
$0e:a667  04 1c         tsb $1c
$0e:a669  de 30 f8      dec $f830,x
$0e:a66c  54 16 1f      mvn $1f,$16
$0e:a66f  0d 86 c3      ora $c386
$0e:a672  cf 26 6f 28   cmp $286f26
$0e:a676  54 3c ea      mvn $ea,$3c
$0e:a679  07 20         ora [$20]
$0e:a67b  3c a0 60      bit $60a0,x
$0e:a67e  03 01         ora $01,s
$0e:a680  e0 d0 50      cpx #$50d0
$0e:a683  3c 16 0b      bit $0b16,x
$0e:a686  07 81         ora [$81]
$0e:a688  32 68         and ($68)
$0e:a68a  f2 d0         sbc ($d0)
$0e:a68c  78            sei
$0e:a68d  12 a0         ora ($a0)
$0e:a68f  92 04         sta ($04)
$0e:a691  ca            dex
$0e:a692  07 c2         ora [$c2]
$0e:a694  07 00         ora [$00]
$0e:a696  87 c0         sta [$c0]
$0e:a698  23 d0         and $d0,s
$0e:a69a  19 c4 1e      ora $1ec4,y
$0e:a69d  61 0f         adc ($0f,x)
$0e:a69f  b8            clv
$0e:a6a0  2e 84 3e      rol $3e84
$0e:a6a3  50 28         bvc $a6cd
$0e:a6a5  0c 22 0f      tsb $0f22
$0e:a6a8  13 42         ora ($42,s),y
$0e:a6aa  04 7e         tsb $7e
$0e:a6ac  1f 3f 93 c7   ora $c7933f,x
$0e:a6b0  fd de ed      sbc $edde,x
$0e:a6b3  77 bb         adc [$bb],y
$0e:a6b5  ab            plb
$0e:a6b6  ff 6a 0c fe   sbc $fe0c6a,x
$0e:a6ba  7f ff af fb   adc $fbafff,x
$0e:a6be  fd f7 ff      sbc $fff7,x
$0e:a6c1  ff bb 2b 84   sbc $842bbb,x
$0e:a6c5  0c 03 50      tsb $5003
$0e:a6c8  26 1b         rol $1b
$0e:a6ca  09 c6 e2      ora #$e2c6
$0e:a6cd  99 ec a7      sta $a7ec,y
$0e:a6d0  7b            tdc
$0e:a6d1  83 e1         sta $e1,s
$0e:a6d3  1c 80 49      trb $4980
$0e:a6d6  e3 17         sbc $17,s
$0e:a6d8  b8            clv
$0e:a6d9  e7 92         sbc [$92]
$0e:a6db  77 b9         adc [$b9],y
$0e:a6dd  a3 f5         lda $f5,s
$0e:a6df  a3 59         lda $59,s
$0e:a6e1  2e f0 7c      rol $7cf0
$0e:a6e4  5e 21 3f      lsr $3f21,x
$0e:a6e7  80 5f         bra $a748
$0e:a6e9  e0 1f f0      cpx #$f01f
$0e:a6ec  38            sec
$0e:a6ed  48            pha
$0e:a6ee  41 43         eor ($43,x)
$0e:a6f0  b5 a5         lda $a5,x
$0e:a6f2  56 34         lsr $34,x
$0e:a6f4  9f 09 45 07   sta $074509,x
$0e:a6f8  63 d0         adc $d0,s
$0e:a6fa  90 7a         bcc $a776
$0e:a6fc  a3 5f         lda $5f,s
$0e:a6fe  78            sei
$0e:a6ff  7c 6a 0c      jmp ($0c6a,x)
$0e:a702  08            php
$0e:a703  0f e4 0f f1   ora $f10fe4
$0e:a707  07 f8         ora [$f8]
$0e:a709  c3 be         cmp $be,s
$0e:a70b  10 ff         bpl $a70c
$0e:a70d  d4 14         pei ($14)
$0e:a70f  10 0b         bpl $a71c
$0e:a711  50 98         bvc $a6ab
$0e:a713  4f ed 57 5d   eor $5d57ed
$0e:a717  2e ea af      rol $afea
$0e:a71a  e8            inx
$0e:a71b  8d f9 3d      sta $3df9
$0e:a71e  51 5e         eor ($5e),y
$0e:a720  ff 87 f7 ff   sbc $fff787,x
$0e:a724  e0 40 31      cpx #$3140
$0e:a727  50 0a         bvc $a733
$0e:a729  2c 02 2f      bit $2f02
$0e:a72c  00 8d         brk #$8d
$0e:a72e  c0 3d 50      cpy #$503d
$0e:a731  08            php
$0e:a732  f4 00 98      pea $9800
$0e:a735  17 7f         ora [$7f],y
$0e:a737  c6 3e         dec $3e
$0e:a739  e1 98         sbc ($98,x)
$0e:a73b  b3 d8         lda ($d8,s),y
$0e:a73d  b3 d9         lda ($d9,s),y
$0e:a73f  0b            phd
$0e:a740  85 2b         sta $2b
$0e:a742  95 b6         sta $b6,x
$0e:a744  db            stp
$0e:a745  da            phx
$0e:a746  7f f0 78 06   adc $0678f0,x
$0e:a74a  3e 01 98      rol $9801,x
$0e:a74d  80 58         bra $a7a7
$0e:a74f  4c 03 35      jmp $3503
$0e:a752  80 52         bra $a7a6
$0e:a754  09 83 9e      ora #$9e83
$0e:a757  a0 5b f8      ldy #$f85b
$0e:a75a  39 6c 05      and $056c,y
$0e:a75d  3a            dec a
$0e:a75e  01 2f         ora ($2f,x)
$0e:a760  94 75         sty $75,x
$0e:a762  7a            ply
$0e:a763  1b            tcs
$0e:a764  2f 85 57 6b   and $6b5785
$0e:a768  bf 8f 4f a5   lda $a54f8f,x
$0e:a76c  d7 f8         cmp [$f8],y
$0e:a76e  b7 fe         lda [$fe],y
$0e:a770  9d d7 83      sta $83d7,x
$0e:a773  cb            wai
$0e:a774  e0 b0 f8      cpx #$f8b0
$0e:a777  15 2a         ora $2a,x
$0e:a779  01 b9         ora ($b9,x)
$0e:a77b  e3 db         sbc $db,s
$0e:a77d  6a            ror a
$0e:a77e  1f dc 05 de   ora $de05dc,x
$0e:a782  01 25         ora ($25,x)
$0e:a784  80 51         bra $a7d7
$0e:a786  a0 16 e9      ldy #$e916
$0e:a789  45 52         eor $52
$0e:a78b  a1 38         lda ($38,x)
$0e:a78d  80 6b         bra $a7fa
$0e:a78f  e1 b7         sbc ($b7,x)
$0e:a791  fb            xce
$0e:a792  ef fe ef ff   sbc $ffeffe
$0e:a796  92 ff         sta ($ff)
$0e:a798  e8            inx
$0e:a799  dd 7a 36      cmp $367a,x
$0e:a79c  be 09 ba      ldx $ba09,y
$0e:a79f  e2 d9         sep #$d9
$0e:a7a1  ef 33 48 3c   sbc $3c4833
$0e:a7a5  ca            dex
$0e:a7a6  07 77         ora [$77]
$0e:a7a8  81 dd         sta ($dd,x)
$0e:a7aa  a0 7b         ldy #$7b
$0e:a7ac  48            pha
$0e:a7ad  1d b6 05      ora $05b6,x
$0e:a7b0  3a            dec a
$0e:a7b1  80 61         bra $a814
$0e:a7b3  a0 1f         ldy #$1f
$0e:a7b5  89 87 f1      bit #$f187
$0e:a7b8  88            dey
$0e:a7b9  17 46         ora [$46],y
$0e:a7bb  38            sec
$0e:a7bc  ed 3f b6      sbc $b63f
$0e:a7bf  ca            dex
$0e:a7c0  af 76 cd 7e   lda $7ecd76
$0e:a7c4  c5 ff         cmp $ff
$0e:a7c6  e8            inx
$0e:a7c7  ff f8 57 ff   sbc $ff57f8,x
$0e:a7cb  01 ff         ora ($ff,x)
$0e:a7cd  ca            dex
$0e:a7ce  7a            ply
$0e:a7cf  ed 3d 69      sbc $693d
$0e:a7d2  14 03         trb $03
$0e:a7d4  02 4c         cop #$4c
$0e:a7d6  17 12         ora [$12],y
$0e:a7d8  45 20         eor $20
$0e:a7da  12 98         ora ($98)
$0e:a7dc  05 4a         ora $4a
$0e:a7de  e7 c8         sbc [$c8]
$0e:a7e0  f4 ec 3e      pea $3eec
$0e:a7e3  3a            dec a
$0e:a7e4  af 5e 77 ff   lda $ff775e
$0e:a7e8  3d ff d6      and $d6ff,x
$0e:a7eb  bf fa af fe   lda $feaffa,x
$0e:a7ef  32 01         and ($01)
$0e:a7f1  16 80         asl $80,x
$0e:a7f3  43 9d         eor $9d,s
$0e:a7f5  42 e2         wdm #$e2
$0e:a7f7  6e c4 93      ror $93c4
$0e:a7fa  e9 0a bd      sbc #$bd0a
$0e:a7fd  61 6b         adc ($6b,x)
$0e:a7ff  fa            plx
$0e:a800  08            php
$0e:a801  6f ca 4f d8   adc $d84fca
$0e:a805  a7 ec         lda [$ec]
$0e:a807  2a            rol a
$0e:a808  fa            plx
$0e:a809  8e c4 03      stx $03c4
$0e:a80c  e9 00 bd      sbc #$bd00
$0e:a80f  40            rti
$0e:a810  2b            pld
$0e:a811  f0 08         beq $a81b
$0e:a813  6c 02 4f      jmp ($4f02)
$0e:a816  00 a7         brk #$a7
$0e:a818  c0 2a         cpy #$2a
$0e:a81a  ee 25 81      inc $8125
$0e:a81d  89 82 05      bit #$0582
$0e:a820  36 84         rol $84,x
$0e:a822  ea            nop
$0e:a823  ea            nop
$0e:a824  9d f9 00      sta $00f9,x
$0e:a827  bd e0 13      lda $13e0,x
$0e:a82a  68            pla
$0e:a82b  06 ae         asl $ae
$0e:a82d  01 df         ora ($df,x)
$0e:a82f  13 04         ora ($04,s),y
$0e:a831  f2 2f         sbc ($2f)
$0e:a833  77 e5         adc [$e5],y
$0e:a835  4f ea da 9d   eor $9ddaea
$0e:a839  fd 03 c1      sbc $c103,x
$0e:a83c  1f eb cf e5   ora $e5cfeb,x
$0e:a840  5f f8 1c 06   eor $061cf8,x
$0e:a844  11 00         ora ($00),y
$0e:a846  e0 40         cpx #$40
$0e:a848  2a            rol a
$0e:a849  d0 0d         bne $a858
$0e:a84b  fc 03 c0      jsr ($c003,x)
$0e:a84e  62 17 40      per $e868
$0e:a851  43 cd         eor $cd,s
$0e:a853  e4 8a         cpx $8a
$0e:a855  03 78         ora $78,s
$0e:a857  c3 60         cmp $60,s
$0e:a859  f1 78         sbc ($78),y
$0e:a85b  fc 7e 3a      jsr ($3a7e,x)
$0e:a85e  70 73         bvs $a8d3
$0e:a860  98            tya
$0e:a861  c5 4f         cmp $4f
$0e:a863  a1 1f         lda ($1f,x)
$0e:a865  f0 23         beq $a88a
$0e:a867  c8            iny
$0e:a868  b0 08         bcs $a872
$0e:a86a  f1 b0         sbc ($b0),y
$0e:a86c  70 3a         bvs $a8a8
$0e:a86e  1f 0f 85 c1   ora $c1850f,x
$0e:a872  20 e9 31      jsr $31e9
$0e:a875  a8            tay
$0e:a876  27 43         and [$43]
$0e:a878  e1 f8         sbc ($f8,x)
$0e:a87a  83 ab         sta $ab,s
$0e:a87c  c3 f4         cmp $f4,s
$0e:a87e  b0 15         bcs $a895
$0e:a880  78            sei
$0e:a881  7c 21 eb      jmp ($eb21,x)
$0e:a884  90 2c         bcc $a8b2
$0e:a886  87 26         sta [$26]
$0e:a888  6f 53 97 ec   adc $ec9753
$0e:a88c  61 fa         adc ($fa,x)
$0e:a88e  d8            cld
$0e:a88f  bd ce 1f      lda $1fce,x
$0e:a892  a7 8f         lda [$8f]
$0e:a894  d2 e7         cmp ($e7)
$0e:a896  f4 f9 ff      pea $fff9
$0e:a899  df f7 db bf   cmp $bfdbf7,x
$0e:a89d  fd 62 ff      sbc $ff62,x
$0e:a8a0  5c ef f7 8b   jml $8bf7ef
$0e:a8a4  fd d3 ff      sbc $ffd3,x
$0e:a8a7  fa            plx
$0e:a8a8  3f fd 4f 4f   and $4f4ffd,x
$0e:a8ac  f7 53         sbc [$53],y
$0e:a8ae  bd a3 43      lda $43a3,x
$0e:a8b1  2f 9f e3 f1   and $f1e39f
$0e:a8b5  f4 ba 7e      pea $7eba
$0e:a8b8  8f 47 53 a9   sta $a95347
$0e:a8bc  ce 58 22      dec $2258
$0e:a8bf  d9 8c 7e      cmp $7e8c,y
$0e:a8c2  22 e7 74 d5   jsl $d574e7
$0e:a8c6  ff 2a da 8d   sbc $8dda2a,x
$0e:a8ca  c5 03         cmp $03
$0e:a8cc  f8            sed
$0e:a8cd  6c 0f e5      jmp ($e50f)
$0e:a8d0  83 fd         sta $fd,s
$0e:a8d2  70 ff         bvs $a8d3
$0e:a8d4  e2 3f         sep #$3f
$0e:a8d6  f0 00         beq $a8d8
$0e:a8d8  30 7f         bmi $a959
$0e:a8da  a0 1f         ldy #$1f
$0e:a8dc  87 f8         sta [$f8]
$0e:a8de  70 f8         bvs $a8d8
$0e:a8e0  70 98         bvs $a87a
$0e:a8e2  7e a3 b1      ror $b1a3,x
$0e:a8e5  41 e0         eor ($e0,x)
$0e:a8e7  9b            txy
$0e:a8e8  03 21         ora $21,s
$0e:a8ea  f0 90         beq $a87c
$0e:a8ec  c8            iny
$0e:a8ed  6b            rtl
$0e:a8ee  5f ae 1c f1   eor $f11cae,x
$0e:a8f2  74 0a         stz $0a,x
$0e:a8f4  f0 e0         beq $a8d6
$0e:a8f6  cf 80 e0 b9   cmp $b9e080
$0e:a8fa  09 0f         ora #$0f
$0e:a8fc  7b            tdc
$0e:a8fd  f5 05         sbc $05,x
$0e:a8ff  ef fc 3c 7d   sbc $7d3cfc
$0e:a903  4d ff b2      eor $b2ff
$0e:a906  af ac dd 71   lda $71ddac
$0e:a90a  2d 5d 4c      and $4c5d
$0e:a90d  b5 a3         lda $a3,x
$0e:a90f  f5 a4         sbc $a4,x
$0e:a911  5a            phy
$0e:a912  12 e8         ora ($e8)
$0e:a914  11 c1         ora ($c1),y
$0e:a916  1e f0 4f      asl $4ff0,x
$0e:a919  b8            clv
$0e:a91a  04 92         tsb $92
$0e:a91c  ea            nop
$0e:a91d  ca            dex
$0e:a91e  f4 f5 f9      pea $f9f5
$0e:a921  7e ff f7      ror $f7ff,x
$0e:a924  ff 2b 05 f7   sbc $f7052b,x
$0e:a928  fb            xce
$0e:a929  df ef ff 80   cmp $80ffef,x
$0e:a92d  c5 ff         cmp $ff
$0e:a92f  a0 17         ldy #$17
$0e:a931  8e 05 ff      stx $ff05
$0e:a934  90 01         bcc $a937
$0e:a936  86 9f         stx $9f
$0e:a938  f0 cf         beq $a909
$0e:a93a  f8            sed
$0e:a93b  2b            pld
$0e:a93c  7e 4d 9f      ror $9f4d,x
$0e:a93f  3a            dec a
$0e:a940  fb            xce
$0e:a941  82 dd d9      brl $8321
$0e:a944  ab            plb
$0e:a945  fa            plx
$0e:a946  0e fc 80      asl $80fc
$0e:a949  0e 10 ef      asl $ef10
$0e:a94c  89 14         bit #$14
$0e:a94e  08            php
$0e:a94f  a1 17         lda ($17,x)
$0e:a951  f0 5f         beq $a9b2
$0e:a953  f0 17         beq $a96c
$0e:a955  7c 05 eb      jmp ($eb05,x)
$0e:a958  01 cf         ora ($cf,x)
$0e:a95a  98            tya
$0e:a95b  77 a4         adc [$a4],y
$0e:a95d  3d fb 8e      and $8efb,x
$0e:a960  fe a3 ae      inc $aea3,x
$0e:a963  a8            tay
$0e:a964  fb            xce
$0e:a965  a6 3c         ldx $3c
$0e:a967  e9 8f         sbc #$8f
$0e:a969  01 fc         ora ($fc,x)
$0e:a96b  1f f4 48 7d   ora $7d48f4,x
$0e:a96f  c0 e3         cpy #$e3
$0e:a971  77 80         adc [$80],y
$0e:a973  28            plp
$0e:a974  c1 4e         cmp ($4e,x)
$0e:a976  0f e0 85 7d   ora $7d85e0
$0e:a97a  7f 70 5f 6c   adc $6c5f70,x
$0e:a97e  cf bd 31 cd   cmp $cd31bd
$0e:a982  5d 75 75      eor $7575,x
$0e:a985  44 c8 53      mvp $53,$c8
$0e:a988  e6 04         inc $04
$0e:a98a  30 97         bmi $a923
$0e:a98c  f4 0b c6      pea $c60b
$0e:a98f  07 15         ora [$15]
$0e:a991  18            clc
$0e:a992  5c e0 1f bf   jml $bf1fe0
$0e:a996  de ff 7f      dec $7fff,x
$0e:a999  77 ff         adc [$ff],y
$0e:a99b  e5 ee         sbc $ee
$0e:a99d  f2 ff         sbc ($ff)
$0e:a99f  ff 76 7b 97   sbc $977b76,x
$0e:a9a3  af f7 a7 f0   lda $f0a7f7
$0e:a9a7  43 11         eor $11,s
$0e:a9a9  c2 0c         rep #$0c
$0e:a9ab  cf 20 77 8d   cmp $8d7720
$0e:a9af  c2 e1         rep #$e1
$0e:a9b1  50 b8         bvc $a96b
$0e:a9b3  76 3f         ror $3f,x
$0e:a9b5  1f 8d 47 ff   ora $ff478d,x
$0e:a9b9  5f 8c ea 3b   eor $3bea8c,x
$0e:a9bd  d6 a1         dec $a1,x
$0e:a9bf  d8            cld
$0e:a9c0  ec 6a 35      cpx $356a
$0e:a9c3  18            clc
$0e:a9c4  fd 7f cf      sbc $cf7f,x
$0e:a9c7  e1 00         sbc ($00,x)
$0e:a9c9  07 cb         ora [$cb]
$0e:a9cb  e0 21         cpx #$21
$0e:a9cd  f0 f0         beq $a9bf
$0e:a9cf  7e 7d e0      ror $e07d,x
$0e:a9d2  e0 f6         cpx #$f6
$0e:a9d4  a0 50         ldy #$50
$0e:a9d6  3c 9e 4d      bit $4d9e,x
$0e:a9d9  77 bb         adc [$bb],y
$0e:a9db  f5 be         sbc $be,x
$0e:a9dd  17 c6         ora [$c6],y
$0e:a9df  93 49         sta ($49,s),y
$0e:a9e1  aa            tax
$0e:a9e2  d5 6e         cmp $6e,x
$0e:a9e4  b7 5d         lda [$5d],y
$0e:a9e6  eb            xba
$0e:a9e7  0e b6 a5      asl $a5b6
$0e:a9ea  56 d4         lsr $d4,x
$0e:a9ec  eb            xba
$0e:a9ed  ea            nop
$0e:a9ee  1b            tcs
$0e:a9ef  5a            phy
$0e:a9f0  57 7e         eor [$7e],y
$0e:a9f2  41 7b         eor ($7b,x)
$0e:a9f4  c2 6f         rep #$6f
$0e:a9f6  e8            inx
$0e:a9f7  19 e8 06      ora $06e8,y
$0e:a9fa  b6 01         ldx $01,y
$0e:a9fc  56 80         lsr $80,x
$0e:a9fe  6b            rtl
$0e:a9ff  e0 1b         cpx #$1b
$0e:aa01  58            cli
$0e:aa02  07 7e         ora [$7e]
$0e:aa04  01 7b         ora ($7b,x)
$0e:aa06  80 6f         bra $aa77
$0e:aa08  e0 11         cpx #$11
$0e:aa0a  f8            sed
$0e:aa0b  dc 5e 37      jml [$375e]
$0e:aa0e  1f 8f c5 4d   ora $4dc58f,x
$0e:aa12  e0 74         cpx #$74
$0e:aa14  18            clc
$0e:aa15  d4 7e         pei ($7e)
$0e:aa17  20 73 03      jsr $0373
$0e:aa1a  90 44         bcc $aa60
$0e:aa1c  ce 60 74      dec $7460
$0e:aa1f  8f 82 3c 36   sta $363c82
$0e:aa23  08            php
$0e:aa24  f1 49         sbc ($49),y
$0e:aa26  d2 4a         cmp ($4a)
$0e:aa28  e6 7f         inc $7f
$0e:aa2a  fb            xce
$0e:aa2b  0f ff 8f ff   ora $ff8fff
$0e:aa2f  fa            plx
$0e:aa30  ff ff 7f fa   sbc $fa7fff,x
$0e:aa34  76 ce         ror $ce,x
$0e:aa36  08            php
$0e:aa37  df 05 e8 48   cmp $48e805,x
$0e:aa3b  7f f4 1f ff   adc $ff1ff4,x
$0e:aa3f  0d 68 4e      ora $4e68
$0e:aa42  d0 5b         bne $aa9f
$0e:aa44  83 b4         sta $b4,s
$0e:aa46  20 30 06      jsr $0630
$0e:aa49  78            sei
$0e:aa4a  40            rti
$0e:aa4b  da            phx
$0e:aa4c  43 06         eor $06,s
$0e:aa4e  80 c3         bra $aa13
$0e:aa50  20 71 d8      jsr $d871
$0e:aa53  3d ec 3c      and $3cec,x
$0e:aa56  6c f0 68      jmp ($68f0)
$0e:aa59  1c 1e 10      trb $101e
$0e:aa5c  2e 08 fe      rol $fe08
$0e:aa5f  77 fd         adc [$fd],y
$0e:aa61  b5 fb         lda $fb,x
$0e:aa63  56 ff         lsr $ff,x
$0e:aa65  91 4f         sta ($4f),y
$0e:aa67  fe ae ab      inc $abae,x
$0e:aa6a  77 c4         adc [$c4],y
$0e:aa6c  e7 6a         sbc [$6a]
$0e:aa6e  7f 69 cb 34   adc $34cb69,x
$0e:aa72  21 0c         and ($0c,x)
$0e:aa74  e0 ff         cpx #$ff
$0e:aa76  00 ca         brk #$ca
$0e:aa78  07 fc         ora [$fc]
$0e:aa7a  93 fe         sta ($fe,s),y
$0e:aa7c  20 ff 8f      jsr $8fff
$0e:aa7f  ac 2e 35      ldy $352e
$0e:aa82  06 86         asl $86
$0e:aa84  c0 e1         cpy #$e1
$0e:aa86  50 68         bvc $aaf0
$0e:aa88  4c 1e 29      jmp $291e
$0e:aa8b  0c a4 ce      tsb $cea4
$0e:aa8e  74 16         stz $16,x
$0e:aa90  06 60         asl $60
$0e:aa92  47 a0         eor [$a0]
$0e:aa94  2d e0 87      and $87e0
$0e:aa97  08            php
$0e:aa98  86 39         stx $39
$0e:aa9a  03 bc         ora $bc,s
$0e:aa9c  c1 bc         cmp ($bc,x)
$0e:aa9e  11 fe         ora ($fe),y
$0e:aaa0  46 52         lsr $52
$0e:aaa2  59 f0 ee      eor $eef0,y
$0e:aaa5  4c 3f 15      jmp $153f
$0e:aaa8  09 47 c3      ora #$c347
$0e:aaab  71 e0         adc ($e0),y
$0e:aaad  e4 6c         cpx $6c
$0e:aaaf  2d 1d 08      and $081d
$0e:aab2  e7 82         sbc [$82]
$0e:aab4  f9 80 20      sbc $2080,y
$0e:aab7  87 e2         sta [$e2]
$0e:aab9  00 45         brk #$45
$0e:aabb  6f ef fa eb   adc $ebfaef
$0e:aabf  76 ff         ror $ff,x
$0e:aac1  ff 3b 5f dd   sbc $dd5f3b,x
$0e:aac5  3f 67 bf e1   and $e1bf67,x
$0e:aac9  ee f4 fe      inc $fef4
$0e:aacc  df 96 68 62   cmp $626896,x
$0e:aad0  00 57         brk #$57
$0e:aad2  b8            clv
$0e:aad3  e0 5e         cpx #$5e
$0e:aad5  38            sec
$0e:aad6  16 0e         asl $0e,x
$0e:aad8  06 82         asl $82
$0e:aada  81 e0         sta ($e0,x)
$0e:aadc  80 1d         bra $aafb
$0e:aade  43 81         eor $81,s
$0e:aae0  00 c0         brk #$c0
$0e:aae2  11 87         ora ($87),y
$0e:aae4  e1 00         sbc ($00,x)
$0e:aae6  3b            tsc
$0e:aae7  82 0d 28      brl $d2f7
$0e:aaea  07 c1         ora [$c1]
$0e:aaec  ed ad c3      sbc $c3ad
$0e:aaef  ff bf df a4   sbc $a4dfbf,x
$0e:aaf3  07 ff         ora [$ff]
$0e:aaf5  7d fe f7      adc $f7fe,x
$0e:aaf8  fb            xce
$0e:aaf9  ff ef fa f0   sbc $f0faef,x
$0e:aafd  19 a1 40      ora $40a1,y
$0e:ab00  66 0b         ror $0b
$0e:ab02  34 20         bit $20,x
$0e:ab04  5f f9 03 30   eor $3003f9,x
$0e:ab08  40            rti
$0e:ab09  85 fc         sta $fc
$0e:ab0b  04 84         tsb $84
$0e:ab0d  0c 18 30      tsb $3018
$0e:ab10  7f 84 3d 76   adc $763d84,x
$0e:ab14  0a            asl a
$0e:ab15  50 80         bvc $aa97
$0e:ab17  b0 06         bcs $ab1f
$0e:ab19  06 c4         asl $c4
$0e:ab1b  18            clc
$0e:ab1c  3b            tsc
$0e:ab1d  20 61 ea      jsr $ea61
$0e:ab20  40            rti
$0e:ab21  67 c4         adc [$c4]
$0e:ab23  06 03         asl $03
$0e:ab25  03 81         ora $81,s
$0e:ab27  43 99         eor $99,s
$0e:ab29  f2 d7         sbc ($d7)
$0e:ab2b  28            plp
$0e:ab2c  06 bf         asl $bf
$0e:ab2e  b1 8f         lda ($8f),y
$0e:ab30  ff ea 3b 15   sbc $153bea,x
$0e:ab34  0b            phd
$0e:ab35  84 82         sty $82
$0e:ab37  40            rti
$0e:ab38  cf 4e c7 61   cmp $61c74e
$0e:ab3c  22 0f f0 a8   jsl $a8f00f
$0e:ab40  54 1e ed      mvn $ed,$1e
$0e:ab43  f9 88 fe      sbc $fe88,y
$0e:ab46  62 ff fc      per $a848
$0e:ab49  95 ee         sta $ee,x
$0e:ab4b  ab            plb
$0e:ab4c  7b            tdc
$0e:ab4d  99 4f e6      sta $e64f,y
$0e:ab50  b3 f0         lda ($f0,s),y
$0e:ab52  c0 c5         cpy #$c5
$0e:ab54  a2 11         ldx #$11
$0e:ab56  18            clc
$0e:ab57  8e 4b 25      stx $254b
$0e:ab5a  51 aa         eor ($aa),y
$0e:ab5c  cd a6 d3      cmp $d3a6
$0e:ab5f  19 ac ca      ora $caac,y
$0e:ab62  65 35         adc $35
$0e:ab64  9a            txs
$0e:ab65  e2 6d         sep #$6d
$0e:ab67  ff 5f 7f d7   sbc $d77f5f,x
$0e:ab6b  9f 75 f7 dd   sta $ddf775,x
$0e:ab6f  69 e3         adc #$e3
$0e:ab71  12 18         ora ($18)
$0e:ab73  84 66         sty $66
$0e:ab75  13 e1         ora ($e1,s),y
$0e:ab77  f0 f0         beq $ab69
$0e:ab79  78            sei
$0e:ab7a  36 12         rol $12,x
$0e:ab7c  12 90         ora ($90)
$0e:ab7e  42 08         wdm #$08
$0e:ab80  4f 18 74 3a   eor $3a7418
$0e:ab84  3e 55 19      rol $1955,x
$0e:ab87  54 aa 7f      mvn $7f,$aa
$0e:ab8a  3f 48 81 3d   and $3d8148,x
$0e:ab8e  a2 b1         ldx #$b1
$0e:ab90  59 f9 64      eor $64f9,y
$0e:ab93  25 49         and $49
$0e:ab95  10 9a         bpl $ab31
$0e:ab97  cb            wai
$0e:ab98  a5 53         lda $53
$0e:ab9a  59 44 fe      eor $fe44,y
$0e:ab9d  49 3f         eor #$3f
$0e:ab9f  39 86 93      and $9386,y
$0e:aba2  7f ac df f9   adc $f9dfac,x
$0e:aba6  bf e7 41 90   lda $9041e7,x
$0e:abaa  20 53 7f      jsr $7f53
$0e:abad  a0 44         ldy #$44
$0e:abaf  87 ff         sta [$ff]
$0e:abb1  c1 f8         cmp ($f8,x)
$0e:abb3  dc 7e 3f      jml [$3f7e]
$0e:abb6  17 8e         ora [$8e],y
$0e:abb8  c6 e3         dec $e3
$0e:abba  b1 78         lda ($78),y
$0e:abbc  47 8d         eor [$8d]
$0e:abbe  e3 e0         sbc $e0,s
$0e:abc0  90 14         bcc $abd6
$0e:abc2  80 fe         bra $abc2
$0e:abc4  2b            pld
$0e:abc5  1f 8c c2 48   ora $48c28c,x
$0e:abc9  11 e1         ora ($e1),y
$0e:abcb  f0 b8         beq $ab85
$0e:abcd  23 c2         and $c2,s
$0e:abcf  97 7c         sta [$7c],y
$0e:abd1  ca            dex
$0e:abd2  e5 a1         sbc $a1
$0e:abd4  30 aa         bmi $ab80
$0e:abd6  15 ae         ora $ae,x
$0e:abd8  5d 37 95      eor $9537,x
$0e:abdb  cb            wai
$0e:abdc  62 91 7c      per $2870
$0e:abdf  2e 5a ff      rol $ff5a
$0e:abe2  80 cb         bra $abaf
$0e:abe4  da            phx
$0e:abe5  21 7f         and ($7f,x)
$0e:abe7  4b            phk
$0e:abe8  5e 52 7f      lsr $7f52,x
$0e:abeb  c0 97         cpy #$97
$0e:abed  f4 22 fe      pea $fe22
$0e:abf0  86 08         stx $08
$0e:abf2  76 e7         ror $e7,x
$0e:abf4  7a            ply
$0e:abf5  fb            xce
$0e:abf6  fd ff ff      sbc $ffff,x
$0e:abf9  bb            tyx
$0e:abfa  00 87         brk #$87
$0e:abfc  fe fb fd      inc $fdfb,x
$0e:abff  ef f7 ff df   sbc $dffff7
$0e:ac03  fa            plx
$0e:ac04  24 fe         bit $fe
$0e:ac06  01 ff         ora ($ff,x)
$0e:ac08  70 a4         bvs $abae
$0e:ac0a  0b            phd
$0e:ac0b  ff 20 71 0c   sbc $0c7120,x
$0e:ac0f  06 01         asl $01
$0e:ac11  06 80         asl $80
$0e:ac13  c2 60         rep #$60
$0e:ac15  b0 98         bcs $abaf
$0e:ac17  33 c4         and ($c4,s),y
$0e:ac19  1d e0 fa      ora $fae0,x
$0e:ac1c  27 78         and [$78]
$0e:ac1e  41 e0         eor ($e0,x)
$0e:ac20  10 d8         bpl $abfa
$0e:ac22  14 3c         trb $3c
$0e:ac24  00 2f         brk #$2f
$0e:ac26  94 a0         sty $a0,x
$0e:ac28  f0 65         beq $ac8f
$0e:ac2a  51 ed         eor ($ed),y
$0e:ac2c  05 82         ora $82
$0e:ac2e  89 c7 c9      bit #$c9c7
$0e:ac31  7b            tdc
$0e:ac32  bd 97 ca      lda $ca97,x
$0e:ac35  8c c6 c1      sty $c1c6
$0e:ac38  20 e0 cf      jsr $cfe0
$0e:ac3b  a7 dc         lda [$dc]
$0e:ac3d  1f 04 7f 8f   ora $8f7f04,x
$0e:ac41  38            sec
$0e:ac42  ff 40 7f 90   sbc $907f40,x
$0e:ac46  3b            tsc
$0e:ac47  8c 3a c1      sty $c13a
$0e:ac4a  1f 7d 1b e8   ora $e81b7d,x
$0e:ac4e  60            rts
$0e:ac4f  50 28         bvc $ac79
$0e:ac51  a4 4a         ldy $4a
$0e:ac53  b1 48         lda ($48),y
$0e:ac55  d0 e8         bne $ac3f
$0e:ac57  05 ef         ora $ef
$0e:ac59  01 88         ora ($88,x)
$0e:ac5b  c3 e8         cmp $e8,s
$0e:ac5d  f3 fc         sbc ($fc,s),y
$0e:ac5f  f5 fd         sbc $fd,x
$0e:ac61  f4 10 31      pea $3110
$0e:ac64  c0 45         cpy #$45
$0e:ac66  2a            rol a
$0e:ac67  15 0e         ora $0e,x
$0e:ac69  0d 0a 13      ora $130a
$0e:ac6c  17 96         ora [$96],y
$0e:ac6e  d6 f5         dec $f5,x
$0e:ac70  97 d2         sta [$d2],y
$0e:ac72  29 44 e1      and #$e144
$0e:ac75  f4 f9 fc      pea $fcf9
$0e:ac78  f3 ff         sbc ($ff,s),y
$0e:ac7a  e7 fc         sbc [$fc]
$0e:ac7c  67 fc         adc [$fc]
$0e:ac7e  17 ac         ora [$ac],y
$0e:ac80  07 7d         ora [$7d]
$0e:ac82  ae 1f fd      ldx $fd1f
$0e:ac85  fe fd ae      inc $aefd,x
$0e:ac88  0d b0 39      ora $39b0
$0e:ac8b  81 cc         sta ($cc,x)
$0e:ac8d  1b            tcs
$0e:ac8e  61 9f         adc ($9f,x)
$0e:ac90  3f 89 f8 b7   and $b7f889,x
$0e:ac94  e8            inx
$0e:ac95  21 3f         and ($3f,x)
$0e:ac97  02 1c         cop #$1c
$0e:ac99  0e 02 91      asl $9102
$0e:ac9c  f4 b1 36      pea $36b1
$0e:ac9f  c3 df         cmp $df,s
$0e:aca1  ef 6d 87 3f   sbc $3f876d
$0e:aca5  9f ff f7 fd   sta $fdf7ff,x
$0e:aca9  f9 ff 3c      sbc $3cff,y
$0e:acac  7f c6 1f f9   adc $f91fc6,x
$0e:acb0  83 ee         sta $ee,s
$0e:acb2  60            rts
$0e:acb3  f3 d8         sbc ($d8,s),y
$0e:acb5  3c ee 0e      bit $0eee,x
$0e:acb8  d7 0f         cmp [$0f],y
$0e:acba  bf df e7 f3   lda $f3e7df,x
$0e:acbe  f0 f8         beq $acb8
$0e:acc0  78            sei
$0e:acc1  2c 70 c0      bit $c070
$0e:acc4  f1 60         sbc ($60),y
$0e:acc6  bc 38 1f      ldy $1f38,x
$0e:acc9  dd 2c 3e      cmp $3e2c,x
$0e:accc  36 10         rol $10,x
$0e:acce  7d f8 3e      adc $3ef8,x
$0e:acd1  7f 0f 9f 11   adc $119f0f,x
$0e:acd5  cf ee 74 d8   cmp $d874ee
$0e:acd9  20 c1 0f      jsr $0fc1
$0e:acdc  5f 8d c6 1d   eor $1dc68d,x
$0e:ace0  9e 0b 9c      stz $9c0b,x
$0e:ace3  36 18         rol $18,x
$0e:ace5  0d 03 b0      ora $b003
$0e:ace8  2b            pld
$0e:ace9  b9 5b 6f      lda $6f5b,y
$0e:acec  32 6b         and ($6b)
$0e:acee  d9 92 e7      cmp $e792,y
$0e:acf1  64 b8         stz $b8
$0e:acf3  98            tya
$0e:acf4  2e 06 0b      rol $0b06
$0e:acf7  c0 a2         cpy #$a2
$0e:acf9  c0 44         cpy #$44
$0e:acfb  e0 00         cpx #$00
$0e:acfd  5b            tcd
$0e:acfe  0f fa e3 fe   ora $fee3fa
$0e:ad02  9c ff a2      stz $a2ff
$0e:ad05  70 c8         bvs $accf
$0e:ad07  bc 24 1f      ldy $1f24,x
$0e:ad0a  43 10         eor $10,s
$0e:ad0c  80 c0         bra $acce
$0e:ad0e  43 f5         eor $f5,s
$0e:ad10  cb            wai
$0e:ad11  fe 79 7b      inc $7b79,x
$0e:ad14  7c df bf      jmp ($bfdf,x)
$0e:ad17  bf 6f fb ff   lda $fffb6f,x
$0e:ad1b  fe af 7f      inc $7faf,x
$0e:ad1e  af d7 ff 7d   lda $7dffd7
$0e:ad22  c0 e0         cpy #$e0
$0e:ad24  31 c3         and ($c3),y
$0e:ad26  8b            phb
$0e:ad27  c5 d3         cmp $d3
$0e:ad29  e9 ff 7f      sbc #$7fff
$0e:ad2c  bb            tyx
$0e:ad2d  d5 f8         cmp $f8,x
$0e:ad2f  78            sei
$0e:ad30  1b            tcs
$0e:ad31  ad da fc      lda $fcda
$0e:ad34  3a            dec a
$0e:ad35  bf fb 87 fe   lda $fe87fb,x
$0e:ad39  d9 ff f4      cmp $f4ff,y
$0e:ad3c  df ff 5e fd   cmp $fd5eff,x
$0e:ad40  f7 ec         sbc [$ec],y
$0e:ad42  b4 0b         ldy $0b,x
$0e:ad44  f0 28         beq $ad6e
$0e:ad46  05 fe         ora $fe
$0e:ad48  e1 4f         sbc ($4f,x)
$0e:ad4a  a6 50         ldx $50
$0e:ad4c  68            pla
$0e:ad4d  3e 0f 06      rol $060f,x
$0e:ad50  e3 71         sbc $71,s
$0e:ad52  ae f7 7b      ldx $7bf7
$0e:ad55  3f f6 6f fc   and $fc6ff6,x
$0e:ad59  b3 ff         lda ($ff,s),y
$0e:ad5b  e7 ff         sbc [$ff]
$0e:ad5d  cb            wai
$0e:ad5e  bb            tyx
$0e:ad5f  f6 7e         inc $7e,x
$0e:ad61  fe bb ff      inc $ffbb,x
$0e:ad64  a7 5f         lda [$5f]
$0e:ad66  87 83         sta [$83]
$0e:ad68  ff 60 ff c8   sbc $c8ff60,x
$0e:ad6c  10 61         bpl $adcf
$0e:ad6e  df 80 57 e8   cmp $e85780,x
$0e:ad72  13 f9         ora ($f9,s),y
$0e:ad74  02 2c         cop #$2c
$0e:ad76  25 1f         and $1f
$0e:ad78  88            dey
$0e:ad79  ff be b1 ef   sbc $efb1be,x
$0e:ad7d  97 7f         sta [$7f],y
$0e:ad7f  e3 1f         sbc $1f,s
$0e:ad81  7a            ply
$0e:ad82  ff be 57 f7   sbc $f757be,x
$0e:ad86  8e fb ff      stx $fffb
$0e:ad89  12 8f         ora ($8f)
$0e:ad8b  7c 3f dd      jmp ($dd3f,x)
$0e:ad8e  48            pha
$0e:ad8f  ff ca 3e f1   sbc $f13eca,x
$0e:ad93  0f 7d 3f e7   ora $e73f7d
$0e:ad97  23 f4         and $f4,s
$0e:ad99  87 87         sta [$87]
$0e:ad9b  01 80         ora ($80,x)
$0e:ad9d  bc 7e 20      ldy $207e,x
$0e:ada0  df e8 17 f3   cmp $f317e8,x
$0e:ada4  fd fe dd      sbc $ddfe,x
$0e:ada7  7f aa df e5   adc $e5dfaa,x
$0e:adab  79 de 3c      adc $3cde,y
$0e:adae  cb            wai
$0e:adaf  50 80         bvc $ad31
$0e:adb1  2e 47 75      rol $7547
$0e:adb4  12 89         ora ($89)
$0e:adb6  44 19 e3      mvp $e3,$19
$0e:adb9  38            sec
$0e:adba  69 8c a2      adc #$a28c
$0e:adbd  71 44         adc ($44),y
$0e:adbf  be 51 2d      ldx $2d51,y
$0e:adc2  95 4b         sta $4b,x
$0e:adc4  63 3d         adc $3d,s
$0e:adc6  e5 14         sbc $14
$0e:adc8  47 48         eor [$48]
$0e:adca  55 1d         eor $1d,x
$0e:adcc  61 0f         adc ($0f,x)
$0e:adce  80 46         bra $ae16
$0e:add0  20 d1 68      jsr $68d1
$0e:add3  54 6e 0f      mvn $0f,$6e
$0e:add6  0c 81 c1      tsb $c181
$0e:add9  a0 30         ldy #$30
$0e:addb  58            cli
$0e:addc  14 0c         trb $0c
$0e:adde  3e 10 f8      rol $f810,x
$0e:ade1  0c 7c 02      tsb $027c
$0e:ade4  10 00         bpl $ade6
$0e:ade6  20 3b c2      jsr $c23b
$0e:ade9  0e 09 18      asl $1809
$0e:adec  1c ce 1f      trb $1fce
$0e:adef  14 86         trb $86
$0e:adf1  42 23         wdm #$23
$0e:adf3  11 58         ora ($58),y
$0e:adf5  6c a2 31      jmp ($31a2)
$0e:adf8  50 98         bvc $ad92
$0e:adfa  dc e7 fc      jml [$fce7]
$0e:adfd  89 c4 fe      bit #$fec4
$0e:ae00  01 1c         ora ($1c,x)
$0e:ae02  81 c6         sta ($c6,x)
$0e:ae04  20 f1 d8      jsr $d8f1
$0e:ae07  14 e2         trb $e2
$0e:ae09  0f 71 87 5f   ora $5f8771
$0e:ae0d  e0 1f         cpx #$1f
$0e:ae0f  88            dey
$0e:ae10  3c 17 07      bit $0717,x
$0e:ae13  89 87 c2      bit #$c287
$0e:ae16  71 d0         adc ($d0),y
$0e:ae18  4c 3f 02      jmp $023f
$0e:ae1b  81 61         sta ($61,x)
$0e:ae1d  90 ee         bcc $ae0d
$0e:ae1f  33 17         and ($17,s),y
$0e:ae21  59 15 ef      eor $ef15,y
$0e:ae24  f9 77 fc      sbc $fc77,y
$0e:ae27  5d bf 17      eor $17bf,x
$0e:ae2a  9f f4 ff ff   sta $fffff4,x
$0e:ae2e  1e ff e1      asl $e1ff,x
$0e:ae31  c5 61         cmp $61
$0e:ae33  ff d8 fe b9   sbc $b9fed8,x
$0e:ae37  75 4c         adc $4c,x
$0e:ae39  bf a2 b3 df   lda $dfb3a2,x
$0e:ae3d  d8            cld
$0e:ae3e  e4 27         cpx $27
$0e:ae40  f6 df         inc $df,x
$0e:ae42  25 63         and $63
$0e:ae44  99 84 f2      sta $f284,y
$0e:ae47  40            rti
$0e:ae48  24 0b         bit $0b
$0e:ae4a  f0 30         beq $ae7c
$0e:ae4c  0d 7b c3      ora $c37b
$0e:ae4f  b0 e1         bcs $ae32
$0e:ae51  d8            cld
$0e:ae52  f0 ff         beq $ae53
$0e:ae54  38            sec
$0e:ae55  7e 7f 3f      ror $3f7f,x
$0e:ae58  bf df 9b c2   lda $c29bdf,x
$0e:ae5c  3e 74 2e      rol $2e74,x
$0e:ae5f  fe 73 bf      inc $bf73,x
$0e:ae62  47 ff         eor [$ff]
$0e:ae64  ff f3 fd fc   sbc $fcfdf3,x
$0e:ae68  f9 fc 2f      sbc $2ffc,y
$0e:ae6b  e8            inx
$0e:ae6c  41 9f         eor ($9f,x)
$0e:ae6e  f7 e7         sbc [$e7],y
$0e:ae70  9d f2 68      sta $68f2,x
$0e:ae73  7b            tdc
$0e:ae74  fd fd fe      sbc $fefd,x
$0e:ae77  fa            plx
$0e:ae78  3c 39 fc      bit $fc39,x
$0e:ae7b  f4 88 63      pea $6388
$0e:ae7e  f9 f8 ff      sbc $fff8,y
$0e:ae81  7f ab ff df   adc $dfffab,x
$0e:ae85  e7 fb         sbc [$fb]
$0e:ae87  d2 c1         cmp ($c1)
$0e:ae89  cf ff a8 07   cmp $07a8ff
$0e:ae8d  7f cf 8f fb   adc $fb8fcf,x
$0e:ae91  c9 a1 bd      cmp #$bda1
$0e:ae94  c3 de         cmp $de,s
$0e:ae96  e8            inx
$0e:ae97  ea            nop
$0e:ae98  f1 b7         sbc ($b7),y
$0e:ae9a  ef f2 f7 df   sbc $dff7f2
$0e:ae9e  7e ff bf      ror $bfff,x
$0e:aea1  7b            tdc
$0e:aea2  fb            xce
$0e:aea3  d1 45         cmp ($45),y
$0e:aea5  e1 03         sbc ($03,x)
$0e:aea7  5f 86 ae 57   eor $57ae86,x
$0e:aeab  57 8b         eor [$8b],y
$0e:aead  cb            wai
$0e:aeae  65 b1         adc $b1
$0e:aeb0  f8            sed
$0e:aeb1  fc ce 67      jsr ($67ce,x)
$0e:aeb4  be d9 f7      ldx $f7d9,y
$0e:aeb7  fe 3d ff      inc $ff3d,x
$0e:aeba  d6 7f         dec $7f,x
$0e:aebc  eb            xba
$0e:aebd  df fd e7 fe   cmp $fee7fd,x
$0e:aec1  dd ff fe      cmp $feff,x
$0e:aec4  ff fb d2 c9   sbc $c9d2fb,x
$0e:aec8  64 72         stz $72
$0e:aeca  39 ac d6      and $d6ac,y
$0e:aecd  57 2b         eor [$2b],y
$0e:aecf  9b            txy
$0e:aed0  cd e5 b2      cmp $b2e5
$0e:aed3  c9 10 de      cmp #$de10
$0e:aed6  ef 7c 16 5f   sbc $5f167c
$0e:aeda  2d a7 49      and $49a7
$0e:aedd  69 e2 da      adc #$dae2
$0e:aee0  74 b6         stz $b6,x
$0e:aee2  9c 23 c8      stz $c823
$0e:aee5  60            rts
$0e:aee6  b6 18         ldx $18,y
$0e:aee8  8f fa 13 f6   sta $f613fa
$0e:aeec  00 c4         brk #$c4
$0e:aeee  07 fd         ora [$fd]
$0e:aef0  ee 07 8d      inc $8d07
$0e:aef3  54 fc 06      mvn $06,$fc
$0e:aef6  21 31         and ($31,x)
$0e:aef8  05 12         ora $12
$0e:aefa  88            dey
$0e:aefb  0f 0f f8 48   ora $48f80f
$0e:aeff  28            plp
$0e:af00  81 62         sta ($62,x)
$0e:af02  0a            asl a
$0e:af03  80 9c         bra $aea1
$0e:af05  68            pla
$0e:af06  81 f0         sta ($f0,x)
$0e:af08  f5 fb         sbc $fb,x
$0e:af0a  fd de fa      sbc $fade,x
$0e:af0d  d8            cld
$0e:af0e  7c 22 f0      jmp ($f022,x)
$0e:af11  38            sec
$0e:af12  2c 02 02      bit $0202
$0e:af15  1b            tcs
$0e:af16  2f d7 aa bd   and $bdaad7
$0e:af1a  4e 81 c0      lsr $c081
$0e:af1d  cc 41 f8      cpy $f841
$0e:af20  80 7f         bra $afa1
$0e:af22  85 47         sta $47
$0e:af24  ab            plb
$0e:af25  ff ff 9b 80   sbc $809bff,x
$0e:af29  8e 0f fe      stx $fe0f
$0e:af2c  ec 3e 17      cpx $173e
$0e:af2f  fb            xce
$0e:af30  bd fc aa      lda $aafc,x
$0e:af33  1a            inc a
$0e:af34  bf de ab 7d   lda $7dabde,x
$0e:af38  aa            tax
$0e:af39  d7 fa         cmp [$fa],y
$0e:af3b  bd 73 a9      lda $a973,x
$0e:af3e  d4 3a         pei ($3a)
$0e:af40  1d e7 b3      ora $b3e7,x
$0e:af43  a3 c3         lda $c3,s
$0e:af45  55 ff         eor $ff,x
$0e:af47  f3 ff         sbc ($ff,s),y
$0e:af49  d3 a0         cmp ($a0,s),y
$0e:af4b  71 4d         adc ($4d),y
$0e:af4d  79 e8 77      adc $77e8,y
$0e:af50  fa            plx
$0e:af51  0f ff 81 02   ora $0281ff
$0e:af55  be 4f fe      ldx $fe4f,y
$0e:af58  93 ff         sta ($ff,s),y
$0e:af5a  a5 ae         lda $ae
$0e:af5c  fd e5 ff      sbc $ffe5,x
$0e:af5f  f9 ff fe      sbc $feff,y
$0e:af62  b7 ef         lda [$ef],y
$0e:af64  bb            tyx
$0e:af65  fd ef 9f      sbc $9fef,x
$0e:af68  cf 0f ff b5   cmp $b5ff0f
$0e:af6c  ff f8 54 3f   sbc $3f54f8,x
$0e:af70  e9 11 f5      sbc #$f511
$0e:af73  d3 fd         cmp ($fd,s),y
$0e:af75  76 7f         ror $7f,x
$0e:af77  1d 83 81      ora $8183,x
$0e:af7a  c0 cc         cpy #$cc
$0e:af7c  66 2a         ror $2a
$0e:af7e  df e5 81 7b   cmp $7b81e5,x
$0e:af82  ad df ff      lda $ffdf
$0e:af85  7f ff ff 9f   adc $9fffff,x
$0e:af89  cf cc fe 70   cmp $70fecc
$0e:af8d  28            plp
$0e:af8e  12 c0         ora ($c0)
$0e:af90  ad df eb      lda $ebdf
$0e:af93  7a            ply
$0e:af94  e4 3f         cpx $3f
$0e:af96  f7 f8         sbc [$f8],y
$0e:af98  fc 3e 07      jsr ($073e,x)
$0e:af9b  54 be 6e      mvn $6e,$be
$0e:af9e  bf da af f7   lda $f7afda,x
$0e:afa2  59 60 33      eor $3360,y
$0e:afa5  ef f5 9f ff   sbc $ff9ff5
$0e:afa9  ec ff d5      cpx $d5ff
$0e:afac  2a            rol a
$0e:afad  98            tya
$0e:afae  2c 16 ab      bit $ab16
$0e:afb1  55 d6         eor $d6,x
$0e:afb3  eb            xba
$0e:afb4  5f af d2 e9   eor $e9d2af,x
$0e:afb8  74 96         stz $96,x
$0e:afba  4b            phk
$0e:afbb  e4 45         cpx $45
$0e:afbd  06 63         asl $63
$0e:afbf  75 67         adc $67,x
$0e:afc1  98            tya
$0e:afc2  e2 aa         sep #$aa
$0e:afc4  da            phx
$0e:afc5  fe 66 d2      inc $d266,x
$0e:afc8  a1 be         lda ($be,x)
$0e:afca  e7 eb         sbc [$eb]
$0e:afcc  fd b8 bc      sbc $bcb8,x
$0e:afcf  06 fc         asl $fc
$0e:afd1  54 42 a0      mvn $a0,$42
$0e:afd4  81 ff         sta ($ff,x)
$0e:afd6  e0 3f         cpx #$3f
$0e:afd8  f8            sed
$0e:afd9  80 28         bra $b003
$0e:afdb  74 36         stz $36,x
$0e:afdd  1a            inc a
$0e:afde  37 1b         and [$1b],y
$0e:afe0  27 6f         and [$6f]
$0e:afe2  f4 46 2a      pea $2a46
$0e:afe5  13 0b         ora ($0b,s),y
$0e:afe7  24 72         bit $72
$0e:afe9  6f 0f 8d 41   adc $418d0f
$0e:afed  bc 31 ee      ldy $ee31,x
$0e:aff0  34 e4         bit $e4,x
$0e:aff2  08            php
$0e:aff3  1f 88 3d c2   ora $c23d88,x
$0e:aff7  1f 7c 81 cf   ora $cf817c,x
$0e:affb  e0 11         cpx #$11
$0e:affd  e8            inx
$0e:affe  0c 16 1f      tsb $1f16
$0e:b001  27 91         and [$91]
$0e:b003  c3 20         cmp $20,s
$0e:b005  f0 88         beq $af8f
$0e:b007  c4 fe         cpy $fe
$0e:b009  3d 36 be      and $be36,x
$0e:b00c  71 2f         adc ($2f),y
$0e:b00e  18            clc
$0e:b00f  8c 27 c7      sty $c727
$0e:b012  fd da fe      sbc $feda,x
$0e:b015  7d 3f 1e      adc $1e3f,x
$0e:b018  ff 87 43 c3   sbc $c34387,x
$0e:b01c  a1 e1         lda ($e1,x)
$0e:b01e  d0 f0         bne $b010
$0e:b020  ff 38 7f 22   sbc $227f38,x
$0e:b024  89 fe         bit #$fe
$0e:b026  b9 6a ae      lda $ae6a,y
$0e:b029  98            tya
$0e:b02a  cb            wai
$0e:b02b  96 2a         stx $2a,y
$0e:b02d  49 dc         eor #$dc
$0e:b02f  a9 6b         lda #$6b
$0e:b031  2e 58 89      rol $8958
$0e:b034  36 e2         rol $e2,x
$0e:b036  0f 8a 82 e2   ora $e2828a
$0e:b03a  20 e6 30      jsr $30e6
$0e:b03d  ec 41 f5      cpx $f541
$0e:b040  06 43         asl $43
$0e:b042  ca            dex
$0e:b043  db            stp
$0e:b044  68            pla
$0e:b045  b6 98         ldx $98,y
$0e:b047  f4 e3 09      pea $09e3
$0e:b04a  28            plp
$0e:b04b  ab            plb
$0e:b04c  df 71 12 ce   cmp $ce1271,x
$0e:b050  7d a6 b3      adc $b3a6,x
$0e:b053  75 80         adc $80,x
$0e:b055  ff 8f e1 50   sbc $50e18f,x
$0e:b059  f7 d0         sbc [$d0],y
$0e:b05b  3f f1 1f 72   and $721ff1,x
$0e:b05f  14 0f         trb $0f
$0e:b061  e0 87         cpx #$87
$0e:b063  0e 66 c6      asl $c666
$0e:b066  99 31 f6      sta $f631,y
$0e:b069  ec 7b 9b      cpx $9b7b
$0e:b06c  1a            inc a
$0e:b06d  ec c7 fb      cpx $fbc7
$0e:b070  b1 8e         lda ($8e),y
$0e:b072  ec 53 21      cpx $2153
$0e:b075  b1 a7         lda ($a7),y
$0e:b077  4c 79 c9      jmp $c979
$0e:b07a  f0 4f         beq $b0cb
$0e:b07c  b2 7c         lda ($7c)
$0e:b07e  20 78 0c      jsr $0c78
$0e:b081  3f 03 af c0   and $c0af03,x
$0e:b085  a7 f0         lda [$f0]
$0e:b087  2b            pld
$0e:b088  fc 0c ba      jsr ($ba0c,x)
$0e:b08b  d8            cld
$0e:b08c  ef bf e9 df   sbc $dfe9bf
$0e:b090  f2 0e         sbc ($0e)
$0e:b092  25 06         and $06
$0e:b094  23 dd         and $dd,s
$0e:b096  e0 0c         cpx #$0c
$0e:b098  f0 9b         beq $b035
$0e:b09a  e0 36         cpx #$36
$0e:b09c  f0 08         beq $b0a6
$0e:b09e  bf 02 ae b0   lda $b0ae02,x
$0e:b0a2  0b            phd
$0e:b0a3  06 9e         asl $9e
$0e:b0a5  80 c3         bra $b06a
$0e:b0a7  2c 3d e1      bit $e13d
$0e:b0aa  c6 1c         dec $1c
$0e:b0ac  79 c3 9c      adc $9cc3,y
$0e:b0af  3c f1 87      bit $87f1,x
$0e:b0b2  58            cli
$0e:b0b3  40            rti
$0e:b0b4  35 b0         and $b0,x
$0e:b0b6  5a            phy
$0e:b0b7  4c 16 63      jmp $6316
$0e:b0ba  01 8c         ora ($8c,x)
$0e:b0bc  c9 25         cmp #$25
$0e:b0be  b0 08         bcs $b0c8
$0e:b0c0  2d 02 83      and $8302
$0e:b0c3  04 82         tsb $82
$0e:b0c5  42 7e         wdm #$7e
$0e:b0c7  d8            cld
$0e:b0c8  9f b7 47 dd   sta $dd47b7,x
$0e:b0cc  e9 fb         sbc #$fb
$0e:b0ce  75 7f         adc $7f,x
$0e:b0d0  5f 9f f6 fb   eor $fbf69f,x
$0e:b0d4  ff fb ff 83   sbc $83fffb,x
$0e:b0d8  8a            txa
$0e:b0d9  01 ff         ora ($ff,x)
$0e:b0db  91 7f         sta ($7f),y
$0e:b0dd  fb            xce
$0e:b0de  b2 2e         lda ($2e)
$0e:b0e0  ef 74 22 01   sbc $012274
$0e:b0e4  a1 08         lda ($08,x)
$0e:b0e6  14 02         trb $02
$0e:b0e8  45 22         eor $22
$0e:b0ea  12 00         ora ($00)
$0e:b0ec  6c 83 aa      jmp ($aa83)
$0e:b0ef  14 f1         trb $f1
$0e:b0f1  2f 8d bc 8e   and $8ebc8d
$0e:b0f5  da            phx
$0e:b0f6  fe f6 9f      inc $9ff6,x
$0e:b0f9  bb            tyx
$0e:b0fa  ef ed 6f fb   sbc $fb6fed
$0e:b0fe  f7 fe         sbc [$fe],y
$0e:b100  f9 44 37      sbc $3744,y
$0e:b103  7d ff ef      adc $efff,x
$0e:b106  ff bd 86 ee   sbc $ee86bd,x
$0e:b10a  61 3f         adc ($3f,x)
$0e:b10c  1c 8e de      trb $de8e
$0e:b10f  6f fd 5e 28   adc $285efd
$0e:b113  87 e7         sta [$e7]
$0e:b115  33 fd         and ($fd,s),y
$0e:b117  fe ef 3f      inc $3fef,x
$0e:b11a  f7 9f         sbc [$9f],y
$0e:b11c  ff cf ff 86   sbc $86ffcf,x
$0e:b120  ff f3 bf fb   sbc $fbbff3,x
$0e:b124  df ff 9b ff   cmp $ff9bff,x
$0e:b128  3c ff ce      bit $ceff,x
$0e:b12b  27 17         and [$17]
$0e:b12d  1b            tcs
$0e:b12e  8f 8f c7 86   sta $86c78f
$0e:b132  c3 42         cmp $42,s
$0e:b134  21 19         and ($19,x)
$0e:b136  0c 87 83      tsb $8387
$0e:b139  c1 3c         cmp ($3c,x)
$0e:b13b  9e 41 bf      stz $bf41,x
$0e:b13e  d9 0f ec      cmp $ec0f,y
$0e:b141  07 f5         ora [$f5]
$0e:b143  c3 fa         cmp $fa,s
$0e:b145  55 ff         eor $ff,x
$0e:b147  18            clc
$0e:b148  ee 85 7f      inc $7f85
$0e:b14b  c3 bf         cmp $bf,s
$0e:b14d  e0 c0         cpx #$c0
$0e:b14f  60            rts
$0e:b150  18            clc
$0e:b151  2c 04 16      bit $1604
$0e:b154  01 0b         ora ($0b,x)
$0e:b156  80 51         bra $b1a9
$0e:b158  a8            tay
$0e:b159  32 f8         and ($f8)
$0e:b15b  0c 7a 03      tsb $037a
$0e:b15e  3f 80 df 6f   and $6fdf80,x
$0e:b162  f3 fd         sbc ($fd,s),y
$0e:b164  fe 7f be      inc $be7f,x
$0e:b167  76 0f         ror $0f,x
$0e:b169  3c df ef      bit $efdf,x
$0e:b16c  1f fd c3 c8   ora $c8c3fd,x
$0e:b170  41 fd         eor ($fd,x)
$0e:b172  67 9f         adc [$9f]
$0e:b174  3e 9f ef      rol $ef9f,x
$0e:b177  93 fc         sta ($fc,s),y
$0e:b179  e2 7f         sep #$7f
$0e:b17b  98            tya
$0e:b17c  49 08         eor #$08
$0e:b17e  3f d0 17 7e   and $7e17d0,x
$0e:b182  14 c1         trb $c1
$0e:b184  ff 90 98 2c   sbc $2c9890,x
$0e:b188  2a            rol a
$0e:b189  0d 0c 81      ora $810c
$0e:b18c  41 a0         eor ($a0,x)
$0e:b18e  50 18         bvc $b1a8
$0e:b190  1c 0e 02      trb $020e
$0e:b193  bf 08 04 06   lda $060408,x
$0e:b197  1b            tcs
$0e:b198  02 87         cop #$87
$0e:b19a  40            rti
$0e:b19b  44 21 06      mvp $06,$21
$0e:b19e  0b            phd
$0e:b19f  84 00         sty $00
$0e:b1a1  4e 0b f0      lsr $f00b
$0e:b1a4  5f 86 2f e3   eor $e32f86,x
$0e:b1a8  88            dey
$0e:b1a9  92 42         sta ($42)
$0e:b1ab  a0 5d         ldy #$5d
$0e:b1ad  fe ac be      inc $beac,x
$0e:b1b0  ee ff 18      inc $18ff
$0e:b1b3  05 aa         ora $aa
$0e:b1b5  29 89         and #$89
$0e:b1b7  83 76         sta $76,s
$0e:b1b9  20 f7 ac      jsr $acf7
$0e:b1bc  2e b6 05      rol $05b6
$0e:b1bf  0f c0 03 40   ora $4003c0
$0e:b1c3  c2 3f         rep #$3f
$0e:b1c5  fe d5 53      inc $53d5,x
$0e:b1c8  51 74         eor ($74),y
$0e:b1ca  c5 49         cmp $49
$0e:b1cc  31 50         and ($50),y
$0e:b1ce  4e c5 53      lsr $53c5
$0e:b1d1  f5 76         sbc $76,x
$0e:b1d3  d4 dd         pei ($dd)
$0e:b1d5  71 37         adc ($37),y
$0e:b1d7  5d 44 1f      eor $1f44,x
$0e:b1da  11 07         ora ($07),y
$0e:b1dc  20 87 e2      jsr $e287
$0e:b1df  0e 5f 0c      asl $0c5f
$0e:b1e2  54 14 7e      mvn $7e,$14
$0e:b1e5  03 f0         ora $f0,s
$0e:b1e7  e8            inx
$0e:b1e8  5d 33 93      eor $9333,x
$0e:b1eb  89 a6 63      bit #$63a6
$0e:b1ee  65 16         adc $16
$0e:b1f0  a3 78         lda $78,s
$0e:b1f2  a6 99         ldx $99
$0e:b1f4  0c 44 87      tsb $8744
$0e:b1f7  91 60         sta ($60),y
$0e:b1f9  8c 7b ea      sty $ea7b
$0e:b1fc  08            php
$0e:b1fd  01 a9         ora ($a9,x)
$0e:b1ff  7b            tdc
$0e:b200  60            rts
$0e:b201  5f da 8f be   eor $be8fda,x
$0e:b205  8d ff 83      sta $83ff
$0e:b208  7f f6 bb 1b   adc $1bbbf6,x
$0e:b20c  ec c7 f3      cpx $f3c7
$0e:b20f  b1 47         lda ($47),y
$0e:b211  96 e7         stx $e7,y
$0e:b213  63 f5         adc $f5,s
$0e:b215  d8            cld
$0e:b216  a6 43         ldx $43
$0e:b218  63 4e         adc $4e,s
$0e:b21a  98            tya
$0e:b21b  f3 93         sbc ($93,s),y
$0e:b21d  e0 9f 64      cpx #$649f
$0e:b220  f8            sed
$0e:b221  71 f0         adc ($f0),y
$0e:b223  15 7e         ora $7e,x
$0e:b225  86 3f         stx $3f
$0e:b227  80 af         bra $b1d8
$0e:b229  0e 7d 23      asl $237d
$0e:b22c  2f d0 a3 e4   and $e4a3d0
$0e:b230  32 f5         and ($f5)
$0e:b232  03 20         ora $20,s
$0e:b234  45 fd         eor $fd
$0e:b236  06 41         asl $41
$0e:b238  fc 43 fe      jsr ($fe43,x)
$0e:b23b  0c 10 64      tsb $6410
$0e:b23e  95 df         sta $df,x
$0e:b240  21 27         and ($27,x)
$0e:b242  e8            inx
$0e:b243  6f e9 17 7c   adc $7c17e9
$0e:b247  47 fe         eor [$fe]
$0e:b249  11 b7         ora ($b7),y
$0e:b24b  a4 00         ldy $00
$0e:b24d  0b            phd
$0e:b24e  ef 08 6f 80   sbc $806f08
$0e:b252  02 bc         cop #$bc
$0e:b254  f2 0e         sbc ($0e)
$0e:b256  34 07         bit $07,x
$0e:b258  dd 20 bf      cmp $bf20,x
$0e:b25b  e8            inx
$0e:b25c  79 b3 20      adc $20b3,y
$0e:b25f  60            rts
$0e:b260  64 ad         stz $ad
$0e:b262  b8            clv
$0e:b263  4b            phk
$0e:b264  dc 9c c6      jml [$c69c]
$0e:b267  3a            dec a
$0e:b268  7a            ply
$0e:b269  c5 d2         cmp $d2
$0e:b26b  11 00         ora ($00),y
$0e:b26d  03 8f         ora $8f,s
$0e:b26f  fe 04 4a      inc $4a04,x
$0e:b272  0e 7c ff      asl $ff7c
$0e:b275  2f 7f 9f ef   and $ef9f7f
$0e:b279  ff 64 a1 be   sbc $bea164,x
$0e:b27d  ff 7b fd ff   sbc $fffd7b,x
$0e:b281  f3 8c         sbc ($8c,s),y
$0e:b283  e8            inx
$0e:b284  0e 33 06      asl $0633
$0e:b287  04 81         tsb $81
$0e:b289  c6 3d         dec $3d
$0e:b28b  5f ad 6b 6f   eor $6f6bad,x
$0e:b28f  8e df 5c      stx $5cdf
$0e:b292  f1 bf         sbc ($bf),y
$0e:b294  d1 48         cmp ($48),y
$0e:b296  40            rti
$0e:b297  1f 65 f5 85   ora $85f565,x
$0e:b29b  38            sec
$0e:b29c  c2 82         rep #$82
$0e:b29e  07 20         ora [$20]
$0e:b2a0  42 f6         wdm #$f6
$0e:b2a2  ae 72 2b      ldx $2b72
$0e:b2a5  ae 2f 17      ldx $172f
$0e:b2a8  fc fd c0      jsr ($c0fd,x)
$0e:b2ab  ff 8e 30 c9   sbc $c9308e,x
$0e:b2af  db            stp
$0e:b2b0  2c 99 bc      bit $bc99
$0e:b2b3  5c 13 1f 00   jml $001f13
$0e:b2b7  ba            tsx
$0e:b2b8  11 1b         ora ($1b),y
$0e:b2ba  26 0d         rol $0d
$0e:b2bc  0c 86 6f      tsb $6f86
$0e:b2bf  93 fe         sta ($fe,s),y
$0e:b2c1  c5 7b         cmp $7b
$0e:b2c3  46 e1         lsr $e1
$0e:b2c5  fa            plx
$0e:b2c6  82 fd 21      brl $d4c6
$0e:b2c9  7a            ply
$0e:b2ca  aa            tax
$0e:b2cb  ab            plb
$0e:b2cc  70 33         bvs $b301
$0e:b2ce  76 4f         ror $4f,x
$0e:b2d0  fc 06 27      jsr ($2706,x)
$0e:b2d3  01 81         ora ($81,x)
$0e:b2d5  c0 60 f0      cpy #$f060
$0e:b2d8  38            sec
$0e:b2d9  fc 1f ff      jsr ($ff1f,x)
$0e:b2dc  bf 06 87 c6   lda $c68706,x
$0e:b2e0  03 f0         ora $f0,s
$0e:b2e2  80 fd         bra $b2e1
$0e:b2e4  60            rts
$0e:b2e5  be 88 0f      ldx $0f88,y
$0e:b2e8  4e 05 e3      lsr $e305
$0e:b2eb  f0 41         beq $b32e
$0e:b2ed  e0 1e fd      cpx #$fd1e
$0e:b2f0  07 da         ora [$da]
$0e:b2f2  1e 9f 0f      asl $0f9f,x
$0e:b2f5  94 3f         sty $3f,x
$0e:b2f7  cd 1f e6      cmp $e61f
$0e:b2fa  4f e3 bf ef   eor $efbfe3
$0e:b2fe  df f0 02 00   cmp $0002f0,x
$0e:b302  72 80         adc ($80)
$0e:b304  c0 10 a1      cpy #$a110
$0e:b307  04 80         tsb $80
$0e:b309  c3 60         cmp $60,s
$0e:b30b  d3 a8         cmp ($a8,s),y
$0e:b30d  2d 52 56      and $5652
$0e:b310  44 58 04      mvp $04,$58
$0e:b313  08            php
$0e:b314  0e 33 f8      asl $f833
$0e:b317  05 fe         ora $fe
$0e:b319  2f cc 80 f3   and $f380cc
$0e:b31d  26 39         rol $39
$0e:b31f  58            cli
$0e:b320  0d b2 c3      ora $c3b2
$0e:b323  f5 c8         sbc $c8,x
$0e:b325  fd 52 40      sbc $4052,x
$0e:b328  da            phx
$0e:b329  18            clc
$0e:b32a  0f fa 63 ce   ora $ce63fa
$0e:b32e  6f 85 87 3d   adc $3d8785
$0e:b332  f1 87         sbc ($87),y
$0e:b334  39 d3 29      and $29d3,y
$0e:b337  7c b4 45      jmp ($45b4,x)
$0e:b33a  23 b0         and $b0,s
$0e:b33c  38            sec
$0e:b33d  14 06         trb $06
$0e:b33f  13 07         ora ($07,s),y
$0e:b341  8a            txa
$0e:b342  43 23         eor $23,s
$0e:b344  70 78         bvs $b3be
$0e:b346  61 5c         adc ($5c,x)
$0e:b348  20 77 c4      jsr $c477
$0e:b34b  40            rti
$0e:b34c  40            rti
$0e:b34d  20 70 08      jsr $0870
$0e:b350  7c 02 38      jmp ($3802,x)
$0e:b353  02 10         cop #$10
$0e:b355  38            sec
$0e:b356  19 c1 0a      ora $0ac1,y
$0e:b359  10 68         bpl $b3c3
$0e:b35b  14 72         trb $72
$0e:b35d  19 10 88      ora $8810,y
$0e:b360  44 a2 5a      mvp $5a,$a2
$0e:b363  09 04 03      ora #$0304
$0e:b366  01 00         ora ($00,x)
$0e:b368  59 94 3d      eor $3d94,y
$0e:b36b  10 10         bpl $b37d
$0e:b36d  f9 fc b6      sbc $b6fc,y
$0e:b370  ff 5f ff df   sbc $dfff5f,x
$0e:b374  ff f1 88 47   sbc $4788f1,x
$0e:b378  83 a1         sta $a1,s
$0e:b37a  40            rti
$0e:b37b  c0 60 60      cpy #$6060
$0e:b37e  21 70         and ($70,x)
$0e:b380  80 41         bra $b3c3
$0e:b382  0c e5 e7      tsb $e7e5
$0e:b385  13 0c         ora ($0c,s),y
$0e:b387  fe ff 7e      inc $7eff,x
$0e:b38a  ff fb ff ff   sbc $fffffb,x
$0e:b38e  b4 68         ldy $68,x
$0e:b390  12 87         ora ($87)
$0e:b392  15 74         ora $74,x
$0e:b394  c4 49         cpy $49
$0e:b396  31 10         and ($10),y
$0e:b398  4c 54 13      jmp $1354
$0e:b39b  b7 55         lda [$55],y
$0e:b39d  fc 5d 3f      jsr ($3f5d,x)
$0e:b3a0  57 4d         eor [$4d],y
$0e:b3a2  5d d7 11      eor $11d7,x
$0e:b3a5  07 ec         ora [$ec]
$0e:b3a7  2b            pld
$0e:b3a8  40            rti
$0e:b3a9  c4 3a         cpy $3a
$0e:b3ab  98            tya
$0e:b3ac  31 7c         and ($7c),y
$0e:b3ae  0b            phd
$0e:b3af  e1 89         sbc ($89,x)
$0e:b3b1  5d 06 13      eor $1306,x
$0e:b3b4  d5 c4         cmp $c4,x
$0e:b3b6  8d 79 2c      sta $2c79
$0e:b3b9  5c 49 57 12   jml $125749
$0e:b3bd  05 e4         ora $e4
$0e:b3bf  8d 2b 03      sta $032b
$0e:b3c2  ff 40 ff e0   sbc $e0ff40,x
$0e:b3c6  2f e8 10 e0   and $e010e8
$0e:b3ca  6f d0 a1 e0   adc $e0a1d0
$0e:b3ce  ef fe 3c ff   sbc $ff3cfe
$0e:b3d2  ff c6 87 23   sbc $2387c6,x
$0e:b3d6  11 90         ora ($90),y
$0e:b3d8  e8            inx
$0e:b3d9  70 39         bvs $b414
$0e:b3db  1c 0d 56      trb $560d
$0e:b3de  8a            txa
$0e:b3df  93 0a         sta ($0a,s),y
$0e:b3e1  2f 17 02 9c   and $9c0217
$0e:b3e5  0b            phd
$0e:b3e6  f3 7c         sbc ($7c,s),y
$0e:b3e8  13 e0         ora ($e0,s),y
$0e:b3ea  9f 0a 2e e9   sta $e92e0a,x
$0e:b3ee  3e 1c 59      rol $591c,x
$0e:b3f1  d2 ac         cmp ($ac)
$0e:b3f3  2c fa 0c      bit $0cfa
$0e:b3f6  bc 42 af      ldy $af42,x
$0e:b3f9  10 93         bpl $b38e
$0e:b3fb  c8            iny
$0e:b3fc  34 f2         bit $f2,x
$0e:b3fe  0e bc c3      asl $c3bc
$0e:b401  af 10 a3 64   lda $64a310
$0e:b405  64 fd         stz $fd
$0e:b407  88            dey
$0e:b408  bf a1 82 0b   lda $0b82a1,x
$0e:b40c  f0 5f         beq $b46d
$0e:b40e  84 df         sty $df
$0e:b410  91 97         sta ($97),y
$0e:b412  f4 f5 fd      pea $fdf5
$0e:b415  7f f8 03 3e   adc $3e03f8,x
$0e:b419  3f d0 17 f8   and $f817d0,x
$0e:b41d  33 e6         and ($e6,s),y
$0e:b41f  03 ff         ora $ff,s
$0e:b421  6f 01 f4 3f   adc $3ff401
$0e:b425  f5 bb         sbc $bb,x
$0e:b427  fd b8 5a      sbc $5ab8,x
$0e:b42a  1f fb dd ff   ora $ffddfb,x
$0e:b42e  eb            xba
$0e:b42f  ff ae df fb   sbc $fbdfae,x
$0e:b433  6e f2 e5      ror $e5f2
$0e:b436  df fd cf 61   cmp $61cffd,x
$0e:b43a  f9 ff ee      sbc $eeff,y
$0e:b43d  b7 fe         lda [$fe],y
$0e:b43f  eb            xba
$0e:b440  c0 3e ff      cpy #$ff3e
$0e:b443  ff ef ff d5   sbc $d5ffef,x
$0e:b447  ff da ff fd   sbc $fdffda,x
$0e:b44b  9f fd f7 ff   sta $fff7fd,x
$0e:b44f  95 fb         sta $fb,x
$0e:b451  0d 87 df      ora $df87
$0e:b454  ef fd fe fa   sbc $fafefd
$0e:b458  bd 5b 5d      lda $5d5b,x
$0e:b45b  af b3 d9 ba   lda $bad9b3
$0e:b45f  dd 73 b9      cmp $b973,x
$0e:b462  42 b0         wdm #$b0
$0e:b464  ff cf a7 f0   sbc $f0a7cf,x
$0e:b468  ec 7c 03      cpx $037c
$0e:b46b  8f 84 f3 d8   sta $d8f384
$0e:b46f  36 fe         rol $fe,x
$0e:b471  0a            asl a
$0e:b472  fe 43 cf      inc $cf43,x
$0e:b475  20 9f f0      jsr $f09f
$0e:b478  39 ff 0b      and $0bff,y
$0e:b47b  9f f2 77 fc   sta $fc77f2,x
$0e:b47f  9f f6 25 ec   sta $ec25f6,x
$0e:b483  01 5f         ora ($5f,x)
$0e:b485  87 d6         sta [$d6]
$0e:b487  19 a9 b4      ora $b4a9,y
$0e:b48a  4a            lsr a
$0e:b48b  3d 16 4c      and $4c16,x
$0e:b48e  e6 5e         inc $5e
$0e:b490  ef ea 8f f5   sbc $f58fea
$0e:b494  27 fe         and [$fe]
$0e:b496  a8            tay
$0e:b497  af ce 03 97   lda $9703ce
$0e:b49b  80 c5         bra $b462
$0e:b49d  e0 16 38      cpx #$3816
$0e:b4a0  06 22         asl $22
$0e:b4a2  01 e0         ora ($e0,x)
$0e:b4a4  80 70         bra $b516
$0e:b4a6  20 1e a8      jsr $a81e
$0e:b4a9  05 ba         ora $ba
$0e:b4ab  13 69         ora ($69,s),y
$0e:b4ad  81 66         sta ($66,x)
$0e:b4af  a2 53 69      ldx #$6953
$0e:b4b2  b5 6f         lda $6f,x
$0e:b4b4  ff aa fb d4   sbc $d4fbaa,x
$0e:b4b8  35 fa         and $fa,x
$0e:b4ba  aa            tax
$0e:b4bb  af da c1 fd   lda $fdc1da
$0e:b4bf  b4 7b         ldy $7b,x
$0e:b4c1  71 1c         adc ($1c),y
$0e:b4c3  98            tya
$0e:b4c4  02 18         cop #$18
$0e:b4c6  21 10         and ($10,x)
$0e:b4c8  0a            asl a
$0e:b4c9  84 03         sty $03
$0e:b4cb  55 00         eor $00,x
$0e:b4cd  d4 d5         pei ($d5)
$0e:b4cf  be b0 af      ldx $afb0,y
$0e:b4d2  fe 03 ff      inc $ff03,x
$0e:b4d5  c0 af fc      cpy #$fcaf
$0e:b4d8  33 7f         and ($7f,s),y
$0e:b4da  4b            phk
$0e:b4db  56 d7         lsr $d7,x
$0e:b4dd  ad 29 d4      lda $d429
$0e:b4e0  c0 3e b0      cpy #$b03e
$0e:b4e3  0b            phd
$0e:b4e4  fc 02 7f      jsr ($7f02,x)
$0e:b4e7  00 87         brk #$87
$0e:b4e9  c0 21 70      cpy #$7021
$0e:b4ec  0a            asl a
$0e:b4ed  54 03 ad      mvn $ad,$03
$0e:b4f0  00 c0         brk #$c0
$0e:b4f2  60            rts
$0e:b4f3  20 70 38      jsr $3870
$0e:b4f6  74 3f         stz $3f,x
$0e:b4f8  31 9c         and ($9c),y
$0e:b4fa  b0 5e         bcs $b55a
$0e:b4fc  38            sec
$0e:b4fd  1f 85 70 43   ora $437085,x
$0e:b501  e1 f8         sbc ($f8,x)
$0e:b503  0b            phd
$0e:b504  fc 0f f9      jsr ($f90f,x)
$0e:b507  0f f8 67 2c   ora $2c67f8
$0e:b50b  77 8c         adc [$8c],y
$0e:b50d  3f e2 0e bf   and $bf0ee2,x
$0e:b511  06 18         asl $18
$0e:b513  4f 27 fd 07   eor $07fd27
$0e:b517  48            pha
$0e:b518  40            rti
$0e:b519  61 90         adc ($90,x)
$0e:b51b  f9 84 e2      sbc $e284,y
$0e:b51e  c3 71         cmp $71,s
$0e:b520  c1 f8         cmp ($f8,x)
$0e:b522  e0 5e 31      cpx #$315e
$0e:b525  f8            sed
$0e:b526  7f e0 10 1f   adc $1f10e0,x
$0e:b52a  f3 0c         sbc ($0c,s),y
$0e:b52c  27 1c         and [$1c]
$0e:b52e  7b            tdc
$0e:b52f  8e 3b c7      stx $c73b
$0e:b532  1c 75 87      trb $8775
$0e:b535  ff f1 f8 f3   sbc $f3f8f1,x
$0e:b539  ed f1 fc      sbc $fcf1
$0e:b53c  ad df b3      lda $b3df
$0e:b53f  5f 62 d7 f4   eor $f4d762,x
$0e:b543  b7 9e         lda [$9e],y
$0e:b545  dc cc 01      jml [$01cc]
$0e:b548  c2 1f         rep #$1f
$0e:b54a  fa            plx
$0e:b54b  07 fe         ora [$fe]
$0e:b54d  09 ff 88      ora #$88ff
$0e:b550  01 86         ora ($86,x)
$0e:b552  03 ff         ora $ff,s
$0e:b554  81 7f         sta ($7f,x)
$0e:b556  e9 33 08      sbc #$0833
$0e:b559  42 24         wdm #$24
$0e:b55b  20 12 09      jsr $0912
$0e:b55e  02 18         cop #$18
$0e:b560  20 50 24      jsr $2450
$0e:b563  30 a1         bmi $b506
$0e:b565  83 ff         sta $ff,s
$0e:b567  f7 ff         sbc [$ff],y
$0e:b569  88            dey
$0e:b56a  83 be         sta $be,s
$0e:b56c  22 1f e8 88   jsl $88e81f
$0e:b570  44 41 c5      mvp $c5,$41
$0e:b573  9e da 33      stz $33da,x
$0e:b576  f9 1f 7d      sbc $7d1f,y
$0e:b579  63 cf         adc $cf,s
$0e:b57b  3a            dec a
$0e:b57c  e2 dd         sep #$dd
$0e:b57e  7f 53 ab ef   adc $efab53,x
$0e:b582  0b            phd
$0e:b583  ba            tsx
$0e:b584  0d 07 f9      ora $f907
$0e:b587  3f c7 f7 00   and $00f7c7,x
$0e:b58b  fe e0 3f      inc $3fe0,x
$0e:b58e  d2 0f         cmp ($0f)
$0e:b590  f7 4f         sbc [$4f],y
$0e:b592  9f c8 ec 72   sta $72ecc8,x
$0e:b596  b8            clv
$0e:b597  dd 5e 6d      cmp $6d5e,x
$0e:b59a  23 b1         and $b1,s
$0e:b59c  aa            tax
$0e:b59d  cd 55 39      cmp $3955
$0e:b5a0  9d de 1f      sta $1fde,x
$0e:b5a3  03 7f         ora $7f,s
$0e:b5a5  c7 df         cmp [$df]
$0e:b5a7  f0 77         beq $b620
$0e:b5a9  fc 23 00      jsr ($0023,x)
$0e:b5ac  4f f0 b7 fe   eor $feb7f0
$0e:b5b0  1b            tcs
$0e:b5b1  7c 37 fe      jmp ($fe37,x)
$0e:b5b4  08            php
$0e:b5b5  f9 bc 38      sbc $38bc,y
$0e:b5b8  13 fc         ora ($fc,s),y
$0e:b5ba  05 b6         ora $b6
$0e:b5bc  00 00         brk #$00
$0e:b5be  1a            inc a
$0e:b5bf  85 dc         sta $dc
$0e:b5c1  ee 10 ff      inc $ff10
$0e:b5c4  fc 7f ff      jsr ($ff7f,x)
$0e:b5c7  1b            tcs
$0e:b5c8  ff cf ff f7   sbc $f7ffcf,x
$0e:b5cc  f1 40         sbc ($40),y
$0e:b5ce  e3 c4         sbc $c4,s
$0e:b5d0  43 33         eor $33,s
$0e:b5d2  9e e6 7f      stz $7fe6,x
$0e:b5d5  de 2f ed      dec $ed2f,x
$0e:b5d8  5e d4 8f      lsr $8fd4,x
$0e:b5db  0b            phd
$0e:b5dc  6d fb 25      adc $25fb
$0e:b5df  f3 b6         sbc ($b6,s),y
$0e:b5e1  e7 a7         sbc [$a7]
$0e:b5e3  fc 12 01      jsr ($0112,x)
$0e:b5e6  5f f0 49 f0   eor $f049f0,x
$0e:b5ea  bf e0 3e 70   lda $703ee0,x
$0e:b5ee  c7 08         cmp [$08]
$0e:b5f0  43 fa         eor $fa,s
$0e:b5f2  bb            tyx
$0e:b5f3  bf ad 5f f3   lda $f35fad,x
$0e:b5f7  ab            plb
$0e:b5f8  ea            nop
$0e:b5f9  57 ed         eor [$ed],y
$0e:b5fb  be ff a4      ldx $a4ff,y
$0e:b5fe  af ed b5 ad   lda $adb5ed
$0e:b602  77 e4         adc [$e4],y
$0e:b604  20 a1 05      jsr $05a1
$0e:b607  82 90 31      brl $e79a
$0e:b60a  20 01 1f      jsr $1f01
$0e:b60d  8d fd 54      sta $54fd
$0e:b610  13 c9         ora ($c9,s),y
$0e:b612  57 66         eor [$66],y
$0e:b614  8b            phb
$0e:b615  cf c5 71 62   cmp $6271c5
$0e:b619  19 bc bc      ora $bcbc,y
$0e:b61c  5a            phy
$0e:b61d  0b            phd
$0e:b61e  86 7f         stx $7f
$0e:b620  90 14         bcc $b636
$0e:b622  26 0e         rol $0e
$0e:b624  41 b2         eor ($b2,x)
$0e:b626  7f ed 1f fb   adc $fb1fed,x
$0e:b62a  c7 ff         cmp [$ff]
$0e:b62c  8f 00 b7 48   sta $48b700
$0e:b630  25 81         and $81
$0e:b632  61 88         adc ($88,x)
$0e:b634  44 1e a0      mvp $a0,$1e
$0e:b637  f5 0a         sbc $0a,x
$0e:b639  0d 06 0f      ora $0f06
$0e:b63c  f8            sed
$0e:b63d  d3 f6         cmp ($f6,s),y
$0e:b63f  7c fd b1      jmp ($b1fd,x)
$0e:b642  10 7b         bpl $b6bf
$0e:b644  c5 47         cmp $47
$0e:b646  be ff e6      ldx $e6ff,y
$0e:b649  ff 79 3f 9f   sbc $9f3f79,x
$0e:b64d  5f ef bb fd   eor $fdbbef,x
$0e:b651  81 c3         sta ($c3,x)
$0e:b653  ef ff f3 ff   sbc $fff3ff
$0e:b657  fe 7f fc      inc $fc7f,x
$0e:b65a  be 4f 3f      ldx $3f4f,y
$0e:b65d  93 ed         sta ($ed,s),y
$0e:b65f  f4 f4 fa      pea $faf4
$0e:b662  3f 18 9c fe   and $fe9c18,x
$0e:b666  61 d0         adc ($d0,x)
$0e:b668  ff d1 ef ff   sbc $ffefd1,x
$0e:b66c  17 50         ora [$50],y
$0e:b66e  fc 3f fa      jsr ($fa3f,x)
$0e:b671  9f fd 5c 14   sta $145cfd,x
$0e:b675  2e 10 c0      rol $c010
$0e:b678  28            plp
$0e:b679  48            pha
$0e:b67a  84 f4         sty $f4
$0e:b67c  0c 06 82      tsb $8206
$0e:b67f  81 b0         sta ($b0,x)
$0e:b681  e0 5c         cpx #$5c
$0e:b683  34 19         bit $19,x
$0e:b685  8b            phb
$0e:b686  86 e3         stx $e3
$0e:b688  d1 48         cmp ($48),y
$0e:b68a  b8            clv
$0e:b68b  55 3b         eor $3b,x
$0e:b68d  1c 08 07      trb $0708
$0e:b690  82 01 f0      brl $a694
$0e:b693  31 04         and ($04),y
$0e:b695  83 f1         sta $f1,s
$0e:b697  10 fc         bpl $b695
$0e:b699  42 2f         wdm #$2f
$0e:b69b  18            clc
$0e:b69c  0e e4 83      asl $83e4
$0e:b69f  cf 20 bb cc   cmp $ccbb20
$0e:b6a3  2a            rol a
$0e:b6a4  f9 0d 3c      sbc $3c0d,y
$0e:b6a7  82 0f c0      brl $76b9
$0e:b6aa  39 86 1e      and $1e86,y
$0e:b6ad  c1 a7         cmp ($a7,x)
$0e:b6af  a0 49         ldy #$49
$0e:b6b1  fb            xce
$0e:b6b2  13 7e         ora ($7e,s),y
$0e:b6b4  46 5e         lsr $5e
$0e:b6b6  d1 a7         cmp ($a7),y
$0e:b6b8  ac 71 e7      ldy $e771
$0e:b6bb  1d 79 47      ora $4779,x
$0e:b6be  9e 30 8b      stz $8b30,x
$0e:b6c1  0c 9d f1      tsb $f19d
$0e:b6c4  ea            nop
$0e:b6c5  18            clc
$0e:b6c6  0c 04 12      tsb $1204
$0e:b6c9  08            php
$0e:b6ca  f5 09         sbc $09,x
$0e:b6cc  04 82         tsb $82
$0e:b6ce  03 01         ora $01,s
$0e:b6d0  7c 88 28      jmp ($2888,x)
$0e:b6d3  6f ff ff d8   adc $d8ffff
$0e:b6d7  28            plp
$0e:b6d8  7b            tdc
$0e:b6d9  ff ff f0 28   sbc $28f0ff,x
$0e:b6dd  49 e0 f6      eor #$f6e0
$0e:b6e0  0c 06 12      tsb $1206
$0e:b6e3  01 02         ora ($02,x)
$0e:b6e5  4e 03 dc      lsr $dc03
$0e:b6e8  53 60         eor ($60,s),y
$0e:b6ea  9c 0f 07      stz $070f
$0e:b6ed  83 f1         sta $f1,s
$0e:b6ef  78            sei
$0e:b6f0  ff 7f 15 43   sbc $43157f,x
$0e:b6f4  ee 55 0a      inc $0a55
$0e:b6f7  ac 2b f8      ldy $f82b
$0e:b6fa  08            php
$0e:b6fb  3c 42 43      bit $4342,x
$0e:b6fe  24 5a         bit $5a
$0e:b700  94 22         sty $22,x
$0e:b702  11 40         ora ($40),y
$0e:b704  a0 a6         ldy #$a6
$0e:b706  c2 3f         rep #$3f
$0e:b708  e0 f3 fe      cpx #$fef3
$0e:b70b  3b            tsc
$0e:b70c  2c 43 fb      bit $fb43
$0e:b70f  03 05         ora $05,s
$0e:b711  9a            txs
$0e:b712  1e bd bf      asl $bfbd,x
$0e:b715  2b            pld
$0e:b716  6f b5 c5 7f   adc $7fc5b5
$0e:b71a  fc 1f 5f      jsr ($5f1f,x)
$0e:b71d  d5 cb         cmp $cb,x
$0e:b71f  ff d4 ef 7a   sbc $7aefd4,x
$0e:b723  ff b0 02 61   sbc $6102b0,x
$0e:b727  0f 86 0f f8   ora $f80f86
$0e:b72b  03 84         ora $84,s
$0e:b72d  bb            tyx
$0e:b72e  e3 01         sbc $01,s
$0e:b730  ff 24 4b a1   sbc $a14b24,x
$0e:b734  50 b0         bvc $b6e6
$0e:b736  e8            inx
$0e:b737  7a            ply
$0e:b738  1a            inc a
$0e:b739  08            php
$0e:b73a  e7 b3         sbc [$b3]
$0e:b73c  50 78         bvc $b7b6
$0e:b73e  0f 5a 84 a5   ora $a5845a
$0e:b742  ff f8 f7 fe   sbc $fef7f8,x
$0e:b746  1f ff 81 8a   ora $8a81ff,x
$0e:b74a  05 fe         ora $fe
$0e:b74c  12 2f         ora ($2f)
$0e:b74e  ed 17 75      sbc $7517
$0e:b751  79 c3 68      adc $68c3,y
$0e:b754  6f d5 3f ee   adc $ee3fd5
$0e:b758  9b            txy
$0e:b759  f5 4b         sbc $4b,x
$0e:b75b  fb            xce
$0e:b75c  d0 b7         bne $b715
$0e:b75e  70 00         bvs $b760
$0e:b760  70 3f         bvs $b7a1
$0e:b762  83 f3         sta $f3,s
$0e:b764  60            rts
$0e:b765  d0 fc         bne $b763
$0e:b767  2a            rol a
$0e:b768  7f 18 3f c2   adc $c23f18,x
$0e:b76c  9f 94 b7 f0   sta $f0b794,x
$0e:b770  28            plp
$0e:b771  11 0c         ora ($0c),y
$0e:b773  82 4c 28      brl $dfc2
$0e:b776  5c 24 98 2c   jml $2c9824
$0e:b77a  02 09         cop #$09
$0e:b77c  84 d0         sty $d0
$0e:b77e  48            pha
$0e:b77f  27 ff         and [$ff]
$0e:b781  fb            xce
$0e:b782  78            sei
$0e:b783  80 67         bra $b7ec
$0e:b785  a2 01 51      ldx #$5101
$0e:b788  85 ed         sta $ed
$0e:b78a  9c 1f fe      stz $fe1f
$0e:b78d  5c ff 61 79   jml $7961ff
$0e:b791  a6 f3         ldx $f3
$0e:b793  b0 58         bcs $b7ed
$0e:b795  38            sec
$0e:b796  1c 0c ea      trb $ea0c
$0e:b799  15 5e         ora $5e,x
$0e:b79b  b5 b7         lda $b7,x
$0e:b79d  f4 ff 08      pea $08ff
$0e:b7a0  37 fe         and [$fe],y
$0e:b7a2  61 ff         adc ($ff,x)
$0e:b7a4  be 7f d8      ldx $d87f,y
$0e:b7a7  a0 85 09      ldy #$0985
$0e:b7aa  40            rti
$0e:b7ab  00 77         brk #$77
$0e:b7ad  37 ea         and [$ea],y
$0e:b7af  07 0e         ora [$0e]
$0e:b7b1  01 81         ora ($81,x)
$0e:b7b3  4a            lsr a
$0e:b7b4  05 17         ora $17
$0e:b7b6  8b            phb
$0e:b7b7  39 bc c0      and $c0bc,y
$0e:b7ba  26 32         rol $32
$0e:b7bc  29 9b fc      and #$fc9b
$0e:b7bf  27 9f         and [$9f]
$0e:b7c1  fb            xce
$0e:b7c2  f2 88         sbc ($88)
$0e:b7c4  67 5f         adc [$5f]
$0e:b7c6  fc 37 ff      jsr ($ff37,x)
$0e:b7c9  9d ff e6      sta $e6ff,x
$0e:b7cc  08            php
$0e:b7cd  82 6b d7      brl $8f3b
$0e:b7d0  fd 4e f9      sbc $f94e,x
$0e:b7d3  b2 f9         lda ($f9)
$0e:b7d5  9c 9e 77      stz $779e
$0e:b7d8  73 be         adc ($be,s),y
$0e:b7da  e5 ff         sbc $ff
$0e:b7dc  72 3f         adc ($3f)
$0e:b7de  ec ff 8b      cpx $8bff
$0e:b7e1  ff 81 7f e1   sbc $e17f81,x
$0e:b7e5  33 fe         and ($fe,s),y
$0e:b7e7  1b            tcs
$0e:b7e8  14 2f         trb $2f
$0e:b7ea  f8            sed
$0e:b7eb  11 40         ora ($40),y
$0e:b7ed  c0 70 78      cpy #$7870
$0e:b7f0  70 78         bvs $b86a
$0e:b7f2  03 c2         ora $c2,s
$0e:b7f4  09 04 85      ora #$8504
$0e:b7f7  e3 fc         sbc $fc,s
$0e:b7f9  57 38         eor [$38],y
$0e:b7fb  9f cb 5b 5e   sta $5e5bcb,x
$0e:b7ff  bc 07 c1      ldy $c107,x
$0e:b802  c0 3f bf      cpy #$bf3f
$0e:b805  fd c3 ff      sbc $ffc3,x
$0e:b808  0c 74 0b      tsb $0b74
$0e:b80b  fc 32 f3      jsr ($f332,x)
$0e:b80e  0e fc 42      asl $42fc
$0e:b811  cf 90 9e 70   cmp $709e90
$0e:b815  c1 a1         cmp ($a1,x)
$0e:b817  40            rti
$0e:b818  df c1 3f 68   cmp $683fc1,x
$0e:b81c  d0 9b         bne $b7b9
$0e:b81e  f2 32         sbc ($32)
$0e:b820  fe 9e b8      inc $b89e,x
$0e:b823  78            sei
$0e:b824  40            rti
$0e:b825  ac 04 0f      ldy $0f04
$0e:b828  bb            tyx
$0e:b829  88            dey
$0e:b82a  c0 ef eb      cpy #$ebef
$0e:b82d  fb            xce
$0e:b82e  84 47         sty $47
$0e:b830  f6 15         inc $15,x
$0e:b832  8f ff e7 f3   sta $f3e7ff
$0e:b836  cf e7 c8 e4   cmp $e4c8e7
$0e:b83a  70 58         bvs $b894
$0e:b83c  2e 0f 07      rol $070f
$0e:b83f  d4 ea         pei ($ea)
$0e:b841  01 40         ora ($40,x)
$0e:b843  fe 9d cf      inc $cf9d,x
$0e:b846  ff e9 08 32   sbc $3208e9,x
$0e:b84a  b4 60         ldy $60,x
$0e:b84c  d9 3f 19      cmp $193f,y
$0e:b84f  6d 45 bb      adc $bb45
$0e:b852  e9 59 db      sbc #$db59
$0e:b855  6b            rtl
$0e:b856  eb            xba
$0e:b857  3f dd 3e ff   and $ff3edd,x
$0e:b85b  b9 16 fd      lda $fd16,y
$0e:b85e  ff 20 1b ea   sbc $ea1b20,x
$0e:b862  07 fa         ora [$fa]
$0e:b864  08            php
$0e:b865  8c 18 4f      sty $4f18
$0e:b868  fe 49 ff      inc $ff49,x
$0e:b86b  8a            txa
$0e:b86c  7f e2 0d 21   adc $210de2,x
$0e:b870  69 0f 02      adc #$020f
$0e:b873  01 30         ora ($30,x)
$0e:b875  e0 7b 36      cpx #$367b
$0e:b878  15 ef         ora $ef,x
$0e:b87a  a6 f6         ldx $f6
$0e:b87c  d4 6f         pei ($6f)
$0e:b87e  6f 84 03 f9   adc $f90384
$0e:b882  20 ff 1b      jsr $1bff
$0e:b885  02 11         cop #$11
$0e:b887  80 c0         bra $b849
$0e:b889  34 82         bit $82,x
$0e:b88b  05 02         ora $02
$0e:b88d  69 05 02      adc #$0205
$0e:b890  80 d2         bra $b864
$0e:b892  08            php
$0e:b893  24 11         bit $11
$0e:b895  a4 17         ldy $17
$0e:b897  f0 28         beq $b8c1
$0e:b899  ff 40 a3 bf   sbc $bfa340,x
$0e:b89d  09 2c 06      ora #$062c
$0e:b8a0  03 00         ora $00,s
$0e:b8a2  80 8d         bra $b831
$0e:b8a4  c1 62         cmp ($62,x)
$0e:b8a6  10 38         bpl $b8e0
$0e:b8a8  14 8e         trb $8e
$0e:b8aa  41 07         eor ($07,x)
$0e:b8ac  80 7b         bra $b929
$0e:b8ae  f4 1f ef      pea $ef1f
$0e:b8b1  fa            plx
$0e:b8b2  fc 08 e0      jsr ($e008,x)
$0e:b8b5  bf 0f e7 ff   lda $ffe70f,x
$0e:b8b9  bb            tyx
$0e:b8ba  fe 2f 04      inc $042f,x
$0e:b8bd  1f f0 90 04   ora $0490f0,x
$0e:b8c1  80 1d         bra $b8e0
$0e:b8c3  41 a6         eor ($a6,x)
$0e:b8c5  89 01 37      bit #$3701
$0e:b8c8  83 3f         sta $3f,s
$0e:b8ca  ce 65 20      dec $2065
$0e:b8cd  e0 74 3c      cpx #$3c74
$0e:b8d0  19 6f 04      ora $046f,y
$0e:b8d3  bf e1 49 db   lda $db49e1,x
$0e:b8d7  1c 17 c0      trb $c017
$0e:b8da  86 1f         stx $1f
$0e:b8dc  b1 34         lda ($34),y
$0e:b8de  09 a1 01      ora #$01a1
$0e:b8e1  80 c0         bra $b8a3
$0e:b8e3  e0 70 78      cpx #$7870
$0e:b8e6  3c 36 1b      bit $1b36,x
$0e:b8e9  19 8c cc      ora $cc8c,y
$0e:b8ec  66 36         ror $36
$0e:b8ee  3b            tsc
$0e:b8ef  1f 27 9e 0f   ora $0f9e27,x
$0e:b8f3  21 b8         and ($b8,x)
$0e:b8f5  42 e1         wdm #$e1
$0e:b8f7  31 78         and ($78),y
$0e:b8f9  8c be 43      sty $43be
$0e:b8fc  5d a0 ec      eor $eca0,x
$0e:b8ff  70 34         bvs $b935
$0e:b901  04 80         tsb $80
$0e:b903  44 30 18      mvp $18,$30
$0e:b906  49 05 8b      eor #$8b05
$0e:b909  23 d0         and $d0,s
$0e:b90b  d8            cld
$0e:b90c  6c 38 16      jmp ($1638)
$0e:b90f  1e 0c 84      asl $840c,x
$0e:b912  0a            asl a
$0e:b913  1e 0f c5      asl $c50f,x
$0e:b916  e3 fd         sbc $fd,s
$0e:b918  1c ff f3      trb $f3ff
$0e:b91b  a7 f2         lda [$f2]
$0e:b91d  ea            nop
$0e:b91e  fc fa 3f      jsr ($3ffa,x)
$0e:b921  0e 8f ff      asl $ff8f
$0e:b924  e7 f7         sbc [$f7]
$0e:b926  fc f9 44      jsr ($44f9,x)
$0e:b929  33 fe         and ($fe,s),y
$0e:b92b  7a            ply
$0e:b92c  ff 8f 5f f3   sbc $f35f8f,x
$0e:b930  d5 df         cmp $df,x
$0e:b932  7b            tdc
$0e:b933  33 eb         and ($eb,s),y
$0e:b935  fe fe 7f      inc $7ffe,x
$0e:b938  df 27 04 3f   cmp $3f0427,x
$0e:b93c  ef 07 fd 99   sbc $99fd07
$0e:b940  c2 07         rep #$07
$0e:b942  fd 06 82      sbc $8206,x
$0e:b945  3c 38 1c      bit $1c38,x
$0e:b948  02 00         cop #$00
$0e:b94a  6c 3e 1d      jmp ($1d3e)
$0e:b94d  8f c6 b3 f9   sta $f9b3c6
$0e:b951  d6 ff         dec $ff,x
$0e:b953  29 c0 de      and #$dec0
$0e:b956  14 0a         trb $0a
$0e:b958  06 83         asl $83
$0e:b95a  41 90         eor ($90,x)
$0e:b95c  c8            iny
$0e:b95d  72 39         adc ($39)
$0e:b95f  1a            inc a
$0e:b960  4d 27 0b      eor $0b27
$0e:b963  85 81         sta $81
$0e:b965  c0 83 04      cpy #$0483
$0e:b968  1a            inc a
$0e:b969  10 7f         bpl $b9ea
$0e:b96b  e4 11         cpx $11
$0e:b96d  26 1f         rol $1f
$0e:b96f  fb            xce
$0e:b970  ff 2e 83 ff   sbc $ff832e,x
$0e:b974  b8            clv
$0e:b975  a3 d5         lda $d5,s
$0e:b977  30 00         bmi $b979
$0e:b979  d0 bf         bne $b93a
$0e:b97b  f0 ef         beq $b96c
$0e:b97d  a0 e0 e5      ldy #$e5e0
$0e:b980  f0 3f         beq $b9c1
$0e:b982  ff 03 70 6f   sbc $6f7003,x
$0e:b986  20 7f 68      jsr $687f
$0e:b989  4f d3 9f de   eor $de9fd3
$0e:b98d  93 a9         sta ($a9,s),y
$0e:b98f  43 87         eor $87,s
$0e:b991  fc 59 82      jsr ($8259,x)
$0e:b994  cc 27 eb      cpy $eb27
$0e:b997  00 06         brk #$06
$0e:b999  87 13         sta [$13]
$0e:b99b  ff 06 ff c1   sbc $c1ff06,x
$0e:b99f  3c e9 60      bit $60e9,x
$0e:b9a2  be 7c e0      ldx $e07c,y
$0e:b9a5  5f f9 ff e6   eor $e6fff9,x
$0e:b9a9  03 ff         ora $ff,s
$0e:b9ab  8f ef 28 1b   sta $1b28ef
$0e:b9af  fa            plx
$0e:b9b0  7e 1e f8      ror $f81e,x
$0e:b9b3  cd 0e 1c      cmp $1c0e
$0e:b9b6  fb            xce
$0e:b9b7  ff 03 f0 93   sbc $93f003,x
$0e:b9bb  82 03 f0      brl $a9c1
$0e:b9be  87 a3         sta [$a3]
$0e:b9c0  cd b0 11      cmp $11b0
$0e:b9c3  9f f5 df c9   sta $c9dff5,x
$0e:b9c7  fd ec f9      sbc $f9ec,x
$0e:b9ca  bf fa 0e 7e   lda $7e0efa,x
$0e:b9ce  31 de         and ($de),y
$0e:b9d0  5f e8 cf 9e   eor $9ecfe8,x
$0e:b9d4  fd bd f1      sbc $f1bd,x
$0e:b9d7  6f f8 1c fd   adc $fd1cf8
$0e:b9db  86 27         stx $27
$0e:b9dd  fc ef 16      jsr ($16ef,x)
$0e:b9e0  10 46         bpl $ba28
$0e:b9e2  2f ff 69 3e   and $3e69ff
$0e:b9e6  ff 37 67 ff   sbc $ff6737,x
$0e:b9ea  c1 7f         cmp ($7f,x)
$0e:b9ec  b5 50         lda $50,x
$0e:b9ee  79 5f f3      adc $f35f,y
$0e:b9f1  00 51         brk #$51
$0e:b9f3  a3 ff         lda $ff,s
$0e:b9f5  60            rts
$0e:b9f6  7f 38 6e 76   adc $766e38,x
$0e:b9fa  ee ef 08      inc $08ef
$0e:b9fd  8d 12 ab      sta $ab12
$0e:ba00  55 ee         eor $ee,x
$0e:ba02  d5 77         cmp $77,x
$0e:ba04  75 58         adc $58,x
$0e:ba06  8f fc 3c 0d   sta $0d3cfc
$0e:ba0a  80 dd         bra $b9e9
$0e:ba0c  d1 22         cmp ($22),y
$0e:ba0e  3e e1 c8      rol $c8e1,x
$0e:ba11  0e 47 76      asl $7647
$0e:ba14  44 11 c8      mvp $c8,$11
$0e:ba17  40            rti
$0e:ba18  75 7e         adc $7e,x
$0e:ba1a  3f 54 8f d7   and $d78f54,x
$0e:ba1e  63 e5         adc $e5,s
$0e:ba20  48            pha
$0e:ba21  fa            plx
$0e:ba22  72 3f         adc ($3f)
$0e:ba24  e4 6f         cpx $6f
$0e:ba26  ff 08 77 87   sbc $877708,x
$0e:ba2a  8f 39 e3 8e   sta $8ee339
$0e:ba2e  78            sei
$0e:ba2f  eb            xba
$0e:ba30  86 10         stx $10
$0e:ba32  f9 c3 3f      sbc $3fc3,y
$0e:ba35  f1 02         sbc ($02),y
$0e:ba37  d9 57 f4      cmp $f457,y
$0e:ba3a  0c 50 37      tsb $3750
$0e:ba3d  84 7f         sty $7f
$0e:ba3f  c0 71 24      cpy #$2471
$0e:ba42  79 9f b7      adc $b79f,y
$0e:ba45  67 7c         adc [$7c]
$0e:ba47  ea            nop
$0e:ba48  4a            lsr a
$0e:ba49  20 09 3a      jsr $3a09
$0e:ba4c  77 87         adc [$87],y
$0e:ba4e  f1 29         sbc ($29),y
$0e:ba50  6a            ror a
$0e:ba51  f5 fe         sbc $fe,x
$0e:ba53  ff 7f 3f 9f   sbc $9f3f7f,x
$0e:ba57  8f c7 c3 e1   sta $e1c3c7
$0e:ba5b  57 a7         eor [$a7],y
$0e:ba5d  f9 8a 1f      sbc $1f8a,y
$0e:ba60  cf f7 e3 fd   cmp $fde3f7
$0e:ba64  f0 ff         beq $ba65
$0e:ba66  78            sei
$0e:ba67  15 ed         ora $ed,x
$0e:ba69  7f ff cf ff   adc $ffcfff,x
$0e:ba6d  f1 f5         sbc ($f5),y
$0e:ba6f  7b            tdc
$0e:ba70  35 0a         and $0a,x
$0e:ba72  ff 3f 9f c7   sbc $c79f3f,x
$0e:ba76  e3 f0         sbc $f0,s
$0e:ba78  f8            sed
$0e:ba79  7c 06 03      jmp ($0306,x)
$0e:ba7c  03 81         ora $81,s
$0e:ba7e  c1 a0         cmp ($a0,x)
$0e:ba80  f0 c8         beq $ba4a
$0e:ba82  7c 4e 3f      jmp ($3f4e,x)
$0e:ba85  2e 9f d7      rol $d79f
$0e:ba88  2f ff 71 e0   and $e071ff
$0e:ba8c  40            rti
$0e:ba8d  60            rts
$0e:ba8e  50 28         bvc $bab8
$0e:ba90  24 12         bit $12
$0e:ba92  11 08         ora ($08),y
$0e:ba94  89 c4 e5      bit #$e5c4
$0e:ba97  d2 ea         cmp ($ea)
$0e:ba99  e5 73         sbc $73
$0e:ba9b  ef f7 d1 6f   sbc $6fd1f7
$0e:ba9f  b1 df         lda ($df),y
$0e:baa1  e9 e7 f3      sbc #$f3e7
$0e:baa4  c9 fc c4      cmp #$c4fc
$0e:baa7  7e 27 1f      ror $1f27,x
$0e:baaa  8f 80 6c 68   sta $686c80
$0e:baae  50 28         bvc $bad8
$0e:bab0  74 3a         stz $3a,x
$0e:bab2  79 3c f2      adc $f23c,y
$0e:bab5  79 31 18      adc $1831,y
$0e:bab8  89 c4 e0      bit #$e0c4
$0e:babb  36 5e         rol $5e,x
$0e:babd  19 0f 02      ora $020f,y
$0e:bac0  e3 15         sbc $15,s
$0e:bac2  aa            tax
$0e:bac3  c8            iny
$0e:bac4  2c 30 3c      bit $3c30
$0e:bac7  14 8e         trb $8e
$0e:bac9  41 0f         eor ($0f,x)
$0e:bacb  84 7b         sty $7b
$0e:bacd  f4 10 e8      pea $e810
$0e:bad0  fc 7a 1f      jsr ($1f7a,x)
$0e:bad3  8a            txa
$0e:bad4  9f c7 bf f7   sta $f7bfc7,x
$0e:bad8  cf ff 77 fd   cmp $fd77ff
$0e:badc  f3 fe         sbc ($fe,s),y
$0e:bade  41 ff         eor ($ff,x)
$0e:bae0  1e ff 7f      asl $7fff,x
$0e:bae3  9f df d3 ef   sta $efd3df,x
$0e:bae7  f8            sed
$0e:bae8  ff f9 9d ff   sbc $ff9df9,x
$0e:baec  f7 ff         sbc [$ff],y
$0e:baee  be ff df      ldx $dfff,y
$0e:baf1  95 e1         sta $e1,x
$0e:baf3  ef eb f1 fc   sbc $fcf1eb
$0e:baf7  7c 3c 1e      jmp ($1e3c,x)
$0e:bafa  0f b3 99 de   ora $de99b3
$0e:bafe  ef 67 d3 eb   sbc $ebd367
$0e:bb02  f1 74         sbc ($74),y
$0e:bb04  20 ff c8      jsr $c8ff
$0e:bb07  21 bc         and ($bc,x)
$0e:bb09  1c c1 cb      trb $cbc1
$0e:bb0c  a0 ff ee      ldy #$eeff
$0e:bb0f  1f dc 16 fe   ora $fe16dc,x
$0e:bb13  20 6f 13      jsr $136f
$0e:bb16  a0 27 c2      ldy #$c227
$0e:bb19  ff c3 be a0   sbc $a0bec3,x
$0e:bb1d  c7 01         cmp [$01]
$0e:bb1f  3f e8 7f ff   and $ff7fe8,x
$0e:bb23  9b            txy
$0e:bb24  78            sei
$0e:bb25  c7 fa         cmp [$fa]
$0e:bb27  23 ff         and $ff,s
$0e:bb29  e0 77 e4      cpx #$e477
$0e:bb2c  1f 78 47 f6   ora $f64778,x
$0e:bb30  05 bf         ora $bf
$0e:bb32  a0 7f ff      ldy #$ff7f
$0e:bb35  88            dey
$0e:bb36  d1 3f         cmp ($3f),y
$0e:bb38  07 03         ora [$03]
$0e:bb3a  fe 8a 05      inc $058a,x
$0e:bb3d  41 93         eor ($93,x)
$0e:bb3f  03 7d         ora $7d,s
$0e:bb41  45 f6         eor $f6
$0e:bb43  45 ff         eor $ff
$0e:bb45  b0 6f         bcs $bbb6
$0e:bb47  f4 17 7b      pea $7b17
$0e:bb4a  46 ff         lsr $ff
$0e:bb4c  c1 3f         cmp ($3f,x)
$0e:bb4e  c7 40         cmp [$40]
$0e:bb50  39 03 02      and $0203,y
$0e:bb53  a0 d9 eb      ldy #$ebd9
$0e:bb56  07 7e         ora [$7e]
$0e:bb58  4f cf b8 73   eor $73b8cf
$0e:bb5c  fe 7a 6a      inc $6a7a,x
$0e:bb5f  c7 1f         cmp [$1f]
$0e:bb61  f3 83         sbc ($83,s),y
$0e:bb63  fe 6a ea      inc $ea6a,x
$0e:bb66  9f 84 10 ff   sta $ff1084,x
$0e:bb6a  20 68 b0      jsr $b068
$0e:bb6d  ff 40 51 60   sbc $605140,x
$0e:bb71  e9 18 07      sbc #$0718
$0e:bb74  7f 8f c7 e3   adc $e3c78f,x
$0e:bb78  64 f8         stz $f8
$0e:bb7a  7d 5e 3f      adc $3f5e,x
$0e:bb7d  cb            wai
$0e:bb7e  e7 df         sbc [$df]
$0e:bb80  ff f8 7f dc   sbc $dc7ff8,x
$0e:bb84  8f 7f 1f 73   sta $731f7f
$0e:bb88  c6 dc         dec $dc
$0e:bb8a  f0 f7         beq $bb83
$0e:bb8c  9c 7f c7      stz $c77f
$0e:bb8f  cf d9 ff 7c   cmp $7cffd9
$0e:bb93  87 03         sta [$03]
$0e:bb95  df d0 c6 f9   cmp $f9c6d0,x
$0e:bb99  fb            xce
$0e:bb9a  b6 7d         ldx $7d,y
$0e:bb9c  6f 5e bf e5   adc $e5bf5e
$0e:bba0  d7 f5         cmp [$f5],y
$0e:bba2  ff e1 90 87   sbc $8790e1,x
$0e:bba6  ef e9 fe fc   sbc $fcfee9
$0e:bbaa  ad ff 0b      lda $0bff
$0e:bbad  ff 82 88 c4   sbc $c48882,x
$0e:bbb1  e8            inx
$0e:bbb2  01 a1         ora ($a1,x)
$0e:bbb4  0d 86 87      ora $8786
$0e:bbb7  ff 02 ff d2   sbc $d2ff02,x
$0e:bbbb  ff fa 9f fd   sbc $fd9ffa,x
$0e:bbbf  8b            phb
$0e:bbc0  ff b4 fd f0   sbc $f0fdb4,x
$0e:bbc4  86 83         stx $83
$0e:bbc6  ff c0 8c 04   sbc $048cc0,x
$0e:bbca  f0 03         beq $bbcf
$0e:bbcc  52 c8         eor ($c8)
$0e:bbce  29 47 43      and #$4347
$0e:bbd1  00 27         brk #$27
$0e:bbd3  cc 32 07      cpy $0732
$0e:bbd6  cf 9f 93 ea   cmp $ea939f
$0e:bbda  11 00         ora ($00),y
$0e:bbdc  c0 13 d6      cpy #$d613
$0e:bbdf  03 00         ora $00,s
$0e:bbe1  86 97         stx $97
$0e:bbe3  07 f9         ora [$f9]
$0e:bbe5  ff 6d 81 bd   sbc $bd816d,x
$0e:bbe9  8d 69 03      sta $0369
$0e:bbec  80 46         bra $bc34
$0e:bbee  20 13 a8      jsr $a813
$0e:bbf1  65 66         adc $66
$0e:bbf3  7d b4 bd      adc $bdb4,x
$0e:bbf6  fd bf 38      sbc $38bf,x
$0e:bbf9  7f c5 0f 79   adc $790fc5,x
$0e:bbfd  20 ef a3      jsr $a3ef
$0e:bc00  c2 65         rep #$65
$0e:bc02  00 a0         brk #$a0
$0e:bc04  c0 20 90      cpy #$9020
$0e:bc07  08            php
$0e:bc08  34 02         bit $02,x
$0e:bc0a  0f 00 a1 c0   ora $c0a100
$0e:bc0e  24 10         bit $10
$0e:bc10  0e 0f 07      asl $070f
$0e:bc13  c3 e1         cmp $e1,s
$0e:bc15  e9 7c f9      sbc #$f97c
$0e:bc18  9f fc 47 ff   sta $ff47fc,x
$0e:bc1c  15 ff         ora $ff,x
$0e:bc1e  c6 ae         dec $ae
$0e:bc20  07 fd         ora [$fd]
$0e:bc22  c0 ef f0      cpy #$f0ef
$0e:bc25  79 dc 2e      adc $2edc,y
$0e:bc28  27 13         and [$13]
$0e:bc2a  11 88         ora ($88),y
$0e:bc2c  c5 62         cmp $62
$0e:bc2e  b1 b8         lda ($b8),y
$0e:bc30  d6 48         dec $48,x
$0e:bc32  0a            asl a
$0e:bc33  0b            phd
$0e:bc34  ef ff b3 ff   sbc $ffb3ff
$0e:bc38  e4 7f         cpx $7f
$0e:bc3a  fd 9f fe      sbc $fe9f,x
$0e:bc3d  d7 ff         cmp [$ff],y
$0e:bc3f  db            stp
$0e:bc40  ff e0 ed f1   sbc $f1ede0,x
$0e:bc44  c3 e1         cmp $e1,s
$0e:bc46  e8            inx
$0e:bc47  f4 79 1c      pea $1c79
$0e:bc4a  8f 67 b3 b5   sta $b5b367
$0e:bc4e  da            phx
$0e:bc4f  f6 ed         inc $ed,x
$0e:bc51  d0 77         bne $bcca
$0e:bc53  a8            tay
$0e:bc54  28            plp
$0e:bc55  1d e1 bf      ora $bfe1,x
$0e:bc58  7d 0b bd      adc $bd0b,x
$0e:bc5b  de e3 bf      dec $bfe3,x
$0e:bc5e  05 8b         ora $8b
$0e:bc60  bc 7f bf      ldy $bf7f,x
$0e:bc63  ff cf ff e3   sbc $e3ffcf,x
$0e:bc67  f5 f0         sbc $f0,x
$0e:bc69  f0 b8         beq $bc23
$0e:bc6b  78            sei
$0e:bc6c  5c 3f ef ff   jml $ffef3f
$0e:bc70  fe 0f b7      inc $b70f,x
$0e:bc73  d3 f9         cmp ($f9,s),y
$0e:bc75  c0 fc e0      cpy #$e0fc
$0e:bc78  70 78         bvs $bcf2
$0e:bc7a  32 7d         and ($7d)
$0e:bc7c  47 20         eor [$20]
$0e:bc7e  16 21         asl $21,x
$0e:bc80  d8            cld
$0e:bc81  0b            phd
$0e:bc82  f2 fd         sbc ($fd)
$0e:bc84  ba            tsx
$0e:bc85  ff 4c bf d6   sbc $d6bf4c,x
$0e:bc89  4f e5 33 f9   eor $f933e5
$0e:bc8d  98            tya
$0e:bc8e  fc 6e 3f      jsr ($3f6e,x)
$0e:bc91  17 0f         ora [$0f],y
$0e:bc93  87 43         sta [$43]
$0e:bc95  e1 82         sbc ($82,x)
$0e:bc97  c1 40         cmp ($40,x)
$0e:bc99  a0 50 48      ldy #$4850
$0e:bc9c  24 32         bit $32
$0e:bc9e  19 18 8c      ora $8c18,y
$0e:bca1  4e 27 17      lsr $1727
$0e:bca4  0b            phd
$0e:bca5  87 43         sta [$43]
$0e:bca7  a0 1d 0e      ldy #$0e1d
$0e:bcaa  df 7f bb 97   cmp $97bb7f,x
$0e:bcae  ee e7 fa      inc $fae7
$0e:bcb1  9d fc a6      sta $a6fc,x
$0e:bcb4  3f 39 9f c6   and $c69f39,x
$0e:bcb8  47 fb         eor [$fb]
$0e:bcba  7d bf df      adc $dfbf,x
$0e:bcbd  6f 63 91 dc   adc $dc9163
$0e:bcc1  e6 76         inc $76
$0e:bcc3  19 0f 06      ora $060f,y
$0e:bcc6  03 e1         ora $e1,s
$0e:bcc8  90 b0         bcc $bc7a
$0e:bcca  40            rti
$0e:bccb  3f e1 d0 fd   and $fdd0e1,x
$0e:bccf  fe fe a9      inc $a9fe,x
$0e:bcd2  30 f9         bmi $bccd
$0e:bcd4  fb            xce
$0e:bcd5  52 e1         eor ($e1)
$0e:bcd7  63 ee         adc $ee,s
$0e:bcd9  d9 fb 29      cmp $29fb,y
$0e:bcdc  20 49 07      jsr $0749
$0e:bcdf  c5 46         cmp $46
$0e:bce1  3e 15 38      rol $3815,x
$0e:bce4  d0 55         bne $bd3b
$0e:bce6  63 7a         adc $7a,s
$0e:bce8  bf ce ab f7   lda $f7abce,x
$0e:bcec  19 ff d7      ora $d7ff,y
$0e:bcef  7f f6 ff db   adc $dbfff6,x
$0e:bcf3  b7 ff         lda [$ff],y
$0e:bcf5  7b            tdc
$0e:bcf6  ff bf 3f a2   sbc $a23fbf,x
$0e:bcfa  91 18         sta ($18),y
$0e:bcfc  03 43         ora $43,s
$0e:bcfe  21 92         and ($92,x)
$0e:bd00  c9 6c d6      cmp #$d66c
$0e:bd03  69 74 ba      adc #$ba74
$0e:bd06  ef 77 b7 fb   sbc $fbb777
$0e:bd0a  ef fa fb fe   sbc $fefbfa
$0e:bd0e  3e ff 9f      rol $9fff,x
$0e:bd11  69 87 ff      adc #$ff87
$0e:bd14  7f fe de de   adc $dedefe,x
$0e:bd18  3e f6 2e      rol $2ef6,x
$0e:bd1b  ec be 5f      cpx $5fbe
$0e:bd1e  0f 87 c7 dc   ora $dcc787
$0e:bd22  62 0d 00      per $bd32
$0e:bd25  68            pla
$0e:bd26  5f dd 63 f7   eor $f763dd,x
$0e:bd2a  fb            xce
$0e:bd2b  f2 bc         sbc ($bc)
$0e:bd2d  6a            ror a
$0e:bd2e  30 f5         bmi $bd25
$0e:bd30  78            sei
$0e:bd31  f4 3e 1d      pea $1d3e
$0e:bd34  57 8f         eor [$8f],y
$0e:bd36  57 e3         eor [$e3],y
$0e:bd38  7c 87 df      jmp ($df87,x)
$0e:bd3b  91 e3         sta ($e3),y
$0e:bd3d  ee 7c 79      inc $797c
$0e:bd40  c0 10 f0      cpy #$f010
$0e:bd43  e7 bc         sbc [$bc]
$0e:bd45  79 c0 49      adc $49c0,y
$0e:bd48  34 42         bit $42,x
$0e:bd4a  7f cf 07 d7   adc $d707cf,x
$0e:bd4e  fe 1e 1f      inc $1f1e,x
$0e:bd51  c8            iny
$0e:bd52  0f ff 25 ff   ora $ff25ff
$0e:bd56  a0 ff f5      ldy #$f5ff
$0e:bd59  3f ff 17 ff   and $ff17ff,x
$0e:bd5d  69 fb fd      adc #$fdfb
$0e:bd60  7f c7 82 2f   adc $2f82c7,x
$0e:bd64  0c 10 c9      tsb $c910
$0e:bd67  76 1f         ror $1f,x
$0e:bd69  f1 d9         sbc ($d9),y
$0e:bd6b  56 fe         lsr $fe,x
$0e:bd6d  d3 ff         cmp ($ff,s),y
$0e:bd6f  04 7e         tsb $7e
$0e:bd71  33 e6         and ($e6,s),y
$0e:bd73  e7 6d         sbc [$6d]
$0e:bd75  47 84         eor [$84]
$0e:bd77  3c 0d 24      bit $240d,x
$0e:bd7a  03 81         ora $81,s
$0e:bd7c  00 f0         brk #$f0
$0e:bd7e  40            rti
$0e:bd7f  23 30         and $30,s
$0e:bd81  0e 76 10      asl $1076
$0e:bd84  b2 9a         lda ($9a)
$0e:bd86  7f c4 07 fd   adc $fd07c4,x
$0e:bd8a  34 e5         bit $e5,x
$0e:bd8c  e6 6c         inc $6c
$0e:bd8e  df 6b 6e fc   cmp $fc6e6b,x
$0e:bd92  b2 70         lda ($70)
$0e:bd94  78            sei
$0e:bd95  04 06         tsb $06
$0e:bd97  01 34         ora ($34,x)
$0e:bd99  80 66         bra $be01
$0e:bd9b  60            rts
$0e:bd9c  1f 6b 26 fc   ora $fc266b,x
$0e:bda0  f2 7c         sbc ($7c)
$0e:bda2  f9 87 ce      sbc $ce87,y
$0e:bda5  19 fe 80      ora $80fe,y
$0e:bda8  cf f8 18 fb   cmp $fb18f8
$0e:bdac  99 65 39      sta $3965,y
$0e:bdaf  f0 0f         beq $bdc0
$0e:bdb1  9c 03 fd      stz $fd03
$0e:bdb4  00 9f         brk #$9f
$0e:bdb6  c0 31 f0      cpy #$f031
$0e:bdb9  32 ca         and ($ca)
$0e:bdbb  40            rti
$0e:bdbc  15 f3         ora $f3,x
$0e:bdbe  03 80         ora $80,s
$0e:bdc0  41 20         eor ($20,x)
$0e:bdc2  4a            lsr a
$0e:bdc3  fa            plx
$0e:bdc4  5d 04 06      eor $0604,x
$0e:bdc7  0f 1f ff b3   ora $b3ff1f
$0e:bdcb  ca            dex
$0e:bdcc  bf ff 9f ff   lda $ff9fff,x
$0e:bdd0  cf 21 7f 6c   cmp $6c7f21
$0e:bdd4  0c 7d be      tsb $be7d
$0e:bdd7  75 fa         adc $fa,x
$0e:bdd9  fc fe 7e      jsr ($7efe,x)
$0e:bddc  89 0b fd      bit #$fd0b
$0e:bddf  fd 12 1d      sbc $1d12,x
$0e:bde2  ff fe 7d b0   sbc $b07dfe,x
$0e:bde6  2e f0 79      rol $79f0
$0e:bde9  93 c4         sta ($c4,s),y
$0e:bdeb  1e 21 df      asl $df21,x
$0e:bdee  ef e7 f3 ee   sbc $eef3e7
$0e:bdf2  d1 ef         cmp ($ef),y
$0e:bdf4  80 c8         bra $bdbe
$0e:bdf6  02 00         cop #$00
$0e:bdf8  10 fb         bpl $bdf5
$0e:bdfa  ff c1 e1 ef   sbc $efe1c1,x
$0e:bdfe  09 0b bc      ora #$bc0b
$0e:be01  1e a4 79      asl $79a4,x
$0e:be04  0c 38 7c      tsb $7c38
$0e:be07  71 e2         adc ($e2),y
$0e:be09  31 05         and ($05),y
$0e:be0b  92 24         sta ($24)
$0e:be0d  11 21         ora ($21),y
$0e:be0f  dd 9f 6d      cmp $6d9f,x
$0e:be12  6e d5 bf      ror $bfd5
$0e:be15  e6 52         inc $52
$0e:be17  ff 2b ea c5   sbc $c5ea2b,x
$0e:be1b  fd 31 de      sbc $de31,x
$0e:be1e  9e db f3      stz $f3db,x
$0e:be21  00 ff         brk #$ff
$0e:be23  c2 3f         rep #$3f
$0e:be25  e7 10         sbc [$10]
$0e:be27  21 94         and ($94,x)
$0e:be29  0f f9 27 fc   ora $fc27f9
$0e:be2d  41 ff         eor ($ff,x)
$0e:be2f  1a            inc a
$0e:be30  0f 04 83 c1   ora $c18304
$0e:be34  40            rti
$0e:be35  e0 14 c3      cpx #$c314
$0e:be38  00 57         brk #$57
$0e:be3a  15 79         ora $79,x
$0e:be3c  68            pla
$0e:be3d  34 12         bit $12,x
$0e:be3f  09 05 00      ora #$0005
$0e:be42  c6 25         dec $25
$0e:be44  76 c6         ror $c6,x
$0e:be46  47 f3         eor [$f3]
$0e:be48  99 f8 e4      sta $e4f8,y
$0e:be4b  7e 79 3f      ror $3f79,x
$0e:be4e  3a            dec a
$0e:be4f  84 70         sty $70
$0e:be51  ec 11 fb      cpx $fb11
$0e:be54  c5 7e         cmp $7e
$0e:be56  c1 00         cmp ($00,x)
$0e:be58  3f 87 82 01   and $018287,x
$0e:be5c  c0 42 29      cpy #$2942
$0e:be5f  68            pla
$0e:be60  28            plp
$0e:be61  fb            xce
$0e:be62  da            phx
$0e:be63  7e d6 9f      ror $9fd6,x
$0e:be66  b7 af         lda [$af],y
$0e:be68  ea            nop
$0e:be69  eb            xba
$0e:be6a  fa            plx
$0e:be6b  fb            xce
$0e:be6c  fe 5e ff      inc $ff5e,x
$0e:be6f  9f bf eb e0   sta $e0ebbf,x
$0e:be73  a9 f1 83      lda #$83f1
$0e:be76  c1 e1         cmp ($e1,x)
$0e:be78  70 b8         bvs $be32
$0e:be7a  7c 3e 2f      jmp ($2f3e,x)
$0e:be7d  17 6f         ora [$6f],y
$0e:be7f  84 be         sty $be
$0e:be81  5f ff 57 84   eor $8457ff,x
$0e:be85  fa            plx
$0e:be86  7d cd a6      adc $a6cd,x
$0e:be89  6c e0 5f      jmp ($5fe0)
$0e:be8c  d1 f8         cmp ($f8),y
$0e:be8e  44 3d e3      mvp $e3,$3d
$0e:be91  f0 5f         beq $bef2
$0e:be93  74 62         stz $62,x
$0e:be95  01 35         ora ($35,x)
$0e:be97  8e d8 a4      stx $a4d8
$0e:be9a  f6 59         inc $59,x
$0e:be9c  3d 62 79      and $7962,x
$0e:be9f  44 9c 49      mvp $49,$9c
$0e:bea2  e3 71         sbc $71,s
$0e:bea4  d8            cld
$0e:bea5  1c 1e 3f      trb $3f1e
$0e:bea8  02 9f         cop #$9f
$0e:beaa  c6 2f         dec $2f
$0e:beac  ee 30 81      inc $8130
$0e:beaf  b9 86 01      lda $0186,y
$0e:beb2  3f 80 47 f5   and $f54780,x
$0e:beb6  7e 3d 57      ror $573d,x
$0e:beb9  8d df 5e      sta $5edf
$0e:bebc  3c e3 ff      bit $ffe3,x
$0e:bebf  2f f8 f9 ff   and $fff9f8
$0e:bec3  3c 1f 5f      bit $5f1f,x
$0e:bec6  f8            sed
$0e:bec7  78            sei
$0e:bec8  7f 2c 18 0c   adc $0c182c,x
$0e:becc  87 82         sta [$82]
$0e:bece  91 70         sta ($70),y
$0e:bed0  94 74         sty $74,x
$0e:bed2  2a            rol a
$0e:bed3  96 8d         stx $8d,y
$0e:bed5  a7 e2         lda [$e2]
$0e:bed7  15 34         ora $34,x
$0e:bed9  aa            tax
$0e:beda  f7 90         sbc [$90],y
$0e:bedc  61 f0         adc ($f0,x)
$0e:bede  80 5e         bra $bf3e
$0e:bee0  30 1f         bmi $bf01
$0e:bee2  88            dey
$0e:bee3  05 f3         ora $f3
$0e:bee5  01 fc         ora ($fc,x)
$0e:bee7  80 4f         bra $bf38
$0e:bee9  b8            clv
$0e:beea  1d f9 07      ora $07f9,x
$0e:beed  a3 c3         lda $c3,s
$0e:beef  e0 f0 fa      cpx #$faf0
$0e:bef2  fc 5e 1f      jsr ($1f5e,x)
$0e:bef5  4f 43 93 a4   eor $a49343
$0e:bef9  b2 c0         lda ($c0)
$0e:befb  60            rts
$0e:befc  11 08         ora ($08),y
$0e:befe  87 9b         sta [$9b]
$0e:bf00  fe 5f 0f      inc $0f5f,x
$0e:bf03  21 80         and ($80,x)
$0e:bf05  78            sei
$0e:bf06  df f8 d7 ff   cmp $ffd7f8,x
$0e:bf0a  fd ff f7      sbc $f7ff,x
$0e:bf0d  18            clc
$0e:bf0e  02 31         cop #$31
$0e:bf10  4a            lsr a
$0e:bf11  e6 63         inc $63
$0e:bf13  71 d3         adc ($d3),y
$0e:bf15  19 b7 37      ora $37b7,y
$0e:bf18  f5 52         sbc $52,x
$0e:bf1a  d6 6b         dec $6b,x
$0e:bf1c  28            plp
$0e:bf1d  1c 08 04      trb $0408
$0e:bf20  03 fd         ora $fd,s
$0e:bf22  30 ff         bmi $bf23
$0e:bf24  5c 3f fc 8f   jml $8ffc3f
$0e:bf28  fa            plx
$0e:bf29  e4 0f         cpx $0f
$0e:bf2b  e1 00         sbc ($00,x)
$0e:bf2d  f6 40         inc $40,x
$0e:bf2f  38            sec
$0e:bf30  1f f9 fd ff   ora $fffdf9,x
$0e:bf34  3f bf ef f7   and $f7efbf,x
$0e:bf38  f4 fd ff      pea $fffd
$0e:bf3b  1e bf e7      asl $e7bf,x
$0e:bf3e  eb            xba
$0e:bf3f  fe fe 7f      inc $7ffe,x
$0e:bf42  d7 fd         cmp [$fd],y
$0e:bf44  fc ff bf      jsr ($bfff,x)
$0e:bf47  1f 0f 87 de   ora $de870f,x
$0e:bf4b  0f fb 53 84   ora $8453fb
$0e:bf4f  0f fb 00 43   ora $4300fb
$0e:bf53  04 02         tsb $02
$0e:bf55  03 01         ora $01,s
$0e:bf57  8c c6 6f      sty $6fc6
$0e:bf5a  d7 7f         cmp [$7f],y
$0e:bf5c  27 f7         and [$f7]
$0e:bf5e  b2 5f         lda ($5f)
$0e:bf60  0d 07 3f      ora $3f07
$0e:bf63  18            clc
$0e:bf64  af 28 c4 66   lda $66c428
$0e:bf68  cf 7e de f8   cmp $f8de7e
$0e:bf6c  b7 fc         lda [$fc],y
$0e:bf6e  0e 7e c3      asl $c37e
$0e:bf71  12 8a         ora ($8a)
$0e:bf73  08            php
$0e:bf74  06 03         asl $03
$0e:bf76  01 98         ora ($98,x)
$0e:bf78  8c 5f be      sty $be5f
$0e:bf7b  d2 7d         cmp ($7d)
$0e:bf7d  fe 6e cf      inc $cf6e,x
$0e:bf80  ff 82 ff 6a   sbc $6aff82,x
$0e:bf84  ac f2 8c      ldy $8cf2
$0e:bf87  66 3c         ror $3c
$0e:bf89  cc 60 a3      cpy $a360
$0e:bf8c  ff 60 7f 38   sbc $387f60,x
$0e:bf90  6e 76 ee      ror $ee76
$0e:bf93  00 20         brk #$20
$0e:bf95  80 3b         bra $bfd2
$0e:bf97  fc 01 e0      jsr ($e001,x)
$0e:bf9a  fc ff 87      jsr ($87ff,x)
$0e:bf9d  f3 f7         sbc ($f7,s),y
$0e:bf9f  20 a6 ec      jsr $eca6
$0e:bfa2  ba            tsx
$0e:bfa3  d0 9d         bne $bf42
$0e:bfa5  35 6e         and $6e,x
$0e:bfa7  b7 60         lda [$60],y
$0e:bfa9  f1 c5         sbc ($c5),y
$0e:bfab  26 98         rol $98
$0e:bfad  ed 6d 08      sbc $086d
$0e:bfb0  41 b0         eor ($b0,x)
$0e:bfb2  0b            phd
$0e:bfb3  4c 46 63      jmp $6346
$0e:bfb6  0b            phd
$0e:bfb7  a3 61         lda $61,s
$0e:bfb9  b5 72         lda $72,x
$0e:bfbb  9d 6e 3e      sta $3e6e,x
$0e:bfbe  a7 1b         lda [$1b]
$0e:bfc0  96 4e         stx $4e,y
$0e:bfc2  73 b1         adc ($b1,s),y
$0e:bfc4  df f7 ff f9   cmp $f9fff7,x
$0e:bfc8  ff fc ff fa   sbc $fafffc,x
$0e:bfcc  df fb 87 ff   cmp $ff87fb,x
$0e:bfd0  c9 ff e3      cmp #$e3ff
$0e:bfd3  7f fc 5f f8   adc $f85ffc,x
$0e:bfd7  0c 06 0b      tsb $0b06
$0e:bfda  04 81         tsb $81
$0e:bfdc  42 21         wdm #$21
$0e:bfde  d0 b8         bne $bf98
$0e:bfe0  9c e2 57      stz $57e2
$0e:bfe3  60            rts
$0e:bfe4  9a            txs
$0e:bfe5  4b            phk
$0e:bfe6  b5 b8         lda $b8,x
$0e:bfe8  20 78 40      jsr $4078
$0e:bfeb  e0 10 74      cpx #$7410
$0e:bfee  11 c7         ora ($c7),y
$0e:bff0  e0 15 f8      cpx #$f815
$0e:bff3  05 fc         ora $fc
$0e:bff5  1e f0 28      asl $28f0,x
$0e:bff8  3c 4a 65      bit $654a,x
$0e:bffb  4b            phk
$0e:bffc  e0 6b 33      cpx #$336b
$0e:bfff  00 f8         brk #$f8
$0e:c001  86 c0         stx $c0
$0e:c003  27 f0         and [$f0]
$0e:c005  0b            phd
$0e:c006  b8            clv
$0e:c007  3d e8 1e      and $1ee8,x
$0e:c00a  0c 86 62      tsb $6286
$0e:c00d  a9 06 d5      lda #$d506
$0e:c010  50 c1         bvc $bfd3
$0e:c012  f1 60         sbc ($60),y
$0e:c014  80 7e         bra $c094
$0e:c016  20 1f c0      jsr $c01f
$0e:c019  7c c5 27      jmp ($27c5,x)
$0e:c01c  94 8e         sty $8e,x
$0e:c01e  16 b7         asl $b7,x
$0e:c020  32 0f         and ($0f)
$0e:c022  a9 e4 02      lda #$02e4
$0e:c025  ed 00 17      sbc $1700
$0e:c028  9c e7 2d      stz $2de7
$0e:c02b  7b            tdc
$0e:c02c  95 dc         sta $dc,x
$0e:c02e  2c b1 4d      bit $4db1
$0e:c031  d6 3a         dec $3a,x
$0e:c033  ab            plb
$0e:c034  d3 10         cmp ($10,s),y
$0e:c036  47 ee         eor [$ee]
$0e:c038  01 71         ora ($71,x)
$0e:c03a  80 4a         bra $c086
$0e:c03c  1d c7 56      ora $56c7,x
$0e:c03f  c4 8d         cpy $8d
$0e:c041  42 35         wdm #$35
$0e:c043  60            rts
$0e:c044  92 fd         sta ($fd)
$0e:c046  2b            pld
$0e:c047  1e ed 2d      asl $2ded,x
$0e:c04a  2d ff 5f      and $5fff
$0e:c04d  18            clc
$0e:c04e  07 c1         ora [$c1]
$0e:c050  dc 90 9c      jml [$9c90]
$0e:c053  a5 ee         lda $ee
$0e:c055  75 71         adc $71,x
$0e:c057  ea            nop
$0e:c058  e9 27 18      sbc #$1827
$0e:c05b  ea            nop
$0e:c05c  3f 25 ff 17   and $17ff25,x
$0e:c060  b0 50         bcs $c0b2
$0e:c062  cc 1d c7      cpy $c71d
$0e:c065  d2 94         cmp ($94)
$0e:c067  e3 3f         sbc $3f,s
$0e:c069  73 3f         adc ($3f,s),y
$0e:c06b  cd 16 68      cmp $6816
$0e:c06e  fb            xce
$0e:c06f  f0 60         beq $c0d1
$0e:c071  d2 b6         cmp ($b6)
$0e:c073  fa            plx
$0e:c074  ee 95 57      inc $5795
$0e:c077  f7 54         sbc [$54],y
$0e:c079  dd fb a5      cmp $a5fb,x
$0e:c07c  3b            tsc
$0e:c07d  ab            plb
$0e:c07e  6d 5f 89      adc $895f
$0e:c081  b6 ba         ldx $ba,y
$0e:c083  88            dey
$0e:c084  02 02         cop #$02
$0e:c086  ff 38 82 18   sbc $188238,x
$0e:c08a  67 1f         adc [$1f]
$0e:c08c  f8            sed
$0e:c08d  47 ff         eor [$ff]
$0e:c08f  eb            xba
$0e:c090  22 cd 48 6d   jsl $6d48cd
$0e:c094  b0 3c         bcs $c0d2
$0e:c096  94 96         sty $96,x
$0e:c098  ef 22 c4 54   sbc $54c422
$0e:c09c  fc 77 1c      jsr ($1c77,x)
$0e:c09f  84 84         sty $84
$0e:c0a1  40            rti
$0e:c0a2  ff f9 03 fc   sbc $fc03f9,x
$0e:c0a6  68            pla
$0e:c0a7  1f ff cc fb   ora $fbccff,x
$0e:c0ab  05 63         ora $63
$0e:c0ad  ce 5c 2f      dec $2f5c
$0e:c0b0  1b            tcs
$0e:c0b1  6e b4 c2      ror $c2b4
$0e:c0b4  ab            plb
$0e:c0b5  b1 ac         lda ($ac),y
$0e:c0b7  ec 7b 5b      cpx $5b7b
$0e:c0ba  31 00         and ($00),y
$0e:c0bc  47 3f         eor [$3f]
$0e:c0be  f0 f6         beq $c0b6
$0e:c0c0  11 c3         ora ($c3),y
$0e:c0c2  99 03 0c      sta $0c03,y
$0e:c0c5  ff ea 6e fa   sbc $fa6eea,x
$0e:c0c9  6b            rtl
$0e:c0ca  fd 63 6b      sbc $6b63,x
$0e:c0cd  e5 dd         sbc $dd
$0e:c0cf  f7 b7         sbc [$b7],y
$0e:c0d1  38            sec
$0e:c0d2  bf 65 ab 5b   lda $5bab65,x
$0e:c0d6  b1 b3         lda ($b3),y
$0e:c0d8  08            php
$0e:c0d9  0a            asl a
$0e:c0da  04 82         tsb $82
$0e:c0dc  78            sei
$0e:c0dd  c7 fe         cmp [$fe]
$0e:c0df  b1 30         lda ($30),y
$0e:c0e1  99 42 a8      sta $a842,y
$0e:c0e4  b8            clv
$0e:c0e5  4c a4 4b      jmp $4ba4
$0e:c0e8  25 a2         and $a2
$0e:c0ea  b5 c2         lda $c2,x
$0e:c0ec  22 b1 3d 18   jsl $183db1
$0e:c0f0  80 3f         bra $c131
$0e:c0f2  ff df ff ef   sbc $efffdf,x
$0e:c0f6  ff ef ff df   sbc $dfffef,x
$0e:c0fa  7f ff 70 20   adc $2070ff,x
$0e:c0fe  bf c3 1b 81   lda $811bc3,x
$0e:c102  da            phx
$0e:c103  4a            lsr a
$0e:c104  2c 7c 2c      bit $2c7c
$0e:c107  45 a2         eor $a2
$0e:c109  ad 00 aa      lda $aa00
$0e:c10c  d3 b5         cmp ($b5,s),y
$0e:c10e  b0 1a         bcs $c12a
$0e:c110  14 06         trb $06
$0e:c112  fd ff ef      sbc $efff,x
$0e:c115  80 04         bra $c11b
$0e:c117  12 0f         ora ($0f)
$0e:c119  f0 df         beq $c0fa
$0e:c11b  ff ff c0 c1   sbc $c1c0ff,x
$0e:c11f  82 49 36      brl $f76b
$0e:c122  50 09         bvc $c12d
$0e:c124  4c 82 b3      jmp $b382
$0e:c127  02 d2         cop #$d2
$0e:c129  71 23         adc ($23),y
$0e:c12b  90 8e         bcc $c0bb
$0e:c12d  5d 16 a5      eor $a516,x
$0e:c130  10 34         bpl $c166
$0e:c132  81 84         sta ($84,x)
$0e:c134  3b            tsc
$0e:c135  e6 21         inc $21
$0e:c137  bd c0 3e      lda $3ec0,x
$0e:c13a  f0 0d         beq $c149
$0e:c13c  f4 03 df      pea $df03
$0e:c13f  00 c9         brk #$c9
$0e:c141  64 f5         stz $f5
$0e:c143  72 3a         adc ($3a)
$0e:c145  a7 5b         lda [$5b]
$0e:c147  5f 4f a8 c0   eor $c0a84f,x
$0e:c14b  6b            rtl
$0e:c14c  54 6d 54      mvn $54,$6d
$0e:c14f  0e 8b 00      asl $008b
$0e:c152  b6 7f         ldx $7f,y
$0e:c154  fb            xce
$0e:c155  9f ff 4f ff   sta $ff4fff,x
$0e:c159  e0 2a 1d      cpx #$1d2a
$0e:c15c  ef ff f8 0c   sbc $0cf8ff
$0e:c160  18            clc
$0e:c161  04 06         tsb $06
$0e:c163  05 06         ora $06
$0e:c165  84 c2         sty $c2
$0e:c167  e0 50 f8      cpx #$f850
$0e:c16a  a4 7a         ldy $7a
$0e:c16c  43 23         eor $23,s
$0e:c16e  a6 59         ldx $59
$0e:c170  2a            rol a
$0e:c171  5d 38 01      eor $0138,x
$0e:c174  bc 20 30      ldy $3020,x
$0e:c177  48            pha
$0e:c178  09 fc a3      ora #$a3fc
$0e:c17b  90 18         bcc $c195
$0e:c17d  dc 06 59      jml [$5906]
$0e:c180  00 d4         brk #$d4
$0e:c182  d5 73         cmp $73,x
$0e:c184  5c 3a ae 2b   jml $2bae3a
$0e:c188  bb            tyx
$0e:c189  00 c3         brk #$c3
$0e:c18b  46 32         lsr $32
$0e:c18d  b3 a8         lda ($a8,s),y
$0e:c18f  9c 7b 5d      stz $5d7b
$0e:c192  77 71         adc [$71],y
$0e:c194  a2 85 24      ldx #$2485
$0e:c197  0e 61 a9      asl $a961
$0e:c19a  7b            tdc
$0e:c19b  6e 94 bd      ror $bd94
$0e:c19e  5f 7e 51 df   eor $df517e,x
$0e:c1a2  bb            tyx
$0e:c1a3  65 ab         adc $ab
$0e:c1a5  3a            dec a
$0e:c1a6  ff 04 aa e9   sbc $e9aa04,x
$0e:c1aa  b9 20 06      lda $0620,y
$0e:c1ad  03 fc         ora $fc,s
$0e:c1af  40            rti
$0e:c1b0  1f e4 27 fb   ora $fb27e4,x
$0e:c1b4  10 fc         bpl $c1b2
$0e:c1b6  c5 7f         cmp $7f
$0e:c1b8  30 6f         bmi $c229
$0e:c1ba  84 97         sty $97
$0e:c1bc  eb            xba
$0e:c1bd  d2 b9         cmp ($b9)
$0e:c1bf  4f 7c f6 2e   eor $2ef67c
$0e:c1c3  9c 7a cd      stz $cd7a
$0e:c1c6  e1 89         sbc ($89,x)
$0e:c1c8  cc 31 9a      cpy $9a31
$0e:c1cb  aa            tax
$0e:c1cc  04 2b         tsb $2b
$0e:c1ce  e1 0d         sbc ($0d,x)
$0e:c1d0  f0 c6         beq $c198
$0e:c1d2  38            sec
$0e:c1d3  33 cc         and ($cc,s),y
$0e:c1d5  07 e6         ora [$e6]
$0e:c1d7  03 fc         ora $fc,s
$0e:c1d9  80 ff         bra $c1da
$0e:c1db  dd 41 00      cmp $0041,x
$0e:c1de  bb            tyx
$0e:c1df  6e 71 56      ror $5671
$0e:c1e2  dd fd b3      cmp $b3fd,x
$0e:c1e5  2b            pld
$0e:c1e6  46 af         lsr $af
$0e:c1e8  f1 aa         sbc ($aa),y
$0e:c1ea  5c bd b7 ae   jml $aeb7bd
$0e:c1ee  4b            phk
$0e:c1ef  e9 80 61      sbc #$6180
$0e:c1f2  22 1c e8 87   jsl $87e81c
$0e:c1f6  fa            plx
$0e:c1f7  71 ff         adc ($ff),y
$0e:c1f9  02 84         cop #$84
$0e:c1fb  f3 ff         sbc ($ff,s),y
$0e:c1fd  1c ff c7      trb $c7ff
$0e:c200  bf f5 98 b7   lda $b798f5,x
$0e:c204  37 2d         and [$2d],y
$0e:c206  3e d3 d6      rol $d6d3,x
$0e:c209  7c be ba      jmp ($babe,x)
$0e:c20c  be b2 a5      ldx $a5b2,y
$0e:c20f  f5 8d         sbc $8d,x
$0e:c211  d5 b7         cmp $b7,x
$0e:c213  3e 08 25      rol $2508,x
$0e:c216  82 1d 40      brl $0236
$0e:c219  87 9d         sta [$9d]
$0e:c21b  42 01         wdm #$01
$0e:c21d  1f 80 ef e0   ora $e0ef80,x
$0e:c221  02 a0         cop #$a0
$0e:c223  ff da 76 db   sbc $db76da,x
$0e:c227  aa            tax
$0e:c228  5e 72 e1      lsr $e172,x
$0e:c22b  78            sei
$0e:c22c  db            stp
$0e:c22d  75 a6         adc $a6,x
$0e:c22f  15 5d         ora $5d,x
$0e:c231  8d 67 63      sta $6367
$0e:c234  da            phx
$0e:c235  d9 a5 82      cmp $82a5,y
$0e:c238  09 cf 87      ora #$87cf
$0e:c23b  ff c8 65 0e   sbc $0e65c8,x
$0e:c23f  24 0c         bit $0c
$0e:c241  33 ff         and ($ff,s),y
$0e:c243  ab            plb
$0e:c244  ba            tsx
$0e:c245  d5 b5         cmp $b5,x
$0e:c247  f2 8e         sbc ($8e)
$0e:c249  af 97 77 de   lda $de7797
$0e:c24d  dc e2 fd      jml [$fde2]
$0e:c250  96 ad         stx $ad,y
$0e:c252  6e c6 cd      ror $cdc6
$0e:c255  00 82         brk #$82
$0e:c257  40            rti
$0e:c258  21 d0         and ($d0,x)
$0e:c25a  2e fa 9c      rol $9cfa
$0e:c25d  a2 06 81      ldx #$8106
$0e:c260  8c 7f f9      sty $f97f
$0e:c263  13 bb         ora ($bb,s),y
$0e:c265  be 3a d3      ldx $d33a,y
$0e:c268  9e d9 f5      stz $f5d9,x
$0e:c26b  2d d9 59      and $59d9
$0e:c26e  47 6f         eor [$6f]
$0e:c270  af 6e fe d9   lda $d9fe6e
$0e:c274  a0 86 61      ldy #$6186
$0e:c277  5f 84 21 08   eor $082184,x
$0e:c27b  27 f4         and [$f4]
$0e:c27d  a4 78         ldy $78
$0e:c27f  64 7c         stz $7c
$0e:c281  8e ee 2a      stx $2aee
$0e:c284  a5 99         lda $99
$0e:c286  d4 c4         pei ($c4)
$0e:c288  25 91         and $91
$0e:c28a  08            php
$0e:c28b  94 92         sty $92,x
$0e:c28d  4f 12 40 92   eor $924012
$0e:c291  7e aa fb      ror $fbaa,x
$0e:c294  6d 6d 7b      adc $7b6d
$0e:c297  d5 1d         cmp $1d,x
$0e:c299  f3 46         sbc ($46,s),y
$0e:c29b  6e b8 b9      ror $b9b8
$0e:c29e  57 5b         eor [$5b],y
$0e:c2a0  93 37         sta ($37,s),y
$0e:c2a2  ea            nop
$0e:c2a3  4e d0 a0      lsr $a0d0
$0e:c2a6  65 23         adc $23
$0e:c2a8  29 3b 04      and #$043b
$0e:c2ab  cc 34 de      cpy $de34
$0e:c2ae  b5 bb         lda $bb,x
$0e:c2b0  ab            plb
$0e:c2b1  a7 cb         lda [$cb]
$0e:c2b3  76 74         ror $74,x
$0e:c2b5  55 79         eor $79,x
$0e:c2b7  26 eb         rol $eb
$0e:c2b9  1b            tcs
$0e:c2ba  af c4 6d 73   lda $736dc4
$0e:c2be  40            rti
$0e:c2bf  52 bc         eor ($bc)
$0e:c2c1  7f ef 9f ff   adc $ff9fef,x
$0e:c2c5  c7 fe         cmp [$fe]
$0e:c2c7  e0 e8 1b      cpx #$1be8
$0e:c2ca  07 fe         ora [$fe]
$0e:c2cc  f5 e1         sbc $e1,x
$0e:c2ce  c0 54 74      cpy #$7454
$0e:c2d1  37 0a         and [$0a],y
$0e:c2d3  4f 42 6b c8   eor $c86b42
$0e:c2d7  a2 74 2e      ldx #$2e74
$0e:c2da  5e 0c d6      lsr $d60c,x
$0e:c2dd  80 5a         bra $c339
$0e:c2df  12 05         ora ($05)
$0e:c2e1  60            rts
$0e:c2e2  80 40         bra $c324
$0e:c2e4  0a            asl a
$0e:c2e5  42 d0         wdm #$d0
$0e:c2e7  a0 7f e5      ldy #$e57f
$0e:c2ea  52 1f         eor ($1f)
$0e:c2ec  2c a2 2d      bit $2da2
$0e:c2ef  69 a7 ca      adc #$caa7
$0e:c2f2  63 b3         adc $b3,s
$0e:c2f4  ba            tsx
$0e:c2f5  34 ce         bit $ce,x
$0e:c2f7  63 16         adc $16,s
$0e:c2f9  87 45         sta [$45]
$0e:c2fb  0d 24 69      ora $6924
$0e:c2fe  24 1a         bit $1a
$0e:c300  21 42         and ($42,x)
$0e:c302  4b            phk
$0e:c303  15 c4         ora $c4,x
$0e:c305  4e 25 d7      lsr $d725
$0e:c308  69 7d d7      adc #$d77d
$0e:c30b  ad ca 92      lda $92ca
$0e:c30e  74 a8         stz $a8,x
$0e:c310  3d 3d 56      and $563d,x
$0e:c313  c3 d5         cmp $d5,s
$0e:c315  10 e3         bpl $c2fa
$0e:c317  cc 30 37      cpy $3730
$0e:c31a  8c 05 ea      sty $ea05
$0e:c31d  43 7c         eor $7c,s
$0e:c31f  90 ff         bcc $c320
$0e:c321  a4 1f         ldy $1f
$0e:c323  e0 68 5c      cpx #$5c68
$0e:c326  f0 9e         beq $c2c6
$0e:c328  c8            iny
$0e:c329  ce 5f 91      dec $915f
$0e:c32c  aa            tax
$0e:c32d  aa            tax
$0e:c32e  4d a0 9a      eor $9aa0
$0e:c331  8d 55 66      sta $6655
$0e:c334  f9 a4 da      sbc $daa4,y
$0e:c337  28            plp
$0e:c338  1b            tcs
$0e:c339  f7 00         sbc [$00],y
$0e:c33b  ab            plb
$0e:c33c  c0 30 70      cpy #$7030
$0e:c33f  0a            asl a
$0e:c340  5d ba 53      eor $53ba,x
$0e:c343  a1 aa         lda ($aa,x)
$0e:c345  5c 2a 71 2d   jml $2d712a
$0e:c349  25 b2         and $b2
$0e:c34b  a5 26         lda $26
$0e:c34d  f6 c5         inc $c5,x
$0e:c34f  26 79         rol $79
$0e:c351  bd 65 06      lda $0665,x
$0e:c354  bd 7f c7      lda $c77f,x
$0e:c357  c7 fd         cmp [$fd]
$0e:c359  b0 fe         bcs $c359
$0e:c35b  9c 1f f3      stz $f31f
$0e:c35e  03 fd         ora $fd,s
$0e:c360  c0 ff 90      cpy #$90ff
$0e:c363  1f f4 02 ab   ora $ab02f4,x
$0e:c367  ee aa c4      inc $c4aa
$0e:c36a  76 52         ror $52,x
$0e:c36c  8d 35 66      sta $6635
$0e:c36f  b7 60         lda [$60],y
$0e:c371  f1 c5         sbc ($c5),y
$0e:c373  26 98         rol $98
$0e:c375  ed 6d 0a      sbc $0a6d
$0e:c378  01 00         ora ($00,x)
$0e:c37a  f7 40         sbc [$40],y
$0e:c37c  3b            tsc
$0e:c37d  ec 16 62      cpx $6216
$0e:c380  8f ea 45 48   sta $4845ea
$0e:c384  de f4 e1      dec $e1f4,x
$0e:c387  fa            plx
$0e:c388  ca            dex
$0e:c389  d5 66         cmp $66,x
$0e:c38b  cb            wai
$0e:c38c  e7 8e         sbc [$8e]
$0e:c38e  cc 13 81      cpy $8113
$0e:c391  40            rti
$0e:c392  fe c0 11      inc $11c0,x
$0e:c395  a0 8d 00      ldy #$008d
$0e:c398  50 30         bvc $c3ca
$0e:c39a  50 14         bvc $c3b0
$0e:c39c  17 29         ora [$29],y
$0e:c39e  4f 27 6d 98   eor $986d27
$0e:c3a2  d7 c9         cmp [$c9],y
$0e:c3a4  73 76         adc ($76,s),y
$0e:c3a6  4e 7e ae      lsr $ae7e
$0e:c3a9  c1 8d         cmp ($8d,x)
$0e:c3ab  fc d4 77      jsr ($77d4,x)
$0e:c3ae  c0 a0 bf      cpy #$bfa0
$0e:c3b1  b8            clv
$0e:c3b2  0e 7f 80      asl $807f
$0e:c3b5  8f e0 20 dc   sta $dc20e0
$0e:c3b9  08            php
$0e:c3ba  07 cf         ora [$cf]
$0e:c3bc  7b            tdc
$0e:c3bd  6a            ror a
$0e:c3be  d5 5b         cmp $5b,x
$0e:c3c0  6a            ror a
$0e:c3c1  bb            tyx
$0e:c3c2  bb            tyx
$0e:c3c3  36 66         rol $66,x
$0e:c3c5  d3 97         cmp ($97,s),y
$0e:c3c7  b5 66         lda $66,x
$0e:c3c9  e1 a4         sbc ($a4,x)
$0e:c3cb  e0 fd 88      cpx #$88fd
$0e:c3ce  d1 48         cmp ($48),y
$0e:c3d0  3f 98 27 82   and $822798,x
$0e:c3d4  01 80         ora ($80,x)
$0e:c3d6  82 40 33      brl $f719
$0e:c3d9  5f 5b 2d bb   eor $bb2d5b,x
$0e:c3dd  23 17         and $17,s
$0e:c3df  ed 42 e4      sbc $e442
$0e:c3e2  b8            clv
$0e:c3e3  7e bc 0f      ror $0fbc,x
$0e:c3e6  53 31         eor ($31,s),y
$0e:c3e8  b5 d0         lda $d0,x
$0e:c3ea  d3 e1         cmp ($e1,s),y
$0e:c3ec  90 80         bcc $c36e
$0e:c3ee  7a            ply
$0e:c3ef  20 1f 48      jsr $481f
$0e:c3f2  07 e2         ora [$e2]
$0e:c3f4  01 fc         ora ($fc,x)
$0e:c3f6  80 77         bra $c46f
$0e:c3f8  a0 1b cc      ldy #$cc1b
$0e:c3fb  03 bd         ora $bd,s
$0e:c3fd  12 a1         ora ($a1)
$0e:c3ff  81 ff         sta ($ff,x)
$0e:c401  da            phx
$0e:c402  bf 72 db ff   lda $ffdb72,x
$0e:c406  4d fd 13      eor $13fd
$0e:c409  10 68         bpl $c473
$0e:c40b  60            rts
$0e:c40c  20 00 d0      jsr $d000
$0e:c40f  a3 6c         lda $6c,s
$0e:c411  fd 35 d9      sbc $d935,x
$0e:c414  77 6f         adc [$6f],y
$0e:c416  41 5b         eor ($5b,x)
$0e:c418  8a            txa
$0e:c419  7b            tdc
$0e:c41a  ec 1f f9      cpx $f91f
$0e:c41d  55 ff         eor $ff,x
$0e:c41f  a9 f7 86      lda #$86f7
$0e:c422  7f e0 df f8   adc $f8dfe0,x
$0e:c426  21 88         and ($88,x)
$0e:c428  60            rts
$0e:c429  19 f8 04      ora $04f8,y
$0e:c42c  1f 01 03 84   ora $840301,x
$0e:c430  40            rti
$0e:c431  61 5d         adc ($5d,x)
$0e:c433  7b            tdc
$0e:c434  2e ef 25      rol $25ef
$0e:c437  6e b6 6d      ror $6db6
$0e:c43a  f1 15         sbc ($15),y
$0e:c43c  5b            tcd
$0e:c43d  bf 6e 39 92   lda $92396e,x
$0e:c441  b7 ec         lda [$ec],y
$0e:c443  64 0a         stz $0a
$0e:c445  55 91         eor $91,x
$0e:c447  7f cf e1 61   adc $61e1cf,x
$0e:c44b  ff d0 3f fb   sbc $fb3fd0,x
$0e:c44f  58            cli
$0e:c450  5d 53 07      eor $0753,x
$0e:c453  6a            ror a
$0e:c454  c8            iny
$0e:c455  ca            dex
$0e:c456  ea            nop
$0e:c457  19 19 c5      ora $c519,y
$0e:c45a  17 51         ora [$51],y
$0e:c45c  28            plp
$0e:c45d  f6 52         inc $52,x
$0e:c45f  67 88         adc [$88]
$0e:c461  14 40         trb $40
$0e:c463  93 fd         sta ($fd,s),y
$0e:c465  2e db 97      rol $97db
$0e:c468  88            dey
$0e:c469  6f ed 99 5a   adc $5a99ed
$0e:c46d  35 7f         and $7f,x
$0e:c46f  8d 52 e5      sta $e552
$0e:c472  ed bd 72      sbc $72bd
$0e:c475  5f 4a 9d 27   eor $279d4a,x
$0e:c479  0c 41 9e      tsb $9e41
$0e:c47c  7f e3 9f f8   adc $f89fe3,x
$0e:c480  f7 ff         sbc [$ff],y
$0e:c482  b3 96         lda ($96,s),y
$0e:c484  e6 e5         inc $e5
$0e:c486  a5 db         lda $db
$0e:c488  7a            ply
$0e:c489  cf 96 97 f7   cmp $f79796
$0e:c48d  d6 54         dec $54,x
$0e:c48f  b6 b5         ldx $b5,y
$0e:c491  ba            tsx
$0e:c492  b6 e4         ldx $e4,y
$0e:c494  b2 05         lda ($05)
$0e:c496  90 46         bcc $c4de
$0e:c498  84 08         sty $08
$0e:c49a  88            dey
$0e:c49b  30 10         bmi $c4ad
$0e:c49d  11 f2         ora ($f2),y
$0e:c49f  76 15         ror $15,x
$0e:c4a1  0d 44 23      ora $2344
$0e:c4a4  61 92         adc ($92,x)
$0e:c4a6  d0 54         bne $c4fc
$0e:c4a8  2c 5e aa      bit $aa5e
$0e:c4ab  04 8e         tsb $8e
$0e:c4ad  81 08         sta ($08,x)
$0e:c4af  b0 a3         bcs $c454
$0e:c4b1  41 fe         eor ($fe,x)
$0e:c4b3  98            tya
$0e:c4b4  00 32         brk #$32
$0e:c4b6  c3 a7         cmp $a7,s
$0e:c4b8  90 58         bcc $c512
$0e:c4ba  a4 a6         ldy $a6
$0e:c4bc  15 06         ora $06,x
$0e:c4be  8f c4 e1 50   sta $50e1c4
$0e:c4c2  48            pha
$0e:c4c3  6c 4e 1d      jmp ($1d4e)
$0e:c4c6  08            php
$0e:c4c7  82 91 42      brl $075b
$0e:c4ca  10 64         bpl $c530
$0e:c4cc  23 10         and $10,s
$0e:c4ce  b9 49 ca      lda $ca49,y
$0e:c4d1  1f 59 2d 0b   ora $0b2d59,x
$0e:c4d5  65 dd         adc $dd
$0e:c4d7  83 ea         sta $ea,s
$0e:c4d9  aa            tax
$0e:c4da  75 6b         adc $6b,x
$0e:c4dc  37 a6         and [$a6],y
$0e:c4de  37 38         and [$38],y
$0e:c4e0  c2 68         rep #$68
$0e:c4e2  a8            tay
$0e:c4e3  1f a8 07 f6   ora $f607a8,x
$0e:c4e7  03 f8         ora $f8,s
$0e:c4e9  80 ff         bra $c4ea
$0e:c4eb  20 1f 98      jsr $981f
$0e:c4ee  0f d1 d2 0e   ora $0ed2d1
$0e:c4f2  91 ac         sta ($ac),y
$0e:c4f4  f5 e4         sbc $e4,x
$0e:c4f6  7f ee 55 e6   adc $e655ee,x
$0e:c4fa  93 84         sta ($84,s),y
$0e:c4fc  bc f8 b0      ldy $b0f8,x
$0e:c4ff  f4 8e 55      pea $558e
$0e:c502  72 7b         adc ($7b)
$0e:c504  82 90 7f      brl $4497
$0e:c507  a0 37 88      ldy #$8837
$0e:c50a  3c 02 ff      bit $ff02,x
$0e:c50d  00 8f         brk #$8f
$0e:c50f  c0 27 e6      cpy #$e627
$0e:c512  81 32         sta ($32,x)
$0e:c514  84 de         sty $de
$0e:c516  1b            tcs
$0e:c517  8d 92 64      sta $6492
$0e:c51a  a1 14         lda ($14,x)
$0e:c51c  ec de 4e      cpx $4ede
$0e:c51f  71 ab         adc ($ab),y
$0e:c521  b0 4d         bcs $c570
$0e:c523  25 da         and $da
$0e:c525  dc 14 03      jml [$0314]
$0e:c528  fd 03 fc      sbc $fc03,x
$0e:c52b  41 fe         eor ($fe,x)
$0e:c52d  08            php
$0e:c52e  31 e0         and ($e0),y
$0e:c530  47 f0         eor [$f0]
$0e:c532  15 fc         ora $fc,x
$0e:c534  01 94         ora ($94,x)
$0e:c536  35 f4         and $f4,x
$0e:c538  5a            phy
$0e:c539  ee 13 65      inc $6513
$0e:c53c  c8            iny
$0e:c53d  a7 6a         lda [$6a]
$0e:c53f  fa            plx
$0e:c540  77 89         adc [$89],y
$0e:c542  5f 83 69 ae   eor $ae6983,x
$0e:c546  3e fa 38      rol $38fa,x
$0e:c549  30 11         bmi $c55c
$0e:c54b  9e 17 da      stz $da17,x
$0e:c54e  93 4e         sta ($4e,s),y
$0e:c550  c2 de         rep #$de
$0e:c552  fc 05 94      jsr ($9405,x)
$0e:c555  32 81         and ($81)
$0e:c557  a5 0c         lda $0c
$0e:c559  ed fa 90      sbc $90fa
$0e:c55c  d2 76         cmp ($76)
$0e:c55e  d5 6c         cmp $6c,x
$0e:c560  4c 9b b7      jmp $b79b
$0e:c563  90 bf         bcc $c524
$0e:c565  ea            nop
$0e:c566  e0 12 db      cpx #$db12
$0e:c569  4f 27 7e 24   eor $247e27
$0e:c56d  17 03         ora [$03],y
$0e:c56f  e5 b0         sbc $b0
$0e:c571  10 0e         bpl $c581
$0e:c573  4d 37 9b      eor $9b37
$0e:c576  92 c9         sta ($c9)
$0e:c578  60            rts
$0e:c579  b0 12         bcs $c58d
$0e:c57b  bc 24 d3      ldy $d324,x
$0e:c57e  17 8b         ora [$8b],y
$0e:c580  a0 63 7f      ldy #$7f63
$0e:c583  35 1d         and $1d,x
$0e:c585  f4 ca 01      pea $01ca
$0e:c588  6d 32 08      adc $0832
$0e:c58b  0c 70 13      tsb $1370
$0e:c58e  fc 04 1b      jsr ($1b04,x)
$0e:c591  81 00         sta ($00,x)
$0e:c593  f9 d5 f6      sbc $f6d5,y
$0e:c596  db            stp
$0e:c597  ca            dex
$0e:c598  ff ba 2b e0   sbc $e02bba,x
$0e:c59c  8a            txa
$0e:c59d  da            phx
$0e:c59e  31 90         and ($90),y
$0e:c5a0  0c 47 02      tsb $0247
$0e:c5a3  10 0c         bpl $c5b1
$0e:c5a5  08            php
$0e:c5a6  43 7c         eor $7c,s
$0e:c5a8  43 e0         eor $e0,s
$0e:c5aa  1f 27 02 53   ora $530227,x
$0e:c5ae  69 b1 28      adc #$28b1
$0e:c5b1  92 78         sta ($78)
$0e:c5b3  2d 70 4c      and $4c70
$0e:c5b6  a5 af         lda $af
$0e:c5b8  57 10         eor [$10],y
$0e:c5ba  ac f0 68      ldy $68f0
$0e:c5bd  3f 6d 94 03   and $03946d,x
$0e:c5c1  da            phx
$0e:c5c2  e0 79 f0      cpx #$f079
$0e:c5c5  78            sei
$0e:c5c6  38            sec
$0e:c5c7  74 ca         stz $ca,x
$0e:c5c9  6c 4e 27      jmp ($274e)
$0e:c5cc  84 88         sty $88
$0e:c5ce  db            stp
$0e:c5cf  20 39 3b      jsr $3b39
$0e:c5d2  5e b6 0f      lsr $0fb6,x
$0e:c5d5  2b            pld
$0e:c5d6  b7 e2         lda [$e2],y
$0e:c5d8  3e 23 f0      rol $f023,x
$0e:c5db  f6 27         inc $27,x
$0e:c5dd  c0 c4 3f      cpy #$3fc4
$0e:c5e0  c8            iny
$0e:c5e1  0f e2 03 90   ora $9003e2
$0e:c5e5  c1 c3         cmp ($c3,x)
$0e:c5e7  b9 fb 7d      lda $7dfb,y
$0e:c5ea  4f 73 d7 22   eor $22d773
$0e:c5ee  ab            plb
$0e:c5ef  eb            xba
$0e:c5f0  79 75 6d      adc $6d75,y
$0e:c5f3  cf 4e 79 ed   cmp $ed794e
$0e:c5f7  9b            txy
$0e:c5f8  76 26         ror $26,x
$0e:c5fa  b4 01         ldy $01,x
$0e:c5fc  60            rts
$0e:c5fd  e2 3f         sep #$3f
$0e:c5ff  f1 06         sbc ($06),y
$0e:c601  fa            plx
$0e:c602  c0 bf         cpy #$bf
$0e:c604  f3 78         sbc ($78,s),y
$0e:c606  66 22         ror $22
$0e:c608  4d 96 84      eor $8496
$0e:c60b  53 33         eor ($33,s),y
$0e:c60d  19 18 27      ora $2718,y
$0e:c610  5e 19 28      lsr $2819,x
$0e:c613  a3 54         lda $54,s
$0e:c615  ac 8e 06      ldy $068e
$0e:c618  84 37         sty $37
$0e:c61a  d7 43         cmp [$43],y
$0e:c61c  6d ed 5d      adc $5ded
$0e:c61f  26 7b         rol $7b
$0e:c621  5a            phy
$0e:c622  3e 46 cb      rol $cb46,x
$0e:c625  71 c6         adc ($c6),y
$0e:c627  fe 6c 59      inc $596c,x
$0e:c62a  bc 2d fa      ldy $fa2d,x
$0e:c62d  3d ff 87      and $87ff,x
$0e:c630  ff e9 df fb   sbc $fbdfe9,x
$0e:c634  77 ff         adc [$ff],y
$0e:c636  1d ff 83      ora $83ff,x
$0e:c639  7f e0 82 c1   adc $c182e0,x
$0e:c63d  b5 eb         lda $eb,x
$0e:c63f  26 be         rol $be
$0e:c641  68            pla
$0e:c642  97 0e         sta [$0e],y
$0e:c644  bd cf b4      lda $b4cf,x
$0e:c647  f3 fc         sbc ($fc,s),y
$0e:c649  b4 ae         ldy $ae,x
$0e:c64b  9d 73 0d      sta $0d73,x
$0e:c64e  59 42 84      eor $8442,y
$0e:c651  63 ff         adc $ff,s
$0e:c653  3c ff cc      bit $ccff,x
$0e:c656  1c 87 20      trb $2087
$0e:c659  75 0e         adc $0e,x
$0e:c65b  a7 81         lda [$81]
$0e:c65d  22 e8 74 a8   jsl $a874e8
$0e:c661  10 8f         bpl $c5f2
$0e:c663  05 33         ora $33
$0e:c665  41 46         eor ($46,x)
$0e:c667  c8            iny
$0e:c668  76 30         ror $30,x
$0e:c66a  53 e0         eor ($e0,s),y
$0e:c66c  e8            inx
$0e:c66d  09 9d         ora #$9d
$0e:c66f  52 90         eor ($90)
$0e:c671  b8            clv
$0e:c672  34 12         bit $12,x
$0e:c674  07 10         ora [$10]
$0e:c676  81 c3         sta ($c3,x)
$0e:c678  60            rts
$0e:c679  70 e8         bvs $c663
$0e:c67b  0c 42 03      tsb $0342
$0e:c67e  08            php
$0e:c67f  80 c0         bra $c641
$0e:c681  a0 2f         ldy #$2f
$0e:c683  fe bb 6e      inc $6ebb,x
$0e:c686  75 56         adc $56,x
$0e:c688  dd fd b3      cmp $b3fd,x
$0e:c68b  0b            phd
$0e:c68c  56 af         lsr $af,x
$0e:c68e  f1 ac         sbc ($ac),y
$0e:c690  5e bf 56      lsr $56bf,x
$0e:c693  8e 2d f3      stx $f32d
$0e:c696  54 82 14      mvn $14,$82
$0e:c699  10 a1         bpl $c63c
$0e:c69b  38            sec
$0e:c69c  22 0c 70 90   jsl $90700c
$0e:c6a0  30 cf         bmi $c671
$0e:c6a2  ff 6f 2d ce   sbc $ce2d6f,x
$0e:c6a6  cb            wai
$0e:c6a7  cb            wai
$0e:c6a8  76 b3         ror $b3,x
$0e:c6aa  8d 25 0f      sta $0f25
$0e:c6ad  ed e0 a1      sbc $a1e0
$0e:c6b0  68            pla
$0e:c6b1  68            pla
$0e:c6b2  74 08         stz $08,x
$0e:c6b4  0d 83 fe      ora $fe83
$0e:c6b7  5f 0a 17 fe   eor $fe170a,x
$0e:c6bb  87 ff         sta [$ff]
$0e:c6bd  80 fd         bra $c6bc
$0e:c6bf  e0 3e         cpx #$3e
$0e:c6c1  38            sec
$0e:c6c2  01 a8         ora ($a8,x)
$0e:c6c4  28            plp
$0e:c6c5  3f 99 f6 0a   and $0af699,x
$0e:c6c9  c7 bc         cmp [$bc]
$0e:c6cb  b8            clv
$0e:c6cc  5e 36 d5      lsr $d536,x
$0e:c6cf  2d a5 57      and $57a5
$0e:c6d2  63 3a         adc $3a,s
$0e:c6d4  c9 c5         cmp #$c5
$0e:c6d6  a6 6a         ldx $6a
$0e:c6d8  90 24         bcc $c6fe
$0e:c6da  83 04         sta $04,s
$0e:c6dc  10 65         bpl $c743
$0e:c6de  0e 26 06      asl $0626
$0e:c6e1  fe 19 3f      inc $3f19,x
$0e:c6e4  d4 dd         pei ($dd)
$0e:c6e6  f4 d7 fa      pea $fad7
$0e:c6e9  c6 d7         dec $d7
$0e:c6eb  cf b3 ab 68   cmp $68abb3
$0e:c6ef  a0 9a         ldy #$9a
$0e:c6f1  29 00         and #$00
$0e:c6f3  74 20         stz $20,x
$0e:c6f5  62 92 81      per $488a
$0e:c6f8  03 00         ora $00,s
$0e:c6fa  d0 06         bne $c702
$0e:c6fc  80 d3         bra $c6d1
$0e:c6fe  c0 64         cpy #$64
$0e:c700  70 08         bvs $c70a
$0e:c702  1d 2e 41      ora $412e,x
$0e:c705  ad d1 55      lda $55d1
$0e:c708  b9 38 ca      lda $ca38,y
$0e:c70b  87 ce         sta [$ce]
$0e:c70d  45 41         eor $41
$0e:c70f  d2 4d         cmp ($4d)
$0e:c711  fb            xce
$0e:c712  56 c8         lsr $c8,x
$0e:c714  90 30         bcc $c746
$0e:c716  2b            pld
$0e:c717  f0 09         beq $c722
$0e:c719  fb            xce
$0e:c71a  08            php
$0e:c71b  63 b8         adc $b8,s
$0e:c71d  08            php
$0e:c71e  de 02 03      dec $0302,x
$0e:c721  c0 65         cpy #$65
$0e:c723  87 ee         sta [$ee]
$0e:c725  41 4d         eor ($4d,x)
$0e:c727  d9 75 a1      cmp $a175,y
$0e:c72a  3a            dec a
$0e:c72b  6a            ror a
$0e:c72c  df 6e c1 43   cmp $43c16e,x
$0e:c730  ca            dex
$0e:c731  76 29         ror $29,x
$0e:c733  93 bb         sta ($bb,s),y
$0e:c735  10 a1         bpl $c6d8
$0e:c737  45 27         eor $27
$0e:c739  bf 80 67 60   lda $606780,x
$0e:c73d  0c f4 d2      tsb $d2f4
$0e:c740  d6 eb         dec $eb,x
$0e:c742  56 5e         lsr $5e,x
$0e:c744  2c e2 57      bit $57e2
$0e:c747  9c db 53      stz $53db
$0e:c74a  1b            tcs
$0e:c74b  f4 28 28      pea $2828
$0e:c74e  57 f2         eor [$f2],y
$0e:c750  d5 95         cmp $95,x
$0e:c752  ca            dex
$0e:c753  d3 25         cmp ($25,s),y
$0e:c755  dc 3b 2f      jml [$2f3b]
$0e:c758  0a            asl a
$0e:c759  0f e8 ad 7c   ora $7cade8
$0e:c75d  fd 35 e5      sbc $e535,x
$0e:c760  00 7f         brk #$7f
$0e:c762  84 03         sty $03
$0e:c764  fc 80 89      jsr ($8980,x)
$0e:c767  43 e9         eor $e9,s
$0e:c769  01 f2         ora ($f2,x)
$0e:c76b  40            rti
$0e:c76c  fc 10 bf      jsr ($bf10,x)
$0e:c76f  d4 82         pei ($82)
$0e:c771  a5 a3         lda $a3
$0e:c773  e5 c3         sbc $c3
$0e:c775  f0 d1         beq $c748
$0e:c777  c9 4c         cmp #$4c
$0e:c779  e3 97         sbc $97,s
$0e:c77b  78            sei
$0e:c77c  ad 5d 70      lda $705d
$0e:c77f  be 45 00      ldx $0045,y
$0e:c782  7f 20 1f 08   adc $081f20,x
$0e:c786  1f 8e 1f c7   ora $c71f8e,x
$0e:c78a  8f e1 e3 f8   sta $f8e3e1
$0e:c78e  f9 fc 6e      sbc $6efc,y
$0e:c791  7f 5a 90 73   adc $73905a,x
$0e:c795  7a            ply
$0e:c796  15 78         ora $78,x
$0e:c798  86 c6         stx $c6
$0e:c79a  85 51         sta $51
$0e:c79c  f8            sed
$0e:c79d  59 3f 1b      eor $1b3f,y
$0e:c7a0  8f a4 bb f0   sta $f0bba4
$0e:c7a4  a0 09         ldy #$09
$0e:c7a6  ff 03 df f0   sbc $f0df03,x
$0e:c7aa  ff 97 83 f9   sbc $f98397,x
$0e:c7ae  ff ff 1a 47   sbc $471aff,x
$0e:c7b2  ff ee 94 ea   sbc $ea94ee,x
$0e:c7b6  bb            tyx
$0e:c7b7  bd 38 d6      lda $d638,x
$0e:c7ba  82 a3 5b      brl $2360
$0e:c7bd  b0 78         bcs $c837
$0e:c7bf  e2 93         sep #$93
$0e:c7c1  4c 76 b6      jmp $b676
$0e:c7c4  85 10         sta $10
$0e:c7c6  bf c0 23 fe   lda $fe23c0,x
$0e:c7ca  48            pha
$0e:c7cb  38            sec
$0e:c7cc  84 00         sty $00
$0e:c7ce  ed d9 cb      sbc $cbd9
$0e:c7d1  c8            iny
$0e:c7d2  f7 d4         sbc [$d4],y
$0e:c7d4  af cd 5b 96   lda $965bcd
$0e:c7d8  77 6b         adc [$6b],y
$0e:c7da  07 fa         ora [$fa]
$0e:c7dc  83 f8         sta $f8,s
$0e:c7de  83 f8         sta $f8,s
$0e:c7e0  18            clc
$0e:c7e1  60            rts
$0e:c7e2  07 6c         ora [$6c]
$0e:c7e4  c4 52         cpy $52
$0e:c7e6  4b            phk
$0e:c7e7  00 d1         brk #$d1
$0e:c7e9  44 6b 74      mvp $74,$6b
$0e:c7ec  99 0c 8a      sta $8a0c,y
$0e:c7ef  99 04 d9      sta $d904,y
$0e:c7f2  56 bc         lsr $bc,x
$0e:c7f4  94 0f         sty $0f,x
$0e:c7f6  79 b4 18      adc $18b4,y
$0e:c7f9  03 b7         ora $b7,s
$0e:c7fb  ff f7 ff ff   sbc $fffff7,x
$0e:c7ff  bf ff b5 80   lda $80b5ff,x
$0e:c803  34 e9         bit $e9,x
$0e:c805  fe 97 c3      inc $c397,x
$0e:c808  57 e5         eor [$e5],y
$0e:c80a  ca            dex
$0e:c80b  32 35         and ($35)
$0e:c80d  3e 17 23      rol $2317,x
$0e:c810  87 77         sta [$77]
$0e:c812  9b            txy
$0e:c813  7a            ply
$0e:c814  eb            xba
$0e:c815  98            tya
$0e:c816  0f fc 7b ff   ora $ff7bfc
$0e:c81a  3c ff df      bit $dfff,x
$0e:c81d  9c 42 e3      stz $e342
$0e:c820  0c 47 fd      tsb $fd47
$0e:c823  be 1f b9      ldx $b91f,y
$0e:c826  05 37         ora $37
$0e:c828  65 da         adc $da
$0e:c82a  80 6d         bra $c899
$0e:c82c  68            pla
$0e:c82d  b4 c8         ldy $c8,x
$0e:c82f  67 4e         adc [$4e]
$0e:c831  21 16         and ($16,x)
$0e:c833  c0 f5         cpy #$f5
$0e:c835  61 08         adc ($08,x)
$0e:c837  74 fd         stz $fd,x
$0e:c839  40            rti
$0e:c83a  3e 70 0f      rol $0f70,x
$0e:c83d  7a            ply
$0e:c83e  18            clc
$0e:c83f  dd e3 32      cmp $32e3,x
$0e:c842  9b            txy
$0e:c843  42 71         wdm #$71
$0e:c845  d8            cld
$0e:c846  3d 3c 02      and $023c,x
$0e:c849  f7 00         sbc [$00],y
$0e:c84b  d7 54         cmp [$54],y
$0e:c84d  21 bf         and ($bf,x)
$0e:c84f  a4 3a         ldy $3a
$0e:c851  20 01 0e      jsr $0e01
$0e:c854  dd 6b 9c      cmp $9c6b,x
$0e:c857  a3 35         lda $35,s
$0e:c859  84 d7         sty $d7
$0e:c85b  70 2d         bvs $c88a
$0e:c85d  90 0a         bcc $c869
$0e:c85f  26 03         rol $03
$0e:c861  81 00         sta ($00,x)
$0e:c863  c0 60         cpy #$60
$0e:c865  20 10 cf      jsr $cf10
$0e:c868  fd 13 fd      sbc $fd13,x
$0e:c86b  40            rti
$0e:c86c  f7 60         sbc [$60],y
$0e:c86e  3d 98 0e      and $0e98,x
$0e:c871  24 00         bit $00
$0e:c873  74 23         stz $23,x
$0e:c875  b0 82         bcs $c7f9
$0e:c877  c9 66         cmp #$66
$0e:c879  58            cli
$0e:c87a  2f 6c 9f 45   and $459f6c
$0e:c87e  53 ad         eor ($ad,s),y
$0e:c880  58            cli
$0e:c881  bc 31 59      ldy $5931,x
$0e:c884  ae 3d 3a      ldx $3a3d
$0e:c887  00 50         brk #$50
$0e:c889  fe c0 7b      inc $7bc0,x
$0e:c88c  10 1f         bpl $c8ad
$0e:c88e  e1 80         sbc ($80,x)
$0e:c890  7f c6 80 80   adc $8080c6,x
$0e:c894  21 c2         and ($c2,x)
$0e:c896  2d 12 84      and $8412
$0e:c899  44 a1 91      mvp $91,$a1
$0e:c89c  68            pla
$0e:c89d  04 52         tsb $52
$0e:c89f  11 0c         ora ($0c),y
$0e:c8a1  3b            tsc
$0e:c8a2  84 02         sty $02
$0e:c8a4  10 7b         bpl $c921
$0e:c8a6  08            php
$0e:c8a7  64 78         stz $78
$0e:c8a9  fe 10 84      inc $8410,x
$0e:c8ac  10 47         bpl $c8f5
$0e:c8ae  07 c0         ora [$c0]
$0e:c8b0  87 13         sta [$13]
$0e:c8b2  e0 c0         cpx #$c0
$0e:c8b4  e0 30         cpx #$30
$0e:c8b6  28            plp
$0e:c8b7  0c 01 24      tsb $2401
$0e:c8ba  29 22         and #$22
$0e:c8bc  4d 1c 0d      eor $0d1c
$0e:c8bf  3e 29 23      rol $2329,x
$0e:c8c2  4c 24 96      jmp $9624
$0e:c8c5  37 9a         and [$9a],y
$0e:c8c7  92 e5         sta ($e5)
$0e:c8c9  a1 34         lda ($34,x)
$0e:c8cb  dc c6 46      jml [$46c6]
$0e:c8ce  09 d7         ora #$d7
$0e:c8d0  86 4a         stx $4a
$0e:c8d2  28            plp
$0e:c8d3  d5 2b         cmp $2b,x
$0e:c8d5  24 03         bit $03
$0e:c8d7  d1 00         cmp ($00),y
$0e:c8d9  f6 40         inc $40,x
$0e:c8db  0d 61 fe      ora $fe61
$0e:c8de  7f 2f fe 87   adc $87fe2f,x
$0e:c8e2  96 f4         stx $f4,y
$0e:c8e4  cb            wai
$0e:c8e5  36 f5         rol $f5,x
$0e:c8e7  aa            tax
$0e:c8e8  66 cb         ror $cb
$0e:c8ea  2f 09 9a 42   and $429a09
$0e:c8ee  e9 32         sbc #$32
$0e:c8f0  4f 25 26 73   eor $732625
$0e:c8f4  00 89         brk #$89
$0e:c8f6  a4 c2         ldy $c2
$0e:c8f8  81 01         sta ($01,x)
$0e:c8fa  f2 30         sbc ($30)
$0e:c8fc  50 d8         bvc $c8d6
$0e:c8fe  16 1c         asl $1c,x
$0e:c900  ff 5b 1b 08   sbc $081b5b,x
$0e:c904  d2 e9         cmp ($e9)
$0e:c906  62 70 2b      per $f479
$0e:c909  cd 66 6d      cmp $6d66
$0e:c90c  25 fd         and $fd
$0e:c90e  76 a6         ror $a6,x
$0e:c910  ee a2 ef      inc $efa2
$0e:c913  40            rti
$0e:c914  79 90 1c      adc $1c90,y
$0e:c917  24 c7         bit $c7
$0e:c919  01 33         ora ($33,x)
$0e:c91b  80 5e         bra $c97b
$0e:c91d  c4 81         cpy $81
$0e:c91f  57 84         eor [$84],y
$0e:c921  73 b6         adc ($b6,s),y
$0e:c923  3b            tsc
$0e:c924  28            plp
$0e:c925  ec 37 d7      cpx $d737
$0e:c928  76 d4         ror $d4,x
$0e:c92a  c5 3b         cmp $3b
$0e:c92c  61 60         adc ($60,x)
$0e:c92e  df d9 bc 10   cmp $10bcd9,x
$0e:c932  ba            tsx
$0e:c933  04 7c         tsb $7c
$0e:c935  42 11         wdm #$11
$0e:c937  0d f8 94      ora $94f8
$0e:c93a  24 06         bit $06
$0e:c93c  d0 15         bne $c953
$0e:c93e  0c db ff      tsb $ffdb
$0e:c941  0b            phd
$0e:c942  ff 49 3b 1b   sbc $1b3b49,x
$0e:c946  9f 2c 6a cf   sta $cf6a2c,x
$0e:c94a  d5 b7         cmp $b7,x
$0e:c94c  4a            lsr a
$0e:c94d  b6 fa         ldx $fa,y
$0e:c94f  5a            phy
$0e:c950  7c 06 fe      jmp ($fe06,x)
$0e:c953  3f 08 1d fe   and $fe1d08,x
$0e:c957  05 7f         ora $7f
$0e:c959  c0 4f         cpy #$4f
$0e:c95b  c8            iny
$0e:c95c  e1 c0         sbc ($c0,x)
$0e:c95e  8f fc 20 f9   sta $f920fc
$0e:c962  6b            rtl
$0e:c963  6f 26 4d 7c   adc $7c4d26
$0e:c967  89 4a         bit #$4a
$0e:c969  b2 1d         lda ($1d)
$0e:c96b  2a            rol a
$0e:c96c  1c b7 dd      trb $ddb7
$0e:c96f  70 f9         bvs $c96a
$0e:c971  61 7a         adc ($7a,x)
$0e:c973  5f f2 f9 df   eor $dff9f2,x
$0e:c977  ff f3 cf f4   sbc $f4cff3,x
$0e:c97b  47 f9         eor [$f9]
$0e:c97d  0f fc 4b fc   ora $fc4bfc
$0e:c981  15 9d         ora $9d,x
$0e:c983  f4 2a f7      pea $f72a
$0e:c986  a8            tay
$0e:c987  9d 69 28      sta $2869,x
$0e:c98a  f5 bb         sbc $bb,x
$0e:c98c  07 8e         ora [$8e]
$0e:c98e  29 34         and #$34
$0e:c990  c7 6b         cmp [$6b]
$0e:c992  68            pla
$0e:c993  40            rti
$0e:c994  d0 c2         bne $c958
$0e:c996  4f f8 b0 df   eor $dfb0f8
$0e:c99a  c0 ac         cpy #$ac
$0e:c99c  90 c7         bcc $c965
$0e:c99e  a9 bb         lda #$bb
$0e:c9a0  e8            inx
$0e:c9a1  6f 54 6f 4e   adc $4e6f54
$0e:c9a5  9b            txy
$0e:c9a6  36 77         rol $77,x
$0e:c9a8  7f e4 1f e1   adc $e11fe4,x
$0e:c9ac  1f e0 5f d0   ora $d05fe0,x
$0e:c9b0  cf 4b 82 ed   cmp $ed824b
$0e:c9b4  25 94         and $94
$0e:c9b6  68            pla
$0e:c9b7  54 ca 01      mvn $01,$ca
$0e:c9ba  49 95         eor #$95
$0e:c9bc  5c e4 19 49   jml $4919e4
$0e:c9c0  25 97         and $97
$0e:c9c2  83 fe         sta $fe,s
$0e:c9c4  ff f7 ff ff   sbc $fffff7,x
$0e:c9c8  d2 f8         cmp ($f8)
$0e:c9ca  fd cb e3      sbc $e3cb,x
$0e:c9cd  fb            xce
$0e:c9ce  ff ef bf ff   sbc $ffbfef,x
$0e:c9d2  49 e6         eor #$e6
$0e:c9d4  0a            asl a
$0e:c9d5  c5 9d         cmp $9d
$0e:c9d7  b8            clv
$0e:c9d8  de 36 dd      dec $dd36,x
$0e:c9db  69 85         adc #$85
$0e:c9dd  17 43         ora [$43],y
$0e:c9df  59 d8 f8      eor $f8d8,y
$0e:c9e2  b2 50         lda ($50)
$0e:c9e4  3f fc 77 ff   and $ff77fc,x
$0e:c9e8  0e ff c3      asl $c3ff
$0e:c9eb  dc 83 1e      jml [$1e83]
$0e:c9ee  71 0c         adc ($0c),y
$0e:c9f0  37 ff         and [$ff],y
$0e:c9f2  ac 81 da      ldy $da81
$0e:c9f5  b2 fd         lda ($fd)
$0e:c9f7  1d fe de      ora $defe,x
$0e:c9fa  9f 52 b7 fa   sta $fab752,x
$0e:c9fe  e2 a9         sep #$a9
$0e:ca00  b2 43         lda ($43)
$0e:ca02  b2 1d         lda ($1d)
$0e:ca04  b2 5f         lda ($5f)
$0e:ca06  db            stp
$0e:ca07  2f fb b5 fd   and $fdb5fb
$0e:ca0b  ba            tsx
$0e:ca0c  ff f5 bf a9   sbc $a9bff5,x
$0e:ca10  5f 42 a8 fc   eor $fca842,x
$0e:ca14  f4 69 69      pea $6969
$0e:ca17  af f5 9d a7   lda $a79df5
$0e:ca1b  93 75         sta ($75,s),y
$0e:ca1d  dc dc 62      jml [$62dc]
$0e:ca20  bd 96 ad      lda $ad96,x
$0e:ca23  66 c2         ror $c2
$0e:ca25  cc aa 28      cpy $28aa
$0e:ca28  12 ac         ora ($ac)
$0e:ca2a  3f c9 f0 88   and $88f0c9,x
$0e:ca2e  7f 89 21 18   adc $182189,x
$0e:ca32  ff 76 32 dc   sbc $dc3276,x
$0e:ca36  cc b4 bb      cpy $bbb4
$0e:ca39  6f 58 f2 d2   adc $d2f258
$0e:ca3d  fe da ca      inc $cada,x
$0e:ca40  96 da         stx $da,y
$0e:ca42  b1 54         lda ($54),y
$0e:ca44  dc 58 3f      jml [$3f58]
$0e:ca47  c5 f0         cmp $f0
$0e:ca49  a0 10         ldy #$10
$0e:ca4b  88            dey
$0e:ca4c  88            dey
$0e:ca4d  44 61 bb      mvp $bb,$61
$0e:ca50  6e 75 56      ror $5675
$0e:ca53  dd dd b3      cmp $b3dd,x
$0e:ca56  13 28         ora ($28,s),y
$0e:ca58  88            dey
$0e:ca59  ee 30 19      inc $1930
$0e:ca5c  08            php
$0e:ca5d  06 02         asl $02
$0e:ca5f  00 7d         brk #$7d
$0e:ca61  0f fc 41 00   ora $0041fc
$0e:ca65  60            rts
$0e:ca66  66 ed         ror $ed
$0e:ca68  e5 b9         sbc $b9
$0e:ca6a  d9 79 6e      cmp $6e79,y
$0e:ca6d  d6 71         dec $71,x
$0e:ca6f  a4 a1         ldy $a1
$0e:ca71  fd bc 14      sbc $14bc,x
$0e:ca74  29 0d         and #$0d
$0e:ca76  0e 81 01      asl $0181
$0e:ca79  b0 7f         bcs $cafa
$0e:ca7b  d3 e0         cmp ($e0,s),y
$0e:ca7d  1e 0a 1f      asl $1f0a,x
$0e:ca80  fe 02 a6      inc $a602,x
$0e:ca83  11 f9         ora ($f9),y
$0e:ca85  6d a1 34      adc $34a1
$0e:ca88  9c 9f 9b      stz $9b9f
$0e:ca8b  33 2b         and ($2b,s),y
$0e:ca8d  ae 70 7e      ldx $7e70
$0e:ca90  90 59         bcc $caeb
$0e:ca92  e7 82         sbc [$82]
$0e:ca94  ed 51 8c      sbc $8c51
$0e:ca97  0f c6 fe c1   ora $c1fec6
$0e:ca9b  0c 04 fe      tsb $fe04
$0e:ca9e  11 3f         ora ($3f),y
$0e:caa0  e0 47         cpx #$47
$0e:caa2  f0 11         beq $cab5
$0e:caa4  ff 04 3f 51   sbc $513f04,x
$0e:caa8  77 d1         adc [$d1],y
$0e:caaa  5f ea 1f 0c   eor $0c1fea,x
$0e:caae  56 0a         lsr $0a,x
$0e:cab0  29 54         and #$54
$0e:cab2  fa            plx
$0e:cab3  40            rti
$0e:cab4  26 b8         rol $b8
$0e:cab6  90 e8         bcc $caa0
$0e:cab8  11 c2         ora ($c2),y
$0e:caba  01 f0         ora ($f0,x)
$0e:cabc  87 f0         sta [$f0]
$0e:cabe  2f b0 0f 59   and $590fb0
$0e:cac2  9c c5 21      stz $21c5
$0e:cac5  d8            cld
$0e:cac6  cb            wai
$0e:cac7  c8            iny
$0e:cac8  b7 f4         lda [$f4],y
$0e:caca  8f c5 2b 84   sta $842bc5
$0e:cace  d7 63         cmp [$63],y
$0e:cad0  08            php
$0e:cad1  fe 20 fe      inc $fe20,x
$0e:cad4  09 eb         ora #$eb
$0e:cad6  99 ea 5e      sta $5eea,y
$0e:cad9  db            stp
$0e:cada  a5 2f         lda $2f
$0e:cadc  55 de         eor $de,x
$0e:cade  94 77         sty $77,x
$0e:cae0  ae b9 4a      ldx $4ab9
$0e:cae3  de b3 c1      dec $c1b3,x
$0e:cae6  2a            rol a
$0e:cae7  ba            tsx
$0e:cae8  ee 87 e1      inc $e187
$0e:caeb  80 ff         bra $caec
$0e:caed  40            rti
$0e:caee  44 41 fc      mvp $fc,$41
$0e:caf1  85 ff         sta $ff
$0e:caf3  22 7f 88 b8   jsl $b8887f
$0e:caf7  08            php
$0e:caf8  3e 1f b9      rol $b91f,x
$0e:cafb  05 33         ora $33
$0e:cafd  61 d5         adc ($d5,x)
$0e:caff  84 e9         sty $e9
$0e:cb01  2b            pld
$0e:cb02  35 8b         and $8b,x
$0e:cb04  0f 86 2b 34   ora $342b86
$0e:cb08  c4 da         cpy $da
$0e:cb0a  ad 66 66      lda $6666
$0e:cb0d  21 a6         and ($a6,x)
$0e:cb0f  52 01         eor ($01)
$0e:cb11  19 e0 dc      ora $dce0,y
$0e:cb14  b9 96 ee      lda $ee96,y
$0e:cb17  a5 1b         lda $1b
$0e:cb19  b9 6e ee      lda $ee6e,y
$0e:cb1c  57 38         eor [$38],y
$0e:cb1e  53 dd         eor ($dd,s),y
$0e:cb20  e7 0f         sbc [$0f]
$0e:cb22  ff 3e bf 4f   sbc $4fbf3e,x
$0e:cb26  ff e6 16 52   sbc $5216e6,x
$0e:cb2a  82 1c 2a      brl $f549
$0e:cb2d  7a            ply
$0e:cb2e  e9 3d         sbc #$3d
$0e:cb30  73 49         adc ($49,s),y
$0e:cb32  3b            tsc
$0e:cb33  c6 d3         dec $d3
$0e:cb35  a9 56         lda #$56
$0e:cb37  7f 24 56 65   adc $655624,x
$0e:cb3b  8b            phb
$0e:cb3c  d6 d0         dec $d0,x
$0e:cb3e  60            rts
$0e:cb3f  17 ec         ora [$ec],y
$0e:cb41  04 73         tsb $73
$0e:cb43  80 e1         bra $cb26
$0e:cb45  08            php
$0e:cb46  07 e2         ora [$e2]
$0e:cb48  01 fa         ora ($fa,x)
$0e:cb4a  6f 89 24 2b   adc $2b2489
$0e:cb4e  3d 79 1f      and $1f79,x
$0e:cb51  fa            plx
$0e:cb52  95 f9         sta $f9,x
$0e:cb54  eb            xba
$0e:cb55  72 e3         adc ($e3)
$0e:cb57  7a            ply
$0e:cb58  0f 1e 52 69   ora $69521e
$0e:cb5c  0e 7e 84      asl $847e
$0e:cb5f  80 44         bra $cba5
$0e:cb61  17 88         ora [$88],y
$0e:cb63  3c 02 7e      bit $7e02,x
$0e:cb66  c3 05         cmp $05,s
$0e:cb68  30 8f         bmi $caf9
$0e:cb6a  ca            dex
$0e:cb6b  15 01         ora $01,x
$0e:cb6d  c1 c0         cmp ($c0,x)
$0e:cb6f  32 30         and ($30)
$0e:cb71  0a            asl a
$0e:cb72  84 02         sty $02
$0e:cb74  51 10         eor ($10),y
$0e:cb76  dc 44 3a      jml [$3a44]
$0e:cb79  93 89         sta ($89,s),y
$0e:cb7b  a4 20         ldy $20
$0e:cb7d  3e 0b fc      rol $fc0b,x
$0e:cb80  81 48         sta ($48,x)
$0e:cb82  24 30         bit $30
$0e:cb84  08            php
$0e:cb85  14 06         trb $06
$0e:cb87  4b            phk
$0e:cb88  00 80         brk #$80
$0e:cb8a  48            pha
$0e:cb8b  ae 72 08      ldx $0872
$0e:cb8e  85 86         sta $86
$0e:cb90  c3 40         cmp $40,s
$0e:cb92  5f f7 86 55   eor $5586f7,x
$0e:cb96  8e b2 cd      stx $cdb2
$0e:cb99  ee bf 1a      inc $1abf
$0e:cb9c  bc 2b 5d      ldy $5d2b,x
$0e:cb9f  dd d4 79      cmp $79d4,x
$0e:cba2  b1 11         lda ($11),y
$0e:cba4  9a            txs
$0e:cba5  ac 73 ff      ldy $ff73
$0e:cba8  18            clc
$0e:cba9  ff c2 3f f2   sbc $f23fc2,x
$0e:cbad  8f fd c7 ff   sta $ffc7fd
$0e:cbb1  73 04         adc ($04,s),y
$0e:cbb3  0f 8b ff f8   ora $f8ff8b
$0e:cbb7  99 67 6a      sta $6a67,y
$0e:cbba  54 2c e5      mvn $e5,$2c
$0e:cbbd  e7 5b         sbc [$5b]
$0e:cbbf  34 d0         bit $d0,x
$0e:cbc1  e6 75         inc $75
$0e:cbc3  12 cc         ora ($cc)
$0e:cbc5  4f 5e 17 07   eor $07175e
$0e:cbc9  ff c9 c4 03   sbc $03c4c9,x
$0e:cbcd  06 ff         asl $ff
$0e:cbcf  c3 84         cmp $84,s
$0e:cbd1  82 25 08      brl $d3f9
$0e:cbd4  27 fe         and [$fe]
$0e:cbd6  9b            txy
$0e:cbd7  d6 b7         dec $b7,x
$0e:cbd9  75 76         adc $76,x
$0e:cbdb  b8            clv
$0e:cbdc  6e 8e 9a      ror $9a8e
$0e:cbdf  b5 2c         lda $2c,x
$0e:cbe1  d5 63         cmp $63,x
$0e:cbe3  35 98         and $98,x
$0e:cbe5  8d a6 62      sta $62a6
$0e:cbe8  71 ff         adc ($ff),y
$0e:cbea  1f 85 e0 84   ora $84e085,x
$0e:cbee  3f 0f f5 c0   and $c0f50f,x
$0e:cbf2  90 1f         bcc $cc13
$0e:cbf4  cb            wai
$0e:cbf5  07 f2         ora [$f2]
$0e:cbf7  d1 ac         cmp ($ac),y
$0e:cbf9  9a            txs
$0e:cbfa  79 23 1c      adc $1c23,y
$0e:cbfd  ca            dex
$0e:cbfe  47 3a         eor [$3a]
$0e:cc00  c5 cc         cmp $cc
$0e:cc02  fa            plx
$0e:cc03  56 ba         lsr $ba,x
$0e:cc05  75 cc         adc $cc,x
$0e:cc07  35 66         and $66,x
$0e:cc09  21 fc         and ($fc,x)
$0e:cc0b  8c 7f 26      sty $267f
$0e:cc0e  06 20         asl $20
$0e:cc10  ff 19 41 3e   sbc $3e4119,x
$0e:cc14  12 0f         ora ($0f)
$0e:cc16  f9 ac 15      sbc $15ac,y
$0e:cc19  61 ed         adc ($ed,x)
$0e:cc1b  99 f9 63      sta $63f9,y
$0e:cc1e  7d a9 2e      adc $2ea9,x
$0e:cc21  b6 ed         ldx $ed,y
$0e:cc23  59 eb 6d      eor $6deb,y
$0e:cc26  af 3c 59 db   lda $db593c
$0e:cc2a  34 0f         bit $0f,x
$0e:cc2c  ec 6b 03      cpx $036b
$0e:cc2f  f9 5f f0      sbc $f05f,y
$0e:cc32  19 7f 65      ora $657f,y
$0e:cc35  72 c7         adc ($c7)
$0e:cc37  8e f9 de      stx $def9
$0e:cc3a  7c f1 ad      jmp ($adf1,x)
$0e:cc3d  36 b2         rol $b2,x
$0e:cc3f  a7 53         lda [$53]
$0e:cc41  de 9f cb      dec $cb9f,x
$0e:cc44  00 c0         brk #$c0
$0e:cc46  3a            dec a
$0e:cc47  0b            phd
$0e:cc48  00 f9         brk #$f9
$0e:cc4a  b2 eb         lda ($eb)
$0e:cc4c  be 1b b7      ldx $b71b,y
$0e:cc4f  03 d2         ora $d2,s
$0e:cc51  d6 6b         dec $6b,x
$0e:cc53  56 0f         lsr $0f,x
$0e:cc55  1c 52 69      trb $6952
$0e:cc58  8e d6 d0      stx $d0d6
$0e:cc5b  be 10 7f      ldx $7f10,y
$0e:cc5e  c4 0f         cpy $0f
$0e:cc60  f9 01 ff      sbc $ff01,y
$0e:cc63  37 de         and [$de],y
$0e:cc65  25 87         and $87
$0e:cc67  e2 44         sep #$44
$0e:cc69  f7 75         sbc [$75],y
$0e:cc6b  1a            inc a
$0e:cc6c  56 67         lsr $67,x
$0e:cc6e  2b            pld
$0e:cc6f  e8            inx
$0e:cc70  a2 5e         ldx #$5e
$0e:cc72  3a            dec a
$0e:cc73  15 cd         ora $cd,x
$0e:cc75  25 1d         and $1d
$0e:cc77  90 a8         bcc $cc21
$0e:cc79  a0 47         ldy #$47
$0e:cc7b  84 7f         sty $7f
$0e:cc7d  40            rti
$0e:cc7e  c0 08         cpy #$08
$0e:cc80  0e df 53      asl $53df
$0e:cc83  dc f5 c8      jml [$c8f5]
$0e:cc86  aa            tax
$0e:cc87  fa            plx
$0e:cc88  de 5d 5b      dec $5b5d,x
$0e:cc8b  73 91         adc ($91,s),y
$0e:cc8d  be 70 26      ldx $2670,y
$0e:cc90  cb            wai
$0e:cc91  d0 a0         bne $cc33
$0e:cc93  22 87 11 ff   jsl $ff1187
$0e:cc97  88            dey
$0e:cc98  22 83 fd 03   jsl $03fd83
$0e:cc9c  fc 43 fc      jsr ($fc43,x)
$0e:cc9f  13 fc         ora ($fc,s),y
$0e:cca1  04 8f         tsb $8f
$0e:cca3  e1 dd         sbc ($dd,x)
$0e:cca5  b9 4d bd      lda $bd4d,y
$0e:cca8  36 6e         rol $6e,x
$0e:ccaa  dc 6d 70      jml [$706d]
$0e:ccad  b0 ff         bcs $ccae
$0e:ccaf  80 2c         bra $ccdd
$0e:ccb1  23 fc         and $fc,s
$0e:ccb3  00 68         brk #$68
$0e:ccb5  20 1b 55      jsr $551b
$0e:ccb8  80 89         bra $cc43
$0e:ccba  70 f9         bvs $ccb5
$0e:ccbc  76 f8         ror $f8,x
$0e:ccbe  37 72         and [$72],y
$0e:ccc0  d3 b8         cmp ($b8,s),y
$0e:ccc2  c5 de         cmp $de
$0e:ccc4  33 57         and ($57,s),y
$0e:ccc6  5e 2c 92      lsr $922c,x
$0e:ccc9  ff 00 9e 40   sbc $409e00,x
$0e:cccd  22 10 39 1c   jsl $1c3910
$0e:ccd1  3e 0f 1f      rol $1f0f,x
$0e:ccd4  23 84         and $84,s
$0e:ccd6  3e 7f 1b      rol $1b7f,x
$0e:ccd9  9f cd bf f8   sta $f8bfcd,x
$0e:ccdd  bb            tyx
$0e:ccde  f6 92         inc $92,x
$0e:cce0  b1 39         lda ($39),y
$0e:cce2  f2 d6         sbc ($d6)
$0e:cce4  b4 f9         ldy $f9,x
$0e:cce6  5b            tcd
$0e:cce7  77 aa         adc [$aa],y
$0e:cce9  ef 25 c7 c0   sbc $c0c725
$0e:cced  6f e5 f0 81   adc $81f0e5
$0e:ccf1  df e0 43 f0   cmp $f043e0,x
$0e:ccf5  9f 99 c6 3f   sta $3fc699,x
$0e:ccf9  70 83         bvs $cc7e
$0e:ccfb  fd 64 b4      sbc $b464,x
$0e:ccfe  2d 97 76      and $7697
$0e:cd01  0f aa a9 f5   ora $f5a9aa
$0e:cd05  ac d4 9c      ldy $9cd4
$0e:cd08  df 6a 85 35   cmp $35856a,x
$0e:cd0c  b3 7e         lda ($7e,s),y
$0e:cd0e  a0 1f         ldy #$1f
$0e:cd10  d8            cld
$0e:cd11  0b            phd
$0e:cd12  b4 3f         ldy $3f,x
$0e:cd14  90 0f         bcc $cd25
$0e:cd16  cc 07 e9      cpy $e907
$0e:cd19  01 de         ora ($de,x)
$0e:cd1b  c0 73         cpy #$73
$0e:cd1d  10 0a         bpl $cd29
$0e:cd1f  16 57         asl $57,x
$0e:cd21  d9 2b db      cmp $db2b,y
$0e:cd24  d6 69         dec $69,x
$0e:cd26  db            stp
$0e:cd27  1c 9c 22      trb $229c
$0e:cd2a  61 08         adc ($08,x)
$0e:cd2c  a4 48         ldy $48
$0e:cd2e  3c 14 89      bit $8914,x
$0e:cd31  c4 04         cpy $04
$0e:cd33  86 10         stx $10
$0e:cd35  0a            asl a
$0e:cd36  1c 03 cf      trb $cf03
$0e:cd39  00 f7         brk #$f7
$0e:cd3b  b1 92         lda ($92),y
$0e:cd3d  11 04         ora ($04),y
$0e:cd3f  93 40         sta ($40,s),y
$0e:cd41  21 10         and ($10,x)
$0e:cd43  0c 84 22      tsb $2284
$0e:cd46  19 08 57      ora $5708,y
$0e:cd49  85 1a         sta $1a
$0e:cd4b  01 24         ora ($24,x)
$0e:cd4d  a0 37         ldy #$37
$0e:cd4f  dd 80 ba      cmp $ba80,x
$0e:cd52  1a            inc a
$0e:cd53  07 22         ora [$22]
$0e:cd55  01 02         ora ($02,x)
$0e:cd57  c4 62         cpy $62
$0e:cd59  62 11 02      per $cf6d
$0e:cd5c  10 2f         bpl $cd8d
$0e:cd5e  00 84         brk #$84
$0e:cd60  10 25         bpl $cd87
$0e:cd62  ff 5c a7 7a   sbc $7aa75c,x
$0e:cd66  59 b7 b6      eor $b6b7,y
$0e:cd69  ed 1f 9a      sbc $9a1f
$0e:cd6c  68            pla
$0e:cd6d  34 d4         bit $d4,x
$0e:cd6f  af 6e a2 db   lda $dba26e
$0e:cd73  d7 9e         cmp [$9e],y
$0e:cd75  f1 3f         sbc ($3f),y
$0e:cd77  fc 8f fe      jsr ($fe8f,x)
$0e:cd7a  20 00 35      jsr $3500
$0e:cd7d  8f fc 43 ff   sta $ff43fc
$0e:cd81  12 ff         ora ($ff)
$0e:cd83  c0 bf         cpy #$bf
$0e:cd85  fd a9 1d      sbc $1da9,x
$0e:cd88  33 cf         and ($cf,s),y
$0e:cd8a  e5 e7         sbc $e7
$0e:cd8c  4e e9 98      lsr $98e9
$0e:cd8f  5e 97 eb      lsr $eb97,x
$0e:cd92  2f 05 d4 c0   and $c0d405
$0e:cd96  b5 70         lda $70,x
$0e:cd98  46 51         lsr $51
$0e:cd9a  e0 3f         cpx #$3f
$0e:cd9c  f0 c1         beq $cd5f
$0e:cd9e  30 c7         bmi $cd67
$0e:cda0  bf f1 cf fd   lda $fdcff1,x
$0e:cda4  db            stp
$0e:cda5  1f a2 a8 6f   ora $6fa8a2,x
$0e:cda9  2a            rol a
$0e:cdaa  7d 3b bf      adc $bf3b,x
$0e:cdad  7e e0 a5      ror $a5e0,x
$0e:cdb0  0a            asl a
$0e:cdb1  df dc 6a 10   cmp $106adc,x
$0e:cdb5  08            php
$0e:cdb6  04 3c         tsb $3c
$0e:cdb8  80 b1         bra $cd6b
$0e:cdba  f2 01         sbc ($01)
$0e:cdbc  f3 2d         sbc ($2d,s),y
$0e:cdbe  75 7f         adc $7f,x
$0e:cdc0  85 77         sta $77
$0e:cdc2  e3 de         sbc $de,s
$0e:cdc4  af d6 f8 d2   lda $d2f8d6
$0e:cdc8  dd 1e 97      cmp $971e,x
$0e:cdcb  49 32         eor #$32
$0e:cdcd  ff c5 c8 03   sbc $03c8c5,x
$0e:cdd1  0e 80 48      asl $4880
$0e:cdd4  60            rts
$0e:cdd5  13 d8         ora ($d8,s),y
$0e:cdd7  05 7a         ora $7a
$0e:cdd9  01 5b         ora ($5b,x)
$0e:cddb  1f 84 03 67   ora $670384,x
$0e:cddf  e8            inx
$0e:cde0  a4 c5         ldy $c5
$0e:cde2  ba            tsx
$0e:cde3  d2 1d         cmp ($1d)
$0e:cde5  35 6e         and $6e,x
$0e:cde7  b7 60         lda [$60],y
$0e:cde9  f1 c5         sbc ($c5),y
$0e:cdeb  26 98         rol $98
$0e:cded  ed 6d 08      sbc $086d
$0e:cdf0  92 0a         sta ($0a)
$0e:cdf2  85 63         sta $63
$0e:cdf4  ac 06 03      ldy $0306
$0e:cdf7  05 82         ora $82
$0e:cdf9  44 a2 32      mvp $32,$a2
$0e:cdfc  69 5c         adc #$5c
$0e:cdfe  ee 41 43      inc $4341
$0e:ce01  aa            tax
$0e:ce02  45 29         eor $29
$0e:ce04  d0 d9         bne $cddf
$0e:ce06  10 fc         bpl $ce04
$0e:ce08  20 64 63      jsr $6364
$0e:ce0b  24 84         bit $84
$0e:ce0d  fd 50 35      sbc $3550,x
$0e:ce10  f3 60         sbc ($60,s),y
$0e:ce12  ab            plb
$0e:ce13  8a            txa
$0e:ce14  05 04         ora $04
$0e:ce16  87 40         sta [$40]
$0e:ce18  ed 35 0c      sbc $0c35
$0e:ce1b  b6 33         ldx $33,y
$0e:ce1d  ab            plb
$0e:ce1e  a2 57         ldx #$57
$0e:ce20  14 18         trb $18
$0e:ce22  80 2a         bra $ce4e
$0e:ce24  92 bf         sta ($bf)
$0e:ce26  b2 86         lda ($86)
$0e:ce28  15 fc         ora $fc,x
$0e:ce2a  b5 65         lda $65,x
$0e:ce2c  72 b4         adc ($b4)
$0e:ce2e  cb            wai
$0e:ce2f  77 0c         adc [$0c],y
$0e:ce31  2e 14 1c      rol $1c14
$0e:ce34  d6 2a         dec $2a,x
$0e:ce36  6f 15 b5 08   adc $08b515
$0e:ce3a  03 fc         ora $fc,s
$0e:ce3c  e0 1f         cpx #$1f
$0e:ce3e  e4 07         cpx $07
$0e:ce40  d9 01 f2      cmp $f201,y
$0e:ce43  40            rti
$0e:ce44  f8            sed
$0e:ce45  10 3c         bpl $ce83
$0e:ce47  04 af         tsb $af
$0e:ce49  b7 10         lda [$10],y
$0e:ce4b  b6 ee         ldx $ee,y
$0e:ce4d  b1 53         lda ($53),y
$0e:ce4f  5c b5 de 17   jml $17deb5
$0e:ce53  38            sec
$0e:ce54  e1 c1         sbc ($c1,x)
$0e:ce56  0f 64 81 0e   ora $0e8164
$0e:ce5a  3c 63 97      bit $9763,x
$0e:ce5d  3c c5 df      bit $dfc5,x
$0e:ce60  38            sec
$0e:ce61  f3 84         sbc ($84,s),y
$0e:ce63  4a            lsr a
$0e:ce64  6d 2b 79      adc $792b
$0e:ce67  79 ac ca      adc $caac,y
$0e:ce6a  b7 4d         lda [$4d],y
$0e:ce6c  8c 56 25      sty $2556
$0e:ce6f  53 18         eor ($18,s),y
$0e:ce71  a7 6a         lda [$6a]
$0e:ce73  01 7b         ora ($7b,x)
$0e:ce75  c2 79         rep #$79
$0e:ce77  c0 43 8d      cpy #$8d43
$0e:ce7a  bf 69 ef d8   lda $d8ef69,x
$0e:ce7e  5b            tcd
$0e:ce7f  f0 0c         beq $ce8d
$0e:ce81  03 e0         ora $e0,s
$0e:ce83  0b            phd
$0e:ce84  0a            asl a
$0e:ce85  8c 83 57      sty $5783
$0e:ce88  70 91         bvs $ce1b
$0e:ce8a  7e 69 fd      ror $fd69,x
$0e:ce8d  1e ef 0e      asl $0eef,x
$0e:ce90  cd d3 a9      cmp $a9d3
$0e:ce93  f4 25 5b      pea $5b25
$0e:ce96  04 42         tsb $42
$0e:ce98  48            pha
$0e:ce99  08            php
$0e:ce9a  8b            phb
$0e:ce9b  40            rti
$0e:ce9c  ff ca 6a 14   sbc $146aca,x
$0e:cea0  8f 15 4f c1   sta $c14f15
$0e:cea4  60            rts
$0e:cea5  d8            cld
$0e:cea6  ca            dex
$0e:cea7  ee 37 a9      inc $a937
$0e:ceaa  85 6e         sta $6e
$0e:ceac  03 88         ora $88,s
$0e:ceae  a9 a0 a2      lda #$a2a0
$0e:ceb1  02 44         cop #$44
$0e:ceb3  3c dd 8a      bit $8add,x
$0e:ceb6  57 8f         eor [$8f],y
$0e:ceb8  e8            inx
$0e:ceb9  47 a4         eor [$a4]
$0e:cebb  1b            tcs
$0e:cebc  aa            tax
$0e:cebd  cd 9f 69      cmp $699f
$0e:cec0  4f b5 c6 3c   eor $3cc6b5
$0e:cec4  59 ff e4      eor $e4ff,y
$0e:cec7  03 e1         ora $e1,s
$0e:cec9  03 f0         ora $f0,s
$0e:cecb  c1 f8         cmp ($f8,x)
$0e:cecd  30 fc         bmi $cecb
$0e:cecf  02 18         cop #$18
$0e:ced1  23 f8         and $f8,s
$0e:ced3  45 48         eor $48
$0e:ced5  f5 38         sbc $38,x
$0e:ced7  73 bb         adc ($bb,s),y
$0e:ced9  af 32 97 bf   lda $bf9732
$0e:cedd  f6 54         inc $54,x
$0e:cedf  7c 92 7d      jmp ($7d92,x)
$0e:cee2  77 6b         adc [$6b],y
$0e:cee4  2d 55 aa      and $aa55
$0e:cee7  cf f8 18 ff   cmp $ff18f8
$0e:ceeb  86 df         stx $df
$0e:ceed  f1 13         sbc ($13),y
$0e:ceef  fc 46 ff      jsr ($ff46,x)
$0e:cef2  95 9f         sta $9f,x
$0e:cef4  f5 a7         sbc $a7,x
$0e:cef6  fd ea ff      sbc $ffea,x
$0e:cef9  e6 7b         inc $7b
$0e:cefb  f1 59         sbc ($59),y
$0e:cefd  26 4a         rol $4a
$0e:ceff  13 a6         ora ($a6,s),y
$0e:cf01  ad d6 ec      lda $ecd6
$0e:cf04  1e 38 a3      asl $a338,x
$0e:cf07  ec a4 10      cpx $10a4
$0e:cf0a  0f d9 7e 0c   ora $0c7ed9
$0e:cf0e  23 5a         and $5a,s
$0e:cf10  ad c9 70      lda $70c9
$0e:cf13  3d 78 42      and $4278,x
$0e:cf16  d6 34         dec $34,x
$0e:cf18  90 0f         bcc $cf29
$0e:cf1a  f3 0a         sbc ($0a,s),y
$0e:cf1c  f5 35         sbc $35,x
$0e:cf1e  5c d7 0e ab   jml $ab0ed7
$0e:cf22  8a            txa
$0e:cf23  ea            nop
$0e:cf24  c2 31         rep #$31
$0e:cf26  51 cd         eor ($cd),y
$0e:cf28  0c 4a 1b      tsb $1b4a
$0e:cf2b  36 c9         rol $c9,x
$0e:cf2d  4d 20 46      eor $4620
$0e:cf30  07 86         ora [$86]
$0e:cf32  7f e1 00 a1   adc $a100e1,x
$0e:cf36  84 cc         sty $cc
$0e:cf38  b6 51         ldx $51,y
$0e:cf3a  1c 74 96      trb $9674
$0e:cf3d  b1 33         lda ($33),y
$0e:cf3f  ba            tsx
$0e:cf40  cd ec 53      cmp $53ec
$0e:cf43  58            cli
$0e:cf44  5d 73 6b      eor $6b73,x
$0e:cf47  5a            phy
$0e:cf48  04 80         tsb $80
$0e:cf4a  24 23         bit $23
$0e:cf4c  00 85         brk #$85
$0e:cf4e  22 96 e6 ef   jsl $efe696
$0e:cf52  bb            tyx
$0e:cf53  b3 ea         lda ($ea,s),y
$0e:cf55  ab            plb
$0e:cf56  dd 29 f6      cmp $f629,x
$0e:cf59  ee ef a8      inc $a8ef
$0e:cf5c  b3 6e         lda ($6e,s),y
$0e:cf5e  ac d8 bb      ldy $bbd8
$0e:cf61  74 00         stz $00,x
$0e:cf63  7e 30 12      ror $1230,x
$0e:cf66  10 8f         bpl $cef7
$0e:cf68  c2 22         rep #$22
$0e:cf6a  48            pha
$0e:cf6b  3b            tsc
$0e:cf6c  57 ea         eor [$ea],y
$0e:cf6e  8b            phb
$0e:cf6f  0d 89 55      ora $5589
$0e:cf72  e9 11 b8      sbc #$b811
$0e:cf75  65 76         adc $76
$0e:cf77  1b            tcs
$0e:cf78  59 80 d7      eor $d780,y
$0e:cf7b  72 95         adc ($95)
$0e:cf7d  98            tya
$0e:cf7e  2c 03 e5      bit $e503
$0e:cf81  00 f4         brk #$f4
$0e:cf83  40            rti
$0e:cf84  3c 90 0f      bit $0f90,x
$0e:cf87  14 03         trb $03
$0e:cf89  cc 68 31      cpy $3168
$0e:cf8c  f8            sed
$0e:cf8d  40            rti
$0e:cf8e  e0 70 c8      cpx #$c870
$0e:cf91  64 4a         stz $4a
$0e:cf93  23 0d         and $0d,s
$0e:cf95  86 5a         stx $5a
$0e:cf97  ec 5b 6c      cpx $6c5b
$0e:cf9a  67 37         adc [$37]
$0e:cf9c  44 3f 28      mvp $28,$3f
$0e:cf9f  1c 02 1f      trb $1f02
$0e:cfa2  00 89         brk #$89
$0e:cfa4  c0 23 b0      cpy #$b023
$0e:cfa7  0b            phd
$0e:cfa8  fa            plx
$0e:cfa9  28            plp
$0e:cfaa  70 18         bvs $cfc4
$0e:cfac  09 05 03      ora #$0305
$0e:cfaf  a1 30         lda ($30,x)
$0e:cfb1  d2 56         cmp ($56)
$0e:cfb3  2b            pld
$0e:cfb4  16 0f         asl $0f,x
$0e:cfb6  02 e8         cop #$e8
$0e:cfb8  e8            inx
$0e:cfb9  10 0f         bpl $cfca
$0e:cfbb  84 03         sty $03
$0e:cfbd  f1 00         sbc ($00),y
$0e:cfbf  fe 29 05      inc $0529,x
$0e:cfc2  c2 8a         rep #$8a
$0e:cfc4  e6 c0         inc $c0
$0e:cfc6  40            rti
$0e:cfc7  29 10 4c      and #$4c10
$0e:cfca  a5 3b         lda $3b
$0e:cfcc  5b            tcd
$0e:cfcd  02 57         cop #$57
$0e:cfcf  37 31         and [$31],y
$0e:cfd1  c0 b9 3c      cpy #$3cb9
$0e:cfd4  dd b3 d1      cmp $d1b3,x
$0e:cfd7  ab            plb
$0e:cfd8  f6 55         inc $55,x
$0e:cfda  3e fb aa      rol $aafb,x
$0e:cfdd  de 97 bb      dec $bb97,x
$0e:cfe0  58            cli
$0e:cfe1  f7 79         sbc [$79],y
$0e:cfe3  bf fe 3f e7   lda $e73ffe,x
$0e:cfe7  c3 bf         cmp $bf,s
$0e:cfe9  f0 ff         beq $cfea
$0e:cfeb  fe 3d ff      inc $ff3d,x
$0e:cfee  cf bf fb f7   cmp $f7fbbf
$0e:cff2  ff 75 8c 92   sbc $928c75,x
$0e:cff6  29 82 98      and #$9882
$0e:cff9  4a            lsr a
$0e:cffa  66 12         ror $12
$0e:cffc  db            stp
$0e:cffd  a7 53         lda [$53]
$0e:cfff  91 24         sta ($24),y
$0e:d001  e9 50 7a      sbc #$7a50
$0e:d004  7b            tdc
$0e:d005  ad 87 ae      lda $ae87
$0e:d008  21 cf         and ($cf,x)
$0e:d00a  98            tya
$0e:d00b  71 e7         adc ($e7),y
$0e:d00d  18            clc
$0e:d00e  3b            tsc
$0e:d00f  c4 8e         cpy $8e
$0e:d011  f9 21 ff      sbc $ff21,y
$0e:d014  48            pha
$0e:d015  3f d4 07 70   and $7007d4,x
$0e:d019  41 30         eor ($30,x)
$0e:d01b  52 0b         eor ($0b)
$0e:d01d  cc a2 c3      cpy $c3a2
$0e:d020  30 c6         bmi $cfe8
$0e:d022  75 2f         adc $2f,x
$0e:d024  d3 02         cmp ($02,s),y
$0e:d026  d0 62         bne $d08a
$0e:d028  2a            rol a
$0e:d029  5d b9 00      eor $00b9,x
$0e:d02c  04 30         tsb $30
$0e:d02e  f7 0c         sbc [$0c],y
$0e:d030  38            sec
$0e:d031  18            clc
$0e:d032  2f 10 3f e4   and $e43f10
$0e:d036  8b            phb
$0e:d037  f8            sed
$0e:d038  09 0f dc      ora #$dc0f
$0e:d03b  82 9d b0      brl $80db
$0e:d03e  ec c0 36      cpx $36c0
$0e:d041  34 2b         bit $2b,x
$0e:d043  25 13         and $13
$0e:d045  b9 08 85      lda $8508,y
$0e:d048  e1 7a         sbc ($7a,x)
$0e:d04a  51 06         eor ($06),y
$0e:d04c  59 32 cb      eor $cb32,y
$0e:d04f  f7 00         sbc [$00],y
$0e:d051  fb            xce
$0e:d052  b2 07         lda ($07)
$0e:d054  de 46 09      dec $0946,x
$0e:d057  06 b6         asl $b6
$0e:d059  25 16         and $16
$0e:d05b  84 d5         sty $d5
$0e:d05d  a0 7a fe      ldy #$fe7a
$0e:d060  44 46 01      mvp $01,$46
$0e:d063  ca            dex
$0e:d064  a2 54 c7      ldx #$c754
$0e:d067  cf 77 65 0e   cmp $0e6577
$0e:d06b  fc 98 31      jsr ($3198,x)
$0e:d06e  4d dd 1f      eor $1fdd
$0e:d071  55 d9         eor $d9,x
$0e:d073  ca            dex
$0e:d074  eb            xba
$0e:d075  aa            tax
$0e:d076  91 59         sta ($59),y
$0e:d078  65 8f         adc $8f
$0e:d07a  6f c4 a5 da   adc $daa5c4
$0e:d07e  70 50         bvs $d0d0
$0e:d080  0b            phd
$0e:d081  fc 42 ff      jsr ($ff42,x)
$0e:d084  02 9f         cop #$9f
$0e:d086  e0 e7 fc      cpx #$fce7
$0e:d089  38            sec
$0e:d08a  ff 02 1f f0   sbc $f01f02,x
$0e:d08e  14 83         trb $83
$0e:d090  18            clc
$0e:d091  35 d3         and $d3,x
$0e:d093  3c cd 73      bit $73cd,x
$0e:d096  9b            txy
$0e:d097  a3 fb         lda $fb,s
$0e:d099  6e 35 de      ror $de35
$0e:d09c  9d 75 42      sta $4275,x
$0e:d09f  f9 a7 b8      sbc $b8a7,y
$0e:d0a2  5c ff f6 6f   jml $6ff6ff
$0e:d0a6  fc cb ff      jsr ($ffcb,x)
$0e:d0a9  18            clc
$0e:d0aa  ff 54 54 c1   sbc $c15454,x
$0e:d0ae  fc c1 fe      jsr ($fec1,x)
$0e:d0b1  21 fe         and ($fe,x)
$0e:d0b3  08            php
$0e:d0b4  34 e2         bit $e2,x
$0e:d0b6  fb            xce
$0e:d0b7  1e b1 c4      asl $c4b1,x
$0e:d0ba  f0 b3         beq $d06f
$0e:d0bc  19 4c 67      ora $674c,y
$0e:d0bf  55 1b         eor $1b,x
$0e:d0c1  d3 45         cmp ($45,s),y
$0e:d0c3  e4 b9         cpx $b9
$0e:d0c5  63 11         adc $11,s
$0e:d0c7  43 3f         eor $3f,s
$0e:d0c9  f0 ef         beq $d0ba
$0e:d0cb  fc 1b ff      jsr ($ff1b,x)
$0e:d0ce  04 ff         tsb $ff
$0e:d0d0  c2 19         rep #$19
$0e:d0d2  43 56         eor $56,s
$0e:d0d4  90 d6         bcc $d0ac
$0e:d0d6  64 da         stz $da
$0e:d0d8  78            sei
$0e:d0d9  94 6b         sty $6b,x
$0e:d0db  43 21         eor $21,s
$0e:d0dd  cc 5d 33      cpy $335d
$0e:d0e0  19 59 c5      ora $c559,y
$0e:d0e3  3a            dec a
$0e:d0e4  50 62         bvc $d148
$0e:d0e6  37 03         and [$03],y
$0e:d0e8  8f 83 c9 38   sta $38c983
$0e:d0ec  8c 58 2f      sty $2f58
$0e:d0ef  b1 08         lda ($08),y
$0e:d0f1  9c a3 1d      stz $1da3
$0e:d0f4  21 f0         and ($f0,x)
$0e:d0f6  cd a2 d6      cmp $d6a2
$0e:d0f9  da            phx
$0e:d0fa  2c 99 ce      bit $ce99
$0e:d0fd  c3 e4         cmp $e4,s
$0e:d0ff  65 85         adc $85
$0e:d101  ef a9 8e 88   sbc $888ea9
$0e:d105  4a            lsr a
$0e:d106  b6 11         ldx $11,y
$0e:d108  1d 05 6b      ora $6b05,x
$0e:d10b  c3 b5         cmp $b5,s
$0e:d10d  e1 69         sbc ($69,x)
$0e:d10f  b8            clv
$0e:d110  54 0c 2c      mvn $2c,$0c
$0e:d113  83 ff         sta $ff,s
$0e:d115  60            rts
$0e:d116  ff d0 04 42   sbc $4204d0,x
$0e:d11a  df 48 17 ff   cmp $ff1748,x
$0e:d11e  77 7b         adc [$7b],y
$0e:d120  ab            plb
$0e:d121  72 26         adc ($26)
$0e:d123  f8            sed
$0e:d124  08            php
$0e:d125  f6 06         inc $06,x
$0e:d127  fd c0 9a      sbc $9ac0,x
$0e:d12a  e2 2a         sep #$2a
$0e:d12c  9c 39 b6      stz $b639
$0e:d12f  da            phx
$0e:d130  09 00         ora #$00
$0e:d132  9f 9f c0 84   sta $84c09f,x
$0e:d136  24 12         bit $12
$0e:d138  20 85 26      jsr $2685
$0e:d13b  01 eb         ora ($eb,x)
$0e:d13d  f5 e5         sbc $e5,x
$0e:d13f  60            rts
$0e:d140  3d e9 07      and $07e9,x
$0e:d143  72 05         adc ($05)
$0e:d145  f4 85 7e      pea $7e85
$0e:d148  a0 d4 c9      ldy #$c9d4
$0e:d14b  f4 46 23      pea $2346
$0e:d14e  14 80         trb $80
$0e:d150  7f 9b f3 ee   adc $eef39b,x
$0e:d154  80 57         bra $d1ad
$0e:d156  fb            xce
$0e:d157  f2 8c         sbc ($8c)
$0e:d159  46 d7         lsr $d7
$0e:d15b  81 da         sta ($da,x)
$0e:d15d  d2 d8         cmp ($d8)
$0e:d15f  37 fe         and [$fe],y
$0e:d161  29 fe         and #$fe
$0e:d163  5e 95 5d      lsr $5d95,x
$0e:d166  d1 77         cmp ($77),y
$0e:d168  f4 18 8f      pea $8f18
$0e:d16b  bf 03 fe 83   lda $83fe03,x
$0e:d16f  2e af ab      rol $abaf
$0e:d172  d1 a2         cmp ($a2),y
$0e:d174  c1 60         cmp ($60,x)
$0e:d176  3b            tsc
$0e:d177  fd fd 46      sbc $46fd,x
$0e:d17a  22 eb 00 cd   jsl $cd00eb
$0e:d17e  59 43 e1      eor $e143,y
$0e:d181  62 ff e5      per $b783
$0e:d184  f9 47 d1      sbc $d147,y
$0e:d187  90 62         bcc $d1eb
$0e:d189  2e ef f4      rol $f4ef
$0e:d18c  8a            txa
$0e:d18d  fa            plx
$0e:d18e  ad 08 c0      lda $c008
$0e:d191  80 7e         bra $d211
$0e:d193  e4 14         cpx $14
$0e:d195  dd 97 5a      cmp $5a97,x
$0e:d198  13 a6         ora ($a6,s),y
$0e:d19a  ad d6 ac      lda $acd6
$0e:d19d  7e a8 64      ror $64a8,x
$0e:d1a0  ff 41 df 88   sbc $88df41,x
$0e:d1a4  38            sec
$0e:d1a5  1b            tcs
$0e:d1a6  f9 00 f8      sbc $f800,y
$0e:d1a9  40            rti
$0e:d1aa  f8            sed
$0e:d1ab  10 0d         bpl $d1ba
$0e:d1ad  84 c1         sty $c1
$0e:d1af  5e db 7c      lsr $7cdb,x
$0e:d1b2  07 8e         ora [$8e]
$0e:d1b4  e1 ec         sbc ($ec,x)
$0e:d1b6  82 98 60      brl $3251
$0e:d1b9  86 14         stx $14
$0e:d1bb  fa            plx
$0e:d1bc  04 0e         tsb $0e
$0e:d1be  31 01         and ($01),y
$0e:d1c0  80 5e         bra $d220
$0e:d1c2  bc 38 9a      ldy $9a38,x
$0e:d1c5  86 aa         stx $aa
$0e:d1c7  e3 4f         sbc $4f,s
$0e:d1c9  e8            inx
$0e:d1ca  d5 79         cmp $79,x
$0e:d1cc  72 6e         adc ($6e)
$0e:d1ce  9d 07 a5      sta $a507,x
$0e:d1d1  ba            tsx
$0e:d1d2  d8            cld
$0e:d1d3  0a            asl a
$0e:d1d4  c0 3e 0f      cpy #$0f3e
$0e:d1d7  f2 02         sbc ($02)
$0e:d1d9  a0 8c 35      ldy #$358c
$0e:d1dc  3d 28 46      and $4628,x
$0e:d1df  8a            txa
$0e:d1e0  e7 20         sbc [$20]
$0e:d1e2  b0 4c         bcs $d230
$0e:d1e4  65 77         adc $77
$0e:d1e6  1b            tcs
$0e:d1e7  d4 c2         pei ($c2)
$0e:d1e9  b7 01         lda [$01],y
$0e:d1eb  c4 54         cpy $54
$0e:d1ed  dc 82 20      jml [$2082]
$0e:d1f0  58            cli
$0e:d1f1  08            php
$0e:d1f2  10 ed         bpl $d1e1
$0e:d1f4  3b            tsc
$0e:d1f5  dc 05 02      jml [$0205]
$0e:d1f8  6d 80 92      adc $9280
$0e:d1fb  62 f3 37      per $09f1
$0e:d1fe  b9 74 06      lda $0674,y
$0e:d201  25 00         and $00
$0e:d203  a9 cb         lda #$cb
$0e:d205  20 5f f9      jsr $f95f
$0e:d208  ff fe fe 42   sbc $42fefe,x
$0e:d20c  18            clc
$0e:d20d  20 81 76      jsr $7681
$0e:d210  5f c8 94 4f   eor $4f94c8,x
$0e:d214  8d 07 dc      sta $dc07
$0e:d217  c6 b1         dec $b1
$0e:d219  1f 0d 04 02   ora $02040d,x
$0e:d21d  81 00         sta ($00,x)
$0e:d21f  dc 16 c3      jml [$c316]
$0e:d222  ff ec ff fe   sbc $feffec,x
$0e:d226  3f fe 41 03   and $0341fe,x
$0e:d22a  d5 bb         cmp $bb,x
$0e:d22c  da            phx
$0e:d22d  ac 45 aa      ldy $aa45
$0e:d230  0b            phd
$0e:d231  94 b7         sty $b7,x
$0e:d233  c8            iny
$0e:d234  ff df 6b 7e   sbc $7e6bdf,x
$0e:d238  ae cf 56      ldx $56cf
$0e:d23b  91 c8         sta ($c8),y
$0e:d23d  60            rts
$0e:d23e  0a            asl a
$0e:d23f  25 0f         and $0f
$0e:d241  ae 6b ff      ldx $ff6b
$0e:d244  63 b1         adc $b1,s
$0e:d246  ed a0 1e      sbc $1ea0
$0e:d249  b8            clv
$0e:d24a  a5 67         lda $67
$0e:d24c  6d 97 bd      adc $bd97
$0e:d24f  7a            ply
$0e:d250  67 71         adc [$71]
$0e:d252  a9 8c         lda #$8c
$0e:d254  02 01         cop #$01
$0e:d256  9c 41 56      stz $5641
$0e:d259  03 55         ora $55,s
$0e:d25b  1c a9 43      trb $43a9
$0e:d25e  22 b0 88 cc   jsl $cc88b0
$0e:d262  03 15         ora $15,s
$0e:d264  01 ea         ora ($ea,x)
$0e:d266  c0 e6 d0      cpy #$d0e6
$0e:d269  19 5c 41      ora $415c,y
$0e:d26c  05 6e         ora $6e
$0e:d26e  11 d1         ora ($d1),y
$0e:d270  59 32 34      eor $3432,y
$0e:d273  4a            lsr a
$0e:d274  c7 3a         cmp [$3a]
$0e:d276  0d 84 d4      ora $d484
$0e:d279  63 2c         adc $2c,s
$0e:d27b  bc 88 87      ldy $8788,x
$0e:d27e  62 95 d0      per $a316
$0e:d281  8c 7f e7      sty $e77f
$0e:d284  1f f9 87 fe   ora $fe87f9,x
$0e:d288  f1 ff         sbc ($ff),y
$0e:d28a  b8            clv
$0e:d28b  38            sec
$0e:d28c  84 0a         sty $0a
$0e:d28e  52 fa         eor ($fa)
$0e:d290  25 67         and $67
$0e:d292  09 b6         ora #$b6
$0e:d294  e0 52 74      cpx #$7452
$0e:d297  9e ea 24      stz $24ea,x
$0e:d29a  46 95         lsr $95
$0e:d29c  47 87         eor [$87]
$0e:d29e  42 60         wdm #$60
$0e:d2a0  90 0b         bcc $d2ad
$0e:d2a2  f8            sed
$0e:d2a3  7d 88 e3      adc $e388,x
$0e:d2a6  7f 81 5f ea   adc $ea5f81,x
$0e:d2aa  5e db ad      lsr $addb,x
$0e:d2ad  2f 55 df 95   and $95df55
$0e:d2b1  77 2e         adc [$2e],y
$0e:d2b3  d9 4a ee      cmp $ee4a,y
$0e:d2b6  db            stp
$0e:d2b7  d5 23         cmp $23,x
$0e:d2b9  b6 eb         ldx $eb,y
$0e:d2bb  8b            phb
$0e:d2bc  e1 80         sbc ($80,x)
$0e:d2be  25 17         and $17
$0e:d2c0  fa            plx
$0e:d2c1  10 26         bpl $d2e9
$0e:d2c3  0f fc 73 ff   ora $ff73fc
$0e:d2c7  10 ff         bpl $d2c8
$0e:d2c9  cb            wai
$0e:d2ca  7d b9 fb      adc $fbb9,x
$0e:d2cd  fe 4e b1      inc $b14e,x
$0e:d2d0  b7 bf         lda [$bf],y
$0e:d2d2  f6 ee         inc $ee,x
$0e:d2d4  f9 9b bc      sbc $bc9b,y
$0e:d2d7  ab            plb
$0e:d2d8  e1 24         sbc ($24,x)
$0e:d2da  a9 c4         lda #$c4
$0e:d2dc  93 e1         sta ($e1,s),y
$0e:d2de  00 93         brk #$93
$0e:d2e0  90 04         bcc $d2e6
$0e:d2e2  88            dey
$0e:d2e3  70 78         bvs $d35d
$0e:d2e5  06 3e         asl $3e
$0e:d2e7  e9 fc         sbc #$fc
$0e:d2e9  ed 7e a9      sbc $a97e
$0e:d2ec  f2 fb         sbc ($fb)
$0e:d2ee  b7 ba         lda [$ba],y
$0e:d2f0  dd 6e ad      cmp $ad6e,x
$0e:d2f3  ff e4 95 ee   sbc $ee95e4,x
$0e:d2f7  6c 42 07      jmp ($0742)
$0e:d2fa  00 82         brk #$82
$0e:d2fc  c0 3e 10      cpy #$103e
$0e:d2ff  08            php
$0e:d300  8c 03 22      sty $2203
$0e:d303  44 2c 0c      mvp $0c,$2c
$0e:d306  03 c7         ora $c7,s
$0e:d308  cb            wai
$0e:d309  9a            txs
$0e:d30a  54 77 d9      mvn $d9,$77
$0e:d30d  5f f7 f3 7f   eor $7ff3f7,x
$0e:d311  6e d7 ea      ror $ead7
$0e:d314  ed 7c 3a      sbc $3a7c
$0e:d317  1f 47 83 80   ora $808347,x
$0e:d31b  3f 8f 01 06   and $06018f,x
$0e:d31f  3d 0e 07      and $070e,x
$0e:d322  53 81         eor ($81,s),y
$0e:d324  bc c0 6f      ldy $6fc0,x
$0e:d327  b0 1f         bcs $d348
$0e:d329  b8            clv
$0e:d32a  25 4f         and $4f
$0e:d32c  59 15 f7      eor $f715,y
$0e:d32f  61 3f         adc ($3f,x)
$0e:d331  fa            plx
$0e:d332  ef ff ab f7   sbc $f7abff
$0e:d336  59 ac c4      eor $c4ac,y
$0e:d339  4c a0 9f      jmp $9fa0
$0e:d33c  77 f0         adc [$f0],y
$0e:d33e  69 a0         adc #$a0
$0e:d340  1e e8 05      asl $05e8,x
$0e:d343  ee 41 cd      inc $cd41
$0e:d346  d9 65 a1      cmp $a165,y
$0e:d349  3f 6a 5f 6e   and $6e5f6a,x
$0e:d34d  01 c3         ora ($c3,x)
$0e:d34f  a2 7a a1      ldx #$a17a
$0e:d352  1f c0 28 80   ora $8028c0,x
$0e:d356  00 00         brk #$00
$0e:d358  13 f6         ora ($f6,s),y
$0e:d35a  20 df ec      jsr $ecdf
$0e:d35d  10 72         bpl $d3d1
$0e:d35f  f0 d6         beq $d337
$0e:d361  e8            inx
$0e:d362  1b            tcs
$0e:d363  58            cli
$0e:d364  97 ea         sta [$ea],y
$0e:d366  03 bc         ora $bc,s
$0e:d368  c0 fa e0      cpy #$e0fa
$0e:d36b  d7 a8         cmp [$a8],y
$0e:d36d  67 fa         adc [$fa]
$0e:d36f  01 df         ora ($df,x)
$0e:d371  88            dey
$0e:d372  ef e0 10 f6   sbc $f610e0
$0e:d376  50 40         bvc $d3b8
$0e:d378  20 7c 08      jsr $087c
$0e:d37b  ec 73 03      cpx $0373
$0e:d37e  8e 80 c0      stx $c080
$0e:d381  26 13         rol $13
$0e:d383  0d 16 e2      ora $e216
$0e:d386  5b            tcd
$0e:d387  b8            clv
$0e:d388  b6 ec         ldx $ec,y
$0e:d38a  3d 5b 1c      and $1c5b,x
$0e:d38d  5e 43 3d      lsr $3d43,x
$0e:d390  91 e6         sta ($e6),y
$0e:d392  e4 b6         cpx $b6
$0e:d394  9a            txs
$0e:d395  3a            dec a
$0e:d396  07 fd         ora [$fd]
$0e:d398  fe 96 00      inc $0096,x
$0e:d39b  31 bf         and ($bf),y
$0e:d39d  c3 d5         cmp $d5,s
$0e:d39f  71 cd         adc ($cd),y
$0e:d3a1  d4 20         pei ($20)
$0e:d3a3  5d 9a 7f      eor $7f9a,x
$0e:d3a6  47 bb         eor [$bb]
$0e:d3a8  c3 b3         cmp $b3,s
$0e:d3aa  74 ea         stz $ea,x
$0e:d3ac  7d 09 56      adc $5609,x
$0e:d3af  c1 7c         cmp ($7c,x)
$0e:d3b1  12 01         ora ($01)
$0e:d3b3  04 bf         tsb $bf
$0e:d3b5  c2 cf         rep #$cf
$0e:d3b7  67 9b         adc [$9b]
$0e:d3b9  e0 35 17      cpx #$1735
$0e:d3bc  bb            tyx
$0e:d3bd  6c 4a 11      jmp ($114a)
$0e:d3c0  00 a5         brk #$a5
$0e:d3c2  4f 65 36 98   eor $983665
$0e:d3c6  34 a6         bit $a6,x
$0e:d3c8  31 ff         and ($ff),y
$0e:d3ca  bf ff e0 8b   lda $8be0ff,x
$0e:d3ce  f0 22         beq $d3f2
$0e:d3d0  1c 58 88      trb $8858
$0e:d3d3  36 0b         rol $0b,x
$0e:d3d5  f5 22         sbc $22,x
$0e:d3d7  19 ac f8      ora $f8ac,y
$0e:d3da  68            pla
$0e:d3db  28            plp
$0e:d3dc  11 08         ora ($08),y
$0e:d3de  05 9b         ora $9b
$0e:d3e0  31 b0         and ($b0),y
$0e:d3e2  f0 60         beq $d444
$0e:d3e4  20 18 0f      jsr $0f18
$0e:d3e7  ff c0 88 a4   sbc $a488c0,x
$0e:d3eb  54 ac 74      mvn $74,$ac
$0e:d3ee  39 15 5d      and $5d15,y
$0e:d3f1  55 de         eor $de,x
$0e:d3f3  db            stp
$0e:d3f4  b3 ea         lda ($ea,s),y
$0e:d3f6  ea            nop
$0e:d3f7  f0 5e         beq $d457
$0e:d3f9  98            tya
$0e:d3fa  57 67         eor [$67],y
$0e:d3fc  43 08         eor $08,s
$0e:d3fe  93 fe         sta ($fe,s),y
$0e:d400  e4 46         cpx $46
$0e:d402  2b            pld
$0e:d403  c9 61         cmp #$61
$0e:d405  b1 3c         lda ($3c),y
$0e:d407  d8            cld
$0e:d408  9f 7e c5 bf   sta $bfc57e,x
$0e:d40c  b5 6d         lda $6d,x
$0e:d40e  f8            sed
$0e:d40f  b2 ab         lda ($ab)
$0e:d411  d4 36         pei ($36)
$0e:d413  6d 49 bc      adc $bc49
$0e:d416  ef e6 42 a1   sbc $a142e6
$0e:d41a  31 c6         and ($c6),y
$0e:d41c  26 61         rol $61
$0e:d41e  55 9c         eor $9c,x
$0e:d420  50 25         bvc $d447
$0e:d422  96 a9         stx $a9,y
$0e:d424  66 c2         ror $c2
$0e:d426  ed ad b3      sbc $b3ad
$0e:d429  52 74         eor ($74)
$0e:d42b  5d a9 9c      eor $9ca9,x
$0e:d42e  00 88         brk #$88
$0e:d430  31 06         and ($06),y
$0e:d432  10 c2         bpl $d3f6
$0e:d434  3f e3 f0 8e   and $8ef0e3,x
$0e:d438  7f e1 9f f9   adc $f99fe1,x
$0e:d43c  36 c2         rol $c2,x
$0e:d43e  65 a4         adc $a4
$0e:d440  e8            inx
$0e:d441  d9 b4 d4      cmp $d4b4,y
$0e:d444  3d a5 0e      and $0ea5,x
$0e:d447  a7 01         lda [$01]
$0e:d449  a5 44         lda $44
$0e:d44b  75 31         adc $31,x
$0e:d44d  07 f9         ora [$f9]
$0e:d44f  2f c9 c6 d1   and $d1c6c9
$0e:d453  28            plp
$0e:d454  3d 12 27      and $2712,x
$0e:d457  3b            tsc
$0e:d458  88            dey
$0e:d459  c2 a3         rep #$a3
$0e:d45b  31 58         and ($58),y
$0e:d45d  44 d2 11      mvp $11,$d2
$0e:d460  48            pha
$0e:d461  92 79         sta ($79)
$0e:d463  29 30 0b      and #$0b30
$0e:d466  fb            xce
$0e:d467  fc 67 e0      jsr ($e067,x)
$0e:d46a  31 00         and ($00),y
$0e:d46c  10 00         bpl $d46e
$0e:d46e  1d c1 dc      ora $dcc1,x
$0e:d471  f7 5c         sbc [$5c],y
$0e:d473  32 97         and ($97)
$0e:d475  8e 64 a2      stx $a264
$0e:d478  ed a8 8a      sbc $8aa8
$0e:d47b  76 bd         ror $bd,x
$0e:d47d  77 6d         adc [$6d],y
$0e:d47f  fd 9a 41      sbc $419a,x
$0e:d482  fe 80 08      inc $0880,x
$0e:d485  03 f9         ora $f9,s
$0e:d487  10 12         bpl $d49b
$0e:d489  07 f8         ora [$f8]
$0e:d48b  3e 24 41      rol $4124,x
$0e:d48e  8a            txa
$0e:d48f  77 f8         adc [$f8],y
$0e:d491  7d 08 ee      adc $ee08,x
$0e:d494  02 cb         cop #$cb
$0e:d496  da            phx
$0e:d497  93 64         sta ($64,s),y
$0e:d499  7b            tdc
$0e:d49a  b5 dc         lda $dc,x
$0e:d49c  2d de 65      and $65de
$0e:d49f  4d 90 40      eor $4090
$0e:d4a2  25 fe         and $fe
$0e:d4a4  fb            xce
$0e:d4a5  ff fe 7f ff   sbc $ff7ffe,x
$0e:d4a9  21 82         and ($82,x)
$0e:d4ab  04 18         tsb $18
$0e:d4ad  e0 c1 0a      cpx #$0ac1
$0e:d4b0  87 fe         sta [$fe]
$0e:d4b2  47 1b         eor [$1b]
$0e:d4b4  92 76         sta ($76)
$0e:d4b6  71 17         adc ($17),y
$0e:d4b8  5a            phy
$0e:d4b9  be ae 95      ldx $95ae,y
$0e:d4bc  03 d6         ora $d6,s
$0e:d4be  ff ad 79 48   sbc $4879ad,x
$0e:d4c2  04 03         tsb $03
$0e:d4c4  c9 e7 ff      cmp #$ffe7
$0e:d4c7  7f cc 61 fc   adc $fc61cc,x
$0e:d4cb  33 0a         and ($0a,s),y
$0e:d4cd  fc a6 98      jsr ($98a6,x)
$0e:d4d0  0d 67 43      ora $4367
$0e:d4d3  55 d4         eor $d4,x
$0e:d4d5  e5 ed         sbc $ed
$0e:d4d7  2a            rol a
$0e:d4d8  3a            dec a
$0e:d4d9  ed ad 2b      sbc $2bad
$0e:d4dc  79 43 b7      adc $b743,y
$0e:d4df  64 7f         stz $7f
$0e:d4e1  f8            sed
$0e:d4e2  0f ff 01 02   ora $0201ff
$0e:d4e6  5e fe 07      lsr $07fe,x
$0e:d4e9  2f 81 c3 c0   and $c0c381
$0e:d4ed  60            rts
$0e:d4ee  70 10         bvs $d500
$0e:d4f0  48            pha
$0e:d4f1  06 9a         asl $9a
$0e:d4f3  01 ee         ora ($ee,x)
$0e:d4f5  80 76         bra $d56d
$0e:d4f7  e4 87         cpx $87
$0e:d4f9  70 88         bvs $d483
$0e:d4fb  fb            xce
$0e:d4fc  b4 95         ldy $95,x
$0e:d4fe  bf 74 45 c5   lda $c54574,x
$0e:d502  55 b8         eor $b8,x
$0e:d504  04 46         tsb $46
$0e:d506  01 7b         ora ($7b,x)
$0e:d508  90 63         bcc $d56d
$0e:d50a  66 5f         ror $5f
$0e:d50c  6a            ror a
$0e:d50d  4f 1a 37 db   eor $db371a
$0e:d511  80 78         bra $d58b
$0e:d513  ea            nop
$0e:d514  9b            txy
$0e:d515  48            pha
$0e:d516  75 b6         adc $b6,x
$0e:d518  04 4c         tsb $4c
$0e:d51a  00 60         brk #$60
$0e:d51c  01 08         ora ($08,x)
$0e:d51e  08            php
$0e:d51f  84 c0         sty $c0
$0e:d521  fd c8 29      sbc $29c8,x
$0e:d524  bb            tyx
$0e:d525  2e b4 27      rol $27b4
$0e:d528  4d 5b ad      eor $ad5b
$0e:d52b  d8            cld
$0e:d52c  3d 70 c9      and $c970,x
$0e:d52f  d4 8b         pei ($8b)
$0e:d531  bd 90 4f      lda $4f90,x
$0e:d534  c7 de         cmp [$de]
$0e:d536  01 c5         ora ($c5,x)
$0e:d538  80 4c         bra $d586
$0e:d53a  66 11         ror $11
$0e:d53c  d9 15 b6      cmp $b615,y
$0e:d53f  7b            tdc
$0e:d540  77 2f         adc [$2f],y
$0e:d542  84 02         sty $02
$0e:d544  ab            plb
$0e:d545  aa            tax
$0e:d546  ce d7 62      dec $62d7
$0e:d549  98            tya
$0e:d54a  0b            phd
$0e:d54b  26 2d         rol $2d
$0e:d54d  50 0b         bvc $d55a
$0e:d54f  e1 51         sbc ($51,x)
$0e:d551  99 24 08      sta $0824,y
$0e:d554  60            rts
$0e:d555  43 0f         eor $0f,s
$0e:d557  04 03         tsb $03
$0e:d559  41 f8         eor ($f8,x)
$0e:d55b  e8            inx
$0e:d55c  3d 06 61      and $6106,x
$0e:d55f  c0 c6 7c      cpy #$7cc6
$0e:d562  22 71 cd 2c   jsl $2ccd71
$0e:d566  19 41 20      ora $2041,y
$0e:d569  e0 ff fe      cpx #$feff
$0e:d56c  3f fb 68 4f   and $4f68fb,x
$0e:d570  26 27         rol $27
$0e:d572  e6 cc         inc $cc
$0e:d574  ca            dex
$0e:d575  fb            xce
$0e:d576  94 1b         sty $1b,x
$0e:d578  a5 96         lda $96
$0e:d57a  39 60 9b      and $9b60,y
$0e:d57d  44 67 0a      mvp $0a,$67
$0e:d580  80 c0         bra $d542
$0e:d582  32 c2         and ($c2)
$0e:d584  ff 80 9f c2   sbc $c29f80,x
$0e:d588  27 f6         and [$f6]
$0e:d58a  08            php
$0e:d58b  fc 02 3f      jsr ($3f02,x)
$0e:d58e  20 87 f6      jsr $f687
$0e:d591  b7 f0         lda [$f0],y
$0e:d593  9b            txy
$0e:d594  d4 fe         pei ($fe)
$0e:d596  bd 14 95      lda $9514,x
$0e:d599  3d 04 ae      and $ae04,x
$0e:d59c  97 fc         sta [$fc],y
$0e:d59e  2c fa c1      bit $c1fa
$0e:d5a1  0c 86 15      tsb $1586
$0e:d5a4  de b1 d7      dec $d7b1,x
$0e:d5a7  93 ff         sta ($ff,s),y
$0e:d5a9  2e 11 c9      rol $c911
$0e:d5ac  25 40         and $40
$0e:d5ae  ae d2 0f      ldx $0fd2
$0e:d5b1  f4 0a f1      pea $f10a
$0e:d5b4  ea            nop
$0e:d5b5  80 53         bra $d60a
$0e:d5b7  0a            asl a
$0e:d5b8  ef 52 f6 dd   sbc $ddf652
$0e:d5bc  29 7a be      and #$be7a
$0e:d5bf  f4 ab bb      pea $bbab
$0e:d5c2  77 cb         adc [$cb],y
$0e:d5c4  57 b5         eor [$b5],y
$0e:d5c6  1e 49 75      asl $7549,x
$0e:d5c9  d3 70         cmp ($70,s),y
$0e:d5cb  3f 1f f4 07   and $07f41f,x
$0e:d5cf  fd 03 fe      sbc $fe03,x
$0e:d5d2  42 3f         wdm #$3f
$0e:d5d4  91 6f         sta ($6f),y
$0e:d5d6  c4 4b         cpy $4b
$0e:d5d8  f1 04         sbc ($04),y
$0e:d5da  f8            sed
$0e:d5db  55 26         eor $26,x
$0e:d5dd  32 6a         and ($6a)
$0e:d5df  9f 22 f3 be   sta $bef322,x
$0e:d5e3  95 e6         sta $e6,x
$0e:d5e5  bd 77 1c      lda $1c77,x
$0e:d5e8  56 76         lsr $76,x
$0e:d5ea  0d 7a 82      ora $827a
$0e:d5ed  43 bf         eor $bf,s
$0e:d5ef  f0 cf         beq $d5c0
$0e:d5f1  fc 1b ff      jsr ($ff1b,x)
$0e:d5f4  44 ff c1      mvp $c1,$ff
$0e:d5f7  18            clc
$0e:d5f8  c2 05         rep #$05
$0e:d5fa  2c a4 e3      bit $e3a4
$0e:d5fd  b5 3c         lda $3c,x
$0e:d5ff  f6 cb         inc $cb,x
$0e:d601  b4 36         ldy $36,x
$0e:d603  ec b5 66      cpx $66b5
$0e:d606  35 50         and $50,x
$0e:d608  96 5c         stx $5c,y
$0e:d60a  2f 32 00 29   and $290032
$0e:d60e  44 1c 43      mvp $43,$1c
$0e:d611  20 73 08      jsr $0873
$0e:d614  14 a6         trb $a6
$0e:d616  bc be b6      ldy $b6be,x
$0e:d619  06 d5         asl $d5
$0e:d61b  91 95         sta ($95),y
$0e:d61d  d4 07         pei ($07)
$0e:d61f  a1 45         lda ($45,x)
$0e:d621  94 4a         sty $4a,x
$0e:d623  2d 94 99      and $9994
$0e:d626  e0 7d ef      cpx #$ef7d
$0e:d629  f1 00         sbc ($00),y
$0e:d62b  40            rti
$0e:d62c  b7 c2         lda [$c2],y
$0e:d62e  15 d7         ora $d7,x
$0e:d630  b2 6e         lda ($6e)
$0e:d632  b2 56         lda ($56)
$0e:d634  eb            xba
$0e:d635  66 db         ror $db
$0e:d637  11 55         ora ($55),y
$0e:d639  bb            tyx
$0e:d63a  f6 e3         inc $e3,x
$0e:d63c  b9 3b 76      lda $763b,y
$0e:d63f  c5 d2         cmp $d2
$0e:d641  3f e1 08 ff   and $ff08e1,x
$0e:d645  e4 4e         cpx $4e
$0e:d647  61 b0         adc ($b0,x)
$0e:d649  7f e8 1f ff   adc $ff1fe8,x
$0e:d64d  64 7b         stz $7b
$0e:d64f  55 60         eor $60,x
$0e:d651  8a            txa
$0e:d652  c2 39         rep #$39
$0e:d654  97 29         sta [$29],y
$0e:d656  16 17         asl $17,x
$0e:d658  99 5c dd      sta $dd5c,y
$0e:d65b  d1 10         cmp ($10),y
$0e:d65d  a1 01         lda ($01,x)
$0e:d65f  ff c7 ff f7   sbc $f7ffc7,x
$0e:d663  ff fc fc 84   sbc $84fcfc,x
$0e:d667  32 36         and ($36)
$0e:d669  51 ec         eor ($ec),y
$0e:d66b  bf 96 99 55   lda $559996,x
$0e:d66f  5b            tcd
$0e:d670  4f 2a e5 ea   eor $eae52a
$0e:d674  24 3d         bit $3d
$0e:d676  be f5 be      ldx $bef5,y
$0e:d679  21 80         and ($80,x)
$0e:d67b  46 87         lsr $87
$0e:d67d  ff a9 ff fc   sbc $fcffa9,x
$0e:d681  7f fe 9f fe   adc $fe9ffe,x
$0e:d685  f3 a1         sbc ($a1,s),y
$0e:d687  76 94         ror $94,x
$0e:d689  ba            tsx
$0e:d68a  4f ff ed f6   eor $f6edff
$0e:d68e  92 49         sta ($49)
$0e:d690  29 70 0e      and #$0e70
$0e:d693  b4 a6         ldy $a6,x
$0e:d695  93 b6         sta ($b6,s),y
$0e:d697  ff d2 4b c0   sbc $c04bd2,x
$0e:d69b  5e 08 4c      lsr $4c08,x
$0e:d69e  03 b6         ora $b6,s
$0e:d6a0  ff 3d b4 00   sbc $00b43d,x
$0e:d6a4  fc 06 f8      jsr ($f806,x)
$0e:d6a7  db            stp
$0e:d6a8  52 4f         eor ($4f)
$0e:d6aa  63 59         adc $59,s
$0e:d6ac  3f e2 78 2f   and $2f78e2,x
$0e:d6b0  72 0c         adc ($0c)
$0e:d6b2  6c cb ed      jmp ($edcb)
$0e:d6b5  49 c3 66      eor #$66c3
$0e:d6b8  fd 72 0b      sbc $0b72,x
$0e:d6bb  9c 93 c9      stz $c993
$0e:d6be  0e e6 c0      asl $c0e6
$0e:d6c1  80 c3         bra $d686
$0e:d6c3  00 9f         brk #$9f
$0e:d6c5  b0 83         bcs $d64a
$0e:d6c7  81 1f         sta ($1f,x)
$0e:d6c9  80 67         bra $d732
$0e:d6cb  f0 0c         beq $d6d9
$0e:d6cd  70 9f         bvs $d66e
$0e:d6cf  c8            iny
$0e:d6d0  3d 70 0f      and $0f70,x
$0e:d6d3  ec 4b 4d      cpx $4d4b
$0e:d6d6  29 eb 42      and #$42eb
$0e:d6d9  d0 a1         bne $d67c
$0e:d6db  e3 aa         sbc $aa,s
$0e:d6dd  6d 21 d4      adc $d421
$0e:d6e0  d9 13 1c      cmp $1c13,y
$0e:d6e3  21 f0         and ($f0,x)
$0e:d6e5  0a            asl a
$0e:d6e6  fd 01 86      sbc $8601,x
$0e:d6e9  2c 21 60      bit $6021
$0e:d6ec  80 10         bra $d6fe
$0e:d6ee  33 37         and ($37,s),y
$0e:d6f0  b9 f4 06      lda $06f4,y
$0e:d6f3  b3 26         lda ($26,s),y
$0e:d6f5  dd df e4      cmp $e4df,x
$0e:d6f8  b8            clv
$0e:d6f9  0c a4 2f      tsb $2fa4
$0e:d6fc  13 7b         ora ($7b,s),y
$0e:d6fe  99 53 60      sta $6053,y
$0e:d701  86 a3         stx $a3
$0e:d703  53 05         eor ($05,s),y
$0e:d705  fc 84 2f      jsr ($2f84,x)
$0e:d708  f2 c4         sbc ($c4)
$0e:d70a  7c 34 10      jmp ($1034,x)
$0e:d70d  0d e5 03      ora $03e5
$0e:d710  6f f8 96 4b   adc $4b96f8
$0e:d714  ed 58 3d      sbc $3d58
$0e:d717  2f fa d7 94   and $94d7fa
$0e:d71b  00 a2         brk #$a2
$0e:d71d  98            tya
$0e:d71e  3a            dec a
$0e:d71f  1f ff e1 a8   ora $a8e1ff,x
$0e:d723  e0 b1 e8      cpx #$e8b1
$0e:d726  7c 1a 0f      jmp ($0f1a,x)
$0e:d729  01 80         ora ($80,x)
$0e:d72b  c0 e0 10      cpy #$10e0
$0e:d72e  13 f9         ora ($f9,s),y
$0e:d730  28            plp
$0e:d731  42 21         wdm #$21
$0e:d733  07 84         ora [$84]
$0e:d735  40            rti
$0e:d736  e0 50 18      cpx #$1850
$0e:d739  10 dd         bpl $d718
$0e:d73b  a0 11 2c      ldy #$2c11
$0e:d73e  3f 12 27 bb   and $bb2712,x
$0e:d742  a8            tay
$0e:d743  d2 b3         cmp ($b3)
$0e:d745  39 5b 45      and $455b,y
$0e:d748  93 31         sta ($31,s),y
$0e:d74a  30 8e         bmi $d6da
$0e:d74c  41 e1         eor ($e1,x)
$0e:d74e  41 f6         eor ($f6,x)
$0e:d750  c0 5f fc      cpy #$fc5f
$0e:d753  0c 70 83      tsb $8370
$0e:d756  c3 20         cmp $20,s
$0e:d758  3b            tsc
$0e:d759  7d 4f 73      adc $734f,x
$0e:d75c  d7 22         cmp [$22],y
$0e:d75e  ab            plb
$0e:d75f  eb            xba
$0e:d760  79 75 6d      adc $6d75,y
$0e:d763  ce 4e fd      dec $fd4e
$0e:d766  de 94 6c      dec $6c94,x
$0e:d769  29 14 00      and #$0014
$0e:d76c  61 7f         adc ($7f,x)
$0e:d76e  e2 00         sep #$00
$0e:d770  20 ff 40      jsr $40ff
$0e:d773  7f 11 4f 04   adc $044f11,x
$0e:d777  e3 01         sbc $01,s
$0e:d779  2c fc 74      bit $74fc
$0e:d77c  2d 11 0f      and $0f11
$0e:d77f  04 03         tsb $03
$0e:d781  c1 c0         cmp ($c0,x)
$0e:d783  26 06         rol $06
$0e:d785  00 94         brk #$94
$0e:d787  7f 08 c2 50   adc $50c208,x
$0e:d78b  38            sec
$0e:d78c  12 0c         ora ($0c)
$0e:d78e  02 68         cop #$68
$0e:d790  13 49         ora ($49,s),y
$0e:d792  2b            pld
$0e:d793  88            dey
$0e:d794  61 66         adc ($66,x)
$0e:d796  52 e9         eor ($e9)
$0e:d798  8c aa e7      sty $e7aa
$0e:d79b  d7 e6         cmp [$e6],y
$0e:d79d  48            pha
$0e:d79e  7a            ply
$0e:d79f  14 0e         trb $0e
$0e:d7a1  a6 eb         ldx $eb
$0e:d7a3  65 ef         adc $ef
$0e:d7a5  88            dey
$0e:d7a6  73 e6         adc ($e6,s),y
$0e:d7a8  1c 79 c6      trb $c679
$0e:d7ab  1e f1 23      asl $23f1,x
$0e:d7ae  63 07         adc $07,s
$0e:d7b0  f1 92         sbc ($92),y
$0e:d7b2  14 1f         trb $1f
$0e:d7b4  e4 2a         cpx $2a
$0e:d7b6  5f bd 87 48   eor $4887bd,x
$0e:d7ba  e4 b5         cpx $b5
$0e:d7bc  58            cli
$0e:d7bd  36 a7         rol $a7,x
$0e:d7bf  9d 17 86      sta $8617,x
$0e:d7c2  f1 e8         sbc ($e8),y
$0e:d7c4  55 d8         eor $d8,x
$0e:d7c6  ef c1 3e 10   sbc $103ec1
$0e:d7ca  0e c4 07      asl $07c4
$0e:d7cd  f1 00         sbc ($00),y
$0e:d7cf  b8            clv
$0e:d7d0  27 c2         and [$c2]
$0e:d7d2  03 bc         ora $bc,s
$0e:d7d4  80 78         bra $d84e
$0e:d7d6  a0 13 78      ldy #$7813
$0e:d7d9  66 22         ror $22
$0e:d7db  4d 16 84      eor $8416
$0e:d7de  43 23         eor $23,s
$0e:d7e0  11 18         ora ($18),y
$0e:d7e2  25 5e         and $5e
$0e:d7e4  19 28 a3      ora $a328,y
$0e:d7e7  54 ac 81      mvn $81,$ac
$0e:d7ea  f3 bf         sbc ($bf,s),y
$0e:d7ec  c0 27 f0      cpy #$f027
$0e:d7ef  80 20         bra $d811
$0e:d7f1  01 00         ora ($00,x)
$0e:d7f3  c0 3b 4d      cpy #$4d3b
$0e:d7f6  57 7b         eor [$7b],y
$0e:d7f8  d1 20         cmp ($20),y
$0e:d7fa  aa            tax
$0e:d7fb  6b            rtl
$0e:d7fc  39 15 4d      and $4d15,y
$0e:d7ff  d7 4a         cmp [$4a],y
$0e:d801  79 ed 9b      adc $9bed,y
$0e:d804  76 26         ror $26,x
$0e:d806  b4 0f         ldy $0f,x
$0e:d808  f2 1c         sbc ($1c)
$0e:d80a  31 1f         and ($1f),y
$0e:d80c  c8            iny
$0e:d80d  87 f1         sta [$f1]
$0e:d80f  0e 02 71      asl $7102
$0e:d812  ff c0 bf f8   sbc $f8bfc0,x
$0e:d816  9f fc ef db   sta $dbeffc,x
$0e:d81a  d7 b5         cmp [$b5],y
$0e:d81c  55 bd         eor $bd,x
$0e:d81e  32 9e         and ($9e)
$0e:d820  b4 d3         ldy $d3,x
$0e:d822  d3 55         cmp ($55,s),y
$0e:d824  d3 4a         cmp ($4a,s),y
$0e:d826  f9 9f f1      sbc $f19f,y
$0e:d829  f8            sed
$0e:d82a  7f 88 41 f9   adc $f94188,x
$0e:d82e  fc 7d fe      jsr ($fe7d,x)
$0e:d831  1e ee 06      asl $06ee,x
$0e:d834  e3 01         sbc $01,s
$0e:d836  f0 c0         beq $d7f8
$0e:d838  35 c3         and $c3,x
$0e:d83a  ad a7 f4      lda $f4a7
$0e:d83d  f4 7c d5      pea $d57c
$0e:d840  89 de 93      bit #$93de
$0e:d843  b9 93 97      lda $9793,y
$0e:d846  d3 3a         cmp ($3a,s),y
$0e:d848  fe 76 f8      inc $f876,x
$0e:d84b  6e 20 1d      ror $1d20
$0e:d84e  e8            inx
$0e:d84f  05 7f         ora $7f
$0e:d851  01 27         ora ($27,x)
$0e:d853  e0 44 fc      cpx #$fc44
$0e:d856  18            clc
$0e:d857  cf 86 1f f1   cmp $f11f86
$0e:d85b  5f ef ea 39   eor $39eaef,x
$0e:d85f  1f 5c 05 6b   ora $6b055c,x
$0e:d863  cb            wai
$0e:d864  20 ff ed      jsr $edff
$0e:d867  ef f0 ac 56   sbc $56acf0
$0e:d86b  96 4b         stx $4b,y
$0e:d86d  df d0 72 3e   cmp $3e72d0,x
$0e:d871  fc 0f fa      jsr ($fa0f,x)
$0e:d874  0d 3e a3      ora $a33e
$0e:d877  f0 ed         beq $d866
$0e:d879  74 fa         stz $fa,x
$0e:d87b  7a            ply
$0e:d87c  8c 05 d6      sty $d605
$0e:d87f  11 c2         ora ($c2),y
$0e:d881  9e cb 3f      stz $3fcb,x
$0e:d884  f5 7e         sbc $7e,x
$0e:d886  be 2b 15      ldx $152b,y
$0e:d889  3d 9e f4      and $f49e,x
$0e:d88c  e5 98         sbc $98
$0e:d88e  00 51         brk #$51
$0e:d890  8a            txa
$0e:d891  c2 51         rep #$51
$0e:d893  ff be fd ff   sbc $fffdbe,x
$0e:d897  fc 2d d5      jsr ($d52d,x)
$0e:d89a  30 04         bmi $d8a0
$0e:d89c  1a            inc a
$0e:d89d  f8            sed
$0e:d89e  c7 ae         cmp [$ae]
$0e:d8a0  62 02 0e      per $e6a5
$0e:d8a3  d5 07         cmp $07,x
$0e:d8a5  d7 06         cmp [$06],y
$0e:d8a7  bf f0 20 1c   lda $1c20f0,x
$0e:d8ab  f8            sed
$0e:d8ac  04 02         tsb $02
$0e:d8ae  f1 78         sbc ($78),y
$0e:d8b0  80 cf         bra $d881
$0e:d8b2  58            cli
$0e:d8b3  21 67         and ($67,x)
$0e:d8b5  b3 c0         lda ($c0,s),y
$0e:d8b7  23 d0         and $d0,s
$0e:d8b9  0e 07 d6      asl $d607
$0e:d8bc  30 b3         bmi $d871
$0e:d8be  0f d4 10 ca   ora $ca10d4
$0e:d8c2  0b            phd
$0e:d8c3  b0 fd         bcs $d8c2
$0e:d8c5  63 00         adc $00,s
$0e:d8c7  41 5d         eor ($5d,x)
$0e:d8c9  98            tya
$0e:d8ca  47 99         eor [$99]
$0e:d8cc  81 78         sta ($78,x)
$0e:d8ce  80 41         bra $d911
$0e:d8d0  fc 1e 06      jsr ($061e,x)
$0e:d8d3  f8            sed
$0e:d8d4  60            rts
$0e:d8d5  31 ec         and ($ec),y
$0e:d8d7  10 f8         bpl $d8d1
$0e:d8d9  7c fd d2      jmp ($d2fd,x)
$0e:d8dc  9d 57 76      sta $7657,x
$0e:d8df  6b            rtl
$0e:d8e0  9e c9 52      stz $52c9,x
$0e:d8e3  3e d2 2a      rol $2ad2,x
$0e:d8e6  0e 92 6f      asl $6f92
$0e:d8e9  da            phx
$0e:d8ea  b6 44         ldx $44,y
$0e:d8ec  a2 0a 20      ldx #$200a
$0e:d8ef  8f d8 20 b3   sta $b320d8
$0e:d8f3  f8            sed
$0e:d8f4  04 77         tsb $77
$0e:d8f6  01 1b         ora ($1b,x)
$0e:d8f8  c0 40 78      cpy #$7840
$0e:d8fb  00 b0         brk #$b0
$0e:d8fd  d4 dd         pei ($dd)
$0e:d8ff  f4 37 aa      pea $aa37
$0e:d902  37 a7         and [$a7],y
$0e:d904  4d 9b ed      eor $ed9b
$0e:d907  d8            cld
$0e:d908  28            plp
$0e:d909  79 4e c5      adc $c54e,y
$0e:d90c  32 77         and ($77)
$0e:d90e  62 80 7f      per $5891
$0e:d911  20 ff 08      jsr $08ff
$0e:d914  ff 01 44 9b   sbc $9b4401,x
$0e:d918  f8            sed
$0e:d919  06 76         asl $76
$0e:d91b  01 fa         ora ($fa,x)
$0e:d91d  91 52         sta ($52),y
$0e:d91f  37 bd         and [$bd],y
$0e:d921  38            sec
$0e:d922  7e b2 b5      ror $b5b2,x
$0e:d925  59 b0 f9      eor $f9b0,y
$0e:d928  20 d2 09      jsr $09d2
$0e:d92b  6e 03 a7      ror $a703
$0e:d92e  fd 80 7f      sbc $7f80,x
$0e:d931  88            dey
$0e:d932  02 db         cop #$db
$0e:d934  02 08         cop #$08
$0e:d936  7e 60 1d      ror $1d60,x
$0e:d939  28            plp
$0e:d93a  04 82         tsb $82
$0e:d93c  19 ab c0      ora $c0ab,y
$0e:d93f  47 78         eor [$78]
$0e:d941  57 6e         eor [$6e],y
$0e:d943  4d 1b 17      eor $171b
$0e:d946  3b            tsc
$0e:d947  d0 43         bne $d98c
$0e:d949  fd 10 2d      sbc $2d10,x
$0e:d94c  94 03         sty $03,x
$0e:d94e  94 a2         sty $a2,x
$0e:d950  00 28         brk #$28
$0e:d952  01 41         ora ($41,x)
$0e:d954  44 15 f8      mvp $f8,$15
$0e:d957  04 5e         tsb $5e
$0e:d959  01 4d         ora ($4d,x)
$0e:d95b  80 41         bra $d99e
$0e:d95d  66 02         ror $02
$0e:d95f  f1 da         sbc ($da),y
$0e:d961  f4 e5 f8      pea $f8e5
$0e:d964  cf d4 c3 f9   cmp $f9c3d4
$0e:d968  4b            phk
$0e:d969  98            tya
$0e:d96a  ef 31 b5 2e   sbc $2eb531
$0e:d96e  b8            clv
$0e:d96f  fd 88 a5      sbc $a588,x
$0e:d972  72 80         adc ($80)
$0e:d974  4a            lsr a
$0e:d975  20 1b bc      jsr $bc1b
$0e:d978  04 37         tsb $37
$0e:d97a  a5 f6         lda $f6
$0e:d97c  ac d5 b3      ldy $b3d5
$0e:d97f  76 be         ror $be,x
$0e:d981  86 16         stx $16
$0e:d983  a9 fa 97      lda #$97fa
$0e:d986  5d 72 65      eor $6572,x
$0e:d989  f6 02         inc $02,x
$0e:d98b  84 ee         sty $ee
$0e:d98d  01 11         ora ($11,x)
$0e:d98f  80 42         bra $d9d3
$0e:d991  20 12 b8      jsr $b812
$0e:d994  06 56         asl $56
$0e:d996  65 7e         adc $7e
$0e:d998  94 d8         sty $d8,x
$0e:d99a  a6 78         ldx $78
$0e:d99c  de a5 fe      dec $fea5,x
$0e:d99f  61 58         adc ($58,x)
$0e:d9a1  80 62         bra $da05
$0e:d9a3  2a            rol a
$0e:d9a4  5d f9 07      eor $07f9,x
$0e:d9a7  3e 41 87      rol $8741,x
$0e:d9aa  b8            clv
$0e:d9ab  61 ef         adc ($ef,x)
$0e:d9ad  12 3b         ora ($3b)
$0e:d9af  c4 0f         cpy $0f
$0e:d9b1  f9 23 fe      sbc $fe23,y
$0e:d9b4  48            pha
$0e:d9b5  7f df 49 2d   adc $2d49df,x
$0e:d9b9  07 65         ora [$65]
$0e:d9bb  db            stp
$0e:d9bc  82 e9 6a      brl $44a8
$0e:d9bf  d4 9b         pei ($9b)
$0e:d9c1  77 5e         adc [$5e],y
$0e:d9c3  1b            tcs
$0e:d9c4  47 e1         eor [$e1]
$0e:d9c6  57 63         eor [$63],y
$0e:d9c8  bf a0 f8 40   lda $40f8a0,x
$0e:d9cc  3f 10 1f c4   and $c41f10,x
$0e:d9d0  03 e0         ora $e0,s
$0e:d9d2  e6 08         inc $08
$0e:d9d4  0e f2 01      asl $01f2
$0e:d9d7  e2 80         sep #$80
$0e:d9d9  7e fb f4      ror $f4fb,x
$0e:d9dc  da            phx
$0e:d9dd  6e db ed      ror $eddb
$0e:d9e0  ad 19 05      lda $0519
$0e:d9e3  76 39         ror $39,x
$0e:d9e5  f7 e4         sbc [$e4],y
$0e:d9e7  ef aa 3e f9   sbc $f93eaa
$0e:d9eb  04 00         tsb $00
$0e:d9ed  b8            clv
$0e:d9ee  10 98         bpl $d988
$0e:d9f0  05 08         ora $08
$0e:d9f2  98            tya
$0e:d9f3  10 00         bpl $d9f5
$0e:d9f5  42 40         wdm #$40
$0e:d9f7  41 e1         eor ($e1,x)
$0e:d9f9  07 81         ora [$81]
$0e:d9fb  41 e0         eor ($e0,x)
$0e:d9fd  c1 01         cmp ($01,x)
$0e:d9ff  83 40         sta $40,s
$0e:da01  c2 61         rep #$61
$0e:da03  03 80         ora $80,s
$0e:da05  40            rti
$0e:da06  a0 30 48      ldy #$4830
$0e:da09  0c 00 3a      tsb $3a00
$0e:da0c  10 38         bpl $da46
$0e:da0e  20 98 41      jsr $4198
$0e:da11  c3 00         cmp $00,s
$0e:da13  a0 60 30      ldy #$3060
$0e:da16  10 0d         bpl $da25
$0e:da18  07 02         ora [$02]
$0e:da1a  01 c0         ora ($c0,x)
$0e:da1c  a0 78 3c      ldy #$3c78
$0e:da1f  18            clc
$0e:da20  0a            asl a
$0e:da21  06 82         asl $82
$0e:da23  00 31         brk #$31
$0e:da25  01 a8         ora ($a8,x)
$0e:da27  01 83         ora ($83,x)
$0e:da29  01 60         ora ($60,x)
$0e:da2b  18            clc
$0e:da2c  80 e8         bra $da16
$0e:da2e  08            php
$0e:da2f  82 2f 0e      brl $e861
$0e:da32  de f2 1f      dec $1ff2,x
$0e:da35  7d 9c 57      adc $579c,x
$0e:da38  e2 d2         sep #$d2
$0e:da3a  90 bb         bcc $d9f7
$0e:da3c  29 03 01      and #$0103
$0e:da3f  3f b0 43 e1   and $e143b0,x
$0e:da43  02 68         cop #$68
$0e:da45  d0 0e         bne $da55
$0e:da47  80 10         bra $da59
$0e:da49  a0 83         ldy #$83
$0e:da4b  03 80         ora $80,s
$0e:da4d  d0 0e         bne $da5d
$0e:da4f  75 f5         adc $f5,x
$0e:da51  8c 6b e3      sty $e36b
$0e:da54  1f a8 25 7f   ora $7f25a8,x
$0e:da58  01 eb         ora ($eb,x)
$0e:da5a  83 7e         sta $7e,s
$0e:da5c  b1 9d         lda ($9d),y
$0e:da5e  e8            inx
$0e:da5f  27 1a         and [$1a]
$0e:da61  e1 1e         sbc ($1e,x)
$0e:da63  8f 40 2f 10   sta $102f40
$0e:da67  08            php
$0e:da68  38            sec
$0e:da69  e0 13         cpx #$13
$0e:da6b  e1 80         sbc ($80,x)
$0e:da6d  c7 c9         cmp [$c9]
$0e:da6f  6c b2 af      jmp ($afb2)
$0e:da72  fe ea 99      inc $99ea,x
$0e:da75  ff 80 24 43   sbc $432480,x
$0e:da79  d7 31         cmp [$31],y
$0e:da7b  df c0 3d 52   cmp $523dc0,x
$0e:da7f  1c bc 8a      trb $8abc
$0e:da82  65 ad         adc $ad
$0e:da84  80 73         bra $daf9
$0e:da86  c1 01         cmp ($01,x)
$0e:da88  78            sei
$0e:da89  bc 40 67      ldy $6740,x
$0e:da8c  b4 0a         ldy $0a,x
$0e:da8e  04 de         tsb $de
$0e:da90  6f 00 b5 52   adc $52b500
$0e:da94  ff e6 00 e0   sbc $e000e6,x
$0e:da98  4f f6 f7 7e   eor $7ef7f6
$0e:da9c  0d ff 3d      ora $3dff
$0e:da9f  3e 6b 86      rol $866b,x
$0e:daa2  02 7c         cop #$7c
$0e:daa4  d5 0b         cmp $0b,x
$0e:daa6  ff ff 81 ff   sbc $ff81ff,x
$0e:daaa  c4 7f         cpy $7f
$0e:daac  f7 df         sbc [$df],y
$0e:daae  f7 32         sbc [$32],y
$0e:dab0  39 43 81      and $8143,y
$0e:dab3  7f f2 d9 7f   adc $7fd9f2,x
$0e:dab7  90 2d         bcc $dae6
$0e:dab9  cc ef 85      cpy $85ef
$0e:dabc  7f 77 86 49   adc $498677,x
$0e:dac0  bc 03 00      ldy $0003,x
$0e:dac3  ff e6 bf ff   sbc $ffbfe6,x
$0e:dac7  df ff 13 ff   cmp $ff13ff,x
$0e:dacb  bc ff ef      ldy $efff,x
$0e:dace  ff ef f0 6f   sbc $6ff0ef,x
$0e:dad2  83 f4         sta $f4,s
$0e:dad4  6f fd db fe   adc $fedbfd
$0e:dad8  06 03         asl $03
$0e:dada  bc a1 75      ldy $75a1,x
$0e:dadd  e5 1b         sbc $1b
$0e:dadf  fa            plx
$0e:dae0  00 6c         brk #$6c
$0e:dae2  1b            tcs
$0e:dae3  e0 e5         cpx #$e5
$0e:dae5  07 28         ora [$28]
$0e:dae7  7f bf fb df   adc $dffbbf,x
$0e:daeb  ff 5c 10 20   sbc $20105c,x
$0e:daef  90 fd         bcc $daee
$0e:daf1  d1 3e         cmp ($3e),y
$0e:daf3  94 bf         sty $bf,x
$0e:daf5  05 7f         ora $7f
$0e:daf7  53 2b         eor ($2b,s),y
$0e:daf9  e5 5f         sbc $5f
$0e:dafb  9f 28 2b 20   sta $202b28,x
$0e:daff  48            pha
$0e:db00  75 04         adc $04,x
$0e:db02  c2 09         rep #$09
$0e:db04  4b            phk
$0e:db05  f6 07         inc $07,x
$0e:db07  83 7e         sta $7e,s
$0e:db09  c9 5c f4      cmp #$f45c
$0e:db0c  37 fc         and [$fc],y
$0e:db0e  6d 4f 19      adc $194f
$0e:db11  52 2a         eor ($2a)
$0e:db13  85 6b         sta $6b
$0e:db15  75 7e         adc $7e,x
$0e:db17  ff e0 7f f8   sbc $f87fe0,x
$0e:db1b  c2 50         rep #$50
$0e:db1d  eb            xba
$0e:db1e  3f fa d2 50   and $50d2fa,x
$0e:db22  d1 7f         cmp ($7f),y
$0e:db24  f6 fd         inc $fd,x
$0e:db26  86 ce         stx $ce
$0e:db28  9d cc de      sta $decc,x
$0e:db2b  d4 f6         pei ($f6)
$0e:db2d  5a            phy
$0e:db2e  9b            txy
$0e:db2f  7e 9a dd      ror $dd9a,x
$0e:db32  d5 ae         cmp $ae,x
$0e:db34  76 e5         ror $e5,x
$0e:db36  14 ff         trb $ff
$0e:db38  fe c7 ff      inc $ffc7,x
$0e:db3b  42 ff         wdm #$ff
$0e:db3d  d3 7f         cmp ($7f,s),y
$0e:db3f  f9 1f f6      sbc $f61f,y
$0e:db42  5b            tcd
$0e:db43  f3 a4         sbc ($a4,s),y
$0e:db45  fd f6 3e      sbc $3ef6,x
$0e:db48  f2 df         sbc ($df)
$0e:db4a  36 0b         rol $0b,x
$0e:db4c  d3 5d         cmp ($5d,s),y
$0e:db4e  bb            tyx
$0e:db4f  69 76 dc      adc #$dc76
$0e:db52  3d a4 23      and $23a4,x
$0e:db55  59 45 a4      eor $a445,y
$0e:db58  40            rti
$0e:db59  69 11 8f      adc #$8f11
$0e:db5c  fc 73 fe      jsr ($fe73,x)
$0e:db5f  e3 0a         sbc $0a,s
$0e:db61  42 90         wdm #$90
$0e:db63  68            pla
$0e:db64  1f f8 02 a8   ora $a802f8,x
$0e:db68  7f f7 de 56   adc $56def7,x
$0e:db6c  0b            phd
$0e:db6d  4b            phk
$0e:db6e  94 d5         sty $d5,x
$0e:db70  6a            ror a
$0e:db71  7a            ply
$0e:db72  b9 3d 5e      lda $5e3d,y
$0e:db75  9b            txy
$0e:db76  ad 4c d6      lda $d64c
$0e:db79  66 60         ror $60
$0e:db7b  17 db         ora [$db],y
$0e:db7d  ef fe f7 ff   sbc $fff7fe
$0e:db81  bb            tyx
$0e:db82  ff ed ff fa   sbc $faffed,x
$0e:db86  ff fe 7e de   sbc $de7efe,x
$0e:db8a  1d 6f 4e      ora $4e6f,x
$0e:db8d  ab            plb
$0e:db8e  ec d5 56      cpx $56d5
$0e:db91  6a            ror a
$0e:db92  ba            tsx
$0e:db93  cd 4d df      cmp $df4d
$0e:db96  ad 59 93      lda $9359
$0e:db99  62 7b 3a      per $1617
$0e:db9c  e9 47 e2      sbc #$e247
$0e:db9f  07 e0         ora [$e0]
$0e:dba1  c3 f0         cmp $f0,s
$0e:dba3  20 78 07      jsr $0778
$0e:dba6  30 48         bmi $dbf0
$0e:dba8  20 17 18      jsr $1817
$0e:dbab  05 ce         ora $ce
$0e:dbad  00 00         brk #$00
$0e:dbaf  20 82 c3      jsr $c382
$0e:dbb2  20 f0 88      jsr $88f0
$0e:dbb5  6c 42 13      jmp ($1342)
$0e:dbb8  14 89         trb $89
$0e:dbba  45 a2         eor $a2
$0e:dbbc  52 a8         eor ($a8)
$0e:dbbe  14 aa         trb $aa
$0e:dbc0  23 3b         and $3b,s
$0e:dbc2  81 c3         sta ($c3,x)
$0e:dbc4  e0 f0 f8      cpx #$f8f0
$0e:dbc7  7c 7e 17      jmp ($177e,x)
$0e:dbca  1f 84 c7 df   ora $dfc784,x
$0e:dbce  a0 fd 08      ldy #$08fd
$0e:dbd1  04 ef         tsb $ef
$0e:dbd3  81 94         sta ($94,x)
$0e:dbd5  f8            sed
$0e:dbd6  76 b3         ror $b3,x
$0e:dbd8  10 2f         bpl $dc09
$0e:dbda  47 37         eor [$37]
$0e:dbdc  d3 4d         cmp ($4d,s),y
$0e:dbde  fa            plx
$0e:dbdf  59 af 52      eor $52af,y
$0e:dbe2  2b            pld
$0e:dbe3  a4 9b         ldy $9b
$0e:dbe5  c1 f4         cmp ($f4,x)
$0e:dbe7  f2 7f         sbc ($7f)
$0e:dbe9  bf 9f ef 97   lda $97ef9f,x
$0e:dbed  ff e1 fd fc   sbc $fcfde1,x
$0e:dbf1  08            php
$0e:dbf2  84 52         sty $52
$0e:dbf4  1b            tcs
$0e:dbf5  ac 9e f7      ldy $f79e
$0e:dbf8  33 3e         and ($3e,s),y
$0e:dbfa  ce 4f b1      dec $b14f
$0e:dbfd  94 fa         sty $fa,x
$0e:dbff  34 de         bit $de,x
$0e:dc01  e5 17         sbc $17
$0e:dc03  99 45 e6      sta $e645,y
$0e:dc06  17 cf         ora [$cf],y
$0e:dc08  fd fb ff      sbc $fffb,x
$0e:dc0b  7f 21 0c fe   adc $fe0c21,x
$0e:dc0f  ff 0f 24 04   sbc $04240f,x
$0e:dc13  fc 96 13      jsr ($1396,x)
$0e:dc16  09 84 83      ora #$8384
$0e:dc19  41 80         eor ($80,x)
$0e:dc1b  d4 44         pei ($44)
$0e:dc1d  2d 10 8a      and $8a10
$0e:dc20  a5 02         lda $02
$0e:dc22  a9 44 b5      lda #$b544
$0e:dc25  50 ac         bvc $dbd3
$0e:dc27  b0 09         bcs $dc32
$0e:dc29  84 43         sty $43
$0e:dc2b  61 10         adc ($10,x)
$0e:dc2d  dc 64 3f      jml [$3f64]
$0e:dc30  18            clc
$0e:dc31  8e e1 9c      stx $9ce1
$0e:dc34  30 9e         bmi $dbd4
$0e:dc36  ec 17 9e      cpx $9e17
$0e:dc39  c1 b0         cmp ($b0,x)
$0e:dc3b  98            tya
$0e:dc3c  56 22         lsr $22,x
$0e:dc3e  13 48         ora ($48,s),y
$0e:dc40  44 4a 19      mvp $19,$4a
$0e:dc43  16 3b         asl $3b,x
$0e:dc45  84 12         sty $12
$0e:dc47  2d 0e 8c      and $8c0e
$0e:dc4a  d0 3e         bne $dc8a
$0e:dc4c  12 0b         ora ($0b)
$0e:dc4e  c4 62         cpy $62
$0e:dc50  79 0c 8f      adc $8f0c,y
$0e:dc53  21 52         and ($52,x)
$0e:dc55  0d 1f a0      ora $a01f
$0e:dc58  68            pla
$0e:dc59  11 e1         ora ($e1),y
$0e:dc5b  20 a8 24      jsr $24a8
$0e:dc5e  c2 61         rep #$61
$0e:dc60  48            pha
$0e:dc61  88            dey
$0e:dc62  4a            lsr a
$0e:dc63  21 11         and ($11,x)
$0e:dc65  48            pha
$0e:dc66  64 4a         stz $4a
$0e:dc68  81 e0         sta ($e0,x)
$0e:dc6a  4f 84 82 e0   eor $e08284
$0e:dc6e  a3 09         lda $09,s
$0e:dc70  85 e2         sta $e2
$0e:dc72  21 38         and ($38,x)
$0e:dc74  84 47         sty $47
$0e:dc76  10 a1         bpl $dc19
$0e:dc78  00 c0         brk #$c0
$0e:dc7a  60            rts
$0e:dc7b  3c 1e 0e      bit $0e1e,x
$0e:dc7e  a6 d3         ldx $d3
$0e:dc80  5d 1c eb      eor $eb1c,x
$0e:dc83  43 25         eor $25,s
$0e:dc85  d0 89         bne $dc10
$0e:dc87  54 72 5c      mvn $5c,$72
$0e:dc8a  af 3f a7 d3   lda $d3a73f
$0e:dc8e  fd 3c ff      sbc $ff3c,x
$0e:dc91  47 27         eor [$27]
$0e:dc93  cc 90 8c      cpy $8c90
$0e:dc96  4f a0 d0 98   eor $98d0a0
$0e:dc9a  14 15         trb $15
$0e:dc9c  a2 0c f0      ldx #$f00c
$0e:dc9f  82 42 93      brl $6fe4
$0e:dca2  61 18         adc ($18,x)
$0e:dca4  92 26         sta ($26)
$0e:dca6  42 0d         wdm #$0d
$0e:dca8  0f 81 41 dc   ora $dc4181
$0e:dcac  20 df 08      jsr $08df
$0e:dcaf  24 39         bit $39
$0e:dcb1  56 08         lsr $08,x
$0e:dcb3  30 54         bmi $dd09
$0e:dcb5  84 0a         sty $0a
$0e:dcb7  05 09         ora $09
$0e:dcb9  84 49         sty $49
$0e:dcbb  a4 15         ldy $15
$0e:dcbd  0a            asl a
$0e:dcbe  05 06         ora $06
$0e:dcc0  81 4c         sta ($4c,x)
$0e:dcc2  e6 56         inc $56
$0e:dcc4  3b            tsc
$0e:dcc5  11 1f         ora ($1f),y
$0e:dcc7  84 06         sty $06
$0e:dcc9  01 07         ora ($07,x)
$0e:dccb  80 47         bra $dd14
$0e:dccd  e0 13 f0      cpx #$f013
$0e:dcd0  20 cc e0      jsr $e0cc
$0e:dcd3  12 78         ora ($78)
$0e:dcd5  04 3e         tsb $3e
$0e:dcd7  01 20         ora ($20,x)
$0e:dcd9  90 74         bcc $dd4f
$0e:dcdb  22 17 c8 27   jsl $27c817
$0e:dcdf  da            phx
$0e:dce0  0d eb 84      ora $84eb
$0e:dce3  f7 62         sbc [$62],y
$0e:dce5  3d 88 07      and $0788,x
$0e:dce8  c2 01         rep #$01
$0e:dcea  c0 80 78      cpy #$7880
$0e:dced  20 1f 81      jsr $811f
$0e:dcf0  10 fd         bpl $dcef
$0e:dcf2  a0 1e e8      ldy #$e81e
$0e:dcf5  07 fc         ora [$fc]
$0e:dcf7  54 30 08      mvn $08,$30
$0e:dcfa  18            clc
$0e:dcfb  30 20         bmi $dd1d
$0e:dcfd  31 f8         and ($f8),y
$0e:dcff  14 fa         trb $fa
$0e:dd01  05 7e         ora $7e
$0e:dd03  81 ff         sta ($ff,x)
$0e:dd05  e0 ff f8      cpx #$f8ff
$0e:dd08  48            pha
$0e:dd09  8c 07 e6      sty $e607
$0e:dd0c  ff 07 f8 0f   sbc $0ff807,x
$0e:dd10  c8            iny
$0e:dd11  02 02         cop #$02
$0e:dd13  00 bc         brk #$bc
$0e:dd15  7e 20 98      ror $9820,x
$0e:dd18  4e 47 02      lsr $0247
$0e:dd1b  c5 62         cmp $62
$0e:dd1d  92 48         sta ($48)
$0e:dd1f  20 b0 1c      jsr $1cb0
$0e:dd22  90 fc         bcc $dd20
$0e:dd24  ef 10 09 e4   sbc $e40910
$0e:dd28  03 39         ora $39,s
$0e:dd2a  00 ef         brk #$ef
$0e:dd2c  40            rti
$0e:dd2d  3f c2 a1 89   and $89a1c2,x
$0e:dd31  45 e5         eor $e5
$0e:dd33  10 d9         bpl $dd0e
$0e:dd35  ed d6 91      sbc $91d6
$0e:dd38  7a            ply
$0e:dd39  8a            txa
$0e:dd3a  df 65 d3 e9   cmp $e9d365,x
$0e:dd3e  ad 2f ad      lda $ad2f
$0e:dd41  f7 8b         sbc [$8b],y
$0e:dd43  c2 21         rep #$21
$0e:dd45  b7 2b         lda [$2b],y
$0e:dd47  ac 2a f5      ldy $f52a
$0e:dd4a  05 be         ora $be
$0e:dd4c  8d 42 03      sta $0342
$0e:dd4f  4b            phk
$0e:dd50  80 7d         bra $ddcf
$0e:dd52  e1 18         sbc ($18,x)
$0e:dd54  8d c6 93      sta $93c6
$0e:dd57  e1 78         sbc ($78,x)
$0e:dd59  d7 74         cmp [$74],y
$0e:dd5b  2a            rol a
$0e:dd5c  15 0e         ora $0e,x
$0e:dd5e  e6 a2         inc $a2
$0e:dd60  41 34         eor ($34,x)
$0e:dd62  d7 4a         cmp [$4a],y
$0e:dd64  3b            tsc
$0e:dd65  3b            tsc
$0e:dd66  80 e0         bra $dd48
$0e:dd68  43 b5         eor $b5,s
$0e:dd6a  d1 0a         cmp ($0a),y
$0e:dd6c  84 b3         sty $b3
$0e:dd6e  b9 20 7a      lda $7a20,y
$0e:dd71  06 ba         asl $ba
$0e:dd73  81 d9         sta ($d9,x)
$0e:dd75  83 40         sta $40,s
$0e:dd77  86 01         stx $01
$0e:dd79  07 93         ora [$93]
$0e:dd7b  5b            tcd
$0e:dd7c  75 38         adc $38,x
$0e:dd7e  b9 15 ca      lda $ca15,y
$0e:dd81  b3 7d         lda ($7d,s),y
$0e:dd83  88            dey
$0e:dd84  5f ab de 75   eor $75deab,x
$0e:dd88  80 c0         bra $dd4a
$0e:dd8a  2d b1 0c      and $0cb1
$0e:dd8d  5d d2 e5      eor $e5d2,x
$0e:dd90  0d 43 85      ora $8543
$0e:dd93  fa            plx
$0e:dd94  03 e7         ora $e7,s
$0e:dd96  80 60         bra $ddf8
$0e:dd98  38            sec
$0e:dd99  1d 4f f5      ora $f54f,x
$0e:dd9c  7b            tdc
$0e:dd9d  7d c6 b0      adc $b0c6,x
$0e:dda0  7a            ply
$0e:dda1  a9 52 8d      lda #$8d52
$0e:dda4  64 93         stz $93
$0e:dda6  69 94 f5      adc #$f594
$0e:dda9  07 c0         ora [$c0]
$0e:ddab  d6 1b         dec $1b,x
$0e:ddad  e8            inx
$0e:ddae  05 82         ora $82
$0e:ddb0  3f 4a 9a 6b   and $6b9a4a,x
$0e:ddb4  2a            rol a
$0e:ddb5  5b            tcd
$0e:ddb6  4a            lsr a
$0e:ddb7  47 aa         eor [$aa]
$0e:ddb9  01 11         ora ($11,x)
$0e:ddbb  95 c8         sta $c8,x
$0e:ddbd  ad 50 2a      lda $2a50
$0e:ddc0  b5 07         lda $07,x
$0e:ddc2  49 85 a2      eor #$a285
$0e:ddc5  41 69         eor ($69,x)
$0e:ddc7  90 3d         bcc $de06
$0e:ddc9  4d 2e b3      eor $b32e
$0e:ddcc  10 9d         bpl $dd6b
$0e:ddce  c4 6f         cpy $6f
$0e:ddd0  72 1b         adc ($1b)
$0e:ddd2  bd 0f cf      lda $cf0f,x
$0e:ddd5  83 e3         sta $e3,s
$0e:ddd7  e0 f9 f4      cpx #$f4f9
$0e:ddda  7f 7c 9e ff   adc $ff9e7c,x
$0e:ddde  74 93         stz $93,x
$0e:dde0  7b            tdc
$0e:dde1  29 9e 8a      and #$8a9e
$0e:dde4  67 83         adc [$83]
$0e:dde6  91 d0         sta ($d0),y
$0e:dde8  cc 74 32      cpy $3274
$0e:ddeb  1c 0c 86      trb $860c
$0e:ddee  82 61 f8      brl $d652
$0e:ddf1  ff 7c 3f 82   sbc $823f7c,x
$0e:ddf5  11 fc         ora ($fc),y
$0e:ddf7  78            sei
$0e:ddf8  04 c1         tsb $c1
$0e:ddfa  f0 14         beq $de10
$0e:ddfc  87 03         sta [$03]
$0e:ddfe  e1 1b         sbc ($1b,x)
$0e:de00  89 46 e3      bit #$e346
$0e:de03  71 79         adc ($79),y
$0e:de05  1c 6e 51      trb $516e
$0e:de08  15 8e         ora $8e,x
$0e:de0a  48            pha
$0e:de0b  a4 d0         ldy $d0
$0e:de0d  15 80         ora $80,x
$0e:de0f  40            rti
$0e:de10  61 f1         adc ($f1,x)
$0e:de12  f1 f8         sbc ($f8),y
$0e:de14  47 e7         eor [$e7]
$0e:de16  f1 79         sbc ($79),y
$0e:de18  fc 0e 3f      jsr ($3f0e,x)
$0e:de1b  01 93         ora ($93,x)
$0e:de1d  c0 07 83      cpy #$8307
$0e:de20  a0 9d 75      ldy #$759d
$0e:de23  23 5e         and $5e,s
$0e:de25  4c 17 a3      jmp $a317
$0e:de28  85 d2         sta $d2
$0e:de2a  a1 ff         lda ($ff,x)
$0e:de2c  26 37         rol $37
$0e:de2e  d8            cld
$0e:de2f  ce f7 33      dec $33f7
$0e:de32  c4 ff         cpy $ff
$0e:de34  79 3f df      adc $df3f,y
$0e:de37  c3 11         cmp $11,s
$0e:de39  7f ff c6 81   adc $81c6ff,x
$0e:de3d  bf 7f e0 f0   lda $f0e07f,x
$0e:de41  e8            inx
$0e:de42  1f 1e 83 a3   ora $a3831e,x
$0e:de46  90 d7         bcc $de1f
$0e:de48  23 d2         and $d2,s
$0e:de4a  18            clc
$0e:de4b  04 7a         tsb $7a
$0e:de4d  00 7b         brk #$7b
$0e:de4f  18            clc
$0e:de50  1c 3e 03      trb $033e
$0e:de53  c7 a0         cmp [$a0]
$0e:de55  78            sei
$0e:de56  e4 77         cpx $77
$0e:de58  f8            sed
$0e:de59  f4 fc f2      pea $f2fc
$0e:de5c  93 8b         sta ($8b,s),y
$0e:de5e  a4 62         ldy $62
$0e:de60  55 1c         eor $1c,x
$0e:de62  9d 43 22      sta $2243,x
$0e:de65  b0 e8         bcs $de4f
$0e:de67  ec 1e 16      cpx $161e
$0e:de6a  6f 04 c8 46   adc $46c804
$0e:de6e  2f 91 c9 f4   and $f4c991
$0e:de72  32 7d         and ($7d)
$0e:de74  0e 8f c1      asl $c18f
$0e:de77  94 c1         sty $c1,x
$0e:de79  0f 3f 84 1e   ora $1e843f
$0e:de7d  1e 8f 08      asl $088f,x
$0e:de80  85 52         sta $52
$0e:de82  61 77         adc ($77,x)
$0e:de84  be 6e 25      ldx $256e,y
$0e:de87  f6 78         inc $78,x
$0e:de89  44 e2 01      mvp $01,$e2
$0e:de8c  0f 3d 82 7c   ora $7c823d
$0e:de90  27 0c         and [$0c]
$0e:de92  00 bf         brk #$bf
$0e:de94  df ff f1 fb   cmp $fbf1ff,x
$0e:de98  fc 1d 10      jsr ($101d,x)
$0e:de9b  0b            phd
$0e:de9c  c1 88         cmp ($88,x)
$0e:de9e  4a            lsr a
$0e:de9f  23 12         and $12,s
$0e:dea1  48            pha
$0e:dea2  47 5b         eor [$5b]
$0e:dea4  8d f9 f9      sta $f9f9
$0e:dea7  7b            tdc
$0e:dea8  7c 56 db      jmp ($db56,x)
$0e:deab  b6 26         ldx $26,y
$0e:dead  79 52 88      adc $8852,y
$0e:deb0  4e 23 13      lsr $1323
$0e:deb3  c8            iny
$0e:deb4  47 7a         eor [$7a]
$0e:deb6  0d ff f9      ora $f9ff
$0e:deb9  39 86 ed      and $ed86,y
$0e:debc  ff 9e 5f a4   sbc $a45f9e,x
$0e:dec0  fe 68 f7      inc $f768,x
$0e:dec3  fa            plx
$0e:dec4  05 7e         ora $7e
$0e:dec6  80 df         bra $dea7
$0e:dec8  e0 08 80      cpx #$8008
$0e:decb  8f ae c6 0f   sta $0fc6ae
$0e:decf  19 1e 80      ora $801e,y
$0e:ded2  00 40         brk #$40
$0e:ded4  91 e1         sta ($e1),y
$0e:ded6  80 f0         bra $dec8
$0e:ded8  60            rts
$0e:ded9  3c 28 1d      bit $1d28,x
$0e:dedc  12 0d         ora ($0d)
$0e:dede  88            dey
$0e:dedf  c6 52         dec $52
$0e:dee1  39 97 0f      and $0f97,y
$0e:dee4  c4 83         cpy $83
$0e:dee6  e1 fe         sbc ($fe,x)
$0e:dee8  80 07         bra $def1
$0e:deea  c3 f9         cmp $f9,s
$0e:deec  00 fc         brk #$fc
$0e:deee  40            rti
$0e:deef  2e 10 09      rol $0910
$0e:def2  80 10         bra $df04
$0e:def4  e2 ff         sep #$ff
$0e:def6  0b            phd
$0e:def7  7f 83 83 c0   adc $c08383,x
$0e:defb  a0 70         ldy #$70
$0e:defd  26 17         rol $17
$0e:deff  05 c8         ora $c8
$0e:df01  41 21         eor ($21,x)
$0e:df03  90 35         bcc $df3a
$0e:df05  68            pla
$0e:df06  3e 45 f0      rol $f045,x
$0e:df09  0c a2 83      tsb $83a2
$0e:df0c  9f 80 f6 3f   sta $3ff680,x
$0e:df10  a1 00         lda ($00,x)
$0e:df12  e7 60         sbc [$60]
$0e:df14  3e e9 12      rol $12e9,x
$0e:df17  c0 25         cpy #$25
$0e:df19  90 c8         bcc $dee3
$0e:df1b  c4 22         cpy $22
$0e:df1d  61 30         adc ($30,x)
$0e:df1f  ff c0 0b e0   sbc $e00bc0,x
$0e:df23  1f 0e e4 03   ora $03e40e,x
$0e:df27  d9 00 f8      cmp $f800,y
$0e:df2a  1a            inc a
$0e:df2b  07 81         ora [$81]
$0e:df2d  00 96         brk #$96
$0e:df2f  78            sei
$0e:df30  2a            rol a
$0e:df31  b4 59         ldy $59,x
$0e:df33  25 17         and $17
$0e:df35  27 96         and [$96]
$0e:df37  a6 46         ldx $46
$0e:df39  fd 3f 78      sbc $783f,x
$0e:df3c  2d 3e 0b      and $0b3e
$0e:df3f  0b            phd
$0e:df40  f0 47         beq $df89
$0e:df42  e8            inx
$0e:df43  b3 a4         lda ($a4,s),y
$0e:df45  08            php
$0e:df46  65 ad         adc $ad
$0e:df48  11 bb         ora ($bb),y
$0e:df4a  07 de         ora [$de]
$0e:df4c  01 4f         ora ($4f,x)
$0e:df4e  c0 12         cpy #$12
$0e:df50  c2 49         rep #$49
$0e:df52  ae bd 77      ldx $77bd
$0e:df55  f6 1a         inc $1a,x
$0e:df57  2a            rol a
$0e:df58  a5 12         lda $12
$0e:df5a  51 a2         eor ($a2),y
$0e:df5c  e6 51         inc $51
$0e:df5e  2b            pld
$0e:df5f  19 4d 07      ora $074d,y
$0e:df62  c3 5d         cmp $5d,s
$0e:df64  51 ef         eor ($ef),y
$0e:df66  c8            iny
$0e:df67  34 55         bit $55,x
$0e:df69  ca            dex
$0e:df6a  26 e9         rol $e9
$0e:df6c  46 33         lsr $33
$0e:df6e  ac a4 a2      ldy $a2a4
$0e:df71  61 08         adc ($08,x)
$0e:df73  dd 76 24      cmp $2476,x
$0e:df76  be 18 d5      ldx $d518,y
$0e:df79  ca            dex
$0e:df7a  85 42         sta $42
$0e:df7c  9c da e2      stz $e2da
$0e:df7f  b1 69         lda ($69),y
$0e:df81  6c 6c fa      jmp ($fa6c)
$0e:df84  1d 88 3f      ora $3f88,x
$0e:df87  86 3d         stx $3d
$0e:df89  72 86         adc ($86)
$0e:df8b  d0 a7         bne $df34
$0e:df8d  b6 b8         ldx $b8,y
$0e:df8f  a4 59         ldy $59
$0e:df91  0c 12 08      tsb $0812
$0e:df94  1c 83 15      trb $1583
$0e:df97  8f a8 70 a5   sta $a570a8
$0e:df9b  da            phx
$0e:df9c  6a            ror a
$0e:df9d  6f 27 2d 52   adc $522d27
$0e:dfa1  b3 6d         lda ($6d,s),y
$0e:dfa3  35 5d         and $5d,x
$0e:dfa5  ca            dex
$0e:dfa6  07 83         ora [$83]
$0e:dfa8  1f 70 e1 4f   ora $4fe170,x
$0e:dfac  74 d5         stz $d5,x
$0e:dfae  8e 4c da      stx $da4c
$0e:dfb1  a5 2d         lda $2d
$0e:dfb3  da            phx
$0e:dfb4  42 bb         wdm #$bb
$0e:dfb6  90 2f         bcc $dfe7
$0e:dfb8  04 02         tsb $02
$0e:dfba  37 29         and [$29],y
$0e:dfbc  8f cc e2 71   sta $71e2cc
$0e:dfc0  28            plp
$0e:dfc1  3c 8a 5f      bit $5f8a,x
$0e:dfc4  26 95         rol $95
$0e:dfc6  58            cli
$0e:dfc7  25 52         and $52
$0e:dfc9  08            php
$0e:dfca  b4 82         ldy $82,x
$0e:dfcc  2f 3f 87 80   and $80873f
$0e:dfd0  02 3f         cop #$3f
$0e:dfd2  1f 9f 81 46   ora $46819f,x
$0e:dfd6  fe 05 2d      inc $2d05,x
$0e:dfd9  04 c2         tsb $c2
$0e:dfdb  41 20         eor ($20,x)
$0e:dfdd  36 85         rol $85,x
$0e:dfdf  82 21 20      brl $0003
$0e:dfe2  a8            tay
$0e:dfe3  60            rts
$0e:dfe4  39 19 0d      and $0d19,y
$0e:dfe7  46 23         lsr $23
$0e:dfe9  a5 c0         lda $c0
$0e:dfeb  f8            sed
$0e:dfec  70 3c         bvs $e02a
$0e:dfee  02 21         cop #$21
$0e:dff0  f8            sed
$0e:dff1  27 42         and [$42]
$0e:dff3  61 f8         adc ($f8,x)
$0e:dff5  88            dey
$0e:dff6  6e 21 9d      ror $9d21
$0e:dff9  e2 60         sep #$60
$0e:dffb  c6 23         dec $23
$0e:dffd  10 68         bpl $e067
$0e:dfff  74 46         stz $46,x
$0e:e001  07 0d         ora [$0d]
$0e:e003  81 41         sta ($41,x)
$0e:e005  a0 b0         ldy #$b0
$0e:e007  d8            cld
$0e:e008  4c 64 5e      jmp $5e64
$0e:e00b  71 e8         adc ($e8),y
$0e:e00d  74 7e         stz $7e,x
$0e:e00f  05 0f         ora $0f
$0e:e011  81 c1         sta ($c1,x)
$0e:e013  e0 70         cpx #$70
$0e:e015  f8            sed
$0e:e016  3c 7e 83      bit $837e,x
$0e:e019  a3 a6         lda $a6,s
$0e:e01b  6f 2c 1a 0d   adc $0d1a2c
$0e:e01f  1e 82 5f      asl $5f82,x
$0e:e022  20 b7 c8      jsr $c8b7
$0e:e025  26 f3         rol $f3
$0e:e027  0f ff e2 81   ora $81e2ff
$0e:e02b  e3 a1         sbc $a1,s
$0e:e02d  ff eb ff fb   sbc $fbffeb,x
$0e:e031  ff fc cc dc   sbc $dcccfc,x
$0e:e035  0d 05 83      ora $8305
$0e:e038  f1 18         sbc ($18),y
$0e:e03a  bf 43 23 30   lda $302343,x
$0e:e03e  38            sec
$0e:e03f  74 01         stz $01,x
$0e:e041  1a            inc a
$0e:e042  02 f1         cop #$f1
$0e:e044  10 84         bpl $dfca
$0e:e046  80 e4         bra $e02c
$0e:e048  30 68         bmi $e0b2
$0e:e04a  fc 06 1e      jsr ($1e06,x)
$0e:e04d  79 48 24      adc $2448,y
$0e:e050  2a            rol a
$0e:e051  05 05         ora $05
$0e:e053  80 c0         bra $e015
$0e:e055  a0 1c         ldy #$1c
$0e:e057  1c 06 c3      trb $c306
$0e:e05a  c1 ec         cmp ($ec,x)
$0e:e05c  9e 7f a1      stz $a17f,x
$0e:e05f  d2 d8         cmp ($d8)
$0e:e061  24 3a         bit $3a
$0e:e063  05 07         ora $07
$0e:e065  80 9e         bra $e005
$0e:e067  83 82         sta $82,s
$0e:e069  1f 0b 87 f2   ora $f2870b,x
$0e:e06d  31 fe         and ($fe),y
$0e:e06f  8f 4f cf 64   sta $64cf4f
$0e:e073  7e 0a 04      ror $040a,x
$0e:e076  c2 61         rep #$61
$0e:e078  d8            cld
$0e:e079  8c 4f 27      sty $274f
$0e:e07c  9e ed e6      stz $e6ed,x
$0e:e07f  75 5e         adc $5e,x
$0e:e081  81 f0         sta ($f0,x)
$0e:e083  90 0a         bcc $e08f
$0e:e085  82 79 1c      brl $fd01
$0e:e088  ff 5f bf e7   sbc $e7bf5f,x
$0e:e08c  e0 80         cpx #$80
$0e:e08e  68            pla
$0e:e08f  20 15 08      jsr $0815
$0e:e092  04 a1         tsb $a1
$0e:e094  aa            tax
$0e:e095  72 c8         adc ($c8)
$0e:e097  44 49 66      mvp $66,$49
$0e:e09a  28            plp
$0e:e09b  00 b8         brk #$b8
$0e:e09d  44 27 0e      mvp $0e,$27
$0e:e0a0  53 9e         eor ($9e,s),y
$0e:e0a2  43 23         eor $23,s
$0e:e0a4  d1 48         cmp ($48),y
$0e:e0a6  bc 6e 27      ldy $276e,x
$0e:e0a9  3c 8b cc      bit $cc8b,x
$0e:e0ac  62 13 b8      per $98c2
$0e:e0af  8c ce 26      sty $26ce
$0e:e0b2  32 08         and ($08)
$0e:e0b4  d4 2e         pei ($2e)
$0e:e0b6  2f 08 99 c3   and $c39908
$0e:e0ba  26 f0         rol $f0
$0e:e0bc  89 84 3e      bit #$3e84
$0e:e0bf  63 0d         adc $0d,s
$0e:e0c1  99 c3 e7      sta $e7c3,y
$0e:e0c4  10 79         bpl $e13f
$0e:e0c6  dc 10 5e      jml [$5e10]
$0e:e0c9  38            sec
$0e:e0ca  00 90         brk #$90
$0e:e0cc  04 46         tsb $46
$0e:e0ce  81 00         sta ($00,x)
$0e:e0d0  0c 06 03      tsb $0306
$0e:e0d3  c1 e0         cmp ($e0,x)
$0e:e0d5  08            php
$0e:e0d6  08            php
$0e:e0d7  80 e8         bra $e0c1
$0e:e0d9  01 70         ora ($70,x)
$0e:e0db  09 8c 63      ora #$638c
$0e:e0de  f0 49         beq $e129
$0e:e0e0  08            php
$0e:e0e1  6c 32 0b      jmp ($0b32)
$0e:e0e4  04 86         tsb $86
$0e:e0e6  0d 04 1c      ora $1c04
$0e:e0e9  10 68         bpl $e153
$0e:e0eb  14 6c         trb $6c
$0e:e0ed  5e 08 e0      lsr $e008,x
$0e:e0f0  81 c3         sta ($c3,x)
$0e:e0f2  08            php
$0e:e0f3  4b            phk
$0e:e0f4  0e 80 c7      asl $c780
$0e:e0f7  63 c7         adc $c7,s
$0e:e0f9  e0 b0         cpx #$b0
$0e:e0fb  58            cli
$0e:e0fc  20 1e 0a      jsr $0a1e
$0e:e0ff  04 43         tsb $43
$0e:e101  c1 50         cmp ($50,x)
$0e:e103  e0 74         cpx #$74
$0e:e105  20 12 0a      jsr $0a12
$0e:e108  05 81         ora $81
$0e:e10a  a0 16         ldy #$16
$0e:e10c  00 e0         brk #$e0
$0e:e10e  40            rti
$0e:e10f  0a            asl a
$0e:e110  c3 60         cmp $60,s
$0e:e112  e8            inx
$0e:e113  20 00 a0      jsr $a000
$0e:e116  18            clc
$0e:e117  04 38         tsb $38
$0e:e119  41 a1         eor ($a1,x)
$0e:e11b  d1 18         cmp ($18),y
$0e:e11d  7c 9a 3d      jmp ($3d9a,x)
$0e:e120  2b            pld
$0e:e121  8f c9 63 91   sta $9163c9
$0e:e125  38            sec
$0e:e126  7c 00 7e      jmp ($7e00,x)
$0e:e129  10 08         bpl $e133
$0e:e12b  08            php
$0e:e12c  3c 50 24      bit $2450,x
$0e:e12f  a4 04         ldy $04
$0e:e131  51 58         eor ($58),y
$0e:e133  0c 21 20      tsb $2021
$0e:e136  90 58         bcc $e190
$0e:e138  32 13         and ($13)
$0e:e13a  0a            asl a
$0e:e13b  81 9c         sta ($9c,x)
$0e:e13d  26 06         rol $06
$0e:e13f  92 0a         sta ($0a)
$0e:e141  03 40         ora $40,s
$0e:e143  13 e4         ora ($e4,s),y
$0e:e145  d2 06         cmp ($06)
$0e:e147  80 22         bra $e16b
$0e:e149  8a            txa
$0e:e14a  05 05         ora $05
$0e:e14c  37 84         and [$84],y
$0e:e14e  52 1f         eor ($1f)
$0e:e150  22 8f 4a 4f   jsl $4f4a8f
$0e:e154  0e 8a 24      asl $248a
$0e:e157  2c 70 3a      bit $3a70
$0e:e15a  16 03         asl $03,x
$0e:e15c  58            cli
$0e:e15d  78            sei
$0e:e15e  12 b1         ora ($b1)
$0e:e160  20 54 1a      jsr $1a54
$0e:e163  96 22         stx $22,y
$0e:e165  f2 27         sbc ($27)
$0e:e167  78            sei
$0e:e168  4c ea 12      jmp $12ea
$0e:e16b  bd cc 2d      lda $2dcc,x
$0e:e16e  ec 14 98      cpx $9814
$0e:e171  1b            tcs
$0e:e172  e8            inx
$0e:e173  16 e1         asl $e1,x
$0e:e175  3f 7f 84 be   and $be847f,x
$0e:e179  ff 47 ff 81   sbc $81ff47,x
$0e:e17d  42 4f         wdm #$4f
$0e:e17f  6f 04 84 1e   adc $1e8404
$0e:e183  5f 02 a4 d0   eor $d0a402,x
$0e:e187  a8            tay
$0e:e188  b4 1b         ldy $1b,x
$0e:e18a  2e 02 51      rol $5102
$0e:e18d  a0 95         ldy #$95
$0e:e18f  69 24 9a      adc #$9a24
$0e:e192  29 96 86      and #$8696
$0e:e195  67 86         adc [$86]
$0e:e197  e7 e0         sbc [$e0]
$0e:e199  b8            clv
$0e:e19a  f8            sed
$0e:e19b  2f 3f 1b dd   and $dd1b3f
$0e:e19f  c4 f7         cpy $f7
$0e:e1a1  70 bc         bvs $e15f
$0e:e1a3  dc 0f 97      jml [$970f]
$0e:e1a6  03 e7         ora $e7,s
$0e:e1a8  10 f8         bpl $e1a2
$0e:e1aa  79 e0 13      adc $13e0,y
$0e:e1ad  ff 44 62 b1   sbc $b16244,x
$0e:e1b1  47 a3         eor [$a3]
$0e:e1b3  d2 68         cmp ($68)
$0e:e1b5  11 fc         ora ($fc),y
$0e:e1b7  06 7f         asl $7f
$0e:e1b9  01 0f         ora ($0f,x)
$0e:e1bb  ff 90 02 2f   sbc $2f0290,x
$0e:e1bf  ff 9f df c8   sbc $c8df9f,x
$0e:e1c3  a5 7f         lda $7f
$0e:e1c5  ff 92 c2 7f   sbc $7fc292,x
$0e:e1c9  1b            tcs
$0e:e1ca  ff 8f c2 7e   sbc $7ec28f,x
$0e:e1ce  53 12         eor ($12,s),y
$0e:e1d0  bf 97 92 01   lda $019297,x
$0e:e1d4  06 83         asl $83
$0e:e1d6  42 61         wdm #$61
$0e:e1d8  f1 28         sbc ($28),y
$0e:e1da  cc be 61      cpy $61be
$0e:e1dd  59 90 6c      eor $6c90,y
$0e:e1e0  20 14 05      jsr $0514
$0e:e1e3  10 9c         bpl $e181
$0e:e1e5  02 1f         cop #$1f
$0e:e1e7  0d 8f c4      ora $c48f
$0e:e1ea  27 f2         and [$f2]
$0e:e1ec  0b            phd
$0e:e1ed  cd 03 e1      cmp $e103
$0e:e1f0  80 54         bra $e246
$0e:e1f2  86 02         stx $02
$0e:e1f4  3f 2f 99 d5   and $d5992f,x
$0e:e1f8  68            pla
$0e:e1f9  19 bc 03      ora $03bc,y
$0e:e1fc  7c 0f 81      jmp ($810f,x)
$0e:e1ff  83 80         sta $80,s
$0e:e201  c1 19         cmp ($19,x)
$0e:e203  00 ff         brk #$ff
$0e:e205  09 dd fe      ora #$fedd
$0e:e208  c1 fb         cmp ($fb,x)
$0e:e20a  e0 78         cpx #$78
$0e:e20c  11 63         ora ($63),y
$0e:e20e  83 81         sta $81,s
$0e:e210  af 82 07 e6   lda $e60782
$0e:e214  f3 61         sbc ($61,s),y
$0e:e216  f7 b0         sbc [$b0],y
$0e:e218  3a            dec a
$0e:e219  34 07         bit $07,x
$0e:e21b  e7 20         sbc [$20]
$0e:e21d  c4 e2         cpy $e2
$0e:e21f  2e f0 3c      rol $3cf0
$0e:e222  44 02 0e      mvp $0e,$02
$0e:e225  40            rti
$0e:e226  0e 1f ff      asl $ff1f
$0e:e229  03 c7         ora $c7,s
$0e:e22b  80 7c         bra $e2a9
$0e:e22d  ee 1f 9c      inc $9c1f
$0e:e230  47 fe         eor [$fe]
$0e:e232  0f 8f 5e 81   ora $815e8f
$0e:e236  f4 6c 1e      pea $1e6c
$0e:e239  0d c7 a3      ora $a3c7
$0e:e23c  dd 78 d8      cmp $d878,x
$0e:e23f  e7 a5         sbc [$a5]
$0e:e241  90 fa         bcc $e23d
$0e:e243  d4 1f         pei ($1f)
$0e:e245  1a            inc a
$0e:e246  8d 0c 07      sta $070c
$0e:e249  83 81         sta $81,s
$0e:e24b  f8            sed
$0e:e24c  f8            sed
$0e:e24d  7f af df fe   adc $fedfaf,x
$0e:e251  ff ff 0f df   sbc $df0fff,x
$0e:e255  81 e3         sta ($e3,x)
$0e:e257  e1 b0         sbc ($b0,x)
$0e:e259  db            stp
$0e:e25a  ac 56 b3      ldy $b356
$0e:e25d  01 99         ora ($99,x)
$0e:e25f  40            rti
$0e:e260  a0 d0         ldy #$d0
$0e:e262  28            plp
$0e:e263  1c 06 03      trb $0306
$0e:e266  00 7e         brk #$7e
$0e:e268  04 d6         tsb $d6
$0e:e26a  75 69         adc $69,x
$0e:e26c  bf 5f 6f d3   lda $d36f5f,x
$0e:e270  e9 cc 3a      sbc #$3acc
$0e:e273  02 ac         cop #$ac
$0e:e275  17 e0         ora [$e0],y
$0e:e277  dc 20 1c      jml [$1c20]
$0e:e27a  0e 05 80      asl $8005
$0e:e27d  20 34 0a      jsr $0a34
$0e:e280  06 43         asl $43
$0e:e282  01 e8         ora ($e8,x)
$0e:e284  b0 4e         bcs $e2d4
$0e:e286  20 1f 0f      jsr $0f1f
$0e:e289  84 83         sty $83
$0e:e28b  c0 22         cpy #$22
$0e:e28d  0d 05 82      ora $8205
$0e:e290  81 80         sta ($80,x)
$0e:e292  dc 5e 3b      jml [$3b5e]
$0e:e295  13 8f         ora ($8f,s),y
$0e:e297  c4 e2         cpy $e2
$0e:e299  2f 07 8e c0   and $c08e07
$0e:e29d  61 50         adc ($50,x)
$0e:e29f  21 a1         and ($a1,x)
$0e:e2a1  43 60         eor $60,s
$0e:e2a3  b1 e8         lda ($e8),y
$0e:e2a5  34 52         bit $52,x
$0e:e2a7  01 19         ora ($19,x)
$0e:e2a9  8f 47 e3 d0   sta $d0e347
$0e:e2ad  e8            inx
$0e:e2ae  6c 1a 02      jmp ($021a)
$0e:e2b1  45 08         eor $08
$0e:e2b3  ec 6a 35      cpx $356a
$0e:e2b6  1c 8f 47      trb $478f
$0e:e2b9  ae 17 00      ldx $0017
$0e:e2bc  b8            clv
$0e:e2bd  5e 2c 1d      lsr $1d2c,x
$0e:e2c0  0e 87 c3      asl $c387
$0e:e2c3  81 a0         sta ($a0,x)
$0e:e2c5  68            pla
$0e:e2c6  03 f0         ora $f0,s
$0e:e2c8  68            pla
$0e:e2c9  1b            tcs
$0e:e2ca  0b            phd
$0e:e2cb  f6 fa         inc $fa,x
$0e:e2cd  b1 b8         lda ($b8),y
$0e:e2cf  d0 5c         bne $e32d
$0e:e2d1  36 17         rol $17,x
$0e:e2d3  06 90         asl $90
$0e:e2d5  05 c1         ora $c1
$0e:e2d7  f8            sed
$0e:e2d8  11 09         ora ($09),y
$0e:e2da  c4 a2         cpy $a2
$0e:e2dc  d9 54 e3      cmp $e354,y
$0e:e2df  5f 0e 82 73   eor $73820e,x
$0e:e2e3  03 88         ora $88,s
$0e:e2e5  1b            tcs
$0e:e2e6  c0 da         cpy #$da
$0e:e2e8  30 00         bmi $e2ea
$0e:e2ea  e8            inx
$0e:e2eb  20 d1 02      jsr $02d1
$0e:e2ee  0f c1 9e 4f   ora $4f9ec1
$0e:e2f2  2f d5 ae 1e   and $1eaed5
$0e:e2f6  f7 02         sbc [$02],y
$0e:e2f8  93 04         sta ($04,s),y
$0e:e2fa  88            dey
$0e:e2fb  23 c0         and $c0,s
$0e:e2fd  b6 48         ldx $48,y
$0e:e2ff  e1 80         sbc ($80,x)
$0e:e301  26 9e         rol $9e
$0e:e303  01 0a         ora ($0a,x)
$0e:e305  8f 41 61 91   sta $916141
$0e:e309  28            plp
$0e:e30a  74 92         stz $92,x
$0e:e30c  39 2b 8f      and $8f2b,y
$0e:e30f  c9 63 91      cmp #$9163
$0e:e312  38            sec
$0e:e313  7c 02 0e      jmp ($0e02,x)
$0e:e316  fb            xce
$0e:e317  00 58         brk #$58
$0e:e319  2f c8 1a 00   and $001ac8
$0e:e31d  b2 06         lda ($06)
$0e:e31f  80 54         bra $e375
$0e:e321  6c 18 0e      jmp ($0e18)
$0e:e324  06 c2         asl $c2
$0e:e326  61 50         adc ($50,x)
$0e:e328  a8            tay
$0e:e329  58            cli
$0e:e32a  26 1d         rol $1d
$0e:e32c  0f 04 83 80   ora $808304
$0e:e330  0d 02 d0      ora $d002
$0e:e333  48            pha
$0e:e334  02 01         cop #$01
$0e:e336  00 d0         brk #$d0
$0e:e338  39 05 d4      and $d405,y
$0e:e33b  d0 38         bne $e375
$0e:e33d  1c 75 6c      trb $6c75
$0e:e340  12 88         ora ($88)
$0e:e342  dc 62 93      jml [$9362]
$0e:e345  18            clc
$0e:e346  e5 c6         sbc $c6
$0e:e348  1d ab 00      ora $00ab,x
$0e:e34b  8b            phb
$0e:e34c  c0 2c         cpy #$2c
$0e:e34e  f0 0f         beq $e35f
$0e:e350  38            sec
$0e:e351  28            plp
$0e:e352  5d ad 05      eor $05ad,x
$0e:e355  82 42 e1      brl $c49a
$0e:e358  17 bb         ora [$bb],y
$0e:e35a  c6 27         dec $27
$0e:e35c  30 eb         bmi $e349
$0e:e35e  75 e8         adc $e8,x
$0e:e360  0a            asl a
$0e:e361  04 12         tsb $12
$0e:e363  09 d4 d8      ora #$d8d4
$0e:e366  7c 29 96      jmp ($9629,x)
$0e:e369  cd 74 8b      cmp $8b74
$0e:e36c  79 30 93      adc $9330,y
$0e:e36f  4c 1d 4d      jmp $4d1d
$0e:e372  90 80         bcc $e2f4
$0e:e374  77 20         adc [$20],y
$0e:e376  1c e2 50      trb $50e2
$0e:e379  f0 28         beq $e3a3
$0e:e37b  f2 89         sbc ($89)
$0e:e37d  bc c2 5f      ldy $5fc2,x
$0e:e380  93 ef         sta ($ef,s),y
$0e:e382  e1 37         sbc ($37,x)
$0e:e384  97 39         sta [$39],y
$0e:e386  7f e2 53 bb   adc $bb53e2,x
$0e:e38a  92 b4         sta ($b4)
$0e:e38c  c3 91         cmp $91,s
$0e:e38e  f8            sed
$0e:e38f  a8            tay
$0e:e390  5c 24 13 0a   jml $0a1324
$0e:e394  1b            tcs
$0e:e395  38            sec
$0e:e396  21 1c         and ($1c,x)
$0e:e398  68            pla
$0e:e399  77 12         adc [$12],y
$0e:e39b  0a            asl a
$0e:e39c  8e 05 f9      stx $f905
$0e:e39f  40            rti
$0e:e3a0  a0 10         ldy #$10
$0e:e3a2  63 b0         adc $b0,s
$0e:e3a4  c1 0f         cmp ($0f,x)
$0e:e3a6  42 c2         wdm #$c2
$0e:e3a8  08            php
$0e:e3a9  0c 0a 07      tsb $070a
$0e:e3ac  04 41         tsb $41
$0e:e3ae  84 1e         sty $1e
$0e:e3b0  10 87         bpl $e339
$0e:e3b2  45 59         eor $59
$0e:e3b4  50 1c         bvc $e3d2
$0e:e3b6  83 e0         sta $e0,s
$0e:e3b8  73 0b         adc ($0b,s),y
$0e:e3ba  8c 1c 60      sty $601c
$0e:e3bd  cc 2a 06      cpy $062a
$0e:e3c0  83 81         sta $81,s
$0e:e3c2  20 f0 44      jsr $44f0
$0e:e3c5  14 e8         trb $e8
$0e:e3c7  c4 08         cpy $08
$0e:e3c9  14 3a         trb $3a
$0e:e3cb  2b            pld
$0e:e3cc  0c 91 47      tsb $4791
$0e:e3cf  a9 13 ea      lda #$ea13
$0e:e3d2  ac db 05      ldy $05db
$0e:e3d5  7e c0 df      ror $dfc0,x
$0e:e3d8  60            rts
$0e:e3d9  07 03         ora [$03]
$0e:e3db  38            sec
$0e:e3dc  81 c4         sta ($c4,x)
$0e:e3de  21 27         and ($27,x)
$0e:e3e0  01 3a         ora ($3a,x)
$0e:e3e2  84 03         sty $03
$0e:e3e4  81 c0         sta ($c0,x)
$0e:e3e6  f8            sed
$0e:e3e7  5c 2f 19 88   jml $88192f
$0e:e3eb  e7 f2         sbc [$f2]
$0e:e3ed  5d 54 8b      eor $8b54,x
$0e:e3f0  63 33         adc $33,s
$0e:e3f2  fa            plx
$0e:e3f3  e0 69         cpx #$69
$0e:e3f5  e0 20         cpx #$20
$0e:e3f7  09 70 e8      ora #$e870
$0e:e3fa  40            rti
$0e:e3fb  3d 10 0b      and $0b10,x
$0e:e3fe  04 01         tsb $01
$0e:e400  fc 10 58      jsr ($5810,x)
$0e:e403  e4 4a         cpx $4a
$0e:e405  7d 09 96      adc $9609,x
$0e:e408  c0 af         cpy #$af
$0e:e40a  70 4b         bvs $e457
$0e:e40c  fc 22 ff      jsr ($ff22,x)
$0e:e40f  80 7d         bra $e48e
$0e:e411  0b            phd
$0e:e412  0c a2 47      tsb $47a2
$0e:e415  c2 10         rep #$10
$0e:e417  9d 02 81      sta $8102,x
$0e:e41a  80 84         bra $e3a0
$0e:e41c  58            cli
$0e:e41d  24 98         bit $98
$0e:e41f  8c e5 53      sty $53e5
$0e:e422  8d 3c ff      sta $ff3c
$0e:e425  43 3f         eor $3f,s
$0e:e427  d1 8f         cmp ($8f),y
$0e:e429  fc 83 ff      jsr ($ff83,x)
$0e:e42c  f0 80         beq $e3ae
$0e:e42e  76 1d         ror $1d,x
$0e:e430  43 38         eor $38,s
$0e:e432  6f 93 7c 60   adc $607c93
$0e:e436  50 27         bvc $e45f
$0e:e438  78            sei
$0e:e439  40            rti
$0e:e43a  a3 d0         lda $d0,s
$0e:e43c  89 f4 52      bit #$52f4
$0e:e43f  6d 1d bf      adc $bf1d
$0e:e442  40            rti
$0e:e443  97 83         sta [$83],y
$0e:e445  83 7f         sta $7f,s
$0e:e447  1b            tcs
$0e:e448  1c a8 34      trb $34a8
$0e:e44b  02 38         cop #$38
$0e:e44d  50 81         bvc $e3d0
$0e:e44f  a1 40         lda ($40,x)
$0e:e451  d8            cld
$0e:e452  4e 32 11      lsr $1132
$0e:e455  8e c4 73      stx $73c4
$0e:e458  b1 0c         lda ($0c),y
$0e:e45a  9a            txs
$0e:e45b  45 b9         eor $b9
$0e:e45d  9d ef 67      sta $67ef,x
$0e:e460  9e 61 f3      stz $f361,x
$0e:e463  4a            lsr a
$0e:e464  92 5c         sta ($5c)
$0e:e466  03 e1         ora $e1,s
$0e:e468  ea            nop
$0e:e469  81 48         sta ($48,x)
$0e:e46b  a0 51 a5      ldy #$a551
$0e:e46e  88            dey
$0e:e46f  40            rti
$0e:e470  a0 30 f5      ldy #$f530
$0e:e473  88            dey
$0e:e474  40            rti
$0e:e475  21 f0         and ($f0,x)
$0e:e477  08            php
$0e:e478  fd 02 7f      sbc $7f02,x
$0e:e47b  41 9f         eor ($9f,x)
$0e:e47d  be c9 c0      ldx $c0c9,y
$0e:e480  0c 10 70      tsb $7010
$0e:e483  04 42         tsb $42
$0e:e485  21 30         and ($30,x)
$0e:e487  43 9c         eor $9c,s
$0e:e489  e2 71         sep #$71
$0e:e48b  6c e7 6d      jmp ($6de7)
$0e:e48e  3c f7 2f      bit $2ff7,x
$0e:e491  1d 37 8b      ora $8b37,x
$0e:e494  a5 db         lda $db
$0e:e496  c2 ff         rep #$ff
$0e:e498  70 3f         bvs $e4d9
$0e:e49a  cc 17 fb      cpy $fb17
$0e:e49d  30 76         bmi $e515
$0e:e49f  0c 72 01      tsb $0172
$0e:e4a2  3a            dec a
$0e:e4a3  80 52         bra $e4f7
$0e:e4a5  00 83         brk #$83
$0e:e4a7  06 66         asl $66
$0e:e4a9  13 fc         ora ($fc,s),y
$0e:e4ab  0e 01 1f      asl $1f01
$0e:e4ae  82 c7 4e      brl $3378
$0e:e4b1  a1 00         lda ($00,x)
$0e:e4b3  9f e0 6f f8   sta $f86fe0,x
$0e:e4b7  23 f0         and $f0,s
$0e:e4b9  af c9 5a 30   lda $305ac9
$0e:e4bd  09 04 82      ora #$8204
$0e:e4c0  c0 cb 13      cpy #$13cb
$0e:e4c3  10 68         bpl $e52d
$0e:e4c5  37 1d         and [$1d],y
$0e:e4c7  8c e5 a3      sty $a3e5
$0e:e4ca  9d e4 e3      sta $e3e4,x
$0e:e4cd  66 b1         ror $b1
$0e:e4cf  74 ab         stz $ab,x
$0e:e4d1  7c 5b ee      jmp ($ee5b,x)
$0e:e4d4  0b            phd
$0e:e4d5  11 10         ora ($10),y
$0e:e4d7  a7 c0         lda [$c0]
$0e:e4d9  4a            lsr a
$0e:e4da  17 48         ora [$48],y
$0e:e4dc  06 42         asl $42
$0e:e4de  01 08         ora ($08,x)
$0e:e4e0  80 7b         bra $e55d
$0e:e4e2  26 94         rol $94
$0e:e4e4  59 8d 2e      eor $2e8d,y
$0e:e4e7  eb            xba
$0e:e4e8  9a            txs
$0e:e4e9  d6 64         dec $64,x
$0e:e4eb  fc 97 9b      jsr ($9b97,x)
$0e:e4ee  66 ee         ror $ee
$0e:e4f0  49 5e 89      eor #$895e
$0e:e4f3  72 e1         adc ($e1)
$0e:e4f5  1c e8 76      trb $76e8
$0e:e4f8  12 0b         ora ($0b)
$0e:e4fa  43 83         eor $83,s
$0e:e4fc  c2 e0         rep #$e0
$0e:e4fe  78            sei
$0e:e4ff  38            sec
$0e:e500  19 7c 3c      ora $3c7c,y
$0e:e503  30 3b         bmi $e540
$0e:e505  5c 63 d9 14   jml $14d963
$0e:e509  a2 c4 75      ldx #$75c4
$0e:e50c  7b            tdc
$0e:e50d  5f 57 f3 47   eor $47f357,x
$0e:e511  b4 c4         ldy $c4,x
$0e:e513  ef 33 79 4f   sbc $4f7933
$0e:e517  3c 03 d7      bit $d703,x
$0e:e51a  08            php
$0e:e51b  f7 43         sbc [$43],y
$0e:e51d  a8            tay
$0e:e51e  90 58         bcc $e578
$0e:e520  1c 1e 97      trb $971e
$0e:e523  03 a1         ora $a1,s
$0e:e525  c0 dc 61      cpy #$61dc
$0e:e528  a4 98         ldy $98
$0e:e52a  5a            phy
$0e:e52b  ab            plb
$0e:e52c  54 28 f6      mvn $f6,$28
$0e:e52f  9a            txs
$0e:e530  bd ba b5      lda $b5ba,x
$0e:e533  66 a9         ror $a9
$0e:e535  12 4b         ora ($4b)
$0e:e537  86 da         stx $da
$0e:e539  a5 ce         lda $ce
$0e:e53b  17 04         ora [$04],y
$0e:e53d  83 c1         sta $c1,s
$0e:e53f  e0 a0 50      cpx #$50a0
$0e:e542  30 9c         bmi $e4e0
$0e:e544  0d 36 03      ora $0336
$0e:e547  1d 80 86      ora $8680,x
$0e:e54a  40            rti
$0e:e54b  2b            pld
$0e:e54c  56 c8         lsr $c8,x
$0e:e54e  5d f2 03      eor $03f2,x
$0e:e551  3c 85 c5      bit $c585,x
$0e:e554  23 d3         and $d3,s
$0e:e556  29 c4 fe      and #$fec4
$0e:e559  67 7c         adc [$7c]
$0e:e55b  c7 dc         cmp [$dc]
$0e:e55d  30 70         bmi $e5cf
$0e:e55f  78            sei
$0e:e560  1c ce 07      trb $07ce
$0e:e563  13 3f         ora ($3f,s),y
$0e:e565  8a            txa
$0e:e566  c0 0d 26      cpy #$260d
$0e:e569  a9 02 68      lda #$6802
$0e:e56c  13 41         ora ($41,s),y
$0e:e56e  da            phx
$0e:e56f  07 54         ora [$54]
$0e:e571  26 84         rol $84
$0e:e573  1e 11 0f      asl $0f11,x
$0e:e576  88            dey
$0e:e577  20 6a 40      jsr $406a
$0e:e57a  c8            iny
$0e:e57b  04 80         tsb $80
$0e:e57d  dc 20 15      jml [$1520]
$0e:e580  04 b1         tsb $b1
$0e:e582  ba            tsx
$0e:e583  c3 c1         cmp $c1,s
$0e:e585  10 4f         bpl $e5d6
$0e:e587  8c 63 e1      sty $e163
$0e:e58a  08            php
$0e:e58b  52 b6         eor ($b6)
$0e:e58d  0a            asl a
$0e:e58e  ff 84 bf e0   sbc $e0bf84,x
$0e:e592  16 43         asl $43,x
$0e:e594  40            rti
$0e:e595  9f c8 23 f1   sta $f123c8,x
$0e:e599  88            dey
$0e:e59a  3c 1c d2      bit $d21c,x
$0e:e59d  8b            phb
$0e:e59e  e9 89 7c      sbc #$7c89
$0e:e5a1  e1 9f         sbc ($9f,x)
$0e:e5a3  f8            sed
$0e:e5a4  2f fa 33 fe   and $fe33fa
$0e:e5a8  91 7f         sta ($7f),y
$0e:e5aa  20 9f 88      jsr $889f
$0e:e5ad  c1 0c         cmp ($0c,x)
$0e:e5af  0e 02 be      asl $be02
$0e:e5b2  c5 99         cmp $99
$0e:e5b4  2c ea c1      bit $c1ea
$0e:e5b7  60            rts
$0e:e5b8  9c 16 42      stz $4216
$0e:e5bb  7f 1f 8f af   adc $af8f1f,x
$0e:e5bf  1f fe 0f 08   ora $080ffe,x
$0e:e5c3  0f f8 26 10   ora $1026f8
$0e:e5c7  26 c2         rol $c2
$0e:e5c9  c1 a0         cmp ($a0,x)
$0e:e5cb  d1 c8         cmp ($c8),y
$0e:e5cd  e7 f3         sbc [$f3]
$0e:e5cf  f9 f8 fc      sbc $fcf8,y
$0e:e5d2  37 04         and [$04],y
$0e:e5d4  d2 6b         cmp ($6b)
$0e:e5d6  14 7a         trb $7a
$0e:e5d8  d4 82         pei ($82)
$0e:e5da  41 10         eor ($10,x)
$0e:e5dc  88            dey
$0e:e5dd  2f a2 31 ff   and $ff31a2
$0e:e5e1  84 34         sty $34
$0e:e5e3  ac 3e 10      ldy $103e
$0e:e5e6  48            pha
$0e:e5e7  24 20         bit $20
$0e:e5e9  ea            nop
$0e:e5ea  06 57         asl $57
$0e:e5ec  77 f0         adc [$f0],y
$0e:e5ee  04 04         tsb $04
$0e:e5f0  20 05 08      jsr $0805
$0e:e5f3  7c 3e 07      jmp ($073e,x)
$0e:e5f6  03 32         ora $32,s
$0e:e5f8  a4 1b         ldy $1b
$0e:e5fa  ff 04 69 0c   sbc $0c6904,x
$0e:e5fe  24 2c         bit $2c
$0e:e600  e2 b2         sep #$b2
$0e:e602  31 87         and ($87),y
$0e:e604  c3 e0         cmp $e0,s
$0e:e606  27 65         and [$65]
$0e:e608  77 af         adc [$af],y
$0e:e60a  b6 0d         ldx $0d,y
$0e:e60c  f3 85         sbc ($85,s),y
$0e:e60e  7e e1 9f      ror $9fe1,x
$0e:e611  e8            inx
$0e:e612  47 fa         eor [$fa]
$0e:e614  15 fc         ora $fc,x
$0e:e616  89 06         bit #$06
$0e:e618  05 48         ora $48
$0e:e61a  10 c8         bpl $e5e4
$0e:e61c  04 10         tsb $10
$0e:e61e  ca            dex
$0e:e61f  64 30         stz $30
$0e:e621  0e 07 03      asl $0307
$0e:e624  80 a1         bra $e5c7
$0e:e626  0b            phd
$0e:e627  fc 43 4f      jsr ($4f43,x)
$0e:e62a  88            dey
$0e:e62b  af f6 35 fc   lda $fc35f6
$0e:e62f  4f dc 82 97   eor $9782dc
$0e:e633  20 9f c0      jsr $c09f
$0e:e636  07 a0         ora [$a0]
$0e:e638  1d 0b 84      ora $840b,x
$0e:e63b  02 41         cop #$41
$0e:e63d  c0 8c         cpy #$8c
$0e:e63f  77 23         adc [$23],y
$0e:e641  93 c0         sta ($c0,s),y
$0e:e643  38            sec
$0e:e644  0a            asl a
$0e:e645  ca            dex
$0e:e646  fd 12 f3      sbc $f312,x
$0e:e649  e2 35         sep #$35
$0e:e64b  f8            sed
$0e:e64c  8e bd 02      stx $02bd
$0e:e64f  df 28 b7 c1   cmp $c1b728,x
$0e:e653  27 72         and [$72]
$0e:e655  08            php
$0e:e656  5c 83 c3 03   jml $03c383
$0e:e65a  00 80         brk #$80
$0e:e65c  04 27         tsb $27
$0e:e65e  0e 60 27      asl $2760
$0e:e661  02 04         cop #$04
$0e:e663  01 03         ora ($03,x)
$0e:e665  ce de 67      dec $67de
$0e:e668  ab            plb
$0e:e669  5c 4a 77 72   jml $72774a
$0e:e66d  a5 f2         lda $f2
$0e:e66f  87 7e         sta [$7e]
$0e:e671  a2 df         ldx #$df
$0e:e673  c8            iny
$0e:e674  07 c0         ora [$c0]
$0e:e676  da            phx
$0e:e677  32 0b         and ($0b)
$0e:e679  84 c2         sty $c2
$0e:e67b  f1 20         sbc ($20),y
$0e:e67d  b9 40 21      lda $2140,y
$0e:e680  d0 08         bne $e68a
$0e:e682  b1 ac         lda ($ac),y
$0e:e684  b1 f7         lda ($f7),y
$0e:e686  0c ff 83      tsb $83ff
$0e:e689  df f0 df f4   cmp $f4dff0,x
$0e:e68d  3f f0 07 d9   and $d907f0,x
$0e:e691  02 c6         cop #$c6
$0e:e693  80 fe         bra $e693
$0e:e695  11 e8         ora ($e8),y
$0e:e697  74 01         stz $01,x
$0e:e699  64 0b         stz $0b
$0e:e69b  28            plp
$0e:e69c  49 b8         eor #$b8
$0e:e69e  e0 af         cpx #$af
$0e:e6a0  c1 85         cmp ($85,x)
$0e:e6a2  40            rti
$0e:e6a3  25 12         and $12
$0e:e6a5  09 14         ora #$14
$0e:e6a7  82 1f 10      brl $f6c9
$0e:e6aa  3f 94 1e 30   and $301e94,x
$0e:e6ae  85 08         sta $08
$0e:e6b0  54 56 51      mvn $51,$56
$0e:e6b3  17 91         ora [$91],y
$0e:e6b5  47 66         eor [$66]
$0e:e6b7  10 04         bpl $e6bd
$0e:e6b9  78            sei
$0e:e6ba  48            pha
$0e:e6bb  12 43         ora ($43)
$0e:e6bd  60            rts
$0e:e6be  32 8f         and ($8f)
$0e:e6c0  d2 09         cmp ($09)
$0e:e6c2  e4 82         cpx $82
$0e:e6c4  7c 1b a1      jmp ($a11b,x)
$0e:e6c7  08            php
$0e:e6c8  f0 46         beq $e710
$0e:e6ca  14 65         trb $65
$0e:e6cc  d0 94         bne $e662
$0e:e6ce  7d 21 1e      adc $1e21,x
$0e:e6d1  48            pha
$0e:e6d2  c4 02         cpy $02
$0e:e6d4  79 24 f3      adc $f324,y
$0e:e6d7  d6 38         dec $38,x
$0e:e6d9  12 6f         ora ($6f)
$0e:e6db  16 63         asl $63,x
$0e:e6dd  b3 25         lda ($25,s),y
$0e:e6df  de 50 ff      dec $ff50,x
$0e:e6e2  f8            sed
$0e:e6e3  02 b8         cop #$b8
$0e:e6e5  0a            asl a
$0e:e6e6  00 b0         brk #$b0
$0e:e6e8  31 d8         and ($d8),y
$0e:e6ea  04 9a         tsb $9a
$0e:e6ec  01 43         ora ($43,x)
$0e:e6ee  33 b4         and ($b4,s),y
$0e:e6f0  02 03         cop #$03
$0e:e6f2  01 82         ora ($82,x)
$0e:e6f4  c1 a1         cmp ($a1,x)
$0e:e6f6  71 2a         adc ($2a),y
$0e:e6f8  ac 66 df      ldy $df66
$0e:e6fb  48            pha
$0e:e6fc  96 dd         stx $dd,y
$0e:e6fe  19 e7 02      ora $02e7,y
$0e:e701  83 46         sta $46,s
$0e:e703  62 50 d8      per $bf56
$0e:e706  cd 9a 93      cmp $939a
$0e:e709  36 bb         rol $bb,x
$0e:e70b  c2 20         rep #$20
$0e:e70d  d0 48         bne $e757
$0e:e70f  0c 2e 85      tsb $852e
$0e:e712  e6 82         inc $82
$0e:e714  c7 37         cmp [$37]
$0e:e716  71 8d         adc ($8d),y
$0e:e718  3c 42 bf      bit $bf42,x
$0e:e71b  18            clc
$0e:e71c  f9 c4 20      sbc $20c4,y
$0e:e71f  70 88         bvs $e6a9
$0e:e721  64 03         stz $03
$0e:e723  c3 00         cmp $00,s
$0e:e725  89 f8 22      bit #$22f8
$0e:e728  fe 08 ff      inc $ff08,x
$0e:e72b  83 cf         sta $cf,s
$0e:e72d  00 f7         brk #$f7
$0e:e72f  b8            clv
$0e:e730  4a            lsr a
$0e:e731  00 11         brk #$11
$0e:e733  48            pha
$0e:e734  1c 02 16      trb $1602
$0e:e737  c4 08         cpy $08
$0e:e739  60            rts
$0e:e73a  40            rti
$0e:e73b  43 21         eor $21,s
$0e:e73d  03 81         ora $81,s
$0e:e73f  40            rti
$0e:e740  44 43 00      mvp $00,$43
$0e:e743  87 c3         sta [$c3]
$0e:e745  22 71 c2 58   jsl $58c271
$0e:e749  58            cli
$0e:e74a  38            sec
$0e:e74b  1c 0c 04      trb $040c
$0e:e74e  83 61         sta $61,s
$0e:e750  d0 b0         bne $e702
$0e:e752  7a            ply
$0e:e753  31 15         and ($15),y
$0e:e755  08            php
$0e:e756  c7 f2         cmp [$f2]
$0e:e758  48            pha
$0e:e759  5d 0e 04      eor $040e,x
$0e:e75c  83 01         sta $01,s
$0e:e75e  60            rts
$0e:e75f  d8            cld
$0e:e760  52 2c         eor ($2c)
$0e:e762  19 8c 45      ora $458c,y
$0e:e765  c3 31         cmp $31,s
$0e:e767  64 56         stz $56
$0e:e769  84 8a         sty $8a
$0e:e76b  05 11         ora $11
$0e:e76d  78            sei
$0e:e76e  04 12         tsb $12
$0e:e770  13 04         ora ($04,s),y
$0e:e772  8d c4 a0      sta $a0c4
$0e:e775  b1 29         lda ($29),y
$0e:e777  b4 a8         ldy $a8,x
$0e:e779  aa            tax
$0e:e77a  10 29         bpl $e7a5
$0e:e77c  0c 12 26      tsb $2612
$0e:e77f  56 02         lsr $02,x
$0e:e781  b0 c3         bcs $e746
$0e:e783  5c e1 2b 8a   jml $8a2be1
$0e:e787  21 c1         and ($c1,x)
$0e:e789  96 90         stx $90,y
$0e:e78b  48            pha
$0e:e78c  24 a2         bit $a2
$0e:e78e  65 57         adc $57
$0e:e790  89 4b e1      bit #$e14b
$0e:e793  51 30         eor ($30),y
$0e:e795  88            dey
$0e:e796  1c 12 11      trb $1112
$0e:e799  32 e6         and ($e6)
$0e:e79b  c4 bd         cpy $bd
$0e:e79d  b0 ab         bcs $e74a
$0e:e79f  ac ea 0a      ldy $0aea
$0e:e7a2  cb            wai
$0e:e7a3  6c 06 02      jmp ($0206)
$0e:e7a6  a1 50         lda ($50,x)
$0e:e7a8  b0 50         bcs $e7fa
$0e:e7aa  36 99         rol $99,x
$0e:e7ac  44 7b c0      mvp $c0,$7b
$0e:e7af  2a            rol a
$0e:e7b0  1a            inc a
$0e:e7b1  0a            asl a
$0e:e7b2  06 c3         asl $c3
$0e:e7b4  29 68 65      and #$6568
$0e:e7b7  a4 0a         ldy $0a
$0e:e7b9  05 05         ora $05
$0e:e7bb  29 80 8c      and #$8c80
$0e:e7be  21 50         and ($50,x)
$0e:e7c0  68            pla
$0e:e7c1  72 bd         adc ($bd)
$0e:e7c3  5e 01 06      lsr $0601,x
$0e:e7c6  80 41         bra $e809
$0e:e7c8  e1 50         sbc ($50,x)
$0e:e7ca  58            cli
$0e:e7cb  6c 02 80      jmp ($8002)
$0e:e7ce  ce 15 29      dec $2915
$0e:e7d1  74 28         stz $28,x
$0e:e7d3  12 8a         ora ($8a)
$0e:e7d5  47 5f         eor [$5f]
$0e:e7d7  39 88 90      and $9088,y
$0e:e7da  33 8f         and ($8f,s),y
$0e:e7dc  81 00         sta ($00,x)
$0e:e7de  ec 50 37      cpx $3750
$0e:e7e1  14 8d         trb $8d
$0e:e7e3  86 72         stx $72
$0e:e7e5  c7 a0         cmp [$a0]
$0e:e7e7  af 40 e0 70   lda $70e040
$0e:e7eb  58            cli
$0e:e7ec  24 2e         bit $2e
$0e:e7ee  10 f3         bpl $e7e3
$0e:e7f0  08            php
$0e:e7f1  9c 42 c3      stz $c342
$0e:e7f4  70 c8         bvs $e7be
$0e:e7f6  64 2d         stz $2d
$0e:e7f8  10 85         bpl $e77f
$0e:e7fa  08            php
$0e:e7fb  06 42         asl $42
$0e:e7fd  0e 02 18      asl $1802
$0e:e800  78            sei
$0e:e801  18            clc
$0e:e802  6d f0 0f      adc $0ff0
$0e:e805  ba            tsx
$0e:e806  84 5d         sty $5d
$0e:e808  e9 6b bc      sbc #$bc6b
$0e:e80b  64 f2         stz $f2
$0e:e80d  17 18         ora [$18],y
$0e:e80f  83 f4         sta $f4,s
$0e:e811  9f ec 0b 0f   sta $0f0bec,x
$0e:e815  78            sei
$0e:e816  30 d2         bmi $e7ea
$0e:e818  e1 40         sbc ($40,x)
$0e:e81a  a0 68         ldy #$68
$0e:e81c  24 03         bit $03
$0e:e81e  50 c8         bvc $e7e8
$0e:e820  44 20 11      mvp $11,$20
$0e:e823  08            php
$0e:e824  e4 71         cpx $71
$0e:e826  42 4d         wdm #$4d
$0e:e828  50 72         bvc $e89c
$0e:e82a  03 90         ora $90,s
$0e:e82c  3c 04 83      bit $8304,x
$0e:e82f  50 87         bvc $e7b8
$0e:e831  42 e7         wdm #$e7
$0e:e833  52 93         eor ($93)
$0e:e835  41 21         eor ($21,x)
$0e:e837  96 4f         stx $4f,y
$0e:e839  e6 b3         inc $b3
$0e:e83b  79 ce ff      adc $ffce,y
$0e:e83e  63 f3         adc $f3,s
$0e:e840  ea            nop
$0e:e841  51 f8         eor ($f8),y
$0e:e843  74 7e         stz $7e,x
$0e:e845  17 3b         ora [$3b],y
$0e:e847  80 04         bra $e84d
$0e:e849  28            plp
$0e:e84a  70 08         bvs $e854
$0e:e84c  0c 02 c1      tsb $c102
$0e:e84f  00 5b         brk #$5b
$0e:e851  84 36         sty $36
$0e:e853  03 09         ora $09,s
$0e:e855  80 c2         bra $e819
$0e:e857  e0 67         cpx #$67
$0e:e859  52 8c         eor ($8c)
$0e:e85b  c4 63         cpy $63
$0e:e85d  91 08         sta ($08),y
$0e:e85f  3c 26 1f      bit $1f26,x
$0e:e862  11 40         ora ($40),y
$0e:e864  8c 4d 0a      sty $0a4d
$0e:e867  51 f8         eor ($f8),y
$0e:e869  0c 7e 01      tsb $017e
$0e:e86c  09 80 33      ora #$3380
$0e:e86f  40            rti
$0e:e870  12 12         ora ($12)
$0e:e872  e9 04 ae      sbc #$ae04
$0e:e875  41 23         eor ($23,x)
$0e:e877  90 4c         bcc $e8c5
$0e:e879  a6 13         ldx $13
$0e:e87b  49 a4 3e      eor #$3ea4
$0e:e87e  20 9f 29      jsr $299f
$0e:e881  74 46         stz $46,x
$0e:e883  57 14         eor [$14],y
$0e:e885  91 c7         sta ($c7),y
$0e:e887  26 50         rol $50
$0e:e889  d9 a4 2e      cmp $2ea4,y
$0e:e88c  01 3c         ora ($3c,x)
$0e:e88e  92 79         sta ($79)
$0e:e890  eb            xba
$0e:e891  7c 39 4f      jmp ($4f39,x)
$0e:e894  87 1b         sta [$1b]
$0e:e896  e1 a6         sbc ($a6,x)
$0e:e898  d8            cld
$0e:e899  3a            dec a
$0e:e89a  7e 19 67      ror $6719,x
$0e:e89d  b4 9c         ldy $9c,x
$0e:e89f  11 85         ora ($85),y
$0e:e8a1  78            sei
$0e:e8a2  40            rti
$0e:e8a3  23 cc         and $cc,s
$0e:e8a5  41 2f         eor ($2f,x)
$0e:e8a7  03 14         ora $14,s
$0e:e8a9  22 42 60 c0   jsl $c06042
$0e:e8ad  5f 8d 41 01   eor $01418d,x
$0e:e8b1  81 b4         sta ($b4,x)
$0e:e8b3  c0 9c         cpy #$9c
$0e:e8b5  2d 82 c7      and $c782
$0e:e8b8  dc 23 fe      jml [$fe23]
$0e:e8bb  08            php
$0e:e8bc  14 0d         trb $0d
$0e:e8be  c6 0d         dec $0d
$0e:e8c0  66 af         ror $af
$0e:e8c2  d5 21         cmp $21,x
$0e:e8c4  d1 23         cmp ($23),y
$0e:e8c6  f8            sed
$0e:e8c7  42 a1         wdm #$a1
$0e:e8c9  90 78         bcc $e943
$0e:e8cb  64 0e         stz $0e
$0e:e8cd  08            php
$0e:e8ce  e4 02         cpx $02
$0e:e8d0  70 62         bvs $e934
$0e:e8d2  d2 03         cmp ($03)
$0e:e8d4  06 80         asl $80
$0e:e8d6  41 20         eor ($20,x)
$0e:e8d8  a6 a1         ldx $a1
$0e:e8da  72 01         adc ($01)
$0e:e8dc  ac 1a e2      ldy $e21a
$0e:e8df  d6 21         dec $21,x
$0e:e8e1  38            sec
$0e:e8e2  47 20         eor [$20]
$0e:e8e4  92 f9         sta ($f9)
$0e:e8e6  44 ee 11      mvp $11,$ee
$0e:e8e9  5c 92 35 d1   jml $d13592
$0e:e8ed  26 11         rol $11
$0e:e8ef  b0 a0         bcs $e891
$0e:e8f1  44 22 f6      mvp $f6,$22
$0e:e8f4  09 df 03      ora #$03df
$0e:e8f7  61 04         adc ($04,x)
$0e:e8f9  e2 41         sep #$41
$0e:e8fb  3e 1c 4d      rol $4d1c,x
$0e:e8fe  04 e2         tsb $e2
$0e:e900  d1 08         cmp ($08),y
$0e:e902  fa            plx
$0e:e903  c1 ff         cmp ($ff,x)
$0e:e905  30 2f         bmi $e936
$0e:e907  9c 0b 89      stz $890b
$0e:e90a  38            sec
$0e:e90b  1f 84 12 71   ora $711284,x
$0e:e90f  d8            cld
$0e:e910  80 7c         bra $e98e
$0e:e912  20 3f a8      jsr $a83f
$0e:e915  07 f4         ora [$f4]
$0e:e917  94 26         sty $26,x
$0e:e919  b0 91         bcs $e8ac
$0e:e91b  48            pha
$0e:e91c  29 12 08      and #$0812
$0e:e91f  e5 33         sbc $33
$0e:e921  eb            xba
$0e:e922  1d a3 58      ora $58a3,x
$0e:e925  37 30         and [$30],y
$0e:e927  1a            inc a
$0e:e928  c3 44         cmp $44,s
$0e:e92a  64 14         stz $14
$0e:e92c  e9 05 72      sbc #$7205
$0e:e92f  99 b0 8e      sta $8eb0,y
$0e:e932  f8            sed
$0e:e933  bc 11 fc      ldy $fc11,x
$0e:e936  0d fb fd      ora $fdfb
$0e:e939  00 8e         brk #$8e
$0e:e93b  a4 85         ldy $85
$0e:e93d  26 11         rol $11
$0e:e93f  48            pha
$0e:e940  24 41         bit $41
$0e:e942  b0 b1         bcs $e8f5
$0e:e944  e8            inx
$0e:e945  09 c4 61      ora #$61c4
$0e:e948  11 98         ora ($98),y
$0e:e94a  e4 40         cpx $40
$0e:e94c  ee bc cc      inc $ccbc
$0e:e94f  24 42         bit $42
$0e:e951  09 cc 8e      ora #$8ecc
$0e:e954  5c 26 16 ca   jml $ca1626
$0e:e958  05 72         ora $72
$0e:e95a  01 dc         ora ($dc,x)
$0e:e95c  c0 5e         cpy #$5e
$0e:e95e  24 18         bit $18
$0e:e960  4b            phk
$0e:e961  c2 7c         rep #$7c
$0e:e963  3e 08 e0      rol $e008,x
$0e:e966  61 0d         adc ($0d,x)
$0e:e968  f1 50         sbc ($50),y
$0e:e96a  3d c8 04      and $04c8,x
$0e:e96d  2e 11 13      rol $1311
$0e:e970  8f 40 e0 71   sta $71e040
$0e:e974  a8            tay
$0e:e975  1c 6e 07      trb $076e
$0e:e978  12 5c         ora ($5c)
$0e:e97a  0c 7e 2e      tsb $2e7e
$0e:e97d  15 02         ora $02,x
$0e:e97f  78            sei
$0e:e980  47 18         eor [$18]
$0e:e982  4f 09 3a 05   eor $053a09
$0e:e986  12 61         ora ($61)
$0e:e988  30 9c         bmi $e926
$0e:e98a  42 32         wdm #$32
$0e:e98c  0a            asl a
$0e:e98d  30 80         bmi $e90f
$0e:e98f  50 38         bvc $e9c9
$0e:e991  1c 0c 06      trb $060c
$0e:e994  42 20         wdm #$20
$0e:e996  41 0d         eor ($0d,x)
$0e:e998  85 03         sta $03
$0e:e99a  11 70         ora ($70),y
$0e:e99c  b8            clv
$0e:e99d  42 0f         wdm #$0f
$0e:e99f  81 c0         sta ($c0,x)
$0e:e9a1  80 60         bra $ea03
$0e:e9a3  28            plp
$0e:e9a4  11 0f         ora ($0f),y
$0e:e9a6  02 8c         cop #$8c
$0e:e9a8  0d e1 ab      ora $abe1
$0e:e9ab  d0 54         bne $ea01
$0e:e9ad  fe 1d ff      inc $ff1d,x
$0e:e9b0  e5 a7         sbc $a7
$0e:e9b2  b1 c9         lda ($c9),y
$0e:e9b4  9c 6d 2e      stz $2e6d
$0e:e9b7  9f f8 03 fc   sta $fc03f8,x
$0e:e9bb  2b            pld
$0e:e9bc  e2 41         sep #$41
$0e:e9be  81 8a         sta ($8a,x)
$0e:e9c0  00 10         brk #$10
$0e:e9c2  30 b8         bmi $e97c
$0e:e9c4  06 93         asl $93
$0e:e9c6  09 90 c0      ora #$c090
$0e:e9c9  5b            tcd
$0e:e9ca  7c 19 bf      jmp ($bf19,x)
$0e:e9cd  87 4e         sta [$4e]
$0e:e9cf  61 ff         adc ($ff,x)
$0e:e9d1  8e 7a 63      stx $637a
$0e:e9d4  01 b0         ora ($b0,x)
$0e:e9d6  bd c0 2f      lda $2fc0,x
$0e:e9d9  f0 08         beq $e9e3
$0e:e9db  f9 c0 c0      sbc $c0c0,y
$0e:e9de  e9 2a 91      sbc #$912a
$0e:e9e1  30 c1         bmi $e9a4
$0e:e9e3  52 16         eor ($16)
$0e:e9e5  28            plp
$0e:e9e6  14 22         trb $22
$0e:e9e8  15 ea         ora $ea,x
$0e:e9ea  bd 4a a7      lda $a74a,x
$0e:e9ed  54 4b f2      mvn $f2,$4b
$0e:e9f0  b4 0d         ldy $0d,x
$0e:e9f2  a0 6d 0f      ldy #$0f6d
$0e:e9f5  e4 03         cpx $03
$0e:e9f7  e9 00 c2      sbc #$c200
$0e:e9fa  40            rti
$0e:e9fb  38            sec
$0e:e9fc  8e a0 80      stx $80a0
$0e:e9ff  59 e1 f2      eor $f2e1,y
$0e:ea02  38            sec
$0e:ea03  1e 23 01      asl $0123,x
$0e:ea06  6a            ror a
$0e:ea07  b0 44         bcs $ea4d
$0e:ea09  e2 16         sep #$16
$0e:ea0b  18            clc
$0e:ea0c  87 62         sta [$62]
$0e:ea0e  71 a0         adc ($a0),y
$0e:ea10  b0 3b         bcs $ea4d
$0e:ea12  c0 8a         cpy #$8a
$0e:ea14  02 16         cop #$16
$0e:ea16  5f 80 8c 22   eor $228c80,x
$0e:ea1a  d1 08         cmp ($08),y
$0e:ea1c  bc 42 17      ldy $1742,x
$0e:ea1f  18            clc
$0e:ea20  84 46         sty $46
$0e:ea22  20 d0 e8      jsr $e8d0
$0e:ea25  0a            asl a
$0e:ea26  fc 0f 63      jsr ($630f,x)
$0e:ea29  17 84         ora [$84],y
$0e:ea2b  1f c2 37 04   ora $0437c2,x
$0e:ea2f  8c 41 cf      sty $cf41
$0e:ea32  0a            asl a
$0e:ea33  ce 09 a4      dec $a409
$0e:ea36  72 79         adc ($79)
$0e:ea38  1e 9f 42      asl $429f,x
$0e:ea3b  e3 f0         sbc $f0,s
$0e:ea3d  28            plp
$0e:ea3e  fc 04 0a      jsr ($0a04,x)
$0e:ea41  50 09         bvc $ea4c
$0e:ea43  a4 2e         ldy $2e
$0e:ea45  79 03 9f      adc $9f03,y
$0e:ea48  40            rti
$0e:ea49  44 60 23      mvp $23,$60
$0e:ea4c  24 e0         bit $e0
$0e:ea4e  c0 25         cpy #$25
$0e:ea50  b2 c8         lda ($c8)
$0e:ea52  7c 82 77      jmp ($7782,x)
$0e:ea55  29 95 c1      and #$c195
$0e:ea58  67 c2         adc [$c2]
$0e:ea5a  30 45         bmi $eaa1
$0e:ea5c  1c 4c 48      trb $484c
$0e:ea5f  11 09         ora ($09),y
$0e:ea61  24 42         bit $42
$0e:ea63  09 34 8c      ora #$8c34
$0e:ea66  48            pha
$0e:ea67  17 28         ora [$28],y
$0e:ea69  7b            tdc
$0e:ea6a  28            plp
$0e:ea6b  08            php
$0e:ea6c  18            clc
$0e:ea6d  20 2d 60      jsr $602d
$0e:ea70  bf 02 83 01   lda $018302,x
$0e:ea74  2d ba 33      and $33ba
$0e:ea77  ce 03 02      dec $0203
$0e:ea7a  81 b9         sta ($b9,x)
$0e:ea7c  42 3f         wdm #$3f
$0e:ea7e  e0 c7         cpx #$c7
$0e:ea80  dc 2e f0      jml [$f02e]
$0e:ea83  86 88         stx $88
$0e:ea85  c1 20         cmp ($20,x)
$0e:ea87  50 98         bvc $ea21
$0e:ea89  34 0a         bit $0a,x
$0e:ea8b  1b            tcs
$0e:ea8c  04 87         tsb $87
$0e:ea8e  c1 28         cmp ($28,x)
$0e:ea90  74 0f         stz $0f,x
$0e:ea92  fc 61 a4      jsr ($a461,x)
$0e:ea95  47 a0         eor [$a0]
$0e:ea97  86 c0         stx $c0
$0e:ea99  21 60         and ($60,x)
$0e:ea9b  61 c7         adc ($c7,x)
$0e:ea9d  c0 3c         cpy #$3c
$0e:ea9f  f0 0e         beq $eaaf
$0e:eaa1  3c c2 19      bit $19c2,x
$0e:eaa4  34 74         bit $74,x
$0e:eaa6  03 68         ora $68,s
$0e:eaa8  1c 24 9d      trb $9d24
$0e:eaab  08            php
$0e:eaac  ec 32 3f      cpx $3f32
$0e:eaaf  d0 55         bne $eb06
$0e:eab1  93 35         sta ($35,s),y
$0e:eab3  a2 71         ldx #$71
$0e:eab5  ce 24 1a      dec $1a24
$0e:eab8  36 e9         rol $e9,x
$0e:eaba  0f d6 43 f1   ora $f143d6
$0e:eabe  b0 82         bcs $ea42
$0e:eac0  71 20         adc ($20),y
$0e:eac2  83 70         sta $70,s
$0e:eac4  fe 49 3f      inc $3f49,x
$0e:eac7  30 0f         bmi $ead8
$0e:eac9  0c 02 05      tsb $0502
$0e:eacc  01 9c         ora ($9c,x)
$0e:eace  40            rti
$0e:eacf  38            sec
$0e:ead0  93 82         sta ($82,s),y
$0e:ead2  39 79 23      and $2379,y
$0e:ead5  1f 0c 04 af   ora $af040c,x
$0e:ead9  c1 c0         cmp ($c0,x)
$0e:eadb  98            tya
$0e:eadc  60            rts
$0e:eadd  30 0c         bmi $eaeb
$0e:eadf  96 c0         stx $c0,y
$0e:eae1  5f 3c 11 f9   eor $f9113c,x
$0e:eae5  87 03         sta [$03]
$0e:eae7  01 60         ora ($60,x)
$0e:eae9  64 c4         stz $c4
$0e:eaeb  12 01         ora ($01)
$0e:eaed  0a            asl a
$0e:eaee  84 41         sty $41
$0e:eaf0  61 90         adc ($90,x)
$0e:eaf2  a8            tay
$0e:eaf3  14 5a         trb $5a
$0e:eaf5  21 07         and ($07,x)
$0e:eaf7  87 85         sta [$85]
$0e:eaf9  86 19         stx $19
$0e:eafb  00 87         brk #$87
$0e:eafd  3d 02 1a      and $1a02,x
$0e:eb00  e7 08         sbc [$08]
$0e:eb02  e4 42         cpx $42
$0e:eb04  1e a9 05      asl $05a9,x
$0e:eb07  40            rti
$0e:eb08  ae 8f 31      ldx $318f
$0e:eb0b  00 f0         brk #$f0
$0e:eb0d  40            rti
$0e:eb0e  3e 11 03      rol $0311,x
$0e:eb11  30 25         bmi $eb38
$0e:eb13  c1 1e         cmp ($1e,x)
$0e:eb15  a4 e0         ldy $e0
$0e:eb17  98            tya
$0e:eb18  78            sei
$0e:eb19  22 09 70 b8   jsl $b87009
$0e:eb1d  15 9e         ora $9e,x
$0e:eb1f  39 0e 85      and $850e,y
$0e:eb22  43 22         eor $22,s
$0e:eb24  71 88         adc ($88),y
$0e:eb26  0b            phd
$0e:eb27  f8            sed
$0e:eb28  13 cb         ora ($cb,s),y
$0e:eb2a  10 80         bpl $eaac
$0e:eb2c  c4 c2         cpy $c2
$0e:eb2e  a2 21         ldx #$21
$0e:eb30  89 02 60      bit #$6002
$0e:eb33  26 14         rol $14
$0e:eb35  0a            asl a
$0e:eb36  06 e0         asl $e0
$0e:eb38  cf 0a 70 e0   cmp $e0700a
$0e:eb3c  70 27         bvs $eb65
$0e:eb3e  05 f0         ora $f0
$0e:eb40  d0 58         bne $eb9a
$0e:eb42  36 3d         rol $3d,x
$0e:eb44  1b            tcs
$0e:eb45  b7 bf         lda [$bf],y
$0e:eb47  df 70 bf c0   cmp $c0bf70,x
$0e:eb4b  27 e8         and [$e8]
$0e:eb4d  d3 0a         cmp ($0a,s),y
$0e:eb4f  04 3b         tsb $3b
$0e:eb51  81 00         sta ($00,x)
$0e:eb53  01 05         ora ($05,x)
$0e:eb55  c0 ce         cpy #$ce
$0e:eb57  dd 49 a3      cmp $a349,x
$0e:eb5a  bc 34 36      ldy $3634,x
$0e:eb5d  18            clc
$0e:eb5e  e5 ff         sbc $ff
$0e:eb60  7f a0 d7 cc   adc $ccd7a0,x
$0e:eb64  1f 25 0b 7f   ora $7f0b25,x
$0e:eb68  0c 78 bc      tsb $bc78
$0e:eb6b  1c 0a 00      trb $000a
$0e:eb6e  98            tya
$0e:eb6f  00 c7         brk #$c7
$0e:eb71  10 8f         bpl $eb02
$0e:eb73  4c a7 9c      jmp $9ca7
$0e:eb76  ef 85 fb 01   sbc $01fb85
$0e:eb7a  fe 80 7f      inc $7f80,x
$0e:eb7d  20 1f 84      jsr $841f
$0e:eb80  e0 f8         cpx #$f8
$0e:eb82  20 5c 03      jsr $035c
$0e:eb85  88            dey
$0e:eb86  10 e6         bpl $eb6e
$0e:eb88  23 f1         and $f1,s
$0e:eb8a  d7 7f         cmp [$7f],y
$0e:eb8c  ef ff 07 ac   sbc $ac07ff
$0e:eb90  43 95         eor $95,s
$0e:eb92  c0 02         cpy #$02
$0e:eb94  b9 3c 80      lda $803c,y
$0e:eb97  de 14 3a      dec $3a14,x
$0e:eb9a  05 2e         ora $2e
$0e:eb9c  90 73         bcc $ec11
$0e:eb9e  0a            asl a
$0e:eb9f  4d 22 51      eor $5122
$0e:eba2  68            pla
$0e:eba3  3d 84 9e      and $9e84,x
$0e:eba6  30 7f         bmi $ec27
$0e:eba8  0a            asl a
$0e:eba9  1c f2 97      trb $97f2
$0e:ebac  34 41         bit $41,x
$0e:ebae  85 26         sta $26
$0e:ebb0  6d 68 8b      adc $8b68
$0e:ebb3  a2 c2         ldx #$c2
$0e:ebb5  59 6c 9e      eor $9e6c,y
$0e:ebb8  df 62 f7 f8   cmp $f8f762,x
$0e:ebbc  b4 fe         ldy $fe,x
$0e:ebbe  0f 3f 81 88   ora $88813f
$0e:ebc2  41 f6         eor ($f6,x)
$0e:ebc4  10 3b         bpl $ec01
$0e:ebc6  64 4e         stz $4e
$0e:ebc8  fb            xce
$0e:ebc9  02 7b         cop #$7b
$0e:ebcb  93 e4         sta ($e4,s),y
$0e:ebcd  13 46         ora ($46,s),y
$0e:ebcf  d2 3d         cmp ($3d)
$0e:ebd1  b6 03         ldx $03,y
$0e:ebd3  a1 10         lda ($10,x)
$0e:ebd5  a3 50         lda $50,s
$0e:ebd7  bf 91 2f c4   lda $c42f91,x
$0e:ebdb  4b            phk
$0e:ebdc  d8            cld
$0e:ebdd  42 3b         wdm #$3b
$0e:ebdf  c4 1b         cpy $1b
$0e:ebe1  c9 0a df      cmp #$df0a
$0e:ebe4  40            rti
$0e:ebe5  3d 8c 81      and $818c,x
$0e:ebe8  1d 85 be      ora $be85,x
$0e:ebeb  91 55         sta ($55),y
$0e:ebed  8c c2 e2      sty $e2c2
$0e:ebf0  50 58         bvc $ec4a
$0e:ebf2  34 06         bit $06,x
$0e:ebf4  02 49         cop #$49
$0e:ebf6  44 48 46      mvp $46,$48
$0e:ebf9  6c d1 28      jmp ($28d1)
$0e:ebfc  6c 1a 33      jmp ($331a)
$0e:ebff  01 81         ora ($81,x)
$0e:ec01  12 52         ora ($52)
$0e:ec03  af 10 d7 c6   lda $c6d710
$0e:ec07  37 71         and [$71],y
$0e:ec09  88            dey
$0e:ec0a  24 72         bit $72
$0e:ec0c  87 e7         sta [$e7]
$0e:ec0e  82 c1 db      brl $c7d2
$0e:ec11  01 0f         ora ($0f,x)
$0e:ec13  86 7b         stx $7b
$0e:ec15  e0 11         cpx #$11
$0e:ec17  7f 00 04 22   adc $220400,x
$0e:ec1b  7e 01 e8      ror $e801,x
$0e:ec1e  13 42         ora ($42,s),y
$0e:ec20  0e 1e 10      asl $101e
$0e:ec23  68            pla
$0e:ec24  2b            pld
$0e:ec25  41 d0         eor ($d0,x)
$0e:ec27  01 34         ora ($34,x)
$0e:ec29  80 36         bra $ec61
$0e:ec2b  05 fa         ora $fa
$0e:ec2d  0a            asl a
$0e:ec2e  d0 08         bne $ec38
$0e:ec30  8b            phb
$0e:ec31  60            rts
$0e:ec32  04 22         tsb $22
$0e:ec34  e7 2a         sbc [$2a]
$0e:ec36  84 63         sty $63
$0e:ec38  d1 88         cmp ($88),y
$0e:ec3a  e8            inx
$0e:ec3b  58            cli
$0e:ec3c  24 1b         bit $1b
$0e:ec3e  0e 06 02      asl $0206
$0e:ec41  c0 62         cpy #$62
$0e:ec43  07 48         ora [$48]
$0e:ec45  e6 2c         inc $2c
$0e:ec47  98            tya
$0e:ec48  8b            phb
$0e:ec49  85 83         sta $83
$0e:ec4b  31 b0         and ($b0),y
$0e:ec4d  a4 0e         ldy $0e
$0e:ec4f  06 40         asl $40
$0e:ec51  e9 28 cc      sbc #$cc28
$0e:ec54  52 6b         eor ($6b)
$0e:ec56  2a            rol a
$0e:ec57  81 c4         sta ($c4,x)
$0e:ec59  a3 b1         lda $b1,s
$0e:ec5b  48            pha
$0e:ec5c  4c 12 13      jmp $1312
$0e:ec5f  0c 89 40      tsb $4089
$0e:ec62  89 41 17      bit #$1741
$0e:ec65  84 4a         sty $4a
$0e:ec67  a2 b1         ldx #$b1
$0e:ec69  29 6c 52      and #$526c
$0e:ec6c  17 04         ora [$04],y
$0e:ec6e  8d c3 22      sta $22c3
$0e:ec71  70 28         bvs $ec9b
$0e:ec73  8c 02 41      sty $4102
$0e:ec76  09 84 c1      ora #$c184
$0e:ec79  a0 ca         ldy #$ca
$0e:ec7b  d0 82         bne $ebff
$0e:ec7d  c1 5d         cmp ($5d,x)
$0e:ec7f  28            plp
$0e:ec80  1d 03 80      ora $8003,x
$0e:ec83  b6 02         ldx $02,y
$0e:ec85  0f 05 81 06   ora $068105
$0e:ec89  c9 d2 5a      cmp #$5ad2
$0e:ec8c  4c 26 f2      jmp $f226
$0e:ec8f  11 10         ora ($10),y
$0e:ec91  88            dey
$0e:ec92  57 26         eor [$26],y
$0e:ec94  1a            inc a
$0e:ec95  c2 51         rep #$51
$0e:ec97  87 43         sta [$43]
$0e:ec99  e1 00         sbc ($00,x)
$0e:ec9b  9a            txs
$0e:ec9c  70 25         bvs $ecc3
$0e:ec9e  8a            txa
$0e:ec9f  21 8e         and ($8e,x)
$0e:eca1  0e 8c 34      asl $348c
$0e:eca4  4a            lsr a
$0e:eca5  f2 81         sbc ($81)
$0e:eca7  40            rti
$0e:eca8  a0 c7 75      ldy #$75c7
$0e:ecab  08            php
$0e:ecac  82 bc e0      brl $cd6b
$0e:ecaf  70 70         bvs $ed21
$0e:ecb1  58            cli
$0e:ecb2  22 92 49 88   jsl $884992
$0e:ecb6  86 7c         stx $7c
$0e:ecb8  a0 5d c8      ldy #$c85d
$0e:ecbb  85 22         sta $22
$0e:ecbd  11 30         ora ($30),y
$0e:ecbf  82 42 0f      brl $fc04
$0e:ecc2  23 e4         and $e4,s
$0e:ecc4  8c 73 26      sty $2673
$0e:ecc7  1c 29 e7      trb $e729
$0e:ecca  c2 1d         rep #$1d
$0e:eccc  68            pla
$0e:eccd  88            dey
$0e:ecce  49 23 10      eor #$1023
$0e:ecd1  08            php
$0e:ecd2  e4 02         cpx $02
$0e:ecd4  18            clc
$0e:ecd5  bd 18 1c      lda $1c18,x
$0e:ecd8  12 09         ora ($09)
$0e:ecda  0b            phd
$0e:ecdb  84 45         sty $45
$0e:ecdd  e2 13         sep #$13
$0e:ecdf  39 04 62      and $6204,y
$0e:ece2  31 1b         and ($1b),y
$0e:ece4  91 2e         sta ($2e),y
$0e:ece6  d1 90         cmp ($90),y
$0e:ece8  10 f8         bpl $ece2
$0e:ecea  04 7e         tsb $7e
$0e:ecec  01 27         ora ($27,x)
$0e:ecee  90 47         bcc $ed37
$0e:ecf0  67 a7         adc [$a7]
$0e:ecf2  92 c0         sta ($c0)
$0e:ecf4  0e 02 c1      asl $c102
$0e:ecf7  d0 a8         bne $eca1
$0e:ecf9  4e 25 01      lsr $0125
$0e:ecfc  a0 ba         ldy #$ba
$0e:ecfe  5d 0f 29      eor $290f,x
$0e:ed01  80 80         bra $ec83
$0e:ed03  68            pla
$0e:ed04  20 1d 01      jsr $011d
$0e:ed07  40            rti
$0e:ed08  e2 30         sep #$30
$0e:ed0a  0c 50 5b      tsb $5b50
$0e:ed0d  04 12         tsb $12
$0e:ed0f  19 06 8b      ora $8b06,y
$0e:ed12  45 e3         eor $e3
$0e:ed14  f0 78         beq $ed8e
$0e:ed16  ac 92 17      ldy $1792
$0e:ed19  65 85         adc $85
$0e:ed1b  ab            plb
$0e:ed1c  49 7e         eor #$7e
$0e:ed1e  10 93         bpl $ecb3
$0e:ed20  e8            inx
$0e:ed21  44 61 11      mvp $11,$61
$0e:ed24  db            stp
$0e:ed25  c5 e2         cmp $e2
$0e:ed27  e1 78         sbc ($78,x)
$0e:ed29  c0 70         cpy #$70
$0e:ed2b  28            plp
$0e:ed2c  16 03         asl $03,x
$0e:ed2e  68            pla
$0e:ed2f  50 22         bvc $ed53
$0e:ed31  1e 08 86      asl $8608,x
$0e:ed34  02 21         cop #$21
$0e:ed36  10 98         bpl $ecd0
$0e:ed38  5a            phy
$0e:ed39  39 02 32      and $3202,y
$0e:ed3c  e0 40         cpx #$40
$0e:ed3e  3c 06 53      bit $5306,x
$0e:ed41  e0 70         cpx #$70
$0e:ed43  26 0b         rol $0b
$0e:ed45  85 56         sta $56
$0e:ed47  8c 05 6a      sty $6a05
$0e:ed4a  07 70         ora [$70]
$0e:ed4c  84 36         sty $36
$0e:ed4e  c8            iny
$0e:ed4f  e8            inx
$0e:ed50  8b            phb
$0e:ed51  f0 81         beq $ecd4
$0e:ed53  42 21         wdm #$21
$0e:ed55  31 07         and ($07),y
$0e:ed57  50 2e         bvc $ed87
$0e:ed59  45 f6         eor $f6
$0e:ed5b  16 0b         asl $0b,x
$0e:ed5d  07 a3         ora [$a3]
$0e:ed5f  d1 30         cmp ($30),y
$0e:ed61  98            tya
$0e:ed62  19 42 e1      ora $e142,y
$0e:ed65  70 48         bvs $edaf
$0e:ed67  99 38 0a      sta $0a38,y
$0e:ed6a  e1 f8         sbc ($f8,x)
$0e:ed6c  e0 7c         cpx #$7c
$0e:ed6e  0c 81 00      tsb $0081
$0e:ed71  4f 09 c6 20   eor $20c609
$0e:ed75  d0 68         bne $eddf
$0e:ed77  63 b8         adc $b8,s
$0e:ed79  4f e8 87 08   eor $0887e8
$0e:ed7d  24 1a         bit $1a
$0e:ed7f  11 0e         ora ($0e),y
$0e:ed81  88            dey
$0e:ed82  3b            tsc
$0e:ed83  01 e0         ora ($e0,x)
$0e:ed85  31 f8         and ($f8),y
$0e:ed87  fb            xce
$0e:ed88  ec 22 f1      cpx $f122
$0e:ed8b  78            sei
$0e:ed8c  7c 3e 0f      jmp ($0f3e,x)
$0e:ed8f  07 cf         ora [$cf]
$0e:ed91  67 9e         adc [$9e]
$0e:ed93  21 1c         and ($1c,x)
$0e:ed95  8f c8 27 f0   sta $f027c8
$0e:ed99  68            pla
$0e:ed9a  f4 02 2e      pea $2e02
$0e:ed9d  06 10         asl $10
$0e:ed9f  28            plp
$0e:eda0  67 80         adc [$80]
$0e:eda2  20 6b 06      jsr $066b
$0e:eda5  28            plp
$0e:eda6  51 a8         eor ($a8),y
$0e:eda8  d8            cld
$0e:eda9  3c 18 4c      bit $4c18,x
$0e:edac  1a            inc a
$0e:edad  20 d1 07      jsr $07d1
$0e:edb0  88            dey
$0e:edb1  f0 17         beq $edca
$0e:edb3  61 01         adc ($01,x)
$0e:edb5  a3 c0         lda $c0,s
$0e:edb7  30 70         bmi $ee29
$0e:edb9  1c 09 08      trb $0809
$0e:edbc  51 00         eor ($00),y
$0e:edbe  70 57         bvs $ee17
$0e:edc0  c8            iny
$0e:edc1  1a            inc a
$0e:edc2  c3 41         cmp $41,s
$0e:edc4  a0 78         ldy #$78
$0e:edc6  90 4d         bcc $ee15
$0e:edc8  28            plp
$0e:edc9  00 01         brk #$01
$0e:edcb  88            dey
$0e:edcc  6c 00 21      jmp ($2100)
$0e:edcf  13 a4         ora ($a4,s),y
$0e:edd1  48            pha
$0e:edd2  69 11         adc #$11
$0e:edd4  29 64         and #$64
$0e:edd6  46 49         lsr $49
$0e:edd8  0b            phd
$0e:edd9  8a            txa
$0e:edda  44 60 90      mvp $90,$60
$0e:eddd  08            php
$0e:edde  6c 26 09      jmp ($0926)
$0e:ede1  b7 ff         lda [$ff],y
$0e:ede3  c8            iny
$0e:ede4  6d 35 3b      adc $3b35
$0e:ede7  fc 46 6b      jsr ($6b46,x)
$0e:edea  2b            pld
$0e:edeb  9f ce 67 b1   sta $b167ce,x
$0e:edef  08            php
$0e:edf0  ec 66 3a      cpx $3a66
$0e:edf3  6c 0c 04      jmp ($040c)
$0e:edf6  92 09         sta ($09)
$0e:edf8  28            plp
$0e:edf9  e4 48         cpx $48
$0e:edfb  30 05         bmi $ee02
$0e:edfd  40            rti
$0e:edfe  88            dey
$0e:edff  44 2c 02      mvp $02,$2c
$0e:ee02  a0 e3         ldy #$e3
$0e:ee04  fd f0 5a      sbc $5af0,x
$0e:ee07  6c 36 bb      jmp ($bb36)
$0e:ee0a  99 ec c2      sta $c2ec,y
$0e:ee0d  6b            rtl
$0e:ee0e  39 1d 8c      and $8c1d,y
$0e:ee11  c7 e0         cmp [$e0]
$0e:ee13  d2 0b         cmp ($0b)
$0e:ee15  16 58         asl $58,x
$0e:ee17  8c 0e 1b      sty $1b0e
$0e:ee1a  01 89         ora ($89,x)
$0e:ee1c  c4 d6         cpy $d6
$0e:ee1e  2a            rol a
$0e:ee1f  77 25         adc [$25],y
$0e:ee21  b0 47         bcs $ee6a
$0e:ee23  a2 4b         ldx #$4b
$0e:ee25  e5 d6         sbc $d6
$0e:ee27  78            sei
$0e:ee28  2d 96 0d      and $0d96
$0e:ee2b  07 82         ora [$82]
$0e:ee2d  71 78         adc ($78),y
$0e:ee2f  ee 4f 16      inc $164f
$0e:ee32  29 dc         and #$dc
$0e:ee34  80 33         bra $ee69
$0e:ee36  81 9c         sta ($9c,x)
$0e:ee38  18            clc
$0e:ee39  41 68         eor ($68,x)
$0e:ee3b  03 d6         ora $d6,s
$0e:ee3d  6d 03 93      adc $9303
$0e:ee40  41 e1         eor ($e1,x)
$0e:ee42  90 e9         bcc $ee2d
$0e:ee44  c4 f2         cpy $f2
$0e:ee46  4d 30 37      eor $3730
$0e:ee49  a2 78         ldx #$78
$0e:ee4b  27 10         and [$10]
$0e:ee4d  05 f0         ora $f0
$0e:ee4f  40            rti
$0e:ee50  9d 22 ce      sta $ce22,x
$0e:ee53  a8            tay
$0e:ee54  44 02 31      mvp $31,$02
$0e:ee57  10 67         bpl $eec0
$0e:ee59  dc 23 11      jml [$1123]
$0e:ee5c  18            clc
$0e:ee5d  a4 45         ldy $45
$0e:ee5f  38            sec
$0e:ee60  b1 dc         lda ($dc),y
$0e:ee62  54 ee d5      mvn $d5,$ee
$0e:ee65  1b            tcs
$0e:ee66  8a            txa
$0e:ee67  4b            phk
$0e:ee68  e1 d0         sbc ($d0,x)
$0e:ee6a  18            clc
$0e:ee6b  d4 76         pei ($76)
$0e:ee6d  35 1c         and $1c,x
$0e:ee6f  f9 fc 7c      sbc $7cfc,y
$0e:ee72  5f 8e 27 80   eor $80278e,x
$0e:ee76  74 14         stz $14,x
$0e:ee78  0b            phd
$0e:ee79  01 bc         ora ($bc,x)
$0e:ee7b  63 90         adc $90,s
$0e:ee7d  18            clc
$0e:ee7e  e4 ab         cpx $ab
$0e:ee80  15 76         ora $76,x
$0e:ee82  81 5c         sta ($5c,x)
$0e:ee84  61 36         adc ($36,x)
$0e:ee86  38            sec
$0e:ee87  4e 5f 3b      lsr $3b5f
$0e:ee8a  75 fe         adc $fe,x
$0e:ee8c  eb            xba
$0e:ee8d  77 9e         adc [$9e],y
$0e:ee8f  7b            tdc
$0e:ee90  e5 d2         sbc $d2
$0e:ee92  01 fc         ora ($fc,x)
$0e:ee94  80 7d         bra $ef13
$0e:ee96  84 43         sty $43
$0e:ee98  62 65 0d      per $fc00
$0e:ee9b  0e 01 83      asl $8301
$0e:ee9e  80 52         bra $eef2
$0e:eea0  e2 d3         sep #$d3
$0e:eea2  98            tya
$0e:eea3  24 3e         bit $3e
$0e:eea5  29 04         and #$04
$0e:eea7  82 40 e0      brl $ceea
$0e:eeaa  e8            inx
$0e:eeab  42 1c         wdm #$1c
$0e:eead  05 86         ora $86
$0e:eeaf  e0 89         cpx #$89
$0e:eeb1  09 1c         ora #$1c
$0e:eeb3  c1 12         cmp ($12,x)
$0e:eeb5  08            php
$0e:eeb6  25 80         and $80
$0e:eeb8  5d 28 84      eor $8428,x
$0e:eebb  f0 ce         beq $ee8b
$0e:eebd  71 32         adc ($32),y
$0e:eebf  5d 2b b7      eor $b72b,x
$0e:eec2  cb            wai
$0e:eec3  35 fa         and $fa,x
$0e:eec5  87 7f         sta [$7f]
$0e:eec7  b5 95         lda $95,x
$0e:eec9  cd c4 00      cmp $00c4
$0e:eecc  be 0c 70      ldx $700c,y
$0e:eecf  96 40         stx $40,y
$0e:eed1  11 c1         ora ($c1),y
$0e:eed3  04 c0         tsb $c0
$0e:eed5  2b            pld
$0e:eed6  01 96         ora ($96,x)
$0e:eed8  12 89         ora ($89)
$0e:eeda  44 42 21      mvp $21,$42
$0e:eedd  58            cli
$0e:eede  ac 4b a5      ldy $a54b
$0e:eee1  ce b0 8e      dec $8eb0
$0e:eee4  47 21         eor [$21]
$0e:eee6  d0 e3         bne $eecb
$0e:eee8  a8            tay
$0e:eee9  44 27 12      mvp $12,$27
$0e:eeec  09 84         ora #$84
$0e:eeee  82 f1 40      brl $2fe2
$0e:eef1  b7 50         lda [$50],y
$0e:eef3  29 0a         and #$0a
$0e:eef5  60            rts
$0e:eef6  a0 53         ldy #$53
$0e:eef8  90 a1         bcc $ee9b
$0e:eefa  70 b8         bvs $eeb4
$0e:eefc  7f bf db 8d   adc $8ddbbf,x
$0e:ef00  c4 d2         cpy $d2
$0e:ef02  69 7c         adc #$7c
$0e:ef04  be 2e c2      ldx $c22e,y
$0e:ef07  61 30         adc ($30,x)
$0e:ef09  87 47         sta [$47]
$0e:ef0b  a0 17         ldy #$17
$0e:ef0d  08            php
$0e:ef0e  07 f8         ora [$f8]
$0e:ef10  c0 33         cpy #$33
$0e:ef12  48            pha
$0e:ef13  05 f1         ora $f1
$0e:ef15  88            dey
$0e:ef16  2c 90 8f      bit $8f90
$0e:ef19  43 e1         eor $e1,s
$0e:ef1b  f1 78         sbc ($78),y
$0e:ef1d  ba            tsx
$0e:ef1e  bc 16 65      ldy $6516,x
$0e:ef21  27 93         and [$93]
$0e:ef23  c8            iny
$0e:ef24  e4 73         cpx $73
$0e:ef26  69 bc         adc #$bc
$0e:ef28  42 3f         wdm #$3f
$0e:ef2a  00 8b         brk #$8b
$0e:ef2c  c0 21         cpy #$21
$0e:ef2e  f4 0a 7b      pea $7b0a
$0e:ef31  14 6c         trb $6c
$0e:ef33  f4 0b 1d      pea $1d0b
$0e:ef36  02 ee         cop #$ee
$0e:ef38  b3 2e         lda ($2e,s),y
$0e:ef3a  1f 0e 0f 07   ora $070f0e,x
$0e:ef3e  c7 e3         cmp [$e3]
$0e:ef40  f0 78         beq $efba
$0e:ef42  78            sei
$0e:ef43  54 3f 81      mvn $81,$3f
$0e:ef46  c7 61         cmp [$61]
$0e:ef48  83 7c         sta $7c,s
$0e:ef4a  78            sei
$0e:ef4b  63 c1         adc $c1,s
$0e:ef4d  c7 c0         cmp [$c0]
$0e:ef4f  30 ed         bmi $ef3e
$0e:ef51  f1 e3         sbc ($e3),y
$0e:ef53  e0 70         cpx #$70
$0e:ef55  30 38         bmi $ef8f
$0e:ef57  1f 3f 9f 87   ora $879f3f,x
$0e:ef5b  c3 e1         cmp $e1,s
$0e:ef5d  b0 ca         bcs $ef29
$0e:ef5f  f0 81         beq $eee2
$0e:ef61  61 a0         adc ($a0,x)
$0e:ef63  d0 68         bne $efcd
$0e:ef65  06 06         asl $06
$0e:ef67  00 45         brk #$45
$0e:ef69  0e 7b a4      asl $a47b
$0e:ef6c  70 cd         bvs $ef3b
$0e:ef6e  f1 04         sbc ($04),y
$0e:ef70  04 1b         tsb $1b
$0e:ef72  00 0f         brk #$0f
$0e:ef74  13 b8         ora ($b8,s),y
$0e:ef76  63 31         adc $31,s
$0e:ef78  87 90         sta [$90]
$0e:ef7a  86 06         stx $06
$0e:ef7c  42 1d         wdm #$1d
$0e:ef7e  28            plp
$0e:ef7f  95 42         sta $42,x
$0e:ef81  31 10         and ($10),y
$0e:ef83  4c 24 12      jmp $1224
$0e:ef86  19 02 c7      ora $c702,y
$0e:ef89  22 42 05 0e   jsl $0e0542
$0e:ef8d  80 43         bra $efd2
$0e:ef8f  a0 92         ldy #$92
$0e:ef91  ea            nop
$0e:ef92  14 b2         trb $b2
$0e:ef94  49 4a         eor #$4a
$0e:ef96  84 44         sty $44
$0e:ef98  25 91         and $91
$0e:ef9a  08            php
$0e:ef9b  04 62         tsb $62
$0e:ef9d  30 4b         bmi $efea
$0e:ef9f  27 18         and [$18]
$0e:efa1  7b            tdc
$0e:efa2  f4 be fb      pea $fbbe
$0e:efa5  75 f8         adc $f8,x
$0e:efa7  86 12         stx $12
$0e:efa9  49 e1         eor #$e1
$0e:efab  20 07 00      jsr $0007
$0e:efae  4b            phk
$0e:efaf  1b            tcs
$0e:efb0  24 62         bit $62
$0e:efb2  49 00         eor #$00
$0e:efb4  92 0d         sta ($0d)
$0e:efb6  00 72         brk #$72
$0e:efb8  11 08         ora ($08),y
$0e:efba  40            rti
$0e:efbb  e8            inx
$0e:efbc  b3 3f         lda ($3f,s),y
$0e:efbe  de df fe      dec $fedf,x
$0e:efc1  b5 7e         lda $7e,x
$0e:efc3  a9 5f         lda #$5f
$0e:efc5  89 01         bit #$01
$0e:efc7  34 25         bit $25,x
$0e:efc9  1c 6a 01      trb $016a
$0e:efcc  cb            wai
$0e:efcd  87 3f         sta [$3f]
$0e:efcf  82 11 01      brl $f0e3
$0e:efd2  7e 84 06      ror $0684,x
$0e:efd5  09 02         ora #$02
$0e:efd7  80 41         bra $f01a
$0e:efd9  20 10 19      jsr $1910
$0e:efdc  f4 3b e2      pea $e23b
$0e:efdf  c3 08         cmp $08,s
$0e:efe1  0c 7a 0d      tsb $0d7a
$0e:efe4  19 82 00      ora $0082,y
$0e:efe7  80 04         bra $efed
$0e:efe9  10 4e         bpl $f039
$0e:efeb  04 72         tsb $72
$0e:efed  41 24         eor ($24,x)
$0e:efef  92 6d         sta ($6d)
$0e:eff1  0b            phd
$0e:eff2  01 f0         ora ($f0,x)
$0e:eff4  a8            tay
$0e:eff5  5c 2a 03 a2   jml $a2032a
$0e:eff9  f0 40         beq $f03b
$0e:effb  38            sec
$0e:effc  90 0d         bcc $f00b
$0e:effe  a5 02         lda $02
$0e:f000  21 e0         and ($e0,x)
$0e:f002  a8            tay
$0e:f003  68            pla
$0e:f004  14 e1         trb $e1
$0e:f006  00 90         brk #$90
$0e:f008  0e 82 27      asl $2782
$0e:f00b  30 9a         bmi $efa7
$0e:f00d  c8            iny
$0e:f00e  24 d0         bit $d0
$0e:f010  28            plp
$0e:f011  6c 12 2b      jmp ($2b12)
$0e:f014  14 80         trb $80
$0e:f016  8e 8e 2f      stx $2f8e
$0e:f019  08            php
$0e:f01a  91 8a         sta ($8a),y
$0e:f01c  02 7b         cop #$7b
$0e:f01e  04 8d         tsb $8d
$0e:f020  c5 21         cmp $21
$0e:f022  60            rts
$0e:f023  11 5c         ora ($5c),y
$0e:f025  8a            txa
$0e:f026  7c 3e 10      jmp ($103e,x)
$0e:f029  09 c4         ora #$c4
$0e:f02b  03 49         ora $49,s
$0e:f02d  80 9a         bra $efc9
$0e:f02f  44 2b 54      mvp $54,$2b
$0e:f032  8c 87 12      sty $1287
$0e:f035  41 20         eor ($20,x)
$0e:f037  fc 46 1a      jsr ($1a46,x)
$0e:f03a  21 f8         and ($f8,x)
$0e:f03c  80 67         bra $f0a5
$0e:f03e  2c 11 0f      bit $0f11
$0e:f041  75 23         adc $23,x
$0e:f043  6f c4 99 c8   adc $c899c4
$0e:f047  22 13 58 e5   jsl $e55813
$0e:f04b  fa            plx
$0e:f04c  09 7e         ora #$7e
$0e:f04e  89 5e         bit #$5e
$0e:f050  60            rts
$0e:f051  52 f8         eor ($f8)
$0e:f053  04 7c         tsb $7c
$0e:f055  74 70         stz $70,x
$0e:f057  38            sec
$0e:f058  c2 30         rep #$30
$0e:f05a  21 a1         and ($a1,x)
$0e:f05c  70 8f         bvs $efed
$0e:f05e  01 00         ora ($00,x)
$0e:f060  74 70         stz $70,x
$0e:f062  0e e4 23      asl $23e4
$0e:f065  43 11         eor $11,s
$0e:f067  ea            nop
$0e:f068  cd bb f3      cmp $f3bb
$0e:f06b  8e 9c e3      stx $e39c
$0e:f06e  8d 64 e6      sta $e664
$0e:f071  16 87         asl $87,x
$0e:f073  cf 00 e7 1d   cmp $1de700
$0e:f077  00 74         brk #$74
$0e:f079  30 49         bmi $f0c4
$0e:f07b  24 62         bit $62
$0e:f07d  f9 30 69      sbc $6930,y
$0e:f080  83 e0         sta $e0,s
$0e:f082  67 e3         adc [$e3]
$0e:f084  03 7c         ora $7c,s
$0e:f086  84 1c         sty $1c
$0e:f088  12 83         ora ($83)
$0e:f08a  ed ea 4c      sbc $4cea
$0e:f08d  34 76         bit $76,x
$0e:f08f  2d 6d b8      and $b86d
$0e:f092  2b            pld
$0e:f093  10 e8         bpl $f07d
$0e:f095  00 20         brk #$20
$0e:f097  22 02 49 95   jsl $954902
$0e:f09b  4a            lsr a
$0e:f09c  aa            tax
$0e:f09d  d5 68         cmp $68,x
$0e:f09f  1c 4e 45      trb $454e
$0e:f0a2  2b            pld
$0e:f0a3  80 c0         bra $f065
$0e:f0a5  e3 51         sbc $51,s
$0e:f0a7  38            sec
$0e:f0a8  24 06         bit $06
$0e:f0aa  15 09         ora $09,x
$0e:f0ac  a0 5a a4      ldy #$a45a
$0e:f0af  17 69         ora [$69],y
$0e:f0b1  04 ce         tsb $ce
$0e:f0b3  21 3b         and ($3b,x)
$0e:f0b5  8c 46 e1      sty $e146
$0e:f0b8  11 b8         ora ($b8),y
$0e:f0ba  64 36         stz $36
$0e:f0bc  0d 0f 98      ora $980f
$0e:f0bf  4f 20 91 e8   eor $e89120
$0e:f0c3  84 f2         sty $f2
$0e:f0c5  01 98         ora ($98,x)
$0e:f0c7  84 0b         sty $0b
$0e:f0c9  02 3d         cop #$3d
$0e:f0cb  00 86         brk #$86
$0e:f0cd  60            rts
$0e:f0ce  0b            phd
$0e:f0cf  e0 94 04      cpx #$0494
$0e:f0d2  d0 25         bne $f0f9
$0e:f0d4  05 a4         ora $a4
$0e:f0d6  31 ec         and ($ec),y
$0e:f0d8  06 33         asl $33
$0e:f0da  c1 ee         cmp ($ee,x)
$0e:f0dc  99 cc ef      sta $efcc,y
$0e:f0df  15 98         ora $98,x
$0e:f0e1  4c 66 63      jmp $6366
$0e:f0e4  29 80 c3      and #$c380
$0e:f0e7  60            rts
$0e:f0e8  90 c8         bcc $f0b2
$0e:f0ea  51 ec         eor ($ec),y
$0e:f0ec  20 d4 0b      jsr $0bd4
$0e:f0ef  9c 82 f3      stz $f382
$0e:f0f2  20 9c c4      jsr $c49c
$0e:f0f5  18            clc
$0e:f0f6  81 1d         sta ($1d,x)
$0e:f0f8  89 47 a1      bit #$a147
$0e:f0fb  70 f8         bvs $f0f5
$0e:f0fd  4c 3f 0b      jmp $0b3f
$0e:f100  c7 c0         cmp [$c0]
$0e:f102  70 e0         bvs $f0e4
$0e:f104  18            clc
$0e:f105  78            sei
$0e:f106  07 8e         ora [$8e]
$0e:f108  81 c3         sta ($c3,x)
$0e:f10a  c0 78 e0      cpy #$e078
$0e:f10d  17 38         ora [$38],y
$0e:f10f  04 46         tsb $46
$0e:f111  01 c7         ora ($c7,x)
$0e:f113  80 70         bra $f185
$0e:f115  da            phx
$0e:f116  64 e1         stz $e1
$0e:f118  1f 1e 03 e7   ora $e7031e,x
$0e:f11c  e0 f8 e2      cpx #$e2f8
$0e:f11f  31 f0         and ($f0),y
$0e:f121  6c 71 80      jmp ($8071)
$0e:f124  5e 41 8c      lsr $8c41,x
$0e:f127  30 0e         bmi $f137
$0e:f129  72 01         adc ($01)
$0e:f12b  99 80 63      sta $6380,y
$0e:f12e  de a2 f4      dec $f4a2,x
$0e:f131  9b            txy
$0e:f132  c1 a8         cmp ($a8,x)
$0e:f134  26 96         rol $96
$0e:f136  0b            phd
$0e:f137  a5 02         lda $02
$0e:f139  d1 a0         cmp ($a0),y
$0e:f13b  f4 40 3a      pea $3a40
$0e:f13e  14 0e         trb $0e
$0e:f140  86 03         stx $03
$0e:f142  61 00         adc ($00,x)
$0e:f144  be 42 27      ldx $2742,y
$0e:f147  90 8b         bcc $f0d4
$0e:f149  e4 42         cpx $42
$0e:f14b  f1 10         sbc ($10),y
$0e:f14d  fc 4a 3f      jsr ($3f4a,x)
$0e:f150  12 0f         ora ($0f)
$0e:f152  85 03         sta $03
$0e:f154  e1 05         sbc ($05,x)
$0e:f156  80 40         bra $f198
$0e:f158  e0 11 28      cpx #$2811
$0e:f15b  04 25         tsb $25
$0e:f15d  7a            ply
$0e:f15e  10 28         bpl $f188
$0e:f160  6c 22 1f      jmp ($1f22)
$0e:f163  18            clc
$0e:f164  8a            txa
$0e:f165  c4 20         cpy $20
$0e:f167  b0 58         bcs $f1c1
$0e:f169  1c 0e 2f      trb $2f0e
$0e:f16c  17 87         ora [$87],y
$0e:f16e  43 e1         eor $e1,s
$0e:f170  b0 f8         bcs $f16a
$0e:f172  39 20 23      and $2320,y
$0e:f175  f0 f8         beq $f16f
$0e:f177  fc 06 01      jsr ($0106,x)
$0e:f17a  25 80         and $80
$0e:f17c  45 20         eor $20
$0e:f17e  19 28 14      ora $1428,y
$0e:f181  52 0f         eor ($0f)
$0e:f183  68            pla
$0e:f184  86 54         stx $54
$0e:f186  2b            pld
$0e:f187  13 89         ora ($89,s),y
$0e:f189  0c 06 03      tsb $0306
$0e:f18c  35 9a         and $9a,x
$0e:f18e  cf e7 f9 dc   cmp $dcf9e7
$0e:f192  fc 62 3f      jsr ($3f62,x)
$0e:f195  70 be         bvs $f155
$0e:f197  48            pha
$0e:f198  2f 11 89 cc   and $cc8911
$0e:f19c  02 01         cop #$01
$0e:f19e  07 83         ora [$83]
$0e:f1a0  99 c2 41      sta $41c2,y
$0e:f1a3  3c a0 5c      bit $5ca0,x
$0e:f1a6  28            plp
$0e:f1a7  1e 06 c8      asl $c806,x
$0e:f1aa  60            rts
$0e:f1ab  38            sec
$0e:f1ac  c6 f0         dec $f0
$0e:f1ae  38            sec
$0e:f1af  04 02         tsb $02
$0e:f1b1  3e a3 1b      rol $1ba3,x
$0e:f1b4  84 03         sty $03
$0e:f1b6  c0 e9 08      cpy #$08e9
$0e:f1b9  01 f8         ora ($f8,x)
$0e:f1bb  8d e0 4f      sta $4fe0
$0e:f1be  01 78         ora ($78,x)
$0e:f1c0  46 ac         lsr $ac
$0e:f1c2  10 8e         bpl $f152
$0e:f1c4  04 21         tsb $21
$0e:f1c6  0e 30 09      asl $0930
$0e:f1c9  04 02         tsb $02
$0e:f1cb  0d 00 81      ora $8100
$0e:f1ce  40            rti
$0e:f1cf  2c 10 0f      bit $0f10
$0e:f1d2  82 a0 51      brl $4375
$0e:f1d5  e7 10         sbc [$10]
$0e:f1d7  82 44 20      brl $121e
$0e:f1da  49 c0 37      eor #$37c0
$0e:f1dd  82 20 26      brl $1800
$0e:f1e0  08            php
$0e:f1e1  f2 7c         sbc ($7c)
$0e:f1e3  04 39         tsb $39
$0e:f1e5  44 2a 70      mvp $70,$2a
$0e:f1e8  47 94         eor [$94]
$0e:f1ea  11 02         ora ($02),y
$0e:f1ec  33 f8         and ($f8,s),y
$0e:f1ee  05 fd         ora $fd
$0e:f1f0  a4 6d         ldy $6d
$0e:f1f2  10 87         bpl $f17b
$0e:f1f4  a4 c5         ldy $c5
$0e:f1f6  bd e7 f1      lda $f1e7,x
$0e:f1f9  20 84 12      jsr $1284
$0e:f1fc  09 0b 84      ora #$840b
$0e:f1ff  45 e2         eor $e2
$0e:f201  13 39         ora ($39,s),y
$0e:f203  04 62         tsb $62
$0e:f205  30 ed         bmi $f1f4
$0e:f207  54 08 b6      mvn $b6,$08
$0e:f20a  c1 08         cmp ($08,x)
$0e:f20c  12 75         ora ($75)
$0e:f20e  08            php
$0e:f20f  23 cf         and $cf,s
$0e:f211  01 80         ora ($80,x)
$0e:f213  b8            clv
$0e:f214  5c 39 14 89   jml $891439
$0e:f218  a4 92         ldy $92
$0e:f21a  59 24 71      eor $7124,y
$0e:f21d  36 02         rol $02,x
$0e:f21f  01 b0         ora ($b0,x)
$0e:f221  80 76         bra $f299
$0e:f223  05 42         ora $42
$0e:f225  ef f0 07 84   sbc $8407f0
$0e:f229  52 80         eor ($80)
$0e:f22b  79 0b 04      adc $040b,y
$0e:f22e  c2 61         rep #$61
$0e:f230  28            plp
$0e:f231  94 07         sty $07,x
$0e:f233  e0 4e 1c      cpx #$1c4e
$0e:f236  08            php
$0e:f237  07 41         ora [$41]
$0e:f239  24 23         bit $23
$0e:f23b  50 17         bvc $f254
$0e:f23d  9a            txs
$0e:f23e  94 12         sty $12,x
$0e:f240  24 70         bit $70
$0e:f242  08            php
$0e:f243  2c 0a 0c      bit $0c0a
$0e:f246  33 08         and ($08,s),y
$0e:f248  14 0a         trb $0a
$0e:f24a  03 03         ora $03,s
$0e:f24c  3e 81 f4      rol $f481,x
$0e:f24f  1b            tcs
$0e:f250  81 60         sta ($60,x)
$0e:f252  c3 5c         cmp $5c,s
$0e:f254  30 93         bmi $f1e9
$0e:f256  0e 34 03      asl $0334
$0e:f259  cd 10 e2      cmp $e210
$0e:f25c  48            pha
$0e:f25d  29 d1 cb      and #$cbd1
$0e:f260  04 42         tsb $42
$0e:f262  49 78 ff      eor #$ff78
$0e:f265  5c 3e 93 8f   jml $8f933e
$0e:f269  f4 43 ed      pea $ed43
$0e:f26c  30 fa         bmi $f268
$0e:f26e  4c 2f d9      jmp $d92f
$0e:f271  cf e6 63 79   cmp $7963e6
$0e:f275  01 3c         ora ($3c,x)
$0e:f277  01 14         ora ($14,x)
$0e:f279  11 82         ora ($82),y
$0e:f27b  dc 68 2c      jml [$2c68]
$0e:f27e  1e 09 07      asl $0709,x
$0e:f281  81 1d         sta ($1d,x)
$0e:f283  c1 88         cmp ($88,x)
$0e:f285  28            plp
$0e:f286  93 34         sta ($34,s),y
$0e:f288  05 8f         ora $8f
$0e:f28a  01 32         ora ($32,x)
$0e:f28c  e0 ec a4      cpx #$a4ec
$0e:f28f  d1 1c         cmp ($1c),y
$0e:f291  14 62         trb $62
$0e:f293  83 98         sta $98,s
$0e:f295  b0 66         bcs $f2fd
$0e:f297  64 18         stz $18
$0e:f299  8c 07 8f      sty $8f07
$0e:f29c  03 b3         ora $b3,s
$0e:f29e  a0 fc fc      ldy #$fcfc
$0e:f2a1  df 7c 1e 6e   cmp $6e1e7c,x
$0e:f2a5  87 db         sta [$db]
$0e:f2a7  b0 7e         bcs $f327
$0e:f2a9  6c 3e 98      jmp ($983e)
$0e:f2ac  06 0e         asl $0e
$0e:f2ae  67 08         adc [$08]
$0e:f2b0  f0 46         beq $f2f8
$0e:f2b2  e0 11 2f      cpx #$2f11
$0e:f2b5  0c 6a 07      tsb $076a
$0e:f2b8  58            cli
$0e:f2b9  90 44         bcc $f2ff
$0e:f2bb  b8            clv
$0e:f2bc  11 49         ora ($49),y
$0e:f2be  c6 ef         dec $ef
$0e:f2c0  e7 fb         sbc [$fb]
$0e:f2c2  f0 7e         beq $f342
$0e:f2c4  f1 39         sbc ($39),y
$0e:f2c6  bf 0f ef 07   lda $07ef0f,x
$0e:f2ca  db            stp
$0e:f2cb  f0 fc         beq $f2c9
$0e:f2cd  f8            sed
$0e:f2ce  7d 7c 01      adc $017c,x
$0e:f2d1  38            sec
$0e:f2d2  34 05         bit $05,x
$0e:f2d4  70 c0         bvs $f296
$0e:f2d6  05 00         ora $00
$0e:f2d8  c2 86         rep #$86
$0e:f2da  a0 f0 50      ldy #$50f0
$0e:f2dd  3c 18 0e      bit $0e18,x
$0e:f2e0  00 8c         brk #$8c
$0e:f2e2  44 e2 61      mvp $61,$e2
$0e:f2e5  28            plp
$0e:f2e6  d4 4a         pei ($4a)
$0e:f2e8  2d 16 85      and $8516
$0e:f2eb  c7 e0         cmp [$e0]
$0e:f2ed  70 f4         bvs $f2e3
$0e:f2ef  38            sec
$0e:f2f0  18            clc
$0e:f2f1  52 1b         eor ($1b)
$0e:f2f3  1f 84 c7 e0   ora $e0c784,x
$0e:f2f7  04 20         tsb $20
$0e:f2f9  87 ac         sta [$ac]
$0e:f2fb  44 c2 72      mvp $72,$c2
$0e:f2fe  99 14 36      sta $3614,y
$0e:f301  41 5f         eor ($5f,x)
$0e:f303  9a            txs
$0e:f304  43 63         eor $63,s
$0e:f306  83 50         sta $50,s
$0e:f308  23 a4         and $a4,s
$0e:f30a  76 7f         ror $7f,x
$0e:f30c  1f 9f d2 ef   ora $efd29f,x
$0e:f310  f0 32         beq $f344
$0e:f312  23 e0         and $e0,s
$0e:f314  38            sec
$0e:f315  86 f0         stx $f0
$0e:f317  a0 79 a8      ldy #$a879
$0e:f31a  16 39         asl $39,x
$0e:f31c  05 e2         ora $e2
$0e:f31e  31 3f         and ($3f),y
$0e:f320  83 8d         sta $8d,s
$0e:f322  82 0f 00      brl $f334
$0e:f325  e2 1f         sep #$1f
$0e:f327  c7 cd         cmp [$cd]
$0e:f329  00 b1         brk #$b1
$0e:f32b  c0 2f         cpy #$2f
$0e:f32d  10 09         bpl $f338
$0e:f32f  f9 14 4f      sbc $4f14,y
$0e:f332  c1 00         cmp ($00,x)
$0e:f334  9e 0f 82      stz $820f,x
$0e:f337  03 12         ora $12,s
$0e:f339  81 db         sta ($db,x)
$0e:f33b  21 d7         and ($d7,x)
$0e:f33d  8f e4 42 f9   sta $f942e4
$0e:f341  00 8c         brk #$8c
$0e:f343  13 02         ora ($02,s),y
$0e:f345  fd 00 ff      sbc $ff00,x
$0e:f348  40            rti
$0e:f349  3f 90 0f 80   and $800f90,x
$0e:f34d  61 62         adc ($62,x)
$0e:f34f  10 00         bpl $f351
$0e:f351  80 59         bra $f3ac
$0e:f353  94 21         sty $21,x
$0e:f355  7e 84 28      ror $2884,x
$0e:f358  42 7d         wdm #$7d
$0e:f35a  00 86         brk #$86
$0e:f35c  13 02         ora ($02,s),y
$0e:f35e  70 a0         bvs $f300
$0e:f360  16 13         asl $13,x
$0e:f362  0a            asl a
$0e:f363  8a            txa
$0e:f364  02 ce         cop #$ce
$0e:f366  10 80         bpl $f2e8
$0e:f368  2b            pld
$0e:f369  c0 30         cpy #$30
$0e:f36b  9c 06 70      stz $7006
$0e:f36e  37 c6         and [$c6],y
$0e:f370  41 20         eor ($20,x)
$0e:f372  88            dey
$0e:f373  35 57         and $57,x
$0e:f375  81 c0         sta ($c0,x)
$0e:f377  8d c8 a9      sta $a9c8
$0e:f37a  11 4e         ora ($4e),y
$0e:f37c  34 7f         bit $7f,x
$0e:f37e  19 3e b6      ora $b63e,y
$0e:f381  47 a2         eor [$a2]
$0e:f383  b2 f8         lda ($f8)
$0e:f385  74 06         stz $06,x
$0e:f387  1f 03 8e cf   ora $cf8e03,x
$0e:f38b  7e 7f 1f      ror $1f7f,x
$0e:f38e  07 e3         ora [$e3]
$0e:f390  83 e0         sta $e0,s
$0e:f392  67 85         adc [$85]
$0e:f394  02 c0         cop #$c0
$0e:f396  4b            phk
$0e:f397  2b            pld
$0e:f398  a5 d2         lda $d2
$0e:f39a  15 8a         ora $8a,x
$0e:f39c  b9 40 bc      lda $bc40,y
$0e:f39f  50 2e         bvc $f3cf
$0e:f3a1  cc 66 6f      cpy $6f66
$0e:f3a4  3d f2 ff      and $fff2,x
$0e:f3a7  69 37 4c      adc #$4c37
$0e:f3aa  46 02         lsr $02
$0e:f3ac  e8            inx
$0e:f3ad  a4 15         ldy $15
$0e:f3af  28            plp
$0e:f3b0  21 03         and ($03,x)
$0e:f3b2  85 00         sta $00
$0e:f3b4  81 40         sta ($40,x)
$0e:f3b6  30 70         bmi $f428
$0e:f3b8  07 79         ora [$79]
$0e:f3ba  71 63         adc ($63),y
$0e:f3bc  b8            clv
$0e:f3bd  a9 dd aa      lda #$aadd
$0e:f3c0  37 14         and [$14],y
$0e:f3c2  97 df         sta [$df],y
$0e:f3c4  a0 36         ldy #$36
$0e:f3c6  7b            tdc
$0e:f3c7  c3 fc         cmp $fc,s
$0e:f3c9  bc 5f 8e      ldy $8e5f,x
$0e:f3cc  27 82         and [$82]
$0e:f3ce  08            php
$0e:f3cf  08            php
$0e:f3d0  26 78         rol $78
$0e:f3d2  5c 01 e1 44   jml $44e101
$0e:f3d6  e2 6c         sep #$6c
$0e:f3d8  b0 5b         bcs $f435
$0e:f3da  ac 16 57      ldy $5716
$0e:f3dd  0f 6d f7 c5   ora $c5f76d
$0e:f3e1  7e f5 de      ror $def5,x
$0e:f3e4  f8            sed
$0e:f3e5  7c 17 e0      jmp ($e017,x)
$0e:f3e8  9c 04 e0      stz $e004
$0e:f3eb  22 01 5e 10   jsl $105e01
$0e:f3ef  8c 02 c4      sty $c402
$0e:f3f2  23 90         and $90,s
$0e:f3f4  08            php
$0e:f3f5  24 4a         bit $4a
$0e:f3f7  11 32         ora ($32),y
$0e:f3f9  83 42         sta $42,s
$0e:f3fb  21 90         and ($90,x)
$0e:f3fd  28            plp
$0e:f3fe  32 78         and ($78)
$0e:f400  61 90         adc ($90,x)
$0e:f402  3e e7 72      rol $72e7,x
$0e:f405  99 5e a6      sta $a65e,y
$0e:f408  5f a4 d2 e9   eor $e9d2a4,x
$0e:f40c  64 ba         stz $ba
$0e:f40e  4d 3e 8b      eor $8b3e
$0e:f411  45 a3         eor $a3
$0e:f413  91 f8         sta ($f8),y
$0e:f415  44 02 79      mvp $79,$02
$0e:f418  28            plp
$0e:f419  a5 58         lda $58
$0e:f41b  a1 95         lda ($95,x)
$0e:f41d  e5 60         sbc $60
$0e:f41f  d0 92         bne $f3b3
$0e:f421  00 cc         brk #$cc
$0e:f423  09 e4         ora #$e4
$0e:f425  f2 bd         sbc ($bd)
$0e:f427  7e ce ff      ror $ffce,x
$0e:f42a  f0 3d         beq $f469
$0e:f42c  fc 0a 9c      jsr ($9c0a,x)
$0e:f42f  38            sec
$0e:f430  74 2b         stz $2b,x
$0e:f432  f2 7c         sbc ($7c)
$0e:f434  18            clc
$0e:f435  87 1c         sta [$1c]
$0e:f437  8a            txa
$0e:f438  4c b4 5b      jmp $5bb4
$0e:f43b  fb            xce
$0e:f43c  ac cf d9      ldy $d9cf
$0e:f43f  85 d6         sta $d6
$0e:f441  63 56         adc $56,s
$0e:f443  07 00         ora [$00]
$0e:f445  99 43 37      sta $3743,y
$0e:f448  f4 09 9f      pea $9f09
$0e:f44b  33 0b         and ($0b,s),y
$0e:f44d  76 c6         ror $c6,x
$0e:f44f  df 9c e8 6d   cmp $6de89c,x
$0e:f453  0f 1e 03 63   ora $63031e
$0e:f457  80 d4         bra $f42d
$0e:f459  68            pla
$0e:f45a  2d 76 b6      and $b676
$0e:f45d  89 c8         bit #$c8
$0e:f45f  2c 16 0b      bit $0b16
$0e:f462  1f 8e e7 f3   ora $f3e78e,x
$0e:f466  ae ff f2      ldx $f2ff
$0e:f469  57 d5         eor [$d5],y
$0e:f46b  8a            txa
$0e:f46c  40            rti
$0e:f46d  2d b6 5f      and $5fb6
$0e:f470  9f b3 4b 6c   sta $6c4bb3,x
$0e:f474  86 ee         stx $ee
$0e:f476  30 0c         bmi $f484
$0e:f478  14 b6         trb $b6
$0e:f47a  c4 be         cpy $be
$0e:f47c  70 cd         bvs $f44b
$0e:f47e  2d 5a 1b      and $1b5a
$0e:f481  fe c0 5f      inc $5fc0,x
$0e:f484  d9 e8 df      cmp $dfe8,y
$0e:f487  0d 06 03      ora $0306
$0e:f48a  61 a0         adc ($a0,x)
$0e:f48c  f4 78 3f      pea $3f78
$0e:f48f  1f 08 00 7c   ora $7c0008,x
$0e:f493  62 11 07      per $fba7
$0e:f496  18            clc
$0e:f497  f8            sed
$0e:f498  2a            rol a
$0e:f499  1f 0c c5 e3   ora $e3c50c,x
$0e:f49d  d1 18         cmp ($18),y
$0e:f49f  94 4b         sty $4b,x
$0e:f4a1  a6 d2         ldx $d2
$0e:f4a3  7b            tdc
$0e:f4a4  cc be c5      cpy $c5be
$0e:f4a7  21 bb         and ($bb,x)
$0e:f4a9  c8            iny
$0e:f4aa  ac d2 69      ldy $69d2
$0e:f4ad  84 c6         sty $c6
$0e:f4af  6b            rtl
$0e:f4b0  17 97         ora [$97],y
$0e:f4b2  44 2c f1      mvp $f1,$2c
$0e:f4b5  8b            phb
$0e:f4b6  7c 42 c3      jmp ($c342,x)
$0e:f4b9  1e b1 46      asl $46b1,x
$0e:f4bc  ec d1 fb      cpx $fbd1
$0e:f4bf  8c 3a ed      sty $ed3a
$0e:f4c2  09 0f         ora #$0f
$0e:f4c4  91 3c         sta ($3c),y
$0e:f4c6  df c1 80 a0   cmp $a080c1,x
$0e:f4ca  50 02         bvc $f4ce
$0e:f4cc  e0 50         cpx #$50
$0e:f4ce  98            tya
$0e:f4cf  04 c2         tsb $c2
$0e:f4d1  e0 27         cpx #$27
$0e:f4d3  08            php
$0e:f4d4  01 bd         ora ($bd,x)
$0e:f4d6  a1 90         lda ($90,x)
$0e:f4d8  48            pha
$0e:f4d9  93 d4         sta ($d4,s),y
$0e:f4db  24 bb         bit $bb
$0e:f4dd  33 83         and ($83,s),y
$0e:f4df  c0 22         cpy #$22
$0e:f4e1  40            rti
$0e:f4e2  41 d9         eor ($d9,x)
$0e:f4e4  d3 0d         cmp ($0d,s),y
$0e:f4e6  ee 6f 1b      inc $1b6f
$0e:f4e9  05 03         ora $03
$0e:f4eb  60            rts
$0e:f4ec  5e 71 19      lsr $1971,x
$0e:f4ef  39 02 e0      and $e002,y
$0e:f4f2  1e 18 0c      asl $0c18,x
$0e:f4f5  06 0d         asl $0d
$0e:f4f7  06 84         asl $84
$0e:f4f9  c2 22         rep #$22
$0e:f4fb  f1 09         sbc ($09),y
$0e:f4fd  74 82         stz $82,x
$0e:f4ff  59 20 ac      eor $ac20,y
$0e:f502  50 15         bvc $f519
$0e:f504  e3 00         sbc $00,s
$0e:f506  83 40         sta $40,s
$0e:f508  61 30         adc ($30,x)
$0e:f50a  68            pla
$0e:f50b  bc 22 5f      ldy $5f22,x
$0e:f50e  10 64         bpl $f574
$0e:f510  85 7e         sta $7e
$0e:f512  41 7e         eor ($7e,x)
$0e:f514  bf 60 70 37   lda $377060,x
$0e:f518  e8            inx
$0e:f519  07 fe         ora [$fe]
$0e:f51b  01 81         ora ($81,x)
$0e:f51d  37 8c         and [$8c],y
$0e:f51f  62 30 cf      per $c452
$0e:f522  06 98         asl $98
$0e:f524  60            rts
$0e:f525  59 e2 d5      eor $d5e2,y
$0e:f528  07 29         ora [$29]
$0e:f52a  c6 3f         dec $3f
$0e:f52c  f7 e8         sbc [$e8],y
$0e:f52e  d4 02         pei ($02)
$0e:f530  6f 10 bc d2   adc $d2bc10
$0e:f534  7c f0 8d      jmp ($8df0,x)
$0e:f537  fc 00 1c      jsr ($1c00,x)
$0e:f53a  0c 10 37      tsb $3710
$0e:f53d  84 1e         sty $1e
$0e:f53f  01 0f         ora ($0f,x)
$0e:f541  80 4d         bra $f590
$0e:f543  ae 17 0b      ldx $0b17
$0e:f546  c0 10         cpy #$10
$0e:f548  0d e9 db      ora $dbe9
$0e:f54b  f4 5b 2b      pea $2b5b
$0e:f54e  16 fc         asl $fc,x
$0e:f550  ff d6 1d f0   sbc $f01dd6,x
$0e:f554  87 7c         sta [$7c]
$0e:f556  63 3f         adc $3f,s
$0e:f558  38            sec
$0e:f559  13 f4         ora ($f4,s),y
$0e:f55b  b0 e6         bcs $f543
$0e:f55d  f3 62         sbc ($62,s),y
$0e:f55f  0c 7e 19      tsb $197e
$0e:f562  0e 37 85      asl $8537
$0e:f565  3e e1 7f      rol $7fe1,x
$0e:f568  80 df         bra $f549
$0e:f56a  e0 97         cpx #$97
$0e:f56c  e8            inx
$0e:f56d  04 ee         tsb $ee
$0e:f56f  01 0e         ora ($0e,x)
$0e:f571  58            cli
$0e:f572  81 bc         sta ($bc,x)
$0e:f574  81 03         sta ($03,x)
$0e:f576  03 83         ora $83,s
$0e:f578  91 09         sta ($09),y
$0e:f57a  f4 70 0d      pea $0d70
$0e:f57d  ce 0e d5      dec $d50e
$0e:f580  0f d2 ee a3   ora $a3eed2
$0e:f584  fe 0f fc      inc $fc0f,x
$0e:f587  42 9d         wdm #$9d
$0e:f589  d0 9c         bne $f527
$0e:f58b  48            pha
$0e:f58c  20 10 0b      jsr $0b10
$0e:f58f  e4 01         cpx $01
$0e:f591  5c 0b e1 4f   jml $4fe10b
$0e:f595  02 a0         cop #$a0
$0e:f597  3e 1c 0f      rol $0f1c,x
$0e:f59a  01 74         ora ($74,x)
$0e:f59c  0b            phd
$0e:f59d  a1 03         lda ($03,x)
$0e:f59f  80 41         bra $f5e2
$0e:f5a1  60            rts
$0e:f5a2  90 78         bcc $f61c
$0e:f5a4  34 12         bit $12,x
$0e:f5a6  09 06 36      ora #$3606
$0e:f5a9  91 b4         sta ($b4),y
$0e:f5ab  48            pha
$0e:f5ac  80 43         bra $f5f1
$0e:f5ae  08            php
$0e:f5af  0c 1e 04      tsb $041e
$0e:f5b2  79 5b 35      adc $355b,y
$0e:f5b5  9a            txs
$0e:f5b6  3f 3f 8d 48   and $488d3f,x
$0e:f5ba  a2 d0         ldx #$d0
$0e:f5bc  28            plp
$0e:f5bd  29 c0 51      and #$51c0
$0e:f5c0  67 19         adc [$19]
$0e:f5c2  9e 48 e7      stz $e748,x
$0e:f5c5  b2 78         lda ($78)
$0e:f5c7  e9 10 60      sbc #$6010
$0e:f5ca  69 93 a8      adc #$a893
$0e:f5cd  50 24         bvc $f5f3
$0e:f5cf  d2 68         cmp ($68)
$0e:f5d1  fc 3e 0d      jsr ($0d3e,x)
$0e:f5d4  02 1d         cop #$1d
$0e:f5d6  21 74         and ($74,x)
$0e:f5d8  38            sec
$0e:f5d9  13 f4         ora ($f4,s),y
$0e:f5db  f8            sed
$0e:f5dc  c0 e1         cpy #$e1
$0e:f5de  b0 38         bcs $f618
$0e:f5e0  14 0c         trb $0c
$0e:f5e2  74 97         stz $97,x
$0e:f5e4  4f 84 d2 09   eor $09d284
$0e:f5e8  98            tya
$0e:f5e9  c8            iny
$0e:f5ea  70 0c         bvs $f5f8
$0e:f5ec  42 66         wdm #$66
$0e:f5ee  03 69         ora $69,s
$0e:f5f0  78            sei
$0e:f5f1  a3 90         lda $90,s
$0e:f5f3  4f c5 73 c0   eor $c073c5
$0e:f5f7  6a            ror a
$0e:f5f8  07 30         ora [$30]
$0e:f5fa  60            rts
$0e:f5fb  1b            tcs
$0e:f5fc  26 8f         rol $8f
$0e:f5fe  09 fc 7e      ora #$7efc
$0e:f601  14 87         trb $87
$0e:f603  04 b3         tsb $b3
$0e:f605  f9 a3 37      sbc $37a3,y
$0e:f608  c8            iny
$0e:f609  1a            inc a
$0e:f60a  94 20         sty $20,x
$0e:f60c  aa            tax
$0e:f60d  67 b6         adc [$b6]
$0e:f60f  42 3a         wdm #$3a
$0e:f611  1c 0f a6      trb $a60f
$0e:f614  53 35         eor ($35,s),y
$0e:f616  08            php
$0e:f617  c2 c1         rep #$c1
$0e:f619  18            clc
$0e:f61a  c0 79         cpy #$79
$0e:f61c  28            plp
$0e:f61d  27 f3         and [$f3]
$0e:f61f  89 3c ba      bit #$ba3c
$0e:f622  62 3f 58      per $4e64
$0e:f625  6c 5e 3e      jmp ($3e5e)
$0e:f628  1a            inc a
$0e:f629  b4 03         ldy $03,x
$0e:f62b  c8            iny
$0e:f62c  de ef 75      dec $75ef,x
$0e:f62f  ba            tsx
$0e:f630  df b6 5b da   cmp $da5bb6,x
$0e:f634  83 7d         sta $7d,s
$0e:f636  e0 3f         cpx #$3f
$0e:f638  98            tya
$0e:f639  05 fe         ora $fe
$0e:f63b  01 0f         ora ($0f,x)
$0e:f63d  80 42         bra $f681
$0e:f63f  a6 b2         ldx $b2
$0e:f641  2b            pld
$0e:f642  ed 56 f5      sbc $f556
$0e:f645  7e bc cf      ror $cfbc,x
$0e:f648  e6 10         inc $10
$0e:f64a  77 e8         adc [$e8],y
$0e:f64c  12 86         ora ($86)
$0e:f64e  c1 00         cmp ($00,x)
$0e:f650  d3 60         cmp ($60,s),y
$0e:f652  22 30 09 6c   jsl $6c0930
$0e:f656  b3 61         lda ($61,s),y
$0e:f658  b0 ee         bcs $f648
$0e:f65a  44 3f 0b      mvp $0b,$3f
$0e:f65d  e0 80         cpx #$80
$0e:f65f  78            sei
$0e:f660  3c 16 6f      bit $6f16,x
$0e:f663  37 df         and [$df],y
$0e:f665  ef 5b d3 ef   sbc $efd35b
$0e:f669  a8            tay
$0e:f66a  de 02 51      dec $5102,x
$0e:f66d  db            stp
$0e:f66e  24 b6         bit $b6
$0e:f670  c8            iny
$0e:f671  6e e3 00      ror $00e3
$0e:f674  ef 0d fc 7f   sbc $7ffc0d
$0e:f678  dd 02 be      cmp $be02,x
$0e:f67b  c0 43         cpy #$43
$0e:f67d  61 25         adc ($25,x)
$0e:f67f  eb            xba
$0e:f680  43 7f         eor $7f,s
$0e:f682  d8            cld
$0e:f683  0b            phd
$0e:f684  fb            xce
$0e:f685  fc d8 c7      jsr ($c7d8,x)
$0e:f688  ac d0 5a      ldy $5ad0
$0e:f68b  ad 37 bf      lda $bf37
$0e:f68e  dc c2 01      jml [$01c2]
$0e:f691  ae ce 5e      ldx $5ece
$0e:f694  e0 53         cpx #$53
$0e:f696  e8            inx
$0e:f697  87 c2         sta [$c2]
$0e:f699  01 5c         ora ($5c,x)
$0e:f69b  fe 65 ef      inc $ef65,x
$0e:f69e  de 58 f4      dec $f458,x
$0e:f6a1  03 ff         ora $ff,s
$0e:f6a3  7f f0 7f 0b   adc $0b7ff0,x
$0e:f6a7  e1 e0         sbc ($e0,x)
$0e:f6a9  73 05         adc ($05,s),y
$0e:f6ab  62 81 b1      per $a82f
$0e:f6ae  c0 ac         cpy #$ac
$0e:f6b0  43 67         eor $67,s
$0e:f6b2  83 5a         sta $5a,s
$0e:f6b4  82 c4 95      brl $8c7b
$0e:f6b7  e1 5f         sbc ($5f,x)
$0e:f6b9  90 6f         bcc $f72a
$0e:f6bb  e8            inx
$0e:f6bc  2c 11 a1      bit $a111
$0e:f6bf  b1 45         lda ($45),y
$0e:f6c1  84 2b         sty $2b
$0e:f6c3  f0 ff         beq $f6c4
$0e:f6c5  b3 fd         lda ($fd,s),y
$0e:f6c7  c1 80         cmp ($80,x)
$0e:f6c9  04 06         tsb $06
$0e:f6cb  00 18         brk #$18
$0e:f6cd  bf df f2 97   lda $97f2df,x
$0e:f6d1  7c ab bc      jmp ($bcab,x)
$0e:f6d4  1e 8b 94      asl $948b,x
$0e:f6d7  b0 bb         bcs $f694
$0e:f6d9  f7 18         sbc [$18],y
$0e:f6db  ef 19 7b ce   sbc $ce7b19
$0e:f6df  60            rts
$0e:f6e0  18            clc
$0e:f6e1  dc 3e 52      jml [$523e]
$0e:f6e4  6f 95 c3 e3   adc $e3c395
$0e:f6e8  44 a0 24      mvp $24,$a0
$0e:f6eb  30 e8         bmi $f6d5
$0e:f6ed  40            rti
$0e:f6ee  22 82 11 8a   jsl $8a1182
$0e:f6f2  0b            phd
$0e:f6f3  80 5e         bra $f753
$0e:f6f5  03 52         ora $52,s
$0e:f6f7  16 8c         asl $8c,x
$0e:f6f9  00 42         brk #$42
$0e:f6fb  23 51         and $51,s
$0e:f6fd  22 20 f7 c9   jsl $c9f720
$0e:f701  de 5f eb      dec $eb5f,x
$0e:f704  35 9b         and $9b,x
$0e:f706  f5 37         sbc $37,x
$0e:f708  ac 9f c1      ldy $c19f
$0e:f70b  08            php
$0e:f70c  bf a8 03 bc   lda $bc03a8,x
$0e:f710  3e 93 f7      rol $f793,x
$0e:f713  f0 bd         beq $f6d2
$0e:f715  17 e8         ora [$e8],y
$0e:f717  8e f4 ff      stx $fff4
$0e:f71a  ac 34 3e      ldy $3e34
$0e:f71d  17 aa         ora [$aa],y
$0e:f71f  3e 30 48      rol $4830,x
$0e:f722  f7 a1         sbc [$a1],y
$0e:f724  b1 51         lda ($51),y
$0e:f726  86 e8         stx $e8
$0e:f728  35 45         and $45,x
$0e:f72a  a4 e5         ldy $e5
$0e:f72c  46 83         lsr $83
$0e:f72e  14 6a         trb $6a
$0e:f730  4e 54 c8      lsr $c854
$0e:f733  4e 49 41      lsr $4149
$0e:f736  99 91 c7      sta $c791,y
$0e:f739  40            rti
$0e:f73a  c3 3a         cmp $3a,s
$0e:f73c  1c ac 60      trb $60ac
$0e:f73f  34 41         bit $41,x
$0e:f741  2c 4e 6a      bit $6a4e
$0e:f744  24 01         bit $01
$0e:f746  9d 0d 7a      sta $7a0d,x
$0e:f749  f9 6d bd      sbc $bd6d,y
$0e:f74c  df 6d 03 a9   cmp $a9036d,x
$0e:f750  c2 6c         rep #$6c
$0e:f752  30 78         bmi $f7cc
$0e:f754  5b            tcd
$0e:f755  83 4c         sta $4c,s
$0e:f757  b0 e3         bcs $f73c
$0e:f759  f5 ac         sbc $ac,x
$0e:f75b  3f 00 ec 0f   and $0fec00,x
$0e:f75f  b2 37         lda ($37)
$0e:f761  d0 98         bne $f6fb
$0e:f763  8d ef 6a      sta $6aef
$0e:f766  d6 5f         dec $5f,x
$0e:f768  2f 65 70 be   and $be7065
$0e:f76c  1b            tcs
$0e:f76d  de e5 b0      dec $b0e5,x
$0e:f770  c2 60         rep #$60
$0e:f772  cc e1 84      cpy $84e1
$0e:f775  3f fa 43 d4   and $d443fa,x
$0e:f779  3e b2 b8      rol $b8b2,x
$0e:f77c  a3 b4         lda $b4,s
$0e:f77e  72 82         adc ($82)
$0e:f780  a3 7a         lda $7a,s
$0e:f782  a3 a8         lda $a8,s
$0e:f784  b2 86         lda ($86)
$0e:f786  a2 36         ldx #$36
$0e:f788  80 18         bra $f7a2
$0e:f78a  ec c0 f1      cpx $f1c0
$0e:f78d  fd 3b 88      sbc $883b,x
$0e:f790  28            plp
$0e:f791  a4 b2         ldy $b2
$0e:f793  fa            plx
$0e:f794  3a            dec a
$0e:f795  8c 48 81      sty $8148
$0e:f798  f8            sed
$0e:f799  a1 ca         lda ($ca,x)
$0e:f79b  e8            inx
$0e:f79c  8c a1 0f      sty $0fa1
$0e:f79f  c1 7c         cmp ($7c,x)
$0e:f7a1  0c 80 db      tsb $db80
$0e:f7a4  00 f9         brk #$f9
$0e:f7a6  da            phx
$0e:f7a7  47 81         eor [$81]
$0e:f7a9  6d be 92      adc $92be
$0e:f7ac  46 01         lsr $01
$0e:f7ae  69 be 81      adc #$81be
$0e:f7b1  47 0f         eor [$0f]
$0e:f7b3  7a            ply
$0e:f7b4  b8            clv
$0e:f7b5  b6 83         ldx $83,y
$0e:f7b7  61 85         adc ($85,x)
$0e:f7b9  2c 95 c7      bit $c795
$0e:f7bc  0a            asl a
$0e:f7bd  ef 25 aa 16   sbc $16aa25
$0e:f7c1  49 ac 11      eor #$11ac
$0e:f7c4  97 51         sta [$51],y
$0e:f7c6  1d 1e f1      ora $f11e,x
$0e:f7c9  7d fe b3      adc $b3fe,x
$0e:f7cc  06 fb         asl $fb
$0e:f7ce  ac b6 1d      ldy $1db6
$0e:f7d1  97 01         sta [$01],y
$0e:f7d3  85 90         sta $90
$0e:f7d5  b7 07         lda [$07],y
$0e:f7d7  0b            phd
$0e:f7d8  b0 ba         bcs $f794
$0e:f7da  1d 94 ba      ora $ba94,x
$0e:f7dd  0e a3 3a      asl $3aa3
$0e:f7e0  39 b4 07      and $07b4,y
$0e:f7e3  a0 91         ldy #$91
$0e:f7e5  a7 30         lda [$30]
$0e:f7e7  13 41         ora ($41,s),y
$0e:f7e9  43 5a         eor $5a,s
$0e:f7eb  c5 76         cmp $76
$0e:f7ed  99 c0 9e      sta $9ec0,y
$0e:f7f0  4e f9 fa      lsr $faf9
$0e:f7f3  18            clc
$0e:f7f4  04 c0         tsb $c0
$0e:f7f6  00 08         brk #$08
$0e:f7f8  bd 1c 08      lda $081c,x
$0e:f7fb  1f 81 ec 48   ora $48ec81,x
$0e:f7ff  82 fc 86      brl $7efe
$0e:f802  2b            pld
$0e:f803  68            pla
$0e:f804  38            sec
$0e:f805  02 84         cop #$84
$0e:f807  19 e4 41      ora $41e4,y
$0e:f80a  5b            tcd
$0e:f80b  81 c0         sta ($c0,x)
$0e:f80d  2d a3 84      and $84a3
$0e:f810  b4 df         ldy $df,x
$0e:f812  2d a3 b1      and $b1a3
$0e:f815  3a            dec a
$0e:f816  0e c0 90      asl $90c0
$0e:f819  97 1c         sta [$1c],y
$0e:f81b  23 b4         and $b4,s
$0e:f81d  09 80 84      ora #$8480
$0e:f820  3b            tsc
$0e:f821  4d b6 d8      eor $d8b6
$0e:f824  d7 03         cmp [$03],y
$0e:f826  a3 40         lda $40,s
$0e:f828  2f 2b c0 52   and $52c02b
$0e:f82c  01 d2         ora ($d2,x)
$0e:f82e  70 30         bvs $f860
$0e:f830  09 49 d2      ora #$d249
$0e:f833  0b            phd
$0e:f834  82 c5 0f      brl $07fc
$0e:f837  eb            xba
$0e:f838  5c 2f 0c 31   jml $310c2f
$0e:f83c  b0 28         bcs $f866
$0e:f83e  c4 fe         cpy $fe
$0e:f840  10 06         bpl $f848
$0e:f842  a8            tay
$0e:f843  4a            lsr a
$0e:f844  9a            txs
$0e:f845  e1 80         sbc ($80,x)
$0e:f847  69 8a c8      adc #$c88a
$0e:f84a  91 e0         sta ($e0),y
$0e:f84c  55 05         eor $05,x
$0e:f84e  28            plp
$0e:f84f  37 40         and [$40],y
$0e:f851  e4 17         cpx $17
$0e:f853  8b            phb
$0e:f854  db            stp
$0e:f855  74 2f         stz $2f,x
$0e:f857  83 b2         sta $b2,s
$0e:f859  b8            clv
$0e:f85a  e0 b2         cpx #$b2
$0e:f85c  79 3c 12      adc $123c,y
$0e:f85f  08            php
$0e:f860  30 18         bmi $f87a
$0e:f862  3b            tsc
$0e:f863  58            cli
$0e:f864  fc 09 65      jsr ($6509,x)
$0e:f867  78            sei
$0e:f868  c1 62         cmp ($62,x)
$0e:f86a  ff b8 26 10   sbc $1026b8,x
$0e:f86e  8b            phb
$0e:f86f  cd 4c 02      cmp $024c
$0e:f872  91 a4         sta ($a4),y
$0e:f874  cf a9 21 eb   cmp $eb21a9
$0e:f878  b1 ce         lda ($ce),y
$0e:f87a  ec 72 b0      cpx $b072
$0e:f87d  24 40         bit $40
$0e:f87f  20 15 79      jsr $7915
$0e:f882  dd 5e a2      cmp $a25e,x
$0e:f885  14 80         trb $80
$0e:f887  78            sei
$0e:f888  4e 42 92      lsr $9242
$0e:f88b  1d f1 70      ora $70f1,x
$0e:f88e  d0 66         bne $f8f6
$0e:f890  64 2a         stz $2a
$0e:f892  e3 71         sbc $71,s
$0e:f894  b9 1c 92      lda $921c,y
$0e:f897  8d 13 c3      sta $c313
$0e:f89a  a1 d1         lda ($d1,x)
$0e:f89c  30 d1         bmi $f86f
$0e:f89e  3c 0e 1e      bit $1e0e,x
$0e:f8a1  81 f4         sta ($f4,x)
$0e:f8a3  8e ee 37      stx $37ee
$0e:f8a6  3d 4d f6      and $f64d,x
$0e:f8a9  e7 a6         sbc [$a6]
$0e:f8ab  a4 4d         ldy $4d
$0e:f8ad  fa            plx
$0e:f8ae  44 78 1e      mvp $1e,$78
$0e:f8b1  7f 67 d9 6a   adc $6ad967,x
$0e:f8b5  0b            phd
$0e:f8b6  43 fa         eor $fa,s
$0e:f8b8  f1 d2         sbc ($d2),y
$0e:f8ba  23 eb         and $eb,s
$0e:f8bc  f6 79         inc $79,x
$0e:f8be  d6 a2         dec $a2,x
$0e:f8c0  c4 3f         cpy $3f
$0e:f8c2  af 6d 22 35   lda $35226d
$0e:f8c6  8f 36 f3 bb   sta $bbf336
$0e:f8ca  d2 f2         cmp ($f2)
$0e:f8cc  f0 fa         beq $f8c8
$0e:f8ce  4d 60 de      eor $de60
$0e:f8d1  79 b7 a9      adc $a9b7,y
$0e:f8d4  11 b0         ora ($b0),y
$0e:f8d6  7b            tdc
$0e:f8d7  b6 1c         ldx $1c,y
$0e:f8d9  be f7 31      ldx $31f7,y
$0e:f8dc  ca            dex
$0e:f8dd  0e 60 d8      asl $d860
$0e:f8e0  7b            tdc
$0e:f8e1  ac 02 13      ldy $1302
$0e:f8e4  9d 40 2b      sta $2b40,x
$0e:f8e7  10 07         bpl $f8f0
$0e:f8e9  a9 3e 84      lda #$843e
$0e:f8ec  48            pha
$0e:f8ed  73 ab         adc ($ab,s),y
$0e:f8ef  e6 b2         inc $b2
$0e:f8f1  f7 7d         sbc [$7d],y
$0e:f8f3  bc be a7      ldy $a7be,x
$0e:f8f6  09 75 c1      ora #$c175
$0e:f8f9  e1 70         sbc ($70,x)
$0e:f8fb  2f a9 a4 89   and $89a4a9
$0e:f8ff  4d f6 f3      eor $f3f6
$0e:f902  bb            tyx
$0e:f903  18            clc
$0e:f904  d4 e7         pei ($e7)
$0e:f906  7f b9 5c ae   adc $ae5cb9,x
$0e:f90a  66 3f         ror $3f
$0e:f90c  01 90         ora ($90,x)
$0e:f90e  d5 c8         cmp $c8,x
$0e:f910  a6 3f         ldx $3f
$0e:f912  19 9f 27      ora $279f,y
$0e:f915  91 c9         sta ($c9),y
$0e:f917  ab            plb
$0e:f918  14 80         trb $80
$0e:f91a  a0 05         ldy #$05
$0e:f91c  56 e8         lsr $e8,x
$0e:f91e  f4 3a 23      pea $233a
$0e:f921  51 30         eor ($30),y
$0e:f923  01 95         ora ($95,x)
$0e:f925  97 e2         sta [$e2],y
$0e:f927  35 15         and $15,x
$0e:f929  f8            sed
$0e:f92a  50 c7         bvc $f8f3
$0e:f92c  a0 78         ldy #$78
$0e:f92e  35 f8         and $f8,x
$0e:f930  91 45         sta ($45),y
$0e:f932  7e 13 92      ror $9213,x
$0e:f935  90 83         bcc $f8ba
$0e:f937  c9 7e 2e      cmp #$2e7e
$0e:f93a  f0 9d         beq $f8d9
$0e:f93c  2f c0 88 48   and $4888c0
$0e:f940  ba            tsx
$0e:f941  77 9a         adc [$9a],y
$0e:f943  73 8a         adc ($8a,s),y
$0e:f945  43 b9         eor $b9,s
$0e:f947  e9 ef 94      sbc #$94ef
$0e:f94a  4e 34 27      lsr $2734
$0e:f94d  28            plp
$0e:f94e  b0 ad         bcs $f8fd
$0e:f950  5e 9b 96      lsr $969b,x
$0e:f953  08            php
$0e:f954  8c 90 34      sty $3490
$0e:f957  75 87         adc $87,x
$0e:f959  91 24         sta ($24),y
$0e:f95b  85 e6         sta $e6
$0e:f95d  41 a2         eor ($a2,x)
$0e:f95f  bc 5f 2f      ldy $2f5f,x
$0e:f962  7a            ply
$0e:f963  cb            wai
$0e:f964  eb            xba
$0e:f965  e4 af         cpx $af
$0e:f967  16 c7         asl $c7,x
$0e:f969  f1 e0         sbc ($e0),y
$0e:f96b  30 98         bmi $f905
$0e:f96d  3b            tsc
$0e:f96e  ae 15 f2      ldx $f215
$0e:f971  58            cli
$0e:f972  0b            phd
$0e:f973  a0 44         ldy #$44
$0e:f975  60            rts
$0e:f976  14 91         trb $91
$0e:f978  19 be 48      ora $48be,y
$0e:f97b  22 07 81 75   jsl $758107
$0e:f97f  93 b0         sta ($b0,s),y
$0e:f981  55 42         eor $42,x
$0e:f983  78            sei
$0e:f984  19 98 fc      ora $fc98,y
$0e:f987  12 e4         ora ($e4)
$0e:f989  98            tya
$0e:f98a  41 f8         eor ($f8,x)
$0e:f98c  f2 39         sbc ($39)
$0e:f98e  24 f6         bit $f6
$0e:f990  5e 0f 24      lsr $240f,x
$0e:f993  b8            clv
$0e:f994  1d 1e 87      ora $871e,x
$0e:f997  40            rti
$0e:f998  be 06 23      ldx $2306,y
$0e:f99b  76 0f         ror $0f,x
$0e:f99d  44 d8 02      mvp $02,$d8
$0e:f9a0  f1 37         sbc ($37),y
$0e:f9a2  9a            txs
$0e:f9a3  bc 1d 82      ldy $821d,x
$0e:f9a6  af 15 c2 ce   lda $cec215
$0e:f9aa  95 e0         sta $e0,x
$0e:f9ac  43 13         eor $13,s
$0e:f9ae  e2 10         sep #$10
$0e:f9b0  89 0c 2b      bit #$2b0c
$0e:f9b3  23 3f         and $3f,s
$0e:f9b5  1b            tcs
$0e:f9b6  20 52 d0      jsr $d052
$0e:f9b9  83 05         sta $05,s
$0e:f9bb  15 b6         ora $b6,x
$0e:f9bd  c5 45         cmp $45
$0e:f9bf  77 66         adc [$66],y
$0e:f9c1  06 c8         asl $c8
$0e:f9c3  d8            cld
$0e:f9c4  1b            tcs
$0e:f9c5  80 c2         bra $f989
$0e:f9c7  e0 f0         cpx #$f0
$0e:f9c9  78            sei
$0e:f9ca  5b            tcd
$0e:f9cb  5e 17 61      lsr $6117,x
$0e:f9ce  85 0a         sta $0a
$0e:f9d0  83 c8         sta $c8,s
$0e:f9d2  36 01         rol $01,x
$0e:f9d4  e3 10         sbc $10,s
$0e:f9d6  0d ab 59      ora $59ab
$0e:f9d9  7d be 5e      adc $5ebe,x
$0e:f9dc  ef 77 db c8   sbc $c8db77
$0e:f9e0  04 80         tsb $80
$0e:f9e2  25 72         and $72
$0e:f9e4  7a            ply
$0e:f9e5  03 e0         ora $e0,s
$0e:f9e7  b0 20         bcs $fa09
$0e:f9e9  d6 0f         dec $0f,x
$0e:f9eb  41 bd         eor ($bd,x)
$0e:f9ed  8d e7 44      sta $44e7
$0e:f9f0  09 84 cc      ora #$cc84
$0e:f9f3  7e 5f d1      ror $d15f,x
$0e:f9f6  f9 8f c2      sbc $c28f,y
$0e:f9f9  84 cd         sty $cd
$0e:f9fb  0e 49 3e      asl $3e49
$0e:f9fe  d9 a1 d1      cmp $d1a1,y
$0e:fa01  2f db 30 4d   and $4d30db
$0e:fa05  fe 80 f4      inc $f480,x
$0e:fa08  8f a8 bd 67   sta $67bda8
$0e:fa0c  ec 4f 6a      cpx $6a4f
$0e:fa0f  fb            xce
$0e:fa10  86 6b         stx $6b
$0e:fa12  1e 6a c3      asl $c36a,x
$0e:fa15  ae eb 1e      ldx $1eeb
$0e:fa18  ee 17 4f      inc $4f17
$0e:fa1b  a7 be         lda [$be]
$0e:fa1d  dc 81 43      jml [$4381]
$0e:fa20  a7 c5         lda [$c5]
$0e:fa22  f7 3d         sbc [$3d],y
$0e:fa24  0b            phd
$0e:fa25  d7 ec         cmp [$ec],y
$0e:fa27  fb            xce
$0e:fa28  7d bd c1      adc $c1bd,x
$0e:fa2b  40            rti
$0e:fa2c  0a            asl a
$0e:fa2d  97 3b         sta [$3b],y
$0e:fa2f  9e e1 1b      stz $1be1,x
$0e:fa32  07 07         ora [$07]
$0e:fa34  c7 e3         cmp [$e3]
$0e:fa36  f3 09         sbc ($09,s),y
$0e:fa38  00 4a         brk #$4a
$0e:fa3a  5d c7 a0      eor $a0c7,x
$0e:fa3d  ea            nop
$0e:fa3e  7b            tdc
$0e:fa3f  7c 3e 97      jmp ($973e,x)
$0e:fa42  4b            phk
$0e:fa43  af dd 1a 1f   lda $1f1add
$0e:fa47  13 8a         ora ($8a,s),y
$0e:fa49  e1 0d         sbc ($0d,x)
$0e:fa4b  8e f7 97      stx $97f7
$0e:fa4e  de ef 77      dec $77ef,x
$0e:fa51  c8            iny
$0e:fa52  69 cc e6      adc #$e6cc
$0e:fa55  bb            tyx
$0e:fa56  c9 c7 ce      cmp #$cec7
$0e:fa59  1d b0 38      ora $38b0,x
$0e:fa5c  42 90         wdm #$90
$0e:fa5e  75 07         adc $07,x
$0e:fa60  0b            phd
$0e:fa61  d0 e5         bne $fa48
$0e:fa63  72 b9         adc ($b9)
$0e:fa65  dd 8d 0a      cmp $0a8d,x
$0e:fa68  08            php
$0e:fa69  20 44 1c      jsr $1c44
$0e:fa6c  02 01         cop #$01
$0e:fa6e  41 99         eor ($99,x)
$0e:fa70  cc e7 75      cpy $75e7
$0e:fa73  74 a8         stz $a8,x
$0e:fa75  24 81         bit $81
$0e:fa77  30 68         bmi $fae1
$0e:fa79  f0 84         beq $f9ff
$0e:fa7b  42 29         wdm #$29
$0e:fa7d  ca            dex
$0e:fa7e  10 52         bpl $fad2
$0e:fa80  0a            asl a
$0e:fa81  8d 11 e1      sta $e111
$0e:fa84  28            plp
$0e:fa85  88            dey
$0e:fa86  56 22         lsr $22,x
$0e:fa88  0b            phd
$0e:fa89  41 98         eor ($98,x)
$0e:fa8b  56 16         lsr $16,x
$0e:fa8d  20 b4 14      jsr $14b4
$0e:fa90  78            sei
$0e:fa91  44 62 75      mvp $75,$62
$0e:fa94  88            dey
$0e:fa95  9b            txy
$0e:fa96  10 62         bpl $fafa
$0e:fa98  55 86         eor $86,x
$0e:fa9a  08            php
$0e:fa9b  31 05         and ($05),y
$0e:fa9d  1e 10 0b      asl $0b10,x
$0e:faa0  4f 6e d0 cf   eor $cfd06e
$0e:faa4  86 78         stx $78
$0e:faa6  dc 77 b7      jml [$b777]
$0e:faa9  06 fc         asl $fc
$0e:faab  18            clc
$0e:faac  c6 73         dec $73
$0e:faae  51 9d         eor ($9d),y
$0e:fab0  72 f9         adc ($f9)
$0e:fab2  8f 20 7c 02   sta $027c20
$0e:fab6  10 9d         bpl $fa55
$0e:fab8  e8            inx
$0e:fab9  f0 27         beq $fae2
$0e:fabb  c8            iny
$0e:fabc  a5 45         lda $45
$0e:fabe  ff 41 82 07   sbc $078241,x
$0e:fac2  f8            sed
$0e:fac3  01 aa         ora ($aa,x)
$0e:fac5  c3 80         cmp $80,s
$0e:fac7  0d a8 e0      ora $e0a8
$0e:faca  4f e0 94 20   eor $2094e0
$0e:face  da            phx
$0e:facf  d8            cld
$0e:fad0  ca            dex
$0e:fad1  40            rti
$0e:fad2  7f 04 88 a6   adc $a68804,x
$0e:fad6  0c 9e dc      tsb $dc9e
$0e:fad9  8e 49 9d      stx $9d49
$0e:fadc  09 e2 95      ora #$95e2
$0e:fadf  1a            inc a
$0e:fae0  41 d4         eor ($d4,x)
$0e:fae2  fa            plx
$0e:fae3  1d 13 d8      ora $d813,x
$0e:fae6  4a            lsr a
$0e:fae7  cf e0 f9 42   cmp $42f9e0
$0e:faeb  90 9f         bcc $fa8c
$0e:faed  c6 56         dec $56
$0e:faef  58            cli
$0e:faf0  10 4a         bpl $fb3c
$0e:faf2  03 04         ora $04,s
$0e:faf4  b0 54         bcs $fb4a
$0e:faf6  e8            inx
$0e:faf7  44 21 e4      mvp $e4,$21
$0e:fafa  2a            rol a
$0e:fafb  00 52         brk #$52
$0e:fafd  9a            txs
$0e:fafe  7c 6b 11      jmp ($116b,x)
$0e:fb01  09 83 c8      ora #$c883
$0e:fb04  62 0b 54      per $4f12
$0e:fb07  57 82         eor [$82],y
$0e:fb09  ec 22 71      cpx $7122
$0e:fb0c  27 90         and [$90]
$0e:fb0e  c4 d8         cpy $d8
$0e:fb10  a9 60 62      lda #$6260
$0e:fb13  87 6e         sta [$6e]
$0e:fb15  d1 00         cmp ($00),y
$0e:fb17  79 0b ac      adc $ac0b,y
$0e:fb1a  5a            phy
$0e:fb1b  a5 58         lda $58
$0e:fb1d  6c 86 f6      jmp ($f686)
$0e:fb20  e0 d1         cpx #$d1
$0e:fb22  c2 90         rep #$90
$0e:fb24  86 08         stx $08
$0e:fb26  48            pha
$0e:fb27  63 41         adc $41,s
$0e:fb29  38            sec
$0e:fb2a  93 ca         sta ($ca,s),y
$0e:fb2c  c5 0a         cmp $0a
$0e:fb2e  06 f0         asl $f0
$0e:fb30  bd 55 86      lda $8655,x
$0e:fb33  60            rts
$0e:fb34  16 a4         asl $a4,x
$0e:fb36  a1 3d         lda ($3d,x)
$0e:fb38  84 66         sty $66
$0e:fb3a  25 f1         and $f1
$0e:fb3c  4d 92 3c      eor $3c92
$0e:fb3f  68            pla
$0e:fb40  4f 70 42 8b   eor $8b4270
$0e:fb44  f0 79         beq $fbbf
$0e:fb46  1c 92 fa      trb $fa92
$0e:fb49  15 db         ora $db,x
$0e:fb4b  a3 d0         lda $d0,s
$0e:fb4d  e8            inx
$0e:fb4e  74 69         stz $69,x
$0e:fb50  07 33         ora [$33]
$0e:fb52  7f 8b f0 65   adc $65f08b,x
$0e:fb56  67 f0         adc [$f0]
$0e:fb58  9d bb c5      sta $c5bb,x
$0e:fb5b  de 87 f1      dec $f187,x
$0e:fb5e  29 89 08      and #$0889
$0e:fb61  9f e8 53 18   sta $1853e8,x
$0e:fb65  44 22 9c      mvp $9c,$22
$0e:fb68  9f 05 11 be   sta $be1105,x
$0e:fb6c  47 93         eor [$93]
$0e:fb6e  4e a7 44      lsr $44a7
$0e:fb71  22 15 85 78   jsl $788515
$0e:fb75  2c 8d f2      bit $f28d
$0e:fb78  3d 1b 05      and $051b,x
$0e:fb7b  82 27 13      brl $0ea5
$0e:fb7e  5f 0b 08 df   eor $df080b,x
$0e:fb82  25 58         and $58
$0e:fb84  76 0b         ror $0b,x
$0e:fb86  b0 5c         bcs $fbe4
$0e:fb88  a6 c9         ldx $c9
$0e:fb8a  38            sec
$0e:fb8b  2b            pld
$0e:fb8c  3f 65 42 c1   and $c14265,x
$0e:fb90  78            sei
$0e:fb91  f8            sed
$0e:fb92  0b            phd
$0e:fb93  c2 7e         rep #$7e
$0e:fb95  24 f1         bit $f1
$0e:fb97  af 91 bc af   lda $afbc91
$0e:fb9b  e6 8f         inc $8f
$0e:fb9d  37 1c         and [$1c],y
$0e:fb9f  ac ff 54      ldy $54ff
$0e:fba2  43 70         eor $70,s
$0e:fba4  4c d1 f5      jmp $f5d1
$0e:fba7  42 37         wdm #$37
$0e:fba9  05 3b         ora $3b
$0e:fbab  93 c8         sta ($c8,s),y
$0e:fbad  a7 72         lda [$72]
$0e:fbaf  39 2a 40      and $402a,y
$0e:fbb2  51 82         eor ($82),y
$0e:fbb4  8c 13 e0      sty $e013
$0e:fbb7  6e 0b 07      ror $070b
$0e:fbba  47 a1         eor [$a1]
$0e:fbbc  60            rts
$0e:fbbd  e8            inx
$0e:fbbe  74 56         stz $56,x
$0e:fbc0  80 b3         bra $fb75
$0e:fbc2  05 98         ora $98
$0e:fbc4  2b            pld
$0e:fbc5  c0 dc 15      cpy #$15dc
$0e:fbc8  8e 34 69      stx $6934
$0e:fbcb  7e 06 e4      ror $e406,x
$0e:fbce  ec 76 7b      cpx $7b76
$0e:fbd1  46 e0         lsr $e0
$0e:fbd3  ed ee 7f      sbc $7fee
$0e:fbd6  bc 53 72      ldy $7253,x
$0e:fbd9  f8            sed
$0e:fbda  3c 3e 23      bit $233e,x
$0e:fbdd  70 6f         bvs $fc4e
$0e:fbdf  79 72 2e      adc $2e72,y
$0e:fbe2  69 b9 76      adc #$76b9
$0e:fbe5  be 1d b9      ldx $b91d,y
$0e:fbe8  b8            clv
$0e:fbe9  20 0e f0      jsr $f00e
$0e:fbec  ac 3c 81      ldy $813c
$0e:fbef  df 0e f1 b0   cmp $b0f10e,x
$0e:fbf3  41 6c         eor ($6c,x)
$0e:fbf5  0f f8 77 94   ora $9477f8
$0e:fbf9  a9 e8 61      lda #$61e8
$0e:fbfc  34 77         bit $77,x
$0e:fbfe  fc 02 d5      jsr ($d502,x)
$0e:fc01  ac ed eb      ldy $ebed
$0e:fc04  2f 97 bb e8   and $e8bb97
$0e:fc08  c9 43 e1      cmp #$e143
$0e:fc0b  72 b5         adc ($b5)
$0e:fc0d  ef 6d 78 4c   sbc $4c786d
$0e:fc11  1e 16 d6      asl $d616,x
$0e:fc14  48            pha
$0e:fc15  02 29         cop #$29
$0e:fc17  07 c5         ora [$c5]
$0e:fc19  fa            plx
$0e:fc1a  65 49         adc $49
$0e:fc1c  b4 f6         ldy $f6,x
$0e:fc1e  ed 05 f2      sbc $f205
$0e:fc21  b6 99         ldx $99,y
$0e:fc23  08            php
$0e:fc24  9e 57 1d      stz $1d57,x
$0e:fc27  ed c0 de      sbc $dec0
$0e:fc2a  5b            tcd
$0e:fc2b  03 a1         ora $a1,s
$0e:fc2d  13 cd         ora ($cd,s),y
$0e:fc2f  e7 24         sbc [$24]
$0e:fc31  f2 01         sbc ($01)
$0e:fc33  07 6c         ora [$6c]
$0e:fc35  6a            ror a
$0e:fc36  3d bf e8      and $e8bf,x
$0e:fc39  10 89         bpl $fbc4
$0e:fc3b  e7 2a         sbc [$2a]
$0e:fc3d  de 91 47      dec $4791,x
$0e:fc40  7a            ply
$0e:fc41  13 33         ora ($33,s),y
$0e:fc43  f7 ab         sbc [$ab],y
$0e:fc45  fc 3e 04      jsr ($043e,x)
$0e:fc48  81 67         sta ($67,x)
$0e:fc4a  bb            tyx
$0e:fc4b  77 d6         adc [$d6],y
$0e:fc4d  63 39         adc $39,s
$0e:fc4f  a8            tay
$0e:fc50  ce 86 a3      dec $a386
$0e:fc53  7c be 99      jmp ($99be,x)
$0e:fc56  01 68         ora ($68,x)
$0e:fc58  30 54         bmi $fcae
$0e:fc5a  d0 3c         bne $fc98
$0e:fc5c  84 8a         sty $8a
$0e:fc5e  38            sec
$0e:fc5f  4c 29 d0      jmp $d029
$0e:fc62  16 82         asl $82,x
$0e:fc64  a9 17 90      lda #$9017
$0e:fc67  af 51 22 0e   lda $0e2251
$0e:fc6b  d6 0a         dec $0a,x
$0e:fc6d  aa            tax
$0e:fc6e  d0 7b         bne $fceb
$0e:fc70  7a            ply
$0e:fc71  cb            wai
$0e:fc72  60            rts
$0e:fc73  8a            txa
$0e:fc74  da            phx
$0e:fc75  41 74         eor ($74,x)
$0e:fc77  09 1d a5      ora #$a51d
$0e:fc7a  f0 17         beq $fc93
$0e:fc7c  91 59         sta ($59),y
$0e:fc7e  2f c4 24 77   and $7724c4
$0e:fc82  10 40         bpl $fcc4
$0e:fc84  60            rts
$0e:fc85  49 74 9a      eor #$9a74
$0e:fc88  34 d2         bit $d2,x
$0e:fc8a  04 8a         tsb $8a
$0e:fc8c  d5 db         cmp $db,x
$0e:fc8e  b6 de         ldx $de,y
$0e:fc90  ef 76 de dd   sbc $ddde76
$0e:fc94  b0 9c         bcs $fc32
$0e:fc96  d7 2d         cmp [$2d],y
$0e:fc98  ef 9f ed f6   sbc $f6ed9f
$0e:fc9c  fa            plx
$0e:fc9d  ef 6e 8c e2   sbc $e28c6e
$0e:fca1  a0 cc e8      ldy #$e8cc
$0e:fca4  4c 01 e0      jmp $e001
$0e:fca7  f8            sed
$0e:fca8  fc 7f d5      jsr ($d57f,x)
$0e:fcab  d2 42         cmp ($42)
$0e:fcad  14 40         trb $40
$0e:fcaf  bf 0b c7 0f   lda $0fc70b,x
$0e:fcb3  a5 d2         lda $d2
$0e:fcb5  e2 12         sep #$12
$0e:fcb7  81 9c         sta ($9c,x)
$0e:fcb9  52 88         eor ($88)
$0e:fcbb  84 c1         sty $c1
$0e:fcbd  d8            cld
$0e:fcbe  18            clc
$0e:fcbf  00 28         brk #$28
$0e:fcc1  01 80         ora ($80,x)
$0e:fcc3  b4 06         ldy $06,x
$0e:fcc5  82 88 c4      brl $c150
$0e:fcc8  e2 4d         sep #$4d
$0e:fcca  ef 6a fb 82   sbc $82fb6a
$0e:fcce  03 40         ora $40,s
$0e:fcd0  47 1b         eor [$1b]
$0e:fcd2  e5 ee         sbc $ee
$0e:fcd4  fa            plx
$0e:fcd5  82 1e 35      brl $31f6
$0e:fcd8  80 38         bra $fd12
$0e:fcda  45 62         eor $62
$0e:fcdc  5c 06 15 f2   jml $f21506
$0e:fce0  50 52         bvc $fd34
$0e:fce2  60            rts
$0e:fce3  bf 80 98 fc   lda $fc9880,x
$0e:fce7  69 51 30      adc #$3051
$0e:fcea  47 46         eor [$46]
$0e:fcec  16 57         asl $57,x
$0e:fcee  ea            nop
$0e:fcef  04 e0         tsb $e0
$0e:fcf1  1a            inc a
$0e:fcf2  42 10         wdm #$10
$0e:fcf4  bc 3d 02      ldy $023d,x
$0e:fcf7  d0 17         bne $fd10
$0e:fcf9  a5 b8         lda $b8
$0e:fcfb  61 6e         adc ($6e,x)
$0e:fcfd  02 78         cop #$78
$0e:fcff  7f 0b bc 85   adc $85bc0b,x
$0e:fd03  07 58         ora [$58]
$0e:fd05  10 85         bpl $fc8c
$0e:fd07  ab            plb
$0e:fd08  b7 6d         lda [$6d],y
$0e:fd0a  bd de ed      lda $edde,x
$0e:fd0d  bd bb 61      lda $61bb,x
$0e:fd10  a1 36         lda ($36,x)
$0e:fd12  70 0b         bvs $fd1f
$0e:fd14  96 f7         stx $f7,y
$0e:fd16  cf f6 fb 7d   cmp $7dfbf6
$0e:fd1a  77 b7         adc [$b7],y
$0e:fd1c  43 42         eor $42,s
$0e:fd1e  71 9d         adc ($9d),y
$0e:fd20  e3 c1         sbc $c1,s
$0e:fd22  f1 f8         sbc ($f8),y
$0e:fd24  fb            xce
$0e:fd25  82 31 a0      brl $9d59
$0e:fd28  cc e8 45      cpy $45e8
$0e:fd2b  c0 47         cpy #$47
$0e:fd2d  0d e3 87      ora $87e3
$0e:fd30  d2 e9         cmp ($e9)
$0e:fd32  71 2f         adc ($2f),y
$0e:fd34  2b            pld
$0e:fd35  f0 84         beq $fcbb
$0e:fd37  2a            rol a
$0e:fd38  43 8d         eor $8d,s
$0e:fd3a  c2 dc         rep #$dc
$0e:fd3c  bb            tyx
$0e:fd3d  40            rti
$0e:fd3e  a6 18         ldx $18
$0e:fd40  30 38         bmi $fd7a
$0e:fd42  60            rts
$0e:fd43  5d a1 28      eor $28a1,x
$0e:fd46  88            dey
$0e:fd47  4c 38 dc      jmp $dc38
$0e:fd4a  ae 5b 82      ldx $825b
$0e:fd4d  22 39 f8 97   jsl $97f839
$0e:fd51  19 98 0e      ora $0e98,y
$0e:fd54  09 c4 c0      ora #$c0c4
$0e:fd57  19 99 91      ora $9199,y
$0e:fd5a  6d 92 74      adc $7492
$0e:fd5d  1e 0f b5      asl $b50f,x
$0e:fd60  f0 ed         beq $fd4f
$0e:fd62  d9 80 8d      cmp $8d80,y
$0e:fd65  07 8f         ora [$8f]
$0e:fd67  80 ae         bra $fd17
$0e:fd69  c0 00 f1      cpy #$f100
$0e:fd6c  0f 84 bc 60   ora $60bc84
$0e:fd70  be 8f 4f      ldx $4f8f,y
$0e:fd73  a9 98 0a      lda #$0a98
$0e:fd76  d0 e9         bne $fd61
$0e:fd78  f4 f7 c6      pea $c6f7
$0e:fd7b  04 d6         tsb $d6
$0e:fd7d  f6 f4         inc $f4,x
$0e:fd7f  ec c0 5e      cpx $5ec0
$0e:fd82  87 7b         sta [$7b]
$0e:fd84  bd cc 38      lda $38cc,x
$0e:fd87  27 33         and [$33]
$0e:fd89  7b            tdc
$0e:fd8a  af 18 40 c0   lda $c04018
$0e:fd8e  87 f2         sta [$f2]
$0e:fd90  30 32         bmi $fdc4
$0e:fd92  79 18 50      adc $5018,y
$0e:fd95  c4 9c         cpy $9c
$0e:fd97  56 60         lsr $60,x
$0e:fd99  9c 50 e4      stz $e450
$0e:fd9c  9c d4 66      stz $66d4
$0e:fd9f  b2 bd         lda ($bd)
$0e:fda1  b7 e5         lda [$e5],y
$0e:fda3  70 b5         bvs $fd5a
$0e:fda5  ef 6d 77 48   sbc $48776d
$0e:fda9  03 ce         ora $ce,s
$0e:fdab  ab            plb
$0e:fdac  0f 31 b6 bc   ora $bcb631
$0e:fdb0  e2 d3         sep #$d3
$0e:fdb2  db            stp
$0e:fdb3  b4 3c         ldy $3c,x
$0e:fdb5  c3 60         cmp $60,s
$0e:fdb7  f3 8b         sbc ($8b,s),y
$0e:fdb9  8e f6 e0      stx $e0f6
$0e:fdbc  fe 47 cb      inc $cb47,x
$0e:fdbf  7e 7b 77      ror $777b,x
$0e:fdc2  d1 1d         cmp ($1d),y
$0e:fdc4  58            cli
$0e:fdc5  25 5b         and $5b
$0e:fdc7  dc 28 8e      jml [$8e28]
$0e:fdca  ec 16 01      cpx $0116
$0e:fdcd  16 17         asl $17,x
$0e:fdcf  c0 a5         cpy #$a5
$0e:fdd1  ef 3a b5 9f   sbc $9fb53a
$0e:fdd5  c1 e7         cmp ($e7,x)
$0e:fdd7  68            pla
$0e:fdd8  ef 4f fa c3   sbc $c3fa4f
$0e:fddc  d8            cld
$0e:fddd  3e d2 f7      rol $f7d2,x
$0e:fde0  1f bd 3c 0b   ora $0b3cbd,x
$0e:fde4  e1 6f         sbc ($6f,x)
$0e:fde6  13 f8         ora ($f8,s),y
$0e:fde8  e3 c9         sbc $c9,s
$0e:fdea  3e 5a f3      rol $f35a,x
$0e:fded  5f 9f 3d 1b   eor $1b3d9f,x
$0e:fdf1  e9 ef 57      sbc #$57ef
$0e:fdf4  fb            xce
$0e:fdf5  03 da         ora $da,s
$0e:fdf7  3e de aa      rol $aade,x
$0e:fdfa  75 3b         adc $3b,x
$0e:fdfc  93 c8         sta ($c8,s),y
$0e:fdfe  a7 72         lda [$72]
$0e:fe00  39 34 e6      and $e634,y
$0e:fe03  f2 f2         sbc ($f2)
$0e:fe05  6c 16 0e      jmp ($0e16)
$0e:fe08  8f 42 c1 d0   sta $d0c142
$0e:fe0c  e8            inx
$0e:fe0d  d8            cld
$0e:fe0e  1b            tcs
$0e:fe0f  cb            wai
$0e:fe10  c6 ac         dec $ac
$0e:fe12  56 38         lsr $38,x
$0e:fe14  d1 a0         cmp ($a0),y
$0e:fe16  80 03         bra $fe1b
$0e:fe18  80 0e         bra $fe28
$0e:fe1a  d0 5e         bne $fe7a
$0e:fe1c  de e7 ff      dec $ffe7,x
$0e:fe1f  c5 0a         cmp $0a
$0e:fe21  4c ab 7b      jmp $7bab
$0e:fe24  cb            wai
$0e:fe25  91 73         sta ($73),y
$0e:fe27  42 92         wdm #$92
$0e:fe29  ff 00 a0 04   sbc $04a000,x
$0e:fe2d  40            rti
$0e:fe2e  7c 0d e5      jmp ($e50d,x)
$0e:fe31  ec 76 c4      cpx $c476
$0e:fe34  01 be         ora ($be,x)
$0e:fe36  dc ff 77      jml [$77ff]
$0e:fe39  dc 56 f2      jml [$f256]
$0e:fe3c  f8            sed
$0e:fe3d  37 a3         and [$a3],y
$0e:fe3f  00 e6         brk #$e6
$0e:fe41  0c 43 99      tsb $9943
$0e:fe44  cd 6f 2e      cmp $2e6f
$0e:fe47  d5 bd         cmp $bd,x
$0e:fe49  a6 e7         ldx $e7
$0e:fe4b  be 5e ef      ldx $ef5e,y
$0e:fe4e  a8            tay
$0e:fe4f  71 b4         adc ($b4),y
$0e:fe51  1b            tcs
$0e:fe52  9f 09 83 c2   sta $c28309,x
$0e:fe56  a5 c6         lda $c6
$0e:fe58  e0 6e         cpx #$6e
$0e:fe5a  da            phx
$0e:fe5b  c1 bb         cmp ($bb,x)
$0e:fe5d  bd 0d ed      lda $ed0d,x
$0e:fe60  f8            sed
$0e:fe61  2f f7 52 bf   and $bf52f7
$0e:fe65  dd 8f 23      cmp $238f,x
$0e:fe68  92 ef         sta ($ef)
$0e:fe6a  9a            txs
$0e:fe6b  75 3b         adc $3b,x
$0e:fe6d  93 b8         sta ($b8,s),y
$0e:fe6f  dc f4 ca      jml [$caf4]
$0e:fe72  40            rti
$0e:fe73  01 20         ora ($20,x)
$0e:fe75  08            php
$0e:fe76  6f c6 a1 58   adc $58a1c6
$0e:fe7a  e8            inx
$0e:fe7b  f0 3c         beq $feb9
$0e:fe7d  de 6f 1f      dec $1f6f,x
$0e:fe80  8c 22 21      sty $2122
$0e:fe83  30 f3         bmi $fe78
$0e:fe85  71 fb         adc ($fb),y
$0e:fe87  1d 9e cf      ora $cf9e,x
$0e:fe8a  6a            ror a
$0e:fe8b  b1 ba         lda ($ba),y
$0e:fe8d  eb            xba
$0e:fe8e  f7 7a         sbc [$7a],y
$0e:fe90  42 11         wdm #$11
$0e:fe92  11 86         ora ($86),y
$0e:fe94  ea            nop
$0e:fe95  b1 e0         lda ($e0),y
$0e:fe97  f9 fc fc      sbc $fcfc,y
$0e:fe9a  55 8d         eor $8d,x
$0e:fe9c  87 7f         sta [$7f]
$0e:fe9e  97 de         sta [$de],y
$0e:fea0  18            clc
$0e:fea1  88            dey
$0e:fea2  cc 36 0a      cpy $0a36
$0e:fea5  d0 16         bne $febd
$0e:fea7  06 dc         asl $dc
$0e:fea9  38            sec
$0e:feaa  2f f1 04 20   and $2004f1
$0e:feae  ec 85 83      cpx $8385
$0e:feb1  c0 f7         cpy #$f7
$0e:feb3  fd be df      sbc $dfbe,x
$0e:feb6  5e 39 21      lsr $2139,x
$0e:feb9  f6 fe         inc $fe,x
$0e:febb  bf 61 50 39   lda $395061,x
$0e:febf  dc f2 c4      jml [$c4f2]
$0e:fec2  56 02         lsr $02,x
$0e:fec4  01 f6         ora ($f6,x)
$0e:fec6  ee 56 0b      inc $0b56
$0e:fec9  11 db         ora ($db),y
$0e:fecb  10 07         bpl $fed4
$0e:fecd  4b            phk
$0e:fece  89 c5 2c      bit #$2cc5
$0e:fed1  46 f4         lsr $f4
$0e:fed3  60            rts
$0e:fed4  1d ee 67      ora $67ee,x
$0e:fed7  34 d1         bit $d1,x
$0e:fed9  3d bd c8      and $c8bd,x
$0e:fedc  18            clc
$0e:fedd  b8            clv
$0e:fede  a4 a3         ldy $a3
$0e:fee0  f4 fa 7d      pea $7dfa
$0e:fee3  57 30         eor [$30],y
$0e:fee5  82 79 89      brl $8861
$0e:fee8  47 db         eor [$db]
$0e:feea  de fc a0      dec $a0fc,x
$0e:feed  a2 80         ldx #$80
$0e:feef  13 08         ora ($08,s),y
$0e:fef1  8c 38 be      sty $be38
$0e:fef4  85 78         sta $78
$0e:fef6  eb            xba
$0e:fef7  10 e1         bpl $feda
$0e:fef9  b3 1c         lda ($1c,s),y
$0e:fefb  00 d8         brk #$d8
$0e:fefd  46 61         lsr $61
$0e:feff  cd f8 12      cmp $12f8
$0e:ff02  43 e5         eor $e5,s
$0e:ff04  b0 4b         bcs $ff51
$0e:ff06  83 84         sta $84,s
$0e:ff08  14 60         trb $60
$0e:ff0a  07 10         ora [$10]
$0e:ff0c  00 aa         brk #$aa
$0e:ff0e  43 8d         eor $8d,s
$0e:ff10  00 77         brk #$77
$0e:ff12  f8            sed
$0e:ff13  03 c2         ora $c2,s
$0e:ff15  3e 22 f1      rol $f122,x
$0e:ff18  9f 91 3c ab   sta $ab3c91,x
$0e:ff1c  e6 6f         inc $6f
$0e:ff1e  3b            tsc
$0e:ff1f  fa            plx
$0e:ff20  23 d3         and $d3,s
$0e:ff22  3e aa f5      rol $f5aa,x
$0e:ff25  df b3 3d bb   cmp $bb3db3,x
$0e:ff29  ee ef 7f      inc $7fef
$0e:ff2c  f8            sed
$0e:ff2d  43 c4         eor $c4,s
$0e:ff2f  3e 32 f2      rol $f232,x
$0e:ff32  1f 95 3c cb   ora $cb3c95,x
$0e:ff36  e7 6f         sbc [$6f]
$0e:ff38  43 fa         eor $fa,s
$0e:ff3a  63 d5         adc $d5,s
$0e:ff3c  3e ba f6      rol $f6ba,x
$0e:ff3f  5f b7 3e 01   eor $013eb7,x
$0e:ff43  4e a7 72      lsr $72a7
$0e:ff46  79 14 ee      adc $ee14,y
$0e:ff49  47 25         eor [$25]
$0e:ff4b  e0 4d         cpx #$4d
$0e:ff4d  e2 e3         sep #$e3
$0e:ff4f  58            cli
$0e:ff50  2c 1d 1e      bit $1e1d
$0e:ff53  85 83         sta $83
$0e:ff55  a1 d1         lda ($d1,x)
$0e:ff57  00 0d         brk #$0d
$0e:ff59  61 f4         adc ($f4,x)
$0e:ff5b  75 8a         adc $8a,x
$0e:ff5d  c7 1a         cmp [$1a]
$0e:ff5f  34 10         bit $10,x
$0e:ff61  00 70         brk #$70
$0e:ff63  05 05         ora $05
$0e:ff65  f4 70 5e      pea $5e70
$0e:ff68  de e7 ff      dec $ffe7,x
$0e:ff6b  c5 0a         cmp $0a
$0e:ff6d  44 02 55      mvp $55,$02
$0e:ff70  bd e5 c8      lda $c8e5,x
$0e:ff73  b9 a1 43      lda $43a1,y
$0e:ff76  b0 37         bcs $ffaf
$0e:ff78  8d fe 01      sta $01fe
$0e:ff7b  40            rti
$0e:ff7c  08            php
$0e:ff7d  83 f8         sta $f8,s
$0e:ff7f  04 ed         tsb $ed
$0e:ff81  db            stp
$0e:ff82  10 06         bpl $ff8a
$0e:ff84  f8            sed
$0e:ff85  42 1b         wdm #$1b
$0e:ff87  e1 19         sbc ($19,x)
$0e:ff89  37 8f         and [$8f],y
$0e:ff8b  7a            ply
$0e:ff8c  30 0e         bmi $ff9c
$0e:ff8e  60            rts
$0e:ff8f  c4 39         cpy $39
$0e:ff91  83 32         sta $32,s
$0e:ff93  1d 41 05      ora $0541,x
$0e:ff96  09 4d         ora #$4d
$0e:ff98  d3 e9         cmp ($e9,s),y
$0e:ff9a  94 83         sty $83,x
$0e:ff9c  a7 fd         lda [$fd]
$0e:ff9e  2a            rol a
$0e:ff9f  81 69         sta ($69,x)
$0e:ffa1  bb            tyx
$0e:ffa2  dd e3 10      cmp $10e3,x
$0e:ffa5  77 8c         adc [$8c],y
$0e:ffa7  82 de f5      brl $f588
$0e:ffaa  57 ae         eor [$ae],y
$0e:ffac  fd 99 ed      sbc $ed99,x
$0e:ffaf  df 09 89 d0   cmp $d08909,x
$0e:ffb3  37 bc         and [$bc],y
$0e:ffb5  1f 1f 8f cc   ora $cc8f1f,x
$0e:ffb9  f6 07         inc $07,x
$0e:ffbb  b8            clv
$0e:ffbc  04 01         tsb $01
$0e:ffbe  de 7c 2e      dec $2e7c,x
$0e:ffc1  1f 4b a5 d7   ora $d7a54b,x
$0e:ffc5  ee 81 84      inc $8481
$0e:ffc8  46 0f         lsr $0f
$0e:ffca  d0 3a         bne $0006
$0e:ffcc  0f 29 22 3d   ora $3d2229
$0e:ffd0  f0 a9         beq $ff7b
$0e:ffd2  0c c1 bd      tsb $bdc1
$0e:ffd5  e2 ff         sep #$ff
$0e:ffd7  20 79 47      jsr $4779
$0e:ffda  cc 5e 73      cpy $735e
$0e:ffdd  f4 27 a5      pea $a527
$0e:ffe0  7d 4d eb      adc $eb4d,x
$0e:ffe3  7f 64 7b 67   adc $677b64,x
$0e:ffe7  dd 44 8d      cmp $8d44,x
$0e:ffea  68            pla
$0e:ffeb  5e 19 a2      lsr $a219,x
$0e:ffee  00 60         brk #$60
$0e:fff0  00 02         brk #$02
$0e:fff2  18            clc
$0e:fff3  10 08         bpl $fffd
$0e:fff5  03 3f         ora $3f,s
$0e:fff7  dc 18 29      jml [$2918]
$0e:fffa  00 00         brk #$00
$0e:fffc  e0 78         cpx #$78
$0e:fffe  1c 00 6c      trb $6c00
