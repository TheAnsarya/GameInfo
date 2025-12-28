; Soul Blazer (SNES) - Bank $13
; Disassembled from ROM
; File offset: $098000-$09ffff
; CPU address: $13:$8000-$13:$ffff
;===========================================================

.bank $13
.org $8000

$13:8000  00 20         brk #$20
$13:8002  8d 43 24      sta $2443
$13:8005  b1 e9         lda ($e9),y
$13:8007  8c 32 35      sty $3532
$13:800a  07 88         ora [$88]
$13:800c  c3 a6         cmp $a6,s
$13:800e  b0 e9         bcs $7ff9
$13:8010  54 72 45      mvn $45,$72
$13:8013  1c 90 40      trb $4090
$13:8016  2b            pld
$13:8017  d0 0b         bne $8024
$13:8019  0c 09 fe      tsb $fe09
$13:801c  13 c8         ora ($c8,s),y
$13:801e  04 8a         tsb $8a
$13:8020  41 03         eor ($03,x)
$13:8022  80 5c         bra $8080
$13:8024  20 13 48      jsr $4813
$13:8027  c5 aa         cmp $aa
$13:8029  39 4a 9e      and $9e4a,y
$13:802c  4a            lsr a
$13:802d  63 c1         adc $c1,s
$13:802f  50 b5         bvc $7fe6
$13:8031  c7 1f         cmp [$1f]
$13:8033  65 40         adc $40
$13:8035  80 6f         bra $80a6
$13:8037  20 1c 38      jsr $381c
$13:803a  07 02         ora [$02]
$13:803c  01 78         ora ($78,x)
$13:803e  80 51         bra $8091
$13:8040  28            plp
$13:8041  14 30         trb $30
$13:8043  60            rts
$13:8044  d0 24         bne $806a
$13:8046  1a            inc a
$13:8047  0b            phd
$13:8048  84 52         sty $52
$13:804a  31 db         and ($db),y
$13:804c  8e 4d 23      stx $234d
$13:804f  f7 28         sbc [$28],y
$13:8051  7c e2 0f      jmp ($0fe2,x)
$13:8054  07 80         ora [$80]
$13:8056  0f 8b 13 60   ora $60138b
$13:805a  84 58         sty $58
$13:805c  39 30 0c      and $0c30,y
$13:805f  8c 02 c5      sty $c502
$13:8062  20 8e 0f      jsr $0f8e
$13:8065  86 6d         stx $6d
$13:8067  08            php
$13:8068  e4 ce         cpx $ce
$13:806a  a4 5f         ldy $5f
$13:806c  fa            plx
$13:806d  4f de 7b c2   eor $c27bde
$13:8071  f3 0f         sbc ($0f,s),y
$13:8073  8e 88 4a      stx $4a88
$13:8076  08            php
$13:8077  24 4a         bit $4a
$13:8079  00 65         brk #$65
$13:807b  0c 94 03      tsb $0394
$13:807e  7b            tdc
$13:807f  24 c3         bit $c3
$13:8081  0f 8a 0f 03   ora $030f8a
$13:8085  87 c2         sta [$c2]
$13:8087  e3 71         sbc $71,s
$13:8089  e9 fc         sbc #$fc
$13:808b  3a            dec a
$13:808c  7f 38 bf c1   adc $c1bf38,x
$13:8090  29 e3         and #$e3
$13:8092  e2 83         sep #$83
$13:8094  40            rti
$13:8095  20 30 41      jsr $4130
$13:8098  f0 46         beq $80e0
$13:809a  20 08 60      jsr $6008
$13:809d  81 4c         sta ($4c,x)
$13:809f  07 c1         ora [$c1]
$13:80a1  20 e0 64      jsr $64e0
$13:80a4  3c 1c 8f      bit $8f1c,x
$13:80a7  85 13         sta $13
$13:80a9  f1 00         sbc ($00),y
$13:80ab  fe 41 bf      inc $bf41,x
$13:80ae  1d 49 40      ora $4049,x
$13:80b1  f8            sed
$13:80b2  03 e1         ora $e1,s
$13:80b4  10 50         bpl $8106
$13:80b6  0e 92 01      asl $0192
$13:80b9  94 80         sty $80,x
$13:80bb  55 20         eor $20,x
$13:80bd  15 61         ora $61,x
$13:80bf  f1 ab         sbc ($ab),y
$13:80c1  9a            txs
$13:80c2  81 40         sta ($40,x)
$13:80c4  c0 09         cpy #$09
$13:80c6  41 61         eor ($61,x)
$13:80c8  7c 05 f0      jmp ($f005,x)
$13:80cb  c7 23         cmp [$23]
$13:80cd  95 1b         sta $1b,x
$13:80cf  5c 42 bb ae   jml $aebb42
$13:80d3  ea            nop
$13:80d4  51 fc         eor ($fc),y
$13:80d6  d1 8a         cmp ($8a),y
$13:80d8  2e e7 66      rol $66e7
$13:80db  cf 2b 7d fd   cmp $fd7d2b
$13:80df  c6 1d         dec $1d
$13:80e1  1f ff e3 ff   ora $ffe3ff,x
$13:80e5  e7 ff         sbc [$ff]
$13:80e7  f1 bf         sbc ($bf),y
$13:80e9  ea            nop
$13:80ea  e6 82         inc $82
$13:80ec  21 81         and ($81,x)
$13:80ee  0c 2a e8      tsb $e82a
$13:80f1  7b            tdc
$13:80f2  80 1d         bra $8111
$13:80f4  15 d5         ora $d5,x
$13:80f6  80 c0         bra $80b8
$13:80f8  06 80         asl $80
$13:80fa  1f 81 b1 13   ora $13b181,x
$13:80fe  1c 05 14      trb $1405
$13:8101  10 24         bpl $8127
$13:8103  30 42         bmi $8147
$13:8105  a0 90         ldy #$90
$13:8107  b7 d2         lda [$d2],y
$13:8109  c1 e0         cmp ($e0,x)
$13:810b  10 f8         bpl $8105
$13:810d  04 3a         tsb $3a
$13:810f  01 1e         ora ($1e,x)
$13:8111  80 47         bra $815a
$13:8113  d4 02         pei ($02)
$13:8115  50 cb         bvc $80e2
$13:8117  00 99         brk #$99
$13:8119  0a            asl a
$13:811a  1a            inc a
$13:811b  a3 03         lda $03,s
$13:811d  a9 1b         lda #$1b
$13:811f  62 60 84      per $0582
$13:8122  18            clc
$13:8123  c4 02         cpy $02
$13:8125  10 8a         bpl $80b1
$13:8127  18            clc
$13:8128  34 3e         bit $3e,x
$13:812a  11 1e         ora ($1e),y
$13:812c  89 4e         bit #$4e
$13:812e  e4 b7         cpx $b7
$13:8130  09 25         ora #$25
$13:8132  d2 cd         cmp ($cd)
$13:8134  74 8b         stz $8b,x
$13:8136  de a0 55      dec $55a0,x
$13:8139  bb            tyx
$13:813a  f5 fe         sbc $fe,x
$13:813c  f1 7f         sbc ($7f),y
$13:813e  b9 df 2c      lda $2cdf,y
$13:8141  17 ab         ora [$ab],y
$13:8143  25 ee         and $ee
$13:8145  c9 79         cmp #$79
$13:8147  b9 5e 14      lda $145e,y
$13:814a  61 2d         adc ($2d,x)
$13:814c  fd ee ba      sbc $baee,x
$13:814f  fd 5b 7d      sbc $7d5b,x
$13:8152  1f 25 ba eb   ora $ebba25,x
$13:8156  75 ed         adc $ed,x
$13:8158  96 f9         stx $f9,y
$13:815a  de 2f 0d      dec $0d2f,x
$13:815d  39 e1 fb      and $fbe1,y
$13:8160  a0 39         ldy #$39
$13:8162  38            sec
$13:8163  87 ba         sta [$ba]
$13:8165  00 c1         brk #$c1
$13:8167  0b            phd
$13:8168  e4 02         cpx $02
$13:816a  77 80         adc [$80],y
$13:816c  c3 5c         cmp $5c,s
$13:816e  04 c0         tsb $c0
$13:8170  89 09         bit #$09
$13:8172  24 62         bit $62
$13:8174  b5 3c         lda $3c,x
$13:8176  6a            ror a
$13:8177  83 4c         sta $4c,s
$13:8179  11 20         ora ($20),y
$13:817b  26 29         rol $29
$13:817d  e4 02         cpx $02
$13:817f  fc e2 57      jsr ($57e2,x)
$13:8182  08            php
$13:8183  09 82         ora #$82
$13:8185  89 38         bit #$38
$13:8187  aa            tax
$13:8188  4e 2a 53      lsr $532a
$13:818b  49 24         eor #$24
$13:818d  7a            ply
$13:818e  7d 0f 9c      adc $9c0f,x
$13:8191  c0 62         cpy #$62
$13:8193  90 18         bcc $81ad
$13:8195  2c 02 35      bit $3502
$13:8198  00 90         brk #$90
$13:819a  13 82         ora ($82,s),y
$13:819c  11 4e         ora ($4e),y
$13:819e  80 54         bra $81f4
$13:81a0  00 01         brk #$01
$13:81a2  26 94         rol $94
$13:81a4  41 9f         eor ($9f,x)
$13:81a6  e1 58         sbc ($58,x)
$13:81a8  9e 51 9e      stz $9e51,x
$13:81ab  43 8a         eor $8a,s
$13:81ad  be 73 67      ldx $6773,y
$13:81b0  d7 18         cmp [$18],y
$13:81b2  14 aa         trb $aa
$13:81b4  01 1c         ora ($1c,x)
$13:81b6  80 01         bra $81b9
$13:81b8  42 65         wdm #$65
$13:81ba  00 e0         brk #$e0
$13:81bc  42 03         wdm #$03
$13:81be  a0 01         ldy #$01
$13:81c0  0e 04 32      asl $3204
$13:81c3  a1 0c         lda ($0c,x)
$13:81c5  91 21         sta ($21),y
$13:81c7  06 9d         asl $9d
$13:81c9  30 c9         bmi $8194
$13:81cb  47 7b         eor [$7b]
$13:81cd  b1 fd         lda ($fd),y
$13:81cf  2c 7e c1      bit $c17e
$13:81d2  1f 9b c2 1b   ora $1bc29b,x
$13:81d6  65 83         adc $83
$13:81d8  80 42         bra $821c
$13:81da  6c 04 30      jmp ($3004)
$13:81dd  a5 40         lda $40
$13:81df  32 50         and ($50)
$13:81e1  0b            phd
$13:81e2  2c 06 49      bit $4906
$13:81e5  00 9c         brk #$9c
$13:81e7  40            rti
$13:81e8  3c d1 88      bit $88d1,x
$13:81eb  0f fa f5 fb   ora $fbf5fa
$13:81ef  80 ff         bra $81f0
$13:81f1  ff 70 49 32   sbc $324970,x
$13:81f5  28            plp
$13:81f6  68            pla
$13:81f7  85 e1         sta $e1
$13:81f9  16 84         asl $84,x
$13:81fb  4a            lsr a
$13:81fc  08            php
$13:81fd  49 02         eor #$02
$13:81ff  48            pha
$13:8200  7f 64 10 e8   adc $e81064,x
$13:8204  44 e2 8f      mvp $8f,$e2
$13:8207  43 86         eor $86,s
$13:8209  4b            phk
$13:820a  a2 01         ldx #$01
$13:820c  d0 3b         bne $8249
$13:820e  34 0a         bit $0a,x
$13:8210  60            rts
$13:8211  21 0a         and ($0a,x)
$13:8213  2c 02 54      bit $5402
$13:8216  5d 03 b2      eor $b203,x
$13:8219  d9 a3 12      cmp $12a3,y
$13:821c  a8            tay
$13:821d  80 1c         bra $823b
$13:821f  12 91         ora ($91)
$13:8221  a2 81         ldx #$81
$13:8223  79 a0 5e      adc $5ea0,y
$13:8226  ea            nop
$13:8227  03 24         ora $24,s
$13:8229  0e cd 01      asl $01cd
$13:822c  81 41         sta ($41,x)
$13:822e  60            rts
$13:822f  b0 28         bcs $8259
$13:8231  0c 16 13      tsb $1316
$13:8234  04 2e         tsb $2e
$13:8236  04 3a         tsb $3a
$13:8238  31 14         and ($14),y
$13:823a  80 45         bra $8281
$13:823c  20 50 38      jsr $3850
$13:823f  34 1e         bit $1e,x
$13:8241  0b            phd
$13:8242  07 85         ora [$85]
$13:8244  c3 e1         cmp $e1,s
$13:8246  50 e8         bvc $8230
$13:8248  34 3a         bit $3a,x
$13:824a  09 1c         ora #$1c
$13:824c  9e 4f 26      stz $264f,x
$13:824f  19 4a 37      ora $374a,y
$13:8252  b6 55         ldx $55,y
$13:8254  ba            tsx
$13:8255  91 55         sta ($55),y
$13:8257  a5 57         lda $57
$13:8259  79 dc d6      adc $d6dc,y
$13:825c  57 3f         eor [$3f],y
$13:825e  b5 47         lda $47,x
$13:8260  39 ff ff      and $ffff,y
$13:8263  eb            xba
$13:8264  80 6b         bra $82d1
$13:8266  b7 fa         lda [$fa],y
$13:8268  ab            plb
$13:8269  98            tya
$13:826a  68            pla
$13:826b  b7 f8         lda [$f8],y
$13:826d  2d fe 01      and $01fe
$13:8270  04 3d         tsb $3d
$13:8272  03 c0         ora $c0,s
$13:8274  20 d0 68      jsr $68d0
$13:8277  24 08         bit $08
$13:8279  fa            plx
$13:827a  30 48         bmi $82c4
$13:827c  1c 1e 08      trb $081e
$13:827f  ff 17 78 40   sbc $407817,x
$13:8283  a0 c0         ldy #$c0
$13:8285  50 7a         bvc $8301
$13:8287  8c 19 86      sty $8619
$13:828a  07 a0         ora [$a0]
$13:828c  98            tya
$13:828d  4c 22 02      jmp $0222
$13:8290  70 90         bvs $8222
$13:8292  50 2a         bvc $82be
$13:8294  13 00         ora ($00,s),y
$13:8296  c0 d8         cpy #$d8
$13:8298  3e 11 00      rol $0011,x
$13:829b  98            tya
$13:829c  4c 04 20      jmp $2004
$13:829f  11 0b         ora ($0b),y
$13:82a1  85 c2         sta $c2
$13:82a3  a0 28         ldy #$28
$13:82a5  1d 87 c2      ora $c287,x
$13:82a8  07 09         ora [$09]
$13:82aa  80 c3         bra $826f
$13:82ac  20 50 b8      jsr $b850
$13:82af  53 18         eor ($18,s),y
$13:82b1  21 eb         and ($eb,x)
$13:82b3  f0 5f         beq $8314
$13:82b5  88            dey
$13:82b6  c4 21         cpy $21
$13:82b8  f0 68         beq $8322
$13:82ba  79 08 21      adc $2108,y
$13:82bd  a4 41         ldy $41
$13:82bf  61 84         adc ($84,x)
$13:82c1  12 0f         ora ($0f)
$13:82c3  01 83         ora ($83,x)
$13:82c5  e8            inx
$13:82c6  29 12         and #$12
$13:82c8  0a            asl a
$13:82c9  84 a3         sty $a3
$13:82cb  09 28         ora #$28
$13:82cd  bc 6b 2f      ldy $2f6b,x
$13:82d0  1b            tcs
$13:82d1  cf a6 93 ed   cmp $ed93a6
$13:82d5  a4 e2         ldy $e2
$13:82d7  56 3f         lsr $3f,x
$13:82d9  1d 8f c7      ora $c78f,x
$13:82dc  53 f8         eor ($f8,s),y
$13:82de  63 0a         adc $0a,s
$13:82e0  81 98         sta ($98,x)
$13:82e2  6b            rtl
$13:82e3  5f e3 58 2a   eor $2a58e3,x
$13:82e7  83 01         sta $01,s
$13:82e9  00 e0         brk #$e0
$13:82eb  40            rti
$13:82ec  28            plp
$13:82ed  07 11         ora [$11]
$13:82ef  d0 70         bne $8361
$13:82f1  36 1c         rol $1c,x
$13:82f3  0e c7 80      asl $80c7
$13:82f6  e6 07         inc $07
$13:82f8  f2 f0         sbc ($f0)
$13:82fa  21 07         and ($07,x)
$13:82fc  e1 00         sbc ($00,x)
$13:82fe  fc 22 86      jsr ($8622,x)
$13:8301  17 7d         ora [$7d],y
$13:8303  a2 5d         ldx #$5d
$13:8305  a0 17         ldy #$17
$13:8307  7a            ply
$13:8308  0d ce c1      ora $c1ce
$13:830b  78            sei
$13:830c  4b            phk
$13:830d  84 c2         sty $c2
$13:830f  7f 18 8f de   adc $de8f18,x
$13:8313  6f 97 cb fa   adc $facb97
$13:8317  84 14         sty $14
$13:8319  89 3f         bit #$3f
$13:831b  9f c7 e3 f6   sta $f6e3c7,x
$13:831f  ec ef 67      cpx $67ef
$13:8322  e7 73         sbc [$73]
$13:8324  87 42         sta [$42]
$13:8326  3f 93 f8 77   and $77f893,x
$13:832a  fa            plx
$13:832b  f9 1c 84      sbc $841c,y
$13:832e  40            rti
$13:832f  bc 5f c8      ldy $c85f,x
$13:8332  0f c6 0f 02   ora $020fc6
$13:8336  c7 c3         cmp [$c3]
$13:8338  ff fc 0f fc   sbc $fc0ffc,x
$13:833c  07 ff         ora [$ff]
$13:833e  e3 ff         sbc $ff,s
$13:8340  ff bf ef 90   sbc $90efbf,x
$13:8344  7c 81 cc      jmp ($cc81,x)
$13:8347  26 1c         rol $1c
$13:8349  08            php
$13:834a  c7 83         cmp [$83]
$13:834c  91 f0         sta ($f0),y
$13:834e  f2 7e         sbc ($7e)
$13:8350  1b            tcs
$13:8351  60            rts
$13:8352  d1 24         cmp ($24),y
$13:8354  49 7f         eor #$7f
$13:8356  1c c2 6e      trb $6ec2
$13:8359  03 70         ora $70,s
$13:835b  c0 e0         cpy #$e0
$13:835d  f0 77         beq $83d6
$13:835f  80 41         bra $83a2
$13:8361  61 a3         adc ($a3,x)
$13:8363  30 86         bmi $82eb
$13:8365  ad 02 3f      lda $3f02
$13:8368  09 8f         ora #$8f
$13:836a  33 ca         and ($ca,s),y
$13:836c  0e cf 08      asl $08cf
$13:836f  14 02         trb $02
$13:8371  09 03         ora #$03
$13:8373  03 84         ora $84,s
$13:8375  02 38         cop #$38
$13:8377  cf 2c 07 00   cmp $00072c
$13:837b  e2 21         sep #$21
$13:837d  20 b0 70      jsr $70b0
$13:8380  3c 14 0a      bit $0a14,x
$13:8383  02 1c         cop #$1c
$13:8385  03 e6         ora $e6,s
$13:8387  71 0a         adc ($0a),y
$13:8389  00 88         brk #$88
$13:838b  c3 e8         cmp $e8,s
$13:838d  08            php
$13:838e  08            php
$13:838f  9c 3e bd      stz $bd3e
$13:8392  3f ee cf 6d   and $6dcfee,x
$13:8396  7e fa 07      ror $07fa,x
$13:8399  3c 3e 90      bit $903e,x
$13:839c  c7 78         cmp [$78]
$13:839e  40            rti
$13:839f  2f 10 28 24   and $242810
$13:83a3  42 05         wdm #$05
$13:83a5  30 10         bmi $83b7
$13:83a7  a6 43         ldx $43
$13:83a9  c1 64         cmp ($64,x)
$13:83ab  bc 6d bf      ldy $bf6d,x
$13:83ae  10 2f         bpl $83df
$13:83b0  e4 1d         cpx $1d
$13:83b2  bc 2c f2      ldy $f22c,x
$13:83b5  90 40         bcc $83f7
$13:83b7  21 18         and ($18,x)
$13:83b9  0e 24 03      asl $0324
$13:83bc  23 00         and $00,s
$13:83be  a5 07         lda $07
$13:83c0  d2 0f         cmp ($0f)
$13:83c2  0a            asl a
$13:83c3  83 41         sta $41,s
$13:83c5  63 b2         adc $b2,s
$13:83c7  98            tya
$13:83c8  cc 5e 7f      cpy $7f5e
$13:83cb  2b            pld
$13:83cc  8d b3 ca      sta $cab3
$13:83cf  03 00         ora $00,s
$13:83d1  87 40         sta [$40]
$13:83d3  60            rts
$13:83d4  20 60 83      jsr $8360
$13:83d7  11 42         ora ($42),y
$13:83d9  24 0b         bit $0b
$13:83db  06 78         asl $78
$13:83dd  d8            cld
$13:83de  30 1b         bmi $83fb
$13:83e0  0e 01 54      asl $5401
$13:83e3  33 1e         and ($1e,s),y
$13:83e5  06 b8         asl $b8
$13:83e7  47 03         eor [$03]
$13:83e9  c7 c0         cmp [$c0]
$13:83eb  32 14         and ($14)
$13:83ed  03 c9         ora $c9,s
$13:83ef  00 ca         brk #$ca
$13:83f1  40            rti
$13:83f2  29 0d         and #$0d
$13:83f4  40            rti
$13:83f5  9c 48 2c      stz $2c48
$13:83f8  12 08         ora ($08)
$13:83fa  85 00         sta $00
$13:83fc  4e 0b 50      lsr $500b
$13:83ff  90 ad         bcc $83ae
$13:8401  42 81         wdm #$81
$13:8403  01 84         ora ($84,x)
$13:8405  4e 2a 17      lsr $172a
$13:8408  06 08         asl $08
$13:840a  2c 41 8c      bit $8c41
$13:840d  12 1b         ora ($1b)
$13:840f  0c 06 82      tsb $8206
$13:8412  cb            wai
$13:8413  0a            asl a
$13:8414  4c 52 13      jmp $1352
$13:8417  b4 a6         ldy $a6,x
$13:8419  cb            wai
$13:841a  7f f6 de 5d   adc $5ddef6,x
$13:841e  93 45         sta ($45,s),y
$13:8420  ff cf 4d 33   sbc $334dcf,x
$13:8424  5b            tcd
$13:8425  69 95         adc #$95
$13:8427  ff e5 ff cb   sbc $cbffe5,x
$13:842b  7f e4 9f f9   adc $f99fe4,x
$13:842f  87 ff         sta [$ff]
$13:8431  f7 ff         sbc [$ff],y
$13:8433  b2 ba         lda ($ba)
$13:8435  87 01         sta [$01]
$13:8437  a0 29         ldy #$29
$13:8439  04 83         tsb $83
$13:843b  80 b1         bra $83ee
$13:843d  0a            asl a
$13:843e  05 82         ora $82
$13:8440  61 90         adc ($90,x)
$13:8442  90 6c         bcc $84b0
$13:8444  1e 61 e0      asl $e061,x
$13:8447  7f 8b f8 1f   adc $1ff88b,x
$13:844b  c5 d0         cmp $d0
$13:844d  f8            sed
$13:844e  02 42         cop #$42
$13:8450  a1 f0         lda ($f0,x)
$13:8452  53 84         eor ($84,s),y
$13:8454  22 18 11 08   jsl $081118
$13:8458  20 54 60      jsr $6054
$13:845b  50 28         bvc $8485
$13:845d  0c 0e 05      tsb $050e
$13:8460  0b            phd
$13:8461  82 05 00      brl $8469
$13:8464  40            rti
$13:8465  22 40 80 41   jsl $418040
$13:8469  20 d0 68      jsr $68d0
$13:846c  1c 0e 16      trb $160e
$13:846f  1e 03 a8      asl $a803,x
$13:8472  0c 46 1a      tsb $1a46
$13:8475  34 08         bit $08,x
$13:8477  74 2a         stz $2a,x
$13:8479  1f 09 16 84   ora $841609,x
$13:847d  1a            inc a
$13:847e  17 0f         ora [$0f],y
$13:8480  1f 94 08 88   ora $880894,x
$13:8484  24 80         bit $80
$13:8486  83 12         sta $12,s
$13:8488  87 ed         sta [$ed]
$13:848a  dc c9 76      jml [$76c9]
$13:848d  b2 5d         lda ($5d)
$13:848f  2d 97 53      and $5397
$13:8492  29 46         and #$46
$13:8494  95 7e         sta $7e,x
$13:8496  b2 15         lda ($15)
$13:8498  4a            lsr a
$13:8499  95 aa         sta $aa,x
$13:849b  91 fe         sta ($fe),y
$13:849d  96 7f         stx $7f,y
$13:849f  ad 9f ea      lda $ea9f
$13:84a2  67 fa         adc [$fa]
$13:84a4  dd fe df      cmp $dffe,x
$13:84a7  19 87 dd      ora $dd87,y
$13:84aa  fe 0c 02      inc $020c,x
$13:84ad  7c 8e 31      jmp ($318e,x)
$13:84b0  07 38         ora [$38]
$13:84b2  e1 c6         sbc ($c6,x)
$13:84b4  60            rts
$13:84b5  29 73         and #$73
$13:84b7  47 d2         eor [$d2]
$13:84b9  a4 a1         ldy $a1
$13:84bb  f8            sed
$13:84bc  ec 7e 1a      cpx $1a7e
$13:84bf  8d e0 82      sta $82e0
$13:84c2  44 38 91      mvp $91,$38
$13:84c5  0c 86 c7      tsb $c786
$13:84c8  23 3d         and $3d,s
$13:84ca  90 5d         bcc $8529
$13:84cc  be 1f f5      ldx $f51f,y
$13:84cf  f8            sed
$13:84d0  5e 7f f0      lsr $f07f,x
$13:84d3  b6 20         ldx $20,y
$13:84d5  4f f3 f7 f8   eor $f8f7f3
$13:84d9  f5 fe         sbc $fe,x
$13:84db  7f ff 38 a4   adc $a438ff,x
$13:84df  0c 4e 10      tsb $104e
$13:84e2  38            sec
$13:84e3  4c 1e 27      jmp $271e
$13:84e6  0f 8b c3 cf   ora $cfc38b
$13:84ea  2c de 08      bit $08de
$13:84ed  fb            xce
$13:84ee  a0 e1         ldy #$e1
$13:84f0  71 c8         adc ($c8),y
$13:84f2  4c 7a 23      jmp $237a
$13:84f5  3e 89 cf      rol $cf89,x
$13:84f8  22 53 c8 d4   jsl $d4c853
$13:84fc  12 69         ora ($69)
$13:84fe  00 8c         brk #$8c
$13:8500  40            rti
$13:8501  0e 04 fd      asl $fd04
$13:8504  09 23         ora #$23
$13:8506  50 60         bvc $8568
$13:8508  13 08         ora ($08,s),y
$13:850a  54 c0 0a      mvn $0a,$c0
$13:850d  12 0e         ora ($0e)
$13:850f  05 03         ora $03
$13:8511  41 a0         eor ($a0,x)
$13:8513  a0 4c         ldy #$4c
$13:8515  28            plp
$13:8516  1e 08 05      asl $0508,x
$13:8519  00 e2         brk #$e2
$13:851b  72 08         adc ($08)
$13:851d  07 42         ora [$42]
$13:851f  01 10         ora ($10,x)
$13:8521  80 64         bra $8587
$13:8523  22 1f 0c 06   jsl $060c1f
$13:8527  c2 01         rep #$01
$13:8529  60            rts
$13:852a  38            sec
$13:852b  8e e2 8f      stx $8fe2
$13:852e  52 86         eor ($86)
$13:8530  cf cf d3 02   cmp $02d3cf
$13:8534  98            tya
$13:8535  68            pla
$13:8536  a0 14         ldy #$14
$13:8538  48            pha
$13:8539  24 20         bit $20
$13:853b  e2 f2         sep #$f2
$13:853d  ee 85 f3      inc $f385
$13:8540  01 f8         ora ($f8,x)
$13:8542  38            sec
$13:8543  cc ae 05      cpy $05ae
$13:8546  2b            pld
$13:8547  84 55         sty $55
$13:8549  84 c0         sty $c0
$13:854b  8b            phb
$13:854c  79 64 7e      adc $7e64,y
$13:854f  61 03         adc ($03,x)
$13:8551  8f 40 5a a0   sta $a05a40
$13:8555  e5 05         sbc $05
$13:8557  68            pla
$13:8558  3f ca 42 0e   and $0e42ca,x
$13:855c  09 64         ora #$64
$13:855e  82 19 1c      brl $a17a
$13:8561  7e 0c 3e      ror $3e0c,x
$13:8564  03 07         ora $07,s
$13:8566  7f 8c e3 80   adc $80e38c,x
$13:856a  8f 03 28 08   sta $082803
$13:856e  43 00         eor $00,s
$13:8570  68            pla
$13:8571  68            pla
$13:8572  06 52         asl $52
$13:8574  01 98         ora ($98,x)
$13:8576  17 00         ora [$00],y
$13:8578  98            tya
$13:8579  42 e1         wdm #$e1
$13:857b  c0 2a         cpy #$2a
$13:857d  15 05         ora $05,x
$13:857f  a6 07         ldx $07
$13:8581  90 80         bcc $8503
$13:8583  ad 4a 04      lda $044a
$13:8586  ba            tsx
$13:8587  08            php
$13:8588  34 16         bit $16,x
$13:858a  83 41         sta $41,s
$13:858c  5a            phy
$13:858d  82 c8 8f      brl $1558
$13:8590  01 02         ora ($02,x)
$13:8592  81 9d         sta ($9d,x)
$13:8594  01 14         ora ($14,x)
$13:8596  19 3f 96      ora $963f,y
$13:8599  4f 73 91 84   eor $849173
$13:859d  c4 61         cpy $61
$13:859f  32 0d         and ($0d)
$13:85a1  1e 83 c5      asl $c583,x
$13:85a4  61 a1         adc ($a1,x)
$13:85a6  48            pha
$13:85a7  ac 54 8f      ldy $8f54
$13:85aa  dc a3 77      jml [$77a3]
$13:85ad  2a            rol a
$13:85ae  dd ea b7      cmp $b7ea,x
$13:85b1  79 3d 9f      adc $9f3d,y
$13:85b4  cf e7 52 b9   cmp $b952e7
$13:85b8  d4 6e         pei ($6e)
$13:85ba  71 8d         adc ($8d),y
$13:85bc  44 41 4a      mvp $4a,$41
$13:85bf  13 08         ora ($08,s),y
$13:85c1  04 92         tsb $92
$13:85c3  19 94 84      ora $8494,y
$13:85c6  63 22         adc $22,s
$13:85c8  10 49         bpl $8613
$13:85ca  06 a3         asl $a3
$13:85cc  51 b8         eor ($b8),y
$13:85ce  7f 96 73 79   adc $797396,x
$13:85d2  94 ce         sty $ce,x
$13:85d4  45 33         eor $33
$13:85d6  98            tya
$13:85d7  cc e6 63      cpy $63e6
$13:85da  70 54         bvs $8630
$13:85dc  4a            lsr a
$13:85dd  5d aa 5d      eor $5daa,x
$13:85e0  1f 8e c2 60   ora $60c28e,x
$13:85e4  50 78         bvc $865e
$13:85e6  19 ec 82      ora $82ec,y
$13:85e9  43 28         eor $28,s
$13:85eb  b5 c6         lda $c6,x
$13:85ed  e7 f0         sbc [$f0]
$13:85ef  38            sec
$13:85f0  fc 1e 0f      jsr ($0f1e,x)
$13:85f3  04 3b         tsb $3b
$13:85f5  80 7c         bra $8673
$13:85f7  ed 5d b9      sbc $b95d
$13:85fa  17 56         ora [$56],y
$13:85fc  8b            phb
$13:85fd  ef e6 ee ea   sbc $eaeee6
$13:8601  5f 60 fa 76   eor $76fa60,x
$13:8605  7f 75 5f bf   adc $bf5f75,x
$13:8609  bf df 32 ff   lda $ff32df,x
$13:860d  fb            xce
$13:860e  bf c1 f4 58   lda $58f4c1,x
$13:8612  84 32         sty $32
$13:8614  1d 08 86      ora $8608,x
$13:8617  41 20         eor ($20,x)
$13:8619  90 08         bcc $8623
$13:861b  41 3d         eor ($3d,x)
$13:861d  a1 10         lda ($10,x)
$13:861f  e8            inx
$13:8620  24 30         bit $30
$13:8622  d4 10         pei ($10)
$13:8624  82 f0 97      brl $1e17
$13:8627  0a            asl a
$13:8628  41 10         eor ($10,x)
$13:862a  27 b1         and [$b1]
$13:862c  54 4b a3      mvn $a3,$4b
$13:862f  38            sec
$13:8630  3b            tsc
$13:8631  bd 02 01      lda $0102,x
$13:8634  0a            asl a
$13:8635  a2 6b         ldx #$6b
$13:8637  6e 48 f0      ror $f048
$13:863a  0f 04 16 05   ora $051604
$13:863e  0a            asl a
$13:863f  82 49 23      brl $a98b
$13:8642  08            php
$13:8643  f0 e7         beq $862c
$13:8645  40            rti
$13:8646  3f f0 0b 04   and $040bf0,x
$13:864a  02 07         cop #$07
$13:864c  00 17         brk #$17
$13:864e  04 7a         tsb $7a
$13:8650  01 3e         ora ($3e,x)
$13:8652  38            sec
$13:8653  0c 26 0d      tsb $0d26
$13:8656  11 80         ora ($80),y
$13:8658  60            rts
$13:8659  06 43         asl $43
$13:865b  02 82         cop #$82
$13:865d  17 80         ora [$80],y
$13:865f  b8            clv
$13:8660  10 e8         bpl $864a
$13:8662  04 7e         tsb $7e
$13:8664  00 b3         brk #$b3
$13:8666  0e 01 c0      asl $c001
$13:8669  60            rts
$13:866a  c5 d1         cmp $d1
$13:866c  2e 01 3d      rol $3d01
$13:866f  8e c4 5e      stx $5ec4
$13:8672  02 f3         cop #$f3
$13:8674  1d 80 ec      ora $ec80,x
$13:8677  10 86         bpl $85ff
$13:8679  d1 c0         cmp ($c0),y
$13:867b  60            rts
$13:867c  30 25         bmi $86a3
$13:867e  38            sec
$13:867f  3c e5 de      bit $dee5,x
$13:8682  10 37         bpl $86bb
$13:8684  95 be         sta $be,x
$13:8686  92 05         sta ($05)
$13:8688  02 8b         cop #$8b
$13:868a  47 63         eor [$63]
$13:868c  54 b9 86      mvn $86,$b9
$13:868f  73 a1         adc ($a1,s),y
$13:8691  30 7d         bmi $8710
$13:8693  a0 00         ldy #$00
$13:8695  23 31         and $31,s
$13:8697  fb            xce
$13:8698  3d ff 91      and $91ff,x
$13:869b  fc 98 7c      jsr ($7c98,x)
$13:869e  11 a1         ora ($a1),y
$13:86a0  5a            phy
$13:86a1  b9 7c 38      lda $387c,y
$13:86a4  98            tya
$13:86a5  0d 02 d0      ora $d002
$13:86a8  ce 00 a9      dec $a900
$13:86ab  08            php
$13:86ac  05 96         ora $96
$13:86ae  ff 0c fe 58   sbc $58fe0c,x
$13:86b2  3c 18 01      bit $0118,x
$13:86b5  c1 c1         cmp ($c1,x)
$13:86b7  c7 c2         cmp [$c2]
$13:86b9  37 47         and [$47],y
$13:86bb  e9 c1         sbc #$c1
$13:86bd  e7 0c         sbc [$0c]
$13:86bf  30 5a         bmi $871b
$13:86c1  01 49         ora ($49,x)
$13:86c3  5d c1 05      eor $05c1,x
$13:86c6  83 f1         sta $f1,s
$13:86c8  d4 60         pei ($60)
$13:86ca  0c 58 44      tsb $4458
$13:86cd  10 f0         bpl $86bf
$13:86cf  10 87         bpl $8658
$13:86d1  48            pha
$13:86d2  03 14         ora $14,s
$13:86d4  f0 30         beq $8706
$13:86d6  c4 40         cpy $40
$13:86d8  1e da 31      asl $31da,x
$13:86db  00 92         brk #$92
$13:86dd  46 12         lsr $12
$13:86df  a0 93         ldy #$93
$13:86e1  00 63         brk #$63
$13:86e3  24 c2         bit $c2
$13:86e5  78            sei
$13:86e6  a4 14         ldy $14
$13:86e8  cc 37 ca      cpy $ca37
$13:86eb  15 02         ora $02,x
$13:86ed  8a            txa
$13:86ee  43 1e         eor $1e,s
$13:86f0  75 06         adc $06,x
$13:86f2  87 43         sta [$43]
$13:86f4  23 8f         and $8f,s
$13:86f6  3a            dec a
$13:86f7  b3 59         lda ($59,s),y
$13:86f9  e9 5a         sbc #$5a
$13:86fb  ec a7 12      cpx $12a7
$13:86fe  81 c0         sta ($c0,x)
$13:8700  06 34         asl $34
$13:8702  8e cf a6      stx $a6cf
$13:8705  f7 53         sbc [$53],y
$13:8707  3b            tsc
$13:8708  9c 06 f3      stz $f306
$13:870b  d4 22         pei ($22)
$13:870d  1a            inc a
$13:870e  09 02         ora #$02
$13:8710  aa            tax
$13:8711  a6 17         ldx $17
$13:8713  02 28         cop #$28
$13:8715  2c 4a 33      bit $334a
$13:8718  06 8b         asl $8b
$13:871a  40            rti
$13:871b  e2 90         sep #$90
$13:871d  b8            clv
$13:871e  9c 36 35      stz $3536
$13:8721  0d 8a 43      ora $438a
$13:8724  e1 70         sbc ($70,x)
$13:8726  78            sei
$13:8727  4c 1e 3f      jmp $3f1e
$13:872a  00 9f         brk #$9f
$13:872c  88            dey
$13:872d  1c 3e 01      trb $013e
$13:8730  f0 be         beq $86f0
$13:8732  7f b7 d7 e9   adc $e9d7b7,x
$13:8736  f5 fa         sbc $fa,x
$13:8738  b9 3e 4a      lda $4a3e,y
$13:873b  82 c5 25      brl $ad03
$13:873e  10 06         bpl $8746
$13:8740  50 1f         bvc $8761
$13:8742  1d 88 50      ora $5088,x
$13:8745  48            pha
$13:8746  a4 3a         ldy $3a
$13:8748  59 1e 8d      eor $8d1e,y
$13:874b  4f 2e 93 88   eor $88932e
$13:874f  a5 e3         lda $e3
$13:8751  75 7c         adc $7c,x
$13:8753  bd 7f 15      lda $157f,x
$13:8756  55 10         eor $10,x
$13:8758  35 0b         and $0b,x
$13:875a  39 a0 88      and $88a0,y
$13:875d  c0 36         cpy #$36
$13:875f  92 ea         sta ($ea)
$13:8761  d9 cc 78      cmp $78cc,y
$13:8764  01 c0         ora ($c0,x)
$13:8766  48            pha
$13:8767  22 14 09 85   jsl $850914
$13:876b  32 61         and ($61)
$13:876d  2a            rol a
$13:876e  65 0a         adc $0a
$13:8770  4c 99 41      jmp $4199
$13:8773  38            sec
$13:8774  80 5e         bra $87d4
$13:8776  05 c1         ora $c1
$13:8778  00 9f         brk #$9f
$13:877a  10 82         bpl $86fe
$13:877c  3d 15 87      and $8715,x
$13:877f  2c 42 05      bit $0542
$13:8782  0c 82 33      tsb $3382
$13:8785  94 52         sty $52,x
$13:8787  81 f0         sta ($f0,x)
$13:8789  87 19         sta [$19]
$13:878b  1a            inc a
$13:878c  11 28         ora ($28),y
$13:878e  67 84         adc [$84]
$13:8790  c2 a9         rep #$a9
$13:8792  38            sec
$13:8793  90 46         bcc $87db
$13:8795  08            php
$13:8796  68            pla
$13:8797  38            sec
$13:8798  05 38         ora $38
$13:879a  2a            rol a
$13:879b  c1 56         cmp ($56,x)
$13:879d  13 c4         ora ($c4,s),y
$13:879f  a0 a3         ldy #$a3
$13:87a1  4a            lsr a
$13:87a2  13 0d         ora ($0d,s),y
$13:87a4  92 4d         sta ($4d)
$13:87a6  a0 32         ldy #$32
$13:87a8  5a            phy
$13:87a9  9d 26 23      sta $2326,x
$13:87ac  70 a6         bvs $8754
$13:87ae  57 a1         eor [$a1],y
$13:87b0  92 19         sta ($19)
$13:87b2  2c ce 1f      bit $1fce
$13:87b5  0f 9f cf e7   ora $e7cf9f
$13:87b9  d3 fb         cmp ($fb,s),y
$13:87bb  65 fe         adc $fe
$13:87bd  fd 7f b9      sbc $b97f,x
$13:87c0  df e6 73 f9   cmp $f973e6,x
$13:87c4  d0 84         bne $874a
$13:87c6  3c 14 3a      bit $3a14,x
$13:87c9  ce f2 d1      dec $d1f2
$13:87cc  84 df         sty $df
$13:87ce  c3 ec         cmp $ec,s
$13:87d0  74 0e         stz $0e,x
$13:87d2  fc fe 3b      jsr ($3bfe,x)
$13:87d5  01 ac         ora ($ac,x)
$13:87d7  70 3c         bvs $8815
$13:87d9  1f cf fd 8f   ora $8ffdcf,x
$13:87dd  ff 7d ff fc   sbc $fcff7d,x
$13:87e1  3f ff ef ff   and $ffefff,x
$13:87e5  00 50         brk #$50
$13:87e7  34 3b         bit $3b,x
$13:87e9  2f e3 e9 54   and $54e9e3
$13:87ed  ff c4 f8 ff   sbc $fff8c4,x
$13:87f1  8d a6 03      sta $03a6
$13:87f4  ff 85 86 7e   sbc $7e8685,x
$13:87f8  ec b7 cb      cpx $cbb7
$13:87fb  fc 1f ff      jsr ($ff1f,x)
$13:87fe  df ff fb 3f   cmp $3ffbff,x
$13:8802  e4 10         cpx $10
$13:8804  cc ff ef      cpy $efff
$13:8807  df f8 27 ff   cmp $ff27f8,x
$13:880b  c9 cc 81      cmp #$81cc
$13:880e  61 e3         adc ($e3,x)
$13:8810  bc cf 06      ldy $06cf,x
$13:8813  1e 01 f0      asl $f001,x
$13:8816  48            pha
$13:8817  84 a6         sty $a6
$13:8819  fb            xce
$13:881a  f7 bc         sbc [$bc],y
$13:881c  c7 3f         cmp [$3f]
$13:881e  98            tya
$13:881f  7c 3d 9b      jmp ($9b3d,x)
$13:8822  ff 1f ff ec   sbc $ecff1f,x
$13:8826  0b            phd
$13:8827  02 29         cop #$29
$13:8829  08            php
$13:882a  47 fe         eor [$fe]
$13:882c  07 06         ora [$06]
$13:882e  86 c2         stx $c2
$13:8830  61 10         adc ($10,x)
$13:8832  c8            iny
$13:8833  14 02         trb $02
$13:8835  09 02 85      ora #$8502
$13:8838  42 a1         wdm #$a1
$13:883a  90 c4         bcc $8800
$13:883c  90 41         bcc $887f
$13:883e  20 f0 38      jsr $38f0
$13:8841  79 ec 60      adc $60ec,y
$13:8844  50 28         bvc $886e
$13:8846  34 1a         bit $1a,x
$13:8848  1c 7b 08      trb $087b
$13:884b  43 65         eor $65,s
$13:884d  17 81         ora [$81],y
$13:884f  01 43         ora ($43,x)
$13:8851  02 14         cop #$14
$13:8853  20 8b 70      jsr $708b
$13:8856  5b            tcd
$13:8857  ac 06 03      ldy $0306
$13:885a  03 53         ora $53,s
$13:885c  8c 1d 56      sty $561d
$13:885f  2d c0 83      and $83c0
$13:8862  c8            iny
$13:8863  63 f8         adc $f8,s
$13:8865  7b            tdc
$13:8866  fc 3f ff      jsr ($ff3f,x)
$13:8869  3f 5b 8d fd   and $fd8d5b,x
$13:886d  76 0f         ror $0f,x
$13:886f  f0 9c         beq $880d
$13:8871  4f fc 1f f1   eor $f11ffc
$13:8875  c8            iny
$13:8876  40            rti
$13:8877  18            clc
$13:8878  ca            dex
$13:8879  97 18         sta [$18],y
$13:887b  1c 0a 06      trb $060a
$13:887e  a4 18         ldy $18
$13:8880  0a            asl a
$13:8881  3d 14 e4      and $e414,x
$13:8884  a7 06         lda [$06]
$13:8886  b0 b6         bcs $883e
$13:8888  16 05         asl $05,x
$13:888a  88            dey
$13:888b  80 61         bra $88ee
$13:888d  60            rts
$13:888e  38            sec
$13:888f  78            sei
$13:8890  35 ce         and $ce,x
$13:8892  65 90         adc $90
$13:8894  c0 72         cpy #$72
$13:8896  f0 3b         beq $88d3
$13:8898  9a            txs
$13:8899  05 aa         ora $aa
$13:889b  0a            asl a
$13:889c  6e 06 70      ror $7006
$13:889f  7f f1 3f fe   adc $fe3ff1,x
$13:88a3  67 ff         adc [$ff]
$13:88a5  ed ff f6      sbc $f6ff
$13:88a8  ff e9 b7 f4   sbc $f4b7e9,x
$13:88ac  91 23         sta ($23),y
$13:88ae  98            tya
$13:88af  22 88 e0 47   jsl $47e088
$13:88b3  20 84 8f      jsr $8f84
$13:88b6  80 17         bra $88cf
$13:88b8  80 7c         bra $8936
$13:88ba  08            php
$13:88bb  50 53         bvc $8910
$13:88bd  43 fa         eor $fa,s
$13:88bf  29 c0 4e      and #$4ec0
$13:88c2  0e 9e 84      asl $849e
$13:88c5  d5 48         cmp $48,x
$13:88c7  43 21         eor $21,s
$13:88c9  f3 09         sbc ($09,s),y
$13:88cb  f5 02         sbc $02,x
$13:88cd  f1 83         sbc ($83),y
$13:88cf  f0 36         beq $8907
$13:88d1  59 7e 13      eor $137e,y
$13:88d4  f9 fd fe      sbc $fefd,y
$13:88d7  ff fc ff c1   sbc $c1fffc,x
$13:88db  a0 f3         ldy #$f3
$13:88dd  09 ff 03      ora #$03ff
$13:88e0  f1 03         sbc ($03),y
$13:88e2  f0 43         beq $8927
$13:88e4  f0 73         beq $8959
$13:88e6  f8            sed
$13:88e7  7f fe 7f ff   adc $ff7ffe,x
$13:88eb  ff c1 e0 f3   sbc $f3e0c1,x
$13:88ef  f5 e0         sbc $e0,x
$13:88f1  ab            plb
$13:88f2  43 e1         eor $e1,s
$13:88f4  ff e0 7f e0   sbc $e07fe0,x
$13:88f8  0c a2 f8      tsb $f8a2
$13:88fb  43 e0         eor $e0,s
$13:88fd  17 f5         ora [$f5],y
$13:88ff  d0 5f         bne $8960
$13:8901  d7 a0         cmp [$a0],y
$13:8903  d7 66         cmp [$66],y
$13:8905  38            sec
$13:8906  60            rts
$13:8907  3f ec b3 72   and $72b3ec,x
$13:890b  20 52 09      jsr $0952
$13:890e  b4 25         ldy $25,x
$13:8910  15 38         ora $38,x
$13:8912  21 32         and ($32,x)
$13:8914  79 9b 89      adc $899b,y
$13:8917  c6 60         dec $60
$13:8919  30 12         bmi $892d
$13:891b  74 70         stz $70,x
$13:891d  ff f1 c8 f8   sbc $f8c8f1,x
$13:8921  74 32         stz $32,x
$13:8923  1c 78 44      trb $4478
$13:8926  ee 6f aa      inc $aa6f
$13:8929  80 41         bra $896c
$13:892b  8a            txa
$13:892c  2d ac ff      and $ffac
$13:892f  90 03         bcc $8934
$13:8931  91 ff         sta ($ff),y
$13:8933  5f 82 35 a0   eor $a03582,x
$13:8937  9c e3 18      stz $18e3
$13:893a  44 6e 3f      mvp $3f,$6e
$13:893d  bb            tyx
$13:893e  7c 33 d3      jmp ($d333,x)
$13:8941  00 8f         brk #$8f
$13:8943  12 c8         ora ($c8)
$13:8945  80 04         bra $894b
$13:8947  b0 f8         bcs $8941
$13:8949  7c 61 bf      jmp ($bf61,x)
$13:894c  ff 9f fe 1c   sbc $1cfe9f,x
$13:8950  5a            phy
$13:8951  37 b8         and [$b8],y
$13:8953  c1 0e         cmp ($0e,x)
$13:8955  41 08         eor ($08,x)
$13:8957  84 11         sty $11
$13:8959  dc e4 10      jml [$10e4]
$13:895c  c4 10         cpy $10
$13:895e  1d 60 9c      ora $9c60,x
$13:8961  08            php
$13:8962  f1 83         sbc ($83),y
$13:8964  2b            pld
$13:8965  c2 03         rep #$03
$13:8967  03 4b         ora $4b,s
$13:8969  94 0a         sty $0a,x
$13:896b  06 bf         asl $bf
$13:896d  04 fa         tsb $fa
$13:896f  40            rti
$13:8970  d4 ea         pei ($ea)
$13:8972  d5 19         cmp $19,x
$13:8974  fd fe 3f      sbc $3ffe,x
$13:8977  1f 87 ad 42   ora $42ad87,x
$13:897b  7d 18 9f      adc $9f18,x
$13:897e  e7 21         sbc [$21]
$13:8980  e4 60         cpx $60
$13:8982  72 0b         adc ($0b)
$13:8984  8c 3c 0c      sty $0c3c
$13:8987  41 e0         eor ($e0,x)
$13:8989  ff f8 1f f7   sbc $f71ff8,x
$13:898d  08            php
$13:898e  02 f1         cop #$f1
$13:8990  b9 f0 0a      lda $0af0,y
$13:8993  55 fe         eor $fe,x
$13:8995  21 52         and ($52,x)
$13:8997  92 cf         sta ($cf)
$13:8999  e5 55         sbc $55
$13:899b  78            sei
$13:899c  84 56         sty $56
$13:899e  15 02         ora $02,x
$13:89a0  53 01         eor ($01,s),y
$13:89a2  38            sec
$13:89a3  2d b7 fb      and $fbb7
$13:89a6  ad fe a1      lda $a1fe
$13:89a9  7f a0 5f e5   adc $e55fa0,x
$13:89ad  53 f8         eor ($f8,s),y
$13:89af  ac 7e 10      ldy $107e
$13:89b2  bd 08 39      lda $3908,x
$13:89b5  d8            cld
$13:89b6  0e 80 70      asl $7080
$13:89b9  08            php
$13:89ba  c1 c0         cmp ($c0,x)
$13:89bc  10 eb         bpl $89a9
$13:89be  0c 0f 08      tsb $080f
$13:89c1  54 02 b0      mvn $b0,$02
$13:89c4  0f 38 64 52   ora $526438
$13:89c8  11 10         ora ($10),y
$13:89ca  3b            tsc
$13:89cb  04 60         tsb $60
$13:89cd  6e 03 21      ror $2103
$13:89d0  0f 0c 70 84   ora $84700c
$13:89d4  62 36 88      per $120d
$13:89d7  14 06         trb $06
$13:89d9  71 10         adc ($10),y
$13:89db  dd 5f 0a      cmp $0a5f,x
$13:89de  a0 50         ldy #$50
$13:89e0  02 88         cop #$88
$13:89e2  13 d6         ora ($d6,s),y
$13:89e4  01 fe         ora ($fe,x)
$13:89e6  32 09         and ($09)
$13:89e8  44 a0 30      mvp $30,$a0
$13:89eb  14 e8         trb $e8
$13:89ed  41 01         eor ($01,x)
$13:89ef  c1 0f         cmp ($0f,x)
$13:89f1  88            dey
$13:89f2  47 8e         eor [$8e]
$13:89f4  e3 1c         sbc $1c,s
$13:89f6  90 4f         bcc $8a47
$13:89f8  0d e0 a7      ora $a7e0
$13:89fb  04 f8         tsb $f8
$13:89fd  43 d6         eor $d6,s
$13:89ff  c0 87         cpy #$87
$13:8a01  39 fc fe      and $fefc,y
$13:8a04  0f c1 87 e0   ora $e087c1
$13:8a08  e3 f0         sbc $f0,s
$13:8a0a  74 98         stz $98,x
$13:8a0c  4f e1 f3 f8   eor $f8f3e1
$13:8a10  fa            plx
$13:8a11  cc 16 61      cpy $6116
$13:8a14  f8            sed
$13:8a15  66 0b         ror $0b
$13:8a17  14 99         trb $99
$13:8a19  60            rts
$13:8a1a  cb            wai
$13:8a1b  06 18         asl $18
$13:8a1d  30 c1         bmi $89e0
$13:8a1f  5d d0 05      eor $05d0,x
$13:8a22  f6 ab         inc $ab,x
$13:8a24  fd bd a7      sbc $a7bd,x
$13:8a27  10 0c         bpl $8a35
$13:8a29  28            plp
$13:8a2a  61 50         adc ($50,x)
$13:8a2c  20 f1 c3      jsr $c3f1
$13:8a2f  70 42         bvs $8a73
$13:8a31  e1 34         sbc ($34,x)
$13:8a33  db            stp
$13:8a34  0d 9a 9f      ora $9f9a
$13:8a37  50 fc         bvc $8a35
$13:8a39  50 6b         bvc $8aa6
$13:8a3b  1b            tcs
$13:8a3c  ea            nop
$13:8a3d  e6 1f         inc $1f
$13:8a3f  7e 6f 08      ror $086f,x
$13:8a42  64 3e         stz $3e
$13:8a44  e7 7f         sbc [$7f]
$13:8a46  cf a8 03 f1   cmp $f103a8
$13:8a4a  fe ff d0      inc $d0ff,x
$13:8a4d  7f f7 ff fd   adc $fdfff7,x
$13:8a51  82 43 98      brl $2297
$13:8a54  9c 41 60      stz $6041
$13:8a57  e7 10         sbc [$10]
$13:8a59  c3 71         cmp $71,s
$13:8a5b  bf 17 59 2d   lda $2d5917,x
$13:8a5f  ff 05 e6 c8   sbc $c8e605,x
$13:8a63  fc 6e 9f      jsr ($9f6e,x)
$13:8a66  c4 18         cpy $18
$13:8a68  20 43 fb      jsr $fb43
$13:8a6b  ff 83 b3 84   sbc $84b383,x
$13:8a6f  8e 0f a0      stx $a00f
$13:8a72  88            dey
$13:8a73  44 21 11      mvp $11,$21
$13:8a76  08            php
$13:8a77  24 22         bit $22
$13:8a79  39 1c 86      and $861c,y
$13:8a7c  42 a3         wdm #$a3
$13:8a7e  71 b8         adc ($b8),y
$13:8a80  ac 39 f4      ldy $f439
$13:8a83  25 10         and $10
$13:8a85  8c 42 21      sty $2142
$13:8a88  91 88         sta ($88),y
$13:8a8a  e4 0e         cpx $0e
$13:8a8c  1f 0e 8f 9a   ora $9a8f0e,x
$13:8a90  c1 f4         cmp ($f4,x)
$13:8a92  52 88         eor ($88)
$13:8a94  85 52         sta $52
$13:8a96  71 38         adc ($38),y
$13:8a98  be 1d 40      ldx $401d,y
$13:8a9b  e6 0f         inc $0f
$13:8a9d  94 9c         sty $9c,x
$13:8a9f  40            rti
$13:8aa0  2f 88 43 41   and $414388
$13:8aa4  82 33 83      brl $0dda
$13:8aa7  e0 8f         cpx #$8f
$13:8aa9  f7 8e         sbc [$8e],y
$13:8aab  70 1e         bvs $8acb
$13:8aad  39 fe ff      and $fffe,y
$13:8ab0  03 0d         ora $0d,s
$13:8ab2  a4 2f         ldy $2f
$13:8ab4  00 78         brk #$78
$13:8ab6  04 1a         tsb $1a
$13:8ab8  01 05         ora ($05,x)
$13:8aba  81 34         sta ($34,x)
$13:8abc  62 0e da      per $64cd
$13:8abf  17 48         ora [$48],y
$13:8ac1  02 c2         cop #$c2
$13:8ac3  80 b7         bra $8a7c
$13:8ac5  77 c9         adc [$c9],y
$13:8ac7  3c 41 e2      bit $e241,x
$13:8aca  8f 94 f0 2a   sta $2af094
$13:8ace  8e 27 2d      stx $2d27
$13:8ad1  95 7c         sta $7c,x
$13:8ad3  e0 f2         cpx #$f2
$13:8ad5  f8            sed
$13:8ad6  5c 4a 15 05   jml $05154a
$13:8ada  82 37 85      brl $1014
$13:8add  58            cli
$13:8ade  11 e9         ora ($e9),y
$13:8ae0  fd f3 ff      sbc $fff3,x
$13:8ae3  10 9f         bpl $8a84
$13:8ae5  c3 63         cmp $63,s
$13:8ae7  f0 68         beq $8b51
$13:8ae9  7b            tdc
$13:8aea  68            pla
$13:8aeb  60            rts
$13:8aec  1a            inc a
$13:8aed  0b            phd
$13:8aee  04 a2         tsb $a2
$13:8af0  09 65 d1      ora #$d165
$13:8af3  a0 87         ldy #$87
$13:8af5  c1 80         cmp ($80,x)
$13:8af7  78            sei
$13:8af8  9f 83 c1 fc   sta $fcc183,x
$13:8afc  fe 57 ff      inc $ff57,x
$13:8aff  ff 0f c7 00   sbc $00c70f,x
$13:8b03  1a            inc a
$13:8b04  0b            phd
$13:8b05  e1 e4         sbc ($e4,x)
$13:8b07  7c 09 e1      jmp ($e109,x)
$13:8b0a  e4 fc         cpx $fc
$13:8b0c  14 c2         trb $c2
$13:8b0e  11 f0         ora ($f0),y
$13:8b10  8c 10 41      sty $4110
$13:8b13  50 3f         bvc $8b54
$13:8b15  c2 f4         rep #$f4
$13:8b17  fe 01 83      inc $8301,x
$13:8b1a  20 9c 1b      jsr $1b9c
$13:8b1d  c2 83         rep #$83
$13:8b1f  78            sei
$13:8b20  39 85 0e      and $0e85,y
$13:8b23  e1 03         sbc ($03,x)
$13:8b25  3c 0c 06      bit $060c,x
$13:8b28  c1 3f         cmp ($3f,x)
$13:8b2a  3f 8d fa fe   and $fefa8d,x
$13:8b2e  83 0b         sta $0b,s
$13:8b30  e2 18         sep #$18
$13:8b32  d0 61         bne $8b95
$13:8b34  ff 9f a3 cd   sbc $cda39f,x
$13:8b38  1c 09 65      trb $6509
$13:8b3b  80 7f         bra $8bbc
$13:8b3d  d3 f8         cmp ($f8,s),y
$13:8b3f  ae e4 ff      ldx $ffe4
$13:8b42  ac 3d 7f      ldy $7f3d
$13:8b45  96 d8         stx $d8,y
$13:8b47  96 de         stx $de,y
$13:8b49  fd 5c 8e      sbc $8e5c,x
$13:8b4c  ed 27 b5      sbc $b527
$13:8b4f  be c6 7a      ldx $7ac6,y
$13:8b52  3b            tsc
$13:8b53  74 9b         stz $9b,x
$13:8b55  ca            dex
$13:8b56  e7 2b         sbc [$2b]
$13:8b58  f2 b1         sbc ($b1)
$13:8b5a  7f e8 5f f9   adc $f95fe8,x
$13:8b5e  30 08         bmi $8b68
$13:8b60  69 5f fa      adc #$fa5f
$13:8b63  37 fe         and [$fe],y
$13:8b65  5f 63 a2 77   eor $77a263,x
$13:8b69  ef f1 e8 25   sbc $25e8f1
$13:8b6d  78            sei
$13:8b6e  7a            ply
$13:8b6f  43 d2         eor $d2,s
$13:8b71  f8            sed
$13:8b72  7f ff 9f fc   adc $fc9fff,x
$13:8b76  03 70         ora $70,s
$13:8b78  83 0d         sta $0d,s
$13:8b7a  a5 cc         lda $cc
$13:8b7c  ff f8 99 df   sbc $df99f8,x
$13:8b80  95 98         sta $98,x
$13:8b82  2e d0 ff      rol $ffd0
$13:8b85  fe 6d 1e      inc $1e6d,x
$13:8b88  30 df         bmi $8b69
$13:8b8a  f8            sed
$13:8b8b  5d a1 51      eor $51a1,x
$13:8b8e  f8            sed
$13:8b8f  bc 76 21      ldy $2176,x
$13:8b92  07 80         ora [$80]
$13:8b94  c6 e2         dec $e2
$13:8b96  71 68         adc ($68),y
$13:8b98  34 32         bit $32,x
$13:8b9a  23 17         and $17,s
$13:8b9c  83 47         sta $47,s
$13:8b9e  a3 b1         lda $b1,s
$13:8ba0  f2 f8         sbc ($f8)
$13:8ba2  43 e3         eor $e3,s
$13:8ba4  f1 a8         sbc ($a8),y
$13:8ba6  dc 52 2f      jml [$2f52]
$13:8ba9  0d 87 98      ora $9887
$13:8bac  c2 39         rep #$39
$13:8bae  1e 0b a4      asl $a40b,x
$13:8bb1  06 03         asl $03
$13:8bb3  02 81         cop #$81
$13:8bb5  c1 20         cmp ($20,x)
$13:8bb7  f0 88         beq $8b41
$13:8bb9  71 ec         adc ($ec),y
$13:8bbb  0d ed 03      ora $03ed
$13:8bbe  81 c1         sta ($c1,x)
$13:8bc0  e0 e6 a0      cpx #$a0e6
$13:8bc3  35 01         and $01,x
$13:8bc5  ec 24 13      cpx $1324
$13:8bc8  8c 1f 82      sty $821f
$13:8bcb  1f c3 8f e1   ora $e18fc3,x
$13:8bcf  e7 f1         sbc [$f1]
$13:8bd1  fb            xce
$13:8bd2  f9 0c 2f      sbc $2f0c,y
$13:8bd5  e6 a0         inc $a0
$13:8bd7  9f cf c4 20   sta $20c4cf,x
$13:8bdb  1f 0f 07 ff   ora $ff070f,x
$13:8bdf  80 22         bra $8c03
$13:8be1  17 68         ora [$68],y
$13:8be3  4f a0 5f e8   eor $e85fa0
$13:8be7  f7 f9         sbc [$f9],y
$13:8be9  67 3c         adc [$3c]
$13:8beb  0f f4 01 81   ora $8101f4
$13:8bef  70 38         bvs $8c29
$13:8bf1  04 0a         tsb $0a
$13:8bf3  03 82         ora $82,s
$13:8bf5  69 0e 1a      adc #$1a0e
$13:8bf8  03 cc         ora $cc,s
$13:8bfa  81 d0         sta ($d0,x)
$13:8bfc  b0 36         bcs $8c34
$13:8bfe  3c 0b 3c      bit $3c0b,x
$13:8c01  30 6e         bmi $8c71
$13:8c03  01 c5         ora ($c5,x)
$13:8c05  c0 39 ee      cpy #$ee39
$13:8c08  61 f1         adc ($f1,x)
$13:8c0a  ba            tsx
$13:8c0b  87 41         sta [$41]
$13:8c0d  00 c0         brk #$c0
$13:8c0f  40            rti
$13:8c10  30 4f         bmi $8c61
$13:8c12  21 f1         and ($f1,x)
$13:8c14  3b            tsc
$13:8c15  82 85 84      brl $109d
$13:8c18  81 43         sta ($43,x)
$13:8c1a  30 4e         bmi $8c6a
$13:8c1c  f0 79         beq $8c97
$13:8c1e  96 89         stx $89,y
$13:8c20  ec 3e 68      cpx $683e
$13:8c23  06 38         asl $38
$13:8c25  14 27         trb $27
$13:8c27  31 68         and ($68),y
$13:8c29  00 9d         brk #$9d
$13:8c2b  42 20         wdm #$20
$13:8c2d  0f 20 89 04   ora $048920
$13:8c31  c8            iny
$13:8c32  26 01         rol $01
$13:8c34  b2 a0         lda ($a0)
$13:8c36  3c 40 62      bit $6240,x
$13:8c39  e2 f0         sep #$f0
$13:8c3b  b0 40         bcs $8c7d
$13:8c3d  3c 10 0e      bit $0e10,x
$13:8c40  00 c9         brk #$c9
$13:8c42  c7 e1         cmp [$e1]
$13:8c44  f0 3a         beq $8c80
$13:8c46  04 3e         tsb $3e
$13:8c48  2b            pld
$13:8c49  0f 8b 43 e1   ora $e1438b
$13:8c4d  70 72         bvs $8cc1
$13:8c4f  a8            tay
$13:8c50  42 20         wdm #$20
$13:8c52  f0 63         beq $8cb7
$13:8c54  a8            tay
$13:8c55  40            rti
$13:8c56  23 e5         and $e5,s
$13:8c58  e7 87         sbc [$87]
$13:8c5a  9a            txs
$13:8c5b  06 0e         asl $0e
$13:8c5d  20 01 e8      jsr $e801
$13:8c60  5c 0e 21 40   jml $40210e
$13:8c64  3a            dec a
$13:8c65  05 e0         ora $e0
$13:8c67  ee 37 ea      inc $ea37
$13:8c6a  05 fe         ora $fe
$13:8c6c  fd 7f 40      sbc $407f,x
$13:8c6f  67 fe         adc [$fe]
$13:8c71  7f ff 8f ff   adc $ff8fff,x
$13:8c75  e1 f7         sbc ($f7,x)
$13:8c77  f8            sed
$13:8c78  3a            dec a
$13:8c79  54 27 f0      mvn $f0,$27
$13:8c7c  58            cli
$13:8c7d  f9 3c 06      sbc $063c,y
$13:8c80  41 ff         eor ($ff,x)
$13:8c82  4f 96 01 48   eor $480196
$13:8c86  3c 0f ff      bit $ff0f,x
$13:8c89  83 ff         sta $ff,s
$13:8c8b  f0 ff         beq $8c8c
$13:8c8d  ab            plb
$13:8c8e  b9 3e 8b      lda $8b3e,y
$13:8c91  f8            sed
$13:8c92  57 fb         eor [$fb],y
$13:8c94  7b            tdc
$13:8c95  7d b7 8a      adc $8ab7,x
$13:8c98  b5 56         lda $56,x
$13:8c9a  7f 3c d4 ca   adc $cad43c,x
$13:8c9e  3a            dec a
$13:8c9f  d1 99         cmp ($99),y
$13:8ca1  ae fb d5      ldx $d5fb
$13:8ca4  69 8a         adc #$8a
$13:8ca6  c2 a0         rep #$a0
$13:8ca8  df f9 57 fe   cmp $fe57f9,x
$13:8cac  85 ff         sta $ff
$13:8cae  ab            plb
$13:8caf  7f ec c0 21   adc $21c0ec,x
$13:8cb3  8b            phb
$13:8cb4  7f ef ca 00   adc $00caef,x
$13:8cb8  19 2c f3      ora $f32c,y
$13:8cbb  33 07         and ($07,s),y
$13:8cbd  91 c0         sta ($c0),y
$13:8cbf  20 43 18      jsr $1843
$13:8cc2  e1 ff         sbc ($ff,x)
$13:8cc4  e7 13         sbc [$13]
$13:8cc6  f8            sed
$13:8cc7  1c 0c 3b      trb $3b0c
$13:8cca  1a            inc a
$13:8ccb  4f af 22 35   eor $3522af
$13:8ccf  7d b6 87      adc $87b6,x
$13:8cd2  63 7e         adc $7e,s
$13:8cd4  8f 1c 78 39   sta $39781c
$13:8cd8  c3 a1         cmp $a1,s
$13:8cda  18            clc
$13:8cdb  8d 45 23      sta $2345
$13:8cde  90 08         bcc $8ce8
$13:8ce0  80 76         bra $8d58
$13:8ce2  22 d1 e8 61   jsl $61e8d1
$13:8ce6  68            pla
$13:8ce7  e2 11         sep #$11
$13:8ce9  c3 78         cmp $78,s
$13:8ceb  44 63 92      mvp $92,$63
$13:8cee  19 c1 d4      ora $d4c1,y
$13:8cf1  e6 10         inc $10
$13:8cf3  19 84 7c      ora $7c84,y
$13:8cf6  fe 31 e8      inc $e831,x
$13:8cf9  fc fa 7e      jsr ($7efa,x)
$13:8cfc  85 6d         sta $6d
$13:8cfe  a5 e2         lda $e2
$13:8d00  69 f8 b2      adc #$b2f8
$13:8d03  7e 3c 1f      ror $1f3c,x
$13:8d06  8e c7 83      stx $83c7
$13:8d09  a1 e0         lda ($e0,x)
$13:8d0b  90 70         bcc $8d7d
$13:8d0d  02 a1         cop #$a1
$13:8d0f  fc 4f 3f      jsr ($3f4f,x)
$13:8d12  e1 50         sbc ($50,x)
$13:8d14  3e 00 ec      rol $ec00,x
$13:8d17  07 47         ora [$47]
$13:8d19  01 00         ora ($00,x)
$13:8d1b  a0 2e         ldy #$2e
$13:8d1d  c1 74         cmp ($74,x)
$13:8d1f  2b            pld
$13:8d20  56 4e         lsr $4e,x
$13:8d22  02 70         cop #$70
$13:8d24  20 78 1a      jsr $1a78
$13:8d27  1e 07 4b      asl $4b07,x
$13:8d2a  43 89         eor $89,s
$13:8d2c  db            stp
$13:8d2d  e4 f1         cpx $f1
$13:8d2f  f8            sed
$13:8d30  1c 3e 02      trb $023e
$13:8d33  2c 08 0f      bit $0f08
$13:8d36  0e 01 e7      asl $e701
$13:8d39  80 03         bra $8d3e
$13:8d3b  82 ff 00      brl $8e3d
$13:8d3e  9f c0 21 ec   sta $ec21c0,x
$13:8d42  e0 6e         cpx #$6e
$13:8d44  80 54         bra $8d9a
$13:8d46  30 50         bmi $8d98
$13:8d48  4c 15 2b      jmp $2b15
$13:8d4b  09 a4 ec      ora #$eca4
$13:8d4e  72 3e         adc ($3e)
$13:8d50  18            clc
$13:8d51  05 68         ora $68
$13:8d53  2f 87 8d 00   and $008d87
$13:8d57  e7 40         sbc [$40]
$13:8d59  3f ca 63 7d   and $7d63ca,x
$13:8d5d  18            clc
$13:8d5e  f4 5d a1      pea $a15d
$13:8d61  02 80         cop #$80
$13:8d63  c1 a0         cmp ($a0,x)
$13:8d65  30 48         bmi $8daf
$13:8d67  1c 02 0f      trb $0f02
$13:8d6a  0c 81 c2      tsb $c281
$13:8d6d  60            rts
$13:8d6e  ee d0 0c      inc $0cd0
$13:8d71  08            php
$13:8d72  88            dey
$13:8d73  5d 20 e9      eor $e920,x
$13:8d76  08            php
$13:8d77  f8            sed
$13:8d78  a8            tay
$13:8d79  72 16         adc ($16)
$13:8d7b  0d 85 01      ora $0185
$13:8d7e  36 09         rol $09,x
$13:8d80  b0 65         bcs $8de7
$13:8d82  92 f4         sta ($f4)
$13:8d84  2c 18 0f      bit $0f18
$13:8d87  84 00         sty $00
$13:8d89  7e 8a d0      ror $d08a,x
$13:8d8c  23 90         and $90,s
$13:8d8e  fc 13 60      jsr ($6013,x)
$13:8d91  f9 04 c8      sbc $c804,y
$13:8d94  14 c9         trb $c9
$13:8d96  f2 03         sbc ($03)
$13:8d98  52 1f         eor ($1f)
$13:8d9a  92 a4         sta ($a4)
$13:8d9c  95 20         sta $20,x
$13:8d9e  43 4b         eor $4b,s
$13:8da0  05 fe         ora $fe
$13:8da2  79 7f 9f      adc $9f7f,y
$13:8da5  df e3 73 f8   cmp $f873e3,x
$13:8da9  a4 7c         ldy $7c
$13:8dab  ee 11 28      inc $2811
$13:8dae  fc 4e 3f      jsr ($3f4e,x)
$13:8db1  7f 39 09 cc   adc $cc0939,x
$13:8db5  a3 91         lda $91,s
$13:8db7  f4 38 47      pea $4738
$13:8dba  a3 e8         lda $e8,s
$13:8dbc  c0 83         cpy #$83
$13:8dbe  b2 4d         lda ($4d)
$13:8dc0  f2 1c         sbc ($1c)
$13:8dc2  0f 85 01 30   ora $300185
$13:8dc6  5f 8f c7 fd   eor $fdc78f,x
$13:8dca  40            rti
$13:8dcb  d7 f5         cmp [$f5],y
$13:8dcd  41 aa         eor ($aa,x)
$13:8dcf  06 3f         asl $3f
$13:8dd1  3f 87 cf e0   and $e0cf87,x
$13:8dd5  e8            inx
$13:8dd6  e0 5b         cpx #$5b
$13:8dd8  8a            txa
$13:8dd9  d0 1d         bne $8df8
$13:8ddb  20 e3 0f      jsr $0fe3
$13:8dde  ff 01 84 3e   sbc $3e8401,x
$13:8de2  06 31         asl $31
$13:8de4  b0 c1         bcs $8da7
$13:8de6  9d a6 70      sta $70a6,x
$13:8de9  60            rts
$13:8dea  0b            phd
$13:8deb  7e a1 10      ror $10a1,x
$13:8dee  48            pha
$13:8def  20 30 c1      jsr $c130
$13:8df2  e1 20         sbc ($20,x)
$13:8df4  88            dey
$13:8df5  40            rti
$13:8df6  22 0f a0 86   jsl $86a00f
$13:8dfa  3f 85 e2 52   and $52e285,x
$13:8dfe  08            php
$13:8dff  04 c6         tsb $c6
$13:8e01  01 30         ora ($30,x)
$13:8e03  7d 83 cc      adc $cc83,x
$13:8e06  e2 00         sep #$00
$13:8e08  70 7b         bvs $8e85
$13:8e0a  0e 22 01      asl $0122
$13:8e0d  a0 a0         ldy #$a0
$13:8e0f  58            cli
$13:8e10  00 86         brk #$86
$13:8e12  0b            phd
$13:8e13  4e 61 28      lsr $2861
$13:8e16  de 69 02      dec $0269,x
$13:8e19  81 c2         sta ($c2,x)
$13:8e1b  21 91         and ($91,x)
$13:8e1d  08            php
$13:8e1e  c4 8e         cpy $8e
$13:8e20  61 27         adc ($27,x)
$13:8e22  05 83         ora $83
$13:8e24  cc e0 70      cpy $70e0
$13:8e27  38            sec
$13:8e28  7c 3d 18      jmp ($183d,x)
$13:8e2b  13 c9         ora ($c9,s),y
$13:8e2d  fc e2 7e      jsr ($7ee2,x)
$13:8e30  11 18         ora ($18),y
$13:8e32  e6 03         inc $03
$13:8e34  80 be         bra $8df4
$13:8e36  05 a8         ora $a8
$13:8e38  2c 41 58      bit $5841
$13:8e3b  4f 60 46 03   eor $034660
$13:8e3f  38            sec
$13:8e40  3e 0c 21      rol $210c,x
$13:8e43  6f a4 06 60   adc $6006a4
$13:8e47  6f 00 50 48   adc $485000
$13:8e4b  0e 81 3c      asl $3c81
$13:8e4e  98            tya
$13:8e4f  4f 89 61 2e   eor $2e6189
$13:8e53  9f cf 8f c2   sta $c28fcf,x
$13:8e57  82 a5 60      brl $eeff
$13:8e5a  ab            plb
$13:8e5b  41 1c         eor ($1c,x)
$13:8e5d  11 fb         ora ($fb),y
$13:8e5f  fa            plx
$13:8e60  c8            iny
$13:8e61  20 f0 f8      jsr $f8f0
$13:8e64  1c 1f 06      trb $061f
$13:8e67  df 6c 03 08   cmp $08036c,x
$13:8e6b  4c a1 f8      jmp $f8a1
$13:8e6e  ff d0 30 0a   sbc $0a30d0,x
$13:8e72  f0 80         beq $8df4
$13:8e74  70 24         bvs $8e9a
$13:8e76  1c 0a 87      trb $870a
$13:8e79  83 31         sta $31,s
$13:8e7b  60            rts
$13:8e7c  d0 5e         bne $8edc
$13:8e7e  17 60         ora [$60],y
$13:8e80  2b            pld
$13:8e81  05 f9         ora $f9
$13:8e83  0b            phd
$13:8e84  41 bc         eor ($bc,x)
$13:8e86  0d e0 fe      ora $fee0
$13:8e89  32 85         and ($85)
$13:8e8b  9c d0 12      stz $12d0
$13:8e8e  20 40 30      jsr $3040
$13:8e91  d0 08         bne $8e9b
$13:8e93  3b            tsc
$13:8e94  58            cli
$13:8e95  5a            phy
$13:8e96  6d 87 6d      adc $6d87
$13:8e99  09 54 19      ora #$1954
$13:8e9c  cd 40 59      cmp $5940
$13:8e9f  83 e0         sta $e0,s
$13:8ea1  de 68 f7      dec $f768,x
$13:8ea4  2e 13 e0      rol $e013
$13:8ea7  e7 3d         sbc [$3d]
$13:8ea9  3b            tsc
$13:8eaa  64 e7         stz $e7
$13:8eac  8f fc b6 4e   sta $4eb6fc
$13:8eb0  27 11         and [$11]
$13:8eb2  08            php
$13:8eb3  80 fc         bra $8eb1
$13:8eb5  e2 3c         sep #$3c
$13:8eb7  79 c6 0d      adc $0dc6,y
$13:8eba  96 02         stx $02,y
$13:8ebc  10 88         bpl $8e46
$13:8ebe  71 e0         adc ($e0),y
$13:8ec0  1e f3 59      asl $59f3,x
$13:8ec3  7d 3f 1d      adc $1d3f,x
$13:8ec6  0f 06 43 c0   ora $c04306
$13:8eca  32 08         and ($08)
$13:8ecc  46 01         lsr $01
$13:8ece  64 0d         stz $0d
$13:8ed0  12 ff         ora ($ff)
$13:8ed2  31 85         and ($85),y
$13:8ed4  8a            txa
$13:8ed5  0c 50 e4      tsb $e450
$13:8ed8  40            rti
$13:8ed9  16 40         asl $40,x
$13:8edb  39 47 10      and $1047,y
$13:8ede  40            rti
$13:8edf  a0 30         ldy #$30
$13:8ee1  58            cli
$13:8ee2  c4 9a         cpy $9a
$13:8ee4  8b            phb
$13:8ee5  48            pha
$13:8ee6  8b            phb
$13:8ee7  50 34         bvc $8f1d
$13:8ee9  0d 14 81      ora $8114
$13:8eec  c0 e3         cpy #$e3
$13:8eee  f1 fb         sbc ($fb),y
$13:8ef0  dd ff f9      cmp $f9ff,x
$13:8ef3  fe e0 30      inc $30e0,x
$13:8ef6  c2 01         rep #$01
$13:8ef8  09 87         ora #$87
$13:8efa  9b            txy
$13:8efb  d2 15         cmp ($15)
$13:8efd  0f 86 c3 e1   ora $e1c386
$13:8f01  70 f8         bvs $8efb
$13:8f03  14 3c         trb $3c
$13:8f05  fc d0 e3      jsr ($e3d0,x)
$13:8f08  c1 c0         cmp ($c0,x)
$13:8f0a  e1 f4         sbc ($f4,x)
$13:8f0c  0f c2 3c 38   ora $383cc2
$13:8f10  29 21         and #$21
$13:8f12  e0 7e         cpx #$7e
$13:8f14  30 0c         bmi $8f22
$13:8f16  50 7c         bvc $8f94
$13:8f18  8d ff fe      sta $feff
$13:8f1b  9f 0f f2 88   sta $88f20f,x
$13:8f1f  54 cf 1f      mvn $1f,$cf
$13:8f22  ff cf d6 22   sbc $22d6cf,x
$13:8f26  9f 08 7c 7e   sta $7e7c08,x
$13:8f2a  0e dd 07      asl $07dd
$13:8f2d  10 8b         bpl $8eba
$13:8f2f  05 7e         ora $7e
$13:8f31  9e 0f ff      stz $ff0f,x
$13:8f34  e1 4c         sbc ($4c,x)
$13:8f36  3f 8f 07 c3   and $c3078f,x
$13:8f3a  81 fc         sta ($fc,x)
$13:8f3c  f8            sed
$13:8f3d  7f bf 8a 21   adc $218abf,x
$13:8f41  9f 5f e3 b1   sta $b1e35f,x
$13:8f45  f8            sed
$13:8f46  7c 1d 6e      jmp ($6e1d,x)
$13:8f49  1f f8 1f fe   ora $fe1ff8,x
$13:8f4d  02 c0         cop #$c0
$13:8f4f  3c 03 20      bit $2003,x
$13:8f52  43 61         eor $61,s
$13:8f54  01 29         ora ($29,x)
$13:8f56  09 88         ora #$88
$13:8f58  20 d0 38      jsr $38d0
$13:8f5b  14 1e         trb $1e
$13:8f5d  16 fa         asl $fa,x
$13:8f5f  10 c8         bpl $8f29
$13:8f61  3d 06 00      and $0006,x
$13:8f64  bb            tyx
$13:8f65  05 d8         ora $d8
$13:8f67  43 c1         eor $c1,s
$13:8f69  03 1f         ora $1f,s
$13:8f6b  80 68         bra $8fd5
$13:8f6d  0b            phd
$13:8f6e  60            rts
$13:8f6f  9c 01 c0      stz $c001
$13:8f72  8e 47 01      stx $0147
$13:8f75  40            rti
$13:8f76  c0 04         cpy #$04
$13:8f78  40            rti
$13:8f79  86 46         stx $46
$13:8f7b  c0 4e         cpy #$4e
$13:8f7d  0a            asl a
$13:8f7e  6c 4d 80      jmp ($804d)
$13:8f81  43 0a         eor $0a,s
$13:8f83  3d 86 9f      and $9f86,x
$13:8f86  63 e7         adc $e7,s
$13:8f88  f0 f1         beq $8f7b
$13:8f8a  fc 71 a9      jsr ($a971,x)
$13:8f8d  f0 f0         beq $8f7f
$13:8f8f  fc 0b c5      jsr ($c50b,x)
$13:8f92  fe e1 7f      inc $7fe1,x
$13:8f95  f8            sed
$13:8f96  7f c8 6c cb   adc $cb6cc8,x
$13:8f9a  22 76 31 48   jsl $483176
$13:8f9e  bf 51 78 fc   lda $fc7851,x
$13:8fa2  4e 3e 8b      lsr $8b3e
$13:8fa5  04 58         tsb $58
$13:8fa7  42 8e         wdm #$8e
$13:8fa9  c3 08         cmp $08,s
$13:8fab  87 c1         sta [$c1]
$13:8fad  17 00         ora [$00],y
$13:8faf  7f 18 7a 0c   adc $0c7a18,x
$13:8fb3  61 c8         adc ($c8,x)
$13:8fb5  61 84         adc ($84,x)
$13:8fb7  b7 81         lda [$81],y
$13:8fb9  bc 18 38      ldy $3818,x
$13:8fbc  7e 1e 3f      ror $3f1e,x
$13:8fbf  8f 8f f3 e1   sta $e1f38f
$13:8fc3  fc 78 7f      jsr ($7f78,x)
$13:8fc6  0e 02 27      asl $2702
$13:8fc9  08            php
$13:8fca  03 2c         ora $2c,s
$13:8fcc  08            php
$13:8fcd  60            rts
$13:8fce  c9 06         cmp #$06
$13:8fd0  48            pha
$13:8fd1  10 c9         bpl $8f9c
$13:8fd3  b0 05         bcs $8fda
$13:8fd5  50 ff         bvc $8fd6
$13:8fd7  2b            pld
$13:8fd8  c7 f8         cmp [$f8]
$13:8fda  d0 1f         bne $8ffb
$13:8fdc  c7 c3         cmp [$c3]
$13:8fde  f9 f8 ff      sbc $fff8,y
$13:8fe1  4f 27 d0 e8   eor $e8d027
$13:8fe5  07 f9         ora [$f9]
$13:8fe7  7e 10 2f      ror $2f10,x
$13:8fea  f4 3b fd      pea $fd3b
$13:8fed  06 61         asl $61
$13:8fef  0a            asl a
$13:8ff0  fc 38 0c      jsr ($0c38,x)
$13:8ff3  20 80 80      jsr $8080
$13:8ff6  c1 e6         cmp ($e6,x)
$13:8ff8  0f 30 c3 40   ora $40c330
$13:8ffc  71 90         adc ($90),y
$13:8ffe  3a            dec a
$13:8fff  16 06         asl $06,x
$13:9001  c5 81         cmp $81
$13:9003  85 80         sta $80
$13:9005  84 06         sty $06
$13:9007  0d f0 c7      ora $c7f0
$13:900a  c0 39         cpy #$39
$13:900c  f0 0f         beq $901d
$13:900e  1b            tcs
$13:900f  a8            tay
$13:9010  70 01         bvs $9013
$13:9012  61 d0         adc ($d0,x)
$13:9014  3c 87 c5      bit $c587,x
$13:9017  00 d1         brk #$d1
$13:9019  50 30         bvc $904b
$13:901b  d0 08         bne $9025
$13:901d  66 08         ror $08
$13:901f  4e 0f 32      lsr $320f
$13:9022  d1 3d         cmp ($3d),y
$13:9024  87 cd         sta [$cd]
$13:9026  00 c7         brk #$c7
$13:9028  02 86         cop #$86
$13:902a  69 7e         adc #$7e
$13:902c  07 a4         ora [$a4]
$13:902e  c0 2c         cpy #$2c
$13:9030  31 0b         and ($0b),y
$13:9032  e4 42         cpx $42
$13:9034  e9 7e         sbc #$7e
$13:9036  0f ea 74 13   ora $1374ea
$13:903a  a1 01         lda ($01,x)
$13:903c  70 0b         bvs $9049
$13:903e  3d 06 42      and $4206,x
$13:9041  2f 17 18 41   and $411817
$13:9045  c8            iny
$13:9046  86 e1         stx $e1
$13:9048  2c 87 82      bit $8287
$13:904b  81 80         sta ($80,x)
$13:904d  90 60         bcc $90af
$13:904f  32 02         and ($02)
$13:9051  f2 2b         sbc ($2b)
$13:9053  1f e2 01 e0   ora $e001e2,x
$13:9057  30 09         bmi $9062
$13:9059  54 1e 20      mvn $20,$1e
$13:905c  56 48         lsr $48,x
$13:905e  34 3e         bit $3e,x
$13:9060  08            php
$13:9061  70 14         bvs $9077
$13:9063  38            sec
$13:9064  42 d1         wdm #$d1
$13:9066  42 71         wdm #$71
$13:9068  08            php
$13:9069  34 1e         bit $1e,x
$13:906b  0f 0f 3f 92   ora $923f0f
$13:906f  11 0f         ora ($0f),y
$13:9071  e3 07         sbc $07,s
$13:9073  86 47         stx $47
$13:9075  e2 13         sep #$13
$13:9077  c9 05         cmp #$05
$13:9079  c2 80         rep #$80
$13:907b  50 0f         bvc $908c
$13:907d  07 03         ora [$03]
$13:907f  c1 20         cmp ($20,x)
$13:9081  f8            sed
$13:9082  40            rti
$13:9083  36 1f         rol $1f,x
$13:9085  cf ff c3 ff   cmp $ffc3ff
$13:9089  e0 ff         cpx #$ff
$13:908b  f0 14         beq $90a1
$13:908d  86 a3         stx $a3
$13:908f  05 18         ora $18
$13:9091  40            rti
$13:9092  7f e3 d4 2b   adc $2bd4e3,x
$13:9096  32 bc         and ($bc)
$13:9098  58            cli
$13:9099  17 0f         ora [$0f],y
$13:909b  c7 63         cmp [$63]
$13:909d  f0 d4         beq $9073
$13:909f  6f 04 12 20   adc $201204
$13:90a3  d5 08         cmp $08,x
$13:90a5  84 c6         sty $c6
$13:90a7  23 3d         and $3d,s
$13:90a9  90 5d         bcc $9108
$13:90ab  94 20         sty $20,x
$13:90ad  a1 0b         lda ($0b,x)
$13:90af  cf fe 16 e4   cmp $e416fe
$13:90b3  18            clc
$13:90b4  ff fe 3d ff   sbc $ff3dfe,x
$13:90b8  9f ff e2 70   sta $70e2ff,x
$13:90bc  f8            sed
$13:90bd  b4 3e         ldy $3e,x
$13:90bf  2e f0 18      rol $18f0
$13:90c2  a9 e0         lda #$e0
$13:90c4  20 f0 48      jsr $48f0
$13:90c7  19 0c 27      ora $270c,y
$13:90ca  ef e7 8f c0   sbc $c08fe7
$13:90ce  21 e4         and ($e4,x)
$13:90d0  41 27         eor ($27,x)
$13:90d2  87 23         sta [$23]
$13:90d4  e1 e8         sbc ($e8,x)
$13:90d6  09 0f         ora #$0f
$13:90d8  83 e1         sta $e1,s
$13:90da  50 4d         bvc $9129
$13:90dc  07 00         ora [$00]
$13:90de  ce 05 f0      dec $f005
$13:90e1  0f c2 70 38   ora $3870c2
$13:90e5  10 0c         bpl $90f3
$13:90e7  1f 83 81 f0   ora $f08183,x
$13:90eb  d0 7e         bne $916b
$13:90ed  2a            rol a
$13:90ee  17 81         ora [$81],y
$13:90f0  a8            tay
$13:90f1  44 67 83      mvp $83,$67
$13:90f4  90 90         bcc $9086
$13:90f6  4f 13 e0 40   eor $40e013
$13:90fa  2b            pld
$13:90fb  f9 14 67      sbc $6714,y
$13:90fe  d3 f2         cmp ($f2,s),y
$13:9100  48            pha
$13:9101  4b            phk
$13:9102  dd a1 7f      cmp $7fa1,x
$13:9105  22 1b b4 2f   jsl $2fb41b
$13:9109  1f eb e7 fe   ora $fee7eb,x
$13:910d  7d 7f 04      adc $047f,x
$13:9110  83 00         sta $00,s
$13:9112  70 06         bvs $911a
$13:9114  21 66         and ($66,x)
$13:9116  82 fc 8c      brl $1e15
$13:9119  61 04         adc ($04,x)
$13:911b  87 42         sta [$42]
$13:911d  1f 00 72 18   ora $187200,x
$13:9121  0c 3e 08      tsb $083e
$13:9124  0d 08 3c      ora $3c08
$13:9127  0a            asl a
$13:9128  07 07         ora [$07]
$13:912a  87 a0         sta [$a0]
$13:912c  10 fe         bpl $912c
$13:912e  10 78         bpl $91a8
$13:9130  39 f8 1f      and $1ff8,y
$13:9133  81 40         sta ($40,x)
$13:9135  bf e0 05 a0   lda $a005e0,x
$13:9139  1d 04 a1      ora $a104,x
$13:913c  58            cli
$13:913d  24 1b         bit $1b
$13:913f  18            clc
$13:9140  8e ff 80      stx $80ff
$13:9143  64 32         stz $32
$13:9145  fa            plx
$13:9146  78            sei
$13:9147  3f ff 1f fe   and $fe1fff,x
$13:914b  33 89         and ($89,s),y
$13:914d  14 b8         trb $b8
$13:914f  40            rti
$13:9150  22 10 08 94   jsl $940810
$13:9154  42 f1         wdm #$f1
$13:9156  5a            phy
$13:9157  e8            inx
$13:9158  6f 37 14 c8   adc $c81437
$13:915c  27 cb         and [$cb]
$13:915e  fd 1a ff      sbc $ff1a,x
$13:9161  43 98         eor $98,s
$13:9163  43 1e         eor $1e,s
$13:9165  ff 59 3f dc   sbc $dc3f59,x
$13:9169  2f f6 cb fd   and $fdcbf6
$13:916d  02 c0         cop #$c0
$13:916f  d0 f0         bne $9161
$13:9171  3a            dec a
$13:9172  7a            ply
$13:9173  0c 46 df      tsb $df46
$13:9176  25 8f         and $8f
$13:9178  c2 e0         rep #$e0
$13:917a  f0 17         beq $9193
$13:917c  e8            inx
$13:917d  40            rti
$13:917e  78            sei
$13:917f  70 0f         bvs $9190
$13:9181  3a            dec a
$13:9182  9c 20 17      stz $1720
$13:9185  f7 f0         sbc [$f0],y
$13:9187  82 c1 b8      brl $4a4b
$13:918a  30 08         bmi $9194
$13:918c  06 0a         asl $0a
$13:918e  09 82 a5      ora #$a582
$13:9191  61 26         adc ($26,x)
$13:9193  9c 88 40      stz $4088
$13:9196  c8            iny
$13:9197  12 45         ora ($45)
$13:9199  00 e3         brk #$e3
$13:919b  40            rti
$13:919c  39 d0 0f      and $0fd0,y
$13:919f  f4 03 f8      pea $f803
$13:91a2  1e 1f 03      asl $031f,x
$13:91a5  ec 96 61      cpx $6196
$13:91a8  74 80         stz $80,x
$13:91aa  5d 20 57      eor $5720,x
$13:91ad  00 98         brk #$98
$13:91af  d4 20         pei ($20)
$13:91b1  55 28         eor $28,x
$13:91b3  30 68         bmi $921d
$13:91b5  6f c1 f1 be   adc $bef1c1
$13:91b9  08            php
$13:91ba  96 f0         stx $f0,y
$13:91bc  2a            rol a
$13:91bd  18            clc
$13:91be  34 3e         bit $3e,x
$13:91c0  11 1e         ora ($1e),y
$13:91c2  88            dey
$13:91c3  ce 24 97      dec $9724
$13:91c6  01 a8         ora ($a8,x)
$13:91c8  59 ae 11      eor $11ae,y
$13:91cb  3b            tsc
$13:91cc  d4 0e         pei ($0e)
$13:91ce  b3 7e         lda ($7e,s),y
$13:91d0  bf de 2f f7   lda $f72fde,x
$13:91d4  0b            phd
$13:91d5  f5 82         sbc $82,x
$13:91d7  f6 45         inc $45,x
$13:91d9  1b            tcs
$13:91da  cd ca f9      cmp $f9ca
$13:91dd  71 be         adc ($be),y
$13:91df  4b            phk
$13:91e0  7f 7d 6b 6e   adc $6e6b7d,x
$13:91e4  af 8d d6 b6   lda $b6d68d
$13:91e8  5b            tcd
$13:91e9  67 13         adc [$13]
$13:91eb  b8            clv
$13:91ec  84 5e         sty $5e
$13:91ee  05 8e         ora $8e
$13:91f0  82 4e 78      brl $0a41
$13:91f3  77 c8         adc [$c8],y
$13:91f5  08            php
$13:91f6  0c 0c 21      tsb $210c
$13:91f9  38            sec
$13:91fa  c1 44         cmp ($44,x)
$13:91fc  38            sec
$13:91fd  90 2f         bcc $922e
$13:91ff  44 12 e3      mvp $e3,$12
$13:9202  02 6d         cop #$6d
$13:9204  0c 05 da      tsb $da05
$13:9207  0e d1 3b      asl $3bd1
$13:920a  a4 0c         ldy $0c
$13:920c  e1 b1         sbc ($b1,x)
$13:920e  0f c6 23 d9   ora $d923c6
$13:9212  00 f7         brk #$f7
$13:9214  60            rts
$13:9215  bc fc 0f      ldy $0ffc,x
$13:9218  85 03         sta $03
$13:921a  e1 20         sbc ($20,x)
$13:921c  bf 4c 27 ff   lda $ff274c,x
$13:9220  0f ff e1 40   ora $40e1ff
$13:9224  3f ef fa 98   and $98faef,x
$13:9228  2f ff f9 fd   and $fdf9ff
$13:922c  fe 7e e7      inc $e77e,x
$13:922f  03 98         ora $98,s
$13:9231  40            rti
$13:9232  e0 70         cpx #$70
$13:9234  e8            inx
$13:9235  47 f2         eor [$f2]
$13:9237  7f 0e ff 5f   adc $5fff0e,x
$13:923b  23 90         and $90,s
$13:923d  88            dey
$13:923e  17 89         ora [$89],y
$13:9240  c4 10         cpy $10
$13:9242  1f fc 0b ff   ora $ff0bfc,x
$13:9246  0f ff f0 18   ora $18f0ff
$13:924a  03 e3         ora $e3,s
$13:924c  52 0d         eor ($0d)
$13:924e  03 c5         ora $c5,s
$13:9250  70 a0         bvs $91f2
$13:9252  fe 3e 37      inc $373e,x
$13:9255  89 8e 66      bit #$668e
$13:9258  73 ca         adc ($ca,s),y
$13:925a  c5 ca         cmp $ca
$13:925c  a2 52         ldx #$52
$13:925e  0e f2 a4      asl $a4f2
$13:9261  31 ff         and ($ff),y
$13:9263  f8            sed
$13:9264  3f ff 0f ff   and $ff0fff,x
$13:9268  b3 ff         lda ($ff,s),y
$13:926a  e6 df         inc $df
$13:926c  fe b7 fe      inc $feb7,x
$13:926f  b9 ff 06      lda $06ff,y
$13:9272  0b            phd
$13:9273  bc e4 4f      ldy $4fe4,x
$13:9276  51 8a         eor ($8a),y
$13:9278  40            rti
$13:9279  a0 90         ldy #$90
$13:927b  24 60         bit $60
$13:927d  3f 85 ec 2f   and $2fec85,x
$13:9281  70 9b         bvs $921e
$13:9283  40            rti
$13:9284  22 d0 08 32   jsl $3208d0
$13:9288  38            sec
$13:9289  20 10 84      jsr $8410
$13:928c  60            rts
$13:928d  42 30         wdm #$30
$13:928f  90 09         bcc $929a
$13:9291  02 38         cop #$38
$13:9293  02 e2         cop #$e2
$13:9295  0f 08 c4 02   ora $02c408
$13:9299  19 00 c6      ora $c600,y
$13:929c  40            rti
$13:929d  34 90         bit $90,x
$13:929f  0d a4 02      ora $02a4
$13:92a2  60            rts
$13:92a3  0e 10 78      asl $7810
$13:92a6  48            pha
$13:92a7  27 12         and [$12]
$13:92a9  49 3c 22      eor #$223c
$13:92ac  78            sei
$13:92ad  33 09         and ($09,s),y
$13:92af  24 fa         bit $fa
$13:92b1  01 1a         ora ($1a,x)
$13:92b3  89 46 e1      bit #$e146
$13:92b6  10 c5         bpl $927d
$13:92b8  68            pla
$13:92b9  4f 27 f3 82   eor $82f327
$13:92bd  10 90         bpl $924f
$13:92bf  42 39         wdm #$39
$13:92c1  1f 8f 47 e1   ora $e1478f,x
$13:92c5  f0 f2         beq $92b9
$13:92c7  60            rts
$13:92c8  45 be         eor $be
$13:92ca  50 48         bvc $9314
$13:92cc  69 4c 20      adc #$204c
$13:92cf  b0 e8         bcs $92b9
$13:92d1  74 de         stz $de,x
$13:92d3  7d eb b5      adc $b5eb,x
$13:92d6  4a            lsr a
$13:92d7  3c 1f f8      bit $f81f,x
$13:92da  cb            wai
$13:92db  88            dey
$13:92dc  5c 61 06 60   jml $600661
$13:92e0  0c 87 ff      tsb $ff87
$13:92e3  9c 60 02      stz $0260
$13:92e6  08            php
$13:92e7  8e 72 6f      stx $6f72
$13:92ea  e8            inx
$13:92eb  3e 0e 07      rol $070e,x
$13:92ee  e0 e0         cpx #$e0
$13:92f0  7e 38 1f      ror $1f38,x
$13:92f3  1a            inc a
$13:92f4  17 3e         ora [$3e],y
$13:92f6  89 ff 9c      bit #$9cff
$13:92f9  5f 64 13 9f   eor $9f1364,x
$13:92fd  c7 ff         cmp [$ff]
$13:92ff  f9 ff 51      sbc $51ff,y
$13:9302  15 fb         ora $fb,x
$13:9304  ff 7c 4d 05   sbc $054d7c,x
$13:9308  fe 41 3f      inc $3f41,x
$13:930b  d2 45         cmp ($45)
$13:930d  a2 11         ldx #$11
$13:930f  88            dey
$13:9310  87 52         sta [$52]
$13:9312  a9 cc c4      lda #$c4cc
$13:9315  72 b2         adc ($b2)
$13:9317  5c e8 87 1a   jml $1a87e8
$13:931b  11 c4         ora ($c4),y
$13:931d  ac 7f bd      ldy $bd7f
$13:9320  9f ed 67 fa   sta $fa67ed,x
$13:9324  d9 fe fc      cmp $fcfe,y
$13:9327  7f bc 5f ef   adc $ef5fbc,x
$13:932b  57 fb         eor [$fb],y
$13:932d  ed fe 3c      sbc $3cfe
$13:9330  ab            plb
$13:9331  50 60         bvc $9393
$13:9333  60            rts
$13:9334  c1 82         cmp ($82,x)
$13:9336  c0 9a         cpy #$9a
$13:9338  a4 d7         ldy $d7
$13:933a  26 c8         rol $c8
$13:933c  41 c1         eor ($c1,x)
$13:933e  83 87         sta $87,s
$13:9340  43 9e         eor $9e,s
$13:9342  01 dc         ora ($dc,x)
$13:9344  bc 08 07      ldy $0708,x
$13:9347  09 e0 6f      ora #$6fe0
$13:934a  32 a0         and ($a0)
$13:934c  3e 8d fa      rol $fa8d,x
$13:934f  10 6a         bpl $93bb
$13:9351  90 3c         bcc $938f
$13:9353  68            pla
$13:9354  50 2a         bvc $9380
$13:9356  10 4c         bpl $93a4
$13:9358  02 e3         cop #$e3
$13:935a  54 86 55      mvn $55,$86
$13:935d  6f 17 e0 f9   adc $f9e017
$13:9361  5f 04 06 1f   eor $1f0604,x
$13:9365  0b            phd
$13:9366  95 fe         sta $fe,x
$13:9368  13 7c         ora ($7c,s),y
$13:936a  a2 5d         ldx #$5d
$13:936c  a0 17         ldy #$17
$13:936e  7a            ply
$13:936f  0d ce c1      ora $c1ce
$13:9372  78            sei
$13:9373  1b            tcs
$13:9374  84 c2         sty $c2
$13:9376  7f 18 8f 88   adc $888f18,x
$13:937a  c6 fe         dec $fe
$13:937c  41 02         eor ($02,x)
$13:937e  22 4f e7 f1   jsl $f1e74f
$13:9382  f8            sed
$13:9383  ff 32 f3 71   sbc $71f332,x
$13:9387  91 c8         sta ($c8),y
$13:9389  e1 d0         sbc ($d0,x)
$13:938b  8f e4 fe 1d   sta $1dfee4
$13:938f  fe be 47      inc $47be,x
$13:9392  21 10         and ($10,x)
$13:9394  2f 15 e2 07   and $07e215
$13:9398  21 c7         and ($c7,x)
$13:939a  c0 bb         cpy #$bb
$13:939c  f0 ff         beq $939d
$13:939e  ff 03 ff 01   sbc $01ff03,x
$13:93a2  ff f8 ff ff   sbc $fffff8,x
$13:93a6  ef fc 15 b8   sbc $b815fc
$13:93aa  2d e0 72      and $72e0
$13:93ad  93 78         sta ($78,s),y
$13:93af  1b            tcs
$13:93b0  c1 04         cmp ($04,x)
$13:93b2  81 c3         sta ($c3,x)
$13:93b4  5d 02 81      eor $8102,x
$13:93b7  88            dey
$13:93b8  7c 02 70      jmp ($7002,x)
$13:93bb  3c 09 e4      bit $e409,x
$13:93be  42 71         wdm #$71
$13:93c0  10 9e         bpl $9360
$13:93c2  0f 42 17 1f   ora $1f1742
$13:93c6  83 23         sta $23,s
$13:93c8  42 1c         wdm #$1c
$13:93ca  4b            phk
$13:93cb  15 02         ora $02,x
$13:93cd  47 e1         eor [$e1]
$13:93cf  f1 f4         sbc ($f4),y
$13:93d1  d8            cld
$13:93d2  a3 43         lda $43,s
$13:93d4  8f 05 87 c2   sta $c28705
$13:93d8  af f1 4f fd   lda $fd4ff1
$13:93dc  b3 fd         lda ($fd,s),y
$13:93de  8c ff c9      sty $c9ff
$13:93e1  bd f6 6f      lda $6ff6,x
$13:93e4  7f f3 ff fd   adc $fdfff3,x
$13:93e8  ff fe ff ff   sbc $fffffe,x
$13:93ec  7f ff bf ff   adc $ffbfff,x
$13:93f0  8f ff c9 ff   sta $ffc9ff
$13:93f4  f6 7f         inc $7f,x
$13:93f6  ff 17 db 85   sbc $85db17,x
$13:93fa  f7 e2         sbc [$e2],y
$13:93fc  f9 f4 af      sbc $aff4,y
$13:93ff  5c 82 df 04   jml $04df82
$13:9403  87 40         sta [$40]
$13:9405  30 90         bmi $9397
$13:9407  2d 03 04      and $0403
$13:940a  18            clc
$13:940b  24 c3         bit $c3
$13:940d  0f 9f fd d0   ora $d0fd9f
$13:9411  4c 10 3d      jmp $3d10
$13:9414  05 2a         ora $2a
$13:9416  01 28         ora ($28,x)
$13:9418  88            dey
$13:9419  44 a1 10      mvp $10,$a1
$13:941c  08            php
$13:941d  31 c4         and ($c4),y
$13:941f  0e 21 6a      asl $6a21
$13:9422  82 a2 c2      brl $56c7
$13:9425  97 00         sta [$00],y
$13:9427  bd 40 27      lda $2740,x
$13:942a  4f 70 80 53   eor $538070
$13:942e  c1 03         cmp ($03,x)
$13:9430  6f 80 03 82   adc $820380
$13:9434  41 00         eor ($00,x)
$13:9436  8a            txa
$13:9437  48            pha
$13:9438  29 12 0c      and #$0c12
$13:943b  05 a2         ora $a2
$13:943d  39 c8 0c      and $0cc8,y
$13:9440  87 83         sta [$83]
$13:9442  b0 11         bcs $9455
$13:9444  09 a4 02      ora #$02a4
$13:9447  e9 00 f4      sbc #$f400
$13:944a  40            rti
$13:944b  3f 90 0f f0   and $f00f90,x
$13:944f  a0 44         ldy #$44
$13:9451  e1 04         sbc ($04,x)
$13:9453  83 c1         sta $c1,s
$13:9455  20 c2 f0      jsr $f0c2
$13:9458  81 c0         sta ($c0,x)
$13:945a  ce 81 02      dec $0281
$13:945d  3a            dec a
$13:945e  8c 06 01      sty $0106
$13:9461  07 1f         ora [$1f]
$13:9463  98            tya
$13:9464  d4 89         pei ($89)
$13:9466  04 39         tsb $39
$13:9468  07 a0         ora [$a0]
$13:946a  4a            lsr a
$13:946b  af 74 df ac   lda $acdf74
$13:946f  13 25         ora ($25,s),y
$13:9471  12 d9         ora ($d9)
$13:9473  c4 bf         cpy $bf
$13:9475  36 0b         rol $0b,x
$13:9477  ae 7e ff      ldx $ff7e
$13:947a  fe ff f9      inc $f9ff,x
$13:947d  bf fd 1f fc   lda $fc1ffd,x
$13:9481  67 ff         adc [$ff]
$13:9483  9d 33 0b      sta $0b33,x
$13:9486  1c 2e bf      trb $bf2e
$13:9489  f8            sed
$13:948a  24 0e         bit $0e
$13:948c  0d 01 82      ora $8201
$13:948f  c0 ce         cpy #$ce
$13:9491  60            rts
$13:9492  6f 08 14 04   adc $041408
$13:9496  7a            ply
$13:9497  00 f0         brk #$f0
$13:9499  56 11         lsr $11,x
$13:949b  fd 1f e0      sbc $e01f,x
$13:949e  ff 01 d0 42   sbc $42d001,x
$13:94a2  25 b3         and $b3
$13:94a4  09 fc 86      ora #$86fc
$13:94a7  67 07         adc [$07]
$13:94a9  91 9b         sta ($9b),y
$13:94ab  c2 09         rep #$09
$13:94ad  15 82         ora $82,x
$13:94af  45 e0         eor $e0
$13:94b1  d3 78         cmp ($78,s),y
$13:94b3  64 fe         stz $fe
$13:94b5  79 3f 9e      adc $9e3f,y
$13:94b8  cf e7 73 f9   cmp $f973e7
$13:94bc  ca            dex
$13:94bd  98            tya
$13:94be  e7 53         sbc [$53]
$13:94c0  fe 67 b3      inc $b367,x
$13:94c3  99 fe 94      sta $94fe,y
$13:94c6  6a            ror a
$13:94c7  20 1e c8      jsr $c81e
$13:94ca  95 43         sta $43,x
$13:94cc  25 ba         and $ba
$13:94ce  d9 6d b4      cmp $b46d,y
$13:94d1  9b            txy
$13:94d2  6f 97 f9 7e   adc $7ef997
$13:94d6  13 ef         ora ($ef,s),y
$13:94d8  f6 db         inc $db,x
$13:94da  fd a4 ff      sbc $ffa4,x
$13:94dd  7d 3f dd      adc $dd3f,x
$13:94e0  ef f7 23 fd   sbc $fd23f7
$13:94e4  82 80 c2      brl $5767
$13:94e7  88            dey
$13:94e8  e1 00         sbc ($00,x)
$13:94ea  67 86         adc [$86]
$13:94ec  1a            inc a
$13:94ed  03 8c         ora $8c,s
$13:94ef  81 d0         sta ($d0,x)
$13:94f1  b0 36         bcs $9529
$13:94f3  2c 0e 2e      bit $2e0e
$13:94f6  01 0b         ora ($0b,x)
$13:94f8  80 37         bra $9531
$13:94fa  c1 be         cmp ($be,x)
$13:94fc  1c f7 30      trb $30f7
$13:94ff  f8            sed
$13:9500  dd 43 80      cmp $8043,x
$13:9503  77 1e         adc [$1e],y
$13:9505  8a            txa
$13:9506  01 e2         ora ($e2,x)
$13:9508  80 69         bra $9573
$13:950a  a8            tay
$13:950b  18            clc
$13:950c  48            pha
$13:950d  16 32         asl $32,x
$13:950f  05 c0         ora $c0
$13:9511  6a            ror a
$13:9512  03 d0         ora $d0,s
$13:9514  5e a1 e6      lsr $e6a1,x
$13:9517  03 0e         ora $0e,s
$13:9519  38            sec
$13:951a  14 30         trb $30
$13:951c  0a            asl a
$13:951d  80 3c         bra $955b
$13:951f  28            plp
$13:9520  17 0a         ora [$0a],y
$13:9522  85 c2         sta $c2
$13:9524  41 30         eor ($30,x)
$13:9526  88            dey
$13:9527  44 01 c0      mvp $c0,$01
$13:952a  0e 0b 80      asl $800b
$13:952d  7d 66 01      adc $0166,x
$13:9530  85 e8         sta $e8
$13:9532  55 fa         eor $fa,x
$13:9534  15 6b         ora $6b,x
$13:9536  0d 76 d3      ora $d376
$13:9539  6f b9 d8 ae   adc $aed8b9
$13:953d  da            phx
$13:953e  3d de ca      and $cade,x
$13:9541  3f 5b 9e 7f   and $7f9e5b,x
$13:9545  e7 7f         sbc [$7f]
$13:9547  fc 57 ff      jsr ($ff57,x)
$13:954a  35 ff         and $ff,x
$13:954c  c7 7f         cmp [$7f]
$13:954e  f1 3f         sbc ($3f),y
$13:9550  fe 27 fe      inc $fe27,x
$13:9553  c1 7f         cmp ($7f,x)
$13:9555  07 06         ora [$06]
$13:9557  2b            pld
$13:9558  91 b3         sta ($b3),y
$13:955a  cd cc b2      cmp $b2cc
$13:955d  51 28         eor ($28),y
$13:955f  6e 27 bb      ror $bb27
$13:9562  1d 9f de      ora $de9f,x
$13:9565  66 20         ror $20
$13:9567  e0 fe         cpx #$fe
$13:9569  92 86         sta ($86)
$13:956b  8b            phb
$13:956c  ff b2 ff cd   sbc $cdffb2,x
$13:9570  05 86         ora $86
$13:9572  ff c6 e1 90   sbc $90e1c6,x
$13:9576  48            pha
$13:9577  44 22 01      mvp $01,$22
$13:957a  90 80         bcc $94fc
$13:957c  6a            ror a
$13:957d  38            sec
$13:957e  14 4c         trb $4c
$13:9580  03 bc         ora $bc,s
$13:9582  a3 f0         lda $f0,s
$13:9584  13 80         ora ($80,s),y
$13:9586  9d 07 d1      sta $d107,x
$13:9589  00 e2         brk #$e2
$13:958b  1e 40 f8      asl $f840,x
$13:958e  18            clc
$13:958f  08            php
$13:9590  0c 2e 07      tsb $072e
$13:9593  07 49         ora [$49]
$13:9595  04 11         tsb $11
$13:9597  28            plp
$13:9598  10 68         bpl $9602
$13:959a  04 10         tsb $10
$13:959c  5a            phy
$13:959d  02 d0         cop #$d0
$13:959f  80 c3         bra $9564
$13:95a1  d2 24         cmp ($24)
$13:95a3  92 08         sta ($08)
$13:95a5  34 1a         bit $1a,x
$13:95a7  08            php
$13:95a8  9a            txs
$13:95a9  3c 1f 9e      bit $9e1f,x
$13:95ac  07 cf         ora [$cf]
$13:95ae  85 e7         sta $e7
$13:95b0  e1 51         sbc ($51,x)
$13:95b2  f8            sed
$13:95b3  44 72 11      mvp $11,$72
$13:95b6  1d 5c 84      ora $845c,x
$13:95b9  12 1f         ora ($1f)
$13:95bb  e3 ff         sbc $ff,s
$13:95bd  f0 fb         beq $95ba
$13:95bf  f8            sed
$13:95c0  bc fc 3a      ldy $3afc,x
$13:95c3  3e c5 45      rol $45c5,x
$13:95c6  e8            inx
$13:95c7  42 bc         wdm #$bc
$13:95c9  14 ef         trb $ef
$13:95cb  56 3b         lsr $3b,x
$13:95cd  eb            xba
$13:95ce  11 de         ora ($de),y
$13:95d0  d2 31         cmp ($31)
$13:95d2  76 4b         ror $4b,x
$13:95d4  ad 9a 67      lda $679a
$13:95d7  26 c9         rol $c9
$13:95d9  fd 7f ff      sbc $ff7f,x
$13:95dc  17 00         ora [$00],y
$13:95de  9a            txs
$13:95df  03 5c         ora $5c,s
$13:95e1  42 1c         wdm #$1c
$13:95e3  47 ff         eor [$ff]
$13:95e5  91 ff         sta ($ff),y
$13:95e7  8a            txa
$13:95e8  cb            wai
$13:95e9  e2 f0         sep #$f0
$13:95eb  f9 5c 7e      sbc $7e5c,y
$13:95ee  6f 0f 8a bd   adc $bd8a0f
$13:95f2  86 14         stx $14
$13:95f4  94 08         sty $08,x
$13:95f6  1c fe 00      trb $00fe
$13:95f9  ff 88 fc 02   sbc $02fc88,x
$13:95fd  1f 00 ec 7c   ora $7cec00,x
$13:9601  3c 1f 8f      bit $8f1f,x
$13:9604  a7 e3         lda [$e3]
$13:9606  c9 f8         cmp #$f8
$13:9608  08            php
$13:9609  80 44         bra $964f
$13:960b  3a            dec a
$13:960c  1e 09 07      asl $0709,x
$13:960f  03 f1         ora $f1,s
$13:9611  00 fe         brk #$fe
$13:9613  40            rti
$13:9614  3f c2 21 10   and $1021c2,x
$13:9618  80 84         bra $959e
$13:961a  03 e1         ora $e1,s
$13:961c  f0 4d         beq $966b
$13:961e  94 0d         sty $0d,x
$13:9620  3c 09 b2      bit $b209,x
$13:9623  1a            inc a
$13:9624  a4 0c         ldy $0c
$13:9626  7e 30 11      ror $1130,x
$13:9629  a4 e7         ldy $e7
$13:962b  ff fb fb ff   sbc $fffbfb,x
$13:962f  aa            tax
$13:9630  d5 5a         cmp $5a,x
$13:9632  87 c5         sta [$c5]
$13:9634  a2 51         ldx #$51
$13:9636  f9 3c 3e      sbc $3e3c,y
$13:9639  0f 00 86 5a   ora $5a8600
$13:963d  bf f2 af fc   lda $fcaff2,x
$13:9641  7f ff a7 ff   adc $ffa7ff,x
$13:9645  da            phx
$13:9646  6f f2 09 fc   adc $fc09f2
$13:964a  42 3f         wdm #$3f
$13:964c  0f 06 82 6c   ora $6c8206
$13:9650  62 13 89      per $1f66
$13:9653  05 90         ora $90
$13:9655  ec 13 8b      cpx $8b13
$13:9658  e1 cc         sbc ($cc,x)
$13:965a  06 a8         asl $a8
$13:965c  7c 0b 22      jmp ($220b,x)
$13:965f  10 6f         bpl $96d0
$13:9661  88            dey
$13:9662  21 56         and ($56,x)
$13:9664  84 9a         sty $9a
$13:9666  6d 07 89      adc $8907
$13:9669  42 e1         wdm #$e1
$13:966b  30 18         bmi $9685
$13:966d  24 0a         bit $0a
$13:966f  04 33         tsb $33
$13:9671  49 cc         eor #$cc
$13:9673  fe 31 1f      inc $1f31,x
$13:9676  86 43         stx $43
$13:9678  e0 d0         cpx #$d0
$13:967a  72 0b         adc ($0b)
$13:967c  68            pla
$13:967d  3b            tsc
$13:967e  50 8a         bvc $960a
$13:9680  f5 12         sbc $12,x
$13:9682  2d 9c c6      and $c69c
$13:9685  4f a3 d3 ec   eor $ecd3a3
$13:9689  f6 fb         inc $fb,x
$13:968b  25 40         and $40
$13:968d  a0 73         ldy #$73
$13:968f  3f de cf f6   and $f6cfde,x
$13:9693  fb            xce
$13:9694  fd 62 ff      sbc $ff62,x
$13:9697  70 18         bvs $96b1
$13:9699  c7 7e         cmp [$7e]
$13:969b  bf 40 b0 34   lda $34b040,x
$13:969f  2c 0e 9e      bit $9e0e
$13:96a2  83 13         sta $13,s
$13:96a4  b6 c9         ldx $c9,y
$13:96a6  63 f0         adc $f0,s
$13:96a8  b8            clv
$13:96a9  3c 04 64      bit $6404,x
$13:96ac  3c 38 07      bit $0738,x
$13:96af  9e 01 ff      stz $ff01,x
$13:96b2  80 5f         bra $9713
$13:96b4  c0 02         cpy #$02
$13:96b6  6e 01 91      ror $9101
$13:96b9  e0 a0         cpx #$a0
$13:96bb  98            tya
$13:96bc  2a            rol a
$13:96bd  56 12         lsr $12,x
$13:96bf  e9 88         sbc #$88
$13:96c1  94 74         sty $74,x
$13:96c3  34 1c         bit $1c,x
$13:96c5  08            php
$13:96c6  06 01         asl $01
$13:96c8  02 1c         cop #$1c
$13:96ca  68            pla
$13:96cb  07 38         ora [$38]
$13:96cd  48            pha
$13:96ce  61 f0         adc ($f0,x)
$13:96d0  f0 3e         beq $9710
$13:96d2  c8            iny
$13:96d3  18            clc
$13:96d4  71 09         adc ($09),y
$13:96d6  04 02         tsb $02
$13:96d8  81 44         sta ($44,x)
$13:96da  a0 40         ldy #$40
$13:96dc  28            plp
$13:96dd  87 b6         sta [$b6]
$13:96df  98            tya
$13:96e0  05 40         ora $40
$13:96e2  32 02         and ($02)
$13:96e4  61 3e         adc ($3e,x)
$13:96e6  15 7e         ora $7e,x
$13:96e8  df 2f 93 c1   cmp $c1932f,x
$13:96ec  e2 70         sep #$70
$13:96ee  18            clc
$13:96ef  44 02 09      mvp $09,$02
$13:96f2  00 81         brk #$81
$13:96f4  2a            rol a
$13:96f5  4a            lsr a
$13:96f6  c1 7f         cmp ($7f,x)
$13:96f8  98            tya
$13:96f9  28            plp
$13:96fa  06 1c         asl $1c
$13:96fc  5b            tcd
$13:96fd  05 32         ora $32
$13:96ff  ff 2d bd 8a   sbc $8abd2d,x
$13:9703  d6 ee         dec $ee,x
$13:9705  21 37         and ($37,x)
$13:9707  89 df         bit #$df
$13:9709  e2 f3         sep #$f3
$13:970b  fc 6c 6f      jsr ($6f6c,x)
$13:970e  01 80         ora ($80,x)
$13:9710  f0 40         beq $9752
$13:9712  ff f2 7f fd   sbc $fd7ff2,x
$13:9716  13 ff         ora ($ff,s),y
$13:9718  c8            iny
$13:9719  ff e0 3f fc   sbc $fc3fe0,x
$13:971d  0f ff 93 fe   ora $fe93ff
$13:9721  6c 05 59      jmp ($5905)
$13:9724  40            rti
$13:9725  a0 f2         ldy #$f2
$13:9727  a9 94         lda #$94
$13:9729  66 13         ror $13
$13:972b  02 86         cop #$86
$13:972d  4f 25 0a b2   eor $b20a25
$13:9731  54 84 3e      mvn $3e,$84
$13:9734  1f 1d 9f c1   ora $c19f1d,x
$13:9738  a3 e8         lda $e8,s
$13:973a  80 88         bra $96c4
$13:973c  4f 15 65 5c   eor $5c6515
$13:9740  9c 7c 2c      stz $2c7c
$13:9743  12 0e         ora ($0e)
$13:9745  04 a2         tsb $a2
$13:9747  21 c0         and ($c0,x)
$13:9749  05 af         ora $af
$13:974b  c3 f9         cmp $f9,s
$13:974d  80 f8         bra $9747
$13:974f  70 3c         bvs $978d
$13:9751  1f 00 38 3e   ora $3e3800,x
$13:9755  81 1a         sta ($1a,x)
$13:9757  30 c8         bmi $9721
$13:9759  1c 26 0d      trb $0d26
$13:975c  0a            asl a
$13:975d  83 c2         sta $c2,s
$13:975f  16 83         asl $83,x
$13:9761  04 81         tsb $81
$13:9763  c1 89         cmp ($89,x)
$13:9765  62 e9 08      per $a051
$13:9768  fb            xce
$13:9769  01 5d         ora ($5d,x)
$13:976b  20 e9 08      jsr $08e9
$13:976e  3c 02 31      bit $3102,x
$13:9771  9d 4d a3      sta $a34d,x
$13:9774  45 af         eor $af
$13:9776  c6 e3         dec $e3
$13:9778  72 40         adc ($40)
$13:977a  90 21         bcc $979d
$13:977c  9d 4e 28      sta $284e,x
$13:977f  93 8a         sta ($8a,s),y
$13:9781  74 e2         stz $e2,x
$13:9783  b1 38         lda ($38),y
$13:9785  b1 4e         lda ($4e),y
$13:9787  2d 93 8c      and $8c93
$13:978a  f4 e3 a1      pea $a1e3
$13:978d  38            sec
$13:978e  81 4e         sta ($4e,x)
$13:9790  66 93         ror $93
$13:9792  9a            txs
$13:9793  b4 e7         ldy $e7,x
$13:9795  11 39         ora ($39),y
$13:9797  d5 4e         cmp $4e,x
$13:9799  7b            tdc
$13:979a  93 9f         sta ($9f,s),y
$13:979c  f4 e5 dc      pea $dce5
$13:979f  14 29         trb $29
$13:97a1  d5 f2         cmp $f2,x
$13:97a3  75 b6         adc $b6,x
$13:97a5  9d 7c 27      sta $277c,x
$13:97a8  50 a9         bvc $9753
$13:97aa  dc 92 77      jml [$7792]
$13:97ad  3e 9d d2      rol $d29d,x
$13:97b0  27 75         and [$75]
$13:97b2  29 dd         and #$dd
$13:97b4  72 77         adc ($77)
$13:97b6  76 9d         ror $9d,x
$13:97b8  e4 27         cpx $27
$13:97ba  7d a9 dc      adc $dca9,x
$13:97bd  3e 00 2a      rol $2a00,x
$13:97c0  29 24         and #$24
$13:97c2  f3 ff         sbc ($ff,s),y
$13:97c4  ff 15 18 bb   sbc $bb1815,x
$13:97c8  c7 ff         cmp [$ff]
$13:97ca  ff 81 c0 20   sbc $20c081,x
$13:97ce  24 81         bit $81
$13:97d0  ac 51 20      ldy $2051
$13:97d3  e4 83         cpx $83
$13:97d5  c2 d1         rep #$d1
$13:97d7  4b            phk
$13:97d8  69 00         adc #$00
$13:97da  a9 96         lda #$96
$13:97dc  d2 55         cmp ($55)
$13:97de  3e 31 a4      rol $a431,x
$13:97e1  7e 7e 6b      ror $6b7e,x
$13:97e4  62 c9 40      per $d8b0
$13:97e7  8b            phb
$13:97e8  da            phx
$13:97e9  8f 23 89 23   sta $238923
$13:97ed  c8            iny
$13:97ee  f3 49         sbc ($49,s),y
$13:97f0  f4 2c 91      pea $912c
$13:97f3  14 a0         trb $a0
$13:97f5  b4 23         ldy $23,x
$13:97f7  1a            inc a
$13:97f8  4c a8 6b      jmp $6ba8
$13:97fb  f4 fb d3      pea $d3fb
$13:97fe  d7 e9         cmp [$e9],y
$13:9800  0d a0 18      ora $18a0
$13:9803  d2 13         cmp ($13)
$13:9805  41 67         eor ($67,x)
$13:9807  b1 64         lda ($64),y
$13:9809  bf cc 2d 79   lda $792dcc,x
$13:980d  93 54         sta ($54,s),y
$13:980f  9e 64 dd      stz $dd64,x
$13:9812  a0 1a 11      ldy #$111a
$13:9815  41 3e         eor ($3e,x)
$13:9817  6d 41 11      adc $1141
$13:981a  a6 ae         ldx $ae
$13:981c  8c 23 4d      sty $4d23
$13:981f  3d 1c da      and $da1c,x
$13:9822  70 0d         bvs $9831
$13:9824  1d 21 a2      ora $a221,x
$13:9827  10 51         bpl $987a
$13:9829  e2 8e         sep #$8e
$13:982b  d0 72         bne $989f
$13:982d  cd 50 1d      cmp $1d50
$13:9830  a6 62         ldx $62
$13:9832  93 0a         sta ($0a,s),y
$13:9834  57 1e         eor [$1e],y
$13:9836  52 94         eor ($94)
$13:9838  45 43         eor $43
$13:983a  18            clc
$13:983b  08            php
$13:983c  59 46 02      eor $0246,y
$13:983f  34 bd         bit $bd,x
$13:9841  d2 c4         cmp ($c4)
$13:9843  69 7e         adc #$7e
$13:9845  a6 15         ldx $15
$13:9847  52 cb         eor ($cb)
$13:9849  4d 21 b2      eor $b221
$13:984c  54 0a a8      mvn $a8,$0a
$13:984f  8d 63 e8      sta $e863
$13:9852  15 52         ora $52,x
$13:9854  99 4e 32      sta $324e,y
$13:9857  a4 7a         ldy $7a
$13:9859  9e 45 45      stz $4545,x
$13:985c  b8            clv
$13:985d  3a            dec a
$13:985e  42 12         wdm #$12
$13:9860  e0 38 0d      cpx #$0d38
$13:9863  46 1a         lsr $1a
$13:9865  12 3f         ora ($3f)
$13:9867  ed 44 8a      sbc $8a44
$13:986a  8d 10 2a      sta $2a10
$13:986d  b3 25         lda ($25,s),y
$13:986f  bb            tyx
$13:9870  f5 56         sbc $56,x
$13:9872  9a            txs
$13:9873  73 6a         adc ($6a,s),y
$13:9875  cd b4 79      cmp $79b4
$13:9878  81 55         sta ($55,x)
$13:987a  24 f3         bit $f3
$13:987c  d6 4b         dec $4b,x
$13:987e  7b            tdc
$13:987f  aa            tax
$13:9880  6d 34 ee      adc $ee34
$13:9883  55 1b         eor $1b,x
$13:9885  68            pla
$13:9886  15 05         ora $05,x
$13:9888  4b            phk
$13:9889  1d 5a 3b      ora $3b5a,x
$13:988c  58            cli
$13:988d  3b            tsc
$13:988e  a4 e6         ldy $e6
$13:9890  b0 55         bcs $98e7
$13:9892  4b            phk
$13:9893  19 01 71      ora $7101,y
$13:9896  a4 05         ldy $05
$13:9898  db            stp
$13:9899  90 17         bcc $98b2
$13:989b  c2 40         rep #$40
$13:989d  58            cli
$13:989e  5d 64 5e      eor $5e64,x
$13:98a1  de ca ba      dec $baca,x
$13:98a4  1d 20 24      ora $2420,x
$13:98a7  0f 28 f9 8b   ora $8bf928
$13:98ab  77 67         adc [$67],y
$13:98ad  25 e8         and $e8
$13:98af  55 cf         eor $cf,x
$13:98b1  7e 8c f3      ror $f38c,x
$13:98b4  1b            tcs
$13:98b5  33 4a         and ($4a,s),y
$13:98b7  09 00         ora #$00
$13:98b9  a5 56         lda $56
$13:98bb  45 04         eor $04
$13:98bd  e3 0a         sbc $0a,s
$13:98bf  fb            xce
$13:98c0  99 66 ad      sta $ad66,y
$13:98c3  c3 fe         cmp $fe,s
$13:98c5  7f dc 68 fb   adc $fb68dc,x
$13:98c9  27 69         and [$69]
$13:98cb  3e c9 ea      rol $eac9,x
$13:98ce  8e b0 71      stx $71b0
$13:98d1  a0 54 9d      ldy #$9d54
$13:98d4  a4 15         ldy $15
$13:98d6  27 a9         and [$a9]
$13:98d8  43 cd         eor $cd,s
$13:98da  87 27         sta [$27]
$13:98dc  9e 8a db      stz $db8a,x
$13:98df  ef 4f 15 b4   sbc $b4154f
$13:98e3  02 a6         cop #$a6
$13:98e5  69 08         adc #$08
$13:98e7  29 b0         and #$b0
$13:98e9  ee 95 90      inc $9095
$13:98ec  99 42 0a      sta $0a42,y
$13:98ef  07 0c         ora [$0c]
$13:98f1  2e 09 44      rol $4409
$13:98f4  09 34         ora #$34
$13:98f6  fb            xce
$13:98f7  02 ba         cop #$ba
$13:98f9  7d 3f e5      adc $e53f,x
$13:98fc  f4 66 87      pea $8766
$13:98ff  f5 bc         sbc $bc,x
$13:9901  21 92         and ($92,x)
$13:9903  ff 37 85 da   sbc $da8537,x
$13:9907  48            pha
$13:9908  92 14         sta ($14)
$13:990a  83 34         sta $34,s
$13:990c  02 24         cop #$24
$13:990e  19 20 89      ora $8920,y
$13:9911  3b            tsc
$13:9912  48            pha
$13:9913  22 49 5a 67   jsl $675a49
$13:9917  04 09         tsb $09
$13:9919  d9 b0 38      cmp $38b0,y
$13:991c  02 0d         cop #$0d
$13:991e  17 60         ora [$60],y
$13:9920  8b            phb
$13:9921  46 99         lsr $99
$13:9923  25 49         and $49
$13:9925  c2 41         rep #$41
$13:9927  92 70         sta ($70)
$13:9929  90 84         bcc $98af
$13:992b  9c 24 df      stz $df24
$13:992e  a5 cf         lda $cf
$13:9930  15 c2         ora $c2,x
$13:9932  51 00         eor ($00),y
$13:9934  a0 93 06      ldy #$0693
$13:9937  41 00         eor ($00,x)
$13:9939  98            tya
$13:993a  40            rti
$13:993b  24 6c         bit $6c
$13:993d  c0 86 45      cpy #$4586
$13:9940  20 33 09      jsr $0933
$13:9943  eb            xba
$13:9944  30 22         bmi $9968
$13:9946  90 c1         bcc $9909
$13:9948  20 4f 84      jsr $844f
$13:994b  05 11         ora $11
$13:994d  90 57         bcc $99a6
$13:994f  44 e4 32      mvp $32,$e4
$13:9952  0a            asl a
$13:9953  f1 98         sbc ($98),y
$13:9955  22 91 49 0c   jsl $0c4991
$13:9959  62 fc cc      per $6658
$13:995c  19 04 22      ora $2204,y
$13:995f  53 1d         eor ($1d,s),y
$13:9961  82 40 43      brl $dca4
$13:9964  60            rts
$13:9965  47 1a         eor [$1a]
$13:9967  24 06         bit $06
$13:9969  11 18         ora ($18),y
$13:996b  84 ca         sty $ca
$13:996d  33 8c         and ($8c,s),y
$13:996f  c0 8c 42      cpy #$428c
$13:9972  0a            asl a
$13:9973  a1 9e         lda ($9e,x)
$13:9975  4f 84 22 41   eor $412284
$13:9979  19 90 6f      ora $6f90,y
$13:997c  19 81 10      ora $1081,y
$13:997f  88            dey
$13:9980  46 63         lsr $63
$13:9982  1b            tcs
$13:9983  d0 c8         bne $994d
$13:9985  c2 0c         rep #$0c
$13:9987  61 bf         adc ($bf,x)
$13:9989  4f 84 42 31   eor $314284
$13:998d  29 88         and #$88
$13:998f  77 53         adc [$53],y
$13:9991  e1 18         sbc ($18,x)
$13:9993  88            dey
$13:9994  1e 03 bc      asl $bc03,x
$13:9997  cc 08 fc      cpy $fc08
$13:999a  06 1f         asl $1f
$13:999c  22 e2 27 c2   jsl $c227e2
$13:99a0  4e 83 08      lsr $0883
$13:99a3  d7 95         cmp [$95],y
$13:99a5  12 52         ora ($52)
$13:99a7  78            sei
$13:99a8  97 d5         sta [$d5],y
$13:99aa  12 52         ora ($52)
$13:99ac  f8            sed
$13:99ad  57 d0         eor [$d0],y
$13:99af  12 11         ora ($11)
$13:99b1  f8            sed
$13:99b2  4a            lsr a
$13:99b3  6c 3e 68      jmp ($683e)
$13:99b6  92 9b         sta ($9b)
$13:99b8  c0 be 49      cpy #$49be
$13:99bb  e2 54         sep #$54
$13:99bd  87 c5         sta [$c5]
$13:99bf  98            tya
$13:99c0  08            php
$13:99c1  30 43         bmi $9a06
$13:99c3  0d 01 98      ora $9801
$13:99c6  12 74         ora ($74)
$13:99c8  68            pla
$13:99c9  ae 89 28      ldx $2889
$13:99cc  2b            pld
$13:99cd  a2 4d         ldx #$4d
$13:99cf  8a            txa
$13:99d0  e8            inx
$13:99d1  21 31         and ($31,x)
$13:99d3  f5 10         sbc $10,x
$13:99d5  ae 89 52      ldx $5289
$13:99d8  2c f2 58      bit $58f2
$13:99db  0d 00 ce      ora $ce00
$13:99de  22 40 c6 b2   jsl $b2c640
$13:99e2  42 33         wdm #$33
$13:99e4  07 90         ora [$90]
$13:99e6  c4 20         cpy $20
$13:99e8  4e 40 84      lsr $8440
$13:99eb  c5 dd         cmp $dd
$13:99ed  e1 04         sbc ($04,x)
$13:99ef  79 14 c6      adc $c614,y
$13:99f2  01 24         ora ($24,x)
$13:99f4  72 03         adc ($03)
$13:99f6  b4 1f         ldy $1f,x
$13:99f8  a1 22         lda ($22,x)
$13:99fa  5d 03 b8      eor $b803,x
$13:99fd  20 13 98      jsr $9813
$13:9a00  74 12         stz $12,x
$13:9a02  01 21         ora ($21,x)
$13:9a04  83 82         sta $82,s
$13:9a06  c6 89         dec $89
$13:9a08  08            php
$13:9a09  80 4a         bra $9a55
$13:9a0b  20 0b a0      jsr $a00b
$13:9a0e  36 8c         rol $8c,x
$13:9a10  02 61         cop #$61
$13:9a12  00 91         brk #$91
$13:9a14  b5 c2         lda $c2,x
$13:9a16  19 14 0f      ora $0f14,y
$13:9a19  84 f5         sty $f5
$13:9a1b  ae 11 48      ldx $4811
$13:9a1e  60            rts
$13:9a1f  7c 27 c2      jmp ($c227,x)
$13:9a22  32 88         and ($88)
$13:9a24  48            pha
$13:9a25  2b            pld
$13:9a26  a2 a2         ldx #$a2
$13:9a28  1a            inc a
$13:9a29  85 79         sta $79
$13:9a2b  58            cli
$13:9a2c  11 48         ora ($48),y
$13:9a2e  a4 82         ldy $82
$13:9a30  31 7e         and ($7e),y
$13:9a32  6b            rtl
$13:9a33  81 b8         sta ($b8,x)
$13:9a35  65 11         adc $11
$13:9a37  d8            cld
$13:9a38  24 04         bit $04
$13:9a3a  3c 04 a1      bit $a104,x
$13:9a3d  a2 40         ldx #$40
$13:9a3f  61 11         adc ($11,x)
$13:9a41  88            dey
$13:9a42  4c 9f 38      jmp $389f
$13:9a45  d7 08         cmp [$08],y
$13:9a47  c4 20         cpy $20
$13:9a49  b0 19         bcs $9a64
$13:9a4b  e5 60         sbc $60
$13:9a4d  42 24         wdm #$24
$13:9a4f  11 89         ora ($89),y
$13:9a51  06 f1         asl $f1
$13:9a53  ae 0e 60      ldx $600e
$13:9a56  8c 46 37      sty $3746
$13:9a59  a1 c1         lda ($c1,x)
$13:9a5b  2b            pld
$13:9a5c  04 83         tsb $83
$13:9a5e  7e ac 03      ror $03ac,x
$13:9a61  60            rts
$13:9a62  4a            lsr a
$13:9a63  22 1d d5 60   jsl $60d51d
$13:9a67  46 22         lsr $22
$13:9a69  07 b0         ora [$b0]
$13:9a6b  ef 35 c2 3f   sbc $3fc235
$13:9a6f  01 87         ora ($87,x)
$13:9a71  2e 01 4a      rol $4a01
$13:9a74  51 e5         eor ($e5),y
$13:9a76  f8            sed
$13:9a77  29 4a         and #$4a
$13:9a79  4c c6 04      jmp $04c6
$13:9a7c  99 4b 99      sta $994b,y
$13:9a7f  a0 7e         ldy #$7e
$13:9a81  08            php
$13:9a82  fc 25 3c      jsr ($3c25,x)
$13:9a85  1f 34 99 4d   ora $4d9934,x
$13:9a89  9b            txy
$13:9a8a  60            rts
$13:9a8b  a1 25         lda ($25,x)
$13:9a8d  60            rts
$13:9a8e  7c 5a e0      jmp ($e05a,x)
$13:9a91  86 04         stx $04
$13:9a93  48            pha
$13:9a94  b5 89         lda $89,x
$13:9a96  20 2d 62      jsr $622d
$13:9a99  4b            phk
$13:9a9a  8a            txa
$13:9a9b  f4 93 c2      pea $c293
$13:9a9e  1a            inc a
$13:9a9f  08            php
$13:9aa0  4c 7d 4a      jmp $4a7d
$13:9aa3  2b            pld
$13:9aa4  d2 56         cmp ($56)
$13:9aa6  0b            phd
$13:9aa7  48            pha
$13:9aa8  96 62         stx $62,y
$13:9aaa  00 03         brk #$03
$13:9aac  58            cli
$13:9aad  07 c3         ora [$c3]
$13:9aaf  1a            inc a
$13:9ab0  c5 00         cmp $00
$13:9ab2  10 48         bpl $9afc
$13:9ab4  22 10 27 38   jsl $382710
$13:9ab8  42 62         wdm #$62
$13:9aba  ef 20 82 3d   sbc $3d8220
$13:9abe  48            pha
$13:9abf  40            rti
$13:9ac0  12 47         ora ($47)
$13:9ac2  38            sec
$13:9ac3  3c 00 40      bit $4000,x
$13:9ac6  12 26         ora ($26)
$13:9ac8  c8            iny
$13:9ac9  41 e4         eor ($e4,x)
$13:9acb  30 09         bmi $9ad6
$13:9acd  c4 3a         cpy $3a
$13:9acf  09 00         ora #$00
$13:9ad1  90 c1         bcc $9a94
$13:9ad3  c1 c3         cmp ($c3,x)
$13:9ad5  44 84 40      mvp $40,$84
$13:9ad8  25 10         and $10
$13:9ada  0a            asl a
$13:9adb  11 f8         ora ($f8),y
$13:9add  09 00         ora #$00
$13:9adf  eb            xba
$13:9ae0  00 90         brk #$90
$13:9ae2  11 8e         ora ($8e),y
$13:9ae4  54 4c 03      mvn $03,$4c
$13:9ae7  18            clc
$13:9ae8  c6 a4         dec $a4
$13:9aea  06 80         asl $80
$13:9aec  4a            lsr a
$13:9aed  0c 7e 36      tsb $367e
$13:9af0  92 39         sta ($39)
$13:9af2  3c 4d 32      bit $324d,x
$13:9af5  72 f8         adc ($f8)
$13:9af7  5a            phy
$13:9af8  80 c8         bra $9ac2
$13:9afa  c0 a7         cpy #$a7
$13:9afc  39 bc 0d      and $0dbc,y
$13:9aff  5c 65 40 5a   jml $5a4065
$13:9b03  9c 3e 46      stz $463e
$13:9b06  bc 31 c0      ldy $c031,x
$13:9b09  b6 48         ldx $48,y
$13:9b0b  7e 2d 92      ror $922d,x
$13:9b0e  23 0b         and $0b,s
$13:9b10  64 8a         stz $8a
$13:9b12  82 e0 22      brl $bdf5
$13:9b15  68            pla
$13:9b16  b8            clv
$13:9b17  08            php
$13:9b18  b6 2e         ldx $2e,y
$13:9b1a  70 84         bvs $9aa0
$13:9b1c  46 26         lsr $26
$13:9b1e  50 09         bvc $9b29
$13:9b20  33 14         and ($14,s),y
$13:9b22  23 10         and $10,s
$13:9b24  84 98         sty $98
$13:9b26  06 c2         asl $c2
$13:9b28  03 1e         ora $1e,s
$13:9b2a  81 44         sta ($44,x)
$13:9b2c  64 3a         stz $3a
$13:9b2e  07 38         ora [$38]
$13:9b30  43 a2         eor $a2,s
$13:9b32  50 99         bvc $9acd
$13:9b34  4e 49 b2      lsr $b249
$13:9b37  11 68         ora ($68),y
$13:9b39  94 66         sty $66,x
$13:9b3b  43 b2         eor $b2,s
$13:9b3d  73 84         adc ($84,s),y
$13:9b3f  5a            phy
$13:9b40  15 01         ora $01,x
$13:9b42  98            tya
$13:9b43  e0 5b         cpx #$5b
$13:9b45  21 0e         and ($0e,x)
$13:9b47  8d 40 67      sta $6740
$13:9b4a  38            sec
$13:9b4b  37 38         and [$38],y
$13:9b4d  08            php
$13:9b4e  40            rti
$13:9b4f  54 34 47      mvn $47,$34
$13:9b52  40            rti
$13:9b53  c6 a3         dec $a3
$13:9b55  1b            tcs
$13:9b56  d3 30         cmp ($30,s),y
$13:9b58  24 42         bit $42
$13:9b5a  45 10         eor $10
$13:9b5c  83 25         sta $25,s
$13:9b5e  89 a4         bit #$a4
$13:9b60  01 90         ora ($90,x)
$13:9b62  48            pha
$13:9b63  0c 2a 51      tsb $512a
$13:9b66  9c 0f 04      stz $040f
$13:9b69  42 31         wdm #$31
$13:9b6b  02 9c         cop #$9c
$13:9b6d  63 43         adc $43,s
$13:9b6f  c1 18         cmp ($18,x)
$13:9b71  88            dey
$13:9b72  39 c3 1c      and $1cc3,y
$13:9b75  96 27         stx $27,y
$13:9b77  00 67         brk #$67
$13:9b79  8c c1 1f      sty $1fc1
$13:9b7c  80 98         bra $9b16
$13:9b7e  84 3c         sty $3c
$13:9b80  10 71         bpl $9bf3
$13:9b82  28            plp
$13:9b83  4e a1 c2      lsr $c2a1
$13:9b86  d0 90         bne $9b18
$13:9b88  c1 c0         cmp ($c0,x)
$13:9b8a  63 44         adc $44,s
$13:9b8c  6d 82 70      adc $7082
$13:9b8f  0e 60 34      asl $3460
$13:9b92  06 10         asl $10
$13:9b94  4c 02 a3      jmp $a302
$13:9b97  01 0a         ora ($0a,x)
$13:9b99  84 22         sty $22
$13:9b9b  51 1d         eor ($1d),y
$13:9b9d  03 04         ora $04,s
$13:9b9f  22 41 18 90   jsl $901841
$13:9ba3  6f 08 45 1e   adc $1e4508
$13:9ba7  8d 79 48      sta $4879
$13:9baa  45 26         eor $26
$13:9bac  89 7d         bit #$7d
$13:9bae  46 05         lsr $05
$13:9bb0  2e 85 7d      rol $7d85
$13:9bb3  0a            asl a
$13:9bb4  e4 3b         cpx $3b
$13:9bb6  0f 98 c0 a6   ora $a6c098
$13:9bba  d0 2f         bne $9beb
$13:9bbc  90 f8         bcc $9bb6
$13:9bbe  89 21         bit #$21
$13:9bc0  f1 33         sbc ($33),y
$13:9bc2  03 e4         ora $e4,s
$13:9bc4  21 d2         and ($d2,x)
$13:9bc6  2e 21 cc      rol $cc21
$13:9bc9  85 a2         sta $a2
$13:9bcb  73 21         adc ($21,s),y
$13:9bcd  a0 98         ldy #$98
$13:9bcf  48            pha
$13:9bd0  76 26         ror $26,x
$13:9bd2  12 24         ora ($24)
$13:9bd4  8a            txa
$13:9bd5  20 88 42      jsr $4288
$13:9bd8  76 22         ror $22,x
$13:9bda  80 a9         bra $9b85
$13:9bdc  01 a0         ora ($a0,x)
$13:9bde  01 80         ora ($80,x)
$13:9be0  93 35         sta ($35,s),y
$13:9be2  48            pha
$13:9be3  30 01         bmi $9be6
$13:9be5  00 16         brk #$16
$13:9be7  04 0a         tsb $0a
$13:9be9  21 20         and ($20,x)
$13:9beb  d0 21         bne $9c0e
$13:9bed  02 1d         cop #$1d
$13:9bef  12 0f         ora ($0f)
$13:9bf1  86 48         stx $48
$13:9bf3  c2 11         rep #$11
$13:9bf5  68            pla
$13:9bf6  90 98         bcc $9b90
$13:9bf8  36 48         rol $48,x
$13:9bfa  40            rti
$13:9bfb  8b            phb
$13:9bfc  42 82         wdm #$82
$13:9bfe  e1 81         sbc ($81,x)
$13:9c00  30 84         bmi $9b86
$13:9c02  3a            dec a
$13:9c03  35 00         and $00,x
$13:9c05  9c 60 d0      stz $d060
$13:9c08  80 16         bra $9c20
$13:9c0a  00 f8         brk #$f8
$13:9c0c  d1 20         cmp ($20),y
$13:9c0e  31 07         and ($07),y
$13:9c10  28            plp
$13:9c11  46 37         lsr $37
$13:9c13  ad c2 90      lda $90c2
$13:9c16  44 20 cf      mvp $cf,$20
$13:9c19  12 63         ora ($63)
$13:9c1b  80 38         bra $9c55
$13:9c1d  10 a3         bpl $9bc2
$13:9c1f  09 93         ora #$93
$13:9c21  e7 1e         sbc [$1e]
$13:9c23  24 9d         bit $9d
$13:9c25  07 b9         ora [$b9]
$13:9c27  95 c5         sta $c5,x
$13:9c29  fe 73 80      inc $8073,x
$13:9c2c  2a            rol a
$13:9c2d  3a            dec a
$13:9c2e  c1 78         cmp ($78,x)
$13:9c30  41 70         eor ($70,x)
$13:9c32  c6 88         dec $88
$13:9c34  c0 1e 34      cpy #$341e
$13:9c37  20 9a c8      jsr $c89a
$13:9c3a  86 05         stx $05
$13:9c3c  1f 8d 8b ce   ora $ce8b8d,x
$13:9c40  4f 13 1b 1c   eor $1c1b13
$13:9c44  be 16 3d      ldx $3d16,y
$13:9c47  30 d8         bmi $9c21
$13:9c49  11 0e         ora ($0e),y
$13:9c4b  6f 03 25 98   adc $982503
$13:9c4f  a4 0a         ldy $0a
$13:9c51  40            rti
$13:9c52  62 10 68      per $0465
$13:9c55  98            tya
$13:9c56  48            pha
$13:9c57  28            plp
$13:9c58  26 12         rol $12
$13:9c5a  0d 89 84      ora $8489
$13:9c5d  85 22         sta $22
$13:9c5f  76 21         ror $21,x
$13:9c61  10 9d         bpl $9c00
$13:9c63  88            dey
$13:9c64  60            rts
$13:9c65  28            plp
$13:9c66  42 99         wdm #$99
$13:9c68  22 50 c2 09   jsl $09c250
$13:9c6c  11 81         ora ($81),y
$13:9c6e  c7 62         cmp [$62]
$13:9c70  32 1d         and ($1d)
$13:9c72  03 7c         ora $7c,s
$13:9c74  21 71         and ($71,x)
$13:9c76  53 78         eor ($78,s),y
$13:9c78  68            pla
$13:9c79  5b            tcd
$13:9c7a  e1 13         sbc ($13,x)
$13:9c7c  86 c2         stx $c2
$13:9c7e  65 39         adc $39
$13:9c80  23 c9         and $c9,s
$13:9c82  40            rti
$13:9c83  66 38         ror $38
$13:9c85  23 91         and $91,s
$13:9c87  21 03         and ($03,x)
$13:9c89  02 df         cop #$df
$13:9c8b  00 18         brk #$18
$13:9c8d  42 25         wdm #$25
$13:9c8f  51 d8         eor ($d8),y
$13:9c91  22 d8 92 60   jsl $6092d8
$13:9c95  bc 29 14      ldy $1429,x
$13:9c98  43 9a         eor $9a,s
$13:9c9a  c3 25         cmp $25,s
$13:9c9c  00 32         brk #$32
$13:9c9e  4d 40 0d      eor $0d40
$13:9ca1  01 6d         ora ($6d,x)
$13:9ca3  04 4a         tsb $4a
$13:9ca5  41 ae         eor ($ae,x)
$13:9ca7  68            pla
$13:9ca8  92 d4         sta ($d4)
$13:9caa  35 8d         and $8d,x
$13:9cac  f0 06         beq $9cb4
$13:9cae  04 3e         tsb $3e
$13:9cb0  47 c4         eor [$c4]
$13:9cb2  2e 83 84      rol $8483
$13:9cb5  18            clc
$13:9cb6  62 1e 08      per $a4d7
$13:9cb9  c4 42         cpy $42
$13:9cbb  05 38         ora $38
$13:9cbd  c7 07         cmp [$07]
$13:9cbf  82 21 18      brl $b4e3
$13:9cc2  68            pla
$13:9cc3  83 e8         sta $e8,s
$13:9cc5  0c a3 0a      tsb $0aa3
$13:9cc8  94 67         sty $67,x
$13:9cca  94 64         sty $64,x
$13:9ccc  df 0c e0 78   cmp $78e00c,x
$13:9cd0  20 f2 18      jsr $18f2
$13:9cd3  04 ea         tsb $ea
$13:9cd5  1d 04 80      ora $8004,x
$13:9cd8  48            pha
$13:9cd9  60            rts
$13:9cda  ee d1 a2      inc $a2d1
$13:9cdd  2c 00 d4      bit $d400
$13:9ce0  05 60         ora $60
$13:9ce2  0f 02 5c 26   ora $265c02
$13:9ce6  10 09         bpl $9cf1
$13:9ce8  10 5c         bpl $9d46
$13:9cea  a3 d1         lda $d1,s
$13:9cec  af 28 14 a4   lda $a41428
$13:9cf0  d1 2f         cmp ($2f),y
$13:9cf2  a8            tay
$13:9cf3  14 a5         trb $a5
$13:9cf5  d0 af         bne $9ca6
$13:9cf7  a0 b0 82      ldy #$82b0
$13:9cfa  e1 f3         sbc ($f3,x)
$13:9cfc  02 94         cop #$94
$13:9cfe  da            phx
$13:9cff  05 f2         ora $f2
$13:9d01  0d 10 94      ora $9410
$13:9d04  3e 2c d0      rol $d02c,x
$13:9d07  25 00         and $00
$13:9d09  24 49         bit $49
$13:9d0b  04 10         tsb $10
$13:9d0d  11 b1         ora ($b1),y
$13:9d0f  05 c4         ora $c4
$13:9d11  6c 42 51      jmp ($5142)
$13:9d14  22 04 26 3e   jsl $3e2604
$13:9d18  1e 12 59      asl $5912,x
$13:9d1b  0b            phd
$13:9d1c  05 8c         ora $8c
$13:9d1e  0a            asl a
$13:9d1f  50 01         bvc $9d22
$13:9d21  04 99         tsb $99
$13:9d23  54 40 20      mvn $20,$40
$13:9d26  7d 04 06      adc $0604,x
$13:9d29  07 1d         ora [$1d]
$13:9d2b  88            dey
$13:9d2c  48            pha
$13:9d2d  34 08         bit $08,x
$13:9d2f  72 35         adc ($35)
$13:9d31  86 85         stx $85
$13:9d33  54 11 38      mvn $38,$11
$13:9d36  6c 22 51      jmp ($5122)
$13:9d39  92 3a         sta ($3a)
$13:9d3b  90 04         bcc $9d41
$13:9d3d  30 46         bmi $9d85
$13:9d3f  e2 00         sep #$00
$13:9d41  86 05         stx $05
$13:9d43  54 0f f0      mvn $f0,$0f
$13:9d46  3c 84 76      bit $7684,x
$13:9d49  09 01         ora #$01
$13:9d4b  00 02         brk #$02
$13:9d4d  38            sec
$13:9d4e  68            pla
$13:9d4f  90 18         bcc $9d69
$13:9d51  81 c8         sta ($c8,x)
$13:9d53  22 1c d5 c1   jsl $c1d51c
$13:9d57  27 02         and [$02]
$13:9d59  0c db 24      tsb $24db
$13:9d5c  e0 3e 00      cpx #$003e
$13:9d5f  b4 27         ldy $27,x
$13:9d61  20 d6 36      jsr $36d6
$13:9d64  c1 8e         cmp ($8e,x)
$13:9d66  10 e9         bpl $9d51
$13:9d68  17 10         ora [$10],y
$13:9d6a  b2 11         lda ($11)
$13:9d6c  f8            sed
$13:9d6d  0a            asl a
$13:9d6e  e0 5c 44      cpx #$445c
$13:9d71  79 07 42      adc $4207,y
$13:9d74  4e 1d e8      lsr $e81d
$13:9d77  ce 04 c1      dec $c104
$13:9d7a  46 23         lsr $23
$13:9d7c  1b            tcs
$13:9d7d  d3 01         cmp ($01,s),y
$13:9d7f  42 64         wdm #$64
$13:9d81  f9 e7 f0      sbc $f0e7,y
$13:9d84  a8            tay
$13:9d85  47 7e         eor [$7e]
$13:9d87  75 04         adc $04,x
$13:9d89  d0 00         bne $9d8b
$13:9d8b  43 1a         eor $1a,s
$13:9d8d  94 03         sty $03,x
$13:9d8f  28            plp
$13:9d90  d0 99         bne $9d2b
$13:9d92  20 8c 07      jsr $078c
$13:9d95  80 40         bra $9dd7
$13:9d97  25 27         and $27
$13:9d99  50 49         bvc $9de4
$13:9d9b  8c a9 2e      sty $2ea9
$13:9d9e  10 06         bpl $9da6
$13:9da0  d0 4a         bne $9dec
$13:9da2  a2 1d d1      ldx #$d11d
$13:9da5  09 47         ora #$47
$13:9da7  e3 7e         sbc $7e,s
$13:9da9  50 79         bvc $9e24
$13:9dab  49 e2         eor #$e2
$13:9dad  7f 50 79 4b   adc $4b7950,x
$13:9db1  e1 7f         sbc ($7f,x)
$13:9db3  46 48         lsr $48
$13:9db5  47 e1         eor [$e1]
$13:9db7  32 e8         and ($e8)
$13:9db9  67 cc         adc [$cc]
$13:9dbb  1e 53 78      asl $7853,x
$13:9dbe  1f c8 48 42   ora $4248c8,x
$13:9dc2  f0 f8         beq $9dbc
$13:9dc4  b2 40         lda ($40)
$13:9dc6  32 01         and ($01)
$13:9dc8  31 29         and ($29),y
$13:9dca  00 64         brk #$64
$13:9dcc  03 42         ora $42,s
$13:9dce  40            rti
$13:9dcf  21 08         and ($08,x)
$13:9dd1  91 ca         sta ($ca),y
$13:9dd3  6d 04 f9      adc $f904
$13:9dd6  11 c1         ora ($c1),y
$13:9dd8  60            rts
$13:9dd9  00 c0         brk #$c0
$13:9ddb  ef 32 42 13   sbc $134232
$13:9ddf  1f 10 87 cc   ora $cc8710,x
$13:9de3  8e 0a 90      stx $900a
$13:9de6  10 87         bpl $9d6f
$13:9de8  c5 76         cmp $76
$13:9dea  10 38         bpl $9e24
$13:9dec  ec 8a 20      cpx $208a
$13:9def  08            php
$13:9df0  03 58         ora $58,s
$13:9df2  cc a0 16      cpy $16a0
$13:9df5  46 48         lsr $48
$13:9df7  44 e2 b3      mvp $b3,$e2
$13:9dfa  28            plp
$13:9dfb  45 99         eor $99
$13:9dfd  92 11         sta ($11)
$13:9dff  b8            clv
$13:9e00  69 f0         adc #$f0
$13:9e02  2c ec 90      bit $90ec
$13:9e05  91 c1         sta ($c1),y
$13:9e07  4f 81 68 43   eor $436881
$13:9e0b  10 30         bpl $9e3d
$13:9e0d  2b            pld
$13:9e0e  08            php
$13:9e0f  62 91 46      per $e4a3
$13:9e12  29 07         and #$07
$13:9e14  12 88         ora ($88)
$13:9e16  c8            iny
$13:9e17  74 0e         stz $0e,x
$13:9e19  c0 85 c5      cpy #$c585
$13:9e1c  53 e1         eor ($e1,s),y
$13:9e1e  a1 3f         lda ($3f,x)
$13:9e20  94 46         sty $46,x
$13:9e22  53 a3         eor ($a3,s),y
$13:9e24  51 14         eor ($14),y
$13:9e26  06 63         asl $63
$13:9e28  81 76         sta ($76,x)
$13:9e2a  04 4e         tsb $4e
$13:9e2c  1a            inc a
$13:9e2d  b4 0c         ldy $0c,x
$13:9e2f  10 e4         bpl $9e15
$13:9e31  20 72 58      jsr $5872
$13:9e34  54 c3 20      mvn $20,$c3
$13:9e37  ec 28 d3      cpx $d328
$13:9e3a  70 5c         bvs $9e98
$13:9e3c  c3 1a         cmp $1a,s
$13:9e3e  75 14         adc $14,x
$13:9e40  62 11 0a      per $a854
$13:9e43  94 67         sty $67,x
$13:9e45  87 20         sta [$20]
$13:9e47  57 08         eor [$08],y
$13:9e49  14 e3         trb $e3
$13:9e4b  1c a2 06      trb $06a2
$13:9e4e  68            pla
$13:9e4f  81 82         sta ($82,x)
$13:9e51  09 01         ora #$01
$13:9e53  09 04         ora #$04
$13:9e55  3e 47 c4      rol $c447,x
$13:9e58  35 02         and $02,x
$13:9e5a  90 0d         bcc $9e69
$13:9e5c  c1 45         cmp ($45,x)
$13:9e5e  5b            tcd
$13:9e5f  91 b8         sta ($b8),y
$13:9e61  28            plp
$13:9e62  ca            dex
$13:9e63  20 8f c0      jsr $c08f
$13:9e66  5d 82 39      eor $3982,x
$13:9e69  08            php
$13:9e6a  84 61         sty $61
$13:9e6c  bc 18 d5      ldy $d518,x
$13:9e6f  10 42         bpl $9eb3
$13:9e71  23 0d         and $0d,s
$13:9e73  70 ce         bvs $9e43
$13:9e75  0e 42 0f      asl $0f42
$13:9e78  21 80         and ($80,x)
$13:9e7a  4e a1 d0      lsr $d0a1
$13:9e7d  48            pha
$13:9e7e  04 86         tsb $86
$13:9e80  0e 16 1a      asl $1a16
$13:9e83  24 22         bit $22
$13:9e85  01 28         ora ($28,x)
$13:9e87  80 11         bra $9e9a
$13:9e89  c1 98         cmp ($98,x)
$13:9e8b  30 09         bmi $9e96
$13:9e8d  80 88         bra $9e17
$13:9e8f  60            rts
$13:9e90  22 90 84 4a   jsl $4a8490
$13:9e94  23 a7         and $a7,s
$13:9e96  00 03         brk #$03
$13:9e98  04 a2         tsb $a2
$13:9e9a  21 dd         and ($dd,x)
$13:9e9c  13 04         ora ($04,s),y
$13:9e9e  9e 03 1e      stz $1e03,x
$13:9ea1  8d 79 47      sta $4779
$13:9ea4  85 26         sta $26
$13:9ea6  89 7d         bit #$7d
$13:9ea8  47 85         eor [$85]
$13:9eaa  2e 85 7d      rol $7d85
$13:9ead  04 c1         tsb $c1
$13:9eaf  1f 84 93 83   ora $839384,x
$13:9eb3  e6 3c         inc $3c
$13:9eb5  29 b4         and #$b4
$13:9eb7  0b            phd
$13:9eb8  e4 51         cpx $51
$13:9eba  22 e0 7c 44   jsl $447ce0
$13:9ebe  c1 01         cmp ($01,x)
$13:9ec0  93 90         sta ($90,s),y
$13:9ec2  04 4a         tsb $4a
$13:9ec4  06 80         asl $80
$13:9ec6  23 89         and $89,s
$13:9ec8  b4 89         ldy $89,x
$13:9eca  c2 6d         rep #$6d
$13:9ecc  22 e0 89 41   jsl $4189e0
$13:9ed0  b8            clv
$13:9ed1  03 90         ora $90,s
$13:9ed3  ef 09 82 13   sbc $138209
$13:9ed7  1f 97 c2 7e   ora $7ec297,x
$13:9edb  62 50 84      per $232e
$13:9ede  48            pha
$13:9edf  25 b0         and $b0
$13:9ee1  bf 8b bc 20   lda $20bc8b,x
$13:9ee5  71 d9         adc ($d9),y
$13:9ee7  04 40         tsb $40
$13:9ee9  6a            ror a
$13:9eea  09 81 15      ora #$1581
$13:9eed  85 90         sta $90
$13:9eef  4c 11 38      jmp $3811
$13:9ef2  ac c2 11      ldy $11c2
$13:9ef5  66 13         ror $13
$13:9ef7  04 6e         tsb $6e
$13:9ef9  1a            inc a
$13:9efa  a9 0b 38      lda #$380b
$13:9efd  98            tya
$13:9efe  24 70         bit $70
$13:9f00  55 48         eor $48,x
$13:9f02  5a            phy
$13:9f03  16 64         asl $64,x
$13:9f05  39 0a c2      and $c20a,y
$13:9f08  cc a4 11      cpy $11a4
$13:9f0b  8a            txa
$13:9f0c  42 78         wdm #$78
$13:9f0e  a2 12 0d      ldx #$0d12
$13:9f11  00 2c         brk #$2c
$13:9f13  1e 20 cc      asl $cc20,x
$13:9f16  0d 0a b0      ora $b00a
$13:9f19  90 a1         bcc $9ebc
$13:9f1b  a3 67         lda $67,s
$13:9f1d  90 a8         bcc $9ec7
$13:9f1f  30 2f         bmi $9f50
$13:9f21  62 15 06      per $a539
$13:9f24  08            php
$13:9f25  4c 10 39      jmp $3910
$13:9f28  2c 22 61      bit $6122
$13:9f2b  90 05         bcc $9f32
$13:9f2d  84 40         sty $40
$13:9f2f  6e 11 8d      ror $8d11
$13:9f32  e8            inx
$13:9f33  9c 41 a1      stz $a141
$13:9f36  20 df a7      jsr $a7df
$13:9f39  82 31 08      brl $a76d
$13:9f3c  84 c9         sty $c9
$13:9f3e  f3 c9         sbc ($c9,s),y
$13:9f40  e0 7d 08      cpx #$087d
$13:9f43  cc 20 90      cpy $9020
$13:9f46  18            clc
$13:9f47  0c 7e 1d      tsb $1d7e
$13:9f4a  22 e2 25 c1   jsl $c125e2
$13:9f4e  a2 09 b0      ldx #$b009
$13:9f51  a2 b9 09      ldx #$09b9
$13:9f54  36 14         rol $14,x
$13:9f56  64 f0         stz $f0
$13:9f58  47 e0         eor [$e0]
$13:9f5a  21 21         and ($21,x)
$13:9f5c  4f 03 f0 01   eor $01f003
$13:9f60  61 9c         adc ($9c,x)
$13:9f62  52 84         eor ($84)
$13:9f64  1e 43 00      asl $0043,x
$13:9f67  9c 43 a0      stz $a043
$13:9f6a  90 09         bcc $9f75
$13:9f6c  0c 1c 6a      tsb $6a1c
$13:9f6f  34 47         bit $47,x
$13:9f71  98            tya
$13:9f72  b8            clv
$13:9f73  43 1a         eor $1a,s
$13:9f75  91 08         sta ($08),y
$13:9f77  04 a2         tsb $a2
$13:9f79  01 42         ora ($42,x)
$13:9f7b  52 80         eor ($80)
$13:9f7d  24 1c         bit $1c
$13:9f7f  21 00         and ($00,x)
$13:9f81  94 81         sty $81,x
$13:9f83  ce 54 0d      dec $0d54
$13:9f86  08            php
$13:9f87  03 d4         ora $d4,s
$13:9f89  25 51         and $51
$13:9f8b  0e ea 94      asl $94ea
$13:9f8e  24 e1         bit $e1
$13:9f90  00 8d         brk #$8d
$13:9f92  f9 4c 45      sbc $454c,y
$13:9f95  27 89         and [$89]
$13:9f97  fd 4c 45      sbc $454c,x
$13:9f9a  2f 85 fd 14   and $14fd85
$13:9f9e  a1 1f         lda ($1f,x)
$13:9fa0  84 cb         sty $cb
$13:9fa2  a1 9f         lda ($9f,x)
$13:9fa4  33 11         and ($11,s),y
$13:9fa6  4d e0 7f      eor $7fe0
$13:9fa9  23 b9         and $b9,s
$13:9fab  20 83 e2      jsr $e283
$13:9fae  9e 00 80      stz $8000,x
$13:9fb1  43 e4         eor $e4,s
$13:9fb3  61 40         adc ($40,x)
$13:9fb5  64 04         stz $04
$13:9fb7  9c cc 29      stz $29cc
$13:9fba  32 36         and ($36)
$13:9fbc  8a            txa
$13:9fbd  4c 8e 82      jmp $828e
$13:9fc0  93 24         sta ($24,s),y
$13:9fc2  10 a4         bpl $9f68
$13:9fc4  c2 31         rep #$31
$13:9fc6  10 2f         bpl $9ff7
$13:9fc8  87 78         sta [$78]
$13:9fca  62 10 98      per $37dd
$13:9fcd  f9 d0 3e      sbc $3ed0,y
$13:9fd0  69 30 84      adc #$8430
$13:9fd3  48            pha
$13:9fd4  0e 81 f1      asl $f181
$13:9fd7  0a            asl a
$13:9fd8  84 0e         sty $0e
$13:9fda  3b            tsc
$13:9fdb  22 88 51 11   jsl $115188
$13:9fdf  80 c6         bra $9fa7
$13:9fe1  09 94 02      ora #$0294
$13:9fe4  c8            iny
$13:9fe5  31 08         and ($08),y
$13:9fe7  9c 56 65      stz $6556
$13:9fea  08            php
$13:9feb  b3 0c         lda ($0c,s),y
$13:9fed  42 37         wdm #$37
$13:9fef  0d 6b 05      ora $056b
$13:9ff2  9c 62 12      stz $1262
$13:9ff5  38            sec
$13:9ff6  2b            pld
$13:9ff7  58            cli
$13:9ff8  2d 0e 02      and $020e
$13:9ffb  2f 85 61 c0   and $c06185
$13:9fff  52 28         eor ($28)
$13:a001  c5 21         cmp $21
$13:a003  18            clc
$13:a004  11 e8         ora ($e8),y
$13:a006  14 46         trb $46
$13:a008  43 a0         eor $a0,s
$13:a00a  0a            asl a
$13:a00b  84 5a         sty $5a
$13:a00d  14 f9         trb $f9
$13:a00f  0d 0a 4c      ora $4c0a
$13:a012  21 d1         and ($d1,x)
$13:a014  a8            tay
$13:a015  8c a7 46      sty $46a7
$13:a018  fc 28 0c      jsr ($0c28,x)
$13:a01b  c7 02         cmp [$02]
$13:a01d  c4 08         cpy $08
$13:a01f  74 48         stz $48,x
$13:a021  1c 18 24      trb $2418
$13:a024  98            tya
$13:a025  49 a0 50      eor #$50a0
$13:a028  a9 86 41      lda #$4186
$13:a02b  88            dey
$13:a02c  04 10         tsb $10
$13:a02e  8d 46 37      sta $3746
$13:a031  a8            tay
$13:a032  c0 8d bc      cpy #$bc8d
$13:a035  42 21         wdm #$21
$13:a037  47 46         eor [$46]
$13:a039  04 2e         tsb $2e
$13:a03b  2a            rol a
$13:a03c  c8            iny
$13:a03d  0a            asl a
$13:a03e  29 30 17      and #$1730
$13:a041  e1 1a         sbc ($1a,x)
$13:a043  90 6f         bcc $a0b4
$13:a045  11 80         ora ($80),y
$13:a047  4f 02 c0 d1   eor $d1c002
$13:a04b  20 30 88      jsr $8830
$13:a04e  c4 2a         cpy $2a
$13:a050  51 9c         eor ($9c),y
$13:a052  5b            tcd
$13:a053  01 74         ora ($74,x)
$13:a055  20 53 8c      jsr $8c53
$13:a058  6a            ror a
$13:a059  30 23         bmi $a07e
$13:a05b  f0 14         beq $a071
$13:a05d  80 ad         bra $a00c
$13:a05f  81 62         sta ($62,x)
$13:a061  04 d0         tsb $d0
$13:a063  c7 23         cmp [$23]
$13:a065  02 31         cop #$31
$13:a067  08            php
$13:a068  23 06         and $06,s
$13:a06a  79 6c 10      adc $106c,y
$13:a06d  79 0c 02      adc $020c,y
$13:a070  75 0e         adc $0e,x
$13:a072  82 40 24      brl $c4b5
$13:a075  30 73         bmi $a0ea
$13:a077  48            pha
$13:a078  d1 21         cmp ($21),y
$13:a07a  10 09         bpl $a085
$13:a07c  44 01 26      mvp $26,$01
$13:a07f  0b            phd
$13:a080  60            rts
$13:a081  1e 84 c0      asl $c084,x
$13:a084  ea            nop
$13:a085  30 13         bmi $a09a
$13:a087  d8            cld
$13:a088  42 25         wdm #$25
$13:a08a  11 d3         ora ($d3),y
$13:a08c  60            rts
$13:a08d  12 c2         ora ($c2)
$13:a08f  51 10         eor ($10),y
$13:a091  ee b8 02      inc $02b8
$13:a094  4e f6 08      lsr $08f6
$13:a097  d7 95         cmp [$95],y
$13:a099  1e 52 68      asl $6852,x
$13:a09c  97 d5         sta [$d5],y
$13:a09e  1e 52 e8      asl $e852,x
$13:a0a1  57 d1         eor [$d1],y
$13:a0a3  c0 11 f8      cpy #$f811
$13:a0a6  4a            lsr a
$13:a0a7  84 3e         sty $3e
$13:a0a9  68            pla
$13:a0aa  f2 9b         sbc ($9b)
$13:a0ac  40            rti
$13:a0ad  be 4a 42      ldx $424a,y
$13:a0b0  57 87         eor [$87],y
$13:a0b2  c4 76         cpy $76
$13:a0b4  05 10         ora $10
$13:a0b6  87 48         sta [$48]
$13:a0b8  b8            clv
$13:a0b9  81 80         sta ($80,x)
$13:a0bb  80 c9         bra $a086
$13:a0bd  d2 62         cmp ($62)
$13:a0bf  c0 24 d0      cpy #$d024
$13:a0c2  b0 09         bcs $a0cd
$13:a0c4  42 2c         wdm #$2c
$13:a0c6  02 57         cop #$57
$13:a0c8  88            dey
$13:a0c9  60            rts
$13:a0ca  0b            phd
$13:a0cb  20 8c 0e      jsr $0e8c
$13:a0ce  f1 e8         sbc ($e8),y
$13:a0d0  21 31         and ($31,x)
$13:a0d2  f9 7c 27      sbc $277c,y
$13:a0d5  e6 18         inc $18
$13:a0d7  01 b0         ora ($b0,x)
$13:a0d9  4b            phk
$13:a0da  61 7f         adc ($7f,x)
$13:a0dc  10 50         bpl $a12e
$13:a0de  40            rti
$13:a0df  e3 b2         sbc $b2,s
$13:a0e1  08            php
$13:a0e2  85 10         sta $10
$13:a0e4  76 0f         ror $0f,x
$13:a0e6  30 3f         bmi $a127
$13:a0e8  05 90         ora $90
$13:a0ea  f4 11 38      pea $3811
$13:a0ed  ac c2 11      ldy $11c2
$13:a0f0  66 3d         ror $3d
$13:a0f2  04 6e         tsb $6e
$13:a0f4  1a            inc a
$13:a0f5  03 0b         ora $0b,s
$13:a0f7  39 e8 24      and $24e8,y
$13:a0fa  70 50         bvs $a14c
$13:a0fc  18            clc
$13:a0fd  5a            phy
$13:a0fe  01 a4         ora ($a4,x)
$13:a100  e0 0a c0      cpx #$c00a
$13:a103  34 a4         bit $a4,x
$13:a105  11 8a         ora ($8a),y
$13:a107  40            rti
$13:a108  ec 23 d0      cpx $d023
$13:a10b  28            plp
$13:a10c  84 83         sty $83
$13:a10e  40            rti
$13:a10f  f1 08         sbc ($08),y
$13:a111  b4 28         ldy $28,x
$13:a113  4c 1a 16      jmp $161a
$13:a116  e0 43 a3      cpx #$a343
$13:a119  4d f0 d1      eor $d1f0
$13:a11c  8a            txa
$13:a11d  48            pha
$13:a11e  fa            plx
$13:a11f  18            clc
$13:a120  17 88         ora [$88],y
$13:a122  43 a2         eor $a2,s
$13:a124  47 d0         eor [$d0]
$13:a126  c1 37         cmp ($37,x)
$13:a128  02 4d         cop #$4d
$13:a12a  02 84         cop #$84
$13:a12c  4c 32 0f      jmp $0f32
$13:a12f  10 88         bpl $a0b9
$13:a131  22 82 31 bd   jsl $bd3182
$13:a135  11 04         ora ($04),y
$13:a137  6c 3c 11      jmp ($113c)
$13:a13a  0a            asl a
$13:a13b  38            sec
$13:a13c  88            dey
$13:a13d  21 71         and ($71,x)
$13:a13f  57 a8         eor [$a8],y
$13:a141  51 4f         eor ($4f),y
$13:a143  40            rti
$13:a144  ec 08 c4      cpx $c408
$13:a147  83 78         sta $78,s
$13:a149  22 03 e0 21   jsl $21e003
$13:a14d  46 89         lsr $89
$13:a14f  01 84         ora ($84,x)
$13:a151  46 21         lsr $21
$13:a153  32 7c         and ($7c)
$13:a155  e0 88 23      cpx #$2388
$13:a158  e3 f0         sbc $f0,s
$13:a15a  5f 00 88 23   eor $238800,x
$13:a15e  10 83         bpl $a0e3
$13:a160  60            rts
$13:a161  67 96         adc [$96]
$13:a163  41 07         eor ($07,x)
$13:a165  90 c0         bcc $a127
$13:a167  27 10         and [$10]
$13:a169  e8            inx
$13:a16a  24 02         bit $02
$13:a16c  43 07         eor $07,s
$13:a16e  44 09 bc      mvp $bc,$09
$13:a171  09 c0 42      ora #$42c0
$13:a174  0c 68 c4      tsb $c468
$13:a177  20 12 88      jsr $8812
$13:a17a  05 05         ora $05
$13:a17c  64 10         stz $10
$13:a17e  03 50         ora $50,s
$13:a180  3f 02 44 22   and $224402,x
$13:a184  09 33 ac      ora #$ac33
$13:a187  25 26         and $26
$13:a189  e1 92         sbc ($92,x)
$13:a18b  c0 61 e7      cpy #$e761
$13:a18e  b1 80         lda ($80),y
$13:a190  4b            phk
$13:a191  4e e1 1a      lsr $1ae1
$13:a194  f2 ad         sbc ($ad)
$13:a196  4a            lsr a
$13:a197  4f 12 fa ad   eor $adfa12
$13:a19b  4a            lsr a
$13:a19c  5f 0a fa 01   eor $01fa0a,x
$13:a1a0  82 4b 09      brl $aaee
$13:a1a3  63 87         adc $87,s
$13:a1a5  cd 6a 53      cmp $536a
$13:a1a8  78            sei
$13:a1a9  17 c9         ora [$c9],y
$13:a1ab  94 4d         sty $4d,x
$13:a1ad  50 f8         bvc $a1a7
$13:a1af  9d 86 0f      sta $0f86,x
$13:a1b2  31 52         and ($52),y
$13:a1b4  80 a4         bra $a15a
$13:a1b6  21 f1         and ($f1,x)
$13:a1b8  77 18         adc [$18],y
$13:a1ba  49 05 20      eor #$2005
$13:a1bd  46 08         lsr $08
$13:a1bf  ec 53 ce      cpx $ce53
$13:a1c2  45 08         eor $08
$13:a1c4  04 ba         tsb $ba
$13:a1c6  5b            tcd
$13:a1c7  0c da 11      tsb $11da
$13:a1ca  42 11         wdm #$11
$13:a1cc  26 7c         rol $7c
$13:a1ce  06 cd         asl $cd
$13:a1d0  f6 53         inc $53,x
$13:a1d2  58            cli
$13:a1d3  27 b9         and [$b9]
$13:a1d5  e8            inx
$13:a1d6  40            rti
$13:a1d7  60            rts
$13:a1d8  f7 8a         sbc [$8a],y
$13:a1da  42 13         wdm #$13
$13:a1dc  1d 88 89      ora $8988,x
$13:a1df  c0 a6 11      cpy #$11a6
$13:a1e2  18            clc
$13:a1e3  a8            tay
$13:a1e4  50 34         bvc $a21a
$13:a1e6  26 10         rol $10
$13:a1e8  90 c3         bcc $a1ad
$13:a1ea  62 23 50      per $f210
$13:a1ed  29 84 66      and #$6684
$13:a1f0  1b            tcs
$13:a1f1  01 98         ora ($98,x)
$13:a1f3  60            rts
$13:a1f4  82 e4 29      brl $cbdb
$13:a1f7  0c 09 4c      tsb $4c09
$13:a1fa  22 d1 09 0c   jsl $0c09d1
$13:a1fe  43 9a         eor $9a,s
$13:a200  33 20         and ($20,s),y
$13:a202  a0 6b 4c      ldy #$4c6b
$13:a205  21 26         and ($26,x)
$13:a207  84 46         sty $46
$13:a209  64 1b         stz $1b
$13:a20b  f1 28         sbc ($28),y
$13:a20d  47 a1         eor [$a1]
$13:a20f  10 94         bpl $a1a5
$13:a211  11 45         ora ($45),y
$13:a213  a3 10         lda $10,s
$13:a215  19 c2 60      ora $60c2,y
$13:a218  20 11 e8      jsr $e811
$13:a21b  81 4c         sta ($4c,x)
$13:a21d  31 c2         and ($c2),y
$13:a21f  50 74         bvc $a295
$13:a221  00 dc         brk #$dc
$13:a223  20 81 00      jsr $0081
$13:a226  70 80         bvs $a1a8
$13:a228  dc 20 40      jml [$4020]
$13:a22b  20 8d 45      jsr $458d
$13:a22e  21 33         and ($33,x)
$13:a230  0c e8 94      tsb $94e8
$13:a233  20 d2 05      jsr $05d2
$13:a236  58            cli
$13:a237  a2 c0 16      ldx #$16c0
$13:a23a  11 59         ora ($59),y
$13:a23c  27 60         and [$60]
$13:a23e  20 10 88      jsr $8810
$13:a241  f4 56 39      pea $3956
$13:a244  d6 01         dec $01,x
$13:a246  04 36         tsb $36
$13:a248  43 00         eor $00,s
$13:a24a  9c c3 8f      stz $8fc3
$13:a24d  21 27         and ($27,x)
$13:a24f  83 a2         sta $a2,s
$13:a251  c6 89         dec $89
$13:a253  2b            pld
$13:a254  80 4a         bra $a2a0
$13:a256  20 14 22      jsr $2214
$13:a259  b0 40         bcs $a29b
$13:a25b  24 10         bit $10
$13:a25d  09 83 90      ora #$9083
$13:a260  04 a1         tsb $a1
$13:a262  43 80         eor $80,s
$13:a264  42 4e         wdm #$4e
$13:a266  e1 44         sbc ($44,x)
$13:a268  80 52         bra $a2bc
$13:a26a  a0 32 08      ldy #$0832
$13:a26d  d7 94         cmp [$94],y
$13:a26f  ac 0a c0      ldy $c00a
$13:a272  94 44         sty $44,x
$13:a274  be ab 12      ldx $12ab,y
$13:a277  98            tya
$13:a278  42 be         wdm #$be
$13:a27a  85 60         sta $60
$13:a27c  a1 1b         lda ($1b,x)
$13:a27e  c2 15         rep #$15
$13:a280  f3 58         sbc ($58,s),y
$13:a282  94 e2         sty $e2,x
$13:a284  05 f2         ora $f2
$13:a286  5f 93 28 3e   eor $3e2893,x
$13:a28a  22 50 9e 41   jsl $419e50
$13:a28e  e6 4a         inc $4a
$13:a290  10 32         bpl $a2c4
$13:a292  04 b2         tsb $b2
$13:a294  2e d8 09      rol $09d8
$13:a297  20 08 22      jsr $2208
$13:a29a  13 b8         ora ($b8,s),y
$13:a29c  ec 77 6e      cpx $6e77
$13:a29f  e2 29         sep #$29
$13:a2a1  2c 57 8e      bit $8e57
$13:a2a4  02 1a         cop #$1a
$13:a2a6  1c 92 2d      trb $2d92
$13:a2a9  c8            iny
$13:a2aa  04 8d         tsb $8d
$13:a2ac  2e 4d 14      rol $144d
$13:a2af  e4 99         cpx $99
$13:a2b1  02 67         cop #$67
$13:a2b3  10 91         bpl $a246
$13:a2b5  0e 09 ba      asl $ba09
$13:a2b8  00 20         brk #$20
$13:a2ba  31 8b         and ($8b),y
$13:a2bc  58            cli
$13:a2bd  00 40         brk #$40
$13:a2bf  6a            ror a
$13:a2c0  08            php
$13:a2c1  0d 0a 02      ora $020a
$13:a2c4  01 0e         ora ($0e,x)
$13:a2c6  20 cc 23      jsr $23cc
$13:a2c9  12 b8         ora ($b8)
$13:a2cb  ac 77 4a      ldy $4a77
$13:a2ce  64 09         stz $09
$13:a2d0  34 76         bit $76,x
$13:a2d2  25 20         and $20
$13:a2d4  d0 0e         bne $a2e4
$13:a2d6  80 f8         bra $a2d0
$13:a2d8  02 50         cop #$50
$13:a2da  d0 95         bne $a271
$13:a2dc  82 7d 0d      brl $b05c
$13:a2df  89 4a         bit #$4a
$13:a2e1  34 65         bit $65,x
$13:a2e3  d0 9b         bne $a280
$13:a2e5  43 60         eor $60,s
$13:a2e7  53 0c         eor ($0c,s),y
$13:a2e9  10 a0         bpl $a28b
$13:a2eb  87 41         sta [$41]
$13:a2ed  81 2e         sta ($2e,x)
$13:a2ef  84 ee         sty $ee
$13:a2f1  10 25         bpl $a318
$13:a2f3  0d 71 74      ora $7471
$13:a2f6  24 67         bit $67
$13:a2f8  50 95         bvc $a28f
$13:a2fa  1e 06 51      asl $5106,x
$13:a2fd  23 8a         and $8a,s
$13:a2ff  c9 50         cmp #$50
$13:a301  c1 01         cmp ($01,x)
$13:a303  95 c6         sta $c6,x
$13:a305  04 a1         tsb $a1
$13:a307  ac 4d 84      ldy $844d
$13:a30a  9e 49 14      stz $1449,x
$13:a30d  93 69         sta ($69,s),y
$13:a30f  1f 01 33 8c   ora $8c3301,x
$13:a313  40            rti
$13:a314  a7 18         lda [$18]
$13:a316  d0 d0         bne $a2e8
$13:a318  16 c2         asl $c2,x
$13:a31a  15 28         ora $28,x
$13:a31c  ce 11 08      dec $0811
$13:a31f  e4 19         cpx $19
$13:a321  e7 c0         sbc [$c0]
$13:a323  4e c2 21      lsr $21c2
$13:a326  38            sec
$13:a327  c7 3e         cmp [$3e]
$13:a329  02 55         cop #$55
$13:a32b  21 80         and ($80,x)
$13:a32d  4e a1 c5      lsr $c5a1
$13:a330  20 a2 41      jsr $41a2
$13:a333  e0 33 98      cpx #$9833
$13:a336  75 12         adc $12,x
$13:a338  56 53         lsr $53,x
$13:a33a  04 58         tsb $58
$13:a33c  3e 02 01      rol $0102,x
$13:a33f  20 80 4c      jsr $4c80
$13:a342  20 08 60      jsr $6008
$13:a345  80 d0         bra $a317
$13:a347  e0 10 c9      cpx #$c910
$13:a34a  44 75 2c      mvp $2c,$75
$13:a34d  0b            phd
$13:a34e  a0 91 46      ldy #$4691
$13:a351  bc ac 62      ldy $62ac,x
$13:a354  95 44         sta $44,x
$13:a356  be ac 62      ldx $62ac,y
$13:a359  99 42 be      sta $be42,y
$13:a35c  8c d2 5c      sty $5cd2
$13:a35f  07 cd         ora [$cd]
$13:a361  5a            phy
$13:a362  53 a8         eor ($a8,s),y
$13:a364  17 c9         ora [$c9],y
$13:a366  76 4c         ror $4c,x
$13:a368  60            rts
$13:a369  f8            sed
$13:a36a  86 80         stx $80
$13:a36c  1c 13 48      trb $4813
$13:a36f  04 88         tsb $88
$13:a371  26 00         rol $00
$13:a373  70 6a         bvs $a3df
$13:a375  04 91         tsb $91
$13:a377  e0 11 89      cpx #$8911
$13:a37a  9c 46 57      stz $5746
$13:a37d  fb            xce
$13:a37e  7b            tdc
$13:a37f  84 42         sty $42
$13:a381  76 e2         ror $e2,x
$13:a383  0f e3 78 21   ora $2178e3
$13:a387  14 37         trb $37
$13:a389  10 7f         bpl $a40a
$13:a38b  5b            tcd
$13:a38c  c1 00         cmp ($00,x)
$13:a38e  a5 b8         lda $b8
$13:a390  83 fc         sta $fc,s
$13:a392  13 09         ora ($09,s),y
$13:a394  9c 42 49      stz $4942
$13:a397  10 e6         bpl $a37f
$13:a399  a7 c1         lda [$c1]
$13:a39b  b2 0f         lda ($0f)
$13:a39d  e0 82 3e      cpx #$3e82
$13:a3a0  81 a4         sta ($a4,x)
$13:a3a2  0f e0 81 3e   ora $3e81e0
$13:a3a6  80 54         bra $a3fc
$13:a3a8  11 41         ora ($41),y
$13:a3aa  6a            ror a
$13:a3ab  45 25         eor $25
$13:a3ad  03 53         ora $53,s
$13:a3af  82 0e d0      brl $73c0
$13:a3b2  42 18         wdm #$18
$13:a3b4  12 21         ora ($21)
$13:a3b6  04 c0         tsb $c0
$13:a3b8  94 32         sty $32,x
$13:a3ba  68            pla
$13:a3bb  e8            inx
$13:a3bc  4c 34 09      jmp $0934
$13:a3bf  f0 92         beq $a353
$13:a3c1  47 e1         eor [$e1]
$13:a3c3  12 c2         ora ($c2)
$13:a3c5  88            dey
$13:a3c6  c8            iny
$13:a3c7  25 6e         and $6e
$13:a3c9  20 fd 37      jsr $37fd
$13:a3cc  82 51 23      brl $c720
$13:a3cf  71 07         adc ($07),y
$13:a3d1  e5 f4         sbc $f4
$13:a3d3  14 28         trb $28
$13:a3d5  0c 4a 45      tsb $454a
$13:a3d8  c4 37         cpy $37
$13:a3da  10 bc         bpl $a398
$13:a3dc  35 8c         and $8c,x
$13:a3de  20 99 c6      jsr $c699
$13:a3e1  20 93 8c      jsr $8c93
$13:a3e4  69 f0         adc #$f0
$13:a3e6  8c 00 82      sty $8200
$13:a3e9  02 b0         cop #$b0
$13:a3eb  a8            tay
$13:a3ec  c3 38         cmp $38,s
$13:a3ee  2b            pld
$13:a3ef  25 18         and $18
$13:a3f1  67 98         adc [$98]
$13:a3f3  41 2b         eor ($2b,x)
$13:a3f5  4d 04 f2      eor $f204
$13:a3f8  1c 40 0a      trb $0a40
$13:a3fb  24 1c         bit $1c
$13:a3fd  c0 10 e4      cpy #$e410
$13:a400  08            php
$13:a401  40            rti
$13:a402  24 ec         bit $ec
$13:a404  a0 61 01      ldy #$0161
$13:a407  04 20         tsb $20
$13:a409  13 06         ora ($06,s),y
$13:a40b  a8            tay
$13:a40c  34 02         bit $02,x
$13:a40e  3c ed 09      bit $09ed,x
$13:a411  54 76 88      mvn $88,$76
$13:a414  ed 08 f4      sbc $f408
$13:a417  a6 23         ldx $23
$13:a419  9b            txy
$13:a41a  7d 04 3e      adc $3e04,x
$13:a41d  1f 29 84 e6   ora $e68429,x
$13:a421  5f 41 17 83   eor $831741,x
$13:a425  cc 20 5a      cpy $5a20
$13:a428  82 38 47      brl $eb63
$13:a42b  e0 f0 a9      cpx #$a9f0
$13:a42e  86 7d         stx $7d
$13:a430  92 0b         sta ($0b)
$13:a432  20 89 4a      jsr $4a89
$13:a435  35 eb         and $eb,x
$13:a437  72 8d         adc ($8d)
$13:a439  48            pha
$13:a43a  37 e9         and [$e9],y
$13:a43c  42 87         wdm #$87
$13:a43e  c8            iny
$13:a43f  ca            dex
$13:a440  81 00         sta ($00,x)
$13:a442  93 2c         sta ($2c,s),y
$13:a444  42 37         wdm #$37
$13:a446  e5 66         sbc $66
$13:a448  14 9e         trb $9e
$13:a44a  27 f5         and [$f5]
$13:a44c  66 14         ror $14
$13:a44e  be 17 f4      ldx $f417,y
$13:a451  0b            phd
$13:a452  04 7a         tsb $7a
$13:a454  11 30         ora ($30),y
$13:a456  85 7c         sta $7c
$13:a458  d9 85 37      cmp $3785,y
$13:a45b  81 fc         sta ($fc,x)
$13:a45d  9c 25 38      stz $3825
$13:a460  81 7c         sta ($7c,x)
$13:a462  45 61         eor $61
$13:a464  18            clc
$13:a465  83 4c         sta $4c,s
$13:a467  92 40         sta ($40)
$13:a469  0f 08 44 59   ora $594408
$13:a46d  f4 12 45      pea $4512
$13:a470  48            pha
$13:a471  40            rti
$13:a472  a3 91         lda $91,s
$13:a474  21 b9         and ($b9,x)
$13:a476  42 a2         wdm #$a2
$13:a478  80 80         bra $a3fa
$13:a47a  d0 98         bne $a414
$13:a47c  c2 35         rep #$35
$13:a47e  0c 5d 86      tsb $865d
$13:a481  8c 56 11      sty $1156
$13:a484  28            plp
$13:a485  64 0a         stz $0a
$13:a487  61 82         adc ($82,x)
$13:a489  05 90         ora $90
$13:a48b  74 30         stz $30,x
$13:a48d  27 10         and [$10]
$13:a48f  52 04         eor ($04)
$13:a491  8a            txa
$13:a492  21 cd         and ($cd,x)
$13:a494  38            sec
$13:a495  82 ac 01      brl $a644
$13:a498  01 ae         ora ($ae,x)
$13:a49a  7b            tdc
$13:a49b  10 ac         bpl $a449
$13:a49d  20 4a 90      jsr $904a
$13:a4a0  83 c5         sta $c5,s
$13:a4a2  e3 31         sbc $31,s
$13:a4a4  9b            txy
$13:a4a5  d2 a4         cmp ($a4)
$13:a4a7  1c 41 0a      trb $0a41
$13:a4aa  94 47         sty $47,x
$13:a4ac  60            rts
$13:a4ad  8f e1 15 84   sta $8415e1
$13:a4b1  10 78         bpl $a52b
$13:a4b3  43 20         eor $20,s
$13:a4b5  d6 1e         dec $1e,x
$13:a4b7  02 1f         cop #$1f
$13:a4b9  17 81         ora [$81],y
$13:a4bb  4e 31 a7      lsr $a731
$13:a4be  80 8b         bra $a44b
$13:a4c0  c3 cb         cmp $cb,s
$13:a4c2  81 8e         sta ($8e,x)
$13:a4c4  17 11         ora [$11],y
$13:a4c6  1c 33 cc      trb $cc33
$13:a4c9  50 1f         bvc $a4ea
$13:a4cb  01 1c         ora ($1c,x)
$13:a4cd  33 8e         and ($8e,s),y
$13:a4cf  80 83         bra $a454
$13:a4d1  c7 cb         cmp [$cb]
$13:a4d3  81 0e         sta ($0e,x)
$13:a4d5  82 2c 46      brl $eb04
$13:a4d8  01 3a         ora ($3a,x)
$13:a4da  87 51         sta [$51]
$13:a4dc  0f c1 2a 80   ora $802ac1
$13:a4e0  50 dd         bvc $a4bf
$13:a4e2  01 00         ora ($00,x)
$13:a4e4  90 40         bcc $a526
$13:a4e6  26 0c         rol $0c
$13:a4e8  f0 62         beq $a54c
$13:a4ea  84 84         sty $84
$13:a4ec  c0 11 cc      cpy #$cc11
$13:a4ef  22 a4 23 10   jsl $1023a4
$13:a4f3  99 9b ec      sta $ec9b,y
$13:a4f6  e3 29         sbc $29,s
$13:a4f8  b0 01         bcs $a4fb
$13:a4fa  83 34         sta $34,s
$13:a4fc  20 71 f8      jsr $f871
$13:a4ff  e3 48         sbc $48,s
$13:a501  a0 72 78      ldy #$7872
$13:a504  a3 64         lda $64,s
$13:a506  a0 72 f8      ldy #$f872
$13:a509  63 80         adc $80,s
$13:a50b  a1 73         lda ($73,x)
$13:a50d  08            php
$13:a50e  5b            tcd
$13:a50f  9c a0 73      stz $73a0
$13:a512  78            sei
$13:a513  23 b8         and $b8,s
$13:a515  a1 6c         lda ($6c,x)
$13:a517  50 7a         bvc $a593
$13:a519  8c 0a 3f      sty $3f0a
$13:a51c  13 04         ora ($04,s),y
$13:a51e  9c 5d a6      stz $a65d
$13:a521  01 12         ora ($12,x)
$13:a523  87 c4         sta [$c4]
$13:a525  c2 e4         rep #$e4
$13:a527  d8            cld
$13:a528  08            php
$13:a529  1c c0 4c      trb $4cc0
$13:a52c  31 28         and ($28),y
$13:a52e  7b            tdc
$13:a52f  a0 03 e2      ldy #$e203
$13:a532  49 08 44      eor #$4408
$13:a535  ae 3b 44      ldx $443b
$13:a538  80 c4         bra $a4fe
$13:a53a  62 09 40      per $e546
$13:a53d  c3 10         cmp $10,s
$13:a53f  c6 43         dec $43
$13:a541  0c 93 92      tsb $9293
$13:a544  42 01         wdm #$01
$13:a546  08            php
$13:a547  90 aa         bcc $a4f3
$13:a549  43 30         eor $30,s
$13:a54b  a5 08         lda $08
$13:a54d  0c a2 31      tsb $31a2
$13:a550  23 c4         and $c4,s
$13:a552  8f 02 3d 03   sta $033d02
$13:a556  87 c9         sta [$c9]
$13:a558  38            sec
$13:a559  83 50         sta $50,s
$13:a55b  87 c4         sta [$c4]
$13:a55d  a4 71         ldy $71
$13:a55f  0e 69 98      asl $9869
$13:a562  61 4d         adc ($4d,x)
$13:a564  30 d7         bmi $a53d
$13:a566  1b            tcs
$13:a567  46 34         lsr $34
$13:a569  d3 02         cmp ($02,s),y
$13:a56b  b8            clv
$13:a56c  26 04         rol $04
$13:a56e  40            rti
$13:a56f  10 24         bpl $a595
$13:a571  f1 08         sbc ($08),y
$13:a573  00 a0         brk #$a0
$13:a575  05 90         ora $90
$13:a577  8d 40 cb      sta $cb40
$13:a57a  a7 12         lda [$12]
$13:a57c  21 81         and ($81,x)
$13:a57e  94 45         sty $45,x
$13:a580  81 0b         sta ($0b,x)
$13:a582  39 08 90      and $9008,y
$13:a585  4a            lsr a
$13:a586  20 6c 03      jsr $036c
$13:a589  a8            tay
$13:a58a  48            pha
$13:a58b  a0 93 73      ldy #$7393
$13:a58e  d0 af         bne $a53f
$13:a590  02 01         cop #$01
$13:a592  3b            tsc
$13:a593  40            rti
$13:a594  84 22         sty $22
$13:a596  01 2f         ora ($2f,x)
$13:a598  80 50         bra $a5ea
$13:a59a  51 0b         eor ($0b),y
$13:a59c  23 11         and $11,s
$13:a59e  84 02         sty $02
$13:a5a0  4f 08 94 81   eor $819408
$13:a5a4  82 03 01      brl $a6aa
$13:a5a7  93 43         sta ($43,s),y
$13:a5a9  e4 5c         cpx $5c
$13:a5ab  40            rti
$13:a5ac  70 cb         bvs $a579
$13:a5ae  a3 f1         lda $f1,s
$13:a5b0  af 2a 14 a4   lda $a4142a
$13:a5b4  f1 2f         sbc ($2f),y
$13:a5b6  aa            tax
$13:a5b7  14 a5         trb $a5
$13:a5b9  f0 af         beq $a56a
$13:a5bb  a2 14 a6      ldx #$a614
$13:a5be  f0 2f         beq $a5ef
$13:a5c0  90 38         bcc $a5fa
$13:a5c2  21 32         and ($32,x)
$13:a5c4  64 b8         stz $b8
$13:a5c6  7c d4 24      jmp ($24d4,x)
$13:a5c9  9e 0f 88      stz $880f,x
$13:a5cc  00 21         brk #$21
$13:a5ce  31 e9         and ($e9),y
$13:a5d0  8c 02 48      sty $4802
$13:a5d3  0e 03 60      asl $6003
$13:a5d6  49 62 9f      eor #$9f62
$13:a5d9  86 e8         stx $e8
$13:a5db  1e 81 74      asl $7481,x
$13:a5de  1f 76 e8 1b   ora $1be876,x
$13:a5e2  02 5b         cop #$5b
$13:a5e4  0c fb 2f      tsb $2ffb
$13:a5e7  49 90 1b      eor #$1b90
$13:a5ea  35 e9         and $e9,x
$13:a5ec  4d 60 9e      eor $9e60
$13:a5ef  e6 21         inc $21
$13:a5f1  35 83         and $83,x
$13:a5f3  de 23 08      dec $0823,x
$13:a5f6  cc 39 66      cpy $6639
$13:a5f9  12 20         ora ($20)
$13:a5fb  a8            tay
$13:a5fc  c2 62         rep #$62
$13:a5fe  32 0d         and ($0d)
$13:a600  00 00         brk #$00
$13:a602  22 d1 17 58   jsl $5817d1
$13:a606  68            pla
$13:a607  56 c1         lsr $c1,x
$13:a609  0e 90 c4      asl $c490
$13:a60c  65 1a         adc $1a
$13:a60e  31 c0         and ($c0),y
$13:a610  43 a3         eor $a3,s
$13:a612  30 19         bmi $a62d
$13:a614  86 09         stx $09
$13:a616  dc 40 00      jml [$0040]
$13:a619  c0 8e 02      cpy #$028e
$13:a61c  41 07         eor ($07,x)
$13:a61e  3d 8d 12      and $128d,x
$13:a621  03 1f         ora $1f,s
$13:a623  84 45         sty $45
$13:a625  63 9d         adc $9d,s
$13:a627  62 a0 49      per $efca
$13:a62a  e0 01 50      cpx #$5001
$13:a62d  eb            xba
$13:a62e  95 02         sta $02,x
$13:a630  21 17         and ($17,x)
$13:a632  90 c4         bcc $a5f8
$13:a634  39 a5 40      and $40a5,y
$13:a637  8c 43 dd      sty $dd43
$13:a63a  61 ae         adc ($ae,x)
$13:a63c  2a            rol a
$13:a63d  04 22         tsb $22
$13:a63f  3e eb 0d      rol $0deb,x
$13:a642  61 50         adc ($50,x)
$13:a644  16 20         asl $20,x
$13:a646  23 08         and $08,s
$13:a648  23 b8         and $b8,s
$13:a64a  1c 40 23      trb $2340
$13:a64d  08            php
$13:a64e  12 d8         ora ($d8)
$13:a650  22 11 f8 0c   jsl $0cf811
$13:a654  e3 1a         sbc $1a,s
$13:a656  5b            tcd
$13:a657  08            php
$13:a658  c4 5c         cpy $5c
$13:a65a  8c 18 e1      sty $e118
$13:a65d  69 42 65      adc #$6542
$13:a660  19 c1 31      ora $31c1,y
$13:a663  15 03         ora $03,x
$13:a665  3c 6f 08      bit $086f,x
$13:a668  3c a2 01      bit $01a2,x
$13:a66b  39 87 41      and $4187,y
$13:a66e  20 12 18      jsr $1812
$13:a671  71 88         adc ($88),y
$13:a673  68            pla
$13:a674  90 88         bcc $a5fe
$13:a676  05 2e         ora $2e
$13:a678  01 42         ora ($42,x)
$13:a67a  6c 84 02      jmp ($0284)
$13:a67d  41 00         eor ($00,x)
$13:a67f  98            tya
$13:a680  40            rti
$13:a681  23 e1         and $e1,s
$13:a683  f0 80         beq $a605
$13:a685  50 e1         bvc $a668
$13:a687  20 f0 82      jsr $82f0
$13:a68a  40            rti
$13:a68b  60            rts
$13:a68c  34 28         bit $28,x
$13:a68e  84 8b         sty $8b
$13:a690  88            dey
$13:a691  9a            txs
$13:a692  1a            inc a
$13:a693  54 82 35      mvn $35,$82
$13:a696  e5 44         sbc $44
$13:a698  14 a2         trb $a2
$13:a69a  25 f5         and $f5
$13:a69c  47 94         eor [$94]
$13:a69e  c2 15         rep #$15
$13:a6a0  f4 47 94      pea $9447
$13:a6a3  e2 05         sep #$05
$13:a6a5  f2 5b         sbc ($5b)
$13:a6a7  04 26         tsb $26
$13:a6a9  84 9a         sty $9a
$13:a6ab  0f 9a 90 94   ora $94909a
$13:a6af  21 f1         and ($f1,x)
$13:a6b1  05 04         ora $04
$13:a6b3  26 75         rol $75
$13:a6b5  32 80         and ($80)
$13:a6b7  49 07 63      eor #$6307
$13:a6ba  2a            rol a
$13:a6bb  5b            tcd
$13:a6bc  03 98         ora $98,s
$13:a6be  20 13 b8      jsr $b813
$13:a6c1  84 76         sty $76
$13:a6c3  3b            tsc
$13:a6c4  b7 6c         lda [$6c],y
$13:a6c6  83 08         sta $08,s
$13:a6c8  24 b1         bit $b1
$13:a6ca  5e 39 cc      lsr $cc39,x
$13:a6cd  28            plp
$13:a6ce  70 86         bvs $a656
$13:a6d0  58            cli
$13:a6d1  72 0e         adc ($0e)
$13:a6d3  60            rts
$13:a6d4  6f 09 34 53   adc $533409
$13:a6d8  92 5e         sta ($5e)
$13:a6da  10 88         bpl $a664
$13:a6dc  18            clc
$13:a6dd  c6 03         dec $03
$13:a6df  1e 92 c4      asl $c492,x
$13:a6e2  a4 1a         ldy $1a
$13:a6e4  00 18         brk #$18
$13:a6e6  cb            wai
$13:a6e7  5c e1 a1 21   jml $21a1e1
$13:a6eb  04 3a         tsb $3a
$13:a6ed  7b            tdc
$13:a6ee  12 94         ora ($94)
$13:a6f0  68            pla
$13:a6f1  c1 41         cmp ($41,x)
$13:a6f3  0e 9a c0      asl $c09a
$13:a6f6  a6 18         ldx $18
$13:a6f8  27 51         and [$51]
$13:a6fa  3f 03 02 b9   and $b90203,x
$13:a6fe  08            php
$13:a6ff  fc 92 11      jsr ($1192,x)
$13:a702  2a            rol a
$13:a703  8e d1 0e      stx $0ed1
$13:a706  81 2b         sta ($2b,x)
$13:a708  80 4e         bra $a758
$13:a70a  8d 61 01      sta $0161
$13:a70d  88            dey
$13:a70e  4c e4 51      jmp $51e4
$13:a711  0e 68 b4      asl $b468
$13:a714  67 6e         adc [$6e]
$13:a716  70 19         bvs $a731
$13:a718  8c 62 56      sty $5662
$13:a71b  e7 0d         sbc [$0d]
$13:a71d  70 6c         bvs $a78b
$13:a71f  02 c0         cop #$c0
$13:a721  fc 02 40      jsr ($4002,x)
$13:a724  c2 28         rep #$28
$13:a726  70 a9         bvs $a6d1
$13:a728  81 58         sta ($58,x)
$13:a72a  65 71         adc $71
$13:a72c  88            dey
$13:a72d  ac 77 4a      ldy $4a77
$13:a730  73 09         adc ($09,s),y
$13:a732  24 9e         bit $9e
$13:a734  2b            pld
$13:a735  25 d2         and $d2
$13:a737  06 c1         asl $c1
$13:a739  68            pla
$13:a73a  01 80         ora ($80,x)
$13:a73c  82 2e 48      brl $ef6d
$13:a73f  30 10         bmi $a751
$13:a741  2a            rol a
$13:a742  01 b4         ora ($b4,x)
$13:a744  a8            tay
$13:a745  67 2a         adc [$2a]
$13:a747  85 ca         sta $ca
$13:a749  23 a8         and $a8,s
$13:a74b  12 88         ora ($88)
$13:a74d  a1 92         lda ($92,x)
$13:a74f  42 8d         wdm #$8d
$13:a751  49 4a 51      eor #$514a
$13:a754  26 29         rol $29
$13:a756  b4 9c         ldy $9c,x
$13:a758  a8            tay
$13:a759  91 02         sta ($02),y
$13:a75b  0a            asl a
$13:a75c  a3 44         lda $44,s
$13:a75e  02 c4         cop #$c4
$13:a760  e6 6b         inc $6b
$13:a762  71 80         adc ($80),y
$13:a764  4c e3 11      jmp $11e3
$13:a767  19 57 ed      ora $ed57,y
$13:a76a  8e 4a 40      stx $404a
$13:a76d  fe 33 89      inc $8933,x
$13:a770  48            pha
$13:a771  1f d6 a9 29   ora $29a9d6,x
$13:a775  03 fc         ora $fc,s
$13:a777  1b            tcs
$13:a778  02 70         cop #$70
$13:a77a  27 42         and [$42]
$13:a77c  44 f1 06      mvp $06,$f1
$13:a77f  f0 40         beq $a7c1
$13:a781  e7 0e         sbc [$0e]
$13:a783  21 76         and ($76,x)
$13:a785  04 4e         tsb $4e
$13:a787  40            rti
$13:a788  f0 38         beq $a7c2
$13:a78a  9b            txy
$13:a78b  d9 20 73      cmp $7320,y
$13:a78e  07 f1         ora [$f1]
$13:a790  b7 00         lda [$00],y
$13:a792  0a            asl a
$13:a793  31 e9         and ($e9),y
$13:a795  2b            pld
$13:a796  38            sec
$13:a797  34 0e         bit $0e,x
$13:a799  62 84 4a      per $f220
$13:a79c  e3 a0         sbc $a0,s
$13:a79e  d0 8f         bne $a72f
$13:a7a0  cb            wai
$13:a7a1  15 00         ora $00,x
$13:a7a3  13 08         ora ($08,s),y
$13:a7a5  04 8e         tsb $8e
$13:a7a7  50 a4         bvc $a74d
$13:a7a9  0f c8 c0 25   ora $25c0c8
$13:a7ad  72 05         adc ($05)
$13:a7af  20 7e 85      jsr $857e
$13:a7b2  25 23         and $23
$13:a7b4  88            dey
$13:a7b5  73 4c         adc ($4c,s),y
$13:a7b7  21 08         and ($08,x)
$13:a7b9  9d b3 83      sta $83b3,x
$13:a7bc  58            cli
$13:a7bd  61 08         adc ($08,x)
$13:a7bf  c4 ad         cpy $ad
$13:a7c1  9c 1a e2      stz $e21a
$13:a7c4  29 03 40      and #$4003
$13:a7c7  96 60         stx $60,y
$13:a7c9  d0 29         bne $a7f4
$13:a7cb  00 28         brk #$28
$13:a7cd  5b            tcd
$13:a7ce  81 8d         sta ($8d,x)
$13:a7d0  2c 84 20      bit $2084
$13:a7d3  c8            iny
$13:a7d4  13 0c         ora ($0c,s),y
$13:a7d6  e3 10         sbc $10,s
$13:a7d8  20 12 78      jsr $7812
$13:a7db  05 08         ora $08
$13:a7dd  b2 b1         lda ($b1)
$13:a7df  c3 08         cmp $08,s
$13:a7e1  c7 a1         cmp [$a1]
$13:a7e3  12 a3         ora ($a3)
$13:a7e5  38            sec
$13:a7e6  92 82         sta ($82)
$13:a7e8  1f 23 37 0c   ora $0c3723,x
$13:a7ec  02 4d         cop #$4d
$13:a7ee  1f 8d 9d 44   ora $449d8d,x
$13:a7f2  b0 12         bcs $a806
$13:a7f4  78            sei
$13:a7f5  99 f0 4b      sta $4bf0,y
$13:a7f8  01 2f         ora ($2f,x)
$13:a7fa  85 a0         sta $a0
$13:a7fc  c4 b0         cpy $b0
$13:a7fe  13 78         ora ($78,s),y
$13:a800  1a            inc a
$13:a801  28            plp
$13:a802  61 11         adc ($11,x)
$13:a804  e3 40         sbc $40,s
$13:a806  24 44         bit $44
$13:a808  e8            inx
$13:a809  06 f0         asl $f0
$13:a80b  4c 0c 46      jmp $460c
$13:a80e  1b            tcs
$13:a80f  28            plp
$13:a810  85 66         sta $66
$13:a812  43 c3         eor $c3,s
$13:a814  15 98         ora $98,x
$13:a816  40            rti
$13:a817  b5 01         lda $01,x
$13:a819  71 83         adc ($83),y
$13:a81b  4c 98 22      jmp $2298
$13:a81e  11 08         ora ($08),y
$13:a820  b2 48         lda ($48)
$13:a822  24 8c         bit $8c
$13:a824  31 8f         and ($8f),y
$13:a826  c0 27 4c      cpy #$4c27
$13:a829  91 8e         sta ($8e),y
$13:a82b  c0 62 52      cpy #$5262
$13:a82e  07 60         ora [$60]
$13:a830  c5 61         cmp $61
$13:a832  2a            rol a
$13:a833  70 68         bvs $a89d
$13:a835  04 06         tsb $06
$13:a837  1b            tcs
$13:a838  11 81         ora ($81),y
$13:a83a  37 49         and [$49],y
$13:a83c  58            cli
$13:a83d  0b            phd
$13:a83e  50 72         bvc $a8b2
$13:a840  84 02         sty $02
$13:a842  1b            tcs
$13:a843  19 89 35      ora $3589,y
$13:a846  8a            txa
$13:a847  3d 00 85      and $8500,x
$13:a84a  4a            lsr a
$13:a84b  1e 65 07      asl $0765,x
$13:a84e  81 4e         sta ($4e,x)
$13:a850  1f 40 26 08   ora $082640,x
$13:a854  2c 62 35      bit $3562
$13:a857  7a            ply
$13:a858  24 04         bit $04
$13:a85a  3e 1f 22      rol $221f,x
$13:a85d  07 14         ora [$14]
$13:a85f  1e 2e a7      asl $a72e,x
$13:a862  00 b0         brk #$b0
$13:a864  c5 e0         cmp $e0
$13:a866  ea            nop
$13:a867  70 0e         bvs $a877
$13:a869  8b            phb
$13:a86a  74 16         stz $16,x
$13:a86c  a0 32 14      ldy #$1432
$13:a86f  f0 42         beq $a8b3
$13:a871  87 02         sta [$02]
$13:a873  8f 16 f8 0a   sta $0af816
$13:a877  c5 2e         cmp $2e
$13:a879  0d f0 12      ora $12f0
$13:a87c  04 30         tsb $30
$13:a87e  b0 10         bcs $a890
$13:a880  0a            asl a
$13:a881  19 01 63      ora $6301,y
$13:a884  a4 80         ldy $80
$13:a886  83 47         sta $47,s
$13:a888  21 12         and ($12,x)
$13:a88a  b2 70         lda ($70)
$13:a88c  10 02         bpl $a890
$13:a88e  55 18         eor $18,x
$13:a890  91 e1         sta ($e1),y
$13:a892  08            php
$13:a893  03 2a         ora $2a,s
$13:a895  90 46         bcc $a8dd
$13:a897  f2 84         sbc ($84)
$13:a899  00 82         brk #$82
$13:a89b  c9 64 f1      cmp #$f164
$13:a89e  43 18         eor $18,s
$13:a8a0  8c 42 5f      sty $5f42
$13:a8a3  0c 35 0c      tsb $0c35
$13:a8a6  36 3a         rol $3a,x
$13:a8a8  3a            dec a
$13:a8a9  03 c0         ora $c0,s
$13:a8ab  8c 42 6f      sty $6f42
$13:a8ae  04 38         tsb $38
$13:a8b0  88            dey
$13:a8b1  fc 09 00      jsr ($0009,x)
$13:a8b4  7f 18 6c 56   adc $566c18,x
$13:a8b8  66 9a         ror $9a
$13:a8ba  15 20         ora $20,x
$13:a8bc  41 4a         eor ($4a,x)
$13:a8be  c0 94 19      cpy #$1994
$13:a8c1  14 02         trb $02
$13:a8c3  26 a8         rol $a8
$13:a8c5  28            plp
$13:a8c6  d4 20         pei ($20)
$13:a8c8  c8            iny
$13:a8c9  0b            phd
$13:a8ca  01 89         ora ($89,x)
$13:a8cc  44 20 6b      mvp $6b,$20
$13:a8cf  62 34 81      per $2a06
$13:a8d2  c8            iny
$13:a8d3  17 c3         ora [$c3],y
$13:a8d5  12 8c         ora ($8c)
$13:a8d7  44 d8 84      mvp $84,$d8
$13:a8da  62 08 64      per $0ce5
$13:a8dd  9d 98 32      sta $3298,x
$13:a8e0  38            sec
$13:a8e1  3c 12 6e      bit $6e12,x
$13:a8e4  d3 18         cmp ($18,s),y
$13:a8e6  c4 2a         cpy $2a
$13:a8e8  31 1b         and ($1b),y
$13:a8ea  c3 8a         cmp $8a,s
$13:a8ec  42 51         wdm #$51
$13:a8ee  02 8d         cop #$8d
$13:a8f0  c8            iny
$13:a8f1  31 2e         and ($2e),y
$13:a8f3  20 82 c7      jsr $c782
$13:a8f6  61 f2         adc ($f2,x)
$13:a8f8  4e 20 14      lsr $1420
$13:a8fb  63 49         adc $49,s
$13:a8fd  50 c2         bvc $a8c1
$13:a8ff  8b            phb
$13:a900  ca            dex
$13:a901  3f 1c f2 8f   and $8ff21c,x
$13:a905  4a            lsr a
$13:a906  01 3b         ora ($3b,x)
$13:a908  87 41         sta [$41]
$13:a90a  20 31 48      jsr $4831
$13:a90d  74 8d         stz $8d,x
$13:a90f  c0 50 c8      cpy #$c850
$13:a912  b1 90         lda ($90),y
$13:a914  1d 03 1c      ora $1c03,x
$13:a917  83 19         sta $19,s
$13:a919  01 de         ora ($de,x)
$13:a91b  2b            pld
$13:a91c  d0 39         bne $a957
$13:a91e  03 d8         ora $d8,s
$13:a920  0b            phd
$13:a921  42 bf         wdm #$bf
$13:a923  00 20         brk #$20
$13:a925  95 01         sta $01,x
$13:a927  7e 00 b0      ror $b000,x
$13:a92a  84 26         sty $26
$13:a92c  42 01         wdm #$01
$13:a92e  41 09         eor ($09,x)
$13:a930  2c 90 52      bit $5290
$13:a933  12 78         ora ($78)
$13:a935  0c 7e 35      tsb $357e
$13:a938  e5 79         sbc $79
$13:a93a  94 9e         sty $9e,x
$13:a93c  25 f5         and $f5
$13:a93e  79 94 be      adc $be94,y
$13:a941  15 f4         ora $f4,x
$13:a943  14 84         trb $84
$13:a945  7e 12 05      ror $0512,x
$13:a948  0f 9b cc a6   ora $a6cc9b
$13:a94c  f0 2f         beq $a97d
$13:a94e  90 20         bcc $a970
$13:a950  82 61 f1      brl $9ab4
$13:a953  4c 03 f4      jmp $f403
$13:a956  1e e2 44      asl $44e2,x
$13:a959  07 e8         ora [$e8]
$13:a95b  3f 84 48 40   and $404884,x
$13:a95f  51 12         eor ($12),y
$13:a961  10 4c         bpl $a9af
$13:a963  46 41         lsr $41
$13:a965  09 8f 83      ora #$838f
$13:a968  04 72         tsb $72
$13:a96a  41 a1         eor ($a1,x)
$13:a96c  37 04         and [$04],y
$13:a96e  66 0f         ror $0f
$13:a970  31 2f         and ($2f),y
$13:a972  14 26         trb $26
$13:a974  2e 4b 09      rol $094b
$13:a977  21 b8         and ($b8,x)
$13:a979  20 71 d8      jsr $d871
$13:a97c  8c 83 40      sty $4083
$13:a97f  9f 08 5c 54   sta $545c08,x
$13:a983  b2 1a         lda ($1a)
$13:a985  14 f8         trb $f8
$13:a987  44 e1 b0      mvp $b0,$e1
$13:a98a  19 86 09      ora $0986,y
$13:a98d  30 11         bmi $a9a0
$13:a98f  b8            clv
$13:a990  6c 45 02      jmp ($0245)
$13:a993  09 80 85      ora #$8580
$13:a996  c7 61         cmp [$61]
$13:a998  33 0c         and ($0c,s),y
$13:a99a  89 c4 a0      bit #$a0c4
$13:a99d  33 8c         and ($8c,s),y
$13:a99f  0a            asl a
$13:a9a0  7c 1d a1      jmp ($a11d,x)
$13:a9a3  08            php
$13:a9a4  94 c7         sty $c7,x
$13:a9a6  57 60         eor [$60],y
$13:a9a8  ee 04 18      inc $1804
$13:a9ab  d1 1e         cmp ($1e),y
$13:a9ad  c1 01         cmp ($01,x)
$13:a9af  87 c8         sta [$c8]
$13:a9b1  b8            clv
$13:a9b2  87 f0         sta [$f0]
$13:a9b4  7b            tdc
$13:a9b5  02 44         cop #$44
$13:a9b7  5b            tcd
$13:a9b8  c1 10         cmp ($10,x)
$13:a9ba  88            dey
$13:a9bb  42 65         wdm #$65
$13:a9bd  19 d1 98      ora $98d1,y
$13:a9c0  46 21         lsr $21
$13:a9c2  09 f0 cf      ora #$cff0
$13:a9c5  3b            tsc
$13:a9c6  06 11         asl $11
$13:a9c8  19 90 6f      ora $6f90,y
$13:a9cb  c6 60         dec $60
$13:a9cd  9d 08 cc      sta $cc08,x
$13:a9d0  63 7a         adc $7a,s
$13:a9d2  0f 08 44 82   ora $824408
$13:a9d6  35 1f         and $1f,x
$13:a9d8  de 03 c2      dec $c203,x
$13:a9db  31 10         and ($10),y
$13:a9dd  94 c4         sty $c4,x
$13:a9df  3b            tsc
$13:a9e0  c0 f0 88      cpy #$88f0
$13:a9e3  46 18         lsr $18
$13:a9e5  41 dd         eor ($dd,x)
$13:a9e7  19 81 40      ora $4081,y
$13:a9ea  24 2e         bit $2e
$13:a9ec  31 24         and ($24),y
$13:a9ee  0b            phd
$13:a9ef  40            rti
$13:a9f0  20 49 b2      jsr $b249
$13:a9f3  33 86         and ($86,s),y
$13:a9f5  34 1e         bit $1e,x
$13:a9f7  0d 60 80      ora $8060
$13:a9fa  4e 61 d0      lsr $d061
$13:a9fd  48            pha
$13:a9fe  04 86         tsb $86
$13:aa00  0e e5 1a      asl $1ae5
$13:aa03  24 22         bit $22
$13:aa05  01 28         ora ($28,x)
$13:aa07  80 50         bra $aa59
$13:aa09  41 e0         eor ($e0,x)
$13:aa0b  81 08         sta ($08,x)
$13:aa0d  04 c0         tsb $c0
$13:aa0f  98            tya
$13:aa10  00 f2         brk #$f2
$13:aa12  10 8b         bpl $a99f
$13:aa14  f4 85 02      pea $0285
$13:aa17  fd 21 78      sbc $7821,x
$13:aa1a  bf 42 3f 09   lda $093f42,x
$13:aa1e  1e 8b f4      asl $f48b,x
$13:aa21  86 c2         stx $c2
$13:aa23  12 22         ora ($22)
$13:aa25  20 bf 40      jsr $40bf
$13:aa28  0e 00 11      asl $1100
$13:aa2b  20 00 1c      jsr $1c00
$13:aa2e  01 02         ora ($02,x)
$13:aa30  2e 20 78      rol $7820
$13:aa33  8b            phb
$13:aa34  88            dey
$13:aa35  3a            dec a
$13:aa36  22 e0 84 c7   jsl $c784e0
$13:aa3a  c2 c2         rep #$c2
$13:aa3c  43 21         eor $21,s
$13:aa3e  20 b4 ca      jsr $cab4
$13:aa41  62 fb 06      per $b13f
$13:aa44  98            tya
$13:aa45  33 80         and ($80,s),y
$13:aa47  aa            tax
$13:aa48  12 42         ora ($42)
$13:aa4a  18            clc
$13:aa4b  2a            rol a
$13:aa4c  d1 7f         cmp ($7f),y
$13:aa4e  aa            tax
$13:aa4f  a0 85 c9      ldy #$c985
$13:aa52  bb            tyx
$13:aa53  2b            pld
$13:aa54  02 3c         cop #$3c
$13:aa56  07 6d         ora [$6d]
$13:aa58  44 10 88      mvp $88,$10
$13:aa5b  c4 0e         cpy $0e
$13:aa5d  5d ca 58      eor $58ca,x
$13:aa60  12 18         ora ($18)
$13:aa62  39 67 42      and $4267,y
$13:aa65  84 4a         sty $4a
$13:aa67  63 b0         adc $b0,s
$13:aa69  48            pha
$13:aa6a  0b            phd
$13:aa6b  e0 12 83      cpx #$8312
$13:aa6e  44 58 8c      mvp $8c,$58
$13:aa71  46 41         lsr $41
$13:aa73  ad 5b 91      lda $915b
$13:aa76  8c 17 a1      sty $a117
$13:aa79  01 88         ora ($88,x)
$13:aa7b  c3 db         cmp $db,s
$13:aa7d  c5 01         cmp $01
$13:aa7f  8c 42 21      sty $2142
$13:aa82  32 8c         and ($8c)
$13:aa84  f1 ec         sbc ($ec),y
$13:aa86  9a            txs
$13:aa87  01 cd         ora ($cd,x)
$13:aa89  3d 81 68      and $6881,x
$13:aa8c  1a            inc a
$13:aa8d  e1 04         sbc ($04,x)
$13:aa8f  28            plp
$13:aa90  92 f8         sta ($f8)
$13:aa92  20 45 80      jsr $8045
$13:aa95  8f c0 61 f2   sta $f261c0
$13:aa99  2e 21 ec      rol $ec21
$13:aa9c  00 00         brk #$00
$13:aa9e  d3 12         cmp ($12,s),y
$13:aaa0  18            clc
$13:aaa1  32 c2         and ($c2)
$13:aaa3  01 39         ora ($39,x)
$13:aaa5  87 41         sta [$41]
$13:aaa7  20 12 18      jsr $1812
$13:aaaa  3b            tsc
$13:aaab  84 68         sty $68
$13:aaad  90 88         bcc $aa37
$13:aaaf  04 a2         tsb $a2
$13:aab1  01 42         ora ($42,x)
$13:aab3  10 01         bpl $aab6
$13:aab5  80 20         bra $aad7
$13:aab7  13 08         ora ($08,s),y
$13:aab9  04 8c         tsb $8c
$13:aabb  32 52         and ($52)
$13:aabd  01 60         ora ($60,x)
$13:aabf  06 4a         asl $4a
$13:aac1  50 33         bvc $aaf6
$13:aac3  00 c9         brk #$c9
$13:aac5  4c 07 40      jmp $4007
$13:aac8  20 20 58      jsr $5820
$13:aacb  7c c0 e5      jmp ($e5c0,x)
$13:aace  38            sec
$13:aacf  20 80 38      jsr $3880
$13:aad2  83 21         sta $21,s
$13:aad4  f1 07         sbc ($07),y
$13:aad6  00 f8         brk #$f8
$13:aad8  1f a2 3c 20   ora $203ca2,x
$13:aadc  20 8a 88      jsr $888a
$13:aadf  16 22         asl $22,x
$13:aae1  a2 0c 8b      ldx #$8b0c
$13:aae4  74 21         stz $21,x
$13:aae6  31 f0         and ($f0),y
$13:aae8  90 8f         bcc $aa79
$13:aaea  c8            iny
$13:aaeb  40            rti
$13:aaec  2c 82 99      bit $9982
$13:aaef  40            rti
$13:aaf0  24 4c         bit $4c
$13:aaf2  f0 61         beq $ab55
$13:aaf4  81 44         sta ($44,x)
$13:aaf6  24 8d         bit $8d
$13:aaf8  d0 49         bne $ab43
$13:aafa  84 6a         sty $6a
$13:aafc  41 bf         eor ($bf,x)
$13:aafe  07 04         ora [$04]
$13:ab00  62 21 2a      per $d524
$13:ab03  88            dey
$13:ab04  77 81         adc [$81],y
$13:ab06  c1 10         cmp ($10,x)
$13:ab08  8c 19 83      sty $8319
$13:ab0b  ba            tsx
$13:ab0c  a5 22         lda $22
$13:ab0e  f8            sed
$13:ab0f  2a            rol a
$13:ab10  c5 16         cmp $16
$13:ab12  12 25         ora ($25)
$13:ab14  fa            plx
$13:ab15  1e c1 8e      asl $8ec1,x
$13:ab18  67 b0         adc [$b0]
$13:ab1a  67 0c         adc [$0c]
$13:ab1c  0e 3b 0a      asl $0a3b
$13:ab1f  94 74         sty $74,x
$13:ab21  18            clc
$13:ab22  21 13         and ($13,x)
$13:ab24  86 a4         stx $a4
$13:ab26  03 a4         ora $a4,s
$13:ab28  c1 08         cmp ($08,x)
$13:ab2a  2c 6e 01      bit $016e
$13:ab2d  32 e0         and ($e0)
$13:ab2f  24 ca         bit $ca
$13:ab31  05 30         ora $30
$13:ab33  e1 30         sbc ($30,x)
$13:ab35  41 e6         eor ($e6,x)
$13:ab37  10 99         bpl $aad2
$13:ab39  4c 76 08      jmp $0876
$13:ab3c  fc 02 38      jsr ($3802,x)
$13:ab3f  2b            pld
$13:ab40  42 88         wdm #$88
$13:ab42  d0 13         bne $ab57
$13:ab44  d0 35         bne $ab7b
$13:ab46  4d 74 24      eor $2474
$13:ab49  d0 3c         bne $ab87
$13:ab4b  84 4a         sty $4a
$13:ab4d  41 ad         eor ($ad,x)
$13:ab4f  4d 04 62      eor $6204
$13:ab52  10 90         bpl $aae4
$13:ab54  0c f2 68      tsb $68f2
$13:ab57  20 f1 94      jsr $94f1
$13:ab5a  80 67         bra $abc3
$13:ab5c  01 c1         ora ($c1,x)
$13:ab5e  14 8a         trb $8a
$13:ab60  42 a6         wdm #$a6
$13:ab62  19 d0 70      ora $70d0,y
$13:ab65  41 e4         eor ($e4,x)
$13:ab67  30 19         bmi $ab82
$13:ab69  cc 38 1c      cpy $1c38
$13:ab6c  12 18         ora ($18)
$13:ab6e  3b            tsc
$13:ab6f  90 68         bcc $abd9
$13:ab71  90 88         bcc $aafb
$13:ab73  04 a2         tsb $a2
$13:ab75  01 41         ora ($41,x)
$13:ab77  07 02         ora [$02]
$13:ab79  a8            tay
$13:ab7a  20 13 07      jsr $0713
$13:ab7d  b0 85         bcs $ab04
$13:ab7f  86 3e         stx $3e
$13:ab81  28            plp
$13:ab82  00 a9         brk #$a9
$13:ab84  49 c5 e0      eor #$e0c5
$13:ab87  fc 29 78      jsr ($7829,x)
$13:ab8a  d8            cld
$13:ab8b  0c 41 1f      tsb $1f41
$13:ab8e  84 83         sty $83
$13:ab90  83 e6         sta $e6,s
$13:ab92  fc 29 b8      jsr ($b829,x)
$13:ab95  f4 02 24      pea $2402
$13:ab98  1c 0f 89      trb $890f
$13:ab9b  88            dey
$13:ab9c  00 c0         brk #$c0
$13:ab9e  00 12         brk #$12
$13:aba0  30 01         bmi $aba3
$13:aba2  80 0e         bra $abb2
$13:aba4  22 d2 07 08   jsl $0807d2
$13:aba8  d0 83         bne $ab2d
$13:abaa  82 34 08      brl $b3e1
$13:abad  4c 7c 2a      jmp $2a7c
$13:abb0  24 22         bit $22
$13:abb2  11 8a         ora ($8a),y
$13:abb4  14 a6         trb $a6
$13:abb6  30 09         bmi $abc1
$13:abb8  12 14         ora ($14)
$13:abba  10 00         bpl $abbc
$13:abbc  54 09 22      mvn $22,$09
$13:abbf  14 23         trb $23
$13:abc1  d0 28         bne $abeb
$13:abc3  8c 83 40      sty $4083
$13:abc6  85 08         sta $08
$13:abc8  b4 28         ldy $28,x
$13:abca  c4 1a         cpy $1a
$13:abcc  11 a0         ora ($a0),y
$13:abce  43 a3         eor $a3,s
$13:abd0  51 19         eor ($19),y
$13:abd2  46 8c         lsr $8c
$13:abd4  ca            dex
$13:abd5  50 19         bvc $abf0
$13:abd7  86 04         stx $04
$13:abd9  ca            dex
$13:abda  10 e8         bpl $abc4
$13:abdc  91 dc         sta ($dc),y
$13:abde  30 4c         bmi $ac2c
$13:abe0  42 90         wdm #$90
$13:abe2  c4 39         cpy $39
$13:abe4  a9 a0 63      lda #$63a0
$13:abe7  01 88         ora ($88,x)
$13:abe9  19 42 c6      ora $c642,y
$13:abec  03 b8         ora $b8,s
$13:abee  63 55         adc $55,s
$13:abf0  05 08         ora $08
$13:abf2  56 a2         lsr $a2,x
$13:abf4  68            pla
$13:abf5  56 c5         lsr $c5,x
$13:abf7  0f 5d a2 a0   ora $a0a25d
$13:abfb  4c a1 08      jmp $08a1
$13:abfe  8c 42 5a      sty $5a42
$13:ac01  e5 08         sbc $08
$13:ac03  90 46         bcc $ac4b
$13:ac05  64 1b         stz $1b
$13:ac07  c5 58         cmp $58
$13:ac09  16 41         asl $41,x
$13:ac0b  0a            asl a
$13:ac0c  10 42         bpl $ac50
$13:ac0e  81 21         sta ($21,x)
$13:ac10  42 04         wdm #$04
$13:ac12  34 07         bit $07,x
$13:ac14  10 40         bpl $ac56
$13:ac16  1d 81 04      ora $0481,x
$13:ac19  74 0b         stz $0b,x
$13:ac1b  48            pha
$13:ac1c  5d c3 29      eor $29c3,x
$13:ac1f  79 5c 08      adc $085c,y
$13:ac22  00 90         brk #$90
$13:ac24  20 3a 40      jsr $403a
$13:ac27  81 c9         sta ($c9,x)
$13:ac29  0a            asl a
$13:ac2a  0a            asl a
$13:ac2b  a4 08         ldy $08
$13:ac2d  38            sec
$13:ac2e  90 a1         bcc $abd1
$13:ac30  1a            inc a
$13:ac31  4a            lsr a
$13:ac32  05 49         ora $49
$13:ac34  28            plp
$13:ac35  18            clc
$13:ac36  a4 a0         ldy $a0
$13:ac38  70 92         bvs $abcc
$13:ac3a  81 fa         sta ($fa,x)
$13:ac3c  48            pha
$13:ac3d  08            php
$13:ac3e  c9 20 26      cmp #$2620
$13:ac41  a4 20         ldy $20
$13:ac43  a8            tay
$13:ac44  91 82         sta ($82),y
$13:ac46  d9 b4 42      cmp $42b4,y
$13:ac49  17 26         ora [$26],y
$13:ac4b  ec 99 42      cpx $4299
$13:ac4e  23 10         and $10,s
$13:ac50  28            plp
$13:ac51  07 6c         ora [$6c]
$13:ac53  7c 50 39      jmp ($3950,x)
$13:ac56  77 28         adc [$28],y
$13:ac58  a6 45         ldx $45
$13:ac5a  e0 e5 94      cpx #$94e5
$13:ac5d  c1 ac         cmp ($ac,x)
$13:ac5f  09 a4 59      ora #$59a4
$13:ac62  82 88 91      brl $3ded
$13:ac65  60            rts
$13:ac66  c4 0e         cpy $0e
$13:ac68  6a            ror a
$13:ac69  3c 62 31      bit $3162,x
$13:ac6c  19 06 b4      ora $b406,y
$13:ac6f  fa            plx
$13:ac70  50 19         bvc $ac8b
$13:ac72  86 35         stx $35
$13:ac74  56 10         lsr $10,x
$13:ac76  88            dey
$13:ac77  ca            dex
$13:ac78  d9 24 2b      cmp $2b24,y
$13:ac7b  d2 72         cmp ($72)
$13:ac7d  04 25         tsb $25
$13:ac7f  7a            ply
$13:ac80  1b            tcs
$13:ac81  f6 00         inc $00,x
$13:ac83  1c 02 1f      trb $1f02
$13:ac86  22 e2 14 c2   jsl $c214e2
$13:ac8a  3f 02 52 0b   and $0b5202,x
$13:ac8e  00 08         brk #$08
$13:ac90  00 cb         brk #$cb
$13:ac92  22 30 b2 c2   jsl $c2b230
$13:ac96  08            php
$13:ac97  ce 19 13      dec $1319
$13:ac9a  49 1b a0      eor #$a01b
$13:ac9d  da            phx
$13:ac9e  39 43 81      and $8143,y
$13:aca1  e4 62         cpx $62
$13:aca3  a0 4d 01      ldy #$014d
$13:aca6  b0 92         bcs $ac3a
$13:aca8  61 20         adc ($20,x)
$13:acaa  4b            phk
$13:acab  11 dc         ora ($dc),y
$13:acad  22 11 98 c6   jsl $c69811
$13:acb1  f5 32         sbc $32,x
$13:acb3  28            plp
$13:acb4  d0 4f         bne $ad05
$13:acb6  08            php
$13:acb7  1c 15 00      trb $0015
$13:acba  19 07 a1      ora $a107,y
$13:acbd  07 c5         ora [$c5]
$13:acbf  e8            inx
$13:acc0  42 61         wdm #$61
$13:acc2  68            pla
$13:acc3  04 7e         tsb $7e
$13:acc5  12 34         ora ($34)
$13:acc7  17 a1         ora [$a1],y
$13:acc9  0b            phd
$13:acca  44 12 43      mvp $43,$12
$13:accd  b1 50         lda ($50),y
$13:accf  0c 7d 48      tsb $487d
$13:acd2  4a            lsr a
$13:acd3  e0 93 be      cpx #$be93
$13:acd6  04 4a         tsb $4a
$13:acd8  4f f1 12 90   eor $9012f1
$13:acdc  18            clc
$13:acdd  44 a4 14      mvp $14,$a4
$13:ace0  15 e0         ora $e0,x
$13:ace2  42 63         wdm #$63
$13:ace4  e0 d1 20      cpx #$20d1
$13:ace7  90 6c         bcc $ad55
$13:ace9  57 81         eor [$81],y
$13:aceb  10 8c         bpl $ac79
$13:aced  4a            lsr a
$13:acee  62 1d d6      per $830e
$13:acf1  80 46         bra $ad39
$13:acf3  22 05 30 ef   jsl $ef3005
$13:acf7  2b            pld
$13:acf8  82 13 17      brl $c40e
$13:acfb  5c 92 bc 20   jml $20bc92
$13:acff  eb            xba
$13:ad00  23 33         and $33,s
$13:ad02  04 c6         tsb $c6
$13:ad04  01 22         ora ($22,x)
$13:ad06  5a            phy
$13:ad07  8c 5c de      sty $de5c
$13:ad0a  12 45         ora ($45)
$13:ad0c  a8            tay
$13:ad0d  47 a0         eor [$a0]
$13:ad0f  50 a9         bvc $acba
$13:ad11  3f 41 6a 10   and $106a41,x
$13:ad15  d8            cld
$13:ad16  9c 26 51      stz $5126
$13:ad19  d2 3c         cmp ($3c)
$13:ad1b  94 06         sty $06,x
$13:ad1d  61 c0         adc ($c0,x)
$13:ad1f  5a            phy
$13:ad20  84 3a         sty $3a
$13:ad22  24 8b         bit $8b
$13:ad24  0e 12 d4      asl $d412
$13:ad27  1d 01 11      ora $1101,x
$13:ad2a  90 6b         bcc $ad97
$13:ad2c  55 c1         eor $c1,x
$13:ad2e  0f 88 a2 c3   ora $c3a288
$13:ad32  1a            inc a
$13:ad33  e6 08         inc $08
$13:ad35  44 61 08      mvp $08,$61
$13:ad38  19 c7 30      ora $30c7,y
$13:ad3b  34 c1         bit $c1,x
$13:ad3d  b8            clv
$13:ad3e  34 48         bit $48,x
$13:ad40  0c 62 10      tsb $1062
$13:ad43  84 0c         sty $0c
$13:ad45  f3 98         sbc ($98,s),y
$13:ad47  23 e9         and $e9,s
$13:ad49  d0 11         bne $ad5c
$13:ad4b  83 40         sta $40,s
$13:ad4d  0c e1 00      tsb $00e1
$13:ad50  9c c3 9b      stz $9bc3
$13:ad53  e1 21         sbc ($21,x)
$13:ad55  83 b0         sta $b0,s
$13:ad57  c6 89         dec $89
$13:ad59  08            php
$13:ad5a  80 4a         bra $ada6
$13:ad5c  20 14 17      jsr $1714
$13:ad5f  a0 3b 82      ldy #$823b
$13:ad62  01 30         ora ($30,x)
$13:ad64  6a            ror a
$13:ad65  8c 05 dc      sty $dc05
$13:ad68  2a            rol a
$13:ad69  f0 82         beq $aced
$13:ad6b  2a            rol a
$13:ad6c  d5 5a         cmp $5a,x
$13:ad6e  12 08         ora ($08)
$13:ad70  cc 83 78      cpy $7883
$13:ad73  d4 18         pei ($18)
$13:ad75  43 b4         eor $b4,s
$13:ad77  37 eb         and [$eb],y
$13:ad79  87 09         sta [$09]
$13:ad7b  00 a4         brk #$a4
$13:ad7d  5f c4 30 17   eor $1730c4,x
$13:ad81  f1 0d         sbc ($0d),y
$13:ad83  c5 a8         cmp $a8
$13:ad85  11 f8         ora ($f8),y
$13:ad87  49 14 5f      eor #$5f14
$13:ad8a  c4 3e         cpy $3e
$13:ad8c  10 99         bpl $ad27
$13:ad8e  13 05         ora ($05,s),y
$13:ad90  38            sec
$13:ad91  0f 80 7d 89   ora $897d80
$13:ad95  04 01         tsb $01
$13:ad97  00 02         brk #$02
$13:ad99  11 79         ora ($79),y
$13:ad9b  02 44         cop #$44
$13:ad9d  5e 41 01      lsr $0141,x
$13:ada0  17 90         ora [$90],y
$13:ada2  78            sei
$13:ada3  45 e1         eor $e1
$13:ada5  09 8f 85      ora #$858f
$13:ada8  c4 96         cpy $96
$13:adaa  42 51         wdm #$51
$13:adac  35 f4         and $f4,x
$13:adae  32 28         and ($28)
$13:adb0  99 09 52      sta $5209,y
$13:adb3  70 22         bvs $add7
$13:adb5  90 c4         bcc $ad7b
$13:adb7  c8            iny
$13:adb8  4a            lsr a
$13:adb9  d3 80         cmp ($80,s),y
$13:adbb  69 04 90      adc #$9004
$13:adbe  42 8d         wdm #$8d
$13:adc0  c4 92         cpy $92
$13:adc2  08            php
$13:adc3  5a            phy
$13:adc4  70 12         bvs $add8
$13:adc6  ea            nop
$13:adc7  85 09         sta $09
$13:adc9  0c 43 9a      tsb $9a43
$13:adcc  75 03         adc $03,x
$13:adce  10 23         bpl $adf3
$13:add0  82 08 59      brl $06db
$13:add3  24 70         bit $70
$13:add5  40            rti
$13:add6  8c 01 08      sty $0801
$13:add9  8c 2d 43      sty $432d
$13:addc  38            sec
$13:addd  75 08         adc $08,x
$13:addf  c4 21         cpy $21
$13:ade1  46 19         lsr $19
$13:ade3  e5 ff         sbc $ff
$13:ade5  b4 29         ldy $29,x
$13:ade7  d5 8f         cmp $8f,x
$13:ade9  ff 08 78 85   sbc $857808,x
$13:aded  86 1e         stx $1e
$13:adef  41 f2         eor ($f2,x)
$13:adf1  97 98         sta [$98],y
$13:adf3  ce 01 10      dec $1001
$13:adf6  8c 44 25      sty $2544
$13:adf9  36 a6         rol $a6,x
$13:adfb  10 0f         bpl $ae0c
$13:adfd  00 7a         brk #$7a
$13:adff  16 b3         asl $b3,x
$13:ae01  a8            tay
$13:ae02  28            plp
$13:ae03  42 01         wdm #$01
$13:ae05  31 a4         and ($a4),y
$13:ae07  a9 88 96      lda #$9688
$13:ae0a  14 b4         trb $b4
$13:ae0c  53 a1         eor ($a1,s),y
$13:ae0e  55 a2         eor $a2,x
$13:ae10  32 98         and ($98)
$13:ae12  ec 12 02      cpx $0212
$13:ae15  c4 03         cpy $03
$13:ae17  38            sec
$13:ae18  d1 14         cmp ($14),y
$13:ae1a  18            clc
$13:ae1b  da            phx
$13:ae1c  08            php
$13:ae1d  0c 3e 45      tsb $453e
$13:ae20  c4 23         cpy $23
$13:ae22  83 68         sta $68,s
$13:ae24  10 62         bpl $ae88
$13:ae26  32 22         and ($22)
$13:ae28  c8            iny
$13:ae29  41 05         eor ($05,x)
$13:ae2b  64 59         stz $59
$13:ae2d  08            php
$13:ae2e  10 20         bpl $ae50
$13:ae30  15 f7         ora $f7,x
$13:ae32  fc ff c3      jsr ($c3ff,x)
$13:ae35  20 10 d8      jsr $d810
$13:ae38  07 ef         ora [$ef]
$13:ae3a  ff 10 1d 01   sbc $011d10,x
$13:ae3e  8c 56 e7      sty $e756
$13:ae41  0f 51 02 cc   ora $cc0251
$13:ae45  55 80         eor $80,x
$13:ae47  aa            tax
$13:ae48  05 91         ora $91
$13:ae4a  40            rti
$13:ae4b  9f 40 51 07   sta $075140,x
$13:ae4f  d0 5d         bne $aeae
$13:ae51  a8            tay
$13:ae52  8c c3 bb      sty $bbc3
$13:ae55  d1 16         cmp ($16),y
$13:ae57  00 ae         brk #$ae
$13:ae59  05 77         ora $77
$13:ae5b  af f5 9a 57   lda $579af5
$13:ae5f  65 10         adc $10
$13:ae61  33 8a         and ($8a,s),y
$13:ae63  ee be 36      inc $36be
$13:ae66  fb            xce
$13:ae67  3f 16 f8 04   and $04f816,x
$13:ae6b  4b            phk
$13:ae6c  ea            nop
$13:ae6d  f8            sed
$13:ae6e  e2 70         sep #$70
$13:ae70  0f eb 88 d7   ora $d788eb
$13:ae74  c2 51         rep #$51
$13:ae76  02 88         cop #$88
$13:ae78  5e 46 84      lsr $8446,x
$13:ae7b  39 16 99      and $9916,y
$13:ae7e  c2 2f         rep #$2f
$13:ae80  e0 43 24      cpx #$2443
$13:ae83  03 4c         ora $4c,s
$13:ae85  5c 64 52 45   jml $455264
$13:ae89  f0 8f         beq $ae1a
$13:ae8b  8b            phb
$13:ae8c  e0 34 4f      cpx #$4f34
$13:ae8f  86 10         stx $10
$13:ae91  96 7f         stx $7f,y
$13:ae93  04 28         tsb $28
$13:ae95  0d cb e0      ora $e0cb
$13:ae98  51 f3         eor ($f3),y
$13:ae9a  10 f9         bpl $ae95
$13:ae9c  06 89         asl $89
$13:ae9e  e4 36         cpx $36
$13:aea0  a7 90         lda [$90]
$13:aea2  e8            inx
$13:aea3  9e 43 df      stz $df43,x
$13:aea6  98            tya
$13:aea7  87 74         sta [$74]
$13:aea9  cb            wai
$13:aeaa  38            sec
$13:aeab  46 eb         lsr $eb
$13:aead  04 4b         tsb $4b
$13:aeaf  3d d7 08      and $08d7,x
$13:aeb2  6c 7b aa      jmp ($aa7b)
$13:aeb5  12 9b         ora ($9b)
$13:aeb7  c6 e1         dec $e1
$13:aeb9  c6 1a         dec $1a
$13:aebb  27 18         and [$18]
$13:aebd  da            phx
$13:aebe  9c 63 a2      stz $a263
$13:aec1  71 94         adc ($94),y
$13:aec3  be 62 1d      ldx $1d62,y
$13:aec6  38            sec
$13:aec7  d1 34         cmp ($34),y
$13:aec9  e6 d4         inc $d4
$13:aecb  d3 9d         cmp ($9d,s),y
$13:aecd  13 4e         ora ($4e,s),y
$13:aecf  f9 b8 08      sbc $08b8,y
$13:aed2  bc 4a e3      ldy $e34a,x
$13:aed5  20 5d 08      jsr $085d
$13:aed8  9b            txy
$13:aed9  cb            wai
$13:aeda  a4 3b         ldy $3b
$13:aedc  f9 02 40      sbc $4002,y
$13:aedf  64 07         stz $07
$13:aee1  f3 32         sbc ($32,s),y
$13:aee3  81 94         sta ($94,x)
$13:aee5  17 43         ora [$43],y
$13:aee7  00 8c         brk #$8c
$13:aee9  27 c3         and [$c3]
$13:aeeb  fe 71 38      inc $3871,x
$13:aeee  01 d8         ora ($d8,x)
$13:aef0  00 00         brk #$00
$13:aef2  20 81 c0      jsr $c081
$13:aef5  e0 90 68      cpx #$6890
$13:aef8  4c 3e 17      jmp $173e
$13:aefb  0f 92 4f 28   ora $284f92
$13:aeff  57 eb         eor [$eb],y
$13:af01  4f ff 07 f9   eor $f907ff
$13:af05  81 c0         sta ($c0,x)
$13:af07  20 d0 18      jsr $18d0
$13:af0a  7c 00 06      jmp ($0600,x)
$13:af0d  10 c8         bpl $aed7
$13:af0f  1c 2a 0b      trb $0b2a
$13:af12  01 87         ora ($87,x)
$13:af14  41 ad         eor ($ad,x)
$13:af16  f8            sed
$13:af17  0c 07 02      tsb $0207
$13:af1a  81 60         sta ($60,x)
$13:af1c  90 04         bcc $af22
$13:af1e  c3 40         cmp $40,s
$13:af20  16 0f         asl $0f,x
$13:af22  04 83         tsb $83
$13:af24  c1 88         cmp ($88,x)
$13:af26  9c 60 20      stz $2060
$13:af29  14 0c         trb $0c
$13:af2b  04 83         tsb $83
$13:af2d  80 23         bra $af52
$13:af2f  2d 05 02      and $0205
$13:af32  01 e0         ora ($e0,x)
$13:af34  e0 78 1d      cpx #$1d78
$13:af37  ed 04 86      sbc $8604
$13:af3a  40            rti
$13:af3b  a1 d0         lda ($d0,x)
$13:af3d  98            tya
$13:af3e  fc 0e 72      jsr ($720e,x)
$13:af41  ff d8 78 3e   sbc $3e78d8,x
$13:af45  37 1f         and [$1f],y
$13:af47  89 a7 93      bit #$93a7
$13:af4a  19 24 0f      ora $0f24,y
$13:af4d  d4 63         pei ($63)
$13:af4f  c1 d8         cmp ($d8,x)
$13:af51  f0 40         beq $af93
$13:af53  20 10 58      jsr $5810
$13:af56  24 22         bit $22
$13:af58  11 0a         ora ($0a),y
$13:af5a  85 41         sta $41
$13:af5c  a1 d0         lda ($d0,x)
$13:af5e  78            sei
$13:af5f  fc 0a 5f      jsr ($5f0a,x)
$13:af62  28            plp
$13:af63  b3 9b         lda ($9b,s),y
$13:af65  c2 09         rep #$09
$13:af67  03 84         ora $84,s
$13:af69  41 c1         eor ($c1,x)
$13:af6b  21 0e         and ($0e,x)
$13:af6d  01 0c         ora ($0c,x)
$13:af6f  7e 01 17      ror $1701,x
$13:af72  37 84         and [$84],y
$13:af74  00 22         brk #$22
$13:af76  4e d0 d0      lsr $d0d0
$13:af79  68            pla
$13:af7a  30 1a         bmi $af96
$13:af7c  01 68         ora ($68,x)
$13:af7e  08            php
$13:af7f  c0 de 02      cpy #$02de
$13:af82  12 98         ora ($98)
$13:af84  74 36         stz $36,x
$13:af86  15 01         ora $01,x
$13:af88  48            pha
$13:af89  1b            tcs
$13:af8a  83 86         sta $86,s
$13:af8c  ff 03 84 43   sbc $438403,x
$13:af90  e0 50 f9      cpx #$f950
$13:af93  44 9c ff      mvp $ff,$9c
$13:af96  40            rti
$13:af97  30 46         bmi $afdf
$13:af99  a5 92         lda $92
$13:af9b  48            pha
$13:af9c  ed 0d 96      sbc $960d
$13:af9f  cb            wai
$13:afa0  19 a8 eb      ora $eba8,y
$13:afa3  7c 27 49      jmp ($4927,x)
$13:afa6  e3 94         sbc $94,s
$13:afa8  73 25         adc ($25,s),y
$13:afaa  dc ed 65      jml [$65ed]
$13:afad  7b            tdc
$13:afae  6d 50 f7      adc $f750
$13:afb1  40            rti
$13:afb2  3b            tsc
$13:afb3  e8            inx
$13:afb4  e1 80         sbc ($80,x)
$13:afb6  c0 20 50      cpy #$5020
$13:afb9  08            php
$13:afba  5c 2c 66 0f   jml $0f662c
$13:afbe  40            rti
$13:afbf  82 c2 60      brl $1084
$13:afc2  50 54         bvc $b018
$13:afc4  70 8f         bvs $af55
$13:afc6  c2 0f         rep #$0f
$13:afc8  0b            phd
$13:afc9  82 21 c2      brl $71ed
$13:afcc  19 07 26      ora $2607,y
$13:afcf  84 32         sty $32
$13:afd1  1a            inc a
$13:afd2  6f 0c c4 60   adc $60c40c
$13:afd6  62 19 8c      per $3bf2
$13:afd9  e6 c3         inc $c3
$13:afdb  7d 60 be      adc $be60,x
$13:afde  40            rti
$13:afdf  2f 18 0f 81   and $810f18
$13:afe3  bc 0d 61      ldy $610d,x
$13:afe6  06 fc         asl $fc
$13:afe8  67 2c         adc [$2c]
$13:afea  1b            tcs
$13:afeb  ea            nop
$13:afec  05 f3         ora $f3
$13:afee  00 1c         brk #$1c
$13:aff0  37 87         and [$87],y
$13:aff2  80 7c         bra $b070
$13:aff4  25 5f         and $5f
$13:aff6  80 ff         bra $aff7
$13:aff8  c2 20         rep #$20
$13:affa  10 c2         bpl $afbe
$13:affc  30 41         bmi $b03f
$13:affe  22 d0 08 d4   jsl $d408d0
$13:b002  42 79         wdm #$79
$13:b004  12 9d         ora ($9d)
$13:b006  42 27         wdm #$27
$13:b008  87 01         sta [$01]
$13:b00a  80 43         bra $b04f
$13:b00c  a0 11 68      ldy #$6811
$13:b00f  44 6a 09      mvp $09,$6a
$13:b012  3c 80 4e      bit $4e80,x
$13:b015  a0 08 90      ldy #$9008
$13:b018  57 86         eor [$86],y
$13:b01a  03 21         ora $21,s
$13:b01c  10 8c         bpl $afaa
$13:b01e  44 2b 15      mvp $15,$2b
$13:b021  0f c7 83 d1   ora $d183c7
$13:b025  20 d4 44      jsr $44d4
$13:b028  22 0b f0 c8   jsl $c8f00b
$13:b02c  08            php
$13:b02d  02 01         cop #$01
$13:b02f  58            cli
$13:b030  80 17         bra $b049
$13:b032  83 d1         sta $d1,s
$13:b034  10 d4         bpl $b00a
$13:b036  54 22 16      mvn $16,$22
$13:b039  03 78         ora $78,s
$13:b03b  42 10         wdm #$10
$13:b03d  21 04         and ($04,x)
$13:b03f  86 1d         stx $1d
$13:b041  02 1d         cop #$1d
$13:b043  02 85         cop #$85
$13:b045  40            rti
$13:b046  21 30         and ($30,x)
$13:b048  88            dey
$13:b049  c9 fc a0      cmp #$a0fc
$13:b04c  90 84         bcc $afd2
$13:b04e  18            clc
$13:b04f  20 c2 15      jsr $15c2
$13:b052  04 84         tsb $84
$13:b054  c1 a3         cmp ($a3,x)
$13:b056  30 68         bmi $b0c0
$13:b058  04 82         tsb $82
$13:b05a  01 30         ora ($30,x)
$13:b05c  90 5c         bcc $b0ba
$13:b05e  26 0d         rol $0d
$13:b060  40            rti
$13:b061  98            tya
$13:b062  23 84         and $84,s
$13:b064  80 11         bra $b077
$13:b066  06 80         asl $80
$13:b068  c0 2e 0e      cpy #$0e2e
$13:b06b  21 6c         and ($6c,x)
$13:b06d  2c 02 39      bit $3902
$13:b070  83 ce         sta $ce,s
$13:b072  e1 eb         sbc ($eb,x)
$13:b074  7c 49 ff      jmp ($ff49,x)
$13:b077  04 38         tsb $38
$13:b079  17 4c         ora [$4c],y
$13:b07b  25 f7         and $f7
$13:b07d  0b            phd
$13:b07e  5c c1 d8 bc   jml $bcd8c1
$13:b082  76 0f         ror $0f,x
$13:b084  3c 82 c8      bit $c882,x
$13:b087  40            rti
$13:b088  08            php
$13:b089  39 10 21      and $2110,y
$13:b08c  f0 28         beq $b0b6
$13:b08e  39 08 1f      and $1f08,y
$13:b091  20 9a 0e      jsr $0e9a
$13:b094  c5 02         cmp $02
$13:b096  71 00         adc ($00),y
$13:b098  e1 40         sbc ($40,x)
$13:b09a  b0 d8         bcs $b074
$13:b09c  6c 24 18      jmp ($1824)
$13:b09f  36 19         rol $19,x
$13:b0a1  8c 04 71      sty $7104
$13:b0a4  18            clc
$13:b0a5  3f c8 01 68   and $6801c8,x
$13:b0a9  af 05 b0 77   lda $77b005
$13:b0ad  04 ce         tsb $ce
$13:b0af  49 6e 8d      eor #$8d6e
$13:b0b2  53 a7         eor ($a7,s),y
$13:b0b4  94 a8         sty $a8,x
$13:b0b6  dd 32 c9      cmp $c932,x
$13:b0b9  f3 a7         sbc ($a7,s),y
$13:b0bb  f6 22         inc $22,x
$13:b0bd  9b            txy
$13:b0be  28            plp
$13:b0bf  14 0e         trb $0e
$13:b0c1  33 07         and ($07,s),y
$13:b0c3  98            tya
$13:b0c4  90 82         bcc $b048
$13:b0c6  06 d8         asl $d8
$13:b0c8  08            php
$13:b0c9  44 62 41      mvp $41,$62
$13:b0cc  38            sec
$13:b0cd  a5 de         lda $de
$13:b0cf  6e 99 4c      ror $4c99
$13:b0d2  b6 da         ldx $da,y
$13:b0d4  d5 7a         cmp $7a,x
$13:b0d6  f3 6d         sbc ($6d,s),y
$13:b0d8  bd 52 2a      lda $2a52,x
$13:b0db  96 09         stx $09,y
$13:b0dd  3a            dec a
$13:b0de  09 10 c4      ora #$c410
$13:b0e1  60            rts
$13:b0e2  2d 1c 0d      and $0d1c
$13:b0e5  27 02         and [$02]
$13:b0e7  50 20         bvc $b109
$13:b0e9  3f 77 82 dd   and $dd8277,x
$13:b0ed  e0 9a 5e      cpx #$5e9a
$13:b0f0  e2 37         sep #$37
$13:b0f2  e8            inx
$13:b0f3  1d fe 09      ora $09fe,x
$13:b0f6  7c 3a 84      jmp ($843a,x)
$13:b0f9  5a            phy
$13:b0fa  dd 11 b7      cmp $b711,x
$13:b0fd  c6 6c         dec $6c
$13:b0ff  e0 d0         cpx #$d0
$13:b101  6d 10 34      adc $3410
$13:b104  01 a1         ora ($a1,x)
$13:b106  01 57         ora ($57,x)
$13:b108  80 18         bra $b122
$13:b10a  20 15 ad      jsr $ad15
$13:b10d  d4 df         pei ($df)
$13:b10f  89 d9         bit #$d9
$13:b111  e0 74         cpx #$74
$13:b113  b8            clv
$13:b114  1a            inc a
$13:b115  1f 04 46 e1   ora $e14604,x
$13:b119  90 f8         bcc $b113
$13:b11b  26 c3         rol $c3
$13:b11d  0b            phd
$13:b11e  07 9d         ora [$9d]
$13:b120  c0 27         cpy #$27
$13:b122  ea            nop
$13:b123  21 8f         and ($8f,x)
$13:b125  c0 31         cpy #$31
$13:b127  f0 09         beq $b132
$13:b129  7c 03 9f      jmp ($9f03,x)
$13:b12c  00 a2         brk #$a2
$13:b12e  52 e7         eor ($e7)
$13:b130  b3 eb         lda ($eb,s),y
$13:b132  bd fe c9      lda $c9fe,x
$13:b135  fc aa 7b      jsr ($7baa,x)
$13:b138  22 de e8 8f   jsl $8fe8de
$13:b13c  be 33 e7      ldx $e733,y
$13:b13f  99 c0 28      sta $28c0,y
$13:b142  08            php
$13:b143  2b            pld
$13:b144  af 68 a5 de   lda $dea568
$13:b148  2c 06 02      bit $0206
$13:b14b  41 20         eor ($20,x)
$13:b14d  98            tya
$13:b14e  cc 6a 37      cpy $376a
$13:b151  1e af d7      asl $d7af,x
$13:b154  33 fd         and ($fd,s),y
$13:b156  ce c0 23      dec $23c0
$13:b159  b0 0b         bcs $b166
$13:b15b  fc 03 bf      jsr ($bf03,x)
$13:b15e  00 e7         brk #$e7
$13:b160  40            rti
$13:b161  31 d0         and ($d0),y
$13:b163  09 50         ora #$50
$13:b165  58            cli
$13:b166  20 13 09      jsr $0913
$13:b169  8d 52 af      sta $af52
$13:b16c  b9 df c4      lda $c4df,y
$13:b16f  e7 b0         sbc [$b0]
$13:b171  2a            rol a
$13:b172  ec 8a 79      cpx $798a
$13:b175  24 9c         bit $9c
$13:b177  4d a7 50      eor $50a7
$13:b17a  f8            sed
$13:b17b  74 a6         stz $a6,x
$13:b17d  1d 41 f7      ora $f741,x
$13:b180  70 7c         bvs $b1fe
$13:b182  12 1b         ora ($1b)
$13:b184  04 06         tsb $06
$13:b186  03 03         ora $03,s
$13:b188  81 82         sta ($82,x)
$13:b18a  83 11         sta $11,s
$13:b18c  f8            sed
$13:b18d  aa            tax
$13:b18e  71 3b         adc ($3b),y
$13:b190  dc 6a 9f      jml [$9f6a]
$13:b193  ce 1b c1      dec $c11b
$13:b196  9c c0 6a      stz $6ac0
$13:b199  34 19         bit $19,x
$13:b19b  05 87         ora $87
$13:b19d  c1 00         cmp ($00,x)
$13:b19f  dc 40 27      jml [$2740]
$13:b1a2  10 08         bpl $b1ac
$13:b1a4  64 02         stz $02
$13:b1a6  7d 00 ff      adc $ff00,x
$13:b1a9  60            rts
$13:b1aa  37 d8         and [$d8],y
$13:b1ac  0c f7 01      tsb $01f7
$13:b1af  10 10         bpl $b1c1
$13:b1b1  48            pha
$13:b1b2  3e 23 1f      rol $1f23,x
$13:b1b5  47 a6         eor [$a6]
$13:b1b7  6f f4 12 89   adc $8912f4
$13:b1bb  05 82         ora $82
$13:b1bd  c0 5b         cpy #$5b
$13:b1bf  07 f8         ora [$f8]
$13:b1c1  62 5d 21      per $d321
$13:b1c4  8e c1 f0      stx $f0c1
$13:b1c7  2b            pld
$13:b1c8  fe 0e ff      inc $ff0e,x
$13:b1cb  82 3f 60      brl $120d
$13:b1ce  87 c0         sta [$c0]
$13:b1d0  30 1f         bmi $b1f1
$13:b1d2  c9 46         cmp #$46
$13:b1d4  32 f1         and ($f1)
$13:b1d6  0c a0 51      tsb $51a0
$13:b1d9  31 10         and ($10),y
$13:b1db  c9 44         cmp #$44
$13:b1dd  b2 59         lda ($59)
$13:b1df  3c 94 4f      bit $4f94,x
$13:b1e2  30 10         bmi $b1f4
$13:b1e4  0b            phd
$13:b1e5  84 03         sty $03
$13:b1e7  e0 20         cpx #$20
$13:b1e9  13 18         ora ($18,s),y
$13:b1eb  74 20         stz $20,x
$13:b1ed  1c 48 07      trb $0748
$13:b1f0  62 01 10      per $c1f4
$13:b1f3  9a            txs
$13:b1f4  cd 26 f2      cmp $f226
$13:b1f7  99 5c 2e      sta $2e5c,y
$13:b1fa  57 02         eor [$02],y
$13:b1fc  8d c1 e1      sta $e1c1
$13:b1ff  f0 18         beq $b219
$13:b201  ac 36 3b      ldy $3b36
$13:b204  35 84         and $84,x
$13:b206  4d e1 12      eor $12e1
$13:b209  b8            clv
$13:b20a  a2 0c         ldx #$0c
$13:b20c  23 70         and $70,s
$13:b20e  42 68         wdm #$68
$13:b210  45 60         eor $60
$13:b212  51 d8         eor ($d8),y
$13:b214  15 42         ora $42,x
$13:b216  a1 00         lda ($00,x)
$13:b218  c4 1b         cpy $1b
$13:b21a  02 a1         cop #$a1
$13:b21c  dc e4 73      jml [$73e4]
$13:b21f  32 19         and ($19)
$13:b221  8f 04 e3 c1   sta $c1e304
$13:b225  8a            txa
$13:b226  a8            tay
$13:b227  48            pha
$13:b228  12 43         ora ($43)
$13:b22a  00 ee         brk #$ee
$13:b22c  48            pha
$13:b22d  39 93 0c      and $0c93,y
$13:b230  c5 82         cmp $82
$13:b232  71 c0         adc ($c0),y
$13:b234  c5 5c         cmp $5c
$13:b236  21 48         and ($48,x)
$13:b238  70 8f         bvs $b1c9
$13:b23a  c1 61         cmp ($61,x)
$13:b23c  eb            xba
$13:b23d  40            rti
$13:b23e  3c 84 1a      bit $1a84,x
$13:b241  1d 01 8a      ora $8a01,x
$13:b244  41 23         eor ($23,x)
$13:b246  ab            plb
$13:b247  01 80         ora ($80,x)
$13:b249  13 41         ora ($41,s),y
$13:b24b  86 4b         stx $4b
$13:b24d  a1 81         lda ($81,x)
$13:b24f  c7 60         cmp [$60]
$13:b251  71 0b         adc ($0b),y
$13:b253  c5 43         cmp $43
$13:b255  b1 10         lda ($10),y
$13:b257  cc 50 3a      cpy $3a50
$13:b25a  1a            inc a
$13:b25b  0f a7 93 fd   ora $fd93a7
$13:b25f  b4 9f         ldy $9f,x
$13:b261  44 33 97      mvp $97,$33
$13:b264  83 60         sta $60,s
$13:b266  48            pha
$13:b267  15 21         ora $21,x
$13:b269  d0 90         bne $b1fb
$13:b26b  7d 05 00      adc $0005,x
$13:b26e  26 0e         rol $0e
$13:b270  06 73         asl $73
$13:b272  c1 1e         cmp ($1e,x)
$13:b274  a0 a0         ldy #$a0
$13:b276  c2 b7         rep #$b7
$13:b278  34 93         bit $93,x
$13:b27a  5e ef 70      lsr $70ef,x
$13:b27d  fb            xce
$13:b27e  ac 3e 76      ldy $763e
$13:b281  b7 08         lda [$08],y
$13:b283  03 f8         ora $f8,s
$13:b285  62 10 09      per $bb98
$13:b288  81 80         sta ($80,x)
$13:b28a  40            rti
$13:b28b  eb            xba
$13:b28c  c8            iny
$13:b28d  a5 72         lda $72
$13:b28f  a0 de 49      ldy #$49de
$13:b292  55 fb         eor $fb,x
$13:b294  b1 98         lda ($98),y
$13:b296  fa            plx
$13:b297  6b            rtl
$13:b298  3d 16 0d      and $0d16,x
$13:b29b  01 9c         ora ($9c,x)
$13:b29d  26 80         rol $80
$13:b29f  31 01         and ($01),y
$13:b2a1  03 fc         ora $fc,s
$13:b2a3  a2 13 88      ldx #$8813
$13:b2a6  c4 e0         cpy $e0
$13:b2a8  00 11         brk #$11
$13:b2aa  bb            tyx
$13:b2ab  44 b6 a5      mvp $a5,$b6
$13:b2ae  55 dd         eor $dd,x
$13:b2b0  4b            phk
$13:b2b1  9e c1 0d      stz $0dc1,x
$13:b2b4  7c a4 12      jmp ($12a4,x)
$13:b2b7  18            clc
$13:b2b8  01 cc         ora ($cc,x)
$13:b2ba  26 d3         rol $d3
$13:b2bc  cd 36 fa      cmp $fa36
$13:b2bf  45 ae         eor $ae
$13:b2c1  9c 4c c7      stz $c74c
$13:b2c4  f0 32         beq $b2f8
$13:b2c6  94 ae         sty $ae,x
$13:b2c8  04 22         tsb $22
$13:b2ca  00 61         brk #$61
$13:b2cc  21 3b         and ($3b,x)
$13:b2ce  44 2d f3      mvp $f3,$2d
$13:b2d1  4a            lsr a
$13:b2d2  64 d2         stz $d2
$13:b2d4  19 74 3a      ora $3a74,y
$13:b2d7  0d de 1f      ora $1fde
$13:b2da  38            sec
$13:b2db  82 30 c0      brl $730e
$13:b2de  00 10         brk #$10
$13:b2e0  34 02         bit $02,x
$13:b2e2  9f c8 00 11   sta $1100c8,x
$13:b2e6  5f ad 76 fb   eor $fb76ad,x
$13:b2ea  49 be e5      eor #$e5be
$13:b2ed  b5 59         lda $59,x
$13:b2ef  ed 95 32      sbc $3295
$13:b2f2  d1 d0         cmp ($d0),y
$13:b2f4  d8            cld
$13:b2f5  78            sei
$13:b2f6  20 10 a8      jsr $a810
$13:b2f9  06 09         asl $09
$13:b2fb  40            rti
$13:b2fc  34 05         bit $05,x
$13:b2fe  20 44 32      jsr $3244
$13:b301  13 88         ora ($88,s),y
$13:b303  64 f0         stz $f0
$13:b305  00 3e         brk #$3e
$13:b307  f8            sed
$13:b308  a7 b2         lda [$b2]
$13:b30a  29 6c aa      and #$aa6c
$13:b30d  4b            phk
$13:b30e  2a            rol a
$13:b30f  b2 d7         lda ($d7)
$13:b311  cb            wai
$13:b312  20 52 04      jsr $0452
$13:b315  07 5c         ora [$5c]
$13:b317  df ff 2d fe   cmp $fe2dff,x
$13:b31b  e6 7d         inc $7d
$13:b31d  33 9a         and ($9a,s),y
$13:b31f  08            php
$13:b320  e4 c1         cpx $c1
$13:b322  32 15         and ($15)
$13:b324  04 e0         tsb $e0
$13:b326  81 d1         sta ($d1,x)
$13:b328  4a            lsr a
$13:b329  1c 05 42      trb $4205
$13:b32c  c5 63         cmp $63
$13:b32e  50 c8         bvc $b2f8
$13:b330  5c 26 17 05   jml $051726
$13:b334  83 c6         sta $c6,s
$13:b336  e0 f1 e8      cpx #$e8f1
$13:b339  14 3e         trb $3e
$13:b33b  02 87         cop #$87
$13:b33d  25 68         and $68
$13:b33f  0f c2 31 1c   ora $1c31c2
$13:b343  56 84         lsr $84,x
$13:b345  05 c0         ora $c0
$13:b347  7e 29 1d      ror $1d29,x
$13:b34a  a3 57         lda $57,s
$13:b34c  ae e7 5c      ldx $5ce7
$13:b34f  aa            tax
$13:b350  d2 2a         cmp ($2a)
$13:b352  a6 db         ldx $db
$13:b354  99 6c d4      sta $d46c,y
$13:b357  70 24         bvs $b37d
$13:b359  00 60         brk #$60
$13:b35b  8a            txa
$13:b35c  40            rti
$13:b35d  08            php
$13:b35e  41 88         eor ($88,x)
$13:b360  12 0a         ora ($0a)
$13:b362  b4 4d         ldy $4d,x
$13:b364  42 68         wdm #$68
$13:b366  03 40         ora $40,s
$13:b368  42 21         wdm #$21
$13:b36a  11 a8         ora ($a8),y
$13:b36c  54 6e 17      mvn $17,$6e
$13:b36f  1c 82 c3      trb $c382
$13:b372  e0 48 10      cpx #$1048
$13:b375  3e 81 f4      rol $f481,x
$13:b378  20 f0 08      jsr $08f0
$13:b37b  2c 02 08      bit $0802
$13:b37e  c6 5b         dec $5b
$13:b380  05 f2         ora $f2
$13:b382  81 74         sta ($74,x)
$13:b384  da            phx
$13:b385  75 36         adc $36,x
$13:b387  5d 09 57      eor $5709,x
$13:b38a  63 ed         adc $ed,s
$13:b38c  8c f6 4a      sty $4af6
$13:b38f  03 a1         ora $a1,s
$13:b391  80 12         bra $b3a5
$13:b393  0c 22 01      tsb $0122
$13:b396  0c 23 08      tsb $0823
$13:b399  a5 21         lda $21
$13:b39b  60            rts
$13:b39c  50 9d         bvc $b33b
$13:b39e  c5 26         cmp $26
$13:b3a0  71 39         adc ($39),y
$13:b3a2  a4 5a         ldy $5a
$13:b3a4  61 0a         adc ($0a,x)
$13:b3a6  8d 40 d7      sta $d740
$13:b3a9  a1 03         lda ($03,x)
$13:b3ab  8c 41 d7      sty $d741
$13:b3ae  61 33         adc ($33,x)
$13:b3b0  87 cd         sta [$cd]
$13:b3b2  21 f3         and ($f3,x)
$13:b3b4  08            php
$13:b3b5  7c 68 74      jmp ($7468,x)
$13:b3b8  07 d0         ora [$d0]
$13:b3ba  80 4a         bra $b406
$13:b3bc  39 91 8e      and $8e91,y
$13:b3bf  e7 42         sbc [$42]
$13:b3c1  39 20 9e      and $9e20,y
$13:b3c4  23 c3         and $c3,s
$13:b3c6  61 38         adc ($38,x)
$13:b3c8  e0 7c 1c      cpx #$1c7c
$13:b3cb  c1 cc         cmp ($cc,x)
$13:b3cd  f8            sed
$13:b3ce  77 3c         adc [$3c],y
$13:b3d0  11 cf         ora ($cf),y
$13:b3d2  04 f1         tsb $f1
$13:b3d4  3c 29 a3      bit $a329,x
$13:b3d7  80 40         bra $b419
$13:b3d9  a1 30         lda ($30,x)
$13:b3db  98            tya
$13:b3dc  c4 12         cpy $12
$13:b3de  38            sec
$13:b3df  6f 08 6c 70   adc $706c08
$13:b3e3  f6 10         inc $10,x
$13:b3e5  12 18         ora ($18)
$13:b3e7  40            rti
$13:b3e8  61 30         adc ($30,x)
$13:b3ea  73 f8         adc ($f8,s),y
$13:b3ec  2e 01 82      rol $8201
$13:b3ef  44 12 04      mvp $04,$12
$13:b3f2  85 02         sta $02
$13:b3f4  31 50         and ($50),y
$13:b3f6  8c 4a 29      sty $294a
$13:b3f9  88            dey
$13:b3fa  f0 ec         beq $b3e8
$13:b3fc  47 26         eor [$26]
$13:b3fe  09 a3 8c      ora #$8ca3
$13:b401  78            sei
$13:b402  1b            tcs
$13:b403  e1 4c         sbc ($4c,x)
$13:b405  f8            sed
$13:b406  29 c1 46      and #$46c1
$13:b409  0a            asl a
$13:b40a  94 81         sty $81,x
$13:b40c  c0 e0 90      cpy #$90e0
$13:b40f  68            pla
$13:b410  4c 3e 17      jmp $173e
$13:b413  0f 82 43 20   ora $204382
$13:b417  50 e9         bvc $b402
$13:b419  4c fe c7      jmp $c7fe
$13:b41c  79 1e 84      adc $841e,y
$13:b41f  1a            inc a
$13:b420  02 3f         cop #$3f
$13:b422  28            plp
$13:b423  64 0e         stz $0e
$13:b425  15 05         ora $05,x
$13:b427  80 c3         bra $b3ec
$13:b429  a0 d0 fc      ldy #$fcd0
$13:b42c  06 03         asl $03
$13:b42e  81 40         sta ($40,x)
$13:b430  b0 48         bcs $b47a
$13:b432  02 61         cop #$61
$13:b434  a0 2f 07      ldy #$072f
$13:b437  82 41 f0      brl $a47b
$13:b43a  c4 4c         cpy $4c
$13:b43c  0b            phd
$13:b43d  e1 40         sbc ($40,x)
$13:b43f  c0 48 0b      cpy #$0b48
$13:b442  a0 24 1d      ldy #$1d24
$13:b445  05 02         ora $02
$13:b447  11 e0         ora ($e0),y
$13:b449  e6 78         inc $78
$13:b44b  1d e0 ff      ora $ffe0,x
$13:b44e  08            php
$13:b44f  39 ec 20      and $20ec,y
$13:b452  f0 f9         beq $b44d
$13:b454  bd be e3      lda $e3be,x
$13:b457  9d cc 41      sta $41cc,x
$13:b45a  ee a6 90      inc $90a6
$13:b45d  5e 04 3c      lsr $3c04,x
$13:b460  68            pla
$13:b461  43 60         eor $60,s
$13:b463  80 db         bra $b440
$13:b465  e1 18         sbc ($18,x)
$13:b467  e3 38         sbc $38,s
$13:b469  03 c6         ora $c6,s
$13:b46b  01 60         ora ($60,x)
$13:b46d  e0 15 04      cpx #$0415
$13:b470  a6 01         ldx $01
$13:b472  90 80         bcc $b3f4
$13:b474  7e 07 e0      ror $e007,x
$13:b477  3f 00 f8 18   and $18f800,x
$13:b47b  d0 d4         bne $b451
$13:b47d  90 58         bcc $b4d7
$13:b47f  24 22         bit $22
$13:b481  11 0a         ora ($0a),y
$13:b483  85 41         sta $41
$13:b485  a1 c3         lda ($c3,x)
$13:b487  60            rts
$13:b488  81 43         sta ($43,x)
$13:b48a  e7 13         sbc [$13]
$13:b48c  71 f8         adc ($f8),y
$13:b48e  41 20         eor ($20,x)
$13:b490  70 88         bvs $b41a
$13:b492  38            sec
$13:b493  24 21         bit $21
$13:b495  c0 23 5e      cpy #$5e23
$13:b498  00 fc         brk #$fc
$13:b49a  02 24         cop #$24
$13:b49c  94 0d         sty $0d,x
$13:b49e  06 83         asl $83
$13:b4a0  01 a0         ora ($a0,x)
$13:b4a2  e0 06 81      cpx #$8106
$13:b4a5  da            phx
$13:b4a6  02 05         cop #$05
$13:b4a8  14 80         trb $80
$13:b4aa  a4 0b         ldy $0b
$13:b4ac  81 d8         sta ($d8,x)
$13:b4ae  2f 8c 1e 02   and $021e8c
$13:b4b2  83 08         sta $08,s
$13:b4b4  3c 21 12      bit $1221,x
$13:b4b7  11 f8         ora ($f8),y
$13:b4b9  84 be         sty $be
$13:b4bb  41 1f         eor ($1f,x)
$13:b4bd  b8            clv
$13:b4be  2b            pld
$13:b4bf  cc c2 0c      cpy $0cc2
$13:b4c2  43 88         eor $88,s
$13:b4c4  31 0f         and ($0f),y
$13:b4c6  81 80         sta ($80,x)
$13:b4c8  b0 50         bcs $b51a
$13:b4ca  36 1a         rol $1a,x
$13:b4cc  09 f6 92      ora #$92f6
$13:b4cf  7f 8e 8f e3   adc $e38f8e,x
$13:b4d3  35 fa         and $fa,x
$13:b4d5  06 79         asl $79
$13:b4d7  78            sei
$13:b4d8  28            plp
$13:b4d9  17 09         ora [$09],y
$13:b4db  05 fa         ora $fa
$13:b4dd  49 7f 87      eor #$877f
$13:b4e0  5f e1 94 f6   eor $f694e1,x
$13:b4e4  40            rti
$13:b4e5  c0 60 10      cpy #$1060
$13:b4e8  28            plp
$13:b4e9  04 2e         tsb $2e
$13:b4eb  17 09         ora [$09],y
$13:b4ed  44 84 2e      mvp $2e,$84
$13:b4f0  0b            phd
$13:b4f1  09 81 41      ora #$4181
$13:b4f4  59 02 31      eor $3102,y
$13:b4f7  18            clc
$13:b4f8  5c 11 0e 10   jml $100e11
$13:b4fc  c8            iny
$13:b4fd  3c 1a 1f      bit $1f1a,x
$13:b500  0c 86 98      tsb $9886
$13:b503  43 31         eor $31,s
$13:b505  18            clc
$13:b506  82 41 b3      brl $684a
$13:b509  19 cd 86      ora $86cd,y
$13:b50c  fa            plx
$13:b50d  c1 7c         cmp ($7c,x)
$13:b50f  80 5e         bra $b56f
$13:b511  30 1f         bmi $b532
$13:b513  03 08         ora $08,s
$13:b515  46 3c         lsr $3c
$13:b517  10 6f         bpl $b588
$13:b519  c6 72         dec $72
$13:b51b  c1 be         cmp ($be,x)
$13:b51d  a0 5f 30      ldy #$305f
$13:b520  01 c3         ora ($c3,x)
$13:b522  78            sei
$13:b523  00 08         brk #$08
$13:b525  11 83         ora ($83),y
$13:b527  0e 83 1c      asl $1c83
$13:b52a  c2 0c         rep #$0c
$13:b52c  36 06         rol $06,x
$13:b52e  19 a3 42      ora $42a3,y
$13:b531  1e 8a 00      asl $008a,x
$13:b534  58            cli
$13:b535  2d 86 12      and $1286
$13:b538  c3 1f         cmp $1f,s
$13:b53a  87 e3         sta [$e3]
$13:b53c  81 fe         sta ($fe,x)
$13:b53e  d0 4f         bne $b58f
$13:b540  3a            dec a
$13:b541  19 ee c6      ora $c6ee,y
$13:b544  73 e1         adc ($e1,s),y
$13:b546  b8            clv
$13:b547  e8            inx
$13:b548  64 11         stz $11
$13:b54a  c2 8e         rep #$8e
$13:b54c  28            plp
$13:b54d  07 81         ora [$81]
$13:b54f  c4 18         cpy $18
$13:b551  07 08         ora [$08]
$13:b553  e0 10 00      cpx #$0010
$13:b556  13 08         ora ($08,s),y
$13:b558  34 3a         bit $3a,x
$13:b55a  05 0a         ora $0a
$13:b55c  84 42         sty $42
$13:b55e  91 c2         sta ($c2),y
$13:b560  f3 08         sbc ($08,s),y
$13:b562  34 10         bit $10,x
$13:b564  fa            plx
$13:b565  03 c0         ora $c0,s
$13:b567  80 42         bra $b5ab
$13:b569  a0 88 50      ldy #$5088
$13:b56c  37 81         and [$81],y
$13:b56e  f0 4b         beq $b5bb
$13:b570  e9 00 c0      sbc #$c000
$13:b573  60            rts
$13:b574  20 92 48      jsr $4892
$13:b577  04 c2         tsb $c2
$13:b579  61 78         adc ($78,x)
$13:b57b  a0 72 11      ldy #$1172
$13:b57e  eb            xba
$13:b57f  00 4c         brk #$4c
$13:b581  08            php
$13:b582  6c 20 1c      jmp ($1c20)
$13:b585  85 48         sta $48
$13:b587  17 d0         ora [$d0],y
$13:b589  72 10         adc ($10)
$13:b58b  c0 30 1d      cpy #$1d30
$13:b58e  42 05         wdm #$05
$13:b590  2b            pld
$13:b591  58            cli
$13:b592  2c 02 18      bit $1802
$13:b595  82 39 59      brl $0ed1
$13:b598  fc 0b e7      jsr ($e70b,x)
$13:b59b  10 88         bpl $b525
$13:b59d  40            rti
$13:b59e  2c 14 0f      bit $0f14
$13:b5a1  84 43         sty $43
$13:b5a3  71 50         adc ($50),y
$13:b5a5  ec 33 d5      cpx $d533
$13:b5a8  ae 05 00      ldx $0005
$13:b5ab  80 6e         bra $b61b
$13:b5ad  28            plp
$13:b5ae  1d 89 05      ora $0589,x
$13:b5b1  72 c7         adc ($c7)
$13:b5b3  14 b7         trb $b7
$13:b5b5  4e a9 d2      lsr $d2a9
$13:b5b8  cb            wai
$13:b5b9  d5 5f         cmp $5f,x
$13:b5bb  b1 17         lda ($17),y
$13:b5bd  c2 62         rep #$62
$13:b5bf  f0 1c         beq $b5dd
$13:b5c1  4e 3c 0a      lsr $0a3c
$13:b5c4  07 09         ora [$09]
$13:b5c6  83 80         sta $80,s
$13:b5c8  46 07         lsr $07
$13:b5ca  20 55 0d      jsr $0d55
$13:b5cd  f2 01         sbc ($01)
$13:b5cf  3b            tsc
$13:b5d0  80 59         bra $b62b
$13:b5d2  32 19         and ($19)
$13:b5d4  4d 85 e2      eor $e285
$13:b5d7  d1 e8         cmp ($e8),y
$13:b5d9  dc 74 a6      jml [$a674]
$13:b5dc  5c aa 16 c2   jml $c216aa
$13:b5e0  01 50         ora ($50,x)
$13:b5e2  e0 63 30      cpx #$3063
$13:b5e5  16 ce         asl $ce,x
$13:b5e7  06 93         asl $93
$13:b5e9  81 24         sta ($24,x)
$13:b5eb  c0 31 c2      cpy #$c231
$13:b5ee  79 00 bf      adc $bf00,y
$13:b5f1  40            rti
$13:b5f2  37 d0         and [$d0],y
$13:b5f4  0b            phd
$13:b5f5  56 22         lsr $22,x
$13:b5f7  e7 71         sbc [$71]
$13:b5f9  9e ed 7f      stz $7fed,x
$13:b5fc  db            stp
$13:b5fd  8b            phb
$13:b5fe  fc fb 7d      jsr ($7dfb,x)
$13:b601  14 c2         trb $c2
$13:b603  70 7b         bvs $b680
$13:b605  74 0b         stz $0b,x
$13:b607  ac 03 ff      ldy $ff03
$13:b60a  71 bd         adc ($bd),y
$13:b60c  4c 2f b3      jmp $b32f
$13:b60f  8f fc fb ff   sta $fffbfc
$13:b613  14 df         trb $df
$13:b615  60            rts
$13:b616  30 90         bmi $b5a8
$13:b618  0f c4 73 d1   ora $d173c4
$13:b61c  ac f0 53      ldy $53f0
$13:b61f  3a            dec a
$13:b620  11 ce         ora ($ce),y
$13:b622  04 7a         tsb $7a
$13:b624  49 ba e3      eor #$e3ba
$13:b627  5e 3a d6      lsr $d63a,x
$13:b62a  87 19         sta [$19]
$13:b62c  2a            rol a
$13:b62d  43 c0         eor $c0,s
$13:b62f  e6 1a         inc $1a
$13:b631  03 3c         ora $3c,s
$13:b633  ea            nop
$13:b634  95 b8         sta $b8,x
$13:b636  6c 3a bf      jmp ($bf3a)
$13:b639  5f da 7f 30   eor $307fda,x
$13:b63d  9f ce b7 bb   sta $bbb7ce,x
$13:b641  23 ef         and $ef,s
$13:b643  8c f9 e4      sty $e4f9
$13:b646  70 0b         bvs $b653
$13:b648  84 00         sty $00
$13:b64a  0e 10 34      asl $3410
$13:b64d  20 c0 58      jsr $58c0
$13:b650  83 07         sta $07,s
$13:b652  80 56         bra $b6aa
$13:b654  34 14         bit $14,x
$13:b656  ce 06 83      dec $8306
$13:b659  41 32         eor ($32,x)
$13:b65b  98            tya
$13:b65c  45 26         eor $26
$13:b65e  94 8b         sty $8b,x
$13:b660  c6 23         dec $23
$13:b662  f1 98         sbc ($98),y
$13:b664  f4 67 05      pea $0567
$13:b667  03 5c         ora $5c,s
$13:b669  80 73         bra $b6de
$13:b66b  a0 1c a8      ldy #$a81c
$13:b66e  06 1a         asl $1a
$13:b670  01 26         ora ($26,x)
$13:b672  80 71         bra $b6e5
$13:b674  a0 12 ea      ldy #$ea12
$13:b677  8c 9e b1      sty $b19e
$13:b67a  30 a7         bmi $b623
$13:b67c  cf 28 77 c8   cmp $c87728
$13:b680  1a            inc a
$13:b681  dc 2f b0      jml [$b02f]
$13:b684  2b            pld
$13:b685  fb            xce
$13:b686  3d 17 d3      and $d317,x
$13:b689  72 c0         adc ($c0)
$13:b68b  7e 45 c1      ror $c145,x
$13:b68e  a2 ac ef      ldx #$efac
$13:b691  78            sei
$13:b692  13 ef         ora ($ef,s),y
$13:b694  04 7b         tsb $7b
$13:b696  cb            wai
$13:b697  1b            tcs
$13:b698  f2 46         sbc ($46)
$13:b69a  e3 f0         sbc $f0,s
$13:b69c  09 fc 02      ora #$02fc
$13:b69f  3b            tsc
$13:b6a0  00 81         brk #$81
$13:b6a2  22 05 12 0c   jsl $0c1205
$13:b6a6  83 80         sta $80,s
$13:b6a8  c1 00         cmp ($00,x)
$13:b6aa  81 0f         sta ($0f,x)
$13:b6ac  8f c4 62 51   sta $5162c4
$13:b6b0  d8            cld
$13:b6b1  1c 3e 1b      trb $1b3e
$13:b6b4  0c 8b c4      tsb $c48b
$13:b6b7  21 f0         and ($f0,x)
$13:b6b9  e8            inx
$13:b6ba  4c 3a 02      jmp $023a
$13:b6bd  02 07         cop #$07
$13:b6bf  41 a1         eor ($a1,x)
$13:b6c1  42 1f         wdm #$1f
$13:b6c3  00 c0         brk #$c0
$13:b6c5  7e 2a 1d      ror $1d2a,x
$13:b6c8  8d 42 6c      sta $6c42
$13:b6cb  31 1c         and ($1c),y
$13:b6cd  8c 44 62      sty $6244
$13:b6d0  31 d8         and ($d8),y
$13:b6d2  ac 5c 2f      ldy $2f5c
$13:b6d5  06 50         asl $50
$13:b6d7  d0 20         bne $b6f9
$13:b6d9  04 46         tsb $46
$13:b6db  41 f2         eor ($f2,x)
$13:b6dd  c0 40 25      cpy #$2540
$13:b6e0  f0 fb         beq $b6dd
$13:b6e2  fd bb fd      sbc $fdbb,x
$13:b6e5  2c ff 51      bit $51ff
$13:b6e8  af f3 8b f8   lda $f88bf3
$13:b6ec  e4 27         cpx $27
$13:b6ee  53 f8         eor ($f8,s),y
$13:b6f0  34 fc         bit $fc,x
$13:b6f2  60            rts
$13:b6f3  3f f9 67 e6   and $e667f9,x
$13:b6f7  80 37         bra $b730
$13:b6f9  49 dc 0b      eor #$0bdc
$13:b6fc  41 38         eor ($38,x)
$13:b6fe  a8            tay
$13:b6ff  57 35         eor [$35],y
$13:b701  18            clc
$13:b702  ef 87 ff e9   sbc $e9ff87
$13:b706  e7 f5         sbc [$f5]
$13:b708  53 6a         eor ($6a,s),y
$13:b70a  d5 9c         cmp $9c,x
$13:b70c  b7 67         lda [$67],y
$13:b70e  80 20         bra $b730
$13:b710  3a            dec a
$13:b711  05 02         ora $02
$13:b713  71 20         adc ($20),y
$13:b715  f8            sed
$13:b716  50 04         bvc $b71c
$13:b718  20 83 08      jsr $0883
$13:b71b  14 1a         trb $1a
$13:b71d  0d 0f 82      ora $820f
$13:b720  c3 61         cmp $61,s
$13:b722  30 98         bmi $b6bc
$13:b724  44 22 0d      mvp $0d,$22
$13:b727  0c 80 c5      tsb $c580
$13:b72a  20 91 c8      jsr $c891
$13:b72d  30 30         bmi $b75f
$13:b72f  61 b0         adc ($b0,x)
$13:b731  28            plp
$13:b732  4c 1a 11      jmp $111a
$13:b735  07 86         ora [$86]
$13:b737  40            rti
$13:b738  e2 90         sep #$90
$13:b73a  38            sec
$13:b73b  e4 0e         cpx $0e
$13:b73d  11 88         ora ($88),y
$13:b73f  a4 73         ldy $73
$13:b741  2a            rol a
$13:b742  1d cf 47      ora $47cf,x
$13:b745  f3 01         sbc ($01,s),y
$13:b747  d8            cld
$13:b748  d0 6c         bne $b7b6
$13:b74a  3a            dec a
$13:b74b  19 8f 06      ora $068f,y
$13:b74e  33 11         and ($11,s),y
$13:b750  70 e6         bvs $b738
$13:b752  4c 3b 92      jmp $923b
$13:b755  0f e4 03 b1   ora $b103e4
$13:b759  20 d8 50      jsr $50d8
$13:b75c  33 16         and ($16,s),y
$13:b75e  0c 65 c2      tsb $c265
$13:b761  08            php
$13:b762  ff 08 fc 26   sbc $26fc08,x
$13:b766  33 11         and ($11,s),y
$13:b768  88            dey
$13:b769  c2 a3         rep #$a3
$13:b76b  10 d7         bpl $b744
$13:b76d  c0 45         cpy #$45
$13:b76f  e0 d1         cpx #$d1
$13:b771  e0 68         cpx #$68
$13:b773  37 c2         and [$c2],y
$13:b775  33 06         and ($06,s),y
$13:b777  88            dey
$13:b778  c3 a3         cmp $a3,s
$13:b77a  10 78         bpl $b7f4
$13:b77c  ec 0a 2f      cpx $2f0a
$13:b77f  00 8f         brk #$8f
$13:b781  40            rti
$13:b782  63 19         adc $19,s
$13:b784  8a            txa
$13:b785  87 42         sta [$42]
$13:b787  81 e8         sta ($e8,x)
$13:b789  e0 7e         cpx #$7e
$13:b78b  32 1d         and ($1d)
$13:b78d  8d 86 f1      sta $f186
$13:b790  36 4a         rol $4a,x
$13:b792  b0 e8         bcs $b77c
$13:b794  48            pha
$13:b795  3d 10 0f      and $0f10,x
$13:b798  c2 98         rep #$98
$13:b79a  77 8a         adc [$8a],y
$13:b79c  a3 e7         lda $e7,s
$13:b79e  72 72         adc ($72)
$13:b7a0  fd 89 df      sbc $df89,x
$13:b7a3  d2 d9         cmp ($d9)
$13:b7a5  b3 b3         lda ($b3,s),y
$13:b7a7  4e 69 17      lsr $1769
$13:b7aa  f9 fc 1d      sbc $1dfc,y
$13:b7ad  02 13         cop #$13
$13:b7af  03 60         ora $60,s
$13:b7b1  80 8e         bra $b741
$13:b7b3  21 00         and ($00,x)
$13:b7b5  a8            tay
$13:b7b6  00 8b         brk #$8b
$13:b7b8  c1 20         cmp ($20,x)
$13:b7ba  a2 69 3e      ldx #$3e69
$13:b7bd  51 6f         eor ($6f),y
$13:b7bf  24 4b         bit $4b
$13:b7c1  19 f8 b2      ora $b2f8,y
$13:b7c4  7f 3f 1c 0f   adc $0f1c3f,x
$13:b7c8  03 30         ora $30,s
$13:b7ca  20 11 a8      jsr $a811
$13:b7cd  04 20         tsb $20
$13:b7cf  44 20 71      mvp $71,$20
$13:b7d2  8a            txa
$13:b7d3  00 8a         brk #$8a
$13:b7d5  1b            tcs
$13:b7d6  19 97 47      ora $4797,y
$13:b7d9  ab            plb
$13:b7da  72 b9         adc ($b9)
$13:b7dc  a5 b2         lda $b2
$13:b7de  ed 06 bc      sbc $bc06
$13:b7e1  42 27         wdm #$27
$13:b7e3  8a            txa
$13:b7e4  f0 80         beq $b766
$13:b7e6  50 a0         bvc $b788
$13:b7e8  10 18         bpl $b802
$13:b7ea  04 12         tsb $12
$13:b7ec  01 03         ora ($03,x)
$13:b7ee  80 42         bra $b832
$13:b7f0  60            rts
$13:b7f1  10 72         bpl $b865
$13:b7f3  20 80 83      jsr $8380
$13:b7f6  35 64         and $64,x
$13:b7f8  af 48 3b de   lda $de3b48
$13:b7fc  0d 76 c2      ora $c276
$13:b7ff  b9 60 ba      lda $ba60,y
$13:b802  56 3b         lsr $3b,x
$13:b804  1b            tcs
$13:b805  80 e8         bra $b7ef
$13:b807  00 83         brk #$83
$13:b809  00 02         brk #$02
$13:b80b  1a            inc a
$13:b80c  01 80         ora ($80,x)
$13:b80e  4c 24 06      jmp $0624
$13:b811  1f 7c 53 d9   ora $d9537c,x
$13:b815  14 d6         trb $d6
$13:b817  55 2d         eor $2d,x
$13:b819  94 49         sty $49,x
$13:b81b  e5 d6         sbc $d6
$13:b81d  1b            tcs
$13:b81e  3b            tsc
$13:b81f  7e 08 08      ror $0808,x
$13:b822  08            php
$13:b823  a0 81 1a      ldy #$1a81
$13:b826  04 0e         tsb $0e
$13:b828  61 02         adc ($02,x)
$13:b82a  01 1c         ora ($1c,x)
$13:b82c  f3 d9         sbc ($d9,s),y
$13:b82e  2c 9e 4a      bit $4a9e
$13:b831  a7 5a         lda [$5a]
$13:b833  cd e6 93      cmp $93e6
$13:b836  71 bc         adc ($bc),y
$13:b838  d0 5e         bne $b898
$13:b83a  28            plp
$13:b83b  1e 08 02      asl $0208,x
$13:b83e  24 38         bit $38
$13:b840  50 0e         bvc $b850
$13:b842  01 90         ora ($90,x)
$13:b844  20 94 08      jsr $0894
$13:b847  c1 94         cmp ($94,x)
$13:b849  80 41         bra $b88c
$13:b84b  7f 57 0c fa   adc $fa0c57,x
$13:b84f  03 7e         ora $7e,s
$13:b851  80 df         bra $b832
$13:b853  20 77 18      jsr $1877
$13:b856  72 cc         adc ($cc)
$13:b858  0f a4 be cb   ora $cbbea4
$13:b85c  26 6e         rol $6e
$13:b85e  d9 93 bc      cmp $bc93,y
$13:b861  61 ee         adc ($ee,x)
$13:b863  98            tya
$13:b864  af e4 4a b9   lda $b94ae4
$13:b868  b8            clv
$13:b869  b2 67         lda ($67)
$13:b86b  13 a0         ora ($a0,s),y
$13:b86d  de e8 94      dec $94e8,x
$13:b870  42 11         wdm #$11
$13:b872  08            php
$13:b873  8c 3c 86      sty $863c
$13:b876  3b            tsc
$13:b877  05 8e         ora $8e
$13:b879  41 61         eor ($61,x)
$13:b87b  90 58         bcc $b8d5
$13:b87d  14 0c         trb $0c
$13:b87f  7a            ply
$13:b880  04 90         tsb $90
$13:b882  00 92         brk #$92
$13:b884  24 00         bit $00
$13:b886  e4 40         cpx $40
$13:b888  0b            phd
$13:b889  85 e2         sta $e2
$13:b88b  c1 70         cmp ($70,x)
$13:b88d  b2 5d         lda ($5d)
$13:b88f  2c 55 0b      bit $0b55
$13:b892  55 63         eor $63,x
$13:b894  ed 8c 9e      sbc $9e8c
$13:b897  68            pla
$13:b898  22 12 03 38   jsl $380312
$13:b89c  62 04 03      per $bba3
$13:b89f  8c 80 61      sty $6180
$13:b8a2  0c 45 e0      tsb $e045
$13:b8a5  e0 78 20      cpx #$2078
$13:b8a8  b0 78         bcs $b922
$13:b8aa  1c 1e 0d      trb $0d1e
$13:b8ad  02 85         cop #$85
$13:b8af  40            rti
$13:b8b0  a3 90         lda $90,s
$13:b8b2  48            pha
$13:b8b3  ec 02 1c      cpx $1c02
$13:b8b6  80 18         bra $b8d0
$13:b8b8  c4 02         cpy $02
$13:b8ba  11 00         ora ($00),y
$13:b8bc  86 c0         stx $c0
$13:b8be  07 20         ora [$20]
$13:b8c0  81 28         sta ($28,x)
$13:b8c2  09 7c 20      ora #$207c
$13:b8c5  1b            tcs
$13:b8c6  6f cc d2 f7   adc $f7d2cc
$13:b8ca  74 ad         stz $ad,x
$13:b8cc  7c ab 9e      jmp ($9eab,x)
$13:b8cf  2a            rol a
$13:b8d0  e5 ca         sbc $ca
$13:b8d2  99 e4 d4      sta $d4e4,y
$13:b8d5  7a            ply
$13:b8d6  08            php
$13:b8d7  20 aa 13      jsr $13aa
$13:b8da  0b            phd
$13:b8db  44 20 13      mvp $13,$20
$13:b8de  05 68         ora $68
$13:b8e0  42 21         wdm #$21
$13:b8e2  51 a8         eor ($a8),y
$13:b8e4  24 72         bit $72
$13:b8e6  15 18         ora $18,x
$13:b8e8  83 c4         sta $c4,s
$13:b8ea  21 71         and ($71,x)
$13:b8ec  88            dey
$13:b8ed  10 ec         bpl $b8db
$13:b8ef  61 10         adc ($10,x)
$13:b8f1  78            sei
$13:b8f2  d3 e0         cmp ($e0,s),y
$13:b8f4  20 67 61      jsr $6167
$13:b8f7  87 9d         sta [$9d]
$13:b8f9  82 1d 01      brl $ba19
$13:b8fc  23 84         and $84,s
$13:b8fe  82 99 98      brl $519a
$13:b901  b6 6e         ldx $6e,y
$13:b903  29 96 88      and #$8896
$13:b906  64 62         stz $62
$13:b908  39 a0 9c      and $9ca0,y
$13:b90b  58            cli
$13:b90c  2c 10 0e      bit $0e10
$13:b90f  05 33         ora $33
$13:b911  e1 6c         sbc ($6c,x)
$13:b913  f8            sed
$13:b914  27 c2         and [$c2]
$13:b916  19 f0 8e      ora $8ef0,y
$13:b919  78            sei
$13:b91a  27 1c         and [$1c]
$13:b91c  0b            phd
$13:b91d  06 03         asl $03
$13:b91f  80 06         bra $b927
$13:b921  08            php
$13:b922  54 2e 71      mvn $71,$2e
$13:b925  15 99         ora $99,x
$13:b927  45 26         eor $26
$13:b929  71 69         adc ($69),y
$13:b92b  84 26         sty $26
$13:b92d  31 0c         and ($0c),y
$13:b92f  8e 00 02      stx $0200
$13:b932  15 05         ora $05,x
$13:b934  9c 41 e6      stz $e641
$13:b937  50 f9         bvc $b932
$13:b939  9c 3e 60      stz $603e
$13:b93c  88            dey
$13:b93d  14 18         trb $18
$13:b93f  01 42         ora ($42,x)
$13:b941  41 0c         eor ($0c,x)
$13:b943  cc 47 26      cpy $2647
$13:b946  13 88         ora ($88,s),y
$13:b948  04 32         tsb $32
$13:b94a  51 4c         eor ($4c),y
$13:b94c  ac 47 2c      ldy $2c47
$13:b94f  17 88         ora [$88],y
$13:b951  02 91         cop #$91
$13:b953  54 a0 9f      mvn $9f,$a0
$13:b956  05 38         ora $38
$13:b958  5e 30 1f      lsr $1f30,x
$13:b95b  01 40         ora ($40,x)
$13:b95d  bb            tyx
$13:b95e  8a            txa
$13:b95f  13 08         ora ($08,s),y
$13:b961  c3 c1         cmp $c1,s
$13:b963  6c d4 29      jmp ($29d4)
$13:b966  e4 d2         cpx $d2
$13:b968  70 5e         bvs $b9c8
$13:b96a  17 71         ora [$71],y
$13:b96c  42 de         wdm #$de
$13:b96e  c3 6e         cmp $6e,s
$13:b970  7d 2c 7e      adc $7e2c,x
$13:b973  3c 9b 0c      bit $0c9b,x
$13:b976  01 84         ora ($84,x)
$13:b978  02 ef         cop #$ef
$13:b97a  3f 8f 78 02   and $02788f,x
$13:b97e  96 16         stx $16,y
$13:b980  04 d8         tsb $d8
$13:b982  44 22 10      mvp $10,$22
$13:b985  98            tya
$13:b986  4c 3a 19      jmp $193a
$13:b989  04 80         tsb $80
$13:b98b  41 07         eor ($07,x)
$13:b98d  61 00         adc ($00,x)
$13:b98f  56 85         lsr $85,x
$13:b991  c2 c1         rep #$c1
$13:b993  18            clc
$13:b994  43 80         eor $80,s
$13:b996  e0 60 d0      cpx #$d060
$13:b999  01 e8         ora ($e8,x)
$13:b99b  46 20         lsr $20
$13:b99d  15 a9         ora $a9,x
$13:b99f  e4 f2         cpx $f2
$13:b9a1  fd ff 2a      sbc $2aff,x
$13:b9a4  09 4c 0a      ora #$0a4c
$13:b9a7  20 4f 08      jsr $084f
$13:b9aa  01 48         ora ($48,x)
$13:b9ac  4a            lsr a
$13:b9ad  86 55         stx $55
$13:b9af  12 98         ora ($98)
$13:b9b1  17 c2         ora [$c2],y
$13:b9b3  3b            tsc
$13:b9b4  72 94         adc ($94)
$13:b9b6  d9 a5 be      cmp $bea5,y
$13:b9b9  2b            pld
$13:b9ba  37 82         and [$82],y
$13:b9bc  65 f2         adc $f2
$13:b9be  be 7f 27      ldx $277f,y
$13:b9c1  3f 88 5d e2   and $e25d88,x
$13:b9c5  e5 0f         sbc $0f
$13:b9c7  b3 47         lda ($47,s),y
$13:b9c9  fc 51 ff      jsr ($ff51,x)
$13:b9cc  04 7f         tsb $7f
$13:b9ce  e5 0d         sbc $0d
$13:b9d0  fe 40 ff      inc $ff40,x
$13:b9d3  10 7b         bpl $ba50
$13:b9d5  c3 34         cmp $34,s
$13:b9d7  20 70 38      jsr $3870
$13:b9da  7c 3e 7f      jmp ($7f3e,x)
$13:b9dd  1c 9e 4c      trb $4c9e
$13:b9e0  ee 12 4b      inc $4b12
$13:b9e3  1d a3 cf      ora $cfa3,x
$13:b9e6  40            rti
$13:b9e7  e7 c0         sbc [$c0]
$13:b9e9  e0 10 f1      cpx #$f110
$13:b9ec  00 17         brk #$17
$13:b9ee  c2 07         rep #$07
$13:b9f0  70 87         bvs $b979
$13:b9f2  d8            cld
$13:b9f3  e3 fe         sbc $fe,s
$13:b9f5  78            sei
$13:b9f6  ff 3e 7f 7c   sbc $7c7f3e,x
$13:b9fa  be 7e 3f      ldx $3f7e,y
$13:b9fd  1f 0f 84 82   ora $82840f,x
$13:ba01  40            rti
$13:ba02  ee 48 0c      inc $0c48
$13:ba05  05 5f         ora $5f
$13:ba07  c0 f0 84      cpy #$84f0
$13:ba0a  42 23         wdm #$23
$13:ba0c  11 89         ora ($89),y
$13:ba0e  84 c1         sty $c1
$13:ba10  6a            ror a
$13:ba11  9c 02 08      stz $0802
$13:ba14  34 36         bit $36,x
$13:ba16  19 0c 8e      ora $8e0c,y
$13:ba19  47 1a         eor [$1a]
$13:ba1b  60            rts
$13:ba1c  3d 21 49      and $4921,x
$13:ba1f  34 41         bit $41,x
$13:ba21  df cd 30 9c   cmp $9c30cd,x
$13:ba25  4e 2f 17      lsr $172f
$13:ba28  85 88         sta $88
$13:ba2a  5f 6f b1 d8   eor $d8b16f,x
$13:ba2e  eb            xba
$13:ba2f  bc 01 bf      ldy $bf01,x
$13:ba32  08            php
$13:ba33  80 10         bra $ba45
$13:ba35  80 62         bra $ba99
$13:ba37  2b            pld
$13:ba38  30 59         bmi $ba93
$13:ba3a  87 80         sta [$80]
$13:ba3c  72 36         adc ($36)
$13:ba3e  0b            phd
$13:ba3f  00 bf         brk #$bf
$13:ba41  af f7 ff f7   lda $f7fff7
$13:ba45  fb            xce
$13:ba46  f9 fc 09      sbc $09fc,y
$13:ba49  83 54         sta $54,s
$13:ba4b  05 e0         ora $e0
$13:ba4d  2f 06 e8 13   and $13e806
$13:ba51  f9 6a 11      sbc $116a,y
$13:ba54  03 88         ora $88,s
$13:ba56  b5 40         lda $40,x
$13:ba58  ea            nop
$13:ba59  47 10         eor [$10]
$13:ba5b  17 81         ora [$81],y
$13:ba5d  bf 8b 25 40   lda $40258b,x
$13:ba61  a0 12 c0      ldy #$c012
$13:ba64  ea            nop
$13:ba65  01 10         ora ($10,x)
$13:ba67  3a            dec a
$13:ba68  80 f4         bra $ba5e
$13:ba6a  92 39         sta ($39)
$13:ba6c  03 81         ora $81,s
$13:ba6e  c1 e0         cmp ($e0,x)
$13:ba70  f0 f8         beq $ba6a
$13:ba72  7c f2 78      jmp ($78f2,x)
$13:ba75  4b            phk
$13:ba76  04 6a         tsb $6a
$13:ba78  2b            pld
$13:ba79  fd 9e 30      sbc $309e,x
$13:ba7c  28            plp
$13:ba7d  10 14         bpl $ba93
$13:ba7f  00 a0         brk #$a0
$13:ba81  fd 01 69      sbc $6901,x
$13:ba84  33 f8         and ($f8,s),y
$13:ba86  06 07         asl $07
$13:ba88  a0 78 8a      ldy #$8a78
$13:ba8b  70 24         bvs $bab1
$13:ba8d  0f 74 9c 3c   ora $3c9c74
$13:ba91  0e e0 f6      asl $f6e0
$13:ba94  76 4a         ror $4a,x
$13:ba96  05 3c         ora $3c
$13:ba98  3c ed 52      bit $52ed,x
$13:ba9b  82 2f 05      brl $bfcd
$13:ba9e  d8            cld
$13:ba9f  0e c1 80      asl $80c1
$13:baa2  1f 00 5f c1   ora $c15f00,x
$13:baa6  e7 5f         sbc [$5f]
$13:baa8  84 3e         sty $3e
$13:baaa  13 39         ora ($39,s),y
$13:baac  8b            phb
$13:baad  4c 11 a8      jmp $a811
$13:bab0  a1 08         lda ($08,x)
$13:bab2  1c 02 1f      trb $1f02
$13:bab5  00 9c         brk #$9c
$13:bab7  c1 a6         cmp ($a6,x)
$13:bab9  10 f9         bpl $bab4
$13:babb  2d f2 05      and $05f2
$13:babe  3e 87 c7      rol $c787,x
$13:bac1  e3 53         sbc $53,s
$13:bac3  c8            iny
$13:bac4  b4 c6         ldy $c6,x
$13:bac6  1b            tcs
$13:bac7  1c 2c 82      trb $822c
$13:baca  f8            sed
$13:bacb  2f 90 39 f4   and $f43990
$13:bacf  06 3f         asl $3f
$13:bad1  00 9e         brk #$9e
$13:bad3  41 e6         eor ($e6,x)
$13:bad5  30 f3         bmi $baca
$13:bad7  d1 c0         cmp ($c0),y
$13:bad9  2a            rol a
$13:bada  1c f4 78      trb $78f4
$13:badd  5c 3d f2 8b   jml $8bf23d
$13:bae1  3c d2 e7      bit $e7d2,x
$13:bae4  1d 9e 1e      ora $1e9e,x
$13:bae7  cb            wai
$13:bae8  9f 3f 4f 87   sta $874f3f,x
$13:baec  be 3f 67      ldx $673f,y
$13:baef  8f dc d8 80   sta $80d8dc
$13:baf3  8a            txa
$13:baf4  38            sec
$13:baf5  0c 05 a3      tsb $a305
$13:baf8  06 12         asl $12
$13:bafa  57 f6         eor [$f6],y
$13:bafc  03 00         ora $00,s
$13:bafe  bd 22 fb      lda $fb22,x
$13:bb01  33 7e         and ($7e,s),y
$13:bb03  01 70         ora ($70,x)
$13:bb05  b8            clv
$13:bb06  78            sei
$13:bb07  1e 23 30      asl $3023,x
$13:bb0a  98            tya
$13:bb0b  44 22 0c      mvp $0c,$22
$13:bb0e  94 b8         sty $b8,x
$13:bb10  3c 36 39      bit $3936,x
$13:bb13  1c 8f 47      trb $478f
$13:bb16  a7 81         lda [$81]
$13:bb18  31 bc         and ($bc),y
$13:bb1a  05 c7         ora $c7
$13:bb1c  e1 f0         sbc ($f0,x)
$13:bb1e  78            sei
$13:bb1f  80 3f         bra $bb60
$13:bb21  95 e5         sta $e5,x
$13:bb23  07 83         ora [$83]
$13:bb25  96 01         stx $01,y
$13:bb27  a6 c2         ldx $c2
$13:bb29  fe e0 13      inc $13e0,x
$13:bb2c  e6 81         inc $81
$13:bb2e  40            rti
$13:bb2f  26 f8         rol $f8
$13:bb31  e4 59         cpx $59
$13:bb33  21 0e         and ($0e,x)
$13:bb35  87 43         sta [$43]
$13:bb37  e1 ef         sbc ($ef,x)
$13:bb39  70 90         bvs $bacb
$13:bb3b  48            pha
$13:bb3c  0b            phd
$13:bb3d  60            rts
$13:bb3e  cf 23 8f 35   cmp $358f23
$13:bb42  99 66 0d      sta $0d66,y
$13:bb45  3a            dec a
$13:bb46  4b            phk
$13:bb47  c3 3c         cmp $3c,s
$13:bb49  19 e1 c0      ora $c0e1,y
$13:bb4c  5a            phy
$13:bb4d  8b            phb
$13:bb4e  c4 9e         cpy $9e
$13:bb50  20 af e4      jsr $e4af
$13:bb53  c8            iny
$13:bb54  0c c0 ea      tsb $eac0
$13:bb57  07 50         ora [$50]
$13:bb59  08            php
$13:bb5a  a4 62         ldy $62
$13:bb5c  30 cf         bmi $bb2d
$13:bb5e  eb            xba
$13:bb5f  04 80         tsb $80
$13:bb61  0c 00 60      tsb $6000
$13:bb64  9c 4e 27      stz $274e
$13:bb67  d3 6a         cmp ($6a,s),y
$13:bb69  1d 05 1c      ora $1c05,x
$13:bb6c  4e f0 b8      lsr $b8f0
$13:bb6f  3c 8e fd      bit $fd8e,x
$13:bb72  36 b3         rol $b3,x
$13:bb74  be 8c 72      ldx $728c,y
$13:bb77  90 38         bcc $bbb1
$13:bb79  14 32         trb $32
$13:bb7b  10 2c         bpl $bba9
$13:bb7d  05 03         ora $03
$13:bb7f  85 0f         sta $0f
$13:bb81  f0 1a         beq $bb9d
$13:bb83  5a            phy
$13:bb84  02 c0         cop #$c0
$13:bb86  05 a4         ora $a4
$13:bb88  34 71         bit $71,x
$13:bb8a  8e 44 20      stx $2044
$13:bb8d  12 88         ora ($88)
$13:bb8f  c5 52         cmp $52
$13:bb91  79 b2 bf      adc $bfb2,y
$13:bb94  53 6f         eor ($6f,s),y
$13:bb96  d2 a9         cmp ($a9)
$13:bb98  e4 52         cpx $52
$13:bb9a  31 08         and ($08),y
$13:bb9c  57 03         eor [$03],y
$13:bb9e  74 26         stz $26,x
$13:bba0  93 cb         sta ($cb,s),y
$13:bba2  95 fb         sta $fb,x
$13:bba4  e3 7e         sbc $7e,s
$13:bba6  c7 cf         cmp [$cf]
$13:bba8  29 d1 89      and #$89d1
$13:bbab  61 7c         adc ($7c,x)
$13:bbad  15 c1         ora $c1,x
$13:bbaf  7e 80 50      ror $5080,x
$13:bbb2  8e 4a 71      stx $714a
$13:bbb5  03 e7         ora $e7,s
$13:bbb7  8f 44 e3 e9   sta $e9e344
$13:bbbb  eb            xba
$13:bbbc  e0 40 35      cpx #$3540
$13:bbbf  73 bc         adc ($bc,s),y
$13:bbc1  8e 5e db      stx $db5e
$13:bbc4  60            rts
$13:bbc5  8d c6 5a      sta $5ac6
$13:bbc8  21 01         and ($01,x)
$13:bbca  80 8f         bra $bb5b
$13:bbcc  43 ff         eor $ff,s
$13:bbce  00 e2         brk #$e2
$13:bbd0  40            rti
$13:bbd1  2d 10 08      and $0810
$13:bbd4  fc 01 74      jsr ($7401,x)
$13:bbd7  01 e4         ora ($e4,x)
$13:bbd9  e2 c1         sep #$c1
$13:bbdb  fc 58 0a      jsr ($0a58,x)
$13:bbde  2d 17 a7      and $a717
$13:bbe1  9d d9 e6      sta $e6d9,x
$13:bbe4  ef b5 fc c6   sbc $c6fcb5
$13:bbe8  3f fb 64 57   and $5764fb,x
$13:bbec  85 9e         sta $9e
$13:bbee  01 ea         ora ($ea,x)
$13:bbf0  a0 78 f0      ldy #$f078
$13:bbf3  3e 4c 07      rol $074c,x
$13:bbf6  82 81 60      brl $1c7a
$13:bbf9  80 7e         bra $bc79
$13:bbfb  ec 14 48      cpx $4814
$13:bbfe  27 2e         and [$2e]
$13:bc00  17 aa         ora [$aa],y
$13:bc02  c5 e4         cmp $e4
$13:bc04  31 9d         and ($9d),y
$13:bc06  3a            dec a
$13:bc07  75 d2         adc $d2,x
$13:bc09  7f eb d3 fd   adc $fdd3eb,x
$13:bc0d  ae 1c 36      ldx $361c
$13:bc10  00 b9         brk #$b9
$13:bc12  c3 e7         cmp $e7,s
$13:bc14  80 f8         bra $bc0e
$13:bc16  d0 3e         bne $bc56
$13:bc18  13 0b         ora ($0b,s),y
$13:bc1a  84 83         sty $83
$13:bc1c  9d 40 af      sta $af40,x
$13:bc1f  41 b6         eor ($b6,x)
$13:bc21  db            stp
$13:bc22  29 65 93      and #$9365
$13:bc25  e0 e8 0b      cpx #$0be8
$13:bc28  07 01         ora [$01]
$13:bc2a  5e 03 d1      lsr $d103,x
$13:bc2d  ff 41 a9 d0   sbc $d0a941,x
$13:bc31  2c f4 12      bit $12f4
$13:bc34  f9 00 c8      sbc $c800,y
$13:bc37  27 be         and [$be]
$13:bc39  71 20         adc ($20),y
$13:bc3b  2e 84 60      rol $6084
$13:bc3e  9e 02 87      stz $8702,x
$13:bc41  37 04         and [$04],y
$13:bc43  e2 00         sep #$00
$13:bc45  6c 09 f4      jmp ($f409)
$13:bc48  f0 4a         beq $bc94
$13:bc4a  1d 8a 05      ora $058a,x
$13:bc4d  c2 c9         rep #$c9
$13:bc4f  50 ae         bvc $bbff
$13:bc51  48            pha
$13:bc52  a7 d4         lda [$d4]
$13:bc54  4b            phk
$13:bc55  e4 e2         cpx $e2
$13:bc57  70 4f         bvs $bca8
$13:bc59  04 88         tsb $88
$13:bc5b  6f a0 19 a8   adc $a819a0
$13:bc5f  06 8a         asl $8a
$13:bc61  01 40         ora ($40,x)
$13:bc63  46 1d         lsr $1d
$13:bc65  82 c1 58      brl $1529
$13:bc68  bc 49 a7      ldy $a749,x
$13:bc6b  d1 18         cmp ($18),y
$13:bc6d  fd a6 5f      sbc $5fa6,x
$13:bc70  12 8b         ora ($8b)
$13:bc72  4a            lsr a
$13:bc73  a1 44         lda ($44,x)
$13:bc75  90 35         bcc $bcac
$13:bc77  06 01         asl $01
$13:bc79  5c 2e b0 a8   jml $a8b02e
$13:bc7d  40            rti
$13:bc7e  25 10         and $10
$13:bc80  09 a4 02      ora #$02a4
$13:bc83  39 00 82      and $8200,y
$13:bc86  23 c2         and $c2,s
$13:bc88  0d 08 87      ora $8708
$13:bc8b  44 23 d2      mvp $d2,$23
$13:bc8e  09 f4 9a      ora #$9af4
$13:bc91  71 0e         adc ($0e),y
$13:bc93  9a            txs
$13:bc94  4e 29 82      lsr $8229
$13:bc97  8c 34 a1      sty $a134
$13:bc9a  a8            tay
$13:bc9b  11 e1         ora ($e1),y
$13:bc9d  18            clc
$13:bc9e  4b            phk
$13:bc9f  0c fa 00      tsb $00fa
$13:bca2  bc f6 11      ldy $11f6,x
$13:bca5  e7 2c         sbc [$2c]
$13:bca7  1c 2b e5      trb $e52b
$13:bcaa  0b            phd
$13:bcab  f9 40 be      sbc $be40,y
$13:bcae  36 43         rol $43,x
$13:bcb0  01 fc         ora ($fc,x)
$13:bcb2  61 7b         adc ($7b,x)
$13:bcb4  84 20         sty $20
$13:bcb6  30 18         bmi $bcd0
$13:bcb8  1b            tcs
$13:bcb9  cc 1e 21      cpy $211e
$13:bcbc  3e 80 cf      rol $cf80,x
$13:bcbf  e0 11 f7      cpx #$f711
$13:bcc2  0f bd 82 0f   ora $0f82bd
$13:bcc6  80 e3         bra $bcab
$13:bcc8  f0 2d         beq $bcf7
$13:bcca  fa            plx
$13:bccb  0b            phd
$13:bccc  7e 43 ef      ror $ef43,x
$13:bccf  08            php
$13:bcd0  bd e1 27      lda $27e1,x
$13:bcd3  bc 27 f7      ldy $f727,x
$13:bcd6  bb            tyx
$13:bcd7  c8            iny
$13:bcd8  1c 10 18      trb $1810
$13:bcdb  34 0a         bit $0a,x
$13:bcdd  19 04 1c      ora $1c04,y
$13:bce0  84 62         sty $62
$13:bce2  10 2f         bpl $bd13
$13:bce4  e5 d8         sbc $d8
$13:bce6  7f e7 dc 1e   adc $1edce7,x
$13:bcea  08            php
$13:bceb  8a            txa
$13:bcec  09 e5 c3      ora #$c3e5
$13:bcef  2a            rol a
$13:bcf0  48            pha
$13:bcf1  88            dey
$13:bcf2  2f d0 0a 11   and $110ad0
$13:bcf6  c9 4e 20      cmp #$204e
$13:bcf9  7c f5 40      jmp ($40f5,x)
$13:bcfc  9c 7d 43      stz $437d
$13:bcff  e8            inx
$13:bd00  b2 79         lda ($79)
$13:bd02  0c 0c 8e      tsb $8e0c
$13:bd05  10 78         bpl $bd7f
$13:bd07  22 d4 46 45   jsl $4546d4
$13:bd0b  00 81         brk #$81
$13:bd0d  40            rti
$13:bd0e  17 c1         ora [$c1],y
$13:bd10  05 08         ora $08
$13:bd12  04 12         tsb $12
$13:bd14  e9 63 cd      sbc #$cd63
$13:bd17  f4 75 de      pea $de75
$13:bd1a  c8            iny
$13:bd1b  f4 32 71      pea $7132
$13:bd1e  98            tya
$13:bd1f  b0 48         bcs $bd69
$13:bd21  30 08         bmi $bd2b
$13:bd23  b1 de         lda ($de),y
$13:bd25  48            pha
$13:bd26  27 d1         and [$d1]
$13:bd28  06 a8         asl $a8
$13:bd2a  7c a0 16      jmp ($16a0,x)
$13:bd2d  48            pha
$13:bd2e  07 62         ora [$62]
$13:bd30  01 e0         ora ($e0,x)
$13:bd32  80 36         bra $bd6a
$13:bd34  c2 b5         rep #$b5
$13:bd36  f0 dc         beq $bd14
$13:bd38  fa            plx
$13:bd39  2e 71 bd      rol $bd71
$13:bd3c  c7 aa         cmp [$aa]
$13:bd3e  93 73         sta ($73,s),y
$13:bd40  97 ca         sta [$ca],y
$13:bd42  c1 e0         cmp ($e0,x)
$13:bd44  43 08         eor $08,s
$13:bd46  7c 02 2f      jmp ($2f02,x)
$13:bd49  00 f2         brk #$f2
$13:bd4b  c0 62 b0      cpy #$b062
$13:bd4e  08            php
$13:bd4f  64 02         stz $02
$13:bd51  28            plp
$13:bd52  fe 16 28      inc $2816,x
$13:bd55  22 d3 00 15   jsl $1500d3
$13:bd59  1a            inc a
$13:bd5a  00 64         brk #$64
$13:bd5c  78            sei
$13:bd5d  1c 00 89      trb $8900
$13:bd60  c0 38 18      cpy #$1838
$13:bd63  01 28         ora ($28,x)
$13:bd65  87 00         sta [$00]
$13:bd67  38            sec
$13:bd68  31 49         and ($49),y
$13:bd6a  85 52         sta $52
$13:bd6c  e1 aa         sbc ($aa,x)
$13:bd6e  f4 57 ab      pea $ab57
$13:bd71  d0 b9         bne $bd2c
$13:bd73  d4 df         pei ($df)
$13:bd75  65 bb         adc $bb
$13:bd77  e0 e6 bf      cpx #$bfe6
$13:bd7a  54 c8 04      mvn $04,$c8
$13:bd7d  3a            dec a
$13:bd7e  01 16         ora ($16,x)
$13:bd80  80 68         bra $bdea
$13:bd82  e0 5c 78      cpx #$785c
$13:bd85  15 3e         ora $3e,x
$13:bd87  04 5f         tsb $5f
$13:bd89  06 48         asl $48
$13:bd8b  42 08         wdm #$08
$13:bd8d  41 06         eor ($06,x)
$13:bd8f  93 41         sta ($41,s),y
$13:bd91  af 51 ab 64   lda $64ab51
$13:bd95  b2 77         lda ($77)
$13:bd97  11 91         ora ($91),y
$13:bd99  4f a3 91 c2   eor $c291a3
$13:bd9d  08            php
$13:bd9e  46 60         lsr $60
$13:bda0  13 98         ora ($98,s),y
$13:bda2  05 96         ora $96
$13:bda4  01 73         ora ($73,x)
$13:bda6  90 5f         bcc $be07
$13:bda8  a2 08 26      ldx #$2608
$13:bdab  88            dey
$13:bdac  44 23 11      mvp $11,$23
$13:bdaf  89 c4 e2      bit #$e2c4
$13:bdb2  f1 78         sbc ($78),y
$13:bdb4  f8            sed
$13:bdb5  7c 24 12      jmp ($1224,x)
$13:bdb8  03 7f         ora $7f,s
$13:bdba  4c 3f 9e      jmp $9e3f
$13:bdbd  0f f7 06 fd   ora $fd06f7
$13:bdc1  23 9e         and $9e,s
$13:bdc3  48            pha
$13:bdc4  a7 90         lda [$90]
$13:bdc6  43 b8         eor $b8,s
$13:bdc8  1b            tcs
$13:bdc9  44 3c 6a      mvp $6a,$3c
$13:bdcc  2d 87 4c      and $4c87
$13:bdcf  24 33         bit $33
$13:bdd1  ee 0f fa      inc $fa0f
$13:bdd4  c1 7e         cmp ($7e,x)
$13:bdd6  8c 47 20      sty $2047
$13:bdd9  84 d0         sty $d0
$13:bddb  51 6e         eor ($6e),y
$13:bddd  03 f1         ora $f1,s
$13:bddf  40            rti
$13:bde0  bc 48 27      ldy $2748,x
$13:bde3  0d 30 42      ora $4230
$13:bde6  01 cc         ora ($cc,x)
$13:bde8  14 5e         trb $5e
$13:bdea  6d 10 58      adc $5810
$13:bded  7f e0 1c b9   adc $b91ce0,x
$13:bdf1  65 1a         adc $1a
$13:bdf3  57 17         eor [$17],y
$13:bdf5  9c 42 63      stz $6342
$13:bdf8  d0 68         bne $be62
$13:bdfa  4b            phk
$13:bdfb  bc 0d e6      ldy $e60d,x
$13:bdfe  02 13         cop #$13
$13:be00  5b            tcd
$13:be01  6f e8 19 db   adc $db19e8
$13:be05  17 36         ora [$36],y
$13:be07  65 c5         adc $c5
$13:be09  9d 4f 78      sta $784f,x
$13:be0c  41 30         eor ($30,x)
$13:be0e  bb            tyx
$13:be0f  62 e6 dc      per $9af8
$13:be12  b6 f7         ldx $f7,y
$13:be14  46 21         lsr $21
$13:be16  13 88         ora ($88,s),y
$13:be18  c7 e2         cmp [$e2]
$13:be1a  d0 2f         bne $be4b
$13:be1c  08            php
$13:be1d  64 10         stz $10
$13:be1f  6e 10 78      ror $7810
$13:be22  1c 0c 5c      trb $5c0c
$13:be25  b1 c1         lda ($c1),y
$13:be27  b0 c3         bcs $bdec
$13:be29  87 46         sta [$46]
$13:be2b  de 88 0c      dec $0c88,x
$13:be2e  06 0f         asl $0f
$13:be30  06 ff         asl $ff
$13:be32  7e 09 f5      ror $f509,x
$13:be35  87 2e         sta [$2e]
$13:be37  0c 12 21      tsb $2112
$13:be3a  01 80         ora ($80,x)
$13:be3c  58            cli
$13:be3d  2c 16 1b      bit $1b16
$13:be40  03 a4         ora $a4,s
$13:be42  21 b0         and ($b0,x)
$13:be44  c8            iny
$13:be45  7c 34 9a      jmp ($9a34,x)
$13:be48  30 c2         bmi $be0c
$13:be4a  c0 58 10      cpy #$1058
$13:be4d  42 7e         wdm #$7e
$13:be4f  13 d8         ora ($d8,s),y
$13:be51  3b            tsc
$13:be52  c2 06         rep #$06
$13:be54  6f 14 30 95   adc $953014
$13:be58  c8            iny
$13:be59  e2 05         sep #$05
$13:be5b  b0 2d         bcs $be8a
$13:be5d  81 fc         sta ($fc,x)
$13:be5f  10 c2         bpl $be23
$13:be61  71 09         adc ($09),y
$13:be63  84 06         sty $06
$13:be65  62 8d 04      per $c2f5
$13:be68  e0 8e c0      cpx #$c08e
$13:be6b  b0 34         bcs $bea1
$13:be6d  18            clc
$13:be6e  0c 0a 04      tsb $040a
$13:be71  3c 05 b0      bit $b005,x
$13:be74  4c 62 31      jmp $3162
$13:be77  18            clc
$13:be78  08            php
$13:be79  f4 20 50      pea $5020
$13:be7c  0a            asl a
$13:be7d  12 8c         ora ($8c)
$13:be7f  5d 25 30      eor $3025,x
$13:be82  88            dey
$13:be83  46 20         lsr $20
$13:be85  18            clc
$13:be86  08            php
$13:be87  07 83         ora [$83]
$13:be89  01 58         ora ($58,x)
$13:be8b  e0 65 ba      cpx #$ba65
$13:be8e  1d 3a 87      ora $873a,x
$13:be91  b3 81         lda ($81,s),y
$13:be93  7a            ply
$13:be94  f5 45         sbc $45,x
$13:be96  ba            tsx
$13:be97  dc 08 05      jml [$0508]
$13:be9a  c2 01         rep #$01
$13:be9c  3c 80 4b      bit $4b80,x
$13:be9f  e0 1a f8      cpx #$f81a
$13:bea2  05 fe         ora $fe
$13:bea4  81 3d         sta ($3d,x)
$13:bea6  94 4e         sty $4e,x
$13:bea8  40            rti
$13:bea9  a3 08         lda $08,s
$13:beab  30 ad         bmi $be5a
$13:bead  22 11 04 31   jsl $310411
$13:beb1  9b            txy
$13:beb2  c7 8c         cmp [$8c]
$13:beb4  61 60         adc ($60,x)
$13:beb6  90 5a         bcc $bf12
$13:beb8  28            plp
$13:beb9  0f d3 84 46   ora $4684d3
$13:bebd  1d c2 11      ora $11c2,x
$13:bec0  43 b0         eor $b0,s
$13:bec2  9f c0 38 2b   sta $2b38c0,x
$13:bec6  50 82         bvc $be4a
$13:bec8  41 86         eor ($86,x)
$13:beca  05 06         ora $06
$13:becc  83 45         sta $45,s
$13:bece  23 92         and $92,s
$13:bed0  09 c4 8e      ora #$8ec4
$13:bed3  74 61         stz $61,x
$13:bed5  66 08         ror $08
$13:bed7  41 18         eor ($18,x)
$13:bed9  20 9e 00      jsr $009e
$13:bedc  5b            tcd
$13:bedd  03 16         ora $16,s
$13:bedf  e1 f8         sbc ($f8,x)
$13:bee1  27 e0         and [$e0]
$13:bee3  31 16         and ($16),y
$13:bee5  e1 0c         sbc ($0c,x)
$13:bee7  86 46         stx $46
$13:bee9  05 a1         ora $a1
$13:beeb  10 98         bpl $be85
$13:beed  1e c4 dc      asl $dcc4,x
$13:bef0  b0 f8         bcs $beea
$13:bef2  3c 7e 1e      bit $1e7e,x
$13:bef5  88            dey
$13:bef6  09 fa 2c      ora #$2cfa
$13:bef9  01 85         ora ($85,x)
$13:befb  40            rti
$13:befc  a0 1e 42      ldy #$421e
$13:beff  d1 08         cmp ($08),y
$13:bf01  b8            clv
$13:bf02  48            pha
$13:bf03  26 80         rol $80
$13:bf05  b5 c0         lda $c0,x
$13:bf07  70 3c         bvs $bf45
$13:bf09  1f 0f 87 e1   ora $e1870f,x
$13:bf0d  50 3f         bvc $bf4e
$13:bf0f  c5 60         cmp $60
$13:bf11  03 02         ora $02,s
$13:bf13  09 04 3c      ora #$3c04
$13:bf16  84 82         sty $82
$13:bf18  41 03         eor ($03,x)
$13:bf1a  a1 d1         lda ($d1,x)
$13:bf1c  28            plp
$13:bf1d  8c e1 67      sty $67e1
$13:bf20  81 c8         sta ($c8,x)
$13:bf22  20 e8 90      jsr $90e8
$13:bf25  8f cf e7 97   sta $97e7cf
$13:bf29  f9 dd fe      sbc $fedd,y
$13:bf2c  ff ff 65 80   sbc $8065ff,x
$13:bf30  30 16         bmi $bf48
$13:bf32  a0 97 08      ldy #$0897
$13:bf35  a4 13         ldy $13
$13:bf37  81 c2         sta ($c2,x)
$13:bf39  95 48         sta $48,x
$13:bf3b  a0 10 18      ldy #$1810
$13:bf3e  8c 44 18      sty $1844
$13:bf41  0a            asl a
$13:bf42  41 55         eor ($55,x)
$13:bf44  0c f3 fd      tsb $fdf3
$13:bf47  dc ff 7f      jml [$7fff]
$13:bf4a  bf fe ef fc   lda $fceffe,x
$13:bf4e  76 05         ror $05,x
$13:bf50  3e 80 a3      rol $a380,x
$13:bf53  82 02 72      brl $3158
$13:bf56  07 b0         ora [$b0]
$13:bf58  c1 df         cmp ($df,x)
$13:bf5a  42 fe         wdm #$fe
$13:bf5c  ec ad ae      cpx $aead
$13:bf5f  1f f0 fe 41   ora $41fef0,x
$13:bf63  3f d0 af a4   and $a4afd0,x
$13:bf67  2f e7 0c e4   and $e40ce7
$13:bf6b  41 df         eor ($df,x)
$13:bf6d  a8            tay
$13:bf6e  f7 07         sbc [$07],y
$13:bf70  a8            tay
$13:bf71  14 21         trb $21
$13:bf73  62 11 78      per $3787
$13:bf76  84 be         sty $be
$13:bf78  46 88         lsr $88
$13:bf7a  0b            phd
$13:bf7b  fd 3e 7e      sbc $7e3e,x
$13:bf7e  c5 08         cmp $08
$13:bf80  f8            sed
$13:bf81  84 a1         sty $a1
$13:bf83  f0 08         beq $bf8d
$13:bf85  fc 0d 18      jsr ($180d,x)
$13:bf88  23 80         and $80,s
$13:bf8a  8f 92 c1 00   sta $00c192
$13:bf8e  90 e8         bcc $bf78
$13:bf90  7c 62 3f      jmp ($3f62,x)
$13:bf93  10 8f         bpl $bf24
$13:bf95  cc 27 f2      cpy $f227
$13:bf98  04 71         tsb $71
$13:bf9a  80 6a         bra $c006
$13:bf9c  4a            lsr a
$13:bf9d  b1 08         lda ($08),y
$13:bf9f  24 3e         bit $3e
$13:bfa1  1f 0c 21 84   ora $84210c,x
$13:bfa5  0e c3 60      asl $60c3
$13:bfa8  3d 02 bc      and $bc02,x
$13:bfab  64 f0         stz $f0
$13:bfad  48            pha
$13:bfae  1c 3e 1a      trb $1a3e
$13:bfb1  74 01         stz $01,x
$13:bfb3  48            pha
$13:bfb4  58            cli
$13:bfb5  20 27 c1      jsr $c127
$13:bfb8  80 64         bra $c01e
$13:bfba  72 10         adc ($10)
$13:bfbc  68            pla
$13:bfbd  30 70         bmi $c02f
$13:bfbf  60            rts
$13:bfc0  f0 12         beq $bfd4
$13:bfc2  08            php
$13:bfc3  0a            asl a
$13:bfc4  46 03         lsr $03
$13:bfc6  01 c8         ora ($c8,x)
$13:bfc8  45 d2         eor $d2
$13:bfca  43 06         eor $06,s
$13:bfcc  11 8c         ora ($8c),y
$13:bfce  c6 01         dec $01
$13:bfd0  30 4d         bmi $c01f
$13:bfd2  88            dey
$13:bfd3  79 60 b0      adc $b060,y
$13:bfd6  48            pha
$13:bfd7  4c 26 01      jmp $0126
$13:bfda  0e 12 b3      asl $b312
$13:bfdd  ec 21 70      cpx $7021
$13:bfe0  08            php
$13:bfe1  32 68         and ($68)
$13:bfe3  85 23         sta $23
$13:bfe5  bc f6 58      ldy $58f6,x
$13:bfe8  ac 42 90      ldy $9042
$13:bfeb  90 40         bcc $c02d
$13:bfed  17 01         ora [$01],y
$13:bfef  10 80         bpl $bf71
$13:bff1  40            rti
$13:bff2  85 23         sta $23
$13:bff4  12 80         ora ($80)
$13:bff6  47 05         eor [$05]
$13:bff8  22 d5 28 c3   jsl $c328d5
$13:bffc  78            sei
$13:bffd  45 25         eor $25
$13:bfff  20 90 4c      jsr $4c90
$13:c002  1b            tcs
$13:c003  20 29 19      jsr $1929
$13:c006  c4 c2         cpy $c2
$13:c008  63 10         adc $10,s
$13:c00a  4e 84 21      lsr $2184
$13:c00d  10 0f         bpl $c01e
$13:c00f  27 9c         and [$9c]
$13:c011  c4 26         cpy $26
$13:c013  2a            rol a
$13:c014  d1 91         cmp ($91),y
$13:c016  35 40         and $40,x
$13:c018  52 2f         eor ($2f)
$13:c01a  f0 86         beq $bfa2
$13:c01c  1c 04 cc      trb $cc04
$13:c01f  41 14         eor ($14,x)
$13:c021  74 80         stz $80,x
$13:c023  64 03         stz $03
$13:c025  20 66 0f      jsr $0f66
$13:c028  0f 7b 63 fe   ora $fe637b
$13:c02c  81 5f         sta ($5f,x)
$13:c02e  53 06         eor ($06,s),y
$13:c030  66 38         ror $38
$13:c032  83 d0         sta $d0,s
$13:c034  cc 31 f8      cpy $f831
$13:c037  fe 5c 3f      inc $3f5c,x
$13:c03a  90 0f         bcc $c04b
$13:c03c  e4 13         cpx $13
$13:c03e  f1 f8         sbc ($f8),y
$13:c040  20 e0 d9      jsr $d9e0
$13:c043  e3 13         sbc $13,s
$13:c045  83 78         sta $78,s
$13:c047  43 a3         eor $a3,s
$13:c049  d0 78         bne $c0c3
$13:c04b  fc 06 1e      jsr ($1e06,x)
$13:c04e  b2 16         lda ($16)
$13:c050  01 4f         ora ($4f,x)
$13:c052  cf e1 01 8f   cmp $8f01e1
$13:c056  c0 10 80      cpy #$8010
$13:c059  78            sei
$13:c05a  58            cli
$13:c05b  a0 68 63      ldy #$6368
$13:c05e  11 8f         ora ($8f),y
$13:c060  87 e3         sta [$e3]
$13:c062  c1 f0         cmp ($f0,x)
$13:c064  80 70         bra $c0d6
$13:c066  09 68 4f      ora #$4f68
$13:c069  0f 01 5c 0a   ora $0a5c01
$13:c06d  e0 98 5a      cpx #$5a98
$13:c070  07 02         ora [$02]
$13:c072  a1 c0         lda ($c0,x)
$13:c074  c6 50         dec $50
$13:c076  34 b6         bit $b6,x
$13:c078  0a            asl a
$13:c079  e4 f2         cpx $f2
$13:c07b  4f 1f 8c 41   eor $418c1f
$13:c07f  e0 f0 09      cpx #$09f0
$13:c082  ff fd 7e 37   sbc $377efd,x
$13:c086  f8            sed
$13:c087  fd fe 07      sbc $07fe,x
$13:c08a  3f 42 8a f4   and $f48a42,x
$13:c08e  20 0f d0      jsr $d00f
$13:c091  81 40         sta ($40,x)
$13:c093  e0 70 28      cpx #$2870
$13:c096  2c 1a 35      bit $351a
$13:c099  1c fa 7e      trb $7efa
$13:c09c  23 1e         and $1e,s
$13:c09e  0f 04 03 fd   ora $fd0304
$13:c0a2  ff fe 38 03   sbc $0338fe,x
$13:c0a6  fd f8 ff      sbc $fff8,x
$13:c0a9  78            sei
$13:c0aa  0a            asl a
$13:c0ab  40            rti
$13:c0ac  57 06         eor [$06],y
$13:c0ae  e8            inx
$13:c0af  0e 96 70      asl $7096
$13:c0b2  3f 02 04 bd   and $bd0402,x
$13:c0b6  85 ea         sta $ea
$13:c0b8  2f b9 88 5f   and $5f88b9
$13:c0bc  1e a4 40      asl $40a4,x
$13:c0bf  50 89         bvc $c04a
$13:c0c1  4e 2f 81      lsr $812f
$13:c0c4  78            sei
$13:c0c5  32 b4         and ($b4)
$13:c0c7  0a            asl a
$13:c0c8  05 06         ora $06
$13:c0ca  83 41         sta $41,s
$13:c0cc  e0 a2 fb      cpx #$fba2
$13:c0cf  6a            ror a
$13:c0d0  02 28         cop #$28
$13:c0d2  cc b1 68      cpy $68b1
$13:c0d5  c8            iny
$13:c0d6  0a            asl a
$13:c0d7  f3 01         sbc ($01,s),y
$13:c0d9  68            pla
$13:c0da  82 44 20      brl $e121
$13:c0dd  2f 93 8c 40   and $408c93
$13:c0e1  23 30         and $30,s
$13:c0e3  12 70         ora ($70)
$13:c0e5  13 86         ora ($86,s),y
$13:c0e7  18            clc
$13:c0e8  ce 04 08      dec $0804
$13:c0eb  9d 46 03      sta $0346,x
$13:c0ee  1b            tcs
$13:c0ef  3e 0c 0e      rol $0e0c,x
$13:c0f2  13 08         ora ($08,s),y
$13:c0f4  82 41 20      brl $e138
$13:c0f7  70 78         bvs $c171
$13:c0f9  cc 1e 30      cpy $301e
$13:c0fc  4e 58 45      lsr $4558
$13:c0ff  3d 24 27      and $2724,x
$13:c102  c0 8c 9d      cpy #$9d8c
$13:c105  85 9a         sta $9a
$13:c107  2f b7 3b 0c   and $0c3bb7
$13:c10b  20 57 27      jsr $2757
$13:c10e  70 5b         bvs $c16b
$13:c110  d2 e4         cmp ($e4)
$13:c112  17 20         ora [$20],y
$13:c114  1a            inc a
$13:c115  0c 03 60      tsb $6003
$13:c118  59 ac 77      eor $77ac,y
$13:c11b  06 bb         asl $bb
$13:c11d  60            rts
$13:c11e  9d e1 c6      sta $c6e1,x
$13:c121  a2 7b b5      ldx #$b57b
$13:c124  5e eb e5      lsr $e5eb,x
$13:c127  b1 ee         lda ($ee),y
$13:c129  18            clc
$13:c12a  29 c0 bd      and #$bdc0
$13:c12d  30 50         bmi $c17f
$13:c12f  0e 34 02      asl $0234
$13:c132  89 82 03      bit #$0382
$13:c135  80 18         bra $c14f
$13:c137  05 76         ora $76
$13:c139  82 03 d9      brl $9a3f
$13:c13c  88            dey
$13:c13d  39 e0 3c      and $3ce0,y
$13:c140  6f 70 d4 bf   adc $bfd470
$13:c144  d4 4b         pei ($4b)
$13:c146  e4 e2         cpx $e2
$13:c148  f8            sed
$13:c149  20 ec 06      jsr $06ec
$13:c14c  02 81         cop #$81
$13:c14e  c0 90 58      cpy #$5890
$13:c151  22 17 08 44   jsl $440817
$13:c155  e0 ae 10      cpx #$10ae
$13:c158  48            pha
$13:c159  e4 0e         cpx $0e
$13:c15b  3e 20 f5      rol $f520,x
$13:c15e  20 40 d2      jsr $d240
$13:c161  21 08         and ($08,x)
$13:c163  3a            dec a
$13:c164  94 60         sty $60,x
$13:c166  f2 2f         sbc ($2f)
$13:c168  c2 38         rep #$38
$13:c16a  84 1e         sty $1e
$13:c16c  0f 0f 42 8c   ora $8c420f
$13:c170  7d 12 33      adc $3312,x
$13:c173  f0 80         beq $c0f5
$13:c175  70 0a         bvs $c181
$13:c177  41 20         eor ($20,x)
$13:c179  e8            inx
$13:c17a  44 3e 15      mvp $15,$3e
$13:c17d  0b            phd
$13:c17e  41 dc         eor ($dc,x)
$13:c180  a1 81         lda ($81,x)
$13:c182  01 48         ora ($48,x)
$13:c184  87 83         sta [$83]
$13:c186  c1 f0         cmp ($f0,x)
$13:c188  52 87         eor ($87)
$13:c18a  c3 f0         cmp $f0,s
$13:c18c  a9 1f e1      lda #$e11f
$13:c18f  bc a1 90      ldy $90a1,x
$13:c192  f8            sed
$13:c193  d4 7a         pei ($7a)
$13:c195  75 3e         adc $3e,x
$13:c197  9a            txs
$13:c198  5f 17 41 64   eor $644117,x
$13:c19c  b2 1b         lda ($1b)
$13:c19e  8a            txa
$13:c19f  01 0f         ora ($0f,x)
$13:c1a1  80 c7         bra $c16a
$13:c1a3  e0 33 f8      cpx #$f833
$13:c1a6  1d fd 92      ora $92fd,x
$13:c1a9  11 bb         ora ($bb),y
$13:c1ab  fa            plx
$13:c1ac  3c ba 1d      bit $1dba,x
$13:c1af  0b            phd
$13:c1b0  44 a3 c9      mvp $c9,$a3
$13:c1b3  44 a1 40      mvp $40,$a1
$13:c1b6  9b            txy
$13:c1b7  44 9f 29      mvp $29,$9f
$13:c1ba  07 c3         ora [$c3]
$13:c1bc  a1 f8         lda ($f8,x)
$13:c1be  fc 7f 3f      jsr ($3f7f,x)
$13:c1c1  9f e7 49 37   sta $3749e7,x
$13:c1c5  81 b4         sta ($b4,x)
$13:c1c7  50 67         bvc $c230
$13:c1c9  a8            tay
$13:c1ca  c1 df         cmp ($df,x)
$13:c1cc  03 0b         ora $0b,s
$13:c1ce  87 bc         sta [$bc]
$13:c1d0  0d e8 0f      ora $0fe8
$13:c1d3  40            rti
$13:c1d4  81 81         sta ($81,x)
$13:c1d6  ca            dex
$13:c1d7  1e c2 00      asl $00c2,x
$13:c1da  7b            tdc
$13:c1db  c2 03         rep #$03
$13:c1dd  00 75         brk #$75
$13:c1df  10 7c         bpl $c25d
$13:c1e1  06 8e         asl $8e
$13:c1e3  11 01         ora ($01),y
$13:c1e5  82 c2 61      brl $23aa
$13:c1e8  92 09         sta ($09)
$13:c1ea  e4 8a         cpx $8a
$13:c1ec  7d 0c 8b      adc $8b0c,x
$13:c1ef  43 21         eor $21,s
$13:c1f1  30 08         bmi $c1fb
$13:c1f3  90 a0         bcc $c195
$13:c1f5  20 ab 20      jsr $20ab
$13:c1f8  81 cb         sta ($cb,x)
$13:c1fa  20 72 68      jsr $6872
$13:c1fd  0c 12 1b      tsb $1b12
$13:c200  08            php
$13:c201  8f 40 13 c3   sta $c31340
$13:c205  08            php
$13:c206  e8            inx
$13:c207  66 2e         ror $2e
$13:c209  1d 4d 86      ora $864d,x
$13:c20c  03 f1         ora $f1,s
$13:c20e  38            sec
$13:c20f  cf 5e 3f 93   cmp $933f5e
$13:c213  8f 24 02 f1   sta $f10224
$13:c217  50 94         bvc $c1ad
$13:c219  44 31 99      mvp $99,$31
$13:c21c  0e 67 42      asl $4267
$13:c21f  0c 51 0b      tsb $0b51
$13:c222  c4 e2         cpy $e2
$13:c224  c1 18         cmp ($18,x)
$13:c226  6f 8c 1e 09   adc $091e8c
$13:c22a  3c a4 53      bit $53a4,x
$13:c22d  e4 d3         cpx $d3
$13:c22f  08            php
$13:c230  ac ee 5d      ldy $5dee
$13:c233  31 89         and ($89),y
$13:c235  4e 22 37      lsr $3722
$13:c238  23 78         and $78,s
$13:c23a  50 ef         bvc $c22b
$13:c23c  f3 0b         sbc ($0b,s),y
$13:c23e  fc 3e 7f      jsr ($7f3e,x)
$13:c241  00 9d         brk #$9d
$13:c243  c0 26 30      cpy #$3026
$13:c246  79 fc 35      adc $35fc,y
$13:c249  9c 1f 0e      stz $0e1f
$13:c24c  84 7b         sty $7b
$13:c24e  9b            txy
$13:c24f  c9 9d 60      cmp #$609d
$13:c252  ab            plb
$13:c253  96 ad         stx $ad,y
$13:c255  d7 1b         cmp [$1b],y
$13:c257  69 0e e6      adc #$e60e
$13:c25a  49 d1 e1      eor #$e1d1
$13:c25d  e1 ff         sbc ($ff,x)
$13:c25f  cd bf f7      cmp $f7bf
$13:c262  cf f6 13 dd   cmp $dd13f6
$13:c266  00 e3         brk #$e3
$13:c268  5c 2f d5 8b   jml $8bd52f
$13:c26c  fc 82 41      jsr ($4182,x)
$13:c26f  48            pha
$13:c270  8c 59 21      sty $2159
$13:c273  92 48         sta ($48)
$13:c275  64 52         stz $52
$13:c277  08            php
$13:c278  17 21         ora [$21],y
$13:c27a  40            rti
$13:c27b  56 20         lsr $20,x
$13:c27d  16 48         asl $48,x
$13:c27f  05 c2         ora $c2
$13:c281  01 30         ora ($30,x)
$13:c283  80 1b         bra $c2a0
$13:c285  08            php
$13:c286  3c 56 06      bit $0656,x
$13:c289  10 4c         bpl $c2d7
$13:c28b  29 90 cd      and #$cd90
$13:c28e  e6 c3         inc $c3
$13:c290  75 e2         adc $e2,x
$13:c292  ce 71 b1      dec $b171
$13:c295  df 0b f5 fa   cmp $faf50b,x
$13:c299  f1 00         sbc ($00),y
$13:c29b  e6 40         inc $40
$13:c29d  3f 50 84 10   and $108450,x
$13:c2a1  4f 64 13 98   eor $981364
$13:c2a5  03 f8         ora $f8,s
$13:c2a7  05 01         ora $01
$13:c2a9  92 b6         sta ($b6)
$13:c2ab  6e af 94      ror $94af
$13:c2ae  49 c4 e1      eor #$e1c4
$13:c2b1  98            tya
$13:c2b2  2f 64 94 4a   and $4a9464
$13:c2b6  1e ce f6      asl $f6ce,x
$13:c2b9  38            sec
$13:c2ba  0c 1e 03      tsb $031e
$13:c2bd  0f 81 43 82   ora $824381
$13:c2c1  61 04         adc ($04,x)
$13:c2c3  8e 42 0d      stx $0d42
$13:c2c6  81 10         sta ($10,x)
$13:c2c8  80 48         bra $c312
$13:c2ca  00 38         brk #$38
$13:c2cc  c9 0b 64      cmp #$640b
$13:c2cf  42 21         wdm #$21
$13:c2d1  fe 9c 0c      inc $0c9c,x
$13:c2d4  87 25         sta [$25]
$13:c2d6  7c c1 3c      jmp ($3cc1,x)
$13:c2d9  ac 0e ee      ldy $ee0e
$13:c2dc  b0 83         bcs $c261
$13:c2de  c0 20 63      cpy #$6320
$13:c2e1  ef 7b 3c 32   sbc $323c7b
$13:c2e5  78            sei
$13:c2e6  6f 09 3c 7e   adc $7e3c09
$13:c2ea  47 1f         eor [$1f]
$13:c2ec  88            dey
$13:c2ed  43 e1         eor $e1,s
$13:c2ef  90 32         bcc $c323
$13:c2f1  a1 40         lda ($40,x)
$13:c2f3  e7 e7         sbc [$e7]
$13:c2f5  f0 80         beq $c277
$13:c2f7  47 d0         eor [$d0]
$13:c2f9  62 eb 02      per $c5e7
$13:c2fc  a1 c2         lda ($c2,x)
$13:c2fe  21 91         and ($91,x)
$13:c300  88            dey
$13:c301  e4 d2         cpx $d2
$13:c303  71 e4         adc ($e4),y
$13:c305  fc 42 3e      jsr ($3e42,x)
$13:c308  13 0e         ora ($0e,s),y
$13:c30a  07 01         ora [$01]
$13:c30c  98            tya
$13:c30d  3f 0f e7 83   and $83e70f,x
$13:c311  f9 c0 fc      sbc $fcc0,y
$13:c314  40            rti
$13:c315  14 81         trb $81
$13:c317  f0 80         beq $c299
$13:c319  26 ca         rol $ca
$13:c31b  01 22         ora ($22,x)
$13:c31d  b1 4a         lda ($4a),y
$13:c31f  2c 11 5b      bit $5b11
$13:c322  85 22         sta $22
$13:c324  70 75         bvs $c39b
$13:c326  08            php
$13:c327  c4 1c         cpy $1c
$13:c329  a4 07         ldy $07
$13:c32b  d0 8e         bne $c2bb
$13:c32d  df e3 f7 f8   cmp $f8f7e3,x
$13:c331  7d fe 0e      adc $0efe,x
$13:c334  82 25 d9      brl $9c5c
$13:c337  40            rti
$13:c338  20 d0 68      jsr $68d0
$13:c33b  24 1a         bit $1a
$13:c33d  19 0e 9d      ora $9d0e,y
$13:c340  4f 12 a1 18   eor $18a112
$13:c344  f0 78         beq $c3be
$13:c346  1f 83 f8 ff   ora $fff883,x
$13:c34a  37 c3         and [$c3],y
$13:c34c  e1 fe         sbc ($fe,x)
$13:c34e  e0 7f 14      cpx #$147f
$13:c351  a2 db 22      ldx #$22db
$13:c354  98            tya
$13:c355  43 e0         eor $e0,s
$13:c357  70 d8         bvs $c331
$13:c359  0b            phd
$13:c35a  c8            iny
$13:c35b  21 86         and ($86,x)
$13:c35d  e0 80 47      cpx #$4780
$13:c360  1f 21 02 97   ora $970221,x
$13:c364  3c 04 00      bit $0004,x
$13:c367  27 90         and [$90]
$13:c369  82 40 e2      brl $a5ac
$13:c36c  80 81         bra $c2ef
$13:c36e  93 44         sta ($44,s),y
$13:c370  61 10         adc ($10,x)
$13:c372  8c 60 40      sty $4060
$13:c375  30 9c         bmi $c313
$13:c377  40            rti
$13:c378  a0 79 3a      ldy #$3a79
$13:c37b  9f 0e b6 c3   sta $c3b60e,x
$13:c37f  0d a0 08      ora $08a0
$13:c382  1f 30 46 1c   ora $1c4630,x
$13:c386  4e 67 43      lsr $4367
$13:c389  9d b0 e7      sta $e7b0,x
$13:c38c  68            pla
$13:c38d  3b            tsc
$13:c38e  d0 28         bne $c3b8
$13:c390  04 08         tsb $08
$13:c392  62 2c f0      per $b3c1
$13:c395  83 8d         sta $8d,s
$13:c397  82 0f 0b      brl $cea9
$13:c39a  78            sei
$13:c39b  08            php
$13:c39c  c0 c6 81      cpy #$81c6
$13:c39f  03 22         ora $22,s
$13:c3a1  84 1d         sty $1d
$13:c3a3  de 48 a3      dec $a348,x
$13:c3a6  46 8a         lsr $8a
$13:c3a8  38            sec
$13:c3a9  0a            asl a
$13:c3aa  e3 0c         sbc $0c,s
$13:c3ac  82 69 28      brl $ec18
$13:c3af  84 f4         sty $f4
$13:c3b1  2b            pld
$13:c3b2  2e 32 89      rol $8932
$13:c3b5  ac 84 db      ldy $db84
$13:c3b8  2a            rol a
$13:c3b9  f3 9b         sbc ($9b,s),y
$13:c3bb  6c c2 7f      jmp ($7fc2)
$13:c3be  62 9c f1      per $b55d
$13:c3c1  ad 79 4e      lda $4e79
$13:c3c4  9c f3 ef      stz $eff3
$13:c3c7  3c 89 df      bit $df89,x
$13:c3ca  e0 53 b8      cpx #$b853
$13:c3cd  14 ca         trb $ca
$13:c3cf  01 62         ora ($62,x)
$13:c3d1  80 71         bra $c444
$13:c3d3  a0 19 48      ldy #$4819
$13:c3d6  04 f1         tsb $f1
$13:c3d8  16 1c         asl $1c,x
$13:c3da  08            php
$13:c3db  9f d2 9f d2   sta $d29fd2,x
$13:c3df  87 fe         sta [$fe]
$13:c3e1  a4 fc         ldy $fc
$13:c3e3  89 bf aa      bit #$aabf
$13:c3e6  2f ed 8b fe   and $fe8bed
$13:c3ea  23 7e         and $7e,s
$13:c3ec  cf fc 82 df   cmp $df82fc
$13:c3f0  20 97 c0      jsr $c097
$13:c3f3  24 f0         bit $f0
$13:c3f5  09 bc 02      ora #$02bc
$13:c3f8  2e a9 08      rol $08a9
$13:c3fb  23 20         and $20,s
$13:c3fd  09 e6 f8      ora #$f8e6
$13:c400  18            clc
$13:c401  c4 39         cpy $39
$13:c403  f0 05         beq $c40a
$13:c405  f5 7c         sbc $7c,x
$13:c407  04 7a         tsb $7a
$13:c409  01 06         ora ($06,x)
$13:c40b  18            clc
$13:c40c  02 ed         cop #$ed
$13:c40e  a0 12 02      ldy #$0212
$13:c411  78            sei
$13:c412  c4 20         cpy $20
$13:c414  11 88         ora ($88),y
$13:c416  05 01         ora $01
$13:c418  99 2d 90      sta $902d,y
$13:c41b  6c bc 1e      jmp ($1ebc)
$13:c41e  00 4b         brk #$4b
$13:c420  09 fc f3      ora #$f3fc
$13:c423  fe ca 70      inc $70ca,x
$13:c426  0f d0 30 1c   ora $1c30d0
$13:c42a  0e 04 00      asl $0004
$13:c42d  2c 01 9f      bit $9f01
$13:c430  27 94         and [$94]
$13:c432  fc 5c aa      jsr ($aa5c,x)
$13:c435  e0 87 c0      cpx #$c087
$13:c438  09 ca 40      ora #$40ca
$13:c43b  d8            cld
$13:c43c  0c 06 05      tsb $0506
$13:c43f  03 82         ora $82,s
$13:c441  41 e1         eor ($e1,x)
$13:c443  30 e2         bmi $c427
$13:c445  b8            clv
$13:c446  44 23 d1      mvp $d1,$23
$13:c449  08            php
$13:c44a  e1 03         sbc ($03,x)
$13:c44c  dd 87 06      cmp $0687,x
$13:c44f  83 42         sta $42,s
$13:c451  21 11         and ($11,x)
$13:c453  03 c8         ora $c8,s
$13:c455  c8            iny
$13:c456  1a            inc a
$13:c457  64 4e         stz $4e
$13:c459  28            plp
$13:c45a  3c 1e 1f      bit $1f1e,x
$13:c45d  0f 8f a2 42   ora $42a28f
$13:c461  3e 2f 07      rol $072f,x
$13:c464  61 cc         adc ($cc,x)
$13:c466  26 07         rol $07
$13:c468  70 b0         bvs $c41a
$13:c46a  40            rti
$13:c46b  2e 92 49      rol $4992
$13:c46e  81 29         sta ($29,x)
$13:c470  78            sei
$13:c471  1f 0f 87 e1   ora $e1870f,x
$13:c475  50 3f         bvc $c4b6
$13:c477  c5 60         cmp $60
$13:c479  14 45         trb $45
$13:c47b  92 30         sta ($30)
$13:c47d  58            cli
$13:c47e  22 d8 09 4f   jsl $4f09d8
$13:c482  03 61         ora $61,s
$13:c484  0c 1d 8a      tsb $8a1d
$13:c487  0c 84 c0      tsb $c084
$13:c48a  60            rts
$13:c48b  28            plp
$13:c48c  01 30         ora ($30,x)
$13:c48e  80 78         bra $c508
$13:c490  34 01         bit $01,x
$13:c492  80 a0         bra $c434
$13:c494  04 09         tsb $09
$13:c496  de 0c f0      dec $f00c,x
$13:c499  0a            asl a
$13:c49a  80 54         bra $c4f0
$13:c49c  3c 0e 66      bit $660e,x
$13:c49f  91 4b         sta ($4b),y
$13:c4a1  a8            tay
$13:c4a2  14 e8         trb $e8
$13:c4a4  86 7a         stx $7a
$13:c4a6  f1 e6         sbc ($e6),y
$13:c4a8  9e 56 ae      stz $ae56,x
$13:c4ab  3a            dec a
$13:c4ac  38            sec
$13:c4ad  27 9e         and [$9e]
$13:c4af  11 7c         ora ($7c),y
$13:c4b1  97 44         sta [$44],y
$13:c4b3  69 d3 18      adc #$18d3
$13:c4b6  b5 86         lda $86,x
$13:c4b8  c5 19         cmp $19
$13:c4ba  8c 4f 64      sty $644f
$13:c4bd  37 cb         and [$cb],y
$13:c4bf  24 62         bit $62
$13:c4c1  71 00         adc ($00),y
$13:c4c3  c7 cc         cmp [$cc]
$13:c4c5  69 d7 08      adc #$08d7
$13:c4c8  a5 67         lda $67
$13:c4ca  71 df         adc ($df),y
$13:c4cc  9e 66 a7      stz $a766,x
$13:c4cf  5f a8 05 ca   eor $ca05a8,x
$13:c4d3  09 34 88      ora #$8834
$13:c4d6  f3 aa         sbc ($aa,s),y
$13:c4d8  18            clc
$13:c4d9  f8            sed
$13:c4da  c6 db         dec $db
$13:c4dc  35 38         and $38,x
$13:c4de  8c 5f 2f      sty $2f5f
$13:c4e1  51 c9         eor ($c9),y
$13:c4e3  84 32         sty $32
$13:c4e5  29 08 80      and #$8008
$13:c4e8  c7 62         cmp [$62]
$13:c4ea  31 c7         and ($c7),y
$13:c4ec  78            sei
$13:c4ed  4c 27 d2      jmp $d227
$13:c4f0  cb            wai
$13:c4f1  94 72         sty $72,x
$13:c4f3  fb            xce
$13:c4f4  1a            inc a
$13:c4f5  b5 c3         lda $c3,x
$13:c4f7  27 90         and [$90]
$13:c4f9  d8            cld
$13:c4fa  1c 52 07      trb $0752
$13:c4fd  26 88         rol $88
$13:c4ff  cd a0 32      cmp $32a0
$13:c502  08            php
$13:c503  6c 72 3d      jmp ($3d72)
$13:c506  2a            rol a
$13:c507  8e 17 83      stx $8317
$13:c50a  19 b8 e7      ora $e7b8,y
$13:c50d  6e 7b ff      ror $ff7b
$13:c510  9c 17 fe      stz $fe17
$13:c513  71 9e         adc ($9e),y
$13:c515  9e 7e a1      stz $a17e,x
$13:c518  5e 28 a5      lsr $a528,x
$13:c51b  db            stp
$13:c51c  71 c6         adc ($c6),y
$13:c51e  cc 71 bb      cpy $bb71
$13:c521  3c 6e f4      bit $f46e,x
$13:c524  03 39         ora $39,s
$13:c526  70 bc         bvs $c4e4
$13:c528  4f 2c 51 c9   eor $c9512c
$13:c52c  a4 23         ldy $23
$13:c52e  07 78         ora [$78]
$13:c530  89 fe ab      bit #$abfe
$13:c533  bd 48 46      lda $4648,x
$13:c536  43 0f         eor $0f,s
$13:c538  7a            ply
$13:c539  bb            tyx
$13:c53a  c1 63         cmp ($63,x)
$13:c53c  10 e8         bpl $c526
$13:c53e  74 0a         stz $0a,x
$13:c540  09 7c 82      ora #$827c
$13:c543  7f a4 7f 7b   adc $7b7fa4,x
$13:c547  3f de 09 7e   and $7e09de,x
$13:c54b  84 43         sty $43
$13:c54d  60            rts
$13:c54e  30 f6         bmi $c546
$13:c550  08            php
$13:c551  7b            tdc
$13:c552  a1 7f         lda ($7f,x)
$13:c554  c9 4f 8a      cmp #$8a4f
$13:c557  11 53         ora ($53),y
$13:c559  84 7f         sty $7f
$13:c55b  f4 d7 6a      pea $6ad7
$13:c55e  85 72         sta $72
$13:c560  11 78         ora ($78),y
$13:c562  80 45         bra $c5a9
$13:c564  23 f1         and $f1,s
$13:c566  69 ff df      adc #$dfff
$13:c569  fe a3 08      inc $08a3,x
$13:c56c  86 db         stx $db
$13:c56e  11 d8         ora ($d8),y
$13:c570  f0 7a         beq $c5ec
$13:c572  1c c1 18      trb $18c1
$13:c575  6f 03 78 20   adc $207803
$13:c579  30 08         bmi $c583
$13:c57b  1c 26 1f      trb $1f26
$13:c57e  0a            asl a
$13:c57f  87 c1         sta [$c1]
$13:c581  21 f0         and ($f0,x)
$13:c583  38            sec
$13:c584  3a            dec a
$13:c585  bc 16 81      ldy $8116,x
$13:c588  02 80         cop #$80
$13:c58a  41 16         eor ($16,x)
$13:c58c  04 c6         tsb $c6
$13:c58e  3f c4 c2 61   and $61c2c4,x
$13:c592  80 90         bra $c524
$13:c594  60            rts
$13:c595  28            plp
$13:c596  17 08         ora [$08],y
$13:c598  07 c2         ora [$c2]
$13:c59a  71 f8         adc ($f8),y
$13:c59c  b8            clv
$13:c59d  7c 30 18      jmp ($1830,x)
$13:c5a0  06 78         asl $78
$13:c5a2  5e a0 09      lsr $09a0,x
$13:c5a5  d0 c4         bne $c56b
$13:c5a7  40            rti
$13:c5a8  21 0b         and ($0b,x)
$13:c5aa  20 74 25      jsr $2574
$13:c5ad  82 81 78      brl $3e31
$13:c5b0  90 4f         bcc $c601
$13:c5b2  22 11 e8 4c   jsl $4ce811
$13:c5b6  3a            dec a
$13:c5b7  0f 06 81 40   ora $408106
$13:c5bb  e0 2b 40      cpx #$402b
$13:c5be  7f ec 1a 0d   adc $0d1aec,x
$13:c5c2  19 8f f8      ora $f88f,y
$13:c5c5  3f f0 0b fc   and $fc0bf0,x
$13:c5c9  02 0e         cop #$0e
$13:c5cb  ff e7 43 2b   sbc $2b43e7,x
$13:c5cf  40            rti
$13:c5d0  60            rts
$13:c5d1  03 32         ora $32,s
$13:c5d3  90 40         bcc $c615
$13:c5d5  07 20         ora [$20]
$13:c5d7  3c f1 d0      bit $d0f1,x
$13:c5da  4e 24 13      lsr $1324
$13:c5dd  0a            asl a
$13:c5de  05 80         ora $80
$13:c5e0  7d e4 59      adc $59e4,x
$13:c5e3  88            dey
$13:c5e4  4c 23 13      jmp $1323
$13:c5e7  89 74 7a      bit #$7a74
$13:c5ea  03 1f         ora $1f,s
$13:c5ec  86 40         stx $40
$13:c5ee  e0 6e 81      cpx #$816e
$13:c5f1  8f cf e1 f3   sta $f3e1cf
$13:c5f5  f8            sed
$13:c5f6  3c fc ee      bit $eefc,x
$13:c5f9  07 e0         ora [$e0]
$13:c5fb  5a            phy
$13:c5fc  83 a1         sta $a1,s
$13:c5fe  20 89 11      jsr $1189
$13:c601  8e 46 3c      stx $3c46
$13:c604  0c f0 e0      tsb $e0f0
$13:c607  70 1d         bvs $c626
$13:c609  03 fc         ora $fc,s
$13:c60b  fe 7e 14      inc $147e,x
$13:c60e  02 97         cop #$97
$13:c610  06 70         asl $70
$13:c612  40            rti
$13:c613  13 64         ora ($64,s),y
$13:c615  90 34         bcc $c64b
$13:c617  98            tya
$13:c618  40            rti
$13:c619  a0 d0 30      ldy #$30d0
$13:c61c  c0 1e c0      cpy #$c01e
$13:c61f  f6 10         inc $10,x
$13:c621  15 b8         ora $b8,x
$13:c623  2f ca 02 18   and $1802ca
$13:c627  05 c2         ora $c2
$13:c629  92 ce         sta ($ce)
$13:c62b  41 60         eor ($60,x)
$13:c62d  b0 70         bcs $c69f
$13:c62f  3c 18 04      bit $0418,x
$13:c632  d8            cld
$13:c633  26 c3         rol $c3
$13:c635  00 31         brk #$31
$13:c637  01 88         ora ($88,x)
$13:c639  35 c4         and $c4,x
$13:c63b  64 4d         stz $4d
$13:c63d  a3 00         lda $00,s
$13:c63f  20 81 c0      jsr $c081
$13:c642  21 f0         and ($f0,x)
$13:c644  08            php
$13:c645  fc 02 4f      jsr ($4f02,x)
$13:c648  00 af         brk #$af
$13:c64a  c0 2d ef      cpy #$ef2d
$13:c64d  00 90         brk #$90
$13:c64f  6b            rtl
$13:c650  e0 10 48      cpx #$4810
$13:c653  24 42         bit $42
$13:c655  20 ed 0a      jsr $0aed
$13:c658  c5 62         cmp $62
$13:c65a  60            rts
$13:c65b  07 1f         ora [$1f]
$13:c65d  87 c2         sta [$c2]
$13:c65f  e1 70         sbc ($70,x)
$13:c661  e0 40 3e      cpx #$3e40
$13:c664  10 0f         bpl $c675
$13:c666  c4 03         cpy $03
$13:c668  c9 00 fd      cmp #$fd00
$13:c66b  40            rti
$13:c66c  3e c1 00      rol $00c1,x
$13:c66f  82 7c 60      brl $26ee
$13:c672  8e d0 84      stx $84d0
$13:c675  42 1f         wdm #$1f
$13:c677  e1 1a         sbc ($1a,x)
$13:c679  8d 43 04      sta $0443
$13:c67c  e3 0f         sbc $0f,s
$13:c67e  87 c3         sta [$c3]
$13:c680  a1 d1         lda ($d1,x)
$13:c682  fc e4 63      jsr ($63e4,x)
$13:c685  f9 d0 f0      sbc $f0d0,y
$13:c688  42 39         wdm #$39
$13:c68a  16 0b         asl $0b,x
$13:c68c  04 03         tsb $03
$13:c68e  01 00         ora ($00,x)
$13:c690  1d 8c 7f      ora $7f8c,x
$13:c693  c1 1e         cmp ($1e,x)
$13:c695  f0 73         beq $c70a
$13:c697  01 40         ora ($40,x)
$13:c699  39 42 41      and $4142,y
$13:c69c  e0 0a 22      cpx #$220a
$13:c69f  48            pha
$13:c6a0  71 c8         adc ($c8),y
$13:c6a2  97 c8         sta [$c8],y
$13:c6a4  c9 f0 18      cmp #$18f0
$13:c6a7  1c 3e 31      trb $313e
$13:c6aa  38            sec
$13:c6ab  93 59         sta ($59,s),y
$13:c6ad  ab            plb
$13:c6ae  1d 82 42      ora $4282,x
$13:c6b1  41 de         eor ($de,x)
$13:c6b3  43 78         eor $78,s
$13:c6b5  83 f9         sta $f9,s
$13:c6b7  a3 fd         lda $fd,s
$13:c6b9  89 3c 06      bit #$063c
$13:c6bc  00 ef         brk #$ef
$13:c6be  04 28         tsb $28
$13:c6c0  42 f8         wdm #$f8
$13:c6c2  1d 1f 27      ora $271f,x
$13:c6c5  af e1 56 ac   lda $ac56e1
$13:c6c9  26 c0         rol $c0
$13:c6cb  90 9f         bcc $c66c
$13:c6cd  f5 21         sbc $21,x
$13:c6cf  d7 f4         cmp [$f4],y
$13:c6d1  0a            asl a
$13:c6d2  b0 37         bcs $c70b
$13:c6d4  b1 d8         lda ($d8),y
$13:c6d6  20 50 38      jsr $3850
$13:c6d9  2a            rol a
$13:c6da  14 21         trb $21
$13:c6dc  27 23         and [$23]
$13:c6de  48            pha
$13:c6df  1b            tcs
$13:c6e0  c4 a7         cpy $a7
$13:c6e2  eb            xba
$13:c6e3  51 9e         eor ($9e),y
$13:c6e5  43 e9         eor $e9,s
$13:c6e7  1e fe 3f      asl $3ffe,x
$13:c6ea  ff 59 df a6   sbc $a6df59,x
$13:c6ee  fc f8 9f      jsr ($9ff8,x)
$13:c6f1  2c 27 3d      bit $3d27
$13:c6f4  e6 14         inc $14
$13:c6f6  f9 87 3e      sbc $3e87,y
$13:c6f9  61 df         adc ($df,x)
$13:c6fb  90 38         bcc $c735
$13:c6fd  c3 87         cmp $87,s
$13:c6ff  3c fc 41      bit $41fc,x
$13:c702  ff 8c 50 34   sbc $34508c,x
$13:c706  6b            rtl
$13:c707  cb            wai
$13:c708  1d da 8f      ora $8fda,x
$13:c70b  04 28         tsb $28
$13:c70d  00 ad         brk #$ad
$13:c70f  0e 08 04      asl $0408
$13:c712  87 cf         sta [$cf]
$13:c714  e6 d7         inc $d7
$13:c716  6a            ror a
$13:c717  47 23         eor [$23]
$13:c719  23 91         and $91,s
$13:c71b  e9 fc d0      sbc #$d0fc
$13:c71e  20 2b 2b      jsr $2b2b
$13:c721  fc 03 ed      jsr ($ed03,x)
$13:c724  0f e4 4f f2   ora $f24fe4
$13:c728  36 ff         rol $ff,x
$13:c72a  9c 3c 52      stz $523c
$13:c72d  7c 0e 4f      jmp ($4f0e,x)
$13:c730  8b            phb
$13:c731  cb            wai
$13:c732  f0 b3         beq $c6e7
$13:c734  de 13 61      dec $6113,x
$13:c737  52 4f         eor ($4f)
$13:c739  0f 02 01 fe   ora $fe0102
$13:c73d  52 1d         eor ($1d)
$13:c73f  ff 00 ab 64   sbc $64ab00,x
$13:c743  79 2e 82      adc $822e,y
$13:c746  07 01         ora [$01]
$13:c748  81 4f         sta ($4f,x)
$13:c74a  24 37         bit $37
$13:c74c  25 91         and $91
$13:c74e  40            rti
$13:c74f  a0 2c 72      ldy #$722c
$13:c752  66 81         ror $81
$13:c754  14 15         trb $15
$13:c756  20 ca 09      jsr $09ca
$13:c759  ed 03 b7      sbc $b703
$13:c75c  38            sec
$13:c75d  f4 fb 26      pea $26fb
$13:c760  33 ca         and ($ca,s),y
$13:c762  2d 83 7f      and $7f83
$13:c765  80 66         bra $c7cd
$13:c767  83 34         sta $34,s
$13:c769  3f b0 24 68   and $6824b0,x
$13:c76d  7b            tdc
$13:c76e  e2 13         sep #$13
$13:c770  fe 01 a4      inc $a401,x
$13:c773  0c a4 13      tsb $13a4
$13:c776  68            pla
$13:c777  24 3a         bit $3a
$13:c779  15 1b         ora $1b,x
$13:c77b  89 4c e7      bit #$e74c
$13:c77e  53 c0         eor ($c0,s),y
$13:c780  9b            txy
$13:c781  21 c2         and ($c2,x)
$13:c783  37 04         and [$04],y
$13:c785  99 c3 08      sta $08c3,y
$13:c788  a0 13         ldy #$13
$13:c78a  6c 04 02      jmp ($0204)
$13:c78d  a1 38         lda ($38,x)
$13:c78f  b4 4a         ldy $4a,x
$13:c791  1b            tcs
$13:c792  60            rts
$13:c793  cf 8f c4 03   cmp $03c48f
$13:c797  d1 10         cmp ($10),y
$13:c799  75 86         adc $86,x
$13:c79b  ce 01 ec      dec $ec01
$13:c79e  88            dey
$13:c79f  7c 21 fd      jmp ($fd21,x)
$13:c7a2  a8            tay
$13:c7a3  27 be         and [$be]
$13:c7a5  01 a1         ora ($a1,x)
$13:c7a7  80 7b         bra $c824
$13:c7a9  a0 3c         ldy #$3c
$13:c7ab  a9 8d f2      lda #$f28d
$13:c7ae  f9 3f 00      sbc $003f,y
$13:c7b1  9c 7a 3d      stz $3d7a
$13:c7b4  5f af 5c 62   eor $625caf,x
$13:c7b8  17 d8         ora [$d8],y
$13:c7ba  27 26         and [$26]
$13:c7bc  09 6d 8c      ora #$8c6d
$13:c7bf  6d ff 10      adc $10ff
$13:c7c2  bb            tyx
$13:c7c3  85 de         sta $de
$13:c7c5  01 8d         ora ($8d,x)
$13:c7c7  80 7c         bra $c845
$13:c7c9  e0 9b         cpx #$9b
$13:c7cb  58            cli
$13:c7cc  b4 fa         ldy $fa,x
$13:c7ce  7d fe ff      adc $fffe,x
$13:c7d1  7f 04 63 f8   adc $f86304,x
$13:c7d5  fc 7c ae      jsr ($ae7c,x)
$13:c7d8  58            cli
$13:c7d9  e8            inx
$13:c7da  47 da         eor [$da]
$13:c7dc  90 ce         bcc $c7ac
$13:c7de  43 98         eor $98,s
$13:c7e0  40            rti
$13:c7e1  60            rts
$13:c7e2  70 24         bvs $c808
$13:c7e4  18            clc
$13:c7e5  41 60         eor ($60,x)
$13:c7e7  c8            iny
$13:c7e8  70 17         bvs $c801
$13:c7ea  a9 e4 20      lda #$20e4
$13:c7ed  d0 18         bne $c807
$13:c7ef  6c 0a 3e      jmp ($3e0a)
$13:c7f2  6f 08 44 02   adc $024408
$13:c7f6  31 f0         and ($f0),y
$13:c7f8  bc 54 3b      ldy $3b54,x
$13:c7fb  12 0d         ora ($0d)
$13:c7fd  c4 c3         cpy $c3
$13:c7ff  f1 a8         sbc ($a8),y
$13:c801  f4 60 3f      pea $3f60
$13:c804  11 88         ora ($88),y
$13:c806  05 e0         ora $e0
$13:c808  c0 18         cpy #$18
$13:c80a  0a            asl a
$13:c80b  c7 82         cmp [$82]
$13:c80d  71 c0         adc ($c0),y
$13:c80f  33 86         and ($86,s),y
$13:c811  a2 a1         ldx #$a1
$13:c813  88            dey
$13:c814  b8            clv
$13:c815  6b            rtl
$13:c816  b7 da         lda [$da],y
$13:c818  2f 15 af d7   and $d7af15
$13:c81c  4e e7 7f      lsr $7fe7
$13:c81f  bf fc 0f fe   lda $fe0ffc,x
$13:c823  0b            phd
$13:c824  f1 79         sbc ($79),y
$13:c826  ff 6f a8 3e   sbc $3ea86f,x
$13:c82a  28            plp
$13:c82b  ff ae 39 ce   sbc $ce39ae,x
$13:c82f  98            tya
$13:c830  aa            tax
$13:c831  c9 56 5f      cmp #$5f56
$13:c834  1f f7 97 fd   ora $fd97f7,x
$13:c838  91 f8         sta ($f8),y
$13:c83a  73 ff         adc ($ff,s),y
$13:c83c  90 6f         bcc $c8ad
$13:c83e  c4 37         cpy $37
$13:c840  e3 18         sbc $18,s
$13:c842  b1 47         lda ($47),y
$13:c844  ef df e8 02   sbc $02e8df
$13:c848  7c 3e 50      jmp ($503e,x)
$13:c84b  cf e4 03 f2   cmp $f203e4
$13:c84f  1a            inc a
$13:c850  08            php
$13:c851  07 9d         ora [$9d]
$13:c853  40            rti
$13:c854  31 19         and ($19),y
$13:c856  cc 82 c7      cpy $c782
$13:c859  03 a3         ora $a3,s
$13:c85b  d1 a9         cmp ($a9),y
$13:c85d  d4 1a         pei ($1a)
$13:c85f  bf 03 b3 60   lda $60b303,x
$13:c863  f3 2c         sbc ($2c,s),y
$13:c865  42 fc         wdm #$fc
$13:c867  88            dey
$13:c868  3d f4 07      and $07f4,x
$13:c86b  7f 00 9f c0   adc $c09f00,x
$13:c86f  09 a0 4d      ora #$4da0
$13:c872  0e 37 7e      asl $7e37
$13:c875  63 30         adc $30,s
$13:c877  8f f1 e9 f6   sta $f6e9f1
$13:c87b  3d 66 c2      and $c266,x
$13:c87e  6d ce fd      adc $fdce
$13:c881  4e f9 94      lsr $94f9
$13:c884  f9 f4 07      sbc $07f4,y
$13:c887  9d 01 fc      sta $fc01,x
$13:c88a  40            rti
$13:c88b  2f 98 0d e5   and $e50d98
$13:c88f  01 0e         ora ($0e,x)
$13:c891  1f b8 27 3e   ora $3e27b8,x
$13:c895  61 64         adc ($64,x)
$13:c897  fa            plx
$13:c898  62 29 1f      per $e7c4
$13:c89b  0f 86 03 81   ora $810386
$13:c89f  10 9c         bpl $c83d
$13:c8a1  7a            ply
$13:c8a2  25 16         and $16
$13:c8a4  89 45 c2      bit #$c245
$13:c8a7  70 63         bvs $c90c
$13:c8a9  0b            phd
$13:c8aa  86 00         stx $00
$13:c8ac  62 53 88      per $5102
$13:c8af  07 a2         ora [$a2]
$13:c8b1  20 09 07      jsr $0709
$13:c8b4  18            clc
$13:c8b5  7e 63 35      ror $3563,x
$13:c8b8  0f 06 ff 5f   ora $5fff06
$13:c8bc  b3 d7         lda ($d7,s),y
$13:c8be  f4 3d 35      pea $353d
$13:c8c1  ef 74 e2 5d   sbc $5de274
$13:c8c5  c0 fe         cpy #$fe
$13:c8c7  7e 60 ff      ror $ff60,x
$13:c8ca  08            php
$13:c8cb  7e fe 80      ror $80fe,x
$13:c8ce  23 04         and $04,s
$13:c8d0  39 77 d9      and $d977,y
$13:c8d3  43 e4         eor $e4,s
$13:c8d5  b2 50         lda ($50)
$13:c8d7  30 1f         bmi $c8f8
$13:c8d9  fd ff 33      sbc $33ff,x
$13:c8dc  7f 41 d3 de   adc $ded341,x
$13:c8e0  37 3e         and [$3e],y
$13:c8e2  2d c4 0f      and $0fc4
$13:c8e5  e5 e4         sbc $e4
$13:c8e7  8f f0 27 e8   sta $e827f0
$13:c8eb  76 bf         ror $bf,x
$13:c8ed  c0 2f         cpy #$2f
$13:c8ef  a8            tay
$13:c8f0  e0 fe         cpx #$fe
$13:c8f2  78            sei
$13:c8f3  7e 98 1f      ror $1f98,x
$13:c8f6  04 8f         tsb $8f
$13:c8f8  f1 f6         sbc ($f6),y
$13:c8fa  fc 7b 7e      jsr ($7e7b,x)
$13:c8fd  35 84         and $84,x
$13:c8ff  08            php
$13:c900  27 8d         and [$8d]
$13:c902  3e 0a 58      rol $580a,x
$13:c905  a1 db         lda ($db,x)
$13:c907  a8            tay
$13:c908  14 68         trb $68
$13:c90a  0d 07 7f      ora $7f07
$13:c90d  be b0 d8      ldx $d8b0,y
$13:c910  63 f7         adc $f7,s
$13:c912  f8            sed
$13:c913  0c fa 01      tsb $01fa
$13:c916  0f 21 92 7c   ora $7c9221
$13:c91a  28            plp
$13:c91b  30 08         bmi $c925
$13:c91d  f0 0c         beq $c92b
$13:c91f  60            rts
$13:c920  20 31 8b      jsr $8b31
$13:c923  fd be 3f      sbc $3fbe,x
$13:c926  3d 86 df      and $df86,x
$13:c929  91 eb         sta ($eb),y
$13:c92b  f6 db         inc $db,x
$13:c92d  4c 61 c0      jmp $c061
$13:c930  98            tya
$13:c931  26 83         rol $83
$13:c933  eb            xba
$13:c934  08            php
$13:c935  f9 43 04      sbc $0443,y
$13:c938  61 77         adc ($77,x)
$13:c93a  80 64         bra $c9a0
$13:c93c  8c 03 c0      sty $c003
$13:c93f  01 8d         ora ($8d,x)
$13:c941  4e b1 07      lsr $07b1
$13:c944  b8            clv
$13:c945  63 e4         adc $e4,s
$13:c947  14 68         trb $68
$13:c949  7d 26 73      adc $7326,x
$13:c94c  2d 96 dc      and $dc96
$13:c94f  af 56 79 a7   lda $a77956
$13:c953  7e 40 47      ror $4740,x
$13:c956  4b            phk
$13:c957  cc 1a df      cpy $df1a
$13:c95a  10 9e         bpl $c8fa
$13:c95c  c0 2b         cpy #$2b
$13:c95e  70 0f         bvs $c96f
$13:c960  86 e3         stx $e3
$13:c962  a1 38         lda ($38,x)
$13:c964  e4 42         cpx $42
$13:c966  3a            dec a
$13:c967  1b            tcs
$13:c968  8b            phb
$13:c969  07 42         ora [$42]
$13:c96b  41 80         eor ($80,x)
$13:c96d  b0 50         bcs $c9bf
$13:c96f  3c 1c 0b      bit $0b1c,x
$13:c972  c4 00         cpy $00
$13:c974  1a            inc a
$13:c975  1f 08 05 02   ora $020508,x
$13:c979  01 a0         ora ($a0,x)
$13:c97b  80 78         bra $c9f5
$13:c97d  1c c3 20      trb $20c3
$13:c980  80 72         bra $c9f4
$13:c982  23 3f         and $3f,s
$13:c984  78            sei
$13:c985  4f 7a 03 ce   eor $ce037a
$13:c989  ac f0 a3      ldy $a3f0
$13:c98c  3e 79 0f      rol $0f79,x
$13:c98f  6e 61 df      ror $df61
$13:c992  9a            txs
$13:c993  31 c2         and ($c2),y
$13:c995  87 08         sta [$08]
$13:c997  bc c0 27      ldy $27c0,x
$13:c99a  e0 41         cpx #$41
$13:c99c  43 84         eor $84,s
$13:c99e  3e 01 0c      rol $0c01,x
$13:c9a1  82 40 f1      brl $bae4
$13:c9a4  12 fa         ora ($fa)
$13:c9a6  85 ed         sta $ed
$13:c9a8  5c 13 69 5d   jml $5d6913
$13:c9ac  a3 4f         lda $4f,s
$13:c9ae  c4 ed         cpy $ed
$13:c9b0  f3 3f         sbc ($3f,s),y
$13:c9b2  72 cc         adc ($cc)
$13:c9b4  75 c2         adc $c2,x
$13:c9b6  85 90         sta $90
$13:c9b8  8f 60 2e 98   sta $982e60
$13:c9bc  8b            phb
$13:c9bd  66 40         ror $40
$13:c9bf  06 0e         asl $0e
$13:c9c1  30 98         bmi $c95b
$13:c9c3  3b            tsc
$13:c9c4  42 1f         wdm #$1f
$13:c9c6  19 9f cc      ora $cc9f,y
$13:c9c9  6f 32 0b 9e   adc $9e0b32
$13:c9cd  17 4f         ora [$4f],y
$13:c9cf  86 c7         stx $c7
$13:c9d1  ea            nop
$13:c9d2  75 f4         adc $f4,x
$13:c9d4  3a            dec a
$13:c9d5  78            sei
$13:c9d6  14 18         trb $18
$13:c9d8  a0 7f         ldy #$7f
$13:c9da  2b            pld
$13:c9db  d3 10         cmp ($10,s),y
$13:c9dd  6b            rtl
$13:c9de  e0 41         cpx #$41
$13:c9e0  dc 68 39      jml [$3968]
$13:c9e3  0e 10 ec      asl $ec10
$13:c9e6  40            rti
$13:c9e7  31 1c         and ($1c),y
$13:c9e9  0a            asl a
$13:c9ea  07 e3         ora [$e3]
$13:c9ec  31 70         and ($70),y
$13:c9ee  e4 74         cpx $74
$13:c9f0  3c 1a 0a      bit $0a1a,x
$13:c9f3  c3 84         cmp $84,s
$13:c9f5  0c 25 b8      tsb $b825
$13:c9f8  80 58         bra $ca52
$13:c9fa  1c 42 e3      trb $e342
$13:c9fd  08            php
$13:c9fe  f4 7b 13      pea $137b
$13:ca01  d9 d7 7f      cmp $7fd7,y
$13:ca04  e6 f3         inc $f3
$13:ca06  fa            plx
$13:ca07  bd 7e 0b      lda $0b7e,x
$13:ca0a  3d 85 47      and $4785,x
$13:ca0d  a1 31         lda ($31,x)
$13:ca0f  f4 c8 31      pea $31c8
$13:ca12  c1 8a         cmp ($8a,x)
$13:ca14  0c 50 02      tsb $0250
$13:ca17  84 f6         sty $f6
$13:ca19  05 3e         ora $3e
$13:ca1b  80 81         bra $c99e
$13:ca1d  41 58         eor ($58,x)
$13:ca1f  33 cd         and ($cd,s),y
$13:ca21  76 be         ror $be,x
$13:ca23  47 37         eor [$37]
$13:ca25  e4 f8         cpx $f8
$13:ca27  f2 3c         sbc ($3c)
$13:ca29  1e 03 74      asl $7403,x
$13:ca2c  1d 21 00      ora $0021,x
$13:ca2f  fe 40 35      inc $3540,x
$13:ca32  f7 09         sbc [$09],y
$13:ca34  ff 01 82 1f   sbc $1f8201,x
$13:ca38  37 40         and [$40],y
$13:ca3a  ba            tsx
$13:ca3b  42 31         wdm #$31
$13:ca3d  78            sei
$13:ca3e  83 22         sta $22,s
$13:ca40  c2 1f         rep #$1f
$13:ca42  00 81         brk #$81
$13:ca44  a3 89         lda $89,s
$13:ca46  1c 50 78      trb $7850
$13:ca49  04 05         tsb $05
$13:ca4b  6e cb 73      ror $73cb
$13:ca4e  e8            inx
$13:ca4f  d6 35         dec $35,x
$13:ca51  f2 0e         sbc ($0e)
$13:ca53  7e 02 8b      ror $8b02,x
$13:ca56  bd 9e 6f      lda $6f9e,x
$13:ca59  2d 96 d9      and $d996
$13:ca5c  94 ea         sty $ea,x
$13:ca5e  37 1b         and [$1b],y
$13:ca60  ef c8 08 60   sbc $6008c8
$13:ca64  83 0b         sta $0b,s
$13:ca66  ec 0a f9      cpx $f90a
$13:ca69  03 97         ora $97,s
$13:ca6b  c4 23         cpy $23
$13:ca6d  b0 08         bcs $ca77
$13:ca6f  24 02         bit $02
$13:ca71  a1 38         lda ($38,x)
$13:ca73  e4 42         cpx $42
$13:ca75  3e 13 8f      rol $8f13,x
$13:ca78  06 c2         asl $c2
$13:ca7a  c1 c0         cmp ($c0,x)
$13:ca7c  80 3e         bra $cabc
$13:ca7e  06 80         asl $80
$13:ca80  58            cli
$13:ca81  01 50         ora ($50,x)
$13:ca83  be 02 81      ldx $8102,y
$13:ca86  00 d0         brk #$d0
$13:ca88  3e 4a 01      rol $014a,x
$13:ca8b  80 80         bra $ca0d
$13:ca8d  60            rts
$13:ca8e  fc 79 c8      jsr ($c879,x)
$13:ca91  e7 c2         sbc [$c2]
$13:ca93  e0 0d 05      cpx #$050d
$13:ca96  bb            tyx
$13:ca97  4f 15 42 0d   eor $0d4215
$13:ca9b  00 ac         brk #$ac
$13:ca9d  0b            phd
$13:ca9e  bc 7f f7      ldy $f77f,x
$13:caa1  eb            xba
$13:caa2  f5 08         sbc $08,x
$13:caa4  a6 a5         ldx $a5
$13:caa6  10 26         bpl $cace
$13:caa8  fa            plx
$13:caa9  3c 21 f0      bit $f021,x
$13:caac  58            cli
$13:caad  fc 62 7f      jsr ($7f62,x)
$13:cab0  30 be         bmi $ca70
$13:cab2  4d ef f8      eor $f8ef
$13:cab5  8d cd 07      sta $07cd
$13:cab8  87 23         sta [$23]
$13:caba  f7 c7         sbc [$c7],y
$13:cabc  e0 13 f7      cpx #$f713
$13:cabf  10 b8         bpl $ca79
$13:cac1  41 fe         eor ($fe,x)
$13:cac3  17 74         ora [$74],y
$13:cac5  00 9f         brk #$9f
$13:cac7  c3 81         cmp $81,s
$13:cac9  e8            inx
$13:caca  84 76         sty $76
$13:cacc  21 11         and ($11,x)
$13:cace  83 68         sta $68,s
$13:cad0  7e 3f 11      ror $113f,x
$13:cad3  8e c7 23      stx $23c7
$13:cad6  d1 48         cmp ($48),y
$13:cad8  bc 7c 21      ldy $217c,x
$13:cadb  0f f0 50 91   ora $9150f0
$13:cadf  b4 04         ldy $04,x
$13:cae1  20 01 00      jsr $0001
$13:cae4  a0 4e e3      ldy #$e34e
$13:cae7  11 f8         ora ($f8),y
$13:cae9  7c 3c de      jmp ($de3c,x)
$13:caec  10 78         bpl $cb66
$13:caee  6c 16 1f      jmp ($1f16)
$13:caf1  03 87         ora $87,s
$13:caf3  41 97         eor ($97,x)
$13:caf5  61 27         adc ($27,x)
$13:caf7  80 44         bra $cb3d
$13:caf9  0d e1 00      ora $00e1
$13:cafc  84 40         sty $40
$13:cafe  21 50         and ($50,x)
$13:cb00  08            php
$13:cb01  64 02         stz $02
$13:cb03  12 ca         ora ($ca)
$13:cb05  15 48         ora $48,x
$13:cb07  c4 37         cpy $37
$13:cb09  91 cc         sta ($cc),y
$13:cb0b  67 53         adc [$53]
$13:cb0d  09 e8 80      ora #$80e8
$13:cb10  4c 22 13      jmp $1322
$13:cb13  88            dey
$13:cb14  44 f0 42      mvp $42,$f0
$13:cb17  1e 41 00      asl $0041,x
$13:cb1a  de 20 17      dec $1720,x
$13:cb1d  c8            iny
$13:cb1e  07 f1         ora [$f1]
$13:cb20  d0 7e         bne $cba0
$13:cb22  b8            clv
$13:cb23  a7 be         lda [$be]
$13:cb25  21 f7         and ($f7,x)
$13:cb27  84 7c         sty $7c
$13:cb29  e1 1d         sbc ($1d,x)
$13:cb2b  98            tya
$13:cb2c  3f 32 45 c3   and $c34532,x
$13:cb30  ac 6a 2d      ldy $2d6a
$13:cb33  d0 c8         bne $cafd
$13:cb35  24 22         bit $22
$13:cb37  03 24         ora $24,s
$13:cb39  80 c9         bra $cb04
$13:cb3b  a0 13 38      ldy #$3813
$13:cb3e  05 e6         ora $e6
$13:cb40  01 5c         ora ($5c,x)
$13:cb42  90 3c         bcc $cb80
$13:cb44  43 af         eor $af,s
$13:cb46  28            plp
$13:cb47  79 83 c4      adc $c483,y
$13:cb4a  39 f1 08      and $08f1,y
$13:cb4d  dd 82 67      cmp $6782,x
$13:cb50  44 e1 c6      mvp $c6,$e1
$13:cb53  a2 b7 69      ldx #$69b7
$13:cb56  84 82         sty $82
$13:cb58  21 80         and ($80,x)
$13:cb5a  92 60         sta ($60)
$13:cb5c  2c 90 0a      bit $0a90
$13:cb5f  66 03         ror $03
$13:cb61  3d 00 9d      and $9d00,x
$13:cb64  41 1e         eor ($1e,x)
$13:cb66  61 42         adc ($42,x)
$13:cb68  a3 48         lda $48,s
$13:cb6a  a6 d0         ldx $d0
$13:cb6c  28            plp
$13:cb6d  94 46         sty $46,x
$13:cb6f  37 01         and [$01],y
$13:cb71  85 c2         sta $c2
$13:cb73  21 b0         and ($b0,x)
$13:cb75  08            php
$13:cb76  0c 12 09      tsb $0912
$13:cb79  3e 80 c7      rol $c780,x
$13:cb7c  88            dey
$13:cb7d  02 b3         cop #$b3
$13:cb7f  18            clc
$13:cb80  04 1c         tsb $1c
$13:cb82  90 30         bcc $cbb4
$13:cb84  38            sec
$13:cb85  05 02         ora $02
$13:cb87  e1 f0         sbc ($f0,x)
$13:cb89  f8            sed
$13:cb8a  68            pla
$13:cb8b  36 12         rol $12,x
$13:cb8d  09 85 c2      ora #$c285
$13:cb90  e1 90         sbc ($90,x)
$13:cb92  2c 8d 43      bit $438d
$13:cb95  a1 60         lda ($60,x)
$13:cb97  c0 78 30      cpy #$3078
$13:cb9a  1b            tcs
$13:cb9b  0e 04 c3      asl $c304
$13:cb9e  81 70         sta ($70,x)
$13:cba0  e0 64 2c      cpx #$2c64
$13:cba3  06 90         asl $90
$13:cba5  ec 48 21      cpx $2148
$13:cba8  b1 f8         lda ($f8),y
$13:cbaa  6c 76 09      jmp ($0976)
$13:cbad  0f 81 42 e0   ora $e04281
$13:cbb1  cb            wai
$13:cbb2  90 24         bcc $cbd8
$13:cbb4  84 05         sty $05
$13:cbb6  4c 11 f3      jmp $f311
$13:cbb9  f0 ac         beq $cb67
$13:cbbb  c2 16         rep #$16
$13:cbbd  73 02         adc ($02,s),y
$13:cbbf  51 a9         eor ($a9),y
$13:cbc1  82 40 8f      brl $5b04
$13:cbc4  09 87 d3      ora #$d387
$13:cbc7  f3 1b         sbc ($1b,s),y
$13:cbc9  9f f1 a1 d7   sta $d7a1f1,x
$13:cbcd  c3 00         cmp $00,s
$13:cbcf  7c 20 16      jmp ($1620,x)
$13:cbd2  03 28         ora $28,s
$13:cbd4  4e 78 1f      lsr $1f78
$13:cbd7  f8            sed
$13:cbd8  02 8c         cop #$8c
$13:cbda  3f ce 81 4e   and $4e81ce,x
$13:cbde  03 8c         ora $8c,s
$13:cbe0  15 d7         ora $d7,x
$13:cbe2  01 84         ora ($84,x)
$13:cbe4  12 41         ora ($41)
$13:cbe6  5d 24 d0      eor $d024,x
$13:cbe9  9b            txy
$13:cbea  c2 15         rep #$15
$13:cbec  c5 07         cmp $07
$13:cbee  87 c4         sta [$c4]
$13:cbf0  a6 56         ldx $56
$13:cbf2  0b            phd
$13:cbf3  07 2f         ora [$2f]
$13:cbf5  f7 37         sbc [$37],y
$13:cbf7  fb            xce
$13:cbf8  d8            cld
$13:cbf9  bc 4d 11      ldy $114d,x
$13:cbfc  3f 0d ca 1f   and $1fca0d,x
$13:cc00  e0 8f fe      cpx #$fe8f
$13:cc03  e0 ff 78      cpx #$78ff
$13:cc06  7f 8a 3e 7c   adc $7c3e8a,x
$13:cc0a  02 68         cop #$68
$13:cc0c  47 f8         eor [$f8]
$13:cc0e  14 9b         trb $9b
$13:cc10  14 96         trb $96
$13:cc12  61 27         adc ($27,x)
$13:cc14  9c 6d b7      stz $b76d
$13:cc17  13 29         ora ($29,s),y
$13:cc19  c1 f4         cmp ($f4,x)
$13:cc1b  38            sec
$13:cc1c  0a            asl a
$13:cc1d  61 bf         adc ($bf,x)
$13:cc1f  e0 27 fc      cpx #$fc27
$13:cc22  00 38         brk #$38
$13:cc24  6f f8 00 70   adc $7000f8
$13:cc28  3e 85 fa      rol $fa85,x
$13:cc2b  fd 42 09      sbc $0942,x
$13:cc2e  a8            tay
$13:cc2f  44 15 c4      mvp $c4,$15
$13:cc32  11 e5         ora ($e5),y
$13:cc34  ba            tsx
$13:cc35  1e 42 19      asl $1942,x
$13:cc38  1c 89 cc      trb $cc89
$13:cc3b  d1 e0         cmp ($e0),y
$13:cc3d  c5 64         cmp $64
$13:cc3f  18            clc
$13:cc40  4f 20 73 38   eor $387320
$13:cc44  7d 81 dc      adc $dc81,x
$13:cc47  68            pla
$13:cc48  30 8c         bmi $cbd6
$13:cc4a  f0 b9         beq $cc05
$13:cc4c  3e 0f 3f      rol $3f0f,x
$13:cc4f  c2 ad         rep #$ad
$13:cc51  58            cli
$13:cc52  a9 56 15      lda #$1556
$13:cc55  c4 ab         cpy $ab
$13:cc57  05 19         ora $19
$13:cc59  28            plp
$13:cc5a  c2 bf         rep #$bf
$13:cc5c  a0 35 84      ldy #$8435
$13:cc5f  86 cf         stx $cf
$13:cc61  30 bb         bmi $cc1e
$13:cc63  c6 27         dec $27
$13:cc65  31 c9         and ($c9),y
$13:cc67  ec 12 29      cpx $2912
$13:cc6a  0a            asl a
$13:cc6b  8d 41 21      sta $2141
$13:cc6e  90 28         bcc $cc98
$13:cc70  33 8c         and ($8c,s),y
$13:cc72  08            php
$13:cc73  e0 be 06      cpx #$06be
$13:cc76  58            cli
$13:cc77  42 e0         wdm #$e0
$13:cc79  10 56         bpl $ccd1
$13:cc7b  50 bb         bvc $cc38
$13:cc7d  c3 41         cmp $41,s
$13:cc7f  b0 f0         bcs $cc71
$13:cc81  7c 2c 0a      jmp ($0a2c,x)
$13:cc84  d0 f8         bne $cc7e
$13:cc86  46 3f         lsr $3f
$13:cc88  11 86         ora ($86),y
$13:cc8a  b8            clv
$13:cc8b  42 37         wdm #$37
$13:cc8d  17 8d         ora [$8d],y
$13:cc8f  c5 03         cmp $03
$13:cc91  f1 00         sbc ($00),y
$13:cc93  50 d4         bvc $cc69
$13:cc95  3e 0e d3      rol $d30e,x
$13:cc98  05 88         ora $88
$13:cc9a  c1 c6         cmp ($c6,x)
$13:cc9c  e0 37 01      cpx #$0137
$13:cc9f  b0 0d         bcs $ccae
$13:cca1  42 10         wdm #$10
$13:cca3  2d 71 6a      and $6a71
$13:cca6  43 27         eor $27,s
$13:cca8  90 48         bcc $ccf2
$13:ccaa  e4 02         cpx $02
$13:ccac  39 80 c6      and $c680,y
$13:ccaf  60            rts
$13:ccb0  30 1e         bmi $ccd0
$13:ccb2  4f 27 c3 f9   eor $f9c327
$13:ccb6  c0 6d 84      cpy #$846d
$13:ccb9  01 be         ora ($be,x)
$13:ccbb  57 c7         eor [$c7],y
$13:ccbd  20 c6 05      jsr $05c6
$13:ccc0  a7 7c         lda [$7c]
$13:ccc2  ff de 7f fa   sbc $fa7fde,x
$13:ccc6  3f fc 3b 7f   and $7f3bfc,x
$13:ccca  70 cb         bvs $cc97
$13:cccc  d0 7b         bne $cd49
$13:ccce  b4 ae         ldy $ae,x
$13:ccd0  b4 f7         ldy $f7,x
$13:ccd2  c7 fc         cmp [$fc]
$13:ccd4  81 fe         sta ($fe,x)
$13:ccd6  60            rts
$13:ccd7  d6 38         dec $38,x
$13:ccd9  e5 3a         sbc $3a
$13:ccdb  63 10         adc $10,s
$13:ccdd  b7 cc         lda [$cc],y
$13:ccdf  61 f3         adc ($f3,x)
$13:cce1  28            plp
$13:cce2  6c 0e 39      jmp ($390e)
$13:cce5  e1 fe         sbc ($fe,x)
$13:cce7  6f 37 de 3f   adc $3fde37
$13:cceb  94 73         sty $73,x
$13:cced  fb            xce
$13:ccee  f2 f9         sbc ($f9)
$13:ccf0  c1 20         cmp ($20,x)
$13:ccf2  b3 29         lda ($29,s),y
$13:ccf4  9f 33 9c 65   sta $659c33,x
$13:ccf8  0d fd 03      ora $03fd
$13:ccfb  c7 1c         cmp [$1c]
$13:ccfd  8e f8 be      stx $bef8
$13:cd00  70 c8         bvs $ccca
$13:cd02  2f fa 67 fc   and $fc67fa
$13:cd06  e7 cc         sbc [$cc]
$13:cd08  30 f3         bmi $ccfd
$13:cd0a  f9 ff fe      sbc $feff,y
$13:cd0d  ed 7e a4      sbc $a47e
$13:cd10  7f e7 f7 fb   adc $fbf7e7,x
$13:cd14  e5 f2         sbc $f2
$13:cd16  cf e7 9e 3b   cmp $3b9ee7
$13:cd1a  c0 d0 3f      cpy #$3fd0
$13:cd1d  68            pla
$13:cd1e  4f e2 0e 65   eor $650ee2
$13:cd22  07 f8         ora [$f8]
$13:cd24  79 e3 ef      adc $efe3,y
$13:cd27  f0 8d         beq $ccb6
$13:cd29  76 f0         ror $f0,x
$13:cd2b  5e 3a 2d      lsr $2d3a,x
$13:cd2e  fe a3 dd      inc $dda3,x
$13:cd31  87 7a         sta [$7a]
$13:cd33  78            sei
$13:cd34  5f ba 95 af   eor $af95ba,x
$13:cd38  79 c7 8d      adc $8dc7,y
$13:cd3b  f9 30 77      sbc $7730,y
$13:cd3e  ca            dex
$13:cd3f  36 e2         rol $e2,x
$13:cd41  a5 bc         lda $bc
$13:cd43  84 7d         sty $7d
$13:cd45  b9 9f 0a      lda $0a9f,y
$13:cd48  66 c3         ror $c3
$13:cd4a  81 38         sta ($38,x)
$13:cd4c  65 93         adc $93
$13:cd4e  2c 56 21      bit $2156
$13:cd51  1f 93 59 a8   ora $a85993,x
$13:cd55  1c 0d c6      trb $c60d
$13:cd58  e1 96         sbc ($96,x)
$13:cd5a  4b            phk
$13:cd5b  c0 8f c0      cpy #$c08f
$13:cd5e  27 f0         and [$f0]
$13:cd60  0f 34 7f 81   ora $817f34
$13:cd64  3f dc 51 e0   and $e051dc,x
$13:cd68  28            plp
$13:cd69  21 87         and ($87,x)
$13:cd6b  c0 23 3c      cpy #$3c23
$13:cd6e  2e 4f 83      rol $834f
$13:cd71  cf f0 ab 56   cmp $56abf0
$13:cd75  2a            rol a
$13:cd76  55 86         eor $86,x
$13:cd78  59 7c 08      eor $087c,y
$13:cd7b  02 3f         cop #$3f
$13:cd7d  2a            rol a
$13:cd7e  fe 81 56      inc $5681,x
$13:cd81  11 0b         ora ($0b),y
$13:cd83  75 43         adc $43,x
$13:cd85  c1 cc         cmp ($cc,x)
$13:cd87  e1 c2         sbc ($c2,x)
$13:cd89  27 d1         and [$d1]
$13:cd8b  4b            phk
$13:cd8c  be 83 c3      ldx $c383,y
$13:cd8f  be ff d7      ldx $d7ff,y
$13:cd92  af fe 78 c7   lda $c778fe
$13:cd96  be 21 33      ldx $3321,y
$13:cd99  86 11         stx $11
$13:cd9b  43 e9         eor $e9,s
$13:cd9d  0f b0 47 ef   ora $ef47b0
$13:cda1  d0 1d         bne $cdc0
$13:cda3  f4 06 71      pea $7106
$13:cda6  f8            sed
$13:cda7  87 df         sta [$df]
$13:cda9  e0 7f fa      cpx #$fa7f
$13:cdac  05 bf         ora $bf
$13:cdae  63 b3         adc $b3,s
$13:cdb0  fc 7e 6c      jsr ($6c7e,x)
$13:cdb3  5f 8c 3d 98   eor $983d8c,x
$13:cdb7  8a            txa
$13:cdb8  43 f0         eor $f0,s
$13:cdba  bf e0 37 fc   lda $fc37e0,x
$13:cdbe  07 19         ora [$19]
$13:cdc0  5e 70 1f      lsr $1f70,x
$13:cdc3  1f e7 07 e9   ora $e907e7,x
$13:cdc7  c1 f0         cmp ($f0,x)
$13:cdc9  78            sei
$13:cdca  ff 1f ef c7   sbc $c7ef1f,x
$13:cdce  f7 e3         sbc [$e3],y
$13:cdd0  58            cli
$13:cdd1  f1 32         sbc ($32),y
$13:cdd3  83 fd         sta $fd,s
$13:cdd5  00 7f         brk #$7f
$13:cdd7  97 f2         sta [$f2],y
$13:cdd9  01 f9         ora ($f9,x)
$13:cddb  80 7c         bra $ce59
$13:cddd  e0 1e 70      cpx #$701e
$13:cde0  00 83         brk #$83
$13:cde2  9e 03 01      stz $0103,x
$13:cde5  81 c0         sta ($c0,x)
$13:cde7  e0 f0 48      cpx #$48f0
$13:cdea  28            plp
$13:cdeb  49 50 43      eor #$4350
$13:cdee  07 14         ora [$14]
$13:cdf0  0c 16 05      tsb $0516
$13:cdf3  2c b6 5d      bit $5db6
$13:cdf6  2f 96 5b ed   and $ed5b96
$13:cdfa  3f ff 0f 70   and $700fff,x
$13:cdfe  86 3e         stx $3e
$13:ce00  01 80         ora ($80,x)
$13:ce02  41 85         eor ($85,x)
$13:ce04  b2 27         lda ($27)
$13:ce06  7c 81 ff      jmp ($ff81,x)
$13:ce09  60            rts
$13:ce0a  4e 12 22      lsr $2212
$13:ce0d  a3 bc         lda $bc,s
$13:ce0f  3c bf cf      bit $cfbf,x
$13:ce12  0f db 87 e8   ora $e887db
$13:ce16  83 72         sta $72,s
$13:ce18  25 b0         and $b0
$13:ce1a  1e c4 0b      asl $0bc4,x
$13:ce1d  3f 3e 7f f4   and $f47f3e,x
$13:ce21  d3 ed         cmp ($ed,s),y
$13:ce23  1c ff 43      trb $43ff
$13:ce26  27 98         and [$98]
$13:ce28  0d f6 0f      ora $0ff6
$13:ce2b  3f 43 a6 63   and $63a643,x
$13:ce2f  30 35         bmi $ce66
$13:ce31  7e 7f de      ror $de7f,x
$13:ce34  10 e1         bpl $ce17
$13:ce36  34 20         bit $20,x
$13:ce38  ef d0 83 3f   sbc $3f83d0
$13:ce3c  07 1e         ora [$1e]
$13:ce3e  03 00         ora $00,s
$13:ce40  0e 0a 3f      asl $3f0a
$13:ce43  03 f5         ora $f5,s
$13:ce45  07 e6         ora [$e6]
$13:ce47  f9 65 b2      sbc $b265,y
$13:ce4a  50 72         bvc $cebe
$13:ce4c  25 03         and $03
$13:ce4e  0e 82 12      asl $1282
$13:ce51  18            clc
$13:ce52  4f 78 50 08   eor $085078
$13:ce56  42 c0         wdm #$c0
$13:ce58  63 91         adc $91,s
$13:ce5a  48            pha
$13:ce5b  a4 6a         ldy $6a
$13:ce5d  25 05         and $05
$13:ce5f  88            dey
$13:ce60  c3 e3         cmp $e3,s
$13:ce62  10 b8         bpl $ce1c
$13:ce64  4c 21 5e      jmp $5e21
$13:ce67  10 08         bpl $ce71
$13:ce69  e4 02         cpx $02
$13:ce6b  29 08 89      and #$8908
$13:ce6e  43 22         eor $22,s
$13:ce70  30 e8         bmi $ce5a
$13:ce72  c4 1e         cpy $1e
$13:ce74  12 29         ora ($29)
$13:ce76  00 73         brk #$73
$13:ce78  41 20         eor ($20,x)
$13:ce7a  90 e8         bcc $ce64
$13:ce7c  54 2e 1b      mvn $1b,$2e
$13:ce7f  09 68 3c      ora #$3c68
$13:ce82  02 1d         cop #$1d
$13:ce84  00 85         brk #$85
$13:ce86  c1 21         cmp ($21,x)
$13:ce88  30 69         bmi $cef3
$13:ce8a  e5 ce         sbc $ce
$13:ce8c  31 79         and ($79),y
$13:ce8e  87 5f         sta [$5f]
$13:ce90  a4 73         ldy $73
$13:ce92  f8            sed
$13:ce93  8c fe 25      sty $25fe
$13:ce96  3e 83 c7      rol $c783,x
$13:ce99  e0 30 f8      cpx #$f830
$13:ce9c  1c 30 52      trb $5230
$13:ce9f  02 50         cop #$50
$13:cea1  10 a3         bpl $ce46
$13:cea3  3c cc a1      bit $a1cc,x
$13:cea6  f0 67         beq $cf0f
$13:cea8  87 83         sta [$83]
$13:ceaa  c7 00         cmp [$00]
$13:ceac  8c 47 e3      sty $e347
$13:ceaf  fe 3f fe      inc $fe3f,x
$13:ceb2  7b            tdc
$13:ceb3  fe 45 48      inc $4845,x
$13:ceb6  fa            plx
$13:ceb7  08            php
$13:ceb8  7c 0c f4      jmp ($f40c,x)
$13:cebb  9f e0 31 f7   sta $f731e0,x
$13:cebf  0b            phd
$13:cec0  87 0f         sta [$0f]
$13:cec2  c6 b3         dec $b3
$13:cec4  0f 87 c0 3c   ora $3cc087
$13:cec8  1c be fa      trb $fabe
$13:cecb  a4 10         ldy $10
$13:cecd  e1 8f         sbc ($8f,x)
$13:cecf  32 0a         and ($0a)
$13:ced1  a4 21         ldy $21
$13:ced3  ec f1 98      cpx $98f1
$13:ced6  40            rti
$13:ced7  27 9c         and [$9c]
$13:ced9  e8            inx
$13:ceda  c6 7a         dec $7a
$13:cedc  e1 7e         sbc ($7e,x)
$13:cede  f2 7f         sbc ($7f)
$13:cee0  3d 1f ca      and $ca1f,x
$13:cee3  45 f3         eor $f3
$13:cee5  c1 f8         cmp ($f8,x)
$13:cee7  e0 7c 38      cpx #$387c
$13:ceea  13 01         ora ($01,s),y
$13:ceec  48            pha
$13:ceed  25 05         and $05
$13:ceef  44 6c f2      mvp $f2,$6c
$13:cef2  c9 7c ad      cmp #$ad7c
$13:cef5  1e 8a 3f      asl $3f8a,x
$13:cef8  1e 7f ff      asl $ff7f,x
$13:cefb  8e 7f f8      stx $f87f
$13:cefe  1f f9 14 c3   ora $c314f9,x
$13:cf02  e7 fa         sbc [$fa]
$13:cf04  f9 43 fd      sbc $fd43,y
$13:cf07  11 fe         ora ($fe),y
$13:cf09  3c e0 3e      bit $3ee0,x
$13:cf0c  93 fe         sta ($fe,s),y
$13:cf0e  07 f6         ora [$f6]
$13:cf10  01 f1         ora ($f1,x)
$13:cf12  fe 79 7f      inc $7f79,x
$13:cf15  9c df e4      stz $e4df
$13:cf18  0f f9 26 fc   ora $fc26f9
$13:cf1c  73 7e         adc ($7e,s),y
$13:cf1e  31 8f         and ($8f),y
$13:cf20  14 7e         trb $7e
$13:cf22  fd fe 80      sbc $80fe,x
$13:cf25  27 c8         and [$c8]
$13:cf27  20 1f 98      jsr $981f
$13:cf2a  07 ce         ora [$ce]
$13:cf2c  01 e7         ora ($e7,x)
$13:cf2e  50 0d         bvc $cf3d
$13:cf30  06 3d         asl $3d
$13:cf32  41 e0         eor ($e0,x)
$13:cf34  cf f7 f6 0b   cmp $0bf6f7
$13:cf38  ff 00 20 1c   sbc $1c2000,x
$13:cf3c  06 79         asl $79
$13:cf3e  7f a0 3b e5   adc $e53ba0,x
$13:cf42  c8            iny
$13:cf43  9a            txs
$13:cf44  50 14         bvc $cf5a
$13:cf46  51 8c         eor ($8c),y
$13:cf48  c7 83         cmp [$83]
$13:cf4a  e1 80         sbc ($80,x)
$13:cf4c  5d 18 29      eor $2918,x
$13:cf4f  05 2a         ora $2a
$13:cf51  e0 9b f5      cpx #$f59b
$13:cf54  fa            plx
$13:cf55  84 f3         sty $f3
$13:cf57  57 88         eor [$88],y
$13:cf59  19 c1 df      ora $dfc1,y
$13:cf5c  d0 28         bne $cf86
$13:cf5e  1c 12 0f      trb $0f12
$13:cf61  0d 83 c3      ora $c383
$13:cf64  a0 30 d8      ldy #$d830
$13:cf67  54 20 92      mvn $92,$20
$13:cf6a  11 e0         ora ($e0),y
$13:cf6c  d8            cld
$13:cf6d  42 e0         wdm #$e0
$13:cf6f  84 90         sty $90
$13:cf71  83 c2         sta $c2,s
$13:cf73  09 01 18      ora #$1801
$13:cf76  83 c7         sta $c7,s
$13:cf78  e0 02 92      cpx #$9202
$13:cf7b  84 d7         sty $d7
$13:cf7d  33 bd         and ($bd,s),y
$13:cf7f  e8            inx
$13:cf80  ee fb 1b      inc $1bfb
$13:cf83  3c a1 cf      bit $cfa1,x
$13:cf86  a5 77         lda $77
$13:cf88  28            plp
$13:cf89  35 d0         and $d0,x
$13:cf8b  76 08         ror $08,x
$13:cf8d  54 a7 ec      mvn $ec,$a7
$13:cf90  30 b7         bmi $cf49
$13:cf92  8f ac 23 f5   sta $f523ac
$13:cf96  00 25         brk #$25
$13:cf98  84 22         sty $22
$13:cf9a  11 18         ora ($18),y
$13:cf9c  88            dey
$13:cf9d  4b            phk
$13:cf9e  a6 51         ldx $51
$13:cfa0  49 d4 ba      eor #$bad4
$13:cfa3  55 14         eor $14,x
$13:cfa5  93 40         sta ($40,s),y
$13:cfa7  23 8d         and $8d,s
$13:cfa9  92 86         sta ($86)
$13:cfab  40            rti
$13:cfac  20 8d 91      jsr $918d
$13:cfaf  88            dey
$13:cfb0  33 82         and ($82,s),y
$13:cfb2  45 00         eor $00
$13:cfb4  8a            txa
$13:cfb5  3f c2 77 6b   and $6b77c2,x
$13:cfb9  8a            txa
$13:cfba  49 e1 33      eor #$33e1
$13:cfbd  08            php
$13:cfbe  44 5a 0b      mvp $0b,$5a
$13:cfc1  15 86         ora $86,x
$13:cfc3  c3 61         cmp $61,s
$13:cfc5  f0 78         beq $d03f
$13:cfc7  3c 0e 37      bit $370e,x
$13:cfca  04 14         tsb $14
$13:cfcc  80 68         bra $d036
$13:cfce  03 41         ora $41,s
$13:cfd0  0d 81 41      ora $4181
$13:cfd3  60            rts
$13:cfd4  50 b3         bvc $cf89
$13:cfd6  10 f3         bpl $cfcb
$13:cfd8  bc f0 ac      ldy $acf0,x
$13:cfdb  3f e6 03 fe   and $fe03e6,x
$13:cfdf  0a            asl a
$13:cfe0  07 2f         ora [$2f]
$13:cfe2  09 92 e2      ora #$e292
$13:cfe5  7c 23 11      jmp ($1123,x)
$13:cfe8  81 f9         sta ($f9,x)
$13:cfea  7f a0 1f 88   adc $881fa0,x
$13:cfee  07 d2         ora [$d2]
$13:cff0  01 9c         ora ($9c,x)
$13:cff2  b0 7f         bcs $d073
$13:cff4  1b            tcs
$13:cff5  c3 03         cmp $03,s
$13:cff7  84 c1         sty $c1
$13:cff9  61 8b         adc ($8b,x)
$13:cffb  10 81         bpl $cf7e
$13:cffd  41 96         eor ($96,x)
$13:cfff  a1 01         lda ($01,x)
$13:d001  81 ab         sta ($ab,x)
$13:d003  82 01 01      brl $d107
$13:d006  84 c1         sty $c1
$13:d008  e1 90         sbc ($90,x)
$13:d00a  36 08         rol $08,x
$13:d00c  2e 01 70      rol $7001
$13:d00f  a0 e0 84      ldy #$84e0
$13:d012  40            rti
$13:d013  e1 10         sbc ($10,x)
$13:d015  58            cli
$13:d016  2c 06 09      bit $0906
$13:d019  02 81         cop #$81
$13:d01b  03 82         ora $82,s
$13:d01d  02 cd         cop #$cd
$13:d01f  08            php
$13:d020  0c 20 46      tsb $4620
$13:d023  10 78         bpl $d09d
$13:d025  28            plp
$13:d026  40            rti
$13:d027  20 6d a0      jsr $a06d
$13:d02a  6d 19 88      adc $8819
$13:d02d  21 f0         and ($f0,x)
$13:d02f  58            cli
$13:d030  6c 05 12      jmp ($1205)
$13:d033  0b            phd
$13:d034  82 66 83      brl $539d
$13:d037  ec db 02      cpx $02db
$13:d03a  f9 62 e8      sbc $e862,y
$13:d03d  dc 3e f3      jml [$f33e]
$13:d040  0f ac 33 ff   ora $ff33ac
$13:d044  a2 f7 d8      ldx #$d8f7
$13:d047  3c b1 e2      bit $e2b1,x
$13:d04a  18            clc
$13:d04b  5f 8d a1 0e   eor $0ea18d,x
$13:d04f  0f 09 b4 0b   ora $0bb409
$13:d053  81 1e         sta ($1e,x)
$13:d055  03 2e         ora $2e,s
$13:d057  53 ef         eor ($ef,s),y
$13:d059  18            clc
$13:d05a  cf c9 3c f4   cmp $f43cc9
$13:d05e  2e ff 0b      rol $0bff
$13:d061  b7 7c         lda [$7c],y
$13:d063  0d 1d e2      ora $e21d
$13:d066  01 60         ora ($60,x)
$13:d068  34 04         bit $04,x
$13:d06a  02 78         cop #$78
$13:d06c  44 10 32      mvp $32,$10
$13:d06f  fc 28 05      jsr ($0528,x)
$13:d072  00 f0         brk #$f0
$13:d074  60            rts
$13:d075  15 a1         ora $a1,x
$13:d077  c0 80 60      cpy #$6080
$13:d07a  00 ce         brk #$ce
$13:d07c  63 f6         adc $f6,s
$13:d07e  d8            cld
$13:d07f  36 c2         rol $c2,x
$13:d081  06 79         asl $79
$13:d083  33 73         and ($73,s),y
$13:d085  33 05         and ($05,s),y
$13:d087  74 4b         stz $4b,x
$13:d089  a0 8f d2      ldy #$d28f
$13:d08c  2f f9 8f fe   and $fe8ff9
$13:d090  13 df         ora ($df,s),y
$13:d092  cb            wai
$13:d093  f7 dd         sbc [$dd],y
$13:d095  3e f2 bf      rol $bff2,x
$13:d098  de 53 b8      dec $b853,x
$13:d09b  fd 1a 01      sbc $011a,x
$13:d09e  64 22         stz $22
$13:d0a0  0a            asl a
$13:d0a1  40            rti
$13:d0a2  e0 42 28      cpx #$2842
$13:d0a5  10 48         bpl $d0ef
$13:d0a7  04 8f         tsb $8f
$13:d0a9  01 40         ora ($40,x)
$13:d0ab  ef d8 fd f2   sbc $f2fdd8
$13:d0af  3b            tsc
$13:d0b0  64 72         stz $72
$13:d0b2  e3 17         sbc $17,s
$13:d0b4  97 ce         sta [$ce],y
$13:d0b6  e5 71         sbc $71
$13:d0b8  49 3c 26      eor #$263c
$13:d0bb  61 3f         adc ($3f,x)
$13:d0bd  47 83         eor [$83]
$13:d0bf  00 61         brk #$61
$13:d0c1  ec 01 8d      cpx $8d01
$13:d0c4  c1 18         cmp ($18,x)
$13:d0c6  65 40         adc $40
$13:d0c8  a0 49 f4      ldy #$f449
$13:d0cb  1f a8 3f 37   ora $373fa8,x
$13:d0cf  cb            wai
$13:d0d0  2d 92 f3      and $f392
$13:d0d3  bc f0 ac      ldy $acf0,x
$13:d0d6  3f e6 02 5a   and $5a02e6,x
$13:d0da  0e 3c 00      asl $003c
$13:d0dd  34 1f         bit $1f,x
$13:d0df  d8            cld
$13:d0e0  14 f7         trb $f7
$13:d0e2  84 1a         sty $1a
$13:d0e4  00 d0         brk #$d0
$13:d0e6  7f 84 61 08   adc $086184,x
$13:d0ea  80 cc         bra $d0b8
$13:d0ec  64 73         stz $73
$13:d0ee  3d 97 ce      and $ce97,x
$13:d0f1  49 77 c7      eor #$c777
$13:d0f4  e3 f9         sbc $f9,s
$13:d0f6  9c cb 87      stz $87cb
$13:d0f9  c5 7e         cmp $7e
$13:d0fb  01 c0         ora ($c0,x)
$13:d0fd  be 00 87      ldx $8700,y
$13:d100  f1 00         sbc ($00),y
$13:d102  b8            clv
$13:d103  40            rti
$13:d104  26 6c         rol $6c
$13:d106  41 84         eor ($84,x)
$13:d108  43 23         eor $23,s
$13:d10a  11 cf         ora ($cf),y
$13:d10c  87 e2         sta [$e2]
$13:d10e  41 f0         eor ($f0,x)
$13:d110  2a            rol a
$13:d111  87 03         sta [$03]
$13:d113  c1 10         cmp ($10,x)
$13:d115  88            dey
$13:d116  15 c3         ora $c3,x
$13:d118  e1 00         sbc ($00,x)
$13:d11a  f0 1b         beq $d137
$13:d11c  1c 42 01      trb $0142
$13:d11f  f0 17         beq $d138
$13:d121  78            sei
$13:d122  fb            xce
$13:d123  61 51         adc ($51,x)
$13:d125  b8            clv
$13:d126  8c 3a 39      sty $393a
$13:d129  1c 89 45      trb $4589
$13:d12c  22 d1 08 a4   jsl $a408d1
$13:d130  3a            dec a
$13:d131  11 18         ora ($18),y
$13:d133  82 44 22      brl $f37a
$13:d136  31 b8         and ($b8),y
$13:d138  fc 7e 05      jsr ($057e,x)
$13:d13b  1e 87 19      asl $1987,x
$13:d13e  06 7d         asl $7d
$13:d140  3e 8a 43      rol $438a,x
$13:d143  22 10 c7 70   jsl $70c710
$13:d147  5f af d4 23   eor $23d4af,x
$13:d14b  9a            txs
$13:d14c  9c 40 94      stz $9440
$13:d14f  47 1f         eor [$1f]
$13:d151  41 7a         eor ($7a,x)
$13:d153  4f 09 45 20   eor $204509
$13:d157  88            dey
$13:d158  44 a0 30      mvp $30,$a0
$13:d15b  58            cli
$13:d15c  1c 2a 03      trb $032a
$13:d15f  06 b3         asl $b3
$13:d161  12 12         ora ($12)
$13:d163  61 30         adc ($30,x)
$13:d165  99 cc e0      sta $e0cc,y
$13:d168  f0 78         beq $d1e2
$13:d16a  7c 3e d3      jmp ($d33e,x)
$13:d16d  6f 77 04 42   adc $420477
$13:d171  11 28         ora ($28),y
$13:d173  82 42 1d      brl $eeb8
$13:d176  c1 c0         cmp ($c0,x)
$13:d178  0c 87 83      tsb $8387
$13:d17b  e1 a0         sbc ($a0,x)
$13:d17d  04 84         tsb $84
$13:d17f  02 31         cop #$31
$13:d181  18            clc
$13:d182  9e 4f 1c      stz $1c4f,x
$13:d185  20 d8 37      jsr $37d8
$13:d188  58            cli
$13:d189  8f b2 02 f0   sta $f002b2
$13:d18d  d8            cld
$13:d18e  1b            tcs
$13:d18f  f0 17         beq $d1a8
$13:d191  81 07         sta ($07,x)
$13:d193  82 41 a5      brl $76d7
$13:d196  12 ca         ora ($ca)
$13:d198  85 62         sta $62
$13:d19a  c1 30         cmp ($30,x)
$13:d19c  e0 58 31      cpx #$3158
$13:d19f  1c 02 51      trb $5102
$13:d1a2  35 42         and $42,x
$13:d1a4  20 b4 08      jsr $08b4
$13:d1a7  27 02         and [$02]
$13:d1a9  19 80 8e      ora $8e80,y
$13:d1ac  40            rti
$13:d1ad  27 10         and [$10]
$13:d1af  38            sec
$13:d1b0  1b            tcs
$13:d1b1  2c 26 13      bit $1326
$13:d1b4  fb            xce
$13:d1b5  05 fe         ora $fe
$13:d1b7  81 7f         sta ($7f,x)
$13:d1b9  c0 75 f1      cpy #$f175
$13:d1bc  1d 8c 67      ora $678c,x
$13:d1bf  b4 18         ldy $18,x
$13:d1c1  30 f6         bmi $d1b9
$13:d1c3  20 40 2c      jsr $2c40
$13:d1c6  10 0a         bpl $d1d2
$13:d1c8  04 a3         tsb $a3
$13:d1ca  01 27         ora ($27,x)
$13:d1cc  c0 44 f0      cpy #$f044
$13:d1cf  0d 80 76      ora $7680
$13:d1d2  84 33         sty $33
$13:d1d4  f9 06 ff      sbc $ff06,y
$13:d1d7  40            rti
$13:d1d8  bf d0 1f 5c   lda $5c1fd0,x
$13:d1dc  66 37         ror $37
$13:d1de  31 db         and ($db),y
$13:d1e0  b5 c2         lda $c2,x
$13:d1e2  00 ee         brk #$ee
$13:d1e4  08            php
$13:d1e5  64 02         stz $02
$13:d1e7  0d 00 81      ora $8100
$13:d1ea  45 20         eor $20
$13:d1ec  3e 48 0f      rol $0f48,x
$13:d1ef  22 03 02 81   jsl $810203
$13:d1f3  83 c0         sta $c0,s
$13:d1f5  1e 0e f9      asl $f90e,x
$13:d1f8  81 3f         sta ($3f,x)
$13:d1fa  05 fb         ora $fb
$13:d1fc  3a            dec a
$13:d1fd  ff 7d 83 d1   sbc $d1837d,x
$13:d201  50 f9         bvc $d1fc
$13:d203  fb            xce
$13:d204  3d 9b 0f      and $0f9b,x
$13:d207  c5 a2         cmp $a2
$13:d209  f7 17         sbc [$17],y
$13:d20b  8f c0 20 f1   sta $f120c0
$13:d20f  0c 02 70      tsb $7002
$13:d212  08            php
$13:d213  40            rti
$13:d214  4d 08 7e      eor $7e08
$13:d217  02 0e         cop #$0e
$13:d219  46 01         lsr $01
$13:d21b  28            plp
$13:d21c  08            php
$13:d21d  82 2d 05      brl $d74d
$13:d220  8a            txa
$13:d221  c3 61         cmp $61,s
$13:d223  b0 f6         bcs $d21b
$13:d225  48            pha
$13:d226  03 40         ora $40,s
$13:d228  0c 64 20      tsb $2064
$13:d22b  86 c0         stx $c0
$13:d22d  a0 b0 28      ldy #$28b0
$13:d230  5c 02 08 04   jml $040802
$13:d234  5f f4 1e 1d   eor $1d1ef4,x
$13:d238  cb            wai
$13:d239  c2 64         rep #$64
$13:d23b  b8            clv
$13:d23c  9f 08 c4 60   sta $60c408,x
$13:d240  08            php
$13:d241  9f 88 07 d2   sta $d20788,x
$13:d245  01 9c         ora ($9c,x)
$13:d247  b0 7f         bcs $d2c8
$13:d249  20 1e 00      jsr $001e
$13:d24c  22 cc 3e 73   jsl $733ecc
$13:d250  9b            txy
$13:d251  dc 66 76      jml [$7666]
$13:d254  f3 08         sbc ($08,s),y
$13:d256  44 6e 19      mvp $19,$6e
$13:d259  1d 82 43      ora $4382,x
$13:d25c  42 20         wdm #$20
$13:d25e  42 08         wdm #$08
$13:d260  38            sec
$13:d261  01 57         ora ($57,x)
$13:d263  00 b8         brk #$b8
$13:d265  04 20         tsb $20
$13:d267  72 3d         adc ($3d)
$13:d269  16 0b         asl $0b,x
$13:d26b  84 82         sty $82
$13:d26d  61 a0         adc ($a0,x)
$13:d26f  d8            cld
$13:d270  05 43         ora $43
$13:d272  c9 f4 a2      cmp #$a2f4
$13:d275  79 2c 9f      adc $9f2c,y
$13:d278  43 10         eor $10,s
$13:d27a  5e 30 13      lsr $1330,x
$13:d27d  8e 06 e2      stx $e206
$13:d280  80 25         bra $d2a7
$13:d282  06 f8         asl $f8
$13:d284  0a            asl a
$13:d285  48            pha
$13:d286  5d e3 ed      eor $ede3,x
$13:d289  82 44 22      brl $f4d0
$13:d28c  85 01         sta $01
$13:d28e  8c 44 21      sty $2144
$13:d291  90 49         bcc $d2dc
$13:d293  64 92         stz $92
$13:d295  10 5a         bpl $d2f1
$13:d297  12 b0         ora ($b0)
$13:d299  17 d2         ora [$d2],y
$13:d29b  09 18 92      ora #$9218
$13:d29e  1a            inc a
$13:d29f  0d d6 17      ora $17d6
$13:d2a2  eb            xba
$13:d2a3  f5 08         sbc $08,x
$13:d2a5  e6 a7         inc $a7
$13:d2a7  10 75         bpl $d31e
$13:d2a9  91 c7         sta ($c7),y
$13:d2ab  d0 5e         bne $d30b
$13:d2ad  93 af         sta ($af,s),y
$13:d2af  5c ce 41 00   jml $0041ce
$13:d2b3  81 40         sta ($40,x)
$13:d2b5  0a            asl a
$13:d2b6  c1 3c         cmp ($3c,x)
$13:d2b8  87 4b         sta [$4b]
$13:d2ba  20 c5 30      jsr $30c5
$13:d2bd  75 87         adc $87,x
$13:d2bf  f3 ff         sbc ($ff,s),y
$13:d2c1  67 b3         adc [$b3]
$13:d2c3  c0 e0 71      cpy #$71e0
$13:d2c6  c8            iny
$13:d2c7  e4 f9         cpx $f9
$13:d2c9  8e 30 c8      stx $c830
$13:d2cc  e3 ac         sbc $ac,s
$13:d2ce  2a            rol a
$13:d2cf  52 6d         eor ($6d)
$13:d2d1  26 0a         rol $0a
$13:d2d3  e1 00         sbc ($00,x)
$13:d2d5  d8            cld
$13:d2d6  5e 32 11      lsr $1132,x
$13:d2d9  89 81 24      bit #$2481
$13:d2dc  fe df 6b      inc $6bdf,x
$13:d2df  37 9b         and [$9b],y
$13:d2e1  e1 f0         sbc ($f0,x)
$13:d2e3  fc 39 46      jsr ($4639,x)
$13:d2e6  e0 d3 02      cpx #$02d3
$13:d2e9  58            cli
$13:d2ea  c0 e0 30      cpy #$30e0
$13:d2ed  c8            iny
$13:d2ee  4c 62 25      jmp $2562
$13:d2f1  04 93         tsb $93
$13:d2f3  4e 2d 90      lsr $902d
$13:d2f6  0a            asl a
$13:d2f7  45 43         eor $43
$13:d2f9  b1 41         lda ($41),y
$13:d2fb  e8            inx
$13:d2fc  41 a0         eor ($a0,x)
$13:d2fe  0f f0 86 40   ora $4086f0
$13:d302  63 10         adc $10,s
$13:d304  18            clc
$13:d305  84 0e         sty $0e
$13:d307  61 07         adc ($07,x)
$13:d309  90 02         bcc $d30d
$13:d30b  82 1f 18      brl $eb2d
$13:d30e  c0 36 41      cpy #$4136
$13:d311  b2 16         lda ($16)
$13:d313  08            php
$13:d314  85 02         sta $02
$13:d316  61 da         adc ($da,x)
$13:d318  91 6a         sta ($6a),y
$13:d31a  29 12 05      and #$0512
$13:d31d  88            dey
$13:d31e  5e 20 1f      lsr $1f20,x
$13:d321  01 0a         ora ($0a,x)
$13:d323  41 3f         eor ($3f,x)
$13:d325  11 0f         ora ($0f),y
$13:d327  05 03         ora $03
$13:d329  21 87         and ($87,x)
$13:d32b  f3 e4         sbc ($e4,s),y
$13:d32d  3a            dec a
$13:d32e  95 ca         sta $ca,x
$13:d330  ed 3e df      sbc $df3e
$13:d333  30 98         bmi $d2cd
$13:d335  46 23         lsr $23
$13:d337  30 18         bmi $d351
$13:d339  7b            tdc
$13:d33a  b8            clv
$13:d33b  01 e1         ora ($e1,x)
$13:d33d  2f c0 48 e8   and $e848c0
$13:d341  01 60         ora ($60,x)
$13:d343  87 82         sta [$82]
$13:d345  c1 78         cmp ($78,x)
$13:d347  2e b0 f0      rol $f0b0
$13:d34a  f9 e1 32      sbc $32e1,y
$13:d34d  b9 d6 eb      lda $ebd6,y
$13:d350  e5 f6         sbc $f6
$13:d352  82 43 23      brl $f698
$13:d355  19 8e 00      ora $008e,y
$13:d358  88            dey
$13:d359  38            sec
$13:d35a  00 50         brk #$50
$13:d35c  fa            plx
$13:d35d  40            rti
$13:d35e  78            sei
$13:d35f  90 28         bcc $d389
$13:d361  44 08 50      mvp $50,$08
$13:d364  1e 08 43      asl $4308,x
$13:d367  68            pla
$13:d368  e0 13 88      cpx #$8813
$13:d36b  05 62         ora $62
$13:d36d  79 ac af      adc $afac,y
$13:d370  67 a0         adc [$a0]
$13:d372  97 4b         sta [$4b],y
$13:d374  84 a1         sty $a1
$13:d376  62 06 e2      per $b57f
$13:d379  9c 5f 2f      stz $2f5f
$13:d37c  9f e4 28 e3   sta $e328e4,x
$13:d380  bf d5 cb e3   lda $e3cbd5,x
$13:d384  ac a3 10      ldy $10a3
$13:d387  0a            asl a
$13:d388  d4 63         pei ($63)
$13:d38a  5b            tcd
$13:d38b  3c d3 4f      bit $4fd3,x
$13:d38e  92 61         sta ($61)
$13:d390  5a            phy
$13:d391  a1 3a         lda ($3a,x)
$13:d393  ca            dex
$13:d394  79 3c b3      adc $b33c,y
$13:d397  5f b8 7f fe   eor $fe7fb8,x
$13:d39b  0f ff cf ff   ora $ffcfff
$13:d39f  9e 5f 9d      stz $9d5f,x
$13:d3a2  85 03         sta $03
$13:d3a4  8b            phb
$13:d3a5  c5 27         cmp $27
$13:d3a7  92 3b         sta ($3b)
$13:d3a9  44 fe d3      mvp $d3,$fe
$13:d3ac  57 e1         eor [$e1],y
$13:d3ae  d6 fa         dec $fa,x
$13:d3b0  75 fe         adc $fe,x
$13:d3b2  dc 0e 01      jml [$010e]
$13:d3b5  17 50         ora [$50],y
$13:d3b7  04 0e         tsb $0e
$13:d3b9  d1 17         cmp ($17),y
$13:d3bb  b4 c5         ldy $c5,x
$13:d3bd  f8            sed
$13:d3be  73 fe         adc ($fe,s),y
$13:d3c0  9c ff b7      stz $b7ff
$13:d3c3  3f 80 78 3c   and $3c7880,x
$13:d3c7  1f 88 c4 73   ora $73c488,x
$13:d3cb  e9 c6 e8      sbc #$e8c6
$13:d3ce  67 36         adc [$36]
$13:d3d0  90 6f         bcc $d441
$13:d3d2  d7 8f         cmp [$8f],y
$13:d3d4  f5 f3         sbc $f3,x
$13:d3d6  f0 40         beq $d418
$13:d3d8  3f 10 08 e7   and $e70810,x
$13:d3dc  83 8d         sta $8d,s
$13:d3de  f8            sed
$13:d3df  ce 78 20      dec $2078
$13:d3e2  df 8f 1f f3   cmp $f31f8f,x
$13:d3e6  e7 fc         sbc [$fc]
$13:d3e8  36 10         rol $10,x
$13:d3ea  74 60         stz $60,x
$13:d3ec  10 a8         bpl $d396
$13:d3ee  24 42         bit $42
$13:d3f0  11 08         ora ($08),y
$13:d3f2  8c c2 60      sty $60c2
$13:d3f5  8e f6 87      stx $87f6
$13:d3f8  43 a3         eor $a3,s
$13:d3fa  03 90         ora $90,s
$13:d3fc  8c c3 61      sty $61c3
$13:d3ff  a6 c2         ldx $c2
$13:d401  82 63 21      brl $f567
$13:d404  0f e2 e0 70   ora $70e0e2
$13:d408  1b            tcs
$13:d409  e0 df 03      cpx #$03df
$13:d40c  60            rts
$13:d40d  e3 31         sbc $31,s
$13:d40f  90 c8         bcc $d3d9
$13:d411  60            rts
$13:d412  60            rts
$13:d413  c5 62         cmp $62
$13:d415  6b            rtl
$13:d416  43 5a         eor $5a,s
$13:d418  41 60         eor ($60,x)
$13:d41a  70 b8         bvs $d3d4
$13:d41c  38            sec
$13:d41d  be a0 f0      ldx $f0a0,y
$13:d420  78            sei
$13:d421  7c 3c 5f      jmp ($5f3c,x)
$13:d424  58            cli
$13:d425  0e 04 03      asl $0304
$13:d428  40            rti
$13:d429  2f a1 49 0b   and $0b49a1
$13:d42d  e8            inx
$13:d42e  f5 e2         sbc $e2,x
$13:d430  f6 7f         inc $7f,x
$13:d432  0e 82 c1      asl $c182
$13:d435  40            rti
$13:d436  02 0c         cop #$0c
$13:d438  82 30 46      brl $1a6b
$13:d43b  28            plp
$13:d43c  23 f8         and $f8,s
$13:d43e  45 69         eor $69
$13:d440  78            sei
$13:d441  bc 0b da      ldy $da0b,x
$13:d444  05 02         ora $02
$13:d446  c0 50 28      cpy #$2850
$13:d449  10 08         bpl $d453
$13:d44b  40            rti
$13:d44c  f9 d6 e0      sbc $e0d6,y
$13:d44f  1a            inc a
$13:d450  00 d0         brk #$d0
$13:d452  13 71         ora ($71,s),y
$13:d454  b5 e4         lda $e4,x
$13:d456  61 8a         adc ($8a,x)
$13:d458  4d a2 17      eor $17a2
$13:d45b  49 cd f6      eor #$f6cd
$13:d45e  e7 ff         sbc [$ff]
$13:d460  e6 7f         inc $7f
$13:d462  e3 1f         sbc $1f,s
$13:d464  eb            xba
$13:d465  07 f2         ora [$f2]
$13:d467  07 ff         ora [$ff]
$13:d469  84 40         sty $40
$13:d46b  61 10         adc ($10,x)
$13:d46d  36 30         rol $30,x
$13:d46f  11 8e         ora ($8e),y
$13:d471  03 00         ora $00,s
$13:d473  01 04         ora ($04,x)
$13:d475  02 51         cop #$51
$13:d477  28            plp
$13:d478  c0 60 20      cpy #$2060
$13:d47b  14 08         trb $08
$13:d47d  66 02         ror $02
$13:d47f  61 0c         adc ($0c,x)
$13:d481  b3 46         lda ($46,s),y
$13:d483  2c 76 3a      bit $3a76
$13:d486  05 c2         ora $c2
$13:d488  21 c6         and ($c6,x)
$13:d48a  b0 47         bcs $d4d3
$13:d48c  30 13         bmi $d4a1
$13:d48e  c8            iny
$13:d48f  05 f2         ora $f2
$13:d491  01 fc         ora ($fc,x)
$13:d493  80 7f         bra $d514
$13:d495  84 41         sty $41
$13:d497  80 86         bra $d41f
$13:d499  42 20         wdm #$20
$13:d49b  91 68         sta ($68),y
$13:d49d  85 72         sta $72
$13:d49f  99 22 b7      sta $b722,y
$13:d4a2  47 a7         eor [$a7]
$13:d4a4  c8            iny
$13:d4a5  f0 88         beq $d42f
$13:d4a7  4c 21 11      jmp $1121
$13:d4aa  88            dey
$13:d4ab  f4 7a 5f      pea $5f7a
$13:d4ae  3f 99 df e2   and $e2df99,x
$13:d4b2  37 f8         and [$f8],y
$13:d4b4  04 fa         tsb $fa
$13:d4b6  31 18         and ($18),y
$13:d4b8  84 4e         sty $4e
$13:d4ba  20 09 e2      jsr $e209
$13:d4bd  5f 04 7e 01   eor $017e04,x
$13:d4c1  3f 2a 89 18   and $18892a,x
$13:d4c5  3f e5 b1 28   and $28b1e5,x
$13:d4c9  72 a8         adc ($a8)
$13:d4cb  05 00         ora $00
$13:d4cd  5c 23 a3 1c   jml $1ca323
$13:d4d1  3a            dec a
$13:d4d2  01 34         ora ($34,x)
$13:d4d4  8e 55 a8      stx $a855
$13:d4d7  5f 3d 8e 2e   eor $2e8e3d,x
$13:d4db  75 5e         adc $5e,x
$13:d4dd  9a            txs
$13:d4de  56 29         lsr $29,x
$13:d4e0  0c 22 9e      tsb $9e22
$13:d4e3  4f 2f d7 ee   eor $eed72f
$13:d4e7  7f ff 8f ff   adc $ff8fff,x
$13:d4eb  ff 7f a6 82   sbc $82a67f,x
$13:d4ef  60            rts
$13:d4f0  14 87         trb $87
$13:d4f2  e3 ff         sbc $ff,s
$13:d4f4  f9 fe fc      sbc $fcfe,y
$13:d4f7  7f 9f 0f d7   adc $d70f9f,x
$13:d4fb  0b            phd
$13:d4fc  e9 04 e4      sbc #$e404
$13:d4ff  42 2c         wdm #$2c
$13:d501  16 0f         asl $0f,x
$13:d503  ff e1 5e 1f   sbc $1f5ee1,x
$13:d507  ef 83 0c 3f   sbc $3f0c83
$13:d50b  9c 0f c4      stz $c40f
$13:d50e  03 e1         ora $e1,s
$13:d510  00 09         brk #$09
$13:d512  03 28         ora $28,s
$13:d514  30 1a         bmi $d530
$13:d516  0d 85 e3      ora $e385
$13:d519  11 8c         ora ($8c),y
$13:d51b  b2 41         lda ($41)
$13:d51d  be 9e 6f      ldx $6f9e,y
$13:d520  d6 4f         dec $4f,x
$13:d522  f5 db         sbc $db,x
$13:d524  65 86         adc $86
$13:d526  82 81 78      brl $4daa
$13:d529  c0 63 2e      cpy #$2e63
$13:d52c  10 6f         bpl $d59d
$13:d52e  c7 9b         cmp [$9b]
$13:d530  f1 93         sbc ($93),y
$13:d532  fe 76 fd      inc $fd76,x
$13:d535  80 81         bra $d4b8
$13:d537  a0 02 80      ldy #$8002
$13:d53a  76 12         ror $12,x
$13:d53c  08            php
$13:d53d  82 74 93      brl $68b4
$13:d540  a5 41         lda $41
$13:d542  a0 c0 60      ldy #$60c0
$13:d545  33 19         and ($19,s),y
$13:d547  8c c2 60      sty $60c2
$13:d54a  f9 4e 04      sbc $044e,y
$13:d54d  42 31         wdm #$31
$13:d54f  90 b4         bcc $d505
$13:d551  7c 31 17      jmp ($1731,x)
$13:d554  0b            phd
$13:d555  84 09         sty $09
$13:d557  f2 9d         sbc ($9d)
$13:d559  0e 86 63      asl $6386
$13:d55c  31 f8         and ($f8),y
$13:d55e  11 8f         ora ($8f),y
$13:d560  cb            wai
$13:d561  e4 f9         cpx $f9
$13:d563  48            pha
$13:d564  54 1e 0b      mvn $0b,$1e
$13:d567  02 79         cop #$79
$13:d569  80 c8         bra $d533
$13:d56b  5f 2b 0f 1f   eor $1f0f2b,x
$13:d56f  8c 0c 86      sty $860c
$13:d572  2f 96 d0 5c   and $5cd096
$13:d576  24 17         bit $17
$13:d578  0a            asl a
$13:d579  84 82         sty $82
$13:d57b  80 cd         bra $d54a
$13:d57d  12 ba         ora ($ba)
$13:d57f  7c 0b e2      jmp ($e20b,x)
$13:d582  16 0f         asl $0f,x
$13:d584  02 00         cop #$00
$13:d586  0c f3 0a      tsb $0af3
$13:d589  82 45 61      brl $36d1
$13:d58c  d0 98         bne $d526
$13:d58e  34 19         bit $19,x
$13:d590  3c 23 54      bit $5423,x
$13:d593  87 43         sta [$43]
$13:d595  a3 e8         lda $e8,s
$13:d597  51 41         eor ($41),y
$13:d599  80 0c         bra $d5a7
$13:d59b  08            php
$13:d59c  61 98         adc ($98,x)
$13:d59e  be 6e 6f      ldx $6f6e,y
$13:d5a1  99 5b c4      sta $c45b,y
$13:d5a4  ea            nop
$13:d5a5  03 08         ora $08,s
$13:d5a7  83 c4         sta $c4,s
$13:d5a9  61 fd         adc ($fd,x)
$13:d5ab  28            plp
$13:d5ac  0f b3 99 fc   ora $fc99b3
$13:d5b0  fe 7f 54      inc $547f,x
$13:d5b3  23 7b         and $7b,s
$13:d5b5  bd cf e7      lda $e7cf,x
$13:d5b8  e8            inx
$13:d5b9  50 ff         bvc $d5ba
$13:d5bb  ff fe 7f fc   sbc $fc7ffe,x
$13:d5bf  bd be db      lda $dbbe,x
$13:d5c2  c3 c9         cmp $c9,s
$13:d5c4  50 67         bvc $d62d
$13:d5c6  3c 08 4f      bit $4f08,x
$13:d5c9  c3 e9         cmp $e9,s
$13:d5cb  f8            sed
$13:d5cc  bc 7f 17      ldy $177f,x
$13:d5cf  60            rts
$13:d5d0  ab            plb
$13:d5d1  05 fc         ora $fc
$13:d5d3  27 c1         and [$c1]
$13:d5d5  56 10         lsr $10,x
$13:d5d7  0c 06 03      tsb $0306
$13:d5da  80 d1         bra $d5ad
$13:d5dc  02 a8         cop #$a8
$13:d5de  15 82         ora $82,x
$13:d5e0  11 04         ora ($04),y
$13:d5e2  82 03 81      brl $56e8
$13:d5e5  9e 4e 13      stz $134e,x
$13:d5e8  68            pla
$13:d5e9  04 31         tsb $31
$13:d5eb  d2 2e         cmp ($2e)
$13:d5ed  10 88         bpl $d577
$13:d5ef  33 83         and ($83,s),y
$13:d5f1  fd 03 67      sbc $6703,x
$13:d5f4  07 ce         ora [$ce]
$13:d5f6  01 38         ora ($38,x)
$13:d5f8  81 a2         sta ($a2,x)
$13:d5fa  80 8c         bra $d588
$13:d5fc  83 62         sta $62,s
$13:d5fe  86 40         stx $40
$13:d600  20 e0 13      jsr $13e0
$13:d603  2e 86 02      rol $0286
$13:d606  60            rts
$13:d607  5e 02 f0      lsr $f002,x
$13:d60a  70 26         bvs $d632
$13:d60c  17 0c         ora [$0c],y
$13:d60e  44 61 a4      mvp $a4,$61
$13:d611  14 06         trb $06
$13:d613  e8            inx
$13:d614  5e 02 45      lsr $4502,x
$13:d617  00 08         brk #$08
$13:d619  81 58         sta ($58,x)
$13:d61b  0c c1 40      tsb $40c1
$13:d61e  38            sec
$13:d61f  8c 2a 0d      sty $0d2a
$13:d622  0e 89 4f      asl $4f89
$13:d625  84 a2         sty $a2
$13:d627  d8            cld
$13:d628  08            php
$13:d629  c4 00         cpy $00
$13:d62b  74 10         stz $10,x
$13:d62d  08            php
$13:d62e  24 39         bit $39
$13:d630  04 10         tsb $10
$13:d632  01 a1         ora ($a1,x)
$13:d634  8e c4 78      stx $78c4
$13:d637  30 06         bmi $d63f
$13:d639  70 14         bvs $d64f
$13:d63b  3c c3 e7      bit $e7c3,x
$13:d63e  2f 3f cb fd   and $fdcb3f
$13:d642  20 71 29      jsr $2971
$13:d645  8c 86 20      sty $2086
$13:d648  0e 08 10      asl $1008
$13:d64b  28            plp
$13:d64c  e0 2f b0      cpx #$b02f
$13:d64f  81 cc         sta ($cc,x)
$13:d651  e6 73         inc $73
$13:d653  19 8a 50      ora $508a,y
$13:d656  5f 89 c0 e0   eor $e0c089,x
$13:d65a  f8            sed
$13:d65b  28            plp
$13:d65c  5e f8 77      lsr $77f8,x
$13:d65f  7e 5f 1f      ror $1f5f,x
$13:d662  87 a3         sta [$a3]
$13:d664  8f 83 c1 f0   sta $f0c183
$13:d668  f8            sed
$13:d669  7d fe fe      adc $fefe,x
$13:d66c  ff 7e 7f 3f   sbc $3f7f7e,x
$13:d670  ff a3 8e 89   sbc $898ea3,x
$13:d674  38            sec
$13:d675  dd 5f 2f      cmp $2f5f,x
$13:d678  9f ff f7 ff   sta $fff7ff,x
$13:d67c  fb            xce
$13:d67d  fe be 7f      inc $7fbe,x
$13:d680  81 84         sta ($84,x)
$13:d682  d6 0f         dec $0f,x
$13:d684  f3 64         sbc ($64,s),y
$13:d686  1c e6 e5      trb $e5e6
$13:d689  00 59         brk #$59
$13:d68b  83 84         sta $84,s
$13:d68d  1c 03 90      trb $9003
$13:d690  88            dey
$13:d691  42 1d         wdm #$1d
$13:d693  ea            nop
$13:d694  27 07         and [$07]
$13:d696  b0 c6         bcs $d65e
$13:d698  01 22         ora ($22,x)
$13:d69a  fd 60 a7      sbc $a760,x
$13:d69d  87 9e         sta [$9e]
$13:d69f  41 71         eor ($71,x)
$13:d6a1  b8            clv
$13:d6a2  fe f6 57      inc $57f6,x
$13:d6a5  dc 2d ea      jml [$ea2d]
$13:d6a8  b3 27         lda ($27,s),y
$13:d6aa  85 c5         sta $c5
$13:d6ac  e6 77         inc $77
$13:d6ae  fa            plx
$13:d6af  1c fc 60      trb $60fc
$13:d6b2  3f b7 39 5f   and $5f39b7,x
$13:d6b6  ef f1 f8 f9   sbc $f9f8f1
$13:d6ba  1c 08 e1      trb $e108
$13:d6bd  40            rti
$13:d6be  c0 65 39      cpy #$3965
$13:d6c1  d2 ec         cmp ($ec)
$13:d6c3  ff 9a 3f 91   sbc $913f9a,x
$13:d6c7  f7 7b         sbc [$7b],y
$13:d6c9  3e 5f 0f      rol $0f5f,x
$13:d6cc  e7 d7         sbc [$d7]
$13:d6ce  f7 c0         sbc [$c0],y
$13:d6d0  e0 77 bb      cpx #$bb77
$13:d6d3  db            stp
$13:d6d4  fd fb a5      sbc $a5fb,x
$13:d6d7  3f 9f c6 68   and $68c69f,x
$13:d6db  27 49         and [$49]
$13:d6dd  48            pha
$13:d6de  10 29         bpl $d709
$13:d6e0  0a            asl a
$13:d6e1  44 c0 42      mvp $42,$c0
$13:d6e4  a5 05         lda $05
$13:d6e6  19 48 e4      ora $e448,y
$13:d6e9  6a            ror a
$13:d6ea  12 44         ora ($44)
$13:d6ec  95 9f         sta $9f,x
$13:d6ee  8d c3 81      sta $81c3
$13:d6f1  44 20 14      mvp $14,$20
$13:d6f4  c9 06 5a      cmp #$5a06
$13:d6f7  e3 19         sbc $19,s
$13:d6f9  be 72 3b      ldx $3b72,y
$13:d6fc  da            phx
$13:d6fd  29 67 e5      and #$e567
$13:d700  b4 1f         ldy $1f,x
$13:d702  f6 58         inc $58,x
$13:d704  11 c1         ora ($c1),y
$13:d706  ce 53 ef      dec $ef53
$13:d709  f7 7b         sbc [$7b],y
$13:d70b  fd ba be      sbc $beba,x
$13:d70e  f0 a7         beq $d6b7
$13:d710  bb            tyx
$13:d711  4c 57 be      jmp $be57
$13:d714  27 73         and [$73]
$13:d716  c3 e7         cmp $e7,s
$13:d718  63 74         adc $74,s
$13:d71a  48            pha
$13:d71b  2c 8a 03      bit $038a
$13:d71e  ff 5f 8a 98   sbc $988a5f,x
$13:d722  ff fe 7f fd   sbc $fd7ffe,x
$13:d726  ee fe a3      inc $a3fe
$13:d729  0e 07 82      asl $8207
$13:d72c  81 e0         sta ($e0,x)
$13:d72e  e0 40 22      cpx #$2240
$13:d731  1b            tcs
$13:d732  0d 07 43      ora $4307
$13:d735  01 c0         ora ($c0,x)
$13:d737  27 80         and [$80]
$13:d739  18            clc
$13:d73a  3c 0d f1      bit $f10d,x
$13:d73d  2f 86 c3 61   and $61c386
$13:d741  f0 f8         beq $d73b
$13:d743  17 c0         ora [$c0],y
$13:d745  be 00 52      ldx $5200,y
$13:d748  77 b1         adc [$b1],y
$13:d74a  bc 9f 74      ldy $749f,x
$13:d74d  7f 21 68 4c   adc $4c6821,x
$13:d751  24 13         bit $13
$13:d753  8b            phb
$13:d754  44 62 91      mvp $91,$62
$13:d757  10 a0         bpl $d6f9
$13:d759  05 43         ora $43
$13:d75b  41 18         eor ($18,x)
$13:d75d  ce 5f ac      dec $ac5f
$13:d760  10 09         bpl $d76b
$13:d762  04 62         tsb $62
$13:d764  d1 10         cmp ($10),y
$13:d766  a4 4c         ldy $4c
$13:d768  28            plp
$13:d769  02 41         cop #$41
$13:d76b  fc 7e 0d      jsr ($0d7e,x)
$13:d76e  21 10         and ($10,x)
$13:d770  49 83 bd      eor #$bd83
$13:d773  a7 11         lda [$11]
$13:d775  89 c4 22      bit #$22c4
$13:d778  50 3b         bvc $d7b5
$13:d77a  01 83         ora ($83,x)
$13:d77c  91 86         sta ($86),y
$13:d77e  51 10         eor ($10),y
$13:d780  25 84         and $84
$13:d782  03 fe         ora $fe,s
$13:d784  4f 98 fc 02   eor $02fc98
$13:d788  0e 4f f3      asl $f34f
$13:d78b  02 7f         cop #$7f
$13:d78d  8e a3 fc      stx $fca3
$13:d790  80 7c         bra $d80e
$13:d792  1b            tcs
$13:d793  c0 6f e8      cpy #$e86f
$13:d796  2c 0e 17      bit $170e
$13:d799  07 48         ora [$48]
$13:d79b  8e 1d 22      stx $221d
$13:d79e  08            php
$13:d79f  f0 89         beq $d72a
$13:d7a1  43 63         eor $63,s
$13:d7a3  50 58         bvc $d7fd
$13:d7a5  3c 1e 1e      bit $1e1e,x
$13:d7a8  a1 1c         lda ($1c,x)
$13:d7aa  7e 3d 42      ror $423d,x
$13:d7ad  09 f0 8f      ora #$8ff0
$13:d7b0  aa            tax
$13:d7b1  c7 af         cmp [$af]
$13:d7b3  ef f7 ff d6   sbc $d6fff7
$13:d7b7  4d 7f 59      eor $597f
$13:d7ba  3a            dec a
$13:d7bb  fa            plx
$13:d7bc  34 5d         bit $5d,x
$13:d7be  df 2f ef e7   cmp $e7ef2f,x
$13:d7c2  ff fe ac 87   sbc $87acfe,x
$13:d7c6  fc d7 26      jsr ($26d7,x)
$13:d7c9  c8            iny
$13:d7ca  af b3 81 f0   lda $f081b3
$13:d7ce  f8            sed
$13:d7cf  0a            asl a
$13:d7d0  43 f8         eor $f8,s
$13:d7d2  f3 4e         sbc ($4e,s),y
$13:d7d4  27 e2         and [$e2]
$13:d7d6  50 ef         bvc $d7c7
$13:d7d8  40            rti
$13:d7d9  1b            tcs
$13:d7da  8a            txa
$13:d7db  42 00         wdm #$00
$13:d7dd  ef 0f c4 22   sbc $22c40f
$13:d7e1  19 e4 83      ora $83e4,y
$13:d7e4  7e 2c 5d      ror $5d2c,x
$13:d7e7  6e df c3      ror $c3df
$13:d7ea  0b            phd
$13:d7eb  f8            sed
$13:d7ec  f1 f0         sbc ($f0),y
$13:d7ee  20 00 e0      jsr $e000
$13:d7f1  86 7c         stx $7c
$13:d7f3  02 c3         cop #$c3
$13:d7f5  fc ed f9      jsr ($f9ed,x)
$13:d7f8  30 bf         bmi $d7b9
$13:d7fa  af 1f f2 67   lda $67f21f
$13:d7fe  0f a4 cd f3   ora $f3cda4
$13:d802  97 bd         sta [$bd],y
$13:d804  fd f3 7d      sbc $7df3,x
$13:d807  7f de df a8   adc $a8dfde,x
$13:d80b  53 c9         eor ($c9,s),y
$13:d80d  e4 02         cpx $02
$13:d80f  7f 3f bf ae   adc $aebf3f,x
$13:d813  de fd 7e      dec $7efd,x
$13:d816  1e 07 9b      asl $9b07,x
$13:d819  f3 e8         sbc ($e8,s),y
$13:d81b  fa            plx
$13:d81c  43 3f         eor $3f,s
$13:d81e  dd e9 fe      cmp $fee9,x
$13:d821  7a            ply
$13:d822  fe 57 0a      inc $0a57,x
$13:d825  04 fa         tsb $fa
$13:d827  69 08 59      adc #$5908
$13:d82a  00 0c         brk #$0c
$13:d82c  3f cd e5 25   and $25e5cd,x
$13:d830  94 00         sty $00,x
$13:d832  de 90 43      dec $4390,x
$13:d835  7a            ply
$13:d836  9b            txy
$13:d837  d8            cld
$13:d838  ec f4 43      cpx $43f4
$13:d83b  78            sei
$13:d83c  c0 4e f2      cpy #$f24e
$13:d83f  03 0b         ora $0b,s
$13:d841  c5 e2         cmp $e2
$13:d843  02 a3         cop #$a3
$13:d845  13 bb         ora ($bb,s),y
$13:d847  46 60         lsr $60
$13:d849  11 28         ora ($28),y
$13:d84b  7c 1b 01      jmp ($011b,x)
$13:d84e  80 3b         bra $d88b
$13:d850  bc 7d 7e      ldy $7e7d,x
$13:d853  38            sec
$13:d854  ec 72 d2      cpx $d272
$13:d857  4d e1 20      eor $20e1
$13:d85a  3b            tsc
$13:d85b  e4 81         cpx $81
$13:d85d  a5 a6         lda $a6
$13:d85f  f5 51         sbc $51,x
$13:d861  84 0e         sty $0e
$13:d863  1d 07 82      ora $8207,x
$13:d866  42 0e         wdm #$0e
$13:d868  ed 03 81      sbc $8103
$13:d86b  c1 e0         cmp ($e0,x)
$13:d86d  f0 f8         beq $d867
$13:d86f  7c 32 19      jmp ($1932,x)
$13:d872  10 98         bpl $d80c
$13:d874  4c 2f 1e      jmp $1e2f
$13:d877  8e c4 02      stx $02c4
$13:d87a  61 e0         adc ($e0,x)
$13:d87c  bc 5a 27      ldy $275a,x
$13:d87f  9c 4f f6      stz $f64f
$13:d882  0b            phd
$13:d883  4d 70 b8      eor $b870
$13:d886  7e 3f 13      ror $133f,x
$13:d889  8f c0 7c 37   sta $377cc0
$13:d88d  1f 83 08 4f   ora $4f0883,x
$13:d891  bf d6 6f 33   lda $336fd6,x
$13:d895  9f c7 fe 6f   sta $6ffec7,x
$13:d899  18            clc
$13:d89a  3a            dec a
$13:d89b  f8            sed
$13:d89c  20 13 f8      jsr $f813
$13:d89f  05 fe         ora $fe
$13:d8a1  01 ff         ora ($ff,x)
$13:d8a3  2d 89 43      and $4389
$13:d8a6  80 e0         bra $d888
$13:d8a8  0c 08 e4      tsb $e408
$13:d8ab  4e 61 27      lsr $2761
$13:d8ae  d1 cb         cmp ($cb),y
$13:d8b0  fc 90 fd      jsr ($fd90,x)
$13:d8b3  2d df af      and $afdf
$13:d8b6  03 80         ora $80,s
$13:d8b8  43 e0         eor $e0,s
$13:d8ba  11 c8         ora ($c8),y
$13:d8bc  1c c2 1f      trb $1fc2
$13:d8bf  a3 8f         lda $8f,s
$13:d8c1  79 23 fa      adc $fa23,y
$13:d8c4  5a            phy
$13:d8c5  ff 5e 5f 05   sbc $055f5e,x
$13:d8c9  81 c3         sta ($c3,x)
$13:d8cb  67 f1         adc [$f1]
$13:d8cd  a8            tay
$13:d8ce  2c 9a bf      bit $bf9a
$13:d8d1  2f 8f a5 d0   and $d0a58f
$13:d8d5  12 13         ora ($13)
$13:d8d7  f9 fa fc      sbc $fcfa,y
$13:d8da  2f f7 f5 08   and $08f5f7
$13:d8de  29 d3 bf      and #$bfd3
$13:d8e1  ff e7 ff fa   sbc $faffe7,x
$13:d8e5  fe f9 4f      inc $4ff9,x
$13:d8e8  1f ad ef f7   ora $f7efad,x
$13:d8ec  ff f7 ff f9   sbc $f9fff7,x
$13:d8f0  ff fd 7d c5   sbc $c57dfd,x
$13:d8f4  30 82         bmi $d878
$13:d8f6  47 62         eor [$62]
$13:d8f8  93 29         sta ($29,s),y
$13:d8fa  4d 92 1f      eor $1f92
$13:d8fd  44 ad d2      mvp $d2,$ad
$13:d900  6b            rtl
$13:d901  fc da ff      jsr ($ffda,x)
$13:d904  1c a8 11      trb $11a8
$13:d907  d8            cld
$13:d908  14 ca         trb $ca
$13:d90a  1b            tcs
$13:d90b  64 8d         stz $8d
$13:d90d  d1 27         cmp ($27),y
$13:d90f  74 99         stz $99,x
$13:d911  ff 36 7f c7   sbc $c77f36,x
$13:d915  34 01         bit $01,x
$13:d917  16 e0         asl $e0,x
$13:d919  2f 0c 05 89   and $89050c
$13:d91d  16 2c         asl $2c,x
$13:d91f  10 0c         bpl $d92d
$13:d921  85 86         sta $86
$13:d923  83 d3         sta $d3,s
$13:d925  22 c7 83 c1   jsl $c183c7
$13:d929  f1 f8         sbc ($f8),y
$13:d92b  f4 c3 cd      pea $cdc3
$13:d92e  40            rti
$13:d92f  26 16         rol $16
$13:d931  12 11         ora ($11)
$13:d933  48            pha
$13:d934  c0 0c 14      cpy #$140c
$13:d937  6c 78 cc      jmp ($cc78)
$13:d93a  67 33         adc [$33]
$13:d93c  98            tya
$13:d93d  ef a9 03 bf   sbc $bf03a9
$13:d941  0b            phd
$13:d942  40            rti
$13:d943  5b            tcd
$13:d944  57 e8         eor [$e8],y
$13:d946  c0 e2 53      cpy #$53e2
$13:d949  19 0c 40      ora $400c,y
$13:d94c  06 10         asl $10
$13:d94e  27 e9         and [$e9]
$13:d950  82 c2 07      brl $e115
$13:d953  03 99         ora $99,s
$13:d955  cc e6 33      cpy $33e6
$13:d958  13 a0         ora ($a0,s),y
$13:d95a  c0 c0 67      cpy #$67c0
$13:d95d  c0 e0 f8      cpy #$f8e0
$13:d960  28            plp
$13:d961  5e f8 77      lsr $77f8,x
$13:d964  7e 5f 1f      ror $1f5f,x
$13:d967  89 fb c0      bit #$c0fb
$13:d96a  65 c1         adc $c1
$13:d96c  e0 f8 7c      cpx #$7cf8
$13:d96f  2b            pld
$13:d970  80 ef         bra $d961
$13:d972  f7 e7         sbc [$e7],y
$13:d974  eb            xba
$13:d975  d1 01         cmp ($01),y
$13:d977  a5 12         lda $12
$13:d979  71 98         adc ($98),y
$13:d97b  bf 4f 3f db   lda $db3f4f,x
$13:d97f  cb            wai
$13:d980  f5 6b         sbc $6b,x
$13:d982  78            sei
$13:d983  03 4b         ora $4b,s
$13:d985  e5 f3         sbc $f3
$13:d987  fc c7 50      jsr ($50c7,x)
$13:d98a  1a            inc a
$13:d98b  8f 86 11 18   sta $181186
$13:d98f  88            dey
$13:d990  42 00         wdm #$00
$13:d992  6d 80 1f      adc $1f80
$13:d995  0c 61 d2      tsb $d261
$13:d998  20 91 84      jsr $8491
$13:d99b  42 81         wdm #$81
$13:d99d  c0 8e 08      cpy #$088e
$13:d9a0  19 f4 0f      ora $0ff4,y
$13:d9a3  a2 fa 18      ldx #$18fa
$13:d9a6  4c 26 17      jmp $1726
$13:d9a9  0b            phd
$13:d9aa  42 80         wdm #$80
$13:d9ac  0d 10 60      ora $6010
$13:d9af  83 0e         sta $0e,s
$13:d9b1  16 cb         asl $cb,x
$13:d9b3  e1 ba         sbc ($ba,x)
$13:d9b5  dc 7e a7      jml [$a77e]
$13:d9b8  17 89         ora [$89],y
$13:d9ba  85 e3         sta $e3
$13:d9bc  e1 70         sbc ($70,x)
$13:d9be  f0 5c         beq $da1c
$13:d9c0  2c 1e 0b      bit $0b1e
$13:d9c3  97 ca         sta [$ca],y
$13:d9c5  f5 fa         sbc $fa,x
$13:d9c7  10 87         bpl $d950
$13:d9c9  e0 4a 3f      cpx #$3f4a
$13:d9cc  01 48         ora ($48,x)
$13:d9ce  f8            sed
$13:d9cf  3c 0f 31      bit $310f,x
$13:d9d2  87 c0         sta [$c0]
$13:d9d4  27 f0         and [$f0]
$13:d9d6  0b            phd
$13:d9d7  f8            sed
$13:d9d8  d4 55         pei ($55)
$13:d9da  c0 3a 21      cpy #$213a
$13:d9dd  87 13         sta [$13]
$13:d9df  bc bf a6      ldy $a6bf,x
$13:d9e2  fa            plx
$13:d9e3  79 04 1c      adc $1c04,y
$13:d9e6  df d1 08 78   cmp $7808d1,x
$13:d9ea  c8            iny
$13:d9eb  24 31         bit $31
$13:d9ed  09 8b e0      ora #$e08b
$13:d9f0  8d e7 1f      sta $1fe7
$13:d9f3  8f a4 02 62   sta $6202a4
$13:d9f7  a3 10         lda $10,s
$13:d9f9  18            clc
$13:d9fa  1b            tcs
$13:d9fb  d3 3f         cmp ($3f,s),y
$13:d9fd  7f e7 cf f4   adc $f4cfe7,x
$13:da01  1d f8 f6      ora $f6f8,x
$13:da04  05 ee         ora $ee
$13:da06  11 16         ora ($16),y
$13:da08  c8            iny
$13:da09  38            sec
$13:da0a  c7 fe         cmp [$fe]
$13:da0c  bf 3c fe 7c   lda $7cfe3c,x
$13:da10  06 11         asl $11
$13:da12  98            tya
$13:da13  cb            wai
$13:da14  a4 30         ldy $30
$13:da16  0e 61 37      asl $3761
$13:da19  9b            txy
$13:da1a  38            sec
$13:da1b  38            sec
$13:da1c  0d 71 17      ora $1771
$13:da1f  00 b8         brk #$b8
$13:da21  1b            tcs
$13:da22  e8            inx
$13:da23  d6 99         dec $99,x
$13:da25  81 ec         sta ($ec,x)
$13:da27  52 e0         eor ($e0)
$13:da29  97 04         sta [$04],y
$13:da2b  c2 bc         rep #$bc
$13:da2d  02 60         cop #$60
$13:da2f  f8            sed
$13:da30  05 38         ora $38
$13:da32  29 c1 f0      and #$f0c1
$13:da35  98            tya
$13:da36  2a            rol a
$13:da37  14 02         trb $02
$13:da39  11 40         ora ($40),y
$13:da3b  c0 68 b8      cpy #$b868
$13:da3e  34 5c         bit $5c,x
$13:da40  1e 06 0f      asl $0f06,x
$13:da43  04 87         tsb $87
$13:da45  c3 63         cmp $63,s
$13:da47  dc 2e 14      jml [$142e]
$13:da4a  22 11 c0 e0   jsl $e0c011
$13:da4e  78            sei
$13:da4f  fc 7e 7f      jsr ($7f7e,x)
$13:da52  3f 1f 8e 90   and $908e1f,x
$13:da56  04 f8         tsb $f8
$13:da58  40            rti
$13:da59  28            plp
$13:da5a  0e 51 17      asl $1751
$13:da5d  86 03         stx $03
$13:da5f  51 c0         eor ($c0),y
$13:da61  d0 70         bne $dad3
$13:da63  06 a3         asl $a3
$13:da65  13 a0         ora ($a0,s),y
$13:da67  04 c1         tsb $c1
$13:da69  9c 22 30      stz $3022
$13:da6c  f4 7a 3c      pea $3c7a
$13:da6f  04 91         tsb $91
$13:da71  fd fe db      sbc $dbfe,x
$13:da74  e5 38         sbc $38
$13:da76  a0 41 33      ldy #$3341
$13:da79  10 48         bpl $dac3
$13:da7b  61 5c         adc ($5c,x)
$13:da7d  21 11         and ($11,x)
$13:da7f  c8            iny
$13:da80  05 e1         ora $e1
$13:da82  be 57 8b      ldx $8b57,y
$13:da85  c6 73         dec $73
$13:da87  39 0c 33      and $330c,y
$13:da8a  8c 72 38      sty $3872
$13:da8d  63 08         adc $08,s
$13:da8f  2c 0e 17      bit $170e
$13:da92  07 86         ora [$86]
$13:da94  40            rti
$13:da95  e1 f8         sbc ($f8,x)
$13:da97  08            php
$13:da98  2c 09 50      bit $5009
$13:da9b  11 08         ora ($08),y
$13:da9d  64 66         stz $66
$13:da9f  09 07 83      ora #$8307
$13:daa2  a8            tay
$13:daa3  41 42         eor ($42,x)
$13:daa5  18            clc
$13:daa6  fc 79 fc      jsr ($fc79,x)
$13:daa9  14 e0         trb $e0
$13:daab  6b            rtl
$13:daac  08            php
$13:daad  ec 77 b5      cpx $b577
$13:dab0  e7 f6         sbc [$f6]
$13:dab2  7c fc 1f      jmp ($1ffc,x)
$13:dab5  f8            sed
$13:dab6  9f be 0f ff   sta $ff0fbe,x
$13:daba  b0 67         bcs $db23
$13:dabc  e5 91         sbc $91
$13:dabe  3b            tsc
$13:dabf  46 45         lsr $45
$13:dac1  7e 8b f4      ror $f48b,x
$13:dac4  bf df d7 e1   lda $e1d7df,x
$13:dac8  25 ec         and $ec
$13:daca  48            pha
$13:dacb  b8            clv
$13:dacc  3f 2f ef ef   and $efef2f,x
$13:dad0  f9 fd ff      sbc $fffd,y
$13:dad3  7f 3f eb 70   adc $70eb3f,x
$13:dad7  be ff bf      ldx $bfff,y
$13:dada  bf df 9f cd   lda $cd9fdf,x
$13:dade  3f 50 0f 85   and $850f50,x
$13:dae2  c3 f1         cmp $f1,s
$13:dae4  f8            sed
$13:dae5  fe 4e 3f      inc $3f4e,x
$13:dae8  9b            txy
$13:dae9  8b            phb
$13:daea  e7 12         sbc [$12]
$13:daec  71 08         adc ($08),y
$13:daee  f8            sed
$13:daef  58            cli
$13:daf0  19 e1 f0      ora $f0e1,y
$13:daf3  69 0b 8d      adc #$8d0b
$13:daf6  5a            phy
$13:daf7  40            rti
$13:daf8  df 00 50 3b   cmp $3b5000,x
$13:dafc  c9 e9 10      cmp #$10e9
$13:daff  17 f9         ora [$f9],y
$13:db01  bd 22 c1      lda $c122,x
$13:db04  e0 a0 78      cpx #$78a0
$13:db07  08            php
$13:db08  a0 45 0c      ldy #$0c45
$13:db0b  00 58         brk #$58
$13:db0d  08            php
$13:db0e  40            rti
$13:db0f  19 12 49      ora $4912,y
$13:db12  04 c8         tsb $c8
$13:db14  2a            rol a
$13:db15  22 93 80 33   jsl $338093
$13:db19  80 60         bra $db7b
$13:db1b  57 f1         eor [$f1],y
$13:db1d  a8            tay
$13:db1e  cf e0 11 f1   cmp $f111e0
$13:db22  d8            cld
$13:db23  8c 3c 9f      sty $9f3c
$13:db26  e5 ec         sbc $ec
$13:db28  87 9b         sta [$9b]
$13:db2a  c4 78         cpy $78
$13:db2c  47 44         eor [$44]
$13:db2e  38            sec
$13:db2f  11 ca         ora ($ca),y
$13:db31  ff df f4 82   sbc $82f4df,x
$13:db35  4f d2 07 f0   eor $f007d2
$13:db39  64 a2         stz $a2
$13:db3b  7a            ply
$13:db3c  7e 1e 0f      ror $0f1e,x
$13:db3f  b7 e3         lda [$e3],y
$13:db41  a1 e0         lda ($e0,x)
$13:db43  59 8f a3      eor $a38f,y
$13:db46  41 c0         eor ($c0,x)
$13:db48  a0 0b 02      ldy #$020b
$13:db4b  ec d2 0f      cpx $0fd2
$13:db4e  f7 f9         sbc [$f9],y
$13:db50  da            phx
$13:db51  0e d0 70      asl $70d0
$13:db54  80 84         bra $dada
$13:db56  be df 68      ldx $68df,y
$13:db59  07 c1         ora [$c1]
$13:db5b  9e 3f 86      stz $863f,x
$13:db5e  9b            txy
$13:db5f  b4 09         ldy $09,x
$13:db61  a5 73         lda $73
$13:db63  08            php
$13:db64  0c c6 07      tsb $07c6
$13:db67  02 83         cop #$83
$13:db69  3c c6 03      bit $03c6,x
$13:db6c  01 05         ora ($05,x)
$13:db6e  94 02         sty $02,x
$13:db70  63 31         adc $31,s
$13:db72  99 cc e0      sta $e0cc,y
$13:db75  c0 31 81      cpy #$8131
$13:db78  c0 df 09      cpy #$09df
$13:db7b  02 c6         cop #$c6
$13:db7d  3e 82 43      rol $4382,x
$13:db80  30 89         bmi $db0b
$13:db82  48            pha
$13:db83  64 50         stz $50
$13:db85  1e 0c 02      asl $020c,x
$13:db88  10 fa         bpl $db84
$13:db8a  1c 76 39      trb $3976
$13:db8d  f4 0f f2      pea $f20f
$13:db90  91 c8         sta ($c8),y
$13:db92  f8            sed
$13:db93  3c 18 40      bit $4018,x
$13:db96  6c 60 82      jmp ($8260)
$13:db99  b0 86         bcs $db21
$13:db9b  55 31         eor $31,x
$13:db9d  1a            inc a
$13:db9e  8e 85 09      stx $0985
$13:dba1  78            sei
$13:dba2  02 e1         cop #$e1
$13:dba4  85 4b         sta $4b
$13:dba6  21 83         and ($83,x)
$13:dba8  f1 ee         sbc ($ee),y
$13:dbaa  77 17         adc [$17],y
$13:dbac  e1 e2         sbc ($e2,x)
$13:dbae  f1 32         sbc ($32),y
$13:dbb0  c0 7e 12      cpy #$127e
$13:dbb3  e9 73 e8      sbc #$e873
$13:dbb6  47 20         eor [$20]
$13:dbb8  fa            plx
$13:dbb9  19 04 c2      ora $c204,y
$13:dbbc  21 20         and ($20,x)
$13:dbbe  7d 19 44      adc $4419,x
$13:dbc1  0a            asl a
$13:dbc2  47 30         eor [$30]
$13:dbc4  33 88         and ($88,s),y
$13:dbc6  2c e0 30      bit $30e0
$13:dbc9  c9 fc 2a      cmp #$2afc
$13:dbcc  0b            phd
$13:dbcd  11 a7         ora ($a7),y
$13:dbcf  48            pha
$13:dbd0  e3 f2         sbc $f2,s
$13:dbd2  78            sei
$13:dbd3  fc ee 0f      jsr ($0fee,x)
$13:dbd6  18            clc
$13:dbd7  83 81         sta $81,s
$13:dbd9  c2 7f         rep #$7f
$13:dbdb  3f 87 c3 eb   and $ebc387,x
$13:dbdf  f5 f4         sbc $f4,x
$13:dbe1  08            php
$13:dbe2  21 d3         and ($d3,x)
$13:dbe4  59 d0 fb      eor $fbd0,y
$13:dbe7  f2 2b         sbc ($2b)
$13:dbe9  7e 49 7f      ror $7f49,x
$13:dbec  03 21         ora $21,s
$13:dbee  ef d7 f7 f9   sbc $f9f7d7
$13:dbf2  fb            xce
$13:dbf3  fa            plx
$13:dbf4  7e ff fe      ror $feff,x
$13:dbf7  9f d9 cf fa   sta $facfd9,x
$13:dbfb  25 7d         and $7d
$13:dbfd  a4 cd         ldy $cd
$13:dbff  fe 70 fc      inc $fc70,x
$13:dc02  bd be d7      lda $d7be,x
$13:dc05  97 ee         sta [$ee],y
$13:dc07  68            pla
$13:dc08  f5 9f         sbc $9f,x
$13:dc0a  34 ff         bit $ff,x
$13:dc0c  64 2c         stz $2c
$13:dc0e  1b            tcs
$13:dc0f  6f c7 03 c0   adc $c003c7
$13:dc13  d3 1f         cmp ($1f,s),y
$13:dc15  46 83         lsr $83
$13:dc17  81 40         sta ($40,x)
$13:dc19  c0 70 26      cpy #$2670
$13:dc1c  c4 50         cpy $50
$13:dc1e  ff 7f bc 0e   sbc $0ebc7f,x
$13:dc22  31 f4         and ($f4),y
$13:dc24  7a            ply
$13:dc25  1c 61 c0      trb $c061
$13:dc28  e0 7d be      cpx #$be7d
$13:dc2b  c2 b0         rep #$b0
$13:dc2d  8e 47 28      stx $2847
$13:dc30  54 e8 95      mvn $95,$e8
$13:dc33  fe 09 3e      inc $3e09,x
$13:dc36  88            dey
$13:dc37  44 0c c1      mvp $c1,$0c
$13:dc3a  08            php
$13:dc3b  8c 41 a1      sty $a141
$13:dc3e  d0 38         bne $dc78
$13:dc40  fc c6 ff      jsr ($ffc6,x)
$13:dc43  00 02         brk #$02
$13:dc45  04 f9         tsb $f9
$13:dc47  fa            plx
$13:dc48  10 89         bpl $dbd3
$13:dc4a  c4 01         cpy $01
$13:dc4c  fc 31 68      jsr ($6831,x)
$13:dc4f  1d 2e 53      ora $532e,x
$13:dc52  25 86         and $86
$13:dc54  57 ab         eor [$ab],y
$13:dc56  d2 49         cmp ($49)
$13:dc58  23 e4         and $e4,s
$13:dc5a  25 12         and $12
$13:dc5c  88            dey
$13:dc5d  f4 79 18      pea $1879
$13:dc60  17 7b         ora [$7b],y
$13:dc62  fd ce ff      sbc $ffce,x
$13:dc65  21 bf         and ($bf,x)
$13:dc67  c6 a7         dec $a7
$13:dc69  d2 89         cmp ($89)
$13:dc6b  c4 40         cpy $40
$13:dc6d  18            clc
$13:dc6e  10 f1         bpl $dc61
$13:dc70  78            sei
$13:dc71  c1 e0         cmp ($e0,x)
$13:dc73  10 32         bpl $dca7
$13:dc75  da            phx
$13:dc76  16 c4         asl $c4,x
$13:dc78  61 df         adc ($df,x)
$13:dc7a  f2 7a         sbc ($7a)
$13:dc7c  81 02         sta ($02,x)
$13:dc7e  3e 33 12      rol $1233,x
$13:dc81  77 8f         adc [$8f],y
$13:dc83  c4 6c         cpy $6c
$13:dc85  03 60         ora $60,s
$13:dc87  80 9d         bra $dc26
$13:dc89  44 74 c7      mvp $c7,$74
$13:dc8c  2b            pld
$13:dc8d  e6 fc         inc $fc
$13:dc8f  36 5d         rol $5d,x
$13:dc91  9a            txs
$13:dc92  36 27         rol $27,x
$13:dc94  83 e4         sta $e4,s
$13:dc96  f1 7c         sbc ($7c),y
$13:dc98  20 1f 0f      jsr $0f1f
$13:dc9b  24 0a         bit $0a
$13:dc9d  05 00         ora $00
$13:dc9f  fe ff 7f      inc $7fff,x
$13:dca2  7f be 7f 3f   adc $3f7fbe,x
$13:dca6  cb            wai
$13:dca7  e5 f9         sbc $f9
$13:dca9  7c be 1f      jmp ($1fbe,x)
$13:dcac  0f 37 9a 0d   ora $0d9a37
$13:dcb0  06 bb         asl $bb
$13:dcb2  37 c3         and [$c3],y
$13:dcb4  f1 70         sbc ($70),y
$13:dcb6  fc 42 15      jsr ($1542,x)
$13:dcb9  20 3a 28      jsr $283a
$13:dcbc  20 e8 1c      jsr $1ce8
$13:dcbf  20 b0 16      jsr $16b0
$13:dcc2  10 ad         bpl $dc71
$13:dcc4  8a            txa
$13:dcc5  08            php
$13:dcc6  bc 14 c8      ldy $c814,x
$13:dcc9  40            rti
$13:dcca  38            sec
$13:dccb  07 95         ora [$95]
$13:dccd  1d 23 43      ora $4323,x
$13:dcd0  87 41         sta [$41]
$13:dcd2  10 72         bpl $dd46
$13:dcd4  6b            rtl
$13:dcd5  ca            dex
$13:dcd6  e0 90 28      cpx #$2890
$13:dcd9  34 03         bit $03,x
$13:dcdb  00 3a         brk #$3a
$13:dcdd  08            php
$13:dcde  14 04         trb $04
$13:dce0  e8            inx
$13:dce1  43 a1         eor $a1,s
$13:dce3  56 82         lsr $82,x
$13:dce5  b4 30         ldy $30,x
$13:dce7  18            clc
$13:dce8  04 e0         tsb $e0
$13:dcea  40            rti
$13:dceb  e0 70 13      cpx #$1370
$13:dcee  c1 c8         cmp ($c8,x)
$13:dcf0  a3 91         lda $91,s
$13:dcf2  c7 f9         cmp [$f9]
$13:dcf4  c4 24         cpy $24
$13:dcf6  1e 06 91      asl $9106,x
$13:dcf9  cf a7 c3 00   cmp $00c3a7
$13:dcfd  00 80         brk #$80
$13:dcff  04 26         tsb $26
$13:dd01  13 0f         ora ($0f,s),y
$13:dd03  07 80         ora [$80]
$13:dd05  f2 b4         sbc ($b4)
$13:dd07  07 1e         ora [$1e]
$13:dd09  50 0a         bvc $dd15
$13:dd0b  57 0c         eor [$0c],y
$13:dd0d  81 c1         sta ($c1,x)
$13:dd0f  e0 12 18      cpx #$1812
$13:dd12  84 c6         sty $c6
$13:dd14  02 16         cop #$16
$13:dd16  03 4a         ora $4a,s
$13:dd18  47 e3         eor [$e3]
$13:dd1a  f0 f8         beq $dd14
$13:dd1c  7c c5 06      jmp ($06c5,x)
$13:dd1f  22 70 34 a7   jsl $a73470
$13:dd23  3e 7f a6      rol $a67f,x
$13:dd26  8f e4 39 f0   sta $f039e4
$13:dd2a  fc 00 a8      jsr ($a800,x)
$13:dd2d  22 30 88 c1   jsl $c18830
$13:dd31  a4 30         ldy $30
$13:dd33  1f f4 f9 e7   ora $e7f9f4,x
$13:dd37  f3 e2         sbc ($e2,s),y
$13:dd39  90 8c         bcc $dcc7
$13:dd3b  c6 63         dec $63
$13:dd3d  11 81         ora ($81),y
$13:dd3f  18            clc
$13:dd40  37 c2         and [$c2],y
$13:dd42  a3 98         lda $98,s
$13:dd44  c2 c2         rep #$c2
$13:dd46  20 1e 4b      jsr $4b1e
$13:dd49  13 80         ora ($80,s),y
$13:dd4b  3e 1e 41      rol $411e,x
$13:dd4e  28            plp
$13:dd4f  40            rti
$13:dd50  3e 3f 1e      rol $1e3f,x
$13:dd53  cf 67 1b 8d   cmp $8d1b67
$13:dd57  f2 f9         sbc ($f9)
$13:dd59  7e 5f 2f      ror $2f5f,x
$13:dd5c  87 c3         sta [$c3]
$13:dd5e  cd e6 10      cmp $10e6
$13:dd61  04 db         tsb $db
$13:dd63  f1 78         sbc ($78),y
$13:dd65  fc 4c 3f      jsr ($3f4c,x)
$13:dd68  18            clc
$13:dd69  8b            phb
$13:dd6a  85 c0         sta $c0
$13:dd6c  16 66         asl $66,x
$13:dd6e  90 ff         bcc $dd6f
$13:dd70  7f bf 0e 13   adc $130ebf,x
$13:dd74  64 80         stz $80
$13:dd76  34 5b         bit $5b,x
$13:dd78  82 04 10      brl $ed7f
$13:dd7b  00 40         brk #$40
$13:dd7d  80 3b         bra $ddba
$13:dd7f  fc 01 e1      jsr ($e101,x)
$13:dd82  1f 11 78 cf   ora $cf7811,x
$13:dd86  c8            iny
$13:dd87  9e 55 f2      stz $f255,x
$13:dd8a  f3 44         sbc ($44,s),y
$13:dd8c  23 31         and $31,s
$13:dd8e  98            tya
$13:dd8f  81 c8         sta ($c8,x)
$13:dd91  23 46         and $46,s
$13:dd93  f0 39         beq $ddce
$13:dd95  01 c4         ora ($c4,x)
$13:dd97  63 71         adc $71,s
$13:dd99  08            php
$13:dd9a  c1 c0         cmp ($c0,x)
$13:dd9c  23 08         and $08,s
$13:dd9e  20 8d 1f      jsr $1f8d
$13:dda1  c1 04         cmp ($04,x)
$13:dda3  08            php
$13:dda4  11 8d         ora ($8d),y
$13:dda6  c6 0d         dec $0d
$13:dda8  fe 80 f4      inc $f480,x
$13:ddab  8f a8 bd 67   sta $67bda8
$13:ddaf  ec 49 2f      cpx $2f49
$13:ddb2  54 6a 1b      mvn $1b,$6a
$13:ddb5  0d 8b 3b      ora $3b8b
$13:ddb8  ee 2b 15      inc $152b
$13:ddbb  7f 63 f3 c1   adc $c1f363,x
$13:ddbf  be 1e f1      ldx $f11e,y
$13:ddc2  7f 90 35 aa   adc $aa3590,x
$13:ddc6  0d 41 6c      ora $6c41
$13:ddc9  13 74         ora ($74,s),y
$13:ddcb  1a            inc a
$13:ddcc  80 5c         bra $de2a
$13:ddce  16 28         asl $28,x
$13:ddd0  31 05         and ($05),y
$13:ddd2  90 4c         bcc $de20
$13:ddd4  d0 62         bne $de38
$13:ddd6  01 b3         ora ($b3,x)
$13:ddd8  cf be 8e f4   cmp $f48ebe
$13:dddc  ff ac 3d 83   sbc $833dac,x
$13:dde0  51 d8         eor ($d8),y
$13:dde2  f4 5a 1f      pea $1f5a
$13:dde5  1b            tcs
$13:dde6  5f 83 18 18   eor $181883,x
$13:ddea  20 d1 06      jsr $06d1
$13:dded  79 c5 a2      adc $a2c5,y
$13:ddf0  ef 10 6a 8b   sbc $8b6a10
$13:ddf4  44 18 20      mvp $20,$18
$13:ddf7  bf 37 7f 80   lda $807f37,x
$13:ddfb  2e 45 0b      rol $0b45
$13:ddfe  07 94         ora [$94]
$13:de00  8a            txa
$13:de01  42 2b         wdm #$2b
$13:de03  16 88         asl $88,x
$13:de05  0b            phd
$13:de06  40            rti
$13:de07  76 10         ror $10,x
$13:de09  47 f9         eor [$f9]
$13:de0b  4e 47 64      lsr $6447
$13:de0e  c1 01         cmp ($01,x)
$13:de10  d8            cld
$13:de11  4c 26 33      jmp $3326
$13:de14  10 79         bpl $de8f
$13:de16  44 22 30      mvp $30,$22
$13:de19  38            sec
$13:de1a  5c 4a 21 22   jml $22214a
$13:de1e  26 04         rol $04
$13:de20  be 03 01      ldx $0103,y
$13:de23  7f 90 4c e3   adc $e34c90,x
$13:de27  10 ba         bpl $dde3
$13:de29  04 b4         tsb $b4
$13:de2b  ba            tsx
$13:de2c  05 e0         ora $e0
$13:de2e  28            plp
$13:de2f  14 66         trb $66
$13:de31  86 d1         stx $d1
$13:de33  11 d8         ora ($d8),y
$13:de35  50 28         bvc $de5f
$13:de37  26 b0         rol $b0
$13:de39  2f a4 f0 cc   and $ccf0a4
$13:de3d  44 31 3d      mvp $3d,$31
$13:de40  80 3c         bra $de7e
$13:de42  64 50         stz $50
$13:de44  29 0d 10      and #$100d
$13:de47  b0 05         bcs $de4e
$13:de49  30 44         bmi $de8f
$13:de4b  94 e5         sty $e5,x
$13:de4d  fe 31 12      inc $1231,x
$13:de50  19 4e 58      ora $584e,y
$13:de53  a3 13         lda $13,s
$13:de55  8c 26 40      sty $4026
$13:de58  1e 2d 60      asl $602d,x
$13:de5b  51 09         eor ($09),y
$13:de5d  5c 1a c4 d6   jml $d6c41a
$13:de61  01 f8         ora ($f8,x)
$13:de63  99 00 c8      sta $c800,y
$13:de66  6e 62 32      ror $3262
$13:de69  02 bc         cop #$bc
$13:de6b  c0 84 b8      cpy #$b884
$13:de6e  58            cli
$13:de6f  f4 7d 83      pea $837d
$13:de72  8b            phb
$13:de73  a1 78         lda ($78,x)
$13:de75  8a            txa
$13:de76  ec 9a 83      cpx $839a
$13:de79  19 8c c3      ora $c38c,y
$13:de7c  d9 42 01      cmp $0142,y
$13:de7f  16 59         asl $59,x
$13:de81  19 05 f8      ora $f805,y
$13:de84  11 77         ora ($77),y
$13:de86  7f 40 a4 63   adc $63a440,x
$13:de8a  b1 0f         lda ($0f),y
$13:de8c  82 4c 01      brl $dfdb
$13:de8f  0b            phd
$13:de90  30 99         bmi $de2b
$13:de92  12 c4         ora ($c4)
$13:de94  60            rts
$13:de95  02 21         cop #$21
$13:de97  90 be         bcc $de57
$13:de99  8e 5f 2e      stx $2e5f
$13:de9c  2d 89 00      and $0089
$13:de9f  06 6a         asl $6a
$13:dea1  0d 03 60      ora $6003
$13:dea4  c0 65 87      cpy #$8765
$13:dea7  c0 96 50      cpy #$5096
$13:deaa  93 82         sta ($82,s),y
$13:deac  37 18         and [$18],y
$13:deae  79 40 8a      adc $8a40,y
$13:deb1  e1 40         sbc ($40,x)
$13:deb3  2b            pld
$13:deb4  88            dey
$13:deb5  bc 61 70      ldy $7061,x
$13:deb8  a2 70 14      ldx #$1470
$13:debb  c0 ae 30      cpy #$30ae
$13:debe  41 88         eor ($88,x)
$13:dec0  cb            wai
$13:dec1  e5 89         sbc $89
$13:dec3  b0 85         bcs $de4a
$13:dec5  43 ce         eor $ce,s
$13:dec7  24 9b         bit $9b
$13:dec9  19 81 08      ora $0881,y
$13:decc  0a            asl a
$13:decd  c3 12         cmp $12,s
$13:decf  8c 45 c4      sty $c445
$13:ded2  22 a4 2a 05   jsl $052aa4
$13:ded6  04 e2         tsb $e2
$13:ded8  4d 70 87      eor $8770
$13:dedb  9d 41 18      sta $1841,x
$13:dede  11 14         ora ($14),y
$13:dee0  7a            ply
$13:dee1  22 c1 8e 11   jsl $118ec1
$13:dee5  78            sei
$13:dee6  9b            txy
$13:dee7  58            cli
$13:dee8  e2 0a         sep #$0a
$13:deea  f0 5a         beq $df46
$13:deec  8c 69 38      sty $3869
$13:deef  20 50 73      jsr $7350
$13:def2  93 fc         sta ($fc,s),y
$13:def4  97 e2         sta [$e2],y
$13:def6  ac 17 a8      ldy $a817
$13:def9  2c 4d e0      bit $e04d
$13:defc  2c f1 5e      bit $5ef1
$13:deff  7a            ply
$13:df00  34 26         bit $26,x
$13:df02  84 c0         sty $c0
$13:df04  08            php
$13:df05  8a            txa
$13:df06  c4 da         cpy $da
$13:df08  67 34         adc [$34]
$13:df0a  13 08         ora ($08,s),y
$13:df0c  a8            tay
$13:df0d  24 40         bit $40
$13:df0f  02 71         cop #$71
$13:df11  9c d1 04      stz $04d1
$13:df14  48            pha
$13:df15  13 1c         ora ($1c,s),y
$13:df17  13 f4         ora ($f4,s),y
$13:df19  49 03 04      eor #$0403
$13:df1c  41 94         eor ($94,x)
$13:df1e  c8            iny
$13:df1f  46 30         lsr $30
$13:df21  29 1c 2c      and #$2c1c
$13:df24  3e 21 12      rol $1221,x
$13:df27  43 04         eor $04,s
$13:df29  e8            inx
$13:df2a  22 48 30 07   jsl $073048
$13:df2e  81 d4         sta ($d4,x)
$13:df30  12 22         ora ($22)
$13:df32  96 04         stx $04,y
$13:df34  02 0b         cop #$0b
$13:df36  88            dey
$13:df37  ee 06 a1      inc $a106
$13:df3a  47 a1         eor [$a1]
$13:df3c  d4 01         pei ($01)
$13:df3e  e0 86 11      cpx #$1186
$13:df41  c1 90         cmp ($90,x)
$13:df43  45 06         eor $06
$13:df45  20 f0 a0      jsr $a0f0
$13:df48  4b            phk
$13:df49  51 22         eor ($22),y
$13:df4b  68            pla
$13:df4c  52 00         eor ($00)
$13:df4e  07 c6         ora [$c6]
$13:df50  80 99         bra $deeb
$13:df52  12 81         ora ($81)
$13:df54  22 4c 3e 44   jsl $443e4c
$13:df58  93 9c         sta ($9c,s),y
$13:df5a  40            rti
$13:df5b  53 26         eor ($26,s),y
$13:df5d  0f 54 b4 90   ora $90b454
$13:df61  48            pha
$13:df62  d2 13         cmp ($13)
$13:df64  94 c1         sty $c1,x
$13:df66  4b            phk
$13:df67  28            plp
$13:df68  32 d2         and ($d2)
$13:df6a  79 a2 48      adc $48a2,y
$13:df6d  c4 09         cpy $09
$13:df6f  90 9d         bcc $df0e
$13:df71  25 c0         and $c0
$13:df73  be 4b c1      ldx $c14b,y
$13:df76  5d 8a f4      eor $f48a,x
$13:df79  0e 63 40      asl $4063
$13:df7c  37 82         and [$82],y
$13:df7e  60            rts
$13:df7f  19 80 46      ora $4680,y
$13:df82  25 b8         and $b8
$13:df84  4b            phk
$13:df85  a6 43         ldx $43
$13:df87  90 8d         bcc $df16
$13:df89  06 c1         asl $c1
$13:df8b  de 31 08      dec $0831,x
$13:df8e  c8            iny
$13:df8f  70 5e         bvs $dfef
$13:df91  21 0d         and ($0d,x)
$13:df93  9b            txy
$13:df94  41 a3         eor ($a3,x)
$13:df96  51 88         eor ($88),y
$13:df98  c4 88         cpy $88
$13:df9a  94 01         sty $01,x
$13:df9c  90 8c         bcc $df2a
$13:df9e  46 c0         lsr $c0
$13:dfa0  03 24         ora $24,s
$13:dfa2  83 41         sta $41,s
$13:dfa4  80 40         bra $dfe6
$13:dfa6  4a            lsr a
$13:dfa7  13 48         ora ($48,s),y
$13:dfa9  8b            phb
$13:dfaa  05 2e         ora $2e
$13:dfac  12 60         ora ($60)
$13:dfae  68            pla
$13:dfaf  1d 98 72      ora $7298,x
$13:dfb2  13 96         ora ($96,s),y
$13:dfb4  88            dey
$13:dfb5  07 09         ora [$09]
$13:dfb7  a0 05 46      ldy #$4605
$13:dfba  4c 05 90      jmp $9005
$13:dfbd  1a            inc a
$13:dfbe  05 20         ora $20
$13:dfc0  97 ce         sta [$ce],y
$13:dfc2  8e ea 98      stx $98ea
$13:dfc5  00 e0         brk #$e0
$13:dfc7  a6 05         ldx $05
$13:dfc9  98            tya
$13:dfca  0b            phd
$13:dfcb  26 26         rol $26
$13:dfcd  49 1e 96      eor #$961e
$13:dfd0  24 55         bit $55
$13:dfd2  12 51         ora ($51)
$13:dfd4  b2 06         lda ($06)
$13:dfd6  74 12         stz $12,x
$13:dfd8  28            plp
$13:dfd9  22 84 07 46   jsl $460784
$13:dfdd  a9 19 73      lda #$7319
$13:dfe0  0c d8 c4      tsb $c4d8
$13:dfe3  8c 44 fc      sty $fc44
$13:dfe6  07 05         ora [$05]
$13:dfe8  3f 69 c6 6b   and $6bc669,x
$13:dfec  84 b5         sty $b5
$13:dfee  4e cc 52      lsr $52cc
$13:dff1  96 39         stx $39,y
$13:dff3  c2 80         rep #$80
$13:dff5  c6 06         dec $06
$13:dff7  20 87 09      jsr $0987
$13:dffa  ac 28 21      ldy $2128
$13:dffd  6a            ror a
$13:dffe  85 05         sta $05
$13:e000  a8            tay
$13:e001  01 b2         ora ($b2,x)
$13:e003  83 4d         sta $4d,s
$13:e005  e3 71         sbc $71,s
$13:e007  98            tya
$13:e008  83 c8         sta $c8,s
$13:e00a  22 11 a7 98   jsl $98a711
$13:e00e  c6 de         dec $de
$13:e010  62 dd 09      per $e9f0
$13:e013  2c 86 31      bit $3186
$13:e016  19 8c 46      ora $468c,y
$13:e019  23 50         and $50,s
$13:e01b  20 10 46      jsr $4610
$13:e01e  c0 62 dd      cpy #$dd62
$13:e021  09 3c e8      ora #$e83c
$13:e024  10 0f         bpl $e035
$13:e026  50 91         bvc $dfb9
$13:e028  11 02         ora ($02),y
$13:e02a  05 23         ora $23
$13:e02c  09 88 3c      ora #$3c88
$13:e02f  65 d3         adc $d3
$13:e031  22 29 0f c0   jsl $c00f29
$13:e035  46 30         lsr $30
$13:e037  48            pha
$13:e038  10 3c         bpl $e076
$13:e03a  52 28         eor ($28)
$13:e03c  9a            txs
$13:e03d  01 10         ora ($10,x)
$13:e03f  96 00         stx $00,y
$13:e041  5e 4c 40      lsr $404c,x
$13:e044  22 13 18 12   jsl $121813
$13:e048  44 dd 0b      mvp $0b,$dd
$13:e04b  2b            pld
$13:e04c  4c 45 80      jmp $8045
$13:e04f  e5 16         sbc $16
$13:e051  31 93         and ($93),y
$13:e053  c6 74         dec $74
$13:e055  74 44         stz $44,x
$13:e057  48            pha
$13:e058  97 0c         sta [$0c],y
$13:e05a  22 05 61 32   jsl $326105
$13:e05e  8c e4 d4      sty $d4e4
$13:e061  a6 11         ldx $11
$13:e063  2b            pld
$13:e064  0b            phd
$13:e065  90 4d         bcc $e0b4
$13:e067  4e e4 13      lsr $13e4
$13:e06a  21 1a         and ($1a,x)
$13:e06c  98            tya
$13:e06d  66 63         ror $63
$13:e06f  53 36         eor ($36,s),y
$13:e071  23 1c         and $1c,s
$13:e073  db            stp
$13:e074  22 b2 35 7b   jsl $7b35b2
$13:e078  18            clc
$13:e079  80 d4         bra $e04f
$13:e07b  65 e2         adc $e2
$13:e07d  59 9b a4      eor $a49b,y
$13:e080  56 66         lsr $66,x
$13:e082  cf 53 10 4c   cmp $4c1053
$13:e086  25 e4         and $e4
$13:e088  31 96         and ($96),y
$13:e08a  ce a3 71      dec $71a3
$13:e08d  08            php
$13:e08e  d4 42         pei ($42)
$13:e090  32 15         and ($15)
$13:e092  07 78         ora [$78]
$13:e094  3d 46 35      and $3546,x
$13:e097  22 85 4d 23   jsl $234d85
$13:e09b  71 88         adc ($88),y
$13:e09d  d4 62         pei ($62)
$13:e09f  33 18         and ($18,s),y
$13:e0a1  8c 3f c0      sty $c03f
$13:e0a4  0a            asl a
$13:e0a5  31 a9         and ($a9),y
$13:e0a7  cb            wai
$13:e0a8  f4 62 12      pea $1262
$13:e0ab  28            plp
$13:e0ac  14 85         trb $85
$13:e0ae  e8            inx
$13:e0af  b2 28         lda ($28)
$13:e0b1  5b            tcd
$13:e0b2  f4 24 6e      pea $6e24
$13:e0b5  70 1d         bvs $e0d4
$13:e0b7  8c 08 3e      sty $3e08
$13:e0ba  02 51         cop #$51
$13:e0bc  43 83         eor $83,s
$13:e0be  f4 1c e2      pea $e21c
$13:e0c1  4b            phk
$13:e0c2  01 10         ora ($10,x)
$13:e0c4  ce 60 62      dec $6260
$13:e0c7  02 7e         cop #$7e
$13:e0c9  82 a4 c6      brl $a770
$13:e0cc  46 e8         lsr $e8
$13:e0ce  10 60         bpl $e130
$13:e0d0  ad 56 5c      lda $5c56
$13:e0d3  22 0a 05 05   jsl $05050a
$13:e0d7  ae 04 d1      ldx $d104
$13:e0da  6b            rtl
$13:e0db  29 58 45      and #$4558
$13:e0de  46 c6         lsr $c6
$13:e0e0  16 42         asl $42,x
$13:e0e2  8c c8 9a      sty $9ac8
$13:e0e5  2a            rol a
$13:e0e6  21 55         and ($55,x)
$13:e0e8  1b            tcs
$13:e0e9  14 a0         trb $a0
$13:e0eb  84 d2         sty $d2
$13:e0ed  47 b9         eor [$b9]
$13:e0ef  58            cli
$13:e0f0  51 b6         eor ($b6),y
$13:e0f2  cc 09 93      cpy $9309
$13:e0f5  f4 1d 44      pea $441d
$13:e0f8  db            stp
$13:e0f9  27 58         and [$58]
$13:e0fb  2d c6 84      and $84c6
$13:e0fe  fd 09 d0      sbc $d009,x
$13:e101  ac 0e 64      ldy $640e
$13:e104  8a            txa
$13:e105  11 50         ora ($50),y
$13:e107  87 04         sta [$04]
$13:e109  b6 07         ldx $07,y
$13:e10b  20 28 89      jsr $8928
$13:e10e  c0 4f 60      cpy #$604f
$13:e111  c8            iny
$13:e112  01 68         ora ($68,x)
$13:e114  9e c2 80      stz $80c2,x
$13:e117  61 19         adc ($19,x)
$13:e119  d3 20         cmp ($20,s),y
$13:e11b  1b            tcs
$13:e11c  04 0d         tsb $0d
$13:e11e  01 70         ora ($70,x)
$13:e120  1c c0 64      trb $64c0
$13:e123  22 b0 60 10   jsl $1060b0
$13:e127  c8            iny
$13:e128  5d e1 40      eor $40e1,x
$13:e12b  29 89 c0      and #$c089
$13:e12e  66 03         ror $03
$13:e130  f4 9a 0e      pea $0e9a
$13:e133  00 e6         brk #$e6
$13:e135  28            plp
$13:e136  08            php
$13:e137  77 81         adc [$81],y
$13:e139  24 13         bit $13
$13:e13b  f4 ef 24      pea $24ef
$13:e13e  7b            tdc
$13:e13f  ad 85 fe      lda $fe85
$13:e142  8d 31 43      sta $4331
$13:e145  19 ac 1b      ora $1bac,y
$13:e148  c2 73         rep #$73
$13:e14a  13 80         ora ($80,s),y
$13:e14c  00 48         brk #$48
$13:e14e  de 0c 80      dec $800c,x
$13:e151  0f a0 14 40   ora $4014a0
$13:e155  23 2c         and $2c,s
$13:e157  67 88         adc [$88]
$13:e159  bd 17 e2      lda $e217,x
$13:e15c  30 10         bmi $e16e
$13:e15e  28            plp
$13:e15f  ce 66 82      dec $8266
$13:e162  13 6b         ora ($6b,s),y
$13:e164  13 c4         ora ($c4,s),y
$13:e166  66 46         ror $46
$13:e168  d1 18         cmp ($18),y
$13:e16a  91 ac         sta ($ac),y
$13:e16c  84 24         sty $24
$13:e16e  8b            phb
$13:e16f  19 a0 04      ora $04a0,y
$13:e172  91 64         sta ($64),y
$13:e174  31 30         and ($30),y
$13:e176  a8            tay
$13:e177  0f d4 cc 62   ora $62ccd4
$13:e17b  b3 26         lda ($26,s),y
$13:e17d  80 04         bra $e183
$13:e17f  0d 64 30      ora $3064
$13:e182  57 78         eor [$78],y
$13:e184  39 c2 80      and $80c2,y
$13:e187  c5 21         cmp $21
$13:e189  0a            asl a
$13:e18a  93 c5         sta ($c5,s),y
$13:e18c  c0 4c 01      cpy #$014c
$13:e18f  1e 83 a4      asl $a483,x
$13:e192  8f a0 a0 04   sta $04a0a0
$13:e196  58            cli
$13:e197  1d 84 f8      ora $f884,x
$13:e19a  33 89         and ($89,s),y
$13:e19c  34 1a         bit $1a,x
$13:e19e  0c 16 00      tsb $0016
$13:e1a1  b8            clv
$13:e1a2  85 44         sta $44
$13:e1a4  0a            asl a
$13:e1a5  52 fb         eor ($fb)
$13:e1a7  23 f4         and $f4,s
$13:e1a9  04 75         tsb $75
$13:e1ab  01 06         ora ($06,x)
$13:e1ad  7b            tdc
$13:e1ae  f4 1d a0      pea $a01d
$13:e1b1  b9 46 d1      lda $d146,y
$13:e1b4  bf 05 6c e3   lda $e36c05,x
$13:e1b8  86 3b         stx $3b
$13:e1ba  04 e3         tsb $e3
$13:e1bc  f2 24         sbc ($24)
$13:e1be  94 30         sty $30,x
$13:e1c0  ba            tsx
$13:e1c1  00 62         brk #$62
$13:e1c3  c3 c3         cmp $c3,s
$13:e1c5  63 39         adc $39,s
$13:e1c7  69 20 93      adc #$9320
$13:e1ca  99 80 04      sta $0480,y
$13:e1cd  4c d4 74      jmp $74d4
$13:e1d0  61 d1         adc ($d1,x)
$13:e1d2  bf cc 29 ea   lda $ea29cc,x
$13:e1d6  5f 5b 7a 5d   eor $5d7a5b,x
$13:e1da  85 e0         sta $e0
$13:e1dc  df 95 e0 a7   cmp $a7e095,x
$13:e1e0  42 ca         wdm #$ca
$13:e1e2  98            tya
$13:e1e3  29 72 0c      and #$0c72
$13:e1e6  67 50         adc [$50]
$13:e1e8  b9 84 be      lda $be84,y
$13:e1eb  5c ef 57 93   jml $9357ef
$13:e1ef  40            rti
$13:e1f0  53 a1         eor ($a1,s),y
$13:e1f2  27 5f         and [$5f]
$13:e1f4  db            stp
$13:e1f5  fe 43 4a      inc $4a43,x
$13:e1f8  11 e0         ora ($e0),y
$13:e1fa  89 4b 1b      bit #$1b4b
$13:e1fd  e0 64 51      cpx #$5164
$13:e200  79 cb 28      adc $28cb,y
$13:e203  47 20         eor [$20]
$13:e205  a0 12 10      ldy #$1012
$13:e208  5e 6f a0      lsr $a06f,x
$13:e20b  47 89         eor [$89]
$13:e20d  61 1d         adc ($1d,x)
$13:e20f  e6 64         inc $64
$13:e211  19 c9 59      ora $59c9,y
$13:e214  4d e6 f6      eor $f6e6
$13:e217  09 91 98      ora #$9891
$13:e21a  5f 80 2c 89   eor $892c80,x
$13:e21e  72 18         adc ($18)
$13:e220  11 46         ora ($46),y
$13:e222  1e 70 51      asl $5170,x
$13:e225  8b            phb
$13:e226  3d 5b eb      and $eb5b,x
$13:e229  e8            inx
$13:e22a  22 8b 64 65   jsl $65648b
$13:e22e  a6 f1         ldx $f1
$13:e230  6c 9d 04      jmp ($049d)
$13:e233  aa            tax
$13:e234  07 71         ora [$71]
$13:e236  3c 84 c9      bit $c984,x
$13:e239  d4 50         pei ($50)
$13:e23b  b9 c1 90      lda $90c1,y
$13:e23e  cc c1 0a      cpy $0ac1
$13:e241  9a            txs
$13:e242  1d 06 61      ora $6106,x
$13:e245  31 54         and ($54),y
$13:e247  04 e8         tsb $e8
$13:e249  ee 10 43      inc $4310
$13:e24c  b0 bf         bcs $e20d
$13:e24e  4a            lsr a
$13:e24f  73 38         adc ($38,s),y
$13:e251  52 1a         eor ($1a)
$13:e253  14 df         trb $df
$13:e255  a0 16 19      ldy #$1916
$13:e258  79 14 09      adc $0914,y
$13:e25b  04 96         tsb $96
$13:e25d  17 e0         ora [$e0],y
$13:e25f  90 88         bcc $e1e9
$13:e261  aa            tax
$13:e262  01 22         ora ($22,x)
$13:e264  4a            lsr a
$13:e265  90 b4         bcc $e21b
$13:e267  c3 e4         cmp $e4,s
$13:e269  5a            phy
$13:e26a  33 a0         and ($a0,s),y
$13:e26c  0b            phd
$13:e26d  4d 85 13      eor $1385
$13:e270  22 6e ce 8b   jsl $8bce6e
$13:e274  be 4e b1      ldx $b14e,y
$13:e277  90 13         bcc $e28c
$13:e279  6c 64 24      jmp ($2464)
$13:e27c  da            phx
$13:e27d  19 09 32      ora $3209,y
$13:e280  44 60 aa      mvp $aa,$60
$13:e283  19 c9 35      ora $35c9,y
$13:e286  d5 24         cmp $24,x
$13:e288  ea            nop
$13:e289  11 68         ora ($68),y
$13:e28b  88            dey
$13:e28c  c1 c8         cmp ($c8,x)
$13:e28e  80 90         bra $e220
$13:e290  7d 1a e0      adc $e01a,x
$13:e293  9c 24 ca      stz $ca24
$13:e296  18            clc
$13:e297  5c 0c 38 33   jml $33380c
$13:e29b  48            pha
$13:e29c  4b            phk
$13:e29d  c0 e1 72      cpy #$72e1
$13:e2a0  07 82         ora [$82]
$13:e2a2  42 66         wdm #$66
$13:e2a4  af f4 81 c2   lda $c281f4
$13:e2a8  9f eb 18 88   sta $8818eb,x
$13:e2ac  b2 85         lda ($85)
$13:e2ae  b0 6d         bcs $e31d
$13:e2b0  80 98         bra $e24a
$13:e2b2  10 c2         bpl $e276
$13:e2b4  65 10         adc $10
$13:e2b6  8c c4 02      sty $02c4
$13:e2b9  03 04         ora $04,s
$13:e2bb  bb            tyx
$13:e2bc  4c c3 22      jmp $22c3
$13:e2bf  45 04         eor $04
$13:e2c1  58            cli
$13:e2c2  46 23         lsr $23
$13:e2c4  22 f0 88 c2   jsl $c288f0
$13:e2c8  e2 42         sep #$42
$13:e2ca  60            rts
$13:e2cb  19 85 02      ora $0285,y
$13:e2ce  5a            phy
$13:e2cf  9a            txs
$13:e2d0  10 f8         bpl $e2ca
$13:e2d2  c6 44         dec $44
$13:e2d4  01 1a         ora ($1a,x)
$13:e2d6  13 04         ora ($04,s),y
$13:e2d8  65 90         adc $90
$13:e2da  14 05         trb $05
$13:e2dc  50 8b         bvc $e269
$13:e2de  c8            iny
$13:e2df  60            rts
$13:e2e0  04 52         tsb $52
$13:e2e2  08            php
$13:e2e3  14 4a         trb $4a
$13:e2e5  30 3f         bmi $e326
$13:e2e7  81 00         sta ($00,x)
$13:e2e9  1a            inc a
$13:e2ea  82 35 10      brl $f322
$13:e2ed  17 84         ora [$84],y
$13:e2ef  0a            asl a
$13:e2f0  42 53         wdm #$53
$13:e2f2  41 80         eor ($80,x)
$13:e2f4  1e 82 34      asl $3482,x
$13:e2f7  5e 18 19      lsr $1918,x
$13:e2fa  c4 22         cpy $22
$13:e2fc  12 28         ora ($28)
$13:e2fe  59 c4 4d      eor $4dc4,y
$13:e301  4a            lsr a
$13:e302  10 10         bpl $e314
$13:e304  d8            cld
$13:e305  4c 99 80      jmp $8099
$13:e308  79 62 40      adc $4062,y
$13:e30b  0a            asl a
$13:e30c  86 5d         stx $5d
$13:e30e  32 41         and ($41)
$13:e310  09 a8 10      ora #$10a8
$13:e313  a0 51 18      ldy #$1851
$13:e316  8d 02 83      sta $8302
$13:e319  2d 52 8b      and $8b52
$13:e31c  89 08 22      bit #$2208
$13:e31f  32 15         and ($15)
$13:e321  98            tya
$13:e322  37 c8         and [$c8],y
$13:e324  22 45 11 60   jsl $601145
$13:e328  92 ec         sta ($ec)
$13:e32a  8b            phb
$13:e32b  82 0f 05      brl $e83d
$13:e32e  f9 1a 0c      sbc $0c1a,y
$13:e331  d4 61         pei ($61)
$13:e333  f0 84         beq $e2b9
$13:e335  bb            tyx
$13:e336  ea            nop
$13:e337  c9 06 83      cmp #$8306
$13:e33a  4d 5f f5      eor $f55f
$13:e33d  fe 87 43      inc $4387,x
$13:e340  8b            phb
$13:e341  42 d6         wdm #$d6
$13:e343  34 a1         bit $a1,x
$13:e345  4e 60 b1      lsr $b160
$13:e348  68            pla
$13:e349  b3 30         lda ($30,s),y
$13:e34b  41 e5         eor ($e5,x)
$13:e34d  39 1d 02      and $021d,y
$13:e350  dc 61 a1      jml [$a161]
$13:e353  d2 6b         cmp ($6b)
$13:e355  a2 c8 68      ldx #$68c8
$13:e358  51 28         eor ($28),y
$13:e35a  a8            tay
$13:e35b  74 1b         stz $1b,x
$13:e35d  22 6a 34 49   jsl $49346a
$13:e361  8b            phb
$13:e362  04 f6         tsb $f6
$13:e364  47 b2         eor [$b2]
$13:e366  4c 98 f0      jmp $f098
$13:e369  5d 23 43      eor $4323,x
$13:e36c  a1 91         lda ($91,x)
$13:e36e  32 79         and ($79)
$13:e370  3c 2a 65      bit $652a,x
$13:e373  12 88         ora ($88)
$13:e375  ac 05 41      ldy $4105
$13:e378  92 d1         sta ($d1)
$13:e37a  5a            phy
$13:e37b  0c a1 07      tsb $07a1
$13:e37e  99 ec 84      sta $84ec,y
$13:e381  60            rts
$13:e382  17 25         ora [$25],y
$13:e384  d1 c4         cmp ($c4),y
$13:e386  89 64 16      bit #$1664
$13:e389  09 7c b1      ora #$b17c
$13:e38c  90 2c         bcc $e3ba
$13:e38e  d0 6d         bne $e3fd
$13:e390  04 69         tsb $69
$13:e392  36 63         rol $63,x
$13:e394  80 a0         bra $e336
$13:e396  ae 06 22      ldx $2206
$13:e399  b8            clv
$13:e39a  25 59         and $59
$13:e39c  8c 8e 34      sty $348e
$13:e39f  77 06         adc [$06],y
$13:e3a1  48            pha
$13:e3a2  9e d2 26      stz $26d2,x
$13:e3a5  88            dey
$13:e3a6  23 38         and $38,s
$13:e3a8  36 08         rol $08,x
$13:e3aa  58            cli
$13:e3ab  30 68         bmi $e415
$13:e3ad  35 96         and $96,x
$13:e3af  12 f2         ora ($f2)
$13:e3b1  19 03 c8      ora $c803,y
$13:e3b4  9e 45 0e      stz $0e45,x
$13:e3b7  87 7f         sta [$7f]
$13:e3b9  e6 a0         inc $a0
$13:e3bb  21 85         and ($85,x)
$13:e3bd  00 88         brk #$88
$13:e3bf  0e 4e d0      asl $d04e
$13:e3c2  83 88         sta $88,s
$13:e3c4  c9 2c 43      cmp #$432c
$13:e3c7  50 1b         bvc $e3e4
$13:e3c9  04 2d         tsb $2d
$13:e3cb  da            phx
$13:e3cc  10 f8         bpl $e3c6
$13:e3ce  88            dey
$13:e3cf  fd 08 82      sbc $8208,x
$13:e3d2  66 17         ror $17
$13:e3d4  68            pla
$13:e3d5  45 ce         eor $ce
$13:e3d7  e2 51         sep #$51
$13:e3d9  22 81 1d c0   jsl $c01d81
$13:e3dd  3e 26 71      rol $7126,x
$13:e3e0  15 08         ora $08,x
$13:e3e2  a0 90         ldy #$90
$13:e3e4  c2 2f         rep #$2f
$13:e3e6  b4 b0         ldy $b0,x
$13:e3e8  8f ed 8c 13   sta $138ced
$13:e3ec  01 79         ora ($79,x)
$13:e3ee  50 c6         bvc $e3b6
$13:e3f0  8d 19 5f      sta $5f19
$13:e3f3  80 fc         bra $e3f1
$13:e3f5  a7 84         lda [$84]
$13:e3f7  46 8c         lsr $8c
$13:e3f9  88            dey
$13:e3fa  c0 de         cpy #$de
$13:e3fc  32 1a         and ($1a)
$13:e3fe  24 62         bit $62
$13:e400  44 d1 31      mvp $31,$d1
$13:e403  e0 44         cpx #$44
$13:e405  60            rts
$13:e406  61 f1         adc ($f1,x)
$13:e408  09 08 4c      ora #$4c08
$13:e40b  45 40         eor $40
$13:e40d  8a            txa
$13:e40e  11 69         ora ($69),y
$13:e410  88            dey
$13:e411  86 17         stx $17
$13:e413  04 64         tsb $64
$13:e415  01 e4         ora ($e4,x)
$13:e417  87 ac         sta [$ac]
$13:e419  e1 06         sbc ($06,x)
$13:e41b  c0 2a         cpy #$2a
$13:e41d  5c a4 31 b2   jml $b231a4
$13:e421  c8            iny
$13:e422  2e 2e 36      rol $362e
$13:e425  c6 78         dec $78
$13:e427  4b            phk
$13:e428  bd 21 72      lda $7221,x
$13:e42b  07 79         ora [$79]
$13:e42d  c2 26         rep #$26
$13:e42f  93 57         sta ($57,s),y
$13:e431  fa            plx
$13:e432  40            rti
$13:e433  e1 4f         sbc ($4f,x)
$13:e435  f5 53         sbc $53,x
$13:e437  02 60         cop #$60
$13:e439  0d 80 a2      ora $a280
$13:e43c  29 84 c6      and #$c684
$13:e43f  63 32         adc $32,s
$13:e441  08            php
$13:e442  02 20         cop #$20
$13:e444  c2 65         rep #$65
$13:e446  39 a0 4b      and $4ba0,y
$13:e449  65 94         adc $94
$13:e44b  25 b8         and $b8
$13:e44d  ae 52 26      ldx $2652
$13:e450  58            cli
$13:e451  08            php
$13:e452  8d 00 58      sta $5800
$13:e455  28            plp
$13:e456  51 91         eor ($91),y
$13:e458  40            rti
$13:e459  a4 2c         ldy $2c
$13:e45b  d0 72         bne $e4cf
$13:e45d  82 2c 11      brl $f58c
$13:e460  02 d7         cop #$d7
$13:e462  08            php
$13:e463  24 e6         bit $e6
$13:e465  07 0b         ora [$0b]
$13:e467  21 03         and ($03,x)
$13:e469  50 53         bvc $e4be
$13:e46b  60            rts
$13:e46c  2f 16 b8 06   and $06b816
$13:e470  80 36         bra $e4a8
$13:e472  0a            asl a
$13:e473  40            rti
$13:e474  81 48         sta ($48,x)
$13:e476  ca            dex
$13:e477  42 3f         wdm #$3f
$13:e479  15 38         ora $38,x
$13:e47b  4b            phk
$13:e47c  60            rts
$13:e47d  30 19         bmi $e498
$13:e47f  71 88         adc ($88),y
$13:e481  54 c0 74      mvn $74,$c0
$13:e484  35 b8         and $b8,x
$13:e486  50 28         bvc $e4b0
$13:e488  34 19         bit $19,x
$13:e48a  6c e8 ee      jmp ($eee8)
$13:e48d  41 90         eor ($90,x)
$13:e48f  31 00         and ($00),y
$13:e491  f0 54         beq $e4e7
$13:e493  82 3a 00      brl $e4d0
$13:e496  b1 4b         lda ($4b),y
$13:e498  c5 61         cmp $61
$13:e49a  0b            phd
$13:e49b  26 08         rol $08
$13:e49d  7c 02 61      jmp ($6102,x)
$13:e4a0  04 13         tsb $13
$13:e4a2  15 05         ora $05,x
$13:e4a4  26 24         rol $24
$13:e4a6  c1 2b         cmp ($2b,x)
$13:e4a8  90 90         bcc $e43a
$13:e4aa  0e e4 78      asl $78e4
$13:e4ad  01 e0         ora ($e0,x)
$13:e4af  8f 85 c4 0e   sta $0ec485
$13:e4b3  21 88         and ($88,x)
$13:e4b5  44 d8 82      mvp $82,$d8
$13:e4b8  4c 15 71      jmp $7115
$13:e4bb  96 44         stx $44,y
$13:e4bd  aa            tax
$13:e4be  45 b2         eor $b2
$13:e4c0  5f 39 18 59   eor $591839,x
$13:e4c4  47 00         eor [$00]
$13:e4c6  77 f8         adc [$f8],y
$13:e4c8  03 c2         ora $c2,s
$13:e4ca  3e 22 f1      rol $f122,x
$13:e4cd  9f 91 3c ab   sta $ab3c91,x
$13:e4d1  e6 6f         inc $6f
$13:e4d3  3b            tsc
$13:e4d4  fa            plx
$13:e4d5  23 d3         and $d3,s
$13:e4d7  3e aa f5      rol $f5aa,x
$13:e4da  df b3 3d 9e   cmp $9e3db3,x
$13:e4de  11 98         ora ($98),y
$13:e4e0  cc 61 c4      cpy $c461
$13:e4e3  11 a8         ora ($a8),y
$13:e4e5  c3 84         cmp $84,s
$13:e4e7  5c 23 1b 8c   jml $8c1b23
$13:e4eb  33 fd         and ($fd,s),y
$13:e4ed  ff e1 0f 10   sbc $100fe1,x
$13:e4f1  f8            sed
$13:e4f2  cb            wai
$13:e4f3  c8            iny
$13:e4f4  7e 54 f3      ror $f354,x
$13:e4f7  2f 9d bd 0f   and $0fbd9d
$13:e4fb  e9 8f 54      sbc #$548f
$13:e4fe  fa            plx
$13:e4ff  eb            xba
$13:e500  d9 7e ce      cmp $ce7e,y
$13:e503  08            php
$13:e504  d3 3b         cmp ($3b,s),y
$13:e506  de 1e fa      dec $fa1e,x
$13:e509  78            sei
$13:e50a  c4 62         cpy $62
$13:e50c  35 18         and $18,x
$13:e50e  7d 54 42      adc $4254,x
$13:e511  21 1a         and ($1a,x)
$13:e513  88            dey
$13:e514  3f f2 45 0b   and $0b45f2,x
$13:e518  7d 54 83      adc $8354,x
$13:e51b  ae 3c 07      ldx $073c
$13:e51e  d5 42         cmp $42,x
$13:e520  ba            tsx
$13:e521  f7 2b         sbc [$2b],y
$13:e523  93 ea         sta ($ea,s),y
$13:e525  aa            tax
$13:e526  84 cd         sty $cd
$13:e528  a9 93 36      lda #$3693
$13:e52b  a4 3c         ldy $3c
$13:e52d  d8            cld
$13:e52e  5c 2e 81 41   jml $41812e
$13:e532  7d 54 e5      adc $e554,x
$13:e535  16 13         asl $13,x
$13:e537  97 d5         sta [$d5],y
$13:e539  44 e3 11      mvp $11,$e3
$13:e53c  11 75         ora ($75),y
$13:e53e  ae bd 97      ldx $97bd
$13:e541  ed cf 76      sbc $76cf
$13:e544  fc 62 36      jsr ($3662,x)
$13:e547  2b            pld
$13:e548  01 58         ora ($58,x)
$13:e54a  00 02         brk #$02
$13:e54c  32 06         and ($06)
$13:e54e  18            clc
$13:e54f  c3 b8         cmp $b8,s
$13:e551  62 11 b8      per $9d65
$13:e554  80 44         bra $e59a
$13:e556  42 01         wdm #$01
$13:e558  19 0b 0c      ora $0c0b,y
$13:e55b  41 dc         eor ($dc,x)
$13:e55d  30 29         bmi $e588
$13:e55f  1a            inc a
$13:e560  2c 21 61      bit $6121
$13:e563  f0 81         beq $e4e6
$13:e565  48            pha
$13:e566  41 0a         eor ($0a,x)
$13:e568  7c 11 7c      jmp ($7c11,x)
$13:e56b  3b            tsc
$13:e56c  84 ba         sty $ba
$13:e56e  05 d0         ora $d0
$13:e570  b9 9f 00      lda $009f,y
$13:e573  7e 83 c5      ror $c583,x
$13:e576  27 a9         and [$a9]
$13:e578  2b            pld
$13:e579  c7 64         cmp [$64]
$13:e57b  43 13         eor $13,s
$13:e57d  81 15         sta ($15,x)
$13:e57f  9e 83 42      stz $4283,x
$13:e582  4e 0c 28      lsr $280c
$13:e585  8b            phb
$13:e586  02 11         cop #$11
$13:e588  40            rti
$13:e589  82 10 0e      brl $f39c
$13:e58c  00 6f         brk #$6f
$13:e58e  27 70         and [$70]
$13:e590  c1 21         cmp ($21,x)
$13:e592  71 28         adc ($28),y
$13:e594  c4 45         cpy $45
$13:e596  1e 68 10      asl $1068,x
$13:e599  89 3b bd      bit #$bd3b
$13:e59c  79 ec df      adc $dfec,y
$13:e59f  6f 7c 84 32   adc $32847c
$13:e5a3  31 08         and ($08),y
$13:e5a5  d0 60         bne $e607
$13:e5a7  83 22         sta $22,s
$13:e5a9  15 00         ora $00,x
$13:e5ab  f0 09         beq $e5b6
$13:e5ad  c0 54         cpy #$54
$13:e5af  12 20         ora ($20)
$13:e5b1  01 0a         ora ($0a,x)
$13:e5b3  46 36         lsr $36
$13:e5b5  2b            pld
$13:e5b6  04 10         tsb $10
$13:e5b8  23 c8         and $c8,s
$13:e5ba  22 20 60 7d   jsl $7d6020
$13:e5be  9c 80 e0      stz $e080
$13:e5c1  82 16 80      brl $65da
$13:e5c4  21 10         and ($10,x)
$13:e5c6  d2 25         cmp ($25)
$13:e5c8  a0 33         ldy #$33
$13:e5ca  90 bf         bcc $e58b
$13:e5cc  c8            iny
$13:e5cd  0e 42 41      asl $4142
$13:e5d0  fb            xce
$13:e5d1  18            clc
$13:e5d2  94 7c         sty $7c,x
$13:e5d4  42 90         wdm #$90
$13:e5d6  2a            rol a
$13:e5d7  79 14 85      adc $8514,y
$13:e5da  24 87         bit $87
$13:e5dc  01 fc         ora ($fc,x)
$13:e5de  40            rti
$13:e5df  53 26         eor ($26,s),y
$13:e5e1  8f b9 65 06   sta $0665b9
$13:e5e5  5a            phy
$13:e5e6  8f b9 d4 2e   sta $2ed4b9
$13:e5ea  70 6f         bvs $e65b
$13:e5ec  24 3a         bit $3a
$13:e5ee  2e 56 17      rol $1756
$13:e5f1  30 97         bmi $e58a
$13:e5f3  ab            plb
$13:e5f4  05 56         ora $56
$13:e5f6  2a            rol a
$13:e5f7  d0 96         bne $e58f
$13:e5f9  50 a1         bvc $e59c
$13:e5fb  74 00         stz $00,x
$13:e5fd  78            sei
$13:e5fe  4e 17 63      lsr $6317
$13:e601  40            rti
$13:e602  a0 b7         ldy #$b7
$13:e604  01 ba         ora ($ba,x)
$13:e606  0e 71 85      asl $8571
$13:e609  c6 83         dec $83
$13:e60b  60            rts
$13:e60c  ef 18 84 64   sbc $648418
$13:e610  38            sec
$13:e611  21 e0         and ($e0,x)
$13:e613  7d 8c 6a      adc $6a8c,x
$13:e616  31 18         and ($18),y
$13:e618  91 05         sta ($05),y
$13:e61a  40            rti
$13:e61b  32 11         and ($11)
$13:e61d  88            dey
$13:e61e  d8            cld
$13:e61f  00 1f         brk #$1f
$13:e621  64 02         stz $02
$13:e623  09 00 a5      ora #$a500
$13:e626  05 84         ora $84
$13:e628  fb            xce
$13:e629  1e bc 10      asl $10bc,x
$13:e62c  c0 d7         cpy #$d7
$13:e62e  3e b8 6c      rol $6cb8,x
$13:e631  e1 75         sbc ($75,x)
$13:e633  21 16         and ($16,x)
$13:e635  4c 6a 82      jmp $826a
$13:e638  2c 80 ca      bit $ca80
$13:e63b  08            php
$13:e63c  5e 53 f3      lsr $f353,x
$13:e63f  27 89         and [$89]
$13:e641  61 52         adc ($52,x)
$13:e643  15 16         ora $16,x
$13:e645  08            php
$13:e646  30 95         bmi $e5dd
$13:e648  16 89         asl $89,x
$13:e64a  f8            sed
$13:e64b  4d bb 4c      eor $4cbb
$13:e64e  95 14         sta $14,x
$13:e650  e3 07         sbc $07,s
$13:e652  08            php
$13:e653  27 ca         and [$ca]
$13:e655  4d 06 83      eor $8306
$13:e658  50 56         bvc $e6b0
$13:e65a  a3 2c         lda $2c,s
$13:e65c  73 85         adc ($85,s),y
$13:e65e  01 6a         ora ($6a,x)
$13:e660  0b            phd
$13:e661  41 9f         eor ($9f,x)
$13:e663  b7 02         lda [$02],y
$13:e665  16 d5         asl $d5,x
$13:e667  16 a0         asl $a0,x
$13:e669  39 06 80      and $8006,y
$13:e66c  d4 09         pei ($09)
$13:e66e  c3 70         cmp $70,s
$13:e670  51 64         eor ($64),y
$13:e672  f2 f0         sbc ($f0)
$13:e674  1f 84 2a 4f   ora $4f2a84,x
$13:e678  2e 99 42      rol $4299
$13:e67b  e7 2e         sbc [$2e]
$13:e67d  60            rts
$13:e67e  98            tya
$13:e67f  4c 44 63      jmp $6344
$13:e682  04 81         tsb $81
$13:e684  07 c6         ora [$c6]
$13:e686  03 2e         ora $2e,s
$13:e688  98            tya
$13:e689  8d 06 5e      sta $5e06
$13:e68c  32 01         and ($01)
$13:e68e  18            clc
$13:e68f  09 01 1a      ora #$1a01
$13:e692  16 54         asl $54,x
$13:e694  b1 a5         lda ($a5),y
$13:e696  88            dey
$13:e697  66 43         ror $43
$13:e699  f2 39         sbc ($39)
$13:e69b  b2 9d         lda ($9d)
$13:e69d  0a            asl a
$13:e69e  3e 62 f3      rol $f362,x
$13:e6a1  9f a1 35 44   sta $4435a1,x
$13:e6a5  68            pla
$13:e6a6  90 45         bcc $e6ed
$13:e6a8  28            plp
$13:e6a9  c4 11         cpy $11
$13:e6ab  65 3a         adc $3a
$13:e6ad  75 02         adc $02,x
$13:e6af  c8            iny
$13:e6b0  e0 d0         cpx #$d0
$13:e6b2  65 8e         adc $8e
$13:e6b4  3b            tsc
$13:e6b5  06 03         asl $03
$13:e6b7  2c a0 b5      bit $b5a0
$13:e6ba  01 d2         ora ($d2,x)
$13:e6bc  14 09         trb $09
$13:e6be  6a            ror a
$13:e6bf  cc 65 8c      cpy $8c65
$13:e6c2  f2 63         sbc ($63)
$13:e6c4  83 90         sta $90,s
$13:e6c6  e8            inx
$13:e6c7  0d 40 96      ora $9640
$13:e6ca  ce 82 1e      dec $1e82
$13:e6cd  ff f0 76 48   sbc $4876f0,x
$13:e6d1  e1 73         sbc ($73,x)
$13:e6d3  09 90 3a      ora #$3a90
$13:e6d6  84 01         sty $01
$13:e6d8  2f 97 03 aa   and $aa0397
$13:e6dc  63 2f         adc $2f,s
$13:e6de  46 90         lsr $90
$13:e6e0  3a            dec a
$13:e6e1  1b            tcs
$13:e6e2  83 41         sta $41,s
$13:e6e4  21 dc         and ($dc,x)
$13:e6e6  b1 ae         lda ($ae),y
$13:e6e8  00 ea         brk #$ea
$13:e6ea  30 09         bmi $e6f5
$13:e6ec  8a            txa
$13:e6ed  d8            cld
$13:e6ee  e1 30         sbc ($30,x)
$13:e6f0  98            tya
$13:e6f1  9c ee 72      stz $72ee
$13:e6f4  c9 02 69      cmp #$6902
$13:e6f7  2c c6 5d      bit $5dc6
$13:e6fa  32 31         and ($31)
$13:e6fc  0b            phd
$13:e6fd  1c 92 6a      trb $6a92
$13:e700  96 01         stx $01,y
$13:e702  10 b1         bpl $e6b5
$13:e704  c1 b2         cmp ($b2,x)
$13:e706  08            php
$13:e707  d0 94         bne $e69d
$13:e709  75 d6         adc $d6,x
$13:e70b  c8            iny
$13:e70c  7d 25 00      adc $0025,x
$13:e70f  c0 56         cpy #$56
$13:e711  a1 72         lda ($72,x)
$13:e713  63 8d         adc $8d,s
$13:e715  cd 78 27      cmp $2778
$13:e718  01 9c         ora ($9c,x)
$13:e71a  14 42         trb $42
$13:e71c  a6 c6         ldx $c6
$13:e71e  73 88         adc ($88,s),y
$13:e720  2c 00 c2      bit $c200
$13:e723  13 96         ora ($96,s),y
$13:e725  39 32 8c      and $8c32,y
$13:e728  5c 09 10 97   jml $971009
$13:e72c  4c 53 60      jmp $6053
$13:e72f  f6 24         inc $24,x
$13:e731  08            php
$13:e732  3d 00 5c      and $5c00,x
$13:e735  0b            phd
$13:e736  10 4b         bpl $e783
$13:e738  02 fc         cop #$fc
$13:e73a  5f 62 40 11   eor $114062,x
$13:e73e  92 a6         sta ($a6)
$13:e740  85 84         sta $84
$13:e742  29 62 2c      and #$2c62
$13:e745  aa            tax
$13:e746  7c 83 52      jmp ($5283,x)
$13:e749  60            rts
$13:e74a  09 80 2c      ora #$2c80
$13:e74d  43 70         eor $70,s
$13:e74f  26 45         rol $45
$13:e751  a9 1e 58      lda #$581e
$13:e754  02 4c         cop #$4c
$13:e756  52 3c         eor ($3c)
$13:e758  b3 84         lda ($84,s),y
$13:e75a  28            plp
$13:e75b  32 da         and ($da)
$13:e75d  89 72 27      bit #$2772
$13:e760  2d f1 9c      and $9cf1
$13:e763  4e 98 e2      lsr $e298
$13:e766  5f 77 d0 4b   eor $4bd077,x
$13:e76a  cb            wai
$13:e76b  70 cf         bvs $e73c
$13:e76d  11 b8         ora ($b8),y
$13:e76f  96 e1         stx $e1,y
$13:e771  ea            nop
$13:e772  2c 21 35      bit $3521
$13:e775  87 5e         sta [$5e]
$13:e777  e6 2f         inc $2f
$13:e779  53 31         eor ($31,s),y
$13:e77b  1a            inc a
$13:e77c  40            rti
$13:e77d  4a            lsr a
$13:e77e  28            plp
$13:e77f  f7 3b         sbc [$3b],y
$13:e781  93 c8         sta ($c8,s),y
$13:e783  4d e8 f8      eor $f8e8
$13:e786  41 c1         eor ($c1,x)
$13:e788  1b            tcs
$13:e789  d1 bf         cmp ($bf),y
$13:e78b  07 71         ora [$71]
$13:e78d  3b            tsc
$13:e78e  04 e4         tsb $e4
$13:e790  ec 4a 61      cpx $614a
$13:e793  9f bf 01 b2   sta $b201bf,x
$13:e797  0f f8 97 d7   ora $d797f8
$13:e79b  c1 80         cmp ($80,x)
$13:e79d  39 40 7a      and $7a40,y
$13:e7a0  d8            cld
$13:e7a1  a2 91         ldx #$91
$13:e7a3  40            rti
$13:e7a4  7d 1b c8      adc $c81b,x
$13:e7a7  3f ca c0 56   and $56c0ca,x
$13:e7ab  00 8e         brk #$8e
$13:e7ad  8f 81 73 eb   sta $eb7381
$13:e7b1  fe 65 8b      inc $8b65,x
$13:e7b4  92 24         sta ($24)
$13:e7b6  c5 05         cmp $05
$13:e7b8  2a            rol a
$13:e7b9  34 02         bit $02,x
$13:e7bb  b8            clv
$13:e7bc  92 d1         sta ($d1)
$13:e7be  1a            inc a
$13:e7bf  0c 62 4c      tsb $4c62
$13:e7c2  09 29 c0      ora #$c029
$13:e7c5  e6 48         inc $48
$13:e7c7  91 9f         sta ($9f),y
$13:e7c9  89 25 96      bit #$9625
$13:e7cc  02 1c         cop #$1c
$13:e7ce  6d 90 8f      adc $8f90
$13:e7d1  d8            cld
$13:e7d2  92 de         sta ($de)
$13:e7d4  e9 fb bc      sbc #$bcfb
$13:e7d7  20 32 e0      jsr $e032
$13:e7da  28            plp
$13:e7db  4c 8e 64      jmp $648e
$13:e7de  76 19         ror $19,x
$13:e7e0  d5 7d         cmp $7d,x
$13:e7e2  fe 0c 62      inc $620c,x
$13:e7e5  79 8a 10      adc $108a,y
$13:e7e8  e5 d1         sbc $d1
$13:e7ea  48            pha
$13:e7eb  a5 8c         lda $8c
$13:e7ed  5f 4d af 17   eor $17af4d,x
$13:e7f1  78            sei
$13:e7f2  ff ca 1e 61   sbc $611eca,x
$13:e7f6  f3 97         sbc ($97,s),y
$13:e7f8  a0 fd         ldy #$fd
$13:e7fa  29 ea 5f      and #$5fea
$13:e7fd  5b            tcd
$13:e7fe  7b            tdc
$13:e7ff  1f db 1e de   ora $de1edb,x
$13:e803  38            sec
$13:e804  5b            tcd
$13:e805  bc ea 5d      ldy $5dea,x
$13:e808  7b            tdc
$13:e809  93 dc         sta ($dc,s),y
$13:e80b  6e 7d 76      ror $767d
$13:e80e  f0 4c         beq $e85c
$13:e810  9d e1 30      sta $30e1,x
$13:e813  98            tya
$13:e814  cc 6a 8f      cpy $8f6a
$13:e817  67 9d         adc [$9d]
$13:e819  3b            tsc
$13:e81a  c2 71         rep #$71
$13:e81c  01 80         ora ($80,x)
$13:e81e  d4 7a         pei ($7a)
$13:e820  e1 60         sbc ($60,x)
$13:e822  7d 80 58      adc $5880,x
$13:e825  1b            tcs
$13:e826  cd 41 96      cmp $9641
$13:e829  cb            wai
$13:e82a  28            plp
$13:e82b  50 b9         bvc $e7e6
$13:e82d  cb            wai
$13:e82e  bc 1c ef      ldy $ef1c,x
$13:e831  38            sec
$13:e832  07 8c         ora [$8c]
$13:e834  c1 fe         cmp ($fe,x)
$13:e836  0d e6 98      ora $98e6
$13:e839  cb            wai
$13:e83a  e5 c0         sbc $c0
$13:e83c  30 97         bmi $e7d5
$13:e83e  83 c1         sta $c1,s
$13:e840  bd e5 df      lda $dfe5,x
$13:e843  37 79         and [$79],y
$13:e845  ff d2 1e a1   sbc $a11ed2,x
$13:e849  f5 97         sbc $97,x
$13:e84b  b0 fd         bcs $e84a
$13:e84d  a9 ee 5f      lda #$5fee
$13:e850  7b            tdc
$13:e851  78            sei
$13:e852  1f c3 1e 29   ora $291ec3,x
$13:e856  f1 d7         sbc ($d7),y
$13:e858  92 fc         sta ($fc)
$13:e85a  b9 e6 df      lda $dfe6,y
$13:e85d  3f 7a 3f d4   and $d43f7a,x
$13:e861  1e b1 f6      asl $f6b1,x
$13:e864  17 b4         ora [$b4],y
$13:e866  fd c9 ef      sbc $efc9,x
$13:e869  5f 03 78 5f   eor $5f7803,x
$13:e86d  c5 1e         cmp $1e
$13:e86f  39 f2 57      and $57f2,y
$13:e872  96 fc         stx $fc,y
$13:e874  d9 e7 df      cmp $dfe7,y
$13:e877  47 7a         eor [$7a]
$13:e879  7f d6 1e c1   adc $c11ed6,x
$13:e87d  f6 97         inc $97,x
$13:e87f  b8            clv
$13:e880  fd e9 e0      sbc $e0e9,x
$13:e883  5f 0b 78 9f   eor $9f780b,x
$13:e887  c7 1e         cmp [$1e]
$13:e889  49 f2 d7      eor #$d7f2
$13:e88c  9a            txs
$13:e88d  fc f9 e8      jsr ($e8f9,x)
$13:e890  df 4f 7a bf   cmp $bf7a4f,x
$13:e894  d8            cld
$13:e895  1e d1 f7      asl $f7d1,x
$13:e898  17 bc         ora [$bc],y
$13:e89a  fc 09 e1      jsr ($e109,x)
$13:e89d  5f 13 78 df   eor $df7813,x
$13:e8a1  c8            iny
$13:e8a2  73 21         adc ($21,s),y
$13:e8a4  8c 46 e3      sty $e346
$13:e8a7  11 88         ora ($88),y
$13:e8a9  c9 0e 21      cmp #$210e
$13:e8ac  70 29         bvs $e8d7
$13:e8ae  19 90 24      ora $2490,y
$13:e8b1  24 38         bit $38
$13:e8b3  90 75         bcc $e92a
$13:e8b5  ce a4 43      dec $43a4
$13:e8b8  8a            txa
$13:e8b9  97 5e         sta [$5e],y
$13:e8bb  e5 72         sbc $72
$13:e8bd  b9 9e 66      lda $669e,y
$13:e8c0  14 85         trb $85
$13:e8c2  fe ba 20      inc $20ba,x
$13:e8c5  0f 33 0b 9c   ora $9c0b33
$13:e8c9  c2 d6         rep #$d6
$13:e8cb  c2 43         rep #$43
$13:e8cd  f6 57         inc $57,x
$13:e8cf  b6 fd         ldx $fd,y
$13:e8d1  d9 ef df      cmp $dfef,y
$13:e8d4  07 78         ora [$78]
$13:e8d6  7f c6 1e 41   adc $411ec6,x
$13:e8da  f2 97         sbc ($97)
$13:e8dc  98            tya
$13:e8dd  fc e9 e8      jsr ($e8e9,x)
$13:e8e0  5f 4b 7a 9f   eor $9f7a4b,x
$13:e8e4  d7 1e         cmp [$1e],y
$13:e8e6  c9 f6 79      cmp #$79f6
$13:e8e9  c6 63         dec $63
$13:e8eb  31 87         and ($87),y
$13:e8ed  10 46         bpl $e935
$13:e8ef  a3 0e         lda $0e,s
$13:e8f1  11 70         ora ($70),y
$13:e8f3  8c 6e 30      sty $306e
$13:e8f6  cf f7 ff 84   cmp $84fff7
$13:e8fa  3c 43 e3      bit $e343,x
$13:e8fd  2f 21 f9 53   and $53f921
$13:e901  cc be 76      cpy $76be
$13:e904  f4 3f a6      pea $a63f
$13:e907  3d 53 eb      and $eb53,x
$13:e90a  af 65 fb 38   lda $38fb65
$13:e90e  23 4c         and $4c,s
$13:e910  ef 78 7b e9   sbc $e97b78
$13:e914  e3 1d         sbc $1d,s
$13:e916  ee cf 65      inc $65cf
$13:e919  f5 51         sbc $51,x
$13:e91b  0e c6 fe      asl $fec6
$13:e91e  9a            txs
$13:e91f  ff be c7 1e   sbc $1ec7be,x
$13:e923  aa            tax
$13:e924  fa            plx
$13:e925  a8            tay
$13:e926  57 62         eor [$62],y
$13:e928  e1 5b         sbc ($5b,x)
$13:e92a  17 ef         ora [$ef],y
$13:e92c  21 f5         and ($f5,x)
$13:e92e  55 40         eor $40,x
$13:e930  60            rts
$13:e931  76 9f         ror $9f,x
$13:e933  55 53         eor $53,x
$13:e935  f3 78         sbc ($78,s),y
$13:e937  7c 4f aa      jmp ($aa4f,x)
$13:e93a  a9 7b bd      lda #$bd7b
$13:e93d  3e a7 d5      rol $d5a7,x
$13:e940  42 e1         wdm #$e1
$13:e942  74 0a         stz $0a,x
$13:e944  0b            phd
$13:e945  ea            nop
$13:e946  a7 28         lda [$28]
$13:e948  b0 9c         bcs $e8e6
$13:e94a  be aa 27      ldx $27aa,y
$13:e94d  18            clc
$13:e94e  88            dey
$13:e94f  c2 df         rep #$df
$13:e951  5e bf f6      lsr $f6bf,x
$13:e954  87 b8         sta [$b8]
$13:e956  7d dd 5d      adc $5ddd,x
$13:e959  97 f9         sta [$f9],y
$13:e95b  77 3b         adc [$3b],y
$13:e95d  45 d0         eor $d0
$13:e95f  d8            cld
$13:e960  77 3b         adc [$3b],y
$13:e962  3d e7 70      and $70e7,x
$13:e965  d3 b7         cmp ($b7,s),y
$13:e967  81 00         sta ($00,x)
$13:e969  df 81 03 79   cmp $790381,x
$13:e96d  bd d8 ef      lda $efd8,x
$13:e970  b7 fd         lda [$fd],y
$13:e972  87 70         sta [$70]
$13:e974  d5 ab         cmp $ab,x
$13:e976  35 9e         and $9e,x
$13:e978  27 1f         and [$1f]
$13:e97a  7d bd e2      adc $e2bd,x
$13:e97d  71 6e         adc ($6e),y
$13:e97f  bc 6e 3f      ldy $3f6e,x
$13:e982  61 dc         adc ($dc,x)
$13:e984  35 ea         and $ea,x
$13:e986  c5 63         cmp $63
$13:e988  91 5e         sta ($5e),y
$13:e98a  e3 71         sbc $71,s
$13:e98c  79 3f 3f      adc $3f3f,y
$13:e98f  9f 23 94 2b   sta $2b9423,x
$13:e993  2e 47 23      rol $2347
$13:e996  e5 f2         sbc $f2
$13:e998  1f 87 22 bd   ora $bd2287,x
$13:e99c  f4 fa dc      pea $dcfa
$13:e99f  07 47         ora [$47]
$13:e9a1  c9 02 00      cmp #$0002
$13:e9a4  20 88 62      jsr $6288
$13:e9a7  39 4e 57      and $574e,y
$13:e9aa  93 c5         sta ($c5,s),y
$13:e9ac  b1 f2         lda ($f2),y
$13:e9ae  6e bb 04      ror $04bb
$13:e9b1  31 ad         and ($ad),y
$13:e9b3  8e 8f b7      stx $b78f
$13:e9b6  ec f5 72      cpx $72f5
$13:e9b9  fd 9b be      sbc $be9b,x
$13:e9bc  f0 18         beq $e9d6
$13:e9be  09 e0 0a      ora #$0ae0
$13:e9c1  3f 1d 09 38   and $38091d,x
$13:e9c5  30 af         bmi $e976
$13:e9c7  37 87         and [$87],y
$13:e9c9  c4 5f         cpy $5f
$13:e9cb  0f 0f 99 dc   ora $dc990f
$13:e9cf  28            plp
$13:e9d0  10 47         bpl $ea19
$13:e9d2  8c 2b dd      sty $dd2b
$13:e9d5  e9 f5 1b      sbc #$1bf5
$13:e9d8  c3 d3         cmp $d3,s
$13:e9da  ee 77 0c      inc $0c77
$13:e9dd  12 17         ora ($17)
$13:e9df  12 8c         ora ($8c)
$13:e9e1  44 51 e5      mvp $e5,$51
$13:e9e4  e3 40         sbc $40,s
$13:e9e6  84 49         sty $49
$13:e9e8  dc b1 98      jml [$98b1]
$13:e9eb  84 42         sty $42
$13:e9ed  27 76         and [$76]
$13:e9ef  99 c4 dd      sta $ddc4,y
$13:e9f2  cf 19 8c 46   cmp $468c19
$13:e9f6  23 6b         and $6b,s
$13:e9f8  70 8d         bvs $e987
$13:e9fa  ae a1 68      ldx $68a1
$13:e9fd  0c 6c 62      tsb $626c
$13:ea00  54 85 66      mvn $66,$85
$13:ea03  31 08         and ($08),y
$13:ea05  d4 41         pei ($41)
$13:ea07  66 2d         ror $2d
$13:ea09  32 88         and ($88)
$13:ea0b  40            rti
$13:ea0c  21 47         and ($47,x)
$13:ea0e  50 3b         bvc $ea4b
$13:ea10  01 48         ora ($48,x)
$13:ea12  80 48         bra $ea5c
$13:ea14  ff 0e c6 f3   sbc $f3c60e,x
$13:ea18  79 bd d8      adc $d8bd,y
$13:ea1b  ef b7 fd 8b   sbc $8bfdb7
$13:ea1f  dc 70 28      jml [$2870]
$13:ea22  40            rti
$13:ea23  f1 b7         sbc ($b7),y
$13:ea25  db            stp
$13:ea26  f8            sed
$13:ea27  b7 5e         lda [$5e],y
$13:ea29  37 1f         and [$1f],y
$13:ea2b  bc 19 01      ldy $0119,x
$13:ea2e  21 03         and ($03,x)
$13:ea30  c7 07         cmp [$07]
$13:ea32  83 af         sta $af,s
$13:ea34  56 cb         lsr $cb,x
$13:ea36  21 e6         and ($e6,x)
$13:ea38  0c 87 27      tsb $2787
$13:ea3b  e7 f3         sbc [$f3]
$13:ea3d  e5 03         sbc $03
$13:ea3f  c7 e6         cmp [$e6]
$13:ea41  67 03         adc [$03]
$13:ea43  38            sec
$13:ea44  57 bc         eor [$bc],y
$13:ea46  f5 da         sbc $da,x
$13:ea48  2d 7b e9      and $e97b
$13:ea4b  f5 1f         sbc $1f,x
$13:ea4d  09 d4 be      ora #$bed4
$13:ea50  5f 22 19 10   eor $101922,x
$13:ea54  c4 7c         cpy $7c
$13:ea56  41 30         eor ($30,x)
$13:ea58  af 61 30 9c   lda $9c3061
$13:ea5c  90 40         bcc $ea9e
$13:ea5e  6c 36 05      jmp ($0536)
$13:ea61  30 ee         bmi $ea51
$13:ea63  03 c7         ora $c7,s
$13:ea65  89 c5 2d      bit #$2dc5
$13:ea68  97 63         sta [$63],y
$13:ea6a  c3 b8         cmp $b8,s
$13:ea6c  dc f8 b9      jml [$b9f8]
$13:ea6f  5e 40 78      lsr $7840,x
$13:ea72  df 0b 47 d8   cmp $d8470b,x
$13:ea76  f6 a2         inc $a2,x
$13:ea78  47 b7         eor [$b7]
$13:ea7a  ed 07 8d      sbc $8d07
$13:ea7d  c0 86 03      cpy #$0386
$13:ea80  c1 ec         cmp ($ec,x)
$13:ea82  40            rti
$13:ea83  53 21         eor ($21,s),y
$13:ea85  3a            dec a
$13:ea86  f1 ce         sbc ($ce),y
$13:ea88  09 e2 6c      ora #$6ce2
$13:ea8b  13 50         ora ($50,s),y
$13:ea8d  01 c1         ora ($c1,x)
$13:ea8f  32 50         and ($50)
$13:ea91  b4 f0         ldy $f0,x
$13:ea93  f3 8f         sbc ($8f,s),y
$13:ea95  82 7a 0f      brl $fa12
$13:ea98  0f 3d 52 c8   ora $c8523d
$13:ea9c  b2 44         lda ($44)
$13:ea9e  92 a5         sta ($a5)
$13:eaa0  61 73         adc ($73,x)
$13:eaa2  09 97 8e      ora #$8e97
$13:eaa5  81 41         sta ($41,x)
$13:eaa7  6a            ror a
$13:eaa8  a5 0a         lda $0a
$13:eaaa  17 40         ora [$40],y
$13:eaac  67 84         adc [$84]
$13:eaae  e1 58         sbc ($58,x)
$13:eab0  0e 39 8d      asl $8d39
$13:eab3  44 22 05      mvp $05,$22
$13:eab6  11 04         ora ($04),y
$13:eab8  87 64         sta [$64]
$13:eaba  1a            inc a
$13:eabb  1d e8 03      ora $03e8,x
$13:eabe  ec 7b d1      cpx $d17b
$13:eac1  88            dey
$13:eac2  c1 84         cmp ($84,x)
$13:eac4  77 80         adc [$80],y
$13:eac6  50 0e         bvc $ead6
$13:eac8  87 61         sta [$61]
$13:eaca  f6 5d         inc $5d,x
$13:eacc  88            dey
$13:eacd  58            cli
$13:eace  c0 2b 3c      cpy #$3c2b
$13:ead1  5a            phy
$13:ead2  78            sei
$13:ead3  54 05 a0      mvn $a0,$05
$13:ead6  0a            asl a
$13:ead7  48            pha
$13:ead8  22 00 2b 17   jsl $172b00
$13:eadc  1e 45 c2      asl $c245,x
$13:eadf  bd 71 3b      lda $3b71,x
$13:eae2  80 2d         bra $eb11
$13:eae4  2a            rol a
$13:eae5  5d 8f b1      eor $b18f,x
$13:eae8  54 3e c9      mvn $c9,$3e
$13:eaeb  50 fb         bvc $eae8
$13:eaed  0a            asl a
$13:eaee  92 63         sta ($63)
$13:eaf0  54 19 05      mvn $05,$19
$13:eaf3  e2 f3         sep #$f3
$13:eaf5  f6 fa         inc $fa,x
$13:eaf7  7d 47 2b      adc $2b47,x
$13:eafa  01 94         ora ($94,x)
$13:eafc  76 3d         ror $3d,x
$13:eafe  7c 8a f1      jmp ($f18a,x)
$13:eb01  4c 85 46      jmp $4685
$13:eb04  a8            tay
$13:eb05  02 88         cop #$88
$13:eb07  72 0c         adc ($0c)
$13:eb09  66 29         ror $29
$13:eb0b  45 c0         eor $c0
$13:eb0d  4a            lsr a
$13:eb0e  3b            tsc
$13:eb0f  cf 30 51 a3   cmp $a35130
$13:eb13  ec 99 01      cpx $0199
$13:eb16  28            plp
$13:eb17  f3 78         sbc ($78,s),y
$13:eb19  69 8b         adc #$8b
$13:eb1b  33 f3         and ($f3,s),y
$13:eb1d  3e c9 92      rol $92c9,x
$13:eb20  15 1f         ora $1f,x
$13:eb22  77 a7         adc [$a7],y
$13:eb24  d5 db         cmp $db,x
$13:eb26  f6 72         inc $72,x
$13:eb28  f9 7e 9f      sbc $9f7e,y
$13:eb2b  72 2d         adc ($2d)
$13:eb2d  19 25 e3      ora $e325,y
$13:eb30  9c 27 c9      stz $c927
$13:eb33  37 0c         and [$0c],y
$13:eb35  d0 53         bne $eb8a
$13:eb37  fa            plx
$13:eb38  7c ac 13      jmp ($13ac,x)
$13:eb3b  e9 f5         sbc #$f5
$13:eb3d  05 9e         ora $9e
$13:eb3f  54 28 5d      mvn $5d,$28
$13:eb42  01 9e         ora ($9e,x)
$13:eb44  7d 7a 35      adc $357a,x
$13:eb47  1a            inc a
$13:eb48  16 df         asl $df,x
$13:eb4a  a9 fb         lda #$fb
$13:eb4c  b0 0b         bcs $eb59
$13:eb4e  64 f2         stz $f2
$13:eb50  f0 1f         beq $eb71
$13:eb52  84 2a         sty $2a
$13:eb54  cb            wai
$13:eb55  66 c4         ror $c4
$13:eb57  08            php
$13:eb58  c2 cf         rep #$cf
$13:eb5a  82 c1 59      brl $451e
$13:eb5d  ac f0 b9      ldy $b9f0
$13:eb60  cc 12 04      cpy $0412
$13:eb63  1f 1c 05 fc   ora $fc051c,x
$13:eb67  66 38         ror $38
$13:eb69  3c 1e 3f      bit $3f1e,x
$13:eb6c  03 32         ora $32,s
$13:eb6e  6f 84 e4 5e   adc $5ee484
$13:eb72  58            cli
$13:eb73  ff b5 f3 0e   sbc $0ef3b5,x
$13:eb77  46 01         lsr $01
$13:eb79  c8            iny
$13:eb7a  4b            phk
$13:eb7b  a6 24         ldx $24
$13:eb7d  c0 17         cpy #$17
$13:eb7f  94 f3         sty $f3,x
$13:eb81  ed 5a b9      sbc $b95a
$13:eb84  43 21         eor $21,s
$13:eb86  97 3c         sta [$3c],y
$13:eb88  0a            asl a
$13:eb89  dd 0a 25      cmp $250a,x
$13:eb8c  72 b9         adc ($b9)
$13:eb8e  fd 3e a5      sbc $a53e,x
$13:eb91  9a            txs
$13:eb92  ad dc 8e      lda $8edc
$13:eb95  c0 59         cpy #$59
$13:eb97  7b            tdc
$13:eb98  f5 f4         sbc $f4,x
$13:eb9a  4e 08 20      lsr $2008
$13:eb9d  ba            tsx
$13:eb9e  20 80 b6      jsr $b680
$13:eba1  b8            clv
$13:eba2  6c 2e 2b      jmp ($2b2e)
$13:eba5  14 92         trb $92
$13:eba7  0b            phd
$13:eba8  9a            txs
$13:eba9  48            pha
$13:ebaa  11 6b         ora ($6b),y
$13:ebac  8e c6 e3      stx $e3c6
$13:ebaf  31 8a         and ($8a),y
$13:ebb1  20 ed a8      jsr $a8ed
$13:ebb4  81 16         sta ($16,x)
$13:ebb6  96 16         stx $16,y
$13:ebb8  39 ce bc      and $bcce,y
$13:ebbb  73 85         adc ($85,s),y
$13:ebbd  91 cf         sta ($cf),y
$13:ebbf  a7 cb         lda [$cb]
$13:ebc1  15 85         ora $85,x
$13:ebc3  ae 52 8d      ldx $8d52
$13:ebc6  46 eb         lsr $eb
$13:ebc8  d0 5a         bne $ec24
$13:ebca  45 42         eor $42
$13:ebcc  85 d0         sta $d0
$13:ebce  1a            inc a
$13:ebcf  47 3f         eor [$3f]
$13:ebd1  6f 80 f0 1c   adc $1cf080
$13:ebd5  52 1d         eor ($1d)
$13:ebd7  28            plp
$13:ebd8  cc 42 21      cpy $2142
$13:ebdb  1b            tcs
$13:ebdc  bb            tyx
$13:ebdd  4c e3 61      jmp $61e3
$13:ebe0  d2 7d         cmp ($7d)
$13:ebe2  1c 66 31      trb $3166
$13:ebe5  18            clc
$13:ebe6  7b            tdc
$13:ebe7  5c 85 e9 32   jml $32e985
$13:ebeb  38            sec
$13:ebec  5c c2 64 3c   jml $3c64c2
$13:ebf0  08            php
$13:ebf1  17 5d         ora [$5d],y
$13:ebf3  ee 1d 77      inc $771d
$13:ebf6  d1 88         cmp ($88),y
$13:ebf8  02 5f         cop #$5f
$13:ebfa  2e 98 88      rol $8898
$13:ebfd  86 73         stx $73
$13:ebff  03 77         ora $77,s
$13:ec01  1c 02 63      trb $6302
$13:ec04  2f 59 88 c8   and $c88859
$13:ec08  e6 0f         inc $0f
$13:ec0a  a3 80         lda $80,s
$13:ec0c  cb            wai
$13:ec0d  1a            inc a
$13:ec0e  4a            lsr a
$13:ec0f  d8            cld
$13:ec10  07 d1         ora [$d1]
$13:ec12  cb            wai
$13:ec13  0a            asl a
$13:ec14  c2 e8         rep #$e8
$13:ec16  98            tya
$13:ec17  04 e9         tsb $e9
$13:ec19  c4 e4         cpy $e4
$13:ec1b  94 37         sty $37,x
$13:ec1d  8c c2 62      sty $62c2
$13:ec20  83 39         sta $39,s
$13:ec22  79 a9 a7      adc $a7a9,y
$13:ec25  04 d1         tsb $d1
$13:ec27  ef 62 31 18   sbc $183162
$13:ec2b  24 b8         bit $b8
$13:ec2d  77 91         adc [$91],y
$13:ec2f  ad 28 c0      lda $c028
$13:ec32  52 2f         eor ($2f)
$13:ec34  f8            sed
$13:ec35  3b            tsc
$13:ec36  fe 3f 02      inc $023f,x
$13:ec39  9d 8a 86      sta $868a,x
$13:ec3c  1d 70 0a      ora $0a70,x
$13:ec3f  b6 21         ldx $21,y
$13:ec41  04 a2         tsb $a2
$13:ec43  f5 74         sbc $74,x
$13:ec45  86 43         stx $43
$13:ec47  2e 9f 05      rol $059f
$13:ec4a  60            rts
$13:ec4b  95 88         sta $88,x
$13:ec4d  a2 15         ldx #$15
$13:ec4f  3b            tsc
$13:ec50  d5 cf         cmp $cf,x
$13:ec52  e9 f5 b9      sbc #$b9f5
$13:ec55  fc 55 82      jsr ($8255,x)
$13:ec58  a0 06         ldy #$06
$13:ec5a  f9 70 fb      sbc $fb70,y
$13:ec5d  f7 27         sbc [$27],y
$13:ec5f  38            sec
$13:ec60  dc d5 82      jml [$82d5]
$13:ec63  2e 09 c0      rol $c009
$13:ec66  c8            iny
$13:ec67  06 64         asl $64
$13:ec69  f6 51         inc $51,x
$13:ec6b  70 50         bvs $ecbd
$13:ec6d  25 a4         and $a4
$13:ec6f  20 3f c0      jsr $c03f
$13:ec72  a8            tay
$13:ec73  d7 ca         cmp [$ca],y
$13:ec75  19 20 7d      ora $7d20,y
$13:ec78  d9 ac f8      cmp $f8ac,y
$13:ec7b  20 7d 29      jsr $297d
$13:ec7e  41 50         eor ($50,x)
$13:ec80  02 fc         cop #$fc
$13:ec82  be 5f 05      ldx $055f,y
$13:ec85  f7 7a         sbc [$7a],y
$13:ec87  ac 56 05      ldy $0556
$13:ec8a  ee d2 37      inc $37d2
$13:ec8d  38            sec
$13:ec8e  0b            phd
$13:ec8f  d6 72         dec $72,x
$13:ec91  e1 61         sbc ($61,x)
$13:ec93  7b            tdc
$13:ec94  81 c6         sta ($c6,x)
$13:ec96  a9 7e be      lda #$be7e
$13:ec99  dd 05 e8      cmp $e805,x
$13:ec9c  cf 19 84 bc   cmp $bc8419
$13:eca0  74 18         stz $18,x
$13:eca2  6c 2d cc      jmp ($cc2d)
$13:eca5  5e 8f 51      lsr $518f,x
$13:eca8  61 0d         adc ($0d,x)
$13:ecaa  47 1d         eor [$1d]
$13:ecac  8d ed 8b      sta $8bed
$13:ecaf  d2 58         cmp ($58)
$13:ecb1  d0 35         bne $ece8
$13:ecb3  c8            iny
$13:ecb4  f8            sed
$13:ecb5  d1 ee         cmp ($ee),y
$13:ecb7  f8            sed
$13:ecb8  61 81         adc ($81,x)
$13:ecba  a1 8c         lda ($8c,x)
$13:ecbc  15 2d         ora $2d,x
$13:ecbe  f8            sed
$13:ecbf  63 3b         adc $3b,s
$13:ecc1  28            plp
$13:ecc2  a7 f4         lda [$f4]
$13:ecc4  7a            ply
$13:ecc5  3b            tsc
$13:ecc6  65 1f         adc $1f
$13:ecc8  eb            xba
$13:ecc9  d7 a7         cmp [$a7],y
$13:eccb  d3 c5         cmp ($c5,s),y
$13:eccd  22 0f 8b 14   jsl $148b0f
$13:ecd1  52 29         eor ($29)
$13:ecd3  82 b3 62      brl $4f89
$13:ecd6  2c e0 f6      bit $f6e0
$13:ecd9  20 16 0e      jsr $0e16
$13:ecdc  ff 7f c0 f4   sbc $f4c07f,x
$13:ece0  7a            ply
$13:ece1  50 1e         bvc $ed01
$13:ece3  88            dey
$13:ece4  d8            cld
$13:ece5  7a            ply
$13:ece6  05 02         ora $02
$13:ece8  c3 8f         cmp $8f,s
$13:ecea  c3 03         cmp $03,s
$13:ecec  d5 eb         cmp $eb,x
$13:ecee  54 7a a4      mvn $a4,$7a
$13:ecf1  61 e9         adc ($e9,x)
$13:ecf3  a0 0a         ldy #$0a
$13:ecf5  e7 5b         sbc [$5b]
$13:ecf7  b9 de bf      lda $bfde,y
$13:ecfa  32 c3         and ($c3)
$13:ecfc  48            pha
$13:ecfd  4b            phk
$13:ecfe  55 40         eor $40,x
$13:ed00  4a            lsr a
$13:ed01  33 e8         and ($e8,s),y
$13:ed03  14 42         trb $42
$13:ed05  82 95 1a      brl $079d
$13:ed08  04 b4         tsb $b4
$13:ed0a  b2 f8         lda ($f8)
$13:ed0c  9a            txs
$13:ed0d  4a            lsr a
$13:ed0e  18            clc
$13:ed0f  a5 e5         lda $e5
$13:ed11  94 bf         sty $bf,x
$13:ed13  60            rts
$13:ed14  b0 57         bcs $ed6d
$13:ed16  d7 f9         cmp [$f9],y
$13:ed18  26 40         rol $40
$13:ed1a  b2 98         lda ($98)
$13:ed1c  6c 56 2b      jmp ($2b56)
$13:ed1f  0a            asl a
$13:ed20  36 01         rol $01,x
$13:ed22  a0 0d         ldy #$0d
$13:ed24  44 94 78      mvp $78,$94
$13:ed27  ec 66 33      cpx $3366
$13:ed2a  1a            inc a
$13:ed2b  46 0e         lsr $0e
$13:ed2d  b1 60         lda ($60),y
$13:ed2f  14 62         trb $62
$13:ed31  d0 29         bne $ed5c
$13:ed33  c0 3e         cpy #$3e
$13:ed35  55 7e         eor $7e,x
$13:ed37  ea            nop
$13:ed38  14 38         trb $38
$13:ed3a  2c 71 bd      bit $bd71
$13:ed3d  d4 7a         pei ($7a)
$13:ed3f  3c fc e8      bit $e8fc,x
$13:ed42  2f 28 a7 d3   and $d3a728
$13:ed46  fa            plx
$13:ed47  e8            inx
$13:ed48  32 01         and ($01)
$13:ed4a  3c 52 29      bit $2952,x
$13:ed4d  63 58         adc $58,s
$13:ed4f  4a            lsr a
$13:ed50  e4 c2         cpx $c2
$13:ed52  5e 23 f8      lsr $f823,x
$13:ed55  0c b2 83      tsb $83b2
$13:ed58  41 96         eor ($96,x)
$13:ed5a  8a            txa
$13:ed5b  66 59         ror $59
$13:ed5d  42 3a         wdm #$3a
$13:ed5f  85 00         sta $00
$13:ed61  90 82         bcc $ece5
$13:ed63  f3 9d         sbc ($9d,s),y
$13:ed65  3e c8 b0      rol $b0c8,x
$13:ed68  85 f6         sta $f6
$13:ed6a  9c 95 96      stz $9695
$13:ed6d  00 7f         brk #$7f
$13:ed6f  03 90         ora $90,s
$13:ed71  4b            phk
$13:ed72  a6 33         ldx $33
$13:ed74  27 e0         and [$e0]
$13:ed76  cc 19 e0      cpy $e019
$13:ed79  45 03         eor $03
$13:ed7b  f9 a0 85      sbc $85a0,y
$13:ed7e  0c 08 a1      tsb $a108
$13:ed81  39 8a 3d      and $3d8a,y
$13:ed84  50 62         bvc $ede8
$13:ed86  cf 24 20 27   cmp $272024
$13:ed8a  d9 64 ca      cmp $ca64,y
$13:ed8d  ff 67 fb 7b   sbc $7bfb67,x
$13:ed91  0c a4 56      tsb $56a4
$13:ed94  08            php
$13:ed95  57 7a         eor [$7a],y
$13:ed97  fd 7d ba      sbc $ba7d,x
$13:ed9a  3d c3 bc      and $bcc3,x
$13:ed9d  7f 04 30 cc   adc $cc3004,x
$13:eda1  26 33         rol $33
$13:eda3  1a            inc a
$13:eda4  a7 9b         lda [$9b]
$13:eda6  0d 85 b9      ora $b985
$13:eda9  81 c3         sta ($c3,x)
$13:edab  cc 7f 03      cpy $037f
$13:edae  a0 ce         ldy #$ce
$13:edb0  0e 41 51      asl $5141
$13:edb3  f7 63         sbc [$63],y
$13:edb5  b1 bd         lda ($bd),y
$13:edb7  b0 b8         bcs $ed71
$13:edb9  7b            tdc
$13:edba  81 a7         sta ($a7,x)
$13:edbc  40            rti
$13:edbd  23 00         and $00,s
$13:edbf  8c 68 5e      sty $5e68
$13:edc2  33 b8         and ($b8,s),y
$13:edc4  83 4c         sta $4c,s
$13:edc6  60            rts
$13:edc7  d3 04         cmp ($04,s),y
$13:edc9  b8            clv
$13:edca  03 4c         ora $4c,s
$13:edcc  06 04         asl $04
$13:edce  24 97         bit $97
$13:edd0  a7 48         lda [$48]
$13:edd2  e8            inx
$13:edd3  26 a1         rol $a1
$13:edd5  6f 40 3d 1b   adc $1b3d40
$13:edd9  d1 2c         cmp ($2c),y
$13:eddb  30 6d         bmi $ee4a
$13:eddd  09 30 6d      ora #$6d30
$13:ede0  e8            inx
$13:ede1  9c a0 49      stz $49a0
$13:ede4  9d 24 90      sta $9024,x
$13:ede7  65 e3         adc $e3
$13:ede9  27 95         and [$95]
$13:edeb  fc ce f6      jsr ($f6ce,x)
$13:edee  ff bc 3c 03   sbc $033cbc,x
$13:edf2  e1 2f         sbc ($2f,x)
$13:edf4  11 f8         ora ($f8),y
$13:edf6  d3 c8         cmp ($c8,s),y
$13:edf8  be 56 f3      ldx $f356,y
$13:edfb  3f 9e 3d 13   and $133d9e,x
$13:edff  e9 af 55      sbc #$55af
$13:ee02  fa            plx
$13:ee03  f3 d9         sbc ($d9,s),y
$13:ee05  be de f7      ldx $f7de,y
$13:ee08  7f 80 3c 23   adc $233c80,x
$13:ee0c  e2 2f         sep #$2f
$13:ee0e  19 f9 13      ora $13f9,y
$13:ee11  ca            dex
$13:ee12  be 66 f3      ldx $f366,y
$13:ee15  bf a2 3d 33   lda $333da2,x
$13:ee19  ea            nop
$13:ee1a  af 5d fb 33   lda $33fb5d
$13:ee1e  db            stp
$13:ee1f  be ee f7      ldx $f7ee,y
$13:ee22  ff 84 3c 43   sbc $433c84,x
$13:ee26  e3 2f         sbc $2f,s
$13:ee28  21 f9         and ($f9,x)
$13:ee2a  53 cc         eor ($cc,s),y
$13:ee2c  be 76 f4      ldx $f476,y
$13:ee2f  3f a6 3d 53   and $533da6,x
$13:ee33  eb            xba
$13:ee34  af 65 fb 73   lda $73fb65
$13:ee38  dd be fe      cmp $febe,x
$13:ee3b  f0 7f         beq $eebc
$13:ee3d  88            dey
$13:ee3e  3c 63 e4      bit $e463,x
$13:ee41  2f 90 d9 b1   and $b1d990
$13:ee45  05 60         ora $60
$13:ee47  b3 90         lda ($90,s),y
$13:ee49  e2 41         sep #$41
$13:ee4b  80 bf         bra $ee0c
$13:ee4d  df f1 f8 12   cmp $12f8f1,x
$13:ee51  1c 42 b0      trb $b042
$13:ee54  18            clc
$13:ee55  7c 39 a2      jmp ($a239,x)
$13:ee58  aa            tax
$13:ee59  57 eb         eor [$eb],y
$13:ee5b  ed cd 0a      sbc $0acd
$13:ee5e  06 a9         asl $a9
$13:ee60  c3 61         cmp $61,s
$13:ee62  6e 69 50      ror $5069
$13:ee65  35 4e         and $4e,x
$13:ee67  3b            tsc
$13:ee68  1b            tcs
$13:ee69  db            stp
$13:ee6a  52 81         eor ($81)
$13:ee6c  0e 21 73      asl $7321
$13:ee6f  98            tya
$13:ee70  5f 8e 17 0b   eor $0b178e,x
$13:ee74  21 fb         and ($fb,x)
$13:ee76  2b            pld
$13:ee77  db            stp
$13:ee78  7e ec f7      ror $f7ec,x
$13:ee7b  ef 83 bc 3f   sbc $3fbc83
$13:ee7f  e3 0f         sbc $0f,s
$13:ee81  20 f9 4b      jsr $4bf9
$13:ee84  cc 7e 74      cpy $747e
$13:ee87  f4 2f a5      pea $a52f
$13:ee8a  bd 4f eb      lda $eb4f,x
$13:ee8d  8f 64 fb 3c   sta $3cfb64
$13:ee91  e3 39         sbc $39,s
$13:ee93  ac a3 8a      ldy $8aa3
$13:ee96  99 fe ff      sta $fffe,y
$13:ee99  f0 87         beq $ee22
$13:ee9b  88            dey
$13:ee9c  7c 65 e4      jmp ($e465,x)
$13:ee9f  3f 2a 79 97   and $97792a,x
$13:eea3  ce de 87      dec $87de
$13:eea6  f4 c7 aa      pea $aac7
$13:eea9  7d 75 ec      adc $ec75,x
$13:eeac  bf 67 06 6d   lda $6d0667,x
$13:eeb0  9d ef 0f      sta $0fef,x
$13:eeb3  7d 3c 63      adc $633c,x
$13:eeb6  21 91         and ($91,x)
$13:eeb8  c8            iny
$13:eeb9  be aa 21      ldx $21aa,y
$13:eebc  98            tya
$13:eebd  cc e6 9f      cpy $9fe6
$13:eec0  f7 98         sbc [$98],y
$13:eec2  d0 68         bne $ef2c
$13:eec4  1f 55 0a 16   ora $160a55,x
$13:eec8  06 84         asl $84
$13:eeca  5f 9a 1d 33   eor $331d9a,x
$13:eece  e8            inx
$13:eecf  be ef a5      ldx $a5ef,y
$13:eed2  aa            tax
$13:eed3  69 34         adc #$34
$13:eed5  ba            tsx
$13:eed6  52 7d         eor ($7d)
$13:eed8  54 f6 db      mvn $db,$f6
$13:eedb  3d a1 3e      and $3ea1,x
$13:eede  aa            tax
$13:eedf  5e ef 4f      lsr $4fef,x
$13:eee2  a8            tay
$13:eee3  9f 50 b8 5d   sta $5db850,x
$13:eee7  02 82         cop #$82
$13:eee9  fa            plx
$13:eeea  a9 ca         lda #$ca
$13:eeec  2c 27 2f      bit $2f27
$13:eeef  aa            tax
$13:eef0  89 c6         bit #$c6
$13:eef2  22 30 b7 d7   jsl $d7b730
$13:eef6  af fd a1 ed   lda $eda1fd
$13:eefa  b8            clv
$13:eefb  a1 b6         lda ($b6,x)
$13:eefd  fe 01 91      inc $9101,x
$13:ef00  7f ce 55 dc   adc $dc55ce,x
$13:ef04  39 40 79      and $7940,y
$13:ef07  e5 b6         sbc $b6
$13:ef09  e0 f0         cpx #$f0
$13:ef0b  cd e7 33      cmp $33e7
$13:ef0e  ae e1 c9      ldx $c9e1
$13:ef11  64 f3         stz $f3
$13:ef13  c1 f1         cmp ($f1,x)
$13:ef15  d7 f9         cmp [$f9],y
$13:ef17  b3 d9         lda ($d9,s),y
$13:ef19  ed 1e 8c      sbc $8c1e
$13:ef1c  36 5a         rol $5a,x
$13:ef1e  9d 56 ac      sta $ac56,x
$13:ef21  5e 3a 6d      lsr $6d3a,x
$13:ef24  36 a0         rol $a0,x
$13:ef26  50 ba         bvc $eee2
$13:ef28  cd 6e b8      cmp $b86e
$13:ef2b  7e 23 60      ror $6023,x
$13:ef2e  d0 0a         bne $ef3a
$13:ef30  17 4a         ora [$4a],y
$13:ef32  4f 32 30 68   eor $683032
$13:ef36  74 da         stz $da,x
$13:ef38  21 51         and ($51,x)
$13:ef3a  cf 36 bb 4d   cmp $4dbb36
$13:ef3e  96 d6         stx $d6,y
$13:ef40  53 98         eor ($98,s),y
$13:ef42  2b            pld
$13:ef43  80 d4         bra $ef19
$13:ef45  34 41         bit $41,x
$13:ef47  b2 ed         lda ($ed)
$13:ef49  fb            xce
$13:ef4a  3d 5c bf      and $bf5c,x
$13:ef4d  66 ef         ror $ef
$13:ef4f  48            pha
$13:ef50  4f 3d 3b b8   eor $b83b3d
$13:ef54  7c 74 24      jmp ($2474,x)
$13:ef57  e0 c2         cpx #$c2
$13:ef59  b6 db         ldx $db,y
$13:ef5b  3d a1 7c      and $7ca1,x
$13:ef5e  36 7b         rol $7b,x
$13:ef60  67 70         adc [$70]
$13:ef62  a0 41         ldy #$41
$13:ef64  1e 30 af      asl $af30,x
$13:ef67  77 a7         adc [$a7],y
$13:ef69  d4 6f         pei ($6f)
$13:ef6b  0f 4f b9 dc   ora $dcb94f
$13:ef6f  30 48         bmi $efb9
$13:ef71  5c 4a 31 11   jml $11314a
$13:ef75  47 97         eor [$97]
$13:ef77  8d 02 11      sta $1102
$13:ef7a  27 72         and [$72]
$13:ef7c  c6 62         dec $62
$13:ef7e  11 08         ora ($08),y
$13:ef80  9c ee af      stz $afee
$13:ef83  13 77         ora ($77,s),y
$13:ef85  3c 66 31      bit $3166,x
$13:ef88  18            clc
$13:ef89  8d ad c2      sta $c2ad
$13:ef8c  36 ba         rol $ba,x
$13:ef8e  85 a0         sta $a0
$13:ef90  31 b1         and ($b1),y
$13:ef92  89 3e         bit #$3e
$13:ef94  09 0e         ora #$0e
$13:ef96  83 33         sta $33,s
$13:ef98  9a            txs
$13:ef99  0b            phd
$13:ef9a  08            php
$13:ef9b  3d 03 21      and $2103,x
$13:ef9e  e8            inx
$13:ef9f  85 68         sta $68
$13:efa1  00 20         brk #$20
$13:efa3  26 10         rol $10
$13:efa5  2a            rol a
$13:efa6  0e 41 fe      asl $fe41
$13:efa9  62 70 33      per $231c
$13:efac  88            dey
$13:efad  58            cli
$13:efae  8b            phb
$13:efaf  20 0f 5d      jsr $5d0f
$13:efb2  18            clc
$13:efb3  59 83 ec      eor $ec83,y
$13:efb6  26 61         rol $61
$13:efb8  7b            tdc
$13:efb9  89 94         bit #$94
$13:efbb  7f 1b 3d c6   adc $c63d1b,x
$13:efbf  e7 66         sbc [$66]
$13:efc1  5c 07 f9 70   jml $70f907
$13:efc5  38            sec
$13:efc6  3c 1e 10      bit $101e,x
$13:efc9  34 3c         bit $3c,x
$13:efcb  39 7c bf      and $bf7c,y
$13:efce  8b            phb
$13:efcf  df e4 7f 89   cmp $897fe4,x
$13:efd3  8c 4c 85      sty $854c
$13:efd6  e1 2d         sbc ($2d,x)
$13:efd8  07 8a         ora [$8a]
$13:efda  78            sei
$13:efdb  6e 13 91      ror $9113
$13:efde  99 07 da      sta $da07,y
$13:efe1  89 1e         bit #$1e
$13:efe3  df b4 fe 1c   cmp $1cfeb4,x
$13:efe7  c2 e0         rep #$e0
$13:efe9  96 87         stx $87,y
$13:efeb  9b            txy
$13:efec  01 4c         ora ($4c,x)
$13:efee  84 eb         sty $eb
$13:eff0  c7 38         cmp [$38]
$13:eff2  3f 87 38 d8   and $d83887,x
$13:eff6  26 a0         rol $a0
$13:eff8  f0 f3         beq $efed
$13:effa  d3 25         cmp ($25,s),y
$13:effc  0b            phd
$13:effd  4f 19 f4 0b   eor $0bf419
$13:f001  40            rti
$13:f002  a7 84         lda [$84]
$13:f004  59 22 49      eor $4922,y
$13:f007  52 b0         eor ($b0)
$13:f009  b9 84 cb      lda $cb84,y
$13:f00c  c7 40         cmp [$40]
$13:f00e  a0 b5         ldy #$b5
$13:f010  52 85         eor ($85)
$13:f012  0b            phd
$13:f013  a0 33         ldy #$33
$13:f015  c2 70         rep #$70
$13:f017  cc 07 1c      cpy $1c07
$13:f01a  e8            inx
$13:f01b  e2 11         sep #$11
$13:f01d  0c 86 45      tsb $4586
$13:f020  e6 99         inc $99
$13:f022  58            cli
$13:f023  03 ec         ora $ec,s
$13:f025  74 71         stz $71,x
$13:f027  88            dey
$13:f028  c6 63         dec $63
$13:f02a  33 9a         and ($9a,s),y
$13:f02c  ca            dex
$13:f02d  65 b6         adc $b6
$13:f02f  f9 bc e6      sbc $e6bc,y
$13:f032  75 f6         adc $f6,x
$13:f034  70 b8         bvs $efee
$13:f036  56 60         lsr $60,x
$13:f038  64 3a         stz $3a
$13:f03a  ff 31 9c 01   sbc $019c31,x
$13:f03e  41 60         eor ($60,x)
$13:f040  83 41         sta $41,s
$13:f042  b4 70         ldy $70,x
$13:f044  40            rti
$13:f045  89 95 08      bit #$0895
$13:f048  34 7a         bit $7a,x
$13:f04a  28            plp
$13:f04b  5d 48 45      eor $4548,x
$13:f04e  7a            ply
$13:f04f  69 8d 50      adc #$508d
$13:f052  45 69         eor $69
$13:f054  80 94         bra $efea
$13:f056  04 83         tsb $83
$13:f058  43 a6         eor $a6,s
$13:f05a  2a            rol a
$13:f05b  86 88         stx $88
$13:f05d  32 8a         and ($8a)
$13:f05f  80 28         bra $f089
$13:f061  81 50         sta ($50,x)
$13:f063  8a            txa
$13:f064  c2 5a         rep #$5a
$13:f066  6d 26 94      adc $9426
$13:f069  e6 9a         inc $9a
$13:f06b  70 d9         bvs $f046
$13:f06d  32 02         and ($02)
$13:f06f  51 b6         eor ($b6),y
$13:f071  d9 d3 27      cmp $27d3,y
$13:f074  9b            txy
$13:f075  55 a8         eor $a8,x
$13:f077  6c f6 c7      jmp ($c7f6)
$13:f07a  b2 64         lda ($64)
$13:f07c  85 47         sta $47
$13:f07e  dd e9 f5      cmp $f5e9,x
$13:f081  76 fd         ror $fd,x
$13:f083  9c be 5f      stz $5fbe
$13:f086  a7 dc         lda [$dc]
$13:f088  8b            phb
$13:f089  46 49         lsr $49
$13:f08b  78            sei
$13:f08c  e7 09         sbc [$09]
$13:f08e  f2 4d         sbc ($4d)
$13:f090  c3 34         cmp $34,s
$13:f092  14 fe         trb $fe
$13:f094  a1 19         lda ($19,x)
$13:f096  5c f6 7d 3e   jml $3e7df6
$13:f09a  a0 b3 ca      ldy #$cab3
$13:f09d  85 0b         sta $0b
$13:f09f  a0 33 ca      ldy #$ca33
$13:f0a2  a7 45         lda [$45]
$13:f0a4  a3 51         lda $51,s
$13:f0a6  a1 6d         lda ($6d,x)
$13:f0a8  fa            plx
$13:f0a9  9f bb 00 16   sta $1600bb,x
$13:f0ad  4e f7 9e      lsr $9ef7
$13:f0b0  3e 09 fb      rol $fb09,x
$13:f0b3  34 47         bit $47,x
$13:f0b5  c0 0b 42      cpy #$420b
$13:f0b8  ca            dex
$13:f0b9  fd 88 10      sbc $1088,x
$13:f0bc  34 ad         bit $ad,x
$13:f0be  82 17 85      brl $75d8
$13:f0c1  ce 60 90      dec $9060
$13:f0c4  28            plp
$13:f0c5  37 e8         and [$e8],y
$13:f0c7  43 13         eor $13,s
$13:f0c9  26 f8         rol $f8
$13:f0cb  4e 45 e1      lsr $e145
$13:f0ce  6d 20 bc      adc $bc20
$13:f0d1  ba            tsx
$13:f0d2  62 4c 01      per $f221
$13:f0d5  78            sei
$13:f0d6  5b            tcd
$13:f0d7  8a            txa
$13:f0d8  2e 9f 22      rol $229f
$13:f0db  7f 98 3e de   adc $de3e98,x
$13:f0df  81 73         sta ($73,x)
$13:f0e1  5a            phy
$13:f0e2  59 70 d8      eor $d870,y
$13:f0e5  5c 56 29 24   jml $242956
$13:f0e9  13 c4         ora ($c4,s),y
$13:f0eb  90 1a         bcc $f107
$13:f0ed  cc 20 18      cpy $1820
$13:f0f0  ec 6e 33      cpx $336e
$13:f0f3  18            clc
$13:f0f4  a2 0e da      ldx #$da0e
$13:f0f7  88            dey
$13:f0f8  13 69         ora ($69,s),y
$13:f0fa  61 63         adc ($63,x)
$13:f0fc  94 06         sty $06,x
$13:f0fe  75 e3         adc $e3,x
$13:f100  9c 2c 8e      stz $8e2c
$13:f103  7d 6a 9e      adc $9e6a,x
$13:f106  ac 92 16      ldy $1692
$13:f109  b9 4a 35      lda $354a,y
$13:f10c  a2 8b 41      ldx #$418b
$13:f10f  69 15 0a      adc #$0a15
$13:f112  17 40         ora [$40],y
$13:f114  69 1c fd      adc #$fd1c
$13:f117  be 10 b7      ldx $b710,y
$13:f11a  15 06         ora $06,x
$13:f11c  0a            asl a
$13:f11d  33 10         and ($10,s),y
$13:f11f  88            dey
$13:f120  46 e7         lsr $e7
$13:f122  75 78         adc $78,x
$13:f124  d8            cld
$13:f125  60            rts
$13:f126  bd 0e f3      lda $f30e,x
$13:f129  8c 46 1e      sty $1e46
$13:f12c  d7 21         cmp [$21],y
$13:f12e  7a            ply
$13:f12f  04 f5         tsb $f5
$13:f131  ee 13 d7      inc $d713
$13:f134  d1 c8         cmp ($c8),y
$13:f136  e1 73         sbc ($73,x)
$13:f138  09 93 88      ora #$8893
$13:f13b  21 54         and ($54,x)
$13:f13d  57 b8         eor [$b8],y
$13:f13f  51 5f         eor ($5f),y
$13:f141  46 20         lsr $20
$13:f143  09 7c ba      ora #$ba7c
$13:f146  62 22 18      per $096b
$13:f149  5c 0d dc 7e   jml $7edc0d
$13:f14d  89 8c bd      bit #$bd8c
$13:f150  38            sec
$13:f151  23 23         and $23,s
$13:f153  98            tya
$13:f154  3e 8e 03      rol $038e,x
$13:f157  2c 69 2b      bit $2b69
$13:f15a  60            rts
$13:f15b  1f 47 2c 2b   ora $2b2c47,x
$13:f15f  0b            phd
$13:f160  a2 7d 0c      ldx #$0c7d
$13:f163  70 71         bvs $f1d6
$13:f165  31 25         and ($25),y
$13:f167  0d e3 30      ora $30e3
$13:f16a  98            tya
$13:f16b  a0 ce 5f      ldy #$5fce
$13:f16e  00 45         brk #$45
$13:f170  09 f8 a7      ora #$a7f8
$13:f173  08            php
$13:f174  a0 80 e6      ldy #$e680
$13:f177  73 59         adc ($59,s),y
$13:f179  44 c0 66      mvp $66,$c0
$13:f17c  f3 88         sbc ($88,s),y
$13:f17e  d6 94         dec $94,x
$13:f180  68            pla
$13:f181  34 19         bit $19,x
$13:f183  9c fe 73      stz $73fe
$13:f186  47 a3         eor [$a3]
$13:f188  4e ce 83      lsr $83ce
$13:f18b  3c ab 05      bit $05ab,x
$13:f18e  62 c0 60      per $5251
$13:f191  32 8c         and ($8c)
$13:f193  c2 dd         rep #$dd
$13:f195  8a            txa
$13:f196  c4 51         cpy $51
$13:f198  0a            asl a
$13:f199  9b            txy
$13:f19a  18            clc
$13:f19b  38            sec
$13:f19c  1c 1e 12      trb $121e
$13:f19f  ac 8c 29      ldy $298c
$13:f1a2  c3 bb         cmp $bb,s
$13:f1a4  b6 01         ldx $01,y
$13:f1a6  d0 0d         bne $f1b5
$13:f1a8  a0 46 83      ldy #$8346
$13:f1ab  78            sei
$13:f1ac  27 03         and [$03]
$13:f1ae  20 19 99      jsr $9919
$13:f1b1  85 1b         sta $1b
$13:f1b3  c1 40         cmp ($40,x)
$13:f1b5  96 b0         stx $b0,y
$13:f1b7  c0 ff 1e      cpy #$1eff
$13:f1ba  84 51         sty $51
$13:f1bc  40            rti
$13:f1bd  17 e8         ora [$e8],y
$13:f1bf  19 20 7d      ora $7d20,y
$13:f1c2  db            stp
$13:f1c3  05 80         ora $80
$13:f1c5  0f a9 40 b3   ora $b340a9
$13:f1c9  ad a4 c0      lda $c0a4
$13:f1cc  17 dd         ora [$dd],y
$13:f1ce  b8            clv
$13:f1cf  b8            clv
$13:f1d0  00 f7         brk #$f7
$13:f1d2  69 11 72      adc #$7211
$13:f1d5  27 2e         and [$2e]
$13:f1d7  13 a5         ora ($a5,s),y
$13:f1d9  9b            txy
$13:f1da  5d ec 20      eor $20ec,x
$13:f1dd  80 aa         bra $f189
$13:f1df  5b            tcd
$13:f1e0  d1 80         cmp ($80),y
$13:f1e2  0f 46 78 cc   ora $cc7846
$13:f1e6  25 ec         and $ec
$13:f1e8  40            rti
$13:f1e9  c3 61         cmp $61,s
$13:f1eb  67 80         adc [$80]
$13:f1ed  f4 7a 8b      pea $8b7a
$13:f1f0  08            php
$13:f1f1  6a            ror a
$13:f1f2  38            sec
$13:f1f3  ec 6f 6c      cpx $6c6f
$13:f1f6  1e 92 c6      asl $c692,x
$13:f1f9  81 ae         sta ($ae,x)
$13:f1fb  47 c6         eor [$c6]
$13:f1fd  8f 77 c3 04   sta $04c377
$13:f201  0d 0c 60      ora $600c
$13:f204  a3 ee         lda $ee,s
$13:f206  b7 ce         lda [$ce],y
$13:f208  7a            ply
$13:f209  76 09         ror $09,x
$13:f20b  eb            xba
$13:f20c  7d 18 ce      adc $ce18,x
$13:f20f  c6 19         dec $19
$13:f211  04 f6         tsb $f6
$13:f213  8f 47 6c a3   sta $a36c47
$13:f217  65 2a         adc $2a
$13:f219  34 5a         bit $5a,x
$13:f21b  7d 3d 52      adc $523d,x
$13:f21e  00 f9         brk #$f9
$13:f220  b1 45         lda ($45),y
$13:f222  22 96 c0 f8   jsl $f8c096
$13:f226  83 da         sta $da,s
$13:f228  01 60         ora ($60,x)
$13:f22a  83 41         sta $41,s
$13:f22c  83 e5         sta $e5,s
$13:f22e  d1 e9         cmp ($e9),y
$13:f230  40            rti
$13:f231  7a            ply
$13:f232  23 61         and $61,s
$13:f234  e8            inx
$13:f235  0a            asl a
$13:f236  ca            dex
$13:f237  da            phx
$13:f238  3f 1e af 5a   and $5aaf1e,x
$13:f23c  a3 d5         lda $d5,s
$13:f23e  23 0f         and $0f,s
$13:f240  4c 56 46      jmp $4656
$13:f243  d0 36         bne $f27b
$13:f245  87 e6         sta [$e6]
$13:f247  58            cli
$13:f248  69 09 6a      adc #$6a09
$13:f24b  a8            tay
$13:f24c  09 4f 41      ora #$414f
$13:f24f  4a            lsr a
$13:f250  8d 02 5a      sta $5a02
$13:f253  59 7a 5d      eor $5d7a,y
$13:f256  25 0c         and $0c
$13:f258  52 f2         eor ($f2)
$13:f25a  ca            dex
$13:f25b  5b            tcd
$13:f25c  cf e2 da 24   cmp $24dae2
$13:f260  c8            iny
$13:f261  16 53         asl $53,x
$13:f263  0d 8a c5      ora $c58a
$13:f266  61 46         adc ($46,x)
$13:f268  c1 d2         cmp ($d2,x)
$13:f26a  0d 00 d8      ora $d800
$13:f26d  0d 47 8e      ora $8e47
$13:f270  c6 63         dec $63
$13:f272  31 a4         and ($a4),y
$13:f274  60            rts
$13:f275  eb            xba
$13:f276  16 01         asl $01,x
$13:f278  46 22         lsr $22
$13:f27a  b2 9c         lda ($9c)
$13:f27c  25 81         and $81
$13:f27e  60            rts
$13:f27f  ea            nop
$13:f280  bf 16 0a 1c   lda $1c0a16,x
$13:f284  16 39         asl $39,x
$13:f286  dd 6f d4      cmp $d46f,x
$13:f289  f5 9a         sbc $9a,x
$13:f28b  14 7b         trb $7b
$13:f28d  4c f4 e8      jmp $e8f4
$13:f290  2f 28 a7 da   and $daa728
$13:f294  e8            inx
$13:f295  a8            tay
$13:f296  32 01         and ($01)
$13:f298  3c 52 29      bit $2952,x
$13:f29b  63 58         adc $58,s
$13:f29d  4a            lsr a
$13:f29e  58            cli
$13:f29f  19 a1 61      ora $61a1,y
$13:f2a2  80 8d         bra $f231
$13:f2a4  88            dey
$13:f2a5  46 9d         lsr $9d
$13:f2a7  00 f1         brk #$f1
$13:f2a9  16 40         asl $40,x
$13:f2ab  8c 43 43      sty $4343
$13:f2ae  e9 8b 92      sbc #$928b
$13:f2b1  03 2c         ora $2c,s
$13:f2b3  a0 d0 65      ldy #$65d0
$13:f2b6  ab            plb
$13:f2b7  01 21         ora ($21,x)
$13:f2b9  08            php
$13:f2ba  bc e5 94      ldy $94e5,x
$13:f2bd  23 a8         and $a8,s
$13:f2bf  50 09         bvc $f2ca
$13:f2c1  03 51         ora $51,s
$13:f2c3  ea            nop
$13:f2c4  74 45         stz $45,x
$13:f2c6  e7 3a         sbc [$3a]
$13:f2c8  7d 91 60      adc $6091,x
$13:f2cb  54 e2 5f      mvn $5f,$e2
$13:f2ce  69 c9 59      adc #$59c9
$13:f2d1  05 c9         ora $c9
$13:f2d3  2e 98 cc      rol $cc98
$13:f2d6  9f 83 30 67   sta $673083,x
$13:f2da  81 14         sta ($14,x)
$13:f2dc  0f e6 b0 09   ora $09b0e6
$13:f2e0  72 18         adc ($18)
$13:f2e2  11 43         ora ($43),y
$13:f2e4  01 32         ora ($32,x)
$13:f2e6  02 3d         cop #$3d
$13:f2e8  52 a1         eor ($a1)
$13:f2ea  31 67         and ($67),y
$13:f2ec  92 10         sta ($10)
$13:f2ee  0f e4 5d 01   ora $015de4
$13:f2f2  1c 1f c8      trb $c81f
$13:f2f5  68            pla
$13:f2f6  e3 41         sbc $41,s
$13:f2f8  3f 8c 01 a5   and $a5018c,x
$13:f2fc  4b            phk
$13:f2fd  f0 9e         beq $f29d
$13:f2ff  f7 5c         sbc [$5c],y
$13:f301  41 3d         eor ($3d,x)
$13:f303  a0 b8 49      ldy #$49b8
$13:f306  d0 46         bne $f34e
$13:f308  52 33         eor ($33)
$13:f30a  84 2b         sty $2b
$13:f30c  81 c1         sta ($c1,x)
$13:f30e  7b            tdc
$13:f30f  97 0a         sta [$0a],y
$13:f311  01 e8         ora ($e8,x)
$13:f313  43 0c         eor $0c,s
$13:f315  c2 63         rep #$63
$13:f317  31 aa         and ($aa),y
$13:f319  79 b0 d8      adc $d8b0,y
$13:f31c  59 e0 1c      eor $1ce0,y
$13:f31f  3c cf d0      bit $d0cf,x
$13:f322  3a            dec a
$13:f323  0c e0 b4      tsb $b4e0
$13:f326  3e ec 76      rol $76ec,x
$13:f329  37 b6         and [$b6],y
$13:f32b  17 0f         ora [$0f],y
$13:f32d  70 34         bvs $f363
$13:f32f  e8            inx
$13:f330  04 60         tsb $60
$13:f332  11 8d         ora ($8d),y
$13:f334  0b            phd
$13:f335  c6 77         dec $77
$13:f337  10 69         bpl $f3a2
$13:f339  8c 1a 60      sty $601a
$13:f33c  97 00         sta [$00],y
$13:f33e  69 80 c0      adc #$c080
$13:f341  84 92         sty $92
$13:f343  f3 a0         sbc ($a0,s),y
$13:f345  3f 43 a5 0b   and $0ba543,x
$13:f349  90 74         bcc $f3bf
$13:f34b  7a            ply
$13:f34c  3d 06 93      and $9306,x
$13:f34f  fa            plx
$13:f350  3a            dec a
$13:f351  cf 40 66 87   cmp $876640
$13:f355  4c ab 12      jmp $12ab
$13:f358  c0 80 a4      cpy #$a480
$13:f35b  80 ab         bra $f308
$13:f35d  14 24         trb $24
$13:f35f  c0 9c ea      cpy #$ea9c
$13:f362  72 81         adc ($81)
$13:f364  00 a0         brk #$a0
$13:f366  19 24 92      ora $9224,y
$13:f369  01 31         ora ($31,x)
$13:f36b  3a            dec a
$13:f36c  49 48 15      eor #$1548
$13:f36f  e2 74         sep #$74
$13:f371  93 10         sta ($10,s),y
$13:f373  2f c7 ac 75   and $75acc7
$13:f377  83 ab         sta $ab,s
$13:f379  96 17         stx $17,y
$13:f37b  ba            tsx
$13:f37c  df 39 ec 2e   cmp $2eec39,x
$13:f380  73 3d         adc ($3d,s),y
$13:f382  6f a7 95 de   adc $de95a7
$13:f386  72 a3         adc ($a3)
$13:f388  00 4a         brk #$4a
$13:f38a  9d e9 ed      sta $ede9,x
$13:f38d  7f 9d 16 07   adc $07169d,x
$13:f391  0a            asl a
$13:f392  a2 bf         ldx #$bf
$13:f394  d1 9f         cmp ($9f),y
$13:f396  a1 df         lda ($df,x)
$13:f398  17 78         ora [$78],y
$13:f39a  ff ca 1e 61   sbc $611eca,x
$13:f39e  f3 97         sbc ($97,s),y
$13:f3a0  a0 fd         ldy #$fd
$13:f3a2  29 ea         and #$ea
$13:f3a4  5f 5b 7b 1f   eor $1f7b5b,x
$13:f3a8  db            stp
$13:f3a9  1e de 3f      asl $3fde,x
$13:f3ac  2b            pld
$13:f3ad  be a5 5f      ldx $5fa5,y
$13:f3b0  df ef b5 ff   cmp $ffb5ef,x
$13:f3b4  54 5a e5      mvn $e5,$5a
$13:f3b7  71 bd         adc ($bd),y
$13:f3b9  e1 ff         sbc ($ff,x)
$13:f3bb  12 9f         ora ($9f)
$13:f3bd  dc 4f e3      jml [$e34f]
$13:f3c0  8f 24 f9 6b   sta $6bf924
$13:f3c4  cf 5e 8b f4   cmp $f48b5e
$13:f3c8  e7 ab         sbc [$ab]
$13:f3ca  7d 7d ec      adc $ec7d,x
$13:f3cd  ff 6f 67 f7   sbc $f7676f,x
$13:f3d1  fb            xce
$13:f3d2  2a            rol a
$13:f3d3  f2 bc         sbc ($bc)
$13:f3d5  82 55 20      brl $142d
$13:f3d8  78            sei
$13:f3d9  93 e0         sta ($e0,s),y
$13:f3db  ab            plb
$13:f3dc  95 ca         sta $ca,x
$13:f3de  2f b4 04 14   and $1404b4
$13:f3e2  58            cli
$13:f3e3  50 04         bvc $f3e9
$13:f3e5  81 04         sta ($04,x)
$13:f3e7  de f3 87      dec $87f3,x
$13:f3ea  88            dey
$13:f3eb  7c 65 e4      jmp ($e465,x)
$13:f3ee  3f 2a 79 97   and $97792a,x
$13:f3f2  ce dc 95      dec $95dc
$13:f3f5  f5 37         sbc $37,x
$13:f3f7  ad fd 91      lda $91fd
$13:f3fa  ed 9f 6f      sbc $6f9f
$13:f3fd  17 95         ora [$95],y
$13:f3ff  de 72 a8      dec $a872,x
$13:f402  5c 82 54 ef   jml $ef5482
$13:f406  4f 6b fc e8   eor $e8fc6b
$13:f40a  b0 38         bcs $f444
$13:f40c  55 15         eor $15,x
$13:f40e  fe 8d ef      inc $ef8d,x
$13:f411  3b            tsc
$13:f412  78            sei
$13:f413  87 c6         sta [$c6]
$13:f415  ff 00 90 db   sbc $db9000,x
$13:f419  0a            asl a
$13:f41a  a4 2f         ldy $2f
$13:f41c  88            dey
$13:f41d  55 b4         eor $b4,x
$13:f41f  ca            dex
$13:f420  45 a9         eor $a9
$13:f422  b7 1d         lda [$1d],y
$13:f424  48            pha
$13:f425  1f 15 2b 7a   ora $7a2b15,x
$13:f429  14 81         trb $81
$13:f42b  f1 0a         sbc ($0a),y
$13:f42d  c3 61         cmp $61,s
$13:f42f  67 89         adc [$89]
$13:f431  50 45         bvc $f478
$13:f433  4e 3b 1b      lsr $1b3b
$13:f436  db            stp
$13:f437  52 80         eor ($80)
$13:f439  3e 21 73      rol $7321,x
$13:f43c  98            tya
$13:f43d  5f 8e 17 0b   eor $0b178e,x
$13:f441  07 fb         ora [$fb]
$13:f443  2b            pld
$13:f444  db            stp
$13:f445  7e ec 00      ror $00ec,x
$13:f448  05 04         ora $04
$13:f44a  00 14         brk #$14
$13:f44c  6f 7c 83 4e   adc $4e837c
$13:f450  f0 cd         beq $f41f
$13:f452  2e 5f 7c      rol $7c5f
$13:f455  12 1d         ora ($1d)
$13:f457  e8            inx
$13:f458  49 a4         eor #$a4
$13:f45a  16 0d         asl $0d,x
$13:f45c  6f 34 44 17   adc $174434
$13:f460  1c 18 89      trb $8918
$13:f463  ac 02 00      ldy $0002
$13:f466  c6 63         dec $63
$13:f468  b1 a3         lda ($a3),y
$13:f46a  38            sec
$13:f46b  07 b6         ora [$b6]
$13:f46d  9b            txy
$13:f46e  1b            tcs
$13:f46f  a5 0d         lda $0d
$13:f471  2e bf a3      rol $a3bf
$13:f474  d2 29         cmp ($29)
$13:f476  06 13         asl $13
$13:f478  a7 89         lda [$89]
$13:f47a  ea            nop
$13:f47b  15 40         ora $40,x
$13:f47d  a4 22         ldy $22
$13:f47f  f0 c2         beq $f443
$13:f481  0b            phd
$13:f482  c0 bf         cpy #$bf
$13:f484  21 f0         and ($f0,x)
$13:f486  c2 71         rep #$71
$13:f488  b0 c7         bcs $f451
$13:f48a  20 38 bc      jsr $bc38
$13:f48d  82 c3 e3      brl $d853
$13:f490  8a            txa
$13:f491  0b            phd
$13:f492  c1 01         cmp ($01,x)
$13:f494  12 09         ora ($09)
$13:f496  84 c6         sty $c6
$13:f498  64 f0         stz $f0
$13:f49a  04 84         tsb $84
$13:f49c  3c 1a 43      bit $431a,x
$13:f49f  22 92 49 53   jsl $534992
$13:f4a3  b5 28         lda $28,x
$13:f4a5  95 4a         sta $4a,x
$13:f4a7  e5 8a         sbc $8a
$13:f4a9  a8            tay
$13:f4aa  93 41         sta ($41,s),y
$13:f4ac  60            rts
$13:f4ad  30 1a         bmi $f4c9
$13:f4af  cc 12 4e      cpy $4e12
$13:f4b2  ae 9a a5      ldx $a59a
$13:f4b5  56 02         lsr $02,x
$13:f4b7  b9 69 0c      lda $0c69,y
$13:f4ba  a6 54         ldx $54
$13:f4bc  c7 0a         cmp [$0a]
$13:f4be  b5 5d         lda $5d,x
$13:f4c0  8e 0c a7      stx $a70c
$13:f4c3  79 fa 76      adc $76fa,y
$13:f4c6  09 47 a6      ora #$a647
$13:f4c9  c0 92 40      cpy #$4092
$13:f4cc  88            dey
$13:f4cd  24 22         bit $22
$13:f4cf  b8            clv
$13:f4d0  e0 f9 a2      cpx #$a2f9
$13:f4d3  10 b8         bpl $f48d
$13:f4d5  eb            xba
$13:f4d6  44 24 20      mvp $20,$24
$13:f4d9  3c 76 34      bit $3476,x
$13:f4dc  5e 38 bd      lsr $bd38,x
$13:f4df  6e 30 5e      ror $5e30
$13:f4e2  63 01         adc $01,s
$13:f4e4  df 60 46 39   cmp $394660,x
$13:f4e8  d2 d6         cmp ($d6)
$13:f4ea  e2 86         sep #$86
$13:f4ec  43 81         eor $81,s
$13:f4ee  1b            tcs
$13:f4ef  0d 9a ce      ora $ce9a
$13:f4f2  2f 1f ed 80   and $80ed1f
$13:f4f6  a0 63 52      ldy #$5263
$13:f4f9  b7 5b         lda [$5b],y
$13:f4fb  c5 e5         cmp $e5
$13:f4fd  86 d6         stx $d6
$13:f4ff  e0 48 00      cpx #$0048
$13:f502  34 9b         bit $9b,x
$13:f504  0e ff 07      asl $07ff
$13:f507  83 c5         sta $c5,s
$13:f509  62 c6 b1      per $a6d2
$13:f50c  62 28 20      per $1537
$13:f50f  6c 92 a6      jmp ($a692)
$13:f512  5f 2f ea 10   eor $10ea2f,x
$13:f516  3a            dec a
$13:f517  1d 1e 97      ora $971e,x
$13:f51a  43 08         eor $08,s
$13:f51c  a7 05         lda [$05]
$13:f51e  38            sec
$13:f51f  17 d6         ora [$d6],y
$13:f521  c0 b6 1c      cpy #$1cb6
$13:f524  22 d8 8f e0   jsl $e08fd8
$13:f528  b1 3e         lda ($3e),y
$13:f52a  36 19         rol $19,x
$13:f52c  8c 18 46      sty $4618
$13:f52f  31 23         and ($23),y
$13:f531  d3 5b         cmp ($5b,s),y
$13:f533  14 e6         trb $e6
$13:f535  66 f3         ror $f3
$13:f537  7c f6 c0      jmp ($c0f6,x)
$13:f53a  73 ac         adc ($ac,s),y
$13:f53c  25 f4         and $f4
$13:f53e  c0 cc b9      cpy #$b9cc
$13:f541  19 67 41      ora $4167,y
$13:f544  72 6c         adc ($6c)
$13:f546  40            rti
$13:f547  06 99         asl $99
$13:f549  cd 26 b0      cmp $b026
$13:f54c  08            php
$13:f54d  05 f9         ora $f9
$13:f54f  f4 0e f3      pea $f30e
$13:f552  d3 bd         cmp ($bd,s),y
$13:f554  46 6d         lsr $6d
$13:f556  37 7d         and [$7d],y
$13:f558  1e f5 36      asl $36f5,x
$13:f55b  59 7d 30      eor $307d,y
$13:f55e  18            clc
$13:f55f  69 ef a3      adc #$a3ef
$13:f562  c1 f3         cmp ($f3,x)
$13:f564  44 01 71      mvp $71,$01
$13:f567  d6 81         dec $81,x
$13:f569  48            pha
$13:f56a  32 88         and ($88)
$13:f56c  72 c7         adc ($c7)
$13:f56e  89 3c 6b      bit #$6b3c
$13:f571  b8            clv
$13:f572  14 d9         trb $d9
$13:f574  26 50         rol $50
$13:f576  7e 78 3e      ror $3e78,x
$13:f579  29 94 8c      and #$8c94
$13:f57c  86 87         stx $87
$13:f57e  0c 09 08      tsb $0809
$13:f581  1d 01 e8      ora $e801,x
$13:f584  f4 9d d5      pea $d59d
$13:f587  26 38         rol $38
$13:f589  cc 7f 2f      cpy $2f7f
$13:f58c  96 76         stx $76,y
$13:f58e  7c 0a 00      jmp ($000a,x)
$13:f591  12 22         ora ($22)
$13:f593  55 8d         eor $8d,x
$13:f595  6f db 06 a1   adc $a106db
$13:f599  0d 69 96      ora $9669
$13:f59c  35 b8         and $b8,x
$13:f59e  c2 09         rep #$09
$13:f5a0  71 b0         adc ($b0),y
$13:f5a2  ac c0 5b      ldy $5bc0
$13:f5a5  22 bd 2c 16   jsl $162cbd
$13:f5a9  00 b9         brk #$b9
$13:f5ab  b2 85         lda ($85)
$13:f5ad  5e 92 50      lsr $5092,x
$13:f5b0  b2 32         lda ($32)
$13:f5b2  87 02         sta [$02]
$13:f5b4  b0 2d         bcs $f5e3
$13:f5b6  fc c9 ac      jsr ($acc9,x)
$13:f5b9  f7 d0         sbc [$d0],y
$13:f5bb  50 52         bvc $f60f
$13:f5bd  e9 94 d9      sbc #$d994
$13:f5c0  c3 d5         cmp $d5,s
$13:f5c2  dd e3 46      cmp $46e3,x
$13:f5c5  a3 bd         lda $bd,s
$13:f5c7  07 4e         ora [$4e]
$13:f5c9  f8            sed
$13:f5ca  8a            txa
$13:f5cb  70 0c         bvs $f5d9
$13:f5cd  74 b9         stz $b9,x
$13:f5cf  72 a9         adc ($a9)
$13:f5d1  6f 4b 80 0f   adc $0f804b
$13:f5d5  5b            tcd
$13:f5d6  46 b7         lsr $b7
$13:f5d8  aa            tax
$13:f5d9  28            plp
$13:f5da  0b            phd
$13:f5db  86 0c         stx $0c
$13:f5dd  50 00         bvc $f5df
$13:f5df  f4 b4 09      pea $09b4
$13:f5e2  81 60         sta ($60,x)
$13:f5e4  25 f2         and $f2
$13:f5e6  0f b8 e1 53   ora $53e1b8
$13:f5ea  0a            asl a
$13:f5eb  99 0c 65      sta $650c,y
$13:f5ee  9a            txs
$13:f5ef  ce 49 25      dec $2549
$13:f5f2  42 aa         wdm #$aa
$13:f5f4  43 19         eor $19,s
$13:f5f6  6e b7 e3      ror $e3b7
$13:f5f9  d2 81         cmp ($81)
$13:f5fb  bd 43 a7      lda $a743,x
$13:f5fe  ab            plb
$13:f5ff  2d 96 58      and $5896
$13:f602  1f 43 08 6f   ora $6f0843,x
$13:f606  5e 5f 2d      lsr $2d5f,x
$13:f609  60            rts
$13:f60a  76 8c         ror $8c,x
$13:f60c  21 3e         and ($3e,x)
$13:f60e  16 25         asl $25,x
$13:f610  86 c2         stx $c2
$13:f612  17 d8         ora [$d8],y
$13:f614  6e 49 b0      ror $b049
$13:f617  b4 f8         ldy $f8,x
$13:f619  f0 b8         beq $f5d3
$13:f61b  6e 32 bc      ror $bc32
$13:f61e  82 c9 97      brl $8dea
$13:f621  d3 52         cmp ($52,s),y
$13:f623  5b            tcd
$13:f624  42 32         wdm #$32
$13:f626  3d 7f 43      and $437f,x
$13:f629  a3 d2         lda $d2,s
$13:f62b  e8            inx
$13:f62c  6b            rtl
$13:f62d  de a0 bf      dec $bfa0,x
$13:f630  6c 23 14      jmp ($1423)
$13:f633  1a            inc a
$13:f634  a3 39         lda $39,s
$13:f636  9d 2f d0      sta $d02f,x
$13:f639  4a            lsr a
$13:f63a  18            clc
$13:f63b  4e 32 c0      lsr $c032
$13:f63e  13 a1         ora ($a1,s),y
$13:f640  43 95         eor $95,s
$13:f642  02 15         cop #$15
$13:f644  eb            xba
$13:f645  ef a2 d3 be   sbc $bed3a2
$13:f649  84 a8         sty $a8
$13:f64b  1b            tcs
$13:f64c  d5 c1         cmp $c1,x
$13:f64e  04 4d         tsb $4d
$13:f650  78            sei
$13:f651  0c d0 ea      tsb $ead0
$13:f654  dc 30 7d      jml [$7d30]
$13:f657  51 10         eor ($10),y
$13:f659  08            php
$13:f65a  13 5a         ora ($5a,s),y
$13:f65c  fa            plx
$13:f65d  12 4a         ora ($4a)
$13:f65f  12 4f         ora ($4f)
$13:f661  16 2b         asl $2b,x
$13:f663  4f e8 cb 45   eor $45cbe8
$13:f667  eb            xba
$13:f668  66 b3         ror $b3
$13:f66a  e2 f7         sep #$f7
$13:f66c  f3 d0         sbc ($d0,s),y
$13:f66e  68            pla
$13:f66f  e9 b1         sbc #$b1
$13:f671  3a            dec a
$13:f672  50 80         bvc $f5f4
$13:f674  e0 71         cpx #$71
$13:f676  56 eb         lsr $eb,x
$13:f678  78            sei
$13:f679  e8            inx
$13:f67a  29 4c         and #$4c
$13:f67c  d0 e8         bne $f666
$13:f67e  f4 f1 3d      pea $3df1
$13:f681  4e 96 13      lsr $1396
$13:f684  a1 ad         lda ($ad,x)
$13:f686  c5 0e         cmp $0e
$13:f688  15 8a         ora $8a,x
$13:f68a  18            clc
$13:f68b  96 a9         stx $a9,y
$13:f68d  1d 9f 8d      ora $8d9f,x
$13:f690  87 c4         sta [$c4]
$13:f692  ab            plb
$13:f693  c1 ce         cmp ($ce,x)
$13:f695  07 64         ora [$64]
$13:f697  2e 0c 5d      rol $5d0c
$13:f69a  00 36         brk #$36
$13:f69c  9f 1c 5f 5b   sta $5b5f1c,x
$13:f6a0  a7 18         lda [$18]
$13:f6a2  06 9c         asl $9c
$13:f6a4  d6 54         dec $54,x
$13:f6a6  a4 00         ldy $00
$13:f6a8  4e 29 14      lsr $1429
$13:f6ab  9d 2e 5f      sta $5f2e,x
$13:f6ae  6f f3 f9 ed   adc $edf9f3
$13:f6b2  43 65         eor $65,s
$13:f6b4  39 a9 e2      and $e2a9,y
$13:f6b7  67 65         adc [$65]
$13:f6b9  c0 b4         cpy #$b4
$13:f6bb  6b            rtl
$13:f6bc  f5 bf         sbc $bf,x
$13:f6be  4f a6 b7 5e   eor $5eb7a6
$13:f6c2  fa            plx
$13:f6c3  17 68         ora [$68],y
$13:f6c5  40            rti
$13:f6c6  a5 74         lda $74
$13:f6c8  09 df         ora #$df
$13:f6ca  5b            tcd
$13:f6cb  08            php
$13:f6cc  c7 2c         cmp [$2c]
$13:f6ce  23 e8         and $e8,s
$13:f6d0  60            rts
$13:f6d1  35 98         and $98,x
$13:f6d3  0d 52 ab      ora $ab52
$13:f6d6  01 87         ora ($87,x)
$13:f6d8  b5 9e         lda $9e,x
$13:f6da  40            rti
$13:f6db  ef 09 34 16   sbc $163409
$13:f6df  02 f4         cop #$f4
$13:f6e1  08            php
$13:f6e2  5b            tcd
$13:f6e3  d0 65         bne $f74a
$13:f6e5  72 c9         adc ($c9)
$13:f6e7  2b            pld
$13:f6e8  bc 5e 23      ldy $235e,x
$13:f6eb  58            cli
$13:f6ec  70 8f         bvs $f67d
$13:f6ee  f5 c2         sbc $c2,x
$13:f6f0  10 b8         bpl $f6aa
$13:f6f2  24 9d         bit $9d
$13:f6f4  fc 70 87      jsr ($8770,x)
$13:f6f7  00 55         brk #$55
$13:f6f9  aa            tax
$13:f6fa  ee 20 86      inc $8620
$13:f6fd  be 96 61      ldx $6196,y
$13:f700  2e 84 40      rol $4084
$13:f703  5c 60 16 07   jml $071660
$13:f707  18            clc
$13:f708  40            rti
$13:f709  61 20         adc ($20,x)
$13:f70b  d3 11         cmp ($11,s),y
$13:f70d  03 cc         ora $cc,s
$13:f70f  a1 4f         lda ($4f,x)
$13:f711  40            rti
$13:f712  82 4b e6      brl $dd60
$13:f715  4f e2 08 88   eor $8808e2
$13:f719  54 21 ae      mvn $ae,$21
$13:f71c  21 06         and ($06,x)
$13:f71e  20 c5 42      jsr $42c5
$13:f721  c0 2c         cpy #$2c
$13:f723  52 0a         eor ($0a)
$13:f725  40            rti
$13:f726  6b            rtl
$13:f727  15 98         ora $98,x
$13:f729  48            pha
$13:f72a  f4 64 72      pea $7264
$13:f72d  39 23 f4      and $f423,y
$13:f730  44 41 bc      mvp $bc,$41
$13:f733  81 c5         sta ($c5,x)
$13:f735  76 83         ror $83,x
$13:f737  d2 c0         cmp ($c0)
$13:f739  3e 82 5a      rol $5a82,x
$13:f73c  72 2d         adc ($2d)
$13:f73e  8e e7 75      stx $75e7
$13:f741  b2 1f         lda ($1f)
$13:f743  16 05         asl $05,x
$13:f745  c2 08         rep #$08
$13:f747  13 d8         ora ($d8,s),y
$13:f749  22 03 66 fe   jsl $fe6603
$13:f74d  2c 0b 88      bit $880b
$13:f750  50 21         bvc $f773
$13:f752  23 92         and $92,s
$13:f754  a5 d6         lda $d6
$13:f756  c1 81         cmp ($81,x)
$13:f758  0b            phd
$13:f759  05 64         ora $64
$13:f75b  2e 00 c0      rol $c000
$13:f75e  dc 22 03      jml [$0322]
$13:f761  76 9b         ror $9b,x
$13:f763  30 20         bmi $f785
$13:f765  55 9f         eor $9f,x
$13:f767  23 2d         and $2d,s
$13:f769  e0 70         cpx #$70
$13:f76b  78            sei
$13:f76c  5c 35 28 3b   jml $3b2835
$13:f770  c3 05         cmp $05,s
$13:f772  12 68         ora ($68)
$13:f774  0c 46 20      tsb $2046
$13:f777  d0 30         bne $f7a9
$13:f779  61 43         adc ($43,x)
$13:f77b  e3 11         sbc $11,s
$13:f77d  97 08         sta [$08],y
$13:f77f  46 9b         lsr $9b
$13:f781  e8            inx
$13:f782  0c 2b 06      tsb $062b
$13:f785  b7 15         lda [$15],y
$13:f787  8d c7 62      sta $62c7
$13:f78a  f5 b2         sbc $b2,x
$13:f78c  0e 46 59      asl $5946
$13:f78f  f0 5c         beq $f7ed
$13:f791  9b            txy
$13:f792  05 87         ora $87
$13:f794  7e f1 5e      ror $5ef1,x
$13:f797  5d ef f7      eor $f7ef,x
$13:f79a  cb            wai
$13:f79b  e5 bf         sbc $bf
$13:f79d  42 c4         wdm #$c4
$13:f79f  f0 6e         beq $f80f
$13:f7a1  50 60         bvc $f803
$13:f7a3  9f a0 ef 59   sta $59efa0,x
$13:f7a7  2e e0 30      rol $30e0
$13:f7aa  7b            tdc
$13:f7ab  bb            tyx
$13:f7ac  0b            phd
$13:f7ad  bd 30 23      lda $2330,x
$13:f7b0  52 fb         eor ($fb)
$13:f7b2  8d 49 fe      sta $fe49
$13:f7b5  98            tya
$13:f7b6  32 29         and ($29)
$13:f7b8  7d c8 a4      adc $a4c8,x
$13:f7bb  0f 1b 35 9d   ora $9d351b
$13:f7bf  e4 05         cpx $05
$13:f7c1  47 77         eor [$77]
$13:f7c3  8d ba de      sta $deba
$13:f7c6  54 c2 a4      mvn $a4,$c2
$13:f7c9  95 43         sta $43,x
$13:f7cb  4b            phk
$13:f7cc  97 df         sta [$df],y
$13:f7ce  20 47 7a      jsr $7a47
$13:f7d1  81 7b         sta ($7b,x)
$13:f7d3  16 bf         asl $bf,x
$13:f7d5  a3 d2         lda $d2,s
$13:f7d7  48            pha
$13:f7d8  86 11         stx $11
$13:f7da  22 f6 0c 20   jsl $200cf6
$13:f7de  78            sei
$13:f7df  03 c0         ora $c0,s
$13:f7e1  a0 84         ldy #$84
$13:f7e3  f8            sed
$13:f7e4  71 b0         adc ($b0),y
$13:f7e6  cb            wai
$13:f7e7  10 58         bpl $f841
$13:f7e9  45 87         eor $87
$13:f7eb  c7 14         cmp [$14]
$13:f7ed  0f 02 fe 66   ora $66fe02
$13:f7f1  13 19         ora ($19,s),y
$13:f7f3  93 b4         sta ($b4,s),y
$13:f7f5  19 f2 d2      ora $d2f2,y
$13:f7f8  06 90         asl $90
$13:f7fa  48            pha
$13:f7fb  64 52         stz $52
$13:f7fd  49 2b         eor #$2b
$13:f7ff  7c 9b e5      jmp ($e59b,x)
$13:f802  ad c6 1f      lda $1fc6
$13:f805  43 1e         eor $1e,s
$13:f807  05 09         ora $09
$13:f809  04 ce         tsb $ce
$13:f80b  6d 4f 80      adc $804f
$13:f80e  3e 89 df      rol $df89,x
$13:f811  e0 0f         cpx #$0f
$13:f813  08            php
$13:f814  93 98         sta ($98,s),y
$13:f816  26 73         rol $73
$13:f818  60            rts
$13:f819  4a            lsr a
$13:f81a  60            rts
$13:f81b  42 05         wdm #$05
$13:f81d  bf 99 01 9f   lda $9f0199,x
$13:f821  06 10         asl $10
$13:f823  a8            tay
$13:f824  86 03         stx $03
$13:f826  02 7d         cop #$7d
$13:f828  0b            phd
$13:f829  35 9c         and $9c,x
$13:f82b  26 f0         rol $f0
$13:f82d  ec 16 08      cpx $0816
$13:f830  fa            plx
$13:f831  16 eb         asl $eb,x
$13:f833  78            sei
$13:f834  4d ea 90      eor $90ea
$13:f837  18            clc
$13:f838  08            php
$13:f839  c4 04         cpy $04
$13:f83b  32 4c         and ($4c)
$13:f83d  0c 06 f7      tsb $f706
$13:f840  7c 80 1c      jmp ($1c80,x)
$13:f843  be 98 ac      ldx $ac98,y
$13:f846  d8            cld
$13:f847  1c 27 47      trb $4727
$13:f84a  a4 90         ldy $90
$13:f84c  0d 78 15      ora $1578
$13:f84f  64 ed         stz $ed
$13:f851  20 c2 33      jsr $33c2
$13:f854  01 98         ora ($98,x)
$13:f856  18            clc
$13:f857  40            rti
$13:f858  2a            rol a
$13:f859  cb            wai
$13:f85a  64 72         stz $72
$13:f85c  3c 27 1b      bit $1b27,x
$13:f85f  0c b0 05      tsb $05b0
$13:f862  23 43         and $43,s
$13:f864  bf 70 4f 1c   lda $1c4f70,x
$13:f868  51 44         eor ($44),y
$13:f86a  16 1f         asl $1f,x
$13:f86c  18            clc
$13:f86d  95 6a         sta $6a,x
$13:f86f  b0 19         bcs $f88a
$13:f871  5c c4 6a 12   jml $126ac4
$13:f875  09 83         ora #$83
$13:f877  3c 48 e9      bit $e948,x
$13:f87a  12 89         ora ($89)
$13:f87c  48            pha
$13:f87d  1b            tcs
$13:f87e  ea            nop
$13:f87f  27 38         and [$38]
$13:f881  7c 62 32      jmp ($3262,x)
$13:f884  0a            asl a
$13:f885  1a            inc a
$13:f886  75 1e         adc $1e,x
$13:f888  9b            txy
$13:f889  38            sec
$13:f88a  b4 f8         ldy $f8,x
$13:f88c  e2 f6         sep #$f6
$13:f88e  9a            txs
$13:f88f  9f 5f 05 58   sta $58055f,x
$13:f893  80 bb         bra $f850
$13:f895  d6 91         dec $91,x
$13:f897  49 a5         eor #$a5
$13:f899  4f a0 a6 d0   eor $d0a6a0
$13:f89d  80 d5         bra $f874
$13:f89f  1d eb 38      ora $38eb,x
$13:f8a2  9c ce a8      stz $a8ce
$13:f8a5  72 a3         adc ($a3)
$13:f8a7  60            rts
$13:f8a8  d5 81         cmp $81,x
$13:f8aa  ec 09 0a      cpx $0a09
$13:f8ad  cc 06 1b      cpy $1b06
$13:f8b0  57 06         eor [$06],y
$13:f8b2  bc e4 32      ldy $32e4,x
$13:f8b5  00 d0         brk #$d0
$13:f8b7  66 07         ror $07
$13:f8b9  f5 fc         sbc $fc,x
$13:f8bb  d3 e8         cmp ($e8,s),y
$13:f8bd  40            rti
$13:f8be  70 6a         bvs $f92a
$13:f8c0  f0 a8         beq $f86a
$13:f8c2  0d 65 fe      ora $fe65
$13:f8c5  d4 42         pei ($42)
$13:f8c7  39 07 42      and $4207,y
$13:f8ca  aa            tax
$13:f8cb  0f 62 b0 c0   ora $c0b062
$13:f8cf  e0 60         cpx #$60
$13:f8d1  d0 7f         bne $f952
$13:f8d3  31 94         and ($94),y
$13:f8d5  69 34         adc #$34
$13:f8d7  93 40         sta ($40,s),y
$13:f8d9  c2 5d         rep #$5d
$13:f8db  eb            xba
$13:f8dc  a7 3a         lda [$3a]
$13:f8de  89 dc         bit #$dc
$13:f8e0  a9 32         lda #$32
$13:f8e2  07 81         ora [$81]
$13:f8e4  e9 72         sbc #$72
$13:f8e6  fb            xce
$13:f8e7  e4 b9         cpx $b9
$13:f8e9  6f 52 e1 25   adc $25e152
$13:f8ed  78            sei
$13:f8ee  1d a3 5b      ora $5ba3,x
$13:f8f1  d5 53         cmp $53,x
$13:f8f3  8d c3 06      sta $06c3
$13:f8f6  a7 09         lda [$09]
$13:f8f8  3a            dec a
$13:f8f9  81 71         sta ($71,x)
$13:f8fb  58            cli
$13:f8fc  dc 76 37      jml [$3776]
$13:f8ff  fa            plx
$13:f900  b8            clv
$13:f901  1a            inc a
$13:f902  02 c2         cop #$c2
$13:f904  71 d8         adc ($d8),y
$13:f906  16 60         asl $60,x
$13:f908  44 92 07      mvp $07,$92
$13:f90b  69 df         adc #$df
$13:f90d  fd b4 fe      sbc $feb4,x
$13:f910  bd 3f db      lda $db3f,x
$13:f913  03 83         ora $83,s
$13:f915  c1 c6         cmp ($c6,x)
$13:f917  52 07         eor ($07)
$13:f919  6a            ror a
$13:f91a  d6 fd         dec $fd,x
$13:f91c  b7 fe         lda [$fe],y
$13:f91e  c6 b0         dec $b0
$13:f920  60            rts
$13:f921  56 e0         lsr $e0,x
$13:f923  2c 08 59      bit $5908
$13:f926  28            plp
$13:f927  2b            pld
$13:f928  35 8c         and $8c,x
$13:f92a  16 b7         asl $b7,x
$13:f92c  e9 f4         sbc #$f4
$13:f92e  d6 f8         dec $f8,x
$13:f930  e7 a1         sbc [$a1]
$13:f932  50 aa         bvc $f8de
$13:f934  c3 20         cmp $20,s
$13:f936  31 08         and ($08),y
$13:f938  90 0c         bcc $f946
$13:f93a  22 7b f7 c0   jsl $c0f77b
$13:f93e  6f e9 34 a4   adc $a434e9
$13:f942  40            rti
$13:f943  0e 86 1f      asl $1f86
$13:f946  18            clc
$13:f947  8c 85 01      sty $0185
$13:f94a  ee 4f c1      inc $c14f
$13:f94d  9c 16 c0      stz $c016
$13:f950  22 11 b8 34   jsl $34b811
$13:f954  0a            asl a
$13:f955  0e f7 2a      asl $2af7
$13:f958  04 f1         tsb $f1
$13:f95a  f8            sed
$13:f95b  04 a0         tsb $a0
$13:f95d  10 8c         bpl $f8eb
$13:f95f  22 03 09 7b   jsl $7b0903
$13:f963  90 0c         bcc $f971
$13:f965  28            plp
$13:f966  33 d2         and ($d2,s),y
$13:f968  c8            iny
$13:f969  40            rti
$13:f96a  61 d1         adc ($d1,x)
$13:f96c  da            phx
$13:f96d  8e 26 a2      stx $a226
$13:f970  07 20         ora [$20]
$13:f972  a0 46 a7      ldy #$a746
$13:f975  f0 18         beq $f98f
$13:f977  1c 0e 03      trb $030e
$13:f97a  50 8f         bvc $f90b
$13:f97c  62 63 cf      per $c8e2
$13:f97f  72 83         adc ($83)
$13:f981  41 e3         eor ($e3,x)
$13:f983  93 f8         sta ($f8,s),y
$13:f985  4d 14 f6      eor $f614
$13:f988  30 18         bmi $f9a2
$13:f98a  14 3d         trb $3d
$13:f98c  ee 50 88      inc $8850
$13:f98f  49 74         eor #$74
$13:f991  28            plp
$13:f992  b4 a4         ldy $a4,x
$13:f994  58            cli
$13:f995  18            clc
$13:f996  46 2a         lsr $2a
$13:f998  f7 2a         sbc [$2a],y
$13:f99a  8d 46 3f      sta $3f46
$13:f99d  3f 06 0c e0   and $e00c06,x
$13:f9a1  e2 08         sep #$08
$13:f9a3  40            rti
$13:f9a4  03 89         ora $89,s
$13:f9a6  e8            inx
$13:f9a7  4d e1 be      eor $bee1
$13:f9aa  df 6f 51 e0   cmp $e0516f,x
$13:f9ae  92 1c         sta ($1c)
$13:f9b0  0b            phd
$13:f9b1  e0 74 e6      cpx #$e674
$13:f9b4  f0 9c         beq $f952
$13:f9b6  75 6e         adc $6e,x
$13:f9b8  18            clc
$13:f9b9  3e aa 88      rol $88aa,x
$13:f9bc  6c 98 3f      jmp ($3f98)
$13:f9bf  af d7 6b 97   lda $976bd7
$13:f9c3  d3 07         cmp ($07,s),y
$13:f9c5  43 1d         eor $1d,s
$13:f9c7  8d 57 b6      sta $b657
$13:f9ca  3f 5f ad 0e   and $0ead5f,x
$13:f9ce  0e 05 7e      asl $7e05
$13:f9d1  b8            clv
$13:f9d2  a5 80         lda $80
$13:f9d4  62 d7 65      per $5fae
$13:f9d7  83 67         sta $67,s
$13:f9d9  a3 19         lda $19,s
$13:f9db  d6 6a         dec $6a,x
$13:f9dd  c6 71         dec $71
$13:f9df  11 c7         ora ($c7),y
$13:f9e1  1d e9 2b      ora $2be9,x
$13:f9e4  96 49         stx $49,y
$13:f9e6  64 18         stz $18
$13:f9e8  01 98         ora ($98,x)
$13:f9ea  55 4d         eor $4d,x
$13:f9ec  80 32         bra $fa20
$13:f9ee  1a            inc a
$13:f9ef  a4 12         ldy $12
$13:f9f1  39 58 7d      and $7d58,y
$13:f9f4  8e 04 86      stx $8604
$13:f9f7  51 f2         eor ($f2),y
$13:f9f9  10 47         bpl $fa42
$13:f9fb  60            rts
$13:f9fc  a0 90 80      ldy #$8090
$13:f9ff  d6 65         dec $65,x
$13:fa01  72 dc         adc ($dc)
$13:fa03  09 4c         ora #$4c
$13:fa05  aa            tax
$13:fa06  55 6a         eor $6a,x
$13:fa08  84 6c         sty $6c
$13:fa0a  30 35         bmi $fa41
$13:fa0c  52 00         eor ($00)
$13:fa0e  4a            lsr a
$13:fa0f  f0 31         beq $fa42
$13:fa11  08            php
$13:fa12  90 c4         bcc $f9d8
$13:fa14  22 3f d8 98   jsl $98d83f
$13:fa18  9c aa 90      stz $90aa
$13:fa1b  11 d8         ora ($d8),y
$13:fa1d  60            rts
$13:fa1e  61 f1         adc ($f1,x)
$13:fa20  88            dey
$13:fa21  cc 66 34      cpy $3466
$13:fa24  40            rti
$13:fa25  08            php
$13:fa26  c0 60 87      cpy #$8760
$13:fa29  81 55         sta ($55,x)
$13:fa2b  1f 83 d8 1e   ora $1ed883,x
$13:fa2f  67 01         adc [$01]
$13:fa31  04 85         tsb $85
$13:fa33  5c 9a 10 c2   jml $c2109a
$13:fa37  78            sei
$13:fa38  c2 00         rep #$00
$13:fa3a  67 03         adc [$03]
$13:fa3c  01 84         ora ($84,x)
$13:fa3e  06 ad         asl $ad
$13:fa40  57 ac         eor [$ac],y
$13:fa42  e0 82 a0      cpx #$a082
$13:fa45  8b            phb
$13:fa46  00 a0         brk #$a0
$13:fa48  a2 c0 e6      ldx #$e6c0
$13:fa4b  02 c0         cop #$c0
$13:fa4d  35 84         and $84,x
$13:fa4f  ba            tsx
$13:fa50  0a            asl a
$13:fa51  20 01 18      jsr $1801
$13:fa54  40            rti
$13:fa55  50 22         bvc $fa79
$13:fa57  23 0a         and $0a,s
$13:fa59  c9 30         cmp #$30
$13:fa5b  64 d0         stz $d0
$13:fa5d  8a            txa
$13:fa5e  bc 06 06      ldy $0606,x
$13:fa61  93 21         sta ($21,s),y
$13:fa63  60            rts
$13:fa64  0a            asl a
$13:fa65  c2 a8         rep #$a8
$13:fa67  6c 09 84      jmp ($8409)
$13:fa6a  b8            clv
$13:fa6b  c4 12         cpy $12
$13:fa6d  f9 8a 90      sbc $908a,y
$13:fa70  14 00         trb $00
$13:fa72  93 08         sta ($08,s),y
$13:fa74  6d 58 58      adc $5858
$13:fa77  12 09         ora ($09)
$13:fa79  82 90 26      brl $210c
$13:fa7c  52 05         eor ($05)
$13:fa7e  a0 2c 05      ldy #$052c
$13:fa81  4e 50 99      lsr $9950
$13:fa84  6b            rtl
$13:fa85  f4 18 2c      pea $2c18
$13:fa88  b0 15         bcs $fa9f
$13:fa8a  20 07 41      jsr $4107
$13:fa8d  81 0c         sta ($0c,x)
$13:fa8f  12 80         ora ($80)
$13:fa91  c2 64         rep #$64
$13:fa93  eb            xba
$13:fa94  41 90         eor ($90,x)
$13:fa96  c8            iny
$13:fa97  a4 72         ldy $72
$13:fa99  39 23 01      and $0123,y
$13:fa9c  a4 32         ldy $32
$13:fa9e  99 54 11      sta $1154,y
$13:faa1  c2 4e         rep #$4e
$13:faa3  b8            clv
$13:faa4  aa            tax
$13:faa5  33 e1         and ($e1,s),y
$13:faa7  d4 08         pei ($08)
$13:faa9  f0 ac         beq $fa57
$13:faab  8f 41 ea eb   sta $ebea41
$13:faaf  f0 4f         beq $fb00
$13:fab1  84 16         sty $16
$13:fab3  21 dc         and ($dc,x)
$13:fab5  02 b8         cop #$b8
$13:fab7  14 24         trb $24
$13:fab9  72 89         adc ($89)
$13:fabb  54 3b c9      mvn $c9,$3b
$13:fabe  0c 02 b1      tsb $b102
$13:fac1  ec 52 20      cpx $2052
$13:fac4  14 04         trb $04
$13:fac6  68            pla
$13:fac7  0b            phd
$13:fac8  c6 46         dec $46
$13:faca  ea            nop
$13:facb  15 60         ora $60,x
$13:facd  c0 51 a1      cpy #$a151
$13:fad0  01 36         ora ($36,x)
$13:fad2  04 32         tsb $32
$13:fad4  03 58         ora $58,s
$13:fad6  02 94         cop #$94
$13:fad8  04 48         tsb $48
$13:fada  05 51         ora $51
$13:fadc  28            plp
$13:fadd  88            dey
$13:fade  90 11         bcc $faf1
$13:fae0  60            rts
$13:fae1  05 18         ora $18
$13:fae3  08            php
$13:fae4  d0 0a         bne $faf0
$13:fae6  a1 01         lda ($01,x)
$13:fae8  fe 94 00      inc $0094,x
$13:faeb  e0 30 1a      cpx #$1a30
$13:faee  a8            tay
$13:faef  58            cli
$13:faf0  0c 84 7b      tsb $7b84
$13:faf3  02 80         cop #$80
$13:faf5  a0 45 3a      ldy #$3a45
$13:faf8  01 60         ora ($60,x)
$13:fafa  80 aa         bra $faa6
$13:fafc  41 0a         eor ($0a,x)
$13:fafe  46 a0         lsr $a0
$13:fb00  27 94         and [$94]
$13:fb02  05 c0         ora $c0
$13:fb04  10 99         bpl $fa9f
$13:fb06  7a            ply
$13:fb07  e8            inx
$13:fb08  82 80 7a      brl $758b
$13:fb0b  14 d8         trb $d8
$13:fb0d  cb            wai
$13:fb0e  e6 4a         inc $4a
$13:fb10  d0 65         bne $fb77
$13:fb12  0a            asl a
$13:fb13  84 77         sty $77
$13:fb15  90 38         bcc $fb4f
$13:fb17  ae d1 58      ldx $58d1
$13:fb1a  3a            dec a
$13:fb1b  59 93 e0      eor $e093,y
$13:fb1e  96 23         stx $23,y
$13:fb20  b1 dc         lda ($dc),y
$13:fb22  ee b6 53      inc $53b6
$13:fb25  15 f8         ora $f8,x
$13:fb27  58            cli
$13:fb28  1f 0d b0 64   ora $64b00d,x
$13:fb2c  06 cc         asl $cc
$13:fb2e  38            sec
$13:fb2f  16 06         asl $06,x
$13:fb31  76 b3         ror $b3,x
$13:fb33  62 67 36      per $319d
$13:fb36  a7 c0         lda [$c0]
$13:fb38  20 10 f8      jsr $f810
$13:fb3b  df ed df b0   cmp $b0dfed,x
$13:fb3f  87 7d         sta [$7d]
$13:fb41  c3 a3         cmp $a3,s
$13:fb43  b5 17         lda $17,x
$13:fb45  7d c0 ea      adc $eac0,x
$13:fb48  11 e7         ora ($e7),y
$13:fb4a  7d 8e 84      adc $848e,x
$13:fb4d  5f e4 0f 28   eor $280fe4,x
$13:fb51  f9 8b ce      sbc $ce8b,y
$13:fb54  7e 84 9d      ror $9d84,x
$13:fb57  38            sec
$13:fb58  0c 53 e4      tsb $e453
$13:fb5b  87 6c         sta [$6c]
$13:fb5d  be f9 60      ldx $60f9,y
$13:fb60  19 7d 34      ora $347d,y
$13:fb63  81 0c         sta ($0c,x)
$13:fb65  fa            plx
$13:fb66  de 2b 00      dec $002b,x
$13:fb69  35 ab         and $ab,x
$13:fb6b  50 5b         bvc $fbc8
$13:fb6d  46 33         lsr $33
$13:fb6f  1d 8b 61      ora $618b,x
$13:fb72  fb            xce
$13:fb73  52 60         eor ($60)
$13:fb75  41 a0         eor ($a0,x)
$13:fb77  a7 51         lda [$51]
$13:fb79  e9 b6 8d      sbc #$8db6
$13:fb7c  6f db 5b ec   adc $ec5bdb
$13:fb80  7b            tdc
$13:fb81  06 07         asl $07
$13:fb83  15 8b         ora $8b,x
$13:fb85  81 bc         sta ($bc,x)
$13:fb87  36 a2         rol $a2,x
$13:fb89  f0 4d         beq $fbd8
$13:fb8b  fb            xce
$13:fb8c  dd 71 b1      cmp $b171,x
$13:fb8f  e7 81         sbc [$81]
$13:fb91  da            phx
$13:fb92  5e c1 bf      lsr $bfc1,x
$13:fb95  f6 05         inc $05,x
$13:fb97  80 38         bra $fbd1
$13:fb99  28            plp
$13:fb9a  a1 79         lda ($79,x)
$13:fb9c  0d a9 ec      ora $eca9
$13:fb9f  c2 e5         rep #$e5
$13:fba1  7a            ply
$13:fba2  b2 c0         lda ($c0)
$13:fba4  07 ea         ora [$ea]
$13:fba6  16 01         asl $01,x
$13:fba8  41 6b         eor ($6b,x)
$13:fbaa  7a            ply
$13:fbab  3d 21 fd      and $fd21,x
$13:fbae  eb            xba
$13:fbaf  6d 16 81      adc $8116
$13:fbb2  7a            ply
$13:fbb3  09 44 d0      ora #$d044
$13:fbb6  7c 6c 30      jmp ($306c,x)
$13:fbb9  be f5 b1      ldx $b1f5,y
$13:fbbc  73 72         adc ($72,s),y
$13:fbbe  85 43         sta $43
$13:fbc0  fa            plx
$13:fbc1  28            plp
$13:fbc2  2d fd 2a      and $2afd
$13:fbc5  70 3f         bvs $fc06
$13:fbc7  7d 7f b3      adc $b37f,x
$13:fbca  5e f7 09      lsr $09f7,x
$13:fbcd  c2 7a         rep #$7a
$13:fbcf  30 7e         bmi $fc4f
$13:fbd1  cc 1a ae      cpy $ae1a
$13:fbd4  04 a0         tsb $a0
$13:fbd6  fd 0f 6e      sbc $6e0f,x
$13:fbd9  33 1e         and ($1e,s),y
$13:fbdb  ac 7b 56      ldy $567b
$13:fbde  fc 3a 18      jsr ($183a,x)
$13:fbe1  ec 6e 3f      cpx $3f6e
$13:fbe4  7f 3d 4f 3b   adc $3b4f3d,x
$13:fbe8  f4 30 2c      pea $2c30
$13:fbeb  a1 4e         lda ($4e,x)
$13:fbed  85 db         sta $db
$13:fbef  19 8e c5      ora $c58e,y
$13:fbf2  bb            tyx
$13:fbf3  c3 1e         cmp $1e,s
$13:fbf5  0c 0b 35      tsb $350b
$13:fbf8  9f 16 ac 19   sta $19ac16,x
$13:fbfc  c5 df         cmp $df
$13:fbfe  19 fd c5      ora $c5fd,y
$13:fc01  bf c1 ea 36   lda $36eac1,x
$13:fc05  eb            xba
$13:fc06  7e 2d f6      ror $f62d,x
$13:fc09  4d 90 07      eor $0790
$13:fc0c  93 d4         sta ($d4,s),y
$13:fc0e  42 00         wdm #$00
$13:fc10  0a            asl a
$13:fc11  f0 df         beq $fbf2
$13:fc13  bf 07 7d be   lda $be7d07,x
$13:fc17  c0 8f c0      cpy #$c08f
$13:fc1a  7e b9 7d      ror $7db9,x
$13:fc1d  34 e2         bit $e2,x
$13:fc1f  73 d1         adc ($d1,s),y
$13:fc21  e9 61 09      sbc #$0961
$13:fc24  e0 4f 1e      cpx #$1e4f
$13:fc27  81 3c         sta ($3c,x)
$13:fc29  3a            dec a
$13:fc2a  1a            inc a
$13:fc2b  f2 68         sbc ($68)
$13:fc2d  50 ad         bvc $fbdc
$13:fc2f  16 8c         asl $8c,x
$13:fc31  21 7c         and ($7c,x)
$13:fc33  0b            phd
$13:fc34  ed 38 9f      sbc $9f38
$13:fc37  42 38         wdm #$38
$13:fc39  d8            cld
$13:fc3a  6c 21 bc      jmp ($bc21)
$13:fc3d  0d ed 38      ora $38ed
$13:fc40  a4 51         ldy $51
$13:fc42  2d 16 9d      and $9d16
$13:fc45  3c 5c be      bit $be5c,x
$13:fc48  16 9f         asl $9f,x
$13:fc4a  1a            inc a
$13:fc4b  08            php
$13:fc4c  b4 f3         ldy $f3,x
$13:fc4e  d2 e8         cmp ($e8)
$13:fc50  4e 34 b9      lsr $b934
$13:fc53  72 38         adc ($38)
$13:fc55  6f 48 e2 94   adc $94e248
$13:fc59  12 58         ora ($58)
$13:fc5b  50 a5         bvc $fc02
$13:fc5d  53 85         eor ($85,s),y
$13:fc5f  a8            tay
$13:fc60  75 6e         adc $6e,x
$13:fc62  18            clc
$13:fc63  3e aa 88      rol $88aa,x
$13:fc66  ae 18 1b      ldx $1b18
$13:fc69  5a            phy
$13:fc6a  b0 0b         bcs $fc77
$13:fc6c  e1 ad         sbc ($ad,x)
$13:fc6e  6b            rtl
$13:fc6f  90 7c         bcc $fced
$13:fc71  bf b9 65 d8   lda $d865b9,x
$13:fc75  a7 c7         lda [$c7]
$13:fc77  15 81         ora $81,x
$13:fc79  78            sei
$13:fc7a  83 a4         sta $a4,s
$13:fc7c  70 38         bvs $fcb6
$13:fc7e  fe 53 2c      inc $2c53,x
$13:fc81  67 16         adc [$16]
$13:fc83  9d fe 2b      sta $2bfe,x
$13:fc86  06 33         asl $33
$13:fc88  0c 18 80      tsb $8018
$13:fc8b  30 63         bmi $fcf0
$13:fc8d  50 56         bvc $fce5
$13:fc8f  0c e2 d4      tsb $d4e2
$13:fc92  b1 7c         lda ($7c),y
$13:fc94  7e ff 88      ror $88ff,x
$13:fc97  ec 08 24      cpx $2408
$13:fc9a  be 65 20      ldx $2065,y
$13:fc9d  90 48         bcc $fce7
$13:fc9f  65 32         adc $32
$13:fca1  a8            tay
$13:fca2  0d 66 57      ora $5766
$13:fca5  2d 91 c9      and $c991
$13:fca8  24 b2         bit $b2
$13:fcaa  08            php
$13:fcab  4c 9d e4      jmp $e49d
$13:fcae  75 5a         adc $5a,x
$13:fcb0  bc 04 10      ldy $1004,x
$13:fcb3  15 47         ora $47,x
$13:fcb5  c8            iny
$13:fcb6  49 1e 05      eor #$051e
$13:fcb9  26 84         rol $84
$13:fcbb  02 82         cop #$82
$13:fcbd  21 dc         and ($dc,x)
$13:fcbf  80 d5         bra $fc96
$13:fcc1  aa            tax
$13:fcc2  a0 80 95      ldy #$9580
$13:fcc5  bc 46 41      ldy $4146,x
$13:fcc8  30 97         bmi $fc61
$13:fcca  41 60         eor ($60,x)
$13:fccc  30 ef         bmi $fcbd
$13:fcce  20 20 41      jsr $4120
$13:fcd1  02 20         cop #$20
$13:fcd3  10 88         bpl $fc5d
$13:fcd5  89 40 10      bit #$1040
$13:fcd8  01 71         ora ($71,x)
$13:fcda  04 05         tsb $05
$13:fcdc  64 40         stz $40
$13:fcde  32 19         and ($19)
$13:fce0  1c a1 ec      trb $eca1
$13:fce3  10 ba         bpl $fc9f
$13:fce5  a8            tay
$13:fce6  9d 1e 48      sta $481e,x
$13:fce9  0a            asl a
$13:fcea  08            php
$13:fceb  54 36 16      mvn $16,$36
$13:fcee  08            php
$13:fcef  2a            rol a
$13:fcf0  a8            tay
$13:fcf1  c9 2a d0      cmp #$d02a
$13:fcf4  b8            clv
$13:fcf5  61 94         adc ($94,x)
$13:fcf7  03 63         ora $63,s
$13:fcf9  56 86         lsr $86,x
$13:fcfb  84 4c         sty $4c
$13:fcfd  12 26         ora ($26)
$13:fcff  31 03         and ($03),y
$13:fd01  90 b8         bcc $fcbb
$13:fd03  44 61 08      mvp $08,$61
$13:fd06  ac 8a 50      ldy $508a
$13:fd09  10 15         bpl $fd20
$13:fd0b  81 71         sta ($71,x)
$13:fd0d  20 47 79      jsr $7947
$13:fd10  03 8a         ora $8a,s
$13:fd12  ed 20 60      sbc $6020
$13:fd15  81 81         sta ($81,x)
$13:fd17  c0 c5 e5      cpy #$e5c5
$13:fd1a  30 98         bmi $fcb4
$13:fd1c  ec 77 3b      cpx $3b77
$13:fd1f  ad 92 08      lda $0892
$13:fd22  20 70 99      jsr $9970
$13:fd25  7c c4 5e      jmp ($5ec4,x)
$13:fd28  72 0d         adc ($0d)
$13:fd2a  82 98 36      brl $33c5
$13:fd2d  6a            ror a
$13:fd2e  30 5d         bmi $fd8d
$13:fd30  00 7c         brk #$7c
$13:fd32  96 2c         stx $2c,y
$13:fd34  be 51 79      ldx $7951,y
$13:fd37  ee 14 c1      inc $c114
$13:fd3a  bb            tyx
$13:fd3b  64 cc         stz $cc
$13:fd3d  87 81         sta [$81]
$13:fd3f  c1 e1         cmp ($e1,x)
$13:fd41  70 df         bvs $fd22
$13:fd43  a0 de 59      ldy #$59de
$13:fd46  14 91         trb $91
$13:fd48  d2 2c         cmp ($2c)
$13:fd4a  55 b0         eor $b0,x
$13:fd4c  c9 64 24      cmp #$2464
$13:fd4f  40            rti
$13:fd50  95 cb         sta $cb,x
$13:fd52  5d 20 d5      eor $d520,x
$13:fd55  5b            tcd
$13:fd56  14 b4         trb $b4
$13:fd58  88            dey
$13:fd59  28            plp
$13:fd5a  c0 93 b9      cpy #$b993
$13:fd5d  1a            inc a
$13:fd5e  c0 73 0a      cpy #$0a73
$13:fd61  ac 43 00      ldy $0043
$13:fd64  03 00         ora $00,s
$13:fd66  81 00         sta ($00,x)
$13:fd68  c8            iny
$13:fd69  3c 07 60      bit $6007,x
$13:fd6c  87 e0         sta [$e0]
$13:fd6e  4f 46 55 00   eor $005546
$13:fd72  18            clc
$13:fd73  e9 7f a7      sbc #$a77f
$13:fd76  30 19         bmi $fd91
$13:fd78  01 a8         ora ($a8,x)
$13:fd7a  0b            phd
$13:fd7b  a1 01         lda ($01,x)
$13:fd7d  ab            plb
$13:fd7e  d5 a0         cmp $a0,x
$13:fd80  30 49         bmi $fdcb
$13:fd82  3d 88 e6      and $e688,x
$13:fd85  23 20         and $20,s
$13:fd87  39 84 32      and $3284,y
$13:fd8a  1a            inc a
$13:fd8b  86 28         stx $28
$13:fd8d  4d 96 c1      eor $c196
$13:fd90  55 aa         eor $aa,x
$13:fd92  d5 0a         cmp $0a,x
$13:fd94  43 54         eor $54,s
$13:fd96  85 d5         sta $d5
$13:fd98  c7 e3         cmp [$e3]
$13:fd9a  04 97         tsb $97
$13:fd9c  cc ac 15      cpy $15ac
$13:fd9f  61 a0         adc ($a0,x)
$13:fda1  10 84         bpl $fd27
$13:fda3  de 22 00      dec $0022,x
$13:fda6  25 8b         and $8b
$13:fda8  f4 09 ea      pea $ea09
$13:fdab  4f 13 78 1e   eor $1e7813
$13:fdaf  c6 61         dec $61
$13:fdb1  03 81         ora $81,s
$13:fdb3  94 49         sty $49,x
$13:fdb5  1e 15 92      asl $9215,x
$13:fdb8  28            plp
$13:fdb9  80 ca         bra $fd85
$13:fdbb  63 2e         adc $2e,s
$13:fdbd  84 45         sty $45
$13:fdbf  7c 70 99      jmp ($9970,x)
$13:fdc2  7a            ply
$13:fdc3  80 11         bra $fdd6
$13:fdc5  01 0d         ora ($0d,x)
$13:fdc7  4d 1c c2      eor $c21c
$13:fdca  62 b1 19      per $177e
$13:fdcd  94 c1         sty $c1,x
$13:fdcf  40            rti
$13:fdd0  09 50 37      ora #$3750
$13:fdd3  80 0c         bra $fde1
$13:fdd5  1b            tcs
$13:fdd6  2c b0 15      bit $15b0
$13:fdd9  30 93         bmi $fd6e
$13:fddb  c1 7e         cmp ($7e,x)
$13:fddd  cc 42 5b      cpy $5b42
$13:fde0  93 3e         sta ($3e,s),y
$13:fde2  55 e7         eor $e7,x
$13:fde4  bf c6 63 b1   lda $b163c6,x
$13:fde8  7b            tdc
$13:fde9  f0 d8         beq $fdc3
$13:fdeb  cc e6 d4      cpy $d4e6
$13:fdee  f8            sed
$13:fdef  03 e8         ora $e8,s
$13:fdf1  b5 af         lda $af,x
$13:fdf3  01 d6         ora ($d6,x)
$13:fdf5  cc 9e ba      cpy $ba9e
$13:fdf8  e8            inx
$13:fdf9  10 3f         bpl $fe3a
$13:fdfb  be 17 2f      ldx $2f17,y
$13:fdfe  a6 c7         ldx $c7
$13:fe00  69 45 e0      adc #$e045
$13:fe03  f5 8d         sbc $8d,x
$13:fe05  7f 4f 13 d4   adc $d4134f,x
$13:fe09  d7 81         cmp [$81],y
$13:fe0b  27 09         and [$09]
$13:fe0d  60            rts
$13:fe0e  c4 d8         cpy $d8
$13:fe10  30 81         bmi $fd93
$13:fe12  49 c2 71      eor #$71c2
$13:fe15  b1 38         lda ($38),y
$13:fe17  62 9d 78      per $76b7
$13:fe1a  e2 98         sep #$98
$13:fe1c  9b            txy
$13:fe1d  0f 8d e9 2b   ora $2be98d
$13:fe21  40            rti
$13:fe22  c4 ac         cpy $ac
$13:fe24  00 09         brk #$09
$13:fe26  32 19         and ($19)
$13:fe28  1e 26 46      asl $4626,x
$13:fe2b  f4 13 33      pea $3313
$13:fe2e  c9 a0 b0      cmp #$b0a0
$13:fe31  19 5d 01      ora $015d,y
$13:fe34  e9 34 39      sbc #$3934
$13:fe37  55 52         eor $52,x
$13:fe39  21 80         and ($80,x)
$13:fe3b  93 bd         sta ($bd,s),y
$13:fe3d  62 b3 01      per $fff3
$13:fe40  ab            plb
$13:fe41  43 b0         eor $b0,s
$13:fe43  4b            phk
$13:fe44  49 81 b3      eor #$b381
$13:fe47  c2 13         rep #$13
$13:fe49  2f 42 4c c5   and $c54c42
$13:fe4d  be 28 41      ldx $4128,y
$13:fe50  33 39         and ($39,s),y
$13:fe52  a8            tay
$13:fe53  69 d4 7a      adc #$7ad4
$13:fe56  6d a3 5b      adc $5ba3
$13:fe59  8a            txa
$13:fe5a  c5 e0         cmp $e0
$13:fe5c  f1 98         sbc ($98),y
$13:fe5e  fd 6c e2      sbc $e26c,x
$13:fe61  70 ef         bvs $fe52
$13:fe63  7c 6e 3b      jmp ($3b6e,x)
$13:fe66  1a            inc a
$13:fe67  fb            xce
$13:fe68  81 90         sta ($90,x)
$13:fe6a  6f 86 03 be   adc $be0386
$13:fe6e  17 83         ora [$83],y
$13:fe70  f9 6d 5a      sbc $5a6d,y
$13:fe73  fe 89 00      inc $0089,x
$13:fe76  7a            ply
$13:fe77  5a            phy
$13:fe78  fa            plx
$13:fe79  53 f9         eor ($f9,s),y
$13:fe7b  b0 96         bcs $fe13
$13:fe7d  8b            phb
$13:fe7e  46 24         lsr $24
$13:fe80  6e 18 47      ror $4718
$13:fe83  eb            xba
$13:fe84  e1 38         sbc ($38,x)
$13:fe86  d8            cld
$13:fe87  7c 4e 14      jmp ($144e,x)
$13:fe8a  c4 0f         cpy $0f
$13:fe8c  d6 b4         dec $b4,x
$13:fe8e  f8            sed
$13:fe8f  e2 e3         sep #$e3
$13:fe91  81 2a         sta ($2a,x)
$13:fe93  84 f6         sty $f6
$13:fe95  72 ef         adc ($ef)
$13:fe97  4a            lsr a
$13:fe98  45 26         eor $26
$13:fe9a  94 38         sty $38,x
$13:fe9c  09 c1         ora #$c1
$13:fe9e  94 67         sty $67,x
$13:fea0  ce f4 7e      dec $7ef4
$13:fea3  84 e6         sty $e6
$13:fea5  a7 89         lda [$89]
$13:fea7  9e 4f 4e      stz $4e4f,x
$13:feaa  c1 42         cmp ($42,x)
$13:feac  37 b4         and [$b4],y
$13:feae  f9 40 53      sbc $5340,y
$13:feb1  b5 78         lda $78,x
$13:feb3  1b            tcs
$13:feb4  d4 fa         pei ($fa)
$13:feb6  12 aa         ora ($aa)
$13:feb8  bd 5a 03      lda $035a,x
$13:febb  01 aa         ora ($aa,x)
$13:febd  55 4d         eor $4d,x
$13:febf  eb            xba
$13:fec0  3e 84 26      rol $2684,x
$13:fec3  c1 36         cmp ($36,x)
$13:fec5  15 9a         ora $9a,x
$13:fec7  b5 5c         lda $5c,x
$13:fec9  de b4 8a      dec $8ab4,x
$13:fecc  24 22         bit $22
$13:fece  b2 cf         lda ($cf)
$13:fed0  05 40         ora $40
$13:fed2  9b            txy
$13:fed3  d9 6c 34      cmp $346c,y
$13:fed6  55 b8         eor $b8,x
$13:fed8  2e 80 de      rol $de80
$13:fedb  c6 a2         dec $a2
$13:fedd  32 85         and ($85)
$13:fedf  26 88         rol $88
$13:fee1  cf 77 2a 52   cmp $522a77
$13:fee5  27 00         and [$00]
$13:fee7  52 c7         eor ($c7)
$13:fee9  e0 5e 80      cpx #$805e
$13:feec  09 2e         ora #$2e
$13:feee  3b            tsc
$13:feef  f0 1d         beq $ff0e
$13:fef1  e9 83         sbc #$83
$13:fef3  fb            xce
$13:fef4  60            rts
$13:fef5  de 43 ad      dec $ad43,x
$13:fef8  83 40         sta $40,s
$13:fefa  a0 53 8d      ldy #$8d53
$13:fefd  2e 5f 7d      rol $7d5f
$13:ff00  be d3 63      ldx $63d3,y
$13:ff03  71 d8         adc ($d8),y
$13:ff05  bd 28 48      lda $4828,x
$13:ff08  32 fa         and ($fa)
$13:ff0a  64 e8         stz $e8
$13:ff0c  4e 2d 5a      lsr $5a2d
$13:ff0f  fe 87 47      inc $4787,x
$13:ff12  a7 88         lda [$88]
$13:ff14  bf e2 3a 9d   lda $9d3ae2,x
$13:ff18  2e 86 be      rol $be86
$13:ff1b  0b            phd
$13:ff1c  56 ab         lsr $ab,x
$13:ff1e  5a            phy
$13:ff1f  08            php
$13:ff20  a1 69         lda ($69,x)
$13:ff22  a9 eb         lda #$eb
$13:ff24  b1 03         lda ($03),y
$13:ff26  50 d7         bvc $feff
$13:ff28  75 ba         adc $ba,x
$13:ff2a  f8            sed
$13:ff2b  48            pha
$13:ff2c  2d 66 a8      and $a866
$13:ff2f  77 0c         adc [$0c],y
$13:ff31  27 1b         and [$1b]
$13:ff33  0c 34 32      tsb $3234
$13:ff36  10 61         bpl $ff99
$13:ff38  19 81 56      ora $5681,y
$13:ff3b  a1 5e         lda ($5e,x)
$13:ff3d  30 95         bmi $fed4
$13:ff3f  fa            plx
$13:ff40  f8            sed
$13:ff41  d0 ca         bne $ff0d
$13:ff43  41 84         eor ($84,x)
$13:ff45  8f 57 20 b0   sta $b02057
$13:ff49  5a            phy
$13:ff4a  c6 0b         dec $0b
$13:ff4c  01 80         ora ($80,x)
$13:ff4e  c0 8d 47      cpy #$478d
$13:ff51  02 62         cop #$62
$13:ff53  0c 15 42      tsb $4215
$13:ff56  37 08         and [$08],y
$13:ff58  95 40         sta $40,x
$13:ff5a  61 d8         adc ($d8,x)
$13:ff5c  23 90         and $90,s
$13:ff5e  77 60         adc [$60],y
$13:ff60  fe 53 90      inc $9053,x
$13:ff63  c0 6b 11      cpy #$116b
$13:ff66  d8            cld
$13:ff67  f4 06 aa      pea $aa06
$13:ff6a  a8            tay
$13:ff6b  14 d0         trb $d0
$13:ff6d  20 01 3a      jsr $3a01
$13:ff70  0a            asl a
$13:ff71  81 a8         sta ($a8,x)
$13:ff73  1f 82 ac 88   ora $88ac82,x
$13:ff77  2a            rol a
$13:ff78  ca            dex
$13:ff79  08            php
$13:ff7a  6a            ror a
$13:ff7b  f0 15         beq $ff92
$13:ff7d  d0 42         bne $ffc1
$13:ff7f  68            pla
$13:ff80  bf da a2 60   lda $60a2da,x
$13:ff84  2a            rol a
$13:ff85  88            dey
$13:ff86  11 40         ora ($40),y
$13:ff88  8a            txa
$13:ff89  74 1b         stz $1b,x
$13:ff8b  81 4a         sta ($4a,x)
$13:ff8d  4b            phk
$13:ff8e  92 68         sta ($68)
$13:ff90  4f 60 a9 1a   eor $1aa960
$13:ff94  53 54         eor ($54,s),y
$13:ff96  52 a0         eor ($a0)
$13:ff98  9b            txy
$13:ff99  2a            rol a
$13:ff9a  21 30         and ($30,x)
$13:ff9c  17 29         ora [$29],y
$13:ff9e  38            sec
$13:ff9f  84 2a         sty $2a
$13:ffa1  8e 90 ac      stx $ac90
$13:ffa4  05 68         ora $68
$13:ffa6  32 ca         and ($ca)
$13:ffa8  70 d7         bvs $ff81
$13:ffaa  67 33         adc [$33]
$13:ffac  00 fa         brk #$fa
$13:ffae  10 1b         bpl $ffcb
$13:ffb0  11 3b         ora ($3b),y
$13:ffb2  11 7b         ora ($7b),y
$13:ffb4  11 9c         ora ($9c),y
$13:ffb6  11 bc         ora ($bc),y
$13:ffb8  11 dc         ora ($dc),y
$13:ffba  11 1d         ora ($1d),y
$13:ffbc  12 3d         ora ($3d)
$13:ffbe  12 5d         ora ($5d)
$13:ffc0  12 7e         ora ($7e)
$13:ffc2  12 be         ora ($be)
$13:ffc4  12 de         ora ($de)
$13:ffc6  12 ff         ora ($ff)
$13:ffc8  12 1f         ora ($1f)
$13:ffca  13 5f         ora ($5f,s),y
$13:ffcc  13 4a         ora ($4a,s),y
$13:ffce  29 4a         and #$4a
$13:ffd0  29 4a         and #$4a
$13:ffd2  29 4a         and #$4a
$13:ffd4  29 4a         and #$4a
$13:ffd6  29 4a         and #$4a
$13:ffd8  29 4a         and #$4a
$13:ffda  29 4a         and #$4a
$13:ffdc  29 4a         and #$4a
$13:ffde  29 4a         and #$4a
$13:ffe0  29 ff         and #$ff
$13:ffe2  7f 00 00 08   adc $080000,x
$13:ffe6  00 4d         brk #$4d
$13:ffe8  00 b4         brk #$b4
$13:ffea  08            php
$13:ffeb  da            phx
$13:ffec  10 e0         bpl $ffce
$13:ffee  4f 2a f9 9b   eor $9bf92a
$13:fff2  ce fe 88      dec $88fe
$13:fff5  f4 cf aa      pea $aacf
$13:fff8  bd 76 40      lda $4076,x
$13:fffb  00 e0         brk #$e0
$13:fffd  78            sei
$13:fffe  1c 00 00      trb $0000
